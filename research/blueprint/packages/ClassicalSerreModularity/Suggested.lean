import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import Mathlib.Algebra.Group.End
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Algebra.Ring.Parity
import Mathlib.Analysis.Complex.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Nat.MaxPrimeFac
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
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
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.GroupTheory.Subgroup.Simple
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Regular.RegularSequence
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

This file is not the roadmap and is not exhaustive; the roadmap README is definitive. It
supplies the mathematical target signatures, construction APIs and definition tests, with
supplier adapters where needed. These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. The targets are proved by `sorry`; only arithmetic and matrix examples carry proofs,
and nothing here is claimed to be formalised.

The file imports Mathlib and Tau Ceti's pinned newform API. Bundled forms below wrap
`HeckeRing.GL2.Newform`; only their unavailable attached Galois representations and the
interfaces owned by neighbouring roadmaps use data-valued `sorry` stand-ins. Each stand-in
names its owner. Conditions on those objects are expressed by equations, dimensions, local
invariants or explicitly typed supplier structures; none is an unspecified `Prop` field.

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

/-- The existing normalised newform carrier, bundled over its positive level and natural weight. -/
structure Newform where
  level : ℕ
  level_ne_zero : NeZero level
  weight : ℕ
  form : @HeckeRing.GL2.Newform level level_ne_zero (weight : ℤ)

namespace Newform

/-- Fourier coefficients of the existing carrier. -/
def coeff (f : Newform) (n : ℕ) : ℂ :=
  letI := f.level_ne_zero
  (UpperHalfPlane.qExpansion 1 f.form.toCuspForm).coeff n

/-- The nebentypus is the existing zero extension from units. -/
def character (f : Newform) : DirichletCharacter ℂ f.level :=
  letI := f.level_ne_zero
  MulChar.ofUnitHom f.form.χ

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

/-- Weight-one normalised newforms, using the same pinned analytic carrier. -/
structure WeightOneNewform where
  level : ℕ
  level_ne_zero : NeZero level
  form : @HeckeRing.GL2.Newform level level_ne_zero 1

namespace WeightOneNewform

/-- The existing nebentypus, extended by zero. -/
def character (f : WeightOneNewform) : DirichletCharacter ℂ f.level :=
  letI := f.level_ne_zero
  MulChar.ofUnitHom f.form.χ

/-- Fourier coefficients of the existing cusp form, with width one. -/
def coeff (f : WeightOneNewform) (n : ℕ) : ℂ :=
  letI := f.level_ne_zero
  (UpperHalfPlane.qExpansion 1 f.form.toCuspForm).coeff n

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
isomorphism there are finitely many S-type representations unramified outside `p`. The full
semisimple statement, including sums of characters, is `finite_level_one_semisimple` below. -/
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
Lemma 6.3(i)): the non-solvability component. The full conclusion and propagation are
`good_dihedral_large_image` and `good_dihedral_preserved` below. -/
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
to the Artin conductor, the reduction is unramified at `ℓ` and has the same conductor. The
realisation, lattice independence, weights, character and density are stated in the Artin section
below (`artin_realisation`, `artin_reduction_invariants`, `artin_frobenius_density`). -/
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

/-- Invariants of the cyclic group generated by A, computed as ker(A−1). -/
def matrixInvariants {K : Type*} [Field K] (A : Matrix (Fin 2) (Fin 2) K) :=
  LinearMap.ker (Matrix.toLin' (A - 1))

/-- `adapted_lattice_nonsplit` and `residual_depends_on_lattice`: modulo `π`, `D₁ ≡ (1 0; 1 1) ≠ 1`
and `F₁ ≡ diag(1, −1)`, so the reduction of `L₁` is a non-split extension with one-dimensional
inertia invariants. -/
example : D₁.red = !![1, 0; 1, 1] ∧ F₁.red = !![1, 0; 0, -1] ∧ D₁.red ≠ 1 ∧
    (D₁.red - 1) * (D₁.red - 1) = 0 ∧
    Module.finrank (ZMod 3) (matrixInvariants D₁.red) = 1 ∧
    Module.finrank (ZMod 3) (matrixInvariants D₀.red) = 2 := by
  sorry

/-- `standard_lattice_nonexample`: the standard lattice reduces to the trivial inertia action,
with two-dimensional invariants, so it cannot realise a ramified `ρ̄₃|_{I₂}`; `L₁` does. -/
example : D₀.red = 1 ∧ D₀.red ≠ D₁.red ∧
    Module.finrank (ZMod 3) (matrixInvariants D₀.red) = 2 := by sorry

/-- `split_case_standard_lattice`: modulo `π`, `F₀² = 1` and `F₀ ≠ ±1`, so its eigenvalues are `1`
and `−1 = 2 = χ̄₃(Frob₂)`; `L₀` realises `γ ⊗ (η ⊕ 1)`. -/
example : F₀.red * F₀.red = 1 ∧ F₀.red ≠ 1 ∧ F₀.red ≠ -1 ∧ (2 : ZMod 3) = -1 := by decide

/-- Both lattices have Frobenius trace `0`: `tr F₀ = 0` and `tr F₁ = 1 − 1 = 0`. -/
example : F₀.e00.add F₀.e11 = e0 ∧ F₁.e00.add F₁.e11 = e0 := by decide

end TauCeti.SerreConjecture.DP

/-! ## Supplier adapters used by the remaining targets

These are interfaces to R01, R07–R08 and R24, rather than new owners of local Galois groups,
period rings, induction or compatible systems. The data-valued stand-ins identify the invariant
being imported. Their predicates below have mathematical bodies. A member includes an integral
model and a residue embedding; changing that model changes the reduction, not its semisimplification.
-/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField
namespace ImportedInterfaces

/-- R01.1: isomorphism of matrix representations, including the chosen coefficient field. -/
def RepIso {G K : Type*} [Group G] [Field K] (ρ τ : G →* GL (Fin 2) K) : Prop :=
  ∃ B : GL (Fin 2) K, ∀ g, ρ g = B * τ g * B⁻¹

/-- R01.1: a full free stable lattice, specified by its basis in the generic representation.
The basis columns span its underlying O-submodule; invertibility gives full generic span. -/
structure StableLattice {G O K : Type*} [Group G] [CommRing O] [Field K] [Algebra O K]
    (ρ : G →* GL (Fin 2) K) where
  basis : GL (Fin 2) K
  action : G →* GL (Fin 2) O
  intertwines : ∀ g, ρ g * basis = basis * Matrix.GeneralLinearGroup.map (algebraMap O K) (action g)

/-- R01.1: semisimplification on the same two-dimensional carrier (well-defined up to RepIso). -/
def semisimplification {G K : Type*} [Group G] [Field K]
    (ρ : G →* GL (Fin 2) K) : G →* GL (Fin 2) K := sorry

/-- R01.2: the valuation topology on the integral closure in a finite extension of Q_p.
This adapter uses the unique extension of the p-adic valuation; it is not a chosen topology. -/
abbrev coefficientTopology (p : ℕ) [Fact p.Prime] (K : Type*) [Field K]
    [Algebra (Padic p) K] [FiniteDimensional (Padic p) K] [Algebra (PadicInt p) K] :
    TopologicalSpace (integralClosure (PadicInt p) K) := sorry

/-- R01/R24: one integral p-adic member over the integers of a finite extension of Q_p.
The field/topology/finite-extension identifications are supplied by R01.2; O is not a free
coefficient variable standing for an arbitrary ring in the theorem statements. -/
structure Member where
  p : ℕ
  prime : Fact p.Prime
  O : Type
  ring : CommRing O
  domain : IsDomain O
  dvr : IsDiscreteValuationRing O
  charZero : CharZero O
  topology : TopologicalSpace O
  topologicalRing : IsTopologicalRing O
  residueChar : CharP (IsLocalRing.ResidueField O) p
  residueAlgebra : Algebra (ZMod p) (IsLocalRing.ResidueField O)
  finiteResidue : FiniteDimensional (ZMod p) (IsLocalRing.ResidueField O)
  padicAlgebra : Algebra (Padic p) (FractionRing O)
  finitePadic : FiniteDimensional (Padic p) (FractionRing O)
  padicIntAlgebra : Algebra (PadicInt p) (FractionRing O)
  integers : O ≃+* integralClosure (PadicInt p) (FractionRing O)
  integersCompatibility : ∀ x, (integers x : FractionRing O) = algebraMap O (FractionRing O) x
  algebraCompatibility : ∀ x : PadicInt p,
    algebraMap (PadicInt p) (FractionRing O) x = algebraMap (Padic p) (FractionRing O) (x : Padic p)
  topologyCompatibility : topology = TopologicalSpace.induced integers
    (coefficientTopology p (FractionRing O))
  residueEmbedding : IsLocalRing.ResidueField O →+* FpBar p
  rho : GQ →* GL (Fin 2) O
  continuous : Continuous rho

attribute [instance] Member.prime Member.ring Member.domain Member.dvr Member.charZero
  Member.topology Member.topologicalRing Member.residueChar Member.residueAlgebra Member.finiteResidue Member.padicAlgebra Member.finitePadic Member.padicIntAlgebra

namespace Member
abbrev generic (m : Member) := genericRep m.rho
abbrev residual (m : Member) :=
  (Matrix.GeneralLinearGroup.map m.residueEmbedding).comp (residualRep m.rho)

/-- R07.3: Hodge–Tate numbers, counted with multiplicity. -/
def hodgeWeights (m : Member) : Multiset ℤ := sorry
/-- R07.3: dimension over the coefficient field of D_dR(V). -/
def deRhamRank (m : Member) : ℕ := sorry
/-- R07.3: dimension of D_cris(V), with the usual coefficient-field normalisation. -/
def crystallineRank (m : Member) : ℕ := sorry
/-- R07.3: dimension of D_pcris(V), over the maximal unramified coefficient extension. -/
def potentiallyCrystallineRank (m : Member) : ℕ := sorry

def IsDeRham (m : Member) : Prop := m.deRhamRank = 2
def IsCrystalline (m : Member) : Prop := m.crystallineRank = 2
def IsPotentiallyCrystalline (m : Member) : Prop := m.potentiallyCrystallineRank = 2
def HasWeight (m : Member) (k : ℕ) : Prop := m.hodgeWeights = {0, (k : ℤ) - 1}
def RamifiedInside (m : Member) (S : Finset ℕ) : Prop :=
  ∀ r, r.Prime → r ≠ m.p → r ∉ S → IsUnramifiedAt m.generic r

/-- Modularity in terms of the existing form and the Frobenius characteristic polynomials.
The embedding of the coefficient field need not be continuous. -/
def ArisesFrom (m : Member) (f : Newform) : Prop :=
  ∃ ι : FractionRing m.O →+* ℂ,
    ∃ S : Finset ℕ, ∀ r, r.Prime → r ≠ m.p → r ∉ S → ∀ σ, IsFrobAt σ r →
      ι (Matrix.trace (m.generic σ : Matrix (Fin 2) (Fin 2) (FractionRing m.O))) =
        f.coeff r ∧
      ι (Matrix.det (m.generic σ : Matrix (Fin 2) (Fin 2) (FractionRing m.O))) =
        f.character (r : ZMod f.level) * (r : ℂ) ^ (f.weight - 1)
def IsModular (m : Member) : Prop := ∃ f : Newform, 2 ≤ f.weight ∧ m.ArisesFrom f
end Member

/-- R01.2: conjugation on inertia by the arithmetic Frobenius in the chosen local frame. -/
def inertiaFrobeniusConjugation (r : ℕ) : MulAut (inertiaAt r) := sorry

/-- R01.3: a local Weil–Deligne parameter in the arithmetic-Frobenius convention.
Finite inertia, Frobenius and monodromy are retained; F N F⁻¹ = r N fixes the convention. -/
structure WDParameter (K : Type*) [Field K] (r : ℕ) where
  inertia : inertiaAt r →* GL (Fin 2) K
  finiteInertia : Finite inertia.range
  frobenius : GL (Fin 2) K
  conjugates : ∀ g, frobenius * inertia g * frobenius⁻¹ =
    inertia (inertiaFrobeniusConjugation r g)
  monodromy : Matrix (Fin 2) (Fin 2) K
  nilpotent : monodromy * monodromy = 0
  frobeniusMonodromy : (frobenius : Matrix (Fin 2) (Fin 2) K) * monodromy =
    (r : K) • (monodromy * (frobenius : Matrix (Fin 2) (Fin 2) K))
  commutes : ∀ g, (inertia g : Matrix (Fin 2) (Fin 2) K) * monodromy =
    monodromy * (inertia g : Matrix (Fin 2) (Fin 2) K)

/-- R01.3/R07: WD(V|D_r), including at the coefficient prime for potentially semistable V. -/
def wd (m : Member) (r : ℕ) : WDParameter (FractionRing m.O) r := sorry
/-- R01.3: coefficient extension of the inertia parameter and monodromy. -/
def WDParameter.map {K L : Type*} [Field K] [Field L] {r : ℕ}
    (W : WDParameter K r) (f : K →+* L) : WDParameter L r := sorry

/-- R01.3: Frobenius semisimplification, preserving inertia and monodromy. -/
def WDParameter.frobeniusSS {K : Type*} [Field K] {r : ℕ}
    (W : WDParameter K r) : WDParameter K r := sorry

def WDParameter.Isomorphic {K : Type*} [Field K] {r : ℕ}
    (W V : WDParameter K r) : Prop :=
  ∃ B : GL (Fin 2) K, (∀ g, W.inertia g = B * V.inertia g * B⁻¹) ∧
    W.frobenius = B * V.frobenius * B⁻¹ ∧
    W.monodromy = (B : Matrix (Fin 2) (Fin 2) K) * V.monodromy *
      (B⁻¹ : Matrix (Fin 2) (Fin 2) K)

/-- R24.5–R24.6: rational almost strictly compatible systems, indexed by coefficient places.
The unramified odd coefficient-prime clause includes reducible reductions. At a ramified
coefficient prime the WD comparison is imposed only for irreducible residual members. -/
structure CompatibleSystem where
  E : Type
  field : Field E
  numberField : NumberField E
  S : Finset ℕ
  weights : Multiset ℤ
  member : IsDedekindDomain.HeightOneSpectrum (𝓞 E) → Member
  coefficient : ∀ v, E →+* FractionRing (member v).O
  integralCoefficient : ∀ v, 𝓞 E →+* (member v).O
  integralCompatibility : ∀ v x,
    algebraMap (member v).O (FractionRing (member v).O) (integralCoefficient v x) =
      coefficient v (x : E)
  placeKernel : ∀ v, RingHom.ker ((IsLocalRing.residue (member v).O).comp (integralCoefficient v)) = v.asIdeal
  placeAbove : ∀ v, ((member v).p : 𝓞 E) ∈ v.asIdeal
  allPrimes : ∀ p, p.Prime → ∃ v, (member v).p = p
  trace : ℕ → E
  determinant : ℕ → E
  parameter : ∀ r, WDParameter E r
  hodge : ∀ v, (member v).hodgeWeights = weights
  deRham : ∀ v, (member v).IsDeRham
  odd : ∀ v, IsOdd (member v).generic
  irreducible : ∀ v, IsIrreducible (member v).generic
  ramification : ∀ v, (member v).RamifiedInside S
  frobenius : ∀ v r, r.Prime → r ≠ (member v).p → r ∉ S → ∀ σ, IsFrobAt σ r →
    Matrix.trace ((member v).generic σ : Matrix (Fin 2) (Fin 2) (FractionRing (member v).O)) =
      coefficient v (trace r) ∧
    Matrix.det ((member v).generic σ : Matrix (Fin 2) (Fin 2) (FractionRing (member v).O)) =
      coefficient v (determinant r)
  wdCompatibility : ∀ v r, r.Prime →
    (r ≠ (member v).p ∨ IsIrreducible (member v).residual ∨ (r ≠ 2 ∧ r ∉ S)) →
      ((wd (member v) r).frobeniusSS).Isomorphic
        (((parameter r).map (coefficient v)).frobeniusSS)
  crystalline : ∀ v, (member v).p ∉ S →
    ((member v).p ≠ 2 ∨ IsIrreducible (member v).residual) → (member v).IsCrystalline

attribute [instance] CompatibleSystem.field CompatibleSystem.numberField
namespace CompatibleSystem
abbrev Place (s : CompatibleSystem) := IsDedekindDomain.HeightOneSpectrum (𝓞 s.E)
def HasWeight (s : CompatibleSystem) (k : ℕ) : Prop := s.weights = {0, (k : ℤ) - 1}
def IsModular (s : CompatibleSystem) : Prop :=
  ∃ (f : Newform) (ι : s.E →+* ℂ), 2 ≤ f.weight ∧
    ∀ r, r.Prime → r ∉ s.S → ¬ r ∣ f.level →
      ι (s.trace r) = f.coeff r ∧
      ι (s.determinant r) = f.character (r : ZMod f.level) * (r : ℂ) ^ (f.weight - 1)
/-- All residual coefficient fields at p have degree one (p splits completely). -/
def SplitAt (s : CompatibleSystem) (p : ℕ) : Prop :=
  ∀ v : s.Place, (s.member v).p = p →
    Module.finrank (ZMod (s.member v).p) (IsLocalRing.ResidueField (s.member v).O) = 1
end CompatibleSystem

/-- R24.6: two systems are linked at an identified residue characteristic and an actual
isomorphism of their chosen semisimplified reductions. -/
def Linked (s t : CompatibleSystem) (p : ℕ) : Prop :=
  ∃ (v : s.Place) (w : t.Place) (_h : (s.member v).p = (t.member w).p),
    (s.member v).p = p ∧
    ∃ B : GL (Fin 2) (FpBar (t.member w).p),
      HEq (semisimplification (s.member v).residual)
        ((MulAut.conj B).toMonoidHom.comp (semisimplification (t.member w).residual))

/-- R01.4: the quadratic subgroup corresponding to Q(sqrt((-1)^((p-1)/2)*p)). -/
def quadraticSubgroup (p : ℕ) : Subgroup GQ := sorry
def IsBadDihedral {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  IsIrreducible ρ ∧ ¬ IsIrreducible (ρ.comp (quadraticSubgroup p).subtype)

/-- R01.4: scalar quotient of the matrix image. -/
def projectiveImage {G K : Type*} [Group G] [Field K] (ρ : G →* GL (Fin 2) K) : Type := sorry
instance {G K : Type*} [Group G] [Field K] (ρ : G →* GL (Fin 2) K) : Group (projectiveImage ρ) := sorry

/-- R07.4/R15.4: finite-flat model of the specified residual local representation after
restriction to a finite extension of ramification index e. The carrier includes the group
scheme, its coefficient action and its generic-fibre identification, supplied by R07.4. -/
def FiniteFlatModel {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) (e : ℕ) : Type := sorry
/-- R01.4: the mod-p cyclotomic character on G_Q. -/
def cyclotomic {p : ℕ} [Fact p.Prime] : GQ →* (FpBar p)ˣ := sorry

/-- R01.2 local decomposition group at r, realised inside G_Q. -/
def decompositionAt (r : ℕ) : Subgroup GQ := sorry
/-- R07.3/R21: ordinary up to a Teichmüller twist, expressed by its invariant line and the
inertial cyclotomic quotient. The characters themselves belong to R01.4. -/
def teichmuller (m : Member) : GQ →* (FractionRing m.O)ˣ := sorry
def padicCyclotomic (m : Member) : GQ →* (FractionRing m.O)ˣ := sorry
def IsOrdinary (m : Member) : Prop :=
  ∃ (B : GL (Fin 2) (FractionRing m.O)) (a b : GQ →* (FractionRing m.O)ˣ) (i j : ℤ),
    (∀ g : decompositionAt m.p,
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 1 0 = 0) ∧
    ∀ g : inertiaAt m.p,
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 0 0 =
        a g * teichmuller m g ^ i * padicCyclotomic m g ∧
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 1 1 =
        b g * teichmuller m g ^ j ∧ a g = 1 ∧ b g = 1

end ImportedInterfaces
end TauCeti.SerreConjecture
end

/-! ## R33.2–R33.3: local characters, induction and the two lattices -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces
namespace DP

/-- R01.2, using Mathlib's absolute Galois group of Q_N. -/
abbrev LocalGalois (N : ℕ) [Fact N.Prime] := Field.absoluteGaloisGroup (Padic N)
/-- ClassFieldTheory/LocalFieldsRamification: the subgroup G_(Q_N²) of index two. -/
def unramifiedQuadratic (N : ℕ) [Fact N.Prime] : Subgroup (LocalGalois N) := sorry
/-- The local inertia subgroup, from LocalFieldsRamification (not a new local-group target). -/
def localInertia (N : ℕ) [Fact N.Prime] : Subgroup (LocalGalois N) := sorry
/-- The wild inertia subgroup, from LocalFieldsRamification. -/
def localWildInertia (N : ℕ) [Fact N.Prime] : Subgroup (LocalGalois N) := sorry
/-- A tame inertia lift and arithmetic Frobenius, from LocalFieldsRamification's tame frame. -/
def tameGenerator (N : ℕ) [Fact N.Prime] : LocalGalois N := sorry
def localFrobenius (N : ℕ) [Fact N.Prime] : LocalGalois N := sorry
/-- Art_(Q_N²)(N), equivalently the square of the chosen Frobenius in the abelian quotient. -/
def artinUniformizer (N : ℕ) [Fact N.Prime] : unramifiedQuadratic N := sorry
/-- Inclusion of I_N in G_(Q_N²), from the unramified quadratic extension. -/
def quadraticInertia (N : ℕ) [Fact N.Prime] : localInertia N →* unramifiedQuadratic N := sorry

/-- R01.2: the integers Z_q[ζ_q] and its chosen primitive root. -/
def CyclotomicIntegers (q : ℕ) [Fact q.Prime] : Type := sorry
instance (q : ℕ) [Fact q.Prime] : CommRing (CyclotomicIntegers q) := sorry
instance (q : ℕ) [Fact q.Prime] : IsDomain (CyclotomicIntegers q) := sorry
instance (q : ℕ) [Fact q.Prime] : IsDiscreteValuationRing (CyclotomicIntegers q) := sorry
instance (q : ℕ) [Fact q.Prime] : CharZero (CyclotomicIntegers q) := sorry
instance (q : ℕ) [Fact q.Prime] : CharP (IsLocalRing.ResidueField (CyclotomicIntegers q)) q := sorry
def zeta (q : ℕ) [Fact q.Prime] : (CyclotomicIntegers q)ˣ := sorry

/-- R01.2/ClassFieldTheory: the character through F_(N²)^×, trivial on the uniformizer.
The prime-to-N, odd order q divides N+1 and not N-1; these hypotheses select niveau two. -/
def levelTwoCharacter (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    unramifiedQuadratic N →* (CyclotomicIntegers q)ˣ := sorry

theorem levelTwoCharacter_orderOf (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    orderOf (levelTwoCharacter q N hodd hdiv hnot) = q ∧
    orderOf ((levelTwoCharacter q N hodd hdiv hnot).comp (quadraticInertia N)) = q ∧
    ¬ ∀ g : localInertia N,
      levelTwoCharacter q N hodd hdiv hnot (quadraticInertia N g) ^ N =
        levelTwoCharacter q N hodd hdiv hnot (quadraticInertia N g) := by sorry

theorem levelTwoCharacter_artin (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    levelTwoCharacter q N hodd hdiv hnot (artinUniformizer N) = 1 := by sorry

/-- Induction from the index-two subgroup, in the two coset basis (InductionRestriction).
This supplied map is integral because κ is unit valued. -/
def inducedQuadratic {R : Type*} [CommRing R] (N : ℕ) [Fact N.Prime]
    (κ : unramifiedQuadratic N →* Rˣ) : LocalGalois N →* GL (Fin 2) R := sorry

def dihedralType (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    LocalGalois N →* GL (Fin 2) (CyclotomicIntegers q) :=
  inducedQuadratic N (levelTwoCharacter q N hodd hdiv hnot)

/-- Reduction of the cyclotomic character in characteristic p. For p≠q this specialises the
common cyclotomic integer model, not a nonexistent map Z_q→F_p. R01.2/R24.6 own that model. -/
def reducedCharacter (q N p : ℕ) [Fact q.Prime] [Fact N.Prime] [Fact p.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    unramifiedQuadratic N →* (FpBar p)ˣ := sorry

theorem dihedralType_irreducible (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    IsIrreducible (genericRep (dihedralType q N hodd hdiv hnot)) ∧
    ∀ p, ∀ (_ : Fact p.Prime), p ≠ q →
      IsIrreducible (inducedQuadratic N (reducedCharacter q N p hodd hdiv hnot)) := by sorry

/-- The standard full stable lattice with the coset basis e₁,e₂. -/
def dihedralType.standardLattice (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    StableLattice (O := CyclotomicIntegers q)
      (genericRep (dihedralType q N hodd hdiv hnot)) := sorry

theorem dihedralType_standardLattice_basis (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    (dihedralType.standardLattice q N hodd hdiv hnot).basis = 1 ∧
    (dihedralType.standardLattice q N hodd hdiv hnot).action = dihedralType q N hodd hdiv hnot ∧
    (dihedralType q N hodd hdiv hnot (tameGenerator N) :
      Matrix (Fin 2) (Fin 2) (CyclotomicIntegers q)) = dihedralInertia (zeta q : CyclotomicIntegers q) N ∧
    (dihedralType q N hodd hdiv hnot (localFrobenius N) :
      Matrix (Fin 2) (Fin 2) (CyclotomicIntegers q)) = dihedralFrob (CyclotomicIntegers q) := by sorry

/-- 1⊕η, where η is the unramified quadratic character (kernel G_(Q_N²)). -/
def splitUnramified (N : ℕ) [Fact N.Prime] (k : Type*) [Field k] :
    LocalGalois N →* GL (Fin 2) k := sorry

theorem dihedralType_standardLattice_residual (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1) :
    RepIso (residualRep (dihedralType.standardLattice q N hodd hdiv hnot).action)
      (splitUnramified N (IsLocalRing.ResidueField (CyclotomicIntegers q))) ∧
    (localInertia N ≤ (residualRep (dihedralType.standardLattice q N hodd hdiv hnot).action).ker) ∧
    Matrix.trace (residualRep (dihedralType.standardLattice q N hodd hdiv hnot).action
      (localFrobenius N) : Matrix (Fin 2) (Fin 2) (IsLocalRing.ResidueField (CyclotomicIntegers q))) = 0 := by sorry

theorem dihedralType_residual_semisimplification (q N : ℕ) [Fact q.Prime] [Fact N.Prime]
    (hodd : Odd q) (hdiv : q ∣ N + 1) (hnot : ¬ q ∣ N - 1)
    (Λ : StableLattice (O := CyclotomicIntegers q)
      (genericRep (dihedralType q N hodd hdiv hnot))) :
    RepIso (semisimplification (residualRep Λ.action))
      (splitUnramified N (IsLocalRing.ResidueField (CyclotomicIntegers q))) := by sorry

/-- At (q,N)=(3,2), the normalized order-three niveau-two character. -/
def orderThreeCharacter : unramifiedQuadratic 2 →* (CyclotomicIntegers 3)ˣ :=
  levelTwoCharacter 3 2 (by decide) (by norm_num) (by norm_num)
def orderThreeType : LocalGalois 2 →* GL (Fin 2) (CyclotomicIntegers 3) :=
  inducedQuadratic 2 orderThreeCharacter

def orderThreeType.standardLattice :
    StableLattice (O := CyclotomicIntegers 3) (genericRep orderThreeType) :=
  dihedralType.standardLattice 3 2 (by decide) (by norm_num) (by norm_num)
/-- O(e₁+e₂)⊕O(ζ−1)e₂; the basis matrix P is invertible over Frac(O), not over O. -/
def orderThreeType.adaptedLattice :
    StableLattice (O := CyclotomicIntegers 3) (genericRep orderThreeType) := sorry

/-- The P,D₁,F₁ calculations above are the matrices of this full stable lattice. -/
theorem orderThreeType_adaptedLattice_basis :
    (orderThreeType.adaptedLattice.basis :
      Matrix (Fin 2) (Fin 2) (FractionRing (CyclotomicIntegers 3))) =
        !![1, 0; 1, (algebraMap (CyclotomicIntegers 3) (FractionRing (CyclotomicIntegers 3))
          (zeta 3 : CyclotomicIntegers 3)) - 1] ∧
    (orderThreeType.adaptedLattice.action (tameGenerator 2) :
      Matrix (Fin 2) (Fin 2) (CyclotomicIntegers 3)) =
        !![(zeta 3 : CyclotomicIntegers 3), 0; (zeta 3 : CyclotomicIntegers 3), (zeta 3 : CyclotomicIntegers 3)^2] ∧
    (orderThreeType.adaptedLattice.action (localFrobenius 2) :
      Matrix (Fin 2) (Fin 2) (CyclotomicIntegers 3)) = !![1, (zeta 3 : CyclotomicIntegers 3)-1; 0, -1] := by sorry

theorem orderThreeType_standardLattice_reduction :
    RepIso (residualRep orderThreeType.standardLattice.action)
      (splitUnramified 2 (IsLocalRing.ResidueField (CyclotomicIntegers 3))) ∧
    localInertia 2 ≤ (residualRep orderThreeType.standardLattice.action).ker := by sorry

/-- The nonsplit reduction has exactly the two matrices calculated above, in the adapted basis. -/
theorem orderThreeType_adaptedLattice_reduction :
    (residualRep orderThreeType.adaptedLattice.action (tameGenerator 2) :
      Matrix (Fin 2) (Fin 2) (IsLocalRing.ResidueField (CyclotomicIntegers 3))) = !![1, 0; 1, 1] ∧
    (residualRep orderThreeType.adaptedLattice.action (localFrobenius 2) :
      Matrix (Fin 2) (Fin 2) (IsLocalRing.ResidueField (CyclotomicIntegers 3))) = !![1, 0; 0, -1] ∧
    Module.finrank (IsLocalRing.ResidueField (CyclotomicIntegers 3))
      (fixedVectors (residualRep orderThreeType.adaptedLattice.action) (localInertia 2)) = 1 := by sorry

/-- R01.2: extension of a local representation to the chosen decomposition subgroup of G_Q. -/
def localRestriction (m : Member) (r : ℕ) [Fact r.Prime] :
    LocalGalois r →* GL (Fin 2) (FractionRing m.O) := sorry
/-- Residual local restriction, using the same chosen decomposition group. -/
def residualLocalRestriction (m : Member) (r : ℕ) [Fact r.Prime] :
    LocalGalois r →* GL (Fin 2) (FpBar m.p) := sorry

/-- The two possible Steinberg reductions at 2 in characteristic 3, after unramified twist.
This includes both split and ramified cases, and names the twist and coefficient embedding. -/
structure SteinbergReductionAtTwo (m : Member) where
  atThree : m.p = 3
  embed : IsLocalRing.ResidueField (CyclotomicIntegers 3) →+* FpBar m.p
  twist : LocalGalois 2 →* (FpBar m.p)ˣ
  unramifiedTwist : ∀ g : localInertia 2, twist g = 1
  ramified : Bool
  wildTrivial : ∀ g : localWildInertia 2, residualLocalRestriction m 2 g = 1
  normalForm : ∃ B : GL (Fin 2) (FpBar m.p),
    ((B⁻¹ * residualLocalRestriction m 2 (tameGenerator 2) * B : Matrix (Fin 2) (Fin 2) (FpBar m.p)) =
      if ramified then !![1, 0; 1, 1] else 1) ∧
    (B⁻¹ * residualLocalRestriction m 2 (localFrobenius 2) * B : Matrix (Fin 2) (Fin 2) (FpBar m.p)) =
      (twist (localFrobenius 2) : FpBar m.p) • !![1, 0; 0, -1]

/-- R01.1: tensor by a scalar character. -/
def twistRep {G k : Type*} [Group G] [Field k] (χ : G →* kˣ)
    (ρ : G →* GL (Fin 2) k) : G →* GL (Fin 2) k := sorry

theorem orderThreeType_exists_lattice_reduction_iso (m : Member)
    (h : SteinbergReductionAtTwo m) :
    ∃ Λ : StableLattice (O := CyclotomicIntegers 3) (genericRep orderThreeType),
      Λ = (if h.ramified then orderThreeType.adaptedLattice else orderThreeType.standardLattice) ∧
      RepIso (twistRep h.twist ((Matrix.GeneralLinearGroup.map h.embed).comp (residualRep Λ.action)))
        (residualLocalRestriction m 2) := by sorry

/-- Compatible means an actual stable-lattice reduction isomorphic on inertia, including the
unramified twist. This is the local hypothesis of DP Theorem 1.9(4), not just ss compatibility. -/
theorem orderThreeType_isCompatible (m : Member) (h : SteinbergReductionAtTwo m) :
    ∃ Λ : StableLattice (O := CyclotomicIntegers 3) (genericRep orderThreeType),
      RepIso ((twistRep h.twist ((Matrix.GeneralLinearGroup.map h.embed).comp
        (residualRep Λ.action))).comp (localInertia 2).subtype)
        ((residualLocalRestriction m 2).comp (localInertia 2).subtype) := by sorry

end DP
end TauCeti.SerreConjecture
end

/-! ## R27.1 and R33: insertion, modularity transfer and removal of ramification -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- A member lifts the specified residual representation, up to conjugacy and ss. -/
def ImportedInterfaces.Member.Lifts (m : Member) {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  ∃ (_h : m.p = p) (B : GL (Fin 2) (FpBar p)),
    HEq (semisimplification m.residual) ((MulAut.conj B).toMonoidHom.comp ρ)

namespace DP
/-- The inertial WD type κ⊕κ^N, with κ of order q and zero monodromy. The induced local representation interchanges the two characters; its scalar determinant need not have finite order. -/
def HasDihedralType (s : CompatibleSystem) (q N : ℕ) : Prop :=
  ∃ (κ : inertiaAt N →* s.Eˣ) (B : GL (Fin 2) s.E), orderOf κ = q ∧
    (∀ g, (B⁻¹ * (s.parameter N).inertia g * B : Matrix (Fin 2) (Fin 2) s.E) =
      !![(κ g : s.E), 0; 0, (κ g : s.E) ^ N]) ∧ (s.parameter N).monodromy = 0

/-- The Paso 2 datum; general prescribed lift existence stays with R24.3. -/
structure GoodDihedralInsertion (s : CompatibleSystem) where
  q : ℕ
  N : ℕ
  qPrime : Fact q.Prime
  NPrime : Fact N.Prime
  qGtFive : 5 < q
  qModFour : q % 4 = 1
  qLarge : ∀ r ∈ s.S, r < q
  split : s.SplitAt q
  newPrime : N ∉ s.S
  system : CompatibleSystem
  weightTwo : system.HasWeight 2
  ramification : system.S = insert N s.S
  link : Linked s system q
  localType : HasDihedralType system q N
  primeCongruences : N % 8 = 1 ∧ (∀ r, r.Prime → r < q → N % r = 1) ∧ N % q = q - 1
  modularity : s.IsModular ↔ system.IsModular

attribute [instance] GoodDihedralInsertion.qPrime GoodDihedralInsertion.NPrime

theorem GoodDihedralInsertion.type_at_N {s : CompatibleSystem} (d : GoodDihedralInsertion s) :
    HasDihedralType d.system d.q d.N := d.localType

theorem GoodDihedralInsertion.congruences {s : CompatibleSystem} (d : GoodDihedralInsertion s) :
    d.N % 8 = 1 ∧ (∀ r, r.Prime → r < d.q → d.N % r = 1) ∧ d.N % d.q = d.q - 1 :=
  d.primeCongruences

theorem GoodDihedralInsertion.modular_iff {s : CompatibleSystem} (d : GoodDihedralInsertion s) :
    s.IsModular ↔ d.system.IsModular := d.modularity

/-- R33.2/Paso 2. Either the solvable branch terminates or the insertion exists. -/
theorem exists_goodDihedralInsertion (s : CompatibleSystem) (hweight : s.HasWeight 2) :
    s.IsModular ∨ Nonempty (GoodDihedralInsertion s) := by sorry

/-- R33.1, DP 1.4: odd-prime lifting with regular de Rham weights and residual modularity.
Non-bad-dihedral plus residual irreducibility is the cyclotomic absolute-irreducibility condition. -/
theorem modularity_lifting_odd (m : Member) (hp : m.p ≠ 2) (k : ℕ) (hk : 2 ≤ k)
    (hdR : m.IsDeRham) (hweight : m.HasWeight k)
    (hodd : IsOdd m.generic) (hirr : IsIrreducible m.generic)
    (hfinite : ∃ S, m.RamifiedInside S) (hres : IsIrreducible m.residual)
    (hbad : ¬ IsBadDihedral m.residual) (hmod : IsModular m.residual) : m.IsModular := by sorry

/-- R33.1, DP 1.5: the dyadic transfer has the non-solvable residual hypothesis. -/
theorem modularity_lifting_two (m : Member) (hp : m.p = 2) (k : ℕ) (hk : 2 ≤ k)
    (hdR : m.IsDeRham) (hweight : m.HasWeight k) (hodd : IsOdd m.generic)
    (hirr : IsIrreducible m.generic) (hfinite : ∃ S, m.RamifiedInside S)
    (hlarge : ¬ Group.IsSolvable m.residual.range) (hmod : IsModular m.residual) :
    m.IsModular := by sorry

/-- R33.1, DP 1.6/Pan: no residual modularity or WD hypothesis is imposed in this branch. -/
theorem modularity_lifting_reducible (m : Member) (hp : 5 ≤ m.p) (k : ℕ) (hk : 2 ≤ k)
    (hdR : m.IsDeRham) (hweight : m.HasWeight k) (hodd : IsOdd m.generic)
    (hirr : IsIrreducible m.generic) (hfinite : ∃ S, m.RamifiedInside S)
    (hred : ¬ IsIrreducible m.residual) : m.IsModular := by sorry

/-- R32.5's finite-order twist completion of DP 1.7, in the terminal weights used here. -/
theorem modularity_lifting_three_terminal (m : Member) (hp : m.p = 3) (k : ℕ)
    (hk : k = 2 ∨ k = 4) (hcrys : m.IsCrystalline) (hweight : m.HasWeight k)
    (hodd : IsOdd m.generic) (hirr : IsIrreducible m.generic)
    (hunram : m.RamifiedInside ∅) (hred : ¬ IsIrreducible m.residual) : m.IsModular := by sorry

/-- R24.6/DP Remark 4: any one characteristic-zero member determines system modularity. -/
theorem modularity_member_iff (s : CompatibleSystem) (v : s.Place) :
    (s.member v).IsModular ↔ s.IsModular := by sorry

/-- R33.1/Fontaine–Laffaille. This is the representation statement behind p>2k. -/
theorem fontaineLaffaille_not_badDihedral (m : Member) (k : ℕ) (hk : 2 ≤ k)
    (hp : 2 * k < m.p) (hcrys : m.IsCrystalline) (hweight : m.HasWeight k)
    (hirr : IsIrreducible m.residual) :
    serreWeight m.residual = k ∧ ¬ IsBadDihedral m.residual := by sorry

/-- The weight comparison also covers reducible reductions; only the bad-dihedral
exclusion needs to distinguish irreducibility. -/
theorem fontaineLaffaille_weight (m : Member) (k : ℕ) (hk : 2 ≤ k)
    (hp : 2*k < m.p) (hcrys : m.IsCrystalline) (hweight : m.HasWeight k) :
    serreWeight m.residual = k := by sorry

/-- R33.1/solvable termination: reducible and irreducible solvable residuals have different inputs. -/
theorem solvable_residual_termination (m : Member) (hp : 5 ≤ m.p) (k : ℕ) (hk : 2 ≤ k)
    (hdR : m.IsDeRham) (hweight : m.HasWeight k) (hodd : IsOdd m.generic)
    (hirr : IsIrreducible m.generic) (hfinite : ∃ S, m.RamifiedInside S)
    (hsolv : Group.IsSolvable m.residual.range) (hbad : ¬ IsBadDihedral m.residual) :
    m.IsModular := by sorry

/-- R33.1/Paso 1: starts with the prescribed crystalline lift, then links at w>2k.
The new ramification set may contain w. -/
theorem paso_one {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hlarge : ¬ Group.IsSolvable ρ.range) (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (s : CompatibleSystem) (v : s.Place) (hlift : (s.member v).Lifts ρ)
    (hcrys : (s.member v).IsCrystalline) (hweight : s.HasWeight (serreWeight ρ)) :
    IsModular ρ ∨ ∃ (w : ℕ) (t : CompatibleSystem), w.Prime ∧ 2 * serreWeight ρ < w ∧
      w ∉ s.S ∧ t.HasWeight 2 ∧ t.S ⊆ insert w s.S ∧ Linked s t w ∧
      (IsModular ρ ↔ t.IsModular) := by sorry

/-- The control hypotheses kept during Pasos 3–4, not an assertion about any arbitrary type. -/
structure DihedralControl (s : CompatibleSystem) (q N : ℕ) (S₁ : Finset ℕ) where
  qPrime : Fact q.Prime
  NPrime : Fact N.Prime
  qGtFive : 5 < q
  qLarge : ∀ r ∈ S₁, r < q
  NNew : N ∉ S₁
  congruences : N % 8 = 1 ∧ (∀ r, r.Prime → r < q → N % r = 1) ∧ N % q = q - 1
  ramification : s.S ⊆ insert N (S₁ ∪ {2, 3})
  type : HasDihedralType s q N
  regular : ∃ k, 2 ≤ k ∧ s.HasWeight k


/-- R33.2/Lemma 2.1 includes the good-dihedral predicate, not just an order computation. -/
theorem lemma_two_one (s : CompatibleSystem) (q N : ℕ) (S₁ : Finset ℕ)
    (h : DihedralControl s q N S₁) (v : s.Place) (hp : (s.member v).p ∈ S₁ ∪ {2, 3}) :
    IsGoodDihedralRep (s.member v).residual ∧
      ¬ Group.IsSolvable (s.member v).residual.range := by sorry

/-- R33.2/Paso 3: no weight-two conclusion is imposed on the intermediate system. -/
theorem paso_three (s : CompatibleSystem) (q N : ℕ) (S₁ : Finset ℕ)
    (h : DihedralControl s q N S₁) :
    ∃ t : CompatibleSystem, t.S ⊆ {2, N} ∧ HasDihedralType t q N ∧
      (s.IsModular ↔ t.IsModular) := by sorry

/-- R33.3/Lemma 2.3: linked at 3, same weights/ramification, order-three type and zero N.
The Steinberg condition retains nonzero monodromy and trivial inertial WD representation. -/
theorem typeChangeAtTwo (s : CompatibleSystem) (hweight : s.HasWeight 2) (hthree : 3 ∉ s.S)
    (hsteinberg : (s.parameter 2).monodromy ≠ 0 ∧ ∀ g, (s.parameter 2).inertia g = 1)
    (hlarge : ∀ v : s.Place, (s.member v).p = 3 → ¬ Group.IsSolvable (s.member v).residual.range) :
    ∃ t : CompatibleSystem, t.HasWeight 2 ∧ t.S = s.S ∧ Linked s t 3 ∧
      HasDihedralType t 3 2 ∧ (s.IsModular ↔ t.IsModular) := by sorry

/-- R33.3/Remark 6: the odd-ramification finite-flat exclusion, applied to the changed type. -/
theorem remark_six (s : CompatibleSystem) (hweight : s.HasWeight 2)
    (htype : HasDihedralType s 3 2) (v : s.Place) (hp : (s.member v).p = 2)
    (hlarge : ¬ Group.IsSolvable (s.member v).residual.range) :
    Nonempty (FiniteFlatModel (s.member v).residual 3) ∧ serreWeight (s.member v).residual = 2 := by sorry

/-- R33.3/Paso 4: the direct weight-two branch and the Steinberg/type-change detour for
weight four both end here. Type at N survives; the resulting system has weight two. -/
theorem paso_four (s : CompatibleSystem) (q N : ℕ) (S₁ : Finset ℕ)
    (h : DihedralControl s q N S₁) (hram : s.S ⊆ {2, N}) :
    ∃ t : CompatibleSystem, t.S ⊆ {N} ∧ t.HasWeight 2 ∧ HasDihedralType t q N ∧
      (s.IsModular ↔ t.IsModular) := by sorry

/-- R33.3/Paso 5: reducible residuals terminate with Pan's de Rham theorem; the other
branch gives an empty ramification set. N≡1 mod8 rules out level-one bad dihedral. -/
theorem paso_five (s : CompatibleSystem) (N : ℕ) (hN : N.Prime) (hbig : 5 < N)
    (hcong : N % 8 = 1) (hweight : s.HasWeight 2) (hram : s.S ⊆ {N}) :
    s.IsModular ∨ ∃ (t : CompatibleSystem) (k : ℕ), 2 ≤ k ∧ t.S = ∅ ∧ t.HasWeight k ∧
      (s.IsModular ↔ t.IsModular) := by sorry

/-- R33.4/Paso 6: the named terminal system theorem, using Tate–Serre, R32.5's crystalline
weights 2/4 completion and R25.5's checked GL₂-type semistable weight-6/Schoof branch. -/
theorem terminal_five (s : CompatibleSystem) (k : ℕ) (hk : 2 ≤ k)
    (hweight : s.HasWeight k) (hram : s.S = ∅) :
    s.IsModular := by sorry

/-- R33.5: every unramified odd member of the specific weight-two dyadic lift system works;
its residual can be reducible. The existence of a suitable coefficient place is part of the result. -/
theorem auxiliary_odd_member (s : CompatibleSystem) (hweight : s.HasWeight 2)
    (v₂ : s.Place) (htwo : (s.member v₂).p = 2)
    (hlarge : ¬ Group.IsSolvable (s.member v₂).residual.range) :
    (∃ v : s.Place, 3 < (s.member v).p ∧ (s.member v).p ∉ s.S) ∧
    ∀ v : s.Place, 3 < (s.member v).p → (s.member v).p ∉ s.S →
      (s.member v).IsCrystalline ∧ (s.member v).HasWeight 2 ∧
      IsOdd (s.member v).generic ∧ IsIrreducible (s.member v).generic ∧
      (IsIrreducible (s.member v).residual →
        serreWeight (s.member v).residual = 2 ∧ ¬ IsBadDihedral (s.member v).residual) := by sorry

end DP
end TauCeti.SerreConjecture
end

/-! ## R26: the prescribed-lift application contracts -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- R24.3: the exact minimal local lift condition of KW §5, including its dyadic exceptional
induced case. The supplied carrier contains the inertial identification, not just an equality
of conductor exponents. -/
def MinimalModel (m : Member) (r : ℕ) : Type := sorry
def IsMinimalAway (m : Member) (T : Finset ℕ) : Prop :=
  ∀ r, r.Prime → r ∉ T → Nonempty (MinimalModel m r)
/-- R07.4/R24.3: a p-divisible group over Q_p(μ_p)'s integers whose rational Tate module is V. -/
def BarsottiTateOverCyclotomic (m : Member) : Type := sorry
/-- R01.4: the finite-order lift of det(ρ̄)χ̄_p^(1−k), not a freely chosen determinant. -/
def finiteDeterminant (m : Member) : GQ →* (FractionRing m.O)ˣ := sorry

/-- Ordinary residual shape in Serre's normalization. -/
def ResidualOrdinary {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  ∃ B : GL (Fin 2) (FpBar p), ∀ g : inertiaAt p,
    (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 1 0 = 0 ∧
    (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 0 0 =
      (cyclotomic (p := p) g : FpBar p) ^ (serreWeight ρ - 1) ∧
    (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 1 1 = 1

/-- R26.2/Proposition 2.1. The endpoint is semistable, rather than a falsely claimed BT lift. -/
theorem minimal_weight_two_lift {p : ℕ} [Fact p.Prime] (hp : 3 < p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hord : ResidualOrdinary ρ)
    (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1 ∧ serreWeight ρ ≠ p) :
    ∃ m : Member, m.Lifts ρ ∧ m.HasWeight 2 ∧ IsMinimalAway m {p} ∧
      (∀ g, Matrix.det (m.generic g : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) =
        finiteDeterminant m g * teichmuller m g ^ (serreWeight ρ - 2) * padicCyclotomic m g) ∧
      (serreWeight ρ < p + 1 → Nonempty (BarsottiTateOverCyclotomic m)) ∧
      (serreWeight ρ = 2 → m.IsCrystalline) ∧
      (serreWeight ρ = p + 1 → (wd m p).monodromy ≠ 0) ∧ IsOrdinary m := by sorry

/-- The prescribed minimal weight-two condition of Khare §2.2, p. 12, including its
actual ordinary inertia character and endpoint. This is an application predicate on members. -/
def MinimalWeightTwoLift {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (m : Member) : Prop :=
  m.Lifts ρ ∧ m.HasWeight 2 ∧ IsMinimalAway m {p} ∧
    (∀ g, Matrix.det (m.generic g : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) =
      finiteDeterminant m g * teichmuller m g ^ (serreWeight ρ - 2) * padicCyclotomic m g) ∧
    (∃ B : GL (Fin 2) (FractionRing m.O), ∀ g : inertiaAt p,
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 1 0 = 0 ∧
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 0 0 =
        (teichmuller m g : FractionRing m.O) ^ (serreWeight ρ-2) * padicCyclotomic m g ∧
      (B⁻¹ * m.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) 1 1 = 1) ∧
    (serreWeight ρ < p+1 → Nonempty (BarsottiTateOverCyclotomic m)) ∧
    (serreWeight ρ = 2 → m.IsCrystalline) ∧
    (serreWeight ρ = p+1 → (wd m p).monodromy ≠ 0)

theorem minimal_weight_two_lift_prescribed {p : ℕ} [Fact p.Prime] (hp : 3 < p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hord : ResidualOrdinary ρ)
    (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p+1 ∧ serreWeight ρ ≠ p) :
    ∃ m : Member, MinimalWeightTwoLift ρ m := by sorry

/-- R01.2/ClassFieldTheory: a chosen tame fundamental character at q, valued in the
coefficient extension containing its (q−1)-st roots; it is not the p-cyclotomic character. -/
def tameCharacter (m : Member) (q : ℕ) : inertiaAt q →* (FractionRing m.O)ˣ := sorry

/-- R26.2: local nebentypus data, with a chosen coefficient extension containing the characters.
χ is the Teichmüller lift of the residual tame character; η has exact p^e order. -/
structure NebentypeLift {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (q e : ℕ) (i : ℤ) where
  member : Member
  lifts : member.Lifts ρ
  weight : member.HasWeight (serreWeight ρ)
  crystalline : member.IsCrystalline
  minimal : IsMinimalAway member {p, q}
  chi : inertiaAt q →* (FractionRing member.O)ˣ
  eta : inertiaAt q →* (FractionRing member.O)ˣ
  etaOrder : orderOf eta = p ^ e
  etaFundamental : ∀ g, eta g = tameCharacter member q g ^ ((q-1) / p^e)
  chiFinite : 0 < orderOf chi
  chiPrimeToP : ¬ p ∣ orderOf chi
  etaGlobal : GQ →* (FractionRing member.O)ˣ
  etaGlobalOrder : orderOf etaGlobal = p^e
  etaRestrict : ∀ g : inertiaAt q, etaGlobal g = eta g
  type : ∃ B : GL (Fin 2) (FractionRing member.O), ∀ g : inertiaAt q,
    (B⁻¹ * member.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing member.O)) 1 0 = 0 ∧
    (B⁻¹ * member.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing member.O)) 0 0 = chi g * eta g ^ i ∧
    (B⁻¹ * member.generic g * B : Matrix (Fin 2) (Fin 2) (FractionRing member.O)) 1 1 = 1
  determinant : ∀ g : GQ,
    Matrix.det (member.generic g : Matrix (Fin 2) (Fin 2) (FractionRing member.O)) =
      finiteDeterminant member g * padicCyclotomic member g ^ (serreWeight ρ - 1) * etaGlobal g ^ i

/-- Local residual tame upper-triangular shape, including genuine ramification. -/
def NebentypeResidual {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (q : ℕ) : Prop :=
  ¬ IsUnramifiedAt ρ q ∧ ∃ (χ : inertiaAt q →* (FpBar p)ˣ) (B : GL (Fin 2) (FpBar p)),
    (∀ g, χ g ^ (q - 1) = 1) ∧ ∀ g : inertiaAt q,
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 1 0 = 0 ∧
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 0 0 = χ g ∧
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 1 1 = 1

/-- R26.2/Proposition 2.2, all integral nebentypus exponents, including p=3. -/
theorem nebentype_lift_at_q {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hlarge : ¬ Group.IsSolvable ρ.range)
    (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1 ∧ serreWeight ρ ≠ p)
    (q e : ℕ) (hq : q.Prime) (hqp : q ≠ p) (he : 0 < e)
    (hexact : p ^ e ∣ q - 1 ∧ ¬ p ^ (e + 1) ∣ q - 1) (hlocal : NebentypeResidual ρ q) (i : ℤ) :
    Nonempty (NebentypeLift ρ q e i) := by sorry

/-- R26.2/Proposition 3.1(i): same member and weight two; WD type at p is retained.
R24.5/almost-strict-compatibility supplies the common full system adapter. -/
theorem compatible_system_minimal_weight_two {p : ℕ} [Fact p.Prime] (hp : 3 < p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hord : ResidualOrdinary ρ)
    (m : Member) (hprescribed : MinimalWeightTwoLift ρ m) :
    ∃ (s : CompatibleSystem) (v : s.Place), HEq (s.member v) m ∧ s.HasWeight 2 ∧
      ∀ w : s.Place, 2 < (s.member w).p → IsUnramifiedAt ρ (s.member w).p →
        (s.member w).IsCrystalline ∧
        (s.member w).RamifiedInside ((artinConductor ρ).primeFactors ∪ {p}) := by sorry

/-- R26.2/Proposition 3.1(ii): the member above q has the stated return weights, with a twist.
R24.5/almost-strict-compatibility supplies the full system adapter. The local
crystalline-over-Q_q(μ_q) carrier is owned by R07/R24, as above. -/
theorem compatible_system_nebentype {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hk : serreWeight ρ = 2)
    (hlarge : ¬ Group.IsSolvable ρ.range)
    (q e : ℕ) (hq : q.Prime) (hqp : q ≠ p) (he : 0 < e)
    (hexact : p^e ∣ q-1 ∧ ¬ p^(e+1) ∣ q-1)
    (i : ℤ) (d : NebentypeLift ρ q e i) (j : ℕ)
    (hj : 1 ≤ j ∧ j ≤ q - 2) (htype : ∀ g : inertiaAt q,
      d.chi g * d.eta g ^ i = tameCharacter d.member q g ^ j) :
    ∃ (s : CompatibleSystem) (v : s.Place), HEq (s.member v) d.member ∧ s.HasWeight 2 ∧
      ∀ w : s.Place, (s.member w).p = q →
        IsUnramifiedAt (s.member w).generic p ∧
        (s.member w).RamifiedInside ((artinConductor ρ).primeFactors.erase p) ∧
        Nonempty (BarsottiTateOverCyclotomic (s.member w)) ∧
        (¬ Group.IsSolvable (s.member w).residual.range →
          serreWeight (s.member w).residual = j + 2 ∨
          serreWeight (DP.twistRep (cyclotomic (p := (s.member w).p) ^ (-(j : ℤ))) (s.member w).residual) = q + 1 - j) := by sorry

/-- R26.3/Khare Lemma 5.2: local irreducible and split cases have different twist exponents. -/
theorem serre_weight_twist {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hN : artinConductor ρ = 1) (hk : serreWeight ρ ≠ 2 ∧ serreWeight ρ < p)
    (k' : ℕ) (hexponent : serreWeight ρ - 1 = p - k') (hk' : k' ≤ p) :
    (IsIrreducible (ρ.comp (decompositionAt p).subtype) →
      serreWeight (DP.twistRep (cyclotomic (p := p) ^ k') ρ) = k' + 2) ∧
    ((∃ B : GL (Fin 2) (FpBar p), ∀ g : inertiaAt p,
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 0 1 = 0 ∧
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) 1 0 = 0) →
      serreWeight (DP.twistRep (cyclotomic (p := p) ^ (1 - (serreWeight ρ : ℤ))) ρ) = p + 1 - serreWeight ρ) := by sorry

/-- R26.4/Lemma 5.3, specifically the nonscalar potentially BT type ω^i⊕1. -/
theorem local_reducibility_ordinary (m : Member) (hp : m.p ≠ 2) (hweight : m.HasWeight 2)
    (hdR : m.IsDeRham) (hN : (wd m m.p).monodromy = 0)
    (i : ℕ) (hi : 1 ≤ i ∧ i ≤ m.p - 2)
    (htype : ∃ B : GL (Fin 2) (FractionRing m.O), ∀ g : inertiaAt m.p,
      (B⁻¹ * (wd m m.p).inertia g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) =
        !![(teichmuller m g : FractionRing m.O) ^ i, 0; 0, 1])
    (hred : ¬ IsIrreducible (m.residual.comp (decompositionAt m.p).subtype)) :
    ¬ IsIrreducible (m.generic.comp (decompositionAt m.p).subtype) ∧ IsOrdinary m := by sorry

/-- R26.4/Corollary 5.4: the level-one lifting lemma, including the ordinary CM branch.
Its proof requires the documented extension to R21.5; the existing imaginary-CM exclusion
cannot establish this theorem. -/
theorem level_one_lifting (m : Member) (hp : m.p ≠ 2) (k : ℕ)
    (hk : 2 ≤ k ∧ k ≤ m.p + 1 ∧ Even k) (hcrys : m.IsCrystalline)
    (hweight : m.HasWeight k) (hirr : IsIrreducible m.generic)
    (hunram : m.RamifiedInside ∅) (hmod : IsModular m.residual) :
    ∃ f : Newform, f.level = 1 ∧ f.weight = k ∧ m.ArisesFrom f := by sorry

/-- R26.4/Corollary 5.5(i), transport of a fixed weight; q≥k−1 is essential. -/
theorem level_one_change_characteristic (p k : ℕ) (hp : p.Prime) (hpodd : p ≠ 2)
    (hk : 2 ≤ k ∧ k ≤ p + 1)
    (hknown : ∀ (_ : Fact p.Prime) (ρ : GQ →* GL (Fin 2) (FpBar p)),
      IsSType ρ → artinConductor ρ = 1 → serreWeight ρ = k → IsModular ρ)
    (q : ℕ) [Fact q.Prime] (hq : k - 1 ≤ q)
    (ρ : GQ →* GL (Fin 2) (FpBar q)) (hS : IsSType ρ)
    (hN : artinConductor ρ = 1) (hweight : serreWeight ρ = k) : IsModular ρ := by sorry

/-- R26.4/degenerate branches: the scalar crystalline BT foil case has distinguished ordinary
characters, not the nonscalar hypothesis of Lemma 5.3. -/
theorem scalar_bt_reducible_ordinary (m : Member) (hp : m.p ≠ 2)
    (hcrys : m.IsCrystalline) (hweight : m.HasWeight 2)
    (hred : ¬ IsIrreducible (m.residual.comp (decompositionAt m.p).subtype)) :
    IsOrdinary m ∧ ∃ g : inertiaAt m.p, cyclotomic (p := m.p) g ≠ 1 := by sorry

/-- R26.4: parity supplies distinction before an ordinary lifting theorem is applied. -/
theorem ordinary_residual_distinguished {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (hN : artinConductor ρ = 1)
    (hord : ResidualOrdinary ρ) (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1) :
    Even (serreWeight ρ) ∧ ∃ g : inertiaAt p, cyclotomic (p := p) g ^ (serreWeight ρ - 1) ≠ 1 := by sorry

/-- R26.5: the complete terminal-row implication. The prescribed determinant and type are
those of the two lift/system targets above. Reducible, bad-dihedral and solvable branches
are discharged by R26.4, rather than folded into an assumed irreducible return member. -/
theorem terminal_row_branch_contract (P ℓ e j k B : ℕ) [Fact P.Prime]
    (hℓ : ℓ.Prime) (hodd : P ≠ 2 ∧ ℓ ≠ 2 ∧ P ≠ ℓ) (he : 0 < e)
    (hexact : ℓ ^ e ∣ P - 1 ∧ ¬ ℓ ^ (e + 1) ∣ P - 1)
    (hj : 1 ≤ j ∧ j ≤ P - 2 ∧ Even j)
    (hcoset : Nat.ModEq ((P - 1) / ℓ ^ e) j (k - 2))
    (hweights : j + 2 ≤ B ∧ P + 1 - j ≤ B) (hknown : LevelOneUpTo B)
    (ρ : GQ →* GL (Fin 2) (FpBar P)) (hS : IsSType ρ) (hN : artinConductor ρ = 1)
    (hk : serreWeight ρ = k) (hkRange : 2 ≤ k ∧ k ≤ P + 1 ∧ Even k)
    (hord : ResidualOrdinary ρ) : ArisesFrom ρ 1 k := by sorry

end TauCeti.SerreConjecture
end

/-! ## R26.1–R26.2: applying the deformation-ring suppliers -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- The power-series quotient that a presentation actually supplies. -/
structure PowerSeriesPresentation (O R : Type*) [CommRing O] [CommRing R] [Algebra O R]
    (n m : ℕ) where
  relations : List (MvPowerSeries (Fin n) O)
  relationCount : relations.length = m
  equivalence : (MvPowerSeries (Fin n) O ⧸ Ideal.ofList relations) ≃ₐ[O] R

def IsCompleteIntersection (O R : Type*) [CommRing O] [CommRing R] [Algebra O R] : Prop :=
  ∃ n m, ∃ P : PowerSeriesPresentation O R n m,
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O) P.relations

/-- R04.3/R08: representing data for the global deformation functor of ρ with its specified
local conditions. O is the specified finite-flat Witt coefficient algebra with the residual
field of ρ. The datum includes completeness, that residual identification and the universal
property on complete Noetherian local O-algebras. -/
def DeformationRepresentingData {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (O R : Type*) [CommRing O] [CommRing R] [Algebra O R] :
    Type := sorry

/-- R04.3/R08: the prescribed local subfunctor on complete local O-algebras. -/
def LocalDeformationCondition {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (O : Type*) [CommRing O] (r : ℕ) : Type := sorry
/-- R04.3: dim H⁰(D_r,Ad⁰ρ), or dim H⁰(D_r,Adρ) when determinant is not fixed. -/
def adjointH0 {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p))
    (r : ℕ) (fixedDeterminant : Bool) : ℕ := sorry
/-- R04/R08: coherence with the actual global universal representation and the local
representing rings, for this set of conditions and this determinant convention. -/
def DeformationCoherence {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (O R : Type*) [CommRing O] [CommRing R] [Algebra O R]
    (D : DeformationRepresentingData ρ O R) (fixedDeterminant : Bool) (S : Finset ℕ)
    (conditions : ∀ r, LocalDeformationCondition ρ O r) (localRing : ℕ → Type)
    (dimensions : ℕ → ℤ) (universal : GQ →* GL (Fin 2) R) : Type := sorry

/-- The supplier's global ring, local rings and adjoint dimensions in Böckle's application.
The Boolean fixes whether Ad⁰ or Ad is used, throughout both the counts and the determinant. -/
structure DeformationProblem {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (O R : Type*) [CommRing O] [CommRing R] [Algebra O R] where
  representing : DeformationRepresentingData ρ O R
  fixedDeterminant : Bool
  S : Finset ℕ
  containsCoefficientPrime : p ∈ S
  condition : ∀ r, LocalDeformationCondition ρ O r
  localRing : ℕ → Type
  localCommRing : ∀ r, CommRing (localRing r)
  localAlgebra : ∀ r, Algebra O (localRing r)
  h0 : ℕ → ℕ
  h0Identification : ∀ r, h0 r = adjointH0 ρ r fixedDeterminant
  relativeDimension : ℕ → ℤ
  universal : GQ →* GL (Fin 2) R
  coherence : DeformationCoherence ρ O R representing fixedDeterminant S condition
    localRing relativeDimension universal

attribute [instance] DeformationProblem.localCommRing DeformationProblem.localAlgebra

/-- R26.1: zero-defect presentation for the level-one minimal and Q-new conditions.
This applies R04/R24's presentation; it does not assert another owner for the generic theorem. -/
theorem bockle_level_one_presentation {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hodd : IsOdd ρ)
    (O R : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CommRing R] [Algebra O R]
    (D : DeformationProblem ρ O R)
    (hlocal : ∀ r ∈ D.S, Module.Flat O (D.localRing r) ∧ IsCompleteIntersection O (D.localRing r))
    (hdimension : ∀ r ∈ D.S, D.relativeDimension r =
      (D.h0 r : ℤ) + if r = p then 1 + (if D.fixedDeterminant then 0 else 1) else 0) :
    ∃ n, Nonempty (PowerSeriesPresentation O R
      (n + if D.fixedDeterminant then 0 else 1) n) := by sorry

/-- R08/R24: D's p-local condition is flat with cyclotomic determinant, over W(k)
or its specified coefficient base change O. This is not an arbitrary deformation condition. -/
def FlatCyclotomicLocalCondition {p : ℕ} [Fact p.Prime]
    {ρ : GQ →* GL (Fin 2) (FpBar p)} {O R : Type*}
    [CommRing O] [CommRing R] [Algebra O R] (D : DeformationProblem ρ O R) : Type := sorry

/-- R26.1: the separately computed decomposable flat exception, with two tangent variables. -/
theorem decomposable_flat_local_ring {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hflat : Nonempty (FiniteFlatModel ρ 1))
    (hdecomp : ∃ B : GL (Fin 2) (FpBar p), ∀ g : decompositionAt p,
      (B⁻¹ * ρ g * B : Matrix (Fin 2) (Fin 2) (FpBar p)) =
        !![(cyclotomic (p := p) g : FpBar p), 0; 0, 1])
    (O R : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CommRing R] [Algebra O R]
    (D : DeformationProblem ρ O R) (hdet : D.fixedDeterminant = true)
    (hcondition : FlatCyclotomicLocalCondition D) :
    Nonempty (D.localRing p ≃ₐ[O] MvPowerSeries (Fin 2) O) := by sorry

/-- R26.2: the flatness/complete-intersection conclusion with finite mod-π ring.
The existence of an integral specialization gives an actual prescribed lift. -/
theorem lifting_method_flatness {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hlarge : ¬ Group.IsSolvable ρ.range)
    (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1 ∧ serreWeight ρ ≠ p)
    (O R : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CommRing R] [Algebra O R]
    (D : DeformationProblem ρ O R) (hdet : D.fixedDeterminant = true)
    (hlocal : ∀ r ∈ D.S, Module.Flat O (D.localRing r) ∧ IsCompleteIntersection O (D.localRing r))
    (hdimension : ∀ r ∈ D.S, D.relativeDimension r = (D.h0 r : ℤ) + if r = p then 1 else 0)
    (π : O) (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (hfinite : Finite (R ⧸ Ideal.span {algebraMap O R π})) :
    Module.Finite O R ∧ Module.Flat O R ∧ IsCompleteIntersection O R ∧
    ∃ (m : Member) (f : R →+* m.O), m.Lifts ρ ∧
      m.rho = (Matrix.GeneralLinearGroup.map f).comp D.universal := by sorry

/-- R08.2: the versal local deformation ring for the determinant and inertia characters of
NebentypeLift. Its representing datum is local, not the global ring above. -/
def NebentypeLocalRingData {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (q e : ℕ) (i : ℤ)
    (O R : Type*) [CommRing O] [CommRing R] [Algebra O R] : Type := sorry

/-- R26.2: smoothness of the full local ring, rather than just the Frobenius quadratic. -/
theorem local_ring_at_q_smooth {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (q e : ℕ) (hq : q.Prime) (hqp : q ≠ p)
    (he : 0 < e) (hexact : p ^ e ∣ q - 1 ∧ ¬ p ^ (e + 1) ∣ q - 1)
    (hlocal : NebentypeResidual ρ q) (i : ℤ)
    (O R : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CommRing R] [Algebra O R]
    (D : NebentypeLocalRingData ρ q e i O R) :
    Nonempty (R ≃ₐ[O] MvPowerSeries (Fin 1) O) := by sorry

/-- R26.4: the foil's three solvable branches, with a weight-two BT lift. The bad-dihedral
case invokes the required CM extension of R21.5; solvability itself is not ordinarity. -/
theorem degenerate_foil_solvable (m : Member) (hp : m.p ≠ 2) (hweight : m.HasWeight 2)
    (hbt : Nonempty (BarsottiTateOverCyclotomic m)) (hodd : IsOdd m.generic)
    (hirr : IsIrreducible m.generic) (hfinite : ∃ S, m.RamifiedInside S)
    (hsolv : Group.IsSolvable m.residual.range) : m.IsModular := by sorry

/-- R26.4: the unramified foil branch reduces to level one and weight two.
The level-one weight-two exclusion forces reducibility; it is not discarded as impossible. -/
theorem degenerate_unramified_foil (m : Member) (hp : m.p ≠ 2)
    (hweight : m.HasWeight 2) (hcrys : m.IsCrystalline)
    (hodd : IsOdd m.generic) (hirr : IsIrreducible m.generic)
    (hunram : m.RamifiedInside ∅) :
    ¬ IsIrreducible m.residual ∧ IsOrdinary m ∧ m.IsModular := by sorry

/-- R26.4: the return's reducible/solvable branches at the nontrivial even tame exponent.
The potentially BT type, determinant and distinction are retained, not only its weight. -/
theorem degenerate_return_solvable (m : Member) (hp : m.p ≠ 2) (hweight : m.HasWeight 2)
    (hbt : Nonempty (BarsottiTateOverCyclotomic m)) (hodd : IsOdd m.generic)
    (hirr : IsIrreducible m.generic) (hfinite : ∃ S, m.RamifiedInside S)
    (j : ℕ) (hj : 1 ≤ j ∧ j ≤ m.p - 2 ∧ Even j)
    (htype : ∃ B : GL (Fin 2) (FractionRing m.O), ∀ g : inertiaAt m.p,
      (B⁻¹ * (wd m m.p).inertia g * B : Matrix (Fin 2) (Fin 2) (FractionRing m.O)) =
        !![(teichmuller m g : FractionRing m.O) ^ j, 0; 0, 1])
    (hsolv : Group.IsSolvable m.residual.range) : m.IsModular := by sorry

end TauCeti.SerreConjecture
end

/-! ## R27.5–R27.6 and R33.6: finite flatness, regular systems and Artin reductions -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- R27.5: finite flatness over an odd-ramification extension excludes the très ramifiée
weight-four dyadic case. This is the local input imported from R15.4/R07.4. -/
theorem dyadic_finite_flat_weight_two [Fact (Nat.Prime 2)]
    (ρ : GQ →* GL (Fin 2) (FpBar 2)) (hS : IsSType ρ) (e : ℕ) (he : Odd e)
    (hflat : Nonempty (FiniteFlatModel ρ e)) : serreWeight ρ = 2 := by sorry

/-- R15.4/Serre Proposition 4: the precise imported finite-flat bridge used in both exports. -/
theorem finite_flat_cyclotomic_weight_two {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hflat : Nonempty (FiniteFlatModel ρ 1))
    (hdet : ∀ g, Matrix.det (ρ g : Matrix (Fin 2) (Fin 2) (FpBar p)) = cyclotomic (p := p) g) :
    serreWeight ρ = 2 := by sorry

/-- R27.6: the finite-flat version, with the full cyclotomic determinant hypothesis. -/
theorem finite_flat_weight_two_export {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hflat : Nonempty (FiniteFlatModel ρ 1))
    (hdet : ∀ g, Matrix.det (ρ g : Matrix (Fin 2) (Fin 2) (FpBar p)) = cyclotomic (p := p) g) :
    ∃ (f : Newform) (v : f.ResidualPlace p), f.level = artinConductor ρ ∧ f.weight = 2 ∧
      f.character = 1 ∧ RepIso (f.residualRep v) ρ := by sorry

/-- R27.6/KW 10.1(i). The Tate twist by −b is visible in both Frobenius coefficients.
Regularity a>b yields weight a−b+1≥2; irregular systems remain the ML.1 consumer's target. -/
theorem regular_compatible_system_modularity (s : CompatibleSystem) (a b : ℤ)
    (hweights : s.weights = {a, b}) (hregular : b < a) :
    ∃ (f : Newform) (ι : s.E →+* ℂ), f.weight = (a - b).toNat + 1 ∧ 2 ≤ f.weight ∧
      ∀ r, r.Prime → r ∉ s.S → ¬ r ∣ f.level →
        ι (s.trace r) * (r : ℂ) ^ (-b) = f.coeff r ∧
        ι (s.determinant r) * (r : ℂ) ^ (-2 * b) =
          f.character (r : ZMod f.level) * (r : ℂ) ^ (f.weight - 1) := by sorry

/-- A number-field realization and one full stable lattice at every coefficient place.
E is allowed to exceed the trace field. The completed local rings are the actual members'
coefficient rings, identified by their integral residue kernels. -/
structure ArtinRealisation (ρ : GQ →* GL (Fin 2) ℂ) where
  E : Type
  field : Field E
  numberField : NumberField E
  complexEmbedding : E →+* ℂ
  representation : GQ →* GL (Fin 2) E
  complexIso : RepIso ((Matrix.GeneralLinearGroup.map complexEmbedding).comp representation) ρ
  member : IsDedekindDomain.HeightOneSpectrum (𝓞 E) → Member
  embedding : ∀ v, E →+* FractionRing (member v).O
  integralEmbedding : ∀ v, 𝓞 E →+* (member v).O
  placeKernel : ∀ v, RingHom.ker ((IsLocalRing.residue (member v).O).comp (integralEmbedding v)) = v.asIdeal
  integralCompatibility : ∀ v x,
    algebraMap (member v).O (FractionRing (member v).O) (integralEmbedding v x) = embedding v (x : E)
  lattice : ∀ v, StableLattice (O := (member v).O)
    ((Matrix.GeneralLinearGroup.map (embedding v)).comp representation)
  action : ∀ v, (lattice v).action = (member v).rho
  trace : ℕ → 𝓞 E
  traceCompatibility : ∀ r, r.Prime → ¬ r ∣ artinConductor ρ → ∀ g, IsFrobAt g r →
    complexEmbedding (trace r : E) = Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) ℂ)
  determinantCharacter : DirichletCharacter (𝓞 E) (artinConductor ρ)
  determinant : ∀ r, r.Prime → ¬ r ∣ artinConductor ρ → ∀ g, IsFrobAt g r →
    complexEmbedding (determinantCharacter (r : ZMod (artinConductor ρ))) =
      Matrix.det (ρ g : Matrix (Fin 2) (Fin 2) ℂ)

attribute [instance] ArtinRealisation.field ArtinRealisation.numberField

/-- R27.6/artin-reductions, part (a), including finiteness of the complex image. -/
theorem artin_realisation (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) :
    Finite ρ.range ∧ Nonempty (ArtinRealisation ρ) := by sorry

/-- Lattice independence is unconditional for ss, and full for image order prime to p. -/
theorem artin_lattice_independence (ρ : GQ →* GL (Fin 2) ℂ)
    (A : ArtinRealisation ρ) (v : IsDedekindDomain.HeightOneSpectrum (𝓞 A.E))
    (Λ : StableLattice (O := (A.member v).O)
      ((Matrix.GeneralLinearGroup.map (A.embedding v)).comp A.representation))
    (hG : ¬ (A.member v).p ∣ Nat.card ρ.range) :
    RepIso (residualRep Λ.action) (residualRep (A.lattice v).action) := by sorry

theorem artin_lattice_ss_independence (ρ : GQ →* GL (Fin 2) ℂ)
    (A : ArtinRealisation ρ) (v : IsDedekindDomain.HeightOneSpectrum (𝓞 A.E))
    (Λ : StableLattice (O := (A.member v).O)
      ((Matrix.GeneralLinearGroup.map (A.embedding v)).comp A.representation)) :
    RepIso (semisimplification (residualRep Λ.action))
      (semisimplification (residualRep (A.lattice v).action)) := by sorry

/-- R15.4: Edixhoven's minimal Katz weight and Serre's residual character. -/
def edixhovenWeight {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : ℕ := sorry
def serreCharacter {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) :
    DirichletCharacter (FpBar p) (artinConductor ρ) := sorry

/-- R27.6/artin-reductions, parts (b)–(c): S-type, faithfulness, conductor, both weights,
character and coefficient reduction of traces/determinants are all retained. -/
theorem artin_reduction_invariants (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) (A : ArtinRealisation ρ)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 A.E))
    (hG : ¬ (A.member v).p ∣ Nat.card ρ.range) (hN : ¬ (A.member v).p ∣ artinConductor ρ) :
    (A.member v).p ≠ 2 ∧ IsSType (A.member v).residual ∧
    (A.member v).residual.ker = ρ.ker ∧ IsUnramifiedAt (A.member v).residual (A.member v).p ∧
    artinConductor (A.member v).residual = artinConductor ρ ∧
    serreWeight (A.member v).residual = (A.member v).p ∧ edixhovenWeight (A.member v).residual = 1 ∧
    ∀ r, r.Prime → ¬ r ∣ artinConductor ρ * (A.member v).p → ∀ g, IsFrobAt g r →
      Matrix.trace ((A.member v).residual g : Matrix (Fin 2) (Fin 2) (FpBar (A.member v).p)) =
        (A.member v).residueEmbedding (IsLocalRing.residue (A.member v).O
          (A.integralEmbedding v (A.trace r))) ∧
      Matrix.det ((A.member v).residual g : Matrix (Fin 2) (Fin 2) (FpBar (A.member v).p)) =
        (A.member v).residueEmbedding (IsLocalRing.residue (A.member v).O
          (A.integralEmbedding v (A.determinantCharacter (r : ZMod (artinConductor ρ))))) ∧
      serreCharacter (A.member v).residual (r : ZMod (artinConductor (A.member v).residual)) =
        Matrix.det ((A.member v).residual g : Matrix (Fin 2) (Fin 2) (FpBar (A.member v).p)) := by sorry

/-- R27.6/artin-reductions, part (d): exact positive density of the complex-conjugation class. -/
theorem artin_frobenius_density (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ)
    (φ : AlgebraicClosure ℚ →+* ℂ) (c : GQ) (hc : ComplexEmbedding.IsConj φ c) :
    ∃ δ : ℝ, 0 < δ ∧ δ = (Nat.card {x : ρ.range // IsConj x (⟨ρ c, by exact ⟨c, rfl⟩⟩ : ρ.range)} : ℝ) /
      Nat.card ρ.range ∧ NumberField.Set.HasDirichletDensity
      (primesOfRat {r | r.Prime ∧ ¬ r ∣ artinConductor ρ * Nat.card ρ.range ∧
        ∃ g, IsFrobAt g r ∧ IsConj (ρ g) (ρ c)}) δ := by sorry

/-- R27.6: the general odd-prime Katz weight-one statement consumed by ML.1; no hypothesis
on the two eigenvalues at the coefficient-prime Frobenius is imposed. -/
theorem unramified_residual_weight_one_general {ℓ : ℕ} [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ρ : GQ →* GL (Fin 2) (FpBar ℓ)) (hcont : IsOpen (ρ.ker : Set GQ))
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) (hur : IsUnramifiedAt ρ ℓ) :
    ∃ h : KatzCuspForms (artinConductor ρ) 1 (FpBar ℓ), h ≠ 0 ∧
      ∀ r, r.Prime → ¬ r ∣ artinConductor ρ * ℓ → ∀ g, IsFrobAt g r →
        katzHecke _ 1 _ r h = Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) (FpBar ℓ)) • h ∧
        katzDiamond _ 1 _ (r : ZMod (artinConductor ρ)) h =
          Matrix.det (ρ g : Matrix (Fin 2) (Fin 2) (FpBar ℓ)) • h := by sorry

/-- R33.6: residual attachments to the actual pinned good-eigenform carrier, supplied by R15.6. -/
def EigenformResidualPlace {N : ℕ} [NeZero N] {k : ℤ}
    (f : HeckeRing.GL2.EigenformAwayFromLevel N k) (p : ℕ) : Type := sorry
def eigenformResidualRep {N : ℕ} [NeZero N] {k : ℤ}
    (f : HeckeRing.GL2.EigenformAwayFromLevel N k) {p : ℕ} [Fact p.Prime]
    (v : EigenformResidualPlace f p) : GQ →* GL (Fin 2) (FpBar p) := sorry

def IsEigenformModular {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (FpBar p)) : Prop :=
  ∃ (N k : ℕ) (_ : NeZero N), 2 ≤ k ∧
    ∃ (f : HeckeRing.GL2.EigenformAwayFromLevel N (k : ℤ)) (v : EigenformResidualPlace f p),
      RepIso (semisimplification (eigenformResidualRep f v)) ρ

/-- R33.6: Atkin–Lehner and Brauer–Nesbitt identify the two notions of modularity. -/
theorem eigenform_modularity_iff {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) :
    IsEigenformModular ρ ↔ IsModular ρ := by sorry

/-- R26.6/Corollary 1.3 includes reducible semisimple representations. -/
theorem finite_level_one_semisimple (p : ℕ) [Fact p.Prime] :
    ∃ S : Set (GQ →* GL (Fin 2) (FpBar p)), S.Finite ∧ ∀ ρ,
      IsOpen (ρ.ker : Set GQ) → IsOdd ρ → RepIso ρ (semisimplification ρ) →
      (∀ r, r.Prime → r ≠ p → IsUnramifiedAt ρ r) → ∃ τ ∈ S, RepIso τ ρ := by sorry

end TauCeti.SerreConjecture
end

/-! ## R27.1/R27.4: the full image and auxiliary-prime contracts
Dickson's groups, the cyclotomic subgroup and local restriction are adapters to R01.4;
the dihedral modularity statement is imported from R17/R20. No classification is replanned. -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- R01.4: PSL₂(k), the scalar quotient of SL₂(k). -/
def projectiveSL (k : Type*) [Field k] : Type := sorry
instance (k : Type*) [Field k] : Group (projectiveSL k) := sorry
/-- R01.4: PGL₂(k), the scalar quotient of GL₂(k). -/
def projectiveGL (k : Type*) [Field k] : Type := sorry
instance (k : Type*) [Field k] : Group (projectiveGL k) := sorry
/-- R01.4: G_(Q(μ_p)) as a subgroup of G_Q. -/
def cyclotomicSubgroup (p : ℕ) : Subgroup GQ := sorry

theorem dickson_alternatives {G : Type*} [Group G] {p : ℕ} [Fact p.Prime]
    (ρ : G →* GL (Fin 2) (FpBar p)) (hfinite : Finite ρ.range) (hirr : IsIrreducible ρ) :
    (∃ n, Nonempty (projectiveImage ρ ≃* DihedralGroup n)) ∨
    Nonempty (projectiveImage ρ ≃* alternatingGroup (Fin 4)) ∨
    Nonempty (projectiveImage ρ ≃* Equiv.Perm (Fin 4)) ∨
    Nonempty (projectiveImage ρ ≃* alternatingGroup (Fin 5)) ∨
    ∃ k : Subfield (FpBar p), Finite k ∧
      (Nonempty (projectiveImage ρ ≃* projectiveSL k) ∨
       Nonempty (projectiveImage ρ ≃* projectiveGL k)) := by sorry

theorem projectiveSL_simple (k : Type*) [Field k] [Finite k] (hsize : 4 ≤ Nat.card k) :
    IsSimpleGroup (projectiveSL k) ∧ ¬ Group.IsSolvable (projectiveSL k) := by sorry

/-- KW Lemma 6.1: the dyadic solvable refinement. -/
theorem dyadic_solvable_dihedral {G : Type*} [Group G]
    (ρ : G →* GL (Fin 2) (FpBar 2)) (hfinite : Finite ρ.range)
    (hirr : IsIrreducible ρ) (hsolv : Group.IsSolvable ρ.range) :
    ∃ n, Nonempty (projectiveImage ρ ≃* DihedralGroup n) := by sorry

/-- KW Lemma 6.2(i): refined dihedral modularity, including p=2. -/
theorem dihedral_arisesFrom_optimal {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hdihedral : ∃ n, Nonempty (projectiveImage ρ ≃* DihedralGroup n)) :
    ArisesFrom ρ (artinConductor ρ) (serreWeight ρ) := by sorry

/-- KW Lemma 6.2(ii), with the full cyclotomic restriction hypothesis. -/
theorem cyclotomic_reducible_weight {p : ℕ} [Fact p.Prime] (hp : 3 ≤ p)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hk : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (hred : ¬ IsIrreducible (ρ.comp (cyclotomicSubgroup p).subtype)) :
    serreWeight ρ = (p + 1) / 2 ∨ serreWeight ρ = (p + 3) / 2 := by sorry

/-- KW Lemma 6.3(i), including the previously omitted A₅ exclusion. -/
theorem good_dihedral_large_image {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hcont : IsOpen (ρ.ker : Set GQ))
    (hgood : IsGoodDihedralRep ρ) :
    ¬ Group.IsSolvable ρ.range ∧ ¬ Nonempty (projectiveImage ρ ≃* alternatingGroup (Fin 5)) := by sorry

/-- R24.3: the local minimal lift identification with the specified residual representation,
including a comparison of coefficient fields. -/
def MinimalLiftAt {p : ℕ} [Fact p.Prime] (m : Member)
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (q : ℕ) : Type := sorry

/-- KW Lemma 6.3(ii): the bounded residual range and actual minimal local lift are explicit. -/
theorem good_dihedral_preserved {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ) (q : ℕ)
    (hgood : IsGoodDihedralPrime ρ galoisInertia p (artinConductor ρ) q)
    (s : CompatibleSystem) (v : s.Place) (hlift : (s.member v).Lifts ρ)
    (hminimal : Nonempty (MinimalLiftAt (s.member v) ρ q))
    (hram : ∀ r ∈ s.S, r ∣ artinConductor ρ * p) (w : s.Place)
    (hbound : (s.member w).p ≤ max (Nat.maxPrimeFac (artinConductor ρ / q^2)) p) :
    IsGoodDihedralPrime (s.member w).residual galoisInertia (s.member w).p
      (artinConductor (s.member w).residual) q ∧
    ¬ Group.IsSolvable (s.member w).residual.range ∧
    ¬ Nonempty (projectiveImage (s.member w).residual ≃* alternatingGroup (Fin 5)) := by sorry

/-- Lemma 8.2's local consequence, beyond its trace and divisibility consequence. -/
theorem lemma_8_2_local_shape {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1)
    (ρ : GQ →* GL (Fin 2) (ZMod p))
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) {q : ℕ}
    (hq : q ∈ auxiliaryPrimes ρ c) :
    ∃ (γ : decompositionAt q →* (FpBar p)ˣ) (B : GL (Fin 2) (FpBar p)),
      (∀ g : inertiaAt q, ∀ h : decompositionAt q, (g : GQ) = (h : GQ) → γ h = 1) ∧
      ∀ g : decompositionAt q,
        (B⁻¹ * (Matrix.GeneralLinearGroup.map (algebraMap (ZMod p) (FpBar p)) (ρ g)) * B :
          Matrix (Fin 2) (Fin 2) (FpBar p)) =
          (γ g : FpBar p) • !![(cyclotomic (p := p) g : FpBar p), 0; 0, 1] := by sorry

/-- R27.1/KW §8.4: insertion from the prime-field-valued weight-two residual input.
The p′-power character and good-dihedral reductions below p′ are part of the output. -/
theorem classical_good_dihedral_insertion {p : ℕ} [Fact p.Prime]
    (hp : 5 < p) (hmod : p % 4 = 1) (ρ₀ : GQ →* GL (Fin 2) (ZMod p))
    (hS : IsSType ((Matrix.GeneralLinearGroup.map (algebraMap (ZMod p) (FpBar p))).comp ρ₀))
    (hlarge : ¬ Group.IsSolvable ρ₀.range)
    (hk : serreWeight ((Matrix.GeneralLinearGroup.map (algebraMap (ZMod p) (FpBar p))).comp ρ₀) = 2)
    (hram : ∀ r, r.Prime → r ≠ p → ¬ IsUnramifiedAt ρ₀ r → r < p)
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ₀ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) (q : ℕ)
    (hq : q ∈ auxiliaryPrimes ρ₀ c) :
    ∃ (s : CompatibleSystem) (v : s.Place),
      (s.member v).Lifts ((Matrix.GeneralLinearGroup.map (algebraMap (ZMod p) (FpBar p))).comp ρ₀) ∧
      s.HasWeight 2 ∧ (s.member v).IsCrystalline ∧
      IsMinimalAway (s.member v) {p,q} ∧
      (∃ (a : ℕ) (ψ : inertiaAt q →* s.Eˣ) (B : GL (Fin 2) s.E), 0 < a ∧ orderOf ψ = p^a ∧
        (∀ g, (B⁻¹ * (s.parameter q).inertia g * B : Matrix (Fin 2) (Fin 2) s.E) =
          !![(ψ g : s.E), 0; 0, (ψ g : s.E)^q]) ∧ (s.parameter q).monodromy = 0) ∧
      ∀ w : s.Place, (s.member w).p < p → (s.member w).p ≠ q →
        IsGoodDihedralPrime (s.member w).residual galoisInertia (s.member w).p
          (artinConductor (s.member w).residual) q := by sorry

/-- R27.4: the full split auxiliary characteristic, not just its size inequality. -/
theorem classical_auxiliary_characteristic {p : ℕ} [Fact p.Prime]
    (ρ : GQ →* GL (Fin 2) (FpBar p)) (hS : IsSType ρ)
    (hlarge : if p = 2 then ¬ Group.IsSolvable ρ.range else
      IsIrreducible (ρ.comp (cyclotomicSubgroup p).subtype))
    (s : CompatibleSystem) (v : s.Place) (hlift : (s.member v).Lifts ρ)
    (hweight : s.HasWeight (if p = 2 then 2 else serreWeight ρ))
    (hnormal : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p+1)
    (hram : ∀ r ∈ s.S, r ∣ artinConductor ρ * p) :
    IsModular ρ ∨ ∃ (p' : ℕ) (_ : Fact p'.Prime) (w : s.Place),
      5 < p' ∧ p' % 4 = 1 ∧ p < p' ∧ (∀ r ∈ s.S, r < p') ∧ s.SplitAt p' ∧
      (s.member w).p = p' ∧ IsSType (s.member w).residual ∧
      serreWeight (s.member w).residual = 2 ∧ ¬ Group.IsSolvable (s.member w).residual.range := by sorry

end TauCeti.SerreConjecture
end

/-! ## Construction tests against the actual local and global interfaces -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces
namespace DP

/-- R07.3: crystalline representations have zero monodromy at their coefficient prime. -/
theorem crystalline_monodromy_zero (m : Member) (hcrys : m.IsCrystalline) :
    (wd m m.p).monodromy = 0 := by sorry

local instance : Fact (Nat.Prime 7) := ⟨by norm_num⟩

/-- R07.3: for a de Rham member, potential crystallinity is exactly N=0 in WD. -/
theorem potentially_crystalline_iff (m : Member) (hdR : m.IsDeRham) :
    m.IsPotentiallyCrystalline ↔ (wd m m.p).monodromy = 0 := by sorry

/-- `level_one_nonexample`: a normalized order-three character at N=7 is Frobenius
invariant, so its induction is reducible. Divisibility alone is not the assertion. -/
example (κ : unramifiedQuadratic 7 →* (CyclotomicIntegers 3)ˣ)
    (horder : orderOf κ = 3) (hnorm : κ (artinUniformizer 7) = 1) :
    (∀ g : localInertia 7, κ (quadraticInertia 7 g)^7 = κ (quadraticInertia 7 g)) ∧
    ¬ IsIrreducible (genericRep (inducedQuadratic 7 κ)) := by sorry

/-- `unnormalised_character`: κ itself has cyclic image; the restriction of Ind κ to the
quadratic subgroup has image μ_q×μ_q. The full and projective image orders differ. -/
example (q N : ℕ) [Fact q.Prime] [Fact N.Prime] (hodd : Odd q)
    (hdiv : q ∣ N+1) (hnot : ¬ q ∣ N-1)
    (κ : unramifiedQuadratic N →* (CyclotomicIntegers q)ˣ)
    (horder : orderOf κ = q) (hinertia : orderOf (κ.comp (quadraticInertia N)) = q)
    (hunnorm : κ (artinUniformizer N) = zeta q) :
    Nat.card (inducedQuadratic N κ).range = 2*q^2 ∧
    Nat.card (projectiveImage (genericRep (inducedQuadratic N κ))) = 2*q := by sorry

/-- `insertion_needs_rationality`: a trace outside the prime field obstructs descent.
Degree two alone does not obstruct descent; this fixture supplies the missing trace witness. -/
example {G K : Type*} [Group G] [Field K] [Algebra (ZMod 13) K]
    (hdegree : Module.finrank (ZMod 13) K = 2) (ρ : G →* GL (Fin 2) K) (g : G)
    (htrace : Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) K) ∉
      Set.range (algebraMap (ZMod 13) K)) :
    ¬ ∃ ρ₀ : G →* GL (Fin 2) (ZMod 13),
      RepIso ρ ((Matrix.GeneralLinearGroup.map (algebraMap (ZMod 13) K)).comp ρ₀) := by sorry

/-- `insertion_q_gt_5`: five passes the solvable exceptional-group exclusions, but fails
both the strict good-dihedral bound and the A₅ exclusion. -/
example (s : CompatibleSystem) (d : GoodDihedralInsertion s) :
    d.q ≠ 5 ∧ ¬ 5 ∣ 12 ∧ ¬ 5 ∣ 24 ∧ 5 ∣ 60 := by
  have h := d.qGtFive
  constructor
  · omega
  · norm_num

/-- `insertion_not_general_lift_owner`: a mathematical application of Paso 2.
General prescribed-lift existence remains R24.3; the ownership boundary stays in prose. -/
example (s : CompatibleSystem) (hw : s.HasWeight 2) :
    s.IsModular ∨ ∃ d : GoodDihedralInsertion s,
      d.system.HasWeight 2 ∧ Linked s d.system d.q ∧ HasDihedralType d.system d.q d.N := by
  sorry

/-- The explicit local alternatives in DP 1.9(4), used only as a test fixture. -/
def AuxiliaryWeightClause (m : Member) (k : ℕ) : Prop :=
  m.HasWeight 2 ∧ (k = 2 → m.IsCrystalline) ∧ (k = m.p+1 → (wd m m.p).monodromy ≠ 0)

/-- `insertion_crystalline_needs_weight_two`: weight 14 at 13 selects the noncrystalline
Steinberg alternative; weight 2 at 13 selects the crystalline alternative. -/
example (m n : Member) (hp : m.p = 13) (hq : n.p = 13)
    (hend : AuxiliaryWeightClause m 14) (htwo : AuxiliaryWeightClause n 2) :
    m.HasWeight 2 ∧ (wd m 13).monodromy ≠ 0 ∧ ¬ m.IsCrystalline ∧
    n.HasWeight 2 ∧ n.IsCrystalline := by sorry

/-- `ramification_index_three`: the selected extension has e=3, an odd ramification index. -/
example : Odd (3 : ℕ) ∧ 3 % 2 = 1 := by decide

/-- `steinberg_nonexample`: the order-three type has zero monodromy and cannot be
isomorphic to a Steinberg WD parameter with nonzero monodromy. -/
example (s : CompatibleSystem) (htype : HasDihedralType s 3 2)
    (W : WDParameter s.E 2) (hstein : W.monodromy ≠ 0) :
    (s.parameter 2).monodromy = 0 ∧ ¬ W.Isomorphic (s.parameter 2) := by sorry

/-- `steinberg_nonexample`, p-adic Hodge content: a Steinberg member is not potentially
crystalline, whereas the order-three type gives a potentially crystalline dyadic member. -/
example (m : Member) (hdR : m.IsDeRham) (hstein : (wd m m.p).monodromy ≠ 0)
    (s : CompatibleSystem) (htype : HasDihedralType s 3 2) (v : s.Place)
    (hp : (s.member v).p = 2) (hirr : IsIrreducible (s.member v).residual) :
    ¬ m.IsPotentiallyCrystalline ∧ (s.member v).IsPotentiallyCrystalline := by sorry

/-- `needs_unramified_at_3`: a Steinberg member at 3 with residual weight 4 cannot supply
Lemma 2.3's crystalline weight-two member. Its bad prime 3 must lie in S. -/
example (s : CompatibleSystem) (hw : s.HasWeight 2) (v : s.Place)
    (hp : (s.member v).p = 3) (hstein : (wd (s.member v) 3).monodromy ≠ 0)
    (hres : serreWeight (s.member v).residual = 4) :
    3 ∈ s.S ∧ ¬ (s.member v).IsCrystalline ∧ serreWeight (s.member v).residual ≠ 2 := by sorry

end DP
end TauCeti.SerreConjecture
end

/-! ## R26.1: the auxiliary-to-minimal R=T application -/
noncomputable section
namespace TauCeti.SerreConjecture
open NumberField ImportedInterfaces

/-- R24.3: the minimal/auxiliary global deformation and Hecke diagram for the same residual
representation and determinant. It includes the Q-new local conditions, the quotient maps,
reduced new quotient and Carayol's conductor-prime-to-Q identification. O is the specified
finite-flat Witt coefficient algebra with unchanged residue field. -/
def AuxiliaryMinimalRTData (O RQ TQ Rmin Tmin : Type*)
    [CommRing O] [CommRing RQ] [CommRing TQ] [CommRing Rmin] [CommRing Tmin]
    [Algebra O RQ] [Algebra O TQ] [Algebra O Rmin] [Algebra O Tmin]
    (auxiliary : RQ →ₐ[O] TQ) (minimal : Rmin →ₐ[O] Tmin) : Type := sorry

/-- Böckle Theorem 1, applied to the actual level-one diagram rather than an abstract map. -/
theorem bockle_minimal_r_equals_t_application (O RQ TQ Rmin Tmin : Type*)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CommRing RQ] [CommRing TQ] [CommRing Rmin] [CommRing Tmin]
    [Algebra O RQ] [Algebra O TQ] [Algebra O Rmin] [Algebra O Tmin]
    (auxiliary : RQ →ₐ[O] TQ) (minimal : Rmin →ₐ[O] Tmin)
    (D : AuxiliaryMinimalRTData O RQ TQ Rmin Tmin auxiliary minimal)
    (haux : Function.Bijective auxiliary)
    (hTQ : Module.Finite O TQ ∧ Module.Flat O TQ) (hreduced : IsReduced TQ)
    (hTmin : Module.Finite O Tmin ∧ Module.Flat O Tmin) :
    Function.Bijective minimal ∧ Module.Finite O Rmin ∧ Module.Flat O Rmin ∧
      IsCompleteIntersection O Rmin := by sorry

/-- R27.6: primes in the positive-density conjugation class give distinct residual
Frobenius eigenvalues {1,−1} at every place above that prime; trace=0 and det=−1 expose this. -/
theorem artin_distinct_frobenius_reductions (ρ : GQ →* GL (Fin 2) ℂ)
    (hcont : Continuous ρ) (hirr : IsIrreducible ρ) (hodd : IsOdd ρ)
    (A : ArtinRealisation ρ) (φ : AlgebraicClosure ℚ →+* ℂ) (c : GQ)
    (hc : ComplexEmbedding.IsConj φ c) (v : IsDedekindDomain.HeightOneSpectrum (𝓞 A.E))
    (hgood : ¬ (A.member v).p ∣ artinConductor ρ * Nat.card ρ.range)
    (g : GQ) (hFrob : IsFrobAt g (A.member v).p) (hclass : IsConj (ρ g) (ρ c)) :
    (A.member v).p ≠ 2 ∧ Matrix.trace ((A.member v).residual g :
      Matrix (Fin 2) (Fin 2) (FpBar (A.member v).p)) = 0 ∧
    Matrix.det ((A.member v).residual g : Matrix (Fin 2) (Fin 2) (FpBar (A.member v).p)) = -1 := by sorry

end TauCeti.SerreConjecture
end

/-! ## The analytic carriers at the pin -/

open scoped UpperHalfPlane in
/-- Mathlib's `CuspForm Γ k` exists at the pin and is a function on the upper half-plane; the
attached Galois representation is what the pinned libraries lack. -/
example (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f : CuspForm Γ k) : UpperHalfPlane → ℂ := f
