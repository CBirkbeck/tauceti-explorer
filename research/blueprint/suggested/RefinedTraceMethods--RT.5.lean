/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/RefinedTraceMethods--RT.5.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. They claim no implementation.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Protocol section 13: conditions requiring unavailable coherent infinity-category,
spectrum, animated or complete filtered types are omitted from executable code.
Their exact packet names and mathematical contracts appear below. They are never
encoded by unspecified proposition fields. The executable prototypes concern
actual prime factorizations, actual quotient rings and actual ordinary complexes.
-/
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Homology.HomologicalComplex

noncomputable section

open CategoryTheory

universe u v

namespace TauCeti.RefinedTrace

/-- The arithmetic indexing condition of Meyer–Wagner, section 3.1.
Positivity is separate because the baseline factorization of zero is zero. -/
def HighPowered (m : ℕ) : Prop :=
  0 < m ∧
    (m.factorization 2 = 0 ∨ (4 ≤ m.factorization 2 ∧ Even (m.factorization 2))) ∧
    ∀ p : ℕ, p.Prime → p ≠ 2 → m.factorization p = 0 ∨ 2 ≤ m.factorization p

namespace HighPowered

theorem pos {m : ℕ} (h : HighPowered m) : 0 < m := by
  sorry

theorem twoExponent {m : ℕ} (h : HighPowered m) :
    m.factorization 2 = 0 ∨ (4 ≤ m.factorization 2 ∧ Even (m.factorization 2)) := by
  sorry

theorem oddExponent {m p : ℕ} (h : HighPowered m) (hp : p.Prime) (hodd : p ≠ 2) :
    m.factorization p = 0 ∨ 2 ≤ m.factorization p := by
  sorry

theorem fourthPower {d : ℕ} (hd : 0 < d) : HighPowered (d ^ 4) ∧ d ∣ d ^ 4 := by
  sorry

theorem factorizationCriterion (m : ℕ) :
    HighPowered m ↔
      0 < m ∧
        (m.factorization 2 = 0 ∨ (4 ≤ m.factorization 2 ∧ Even (m.factorization 2))) ∧
        ∀ p : ℕ, p.Prime → p ≠ 2 → m.factorization p = 0 ∨ 2 ≤ m.factorization p := by
  sorry

-- HighPowered.one
example : HighPowered 1 := by
  sorry

-- HighPowered.nineAndSixteen
example : HighPowered 9 ∧ HighPowered 16 := by
  sorry

-- HighPowered.excludeZeroEightThirtyTwo
example : ¬ HighPowered 0 ∧ ¬ HighPowered 8 ∧ ¬ HighPowered 32 := by
  sorry

end HighPowered

/-- The ordinary underlying ideal; homotopical grading is a separate contract. -/
def traceRelationIdeal {A : Type u} [CommRing A] (ξ : A) :
    Ideal (MvPolynomial (Fin 2) A) :=
  Ideal.span {MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) - MvPolynomial.C ξ}

/-- Actual baseline quotient A[u,v]/(uv−ξ), without asserting spectral realization. -/
abbrev TracePresentation (A : Type u) [CommRing A] (ξ : A) :=
  MvPolynomial (Fin 2) A ⧸ traceRelationIdeal ξ

namespace TracePresentation

variable {A : Type u} [CommRing A]

def coeff (ξ : A) : A →+* TracePresentation A ξ :=
  (Ideal.Quotient.mk (traceRelationIdeal ξ)).comp MvPolynomial.C

def u (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk (traceRelationIdeal ξ) (MvPolynomial.X (0 : Fin 2))

def v (ξ : A) : TracePresentation A ξ :=
  Ideal.Quotient.mk (traceRelationIdeal ξ) (MvPolynomial.X (1 : Fin 2))

theorem uv (ξ : A) : u ξ * v ξ = coeff ξ ξ := by
  sorry

def lift {B : Type v} [CommRing B] (ξ : A) (f : A →+* B) (a b : B)
    (h : a * b = f ξ) : TracePresentation A ξ →+* B := by
  sorry

-- Generator equations and uniqueness make the proposed lift a universal property.
theorem lift_coeff {B : Type v} [CommRing B] (ξ : A) (f : A →+* B) (a b : B)
    (h : a * b = f ξ) (x : A) : lift ξ f a b h (coeff ξ x) = f x := by
  sorry

theorem lift_u {B : Type v} [CommRing B] (ξ : A) (f : A →+* B) (a b : B)
    (h : a * b = f ξ) : lift ξ f a b h (u ξ) = a := by
  sorry

theorem lift_v {B : Type v} [CommRing B] (ξ : A) (f : A →+* B) (a b : B)
    (h : a * b = f ξ) : lift ξ f a b h (v ξ) = b := by
  sorry

theorem ext {B : Type v} [CommRing B] {ξ : A}
    (f g : TracePresentation A ξ →+* B)
    (hc : ∀ x, f (coeff ξ x) = g (coeff ξ x))
    (hu : f (u ξ) = g (u ξ)) (hv : f (v ξ) = g (v ξ)) : f = g := by
  sorry

/-- Scalar functoriality of the coefficient presentation. -/
def map {B : Type v} [CommRing B] {ξ : A} {η : B}
    (f : A →+* B) (h : f ξ = η) : TracePresentation A ξ →+* TracePresentation B η := by
  sorry

def can (ξ : A) : TracePresentation A ξ →+* LaurentPolynomial A := by
  sorry

def frobenius (ξ : A) (φ : A →+* A) :
    TracePresentation A ξ →+* LaurentPolynomial A := by
  sorry

-- All three generator images are part of the two proposed map signatures.
theorem can_coeff (ξ x : A) : can ξ (coeff ξ x) = LaurentPolynomial.C x := by
  sorry

theorem frobenius_u (ξ : A) (φ : A →+* A) :
    frobenius ξ φ (u ξ) = LaurentPolynomial.T 1 := by
  sorry

theorem frobenius_v (ξ : A) (φ : A →+* A) :
    frobenius ξ φ (v ξ) = LaurentPolynomial.C (φ ξ) * LaurentPolynomial.T (-1) := by
  sorry

-- TracePresentation.canGenerators
example (ξ : A) :
    can ξ (u ξ) = LaurentPolynomial.C ξ * LaurentPolynomial.T 1 ∧
      can ξ (v ξ) = LaurentPolynomial.T (-1) := by
  sorry

-- TracePresentation.frobeniusScalars
example (ξ : A) (φ : A →+* A) (x : A) :
    frobenius ξ φ (coeff ξ x) = LaurentPolynomial.C (φ x) ∧
      frobenius ξ φ (u ξ) * frobenius ξ φ (v ξ) = LaurentPolynomial.C (φ ξ) := by
  sorry

-- TracePresentation.zeroParameter
example : u (0 : A) * v (0 : A) = 0 := by
  sorry

-- TracePresentation.unitParameter
example : ∃ e : TracePresentation A (1 : A) ≃+* LaurentPolynomial A,
    e (u (1 : A)) = LaurentPolynomial.T 1 ∧
      e (v (1 : A)) = LaurentPolynomial.T (-1) ∧ e.toRingHom = can (1 : A) := by
  sorry

end TracePresentation

/-- The chain-level (b,B) comparison used before the RT.1 totalizations.
The differential b is the actual ChainComplex differential; B has degree +1.
No coherent circle action or completed totalization is claimed by this signature. -/
theorem MixedComplexMapCompatibility
    {R : Type u} [CommRing R]
    (C D : ChainComplex (ModuleCat.{v} R) ℤ) (f : C ⟶ D)
    (BC : ∀ n : ℤ, C.X n ⟶ C.X (n + 1))
    (BD : ∀ n : ℤ, D.X n ⟶ D.X (n + 1))
    (hB : ∀ n : ℤ, BC n ≫ f.f (n + 1) = f.f n ≫ BD n)
    (n : ℤ) (c : C.X n) :
    Prod.map (f.f (n - 1)) (f.f (n + 1)) (C.d n (n - 1) c, BC n c) =
      (D.d n (n - 1) (f.f n c), BD n (f.f n c)) := by
  sorry

end TauCeti.RefinedTrace

/-! Higher contracts omitted from executable signatures under protocol section 13.
Each block records the packet declaration name, exact mathematical statement, API
names and named test contracts. Synchronize the reader as required by the review.
-/

/-
MotivesRigidity — RefinedTraceMethods:RT.5/motives-rigidity
Kind: theorem; implementation unchecked.
If E is a rigid presentable E₁-monoidal stable category, Motloc_E is dualizable in PrL_st with dual Motloc_(E^mop) and pairing (D,C) ↦ Kcont(D ⊗_E C). If E is E₂-monoidal, Motloc_E is rigid E₁-monoidal. In the symmetric monoidal case the rigidity is symmetric monoidal. These are finitary accessible motives with the specified universe, not the assertion that every motive is a dualizable object.
Required types/inputs: RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/nuclear-module-resolution; RefinedTraceMethods:RT.5/enriched-duality; RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/rigidity-criterion
-/

/-
RefinedInvariantUniversality — RefinedTraceMethods:RT.5/refined-invariant-universality
Kind: theorem; implementation unchecked.
Let E be rigid symmetric monoidal, and T: Motloc_E → D a colimit-preserving symmetric monoidal functor to a presentable symmetric monoidal stable D. The canonical rigidification D^rig ⊂ Ind_κ(D), defined by trace-class systems, admits a unique colimit-preserving symmetric monoidal factor Tref: Motloc_E → D^rig, up to contractible choice; realization gives T. If D is locally rigid with ω₁-compact unit, D^rig is the category of nuclear ind-objects with sequential presentations.
Required types/inputs: RefinedTraceMethods:RT.5/motives-rigidity; RefinedTraceMethods:RT.5/rigidification; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/rigidity-criterion
-/

/-
RefinedKuComputation — RefinedTraceMethods:RT.5/refined-ku-computation
Kind: theorem; implementation unchecked.
TC−,ref((ku ⊗ Q)/ku) is even. Its even graded homotopy is the idempotent nuclear ind-graded B = Z[β][[t]]-algebra A*ku obtained by killing the idempotent pro-algebra F_m = Fil*qHdg(derived qdR(Z/m)/Z), indexed by high-powered m under divisibility; |β|=2, |t|=−2 and q−1=βt. There is a natural exact sequence 0 → B → A*ku → ind-colim_(m∈N^op) Ext¹_B(F_m,B) → 0. Ext and duals are in the graded derived t-complete category; no canonical splitting is asserted. The exact sequence comes from the cofiber of the duals of the unit maps in TC⁻.
Required types/inputs: RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.5/high-powered; RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/torsion-duality; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/graded-trace-class; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/nuclear-closure
-/

/-
RefinedKuPeriodicComputation — RefinedTraceMethods:RT.5/refined-ku-periodic-computation
Kind: theorem; implementation unchecked.
TC−,ref((KU ⊗ Q)/KU) is even with π2* = A_KU[β,β⁻¹], |β|=2. A_KU is the idempotent nuclear ind Z[[q−1]]-algebra obtained by killing pro qHdg(derived qdR(Z/m)/Z), and 0 → Z[[q−1]] → A_KU → ind-colim_(m∈N^op) Ext¹_(Z[[q−1]])(qHdg(derived qdR(Z/m)/Z),Z[[q−1]]) → 0. Duals and Ext use the derived (q−1)-complete category. This is the periodic computation with its own convergence proof, not an application of a bounded-below formula to KU.
Required types/inputs: RefinedTraceMethods:RT.5/refined-ku-computation; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.4:topological; RefinedTraceMethods:RT.4:q-Hodge; RefinedTraceMethods:RT.4:Habiro-comparison
-/

/-
TracePrismaticComparison — RefinedTraceMethods:RT.6/trace-prismatic-comparison
Kind: comparison; implementation unchecked.
For quasisyntomic A, the trace complex C_A constructed by unfolding π₀TC⁻ on QRSP covers is naturally equivalent, as a multiplicative filtered complex with Frobenius, to the Nygaard completion of the imported prismatic Δ_A. On QRSP S, π₀TC⁻(S;Z_p) = π₀TP(S;Z_p) has its canonical δ-structure and Δ_S → C_S identifies C_S with the Nygaard completion, compatibly with the divided Frobenius maps. This is not a definition of Δ and does not identify Δ with its completion in general.
Required types/inputs: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/trace-noncompleted-extension; RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/segal-oc; RefinedTraceMethods:RT.6/crystalline-trace-comparison; PrismaticCohomology:PR.2/qrsp-prism; PrismaticCohomology:PR.3/nygaard-completion; PrismaticCohomology:PR.3/bms2-comparison
-/

/-
GradedMotivicComparison — RefinedTraceMethods:RT.6/graded-motivic-comparison
Kind: comparison; implementation unchecked.
For quasisyntomic A, gr^iTHH(A;Z_p) ≃ N^i(C_A){i}[2i], gr^iTC⁻(A;Z_p) ≃ N^{≥i}(C_A){i}[2i], and gr^iTP(A;Z_p) ≃ C_A{i}[2i]. Here N^i is the cofiber of N^{≥i+1} → N^{≥i}, twists are completed filtered Breuil–Kisin modules, and C_A is identified with the imported completed prismatic object. The equivalences preserve products, can and Frobenius. N^i(C_A){i} ≃ N^i(C_A) has the source’s canonical specialization, not a global chosen basis for every twist.
Required types/inputs: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/trace-prismatic-comparison
-/

/-
SyntomicGradedTc — RefinedTraceMethods:RT.6/syntomic-graded-tc
Kind: comparison; implementation unchecked.
For quasisyntomic A and i≥0, gr^iTC(A;Z_p) ≃ Z_p(i)(A)[2i], where Z_p(i) is the independently constructed PR.4 syntomic fiber of divided Frobenius minus can from N^{≥i} completed Δ_A{i} to completed Δ_A{i}. The filtered TC construction is fib(φ−can: Fil^iTC⁻ → Fil^iTP); its graded map identifies with the imported syntomic map. Finite coefficients are derived tensor with Z/p^n.
Required types/inputs: RefinedTraceMethods:RT.6/graded-motivic-comparison; RefinedTraceMethods:RT.6/filtered-frobenius; PrismaticCohomology:PR.4/syntomic-complex
-/

/-
HabiroTraceInterface — RefinedTraceMethods:RT.6/habiro-trace-interface
Kind: comparison; implementation unchecked.
For the supplied RT.4 q-Hodge and Habiro inputs satisfying Wagner 4.18(A),(R), 4.18a(R2), and, in Theorem 5.63, 2∈R× and 5.43(A2), export the coherent S¹ and genuine finite-C_m cyclonic maps, complete even filtration and graded q-Hodge module comparison diagrams. Retain Σ^(−2i) shearing, Bott inversion, and completion. Theorem 4.27 has an E_(n−1) multiplicative enhancement only under Remark 4.28’s chosen E_n lift hypotheses (2≤n≤∞); an enhancement of the Habiro comparison must be supplied separately by RT.4 and is not inferred from the module equivalence of Theorem 5.63. For R=O_F[1/Δ], require 6|Δ, disc(F)|Δ and the specified spherical étale lift. This is the trace input for HQ/HR descent, with the periodic reconstruction proof; it does not assert Habiro descent for the refined rational TC⁻ ind-algebras.
Required types/inputs: RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.4:q-Hodge; RefinedTraceMethods:RT.4:Habiro-comparison; HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations; HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex; HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent; HabiroCohomologyFoundations:HQ.4/no-automatic-multiplicative-upgrade; HabiroRings:HR.2/habiro-complete-modules; HabiroRings:HR.2/the-monoidal-structure; HabiroRings:HR.2/habiro-complete-solid-spectra; HabiroRings:HR.5/the-relative-habiro-ring; HabiroRings:HR.5/completed-base-change
-/

/-
DualizableCategories — RefinedTraceMethods:RT.5/dualizable-categories
Kind: definition; implementation unchecked.
Catdual_E has presentable stable left E-modules C that are dualizable as objects of PrL_E. Morphisms are E-linear colimit-preserving functors whose right adjoints preserve colimits (strongly continuous functors). For E=Sp this is Catdual_st. Object dualizability means specified evaluation and coevaluation with coherent triangle identities; it does not mean every object of C is dualizable or C is compactly generated.
Required types/inputs: EnhancedDerivedSheaves:E5:abstract/stable-infinity-category; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/presentable-categories; EnhancedDerivedSheaves:E5:presentability
API DualizableCategories.ofInd [constructor]: For small idempotent-complete stable A, Ind(A) is an object of Catdual_st (E=Sp). An E-linear version additionally requires the compatible E-action supplied by the rigid-base module interface.
API DualizableCategories.dual [data]: Return the object dual C∨ with evaluation C∨⊗_E C → E and coevaluation E → C⊗_E C∨ satisfying coherent triangles.
API DualizableCategories.hom [characterisation]: Morphisms C → D are E-linear left adjoints with colimit-preserving right adjoint.
API DualizableCategories.tensor [structure]: For symmetric monoidal rigid E, tensor over E and its unit give Catdual_E a symmetric monoidal structure.
example contract DualizableCategories.indPerf [compatibility]: For A=Perf(R), the supplied spectrum-module comparison identifies Ind(A) with Mod_R.
example contract DualizableCategories.zero [degenerate]: The zero presentable stable category is dualizable, with zero evaluation and coevaluation.
example contract DualizableCategories.rightAdjointRequired [non-example]: A left adjoint whose right adjoint fails to preserve colimits is not a morphism of Catdual_st.
-/

/-
TraceClass — RefinedTraceMethods:RT.5/trace-class
Kind: definition; implementation unchecked.
In a presentable symmetric monoidal stable C, with tensor preserving colimits separately, write X∨=internal Hom(X,1), without assuming X dualizable. A map f:X → Y is trace-class when there is η:1 → X∨⊗Y such that f equals X≃X⊗1 → X⊗X∨⊗Y → Y by evaluation. The E₁ variant uses distinct left/right preduals and the corresponding tensor orders.
Required types/inputs: EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/presentable-categories; EnhancedDerivedSheaves:E5:presentability
API TraceClass.ofClassifier [constructor]: An η:1 → X∨⊗Y gives a trace-class map by the evaluation formula.
API TraceClass.iff_factorization [characterisation]: Trace-class means that the adjoint of f:1 → Hom(X,Y) factors through X∨⊗Y.
API TraceClass.map [functoriality]: A symmetric monoidal functor takes a trace-class f to a trace-class map through F(X∨) → F(X)∨. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality.
API TraceClass.predual [compatibility]: If f:X → Y is trace-class then Y∨ → X∨ is trace-class; for such transitions the comparison F(Y)∨ → F(X∨) supplies the diagonal needed for ind-predual colimits. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality.
API TraceClass.comp [relation]: Precomposition and postcomposition preserve trace-class maps: transport the classifier by the predual map on the source and the ordinary map on the target.
API TraceClass.tensor [relation]: The tensor of two trace-class maps is trace-class, classified by the tensor of their classifiers and the canonical predual comparison.
API TraceClass.identity_iff_dualizable [characterisation]: The identity on X is trace-class exactly when X is dualizable; the classifier of the identity supplies coevaluation.
example contract TraceClass.unitIdentity [computation]: The identity on the tensor unit is trace-class, classified by its unit constraints.
example contract TraceClass.zeroMap [degenerate]: The zero X → Y is trace-class, classified by the zero map 1 → X∨⊗Y.
example contract TraceClass.infiniteVectorSpace [non-example]: The identity on the countably infinite direct-sum k-vector space in D(k) is not trace-class, whereas every finite-rank degree-zero map is.
-/

/-
RigidCategory — RefinedTraceMethods:RT.5/rigid-category
Kind: definition; implementation unchecked.
A presentable stable E₁-monoidal E is rigid when the unit is compact and multiplication μ:E⊗E → E is strongly continuous with E–E-bilinear right adjoint. Equivalently its unit is compact and it is generated under colimits by sequential colimits of maps that are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. The equivalence is a theorem of Efimov Proposition 1.1; compact generation is not an extra defining hypothesis.
Required types/inputs: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability/compact-objects
API RigidCategory.multiplicationRightAdjoint [projection]: Return μ^R preserving colimits and compatible with the left and right E actions.
API RigidCategory.unitCompact [projection]: The tensor unit is compact.
API RigidCategory.iff_traceClassGenerators [characterisation]: Rigidity is equivalent to compact unit and generation by sequential systems whose maps are both left and right trace-class. Supplied by RefinedTraceMethods:RT.5/rigidity-criterion.
API RigidCategory.compact_iff_dualizable [compatibility]: For a rigid E, an object is compact exactly when it is left and right dualizable; this does not make all objects compact.
example contract RigidCategory.spectra [computation]: Sp is rigid and its compact objects are finite spectra.
example contract RigidCategory.indRigid [compatibility]: Ind(A) is rigid when small stable idempotent-complete monoidal A has every object dualizable.
example contract RigidCategory.unitNotCompact [non-example]: A presentable monoidal stable category with noncompact unit fails the definition even if multiplication has a continuous right adjoint.
-/

/-
NuclearObject — RefinedTraceMethods:RT.5/nuclear-objects
Kind: definition; implementation unchecked.
For compactly generated presentable symmetric monoidal stable C with compact unit, X is nuclear if every map P → X from compact P is trace-class. X is basic nuclear if it has a sequential presentation X≃colim_n X_n with all transitions trace-class. The full subcategory Nuc(C) is stable and closed under colimits and tensor; its ω₁-compact objects are precisely the basic nuclear objects.
Required types/inputs: RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion
API NuclearObject.ofBasic [constructor]: A sequential trace-class presentation gives a nuclear object.
API NuclearObject.mapFromCompact [characterisation]: Every map P → X from compact P has a trace-class classifier.
API NuclearObject.colimit [structure]: Nuclear objects are stable and closed under arbitrary colimits and tensor products. Supplied by RefinedTraceMethods:RT.5/nuclear-closure.
API NuclearObject.map [functoriality]: Symmetric monoidal colimit-preserving F preserves basic nuclear objects and hence nuclear objects under the source’s generation hypotheses. Supplied by RefinedTraceMethods:RT.5/nuclear-closure.
example contract NuclearObject.zero [degenerate]: The zero object is basic nuclear via the constant zero system.
example contract NuclearObject.finiteDimensional [computation]: In D(k), a finite-dimensional degree-zero vector space is basic nuclear via its constant identity system.
example contract NuclearObject.countableVsUncountable [non-example]: In D(k), a countably generated degree-zero vector space is basic nuclear, while an uncountable-dimensional degree-zero space is nuclear but not ω₁-compact and hence not basic nuclear.
-/

/-
ContinuousCalkin — RefinedTraceMethods:RT.5/continuous-calkin
Kind: construction; implementation unchecked.
For dualizable presentable stable C and an uncountable regular cardinal κ, the strongly continuous fully faithful left adjoint Yoneda functor Ŷ:C → Ind(C^κ) has quotient equivalent to ker(colim:Ind(C^κ) → C). Define Calkcont_κ(C) as the compact objects of that quotient. It is small stable idempotent-complete and gives an exact sequence 0 → C → Ind(C^κ) → Ind(Calkcont_κ(C)) → 0 in Catdual_st. Functoriality is for strongly continuous functors.
Required types/inputs: RefinedTraceMethods:RT.5/dualizable-categories; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability
API ContinuousCalkin.quotient [data]: The canonical functor Ind(C^κ) → Ind(Calkcont_κ(C)) has kernel Ŷ(C).
API ContinuousCalkin.map [functoriality]: Strongly continuous C → D induces an exact Calkcont_κ(C) → Calkcont_κ(D), with coherent identity and composition laws.
API ContinuousCalkin.compactlyGenerated [equivalence]: If C=Ind(A), Calkcont_κ(C) ≃ (Ind(A)^κ/A)^Kar.
API ContinuousCalkin.exactSequence [compatibility]: The defining sequence is exact in Catdual_st and is functorial in C.
example contract ContinuousCalkin.zero [degenerate]: Calkcont_κ(0) is the zero small stable category.
example contract ContinuousCalkin.perfRing [compatibility]: For C=Mod_R, Calkcont_κ(C) is the idempotent completion of (Mod_R)^κ/Perf(R).
example contract ContinuousCalkin.swindle [characterisation]: For compactly generated C, the exact sequence C^ω → C^ω₁ → Calkcont_ω₁(C) produces the loop equivalence after an accessible localizing invariant; C^ω₁ has vanishing invariant by the countable swindle.
-/

/-
LocalizingInvariant — RefinedTraceMethods:RT.5/localizing-invariant
Kind: definition; implementation unchecked.
An accessible localizing invariant F:Catperf → T, with T accessible stable, sends the zero category to zero and exact sequences A → B → C (fully faithful first map and idempotent-complete Verdier quotient C) to fiber/cofiber sequences, and commutes with κ-filtered colimits for a specified regular κ. The relative Catdual_E version uses exact sequences and strongly continuous E-linear maps. A finitary invariant has κ=ω.
Required types/inputs: EnhancedDerivedSheaves:E5:abstract/stable-infinity-category; EnhancedDerivedSheaves:E5:presentability/ind-completion; RefinedTraceMethods:RT.5/dualizable-categories
API LocalizingInvariant.exactSequence [projection]: F(A) → F(B) → F(C) is a cofiber sequence for each exact sequence.
API LocalizingInvariant.map [functoriality]: Exact functors give maps in T with coherent identity and composition.
API LocalizingInvariant.filteredColimit [projection]: F commutes with the specified κ-filtered colimits.
API LocalizingInvariant.ofKTheory [compatibility]: The imported concrete nonconnective K-theory functor satisfies this interface; the universal property is a property, not its definition.
example contract LocalizingInvariant.zero [degenerate]: F(0) ≃ 0.
example contract LocalizingInvariant.split [computation]: F(A⊕B) ≃ F(A)⊕F(B) with the two inclusions and projections.
example contract LocalizingInvariant.connectiveKNotEnough [non-example]: Connective K-theory without additional hypotheses is not substituted for nonconnective K-theory in the arbitrary localization fiber sequence.
-/

/-
ContinuousExtension — RefinedTraceMethods:RT.5/continuous-extension
Kind: construction; implementation unchecked.
For accessible localizing F:Catperf → T define Fcont(C)=Ω F(Calkcont_ω₁(C)) on Catdual_st. It is accessible localizing, commutes with the same κ-filtered colimits as F, and Fcont(Ind(A))≃F(A). Kcont denotes this construction applied to the concrete nonconnective K-theory functor. This extends a supplied functor rather than postulating a new universal K spectrum.
Required types/inputs: RefinedTraceMethods:RT.5/localizing-invariant; RefinedTraceMethods:RT.5/continuous-calkin; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance
API ContinuousExtension.obj [data]: Fcont(C) is ΩF(Calkcont_ω₁(C)).
API ContinuousExtension.map [functoriality]: Strongly continuous C → D induces Fcont(C) → Fcont(D).
API ContinuousExtension.ofInd [equivalence]: Fcont(Ind(A)) ≃ F(A) naturally in small idempotent-complete stable A.
API ContinuousExtension.exact [compatibility]: Fcont takes exact sequences in Catdual_st to cofiber sequences and preserves the specified κ-filtered colimits.
example contract ContinuousExtension.zero [degenerate]: Fcont(0)≃0.
example contract ContinuousExtension.moduleK [compatibility]: Kcont(Mod_R)≃the supplied K(Perf(R)) with its scalar-extension map.
example contract ContinuousExtension.semiorthogonal [computation]: For a strongly continuous semiorthogonal decomposition C=⟨C₁,C₂⟩, Fcont(C)≃Fcont(C₁)⊕Fcont(C₂).
-/

/-
ContinuousExtensionUniqueness — RefinedTraceMethods:RT.5/continuous-extension-uniqueness
Kind: theorem; implementation unchecked.
For regular κ and accessible stable T admitting κ-filtered colimits, precomposition with Ind gives an equivalence between accessible κ-finitary localizing functors Catdual_st → T and Catperf → T. Its inverse is F ↦ Fcont. The relative E-linear version has the analogous statement for relatively compactly generated E-modules and dualizable E-modules with strong-continuity morphisms.
Required types/inputs: RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/dualizable-categories
-/

/-
LocalizingMotives — RefinedTraceMethods:RT.5/localizing-motives
Kind: construction; implementation unchecked.
For rigid E₁-monoidal E and regular κ, construct accessible stable Motloc_(E,κ) with κ-filtered colimits and Uloc,κ:Catdual_E → Motloc_(E,κ) such that precomposition identifies exact κ-continuous functors out of Motloc_(E,κ) with accessible κ-finitary localizing invariants. Use the small relatively compactly generated model, stabilized spectral presheaves, and localization at zero, Morita, exact-sequence and κ-colimit relations, then continuous extension. For symmetric monoidal E, tensor of E-modules descends to the finitary Motloc_E (κ=ω); for E₂ it supplies the E₁ structure used in the rigidity theorem.
Required types/inputs: RefinedTraceMethods:RT.5/localizing-invariant; RefinedTraceMethods:RT.5/continuous-extension-uniqueness; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance
API LocalizingMotives.universal [constructor]: Uloc sends an E-linear category to its motive and an exact sequence to a cofiber sequence.
API LocalizingMotives.lift [universal-property]: Every κ-finitary localizing invariant has an exact κ-continuous factor uniquely up to contractible choice.
API LocalizingMotives.tensor [structure]: For symmetric monoidal rigid E, Uloc(C⊗_E D)≃Uloc(C)⊗Uloc(D) with coherent associativity, units and symmetry.
API LocalizingMotives.concreteK [compatibility]: Map(Uloc(E),Uloc(C))≃Kcont(C) in the source’s finitary setting.
example contract LocalizingMotives.zero [degenerate]: Uloc(0)≃0.
example contract LocalizingMotives.baseSpectra [compatibility]: For E=Sp, its compactly generated restriction and universal property agree with BGT Motloc.
example contract LocalizingMotives.split [computation]: Uloc(C⊕D)≃Uloc(C)⊕Uloc(D), compatibly with the inclusion maps.
-/

/-
RelativeNuclearModule — RefinedTraceMethods:RT.5/relative-nuclear-module
Kind: definition; implementation unchecked.
For rigid E₁-monoidal E, a strongly continuous E-linear morphism C → D of dualizable left E-modules is right trace-class over E if represented by a compact object of Homdual_E(C,E)⊗_E D under the canonical functor to FunLL_E(C,D). A relatively compactly generated C is nuclear over E if every compact morphism from an ω₁-compact relatively compactly generated D to C is right trace-class over E; basic nuclear means a sequential colimit of these right trace-class maps. The trace-class definition has dualizable-module generality; the nuclear subcategory here has relatively compactly generated objects. This categorical notion is distinct from nuclear objects in a monoidal category.
Required types/inputs: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability
API RelativeNuclearModule.traceClassWitness [constructor]: A compact object of Homdual_E(C,E)⊗_E D determines a relatively trace-class map C → D.
API RelativeNuclearModule.ofBasic [compatibility]: A sequential colimit of relatively trace-class maps is nuclear; ω₁-compact nuclear modules are basic nuclear.
API RelativeNuclearModule.test [characterisation]: Every compact map from an ω₁-compact relatively compactly generated E-module is relatively trace-class.
API RelativeNuclearModule.motive [compatibility]: Uloc carries these transitions to the left/right trace-class transitions used in Motloc_E rigidity.
example contract RelativeNuclearModule.base [computation]: E as a left E-module is nuclear over itself.
example contract RelativeNuclearModule.zero [degenerate]: The zero E-module is basic nuclear.
example contract RelativeNuclearModule.orderedResolution [compatibility]: For the directed repetition category B of Proposition 3.13 with countable objects and ω₁-compact Homs, Fun(B^op,E) and the transition-fiber kernel are basic nuclear.
-/

/-
NuclearModuleResolution — RefinedTraceMethods:RT.5/nuclear-module-resolution
Kind: construction; implementation unchecked.
For a small E-enriched A, define B with objects (x,n)∈Ob(A)×N and Hom_B((x,n),(y,m))=Hom_A(x,y) for n<m, 1_E for n=m and x=y, and 0 otherwise. Composition uses A’s composition and units. The strongly continuous functor Φ:Fun(B^op,E) → Fun(A^op,E) sends h_(x,n) to h_x. Its kernel C is generated as an E-localizing subcategory by fibers h_(x,n) → h_(x,n+1). Both C and Fun(B^op,E) are nuclear. If Ob(A) is countable and its Homs are ω₁-compact, both are ω₁-compact and basic nuclear.
Required types/inputs: RefinedTraceMethods:RT.5/relative-nuclear-module; EnhancedDerivedSheaves:E5:presentability
API NuclearModuleResolution.repetition [constructor]: Build B with the three stated Hom cases and enriched composition.
API NuclearModuleResolution.quotient [projection]: Φ sends h_(x,n) to h_x and admits fully faithful colimit-preserving right adjoint M(x,n)=M(x).
API NuclearModuleResolution.kernel [characterisation]: ker Φ is generated by the transition fibers.
API NuclearModuleResolution.basicNuclear [compatibility]: Countable Ob(A) and ω₁-compact Homs give an exact resolution by basic nuclear E-modules.
example contract NuclearModuleResolution.empty [degenerate]: For A empty, B and both module categories are zero.
example contract NuclearModuleResolution.oneObject [computation]: For A with one object and endomorphism 1_E, B has Hom(n,m)=1_E for n≤m and 0 for n>m; Φ(h_n)=1_E.
example contract NuclearModuleResolution.nonzeroKernel [non-example]: For the one-object case the fiber h_0 → h_1 is nonzero, although its image under Φ is zero; Φ is a quotient, not an equivalence.
-/

/-
EnrichedDuality — RefinedTraceMethods:RT.5/enriched-duality
Kind: theorem; implementation unchecked.
Let A be enriched over PrL_st and X,Y∈A. Assume 1_X is compact in A(X,X), A(X,Y) is generated by sequential colimits of right trace-class 2-morphisms, and A(Y,X) by sequential colimits of left trace-class 2-morphisms. Then A(X,Y) and A(Y,X) are dualizable, composition A(X,Y)⊗A(Y,X) → A(Y,Y) is strongly continuous, and A(Y,X)∨≃A(X,Y). Evaluation is composition to A(X,X) followed by Map(1_X,−); coevaluation is 1_Y followed by the right adjoint to composition.
Required types/inputs: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/dualizable-categories; EnhancedDerivedSheaves:E5:presentability
-/

/-
Rigidification — RefinedTraceMethods:RT.5/rigidification
Kind: construction; implementation unchecked.
For presentable symmetric monoidal stable D with colimit-preserving tensor, form D^rig as the full subcategory of a size-controlled Ind_κ(D) generated under colimits by Q-indexed ind-objects whose transitions x_i → x_j, i<j, are trace-class. Choose a regular κ that bounds trace-class factorizations and generators. Realization is induced by colimit. If D is locally rigid and the unit is ω₁-compact, D^rig≃Nuc Ind(D), constructed from the essentially small sequential basic nuclear objects. The use of Q rather than N is essential without those extra hypotheses.
Required types/inputs: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/nuclear-objects; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/nuclear-closure
API Rigidification.ofSystem [constructor]: A Q-indexed system with trace-class transitions gives an object in D^rig.
API Rigidification.realize [projection]: Realization D^rig → D sends a system to its colimit and is symmetric monoidal.
API Rigidification.map [functoriality]: Symmetric monoidal colimit-preserving functors induce the rigidification comparison by preservation of trace-class maps.
API Rigidification.sequential [equivalence]: For locally rigid D with ω₁-compact unit, the Q-system envelope is equivalent to the sequential nuclear ind-object category.
example contract Rigidification.zero [degenerate]: The zero trace-class system gives the zero object of D^rig.
example contract Rigidification.constantDualizable [compatibility]: The constant system on a dualizable X belongs to D^rig and realizes to X.
example contract Rigidification.rationalCoefficients [non-example]: The source’s rational-input refined TC⁻ remains the nuclear ind-object A*ku; its ordinary realization does not justify replacing it by ordinary p-completed TC⁻ of the rational input.
-/

/-
KillProAlgebra — RefinedTraceMethods:RT.5/algebra-killing
Kind: construction; implementation unchecked.
In a presentable symmetric monoidal stable C, a κ-small pro-object A=pro-lim_i A_i with left-unital multiplication and unit defines the full subcategory Ind(C)^A of M with extended internal Hom(A,M)=ind-colim_(i,k) Hom_C(A_i,M_k)=0. It has a reflector j*. If A is idempotent and eventually trace-class, the dual ind-object ind-colim_i A_i∨ is nuclear and idempotent and there is a cofiber ind-colim_i A_i∨ → 1 → j*(1). The reflector is then symmetric monoidal, j*(1) an idempotent E∞ algebra, and j*(M)≃M⊗j*(1). The ordinary-object version uses Hom_C(A,−)=0 and requires stabilization or sequential-Hom commutation for its iterative formula.
Required types/inputs: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/nuclear-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/nuclear-closure
API KillProAlgebra.unit [projection]: The localization unit 1 → kill(A)=j*(1) fits into the stated cofiber.
API KillProAlgebra.orthogonal [characterisation]: Local objects are exactly those with extended internal Hom(A,M)=0.
API KillProAlgebra.lift [universal-property]: Maps from j*(M) to a local U identify with maps from M to U.
API KillProAlgebra.tensor [structure]: For idempotent eventually trace-class pro A, j*(M)≃M⊗kill(A), kill(A)⊗kill(A)≃kill(A).
API KillProAlgebra.map [functoriality]: Symmetric monoidal functors preserve the killing construction in the eventual trace-class idempotent setting.
example contract KillProAlgebra.killZero [degenerate]: kill(0)≃1 and j* is the identity.
example contract KillProAlgebra.killUnit [computation]: kill(1)≃0 and the local subcategory is zero.
example contract KillProAlgebra.ordinaryLocalization [compatibility]: For C=D(Z), killing the constant dualizable algebra Z/p yields the ordinary derived p-inverted unit Z[1/p]; the iterative construction and map Z → Z[1/p] agree with derived scalar localization.
-/

/-
SmoothProperCategory — RefinedTraceMethods:RT.5/smooth-proper-category
Kind: definition; implementation unchecked.
Let E be rigid symmetric monoidal and X a dualizable E-module with relative dual X∨. Smoothness means the relative coevaluation E → X∨⊗_E X is strongly continuous; equivalently the absolute coevaluation takes the sphere to a compact object. Properness means the relative evaluation X⊗_E X∨ → E is strongly continuous. Both together say that X is dualizable in the monoidal category Catdual_E with strongly continuous morphisms. For an algebra model Mod_A over a compactly generated rigid base, smoothness is compactness of the diagonal A-bimodule and properness is compactness of A as an E-object. Preservation of compact objects alone is not used as a criterion for an arbitrary dualizable category.
Required types/inputs: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability
API SmoothProperCategory.evaluation [data]: The relative evaluation is strongly continuous exactly under properness.
API SmoothProperCategory.coevaluation [data]: The relative coevaluation is strongly continuous exactly under smoothness.
API SmoothProperCategory.algebraCriterion [characterisation]: For an algebra model, smoothness is compactness of the diagonal as an A-bimodule and properness is compactness of A over E.
API SmoothProperCategory.refinedValue [compatibility]: For smooth proper X, Tref(X)≃constant T(X). Supplied by RefinedTraceMethods:RT.5/smooth-proper-normalization.
example contract SmoothProperCategory.unit [degenerate]: The E-linear unit category E is smooth and proper over E.
example contract SmoothProperCategory.field [computation]: Perf(k) after Ind is smooth and proper over Mod_k with its diagonal k.
example contract SmoothProperCategory.polynomialNotProper [non-example]: Mod_(k[x]) is smooth over Mod_k but is not proper, since k[x] is not compact as a k-module.
-/

/-
RefinedBaseChange — RefinedTraceMethods:RT.5/refined-base-change
Kind: theorem; implementation unchecked.
Let E → X be strongly continuous symmetric monoidal with E and X rigid and X smooth and proper over E. Forgetting X-linearity in Catdual preserves trace-class morphisms, so the refined functors computed over X and over E have their comparison induced by this map. For an additional symmetric monoidal colimit-preserving X → X′ and a dualizable algebra V₀ in X, the kernel V of X → X^{V₀} satisfies V⊗_X X′≃V′. The pro-algebra killing comparison is preserved after applying a symmetric monoidal functor when its transitions are eventually trace-class.
Required types/inputs: RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/smooth-proper-normalization
-/

/-
LocalizationTowerFormula — RefinedTraceMethods:RT.5/localization-tower-formula
Kind: theorem; implementation unchecked.
Let E → X be as in the smooth proper base-change theorem, and T:Motloc_E → D symmetric monoidal colimit-preserving with D locally rigid and ω₁-compact unit. Let V₀ ← V₁ ← … be E₁-algebras in X, each dualizable and in thick⊗(V₀), such that V_(r+1)⊗V_r → V_r⊗V_r factors through multiplication V_(r+1)⊗V_r → V_r as a V_(r+1)–V_r bimodule map. For U={M | Hom_X(V₀,M)=0}, pro T(RMod_(V_r)(X)) is idempotent and eventually trace-class and Tref(U)≃kill(pro T(RMod_(V_r)(X))) as a T(X)-algebra. Thus ind-colim_r T(RMod_(V_r)(X))∨ → T(X) → Tref(U) is a cofiber in Nuc Ind(D).
Required types/inputs: RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/refined-base-change; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/smooth-proper-category; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality
-/

/-
RefinedTraces — RefinedTraceMethods:RT.5/refined-traces
Kind: construction; implementation unchecked.
For an E∞ ring k, refine the symmetric monoidal localizing relative THH functor Motloc_k → Mod_k(Sp)^BS¹, keeping its coherent circle action. The ordinary comparison is realization in that target. For complex orientable k and a chosen orientation t∈π_(−2)k^hS¹, refine TC⁻ into nuclear ind-objects of derived t-complete k^hS¹-modules with t-completed tensor. MW Lemma 3.2 identifies coherent circle k-modules with this completed module category. Finite-coefficient and rational-input computations use the induced maps between motives, units and localization cofibers.
Required types/inputs: RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/localization-tower-formula; RefinedTraceMethods:RT.2; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/smooth-proper-normalization; RefinedTraceMethods:RT.5/circle-completion-equivalence
API RefinedTraces.thh [constructor]: THHref takes k-linear motives to the rigidification of coherent S¹ k-modules.
API RefinedTraces.tcMinus [constructor]: For oriented k, TC−,ref is the corresponding nuclear derived t-complete module object.
API RefinedTraces.ordinary [projection]: Realization gives natural multiplicative maps from refined values to ordinary THH/TC⁻.
API RefinedTraces.map [functoriality]: Maps of k-linear motives induce coherent circle maps and the completed TC⁻ maps, with identity and composition.
API RefinedTraces.fixedPointComparison [equivalence]: Homotopy S¹ fixed points are symmetric monoidal between coherent k-modules and t-complete k^hS¹-modules under the complex-orientation hypothesis. Supplied by RefinedTraceMethods:RT.5/circle-completion-equivalence.
example contract RefinedTraces.zeroMotive [degenerate]: Both refined invariants of the zero motive are zero.
example contract RefinedTraces.unitMotive [computation]: For the smooth proper unit Mod_k, THHref is constant k with trivial circle action and TC−,ref is constant k^hS¹ in its complete module target.
example contract RefinedTraces.rationalKu [non-example]: TC−,ref((ku⊗Q)/ku) has the nonzero source coefficient ind-algebra A*ku; ordinary p-completed rational THH does not determine it.
-/

/-
TorsionQhodge — RefinedTraceMethods:RT.5/torsion-qhodge
Kind: comparison; implementation unchecked.
Choose the compatible E₁ quotient spectra S/m for high-powered m. Then TC⁻((ku⊗S/m)/ku) and TC⁻((KU⊗S/m)/KU) are even; their even homotopy identifies with respectively Fil*qHdg(derived qdR(Z/m)/Z) over Z[β][[t]], and qHdg(derived qdR(Z/m)/Z)[β±¹] over Z[[q−1]]. Both carry the chosen even filtration, the specified E₁-induced multiplicative data, and quotient transition maps. Any p=2 application requires RT.4’s separate E₁ even-resolution input; Wagner’s general theorem with 2 invertible and a connective spherical E₂ lift alone does not supply it.
Required types/inputs: RefinedTraceMethods:RT.5/high-powered; StableHomotopyKTheory:H.6; RefinedTraceMethods:RT.4:topological; RefinedTraceMethods:RT.4:q-Hodge; RefinedTraceMethods:RT.4:Habiro-comparison; HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations; HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex; HabiroCohomologyFoundations:HQ.3
-/

/-
EvenDerivedHom — RefinedTraceMethods:RT.5/even-derived-hom
Kind: theorem; implementation unchecked.
For an even E₁ ring k and even k-modules M,N, RHom_k(M,N) has the source’s complete exhaustive decreasing filtration with gr^n ≃ Σ^(2n) RHom_(π2*k)(π2*M,π2*N)(−n) in graded derived modules. Use the double-speed Whitehead filtrations, derived rather than ordinary Hom, and the source’s connectivity bounds to prove completeness/exhaustiveness; no degeneration is asserted without the subsequent Ext-amplitude calculation.
Required types/inputs: StableHomotopyKTheory:H.6; RefinedTraceMethods:RT.2; EnhancedDerivedSheaves:E5:presentability
-/

/-
TorsionDuality — RefinedTraceMethods:RT.5/torsion-duality
Kind: theorem; implementation unchecked.
For high-powered m, the k^hS¹-linear duals of TC⁻((k/m)/k), k=ku or KU, have only odd homotopy and are computed by Ext¹ of the corresponding even graded q-Hodge module over the derived-complete graded coefficient ring; all other Ext groups contributing to the filtration vanish in this calculation. The ku coefficient ring is Z[β][[t]] and the KU coefficient ring Z[[q−1]][β±¹].
Required types/inputs: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom
-/

/-
EvenCompletedTensor — RefinedTraceMethods:RT.5/even-completed-tensor
Kind: theorem; implementation unchecked.
Let k be an even E∞ ring spectrum and t∈π_(2*)k a homogeneous element. For even k-modules M,N, the t-completed tensor M⊗̂_k N admits a complete exhaustive double-speed Whitehead filtration whose graded pieces are the double shearing of the derived t-completed graded tensor of π_(2*)M and π_(2*)N over π_(2*)k. The construction is functorial and compatible with products under its source hypotheses. The proof tracks connectivity and the at-most-one-degree loss in coconnectivity under derived completion; tensor is not assumed t-exact or underived.
Required types/inputs: RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.2; EnhancedDerivedSheaves:E5:presentability
-/

/-
ProQhodgeIdempotence — RefinedTraceMethods:RT.5/pro-qhodge-idempotence
Kind: theorem; implementation unchecked.
The inverse systems of even graded TC⁻ coefficients in the ku and KU finite-coefficient calculations are idempotent pro-algebras. Idempotence follows by factoring m³ → m² coefficient transition products through multiplication as bimodule maps using the compatible Moore-algebra tower. In the derived graded completed setting the resulting tensor comparison has amplitude [0,1] and its identification with spectrum homotopy is justified by the even Whitehead filtration.
Required types/inputs: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-completed-tensor; StableHomotopyKTheory:H.6
-/

/-
GradedTraceClass — RefinedTraceMethods:RT.5/graded-trace-class
Kind: theorem; implementation unchecked.
For high-powered m the map from the m³ finite-coefficient graded q-Hodge algebra to the m algebra is trace-class over Z[β][[t]] (ku) or Z[[q−1]] (KU), in the derived-complete category. The corresponding spectrum classifier passes to the graded classifier because its dual-tensor has amplitude [−1,0].
Required types/inputs: RefinedTraceMethods:RT.5/torsion-duality; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/trace-class; StableHomotopyKTheory:H.6
-/

/-
AlmostModuleKTheory — RefinedTraceMethods:RT.5/almost-module-k
Kind: application; implementation unchecked.
Let A be a commutative Banach ring with topologically nilpotent unit T and compatible n-th roots for an unbounded increasing sequence n_i. Put I=A_<1. For any commutative unitization B in which I is an ideal, I is flat and idempotent over B (hence Tor-unital), D(B) → D(B/I) is a strongly continuous Verdier localization, and its kernel is the dualizable stable category D(B^a) of almost B-modules relative to I. Kcont(D(B^a))≃fib(K(B) → K(B/I)), independently of B, because this kernel identifies with the derived category of firm I-modules M with M⊗^L_I I≃M. K denotes the imported concrete nonconnective theory.
Required types/inputs: RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/dualizable-categories; GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance
-/

/-
TraceFlatDescent — RefinedTraceMethods:RT.6/trace-flat-descent
Kind: theorem; implementation unchecked.
HH(−/R), HC⁻(−/R), HH(−/R)_hS¹ and HP(−/R) on commutative R-algebras, and THH, TC⁻, THH_hS¹ and TP on commutative rings, are fpqc sheaves in spectra. Their derived p-complete variants have descent for p-completely faithfully flat covers in QSyn; QRSP basis unfolding recovers them. THH(−)^tC_p has the same Čech descent by the finite-group norm sequence. The argument proves this descent with its weak Postnikov towers; it does not assert arbitrary fpqc hyperdescent for every cotangent complex.
Required types/inputs: RefinedTraceMethods:RT.1; RefinedTraceMethods:RT.2; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.5/completed-cotangent-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.1/derived-completion
-/

/-
QrspHochschild — RefinedTraceMethods:RT.6/qrsp-hochschild
Kind: theorem; implementation unchecked.
For S∈qrsPerfd_R, or for a QRSP algebra over a perfectoid R or over Z_p as in Lemma 5.14, let M=(L_(S/R)[−1])^∧p. M is p-completely flat, HH(S/R;Z_p) is even, and π_(2i)HH(S/R;Z_p)≃(Γ^i_S M)^∧p for i≥0. The HKR filtration has these terms; divided powers are over S, not over the perfectoid base R.
Required types/inputs: DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.0/derived-divided-powers; RefinedTraceMethods:RT.1
-/

/-
CyclicDerhamComparison — RefinedTraceMethods:RT.6/cyclic-derham-comparison
Kind: comparison; implementation unchecked.
For quasisyntomic A over a fixed base R in BMS2 §5.2, the unfolded even Postnikov filtrations on p-complete HC⁻ and HP are complete exhaustive multiplicative Z-indexed filtrations, with gr^iHC⁻(A/R;Z_p)≃Hodge^{≥i}(Hodge-completed derived dR(A/R))^∧p[2i] and gr^iHP≃(Hodge-completed derived dR(A/R))^∧p[2i]. On QRSP covers π₀HC⁻ with its abutment filtration identifies with the Hodge-and-p-completed derived dR algebra, including the de Rham differential. This compares existing cyclic objects and existing derived dR, rather than defining a new dR.
Required types/inputs: RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; DerivedDeRhamCohomology:DD.1/filtered-completion; RefinedTraceMethods:RT.1
-/

/-
PerfectoidThh — RefinedTraceMethods:RT.6/perfectoid-thh
Kind: theorem; implementation unchecked.
For perfectoid R, THH(R;Z_p) is even and π_*≃R[u], |u|=2, with π₂ canonically ker θ/(ker θ)². For a perfectoid map R → R′ the scalar-extension map π_*THH(R;Z_p)⊗_R R′ → π_*THH(R′;Z_p) is an isomorphism. A choice of generator ξ of ker θ determines u up to the specified unit change; the canonical line precedes any chosen basis.
Required types/inputs: AInfCohomology:AI.0; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.2; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.1/derived-completion
-/

/-
PerfectoidTcMaps — RefinedTraceMethods:RT.6/perfectoid-tc-maps
Kind: theorem; implementation unchecked.
For perfectoid R let A=Ainf(R), θ:A → R, ξ generate ker θ, and θ̃=θ∘φ⁻¹. With compatible generators, π_*TC⁻(R;Z_p)=P(A,ξ), π_*TP=A[σ±¹], and π_*THH(R;Z_p)^tC_p=R[σ±¹]. The canonical map TC⁻ → TP is A-linear and u↦ξσ,v↦σ⁻¹; the cyclotomic Frobenius is φ-semilinear and u↦σ,v↦φ(ξ)σ⁻¹. The vertical maps to THH and THH^tC_p use θ and θ̃ respectively. π₀TC⁻≃Ainf is canonical and Frobenius-compatible, although chosen generators depend on ξ.
Required types/inputs: RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/uv-presentation; AInfCohomology:AI.0; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.2
-/

/-
PerfectoidQuotientComparison — RefinedTraceMethods:RT.6/perfectoid-quotient-comparison
Kind: comparison; implementation unchecked.
For any connective E∞ R-algebra A over a perfectoid R, the derived quotients TC⁻(A;Z_p)/v ≃ THH(A;Z_p) and TP(A;Z_p)/φ(ξ) ≃ THH(A;Z_p)^tC_p are equivalences as modules with their induced maps. Quotient by v means the cofiber of its degree −2 multiplication map, not an ordinary ideal quotient on homotopy groups.
Required types/inputs: RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.2
-/

/-
ThhHochschildDeformation — RefinedTraceMethods:RT.6/thh-hochschild-deformation
Kind: theorem; implementation unchecked.
For ordinary R-algebra A with R perfectoid, the class u∈π₂TC⁻(R;Z_p) induces coherent S¹-equivariant cofiber sequences THH(A;Z_p)[2] →^u THH(A;Z_p) → HH(A/R;Z_p), TC⁻(A;Z_p)[2] →^u TC⁻(A;Z_p) → HC⁻(A/R;Z_p), and TP(A;Z_p)[2] →^(ξσ) TP(A;Z_p) → HP(A/R;Z_p). These are maps and cofibers before passing to homotopy groups.
Required types/inputs: RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.1; RefinedTraceMethods:RT.2
-/

/-
Antisymmetrization — RefinedTraceMethods:RT.6/antisymmetrization
Kind: construction; implementation unchecked.
For ordinary perfectoid R-algebra A, define the natural graded R-algebra map H⁰((Ω*_(A/R))^∧p) → π_*THH(A;Z_p), with Ω^i placed in degree i. It extends the degree-one Hochschild comparison and multiplies differential classes by the exterior product. Derived p-completion is applied termwise before H⁰; arbitrary ordinary p-completion of Ω does not replace it.
Required types/inputs: RefinedTraceMethods:RT.6/thh-hochschild-deformation; RefinedTraceMethods:RT.1; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.1/derived-completion
API Antisymmetrization.differential [constructor]: For a∈A, the completed relative da has its degree-one THH image.
API Antisymmetrization.wedge [relation]: The image of ω∧η is the product of their images in THH, with graded signs and odd squares zero.
API Antisymmetrization.map [functoriality]: For R-algebra maps A → B, the differential and THH maps commute.
API Antisymmetrization.unit [simp]: The degree-zero map is the canonical A → π₀THH(A;Z_p).
example contract Antisymmetrization.polynomialDx [computation]: For A=R[x], dx maps to the degree-one generator identified by τ≤2THH → τ≤2HH.
example contract Antisymmetrization.baseRing [degenerate]: For A=R all positive relative forms and their images are zero.
example contract Antisymmetrization.oddSquare [characterisation]: For A=R[x], the image of dx squares to zero, including for p=2.
-/

/-
QuasismoothThhFiltration — RefinedTraceMethods:RT.6/quasismooth-thh-filtration
Kind: theorem; implementation unchecked.
For a p-completely quasismooth R-algebra A, antisymmetrization induces (Ω*_(A/R))^∧p⊗_R π_*THH(R;Z_p) ≃ π_*THH(A;Z_p). For every p-complete R-algebra A, left Kan extension gives the complete decreasing cotangent filtration of Corollary 6.10, with n-th graded term the sum of (derived ∧^j_A L_(A/R))^∧p[n] for 0≤j≤n and j≡n mod 2. Its n-th filtration term is n-connective.
Required types/inputs: RefinedTraceMethods:RT.6/antisymmetrization; RefinedTraceMethods:RT.6/perfectoid-thh; DerivedDeRhamCohomology:DD.0/cotangent-complex; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation
-/

/-
QrspEvenThh — RefinedTraceMethods:RT.6/qrsp-even-thh
Kind: theorem; implementation unchecked.
For S∈QRSPerfd with perfectoid R → S and M=(L_(S/R)[−1])^∧p, THH(S;Z_p) is even and multiplication by u injects π_(2i−2) into π_(2i). Each π_(2i) is p-completely flat and has a finite increasing filtration with graded (Γ^j_S M)^∧p for 0≤j≤i. Equivalently the quotient by u identifies its top graded term with even HH(S/R). This evenness is a statement on QRSP covers, not on all quasisyntomic A.
Required types/inputs: RefinedTraceMethods:RT.6/quasismooth-thh-filtration; RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/thh-hochschild-deformation; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings
-/

/-
QrspTcNygaard — RefinedTraceMethods:RT.6/qrsp-tc-nygaard
Kind: theorem; implementation unchecked.
For S as in the preceding QRSP theorem, TC⁻ and TP are even and can:π_*TC⁻ → π_*TP is injective, an isomorphism in degrees ≤0. Their π₀ coincide as a (p,ξ)-complete ring C_S with complete descending multiplicative N-indexed filtration N^{≥i}C_S = image(v^i·π_(2i)TC⁻ → π₀TP). N^iC_S≃π_(2i)THH; Frobenius carries N^{≥i} into φ(ξ)^i C_S, defining divided maps. ξ is regular on C_S and C_S/ξ≃Hodge-and-p-completed derived dR(S/R).
Required types/inputs: RefinedTraceMethods:RT.6/qrsp-even-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/cyclic-derham-comparison; DerivedDeRhamCohomology:DD.1/filtered-completion
-/

/-
TraceNygaardComplex — RefinedTraceMethods:RT.6/trace-nygaard-complex
Kind: construction; implementation unchecked.
For quasisyntomic A over perfectoid R, let C_A be the symmetric monoidal QRSP-basis unfolding of S ↦ π₀TC⁻(S;Z_p) with its abutment Nygaard filtration. It is an E∞ Ainf(R)-algebra in the complete filtered derived category, (p,ξ)-complete, with φ-semilinear Frobenius and complete descending multiplicative N-filtration. N^i C_A is an A-complex with increasing graded (∧^j_A L_(A/R))^∧p[−j], 0≤j≤i, and C_A/ξ≃Hodge-completed derived dR(A/R)^∧p. Global QSyn construction uses the same intrinsic basis sheaf and the trace twists; prismatic identification is a separate comparison theorem.
Required types/inputs: RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.1/filtered-completion; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; AInfCohomology:AI.0
API TraceNygaardComplex.basisValue [simp]: For QRSP S, evaluation recovers π₀TC⁻(S;Z_p) with its Nygaard submodules.
API TraceNygaardComplex.map [functoriality]: Quasisyntomic algebra maps give filtered E∞ maps with coherent identity and composition.
API TraceNygaardComplex.frobenius [data]: Frobenius is φ-semilinear and N^{≥i} maps into φ(ξ)^i C_A over a perfectoid base.
API TraceNygaardComplex.specialize [equivalence]: C_A⊗^L_(Ainf,θ) R≃Hodge-completed derived dR(A/R)^∧p.
API TraceNygaardComplex.graded [compatibility]: N^i C_A≃gr^iTHH(A;Z_p)[−2i] with the finite cotangent filtration.
example contract TraceNygaardComplex.perfectoid [computation]: For A=R, C_A=Ainf(R) with its Witt Frobenius and ideal-power Nygaard filtration.
example contract TraceNygaardComplex.baseRelativeDerham [degenerate]: For A=R, specialization by θ is R, since relative derived dR(R/R)=R.
example contract TraceNygaardComplex.thetaNotThetaTilde [non-example]: The de Rham specialization uses θ and ξ; replacing ξ by φ(ξ) without the corresponding Frobenius twist does not give the stated map.
-/

/-
SmoothTraceFrobenius — RefinedTraceMethods:RT.6/smooth-trace-frobenius
Kind: theorem; implementation unchecked.
For A the p-adic completion of a smooth perfectoid R-algebra of relative dimension d, N^i C_A lies in D^[0,max(i,d)] and N^{≥i} C_A in D^[0,d] for i≥0. H⁰(C_A) has no φ^r(ξ)-torsion for r∈Z. Frobenius linearization factors naturally C_A → Lη_ξ φ_* C_A, and iteration gives C_A → Lη_(ξ_r) φ_*^r C_A, where ξ_r=ξ·φ⁻¹(ξ)···φ^(−r+1)(ξ). This factorization is not asserted to be an equivalence until the smooth O_C comparison.
Required types/inputs: RefinedTraceMethods:RT.6/trace-nygaard-complex; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction; AInfCohomology:AI.0; AInfCohomology:AI.1/filtered-beilinson-description
-/

/-
TraceNoncompletedExtension — RefinedTraceMethods:RT.6/trace-noncompleted-extension
Kind: construction; implementation unchecked.
For p-completed smooth R-algebras, start from C_A and left Kan extend in (p,ξ)-complete Ainf(R)-complexes to all p-complete animated commutative R-algebras, using E5’s polynomial/sifted resolution. Write Cnc_(A/R) for the resulting E∞ functor. Its θ-specialization is p-completed derived dR(A/R) without Hodge completion; it is a quasisyntomic sheaf, discrete on QRSP algebras. Its dependence on the chosen perfectoid R is retained until the trace-to-prismatic comparison. Cnc is not a second generic prismatic Δ.
Required types/inputs: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation; DerivedDeRhamCohomology:DD.1/derived-completion; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.2/hodge-completed-derham
API TraceNoncompletedExtension.ofSmooth [compatibility]: For p-completed smooth R-algebra A, Cnc_(A/R)≃C_A.
API TraceNoncompletedExtension.extend [universal-property]: It is the sifted left Kan extension from the smooth/polynomial presentation in (p,ξ)-complete E∞ complexes.
API TraceNoncompletedExtension.map [functoriality]: Animated R-algebra maps give E∞ maps, coherently.
API TraceNoncompletedExtension.specialize [equivalence]: Cnc_(A/R)/ξ≃derived p-completed dR(A/R) without Hodge completion.
example contract TraceNoncompletedExtension.base [degenerate]: Cnc_(R/R)≃Ainf(R) and its θ-specialization is R.
example contract TraceNoncompletedExtension.smoothPolynomial [compatibility]: For the p-completed polynomial algebra R[x], Cnc agrees with C_A and has the ordinary p-completed de Rham specialization.
example contract TraceNoncompletedExtension.qrspDiscreteness [characterisation]: For QRSP S over R, Cnc_(S/R) is concentrated in cohomological degree zero; this does not identify it with C_S before Nygaard completion.
-/

/-
MotivicFiltration — RefinedTraceMethods:RT.6/motivic-filtrations
Kind: construction; implementation unchecked.
For X=THH,TC⁻,TP and quasisyntomic A, define Fil^nX(A;Z_p) by QRSP-basis unfolding of τ_(≥2n)X(−;Z_p), for n∈Z, and define Fil^nTC as the fiber of φ−can on the filtered TC⁻ and TP spectra. These are functorial complete exhaustive decreasing multiplicative filtrations in spectra; Frobenius/can retain their coherent source maps. The underlying realization is the p-completed trace spectrum by descent. THH is locally even on covers but its unfolded graded complexes have nonzero cohomological degrees.
Required types/inputs: RefinedTraceMethods:RT.6/qrsp-even-thh; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.1/filtered-completion; RefinedTraceMethods:RT.2
API MotivicFiltration.piece [data]: Fil^nX(A) is QRSP unfolding of τ_(≥2n)X with its maps Fil^(n+1) → Fil^n.
API MotivicFiltration.realize [equivalence]: colim_(n→−∞)Fil^nX(A)≃X(A;Z_p).
API MotivicFiltration.complete [characterisation]: lim_(n→+∞)Fil^nX(A)=0.
API MotivicFiltration.product [structure]: Fil^iX⊗Fil^jX → Fil^(i+j)X is coherently associative and unital.
API MotivicFiltration.map [functoriality]: Algebra maps induce filtered maps that commute with products, can and Frobenius.
example contract MotivicFiltration.perfectoidPostnikov [computation]: For perfectoid R, Fil^nTHH(R)=τ_(≥2n)THH(R); for n≤0 it is all THH(R).
example contract MotivicFiltration.qrsp [compatibility]: For QRSP S, Fil^nTC⁻(S) and Fil^nTP(S) agree with double-speed Postnikov truncation.
example contract MotivicFiltration.polynomialOdd [non-example]: For a smooth one-variable perfectoid-base algebra the differential class has odd homotopical degree; local evenness does not remove it.
-/

/-
FilteredInvertibility — RefinedTraceMethods:RT.6/filtered-invertibility
Kind: theorem; implementation unchecked.
Let A be a complete N-filtered E∞ algebra in the complete filtered derived category, and M,N complete N-filtered A-modules. Assume the natural maps gr⁰M⊗_(gr⁰A)gr*A → gr*M and gr⁰N⊗_(gr⁰A)gr*A → gr*N are equivalences. If a filtered pairing η:M⊗̂_A N → A induces an equivalence gr⁰M⊗_(gr⁰A)gr⁰N → gr⁰A, then η is an equivalence and M,N are inverse invertible modules in the complete filtered category. The tensor is the completed filtered tensor; the base-change equivalences are essential hypotheses.
Required types/inputs: DerivedDeRhamCohomology:DD.1/filtered-completion; EnhancedDerivedSheaves:E5:presentability
-/

/-
TraceBreuilKisinTwist — RefinedTraceMethods:RT.6/trace-breuil-kisin-twist
Kind: construction; implementation unchecked.
Let C_A=gr⁰TP(A;Z_p). Define the trace line C_A{1}=gr¹TP(A;Z_p)[−2] with its unfolded Nygaard filtration; multiplication and the inverse-degree TP line make it invertible in the completed filtered category. Tensor powers define C_A{i} for i∈Z. Under trace-to-prismatic comparison it identifies with the imported PR.3 Breuil–Kisin twist. On a perfectoid base, π₂TP is an invertible Ainf module and its θ̃-specialization is ker θ/(ker θ)²; its θ-specialization is canonically R. A choice of periodic generator trivializes it, rather than producing a global canonical untwisted object.
Required types/inputs: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/filtered-invertibility; RefinedTraceMethods:RT.6/perfectoid-tc-maps; PrismaticCohomology:PR.3/breuil-kisin-twist; AInfCohomology:AI.0
API TraceBreuilKisinTwist.line [constructor]: The filtered invertible C_A-module gr¹TP(A)[−2].
API TraceBreuilKisinTwist.power [structure]: Tensor powers and duals yield C_A{i} with coherent C_A{i}⊗C_A{j}≃C_A{i+j}.
API TraceBreuilKisinTwist.specialize [equivalence]: Over perfectoid R, the θ specialization of the line is R and θ̃ specialization is ker θ/(ker θ)².
API TraceBreuilKisinTwist.prismatic [compatibility]: Through the filtered trace/prismatic equivalence, the trace line agrees with the supplied PR.3 Breuil–Kisin twist.
example contract TraceBreuilKisinTwist.weightZero [degenerate]: C_A{0}≃C_A as a filtered module.
example contract TraceBreuilKisinTwist.perfectoidLine [computation]: For R perfectoid, C_R{1} has underlying line π₂TP(R), and θ̃ gives the conormal line.
example contract TraceBreuilKisinTwist.noGlobalBasis [non-example]: The definition contains the filtered invertible line and descent cocycle, not a freely chosen equality C_A{1}=C_A for every quasisyntomic A.
-/

/-
Bms1TwistComparison — RefinedTraceMethods:RT.6/bms1-twist-comparison
Kind: comparison; implementation unchecked.
For p-torsion-free perfectoid R, the trace line Ainf(R){1}=π₂TP(R;Z_p) agrees with BMS1’s Breuil–Kisin–Fargues twist. The finite θ̃_r specialization is ker θ̃_r/(ker θ̃_r)², and the natural transition on the conormal side corresponds to p times the transition on the twist side. The inverse-limit comparison uses the canonical Ainf≃lim_F W_r(R), retaining Frobenius and finite TR maps.
Required types/inputs: RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; AInfCohomology:AI.0; AInfCohomology:AI.4; RefinedTraceMethods:RT.2
-/

/-
FilteredFrobenius — RefinedTraceMethods:RT.6/filtered-frobenius
Kind: construction; implementation unchecked.
The cyclotomic Frobenius and canonical comparison of RT.2 induce multiplicative filtered maps φ,can:TC⁻(A;Z_p) → TP(A;Z_p) on quasisyntomic A. Under the completed prismatic comparison their i-th graded maps are respectively the supplied divided Frobenius and canonical Nygaard inclusion on C_A{i}[2i]. Define the filtered TC spectrum by the fiber of φ−can in spectra. Its multiplication is the coherent equalizer/fiber multiplication, not subtraction in the category of E∞ algebras.
Required types/inputs: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; PrismaticCohomology:PR.3/divided-frobenius; RefinedTraceMethods:RT.2
API FilteredFrobenius.can [data]: The filtered canonical TC⁻ → TP map induces Nygaard inclusion on graded pieces.
API FilteredFrobenius.frobenius [data]: The filtered cyclotomic map induces divided Frobenius after twisting.
API FilteredFrobenius.fiber [constructor]: TC filtered pieces are fib(φ−can) in spectra.
API FilteredFrobenius.product [structure]: The coherent multiplicative equalizer supplies products of weights i,j in weight i+j.
API FilteredFrobenius.map [functoriality]: These filtered maps and fibers are natural in quasisyntomic A.
example contract FilteredFrobenius.weightZero [degenerate]: On perfectoid weight zero, φ−can=φ−id on Ainf.
example contract FilteredFrobenius.differentMaps [non-example]: For R=F_p, can(u)=pσ while φ(u)=σ; the maps cannot be identified.
example contract FilteredFrobenius.syntomicSquare [compatibility]: The i-th graded fiber map agrees with PR.4’s syntomic fiber, including its divided Frobenius and twist.
-/

/-
MotivicConvergence — RefinedTraceMethods:RT.6/motivic-convergence
Kind: theorem; implementation unchecked.
The complete exhaustive filtered spectra give the BMS2 derived convergent spectral sequences E₂^(a,b)=H^(a−b)(N^(−b)C_A) ⇒ π_(−a−b)THH, E₂^(a,b)=H^(a−b)(N^{≥−b}C_A{−b}) ⇒ π_(−a−b)TC⁻, E₂^(a,b)=H^(a−b)(C_A{−b}) ⇒ π_(−a−b)TP, and E₂^(a,b)=H^(a−b)(Z_p(−b)(A)) ⇒ π_(−a−b)TC in their defined weight range. The unbounded cases mean convergence to the supplied derived complete filtration; no unconditional strong convergence after forgetting derived limits is claimed. On p-completed smooth finite-dimensional perfectoid-base algebras, the stated cohomological bounds give degreewise control of the inverse-limit terms.
Required types/inputs: RefinedTraceMethods:RT.6/graded-motivic-comparison; RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/smooth-trace-frobenius; StableHomotopyKTheory:H.6
-/

/-
TcNegativeDegrees — RefinedTraceMethods:RT.6/tc-negative-degrees
Kind: theorem; implementation unchecked.
For a connective ring spectrum A, π_iTC(A;Z_p)=0 for i<−1 by the classical TR connective comparison. For ordinary A, π_(−1)TC(A;Z_p)=coker(F−1:W(A) → W(A)). On the QRSP site this cokernel vanishes locally by the iterated Artin–Schreier covers, so the weight-zero TC fiber is locally in degree zero and negative motivic weights vanish. Identifying the resulting weight-zero sheaf with constant Z_p by K₀ is owned downstream and is not used here.
Required types/inputs: RefinedTraceMethods:RT.2; RefinedTraceMethods:RT.6/syntomic-graded-tc; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.5/quasisyntomic-site
-/

/-
CrystallineTraceComparison — RefinedTraceMethods:RT.6/crystalline-trace-comparison
Kind: theorem; implementation unchecked.
For a quasiregular semiperfect F_p-algebra S, C_S≃Nygaard-completed Acrys(S)≃Nygaard-completed derived de Rham–Witt LWΩ_S as filtered Frobenius E∞ algebras. The cyclotomic and algebra Frobenius agree; modulo p this is x↦x^p. The comparison uses the independent PD/derived de Rham–Witt constructions imported from DD.4. On a smooth algebra over a perfect field k, unfolding identifies C_A with the derived de Rham–Witt object and its Nygaard completion; completeness must be retained.
Required types/inputs: RefinedTraceMethods:RT.6/group-algebra-trace-test; RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; DerivedDeRhamCohomology:DD.4/derived-de-rham-witt; DerivedDeRhamCohomology:DD.4/acrys-structure; DerivedDeRhamCohomology:DD.4/qrsp-pd-derham; PrismaticCohomology:PR.3/nygaard-completion
-/

/-
GroupAlgebraTraceTest — RefinedTraceMethods:RT.6/group-algebra-trace-test
Kind: theorem; implementation unchecked.
Let S=F_p[Q_p/Z_p]=F_p[T^(±1/p∞)]/(T−1). The coherent circle-equivariant equivalence THH(S)≃HH(Z[Q_p/Z_p])⊗_Z THH(F_p) induces TP(S)≃HP(Z[Q_p/Z_p];Z_p) as E∞ ring spectra. Consequently π₀TP(S)≃Nygaard-completed Acrys(S), compatibly with the Hodge/Nygaard filtrations, mod-p reduction and Frobenius. For connective circle-equivariant M∈D(Z), (M⊗_Z THH(F_p))^tS¹ is the p-completion of M^tS¹.
Required types/inputs: RefinedTraceMethods:RT.6/cyclic-derham-comparison; DerivedDeRhamCohomology:DD.4/derived-de-rham-witt; DerivedDeRhamCohomology:DD.4/acrys-structure; DerivedDeRhamCohomology:DD.4/qrsp-pd-derham; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.1; RefinedTraceMethods:RT.2
-/

/-
SegalCharP — RefinedTraceMethods:RT.6/segal-char-p
Kind: theorem; implementation unchecked.
For a smooth k-algebra A of dimension d over a perfect field k of characteristic p, gr^iTHH(A;Z_p)≃τ^{≤i}Ω*_A/k[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω*_A/k[2i]. Cyclotomic Frobenius is the natural truncation inclusion on these graded pieces, and THH(A;Z_p) → THH(A;Z_p)^tC_p induces isomorphisms on π_n for n≥d. The finite-Tate filtration is obtained by quasisyntomic unfolding.
Required types/inputs: RefinedTraceMethods:RT.6/crystalline-trace-comparison; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; DerivedDeRhamCohomology:DD.3/smooth-cartier
-/

/-
AlmostRootIdeals — RefinedTraceMethods:RT.6/almost-root-ideals
Kind: theorem; implementation unchecked.
In Notation 9.1, let C/Q_p be a perfectoid field containing all p-power roots of unity, choose ε and set μ=[ε]−1 in Ainf=W(O_C^flat). For d≥1 set J_d=union_(r≥0)(φ^(−r)(μ)^d). Then J_d⊂J_1⊂W(m_C^flat), p is a nonzerodivisor on Ainf/J_d, and the p-adic completion of every J_d is W(m_C^flat). The almost category is the symmetric monoidal quotient by complexes whose cohomology is annihilated by W(m_C^flat), imported from AI.0.
Required types/inputs: AInfCohomology:AI.0; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction
-/

/-
AlmostDecalageLimit — RefinedTraceMethods:RT.6/almost-decalage-limit
Kind: theorem; implementation unchecked.
For p-complete K∈D^{≥0}(Ainf) with H⁰(K) torsion-free, and ξ_r=μ/φ^(−r)(μ), every cohomology group of cofib(Lη_μK → Rlim_r Lη_(ξ_r)K) is killed by W(m_C^flat). The map is an equivalence in the imported almost category; an honest equivalence is not asserted.
Required types/inputs: RefinedTraceMethods:RT.6/almost-root-ideals; AInfCohomology:AI.0; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/preservation-derived-completeness
-/

/-
AlmostFreeElements — RefinedTraceMethods:RT.6/almost-free-elements
Kind: theorem; implementation unchecked.
If M is the (p,ξ)-completion of a free Ainf-module, M → Hom_Ainf(W(m_C^flat),M) is an isomorphism. Moreover RHom_Ainf(W(m_C^flat),−) kills all almost-zero complexes and defines the right adjoint to the almost quotient. This is a statement about this completed-free class, not about every Ainf-module.
Required types/inputs: AInfCohomology:AI.0; DerivedDeRhamCohomology:DD.1/derived-completion; RefinedTraceMethods:RT.6/almost-root-ideals
-/

/-
AnimatedAomegaExtension — RefinedTraceMethods:RT.6/animated-aomega-extension
Kind: construction; implementation unchecked.
Starting from the AI.4 geometric E∞ Ainf-algebra AΩ_A=Lη_μRΓ(Spf(A)_C,Ainf) on p-adic completions of smooth O_C-algebras, define AΩ^nc on all p-complete animated O_C-algebras by sifted left Kan extension in (p,ξ)-complete E∞ complexes. It has AΩ^nc_A/ξ≃derived p-completed dR(A/O_C) without Hodge completion, is a quasisyntomic sheaf, and is discrete on QRSP O_C-algebras. The geometric AΩ and Lη constructions are imported, not defined anew.
Required types/inputs: AInfCohomology:AI.0; AInfCohomology:AI.4; RefinedTraceMethods:RT.6/trace-noncompleted-extension; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation
API AnimatedAomegaExtension.ofSmooth [compatibility]: On p-completed smooth O_C-algebras the value is the imported geometric AΩ.
API AnimatedAomegaExtension.extend [universal-property]: The functor is the sifted left Kan extension in the (p,ξ)-complete E∞ target.
API AnimatedAomegaExtension.specialize [equivalence]: Modulo ξ the functor is derived p-completed de Rham cohomology without Hodge completion.
API AnimatedAomegaExtension.map [functoriality]: Animated O_C-algebra maps induce coherent E∞ maps.
example contract AnimatedAomegaExtension.base [degenerate]: The base O_C gives Ainf.
example contract AnimatedAomegaExtension.polynomial [compatibility]: On O_C⟨x⟩ the value agrees with the imported geometric AΩ and its ξ-specialization is the p-completed polynomial de Rham complex.
example contract AnimatedAomegaExtension.qrsp [characterisation]: The value on a QRSP O_C-algebra is discrete, while no discreteness is asserted for every animated algebra.
-/

/-
AomegaAlmostComparison — RefinedTraceMethods:RT.6/aomega-almost-map
Kind: construction; implementation unchecked.
For p-adically completed smooth O_C-algebra A, the primitive Frobenius-compatible trace map C_A → RΓ(Spf(A)_C,Ainf) obtained from perfectoid pro-étale values factors naturally through AΩ_A in the almost category of W(m_C^flat). The factorization uses the Frobenius factorization map C_A → Lη_ξφ_*C_A and its iterates; compatibility under varying r gives the map to Rlim Lη_(ξ_r) of the pro-étale complex.
Required types/inputs: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; RefinedTraceMethods:RT.6/almost-decalage-limit; AInfCohomology:AI.4; AInfCohomology:AI.0
API AomegaAlmostComparison.primitive [constructor]: The map C_A → RΓ of the pro-étale Ainf complex is Frobenius-compatible.
API AomegaAlmostComparison.rootFactor [data]: For each r it has a compatible factorization through Lη_(ξ_r).
API AomegaAlmostComparison.almostFactor [constructor]: In the almost quotient, the root-limit comparison gives C_A → AΩ_A.
API AomegaAlmostComparison.map [functoriality]: Smooth O_C-algebra maps commute with the almost comparison.
example contract AomegaAlmostComparison.base [compatibility]: On A=O_C the almost map agrees with the identity of Ainf in the almost quotient.
example contract AomegaAlmostComparison.frobenius [characterisation]: Its composite with Frobenius agrees with Frobenius followed by the map.
example contract AomegaAlmostComparison.honestRequiresExtraction [non-example]: An arbitrary almost equivalence is not declared an honest Ainf equivalence; the completed-free extraction theorem is required.
-/

/-
ProjectiveQrspAomega — RefinedTraceMethods:RT.6/projective-qrsp-aomega
Kind: theorem; implementation unchecked.
If S∈QRSPerfd_(O_C) is projective in the sense of the imported projective quasisyntomic basis, AΩ^nc_S is the (p,ξ)-completion of a free Ainf-module. Consequently AΩ^nc_S → RHom_Ainf(W(m_C^flat),AΩ^nc_S) is an equivalence. Here the special projective basis includes S/p free over O_C/p and (L_(S/O_C)[−1])^∧p projective, not merely an arbitrary QRSP S.
Required types/inputs: RefinedTraceMethods:RT.6/animated-aomega-extension; RefinedTraceMethods:RT.6/almost-free-elements; DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site; DerivedDeRhamCohomology:DD.0/cotangent-complex
-/

/-
CartierComparisonTest — RefinedTraceMethods:RT.6/cartier-comparison-test
Kind: theorem; implementation unchecked.
Let A be the p-adic completion of a smooth O_C-algebra and η an E∞ O_C-algebra endomorphism of its p-completed de Rham complex. If H⁰ of its mod-p reduction is the identity, all cohomology maps of its mod-p reduction are the identity; hence η is an integral equivalence by derived p-completeness. The assertion is not that the integral endomorphism itself is the identity. Cartier and the Bockstein on differential generators give this recognition criterion for the AΩ comparison.
Required types/inputs: DerivedDeRhamCohomology:DD.3/smooth-cartier; DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces; RefinedTraceMethods:RT.6/animated-aomega-extension; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction
-/

/-
AomegaComparison — RefinedTraceMethods:RT.6/aomega-comparison
Kind: theorem; implementation unchecked.
If C is complete algebraically closed over Q_p and A is the p-adic completion of a smooth O_C-algebra, there is a natural Frobenius-compatible equivalence C_A≃AΩ_A of E∞ Ainf-algebras. Its map is obtained by the almost comparison, left Kan extension to projective QRSP covers and completed-free extraction. It agrees modulo ξ with the identity on the p-completed de Rham complex. For arbitrary quasisyntomic A over O_C, comparison with AΩ^nc is made after the indicated Nygaard completion; AΩ^nc_A=C_A is not asserted before completion.
Required types/inputs: RefinedTraceMethods:RT.6/aomega-almost-map; RefinedTraceMethods:RT.6/projective-qrsp-aomega; RefinedTraceMethods:RT.6/cartier-comparison-test; RefinedTraceMethods:RT.6/trace-noncompleted-extension; RefinedTraceMethods:RT.6/animated-aomega-extension; DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site
-/

/-
AomegaNygaardDecalage — RefinedTraceMethods:RT.6/aomega-nygaard-decalage
Kind: comparison; implementation unchecked.
For p-completed smooth O_C-algebra A, the Frobenius factorization C_A≃Lη_ξφ_*C_A identifies the Nygaard filtration with the Lη_ξ filtration on φ_*AΩ_A through the honest comparison. The graded description is the source’s truncation of the Hodge–Tate complex, using the AI.4 BMS1 Theorems 8.3 and 9.4(i) inputs; this is not a new definition of the generic Lη functor.
Required types/inputs: RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/smooth-trace-frobenius; AInfCohomology:AI.4; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/filtered-beilinson-description
-/

/-
SegalOc — RefinedTraceMethods:RT.6/segal-oc
Kind: theorem; implementation unchecked.
For a smooth O_C-algebra A of relative dimension d, p-completed if necessary, gr^iTHH(A;Z_p)≃τ^{≤i}Ω̃_A{i}[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω̃_A{i}[2i], where Ω̃_A is the imported Hodge–Tate complex. On graded pieces cyclotomic Frobenius is the truncation inclusion, and it is an isomorphism on π_n for n≥d.
Required types/inputs: RefinedTraceMethods:RT.6/aomega-nygaard-decalage; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; AInfCohomology:AI.4
-/

/-
AdamsOperations — RefinedTraceMethods:RT.6/adams-operations
Kind: construction; implementation unchecked.
The action of Z_p^× on the p-completed circle K(Z_p,1) gives functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p), and hence on the filtered THH, TC⁻, TP and TC. On C_A and each Nygaard step the action is trivial; on C_A{1} it is scalar multiplication, so γ acts by γ^i on each i-th graded piece, for i∈Z in its defined range.
Required types/inputs: RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/bms1-twist-comparison; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/coherent-group-actions; RefinedTraceMethods:RT.2
API AdamsOperations.action [structure]: There is a coherent Z_p^× action on the p-completed trace functors.
API AdamsOperations.map [functoriality]: Ring maps commute with every operation ψ_γ.
API AdamsOperations.coefficient [simp]: ψ_γ acts trivially on C_A and its Nygaard ideals.
API AdamsOperations.twist [simp]: On C_A{i}, ψ_γ is multiplication by γ^i.
API AdamsOperations.filtered [compatibility]: The operations preserve motivic filtrations and commute with can and cyclotomic Frobenius.
example contract AdamsOperations.identity [degenerate]: ψ_1 is the identity operation.
example contract AdamsOperations.weightOne [computation]: On gr¹TP the operation ψ_γ is multiplication by γ.
example contract AdamsOperations.weightMinusOne [characterisation]: On gr^(−1)TP the operation is γ^(−1), excluding the wrong uniform γ action.
-/

/-
SpherePolynomialThh — RefinedTraceMethods:RT.6/sphere-polynomial-thh
Kind: theorem; implementation unchecked.
For S[z]=S[N], THH(S[z])≃S[Bcy N] as coherent S¹-equivariant E∞ ring spectra. Bcy N={0}∪(S¹×N_{>0}); t∈S¹ acts on (s,n) by (t^n s,n). The augmentation sends (s,n)↦n, and cyclotomic Frobenius is induced by (s,n)↦(s^p,pn) into C_p homotopy fixed points. The resulting augmentation square commutes with z↦z^p on S[z].
Required types/inputs: EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; RefinedTraceMethods:RT.2; StableHomotopyKTheory:H.5:spectra/operadic-algebras; StableHomotopyKTheory:H.5:spectra/ring-spectrum
-/

/-
RelativeSphereThh — RefinedTraceMethods:RT.6/relative-sphere-thh
Kind: construction; implementation unchecked.
For a connective E∞ S[z]-algebra A, define THH(A/S[z])=THH(A)⊗_(THH(S[z]))S[z] with its coherent circle action. Its cyclotomic Frobenius is the composite formed from the absolute Frobenius, the z↦z^p augmentation square and the lax symmetric monoidal finite-Tate functor. It is semilinear over the cyclotomic base S[z] with trivial circle action and Frobenius z↦z^p. Define relative TC⁻ and TP by circle homotopy fixed points and Tate, respectively, with the p-completion convention of the source.
Required types/inputs: RefinedTraceMethods:RT.6/sphere-polynomial-thh; RefinedTraceMethods:RT.2; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category
API RelativeSphereThh.tensor [constructor]: Relative THH is the indicated tensor product of E∞ ring spectra.
API RelativeSphereThh.circle [structure]: Its coherent circle action is induced before homotopy fixed points.
API RelativeSphereThh.frobenius [data]: Its C_p-Tate Frobenius is semilinear for z↦z^p.
API RelativeSphereThh.map [functoriality]: S[z]-algebra maps induce cyclotomic relative trace maps.
API RelativeSphereThh.tcMinus [constructor]: Relative TC⁻ is p-completed homotopy fixed points and TP is p-completed circle Tate.
example contract RelativeSphereThh.base [degenerate]: THH(S[z]/S[z])≃S[z] with trivial circle action and Frobenius z↦z^p.
example contract RelativeSphereThh.specializeZero [compatibility]: For O_K-algebra A with z↦π, specialization z↦0 gives absolute THH(A⊗^L_(O_K)k).
example contract RelativeSphereThh.perfectRootBase [compatibility]: After adjoining all p-power roots of z and p-completing, relative THH agrees with absolute THH on the corresponding base-changed algebra.
-/

/-
RelativeThhBaseChange — RefinedTraceMethods:RT.6/relative-thh-base-change
Kind: theorem; implementation unchecked.
Let O_K be a complete mixed-characteristic DVR with perfect residue field k, π a uniformizer and O_K∞ the p-adic completion after adjoining all p-power roots of π. For an O_K-algebra A viewed over S[z] by z↦π, THH(A/S[z])⊗_(S[z])S≃THH(A⊗^L_(O_K)k), compatibly with circle and Frobenius. The p-completion of THH(S[z^(1/p∞)])→S[z^(1/p∞)] is an equivalence, and after this base extension the p-completed relative THH of A equals THH(A⊗^L_(O_K)O_K∞;Z_p).
Required types/inputs: RefinedTraceMethods:RT.6/relative-sphere-thh; DerivedDeRhamCohomology:DD.0/cotangent-complex; RefinedTraceMethods:RT.1; RefinedTraceMethods:RT.2; AInfCohomology:AI.0
-/

/-
RelativeDvrCoefficients — RefinedTraceMethods:RT.6/relative-dvr-coefficients
Kind: theorem; implementation unchecked.
In the preceding setup put frakS=W(k)[[z]], φ(z)=z^p, and frakS^(−1)=frakS with its frakS-algebra structure through φ. Let E be the Eisenstein polynomial of π. Then π_*THH(O_K/S[z];Z_p)=O_K[u], π_*TC⁻=P(frakS^(−1),E), π_*TP=frakS^(−1)[σ±¹], and π_*THH^tC_p=O_K[π^(1/p)][σ±¹]. Here |u|=|σ|=2 and |v|=−2. can sends u↦Eσ,v↦σ⁻¹; Frobenius acts on coefficients by φ and sends u↦σ,v↦φ(E)σ⁻¹. The vertical specializations use θ^(−1):z↦π and θ̃^(−1):z↦π^(1/p).
Required types/inputs: RefinedTraceMethods:RT.6/uv-presentation; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/perfectoid-tc-maps; AInfCohomology:AI.0
-/

/-
RelativeQrspEvenness — RefinedTraceMethods:RT.6/relative-qrsp-evenness
Kind: theorem; implementation unchecked.
For S∈QRSPerfd_(O_K), the p-completed relative THH(S/S[z]), TC⁻ and TP are even, and their even homotopy groups are sheaves on the relative QRSP basis with vanishing higher cohomology on every S in that basis. The unfolded gr⁰TC⁻≃gr⁰TP is an E∞ frakS^(−1)-algebra with semilinear Frobenius, (p,z)-complete. Through BS Proposition 15.7 this trace complex is the Nygaard completion of φ^*Δ_(A/frakS), where the relative prism and generic Nygaard completion are supplied by PR.2–3.
Required types/inputs: RefinedTraceMethods:RT.6/relative-dvr-coefficients; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-prismatic-comparison; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; PrismaticCohomology:PR.2/derived-prismatic-cohomology; PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope; PrismaticCohomology:PR.3/nygaard-completion
-/

/-
CharacteristicPTcSheaf — RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf
Kind: theorem; implementation unchecked.
On QRSPerfd_(F_p), for i≥0 there is an exact sequence of sheaves 0 → π_(2i)TC(−;Z_p) → π_(2i)TC⁻(−;Z_p) →^(φ−can) π_(2i)TP(−;Z_p) → 0. For i>0 the corresponding divided-Frobenius-minus-one operator on a QRSP ring is pointwise surjective; in weight zero surjectivity is sheaf-local by Artin–Schreier covers. Thus TC is locally even on this site. This stops before identifying its even K-groups, which is downstream GeneralAlgebraicKTheory Part II.
Required types/inputs: RefinedTraceMethods:RT.6/crystalline-trace-comparison; RefinedTraceMethods:RT.6/tc-negative-degrees; RefinedTraceMethods:RT.6/syntomic-graded-tc; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings
-/

/-
SyntomicKSheaf — RefinedTraceMethods:RT.6/syntomic-k-sheaf
Kind: comparison; implementation unchecked.
For a p-quasisyntomic scheme X, n≥1 and i≥0, the finite syntomic complex Z/p^n(i)_X in D(X_et,Z/p^n) is the derived pushforward from the syntomic site of X to its étale site of the sheafification of the presheaf K_(2i)(−;Z/p^n). Here p-quasisyntomic means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of Tor-amplitude [−1,0] on affine opens. This is Bhatt–Mathew’s announced Example 1.6, not an identification of the un-sheafified K-group presheaf or of the two sites.
Required types/inputs: RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf; RefinedTraceMethods:RT.3; GeneralAlgebraicKTheory:K.4; PrismaticCohomology:PR.4; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring; PrismaticCohomology:PR.4/syntomic-complex
-/

/-
AmmnFilteredInterface — RefinedTraceMethods:RT.6/ammn-filtered-interface
Kind: comparison; implementation unchecked.
For R∈qSyn_(Z_p), in particular p-completely flat over Z_p with the quasisyntomic bounds, the RT.6 motivic filtrations, the cyclic Hodge filtration and the trace maps provide the graded natural comparison used by RT.3b in AMMN Theorem 6.17. On relative QRSP covers, τ_[2i−1,2i] of the rational-after-p-completion TC/HC⁻/HP square is its weight-i square. Unfolding and left Kan extension from p-completed polynomial algebras factor the Hodge-completed comparison through uncompleted LΩ_R and LΩ_R^{≥i}. The pullback theorem and its integral range i≤p−2 are imported from RT.3b; RT.6 supplies its filtration and map-level compatibility, not a second Beilinson theorem.
Required types/inputs: RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf; RefinedTraceMethods:RT.3b; DerivedDeRhamCohomology:DD.2/p-completed-derham; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; DerivedDeRhamCohomology:DD.2/hodge-graded-pieces
-/

/-
TraceClassFunctoriality — RefinedTraceMethods:RT.5/trace-class-functoriality
Kind: theorem; implementation unchecked.
Let F:C → D be symmetric monoidal between presentable symmetric monoidal categories. There is a natural comparison F(X∨) → F(X)∨. A trace-class f:X → Y has trace-class predual Y∨ → X∨ and trace-class image F(f). For its chosen classifier, the naturality square on preduals has a diagonal F(Y)∨ → F(X∨) whose two triangles commute. This diagonal gives the predual comparison needed on trace-class ind-systems; it does not assert that F preserves arbitrary internal Homs.
Required types/inputs: RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability
-/

/-
RigidityCriterion — RefinedTraceMethods:RT.5/rigidity-criterion
Kind: theorem; implementation unchecked.
For a presentable stable E₁-monoidal category E, rigidity is equivalent to compactness of its unit together with generation under colimits by sequential colimits whose transitions are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. Compactness of the unit is a separate hypothesis in both directions.
Required types/inputs: RefinedTraceMethods:RT.5/rigid-category; RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability
-/

/-
NuclearClosure — RefinedTraceMethods:RT.5/nuclear-closure
Kind: theorem; implementation unchecked.
Let C be compactly generated presentable stable symmetric monoidal with compact unit. Nuc(C) is stable and closed under all colimits and tensor products; it is ω₁-compactly generated and its ω₁-compact objects are exactly the basic nuclear objects. A symmetric monoidal colimit-preserving functor preserves basic nuclear objects and nuclear objects as in MW Theorem 2.4(c). For the size-controlled nuclear ind-envelope, a sufficiently large regular κ bounds trace-class factorizations and makes basic nuclear systems essentially small.
Required types/inputs: RefinedTraceMethods:RT.5/nuclear-objects; RefinedTraceMethods:RT.5/trace-class-functoriality; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion
-/

/-
SmoothProperNormalization — RefinedTraceMethods:RT.5/smooth-proper-normalization
Kind: theorem; implementation unchecked.
For rigid symmetric monoidal E and a dualizable E-module X with strongly continuous relative evaluation and coevaluation, X is dualizable in Catdual_E. For the refined symmetric monoidal invariant Tref attached to T:Motloc_E → D, its value on X is the constant ind-object T(X). If a rigid symmetric monoidal X is smooth and proper over E, forgetting X-linearity preserves trace-class morphisms.
Required types/inputs: RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/trace-class-functoriality
-/

/-
CircleCompletionEquivalence — RefinedTraceMethods:RT.5/circle-completion-equivalence
Kind: theorem; implementation unchecked.
Let k be a complex orientable E∞ ring spectrum with trivial S¹ action, and choose t∈π_(−2)(k^hS¹) representing an orientation. Homotopy S¹ fixed points give a symmetric monoidal equivalence from coherent circle k-modules to derived t-complete k^hS¹-modules, whose tensor is t-completed. The left adjoint has underlying module reduction modulo t; no bounded-below hypothesis is imposed.
Required types/inputs: RefinedTraceMethods:RT.2; DerivedDeRhamCohomology:DD.1/derived-completion; EnhancedDerivedSheaves:E5:presentability
-/
