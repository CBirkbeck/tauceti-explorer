/-
This file is not the roadmap and is not exhaustive. README.md is the definitive
mathematical specification. These statements suggest Lean forms so contributors
and reviewers can converge on names and signatures. Proofs and unfinished
constructions use `sorry`; these signatures claim no implementation.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The algebraic and categorical cores below use the existing library carriers.
Completed divisor rings, diamonds, local Hecke stacks, universal local acyclicity,
relative perversity, continuous Weil local systems, perfect finite-type models,
pinned integral dual groups and enhanced stable coefficient categories enter
through the supplier interfaces specified in README.md. Where their hypotheses
cannot yet be stated, the adjacent comment identifies the omitted condition.
No missing condition is replaced by an arbitrary proposition or certificate.
Parameters such as Sat, Loc, D and S denote the geometric categories supplied
there; the signatures do not assert the geometric conclusions for arbitrary
categories. The full mathematical statements and their hypotheses are in README.md.

The common namespace is TauCeti.GeometricSatake. GS0–GS2 cover loop and Witt
geometry, relative perversity, the Satake category, convolution and rigidity.
GS3–GS4 cover fusion, reconstruction, the dual group and classical comparison.
The relative reconstruction theorem comes from MotivesAndAlgebraicCycles MC.6;
Tau Ceti's known-Hopf reconstruction only supplies the subsequent comparison.
Unit examples are labelled by their mathematical test names.
-/
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.FieldTheory.Perfect
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.CategoryTheory.Limits.Shapes.Kernels
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.CategoryTheory.Action
import Mathlib.CategoryTheory.Action.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.DirectSum.Finsupp
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Monad.Monadicity
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.RepresentationTheory.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive

noncomputable section

universe u v w

namespace TauCeti.GeometricSatake

/-! ## Layers GS0–GS2: Grassmannians, Witt geometry, perversity and convolution -/

section LayersGS0toGS2

open CategoryTheory CategoryTheory.Limits
open scoped MonoidalCategory ZeroObject
set_option autoImplicit false
open scoped TensorProduct DirectSum

/-- The usual affine G_m functor; its functor laws use the existing units API. -/
def gmPoints : CommRingCat.{u} ⥤ Type u := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke
For an affine O_E-scheme Z and a divisor D in Div^d_𝒴, L⁺Z(S)=Z(B⁺_D(S)) and LZ(S)=Z(B_D(S)) are v-sheaves over Div^d_𝒴. The generic E-scheme version is defined over Div^d_Y or Div^d_X. For X use the basis of affinoid S for which D_S is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion L⁺G→LG.
Prototype boundary: This signature retains affine functor evaluation; completed-ring assignment, divisor sites, v-descent and group-valued structure are supplied by RF2/RG. Full loop evaluation is the same signature at the localized input ring. -/
def positiveLoopSpace (F : CommRingCat ⥤ Type u) (A : CommRingCat) : Type u :=
  F.obj A

/-- API: At a completed ring A, the positive loop space is the affine functor of points F(A); the full loop space uses A[1/ξ]. -/
theorem positiveLoopSpace_eval (F : CommRingCat ⥤ Type u) (A : CommRingCat) : positiveLoopSpace F A = F.obj A := by sorry

/-- API: A ring map induces the map F(f); identity and composition agree with those in the affine functor. -/
def positiveLoopSpace_map (F : CommRingCat ⥤ Type u) (A B : CommRingCat) (f : A ⟶ B) : positiveLoopSpace F A → positiveLoopSpace F B := by sorry

/-- API: Positive loop maps compose in the same order as ring maps. -/
theorem positiveLoopSpace_map_comp (F : CommRingCat ⥤ Type u) (A B C : CommRingCat) (f : A ⟶ B) (g : B ⟶ C) (x : positiveLoopSpace F A) : positiveLoopSpace_map F A C (f ≫ g) x = positiveLoopSpace_map F B C g (positiveLoopSpace_map F A B f x) := by sorry

/-- Unit test `loop_gm_units` (computation): For G_m the evaluation at A agrees with the unit group of A. -/
example (A : CommRingCat.{u}) : positiveLoopSpace gmPoints A = Aˣ := by sorry

/-- Unit test `loop_trivial` (degenerate): The trivial affine group has one loop at every ring. -/
example (A : CommRingCat) : Unique (positiveLoopSpace ((Functor.const CommRingCat).obj (PUnit : Type u)) A) := by sorry

/-- Unit test `loop_affine_evaluation` (compatibility): Affine evaluation uses the existing CommRingCat functor, not an underlying-set functor on schemes. -/
example (F : CommRingCat ⥤ Type u) (A : CommRingCat) : positiveLoopSpace F A = F.obj A := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack
Hck_G(S) is the groupoid of two G-torsors on Spec B⁺_D(S), together with an isomorphism of their B_D-restrictions. It is a small v-stack; its étale-stack presentation is [L⁺G\LG/L⁺G].
Prototype boundary: The action groupoid is the local presentation. Stackification, ring-valued torsors and étale-local trivialization are not encoded by a new unknown predicate. -/
@[instance_reducible] def localHeckeAction (G : Type u) [Group G] (H : Subgroup G) : MulAction (H × H) G :=
  by sorry

/-- API: The double action is (h₁,h₂)·g=h₁gh₂⁻¹, and the quotient is an action groupoid. -/
theorem localHeckeAction_formula (G : Type u) [Group G] (H : Subgroup G) (h : H × H) (g : G) : @SMul.smul (H × H) G (localHeckeAction G H).toSMul h g = (h.1 : G) * g * (h.2 : G)⁻¹ := by sorry

/-- API: For the double action, the local quotient uses Mathlib ActionCategory with its Groupoid instance. -/
@[instance_reducible] def localHeckeAction_groupoid (G : Type u) [Group G] (H : Subgroup G) : letI := localHeckeAction G H; Groupoid (ActionCategory (H × H) G) := by sorry

/-- API: The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group. -/
theorem localHeckeAction_unit_stabilizer (G : Type u) [Group G] (H : Subgroup G) (h : H × H) : @SMul.smul (H × H) G (localHeckeAction G H).toSMul h 1 = 1 ↔ h.1 = h.2 := by sorry

/-- Unit test `hecke_trivial_group` (degenerate): For the trivial group there is one modification and one automorphism. -/
example :
    letI := localHeckeAction PUnit (⊤ : Subgroup PUnit)
    Subsingleton (ActionCategory ((⊤ : Subgroup PUnit) × (⊤ : Subgroup PUnit)) PUnit) ∧
      ∀ x : ActionCategory ((⊤ : Subgroup PUnit) × (⊤ : Subgroup PUnit)) PUnit,
        Subsingleton (x ⟶ x) := by sorry

/-- Unit test `hecke_identity_automorphisms` (non-example): For the additive integers encoded multiplicatively, the identity modification retains nontrivial diagonal automorphisms; the quotient is not the orbit set. -/
example :
    let H := (⊤ : Subgroup (Multiplicative ℤ))
    let h : H := ⟨Multiplicative.ofAdd 1, Subgroup.mem_top _⟩
    (h : Multiplicative ℤ) ≠ 1 ∧
      @SMul.smul (H × H) (Multiplicative ℤ)
        (localHeckeAction (Multiplicative ℤ) H).toSMul (h,h) 1 = 1 := by sorry

/-- Unit test `hecke_double_action` (computation): For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse. -/
example (G : Type u) [Group G] (h : (⊤ : Subgroup G)) :
    @SMul.smul ((⊤ : Subgroup G) × (⊤ : Subgroup G)) G
      (localHeckeAction G ⊤).toSMul (h,1) 1 = (h : G) ∧
    @SMul.smul ((⊤ : Subgroup G) × (⊤ : Subgroup G)) G
      (localHeckeAction G ⊤).toSMul (1,h) 1 = (h : G)⁻¹ := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian
Gr_G(S) classifies a G-torsor on Spec B⁺_D(S) with a B_D-trivialization. It is a small v-sheaf and the étale sheafification of LG/L⁺G. Its map to Hck_G fixes the second torsor as trivial.
Prototype boundary: Only the coset presentation is typed; étale sheafification and the Beauville–Laszlo comparison require the RF4 supplier. The unit example tests its naming, while the nonnormal API prevents imposing an incorrect normality requirement. -/
def grassmannianQuotient (G : Type u) [Group G] (H : Subgroup G) : Type u :=
  G ⧸ H

/-- API: The trivialized local presentation is the existing right-coset carrier G/H; H need not be normal. -/
theorem grassmannianQuotient_eq (G : Type u) [Group G] (H : Subgroup G) : grassmannianQuotient G H = (G ⧸ H) := by sorry

/-- API: Every full loop gives its right-coset class and hence a trivialized modification. -/
def grassmannianQuotient_mk (G : Type u) [Group G] (H : Subgroup G) : G → grassmannianQuotient G H := by sorry

/-- API: Two trivializations define the same point precisely when g⁻¹g′ lies in H. -/
theorem grassmannianQuotient_eq_iff (G : Type u) [Group G] (H : Subgroup G) (g g' : G) : grassmannianQuotient_mk G H g = grassmannianQuotient_mk G H g' ↔ g⁻¹ * g' ∈ H := by sorry

/-- API: The unit section is the class of the identity full loop. -/
def grassmannianQuotient_unit (G : Type u) [Group G] (H : Subgroup G) : grassmannianQuotient G H := by sorry

/-- Unit test `grassmannian_zero` (degenerate): The unit section is the coset of the identity full loop. -/
example (G : Type u) [Group G] (H : Subgroup G) : grassmannianQuotient_unit G H = grassmannianQuotient_mk G H 1 := by sorry

/-- Unit test `grassmannian_all_subgroup` (computation): When H=G, the local quotient has exactly one point. -/
example (G : Type u) [Group G] : Subsingleton (grassmannianQuotient G ⊤) := by sorry

/-- Unit test `grassmannian_non_normal` (compatibility): Grassmannian cosets do not require H normal; the quotient is the existing set quotient even without a quotient-group structure. -/
example (G : Type u) [Group G] (H : Subgroup G) : grassmannianQuotient G H = (G ⧸ H) := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness
After a splitting extension and choices T⊂B⊂G, define Gr_{≤μ} by geometric rank-one points whose Cartan coweight is ≤μ; Gr_μ has exact relative position μ. Over generic Div^d_Y and Div^d_X the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each π₁(G)-component is Gr. Bounds for a tuple of legs sum at collisions.
Prototype boundary: The GL_n combinatorial core is a fully stated predicate, not a placeholder. Geometric relative-position maps, closedness and properness have their own theorem nodes and supplier requests. -/
def dominanceBound {n : ℕ} (ν μ : Fin n → ℤ) : Prop :=
  (∑ i, ν i) = (∑ i, μ i) ∧ ∀ j : ℕ, (∑ i with i.val < j, ν i) ≤ (∑ i with i.val < j, μ i)

/-- API: For GL_n, dominance means equal total degree and every initial partial sum of ν at most the corresponding sum of μ. -/
theorem dominanceBound_iff {n : ℕ} (ν μ : Fin n → ℤ) : dominanceBound ν μ ↔ (∑ i, ν i) = (∑ i, μ i) ∧ ∀ j : ℕ, (∑ i with i.val < j, ν i) ≤ (∑ i with i.val < j, μ i) := by sorry

/-- API: Every dominant cocharacter lies in its own bound. -/
theorem dominanceBound_refl {n : ℕ} (μ : Fin n → ℤ) : dominanceBound μ μ := by sorry

/-- API: Bounds are nested by transitivity of the dominance relation. -/
theorem dominanceBound_trans {n : ℕ} (lam ν μ : Fin n → ℤ) : dominanceBound lam ν → dominanceBound ν μ → dominanceBound lam μ := by sorry

/-- Unit test `bound_zero_component` (degenerate): For a torus of rank one the bound is equality, not the usual integer order. -/
example (a b : Fin 1 → ℤ) : dominanceBound a b ↔ a = b := by sorry

/-- Unit test `bound_gl2` (computation): GL₂ coweight (1,1) is below (2,0). -/
example : dominanceBound (![1,1] : Fin 2 → ℤ) ![2,0] := by sorry

/-- Unit test `bound_wrong_degree` (non-example): The cocharacter (1,0) is not below (2,0), despite its smaller partial sums. -/
example : ¬ dominanceBound (![1,0] : Fin 2 → ℤ) ![2,0] := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure
For split G and an Iwahori model 𝓘⊂G, Fl_G=LG/L⁺𝓘 over Spd O_C. Its projection to Gr has v-locally fibre (G/B)^⋄ and is proper and cohomologically smooth. For w=s₁⋯s_rω reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by L⁺𝓘, followed by ω. It is an iterated (P¹)^⋄-bundle, proper over the bound, and isomorphic over the open w-cell.
Prototype boundary: The typed chain is the functor-of-points incidence core; contracted products, parahoric torsors and the iterated P¹-bundle structures need RG/SF/VS suppliers. This core does not prove representability. -/
def demazureChains (X : Type u) (r : ℕ) (step : Fin r → Set (X × X)) : Type u :=
  {x : Fin (r+1) → X // ∀ i : Fin r, (x i.castSucc, x i.succ) ∈ step i}

/-- API: The point core consists of chains x₀,…,x_r with each consecutive pair in the specified simple-step relation. -/
theorem demazureChains_points (X : Type u) (r : ℕ) (step : Fin r → Set (X × X)) : demazureChains X r step = {x : Fin (r+1) → X // ∀ i : Fin r, (x i.castSucc, x i.succ) ∈ step i} := by sorry

/-- API: Multiplication forgets the intermediate flags and keeps the endpoints. -/
def demazureChains_endpoint (X : Type u) (r : ℕ) (step : Fin r → Set (X × X)) : demazureChains X r step → X × X := by sorry

/-- API: A map of flag spaces preserving each simple-step relation acts on every vertex of a Demazure chain. -/
def demazureChains_base_change (X Y : Type u) (r : ℕ) (step : Fin r → Set (X × X)) (step' : Fin r → Set (Y × Y)) (f : X → Y) (hf : ∀ i a b, (a,b) ∈ step i → (f a,f b) ∈ step' i) : demazureChains X r step → demazureChains Y r step' := by sorry

/-- Unit test `demazure_empty` (degenerate): An empty chain is one flag; its two endpoints coincide. -/
example (X : Type u) (step : Fin 0 → Set (X × X)) : demazureChains X 0 step ≃ X := by sorry

/-- Unit test `demazure_one_step` (computation): A one-step chain is the given simple-step incidence relation. -/
example (X : Type u) (step : Fin 1 → Set (X × X)) : demazureChains X 1 step ≃ {xy : X × X // xy ∈ step 0} := by sorry

/-- Unit test `demazure_not_product` (non-example): If a simple-step relation is empty, there is no chain, even if the flag space is nonempty. -/
example (X : Type u) : IsEmpty (demazureChains X 1 (fun _ => ∅)) := by sorry

/-! GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops
For m≥1, L^{+,<m}G(S)=G(B⁺_D(S)/I^m) is the finite congruence quotient of L⁺G as a v-sheaf. Reduction has smooth vector-group kernels Lie(G)⊗I^j/I^{j+1}, 1≤j<m. These quotients provide finite-dimensional group actions on bounded Hecke loci.
Prototype boundary: Nilpotent lifting, v-local surjectivity and finite-dimensional smoothness are omitted from the core type; no finite dimension is assigned to the entire positive loop group. -/
def truncatedPositiveLoop (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) (m : ℕ) : Type u :=
  by sorry

/-- API: The finite loop quotient evaluates F on the ring A/I^m, rather than the subgroup ker(F(A)→F(A/I^m)). -/
theorem truncatedPositiveLoop_eval (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) (m : ℕ) : truncatedPositiveLoop F A I m = F.obj (CommRingCat.of (A ⧸ I^m)) := by sorry

/-- API: Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective. -/
def truncatedPositiveLoop_reduction (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) (m : ℕ) : positiveLoopSpace F A → truncatedPositiveLoop F A I m := by sorry

/-- API: For a≤b, reduction modulo I^b maps to reduction modulo I^a. -/
def truncatedPositiveLoop_transition (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) (a b : ℕ) (hab : a ≤ b) : truncatedPositiveLoop F A I b → truncatedPositiveLoop F A I a := by sorry

/-- Unit test `truncation_one` (computation): At m=1 the quotient is G(A/I), not the congruence kernel. -/
example (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) : truncatedPositiveLoop F A I 1 = F.obj (CommRingCat.of (A ⧸ I)) := by sorry

/-- Unit test `truncation_trivial_group` (degenerate): Every finite quotient of the trivial group is trivial. -/
example (A : CommRingCat) (I : Ideal A) (m : ℕ) : Unique (truncatedPositiveLoop ((Functor.const CommRingCat).obj (PUnit : Type u)) A I m) := by sorry

/-- Unit test `truncation_ring_quotient` (compatibility): The ring input is Mathlib Ideal.Quotient, preserving the ideal and its exponent. -/
example (F : CommRingCat ⥤ Type u) (A : CommRingCat) (I : Ideal A) (m : ℕ) : truncatedPositiveLoop F A I m = F.obj (CommRingCat.of (A ⧸ I^m)) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability
For a perfect F_p-algebra R let Λ be a finite projective W(R)-submodule of W(R)[1/p]^n with Λ[1/p]=W(R)[1/p]^n. Gr^W_GL_n is the v-sheaf of such lattices; a positive bounded piece Gr_{≤lam} has Λ⊂W(R)^n and quotient of type ≤lam. Negative bounds are obtained by translating by p^a. For O_E coefficients use RF0’s ramified Witt ring; for a general smooth model 𝓖 use 𝓖-torsors with a punctured trivialization.
Prototype boundary: The generic imported coefficient algebra B→K is the ramified Witt ring and its localization in the intended application. The finite/projective/span conditions are concrete. A separate structure below records them; representing schemes are not defined by this point core. -/
def WittLattice (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] (n : ℕ) : Type u :=
  {L : Submodule B (Fin n → K) // Module.Finite B L ∧ Module.Projective B L ∧ Submodule.span K (Set.range (fun x : L => (x : Fin n → K))) = ⊤}

/-- API: A lattice is a finite projective B-submodule of K^n whose K-span is the whole module. -/
def WittLattice_module (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] (n : ℕ) : WittLattice B K n → Submodule B (Fin n → K) := by sorry

/-- API: The image of B^n in K^n gives the standard lattice when B→K is injective. -/
def WittLattice_standard (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] (n : ℕ) (hinj : Function.Injective (algebraMap B K)) : WittLattice B K n := by sorry

/-- API: Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli. -/
theorem WittLattice_ext (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] (n : ℕ) (L M : WittLattice B K n) (h : WittLattice_module B K n L = WittLattice_module B K n M) : L = M := by sorry

/-- Unit test `lattice_rank_zero` (degenerate): There is only one rank-zero lattice. -/
example (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] : Subsingleton (WittLattice B K 0) := by sorry

/-- Unit test `lattice_standard_field` (compatibility): Over B=K the standard lattice agrees with the top Submodule of K^n. -/
example (K : Type u) [Field K] (n : ℕ) : WittLattice_module K K n (WittLattice_standard K K n (by sorry)) = ⊤ := by sorry

/-- Unit test `lattice_span` (non-example): A purported rank-one lattice with zero embedded submodule is excluded over a nonzero field. -/
example (K : Type u) [Field K] (L : WittLattice K K 1) : WittLattice_module K K 1 L ≠ ⊥ := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds
A finite p-power-torsion isogeny cokernel Q over W(R) has geometric type lam=(lam₁≥⋯≥lam_n≥0), meaning Q_x≅⊕W(k_x)/p^{lam_j}. Its row lengths are n_lam(i)=#{j:lam_j>i}. Dominance means equal total length and all partial sums bounded. Type ≤lam is a closed locus; on a constant-type locus the modules p^iQ/p^{i+1}Q are finite projective of ranks n_lam(i). An isogeny is a map of finite projective W-modules invertible after p-inversion.
Prototype boundary: The type relation and column counts are concrete; elementary divisors for a finitely presented isogeny cokernel over a perfect family are an RG/SF refinement. -/
def wittTypeBound {n : ℕ} (type bound : Fin n → ℕ) : Prop :=
  dominanceBound (fun i => (type i : ℤ)) (fun i => (bound i : ℤ))

/-- API: The quotient-type relation is GL_n dominance after embedding nonnegative parts in the integer coweight lattice. -/
theorem wittTypeBound_dominance {n : ℕ} (type bound : Fin n → ℕ) : wittTypeBound type bound ↔ dominanceBound (fun i => (type i : ℤ)) (fun i => (bound i : ℤ)) := by sorry

/-- API: The i-th graded quotient has rank equal to the number of parts lam_j exceeding i. -/
def wittTypeBound_columns {n : ℕ} (lam : Fin n → ℕ) (i : ℕ) : ℕ := by sorry

/-- API: A lower quotient type remains in any larger bound. -/
theorem wittTypeBound_closed_under_dominance {n : ℕ} (a b c : Fin n → ℕ) : wittTypeBound a b → wittTypeBound b c → wittTypeBound a c := by sorry

/-- Unit test `witt_type_zero` (degenerate): The zero bound admits only zero nonnegative quotient parts. -/
example {n : ℕ} (lam : Fin n → ℕ) : wittTypeBound lam 0 ↔ lam = 0 := by sorry

/-- Unit test `witt_type_210` (computation): For lam=(2,1,0), the successive column ranks are two and one. -/
example  : wittTypeBound_columns (![2,1,0] : Fin 3 → ℕ) 0 = 2 ∧ wittTypeBound_columns (![2,1,0] : Fin 3 → ℕ) 1 = 1 := by sorry

/-- Unit test `witt_type_not_component_order` (non-example): The quotient type (1,0,0) is not below (2,1,0), since its length is one rather than three. -/
example  : ¬ wittTypeBound (![1,0,0] : Fin 3 → ℕ) ![2,1,0] := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation
For lam=(N,0,…,0), V_N parametrizes W-matrices with determinant p^N times a unit. For h>N, V_{N,h} is the perfection of the truncated determinant locus det₀=⋯=det_{N−1}=0, det_N invertible. Gr̄_{N,h} adds a W_h-trivialization of the lattice and is an L^hGL_n-torsor over Gr̄_N. The stabilizer J={(A,γ):Aγ=A} gives Gr̄_{N,h}≅J after a chosen normalized lift.
Prototype boundary: The determinant equation is the matrix core. Finite Greenberg representability, the lift-kernel quotient and its perfect torsor are imported, not represented by an arbitrary smoothness predicate. -/
def jetDeterminantLocus (B : Type u) [CommRing B] (n : ℕ) (π : B) (N : ℕ) : Set (Matrix (Fin n) (Fin n) B) :=
  {A | ∃ u : Bˣ, A.det = (u : B) * π^N}

/-- API: The matrix jet lies on the determinant locus when det(A)=uπ^N for a unit u; the finite truncation and bound h>N are retained in the application. -/
theorem jetDeterminantLocus_mem (B : Type u) [CommRing B] (n : ℕ) (π : B) (N : ℕ) (A : Matrix (Fin n) (Fin n) B) : A ∈ jetDeterminantLocus B n π N ↔ ∃ u : Bˣ, A.det = (u : B) * π^N := by sorry

/-- API: Right multiplication by an invertible matrix preserves the determinant locus. -/
theorem jetDeterminantLocus_right_invariance (B : Type u) [CommRing B] (n : ℕ) (π : B) (N : ℕ) (A g : Matrix (Fin n) (Fin n) B) (hg : IsUnit g.det) : A ∈ jetDeterminantLocus B n π N → A * g ∈ jetDeterminantLocus B n π N := by sorry

/-- API: A ring map takes the determinant locus to the corresponding locus with the image uniformizer. -/
theorem jetDeterminantLocus_ring_map (B C : Type u) [CommRing B] [CommRing C] (f : B →+* C) (n : ℕ) (π : B) (N : ℕ) (A : Matrix (Fin n) (Fin n) B) : A ∈ jetDeterminantLocus B n π N → A.map f ∈ jetDeterminantLocus C n (f π) N := by sorry

/-- Unit test `jet_level_zero` (degenerate): For N=0 the determinant is a unit. -/
example (B : Type u) [CommRing B] (n : ℕ) (π : B) (A : Matrix (Fin n) (Fin n) B) : A ∈ jetDeterminantLocus B n π 0 ↔ IsUnit A.det := by sorry

/-- Unit test `jet_identity` (computation): The identity matrix is in the N=0 locus. -/
example (B : Type u) [CommRing B] (n : ℕ) (π : B) : (1 : Matrix (Fin n) (Fin n) B) ∈ jetDeterminantLocus B n π 0 := by sorry

/-- Unit test `jet_zero_excluded` (non-example): A zero rank-one matrix is excluded at N=0 over a nonzero field. -/
example (K : Type u) [Field K] : (0 : Matrix (Fin 1) (Fin 1) K) ∉ jetDeterminantLocus K 1 0 0 := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution
Construction clarification (BS 7.11, pp.29–30): choose Q/pQ→G of rank n_lam(0) and recurse on ker(Q→G). Q/pQ itself can have larger rank on lower-type fibres; for lam=(2,1,0), Q=k³ gives the P² family of rank-two quotients.
For Q of type ≤lam, Dem_lam(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_lam(i). The global resolution Gr̃_lam classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤lam}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.
Prototype boundary: The submodule-chain core omits prescribed locally free quotient ranks, annihilation by p, perfect-scheme representability and its lattice map. These conditions are specified in the roadmap document. -/
def wittFiltration (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (r : ℕ) : Type u :=
  {F : ℕ → Submodule R M // Antitone F ∧ F 0 = ⊤ ∧ ∀ i, r ≤ i → F i = ⊥}

/-- API: The typed filtration consists of a decreasing chain of submodules starting at M and ending at zero. -/
theorem wittFiltration_eval (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (r : ℕ) : wittFiltration R M r = {F : ℕ → Submodule R M // Antitone F ∧ F 0 = ⊤ ∧ ∀ i, r ≤ i → F i = ⊥} := by sorry

/-- API: Evaluation gives the i-th submodule in the chain. -/
def wittFiltration_piece (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (r : ℕ) (F : wittFiltration R M r) (i : ℕ) : Submodule R M := by sorry

/-- API: Two filtration points are equal if all their submodules agree. -/
theorem wittFiltration_ext (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (r : ℕ) (F G : wittFiltration R M r) (h : ∀ i, wittFiltration_piece R M r F i = wittFiltration_piece R M r G i) : F = G := by sorry

/-- Unit test `filtration_length_zero` (degenerate): A length-zero filtration forces the module to be zero. -/
example (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (F : wittFiltration R M 0) : (⊤ : Submodule R M) = ⊥ := by sorry

/-- Unit test `filtration_one_step` (computation): A length-one filtration has first piece top and all later pieces zero. -/
example (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (F : wittFiltration R M 1) : wittFiltration_piece R M 1 F 0 = ⊤ ∧ wittFiltration_piece R M 1 F 1 = ⊥ := by sorry

/-- Unit test `filtration_direction` (non-example): The filtration decreases; increasing kernels of p must first be reverse-indexed. -/
example (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (r : ℕ) (F : wittFiltration R M r) : wittFiltration_piece R M r F 1 ≤ wittFiltration_piece R M r F 0 := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line
There is a unique line bundle L on Gr_{≤lam} whose pullback to Gr̃_lam is ⊗_i det_R(Q_i/Q_{i+1}); these lines agree under lower bounds and hence form the determinant line on Gr_GL_n. Construct it geometrically using complete-flag refinements and fibre triviality, without the K-theoretic determinant.
Prototype boundary: Only the existing invertible-sheaf carrier is typed. X must be the specified bounded Witt scheme, pull the specified resolution/restriction, and gradedDet its graded determinant. Those missing geometric conditions are omitted in these signatures and are not arbitrary new predicates. -/
def geometricDeterminantLine (X : AlgebraicGeometry.Scheme.{u}) (lam : List ℕ) : TauCeti.AlgebraicGeometry.InvertibleSheaf X :=
  by sorry

/-- API: On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention. -/
theorem geometricDeterminantLine_pullback (X Y : AlgebraicGeometry.Scheme.{u}) (lam : List ℕ) (pull : TauCeti.AlgebraicGeometry.InvertibleSheaf X ⥤ TauCeti.AlgebraicGeometry.InvertibleSheaf Y) (gradedDet : TauCeti.AlgebraicGeometry.InvertibleSheaf Y) : Nonempty (pull.obj (geometricDeterminantLine X lam) ≅ gradedDet) := by sorry

/-- API: Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves. -/
theorem geometricDeterminantLine_unique (X Y : AlgebraicGeometry.Scheme.{u}) (pull : TauCeti.AlgebraicGeometry.InvertibleSheaf X ⥤ TauCeti.AlgebraicGeometry.InvertibleSheaf Y) [pull.Full] [pull.Faithful] (L M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (h : pull.obj L ≅ pull.obj M) : Nonempty (L ≅ M) := by sorry

/-- API: Restriction to a lower bound agrees with that bound’s determinant line. -/
theorem geometricDeterminantLine_lower_bound (X Y : AlgebraicGeometry.Scheme.{u}) (lam ν : List ℕ) (pull : TauCeti.AlgebraicGeometry.InvertibleSheaf X ⥤ TauCeti.AlgebraicGeometry.InvertibleSheaf Y) : Nonempty (pull.obj (geometricDeterminantLine X lam) ≅ geometricDeterminantLine Y ν) := by sorry

/-- Unit test `determinant_zero` (degenerate): The zero bound has the trivial invertible sheaf. -/
example (X : AlgebraicGeometry.Scheme.{u}) : Nonempty (geometricDeterminantLine X [] ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) := by sorry

/-- Unit test `determinant_existing_carrier` (compatibility): The descended geometric line uses Tau Ceti InvertibleSheaf, rather than a rank-one module at a point. -/
example (X : AlgebraicGeometry.Scheme.{u}) (lam : List ℕ) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf X := geometricDeterminantLine X lam

/-- Unit test `determinant_quotient_sign` (computation): On a one-step quotient Grassmannian, the descended line pulls back to the graded quotient determinant; its sign is the quotient sign. -/
example (X : AlgebraicGeometry.Scheme.{u}) (oneStepDet : TauCeti.AlgebraicGeometry.InvertibleSheaf X) : Nonempty (geometricDeterminantLine X [1] ≅ oneStepDet) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models
For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.
Prototype boundary: The coefficient input is explicitly a perfect field of characteristic p. Finite-type, normalization, model perfection and Frobenius-twisted transition conditions are supplied by SF0/SF1. The canonical model and its maps use Mathlib Scheme. The sketch-only Dieudonné comparison is a recorded gap; Conjecture III is not a theorem. -/
def canonicalWittModel (p : ℕ) [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (n N h : ℕ) : AlgebraicGeometry.Scheme.{u} :=
  by sorry

/-- API: Canonical models compare across jet depth, after the specified Frobenius twist. -/
def canonicalWittModel_transition (p : ℕ) [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (n N h h' : ℕ)
    (hh : N < h) (hh' : h ≤ h') :
    canonicalWittModel p k n N h' ⟶ canonicalWittModel p k n N h := by sorry

/-- API: The specified normalized jet quotient gives the canonical model. Its geometric identity is omitted. -/
theorem canonicalWittModel_normalized_quotient (p : ℕ) [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (n N h : ℕ) (hh : N < h)
    (normalizedJetQuotient : AlgebraicGeometry.Scheme.{u}) :
    Nonempty (canonicalWittModel p k n N h ≅ normalizedJetQuotient) := by sorry

/-- API: The supplied geometric perfection functor identifies the model with its specified Witt bound. -/
theorem canonicalWittModel_perfection (p : ℕ) [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (n N h : ℕ) (hh : N < h)
    (perf : AlgebraicGeometry.Scheme.{u} ⥤ AlgebraicGeometry.Scheme.{u})
    (bound : AlgebraicGeometry.Scheme.{u}) :
    Nonempty (perf.obj (canonicalWittModel p k n N h) ≅ bound) := by sorry

/-- Unit test `canonical_model_zero` (degenerate): N=0 is the point over the specified perfect field. -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (n h : ℕ) (hh : 0 < h) :
    Nonempty (canonicalWittModel p k n 0 h ≅
      AlgebraicGeometry.Spec (CommRingCat.of k)) := by sorry

/-- Unit test `canonical_model_rank_one` (computation): A GL₁ bound is a single lattice over k. -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (N h : ℕ) (hh : N < h) :
    Nonempty (canonicalWittModel p k 1 N h ≅
      AlgebraicGeometry.Spec (CommRingCat.of k)) := by sorry

/-- Unit test `canonical_model_not_choice` (non-example): Perfection kills nonzero nilpotents;
sharing a perfection therefore does not determine an ordinary finite model. -/
example :
    let ε : TrivSqZeroExt (ZMod 2) (ZMod 2) := TrivSqZeroExt.inr (R := ZMod 2) (1 : ZMod 2)
    ε ≠ 0 ∧ ε^2 = 0 := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization
On Gr_SL_n over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define L_M as det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹, independent of a. It is ample on every proper bound. Translations differ from L only by a line on the base, giving a G_m-central extension of the loop group acting on L.
Prototype boundary: This is the pointwise module carrier for the normalized line. M and M₀ must be the specified finite filtered torsion quotients, and the geometric sheaf gluing is not yet typed. The translation statement omits that geometry, while keeping the indispensable base-line factor. -/
def normalizedDeterminant (R : Type u) [CommRing R] (M M₀ : ModuleCat.{u} R) : ModuleCat.{u} R :=
  by sorry

/-- API: At the standard lattice, the normalized determinant line is the tensor unit. -/
theorem normalizedDeterminant_trivial (R : Type u) [CommRing R] (M₀ : ModuleCat.{u} R) : Nonempty (normalizedDeterminant R M₀ M₀ ≅ ModuleCat.of R R) := by sorry

/-- API: Normalization retains the inverse standard-lattice determinant factor. -/
theorem normalizedDeterminant_comparison (R : Type u) [CommRing R] (M M₀ : ModuleCat.{u} R) (detM detM₀inv : ModuleCat.{u} R) : Nonempty (normalizedDeterminant R M M₀ ≅ ModuleCat.of R (detM ⊗[R] detM₀inv)) := by sorry

/-- API: Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line. -/
theorem normalizedDeterminant_translation (R : Type u) [CommRing R] (M M₀ translated translationLine : ModuleCat.{u} R) : Nonempty (normalizedDeterminant R translated M₀ ≅ ModuleCat.of R (translationLine ⊗[R] normalizedDeterminant R M M₀)) := by sorry

/-- Unit test `normalized_standard` (degenerate): The standard lattice has normalized determinant R. -/
example (R : Type u) [CommRing R] (M₀ : ModuleCat.{u} R) : Nonempty (normalizedDeterminant R M₀ M₀ ≅ ModuleCat.of R R) := by sorry

/-- Unit test `normalized_zero_quotient` (computation): Two zero truncation quotients have the unit determinant. -/
example (R : Type u) [CommRing R] : Nonempty (normalizedDeterminant R (ModuleCat.of R PUnit) (ModuleCat.of R PUnit) ≅ ModuleCat.of R R) := by sorry

/-- Unit test `normalized_tensor_carrier` (compatibility): Tensor products and determinant duals use existing ModuleCat and TensorProduct. -/
example (R : Type u) [CommRing R] (M M₀ : ModuleCat.{u} R) :
    ModuleCat.{u} R := normalizedDeterminant R M M₀

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags
For a parahoric 𝓚 and a dominant cocharacter class μ, the admissible locus A_{𝓚,μ} is the finite closed union of affine Schubert strata labelled by the parahoric image of Adm(μ). Its reduced perfect structure is determined by geometric points. Under a morphism of parahoric models f:𝓚₁→𝓚₂ sending μ₁ to μ₂, the map of affine flags carries A_{𝓚₁,μ₁} into A_{𝓚₂,μ₂}.
Prototype boundary: This finite-union core records only membership and maps. Bruhat downward closure, reduced perfect structure and local-model functoriality belong to RG/SF suppliers. -/
def admissibleFlagLocus (W X : Type u) (Adm : Finset W) (cell : W → Set X) : Set X :=
  {x | ∃ w ∈ Adm, x ∈ cell w}

/-- API: A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata. -/
theorem admissibleFlagLocus_mem (W X : Type u) (Adm : Finset W) (cell : W → Set X) (x : X) : x ∈ admissibleFlagLocus W X Adm cell ↔ ∃ w ∈ Adm, x ∈ cell w := by sorry

/-- API: Increasing the admissible label set enlarges the locus. -/
theorem admissibleFlagLocus_mono (W X : Type u) (A B : Finset W) (cell : W → Set X) (h : A ⊆ B) : admissibleFlagLocus W X A cell ⊆ admissibleFlagLocus W X B cell := by sorry

/-- API: An ambient flag morphism whose local-model comparison sends all admissible strata into the target locus restricts to the admissible locus. -/
theorem admissibleFlagLocus_map (W X Y : Type u) (A : Finset W) (cell : W → Set X) (target : Set Y) (f : X → Y) (h : ∀ w ∈ A, Set.MapsTo f (cell w) target) : Set.MapsTo f (admissibleFlagLocus W X A cell) target := by sorry

/-- Unit test `admissible_empty` (degenerate): The empty label set gives the empty locus. -/
example (W X : Type u) (cell : W → Set X) : admissibleFlagLocus W X ∅ cell = ∅ := by sorry

/-- Unit test `admissible_singleton` (computation): A singleton label gives exactly its Schubert stratum. -/
example (W X : Type u) [DecidableEq W] (w : W) (cell : W → Set X) : admissibleFlagLocus W X {w} cell = cell w := by sorry

/-- Unit test `admissible_nonlabel` (non-example): A point belonging to no admissible stratum is excluded, even when it lies in a different connected component. -/
example (W X : Type u) (A : Finset W) (cell : W → Set X) (x : X) (h : ∀ w ∈ A, x ∉ cell w) : x ∉ admissibleFlagLocus W X A cell := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences
For affine flags define O_w⊂Fl×Fl by relative position w. The two-step incidence C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v} maps by forgetting z to Fl×Fl; pull back to O_{uv} or O_{u*v} to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.
Prototype boundary: The geometric fibre products, bounded pfp models and their dimensions are omitted from this pointwise core; no dimension is asserted for an unbounded ind-space. -/
def flagIncidence (X : Type u) (O₁ O₂ : Set (X × X)) : Type u :=
  {p : X × X × X // (p.1,p.2.1) ∈ O₁ ∧ (p.2.1,p.2.2) ∈ O₂}

/-- API: Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second. -/
theorem flagIncidence_points (X : Type u) (O₁ O₂ : Set (X × X)) : flagIncidence X O₁ O₂ = {p : X × X × X // (p.1,p.2.1) ∈ O₁ ∧ (p.2.1,p.2.2) ∈ O₂} := by sorry

/-- API: The product projection forgets z and returns (x,y). -/
def flagIncidence_projection (X : Type u) (O₁ O₂ : Set (X × X)) : flagIncidence X O₁ O₂ → X × X := by sorry

/-- API: The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions. -/
def flagIncidence_fibre (X : Type u) (O₁ O₂ : Set (X × X)) (x y : X) : {p : flagIncidence X O₁ O₂ // flagIncidence_projection X O₁ O₂ p = (x,y)} ≃ {z : X // (x,z) ∈ O₁ ∧ (z,y) ∈ O₂} := by sorry

/-- Unit test `incidence_identity_left` (computation): If the first relation is the diagonal, z is uniquely x. -/
example (X : Type u) (O : Set (X × X)) : flagIncidence X {p | p.1 = p.2} O ≃ {p : X × X // p ∈ O} := by sorry

/-- Unit test `incidence_empty` (degenerate): An empty first relation gives empty incidence. -/
example (X : Type u) (O : Set (X × X)) : IsEmpty (flagIncidence X ∅ O) := by sorry

/-- Unit test `incidence_no_unrestricted_middle` (non-example): For both diagonal relations, a middle flag different from x cannot occur. -/
example (X : Type u) (p : flagIncidence X {p | p.1 = p.2} {p | p.1 = p.2}) : (flagIncidence_projection X {p | p.1 = p.2} {p | p.1 = p.2} p).1 = (flagIncidence_projection X {p | p.1 = p.2} {p | p.1 = p.2} p).2 := by sorry

/-! GeometricSatakeAndFusion:GS1/length-semicontinuity
Signature omitted under §13, reserved exact name:
`TauCeti.GeometricSatake.divisorLengthUpperSemicontinuous`.
For the actual affinoid-perfectoid S and ordered O_E-untilts of FS VI.3.2,
ξ=∏ ξ_i, B⁺=ξ-adic completion of W_{O_E}(R⁺)[1/[ϖ]], and the
canonical fibre rings B_s⁺, any f∈B⁺ has open loci
{s∈|S| | length_{B_s⁺}(B_s⁺/(f_s)) ≤ m} for every m:ℕ.
The length takes values in ℕ∪{∞}. The geometric fibre rings are products
of complete DVRs over distinct untilt supports, with repeated legs counted
in ξ. A zero factor yields infinite length. The actual space, ring family,
fibre maps, Cartier-residue loci and length carrier are not yet available.
No theorem on an arbitrary function is substituted. -/

/-! GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity
Signature omitted under §13, reserved exact name:
`TauCeti.GeometricSatake.latticeRelativePositionUpperSemicontinuous`.
In that same genuine completed Cartier family let L⊂B=B⁺[1/ξ] be a
finitely generated B⁺-submodule with ξ^N B⁺⊂L⊂ξ^(−N)B⁺ for some N≥0.
The fibre L_s means the image of L⊗B_s⁺ in B_s. For its total relative
position strata S_m, each ⋃_{m′≥m} S_{m′} is closed, and S_m=|S|
for one integer m implies L is finite projective of rank one over B⁺.
The relative position agrees with length(B_s⁺/L_s) when L_s⊂B_s⁺.
The geometric ring family, images, actual relative position and rank-one
fibre-detection interface are not yet available, so the exact named target
is omitted rather than assuming L projective or inventing a Prop field.
This is local rank-one projectivity, not a chosen global generator. -/

/-! GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization
Degree convention (E24; FS pp.202–204): sum the combined local cocharacters once over distinct supports. Two coincident G_m legs labelled (1,0) give tB⁺ of position one, although ξ=t². Do not weight that local position by the multiplicity a second time.
For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel, on a one-leg geometric fibre with primitive equation t, the local strata are S_lam=L U·lam(t). A general total-weight stratum is the union of products over distinct supports whose local labels sum to ν. The union of total-weight strata with ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.
Prototype boundary: The plus/minus comparison omits monodromicity and the geometric correspondence hypotheses. The functor type and plus composition are concrete; hyperbolic localization is imported from VS1. -/
def constantTerm (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar : D ⥤ DP) (pshriek : DP ⥤ DM) : D ⥤ DM :=
  qstar ⋙ pshriek

/-- API: The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward. -/
theorem constantTerm_formula (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar : D ⥤ DP) (pshriek : DP ⥤ DM) : constantTerm D DP DM qstar pshriek = qstar ⋙ pshriek := by sorry

/-- API: On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward. -/
def constantTerm_minus_comparison (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar qminus : D ⥤ DP) (pshriek pstar : DP ⥤ DM) : constantTerm D DP DM qstar pshriek ≅ qminus ⋙ pstar := by sorry

/-- API: Constant term preserves composition of morphisms as a genuine functor. -/
theorem constantTerm_map_comp (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar : D ⥤ DP) (pshriek : DP ⥤ DM) (A B C : D) (f : A ⟶ B) (g : B ⟶ C) : (constantTerm D DP DM qstar pshriek).map (f ≫ g) = (constantTerm D DP DM qstar pshriek).map f ≫ (constantTerm D DP DM qstar pshriek).map g := by sorry

/-- Unit test `ct_torus` (degenerate): For G=T with identity correspondence, constant term is the identity functor. -/
example (D : Type u) [Category.{v} D] : constantTerm D D D (𝟭 D) (𝟭 D) ≅ 𝟭 D := by sorry

/-- Unit test `ct_point_evaluation` (computation): The plus formula evaluates to p-shriek of q-star on every object. -/
example (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar : D ⥤ DP) (pshriek : DP ⥤ DM) (A : D) : (constantTerm D DP DM qstar pshriek).obj A = pshriek.obj (qstar.obj A) := by sorry

/-- Unit test `ct_order` (compatibility): Composition agrees with Mathlib Functor.comp in pullback-then-pushforward order. -/
example (D DP DM : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DM] (qstar : D ⥤ DP) (pshriek : DP ⥤ DM) : constantTerm D DP DM qstar pshriek = qstar ⋙ pshriek := by sorry

/-! GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack
D^ULA(Hck_G/S,Λ) is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to Gr_G is universally locally acyclic over S. Switching the two torsors preserves this condition. On one leg over Spd O_C this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.
Prototype boundary: DU is imported as the ULA category, not defined by an unknown proposition. Action DU H is only the discrete equivariant-object core at a chosen level; smooth geometric action/descent, bounded supports, and enhanced ULA kernels are not encoded. -/
def ulaHeckeCategory (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] : Type (max u v) :=
  Action DU H

/-- API: The typed equivariant-object core is Action DU H, where DU is the supplied ULA category and H is a finite jet group on the chosen bound. -/
theorem ulaHeckeCategory_finite_action (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] : ulaHeckeCategory DU H = Action DU H := by sorry

/-- API: Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms. -/
def ulaHeckeCategory_forget (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] : Action DU H ⥤ DU := by sorry

/-- API: A ULA object has the trivial finite-jet action whenever this is the desired equivariance. -/
def ulaHeckeCategory_trivial_action (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] (A : DU) : Action DU H := by sorry

/-- Unit test `ula_trivial_group` (degenerate): For the trivial group, an equivariant object has no additional automorphism labels. -/
example (DU : Type u) [Category.{v} DU] (A : Action DU PUnit) : A.ρ PUnit.unit = 𝟙 A.V := by sorry

/-- Unit test `ula_intertwining` (non-example): A morphism between equivariant ULA objects must intertwine every group element; an arbitrary underlying morphism is insufficient. -/
example (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] (A B : Action DU H) (f : A ⟶ B) (h : H) : A.ρ h ≫ f.hom = f.hom ≫ B.ρ h := by sorry

/-- Unit test `ula_action_identity` (compatibility): The finite-jet action obeys the existing Action identity law. -/
example (DU : Type u) [Category.{v} DU] (H : Type u) [Group H] (A : Action DU H) : A.ρ 1 = 𝟙 A.V := by sorry

/-! GeometricSatakeAndFusion:GS1/relative-perverse-t-structure
On the bounded-support derived category over a leg base S, define perverse ≤0 by the condition that at each geometric point with r distinct untilts and open-cell labels μ₁,…,μ_r, the restriction lies in ordinary degrees ≤−Σ⟨2ρ,μ_i⟩. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in S is t-exact. On ULA objects the relative condition is detected on geometric fibres.
Prototype boundary: D and DT denote the imported ULA categories with their triangulated structures; CT denotes the conservative normalized constant-term functor. The assumptions asserting that these data arise from the geometric Hecke family are omitted. This is an actual TStructure signature, not a proposition-valued stand-in. -/
def relativePerverse (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) : Triangulated.TStructure D :=
  by sorry

/-- API: On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees. -/
theorem relativePerverse_le (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) (A : D) : (relativePerverse D DT CT tT).le 0 A ↔ tT.le 0 (CT.obj A) := by sorry

/-- API: On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees. -/
theorem relativePerverse_ge (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) (A : D) : (relativePerverse D DT CT tT).ge 0 A ↔ tT.ge 0 (CT.obj A) := by sorry

/-- API: Its heart is the intersection of the two degree-zero aisles, using Mathlib TStructure.heart. -/
theorem relativePerverse_existing_heart (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) (A : D) : (relativePerverse D DT CT tT).heart A ↔ (relativePerverse D DT CT tT).le 0 A ∧ (relativePerverse D DT CT tT).ge 0 A := by sorry

/-- Unit test `perverse_torus` (degenerate): For a torus, normalized constant term is the identity and the relative perverse structure is the ordinary one. -/
example (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) : relativePerverse D D (𝟭 D) t = t := by sorry

/-- Unit test `perverse_zero` (computation): The zero object belongs to the relative perverse heart. -/
example (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) : (relativePerverse D DT CT tT).heart (0 : D) := by sorry

/-- Unit test `perverse_shifted_cell` (compatibility): A smooth d-dimensional cell uses the normalization Λ[d], and on a normalized torus constant term its degree is zero. -/
example (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (tT : Triangulated.TStructure DT) (A : D) : (relativePerverse D DT CT tT).heart A ↔ tT.heart (CT.obj A) := by sorry

/-! GeometricSatakeAndFusion:GS1/flat-perverse-objects
A perverse object A is coefficient-flat if A⊗^L_Λ M is perverse for every Λ-module M. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.
Prototype boundary: The all-module derived tensor functors come from the coefficient supplier. The predicate is fully stated using the existing t-structure heart; the module compatibility specializes it to the existing injectivity characterization of Module.Flat. Derived tensor is not identified with ordinary tensor without flatness. -/
def flatPerverse (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) : ObjectProperty D :=
  fun A => t.heart A ∧ ∀ M : ModuleCat.{u} R, t.heart ((tensor M).obj A)

/-- API: An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every R-module. -/
theorem flatPerverse_iff (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (A : D) : flatPerverse R D t tensor A ↔ t.heart A ∧ ∀ M : ModuleCat.{u} R, t.heart ((tensor M).obj A) := by sorry

/-- API: On the one-point torus, coefficient flatness is Module.Flat: tensoring any injective linear map stays injective. -/
theorem flatPerverse_module (R : Type u) [CommRing R] (M : ModuleCat.{u} R) : Module.Flat R M ↔ ∀ (N P : ModuleCat.{u} R) (f : N →ₗ[R] P), Function.Injective f → Function.Injective (f.lTensor M) := by sorry

/-- API: A flat-perverse object belongs to the Mathlib t-structure heart. -/
theorem flatPerverse_heart (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (A : D) (h : flatPerverse R D t tensor A) : t.heart A := by sorry

/-- Unit test `flat_perverse_zero` (degenerate): The zero object is flat perverse when coefficient tensors preserve zero. -/
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (htensor : ∀ M, (tensor M).obj (0 : D) = 0) : flatPerverse R D t tensor (0 : D) := by sorry

/-- Unit test `flat_module_field` (computation): Every vector space over a coefficient field is flat, agreeing with the point-torus test. -/
example (K : Type u) [Field K] (M : ModuleCat.{u} K) : Module.Flat K M := by sorry

/-- Unit test `flat_module_integral_nonexample` (non-example): Z/2 as a Z-module is not flat; being concentrated in perverse degree zero does not suffice. -/
example : ¬ Module.Flat ℤ (ZMod 2) := by sorry

/-! GeometricSatakeAndFusion:GS1/standard-costandard-objects
For a one-leg μ-cell of dimension d_μ, Δ_μ=pH⁰j_{μ!}Λ[d_μ] and ∇_μ=pH⁰Rj_{μ*}Λ[d_μ]. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist d_μ. The canonical map Δ_μ→∇_μ is retained integrally.
Prototype boundary: jshriek/jstar, jpull, h0 and constant must be the indicated geometric functors and local system. Their geometric identities are omitted, while the existing shift/functor/object types fix the construction order. -/
def standardCostandard (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : D × D :=
  by sorry

/-- API: The standard and costandard objects are perverse H⁰ of j-shriek and j-star of the shifted constant local system Λ[d], respectively. -/
theorem standardCostandard_formula (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : standardCostandard D DC jshriek jstar h0 constant d = (h0.obj (jshriek.obj (constant⟦d⟧)), h0.obj (jstar.obj (constant⟦d⟧))) := by sorry

/-- API: Adjunction gives the standard-to-costandard map; its perverse image is the IC object. -/
def standardCostandard_map (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : (standardCostandard D DC jshriek jstar h0 constant d).1 ⟶ (standardCostandard D DC jshriek jstar h0 constant d).2 := by sorry

/-- API: Both restrict to the same normalized local system on the open cell. -/
theorem standardCostandard_restriction (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (jpull : D ⥤ DC) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : Nonempty (jpull.obj (standardCostandard D DC jshriek jstar h0 constant d).1 ≅ constant⟦d⟧) := by sorry

/-- Unit test `standard_zero_cell` (degenerate): For identity inclusions and dimension zero, both objects are isomorphic to the constant object. HasShift provides a zero-shift isomorphism, not object equality. -/
example (D : Type u) [Category.{v} D] [HasShift D ℤ] (A : D) :
    Nonempty ((standardCostandard D D (𝟭 D) (𝟭 D) (𝟭 D) A 0).1 ≅ A) ∧
    Nonempty ((standardCostandard D D (𝟭 D) (𝟭 D) (𝟭 D) A 0).2 ≅ A) := by sorry

/-- Unit test `standard_open_restriction` (computation): The costandard object restricts to Λ[d] on its own cell. -/
example (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (jpull : D ⥤ DC) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : Nonempty (jpull.obj (standardCostandard D DC jshriek jstar h0 constant d).2 ≅ constant⟦d⟧) := by sorry

/-- Unit test `standard_h0_normalization` (non-example): The construction takes perverse H⁰ and the geometric dimension shift before forming the standard-to-costandard map; unshifted ordinary H⁰ is not substituted. -/
example (D DC : Type u) [Category.{v} D] [Category.{v} DC] [HasShift DC ℤ] (jshriek jstar : DC ⥤ D) (h0 : D ⥤ D) (constant : DC) (d : ℤ) : (standardCostandard D DC jshriek jstar h0 constant d).1 = h0.obj (jshriek.obj (constant⟦d⟧)) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor
Sat^I_G(S,Λ) is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.
Prototype boundary: DU denotes the imported bounded-support ULA category and forgetULA its geometric inclusion. Boundedness is encoded in that input category, not in a new unknown proposition. The actual three-condition Satake subcategory uses Mathlib FullSubcategory. -/
def satakeCategory (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) : Type u :=
  (ObjectProperty.FullSubcategory ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU))

/-- API: Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse. -/
theorem satakeCategory_full_subcategory (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) : satakeCategory R D t tensor DU forgetULA = (ObjectProperty.FullSubcategory ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU)) := by sorry

/-- API: The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful. -/
def satakeCategory_inclusion (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) : (ObjectProperty.FullSubcategory ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU)) ⥤ DU := by sorry

/-- API: A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed. -/
def satakeCategory_morphisms (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) (A B : (ObjectProperty.FullSubcategory ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU))) : (A ⟶ B) ≃ (A.obj ⟶ B.obj) := by sorry

/-- Unit test `satake_zero` (degenerate): A zero ULA object whose underlying object is zero belongs to Satake. -/
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) (A : DU) (hA : forgetULA.obj A = 0) (htensor : ∀ M, (tensor M).obj (0 : D) = 0) : flatPerverse R D t tensor (forgetULA.obj A) := by sorry

/-- Unit test `satake_inclusion_fully_faithful` (compatibility): Morphisms agree with those in the existing Mathlib ObjectProperty full-subcategory construction. -/
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) : ((ObjectProperty.ι ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU))).Full ∧
      ((ObjectProperty.ι ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU))).Faithful := by sorry

/-- Unit test `satake_wrong_degree` (non-example): A ULA object outside the relative perverse heart is excluded from Satake. -/
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) (A : DU) (h : ¬ t.heart (forgetULA.obj A)) : ¬ flatPerverse R D t tensor (forgetULA.obj A) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor
F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification. If ker F(f)→F(A) is split, f:A→B has a kernel in Satake and F preserves it; if F(B)→coker F(f) is split, the analogous cokernel exists and is preserved. These split conditions are essential over integral coefficients and do not make Satake abelian.
Prototype boundary: The direct-sum core below applies to a family H of module-valued functors. Its finite-projectivity lemma has explicit finite-support and degreewise finite-projectivity inputs; its faithfulness lemma requires joint faithfulness of H. In the geometric target S is the actual Satake category: the CT filtration and split-kernel lifting prove these inputs, rather than assume them. That geometric deduction, local constancy on the leg base, and exactness require the supplier carriers and are omitted. No canonical splitting or tensor identification is stated. -/
def satakeFibre (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) : S ⥤ ModuleCat.{u} R :=
  { obj := fun A => ModuleCat.of R (⨁ i : ℤ, (H i).obj A)
    map := fun f => ModuleCat.ofHom (DirectSum.lmap (fun i => ((H i).map f).hom))
    map_id := by sorry
    map_comp := by sorry }

/-- API: The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero. -/
theorem satakeFibre_cohomology (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R (⨁ i : ℤ, (H i).obj A)) := by sorry

/-- API core: A finitely supported family of finite projective cohomology modules
has finite projective total cohomology. The Satake filtration must supply the inputs. -/
theorem satakeFibre_finite_projective (R : Type u) [CommRing R] (S : Type u)
    [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (degrees : Finset ℤ)
    (hzero : ∀ i, i ∉ degrees → Subsingleton ((H i).obj A))
    (hfinite : ∀ i ∈ degrees, Module.Finite R ((H i).obj A))
    (hprojective : ∀ i ∈ degrees, Module.Projective R ((H i).obj A)) :
    Module.Finite R ((satakeFibre R S H).obj A) ∧
      Module.Projective R ((satakeFibre R S H).obj A) := by sorry

/-- API core: Joint faithfulness of the degreewise functors gives faithfulness
of their direct sum. In Satake this input uses split-kernel lifting and conservativity. -/
theorem satakeFibre_faithful (R : Type u) [CommRing R] (S : Type u)
    [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R)
    (hjoint : ∀ {A B : S} (f g : A ⟶ B),
      (∀ i, (H i).map f = (H i).map g) → f = g) :
    (satakeFibre R S H).Faithful := by sorry

/-- Unit test `fibre_torus_rank_one` (computation): A torus skyscraper with one rank-one cohomology module has total cohomology R. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (j : ℤ) (hj : (H j).obj A ≅ ModuleCat.of R R) (hz : ∀ i, i ≠ j → (H i).obj A ≅ ModuleCat.of R PUnit) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R R) := by sorry

/-- Unit test `fibre_zero` (degenerate): If all cohomology modules vanish, total cohomology is the zero module. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (hz : ∀ i, (H i).obj A ≅ ModuleCat.of R PUnit) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R PUnit) := by sorry

/-- Unit test `fibre_existing_module` (compatibility): For finitely supported
finite projective cohomology, projectivity uses the existing Module.Projective predicate. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S]
    (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (degrees : Finset ℤ)
    (hzero : ∀ i, i ∉ degrees → Subsingleton ((H i).obj A))
    (hfinite : ∀ i ∈ degrees, Module.Finite R ((H i).obj A))
    (hprojective : ∀ i ∈ degrees, Module.Projective R ((H i).obj A)) :
    Module.Projective R ((satakeFibre R S H).obj A) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram
The two-step Hecke stack has maps a:Hck×^{L⁺G}Hck→Hck×Hck (an L⁺G-torsor) and b to Hck (composition of modifications). On bounded support b is ind-proper with proper finite bounds. Define A⋆B=Rb_*a*(A⊠B), equivalently Rb_! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.
Prototype boundary: The input functors must arise from the bounded torsor correspondence. Their properness, external derived tensor, support bounds, coherent correspondence composition, and unit-kernel identifications are omitted. The arbitrary input symbols are functors, not proposition placeholders. -/
def heckeConvolution (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) : D ⥤ D ⥤ D :=
  by sorry

/-- API: A⋆B is b-star of a-pullback of the derived external product of A and B, with b proper on the chosen bounds. -/
theorem heckeConvolution_obj (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (A B : D) : ((heckeConvolution D DP DC box astar bstar).obj A).obj B = bstar.obj (astar.obj ((box.obj A).obj B)) := by sorry

/-- API: The coherent correspondence calculus supplies the associator for convolution. -/
def heckeConvolution_associator (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (A B C : D) : ((heckeConvolution D DP DC box astar bstar).obj (((heckeConvolution D DP DC box astar bstar).obj A).obj B)).obj C ≅ ((heckeConvolution D DP DC box astar bstar).obj A).obj (((heckeConvolution D DP DC box astar bstar).obj B).obj C) := by sorry

/-- API: The unit is the identity-modification kernel and its left and right unit maps are isomorphisms. -/
theorem heckeConvolution_unit (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (unit A : D) : Nonempty (((heckeConvolution D DP DC box astar bstar).obj unit).obj A ≅ A) ∧ Nonempty (((heckeConvolution D DP DC box astar bstar).obj A).obj unit ≅ A) := by sorry

/-- API: On a torus, convolution support is the Minkowski sum of the two finite coweight supports. -/
def torusConvolutionLabels (A B : Set ℤ) : Set ℤ := by sorry

/-- Unit test `convolution_unit` (degenerate): Convolving with the identity kernel returns the other kernel. -/
-- Omitted: unit is the identity-modification kernel of this geometric correspondence.
example (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC]
    (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (unit A : D) :
    ((heckeConvolution D DP DC box astar bstar).obj unit).obj A ≅ A := by sorry

/-- Unit test `convolution_torus_labels` (computation): For a torus, two skyscraper labels convolve to the skyscraper at their sum. -/
example (lam μ : ℤ) : torusConvolutionLabels {lam} {μ} = {lam+μ} := by sorry

/-- Unit test `convolution_twisted_diagram` (compatibility): The typed object formula keeps both a-star descent and b-star pushforward; substituting the external product alone does not satisfy it. -/
example (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (A B : D) : ((heckeConvolution D DP DC box astar bstar).obj A).obj B = bstar.obj (astar.obj ((box.obj A).obj B)) := by sorry

/-- API: Split kernel lifting in FS VI.7.10, including preservation of its universal cone.
Omitted geometric condition: S is the flat-perverse ULA Satake category, and H
is its geometric cohomology. An arbitrary additive category need not have this kernel. -/
theorem satakeFibre_kernel (R : Type u) [CommRing R] (S : Type u)
    [Category.{v} S] [Preadditive S] (H : ℤ → S ⥤ ModuleCat.{u} R)
    [∀ i : ℤ, (H i).Additive] (A B : S) (f : A ⟶ B)
    [IsSplitMono (kernel.ι ((satakeFibre R S H).map f))] :
    HasKernel f ∧ PreservesLimit (parallelPair f 0) (satakeFibre R S H) := by sorry

/-- API: Split cokernel lifting in FS VI.7.10, including preservation of its universal cocone.
Omitted geometric condition: S is the flat-perverse ULA Satake category, and H
is its geometric cohomology. An arbitrary additive category need not have this cokernel. -/
theorem satakeFibre_cokernel (R : Type u) [CommRing R] (S : Type u)
    [Category.{v} S] [Preadditive S] (H : ℤ → S ⥤ ModuleCat.{u} R)
    [∀ i : ℤ, (H i).Additive] (A B : S) (f : A ⟶ B)
    [IsSplitEpi (cokernel.π ((satakeFibre R S H).map f))] :
    HasCokernel f ∧ PreservesColimit (parallelPair f 0) (satakeFibre R S H) := by sorry

/-- Unit test `fibre_unbounded_nonexample` (non-example): One finite projective module
in each degree does not give finite total cohomology. -/
example : ¬ Module.Finite ℚ (ℤ →₀ ℚ) := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change
For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{|I|}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.
Prototype boundary: The typed coweight core adds labels at collisions; divisor-completion base change and disjoint-product v-sheaf isomorphisms need RF2. -/
theorem orderedLegCollision {n : ℕ} (a b : Fin n → ℤ) : (fun i => a i + b i) = a + b := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent
For finite Galois E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.
Prototype boundary: Only isomorphism detection is typed. Effective Galois descent and split orbit-bound data are omitted. -/
theorem genericGaloisDescent (D Dsplit : Type u) [Category.{v} D] [Category.{v} Dsplit] (restriction : D ⥤ Dsplit) (A B : D) (f : A ⟶ B) [IsIso (restriction.map f)] : IsIso f := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor
Planned declaration: TauCeti.GeometricSatake.etaleOverDivisor.

For S perfectoid over F_q, S → Div^d_𝒴, its effective Cartier divisor D_S,
and a separated étale adic map D′ → D_S, there is a perfectoid S′ and a
separated étale S′ → S representing T ↦ Hom_{D_S}(D_T, D′). Thus
Hom_S(T, S′) ≃ Hom_{D_S}(D_T, D′), naturally in perfectoid T → S.
Integral O_E-untilts, including special-characteristic legs, are allowed;
repeated legs keep their Cartier multiplicities. No G or ℓ is required.

PROTOCOL §13 omission: the named declaration above is intentionally omitted
pending the actual perfectoid/adic category, Cartier-divisor pullback,
separated-étale and representing-functor carriers. Its missing hypotheses
and conclusion are precisely those in the preceding paragraphs. Neither a
placeholder Prop nor an arbitrary equivalence between types is substituted.
Mathematical checks: D′ = D_S represents S; D′ empty represents empty for
d > 0 and S for d = 0; over a geometric base with r distinct support points,
n labelled copies of D_S have n^r lifts, independent of multiplicities.
Source: FS, Lemma VI.1.13, printed/PDF p. 196.
-/

/-! GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops
For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Separated étale maps Z′→Z give representable separated étale maps T_{Z′}→T_Z; open immersions give open immersions.
Prototype boundary: Only the degree-times-relative-dimension arithmetic is typed; representability, partial properness and ℓ-cohomological smoothness are missing supplier notions. -/
theorem smoothSchemeLoopDimension (d n : ℕ) : d*n = n*d := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces
L⁺_mG=ker(L⁺G→G(B⁺/I^m)), m≥1, has successive quotients Lie(G)⊗_{O_E}I^m/I^{m+1}. For degree d these are vector-group diamonds of ℓ-dimension d·dim G. The reduction L⁺G/L⁺_1G is the functor of maps D_S→G; in degree one it is G^⋄. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.
Prototype boundary: The group kernel is concrete. The Lie/Cartier-line graded-piece isomorphism and finite-quotient smoothness require RG/RF/DSO interfaces. -/
theorem congruenceFiltration (G H : Type u) [Group G] [Group H] (reduction : G →* H) (g : G) : g ∈ reduction.ker ↔ reduction g = 1 := by sorry

/-! GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness
Gr_{G,μ} is ℓ-cohomologically smooth of dimension ⟨2ρ,μ⟩ over the degree-one divisor base. Its stabilizer in L⁺G reduces to P⁻_μ (weights ≤0); the m-th graded piece consists of Lie weights ≤m. The quotient maps to (G/P⁻_μ)^⋄ with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.
Prototype boundary: Only the GL₂ root-pairing core is typed; cell stabilization and cohomological smoothness are not a predicate placeholder. -/
theorem schubertCellDimension (a b : ℤ) (h : b ≤ a) : 0 ≤ a-b := by sorry

/-! GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action
If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. Thus the action factors through L^{+,<m}G. The comparison of equivariant derived categories is the later GS1/prounipotent-equivariance theorem, with its filtered continuity and prime-to-p coefficient hypotheses.
Prototype boundary: K must be the specified deep congruence subgroup on the specified bound; those absent geometric hypotheses are omitted. -/
theorem boundedLoopActionTrivial (G X : Type u) [Group G] [MulAction G X] (K : Subgroup G) (x : X) (g : K) : (g : G) • x = x := by sorry

/-! GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula
If μ has Lie weights in {−1,0,1}, the Bialynicki–Birula map Gr_μ→(G/P⁻_μ)^⋄ is an isomorphism. In GL_n it sends a B⁺_dR-lattice Λ to the ascending filtration Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ). CS uses μ(ξ^{-1}); matching FS uses inversion of the coweight or of the chosen parabolic convention.
Prototype boundary: Cell/Flag must be the minuscule Grassmannian and its flag functor; the geometric minuscule hypotheses are omitted. -/
def minusculeBialynickiBirula (Cell Flag : Type u) : Cell ≃ Flag := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space
Each Gr̄_N and hence each bounded GL_n Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive G a faithful representation with quasi-affine quotient gives a locally closed embedding into the GL_n Grassmannian; an affine quotient gives a closed embedding.
Prototype boundary: Presentation must be Zhu's smooth determinant-jet cover. The quotient algebraic-space carrier is not available and is omitted; this signature asserts only the cover's affineness. -/
theorem zhuBoundPresentation (Presentation : AlgebraicGeometry.Scheme.{u}) : AlgebraicGeometry.IsAffine Presentation := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres
The fibres of Gr̃_lam→Gr_{≤lam} are geometrically connected and have RΓ(O)=k at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full ω₁-chain resolution of Gr̄_N every lower-type fibre has positive dimension.
Prototype boundary: X/Y/f must be the Witt resolution and bound; perfect structure-sheaf cohomology is omitted. -/
theorem wittResolutionConnectedFibres (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) (y : Y) : IsConnected (f ⁻¹' {y}) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion
Apply the supplier’s v-descent for finite/formal Witt bundles and its proper pfp connected-fibre criterion to Gr̃_lam→Gr_{≤lam}. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger Rψ_*O=O criterion applies to the same resolution and commutes with base change.
Prototype boundary: Only the line-bundle full-faithfulness core is typed; effective fibre-trivial descent and proper pfp hypotheses belong to SF. -/
theorem wittFibralDescent (X Y : AlgebraicGeometry.Scheme.{u}) (pull : TauCeti.AlgebraicGeometry.InvertibleSheaf X ⥤ TauCeti.AlgebraicGeometry.InvertibleSheaf Y) : pull.Faithful := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity
On Gr̃_lam, ⊗det(Q_i/Q_{i+1})^{a_i} is ample for a₀≫a₁≫⋯>0. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in Gr_{≤lam}; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.
Prototype boundary: degree must be the determinant degree on a nonconstant proper curve in the specified bound. The missing curve/intersection API and hypotheses are omitted. -/
theorem determinantCurveDegree (degree : ℤ) : 0 < degree := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel
For every dominant positive λ, Gr_{≤λ} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.
Prototype boundary: Only scheme properness is typed; X/f must be the finite model of the bound over the base field. Projectivity/ample line notions are imported from SF5 and omitted. -/
theorem wittProjectiveBound (X Y : AlgebraicGeometry.Scheme.{u}) (f : X ⟶ Y) : AlgebraicGeometry.IsProper f := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison
For the bounded Witt schemes/algebraic spaces, import compatible finite-type models up to Frobenius, dimension and fibre-product compatibility and étale-topos equivalence from SF0/SF1. Apply those general results to identify their scheme diamondification with the characteristic-p fibre of the integral Grassmannian, by equality of the lattice/torsor functors. This node owns the Witt comparison application; SF owns the general model and perfection theory.
Prototype boundary: These categories must be the specified étale categories of a perfect Witt bound and its scheme diamond; supplier geometry is omitted. -/
def wittEtaleComparison (Dscheme Ddiamond : Type u) [Category.{v} Dscheme] [Category.{v} Ddiamond] : Dscheme ≌ Ddiamond := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness
The integral BD Grassmannian over Spd O_E (or Div^d_𝒴) interpolates between the generic B⁺_dR Grassmannian and the v-sheaf of the Witt Grassmannian. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.
Prototype boundary: Only the two functor-of-points fibre identifications are typed; the diamond base change and proper bounds are omitted. -/
def integralWittGenericComparison (Integral Generic Special : Type u) (genericFibre : Set Integral) (specialFibre : Set Integral) : (genericFibre ≃ Generic) × (specialFibre ≃ Special) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity
For a smooth affine O_E-model 𝓖 of a reductive generic fibre, the Witt affine Grassmannian is an ind-pfp perfect space with locally closed embedding into a GL_n Grassmannian and ind-quasiprojective bounds. If 𝓖 is parahoric its bounds are projective. Over k̄ its components are π₁(G)_I via Kottwitz, with residual Frobenius action retained. For an Iwahori, Schubert cells have dimension ℓ(w), closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected P¹-bundles.
Prototype boundary: Only the Kottwitz label equivalence is typed, with geometric inertia coinvariants rather than full Galois coinvariants. Model representability and properness are omitted. -/
def parahoricGeometricComponents (Components Coinvariants : Type u) : Components ≃ Coinvariants := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness
If 𝓖° is parahoric, Gr_{𝓖,Spd O_E} is an increasing union of closed proper subfunctors. A closed representation 𝓖→GL_n induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing 𝓖 by 𝓖°, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.
Prototype boundary: Only topological properness is typed; spaces/map must be a closed parahoric bound over the integral base. Spatial-diamond representability is omitted. -/
theorem integralParahoricProperBounds (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) (K : Set Y) (hK : IsCompact K) : IsCompact (f ⁻¹' K) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart
For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [λ]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.
Prototype boundary: Only the closed-orbit equation and a finite-ring regression are typed. The perfect cone open immersion and the corrected truncated-Witt/jet-torsor interface remain a gap. The adjugate argument proves right-factor integrality; it does not make the factor unique or independent of the chosen lift. -/
theorem rankTwoConeClosedOrbit (K : Type u) [CommRing K] : (0 : K)^2 - 0*0 = 0 := by sorry

/-- Unit test `rank_two_right_factor_not_unique` (non-example): the truncated right
factor has a stabilizer even at the closed orbit. This finite-ring calculation
models W₃(F₃); it does not supply a Witt-ring comparison theorem or the cone chart. -/
example :
    let A : Matrix (Fin 2) (Fin 2) (ZMod 27) := !![3, 0; 0, 3]
    let g : Matrix (Fin 2) (Fin 2) (ZMod 27) := !![1, 9; 0, 1]
    A * g = A ∧ Matrix.det g = 1 ∧ g ≠ 1 := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds
For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.
Prototype boundary: The modules/map must be determinant global sections and restriction to the specified proper bound. Serre vanishing/Frobenius section-colimit hypotheses are omitted. -/
theorem determinantSectionsRestriction (R : Type u) [CommRing R] (Global Bound : ModuleCat.{u} R) (restrict : Global →ₗ[R] Bound) : Function.Surjective restrict := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres
If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}|_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.
Prototype boundary: Only the ordinary-product length/dimension inequality is typed; the bounded nonempty geometric fibre and length interpretations are omitted. The Demazure-product factor differs and is stated in the document. -/
theorem flagConvolutionFibreBound (lu lv luv dimFibre : ℕ) : lu + lv ≤ 2*dimFibre + luv := by sorry

/-! GeometricSatakeAndFusion:GS1/semi-infinite-affineness
On the Witt special fibre, S_λ∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of the ample determinant line on the closed weight-bound union. When nonempty, this bounded intersection is equidimensional of dimension ⟨ρ,μ+λ⟩; the same holds for its nonempty open intersection with the exact μ-cell. Neither dimension formula is asserted for an empty intersection.
Prototype boundary: X must be the specified bounded semi-infinite intersection on its pfp model. Affineness also holds for the empty intersection; nonemptiness is required only for the dimension equality. General perfect-space affineness requires the SF model interface. -/
theorem semiInfiniteBoundAffine (X : AlgebraicGeometry.Scheme.{u}) : AlgebraicGeometry.IsAffine X := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles
For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_lam∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,lam⟩}(S_lam,IC_μ). The intersection dimension is ⟨ρ,μ+lam⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+lam⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.
Prototype boundary: Only the normalized dimension equality is typed; the nonempty Schubert/semi-infinite intersection, MV components and rational trace model are omitted. -/
theorem mvCycleDimension (dimension rhoPairing : ℤ) : dimension = rhoPairing := by sorry

/-! GeometricSatakeAndFusion:GS1/prounipotent-equivariance
Let H be a group small v-sheaf over S with closed congruence subgroups H^{≥m}, complete separated filtered presentation, and, v-locally on S, finite filtrations of each successive quotient by affine-line diamonds of untilts. If the action on X factors through H^{<m}=H/H^{≥m}, m>0, pullback D_ét(H^{<m}\X,Λ)→D_ét(H\X,Λ) is an equivalence for coefficients killed by an integer prime to p. Consequently the deep congruence kernel adds no equivariance data. H itself need not have a finite filtration.
Prototype boundary: D/DEq are the actual finite-quotient and full filtered-equivariant derived categories. The closed filtration, factorized action, spatial continuity and prime-to-p coefficient hypotheses are supplied by VS1 and omitted from this equivalence signature. -/
def prounipotentEquivariance (D DEq : Type u) [Category.{v} D] [Category.{v} DEq] : D ≌ DEq := by sorry

/-! GeometricSatakeAndFusion:GS1/constant-term-conservativity
For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.
Prototype boundary: CT must be the geometric torus constant term on the bounded-support category; its geometric hypotheses are omitted. -/
theorem constantTermConservative (D DT : Type u) [Category.{v} D] [Category.{v} DT] (CT : D ⥤ DT) (A B : D) (f : A ⟶ B) [IsIso (CT.map f)] : IsIso f := by sorry

/-! GeometricSatakeAndFusion:GS1/ula-constant-term-criterion
For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.
Prototype boundary: The typed coefficient core states that a geometric CT stalk admits a bounded cochain model of finite projective terms representing that derived object. Those terms are a strict perfect model, not the individual cohomology modules. The identification with the actual CT stalk, étale local constancy and ULA hypotheses require the supplied sheaf carriers and are omitted. -/
theorem ulaConstantTermPerfect (R : Type u) [CommRing R]
    [HasDerivedCategory.{w} (ModuleCat.{u} R)]
    (CTstalk : DerivedCategory (ModuleCat.{u} R)) :
    ∃ K : CochainComplex (ModuleCat.{u} R) ℤ,
      Nonempty ((DerivedCategory.Q (C := ModuleCat.{u} R)).obj K ≅ CTstalk) ∧
      (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → IsZero (K.X i)) ∧
      (∀ i : ℤ, Module.Finite R (K.X i) ∧ Module.Projective R (K.X i)) := by sorry

/-- Unit test `perfect_complex_cohomology_not_projective` (non-example):
The two-term perfect complex R --2--> R for R=ℤ/4 has cohomology R/(2),
which is not projective. ULA does not imply projective cohomology. -/
example : ¬ Module.Projective (ZMod 4)
    ((ZMod 4) ⧸ Ideal.span ({2} : Set (ZMod 4))) := by sorry

/-! GeometricSatakeAndFusion:GS1/integral-family-comparison
For a split integral model and one leg, restriction induces equivalences D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ), compatible with finite Schubert bounds and coefficient change. The special side is identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.
Prototype boundary: The supplied categories must be the one-leg ULA categories with compatible finite supports. Arbitrary multi-leg collisions are excluded in the document. -/
def oneLegULAComparison (Dintegral Dgeneric Dspecial : Type u) [Category.{v} Dintegral] [Category.{v} Dgeneric] [Category.{v} Dspecial] : (Dintegral ≌ Dgeneric) × (Dintegral ≌ Dspecial) := by sorry

/-! GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct
Pullback of perverse Hecke objects to Gr is fully faithful. For A≤0 and B≥0 the derived Hom is connective. Shifted CT_B[deg⟨2ρ,−⟩] is t-exact and conservative, and the relative t-structure commutes with base change.
Prototype boundary: CT must include the root-degree shift, and D the geometric ULA category. Smooth finite-jet stack descent and that identification are omitted. -/
theorem perverseConstantTermExact (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (DT : Type u) [Category.{v} DT] [Preadditive DT] [HasZeroObject DT] [HasShift DT ℤ] [∀ n : ℤ, (shiftFunctor DT n).Additive] [Pretriangulated DT] (CT : D ⥤ DT) (t : Triangulated.TStructure D) (tT : Triangulated.TStructure DT) (A : D) : t.heart A ↔ tT.heart (CT.obj A) := by sorry

/-! GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound
For fixed μ, Δ_μ→∇_μ is an isomorphism after rationalization, and over Z_ℓ its kernel and cokernel are killed by some ℓ^a uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple IC_μ indexed by dominant coweights and constant equivariant local systems.
Prototype boundary: R is explicitly a ℤ_ℓ-algebra, ℓ is prime, and the bound is ℓ^a. M must be the specified standard-to-costandard kernel or cokernel. The source supplies one a(μ) independent of R; this single-module core omits the geometric μ/family identification, not the coefficient algebra or the nonvacuous power bound. -/
theorem standardCostandardBoundedTorsion (ℓ : ℕ) [Fact ℓ.Prime]
    (R : Type u) [CommRing R] [Algebra ℤ_[ℓ] R] (M : ModuleCat.{u} R) :
    ∃ a : ℕ, ∀ x : M, (ℓ^a : R) • x = 0 := by sorry

/-! GeometricSatakeAndFusion:GS1/rational-weight-concentration
For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_λ,A)=0 unless i=⟨2ρ,λ⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple coroots of G in the Weyl orbit of the quasi-minuscule coweight (the short simple coroots); equivalently count the corresponding simple roots of the dual root system. General concentration follows by generation from minimal convolutions.
Prototype boundary: W must be the concentrated rational weight module of the specified IC object. Its MV basis and the degree-vanishing assertions require enhanced cohomology interfaces and are omitted. -/
theorem rationalWeightsFinite (K : Type u) [Field K] (W : ModuleCat.{u} K) : Module.Finite K W := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality
Relative Verdier duality preserves Satake, the biduality map A→D(D(A)) is an isomorphism, and F(D(A)) identifies with the Λ-linear dual of F(A). Normalized Levi constant terms CT_P[deg⟨2ρ_G−2ρ_M,−⟩] preserve Satake and are transitive for nested Levis.
Prototype boundary: S must be Satake and dual the relative Verdier duality. Levi normalization and geometric coefficient hypotheses are omitted. -/
theorem satakeVerdierBiduality (S : Type u) [Category.{v} S] (dual : Sᵒᵖ ⥤ S) (A : S) : Nonempty (dual.obj (Opposite.op (dual.obj (Opposite.op A))) ≅ A) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit
Iterated composition supplies associator (A⋆B)⋆C≅A⋆(B⋆C), left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.
Prototype boundary: Only the standard monoidal pentagon is typed; the ambient convolution monoidal instance must be supplied by the enhanced correspondence calculus. -/
theorem convolutionPentagon (S : Type u) [Category.{v} S] [MonoidalCategory S] (A B C D : S) : (α_ (A ⊗ B) C D).hom ≫ (α_ A B (C ⊗ D)).hom = ((α_ A B C).hom ▷ D) ≫ (α_ A (B ⊗ C) D).hom ≫ (A ◁ (α_ B C D).hom) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution
On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with Gr^n by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to Gr_{≤Σμ_i} is proper and stratified semismall: over the lam-stratum fibre dimension is ≤⟨ρ,Σμ_i−lam⟩. Hence twisted convolution of rational equivariant perverse sheaves is perverse.
Prototype boundary: These dimensions must come from the bounded rational Witt convolution map and a target stratum. Properness and coefficient restrictions are omitted. -/
theorem rationalConvolutionSemismall (sourceDimension stratumDimension fibreDimension : ℕ) : 2*fibreDimension + stratumDimension ≤ sourceDimension := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula
If A and B are ULA bounded Hecke complexes, A⋆B is ULA over the leg base.
Prototype boundary: The algebraic core composes two individually right-dualizable proper relative ULA kernels. It does not assume the entire ambient category is rigid; the geometric ULA/kernel identification requires VS1. -/
@[instance_reducible] def convolutionULAKernelDual (D : Type u) [Category.{v} D] [MonoidalCategory D] (A B : D) [HasRightDual A] [HasRightDual B] : HasRightDual (A ⊗ B) := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive
For any bounded Hecke complexes A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. First reduce by ordered collision-stratum excision and cell devissage to shifted cell constants with ULA factors. For those generators an elementary two-leg family is an external product away from the diagonal; locally constant perfect torus constant terms carry the nonpositive bound to the collision fibre. This is FS VI.8.1(ii), before VI.9 symmetric fusion.
Prototype boundary: D/conv denote the full bounded-support Hecke derived category and its convolution, with the stated geometric perverse t-structure. The devissage, two-leg family and geometric identities are omitted. Inputs need not be ULA; only the reduced generators are ULA. GS3 fusion and ambient rigidity are not assumed. -/
theorem convolutionPerverseNonpositive (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (conv : D ⥤ D ⥤ D) (A B : D) (hA : t.le 0 A) (hB : t.le 0 B) : t.le 0 ((conv.obj A).obj B) := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability
Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.
Prototype boundary: D/conv/tensor must be the ULA Hecke category, geometric convolution and derived coefficient tensors. Those supplier conditions are omitted. -/
theorem convolutionFlatPerverse (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (conv : D ⥤ D ⥤ D) (A B : D) (hA : flatPerverse R D t tensor A) (hB : flatPerverse R D t tensor B) : flatPerverse R D t tensor ((conv.obj A).obj B) := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity
Every Satake object has both left and right duals for convolution. The right dual is sw*D(A); evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.
Prototype boundary: S must be the actual Satake category with its convolution structure. Both duals are asserted; the switch-pullback Verdier formula is in the document. -/
@[instance_reducible] def satakeRigid (S : Type u) [Category.{v} S] [MonoidalCategory S] : RigidCategory S := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison
The one-leg ULA restriction equivalence over Spd O_C restricts to equivalences of flat-perverse Satake categories on the generic and Witt special fibres. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.
Prototype boundary: These are the indicated one-leg flat-perverse ULA categories; the base change geometry and diagram compatibility are omitted. -/
def oneLegSatakeComparison (Sgeneric Sspecial : Type u) [Category.{v} Sgeneric] [Category.{v} Sspecial] : Sgeneric ≌ Sspecial := by sorry

end LayersGS0toGS2

/-! ## Layers GS3–GS4: fusion, reconstruction and the dual group -/

section LayersGS3toGS4

open CategoryTheory MonoidalCategory
open scoped TensorProduct

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
-- Their canonical comparison is induced by collisionFunctor_comp. The
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
-- torus and its Frobenius preimages (source issue E32). The modular Hom
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

end LayersGS3toGS4

end TauCeti.GeometricSatake
