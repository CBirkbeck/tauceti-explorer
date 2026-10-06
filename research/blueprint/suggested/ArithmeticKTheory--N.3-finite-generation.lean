/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The forms below suggest names and signatures so contributors and reviewers can converge.
Nothing here claims a formalisation of the arithmetic K-theory targets.

The executable examples use individual modules of the pinned Mathlib. The five higher-K
signatures are a COMMENT-ONLY register: Q-rank realization, Steinberg representations,
relative homology comparisons and higher Quillen K carriers are not in the pinned baseline.
There are no opaque carrier stand-ins, arbitrary proposition fields or dummy K definitions.
The register is not elaborated. Its conditions must be supplied by the cited owners before
turning it into declarations. Imported predecessor definitions/API/tests remain in that
packet and its suggested file, rather than being introduced again here.

Independent review REV-ArithmeticKTheory--N.3-finite-generation: the comment-only register
does not meet PROTOCOL §13's requirement for named theorem declarations proved by sorry.
The examples below check baseline inputs only. The packet therefore needs revision.
-/

import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.RingTheory.Finiteness.Finsupp
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic

noncomputable section

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

/-
Signature register. The displayed homology/Q/Steinberg/K expressions refer to the
mathematical carriers of the owning nodes, not locally declared variables. Names for
those unavailable carriers cannot yet be fixed as elaborated Lean types. In particular
conditions involving them are left unstated in executable Lean. PROTOCOL §13 permits honest
omission of unstateable conditions, but still requires actual named theorem declarations;
this register does not satisfy that requirement.
Each of the five named nodes below would have a proof ending in `by sorry` once its full
supplier signature is available. The explanatory statements here supply the missing
conditions without pretending they have been typechecked.

ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison
  proposed name: TauCeti.ArithmeticKTheory.rankLayerHomologyEquiv
  intended result form:
    H_i(BQ_m(A), BQ_{m-1}(A); ℤ) ≃+
      ⨁ ([P] : rank-m projective isomorphism classes),
        H_{(i : ℤ) - (m : ℤ)}(Aut_A(P); St(P ⊗[A] F)).
  Binders: A commutative Dedekind domain; F its fraction field; m,i : ℕ; 1 ≤ m.
  In nonnegative degrees the coefficient term is Mathlib's groupHomology of the
  ℤ-linear Steinberg representation. In negative degrees the term is the zero group.
  Do not silently coerce this signed difference back to ℕ. The equivalence must commute
  with the relative long exact sequence and transport of projective representatives.
  Owners: predecessor rank-filtration, comma-category-is-the-layer-poset,
  layer-poset-is-the-suspended-building, rank-spectral-sequence; H.1 and H.2 extension.
  Acceptance: i<m gives zero; m=i=1 gives ⨁ Pic(A) ℤ; m=i=2 gives St coinvariants.

ArithmeticKTheory:N.3:finite-generation/rank-homology-stability
  proposed name: TauCeti.ArithmeticKTheory.rankHomology_stable
  intended result form for i,n : ℕ:
    (i ≤ n → Function.Surjective (H_i(BQ_n) →+ H_i(BQ_{n+1}))) ∧
    (i+1 ≤ n → Function.Bijective (H_i(BQ_n) →+ H_i(BQ_{n+1}))) ∧
    (i ≤ n → Function.Surjective (H_i(BQ_n) →+ H_i(BQ))) ∧
    (i+1 ≤ n → Function.Bijective (H_i(BQ_n) →+ H_i(BQ))).
  Binders: A a Dedekind domain, with the imported Q-rank realization/maps and ℤ homology.
  The arrows above stand for induced homology homomorphisms, not type constructors.
  Owners: predecessor exhaustive rank-filtration, preceding relative comparison and H.1.
  Acceptance: at n=i only surjectivity; H_0(Q_0)→H_0(Q) is ℤ→ℤ;
  no uniform finite rank for all i and no assertion of GL_n homological stability.

ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type
  proposed name: TauCeti.ArithmeticKTheory.rankHomology_finitelyGenerated
  intended result form:
    (∀ i n : ℕ, AddGroup.FG (H_i(BQ_n(A); ℤ))) ∧
    (∀ i : ℕ, AddGroup.FG (H_i(BQ(A); ℤ))).
  Binders: A Dedekind with fraction field F; Finite Pic(A);
  for every positive-rank finite projective P and q : ℕ,
    AddGroup.FG (groupHomology (StRep (P ⊗[A] F)) q).
  Here groupHomology is the existing Rep-valued coefficient construction, whose
  ModuleCat output is viewed as its underlying additive group. StRep is not declared here.
  Owners: previous two nodes; LowDegrees Z.4/classification and Pic comparison;
  Borel R.1/steinberg-duality-finiteness for specialization to 𝓞_F.
  Acceptance: every nonfree Steinitz class; integral rather than rational coefficients;
  finite direct sums followed by degreewise stabilization, not arbitrary colimit finiteness.

ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type
  proposed name: TauCeti.ArithmeticKTheory.quillenK_finitelyGenerated
  intended result form: ∀ n : ℕ, AddGroup.FG (K_n(A)).
  Binders: the same Dedekind/Pic/integral-Steinberg-homology hypotheses as the previous node.
  The actual K carrier is GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories,
  with K_n=π_{n+1}(BQ,0), or equivalently π_n of its based loop space.
  Owners: preceding homology node; K.1/elementary-properties-of-K-groups; H.1;
  requested early H-space/Serre extension assigned provisionally to H.6.
  Acceptance: BQ is simple, not simply connected; K_0=π_1; K_n(ℤ) is finitely
  generated, not asserted finite in all degrees. Specialization gives all K_n(𝓞_F).
  The original endpoint remains predecessor quillen-finite-generation-theorem.

ArithmeticKTheory:N.3:finite-generation/s-localization-finite-defect
  proposed name: TauCeti.ArithmeticKTheory.sLocalization_finiteDefect
  intended result form (n : ℕ, 2 ≤ n):
    Finite (ker (K_n(𝓞_F) →+ K_n(𝓞_{F,S}))) ∧
    Finite (K_n(𝓞_{F,S}) / range (K_n(𝓞_F) →+ K_n(𝓞_{F,S}))) ∧
    (Even n → Function.Injective (K_n(𝓞_F) →+ K_n(𝓞_{F,S}))) ∧
    (Odd n → Function.Surjective (K_n(𝓞_F) →+ K_n(𝓞_{F,S}))).
  Binders: F a number field; S : Set (HeightOneSpectrum (𝓞_F)); S.Finite;
  A=NumberField.RingOfIntegers F, B=S.integer F, with its actual K localization map.
  The slash denotes the additive quotient by the image, not division of group elements.
  Its consequence is ∀ n : ℕ, AddGroup.FG (K_n(B)), adding imported degree-one
  determinant/S-unit and degree-zero class-group results outside the finite-defect bound.
  Owners: preceding K finiteness node; N.1/S-integers-as-a-localisation;
  N.1/S-integers-localisation-of-torsion-class-group; N.2/finite-support;
  L.1/quillen-k-groups;
  LowDegrees Z.4/k0-s-integers; Tau Ceti's finite-S units and class-group instances.
  Use the torsion-class-group presentation B=A[1/s], with primes containing s exactly S,
  and the finite localization sequence. Dropping primes from the fraction-field sequence
  does not itself give the sequence for A → B. For S=∅ choose s=1.
  Acceptance: S=∅ gives identity; K_1(ℤ)→K_1(ℤ[1/p]) has infinite cokernel ℤ;
  no finite-generation conclusion for K_1(ℚ) with all primes inverted.
  The original endpoint remains predecessor finite-generation-of-K-of-S-integers.
-/

end TauCeti.ArithmeticKTheory
