/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The forms below suggest names and signatures so contributors and reviewers can converge.
Nothing here claims a formalisation of the arithmetic K-theory targets.

All five proposed names are elaborated theorem prototypes. They use existing full
subcategories, nerves, integral simplicial chains, mapping cones, representation homology,
realizations and homotopy groups. The local notation abbreviates these library expressions;
no Q-category, Steinberg module or K-group is defined here.

PROTOCOL §13 permits omission of conditions not yet expressible in the pinned libraries.
The missing specializations and compatibilities are listed at each declaration, and in the
packet and reader. In particular the rank declarations must NOT be used for an arbitrary
category/rank/representation: their omitted supplier identifications are essential.
The packet's mathematical statements, including naturality, remain definitive.
Imported predecessor definitions, APIs and tests stay with their owners.
-/

import Mathlib.AlgebraicTopology.SimplicialSet.Nerve
import Mathlib.AlgebraicTopology.SimplicialSet.Homology.Basic
import Mathlib.AlgebraicTopology.SimplicialSet.TopAdj
import Mathlib.Algebra.Homology.HomotopyCofiber
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.IsomorphismClasses
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.Topology.Homotopy.HomotopyGroup
import Mathlib.Topology.Homotopy.HSpaces
import Mathlib.GroupTheory.Finiteness
import Mathlib.Algebra.DirectSum.Module

import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.RingTheory.Finiteness.Finsupp
import Mathlib.RingTheory.DedekindDomain.SInteger

noncomputable section
open CategoryTheory
open scoped DirectSum Topology
namespace TauCeti.ArithmeticKTheory

-- Existing baseline finiteness vocabulary, not a new definition.
example (M : Type*) [AddCommGroup M] :
    Module.Finite ℤ M ↔ AddGroup.FG M :=
  Module.Finite.iff_addGroup_fg

-- Existing extension step used both in rank induction and localization.
example {M N P : Type*} [AddCommGroup M] [AddCommGroup N] [AddCommGroup P]
    [Module ℤ M] [Module ℤ N] [Module ℤ P]
    (f : M →ₗ[ℤ] N) (g : N →ₗ[ℤ] P)
    (h_exact : Function.Exact f g) (h_surj : Function.Surjective g)
    [Module.Finite ℤ M] [Module.Finite ℤ P] : Module.Finite ℤ N :=
  Module.Finite.of_exact h_exact h_surj

-- The actual arithmetic hypotheses supplied by Mathlib.
example (F : Type*) [Field F] [NumberField F] :
    Finite (ClassGroup (NumberField.RingOfIntegers F)) := by
  infer_instance

example (F : Type*) [Field F] [NumberField F] :
    Monoid.FG (NumberField.RingOfIntegers F)ˣ := by
  infer_instance

-- Finiteness of the actual residue quotient is already a baseline instance.
example (F : Type*) [Field F] [NumberField F]
    (p : Ideal (NumberField.RingOfIntegers F)) [NeZero p] :
    Finite (NumberField.RingOfIntegers F ⧸ p) := by
  infer_instance

-- The existing coefficient homology is a genuine ModuleCat object.
-- This asserts no finiteness of arbitrary representations; St needs its owning supplier.
-- The small universe agrees with the current groupHomology coefficient signature.
example (G : Type) [Group G] (V : Rep.{0, 0, 0} ℤ G) (q : ℕ) : ModuleCat ℤ :=
  groupHomology V q

-- Signed degree diagnostic: below rank m the relative term is zero, not H_0.
-- It checks the inequality convention only, not the unbuilt relative homology theorem.
example (i m : ℕ) (h : i < m) : (i : ℤ) - (m : ℤ) < 0 := by
  exact sub_neg.mpr (by exact_mod_cast h)

section Rank
-- Supplier parameter Q is the small Q-category of finite projectives over a Dedekind A.
-- Its identification and rank = dim_F(P ⊗_A F) cannot yet be stated. The actual category
-- and function are parameters, rather than opaque replacement carrier definitions.
variable (Q : Type) [SmallCategory Q] (rank : Q → ℕ)
local notation "Q≤" m => ObjectProperty.FullSubcategory (fun P : Q => rank P ≤ m)
local notation "I=" m => Quotient (isIsomorphicSetoid
  (ObjectProperty.FullSubcategory (fun P : Q => rank P = m)))
local notation "Zcoeff" => ModuleCat.of ℤ ℤ

/-
ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison
Typed portion: relative integral simplicial homology is the homology of the actual cone
of the canonical rank inclusion; the sum is over actual isomorphism classes, with an
actual Rep of the automorphism group of the selected representative.
Omitted: Q/rank identification from the predecessor, St identification from Borel R.1
(including the trivial rank-one coefficient), and the H.1/H.2 natural comparison to
realization homology, the LES and representative transport. Nonempty records existence
of the linear equivalence, without choosing the still-unsupplied natural comparison.
The guarded nonnegative branch and separate vanishing branch implement signed i-m:
there is no evaluation of H_0 by truncated subtraction when i < m.
-/
theorem rankLayerHomologyEquiv (m i : ℕ) (_hm : 1 ≤ m)
    (St : (P : I= m) → Rep ℤ (Aut P.out.obj)) :
    let Hrel : ModuleCat ℤ := HomologicalComplex.homology
      (HomologicalComplex.homotopyCofiber
        (SSet.chainComplexMap (nerveMap (ObjectProperty.ιOfLE
          (show (fun P : Q => rank P ≤ m - 1) ≤ (fun P => rank P ≤ m) from
            fun P h => h.trans (Nat.sub_le m 1)))) Zcoeff)) i
    (m ≤ i → Nonempty (Hrel ≃ₗ[ℤ] (⨁ P : I= m, groupHomology (St P) (i - m)))) ∧
    (i < m → Subsingleton Hrel) := by
  sorry

/-
ArithmeticKTheory:N.3:finite-generation/rank-homology-stability
Typed portion: all four conclusions use homology maps induced by the canonical full
subcategory inclusions, with their distinct degree bounds.
Omitted: Q/rank identification, the predecessor's cellular rank-layer description and
finite-simplex exhaustion, and H.1's realization/filtered-union comparisons. No Pic
finiteness is added. These are rank-filtration maps, not ordinary GL stabilization maps.
-/
theorem rankHomology_stable (i n : ℕ) :
    (i ≤ n → Function.Surjective (SSet.homologyMap
      (nerveMap (ObjectProperty.ιOfLE
        (show (fun P : Q => rank P ≤ n) ≤ (fun P => rank P ≤ n + 1) from
          fun P h => h.trans (Nat.le_succ n)))) Zcoeff i)) ∧
    (i + 1 ≤ n → Function.Bijective (SSet.homologyMap
      (nerveMap (ObjectProperty.ιOfLE
        (show (fun P : Q => rank P ≤ n) ≤ (fun P => rank P ≤ n + 1) from
          fun P h => h.trans (Nat.le_succ n)))) Zcoeff i)) ∧
    (i ≤ n → Function.Surjective (SSet.homologyMap
      (nerveMap (ObjectProperty.ι (fun P : Q => rank P ≤ n))) Zcoeff i)) ∧
    (i + 1 ≤ n → Function.Bijective (SSet.homologyMap
      (nerveMap (ObjectProperty.ι (fun P : Q => rank P ≤ n))) Zcoeff i)) := by
  sorry

/-
ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type
Typed portion: finite positive-rank isomorphism-class sets and integral coefficient
homology finite generation give finite generation at every finite stage and in full Q.
Omitted: Q/rank and actual St identifications, the rank-zero terminal-category comparison,
and the preceding natural relative/stability supplier interfaces. Finite class sets
express the output of LowDegrees' finite-Pic/Steinitz classification, not a replacement
Pic definition. Specialization to O_F imports Borel's integral finiteness for every
projective lattice; it is not assumed for all representations.
-/
theorem rankHomology_finitelyGenerated
    (St : (m : ℕ) → (P : I= m) → Rep ℤ (Aut P.out.obj))
    (_hclasses : ∀ m : ℕ, 1 ≤ m → Finite (I= m))
    (_hSt : ∀ (m : ℕ) (_hm : 1 ≤ m) (P : I= m) (q : ℕ),
      AddGroup.FG (groupHomology (St m P) q)) :
    (∀ i n : ℕ, AddGroup.FG ((nerve (Q≤ n)).homology (C := ModuleCat ℤ) Zcoeff i)) ∧
    (∀ i : ℕ, AddGroup.FG ((nerve Q).homology (C := ModuleCat ℤ) Zcoeff i)) := by
  sorry
end Rank

/-
ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type
Typed portion: a connected H-space structure on the actual nerve realization, and
integral simplicial homology finite generation, yield Group.FG of actual π_(n+1),
including π_1 at n=0. Group.FG uses Mathlib's multiplicative homotopy-group convention.
Omitted: Q = Q(P(A)), basepoint = the zero projective's point, the direct-sum origin of
HSpace, and K.1's additive K-group comparison/commutativity at degree zero. H.1 must
supply CW type and the simplicial/singular homology comparison; the early Serre extension
proves the implication, rather than being assumed as an input. The preceding homology
node supplies the displayed hypothesis from finite Pic and arithmetic Steinberg homology.
No simply-connected assumption is imposed on BQ.
-/
theorem quillenK_finitelyGenerated (Q : Type) [SmallCategory Q]
    [HSpace (SSet.toTop.obj (nerve Q))]
    [PathConnectedSpace (SSet.toTop.obj (nerve Q))]
    (x : SSet.toTop.obj (nerve Q))
    (_hH : ∀ i : ℕ, AddGroup.FG ((nerve Q).homology (C := ModuleCat ℤ) (ModuleCat.of ℤ ℤ) i)) :
    ∀ n : ℕ, Group.FG (HomotopyGroup.Pi (n + 1) (SSet.toTop.obj (nerve Q)) x) := by
  sorry

/-
ArithmeticKTheory:N.3:finite-generation/s-localization-finite-defect
Typed portion: actual π_(n+1) groups for n=d+2 (hence n≥2), an exact segment with
finite ModuleCat end groups, their parity vanishing, and source finite generation.
The result states finite kernel/cokernel, even injectivity, odd surjectivity and target
finite generation. Additive only renames the actual commutative homotopy-group operation.
The quotient-representative condition ties f to postcomposition by the realized nerve
map of the actual functor F; it is the characterization of Tau Ceti HomotopyGroup.mapHom.
This pinned module is read but absent from the shared compiled modules, so this file
states that condition directly using Mathlib loops and quotients without importing it.
Omitted: QA/QB = Q(P(O_F))/Q(P(O_{F,S})), their zero basepoints, finite S, F = scalar
extension, and identification of L/R with the residue K_n/K_(n-1) sums.
The maps/exactness/finiteness/vanishing parameters are the actual mathematical outputs required of the suppliers, not arbitrary Prop-valued fields or K stand-ins.
Owners: N.1/S-integers-localisation-of-torsion-class-group gives B=A[1/s] with support
exactly S (s=1 for empty S); N.2/finite-support gives THIS finite localization sequence;
L.1/quillen-k-groups gives its finite end terms and parity. Dropping primes from the
fraction-field sequence does not give this segment. K.1 must identify the realized
scalar-extension map with its K-group map.
The degree-one determinant/S-unit and degree-zero class-group consequences are imported
from their existing owners, outside this degree≥2 prototype; their carriers remain absent.
-/
theorem sLocalization_finiteDefect
    (QA QB : Type) [SmallCategory QA] [SmallCategory QB]
    (F : QA ⥤ QB)
    (xA : SSet.toTop.obj (nerve QA)) (xB : SSet.toTop.obj (nerve QB))
    (hx : (SSet.toTop.map (nerveMap F)) xA = xB)
    (d : ℕ)
    (L R : ModuleCat ℤ) [Finite L] [Finite R]
    (a : L →+ Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QA)) xA))
    (f : Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QA)) xA) →+
      Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QB)) xB))
    (b : Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QB)) xB) →+ R)
    (_hmap : ∀ p : GenLoop (Fin (d + 3)) (SSet.toTop.obj (nerve QA)) xA,
      f (Additive.ofMul (⟦p⟧ : HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QA)) xA)) =
        Additive.ofMul (⟦(⟨(SSet.toTop.map (nerveMap F)).hom.comp p.1,
          fun t ht => by
            change (SSet.toTop.map (nerveMap F)) (p t) = xB
            rw [GenLoop.boundary p t ht]
            exact hx⟩ : GenLoop (Fin (d + 3)) (SSet.toTop.obj (nerve QB)) xB)⟧ :
          HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QB)) xB))
    (_haf : Function.Exact a f) (_hfb : Function.Exact f b)
    (_heven : Even (d + 2) → Subsingleton L)
    (_hodd : Odd (d + 2) → Subsingleton R)
    (_hfg : AddGroup.FG (Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QA)) xA))) :
    Finite f.ker ∧
    Finite (Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QB)) xB) ⧸ f.range) ∧
    (Even (d + 2) → Function.Injective f) ∧
    (Odd (d + 2) → Function.Surjective f) ∧
    AddGroup.FG (Additive (HomotopyGroup.Pi (d + 3) (SSet.toTop.obj (nerve QB)) xB)) := by
  sorry
end TauCeti.ArithmeticKTheory
