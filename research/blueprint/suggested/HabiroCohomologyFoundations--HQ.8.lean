/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroCohomologyFoundations--HQ.8.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-HabiroCohomologyFoundations--HQ.8, rewritten by the independent review
REV-HabiroCohomologyFoundations--HQ.8: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 (no `TauCeti.*` module is
imported: none of the objects below exists there). The file elaborates against the
pinned Mathlib with `declaration uses 'sorry'` as its only warning.

The layer is the comparison atlas of the roadmap. Its own mathematics is small:
the congruences relating the completion ideals of its two bases, the record a
square must carry, and the assembly of each square from maps that other layers
and other roadmaps construct. The file has three parts.

* The executable layer is stated against Mathlib and proved: the q-de Rham prism
  generator `[p]_q = Φ_p(q)` with its value `p` at `q = 1`, the factorisation
  `q^p - 1 = (q - 1) [p]_q`, the unit relation between `(ζ_p - 1)^(p-1)` and `p`,
  and the element `q = [ε]` of `A_inf = W(O♭)` with `θ([ε])` computed by
  Mathlib's Fontaine map.
* The record of a square (`AtlasSquare`) is a structure with one field per item of
  the record; the eight squares of the layer are written out as terms, and the
  unit tests are checked by `rfl`.
* Every cohomology theory in a corner is imported. Each square is stated against a
  structure of data and laws whose docstring names the owner of every field
  (PrismaticCohomology PR.0, PR.1, PR.3, PR.6; AInfCohomology AI.1, AI.3;
  CrystallineCohomology CR.4; DerivedDeRhamCohomology DD.2; and the nodes of
  HQ.1 to HQ.5 of this roadmap). An ∞-category is represented by a Mathlib
  category supplied by its owner, read as its 1-categorical shadow; `≅` of
  functors is read as the corresponding natural equivalence. Each square is then
  the composite, in that category, of the imported identifications; what the
  layer adds is the record, the order of the steps and the base change written
  out.

No `Prop` standing for a comparison or a condition is introduced as an opaque
field or hypothesis, no statement is trivially true, and no axiom is used. The
commutation theorem of the layer is the conjunction of the square declarations
below; it is not restated as one declaration because its squares live in
different categories. The staging rule and the acceptance suite are constraints
on the packet and are recorded in comments, not as declarations. The failure of
the décalage filtrations to glue is a remark of the source, not a theorem, and is
recorded in a comment.
-/
import Mathlib.Algebra.Exact.Basic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.CategoryTheory.CommSq
import Mathlib.CategoryTheory.Whiskering
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval

noncomputable section

namespace TauCeti.HabiroCohomology

section HQ8

open CategoryTheory Polynomial

universe u v w

/-! ## The executable layer: the two bases and their congruences

Node `HQ.8/the-q-de-rham-prism-and-its-perfectoid-base`. The q-de Rham prism
`(ℤ_p⟦q-1⟧, [p]_q)` and the perfect prism `(A_inf, [p]_q)` are owned by
PrismaticCohomology PR.0, q-PD pairs by PR.6; what is stated here is the arithmetic
the atlas uses to identify completion ideals across corners, in the polynomial ring
`ℤ[q]` (every identity maps to `ℤ_p⟦q-1⟧`). -/

namespace qDeRhamPrism

variable (p : ℕ) [Fact p.Prime]

/-- The generator of the q-de Rham prism ideal is `[p]_q`, the `p`-th cyclotomic
polynomial, which is the geometric sum `1 + q + ⋯ + q^(p-1)`; it is NOT `q - 1`. -/
theorem prismIdeal_eq_geomSum :
    cyclotomic p ℤ = ∑ i ∈ Finset.range p, (X : ℤ[X]) ^ i :=
  cyclotomic_prime ℤ p

/-- `[p]_q ≡ p` modulo `q - 1`: the prism ideal generator specialises to `p` at `q = 1`. -/
theorem eval_one_prismIdeal : (cyclotomic p ℤ).eval 1 = p := by
  simp

/-- The Frobenius `q ↦ q^p` carries `q - 1` into the prism ideal:
`q^p - 1 = (q - 1) [p]_q`. -/
theorem X_pow_sub_one_eq : (X : ℤ[X]) ^ p - 1 = (X - 1) * cyclotomic p ℤ := by
  rw [mul_comm, cyclotomic_prime_mul_X_sub_one]

/-- The case `p = 3` of the unit relation: `(q - 1)^2 = [3]_q - 3q`, so modulo `[3]_q`
the elements `(q - 1)^2` and `3` differ by the unit `-q` (as `q^3 = 1` there). -/
theorem sub_one_sq_add_three_mul_X :
    ((X : ℤ[X]) - 1) ^ 2 + 3 * X = cyclotomic 3 ℤ := by
  rw [cyclotomic_three]
  ring

/-- `(ζ_p - 1)^(p-1)` and `p` are associated in the ring of integers of `ℚ(ζ_p)`; base
change to `ℤ_p[ζ_p] = ℤ_p⟦q-1⟧/[p]_q` gives the second congruence of Bhatt–Scholze,
Notation 16.1 (Mathlib states it over the number field). -/
theorem sub_one_pow_associated {K : Type*} [Field K] {ζ : K} (hζ : IsPrimitiveRoot ζ p) :
    Associated ((hζ.toInteger - 1) ^ (p - 1)) (p : NumberField.RingOfIntegers K) :=
  IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime p hζ

end qDeRhamPrism

namespace perfectoidBase

variable (O : Type u) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
  [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- Fontaine's `θ : A_inf(O) = W(O♭) → O` sends the Teichmüller lift `q = [ε]` of
`ε ∈ O♭` to the untilt of `ε`; for `ε = (1, ζ_p, ζ_{p^2}, …)` this is `1`, which is why
`q - 1` lies in the kernel of `θ` and the map `ℤ_p⟦q-1⟧ → A_inf`, `q ↦ [ε]`, is compatible
with `q ↦ 1`. -/
theorem theta_teichmuller (ε : PreTilt O p) :
    WittVector.fontaineTheta O p (WittVector.teichmuller p ε) = ε.untilt :=
  WittVector.fontaineTheta_teichmuller ε

end perfectoidBase

/-! ## The record of a square

Node `HQ.8/what-an-atlas-square-records`. -/

namespace AtlasSquare

/-- The base of a square. -/
inductive Base where
  /-- The q-de Rham prism `(Â_p⟦q-1⟧, [p]_q)` at the prime `p` (PrismaticCohomology PR.0). -/
  | qDeRhamPrism (p : ℕ)
  /-- The q-PD pair `(Â_p⟦q-1⟧, (q-1))` at `p`; `(q-1)` is not a prism ideal (PR.6). -/
  | qDeRhamPD (p : ℕ)
  /-- The perfect prism `(A_inf, [p]_q)` with `q = [ε]` for a chosen compatible system of
  primitive `p`-power roots of unity, and its q-PD pair `(A_inf, (ξ))`, `ξ = φ⁻¹([p]_q)`. -/
  | perfectoid (p : ℕ)
  /-- The global coefficient ring `A⟦q-1⟧` of a Λ-ring `A`, with the ideal `(q-1)`. -/
  | global
  /-- The ring `A[q]/(q^m - 1)`, the reduction at the `m`-th roots of unity. -/
  | cyclotomic (m : ℕ)
  deriving DecidableEq

/-- The class of inputs over which a square is asserted (the intersection of the hypothesis
sets of its two imported maps). -/
inductive InputClass where
  | smooth
  | smoothWithQHodge
  | pCompletelySmooth
  | smoothProper
  | quasiLci
  | quasiSyntomic
  deriving DecidableEq

/-- The ideal at which the corners are derived complete. -/
inductive CompletionIdeal where
  /-- `(p, q-1)`, equivalently `(p, [p]_q)`. -/
  | pAndQSubOne (p : ℕ)
  /-- `(p, ξ)` in `A_inf`, equivalently `(p, q-1)` there. -/
  | pAndXi (p : ℕ)
  | p (p : ℕ)
  | qSubOne
  | qPowSubOne (m : ℕ)
  deriving DecidableEq

/-- What is inverted, and in which order with the completion. -/
inductive Inversion where
  | nothing
  /-- Rationalise the `p`-completion, then complete at `q - 1` (clause (c_p)). -/
  | pCompleteThenRationalise (p : ℕ)
  /-- Rationalise, then complete at `q - 1` (clause (c)). -/
  | rationaliseThenComplete
  deriving DecidableEq

/-- The Frobenius linearisation of a square. -/
inductive Linearisation where
  | none
  /-- The `p`-th Adams operation `ψ^p`, with `q ↦ q^p`. -/
  | adams (p : ℕ)
  /-- The `α`-fold Frobenius twist `φ^α`. -/
  | adamsIter (p α : ℕ)
  /-- The Frobenius pullback `φ_A^*` over `A_inf`. -/
  | frobeniusAinf (p : ℕ)
  deriving DecidableEq

/-- The filtration carried by a corner. -/
inductive Filtration where
  | none
  | hodge
  | hodgeAndAdic
  | nygaard
  | conjugate
  | stupid
  | twistedQHodge
  | decalage
  | qWittOmega
  deriving DecidableEq

/-- The Tate or Breuil–Kisin twist by which the two sides differ. -/
inductive Twist where
  | trivial
  | breuilKisin (n : ℤ)
  deriving DecidableEq

/-- What the comparison of a square is. -/
inductive Loss where
  /-- An equivalence outright. -/
  | outright
  /-- An equivalence only after the named base change. -/
  | afterBaseChange
  /-- A map with named compatibilities, not claimed to be an equivalence. -/
  | mapOnly
  /-- A short exact sequence with a torsion term, not an isomorphism on cohomology. -/
  | shortExactSequence
  deriving DecidableEq

end AtlasSquare

/-- The record a square of the atlas must carry: one field per item. A square with an
incomplete record cannot be written down. -/
structure AtlasSquare where
  /-- The base. -/
  base : AtlasSquare.Base
  /-- The input class, the intersection of the hypothesis sets of the imported maps. -/
  input : AtlasSquare.InputClass
  /-- The completion ideal. -/
  completion : AtlasSquare.CompletionIdeal
  /-- What is inverted, and in which order. -/
  inversion : AtlasSquare.Inversion
  /-- The Frobenius linearisation. -/
  linearisation : AtlasSquare.Linearisation
  /-- The filtration on the source corner. -/
  sourceFiltration : AtlasSquare.Filtration
  /-- The filtration on the target corner. -/
  targetFiltration : AtlasSquare.Filtration
  /-- The Tate or Breuil–Kisin twist. -/
  twist : AtlasSquare.Twist
  /-- Whether the comparison is an equivalence outright, after a base change, a map only,
  or a short exact sequence. -/
  loss : AtlasSquare.Loss
  deriving DecidableEq

namespace AtlasSquare

/-- The record of the local prismatic square at `p` (node `HQ.8/the-local-prismatic-square`). -/
def localPrismatic (p : ℕ) : AtlasSquare where
  base := .qDeRhamPrism p
  input := .smooth
  completion := .pAndQSubOne p
  inversion := .nothing
  linearisation := .adams p
  sourceFiltration := .none
  targetFiltration := .none
  twist := .trivial
  loss := .outright

/-- The record of the compatibility square of the q-crystalline square
(node `HQ.8/the-q-crystalline-square`, Lemma A.10). -/
def qCrystalline (p : ℕ) : AtlasSquare where
  base := .qDeRhamPD p
  input := .pCompletelySmooth
  completion := .qSubOne
  inversion := .pCompleteThenRationalise p
  linearisation := .none
  sourceFiltration := .none
  targetFiltration := .none
  twist := .trivial
  loss := .outright

/-- The record of the A_inf square (node `HQ.8/the-a-infinity-square`). -/
def aInf (p : ℕ) : AtlasSquare where
  base := .perfectoid p
  input := .smooth
  completion := .pAndXi p
  inversion := .nothing
  linearisation := .frobeniusAinf p
  sourceFiltration := .none
  targetFiltration := .none
  twist := .trivial
  loss := .afterBaseChange

/-- The record of the décalage square at `q - 1` (node `HQ.8/the-decalage-squares`). -/
def decalageQSubOne : AtlasSquare where
  base := .global
  input := .smoothWithQHodge
  completion := .qSubOne
  inversion := .nothing
  linearisation := .none
  sourceFiltration := .twistedQHodge
  targetFiltration := .none
  twist := .trivial
  loss := .outright

/-- The record of the décalage square at the prism ideal
(node `HQ.8/the-decalage-square-at-the-prism-ideal`). -/
def decalagePrismIdeal (p : ℕ) : AtlasSquare where
  base := .qDeRhamPrism p
  input := .smooth
  completion := .pAndQSubOne p
  inversion := .nothing
  linearisation := .adams p
  sourceFiltration := .nygaard
  targetFiltration := .decalage
  twist := .trivial
  loss := .outright

/-- The record of the Nygaard square (node `HQ.8/the-nygaard-square`). -/
def nygaard (p α : ℕ) : AtlasSquare where
  base := .qDeRhamPrism p
  input := .smooth
  completion := .p p
  inversion := .nothing
  linearisation := .adamsIter p α
  sourceFiltration := .nygaard
  targetFiltration := .nygaard
  twist := .trivial
  loss := .outright

/-- The record of the crystalline square (node `HQ.8/the-crystalline-and-de-rham-witt-square`). -/
def crystalline (p α : ℕ) : AtlasSquare where
  base := .cyclotomic (p ^ α)
  input := .smooth
  completion := .p p
  inversion := .nothing
  linearisation := .adamsIter p α
  sourceFiltration := .qWittOmega
  targetFiltration := .stupid
  twist := .trivial
  loss := .mapOnly

/-- The record of the square at `q = 1` (node `HQ.8/the-de-rham-square`). -/
def qEqOne : AtlasSquare where
  base := .global
  input := .smooth
  completion := .qSubOne
  inversion := .nothing
  linearisation := .none
  sourceFiltration := .conjugate
  targetFiltration := .hodge
  twist := .trivial
  loss := .shortExactSequence

end AtlasSquare

/-- Unit test `AtlasSquare.localPrismatic_record`: the local prismatic square is over the
q-de Rham prism, complete at `(p, q-1)`, twisted by `ψ^p`, and an equivalence outright. -/
example (p : ℕ) :
    (AtlasSquare.localPrismatic p).base = .qDeRhamPrism p ∧
      (AtlasSquare.localPrismatic p).completion = .pAndQSubOne p ∧
      (AtlasSquare.localPrismatic p).linearisation = .adams p ∧
      (AtlasSquare.localPrismatic p).loss = .outright :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- Unit test `AtlasSquare.localPrismatic_base_ne_qDeRhamPD`: the base of the local prismatic
square is the prism `([p]_q)`, not the q-PD pair `((q-1))`. -/
example (p : ℕ) : (AtlasSquare.localPrismatic p).base ≠ .qDeRhamPD p := by
  simp [AtlasSquare.localPrismatic]

/-- Unit test `AtlasSquare.aInf_loss_ne_outright`: the A_inf square is an equivalence only
after base change to the perfectoid base, never outright. -/
example (p : ℕ) : (AtlasSquare.aInf p).loss ≠ .outright := by
  simp [AtlasSquare.aInf]

/-- Unit test `AtlasSquare.qEqOne_filtrations`: at `q = 1` the deformed side carries the
conjugate filtration, the classical side the Hodge filtration, and the comparison is a short
exact sequence. -/
example :
    AtlasSquare.qEqOne.sourceFiltration = .conjugate ∧
      AtlasSquare.qEqOne.targetFiltration = .hodge ∧
      AtlasSquare.qEqOne.loss = .shortExactSequence :=
  ⟨rfl, rfl, rfl⟩

/-- Unit test `AtlasSquare.completion_then_rationalise_ne`: completing at `p` and then
inverting `p` is not inverting `p`: the canonical map `ℚ → ℚ_p` is not surjective, which is
why the order of completion and inversion is an item of the record. -/
example (p : ℕ) [Fact p.Prime] : ¬ Function.Surjective (algebraMap ℚ ℚ_[p]) := by
  sorry

/-- Unit test `AtlasSquare.pCompletion_of_rat_vanishes`: the `p`-adic completion of `ℚ` is
zero, so a base change that starts with `p`-completion discards all rational information. -/
example (p : ℕ) [Fact p.Prime] : Subsingleton (AdicCompletion (Ideal.span {(p : ℤ)}) ℚ) := by
  sorry

/-! ## The squares, against imported data

∞-categories are represented by Mathlib categories supplied by their owners, and functors
out of a category of inputs (smooth algebras, `p`-completely smooth algebras, pairs with a
q-Hodge filtration) are the cohomology theories. -/

/-- Imported data for the local prismatic square at a prime `p`.

Owners: `qOmega` is the global q-de Rham complex of HabiroCohomologyFoundations
HQ.1 (`HQ.1/the-global-q-de-rham-complex`), `pComplete` the `p`-completion, and `corner` the
identification of the `p`-completion of its defining pullback with its upper right corner
(Construction A.12, `HQ.1/what-the-global-complex-satisfies`); `qOmegaLocal` is q-crystalline
cohomology relative to the q-PD pair `(Â_p⟦q-1⟧, (q-1))` and `prismTwist` prismatic cohomology of
`S^(p)[ζ_p]` relative to the q-de Rham prism, with `qcrysPrism` Bhatt–Scholze Theorem 16.18
(PrismaticCohomology PR.6). -/
structure LocalPrismaticData (Sm : Type u) [Category.{v} Sm] (𝒟 𝒟p : Type w)
    [Category.{v} 𝒟] [Category.{v} 𝒟p] where
  /-- The global q-de Rham complex (HQ.1). -/
  qOmega : Sm ⥤ 𝒟
  /-- `p`-completion. -/
  pComplete : 𝒟 ⥤ 𝒟p
  /-- q-crystalline cohomology of `Ŝ_p` over `(Â_p⟦q-1⟧, (q-1))` (PR.6). -/
  qOmegaLocal : Sm ⥤ 𝒟p
  /-- Prismatic cohomology of `S^(p)[ζ_p]` over `(Â_p⟦q-1⟧, [p]_q)` (PR.6). -/
  prismTwist : Sm ⥤ 𝒟p
  /-- The upper right corner of the defining pullback (HQ.1, Construction A.12). -/
  corner : qOmega ⋙ pComplete ≅ qOmegaLocal
  /-- Bhatt–Scholze Theorem 16.18 (PR.6). -/
  qcrysPrism : qOmegaLocal ≅ prismTwist

/-- The local prismatic square: `(qΩ_{S/A})^∧_p ≃ Δ_{S^(p)[ζ_p]/Â_p⟦q-1⟧}`, the global gluing
commuting with the prismatic identification by construction (Theorem A.1(b)). -/
def localPrismaticSquare {Sm : Type u} [Category.{v} Sm] {𝒟 𝒟p : Type w}
    [Category.{v} 𝒟] [Category.{v} 𝒟p] (D : LocalPrismaticData Sm 𝒟 𝒟p) :
    D.qOmega ⋙ D.pComplete ≅ D.prismTwist :=
  D.corner ≪≫ D.qcrysPrism

/-- Imported data for the q-crystalline square: the four corners after rationalisation and
`(q-1)`-completion, over the q-PD pair `(Â_p⟦q-1⟧, (q-1))`.

Owners: `top` is the coordinate-free comparison (HQ.1, Lemma A.4,
`HQ.1/rationalised-q-crystalline-comparison`), `bottom` the explicit framed isomorphism (HQ.1,
Lemma A.9, `HQ.1/the-coordinate-comparison-and-its-compatibility`), `left` Bhatt–Scholze
Theorem 16.22 (PR.6), `right` the crystalline Poincaré lemma (CrystallineCohomology CR.2), and
`compat` is Lemma A.10 (HQ.1, `HQ.1/the-compatibility-square`). -/
structure QCrystallineData (𝒞 : Type u) [Category.{v} 𝒞] where
  /-- Rationalised q-crystalline cohomology. -/
  qcrys : 𝒞
  /-- Rationalised crystalline cohomology, extended over `⟦q-1⟧`. -/
  crys : 𝒞
  /-- The rationalised q-PD de Rham complex of the framed datum. -/
  qdR : 𝒞
  /-- The rationalised PD de Rham complex, extended over `⟦q-1⟧`. -/
  dR : 𝒞
  /-- Lemma A.4 (HQ.1). -/
  top : qcrys ≅ crys
  /-- Lemma A.9 (HQ.1). -/
  bottom : qdR ≅ dR
  /-- Bhatt–Scholze Theorem 16.22 (PR.6). -/
  left : qcrys ≅ qdR
  /-- Crystalline cohomology against the PD de Rham complex (CR.2). -/
  right : crys ≅ dR
  /-- Lemma A.10 (HQ.1). -/
  compat : top.hom ≫ right.hom = left.hom ≫ bottom.hom

/-- The q-crystalline square commutes (Lemma A.10, imported from HQ.1). -/
theorem qCrystallineSquare {𝒞 : Type u} [Category.{v} 𝒞] (D : QCrystallineData 𝒞) :
    CommSq D.top.hom D.left.hom D.right.hom D.bottom.hom :=
  ⟨D.compat⟩

/-- Imported data for the A_inf square, for a perfectoid field `C ⊇ μ_{p^∞}` with a chosen
`ε = (1, ζ_p, ζ_{p^2}, …)` and `q = [ε] ∈ A_inf`.

Owners: `qOmegaLocal` is `(qΩ_{S/ℤ})^∧_p` (HQ.1) and `prismLocal` prismatic cohomology of
`Ŝ_p^(p)[ζ_p]` over the q-de Rham prism, with `qcrysPrismLocal` Theorem 16.18 (PR.6);
`baseChange` is the `(p, [p]_q)`-completed base change along the map of bounded prisms
`(ℤ_p⟦q-1⟧, [p]_q) → (A_inf, [p]_q)`, `q ↦ [ε]` (PR.0), and `toOC` sends `S` to
`R = (S ⊗ O_C)^∧_p`; `prismBaseChange` is base change for prismatic cohomology (Bhatt–Scholze
Corollary 4.12, PR.1) combined with `R^(1) ≅ Ŝ_p^(p)[ζ_p] ⊗ A_inf/[p]_q`; `prismAinf` is
`Δ_{R^(1)/A_inf} = φ_A^* Δ_{R/A_inf}`, `qOmegaAinf` q-crystalline cohomology over the q-PD pair
`(A_inf, (ξ))` and `qcrysPrismAinf` Theorem 16.18 for it (PR.6); `AOmega` is `AΩ_R`
(AInfCohomology AI.3) and `qOmegaAOmega` Bhatt–Scholze Theorem 17.2 (PR.6). -/
structure AInfSquareData (Sm SmO : Type u) [Category.{v} Sm] [Category.{v} SmO]
    (𝒟p 𝒟A : Type w) [Category.{v} 𝒟p] [Category.{v} 𝒟A] where
  /-- `(qΩ_{S/ℤ})^∧_p` (HQ.1). -/
  qOmegaLocal : Sm ⥤ 𝒟p
  /-- Prismatic cohomology over the q-de Rham prism (PR.6). -/
  prismLocal : Sm ⥤ 𝒟p
  /-- Theorem 16.18 over `(ℤ_p⟦q-1⟧, (q-1))` (PR.6). -/
  qcrysPrismLocal : qOmegaLocal ≅ prismLocal
  /-- Completed base change along `q ↦ [ε]` (PR.0). -/
  baseChange : 𝒟p ⥤ 𝒟A
  /-- `S ↦ (S ⊗ O_C)^∧_p`. -/
  toOC : Sm ⥤ SmO
  /-- `φ_A^* Δ_{R/A_inf}` (PR.1, PR.6). -/
  prismAinf : SmO ⥤ 𝒟A
  /-- Base change for prismatic cohomology along the map of bounded prisms (PR.1). -/
  prismBaseChange : prismLocal ⋙ baseChange ≅ toOC ⋙ prismAinf
  /-- q-crystalline cohomology over `(A_inf, (ξ))` (PR.6). -/
  qOmegaAinf : SmO ⥤ 𝒟A
  /-- Theorem 16.18 over `(A_inf, (ξ))` (PR.6). -/
  qcrysPrismAinf : qOmegaAinf ≅ prismAinf
  /-- `AΩ_R` (AI.3). -/
  AOmega : SmO ⥤ 𝒟A
  /-- Bhatt–Scholze Theorem 17.2 (PR.6). -/
  qOmegaAOmega : qOmegaAinf ≅ AOmega

/-- The A_inf square, in the form of Scholze's Conjecture 4.3:
`(qΩ_{S/ℤ})^∧_p ⊗̂_{ℤ_p⟦q-1⟧} A_inf ≃ AΩ_{(S ⊗ O_C)^∧_p}`, an equivalence only after the base change
`q ↦ [ε]`. -/
def aInfSquare {Sm SmO : Type u} [Category.{v} Sm] [Category.{v} SmO] {𝒟p 𝒟A : Type w}
    [Category.{v} 𝒟p] [Category.{v} 𝒟A] (D : AInfSquareData Sm SmO 𝒟p 𝒟A) :
    D.qOmegaLocal ⋙ D.baseChange ≅ D.toOC ⋙ D.AOmega :=
  Functor.isoWhiskerRight D.qcrysPrismLocal D.baseChange ≪≫ D.prismBaseChange ≪≫
    Functor.isoWhiskerLeft D.toOC (D.qcrysPrismAinf.symm ≪≫ D.qOmegaAOmega)

/-- Imported data for the décalage square at `q - 1`.

Owners: `Pairs` is the category of smooth `A`-algebras equipped with a q-Hodge filtration and
`forget` the forgetful functor (HQ.3, `HQ.3/q-hodge-filtrations`); `qHdg` is the q-Hodge complex
(HQ.3, `HQ.3/the-q-hodge-complex`); `leta` is `Lη_{(q-1)}` (AInfCohomology AI.1); `qOmega` is the
global q-de Rham complex (HQ.1); `prop347b` is Proposition 3.47(b)
(`HQ.3/the-smooth-comparison-of-q-omega-with-the-q-hodge-completion`). -/
structure DecalageQSubOneData (Pairs Sm : Type u) [Category.{v} Pairs] [Category.{v} Sm]
    (𝒟 : Type w) [Category.{v} 𝒟] where
  /-- The forgetful functor from pairs to smooth algebras (HQ.3). -/
  forget : Pairs ⥤ Sm
  /-- The q-Hodge complex (HQ.3). -/
  qHdg : Pairs ⥤ 𝒟
  /-- `Lη_{(q-1)}` (AI.1). -/
  leta : 𝒟 ⥤ 𝒟
  /-- The global q-de Rham complex (HQ.1). -/
  qOmega : Sm ⥤ 𝒟
  /-- Proposition 3.47(b) (HQ.3). -/
  prop347b : qHdg ⋙ leta ≅ forget ⋙ qOmega

/-- The décalage square at `q - 1`: for smooth inputs with a q-Hodge filtration,
`Lη_{(q-1)} qHdg_{S/A} ≃ qΩ_{S/A}`. -/
def decalageSquareQSubOne {Pairs Sm : Type u} [Category.{v} Pairs] [Category.{v} Sm]
    {𝒟 : Type w} [Category.{v} 𝒟] (D : DecalageQSubOneData Pairs Sm 𝒟) :
    D.qHdg ⋙ D.leta ≅ D.forget ⋙ D.qOmega :=
  D.prop347b

/-- Imported data for the décalage square at the prism ideal, at a prime `p`.

Owners: `qOmegaTwist` is `(qΩ_{S/A}^{(p)})^∧_p`, the Frobenius twist of the `p`-completed
q-de Rham complex (HQ.4, `HQ.4/twisted-q-de-rham-complexes`, Lemma 3.15), `qOmegaLocal` the
`p`-completed q-de Rham complex (HQ.1), `leta` is `Lη_{[p]_q}` (AI.1), and `relFrob` the relative
Frobenius equivalence of Bhatt–Scholze Theorem 15.3 (PrismaticCohomology PR.3), transported
through the local prismatic square. -/
structure DecalagePrismIdealData (Sm : Type u) [Category.{v} Sm] (𝒟p : Type w)
    [Category.{v} 𝒟p] where
  /-- `(qΩ^{(p)})^∧_p` (HQ.4). -/
  qOmegaTwist : Sm ⥤ 𝒟p
  /-- `(qΩ)^∧_p` (HQ.1). -/
  qOmegaLocal : Sm ⥤ 𝒟p
  /-- `Lη_{[p]_q}` (AI.1). -/
  leta : 𝒟p ⥤ 𝒟p
  /-- Bhatt–Scholze Theorem 15.3 (PR.3). -/
  relFrob : qOmegaTwist ≅ qOmegaLocal ⋙ leta

/-- The décalage square at the prism ideal:
`φ_{/A[q]} : (qΩ^{(p)}_{S/A})^∧_p ≃ Lη_{[p]_q} (qΩ_{S/A})^∧_p`, the gluing datum of the twisted
q-de Rham complexes. -/
def decalageSquarePrismIdeal {Sm : Type u} [Category.{v} Sm] {𝒟p : Type w}
    [Category.{v} 𝒟p] (D : DecalagePrismIdealData Sm 𝒟p) :
    D.qOmegaTwist ≅ D.qOmegaLocal ⋙ D.leta :=
  D.relFrob

/-! The failure of the décalage filtrations to glue (node
`HQ.8/the-decalage-filtrations-do-not-glue`, Remark 3.49 of the main source) is a remark, not a
theorem: no statement of the form "no gluing exists" is made, and none is declared here. -/

/-- Imported data for the Nygaard square, at a prime `p` and an exponent `α ≥ 1`. Filtered
objects are functors out of `ℕᵒᵖ`.

Owners: `nygaardTwist` is the prismatic Nygaard filtration on `(qΩ^{(p^α)}_{S/A})^∧_p`
(HQ.4, `HQ.4/the-nygaard-filtration-on-twisted-q-de-rham-complexes`, built from PR.3),
`quotient` the reduction modulo `q^{p^α} - 1` with `q^{p^α} - 1` in filtration degree one
(HQ.2, `HQ.2/the-quotient-convention-for-filtered-modules`), `nygaardQW` the explicit Nygaard
filtration on `(qW_{p^α} Ω_{S/A})^∧_p` (HQ.4, `HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes`),
`degreeZero` the degree-zero equivalence of Proposition 3.19, `comparison` and `unique` the
existence and uniqueness of Proposition 3.22 (HQ.4, `HQ.4/the-nygaard-comparison`). -/
structure NygaardSquareData (Sm : Type u) [Category.{v} Sm] (𝒟 : Type w) [Category.{v} 𝒟] where
  /-- The prismatic Nygaard filtration on the twisted complex (HQ.4). -/
  nygaardTwist : Sm ⥤ (ℕᵒᵖ ⥤ 𝒟)
  /-- The filtered quotient by `q^{p^α} - 1` (HQ.2). -/
  quotient : (ℕᵒᵖ ⥤ 𝒟) ⥤ (ℕᵒᵖ ⥤ 𝒟)
  /-- The explicit Nygaard filtration on the q-de Rham–Witt complex (HQ.4). -/
  nygaardQW : Sm ⥤ (ℕᵒᵖ ⥤ 𝒟)
  /-- The degree-zero equivalence of Proposition 3.19 (HQ.4). -/
  degreeZero : nygaardTwist ⋙ quotient ⋙ (evaluation ℕᵒᵖ 𝒟).obj (Opposite.op 0) ≅
    nygaardQW ⋙ (evaluation ℕᵒᵖ 𝒟).obj (Opposite.op 0)
  /-- The filtered equivalence of Proposition 3.22 (HQ.4). -/
  comparison : nygaardTwist ⋙ quotient ≅ nygaardQW
  /-- It restricts to `degreeZero` in filtration degree zero (HQ.4). -/
  comparison_zero : Functor.isoWhiskerRight comparison ((evaluation ℕᵒᵖ 𝒟).obj (Opposite.op 0)) =
    Functor.associator _ _ _ ≪≫ degreeZero
  /-- It is the only filtered equivalence doing so (HQ.4). -/
  unique : ∀ e : nygaardTwist ⋙ quotient ≅ nygaardQW,
    Functor.isoWhiskerRight e ((evaluation ℕᵒᵖ 𝒟).obj (Opposite.op 0)) =
      Functor.associator _ _ _ ≪≫ degreeZero → e = comparison

/-- The Nygaard square: the unique functorial filtered equivalence of Proposition 3.22. -/
def nygaardSquare {Sm : Type u} [Category.{v} Sm] {𝒟 : Type w} [Category.{v} 𝒟]
    (D : NygaardSquareData Sm 𝒟) : D.nygaardTwist ⋙ D.quotient ≅ D.nygaardQW :=
  D.comparison

/-- Uniqueness in the Nygaard square: any filtered equivalence restricting to the degree-zero
equivalence is the Nygaard square. -/
theorem nygaardSquare_unique {Sm : Type u} [Category.{v} Sm] {𝒟 : Type w} [Category.{v} 𝒟]
    (D : NygaardSquareData Sm 𝒟) (e : D.nygaardTwist ⋙ D.quotient ≅ D.nygaardQW)
    (he : Functor.isoWhiskerRight e ((evaluation ℕᵒᵖ 𝒟).obj (Opposite.op 0)) =
      Functor.associator _ _ _ ≪≫ D.degreeZero) :
    e = nygaardSquare D :=
  D.unique e he

/-- Imported data for the crystalline square, at a prime `p` and an exponent `α`, over a
perfectly covered Λ-ring `A` that is a `ℤ_(p)`-algebra.

Owners: `wittOmega` is the Langer–Zink de Rham–Witt complex `W_{α+1}Ω_{S/A}` and its
crystalline comparison over a perfect field (CrystallineCohomology CR.4); `qWittOmega` is
`qW_{p^α}Ω_{S/A}`, `toQWitt` the comparison map of q-Witt Remark 3.18 (HQ.4,
`HQ.4/the-comparison-map-from-ordinary-de-rham-witt`); `pComplete` is `p`-completion, `adamsDR`
the Adams-twisted de Rham complex `(Ω_{S/A} ⊗_{A,ψ^{p^α}} A[q]/(q^{p^α}-1))^∧_p` and `prop42`
q-Witt Proposition 4.2 (HQ.4, `HQ.4/the-p-completion-of-the-q-de-rham-witt-complex`). -/
structure CrystallineSquareData (Sm : Type u) [Category.{v} Sm] (𝒟 𝒟p : Type w)
    [Category.{v} 𝒟] [Category.{v} 𝒟p] where
  /-- `W_{α+1}Ω_{S/A}` (CR.4). -/
  wittOmega : Sm ⥤ 𝒟
  /-- `qW_{p^α}Ω_{S/A}` (HQ.4). -/
  qWittOmega : Sm ⥤ 𝒟
  /-- The comparison map of q-Witt Remark 3.18 (HQ.4). -/
  toQWitt : wittOmega ⟶ qWittOmega
  /-- `p`-completion. -/
  pComplete : 𝒟 ⥤ 𝒟p
  /-- `(Ω_{S/A} ⊗_{A,ψ^{p^α}} A[q]/(q^{p^α}-1))^∧_p`. -/
  adamsDR : Sm ⥤ 𝒟p
  /-- q-Witt Proposition 4.2 (HQ.4). -/
  prop42 : adamsDR ≅ qWittOmega ⋙ pComplete

/-- The crystalline square: the classical de Rham–Witt complex maps to the q-de Rham–Witt
complex, which after `p`-completion is the Adams-twisted de Rham complex modulo `q^{p^α} - 1`.
It is a map, not claimed to be an equivalence. -/
def crystallineSquare {Sm : Type u} [Category.{v} Sm] {𝒟 𝒟p : Type w}
    [Category.{v} 𝒟] [Category.{v} 𝒟p] (D : CrystallineSquareData Sm 𝒟 𝒟p) :
    D.wittOmega ⋙ D.pComplete ⟶ D.adamsDR :=
  Functor.whiskerRight D.toQWitt D.pComplete ≫ D.prop42.inv

/-- Imported data for the square at `q = 1`.

Owners: `qOmega` is the global q-de Rham complex, `modQ` the reduction modulo `q - 1`,
`deRham` the de Rham complex and `thmA1a` Theorem A.1(a) (HQ.1,
`HQ.1/what-the-global-complex-satisfies`); `qdR` is the derived q-de Rham complex, `dR` the
derived de Rham complex (DerivedDeRhamCohomology DD.2) and `paraA14` paragraph A.14 (HQ.2,
`HQ.2/the-derived-q-de-rham-complex`). -/
structure QEqOneData (Sm Ani : Type u) [Category.{v} Sm] [Category.{v} Ani] (𝒟 ℰ : Type w)
    [Category.{v} 𝒟] [Category.{v} ℰ] where
  /-- The global q-de Rham complex (HQ.1). -/
  qOmega : Sm ⥤ 𝒟
  /-- Reduction modulo `q - 1`. -/
  modQ : 𝒟 ⥤ ℰ
  /-- The de Rham complex. -/
  deRham : Sm ⥤ ℰ
  /-- Theorem A.1(a) (HQ.1). -/
  thmA1a : qOmega ⋙ modQ ≅ deRham
  /-- The derived q-de Rham complex (HQ.2). -/
  qdR : Ani ⥤ 𝒟
  /-- The derived de Rham complex (DD.2). -/
  dR : Ani ⥤ ℰ
  /-- Paragraph A.14 (HQ.2). -/
  paraA14 : qdR ⋙ modQ ≅ dR

/-- The square at `q = 1`, underived: `qΩ_{S/A}/(q-1) ≃ Ω_{S/A}`. -/
def deRhamSquare {Sm Ani : Type u} [Category.{v} Sm] [Category.{v} Ani] {𝒟 ℰ : Type w}
    [Category.{v} 𝒟] [Category.{v} ℰ] (D : QEqOneData Sm Ani 𝒟 ℰ) :
    D.qOmega ⋙ D.modQ ≅ D.deRham :=
  D.thmA1a

/-- The square at `q = 1`, derived: `qdR_{R/A}/(q-1) ≃ dR_{R/A}`. -/
def deRhamSquare.derived {Sm Ani : Type u} [Category.{v} Sm] [Category.{v} Ani] {𝒟 ℰ : Type w}
    [Category.{v} 𝒟] [Category.{v} ℰ] (D : QEqOneData Sm Ani 𝒟 ℰ) :
    D.qdR ⋙ D.modQ ≅ D.dR :=
  D.paraA14

/-- The torsion correction at `q = 1`, in the form in which it follows from the long exact
sequence of multiplication by `q - 1`: if `M i →(t) M i → N i → M (i+1) →(t) M (i+1)` is exact,
with `M i` the q-cohomology, `N i` the de Rham cohomology and `t = q - 1`, then
`0 → M i/(q-1) → N i → M (i+1)[q-1] → 0` is exact. -/
theorem deRhamSquare.torsionSequence {B : Type u} [CommRing B] (t : B)
    {M₁ N M₂ : Type v} [AddCommGroup M₁] [Module B M₁] [AddCommGroup N] [Module B N]
    [AddCommGroup M₂] [Module B M₂] (f : M₁ →ₗ[B] N) (g : N →ₗ[B] M₂)
    (h₁ : Function.Exact (t • LinearMap.id : M₁ →ₗ[B] M₁) f) (h₂ : Function.Exact f g)
    (h₃ : Function.Exact g (t • LinearMap.id : M₂ →ₗ[B] M₂)) :
    Function.Injective ((LinearMap.range (t • LinearMap.id : M₁ →ₗ[B] M₁)).liftQ f
        (fun x hx => by obtain ⟨y, rfl⟩ := hx; exact (h₁ _).2 ⟨y, rfl⟩)) ∧
      LinearMap.range g = LinearMap.ker (t • LinearMap.id : M₂ →ₗ[B] M₂) := by
  sorry

end HQ8

end TauCeti.HabiroCohomology
