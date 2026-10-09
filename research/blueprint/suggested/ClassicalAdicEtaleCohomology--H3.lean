/-
Suggested Lean forms for ClassicalAdicEtaleCohomology, H3.
This file is not the roadmap and is not exhaustive. The roadmap document
ClassicalAdicEtaleCohomology--H3.md is definitive. These statements suggest Lean forms
so contributors and reviewers converge on names and signatures.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.
Elaborated with lean-check at the pinned shared baseline; only sorry warnings.
Compilation covers the finite linear prototypes, not the analytic inventory.
Every implementation status in the packet remains unchecked.
-/
import Mathlib.Data.ZMod.Defs
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Quotient.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair

/-!
# Finite linear assembly and analytic declaration inventory

The executable prototypes below use actual module and quotient types from Mathlib.
They cover only the finite assembly and quotient-descent part of the boundary trace.
Their namespace is deliberately distinct from the analytic constructors: arbitrary
modules are not substitutes for Kummer cohomology or compact-support cohomology.

A2/R0 must supply analytic spaces, eligible morphisms and boundary field geometry;
H0/H1 must supply the analytic étale site, support topoi, Kummer identifications and
cohomology; E1 must supply enhanced support functors, twists and mapping complexes.
The inventory following the algebra lists every packet declaration, API and test,
with its intended mathematical signature and unresolved carrier prerequisites.
Those unavailable signatures are left out of executable Lean, rather than encoded
by proposition-valued stand-ins. No new analytic-space or derived-category carrier
is defined here. The accepted H0 packet retains its inherited signatures and names.
-/

noncomputable section
open scoped BigOperators

namespace TauCeti.AdicSpace.LinearBoundaryPrototype

universe u v w
variable {ι : Type u} [Fintype ι] {n : ℕ}
variable (B : ι → Type v) [∀ i, AddCommGroup (B i)] [∀ i, Module (ZMod n) (B i)]

/-- Algebraic assembly used by the intended AdicSpace.boundaryPretrace.
The geometric degrees must be constructed from the actual henselian boundary fields. -/
def boundaryPretrace (degree : ∀ i, B i →ₗ[ZMod n] ZMod n) :
    ((i : ι) → B i) →ₗ[ZMod n] ZMod n :=
  by
  classical
  exact LinearMap.lsum (ZMod n) B (ZMod n) degree

namespace BoundaryPretrace

/-- Algebraic form of BoundaryPretrace.sumDegree. -/
theorem sumDegree (degree : ∀ i, B i →ₗ[ZMod n] ZMod n) (x : ∀ i, B i) :
    boundaryPretrace B degree x = ∑ i, degree i (x i) := by
  sorry

/-- Algebraic form of BoundaryPretrace.single; the baseline theorem is lsum_piSingle. -/
theorem single [DecidableEq ι] (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (i : ι) (a : B i) :
    boundaryPretrace B degree (Pi.single i a) = degree i a := by
  sorry

/-- Algebraic form of BoundaryPretrace.reindex. -/
theorem reindex {κ : Type w} [Fintype κ] (e : ι ≃ κ)
    (degree : ∀ i, B i →ₗ[ZMod n] ZMod n) (x : ∀ i, B i) :
    boundaryPretrace (fun j : κ ↦ B (e.symm j))
      (fun j ↦ degree (e.symm j)) (fun j ↦ x (e.symm j)) =
      boundaryPretrace B degree x := by
  sorry

/-- Algebraic form of BoundaryPretrace.descend. Reciprocity must prove hN. -/
theorem descend (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (N : Submodule (ZMod n) ((i : ι) → B i))
    (hN : N ≤ LinearMap.ker (boundaryPretrace B degree)) :
    ∃! t : (((i : ι) → B i) ⧸ N) →ₗ[ZMod n] ZMod n,
      t.comp N.mkQ = boundaryPretrace B degree := by
  sorry

/-- Algebraic form of BoundaryPretrace.norm, allowing many branches over one branch.
The geometric norm identity is the equality hdegree on the component maps. -/
theorem norm [DecidableEq ι] {κ : Type w} [Fintype κ] [DecidableEq κ]
    (C : κ → Type v) [∀ j, AddCommGroup (C j)] [∀ j, Module (ZMod n) (C j)]
    (φ : ι → κ) (N : ∀ i, B i →ₗ[ZMod n] C (φ i))
    (degreeB : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (degreeC : ∀ j, C j →ₗ[ZMod n] ZMod n)
    (hdegree : ∀ i, (degreeC (φ i)).comp (N i) = degreeB i) :
    (boundaryPretrace C degreeC).comp
      (LinearMap.lsum (ZMod n) B (ZMod n)
        (fun i ↦ (LinearMap.single (ZMod n) C (φ i)).comp (N i))) =
      boundaryPretrace B degreeB := by
  sorry

-- test BoundaryPretrace.test_empty (degenerate): pure finite assembly, not a geometric boundary.
example : boundaryPretrace (n := n) (fun _ : Empty ↦ ZMod n)
    (fun _ ↦ LinearMap.id) = 0 := by
  sorry

-- test BoundaryPretrace.test_single (computation).
example [DecidableEq ι] (degree : ∀ i, B i →ₗ[ZMod n] ZMod n) (i : ι) (a : B i) :
    boundaryPretrace B degree (Pi.single i a) = degree i a := by
  sorry

-- test BoundaryPretrace.test_cancel (computation): two actual scalar components of opposite sign.
example (a : ZMod n) :
    boundaryPretrace (fun _ : Bool ↦ ZMod n) (fun _ ↦ LinearMap.id)
      (fun i ↦ if i then a else -a) = 0 := by
  sorry

end BoundaryPretrace

/-- Quotient assembly used after reciprocity and the localization cokernel isomorphism.
This is not the analytic constructor AdicSpace.BoundaryResidueTrace. -/
def quotientTrace (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (N : Submodule (ZMod n) ((i : ι) → B i))
    (hN : N ≤ LinearMap.ker (boundaryPretrace B degree)) :
    (((i : ι) → B i) ⧸ N) →ₗ[ZMod n] ZMod n :=
  N.liftQ (boundaryPretrace B degree) hN

/-- Algebraic part of BoundaryResidueTrace.comp_boundary. -/
theorem quotientTrace_comp (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (N : Submodule (ZMod n) ((i : ι) → B i))
    (hN : N ≤ LinearMap.ker (boundaryPretrace B degree)) :
    (quotientTrace B degree N hN).comp N.mkQ = boundaryPretrace B degree := by
  sorry

/-- Algebraic part of BoundaryResidueTrace.unique. -/
theorem quotientTrace_unique (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (N : Submodule (ZMod n) ((i : ι) → B i))
    (hN : N ≤ LinearMap.ker (boundaryPretrace B degree))
    (t : (((i : ι) → B i) ⧸ N) →ₗ[ZMod n] ZMod n)
    (ht : t.comp N.mkQ = boundaryPretrace B degree) :
    t = quotientTrace B degree N hN := by
  sorry

/-- Algebraic part of BoundaryResidueTrace.surjective.
Geometry proves the pretrace is onto; quotient descent then preserves this fact. -/
theorem quotientTrace_surjective (degree : ∀ i, B i →ₗ[ZMod n] ZMod n)
    (N : Submodule (ZMod n) ((i : ι) → B i))
    (hN : N ≤ LinearMap.ker (boundaryPretrace B degree))
    (hsurj : Function.Surjective (boundaryPretrace B degree)) :
    Function.Surjective (quotientTrace B degree N hN) := by
  sorry

end TauCeti.AdicSpace.LinearBoundaryPrototype

/-
ANALYTIC DECLARATION INVENTORY

Names below are relative to TauCeti, as in the accepted H0 packet. Each entry is
an intended mathematical signature, not Lean syntax that invents a missing type.
The full exact statement and proof obligations are in the packet and reader.
A construction entry gives its intended result type and all API/test signatures.
An unavailable test remains a named inventory entry, not a vacuous example.
-/

/-
ClassicalAdicEtaleCohomology:H3/compactification-transcendence-dimension (theorem)
Proposed theorem AdicSpace.compactification_dimTr
Intended signature: For a quasi-compact separated taut +weakly finite type morphism f:X→Y of locally noetherian analytic adic spaces, let j:X→Xᶜ and fᶜ:Xᶜ→Y be its universal compactification. The morphism fᶜ is proper and dim.tr fᶜ = dim.tr f, with the relative transcendence-dimension convention of Huber §1.8. In particular a finite upper bound remains valid at the added higher-rank points. This statement does not assert that fᶜ is locally of finite type.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/universal-compactification, ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation, AdicEtaleGeometry:A2
-/

/-
ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude (theorem)
Proposed theorem AdicSpace.proper_torsion_amplitude
Intended signature: Let f:X→Y be a proper +weakly finite type morphism of locally noetherian analytic adic spaces, with a uniform bound dim.tr f≤d. For every étale Z/n-module sheaf F, n>0, Rᑫf_*F=0 for q>2d. Locally on quasi-compact Y this gives a finite cohomological amplitude for Rf_* on unbounded complexes. In particular Rf_* preserves all small homotopy colimits. No invertibility of n in O_Y⁺ is imposed in this proper amplitude statement.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/compactification-transcendence-dimension, ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation, EnhancedDerivedSheaves:E1/enhanced-derived-category, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/closed-pseudo-fibre-torsion-acyclicity (theorem)
Proposed theorem AdicSpace.closedPseudoFibre_acyclic
Intended signature: Let S=Spa(C,C⁺), where C is complete algebraically closed nonarchimedean and C⁺ is an open bounded valuation subring; write s for its unique closed point. Let f:X→S be proper, with X locally noetherian, and let F be an étale Z/n-module sheaf, n>0. If F restricts to zero on the pseudo-adic fibre (X,f⁻¹(s)), then RΓ(X,F)=0. The same vanishing holds for K∈D⁺ with all cohomology sheaves restricting to zero. This includes extension by zero from f⁻¹(S∖{s}) and does not require n to be a unit in C⁺.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space, ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude, ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence
-/

/-
ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion (theorem)
Proposed theorem AdicSpace.proper_etale_exchange
Intended signature: For a Cartesian square X′→X over an étale j:Y′→Y and proper f:X→Y of locally noetherian analytic adic spaces, the canonical map j! Rf′_* → Rf_* j′! is an equivalence on unbounded D(X′_ét,Z/n), for every n>0. Both ! functors here are the exact étale extension-by-zero functors, and the transformation uses the usual slice-site base-change map and its counit.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/closed-pseudo-fibre-torsion-acyclicity, ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude, AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion (theorem)
Proposed theorem AdicSpace.proper_projectionFormula
Intended signature: For a proper +weakly finite type f:X→Y of locally noetherian analytic adic spaces and any F∈D(X_ét,Z/n), G∈D(Y_ét,Z/n), n>0, the canonical morphism Rf_*F ⊗ᴸ G → Rf_*(F⊗ᴸ f*G) is an equivalence. It is natural in both complexes and compatible with the proper–étale exchange transformation.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion, ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/unbounded-classical-support-comparison (comparison)
Proposed theorem AdicSpace.unboundedSupport_comparison
Intended signature: Fix n>0 invertible in O_S⁺. On locally noetherian analytic S-spaces and locally +weakly finite type maps, there is a coherent colimit-preserving proper-support functor on the enhanced unbounded derived categories. For a separated taut f it restricts on D⁺ to the inherited Huber R⁺f!, including non-quasi-compact f. For proper f it is Rf_*; for étale f it is the exact f! with its usual counit. Composition, base change and projection formula agree with the inherited classical transformations wherever those are defined. No global dimension bound for all of S is required.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion, ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion, ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change, ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence, ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion, ClassicalAdicEtaleCohomology:H3/lower-shriek-composition, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison (comparison)
Proposed theorem AdicSpace.boundary_kummer_comparison
Intended signature: Let X=Spa(A,A°) be a nonempty smooth affinoid curve over a complete algebraically closed nonarchimedean field C, and let j:X→Xᶜ be the universal compactification over Spa(C,O_C). Its boundary I is finite and discrete, consisting of rank-two closed points, with at least one point on every connected component. For x∈I set K_x=k(x)ʰ, or its completion after henselization, and use the corresponding henselian valuation pair. The boundary étale topos is the finite product of the topoi (Spec K_x)_ét. For n>0 invertible in C, H⁰({x},μ_n)=μ_n(C), H¹({x},μ_n)=K_x×/(K_x×)ⁿ, and Hⁱ({x},μ_n)=0 for i≥2. These identifications carry finite-flat cohomological trace on H¹ to the field norm.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space, ClassicalAdicEtaleCohomology:H3/universal-compactification, ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace, AdicSpacesPartII:R0, ClassicalAdicEtaleCohomology:H1:henselian, ClassicalAdicEtaleCohomology:H0/kummer-sequence, SchemeAndStackFoundations:SF.2, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory
-/

/-
ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation (theorem)
Proposed theorem AdicSpace.boundary_localization
Intended signature: In the preceding affinoid-curve setting, let r=#I and s=#π₀(X). For n invertible in C, H⁰_c(X,μ_n)=0 and Hⁱ_c(X,μ_n)=0 for i≥3, and localization gives the exact sequence 0→μ_n(C)^(r−s)→H¹_c(X,μ_n)→H¹(Xᶜ,μ_n)→⊕_{x∈I}K_x×/(K_x×)ⁿ→H²_c(X,μ_n)→0. Moreover H¹(Xᶜ,μ_n)≅H¹(X,μ_n), with 0→A×/(A×)ⁿ→H¹(X,μ_n)→Pic(X)[n]→0. Thus H²_c is canonically the cokernel of the boundary restriction β, as a Z/n-module.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison, ClassicalAdicEtaleCohomology:H3/bounded-below-support-calculus-open-ring-torsion, ClassicalAdicEtaleCohomology:H0, ClassicalAdicEtaleCohomology:H1:henselian, SchemeAndStackFoundations:SF.2, AdicSpacesPartII:R0
-/

/-
ClassicalAdicEtaleCohomology:H3/boundary-pretrace (construction)
Proposed construction AdicSpace.boundaryPretrace
Intended signature: In the affinoid boundary setting define q_x:K_x×/(K_x×)ⁿ→Z/n by the secondary degree #v_x modulo n, and define pretrace P_X:⊕_{x∈I}K_x×/(K_x×)ⁿ→Z/n as the sum of the q_x. The degree is normalized by #(γ₀)=1 for the greatest value γ₀<1. Under the ordered-group decomposition Γ_x≅Γ_C×Z used by LRZ, # is the negative of the second-coordinate projection. In particular the disc boundary has #v(T)=−1. Its finite linear assembly is an instance of Mathlib LinearMap.lsum; geometry and Kummer identifications are additional inputs, not arbitrary parameters replacing cohomology.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison, AdicSpacesPartII:R0, mathlib:LinearMap.lsum, mathlib:LinearMap.lsum_piSingle, mathlib:Submodule.liftQ, mathlib:Submodule.liftQ_mkQ, mathlib:Submodule.mkQ, mathlib:Submodule.mkQ_surjective

lemma BoundaryPretrace.sumDegree
Intended statement: The value on (a_x) is Σ_x q_x(a_x).

lemma BoundaryPretrace.single
Intended statement: The value on a class supported at x is q_x of that class.

lemma BoundaryPretrace.reindex
Intended statement: A bijection of the finite boundary set leaves the sum unchanged after transporting its degree maps.

lemma BoundaryPretrace.descend
Intended statement: For a submodule N contained in ker P_X there is a unique linear map from B/N whose composite with N.mkQ is P_X; it is N.liftQ P_X.

lemma BoundaryPretrace.norm
Intended statement: For a finite flat map and its boundary norm map N, P_Y∘N=P_X whenever each secondary degree satisfies the field norm identity.

example -- BoundaryPretrace.test_empty (degenerate)
Intended test: For the empty finite index set the assembly is zero; this is an algebraic test, not a claim that a nonempty affinoid curve has empty boundary.

example -- BoundaryPretrace.test_single (computation)
Intended test: A vector with one supported component a has value q_x(a).

example -- BoundaryPretrace.test_cancel (computation)
Intended test: Two components of degrees a and −a give zero; neither a maximum nor an unsigned count passes this test.

example -- BoundaryPretrace.test_disc_parameter (computation)
Intended test: At the closed-disc boundary, the Kummer class of T has pretrace −1 modulo n. For n>2 this distinguishes the two possible signs.
-/

/-
ClassicalAdicEtaleCohomology:H3/boundary-pretrace-reciprocity (theorem)
Proposed theorem AdicSpace.boundary_reciprocity
Intended signature: For every smooth affinoid curve X in the boundary setting, the composite H¹(Xᶜ,μ_n)→⊕_x K_x×/(K_x×)ⁿ→ᴾ_X Z/n is zero. Equivalently im β⊆ker P_X. The statement applies when n is invertible in C, even if it is divisible by the residue characteristic.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/boundary-pretrace, ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation, ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace, AdicSpacesPartII:R0, AdicSpacesPartII:R0/affinoid-noether-normalisation
-/

/-
ClassicalAdicEtaleCohomology:H3/boundary-residue-trace (construction)
Proposed construction AdicSpace.BoundaryResidueTrace
Intended signature: For a smooth affinoid curve X over Spa(C,O_C) and n>0 invertible in C, define t_X:H²_c(X,μ_n)→Z/n as the unique linear map satisfying t_X∘∂=P_X, where ∂ is the surjective boundary connecting map of boundary-localization-presentation. It is surjective. Under a finite flat map of such curves f:X→Y, t_Y∘H²_c(tr_f(1))=t_X. This boundary construction gives the inherited prime-to-residue curve trace once its algebraic normalization comparison is proved; residue-p surjectivity does not imply injectivity.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation, ClassicalAdicEtaleCohomology:H3/boundary-pretrace, ClassicalAdicEtaleCohomology:H3/boundary-pretrace-reciprocity, mathlib:Submodule.liftQ, mathlib:Submodule.liftQ_mkQ, mathlib:Submodule.mkQ_surjective

lemma BoundaryResidueTrace.comp_boundary
Intended statement: t_X∘∂=P_X.

lemma BoundaryResidueTrace.unique
Intended statement: Any linear map from H²_c with this composite equals t_X.

lemma BoundaryResidueTrace.surjective
Intended statement: For nonempty X the map t_X is onto.

lemma BoundaryResidueTrace.finiteFlat
Intended statement: t_Y∘H²_c(tr_f(1))=t_X for a finite flat morphism.

lemma BoundaryResidueTrace.classical
Intended statement: For n invertible in O_C it agrees with the inherited normalized curve trace, after the algebraic comparison theorem.

example -- BoundaryResidueTrace.test_disc (computation)
Intended test: For the disc, t_X(∂[T])=−1 modulo n; equivalently the class ∂[T⁻¹] has trace 1.

example -- BoundaryResidueTrace.test_annulus_relation (characterisation)
Intended test: The boundary restriction of any global annulus Kummer class has trace zero after applying ∂, by reciprocity on both branches.

example -- BoundaryResidueTrace.test_finite_split (compatibility)
Intended test: For a disjoint union of two copies mapping finitely to X, trace is the sum of the two component traces.

example -- BoundaryResidueTrace.test_residue_p (non-example)
Intended test: For a mixed-characteristic closed disc and n=p, the trace is onto but has nonzero kernel: the difference of point classes at 0 and 1 is nonzero by LRZ Lemma 5.5.21, pp. 60–61, while both have trace 1 by Corollary 5.5.18, p. 60.
-/

/-
ClassicalAdicEtaleCohomology:H3/boundary-algebraic-trace-comparison (comparison)
Proposed theorem AdicSpace.boundary_algebraic_trace
Intended signature: Let X be a smooth affinoid curve over Spa(C,O_C), n invertible in C, and j:X→X̄ an open immersion into the analytification of a smooth proper algebraic C-curve. Let t_alg be the scheme curve trace transported by proper algebraic–analytic comparison. Then t_X = t_alg∘H²_c(tr_j(1)):H²_c(X,μ_n)→Z/n. Consequently affinoid-curve boundary traces commute with étale maps wherever their source and target are smooth affinoid curves. For n invertible in O_C this identifies t_X with the inherited classical curve trace.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/boundary-residue-trace, ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison, ClassicalAdicEtaleCohomology:H3/curve-trace, ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace, AdicSpacesPartII:R2
-/

/-
ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change (theorem)
Proposed theorem AdicSpace.support_weak_baseChange
Intended signature: Let f:X→Y be a compactifiable locally +weakly finite type morphism of locally noetherian analytic adic spaces and K a bounded-below torsion complex. Formation of R⁺f! has a base-change transformation for every analytic pullback. This transformation is an isomorphism for pullbacks of transcendence dimension zero, in particular the canonical completed algebraic-closure field-pair maps used to compute geometric stalks. This weak assertion does not require torsion orders to be units in O_Y⁺. If torsion orders are units there, the inherited full base-change theorem applies to arbitrary pullbacks.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/proper-support-direct-image, ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion, ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs, AdicEtaleGeometry:A2, EnhancedDerivedSheaves:E1
-/

/-
ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree (theorem)
Proposed theorem AdicSpace.smoothSupport_topDegree
Intended signature: For a separated taut smooth f:X→Y of equidimension d between locally noetherian analytic adic spaces, and n>0 invertible in O_Y, put Λ=Z/n. Then Rf!Λ_X(d)[2d] belongs to D≤0(Y_ét,Λ). Every morphism from this complex to Λ_Y factors uniquely through R²ᵈf!Λ_X(d). The source’s use of Huber 5.5.8 covers this constant-coefficient statement without requiring n to be invertible in O_Y⁺.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/proper-support-direct-image, AdicEtaleGeometry:A2/smooth-pure-relative-dimension, AdicEtaleGeometry:A2, EnhancedDerivedSheaves:E1/enhanced-derived-category
-/

/-
ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent (theorem)
Proposed theorem AdicSpace.smoothTrace_sourceDescent
Intended signature: For f as in smooth-constant-support-top-degree and a cover X=⋃_i U_i by taut open immersions, write f_i=f|U_i and f_ii′=f|U_i∩U_i′. The alternating sum of the two extension-by-zero maps gives an exact sequence ⊕_{i,i′}R²ᵈf_ii′!Λ(d)→⊕_i R²ᵈf_i!Λ(d)→R²ᵈf!Λ(d)→0. Consequently trace maps Rf_i!Λ(d)[2d]→Λ that agree on overlaps descend to one unique trace on X. The result allows infinite covers.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree, ClassicalAdicEtaleCohomology:H3/bounded-below-support-calculus-open-ring-torsion, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/affine-space-trace-model (construction)
Proposed construction AdicSpace.AffineSpaceTrace
Intended signature: Let Y be locally noetherian analytic, n>0 invertible in O_Y, and Λ=Z/n. The trace for π:A¹,an_Y→Y is the composite Rπ!Λ(1)[2]→Rπ̄_*Λ(1)[2]→R²π̄_*Λ(1)≅Λ, where π̄:P¹,an_Y→Y and the last map is the inverse of the first-Chern-class projective-bundle isomorphism. Define the trace for Aᵈ,an_Y by successive projections and the support composition comparison, with twists and shifts added. For d=0 it is the identity. This trace is independent of a permutation of the affine coordinates and commutes with base-change transformations.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree, ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change, ClassicalAdicEtaleCohomology:H3/bounded-below-support-calculus-open-ring-torsion, ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization, AdicSpacesPartII:R3, ClassicalAdicEtaleCohomology:H1, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace, ClassicalAdicEtaleCohomology:H0

lemma AffineSpaceTrace.projectiveLine
Intended statement: For d=1 the trace is restriction to P¹ followed by the inverse Chern-class isomorphism in degree two.

lemma AffineSpaceTrace.projection
Intended statement: Successive projections compose the traces with the corresponding Tate twists and cohomological shifts.

lemma AffineSpaceTrace.permutation
Intended statement: Any permutation of affine coordinates leaves the trace unchanged.

lemma AffineSpaceTrace.baseChange
Intended statement: Pullback of the trace equals the trace on the pullback after the canonical support base-change transformation.

lemma AffineSpaceTrace.algebraic
Intended statement: Over Spa(C,O_C) it agrees with the scheme affine-space trace under algebraic–analytic support comparison.

example -- AffineSpaceTrace.test_zero (degenerate)
Intended test: Dimension zero gives the identity Λ→Λ.

example -- AffineSpaceTrace.test_line_class (computation)
Intended test: Under the requested H1 compact-support comparison for A¹_C, the image of the scheme degree-one point class has trace 1 in H²_c(A¹,an_C,Λ(1)).

example -- AffineSpaceTrace.test_swap (compatibility)
Intended test: Interchanging the two coordinates of A²,an_C preserves its trace.

example -- AffineSpaceTrace.test_closed_polydisc (non-example)
Intended test: At residue-p coefficients the same permutation-triviality assertion for H⁴_c(D²_C,μ_p⊗²) is false; LRZ Remark 6.1.8 gives two distinct point classes.
-/

/-
ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class (construction)
Proposed construction AdicSpace.AnalyticFirstChernClass
Intended signature: For a locally noetherian analytic adic space X, n>0 invertible in O_X, and a line bundle L, define c₁(L)∈H²(X_ét,μ_n) as the Kummer connecting image of its class in Pic(X)≅H¹(X_ét,G_m). It is additive under tensor product, commutes with analytic pullback, and agrees with the scheme first Chern class under relative analytification. This is a cohomological construction in H3; the line bundles themselves and their pullbacks are supplied by R3.
Unavailable carriers / suppliers: AdicSpacesPartII:R3, ClassicalAdicEtaleCohomology:H0/kummer-sequence, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1, EtaleDualityAndPerverseSheaves:EDC.2, AdicSpacesPartII:R3/locally-free-sheaf

lemma AnalyticFirstChernClass.kummer
Intended statement: c₁(L)=δ_Kummer([L]) in H²(X,μ_n).

lemma AnalyticFirstChernClass.tensor
Intended statement: c₁(L⊗M)=c₁(L)+c₁(M).

lemma AnalyticFirstChernClass.pullback
Intended statement: g*c₁(L)=c₁(g*L).

lemma AnalyticFirstChernClass.analytification
Intended statement: The scheme-to-analytic étale comparison sends the scheme c₁(L) to c₁(L_an).

example -- AnalyticFirstChernClass.test_trivial (degenerate)
Intended test: The trivial line bundle has first Chern class zero.

example -- AnalyticFirstChernClass.test_power (computation)
Intended test: c₁(L⊗n)=n·c₁(L)=0 in H²(X,μ_n).

example -- AnalyticFirstChernClass.test_projective_line (compatibility)
Intended test: On P¹,an_C the class of O(1) agrees with the scheme degree-one generator and has algebraic trace 1.
-/

/-
ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization (theorem)
Proposed theorem AdicSpace.projectiveLine_chern_normalization
Intended signature: For Y locally noetherian analytic and n>0 invertible in O_Y, write Λ=Z/n and π̄:P¹,an_Y→Y. The unit and c₁(O(1)) give an equivalence Λ_Y ⊕ Λ_Y(−1)[−2]→Rπ̄_*Λ. In particular c₁(O(1)) induces Λ_Y≅R²π̄_*Λ(1). These identifications commute with the canonical base-change transformations.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class, ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change, ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison, AdicSpacesPartII:R3, ClassicalAdicEtaleCohomology:H0, EtaleDualityAndPerverseSheaves:EDC.2
-/

/-
ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy (theorem)
Proposed theorem AdicSpace.curveTrace_plusRing_constancy
Intended signature: Let C be complete algebraically closed nonarchimedean, C⁺ an open bounded valuation subring, S=Spa(C,C⁺), and n>0 invertible in C⁺. For a separated taut smooth curve f:X→S with all geometric fibres nonempty and connected, the specialization maps of R²f!μ_n between geometric points of S are isomorphisms. Consequently its normalized trace R²f!μ_n→(Z/n)_S is an isomorphism, by the rank-one connected-curve trace theorem. This contract covers arbitrary curves, including positive-width annuli and curves without smooth-model tube presentations.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected, ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace, ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change, ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs
-/

/-
ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement (theorem)
Proposed theorem AdicSpace.curveEffacement_plusRing
Intended signature: Required proof input for the higher-rank extension of the inherited curve fundamental lemma: for S=Spa(C,C⁺), n invertible in C⁺, a separated taut smooth curve f:Y→S, and a point y∈Y, construct a separated taut étale g:Y′→Y whose image contains y and whose relevant curve components are nonempty, connected and nonproper, such that the trace-induced map R¹(fg)!μ_n→R¹f!μ_n is zero. Construct iterated such neighborhoods so that the resulting support map factors through the top-degree trace term (Z/n)(−1)[−2]. The statement is the sufficient effacement contract to verify, not a claimed transcription of the unread book theorem.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma, ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy, ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension, ClassicalAdicEtaleCohomology:H1:henselian, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma
-/

/-
ClassicalAdicEtaleCohomology:H3/unbounded-open-coefficient-curve-duality (application)
Proposed theorem AdicSpace.curveDuality_openCoefficient
Intended signature: Let S=Spa(C,C⁺), ℓ invertible in C⁺, Λ=F_ℓ, f:X→S a separated taut smooth curve, j:U→S a quasi-compact open immersion, and j′:X_U→X its pullback. For every G in the unbounded D(X_ét,Λ), the trace gives a natural equivalence of derived mapping complexes RHom_X(G,j′!Λ(1)[2])≅RHom_S(Rf!G,j!Λ). The equivalence respects localization, the projection formula and the support exchange j!Rf_U!≅Rf!j′!. It applies in particular to the relative ball used by ECD 24.1. A consumer that has independently constructed exceptional right adjoints can identify the corresponding open-extension mate by Yoneda; no such adjoint is used to prove this classical equivalence.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/curve-poincare-duality, ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility, ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement, ClassicalAdicEtaleCohomology:H3/unbounded-classical-support-comparison, ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula, EnhancedDerivedSheaves:E1/enhanced-derived-category, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
-/

/-
ClassicalAdicEtaleCohomology:H3/plus-ring-finite-local-system-pairing (application)
Proposed theorem AdicSpace.curvePairing_plusRing
Intended signature: Let S=Spa(C,C⁺) as above, ℓ invertible in C⁺, Λ=F_ℓ, and f:X→S a quasi-compact separated taut smooth curve. For a finite-rank Λ-local system L, the trace pairing Hⁱ_c(X/S,L)×H²⁻ⁱ(X,L∨(1))→Λ is perfect, and both groups are finite-dimensional; they vanish outside degrees 0 through 2. Equivalently RΓ_c(X/S,L) and RΓ(X,L∨(1))[2] are finite complexes dual to each other. The pairing agrees with the inherited C⁺=O_C pairing under its comparison maps. Non-quasi-compact curves are not included in the finite-dimensionality assertion.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/curve-poincare-duality, ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness, ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing, ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy, ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs
-/

/-
ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence (theorem)
Proposed theorem AdicSpace.smoothTrace_chartIndependence
Intended signature: For f:X→Y separated taut smooth of equidimension d and n invertible in O_Y, suppose g₁,g₂:X→Aᵈ,an_Y are étale Y-maps. The maps Rf!Λ(d)[2d]→Rπ!Λ(d)[2d]→Λ obtained from the two étale counits and AffineSpaceTrace are equal.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/affine-space-trace-model, ClassicalAdicEtaleCohomology:H3/boundary-algebraic-trace-comparison, ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change, ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent, AdicSpacesPartII:R0/smooth-differentials-locally-free, AdicSpacesPartII:R0, ClassicalAdicEtaleCohomology:H0
-/

/-
ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace (construction)
Proposed construction AdicSpace.GeneralSmoothTrace
Intended signature: Assign to every separated taut smooth f:X→Y of equidimension d between locally noetherian analytic adic spaces, n>0 invertible in O_Y and Λ=Z/n, a trace tr_f:Rf!Λ_X(d)[2d]→Λ_Y. Choose étale smooth coordinate charts into Aᵈ,an, compose their étale counits with AffineSpaceTrace, and descend from a taut source cover. The resulting assignment is independent of all choices, compatible with compositions and pullback transformations, equals the étale counit in dimension zero, and has the scheme P¹ normalization. These properties characterize the assignment. This expands the inherited rigid-base trace scope to arbitrary analytic bases and plus rings; it does not assert arbitrary-sheaf duality or that top trace is an isomorphism.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/affine-space-trace-model, ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence, ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent, ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change, AdicSpacesPartII:R0, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, EnhancedDerivedSheaves:E1

lemma GeneralSmoothTrace.chart
Intended statement: On an étale coordinate chart, trace is AffineSpaceTrace composed with the étale counit.

lemma GeneralSmoothTrace.independent
Intended statement: The trace does not depend on the charts or cover; any normalized compatible assignment has the same maps.

lemma GeneralSmoothTrace.comp
Intended statement: tr_(g∘f)=tr_g∘Rg!(tr_f(e)[2e]) for smooth maps of dimensions d and e, using support composition and projection formula.

lemma GeneralSmoothTrace.baseChange
Intended statement: For a Cartesian pullback, tr_f′∘BC=g*tr_f. BC is not declared invertible unless its separate hypotheses hold.

lemma GeneralSmoothTrace.etale
Intended statement: For étale f the trace is the usual exact f!–f* counit.

lemma GeneralSmoothTrace.projectiveLine
Intended statement: For P¹,an_C over Spa(C,O_C), the trace is the transported algebraic curve trace.

lemma GeneralSmoothTrace.topDegree
Intended statement: The trace factors uniquely through R²ᵈf!Λ(d).

example -- GeneralSmoothTrace.test_identity (degenerate)
Intended test: The trace for id_Y is id_Λ.

example -- GeneralSmoothTrace.test_finite_etale (computation)
Intended test: For a split finite étale cover with r sheets, the trace sums the r components and its composite with the unit is multiplication by r.

example -- GeneralSmoothTrace.test_projective_line (compatibility)
Intended test: The analytified degree-one point class of P¹_C has trace 1.

example -- GeneralSmoothTrace.test_higher_rank (characterisation)
Intended test: The trace is defined for the relative disc over Spa(C,C⁺) of rank(C⁺)>1 and is compatible with the rank-one generic pullback.

example -- GeneralSmoothTrace.test_residue_p_scope (non-example)
Intended test: For the mixed-characteristic closed disc with Λ=F_p, the nonzero difference of the point classes at 0 and 1 lies in the kernel of its trace; trace existence therefore cannot give an isomorphism H²_c≅F_p (LRZ Corollary 5.5.18 and Lemma 5.5.21, pp. 60–61).
-/

/-
ClassicalAdicEtaleCohomology:H3/bounded-below-support-calculus-open-ring-torsion (theorem)
Proposed theorem AdicSpace.boundedBelow_support_calculus
Intended signature: Let Λ=Z/n, n>0 invertible in O_Y, and let f:X→Y and g:Y→Z be separated taut locally finite type maps of locally noetherian analytic adic spaces, with n invertible in O_Z when composing. For the inherited classical bounded-below support functors there are natural, unital and associative comparisons R⁺(g∘f)!≅R⁺g!R⁺f!, compatible with the proper and exact étale cases, forget-supports maps and Tate twists. Open/pseudo-adic-closed localization holds in this coefficient range. Taut open-cover support descent, including infinite covers by quasi-compact opens, gives the support Čech spectral sequence used to glue top-degree traces. These comparisons are coherent with the canonical weak base-change transformations; this statement does not assert that arbitrary base-change transformations are isomorphisms.
Unavailable carriers / suppliers: ClassicalAdicEtaleCohomology:H3/proper-support-direct-image, ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek, ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation, ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion, ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion, ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, ClassicalAdicEtaleCohomology:H0, EnhancedDerivedSheaves:E1
-/
