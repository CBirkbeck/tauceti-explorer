/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/GeometricSatakeAndFusion--GS3.md is definitive.
The statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. They claim no implementation.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

IMPORTANT SIGNATURE LIMITATION (packet gap: Formal geometric and enhanced carriers).
Sat, Disjoint, Loc, SatW, Comod, Perf and Enhanced below are parameters for the imported
GEOMETRIC categories, not new definitions of those categories. The pinned
libraries cannot express the required diamond, ULA, flat-perverse, continuous
Weil, root-pinning or stable infinity-category conditions. Those conditions are
explicitly OMITTED from the prototypes below. Consequently the geometric
signatures are not mathematical assertions for arbitrary categories supplied
as parameters. The packet gives their complete hypotheses. No missing condition
is replaced by a Prop field, arbitrary certificate, or a proposition definition.

All source definitions, API names and named tests are represented. Tests are
examples under their packet names in comments. Pure tuple/parity/trace formulas
have full signatures; geometric signatures retain only their expressible part.
The MC.6 abstract reconstruction chain is imported in the packet, never replanned
here. Tau Ceti's known-Hopf reconstruction is a comparison AFTER constructing H.
-/
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Monad.Monadicity
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Flat.Basic
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive

noncomputable section
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u v w
namespace TauCeti.GeometricSatake

/-! Disjoint locus: the geometric open has this exact geometric-point condition. -/
def disjointLegLocus {I : Type u} {K : Type v} {X : Type w} (b : I → K) : Set (I → X) :=
  {x | ∀ i j, b i ≠ b j → x i ≠ x j}

theorem disjointLegLocus_mem {I : Type u} {K : Type v} {X : Type w} (b : I → K) (x : I → X) :
    x ∈ disjointLegLocus b ↔ ∀ i j, b i ≠ b j → x i ≠ x j := by sorry

theorem disjointLegLocus_reindex {I J : Type u} {K : Type v} {X : Type w} (e : J ≃ I)
    (b : I → K) (x : I → X) :
    x ∈ disjointLegLocus b ↔ (x ∘ e) ∈ disjointLegLocus (b ∘ e) := by sorry

theorem disjointLegLocus_baseChange {I : Type u} {K : Type v} {X S : Type w} (b : I → K)
    (f : S → (I → X)) :
    f ⁻¹' disjointLegLocus b = {s | ∀ i j, b i ≠ b j → f s i ≠ f s j} := by sorry

-- test_disjoint_oneBlock
example {I : Type u} {X : Type w} : disjointLegLocus (fun _ : I => ()) = (Set.univ : Set (I → X)) :=
  by sorry
-- test_disjoint_twoSingletons
example {X : Type u} (x : Fin 2 → X) :
    x ∈ disjointLegLocus (id : Fin 2 → Fin 2) ↔ x 0 ≠ x 1 := by sorry
-- test_disjoint_internalCollision
example {X : Type u} (x y : X) (h : x ≠ y) :
    (![x, x, y] : Fin 3 → X) ∈
      disjointLegLocus (![false, false, true] : Fin 3 → Bool) := by sorry

/-! Numerical parity. The geometric theorem that this descends to clopen
components requires the imported root datum/dominance condition, omitted here. -/
def supportParity {I : Type u} [Fintype I] (dimension : I → ℤ) : ZMod 2 :=
  (∑ i, dimension i : ℤ)

theorem supportParity_dominance {I : Type u} [Fintype I] (d e : I → ℤ)
    (difference : ∀ i, ∃ n : ℤ, d i - e i = 2 * n) :
    supportParity d = supportParity e := by sorry

theorem supportParity_union {I J : Type u} [Fintype I] [Fintype J]
    (d : I → ℤ) (e : J → ℤ) :
    supportParity (Sum.elim d e) = supportParity d + supportParity e := by sorry

def fusionSign (e f : ZMod 2) : ℤ := if e = 1 ∧ f = 1 then -1 else 1

-- test_parity_unit
example : supportParity (fun _ : Fin 1 => (0 : ℤ)) = 0 := by sorry
-- test_sign_oddOdd
example : fusionSign 1 1 = -1 := by sorry
-- test_sign_evenOdd
example : fusionSign 0 1 = 1 := by sorry

section GeometricCategories
-- Skeletal finite leg sets Fin n; equivalences transport this to all finite sets.
-- Omitted: these are the exact imported bounded ULA flat-perverse categories,
-- their disjoint pullbacks and continuous finite-projective Weil local systems.
variable (Sat Disjoint Loc : ℕ → Type u)
variable [∀ n, Category (Sat n)] [∀ n, Category (Disjoint n)] [∀ n, Category (Loc n)]
variable [∀ n, MonoidalCategory (Sat n)] [∀ n, MonoidalCategory (Loc n)]
variable (F : ∀ n, Sat n ⥤ Loc n)

-- Omitted: the defining pullback is j_b* for the actual blockwise-disjoint open.
def restrictionToDisjoint (n : ℕ) : Sat n ⥤ Disjoint n := by sorry
-- Node disjoint-leg-factorization-and-full-faithfulness, VI.9.3.
-- Omitted: partial diagonals have positive codimension; ULA/perverse purity and CT.
theorem restriction_fullyFaithful (n : ℕ) :
    Nonempty (restrictionToDisjoint Sat Disjoint n).FullyFaithful := by sorry

-- Omitted: this is the derived proper pushforward on the chain of modifications.
def fusionProduct {n m : ℕ} (A : Sat n) (B : Sat m) : Sat (n + m) := by sorry
-- The exterior product on the same blockwise-disjoint base is an imported carrier.
variable (external : ∀ {n m}, Sat n → Sat m → Disjoint (n + m))
def fusionProduct_restrict {n m : ℕ} (A : Sat n) (B : Sat m) :
    (restrictionToDisjoint Sat Disjoint (n + m)).obj (fusionProduct Sat A B) ≅
      external A B := by sorry

-- Existing convolution tensor: the geometry identifies internal fusion with it.
def fusionTensor {n : ℕ} (A B : Sat n) : Sat n := A ⊗ B
-- Omitted: parity correction on the actual even/odd support summands.
def fusionBraiding {n : ℕ} (A B : Sat n) :
    fusionTensor Sat A B ≅ fusionTensor Sat B A := by sorry

def fibreFusionIso {n : ℕ} (A B : Sat n) :
    (F n).obj (fusionTensor Sat A B) ≅ (F n).obj A ⊗ (F n).obj B := by sorry

-- test_fusion_unit
example {n : ℕ} (A : Sat n) : fusionTensor Sat A (𝟙_ (Sat n)) ≅ A := by sorry
-- test_fusion_disjoint
example {n m : ℕ} (A : Sat n) (B : Sat m) :
    (restrictionToDisjoint Sat Disjoint (n + m)).obj (fusionProduct Sat A B) ≅
      external A B := by sorry
-- test_fusion_oddSymmetry: ordinary target flip, with geometric parity omitted.
-- The target symmetry is the existing ordinary symmetry on Weil representations.
variable [∀ n, SymmetricCategory (Loc n)]
example {n : ℕ} (A B : Sat n) :
    (F n).map (fusionBraiding Sat A B).hom ≫ (fibreFusionIso Sat Loc F B A).hom =
      (fibreFusionIso Sat Loc F A B).hom ≫ (β_ ((F n).obj A) ((F n).obj B)).hom :=
  by sorry

-- Omitted: diagonal pullback to Gr^I ×_(Div^I) Div^J, followed by pushforward
-- along its closed immersion into Gr^J, with the descended loop equivariance.
-- The closed immersion is on Grassmannians, not on quotient Hecke stacks.
def collisionFunctor {n m : ℕ} (α : Fin n → Fin m) : Sat n ⥤ Sat m := by sorry

def collisionFunctor_id (n : ℕ) : collisionFunctor Sat (id : Fin n → Fin n) ≅ 𝟭 (Sat n) :=
  by sorry

def collisionFunctor_comp {n m k : ℕ} (α : Fin n → Fin m) (β : Fin m → Fin k) :
    collisionFunctor Sat (β ∘ α) ≅ collisionFunctor Sat α ⋙ collisionFunctor Sat β :=
  by sorry

-- The map is the actual block sum of α and β; an unrelated sumMap is invalid.
def collisionFunctor_union {n m n' m' : ℕ}
    (α : Fin n → Fin n') (β : Fin m → Fin m')
    (A : Sat n) (B : Sat m) :
    (collisionFunctor Sat (Fin.addCases (fun i => Fin.castAdd m' (α i))
      (fun j => Fin.natAdd n' (β j)))).obj (fusionProduct Sat A B) ≅
      fusionProduct Sat ((collisionFunctor Sat α).obj A) ((collisionFunctor Sat β).obj B) :=
  by sorry

-- Expressible composition coherence; the enhanced finite-set coherence is omitted.
theorem collisionFunctor_comp_assoc {n m k l : ℕ}
    (α : Fin n → Fin m) (β : Fin m → Fin k) (γ : Fin k → Fin l) :
    (collisionFunctor_comp Sat (β ∘ α) γ).hom ≫
      (Functor.isoWhiskerRight (collisionFunctor_comp Sat α β) (collisionFunctor Sat γ)).hom ≫
      (Functor.associator (collisionFunctor Sat α) (collisionFunctor Sat β)
        (collisionFunctor Sat γ)).hom =
    (collisionFunctor_comp Sat α (γ ∘ β)).hom ≫
      (Functor.isoWhiskerLeft (collisionFunctor Sat α) (collisionFunctor_comp Sat β γ)).hom :=
  by sorry

def collisionFunctor_unitInsertion (n : ℕ) :
    (collisionFunctor Sat (Fin.elim0 : Fin 0 → Fin n)).obj (𝟙_ (Sat 0)) ≅ 𝟙_ (Sat n) :=
  by sorry

-- test_collision_threeLegs: the two different 3→2→1 merging orders.
-- Their canonical comparison is induced by collisionFunctor_comp. The packet's
-- fusion pentagon still needs the geometric associator and its enhanced coherence.
example :
    collisionFunctor Sat (![0, 0, 1] : Fin 3 → Fin 2) ⋙
      collisionFunctor Sat (![0, 0] : Fin 2 → Fin 1) ≅
    collisionFunctor Sat (![0, 1, 1] : Fin 3 → Fin 2) ⋙
      collisionFunctor Sat (![0, 0] : Fin 2 → Fin 1) := by sorry
-- test_collision_permutation
example (e : Equiv.Perm (Fin 2)) :
    collisionFunctor Sat e ⋙ collisionFunctor Sat e.symm ≅ 𝟭 (Sat 2) := by sorry
-- test_collision_emptyFibre
example :
    (collisionFunctor Sat (Fin.elim0 : Fin 0 → Fin 1)).obj (𝟙_ (Sat 0)) ≅ 𝟙_ (Sat 1) :=
  by sorry

-- Node drinfeld-fibre-realization: IV.7.3/VI.9.2.
-- Omitted: DLc and continuous finite-projective Weil representations, not all Det.
variable (WeilRep : ℕ → Type u) [∀ n, Category (WeilRep n)]
def drinfeldFibreRealization (n : ℕ) : Loc n ≌ WeilRep n := by sorry

-- Node symmetric-constant-term: actual parabolic/Levi and deg_P omitted.
variable (SatM : ℕ → Type u) [∀ n, Category (SatM n)]
variable [∀ n, MonoidalCategory (SatM n)]
variable (CT : ∀ n, Sat n ⥤ SatM n)
def constantTermFusionIso {n m : ℕ} (A : Sat n) (B : Sat m) :
    (CT (n + m)).obj (fusionProduct Sat A B) ≅
      fusionProduct SatM ((CT n).obj A) ((CT m).obj B) := by sorry

-- Node fusion-verdier-duality: these are the geometric reversal and Verdier dual.
-- Omitted: duality carrier, involution comparisons and all finite-set coherence.
variable (sw : ∀ n, Sat n ⥤ Sat n) (verdier : ∀ n, (Sat n)ᵒᵖ ⥤ Sat n)
def fusionVerdierComparison (n : ℕ) :
    (sw n).op ⋙ verdier n ≅ verdier n ⋙ sw n := by sorry

-- Node tannakian-left-adjoint: C_W is the bounded category, not the whole Satake.
-- Omitted: finite downward-closed Galois-stable W and the specific fibre functor.
variable (Bounded : Type u) [Category Bounded] (Base : Type u) [Category Base]
variable [MonoidalCategory Bounded] [MonoidalCategory Base]
variable (FBound : Bounded ⥤ Base)
def boundedLeftAdjoint (_FBound : Bounded ⥤ Base) : Base ⥤ Bounded := by sorry

def boundedLeftAdjunction : boundedLeftAdjoint Bounded Base FBound ⊣ FBound := by sorry

def boundedGenerator : Bounded :=
  (boundedLeftAdjoint Bounded Base FBound).obj (𝟙_ Base)

-- Omitted: the specific LocSys tensor action on C_W.
variable (act : Bounded → Base → Bounded)
def boundedLeftAdjoint_tensor (V : Base) :
    (boundedLeftAdjoint Bounded Base FBound).obj V ≅
      act (boundedGenerator Bounded Base FBound) V := by sorry

-- For product bounds, imported singleton generators and their fusion are parameters.
def boundedGenerator_fusion (Xproduct Xfusion : Bounded) : Xproduct ≅ Xfusion := by sorry
-- W ⊆ W': representability gives X_W' → X_W. Dualizing its fibre reverses
-- this to (F X_W)^∨ → (F X_W')^∨ in the coordinate-coalgebra diagram.
-- The actual two bounds and their inclusion remain omitted.
def boundedGenerator_enlarge (XW XW' : Bounded) : XW' ⟶ XW := by sorry

-- test_generator_zeroBound: omitted hypothesis W={0}, with its unit comparison.
example : boundedGenerator Bounded Base FBound ≅ 𝟙_ Bounded := by sorry
-- test_generator_productBound: omitted the two actual singleton/product bounds.
example (Xproduct Xfusion : Bounded) : Xproduct ≅ Xfusion := by sorry
-- test_generator_dualOrientation: the coalgebra is the dual of F(X_W).
-- The actual dual-fibre/monad comparison is retained as a type-level duality target.
variable [RigidCategory Base]
example (finitePieceCoalgebra : Base) :
    finitePieceCoalgebra ≅ (FBound.obj (boundedGenerator Bounded Base FBound))ᘁ := by sorry
-- This example only displays the expressible dual carrier. The coordinate-coalgebra
-- identification and its opposition to the monad algebra remain omitted, as recorded
-- in the bounded adjunction/coefficient gap. It is not a proved orientation test.

end GeometricCategories

/-! Coordinate reconstruction. The input diagram consists of the DUALS of the
actual bounded represented fibres, imported from the four MC.6 nodes. Geometric
origin, coalgebra maps, filteredness and finite projectivity are omitted; no
known Hopf algebra is assumed as the input to this construction. -/
section CoordinateHopf
variable (Λ : Type u) [CommRing Λ]
variable (J : Type u) [Category J]
variable (dualFibres : J ⥤ ModuleCat Λ) [Limits.HasColimit dualFibres]

def satakeCoordinateHopf : ModuleCat Λ := Limits.colimit dualFibres

-- Omitted: MC.6 supplies the Hopf operations on this module from Satake fusion.
-- Structure theorems must identify this actual colimit with the coordinate ring;
-- neither arbitrary module diagrams nor arbitrary Hopf algebras are a substitute.
variable (Sat : Type u) [Category Sat] [MonoidalCategory Sat]
variable (IndLoc : Type u) [Category IndLoc] [MonoidalCategory IndLoc]
variable (fibreInd : Sat ⥤ IndLoc) (H : IndLoc)
def satakeCoaction (A : Sat) : fibreInd.obj A ⟶ fibreInd.obj A ⊗ H := by sorry

variable (Comod : Type u) [Category Comod] [MonoidalCategory Comod]
def satakeComoduleEquivalence : Sat ≌ Comod := by sorry

-- Omitted: compatibility is an identity of coactions involving multiplication on H.
-- This signature gives its underlying tensor comparison; the coaction identity
-- itself cannot be typed before the relative Comod/Ind tensor carrier exists.
def satakeCoordinateHopf_tensor (A B : Sat) :
    fibreInd.obj (A ⊗ B) ≅ fibreInd.obj A ⊗ fibreInd.obj B := by sorry

-- Omitted: the coaction on the dual uses the reconstructed Hopf antipode.
-- The comparison below records the exact underlying dual-functor diagram.
variable (internalDual : Satᵒᵖ ⥤ Sat) (comoduleDual : Comodᵒᵖ ⥤ Comod)
def satakeCoordinateHopf_antipode :
    internalDual ⋙ (satakeComoduleEquivalence Sat Comod).functor ≅
      (satakeComoduleEquivalence Sat Comod).functor.op ⋙ comoduleDual := by sorry
-- Both convolution inverse identities are already fields of Mathlib.HopfAlgebra.
-- They apply AFTER identifying the constructed coordinate object with Halg.
variable (Halg : Type u) [CommRing Halg] [HopfAlgebra Λ Halg]

-- test_hopf_trivialGroup: actual trivial-G identification omitted.
example : satakeCoordinateHopf Λ J dualFibres ≅ ModuleCat.of Λ Λ := by sorry
-- test_hopf_torus: character group algebra and actual torus context omitted.
-- The ring map type records the required group-like generator computation.
variable (Weight : Type u) [AddCommGroup Weight] (e : Weight → Halg)
example (μ : Weight) :
    Coalgebra.comul (R := Λ) (e μ) = e μ ⊗ₜ[Λ] e μ ∧
      Coalgebra.counit (R := Λ) (e μ) = 1 := by sorry
-- test_hopf_torusAntipode: omitted e^μ is the actual torus group-algebra basis.
example (μ : Weight) : HopfAlgebra.antipode Λ (e μ) = e (-μ) := by sorry
end CoordinateHopf

/-! Named theorem nodes. The affine comparison uses Tau Ceti's actual carrier.
Missing source hypotheses are explicitly identified, with no certificate fields. -/
section GroupComparison
variable (Λ : Type u) [CommRing Λ]
variable (reconstructed pinned : TauCeti.AffineGroupSchemeCat (CommRingCat.of Λ))
-- Node relative-tannaka-hypotheses: F-split coequalizer preservation is a genuine
-- open proof obligation. Its missing exact/flat-perverse carrier is OMITTED.
-- Expressible part: the three actual F-split-coequalizer conditions.
variable (Bounded Base : Type u) [Category Bounded] [Category Base]
variable (L : Base ⥤ Bounded) (F : Bounded ⥤ Base)
theorem relativeTannakaHypotheses :
    Nonempty (CategoryTheory.Monad.HasCoequalizerOfIsSplitPair F) ∧
    Nonempty (CategoryTheory.Monad.PreservesColimitOfIsSplitPair F) ∧
    Nonempty (CategoryTheory.Monad.ReflectsColimitOfIsSplitPair F) := by sorry
-- The filtered cover, rigidity and A-linearity remain omitted here; the
-- expressible F-split coequalizer conditions use the actual Mathlib vocabulary.

-- Node multileg-and-coefficient-reconstruction: the binary underlying-module
-- tensor comparison is expressible. Omitted: these are the actual coordinate
-- modules for disjoint singleton legs, all Hopf compatibilities, general finite
-- tensors, coefficient base change and compatible ell-adic limits.
variable (Hone Htwo Hpair : Type u)
variable [AddCommGroup Hone] [AddCommGroup Htwo] [AddCommGroup Hpair]
variable [Module Λ Hone] [Module Λ Htwo] [Module Λ Hpair]
theorem multilegCoefficientReconstruction :
    Nonempty (Hpair ≃ₗ[Λ] Hone ⊗[Λ] Htwo) := by sorry
-- Node rational-semisimplicity: geometric fibre and rational coefficients omitted.
variable (RationalSat ICGraded : Type u) [Category RationalSat] [Category ICGraded]
theorem rationalSemisimplicity : Nonempty (RationalSat ≌ ICGraded) := by sorry
-- Node generic-fibre-reductivity: the geometric generic carrier and the
-- derivation of finite type are omitted; the field reductive predicate is actual.
variable (k : Type u) [Field k]
variable (generic : TauCeti.FiniteTypeAffineGroupSchemeCat (CommRingCat.of k))
theorem genericFibreReductivity : TauCeti.reductiveAffineGroupSchemeProperty k generic :=
  by sorry
-- Finite type is displayed as an input carrier; its derivation from tensor
-- generators and the geometric generic-fibre identification are omitted.
-- Node torus-and-rank-one-identification: the torus/SL2 coordinate rings and
-- component-grading map are imported parameters; geometric hypotheses omitted.
-- Over the generic fibre only; the integral statement is the next node.
theorem torusRankOneIdentification : Nonempty (reconstructed ≅ pinned) := by sorry
-- Node rank-one-integral-identification: for PGL2 the integral group is SL2 for
-- every ell != p. Omitted: the special-fibre image argument; at ell = 2 it counts
-- invariants of tensor powers (top Borel-Moore homology of convolution fibres
-- against SL2 tilting modules), which excludes the normalizer of the diagonal
-- torus and its Frobenius preimages (packet source issue E8). The modular Hom
-- calculation and Steinberg-kernel/good-filtration inputs are requested from
-- GS2:correspondences and LP3 and remain the named rank-one gap. Also omitted:
-- the flat-module lift VI.11.3.
theorem rankOneIntegralIdentification : Nonempty (reconstructed ≅ pinned) := by sorry
-- Node generic-root-datum: the actual weight-functor/root-datum identification
-- is omitted; this uses the library RootPairing as the target carrier.
variable (M N : Type u) [AddCommGroup M] [AddCommGroup N]
variable [Module ℤ M] [Module ℤ N] (RootIndex : Type u)
-- The exact RootPairing data are used by the supplier; no replacement is defined.
-- The dual pairing equality is the expressible part of this identification.
theorem genericRootDatum (original : RootPairing RootIndex ℤ N M)
    (geometric : RootPairing RootIndex ℤ M N) : geometric = original.flip := by sorry
-- Node integral-recovery-and-adjoint-reduction: omitted integral coefficient ring,
-- maximal-compact generation, PY criterion and G_ad reduction at ell=2.
theorem integralRecovery : Nonempty (reconstructed ≅ pinned) := by sorry
-- Node dual-group-identification: omitted canonical root-line pinning and Weil
-- equivariance, independence of split pinning, and Galois descent.
def dualGroupIdentification : reconstructed ≅ pinned := by sorry
end GroupComparison

section NormalizedEquivalence
variable (Sat Rep Loc : Type u) [Category Sat] [Category Rep] [Category Loc]
variable [MonoidalCategory Sat] [MonoidalCategory Rep] [MonoidalCategory Loc]
-- Omitted: actual G/E, coefficients ell!=p, chosen sqrt(q), continuous finite
-- projective Weil representations, geometric/pinned-action comparison.
def normalizedSatakeEquivalence : Sat ≌ Rep := by sorry

def normalizedSatakeObject (V : Rep) : Sat :=
  (normalizedSatakeEquivalence Sat Rep).inverse.obj V

variable (F : Sat ⥤ Loc) (forget : Rep ⥤ Loc)
def normalizedSatake_fibre (V : Rep) :
    F.obj (normalizedSatakeObject Sat Rep V) ≅ forget.obj V := by sorry

def normalizedSatake_tensor (V W : Rep) :
    normalizedSatakeObject Sat Rep (V ⊗ W) ≅
      normalizedSatakeObject Sat Rep V ⊗ normalizedSatakeObject Sat Rep W := by sorry

variable (internalDual : Satᵒᵖ ⥤ Sat) (repDual : Repᵒᵖ ⥤ Rep)
def normalizedSatake_dual :
    (normalizedSatakeEquivalence Sat Rep).inverse.op ⋙ internalDual ≅
      repDual ⋙ (normalizedSatakeEquivalence Sat Rep).inverse := by sorry

-- Actual cocycle formula when 2rho is pinned-Weil-invariant; the group-scheme
-- root-line and half-Tate identification are omitted, but no rho lift is invented.
def normalizationCocycle {W U G : Type u} [Group W] [Group U] [Group G]
    (twiceRho : U →* G) (halfTate : W →* U) : W →* G := twiceRho.comp halfTate

-- test_normalized_torus: omitted V is weight n and pointObject its G_m component.
example (V : Rep) (pointObject : Sat) :
    normalizedSatakeObject Sat Rep V ≅ pointObject := by sorry
-- test_normalized_pgl2: omitted Vstd is the SL2 standard representation and
-- normalizedP1 is Lambda[1](1/2) on the minuscule P1.
example (Vstd : Rep) (normalizedP1 : Sat) :
    normalizedSatakeObject Sat Rep Vstd ≅ normalizedP1 := by sorry
-- test_normalized_rootChoice: numerical sign on an odd half-twist.
example {Λ : Type u} [CommRing Λ] (a : Λ) : (-1 : Λ) * a = -a := by sorry

-- Node levi-naturality: missing actual deg_P/Weil cocycle map; functor comparison.
variable (SatM RepM : Type u) [Category SatM] [Category RepM]
variable (CT : Sat ⥤ SatM) (restrictLevi : Rep ⥤ RepM) (EM : SatM ≌ RepM)
def leviNaturality :
    (normalizedSatakeEquivalence Sat Rep).inverse ⋙ CT ≅
      restrictLevi ⋙ EM.inverse := by sorry
-- Node adjoint-isomorphism-naturality: omitted component pushforward and dual map.
variable (Sat' Rep' : Type u) [Category Sat'] [Category Rep']
variable (push : Sat' ⥤ Sat) (dualRestrict : Rep' ⥤ Rep) (E' : Sat' ≌ Rep')
def adjointIsomorphismNaturality : E'.inverse ⋙ push ≅
    dualRestrict ⋙ (normalizedSatakeEquivalence Sat Rep).inverse := by sorry
-- Node product-naturality: exterior products, not a claim every object factors.
variable (Sat1 Sat2 Rep1 Rep2 : Type u)
variable [Category Sat1] [Category Sat2] [Category Rep1] [Category Rep2]
variable (E1 : Sat1 ≌ Rep1) (E2 : Sat2 ≌ Rep2)
variable (sheafProduct : Sat1 → Sat2 → Sat) (repProduct : Rep1 → Rep2 → Rep)
def productNaturality (V : Rep1) (W : Rep2) :
    normalizedSatakeObject Sat Rep (repProduct V W) ≅
      sheafProduct (E1.inverse.obj V) (E2.inverse.obj W) := by sorry
-- Node weil-restriction-naturality: omitted field/divisor diagram, chosen embedding,
-- conjugate legs and compatible half roots; Induction is NOT asserted monoidal.
variable (weilInduce : Rep' ⥤ Rep) (divisorPush : Sat' ⥤ Sat)
def weilRestrictionNaturality : E'.inverse ⋙ divisorPush ≅
    weilInduce ⋙ (normalizedSatakeEquivalence Sat Rep).inverse := by sorry
-- Node chevalley-involution: use a group-level formula, with actual affine-group
-- point functor and pinning omitted. rho(-1) lies in the ADJOINT group: its
-- conjugation acts on G, without requiring a lift of that element to G.
theorem chevalleyInvolution {G : Type u} [Group G] (sw theta : G ≃* G)
    (adjointConjugation : G ≃* G) (g : G) :
    sw g = adjointConjugation (theta g) := by sorry
-- Omitted: adjointConjugation is precisely Ad(rho(-1)) for the actual pinned data.
end NormalizedEquivalence

/-! Rational Witt vector geometric Satake (Zhu, Theorem 0.3), through the FS
degeneration. `SatW` is a parameter for Zhu's category of L⁺G-equivariant
perverse sheaves with algebraically closed coefficient field `K` on the Witt
vector affine Grassmannian over an algebraic closure of F_q, and `Comod` for the
finite-dimensional comodules over the coordinate Hopf algebra of the split dual
group. OMITTED: the Witt geometry, the one-leg comparison and rationalization,
perversity and equivariance, and the transport of the fusion symmetry. The
monoidal structure on `H` is the one transported from fusion; it is not
identified with the structure of Zhu's Proposition 2.20. -/
section WittRationalSatake
variable (K : Type u) [Field K] [IsAlgClosed K] [CharZero K]
variable (SatW Comod : Type u) [Category.{u} SatW] [Category.{u} Comod]
variable [MonoidalCategory SatW] [MonoidalCategory Comod]
variable [SymmetricCategory SatW] [SymmetricCategory Comod]
variable (H : SatW ⥤ FGModuleCat.{u} K) (forget : Comod ⥤ FGModuleCat.{u} K)
variable [H.Braided] [forget.Braided]

-- Node witt-rational-tannakian-category. Expressible part of (ii): the fibre
-- functor is faithful and the category is rigid. Omitted: the identification
-- (i) with the rationalized FS Satake category of Spd k, the abelian structure
-- of SatW and exactness of H, semisimplicity, End(IC_0) = K, and (iii) the
-- identification of the Tannakian group with the generic fibre of the Satake group.
theorem wittRationalTannakianCategory :
    H.Faithful ∧ Nonempty (RigidCategory SatW) := by sorry

-- Node witt-rational-satake-equivalence (Zhu, Theorem 0.3). Expressible part: an
-- equivalence S with forget ∘ S ≅ H. Omitted: that S and this isomorphism are
-- symmetric monoidal, items (a)–(d) of the node (tensor constant term, Borel
-- filtration, IC_μ ↦ V_μ, torus case), and the identification of Comod with the
-- representations of the pinned dual group.
theorem wittRationalSatakeEquivalence :
    ∃ S : SatW ≌ Comod, Nonempty (S.functor ⋙ forget ≅ H) := by sorry
end WittRationalSatake

section PerfectExtension
-- Omitted: these are the stable infinity-categories Perf(B(Ghat⋊Q)^I),
-- Perf(BQ^I), and enhanced local D-solid convolution, with their exact structure.
-- Ordinary Category/MonoidalCategory below display only their homotopy signatures.
variable (Rep Sat Perf Enhanced : Type u)
variable [Category Rep] [Category Sat] [Category Perf] [Category Enhanced]
variable [MonoidalCategory Perf] [MonoidalCategory Enhanced]
variable (embed : Rep ⥤ Perf) (satake : Rep ⥤ Sat) (relativeDualKernel : Sat ⥤ Enhanced)
def perfectSatakeFunctor : Perf ⥤ Enhanced := by sorry

def perfectSatake_onRepresentation :
    embed ⋙ perfectSatakeFunctor Perf Enhanced ≅ satake ⋙ relativeDualKernel := by sorry

variable (Perf' Enhanced' : Type u) [Category Perf'] [Category Enhanced']
variable (scalarPerf : Perf ⥤ Perf') (scalarEnhanced : Enhanced ⥤ Enhanced')
variable (extension' : Perf' ⥤ Enhanced')
def perfectSatake_baseChange :
    scalarPerf ⋙ extension' ≅ perfectSatakeFunctor Perf Enhanced ⋙ scalarEnhanced := by sorry

-- Omitted: exactness means preservation of zero/cofibres, not a Prop certificate.
-- A cofiber-sequence preservation theorem cannot be typed at these pins. Its
-- expressible shift comparison is recorded, with the other exactness conditions omitted.
variable (shiftPerf : Perf ⥤ Perf) (shiftEnhanced : Enhanced ⥤ Enhanced)
def perfectSatake_exact : shiftPerf ⋙ perfectSatakeFunctor Perf Enhanced ≅
    perfectSatakeFunctor Perf Enhanced ⋙ shiftEnhanced := by sorry

variable (collisionPerf : Perf ⥤ Perf') (collisionEnhanced : Enhanced ⥤ Enhanced')
def perfectSatake_finiteSets : collisionPerf ⋙ extension' ≅
    perfectSatakeFunctor Perf Enhanced ⋙ collisionEnhanced := by sorry

-- Omitted: U is exact/linear/monoidal; restriction below is an isomorphism of
-- those structures. Equality of object values alone does not determine a functor.
-- The universal property comes from LP4, not a Prop-valued universal-property field.
def perfectSatake_unique (U : Perf ⥤ Enhanced)
    (_restriction : embed ⋙ U ≅ satake ⋙ relativeDualKernel) :
    U ≅ perfectSatakeFunctor Perf Enhanced := by sorry
-- No full faithfulness or equality of the essential image with its stable
-- idempotent closure is asserted by the source extension theorem.

-- test_perfect_unit
example : (perfectSatakeFunctor Perf Enhanced).obj (𝟙_ Perf) ≅ 𝟙_ Enhanced := by sorry
-- test_perfect_shift
example (V : Rep) :
    (perfectSatakeFunctor Perf Enhanced).obj (shiftPerf.obj (embed.obj V)) ≅
      shiftEnhanced.obj (relativeDualKernel.obj (satake.obj V)) := by sorry
-- test_perfect_badPrimeAllowed: ell=2, p odd, G=SL2, dual PGL2, no exclusion.
-- This example gives the representation restriction WITHOUT a fundamental-group
-- invertibility parameter; the missing geometric instance is recorded in the gap.
example (V : Rep) :
    (perfectSatakeFunctor Perf Enhanced).obj (embed.obj V) ≅
      relativeDualKernel.obj (satake.obj V) := by sorry
end PerfectExtension

section FrobeniusFunctions
-- Here the exact finite-model, Frobenius-descent and half-twist realization
-- conditions are omitted; the pointwise normalization is fully expressible.
variable {Λ : Type u} {G : Type v} [Field Λ]
def normalizedTraceFunction (parity : G → ZMod 2) (rawTrace : G → Λ) : G → Λ :=
  fun g => if parity g = 1 then -rawTrace g else rawTrace g

theorem normalizedTrace_add (p : G → ZMod 2) (f h : G → Λ) :
    normalizedTraceFunction p (fun g => f g + h g) =
      fun g => normalizedTraceFunction p f g + normalizedTraceFunction p h g := by sorry

theorem normalizedTrace_halfTwist (p : G → ZMod 2) (f : G → Λ)
    (r : Λˣ) (d : ℤ) :
    normalizedTraceFunction p (fun g => (↑(r⁻¹) : Λ)^d * f g) =
      fun g => (↑(r⁻¹) : Λ)^d * normalizedTraceFunction p f g := by sorry

variable [Group G]
theorem normalizedTrace_biinvariant (p : G → ZMod 2) (f : G → Λ)
    (K : Subgroup G)
    (hp : ∀ k ∈ K, ∀ g, p (k * g) = p g ∧ p (g * k) = p g)
    (hf : ∀ k ∈ K, ∀ g, f (k * g) = f g ∧ f (g * k) = f g) :
    ∀ k ∈ K, ∀ g,
      normalizedTraceFunction p f (k * g) = normalizedTraceFunction p f g ∧
      normalizedTraceFunction p f (g * k) = normalizedTraceFunction p f g := by sorry

-- Omitted: c is the minuscule double-coset indicator, raw trace is its shifted
-- constant sheaf with half twist; the scalar equality itself is unconditional.
theorem normalizedTrace_minuscule (r : Λˣ) (d : ℕ) (c : G → Λ) :
    normalizedTraceFunction (fun _ => (d : ZMod 2))
      (fun g => (-1 : Λ)^d * (↑(r⁻¹) : Λ)^d * c g) =
      fun g => (↑(r⁻¹) : Λ)^d * c g := by sorry

-- test_trace_unit: canonical constant-sheaf Frobenius descent, coefficient +1.
example : normalizedTraceFunction (fun _ : Unit => 0) (fun _ => (1 : Λ)) () = 1 := by sorry
-- test_trace_torusWeight: canonical descent of the constant sheaf on the weight
-- point contributes an indicator, rho=0. A scaled descent scales the function.
example (n : ℤ) :
    normalizedTraceFunction (fun _ : ℤ => 0) (fun m => if m = n then (1 : Λ) else 0) =
      fun m => if m = n then (1 : Λ) else 0 := by sorry
-- test_trace_oddMinuscule: canonical IC descent; odd perverse shift changes raw
-- sign, half twist r^{-1}. An arbitrary Frobenius descent has a different trace.
example (r : Λˣ) :
    normalizedTraceFunction (fun _ : Unit => 1) (fun _ => -(↑(r⁻¹) : Λ)) () = ↑(r⁻¹) :=
  by sorry

-- Named trace-convolution, trace-constant-term and classical-satake-comparison
-- nodes. Actual finite-model pushforward, Haar measure, Frobenius weight fibre,
-- nonsplit descent and SR.4 transform are omitted; these carriers are those
-- imported mathematical constructions, not arbitrary operations with certificates.
variable (Sat : Type u) (Hecke Character : Type u)
variable (trace : Sat → Hecke) (fusion : Sat → Sat → Sat)
variable (convolution : Hecke → Hecke → Hecke)
theorem traceConvolution (A B : Sat) :
    trace (fusion A B) = convolution (trace A) (trace B) := by sorry
variable (transform : Hecke → Character) (weightTrace : Sat → Character)
theorem traceConstantTerm (A : Sat) : transform (trace A) = weightTrace A := by sorry
variable (normalizedCharacter : Sat → Character)
theorem classicalSatakeComparison (A : Sat) :
    transform (trace A) = normalizedCharacter A := by sorry
end FrobeniusFunctions

end TauCeti.GeometricSatake
