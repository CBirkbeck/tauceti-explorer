import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.RamificationInertia.Galois
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Spec
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.RingTheory.FractionalIdeal.Norm
import Mathlib.Topology.DiscreteSubset
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.MeasureTheory.Measure.Typeclasses.Probability
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Finset.Powerset
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.NormNum.Prime
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.NumberTheory.NumberField.Discriminant.Defs

/-!
# Suggested Lean forms: Modularity, automorphy and Langlands endpoint extensions

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/ModularityAndLanglandsExtensions.md` and the blueprint packet are
definitive; the statements below only suggest Lean forms, so that contributors and reviewers
converge on names and signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. The file imports individual Mathlib modules only;
it elaborates against Mathlib `082e2d3` with `sorry` as its only warning.

Automorphic representations, Weil–Deligne representations, local Langlands correspondences,
automorphic L-functions and Galois representations attached to automorphic forms are not in the
pinned libraries; other roadmaps own them (AutomorphicFormsOnReductiveGroups, AutomorphicLFunctions-
AndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII,
PotentialAutomorphyInfrastructurePartII). They enter this file through the explicit supplier
interface `TauCeti.Langlands.Context` below, each field naming its owner, as proposed interfaces.
Independent review REV-ModularityAndLanglandsExtensions (2026-10-07)
found that several records admit incoherent data and that unnamed Prop fields hide essential
hypotheses. The packet is needs_changes. Elaboration checks syntax only; uncorrected signatures
below remain flagged sketches, not faithful theorem statements. In particular NT II Theorem 2.1,
Mok's packet multiplicities, ACC infinity comparison and FS I.10.2 require the revisions recorded
in the packet's per-node review. The incorrect p–r iff has been removed rather than retained
behind an arbitrary auxiliary proposition.
-/

set_option autoImplicit false
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

namespace TauCeti

namespace Langlands

/-- The supplier interface over a number field `F`: the objects other roadmaps own, as data. -/
structure Context (F : Type) [Field F] [NumberField F] where
  /-- Isomorphism classes of isobaric automorphic representations of `GL_n(𝔸_F)`
  (owner: AutomorphicFormsOnReductiveGroups AF.2, AutomorphicSpectralTheory AS.4). -/
  AutRep : ℕ → Type
  /-- Cuspidality (owner: AutomorphicFormsOnReductiveGroups AF.3). -/
  IsCuspidal : ∀ {n : ℕ}, AutRep n → Prop
  /-- Unitarity of the central character, so that `π` is unitary (owner: AF.2). -/
  IsUnitary : ∀ {n : ℕ}, AutRep n → Prop
  /-- Regular algebraicity (owner: AutomorphicFormsOnReductiveGroups AF.4). -/
  IsRegularAlgebraic : ∀ {n : ℕ}, AutRep n → Prop
  /-- Contragredient `π ↦ π^∨`. -/
  dual : ∀ {n : ℕ}, AutRep n → AutRep n
  /-- Isobaric sum `π₁ ⊞ π₂` (owner: AutomorphicLFunctionsAndLocalFactors AL.3). -/
  isobaricSum : ∀ {m n : ℕ}, AutRep m → AutRep n → AutRep (m + n)
  /-- Central character, a Hecke character `= AutRep 1`. -/
  centralChar : ∀ {n : ℕ}, AutRep n → AutRep 1
  /-- Twist `π ⊗ (χ ∘ det)`. -/
  twist : ∀ {n : ℕ}, AutRep n → AutRep 1 → AutRep n
  /-- The trivial Hecke character. -/
  one : AutRep 1
  /-- Places of `F`. -/
  Place : Type
  /-- Archimedean places. -/
  IsArchimedean : Place → Prop
  /-- `n`-dimensional Frobenius-semisimple L-parameters of the local Weil(–Deligne) group at `v`. -/
  LParam : Place → ℕ → Type
  /-- The local Langlands parameter of the local component `π_v` (owners: ET.6 for finite `v`,
  AF.1 for archimedean `v`). -/
  localParam : ∀ {n : ℕ}, AutRep n → (v : Place) → LParam v n
  /-- Unramified at `v`. -/
  IsUnramifiedAt : ∀ {n : ℕ}, AutRep n → Place → Prop
  /-- Partial L-function `L^S(s, π, R)` along a representation `R` of `GL_n`, as a meromorphic
  function given by its values off its poles (owner: AutomorphicLFunctionsAndLocalFactors). -/
  partialL : ∀ {n : ℕ}, AutRep n → (R : Type) → Finset Place → ℂ → ℂ

variable {F : Type} [Field F] [NumberField F]

/-- `f` has a pole at `s₀`: it has no finite limit there. -/
def HasPoleAt (f : ℂ → ℂ) (s₀ : ℂ) : Prop :=
  ¬ ∃ c : ℂ, Filter.Tendsto f (nhdsWithin s₀ {s₀}ᶜ) (nhds c)

/-- Labels for the representations `Sym²` and `∧²` of `GL_n` along which L-functions are taken. -/
inductive SquareRep
  | sym2
  | ext2

/-- The unordered sum `π ⊞ π` and the like are built with `Context.isobaricSum`; a cuspidal `π`
is self-dual when `π ≅ π^∨`. -/
def Context.IsSelfDual (C : Context F) {n : ℕ} (π : C.AutRep n) : Prop := C.dual π = π

end Langlands

end TauCeti


/-!
## Part G1: layers ML.0 (registers, conventions, Newton–Thorne automorphy, GSp₄ L-packets,
frontier statements) and ML.1 (weight one, Artin representations)

The supplier interfaces of this part extend `TauCeti.Langlands.Context`. Each field names the
roadmap/stage that owns it. Statements relating several supplier fields hold for the owners'
constructions; where such a statement would fail for arbitrary context data and the needed
coherence is not encoded in the fields, the coherence enters as an explicit hypothesis or is
flagged by a `-- NOTE:` comment.
-/

namespace TauCeti

namespace LanglandsRegister

variable {F : Type} [Field F] [NumberField F]

/-! ### Galois-side supplier data -/

/-- Galois-side supplier data over a number field `F`, for a fixed prime `ℓ` and a fixed
isomorphism `ι : Q̄_ℓ ≅ ℂ` (so that embeddings `F ↪ Q̄_ℓ` are identified with `F →+* ℂ`). -/
structure GaloisData (F : Type) [Field F] [NumberField F] extends Langlands.Context F where
  /-- The coefficient prime `ℓ` (owner: AutomorphicGaloisRepresentationsPartII AG2.0). -/
  ell : ℕ
  /-- `ℓ` is prime. -/
  ell_prime : ell.Prime
  /-- Continuous representations `G_F → GL_n(Q̄_ℓ)` (owner: AutomorphicGaloisRepresentationsPartII
  AG2.0). -/
  GalRep : ℕ → Type
  /-- Isomorphism of representations (owner: AG2.0). -/
  galSetoid : ∀ n : ℕ, Setoid (GalRep n)
  /-- The representation `r_{ℓ,ι}(π)` attached to a regular algebraic cuspidal polarizable `π`
  (owner: AutomorphicGaloisRepresentationsPartII AG2.2); for `n = 1` it is the Galois character
  of an algebraic Hecke character. Its value at other `π` carries no meaning. -/
  galOf : ∀ {n : ℕ}, AutRep n → GalRep n
  /-- Twist `ρ ⊗ χ` by a character (owner: AG2.0). -/
  galTwist : ∀ {n : ℕ}, GalRep n → GalRep 1 → GalRep n
  /-- Direct sum `ρ ⊕ ρ'` (owner: AG2.0). -/
  galSum : ∀ {m n : ℕ}, GalRep m → GalRep n → GalRep (m + n)
  /-- Dual `ρ^∨` (owner: AG2.0). -/
  galDual : ∀ {n : ℕ}, GalRep n → GalRep n
  /-- Conjugate `ρ^c = ρ(c · c⁻¹)` for the complex conjugation `c` of a CM field (the identity
  when `F` is totally real) (owner: AG2.0). -/
  galConj : ∀ {n : ℕ}, GalRep n → GalRep n
  /-- Symmetric power `Sym^k : GL₂ → GL_{k+1}` (owner: AG2.0). -/
  galSym : GalRep 2 → (k : ℕ) → GalRep (k + 1)
  /-- Powers `ε_ℓ^m` of the `ℓ`-adic cyclotomic character (owner: AG2.0). -/
  cycloPow : ℤ → GalRep 1
  /-- Irreducibility (owner: AG2.0). -/
  GalIrreducible : ∀ {n : ℕ}, GalRep n → Prop
  /-- Finite image (owner: AG2.0). -/
  HasFiniteImage : ∀ {n : ℕ}, GalRep n → Prop
  /-- Hodge–Tate weights `HT_τ(ρ)` with multiplicity, for `τ : F ↪ Q̄_ℓ ≅ ℂ`, in the convention
  where they are defined (owner: PadicHodgeTheory R06.2). -/
  hodgeTate : ∀ {n : ℕ}, GalRep n → (F →+* ℂ) → Multiset ℤ
  /-- Places above `ℓ`. -/
  AboveEll : Place → Prop
  /-- `ιWD(ρ|_{G_{F_v}})^{F-ss}` as an L-parameter at a finite place `v ∤ ℓ`, with uniformisers
  sent to geometric Frobenius elements (owner: AG2.0, local class field theory). -/
  wdAt : ∀ {n : ℕ}, GalRep n → (v : Place) → LParam v n
  /-- The weight `a ∈ (ℤ^n)^{Hom(F,ℂ)}` of a regular algebraic `π`: `π_∞` has the infinitesimal
  character of `Ξ_a^∨` (owner: AutomorphicFormsOnReductiveGroups AF.4). -/
  autWeight : ∀ {n : ℕ}, AutRep n → (F →+* ℂ) → Fin n → ℤ
  /-- The Hecke character `|·|^s` (owner: AF.2). -/
  normPow : ℂ → AutRep 1
  /-- Conjugate `π^c = π ∘ c` (the identity when `F` is totally real) (owner: AF.2). -/
  autConj : ∀ {n : ℕ}, AutRep n → AutRep n
  /-- Continuous characters `χ : 𝔸_{F⁺}^×/(F⁺)^× → ℂ^×` of the maximal totally real subfield
  (owner: AF.2). -/
  PlusChar : Type
  /-- `χ ↦ χ ∘ N_{F/F⁺}` (owner: AF.2). -/
  normPlus : PlusChar → AutRep 1
  /-- `χ_v(−1)` at the infinite place `v` of `F⁺` below `τ` (owner: AF.2). -/
  plusSign : PlusChar → (F →+* ℂ) → ℤˣ
  /-- `r_{ℓ,ι}(χ)|_{G_F}` for an algebraic `χ` of `F⁺` (owner: AG2.2). -/
  plusGal : PlusChar → GalRep 1
  /-- The cohomological realization `H¹_et(E, Q̄_ℓ)`, dual to the usual Tate module,
  in the convention `HT(ε_ℓ) = -1` (owner: ArithmeticGaloisRepresentations/AG2.0). -/
  ellipticH1Rep : WeierstrassCurve F → GalRep 2
  /-- `π` has complex multiplication (`π ≅ π ⊗ χ` for a non-trivial quadratic `χ`) (owner: AF.2). -/
  HasCM : ∀ {n : ℕ}, AutRep n → Prop

/-- Isomorphism of Galois representations. -/
instance GaloisData.instSetoidGalRep (G : GaloisData F) (n : ℕ) : Setoid (G.GalRep n) :=
  G.galSetoid n

/-- `(π, χ)` is polarized (BLGGT v4 §1.1): `χ_v(−1)` is independent of `v | ∞`,
`π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det)`. For pure weight `w`, the imaginary-CM sign is
`χ_v(−1) = (−1)^(n+w)` (reviewed AG2.0/E2), including the weight-zero special case. -/
def IsPolarized (G : GaloisData F) {n : ℕ} (π : G.AutRep n) (χ : G.PlusChar) : Prop :=
  (∀ τ τ' : F →+* ℂ, G.plusSign χ τ = G.plusSign χ τ') ∧
  G.autConj π = G.twist (G.dual π) (G.normPlus χ) ∧
  (NumberField.IsTotallyComplex F → ∃ w : ℤ,
    (∀ (τ : F →+* ℂ) (i : Fin n),
      G.autWeight π ((starRingEnd ℂ).comp τ) i + G.autWeight π τ i.rev = w) ∧
    ∀ τ : F →+* ℂ, G.plusSign χ τ = (-1) ^ ((n : ℤ) + w))

/-- The weight of `π` is dominant (`a_{τ,1} ≥ ⋯ ≥ a_{τ,n}`) and lies in `(ℤ^n)_w` for some `w`:
`a_{τc,i} + a_{τ,n+1−i} = w`. -/
def IsDominantPureWeight (G : GaloisData F) {n : ℕ} (π : G.AutRep n) : Prop :=
  (∀ τ : F →+* ℂ, Antitone (G.autWeight π τ)) ∧
  ∃ w : ℤ, ∀ (τ : F →+* ℂ) (i : Fin n),
    G.autWeight π ((starRingEnd ℂ).comp τ) i + G.autWeight π τ i.rev = w

/-- The Hodge–Tate weights BLGGT attach to a weight `a`:
`{a_{τ,1} + n − 1, a_{τ,2} + n − 2, …, a_{τ,n}}`. -/
def blggtHodgeTate (G : GaloisData F) {n : ℕ} (π : G.AutRep n) (τ : F →+* ℂ) : Multiset ℤ :=
  (Finset.univ : Finset (Fin n)).val.map fun i => G.autWeight π τ i + ((n : ℤ) - 1 - (i : ℕ))

end LanglandsRegister

namespace PotentialAutomorphy

open LanglandsRegister

variable {F : Type} [Field F] [NumberField F]

/-- `TauCeti.PotentialAutomorphy.normalizationRegister` (ML.0/blggt-normalization-register):
the conventions BLGGT (arXiv v4) fix, as the proposition that the Galois data `G` follows them.
(4) `HT_τ(ε_ℓ) = {−1}`; for every polarized regular algebraic cuspidal `(π, χ)`:
(2) the weight is dominant and in `(ℤ^n)_w`; (3) `(r_{ℓ,ι}(π), ε_ℓ^{1−n} r_{ℓ,ι}(χ))` is polarized,
`HT_τ(r_{ℓ,ι}(π)) = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}` and
`ιWD(r_{ℓ,ι}(π)|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{(1−n)/2})` for finite `v ∤ ℓ`.
Hypothesis of the node: `F` CM or totally real. -/
-- NOTE: (5) (independence of `ι`, Clozel Thm 3.13) and the clause at `v | ℓ` with Iwahori-fixed
-- vectors need several `ι` resp. `p`-adic Hodge data and are not encoded; the "totally odd"
-- part of (3) needs signs of `G_{F⁺}`-representations, also not encoded; the geometric-Frobenius
-- convention of (4) is the docstring convention of the field `wdAt`.
def normalizationRegister (G : GaloisData F) : Prop :=
  (∀ τ : F →+* ℂ, G.hodgeTate (G.cycloPow 1) τ = {-1}) ∧
  ∀ {n : ℕ} (π : G.AutRep n) (χ : G.PlusChar),
    G.IsRegularAlgebraic π → G.IsCuspidal π → IsPolarized G π χ →
      IsDominantPureWeight G π ∧
      G.galConj (G.galOf π) ≈
        G.galTwist (G.galDual (G.galOf π)) (G.galTwist (G.cycloPow (1 - n)) (G.plusGal χ)) ∧
      (∀ τ : F →+* ℂ, G.hodgeTate (G.galOf π) τ = blggtHodgeTate G π τ) ∧
      ∀ v : G.Place, ¬ G.IsArchimedean v → ¬ G.AboveEll v →
        G.wdAt (G.galOf π) v = G.localParam (G.twist π (G.normPow ((1 - (n : ℂ)) / 2))) v

/-- One row of the BLGGT version correspondence: the locator in arXiv v1 (if any) and in v4. -/
structure VersionRow where
  /-- Locator in arXiv v1 (2010); `none` when the v4 item is new. -/
  v1 : Option String
  /-- Locator in arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014). -/
  v4 : String
  deriving Repr

/-- `TauCeti.PotentialAutomorphy.versionRegister` (ML.0/blggt-version-register): the
correspondence between BLGGT arXiv v1 (cited by PotentialModularityAndCompatibleSystems R24.3) and
arXiv v4 (the version ML binds to). -/
def versionRegister : List VersionRow :=
  [ ⟨some "§2.2 (minimal lifting), Theorem 2.2.1", "§2.3, Theorem 2.3.1"⟩,
    ⟨some "§2.3 (ordinary lifting), Theorem 2.3.1",
      "§2.4, Theorem 2.4.1 (now also for totally real F)"⟩,
    ⟨none, "§2.2, Lemmas 2.2.1–2.2.4 (automorphy)"⟩,
    ⟨some "§5.2, Lemma 5.2.1, Proposition 5.2.2", "§5.3, Lemma 5.3.1, Proposition 5.3.2"⟩,
    ⟨some "Lemma 5.2.3", "Lemma 5.4.5"⟩,
    ⟨some "§5.3, Theorem 5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4",
      "§5.4, Theorem 5.4.1 with Corollary 5.4.2, Corollary 5.4.3, Corollary 5.4.4, " ++
        "Proposition 5.4.6"⟩,
    ⟨some "§5.4, Theorems 5.4.1–5.4.3", "§5.5, Theorems 5.5.1–5.5.3"⟩,
    ⟨none, "§5.2 (rational compatible systems)"⟩ ]

/-- Two rows of the version register are new in v4 (§2.2 and §5.2). -/
example : (versionRegister.filter fun r => r.v1.isNone).length = 2 := by decide

end PotentialAutomorphy

namespace LanglandsRegister

/-! ### ML.0/endpoint-status-register -/

/-- `TauCeti.LanglandsRegister.Status` (ML.0/endpoint-status-register): the three statuses. -/
inductive Status
  | known
  | conditional
  | conjectural
  deriving DecidableEq, Repr

/-- `TauCeti.LanglandsRegister.EndpointRecord` (ML.0/endpoint-status-register): a record
`(P, s, σ, H, D)` — statement, source locator, status, named hypotheses, producer nodes. The
status is backed by evidence: a known record carries a proof of `P` and no hypotheses, a
conditional one a proof of `(∀ h ∈ H, h) → P`; a conjectural one carries no proof. -/
structure EndpointRecord where
  /-- The statement `P`. -/
  statement : Prop
  /-- The selected source version and locator. -/
  source : String
  /-- The status `σ`. -/
  status : Status
  /-- The named hypotheses `H` of a conditional statement. -/
  hypotheses : List Prop
  /-- The producer nodes `D`. -/
  producers : List String
  /-- A known record has no hypotheses. -/
  known_nil : status = .known → hypotheses = []
  /-- The recorded proof: `P` follows from `H` unless the record is conjectural. -/
  evidence : status ≠ .conjectural → (∀ h ∈ hypotheses, h) → statement

namespace EndpointRecord

/-- `TauCeti.LanglandsRegister.EndpointRecord.holds_of_hypotheses`: for a conditional record,
`(∀ h ∈ H, h) → P`. -/
theorem holds_of_hypotheses (r : EndpointRecord) (hr : r.status = .conditional)
    (hH : ∀ h ∈ r.hypotheses, h) : r.statement :=
  r.evidence (by rw [hr]; decide) hH

/-- `TauCeti.LanglandsRegister.EndpointRecord.upgrade`: from a conditional record and proofs of
all its hypotheses, a known record with the same statement. -/
def upgrade (r : EndpointRecord) (hr : r.status = .conditional)
    (hH : ∀ h ∈ r.hypotheses, h) : EndpointRecord where
  statement := r.statement
  source := r.source
  status := .known
  hypotheses := []
  producers := r.producers
  known_nil := fun _ => rfl
  evidence := fun _ _ => r.holds_of_hypotheses hr hH

/-- The upgraded record keeps the statement. -/
theorem upgrade_statement (r : EndpointRecord) (hr : r.status = .conditional)
    (hH : ∀ h ∈ r.hypotheses, h) : (r.upgrade hr hH).statement = r.statement := rfl

/-- `TauCeti.LanglandsRegister.EndpointRecord.known_holds`: a known record yields a proof of `P`. -/
theorem known_holds (r : EndpointRecord) (hr : r.status = .known) : r.statement :=
  r.evidence (by rw [hr]; decide) (by rw [r.known_nil hr]; simp)

end EndpointRecord

/-- `TauCeti.LanglandsRegister.empty_hypotheses` (test, degenerate): a conditional record with
`H = []` holds outright, like a known record, and upgrades without further input. -/
theorem empty_hypotheses (r : EndpointRecord) (hr : r.status = .conditional)
    (hH : r.hypotheses = []) :
    r.statement ∧ (r.upgrade hr (by simp [hH])).status = .known :=
  ⟨r.holds_of_hypotheses hr (by simp [hH]), rfl⟩

/-- A conditional record from an implication `B → P` of named statements. -/
def conditionalRecord (P B : Prop) (src : String) (prod : List String) (h : B → P) :
    EndpointRecord where
  statement := P
  source := src
  status := .conditional
  hypotheses := [B]
  producers := prod
  known_nil := fun h' => by cases h'
  evidence := fun _ hH => h (hH B (by simp))

/-- `TauCeti.LanglandsRegister.cg18_conditional` (test, computation): the record of
Calegari–Geraghty Theorem 1.1(1), built from the implication `Conjecture B → P` of ML.2, has
status conditional with `H = [Conjecture B]`. -/
-- NOTE: the statement `P` and Conjecture B are ML.2 statements (another part of this packet);
-- here they are parameters, and the implication (CG18's proof) is an explicit hypothesis.
theorem cg18_conditional (P conjectureB : Prop) (hCG : conjectureB → P) :
    (conditionalRecord P conjectureB "CG18 Theorem 1.1(1)"
        ["ML.2/cg18-conditional-potential-modularity"] hCG).status = .conditional ∧
      (conditionalRecord P conjectureB "CG18 Theorem 1.1(1)"
        ["ML.2/cg18-conditional-potential-modularity"] hCG).hypotheses = [conjectureB] :=
  ⟨rfl, rfl⟩

end LanglandsRegister

end TauCeti

namespace TauCeti

namespace LanglandsRegister

/-! ### ML.0/arthur-dependency-gate -/

/-- The statements the Arthur gate registers, as supplied by their owners
(EndoscopicTransferAndUnitaryTraceComparison and the classification roadmaps). -/
structure ArthurInputs where
  /-- Arthur's endoscopic classification for quasi-split symplectic and orthogonal groups (2013)
  (owner: EndoscopicTransferAndUnitaryTraceComparison). -/
  arthurClassification : Prop
  /-- Mok's classification for quasi-split unitary groups (owner: EndoscopicTransfer…). -/
  mokUnitary : Prop
  /-- Kaletha–Mínguez–Shin–White for inner forms of unitary groups (owner: EndoscopicTransfer…). -/
  kmswInnerForms : Prop
  /-- Gee–Taïbi's classification for `GSp₄` (owner: ML.4 consumers / EndoscopicTransfer…). -/
  geeTaibiGSp4 : Prop
  /-- Xu's packets and multiplicity formula for `GSp_{2n}`. -/
  xuGSp : Prop
  /-- Ishimoto's classification for non-split odd orthogonal groups. -/
  ishimotoOrthogonal : Prop
  /-- The twisted weighted fundamental lemma [MW, II.4.4] (with its reduction to the weighted
  fundamental lemma for Lie algebras of non-split groups and its non-standard version). -/
  twistedWeightedFL : Prop

/-- The classifications gated by Arthur's hypothesis, with their sources. -/
def ArthurInputs.gated (A : ArthurInputs) : List (Prop × String) :=
  [ (A.arthurClassification, "Arthur 2013, Theorems 1.5.2, 2.2.1 (Hypothesis 3.2.1)"),
    (A.mokUnitary, "Mok 2015"),
    (A.kmswInnerForms, "Kaletha–Mínguez–Shin–White"),
    (A.geeTaibiGSp4, "Gee–Taïbi 2019"),
    (A.xuGSp, "Xu"),
    (A.ishimotoOrthogonal, "Ishimoto") ]

/-- `TauCeti.LanglandsRegister.arthurGate` (ML.0/arthur-dependency-gate): every classification
deduced from Arthur's book is recorded with status conditional and the single hypothesis the
twisted weighted fundamental lemma. The input `hred` is the published reduction (Arthur;
Mœglin–Waldspurger 2016 for the stabilisation and [A24]; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin
for [A25]–[A27]). -/
def arthurGate (A : ArthurInputs) (hred : ∀ c ∈ A.gated, A.twistedWeightedFL → c.1) :
    List EndpointRecord :=
  A.gated.attach.map fun c =>
    conditionalRecord c.1.1 A.twistedWeightedFL c.1.2
      ["ML.0/arthur-dependency-gate"] (hred c.1 c.2)

/-- Every record of the Arthur gate is conditional on exactly the twisted weighted fundamental
lemma; none is upgraded on the strength of the (proved) unweighted fundamental lemma. -/
theorem arthurGate_conditional (A : ArthurInputs)
    (hred : ∀ c ∈ A.gated, A.twistedWeightedFL → c.1) :
    ∀ r ∈ arthurGate A hred, r.status = .conditional ∧ r.hypotheses = [A.twistedWeightedFL] := by
  intro r hr
  simp only [arthurGate, List.mem_map] at hr
  obtain ⟨c, -, rfl⟩ := hr
  exact ⟨rfl, rfl⟩

/-- `TauCeti.LanglandsRegister.unitary_does_not_upgrade` (test, non-example): for a record
conditional on the Arthur gate, the input `upgrade` requires is a proof of the twisted weighted
fundamental lemma itself; a known record of Mok's unitary classification supplies a proof of
`A.mokUnitary`, which is not that input. -/
theorem unitary_does_not_upgrade (A : ArthurInputs) (r : EndpointRecord)
    (hr : r.hypotheses = [A.twistedWeightedFL]) (mok : EndpointRecord)
    (hmok : mok.statement = A.mokUnitary) (hk : mok.status = .known) :
    ((∀ h ∈ r.hypotheses, h) ↔ A.twistedWeightedFL) ∧ A.mokUnitary := by
  refine ⟨?_, ?_⟩
  · rw [hr]
    constructor
    · intro h
      exact h _ List.mem_cons_self
    · intro h x hx
      rw [List.mem_singleton] at hx
      exact hx ▸ h
  rw [← hmok]
  exact mok.known_holds hk

/-! ### ML.0/archimedean-langlands-conventions -/

/-- The archimedean fields `ℝ` and `ℂ`. -/
inductive ArchField
  | real
  | complex
  deriving DecidableEq

/-- Archimedean supplier data. -/
structure ArchData where
  /-- Isomorphism classes of irreducible admissible `(Lie GL_n(K) ⊗_ℝ ℂ, O(n))`-modules for
  `K = ℝ` (resp. `U(n)` for `K = ℂ`) (owner: AutomorphicFormsOnReductiveGroups AF.1). -/
  HCMod : ArchField → ℕ → Type
  /-- Isomorphism classes of continuous semisimple `n`-dimensional representations of the Weil
  group `W_K` (owner: ClassFieldTheory layer 11, AF.1). -/
  WeilRep : ArchField → ℕ → Type
  /-- Langlands' classification, a bijection on isomorphism classes (owner: AF.1, Langlands
  1973). -/
  langlands : ∀ (K : ArchField) (n : ℕ), HCMod K n ≃ WeilRep K n
  /-- Direct sum of Weil-group representations. -/
  weilSum : ∀ {K : ArchField} {m n : ℕ}, WeilRep K m → WeilRep K n → WeilRep K (m + n)
  /-- Twist of a Weil-group representation by a character. -/
  weilTwist : ∀ {K : ArchField} {n : ℕ}, WeilRep K n → WeilRep K 1 → WeilRep K n
  /-- Dual of a Weil-group representation. -/
  weilDual : ∀ {K : ArchField} {n : ℕ}, WeilRep K n → WeilRep K n
  /-- Irreducibility of a Weil-group representation. -/
  WeilIrreducible : ∀ {K : ArchField} {n : ℕ}, WeilRep K n → Prop
  /-- Restriction from `W_ℝ` to `W_ℂ = ℂ^×`. -/
  restrictWC : ∀ {n : ℕ}, WeilRep .real n → WeilRep .complex n
  /-- The twist `π ⊗ (χ ∘ det)` of modules. -/
  hcTwist : ∀ {K : ArchField} {n : ℕ}, HCMod K n → HCMod K 1 → HCMod K n
  /-- The contragredient module. -/
  hcDual : ∀ {K : ArchField} {n : ℕ}, HCMod K n → HCMod K n
  /-- `χ ↦ χ ∘ Art_K^{−1}` from characters of `K^×` to characters of `W_K`, with `Art_ℝ`, `Art_ℂ`
  the unique continuous surjections `ℝ^× ↠ Gal(ℂ/ℝ)`, `ℂ^× ↠ Gal(ℂ/ℂ)` lifted to `W_K^{ab} ≅ K^×`
  (owner: ClassFieldTheory layer 11). -/
  artinPullback : ∀ K : ArchField, HCMod K 1 → WeilRep K 1
  /-- `χ ↦ χ ∘ N_{ℂ/ℝ}` on characters. -/
  normPullback : HCMod .real 1 → HCMod .complex 1
  /-- The character `x ↦ |x|^s sgn(x)^δ` of `ℝ^×`, with `ε = (−1)^δ`. -/
  realChar : ℂ → ℤˣ → HCMod .real 1
  /-- The character of `W_ℝ` equal to `z ↦ (z z̄)^s` on `W_ℂ = ℂ^×` and sending `j` to `ε`. -/
  weilCharR : ℂ → ℤˣ → WeilRep .real 1
  /-- The trivial module of `GL_n(K)`. -/
  trivialMod : ∀ (K : ArchField) (n : ℕ), HCMod K n
  /-- The discrete series `D_k` of `GL₂(ℝ)` (`k ≥ 2`). -/
  discreteSeries : ℕ → HCMod .real 2

variable (A : ArchData)

/-- `TauCeti.LanglandsRegister.recArch` (ML.0/archimedean-langlands-conventions): `rec_K` from
irreducible admissible `GL_n(K)`-modules to semisimple `n`-dimensional `W_K`-representations,
`K = ℝ, ℂ`. (ACC+ print the labels `rec_ℝ` and `rec_ℂ` interchanged: a source issue.) -/
def recArch (K : ArchField) {n : ℕ} (π : A.HCMod K n) : A.WeilRep K n := A.langlands K n π

/-- `TauCeti.LanglandsRegister.recArch_bijective`: `rec_K` is a bijection onto isomorphism
classes. -/
theorem recArch_bijective (K : ArchField) (n : ℕ) :
    Function.Bijective (recArch A K (n := n)) :=
  (A.langlands K n).bijective

/-- `TauCeti.LanglandsRegister.recArch_gl1`: for `n = 1`, `rec_K(χ) = χ ∘ Art_K^{−1}`. -/
theorem recArch_gl1 (K : ArchField) (χ : A.HCMod K 1) :
    recArch A K χ = A.artinPullback K χ := by
  sorry

/-- `TauCeti.LanglandsRegister.isobaricSum`: `π₁ ⊞ π₂`, defined by
`rec_K(π₁ ⊞ π₂) = rec_K(π₁) ⊕ rec_K(π₂)`. -/
def isobaricSum {K : ArchField} {m n : ℕ} (π₁ : A.HCMod K m) (π₂ : A.HCMod K n) :
    A.HCMod K (m + n) :=
  (A.langlands K (m + n)).symm (A.weilSum (recArch A K π₁) (recArch A K π₂))

/-- The defining property of `⊞`. -/
theorem recArch_isobaricSum {K : ArchField} {m n : ℕ} (π₁ : A.HCMod K m) (π₂ : A.HCMod K n) :
    recArch A K (isobaricSum A π₁ π₂) = A.weilSum (recArch A K π₁) (recArch A K π₂) := by
  simp [recArch, isobaricSum]

/-- `TauCeti.LanglandsRegister.baseChangeCR`: `BC_{ℂ/ℝ}(π)`, defined by
`rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}`. -/
def baseChangeCR {n : ℕ} (π : A.HCMod .real n) : A.HCMod .complex n :=
  (A.langlands .complex n).symm (A.restrictWC (recArch A .real π))

/-- The defining property of `BC_{ℂ/ℝ}`. -/
theorem recArch_baseChangeCR {n : ℕ} (π : A.HCMod .real n) :
    recArch A .complex (baseChangeCR A π) = A.restrictWC (recArch A .real π) := by
  simp [recArch, baseChangeCR]

/-- `TauCeti.LanglandsRegister.recArch_twist`: `rec_K(π ⊗ (χ ∘ det)) = rec_K(π) ⊗ rec_K(χ)`. -/
theorem recArch_twist (K : ArchField) {n : ℕ} (π : A.HCMod K n) (χ : A.HCMod K 1) :
    recArch A K (A.hcTwist π χ) = A.weilTwist (recArch A K π) (recArch A K χ) := by
  sorry

/-- `TauCeti.LanglandsRegister.recArch_dual`: `rec_K(π^∨) = rec_K(π)^∨`. -/
theorem recArch_dual (K : ArchField) {n : ℕ} (π : A.HCMod K n) :
    recArch A K (A.hcDual π) = A.weilDual (recArch A K π) := by
  sorry

/-- `TauCeti.LanglandsRegister.recArch_sign` (test, computation): `rec_ℝ(sgn)` is the character of
`W_ℝ` trivial on `W_ℂ = ℂ^×` sending `j` to `−1`. -/
theorem recArch_sign : recArch A .real (A.realChar 0 (-1)) = A.weilCharR 0 (-1) := by
  sorry

/-- `TauCeti.LanglandsRegister.recArch_trivial_gl2` (test, computation):
`rec_ℝ(1_{GL₂(ℝ)}) = |·|^{1/2} ⊕ |·|^{−1/2}`. -/
theorem recArch_trivial_gl2 :
    recArch A .real (A.trivialMod .real 2) =
      A.weilSum (A.weilCharR (1 / 2) 1) (A.weilCharR (-1 / 2) 1) := by
  sorry

/-- `TauCeti.LanglandsRegister.baseChange_gl1` (test, degenerate): `BC_{ℂ/ℝ}(χ) = χ ∘ N_{ℂ/ℝ}`. -/
theorem baseChange_gl1 (χ : A.HCMod .real 1) : baseChangeCR A χ = A.normPullback χ := by
  sorry

/-- `TauCeti.LanglandsRegister.discreteSeries_not_isobaric` (test, non-example): for `k ≥ 2`,
`rec_ℝ(D_k)` is irreducible of dimension 2, so `D_k` is not an isobaric sum of characters, while
`BC_{ℂ/ℝ}(D_k)` is. -/
theorem discreteSeries_not_isobaric (k : ℕ) (hk : 2 ≤ k) :
    A.WeilIrreducible (recArch A .real (A.discreteSeries k)) ∧
      (¬ ∃ χ₁ χ₂ : A.HCMod .real 1, A.discreteSeries k = isobaricSum A χ₁ χ₂) ∧
      ∃ μ₁ μ₂ : A.HCMod .complex 1, baseChangeCR A (A.discreteSeries k) = isobaricSum A μ₁ μ₂ := by
  sorry

end LanglandsRegister

end TauCeti

namespace TauCeti

namespace LanglandsRegister

variable {F : Type} [Field F] [NumberField F]

/-! ### ML.0/compatible-system-archimedean-factors -/

/-- Label of the standard representation of `GL_n`, for `Context.partialL`. -/
inductive StdLabel
  | std

/-- Supplier data for weakly compatible systems over `F` (owner:
PotentialModularityAndCompatibleSystems R24.5:operations), on top of the Galois data. -/
structure CompatibleSystemData (F : Type) [Field F] [NumberField F] extends GaloisData F where
  /-- Weakly compatible systems `R = (M, S, {Q_v(X)}, {r_λ}, {H_τ})` of rank `n`. -/
  System : ℕ → Type
  /-- `Q_v(X)`, mapped to `ℂ[X]` by `ι`. -/
  charPoly : ∀ {n : ℕ}, System n → Place → Polynomial ℂ
  /-- The exceptional finite set `S` of the system. -/
  exceptional : ∀ {n : ℕ}, System n → Finset Place
  /-- `R` is pure of weight `w`. -/
  IsPure : ∀ {n : ℕ}, System n → ℤ → Prop
  /-- The residue cardinality `q_v` of a finite place. -/
  residueCard : Place → ℕ
  /-- The finite local factor `L_v(R, s)` at `v ∈ S` (from `WD(r_λ|_{G_{F_v}})^{F-ss}`). -/
  badFactor : ∀ {n : ℕ}, System n → Place → ℂ → ℂ
  /-- Real places. -/
  IsRealPlace : Place → Prop
  /-- The Hodge numbers `h^{p,q}` at an infinite place `v`, read off from `H_τ` for `τ | v`. -/
  hodge : ∀ {n : ℕ}, System n → Place → (ℤ × ℤ) →₀ ℕ
  /-- At a real place: `(h^{p,+}, h^{p,−})`, the multiplicities of the eigenvalues `(−1)^p` and
  `(−1)^{p+1}` of complex conjugation on `H^{p,p}` (independent of `λ`). -/
  hodgeSign : ∀ {n : ℕ}, System n → Place → ℤ →₀ (ℕ × ℕ)
  /-- Direct sum `R ⊕ R′`. -/
  sysSum : ∀ {m n : ℕ}, System m → System n → System (m + n)
  /-- Tate twist `R(1)` (by the cyclotomic character). -/
  sysTate : ∀ {n : ℕ}, System n → System n
  /-- The trivial rank-one system. -/
  sysTrivial : System 1
  /-- The zero system. -/
  sysZero : System 0
  /-- `H¹` of an elliptic curve over `F`. -/
  ellipticH1 : WeierstrassCurve F → System 2
  /-- The compatible system `R_π` of a regular algebraic cuspidal `π` (owner:
  AutomorphicGaloisRepresentationsPartII AG2.2). -/
  systemOf : ∀ {n : ℕ}, AutRep n → System n
  /-- The member `r_λ` of `R` at the fixed `(ℓ, ι)`. -/
  member : ∀ {n : ℕ}, System n → GalRep n
  /-- The archimedean factor `L_v(π_v, s)` of an automorphic representation (owner:
  AutomorphicLFunctionsAndLocalFactors AL.2). -/
  autArchFactor : ∀ {n : ℕ}, AutRep n → Place → ℂ → ℂ

variable (S : CompatibleSystemData F)

/-- `TauCeti.LanglandsRegister.partialL`: `L^T(R, s) = ∏_{v ∉ T} q_v^{n*s}/Q_v(q_v^s)` for monic characteristic polynomials
`Q_v(X)=det(X−Frob_v)` (import of R24.5/system-l-functions) (finite
places outside `T`); it converges for `Re s > 1 + w/2`. -/
def partialL {n : ℕ} (R : S.System n) (T : Finset S.Place) (s : ℂ) : ℂ :=
  ∏' v : {v : S.Place // ¬ S.IsArchimedean v ∧ v ∉ T},
    ((S.residueCard v.1 : ℂ) ^ ((n : ℂ) * s)) /
      (S.charPoly R v.1).eval ((S.residueCard v.1 : ℂ) ^ s)

open Classical in
/-- `TauCeti.LanglandsRegister.archimedeanFactor`: `L_v(R, s)` for `v | ∞`, with
`Γ_ℝ(s) = π^{−s/2}Γ(s/2)` and `Γ_ℂ(s) = 2(2π)^{−s}Γ(s)`: at a real place
`∏_{p<q} Γ_ℂ(s − p)^{h^{p,q}} · ∏_p Γ_ℝ(s − p)^{h^{p,+}} Γ_ℝ(s − p + 1)^{h^{p,−}}`, at a complex
place `∏_{p,q} Γ_ℂ(s − min(p,q))^{h^{p,q}}`. -/
def archimedeanFactor {n : ℕ} (R : S.System n) (v : S.Place) (s : ℂ) : ℂ :=
  if S.IsRealPlace v then
    ((S.hodge R v).prod fun pq h =>
        if pq.1 < pq.2 then Complex.Gammaℂ (s - (pq.1 : ℂ)) ^ h else 1) *
      (S.hodgeSign R v).prod fun p e =>
        Complex.Gammaℝ (s - (p : ℂ)) ^ e.1 * Complex.Gammaℝ (s - (p : ℂ) + 1) ^ e.2
  else
    (S.hodge R v).prod fun pq h => Complex.Gammaℂ (s - ((min pq.1 pq.2 : ℤ) : ℂ)) ^ h

open Classical in
/-- `TauCeti.LanglandsRegister.completedL` (ML.0/compatible-system-archimedean-factors):
`Λ(R, s) = L^S(R, s) · ∏_{v ∈ S finite} L_v(R, s) · ∏_{v | ∞} L_v(R, s)`. -/
def completedL {n : ℕ} (R : S.System n) (s : ℂ) : ℂ :=
  partialL S R (S.exceptional R) s *
    (∏ v ∈ (S.exceptional R).filter (fun v => ¬ S.IsArchimedean v), S.badFactor R v s) *
    ∏ᶠ (v : S.Place) (_ : S.IsArchimedean v), archimedeanFactor S R v s

/-- `TauCeti.LanglandsRegister.partialL_converges`: for `R` pure of weight `w` the Euler product
converges (absolutely) for `Re s > 1 + w/2`. -/
theorem partialL_converges {n : ℕ} (R : S.System n) (w : ℤ) (hR : S.IsPure R w)
    (T : Finset S.Place) (hT : S.exceptional R ⊆ T) (s : ℂ) (hs : 1 + (w : ℝ) / 2 < s.re) :
    Multipliable fun v : {v : S.Place // ¬ S.IsArchimedean v ∧ v ∉ T} =>
      ((S.residueCard v.1 : ℂ) ^ ((n : ℂ) * s)) /
      (S.charPoly R v.1).eval ((S.residueCard v.1 : ℂ) ^ s) := by
  sorry

/-- `TauCeti.LanglandsRegister.archimedeanFactor_directSum`:
`L_v(R ⊕ R′, s) = L_v(R, s) · L_v(R′, s)`. -/
-- NOTE: the additivity of the Hodge data under `⊕` (hypotheses `hh`, `hσ`) is part of the
-- supplier's definition of `⊕`; it is not encoded in the fields, so it is an explicit hypothesis.
theorem archimedeanFactor_directSum {m n : ℕ} (R : S.System m) (R' : S.System n) (v : S.Place)
    (hh : S.hodge (S.sysSum R R') v = S.hodge R v + S.hodge R' v)
    (hσ : S.hodgeSign (S.sysSum R R') v = S.hodgeSign R v + S.hodgeSign R' v) (s : ℂ) :
    archimedeanFactor S (S.sysSum R R') v s =
      archimedeanFactor S R v s * archimedeanFactor S R' v s := by
  sorry

/-- `TauCeti.LanglandsRegister.archimedeanFactor_tate`: `L_v(R(1), s) = L_v(R, s + 1)`. -/
-- NOTE: the shift `h^{p,q}(R(1)) = h^{p+1,q+1}(R)` (Hodge–Tate weight of `ε` is `−1`) is the
-- supplier's definition of `R(1)`, taken as the hypotheses `hh`, `hσ`.
theorem archimedeanFactor_tate {n : ℕ} (R : S.System n) (v : S.Place)
    (hh : S.hodge (S.sysTate R) v = (S.hodge R v).mapDomain fun pq => (pq.1 - 1, pq.2 - 1))
    (hσ : S.hodgeSign (S.sysTate R) v = (S.hodgeSign R v).mapDomain fun p => p - 1) (s : ℂ) :
    archimedeanFactor S (S.sysTate R) v s = archimedeanFactor S R v (s + 1) := by
  sorry

/-- `TauCeti.LanglandsRegister.archFactor_trivial_Q` (test, computation): for the trivial
character of `G_ℚ`, `L_∞(R, s) = Γ_ℝ(s)` and `Λ(R, s) = π^{−s/2}Γ(s/2)ζ(s)` (for `Re s > 1`, where
the Euler product is the definition). -/
theorem archFactor_trivial_Q (S : CompatibleSystemData ℚ) (v : S.Place)
    (hv : S.IsRealPlace v) (hinf : ∀ w, S.IsArchimedean w ↔ w = v)
    (hh : S.hodge S.sysTrivial v = Finsupp.single (0, 0) 1)
    (hσ : S.hodgeSign S.sysTrivial v = Finsupp.single 0 (1, 0))
    (hP : ∃ e : {w : S.Place // ¬ S.IsArchimedean w} ≃ Nat.Primes,
      ∀ w, S.residueCard w.1 = (e w : ℕ))
    (hQ : ∀ w, ¬ S.IsArchimedean w → S.charPoly S.sysTrivial w = Polynomial.X - 1)
    (hS : S.exceptional S.sysTrivial = ∅) (s : ℂ) (hs : 1 < s.re) :
    archimedeanFactor S S.sysTrivial v s = Complex.Gammaℝ s ∧
      completedL S S.sysTrivial s = Complex.Gammaℝ s * riemannZeta s := by
  sorry

/-- `TauCeti.LanglandsRegister.archFactor_ellipticCurve` (test, computation): for `R = H¹` of an
elliptic curve over `ℚ` (Hodge numbers `h^{1,0} = h^{0,1} = 1`), `L_∞(R, s) = Γ_ℂ(s)`. -/
theorem archFactor_ellipticCurve (S : CompatibleSystemData ℚ) (E : WeierstrassCurve ℚ)
    [E.IsElliptic] (v : S.Place) (hv : S.IsRealPlace v)
    (hh : S.hodge (S.ellipticH1 E) v = Finsupp.single (1, 0) 1 + Finsupp.single (0, 1) 1)
    (hσ : S.hodgeSign (S.ellipticH1 E) v = 0) (s : ℂ) :
    archimedeanFactor S (S.ellipticH1 E) v s = Complex.Gammaℂ s := by
  sorry

/-- `TauCeti.LanglandsRegister.archFactor_sign_character` (test, non-example): for the quadratic
character of `ℚ(i)` (complex conjugation acts by `−1`), `L_∞ = Γ_ℝ(s + 1)`, not `Γ_ℝ(s)`. -/
theorem archFactor_sign_character (S : CompatibleSystemData ℚ) (R : S.System 1) (v : S.Place)
    (hv : S.IsRealPlace v) (hh : S.hodge R v = Finsupp.single (0, 0) 1)
    (hσ : S.hodgeSign R v = Finsupp.single 0 (0, 1)) :
    (∀ s, archimedeanFactor S R v s = Complex.Gammaℝ (s + 1)) ∧
      (fun s => archimedeanFactor S R v s) ≠ Complex.Gammaℝ := by
  sorry

/-- `TauCeti.LanglandsRegister.partialL_rank_zero` (test, degenerate): the zero system has
`L^S = 1` and `Λ = 1`. -/
theorem partialL_rank_zero (hQ : ∀ v, S.charPoly S.sysZero v = 1)
    (hh : ∀ v, S.hodge S.sysZero v = 0) (hσ : ∀ v, S.hodgeSign S.sysZero v = 0)
    (hbad : ∀ v s, S.badFactor S.sysZero v s = 1) (T : Finset S.Place) (s : ℂ) :
    partialL S S.sysZero T s = 1 ∧ completedL S S.sysZero s = 1 := by
  sorry

/-! ### ML.0/compatible-system-automorphic-l-function-comparison -/

/-- `TauCeti.LanglandsRegister.completedL_automorphic`
(ML.0/compatible-system-automorphic-l-function-comparison): for `π` regular algebraic cuspidal
with compatible system `R_π` and `T` containing the ramification of `π` and `R_π`,
`L^T(R_π, s) = L^T(π, s + (1 − n)/2)` on a right half-plane and
`L_v(R_π, s) = L_v(π_v, s + (1 − n)/2)` for `v | ∞`; hence `Λ(R_π, s)` inherits the meromorphic
continuation and functional equation of `Λ(π, s)`. -/
-- NOTE: the local–global compatibility at `v ∉ T` enters through the BLGGT normalisation
-- `hnorm` and the identification `hmem` of the member of `R_π`; that `Q_v` is the characteristic
-- polynomial of Frobenius on that member is the supplier's (R24.5) definition of a system.
theorem completedL_automorphic
    (hF : NumberField.IsTotallyReal F ∨ NumberField.IsCMField F)
    (hnorm : PotentialAutomorphy.normalizationRegister S.toGaloisData)
    {n : ℕ} (π : S.AutRep n) (hra : S.IsRegularAlgebraic π) (hc : S.IsCuspidal π)
    (hmem : S.member (S.systemOf π) ≈ S.galOf π)
    (T : Finset S.Place) (hT : S.exceptional (S.systemOf π) ⊆ T)
    (hram : ∀ v, ¬ S.IsArchimedean v → v ∉ T → S.IsUnramifiedAt π v) :
    (∃ σ₀ : ℝ, ∀ s : ℂ, σ₀ < s.re →
      partialL S (S.systemOf π) T s = S.partialL π StdLabel T (s + (1 - (n : ℂ)) / 2)) ∧
    ∀ v, S.IsArchimedean v → ∀ s : ℂ,
      archimedeanFactor S (S.systemOf π) v s = S.autArchFactor π v (s + (1 - (n : ℂ)) / 2) := by
  sorry

/-! ### ML.0/nt26-automorphy-predicate and ML.0/nt26-normalisation-bridge -/

/-- `π` is essentially (conjugate) self-dual: `π^c ≅ π^∨ ⊗ χ` for a Hecke character `χ` (RAESDC
for `F` totally real, where `π^c = π`; RAECSDC for `F` CM). -/
def IsEssentiallyConjSelfDual (G : GaloisData F) {n : ℕ} (π : G.AutRep n) : Prop :=
  ∃ χ : G.AutRep 1, G.autConj π = G.twist (G.dual π) χ

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT` (ML.0/nt26-automorphy-predicate): `ρ ≅ r_ι(π)`
for a RAESDC or RAECSDC (regular algebraic, essentially (conjugate) self-dual, cuspidal) `π`.
Hypothesis of the node: `F` totally real or CM. -/
def IsAutomorphicNT (G : GaloisData F) {n : ℕ} (ρ : G.GalRep n) : Prop :=
  ∃ π : G.AutRep n, G.IsRegularAlgebraic π ∧ G.IsCuspidal π ∧ IsEssentiallyConjSelfDual G π ∧
    ρ ≈ G.galOf π

/-- Automorphy of a polarized `(ρ, μ)` in BLGGT's sense: `(ρ, μ) ≅ (r_ι(π), ε^{1−n} r_ι(χ))` for a
polarized regular algebraic cuspidal `(π, χ)`. -/
def IsAutomorphicBLGGT (G : GaloisData F) {n : ℕ} (ρ : G.GalRep n) (μ : G.GalRep 1) : Prop :=
  ∃ (π : G.AutRep n) (χ : G.PlusChar), G.IsRegularAlgebraic π ∧ G.IsCuspidal π ∧
    IsPolarized G π χ ∧ ρ ≈ G.galOf π ∧ μ ≈ G.galTwist (G.cycloPow (1 - n)) (G.plusGal χ)

namespace IsAutomorphicNT

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso`: invariance under isomorphism of `ρ`. -/
theorem of_iso (G : GaloisData F) {n : ℕ} {ρ ρ' : G.GalRep n} (h : IsAutomorphicNT G ρ)
    (e : ρ ≈ ρ') : IsAutomorphicNT G ρ' := by
  obtain ⟨π, h1, h2, h3, h4⟩ := h
  exact ⟨π, h1, h2, h3, Setoid.trans (Setoid.symm e) h4⟩

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.twist`: `ρ` automorphic and `χ` an algebraic
Hecke character ⇒ `ρ ⊗ r_ι(χ)` automorphic. -/
theorem twist (G : GaloisData F) (hnorm : PotentialAutomorphy.normalizationRegister G)
    {n : ℕ} {ρ : G.GalRep n} (h : IsAutomorphicNT G ρ) (χ : G.AutRep 1)
    (hχ : G.IsRegularAlgebraic χ) : IsAutomorphicNT G (G.galTwist ρ (G.galOf χ)) := by
  sorry

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt`: for polarized `(ρ, μ)` with `ρ`
irreducible, `IsAutomorphicNT ρ ↔ (ρ, μ)` is automorphic in BLGGT's sense. -/
-- NOTE: irreducibility is added: it makes `μ` determined by `ρ` (for reducible `ρ` several `μ`
-- can polarize `ρ`, and only one of them need come from `π`).
theorem iff_blggt (G : GaloisData F) (hF : NumberField.IsTotallyReal F ∨ NumberField.IsCMField F)
    (hnorm : PotentialAutomorphy.normalizationRegister G) {n : ℕ} (ρ : G.GalRep n)
    (μ : G.GalRep 1) (hpol : G.galConj ρ ≈ G.galTwist (G.galDual ρ) μ)
    (hirr : G.GalIrreducible ρ) :
    IsAutomorphicNT G ρ ↔ IsAutomorphicBLGGT G ρ μ := by
  sorry

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible`: the expectation (not part of the
definition) that automorphic `ρ` in this sense are irreducible. A proposition, not asserted. -/
def irreducible (G : GaloisData F) : Prop :=
  ∀ {n : ℕ} (ρ : G.GalRep n), IsAutomorphicNT G ρ → G.GalIrreducible ρ

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.ellipticCurve` (test, computation): for `E/ℚ` an
elliptic curve, `H¹_et(E, Q̄_ℓ)` is automorphic (BCDT), with `π` of weight 2. -/
theorem ellipticCurve (G : GaloisData ℚ) (hnorm : PotentialAutomorphy.normalizationRegister G)
    (E : WeierstrassCurve ℚ) [E.IsElliptic] : IsAutomorphicNT G (G.ellipticH1Rep E) := by
  sorry

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.character` (test, degenerate): for `n = 1`, `ρ` is
automorphic iff `ρ = r_ι(χ)` for an algebraic Hecke character `χ`. -/
theorem character (G : GaloisData F) (hnorm : PotentialAutomorphy.normalizationRegister G)
    (ρ : G.GalRep 1) :
    IsAutomorphicNT G ρ ↔ ∃ χ : G.AutRep 1, G.IsRegularAlgebraic χ ∧ ρ ≈ G.galOf χ := by
  sorry

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.reducible_not` (test, non-example):
`1 ⊕ ε_ℓ^{−1}` is not automorphic in this sense (the matching `π` is an isobaric sum, not
cuspidal). -/
theorem reducible_not (G : GaloisData F) (hnorm : PotentialAutomorphy.normalizationRegister G) :
    ¬ IsAutomorphicNT G (G.galSum (G.cycloPow 0) (G.cycloPow (-1))) := by
  sorry

/-- `TauCeti.LanglandsRegister.IsAutomorphicNT.weightOne_not` (test, non-example): the Galois
representation of a weight-one newform (finite image, Hodge–Tate weights `(0, 0)`) is not
automorphic in this sense: the `π` would not be regular algebraic. -/
theorem weightOne_not (G : GaloisData ℚ) (hnorm : PotentialAutomorphy.normalizationRegister G)
    (ρ : G.GalRep 2) (hfin : G.HasFiniteImage ρ) : ¬ IsAutomorphicNT G ρ := by
  sorry

end IsAutomorphicNT

/-- `TauCeti.LanglandsRegister.ntBridge` (ML.0/nt26-normalisation-bridge): Newton–Thorne's
normalisations (geometric Frobenius, `HT(ε) = −1`, `WD(r_ι(π)|_{G_{F_v}})^{F-ss} ≅
rec^T_{F_v}(ι^{−1}π_v) = rec_{F_v}(ι^{−1}π_v ⊗ |det|^{(1−n)/2})`) are BLGGT's
(`normalizationRegister`). The optional `rAtlas ≈ galDual (galOf π)` dictionary below
is an additional realization hypothesis awaiting an exact IHG.3/R19 supplier. Changing Frobenius
terminology alone does not imply it. Only an actual duality dictionary changes Hodge–Tate signs. -/
def ntBridge (G : GaloisData F) (rAtlas : ∀ {n : ℕ}, G.AutRep n → G.GalRep n) : Prop :=
  PotentialAutomorphy.normalizationRegister G ∧
  (∀ {n : ℕ} (π : G.AutRep n), G.IsRegularAlgebraic π → G.IsCuspidal π →
    rAtlas π ≈ G.galDual (G.galOf π)) ∧
  ∀ {n : ℕ} (ρ : G.GalRep n) (τ : F →+* ℂ),
    G.hodgeTate (G.galDual ρ) τ = (G.hodgeTate ρ τ).map Neg.neg

/-- Newton–Thorne II, Theorem A: for `π` regular algebraic cuspidal on `GL₂(𝔸_ℚ)` without CM,
every `Sym^k r_ι(π)` is automorphic. -/
def ntIIStatement (G : GaloisData ℚ) : Prop :=
  ∀ π : G.AutRep 2, G.IsRegularAlgebraic π → G.IsCuspidal π → ¬ G.HasCM π →
    ∀ k : ℕ, IsAutomorphicNT G (G.galSym (G.galOf π) k)

/-- The endpoint record of Newton–Thorne II Theorem A. -/
-- NOTE: a known record carries a proof; the proof (NT II) is the explicit argument `hA`, as the
-- context data do not know it.
def ntIIRecord (G : GaloisData ℚ) (hA : ntIIStatement G) : EndpointRecord where
  statement := ntIIStatement G
  source := "Newton–Thorne, Symmetric power functoriality for holomorphic modular forms II, " ++
    "Theorem A"
  status := .known
  hypotheses := []
  producers := ["ML.3"]
  known_nil := fun _ => rfl
  evidence := fun _ _ => hA

/-- `TauCeti.LanglandsRegister.ntII_known` (test, computation): the record of Newton–Thorne II
Theorem A has status known and no hypotheses. -/
theorem ntII_known (G : GaloisData ℚ) (hA : ntIIStatement G) :
    (ntIIRecord G hA).status = .known ∧ (ntIIRecord G hA).hypotheses = [] :=
  ⟨rfl, rfl⟩

end LanglandsRegister

end TauCeti

namespace TauCeti

namespace LanglandsRegister

/-! ### ML.0/gsp4-galois-l-packet -/

/-- Local supplier data at a finite extension `K/ℚ_l`, with coefficients `Q̄_p ≅ ℂ` via a fixed
`ı`, `p ≠ l`. -/
structure GSp4LocalData where
  /-- The residue characteristic `l` of `K`. -/
  l : ℕ
  /-- The coefficient characteristic `p`. -/
  p : ℕ
  /-- `l` is prime. -/
  l_prime : l.Prime
  /-- `p` is prime. -/
  p_prime : p.Prime
  /-- `p ≠ l`. -/
  p_ne_l : p ≠ l
  /-- The residue cardinality `q` of `K` (a power of `l`). -/
  q : ℕ
  /-- Isomorphism classes of irreducible smooth `Q̄_p`-representations of `GSp₄(K)` (owner:
  GL2AutomorphicRepresentationsAndTransfer R16.3). -/
  GSpRep : Type
  /-- Isomorphism classes of irreducible admissible representations of `GL_n(K)` (owner: R16.3). -/
  GLRep : ℕ → Type
  /-- Continuous `ρ : G_K → GSp₄(Q̄_p)` up to `GSp₄(Q̄_p)`-conjugacy (owner: ClassFieldTheory
  layer 7). -/
  GalGSp : Type
  /-- Frobenius-semisimple `GSp₄`-valued Weil–Deligne representations up to conjugacy (owner:
  ClassFieldTheory layer 7). -/
  WD : Type
  /-- Frobenius-semisimple `n`-dimensional Weil–Deligne representations. -/
  WDGL : ℕ → Type
  /-- `ρ ↦ WD(ρ)^{F-ss}` (Grothendieck's monodromy theorem, uniformisers to geometric Frobenius). -/
  wdOf : GalGSp → WD
  /-- Gan–Takeda's correspondence `rec_{GT}` conjugated by `ı` (owner:
  ML.4/gan-takeda-llc-gsp4). -/
  recGT : GSpRep → WD
  /-- The local Langlands correspondence `rec` for `GL_n(K)` (owner: R16.3). -/
  recGL : ∀ n : ℕ, GLRep n → WDGL n
  /-- `π ↦ π ⊗ |ν|^s` (`ν` the similitude; `|·|^{1/2}` via the square root of `q` fixed by `ı`). -/
  twistNuAbs : GSpRep → ℂ → GSpRep
  /-- The monodromy operator `N` of a `GSp₄`-valued Weil–Deligne representation. -/
  monodromyOp : WD → Matrix (Fin 4) (Fin 4) ℂ
  /-- The monodromy operator `N` of a `GL_n`-valued Weil–Deligne representation. -/
  monodromyOpGL : ∀ {n : ℕ}, WDGL n → Matrix (Fin n) (Fin n) ℂ
  /-- Continuous characters of `G_K` (equivalently, via `Art_K`, of `K^×`). -/
  Char : Type
  /-- `ρ ↦ ρ ⊗ χ`. -/
  galTwistChar : GalGSp → Char → GalGSp
  /-- `π ↦ π ⊗ (χ ∘ Art_K ∘ ν)`. -/
  autTwistChar : GSpRep → Char → GSpRep
  /-- `ρ` is unramified. -/
  IsUnramifiedGal : GalGSp → Prop
  /-- The eigenvalues of `ρ(Frob)` (via `ı`), with multiplicity. -/
  frobEigenvalues : GalGSp → Multiset ℂ
  /-- The unramified constituent of the unramified principal series with Satake parameters
  `(α_i)` (owner: R16.3). -/
  unramifiedConstituent : (Fin 4 → ℂ) → GSpRep
  /-- `π` is unramified. -/
  IsUnramifiedRep : GSpRep → Prop
  /-- The Steinberg representation of `GSp₄(K)`. -/
  steinberg : GSpRep
  /-- The order of the component group `A_φ` of the centraliser of a parameter. -/
  componentGroupCard : WD → ℕ
  /-- The parameter is bounded (tempered). -/
  IsTemperedParam : WD → Prop
  /-- `π` is generic. -/
  IsGeneric : GSpRep → Prop

namespace GSp4

/-- `TauCeti.LanglandsRegister.GSp4.lPacketOf` (ML.0/gsp4-galois-l-packet): `L(ρ)`, the
irreducible smooth `π` with `rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}`. -/
def lPacketOf (L : GSp4LocalData) (ρ : L.GalGSp) : Set L.GSpRep :=
  {π | L.recGT (L.twistNuAbs π (-3 / 2)) = L.wdOf ρ}

/-- `TauCeti.LanglandsRegister.GSp4.mem_lPacketOf`. -/
theorem mem_lPacketOf (L : GSp4LocalData) (ρ : L.GalGSp) (π : L.GSpRep) :
    π ∈ lPacketOf L ρ ↔ L.recGT (L.twistNuAbs π (-3 / 2)) = L.wdOf ρ :=
  Iff.rfl

/-- `TauCeti.LanglandsRegister.GSp4.lPacketOf_twist`: `L(ρ ⊗ χ) = L(ρ) ⊗ (χ ∘ Art ∘ ν)`. -/
theorem lPacketOf_twist (L : GSp4LocalData) (ρ : L.GalGSp) (χ : L.Char) :
    lPacketOf L (L.galTwistChar ρ χ) = (fun π => L.autTwistChar π χ) '' lPacketOf L ρ := by
  sorry

/-- `TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty`: `L(ρ)` is non-empty with 1 or 2
elements. -/
theorem lPacketOf_nonempty (L : GSp4LocalData) (ρ : L.GalGSp) :
    (lPacketOf L ρ).Nonempty ∧ ((lPacketOf L ρ).ncard = 1 ∨ (lPacketOf L ρ).ncard = 2) := by
  sorry

end GSp4

/-- `TauCeti.LanglandsRegister.monodromyRank`: `n(π) := n(rec_{GT}(π))`, the rank of the
monodromy operator `N` (for `GL_n(K)` see `monodromyRankGL`). -/
def monodromyRank (L : GSp4LocalData) (π : L.GSpRep) : ℕ :=
  (L.monodromyOp (L.recGT π)).rank

/-- `n(π) := n(rec(π))` for an irreducible admissible representation of `GL_n(K)`. -/
def monodromyRankGL (L : GSp4LocalData) {n : ℕ} (π : L.GLRep n) : ℕ :=
  (L.monodromyOpGL (L.recGL n π)).rank

/-- `TauCeti.LanglandsRegister.GSp4.lPacketOf_unramified` (test, computation): for `ρ`
unramified with `ρ(Frob)` of eigenvalues `q^{3/2}·(α₁, α₂, α₃, α₄)`, `L(ρ)` is the unramified
constituent of the principal series with Satake parameters `(α_i)`. -/
-- NOTE: the packet prints `p^{3/2}`; with `p ≠ l` the twist `|ν|^{−3/2}` scales Frobenius
-- eigenvalues by `q^{3/2}`, `q` the residue cardinality of `K`, so `q` is used here.
theorem GSp4.lPacketOf_unramified (L : GSp4LocalData) (ρ : L.GalGSp) (hρ : L.IsUnramifiedGal ρ)
    (α : Fin 4 → ℂ)
    (hα : L.frobEigenvalues ρ =
      (Finset.univ : Finset (Fin 4)).val.map fun i => (L.q : ℂ) ^ (3 / 2 : ℂ) * α i) :
    GSp4.lPacketOf L ρ = {L.unramifiedConstituent α} := by
  sorry

/-- `TauCeti.LanglandsRegister.monodromyRank_unramified` (test, degenerate): `n(π) = 0` for `π`
unramified. -/
theorem monodromyRank_unramified (L : GSp4LocalData) (π : L.GSpRep) (hπ : L.IsUnramifiedRep π) :
    monodromyRank L π = 0 := by
  sorry

/-- `TauCeti.LanglandsRegister.monodromyRank_steinberg` (test, computation): `n(St) = 3` (`N`
regular nilpotent in `GSp₄(ℂ)`). -/
theorem monodromyRank_steinberg (L : GSp4LocalData) : monodromyRank L L.steinberg = 3 := by
  sorry

/-- `TauCeti.LanglandsRegister.GSp4.lPacketOf_size_two` (test, non-example): for a (tempered)
parameter with `A_φ = ℤ/2ℤ`, `L(ρ)` has two elements, exactly one of them generic. -/
-- NOTE: temperedness is added: Gan–Takeda's generic member exists in tempered packets (for
-- non-tempered parameters a generic member exists iff `L(s, φ, Ad)` is regular at `s = 1`).
theorem GSp4.lPacketOf_size_two (L : GSp4LocalData) (ρ : L.GalGSp)
    (hA : L.componentGroupCard (L.wdOf ρ) = 2) (htemp : L.IsTemperedParam (L.wdOf ρ)) :
    (GSp4.lPacketOf L ρ).ncard = 2 ∧ ∃! π, π ∈ GSp4.lPacketOf L ρ ∧ L.IsGeneric π := by
  sorry

/-! ### ML.0/weight-22-abelian-variety-conjecture -/

/-- Supplier data on genus-2 Siegel eigenforms over `ℚ` and abelian varieties over `ℚ`. -/
structure SiegelData where
  /-- Cuspidal Siegel modular eigenforms of genus 2 and weight `σ` over `ℚ`, in Calegari–Geraghty's
  normalisation (owner: AutomorphicGaloisRepresentationsPartII AG2.2). -/
  Eigenform : ℤ × ℤ → Type
  /-- The eigenform has rational Hecke eigenvalues. -/
  HasRationalEigenvalues : ∀ {σ : ℤ × ℤ}, Eigenform σ → Prop
  /-- Abelian varieties over `ℚ` up to isogeny (owner: AbelianVarieties roadmaps). -/
  AbVar : Type
  /-- The dimension. -/
  abDim : AbVar → ℕ
  /-- `E ↪ End_ℚ(M) ⊗ ℚ`. -/
  HasRealMult : AbVar → (E : Type) → [Field E] → [NumberField E] → Prop
  /-- Isomorphism classes of continuous `G_ℚ → GL₄(Q̄_ℓ)`. -/
  GalRep4 : Type
  /-- `ρ_{f,ℓ}` (via `ι_ℓ : Q̄_ℓ ≅ ℂ`). -/
  formGal : ∀ {σ : ℤ × ℤ}, Eigenform σ → ℕ → GalRep4
  /-- The `σ`-eigenspace of `V_ℓ(M) ⊗ Q̄_ℓ` for `σ : E ↪ ℂ ≅ Q̄_ℓ`. -/
  abVarGal : (M : AbVar) → (E : Type) → [Field E] → [NumberField E] → (E →+* ℂ) → ℕ → GalRep4
  /-- The monodromy operator `N` of `WD(ρ|_{G_{ℚ_q}})` (via `ι`). -/
  monodromy : GalRep4 → ℕ → Matrix (Fin 4) (Fin 4) ℂ

/-- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture` (ML.0/weight-22-abelian-variety-conjecture):
every cuspidal genus-2 Siegel eigenform of weight `(2, 2)` over `ℚ` comes from an abelian variety
`M/ℚ` of dimension `2n` with real multiplication by a totally real `E` of degree `n`. A
proposition (status conjectural), never asserted. -/
def WeightTwoTwoConjecture (S : SiegelData) : Prop :=
  ∀ f : S.Eigenform (2, 2), ∃ (E : Type) (_ : Field E) (_ : NumberField E),
    NumberField.IsTotallyReal E ∧ ∃ M : S.AbVar, S.HasRealMult M E ∧
      S.abDim M = 2 * Module.finrank ℚ E ∧
      ∀ ℓ : ℕ, ℓ.Prime → ∃ σ : E →+* ℂ, S.abVarGal M E σ ℓ = S.formGal f ℓ

/-- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim`: under the conjecture,
`dim M = 2[E : ℚ]`. -/
theorem WeightTwoTwoConjecture.dim (S : SiegelData) (h : WeightTwoTwoConjecture S)
    (f : S.Eigenform (2, 2)) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (M : S.AbVar),
      S.HasRealMult M E ∧ S.abDim M = 2 * Module.finrank ℚ E := by
  obtain ⟨E, i1, i2, -, M, hM, hd, -⟩ := h f
  exact ⟨E, i1, i2, M, hM, hd⟩

/-- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent`: under the conjecture,
`N² = 0` on `WD(ρ_{f,ℓ}|_{G_{ℚ_q}})` (Grothendieck), so `N` has rank at most 2 and type `U₃`
(`N` regular, rank 3) cannot occur. -/
theorem WeightTwoTwoConjecture.semistable_unipotent (S : SiegelData)
    (h : WeightTwoTwoConjecture S) (f : S.Eigenform (2, 2)) (q ℓ : ℕ) (hq : q.Prime)
    (hℓ : ℓ.Prime) (hqℓ : q ≠ ℓ) :
    S.monodromy (S.formGal f ℓ) q ^ 2 = 0 ∧ (S.monodromy (S.formGal f ℓ) q).rank ≠ 3 := by
  sorry

/-- The endpoint record of `WeightTwoTwoConjecture` (CG20 §5.4, a heuristic). -/
def weight22Record (S : SiegelData) : EndpointRecord where
  statement := WeightTwoTwoConjecture S
  source := "Calegari–Geraghty 2020, §5.4"
  status := .conjectural
  hypotheses := []
  producers := []
  known_nil := fun h => by cases h
  evidence := fun h => absurd rfl h

/-- `TauCeti.LanglandsRegister.weight22_conjectural` (test, computation): the record of the weight
`(2, 2)` statement has status conjectural. -/
theorem weight22_conjectural (S : SiegelData) : (weight22Record S).status = .conjectural := rfl

/-- `TauCeti.LanglandsRegister.weight22_status` (test, computation): the endpoint record of
`WeightTwoTwoConjecture` has status conjectural, so it is not known. -/
theorem weight22_status (S : SiegelData) :
    (weight22Record S).status = .conjectural ∧ (weight22Record S).status ≠ .known :=
  ⟨rfl, by simp [weight22Record]⟩

/-- `TauCeti.LanglandsRegister.weight22_E_eq_Q` (test, degenerate): `n = 1` — eigenforms of weight
`(2, 2)` with rational eigenvalues come from abelian surfaces over `ℚ`. -/
-- NOTE: from the conjecture this needs Faltings's isogeny theorem (all eigenspace representations
-- coincide, so `End⁰(M)` is a split central simple ℚ-algebra and `M ∼ A^n`).
theorem weight22_E_eq_Q (S : SiegelData) (h : WeightTwoTwoConjecture S)
    (f : S.Eigenform (2, 2)) (hf : S.HasRationalEigenvalues f) :
    ∃ A : S.AbVar, S.abDim A = 2 ∧
      ∀ ℓ : ℕ, ℓ.Prime → S.abVarGal A ℚ (Rat.castHom ℂ) ℓ = S.formGal f ℓ := by
  sorry

/-- `TauCeti.LanglandsRegister.weight22_not_proved` (test, non-example): the record of
`WeightTwoTwoConjecture` is neither known nor conditional: no node proves it, even conditionally. -/
theorem weight22_not_proved (S : SiegelData) :
    (weight22Record S).status ≠ .known ∧ (weight22Record S).status ≠ .conditional :=
  ⟨by simp [weight22Record], by simp [weight22Record]⟩

/-! ### ML.0/expected-crystallinity-newton-above-hodge -/

/-- Supplier data on the coherent cohomology of the Siegel threefold. -/
structure SiegelCoherentData where
  /-- Systems of Hecke eigenvalues `Θ` (owner: AutomorphicGaloisRepresentationsPartII AG2.2). -/
  HeckeSystem : Type
  /-- `Θ` occurs in `H^i(S^tor_{K,Σ}, Ω^{(k,r)})` (or its cuspidal version) for some `i`. -/
  OccursIn : HeckeSystem → ℤ → ℤ → Prop
  /-- The tame level `N`. -/
  level : HeckeSystem → ℕ
  /-- Isomorphism classes of continuous semisimple `G_ℚ → GL₄(E_λ)`. -/
  GalRep4 : Type
  /-- `ρ_{Θ,λ}` for `λ | p` (owner: AG2.2). -/
  galOf : HeckeSystem → ℕ → GalRep4
  /-- de Rham at `p` (owner: PadicHodgeTheory R06.2). -/
  IsDeRhamAt : GalRep4 → ℕ → Prop
  /-- Crystalline at `p` (owner: R06.2). -/
  IsCrystallineAt : GalRep4 → ℕ → Prop
  /-- Hodge–Tate weights at `p` (cyclotomic character of weight `−1`) (owner: R06.2). -/
  hodgeTateAt : GalRep4 → ℕ → Multiset ℤ
  /-- The Newton polygon of the crystalline Frobenius lies above the Hodge polygon (owner:
  R06.2). -/
  NewtonAboveHodgeAt : GalRep4 → ℕ → Prop

/-- The expected Hodge–Tate weights `(0, r − 2, r + k − 1, k + 2r − 3)` in weight `(k, r)`. -/
def expectedHodgeTate (k r : ℤ) : List ℤ := [0, r - 2, r + k - 1, k + 2 * r - 3]

/-- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge`
(ML.0/expected-crystallinity-newton-above-hodge, Pilloni Remark 5.3.2): for `Θ` in the coherent
cohomology of weight `Ω^{(k,r)} = Sym^k ⊗ det^r` (`k ≥ 0`), `ρ_{Θ,λ}` is de Rham at `p` with
Hodge–Tate weights `(0, r − 2, r + k − 1, k + 2r − 3)`, and crystalline with Newton above Hodge if
`(N, p) = 1`. A proposition (conjectural in general), never asserted. -/
def ExpectedSingularWeightHodge (H : SiegelCoherentData) : Prop :=
  ∀ (Θ : H.HeckeSystem) (k r : ℤ), 0 ≤ k → H.OccursIn Θ k r → ∀ p : ℕ, p.Prime →
    H.IsDeRhamAt (H.galOf Θ p) p ∧
    H.hodgeTateAt (H.galOf Θ p) p = (expectedHodgeTate k r : Multiset ℤ) ∧
    (Nat.Coprime (H.level Θ) p →
      H.IsCrystallineAt (H.galOf Θ p) p ∧ H.NewtonAboveHodgeAt (H.galOf Θ p) p)

/-- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate`: under the expectation the
Hodge–Tate weights are `(0, r − 2, r + k − 1, k + 2r − 3)`. -/
theorem ExpectedSingularWeightHodge.hodgeTate (H : SiegelCoherentData)
    (h : ExpectedSingularWeightHodge H) (Θ : H.HeckeSystem) (k r : ℤ) (hk : 0 ≤ k)
    (hΘ : H.OccursIn Θ k r) (p : ℕ) (hp : p.Prime) :
    H.hodgeTateAt (H.galOf Θ p) p = (expectedHodgeTate k r : Multiset ℤ) :=
  (h Θ k r hk hΘ p hp).2.1

/-- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological`: in cohomological weight
(`r ≠ 2`, `k + r ≠ 1`, `k + 2r ≠ 3`, with `k ≥ 0`) the expected weights are pairwise distinct. -/
-- NOTE: `k ≥ 0` (implicit in `Sym^k`) is needed: `k = −1` gives `r − 2 = r + k − 1`.
theorem ExpectedSingularWeightHodge.cohomological (k r : ℤ) (hk : 0 ≤ k) (h1 : r ≠ 2)
    (h2 : k + r ≠ 1) (h3 : k + 2 * r ≠ 3) : (expectedHodgeTate k r).Nodup := by
  simp [expectedHodgeTate]
  omega

/-- `TauCeti.LanglandsRegister.hodgeTate_k2_r1` (test, computation): `k = 2, r = 1`: the expected
weights are `(0, −1, 2, 1)`. -/
-- NOTE: the packet calls `(2, 1)` a singular weight, but it satisfies the node's cohomological
-- conditions (`r ≠ 2`, `k + r = 3 ≠ 1`, `k + 2r = 4 ≠ 3`) and its weights are distinct.
theorem hodgeTate_k2_r1 : expectedHodgeTate 2 1 = [0, -1, 2, 1] := by decide

/-- `TauCeti.LanglandsRegister.hodgeTate_singular` (test, non-example): `r = 2`: the weights
`(0, 0, k + 1, k + 1)` repeat, so the weight is not cohomological. -/
theorem hodgeTate_singular (k : ℤ) :
    expectedHodgeTate k 2 = [0, 0, k + 1, k + 1] ∧ ¬ (expectedHodgeTate k 2).Nodup := by
  have e : expectedHodgeTate k 2 = [0, 0, k + 1, k + 1] := by
    simp [expectedHodgeTate]
    constructor <;> ring
  refine ⟨e, ?_⟩
  rw [e]
  simp

/-- `TauCeti.LanglandsRegister.hodgeTate_degenerate` (test, degenerate): `k = 0, r = 2`: the
weights are `(0, 0, 1, 1)`, those of `H¹` of an abelian surface. -/
theorem hodgeTate_degenerate : expectedHodgeTate 0 2 = [0, 0, 1, 1] := by decide

/-! ### ML.0/regular-weight-serre-implies-abelian-surface-modularity -/

/-- Global `GSp₄/ℚ` supplier data (owners: AutomorphicGaloisRepresentationsPartII AG2.2 for the
Galois representations, AutomorphicFormsOnReductiveGroups for `GSp₄(𝔸_ℚ)`). -/
structure GSp4GlobalData where
  /-- Continuous `ρ̄ : G_ℚ → GSp₄(F̄_p)` up to conjugacy. -/
  ResRep : ℕ → Type
  /-- Continuous characters `G_ℚ → F̄_p^×`. -/
  ResChar : ℕ → Type
  /-- The multiplier `ν ∘ ρ̄`. -/
  multiplier : ∀ {p : ℕ}, ResRep p → ResChar p
  /-- `ε̄_p^{−1}`. -/
  cycloInv : ∀ p : ℕ, ResChar p
  /-- Absolute irreducibility. -/
  ResAbsIrreducible : ∀ {p : ℕ}, ResRep p → Prop
  /-- `(ρ̄|_{G_{ℚ_p}})^{ss}` is a direct sum of characters. -/
  LocalSemisimpleSplit : ∀ {p : ℕ}, ResRep p → Prop
  /-- Automorphic representations of `GSp₄(𝔸_ℚ)`. -/
  AutGSp4 : Type
  /-- Cuspidality. -/
  IsCuspidalGSp4 : AutGSp4 → Prop
  /-- Ordinary at `p`. -/
  IsOrdinaryAt : AutGSp4 → ℕ → Prop
  /-- Regular (cohomological) weight. -/
  IsRegularWeight : AutGSp4 → Prop
  /-- Weight `(2, 2)` (the weight of abelian surfaces). -/
  IsWeightTwo : AutGSp4 → Prop
  /-- Level prime to `p`. -/
  LevelPrimeTo : AutGSp4 → ℕ → Prop
  /-- Central character `|·|²`. -/
  CentralCharAbsSq : AutGSp4 → Prop
  /-- `ρ̄_{π,p}`. -/
  residualOf : AutGSp4 → (p : ℕ) → ResRep p
  /-- Abelian surfaces over `ℚ`. -/
  AbSurface : Type
  /-- The Hasse–Weil `L(A, s)` (values off poles). -/
  abL : AbSurface → ℂ → ℂ
  /-- The spin `L(s, π, spin)` (values off poles). -/
  spinL : AutGSp4 → ℂ → ℂ

/-- `A` is modular: `L(A, s) = L(s − 1/2, π, spin)` for a cuspidal `π` of weight 2 (on a right
half-plane). -/
def IsModularAbSurface (D : GSp4GlobalData) (A : D.AbSurface) : Prop :=
  ∃ π : D.AutGSp4, D.IsCuspidalGSp4 π ∧ D.IsWeightTwo π ∧
    ∃ σ₀ : ℝ, ∀ s : ℂ, σ₀ < s.re → D.abL A s = D.spinL π (s - 1 / 2)

/-- The regular-weight Serre statement for `GSp₄` (BCGP Lemma 10.4.1's hypothesis; conjectural). -/
def RegularWeightSerreGSp4 (D : GSp4GlobalData) : Prop :=
  ∀ p : ℕ, p.Prime → ∀ ρ : D.ResRep p, D.multiplier ρ = D.cycloInv p → D.ResAbsIrreducible ρ →
    D.LocalSemisimpleSplit ρ → ∃ π : D.AutGSp4, D.IsCuspidalGSp4 π ∧ D.IsOrdinaryAt π p ∧
      D.IsRegularWeight π ∧ D.LevelPrimeTo π p ∧ D.CentralCharAbsSq π ∧ D.residualOf π p = ρ

/-- `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre`
(ML.0/regular-weight-serre-implies-abelian-surface-modularity, BCGP 2025 Lemma 10.4.1): the
regular-weight Serre statement implies that every abelian surface over `ℚ` is modular. A
conditional endpoint: the Serre statement is conjectural, and the proof uses Gee–Taïbi's
classification through Arthur (gated by `arthurGate`). -/
-- NOTE: the Arthur input `hGT` is a proposition of `ArthurInputs`, formally unconnected to `D`.
theorem abelianSurface_modular_of_serre (D : GSp4GlobalData) (A : ArthurInputs)
    (hGT : A.geeTaibiGSp4) (hSerre : RegularWeightSerreGSp4 D) (X : D.AbSurface) :
    IsModularAbSurface D X := by
  sorry

end LanglandsRegister

end TauCeti

namespace TauCeti

namespace WeightOne

open LanglandsRegister

variable {K : Type} [Field K] [NumberField K]

/-! ### ML.1/strong-artin-conjecture -/

/-- Supplier data for Artin representations of `G_K`. -/
structure ArtinData (K : Type) [Field K] [NumberField K] extends Langlands.Context K where
  /-- Continuous representations `ρ : G_K → GL_n(ℂ)` (finite image) (owner:
  AutomorphicLFunctionsAndLocalFactors AL.2, AnalyticNumberTheory AN.4). -/
  ArtinRep : ℕ → Type
  /-- Isomorphism of representations. -/
  artinSetoid : ∀ n : ℕ, Setoid (ArtinRep n)
  /-- Irreducibility. -/
  ArtinIrreducible : ∀ {n : ℕ}, ArtinRep n → Prop
  /-- `ρ|_{W_{K_v}}` as an L-parameter at `v` (owner: ClassFieldTheory layer 7). -/
  restrictTo : ∀ {n : ℕ}, ArtinRep n → (v : Place) → LParam v n
  /-- Restriction is defined on isomorphism classes. -/
  restrictTo_iso : ∀ {n : ℕ} {ρ ρ' : ArtinRep n}, (artinSetoid n).r ρ ρ' →
    restrictTo ρ = restrictTo ρ'
  /-- The Artin L-function `L(ρ, s)`, given by its values off its poles (owner: AN.4). -/
  artinL : ∀ {n : ℕ}, ArtinRep n → ℂ → ℂ
  /-- The multiplicity of the trivial representation in `ρ`. -/
  invariantsDim : ∀ {n : ℕ}, ArtinRep n → ℕ
  /-- Twist `ρ ⊗ χ` by a (finite-order) character. -/
  artinTwist : ∀ {n : ℕ}, ArtinRep n → ArtinRep 1 → ArtinRep n
  /-- Direct sum. -/
  artinSum : ∀ {m n : ℕ}, ArtinRep m → ArtinRep n → ArtinRep (m + n)
  /-- The trivial character. -/
  artinOne : ArtinRep 1
  /-- The Hecke character `χ ∘ Art_K` of a character `χ` of `G_K` (owner: ClassFieldTheory
  layer 11). -/
  heckeOf : ArtinRep 1 → AutRep 1
  /-- `det ρ(c_v)` for the complex conjugation `c_v` at a real place `v`. -/
  detConj : ∀ {n : ℕ}, ArtinRep n → NumberField.InfinitePlace K → ℂ
  /-- Quadratic extensions `L/K`. -/
  QuadExt : Type
  /-- `L` is totally imaginary. -/
  IsImaginaryQuad : QuadExt → Prop
  /-- Finite-order characters of `G_L`. -/
  QuadChar : QuadExt → Type
  /-- `χ ↦ χ^c`, `c` the non-trivial element of `Gal(L/K)`. -/
  quadConj : ∀ {L : QuadExt}, QuadChar L → QuadChar L
  /-- `Ind_{G_L}^{G_K} χ`. -/
  induced : ∀ {L : QuadExt}, QuadChar L → ArtinRep 2
  /-- The automorphic induction of `χ` (owner: AutomorphicLFunctionsAndLocalFactors AL.3,
  GL2AutomorphicRepresentationsAndTransfer R17.5). -/
  automorphicInduction : ∀ {L : QuadExt}, QuadChar L → AutRep 2

/-- Isomorphism of Artin representations. -/
instance ArtinData.instSetoidArtinRep (A : ArtinData K) (n : ℕ) : Setoid (A.ArtinRep n) :=
  A.artinSetoid n

/-- `rec(π_v) ≅ ρ|_{W_{K_v}}` for every place, including ramified and infinite ones. -/
def Matches (A : ArtinData K) {n : ℕ} (π : A.AutRep n) (ρ : A.ArtinRep n) : Prop :=
  ∀ v : A.Place, A.localParam π v = A.restrictTo ρ v

/-- `TauCeti.WeightOne.IsAutomorphicArtin` (ML.1/strong-artin-conjecture): `ρ` has a cuspidal `π`
with `rec(π_v) ≅ ρ|_{W_{K_v}}` for every `v` (strong Artin).
Almost-everywhere equality alone does not imply entireness of the full Artin function. -/
def IsAutomorphicArtin (A : ArtinData K) {n : ℕ} (ρ : A.ArtinRep n) : Prop :=
  ∃ π : A.AutRep n, A.IsCuspidal π ∧ Matches A π ρ

namespace IsAutomorphicArtin

/-- `TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire`: an automorphic irreducible
non-trivial `ρ` has `L(ρ, s)` extending to an entire function (Godement–Jacquet). -/
theorem lFunction_entire (A : ArtinData K) {n : ℕ} (ρ : A.ArtinRep n)
    (h : IsAutomorphicArtin A ρ) (hirr : A.ArtinIrreducible ρ) (hnt : A.invariantsDim ρ = 0) :
    ∃ f : ℂ → ℂ, Differentiable ℂ f ∧ ∀ s : ℂ, 1 < s.re → f s = A.artinL ρ s := by
  sorry

/-- `TauCeti.WeightOne.IsAutomorphicArtin.of_iso`: invariance under isomorphism of `ρ`. -/
theorem of_iso (A : ArtinData K) {n : ℕ} {ρ ρ' : A.ArtinRep n} (h : IsAutomorphicArtin A ρ)
    (e : ρ ≈ ρ') : IsAutomorphicArtin A ρ' := by
  obtain ⟨π, hπ, hm⟩ := h
  refine ⟨π, hπ, ?_⟩
  unfold Matches at hm ⊢
  rwa [← A.restrictTo_iso e]

/-- `TauCeti.WeightOne.IsAutomorphicArtin.twist`: `ρ` automorphic ⇒ `ρ ⊗ χ` automorphic for a
finite-order character `χ`. -/
theorem twist (A : ArtinData K) {n : ℕ} {ρ : A.ArtinRep n} (h : IsAutomorphicArtin A ρ)
    (χ : A.ArtinRep 1) : IsAutomorphicArtin A (A.artinTwist ρ χ) := by
  sorry

/-- `TauCeti.WeightOne.IsAutomorphicArtin.dim_one`: every one-dimensional `ρ` is automorphic
(class field theory). -/
theorem dim_one (A : ArtinData K) (ρ : A.ArtinRep 1) : IsAutomorphicArtin A ρ := by
  sorry

/-- `TauCeti.WeightOne.IsAutomorphicArtin.unique`: the cuspidal `π` is unique (strong
multiplicity one). -/
theorem unique (A : ArtinData K) {n : ℕ} (ρ : A.ArtinRep n) (π π' : A.AutRep n)
    (hπ : A.IsCuspidal π) (hπ' : A.IsCuspidal π') (h : Matches A π ρ) (h' : Matches A π' ρ) :
    π = π' := by
  sorry

end IsAutomorphicArtin

/-- `TauCeti.WeightOne.artin_character` (test, degenerate): `n = 1`: `ρ = χ ∘ Art_K^{−1}` is
automorphic with `π = χ`. -/
theorem artin_character (A : ArtinData K) (χ : A.ArtinRep 1) :
    A.IsCuspidal (A.heckeOf χ) ∧ Matches A (A.heckeOf χ) χ := by
  sorry

/-- `TauCeti.WeightOne.artin_dihedral` (test, computation): `ρ = Ind_{G_L}^{G_ℚ} χ` for `L`
imaginary quadratic and `χ ≠ χ^c` is automorphic, with `π` the automorphic induction of `χ`
(weight-one theta series). -/
theorem artin_dihedral (A : ArtinData ℚ) (L : A.QuadExt) (hL : A.IsImaginaryQuad L)
    (χ : A.QuadChar L) (hχ : A.quadConj χ ≠ χ) :
    A.ArtinIrreducible (A.induced χ) ∧ A.IsCuspidal (A.automorphicInduction χ) ∧
      Matches A (A.automorphicInduction χ) (A.induced χ) := by
  sorry

/-- `TauCeti.WeightOne.artin_reducible_not` (test, non-example): `ρ = 1 ⊕ 1` is not irreducible;
the matching `1 ⊞ 1` is isobaric, not cuspidal; `ρ` is not automorphic in this sense; and
`L(ρ, s) = ζ_K(s)²` has a pole at `s = 1`. -/
theorem artin_reducible_not (A : ArtinData K) :
    ¬ A.ArtinIrreducible (A.artinSum A.artinOne A.artinOne) ∧
      ¬ A.IsCuspidal (A.isobaricSum A.one A.one) ∧
      ¬ IsAutomorphicArtin A (A.artinSum A.artinOne A.artinOne) ∧
      Langlands.HasPoleAt (A.artinL (A.artinSum A.artinOne A.artinOne)) 1 := by
  sorry

/-- Weight-one supplier data over `ℚ`: newforms and compatible systems. -/
structure WeightOneData extends ArtinData ℚ where
  /-- Newforms of weight one (owner: AutomorphicGaloisRepresentations R19.1). -/
  Newform : Type
  /-- The level `N` of `f ∈ S₁(Γ₁(N))`. -/
  level : Newform → ℕ
  /-- The Deligne–Serre representation `ρ_f` (owner: R19.1/weight-one-artin-representation). -/
  deligneSerre : Newform → ArtinRep 2
  /-- The cuspidal automorphic representation `π_f` (owner: GL2AutomorphicRepresentations…). -/
  autOf : Newform → AutRep 2
  /-- Two-dimensional `E`-rational compatible systems of `G_ℚ` in Khare–Wintenberger's sense (§5):
  weakly compatible, crystalline for `ℓ ≫ 0`, up to isomorphism (owner:
  PotentialModularityAndCompatibleSystems R24.6). -/
  CompatSys : Type
  /-- The Hodge–Tate weights `(a, b)` for `ℓ ≫ 0`. -/
  htPair : CompatSys → ℤ × ℤ
  /-- Irreducibility. -/
  SysIrreducible : CompatSys → Prop
  /-- `det ρ_ι(c)` for complex conjugation `c`. -/
  sysDetConj : CompatSys → ℤˣ
  /-- The conductor `N`. -/
  conductor : CompatSys → ℕ
  /-- Twist `ρ_ι ⊗ ε_ℓ^k` by a power of the cyclotomic character. -/
  sysCycloTwist : CompatSys → ℤ → CompatSys
  /-- The compatible system `(ρ_{f,ι})` of a weight-one newform (owner: R19.1). -/
  sysOfNewform : Newform → CompatSys
  /-- Indices `ι : E ↪ Q̄_ℓ` of the members. -/
  MemberIndex : Type
  /-- The member `ρ_ι` has finite image. -/
  MemberFiniteImage : CompatSys → MemberIndex → Prop
  /-- Primes `λ` of the coefficient field. -/
  Lambda : Type
  /-- Isomorphism classes of semisimple `G_ℚ → GL₂(F̄_ℓ)`. -/
  ResRep : Type
  /-- The reduction `ρ̄_λ`. -/
  residual : CompatSys → Lambda → ResRep

/-- `TauCeti.WeightOne.artin_compat_deligneSerre` (test, compatibility): for `f` a weight-one
newform, the Deligne–Serre representation `ρ_f` is automorphic with `π = π_f`. -/
theorem artin_compat_deligneSerre (W : WeightOneData) (f : W.Newform) :
    W.IsCuspidal (W.autOf f) ∧ Matches W.toArtinData (W.autOf f) (W.deligneSerre f) := by
  sorry

/-! ### ML.1/irregular-systems-weight-one and ML.1/khare-weight-one-descent -/

/-- `TauCeti.WeightOne.weightOne_of_irregular` (ML.1/irregular-systems-weight-one,
Khare–Wintenberger Theorem 10.1(ii)): an irregular (`a = b`), irreducible, odd two-dimensional
compatible system of `G_ℚ` arises, up to twist, from a weight-one newform; when its Hodge–Tate
weights are `(0, 0)` every member has finite image. -/
-- NOTE: the packet says "in particular every ρ_ι has finite image"; for `a = b ≠ 0` the members
-- are `ρ_{f,ι} ⊗ ε^a` with infinite image, so finiteness is stated for the twist-normalised case.
theorem weightOne_of_irregular (W : WeightOneData) (R : W.CompatSys) (hirr : W.SysIrreducible R)
    (hodd : W.sysDetConj R = -1) (hreg : (W.htPair R).1 = (W.htPair R).2) :
    (∃ (f : W.Newform) (k : ℤ), W.sysCycloTwist R k = W.sysOfNewform f) ∧
      (W.htPair R = (0, 0) → ∀ i, W.MemberFiniteImage R i) := by
  sorry

/-- Imported statement (owner: ClassicalSerreModularity R27.6/weight-one-descent-from-infinitely-many-primes,
not a node of this roadmap), recorded as the form ML.1/irregular-systems-weight-one uses: an odd irreducible system
with Hodge–Tate weights `(0, 0)` and conductor `N` whose reductions `ρ̄_λ`, for infinitely many
`λ`, are those of weight-one forms of level `N` (liftable to `S₁(Γ₁(N))` by Gross and
Coleman–Voloch) arises from a newform `f ∈ S₁(Γ₁(N))`. -/
theorem khare_descent (W : WeightOneData) (R : W.CompatSys) (N : ℕ) (hirr : W.SysIrreducible R)
    (hodd : W.sysDetConj R = -1) (hHT : W.htPair R = (0, 0)) (hN : W.conductor R = N)
    (hinf : {lam : W.Lambda | ∃ f : W.Newform, W.level f ∣ N ∧
      W.residual (W.sysOfNewform f) lam = W.residual R lam}.Infinite) :
    ∃ f : W.Newform, W.level f ∣ N ∧ R = W.sysOfNewform f := by
  sorry

/-! ### ML.1/odd-artin-modularity-over-q and ML.1/totally-real-odd-artin -/

/-- `ρ` is totally odd: `det ρ(c_v) = −1` at every real place. -/
def IsTotallyOdd (A : ArtinData K) {n : ℕ} (ρ : A.ArtinRep n) : Prop :=
  ∀ v : NumberField.InfinitePlace K, v.IsReal → A.detConj ρ v = -1

/-- `TauCeti.WeightOne.oddArtin_modular_Q` (ML.1/odd-artin-modularity-over-q): every odd
irreducible `ρ : G_ℚ → GL₂(ℂ)` arises from a weight-one newform, hence satisfies Langlands'
conjecture. Owners: Langlands–Tunnell (dihedral, `A₄`, `S₄`; GL2AutomorphicRepresentationsAndTransfer
R17.5) and Khare–Wintenberger Corollary 10.2(ii) (`A₅`; ClassicalSerreModularity R27.6). -/
theorem oddArtin_modular_Q (W : WeightOneData) (ρ : W.ArtinRep 2) (hirr : W.ArtinIrreducible ρ)
    (hodd : IsTotallyOdd W.toArtinData ρ) :
    (∃ f : W.Newform, W.deligneSerre f ≈ ρ) ∧ IsAutomorphicArtin W.toArtinData ρ := by
  sorry

/-- Artin data over a totally real field with Hilbert modular forms of parallel weight one. -/
structure TotallyRealArtinData (E : Type) [Field E] [NumberField E] extends ArtinData E where
  /-- Hilbert modular eigenforms of parallel weight one (owner: AutomorphicGaloisRepresentations
  R19.2). -/
  HilbertForm : Type
  /-- The attached Artin representation (owner: R19.2). -/
  galOfHilbert : HilbertForm → ArtinRep 2

/-- `TauCeti.WeightOne.oddArtin_totallyReal` (ML.1/totally-real-odd-artin, Pilloni–Stroh
Theorem 0.3): over a totally real `E`, a continuous irreducible totally odd `ϱ : G_E → GL₂(ℂ)`
arises from a Hilbert eigenform of parallel weight one, hence is automorphic. -/
theorem oddArtin_totallyReal (E : Type) [Field E] [NumberField E] [NumberField.IsTotallyReal E]
    (A : TotallyRealArtinData E) (ρ : A.ArtinRep 2) (hirr : A.ArtinIrreducible ρ)
    (hodd : IsTotallyOdd A.toArtinData ρ) :
    (∃ f : A.HilbertForm, A.galOfHilbert f ≈ ρ) ∧ IsAutomorphicArtin A.toArtinData ρ := by
  sorry

/-! ### ML.1/non-solvable-residual-modularity -/

/-- Mod 5 supplier data over a totally real field `E`. -/
structure Mod5Data (E : Type) [Field E] [NumberField E] where
  /-- Continuous `ϱ̄ : G_E → GL₂(F₅)` up to conjugacy (owner: AutomorphicGaloisRepresentations
  R19.2). -/
  ModRep : Type
  /-- The image of `ϱ̄` (up to conjugacy, a representative). -/
  image : ModRep → Subgroup (GL (Fin 2) (ZMod 5))
  /-- Continuous characters `G_E → F₅^×`. -/
  ModChar : Type
  /-- `det ϱ̄`. -/
  detChar : ModRep → ModChar
  /-- `ε̄₅^{−1}`. -/
  cycloInv : ModChar
  /-- `det ϱ̄(c_v)` at a real place `v`. -/
  detConj : ModRep → NumberField.InfinitePlace E → ZMod 5
  /-- Hilbert modular eigenforms (owner: GL2ModularityLifting R22.1). -/
  HilbertForm : Type
  /-- The mod 5 representation `ρ̄_{f,5}`. -/
  residualOf : HilbertForm → ModRep

/-- `ϱ̄` has non-solvable projective image. -/
def HasNonsolvableProjImage {E : Type} [Field E] [NumberField E] (M : Mod5Data E)
    (ρ : M.ModRep) : Prop :=
  ¬ Group.IsSolvable ((M.image ρ).map
    (QuotientGroup.mk' (Subgroup.center (GL (Fin 2) (ZMod 5)))))

/-- `TauCeti.WeightOne.mod5_nonsolvable_modular` (ML.1/non-solvable-residual-modularity): over a
totally real `E` in which 5 is unramified, a totally odd `ϱ̄ : G_E → GL₂(F₅)` with
`det ϱ̄ = ε̄^{−1}` and non-solvable projective image is modular (Shepherd-Barron–Taylor, Taylor;
lifts by Khare–Wintenberger's method, Snowden Theorem 7.2.1; Kisin's lifting theorem). -/
theorem mod5_nonsolvable_modular (E : Type) [Field E] [NumberField E]
    [NumberField.IsTotallyReal E] (h5 : ¬ (5 : ℤ) ∣ NumberField.discr E) (M : Mod5Data E)
    (ρ : M.ModRep) (hodd : ∀ v, M.detConj ρ v = -1) (hdet : M.detChar ρ = M.cycloInv)
    (hns : HasNonsolvableProjImage M ρ) :
    ∃ f : M.HilbertForm, M.residualOf f = ρ := by
  sorry

/-! ### ML.1/buzzard-taylor-hypotheses -/

/-- A deformation problem `ρ̄ : G_{F,S} → GL₂(k)`, `k` finite of characteristic `p`, with
universal deformation ring `R` (owner: GlobalGaloisDeformations R04.1). -/
structure DeformationData (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] where
  /-- Places of `F`. -/
  Place : Type
  /-- Places above `p`. -/
  AboveP : Place → Prop
  /-- The finite set `S`. -/
  S : Finset Place
  /-- `ρ̄` is absolutely irreducible. -/
  ResAbsIrreducible : Prop
  /-- The `Q̄_p`-points of `R` (continuous `W(k)`-algebra maps). -/
  Point : Type
  /-- The map of a point. -/
  pointHom : Point → (R →+* AlgebraicClosure ℚ_[p])
  /-- The Galois representation of the point has finite image. -/
  PointFiniteImage : Point → Prop

/-- `TauCeti.WeightOne.reduced_of_finitePoints` (ML.1/buzzard-taylor-hypotheses,
Calegari–Geraghty Lemma 4.14): if `S` has no place above `p`, `ρ̄` is absolutely irreducible,
every `Q̄_p`-point of `R` has finite image and there are finitely many, then `R[1/p]` is
reduced. -/
theorem reduced_of_finitePoints {p : ℕ} [Fact p.Prime] {R : Type} [CommRing R]
    (D : DeformationData p R) (hS : ∀ v ∈ D.S, ¬ D.AboveP v) (hirr : D.ResAbsIrreducible)
    (hfin : ∀ x, D.PointFiniteImage x) (hpts : Finite D.Point) :
    IsReduced (Localization.Away (p : R)) := by
  sorry

/-! ### ML.1/imaginary-quadratic-elliptic-modularity -/

/-- The modular curve `X₀(15)` (Cremona `15a1`): `y² + xy + y = x³ + x² − 10x − 10`. -/
def X0of15 : WeierstrassCurve ℚ := ⟨1, 1, 1, -10, -10⟩

/-- Supplier data for modularity of elliptic curves over `F`. -/
structure EllipticModularityData (F : Type) [Field F] [NumberField F]
    extends Langlands.Context F where
  /-- The partial Hasse–Weil `L^T(E, s)` (owner: EllipticCurveModularity). -/
  ellPartialL : WeierstrassCurve F → Finset Place → ℂ → ℂ
  /-- Parallel weight 2 (owner: AutomorphicFormsOnReductiveGroups AF.4). -/
  IsParallelWeightTwo : AutRep 2 → Prop

/-- `E/F` is modular: `L^T(E, s) = L^T(π, s − 1/2)` (on a right half-plane) for a cuspidal `π`
of parallel weight 2, or, in the CM case, for an isobaric sum of two Hecke characters. -/
def IsModularEC {F : Type} [Field F] [NumberField F] (M : EllipticModularityData F)
    (E : WeierstrassCurve F) : Prop :=
  ∃ π : M.AutRep 2,
    (M.IsCuspidal π ∧ M.IsParallelWeightTwo π ∨ ∃ χ₁ χ₂ : M.AutRep 1, π = M.isobaricSum χ₁ χ₂) ∧
    ∃ (T : Finset M.Place) (σ₀ : ℝ), ∀ s : ℂ, σ₀ < s.re →
      M.ellPartialL E T s = M.partialL π StdLabel T (s - 1 / 2)

/-- `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic`
(ML.1/imaginary-quadratic-elliptic-modularity, Caraiani–Newton Theorem 1.1): over an imaginary
quadratic `F` with `X₀(15)(F)` finite, every elliptic curve is modular. -/
-- NOTE: Theorem 1.2 (100% of Weierstrass equations over imaginary CM `F`, Galois over ℚ with
-- `ζ₅ ∉ F`) needs a height-density notion not in the supplier data and is not stated here.
theorem ellipticCurve_modular_imagQuadratic (F : Type) [Field F] [NumberField F]
    (hF : Module.finrank ℚ F = 2) [NumberField.IsTotallyComplex F]
    (h15 : Finite (X0of15.baseChange F).toAffine.Point) (M : EllipticModularityData F)
    (E : WeierstrassCurve F) [E.IsElliptic] : IsModularEC M E := by
  sorry

/-! ### ML.1/weight-one-separation-register -/

/-- Scopes of the modularity endpoints. -/
inductive Scope
  | weightOneOverQ
  | weightOneTotallyReal
  | ellipticImagQuadraticOrCM
  | weightTwoOverQ
  | potentialModularity
  | conditionalOverGeneralF
  | ellipticAllNumberFields
  deriving DecidableEq, Repr

/-- `TauCeti.WeightOne.scopeRegister` (ML.1/weight-one-separation-register): the modularity
endpoints with their scope and owner. The weight ≥ 2 `GL₂/ℚ` endpoints are owned by
ClassicalSerreModularity and EllipticCurveModularity; over general `F` only potential modularity
(ML.2) and Calegari–Geraghty's conditional statement are registered. -/
def scopeRegister : List (String × Scope × String) :=
  [ ("ML.1/odd-artin-modularity-over-q", .weightOneOverQ,
      "GL2AutomorphicRepresentationsAndTransfer R17.5; ClassicalSerreModularity R27.6"),
    ("ML.1/irregular-systems-weight-one", .weightOneOverQ, "ModularityAndLanglandsExtensions"),
    ("ML.1/totally-real-odd-artin", .weightOneTotallyReal, "ModularityAndLanglandsExtensions"),
    ("ML.1/non-solvable-residual-modularity", .weightOneTotallyReal,
      "ModularityAndLanglandsExtensions"),
    ("ML.1/imaginary-quadratic-elliptic-modularity", .ellipticImagQuadraticOrCM,
      "ModularityAndLanglandsExtensions"),
    ("weight ≥ 2 GL₂/ℚ endpoints", .weightTwoOverQ,
      "ClassicalSerreModularity; EllipticCurveModularity"),
    ("ML.2 potential modularity", .potentialModularity, "ModularityAndLanglandsExtensions"),
    ("ML.2/cg18-conditional-potential-modularity", .conditionalOverGeneralF,
      "ModularityAndLanglandsExtensions") ]

/-- No registered endpoint claims modularity of all elliptic curves over arbitrary number
fields. -/
theorem scopeRegister_no_general_elliptic :
    ∀ e ∈ scopeRegister, e.2.1 ≠ .ellipticAllNumberFields := by
  decide

end WeightOne

end TauCeti


/-!
# ML.4 — Arthur, Mok and KMSW classification; GSp₄ and classical-group packets

Group G2 of the suggested Lean forms. Arthur's classification theorems are conditional; every
theorem that rests on Arthur's book (or on Mok, KMSW, Gee–Taïbi, Xu, …) takes the hypothesis
`hTWFL : D.twistedWeightedFL` (the twisted weighted fundamental lemma, registered in
`TauCeti.Arthur.traceFormulaInputs`) as an explicit argument, so that the conditional status stays
visible in every signature.

-- NOTE (honesty convention). The supplier data enter through `ArthurContext`, `ClassicalGroup`,
`UnitaryGroup` and `GSp4.Data`, each field naming its owner. Theorems about the discrete spectrum
are statements about these data; they are meant for the genuine supplier data (the context *is*
the discrete spectrum, the trace formula, the transfer, …), not for arbitrary values of the
fields. Where a small statement needs a specific supplier fact (e.g. `∧²` of a `GL₂`
representation is its central character) that fact is an explicit hypothesis of the statement.

-- NOTE (prelude). `Langlands.Context.partialL` takes the representation `R` of `GL_n` as a *type*
`(R : Type)`, while `SquareRep` is an inductive with *values* `sym2`, `ext2`; so the suggested
form `C.partialL π SquareRep.ext2 S` is ill-typed. This part passes the type tag
`squareTag r := {x : SquareRep // x = r}` instead.
-/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-! ## Common notions -/

/-- The type tag under which the prelude's `Context.partialL` (whose representation argument is a
type) takes the square representation `r` of `GL_n`: `L^S(s, π, ∧²) = C.partialL π (squareTag .ext2) S`. -/
def squareTag (r : SquareRep) : Type := {x : SquareRep // x = r}

/-- `S` contains the archimedean places and the places where `π` ramifies. -/
def IsUnramifiedOutside (C : Context F) {n : ℕ} (π : C.AutRep n) (S : Finset C.Place) : Prop :=
  (∀ v, C.IsArchimedean v → v ∈ S) ∧ ∀ v, ¬ C.IsUnramifiedAt π v → v ∈ S

/-- `π` is a unitary cuspidal automorphic representation with `π ≅ π^∨`. -/
def IsSelfDualCuspidal (C : Context F) {n : ℕ} (π : C.AutRep n) : Prop :=
  C.IsCuspidal π ∧ C.IsUnitary π ∧ C.IsSelfDual π

/-- `f` has a simple pole at `s₀`: `(s - s₀) f(s)` has a non-zero limit. -/
def HasSimplePoleAt (f : ℂ → ℂ) (s₀ : ℂ) : Prop :=
  ∃ c : ℂ, c ≠ 0 ∧ Tendsto (fun s => (s - s₀) * f s) (𝓝[≠] s₀) (𝓝 c)

/-- `f` is holomorphic and non-zero at `s₀` in the weak sense used here: it has a finite non-zero
limit at `s₀`. -/
def HasNonzeroLimitAt (f : ℂ → ℂ) (s₀ : ℂ) : Prop :=
  ∃ c : ℂ, c ≠ 0 ∧ Tendsto f (𝓝[≠] s₀) (𝓝 c)

/-- The two families of quasi-split classical groups of ML.4, recorded by the dual group: `Ĝ`
symplectic (`Ĝ = Sp_N(ℂ)`, `G = SO_{N+1}` split) or `Ĝ` orthogonal (`Ĝ = SO_N(ℂ)`, `G = Sp_{N-1}`
for `N` odd, `G` the quasi-split `SO_N` attached to `η_G` for `N` even). -/
inductive DualFamily
  | symplectic
  | orthogonal
  deriving DecidableEq

/-- Supplier data for Arthur's classification over a number field `F`, extending the
`Langlands.Context` interface. Each field names its owner. -/
structure ArthurContext (F : Type) [Field F] [NumberField F] extends Langlands.Context F where
  /-- The group structure of Hecke characters `AutRep 1` (owner: AutomorphicFormsOnReductiveGroups
  AF.2; class field theory). -/
  charGroup : CommGroup (AutRep 1)
  /-- `twist` on `GL₁` is multiplication of Hecke characters (owner: AF.2). -/
  twist_char : ∀ χ χ' : AutRep 1, twist χ χ' = χ * χ'
  /-- `one` is the unit of the character group (owner: AF.2). -/
  one_eq : one = 1
  /-- The representation of `GL₀(𝔸_F)`, the empty isobaric sum (owner: AF.2). -/
  empty : AutRep 0
  /-- The Speh representation `Speh(μ, b)` of `GL_{mb}(𝔸_F)`, the residual representation
  attached to `μ ⊠ ν_b` (owner: AutomorphicSpectralTheory AS.4, Mœglin–Waldspurger). -/
  speh : ∀ {m : ℕ}, AutRep m → (b : ℕ) → AutRep (m * b)
  /-- The Hecke character `|·|^t` (owner: AF.2). -/
  absPow : ℝ → AutRep 1
  /-- Partial Hecke L-function `L^S(s, χ)`; `L^S(s, 1) = ζ_F^S(s)` (owner:
  AutomorphicLFunctionsAndLocalFactors AL.3). -/
  heckeL : AutRep 1 → Finset Place → ℂ → ℂ
  /-- Partial Rankin–Selberg L-function `L^S(s, π × π')` (owner: AL.3). -/
  rankinSelbergL : ∀ {m n : ℕ}, AutRep m → AutRep n → Finset Place → ℂ → ℂ
  /-- Twisted square L-function `L^S(s, Π, R ⊗ χ)` for `R = Sym², ∧²` (owner: AL.4). -/
  twistedSquareL : ∀ {n : ℕ}, AutRep n → SquareRep → AutRep 1 → Finset Place → ℂ → ℂ
  /-- The symplectic root number `ε(1/2, μ × μ') ∈ {±1}` of a pair of self-dual cuspidal
  representations with `μ × μ'` symplectic (owner: AL.3). -/
  rootNumber : ∀ {m n : ℕ}, AutRep m → AutRep n → ℤˣ
  /-- Untwisted square L-functions are the prelude's `partialL` (owner: AL.4). -/
  twistedSquareL_one : ∀ {n : ℕ} (π : AutRep n) (r : SquareRep) (S : Finset Place),
    twistedSquareL π r one S = partialL π (squareTag r) S
  /-- `L^S(s, π × π) = L^S(s, π, Sym²) · L^S(s, π, ∧²)` (owner: AL.3). -/
  rankinSelberg_factor : ∀ {n : ℕ} (π : AutRep n) (S : Finset Place) (s : ℂ),
    rankinSelbergL π π S s = partialL π (squareTag .sym2) S s * partialL π (squareTag .ext2) S s
  /-- Jacquet–Shalika: `L^S(s, π × π^∨)` has a simple pole at `s = 1` for unitary cuspidal `π`
  (owner: AL.3). -/
  rankinSelberg_simplePole : ∀ {n : ℕ} (π : AutRep n) (S : Finset Place),
    IsCuspidal π → IsUnitary π →
      HasSimplePoleAt (rankinSelbergL π (dual π) S) 1
  /-- Shahidi: for unitary cuspidal `π` and `S` containing the ramified and archimedean places,
  `L^S(s, π, R)` (`R = Sym², ∧²`) has at most a simple pole at `s = 1` and is otherwise non-zero
  there (owner: AL.4). -/
  square_pole_or_nonzero : ∀ {n : ℕ} (π : AutRep n) (r : SquareRep) (S : Finset Place),
    IsCuspidal π → IsUnitary π →
      HasSimplePoleAt (partialL π (squareTag r) S) 1 ∨
        HasNonzeroLimitAt (partialL π (squareTag r) S) 1
  /-- Isomorphism classes of irreducible Frobenius-semisimple representations of the local
  Langlands group `L_{F_v}` (`W_{F_v} × SL₂(ℂ)` at finite `v`, `W_{F_v}` at infinite `v`)
  (owner: EndoscopicTransferAndUnitaryTraceComparison ET.6; AF.1 at archimedean places). -/
  LIrr : Place → Type
  /-- Dimension of an irreducible representation of `L_{F_v}` (owner: ET.6). -/
  lirrDim : ∀ {v : Place}, LIrr v → ℕ
  /-- Contragredient (owner: ET.6). -/
  lirrDual : ∀ {v : Place}, LIrr v → LIrr v
  /-- A self-dual irreducible `ρ` preserves an alternating form (otherwise a symmetric one)
  (owner: ET.6). -/
  lirrSymplectic : ∀ {v : Place}, LIrr v → Prop
  /-- `ρ` is bounded (its restriction to `W_{F_v}` has relatively compact image) (owner: ET.6). -/
  lirrBounded : ∀ {v : Place}, LIrr v → Prop
  /-- `ρ` is unramified: trivial on inertia and on the Deligne `SL₂` (owner: ET.6). -/
  lirrUnramified : ∀ {v : Place}, LIrr v → Prop
  /-- The irreducible constituents (with multiplicity) of an `n`-dimensional L-parameter, e.g.
  of `rec(μ_v)` (owner: ET.6). -/
  constituents : ∀ {v : Place} {n : ℕ}, LParam v n → Multiset (LIrr v)
  /-- Input: Arthur's invariant trace formula for `G` (owner: AutomorphicSpectralTheory AS.6). -/
  invariantTraceFormula : Prop
  /-- Input: the twisted trace formula for `GL_N ⋊ θ` (owner: AS.6 / ET.3). -/
  twistedTraceFormula : Prop
  /-- Input: stabilisation of the ordinary and of the twisted trace formula (Arthur;
  Mœglin–Waldspurger 2016) (owner: EndoscopicTransferAndUnitaryTraceComparison ET.3). -/
  stabilisation : Prop
  /-- Input: transfer of orbital integrals (Waldspurger) and the fundamental lemma (Ngô)
  (owner: ET.3). -/
  transferAndFL : Prop
  /-- Input: the twisted weighted fundamental lemma (Chaudouard–Laumon for the weighted case;
  the twisted weighted case as announced) (owner: ET.3). -/
  twistedWeightedFL : Prop
  /-- Input: the local intertwining relation (Arthur §2.4; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin)
  (owner: ET.6). -/
  localIntertwiningRelation : Prop

attribute [instance] ArthurContext.charGroup

/-! ## ML.4/self-dual-cuspidal-type -/

/-- `TauCeti.Arthur.IsSymplecticType` (ML.4/self-dual-cuspidal-type): a unitary self-dual
cuspidal `π` of `GL_N(𝔸_F)` is of symplectic type if `L^S(s, π, ∧²)` has a pole at `s = 1` for a
finite set `S` of places containing the archimedean and the ramified places. -/
def IsSymplecticType (C : Context F) {N : ℕ} (π : C.AutRep N) : Prop :=
  IsSelfDualCuspidal C π ∧
    ∃ S : Finset C.Place, IsUnramifiedOutside C π S ∧
      HasPoleAt (C.partialL π (squareTag .ext2) S) 1

/-- `TauCeti.Arthur.IsOrthogonalType`: `π` is of orthogonal type if `L^S(s, π, Sym²)` has a pole
at `s = 1`. -/
def IsOrthogonalType (C : Context F) {N : ℕ} (π : C.AutRep N) : Prop :=
  IsSelfDualCuspidal C π ∧
    ∃ S : Finset C.Place, IsUnramifiedOutside C π S ∧
      HasPoleAt (C.partialL π (squareTag .sym2) S) 1

/-- `TauCeti.Arthur.selfDual_type_dichotomy`: a unitary self-dual cuspidal `π` is of exactly one
of the two types. (Uses the context fields `rankinSelberg_factor`, `rankinSelberg_simplePole`,
`square_pole_or_nonzero`; the existence of `S` is the hypothesis `hS`.) -/
theorem selfDual_type_dichotomy (D : ArthurContext F) {N : ℕ} (π : D.AutRep N)
    (hπ : IsSelfDualCuspidal D.toContext π)
    (hS : ∃ S, IsUnramifiedOutside D.toContext π S) :
    Xor (IsSymplecticType D.toContext π) (IsOrthogonalType D.toContext π) := by
  sorry

/-- `TauCeti.Arthur.IsSymplecticType.even`: symplectic type forces `N` even. -/
theorem IsSymplecticType.even (D : ArthurContext F) {N : ℕ} {π : D.AutRep N}
    (h : IsSymplecticType D.toContext π) : Even N := by
  sorry

/-- `TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one`: symplectic type forces `ω_π = 1`. -/
theorem IsSymplecticType.centralCharacter_eq_one (D : ArthurContext F) {N : ℕ} {π : D.AutRep N}
    (h : IsSymplecticType D.toContext π) : D.centralChar π = 1 := by
  sorry

/-- `TauCeti.Arthur.IsSymplecticType.independent_of_S`: the pole at `s = 1` does not depend on
`S`. The hypothesis `hloc` is the node's hypothesis that the local factors at the finitely many
places of `S Δ S'` are holomorphic and non-zero at `s = 1`: near `s = 1` the two partial
L-functions differ by a factor with a finite non-zero limit. -/
theorem IsSymplecticType.independent_of_S (C : Context F) {N : ℕ} (π : C.AutRep N)
    (r : SquareRep) (S S' : Finset C.Place)
    (hloc : ∃ g : ℂ → ℂ, HasNonzeroLimitAt g 1 ∧
      ∀ᶠ s in 𝓝[≠] (1 : ℂ), C.partialL π (squareTag r) S s =
        g s * C.partialL π (squareTag r) S' s) :
    HasPoleAt (C.partialL π (squareTag r) S) 1 ↔ HasPoleAt (C.partialL π (squareTag r) S') 1 := by
  sorry

/-- `TauCeti.Arthur.quadraticCharacter_orthogonal` (test, `N = 1`): a unitary Hecke character `χ`
with `χ² = 1` is of orthogonal type, since `L^S(s, χ, Sym²) = L^S(s, χ²) = ζ_F^S(s)`. The
hypotheses are the supplier facts used: `GL₁` representations are cuspidal, `χ^∨ = χ⁻¹ = χ`,
`Sym²` of a character is its square, and `ζ_F^S` has a pole at `1`. -/
theorem quadraticCharacter_orthogonal (D : ArthurContext F) (χ : D.AutRep 1)
    (hunit : D.IsUnitary χ) (hsq : χ * χ = 1)
    (hcusp : D.IsCuspidal χ) (hdual : D.dual χ = χ)
    (hS : ∃ S, IsUnramifiedOutside D.toContext χ S)
    (hsym : ∀ S, D.partialL χ (squareTag .sym2) S = D.heckeL (χ * χ) S)
    (hzeta : ∀ S, HasPoleAt (D.heckeL 1 S) 1) :
    IsOrthogonalType D.toContext χ := by
  obtain ⟨S, hS⟩ := hS
  exact ⟨⟨hcusp, hunit, hdual⟩, S, hS, by rw [hsym, hsq]; exact hzeta S⟩

/-- `TauCeti.Arthur.gl2_trivialCentral_symplectic` (test, `N = 2`): a unitary cuspidal `π` of
`GL₂(𝔸_F)` with `ω_π = 1` is of symplectic type, since `∧²π = ω_π` and `L^S(s, ω_π) = ζ_F^S(s)`.
Supplier facts as hypotheses: `π^∨ ≅ π ⊗ ω_π⁻¹ = π` and `L^S(s, π, ∧²) = L^S(s, ω_π)`. -/
theorem gl2_trivialCentral_symplectic (D : ArthurContext F) (π : D.AutRep 2)
    (hcusp : D.IsCuspidal π) (hunit : D.IsUnitary π) (hω : D.centralChar π = 1)
    (hdual : D.dual π = π) (hS : ∃ S, IsUnramifiedOutside D.toContext π S)
    (hext : ∀ S, D.partialL π (squareTag .ext2) S = D.heckeL (D.centralChar π) S)
    (hzeta : ∀ S, HasPoleAt (D.heckeL 1 S) 1) :
    IsSymplecticType D.toContext π := by
  obtain ⟨S, hS⟩ := hS
  exact ⟨⟨hcusp, hunit, hdual⟩, S, hS, by rw [hext, hω]; exact hzeta S⟩

/-- `TauCeti.Arthur.ellipticCurve_symplectic` (test): the unitary cuspidal `π_E` of `GL₂(𝔸_ℚ)`
attached to a non-CM elliptic curve `E/ℚ` is of symplectic type. The modularity input (owner:
GL2AutomorphicRepresentationsAndTransfer) is the hypothesis that `π_E` is unitary cuspidal with
trivial central character (the unitary normalisation of a weight-2 newform of trivial character);
the CM hypothesis of the packet is not needed. -/
theorem ellipticCurve_symplectic (D : ArthurContext ℚ) (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (πE : D.AutRep 2) (hcusp : D.IsCuspidal πE) (hunit : D.IsUnitary πE)
    (hω : D.centralChar πE = 1) (hdual : D.dual πE = πE)
    (hS : ∃ S, IsUnramifiedOutside D.toContext πE S)
    (hext : ∀ S, D.partialL πE (squareTag .ext2) S = D.heckeL (D.centralChar πE) S)
    (hzeta : ∀ S, HasPoleAt (D.heckeL 1 S) 1) :
    IsSymplecticType D.toContext πE :=
  gl2_trivialCentral_symplectic D πE hcusp hunit hω hdual hS hext hzeta

/-- `TauCeti.Arthur.cubicCharacter_noType` (non-example): a Hecke character `χ` of order `3` is
not self-dual (`χ^∨ = χ² ≠ χ`), so it has neither type. -/
theorem cubicCharacter_noType (D : ArthurContext F) (χ : D.AutRep 1)
    (hdual : D.dual χ = χ * χ) (hne : χ * χ ≠ χ) :
    ¬ IsSymplecticType D.toContext χ ∧ ¬ IsOrthogonalType D.toContext χ := by
  refine ⟨fun h => hne ?_, fun h => hne ?_⟩
  · exact hdual ▸ h.1.2.2
  · exact hdual ▸ h.1.2.2

end Arthur

end TauCeti

/-! ## Component groups, local A-parameters and the classical groups of ML.4 -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-- The determinant form `a ↦ ∑ᵢ aᵢ wᵢ` on sign vectors `ι → ℤ/2`: an element of
`∏ᵢ O(mᵢ)` acting by the sign vector `a` on blocks of dimension `wᵢ (mod 2)` has determinant
`(-1)^{∑ aᵢ wᵢ}`. -/
def detForm (ι : Type) [Fintype ι] (wt : ι → ZMod 2) : (ι → ZMod 2) →+ ZMod 2 where
  toFun a := ∑ i, a i * wt i
  map_zero' := by simp
  map_add' a b := by simp [add_mul, Finset.sum_add_distrib]

/-- The sign vectors of the centraliser lying in `Ĝ`: all of them for `Ĝ` symplectic, those of
determinant one for `Ĝ = SO_N` (`detCond = true`). -/
def signKernel (ι : Type) [Fintype ι] (detCond : Bool) (wt : ι → ZMod 2) :
    AddSubgroup (ι → ZMod 2) :=
  if detCond then (detForm ι wt).ker else ⊤

/-- The image of the centre `Z(Ĝ)` (the sign vector `z`). -/
def centreSubgroup (ι : Type) [Fintype ι] (detCond : Bool) (wt z : ι → ZMod 2) :
    AddSubgroup (signKernel ι detCond wt) :=
  AddSubgroup.comap (signKernel ι detCond wt).subtype (AddSubgroup.zmultiples z)

/-- The component group `π₀(Cent_Ĝ(ψ)/Z(Ĝ))` of a self-dual parameter of a classical dual group,
written multiplicatively: sign vectors on the good-parity constituents `ι` satisfying the
determinant condition, modulo the image of the centre. -/
abbrev SignGroup (ι : Type) [Fintype ι] (detCond : Bool) (wt z : ι → ZMod 2) : Type :=
  Multiplicative (signKernel ι detCond wt ⧸ centreSubgroup ι detCond wt z)

open Classical in
/-- The class of a sign vector (the identity if it violates the determinant condition). -/
def SignGroup.mk {ι : Type} [Fintype ι] {detCond : Bool} {wt z : ι → ZMod 2}
    (a : ι → ZMod 2) : SignGroup ι detCond wt z :=
  if h : a ∈ signKernel ι detCond wt then
    Multiplicative.ofAdd
      (QuotientAddGroup.mk (⟨a, h⟩ : signKernel ι detCond wt) :
        signKernel ι detCond wt ⧸ centreSubgroup ι detCond wt z)
  else 1

/-- Sign groups are elementary abelian `2`-groups. -/
theorem SignGroup.sq_eq_one {ι : Type} [Fintype ι] {detCond : Bool} {wt z : ι → ZMod 2}
    (s : SignGroup ι detCond wt z) : s ^ 2 = 1 := by
  sorry

/-- A local A-parameter `ψ_v : L_{F_v} × SL₂(ℂ) → ^LG` of a classical group, given through the
standard representation of `Ĝ` as the multiset of its irreducible constituents `ρ ⊠ ν_b`
(`ρ` an irreducible representation of `L_{F_v}`, `ν_b` the `b`-dimensional representation of the
Arthur `SL₂`). A multiset is an `O_N(ℂ)`/`Sp_N(ℂ)`-conjugacy class; for even orthogonal groups this
is the conjugacy class up to the outer automorphism, as in Arthur's `Ψ̃`. -/
abbrev LocalAParam (D : ArthurContext F) (v : D.Place) : Type := Multiset (D.LIrr v × ℕ)

/-- `ρ ⊠ ν_b` preserves an alternating form: `ρ` symplectic with `b` odd, or `ρ` orthogonal
with `b` even. -/
def SummandIsSymplectic (D : ArthurContext F) {v : D.Place} (p : D.LIrr v × ℕ) : Prop :=
  D.lirrSymplectic p.1 ↔ ¬ Even p.2

/-- `ρ ⊠ ν_b` is self-dual of the parity of `Ĝ`. -/
def HasGoodParity (D : ArthurContext F) (fam : DualFamily) {v : D.Place}
    (p : D.LIrr v × ℕ) : Prop :=
  D.lirrDual p.1 = p.1 ∧ (SummandIsSymplectic D p ↔ fam = .symplectic)

open Classical in
/-- `ψ_v` is an A-parameter of the classical group with dual family `fam` and standard
representation of dimension `N`: dimension `N`, `b ≥ 1`, stable under duality, and self-dual
constituents of the wrong parity occur with even multiplicity. (The determinant condition
`det ψ_v = η_{G,v}` for `SO_{2n}` is not imposed.) -/
def IsLocalAParamFor (D : ArthurContext F) (fam : DualFamily) (N : ℕ) {v : D.Place}
    (ψ : LocalAParam D v) : Prop :=
  (ψ.map fun p => D.lirrDim p.1 * p.2).sum = N ∧ (∀ p ∈ ψ, 0 < p.2) ∧
    ψ.map (fun p => (D.lirrDual p.1, p.2)) = ψ ∧
    ∀ p ∈ ψ, D.lirrDual p.1 = p.1 → ¬ HasGoodParity D fam p → Even (ψ.count p)

/-- `ψ_v` is bounded: its restriction to `L_{F_v}` has bounded image. -/
def IsBoundedParam (D : ArthurContext F) {v : D.Place} (ψ : LocalAParam D v) : Prop :=
  ∀ p ∈ ψ, D.lirrBounded p.1

/-- `ψ_v = φ` is a tempered L-parameter: bounded and trivial on the Arthur `SL₂`. -/
def IsTemperedLParam (D : ArthurContext F) {v : D.Place} (ψ : LocalAParam D v) : Prop :=
  IsBoundedParam D ψ ∧ ∀ p ∈ ψ, p.2 = 1

open Classical in
/-- The distinct constituents of good parity: one generator of the component group each. -/
def goodIndex (D : ArthurContext F) (fam : DualFamily) {v : D.Place} (ψ : LocalAParam D v) :
    Finset (D.LIrr v × ℕ) :=
  ψ.toFinset.filter (HasGoodParity D fam)

open Classical in
/-- The local component group `S_{ψ_v} = π₀(Cent_Ĝ(ψ_v)/Z(Ĝ)^Γ)`: the isotypic block of a
good-parity constituent `ρ ⊠ ν_b` of multiplicity `m` contributes `O(m)` and the others connected
groups, so `S_{ψ_v}` is generated by the sign vectors on `goodIndex`, subject to the determinant
condition for `Ĝ = SO_N` (block weight `dim ρ · b`), modulo the centre `±1` when `N` is even
(sign vector `m mod 2`). -/
abbrev LocalComponentGroup (D : ArthurContext F) {v : D.Place} (fam : DualFamily) (N : ℕ)
    (ψ : LocalAParam D v) : Type :=
  SignGroup ↥(goodIndex D fam ψ) (decide (fam = .orthogonal))
    (fun i => ((D.lirrDim i.1.1 * i.1.2 : ℕ) : ZMod 2))
    (fun i => (((N + 1) * ψ.count i.1 : ℕ) : ZMod 2))

open Classical in
/-- `s_ψ = ψ(1, -1)`: on `ρ ⊠ ν_b` the element `-1 ∈ SL₂` acts by `(-1)^{b-1}`, so its component
on a block of multiplicity `m` is `(b - 1) m mod 2`. -/
def sPsi (D : ArthurContext F) {v : D.Place} (fam : DualFamily) (N : ℕ)
    (ψ : LocalAParam D v) : LocalComponentGroup D fam N ψ :=
  SignGroup.mk (fun i => (((i.1.2 - 1) * ψ.count i.1 : ℕ) : ZMod 2))

/-- A quasi-split classical group `G` over `F` (`Sp_{2n}`, split `SO_{2n+1}`, or the quasi-split
`SO_{2n}` attached to the quadratic character `η_G`), recorded by the family of its dual group and
the dimension `N` of the standard representation of `Ĝ`, together with the supplier data of its
local and global representation theory. -/
structure ClassicalGroup (D : ArthurContext F) where
  /-- Family of `Ĝ`. -/
  family : DualFamily
  /-- Dimension of the standard representation of `Ĝ`. -/
  N : ℕ
  /-- The quadratic character `η_G` (trivial unless `G = SO_N`, `N` even, non-split). -/
  eta : D.AutRep 1
  even_of_symplectic : family = .symplectic → Even N
  eta_sq : eta * eta = 1
  eta_eq_one : family = .symplectic ∨ Odd N → eta = 1
  /-- Irreducible admissible representations of `G(F_v)` (for even orthogonal `G`: orbits under
  the outer automorphism) (owner: AutomorphicFormsOnReductiveGroups AF.1 at archimedean `v`;
  EndoscopicTransferAndUnitaryTraceComparison ET.6 at finite `v`). -/
  LocalIrr : D.Place → Type
  /-- Tempered representations (owner: AF.1/ET.6). -/
  IsTemperedRep : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- Unitary representations (owner: AF.1/ET.6). -/
  IsUnitaryRep : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- Square-integrable representations (owner: AF.1/ET.6). -/
  IsSquareIntegrableRep : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- Unramified representations (owner: ET.6). -/
  IsUnramifiedRep : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- Generic for the fixed Whittaker datum (owner: ET.6). -/
  IsGenericRep : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- The standard-module (full induced) representation built from the Langlands data of `π` is
  irreducible (owner: AF.1/ET.6). -/
  IsIrreducibleStandardModule : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- Test functions `C_c^∞(G(F_v))` (owner: AutomorphicSpectralTheory AS.6). -/
  TestFn : D.Place → Type
  /-- The character `f ↦ f_G(π) = tr π(f)` (owner: AS.6). -/
  trace : ∀ {v : D.Place}, LocalIrr v → TestFn v → ℂ
  /-- `f ↦ f̃_N(ψ_v)`: the twisted character of the representation of `GL_N(F_v) ⋊ θ` attached
  to `ψ_v`, evaluated on the twisted transfer of `f` (owner: ET.3 transfer, ET.6). -/
  twistedSide : ∀ v, LocalAParam D v → TestFn v → ℂ
  /-- `f ↦ f'(ψ')` for the endoscopic datum `(G', s)` attached to `x ∈ S_ψ`, through which
  `ψ_v` factors as `ψ'` (owner: ET.3 endoscopic transfer, ET.6). -/
  endoscopicSide : ∀ v (ψ : LocalAParam D v), LocalComponentGroup D family N ψ → TestFn v → ℂ
  /-- The standard L-parameter of `π_v` at places where it is unramified (Satake parameter
  composed with the standard representation) (owner: ET.6). -/
  satake : ∀ {v : D.Place}, LocalIrr v → D.LParam v N
  /-- Irreducible admissible representations `π = ⊗'_v π_v` of `G(𝔸_F)` (owner: AF.2). -/
  GlobalRep : Type
  /-- Local components (owner: AF.2). -/
  localComponent : GlobalRep → ∀ v, LocalIrr v
  /-- Multiplicity of `π` in `L²_disc(G(F)\G(𝔸_F))` (owner: AutomorphicSpectralTheory AS.6). -/
  discMult : GlobalRep → ℕ

/-- The characters `Ŝ_ψ` of a local component group, with values in `{±1} = ℤˣ`. -/
abbrev LocalCharacter (D : ArthurContext F) {v : D.Place} (fam : DualFamily) (N : ℕ)
    (ψ : LocalAParam D v) : Type :=
  LocalComponentGroup D fam N ψ →* ℤˣ

/-- A candidate packet: a finite multiset of pairs `(π, ⟨·, π⟩)`. -/
abbrev LocalPacket {D : ArthurContext F} (G : ClassicalGroup D) (v : D.Place)
    (ψ : LocalAParam D v) : Type :=
  Multiset (G.LocalIrr v × LocalCharacter D G.family G.N ψ)

/-- The character identities of Arthur's Theorem 1.5.1 (a), (b) for a packet `pkt` of `ψ_v`:
`f̃_N(ψ) = Σ ⟨s_ψ, π⟩ f_G(π)` (stable, transfer of the twisted character), and
`f'(ψ') = Σ ⟨s_ψ x, π⟩ f_G(π)` for every `x ∈ S_ψ` (endoscopic character identities). -/
def IsArthurPacket {D : ArthurContext F} (G : ClassicalGroup D) (v : D.Place)
    (ψ : LocalAParam D v) (pkt : LocalPacket G v ψ) : Prop :=
  (∀ f, G.twistedSide v ψ f =
      (pkt.map fun p => ((p.2 (sPsi D G.family G.N ψ) : ℤ) : ℂ) * G.trace p.1 f).sum) ∧
    ∀ x f, G.endoscopicSide v ψ x f =
      (pkt.map fun p => ((p.2 (sPsi D G.family G.N ψ * x) : ℤ) : ℂ) * G.trace p.1 f).sum

/-- `σ` of `G(𝔸_F)` weakly transfers to `Π` of `GL_N(𝔸_F)`: the standard L-parameters agree at
almost all places. -/
def IsWeakTransfer {D : ArthurContext F} (G : ClassicalGroup D) (σ : G.GlobalRep)
    (Pgl : D.AutRep G.N) : Prop :=
  ∀ᶠ v in cofinite, G.satake (G.localComponent σ v) = D.localParam Pgl v

/-- `TauCeti.Arthur.selfDualType_iff_transfer` (Arthur, Theorem 1.5.3): a unitary self-dual
cuspidal `π` of `GL_N(𝔸_F)` is of symplectic type iff it is the transfer of a (simple generic)
discrete automorphic representation of the split group `SO_{N+1}` (`Ĝ = Sp_N(ℂ)`).
Conditional: takes the twisted weighted fundamental lemma. -/
theorem selfDualType_iff_transfer (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (hG : G.family = .symplectic) (π : D.AutRep G.N)
    (hπ : IsSelfDualCuspidal D.toContext π) :
    IsSymplecticType D.toContext π ↔ ∃ σ : G.GlobalRep, G.discMult σ ≠ 0 ∧ IsWeakTransfer G σ π := by
  sorry

end Arthur

end TauCeti

/-! ## ML.4/global-arthur-parameter, local packets and the multiplicity formula -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-- The summand `μ ⊠ ν_b` has the parity of `Ĝ`: for `Ĝ` symplectic, `μ` symplectic with `b` odd
or orthogonal with `b` even; for `Ĝ` orthogonal, `μ` orthogonal with `b` odd or symplectic with
`b` even. -/
def HasParity (C : Context F) (fam : DualFamily) {m : ℕ} (μ : C.AutRep m) (b : ℕ) : Prop :=
  match fam with
  | .symplectic => (IsSymplecticType C μ ∧ Odd b) ∨ (IsOrthogonalType C μ ∧ Even b)
  | .orthogonal => (IsOrthogonalType C μ ∧ Odd b) ∨ (IsSymplecticType C μ ∧ Even b)

/-- `TauCeti.Arthur.GlobalParameter` (ML.4/global-arthur-parameter): a discrete global Arthur
parameter `ψ = μ₁ ⊠ ν_{b₁} ⊞ ⋯ ⊞ μ_r ⊠ ν_{b_r}` of `G`, as the multiset of triples `(mᵢ, μᵢ, bᵢ)`
with `μᵢ` a unitary self-dual cuspidal representation of `GL_{mᵢ}(𝔸_F)`: multiplicity free,
`Σ mᵢ bᵢ = N`, every summand of the parity of `Ĝ`, and `∏ ω_{μᵢ}^{bᵢ} = η_G`. For `SO_{2n}` a
multiset is a class up to the outer automorphism, so this is Arthur's `Ψ̃₂(G)`. -/
structure GlobalParameter (D : ArthurContext F) (G : ClassicalGroup D) where
  /-- The summands `(mᵢ, μᵢ, bᵢ)`. -/
  summands : Multiset (Σ m : ℕ, D.AutRep m × ℕ)
  /-- The pairs `(μᵢ, bᵢ)` are pairwise distinct. -/
  nodup : summands.Nodup
  dim_pos : ∀ x ∈ summands, 0 < x.1
  b_pos : ∀ x ∈ summands, 0 < x.2.2
  dim_eq : (summands.map fun x => x.1 * x.2.2).sum = G.N
  /-- Each `μᵢ ⊠ ν_{bᵢ}` has the parity of `Ĝ` (in particular `μᵢ` is self-dual cuspidal). -/
  parity : ∀ x ∈ summands, HasParity D.toContext G.family x.2.1 x.2.2
  centralChar_eq : (summands.map fun x => D.centralChar x.2.1 ^ x.2.2).prod = G.eta

namespace GlobalParameter

variable {D : ArthurContext F} {G : ClassicalGroup D}

/-- `TauCeti.Arthur.GlobalParameter.IsGeneric`: every `bᵢ = 1`. -/
def IsGeneric (ψ : GlobalParameter D G) : Prop := ∀ x ∈ ψ.summands, x.2.2 = 1

open Classical in
/-- The summands as a finite index set (one generator of `S_ψ` each). -/
def index (ψ : GlobalParameter D G) : Finset (Σ m : ℕ, D.AutRep m × ℕ) := ψ.summands.toFinset

/-- `TauCeti.Arthur.GlobalParameter.componentGroup`: `S_ψ`, the sign vectors on the summands
(determinant one for `Ĝ = SO_N`), modulo the image of the centre (all signs `-1`, when `N` is
even); an elementary abelian `2`-group with one generator per summand. -/
abbrev componentGroup (ψ : GlobalParameter D G) : Type :=
  SignGroup ↥ψ.index (decide (G.family = .orthogonal))
    (fun i => ((i.1.1 * i.1.2.2 : ℕ) : ZMod 2)) (fun _ => ((G.N + 1 : ℕ) : ZMod 2))

open Classical in
/-- The value of `ε_ψ` on the generator `sᵢ`: `∏_{j ≠ i, bᵢ + bⱼ odd} ε(1/2, μᵢ × μⱼ)^{min(bᵢ, bⱼ)}`
(Arthur (1.5.6), in the form of Chenevier–Lannes). -/
def signValue (ψ : GlobalParameter D G) (i : ↥ψ.index) : ℤˣ :=
  ∏ j ∈ ψ.index.attach.filter (fun j => j ≠ i ∧ Odd (i.1.2.2 + j.1.2.2)),
    D.rootNumber i.1.2.1 j.1.2.1 ^ min i.1.2.2 j.1.2.2

/-- `ε_ψ` on sign vectors. -/
def signHom (ψ : GlobalParameter D G) : (↥ψ.index → ZMod 2) →+ Additive ℤˣ where
  toFun a := Additive.ofMul (∏ i, ψ.signValue i ^ (a i).val)
  map_zero' := by simp
  map_add' a b := by sorry

/-- `TauCeti.Arthur.GlobalParameter.signCharacter`: Arthur's character `ε_ψ : S_ψ → {±1}`
(its triviality on the centre is part of Arthur's theory, the proof obligation below). -/
def signCharacter (ψ : GlobalParameter D G) : ψ.componentGroup →* ℤˣ where
  toFun x := Additive.toMul (QuotientAddGroup.lift _
    (ψ.signHom.comp (signKernel _ (decide (G.family = .orthogonal)) _).subtype) (by sorry)
    (Multiplicative.toAdd x))
  map_one' := by sorry
  map_mul' x y := by sorry

/-- `TauCeti.Arthur.GlobalParameter.localize`: the local parameter `ψ_v`, with constituents
`ρ ⊠ ν_{bᵢ}` for the irreducible constituents `ρ` of `rec(μ_{i,v})`. -/
def localize (ψ : GlobalParameter D G) (v : D.Place) : LocalAParam D v :=
  ψ.summands.bind fun x => (D.constituents (D.localParam x.2.1 v)).map fun ρ => (ρ, x.2.2)

open Classical in
/-- The localisation `S_ψ → S_{ψ_v}` on sign vectors: the sign of the summand `i` acts on each
constituent of `ψ_{i,v}`. -/
def localizeSigns (ψ : GlobalParameter D G) (v : D.Place) (a : ↥ψ.index → ZMod 2) :
    ↥(goodIndex D G.family (ψ.localize v)) → ZMod 2 := fun j =>
  ∑ i, a i * (if i.1.2.2 = j.1.2 then
    ((D.constituents (D.localParam i.1.2.1 v)).count j.1.1 : ZMod 2) else 0)

/-- The isobaric sum `⊞ Speh(μᵢ, bᵢ)` of a list of summands. -/
def isobaricOfList (D : ArthurContext F) :
    List (Σ m : ℕ, D.AutRep m × ℕ) → Σ n : ℕ, D.AutRep n
  | [] => ⟨0, D.empty⟩
  | x :: l => ⟨x.1 * x.2.2 + (isobaricOfList D l).1,
      D.isobaricSum (D.speh x.2.1 x.2.2) (isobaricOfList D l).2⟩

/-- `TauCeti.Arthur.GlobalParameter.toIsobaric`: the isobaric representation
`⊞ᵢ Speh(μᵢ, bᵢ)` of `GL_N(𝔸_F)` attached to `ψ`. -/
def toIsobaric (ψ : GlobalParameter D G) : D.AutRep G.N :=
  cast (congrArg D.AutRep (by sorry : (isobaricOfList D ψ.summands.toList).1 = G.N))
    (isobaricOfList D ψ.summands.toList).2

/-- `TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal`: a unitary self-dual cuspidal `μ` of
`GL_N(𝔸_F)` of the type of `Ĝ` with `ω_μ = η_G` is a simple generic parameter `μ ⊠ ν₁`. -/
def ofSelfDualCuspidal (G : ClassicalGroup D) (hN : 0 < G.N) (μ : D.AutRep G.N)
    (hpar : HasParity D.toContext G.family μ 1) (hω : D.centralChar μ = G.eta) :
    GlobalParameter D G where
  summands := {⟨G.N, μ, 1⟩}
  nodup := Multiset.nodup_singleton _
  dim_pos x hx := by rw [Multiset.mem_singleton] at hx; subst hx; exact hN
  b_pos x hx := by rw [Multiset.mem_singleton] at hx; subst hx; exact Nat.one_pos
  dim_eq := by simp
  parity x hx := by rw [Multiset.mem_singleton] at hx; subst hx; exact hpar
  centralChar_eq := by simp [hω]

/-- `TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers`: if every
symplectic root number `ε(1/2, μᵢ × μⱼ)` occurring in `ε_ψ` is `1` then `ε_ψ = 1`; in particular
`ε_ψ = 1` for generic `ψ`. -/
theorem signCharacter_generic_trivial_of_rootNumbers (ψ : GlobalParameter D G) :
    ((∀ x ∈ ψ.summands, ∀ y ∈ ψ.summands, x ≠ y → Odd (x.2.2 + y.2.2) →
        D.rootNumber x.2.1 y.2.1 = 1) → ψ.signCharacter = 1) ∧
      (ψ.IsGeneric → ψ.signCharacter = 1) := by
  sorry

/-- `TauCeti.Arthur.GlobalParameter.so3_trivial` (test): for `G = SO₃ ≅ PGL₂` (`Ĝ = SL₂ = Sp₂`,
`N = 2`), `ψ = 1 ⊠ ν₂` is a discrete parameter (the trivial character is of orthogonal type:
hypothesis `h1`) with `S_ψ = 1`. (That `Π_ψ(ε_ψ)` is the trivial representation of `PGL₂(𝔸_F)`
needs the local packets of `TauCeti.Arthur.localPacket` and is not part of this statement.) -/
theorem so3_trivial (G : ClassicalGroup D) (hG : G.family = .symplectic) (hN : G.N = 2)
    (h1 : IsOrthogonalType D.toContext (1 : D.AutRep 1)) :
    ∃ ψ : GlobalParameter D G, ψ.summands = {⟨1, 1, 2⟩} ∧ ∀ s : ψ.componentGroup, s = 1 := by
  sorry

/-- `TauCeti.Arthur.GlobalParameter.so3_generic_iff` (test): for `G = SO₃`, a unitary cuspidal
`μ` of `GL₂(𝔸_F)` is a generic element `μ ⊠ ν₁` of `Ψ₂(SO₃)` iff `ω_μ = 1`. Supplier facts as
hypotheses: `μ` is self-dual iff `ω_μ = 1` (`μ^∨ ≅ μ ⊗ ω_μ⁻¹`), and `L^S(s, μ, ∧²) = L^S(s, ω_μ)`
with `L^S(s, ω)` having a pole at `1` iff `ω = 1`. -/
theorem so3_generic_iff (G : ClassicalGroup D) (hG : G.family = .symplectic) (hN : G.N = 2)
    (μ : D.AutRep 2) (hcusp : D.IsCuspidal μ) (hunit : D.IsUnitary μ)
    (hS : ∃ S, IsUnramifiedOutside D.toContext μ S)
    (hdual : D.dual μ = μ ↔ D.centralChar μ = 1)
    (hext : ∀ S, D.partialL μ (squareTag .ext2) S = D.heckeL (D.centralChar μ) S)
    (hzeta : ∀ (ω : D.AutRep 1) S, HasPoleAt (D.heckeL ω S) 1 ↔ ω = 1) :
    (∃ ψ : GlobalParameter D G, ψ.summands = {⟨2, μ, 1⟩}) ↔ D.centralChar μ = 1 := by
  sorry

/-- `TauCeti.Arthur.GlobalParameter.sp0_empty` (test): for `N = 0` (`G = SO₁`), `Ψ₂(G)` consists of
the empty sum only. -/
theorem sp0_empty (G : ClassicalGroup D) (hN : G.N = 0) (heta : G.eta = 1) :
    (∃ ψ : GlobalParameter D G, ψ.summands = 0) ∧ ∀ ψ : GlobalParameter D G, ψ.summands = 0 := by
  sorry

/-- `TauCeti.Arthur.GlobalParameter.repeated_not_discrete` (non-example): `μ ⊠ ν_b ⊞ μ ⊠ ν_b` is
not a discrete parameter: discrete parameters are multiplicity free. -/
theorem repeated_not_discrete (G : ClassicalGroup D) (x : Σ m : ℕ, D.AutRep m × ℕ) :
    ¬ ∃ ψ : GlobalParameter D G, ψ.summands = {x, x} := by
  rintro ⟨ψ, hψ⟩
  have h := ψ.nodup
  rw [hψ] at h
  simp at h

/-- `TauCeti.Arthur.GlobalParameter.wrongParity` (non-example): for `G = SO₃`
(`Ĝ = SL₂ = Sp₂`), `χ ⊠ ν₁ ⊞ χ' ⊠ ν₁` for quadratic characters is not in `Ψ₂(SO₃)`: each `χ ⊠ ν₁`
is orthogonal while `Ĝ` is symplectic (`∧²` of a character vanishes, so `χ` is not of symplectic
type: hypothesis `hχ`). -/
theorem wrongParity (G : ClassicalGroup D) (hG : G.family = .symplectic)
    (χ χ' : D.AutRep 1) (hχ : ¬ IsSymplecticType D.toContext χ)
    (hχ' : ¬ IsSymplecticType D.toContext χ') :
    ¬ ∃ ψ : GlobalParameter D G, ψ.summands = {⟨1, χ, 1⟩, ⟨1, χ', 1⟩} := by
  rintro ⟨ψ, hψ⟩
  have h := ψ.parity ⟨1, χ, 1⟩ (by rw [hψ]; simp)
  rw [hG] at h
  rcases h with h | h
  · exact hχ h.1
  · exact absurd h.2 (by norm_num)

/-- Review negative control: for orthogonal dual rank 3 and a single dimension-3 summand,
the determinant-one relation kills the sign. An unrestricted sign-group formula would fail. -/
theorem orthogonal_rank_three_component (G : ClassicalGroup D)
    (hG : G.family = .orthogonal) (hN : G.N = 3) (μ : D.AutRep 3)
    (ψ : GlobalParameter D G) (hψ : ψ.summands = {⟨3, μ, 1⟩}) :
    ∀ s : ψ.componentGroup, s = 1 := by
  sorry

end GlobalParameter

/-- `TauCeti.Arthur.localPacket` (ML.4/local-arthur-packets; Arthur, Theorem 1.5.1): at every
place `v` there are packets `Π̃_ψ` — finite multisets of pairs `(π, ⟨·, π⟩)` of unitary
representations and characters of `S_ψ` — for all bounded A-parameters `ψ` of `G`, satisfying the
stable and endoscopic character identities; for tempered `φ` the packet consists of tempered
representations, `π ↦ ⟨·, π⟩` is injective (bijective onto `Ŝ_φ` at finite `v`), and the tempered
packets are disjoint and exhaust the tempered dual (the local Langlands correspondence).
Conditional (ML.0/arthur-dependency-gate). -/
theorem localPacket (D : ArthurContext F) (hTWFL : D.twistedWeightedFL) (G : ClassicalGroup D)
    (v : D.Place) :
    ∃ pkt : ∀ ψ : LocalAParam D v, LocalPacket G v ψ,
      (∀ ψ, IsLocalAParamFor D G.family G.N ψ → IsBoundedParam D ψ →
        IsArthurPacket G v ψ (pkt ψ) ∧ ∀ p ∈ pkt ψ, G.IsUnitaryRep p.1) ∧
      (∀ φ, IsLocalAParamFor D G.family G.N φ → IsTemperedLParam D φ →
        (∀ p ∈ pkt φ, G.IsTemperedRep p.1) ∧ (pkt φ).Nodup ∧
        ((pkt φ).map Prod.snd).Nodup ∧
        (¬ D.IsArchimedean v → ∀ χ, ∃ p ∈ pkt φ, p.2 = χ)) ∧
      ∀ π : G.LocalIrr v, G.IsTemperedRep π →
        ∃! φ : LocalAParam D v, IsLocalAParamFor D G.family G.N φ ∧ IsTemperedLParam D φ ∧
          ∃ p ∈ pkt φ, p.1 = π := by
  sorry

open Classical in
/-- Arthur's multiplicity `m_ψ ∈ {1, 2}`: `2` exactly when `G` is even orthogonal and every
summand has even dimension `mᵢ bᵢ` (then `ψ` and its outer twist are not `SO_N(ℂ)`-conjugate). -/
def arthurMultiplicity {D : ArthurContext F} {G : ClassicalGroup D} (ψ : GlobalParameter D G) :
    ℕ :=
  if G.family = .orthogonal ∧ Even G.N ∧ ∀ x ∈ ψ.summands, Even (x.1 * x.2.2) then 2 else 1

/-- The families of local characters `(⟨·, π_v⟩)_v` realising `π` in the global packet
`Π̃_ψ(ε_ψ)`: `(π_v, χ_v) ∈ Π̃_{ψ_v}` for all `v`, `χ_v = 1` for almost all `v`, and
`∏_v χ_v` restricted to `S_ψ` is `ε_ψ`. -/
def packetCharacters {D : ArthurContext F} {G : ClassicalGroup D}
    (pkt : ∀ v (ψ : LocalAParam D v), LocalPacket G v ψ) (ψ : GlobalParameter D G)
    (π : G.GlobalRep) : Set (∀ v, LocalCharacter D G.family G.N (ψ.localize v)) :=
  {χ | (∀ v, (G.localComponent π v, χ v) ∈ pkt v (ψ.localize v)) ∧ {v | χ v ≠ 1}.Finite ∧
    ∀ a ∈ signKernel ↥ψ.index (decide (G.family = .orthogonal))
        (fun i => ((i.1.1 * i.1.2.2 : ℕ) : ZMod 2)),
      ∏ᶠ v, χ v (SignGroup.mk (ψ.localizeSigns v a)) =
        ψ.signCharacter (SignGroup.mk a)}

/-- `TauCeti.Arthur.multiplicity_formula` (ML.4/arthur-multiplicity-formula; Arthur, Theorem
1.5.2): for packets satisfying the character identities of `TauCeti.Arthur.localPacket` (for all
local components `ψ_v`, extended to unbounded `ψ_v` by induction as in Arthur §1.5),
`L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃₂(G)} ⊕_{π ∈ Π̃_ψ(ε_ψ)} m_ψ π`; and every discrete `π` transfers
weakly to the isobaric representation of its parameter. Conditional (twisted weighted
fundamental lemma). -/
theorem multiplicity_formula (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (pkt : ∀ v (ψ : LocalAParam D v), LocalPacket G v ψ)
    (hpkt : ∀ v ψ, IsLocalAParamFor D G.family G.N ψ → IsArthurPacket G v ψ (pkt v ψ)) :
    (∀ π : G.GlobalRep, G.discMult π =
      ∑ᶠ ψ : GlobalParameter D G, arthurMultiplicity ψ * Nat.card (packetCharacters pkt ψ π)) ∧
    ∀ π : G.GlobalRep, G.discMult π ≠ 0 →
      ∃ ψ : GlobalParameter D G, IsWeakTransfer G π ψ.toIsobaric := by
  sorry

end Arthur

end TauCeti

/-! ## ML.4/extended-langlands-parameter, registers -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-- `TauCeti.Arthur.ExtendedParameter` (ML.4/extended-langlands-parameter): an extended
Langlands parameter `(ϱ, χ_ϱ)` of the classical group `G` at the place `v`. -/
structure ExtendedParameter {D : ArthurContext F} (G : ClassicalGroup D) (v : D.Place) where
  /-- `TauCeti.Arthur.ExtendedParameter.parameter`: the Langlands parameter `ϱ`
  (trivial on the Arthur `SL₂`). -/
  parameter : LocalAParam D v
  isLParam : IsLocalAParamFor D G.family G.N parameter ∧ ∀ p ∈ parameter, p.2 = 1
  /-- `TauCeti.Arthur.ExtendedParameter.character`: the character `χ_ϱ` of `S_ϱ`. -/
  character : LocalCharacter D G.family G.N parameter

/-- `LL : Irr(G(F_v)) → Lang(G)` is the local Langlands correspondence of Arthur (normalised by the
fixed Whittaker datum): on tempered representations it lands in the packets of every family of
packets satisfying the character identities of `TauCeti.Arthur.localPacket`. -/
def IsLocalLanglands {D : ArthurContext F} (G : ClassicalGroup D) (v : D.Place)
    (LL : G.LocalIrr v → ExtendedParameter G v) : Prop :=
  ∀ pkt : ∀ ψ : LocalAParam D v, LocalPacket G v ψ,
    (∀ φ, IsLocalAParamFor D G.family G.N φ → IsTemperedLParam D φ →
      IsArthurPacket G v φ (pkt φ)) →
    ∀ π, G.IsTemperedRep π → (π, (LL π).character) ∈ pkt (LL π).parameter

/-- `TauCeti.Arthur.componentGroup_elementaryAbelianTwo`: `S_ϱ` is an elementary abelian
`2`-group. -/
theorem componentGroup_elementaryAbelianTwo (D : ArthurContext F) {v : D.Place}
    (fam : DualFamily) (N : ℕ) (ϱ : LocalAParam D v) (s : LocalComponentGroup D fam N ϱ) :
    s ^ 2 = 1 :=
  SignGroup.sq_eq_one s

/-- `TauCeti.Arthur.lPacket_equiv_characters`: for `G` quasi-split and `v` finite, the local
Langlands correspondence is a bijection `LL : Irr(G(F_v)) ≃ Lang(G)`, so each L-packet
`Π_ϱ = LL⁻¹(ϱ)` is in bijection with `Ŝ_ϱ`. Conditional (Arthur). -/
theorem lPacket_equiv_characters (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (v : D.Place) (hv : ¬ D.IsArchimedean v) :
    ∃ LL : G.LocalIrr v ≃ ExtendedParameter G v, IsLocalLanglands G v LL ∧
      ∀ ϱ : ExtendedParameter G v,
        Nonempty ({π : G.LocalIrr v // (LL π).parameter = ϱ.parameter} ≃
          LocalCharacter D G.family G.N ϱ.parameter) := by
  sorry

/-- `TauCeti.Arthur.ExtendedParameter.generic_iff`: for tempered `ϱ`, the member of `Π_ϱ` generic
for the fixed Whittaker datum is the one with `χ_ϱ = 1`. Conditional (Arthur). -/
theorem ExtendedParameter.generic_iff (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (v : D.Place) (hv : ¬ D.IsArchimedean v)
    (LL : G.LocalIrr v → ExtendedParameter G v) (hLL : IsLocalLanglands G v LL)
    (π : G.LocalIrr v) (hπ : G.IsTemperedRep π) :
    G.IsGenericRep π ↔ (LL π).character = 1 := by
  sorry

/-- `TauCeti.Arthur.ExtendedParameter.sl2_klein_four` (test): `G = SL₂` (`Ĝ = SO₃`, `N = 3`),
`ϱ` with image the Klein four-group: three distinct quadratic characters, `S_ϱ ≅ (ℤ/2)²`, so
`|Π_ϱ| = 4`. -/
theorem ExtendedParameter.sl2_klein_four (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (hG : G.family = .orthogonal) (hN : G.N = 3) (v : D.Place)
    (hv : ¬ D.IsArchimedean v) (ρ₁ ρ₂ ρ₃ : D.LIrr v)
    (hdim : D.lirrDim ρ₁ = 1 ∧ D.lirrDim ρ₂ = 1 ∧ D.lirrDim ρ₃ = 1)
    (hsd : D.lirrDual ρ₁ = ρ₁ ∧ D.lirrDual ρ₂ = ρ₂ ∧ D.lirrDual ρ₃ = ρ₃)
    (horth : ¬ D.lirrSymplectic ρ₁ ∧ ¬ D.lirrSymplectic ρ₂ ∧ ¬ D.lirrSymplectic ρ₃)
    (hne : ρ₁ ≠ ρ₂ ∧ ρ₁ ≠ ρ₃ ∧ ρ₂ ≠ ρ₃) :
    Nat.card (LocalComponentGroup D G.family G.N {(ρ₁, 1), (ρ₂, 1), (ρ₃, 1)}) = 4 ∧
      ∀ LL : G.LocalIrr v ≃ ExtendedParameter G v, IsLocalLanglands G v LL →
        Nat.card {π : G.LocalIrr v // (LL π).parameter = {(ρ₁, 1), (ρ₂, 1), (ρ₃, 1)}} = 4 := by
  sorry

/-- `TauCeti.Arthur.ExtendedParameter.so2_split` (test): `G = SO₂` split (`≅ GL₁`): every `S_ϱ`
is trivial, and the extended parameters that are sums of characters are the characters of
`F_v^×` (local class field theory) up to `χ ↦ χ⁻¹` — the outer automorphism, since `Lang` of
an even orthogonal group is taken up to it (see the report: the packet's `Lang(G°) ≅ Hom(F^×, ℂ^×)`
holds only before dividing by the outer automorphism). -/
theorem ExtendedParameter.so2_split (D : ArthurContext F) (G : ClassicalGroup D)
    (hG : G.family = .orthogonal) (hN : G.N = 2) (heta : G.eta = 1) (v : D.Place) :
    (∀ ϱ : LocalAParam D v, IsLocalAParamFor D G.family G.N ϱ → (∀ p ∈ ϱ, p.2 = 1) →
      ∀ s : LocalComponentGroup D G.family G.N ϱ, s = 1) ∧
    Nonempty ({e : ExtendedParameter G v // ∀ p ∈ e.parameter, D.lirrDim p.1 = 1} ≃
      Quot (fun ρ ρ' : {ρ : D.LIrr v // D.lirrDim ρ = 1} => ρ'.1 = D.lirrDual ρ.1)) := by
  sorry

/-- `TauCeti.Arthur.ExtendedParameter.sl2_size_two` (non-example to the `GL₂` situation):
`G = SL₂`, `ϱ = η ⊕ σ` the adjoint of a dihedral `Ind_{W_E}^{W_F} θ` with `θ/θ^c` not quadratic
(`η = η_{E/F}`, `σ = Ind(θ/θ^c)` irreducible orthogonal of dimension 2): `S_ϱ ≅ ℤ/2`, and the
L-packet has size `2`. -/
theorem ExtendedParameter.sl2_size_two (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (hG : G.family = .orthogonal) (hN : G.N = 3) (v : D.Place)
    (hv : ¬ D.IsArchimedean v) (η σ : D.LIrr v)
    (hdim : D.lirrDim η = 1 ∧ D.lirrDim σ = 2) (hsd : D.lirrDual η = η ∧ D.lirrDual σ = σ)
    (horth : ¬ D.lirrSymplectic η ∧ ¬ D.lirrSymplectic σ) :
    Nat.card (LocalComponentGroup D G.family G.N {(η, 1), (σ, 1)}) = 2 ∧
      ∀ LL : G.LocalIrr v ≃ ExtendedParameter G v, IsLocalLanglands G v LL →
        Nat.card {π : G.LocalIrr v // (LL π).parameter = {(η, 1), (σ, 1)}} = 2 := by
  sorry

/-- `TauCeti.Arthur.ExtendedParameter.unramified_trivial` (test): an unramified tempered `ϱ` of
`Sp_{2n}` (`Ĝ = SO_{2n+1}`) whose standard representation is a sum of distinct characters has
`S_ϱ = 1`, and `Π_ϱ` is the unramified representation. Supplier fact as hypothesis: there are at
most two unramified quadratic characters. -/
theorem ExtendedParameter.unramified_trivial (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (hG : G.family = .orthogonal) (v : D.Place)
    (hv : ¬ D.IsArchimedean v) (ϱ : LocalAParam D v)
    (hϱ : IsLocalAParamFor D G.family G.N ϱ) (htemp : IsTemperedLParam D ϱ)
    (hchar : ∀ p ∈ ϱ, D.lirrDim p.1 = 1 ∧ D.lirrUnramified p.1) (hdistinct : ϱ.Nodup)
    (hquad : ∀ ρ₁ ρ₂ ρ₃ : D.LIrr v, (∀ ρ ∈ [ρ₁, ρ₂, ρ₃], D.lirrDim ρ = 1 ∧
      D.lirrUnramified ρ ∧ D.lirrDual ρ = ρ) → ρ₁ = ρ₂ ∨ ρ₁ = ρ₃ ∨ ρ₂ = ρ₃) :
    (∀ s : LocalComponentGroup D G.family G.N ϱ, s = 1) ∧
      ∀ LL : G.LocalIrr v ≃ ExtendedParameter G v, IsLocalLanglands G v LL →
        ∃ π : G.LocalIrr v, G.IsUnramifiedRep π ∧
          ∀ π' : G.LocalIrr v, (LL π').parameter = ϱ ↔ π' = π := by
  sorry

/-- Status of an input in a register. -/
inductive InputStatus
  | provedInPrint
  | announced
  | openProblem
  deriving DecidableEq

/-- A registered input: the statement, its owner stage, its status and the source. -/
structure RegisteredInput where
  statement : String
  owner : String
  status : InputStatus
  source : String

/-- `TauCeti.Arthur.traceFormulaInputs` (ML.4/trace-formula-inputs-register): the trace-formula
inputs of Arthur's classification and of its unitary analogues, each with owner and status. The
register proves nothing; the corresponding `Prop` fields of `ArthurContext` are
`invariantTraceFormula`, `twistedTraceFormula`, `stabilisation`, `transferAndFL`,
`twistedWeightedFL` and `localIntertwiningRelation`. -/
def traceFormulaInputs : List RegisteredInput :=
  [ ⟨"Invariant trace formula of G", "AutomorphicSpectralTheory:AS.6", .provedInPrint,
      "Arthur, invariant trace formula"⟩,
    ⟨"Twisted trace formula of GL_N ⋊ θ", "AutomorphicSpectralTheory:AS.6 / ET.3",
      .provedInPrint, "Labesse–Waldspurger"⟩,
    ⟨"Stabilisation of the ordinary and twisted trace formula",
      "EndoscopicTransferAndUnitaryTraceComparison:ET.3", .provedInPrint,
      "Arthur; Mœglin–Waldspurger 2016"⟩,
    ⟨"Transfer of orbital integrals and the fundamental lemma",
      "EndoscopicTransferAndUnitaryTraceComparison:ET.3", .provedInPrint, "Waldspurger; Ngô"⟩,
    ⟨"Weighted fundamental lemma", "EndoscopicTransferAndUnitaryTraceComparison:ET.3",
      .provedInPrint, "Chaudouard–Laumon"⟩,
    ⟨"Twisted weighted fundamental lemma", "EndoscopicTransferAndUnitaryTraceComparison:ET.3",
      .announced, "Arthur [A24]–[A27]"⟩,
    ⟨"Local intertwining relation", "EndoscopicTransferAndUnitaryTraceComparison:ET.6",
      .provedInPrint, "Arthur §2.4 modulo [A25]–[A27]; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin"⟩ ]

/-- The status record of a conditional branch. -/
structure BranchStatus where
  /-- The registered inputs the branch is conditional on. -/
  conditionalOn : List RegisteredInput
  /-- The nodes of the branch (consumers carrying the hypotheses). -/
  nodes : List String
  /-- The verification tasks (i)–(iii). -/
  tasks : List String
  /-- Whether Mok's or KMSW's unitary results make the branch unconditional. -/
  unconditionalViaUnitary : Bool

/-- `TauCeti.Arthur.symplecticBranchStatus` (ML.4/symplectic-branch-status): the GSp₄ branch is
conditional on Arthur's classification for `Sp₄` and `SO₅` with the inputs of
`traceFormulaInputs` not proved in print; it is not made unconditional by the unitary results. -/
def symplecticBranchStatus : BranchStatus where
  conditionalOn := traceFormulaInputs.filter (fun i => i.status ≠ .provedInPrint)
  nodes := ["ML.4/gsp4-arthur-classification", "ML.4/gl4-symplectic-descent",
    "ML.4/non-general-type-reducible", "GSp₄ modularity (BCGP, Calegari–Geraghty)"]
  tasks := ["(i) list the statements of Arthur's book resting on [A24]–[A27] and on the twisted " ++
      "weighted fundamental lemma",
    "(ii) check for each whether a published proof now exists (Mœglin–Waldspurger; AGIKMS)",
    "(iii) record the remaining hypotheses as explicit hypotheses of every GSp₄ endpoint"]
  unconditionalViaUnitary := false

/-- The register is honest about the twisted weighted fundamental lemma. -/
example : (symplecticBranchStatus.conditionalOn.map RegisteredInput.statement) =
    ["Twisted weighted fundamental lemma"] := by
  decide

end Arthur

end TauCeti

/-! ## Unitary groups (Mok, KMSW) and odd orthogonal groups of all quadratic spaces -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-- A quadratic extension `E/F` of number fields with the supplier data over `E`. -/
structure QuadraticExtension (D : ArthurContext F) (E : Type) [Field E] [NumberField E] where
  /-- The supplier context over `E` (`GL_m(𝔸_E)`) (owner: AF.2, AL.3). -/
  DE : ArthurContext E
  /-- Galois conjugation `μ ↦ μ^c` (owner: AF.2). -/
  conj : ∀ {n : ℕ}, DE.AutRep n → DE.AutRep n
  /-- Asai L-functions `L^S(s, μ, As^±)` (`true` for `+`) (owner: AL.3). -/
  asaiL : ∀ {n : ℕ}, DE.AutRep n → Bool → Finset DE.Place → ℂ → ℂ
  /-- Base change `BC_{E/F} : GL_n(𝔸_F) → GL_n(𝔸_E)` (owner: ET.7a, Arthur–Clozel). -/
  baseChange : ∀ {n : ℕ}, D.AutRep n → DE.AutRep n

/-- `μ` is a unitary cuspidal conjugate-self-dual representation of sign `+` (`sgn = true`) or
`-`: `μ^∨ ≅ μ^c` and `L^S(s, μ, As^{sgn})` has a pole at `s = 1`. -/
def IsConjSelfDualOfSign {D : ArthurContext F} {E : Type} [Field E] [NumberField E]
    (Q : QuadraticExtension D E) {m : ℕ} (μ : Q.DE.AutRep m) (sgn : Bool) : Prop :=
  Q.DE.IsCuspidal μ ∧ Q.DE.IsUnitary μ ∧ Q.DE.dual μ = Q.conj μ ∧
    ∃ S, IsUnramifiedOutside Q.DE.toContext μ S ∧ HasPoleAt (Q.asaiL μ sgn S) 1

/-- A discrete global parameter of `U_{E/F}(N)` (Mok): `ψ = ⊞ μᵢ ⊠ ν_{bᵢ}`, multiplicity free,
`Σ mᵢ bᵢ = N`, each `μᵢ ⊠ ν_{bᵢ}` conjugate-self-dual of sign `(-1)^{N-1}` (through `ξ_{χ₊}`),
i.e. `μᵢ` of sign `(-1)^{N + bᵢ}`. -/
structure UnitaryParameter {D : ArthurContext F} {E : Type} [Field E] [NumberField E]
    (Q : QuadraticExtension D E) (N : ℕ) where
  summands : Multiset (Σ m : ℕ, Q.DE.AutRep m × ℕ)
  nodup : summands.Nodup
  dim_pos : ∀ x ∈ summands, 0 < x.1
  b_pos : ∀ x ∈ summands, 0 < x.2.2
  dim_eq : (summands.map fun x => x.1 * x.2.2).sum = N
  sign : ∀ x ∈ summands, IsConjSelfDualOfSign Q x.2.1 (decide (Even (N + x.2.2)))

namespace UnitaryParameter

variable {D : ArthurContext F} {E : Type} [Field E] [NumberField E] {Q : QuadraticExtension D E}
  {N : ℕ}

open Classical in
/-- The summands as an index set. -/
def index (ψ : UnitaryParameter Q N) : Finset (Σ m : ℕ, Q.DE.AutRep m × ℕ) :=
  ψ.summands.toFinset

/-- `S_ψ = (ℤ/2)^r / Z(Ĝ)^Γ`, `Z(Ĝ)^Γ = {±1}`. -/
abbrev componentGroup (ψ : UnitaryParameter Q N) : Type :=
  SignGroup ↥ψ.index false 0 (fun _ => 1)

/-- Generic: every `bᵢ = 1`. -/
def IsGeneric (ψ : UnitaryParameter Q N) : Prop := ∀ x ∈ ψ.summands, x.2.2 = 1

open Classical in
/-- Mok's `ε_ψ` on the generator `sᵢ`: `∏_{j ≠ i, bᵢ + bⱼ odd} ε(1/2, μᵢ × μⱼ^∨)^{min(bᵢ, bⱼ)}`. -/
def signValue (ψ : UnitaryParameter Q N) (i : ↥ψ.index) : ℤˣ :=
  ∏ j ∈ ψ.index.attach.filter (fun j => j ≠ i ∧ Odd (i.1.2.2 + j.1.2.2)),
    Q.DE.rootNumber i.1.2.1 (Q.DE.dual j.1.2.1) ^ min i.1.2.2 j.1.2.2

/-- `ε_ψ` on sign vectors. -/
def signHom (ψ : UnitaryParameter Q N) : (↥ψ.index → ZMod 2) →+ Additive ℤˣ where
  toFun a := Additive.ofMul (∏ i, ψ.signValue i ^ (a i).val)
  map_zero' := by simp
  map_add' a b := by sorry

/-- Mok's character `ε_ψ` of `S_ψ`. -/
def signCharacter (ψ : UnitaryParameter Q N) : ψ.componentGroup →* ℤˣ where
  toFun x := Additive.toMul (QuotientAddGroup.lift _
    (ψ.signHom.comp (signKernel _ false _).subtype) (by sorry) (Multiplicative.toAdd x))
  map_one' := by sorry
  map_mul' x y := by sorry

end UnitaryParameter

/-- A unitary group `G` over `F` attached to `E/F`: the quasi-split `U_{E/F}(N)` or an inner form
realised as an extended pure inner twist, with the supplier data of its representation theory. -/
structure UnitaryGroup {D : ArthurContext F} {E : Type} [Field E] [NumberField E]
    (Q : QuadraticExtension D E) where
  N : ℕ
  /-- `G` is quasi-split (owner: ReductiveGroups). -/
  IsQuasiSplit : Prop
  /-- Irreducible admissible representations of `G(F_v)` (owner: AF.1/ET.6). -/
  LocalIrr : D.Place → Type
  IsTemperedRep : ∀ {v : D.Place}, LocalIrr v → Prop
  TestFn : D.Place → Type
  trace : ∀ {v : D.Place}, LocalIrr v → TestFn v → ℂ
  /-- Local A-parameters of `G` at `v` (through base change to `E_v`) (owner: ET.7a, ET.6). -/
  LocalParam : D.Place → Type
  IsTemperedParam : ∀ {v : D.Place}, LocalParam v → Prop
  /-- Local component groups `S_{ψ_v}` (owner: ET.6). -/
  LocalS : ∀ {v : D.Place}, LocalParam v → Type
  localSGroup : ∀ {v : D.Place} (φ : LocalParam v), CommGroup (LocalS φ)
  /-- `s_{ψ_v}` (owner: ET.6). -/
  sPsiLocal : ∀ {v : D.Place} (φ : LocalParam v), LocalS φ
  /-- `f ↦ f'(ψ')` for the endoscopic datum of `x ∈ S_ψ` (`x = 1`: the stable side, the twisted
  character of `GL_N(E_v) ⋊ θ`) (owner: ET.3, ET.6). -/
  endoscopicSide : ∀ {v : D.Place} (φ : LocalParam v), LocalS φ → TestFn v → ℂ
  /-- KMSW: the group `S_φ^+` and the centre `Z(Ĝ)^+` (owner: ET.6). -/
  LocalSplus : ∀ {v : D.Place}, LocalParam v → Type
  localSplusGroup : ∀ {v : D.Place} (φ : LocalParam v), Group (LocalSplus φ)
  Zplus : D.Place → Type
  zplusGroup : ∀ v, Group (Zplus v)
  zplusMap : ∀ {v : D.Place} (φ : LocalParam v), Zplus v →* LocalSplus φ
  /-- The character of `Z(Ĝ)^+` determined by the extended pure inner twist (Kottwitz)
  (owner: ET.6). -/
  innerTwistChar : ∀ v, Zplus v →* ℂˣ
  /-- The refined endoscopic side `f ↦ e(G) f'(φ')` for `ṡ ∈ S_φ^+` (owner: ET.6). -/
  refinedEndoscopicSide : ∀ {v : D.Place} (φ : LocalParam v), LocalSplus φ → TestFn v → ℂ
  /-- Localisation `ψ ↦ ψ_v` of global parameters and of their sign vectors (owner: ET.7a). -/
  localize : UnitaryParameter Q N → ∀ v, LocalParam v
  localizeSigns : ∀ (ψ : UnitaryParameter Q N) (v : D.Place),
    (↥ψ.index → ZMod 2) → LocalS (localize ψ v)
  /-- Irreducible representations of `G(𝔸_F)` (owner: AF.2), local components, multiplicity in
  `L²_disc` (owner: AS.6), and the near-equivalence class of a parameter (owner: AS.6). -/
  GlobalRep : Type
  localComponent : GlobalRep → ∀ v, LocalIrr v
  discMult : GlobalRep → ℕ
  IsNearParam : GlobalRep → UnitaryParameter Q N → Prop
  /-- The further hypotheses KMSW list (owner: ML.0/arthur-dependency-gate). -/
  kmswHypotheses : Prop

attribute [instance] UnitaryGroup.localSGroup UnitaryGroup.localSplusGroup UnitaryGroup.zplusGroup

namespace UnitaryGroup

variable {D : ArthurContext F} {E : Type} [Field E] [NumberField E] {Q : QuadraticExtension D E}

/-- Character identities for a local packet of a unitary group. -/
def IsPacket (U : UnitaryGroup Q) {v : D.Place} (φ : U.LocalParam v)
    (pkt : Multiset (U.LocalIrr v × (U.LocalS φ →* ℤˣ))) : Prop :=
  ∀ x f, U.endoscopicSide φ x f =
    (pkt.map fun p => ((p.2 (U.sPsiLocal φ * x) : ℤ) : ℂ) * U.trace p.1 f).sum

/-- The global packet condition of the multiplicity formula. -/
def packetCharacters (U : UnitaryGroup Q)
    (pkt : ∀ v (φ : U.LocalParam v), Multiset (U.LocalIrr v × (U.LocalS φ →* ℤˣ)))
    (ψ : UnitaryParameter Q U.N) (π : U.GlobalRep) :
    Set (∀ v, U.LocalS (U.localize ψ v) →* ℤˣ) :=
  {χ | (∀ v, (U.localComponent π v, χ v) ∈ pkt v (U.localize ψ v)) ∧ {v | χ v ≠ 1}.Finite ∧
    ∀ a : ↥ψ.index → ZMod 2, ∏ᶠ v, χ v (U.localizeSigns ψ v a) =
      ψ.signCharacter (SignGroup.mk a)}

/-- Mok's classification for `U` (local packets with character identities giving the local
Langlands correspondence for tempered parameters, and the multiplicity-one formula). -/
def MokClassification (U : UnitaryGroup Q) : Prop :=
  (∀ v, ∃ pkt : ∀ φ : U.LocalParam v, Multiset (U.LocalIrr v × (U.LocalS φ →* ℤˣ)),
    (∀ φ, U.IsPacket φ (pkt φ)) ∧
    ∀ π : U.LocalIrr v, U.IsTemperedRep π →
      ∃! φ : U.LocalParam v, U.IsTemperedParam φ ∧ ∃ p ∈ pkt φ, p.1 = π) ∧
  ∀ pkt : ∀ v (φ : U.LocalParam v), Multiset (U.LocalIrr v × (U.LocalS φ →* ℤˣ)),
    (∀ v φ, U.IsPacket φ (pkt v φ)) →
    ∀ π : U.GlobalRep,
      U.discMult π = ∑ᶠ ψ : UnitaryParameter Q U.N, Nat.card (U.packetCharacters pkt ψ π)

end UnitaryGroup

/-- `TauCeti.Arthur.mok_multiplicity_formula` (ML.4/mok-unitary-classification): Mok's
endoscopic classification for the quasi-split `U_{E/F}(N)`. Conditional exactly as Arthur's book. -/
theorem mok_multiplicity_formula (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    {E : Type} [Field E] [NumberField E] (Q : QuadraticExtension D E) (U : UnitaryGroup Q)
    (hU : U.IsQuasiSplit) : U.MokClassification := by
  sorry

/-- `TauCeti.Arthur.kmsw_multiplicity_formula` (ML.4/kmsw-inner-forms): for an inner form `U` of
`U_{E/F}(N)` given as an extended pure inner twist: (local) every tempered `φ` has a packet in
bijection with the characters of `S_φ^+` restricting to the character of `Z(Ĝ)^+` of the inner
twist, satisfying the refined endoscopic character identities; (global) for generic `ψ`, the
`ψ`-part of `L²_disc` is given by Mok's formula. Conditional on Mok's classification for the
quasi-split form `U₀`, on the KMSW hypotheses and on the twisted weighted fundamental lemma. -/
theorem kmsw_multiplicity_formula (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    {E : Type} [Field E] [NumberField E] (Q : QuadraticExtension D E) (U U₀ : UnitaryGroup Q)
    (hN : U₀.N = U.N) (hU₀ : U₀.IsQuasiSplit) (hMok : U₀.MokClassification)
    (hKMSW : U.kmswHypotheses) :
    (∀ v (φ : U.LocalParam v), U.IsTemperedParam φ →
      ∃ pkt : Finset (U.LocalIrr v),
        ∃ e : ↥pkt ≃ {χ : U.LocalSplus φ →* ℂˣ // χ.comp (U.zplusMap φ) = U.innerTwistChar v},
          ∀ s f, U.refinedEndoscopicSide φ s f = ∑ π : ↥pkt, ((e π).1 s : ℂ) * U.trace π.1 f) ∧
    ∀ pkt : ∀ v (φ : U.LocalParam v), Multiset (U.LocalIrr v × (U.LocalS φ →* ℤˣ)),
      (∀ v φ, U.IsPacket φ (pkt v φ)) →
      ∀ (ψ : UnitaryParameter Q U.N), ψ.IsGeneric → ∀ π : U.GlobalRep, U.IsNearParam π ψ →
        U.discMult π = Nat.card (U.packetCharacters pkt ψ π) := by
  sorry

/-- The component group of `φ` in `Sp_{2n}(ℂ)` used for Vogan packets (no quotient by the centre). -/
abbrev VoganGroup (D : ArthurContext F) {v : D.Place} (φ : LocalAParam D v) : Type :=
  SignGroup ↥(goodIndex D .symplectic φ) false 0 0

open Classical in
/-- `z_φ`, the image of `-1 ∈ Sp_{2n}(ℂ)` in `S_φ`. -/
def zPhi (D : ArthurContext F) {v : D.Place} (φ : LocalAParam D v) : VoganGroup D φ :=
  SignGroup.mk (fun i => ((φ.count i.1 : ℕ) : ZMod 2))

/-- Supplier data for the special orthogonal groups `SO(V)` of the quadratic spaces `V` of
dimension `2n + 1` and trivial discriminant over `F_v`, all `n`. -/
structure OddOrthogonalLocal (D : ArthurContext F) (v : D.Place) where
  /-- Quadratic spaces of dimension `2n + 1`, trivial discriminant, up to isometry (owner:
  ReductiveGroups). -/
  Space : ℕ → Type
  /-- The split space `V⁺`. -/
  split : ∀ n, Space n
  /-- The normalised Hasse–Witt invariant `ε(V)`. -/
  hasseWitt : ∀ {n : ℕ}, Space n → ℤˣ
  /-- Irreducible representations of `SO(V)` (owner: AF.1/ET.6). -/
  Irr : ∀ {n : ℕ}, Space n → Type
  IsTemperedRep : ∀ {n : ℕ} {V : Space n}, Irr V → Prop
  IsSquareIntegrableRep : ∀ {n : ℕ} {V : Space n}, Irr V → Prop
  /-- The Vogan L-parameter and character of `σ` (Arthur for `V⁺`, Mœglin–Renard for `V⁻`),
  normalised by the Whittaker datum of `SO(V⁺)` (owner: this node's statement records its
  properties; characterised by the endoscopic character identities). -/
  voganParam : ∀ {n : ℕ} {V : Space n}, Irr V → LocalAParam D v
  voganChar : ∀ {n : ℕ} {V : Space n} (σ : Irr V), VoganGroup D (voganParam σ) →* ℤˣ
  /-- `V = H^k ⊕ V₀` and `Ind_Q^{SO(V)}(τ_ϕ ⊗ σ₀)` is irreducible, `τ_ϕ ∈ Irr GL_k(F_v)` attached
  to `ϕ` (owner: AF.1/ET.6). -/
  InducedIrreducible : ∀ {m : ℕ} (k : ℕ), D.LParam v k → (V₀ : Space m) → Irr V₀ → Prop
  /-- Irreducible subrepresentations of members of the A-packet `Π_ψ(SO(V⁺_m))` (owner: ET.6). -/
  aPacketSubreps : ∀ (m : ℕ), LocalAParam D v → Set (Irr (split m))
  /-- `ϕ` is almost tempered: `ϕ = ϕ_temp ⊗ |·|^s` with exponents in `(-1/2, 1/2)` (Gan–Ichino
  §5.2) (owner: ET.6). -/
  IsAlmostTempered : ∀ {k : ℕ}, D.LParam v k → Prop
  /-- Mœglin–Renard's hypothesis: Arthur-type results for the inner forms (proved for generic
  parameters by Ishimoto) (owner: ML.0/arthur-dependency-gate). -/
  innerFormHypothesis : Prop

/-- The Vogan packet `⊔_V Π_φ(SO(V))` over the spaces of dimension `2n + 1`. -/
abbrev voganFibre {D : ArthurContext F} {v : D.Place} (O : OddOrthogonalLocal D v) (n : ℕ)
    (φ : LocalAParam D v) : Type :=
  {x : Σ V : O.Space n, O.Irr V // O.voganParam x.2 = φ}

/-- `TauCeti.Arthur.voganPacket_so` (ML.4/vogan-packets-so-v): for an L-parameter `φ` of
`Sp_{2n}(ℂ)`: `⊔_V Π_φ(SO(V)) ↔ Ŝ_φ`, with `η(z_φ) = ε(V)` on `Π_φ(SO(V))`; `σ` is
square-integrable iff `φ` is multiplicity free of good parity, tempered iff `φ` is tempered.
(`Irr SO(V) = ⊔_φ Π_φ(SO(V))` is built in: `voganParam` is a function.) Conditional. -/
theorem voganPacket_so (D : ArthurContext F) (hTWFL : D.twistedWeightedFL) (v : D.Place)
    (O : OddOrthogonalLocal D v) (hMR : O.innerFormHypothesis) (n : ℕ) (φ : LocalAParam D v)
    (hφ : IsLocalAParamFor D .symplectic (2 * n) φ) (hL : ∀ p ∈ φ, p.2 = 1) :
    ∃ e : voganFibre O n φ ≃ (VoganGroup D φ →* ℤˣ),
      (∀ x : voganFibre O n φ, e x (zPhi D φ) = O.hasseWitt x.1.1) ∧
      (∀ x : voganFibre O n φ, O.IsSquareIntegrableRep x.1.2 ↔
        (φ.Nodup ∧ ∀ p ∈ φ, HasGoodParity D .symplectic p)) ∧
      (∀ x : voganFibre O n φ, O.IsTemperedRep x.1.2 ↔ IsBoundedParam D φ) := by
  sorry

/-- A global odd orthogonal group `SO(V)`, `dim V = 2n + 1`, trivial discriminant. -/
structure OddOrthogonalGlobal (D : ArthurContext F) where
  n : ℕ
  /-- The split form `SO_{2n+1}` with `Ĝ = Sp_{2n}(ℂ)` (its parameters index those of `SO(V)`). -/
  G₀ : ClassicalGroup D
  family_eq : G₀.family = .symplectic
  N_eq : G₀.N = 2 * n
  localData : ∀ v, OddOrthogonalLocal D v
  /-- `V_v`. -/
  localSpace : ∀ v, (localData v).Space n
  /-- Representations of `SO(V)(𝔸_F)`, components, `L²_disc` multiplicities (owner: AF.2,
  AS.6), and membership in `L²_Φ` (near equivalence) (owner: AS.6). -/
  GlobalRep : Type
  localComponent : GlobalRep → ∀ v, (localData v).Irr (localSpace v)
  discMult : GlobalRep → ℕ
  IsNearParam : GlobalRep → GlobalParameter D G₀ → Prop

open Classical in
/-- `TauCeti.Arthur.multiplicity_formula_so_nonsplit` (ML.4/amf-nonsplit-so-v; Gan–Ichino (6.1),
Ishimoto): (i) `L²_disc(SO(V)) = ⊕_Φ L²_Φ(SO(V))`; (ii) for generic `Φ`, `π ∈ L²_Φ` occurs with
multiplicity `m_η = 1` if `Δ^*η = 1` and `0` otherwise, `η = ⊗_v η_v` the Vogan characters of the
`π_v`. Conditional. -/
theorem multiplicity_formula_so_nonsplit (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (O : OddOrthogonalGlobal D) (hMR : ∀ v, (O.localData v).innerFormHypothesis) :
    (∀ π : O.GlobalRep, O.discMult π ≠ 0 → ∃! Φ : GlobalParameter D O.G₀, O.IsNearParam π Φ) ∧
    ∀ (Φ : GlobalParameter D O.G₀), Φ.IsGeneric → ∀ π : O.GlobalRep, O.IsNearParam π Φ →
      (∀ v, (O.localData v).voganParam (O.localComponent π v) = Φ.localize v) →
      (O.discMult π = 1 ↔ ∀ a : ↥Φ.index → ZMod 2,
        ∏ᶠ v, (O.localData v).voganChar (O.localComponent π v)
          (SignGroup.mk (fun j => ∑ i, a i * (if i.1.2.2 = j.1.2 then
            ((D.constituents (D.localParam i.1.2.1 v)).count j.1.1 : ZMod 2) else 0))) = 1) ∧
      O.discMult π ≤ 1 := by
  sorry

/-- `TauCeti.Arthur.induced_irreducible_of_almostTempered` (Gan–Ichino, Lemmas 5.1 and 5.5): for an
almost tempered symplectic parameter `φ = ϕ ⊕ ϕ^∨ ⊕ φ₀` (`ϕ` of dimension `k` with exponents in
`(-1/2, 1/2)`: hypothesis `halmost`), `Ind_Q^{SO(V)}(τ ⊗ σ₀)` is irreducible for all
`σ₀ ∈ Π_{φ₀}(SO(V₀))`; and (5.5) for `φ'₀ = φ₀ ⊕ S_{2r-2n}` and `2n < r - 1`, the induced
representations from irreducible subrepresentations `σ'₀` of members of `Π_{φ'₀}(SO_{2r-2k+1})`
are irreducible. -/
theorem induced_irreducible_of_almostTempered (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (v : D.Place) (O : OddOrthogonalLocal D v) (k m : ℕ) (ϕ : D.LParam v k)
    (φ₀ : LocalAParam D v) (halmost : O.IsAlmostTempered ϕ)
    (hφ₀ : IsLocalAParamFor D .symplectic (2 * m) φ₀) :
    (∀ (V₀ : O.Space m) (σ₀ : O.Irr V₀), O.voganParam σ₀ = φ₀ →
      O.InducedIrreducible k ϕ V₀ σ₀) ∧
    ∀ (r n : ℕ) (Sdim : D.LIrr v), 2 * n < r - 1 →
      (∀ σ'₀ ∈ O.aPacketSubreps (r - k) (φ₀ + {(Sdim, 2 * r - 2 * n)}),
        O.InducedIrreducible k ϕ (O.split (r - k)) σ'₀) := by
  sorry

end Arthur

end TauCeti

/-! ## Generic packets; GSp₄ (Gan–Takeda, Arthur–Gee–Taïbi, BCGP); Xu; archimedean packets -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

variable {F : Type} [Field F] [NumberField F]

/-- `TauCeti.Arthur.genericPacket_standardModule` (Jiang–Zhang, Proposition B.1): for a generic
L-parameter `φ` (its packet has a member generic for the Whittaker datum), every member of the
L-packet `Π_φ(G)` is an irreducible standard module. Stated for the quasi-split classical groups of
`ClassicalGroup` (pure inner forms are not modelled here). Conditional through the packets. -/
theorem genericPacket_standardModule (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (G : ClassicalGroup D) (v : D.Place) (LL : G.LocalIrr v → ExtendedParameter G v)
    (hLL : IsLocalLanglands G v LL) (φ : LocalAParam D v)
    (hgen : ∃ π, (LL π).parameter = φ ∧ G.IsGenericRep π) :
    ∀ π, (LL π).parameter = φ → G.IsIrreducibleStandardModule π := by
  sorry

namespace GSp4

/-- Supplier data for the archimedean group `GSp₄(ℝ)` (owner: AutomorphicFormsOnReductiveGroups
AF.1; ML.0/archimedean-langlands-conventions). -/
structure RealData where
  Irr : Type
  IsTemperedRep : Irr → Prop
  /-- Archimedean L-parameters `W_ℝ → GSp₄(ℂ)` and the parameter of `π`. -/
  Param : Type
  param : Irr → Param
  /-- The L-packet of `π`, `{σ | param σ = param π}`, and the Arthur packet of a parameter
  (owner: AF.1, ET.6). -/
  arthurPacket : Param → Set Irr
  /-- Infinitesimal character `(λ₁, λ₂; c)` of `π`. -/
  infChar : Irr → ℚ × ℚ × ℚ
  /-- Infinitesimal character of the transfer `π̃` to `GL₄(ℝ)` (spin embedding), as a multiset. -/
  spinInfChar : Param → Multiset ℚ
  /-- The (limits of) discrete series `π(λ, C_i)` with infinitesimal character `λ = (λ₁, λ₂; c)`
  and Weyl chamber `C_i`. -/
  ds : ℤ × ℤ × ℤ → ℕ → Irr
  /-- The holomorphic-type limit `π(λ)^h` and the generic limit `π(λ)^g` for `λ = (λ₁, 0; c)`. -/
  limitH : ℤ → ℤ → Irr
  limitG : ℤ → ℤ → Irr

/-- Supplier data for `GSp₄` over `F`. -/
structure Data (D : ArthurContext F) where
  /-- Irreducible admissible representations of `GSp₄(F_v)` (owner: AF.1, ET.6). -/
  LocalIrr : D.Place → Type
  IsGenericRep : ∀ {v : D.Place}, LocalIrr v → Prop
  IsSupercuspidal : ∀ {v : D.Place}, LocalIrr v → Prop
  IsEssDiscreteSeries : ∀ {v : D.Place}, LocalIrr v → Prop
  /-- L-parameters `WD_{F_v} → GSp₄(ℂ)` up to conjugacy, their composite with `GSp₄(ℂ) ⊂ GL₄(ℂ)`,
  their similitude character, and whether they avoid proper Levi subgroups (owner: ET.6). -/
  GSpParam : D.Place → Type
  spin : ∀ {v : D.Place}, GSpParam v → D.LParam v 4
  simil : ∀ {v : D.Place}, GSpParam v → D.LParam v 1
  IsDiscreteParam : ∀ {v : D.Place}, GSpParam v → Prop
  /-- `A_φ = π₀(Z(Im φ)/Z_{GSp₄})` (owner: ET.6). -/
  A : ∀ {v : D.Place}, GSpParam v → Type
  AGroup : ∀ {v : D.Place} (φ : GSpParam v), Group (A φ)
  /-- `L(s, ad ∘ φ)` is holomorphic at `s = 1` (owner: AL.3). -/
  AdjointHolomorphic : ∀ {v : D.Place}, GSpParam v → Prop
  /-- The local parameter of `π_v`: `rec_GT` at finite `v` (characterised by
  `TauCeti.Arthur.recGT`), the archimedean Langlands parameter at infinite `v` (AF.1). -/
  recParam : ∀ {v : D.Place}, LocalIrr v → GSpParam v
  /-- `rec(ω_{π_v})` (owner: ET.6). -/
  centralParam : ∀ {v : D.Place}, LocalIrr v → D.LParam v 1
  /-- Twists `π ⊗ (χ ∘ ν)` and `φ ⊗ χ` by a character with parameter `χ` (owner: ET.6). -/
  twistRep : ∀ {v : D.Place}, LocalIrr v → D.LParam v 1 → LocalIrr v
  twistParam : ∀ {v : D.Place}, GSpParam v → D.LParam v 1 → GSpParam v
  /-- Shahidi's `γ(s, π × σ)` (`σ ∈ Irr GL_r(F_v)` through its parameter) and the Artin
  `γ(s, φ ⊗ φ_σ)`; Plancherel measures `μ(s, π × σ)`, `μ(s, φ ⊗ φ_σ)` (owner: AL.3, ET.6). -/
  gammaRep : ∀ {v : D.Place}, LocalIrr v → ∀ r : ℕ, D.LParam v r → ℂ → ℂ
  gammaParam : ∀ {v : D.Place}, GSpParam v → ∀ r : ℕ, D.LParam v r → ℂ → ℂ
  plancherelRep : ∀ {v : D.Place}, LocalIrr v → ∀ r : ℕ, D.LParam v r → ℂ → ℂ
  plancherelParam : ∀ {v : D.Place}, GSpParam v → ∀ r : ℕ, D.LParam v r → ℂ → ℂ
  /-- Irreducible representations of `GSp₄(𝔸_F)`, components, central character, cuspidality,
  multiplicity in `L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π)` (owner: AF.2, AS.6). -/
  GlobalRep : Type
  localComponent : GlobalRep → ∀ v, LocalIrr v
  centralChar : GlobalRep → D.AutRep 1
  IsCuspidalRep : GlobalRep → Prop
  discMult : GlobalRep → ℕ
  /-- The one-dimensional representation `χ ∘ ν` (owner: AF.2). -/
  oneDim : D.AutRep 1 → GlobalRep
  /-- The archimedean data, and the archimedean components as representations of `GSp₄(ℝ)`
  (for real places). -/
  real : RealData
  toReal : ∀ {v : D.Place}, LocalIrr v → real.Irr
  /-- `π_∞` has the infinitesimal character of `φ_{(2; k_v - 1, l_v - 2)}` with `k_v ≥ l_v ≥ 2`,
  `k_v ≡ l_v (mod 2)` (owner: AF.1). -/
  HasWeights : GlobalRep → (D.Place → ℤ × ℤ) → Prop
  /-- `π` contributes to the coherent cohomology `H^i(X, W_µ)_(2)` for `µ = (a, b; c)`
  (owner: AF.4 / CohomologyOfShimuraVarieties). -/
  ContributesCoherent : GlobalRep → ℤ × ℤ × ℤ → Prop
  /-- Galois data (owner: AutomorphicGaloisRepresentations R19.1, AG2.2): `p`-adic
  representations `G_F → GSp₄(Q̄_p)`, attachment to `π`, reducibility, Weil–Deligne
  semisimplification at `v`, and `rec_{GT,p}(π_v ⊗ |ν|^{-3/2})^{ss}`. -/
  GalRep : ℕ → Type
  IsReducibleGal : ∀ {p : ℕ}, GalRep p → Prop
  wdSS : ∀ {p : ℕ}, GalRep p → ∀ v, GSpParam v
  recNormalizedSS : ∀ {v : D.Place}, LocalIrr v → GSpParam v
  /-- The Hecke eigensystem of `π_f` is congruent to a non-Eisenstein maximal ideal (owner:
  ML.0/gsp4-galois-l-packet). -/
  IsNonEisenstein : GlobalRep → Prop
  /-- Pairings preserved by the Galois representation attached to `π` (owner: AG2.2). -/
  PreservesSymplecticPairing : ∀ {p : ℕ}, GalRep p → Prop
  ResidualSymplectic : ∀ {p : ℕ}, GalRep p → Prop
  ResiduallyAbsIrreducible : ∀ {p : ℕ}, GalRep p → Prop
  RestrictionAbsIrreducible : ∀ {p : ℕ}, GalRep p → ∀ (K : Type) [Field K] [NumberField K], Prop
  /-- `r` is the `p`-adic representation attached to `π` (owner: R19.1). -/
  IsAttached : ∀ {p : ℕ}, GlobalRep → GalRep p → Prop

attribute [instance] Data.AGroup

variable {D : ArthurContext F}

/-- Gan–Takeda's characterising properties (i), (iii), (v), (vi) of a map `r` at `v`. -/
def GanTakedaCharacterising (G : Data D) (v : D.Place) (r : G.LocalIrr v → G.GSpParam v) : Prop :=
  (∀ π, G.IsEssDiscreteSeries π ↔ G.IsDiscreteParam (r π)) ∧
  (∀ π, G.simil (r π) = G.centralParam π) ∧
  (∀ π, (G.IsGenericRep π ∨ ¬ G.IsSupercuspidal π) →
    ∀ r' ≤ 2, ∀ σ : D.LParam v r', G.gammaRep π r' σ = G.gammaParam (r π) r' σ) ∧
  (∀ π, ¬ G.IsGenericRep π → G.IsSupercuspidal π →
    ∀ r' ≤ 2, ∀ σ : D.LParam v r', G.plancherelRep π r' σ = G.plancherelParam (r π) r' σ)

/-- All the properties (i)–(vii) of `rec_GT` at `v`. -/
def GanTakedaProperties (G : Data D) (v : D.Place) (r : G.LocalIrr v → G.GSpParam v) : Prop :=
  Function.Surjective r ∧ (∀ φ, Set.Finite {π | r π = φ}) ∧
  GanTakedaCharacterising G v r ∧
  (∀ φ, (Nat.card (G.A φ) = 1 ∨ Nat.card (G.A φ) = 2) ∧
    ∃ e : {π // r π = φ} ≃ (G.A φ →* ℂˣ),
      Nat.card (G.A φ) = 2 → ∀ π, G.IsGenericRep π.1 ↔ e π = 1) ∧
  (∀ π χ, r (G.twistRep π χ) = G.twistParam (r π) χ) ∧
  (∀ (r' : ℕ) (σ : D.LParam v r') π, (G.IsGenericRep π ∨ ¬ G.IsSupercuspidal π) →
    G.gammaRep π r' σ = G.gammaParam (r π) r' σ) ∧
  ∀ φ, (∃ π, r π = φ ∧ G.IsGenericRep π) ↔ G.AdjointHolomorphic φ

/-- The field `recParam` of the data is Gan–Takeda's map at every finite place. -/
def Data.IsGanTakeda (G : Data D) : Prop :=
  ∀ v, ¬ D.IsArchimedean v → GanTakedaProperties G v G.recParam

end GSp4

/-- `TauCeti.Arthur.recGT` (ML.4/gan-takeda-llc-gsp4): at a finite place there is a surjective
finite-to-one map `rec_GT` with the properties (i)–(vii), and (viii) it is unique among maps with
(i), (iii), (v), (vi) for `r ≤ 2`. -/
theorem recGT (D : ArthurContext F) (G : GSp4.Data D) (v : D.Place) (hv : ¬ D.IsArchimedean v) :
    (∃ r : G.LocalIrr v → G.GSpParam v, GSp4.GanTakedaProperties G v r) ∧
    ∀ r r' : G.LocalIrr v → G.GSpParam v, GSp4.GanTakedaCharacterising G v r →
      GSp4.GanTakedaCharacterising G v r' → r = r' := by
  sorry

namespace GSp4

variable {D : ArthurContext F}

/-- `TauCeti.Arthur.GSp4.IsDiscrete`: `π` occurs in `L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π)`. -/
def IsDiscrete (G : Data D) (π : G.GlobalRep) : Prop := G.discMult π ≠ 0

/-- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith`: a cuspidal `Π` of `GL_n(𝔸_F)` (`n = 4`; `n = 2` for
the `GSp₂ = GL₂` analogue) is of symplectic type with multiplier `χ`:
`L^S(s, Π, ∧² ⊗ χ⁻¹)` has a pole at `s = 1`. -/
def IsSymplecticTypeWith (D : ArthurContext F) {n : ℕ} (Pgl : D.AutRep n) (χ : D.AutRep 1) :
    Prop :=
  D.IsCuspidal Pgl ∧ ∃ S, IsUnramifiedOutside D.toContext Pgl S ∧
    HasPoleAt (D.twistedSquareL Pgl .ext2 χ⁻¹ S) 1

/-- `TauCeti.Arthur.GSp4.IsGeneralType`: a discrete `π` is of general type if there is a cuspidal
`Π` of `GL₄(𝔸_F)` of symplectic type with multiplier `ω_π` with `rec(Π_v) = spin ∘ rec(π_v)` at
every place `v`. -/
def IsGeneralType (G : Data D) (π : G.GlobalRep) : Prop :=
  IsDiscrete G π ∧ ∃ Pgl : D.AutRep 4, IsSymplecticTypeWith D Pgl (G.centralChar π) ∧
    ∀ v, D.localParam Pgl v = G.spin (G.recParam (G.localComponent π v))

/-- `TauCeti.Arthur.GSp4.transfer`: the transfer `Π` of a general-type `π` (unique by strong
multiplicity one). -/
def transfer (G : Data D) (π : G.GlobalRep) (h : IsGeneralType G π) : D.AutRep 4 :=
  h.2.choose

/-- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual`: `Π ≅ Π^∨ ⊗ χ`. -/
theorem IsSymplecticTypeWith.selfDual {n : ℕ} {Pgl : D.AutRep n} {χ : D.AutRep 1}
    (h : IsSymplecticTypeWith D Pgl χ) : Pgl = D.twist (D.dual Pgl) χ := by
  sorry

/-- `TauCeti.Arthur.GSp4.ArthurType`: the six types of discrete representations of `GSp₄`
(Gee–Taïbi Remark 6.1.4: `S_ψ = 1, ℤ/2, 1, ℤ/2, ℤ/2, 1`). -/
inductive ArthurType
  /-- (a) general type: `Π` cuspidal of symplectic type. -/
  | general
  /-- (b) Yoshida type: `μ₁ ⊞ μ₂`. -/
  | yoshida
  /-- (c) Soudry type: `μ ⊠ ν₂`. -/
  | soudry
  /-- (d) Saito–Kurokawa type: `μ ⊞ χ ⊠ ν₂`. -/
  | saitoKurokawa
  /-- (e) Howe–Piatetski-Shapiro type: `χ₁ ⊠ ν₂ ⊞ χ₂ ⊠ ν₂`. -/
  | howePS
  /-- (f) one-dimensional type: `χ ⊠ ν₄`. -/
  | oneDimensional
  deriving DecidableEq

/-- `π` weakly transfers to `Π` (`rec(Π_v) = spin ∘ rec(π_v)` for almost all `v`). -/
def IsWeakTransfer (G : Data D) (π : G.GlobalRep) (Pgl : D.AutRep 4) : Prop :=
  ∀ᶠ v in cofinite, D.localParam Pgl v = G.spin (G.recParam (G.localComponent π v))

/-- `χ ⊠ ν₂` as the isobaric sum `χ|·|^{1/2} ⊞ χ|·|^{-1/2}`. -/
def speh2 (D : ArthurContext F) (χ : D.AutRep 1) : D.AutRep 2 :=
  D.isobaricSum (χ * D.absPow (1 / 2)) (χ * D.absPow (-1 / 2))

/-- `π` has Arthur type `t`, read off from the shape of its weak transfer to `GL₄`. -/
def HasType (G : Data D) (π : G.GlobalRep) : ArthurType → Prop
  | .general => ∃ Pgl : D.AutRep 4, IsSymplecticTypeWith D Pgl (G.centralChar π) ∧
      IsWeakTransfer G π Pgl
  | .yoshida => ∃ μ₁ μ₂ : D.AutRep 2, D.IsCuspidal μ₁ ∧ D.IsCuspidal μ₂ ∧ μ₁ ≠ μ₂ ∧
      D.centralChar μ₁ = G.centralChar π ∧ D.centralChar μ₂ = G.centralChar π ∧
      IsWeakTransfer G π (D.isobaricSum μ₁ μ₂)
  | .soudry => ∃ μ : D.AutRep 2, D.IsCuspidal μ ∧
      (∃ S, HasPoleAt (D.twistedSquareL μ .sym2 (G.centralChar π)⁻¹ S) 1) ∧
      IsWeakTransfer G π (D.isobaricSum (D.twist μ (D.absPow (1 / 2)))
        (D.twist μ (D.absPow (-1 / 2))))
  | .saitoKurokawa => ∃ (μ : D.AutRep 2) (χ : D.AutRep 1), D.IsCuspidal μ ∧
      D.centralChar μ = G.centralChar π ∧ χ * χ = G.centralChar π ∧
      IsWeakTransfer G π (D.isobaricSum μ (speh2 D χ))
  | .howePS => ∃ χ₁ χ₂ : D.AutRep 1, χ₁ ≠ χ₂ ∧ χ₁ * χ₁ = G.centralChar π ∧
      χ₂ * χ₂ = G.centralChar π ∧
      IsWeakTransfer G π (D.isobaricSum (speh2 D χ₁) (speh2 D χ₂))
  | .oneDimensional => ∃ χ : D.AutRep 1, χ * χ = G.centralChar π ∧
      IsWeakTransfer G π (D.isobaricSum (D.isobaricSum (χ * D.absPow (3 / 2))
        (χ * D.absPow (1 / 2))) (D.isobaricSum (χ * D.absPow (-1 / 2)) (χ * D.absPow (-3 / 2))))

/-- `TauCeti.Arthur.GSp4.isGeneralType_iff_typeA`: a discrete `π` is of general type iff it is of
type (a). Conditional (the classification). -/
theorem isGeneralType_iff_typeA (hTWFL : D.twistedWeightedFL) (G : Data D)
    (hrec : G.IsGanTakeda) (π : G.GlobalRep) (hπ : IsDiscrete G π) :
    IsGeneralType G π ↔ HasType G π .general := by
  sorry

/-- `TauCeti.Arthur.GSp4.yoshida_not_general` (non-example): a discrete `π` weakly transferring to
`μ₁ ⊞ μ₂` (a Yoshida lift) is not of general type. Supplier fact as hypothesis: strong
multiplicity one for isobaric representations (Jacquet–Shalika). -/
theorem yoshida_not_general (G : Data D) (π : G.GlobalRep) (μ₁ μ₂ : D.AutRep 2)
    (hπ : IsWeakTransfer G π (D.isobaricSum μ₁ μ₂))
    (hSMO : ∀ Pgl : D.AutRep 4, D.IsCuspidal Pgl →
      ¬ ∀ᶠ v in cofinite, D.localParam Pgl v = D.localParam (D.isobaricSum μ₁ μ₂) v) :
    ¬ IsGeneralType G π := by
  rintro ⟨-, Pgl, hP, hloc⟩
  exact hSMO Pgl hP.1 (hπ.mono fun v hv => (hloc v).trans hv.symm)

/-- `TauCeti.Arthur.GSp4.oneDimensional_typeF` (test): `χ ∘ ν` is discrete, of type (f), with
transfer `χ|·|^{3/2} ⊞ χ|·|^{1/2} ⊞ χ|·|^{-1/2} ⊞ χ|·|^{-3/2}`. -/
theorem oneDimensional_typeF (G : Data D) (χ : D.AutRep 1) :
    IsDiscrete G (G.oneDim χ) ∧
      IsWeakTransfer G (G.oneDim χ) (D.isobaricSum (D.isobaricSum (χ * D.absPow (3 / 2))
        (χ * D.absPow (1 / 2))) (D.isobaricSum (χ * D.absPow (-1 / 2)) (χ * D.absPow (-3 / 2)))) ∧
      HasType G (G.oneDim χ) .oneDimensional := by
  sorry

/-- `TauCeti.Arthur.GSp4.sym3_symplectic` (test): for `π` cuspidal on `GL₂` not dihedral nor
tetrahedral, `Sym³π` (ML.5/kim-shahidi-sym3; here `Π`, cuspidal) is of symplectic type with
multiplier `ω_π³`: `∧²(Sym³) = Sym⁴ ⊗ det ⊕ det³`, so
`L^S(s, Π, ∧² ⊗ ω⁻³) = L^S(s, Sym⁴π ⊗ ω⁻²) ζ_F^S(s)` (hypothesis `hfac`), with the first factor
non-zero at `1` (Kim–Shahidi; hypothesis `hL4`). -/
theorem sym3_symplectic (π : D.AutRep 2) (Pgl : D.AutRep 4) (hcusp : D.IsCuspidal Pgl)
    (hS : ∃ S, IsUnramifiedOutside D.toContext Pgl S)
    (L4 : Finset D.Place → ℂ → ℂ)
    (hfac : ∀ S s, D.twistedSquareL Pgl .ext2 (D.centralChar π ^ 3)⁻¹ S s =
      L4 S s * D.heckeL 1 S s)
    (hL4 : ∀ S, HasNonzeroLimitAt (L4 S) 1) (hzeta : ∀ S, HasPoleAt (D.heckeL 1 S) 1) :
    IsSymplecticTypeWith D Pgl (D.centralChar π ^ 3) := by
  sorry

/-- `TauCeti.Arthur.GSp4.symplectic_iff_gl2` (compatibility): every cuspidal `Π` of `GL₂` is of
symplectic type with multiplier `ω_Π`, since `∧²Π = ω_Π` (hypothesis `hext`). -/
theorem symplectic_iff_gl2 (Pgl : D.AutRep 2) (hcusp : D.IsCuspidal Pgl)
    (hS : ∃ S, IsUnramifiedOutside D.toContext Pgl S)
    (hext : ∀ S, D.twistedSquareL Pgl .ext2 (D.centralChar Pgl)⁻¹ S = D.heckeL 1 S)
    (hzeta : ∀ S, HasPoleAt (D.heckeL 1 S) 1) :
    IsSymplecticTypeWith D Pgl (D.centralChar Pgl) := by
  obtain ⟨S, hS⟩ := hS
  exact ⟨hcusp, S, hS, by rw [hext]; exact hzeta S⟩

/-- `TauCeti.Arthur.GSp4.classification` (ML.4/gsp4-arthur-classification; Arthur 2004,
Gee–Taïbi): every discrete `π` has exactly one of the six types, with a transfer compatible with
`rec_GT` at every finite place; for a general-type parameter `Π` (`S_ψ = 1`, archimedean packet =
L-packet) every `⊗'_v π'_v` with `spin ∘ rec(π'_v) = rec(Π_v)` for all `v` is discrete with
multiplicity one. Conditional. -/
theorem classification (hTWFL : D.twistedWeightedFL) (G : Data D) (hrec : G.IsGanTakeda) :
    (∀ π : G.GlobalRep, IsDiscrete G π →
      (∃! t : ArthurType, HasType G π t) ∧
      ∃ Pgl : D.AutRep 4, ∀ v, ¬ D.IsArchimedean v →
        D.localParam Pgl v = G.spin (G.recParam (G.localComponent π v))) ∧
    ∀ (Pgl : D.AutRep 4) (χ : D.AutRep 1), IsSymplecticTypeWith D Pgl χ →
      ∀ σ : G.GlobalRep, G.centralChar σ = χ →
        (∀ v, D.localParam Pgl v = G.spin (G.recParam (G.localComponent σ v))) → G.discMult σ = 1 := by
  sorry

/-- `TauCeti.Arthur.GSp4.reducible_of_not_generalType` (BCGP Lemma 2.9.1): a discrete `π` with the
archimedean weights `(k_v, l_v)`, `k_v ≥ l_v ≥ 2`, `k_v ≡ l_v (mod 2)`, not of general type, has
reducible `p`-adic Galois representations with
`WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{-3/2})^{ss}` for almost all `v`. Conditional. -/
theorem reducible_of_not_generalType (hTWFL : D.twistedWeightedFL) (G : Data D)
    (hrec : G.IsGanTakeda) (π : G.GlobalRep) (hπ : IsDiscrete G π)
    (wt : D.Place → ℤ × ℤ) (hwt : G.HasWeights π wt)
    (hkl : ∀ v, D.IsArchimedean v → (wt v).2 ≥ 2 ∧ (wt v).1 ≥ (wt v).2 ∧
      (wt v).1 ≡ (wt v).2 [ZMOD 2])
    (hnot : ¬ IsGeneralType G π) :
    ∀ p : ℕ, p.Prime → ∃ ρ : G.GalRep p, G.IsReducibleGal ρ ∧ G.IsAttached π ρ ∧
      ∀ᶠ v in cofinite, G.wdSS ρ v = G.recNormalizedSS (G.localComponent π v) := by
  sorry

/-- `TauCeti.Arthur.GSp4.descent_of_symplecticType` (BCGP Theorem 2.9.3): for `Π` cuspidal on `GL₄`
of symplectic type with multiplier `χ`, every `π = ⊗'_v π_v` with `π_v` in the L-packet of
`(rec(Π_v), χ_v)` is discrete with multiplicity one and central character `χ`, such `π` exist, and
they are cuspidal if `Π` is (regular) algebraic. Conditional. -/
theorem descent_of_symplecticType (hTWFL : D.twistedWeightedFL) (G : Data D)
    (hrec : G.IsGanTakeda) (Pgl : D.AutRep 4) (χ : D.AutRep 1)
    (hP : IsSymplecticTypeWith D Pgl χ) :
    (∃ π : G.GlobalRep, G.centralChar π = χ ∧
      ∀ v, D.localParam Pgl v = G.spin (G.recParam (G.localComponent π v))) ∧
    ∀ π : G.GlobalRep, G.centralChar π = χ →
      (∀ v, D.localParam Pgl v = G.spin (G.recParam (G.localComponent π v))) →
      G.discMult π = 1 ∧ (D.IsRegularAlgebraic Pgl → G.IsCuspidalRep π) := by
  sorry

end GSp4

/-- `TauCeti.Arthur.exteriorSquare_nonvanishing` (Shahidi): for unitary cuspidal `Π` on
`GL_{2n}` and unitary `ω`, at `s = 1` the function has a simple pole or a nonzero limit, and the pole occurs iff `Π` is of symplectic type
with multiplier `ω⁻¹`; and for characters `ψ` with `Π ≇ Π ⊗ ψψ'⁻¹` (`ψ ≠ ψ'`, from the
cuspidality of the base change `Π'`), at most one `L^S(s, Π, ∧² ⊗ ωψ)` has a pole at `1`. -/
theorem exteriorSquare_nonvanishing (D : ArthurContext F) (n : ℕ) (Pgl : D.AutRep (2 * n))
    (hcusp : D.IsCuspidal Pgl) (hunit : D.IsUnitary Pgl)
    (ω : D.AutRep 1) (hω : D.IsUnitary ω) (S : Finset D.Place)
    (hS : IsUnramifiedOutside D.toContext Pgl S) :
    (HasSimplePoleAt (D.twistedSquareL Pgl .ext2 ω S) 1 ∨
      HasNonzeroLimitAt (D.twistedSquareL Pgl .ext2 ω S) 1) ∧
    (HasPoleAt (D.twistedSquareL Pgl .ext2 ω S) 1 ↔ GSp4.IsSymplecticTypeWith D Pgl ω⁻¹) ∧
    ∀ chars : Finset (D.AutRep 1), (∀ ψ ∈ chars, D.IsUnitary ψ) →
      (∀ ψ ∈ chars, ∀ ψ' ∈ chars, ψ ≠ ψ' → D.twist Pgl (ψ * ψ'⁻¹) ≠ Pgl) →
      Set.Subsingleton {ψ | ψ ∈ chars ∧ HasPoleAt (D.twistedSquareL Pgl .ext2 (ω * ψ) S) 1} := by
  sorry

end Arthur

end TauCeti

/-! ## Archimedean GSp₄ packets, unitary descent, Xu, Adams–Johnson, Mœglin–Renard -/

namespace TauCeti

namespace Arthur

open Langlands Filter Topology

namespace GSp4

variable {F : Type} [Field F] [NumberField F] {D : ArthurContext F}

/-- `TauCeti.Arthur.GSp4.limitPacket` (Blasius–Harris–Ramakrishnan Prop. 5.3.7): for
`λ = (λ₁, 0; c)` with `λ₁ < 0`, the archimedean L-packet containing `π(λ)^h` is
`{π(λ)^g, π(λ)^h}` (Calegari–Geraghty's `{π(λ, C₀), π(λ, C₁)}`), and (conditionally on Arthur's
classification) for a general-type parameter it is the archimedean Arthur packet. -/
theorem limitPacket (G : Data D) (l1 c : ℤ) (hl : l1 < 0) :
    {σ | G.real.param σ = G.real.param (G.real.limitH l1 c)} =
      {G.real.limitG l1 c, G.real.limitH l1 c} ∧ G.real.limitG l1 c ≠ G.real.limitH l1 c ∧
    (D.twistedWeightedFL →
      G.real.arthurPacket (G.real.param (G.real.limitH l1 c)) =
        {G.real.limitG l1 c, G.real.limitH l1 c}) := by
  sorry

end GSp4

namespace GSp4

/-- `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries` (Schmidt; Pilloni Prop. 15.2.4.1):
over `ℚ`, a discrete `π = π_f ⊗ π(λ)^h` (`λ = (λ₁, 0; c)`, `λ₁ < 0`) is of general, Yoshida or
Saito–Kurokawa type; if its Hecke eigensystem is non-Eisenstein it is of general type, and then
`π_f ⊗ π(λ)^g` is discrete as well, both with multiplicity one. Conditional. -/
theorem generalType_of_limitDiscreteSeries {D : ArthurContext ℚ} (hTWFL : D.twistedWeightedFL)
    (G : Data D) (hrec : G.IsGanTakeda) (vinf : D.Place) (hvinf : D.IsArchimedean vinf)
    (π : G.GlobalRep) (hπ : IsDiscrete G π) (l1 c : ℤ) (hl : l1 < 0)
    (hinf : G.toReal (G.localComponent π vinf) = G.real.limitH l1 c) :
    (HasType G π .general ∨ HasType G π .yoshida ∨ HasType G π .saitoKurokawa) ∧
    (G.IsNonEisenstein π → HasType G π .general ∧
      ∀ π' : G.GlobalRep, (∀ v, v ≠ vinf → G.localComponent π' v = G.localComponent π v) →
        G.toReal (G.localComponent π' vinf) = G.real.limitG l1 c →
        G.discMult π' = 1 ∧ G.discMult π = 1) := by
  sorry

/-- `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter` (Calegari–Geraghty Theorem 5.6): for
`µ = (a, b; c)`, `w = -(a + b + 2c)` and `π` contributing to `H^i(X, W_µ)_(2)`: (1) `π_∞` has
infinitesimal character `(a - 1, b - 2; -w)`; (2) its transfer to `GL₄(ℝ)` has infinitesimal
character `((a+b-3-w)/2, (a-b+1-w)/2, (-a+b-1-w)/2, (-a-b+3-w)/2)`; (3) if `π_∞` is tempered it
is a (limit of) discrete series `π((a-1, b-2; -w), C_i)`. -/
theorem transfer_infinitesimalCharacter {D : ArthurContext ℚ} (G : Data D) (vinf : D.Place)
    (hvinf : D.IsArchimedean vinf) (a b c : ℤ) (π : G.GlobalRep) (hπ : IsDiscrete G π)
    (hcoh : G.ContributesCoherent π (a, b, c)) :
    let w : ℤ := -(a + b + 2 * c)
    G.real.infChar (G.toReal (G.localComponent π vinf)) = ((a - 1 : ℚ), (b - 2 : ℚ), (-w : ℚ)) ∧
    G.real.spinInfChar (G.real.param (G.toReal (G.localComponent π vinf))) =
      {((a + b - 3 - w : ℚ) / 2), ((a - b + 1 - w : ℚ) / 2), ((-a + b - 1 - w : ℚ) / 2),
        ((-a - b + 3 - w : ℚ) / 2)} ∧
    (G.real.IsTemperedRep (G.toReal (G.localComponent π vinf)) →
      ∃ i : ℕ, G.toReal (G.localComponent π vinf) = G.real.ds (a - 1, b - 2, -w) i) := by
  sorry

/-- `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent` (Calegari–Geraghty Lemma 6.9): for `π` of
general type over `ℚ` with Galois representation `r`, and `K` imaginary quadratic with `r|_{G_K}`
absolutely irreducible: `BC_{K/ℚ}(Π)` is conjugate self-dual and descends to a discrete
representation of the quasi-split `U(4)` (Mok), and the pairing preserved by `r` is symplectic
(Bellaïche–Chenevier), so an absolutely irreducible reduction preserves a symplectic pairing.
Conditional. -/
theorem symplectic_of_unitaryDescent {D : ArthurContext ℚ} (hTWFL : D.twistedWeightedFL)
    (G : Data D) (hrec : G.IsGanTakeda) (π : G.GlobalRep) (hgen : IsGeneralType G π)
    (p : ℕ) (r : G.GalRep p) (hr : G.IsAttached π r)
    (K : Type) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2)
    [NumberField.IsTotallyComplex K] (Q : QuadraticExtension D K)
    (hirr : G.RestrictionAbsIrreducible r K) (U : UnitaryGroup Q) (hU4 : U.N = 4)
    (hU : U.IsQuasiSplit) :
    (Q.DE.dual (Q.baseChange (transfer G π hgen)) = Q.conj (Q.baseChange (transfer G π hgen)) ∧
      ∃ σ : U.GlobalRep, U.discMult σ ≠ 0 ∧ ∃ ψ : UnitaryParameter Q U.N,
        U.IsNearParam σ ψ ∧ ψ.summands = {⟨4, Q.baseChange (transfer G π hgen), 1⟩}) ∧
    G.PreservesSymplecticPairing r ∧
    (G.ResiduallyAbsIrreducible r → G.ResidualSymplectic r) := by
  sorry

end GSp4

variable {F : Type} [Field F] [NumberField F]

/-- Supplier data for Xu's packets of `PGSp_{2n}(F_v)`, `v` finite. -/
structure XuLocal (D : ArthurContext F) (v : D.Place) where
  /-- Irreducible representations of `PGSp_{2n}(F_v)` and of `Sp_{2n}(F_v)` (owner: ET.6). -/
  Irr : Type
  SpIrr : Type
  /-- Constituents of the restriction to `Sp_{2n}(F_v)`; `PGSp_{2n}(F_v)`-conjugacy. -/
  restrictConstituents : Irr → Set SpIrr
  /-- L-parameters `φ♭` of `Sp_{2n}` and Arthur's L-packets `Π_{φ♭}` (owner: ML.4/local-arthur-
  packets, ET.6). -/
  SpParam : Type
  spPacket : SpParam → Set SpIrr
  /-- `Π_{φ♭}` has trivial central character (for `n = 3`: `φ♭` lifts to `Spin₇(ℂ)`). -/
  TrivialCentral : SpParam → Prop
  /-- Quadratic characters `Hom(F_v^×, μ₂) ≅ Hom(W_{F_v}, μ₂)` and twisting by `χ ∘ ν`. -/
  QuadChar : Type
  quadGroup : CommGroup QuadChar
  twistIrr : Irr → QuadChar → Irr
  /-- The lifts `Φ̃_{φ♭}` of `φ♭` to the dual group of `PGSp_{2n}`, with the twisting action. -/
  Lift : SpParam → Type
  twistLift : ∀ {φ : SpParam}, Lift φ → QuadChar → Lift φ
  /-- Irreducible representations of `S_φ/Z` (owner: ET.6). -/
  IrrSZ : ∀ {φ : SpParam}, Lift φ → Type
  /-- The stability and endoscopic character identities for a packet with a labelling by
  `Irr(S_φ/Z)` (owner: ET.3/ET.6). -/
  Identities : ∀ {φ : SpParam} (φl : Lift φ) (X : Set Irr), (↥X → IrrSZ φl) → Prop

/-- `TauCeti.Arthur.xuPacket` (Xu; Gan–Savin for `n = 3`): `Π̃_{φ♭}` (representations of `PGSp_{2n}`
with restriction in `Π_{φ♭}`) is partitioned into packets `Π̃^X` with (a) the packets the twists of
one by quadratic characters; (b) restriction a bijection `Π̃^X → Π_{φ♭}/PGSp_{2n}(F)`; (c), (d) for
every lift `φ` a bijection `Π̃^X ≃ Irr(S_φ/Z)` satisfying the character identities; (e) equal
stabilisers in `Hom(F^×, μ₂)`. (Which lift belongs to which packet is not determined.)
Conditional through Arthur's classification. -/
theorem xuPacket (D : ArthurContext F) (hTWFL : D.twistedWeightedFL) (v : D.Place)
    (hv : ¬ D.IsArchimedean v) (X : XuLocal D v) (φb : X.SpParam) (hφ : X.TrivialCentral φb) :
    ∃ part : Set (Set X.Irr),
      (∀ π, (X.restrictConstituents π).Nonempty ∧ X.restrictConstituents π ⊆ X.spPacket φb ↔
        ∃ P ∈ part, π ∈ P) ∧
      (∀ P ∈ part, ∀ Q ∈ part, ∀ π ∈ P, π ∈ Q → P = Q) ∧
      (∀ P ∈ part, ∀ χ, (fun π => X.twistIrr π χ) '' P ∈ part) ∧
      (∀ P ∈ part, ∀ Q ∈ part, ∃ χ, Q = (fun π => X.twistIrr π χ) '' P) ∧
      (∀ P ∈ part, ∀ τ ∈ X.spPacket φb, ∃! π, π ∈ P ∧ τ ∈ X.restrictConstituents π) ∧
      (∀ P ∈ part, ∀ φl : X.Lift φb, ∃ e : ↥P ≃ X.IrrSZ φl, X.Identities φl P e) ∧
      (∀ P ∈ part, ∀ π ∈ P, ∀ φl : X.Lift φb,
        {χ | X.twistIrr π χ = π} = {χ | X.twistLift φl χ = φl}) := by
  sorry

/-- Supplier data for the discrete spectrum of `PGSp_{2n}` over `F`. -/
structure XuGlobal (D : ArthurContext F) where
  /-- `Sp_{2n}` as a classical group (`Ĝ = SO_{2n+1}(ℂ)`). -/
  Gsp : ClassicalGroup D
  family_eq : Gsp.family = .orthogonal
  /-- Representations of `PGSp_{2n}(𝔸_F)`, cuspidality, temperedness, multiplicity in
  `L²_disc` (owner: AF.2, AS.6). -/
  GlobalRep : Type
  IsCuspidalRep : GlobalRep → Prop
  discMult : GlobalRep → ℕ
  /-- Xu's global packet `⊗_v Π̃^X_{Ψ♭_v}` containing `Σ` (owner: built from `xuPacket`). -/
  globalPacket : GlobalRep → Set GlobalRep
  /-- The restriction of `Σ` to `Sp_{2n}` has the A-parameter `Ψ♭` (owner: AS.6). -/
  HasRestrictionParam : GlobalRep → GlobalParameter D Gsp → Prop

/-- `TauCeti.Arthur.xu_multiplicity_formula` (Xu): if `Σ` is cuspidal on `PGSp_{2n}` (as used,
`n = 3`) and its restriction to `Sp_{2n}` has a generic A-parameter `Ψ♭` with trivial global
component group, every element of the global packet containing `Σ` is automorphic (tempered part
of Xu's multiplicity formula). Conditional. -/
theorem xu_multiplicity_formula (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (X : XuGlobal D) (Sg : X.GlobalRep) (hcusp : X.IsCuspidalRep Sg) (hdisc : X.discMult Sg ≠ 0)
    (ψ : GlobalParameter D X.Gsp) (hgen : ψ.IsGeneric) (hS : ∀ s : ψ.componentGroup, s = 1)
    (hres : X.HasRestrictionParam Sg ψ) :
    ∀ Sg' ∈ X.globalPacket Sg, X.discMult Sg' ≠ 0 := by
  sorry

/-- Supplier data for Arthur packets of a quasi-split real classical or unitary group. -/
structure RealArthurData where
  Irr : Type
  /-- Archimedean A-parameters and their component groups (owner: AF.1, ET.6). -/
  AParam : Type
  S : AParam → Type
  SGroup : ∀ ψ, CommGroup (S ψ)
  /-- Cohomological (Adams–Johnson): regular integral infinitesimal character, factoring through
  a Levi `L` as `ξ ∘ ψ_L` with `Π_{ψ_L}` a unitary character (owner: AF.1). -/
  IsCohomological : AParam → Prop
  /-- Arthur's packet `Π(ψ_ℝ)` with its characters, normalised by the Whittaker datum of sign
  `δ` (owner: ML.4/local-arthur-packets, Mok). -/
  arthurPacket : ℤˣ → (ψ : AParam) → Multiset (Irr × (S ψ →* ℤˣ))
  /-- The Adams–Johnson packet `{A_{𝔮_w}(w⁻¹λ)}` and the characters it predicts (owner: AF.1). -/
  ajPacket : AParam → Finset Irr
  ajChar : (ψ : AParam) → Irr → (S ψ →* ℤˣ)

attribute [instance] RealArthurData.SGroup

/-- `TauCeti.Arthur.adamsJohnson_eq_arthurPacket` (Arancibia–Mœglin–Renard): for a cohomological
`ψ_ℝ`, Arthur's packet is the Adams–Johnson packet, each member with multiplicity one and with the
Adams–Johnson characters. -/
theorem adamsJohnson_eq_arthurPacket (R : RealArthurData) (ψ : R.AParam)
    (hψ : R.IsCohomological ψ) :
    R.arthurPacket 1 ψ = (R.ajPacket ψ).val.map fun π => (π, R.ajChar ψ π) := by
  sorry

/-- Supplier data for the Mœglin–Renard theorem on `Sp_{2g}(ℝ)`. -/
structure MoeglinRenardData (D : ArthurContext F) where
  /-- `Sp_{2g}` (`Ĝ = SO_{2g+1}(ℂ)`) and a real place. -/
  Gsp : ClassicalGroup D
  family_eq : Gsp.family = .orthogonal
  vinf : D.Place
  real : RealArthurData
  /-- `ψ ↦ ψ_∞` (owner: ET.6). -/
  toReal : GlobalParameter D Gsp → real.AParam
  /-- The scalar holomorphic unitary lowest weight module `ρ_k(g)` (owner: AF.1). -/
  rho : ℕ → real.Irr
  /-- `ψ_∞` has the infinitesimal character of `ρ_k(g)`. -/
  HasInfCharOf : real.AParam → ℕ → Prop
  /-- The characters `1` and `ε_{ℂ/ℝ}` of `W_ℝ` (owner: AF.1). -/
  trivChar : D.LIrr vinf
  signChar : D.LIrr vinf
  /-- Case (I) of [MR, Thm 7.1(i)] (not stated in the packet; owner: this node's source). -/
  CaseI : GlobalParameter D Gsp → ℕ → Prop
  /-- `C_ψ → S_{ψ_∞}` (owner: ET.6). -/
  Cpsi : real.AParam → Type
  CGroup : ∀ ψ, Group (Cpsi ψ)
  Cincl : ∀ ψ, Cpsi ψ →* real.S ψ

attribute [instance] MoeglinRenardData.CGroup

open Classical in
/-- `TauCeti.Arthur.moeglinRenard_packet` (Mœglin–Renard): for `1 ≤ k ≤ g` and a global parameter
`ψ` of `Sp_{2g}` with `ψ_∞` of the infinitesimal character of `ρ_k(g)`: `ρ_k(g) ∈ Π(ψ_ℝ)` iff case
(I) or case (H) — (H1) some `i₀` with `b_{i₀} = 2(g - k) + 1` and `L((μ_{i₀})_∞) ∋ ε^k`, or (H2)
some `i₀` with `b_{i₀} = 2(g - k) + 3` and `L((μ_{i₀})_∞) ∋ ε^{k-1}`; then `ρ_k(g)` has
multiplicity one, and the restriction of its character to `C_ψ` does not depend on the sign `δ` of
the Whittaker datum. Conditional for global uses. -/
theorem moeglinRenard_packet (D : ArthurContext F) (hTWFL : D.twistedWeightedFL)
    (M : MoeglinRenardData D) (g k : ℕ) (hk : 1 ≤ k ∧ k ≤ g) (hN : M.Gsp.N = 2 * g + 1)
    (ψ : GlobalParameter D M.Gsp) (hinf : M.HasInfCharOf (M.toReal ψ) k) :
    let epsPow : ℕ → D.LIrr M.vinf := fun j => if Even j then M.trivChar else M.signChar
    ((∃ p ∈ M.real.arthurPacket 1 (M.toReal ψ), p.1 = M.rho k) ↔
      M.CaseI ψ k ∨
      (∃ x ∈ ψ.summands, x.2.2 = 2 * (g - k) + 1 ∧
        epsPow k ∈ D.constituents (D.localParam x.2.1 M.vinf)) ∨
      (∃ x ∈ ψ.summands, x.2.2 = 2 * (g - k) + 3 ∧
        epsPow (k - 1) ∈ D.constituents (D.localParam x.2.1 M.vinf))) ∧
    ((M.real.arthurPacket 1 (M.toReal ψ)).filter
      (fun p : M.real.Irr × (M.real.S (M.toReal ψ) →* ℤˣ) => p.1 = M.rho k)).card ≤ 1 ∧
    ∀ p ∈ M.real.arthurPacket 1 (M.toReal ψ), ∀ q ∈ M.real.arthurPacket (-1) (M.toReal ψ),
      p.1 = M.rho k → q.1 = M.rho k →
        p.2.comp (M.Cincl (M.toReal ψ)) = q.2.comp (M.Cincl (M.toReal ψ)) := by
  sorry

end Arthur

end TauCeti


/-!
## ML.5 — known functorial transfers and frontier conjectures (`TauCeti.Functoriality`)

Algebraic representations `R : GL_n → GL_N` are modelled concretely (`AlgRep`): a homomorphism
`GL_n(ℂ) →* GL_N(ℂ)` whose matrix entries are polynomials in the entries of `g` and `det(g)⁻¹`.
`det`, `χ ↦ χ^k`, `Sym^k` on `GL₂`, `Sym²` and `∧²` on `GL_n` are given by explicit polynomial
matrices (`AlgRep.ofPoly`). Local L-parameters are supplier data (`Langlands.Context.LParam`), so the
action `φ ↦ R ∘ φ` on them is a field `applyParam` of the extension `FunctorialityContext`, with the
two functoriality laws that hold by definition of `R ∘ φ`.

Theorems of other roadmaps that the API lemmas use (strong multiplicity one, compatibility of the
local Langlands correspondence with central characters and isobaric sums, the unramified
dictionary) are packaged as `Prop`-valued structures (`LLCCompat`, `UnramifiedCompat`) and passed
as explicit hypotheses.

-- NOTE: the existence theorems of ML.5 (Gelbart–Jacquet, Kim–Shahidi, Kim, Ramakrishnan, Newton–
-- Thorne's SP_n for n ≤ 5, Arthur–Clozel base change, CKPSS, GRS descent, Gan–Ichino's
-- globalisation) are statements about the owners' genuine supplier instance. For arbitrary context
-- data they are false (e.g. `AutRep 3` may be empty), and no finite list of context laws implies
-- them; they take the compatibility hypotheses they need and are marked `-- NOTE:` individually.
-/

set_option linter.dupNamespace false

namespace TauCeti

namespace Functoriality

open Langlands

/-- `GL_n(ℂ)` as the group of units of `n × n` complex matrices. -/
abbrev GLC (n : ℕ) : Type := Matrix.GeneralLinearGroup (Fin n) ℂ

/-- The matrix with polynomial entries `P i j` (in the entries `X (a, b)` of `g`) evaluated at `g`. -/
def polyMatrix {n : ℕ} {ι : Type} (P : ι → ι → MvPolynomial (Fin n × Fin n) ℂ)
    (g : Matrix (Fin n) (Fin n) ℂ) : Matrix ι ι ℂ :=
  Matrix.of fun i j => MvPolynomial.eval (fun p : Fin n × Fin n => g p.1 p.2) (P i j)

/-- The polynomial matrix `P` is multiplicative: `P(1) = 1` and `P(gh) = P(g) P(h)`. -/
def IsPolyHom {n : ℕ} {ι : Type} [Fintype ι] [DecidableEq ι]
    (P : ι → ι → MvPolynomial (Fin n × Fin n) ℂ) : Prop :=
  polyMatrix P 1 = 1 ∧ ∀ g h : Matrix (Fin n) (Fin n) ℂ, polyMatrix P (g * h) = polyMatrix P g * polyMatrix P h

/-- An algebraic representation `R : GL_n → GL_N` over `ℂ`: a group homomorphism
`GL_n(ℂ) →* GL_N(ℂ)` whose matrix entries are `det(g)^{-k}` times polynomials in the entries of `g`
(a homomorphism of complex algebraic groups). Used by `TauCeti.Functoriality.IsFunctorialLift`. -/
structure AlgRep (n N : ℕ) where
  /-- The homomorphism on complex points. -/
  toHom : GLC n →* GLC N
  /-- Algebraicity: entries are polynomials in `g` and `det(g)⁻¹`. -/
  isAlgebraic : ∃ (k : ℕ) (P : Fin N → Fin N → MvPolynomial (Fin n × Fin n) ℂ),
    ∀ g : GLC n, ((toHom g : GLC N) : Matrix (Fin N) (Fin N) ℂ) =
      ((g : Matrix (Fin n) (Fin n) ℂ).det)⁻¹ ^ k • polyMatrix P (g : Matrix (Fin n) (Fin n) ℂ)

namespace AlgRep

/-- The identity representation `std : GL_n → GL_n`. -/
def id (n : ℕ) : AlgRep n n where
  toHom := MonoidHom.id _
  isAlgebraic := ⟨0, fun i j => MvPolynomial.X (i, j), by sorry⟩

/-- Composition `R' ∘ R` of algebraic representations. -/
def comp {n N M : ℕ} (R' : AlgRep N M) (R : AlgRep n N) : AlgRep n M where
  toHom := R'.toHom.comp R.toHom
  isAlgebraic := by sorry

/-- The algebraic representation given by a multiplicative polynomial matrix `P` on an index type
`ι`, transported to `Fin N` along `e : ι ≃ Fin N`. -/
def ofPoly {n N : ℕ} {ι : Type} [Fintype ι] [DecidableEq ι] (e : ι ≃ Fin N)
    (P : ι → ι → MvPolynomial (Fin n × Fin n) ℂ) (hP : IsPolyHom P) : AlgRep n N where
  toHom :=
    { toFun := fun g =>
        ⟨Matrix.reindex e e (polyMatrix P (g : Matrix (Fin n) (Fin n) ℂ)),
          Matrix.reindex e e (polyMatrix P ((g⁻¹ : GLC n) : Matrix (Fin n) (Fin n) ℂ)),
          by sorry, by sorry⟩
      map_one' := by sorry
      map_mul' := by sorry }
  isAlgebraic := ⟨0, fun i j => P (e.symm i) (e.symm j), by sorry⟩

/-- The determinant as a polynomial in the entries. -/
def detPoly (n : ℕ) : MvPolynomial (Fin n × Fin n) ℂ :=
  (Matrix.mvPolynomialX (Fin n) (Fin n) ℂ).det

/-- `det^k : GL_n → GL_1`. -/
def detPow (n k : ℕ) : AlgRep n 1 :=
  ofPoly (Equiv.refl (Fin 1)) (fun _ _ => detPoly n ^ k) (by sorry)

/-- `det : GL_n → GL_1`. -/
def det (n : ℕ) : AlgRep n 1 := detPow n 1

/-- The matrix entries of `Sym^k : GL₂ → GL_{k+1}` in the basis `e₀^{k-i} e₁^i`: the coefficient of
`e₀^{k-i} e₁^i` in `(g e₀)^{k-j} (g e₁)^j`, where `g e₀ = g₀₀ e₀ + g₁₀ e₁`, `g e₁ = g₀₁ e₀ + g₁₁ e₁`. -/
def symPowPoly (k : ℕ) (i j : Fin (k + 1)) : MvPolynomial (Fin 2 × Fin 2) ℂ :=
  let x : Fin 2 × Fin 2 → MvPolynomial (Fin 2) (MvPolynomial (Fin 2 × Fin 2) ℂ) :=
    fun p => MvPolynomial.C (MvPolynomial.X p)
  let Y : Fin 2 → MvPolynomial (Fin 2) (MvPolynomial (Fin 2 × Fin 2) ℂ) := MvPolynomial.X
  MvPolynomial.coeffAddMonoidHom (Finsupp.single 0 (k - (i : ℕ)) + Finsupp.single 1 (i : ℕ))
    ((x (0, 0) * Y 0 + x (1, 0) * Y 1) ^ (k - (j : ℕ)) * (x (0, 1) * Y 0 + x (1, 1) * Y 1) ^ (j : ℕ))

/-- `Sym^k : GL₂ → GL_{k+1}`. -/
def symPow (k : ℕ) : AlgRep 2 (k + 1) :=
  ofPoly (Equiv.refl (Fin (k + 1))) (symPowPoly k) (by sorry)

/-- Index set `{(a, b) : a < b}` of the basis `e_a ∧ e_b` of `∧²ℂⁿ`. -/
abbrev Ext2Idx (n : ℕ) : Type := {p : Fin n × Fin n // p.1 < p.2}

/-- Index set `{(a, b) : a ≤ b}` of the basis `e_a e_b` of `Sym²ℂⁿ`. -/
abbrev Sym2Idx (n : ℕ) : Type := {p : Fin n × Fin n // p.1 ≤ p.2}

/-- Entries of `∧²`: `g(e_i ∧ e_j) = Σ_{a<b} (g_{ai} g_{bj} − g_{bi} g_{aj}) e_a ∧ e_b`. -/
def ext2Poly (n : ℕ) (r c : Ext2Idx n) : MvPolynomial (Fin n × Fin n) ℂ :=
  MvPolynomial.X (r.1.1, c.1.1) * MvPolynomial.X (r.1.2, c.1.2) -
    MvPolynomial.X (r.1.2, c.1.1) * MvPolynomial.X (r.1.1, c.1.2)

/-- Entries of `Sym²`: `g(e_i e_j) = Σ_{a≤b} c_{ab} e_a e_b` with `c_{ab} = g_{ai}g_{bj} + g_{bi}g_{aj}`
for `a < b` and `c_{aa} = g_{ai} g_{aj}`. -/
def sym2Poly (n : ℕ) (r c : Sym2Idx n) : MvPolynomial (Fin n × Fin n) ℂ :=
  if r.1.1 = r.1.2 then MvPolynomial.X (r.1.1, c.1.1) * MvPolynomial.X (r.1.1, c.1.2)
  else MvPolynomial.X (r.1.1, c.1.1) * MvPolynomial.X (r.1.2, c.1.2) +
    MvPolynomial.X (r.1.2, c.1.1) * MvPolynomial.X (r.1.1, c.1.2)

/-- `∧² : GL_n → GL_{n(n-1)/2}`. -/
def ext2 (n : ℕ) : AlgRep n (n.choose 2) :=
  ofPoly (Fintype.equivFinOfCardEq (by sorry)) (ext2Poly n) (by sorry)

/-- `Sym² : GL_n → GL_{n(n+1)/2}`. -/
def sym2 (n : ℕ) : AlgRep n ((n + 1).choose 2) :=
  ofPoly (Fintype.equivFinOfCardEq (by sorry)) (sym2Poly n) (by sorry)

end AlgRep

/-- The Kronecker product `a ⊗ b ∈ GL_{mn}(ℂ)` (indices `Fin m × Fin n ≃ Fin (m * n)`). -/
def glKron {m n : ℕ} (a : GLC m) (b : GLC n) : GLC (m * n) :=
  ⟨Matrix.reindex finProdFinEquiv finProdFinEquiv
      (Matrix.kronecker (a : Matrix (Fin m) (Fin m) ℂ) (b : Matrix (Fin n) (Fin n) ℂ)),
    Matrix.reindex finProdFinEquiv finProdFinEquiv
      (Matrix.kronecker ((a⁻¹ : GLC m) : Matrix (Fin m) (Fin m) ℂ) ((b⁻¹ : GLC n) : Matrix (Fin n) (Fin n) ℂ)),
    by sorry, by sorry⟩

example : Nat.choose 4 2 = 6 := by decide
example : Nat.choose (3 + 1) 2 = 6 := by decide
example : Fintype.card (AlgRep.Ext2Idx 4) = 6 := by decide
example : Fintype.card (AlgRep.Sym2Idx 3) = 6 := by decide

/-! ### The supplier interface of ML.5 -/

/-- The supplier interface of ML.5: `Langlands.Context` extended by the action of algebraic
representations on L-parameters, Satake parameters and Langlands L-functions. Prerequisites:
EndoscopicTransferAndUnitaryTraceComparison ET.6, ML.0/archimedean-langlands-conventions,
AutomorphicLFunctionsAndLocalFactors AL.2–AL.4. -/
structure FunctorialityContext (F : Type) [Field F] [NumberField F] extends Langlands.Context F where
  /-- `R ∘ φ` for an L-parameter `φ` of `GL_n` at `v` and an algebraic representation `R`
  (definitional once parameters are homomorphisms; parameters owned by ET.6 at finite places and
  ML.0/archimedean-langlands-conventions at archimedean ones). -/
  applyParam : ∀ {n N : ℕ}, AlgRep n N → (v : Place) → LParam v n → LParam v N
  /-- `std ∘ φ = φ` (law of the action, true by definition of `R ∘ φ`). -/
  applyParam_id : ∀ {n : ℕ} (v : Place) (φ : LParam v n), applyParam (AlgRep.id n) v φ = φ
  /-- `(R' ∘ R) ∘ φ = R' ∘ (R ∘ φ)` (law of the action, true by definition of `R ∘ φ`). -/
  applyParam_comp : ∀ {n N M : ℕ} (R' : AlgRep N M) (R : AlgRep n N) (v : Place) (φ : LParam v n),
    applyParam (R'.comp R) v φ = applyParam R' v (applyParam R v φ)
  /-- Direct sum `φ₁ ⊕ φ₂` of L-parameters (owner: ET.6). -/
  sumParam : ∀ {m n : ℕ} (v : Place), LParam v m → LParam v n → LParam v (m + n)
  /-- Tensor product `φ₁ ⊗ φ₂` of L-parameters (owner: ET.6). -/
  tensorParam : ∀ {m n : ℕ} (v : Place), LParam v m → LParam v n → LParam v (m * n)
  /-- Twist `φ ⊗ χ` of an L-parameter by a character (owner: ET.6). -/
  twistParam : ∀ {n : ℕ} (v : Place), LParam v n → LParam v 1 → LParam v n
  /-- The unramified L-parameter of `W_{F_v}` sending a geometric Frobenius to `t`, at finite `v`
  (owner: ET.6). -/
  unramParam : ∀ {n : ℕ} (v : Place), GLC n → LParam v n
  /-- A representative of the Satake parameter `c_v(π)` of `π_v` at a finite place where `π_v` is
  unramified, meaningful up to conjugacy (owner: AutomorphicLFunctionsAndLocalFactors AL.2). -/
  satake : ∀ {n : ℕ}, AutRep n → Place → GLC n
  /-- The absolute norm `q_v` of a finite place `v`. -/
  normPlace : Place → ℕ
  /-- The partial Langlands L-function `L^S(s, π, R)` along an algebraic representation `R`, given
  by its values off its poles (owner: AutomorphicLFunctionsAndLocalFactors AL.3). -/
  langlandsL : ∀ {n N : ℕ}, AutRep n → AlgRep n N → Finset Place → ℂ → ℂ
  /-- The partial Rankin–Selberg L-function `L^S(s, π₁ × π₂)` (owner: AL.3). -/
  rankinSelbergL : ∀ {m n : ℕ}, AutRep m → AutRep n → Finset Place → ℂ → ℂ

variable {F : Type} [Field F] [NumberField F]

/-- Theorems of the supplier roadmaps on the global side, used by the API of
`TauCeti.Functoriality.IsFunctorialLift`; passed as an explicit hypothesis. -/
structure LLCCompat (C : FunctorialityContext F) : Prop where
  /-- Strong multiplicity one for isobaric representations (Jacquet–Shalika; owner AL.3):
  agreement of local parameters outside a finite set forces isomorphism. -/
  strongMultiplicityOne : ∀ {n : ℕ} (π π' : C.AutRep n) (S : Finset C.Place),
    (∀ v, v ∉ S → C.localParam π v = C.localParam π' v) → π = π'
  /-- Local Langlands is compatible with central characters (ET.6, local class field theory). -/
  localParam_centralChar : ∀ {n : ℕ} (π : C.AutRep n) (v : C.Place),
    C.localParam (C.centralChar π) v = C.applyParam (AlgRep.det n) v (C.localParam π v)
  /-- Local Langlands is compatible with twists (ET.6). -/
  localParam_twist : ∀ {n : ℕ} (π : C.AutRep n) (χ : C.AutRep 1) (v : C.Place),
    C.localParam (C.twist π χ) v = C.twistParam v (C.localParam π v) (C.localParam χ v)
  /-- The parameter of an isobaric sum is the direct sum of parameters (AL.3, ML.0). -/
  localParam_isobaricSum : ∀ {m n : ℕ} (π₁ : C.AutRep m) (π₂ : C.AutRep n) (v : C.Place),
    C.localParam (C.isobaricSum π₁ π₂) v = C.sumParam v (C.localParam π₁ v) (C.localParam π₂ v)
  /-- `L^S(s, π, R)` is the Euler product of the local factors of `R ∘ rec(π_v)`, `v ∉ S`, so it
  depends only on these parameters (AL.3). -/
  langlandsL_congr : ∀ {n n' N : ℕ} (π : C.AutRep n) (π' : C.AutRep n') (R : AlgRep n N)
    (R' : AlgRep n' N) (S : Finset C.Place),
    (∀ v, v ∉ S → C.applyParam R v (C.localParam π v) = C.applyParam R' v (C.localParam π' v)) →
    C.langlandsL π R S = C.langlandsL π' R' S
  /-- `L^S(s, π₁ × π₂)` is the Euler product of the local factors of `rec(π₁,v) ⊗ rec(π₂,v)` (AL.3). -/
  rankinSelbergL_congr : ∀ {m n : ℕ} (π₁ : C.AutRep m) (π₂ : C.AutRep n) (P : C.AutRep (m * n))
    (S : Finset C.Place),
    (∀ v, v ∉ S → C.localParam P v = C.tensorParam v (C.localParam π₁ v) (C.localParam π₂ v)) →
    C.rankinSelbergL π₁ π₂ S = C.langlandsL P (AlgRep.id (m * n)) S

/-- The unramified dictionary (AL.2, ET.6): almost all components are unramified, their
parameters are the unramified parameters of their Satake parameters, and `R`, `⊗`, duals act on
Satake parameters as on matrices. -/
structure UnramifiedCompat (C : FunctorialityContext F) : Prop where
  /-- Almost every place is finite and unramified for `π`. -/
  almostUnramified : ∀ {n : ℕ} (π : C.AutRep n),
    ∃ S : Finset C.Place, ∀ v, v ∉ S → ¬ C.IsArchimedean v ∧ C.IsUnramifiedAt π v
  /-- At finite unramified `v`, `rec(π_v)` is unramified with Frobenius `c_v(π)`. -/
  localParam_unramified : ∀ {n : ℕ} (π : C.AutRep n) (v : C.Place), ¬ C.IsArchimedean v →
    C.IsUnramifiedAt π v → C.localParam π v = C.unramParam v (C.satake π v)
  /-- Conversely an unramified parameter comes from an unramified component. -/
  unramified_of_localParam : ∀ {n : ℕ} (π : C.AutRep n) (v : C.Place) (t : GLC n),
    ¬ C.IsArchimedean v → C.localParam π v = C.unramParam v t → C.IsUnramifiedAt π v
  /-- Unramified parameters are classified by the conjugacy class of Frobenius. -/
  unramParam_eq_iff : ∀ {n : ℕ} (v : C.Place) (t t' : GLC n),
    C.unramParam v t = C.unramParam v t' ↔ IsConj t t'
  /-- `R ∘ (unramified φ with Frobenius t)` is unramified with Frobenius `R(t)`. -/
  applyParam_unramParam : ∀ {n N : ℕ} (R : AlgRep n N) (v : C.Place) (t : GLC n),
    C.applyParam R v (C.unramParam v t) = C.unramParam v (R.toHom t)
  /-- Tensor products of unramified parameters. -/
  tensorParam_unramParam : ∀ {m n : ℕ} (v : C.Place) (a : GLC m) (b : GLC n),
    C.tensorParam v (C.unramParam v a) (C.unramParam v b) = C.unramParam v (glKron a b)
  /-- The Satake parameter of `π^∨` is the inverse of that of `π`. -/
  satake_dual : ∀ {n : ℕ} (π : C.AutRep n) (v : C.Place), ¬ C.IsArchimedean v →
    C.IsUnramifiedAt π v → IsConj (C.satake (C.dual π) v) (C.satake π v)⁻¹

/-! ### ML.5/functorial-lift -/

/-- `TauCeti.Functoriality.IsFunctorialLift` (ML.5/functorial-lift): the isobaric automorphic
representation `P` of `GL_N(𝔸_F)` is a functorial lift of `π` along the algebraic representation
`R : GL_n → GL_N`: `rec(P_v) ≅ R ∘ rec(π_v)` at every place `v` (Harris–Taylor, Henniart at finite
`v`; Langlands at infinite `v`). The packet asks `π` cuspidal; the definition makes sense for all
isobaric `π`. -/
def IsFunctorialLift (C : FunctorialityContext F) {n N : ℕ} (R : AlgRep n N) (π : C.AutRep n)
    (P : C.AutRep N) : Prop :=
  ∀ v : C.Place, C.localParam P v = C.applyParam R v (C.localParam π v)

/-- `TauCeti.Functoriality.IsWeakLift` (ML.5/functorial-lift): `P` is a weak lift of `π` along `R`:
outside a finite set of places, `v` is finite, `π_v` and `P_v` are unramified and
`c_v(P) ~ R(c_v(π))` (Satake parameters). -/
def IsWeakLift (C : FunctorialityContext F) {n N : ℕ} (R : AlgRep n N) (π : C.AutRep n)
    (P : C.AutRep N) : Prop :=
  ∃ S : Finset C.Place, ∀ v, v ∉ S → ¬ C.IsArchimedean v ∧ C.IsUnramifiedAt π v ∧
    C.IsUnramifiedAt P v ∧ IsConj (C.satake P v) (R.toHom (C.satake π v))

/-- Functorial product `P = π₁ ⊠ π₂` (lift along `GL_m × GL_n → GL_{mn}`): `rec(P_v) ≅ rec(π₁,v) ⊗
rec(π₂,v)` at every place. -/
def IsTensorLift (C : FunctorialityContext F) {m n : ℕ} (π₁ : C.AutRep m) (π₂ : C.AutRep n)
    (P : C.AutRep (m * n)) : Prop :=
  ∀ v : C.Place, C.localParam P v = C.tensorParam v (C.localParam π₁ v) (C.localParam π₂ v)

/-- Weak functorial product: `c_v(P) ~ c_v(π₁) ⊗ c_v(π₂)` at almost all (finite, unramified) `v`. -/
def IsWeakTensorLift (C : FunctorialityContext F) {m n : ℕ} (π₁ : C.AutRep m) (π₂ : C.AutRep n)
    (P : C.AutRep (m * n)) : Prop :=
  ∃ S : Finset C.Place, ∀ v, v ∉ S → ¬ C.IsArchimedean v ∧ C.IsUnramifiedAt π₁ v ∧
    C.IsUnramifiedAt π₂ v ∧ C.IsUnramifiedAt P v ∧
    IsConj (C.satake P v) (glKron (C.satake π₁ v) (C.satake π₂ v))

section LiftAPI

variable {C : FunctorialityContext F}

/-- `TauCeti.Functoriality.IsFunctorialLift.unique`: two functorial lifts of `π` along `R` are
isomorphic (strong multiplicity one). -/
theorem IsFunctorialLift.unique (hC : LLCCompat C) {n N : ℕ} {R : AlgRep n N} {π : C.AutRep n}
    {P P' : C.AutRep N} (h : IsFunctorialLift C R π P) (h' : IsFunctorialLift C R π P') :
    P = P' :=
  hC.strongMultiplicityOne P P' ∅ (fun v _ => (h v).trans (h' v).symm)

/-- `TauCeti.Functoriality.IsFunctorialLift.toWeak`: a functorial lift is a weak lift. -/
theorem IsFunctorialLift.toWeak (hU : UnramifiedCompat C) {n N : ℕ} {R : AlgRep n N}
    {π : C.AutRep n} {P : C.AutRep N} (h : IsFunctorialLift C R π P) : IsWeakLift C R π P := by
  sorry

/-- `TauCeti.Functoriality.IsFunctorialLift.comp`: a lift `P` of `π` along `R` followed by a lift
`P'` of `P` along `R'` is a lift of `π` along `R' ∘ R`. -/
theorem IsFunctorialLift.comp {n N M : ℕ} {R : AlgRep n N} {R' : AlgRep N M} {π : C.AutRep n}
    {P : C.AutRep N} {P' : C.AutRep M} (h : IsFunctorialLift C R π P)
    (h' : IsFunctorialLift C R' P P') : IsFunctorialLift C (R'.comp R) π P' := by
  intro v
  rw [h' v, h v, C.applyParam_comp]

/-- `TauCeti.Functoriality.IsFunctorialLift.id`: `π` is its own lift along the identity. -/
theorem IsFunctorialLift.id {n : ℕ} (π : C.AutRep n) : IsFunctorialLift C (AlgRep.id n) π π :=
  fun v => (C.applyParam_id v _).symm

/-- `TauCeti.Functoriality.IsFunctorialLift.lFunction`: `L^S(s, R(π)) = L^S(s, π, R)`. -/
theorem IsFunctorialLift.lFunction (hC : LLCCompat C) {n N : ℕ} {R : AlgRep n N}
    {π : C.AutRep n} {P : C.AutRep N} (h : IsFunctorialLift C R π P) (S : Finset C.Place) :
    C.langlandsL P (AlgRep.id N) S = C.langlandsL π R S :=
  hC.langlandsL_congr P π (AlgRep.id N) R S (fun v _ => by rw [C.applyParam_id, h v])

/-- `χ^k` for a Hecke character `χ`, by iterated twisting of the trivial character. -/
def heckePow (C : FunctorialityContext F) (χ : C.AutRep 1) : ℕ → C.AutRep 1
  | 0 => C.one
  | k + 1 => C.twist (heckePow C χ k) χ

/-- `TauCeti.Functoriality.lift_det`: along `det : GL₂ → GL₁` the lift of `π` is its central
character `ω_π` (local class field theory). -/
theorem lift_det (hC : LLCCompat C) (π : C.AutRep 2) :
    IsFunctorialLift C (AlgRep.det 2) π (C.centralChar π) :=
  fun v => hC.localParam_centralChar π v

-- NOTE: `lift_gl1` needs, beyond `LLCCompat`, the parameter identity `det^k ∘ φ = φ ⊗ ⋯ ⊗ φ` for
-- one-dimensional `φ`, which the abstract `LParam` does not know; it holds for the genuine instance.
/-- `TauCeti.Functoriality.lift_gl1`: for `n = 1` and `R = (χ ↦ χ^k)`, the lift of a Hecke character
`χ` is `χ^k`. -/
theorem lift_gl1 (hC : LLCCompat C) (χ : C.AutRep 1) (k : ℕ) :
    IsFunctorialLift C (AlgRep.detPow 1 k) χ (heckePow C χ k) := by
  sorry

/-- `TauCeti.Functoriality.lift_std`: along `std` the lift of `π` is `π` itself, and being a lift
along `std` is equality of `rec` at every place. -/
theorem lift_std (hC : LLCCompat C) {n : ℕ} (π P : C.AutRep n) :
    (IsFunctorialLift C (AlgRep.id n) π P ↔ ∀ v, C.localParam P v = C.localParam π v) ∧
      (IsFunctorialLift C (AlgRep.id n) π P ↔ P = π) := by
  refine ⟨⟨fun h v => by rw [h v, C.applyParam_id], fun h v => by rw [h v, C.applyParam_id]⟩, ?_⟩
  constructor
  · intro h
    exact hC.strongMultiplicityOne P π ∅ (fun v _ => by rw [h v, C.applyParam_id])
  · rintro rfl
    exact IsFunctorialLift.id P

end LiftAPI

/-- Data of a quadratic extension `K/F` for dihedral representations: Hecke characters of `K`,
automorphic induction `AI_{K/F}` to `GL₂`, restriction to `𝔸_F^×` and `η_{K/F}` (owners:
EndoscopicTransferAndUnitaryTraceComparison ET.7a, GL2AutomorphicRepresentationsAndTransfer R17.5). -/
structure QuadraticInduction (C : FunctorialityContext F) where
  /-- Hecke characters of `𝔸_K^×/K^×`. -/
  HeckeK : Type
  /-- Product of Hecke characters of `K`. -/
  mul : HeckeK → HeckeK → HeckeK
  /-- Galois conjugate `θ ↦ θ^σ`. -/
  conj : HeckeK → HeckeK
  /-- Automorphic induction `AI_{K/F}(θ)` (the GL₂ representation with parameter `Ind θ`). -/
  autInd : HeckeK → C.AutRep 2
  /-- Restriction `θ|_{𝔸_F^×}` (the character with parameter the transfer of `θ`). -/
  restrict : HeckeK → C.AutRep 1
  /-- The quadratic character `η_{K/F}`. -/
  eta : C.AutRep 1

-- NOTE: the packet's test reads `Sym²(AI θ) = AI(θ²) ⊞ θ|_{𝔸_F^×} η_{K/F}`; this is wrong. On
-- W_F, `Ind θ ⊗ Ind θ = Ind(θ²) ⊕ θ|_F ⊕ θ|_F η` and `∧² Ind θ = det Ind θ = θ|_F η`, so
-- `Sym²(Ind θ) = Ind(θ²) ⊕ θ|_F` (check θ = 1: `Sym²(1 ⊕ η) = 1 ⊕ η ⊕ 1`). The `η` belongs to the
-- adjoint: `Ad(AI θ) = AI(θ/θ^σ) ⊞ η_{K/F}`. The corrected statement is below.
/-- `TauCeti.Functoriality.lift_sym2_dihedral_not_cuspidal`: for `π = AI_{K/F}(θ)` dihedral
(`θ ≠ θ^σ`), `Sym²π` exists but is not cuspidal: it is `AI(θ²) ⊞ θ|_{𝔸_F^×}` (corrected; see NOTE). -/
theorem lift_sym2_dihedral_not_cuspidal {C : FunctorialityContext F} (hC : LLCCompat C)
    (Q : QuadraticInduction C) (θ : Q.HeckeK) (hθ : Q.conj θ ≠ θ) :
    IsFunctorialLift C (AlgRep.symPow 2) (Q.autInd θ)
        (C.isobaricSum (Q.autInd (Q.mul θ θ)) (Q.restrict θ)) ∧
      ¬ C.IsCuspidal (C.isobaricSum (Q.autInd (Q.mul θ θ)) (Q.restrict θ)) := by
  sorry

/-! ### Dihedral, tetrahedral and octahedral representations of `GL₂` -/

/-- `π` on `GL₂` is dihedral: `π ≅ π ⊗ η` for a non-trivial quadratic Hecke character `η`
(Labesse–Langlands: equivalently `π = AI_{K/F}(θ)` for the quadratic `K/F` cut out by `η`). -/
def IsDihedral (C : FunctorialityContext F) (π : C.AutRep 2) : Prop :=
  ∃ η : C.AutRep 1, η ≠ C.one ∧ C.twist η η = C.one ∧ C.twist π η = π

/-- `Ad(π) = Sym²π ⊗ ω_π^{-1}`, computed from a symmetric-square lift `S` of `π`. -/
def adjointOf (C : FunctorialityContext F) (π : C.AutRep 2) (S : C.AutRep (2 + 1)) :
    C.AutRep (2 + 1) :=
  C.twist S (C.dual (C.centralChar π))

/-- `π` is tetrahedral: not dihedral, and `Ad(π) ≅ Ad(π) ⊗ χ` for a non-trivial cubic `χ`. -/
def IsTetrahedral (C : FunctorialityContext F) (π : C.AutRep 2) : Prop :=
  ¬ IsDihedral C π ∧ ∃ S : C.AutRep (2 + 1), IsFunctorialLift C (AlgRep.symPow 2) π S ∧
    ∃ χ : C.AutRep 1, χ ≠ C.one ∧ heckePow C χ 3 = C.one ∧ C.twist (adjointOf C π S) χ = adjointOf C π S

/-- `π` is octahedral (Kim–Shahidi): neither dihedral nor tetrahedral, and `Sym³π ≅ Sym³π ⊗ η`
for a non-trivial quadratic `η`. -/
def IsOctahedral (C : FunctorialityContext F) (π : C.AutRep 2) : Prop :=
  ¬ IsDihedral C π ∧ ¬ IsTetrahedral C π ∧ ∃ T : C.AutRep (3 + 1), IsWeakLift C (AlgRep.symPow 3) π T ∧
    ∃ η : C.AutRep 1, η ≠ C.one ∧ C.twist η η = C.one ∧ C.twist T η = T

/-- `P` is essentially self-dual: `P^∨ ≅ P ⊗ χ` for a Hecke character `χ`. -/
def IsEssentiallySelfDual (C : FunctorialityContext F) {n : ℕ} (P : C.AutRep n) : Prop :=
  ∃ χ : C.AutRep 1, C.dual P = C.twist P χ

/-! ### Known transfers between general linear groups -/

-- NOTE: ML.5 existence theorems below are statements about the owners' genuine instance; for
-- arbitrary context data (even with `LLCCompat`) they are false. See the module NOTE.
/-- `TauCeti.Functoriality.gelbartJacquet` (ML.5/gelbart-jacquet): for `π` cuspidal on `GL₂(𝔸_F)`,
`Sym²π` exists on `GL₃(𝔸_F)` as a functorial lift (local compatibility at every place), and
`Ad(π) = Sym²π ⊗ ω_π^{-1}` is cuspidal iff `π` is not dihedral. -/
theorem gelbartJacquet (C : FunctorialityContext F) (hC : LLCCompat C) (π : C.AutRep 2)
    (hπ : C.IsCuspidal π) :
    (∃ S : C.AutRep (2 + 1), IsFunctorialLift C (AlgRep.symPow 2) π S) ∧
      ∀ S : C.AutRep (2 + 1), IsFunctorialLift C (AlgRep.symPow 2) π S →
        (C.IsCuspidal (adjointOf C π S) ↔ ¬ IsDihedral C π) := by
  sorry

-- NOTE: Kim–Shahidi's local compatibility at places over 2 and 3 (supercuspidal components) is
-- not asserted: the products are stated as weak lifts (Satake parameters at almost all places).
/-- `TauCeti.Functoriality.kimShahidi` (ML.5/kim-shahidi-sym3): for `π` cuspidal on `GL₂` and `σ`
cuspidal on `GL₃`, the functorial product `π ⊠ σ` exists on `GL₆`, `Sym³π` exists on `GL₄`, and
`Sym³π` is cuspidal unless `π` is dihedral or tetrahedral. -/
theorem kimShahidi (C : FunctorialityContext F) (hC : LLCCompat C) (π : C.AutRep 2)
    (σ : C.AutRep 3) (hπ : C.IsCuspidal π) (hσ : C.IsCuspidal σ) :
    (∃ P : C.AutRep (2 * 3), IsWeakTensorLift C π σ P) ∧
      (∃ T : C.AutRep (3 + 1), IsWeakLift C (AlgRep.symPow 3) π T) ∧
      ∀ T : C.AutRep (3 + 1), IsWeakLift C (AlgRep.symPow 3) π T →
        ¬ IsDihedral C π → ¬ IsTetrahedral C π → C.IsCuspidal T := by
  sorry

/-- `TauCeti.Functoriality.kim_exteriorSquare` (ML.5/kim-sym4): (a) for `Π` cuspidal on `GL₄`,
`∧²Π` exists on `GL₆` as a functorial lift at every place (Kim 2003; Henniart 2009 at the places
over 2 and 3); (b) for `π` cuspidal on `GL₂`, `Sym⁴π` exists on `GL₅`, cuspidal unless `π` is
dihedral, tetrahedral or octahedral. -/
theorem kim_exteriorSquare (C : FunctorialityContext F) (hC : LLCCompat C) :
    (∀ P : C.AutRep 4, C.IsCuspidal P →
      ∃ E : C.AutRep (Nat.choose 4 2), IsFunctorialLift C (AlgRep.ext2 4) P E) ∧
    (∀ π : C.AutRep 2, C.IsCuspidal π →
      (∃ Q : C.AutRep (4 + 1), IsWeakLift C (AlgRep.symPow 4) π Q) ∧
        ∀ Q : C.AutRep (4 + 1), IsWeakLift C (AlgRep.symPow 4) π Q →
          ¬ IsDihedral C π → ¬ IsTetrahedral C π → ¬ IsOctahedral C π → C.IsCuspidal Q) := by
  sorry

/-- `TauCeti.Functoriality.ramakrishnan` (ML.5/ramakrishnan-tensor-product): for `π₁, π₂` cuspidal on
`GL₂`, `π₁ ⊠ π₂` exists on `GL₄` with `L(s, π₁ ⊠ π₂) = L(s, π₁ × π₂)` (every partial L-function),
and it is cuspidal unless `π₁, π₂` are dihedral with a common inducing field (a common `η`) or
`π₂ ≅ π₁ ⊗ χ`. -/
theorem ramakrishnan (C : FunctorialityContext F) (hC : LLCCompat C) (π₁ π₂ : C.AutRep 2)
    (h₁ : C.IsCuspidal π₁) (h₂ : C.IsCuspidal π₂) :
    ∃ P : C.AutRep (2 * 2), IsWeakTensorLift C π₁ π₂ P ∧
      (∀ S : Finset C.Place, C.langlandsL P (AlgRep.id (2 * 2)) S = C.rankinSelbergL π₁ π₂ S) ∧
      (¬ C.IsCuspidal P →
        (∃ η : C.AutRep 1, η ≠ C.one ∧ C.twist η η = C.one ∧ C.twist π₁ η = π₁ ∧ C.twist π₂ η = π₂) ∨
          ∃ χ : C.AutRep 1, π₂ = C.twist π₁ χ) := by
  sorry

-- NOTE: "without CM" is rendered `¬ IsDihedral`: for regular algebraic π over totally real F,
-- dihedral means induced from a CM quadratic extension.
/-- `TauCeti.Functoriality.sp_le_five` (ML.5/low-rank-symmetric-powers): for `F` totally real and
`π` regular algebraic cuspidal non-CM on `GL₂`, `Sym^{n-1}π` exists for `1 ≤ n ≤ 5` as a regular
algebraic, essentially self-dual, cuspidal representation of `GL_n` (Newton–Thorne's `SP_n`). -/
theorem sp_le_five (C : FunctorialityContext F) (hC : LLCCompat C) [NumberField.IsTotallyReal F]
    (π : C.AutRep 2) (hπ : C.IsCuspidal π) (hra : C.IsRegularAlgebraic π)
    (hCM : ¬ IsDihedral C π) (n : ℕ) (hn₁ : 1 ≤ n) (hn₅ : n ≤ 5) :
    ∃ P : C.AutRep (n - 1 + 1), IsFunctorialLift C (AlgRep.symPow (n - 1)) π P ∧
      C.IsCuspidal P ∧ C.IsRegularAlgebraic P ∧ IsEssentiallySelfDual C P := by
  sorry

/-! ### Base change -/

/-- ℓ-adic Galois representations of `G_F` and those attached to regular algebraic cuspidal
automorphic representations (owner: AutomorphicGaloisRepresentationsPartII). -/
structure GaloisData (C : FunctorialityContext F) where
  /-- Continuous representations `G_F → GL_n(Q̄_p)` up to isomorphism. -/
  GalRep : ℕ → Type
  /-- Irreducibility. -/
  IsIrreducible : ∀ {n : ℕ}, GalRep n → Prop
  /-- `r_ι(π)`, for regular algebraic `π`. -/
  galOf : ∀ {n : ℕ}, C.AutRep n → GalRep n

/-- `r` is automorphic: `r ≅ r_ι(π)` for a regular algebraic cuspidal `π`. -/
def GaloisData.IsAutomorphic {C : FunctorialityContext F} (G : GaloisData C) {n : ℕ}
    (r : G.GalRep n) : Prop :=
  ∃ π : C.AutRep n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧ G.galOf π = r

/-- Data relating the contexts over `F` and over an extension `L` (owners: ET.6, ET.7a, R17.4). -/
structure BaseChangeData {L : Type} [Field L] [NumberField L] (C : FunctorialityContext F)
    (CL : FunctorialityContext L) [Algebra F L] where
  /-- The place of `F` below a place of `L`. -/
  below : CL.Place → C.Place
  /-- Restriction `φ ↦ φ|_{W_{L_w}}` of L-parameters. -/
  restrictParam : ∀ {n : ℕ} (w : CL.Place), C.LParam (below w) n → CL.LParam w n
  /-- The Galois action `Π ↦ Π^σ` on automorphic representations of `GL_n(𝔸_L)`. -/
  galoisAct : ∀ {n : ℕ}, (L ≃ₐ[F] L) → CL.AutRep n → CL.AutRep n
  /-- Galois representations over `F`. -/
  galF : GaloisData C
  /-- Galois representations over `L`. -/
  galL : GaloisData CL
  /-- Restriction `r ↦ r|_{G_L}`. -/
  restrictGal : ∀ {n : ℕ}, galF.GalRep n → galL.GalRep n

/-- `A` is the base change of `π`: `rec(A_w) ≅ rec(π_v)|_{W_{L_w}}` for every place `w | v`. -/
def IsBaseChange {L : Type} [Field L] [NumberField L] {C : FunctorialityContext F}
    {CL : FunctorialityContext L} [Algebra F L] (B : BaseChangeData C CL) {n : ℕ}
    (π : C.AutRep n) (A : CL.AutRep n) : Prop :=
  ∀ w : CL.Place, CL.localParam A w = B.restrictParam w (C.localParam π (B.below w))

-- NOTE: the packet's cuspidality criterion "cuspidal unless π ≅ π ⊗ η for a character η of
-- 𝔸_F^×/F^×N𝔸_L^×" must ask η non-trivial (π ≅ π ⊗ 1 always); stated with `η ≠ C.one`.
/-- `TauCeti.Functoriality.solubleBaseChange` (ML.5/cyclic-base-change-gln, Arthur–Clozel): for
`L/F` cyclic of prime degree and `π` cuspidal on `GL_n(𝔸_F)`: `BC_{L/F}(π)` exists; it is cuspidal
unless `π ≅ π ⊗ η` for a non-trivial `η` trivial on norms (`BC(η) = 1`); a cuspidal `Π` with
`Π ≅ Π^σ` is a base change. For `L/F` soluble Galois: base change of regular algebraic `π` with
cuspidal `BC(π)` is regular algebraic, and soluble descent holds for Galois representations. -/
theorem solubleBaseChange {L : Type} [Field L] [NumberField L] [Algebra F L] [IsGalois F L]
    (C : FunctorialityContext F) (CL : FunctorialityContext L) (hC : LLCCompat C)
    (hCL : LLCCompat CL) (B : BaseChangeData C CL) (hsol : Group.IsSolvable (L ≃ₐ[F] L)) (n : ℕ) :
    ((IsCyclic (L ≃ₐ[F] L) ∧ (Module.finrank F L).Prime) →
      (∀ π : C.AutRep n, C.IsCuspidal π → ∃ A : CL.AutRep n, IsBaseChange B π A) ∧
      (∀ (π : C.AutRep n) (A : CL.AutRep n), C.IsCuspidal π → IsBaseChange B π A →
        ¬ CL.IsCuspidal A →
          ∃ η : C.AutRep 1, η ≠ C.one ∧ IsBaseChange B η CL.one ∧ C.twist π η = π) ∧
      (∀ σ : L ≃ₐ[F] L, (∀ τ : L ≃ₐ[F] L, τ ∈ Subgroup.zpowers σ) →
        ∀ A : CL.AutRep n, CL.IsCuspidal A → B.galoisAct σ A = A →
          ∃ π : C.AutRep n, C.IsCuspidal π ∧ IsBaseChange B π A)) ∧
    (∀ π : C.AutRep n, C.IsCuspidal π → C.IsRegularAlgebraic π →
      ∃ A : CL.AutRep n, IsBaseChange B π A ∧ (CL.IsCuspidal A → CL.IsRegularAlgebraic A)) ∧
    (∀ r : B.galF.GalRep n, B.galF.IsIrreducible r → B.galL.IsIrreducible (B.restrictGal r) →
      B.galL.IsAutomorphic (B.restrictGal r) → B.galF.IsAutomorphic r) := by
  sorry

/-! ### Classical groups: generic transfer and descent -/

/-- The split classical groups `G_n` of ML.5/ckpss-generic-transfer. -/
inductive ClassicalType
  /-- `SO_{2n+1}`, dual group `Sp_{2n}(ℂ)`. -/
  | oddOrthogonal
  /-- `SO_{2n}`, dual group `SO_{2n}(ℂ)`. -/
  | evenOrthogonal
  /-- `Sp_{2n}`, dual group `SO_{2n+1}(ℂ)`. -/
  | symplectic

/-- The dimension `N` of the standard representation of the dual group: `2n, 2n, 2n + 1`. -/
def ClassicalType.dualDim : ClassicalType → ℕ → ℕ
  | .oddOrthogonal, n => 2 * n
  | .evenOrthogonal, n => 2 * n
  | .symplectic, n => 2 * n + 1

/-- Automorphic data of the split classical groups `G_n` over `F` (owners: AutomorphicFormsOn-
ReductiveGroups, AutomorphicSpectralTheory AS.6, ML.4/global-arthur-parameter). -/
structure ClassicalData (C : FunctorialityContext F) where
  /-- Irreducible cuspidal automorphic representations of `G_n(𝔸_F)`. -/
  ClassRep : ClassicalType → ℕ → Type
  /-- Global genericity with respect to the fixed splitting. -/
  IsGloballyGeneric : ∀ {t : ClassicalType} {n : ℕ}, ClassRep t n → Prop
  /-- `π_v` unramified. -/
  IsUnramifiedAtG : ∀ {t : ClassicalType} {n : ℕ}, ClassRep t n → C.Place → Prop
  /-- The L-parameter of `π_v` composed with the standard embedding `ᴸG_n → GL_N(ℂ)` (at
  archimedean places and unramified finite places). -/
  stdParam : ∀ {t : ClassicalType} {n : ℕ}, ClassRep t n → (v : C.Place) → C.LParam v (t.dualDim n)
  /-- `π` lies in the global packet `Π̃_φ` of the parameter `φ = P` (ML.4/global-arthur-parameter). -/
  InGlobalPacket : ∀ {t : ClassicalType} {n : ℕ}, ClassRep t n → C.AutRep (t.dualDim n) → Prop

/-- `P` on `GL_N` is a CKPSS functorial lift of `π`: local lift at every archimedean place and at
almost all unramified finite places. -/
def IsGenericLift {C : FunctorialityContext F} (D : ClassicalData C) {t : ClassicalType} {n : ℕ}
    (π : D.ClassRep t n) (P : C.AutRep (t.dualDim n)) : Prop :=
  (∀ v, C.IsArchimedean v → C.localParam P v = D.stdParam π v) ∧
    ∃ S : Finset C.Place, ∀ v, v ∉ S → ¬ C.IsArchimedean v → D.IsUnramifiedAtG π v →
      C.localParam P v = D.stdParam π v

/-- `P` is the isobaric sum of the list `l` of representations (in this order). -/
inductive IsIsobaricDecomp (C : FunctorialityContext F) :
    {N : ℕ} → C.AutRep N → List (Σ m : ℕ, C.AutRep m) → Prop
  | single {n : ℕ} (π : C.AutRep n) : IsIsobaricDecomp C π [⟨n, π⟩]
  | cons {m n : ℕ} (τ : C.AutRep m) (ρ : C.AutRep n) (l : List (Σ k : ℕ, C.AutRep k)) :
      IsIsobaricDecomp C ρ l → IsIsobaricDecomp C (C.isobaricSum τ ρ) (⟨m, τ⟩ :: l)

/-- The partial L-function `L^T(s, τ, ∧²)` (for `SO_{2n+1}`) or `L^T(s, τ, Sym²)` (otherwise) has a
pole at `s = 1`: `τ` is of symplectic, resp. orthogonal, type. -/
def HasSquarePole (C : FunctorialityContext F) (t : ClassicalType) {m : ℕ} (τ : C.AutRep m)
    (T : Finset C.Place) : Prop :=
  match t with
  | .oddOrthogonal => HasPoleAt (C.langlandsL τ (AlgRep.ext2 m) T) 1
  | .evenOrthogonal => HasPoleAt (C.langlandsL τ (AlgRep.sym2 m) T) 1
  | .symplectic => HasPoleAt (C.langlandsL τ (AlgRep.sym2 m) T) 1

/-- The CKPSS/GRS image: `P = Π₁ ⊞ ⋯ ⊞ Π_d` with `Π_i` pairwise non-isomorphic unitary self-dual
cuspidal, `L^T(s, Π_i, ∧²)` (for `SO_{2n+1}`) resp. `L^T(s, Π_i, Sym²)` with a pole at `s = 1`, and
trivial central character for `Sp_{2n}` and `SO_{2n}`. -/
def IsCKPSSImage (C : FunctorialityContext F) (t : ClassicalType) {N : ℕ} (P : C.AutRep N) :
    Prop :=
  ∃ l : List (Σ m : ℕ, C.AutRep m), IsIsobaricDecomp C P l ∧ l.Pairwise (· ≠ ·) ∧
    (∀ τ ∈ l, C.IsCuspidal τ.2 ∧ C.IsUnitary τ.2 ∧ C.IsSelfDual τ.2 ∧
      ∃ T : Finset C.Place, HasSquarePole C t τ.2 T) ∧
    (t ≠ .oddOrthogonal → C.centralChar P = C.one)

-- NOTE: for `SO_{2n}` the packet does not bound `n`; for `n = 1` (`SO₂ = GL₁`) the lift
-- `χ ⊞ χ⁻¹` is not of the stated form, so `n ≥ 2` is assumed there.
/-- `TauCeti.Functoriality.ckpss` (ML.5/ckpss-generic-transfer, CKPSS Theorems 7.1, 7.2; image by
Ginzburg–Rallis–Soudry): every globally generic cuspidal `π` of split `G_n(𝔸)` has a functorial
lift `P` to `GL_N(𝔸)` lying in the image `IsCKPSSImage`, and every such `P` is the lift of some `π`. -/
theorem ckpss (C : FunctorialityContext F) (hC : LLCCompat C) (D : ClassicalData C)
    (t : ClassicalType) (n : ℕ) (hn : 1 ≤ n) (hn' : t = .evenOrthogonal → 2 ≤ n) :
    (∀ π : D.ClassRep t n, D.IsGloballyGeneric π →
      ∃ P : C.AutRep (t.dualDim n), IsGenericLift D π P ∧ IsCKPSSImage C t P) ∧
    (∀ P : C.AutRep (t.dualDim n), IsCKPSSImage C t P →
      ∃ π : D.ClassRep t n, D.IsGloballyGeneric π ∧ IsGenericLift D π P) := by
  sorry

/-- `TauCeti.Functoriality.grsDescent` (ML.5/grs-descent): for a generic parameter
`φ = τ₁ ⊞ ⋯ ⊞ τ_r` of split `SO_{2n+1}` (pairwise distinct unitary self-dual cuspidal `τ_i` of
symplectic type, `Σ n_i = 2n`), the automorphic descent is a non-zero irreducible (Jiang–Soudry)
cuspidal globally generic `π₀` on `SO_{2n+1}(𝔸_F)` whose lift is `φ`, and it lies in `Π̃_φ`. The
descents for the other quasi-split classical groups (structure depending on uniqueness of local
Bessel models over Vogan packets) are not formalised here. -/
theorem grsDescent (C : FunctorialityContext F) (hC : LLCCompat C) (D : ClassicalData C) (n : ℕ)
    (hn : 1 ≤ n) (P : C.AutRep (ClassicalType.oddOrthogonal.dualDim n))
    (hP : IsCKPSSImage C .oddOrthogonal P) :
    ∃ π₀ : D.ClassRep .oddOrthogonal n, D.IsGloballyGeneric π₀ ∧ IsGenericLift D π₀ P ∧
      D.InGlobalPacket π₀ P := by
  sorry

/-- Local representations of `GL_n(F_v)` and of the metaplectic group `Mp_{2n}(F_v)` (owners: ET.6,
AutomorphicLFunctionsAndLocalFactors AL.4, MetaplecticAutomorphicForms MP.3). -/
structure MetaplecticData (C : FunctorialityContext F) where
  /-- Irreducible smooth representations of `GL_n(F_v)`. -/
  LocalRep : C.Place → ℕ → Type
  /-- The local component `π_v`. -/
  localComp : ∀ {n : ℕ}, C.AutRep n → (v : C.Place) → LocalRep v n
  /-- Square-integrability (essentially, modulo the centre). -/
  IsSquareIntegrable : ∀ {v : C.Place} {n : ℕ}, LocalRep v n → Prop
  /-- Supercuspidality. -/
  IsSupercuspidal : ∀ {v : C.Place} {n : ℕ}, LocalRep v n → Prop
  /-- Being an (irreducible) principal series. -/
  IsPrincipalSeries : ∀ {v : C.Place} {n : ℕ}, LocalRep v n → Prop
  /-- Shahidi's local `L(s, τ_v, ∧²)`. -/
  localExt2L : ∀ {v : C.Place} {n : ℕ}, LocalRep v n → ℂ → ℂ
  /-- Smooth representations of `Mp_{2n}(F_v)`. -/
  MpRep : C.Place → ℕ → Type
  /-- Irreducibility. -/
  IsIrreducibleMp : ∀ {v : C.Place} {n : ℕ}, MpRep v n → Prop
  /-- Genuine (the central `μ₂` acts non-trivially). -/
  IsGenuine : ∀ {v : C.Place} {n : ℕ}, MpRep v n → Prop
  /-- `ψ_v`-generic for the fixed additive character `ψ_v`. -/
  IsGenericMp : ∀ {v : C.Place} {n : ℕ}, MpRep v n → Prop
  /-- Square-integrable. -/
  IsSquareIntegrableMp : ∀ {v : C.Place} {n : ℕ}, MpRep v n → Prop
  /-- The local descent of Ginzburg–Rallis–Soudry relative to `ψ_v`. -/
  localDescent : ∀ {v : C.Place} {n : ℕ}, LocalRep v (2 * n) → MpRep v n

-- NOTE: the local descent (Ichino–Lapid–Mao Theorem 3.1) is stated for non-archimedean `F_v`;
-- the packet's "F_v local" is read as non-archimedean.
/-- `TauCeti.Functoriality.localDescent_mp` (ML.5/local-descent-mp2n): (local descent) for
`τ_v` square-integrable on `GL_{2n}(F_v)` with `L(s, τ_v, ∧²)` having a pole at `s = 0`, the
descent to `Mp_{2n}(F_v)` is irreducible, genuine, `ψ_v`-generic and square-integrable; (Gan–Ichino
Proposition A.1) such local data at a non-empty finite `S` of finite places and at `v₀ ∉ S`, with
`τ_{v₀}` supercuspidal, globalise to a cuspidal `T` on `GL_{2n}(𝔸_F)`, principal series at the other
finite places, with `L(s, T, ∧²)` having a pole at `s = 1` and `L(1/2, T) ≠ 0`. -/
theorem localDescent_mp (C : FunctorialityContext F) (M : MetaplecticData C) (n : ℕ) (hn : 1 ≤ n) :
    (∀ (v : C.Place) (τ : M.LocalRep v (2 * n)), ¬ C.IsArchimedean v → M.IsSquareIntegrable τ →
      HasPoleAt (M.localExt2L τ) 0 →
        M.IsIrreducibleMp (M.localDescent τ) ∧ M.IsGenuine (M.localDescent τ) ∧
          M.IsGenericMp (M.localDescent τ) ∧ M.IsSquareIntegrableMp (M.localDescent τ)) ∧
    (∀ (S : Finset C.Place) (v₀ : C.Place) (τ : (v : C.Place) → M.LocalRep v (2 * n)),
      S.Nonempty → (∀ v ∈ S, ¬ C.IsArchimedean v) → ¬ C.IsArchimedean v₀ → v₀ ∉ S →
      (∀ v, (v = v₀ ∨ v ∈ S) → M.IsSquareIntegrable (τ v) ∧ HasPoleAt (M.localExt2L (τ v)) 0) →
      M.IsSupercuspidal (τ v₀) →
      ∃ T : C.AutRep (2 * n), C.IsCuspidal T ∧ (∀ v, (v = v₀ ∨ v ∈ S) → M.localComp T v = τ v) ∧
        (∀ v, v ≠ v₀ → v ∉ S → ¬ C.IsArchimedean v → M.IsPrincipalSeries (M.localComp T v)) ∧
        HasPoleAt (C.langlandsL T (AlgRep.ext2 (2 * n)) ∅) 1 ∧
        C.langlandsL T (AlgRep.id (2 * n)) ∅ (1 / 2) ≠ 0) := by
  sorry

/-! ### Register of known transfers -/

/-- A registered transfer: name, owner, exact hypotheses and statement. -/
structure TransferRecord where
  /-- Short name. -/
  name : String
  /-- Owning roadmap and stage. -/
  owner : String
  /-- Exact hypotheses. -/
  hypotheses : String
  /-- Statement. -/
  statement : String

/-- `TauCeti.Functoriality.knownTransfers` (ML.5/automorphic-induction-register): the transfers the
endpoints use but this roadmap does not plan, with owners and hypotheses. No general functorial
transfer is inferred from these cases. -/
def knownTransfers : List TransferRecord :=
  [ { name := "automorphic induction AI_{L/F}"
      owner := "EndoscopicTransferAndUnitaryTraceComparison ET.7a"
      hypotheses := "L/F cyclic of degree d; π cuspidal on GL_m(𝔸_L)"
      statement := "AI(π) on GL_{md}(𝔸_F) exists; it is cuspidal iff π is not isomorphic to a Galois conjugate π^σ, σ ≠ 1" },
    { name := "monomial GL₂ and Langlands–Tunnell"
      owner := "GL2AutomorphicRepresentationsAndTransfer R17.5 (RS-21)"
      hypotheses := "r : G_F → GL₂(ℂ) with soluble image (monomial case: induced from a character of a quadratic extension)"
      statement := "r is automorphic" },
    { name := "GL₂ cyclic and soluble base change"
      owner := "GL2AutomorphicRepresentationsAndTransfer R17.4 (RS-21)"
      hypotheses := "L/F soluble Galois (cyclic of prime degree at each step); π cuspidal on GL₂(𝔸_F)"
      statement := "BC_{L/F}(π) exists, with the Langlands cuspidality criterion and descent of Galois-invariant cuspidal representations" },
    { name := "GL_n cyclic base change"
      owner := "ModularityAndLanglandsExtensions ML.5/cyclic-base-change-gln (resting on ET.7a)"
      hypotheses := "L/F cyclic of prime degree; π cuspidal on GL_n(𝔸_F)"
      statement := "TauCeti.Functoriality.solubleBaseChange" } ]

example : knownTransfers.length = 4 := rfl

/-! ### Symmetric power functoriality implies Ramanujan -/

/-- Isobaric sums of unitary cuspidal representations. -/
inductive IsUnitaryIsobaric (C : FunctorialityContext F) : {n : ℕ} → C.AutRep n → Prop
  | cusp {n : ℕ} (π : C.AutRep n) : C.IsCuspidal π → C.IsUnitary π → IsUnitaryIsobaric C π
  | sum {m n : ℕ} (π₁ : C.AutRep m) (π₂ : C.AutRep n) :
      IsUnitaryIsobaric C π₁ → IsUnitaryIsobaric C π₂ → IsUnitaryIsobaric C (C.isobaricSum π₁ π₂)

/-- The Jacquet–Shalika bound (owner: AutomorphicLFunctionsAndLocalFactors AL.2): the Satake
eigenvalues `α` of an isobaric sum of unitary cuspidal representations at finite unramified `v`
satisfy `|α| < q_v^{1/2}`. -/
def JacquetShalikaBound (C : FunctorialityContext F) : Prop :=
  ∀ {N : ℕ} (P : C.AutRep N), IsUnitaryIsobaric C P → ∀ v, ¬ C.IsArchimedean v →
    C.IsUnramifiedAt P v →
      ∀ α ∈ (Matrix.charpoly ((C.satake P v : GLC N) : Matrix (Fin N) (Fin N) ℂ)).roots,
        ‖α‖ < (C.normPlace v : ℝ) ^ (1 / 2 : ℝ)

/-- `π_v` is tempered at a finite unramified place: its Satake eigenvalues have absolute value 1. -/
def IsTemperedAt (C : FunctorialityContext F) {n : ℕ} (π : C.AutRep n) (v : C.Place) : Prop :=
  ∀ α ∈ (Matrix.charpoly ((C.satake π v : GLC n) : Matrix (Fin n) (Fin n) ℂ)).roots, ‖α‖ = 1

-- NOTE: the packet's hypothesis "Symⁿπ and Symⁿπ^∨ automorphic" is used in the form "weak lifts
-- that are isobaric sums of unitary cuspidal representations", which is what the Jacquet–Shalika
-- bound applies to; the potential-automorphy variant (over finite extensions) is not formalised.
/-- `TauCeti.Functoriality.ramanujan_of_symPower` (ML.5/symmetric-power-functoriality-implies-
ramanujan, Langlands' argument): if all `Symⁿπ`, `Symⁿπ^∨` (`n ≥ 1`) are automorphic, then `π_v`
is tempered at every finite place where `π` is unramified. -/
theorem ramanujan_of_symPower (C : FunctorialityContext F) (hU : UnramifiedCompat C)
    (hJS : JacquetShalikaBound C) (π : C.AutRep 2) (hπ : C.IsCuspidal π) (hu : C.IsUnitary π)
    (hsym : ∀ n : ℕ, 1 ≤ n →
      (∃ P : C.AutRep (n + 1), IsWeakLift C (AlgRep.symPow n) π P ∧ IsUnitaryIsobaric C P) ∧
        ∃ P' : C.AutRep (n + 1), IsWeakLift C (AlgRep.symPow n) (C.dual π) P' ∧
          IsUnitaryIsobaric C P') :
    ∀ v, ¬ C.IsArchimedean v → C.IsUnramifiedAt π v → IsTemperedAt C π v := by
  sorry

/-! ### Frontier statements: functoriality and reciprocity -/

/-- Artin representations: continuous homomorphisms `G_F → GL_n(ℂ)` with finite image. -/
def ArtinRep (F : Type) [Field F] (n : ℕ) : Type :=
  {r : Field.absoluteGaloisGroup F →* GLC n // (Set.range r).Finite ∧ Continuous r}

/-- Irreducibility of an Artin representation (no non-trivial proper invariant subspace). -/
def ArtinRep.IsIrreducible {n : ℕ} (r : ArtinRep F n) : Prop :=
  0 < n ∧ ∀ W : Submodule ℂ (Fin n → ℂ),
    (∀ g, ∀ w ∈ W, ((r.1 g : GLC n) : Matrix (Fin n) (Fin n) ℂ).mulVec w ∈ W) → W = ⊥ ∨ W = ⊤

/-- The context with Frobenius elements, inertia groups and Artin L-functions (owners:
tauceti:TauCetiRoadmap/Chebotarev layer 10, ML.1/strong-artin-conjecture). -/
structure ArtinContext (F : Type) [Field F] [NumberField F] extends FunctorialityContext F where
  /-- A Frobenius element at a finite place `v` (well defined up to conjugacy and inertia). -/
  frob : Place → Field.absoluteGaloisGroup F
  /-- An inertia group at `v`. -/
  inertia : Place → Subgroup (Field.absoluteGaloisGroup F)
  /-- The partial Artin L-function `L^S(s, r)`, given by its values off its poles. -/
  artinL : ∀ {n : ℕ}, ArtinRep F n → Finset Place → ℂ → ℂ

/-- The Artin representation `r` and the automorphic `π` match: at almost all (finite) `v` both are
unramified and `c_v(π) ~ r(Frob_v)`. -/
def ArtinMatches (AC : ArtinContext F) {n : ℕ} (r : ArtinRep F n) (π : AC.AutRep n) : Prop :=
  ∃ S : Finset AC.Place, ∀ v, v ∉ S → ¬ AC.IsArchimedean v ∧ AC.IsUnramifiedAt π v ∧
    AC.inertia v ≤ r.1.ker ∧ IsConj (AC.satake π v) (r.1 (AC.frob v))

/-- General reductive groups over `F`, their automorphic representations, Satake parameters and
L-homomorphisms (owners: tauceti:TauCetiRoadmap/ReductiveGroups layer 6, AutomorphicFormsOnReductive-
Groups AF.2, ML.0/endpoint-status-register). `LHom G' G` are L-homomorphisms `ᴸG′ → ᴸG`. -/
structure ReductiveContext (F : Type) [Field F] [NumberField F] extends ArtinContext F where
  /-- Connected reductive groups over `F`. -/
  Grp : Type
  /-- Quasi-splitness. -/
  IsQuasiSplit : Grp → Prop
  /-- Automorphic representations of `G(𝔸_F)`. -/
  AutRepG : Grp → Type
  /-- `π_v` unramified. -/
  IsUnramifiedAtG : ∀ {G : Grp}, AutRepG G → Place → Prop
  /-- Semisimple `Ĝ`-conjugacy classes in `Ĝ ⋊ Frob_v` (unramified Satake parameters at `v`). -/
  SatakeClass : Grp → Place → Type
  /-- The Satake parameter `c_v(π)`. -/
  satakeG : ∀ {G : Grp}, AutRepG G → (v : Place) → SatakeClass G v
  /-- L-homomorphisms `ᴸG′ → ᴸG` (compatible with the projections), up to `Ĝ`-conjugacy. -/
  LHom : Grp → Grp → Type
  /-- The identity L-homomorphism. -/
  idL : ∀ G : Grp, LHom G G
  /-- Composition `ρ' ∘ ρ`. -/
  compL : ∀ {G₁ G₂ G₃ : Grp}, LHom G₂ G₃ → LHom G₁ G₂ → LHom G₁ G₃
  /-- `ρ(c)` for a Satake class `c` (at the places where `ρ` is unramified). -/
  mapSatake : ∀ {G' G : Grp}, LHom G' G → (v : Place) → SatakeClass G' v → SatakeClass G v
  /-- `id(c) = c` (definitional law). -/
  mapSatake_id : ∀ (G : Grp) (v : Place) (c : SatakeClass G v), mapSatake (idL G) v c = c
  /-- `(ρ' ∘ ρ)(c) = ρ'(ρ(c))` (definitional law). -/
  mapSatake_comp : ∀ {G₁ G₂ G₃ : Grp} (ρ' : LHom G₂ G₃) (ρ : LHom G₁ G₂) (v : Place)
    (c : SatakeClass G₁ v), mapSatake (compL ρ' ρ) v c = mapSatake ρ' v (mapSatake ρ v c)
  /-- `GL_n` as a group over `F`. -/
  glGroup : ℕ → Grp
  /-- The trivial group `{1}`, with `ᴸ{1} = Gal(E/F)`. -/
  trivialGroup : Grp
  /-- Automorphic representations of `GL_n` are the isobaric ones (Langlands). -/
  glAutRep : ∀ n : ℕ, AutRepG (glGroup n) ≃ AutRep n
  /-- The Satake class of `t ∈ GL_n(ℂ)`. -/
  glClass : ∀ {n : ℕ} (v : Place), GLC n → SatakeClass (glGroup n) v
  /-- The L-homomorphism `ᴸGL_n → ᴸGL_N` of an algebraic representation. -/
  ofAlgRep : ∀ {n N : ℕ}, AlgRep n N → LHom (glGroup n) (glGroup N)
  /-- An Artin representation as an L-homomorphism `ᴸ{1} = Gal(E/F) → GL_n(ℂ)`. -/
  ofArtin : ∀ {n : ℕ}, ArtinRep F n → LHom trivialGroup (glGroup n)

/-- The dictionary between `ReductiveContext` and the `GL_n` data (owners as in the fields). -/
structure ReductiveCompat (RC : ReductiveContext F) : Prop where
  /-- Almost all components are unramified. -/
  almostUnramifiedG : ∀ {G : RC.Grp} (π : RC.AutRepG G),
    ∃ S : Finset RC.Place, ∀ v, v ∉ S → ¬ RC.IsArchimedean v ∧ RC.IsUnramifiedAtG π v
  /-- Unramifiedness for `GL_n`. -/
  gl_unramified : ∀ {n : ℕ} (π : RC.AutRepG (RC.glGroup n)) (v : RC.Place),
    RC.IsUnramifiedAtG π v ↔ RC.IsUnramifiedAt (RC.glAutRep n π) v
  /-- Satake classes for `GL_n`. -/
  gl_satake : ∀ {n : ℕ} (π : RC.AutRepG (RC.glGroup n)) (v : RC.Place), ¬ RC.IsArchimedean v →
    RC.IsUnramifiedAtG π v → RC.satakeG π v = RC.glClass v (RC.satake (RC.glAutRep n π) v)
  /-- Satake classes of `GL_n` are conjugacy classes. -/
  glClass_eq_iff : ∀ {n : ℕ} (v : RC.Place) (t t' : GLC n), RC.glClass v t = RC.glClass v t' ↔ IsConj t t'
  /-- `R` acts on Satake classes as on matrices. -/
  mapSatake_ofAlgRep : ∀ {n N : ℕ} (R : AlgRep n N) (v : RC.Place) (t : GLC n),
    RC.mapSatake (RC.ofAlgRep R) v (RC.glClass v t) = RC.glClass v (R.toHom t)
  /-- The trivial group has exactly one automorphic representation, unramified everywhere. -/
  trivial_unique : ∀ π π' : RC.AutRepG RC.trivialGroup, π = π'
  /-- ... and it exists. -/
  trivial_nonempty : Nonempty (RC.AutRepG RC.trivialGroup)
  /-- The Satake class of the trivial representation is `Frob_v`, mapped by `r` to `r(Frob_v)`. -/
  mapSatake_ofArtin : ∀ {n : ℕ} (r : ArtinRep F n) (π : RC.AutRepG RC.trivialGroup) (v : RC.Place),
    ¬ RC.IsArchimedean v → RC.inertia v ≤ r.1.ker →
      RC.mapSatake (RC.ofArtin r) v (RC.satakeG π v) = RC.glClass v (r.1 (RC.frob v))

/-- `TauCeti.Functoriality.Functoriality` (ML.5/functoriality-conjecture, frontier statement):
Functoriality(G′, G, ρ): for every automorphic `π′` of `G′(𝔸_F)` there is an automorphic `π` of
`G(𝔸_F)` with `c_v(π) = ρ(c_v(π′))` at all places outside a finite set (where both are
unramified). The conjecture is for `G` quasi-split; it is never asserted here. -/
def Functoriality (RC : ReductiveContext F) (G' G : RC.Grp) (ρ : RC.LHom G' G) : Prop :=
  ∀ π' : RC.AutRepG G', ∃ π : RC.AutRepG G, ∃ S : Finset RC.Place, ∀ v, v ∉ S →
    ¬ RC.IsArchimedean v ∧ RC.IsUnramifiedAtG π' v ∧ RC.IsUnramifiedAtG π v ∧
      RC.satakeG π v = RC.mapSatake ρ v (RC.satakeG π' v)

/-- `TauCeti.Functoriality.Functoriality.comp`: Functoriality(G′, G, ρ) and Functoriality(G, G″, ρ′)
imply Functoriality(G′, G″, ρ′ ∘ ρ) (weak form). -/
theorem Functoriality.comp {RC : ReductiveContext F} {G₁ G₂ G₃ : RC.Grp} {ρ : RC.LHom G₁ G₂}
    {ρ' : RC.LHom G₂ G₃} (h : Functoriality RC G₁ G₂ ρ) (h' : Functoriality RC G₂ G₃ ρ') :
    Functoriality RC G₁ G₃ (RC.compL ρ' ρ) := by
  classical
  intro π₁
  obtain ⟨π₂, S, hS⟩ := h π₁
  obtain ⟨π₃, S', hS'⟩ := h' π₂
  refine ⟨π₃, S ∪ S', fun v hv => ?_⟩
  rw [Finset.mem_union, not_or] at hv
  obtain ⟨ha, hu₁, hu₂, he⟩ := hS v hv.1
  obtain ⟨-, -, hu₃, he'⟩ := hS' v hv.2
  exact ⟨ha, hu₁, hu₃, by rw [he', he, RC.mapSatake_comp]⟩

/-- `TauCeti.Functoriality.Functoriality.id`: Functoriality(G, G, id) holds. -/
theorem Functoriality.id {RC : ReductiveContext F} (hR : ReductiveCompat RC) (G : RC.Grp) :
    Functoriality RC G G (RC.idL G) := by
  intro π
  obtain ⟨S, hS⟩ := hR.almostUnramifiedG π
  exact ⟨π, S, fun v hv => ⟨(hS v hv).1, (hS v hv).2, (hS v hv).2, (RC.mapSatake_id G v _).symm⟩⟩

/-- `TauCeti.Functoriality.Functoriality.of_gelbartJacquet`: Functoriality(GL₂, GL₃, Sym²) holds
(Gelbart–Jacquet, ML.5/gelbart-jacquet, together with the isobaric case). -/
theorem Functoriality.of_gelbartJacquet (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hC : LLCCompat RC.toFunctorialityContext) (hU : UnramifiedCompat RC.toFunctorialityContext) :
    Functoriality RC (RC.glGroup 2) (RC.glGroup (2 + 1)) (RC.ofAlgRep (AlgRep.symPow 2)) := by
  sorry

/-- `TauCeti.Functoriality.Functoriality.sym`: Functoriality(GL₂, GL_{n+1}, Symⁿ) for all `n` is the
symmetric power conjecture of ML.3: every cuspidal `π` of `GL₂` has a weak `Symⁿ` lift for all `n`. -/
theorem Functoriality.sym (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hC : LLCCompat RC.toFunctorialityContext) (hU : UnramifiedCompat RC.toFunctorialityContext) :
    (∀ n : ℕ, Functoriality RC (RC.glGroup 2) (RC.glGroup (n + 1)) (RC.ofAlgRep (AlgRep.symPow n))) ↔
      ∀ n : ℕ, ∀ π : RC.AutRep 2, RC.IsCuspidal π →
        ∃ P : RC.AutRep (n + 1), IsWeakLift RC.toFunctorialityContext (AlgRep.symPow n) π P := by
  sorry

/-- `TauCeti.Functoriality.functoriality_trivialGroup`: `G′ = {1}`, `G = GL₁`, `ρ` trivial:
Functoriality is the statement that the trivial character is automorphic (true). -/
theorem functoriality_trivialGroup (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hU : UnramifiedCompat RC.toFunctorialityContext) (one : ArtinRep F 1)
    (hone : ∀ g, one.1 g = 1) :
    Functoriality RC RC.trivialGroup (RC.glGroup 1) (RC.ofArtin one) ∧
      ∀ π' : RC.AutRepG RC.trivialGroup, ∃ S : Finset RC.Place, ∀ v, v ∉ S →
        RC.IsUnramifiedAtG ((RC.glAutRep 1).symm RC.one) v ∧
          RC.satakeG ((RC.glAutRep 1).symm RC.one) v = RC.mapSatake (RC.ofArtin one) v (RC.satakeG π' v) := by
  sorry

/-- `TauCeti.Functoriality.functoriality_det`: `G′ = GL_n`, `G = GL₁`, `ρ = det`: Functoriality
holds, the lift of `π` being `ω_π`. -/
theorem functoriality_det (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hC : LLCCompat RC.toFunctorialityContext) (hU : UnramifiedCompat RC.toFunctorialityContext)
    (n : ℕ) : Functoriality RC (RC.glGroup n) (RC.glGroup 1) (RC.ofAlgRep (AlgRep.det n)) := by
  sorry

/-- The strong Artin conjecture for `r` (ML.1/strong-artin-conjecture, restated): `r` matches an
automorphic `π`, cuspidal when `r` is irreducible. -/
def StrongArtin (AC : ArtinContext F) {n : ℕ} (r : ArtinRep F n) : Prop :=
  ∃ π : AC.AutRep n, ArtinMatches AC r π ∧ (r.IsIrreducible → AC.IsCuspidal π)

/-- `TauCeti.Functoriality.functoriality_reciprocity`: `G′ = {1}` with `ᴸG′ = Gal(E/F)`, `G = GL_n`,
`ρ = r`: Functoriality is the strong Artin conjecture for `r`. -/
theorem functoriality_reciprocity (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hC : LLCCompat RC.toFunctorialityContext) (hU : UnramifiedCompat RC.toFunctorialityContext)
    {n : ℕ} (r : ArtinRep F n) :
    Functoriality RC RC.trivialGroup (RC.glGroup n) (RC.ofArtin r) ↔ StrongArtin RC.toArtinContext r := by
  sorry

/-- `TauCeti.Functoriality.functoriality_not_from_parameters`: a semisimple parametrisation of local
representations (Fargues–Scholze: the data `satakeG`, `mapSatake` of the context) does not imply any
instance of Functoriality, which asks for automorphic `π`: there is a context with an instance of
Functoriality failing. -/
theorem functoriality_not_from_parameters :
    ∃ (RC : ReductiveContext F) (G' G : RC.Grp) (ρ : RC.LHom G' G), ¬ Functoriality RC G' G ρ := by
  sorry

/-- `TauCeti.Functoriality.Reciprocity` (ML.5/global-langlands-reciprocity-conjecture, frontier
statement): Reciprocity(F, n): every irreducible Artin representation `r : G_F → GL_n(ℂ)` matches a
cuspidal `π` on `GL_n(𝔸_F)` (`c_v(π) = r(Frob_v)` at almost all `v`). Never asserted here. -/
def Reciprocity (AC : ArtinContext F) (n : ℕ) : Prop :=
  ∀ r : ArtinRep F n, r.IsIrreducible → ∃ π : AC.AutRep n, AC.IsCuspidal π ∧ ArtinMatches AC r π

-- NOTE: `Reciprocity.one`, `reciprocity_gl1`, `reciprocity_dihedral` are class field theory and
-- automorphic induction for the genuine instance; false for arbitrary context data.
/-- `TauCeti.Functoriality.Reciprocity.one`: Reciprocity(F, 1) holds (class field theory). -/
theorem Reciprocity.one (AC : ArtinContext F) (hC : LLCCompat AC.toFunctorialityContext)
    (hU : UnramifiedCompat AC.toFunctorialityContext) : Reciprocity AC 1 := by
  sorry

/-- `TauCeti.Functoriality.Reciprocity.of_functoriality`: Functoriality({1}, GL_n, r) for all `r`
implies Reciprocity(F, n). -/
theorem Reciprocity.of_functoriality (RC : ReductiveContext F) (hR : ReductiveCompat RC)
    (hC : LLCCompat RC.toFunctorialityContext) (hU : UnramifiedCompat RC.toFunctorialityContext)
    (n : ℕ) (h : ∀ r : ArtinRep F n, Functoriality RC RC.trivialGroup (RC.glGroup n) (RC.ofArtin r)) :
    Reciprocity RC.toArtinContext n := by
  sorry

/-- `TauCeti.Functoriality.Reciprocity.implies_artin`: reciprocity for an irreducible non-trivial `r`
(a cuspidal `π` matching `r`) implies the Artin conjecture for `r`: `L^S(s, r)` is entire
(Godement–Jacquet). -/
theorem Reciprocity.implies_artin (AC : ArtinContext F) {n : ℕ} (r : ArtinRep F n)
    (hr : r.IsIrreducible) (hnt : ¬ (n = 1 ∧ ∀ g, r.1 g = 1)) (π : AC.AutRep n)
    (hπ : AC.IsCuspidal π) (hm : ArtinMatches AC r π) (S : Finset AC.Place)
    (hS : ∀ v, AC.IsArchimedean v → v ∈ S) : Differentiable ℂ (AC.artinL r S) := by
  sorry

/-- `TauCeti.Functoriality.reciprocity_gl1`: for `n = 1`, Reciprocity(F, 1) is Artin reciprocity:
every character of `G_F` with finite image matches a Hecke character of finite order. -/
theorem reciprocity_gl1 (AC : ArtinContext F) (hC : LLCCompat AC.toFunctorialityContext)
    (hU : UnramifiedCompat AC.toFunctorialityContext) :
    ∀ r : ArtinRep F 1, ∃ χ : AC.AutRep 1, ArtinMatches AC r χ ∧ ∃ k : ℕ, 0 < k ∧ heckePow AC.toFunctorialityContext χ k = AC.one := by
  sorry

/-- The direct sum `r₁ ⊕ r₂` of Artin representations (block-diagonal matrices). -/
def ArtinRep.sum {m n : ℕ} (r₁ : ArtinRep F m) (r₂ : ArtinRep F n) : ArtinRep F (m + n) :=
  let hom : Field.absoluteGaloisGroup F →* GLC (m + n) :=
    { toFun := fun g =>
        ⟨Matrix.reindex finSumFinEquiv finSumFinEquiv
            (Matrix.fromBlocks ((r₁.1 g : GLC m) : Matrix (Fin m) (Fin m) ℂ) 0 0
              ((r₂.1 g : GLC n) : Matrix (Fin n) (Fin n) ℂ)),
          Matrix.reindex finSumFinEquiv finSumFinEquiv
            (Matrix.fromBlocks ((r₁.1 g⁻¹ : GLC m) : Matrix (Fin m) (Fin m) ℂ) 0 0
              ((r₂.1 g⁻¹ : GLC n) : Matrix (Fin n) (Fin n) ℂ)),
          by sorry, by sorry⟩
      map_one' := by sorry
      map_mul' := by sorry }
  ⟨hom, by sorry⟩

/-- Dihedral Artin data: finite-order Hecke characters `θ` of a quadratic `K/F` and the induced
Artin representations `Ind_{G_K}^{G_F} θ` (`θ` read as a character of `G_K` by class field theory;
owners: GL2AutomorphicRepresentationsAndTransfer R17.5, ET.7a). -/
structure DihedralArtinData (AC : ArtinContext F) where
  /-- The quadratic extension data. -/
  quad : QuadraticInduction AC.toFunctorialityContext
  /-- `θ` has finite order. -/
  IsFiniteOrder : quad.HeckeK → Prop
  /-- `Ind_{G_K}^{G_F} θ` for finite-order `θ`. -/
  galoisInd : quad.HeckeK → ArtinRep F 2

-- NOTE: `reciprocity_dihedral` and `reciprocity_reducible_not_cuspidal` hold for the genuine
-- instance (automorphic induction; isobaric sums are not cuspidal); false for arbitrary data.
/-- `TauCeti.Functoriality.reciprocity_dihedral`: an induced `r = Ind_{G_K}^{G_F} θ` (`K/F` quadratic,
`θ` of finite order) corresponds to the automorphic induction `AI_{K/F}(θ)`. -/
theorem reciprocity_dihedral (AC : ArtinContext F) (hC : LLCCompat AC.toFunctorialityContext)
    (hU : UnramifiedCompat AC.toFunctorialityContext) (D : DihedralArtinData AC)
    (θ : D.quad.HeckeK) (hθ : D.IsFiniteOrder θ) :
    ArtinMatches AC (D.galoisInd θ) (D.quad.autInd θ) := by
  sorry

/-- `TauCeti.Functoriality.reciprocity_reducible_not_cuspidal`: for reducible `r = χ₁ ⊕ χ₂` the
matching `π` is the isobaric sum `χ₁ ⊞ χ₂`, not cuspidal: irreducibility is needed. -/
theorem reciprocity_reducible_not_cuspidal (AC : ArtinContext F)
    (hC : LLCCompat AC.toFunctorialityContext) (hU : UnramifiedCompat AC.toFunctorialityContext)
    (r₁ r₂ : ArtinRep F 1) (χ₁ χ₂ : AC.AutRep 1) (h₁ : ArtinMatches AC r₁ χ₁)
    (h₂ : ArtinMatches AC r₂ χ₂) (π : AC.AutRep (1 + 1)) (hm : ArtinMatches AC (r₁.sum r₂) π) :
    π = AC.isobaricSum χ₁ χ₂ ∧ ¬ AC.IsCuspidal π := by
  sorry

/-! ### Frontier statements: local Langlands and categorical local Langlands -/

/-- Representations and L-parameters of reductive groups over a local field `E` (owners:
tauceti:TauCetiRoadmap/ReductiveGroups layer 6, ET.6, ML.4/extended-langlands-parameter,
ML.4/gan-takeda-llc-gsp4, ML.0/endpoint-status-register). -/
structure LocalContext where
  /-- `E` is archimedean. -/
  IsArchimedeanField : Prop
  /-- Connected reductive groups over `E`. -/
  Grp : Type
  /-- Quasi-splitness. -/
  IsQuasiSplit : Grp → Prop
  /-- Being a torus. -/
  IsTorus : Grp → Prop
  /-- Irreducible smooth representations of `G(E)` up to isomorphism. -/
  IrrRep : Grp → Type
  /-- `Ĝ`-conjugacy classes of L-parameters `L_E → ᴸG` (`L_E = W_E` archimedean, `W_E × SU(2)`
  non-archimedean). -/
  LParamG : Grp → Type
  /-- Characters of `Z(G)(E)`. -/
  CentralChar : Grp → Type
  /-- Central character of `π`. -/
  centralCharRep : ∀ {G : Grp}, IrrRep G → CentralChar G
  /-- The character of `Z(G)(E)` attached to `φ` (Langlands for the centre). -/
  centralCharParam : ∀ {G : Grp}, LParamG G → CentralChar G
  /-- Characters of `G(E)` with their parameters (`H¹(W_E, Z(Ĝ))`), used for twisting. -/
  Twist : Grp → Type
  /-- `π ⊗ χ`. -/
  twistRep : ∀ {G : Grp}, IrrRep G → Twist G → IrrRep G
  /-- `φ · a_χ`. -/
  twistParam : ∀ {G : Grp}, LParamG G → Twist G → LParamG G
  /-- Levi subgroups of `G`. -/
  Levi : Grp → Type
  /-- The Levi subgroup as a group. -/
  leviGroup : ∀ {G : Grp}, Levi G → Grp
  /-- `π` is a subquotient of the normalised parabolic induction of `σ`. -/
  IsSubquotientInd : ∀ {G : Grp} (M : Levi G), IrrRep G → IrrRep (leviGroup M) → Prop
  /-- `ᴸM ⊂ ᴸG` applied to parameters. -/
  incParam : ∀ {G : Grp} (M : Levi G), LParamG (leviGroup M) → LParamG G
  /-- Semisimple parameters (`Ĝ`-classes of semisimple `W_E → ᴸG`). -/
  SSParam : Grp → Type
  /-- Semisimplification `φ ↦ φ^{ss}` (restriction along `W_E → W_E × SL₂`, `w ↦ (w, diag(|w|^{1/2}, |w|^{-1/2}))`). -/
  ssParam : ∀ {G : Grp}, LParamG G → SSParam G
  /-- `GL_n`, `SL₂`, `GSp₄` over `E`. -/
  glGroup : ℕ → Grp
  /-- `SL₂`. -/
  sl2 : Grp
  /-- `GSp₄`. -/
  gsp4 : Grp
  /-- The local Langlands correspondence for `GL_n` (Harris–Taylor, Henniart; owner ET.6). -/
  recGL : ∀ n : ℕ, IrrRep (glGroup n) → LParamG (glGroup n)
  /-- Rankin–Selberg `L(s, π × π')` of representations (Jacquet–Piatetski-Shapiro–Shalika). -/
  pairLRep : ∀ {m n : ℕ}, IrrRep (glGroup m) → IrrRep (glGroup n) → ℂ → ℂ
  /-- `L(s, φ ⊗ φ')` of parameters. -/
  pairLParam : ∀ {m n : ℕ}, LParamG (glGroup m) → LParamG (glGroup n) → ℂ → ℂ
  /-- `ε(s, π × π', ψ)` for the fixed `ψ`. -/
  pairEpsRep : ∀ {m n : ℕ}, IrrRep (glGroup m) → IrrRep (glGroup n) → ℂ → ℂ
  /-- `ε(s, φ ⊗ φ', ψ)`. -/
  pairEpsParam : ∀ {m n : ℕ}, LParamG (glGroup m) → LParamG (glGroup n) → ℂ → ℂ
  /-- Unramified principal series `χ₁ × χ₂` of `GL₂(E)` (when irreducible). -/
  principalSeries : IrrRep (glGroup 1) → IrrRep (glGroup 1) → IrrRep (glGroup 2)
  /-- `χ` is unramified. -/
  IsUnramifiedChar : IrrRep (glGroup 1) → Prop
  /-- `φ₁ ⊕ φ₂` for one-dimensional parameters. -/
  sumParam₁ : LParamG (glGroup 1) → LParamG (glGroup 1) → LParamG (glGroup 2)

/-- `rec` satisfies the requirements of the local Langlands correspondence for `G`: surjective with
finite fibres, compatible with central characters, twisting and parabolic induction (on
semisimplifications), bijective for `GL_n`. -/
def IsLLCMap (LC : LocalContext) (G : LC.Grp) (rec : LC.IrrRep G → LC.LParamG G) : Prop :=
  Function.Surjective rec ∧ (∀ φ, (rec ⁻¹' {φ}).Finite) ∧
    (∀ π, LC.centralCharParam (rec π) = LC.centralCharRep π) ∧
    (∀ π χ, rec (LC.twistRep π χ) = LC.twistParam (rec π) χ) ∧
    (∀ M : LC.Levi G, ∃ recM : LC.IrrRep (LC.leviGroup M) → LC.LParamG (LC.leviGroup M),
      IsLLCMapCore LC (LC.leviGroup M) recM ∧
      ∀ π σ, LC.IsSubquotientInd M π σ → LC.ssParam (rec π) = LC.ssParam (LC.incParam M (recM σ))) ∧
    (∀ n, G = LC.glGroup n → Function.Bijective rec)
where
  /-- The non-recursive part of `IsLLCMap` (used for the Levi subgroups). -/
  IsLLCMapCore (LC : LocalContext) (H : LC.Grp) (r : LC.IrrRep H → LC.LParamG H) : Prop :=
    Function.Surjective r ∧ (∀ φ, (r ⁻¹' {φ}).Finite) ∧
      (∀ π, LC.centralCharParam (r π) = LC.centralCharRep π) ∧
      (∀ π χ, r (LC.twistRep π χ) = LC.twistParam (r π) χ)

/-- `TauCeti.Functoriality.LocalLanglands` (ML.5/local-langlands-conjecture-general, frontier
statement): LLC(G, E) for `G` quasi-split over the local field `E`: there is a surjective finite-to-
one `π ↦ φ_π` compatible with central characters, twisting and parabolic induction, bijective for
`GL_n` (L- and ε-factors of pairs: `LocalLanglands.gl`). Never asserted for general `G`. -/
def LocalLanglands (LC : LocalContext) (G : LC.Grp) : Prop :=
  ∃ rec : LC.IrrRep G → LC.LParamG G, IsLLCMap LC G rec

-- NOTE: the known cases below are theorems about the genuine local data; false for arbitrary
-- `LocalContext`.
/-- `TauCeti.Functoriality.LocalLanglands.gl`: LLC(GL_n, E) holds (Harris–Taylor, Henniart; Scholze),
by `recGL`, which preserves L- and ε-factors of pairs. -/
theorem LocalLanglands.gl (LC : LocalContext) (n : ℕ) :
    IsLLCMap LC (LC.glGroup n) (LC.recGL n) ∧
      ∀ (m : ℕ) (π : LC.IrrRep (LC.glGroup n)) (π' : LC.IrrRep (LC.glGroup m)),
        LC.pairLRep π π' = LC.pairLParam (LC.recGL n π) (LC.recGL m π') ∧
          LC.pairEpsRep π π' = LC.pairEpsParam (LC.recGL n π) (LC.recGL m π') := by
  sorry

/-- `TauCeti.Functoriality.LocalLanglands.archimedean`: LLC(G, ℝ) (and over `ℂ`) holds (Langlands). -/
theorem LocalLanglands.archimedean (LC : LocalContext) (hE : LC.IsArchimedeanField) (G : LC.Grp)
    (hG : LC.IsQuasiSplit G) : LocalLanglands LC G := by
  sorry

/-- `TauCeti.Functoriality.LocalLanglands.gsp4`: LLC(GSp₄, E) holds (Gan–Takeda, ML.4/gan-takeda-llc-gsp4). -/
theorem LocalLanglands.gsp4 (LC : LocalContext) (hE : ¬ LC.IsArchimedeanField) :
    LocalLanglands LC LC.gsp4 := by
  sorry

/-- `TauCeti.Functoriality.llc_torus`: for `G = GL₁`, LLC is local class field theory: a bijection
`Hom(E^×, ℂ^×) ≅ Hom(W_E, ℂ^×)` compatible with twisting. -/
theorem llc_torus (LC : LocalContext) :
    LocalLanglands LC (LC.glGroup 1) ∧
      ∃ e : LC.IrrRep (LC.glGroup 1) ≃ LC.LParamG (LC.glGroup 1),
        ∀ π χ, e (LC.twistRep π χ) = LC.twistParam (e π) χ := by
  sorry

/-- `TauCeti.Functoriality.llc_sl2_not_injective`: for `G = SL₂` over a non-archimedean `E` the map
is not injective: L-packets of size 2 and 4 occur (ML.4/extended-langlands-parameter). -/
theorem llc_sl2_not_injective (LC : LocalContext) (hE : ¬ LC.IsArchimedeanField)
    (rec : LC.IrrRep LC.sl2 → LC.LParamG LC.sl2) (hrec : IsLLCMap LC LC.sl2 rec) :
    ¬ Function.Injective rec ∧ (∃ φ, Nat.card (rec ⁻¹' {φ}) = 2) ∧ ∃ φ, Nat.card (rec ⁻¹' {φ}) = 4 := by
  sorry

/-- `TauCeti.Functoriality.llc_gl2_unramified`: for `GL₂` and an (irreducible) unramified principal
series `χ₁ × χ₂`, `φ = χ₁ ⊕ χ₂` through `Art⁻¹`. -/
theorem llc_gl2_unramified (LC : LocalContext) (hE : ¬ LC.IsArchimedeanField)
    (χ₁ χ₂ : LC.IrrRep (LC.glGroup 1)) (h₁ : LC.IsUnramifiedChar χ₁) (h₂ : LC.IsUnramifiedChar χ₂) :
    LC.recGL 2 (LC.principalSeries χ₁ χ₂) = LC.sumParam₁ (LC.recGL 1 χ₁) (LC.recGL 1 χ₂) := by
  sorry

open CategoryTheory in
/-- The categorical data of Fargues–Scholze over a non-archimedean `E` with `Λ = Q̄_ℓ` and a fixed
Whittaker datum (owners: ExcursionOperatorsAndSpectralAction ES7, DiamondEtaleCohomology). -/
structure CategoricalContext extends LocalContext where
  /-- `D_lis(Bun_G, Q̄_ℓ)` (compact objects suffice). -/
  BunSheaves : Grp → Type
  /-- Its category structure. -/
  [bunCat : ∀ G, Category.{0} (BunSheaves G)]
  /-- (Ind-)coherent sheaves on the stack `Par_Ĝ` of L-parameters (nilpotent singular support). -/
  CohPar : Grp → Type
  /-- Its category structure. -/
  [cohCat : ∀ G, Category.{0} (CohPar G)]
  /-- The Whittaker sheaf. -/
  whittaker : ∀ G, BunSheaves G
  /-- The structure sheaf `𝒪`. -/
  structureSheaf : ∀ G, CohPar G
  /-- Algebraic representations of `ᴸG` (Hecke kernels). -/
  RepLG : Grp → Type
  /-- The Hecke operator `T_V`. -/
  hecke : ∀ {G : Grp}, RepLG G → BunSheaves G ⥤ BunSheaves G
  /-- The spectral action of `V` (tensoring with the vector bundle `V`). -/
  spectral : ∀ {G : Grp}, RepLG G → CohPar G ⥤ CohPar G
  /-- The sheaf on `Bun_G` of an irreducible `π` (extension by zero from `Bun_G^1 = [*/G(E)]`). -/
  ofRep : ∀ {G : Grp}, IrrRep G → BunSheaves G
  /-- The Fargues–Scholze semisimple parameter `φ_π^{FS}` (a theorem of Fargues–Scholze). -/
  fsParam : ∀ {G : Grp}, IrrRep G → SSParam G
  /-- The support of a sheaf on `Par_Ĝ` in the coarse moduli of semisimple parameters. -/
  ssSupport : ∀ {G : Grp}, CohPar G → Set (SSParam G)

attribute [instance] CategoricalContext.bunCat CategoricalContext.cohCat

open CategoryTheory in
/-- `TauCeti.Functoriality.CategoricalLLC` (ML.5/categorical-local-langlands-conjecture, frontier
statement): CatLLC(G, E): a fully faithful functor from sheaves on `Bun_G` to (ind-)coherent sheaves
on the stack of L-parameters, sending the Whittaker sheaf to the structure sheaf and intertwining
Hecke operators with the spectral action. Never asserted for general `G`. -/
def CategoricalLLC (CC : CategoricalContext) (G : CC.Grp) : Prop :=
  ∃ Φ : CC.BunSheaves G ⥤ CC.CohPar G, Φ.Full ∧ Φ.Faithful ∧
    Nonempty (Φ.obj (CC.whittaker G) ≅ CC.structureSheaf G) ∧
    ∀ V : CC.RepLG G, Nonempty (CC.hecke V ⋙ Φ ≅ Φ ⋙ CC.spectral V)

open CategoryTheory in
/-- `TauCeti.Functoriality.CategoricalLLC.implies_semisimple`: CatLLC is compatible with the
Fargues–Scholze semisimple parametrisation: the image of `π` is supported at `φ_π^{FS}`. -/
theorem CategoricalLLC.implies_semisimple (CC : CategoricalContext) (G : CC.Grp)
    (h : CategoricalLLC CC G) :
    ∃ Φ : CC.BunSheaves G ⥤ CC.CohPar G, Φ.Full ∧ Φ.Faithful ∧
      ∀ π : CC.IrrRep G, CC.ssSupport (Φ.obj (CC.ofRep π)) ⊆ {CC.fsParam π} := by
  sorry

/-- `TauCeti.Functoriality.CategoricalLLC.torus`: for `G` a torus, CatLLC holds (Zou; Fargues–Scholze
for `GL₁`). -/
theorem CategoricalLLC.torus (CC : CategoricalContext) (hE : ¬ CC.IsArchimedeanField) (G : CC.Grp)
    (hG : CC.IsTorus G) : CategoricalLLC CC G := by
  sorry

/-- `TauCeti.Functoriality.catLLC_gl1`: `G = GL₁`: `Bun_{GL₁}` splits by degree and CatLLC reduces
to local class field theory; it holds. -/
theorem catLLC_gl1 (CC : CategoricalContext) (hE : ¬ CC.IsArchimedeanField) :
    CategoricalLLC CC (CC.glGroup 1) := by
  sorry

/-- `TauCeti.Functoriality.catLLC_not_from_ss`: the semisimple parametrisation alone does not give
CatLLC: semisimplification does not see the monodromy of L-parameters (for `GL₂`, the Steinberg
parameter and `|·|^{1/2} ⊕ |·|^{-1/2}` have the same semisimplification). -/
theorem catLLC_not_from_ss (CC : CategoricalContext) (hE : ¬ CC.IsArchimedeanField) :
    ¬ Function.Injective (CC.ssParam : CC.LParamG (CC.glGroup 2) → CC.SSParam (CC.glGroup 2)) := by
  sorry

open CategoryTheory in
/-- `TauCeti.Functoriality.catLLC_whittaker`: under CatLLC the Whittaker sheaf corresponds to the
structure sheaf of the stack of L-parameters. -/
theorem catLLC_whittaker (CC : CategoricalContext) (G : CC.Grp) (h : CategoricalLLC CC G) :
    ∃ Φ : CC.BunSheaves G ⥤ CC.CohPar G, Φ.Full ∧ Φ.Faithful ∧
      Nonempty (Φ.obj (CC.whittaker G) ≅ CC.structureSheaf G) := by
  obtain ⟨Φ, h₁, h₂, h₃, -⟩ := h
  exact ⟨Φ, h₁, h₂, h₃⟩

end Functoriality

end TauCeti


/-! ## ML.2 Potential automorphy assembly and ML.3 symmetric powers and Sato–Tate

Number fields are finite subextensions of a fixed algebraic closure `Q̄ = AlgebraicClosure ℚ`, so
that `G_F` is the fixing subgroup of `F` in `G_ℚ = Gal(Q̄/ℚ)` and restriction to `G_{F′}` for
`F ≤ F′` is composition with the inclusion of fixing subgroups. `l`-adic representations are
continuous homomorphisms `G_F → GL_n(Q̄_l)` with `Q̄_l = PadicAlgCl l` (spectral norm topology).
Polarizations, potential diagonalizability, `ι`-ordinarity, automorphy, compatible systems and
the Galois representations attached to automorphic representations are owned by other roadmaps;
they enter through `PotentialAutomorphy.GaloisContext`, each field naming its owner. -/

namespace TauCeti

namespace PotentialAutomorphy

/-- A fixed algebraic closure `Q̄` of `ℚ`. -/
abbrev Qbar : Type := AlgebraicClosure ℚ

/-- `G_ℚ = Gal(Q̄/ℚ)` with its Krull topology. -/
abbrev GQ : Type := Qbar ≃ₐ[ℚ] Qbar

/-- A number field: a subfield of `Q̄`, finite over `ℚ` when `[FiniteDimensional ℚ F]` holds. -/
abbrev NF : Type := IntermediateField ℚ Qbar

/-- A finite subextension of `Q̄` is a number field. -/
instance instNumberFieldNF (F : NF) [FiniteDimensional ℚ F] : NumberField F where

/-- The absolute Galois group `G_F ⊆ G_ℚ` of `F ⊆ Q̄`. -/
abbrev GalF (F : NF) : Subgroup GQ := F.fixingSubgroup

/-- `GL_n(Q̄_l)`. -/
abbrev GLQl (l : ℕ) [Fact l.Prime] (n : ℕ) : Type := GL (Fin n) (PadicAlgCl l)

/-- `GL_n(F̄_l)`. -/
abbrev GLFl (l : ℕ) [Fact l.Prime] (n : ℕ) : Type := GL (Fin n) (AlgebraicClosure (ZMod l))

/-- A continuous `n`-dimensional `l`-adic representation of a closed subgroup `H ⊆ G_ℚ`
(for `H = G_F` a global representation, for `H` a decomposition group a local one). -/
abbrev Rep (H : Subgroup GQ) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type :=
  ContinuousMonoidHom H (GLQl l n)

/-- An `l`-adic representation `r : G_F → GL_n(Q̄_l)`. -/
abbrev GaloisRep (F : NF) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type := Rep (GalF F) l n

/-- A continuous character `G_F → Q̄_l^× = GL_1(Q̄_l)`. -/
abbrev GaloisChar (F : NF) (l : ℕ) [Fact l.Prime] : Type := GaloisRep F l 1

/-- A continuous residual representation `H → GL_n(F̄_l)` (discrete target: open kernel). -/
def ResRep (H : Subgroup GQ) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type :=
  {ρ : H →* GLFl l n // IsOpen (ρ.ker : Set H)}

/-- Restriction of a representation of `H` to a subgroup `H' ≤ H`. -/
def Rep.restrict {H H' : Subgroup GQ} (h : H' ≤ H) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : Rep H l n) : Rep H' l n :=
  r.comp ⟨Subgroup.inclusion h, continuous_inclusion h⟩

/-- Restriction `r|_{G_{F′}}` along `F ≤ F′` (also used for characters `µ|_{G_{F′⁺}}`). -/
def GaloisRep.res {F F' : NF} (h : F ≤ F') {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : GaloisRep F l n) : GaloisRep F' l n :=
  Rep.restrict (IntermediateField.fixingSubgroup_le h) r

/-- Restriction of a residual representation to a subgroup. -/
def ResRep.restrict {H H' : Subgroup GQ} (h : H' ≤ H) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : ResRep H l n) : ResRep H' l n :=
  ⟨r.1.comp (Subgroup.inclusion h), by
    have : ((r.1.comp (Subgroup.inclusion h)).ker : Set H') =
        Subgroup.inclusion h ⁻¹' (r.1.ker : Set H) := by
      ext x; simp
    rw [this]; exact r.2.preimage (continuous_inclusion h)⟩

/-- Isomorphism of `l`-adic representations: conjugacy by `GL_n(Q̄_l)`. -/
def Rep.Iso {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r r' : Rep H l n) : Prop :=
  ∃ g : GLQl l n, ∀ x : H, r' x = g * r x * g⁻¹

/-- Isomorphism of residual representations: conjugacy by `GL_n(F̄_l)`. -/
def ResRep.Iso {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r r' : ResRep H l n) : Prop :=
  ∃ g : GLFl l n, ∀ x : H, r'.1 x = g * r.1 x * g⁻¹

/-- Absolute irreducibility of a residual representation: `n ≠ 0` and no `H`-stable subspace
of `F̄_l^n` other than `0` and the whole space. -/
def ResRep.IsIrreducible {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : ResRep H l n) :
    Prop :=
  n ≠ 0 ∧ ∀ W : Submodule (AlgebraicClosure (ZMod l)) (Fin n → AlgebraicClosure (ZMod l)),
    (∀ x : H, ∀ w ∈ W, ((r.1 x : GLFl l n) : Matrix (Fin n) (Fin n) _).mulVec w ∈ W) →
      W = ⊥ ∨ W = ⊤

/-- Irreducibility of an `l`-adic representation over `Q̄_l`. -/
def Rep.IsIrreducible {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : Rep H l n) : Prop :=
  n ≠ 0 ∧ ∀ W : Submodule (PadicAlgCl l) (Fin n → PadicAlgCl l),
    (∀ x : H, ∀ w ∈ W, ((r x : GLQl l n) : Matrix (Fin n) (Fin n) _).mulVec w ∈ W) →
      W = ⊥ ∨ W = ⊤

/-- `F` is an imaginary CM field with maximal totally real subfield `F⁺`: `F⁺ ≤ F`, `F⁺` totally
real, `F` totally complex and `[F : F⁺] = 2`. -/
def IsCMWithPlus (Fp F : NF) : Prop :=
  Fp ≤ F ∧ NumberField.IsTotallyReal Fp ∧ NumberField.IsTotallyComplex F ∧
    Module.finrank ℚ F = 2 * Module.finrank ℚ Fp

/-- `F` is totally real. -/
def IsTotallyRealNF (F : NF) : Prop := NumberField.IsTotallyReal F

/-- `F′/F₀` is a finite Galois extension inside `Q̄`: `F₀ ≤ F′` and `F′` is stable under `G_{F₀}`
(separability is automatic in characteristic zero). -/
def IsGaloisOver (F₀ F' : NF) : Prop :=
  F₀ ≤ F' ∧ ∀ σ ∈ GalF F₀, F'.map (σ : Qbar →ₐ[ℚ] Qbar) = F'

/-- `F′ ⊇ F` is linearly disjoint from `F^{(avoid)} ⊇ F` over `F` (`F^{(avoid)}/F` Galois):
`[F′F^{(avoid)} : ℚ]·[F : ℚ] = [F′ : ℚ]·[F^{(avoid)} : ℚ]`. -/
def IsLinearlyDisjointOver (F F' Favoid : NF) : Prop :=
  Module.finrank ℚ (F' ⊔ Favoid : NF) * Module.finrank ℚ F =
    Module.finrank ℚ F' * Module.finrank ℚ Favoid

/-- `F(ζ_l) ⊆ Q̄`. -/
def adjZeta (F : NF) (l : ℕ) : NF :=
  F ⊔ IntermediateField.adjoin ℚ {x : Qbar | IsPrimitiveRoot x l}

/-- `ζ_l ∉ F`. -/
def ZetaNotIn (F : NF) (l : ℕ) : Prop := ∀ x : Qbar, IsPrimitiveRoot x l → x ∉ F

/-- A set `L` of rational primes has Dirichlet density one:
`(∑_{p ∈ L} p^{-s}) / log (1/(s - 1)) → 1` as `s → 1⁺`. -/
def HasDirichletDensityOne (L : Set ℕ) : Prop :=
  (∀ p ∈ L, p.Prime) ∧
    Filter.Tendsto (fun s : ℝ => (∑' p : L, ((p : ℕ) : ℝ) ^ (-s)) / Real.log (1 / (s - 1)))
      (nhdsWithin 1 (Set.Ioi 1)) (nhds 1)

/-- The ring of `F̄_l`-coefficients is `AlgebraicClosure (ZMod l)`; `Q̄_l ≅ ℂ` isomorphisms. -/
abbrev Iota (l : ℕ) [Fact l.Prime] : Type := PadicAlgCl l ≃+* ℂ

/-- The supplier interface of ML.2: automorphic data over every number field `F ⊆ Q̄`, places and
decomposition groups, and the Galois-side notions owned by other roadmaps. -/
structure GaloisContext where
  /-- Automorphic representations, places, local parameters and L-functions over each number
  field `F ⊆ Q̄` (owners: AutomorphicFormsOnReductiveGroups AF.2–AF.4,
  AutomorphicLFunctionsAndLocalFactors). -/
  aut : ∀ (F : NF) [FiniteDimensional ℚ F], Langlands.Context F
  /-- Residue characteristic of a place (`0` at archimedean places). -/
  residueChar : ∀ {F : NF} [FiniteDimensional ℚ F], (aut F).Place → ℕ
  /-- A decomposition group `G_{F_v} ⊆ G_F` at `v` (for a fixed place of `Q̄` above `v`)
  (owner: AutomorphicGaloisRepresentationsPartII AG2.0, local–global conventions). -/
  decomp : ∀ {F : NF} [FiniteDimensional ℚ F], (aut F).Place → Subgroup GQ
  decomp_le : ∀ {F : NF} [FiniteDimensional ℚ F] (v : (aut F).Place), decomp v ≤ GalF F
  /-- The inertia subgroup `I_{F_v} ⊆ G_{F_v}` (owner: AG2.0). -/
  inertia : ∀ {F : NF} [FiniteDimensional ℚ F], (aut F).Place → Subgroup GQ
  inertia_le : ∀ {F : NF} [FiniteDimensional ℚ F] (v : (aut F).Place), inertia v ≤ decomp v
  /-- The place of `F` below a place of `F′ ⊇ F`, with compatible decomposition groups. -/
  under : ∀ {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'], F ≤ F' →
    (aut F').Place → (aut F).Place
  decomp_under : ∀ {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'] (h : F ≤ F')
    (u : (aut F').Place), decomp u ≤ decomp (under h u)
  /-- The complex conjugation `c_v ∈ G_{F_v}` at an archimedean place `v` (owner: AG2.0). -/
  complexConj : ∀ {F : NF} [FiniteDimensional ℚ F], (aut F).Place → GQ
  complexConj_mem : ∀ {F : NF} [FiniteDimensional ℚ F] (v : (aut F).Place),
    complexConj v ∈ decomp v
  /-- The action `v ↦ cv` of complex conjugation on the places of a CM field (owner: AG2.0). -/
  conjPlace : ∀ {F : NF} [FiniteDimensional ℚ F], (aut F).Place → (aut F).Place
  /-- The place of `F` above `l` induced by an embedding `τ : F ↪ Q̄_l`. -/
  placeOfEmb : ∀ {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime],
    (F →+* PadicAlgCl l) → (aut F).Place
  /-- The `l`-adic cyclotomic character `ε_l` of `G_ℚ` (owner: AG2.0 conventions). -/
  cyclo : ∀ (l : ℕ) [Fact l.Prime], GaloisChar ⊥ l
  /-- The semisimplified reduction `r̄` of an `l`-adic representation (owner: AG2.0). -/
  reduce : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → ResRep H l n
  /-- The multiset of `τ`-Hodge–Tate numbers `HT_τ(r)` of a representation of a decomposition
  group, `τ : F ↪ Q̄_l` (owner: AutomorphicGaloisRepresentationsPartII AG2.0). -/
  HT : ∀ {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (τ : F →+* PadicAlgCl l), Rep (decomp (placeOfEmb τ)) l n → Multiset ℤ
  /-- de Rham (owner: AG2.0). -/
  IsDeRham : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → Prop
  /-- Potentially crystalline (owner: PotentialAutomorphyInfrastructurePartII PL.1). -/
  IsPotCrystalline : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → Prop
  /-- Potential diagonalizability of a local representation (owner:
  PotentialAutomorphyInfrastructurePartII PL.1/potentially-diagonalizable). -/
  IsPotDiag : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → Prop
  /-- The relation `ρ ∼ ρ′` ("connects", same component of the local lifting ring) (owner:
  PotentialAutomorphyInfrastructurePartII PL.1/connects-relation). -/
  Connects : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → Rep H l n → Prop
  /-- `(r, µ)` is polarized, `r : G_F → GL_n(Q̄_l)`, `µ : G_{F⁺} → Q̄_l^×` (owner:
  AutomorphicGaloisRepresentationsPartII AG2.0/polarized-galois-representation). -/
  IsPolarized : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, GaloisRep F l n →
    GaloisChar Fp l → Prop
  /-- `(r̄, µ̄)` is polarized, `µ̄` the reduction of `µ` (owner: AG2.0). -/
  IsPolarizedResidual : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, ResRep (GalF F) l n →
    GaloisChar Fp l → Prop
  /-- A family of local lifts `ρ_v` (`v ∈ S`) satisfies `ρ^c_{cv} ≅ µ ρ_v^∨` (owner: AG2.0, the
  local form of the polarization). -/
  IsPolarizedLocalFamily : ∀ {Fp F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ},
    GaloisChar Fp l → (S : Finset (aut F).Place) → ((v : (aut F).Place) → Rep (decomp v) l n) →
      Prop
  /-- `r_{l,ı}(π)`: the Galois representation of a regular algebraic polarizable cuspidal `π`
  (or of an algebraic Hecke character when `n = 1`) (owners: AutomorphicGaloisRepresentationsPartII
  AG2.0/AG2.2). -/
  galRep : ∀ {F : NF} [FiniteDimensional ℚ F] {n : ℕ}, (aut F).AutRep n → (l : ℕ) → [Fact l.Prime] →
    Iota l → GaloisRep F l n
  /-- `(π, χ)` is a polarized pair, `χ` a Hecke character of `F⁺` (owner:
  PotentialAutomorphyInfrastructurePartII PL.0/automorphic-polarized-representation). -/
  IsPolarizedAut : ∀ {Fp F : NF} [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] {n : ℕ},
    (aut F).AutRep n → (aut Fp).AutRep 1 → Prop
  /-- `π` is `ı`-ordinary at the places above `l` (owner: PotentialAutomorphyInfrastructurePartII
  PL.4/ordinary-automorphy-lifting). -/
  IsOrdinaryAut : ∀ {F : NF} [FiniteDimensional ℚ F] {n : ℕ}, (aut F).AutRep n → (l : ℕ) →
    [Fact l.Prime] → Iota l → Prop
  /-- `(r, µ)` is automorphic (owner: PotentialAutomorphyInfrastructurePartII
  PL.0/automorphic-polarized-representation). -/
  IsAutomorphicPair : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, GaloisRep F l n →
    GaloisChar Fp l → Prop
  /-- `(r, µ)` is automorphic of level prime to `l` (owner: PL.0). -/
  IsAutomorphicPairPrimeTo : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, GaloisRep F l n →
    GaloisChar Fp l → Prop
  /-- `(r̄, µ̄)` is ordinarily automorphic, resp. potentially diagonalizably automorphic (owner:
  PotentialAutomorphyInfrastructurePartII PL.0/PL.5). -/
  IsOrdAutomorphicResidual : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, ResRep (GalF F) l n →
    GaloisChar Fp l → Prop
  IsPDAutomorphicResidual : ∀ {Fp F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, ResRep (GalF F) l n →
    GaloisChar Fp l → Prop
  /-- Weakly compatible systems of rank `n` of `G_F` with coefficients in `M` (owner:
  PotentialModularityAndCompatibleSystems R24.5/weakly-compatible-system-rank-n). -/
  System : ∀ (F : NF) [FiniteDimensional ℚ F] (M : Type) [Field M] [NumberField M], ℕ → Type
  /-- The member `r_λ ⊗_{M_λ} Q̄_l` at the place `λ | l` given by `λ : M ↪ Q̄_l`. -/
  member : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → (l : ℕ) → [Fact l.Prime] → (M →+* PadicAlgCl l) → GaloisRep F l n
  /-- Restriction of a system to `G_{F′}`, member by member. -/
  sysRes : ∀ {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'] {M : Type} [Field M]
    [NumberField M] {n : ℕ}, F ≤ F' → System F M n → System F' M n
  member_sysRes : ∀ {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'] {M : Type}
    [Field M] [NumberField M] {n : ℕ} (h : F ≤ F') (R : System F M n) (l : ℕ) [Fact l.Prime]
    (lam : M →+* PadicAlgCl l), member (sysRes h R) l lam = (member R l lam).res h
  /-- Predicates on systems (owner: PotentialModularityAndCompatibleSystems
  R24.5/compatible-system-predicates): regular, irreducible, pure, strictly pure, extremely
  regular, and automorphy of a polarized system (owner of the last: PL.0). -/
  IsRegularSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → Prop
  IsIrreducibleSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M]
    {n : ℕ}, System F M n → Prop
  IsPureSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → Prop
  IsStrictlyPureSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M]
    {n : ℕ}, System F M n → Prop
  IsExtremelyRegularSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M]
    [NumberField M] {n : ℕ}, System F M n → Prop
  IsAutomorphicSys : ∀ {Fp F : NF} [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] {M : Type}
    [Field M] [NumberField M] {n : ℕ}, System F M n → System Fp M 1 → Prop
  /-- `ℛ ≅ ℛ_1 ⊕ ⋯ ⊕ ℛ_s` (owner: R24.5/linear-algebra-operations-on-systems). -/
  IsSumOf : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → List (Σ m : ℕ, System F M m) → Prop
  /-- The dual system `ℛ^∨` (owner: R24.5/linear-algebra-operations-on-systems). -/
  dualSys : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → System F M n
  /-- Partial, local, completed L-functions and epsilon factor of `ıℛ`, `ı : M ↪ ℂ` (owner:
  PotentialModularityAndCompatibleSystems R24.5/system-l-functions). -/
  sysL : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → (M →+* ℂ) → Finset (aut F).Place → ℂ → ℂ
  sysLocalL : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → (M →+* ℂ) → (aut F).Place → ℂ → ℂ
  sysCompletedL : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M]
    {n : ℕ}, System F M n → (M →+* ℂ) → ℂ → ℂ
  sysEpsilon : ∀ {F : NF} [FiniteDimensional ℚ F] {M : Type} [Field M] [NumberField M] {n : ℕ},
    System F M n → (M →+* ℂ) → ℂ → ℂ
  /-- The integer `d`: the maximal dimension of an irreducible constituent of `r̄` restricted to
  the subgroup generated by the Sylow pro-`l` subgroups (owner: PotentialAutomorphyInfrastructurePartII
  PL.5/pd-automorphy-lifting). -/
  sylowConstituentDim : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, ResRep H l n → ℕ

namespace GaloisContext

variable (C : GaloisContext)

/-- `r|_{G_{F_v}}`. -/
def restrictAt {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : GaloisRep F l n) (v : (C.aut F).Place) : Rep (C.decomp v) l n :=
  Rep.restrict (C.decomp_le v) r

/-- `r` is unramified at `v`: trivial on the inertia group `I_{F_v}`. -/
def IsUnramifiedAt {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : GaloisRep F l n) (v : (C.aut F).Place) : Prop :=
  ∀ x : C.inertia v, r ⟨x, C.decomp_le v (C.inertia_le v x.2)⟩ = 1

/-- `r̄` is unramified at `v`. -/
def IsUnramifiedAtRes {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : ResRep (GalF F) l n) (v : (C.aut F).Place) : Prop :=
  ∀ x : C.inertia v, r.1 ⟨x, C.decomp_le v (C.inertia_le v x.2)⟩ = 1

/-- `ρ_v` has `n` distinct `τ`-Hodge–Tate numbers for every `τ : F ↪ Q̄_l` above `v`. -/
def HasDistinctHT {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    {v : (C.aut F).Place} (ρ : Rep (C.decomp v) l n) : Prop :=
  ∀ (τ : F →+* PadicAlgCl l) (h : C.placeOfEmb τ = v),
    (C.HT τ (h ▸ ρ)).Nodup ∧ Multiset.card (C.HT τ (h ▸ ρ)) = n

/-- `r` is regular algebraic: de Rham above `l` with `n` distinct `τ`-Hodge–Tate numbers for
every `τ`. -/
def IsRegularAlgebraic {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : GaloisRep F l n) : Prop :=
  (∀ v, C.residueChar v = l → C.IsDeRham (C.restrictAt r v)) ∧
    ∀ v, C.residueChar v = l → C.HasDistinctHT (C.restrictAt r v)

/-- `r` is potentially diagonalizable at every place above `l`. -/
def IsPotDiagAbove {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : GaloisRep F l n) : Prop :=
  ∀ v, C.residueChar v = l → C.IsPotDiag (C.restrictAt r v)

/-- `µ` is totally odd: `µ(c_v) = -1` at every archimedean place `v` of `F⁺`. -/
def IsTotallyOddChar {Fp : NF} [FiniteDimensional ℚ Fp] {l : ℕ} [Fact l.Prime]
    (μ : GaloisChar Fp l) : Prop :=
  ∀ v : (C.aut Fp).Place, (C.aut Fp).IsArchimedean v →
    μ ⟨C.complexConj v, C.decomp_le v (C.complexConj_mem v)⟩ = -1

/-- `µ` is de Rham with all Hodge–Tate numbers equal to `w`. -/
def IsDeRhamOfWeight {Fp : NF} [FiniteDimensional ℚ Fp] {l : ℕ} [Fact l.Prime]
    (μ : GaloisChar Fp l) (w : ℤ) : Prop :=
  (∀ v, C.residueChar v = l → C.IsDeRham (C.restrictAt μ v)) ∧
    ∀ τ : Fp →+* PadicAlgCl l, C.HT τ (C.restrictAt μ (C.placeOfEmb τ)) = {w}

/-- The character identity `r_{l,ı}(χ) ε_l^{1-n} = µ` on `G_{F⁺}`. -/
def CharMatches {Fp : NF} [FiniteDimensional ℚ Fp] {l : ℕ} [Fact l.Prime] (n : ℕ)
    (χ : GaloisChar Fp l) (μ : GaloisChar Fp l) : Prop :=
  ∀ x : GalF Fp, χ x * ((C.cyclo l).res bot_le x) ^ (1 - (n : ℤ)) = μ x

/-- `π` is a regular algebraic cuspidal polarized pair `(π, χ)`. -/
def IsRACPolarized {Fp F : NF} [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] {n : ℕ}
    (π : (C.aut F).AutRep n) (χ : (C.aut Fp).AutRep 1) : Prop :=
  (C.aut F).IsCuspidal π ∧ (C.aut F).IsRegularAlgebraic π ∧ C.IsPolarizedAut π χ

/-- `π` has level potentially prime to `l`: `r_{l,ı}(π)` is potentially crystalline above `l`. -/
def HasLevelPotPrimeTo {F : NF} [FiniteDimensional ℚ F] {n : ℕ} (π : (C.aut F).AutRep n)
    (l : ℕ) [Fact l.Prime] (ι : Iota l) : Prop :=
  ∀ v, C.residueChar v = l → C.IsPotCrystalline (C.restrictAt (C.galRep π l ι) v)

/-- `π` is unramified at every place above `l`. -/
def IsUnramifiedAbove {F : NF} [FiniteDimensional ℚ F] {n : ℕ} (π : (C.aut F).AutRep n)
    (l : ℕ) : Prop :=
  ∀ v, C.residueChar v = l → (C.aut F).IsUnramifiedAt π v

end GaloisContext

/-- Supplier data for the Moret–Bailly theorem: a smooth geometrically connected variety `T` over
`K`, its points over finite extensions and its local points (owner:
PotentialModularityAndCompatibleSystems R23.1/moret-bailly-theorem-incomplete-skolem-data-have-
integral-points). Local points over the field cut out by a subgroup `H` of a decomposition
group form `LocPt H`. -/
structure MoretBaillyVariety (C : GaloisContext) (K : NF) [FiniteDimensional ℚ K] where
  /-- `T(L)` for `L ⊇ K`. -/
  Pt : NF → Type
  /-- `T(L_H)` for the local field `L_H` fixed by `H ≤ G_{K_v}`, with its analytic topology. -/
  LocPt : Subgroup GQ → Type
  topLocPt : ∀ H, TopologicalSpace (LocPt H)
  /-- The image of a global point in `T(L_w)`, `L_w` the completion at the fixed place `w | v`. -/
  toLocal : ∀ {L : NF} (v : (C.aut K).Place), Pt L → LocPt (C.decomp v ⊓ GalF L)
  /-- `T` is smooth and geometrically connected over `K`. -/
  smooth_geomConnected : Prop
  /-- The action of `Gal(L′_v/K_v) = G_{K_v}/H` on `T(L′_v)`. -/
  galAct : ∀ {H : Subgroup GQ}, GQ → LocPt H → LocPt H

attribute [instance] MoretBaillyVariety.topLocPt

/-- `TauCeti.PotentialAutomorphy.exists_point_galois_control` (ML.2/moret-bailly-galois-control,
BLGGT Proposition 3.1.1): with `K^{(avoid)}/K` and `K/K₀` Galois, `S` a finite set of places of `K`,
finite Galois `L′_v/K_v` (`v ∈ S`, given by open normal subgroups `N_v ≤ G_{K_v}`), `T/K` smooth and
geometrically connected and non-empty `Gal(L′_v/K_v)`-invariant opens `Ω_v ⊆ T(L′_v)`, there are a
finite Galois `L/K₀` containing `K`, linearly disjoint from `K^{(avoid)}` over `K`, and `P ∈ T(L)`
with `L_w ≅ L′_v` and `P ∈ Ω_v` at the fixed `w | v ∈ S`.
NOTE: `L′_{σv} = σL′_v` is encoded by `S` being a set of places of `K` with the `N_v` given. -/
theorem exists_point_galois_control (C : GaloisContext) {K₀ K Kavoid : NF}
    [FiniteDimensional ℚ K₀] [FiniteDimensional ℚ K] [FiniteDimensional ℚ Kavoid]
    (hK : IsGaloisOver K₀ K) (havoid : IsGaloisOver K Kavoid)
    (S : Finset (C.aut K).Place) (N : (C.aut K).Place → Subgroup GQ)
    (hN : ∀ v ∈ S, N v ≤ C.decomp v ∧ ((N v).subgroupOf (C.decomp v)).Normal ∧ IsOpen (N v : Set GQ))
    (T : MoretBaillyVariety C K) (hT : T.smooth_geomConnected)
    (Ω : ∀ v, Set (T.LocPt (N v)))
    (hΩ : ∀ v ∈ S, IsOpen (Ω v) ∧ (Ω v).Nonempty ∧
      ∀ σ ∈ C.decomp v, ∀ P ∈ Ω v, T.galAct σ P ∈ Ω v) :
    ∃ (L : NF) (_ : FiniteDimensional ℚ L) (P : T.Pt L), K ≤ L ∧ IsGaloisOver K₀ L ∧
      IsLinearlyDisjointOver K L Kavoid ∧
      ∀ v ∈ S, ∃ h : C.decomp v ⊓ GalF L = N v, h ▸ T.toLocal v P ∈ Ω v := by
  sorry

/-- The extension produced by potential automorphy: `F′ ⊇ F` CM with `F′⁺ ⊇ F⁺`, Galois over
`F₀` and linearly disjoint from `F^{(avoid)}` over `F`. -/
def IsGoodCMExtension (F₀ Fp F Favoid Fp' F' : NF) : Prop :=
  IsCMWithPlus Fp' F' ∧ F ≤ F' ∧ Fp ≤ Fp' ∧ IsGaloisOver F₀ F' ∧
    IsLinearlyDisjointOver F F' Favoid

namespace GaloisContext

variable (C : GaloisContext)

/-- `(π, χ)` over `F′` is regular algebraic cuspidal polarized with
`(r_{l,ı}(π), r_{l,ı}(χ)ε_l^{1-n}) ≅ (r|_{G_{F′}}, µ|_{G_{F′⁺}})`. -/
def Realizes {Fp F Fp' F' : NF} [FiniteDimensional ℚ Fp'] [FiniteDimensional ℚ F']
    (hF : F ≤ F') (hFp : Fp ≤ Fp') {l : ℕ} [Fact l.Prime] {n : ℕ} (ι : Iota l)
    (r : GaloisRep F l n) (μ : GaloisChar Fp l) (π : (C.aut F').AutRep n)
    (χ : (C.aut Fp').AutRep 1) : Prop :=
  C.IsRACPolarized π χ ∧ (C.galRep π l ι).Iso (r.res hF) ∧
    C.CharMatches n (C.galRep χ l ι) (μ.res hFp)

/-- Residual version: `r̄_{l,ı}(π) ≅ r̄|_{G_{F′}}` and `r_{l,ı}(χ)ε_l^{1-n} = µ|_{G_{F′⁺}}`. -/
def RealizesResidual {Fp F Fp' F' : NF} [FiniteDimensional ℚ Fp'] [FiniteDimensional ℚ F']
    (hF : F ≤ F') (hFp : Fp ≤ Fp') {l : ℕ} [Fact l.Prime] {n : ℕ} (ι : Iota l)
    (rbar : ResRep (GalF F) l n) (μ : GaloisChar Fp l) (π : (C.aut F').AutRep n)
    (χ : (C.aut Fp').AutRep 1) : Prop :=
  C.IsRACPolarized π χ ∧
    (C.reduce (C.galRep π l ι)).Iso (rbar.restrict (IntermediateField.fixingSubgroup_le hF)) ∧
    C.CharMatches n (C.galRep χ l ι) (μ.res hFp)

/-- `r̄|_{G_{F(ζ_l)}}` is irreducible. -/
def IsIrreducibleOverZeta {F : NF} {l : ℕ} [Fact l.Prime] {n : ℕ} (rbar : ResRep (GalF F) l n) :
    Prop :=
  (rbar.restrict (IntermediateField.fixingSubgroup_le (le_sup_left : F ≤ adjZeta F l))).IsIrreducible

/-- The local lifts `ρ_v` (`v ∈ S`) lift `r̄|_{G_{F_v}}`. -/
def AreLocalLifts {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (rbar : ResRep (GalF F) l n) (S : Finset (C.aut F).Place)
    (ρ : (v : (C.aut F).Place) → Rep (C.decomp v) l n) : Prop :=
  ∀ v ∈ S, (C.reduce (ρ v)).Iso (rbar.restrict (C.decomp_le v))

/-- `r|_{G_{F′_u}} ∼ ρ_v|_{G_{F′_u}}` at every `u | v ∈ S` (optionally only for `v ∤ l`). -/
def ConnectsAt {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'] (hF : F ≤ F')
    {l : ℕ} [Fact l.Prime] {n : ℕ} (r : GaloisRep F' l n) (S : Finset (C.aut F).Place)
    (ρ : (v : (C.aut F).Place) → Rep (C.decomp v) l n) (onlyPrimeToL : Bool) : Prop :=
  ∀ u : (C.aut F').Place, C.under hF u ∈ S → (onlyPrimeToL → C.residueChar u ≠ l) →
    C.Connects (C.restrictAt r u) (Rep.restrict (C.decomp_under hF u) (ρ (C.under hF u)))

/-- `π` over `F′ ⊇ F` is unramified at every place not above `S`. -/
def IsUnramifiedOutside {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F']
    (hF : F ≤ F') {n : ℕ} (π : (C.aut F').AutRep n) (S : Finset (C.aut F).Place) : Prop :=
  ∀ u : (C.aut F').Place, C.under hF u ∉ S → ¬ (C.aut F').IsArchimedean u →
    (C.aut F').IsUnramifiedAt π u

end GaloisContext

open GaloisContext

/-- `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy` (ML.2/potential-ordinary-automorphy,
BLGGT Proposition 3.3.1). For finitely many `i ∈ I`: `l_i` odd with `ζ_{l_i} ∉ F`, `µ_i` totally odd
de Rham of weight `w_i`, `(r̄_i, µ̄_i)` polarized with `r̄_i|_{G_{F(ζ_{l_i})}}` irreducible and
`l_i ≥ 2(d_i + 1)`, sets `H_{i,τ}` of `n_i` integers with `H_{i,τ∘c} = w_i - H_{i,τ}`, a
`c`-stable `S` containing the places above `l_i` and the ramification of `r̄_i`, polarized local lifts
`ρ_{i,v}` (`v ∈ S`, `v ∤ l_i`); then over some `F′` there are `ı_i`-ordinary `(π_i, χ_i)` realizing
`(r̄_i, µ_i)`, unramified above `l_i` and outside `S`, with `HT_τ = H_{i,τ|_F}` and the prescribed
local components up to `∼`. -/
theorem potential_ordinary_automorphy (C : GaloisContext) {F₀ Fp F Favoid : NF}
    [FiniteDimensional ℚ F₀] [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F]
    [FiniteDimensional ℚ Favoid] (hCM : IsCMWithPlus Fp F) (hCM₀ : ∃ F₀p, IsCMWithPlus F₀p F₀)
    (hgal : IsGaloisOver F₀ F) (havoid : IsGaloisOver F Favoid)
    (cF : F →+* F) (hcF : ∀ x : F, cF x = x ↔ (x : Qbar) ∈ Fp)
    {I : Type} [Fintype I] (l : I → ℕ) [∀ i, Fact (l i).Prime] (ι : ∀ i, Iota (l i))
    (n : I → ℕ) (w : I → ℤ) (μ : ∀ i, GaloisChar Fp (l i))
    (rbar : ∀ i, ResRep (GalF F) (l i) (n i))
    (H : ∀ i, (F →+* PadicAlgCl (l i)) → Finset ℤ)
    (S : Finset (C.aut F).Place) (ρ : ∀ i, (v : (C.aut F).Place) → Rep (C.decomp v) (l i) (n i))
    (hl : ∀ i, Odd (l i) ∧ ZetaNotIn F (l i) ∧
      2 * (C.sylowConstituentDim (rbar i) + 1) ≤ l i)
    (hμ : ∀ i, C.IsTotallyOddChar (μ i) ∧ C.IsDeRhamOfWeight (μ i) (w i))
    (hr : ∀ i, (rbar i).IsIrreducible ∧ C.IsPolarizedResidual (rbar i) (μ i) ∧
      IsIrreducibleOverZeta (rbar i))
    (hH : ∀ i τ, (H i τ).card = n i ∧ H i (τ.comp cF) = (H i τ).image (fun h => w i - h))
    (hS : ∀ v ∈ S, C.conjPlace v ∈ S)
    (hSl : ∀ i v, C.residueChar v = l i → v ∈ S)
    (hSram : ∀ i v, ¬ (C.aut F).IsArchimedean v → v ∉ S → C.IsUnramifiedAtRes (rbar i) v)
    (hρ : ∀ i, C.AreLocalLifts (rbar i) (S.filter (fun v => C.residueChar v ≠ l i)) (ρ i) ∧
      C.IsPolarizedLocalFamily (μ i) (S.filter (fun v => C.residueChar v ≠ l i)) (ρ i)) :
    ∃ (Fp' F' : NF) (_ : FiniteDimensional ℚ Fp') (_ : FiniteDimensional ℚ F')
      (h : IsGoodCMExtension F₀ Fp F Favoid Fp' F'),
      ∀ i, ∃ (π : (C.aut F').AutRep (n i)) (χ : (C.aut Fp').AutRep 1),
        C.RealizesResidual h.2.1 h.2.2.1 (ι i) (rbar i) (μ i) π χ ∧
        C.IsUnramifiedAbove π (l i) ∧ C.IsUnramifiedOutside h.2.1 π S ∧
        C.IsOrdinaryAut π (l i) (ι i) ∧
        (∀ τ' : F' →+* PadicAlgCl (l i),
          C.HT τ' (C.restrictAt (C.galRep π (l i) (ι i)) (C.placeOfEmb τ')) =
            (H i (τ'.comp (IntermediateField.inclusion h.2.1).toRingHom)).val) ∧
        C.ConnectsAt h.2.1 (C.galRep π (l i) (ι i)) S (ρ i) true := by
  sorry

/-- `TauCeti.PotentialAutomorphy.exists_pd_lift` (ML.2/pd-lifts-with-local-conditions, BLGGT
Theorem 4.3.1), stated for `r̄ : G_F → GL_n(F̄_l)` with `(r̄, µ̄)` polarized (the `G_n`-valued
`r̄ : G_{F⁺} → G_n(F̄_l)` with `ν ∘ r̄ = µ̄` is equivalent data, AG2.0): with `ζ_l ∉ F`, `S` containing
the places above `l` and the ramification, `µ` algebraic, `µ(c_v) = -1`, `r̄|_{G_{F(ζ_l)}}`
irreducible, `l ≥ 2(d + 1)` and lifts `ρ_v` (`v ∈ S`), potentially diagonalizable with distinct
Hodge–Tate numbers above `l`, there is a lift `r` of `r̄`, polarized by `µ`, unramified outside `S`,
with `r|_{G_{F_v}} ∼ ρ_v` for `v ∈ S`.
NOTE: the source's split hypothesis on `S` is kept as `hsplit` (each `v ∈ S` has `cv ≠ v`). -/
theorem exists_pd_lift (C : GaloisContext) {Fp F : NF} [FiniteDimensional ℚ Fp]
    [FiniteDimensional ℚ F] (hCM : IsCMWithPlus Fp F) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (hζ : ZetaNotIn F l) (S : Finset (C.aut F).Place)
    (hsplit : ∀ v ∈ S, C.conjPlace v ≠ v ∧ C.conjPlace v ∈ S)
    (hSl : ∀ v, C.residueChar v = l → v ∈ S)
    (μ : GaloisChar Fp l) (hμ : (∀ v, C.residueChar v = l → C.IsDeRham (C.restrictAt μ v)) ∧
      C.IsTotallyOddChar μ)
    (rbar : ResRep (GalF F) l n) (hpol : C.IsPolarizedResidual rbar μ)
    (hram : ∀ v, ¬ (C.aut F).IsArchimedean v → v ∉ S → C.IsUnramifiedAtRes rbar v)
    (ρ : (v : (C.aut F).Place) → Rep (C.decomp v) l n) (hρ : C.AreLocalLifts rbar S ρ)
    (hirr : IsIrreducibleOverZeta rbar) (hl : 2 * (C.sylowConstituentDim rbar + 1) ≤ l)
    (hpd : ∀ v ∈ S, C.residueChar v = l → C.IsPotDiag (ρ v) ∧ C.HasDistinctHT (ρ v)) :
    ∃ r : GaloisRep F l n, (C.reduce r).Iso rbar ∧ C.IsPolarized r μ ∧
      (∀ v, ¬ (C.aut F).IsArchimedean v → v ∉ S → C.IsUnramifiedAt r v) ∧
      ∀ v ∈ S, C.Connects (C.restrictAt r v) (ρ v) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.change_of_weight_and_level` (ML.2/change-of-weight-and-level,
BLGGT Theorem 4.4.1): `F` imaginary CM, `l > 2(n + 1)`, `ζ_l ∉ F`, places above `l` split over `F⁺`,
`(r̄, µ̄)` polarized, unramified outside `S`, ordinarily or potentially diagonalizably automorphic,
`r̄|_{G_{F(ζ_l)}}` irreducible, `ρ_v` lifts of `r̄|_{G_{F_v}}` (E3), potentially diagonalizable with
distinct Hodge–Tate numbers above `l`: there is a regular algebraic cuspidal polarized `(π, χ)` over
`F` realizing `(r̄, µ)`, of level potentially prime to `l`, unramified outside `S`, with
`ρ_v ∼ r_{l,ı}(π)|_{G_{F_v}}` for `v ∈ S`. -/
theorem change_of_weight_and_level (C : GaloisContext) {Fp F : NF} [FiniteDimensional ℚ Fp]
    [FiniteDimensional ℚ F] (hCM : IsCMWithPlus Fp F) {l : ℕ} [Fact l.Prime] (ι : Iota l)
    {n : ℕ} (hl : 2 * (n + 1) < l) (hζ : ZetaNotIn F l) (S : Finset (C.aut F).Place)
    (hsplit : ∀ v ∈ S, C.conjPlace v ≠ v ∧ C.conjPlace v ∈ S)
    (hSl : ∀ v, C.residueChar v = l → v ∈ S)
    (μ : GaloisChar Fp l) (hμ : ∀ v, C.residueChar v = l → C.IsDeRham (C.restrictAt μ v))
    (rbar : ResRep (GalF F) l n) (hpol : C.IsPolarizedResidual rbar μ)
    (hram : ∀ v, ¬ (C.aut F).IsArchimedean v → v ∉ S → C.IsUnramifiedAtRes rbar v)
    (haut : C.IsOrdAutomorphicResidual rbar μ ∨ C.IsPDAutomorphicResidual rbar μ)
    (hirr : IsIrreducibleOverZeta rbar)
    (ρ : (v : (C.aut F).Place) → Rep (C.decomp v) l n) (hρ : C.AreLocalLifts rbar S ρ)
    (hpd : ∀ v ∈ S, C.residueChar v = l → C.IsPotDiag (ρ v) ∧ C.HasDistinctHT (ρ v)) :
    ∃ (π : (C.aut F).AutRep n) (χ : (C.aut Fp).AutRep 1),
      C.RealizesResidual le_rfl le_rfl ι rbar μ π χ ∧ C.HasLevelPotPrimeTo π l ι ∧
      C.IsUnramifiedOutside le_rfl π S ∧ C.ConnectsAt le_rfl (C.galRep π l ι) S ρ false := by
  sorry

/-- `TauCeti.PotentialAutomorphy.potential_automorphy` (ML.2/potential-automorphy-theorem, BLGGT
Theorem 4.5.1): for finitely many totally odd, regular algebraic, polarized `l_i`-adic `(r_i, µ_i)`
of `G_F`, `l_i ≥ 2(d_i + 1)` odd with `ζ_{l_i} ∉ F`, `r_i` potentially diagonalizable at each place of
`F` above `l_i` (E2) and `r̄_i|_{G_{F(ζ_{l_i})}}` irreducible, there are `F′` (CM, Galois over `F₀`,
linearly disjoint from `F^{(avoid)}`) and `(π_i, χ_i)` over `F′`, unramified above `l_i`, realizing
`(r_i|_{G_{F′}}, µ_i|_{G_{F′⁺}})`. -/
theorem potential_automorphy (C : GaloisContext) {F₀ Fp F Favoid : NF}
    [FiniteDimensional ℚ F₀] [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F]
    [FiniteDimensional ℚ Favoid] (hCM : IsCMWithPlus Fp F) (hCM₀ : ∃ F₀p, IsCMWithPlus F₀p F₀)
    (hgal : IsGaloisOver F₀ F) (havoid : IsGaloisOver F Favoid)
    {I : Type} [Fintype I] (l : I → ℕ) [∀ i, Fact (l i).Prime] (ι : ∀ i, Iota (l i))
    (n : I → ℕ) (r : ∀ i, GaloisRep F (l i) (n i)) (μ : ∀ i, GaloisChar Fp (l i))
    (hn : ∀ i, 1 ≤ n i)
    (hl : ∀ i, Odd (l i) ∧ ZetaNotIn F (l i) ∧
      2 * (C.sylowConstituentDim (C.reduce (r i)) + 1) ≤ l i)
    (hr : ∀ i, C.IsPolarized (r i) (μ i) ∧ C.IsTotallyOddChar (μ i) ∧
      C.IsRegularAlgebraic (r i) ∧ C.IsPotDiagAbove (r i) ∧
      IsIrreducibleOverZeta (C.reduce (r i))) :
    ∃ (Fp' F' : NF) (_ : FiniteDimensional ℚ Fp') (_ : FiniteDimensional ℚ F')
      (h : IsGoodCMExtension F₀ Fp F Favoid Fp' F'),
      ∀ i, ∃ (π : (C.aut F').AutRep (n i)) (χ : (C.aut Fp').AutRep 1),
        C.Realizes h.2.1 h.2.2.1 (ι i) (r i) (μ i) π χ ∧ C.IsUnramifiedAbove π (l i) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal`
(ML.2/potential-automorphy-totally-real, BLGGT Corollary 4.5.2): over a totally real `F⁺`, with
`l ≥ 2(n + 1)`, a totally odd regular algebraic polarized `(r, µ)` (here `F = F⁺`), potentially
diagonalizable above `l` with `r̄|_{G_{F⁺(ζ_l)}}` irreducible, becomes automorphic of level prime to
`l` over a totally real Galois `F^{+,′}/F⁺`. -/
theorem potential_automorphy_totallyReal (C : GaloisContext) {Fp : NF} [FiniteDimensional ℚ Fp]
    (hFp : IsTotallyRealNF Fp) {l : ℕ} [Fact l.Prime] {n : ℕ} (hl : 2 * (n + 1) ≤ l)
    (r : GaloisRep Fp l n) (μ : GaloisChar Fp l)
    (hr : C.IsPolarized r μ ∧ C.IsTotallyOddChar μ ∧ C.IsRegularAlgebraic r ∧
      C.IsPotDiagAbove r ∧ IsIrreducibleOverZeta (C.reduce r)) :
    ∃ (Fp' : NF) (_ : FiniteDimensional ℚ Fp') (h : Fp ≤ Fp'), IsTotallyRealNF Fp' ∧
      IsGaloisOver Fp Fp' ∧ C.IsAutomorphicPairPrimeTo (r.res h) (μ.res h) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.potential_automorphy_residual` (ML.2/potential-automorphy-mod-l,
BLGGT Corollary 4.5.3, read with E2): for `r̄_i` irreducible with `(r̄_i, µ_i)` polarized (`µ_i` totally
odd de Rham), `r̄_i|_{G_{F(ζ_{l_i})}}` irreducible, a `c`-stable `S` containing the places above `l_i`
and the ramification, and polarized local lifts `ρ_{i,v}` (`v ∈ S`), potentially diagonalizable with
`n_i` distinct Hodge–Tate numbers above `l_i`: over some `F′` as in 4.5.1 there are `(π_i, χ_i)`
realizing `(r̄_i, µ_i)`, of level potentially prime to `l_i`, unramified outside `S`, with
`r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}}` for `u | v ∈ S`. -/
theorem potential_automorphy_residual (C : GaloisContext) {F₀ Fp F Favoid : NF}
    [FiniteDimensional ℚ F₀] [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F]
    [FiniteDimensional ℚ Favoid] (hCM : IsCMWithPlus Fp F) (hCM₀ : ∃ F₀p, IsCMWithPlus F₀p F₀)
    (hgal : IsGaloisOver F₀ F) (havoid : IsGaloisOver F Favoid)
    {I : Type} [Fintype I] (l : I → ℕ) [∀ i, Fact (l i).Prime] (ι : ∀ i, Iota (l i))
    (n : I → ℕ) (μ : ∀ i, GaloisChar Fp (l i)) (rbar : ∀ i, ResRep (GalF F) (l i) (n i))
    (S : Finset (C.aut F).Place) (ρ : ∀ i, (v : (C.aut F).Place) → Rep (C.decomp v) (l i) (n i))
    (hl : ∀ i, Odd (l i) ∧ ZetaNotIn F (l i) ∧
      2 * (C.sylowConstituentDim (rbar i) + 1) ≤ l i)
    (hμ : ∀ i, C.IsTotallyOddChar (μ i) ∧
      ∀ v, C.residueChar v = l i → C.IsDeRham (C.restrictAt (μ i) v))
    (hr : ∀ i, (rbar i).IsIrreducible ∧ C.IsPolarizedResidual (rbar i) (μ i) ∧
      IsIrreducibleOverZeta (rbar i))
    (hS : ∀ v ∈ S, C.conjPlace v ∈ S) (hSl : ∀ i v, C.residueChar v = l i → v ∈ S)
    (hSram : ∀ i v, ¬ (C.aut F).IsArchimedean v → v ∉ S → C.IsUnramifiedAtRes (rbar i) v)
    (hρ : ∀ i, C.AreLocalLifts (rbar i) S (ρ i) ∧ C.IsPolarizedLocalFamily (μ i) S (ρ i))
    (hpd : ∀ i, ∀ v ∈ S, C.residueChar v = l i → C.IsPotDiag (ρ i v) ∧ C.HasDistinctHT (ρ i v)) :
    ∃ (Fp' F' : NF) (_ : FiniteDimensional ℚ Fp') (_ : FiniteDimensional ℚ F')
      (h : IsGoodCMExtension F₀ Fp F Favoid Fp' F'),
      ∀ i, ∃ (π : (C.aut F').AutRep (n i)) (χ : (C.aut Fp').AutRep 1),
        C.RealizesResidual h.2.1 h.2.2.1 (ι i) (rbar i) (μ i) π χ ∧
        C.HasLevelPotPrimeTo π (l i) (ι i) ∧ C.IsUnramifiedOutside h.2.1 π S ∧
        C.ConnectsAt h.2.1 (C.galRep π (l i) (ι i)) S (ρ i) false := by
  sorry

namespace GaloisContext

variable (C : GaloisContext)

/-- `(ℛ, ℳ)` is polarized: every member pair `(r_λ, µ_λ)` is polarized (R24.5 convention). -/
def IsPolarizedSys {Fp F : NF} [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] {M : Type}
    [Field M] [NumberField M] {n : ℕ} (R : C.System F M n) (Mu : C.System Fp M 1) : Prop :=
  ∀ (l : ℕ) (_ : Fact l.Prime) (lam : M →+* PadicAlgCl l),
    C.IsPolarized (C.member R l lam) (C.member Mu l lam)

/-- `(ℛ, ℳ)` is totally odd: every `µ_λ` is totally odd. -/
def IsTotallyOddSys {Fp : NF} [FiniteDimensional ℚ Fp] {M : Type} [Field M] [NumberField M]
    (Mu : C.System Fp M 1) : Prop :=
  ∀ (l : ℕ) (_ : Fact l.Prime) (lam : M →+* PadicAlgCl l), C.IsTotallyOddChar (C.member Mu l lam)

end GaloisContext

/-- `F` is CM with `F⁺ = Fp`, or `F = Fp` is totally real. -/
def IsCMOrTotallyReal (Fp F : NF) : Prop := IsCMWithPlus Fp F ∨ (IsTotallyRealNF F ∧ Fp = F)

/-- `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem`
(ML.2/compatible-systems-potentially-automorphic, BLGGT Theorem 5.4.1 and Corollary 5.4.2): totally
odd polarized weakly compatible systems `(ℛ_i, ℳ_i)` of `G_F`, each `ℛ_i` regular and irreducible,
become automorphic over a finite `F′/F` of the same type (CM, resp. totally real), Galois over `F₀`
and linearly disjoint from `F^{(avoid)}`. Corollary 5.4.2 is the case of one system. -/
theorem potential_automorphy_compatibleSystem (C : GaloisContext) {F₀ Fp F Favoid : NF}
    [FiniteDimensional ℚ F₀] [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F]
    [FiniteDimensional ℚ Favoid] (hF : IsCMOrTotallyReal Fp F)
    (hgal : IsGaloisOver F₀ F) (havoid : IsGaloisOver F Favoid)
    {M : Type} [Field M] [NumberField M] {k : ℕ} (n : Fin k → ℕ)
    (R : ∀ i, C.System F M (n i)) (Mu : Fin k → C.System Fp M 1)
    (hR : ∀ i, C.IsPolarizedSys (R i) (Mu i) ∧ C.IsTotallyOddSys (Mu i) ∧
      C.IsRegularSys (R i) ∧ C.IsIrreducibleSys (R i)) :
    ∃ (Fp' F' : NF) (_ : FiniteDimensional ℚ Fp') (_ : FiniteDimensional ℚ F') (hF' : F ≤ F')
      (hFp' : Fp ≤ Fp'), IsCMOrTotallyReal Fp' F' ∧
      ((IsTotallyRealNF F) → IsTotallyRealNF F') ∧ IsGaloisOver F₀ F' ∧
      IsLinearlyDisjointOver F F' Favoid ∧
      ∀ i, C.IsAutomorphicSys (C.sysRes hF' (R i)) (C.sysRes hFp' (Mu i)) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.lFunction_meromorphic`
(ML.2/compatible-system-l-function-continuation, BLGGT Corollary 5.4.3): under the hypotheses of
Corollary 5.4.2, (1) `L^S(ıℛ, s)` is the absolutely convergent Euler product over `v ∉ S` on a right
half plane and continues meromorphically to `ℂ`; (2) `ℛ` is strictly pure and
`Λ(ıℛ, s) = ε(ıℛ, s) Λ(ıℛ^∨, 1 - s)`; (3) if `F` is totally real and `n` odd, `tr r_λ(c_v) = ±1` is
independent of `λ` at each archimedean `v`. -/
theorem lFunction_meromorphic (C : GaloisContext) {Fp F : NF} [FiniteDimensional ℚ Fp]
    [FiniteDimensional ℚ F] (hF : IsCMOrTotallyReal Fp F) {M : Type} [Field M] [NumberField M]
    {n : ℕ} (R : C.System F M n) (Mu : C.System Fp M 1)
    (hR : C.IsPolarizedSys R Mu ∧ C.IsTotallyOddSys Mu ∧ C.IsRegularSys R ∧ C.IsIrreducibleSys R)
    (ι : M →+* ℂ) (S : Finset (C.aut F).Place) :
    (∃ σ₀ : ℝ, (∀ s : ℂ, σ₀ < s.re →
        HasProd (fun v : {v : (C.aut F).Place // v ∉ S ∧ ¬ (C.aut F).IsArchimedean v} =>
          C.sysLocalL R ι v.1 s) (C.sysL R ι S s)) ∧
      ∃ g : ℂ → ℂ, MeromorphicOn g Set.univ ∧ ∀ s : ℂ, σ₀ < s.re → C.sysL R ι S s = g s) ∧
    (C.IsStrictlyPureSys R ∧ ∀ s : ℂ,
      C.sysCompletedL R ι s = C.sysEpsilon R ι s * C.sysCompletedL (C.dualSys R) ι (1 - s)) ∧
    (IsTotallyRealNF F → Odd n → ∀ v : (C.aut F).Place, (C.aut F).IsArchimedean v →
      ∃ e : ℤ, (e = 1 ∨ e = -1) ∧ ∀ (l : ℕ) (_ : Fact l.Prime) (lam : M →+* PadicAlgCl l),
        Matrix.trace ((C.member R l lam ⟨C.complexConj v, C.decomp_le v (C.complexConj_mem v)⟩ :
          GLQl l n) : Matrix (Fin n) (Fin n) (PadicAlgCl l)) = (e : PadicAlgCl l)) := by
  sorry

/-- Supplier operations on Galois representations, L-parameters and modular forms used by ML.2
applications (owners: PotentialModularityAndCompatibleSystems R24.5/linear-algebra-operations-on-
systems and R24.5/galois-grothendieck-ring for sums; local Langlands ET.6/AF.1 for parameter
operations; AutomorphicLFunctionsAndLocalFactors for Rankin–Selberg products;
GL2AutomorphicRepresentationsAndTransfer for CM and weights of `GL₂` forms). -/
structure Ops (C : GaloisContext) where
  /-- `r ≅ r_1 ⊕ ⋯ ⊕ r_j`. -/
  IsSumRep : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n →
    List (Σ m : ℕ, Rep H l m) → Prop
  /-- Tensor product of `s` two-dimensional L-parameters at `v`. -/
  tensorParam : ∀ {F : NF} [FiniteDimensional ℚ F] {v : (C.aut F).Place} {s : ℕ},
    (Fin s → (C.aut F).LParam v 2) → (C.aut F).LParam v (2 ^ s)
  /-- Twist of an L-parameter by `|·|^t`. -/
  twistParam : ∀ {F : NF} [FiniteDimensional ℚ F] {v : (C.aut F).Place} {n : ℕ},
    (C.aut F).LParam v n → ℝ → (C.aut F).LParam v n
  /-- Restriction of an L-parameter of `W_{F_v}` to `W_{F′_u}`, `u | v`. -/
  restrictParam : ∀ {F F' : NF} [FiniteDimensional ℚ F] [FiniteDimensional ℚ F'] (h : F ≤ F')
    (u : (C.aut F').Place) {n : ℕ}, (C.aut F).LParam (C.under h u) n → (C.aut F').LParam u n
  /-- The finite Rankin–Selberg L-function `L(×_k π_k, s)` of `GL₂(𝔸_ℚ)`-representations. -/
  tensorL : ∀ {s : ℕ}, (Fin s → (C.aut ⊥).AutRep 2) → ℂ → ℂ
  /-- `π` on `GL₂(𝔸_ℚ)` comes from a newform without CM, of weight `formWeight π`. -/
  IsNonCM : (C.aut ⊥).AutRep 2 → Prop
  formWeight : (C.aut ⊥).AutRep 2 → ℕ
  /-- `π` is regular algebraic of extremely regular weight (owner: AG2.0, BLGGT §5.1). -/
  IsExtremelyRegularAut : ∀ {F : NF} [FiniteDimensional ℚ F] {n : ℕ}, (C.aut F).AutRep n → Prop

/-- `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic` (ML.2/multiple-product-l-functions,
BLGGT Corollary 5.4.4): if the `2^{#K}` partial sums of `K ⊆ ℤ_{>0}` are distinct and `f_k`
(`k ∈ K`) are non-CM newforms of weight `k + 1` with automorphic `π_k`, there are a totally real
Galois `F/ℚ` and a regular algebraic polarizable cuspidal `Π` of `GL_{2^{#K}}(𝔸_F)` with
`rec(Π_v|det|^{(1-2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{-1/2}))|_{W_{F_v}}` for almost all `v`; and
`L(×_k π_k, s)` continues meromorphically to `ℂ`. -/
theorem multipleProduct_meromorphic (C : GaloisContext) (O : Ops C) (K : Finset ℕ)
    (hK0 : ∀ k ∈ K, 0 < k) (hK : (K.powerset.image (fun s => s.sum id)).card = 2 ^ K.card)
    (π : Fin K.card → (C.aut ⊥).AutRep 2)
    (hπ : ∀ i, (C.aut ⊥).IsCuspidal (π i) ∧ O.IsNonCM (π i) ∧
      O.formWeight (π i) = (K.equivFin.symm i : ℕ) + 1) :
    (∃ (F : NF) (_ : FiniteDimensional ℚ F) (PiF : (C.aut F).AutRep (2 ^ K.card)),
      IsTotallyRealNF F ∧ IsGaloisOver ⊥ F ∧ (C.aut F).IsCuspidal PiF ∧
      (C.aut F).IsRegularAlgebraic PiF ∧ (∃ χ : (C.aut F).AutRep 1, C.IsPolarizedAut PiF χ) ∧
      ∃ T : Finset (C.aut F).Place, ∀ u ∉ T,
        O.twistParam ((C.aut F).localParam PiF u) ((1 - (2 : ℝ) ^ K.card) / 2) =
          O.restrictParam bot_le u
            (O.tensorParam fun i => O.twistParam ((C.aut ⊥).localParam (π i) _) (-1 / 2))) ∧
    ∃ g : ℂ → ℂ, MeromorphicOn g Set.univ ∧ ∃ σ₀ : ℝ, ∀ s : ℂ, σ₀ < s.re → O.tensorL π s = g s := by
  sorry

/-- `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic`
(ML.2/constituents-potentially-automorphic, BLGGT Proposition 5.4.6): for `F` CM and `(ℛ, ℳ)` totally
odd polarized with `ℛ` pure and extremely regular, there is a set `L` of rational primes of Dirichlet
density one such that for `λ | l ∈ L` and a decomposition `r_λ = ⊕_α r_{λ,α}` into irreducibles there
is a finite CM Galois `F′/F` with every `(r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{F′⁺}})` irreducible and
automorphic. -/
theorem constituents_potentially_automorphic (C : GaloisContext) (O : Ops C) {Fp F : NF}
    [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] (hF : IsCMWithPlus Fp F) {M : Type}
    [Field M] [NumberField M] {n : ℕ} (R : C.System F M n) (Mu : C.System Fp M 1)
    (hR : C.IsPolarizedSys R Mu ∧ C.IsTotallyOddSys Mu ∧ C.IsPureSys R ∧
      C.IsExtremelyRegularSys R) :
    ∃ L : Set ℕ, HasDirichletDensityOne L ∧ ∀ l ∈ L, ∀ (_ : Fact l.Prime)
      (lam : M →+* PadicAlgCl l) (parts : List (Σ m : ℕ, GaloisRep F l m)),
      O.IsSumRep (C.member R l lam) parts → (∀ x ∈ parts, x.2.IsIrreducible) →
      ∃ (Fp' F' : NF) (_ : FiniteDimensional ℚ Fp') (_ : FiniteDimensional ℚ F') (hF' : F ≤ F')
        (hFp' : Fp ≤ Fp'), IsCMWithPlus Fp' F' ∧ IsGaloisOver F F' ∧
        ∀ x ∈ parts, (x.2.res hF').IsIrreducible ∧
          C.IsAutomorphicPair (x.2.res hF') ((C.member Mu l lam).res hFp') := by
  sorry

/-- `TauCeti.PotentialAutomorphy.exists_compatibleSystem` (ML.2/part-of-compatible-system, BLGGT
Theorem 5.5.1): for `F` CM, `l ≥ 2(n + 1)`, `ζ_l ∉ F` and a totally odd regular algebraic polarized
`(r, µ)`, potentially diagonalizable above `l` with `r̄|_{G_{F(ζ_l)}}` irreducible, `r` is a member of a
strictly pure compatible system of `G_F`. -/
theorem exists_compatibleSystem (C : GaloisContext) {Fp F : NF} [FiniteDimensional ℚ Fp]
    [FiniteDimensional ℚ F] (hF : IsCMWithPlus Fp F) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (hl : 2 * (n + 1) ≤ l) (hζ : ZetaNotIn F l) (r : GaloisRep F l n) (μ : GaloisChar Fp l)
    (hr : C.IsPolarized r μ ∧ C.IsTotallyOddChar μ ∧ C.IsRegularAlgebraic r ∧
      C.IsPotDiagAbove r ∧ IsIrreducibleOverZeta (C.reduce r)) :
    ∃ (M : Type) (_ : Field M) (_ : NumberField M) (R : C.System F M n)
      (lam : M →+* PadicAlgCl l), (C.member R l lam).Iso r ∧ C.IsStrictlyPureSys R := by
  sorry

/-- `TauCeti.PotentialAutomorphy.irreducible_density_one` (ML.2/irreducibility-density-one, BLGGT
Theorem 5.5.2): for `F` CM and `π` regular algebraic, polarizable, cuspidal of extremely regular
weight, `r_{l,ı}(π)` is irreducible for all `l` in a set of Dirichlet density one and all `ı`. -/
theorem irreducible_density_one (C : GaloisContext) (O : Ops C) {Fp F : NF}
    [FiniteDimensional ℚ Fp] [FiniteDimensional ℚ F] (hF : IsCMWithPlus Fp F) {n : ℕ}
    (π : (C.aut F).AutRep n)
    (hπ : (C.aut F).IsCuspidal π ∧ (C.aut F).IsRegularAlgebraic π ∧
      (∃ χ : (C.aut Fp).AutRep 1, C.IsPolarizedAut π χ) ∧ O.IsExtremelyRegularAut π) :
    ∃ L : Set ℕ, HasDirichletDensityOne L ∧
      ∀ l ∈ L, ∀ (_ : Fact l.Prime) (ι : Iota l), (C.galRep π l ι).IsIrreducible := by
  sorry

/-- `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems`
(ML.2/decomposition-into-irreducible-systems, BLGGT Theorem 5.5.3): for `F` CM, a pure, extremely
regular, totally odd, polarizable weakly compatible system `ℛ` is a direct sum `ℛ_1 ⊕ ⋯ ⊕ ℛ_s` of
irreducible, strictly pure, totally odd, polarizable compatible systems. -/
theorem eq_sum_irreducible_systems (C : GaloisContext) {Fp F : NF} [FiniteDimensional ℚ Fp]
    [FiniteDimensional ℚ F] (hF : IsCMWithPlus Fp F) {M : Type} [Field M] [NumberField M] {n : ℕ}
    (R : C.System F M n) (Mu : C.System Fp M 1)
    (hR : C.IsPolarizedSys R Mu ∧ C.IsTotallyOddSys Mu ∧ C.IsPureSys R ∧
      C.IsExtremelyRegularSys R) :
    ∃ parts : List (Σ m : ℕ, C.System F M m), C.IsSumOf R parts ∧
      ∀ x ∈ parts, C.IsIrreducibleSys x.2 ∧ C.IsStrictlyPureSys x.2 ∧
        ∃ Mx : C.System Fp M 1, C.IsPolarizedSys x.2 Mx ∧ C.IsTotallyOddSys Mx := by
  sorry

end PotentialAutomorphy

end TauCeti

namespace TauCeti

namespace SymmetricPower

open PotentialAutomorphy PotentialAutomorphy.GaloisContext

/-- A smooth character `ℚ_p^× → ℂ^×` (open kernel). -/
abbrev LocChar (p : ℕ) [Fact p.Prime] : Type :=
  {χ : ℚ_[p]ˣ →* ℂˣ // IsOpen (χ.ker : Set ℚ_[p]ˣ)}

/-- The image of `p` in `ℚ_p^×`. -/
def uniformizer (p : ℕ) [Fact p.Prime] : ℚ_[p]ˣ :=
  Units.mk0 (p : ℚ_[p]) (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero)

/-- `χ` is unramified: trivial on `ℤ_p^×`. -/
def LocChar.IsUnramified {p : ℕ} [Fact p.Prime] (χ : LocChar p) : Prop :=
  ∀ u : ℤ_[p]ˣ, χ.1 (Units.map (PadicInt.Coe.ringHom : ℤ_[p] →+* ℚ_[p]).toMonoidHom u) = 1

/-- Supplier data for ML.3 over `ℚ = ⊥ ⊆ Q̄` and the CM/totally real fields used (owners:
local Langlands for `GL_n` ET.6/AF.1 for `Sym^{n-1}` of parameters; GL2AutomorphicRepresentationsAnd-
Transfer R17.5 for Jacquet modules, CM forms, weights, automorphic induction and the Gelbart–Jacquet
lift; PotentialModularityAndCompatibleSystems R24.5 for `Sym^{n-1}` of Galois representations;
PadicFamilies L2 for eigencurves; AutomorphicLFunctionsAndLocalFactors AL.2/AL.3 for L-functions of
elliptic curves). -/
structure SymContext (C : GaloisContext) where
  /-- `Sym^{n-1} ∘ rec`: the `n`-dimensional parameter `Sym^{n-1}(φ)` of a two-dimensional `φ`. -/
  symParam : ∀ {v : (C.aut ⊥).Place}, (C.aut ⊥).LParam v 2 → (n : ℕ) → (C.aut ⊥).LParam v n
  /-- `Sym^{n-1} r` of a two-dimensional `l`-adic representation (any closed `H ⊆ G_ℚ`). -/
  symRep : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime], Rep H l 2 → (n : ℕ) → Rep H l n
  /-- The place of `ℚ` at a prime `p`. -/
  placeOfPrime : ℕ → (C.aut ⊥).Place
  /-- The pairs `(χ₁, χ₂)` of smooth characters of `T₂(ℚ_p)` occurring as subquotients of the
  normalised Jacquet module of `π_p`. -/
  jacquet : (C.aut ⊥).AutRep 2 → (p : ℕ) → [Fact p.Prime] → Set (LocChar p × LocChar p)
  /-- `π_p` supercuspidal; `π_v` an (unramified) twist of Steinberg, over any `F`. -/
  IsSupercuspidalAt : (C.aut ⊥).AutRep 2 → ℕ → Prop
  IsSteinbergTwistAt : ∀ {F : NF} [FiniteDimensional ℚ F] {n : ℕ}, (C.aut F).AutRep n →
    (C.aut F).Place → Prop
  IsUnramSteinbergTwistAt : ∀ {F : NF} [FiniteDimensional ℚ F] {n : ℕ}, (C.aut F).AutRep n →
    (C.aut F).Place → Prop
  /-- Satake parameters `{α, β}` of an unramified `π_p`. -/
  satake : (C.aut ⊥).AutRep 2 → ℕ → ℂˣ × ℂˣ
  /-- `π` has CM; `π` has weight `k` (parallel weight over totally real `F`); `π_∞` is a holomorphic
  limit of discrete series (weight one). -/
  IsCM : ∀ {F : NF} [FiniteDimensional ℚ F], (C.aut F).AutRep 2 → Prop
  weight : ∀ {F : NF} [FiniteDimensional ℚ F], (C.aut F).AutRep 2 → ℕ
  IsWeightOne : (C.aut ⊥).AutRep 2 → Prop
  /-- The Gelbart–Jacquet adjoint lift `Ad(π)` to `GL₃`. -/
  adjointLift : (C.aut ⊥).AutRep 2 → (C.aut ⊥).AutRep 3
  /-- Automorphic induction `AI_K^ℚ(ψ)` from a quadratic `K`. -/
  autInd : ∀ (K : NF) [FiniteDimensional ℚ K], (C.aut K).AutRep 1 → (C.aut ⊥).AutRep 2
  /-- `ψ ↦ ψ²` on Hecke characters of `K`, and the restriction `ψ ↦ ψ|_{𝔸_ℚ^×}`. -/
  heckeSq : ∀ (K : NF) [FiniteDimensional ℚ K], (C.aut K).AutRep 1 → (C.aut K).AutRep 1
  heckeRestrict : ∀ (K : NF) [FiniteDimensional ℚ K], (C.aut K).AutRep 1 → (C.aut ⊥).AutRep 1
  /-- The Coleman–Mazur eigencurve of tame level `N` at `p`, the point of a refined form, and
  "lie on a common irreducible component of `E_{0,ℂ_p}`". -/
  Eigencurve : ℕ → ℕ → Type
  point : ∀ {N p : ℕ} [Fact p.Prime], (C.aut ⊥).AutRep 2 → LocChar p × LocChar p →
    Eigencurve N p
  SameComponent : ∀ {N p : ℕ}, Eigencurve N p → Eigencurve N p → Prop
  /-- Numerically non-critical, resp. ordinary refinements. -/
  IsNumNonCritical : ∀ {p : ℕ} [Fact p.Prime], (C.aut ⊥).AutRep 2 → LocChar p × LocChar p → Prop
  IsOrdinaryRefinement : ∀ {p : ℕ} [Fact p.Prime], (C.aut ⊥).AutRep 2 →
    LocChar p × LocChar p → Prop
  /-- The Zariski closure of `r(H)` contains `SL₂`; `r̄(G_ℚ)` contains a conjugate of `SL₂(F_p)`. -/
  ZariskiContainsSL2 : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime], Rep H l 2 → Prop
  ResImageContainsSL2 : ∀ {l : ℕ} [Fact l.Prime], ResRep (GalF ⊥) l 2 → Prop
  /-- The coordinate `w = χ_u(5) - 1` on `W₀⁺` and the slope `v₂(U₂)` on the 2-adic tame level one
  eigencurve. -/
  wCoord : Eigencurve 1 2 → PadicComplex 2
  slope : Eigencurve 1 2 → ℝ
  /-- `r|_{G_{F_v}}` is ordinary (owner: PL.4). -/
  IsOrdinaryLocal : ∀ {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ}, Rep H l n → Prop
  /-- Elliptic curves over `ℚ`: CM, semistability, good primes, `a_p`, and the completed
  `Λ(Sym^n E, s)`. -/
  HasCM : WeierstrassCurve ℚ → Prop
  IsSemistable : WeierstrassCurve ℚ → Prop
  IsGoodPrime : WeierstrassCurve ℚ → ℕ → Prop
  ap : WeierstrassCurve ℚ → ℕ → ℤ
  completedSymL : WeierstrassCurve ℚ → ℕ → ℂ → ℂ

variable {C : GaloisContext} (S : SymContext C)

/-- `r` is automorphic (ML.2/automorphic-galois-representation): `r ≅ r_{l,ı}(Π)` for a regular
algebraic cuspidal `Π`. -/
def IsAutomorphicRep {F : NF} [FiniteDimensional ℚ F] {l : ℕ} [Fact l.Prime] {n : ℕ}
    (ι : Iota l) (r : GaloisRep F l n) : Prop :=
  ∃ Pi' : (C.aut F).AutRep n, (C.aut F).IsCuspidal Pi' ∧ (C.aut F).IsRegularAlgebraic Pi' ∧
    (C.galRep Pi' l ι).Iso r

/-- `Sym^{n-1} r_{π,ı}` is automorphic. -/
def SymAutomorphic (π : (C.aut ⊥).AutRep 2) (n l : ℕ) [Fact l.Prime] (ι : Iota l) : Prop :=
  IsAutomorphicRep (C := C) ι (S.symRep (C.galRep π l ι) n)

/-- `π` is everywhere unramified (level one). -/
def IsLevelOne (π : (C.aut ⊥).AutRep 2) : Prop :=
  ∀ v, ¬ (C.aut ⊥).IsArchimedean v → (C.aut ⊥).IsUnramifiedAt π v

/-- `TauCeti.SymmetricPower.SymPowerLift` (ML.3/symmetric-power-lifting): a symmetric power lifting
`Sym^{n-1}π` of `π` on `GL₂(𝔸_ℚ)`: `Π` on `GL_n(𝔸_ℚ)` with `rec(Π_v) ≅ Sym^{n-1} ∘ rec(π_v)` at every
place `v`. -/
structure SymPowerLift (π : (C.aut ⊥).AutRep 2) (n : ℕ) where
  /-- The lift `Π`. -/
  lift : (C.aut ⊥).AutRep n
  /-- `rec(Π_v) ≅ Sym^{n-1} ∘ rec(π_v)` for every `v`. -/
  localParam_eq : ∀ v, (C.aut ⊥).localParam lift v = S.symParam ((C.aut ⊥).localParam π v) n

/-- Label of the standard representation for `partialL`. -/
inductive StdLabel : Type
  | std

/-- Label of `Sym^{m}` of the standard representation of `GL₂` for `partialL`. -/
inductive SymLabel (m : ℕ) : Type
  | sym

/-- `TauCeti.SymmetricPower.SymPowerLift.of_galois`: if `Sym^{n-1} r_{π,ı}` is automorphic then
`Sym^{n-1}π` exists, regular algebraic, and cuspidal for non-CM `π`. -/
theorem SymPowerLift.of_galois (π : (C.aut ⊥).AutRep 2) (hπ : (C.aut ⊥).IsCuspidal π ∧
    (C.aut ⊥).IsRegularAlgebraic π) (n l : ℕ) [Fact l.Prime] (ι : Iota l)
    (h : SymAutomorphic S π n l ι) :
    ∃ L : SymPowerLift S π n, (C.aut ⊥).IsRegularAlgebraic L.lift ∧
      (¬ S.IsCM π → (C.aut ⊥).IsCuspidal L.lift) := by
  sorry

/-- `TauCeti.SymmetricPower.SymPowerLift.unique`: the lift is unique (strong multiplicity one). -/
theorem SymPowerLift.unique {π : (C.aut ⊥).AutRep 2} {n : ℕ} (L L' : SymPowerLift S π n) :
    L.lift = L'.lift := by
  sorry

/-- `TauCeti.SymmetricPower.SymPowerLift.twist`: `Sym^{n-1}(π ⊗ χ) = Sym^{n-1}π ⊗ χ^{n-1}`. -/
theorem SymPowerLift.twist {π : (C.aut ⊥).AutRep 2} {n : ℕ} (L : SymPowerLift S π n)
    (χ : (C.aut ⊥).AutRep 1) :
    ∃ L' : SymPowerLift S ((C.aut ⊥).twist π χ) n,
      L'.lift = (fun Pi' => (C.aut ⊥).twist Pi' χ)^[n - 1] L.lift := by
  sorry

/-- `TauCeti.SymmetricPower.SymPowerLift.lFunction`: `L^T(Sym^{n-1}π, s) = L^T(Π, s)`, and it is
entire when `Π` is cuspidal and `n ≥ 2` (Godement–Jacquet), `T ⊇` archimedean places. -/
theorem SymPowerLift.lFunction {π : (C.aut ⊥).AutRep 2} {n : ℕ} (L : SymPowerLift S π n)
    (T : Finset (C.aut ⊥).Place) (hT : ∀ v, (C.aut ⊥).IsArchimedean v → v ∈ T) :
    (C.aut ⊥).partialL π (SymLabel (n - 1)) T = (C.aut ⊥).partialL L.lift StdLabel T ∧
      ((C.aut ⊥).IsCuspidal L.lift → 2 ≤ n →
        Differentiable ℂ ((C.aut ⊥).partialL L.lift StdLabel T)) := by
  sorry

/-- `TauCeti.SymmetricPower.sym1`: `Sym¹π = π`. -/
theorem sym1 (π : (C.aut ⊥).AutRep 2) (hπ : (C.aut ⊥).IsCuspidal π) (L : SymPowerLift S π 2) :
    L.lift = π := by
  sorry

/-- `TauCeti.SymmetricPower.gelbart_jacquet`: `Sym²π = Ad(π) ⊗ ω_π`, the Gelbart–Jacquet lift twisted
by the central character. -/
theorem gelbart_jacquet (π : (C.aut ⊥).AutRep 2) (hπ : (C.aut ⊥).IsCuspidal π)
    (L : SymPowerLift S π 3) :
    L.lift = (C.aut ⊥).twist (S.adjointLift π) ((C.aut ⊥).centralChar π) := by
  sorry

/-- `TauCeti.SymmetricPower.cm_not_cuspidal`: for `π = AI(ψ)` from an imaginary quadratic `K`,
`Sym²π = AI(ψ²) ⊞ ψ|_{𝔸_ℚ^×}`, which is not cuspidal (no `η_K` factor: `η_K` belongs to `Ad(π)`). -/
theorem cm_not_cuspidal (K : NF) [FiniteDimensional ℚ K] (hK : Module.finrank ℚ K = 2 ∧
    NumberField.IsTotallyComplex K) (ψ : (C.aut K).AutRep 1)
    (hπ : (C.aut ⊥).IsCuspidal (S.autInd K ψ)) (L : SymPowerLift S (S.autInd K ψ) 3) :
    L.lift = (C.aut ⊥).isobaricSum (S.autInd K (S.heckeSq K ψ)) (S.heckeRestrict K ψ) ∧
      ¬ (C.aut ⊥).IsCuspidal L.lift := by
  sorry

/-- `TauCeti.SymmetricPower.degenerate_n1`: `Sym⁰π` is the trivial character. -/
theorem degenerate_n1 (π : (C.aut ⊥).AutRep 2) (L : SymPowerLift S π 1) :
    L.lift = (C.aut ⊥).one := by
  sorry

/-- `TauCeti.SymmetricPower.IsAccessibleRefinement` (ML.3/accessible-regular-refinement): a
refinement `χ = (χ₁, χ₂)` of `π_p` (for `π` on `GL₂(𝔸_ℚ)`, `S_p = {p}`) is accessible when it occurs
as a subquotient of the normalised Jacquet module of `π_p`, equivalently `π_p ↪ i_B^{GL₂} χ`. -/
def IsAccessibleRefinement (π : (C.aut ⊥).AutRep 2) (p : ℕ) [Fact p.Prime]
    (χ : LocChar p × LocChar p) : Prop :=
  χ ∈ S.jacquet π p

/-- `TauCeti.SymmetricPower.IsNRegular`: `(χ₁/χ₂)^i ≠ 1` for `1 ≤ i ≤ n - 1`. -/
def IsNRegular {p : ℕ} [Fact p.Prime] (χ : LocChar p × LocChar p) (n : ℕ) : Prop :=
  ∀ i : ℕ, 1 ≤ i → i ≤ n - 1 → (χ.1.1 / χ.2.1) ^ i ≠ 1

/-- `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal`: `π_p` has an accessible refinement
iff it is not supercuspidal. -/
theorem isAccessible_iff_not_supercuspidal (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π) (p : ℕ) [Fact p.Prime] :
    (∃ χ, IsAccessibleRefinement S π p χ) ↔ ¬ S.IsSupercuspidalAt π p := by
  sorry

/-- `TauCeti.SymmetricPower.isNRegular_mono`: `n`-regular implies `m`-regular for `m ≤ n`. -/
theorem isNRegular_mono {p : ℕ} [Fact p.Prime] {χ : LocChar p × LocChar p} {m n : ℕ}
    (h : IsNRegular χ n) (hmn : m ≤ n) : IsNRegular χ m :=
  fun i h1 h2 => h i h1 (le_trans h2 (Nat.sub_le_sub_right hmn 1))

/-- `TauCeti.SymmetricPower.unramified_refinement`: for `π_p` unramified with Satake parameters
`{α, β}` the refinements are unramified with `(χ₁(p), χ₂(p)) = (α, β)` or `(β, α)`, both occur, and
`n`-regularity means `(α/β)^i ≠ 1` for `1 ≤ i < n`. -/
theorem unramified_refinement (π : (C.aut ⊥).AutRep 2) (hπ : (C.aut ⊥).IsCuspidal π)
    (p : ℕ) [Fact p.Prime] (hp : (C.aut ⊥).IsUnramifiedAt π (S.placeOfPrime p)) (n : ℕ) :
    let α := (S.satake π p).1
    let β := (S.satake π p).2
    (∀ χ ∈ S.jacquet π p, χ.1.IsUnramified ∧ χ.2.IsUnramified ∧
      ((χ.1.1 (uniformizer p), χ.2.1 (uniformizer p)) = (α, β) ∨
        (χ.1.1 (uniformizer p), χ.2.1 (uniformizer p)) = (β, α))) ∧
    (∃ χ ∈ S.jacquet π p, (χ.1.1 (uniformizer p), χ.2.1 (uniformizer p)) = (α, β)) ∧
    (∃ χ ∈ S.jacquet π p, (χ.1.1 (uniformizer p), χ.2.1 (uniformizer p)) = (β, α)) ∧
    ∀ χ ∈ S.jacquet π p, (IsNRegular χ n ↔ ∀ i : ℕ, 1 ≤ i → i ≤ n - 1 → (α / β) ^ i ≠ 1) := by
  sorry

/-- `TauCeti.SymmetricPower.steinberg_refinement`: a twist of Steinberg has exactly one accessible
refinement. -/
theorem steinberg_refinement (π : (C.aut ⊥).AutRep 2) (p : ℕ) [Fact p.Prime]
    (hp : S.IsSteinbergTwistAt π (S.placeOfPrime p)) :
    ∃! χ, IsAccessibleRefinement S π p χ := by
  sorry

/-- `TauCeti.SymmetricPower.supercuspidal_none`: a supercuspidal `π_p` has no accessible
refinement. -/
theorem supercuspidal_none (π : (C.aut ⊥).AutRep 2) (p : ℕ) [Fact p.Prime]
    (hp : S.IsSupercuspidalAt π p) (χ : LocChar p × LocChar p) :
    ¬ IsAccessibleRefinement S π p χ := by
  sorry

/-- `TauCeti.SymmetricPower.not_regular_example`: if `χ₁/χ₂` has order two (`α/β = -1`), `χ` is
`2`-regular but not `3`-regular. -/
theorem not_regular_example {p : ℕ} [Fact p.Prime] (χ : LocChar p × LocChar p)
    (h1 : χ.1.1 / χ.2.1 ≠ 1) (h2 : (χ.1.1 / χ.2.1) ^ 2 = 1) :
    IsNRegular χ 2 ∧ ¬ IsNRegular χ 3 := by
  refine ⟨fun i hi1 hi2 => ?_, fun h => h 2 (by norm_num) (by norm_num) h2⟩
  sorry

/-- `TauCeti.SymmetricPower.automorphic_of_same_component` (ML.3/eigenvariety-propagation, NT I
Theorem 2.33): for refined points `z₀ = (π₀, χ₀)`, `z₀′ = (π₀′, χ₀′)` of the eigencurve `E₀` (tame
level `N`, prime `p`) on a common irreducible component of `E_{0,ℂ_p}`, if either (1)–(4) (`χ₀`
numerically non-critical and `n`-regular, `χ₀′` `n`-regular, Zariski closures of the local images
contain `SL₂`, `Sym^{n-1} r_{π₀,ı}` automorphic) or (1ord)–(3ord) (`χ₀` ordinary, `π₀, π₀′` non-CM,
`Sym^{n-1} r_{π₀,ı}` automorphic), then `Sym^{n-1} r_{π₀′,ı}` is automorphic. -/
theorem automorphic_of_same_component (N p n : ℕ) [Fact p.Prime] (ι : Iota p)
    (π₀ π₀' : (C.aut ⊥).AutRep 2) (χ₀ χ₀' : LocChar p × LocChar p)
    (href : IsAccessibleRefinement S π₀ p χ₀ ∧ IsAccessibleRefinement S π₀' p χ₀')
    (hcases : (S.IsNumNonCritical π₀ χ₀ ∧ IsNRegular χ₀ n ∧ IsNRegular χ₀' n ∧
        S.ZariskiContainsSL2 (C.restrictAt (C.galRep π₀ p ι) (S.placeOfPrime p)) ∧
        S.ZariskiContainsSL2 (C.restrictAt (C.galRep π₀' p ι) (S.placeOfPrime p)) ∧
        SymAutomorphic S π₀ n p ι) ∨
      (S.IsOrdinaryRefinement π₀ χ₀ ∧ ¬ S.IsCM π₀ ∧ ¬ S.IsCM π₀' ∧ SymAutomorphic S π₀ n p ι))
    (hcomp : S.SameComponent (S.point (N := N) π₀ χ₀) (S.point (N := N) π₀' χ₀')) :
    SymAutomorphic S π₀' n p ι := by
  sorry

/-- The `2`-adic valuation `v₂(w) = -log₂ ‖w‖` on `ℂ_2`. -/
def v2 (w : PadicComplex 2) : ℝ := -Real.logb 2 ‖w‖

/-- `TauCeti.SymmetricPower.buzzardKilford` (ML.3/buzzard-kilford-eigencurve): for `p = 2`, `N = 1`,
`E₀` lies over `W₀⁺ = {|w| < 1}`, and over the annulus `{|8| < |w| < 1}` it is a disjoint union of
pieces `X_i` (`i ≥ 1`) mapped bijectively onto the annulus by the weight map, with slope
`i · v₂(w)` on `X_i`.
NOTE: that the `X_i` are admissible opens and `κ|_{X_i}` an isomorphism of rigid spaces is not
expressible over the bare point set; the bijection is stated. -/
theorem buzzardKilford [Fact (Nat.Prime 2)] :
    (∀ z, ‖S.wCoord z‖ < 1) ∧
    ∃ X : ℕ → Set (S.Eigencurve 1 2), X 0 = ∅ ∧ Pairwise (fun i j => Disjoint (X i) (X j)) ∧
      (⋃ i, X i) = S.wCoord ⁻¹' {w | ‖(8 : PadicComplex 2)‖ < ‖w‖ ∧ ‖w‖ < 1} ∧
      ∀ i, 1 ≤ i → Set.BijOn S.wCoord (X i) {w | ‖(8 : PadicComplex 2)‖ < ‖w‖ ∧ ‖w‖ < 1} ∧
        ∀ z ∈ X i, S.slope z = i * v2 (S.wCoord z) := by
  sorry

/-- `TauCeti.SymmetricPower.symPower_levelOne_propagate` (ML.3/level-one-ping-pong, NT I Theorem 3.1
= Theorem D): if `Sym^{n-1} r_{π₀,ı}` is automorphic for one everywhere unramified regular algebraic
cuspidal `π₀` (weight `≥ 2`), then `Sym^{n-1} r_{π,ı}` is automorphic for every such `π`, every `p`
and `ı`. -/
theorem symPower_levelOne_propagate (n : ℕ) (hn : 2 ≤ n) (π₀ : (C.aut ⊥).AutRep 2)
    (hπ₀ : (C.aut ⊥).IsCuspidal π₀ ∧ (C.aut ⊥).IsRegularAlgebraic π₀ ∧ IsLevelOne π₀ ∧
      2 ≤ S.weight π₀)
    (h₀ : ∃ (p : ℕ) (_ : Fact p.Prime) (ι : Iota p), SymAutomorphic S π₀ n p ι)
    (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧ IsLevelOne π ∧
      2 ≤ S.weight π) (p : ℕ) [Fact p.Prime] (ι : Iota p) :
    SymAutomorphic S π n p ι := by
  sorry

/-- `F/K` is a soluble Galois extension inside `Q̄`. -/
def IsSolubleOver (K F : NF) : Prop :=
  IsGaloisOver K F ∧ ∃ _ : ((GalF F).subgroupOf (GalF K)).Normal,
    Group.IsSolvable (↥(GalF K) ⧸ (GalF F).subgroupOf (GalF K))

/-- `r′ ≅ ω^k ⊗ r` for a character `ω` (as matrices, up to conjugation). -/
def IsCharTwistOf {H : Subgroup GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r' : Rep H l n)
    (ω : Rep H l 1) (k : ℕ) (r : Rep H l n) : Prop :=
  ∃ g : GLQl l n, ∀ x : H, ((r' x : GLQl l n) : Matrix (Fin n) (Fin n) (PadicAlgCl l)) =
    (((ω x : GLQl l 1) : Matrix (Fin 1) (Fin 1) (PadicAlgCl l)) 0 0) ^ k •
      ((g * r x * g⁻¹ : GLQl l n) : Matrix (Fin n) (Fin n) (PadicAlgCl l))

/-- `TauCeti.SymmetricPower.exists_steinberg_levelRaising` (ML.3/steinberg-level-raising, NT I
Theorems 4.1, 6.1, 7.1): for `n ≥ 3`, primes `p ≡ 1 (mod 48·n!)` and `q ≠ p`, `K` imaginary
quadratic, `X₀` a finite set of places of `K` prime to `2pq`, `σ₀ = AI_K^ℚ(ψ)` a theta series, and a
de Rham `ω` with `ω ω^c = ε_p³` unramified on `X₀`: there are a soluble CM `F/K` in which `X₀` splits
and a regular algebraic cuspidal conjugate self-dual `ı`-ordinary `Π` of `GL_n(𝔸_F)` with
`r_{Π,ı} ≅ ω^{n-1}|_{G_F} ⊗ Sym^{n-1} r_{σ₀,ı}|_{G_F}` and `Π_v` an unramified twist of Steinberg at
some `v | q` (same Hodge–Tate numbers follow from the isomorphism). -/
theorem exists_steinberg_levelRaising (n : ℕ) (hn : 3 ≤ n) (p q : ℕ) [Fact p.Prime]
    (hq : q.Prime) (hpq : q ≠ p) (hp : p % (48 * n.factorial) = 1) (ι : Iota p)
    (K : NF) [FiniteDimensional ℚ K] (hK : Module.finrank ℚ K = 2 ∧ NumberField.IsTotallyComplex K)
    (ψ : (C.aut K).AutRep 1) (X₀ : Finset (C.aut K).Place)
    (hX₀ : ∀ v ∈ X₀, ¬ (C.aut K).IsArchimedean v ∧ C.residueChar v ≠ 2 ∧
      C.residueChar v ≠ p ∧ C.residueChar v ≠ q)
    (c : GQ) (hc : c ∉ GalF K) (hcK : ∀ x ∈ GalF K, c * x * c⁻¹ ∈ GalF K)
    (ω : GaloisChar K p) (hωdR : ∀ v, C.residueChar v = p → C.IsDeRham (C.restrictAt ω v))
    (hωc : ∀ x : GalF K, ω x * ω ⟨c * x.1 * c⁻¹, hcK x.1 x.2⟩ = ((C.cyclo p).res bot_le x) ^ 3)
    (hωX₀ : ∀ v ∈ X₀, C.IsUnramifiedAt ω v) :
    ∃ (F : NF) (_ : FiniteDimensional ℚ F) (hKF : K ≤ F) (Fp : NF) (_ : FiniteDimensional ℚ Fp)
      (Pi' : (C.aut F).AutRep n), IsSolubleOver K F ∧ IsCMWithPlus Fp F ∧
      (∀ v ∈ X₀, C.decomp v ≤ GalF F) ∧
      (C.aut F).IsCuspidal Pi' ∧ (C.aut F).IsRegularAlgebraic Pi' ∧
      (∃ χ : (C.aut Fp).AutRep 1, C.IsPolarizedAut Pi' χ) ∧ C.IsOrdinaryAut Pi' p ι ∧
      IsCharTwistOf (C.galRep Pi' p ι) (ω.res hKF) (n - 1)
        (GaloisRep.res (bot_le.trans hKF) (S.symRep (C.galRep (S.autInd K ψ) p ι) n)) ∧
      ∃ v : (C.aut F).Place, C.residueChar v = q ∧ S.IsUnramSteinbergTwistAt Pi' v := by
  sorry

/-- `TauCeti.SymmetricPower.exists_levelOne_symPower` (ML.3/one-level-one-symmetric-power, NT I
Theorem 7.6 = Theorem E): for every `n ≥ 3` some everywhere unramified regular algebraic cuspidal `π`
of weight `≥ 2` has `Sym^{n-1} r_{π,ı}` automorphic for every `ı`. -/
theorem exists_levelOne_symPower (n : ℕ) (hn : 3 ≤ n) :
    ∃ π : (C.aut ⊥).AutRep 2, (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧
      IsLevelOne π ∧ 2 ≤ S.weight π ∧
      ∀ (p : ℕ) (_ : Fact p.Prime) (ι : Iota p), SymAutomorphic S π n p ι := by
  sorry

/-- `TauCeti.SymmetricPower.symPower_levelOne` (ML.3/level-one-symmetric-powers, NT I Theorem 7.7 =
Theorem A): for `n ≥ 2` and `π` regular algebraic cuspidal of level one, `Sym^{n-1}π` exists as a
regular algebraic cuspidal automorphic representation of `GL_n(𝔸_ℚ)`. -/
theorem symPower_levelOne (n : ℕ) (hn : 2 ≤ n) (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧ IsLevelOne π) :
    ∃ L : SymPowerLift S π n, (C.aut ⊥).IsCuspidal L.lift ∧ (C.aut ⊥).IsRegularAlgebraic L.lift := by
  sorry

/-- `TauCeti.SymmetricPower.exists_nRegular_congruence` (ML.3/n-regular-congruences, NT I
Proposition 8.3): for `π` non-CM of weight `k ≥ 2` with no supercuspidal `π_l`, there are a prime
`p > max(2(n + 1), (n - 1)k)`, `ı`, and `π′` of weight `k` with `r̄_{π,ı}(G_ℚ) ⊇` a conjugate of
`SL₂(F_p)`, `π_p, π′_p` unramified, `r̄_{π,ı} ≅ r̄_{π′,ı}`, and every `π′_l` non-supercuspidal with all
accessible refinements `n`-regular where `π′_l` is ramified. -/
theorem exists_nRegular_congruence (n : ℕ) (hn : 2 ≤ n) (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧ ¬ S.IsCM π ∧
      2 ≤ S.weight π) (hsc : ∀ l, l.Prime → ¬ S.IsSupercuspidalAt π l) :
    ∃ (p : ℕ) (_ : Fact p.Prime) (ι : Iota p) (π' : (C.aut ⊥).AutRep 2),
      max (2 * (n + 1)) ((n - 1) * S.weight π) < p ∧ (C.aut ⊥).IsCuspidal π' ∧
      (C.aut ⊥).IsRegularAlgebraic π' ∧ S.weight π' = S.weight π ∧
      S.ResImageContainsSL2 (C.reduce (C.galRep π p ι)) ∧
      (C.aut ⊥).IsUnramifiedAt π (S.placeOfPrime p) ∧
      (C.aut ⊥).IsUnramifiedAt π' (S.placeOfPrime p) ∧
      (C.reduce (C.galRep π p ι)).Iso (C.reduce (C.galRep π' p ι)) ∧
      ∀ (l : ℕ) (_ : Fact l.Prime), ¬ S.IsSupercuspidalAt π' l ∧
        (¬ (C.aut ⊥).IsUnramifiedAt π' (S.placeOfPrime l) →
          ∀ χ, IsAccessibleRefinement S π' l χ → IsNRegular χ n) := by
  sorry

/-- `TauCeti.SymmetricPower.symPower_of_not_supercuspidal` (ML.3/non-supercuspidal-symmetric-powers,
NT I Theorem 8.1 = Theorem B, Corollary C): for `π` non-CM regular algebraic cuspidal with `π_l`
having nonzero Jacquet module for every `l`, `Sym^{n-1} r_{π,ı}` is automorphic for every `n ≥ 3`,
so `Sym^{n-1}π` exists; for a semistable elliptic curve `E/ℚ`, `Λ(Sym^n E, s)` is entire. -/
theorem symPower_of_not_supercuspidal (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧ ¬ S.IsCM π)
    (hJ : ∀ (l : ℕ) (_ : Fact l.Prime), (S.jacquet π l).Nonempty) :
    (∀ n, 3 ≤ n → ∀ (p : ℕ) (_ : Fact p.Prime) (ι : Iota p), SymAutomorphic S π n p ι) ∧
    (∀ n, 3 ≤ n → Nonempty (SymPowerLift S π n)) ∧
    ∀ E : WeierstrassCurve ℚ, E.IsElliptic → S.IsSemistable E → ∀ n : ℕ, 0 < n →
      Differentiable ℂ (S.completedSymL E n) := by
  sorry

-- REVIEW GAP: this sketch still omits PSL₂(F_{p^a}) ≤ P r̄(G_F) ≤ PGL₂(F_{p^a})
-- with p^a > max(5, 2*n-1). The exact finite-field/projective-image supplier must be typed;
-- an arbitrary Prop field is not a replacement for this mathematical condition.
/-- `TauCeti.SymmetricPower.symPower_lifting` (ML.3/symmetric-power-automorphy-lifting, NT II
Theorem 2.1): over totally real `F`, for regular algebraic cuspidal `π, π′` on `GL₂(𝔸_F)` with `π′` of
weight 2, non-CM, `r_{π′,ı}|_{G_{F_v}}` non-ordinary for `v | p`, `r̄_{π′,ı} ≅ r̄_{π,ı}`, `π_v` a twist
of Steinberg iff `π′_v` is (`v ∤ p`), and `Sym^{n-1} r_{π′,ı}` automorphic, `Sym^{n-1} r_{π,ı}` is
automorphic (no irreducibility of `Sym^{n-1} r̄` and no bound `p > n` needed). -/
theorem symPower_lifting {F : NF} [FiniteDimensional ℚ F] (hF : IsTotallyRealNF F) (n p : ℕ)
    [Fact p.Prime] (hn : 1 ≤ n) (ι : Iota p) (π π' : (C.aut F).AutRep 2)
    (hπ : (C.aut F).IsCuspidal π ∧ (C.aut F).IsRegularAlgebraic π)
    (hπ' : (C.aut F).IsCuspidal π' ∧ (C.aut F).IsRegularAlgebraic π' ∧ S.weight π' = 2 ∧
      ¬ S.IsCM π')
    (hord : ∀ v, C.residueChar v = p → ¬ S.IsOrdinaryLocal (C.restrictAt (C.galRep π' p ι) v))
    (hcong : (C.reduce (C.galRep π' p ι)).Iso (C.reduce (C.galRep π p ι)))
    (hSt : ∀ v, ¬ (C.aut F).IsArchimedean v → C.residueChar v ≠ p →
      (S.IsSteinbergTwistAt π v ↔ S.IsSteinbergTwistAt π' v))
    (haut : IsAutomorphicRep (C := C) ι (S.symRep (C.galRep π' p ι) n)) :
    IsAutomorphicRep (C := C) ι (S.symRep (C.galRep π p ι) n) := by
  sorry

/-- `TauCeti.SymmetricPower.symPower_nonCM` (ML.3/non-cm-symmetric-powers, NT II Theorem A,
Corollary B): for `π` regular algebraic cuspidal non-CM on `GL₂(𝔸_ℚ)` and every `n ≥ 1`, `Sym^nπ`
exists as a regular algebraic cuspidal representation of `GL_{n+1}(𝔸_ℚ)`; for every non-CM elliptic
curve `E/ℚ` and `n ≥ 2`, `Λ(Sym^n E, s)` is entire. -/
theorem symPower_nonCM (π : (C.aut ⊥).AutRep 2)
    (hπ : (C.aut ⊥).IsCuspidal π ∧ (C.aut ⊥).IsRegularAlgebraic π ∧ ¬ S.IsCM π) :
    (∀ n, 1 ≤ n → ∃ L : SymPowerLift S π (n + 1), (C.aut ⊥).IsCuspidal L.lift ∧
      (C.aut ⊥).IsRegularAlgebraic L.lift) ∧
    ∀ E : WeierstrassCurve ℚ, E.IsElliptic → ¬ S.HasCM E → ∀ n, 2 ≤ n →
      Differentiable ℂ (S.completedSymL E n) := by
  sorry

/-- `TauCeti.SymmetricPower.symPower_CM_weightOne` (ML.3/cm-and-weight-one-symmetric-powers, NT II
Theorem A.1): if `π_∞` is a holomorphic limit of discrete series, or `π = AI(ψ)` for a Hecke
character `ψ` of a quadratic field, `Sym^nπ` exists for every `n ≥ 1` (usually not cuspidal). -/
theorem symPower_CM_weightOne (π : (C.aut ⊥).AutRep 2) (hπ : (C.aut ⊥).IsCuspidal π)
    (hcases : S.IsWeightOne π ∨ ∃ (K : NF) (_ : FiniteDimensional ℚ K) (ψ : (C.aut K).AutRep 1),
      Module.finrank ℚ K = 2 ∧ π = S.autInd K ψ) (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (SymPowerLift S π (n + 1)) := by
  sorry

/-- `Tr ρ_j(g)`. -/
def charOf {K : Type} [Group K] {d : ℕ} (ρ : K →* GL (Fin d) ℂ) (g : K) : ℂ :=
  Matrix.trace ((ρ g : GL (Fin d) ℂ) : Matrix (Fin d) (Fin d) ℂ)

/-- `TauCeti.SymmetricPower.equidistributed_of_lFunctions` (ML.3/l-function-equidistribution-criterion,
Kedlaya Theorem 24.2 with the Weyl criterion): `K` compact with normalised Haar measure `µ`, elements
`x_i` with norms `N(x_i) ≥ 2`; `(ρ_j)` the irreducible representations (Schur orthonormal characters,
dense in continuous class functions: Peter–Weyl), `ρ_triv` trivial; `L(s, ρ_j) = ∏_i
det(1 - ρ_j(x_i)N(x_i)^{-s})^{-1}` for `Re s > 1`, continuing to a neighbourhood of `Re s ≥ 1` with
no zeros or poles except possibly at `1`, `L(s, ρ_triv)` with a simple pole at `1`. Then
`#{i : N(x_i) ≤ n} ~ n/log n`; `Σ_{N(x_i) ≤ n} χ_j(x_i) = c_j n/log n + o(n/log n)` with `-c_j` the
order of `L(s, ρ_j)` at `1`; and if boundedly many `x_i` share a norm, the `x_i` are equidistributed
for `µ` (on class functions) iff `c_j = 0` for every nontrivial `j`. -/
theorem equidistributed_of_lFunctions (K : Type) [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [MeasurableSpace K] [BorelSpace K]
    (μ : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure μ] [μ.IsMulLeftInvariant]
    (x : ℕ → K) (N : ℕ → ℕ) (hN : ∀ i, 2 ≤ N i) (hfin : ∀ n, {i | N i ≤ n}.Finite)
    (Irr : Type) [DecidableEq Irr] (dim : Irr → ℕ) (ρ : ∀ j, K →* GL (Fin (dim j)) ℂ)
    (hρc : ∀ j, Continuous (charOf (ρ j))) (triv : Irr) (htriv : ∀ g, ρ triv g = 1)
    (horth : ∀ j k, ∫ g, charOf (ρ j) g * star (charOf (ρ k) g) ∂μ = if j = k then 1 else 0)
    (hPW : ∀ f : K → ℂ, Continuous f → (∀ g h, f (h * g * h⁻¹) = f g) → ∀ ε > (0 : ℝ),
      ∃ c : Irr →₀ ℂ, ∀ g, ‖f g - c.sum (fun j a => a * charOf (ρ j) g)‖ < ε)
    (L : Irr → ℂ → ℂ)
    (hEuler : ∀ j, ∀ s : ℂ, 1 < s.re → HasProd (fun i => (Matrix.det (1 - ((N i : ℂ) ^ (-s)) •
      ((ρ j (x i) : GL (Fin (dim j)) ℂ) : Matrix (Fin (dim j)) (Fin (dim j)) ℂ)))⁻¹) (L j s))
    (hcont : ∀ j, ∃ U : Set ℂ, IsOpen U ∧ {s | 1 ≤ s.re} ⊆ U ∧ MeromorphicOn (L j) U ∧
      ∀ s ∈ U, s ≠ 1 → AnalyticAt ℂ (L j) s ∧ L j s ≠ 0)
    (hzeta : meromorphicOrderAt (L triv) 1 = ((-1 : ℤ) : WithTop ℤ)) :
    Asymptotics.IsEquivalent Filter.atTop (fun n : ℕ => (Nat.card {i // N i ≤ n} : ℝ))
      (fun n => n / Real.log n) ∧
    (∀ j, ∃ c : ℤ, meromorphicOrderAt (L j) 1 = ((-c : ℤ) : WithTop ℤ) ∧
      (fun n : ℕ => (∑ᶠ i ∈ {i | N i ≤ n}, charOf (ρ j) (x i)) - c * (n / Real.log n : ℝ))
        =o[Filter.atTop] (fun n : ℕ => ((n / Real.log n : ℝ) : ℂ))) ∧
    ((∃ B : ℕ, ∀ m, Nat.card {i // N i = m} ≤ B) →
      ((∀ f : K → ℂ, Continuous f → (∀ g h, f (h * g * h⁻¹) = f g) →
        Filter.Tendsto (fun n : ℕ => (∑ᶠ i ∈ {i | N i ≤ n}, f (x i)) / (Nat.card {i // N i ≤ n} : ℂ))
          Filter.atTop (nhds (∫ g, f g ∂μ))) ↔
        ∀ j, j ≠ triv → meromorphicOrderAt (L j) 1 = 0)) := by
  sorry

/-- The Sato–Tate angle `θ_p ∈ [0, π]`: `a_p = 2√p cos θ_p`, i.e. `α_p = √p e^{iθ_p}`. -/
def satoTateAngle (E : WeierstrassCurve ℚ) (p : ℕ) : ℝ :=
  Real.arccos ((S.ap E p : ℝ) / (2 * Real.sqrt p))

/-- `TauCeti.SymmetricPower.satoTate_elliptic` (ML.3/sato-tate-elliptic-curves): for `E/ℚ` without
CM, the angles `θ_p` (good `p`) are equidistributed for `(2/π) sin² θ dθ` on `[0, π]`. -/
theorem satoTate_elliptic (E : WeierstrassCurve ℚ) (hE : E.IsElliptic) (hCM : ¬ S.HasCM E)
    (f : ℝ → ℝ) (hf : Continuous f) :
    Filter.Tendsto (fun X : ℕ =>
        (∑ᶠ p ∈ {p : ℕ | p ≤ X ∧ p.Prime ∧ S.IsGoodPrime E p}, f (satoTateAngle S E p)) /
          (Nat.card {p : ℕ // p ≤ X ∧ p.Prime ∧ S.IsGoodPrime E p} : ℝ))
      Filter.atTop (nhds (∫ θ in (0 : ℝ)..Real.pi, f θ * (2 / Real.pi) * Real.sin θ ^ 2)) := by
  sorry

end SymmetricPower

end TauCeti

namespace TauCeti.PotentialAutomorphy.SuggestedTest

/-- `ML.2/multiple-product-l-functions` (Corollary 5.4.4): for `K = {1, 2, 4}` the `2^#K = 8`
partial sums are distinct, so `⊗_k r_{f_k}` is regular. -/
example : ((({1, 2, 4} : Finset ℕ).powerset).image (fun s => s.sum id)).card = 8 := by decide

/-- The non-example `K = {1, 2, 3}`: `1 + 2 = 3`, so only 7 partial sums are distinct. -/
example : ((({1, 2, 3} : Finset ℕ).powerset).image (fun s => s.sum id)).card = 7 := by decide

/-- `ML.2/preliminary-pd-automorphy-lifting`: the regularity condition of Proposition 4.1.1 in rank
two, `HT(r) = {0, 1}`, `HT(r_{l,ı}(π)) = {0, 2}`: the four sums are distinct. -/
example : ((({0, 1} : Finset ℤ) ×ˢ ({0, 2} : Finset ℤ)).image (fun p => p.1 + p.2)).card = 4 := by
  decide

/-- The same condition fails for `HT(r) = HT(r_{l,ı}(π)) = {0, 1}`: `0 + 1 = 1 + 0`. -/
example : ((({0, 1} : Finset ℤ) ×ˢ ({0, 1} : Finset ℤ)).image (fun p => p.1 + p.2)).card = 3 := by
  decide

/-- `ML.2/adequate-subgroup`: when `l ∣ n` the scalar matrices lie in `sl_n`, so `H⁰(H, sl_n) ≠ 0`
and no subgroup is adequate; here `l = n = 3`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one]
  decide

/-- `ML.2/polarized-galois-representation`, non-example: the Hodge–Tate multiset `{0, 1, 5}` is not
of the form `{w - h}` for any `w`, so `1 ⊕ ε_l⁻¹ ⊕ ε_l⁻⁵` is not polarizable. -/
example (w : ℤ) : ({0, 1, 5} : Finset ℤ).image (fun h => w - h) ≠ {0, 1, 5} := by
  intro hw
  have h0 : (0 : ℤ) ∈ ({0, 1, 5} : Finset ℤ).image (fun h => w - h) := by
    rw [hw]; decide
  simp only [Finset.mem_image, Finset.mem_insert, Finset.mem_singleton] at h0
  obtain ⟨a, ha, hwa⟩ := h0
  have hw' : w = a := by omega
  subst hw'
  rcases ha with rfl | rfl | rfl <;> revert hw <;> decide

/-! ### ML.3: symmetric powers and Sato–Tate -/

/-- `ML.3/steinberg-level-raising` (NT I Theorem 7.1) needs a prime `p ≡ 1 (mod 48·n!)`; for `n = 3`,
`48·3! = 288` and `577 = 2·288 + 1` is prime. -/
example : 48 * Nat.factorial 3 = 288 ∧ 577 % 288 = 1 ∧ Nat.Prime 577 := by
  refine ⟨by decide, by decide, by norm_num⟩

/-- `ML.3/sato-tate-elliptic-curves`: the Sato–Tate density `(2/π) sin² θ` has total mass one, since
`∫₀^π sin² θ dθ = π / 2`. -/
example : ∫ θ in (0 : ℝ)..Real.pi, Real.sin θ ^ 2 = Real.pi / 2 := by
  rw [integral_sin_sq]
  simp

/-- `ML.3/accessible-regular-refinement`: the ratio `α/β = -1` is `2`-regular but not `3`-regular. -/
example : ((-1 : ℤ) ^ 1 ≠ 1) ∧ (-1 : ℤ) ^ 2 = 1 := by decide

end TauCeti.PotentialAutomorphy.SuggestedTest


/-! ## G5: ML.2 potential automorphy assembly; ML.3 symmetric powers, Sato–Tate, Bianchi forms

Conventions of this part. For the ML.2 nodes and the ML.3 nodes about compatible systems, number
fields are finite subextensions `K` of a fixed `Q̄ = AlgebraicClosure ℚ` (`G5NF`), `G_K` is the
fixing subgroup of `K` in `Gal(Q̄/ℚ)` with its Krull topology, `l`-adic representations are
continuous homomorphisms `G_K → GL_n(Q̄_l)` (`Q̄_l = PadicAlgCl l`), residual representations are
homomorphisms `G_K → GL_n(F̄_l)` with open kernel, and the automorphic objects, the Galois
representations attached to them, `p`-adic Hodge-theoretic local conditions and compatible systems
enter through the supplier structure `TauCeti.PotentialAutomorphy.G5Context`, each field naming its
owner. The ML.3 nodes about a single number field `F` use `TauCeti.SymmetricPower.G5Context F`, an
extension of `TauCeti.Langlands.Context F`. All helper names of this part carry the prefix `G5`. -/

namespace TauCeti

namespace PotentialAutomorphy

open NumberField

/-- `Q̄`, a fixed algebraic closure of `ℚ`. -/
abbrev G5Qbar : Type := AlgebraicClosure ℚ

/-- `G_ℚ = Gal(Q̄/ℚ)` with its Krull topology. -/
abbrev G5GQ : Type := G5Qbar ≃ₐ[ℚ] G5Qbar

/-- Subfields of `Q̄`; a number field is one with `[FiniteDimensional ℚ K]`. -/
abbrev G5NF : Type := IntermediateField ℚ G5Qbar

/-- A finite subextension of `Q̄` is a number field. -/
instance G5instNumberField (K : G5NF) [FiniteDimensional ℚ K] : NumberField K where

/-- `G_K ⊆ G_ℚ`, the fixing subgroup of `K`. -/
abbrev G5GalF (K : G5NF) : Subgroup G5GQ := K.fixingSubgroup

/-- Finite places of `K`: non-zero prime ideals of `𝓞_K`. -/
abbrev G5Place (K : G5NF) : Type := {P : Ideal (𝓞 K) // P.IsPrime ∧ P ≠ ⊥}

/-- The place `v` lies above the rational prime `p`. -/
def G5Above {K : G5NF} (v : G5Place K) (p : ℕ) : Prop := ((p : ℤ) : 𝓞 K) ∈ v.1

/-- The absolute norm `q_v = #(𝓞_K / v)`. -/
def G5normPlace {K : G5NF} (v : G5Place K) : ℕ := Nat.card (𝓞 K ⧸ v.1)

/-- A continuous `l`-adic representation `H → GL_n(Q̄_l)` of a subgroup `H ⊆ G_ℚ`. -/
abbrev G5RepOn (H : Subgroup G5GQ) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type :=
  ContinuousMonoidHom H (GL (Fin n) (PadicAlgCl l))

/-- An `l`-adic representation `r : G_K → GL_n(Q̄_l)`. -/
abbrev G5Rep (K : G5NF) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type := G5RepOn (G5GalF K) l n

/-- A residual representation `H → GL_n(F̄_l)` with open kernel (continuous for the discrete
topology on the target). -/
def G5ResRepOn (H : Subgroup G5GQ) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type :=
  {ρ : H →* GL (Fin n) (AlgebraicClosure (ZMod l)) // IsOpen (ρ.ker : Set H)}

/-- A residual representation `r̄ : G_K → GL_n(F̄_l)`. -/
abbrev G5ResRep (K : G5NF) (l : ℕ) [Fact l.Prime] (n : ℕ) : Type := G5ResRepOn (G5GalF K) l n

/-- Restriction of an `l`-adic representation to a smaller subgroup. -/
def G5RepOn.restrict {H H' : Subgroup G5GQ} (h : H' ≤ H) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : G5RepOn H l n) : G5RepOn H' l n :=
  r.comp ⟨Subgroup.inclusion h, continuous_inclusion h⟩

/-- Restriction `r|_{G_{K′}}` along `K ≤ K′`. -/
def G5Rep.res {K K' : G5NF} (h : K ≤ K') {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : G5Rep K l n) : G5Rep K' l n :=
  G5RepOn.restrict (IntermediateField.fixingSubgroup_le h) r

/-- Restriction of a residual representation to a smaller subgroup. -/
def G5ResRepOn.restrict {H H' : Subgroup G5GQ} (h : H' ≤ H) {l : ℕ} [Fact l.Prime] {n : ℕ}
    (r : G5ResRepOn H l n) : G5ResRepOn H' l n :=
  ⟨r.1.comp (Subgroup.inclusion h), by
    have : ((r.1.comp (Subgroup.inclusion h)).ker : Set H') =
        Subgroup.inclusion h ⁻¹' (r.1.ker : Set H) := by
      ext x; simp
    rw [this]; exact r.2.preimage (continuous_inclusion h)⟩

/-- Restriction `r̄|_{G_{K′}}` along `K ≤ K′`. -/
def G5ResRep.res {K K' : G5NF} (h : K ≤ K') {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRep K l n) : G5ResRep K' l n :=
  G5ResRepOn.restrict (IntermediateField.fixingSubgroup_le h) r

/-- Isomorphism of `l`-adic representations: conjugacy by `GL_n(Q̄_l)`. -/
def G5RepOn.Iso {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r r' : G5RepOn H l n) :
    Prop :=
  ∃ g : GL (Fin n) (PadicAlgCl l), ∀ x : H, r' x = g * r x * g⁻¹

/-- Isomorphism of residual representations: conjugacy by `GL_n(F̄_l)`. -/
def G5ResRepOn.Iso {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r r' : G5ResRepOn H l n) : Prop :=
  ∃ g : GL (Fin n) (AlgebraicClosure (ZMod l)), ∀ x : H, r'.1 x = g * r.1 x * g⁻¹

/-- `H`-stable subspaces of `F̄_l^n` under a residual representation. -/
def G5ResRepOn.IsStable {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRepOn H l n)
    (W : Submodule (AlgebraicClosure (ZMod l)) (Fin n → AlgebraicClosure (ZMod l))) : Prop :=
  ∀ x : H, ∀ w ∈ W, ((r.1 x : GL (Fin n) _) : Matrix (Fin n) (Fin n) _).mulVec w ∈ W

/-- Absolute irreducibility of a residual representation. -/
def G5ResRepOn.IsIrreducible {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRepOn H l n) : Prop :=
  n ≠ 0 ∧ ∀ W, r.IsStable W → W = ⊥ ∨ W = ⊤

/-- Semisimplicity of a residual representation: every stable subspace has a stable
complement. -/
def G5ResRepOn.IsSemisimple {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRepOn H l n) : Prop :=
  ∀ W, r.IsStable W → ∃ W', r.IsStable W' ∧ IsCompl W W'

/-- The image `r̄(H′)` of a subgroup `H′ ⊆ G_ℚ` (intersected with the domain `H`). -/
def G5ResRepOn.image {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRepOn H l n) (H' : Subgroup G5GQ) :
    Subgroup (GL (Fin n) (AlgebraicClosure (ZMod l))) :=
  (H'.subgroupOf H).map r.1

/-- The fixed field `Q̄^{ker r̄}` of the kernel of a residual representation of `G_K`. -/
def G5ResRep.kerField {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5ResRep K l n) : G5NF :=
  IntermediateField.fixedField (r.1.ker.map (G5GalF K).subtype)

/-- `GL_2(F_l) ⊆ GL_2(F̄_l)`. -/
def G5GL2 (l : ℕ) [Fact l.Prime] : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod l))) :=
  (Units.map (RingHom.mapMatrix (algebraMap (ZMod l) (AlgebraicClosure (ZMod l)))).toMonoidHom).range

/-- `SL_2(F_l) ⊆ GL_2(F̄_l)`: the elements of `GL_2(F_l)` of determinant one. -/
def G5SL2 (l : ℕ) [Fact l.Prime] : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod l))) :=
  G5GL2 l ⊓ Matrix.GeneralLinearGroup.det.ker

/-- `K(ζ_l) ⊆ Q̄`. -/
def G5adjZeta (K : G5NF) (l : ℕ) : G5NF :=
  K ⊔ IntermediateField.adjoin ℚ {x : G5Qbar | IsPrimitiveRoot x l}

/-- `K′/K₀` is Galois inside `Q̄`: `K₀ ≤ K′` and `K′` is `G_{K₀}`-stable. -/
def G5IsGaloisOver (K₀ K' : G5NF) : Prop :=
  K₀ ≤ K' ∧ ∀ σ ∈ G5GalF K₀, K'.map (σ : G5Qbar →ₐ[ℚ] G5Qbar) = K'

/-- `K′ ⊇ K` and `A ⊇ K` are linearly disjoint over `K` (finite extensions):
`[K′A : ℚ]·[K : ℚ] = [K′ : ℚ]·[A : ℚ]`. -/
def G5LinDisjointOver (K K' A : G5NF) : Prop :=
  Module.finrank ℚ (K' ⊔ A : G5NF) * Module.finrank ℚ K = Module.finrank ℚ K' * Module.finrank ℚ A

/-- The rational prime `p` is unramified in `K`: every prime of `𝓞_K` above `p` has
ramification index one. -/
def G5UnramifiedIn (p : ℕ) (K : G5NF) : Prop :=
  ∀ v : G5Place K, G5Above v p →
    Ideal.ramificationIdx v.1 ℤ = 1

/-- The rational prime `p` splits completely in `K`: there are `[K : ℚ]` primes above it. -/
def G5SplitsCompletely (p : ℕ) (K : G5NF) : Prop :=
  Set.ncard {v : G5Place K | G5Above v p} = Module.finrank ℚ K

/-- A set of rational primes has Dirichlet density `δ`. -/
def G5HasDensity (L : Set ℕ) (δ : ℝ) : Prop :=
  (∀ p ∈ L, p.Prime) ∧
    Filter.Tendsto (fun s : ℝ => (∑' p : L, ((p : ℕ) : ℝ) ^ (-s)) / Real.log (1 / (s - 1)))
      (nhdsWithin 1 (Set.Ioi 1)) (nhds δ)

/-- `x ∈ F̄_l^×` acting as a scalar matrix. -/
def G5IsScalar {l : ℕ} [Fact l.Prime] {n : ℕ} (g : GL (Fin n) (AlgebraicClosure (ZMod l))) : Prop :=
  ∃ c : AlgebraicClosure (ZMod l), (g : Matrix (Fin n) (Fin n) _) = Matrix.scalar (Fin n) c

/-- The supplier interface of the G5 nodes of ML.2 and of the compatible-system nodes of ML.3:
automorphic representations over every number field `K ⊆ Q̄`, their Galois representations,
`p`-adic Hodge-theoretic local conditions, compatible systems and elliptic curves. -/
structure G5Context where
  /-- Isobaric automorphic representations of `GL_n(𝔸_K)` up to isomorphism
  (owner: AutomorphicFormsOnReductiveGroups AF.2). -/
  AutRep : G5NF → ℕ → Type
  /-- Cuspidality (owner: AutomorphicFormsOnReductiveGroups AF.3). -/
  IsCuspidal : ∀ {K : G5NF} {n : ℕ}, AutRep K n → Prop
  /-- Regular algebraicity (owner: AutomorphicFormsOnReductiveGroups AF.4). -/
  IsRegularAlgebraic : ∀ {K : G5NF} {n : ℕ}, AutRep K n → Prop
  /-- Polarizability: essentially (conjugate) self-dual with the sign condition, i.e. RAESDC over
  totally real and RACSDC over CM fields (owner: AutomorphicGaloisRepresentationsPartII AG2.0). -/
  IsPolarizable : ∀ {K : G5NF} {n : ℕ}, AutRep K n → Prop
  /-- The weight `λ = (λ_{τ,i})` of a regular algebraic `π` (owner: AF.4). -/
  weight : ∀ {K : G5NF} {n : ℕ}, AutRep K n → (K →+* ℂ) → Fin n → ℤ
  /-- `π_v` is unramified (owner: AF.2). -/
  IsUnramifiedAutAt : ∀ {K : G5NF} {n : ℕ}, AutRep K n → G5Place K → Prop
  /-- `π_v` is an unramified twist of the Steinberg representation (owner: ET.6). -/
  IsSteinbergTwistAt : ∀ {K : G5NF} {n : ℕ}, AutRep K n → G5Place K → Prop
  /-- `π` is `ι`-ordinary at `v | l` (owner: PotentialAutomorphyInfrastructurePartII PL.0). -/
  IsIotaOrdinaryAt : ∀ {K : G5NF} {n : ℕ}, AutRep K n → (l : ℕ) → [Fact l.Prime] →
    (PadicAlgCl l ≃+* ℂ) → G5Place K → Prop
  /-- The Hecke polynomial `det(1 − X·rec(π_v)(Frob_v))` at an unramified place, through the
  arithmetic normalisation (owner: AutomorphicLFunctionsAndLocalFactors AL.2). -/
  heckePoly : ∀ {K : G5NF} {n : ℕ}, AutRep K n → G5Place K → Polynomial ℂ
  /-- `r_{l,ι}(π)` for regular algebraic `π` (owner: AutomorphicGaloisRepresentationsPartII
  AG2.2). -/
  galRep : ∀ {K : G5NF} {n : ℕ}, AutRep K n → (l : ℕ) → [Fact l.Prime] →
    (PadicAlgCl l ≃+* ℂ) → G5Rep K l n
  /-- The semisimplified reduction `r̄` of an `l`-adic representation (owner:
  PotentialModularityAndCompatibleSystems R24.6). -/
  reduce : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → G5ResRep K l n
  /-- `r` is unramified at `v` (owner: AG2.0). -/
  IsUnramifiedAt : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → G5Place K → Prop
  /-- `r|_{G_{K_v}}` is potentially semistable (owner: PL.0). -/
  IsPotSemistableAt : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → G5Place K →
    Prop
  /-- `r|_{G_{K_v}}` is crystalline (owner: PL.0). -/
  IsCrystallineAt : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → G5Place K → Prop
  /-- `r|_{G_{K_v}}` is ordinary (upper triangular with the diagonal characters prescribed by its
  Hodge–Tate weights) (owner: PL.0). -/
  IsOrdinaryAt : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → G5Place K → Prop
  /-- The labelled Hodge–Tate weights of `r` at `τ : K → Q̄_l` (owner: PL.0). -/
  htWeights : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → (K →+* PadicAlgCl l) →
    Multiset ℤ
  /-- `r̄` is decomposed generic (owner: PotentialAutomorphyInfrastructure PA.4). -/
  IsDecomposedGeneric : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5ResRep K l n → Prop
  /-- A subgroup of `GL_n(F̄_l)` is enormous (ACC+ Definition 6.2.28; owner: PA.4). -/
  IsEnormous : ∀ {l : ℕ} [Fact l.Prime] {n : ℕ}, Subgroup (GL (Fin n) (AlgebraicClosure (ZMod l))) → Prop
  /-- `r̄ : G_K → GSp_n(F̄_l)` preserves a symplectic form with multiplier `ε̄_l^k`, and its image
  is absolutely `GSp_n`-irreducible when `irr` (owner: PotentialAutomorphyInfrastructurePartII
  PL.5). -/
  IsSymplecticRes : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5ResRep K l n → (k : ℤ) → (irr : Bool) → Prop
  /-- `l`-adic representation into `GSp_{2n}(O)` with multiplier `ε_l^k`, geometric, with Zariski
  dense image in `GSp_{2n}` (owner: PL.0, R24.5). -/
  IsGeometricDenseGSp : ∀ {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}, G5Rep K l n → Prop
  /-- Decomposition group `G_{K_v} ⊆ G_K` at `v` (owner: Chebotarev/ANT). -/
  decomp : ∀ {K : G5NF}, G5Place K → Subgroup G5GQ
  decomp_le : ∀ {K : G5NF} (v : G5Place K), decomp v ≤ G5GalF K
  /-- Weakly compatible systems of `G_K` of rank `n` (BLGGT §5.1) up to isomorphism (owner:
  PotentialModularityAndCompatibleSystems R24.5). -/
  CompSys : G5NF → ℕ → Type
  /-- The `(l, ι)`-member `r_λ` (`λ` the place of the coefficient field induced by `ι`). -/
  member : ∀ {K : G5NF} {n : ℕ}, CompSys K n → (l : ℕ) → [Fact l.Prime] →
    (PadicAlgCl l ≃+* ℂ) → G5Rep K l n
  /-- The exceptional set `S` of the system. -/
  badSet : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Set (G5Place K)
  /-- The coefficient field `M ⊆ Q̄`. -/
  coeffField : ∀ {K : G5NF} {n : ℕ}, CompSys K n → G5NF
  /-- The common characteristic polynomial `Q_v(X)` of `Frob_v`, `v ∉ S`, as a polynomial over `ℂ`
  through a fixed embedding `M ⊆ ℂ`. -/
  frobPoly : ∀ {K : G5NF} {n : ℕ}, CompSys K n → G5Place K → Polynomial ℂ
  /-- The Hodge–Tate set `H_τ` at `τ : K → ℂ`. -/
  htSet : ∀ {K : G5NF} {n : ℕ}, CompSys K n → (K →+* ℂ) → Multiset ℤ
  /-- Very weak compatibility (BCGNT §5.1). -/
  IsVeryWeaklyCompatible : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  /-- Irreducibility, and strong irreducibility (irreducible after every finite restriction). -/
  IsIrreducibleCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  IsStronglyIrreducible : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  /-- Regular (distinct Hodge–Tate weights), odd essentially self-dual (BLGGT §5.1). -/
  IsRegularCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  IsOddEssSelfDual : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  /-- Strict compatibility (the Weil–Deligne representations at `p ≠ l` are independent of `l`). -/
  IsStrictlyCompatible : ∀ {K : G5NF} {n : ℕ}, CompSys K n → Prop
  /-- `WD_v(R)` is pure of weight `w`: Frobenius eigenvalues on `gr_a` of the monodromy filtration
  are `q_v`-Weil numbers of weight `w + a` (owner: AL.2). -/
  IsWDPureAt : ∀ {K : G5NF} {n : ℕ}, CompSys K n → G5Place K → ℤ → Prop
  /-- Operations: restriction, `Sym^{n−1}` of a rank-two system, tensor product, induction from a
  finite extension, the twist by a character system, the determinant, the cyclotomic system `ε^k`
  and the dual (owner: R24.5:operations). -/
  resCS : ∀ {K K' : G5NF} {n : ℕ}, K ≤ K' → CompSys K n → CompSys K' n
  symCS : ∀ {K : G5NF} (n : ℕ), CompSys K 2 → CompSys K n
  tensorCS : ∀ {K : G5NF} {a b : ℕ}, CompSys K a → CompSys K b → CompSys K (a * b)
  indCS : ∀ {K L : G5NF} {a : ℕ}, K ≤ L → CompSys L a → CompSys K (a * (Module.finrank ℚ L / Module.finrank ℚ K))
  twistCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → CompSys K 1 → CompSys K n
  detCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → CompSys K 1
  cyclo : (K : G5NF) → ℤ → CompSys K 1
  dualCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → CompSys K n
  /-- `L^S(ι R, s)`, the completed `Λ(R, s)` (with the archimedean factors of ML.0) and the
  `ε`-factor, as meromorphic functions given by their values off their poles (owner:
  AutomorphicLFunctionsAndLocalFactors AL.2, ML.0/compatible-system-archimedean-factors). -/
  partialLCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → ℂ → ℂ
  completedLCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → ℂ → ℂ
  epsilonCS : ∀ {K : G5NF} {n : ℕ}, CompSys K n → ℂ → ℂ
  /-- The `l`-adic Tate module representation `r_{E,l}` and the mod-`l` representation `r̄_{E,l}`
  of an elliptic curve over `K` (owner: PotentialModularityAndCompatibleSystems R23.1). -/
  ellRep : ∀ {K : G5NF}, WeierstrassCurve K → (l : ℕ) → [Fact l.Prime] → G5Rep K l 2
  ellResRep : ∀ {K : G5NF}, WeierstrassCurve K → (l : ℕ) → [Fact l.Prime] → G5ResRep K l 2
  /-- `End_{K̄}(E) ≠ ℤ` (owner: R23.1). -/
  HasCM : ∀ {K : G5NF}, WeierstrassCurve K → Prop
  /-- Good, good ordinary, and semistable reduction (owner: R23.1). -/
  HasGoodReductionAt : ∀ {K : G5NF}, WeierstrassCurve K → G5Place K → Prop
  IsOrdinaryReductionAt : ∀ {K : G5NF}, WeierstrassCurve K → G5Place K → Prop
  /-- `#E(k_v)` at a place of good reduction (owner: R23.1). -/
  pointCount : ∀ {K : G5NF}, WeierstrassCurve K → G5Place K → ℕ
  /-- `Sym^{n−1}` of the standard representation, `GL_2 → GL_n` (owner: representation theory
  of `GL_2`, AutomorphicLFunctionsAndLocalFactors AL.3). -/
  symHom : ∀ (R : Type) [CommRing R] (n : ℕ), GL (Fin 2) R →* GL (Fin n) R
  /-- Calegari–Geraghty's Conjecture B: Galois representations with the expected characteristic
  polynomials for the torsion Hecke algebras `T^{an}_{Q,ψ}` of `Res_{F/ℚ} PGL(n)` (owner: the
  proposed PotentialAutomorphyInfrastructure Part II; status conjectural, proved nowhere in the
  atlas). -/
  ConjectureB : Prop

variable (C : G5Context)

/-- `ρ` is automorphic: `ρ ≅ r_{l,ι}(π)` for a cuspidal regular algebraic `π`. -/
def G5Context.IsAutomorphicRep {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}
    (ι : PadicAlgCl l ≃+* ℂ) (ρ : G5Rep K l n) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧ (C.galRep π l ι).Iso ρ

/-- `Sym^{n−1} r` is automorphic (`r` two-dimensional). -/
def G5Context.IsSymAutomorphic {K : G5NF} {l : ℕ} [Fact l.Prime] (ι : PadicAlgCl l ≃+* ℂ)
    (n : ℕ) (r : G5Rep K l 2) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧
    ∃ g : GL (Fin n) (PadicAlgCl l), ∀ σ : G5GalF K,
      C.galRep π l ι σ = g * C.symHom (PadicAlgCl l) n (r σ) * g⁻¹

/-- `r` is ordinarily automorphic (Qian): `r ≅ r_{l,ι}(π)` with `π` cuspidal regular algebraic and
`ι`-ordinary at every `v | l`. -/
def G5Context.IsOrdinarilyAutomorphic {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}
    (ι : PadicAlgCl l ≃+* ℂ) (r : G5Rep K l n) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧
    (∀ v : G5Place K, G5Above v l → C.IsIotaOrdinaryAt π l ι v) ∧ (C.galRep π l ι).Iso r

/-- The local condition of Qian: `r|_{G_{K_v}}` is potentially semistable and ordinary with regular
Hodge–Tate weights at every `v | l`. -/
def G5Context.IsOrdinaryAbove {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ} (r : G5Rep K l n) : Prop :=
  ∀ v : G5Place K, G5Above v l → C.IsPotSemistableAt r v ∧ C.IsOrdinaryAt r v ∧
    ∀ τ, (C.htWeights r τ).Nodup

/-- `r̄` is ordinarily automorphic: it has an ordinarily automorphic lift which is potentially
semistable and ordinary with regular Hodge–Tate weights above `l`. -/
def G5Context.IsOrdinarilyAutomorphicRes {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}
    (ι : PadicAlgCl l ≃+* ℂ) (rbar : G5ResRep K l n) : Prop :=
  ∃ r : G5Rep K l n, (C.reduce r).Iso rbar ∧ C.IsOrdinarilyAutomorphic ι r ∧ C.IsOrdinaryAbove r

/-- `R` is automorphic: there is a regular algebraic isobaric `π` whose Hecke polynomials are the
Frobenius polynomials of `R` at almost all places (cuspidal when `R` is irreducible). -/
def G5Context.IsAutomorphicCS {K : G5NF} {n : ℕ} (R : C.CompSys K n) : Prop :=
  ∃ π : C.AutRep K n, C.IsRegularAlgebraic π ∧
    Set.Finite {v : G5Place K | C.heckePoly π v ≠ C.frobPoly R v}

/-- `R` is weakly automorphic of level prime to `X₀` (BCGNT): a cuspidal regular algebraic `π`,
unramified at `X₀`, has Hecke polynomials equal to the Frobenius polynomials of `R` at almost all
places. -/
def G5Context.IsWeaklyAutomorphicCS {K : G5NF} {n : ℕ} (R : C.CompSys K n)
    (X₀ : Set (G5Place K)) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧
    (∀ v ∈ X₀, C.IsUnramifiedAutAt π v) ∧
    Set.Finite {v : G5Place K | C.heckePoly π v ≠ C.frobPoly R v}

/-- `R` is pure of weight `w`: for `v ∉ S` the roots of `Q_v` are `q_v`-Weil numbers of weight `w`
under every embedding of the coefficient field (every automorphism of `ℂ`). -/
def G5Context.IsPure {K : G5NF} {n : ℕ} (R : C.CompSys K n) (w : ℤ) : Prop :=
  ∀ v : G5Place K, v ∉ C.badSet R → ∀ σ : ℂ ≃+* ℂ,
    ∀ α ∈ ((C.frobPoly R v).map (σ : ℂ →+* ℂ)).roots,
      ‖α‖ ^ 2 = (G5normPlace v : ℝ) ^ (w : ℝ)

/-- `H_τ(R) = {0, m}` for every `τ`. -/
def G5Context.HasHTZeroM {K : G5NF} {n : ℕ} (R : C.CompSys K n) (m : ℤ) : Prop :=
  ∀ τ : K →+* ℂ, C.htSet R τ = {0, m}

/-- The places of `K` above the places of a set `X₀ ⊆ K` restricted to `K′ ⊇ K`. -/
def G5placesAbove {K K' : G5NF} (h : K ≤ K') (X₀ : Set (G5Place K)) : Set (G5Place K') :=
  {w | ∃ v ∈ X₀, ∀ (x : 𝓞 K) (y : 𝓞 K'), (((x : K) : G5Qbar) = ((y : K') : G5Qbar)) →
    (x ∈ v.1 ↔ y ∈ w.1)}

/-- `Sym^{n−1} ∘ r̄` for a two-dimensional residual representation. -/
def G5Context.symRes {H : Subgroup G5GQ} {l : ℕ} [Fact l.Prime] (n : ℕ) (r : G5ResRepOn H l 2) :
    G5ResRepOn H l n :=
  ⟨(C.symHom _ n).comp r.1, Subgroup.isOpen_mono (fun x hx => by
    simp only [MonoidHom.mem_ker, MonoidHom.comp_apply] at hx ⊢; rw [hx, map_one]) r.2⟩

/-- `r̄` is ordinarily automorphic of weight `0` and level prime to `𝓛` (ACC+): `r̄ ≅ r̄_{l,ι}(π)`
for a cuspidal regular algebraic polarizable `π` of weight `0`, `ι`-ordinary above `l` and
unramified above `𝓛`. -/
def G5Context.IsOrdAutWeightZero {K : G5NF} {l : ℕ} [Fact l.Prime] {n : ℕ}
    (ι : PadicAlgCl l ≃+* ℂ) (rbar : G5ResRep K l n) (𝓛 : Finset ℕ) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧ C.IsPolarizable π ∧
    C.weight π = 0 ∧ (∀ v : G5Place K, G5Above v l → C.IsIotaOrdinaryAt π l ι v) ∧
    (∀ p ∈ 𝓛, ∀ v : G5Place K, G5Above v p → C.IsUnramifiedAutAt π v) ∧
    (C.reduce (C.galRep π l ι)).Iso rbar

/-- `v(t) < 0`: every way of writing `t = a/b` with `a, b ∈ 𝓞_K` has `b ∈ v`. -/
def G5NegVal {K : G5NF} (v : G5Place K) (t : K) : Prop :=
  ∀ a b : 𝓞 K, (b : K) * t = (a : K) → b ∈ v.1

/-- `TauCeti.PotentialAutomorphy.qian_residual` (ML.2/qian-residual-potential-automorphy; Qian,
Theorem 1.1): for `F` CM, `F^{av} ⊇ F` finite, `n ≥ 2` and `r̄ : G_F → GL_n(F̄_l)` semisimple, there
is a finite CM Galois `F′/F`, linearly disjoint from `F^{av}` over `F`, with `r̄|_{G_{F′}}`
ordinarily automorphic. (`r̄` takes values in some `GL_n(F_{l^s}) ⊆ GL_n(F̄_l)` since its kernel is
open.) -/
theorem qian_residual (F Fav : G5NF) [FiniteDimensional ℚ F] [FiniteDimensional ℚ Fav]
    (hF : IsCMField F) (hFav : F ≤ Fav) (n : ℕ) (hn : 2 ≤ n) (l : ℕ) [Fact l.Prime]
    (ι : PadicAlgCl l ≃+* ℂ) (rbar : G5ResRep F l n) (hss : G5ResRepOn.IsSemisimple rbar) :
    ∃ (F' : G5NF) (h : F ≤ F'), FiniteDimensional ℚ F' ∧ IsCMField F' ∧ G5IsGaloisOver F F' ∧
      G5LinDisjointOver F F' Fav ∧ C.IsOrdinarilyAutomorphicRes ι (G5ResRep.res h rbar) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.qian_ordinary` (ML.2/qian-ordinary-potential-automorphy; Qian,
Theorem 1.4): `F` CM, `l > n ≥ 2`, `r : G_F → GL_n(Q̄_l)` (i) unramified almost everywhere, (ii)
potentially semistable and ordinary with regular Hodge–Tate weights above `l`, (iii) `r̄`
absolutely irreducible, decomposed generic with `r̄(G_{F(ζ_l)})` enormous, (iv) some
`σ ∈ G_F − G_{F(ζ_l)}` with `r̄(σ)` scalar. Then `r|_{G_{F′}}` is ordinarily automorphic for a
finite CM Galois `F′/F` linearly disjoint from `F^{av}`. -/
theorem qian_ordinary (F Fav : G5NF) [FiniteDimensional ℚ F] [FiniteDimensional ℚ Fav]
    (hF : IsCMField F) (hFav : F ≤ Fav) (n : ℕ) (hn : 2 ≤ n) (l : ℕ) [Fact l.Prime] (hl : n < l)
    (ι : PadicAlgCl l ≃+* ℂ) (r : G5Rep F l n)
    (h1 : Set.Finite {v : G5Place F | ¬ C.IsUnramifiedAt r v})
    (h2 : C.IsOrdinaryAbove r)
    (h3 : G5ResRepOn.IsIrreducible (C.reduce r) ∧ C.IsDecomposedGeneric (C.reduce r) ∧
      C.IsEnormous (G5ResRepOn.image (C.reduce r) (G5GalF (G5adjZeta F l))))
    (h4 : ∃ σ : G5GalF F, (σ : G5GQ) ∉ G5GalF (G5adjZeta F l) ∧ G5IsScalar ((C.reduce r).1 σ)) :
    ∃ (F' : G5NF) (h : F ≤ F'), FiniteDimensional ℚ F' ∧ IsCMField F' ∧ G5IsGaloisOver F F' ∧
      G5LinDisjointOver F F' Fav ∧ C.IsOrdinarilyAutomorphic ι (G5Rep.res h r) := by
  sorry

/-- `E/ℚ` has good reduction at the rational prime `p` (at the place of `⊥ ≅ ℚ` above `p`). -/
def G5Context.GoodAt (E : WeierstrassCurve (⊥ : G5NF)) (p : ℕ) : Prop :=
  ∀ v : G5Place (⊥ : G5NF), G5Above v p → C.HasGoodReductionAt E v

/-- `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime` (ML.2/qian-auxiliary-prime; Qian §4,
Proposition 4.1, corrections E7, E36): for a non-CM `E/ℚ`, there are an odd `N > 100n + 100` prime to
`ln`, to the primes ramified in `F^{av}` or in `Q̄^{ker r̄}` and to the bad primes of `E`, with
`F_{l²} ⊆ F_l(ζ_N)` and `ℚ(ζ_N)` linearly disjoint from `F^{avoid}` (the normal closure of
`F^{av} Q̄^{ker r̄}(ζ_l)`), and a prime `l′ > 2n + 1`, `l′ ∤ N`, unramified in `F^{avoid}`, with `E`
good ordinary at `l′` and `r̄_{E,l′}(G_ℚ) = GL_2(F_{l′})`.
-- NOTE: the packet statement refers to "the parity conditions of Qian's list", to the
-- containment `F′ ⊆ F_l(ζ_N)` for the field `F′` of `m`-th roots of `F_{l^s}` and to "the remaining
-- conditions of the list" without stating them; only the explicit conditions are formalised. -/
theorem qian_auxiliaryPrime (F Fav : G5NF) [FiniteDimensional ℚ F] [FiniteDimensional ℚ Fav]
    (hFav : F ≤ Fav) (n l : ℕ) [Fact l.Prime] (rbar : G5ResRep F l n)
    (E : WeierstrassCurve (⊥ : G5NF)) [E.IsElliptic] (hE : ¬ C.HasCM E) :
    let Favoid : G5NF := IntermediateField.normalClosure ℚ (G5adjZeta (Fav ⊔ rbar.kerField) l) G5Qbar
    ∃ N : ℕ, Odd N ∧ 100 * n + 100 < N ∧ Nat.Coprime N (l * n) ∧
      (∀ p : ℕ, p.Prime → p ∣ N →
        G5UnramifiedIn p Fav ∧ G5UnramifiedIn p rbar.kerField ∧ C.GoodAt E p) ∧
      2 ∣ orderOf (l : ZMod N) ∧ G5LinDisjointOver ⊥ (G5adjZeta ⊥ N) Favoid ∧
      ∃ l' : ℕ, ∃ _ : Fact l'.Prime, 2 * n + 1 < l' ∧ ¬ l' ∣ N ∧ G5UnramifiedIn l' Favoid ∧
        C.GoodAt E l' ∧
        (∀ v : G5Place (⊥ : G5NF), G5Above v l' → C.IsOrdinaryReductionAt E v) ∧
        G5ResRepOn.image (C.ellResRep E l') (G5GalF ⊥) = G5GL2 l' := by
  sorry

/-- `TauCeti.PotentialAutomorphy.ellipticSeed` (ML.2/elliptic-symmetric-power-seed; Qian
Proposition 4.1, ACC+ Corollary 7.2.4): with `E`, `l′`, `N`, `F^{avoid}` as in
`qian_auxiliaryPrime`, there are a finite Galois `F_2^{avoid}/ℚ` and a finite totally real Galois
`F^{suff}/ℚ` unramified above `N`, with `F_2^{avoid} ∩ F^{avoid} = ℚ`,
`F^{suff} ∩ F^{avoid}F_2^{avoid} = ℚ`, `Q̄^{ker r̄_{E,l′}} ⊆ F_2^{avoid}`, `F^{avoid}`, `F_2^{avoid}`
unramified above `N`, such that `Sym^{n−1} r_{E,l′}|_{G_{F′}}` is automorphic for every finite
totally real `F′ ⊇ F^{suff}` with `F′ ∩ F_2^{avoid} = ℚ`. -/
theorem ellipticSeed (E : WeierstrassCurve (⊥ : G5NF)) [E.IsElliptic] (hE : ¬ C.HasCM E)
    (n N l' : ℕ) [Fact l'.Prime] (ι' : PadicAlgCl l' ≃+* ℂ) (hl' : 2 * n + 1 < l')
    (hgood : C.GoodAt E l')
    (hord : ∀ v : G5Place (⊥ : G5NF), G5Above v l' → C.IsOrdinaryReductionAt E v)
    (himage : G5ResRepOn.image (C.ellResRep E l') (G5GalF ⊥) = G5GL2 l')
    (Favoid : G5NF) [FiniteDimensional ℚ Favoid] (hFavoid : G5IsGaloisOver ⊥ Favoid)
    (hN : ∀ p : ℕ, p.Prime → p ∣ N → G5UnramifiedIn p Favoid) :
    ∃ F2av Fsuff : G5NF, FiniteDimensional ℚ F2av ∧ FiniteDimensional ℚ Fsuff ∧
      G5IsGaloisOver ⊥ F2av ∧ G5IsGaloisOver ⊥ Fsuff ∧ IsTotallyReal Fsuff ∧
      F2av ⊓ Favoid = ⊥ ∧ Fsuff ⊓ (Favoid ⊔ F2av) = ⊥ ∧
      (C.ellResRep E l').kerField ≤ F2av ∧
      (∀ p : ℕ, p.Prime → p ∣ N → G5UnramifiedIn p Fsuff ∧ G5UnramifiedIn p F2av) ∧
      ∀ F' : G5NF, FiniteDimensional ℚ F' → IsTotallyReal F' → Fsuff ≤ F' → F' ⊓ F2av = ⊥ →
        C.IsSymAutomorphic ι' n (G5Rep.res (bot_le : (⊥ : G5NF) ≤ F') (C.ellRep E l')) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.dworkTransport` (ML.2/dwork-fibre-automorphy-transport; Qian §4,
correction E40): let `V` be the compatible system of the Dwork fibre at the point `t ∈ F′`. (a) If
`V̄_{λ′} ⊗ χ̄₂^{−1} ≅ Sym^{n−1} r̄_{E,l′}|_{G_{F′}}`, `Sym^{n−1} r_{E,l′}|_{G_{F′}}` is automorphic and the
hypotheses of ACC+ Theorem 6.1.2 hold at `l′` (ordinary, `l′ > 2n + 1`, enormous image, decomposed
generic), then `V_{λ′} ⊗ χ₂^{−1}` is automorphic; (b) hence every member `V_λ` is automorphic (the
character system `χ₂` being automorphic). -/
theorem dworkTransport (F' : G5NF) [FiniteDimensional ℚ F'] (n : ℕ)
    (E : WeierstrassCurve (⊥ : G5NF)) (V : C.CompSys F' n) (χ₂ : C.CompSys F' 1)
    (hχ₂ : C.IsAutomorphicCS χ₂) (l' : ℕ) [Fact l'.Prime] (ι' : PadicAlgCl l' ≃+* ℂ)
    (hl' : 2 * n + 1 < l')
    (hseed : C.IsSymAutomorphic ι' n (G5Rep.res (bot_le : (⊥ : G5NF) ≤ F') (C.ellRep E l')))
    (hcong : G5ResRepOn.Iso (C.reduce (C.member (C.twistCS V (C.dualCS χ₂)) l' ι'))
      (C.symRes n (G5ResRep.res (bot_le : (⊥ : G5NF) ≤ F') (C.ellResRep E l'))))
    (hordinary : C.IsOrdinaryAbove (C.member (C.twistCS V (C.dualCS χ₂)) l' ι'))
    (henormous : C.IsEnormous (G5ResRepOn.image
      (C.reduce (C.member (C.twistCS V (C.dualCS χ₂)) l' ι')) (G5GalF (G5adjZeta F' l'))))
    (hgeneric : C.IsDecomposedGeneric (C.reduce (C.member (C.twistCS V (C.dualCS χ₂)) l' ι'))) :
    C.IsAutomorphicRep ι' (C.member (C.twistCS V (C.dualCS χ₂)) l' ι') ∧
      ∀ (l : ℕ) [Fact l.Prime] (ι : PadicAlgCl l ≃+* ℂ), C.IsAutomorphicRep ι (C.member V l ι) := by
  sorry

/-- The Dwork family: the compatible system `V_t` of the fibre at `t ∈ K` of the Dwork family of
degree `N` and rank `n` (owner: PotentialAutomorphyInfrastructurePartII PL.5). -/
structure G5DworkFamily (C : G5Context) where
  /-- `t ↦ V_t`. -/
  fibre : ∀ {K : G5NF} (N n : ℕ), K → C.CompSys K n

/-- `TauCeti.PotentialAutomorphy.steinbergOrdinary` (ML.2/steinberg-ordinarity-lemma; Qian
Lemma 4.3, corrections E1, E41, E43): if `v(t) < 0` at every place `v | l`, the `l`-adic realisation
`V_{λ,t}` is ordinary with regular Hodge–Tate weights above `l`, and every cuspidal `π` with
`r_ι(π) ≅ V_{λ,t}` has `π_v` an unramified twist of Steinberg (maximal monodromy), hence is
`ι`-ordinary, at those places.
-- NOTE: the explicit weights `λ_{σ,i} = M(a_σ)` and slope exponents are not formalised. -/
theorem steinbergOrdinary (D : G5DworkFamily C) (K : G5NF) [FiniteDimensional ℚ K] (N n : ℕ)
    (t : K) (l : ℕ) [Fact l.Prime] (ι : PadicAlgCl l ≃+* ℂ)
    (ht : ∀ v : G5Place K, G5Above v l → G5NegVal v t) :
    (∀ v : G5Place K, G5Above v l → C.IsOrdinaryAt (C.member (D.fibre N n t) l ι) v ∧
      ∀ τ, (C.htWeights (C.member (D.fibre N n t) l ι) τ).Nodup) ∧
    ∀ π : C.AutRep K n, C.IsCuspidal π → (C.galRep π l ι).Iso (C.member (D.fibre N n t) l ι) →
      ∀ v : G5Place K, G5Above v l → C.IsSteinbergTwistAt π v ∧ C.IsIotaOrdinaryAt π l ι v := by
  sorry

/-- `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary` (ML.2/galois-ordinarity-from-automorphic;
ACC+ Corollary 5.5.2, Qian Remark 4.4): `F` imaginary CM, `π` cuspidal regular algebraic,
`ι`-ordinary at every `v | p`, `r̄_ι(π)` decomposed generic and irreducible: then `r_ι(π)|_{G_{F_v}}`
is ordinary for every `v | p`. -/
theorem ordinary_of_iotaOrdinary (F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F) (n p : ℕ)
    [Fact p.Prime] (ι : PadicAlgCl p ≃+* ℂ) (π : C.AutRep F n) (hπ : C.IsCuspidal π)
    (hra : C.IsRegularAlgebraic π) (hord : ∀ v : G5Place F, G5Above v p → C.IsIotaOrdinaryAt π p ι v)
    (hgen : C.IsDecomposedGeneric (C.reduce (C.galRep π p ι)))
    (hirr : G5ResRepOn.IsIrreducible (C.reduce (C.galRep π p ι))) :
    ∀ v : G5Place F, G5Above v p → C.IsOrdinaryAt (C.galRep π p ι) v := by
  sorry

/-- `TauCeti.PotentialAutomorphy.acc_symplectic` (ML.2/acc-symplectic-potential-automorphy; ACC+
Proposition 7.2.3): `F/F₀` Galois totally real, finitely many `r̄_i : G_F → GSp_{n_i}(F̄_{l_i})`
(`n_i` even, `l_i` odd) with open kernel and multiplier `ε̄^{1−n_i}`, unramified above a finite set
`𝓛` of primes unramified in `F` and `≠ l_i`, and `F^{avoid}/F` finite Galois. Then there are finite
Galois `F^{suffices}/F₀ ⊇ F` and `F₁^{avoid}/ℚ`, with the stated disjointness and `F^{suffices}`
unramified above `𝓛`, such that every `r̄_i|_{G_{F′}}` is ordinarily automorphic of weight `0` and
level prime to `𝓛` for each finite totally real `F′ ⊇ F^{suffices}` linearly disjoint from
`F₁^{avoid}`. -/
theorem acc_symplectic (F₀ F Favoid : G5NF) [FiniteDimensional ℚ F] [FiniteDimensional ℚ Favoid]
    (hF₀ : IsTotallyReal F₀) (hF : IsTotallyReal F) (hgal : G5IsGaloisOver F₀ F)
    (hFav : G5IsGaloisOver F Favoid) {I : Type} [Finite I] (nI lI : I → ℕ)
    [∀ i, Fact (lI i).Prime] (hn : ∀ i, Even (nI i)) (hodd : ∀ i, lI i ≠ 2)
    (ι : ∀ i, PadicAlgCl (lI i) ≃+* ℂ) (rbar : ∀ i, G5ResRep F (lI i) (nI i))
    (hsymp : ∀ i, C.IsSymplecticRes (rbar i) (1 - (nI i : ℤ)) false) (𝓛 : Finset ℕ)
    (h𝓛 : ∀ p ∈ 𝓛, p.Prime ∧ G5UnramifiedIn p F ∧ ∀ i, p ≠ lI i)
    (hunr : ∀ i, ∀ p ∈ 𝓛, G5UnramifiedIn p (rbar i).kerField) :
    ∃ (Fsuff F1av : G5NF) (hFs : F ≤ Fsuff), FiniteDimensional ℚ Fsuff ∧
      FiniteDimensional ℚ F1av ∧ G5IsGaloisOver F₀ Fsuff ∧ G5IsGaloisOver ⊥ F1av ∧
      G5LinDisjointOver F Fsuff (Favoid ⊔ F1av) ∧ G5LinDisjointOver ⊥ F1av Favoid ∧
      (∀ p ∈ 𝓛, G5UnramifiedIn p Fsuff) ∧
      ∀ (F' : G5NF) (h : Fsuff ≤ F'), FiniteDimensional ℚ F' → IsTotallyReal F' →
        G5LinDisjointOver ⊥ F' F1av →
        ∀ i, C.IsOrdAutWeightZero (ι i) (G5ResRep.res (hFs.trans h) (rbar i)) 𝓛 := by
  sorry

/-- `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes` (ML.2/acc-auxiliary-primes; ACC+ Assumption
7.2.6): for `F/F₀` Galois CM, a finite set `𝓛₀`, strongly irreducible rank-two very weakly compatible
systems `R_i` with `H_τ = {0, 1}`, `S_i` prime to `𝓛₀`, and integers `m_i > 0`, there are a non-CM
`E/ℚ` with good reduction above `𝓛₀`, distinct primes `l₁, l₂` and `λ_i | l₂` (given by `ι_i`) with
(1)–(7) and (6′) of the packet statement. -/
theorem acc_auxiliaryPrimes (F₀ F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F)
    (hgal : G5IsGaloisOver F₀ F) (𝓛₀ : Finset ℕ) {I : Type} [Finite I] (R : I → C.CompSys F 2)
    (hR : ∀ i, C.IsStronglyIrreducible (R i) ∧ C.IsVeryWeaklyCompatible (R i) ∧
      C.HasHTZeroM (R i) 1)
    (hS : ∀ i, ∀ v ∈ C.badSet (R i), ∀ p ∈ 𝓛₀, ¬ G5Above v p) (m : I → ℕ) (hm : ∀ i, 0 < m i) :
    ∃ (E : WeierstrassCurve (⊥ : G5NF)) (_ : E.IsElliptic), ¬ C.HasCM E ∧
      (∀ p ∈ 𝓛₀, C.GoodAt E p) ∧
      ∃ (l₁ l₂ : ℕ) (_ : Fact l₁.Prime) (_ : Fact l₂.Prime) (ι : I → PadicAlgCl l₂ ≃+* ℂ),
        l₁ ≠ l₂ ∧
        (∀ i, G5SplitsCompletely l₂ (C.coeffField (R i))) ∧
        (∃ g, ∀ h ∈ G5SL2 l₁, g * h * g⁻¹ ∈ G5ResRepOn.image (C.ellResRep E l₁) (G5GalF F)) ∧
        (∀ i, ∃ g, ∀ h ∈ G5SL2 l₂,
          g * h * g⁻¹ ∈ G5ResRepOn.image (C.reduce (C.member (R i) l₂ (ι i))) (G5GalF F)) ∧
        G5UnramifiedIn l₁ F ∧ G5UnramifiedIn l₂ F ∧ C.GoodAt E l₁ ∧ C.GoodAt E l₂ ∧
        (∀ i, ∀ v ∈ C.badSet (R i), ¬ G5Above v l₁ ∧ ¬ G5Above v l₂) ∧
        (∀ i, 2 * m i + 3 < l₁ ∧ 2 * m i + 3 < l₂) ∧
        (∀ i, (m i + 1) ^ 2 < l₁ ∧ (m i + 1) ^ 2 < l₂) ∧
        (∀ i, ∀ v : G5Place F, G5Above v l₂ →
          C.IsCrystallineAt (C.member (R i) l₂ (ι i)) v ∧
          ∀ τ, C.htWeights (C.member (R i) l₂ (ι i)) τ = {0, 1}) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.withSteinbergPlace` (ML.2/potential-automorphy-with-steinberg-place;
Fakhruddin–Khare–Patrikis, proof of Proposition 9.1, E34): for `p ≫_n 0`, `F` totally real,
`ρ̄ : Γ_F → GSp_{2n}(F̄_p)` with multiplier `κ̄^{1−2n}`, absolutely `GSp_{2n}`-irreducible on
`Γ_{F(ζ_p)}`, and `v₀` with `ρ̄|_{Γ_{F_{v₀}}} = 1`, `N(v₀) ≡ 1 mod p`, there are a Galois totally real
`F′/F` linearly disjoint from `F(ρ̄, ζ_p)` and a RAESDC `Π` of `GL_{2n}(𝔸_{F′})` with
`r̄_ι(Π) ≅ ρ̄|_{Γ_{F′}}` and `Π_w` an unramified twist of Steinberg for every `w | v₀`. The hypothesis
`hgap` (each minimal `ρ̄`-stable subspace stays irreducible on `Γ_{F(ζ_p)}`) records the gap of FKP's
proof. -- NOTE: the self-duality of the constituents in that gap hypothesis is not formalised. -/
theorem withSteinbergPlace (n : ℕ) :
    ∃ p₀ : ℕ, ∀ (p : ℕ) [Fact p.Prime], p₀ < p → ∀ (F : G5NF) [FiniteDimensional ℚ F],
      IsTotallyReal F → ∀ (ι : PadicAlgCl p ≃+* ℂ) (ρbar : G5ResRep F p (2 * n)),
      C.IsSymplecticRes ρbar (1 - 2 * (n : ℤ)) false →
      C.IsSymplecticRes (G5ResRep.res (le_sup_left : F ≤ G5adjZeta F p) ρbar)
        (1 - 2 * (n : ℤ)) true →
      (∀ W, G5ResRepOn.IsStable ρbar W → W ≠ ⊥ →
        (∀ W', G5ResRepOn.IsStable ρbar W' → W' ≤ W → W' = ⊥ ∨ W' = W) →
        ∀ W', G5ResRepOn.IsStable (G5ResRep.res (le_sup_left : F ≤ G5adjZeta F p) ρbar) W' →
          W' ≤ W → W' = ⊥ ∨ W' = W) →
      ∀ v₀ : G5Place F, (∀ σ : G5GalF F, (σ : G5GQ) ∈ C.decomp v₀ → ρbar.1 σ = 1) →
        G5normPlace v₀ % p = 1 →
        ∃ (F' : G5NF) (h : F ≤ F'), FiniteDimensional ℚ F' ∧ IsTotallyReal F' ∧
          G5IsGaloisOver F F' ∧ G5LinDisjointOver F F' (G5adjZeta ρbar.kerField p) ∧
          ∃ Pi : C.AutRep F' (2 * n), C.IsCuspidal Pi ∧ C.IsRegularAlgebraic Pi ∧ C.IsPolarizable Pi ∧
            (C.reduce (C.galRep Pi p ι)).Iso (G5ResRep.res h ρbar) ∧
            ∀ w ∈ G5placesAbove h {v₀}, C.IsSteinbergTwistAt Pi w := by
  sorry

/-- `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic`
(ML.2/compatible-system-from-potential-automorphy; FKP after BLGGT 5.5.1): a geometric
`ρ : Γ_F → GSp_{2n}(O′)` with Zariski-dense image, `F` totally real, with `ρ|_{Γ_{F′}} ≅ r_ι(Π)` for a
RAESDC `Π` over a Galois totally real `F′/F`, lies in a strictly pure compatible system whose members
all have Zariski-dense image in `GSp_{2n}`. -/
theorem compatibleSystem_of_potentiallyAutomorphic (F F' : G5NF) [FiniteDimensional ℚ F]
    [FiniteDimensional ℚ F'] (hF : IsTotallyReal F) (hF' : IsTotallyReal F')
    (hgal : G5IsGaloisOver F F') (hle : F ≤ F') (n l : ℕ) [Fact l.Prime]
    (ι : PadicAlgCl l ≃+* ℂ) (ρ : G5Rep F l (2 * n)) (hρ : C.IsGeometricDenseGSp ρ)
    (Pi : C.AutRep F' (2 * n)) (hPi : C.IsCuspidal Pi ∧ C.IsRegularAlgebraic Pi ∧ C.IsPolarizable Pi)
    (hiso : (C.galRep Pi l ι).Iso (G5Rep.res hle ρ)) :
    ∃ R : C.CompSys F (2 * n), (C.member R l ι).Iso ρ ∧ (∃ w : ℤ, C.IsPure R w ∧
      ∀ v : G5Place F, C.IsWDPureAt R v w) ∧ C.IsStrictlyCompatible R ∧
      ∀ (l' : ℕ) [Fact l'.Prime] (ι' : PadicAlgCl l' ≃+* ℂ),
        C.IsGeometricDenseGSp (C.member R l' ι') := by
  sorry

/-- `TauCeti.PotentialAutomorphy.patrikisTaylor` (ML.2/patrikis-taylor-potential-automorphy;
Patrikis–Taylor Theorem A, as quoted by Fresán–Sabbah–Yu 5.38): a weakly compatible system of `G_ℚ`
that is pure, regular and odd essentially self-dual becomes automorphic over some finite Galois
totally real `F′` (irreducibility is not assumed, so automorphy is with an isobaric `π`). -/
theorem patrikisTaylor (m : ℕ) (R : C.CompSys (⊥ : G5NF) m) (w : ℤ) (hpure : C.IsPure R w)
    (hreg : C.IsRegularCS R) (hodd : C.IsOddEssSelfDual R) :
    ∃ F' : G5NF, FiniteDimensional ℚ F' ∧ IsTotallyReal F' ∧ G5IsGaloisOver ⊥ F' ∧
      C.IsAutomorphicCS (C.resCS (bot_le : (⊥ : G5NF) ≤ F') R) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.patrikisTaylor_lFunction`
(ML.2/patrikis-taylor-l-function-consequences; Patrikis–Taylor Corollary 2.2): under the hypotheses
of `patrikisTaylor`, every `WD_p(R)` is pure of weight `w`, `R` is strictly compatible, and the
completed `Λ(R, s)` continues meromorphically with `Λ(R, s) = ε(R, s) Λ(R^∨, 1 − s)`. -/
theorem patrikisTaylor_lFunction (m : ℕ) (R : C.CompSys (⊥ : G5NF) m) (w : ℤ)
    (hpure : C.IsPure R w) (hreg : C.IsRegularCS R) (hodd : C.IsOddEssSelfDual R) :
    (∀ v : G5Place (⊥ : G5NF), C.IsWDPureAt R v w) ∧ C.IsStrictlyCompatible R ∧
      (∃ g : ℂ → ℂ, MeromorphicOn g Set.univ ∧
        ∀ s : ℂ, (w : ℝ) / 2 + 1 < s.re → g s = C.completedLCS R s) ∧
      ∀ᶠ s in Filter.codiscrete ℂ,
        C.completedLCS R s = C.epsilonCS R s * C.completedLCS (C.dualCS R) (1 - s) := by
  sorry

/-- `E/F` is potentially modular: `r_{E,l}|_{G_{F′}} ≅ r_{l,ι}(π)` for a cuspidal regular algebraic
`π` of `GL_2(𝔸_{F′})`, some finite `F′ ⊇ F` (one `l` suffices by compatibility). -/
def G5Context.IsPotentiallyModular {F : G5NF} (E : WeierstrassCurve F) : Prop :=
  ∃ (F' : G5NF) (h : F ≤ F'), FiniteDimensional ℚ F' ∧
    ∃ (l : ℕ) (_ : Fact l.Prime) (ι : PadicAlgCl l ≃+* ℂ),
      C.IsAutomorphicRep ι (G5Rep.res h (C.ellRep E l))

/-- `TauCeti.PotentialAutomorphy.cg18_potentialModularity` (ML.2/cg18-conditional-potential-
modularity; Calegari–Geraghty Theorem 1.1(1)): assuming Conjecture B, every elliptic curve over any
number field is potentially modular. Status: conditional. -/
theorem cg18_potentialModularity (hB : C.ConjectureB) (F : G5NF) [FiniteDimensional ℚ F]
    (E : WeierstrassCurve F) [E.IsElliptic] : C.IsPotentiallyModular E := by
  sorry

/-- `TauCeti.PotentialAutomorphy.cg18_oddSymPowers` (ML.2/cg18-odd-symmetric-powers;
Calegari–Geraghty §10): assuming Conjecture B, for `A/K` with `End_ℂ(A) = ℤ`, every odd symmetric
power `Sym^{2n−1} ρ_{A,p}` is potentially modular (the special case with `p` totally split,
`N₂ > 2n + 1`, `ρ̄_{A,p}|_{G_{ℚ_p}} ≅ Ind ω₂` reduces the general one through a point of the twisted
modular curve `X_A(q)`). -/
theorem cg18_oddSymPowers (hB : C.ConjectureB) (K : G5NF) [FiniteDimensional ℚ K]
    (A : WeierstrassCurve K) [A.IsElliptic] (hA : ¬ C.HasCM A) (n : ℕ) (hn : 1 ≤ n) (p : ℕ)
    [Fact p.Prime] (ι : PadicAlgCl p ≃+* ℂ) :
    ∃ (K' : G5NF) (h : K ≤ K'), FiniteDimensional ℚ K' ∧
      C.IsSymAutomorphic ι (2 * n) (G5Rep.res h (C.ellRep A p)) := by
  sorry

/-- The residual representation `r̄_λ` of a member of `R` is automorphic of level prime to `X₀`:
`r̄_λ ≅ r̄_{l,ι}(π)` for a cuspidal regular algebraic `π` unramified at `X₀`. This is the reading of
"automorphy at the prime `p` (weakly, of level prime to `X₀`)" adopted for `prSwitch`. -/
def G5Context.IsResAutomorphicMember {K : G5NF} {n : ℕ} (R : C.CompSys K n) (l : ℕ) [Fact l.Prime]
    (ι : PadicAlgCl l ≃+* ℂ) (X₀ : Set (G5Place K)) : Prop :=
  ∃ π : C.AutRep K n, C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧
    (∀ v ∈ X₀, C.IsUnramifiedAutAt π v) ∧
    (C.reduce (C.galRep π l ι)).Iso (C.reduce (C.member R l ι))

/- REVIEW GAP (ML.2/p-r-switch): BCGNT Proposition 6.2.3 concludes that
Sym^{n−1}R is weakly automorphic of level prime to X₀ under seventeen explicit conditions,
with R_CM, R_aux and S_UA, residual isomorphisms and local connects relations. The former
G5PRSwitchData.Holds and residual-characteristic iff did not state this theorem and are removed.
The packet records the actual conditions and proof. Omit the suggested signature until those
objects and the specialized Theorem 3.2.1 lifting/descent exports can be typed honestly. -/

/-- `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower`
(ML.2/potential-weak-automorphy-symmetric-powers; BCGNT Theorem 6.2.4): `F` imaginary CM, `R` a
strongly irreducible very weakly compatible system of rank 2 with `H_τ = {0, m}` (`m ≥ 2`) and
`det r_λ = ε^{−m}`, `v₀ ∉ S`: for every `n ≥ 1` there is a CM `F_n/F`, Galois over `ℚ`, with
`Sym^{n−1}R|_{G_{F_n}}` weakly automorphic of level prime to the places above `v₀`. -/
theorem weakAutomorphy_symPower (F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F) (m : ℕ)
    (hm : 2 ≤ m) (R : C.CompSys F 2)
    (hR : C.IsStronglyIrreducible R ∧ C.IsVeryWeaklyCompatible R ∧ C.HasHTZeroM R m)
    (hdet : C.detCS R = C.cyclo F (-(m : ℤ))) (v₀ : G5Place F) (hv₀ : v₀ ∉ C.badSet R) (n : ℕ)
    (hn : 1 ≤ n) :
    ∃ (Fn : G5NF) (h : F ≤ Fn), FiniteDimensional ℚ Fn ∧ IsCMField Fn ∧ G5IsGaloisOver ⊥ Fn ∧
      C.IsWeaklyAutomorphicCS (C.resCS h (C.symCS n R)) (G5placesAbove h {v₀}) := by
  sorry

section TwistedModularCurve

open CategoryTheory AlgebraicGeometry

/-- `G_K = Gal(K̄/K)` for a field `K` given as a type. -/
abbrev G5Gal (K : Type) [Field K] : Type := AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K

/-- `L`-points of a `K`-scheme `X`: `K`-morphisms `Spec L → X`. -/
abbrev G5Points {K : Type} [Field K] (L : Type) [Field L] [Algebra K L]
    (X : Over (Spec (CommRingCat.of K))) : Type :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ X

/-- Supplier interface for modular curves over a number field `K`. -/
structure G5CurveContext (K : Type) [Field K] [NumberField K] where
  /-- The modular curve `X(q)_K` of full level `q` with Weil pairing identified with the standard
  pairing (owner: tauceti ModularCurves layers 5 and 10). -/
  modularCurve : ℕ → Over (Spec (CommRingCat.of K))
  /-- `X₀(q)_K` (owner: tauceti ModularCurves layer 10). -/
  modularCurveX0 : ℕ → Over (Spec (CommRingCat.of K))
  /-- `ℙ¹_K`. -/
  projectiveLine : Over (Spec (CommRingCat.of K))
  /-- The Galois twist of `X(q)_K` by a homomorphism `G_K → GL_2(ℤ/q)` acting through the
  level structure (owner: SchemeAndStackFoundations, Galois descent). -/
  twistCurve : (q : ℕ) → (G5Gal K →* GL (Fin 2) (ZMod q)) → Over (Spec (CommRingCat.of K))
  /-- The Galois action on `E[q]` in a symplectic basis (owner: PotentialModularityAndCompatible-
  Systems R23.1). -/
  torsionRep : WeierstrassCurve K → (q : ℕ) → G5Gal K →* GL (Fin 2) (ZMod q)
  /-- Cuspidal `L`-points. -/
  IsCusp : ∀ {X : Over (Spec (CommRingCat.of K))} (L : Type) [Field L] [Algebra K L],
    G5Points L X → Prop
  /-- Isomorphism classes of pairs `(A/L, φ : A[q] ≅ E[q])`, `φ` compatible with the Weil
  pairings (owner: R23.1). -/
  LevelPairs : (L : Type) → [Field L] → [Algebra K L] → WeierstrassCurve K → ℕ → Type
  /-- The geometric genus of a curve over `K`. -/
  genus : Over (Spec (CommRingCat.of K)) → ℕ
  /-- Geometric connectedness. -/
  IsGeometricallyConnected : Over (Spec (CommRingCat.of K)) → Prop

variable {K : Type} [Field K] [NumberField K]

/-- `E[q]` is an irreducible `F_q[G_K]`-module. -/
def G5CurveContext.TorsionIrreducible (S : G5CurveContext K) (E : WeierstrassCurve K) (q : ℕ) :
    Prop :=
  ∀ W : AddSubgroup (Fin 2 → ZMod q),
    (∀ σ : G5Gal K, ∀ w ∈ W, ((S.torsionRep E q σ : GL (Fin 2) (ZMod q)) :
      Matrix (Fin 2) (Fin 2) (ZMod q)).mulVec w ∈ W) → W = ⊥ ∨ W = ⊤

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve` (ML.2/twisted-modular-curve): the twisted
modular curve `X_E(q)` over `K`, the twist of `X(q)_K` by the Galois action on `E[q]`; it
compactifies the fine moduli space `Y_E(q)` of pairs `(A, φ : A[q] ≅ E[q])` (`q ≥ 3`). -/
def TwistedModularCurve (S : G5CurveContext K) (E : WeierstrassCurve K) (q : ℕ) :
    Over (Spec (CommRingCat.of K)) :=
  S.twistCurve q (S.torsionRep E q)

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli`: for `q ≥ 3` prime and `L/K`, the
non-cuspidal `L`-points of `X_E(q)` are the pairs `(A/L, φ)` up to isomorphism. -/
theorem TwistedModularCurve.moduli (S : G5CurveContext K) (E : WeierstrassCurve K) [E.IsElliptic]
    (q : ℕ) (hq : q.Prime) (hq3 : 3 ≤ q) (L : Type) [Field L] [Algebra K L] :
    Nonempty ({P : G5Points L (TwistedModularCurve S E q) // ¬ S.IsCusp L P} ≃
      S.LevelPairs L E q) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected`: `X_E(q)` is
geometrically connected. -/
theorem TwistedModularCurve.geometricallyConnected (S : G5CurveContext K) (E : WeierstrassCurve K)
    [E.IsElliptic] (q : ℕ) (hq : q.Prime) (hq3 : 3 ≤ q) :
    S.IsGeometricallyConnected (TwistedModularCurve S E q) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange`: `X_E(q) ×_K L = X_{E_L}(q)`. -/
theorem TwistedModularCurve.baseChange (S : G5CurveContext K) (E : WeierstrassCurve K)
    [E.IsElliptic] (q : ℕ) (hq : q.Prime) (L : Type) [Field L] [NumberField L] [Algebra K L]
    (SL : G5CurveContext L) :
    Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap K L)))).obj
        (TwistedModularCurve S E q) ≅ TwistedModularCurve SL (E.baseChange L) q) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E`: `(E, id)` gives a non-cuspidal
`K`-point of `X_E(q)`. -/
theorem TwistedModularCurve.point_E (S : G5CurveContext K) (E : WeierstrassCurve K) [E.IsElliptic]
    (q : ℕ) (hq : q.Prime) (hq3 : 3 ≤ q) :
    ∃ P : G5Points K (TwistedModularCurve S E q), ¬ S.IsCusp K P := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.genus_q3`: `X_E(3)` has genus `0` and a
`K`-point, so `X_E(3) ≅ ℙ¹_K`. -/
theorem TwistedModularCurve.genus_q3 (S : G5CurveContext K) (E : WeierstrassCurve K)
    [E.IsElliptic] (hirr : S.TorsionIrreducible E 3) :
    S.genus (TwistedModularCurve S E 3) = 0 ∧
      Nonempty (TwistedModularCurve S E 3 ≅ S.projectiveLine) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.trivial_twist`: if `G_K` acts trivially on
`E[q]`, then `X_E(q) ≅ X(q)_K`. -/
theorem TwistedModularCurve.trivial_twist (S : G5CurveContext K) (E : WeierstrassCurve K)
    [E.IsElliptic] (q : ℕ) (hq : q.Prime) (htriv : S.torsionRep E q = 1) :
    Nonempty (TwistedModularCurve S E q ≅ S.modularCurve q) := by
  sorry

/-- `TauCeti.PotentialAutomorphy.TwistedModularCurve.not_X0`: `X_E(q)` is not `X₀(q)`. As curves
the two are distinguished by their genus once `q ≥ 7` (`g(X(q)) = 1 + (q² − 1)(q − 6)/24`).
-- NOTE: for `q ∈ {3, 5}` both `X_E(q)` (which has the `K`-point `(E, id)`) and `X₀(q)` are `ℙ¹_K`,
-- so the packet's non-example is only true as a statement about moduli interpretations there. -/
theorem TwistedModularCurve.not_X0 (S : G5CurveContext K) (E : WeierstrassCurve K) [E.IsElliptic]
    (q : ℕ) (hq : q.Prime) (hq7 : 7 ≤ q) :
    S.genus (TwistedModularCurve S E q) ≠ S.genus (S.modularCurveX0 q) := by
  sorry

end TwistedModularCurve

end PotentialAutomorphy

namespace SymmetricPower

open NumberField PotentialAutomorphy

/-- The G5 supplier extension of `Langlands.Context F` for the ML.3 nodes over a fixed number
field `F`. -/
structure G5Context (F : Type) [Field F] [NumberField F] extends Langlands.Context F where
  /-- `Sym^{n−1}` of a two-dimensional L-parameter (owner: AutomorphicLFunctionsAndLocalFactors
  AL.3). -/
  symParam : ∀ {v : Place} (n : ℕ), LParam v 2 → LParam v n
  /-- `q_v = #k_v` at a finite place, and the residue characteristic (owner: ANT). -/
  absNorm : Place → ℕ
  residueChar : Place → ℕ
  /-- The weight `(λ_{τ,1} ≥ λ_{τ,2})_τ` of a regular algebraic `π` on `GL_2` (owner:
  AutomorphicFormsOnReductiveGroups AF.4). -/
  weight2 : AutRep 2 → (F →+* ℂ) → ℤ × ℤ
  /-- `π ↦ π^c`, the conjugate under the complex conjugation of a CM field (owner: AF.2). -/
  conjRep : ∀ {n : ℕ}, AutRep n → AutRep n
  /-- The Hecke character `|·|^k` (owner: AF.2). -/
  normChar : ℤ → AutRep 1
  /-- `π_∞` is essentially square-integrable (twists of discrete series of weights `k_v ≥ 2`)
  (owner: AF.1). -/
  IsDiscreteSeriesAtInfinity : AutRep 2 → Prop
  /-- `π_v` is essentially tempered (owner: AL.2). -/
  IsEssTemperedAt : ∀ {n : ℕ}, AutRep n → Place → Prop
  /-- `π_v` is an unramified twist of Steinberg; `π_v` is tamely dihedral of order `p`
  (owner: ET.6). -/
  IsSteinbergTwistAt : ∀ {n : ℕ}, AutRep n → Place → Prop
  IsTamelyDihedralAt : AutRep 2 → Place → ℕ → Prop
  /-- `rec_{F_v}(π_v)(Frob_v)` at an unramified finite place, in the normalisation of BCGNT §7.2
  (owner: EndoscopicTransferAndUnitaryTraceComparison ET.6). -/
  frobMatrix : AutRep 2 → Place → Matrix (Fin 2) (Fin 2) ℂ
  /-- `r_{π,ι} : G_F → GL_n(Q̄_l)` and its reduction `r̄_{π,ι}` for regular algebraic `π`
  (owner: AutomorphicGaloisRepresentationsPartII AG2.2). -/
  galRep : ∀ {n : ℕ}, AutRep n → (l : ℕ) → [Fact l.Prime] → (PadicAlgCl l ≃+* ℂ) →
    ContinuousMonoidHom (G5Gal F) (GL (Fin n) (PadicAlgCl l))
  galResRep : ∀ {n : ℕ}, AutRep n → (l : ℕ) → [Fact l.Prime] → (PadicAlgCl l ≃+* ℂ) →
    G5Gal F →* GL (Fin n) (AlgebraicClosure (ZMod l))
  /-- The `l`-adic cyclotomic character of `G_F`. -/
  cycloChar : (l : ℕ) → [Fact l.Prime] → G5Gal F →* (PadicAlgCl l)ˣ
  /-- `Sym^{n−1}` of the standard representation, `GL_2 → GL_n` (owner: AL.3). -/
  symHom : ∀ (R : Type) [CommRing R] (n : ℕ), GL (Fin 2) R →* GL (Fin n) R
  /-- `L(s, Sym^r π)` with all finite Euler factors, and the completed `Λ(s, Π)` of an automorphic
  `Π`, as meromorphic functions given by their values off their poles (owner: AL.2). -/
  symL : AutRep 2 → ℕ → ℂ → ℂ
  completedAutL : ∀ {n : ℕ}, AutRep n → ℂ → ℂ
  /-- `π` is the automorphic representation of the elliptic curve `E/F`:
  `r_{π,ι} ≅ H¹_{ét}(E_{F̄}, Q̄_l)` for all `ι` (owner: PotentialModularityAndCompatibleSystems
  R23.1, AG2.2). -/
  IsAttachedToEllipticCurve : AutRep 2 → WeierstrassCurve F → Prop

variable {F : Type} [Field F] [NumberField F]

/-- `Π` is a `Sym^{n−1}` lift of `π`: `rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v)` at every place. -/
def G5IsSymPowerLift (C : G5Context F) (π : C.AutRep 2) (n : ℕ) (Pi : C.AutRep n) : Prop :=
  ∀ v : C.Place, C.localParam Pi v = C.symParam n (C.localParam π v)

/-- The same at every finite place. -/
def G5IsSymPowerLiftFinite (C : G5Context F) (π : C.AutRep 2) (n : ℕ) (Pi : C.AutRep n) : Prop :=
  ∀ v : C.Place, ¬ C.IsArchimedean v → C.localParam Pi v = C.symParam n (C.localParam π v)

/-- `π` has CM (is automorphically induced, "dihedral"): `π ≅ π ⊗ (χ ∘ det)` for a non-trivial Hecke
character `χ`. -/
def G5IsCMRep (C : G5Context F) {n : ℕ} (π : C.AutRep n) : Prop :=
  ∃ χ : C.AutRep 1, χ ≠ C.one ∧ C.twist π χ = π

/-- RAESDC: cuspidal, regular algebraic, essentially self-dual `π^∨ ≅ π ⊗ χ`. -/
def G5IsRAESDC (C : G5Context F) {n : ℕ} (π : C.AutRep n) : Prop :=
  C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧ ∃ χ : C.AutRep 1, C.dual π = C.twist π χ

/-- RAECSDC: cuspidal, regular algebraic, essentially conjugate self-dual `π^∨ ≅ π^c ⊗ χ`. -/
def G5IsRAECSDC (C : G5Context F) {n : ℕ} (π : C.AutRep n) : Prop :=
  C.IsCuspidal π ∧ C.IsRegularAlgebraic π ∧ ∃ χ : C.AutRep 1, C.dual π = C.twist (C.conjRep π) χ

/-- `Sym^{n−1} r_{π,ι}` is automorphic: `≅ r_{Π,ι}` for a regular algebraic (isobaric) `Π`. -/
def G5IsSymAutomorphicGal (C : G5Context F) (π : C.AutRep 2) (n l : ℕ) [Fact l.Prime]
    (ι : PadicAlgCl l ≃+* ℂ) : Prop :=
  ∃ Pi : C.AutRep n, C.IsRegularAlgebraic Pi ∧ ∃ g : GL (Fin n) (PadicAlgCl l),
    ∀ σ : G5Gal F, C.galRep Pi l ι σ = g * C.symHom (PadicAlgCl l) n (C.galRep π l ι σ) * g⁻¹

/-- `F ∩ ℚ(ζ_N) = ℚ`, i.e. `Φ_N` stays irreducible over `F`. -/
def G5DisjointFromCyclotomic (F : Type) [Field F] (N : ℕ) : Prop :=
  Irreducible (Polynomial.cyclotomic N F)

/-- `f` continues to an entire function from the half-plane `Re s > σ₀`. -/
def G5IsEntireFrom (f : ℂ → ℂ) (σ₀ : ℝ) : Prop :=
  ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ ∀ s : ℂ, σ₀ < s.re → g s = f s

/-- A representation `ρ : G → GL_n(R)` over a field is irreducible. -/
def G5IsIrreducibleGL {G R : Type} [Group G] [Field R] {n : ℕ} (ρ : G →* GL (Fin n) R) : Prop :=
  n ≠ 0 ∧ ∀ W : Submodule R (Fin n → R),
    (∀ g : G, ∀ w ∈ W, ((ρ g : GL (Fin n) R) : Matrix (Fin n) (Fin n) R).mulVec w ∈ W) →
      W = ⊥ ∨ W = ⊤

/-- `TauCeti.SymmetricPower.SymPowerExists` (ML.3/symmetric-power-lift-over-number-fields):
`Sym^{n−1}π` exists, i.e. some automorphic `Π` of `GL_n(𝔸_F)` has `rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v)`
for every place `v`. -/
def SymPowerExists (C : G5Context F) (π : C.AutRep 2) (n : ℕ) : Prop :=
  ∃ Pi : C.AutRep n, G5IsSymPowerLift C π n Pi

/-- `TauCeti.SymmetricPower.SymPowerExists.one`: `Sym⁰π` is the trivial character. -/
theorem SymPowerExists.one (C : G5Context F) (π : C.AutRep 2) (hπ : C.IsCuspidal π) :
    G5IsSymPowerLift C π 1 C.one := by
  sorry

/-- `TauCeti.SymmetricPower.SymPowerExists.two`: `Sym¹π = π`. -/
theorem SymPowerExists.two (C : G5Context F) (π : C.AutRep 2) (hπ : C.IsCuspidal π) :
    G5IsSymPowerLift C π 2 π := by
  sorry

/-- `TauCeti.SymmetricPower.SymPowerExists.iff_galois`: for `π` RAESDC non-CM over a totally real
`F`, `Sym^{n−1}π` exists iff `Sym^{n−1} r_{π,ι}` is automorphic for one (every) `ι`. -/
theorem SymPowerExists.iff_galois (C : G5Context F) (hF : IsTotallyReal F) (π : C.AutRep 2)
    (hπ : G5IsRAESDC C π) (hcm : ¬ G5IsCMRep C π) (n : ℕ) (hn : 1 ≤ n) :
    (SymPowerExists C π n ↔
      ∃ (l : ℕ) (_ : Fact l.Prime) (ι : PadicAlgCl l ≃+* ℂ), G5IsSymAutomorphicGal C π n l ι) ∧
    (SymPowerExists C π n ↔
      ∀ (l : ℕ) [Fact l.Prime] (ι : PadicAlgCl l ≃+* ℂ), G5IsSymAutomorphicGal C π n l ι) := by
  sorry

/-- Base change data for a finite extension `L/F` (Arthur–Clozel for soluble `L/F`; owner:
AutomorphicLFunctionsAndLocalFactors AL.3, ET.7a): the base change `BC_{L/F}`, the place below, and
the restriction of L-parameters to `W_{L_w}`, with the local compatibilities. -/
structure G5BaseChange {L : Type} [Field L] [NumberField L] [Algebra F L] (C : G5Context F)
    (CL : G5Context L) where
  /-- `π ↦ BC_{L/F}(π)`. -/
  bc : ∀ {n : ℕ}, C.AutRep n → CL.AutRep n
  /-- The place of `F` below `w`. -/
  below : CL.Place → C.Place
  /-- Restriction of L-parameters from `W_{F_v}` to `W_{L_w}`. -/
  resParam : ∀ {n : ℕ} (w : CL.Place), C.LParam (below w) n → CL.LParam w n
  /-- Local–global compatibility of base change. -/
  localParam_bc : ∀ {n : ℕ} (π : C.AutRep n) (w : CL.Place),
    CL.localParam (bc π) w = resParam w (C.localParam π (below w))
  /-- Restriction commutes with `Sym^{n−1}`. -/
  resParam_sym : ∀ (w : CL.Place) (n : ℕ) (x : C.LParam (below w) 2),
    resParam w (C.symParam n x) = CL.symParam n (resParam w x)

/-- `TauCeti.SymmetricPower.SymPowerExists.baseChange`: for `L/F` soluble, if `Sym^{n−1}π` exists
then so does `Sym^{n−1} BC_{L/F}(π)`. -/
theorem SymPowerExists.baseChange {L : Type} [Field L] [NumberField L] [Algebra F L]
    (C : G5Context F) (CL : G5Context L) (hsol : Group.IsSolvable (L ≃ₐ[F] L))
    (B : G5BaseChange C CL) (π : C.AutRep 2) (n : ℕ) (h : SymPowerExists C π n) :
    SymPowerExists CL (B.bc π) n := by
  obtain ⟨Pi, hPi⟩ := h
  refine ⟨B.bc Pi, fun w => ?_⟩
  rw [B.localParam_bc, B.localParam_bc, hPi, B.resParam_sym]

/-- `TauCeti.SymmetricPower.symPowerExists_three` (Gelbart–Jacquet): `Sym²π` exists for every
cuspidal `π`, and it is cuspidal iff `π` is not dihedral. -/
theorem symPowerExists_three (C : G5Context F) (π : C.AutRep 2) (hπ : C.IsCuspidal π) :
    SymPowerExists C π 3 ∧
      ∀ Pi : C.AutRep 3, G5IsSymPowerLift C π 3 Pi → (C.IsCuspidal Pi ↔ ¬ G5IsCMRep C π) := by
  sorry

/-- `TauCeti.SymmetricPower.symPowerExists_cm_not_cuspidal`: for dihedral `π = AI(θ)`, `Sym²π` exists
but is not cuspidal. -/
theorem symPowerExists_cm_not_cuspidal (C : G5Context F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hcm : G5IsCMRep C π) :
    SymPowerExists C π 3 ∧ ∀ Pi : C.AutRep 3, G5IsSymPowerLift C π 3 Pi → ¬ C.IsCuspidal Pi := by
  sorry

/-- `TauCeti.SymmetricPower.symPowerExists_Q`: over `ℚ` the notion agrees with the symmetric power
lifting of ML.3/symmetric-power-lifting (`TauCeti.SymmetricPower.SymPowerLift`): for `π` regular
algebraic, cuspidal and non-CM, `Sym^{n−1}π` exists iff it exists as a regular algebraic cuspidal
representation. -/
theorem symPowerExists_Q (C : G5Context ℚ) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hra : C.IsRegularAlgebraic π) (hcm : ¬ G5IsCMRep C π) (n : ℕ) (hn : 1 ≤ n) :
    SymPowerExists C π n ↔
      ∃ Pi : C.AutRep n, C.IsCuspidal Pi ∧ C.IsRegularAlgebraic Pi ∧ G5IsSymPowerLift C π n Pi := by
  sorry

/-- A choice of `G5Context` over every number field. -/
abbrev G5World : Type 1 := ∀ (F : Type) [Field F] [NumberField F], G5Context F

/-- `TauCeti.SymmetricPower.SP` (ML.3/sp-statement; Newton–Thorne Conjecture B): `SP_n` — for every
totally real `F` and every cuspidal regular algebraic non-CM `π` of `GL_2(𝔸_F)`, `Sym^{n−1}π` exists
as a RAESDC representation of `GL_n(𝔸_F)`. -/
def SP (W : G5World) (n : ℕ) : Prop :=
  ∀ (F : Type) [Field F] [NumberField F], IsTotallyReal F → ∀ π : (W F).AutRep 2,
    (W F).IsCuspidal π → (W F).IsRegularAlgebraic π → ¬ G5IsCMRep (W F) π →
      ∃ Pi : (W F).AutRep n, G5IsRAESDC (W F) Pi ∧ G5IsSymPowerLift (W F) π n Pi

/-- `TauCeti.SymmetricPower.SP.one`: `SP 1` holds. -/
theorem SP.one (W : G5World) : SP W 1 := by
  sorry

/-- `TauCeti.SymmetricPower.SP.two`: `SP 2` holds (`Sym¹π = π` is RAESDC). -/
theorem SP.two (W : G5World) : SP W 2 := by
  sorry

/-- `TauCeti.SymmetricPower.SP.of_le_five`: `SP n` for `n ≤ 5` (low-rank transfers). -/
theorem SP.of_le_five (W : G5World) (n : ℕ) (hn : 1 ≤ n) (h5 : n ≤ 5) : SP W n := by
  sorry

/-- `TauCeti.SymmetricPower.SP.all`: `SP n` for all `n ≥ 1` (Newton–Thorne Theorem 6.4). -/
theorem SP.all (W : G5World) (n : ℕ) (hn : 1 ≤ n) : SP W n := by
  sorry

/-- `TauCeti.SymmetricPower.SP_one`: in `SP 1`, `Sym⁰π` is the trivial character, cuspidal on
`GL_1`. -/
theorem SP_one (W : G5World) (F : Type) [Field F] [NumberField F] (π : (W F).AutRep 2)
    (hπ : (W F).IsCuspidal π) :
    G5IsSymPowerLift (W F) π 1 (W F).one ∧ G5IsRAESDC (W F) (W F).one := by
  sorry

/-- `TauCeti.SymmetricPower.SP_three`: `SP 3` is Gelbart–Jacquet's theorem for non-CM `π`: the
existence of `Sym²π` for cuspidal `π` gives `SP 3`. -/
theorem SP_three (W : G5World)
    (hGJ : ∀ (F : Type) [Field F] [NumberField F] (π : (W F).AutRep 2), (W F).IsCuspidal π →
      SymPowerExists (W F) π 3) : SP W 3 := by
  sorry

/-- `TauCeti.SymmetricPower.SP_cm_excluded`: `SP_n` says nothing about CM `π`: for `n ≥ 3` their
symmetric power lifts are not cuspidal. -/
theorem SP_cm_excluded (C : G5Context F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hra : C.IsRegularAlgebraic π) (hcm : G5IsCMRep C π) (n : ℕ) (hn : 3 ≤ n) (Pi : C.AutRep n)
    (hPi : G5IsSymPowerLift C π n Pi) : ¬ C.IsCuspidal Pi := by
  sorry

/-- `TauCeti.SymmetricPower.onePrime` (ML.3/one-prime-criterion; Newton–Thorne Lemma 2.1): for `F`
totally real and `π` non-CM RAESDC on `GL_2`, (1) a cuspidal `Sym^{n−1}` lift exists ⇔ (2)
`Sym^{n−1} r_{π,ι}` is automorphic for every `(p, ι)` ⇔ (3) for some `(p, ι)`. -/
theorem onePrime (C : G5Context F) (hF : IsTotallyReal F) (π : C.AutRep 2) (hπ : G5IsRAESDC C π)
    (hcm : ¬ G5IsCMRep C π) (n : ℕ) (hn : 1 ≤ n) :
    ((∃ Pi : C.AutRep n, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π n Pi) ↔
      ∀ (p : ℕ) [Fact p.Prime] (ι : PadicAlgCl p ≃+* ℂ), G5IsSymAutomorphicGal C π n p ι) ∧
    ((∀ (p : ℕ) [Fact p.Prime] (ι : PadicAlgCl p ≃+* ℂ), G5IsSymAutomorphicGal C π n p ι) ↔
      ∃ (p : ℕ) (_ : Fact p.Prime) (ι : PadicAlgCl p ≃+* ℂ), G5IsSymAutomorphicGal C π n p ι) := by
  sorry

/-- Base change data for all extensions of number fields in a `G5World`. -/
abbrev G5BCWorld (W : G5World) : Type 1 :=
  ∀ (F L : Type) [Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L],
    G5BaseChange (W F) (W L)

/-- `TauCeti.SymmetricPower.clozelThorne_reductions` (ML.3/clozel-thorne-reductions; Newton–Thorne
Proposition 6.1 and the Clozel–Thorne criterion): (NT 6.1) for `F` totally real, `π` non-CM RAESDC,
`p ≥ 5` and `0 < r < p` there are a soluble totally real `E/F`, `ι` and a RAESDC weight-`0` `π′` over
`E` with `Sym^{p+r−1}` of `BC_{E/F}(π)` existing iff it does for `π′`, `π′_v` an unramified twist of
Steinberg above `p`, `det r_{π′,ι} = ε^{−1}`, a place `v₀` with `q_{v₀} ≡ −1 mod p` and `π′_{v₀}`
tamely dihedral of order `p`, and a place `v₁` with `q_{v₁} ≡ 1 mod p` and `π′_{v₁}` Steinberg; and
(CT) for `π` with discrete series at infinity, not CM ⇔ `Sym²π` cuspidal.
-- NOTE: the potential-diagonalisability conditions of NT 6.1 and the steps CT Theorem 7.1,
-- Lemma 7.4 and Proposition 7.6 (mixed parity, RACSDC twist, descent from a CM field) are cited in
-- the packet without statements and are not formalised here. -/
theorem clozelThorne_reductions (W : G5World) (BC : G5BCWorld W) (F : Type) [Field F]
    [NumberField F] (hF : IsTotallyReal F) :
    (∀ (π : (W F).AutRep 2), G5IsRAESDC (W F) π → ¬ G5IsCMRep (W F) π →
      ∀ (p r : ℕ), p.Prime → 5 ≤ p → 0 < r → r < p →
      ∃ (E : Type) (_ : Field E) (_ : NumberField E) (_ : Algebra F E),
        Group.IsSolvable (E ≃ₐ[F] E) ∧ IsTotallyReal E ∧ ∃ π' : (W E).AutRep 2,
          G5IsRAESDC (W E) π' ∧ (∀ τ, (W E).weight2 π' τ = (0, 0)) ∧
          (SymPowerExists (W E) ((BC F E).bc π) (p + r) ↔ SymPowerExists (W E) π' (p + r)) ∧
          (∀ v, (W E).residueChar v = p → (W E).IsSteinbergTwistAt π' v) ∧
          (∃ (_ : Fact p.Prime) (ι : PadicAlgCl p ≃+* ℂ), ∀ σ : G5Gal E,
            ((W E).galRep π' p ι σ).det = ((W E).cycloChar p σ)⁻¹) ∧
          (∃ v₀, ¬ (W E).IsArchimedean v₀ ∧ (W E).absNorm v₀ % p = p - 1 ∧
            (W E).IsTamelyDihedralAt π' v₀ p) ∧
          (∃ v₁, ¬ (W E).IsArchimedean v₁ ∧ (W E).absNorm v₁ % p = 1 ∧
            (W E).IsSteinbergTwistAt π' v₁)) ∧
    ∀ π : (W F).AutRep 2, (W F).IsCuspidal π → (W F).IsDiscreteSeriesAtInfinity π →
      (¬ G5IsCMRep (W F) π ↔
        ∃ Pi : (W F).AutRep 3, (W F).IsCuspidal Pi ∧ G5IsSymPowerLift (W F) π 3 Pi) := by
  sorry

/-- `TauCeti.SymmetricPower.sp_all` (ML.3/all-regular-symmetric-powers; Newton–Thorne Theorem 6.4):
`SP_n` holds for all `n ≥ 2`. -/
theorem sp_all (W : G5World) (n : ℕ) (hn : 2 ≤ n) : SP W n := by
  sorry

/-- `TauCeti.SymmetricPower.hilbert` (ML.3/hilbert-symmetric-powers; Newton–Thorne Theorem A): for
`F` totally real and `π` cuspidal non-CM with `π_∞` essentially square-integrable (Hilbert modular
forms of weights `k_v ≥ 2`, mixed parity allowed), `Sym^{n−1}π` exists as a cuspidal representation
for every `n ≥ 2`. -/
theorem hilbert (C : G5Context F) (hF : IsTotallyReal F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hds : C.IsDiscreteSeriesAtInfinity π) (hcm : ¬ G5IsCMRep C π) (n : ℕ) (hn : 2 ≤ n) :
    ∃ Pi : C.AutRep n, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π n Pi := by
  sorry

/-- `TauCeti.SymmetricPower.cmField` (ML.3/cm-field-symmetric-powers; Newton–Thorne Theorem 6.5(2)):
for `E` CM and `π` RAECSDC on `GL_2(𝔸_E)` not automorphically induced, `Sym^{n−1}π` exists as a
cuspidal representation for every `n ≥ 2`. -/
theorem cmField (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2) (hπ : G5IsRAECSDC C π)
    (hcm : ¬ G5IsCMRep C π) (n : ℕ) (hn : 2 ≤ n) :
    ∃ Pi : C.AutRep n, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π n Pi := by
  sorry

/-- `TauCeti.SymmetricPower.sym6_sym8` (ML.3/sym6-sym8; Clozel–Thorne Theorem 6.1): for `F` totally
real and `π` RAESDC not CM, `Sym⁶π` is cuspidal automorphic if `F ∩ ℚ(ζ₅) = ℚ`, and `Sym⁸π` if
`F ∩ ℚ(ζ₇) = ℚ`. -/
theorem sym6_sym8 (C : G5Context F) (hF : IsTotallyReal F) (π : C.AutRep 2) (hπ : G5IsRAESDC C π)
    (hcm : ¬ G5IsCMRep C π) :
    (G5DisjointFromCyclotomic F 5 →
      ∃ Pi : C.AutRep 7, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π 7 Pi) ∧
    (G5DisjointFromCyclotomic F 7 →
      ∃ Pi : C.AutRep 9, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π 9 Pi) := by
  sorry

/-- `TauCeti.SymmetricPower.upToEight` (ML.3/symmetric-powers-up-to-eight; Clozel–Thorne Corollary
7.2 and 1.3): for `F` totally real and `π` cuspidal with `π_∞` essentially square-integrable, not CM,
`Sym^r π` exists as a cuspidal representation at the finite places, and `L(s, Sym^r π)` is entire,
when `1 ≤ r ≤ 4`, or `r ∈ {5, 6}` and `F ∩ ℚ(ζ₅) = ℚ`, or `r = 7` and `F ∩ ℚ(ζ₃₅) = ℚ`, or `r = 8` and
`F ∩ ℚ(ζ₇) = ℚ`. -/
theorem upToEight (C : G5Context F) (hF : IsTotallyReal F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hds : C.IsDiscreteSeriesAtInfinity π) (hcm : ¬ G5IsCMRep C π) (r : ℕ)
    (hr : (1 ≤ r ∧ r ≤ 4) ∨ ((r = 5 ∨ r = 6) ∧ G5DisjointFromCyclotomic F 5) ∨
      (r = 7 ∧ G5DisjointFromCyclotomic F 35) ∨ (r = 8 ∧ G5DisjointFromCyclotomic F 7)) :
    (∃ Pi : C.AutRep (r + 1), C.IsCuspidal Pi ∧ G5IsSymPowerLiftFinite C π (r + 1) Pi) ∧
      G5IsEntireFrom (C.symL π r) ((r : ℝ) / 2 + 1) := by
  sorry

/-- `TauCeti.SymmetricPower.largeImage` (ML.3/large-residual-image-density-one; Clozel–Thorne Lemma
7.5): for `E` imaginary CM and `π` RACSDC on `GL_2(𝔸_E)` with `Sym²π` cuspidal, for a density-one
set of primes `l` and all `ι`, `r̄_ι(π)` is irreducible with image containing a conjugate of
`SL_2(F_l)`. -/
theorem largeImage (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2) (hπ : G5IsRAECSDC C π)
    (hsym : ∃ Pi : C.AutRep 3, C.IsCuspidal Pi ∧ G5IsSymPowerLift C π 3 Pi) :
    ∃ L : Set ℕ, G5HasDensity L 1 ∧ ∀ l ∈ L, ∀ (_ : Fact l.Prime) (ι : PadicAlgCl l ≃+* ℂ),
      G5IsIrreducibleGL (C.galResRep π l ι) ∧
      ∃ g, ∀ h ∈ G5SL2 l, g * h * g⁻¹ ∈ (C.galResRep π l ι).range := by
  sorry

/-! ### ML.3 compatible systems over CM fields (in `PotentialAutomorphy.G5Context`) -/

section CompatibleSystems

variable (W : PotentialAutomorphy.G5Context)

/-- `TauCeti.SymmetricPower.bcgnt_detCyclotomic` (ML.3/bcgnt-potential-automorphy-det-cyclotomic;
BCGNT Theorem 6.2.1, Remark 6.2.2): `F` imaginary CM, `R` strongly irreducible very weakly
compatible of rank 2 with `H_τ = {0, m}`, `m ≥ 1`, `det r_λ = ε^{−m}`: `R` is pure of weight `m`, and
for each `n ≥ 1`, `Sym^{n−1}R|_{G_{F_n}}` is automorphic for a finite CM `F_n/F` Galois over `ℚ`. -/
theorem bcgnt_detCyclotomic (F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F) (m : ℕ)
    (hm : 1 ≤ m) (R : W.CompSys F 2)
    (hR : W.IsStronglyIrreducible R ∧ W.IsVeryWeaklyCompatible R ∧ W.HasHTZeroM R m)
    (hdet : W.detCS R = W.cyclo F (-(m : ℤ))) :
    W.IsPure R m ∧ ∀ n : ℕ, 1 ≤ n → ∃ (Fn : G5NF) (h : F ≤ Fn), FiniteDimensional ℚ Fn ∧
      IsCMField Fn ∧ G5IsGaloisOver ⊥ Fn ∧ W.IsAutomorphicCS (W.resCS h (W.symCS n R)) := by
  sorry

/-- `TauCeti.SymmetricPower.purity_of_symPowers` (ML.3/purity-from-symmetric-powers; BCGNT Lemma
6.1.3): if `Sym^{n−1}R|_{F_n}` is weakly automorphic of level prime to the places above `v₀ ∉ S` for
infinitely many `n` (with `F_n/F` finite Galois), then the roots `α` of `Q_{v₀}(X)` satisfy
`|ια|² = q_{v₀}^m` for every `ι`. -/
theorem purity_of_symPowers (F : G5NF) [FiniteDimensional ℚ F] (m : ℕ) (R : W.CompSys F 2)
    (hR : W.IsVeryWeaklyCompatible R ∧ W.HasHTZeroM R m) (v₀ : G5Place F)
    (hv₀ : v₀ ∉ W.badSet R)
    (hinf : Set.Infinite {n : ℕ | 1 ≤ n ∧ ∃ (Fn : G5NF) (h : F ≤ Fn), FiniteDimensional ℚ Fn ∧
      G5IsGaloisOver F Fn ∧ W.IsWeaklyAutomorphicCS (W.resCS h (W.symCS n R))
        (G5placesAbove h {v₀})}) :
    ∀ σ : ℂ ≃+* ℂ, ∀ α ∈ ((W.frobPoly R v₀).map (σ : ℂ →+* ℂ)).roots,
      ‖α‖ ^ 2 = (G5normPlace v₀ : ℝ) ^ m := by
  sorry

/-- `TauCeti.SymmetricPower.bcgnt_theoremC` (ML.3/bcgnt-symmetric-powers-purity; BCGNT Theorem C =
7.2.1): `F` CM, `R` strongly irreducible very weakly compatible of rank 2 with `H_τ = {0, m}`,
`m ≥ 1`: `R` is pure of weight `m` and each `Sym^{n−1}R` becomes automorphic over a finite CM `F′/F`
Galois over `ℚ`; if `R` is irreducible but not strongly irreducible, `R` is pure of weight `m` and
each `Sym^{n−1}R` is a direct sum of automorphic systems of rank `≤ 2` (sums being detected on
Frobenius polynomials). -/
theorem bcgnt_theoremC (F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F) (m : ℕ) (hm : 1 ≤ m)
    (R : W.CompSys F 2) (hR : W.IsVeryWeaklyCompatible R ∧ W.HasHTZeroM R m) :
    (W.IsStronglyIrreducible R → W.IsPure R m ∧ ∀ n : ℕ, 1 ≤ n →
      ∃ (F' : G5NF) (h : F ≤ F'), FiniteDimensional ℚ F' ∧ IsCMField F' ∧ G5IsGaloisOver ⊥ F' ∧
        W.IsAutomorphicCS (W.resCS h (W.symCS n R))) ∧
    (W.IsIrreducibleCS R → ¬ W.IsStronglyIrreducible R → W.IsPure R m ∧ ∀ n : ℕ, 1 ≤ n →
      ∃ (k : ℕ) (d : Fin k → ℕ) (Rs : ∀ j, W.CompSys F (d j)),
        (∀ j, d j ≤ 2 ∧ W.IsAutomorphicCS (Rs j)) ∧
        ∀ v ∉ W.badSet R, W.frobPoly (W.symCS n R) v = ∏ j, W.frobPoly (Rs j) v) := by
  sorry

/-- `TauCeti.SymmetricPower.acc_purity` (ML.3/acc-purity-rank-two; ACC+ Corollary 7.1.13): `F` CM,
`R` irreducible rank-2 very weakly compatible with `H_τ = {0, 1}`, `m ≥ 0`: (1) `R` is pure of weight
`1`; (2) `L^S(ι Sym^m R, s)` continues meromorphically to `ℂ`; it is holomorphic and
non-vanishing for `Re s ≥ m/2 + 1` only if `R` is strongly irreducible and `m > 0`; (3) `Λ(ι Sym^m R, s) = ε Λ((Sym^m R)^∨, 1 − s)`. -/
theorem acc_purity (F : G5NF) [FiniteDimensional ℚ F] (hF : IsCMField F) (R : W.CompSys F 2)
    (hR : W.IsIrreducibleCS R ∧ W.IsVeryWeaklyCompatible R ∧ W.HasHTZeroM R 1) (m : ℕ) :
    W.IsPure R 1 ∧
      (∃ g : ℂ → ℂ, MeromorphicOn g Set.univ ∧
        (∀ s : ℂ, (m : ℝ) / 2 + 1 < s.re → g s = W.partialLCS (W.symCS (m + 1) R) s) ∧
        (W.IsStronglyIrreducible R → 0 < m →
          ∀ s : ℂ, (m : ℝ) / 2 + 1 ≤ s.re → AnalyticAt ℂ g s ∧ g s ≠ 0)) ∧
      ∀ᶠ s in Filter.codiscrete ℂ, W.completedLCS (W.symCS (m + 1) R) s =
        W.epsilonCS (W.symCS (m + 1) R) s * W.completedLCS (W.dualCS (W.symCS (m + 1) R)) (1 - s) := by
  sorry

/-- `Sym^m r^∨|_{G_{F′}} ≅ ρ` for `ρ` of dimension `m + 1`. -/
def G5IsoSymDual {K : G5NF} {l : ℕ} [Fact l.Prime] (m : ℕ) (r : G5Rep K l 2)
    (ρ : G5Rep K l (m + 1)) : Prop :=
  ∃ g : GL (Fin (m + 1)) (PadicAlgCl l), ∀ σ : G5GalF K,
    (ρ σ).val = g.val * ((W.symHom (PadicAlgCl l) (m + 1) (r σ))⁻¹).val.transpose * (g⁻¹).val

/-- `TauCeti.SymmetricPower.acc_ellipticSymPowers` (ML.3/acc-elliptic-symmetric-powers; ACC+
Corollary 7.2.4, corrections E103–E107): for a finite set `𝓜` of positive integers, a non-CM `E/ℚ`,
a finite set `𝓛` of good primes and `F^{avoid}/ℚ` finite, there are `F₂^{avoid}/ℚ` finite Galois
linearly disjoint from `F^{avoid}` and `F^{suffices}/ℚ` finite totally real Galois, unramified above
`𝓛`, linearly disjoint from `F^{avoid}F₂^{avoid}`, such that for every finite totally real
`F′ ⊇ F^{suffices}` linearly disjoint from `F₂^{avoid}` and `m ∈ 𝓜` there is a regular algebraic
cuspidal polarizable `π` of `GL_{m+1}(𝔸_{F′})` of weight `0`, unramified above `𝓛`,
with `Sym^m r_{E,l}^∨|_{G_{F′}} ≅ r_{l,ι}(π)`.
-- NOTE: the packet statement leaves the prime `l` and `ι` implicit; they are fixed parameters here. -/
theorem acc_ellipticSymPowers (𝓜 : Finset ℕ) (h𝓜 : ∀ m ∈ 𝓜, 0 < m)
    (E : WeierstrassCurve (⊥ : G5NF)) [E.IsElliptic] (hE : ¬ W.HasCM E) (𝓛 : Finset ℕ)
    (h𝓛 : ∀ p ∈ 𝓛, p.Prime ∧ W.GoodAt E p) (Favoid : G5NF) [FiniteDimensional ℚ Favoid]
    (l : ℕ) [Fact l.Prime] (ι : PadicAlgCl l ≃+* ℂ) :
    ∃ F2av Fsuff : G5NF, FiniteDimensional ℚ F2av ∧ FiniteDimensional ℚ Fsuff ∧
      G5IsGaloisOver ⊥ F2av ∧ G5LinDisjointOver ⊥ F2av Favoid ∧
      G5IsGaloisOver ⊥ Fsuff ∧ IsTotallyReal Fsuff ∧ (∀ p ∈ 𝓛, G5UnramifiedIn p Fsuff) ∧
      G5LinDisjointOver ⊥ Fsuff (Favoid ⊔ F2av) ∧
      ∀ F' : G5NF, FiniteDimensional ℚ F' → IsTotallyReal F' → Fsuff ≤ F' →
        G5LinDisjointOver ⊥ F' F2av → ∀ m ∈ 𝓜,
        ∃ π : W.AutRep F' (m + 1), W.IsCuspidal π ∧ W.IsRegularAlgebraic π ∧ W.IsPolarizable π ∧
          W.weight π = 0 ∧
          (∀ p ∈ 𝓛, ∀ v : G5Place F', G5Above v p → W.IsUnramifiedAutAt π v) ∧
          G5IsoSymDual W m (G5Rep.res (bot_le : (⊥ : G5NF) ≤ F') (W.ellRep E l))
            (W.galRep π l ι) := by
  sorry

/-- The Frobenius angle `θ_v ∈ [0, π]` of `E` at a place of good reduction:
`a_v = q_v + 1 − #E(k_v) = 2√q_v cos θ_v`. -/
def G5frobAngle {K : G5NF} (E : WeierstrassCurve K) (v : G5Place K) : ℝ :=
  Real.arccos (((G5normPlace v : ℝ) + 1 - (W.pointCount E v : ℝ)) /
    (2 * Real.sqrt (G5normPlace v : ℝ)))

/-- The Sato–Tate law for `E/K`: the angles `θ_v` (good `v`, ordered by norm) are equidistributed
for `(2/π) sin²θ dθ` on `[0, π]`. -/
def G5SatoTateHolds {K : G5NF} (E : WeierstrassCurve K) : Prop :=
  ∀ f : ℝ → ℝ, Continuous f →
    Filter.Tendsto (fun X : ℕ =>
      (∑ᶠ v ∈ {v : G5Place K | W.HasGoodReductionAt E v ∧ G5normPlace v ≤ X},
          f (G5frobAngle W E v)) /
        (Set.ncard {v : G5Place K | W.HasGoodReductionAt E v ∧ G5normPlace v ≤ X} : ℝ))
      Filter.atTop
      (nhds (2 / Real.pi * ∫ θ in (0 : ℝ)..Real.pi, f θ * Real.sin θ ^ 2))

/-- `TauCeti.SymmetricPower.cg18_satoTate` (ML.3/cg18-conditional-sato-tate; Calegari–Geraghty
Theorem 1.1(2)): assuming Conjecture B, the Sato–Tate conjecture holds for every non-CM elliptic
curve over any number field. Status: conditional. -/
theorem cg18_satoTate (hB : W.ConjectureB) (K : G5NF) [FiniteDimensional ℚ K]
    (E : WeierstrassCurve K) [E.IsElliptic] (hE : ¬ W.HasCM E) : G5SatoTateHolds W E := by
  sorry

end CompatibleSystems

/-! ### ML.3/completed-symmetric-power-l-function -/

/-- Supplier data for symmetric power L-functions of elliptic curves over `ℚ` (owner:
AutomorphicLFunctionsAndLocalFactors AL.2, ML.0/compatible-system-archimedean-factors,
PotentialModularityAndCompatibleSystems R23.1). -/
structure G5EllipticLData (C : G5Context ℚ) where
  /-- The conductor `N_n` of `Sym^n` of the Weil–Deligne representations of `E`. -/
  conductor : WeierstrassCurve ℚ → ℕ → ℕ
  /-- `det(1 − X·Frob_p | (Sym^n WD_p(E))^{I_p})`, for every prime `p`. -/
  localPoly : WeierstrassCurve ℚ → ℕ → ℕ → Polynomial ℂ
  /-- `L(Sym^n E, s) = ∏_p L_p(Sym^n E, s)` (all `p`), continued meromorphically, by its values off
  its poles. -/
  L : WeierstrassCurve ℚ → ℕ → ℂ → ℂ
  /-- The automorphic representation `π_E` of `GL_2(𝔸_ℚ)` (modularity). -/
  autRep : WeierstrassCurve ℚ → C.AutRep 2
  /-- Semistability of `E`. -/
  IsSemistable : WeierstrassCurve ℚ → Prop

/-- The archimedean factor `γ_n(s)` of `Sym^n` of the Hodge structure of `E` (Hodge types
`(n − j, j)`): `∏_{0 ≤ j < n/2} Γ_ℂ(s − j)` times, for `n` even, `Γ_ℝ(s − n/2 + ε)` with
`ε = (n/2) mod 2` (the sign of complex conjugation on the middle type). -/
def G5gammaFactor (n : ℕ) (s : ℂ) : ℂ :=
  (∏ j ∈ Finset.range ((n + 1) / 2), Complex.Gammaℂ (s - j)) *
    (if Even n then Complex.Gammaℝ (s - ((n / 2 : ℕ) : ℂ) + (((n / 2) % 2 : ℕ) : ℂ)) else 1)

/-- `TauCeti.SymmetricPower.completedL` (ML.3/completed-symmetric-power-l-function):
`Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s)` (Dummigan–Martin–Watkins). -/
def completedL {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ) (n : ℕ)
    (s : ℂ) : ℂ :=
  (D.conductor E n : ℂ) ^ (s / 2) * G5gammaFactor n s * D.L E n s

/-- `TauCeti.SymmetricPower.completedL_eq`: `Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s)`. -/
theorem completedL_eq {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ) (n : ℕ)
    (s : ℂ) : completedL D E n s = (D.conductor E n : ℂ) ^ (s / 2) * G5gammaFactor n s * D.L E n s :=
  rfl

/-- `TauCeti.SymmetricPower.completedL_entire_iff`: `Λ(Sym^n E, s)` is entire iff
`N_n^{−s/2} Λ(Sym^n E, s)` is (the conductor factor is entire and never vanishes). -/
theorem completedL_entire_iff {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ)
    (n : ℕ) (hN : 0 < D.conductor E n) :
    G5IsEntireFrom (completedL D E n) ((n : ℝ) / 2 + 1) ↔
      G5IsEntireFrom (fun s => (D.conductor E n : ℂ) ^ (-s / 2) * completedL D E n s)
        ((n : ℝ) / 2 + 1) := by
  sorry

/-- `TauCeti.SymmetricPower.completedL_eq_automorphic`: if `Sym^n π_E` exists,
`Λ(Sym^n E, s) = Λ(Sym^n π_E, s − n/2)` (unitary normalisation shift). -/
theorem completedL_eq_automorphic {C : G5Context ℚ} (D : G5EllipticLData C)
    (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) (Pi : C.AutRep (n + 1))
    (hPi : G5IsSymPowerLift C (D.autRep E) (n + 1) Pi) (s : ℂ) :
    completedL D E n s = C.completedAutL Pi (s - n / 2) := by
  sorry

/-- `TauCeti.SymmetricPower.completedL_one`: `Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s)`. -/
theorem completedL_one {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ)
    (s : ℂ) :
    completedL D E 1 s = (D.conductor E 1 : ℂ) ^ (s / 2) *
      (2 * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s) * D.L E 1 s := by
  sorry

/-- `TauCeti.SymmetricPower.completedL_zero`: `n = 0`: `Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s)`, which is
not entire (given `N_0 = 1` and `L(Sym⁰E, s) = ζ(s)`). -/
theorem completedL_zero {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ)
    (hN : D.conductor E 0 = 1) (hL : D.L E 0 = riemannZeta) :
    (∀ s : ℂ, completedL D E 0 s = (Real.pi : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s) ∧
      ¬ G5IsEntireFrom (completedL D E 0) 1 := by
  sorry

/-- `TauCeti.SymmetricPower.completedL_gamma_two`: `γ₂(s) = Γ_ℝ(s − 1 + 1) Γ_ℂ(s)`. -/
theorem completedL_gamma_two (s : ℂ) :
    G5gammaFactor 2 s = Complex.Gammaℝ (s - 1 + 1) * Complex.Gammaℂ s := by
  sorry

/-- `TauCeti.SymmetricPower.completedL_partial_not`: removing a non-trivial bad Euler factor
destroys the functional equation: if `Λ(s) = ε Λ(n + 1 − s)` with `Λ ≠ 0` for `Re s` large, and
`p` has `L_p(Sym^n E, s)^{−1} = P(p^{−s})` with `P(0) = 1`, `P ≠ 1`, then
`N_n^{s/2} γ_n(s) L^{\{p\}}(Sym^n E, s) = Λ(s)·P(p^{−s})` satisfies no functional equation of the same
shape. -/
theorem completedL_partial_not {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ)
    (n p : ℕ) (hp : p.Prime) (ε : ℂ)
    (hfe : ∀ᶠ s in Filter.codiscrete ℂ, completedL D E n s = ε * completedL D E n (n + 1 - s))
    (hnz : ∃ σ₀ : ℝ, ∀ s : ℂ, σ₀ < s.re → completedL D E n s ≠ 0)
    (hP0 : (D.localPoly E n p).eval 0 = 1) (hP : D.localPoly E n p ≠ 1) :
    ¬ ∃ ε' : ℂ, ∀ᶠ s in Filter.codiscrete ℂ,
      completedL D E n s * (D.localPoly E n p).eval ((p : ℂ) ^ (-s)) =
        ε' * (completedL D E n (n + 1 - s) * (D.localPoly E n p).eval ((p : ℂ) ^ (-(n + 1 - s)))) := by
  sorry

/-- `TauCeti.SymmetricPower.semistable_entire` (ML.3/nt21-semistable-l-functions; Newton–Thorne I,
Corollary C): for `E/ℚ` semistable and `n ≥ 2`, `Λ(Sym^n E, s)` continues to an entire function. -/
theorem semistable_entire {C : G5Context ℚ} (D : G5EllipticLData C) (E : WeierstrassCurve ℚ)
    [E.IsElliptic] (hE : D.IsSemistable E) (n : ℕ) (hn : 2 ≤ n) :
    G5IsEntireFrom (completedL D E n) ((n : ℝ) / 2 + 1) := by
  sorry

/-! ### ML.3/parallel-weight-and-clozel-purity -/

/-- `TauCeti.SymmetricPower.IsParallelWeight` (ML.3/parallel-weight-and-clozel-purity):
`λ_{τ,1} − λ_{τ,2}` is independent of `τ`. -/
def IsParallelWeight (C : G5Context F) (π : C.AutRep 2) : Prop :=
  ∃ c : ℤ, ∀ τ : F →+* ℂ, (C.weight2 π τ).1 - (C.weight2 π τ).2 = c

/-- `TauCeti.SymmetricPower.parallelWeight`: the parallel weight `k = λ_{τ,1} − λ_{τ,2} + 2 ≥ 2`
(meaningful for `π` of parallel weight). -/
def parallelWeight (C : G5Context F) (π : C.AutRep 2) : ℕ :=
  Finset.univ.sup (fun τ : F →+* ℂ => ((C.weight2 π τ).1 - (C.weight2 π τ).2).toNat) + 2

/-- `TauCeti.SymmetricPower.IsParallelWeight.twist`: parallel weight is invariant under twists by
algebraic Hecke characters. -/
theorem IsParallelWeight.twist (C : G5Context F) (π : C.AutRep 2) (χ : C.AutRep 1)
    (hπ : C.IsRegularAlgebraic π) (hχ : C.IsRegularAlgebraic χ) :
    IsParallelWeight C (C.twist π χ) ↔ IsParallelWeight C π := by
  sorry

/-- `TauCeti.SymmetricPower.clozel_purity`: for `F` imaginary CM and `π` cuspidal regular algebraic
on `GL_2`, `λ_{τ,1} + λ_{τc,2}` is independent of `τ`. -/
theorem clozel_purity (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hra : C.IsRegularAlgebraic π) :
    ∃ w : ℤ, ∀ τ : F →+* ℂ, (C.weight2 π τ).1 + (C.weight2 π ((starRingEnd ℂ).comp τ)).2 = w := by
  sorry

/-- `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic`: over an imaginary quadratic field
every cuspidal regular algebraic `π` on `GL_2` has parallel weight. -/
theorem isParallelWeight_of_imagQuadratic (C : G5Context F) (hF : Module.finrank ℚ F = 2)
    (hF' : IsTotallyComplex F) (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hra : C.IsRegularAlgebraic π) : IsParallelWeight C π := by
  sorry

/-- `TauCeti.SymmetricPower.parallelWeight_Q`: over `ℚ` every `π` has parallel weight (one
embedding). -/
theorem parallelWeight_Q (C : G5Context ℚ) (π : C.AutRep 2) : IsParallelWeight C π := by
  sorry

/-- `TauCeti.SymmetricPower.parallelWeight_two`: the `π` of an elliptic curve over a CM field has
parallel weight `2` (weight `(0, 0)_τ`). -/
theorem parallelWeight_two (C : G5Context F) (hF : IsCMField F) (E : WeierstrassCurve F)
    [E.IsElliptic] (π : C.AutRep 2) (hπ : C.IsCuspidal π) (hE : C.IsAttachedToEllipticCurve π E) :
    IsParallelWeight C π ∧ parallelWeight C π = 2 := by
  sorry

/-- `TauCeti.SymmetricPower.nonParallel_hilbert`: over a real quadratic field, a Hilbert modular
form of weight `(2, 4)` (`λ_{τ,1} − λ_{τ,2} = k_τ − 2 = 0, 2`) is not of parallel weight. -/
theorem nonParallel_hilbert (C : G5Context F) (hF : Module.finrank ℚ F = 2)
    (hF' : IsTotallyReal F) (π : C.AutRep 2) (τ₁ τ₂ : F →+* ℂ)
    (h₁ : (C.weight2 π τ₁).1 - (C.weight2 π τ₁).2 = 0)
    (h₂ : (C.weight2 π τ₂).1 - (C.weight2 π τ₂).2 = 2) : ¬ IsParallelWeight C π := by
  rintro ⟨c, hc⟩
  have e₁ := hc τ₁
  have e₂ := hc τ₂
  omega

/-! ### Ramanujan and Sato–Tate over imaginary CM fields -/

/-- `TauCeti.SymmetricPower.bianchi_ramanujan` (ML.3/bianchi-ramanujan; BCGNT Theorem A = 7.1.1):
for `F` imaginary CM and `π` regular algebraic cuspidal of parallel weight `k`, every `π_v` (`v`
finite) is essentially tempered, and at unramified `v` the Satake parameters satisfy
`|α_v| = |β_v| = N(v)^{(k−1)/2}` (`frobMatrix` in the arithmetic normalisation). -/
theorem bianchi_ramanujan (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2)
    (hπ : C.IsCuspidal π) (hra : C.IsRegularAlgebraic π) (hpar : IsParallelWeight C π) :
    (∀ v : C.Place, ¬ C.IsArchimedean v → C.IsEssTemperedAt π v) ∧
      ∀ v : C.Place, ¬ C.IsArchimedean v → C.IsUnramifiedAt π v →
        ∀ α ∈ (C.frobMatrix π v).charpoly.roots,
          ‖α‖ = (C.absNorm v : ℝ) ^ (((parallelWeight C π : ℝ) - 1) / 2) := by
  sorry

/-- A fixed embedding `τ₀ : F → ℂ`. -/
def G5tau0 (F : Type) [Field F] [NumberField F] : F →+* ℂ :=
  (IsAlgClosed.lift (R := ℚ) (S := F) (M := ℂ)).toRingHom

/-- Clozel's purity weight `w = λ_{τ₀,1} + λ_{τ₀c,2}`. -/
def G5purityWeight (C : G5Context F) (π : C.AutRep 2) : ℤ :=
  (C.weight2 π (G5tau0 F)).1 + (C.weight2 π ((starRingEnd ℂ).comp (G5tau0 F))).2

/-- The unitary character `ψ` with `ω_π = |·|^{−w} ψ`. -/
def G5psi (C : G5Context F) (π : C.AutRep 2) : C.AutRep 1 :=
  C.twist (C.centralChar π) (C.normChar (G5purityWeight C π))

/-- `χ^a` in the group of Hecke characters (multiplication = twisting on `GL_1`). -/
def G5charPow (C : G5Context F) (χ : C.AutRep 1) (a : ℕ) : C.AutRep 1 :=
  (fun x => C.twist x χ)^[a] C.one

/-- `χ` has finite order `a`. -/
def G5HasCharOrder (C : G5Context F) (χ : C.AutRep 1) (a : ℕ) : Prop :=
  0 < a ∧ G5charPow C χ a = C.one ∧ ∀ b, 0 < b → b < a → G5charPow C χ b ≠ C.one

/-- `TauCeti.SymmetricPower.SatoTateGroup` (ML.3/sato-tate-group): `ST(π) ⊆ U_2(ℝ)`, equal to
`U_2(ℝ)_a = {g : det(g)^a = 1}` if `ψ` has finite order `a` and to `U_2(ℝ)` otherwise. -/
def SatoTateGroup (C : G5Context F) (π : C.AutRep 2) :
    Subgroup (Matrix.unitaryGroup (Fin 2) ℂ) :=
  ⨅ (a : ℕ) (_ : G5HasCharOrder C (G5psi C π) a),
    ((powMonoidHom a).comp (Matrix.detMonoidHom.comp (Matrix.unitaryGroup (Fin 2) ℂ).subtype)).ker

/-- `TauCeti.SymmetricPower.SatoTateGroup.isCompact`: `ST(π)` is compact. -/
theorem SatoTateGroup.isCompact (C : G5Context F) (π : C.AutRep 2) :
    IsCompact (SatoTateGroup C π : Set (Matrix.unitaryGroup (Fin 2) ℂ)) := by
  sorry

/-- `TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder`: `ψ` of finite order `a` ⇒
`ST(π) = {g ∈ U_2(ℝ) : det(g)^a = 1}`. -/
theorem SatoTateGroup.ofFiniteOrder (C : G5Context F) (π : C.AutRep 2) (a : ℕ)
    (ha : G5HasCharOrder C (G5psi C π) a) :
    (SatoTateGroup C π : Set (Matrix.unitaryGroup (Fin 2) ℂ)) =
      {g : Matrix.unitaryGroup (Fin 2) ℂ | (g : Matrix (Fin 2) (Fin 2) ℂ).det ^ a = 1} := by
  sorry

/-- `TauCeti.SymmetricPower.satoTateClass`: `[π_v] ⊆ ST(π)`, the intersection of `ST(π)` with the
`GL_2(ℂ)`-conjugacy class of `q_v^{−w/2} rec(π_v)(Frob_v)`. -/
def satoTateClass (C : G5Context F) (π : C.AutRep 2) (v : C.Place) :
    Set (Matrix.unitaryGroup (Fin 2) ℂ) :=
  {g | g ∈ SatoTateGroup C π ∧ ∃ h : GL (Fin 2) ℂ, (g : Matrix (Fin 2) (Fin 2) ℂ) =
    (h : Matrix (Fin 2) (Fin 2) ℂ) *
      (((C.absNorm v : ℂ) ^ (-(G5purityWeight C π : ℂ) / 2)) • C.frobMatrix π v) *
      ((h⁻¹ : GL (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ)}

/-- `TauCeti.SymmetricPower.satoTateClass_unique` (BCGNT Lemma 7.2.2): for `π_v` unramified and
essentially tempered, `[π_v]` is a single non-empty `ST(π)`-conjugacy class. -/
theorem satoTateClass_unique (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2)
    (hπ : C.IsCuspidal π) (hra : C.IsRegularAlgebraic π) (hcm : ¬ G5IsCMRep C π) (v : C.Place)
    (hv : ¬ C.IsArchimedean v) (hunr : C.IsUnramifiedAt π v) (htemp : C.IsEssTemperedAt π v) :
    (satoTateClass C π v).Nonempty ∧ ∀ g ∈ satoTateClass C π v, ∀ g' ∈ satoTateClass C π v,
      ∃ k ∈ SatoTateGroup C π, g' = k * g * k⁻¹ := by
  sorry

/-- Unit test `TauCeti.SymmetricPower.SatoTateGroup.eq_SU2_of_elliptic` (ML.3/sato-tate-group; renamed from
`satoTate_elliptic`, which is the declaration of ML.3/sato-tate-elliptic-curves): for `π` of a non-CM elliptic
curve over a CM field, `ψ = 1` and `ST(π) = SU(2) = U₂(ℝ)₁`. -/
theorem SatoTateGroup.eq_SU2_of_elliptic (C : G5Context F) (hF : IsCMField F)
    (E : WeierstrassCurve F) [E.IsElliptic] (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hE : C.IsAttachedToEllipticCurve π E) (hcm : ¬ G5IsCMRep C π) :
    G5psi C π = C.one ∧ (SatoTateGroup C π : Set (Matrix.unitaryGroup (Fin 2) ℂ)) =
      {g : Matrix.unitaryGroup (Fin 2) ℂ | (g : Matrix (Fin 2) (Fin 2) ℂ).det = 1} := by
  sorry

/-- `TauCeti.SymmetricPower.satoTate_infiniteOrder`: if `ψ` has infinite order, `ST(π) = U_2(ℝ)`. -/
theorem satoTate_infiniteOrder (C : G5Context F) (π : C.AutRep 2)
    (h : ∀ a, ¬ G5HasCharOrder C (G5psi C π) a) : SatoTateGroup C π = ⊤ := by
  sorry

/-- Equidistribution of `x_v ∈ G` (ordered by `q_v`) for a probability measure `μ`, tested on
continuous class functions. -/
def G5IsEquidistributed {G : Type} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (μ : MeasureTheory.Measure G) {V : Type} (q : V → ℕ) (x : V → G) : Prop :=
  ∀ f : G → ℂ, Continuous f → (∀ g h : G, f (h * g * h⁻¹) = f g) →
    Filter.Tendsto (fun X : ℕ => (∑ᶠ v ∈ {v | q v ≤ X}, f (x v)) / (Set.ncard {v | q v ≤ X} : ℂ))
      Filter.atTop (nhds (∫ g, f g ∂μ))

/-- The finite places where `π` is unramified (the complement of `S_π`). -/
abbrev G5UnramPlaces (C : G5Context F) (π : C.AutRep 2) : Type :=
  {v : C.Place // ¬ C.IsArchimedean v ∧ C.IsUnramifiedAt π v}

/-- `TauCeti.SymmetricPower.satoTate_cm_excluded`: for CM `π` the classes do not equidistribute in
`ST(π)` (they lie in the normaliser of a torus). -/
theorem satoTate_cm_excluded (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2)
    (hπ : C.IsCuspidal π) (hcm : G5IsCMRep C π) [MeasurableSpace (SatoTateGroup C π)]
    [BorelSpace (SatoTateGroup C π)] (μ : MeasureTheory.Measure (SatoTateGroup C π))
    [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (x : G5UnramPlaces C π → SatoTateGroup C π)
    (hx : ∀ v, (x v : Matrix.unitaryGroup (Fin 2) ℂ) ∈ satoTateClass C π v.1) :
    ¬ G5IsEquidistributed μ (fun v => C.absNorm v.1) x := by
  sorry

/-- The partial L-function `L^S(ρ, s) = ∏_{v ∉ S} det(1 − q_v^{−s} ρ(x_v))^{−1}` of Serre's
criterion. -/
def G5serreL {G : Type} [Group G] {d : ℕ} (ρ : G →* GL (Fin d) ℂ)
    (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (x : IsDedekindDomain.HeightOneSpectrum (𝓞 F) → G) (s : ℂ) : ℂ :=
  ∏' v : {v // v ∉ S}, ((1 - ((Ideal.absNorm v.1.asIdeal : ℂ) ^ (-s)) •
    ((ρ (x v.1) : GL (Fin d) ℂ) : Matrix (Fin d) (Fin d) ℂ)).det)⁻¹

/-- `TauCeti.SymmetricPower.serre_criterion` (ML.3/serre-equidistribution-criterion; Serre, Ch. I,
Appendix): for a compact group `ST` and `x_v ∈ ST` indexed by the finite places of `F` outside a
finite `S`, if for every non-trivial irreducible continuous `ρ` the `L^S(ρ, s)` continues
meromorphically to `ℂ`, holomorphic and non-vanishing on `Re s = 1`, then the `x_v` are
equidistributed for the Haar probability measure. -/
theorem serre_criterion {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] (μ : MeasureTheory.Measure G)
    [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) (hS : S.Finite)
    (x : IsDedekindDomain.HeightOneSpectrum (𝓞 F) → G)
    (hL : ∀ (d : ℕ) (ρ : G →* GL (Fin d) ℂ), Continuous ρ → G5IsIrreducibleGL ρ →
      ¬ (d = 1 ∧ ∀ g, ρ g = 1) → ∃ g : ℂ → ℂ, MeromorphicOn g Set.univ ∧
        (∀ s : ℂ, 1 < s.re → g s = G5serreL ρ S x s) ∧
        ∀ s : ℂ, s.re = 1 → AnalyticAt ℂ g s ∧ g s ≠ 0) :
    G5IsEquidistributed μ (fun v : {v // v ∉ S} => Ideal.absNorm v.1.asIdeal) (fun v => x v.1) := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_satoTate` (ML.3/bianchi-sato-tate; BCGNT Theorem B = 7.2.3): for
`F` imaginary CM and `π` cuspidal regular algebraic of parallel weight, not CM, the classes
`[π_v] ∈ ST(π)` at the finite places outside the ramified set `S_π` are equidistributed for the Haar
probability measure of `ST(π)`. -/
theorem bianchi_satoTate (C : G5Context F) (hF : IsCMField F) (π : C.AutRep 2)
    (hπ : C.IsCuspidal π) (hra : C.IsRegularAlgebraic π) (hpar : IsParallelWeight C π)
    (hcm : ¬ G5IsCMRep C π) [MeasurableSpace (SatoTateGroup C π)]
    [BorelSpace (SatoTateGroup C π)] (μ : MeasureTheory.Measure (SatoTateGroup C π))
    [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (x : G5UnramPlaces C π → SatoTateGroup C π)
    (hx : ∀ v, (x v : Matrix.unitaryGroup (Fin 2) ℂ) ∈ satoTateClass C π v.1) :
    G5IsEquidistributed μ (fun v => C.absNorm v.1) x := by
  sorry

/-! ### ML.3/bianchi-modular-forms -/

/-- Supplier data for Bianchi modular forms over `F` (owner: ArithmeticLocallySymmetricSpaces ALS.3,
AutomorphicFormsOnReductiveGroups AF.3). -/
structure G5BianchiContext (C : G5Context F) where
  /-- The vector-valued function `f` on `GL_2(𝔸_F)` (values in `ℂ^{2k−1}`) is a cusp form generating
  `π`. -/
  Generates : ∀ {k : ℕ}, (GL (Fin 2) (AdeleRing (𝓞 F) F) → (Fin (2 * k - 1) → ℂ)) → C.AutRep 2 → Prop
  /-- The Fourier coefficients `c(I, f)` of the expansion
  `f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F, f) W(αt_∞) e_F(αz)`. -/
  fourierCoeff : ∀ {k : ℕ}, (GL (Fin 2) (AdeleRing (𝓞 F) F) → (Fin (2 * k - 1) → ℂ)) →
    FractionalIdeal (nonZeroDivisors (𝓞 F)) F → ℂ
  /-- `π` has (newform) level `𝔫`. -/
  HasLevel : C.AutRep 2 → Ideal (𝓞 F) → Prop
  /-- The `T_𝔭`-eigenvalue of the newvector of `π`. -/
  heckeEigenvalue : C.AutRep 2 → Ideal (𝓞 F) → ℂ
  /-- `#E(k_𝔭)` for `E/F` with good reduction at `𝔭` (owner: R23.1). -/
  pointCount : WeierstrassCurve F → Ideal (𝓞 F) → ℕ
  /-- Parabolic cohomology `H_par ⊆ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²})` (summed over the
  components when `h_F > 1`) and the Hecke operators `T_𝔭` on it. -/
  Hpar : Ideal (𝓞 F) → ℕ → ModuleCat ℂ
  heckeOp : ∀ (𝔫 : Ideal (𝓞 F)) (k : ℕ), Ideal (𝓞 F) → (Hpar 𝔫 k →ₗ[ℂ] Hpar 𝔫 k)

/-- `TauCeti.SymmetricPower.BianchiEigenform` (ML.3/bianchi-modular-forms): a cuspidal Bianchi
eigenform of weight `k` and level `𝔫`: a function on `GL_2(𝔸_F)` generating a regular algebraic
cuspidal `π` of parallel weight `k` and level `𝔫`, normalised by `c(𝒪_F, f) = 1`. -/
structure BianchiEigenform (C : G5Context F) (B : G5BianchiContext C) (k : ℕ)
    (𝔫 : Ideal (𝓞 F)) where
  /-- The function `f`. -/
  toFun : GL (Fin 2) (AdeleRing (𝓞 F) F) → (Fin (2 * k - 1) → ℂ)
  /-- `TauCeti.SymmetricPower.BianchiEigenform.toAutRep`: the cuspidal automorphic representation
  generated by `f`. -/
  toAutRep : C.AutRep 2
  generates : B.Generates toFun toAutRep
  isCuspidal : C.IsCuspidal toAutRep
  isRegularAlgebraic : C.IsRegularAlgebraic toAutRep
  parallel : IsParallelWeight C toAutRep ∧ parallelWeight C toAutRep = k
  level : B.HasLevel toAutRep 𝔫
  normalised : B.fourierCoeff toFun 1 = 1

variable {C : G5Context F} {B : G5BianchiContext C} {k : ℕ} {𝔫 : Ideal (𝓞 F)}

/-- `TauCeti.SymmetricPower.BianchiEigenform.coeff`: the Fourier coefficient `c(I, f)`. -/
def BianchiEigenform.coeff (f : BianchiEigenform C B k 𝔫) (I : FractionalIdeal (nonZeroDivisors (𝓞 F)) F) : ℂ :=
  B.fourierCoeff f.toFun I

/-- `TauCeti.SymmetricPower.BianchiEigenform.coeff_one`: `c(𝒪_F, f) = 1`. -/
@[simp] theorem BianchiEigenform.coeff_one (f : BianchiEigenform C B k 𝔫) : f.coeff 1 = 1 :=
  f.normalised

/-- `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue`: for `𝔭 ∤ 𝔫`, `c(𝔭, f)` is the
`T_𝔭`-eigenvalue. -/
theorem BianchiEigenform.coeff_eq_eigenvalue (hF : Module.finrank ℚ F = 2)
    (hF' : IsTotallyComplex F) (f : BianchiEigenform C B k 𝔫) (𝔭 : Ideal (𝓞 F)) (hp : 𝔭.IsPrime)
    (hp0 : 𝔭 ≠ ⊥) (hpn : ¬ 𝔫 ≤ 𝔭) :
    f.coeff (𝔭 : FractionalIdeal (nonZeroDivisors (𝓞 F)) F) = B.heckeEigenvalue f.toAutRep 𝔭 := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_weight2_elliptic`: a modular elliptic curve over `F` of
conductor `𝔫` without CM by `F` gives a weight-2 eigenform with `c(𝔭, f) = N(𝔭) + 1 − #E(F_𝔭)`. -/
theorem bianchi_weight2_elliptic (hF : Module.finrank ℚ F = 2) (hF' : IsTotallyComplex F)
    (E : WeierstrassCurve F) [E.IsElliptic] (π : C.AutRep 2) (hπ : C.IsCuspidal π)
    (hE : C.IsAttachedToEllipticCurve π E) (hlev : B.HasLevel π 𝔫) :
    ∃ f : BianchiEigenform C B 2 𝔫, f.toAutRep = π ∧ ∀ 𝔭 : Ideal (𝓞 F), 𝔭.IsPrime → 𝔭 ≠ ⊥ →
      ¬ 𝔫 ≤ 𝔭 → f.coeff (𝔭 : FractionalIdeal (nonZeroDivisors (𝓞 F)) F) =
        (Ideal.absNorm 𝔭 : ℂ) + 1 - (B.pointCount E 𝔭 : ℂ) := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_coeff_nonintegral`: `c(I, f) = 0` for `I ⊄ 𝒪_F`. -/
theorem bianchi_coeff_nonintegral (f : BianchiEigenform C B k 𝔫) (I : FractionalIdeal (nonZeroDivisors (𝓞 F)) F)
    (hI : ¬ I ≤ 1) : f.coeff I = 0 := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_not_holomorphic`: Bianchi forms are not holomorphic forms on a
Hermitian domain: `ℍ³ = ℂ × ℝ_{>0}` has odd real dimension `3`, while every complex vector space
has even real dimension, so `ℍ³` carries no complex structure (hence no holomorphic
`q`-expansion). -/
theorem bianchi_not_holomorphic :
    Module.finrank ℝ (ℂ × ℝ) = 3 ∧
      ∀ (V : Type) [AddCommGroup V] [Module ℂ V] [Module ℝ V] [IsScalarTower ℝ ℂ V]
        [FiniteDimensional ℂ V], Module.finrank ℝ V ≠ 3 := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_coeff_bound` (ML.3/bianchi-fourier-ramanujan; BCGNT Theorem E):
`|c(𝔭, f)| ≤ 2 N(𝔭)^{(k−1)/2}` for `𝔭 ∤ 𝔫`. -/
theorem bianchi_coeff_bound (hF : Module.finrank ℚ F = 2) (hF' : IsTotallyComplex F)
    (f : BianchiEigenform C B k 𝔫) (𝔭 : Ideal (𝓞 F)) (hp : 𝔭.IsPrime) (hp0 : 𝔭 ≠ ⊥)
    (hpn : ¬ 𝔫 ≤ 𝔭) :
    ‖f.coeff (𝔭 : FractionalIdeal (nonZeroDivisors (𝓞 F)) F)‖ ≤
      2 * (Ideal.absNorm 𝔭 : ℝ) ^ (((k : ℝ) - 1) / 2) := by
  sorry

/-- `TauCeti.SymmetricPower.bianchi_cohomology_bound` (ML.3/bianchi-parabolic-cohomology-ramanujan;
BCGNT Theorem F): every eigenvalue `a_𝔭` of `T_𝔭` on `H_par`, `𝔭 ∤ 𝔫` principal prime, satisfies
`|a_𝔭| ≤ 2 N(𝔭)^{(k−1)/2}`. -/
theorem bianchi_cohomology_bound (hF : Module.finrank ℚ F = 2) (hF' : IsTotallyComplex F)
    (B : G5BianchiContext C) (𝔫 : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥) (k : ℕ) (hk : 2 ≤ k)
    (𝔭 : Ideal (𝓞 F)) (hp : 𝔭.IsPrime) (hp0 : 𝔭 ≠ ⊥) (hprin : Submodule.IsPrincipal 𝔭)
    (hpn : ¬ 𝔫 ≤ 𝔭) (a : ℂ) (ha : Module.End.HasEigenvalue (B.heckeOp 𝔫 k 𝔭) a) :
    ‖a‖ ≤ 2 * (Ideal.absNorm 𝔭 : ℝ) ^ (((k : ℝ) - 1) / 2) := by
  sorry

/-- Supplier data for the quotient `Γ\ℍ³`, `Γ = SL_2(𝒪_F)`, with its normalised hyperbolic volume
and Marshall's normalised measures `μ_f` of level-one eigenforms (owner: ArithmeticLocally-
SymmetricSpaces ALS.3). -/
structure G5BianchiGeometry (B : G5BianchiContext C) where
  /-- `Γ\ℍ³`. -/
  Y : Type
  [top : TopologicalSpace Y]
  [meas : MeasurableSpace Y]
  [borel : BorelSpace Y]
  /-- The normalised hyperbolic volume. -/
  vol : MeasureTheory.ProbabilityMeasure Y
  /-- Marshall's measure `μ_f` of a level-one eigenform. -/
  mass : ∀ {k : ℕ}, BianchiEigenform C B k ⊤ → MeasureTheory.ProbabilityMeasure Y

attribute [instance] G5BianchiGeometry.top G5BianchiGeometry.meas G5BianchiGeometry.borel

/-- `TauCeti.SymmetricPower.bianchi_massEquidistribution` (ML.3/bianchi-mass-equidistribution; BCGNT
Theorem G): for `F` imaginary quadratic of class number one and level-one eigenforms `f_j` of weight
`k_j → ∞`, `μ_{f_j}` converges weakly to the normalised hyperbolic volume. -/
theorem bianchi_massEquidistribution (hF : Module.finrank ℚ F = 2) (hF' : IsTotallyComplex F)
    (hh : classNumber F = 1) (G : G5BianchiGeometry B) (f : ℕ → Σ k : ℕ, BianchiEigenform C B k ⊤)
    (hk : Filter.Tendsto (fun j => (f j).1) Filter.atTop Filter.atTop) :
    Filter.Tendsto (fun j => G.mass (f j).2) Filter.atTop (nhds G.vol) := by
  sorry

end SymmetricPower

end TauCeti
