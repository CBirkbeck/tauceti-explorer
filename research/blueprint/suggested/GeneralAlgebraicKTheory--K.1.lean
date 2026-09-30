/-!
Signature plan for GeneralAlgebraicKTheory K.1–K.5.
FIX-RT-AREA-ktheory-1, Codex, codex-5ebb6f, 2026-09-29.

The packet and reader are definitive. Missing Q, based-loop, homotopy-fibre,
Waldhausen and spectrum interfaces are explicit signature comments below.
They must be constructed with the stated data before the signatures can be
elaborated. This file contains no proposition-valued substitutes for them.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Not compiled: no existing build at both pins was identified.
-/
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap

noncomputable section
namespace TauCeti.HigherK
open CategoryTheory CategoryTheory.Limits

universe u v w
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall.{w} C]

-- These examples use existing declarations only; they are not higher K proofs.
example (E : ExactStructure C) (S : ShortComplex C) (hS : E.Conflation S) :
    (ExactK0.of S.X₂ : ExactK0 E) = ExactK0.of S.X₁ + ExactK0.of S.X₃ :=
  ExactK0.of_conflation hS

example (R : Type u) [Ring R] :
    finiteProjectiveModulesExactStructure R =
      ExactStructure.split (finiteProjectiveModules R).FullSubcategory :=
  finiteProjectiveModulesExactStructure_eq_split R

example (R : Type u) [Ring R]
    (S : ShortComplex (finiteProjectiveModules R).FullSubcategory) :
    (finiteProjectiveModulesExactStructure R).Conflation S ↔
      (S.map (finiteProjectiveModules R).ι).ShortExact :=
  finiteProjectiveModulesExactStructure_conflation_iff R S

/-
K.1: proposed data signatures, dependent on the genuine quotient of admissible
spans and based-space/homotopy-group APIs. BasedSpace, BasedHomotopyEquiv,
QBasedSpace, LoopSpace and PiGroup below are planned interfaces, not variables
whose arbitrary values could satisfy the desired theorem.

noncomputable def QCat (E : ExactStructure C) : Type (max u v)
instance (E : ExactStructure C) : Category (QCat E)
noncomputable def QBasedSpace (E : ExactStructure C) : BasedSpace
noncomputable def KSpace (E : ExactStructure C) : BasedSpace :=
  LoopSpace (QBasedSpace E)
noncomputable def KGroup (E : ExactStructure C) (n : ℕ) : Type _ :=
  PiGroup n (KSpace E)
noncomputable def KGroup.zeroEquivExactK0 (E : ExactStructure C) :
  KGroup E 0 ≃+ ExactK0 E

The comparison sends the loop 0 ↣ A ↠ 0 to ExactK0.of A. Its inverse factors
through ExactK0.liftEquiv; verify both compositions on object classes. Q maps
use a functor F : C ⥤ D and E.IsConflationExact E' F, with F.Additive. Import
ExactStructure.transport and ExactK0.transportEquiv for the small-model step.
Never replace a quotient, exact functor or group equivalence by a proposition.

K.2:plus: existing carrier, early functor, then the separate plus comparison.

noncomputable def ringKSpace (R : Type u) [Ring R] : BasedSpace :=
  KSpace (finiteProjectiveModulesExactStructure R)
noncomputable def ringKMap {R S : Type u} [Ring R] [Ring S]
  (f : R →+* S) : BasedMap (ringKSpace R) (ringKSpace S)
noncomputable def ringKProductEquiv (R S : Type u) [Ring R] [Ring S] :
  BasedHomotopyEquiv (ringKSpace (R × S))
    (BasedProduct (ringKSpace R) (ringKSpace S))

ringKMap is induced by the actual bimodule tensor functor on the imported
projective full subcategories. It preserves split conflations for arbitrary
unital maps, including ℤ → ℤ/2. Pinned ModuleCat.extendScalars covers only its
commutative scope. Unit/composition homotopies and finite-idempotent descent
are required before claiming arbitrary-ring functoriality or filtered colimits.
The plus comparison is subsequent and natural in ring maps/block sum; no
canonical infinite-loop product splitting K₀ × BGL⁺ is asserted.

K.4:construction: genuine Waldhausen and exact-functor records must supply zero
object, cofibrations, weak equivalences, pushouts, gluing and admissible squares.
S_n supplies specified quotient squares and face/degeneracy maps. Extension
objects and all their maps precede these theorem signatures.

noncomputable def waldhausenAdditivityEquiv (W : WaldhausenCategory C) :
  BasedHomotopyEquiv (SRealisation (ExtensionCategory W))
    (BasedProduct (SRealisation W) (SRealisation W))

noncomputable def relativeSFibration
  {A B : Type _} [Category A] [Category B]
  (WA : WaldhausenCategory A) (WB : WaldhausenCategory B)
  (f : WaldhausenExactFunctor WA WB) :
  HomotopyFibration (relativeSSequence f)

noncomputable def iteratedSDeloopingEquiv (W : WaldhausenCategory C)
  (n : ℕ) (hn : 1 ≤ n) :
  BasedHomotopyEquiv (IteratedSRealisation W n)
    (LoopSpace (IteratedSRealisation W (n + 1)))

The relative sequence is the actual sequence in Weibel V.1.7, obtained from
the path-object pullback and additivity. HomotopyFibration is a predicate on
that diagram, not an independent assumed equivalence. H.2 must still supply
and verify the realization-fibration criterion. The first map |wC| → Ω|wS.C|
is group completion; it is not a theorem of equivalence. H.5:S-delooping alone
assembles the all-level maps as a connective Ω-spectrum. Generic smash belongs
to H.5:spectra, and biexact K-pairings to K.7.

K.3 uses Q and H.1/H.2 for exact-category additivity, resolution, dévissage and
abelian localisation. The late general cofinality proof imports K.4. Its degree
zero correction is required: equality of positive K-groups does not imply an
ExactK0 equivalence. The affine-plane doubled-origin test uses K₀(VB) = ℤ and
G₀ = K₀(Perf) = ℤ²; the doubled-origin line is excluded by its Picard group.

Late K.4 retains fibration (named cylinder/saturation/extension hypotheses),
approximation (its two actual approximation conditions), and Gillet–Waldhausen
(bounded complexes, the stated cofibrations and quasi-isomorphisms). These full
signatures await their missing structures; their theorem contracts and source
proof gaps are in the packet, not encoded as tautologies here.

K.5: relative construction uses the early ringKMap, not a deferred K.7 functor.

noncomputable def relativeRingKSpace {R S : Type u} [Ring R] [Ring S]
  (f : R →+* S) : BasedSpace := HomotopyFibre (ringKMap f)
noncomputable def relativePairKSpace {R : Type u} [CommRing R]
  (I : Ideal R) : BasedSpace := relativeRingKSpace (Ideal.Quotient.mk I)

The ideal signature above is the commutative pair API. General associative
rings require a genuine two-sided ideal and quotient homomorphism interface;
do not silently narrow the roadmap's noncommutative scope. Relative groups and
connecting maps come from the actual fibre diagram. Unitalisation is the
existing Unitization, with its actual quotient/augmentation map. Excision is
only under its recorded hypotheses, and support/localisation comparisons use
the adopted connective/nonconnective model.
-/
end TauCeti.HigherK
