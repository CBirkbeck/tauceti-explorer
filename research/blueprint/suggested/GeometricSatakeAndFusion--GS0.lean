/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeometricSatakeAndFusion--GS0.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. They claim no implementation; implementationStatus is
unchecked throughout. Proofs and unfinished constructions use `sorry`.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This is a typed prototype at the imported algebraic and categorical cores.
The comments attached to each construction identify missing geometric
conditions: completed rings, diamonds, geometric group actions, enhanced ULA
kernels and perfect finite-type models belong to supplier roadmaps. Conditions
that cannot yet be stated are omitted, never replaced by unknown Prop fields.
Consequently several signatures deliberately have more general inputs than
the mathematical statements in the definitive document. These signatures are
not standalone assertions about arbitrary schemes, functors or categories.

Only the first part (GS0, GS1, GS2) is in scope. The symmetric fusion structure,
tensor fibre comparison and dual-group reconstruction belong to part GS3.
-/
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.FieldTheory.Perfect
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
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
import TauCeti.AlgebraicGeometry.LineBundle.Basic

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped MonoidalCategory ZeroObject
set_option autoImplicit false
open scoped TensorProduct DirectSum
universe u v w
namespace TauCeti.Suggested.GeometricSatake

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
example (h : PUnit × PUnit) : h.1 = h.2 := by sorry

/-- Unit test `hecke_identity_automorphisms` (non-example): For the subgroup of all integer additive units encoded multiplicatively, the identity modification retains nontrivial diagonal automorphisms; the quotient is not the orbit set. -/
example (G : Type u) [Group G] (H : Subgroup G) (h : H) : @SMul.smul (H × H) G (localHeckeAction G H).toSMul (h,h) 1 = 1 := by sorry

/-- Unit test `hecke_double_action` (computation): For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse. -/
example (G : Type u) [Group G] (h : (⊤ : Subgroup G)) : @SMul.smul (((⊤ : Subgroup G)) × ((⊤ : Subgroup G))) G (localHeckeAction G ⊤).toSMul (h,1) 1 = (h : G) := by sorry

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
For Q of type ≤lam, Dem_lam(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_lam(i). The global resolution Gr̃_lam classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤lam}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.
Prototype boundary: The submodule-chain core omits prescribed locally free quotient ranks, annihilation by p, perfect-scheme representability and its lattice map. These conditions are written in the packet, not replaced by unknown proposition fields. -/
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
example (X : AlgebraicGeometry.Scheme.{u}) (lam : List ℕ) : TauCeti.AlgebraicGeometry.InvertibleSheaf X := by sorry

/-- Unit test `determinant_quotient_sign` (computation): On a one-step quotient Grassmannian, the descended line pulls back to the graded quotient determinant; its sign is the quotient sign. -/
example (X : AlgebraicGeometry.Scheme.{u}) (oneStepDet : TauCeti.AlgebraicGeometry.InvertibleSheaf X) : Nonempty (geometricDeterminantLine X [1] ≅ oneStepDet) := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models
For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.
Prototype boundary: Finite-type, normalization, model perfection and Frobenius-twisted transition conditions are supplied by SF0/SF1. The typed target carrier and morphisms omit those conditions. The sketch-only Dieudonné comparison is a recorded gap; Conjecture III is not a theorem. -/
def canonicalWittModel (n N h : ℕ) : AlgebraicGeometry.Scheme.{u} :=
  by sorry

/-- API: A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist. -/
def canonicalWittModel_transition (n N h h' : ℕ) (hh : N < h) (hh' : h ≤ h') : canonicalWittModel.{u} n N h' ⟶ canonicalWittModel n N h := by sorry

/-- API: The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection. -/
theorem canonicalWittModel_normalized_quotient (n N h : ℕ) (normalizedJetQuotient : AlgebraicGeometry.Scheme.{u}) : Nonempty (canonicalWittModel n N h ≅ normalizedJetQuotient) := by sorry

/-- API: Its scheme perfection is the specified Witt Schubert bound. -/
theorem canonicalWittModel_perfection (n N h : ℕ) (perf : AlgebraicGeometry.Scheme.{u} ⥤ AlgebraicGeometry.Scheme.{u}) (bound : AlgebraicGeometry.Scheme.{u}) : Nonempty (perf.obj (canonicalWittModel n N h) ≅ bound) := by sorry

/-- Unit test `canonical_model_zero` (degenerate): The N=0 canonical bound agrees with its point model. -/
example (n h : ℕ) (point : AlgebraicGeometry.Scheme.{u}) : Nonempty (canonicalWittModel.{u} n 0 h ≅ point) := by sorry

/-- Unit test `canonical_model_not_choice` (non-example): The comparison fixes the normalized quotient model; sharing a perfection does not specify the canonical model. -/
example (n N h : ℕ) (quotient : AlgebraicGeometry.Scheme.{u}) : Nonempty (canonicalWittModel n N h ≅ quotient) := by sorry

/-- Unit test `canonical_model_existing_scheme` (compatibility): The canonical model is an ordinary Mathlib Scheme, not a newly invented perfect-scheme carrier. -/
example (n N h : ℕ) : AlgebraicGeometry.Scheme.{u} := by sorry

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
example (R : Type u) [CommRing R] (M M₀ : ModuleCat.{u} R) : ModuleCat.{u} R := by sorry

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

/-! GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization
For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel the geometric strata are S_lam=L U·lam(ξ), and the union of strata with cocenter weight ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.
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

/-- Unit test `standard_zero_cell` (degenerate): For a point cell with identity inclusions the pair is the same constant object. -/
example (D : Type u) [Category.{v} D] [HasShift D ℤ] (A : D) : standardCostandard D D (𝟭 D) (𝟭 D) (𝟭 D) A 0 = (A,A) := by sorry

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
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) : ((ObjectProperty.ι ((fun A : DU => flatPerverse R D t tensor (forgetULA.obj A)) : ObjectProperty DU))).Faithful := by sorry

/-- Unit test `satake_wrong_degree` (non-example): A ULA object outside the relative perverse heart is excluded from Satake. -/
example (R : Type u) [CommRing R] (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ] [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] (t : Triangulated.TStructure D) (tensor : ModuleCat.{u} R → D ⥤ D) (DU : Type u) [Category.{v} DU] (forgetULA : DU ⥤ D) (A : DU) (h : ¬ t.heart (forgetULA.obj A)) : ¬ flatPerverse R D t tensor (forgetULA.obj A) := by sorry

/-! GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor
F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification.
Prototype boundary: S must be the actual Satake category and H the geometric cohomology functors. Finite support in degree and the CT filtration hypotheses are omitted from the finite-projectivity/faithfulness signatures. No canonical splitting or tensor identification is stated. -/
def satakeFibre (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) : S ⥤ ModuleCat.{u} R :=
  by sorry

/-- API: The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero. -/
theorem satakeFibre_cohomology (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R (⨁ i : ℤ, (H i).obj A)) := by sorry

/-- API: The total cohomology module is finite and projective over the coefficient ring. -/
theorem satakeFibre_finite_projective (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) : Module.Finite R ((satakeFibre R S H).obj A) ∧ Module.Projective R ((satakeFibre R S H).obj A) := by sorry

/-- API: Conservative exact constant terms imply that total cohomology is a faithful functor on Satake. -/
theorem satakeFibre_faithful (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) : (satakeFibre R S H).Faithful := by sorry

/-- Unit test `fibre_torus_rank_one` (computation): A torus skyscraper with one rank-one cohomology module has total cohomology R. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (j : ℤ) (hj : (H j).obj A ≅ ModuleCat.of R R) (hz : ∀ i, i ≠ j → (H i).obj A ≅ ModuleCat.of R PUnit) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R R) := by sorry

/-- Unit test `fibre_zero` (degenerate): If all cohomology modules vanish, total cohomology is the zero module. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) (hz : ∀ i, (H i).obj A ≅ ModuleCat.of R PUnit) : Nonempty ((satakeFibre R S H).obj A ≅ ModuleCat.of R PUnit) := by sorry

/-- Unit test `fibre_existing_module` (compatibility): The fibre functor targets existing ModuleCat, and projectivity is the existing Module.Projective predicate. -/
example (R : Type u) [CommRing R] (S : Type u) [Category.{v} S] (H : ℤ → S ⥤ ModuleCat.{u} R) (A : S) : Module.Projective R ((satakeFibre R S H).obj A) := by sorry

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
example (D : Type u) [Category.{v} D] [MonoidalCategory D] (A : D) : (𝟙_ D) ⊗ A ≅ A := by sorry

/-- Unit test `convolution_torus_labels` (computation): For a torus, two skyscraper labels convolve to the skyscraper at their sum. -/
example (lam μ : ℤ) : torusConvolutionLabels {lam} {μ} = {lam+μ} := by sorry

/-- Unit test `convolution_twisted_diagram` (compatibility): The typed object formula keeps both a-star descent and b-star pushforward; substituting the external product alone does not satisfy it. -/
example (D DP DC : Type u) [Category.{v} D] [Category.{v} DP] [Category.{v} DC] (box : D ⥤ D ⥤ DP) (astar : DP ⥤ DC) (bstar : DC ⥤ D) (A B : D) : ((heckeConvolution D DP DC box astar bstar).obj A).obj B = bstar.obj (astar.obj ((box.obj A).obj B)) := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change
For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{|I|}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.
Prototype boundary: The typed coweight core adds labels at collisions; divisor-completion base change and disjoint-product v-sheaf isomorphisms need RF2. -/
theorem orderedLegCollision {n : ℕ} (a b : Fin n → ℤ) : (fun i => a i + b i) = a + b := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent
For finite E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.
Prototype boundary: Only isomorphism detection is typed. Effective Galois descent and split orbit-bound data are omitted. -/
theorem genericGaloisDescent (D Dsplit : Type u) [Category.{v} D] [Category.{v} Dsplit] (restriction : D ⥤ Dsplit) (A B : D) (f : A ⟶ B) [IsIso (restriction.map f)] : IsIso f := by sorry

/-! GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops
For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Étale maps to Z give representable étale maps of these functors.
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
If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. The action and equivariant complexes on the bound therefore factor through L^{+,<m}G.
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
For every dominant positive lam, Gr_{≤lam} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.
Prototype boundary: Only scheme properness is typed; X/f must be the finite model of the bound over the base field. Projectivity/ample line notions are imported from SF5 and omitted. -/
theorem wittProjectiveBound (X Y : AlgebraicGeometry.Scheme.{u}) (f : X ⟶ Y) : AlgebraicGeometry.IsProper f := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison
Pass from each pfp perfect bounded scheme or algebraic space to compatible finite-type models up to Frobenius. Perfection preserves fibre products and underlying topological dimension, and induces an equivalence of étale topoi. The associated v-sheaf maps by scheme diamondification to the special fibre of the integral Grassmannian.
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
For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [lam]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.
Prototype boundary: Only the closed-orbit equation is typed. The perfect cone open immersion and the corrected W₃ right-factor integrality are recorded separately as a gap. -/
theorem rankTwoConeClosedOrbit (K : Type u) [CommRing K] : (0 : K)^2 - 0*0 = 0 := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds
For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.
Prototype boundary: The modules/map must be determinant global sections and restriction to the specified proper bound. Serre vanishing/Frobenius section-colimit hypotheses are omitted. -/
theorem determinantSectionsRestriction (R : Type u) [CommRing R] (Global Bound : ModuleCat.{u} R) (restrict : Global →ₗ[R] Bound) : Function.Surjective restrict := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres
If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}|_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.
Prototype boundary: Only the ordinary-product length/dimension inequality is typed; the bounded nonempty geometric fibre and length interpretations are omitted. The Demazure-product factor differs and is stated in the document. -/
theorem flagConvolutionFibreBound (lu lv luv dimFibre : ℕ) : lu + lv ≤ 2*dimFibre + luv := by sorry

/-! GeometricSatakeAndFusion:GS1/semi-infinite-affineness
On the Witt special fibre, S_lam∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of a positive power of the ample determinant line on the appropriate closed weight-bound union. Nonempty intersections with the exact μ-cell are equidimensional of dimension ⟨ρ,μ+lam⟩.
Prototype boundary: X must be the specified nonempty semi-infinite intersection on its pfp model. General perfect-space affineness requires the SF model interface. -/
theorem semiInfiniteBoundAffine (X : AlgebraicGeometry.Scheme.{u}) : AlgebraicGeometry.IsAffine X := by sorry

/-! GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles
For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_lam∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,lam⟩}(S_lam,IC_μ). The intersection dimension is ⟨ρ,μ+lam⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+lam⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.
Prototype boundary: Only the normalized dimension equality is typed; the nonempty Schubert/semi-infinite intersection, MV components and rational trace model are omitted. -/
theorem mvCycleDimension (dimension rhoPairing : ℤ) : dimension = rhoPairing := by sorry

/-! GeometricSatakeAndFusion:GS1/prounipotent-equivariance
For a group with a finite congruence filtration whose graded pieces are affine vector-group diamonds, forgetting equivariance gives an equivalence on bounded constructible derived categories with prime-to-p coefficients. Applied to L⁺_mG on a bounded Schubert locus, sufficiently deep congruence equivariance adds no data.
Prototype boundary: D/DEq must be the supplied bounded complex and prounipotent-equivariant categories. Smoothness and pro-unipotent hypotheses are omitted. -/
def prounipotentEquivariance (D DEq : Type u) [Category.{v} D] [Category.{v} DEq] : D ≌ DEq := by sorry

/-! GeometricSatakeAndFusion:GS1/constant-term-conservativity
For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.
Prototype boundary: CT must be the geometric torus constant term on the bounded-support category; its geometric hypotheses are omitted. -/
theorem constantTermConservative (D DT : Type u) [Category.{v} D] [Category.{v} DT] (CT : D ⥤ DT) (A B : D) (f : A ⟶ B) [IsIso (CT.map f)] : IsIso f := by sorry

/-! GeometricSatakeAndFusion:GS1/ula-constant-term-criterion
For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.
Prototype boundary: Only the locally finite-projective coefficient core is typed; the bounded constant-term perfect complex, étale locality and ULA criterion are omitted. -/
theorem ulaConstantTermPerfect (R : Type u) [CommRing R] (CTcohomology : ModuleCat.{u} R) : Module.Finite R CTcohomology ∧ Module.Projective R CTcohomology := by sorry

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
Prototype boundary: M must be the indicated finite cone cohomology on a fixed bound after rational comparison. Uniformity in coefficients/degree and the geometry are omitted. -/
theorem standardCostandardBoundedTorsion (R : Type u) [CommRing R] (M : ModuleCat.{u} R) : ∃ N : ℕ, ∀ x : M, (N : R) • x = 0 := by sorry

/-! GeometricSatakeAndFusion:GS1/rational-weight-concentration
For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_lam,A)=0 unless i=⟨2ρ,lam⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple roots of the relevant highest-root length. General concentration follows by generation from minimal convolutions.
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
Prototype boundary: The typed core is dualizability of composed proper relative ULA kernels, using the existing rigid-category API; geometric ULA conditions are omitted. -/
@[instance_reducible] def convolutionULAKernelDual (D : Type u) [Category.{v} D] [MonoidalCategory D] [RigidCategory D] (A B : D) : HasRightDual (A ⊗ B) := by sorry

/-! GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive
For ULA A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. The proof uses an elementary two-leg collision family: away from the diagonal it is the external product, and its torus constant terms are locally constant perfect complexes, so the nonpositive bound extends to the collision fibre.
Prototype boundary: D/conv must be the ULA Hecke category and its convolution. The two-leg family and geometric hypotheses are omitted; GS3 fusion is not assumed. -/
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

end TauCeti.Suggested.GeometricSatake
