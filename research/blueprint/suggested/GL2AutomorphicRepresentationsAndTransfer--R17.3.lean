/-
This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They claim no implementation.

The pinned libraries do not contain the supplier-owned automorphic isomorphism
classes, localRep Weil–Deligne interfaces, arithmetic projective obstruction or
Hilbert weight-one dictionary. Statements needing those carriers, or the suppliers'
local projections, twists, norms and conjugations, are recorded as §13 omission
blocks below (node statement and hypotheses copied from the packet), never as
declarations over arbitrary type parameters and functions, Prop-valued fields or
dummy predicates. Every remaining declaration is intended to be true as written.
The packet gives the complete mathematics. Compilation checks only these
provisional signatures, including concrete matrix formulas and examples.

Only Mathlib modules are imported: they are at the exact pinned Mathlib commit.
The pinned Tau Ceti zero-class lifting theorem is read and cited in the packet;
its current shared-build version is not imported as a substitute for that pin.
All packet test names are comments immediately preceding their example.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.RepresentationTheory.Induced
import Mathlib.NumberTheory.Zsqrtd.Basic

namespace TauCeti.GL2Transfer

open Matrix

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
Global JL is an equivalence only between the supplied non-norm quaternionic discrete spectrum and the D-compatible cuspidal GL₂ spectrum over the same number field and central character. All actual local JL, Hecke, twisting and inverse maps are required; an arbitrary pair of types need not be equivalent.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.globalJL, TauCeti.GL2Transfer.globalJL_local, TauCeti.GL2Transfer.globalJL_central, TauCeti.GL2Transfer.globalJL_inverse, TauCeti.GL2Transfer.globalJL_twist, TauCeti.GL2Transfer.globalJL_split.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.jl_split_test, TauCeti.GL2Transfer.jl_steinberg_test, TauCeti.GL2Transfer.jl_eisenstein_excluded_test, TauCeti.GL2Transfer.jl_inverse_test.

GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl
TauCeti.GL2Transfer.globalJL
Let F be a number field, D/F a quaternion algebra with ramification set S (finite and real places; complex places are split), fixed isomorphisms D⊗F_v ≅ M₂(F_v) for v ∉ S, and ω a unitary character of F^×\A_F^×. Let DS_D(ω) be the set of isomorphism classes of irreducible subrepresentations of the right regular representation of D×(A_F) on L²(D×(F)A_F^×\D×(A_F), ω). For nonsplit D the quotient is compact and DS_D(ω) consists of all irreducible automorphic representations with central character ω. For D = M₂(F) it consists of the cuspidal representations and the characters χ∘det with χ² = ω. There is a bijection JL_D from the members of DS_D(ω) that are not one-dimensional (not of the form χ∘Nrd) onto the cuspidal automorphic representations π of GL₂(A_F) with central character ω such that π_v is square-integrable modulo the centre at every v ∈ S. At a finite v ∈ S this means a Steinberg twist or a supercuspidal representation; at a real v ∈ S, a discrete series D_k⊗χ (k ≥ 2), whose partner is the algebraic D_v× type of dimension k−1. At v ∉ S the components agree via the fixed isomorphisms; at v ∈ S they match by the R17.1 correspondence JL_v. For D = M₂(F) it is the identity on cuspidal classes. The inverse is part of the assertion. For a non-unitary central quasi-character, twist by a real power of |Nrd| (resp. |det|); the correspondence commutes with such twists. For split D the restriction to the discrete spectrum is essential: Eisenstein constituents are automorphic, do not factor through det, and are not in the domain.
Hypotheses: F is a number field. D is a quaternion algebra over F with ramification set S (finite and real places, |S| even; complex places split); S = ∅ (D = M₂(F)) is allowed. Isomorphisms D ⊗_F F_v ≅ M₂(F_v) are fixed for every v ∉ S. ω is a unitary character of F^×\A_F^×, identified with the central characters on D×(A_F) and GL₂(A_F); a non-unitary quasi-character is reduced to this case by twisting with |Nrd|^s and |det|^s. Domain: the irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) that are not one-dimensional (not of the form χ∘Nrd). Codomain: cuspidal automorphic representations π of GL₂(A_F) with central character ω and π_v square-integrable modulo the centre at every v ∈ S. At v ∈ S the local matching is the R17.1 correspondence JL_v; at v ∉ S it is the fixed isomorphism.
TauCeti.GL2Transfer.globalJL_local: For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
TauCeti.GL2Transfer.globalJL_central: The central character of JL_D π′ is the central character of π′.
TauCeti.GL2Transfer.globalJL_inverse: The inverse of JL_D recovers every non-one-dimensional discrete series π′ of D×(A_F). JL_D of the inverse recovers every cuspidal π with π_v square-integrable at all v ∈ S.
TauCeti.GL2Transfer.globalJL_twist: For a unitary Hecke character χ of F, JL_D(π′⊗χ∘Nrd) = JL_D(π′)⊗χ∘det; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character.
TauCeti.GL2Transfer.globalJL_split: For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes.
TauCeti.GL2Transfer.jl_split_test: For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
TauCeti.GL2Transfer.jl_steinberg_test: For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
TauCeti.GL2Transfer.jl_inverse_test: For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.
TauCeti.GL2Transfer.jl_eisenstein_excluded_test: For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of JL_D, because it does not occur in L²_disc(GL₂(Q)A^×\GL₂(A), μν).
-/
section Satake
variable {K L : Type*} [CommRing K] [CommRing L]

/-- The transfer-specific power rule on the existing GL, not a Satake carrier:
the representative `A ^ f` of the base-changed Satake class at a place of residue
degree `f`. f=0 is the formal matrix-power extension, not a field extension. -/
def unramifiedBaseChange (A : GeneralLinearGroup (Fin 2) K)
    (f : ℕ) : GeneralLinearGroup (Fin 2) K := A ^ f

lemma unramifiedBaseChange_one (A : GeneralLinearGroup (Fin 2) K) :
    unramifiedBaseChange A 1 = A := by sorry

lemma unramifiedBaseChange_tower (A : GeneralLinearGroup (Fin 2) K) (f g : ℕ) :
    unramifiedBaseChange (unramifiedBaseChange A f) g =
      unramifiedBaseChange A (f * g) := by sorry

lemma unramifiedBaseChange_conjugate (A P : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    unramifiedBaseChange (P * A * P⁻¹) f = P * unramifiedBaseChange A f * P⁻¹ := by sorry

lemma unramifiedBaseChange_det (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.det (unramifiedBaseChange A f) = GeneralLinearGroup.det A ^ f := by sorry

lemma unramifiedBaseChange_map (φ : K →+* L) (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.map φ (unramifiedBaseChange A f) =
      unramifiedBaseChange (GeneralLinearGroup.map φ A) f := by sorry

-- TauCeti.GL2Transfer.bc_degree_one_test
example (A : GeneralLinearGroup (Fin 2) K) : unramifiedBaseChange A 1 = A := by sorry

-- TauCeti.GL2Transfer.bc_identity_test
example (f : ℕ) : unramifiedBaseChange (1 : GeneralLinearGroup (Fin 2) K) f = 1 := by sorry

-- TauCeti.GL2Transfer.bc_diagonal_square_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] ∧
    (unramifiedBaseChange A 2).val.trace = 13 ∧
    (unramifiedBaseChange A 2).val.det = 36 := by sorry

-- TauCeti.GL2Transfer.bc_not_identity_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    unramifiedBaseChange A 2 ≠ unramifiedBaseChange A 1 := by sorry

-- TauCeti.GL2Transfer.bc_tower_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] ∧
    unramifiedBaseChange (unramifiedBaseChange A 2) 3 = unramifiedBaseChange A 6 := by sorry
end Satake

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Cyclic base change is a map only between the supplier's isobaric GL₂ classes over F and over the given prime-cyclic E/F, with the arithmetic LLC normalization and the R17.2 trace comparison, and its Galois invariance refers to the actual Gal(E/F) action on automorphic classes over E; a function between two arbitrary types, or invariance under an arbitrary self-map, is not this statement.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.cyclicBaseChange, TauCeti.GL2Transfer.cyclicBaseChange_local, TauCeti.GL2Transfer.cyclicBaseChange_unramified, TauCeti.GL2Transfer.cyclicBaseChange_central, TauCeti.GL2Transfer.cyclicBaseChange_twist, TauCeti.GL2Transfer.cyclicBaseChange_galois, TauCeti.GL2Transfer.cyclicBaseChange_coefficients.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.cyclic_split_test, TauCeti.GL2Transfer.cyclic_inert_test, TauCeti.GL2Transfer.cyclic_induced_test, TauCeti.GL2Transfer.cyclic_odd_degree_test.

GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change
TauCeti.GL2Transfer.cyclicBaseChange
For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. BC(π) is the unique isobaric Π such that, at every place w|v, Π_w is the local base-change lift of π_v (Langlands §2, criteria (i)/(ii)). At an unramified w|v its Satake class is unramifiedBaseChange(A_v, f(w/v)); when v splits, Π_w ≅ π_v. A cuspidal input has a cuspidal output or, only for ℓ = 2, an output θ⊞θ^σ for a Hecke character θ of E. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F), and the map does not depend on the chosen generator σ. Neither cuspidality nor injectivity is automatic. The theorem local-compatibility identifies BC(π)_w with the restriction to W_{E_w} of the arithmetic-normalised LLC parameter of π_v.
Hypotheses: F is a number field and E/F is cyclic of prime degree ℓ; σ is a generator of Gal(E/F). The resulting map does not depend on σ. π is an isobaric automorphic representation of GL₂(A_F): cuspidal, or χ₁⊞χ₂ with idele class characters χ₁, χ₂. Local lifting is the Langlands–Shintani local base change (Langlands §2 criteria (i)/(ii); Arthur–Clozel Ch. 1 Definition 6.1). Unramified Satake classes use the R16.3 arithmetic normalisation. Arthur–Clozel's theorems assume representations induced from unitary cuspidal ones; Langlands's GL₂ theorems have no unitarity assumption.
TauCeti.GL2Transfer.cyclicBaseChange_local: At w|v, BC(π)_w is the local base-change lift of π_v in the sense of Langlands §2 (criteria (i)/(ii)); at split v it is π_v. Its description as the restriction of the normalised local parameter to W_{E_w} is the theorem local-compatibility.
TauCeti.GL2Transfer.cyclicBaseChange_unramified: At unramified w|v, Satake equals unramifiedBaseChange(A_v,f(w/v)).
TauCeti.GL2Transfer.cyclicBaseChange_central: The central character is pullback along the idele norm.
TauCeti.GL2Transfer.cyclicBaseChange_twist: BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}).
TauCeti.GL2Transfer.cyclicBaseChange_galois: Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers.
TauCeti.GL2Transfer.cyclicBaseChange_coefficients: In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the recorded normalization.
TauCeti.GL2Transfer.cyclic_split_test: At a completely split v each local output equals the original component and its Satake representative A_v.
TauCeti.GL2Transfer.cyclic_inert_test: At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
TauCeti.GL2Transfer.cyclic_induced_test: For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
TauCeti.GL2Transfer.cyclic_odd_degree_test: For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.
-/
section Cyclic
variable {FClass EClass V W LF LE H HF HE C K : Type*} [CommRing K]

-- TauCeti.GL2Transfer.cyclic_inert_test (matrix component)
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] := by sorry
end Cyclic

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Solvable base change is the isobaric class map for a finite solvable Galois E/F with chosen compatible embeddings, characterized independently of a prime-cyclic tower; maps between arbitrary types cannot satisfy the identity, tower and twist laws simultaneously.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.solvableBaseChange, TauCeti.GL2Transfer.solvableBaseChange_refl, TauCeti.GL2Transfer.solvableBaseChange_tower, TauCeti.GL2Transfer.solvableBaseChange_local, TauCeti.GL2Transfer.solvableBaseChange_twist.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.solvable_empty_test, TauCeti.GL2Transfer.solvable_two_towers_test, TauCeti.GL2Transfer.solvable_degree_six_test, TauCeti.GL2Transfer.solvable_cuspidality_test.

GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change
TauCeti.GL2Transfer.solvableBaseChange
Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.
Hypotheses: E/F is a finite Galois extension of number fields with solvable Galois group. A chosen subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E in which each F_i/F_{i−1} is cyclic of prime degree ℓ_i (F_i need not be normal over F), with compatible embeddings and places. π is an isobaric automorphic representation of GL₂(A_F). Non-Galois extensions, such as non-normal cubic fields, are excluded.
TauCeti.GL2Transfer.solvableBaseChange_refl: For E=F and the empty tower the map is identity.
TauCeti.GL2Transfer.solvableBaseChange_tower: For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings.
TauCeti.GL2Transfer.solvableBaseChange_local: Every local parameter is restriction along the total local extension, and at completely split places it is unchanged.
TauCeti.GL2Transfer.solvableBaseChange_twist: Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}.
TauCeti.GL2Transfer.solvable_empty_test: The empty tower fixes every isobaric class.
TauCeti.GL2Transfer.solvable_two_towers_test: For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
TauCeti.GL2Transfer.solvable_degree_six_test: At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
TauCeti.GL2Transfer.solvable_cuspidality_test: A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.
-/
section Solvable
variable {FClass EClass LClass V W LF LE HF HE : Type*}

-- TauCeti.GL2Transfer.solvable_degree_six_test (matrix component)
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] := by sorry
end Solvable

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The Gelbart–Jacquet construction needs the genuine unitary cuspidal GL₂ and isobaric GL₃ carriers, all-place local factors/LLC and the distinct highly ramified T-converse input. The matrix component below does not construct an automorphic lift.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.adjointLift, TauCeti.GL2Transfer.adjointLift_local, TauCeti.GL2Transfer.adjointLift_unramified, TauCeti.GL2Transfer.adjointLift_twist, TauCeti.GL2Transfer.adjointLift_central.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.adjoint_diagonal_test, TauCeti.GL2Transfer.adjoint_scalar_test, TauCeti.GL2Transfer.adjoint_twist_test, TauCeti.GL2Transfer.adjoint_not_sym_square_test.

GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift
TauCeti.GL2Transfer.adjointLift
For a unitary cuspidal GL₂ automorphic representation π over a number field F, the adjoint lift Ad(π)=Sym²(π)⊗ω_π^{-1} (the Gelbart–Jacquet lift) is an isobaric automorphic GL₃ representation with trivial central character, self-dual, whose component at every place is the Gelbart–Jacquet local lift: L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v), with the matching ε-factors, for every character χ_v. Through the GL₂ local Langlands correspondence and its pair-factor compatibility these are the factors of the adjoint of the rank-two LLC parameter. At an unramified v with eigenvalues α,β its eigenvalues are α/β,1,β/α. It is invariant under character twist of π. It is cuspidal exactly when π has no nontrivial self-twist (GJ78 Theorem 9.3 and Remark 9.9). If π≅π⊗η with η≠1, then η=η_{E/F} is quadratic, π=AI_{E/F}(θ), and Ad(π)=η_{E/F}⊞AI_{E/F}(θ/θ^σ), with the rank-two induction interpreted isobarically if its character is invariant. The adjoint of a Galois or Weil–Deligne parameter is taken from ArithmeticGaloisRepresentations G7.
Hypotheses: F is a number field (§9 and Theorem 9.3 are stated for number fields). π is a unitary cuspidal automorphic representation of GL₂(A_F). Cuspidal branch: π⊗χ≇π for every Hecke character χ≠1 (GJ78 Theorem 9.3). Self-twist branch: π≅π⊗η with η≠1; then η=η_{E/F} is quadratic and π=AI_{E/F}(θ) (GJ78 §3.7, Remark 9.9). Normalisation: Ad(π)=Sym²(π)⊗ω_π^{-1} is the GJ78 lift, characterised at every place by trivial central character, self-duality and L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v) with matching ε; unitary normalisation. The identification of local components with the adjoint of the rank-two LLC parameter uses the GL₂ LLC with pair-factor compatibility (R16.3, ET.6) and the GL₃ local converse theorem; GJ78 does not prove it for extraordinary π_v.
TauCeti.GL2Transfer.adjointLift_local: Each local component of Ad(π) is the Gelbart–Jacquet local lift of π_v; under the GL₂ LLC its parameter is the adjoint of the local parameter of π.
TauCeti.GL2Transfer.adjointLift_unramified: Satake eigenvalues (α,β) become (α/β,1,β/α).
TauCeti.GL2Transfer.adjointLift_twist: Ad(π⊗χ)=Ad(π) for every Hecke character χ.
TauCeti.GL2Transfer.adjointLift_central: The central character of Ad(π) is trivial.
TauCeti.GL2Transfer.adjoint_diagonal_test: The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
TauCeti.GL2Transfer.adjoint_scalar_test: Scalar Satake input diag(a,a), a≠0, gives the identity class.
TauCeti.GL2Transfer.adjoint_twist_test: Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
TauCeti.GL2Transfer.adjoint_not_sym_square_test: For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.
-/
section AdjointMatrix
variable {K : Type*} [Field K]
/-- The diagonal matrix formula only; automorphic existence is the omitted
`adjointLift` interface. Nonzero Satake roots are required in comparisons. -/
def adjointSatakeDiagonal (α β : K) : Matrix (Fin 3) (Fin 3) K :=
  diagonal ![α / β, 1, β / α]

-- TauCeti.GL2Transfer.adjoint_diagonal_test (matrix component)
example : adjointSatakeDiagonal (2 : ℚ) 3 =
    !![2/3, 0, 0; 0, 1, 0; 0, 0, 3/2] := by sorry
-- TauCeti.GL2Transfer.adjoint_scalar_test (matrix component)
example (a : K) (ha : a ≠ 0) : adjointSatakeDiagonal a a = 1 := by sorry
-- TauCeti.GL2Transfer.adjoint_twist_test (matrix component)
example (α β u : K) (hu : u ≠ 0) :
    adjointSatakeDiagonal (u * α) (u * β) = adjointSatakeDiagonal α β := by sorry
-- TauCeti.GL2Transfer.adjoint_not_sym_square_test (matrix component)
example : adjointSatakeDiagonal (2 : ℚ) 3 ≠ diagonal ![4, 6, 9] := by sorry
end AdjointMatrix

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
Non-normal cubic base change requires an actual separable cubic number-field extension, its places/residue degrees, the weak JPSS automorphic transfer and isobaric uniqueness. Its original construction and the stronger Carayol all-place upgrade remain separate source-proof gaps. No arbitrary function between carriers is a transfer.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.cubicBaseChange, TauCeti.GL2Transfer.cubicBaseChange_unramified, TauCeti.GL2Transfer.cubicBaseChange_twist, TauCeti.GL2Transfer.cubicBaseChange_central, TauCeti.GL2Transfer.cubicBaseChange_unique.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.cubic_split_test, TauCeti.GL2Transfer.cubic_one_two_test, TauCeti.GL2Transfer.cubic_inert_test, TauCeti.GL2Transfer.cubic_not_three_test.

GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change
TauCeti.GL2Transfer.cubicBaseChange
Let K/F be a separable non-Galois cubic extension of number fields, with S₃ normal closure. The Jacquet–Piatetski-Shapiro–Shalika cubic transfer associates to a cuspidal GL₂ automorphic π over F an automorphic GL₂ representation BC_{K/F}(π) over K, taken isobaric, whose Satake class at almost every w|v is A_v^{f(w/v)}. In Tunnell's statement of [JPSS], Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), for almost all v. For an isobaric π=π(μ,ν) the transfer is π(μ∘N_{K/F},ν∘N_{K/F}). This stage constructs only this weak transfer. Carayol §12.2.1 also records local lifts for extensions of degree at most three (for non-Galois cubic extensions defined by L- and ε-factors) and states that the global lift has these local lifts as components at every place. That all-place statement, which Carayol's extraordinary comparison (AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary) needs, together with the correspondence of the local lift of a principal series, special or ordinary cuspidal π_v with the restriction of its Weil–Deligne parameter (asserted by Carayol §12.2.2 without reference), is an explicit source-proof gap and not part of these construction steps. The transfer respects twists via the norm and preserves the central character by norm pullback. A cuspidal input can cease to be cuspidal; for the primitive tetrahedral/octahedral dyadic parameters of Carayol §12.2.2, the restricted local parameter is irreducible. The original JPSS note and its GL₃/GL₂×GL₃ proof have not been obtained: the theorem rests on Tunnell's and Carayol's consumer statements.
Hypotheses: K/F is a separable cubic extension of number fields that is not Galois (normal closure with group S₃); the source theorem also covers Galois K/F. The input π is a cuspidal automorphic representation of GL₂(A_F) (both sources). The isobaric input π(μ,ν) is handled by composing the characters with N_{K/F}. Compatibility is asserted only at almost all places (unramified v with π_v=π(ρ_v)); the output is determined up to isomorphism among isobaric representations. Unitary normalisation; A_v is the Satake class of π_v and the output class at w|v is A_v^{f(w/v)}.
TauCeti.GL2Transfer.cubicBaseChange_unramified: At unramified w|v the output Satake class is the f(w/v)-power of the input class.
TauCeti.GL2Transfer.cubicBaseChange_twist: BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}).
TauCeti.GL2Transfer.cubicBaseChange_central: The central character is ω_π∘N_{K/F}.
TauCeti.GL2Transfer.cubicBaseChange_unique: The isobaric global output is uniquely determined by its almost-everywhere local Satake powers.
TauCeti.GL2Transfer.cubic_split_test: At a completely split place the three outputs are all the original Satake class A.
TauCeti.GL2Transfer.cubic_one_two_test: For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
TauCeti.GL2Transfer.cubic_inert_test: For residue degree three and A=diag(2,3), the output is diag(8,27).
TauCeti.GL2Transfer.cubic_not_three_test: At splitting type (1,2), replacing every output by A³ gives the wrong local components.
-/
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Quadratic automorphic induction needs the quadratic K/F, the continuous Hecke-character carrier of K, its Galois conjugation, actual Weil induction and the isobaric and cuspidal GL₂ carriers; a map between arbitrary types, an arbitrary σ or an arbitrary cuspidal subtype does not express the cuspidality criterion.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.quadraticInduction, TauCeti.GL2Transfer.quadraticInduction_local, TauCeti.GL2Transfer.quadraticInduction_central, TauCeti.GL2Transfer.quadraticInduction_baseChange, TauCeti.GL2Transfer.quadraticInduction_twist, TauCeti.GL2Transfer.quadraticInduction_cuspidal.
Full source-level tests awaiting the same carriers: TauCeti.GL2Transfer.induction_invariant_test, TauCeti.GL2Transfer.induction_split_test, TauCeti.GL2Transfer.induction_determinant_test, TauCeti.GL2Transfer.induction_noninvariant_test.

GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction
TauCeti.GL2Transfer.quadraticInduction
Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. The finite-group induction carrier and Mackey formulas are imported, not defined here.
Hypotheses: K/F is a separable quadratic extension of number fields (JL70 allows global fields), σ its nontrivial automorphism and η=η_{K/F}. θ is a Hecke character (quasi-character of A_K^×/K^×). Cuspidal branch: θ≠θ^σ, equivalently θ does not factor through N_{K/F} (class field theory). Unitary normalisation: at inert or ramified v the local component is π(Ind θ_w); at split v it is π(θ_w,θ_{w′}).
TauCeti.GL2Transfer.quadraticInduction_local: Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
TauCeti.GL2Transfer.quadraticInduction_central: ω(AI θ)=η_{K/F}·θ|_{A_F×}.
TauCeti.GL2Transfer.quadraticInduction_baseChange: BC_{K/F}(AI θ)=θ⊞θ^σ.
TauCeti.GL2Transfer.quadraticInduction_twist: AI(θ·χ∘N)=AI(θ)⊗χ.
TauCeti.GL2Transfer.quadraticInduction_cuspidal: AI θ is cuspidal if and only if θ≠θ^σ.
TauCeti.GL2Transfer.induction_invariant_test: θ=χ∘N has output χ⊞χη and is not cuspidal.
TauCeti.GL2Transfer.induction_split_test: At v split as w,w′ the local parameter is θ_w⊕θ_w′.
TauCeti.GL2Transfer.induction_determinant_test: For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
TauCeti.GL2Transfer.induction_noninvariant_test: When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.
-/
section QuadraticInduction
variable {FClass EClass H V L2 L1 HF C : Type*}

-- In the basis {e, g e} the parameter of a coset element g is antidiagonal; its
-- determinant -(a * b) carries the sign η_{K/F}(g) = -1.
-- TauCeti.GL2Transfer.induction_determinant_test (matrix component)
example {K : Type*} [CommRing K] (a b : K) :
    (!![0, a; b, 0] : Matrix (Fin 2) (Fin 2) K).det = -(a * b) := by sorry
end QuadraticInduction

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The non-norm JL domain, eligible cuspidal range, actual Hecke/local-factor maps, compatible rational models and prescribed infinity/globalization hypotheses are required. Equality of rationality fields does not itself provide those models.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.norm_exception, TauCeti.GL2Transfer.split_hecke, TauCeti.GL2Transfer.local_factors, TauCeti.GL2Transfer.strong_multiplicity_one, TauCeti.GL2Transfer.multiplicity_one, TauCeti.GL2Transfer.coefficient_conjugation, TauCeti.GL2Transfer.rational_models, TauCeti.GL2Transfer.definite_infinity, TauCeti.GL2Transfer.invariant_exchange, TauCeti.GL2Transfer.supercuspidal_globalization.
Retained numeric fragment: TauCeti.GL2Transfer.indefinite_parity (parity arithmetic only).

GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception
TauCeti.GL2Transfer.norm_exception
Let D/F be a nonsplit quaternion algebra with ramification set S and χ a Hecke character of F^×\A_F^×. The one-dimensional automorphic representation χ∘Nrd of D×(A_F) is not in the domain of the cuspidal JL bijection. Its classical local transfers are: St_v⊗χ_v at finite v ∈ S, the weight-two discrete series twisted by χ_v at real v ∈ S, and the one-dimensional χ_v∘det at v ∉ S. Their restricted tensor product therefore has one-dimensional components at almost all places and is not cuspidal. JL70 notes that it acts on no subspace of the automorphic forms on GL₂(A_F), and leaves open whether it is a constituent. In Badulescu–Renard's extended discrete-spectrum correspondence (χ unitary), χ∘Nrd corresponds instead to the residual one-dimensional discrete series χ∘det of GL₂(A_F). There the local map |LJ_v| sends χ_v∘det to χ_v∘Nrd. So |LJ_v| agrees with classical JL_v on square-integrable representations but is not injective on all compatible unitary ones, since both χ_v∘det and St_v⊗χ_v go to χ_v∘Nrd. The two branches must not be identified.
Hypotheses: D/F is a nonsplit quaternion algebra over a number field F, with ramification set S ≠ ∅. χ is a Hecke character of F^×\A_F^×; for the Badulescu–Renard comparison χ is unitary. Local transfers at v ∈ S are the R17.1 correspondence; at v ∉ S the fixed isomorphisms are used.

GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke
TauCeti.GL2Transfer.split_hecke
Let π′ and π = JL_D π′ be as in global-jl. At every finite v ∉ S the fixed algebra identification identifies their local representations, hence their K_v-invariant modules for every compact open K_v and the action of the local Hecke algebra on them. In particular, at a spherical v the eigenvalues t_v of T_v = [K_v diag(ϖ_v,1)K_v] and s_v of S_v = [K_v diag(ϖ_v,ϖ_v)K_v] agree. Consequently the arithmetic degree-two Euler polynomial 1 − a_v X + b_v X², with a_v = t_v and b_v = q_v s_v, agrees; its reciprocal is the polynomial X² − T_vX + N(v)S_v of CDN23. This does not assert an integral global Hecke-module isomorphism, equality of multiplicities at unrelated levels, or spherical vectors at division places.
Hypotheses: π′ is in the domain of global-jl and π = JL_D π′. v is a finite place of F not in the ramification set S, with D⊗F_v ≅ M₂(F_v) fixed, and K_v ⊂ D_v× corresponds to GL₂(O_{F_v}) (or any compact open subgroup transported by the same isomorphism). Hecke operators are the unnormalized double cosets T_v = [K_v diag(ϖ_v,1)K_v] and S_v = [K_v diag(ϖ_v,ϖ_v)K_v] (R16.2 arithmetic normalization); q_v is the residue cardinality.

GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors
TauCeti.GL2Transfer.local_factors
For π′ in the domain of global-jl, π = JL_D π′, a fixed nontrivial additive character ψ = ⊗ψ_v of F\A_F, every place v and every quasi-character ω_v of F_v^×: L(s, ω_v⊗π_v) = L(s, ω_v⊗π′_v), L(s, ω_v^{-1}⊗π̃_v) = L(s, ω_v^{-1}⊗π̃′_v) and ε(s, ω_v⊗π_v, ψ_v) = ε(s, ω_v⊗π′_v, ψ_v). Here, at v ∈ S, the factors of π′_v are JL70's and the GL₂ factors are in the R16.3 normalization; at v ∉ S the equalities are the fixed identification. In this normalization the local functional equation of the zeta integrals on D_v carries the extra sign h_v = −1 for v ∈ S. If instead the constant of that functional equation is taken as the ε-factor of π′_v, then ε(s, ω_v⊗π′_v, ψ_v) = −ε(s, ω_v⊗π_v, ψ_v) at each v ∈ S, and the global product of these signs is (−1)^{|S|} = 1. Hence for every Hecke character ω the completed L-functions agree, L(s, ω⊗π′) = L(s, ω⊗π), as do the global ε-factors and the functional equations, with compatible measures and the same ψ.
Hypotheses: π′ is in the domain of global-jl and π = JL_D π′; S is the ramification set of D. ψ = ⊗ψ_v is a fixed nontrivial additive character of F\A_F, and the same ψ_v is used on D_v× and on GL₂(F_v). ω_v ranges over all quasi-characters of F_v^×, and ω over all Hecke characters of F. At v ∈ S the factors of π′_v are JL70's; at v ∉ S they are those of the GL₂-representation via the fixed isomorphism; the GL₂ factors are in the R16.3 normalization.

GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one
TauCeti.GL2Transfer.strong_multiplicity_one
Let π′ and σ′ be discrete series of D×(A_F): irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for a unitary ω. For nonsplit D these are, up to a twist by |Nrd|^s, all irreducible automorphic representations. Assume they are not one-dimensional. If π′_v ≅ σ′_v for all finite v outside a finite set, then π′ ≅ σ′. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.
Hypotheses: F is a number field and D/F a quaternion algebra. π′ and σ′ are discrete series of D×(A_F) (irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for unitary ω), not one-dimensional; for nonsplit D this covers every irreducible automorphic representation up to a twist by |Nrd|^s. π′_v ≅ σ′_v for all finite places v outside a finite set.

GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one
TauCeti.GL2Transfer.multiplicity_one
For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of D×(A_F) occurs with multiplicity exactly one in L²_disc(D×(F)A_F^×\D×(A_F), ω). Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.
Hypotheses: F is a number field and D/F a quaternion algebra. ω is a fixed unitary character of F^×\A_F^× and the spectrum is L²_disc(D×(F)A_F^×\D×(A_F), ω). π′ is a discrete series of D×(A_F) with central character ω, not one-dimensional.

GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation
TauCeti.GL2Transfer.coefficient_conjugation
Let F be totally real, D/F a quaternion algebra with ramification set S, and π = JL_D π′ cohomological: π_v is a discrete series of weight k_v ≥ 2 at every real place, all k_v of the same parity. Suppose, by the R16.4 rationality interface, that for σ ∈ Aut(C) the conjugate σπ_f is the finite part of a cuspidal cohomological π^σ, whose weights are those of π permuted by σ acting on the real embeddings. Then π^σ is again D-compatible: square-integrability at finite places of S is preserved by σ, and all real components are discrete series. Its inverse transfer π′^σ := JL_D^{-1}(π^σ) has finite part σπ′_f, the σ-conjugated algebraic infinity type, and central character with finite part σ∘ω_f. Hence Q(π′_f) = Q(π_f), and both equal the field generated by the arithmetic away-S Hecke eigenvalues (a_v, b_v). This holds only in the cohomological setting supplied by R16.4; it is not a claim of rationality for Maass forms or weight-one Artin forms.
Hypotheses: F is a totally real number field, D/F a quaternion algebra with ramification set S. π = JL_D π′ is cohomological: at every real place v, π_v is a discrete series of weight k_v ≥ 2, all k_v of the same parity; at real v ∈ S, π′_v is the matching algebraic D_v× type. The R16.4 rationality interface: for σ ∈ Aut(C), σπ_f is the finite part of a cuspidal cohomological π^σ with weights permuted by σ. Hecke eigenvalues are in the arithmetic normalization of split-hecke (a_v = t_v, b_v = q_v s_v), v ∉ S finite.

GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models
TauCeti.GL2Transfer.rational_models
Let (π′, π) be the cohomological JL pair of coefficient-conjugation, and L ⊂ C a field containing Q(π_f) = Q(π′_f). A p-adic coefficient field such as CDN20's is used through a fixed isomorphism C ≅ Q̄_p. (i) If π′_f and π_f have L-models, then at every finite v ∉ S the fixed identification gives an L-linear isomorphism of the L-models of π′_v and π_v, hence of their K_v-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of π′_f: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).
Hypotheses: (π′, π) is a cohomological JL pair as in coefficient-conjugation. L ⊂ C is a field containing Q(π_f) = Q(π′_f); a p-adic coefficient field is reached through a fixed isomorphism C ≅ Q̄_p. Models: L-structures on π′_f and π_f stable under the group actions, when they exist; for GL₂ they are supplied, with any descent condition, by the R16.4 interface. Hecke eigenvalues are in the arithmetic normalization of split-hecke.

GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity
TauCeti.GL2Transfer.definite_infinity
Let F be totally real and D ramified at every real place. A representation π′ in the domain of global-jl whose real components are irreducible algebraic representations of D_v× ≅ H× (of the highest weights normalized by R17.1) transfers to a cuspidal π whose real components are discrete series with the same infinitesimal characters (Sym^{k−2} ↔ D_k). Over Q with D ramified exactly at {p,∞}, take Pan's space A_{(k,0)} = A_{D,−χ}, χ = (−k,0), of W^{(k,0)}-valued quaternionic forms. Here W^{(k,0)} has highest weight (k,0) and is the dual of the irreducible algebraic D_p×-representation of highest weight (0,−k). For k ≥ 1, A_{(k,0)} decomposes under T_S into eigenspaces indexed by cuspidal π of GL₂(A_Q) such that π_∞ has the infinitesimal character of the algebraic GL₂-representation of highest weight (0,−k), (π^∞)^{K^p} ≠ 0, and π_p is special or supercuspidal. So the spectrum lies in σ^{K^p}_{k+2,1}, the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t through the cyclotomic character. For k = 0, A_{(0,0)} = A^c ⊕ A^1 with A^1 the forms factoring through Nrd: norm-factor eigenforms have weight-zero spectrum σ_0^{K^p}, and the weight-two cuspidal branch σ^{K^p}_{2,1} lives on A^c. So the norm-factor subspace must be removed to get the weight-two cuspidal branch. Construction of the algebraic form space and its identification with automorphic representations of D×(A_Q) remain the R18.3 owner's work.
Hypotheses: F is totally real and D/F is ramified at every real place. π′ is in the domain of global-jl and its real components are irreducible algebraic representations of D_v× ≅ H× (up to the fixed twist), with highest weights normalized by R17.1. For the Pan specialisation: F = Q, D ramified exactly at {p,∞}, χ = (−k,0) with k ≥ 0, K^p ⊂ GL₂(A_f^p) ≅ (D⊗A_f^p)× via Pan's identification (main involution), and T_S = Z_p[T_ℓ, S_ℓ : ℓ ∉ S]. Pan's coefficient field is the p-adic C (completion of Q̄_p); the algebraic form space and its comparison with complex automorphic forms are supplied by R18.3.

GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity
TauCeti.GL2Transfer.indefinite_parity
For totally real F of degree d, a quaternion algebra B split at exactly one real place and ramified at the other d−1 has a ramification set of even cardinality, so its number of ramified finite places has the parity of d−1. In CDN20 §5.2.1, B̌ is split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭; CDN20 puts no degree condition on F, and the parity of the remaining finite ramification is forced by the product formula. Given such B and a cuspidal π of GL₂(A_F) that is square-integrable at every place of Ram(B), the inverse transfer JL_B^{-1}(π) is the automorphic representation used on the associated Shimura curve. It has the same components, hence the same Hecke data, at every split finite place. The geometry and integral/cohomological realization belong to R18/R22. Parity is applied from ClassFieldTheory Layer 14, not reproved.
Hypotheses: F is totally real of degree d. B/F is a quaternion algebra split at exactly one real place and ramified at the other d−1 real places (d = 1 allowed: B split at the real place of Q). B is given by the quaternion/class-field suppliers; the parity is applied from ClassFieldTheory Layer 14. π is a cuspidal representation of GL₂(A_F) with π_v square-integrable at every place of Ram(B), including the d−1 ramified real places.

GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange
TauCeti.GL2Transfer.invariant_exchange
In CDN23 §4.1 (F = Q_p, p > 2), E is a totally real field of even degree in which p splits completely, supplied by a globalization (Prop. 4.5), with a place 𝔭 | p (so E_𝔭 = Q_p) and a real place ∞₀. D⁰ is a quaternion algebra over E ramified exactly at the real places. D has the invariants of D⁰ exchanged at {𝔭,∞₀}: it is ramified at 𝔭 and at the real places other than ∞₀, and split at ∞₀. Both ramification sets have [E:Q] elements. The algebras are identified away from {𝔭,∞₀} by the fixed isomorphism (4.6). Any cuspidal π of GL₂(A_E) that is square-integrable at all real places and at 𝔭 lies in the image of both global-jl correspondences. This gives π⁰ = JL_{D⁰}^{-1}(π) and π^D = JL_D^{-1}(π), whose components away from {𝔭,∞₀} correspond under (4.6), with equal Hecke actions on invariants under any compact open U^𝔭 transported by (4.6). At 𝔭, π⁰_𝔭 is the special or supercuspidal π_𝔭 (via the fixed identification) and π^D_𝔭 = JL_𝔭^{-1}(π_𝔭). At ∞₀, π⁰_{∞₀} is the algebraic type matching the discrete series π_{∞₀} = π^D_{∞₀}. In particular CDN23's tame level U^𝔭, with U_v = GL₂(O_{E_v}) for v ≠ w₁ and U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}, is carried to D× through (4.6). Here w₁ is CDN23's auxiliary place: N(w₁) is prime to 2Np and not ≡ 1 mod p, and the ratio of the eigenvalues of ρ̄(Frob_{w₁}) is not 1 or N(w₁)^{±1}. N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×. Existence of w₁ and the small-level geometry are separate supplied inputs, not consequences of JL.
Hypotheses: Setting of CDN23 §4: F = Q_p with p > 2; E totally real of even degree in which p splits completely (Prop. 4.5), with a place 𝔭 | p (E_𝔭 = Q_p) and a real place ∞₀. D⁰ and D are given quaternion algebras over E: D⁰ ramified exactly at the real places, and D ramified at 𝔭 and at the real places other than ∞₀. Both ramification sets have [E:Q] elements, which is even (consistency by ClassFieldTheory Layer 14). The isomorphism (4.6) D⁰⊗A^{𝔭,∞₀} ≅ D⊗A^{𝔭,∞₀} and the maximal-order identifications (O_{D⁰})_v ≅ M₂(O_{E_v}) are fixed. π is a cuspidal representation of GL₂(A_E) that is square-integrable at every real place and at 𝔭. w₁ and the level U are CDN23's (existence of w₁ is a supplied input, [25, Lemma 8.2]).

GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization
TauCeti.GL2Transfer.supercuspidal_globalization
Let F₀ be a finite extension of Q_p, L a finite extension of Q_p (CDN20's coefficient field; complex representations are viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p), and τ = LL(M) an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ. The setting is CDN20 §5.2.1: E totally real with a place 𝔭 | p and E_𝔭 = F₀, a real place ∞₀, B̌ split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭, and B with the invariants of B̌ exchanged at {𝔭,∞₀}. The globalization sought is an automorphic Π̌ of B̌×(A_E), defined over L, with Π̌_∞ containing σ₂ and Π̌_𝔭 ≅ JL(τ). Here σ₂ is trivial at the real places other than ∞₀ and is the holomorphic discrete series of weight 2 with trivial central character at ∞₀. By footnote 21 this may require adjusting the central character, hence twisting everything by a character: τ by η∘det and JL(τ) by η∘Nrd for a character η of F₀^×, which changes ϖ. It may also require replacing L by a finite extension. The result is stated for the twisted data over the extended field. Given Π̌, global JL through GL₂ gives Π on B×(A_E) with Π^𝔭_f ≅ Π̌^𝔭_f under the fixed identifications and Π_𝔭 ≅ τ (twisted as above). Π̌^𝔭_f determines Π̌_𝔭 by quaternionic strong multiplicity one. The existence of Π̌ (Clozel's limit multiplicities, CDN20's [9]) is an explicit unresolved supplier gap, not a consequence of local transfer.
Hypotheses: F₀ is a finite extension of Q_p and τ = LL(M) is an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ (CDN20's ϖ-compatibility). L is a finite extension of Q_p (CDN20's coefficient field), with complex representations viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p. E, 𝔭 (E_𝔭 = F₀), ∞₀, B̌ and B are chosen as in CDN20 §5.2.1 and are given data. The existence of the globalization Π̌ (Clozel's limit-multiplicity theorem) is the recorded gap 'Clozel prescribed-supercuspidal globalization'. Twisting τ by a character of F₀^× and finitely extending L are allowed, as footnote 21 permits.
-/

-- Pure parity consequence of the supplied ramification parity.
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
These R17.4 interfaces need the actual prime-cyclic or solvable extension, its Galois action on automorphic classes over E, the cuspidal subtypes, the norm-kernel characters and the localRep restriction maps; with arbitrary types, functions and ℓ they are false.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.local_compatibility, TauCeti.GL2Transfer.cyclic_descent, TauCeti.GL2Transfer.cuspidality, TauCeti.GL2Transfer.cyclic_descent_fibers, TauCeti.GL2Transfer.isobaric_fibers, TauCeti.GL2Transfer.tower_independence, TauCeti.GL2Transfer.solvable_descent, TauCeti.GL2Transfer.prescribed_local_base_change.

GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility
TauCeti.GL2Transfer.local_compatibility
For the strong cyclic BC pair and every place w|v, rec^{arith}_{E_w}(BC(π)_w) equals rec^{arith}_{F_v}(π_v) restricted to W_{E_w}, including the monodromy operator and the normalization twist specified by R16.3. For a principal series restrict both characters; for a Steinberg twist retain nonzero monodromy; for a supercuspidal the restricted parameter may become reducible. At real-to-complex places restrict the real Weil parameter. A merely almost-everywhere Satake match is not this all-place statement. The global input gives only that BC(π)_w is the local Shintani lift of π_v (character identities). The passage to restricted parameters is local: Langlands covers reducible, special, dihedral and tetrahedral parameters; R16.3 supplies the octahedral (extraordinary) dyadic case for every ℓ. Carayol proves the case [E_w:F_v] ≤ 3 in the Proposition of his §12.2.2, but that Proposition belongs to AutomorphicGaloisRepresentations R19.2, downstream of this stage, so it is not used here.
Hypotheses: E/F is a cyclic extension of number fields of prime degree ℓ. π is an isobaric automorphic representation of GL₂(A_F) and BC(π) is its strong cyclic base change (cyclic-base-change). w|v is any place, archimedean or not, split, inert or ramified. E_w/F_v is trivial or cyclic of degree ℓ. rec^{arith} is the R16.3 arithmetic-normalised rank-two local Langlands correspondence with values in Frobenius-semisimple Weil–Deligne representations (monodromy included). Comparing the local Shintani lift with restriction of parameters for octahedral (extraordinary) π_v at p = 2, for every ℓ, is an R16.3 input; Carayol's proof of the degree ≤ 3 cases lives downstream in AutomorphicGaloisRepresentations R19.2.

GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent
TauCeti.GL2Transfer.cyclic_descent
For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the twisted trace formula comparison, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.
Hypotheses: E/F is a cyclic extension of number fields of prime degree ℓ, with σ a generator of Gal(E/F). Π is a cuspidal automorphic representation of GL₂(A_E); in the last clause, Π is isobaric. A descent of Π is an automorphic π over F with BC_{E/F}(π) ≅ Π (strong base change). η runs over the ℓ Hecke characters of F trivial on F^×N_{E/F}(A_E^×) (global class field theory).

GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality
TauCeti.GL2Transfer.cuspidality
Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.5/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.
Hypotheses: E/F is a cyclic extension of number fields of prime degree ℓ, and π is a cuspidal automorphic representation of GL₂(A_F). η is a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). The condition π ≅ π⊗η does not depend on which generator is chosen. BC_{E/F} is the strong cyclic base change of cyclic-base-change. AC89 Theorem 4.2 is stated for unitary π; the general case follows by twisting with |det|^s. Langlands has no unitarity restriction.

GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers
TauCeti.GL2Transfer.cyclic_descent_fibers
If Π is a Gal(E/F)-invariant cuspidal GL₂ representation and π is one of its cyclic descents, then its cyclic descents are precisely π⊗η^i, 0≤i<ℓ; these ℓ classes are distinct and all cuspidal. If E/F is quadratic and the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ, its descent is unique (and cuspidal): π⊗η≅π. The assertion of ℓ distinct descents therefore applies only when the output is cuspidal.
Hypotheses: E/F is a cyclic extension of number fields of prime degree ℓ, and η is a generator of the Hecke characters of F trivial on F^×N_{E/F}(A_E^×). First clause: Π is a cuspidal automorphic representation of GL₂(A_E) with Π^σ ≅ Π, and π is one of its descents. Second clause: ℓ = 2 and Π = θ⊞θ^σ for a Hecke character θ of E with θ ≠ θ^σ.

GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers
TauCeti.GL2Transfer.isobaric_fibers
For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ (possible only for ℓ=2), it has the quadratic cuspidal descent of the exchanged character pair described above.
Hypotheses: E/F is a cyclic extension of number fields of prime degree ℓ; N = N_{E/F} on ideles. π = χ₁⊞χ₂ with χ₁, χ₂ idele class characters of F, not necessarily unitary. The twisting characters run over the Hecke characters of F trivial on F^×N_{E/F}(A_E^×). The exchanged case θ⊞θ^σ with θ ≠ θ^σ occurs only for ℓ = 2.

GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence
TauCeti.GL2Transfer.tower_independence
For two prime-cyclic subnormal towers from F to the same solvable Galois extension E, the composed GL₂ isobaric base changes coincide. At all places unramified in the towers and in π, both Satake classes are A_v^{f(w/v)}, because residue degrees multiply along each tower. Isobaric strong multiplicity one therefore gives an isomorphism of the two global outputs, hence equality of every local component. Strong local compatibility is not needed for independence; it describes each common component as the restriction of the parameter of π_v. No chosen ordered diagonalization or chosen generator of a cyclic Galois group survives in the output.
Hypotheses: E/F is a finite Galois extension of number fields with solvable Galois group, and two subnormal towers from F to E have prime-cyclic steps. π is an isobaric automorphic representation of GL₂(A_F). Isobaric strong multiplicity one over E holds (R16.4; Langlands Lemma 3.1).

GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent
TauCeti.GL2Transfer.solvable_descent
Fix a prime-cyclic subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E and an isobaric automorphic GL₂ representation Π over E. Then Π is the composed base change of an isobaric π over F along this tower if and only if there is a chain Π_r=Π, Π_{r−1}, …, Π₀=π in which each Π_{i−1} is a cyclic descent of Π_i along F_i/F_{i−1} and, for i≥2, Π_{i−1} is invariant under Gal(F_{i−1}/F_{i−2}). At each step the possible Π_{i−1} are given by the cyclic fibre theorems. If Π_i is cuspidal there are ℓ_i distinct twists. If ℓ_i=2 and Π_i=θ⊞θ^σ with θ≠θ^σ, there is a unique cuspidal descent. If Π_i=(χ₁∘N)⊞(χ₂∘N), the two characters can be twisted independently by norm-kernel characters. The theorem supplies descent once these stepwise choices exist and records their ambiguities. It does not assert that Gal(E/F)-invariance of Π alone yields a descent to F: an invariant choice at each step, and compatibility with prescribed central characters, is a hypothesis, not a conclusion.
Hypotheses: A fixed subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each F_i/F_{i−1} cyclic of prime degree ℓ_i, and a generator σ_i of each Gal(F_i/F_{i−1}). Π is an isobaric automorphic representation of GL₂(A_E). Descent along the tower means preimage under the composed base change of solvable-base-change along this tower. Gal(E/F)-invariance of Π alone is not assumed to give a descent; the stepwise invariant choices are hypotheses.

GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change
TauCeti.GL2Transfer.prescribed_local_base_change
Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.
Hypotheses: E/F is a solvable Galois extension of number fields with a chosen prime-cyclic tower, supplied by the consumer together with chosen places and completions. T is a finite set of places of F that split completely in E. π is an isobaric (in applications, cuspidal) automorphic representation of GL₂(A_F); local parameters use the R16.3 arithmetic normalisation. The existence of E with the prescribed splitting is supplied by the consumer and not proved here.
-/
section BCTheorems
variable {FClass EClass CF CE H V W LF LE C : Type*}

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
Cubic induction requires a cyclic degree-three number-field extension and its continuous Hecke-character carrier, actual Weil induction and local-factor maps. The non-invariant orbit is the cuspidal branch; an invariant character gives the three rank-one summands.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.cubic_character_induction.

GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction
TauCeti.GL2Transfer.cubic_character_induction
For a cyclic cubic extension E/F of number fields and a unitary Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ) whose local parameter at every place is Ind_{W_{E_w}}^{W_{F_v}}(θ_w) (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct, i.e. θ≠θ^σ. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.
Hypotheses: F is a number field and E/F a cyclic cubic extension whose Galois group is generated by σ. θ is a unitary Hecke character of E (a quasi-character is reduced to this by a twist by |·|^s); JPSS Theorem (14.2) assumes unitarity. Cuspidal branch: θ≠θ^σ, which is equivalent to irreducibility of Ind_{W_E}^{W_F}θ (Mackey). Invariant branch: θ=θ^σ; then θ=χ∘N_{E/F} by class field theory for the cyclic extension, and η generates the characters of A_F^×/F^×N_{E/F}(A_E^×). Unitary normalisation; at finite places the local component is characterised by GL₁-twisted L- and ε-factors equal to those of Ind θ_w.
-/
/-
Signature omission: TauCeti.GL2Transfer.gl3_recognition.
The analytic input is AL.3/gln-converse-reduced-rank at n=3: all GL1 twists
(or twists unramified at the specified finite S), dual entireness, strip bounds
and the functional equation. Nonempty S gives agreement outside S only.
The highly ramified T variant remains an acquisition gap. The second input is
AL.3/rs-global-poles with rs-boundary-nonvanishing and finiteness at s=1 of the
omitted local factors (AL.2/jacquet-shalika-satake-bound at unramified places; the
requested AL.3 unitary local convergence bound at ramified and archimedean places), for two unitary cuspidal GL3
representations and equality of their Rankin–Selberg factors against the first
dual, not equality of arbitrary objects or an isobaric uniqueness theorem.
The actual representation, twist, completed L/epsilon and pole carriers are
missing; no theorem signature is counted here. See the named packet gap and
AL G16. This application also uses adjoint-lift and cubic-character-induction.
-/

-- Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is planned in
-- AutomorphicGaloisRepresentations R19.2 (R19.2/carayol-cubic-base-change-of-extraordinary),
-- which imports the cubic transfer and Artin automorphy from here; it is not restated.
end BCTheorems

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Character extension needs the idele class group of a number field, its n-torsion quotient and the complex-place condition, and residual lifting needs a totally real field, a continuous absolutely irreducible solvable r̄ and an adequate integral coefficient ring; over arbitrary groups and rings both existence claims are false.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.finite_hecke_extension, TauCeti.GL2Transfer.odd_residual_lift.

GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension
TauCeti.GL2Transfer.finite_hecke_extension
Let F be a number field, n≥1, and ω:μ_n(F)\μ_n(A_F)→S¹ a continuous character, where μ_n(F)\μ_n(A_F) is viewed inside the idele class group C_F. Then ω extends to a finite-order continuous character of C_F if and only if its component ω_v on μ_n(F_v) is trivial at every complex place v; real places impose no condition. In particular the obstruction vanishes when F has no complex place, e.g. for totally real F. Extensions are not unique. In the Grunwald–Wang special case the cokernel of μ_n(F)\μ_n(A_F)→C_F[n] has order two, so one first chooses one of two extensions of ω to C_F[n]; either choice admits a finite-order extension when the condition holds, and the case affects only uniqueness. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.
Hypotheses: F is a number field and n ≥ 1; C_F = F^×\A_F^× is the idele class group, into which μ_n(F)\μ_n(A_F) embeds as a closed subgroup. ω: μ_n(F)\μ_n(A_F) → S¹ is a continuous character (automatically of order dividing n). An extension means a continuous character ω̃: C_F → S¹ restricting to ω; finite order means ω̃ has finite image. The criterion concerns only the complex places: ω_v = ω|μ_n(F_v) must be trivial for every complex v; no condition is imposed at real places.

GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift
TauCeti.GL2Transfer.odd_residual_lift
Let F be totally real, p>2, and r̄:G_F→GL₂(F̄_p) be continuous, absolutely irreducible and totally odd with solvable image. There is a totally odd continuous finite-image characteristic-zero lift ρ over a number field, a place λ above p and a stable lattice whose semisimplified reduction is r̄ after a specified residue-field embedding. The proof uses the finite-subgroup classification (projective image dihedral, A₄ or S₄), a reduction-compatible lift of that finite projective image to characteristic zero, Tate's theorem (finite-projective-lift) and a Teichmüller twist; Tate alone only lifts a projective homomorphism and does not ensure the prescribed residual reduction. Coefficient enlargement is allowed. BCGP state this lift citing only the classification [SD73] and Tate's theorem [Ser77, Theorem 4]; the reduction-compatible lift of the projective image and the final twist are not written out there and remain an explicit source-proof gap in this packet.
Hypotheses: F is a totally real number field and p>2 is prime. r̄: G_F→GL₂(F̄_p) is continuous and absolutely irreducible. r̄ is totally odd: det r̄(c_v)=−1 for every real place v. r̄ has solvable image (equivalently, solvable projective image). The output records a number field E of coefficients, a place λ of E above p, an embedding of the residue field of λ into F̄_p and a stable lattice; coefficient enlargement is allowed.
-/
section ArithmeticLifting
variable {G I T : Type*} [Group G] [Group I] [Group T]

-- AddCircle 1 over Q is the existing additive Q/Z quotient, with trivial action.
-- Q/Z is discrete, so continuous cochains on the Krull-topologized G_F are the
-- locally constant ones. The equation displays exactly the trivial-action
-- 2-cocycle condition, without a fake H² type. Generic groups fail this.
theorem tate_vanishing (F : Type*) [Field F] [NumberField F]
    (α : Field.absoluteGaloisGroup F → Field.absoluteGaloisGroup F → AddCircle (1 : ℚ))
    (hcont : IsLocallyConstant
      (fun p : Field.absoluteGaloisGroup F × Field.absoluteGaloisGroup F => α p.1 p.2))
    (hα : ∀ g h k, α g h + α (g * h) k = α g (h * k) + α h k) :
    ∃ b : Field.absoluteGaloisGroup F → AddCircle (1 : ℚ),
      IsLocallyConstant b ∧ ∀ g h, α g h = b g + b h - b (g * h) := by sorry

-- r is continuous with discrete finite image, i.e. its kernel is open in the
-- Krull topology; the lift has the same property. Generic groups do not have
-- this lifting property. The matrix/projective carriers are already in Mathlib.
theorem finite_projective_lift (F : Type*) [Field F] [NumberField F]
    (r : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : IsOpen (r.ker : Set (Field.absoluteGaloisGroup F))) :
    ∃ ρ : Field.absoluteGaloisGroup F →* GeneralLinearGroup (Fin 2) ℂ,
      IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) ∧ Set.Finite (Set.range ρ) ∧
        ProjGenLinGroup.mk.comp ρ = r := by sorry

end ArithmeticLifting

/-! Artin automorphy uses the suppliers' actual localRep Weil homomorphisms. These
types are parameters for them, not a new global Langlands-parameter definition.
Missing in every theorem below: G=G_F for a number field, continuity, irreducibility,
the specified projective image and the arithmetic LLC normalization; all localRep
monodromies of the finite-image Artin parameter are zero. -/
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The continuous finite-image irreducible Galois representation, actual projective-image classification, local Weil data and automorphic parameter maps must be typed. The dihedral/tetrahedral/octahedral/solvable source hypotheses cannot be discarded from the existential automorphy statement.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.dihedral_artin, TauCeti.GL2Transfer.tetrahedral_artin, TauCeti.GL2Transfer.octahedral_artin, TauCeti.GL2Transfer.solvable_artin.

GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin
TauCeti.GL2Transfer.dihedral_artin
Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.
Hypotheses: F is a number field. ρ:G_F→GL₂(C) is continuous, irreducible and has finite image. The projective image is dihedral D_n with n≥2 (including V₄), so ρ≅Ind_{G_K}^{G_F}θ for a quadratic K/F and a finite-order character θ≠θ^σ of G_K. Local parameters are normalised (unitary); holomorphic weight one needs F totally real and ρ totally odd.

GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin
TauCeti.GL2Transfer.tetrahedral_artin
Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with projective image A₄. There is a unique cuspidal GL₂ automorphic representation π with normalized all-place local parameters ρ. Over the cyclic cubic field E fixed by the preimage of the normal V₄, the restriction P is dihedral and therefore automorphic. Its automorphic representation is Galois-stable, and cyclic descent gives a finite twist fiber over F. Matching the determinant removes the cubic twist ambiguity, giving π_ps(ρ). The adjoint Ad(π_ps) is cuspidal because π_ps has no self-twist, and it is identified with the cyclic cubic induction of the V₄ character θ (Ad ρ=Ind θ) by the Jacquet–Shalika Rankin–Selberg pole criterion. At places inert in E this leaves A(π_v)=diag(ξa,ξ²b) with ξ³=1, and ξ≠1 would give an element of order 6 in A₄. Langlands proves π_v=π(ρ_v) for almost all v (Theorem 3.3 records the consequence that L(s,ρ) is entire); the all-place statement uses his equivalence of the two definitions of π(ρ), whose proof he only sketches. The GL₃ inputs are recorded in the GL₃ supplier gap.
Hypotheses: F is a number field. ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image A₄ (Langlands allows any Weil-group representation of tetrahedral type). E/F is the cyclic cubic extension cut out by the preimage of V₄, P=ρ|_{W_E}, and θ is the character of the Galois group over E with Ad ρ=Ind θ. Normalisation: π_ps(ρ) is chosen with ω_π=det ρ; local parameters are in the unitary normalisation.

GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin
TauCeti.GL2Transfer.octahedral_artin
For a number field F and a continuous irreducible finite-image ρ:G_F→GL₂(C) with projective image S₄, there is a unique cuspidal automorphic π with π_v≅π(ρ_v) for almost all v (Tunnell). By the same all-place upgrade as in the tetrahedral case, π has normalized local parameter ρ|_{W_{F_v}} at every place. Let E/F be the quadratic field cut out by the preimage of A₄, K/F the non-Galois cubic field cut out by the preimage of a Sylow-2 subgroup, and M=EK. The tetrahedral theorem over E gives π(ρ_E), which is the base change of exactly two cuspidal π₁ and π₂=π₁⊗ω_{E/F}. These have the same central character, so determinant matching cannot choose between them. Tunnell's lemma: exactly one i has BC_{K/F}(π_i)≅π(ρ_K), where ρ_K is monomial. Both BC_{K/F}(π_i) base change to π(ρ_M); they differ by ω_{M/K}=ω_{E/F}∘N_{K/F} and are distinct because ρ_M is irreducible, so they are the two quadratic descents of π(ρ_M), one of which is π(ρ_K). For this π, a place w|v of K with [K_w:F_v]∈{1,3} shows that the Satake class of π_v is that of ρ_v: the only alternative gives an element of order 6 in S₄. GL₃ and GL₂×GL₃ theory enters only through the JPSS cubic transfer, which Tunnell quotes without proof. Langlands's earlier octahedral results (Theorems 3.4–3.5, over Q with conditions on complex conjugation) are not substituted for Tunnell's theorem.
Hypotheses: F is a number field. ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image S₄. E/F is the quadratic extension cut out by the preimage of A₄, K/F the non-Galois cubic extension cut out by the preimage of a Sylow-2 subgroup (dihedral of order 8), and M=EK. Tunnell's conclusion holds almost everywhere (π(ρ) in the JL70 §12 sense at almost all v); the all-place clause needs the separate upgrade. Inputs: the tetrahedral theorem over E, quadratic descent and its fibers, the dihedral theorem over K and M, and the weak JPSS cubic transfer.

GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin
TauCeti.GL2Transfer.solvable_artin
Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with solvable projective image. There is a unique cuspidal GL₂ automorphic representation π such that, in the fixed Artin/LLC normalization, rec_Fv(π_v)≅ρ|_{W_Fv} for every place v. Equivalently (Jacquet–Langlands §12), the L- and ε-factors of all character twists agree at every place, so L(s,π)=L(s,ρ). The finite-image projective classification leaves dihedral, A₄ and S₄; a cyclic projective image would make the representation reducible. Solvability of linear and projective finite images is equivalent because their scalar kernel is abelian. Over totally real F, total oddness gives holomorphic parallel weight one; automorphy itself has no oddness requirement. This is the strong rank-two theorem, not merely holomorphy of the Artin L-function. Rogawski–Tunnell §4 state it as the strong Artin conjecture (cuspidal π(σ) with L(s,π(σ))=L(s,σ)), known for solvable image by Langlands and Tunnell. The published proofs give almost-everywhere equality; the all-place and ε-factor clause rests on Langlands's equivalence of the two definitions of π(ρ) (§3, proof sketched).
Hypotheses: F is a number field. ρ:G_F→GL₂(C) is continuous, irreducible and has finite solvable image, so its projective image is dihedral, A₄ or S₄. Unitary normalisation of local parameters; uniqueness is up to isomorphism. For the weight-one clause, F is totally real and ρ is totally odd (det ρ(c_v)=−1 at every real place).
-/
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
Use the actual G_Q or totally-real G_F, finite-image irreducible odd representation, its solvable image and the genuine weight-one classical/adelic dictionary. Conductor, nebentypus and all-place infinity-type hypotheses remain. The totally real extension is still requested from R16.6.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.q_weight_one, TauCeti.GL2Transfer.tr_weight_one, TauCeti.GL2Transfer.residual_lt_application.

GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one
TauCeti.GL2Transfer.q_weight_one
For ρ as in solvable-artin over Q with det ρ(c)=−1, the R16.6 dictionary yields a normalized holomorphic cuspidal weight-one newform f with exact Artin conductor N(ρ), nebentypus det ρ under reciprocity, L(s,f)=L(s,ρ), and, for ℓ∤N(ρ) and arithmetic Frobenius, characteristic polynomial X²−a_ℓ(f)X+det ρ(Frob_ℓ) of ρ(Frob_ℓ). This is the Weil–Langlands theorem (Deligne–Serre Théorème 4.10); its hypothesis that every L(s,ρ⊗χ) is entire follows here from cuspidality of the Langlands–Tunnell representation. Its coefficients lie in a number field. To reduce modulo p choose a place λ above p, an embedding of its residue field into a common algebraic closure, and a stable lattice in a coefficient realization of ρ. Weight one here is not the weight≥2 cohomological construction used in Hilbert varieties.
Hypotheses: ρ: G_Q→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, so solvable-artin supplies a cuspidal π with π_v matching ρ at every place. ρ is odd: det ρ(c)=−1 for complex conjugation c. Frobenius normalization is arithmetic (Artin's convention, as in Deligne–Serre), and det ρ is identified with a Dirichlet character by class field theory. For reduction: a number field E realizing ρ, a place λ of E above p, an embedding of its residue field into F̄_p, and a G_Q-stable O_{E,λ}-lattice.

GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one
TauCeti.GL2Transfer.tr_weight_one
For F totally real and ρ as in solvable-artin with det ρ(c_v)=−1 at every real place, the automorphic π is holomorphic parallel-weight-one Hilbert cuspidal in the R16.6 extended dictionary. At every real place π_v is Rogawski–Tunnell's π₁, the representation of GL₂(R) unitarily induced from the Borel character (a b;0 d)↦sign(a) (isomorphic to π(1,sign)), whose parameter is 1⊕sign; it is a limit of discrete series, not a cohomological weight≥2 discrete-series representation. The finite conductor, central character and local Artin factors are those of ρ. This node exports the weight-one input to residual modularity arguments, without duplicating Hilbert Shimura-variety geometry or claiming a missing weight-one cohomological Galois construction.
Hypotheses: F is a totally real number field. ρ: G_F→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, and π is the cuspidal representation given by solvable-artin, with rec(π_v)≅ρ|W_{F_v} at every place. ρ is totally odd: det ρ(c_v)=−1 for every real place v. Weight one is meant in Rogawski–Tunnell's sense for GL₂ (D=M₂(F)): π_v≅π₁ at every real place v.

GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application
TauCeti.GL2Transfer.residual_lt_application
For F,p,r̄ as in odd-residual-lift, apply Langlands–Tunnell to its totally odd finite-image lift and obtain a parallel-weight-one Hilbert cuspidal form whose chosen λ-adic reduction realizes r̄. This is the qualitative residual modularity input of the solvable case in the proof of BCGP Proposition 10.1.3 (there over a totally real quadratic extension E of the base field, with p=3 or 5). The proof of Theorem 10.2.6 uses it only through Proposition 10.1.3(1). Subsequent ordinary weight-two lifts, auxiliary solvable extensions and GSp₄ transfer in those arguments require their own lifting/weight-change owners and are not consequences of Langlands–Tunnell alone. No unchanged conductor or ordinary local condition is promised by this application.
Hypotheses: F, p, r̄ as in odd-residual-lift: F totally real, p>2, r̄:G_F→GL₂(F̄_p) continuous, absolutely irreducible, totally odd, with solvable image. The characteristic-zero lift ρ, the place λ above p, the residue-field embedding and the stable lattice are those produced by odd-residual-lift. The output form is holomorphic of parallel weight one in the sense of tr-weight-one; no level, conductor or ordinarity condition is claimed.
-/
/-! Nodes added by the review (REV-GL2AutomorphicRepresentationsAndTransfer--R17.3):
Tunnell's globalisation, Carayol's prescribed-local induction and the octahedral mod-3
application are recorded in the omission block below; the explicit GL₂(F₃) section used
by the mod-3 application is kept as a concrete statement. -/
/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Tunnell's globalisation, Carayol's prescribed-local induction and the octahedral mod-3 application need the p-adic Weil group, the number-field globalisation data, the CM Hecke-character carrier and the normalized weight-one newform carrier; existence over arbitrary index types and maps is false.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.tunnell_primitive_globalization, TauCeti.GL2Transfer.prescribed_local_induction, TauCeti.GL2Transfer.octahedral_mod_three_application.

GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization
TauCeti.GL2Transfer.tunnell_primitive_globalization
Tunnell, Invent. Math. 46 (1978), Theorem 1.3, for a p-adic field. Let K be a finite extension of Q_p and σ: W_K → GL₂(C) a continuous two-dimensional representation. There exist a number field F, a finite place v of F with an isomorphism F_v ≅ K, and a continuous representation ρ: W_F → GL₂(C) whose restriction ρ_v to W_{F_v} is isomorphic to σ. If σ is reducible, induced from a proper subgroup, of A₄-type or of S₄-type (the type is the image in PGL₂(C)), then ρ can be chosen of the same type. If K = Q₂ and σ is of S₄-type, one can take F = Q and ρ with det ρ(c) = −1 for complex conjugation c. In the primitive case (A₄- or S₄-type, which forces p = 2) the proof gives ρ = ρ₀ ⊗ χ̃, where ρ₀: G_F → GL₂(C) has finite image and the same projective image as σ, χ̃ is a Hecke quasi-character of F, and in the S₄ case det ρ₀(c) = −1 at every real place. Finite-image form, as Carayol 12.2.3 uses it: if σ is primitive with finite image, ρ can be taken to be a continuous representation of G_F with finite image, tetrahedral or octahedral as σ is. This form needs χ̃ of finite order, i.e. the local–global extension of finite-order characters recorded as a gap. For automorphy the quasi-character form suffices, because ρ is then a twist of the finite-image ρ₀. Tunnell states the theorem for every nonarchimedean local field and a global field F; positive characteristic is not planned here.
Hypotheses: K is a finite extension of Q_p and W_K its Weil group with the Weil topology. Tunnell's K is any nonarchimedean local field (§1); the node treats characteristic zero only, so F is a number field. σ: W_K → GL₂(C) is continuous. No irreducibility is assumed for the existence clause. The type of a two-dimensional representation is its image in PGL₂(C) (Tunnell, p. 182). The A₄- and S₄-type representations of W_K are the primitive irreducible ones (Tunnell cites Weil, Exercices dyadiques §13); they occur only for p = 2. ρ_v is the restriction along the embedding W_{F_v} → W_F given by a place of F̄ above v; its isomorphism class does not depend on that choice. Finite-image form: σ is primitive with finite image, and the local–global extension of finite-order characters (packet gap) is available.

GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction
TauCeti.GL2Transfer.prescribed_local_induction
Carayol 1986, 11.2, with the global Weil construction of Jacquet–Langlands §12. Let F be a totally real field of degree d with real places τ₁,…,τ_d, let k₁,…,k_d ≥ 2 and w be integers of the same parity, and let D_{k,w} be the essentially square-integrable representation of GL₂(R) of Carayol 0.2 (central character t ↦ t^{−w}), so that D_{k,w} ≅ 𝒲(C, ζ_{k,w}) with ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}. Let 𝔭 ≠ v be finite places of F, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× that does not factor through the norm, with ξ_𝔭·|·|^{w/2} of finite order; so 𝒲(L_𝔭, ξ_𝔭) is ordinary cuspidal. Then there exist a totally imaginary quadratic extension L/F and a quasi-character ξ of 𝔸_L^×/L^× such that (a) L ⊗_F F_𝔭 ≅ L_𝔭 and the 𝔭-component of ξ is ξ_𝔭; (b) at the complex place of L above τ_i, ξ is ζ_{k_i,w}; (c) L/F is not split at v and ξ_v does not factor through the norm L_v^× → F_v^×. The automorphic induction π′ = 𝒲(L, ξ) = quadraticInduction(ξ) is cuspidal, with π′_u ≅ 𝒲(L_u, ξ_u) at every place u; in particular π′_{τ_i} ≅ D_{k_i,w}, π′_𝔭 ≅ 𝒲(L_𝔭, ξ_𝔭) and π′_v is supercuspidal. Hence, when 𝒲(L_𝔭, ξ_𝔭) is the component π_𝔭 of a π as in Carayol (0.3) and v is the place fixed in Theorem (B), π′ satisfies the hypotheses of Theorem (B) and has the same 𝔭-component as π. Carayol calls the existence of (L, ξ) standard and gives no proof. The finite-order condition, automatic for such π_𝔭, cannot be dropped, and the proof uses the local–global extension of finite-order characters recorded as a gap.
Hypotheses: F is totally real of degree d with real places τ₁,…,τ_d; k₁,…,k_d ≥ 2 and w are integers of the same parity (Carayol 0.3); D_{k,w} is as in Carayol 0.2, with central character t ↦ t^{−w}. 𝔭 is a finite place, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× not factoring through N_{L_𝔭/F_𝔭}, so 𝒲(L_𝔭, ξ_𝔭) is supercuspidal and ordinary (Carayol 0.9; JL70 Theorem 4.6(iii)). ξ_𝔭·|·|_{L_𝔭}^{w/2} has finite order. Equivalently, the central character of 𝒲(L_𝔭, ξ_𝔭) is |·|^{−w} times a finite-order character; this holds when 𝒲(L_𝔭, ξ_𝔭) ≅ π_𝔭 for π as in Carayol (0.3), whose central character is |·|_𝔸^{−w} times a finite-order character because F is totally real. v is a finite place different from 𝔭: Carayol's fixed place of Theorem (B) when d is even, an arbitrary auxiliary place when d is odd. 𝒲(E, θ) is the Weil representation π(θ) of JL70 §1 (Theorem 4.6) for a quadratic extension E of a local field and a quasi-character θ of E^×, the principal series π(θ₁, θ₂) when E is split, and 𝒲(C, ·) at a real place; in the packet's normalisation its parameter is Ind θ (quadratic-induction).

GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application
TauCeti.GL2Transfer.octahedral_mod_three_application
Let ρ̄: G_Q → GL₂(F₃) be continuous, absolutely irreducible and odd (det ρ̄(c) = −1). Let λ = (1+√−2), so that Z[√−2]/λ ≅ F₃ with √−2 ↦ −1, and let s: GL₂(F₃) → GL₂(Z[√−2]) be an injective homomorphism with s(x) ≡ x mod λ. For example, s is determined by s([[1,1],[0,1]]) = [[−2, −1+√−2],[1+√−2, 1]] and s([[0,1],[1,0]]) = [[−1−√−2, −2],[−1+√−2, 1+√−2]]: these generate a group of order 48 that reduction maps bijectively onto GL₂(F₃). Fix Q(√−2) ⊂ C and put ρ = s∘ρ̄: G_Q → GL₂(C). Then ρ is continuous, irreducible and odd, with finite image isomorphic to that of ρ̄; det ρ is the ±1-valued lift of det ρ̄; and the projective image of ρ is isomorphic to the image of ρ̄ in PGL₂(F₃) ≅ S₄, so it is solvable (S₄, octahedral, exactly when ρ̄ is surjective). By solvable-artin and q-weight-one there is a normalized weight-one newform g of level N(ρ), the Artin conductor of s∘ρ̄, and odd quadratic nebentypus ε = det ρ, with ρ_g ≅ ρ. For every prime ℓ ∤ N(ρ), a_ℓ(g) = tr s(ρ̄(Frob_ℓ)) ∈ Z[√−2], a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) and ε(ℓ) ≡ det ρ̄(Frob_ℓ) mod λ. Reducing ρ_g along the stable lattice Z[√−2]_λ² gives exactly ρ̄, so ρ̄_{g,λ} ≅ ρ̄. No general reduction-preserving lifting (the odd-residual-lift gap) is used. The level N(ρ) can exceed Serre's conductor of ρ̄. Darmon–Diamond–Taylor, Theorem 3.14(a), state the conclusion as modularity in weight two (their Definition 3.12) and pass from g to a weight-two form by Remark 3.6; that step is not part of this node.
Hypotheses: ρ̄: G_Q → GL₂(F₃) is continuous, absolutely irreducible and odd: det ρ̄(c) = −1 for complex conjugation c. λ = (1+√−2) is the prime of Z[√−2] above 3 (norm 3); reduction modulo λ identifies Z[√−2]/λ with F₃, √−2 ↦ −1. s: GL₂(F₃) → GL₂(Z[√−2]) is an injective group homomorphism with red_λ∘s = id (DDT's 'section'). The explicit s of the statement is one choice, checked by enumerating the 48 elements. A fixed embedding Q(√−2) → C; Frobenius is arithmetic and det ρ is read as a Dirichlet character by reciprocity, as in q-weight-one.
-/
section AddedByReview

/-- Reduction modulo λ = (1 + √−2): ℤ[√−2] → F₃, sending √−2 to −1. -/
def redSqrtNegTwo : ℤ√(-2) →+* ZMod 3 := Zsqrtd.lift ⟨-1, by decide⟩

/-- The section used by the octahedral mod-3 application (Darmon–Diamond–Taylor,
Theorem 3.14(a)): an injective homomorphism GL₂(F₃) → GL₂(ℤ[√−2]) reducing to the
identity modulo (1 + √−2). The packet gives explicit generators; it is a true statement
at the pinned Mathlib. -/
theorem gl2F3_section :
    ∃ s : GeneralLinearGroup (Fin 2) (ZMod 3) →* GeneralLinearGroup (Fin 2) (ℤ√(-2)),
      Function.Injective s ∧
        (GeneralLinearGroup.map redSqrtNegTwo).comp s = MonoidHom.id _ := by sorry

end AddedByReview

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
The characteristic-two applications need G_Q, continuity, absolute irreducibility with the stated projective image, and the actual Katz, classical and witness carriers with their q-expansion, level, character, conductor and residual maps; existence claims over arbitrary carriers and maps are false.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.solvable_dihedral, TauCeti.GL2Transfer.rt_technical_lemma, TauCeti.GL2Transfer.serre_odd_trick, TauCeti.GL2Transfer.rohrlich_tunnell, TauCeti.GL2Transfer.wiese_odd_lift, TauCeti.GL2Transfer.unramified_katz, TauCeti.GL2Transfer.qualitative_residual_modularity, TauCeti.GL2Transfer.weight_two_witness.

GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral
TauCeti.GL2Transfer.solvable_dihedral
Let r̄:G_Q→GL₂(F̄₂) be continuous and absolutely irreducible, with solvable projective image. Then its projective image is a dihedral group D_n of order 2n with n odd ≥3. Reason, from the R01.4 classification in characteristic two: PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂); every 2-subgroup of SL₂(F̄₂) is elementary abelian and unipotent, so it fixes a unique line; hence a finite subgroup with a nontrivial normal 2-subgroup (every Borel-type group, the Klein four group, and A₄, which here is the Borel subgroup of SL₂(F₄)) fixes a point of P¹, as does a cyclic group of odd order, and makes r̄ reducible; S₄ does not embed because its Sylow 2-subgroup is nonabelian; an even-order element of a dihedral subgroup is an involution, so n is odd. After removing a scalar character (determinant-untwist), the linear image is dihedral of order 2n. This is a Galois application of the existing finite-group classification, not a second classification proof. In characteristic two the determinant condition at complex conjugation is vacuous, so it cannot be used to deduce that a naive complex lift is odd.
Hypotheses: r̄:G_Q→GL₂(F̄₂) is continuous for the discrete topology on F̄₂, hence has finite image. r̄ is absolutely irreducible (over F̄₂ the same as irreducible). The image of r̄ in PGL₂(F̄₂) is solvable. The finite-subgroup classification of PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂) is imported from R01.4, specialised to characteristic two.

GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma
TauCeti.GL2Transfer.rt_technical_lemma
Fix Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ). Let g=Σb(n)q^n∈Prim₁(2^νNr,χ), a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1, where ν∈{0,2,3}, N is odd and r is either 1 or an odd prime not dividing N. Assume N=N(ρ_g); if r≠1 assume b(r)≢1 mod l; if ν=2 assume b(n)=0 whenever n is even; if ν=3 assume b(2)≢0 mod l. Put k=2 if ν∈{0,2} and k=4 if ν=3. Then there is f∈Prim_k(N), a normalized newform of weight k, exact level N and trivial character, with ρ_f≅ρ_g. The Fourier conditions are used in the proof (RT Remark 2: without b(n)=0 for even n, formula (3) in Case 2 is false); the source does not show they are necessary. The theorem is a specialized arithmetic application of the imported Deligne–Serre lifting and old/newform theory, not a replacement for them.
Hypotheses: A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the place λ); ρ_h denotes the semisimple mod-l representation attached to an eigenform h by traces and determinants at good primes. g=Σb(n)q^n is a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1 (necessarily odd in weight one). ν∈{0,2,3}; N is odd; r is 1 or an odd prime not dividing N. N=N(ρ_g), the prime-to-2 Artin conductor of ρ_g. If r≠1 then b(r)≢1 mod l. If ν=2 then b(n)=0 for every even n. If ν=3 then b(2)≢0 mod l. Conclusion weight k=2 for ν∈{0,2} and k=4 for ν=3.

GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick
TauCeti.GL2Transfer.serre_odd_trick
Let r̄₀=Ind_{G_K}^{G_Q}φ, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and g=Σb(n)q^n where L(s,φ̃ξ)=Σb(n)n^{−s}. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is 2^νN·r, and g∈Prim₁(2^νNr,χ) with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, ρ_g≅r̄₀ and N(ρ_g)=N. Moreover b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.
Hypotheses: r̄₀=Ind_{G_K}^{G_Q}φ is irreducible with linear-dihedral image; φ̃, N, ν are as in teichmuller-conductor, at the fixed prime l above 2. K is real quadratic (D>0), with real places ∞₁, ∞₂. D is odd or divisible by 8, so the dyadic case is (i), (ii) or (iv). Degree-one primes are taken in a prescribed narrow ray class modulo 4f(φ̃) (Chebotarev).

GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell
TauCeti.GL2Transfer.rohrlich_tunnell
Fix Q̄⊂C and a prime ideal l above 2 (the coefficient place λ). Let r̄₀:G_Q→GL₂(F̄₂) be continuous and irreducible with linear-dihedral image (so det r̄₀=1), K the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ, D its discriminant, N=N(r̄₀) the (odd) prime-to-two conductor, ν defined by |D|·N_{K/Q}f(φ̃)=2^νN, and k=2 if ν∈{0,2}, k=4 if ν=3 (Serre's weight, which RT cite from Serre 1987, p. 188). If D is odd or divisible by 8, that is in cases (i), (ii) and (iv) of teichmuller-conductor, there is f∈Prim_k(N), a normalized newform of exact level N, trivial character and weight k, with ρ_f≅r̄₀ at l. Thus odd D gives weight 2 (ν=0 or 2) and 8|D gives weight 4 (ν=3). For D<0 use the odd induction of φ̃; for D>0 use serre-odd-trick and remove its auxiliary prime with the technical lemma. The theorem makes no assertion when D≡4 mod 8 (case (iii)); the authors know neither examples nor counterexamples there. A projective-dihedral r̄ with nontrivial determinant is outside the theorem and is reached only through determinant-untwist, with recomputed level and character.
Hypotheses: A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ). r̄₀:G_Q→GL₂(F̄₂) is continuous and irreducible, and its linear image is a dihedral group (this forces det r̄₀=1). K is the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ and D is its discriminant; D is odd or divisible by 8. N=N(r̄₀) is the prime-to-2 Artin conductor; ν is defined by |D|·N_{K/Q}f(φ̃)=2^νN; k=2 if ν∈{0,2} and k=4 if ν=3.

GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift
TauCeti.GL2Transfer.wiese_odd_lift
Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense: r̄≅Ind_{G_K}^{G_Q}χ for a quadratic field K and a character χ:G_K→F̄₂^× with χ≠χ^σ (equivalently r̄ is irreducible with projective image D_n, n≥3; n is odd in characteristic two). Wiese's oddness hypothesis is vacuous in characteristic two. Let m be the order of r̄(G_Q), ζ_m a primitive m-th root of unity and P any prime of Q(ζ_m) above 2. (Wiese Lemma 3) There is an odd dihedral r̂:G_Q→GL₂(Z[ζ_m]) whose reduction modulo P is isomorphic to r̄: r̂=Ind χ̃ for the same-order lift χ̃ of χ when this is odd, and otherwise (which forces K real quadratic) r̂=Ind(χ̃ξ) with ξ the quadratic character of K(√λ)/K for some λ∈O_K of negative norm. No conductor is controlled in this general case. (Wiese Lemma 2) If moreover r̄ is unramified at 2 with conductor N, then either (a) some such r̂ has Artin conductor N, or (b) K is real quadratic and there is an infinite set S of primes ℓ, which may be taken odd, split in K and prime to N, with tr r̄(Frob_ℓ)=0, such that for each ℓ∈S some odd dihedral r̂_ℓ:G_Q→GL₂(Z[ζ_m]) of Artin conductor Nℓ reduces to r̄ modulo P. The result covers projective-dihedral images (scalar twists of linear-dihedral ones), not only the linear-dihedral images of Rohrlich–Tunnell.
Hypotheses: r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense: irreducible and induced from a character χ:G_K→F̄₂^× of a quadratic field K with χ≠χ^σ (equivalently, projective image D_n with n≥3; n is odd in characteristic two). Wiese's oddness hypothesis is vacuous in characteristic two (det r̄(c)=1=−1); the source lemmas hold for every prime p and are specialised here to p=2. Coefficients: m is the order of r̄(G_Q), the lift takes values in GL₂(Z[ζ_m]), P is any prime of Q(ζ_m) above 2, and Z[ζ_m]/P is embedded in F̄₂ compatibly with the values of χ. For the Lemma 2 refinement r̄ is unramified at 2 and N is its conductor (prime-to-2 Artin conductor). Lemma 3 assumes nothing at 2 and gives no control of the Artin conductor of the lift.

GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz
TauCeti.GL2Transfer.unramified_katz
Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense, unramified at 2, with conductor N=N(r̄) (the prime-to-2 Artin conductor, an odd integer) and ε=det r̄ viewed as a character of (Z/NZ)^×. Then there is a cuspidal Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂)_Katz for all Hecke operators, which may be normalised (a₁=1), whose associated Galois representation is isomorphic to r̄: a_ℓ(f)=tr r̄(Frob_ℓ) and ε(ℓ)=det r̄(Frob_ℓ) for primes ℓ∤2N. This is Wiese Theorem 9 for p=2: the level is the conductor of r̄ and the character is det r̄. No condition at 2 beyond unramifiedness is imposed, so representations exceptional at 2 (restriction to a decomposition group at 2 a sum of two copies of one unramified character, for example K=Q(√229) with 2 inert) are included. The theorem does not assert a characteristic-zero weight-one form of level N reducing to r̄. Wiese's Introduction states, without proof, that none exists when K is real quadratic of discriminant N with fundamental units of norm −1 (example Q(√229)). The oldform and descent inputs (Wiese Proposition 4, Corollary 5, Proposition 7, Corollary 8) are imported through the R15.2 request; the new arithmetic combination is this theorem.
Hypotheses: r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense (irreducible, induced from a character of a quadratic field); oddness is vacuous in characteristic two. r̄ is unramified at 2 (equivalently, its minimal weight k(r̄) is one). N=N(r̄) is the prime-to-2 Artin conductor (odd); ε=det r̄ is viewed as a character of (Z/NZ)^×, which here equals the prime-to-2 part of det r̄. Katz cusp forms are taken in Wiese's non-compactified Γ₁(N) sense over F̄₂, with N invertible. The source theorem holds for every prime p; only p=2 is used here, where alternative (b) of Lemma 2 can occur.

GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity
TauCeti.GL2Transfer.qualitative_residual_modularity
Every continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image is realized by a holomorphic cuspidal weight-one newform, after choosing a coefficient number field, λ|2, a residue-field embedding and a stable lattice. The newform's level is the Artin conductor of the chosen odd lift and is not controlled in general. The qualitative proof applies the finite classification (such an r̄ has projective image D_n with n odd ≥3, so it is dihedral in Wiese's sense), Wiese’s odd lift (Lemma 3), and then dihedral Artin weight-one automorphy (Weil–Langlands, as in Wiese's proof of Theorem 1). If one wants a weight≥2 witness, apply the existing R15.5 reduction/true-eigenform result: Eisenstein multiplication for the reduction of a characteristic-zero form, and Hasse powers only when a Katz form is the input and the integral lifting criterion has been met. This broad existence theorem does not claim the exact minimal weight, level or trivial character of the restricted Rohrlich–Tunnell theorem.
Hypotheses: r̄:G_Q→GL₂(F̄₂) is continuous and absolutely irreducible with solvable projective image; in characteristic two this forces projective image D_n with n odd ≥3. No oddness or determinant hypothesis is needed: oddness is vacuous in characteristic two. The witness data are chosen: coefficient number field, place λ|2, residue-field embedding into F̄₂ and a stable lattice; the comparison is with the semisimplified reduction. The level of the weight-one witness is the Artin conductor of the chosen odd lift and is not controlled; weight and character are not minimised.

GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness
TauCeti.GL2Transfer.weight_two_witness
Given either an odd complex weight-one dihedral form reducing to r̄ or the preceding unramified Katz form, obtain the R15.6 residual-modularity witness with some weight k≥2 and its actual primitive level. For the reduction of a characteristic-zero weight-one form, use R15.5's Eisenstein multiplication (E₄≡1 mod 2). For a Katz input in characteristic two, the Hasse invariant has weight one and q-expansion one, so multiplying by a power of it preserves the q-expansion and the residual away-two eigencharacter. Wiese's Introduction uses a single factor (weight 2, which is Serre's weight for r̄ unramified at 2), together with the classicality of Katz forms of weight ≥2 on Γ₁(N). That classicality holds for N≥5, which covers N(r̄) here: an irreducible dihedral r̄ unramified at 2 has N(r̄)≥5. In this blueprint the lifting comes from R15.5’s finite-free integral realization and cohomological lifting criterion, with R15.2's base change (stated at full level n≥3, weight ≥2), so choose the weight and an auxiliary level satisfying that criterion. Multiplication alone does not produce a characteristic-zero eigenform. Apply the DS lemma to the commuting Hecke action over a dominating DVR, then the true-eigenform/old-newform reduction. Record K_f, λ|2, common residue-field embeddings and a stable lattice realizing r̄ semisimply. The character of the witness lifts det r̄ but need not be its Teichmüller lift. This application imports Hasse, DS and the witness definition unchanged.
Hypotheses: Input: either the reduction modulo λ|2 of an odd characteristic-zero weight-one dihedral newform realising r̄, or the Katz eigenform of unramified-katz in S₁(Γ₁(N),det r̄,F̄₂)_Katz. Characteristic two: the Hasse invariant A has weight p−1=1 and q-expansion 1, and Hecke eigenvalues at odd ℓ are unchanged by multiplication by A (ℓ^{k−1}≡1 mod 2). Characteristic-zero lifting of the shifted form uses R15.5's finite-free integral realization and cusp-sheaf H¹ criterion, with R15.2's base change, currently stated at full level n≥3 and weight ≥2. The weight and an auxiliary level must be chosen to satisfy it. Output: an R15.6 witness of some weight k≥2 with its actual level and a character lifting det r̄ (not necessarily its Teichmüller lift); minimal weight and level are not claimed.
-/
section CharacteristicTwo
variable {G : Type*} [Group G] {k : Type*} [Field k] [CharP k 2]

-- Missing: k algebraically closed, r continuous absolutely irreducible with
-- finite solvable projective image. Here is the actual scalar normalization;
-- the identification of its linear image with odd dihedral D_n is in the packet.
theorem determinant_untwist (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ ξ : G →* kˣ, Set.Finite (Set.range ξ) ∧
      ∀ g, ξ g ^ 2 = GeneralLinearGroup.det (r g) ∧
        GeneralLinearGroup.det (GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by sorry

-- Missing: r̄₀ = Ind φ, its Teichmüller lift φ̃, D = disc K, normF = N_{K/Q} f(φ̃) and
-- N = N(r̄₀); hcond is the conductor formula |D|·N f(φ̃) = 2^ν N proved in the packet.
-- hfund is the 2-adic shape of a fundamental discriminant. Given these, the four
-- dyadic cases of Rohrlich–Tunnell §2 fix ν (case (ii) is printed "D ≡ ±5 (mod 8)",
-- and ν = 3 belongs to case (iv), not (iii): sourceIssues E1).
theorem teichmuller_conductor (D : ℤ) (normF N ν : ℕ) (hN : Odd N)
    (hfund : D % 4 = 1 ∨ D % 16 = 8 ∨ D % 16 = 12)
    (hcond : D.natAbs * normF = 2 ^ ν * N) :
    (Odd D → Odd normF → ν = 0) ∧ (D % 8 = 5 → normF % 8 = 4 → ν = 2) ∧
      (D % 8 = 4 → Odd normF → ν = 2) ∧ (D % 8 = 0 → Odd normF → ν = 3) := by sorry

end CharacteristicTwo

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~4).
Compatible descent and the potential-modularity interface need the actual cyclic or solvable automorphic descent, Galois invariance, a λ-independent twist and the R23 extension data; existence over an arbitrary class type is false.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.compatible_descent, TauCeti.GL2Transfer.potential_modularity_interface.

GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent
TauCeti.GL2Transfer.compatible_descent
Let E/F be cyclic of prime degree ℓ, η a character of F^×N(A_E^×)\A_F^× of order ℓ, and Π cuspidal over E with Π^σ≅Π. By AC89 Theorem 4.2(d) (Langlands Lemma 11.6(b) for GL₂), the cuspidal descents of Π are exactly π⊗η^i, 0≤i<ℓ, pairwise non-isomorphic, for one chosen descent π. Let {r_λ} be supplied semisimple representations of G_F over a common coefficient field whose restrictions to G_E match the family attached to Π. A matching descent is a single index i, independent of λ, such that the good-place characteristic polynomials of π⊗η^i agree with those of every r_λ. Under that equality, R01.5 identifies each r_λ with the corresponding member attached to π⊗η^i, and i is unique. Suppose each r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to π is supplied. Then for each λ, r_λ≅ρ_{π,λ}⊗η^{i(λ)} for some i(λ) (Schur's lemma on the cyclic step). If {r_λ} is compatible, a match at one λ forces the same i at every λ, because both families have λ-independent polynomials. Galois descents chosen independently at different λ, without this common index, do not give one automorphic descent matching the family. In a solvable tower impose this condition at each prime-cyclic step, with its actual descent fiber and local data.
Hypotheses: E/F is cyclic of prime degree ℓ with generator σ, and η is a character of A_F^×/F^×N(A_E^×) of order ℓ, identified with a character of Gal(E/F) by class field theory. Π is a cuspidal automorphic GL₂ representation over E with Π^σ≅Π. {r_λ} are continuous semisimple representations G_F→GL₂(M̄_λ) over a common coefficient field M, and r_λ|_{G_E} matches the family attached to Π at good places. For the Galois-side twist statement, r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to a descent π is supplied as data (its existence belongs to R19/R24). Good places exclude ramification of π, of η, of r_λ and the residue characteristic of λ.

GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface
TauCeti.GL2Transfer.potential_modularity_interface
Let E/F be a finite solvable Galois extension with the prescribed local completions and disjointness hypotheses supplied by potential modularity, ρ a rank-two Galois representation of G_F, and Π a cuspidal automorphic representation over E matching ρ|_{G_E} at almost all places. Export the following conditional interface. Irreducibility survives under the disjointness criterion. Local transfer uses the exact completion-wise restriction (strong lifting at each prime-cyclic step). Descent to F goes through a prime-cyclic tower. At each step, once the cuspidal representation over the upper field matches the restriction of ρ there, its invariance under the cyclic step is automatic: for Π, Π^τ matches (ρ|_{G_E})^τ≅ρ|_{G_E}, so Π^τ≅Π by strong multiplicity one. AC89 Theorem 4.2(d) then gives a cuspidal descent with its ℓ twists. What is not automatic is the stepwise consistent character matching of compatible-descent. It needs absolute irreducibility of the restriction and representations attached to the intermediate descents; without them, Galois descent of ρ does not identify which automorphic twist matches. Extension construction, potential automorphy and compatible-family existence stay with R23/R24.
Hypotheses: E/F is a finite solvable Galois extension with a chosen prime-cyclic subnormal tower, and the prescribed local completions/splitting and disjointness are supplied by the potential-modularity owner (R23). ρ is a continuous rank-two representation of G_F, Π is a cuspidal automorphic GL₂ representation over E matching ρ|_{G_E} at almost all places, and ρ|_{G_E} is absolutely irreducible (for example by disjoint-irreducibility). Representations attached to the intermediate descents are supplied as data when the twist is matched (R19/R24); compatible-descent's common-index condition is checked at each step. Non-Galois (e.g. non-normal cubic) extensions are outside this interface.
-/
section TransferExports
variable {G H V W FClass EClass Λ K : Type*} [Group G] [Group H] [Field K]

-- Missing the Galois specialization: G=G_F, H=G_E, i the restriction. Linear
-- disjointness of E from the projective-kernel field M is exactly what gives
-- hdisj (G_E surjects onto Gal(M/F)). Equality of projective ranges is the
-- criterion that gives residual absolute irreducibility, imported from R01.4.
theorem disjoint_irreducibility (i : H →* G)
    (r : G →* GeneralLinearGroup (Fin 2) K)
    (hdisj : i.range ⊔ (ProjGenLinGroup.mk.comp r).ker = ⊤) :
    Set.range (ProjGenLinGroup.mk.comp (r.comp i)) = Set.range (ProjGenLinGroup.mk.comp r) := by sorry

-- The index-two Mackey criterion on Mathlib's induced representation, over any
-- algebraically closed field (characteristic two included); over ℚ it fails, e.g.
-- for Z/4 ⊃ Z/2 and the sign character. Missing only the Galois specialization:
-- Γ = G_F, Kgp = G_K for the quadratic K/F and E = G_E for a finite E/F. σθ is the
-- one-dimensional representation of θ. In characteristic zero and for finite Γ,
-- TauCeti.simple_indFDRep_ofLinearCharacter_iff is the pinned unrestricted case.
-- Restricted to E, Ind θ is irreducible exactly when E ⊄ Kgp and θ differs from
-- its conjugate on E ∩ Kgp; when E ≤ Kgp it is the sum of two characters.
theorem quadratic_restriction {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (Kgp E : Subgroup Γ)
    [Kgp.Normal] (hK : Kgp.index = 2) (θ : Kgp →* kˣ) (σθ : Representation k Kgp k)
    (hσθ : ∀ x, σθ x = (θ x : k) • LinearMap.id) :
    Representation.IsIrreducible ((Representation.ind Kgp.subtype σθ).comp E.subtype) ↔
      ∃ s ∈ E, s ∉ Kgp ∧ ∃ x : Kgp, (x : Γ) ∈ E ∧ θ x ≠ θ (MulAut.conjNormal s x) := by
  sorry

-- Missing the actual compatible-family polynomial projection and λ-independent
-- coefficient field; this explicit formula compares each restricted Frobenius.
theorem compatible_base_change (ρ : Λ → G →* GeneralLinearGroup (Fin 2) K)
    (i : H →* G) (FrobF : V → G) (FrobE : W → H) (below : W → V) (f : W → ℕ)
    (hfrob : ∀ w, i (FrobE w) = FrobF (below w) ^ f w) :
    ∀ ell w, ρ ell (i (FrobE w)) = unramifiedBaseChange (ρ ell (FrobF (below w))) (f w) := by sorry

end TransferExports

end TauCeti.GL2Transfer
