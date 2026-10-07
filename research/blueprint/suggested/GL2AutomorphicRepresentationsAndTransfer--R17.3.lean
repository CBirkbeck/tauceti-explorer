/-
This file is not the roadmap and is not exhaustive. The companion roadmap document
is definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They claim no implementation.

The pinned libraries do not contain the supplier-owned automorphic isomorphism
classes, localRep Weil–Deligne interfaces, arithmetic projective obstruction or
Hilbert weight-one dictionary. DClass, FClass, EClass and GL3Class below are type
parameters for those suppliers' carriers, not new definitions of representations.
Local projections, twists, norms and conjugations must likewise be the suppliers'
actual operations. The unavailable conditions are omitted, as identified beside
each section, rather than replaced by Prop-valued fields or dummy predicates.
A signature with omitted conditions is NOT a theorem for arbitrary type parameters
and functions. The packet gives the complete mathematics. Compilation checks only
these provisional signatures, including concrete matrix formulas and examples.

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

section Cyclic
variable {FClass EClass V W LF LE H HF HE C K : Type*} [CommRing K]

/-- Missing: prime-cyclic extension E/F, the supplier's isobaric GL₂ classes,
arithmetic LLC normalization, and the trace comparison of R17.2. -/
noncomputable def cyclicBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

lemma cyclicBaseChange_local (π : FClass) (v : V) (w : W)
    (localF : FClass → V → LF) (localE : EClass → W → LE) (res : LF → LE) :
    localE (cyclicBaseChange FClass EClass π) w = res (localF π v) := by sorry

lemma cyclicBaseChange_unramified (π : FClass) (v : V) (w : W) (f : ℕ)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) K)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) K) :
    satE (cyclicBaseChange FClass EClass π) w = unramifiedBaseChange (satF π v) f := by sorry

lemma cyclicBaseChange_central (π : FClass) (ωF : FClass → HF) (ωE : EClass → HE)
    (normPullback : HF → HE) :
    ωE (cyclicBaseChange FClass EClass π) = normPullback (ωF π) := by sorry

lemma cyclicBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    cyclicBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (cyclicBaseChange FClass EClass π) := by sorry

-- The converse (every invariant cuspidal class occurs) is cyclic_descent below.
lemma cyclicBaseChange_galois (π : FClass) (σ : EClass → EClass) :
    σ (cyclicBaseChange FClass EClass π) = cyclicBaseChange FClass EClass π := by sorry

-- Missing: cohomological rational structures and the precise normalization twist.
lemma cyclicBaseChange_coefficients (π : FClass)
    (conjugateF : FClass → FClass) (conjugateE : EClass → EClass) :
    cyclicBaseChange FClass EClass (conjugateF π) =
      conjugateE (cyclicBaseChange FClass EClass π) := by sorry

-- TauCeti.GL2Transfer.cyclic_split_test
-- Missing: v completely split, w|v, using the identity localRep identification.
example (π : FClass) (v : V) (w : W)
    (localF : FClass → V → C) (localE : EClass → W → C) :
    localE (cyclicBaseChange FClass EClass π) w = localF π v := by sorry

-- TauCeti.GL2Transfer.cyclic_inert_test
-- Missing: v inert and unramified in the quadratic E/F, w the place above it, and
-- satF/satE the suppliers' Satake projections. No global form with arbitrarily
-- prescribed diagonal Satake eigenvalues is asserted.
example (π : FClass) (v : V) (w : W)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) ℚ)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) ℚ)
    (hA : (satF π v).val = !![2, 0; 0, 3]) :
    (satE (cyclicBaseChange FClass EClass π) w).val = !![4, 0; 0, 9] := by sorry

-- TauCeti.GL2Transfer.cyclic_induced_test
-- Missing: θ≠θ^σ, quadratic E/F and the actual isobaric direct-sum operation.
example (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (ai : H → FClass) (isobaricSum : H → H → EClass) :
    cyclicBaseChange FClass EClass (ai θ) = isobaricSum θ (σ θ) := by sorry

-- TauCeti.GL2Transfer.cyclic_odd_degree_test
-- Missing: E/F cyclic of the odd prime degree ℓ; CF/CE are the suppliers'
-- cuspidal subtypes with their forget maps. A cuspidal input stays cuspidal.
example {CF CE : Type*} (ℓ : ℕ) (hprime : ℓ.Prime) (hodd : ℓ ≠ 2)
    (forgetF : CF → FClass) (forgetE : CE → EClass) (π : CF) :
    ∃ Pi : CE, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi := by sorry
end Cyclic

section Solvable
variable {FClass EClass LClass V W LF LE HF HE : Type*}

/-- Missing: finite solvable Galois E/F and its chosen compatible embeddings;
the isobaric class map is characterized independently of a prime-cyclic tower. -/
noncomputable def solvableBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

-- Missing E=F and the empty tower.
lemma solvableBaseChange_refl (π : FClass) : solvableBaseChange FClass FClass π = π := by sorry

lemma solvableBaseChange_tower (π : FClass) :
    solvableBaseChange EClass LClass (solvableBaseChange FClass EClass π) =
      solvableBaseChange FClass LClass π := by sorry

lemma solvableBaseChange_local (π : FClass) (v : V) (w : W)
    (localF : FClass → V → LF) (localE : EClass → W → LE) (res : LF → LE) :
    localE (solvableBaseChange FClass EClass π) w = res (localF π v) := by sorry

lemma solvableBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    solvableBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (solvableBaseChange FClass EClass π) := by sorry

-- TauCeti.GL2Transfer.solvable_empty_test
example (π : FClass) : solvableBaseChange FClass FClass π = π := by sorry

-- TauCeti.GL2Transfer.solvable_two_towers_test
-- Missing: MClass and LClass are the classes for two quadratic subfields of
-- the same biquadratic E/F, with each cyclic map using that field extension.
example {MClass : Type*} (π : FClass) :
    cyclicBaseChange LClass EClass (cyclicBaseChange FClass LClass π) =
      cyclicBaseChange MClass EClass (cyclicBaseChange FClass MClass π) := by sorry

-- TauCeti.GL2Transfer.solvable_degree_six_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] := by sorry

-- TauCeti.GL2Transfer.solvable_cuspidality_test
-- Missing: first quadratic step, a non-invariant inducing character, and
-- isobaricSum. The displayed sum witnesses loss of cuspidality there.
example {H : Type*} (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (ai : H → FClass) (isobaricSum : H → H → EClass) :
    solvableBaseChange FClass EClass (ai θ) = isobaricSum θ (σ θ) := by sorry
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
section QuadraticInduction
variable {FClass EClass H V L2 L1 HF C : Type*}

/-- Missing: K/F quadratic, the supplied continuous Hecke-character carrier H,
and the canonical localRep/global isobaric classes with normalization fixed. -/
noncomputable def quadraticInduction (H FClass : Type*) : H → FClass := by sorry

lemma quadraticInduction_local (θ : H) (v : V)
    (localChar : H → V → L1) (induce : L1 → L2) (localRep : FClass → V → L2) :
    localRep (quadraticInduction H FClass θ) v = induce (localChar θ v) := by sorry

lemma quadraticInduction_central [Monoid HF] (θ : H) (η : HF)
    (restrictChar : H → HF) (ω : FClass → HF) :
    ω (quadraticInduction H FClass θ) = η * restrictChar θ := by sorry

lemma quadraticInduction_baseChange (θ : H) (σ : H → H)
    (isobaricSum : H → H → EClass) :
    cyclicBaseChange FClass EClass (quadraticInduction H FClass θ) =
      isobaricSum θ (σ θ) := by sorry

lemma quadraticInduction_twist [Monoid H] (θ : H) (χ : HF)
    (normPullback : HF → H) (twist : HF → FClass → FClass) :
    quadraticInduction H FClass (θ * normPullback χ) =
      twist χ (quadraticInduction H FClass θ) := by sorry

-- Missing: the actual cuspidal-subtype map of the automorphic supplier. The
-- membership formulation avoids defining a new cuspidality predicate here.
lemma quadraticInduction_cuspidal {CuspidalClass : Type*} (θ : H) (σ : H → H)
    (forget : CuspidalClass → FClass) :
    (∃ π : CuspidalClass, forget π = quadraticInduction H FClass θ) ↔ θ ≠ σ θ := by sorry

-- TauCeti.GL2Transfer.induction_invariant_test
-- Missing: normPullback, η and sum are the supplied quadratic reciprocity data.
example (χ : HF) (η : HF) (normPullback : HF → H)
    (isobaricSum : HF → HF → FClass) [Monoid HF] :
    quadraticInduction H FClass (normPullback χ) = isobaricSum χ (χ * η) := by sorry

-- TauCeti.GL2Transfer.induction_split_test
-- Missing: split v with the two localRep character values a,b and the localRep parameter map.
example {K : Type*} [Field K] (θ : H) (v : V) (a b : K)
    (localRep : FClass → V → Matrix (Fin 2) (Fin 2) K) :
    localRep (quadraticInduction H FClass θ) v = diagonal ![a, b] := by sorry

-- TauCeti.GL2Transfer.induction_determinant_test
-- Missing: v inert in K/F, Wv its local Weil group and g ∈ Wv outside the
-- index-two subgroup; localRep is the supplied local parameter of AI θ. In the
-- basis {e, g e} the parameter of g is antidiagonal, and its determinant is
-- -(a * b): the sign is η_{K/F}(g) = -1 of the central-character formula.
example {K Wv : Type*} [CommRing K] [Group Wv] (θ : H) (v : V) (g : Wv) (a b : K)
    (localRep : FClass → V → Wv →* GeneralLinearGroup (Fin 2) K)
    (hg : (localRep (quadraticInduction H FClass θ) v g).val = !![0, a; b, 0]) :
    ((localRep (quadraticInduction H FClass θ) v g).val).det = -(a * b) := by sorry

-- TauCeti.GL2Transfer.induction_noninvariant_test
-- Missing: rank-one isobaric classes do not lie in the supplied cuspidal subtype.
example {CuspidalClass : Type*} (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (forget : CuspidalClass → FClass) :
    ∃ π : CuspidalClass, forget π = quadraticInduction H FClass θ := by sorry
end QuadraticInduction

/-
Explicit signature omissions (PROTOCOL §13; REV-FIX-RT-AREA-automorphic-1~3).
The non-norm JL domain, eligible cuspidal range, actual Hecke/local-factor maps, compatible rational models and prescribed infinity/globalization hypotheses are required. Equality of rationality fields does not itself provide those models.
These source targets require the actual supplier objects and hypotheses below.
They are not universal theorems about arbitrary types, functions, or multiplicity maps.
Omitted declaration names: TauCeti.GL2Transfer.norm_exception, TauCeti.GL2Transfer.split_hecke, TauCeti.GL2Transfer.local_factors, TauCeti.GL2Transfer.strong_multiplicity_one, TauCeti.GL2Transfer.multiplicity_one, TauCeti.GL2Transfer.coefficient_conjugation, TauCeti.GL2Transfer.rational_models, TauCeti.GL2Transfer.definite_infinity, TauCeti.GL2Transfer.indefinite_parity, TauCeti.GL2Transfer.invariant_exchange, TauCeti.GL2Transfer.supercuspidal_globalization.

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

/-! R17.4 theorem interfaces. The cyclic extension, the real automorphic class
carriers, the action and the localRep restriction maps are supplied, not recreated. -/
section BCTheorems
variable {FClass EClass CF CE H V W LF LE C : Type*}

theorem local_compatibility (π : FClass) (v : V) (w : W)
    (recF : FClass → V → LF) (recE : EClass → W → LE) (res : LF → LE) :
    recE (cyclicBaseChange FClass EClass π) w = res (recF π v) := by sorry

-- CF/CE are the supplied cuspidal subtypes. Include their actual forget maps,
-- not a newly defined predicate on arbitrary isobaric objects.
theorem cyclic_descent (Pi : CE) (σ : CE → CE) (forgetF : CF → FClass)
    (forgetE : CE → EClass) :
    (∃ π : CF, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi) ↔ σ Pi = Pi := by sorry

theorem cuspidality (π : CF) (forgetF : CF → FClass) (forgetE : CE → EClass)
    (η : H) (twist : H → FClass → FClass) :
    (¬ ∃ Pi : CE, cyclicBaseChange FClass EClass (forgetF π) = forgetE Pi) ↔
      twist η (forgetF π) = forgetF π := by sorry

-- Missing: Pi cuspidal invariant output, η generating the prime-degree character
-- group, π one descent; the quadratic noncuspidal fiber is separately in the packet.
theorem cyclic_descent_fibers [Monoid H] (π : FClass) (Pi : EClass) (η : H) (ℓ : ℕ)
    (twist : H → FClass → FClass) :
    {τ | cyclicBaseChange FClass EClass τ = Pi} =
      Set.range (fun i : Fin ℓ => twist (η ^ i.val) π) := by sorry

-- Missing: H is the rank-one Hecke-character carrier and the sums/pullback are
-- the canonical operations. Independent norm-kernel twists must be retained.
theorem isobaric_fibers (χ₁ χ₂ : H) (pullback : H → H)
    (sumF : H → H → FClass) (sumE : H → H → EClass) :
    cyclicBaseChange FClass EClass (sumF χ₁ χ₂) = sumE (pullback χ₁) (pullback χ₂) := by sorry

-- Missing: F ⊂ L ⊂ E and F ⊂ M ⊂ E are two prime-cyclic towers inside the same
-- solvable Galois E/F, and LClass/MClass are the isobaric classes over L and M.
-- Both composites equal the tower-free solvableBaseChange.
theorem tower_independence {LClass MClass : Type*} (π : FClass) :
    cyclicBaseChange LClass EClass (cyclicBaseChange FClass LClass π) =
        solvableBaseChange FClass EClass π ∧
      cyclicBaseChange MClass EClass (cyclicBaseChange FClass MClass π) =
        solvableBaseChange FClass EClass π := by sorry

-- Missing: at every prime-cyclic step a Galois-invariant automorphic descent
-- has been chosen, with compatible character/localRep data. Global Galois descent
-- or unqualified invariance is deliberately not used as the hypothesis.
theorem solvable_descent (Pi : EClass) :
    ∃ π : FClass, solvableBaseChange FClass EClass π = Pi := by sorry

-- Missing: the arithmetic owner has already constructed E/F completely split
-- at v, and these are the canonically identified localRep carriers.
theorem prescribed_local_base_change (π : FClass) (v : V) (w : W)
    (localF : FClass → V → C) (localE : EClass → W → C) :
    localE (solvableBaseChange FClass EClass π) w = localF π v := by sorry

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
AL.3/rs-global-poles with rs-boundary-nonvanishing and the omitted-local-factor
regularity from AL.2/jacquet-shalika-satake-bound, including infinity, for two unitary cuspidal GL3
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

section ArithmeticLifting
variable {G I T : Type*} [Group G] [Group I] [Group T]

-- Missing: I is the idele class group of a number field; T its n-torsion quotient
-- with the global μ_n factored out; ω continuous and trivial at complex places.
-- Continuous/finite-order data and the GW exceptional choice must be restored.
theorem finite_hecke_extension (i : T →* I) (ω : T →* ℂˣ) :
    ∃ χ : I →* ℂˣ, Set.Finite (Set.range χ) ∧ χ.comp i = ω := by sorry

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

-- Missing: F totally real, p>2, continuous absolutely irreducible solvable r̄;
-- O is an adequate cyclotomic integral coefficient ring after finite extension,
-- red its chosen place map and ι its complex embedding; c indexes all real places.
-- The scalar/projective theorem alone does not supply this reduction identity.
theorem odd_residual_lift {O k J : Type*} [CommRing O] [Field k]
    (p : ℕ) [CharP k p] (hp : 2 < p)
    (r : G →* GeneralLinearGroup (Fin 2) k) (red : O →+* k) (ι : O →+* ℂ)
    (c : J → G) (hc : ∀ j, c j * c j = 1)
    (hodd : ∀ j, GeneralLinearGroup.det (r (c j)) = -1) :
    ∃ ρ : G →* GeneralLinearGroup (Fin 2) O,
      Set.Finite (Set.range ρ) ∧ (GeneralLinearGroup.map red).comp ρ = r ∧
      ∀ j, GeneralLinearGroup.det (GeneralLinearGroup.map ι (ρ (c j))) = -1 := by sorry
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
application. The local Weil groups, Hecke characters and weight-one forms are the
suppliers' carriers, passed as parameters as elsewhere in this file. -/
section AddedByReview

-- Missing: K a p-adic field, W_K its Weil group, σ continuous; Glob indexes pairs
-- (F, v) with F a number field and F_v ≅ K, W g the Weil group of F and emb g the
-- decomposition embedding at v. Type preservation and the Q₂/S₄ oddness clause of
-- Tunnell's Theorem 1.3 are in the packet.
theorem tunnell_primitive_globalization {WK Glob : Type*} [Group WK]
    (W : Glob → Type*) [∀ g, Group (W g)] (emb : ∀ g, WK →* W g)
    (σ : WK →* GeneralLinearGroup (Fin 2) ℂ) :
    ∃ g : Glob, ∃ ρ : W g →* GeneralLinearGroup (Fin 2) ℂ,
      ∃ P : GeneralLinearGroup (Fin 2) ℂ, ∀ x, ρ (emb g x) = P * σ x * P⁻¹ := by sorry

-- Missing: F totally real, L/F the CM quadratic extension with conditions (a)–(c) of
-- Carayol 11.2, H the Hecke quasi-characters of L, component θ 𝔭 the 𝔭-component,
-- weil the local Weil representation and localRep the supplier's local component.
theorem prescribed_local_induction {H FClass V C Loc : Type*} (𝔭 : V) (ξ𝔭 : C)
    (component : H → V → C) (localRep : FClass → V → Loc) (weil : C → Loc) :
    ∃ θ : H, component θ 𝔭 = ξ𝔭 ∧
      localRep (quadraticInduction H FClass θ) 𝔭 = weil ξ𝔭 := by sorry

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

-- Missing: G = G_Q, ρbar continuous and absolutely irreducible, c complex conjugation;
-- Form is the normalized weight-one newform carrier and residual f its reduction at λ.
-- The proof applies solvable_artin and q_weight_one to s ∘ ρbar, with s from gl2F3_section.
theorem octahedral_mod_three_application {G Form : Type*} [Group G]
    (ρbar : G →* GeneralLinearGroup (Fin 2) (ZMod 3)) (c : G)
    (hodd : GeneralLinearGroup.det (ρbar c) = -1) (weight : Form → ℕ)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) (ZMod 3)) :
    ∃ f : Form, weight f = 1 ∧ residual f = ρbar := by sorry

end AddedByReview

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

-- Missing: R01.4's finite classification and the actual dihedral group carrier.
-- This prototype records the quadratic inducing field's index-two subgroup
-- and non-invariant character data; the induction is supplied, not defined here.
theorem solvable_dihedral (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ H : Subgroup G, H.index = 2 ∧ ∃ θ : H →* kˣ, Set.Finite (Set.range θ) := by sorry

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

-- All arithmetic conditions in the source technical lemma are visible here.
-- Missing: Form's actual primitive/classical carrier, q-expansion, character,
-- residual representation and conductor projections, plus λ-integrality.
theorem rt_technical_lemma {O Form C : Type*} [CommRing O] [Monoid C]
    (red : O →+* k) (qexp : Form → PowerSeries O) (level weight : Form → ℕ)
    (character : Form → C) (residual : Form → G →* GeneralLinearGroup (Fin 2) k)
    (conductor : (G →* GeneralLinearGroup (Fin 2) k) → ℕ)
    (g : Form) (ν N r : ℕ) (hν : ν = 0 ∨ ν = 2 ∨ ν = 3)
    (hN : N % 2 = 1) (hr : r = 1 ∨ (r.Prime ∧ r ≠ 2 ∧ ¬r ∣ N))
    (hlevel : level g = 2 ^ ν * N * r) (hweight : weight g = 1)
    (hchar : character g ^ 2 = 1) (hcond : conductor (residual g) = N)
    (haux : r ≠ 1 → red (PowerSeries.coeff r (qexp g)) ≠ 1)
    (heven : ν = 2 → ∀ n, Even n → PowerSeries.coeff n (qexp g) = 0)
    (htwo : ν = 3 → red (PowerSeries.coeff 2 (qexp g)) ≠ 0) :
    ∃ f : Form, level f = N ∧ character f = 1 ∧
      weight f = (if ν = 3 then 4 else 2) ∧ residual f = residual g := by sorry

-- Missing: K real quadratic, θ its same-order lift and the controlled ray-class
-- construction ramified at exactly one real place and one auxiliary degree-one prime.
theorem serre_odd_trick {H : Type*} [Group H] (θ : H →* ℂˣ) (c : H)
    (induce : (H →* ℂˣ) → G →* GeneralLinearGroup (Fin 2) ℂ) :
    ∃ ξ : H →* ℂˣ, (∀ h, ξ h ^ 2 = 1) ∧
      ∃ cQ : G, GeneralLinearGroup.det (induce (θ * ξ) cQ) = -1 := by sorry

-- Missing: G=G_Q, r has irreducible LINEAR-dihedral image, D is the quadratic
-- discriminant, N the prime-to-two Artin conductor and ν its actual dyadic case.
-- The discriminant restriction cannot be dropped or extended to D≡4 mod8.
theorem rohrlich_tunnell {Form C : Type*} [Monoid C]
    (r : G →* GeneralLinearGroup (Fin 2) k) (D : ℤ) (N ν : ℕ)
    (hD : Odd D ∨ 8 ∣ D) (hN : Odd N)
    (weight level : Form → ℕ) (character : Form → C)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ f : Form, level f = N ∧ character f = 1 ∧
      weight f = (if ν = 3 then 4 else 2) ∧ residual f = r := by sorry

-- Missing: G=G_Q, r dihedral; O/red/ι selected after adequate cyclotomic
-- coefficient extension. No conductor equality is asserted by general Lemma 3.
theorem wiese_odd_lift {O : Type*} [CommRing O]
    (r : G →* GeneralLinearGroup (Fin 2) k) (red : O →+* k) (ι : O →+* ℂ) (c : G) :
    ∃ ρ : G →* GeneralLinearGroup (Fin 2) O,
      Set.Finite (Set.range ρ) ∧ (GeneralLinearGroup.map red).comp ρ = r ∧
      GeneralLinearGroup.det (GeneralLinearGroup.map ι (ρ c)) = -1 := by sorry

-- Missing: r dihedral and unramified at two; Form is the normalized cuspidal
-- Katz carrier, N the exact odd conductor, and character its actual determinant.
theorem unramified_katz {Form C : Type*} (r : G →* GeneralLinearGroup (Fin 2) k)
    (N : ℕ) (weight level : Form → ℕ) (character : Form → C) (detChar : C)
    (residual : Form → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ f : Form, weight f = 1 ∧ level f = N ∧ character f = detChar ∧ residual f = r := by sorry

-- Missing: the qualitative soluble/irreducible hypotheses, the actual R15.6
-- witness carrier and its coefficient-place/lattice realization operation.
theorem qualitative_residual_modularity {Witness : Type*}
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, realize w = r := by sorry

-- Missing: R15 Hasse and integral-lifting hypotheses, full Hecke action and
-- the DS dominating-DVR coefficient choices. No new weight-change construction.
theorem weight_two_witness {Witness : Type*} (r : G →* GeneralLinearGroup (Fin 2) k)
    (weight : Witness → ℕ) (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, 2 ≤ weight w ∧ realize w = r := by sorry
end CharacteristicTwo

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
-- field (characteristic two included). Missing only the Galois specialization:
-- Γ = G_F, Kgp = G_K for the quadratic K/F and E = G_E for a finite E/F. σθ is the
-- one-dimensional representation of θ. In characteristic zero and for finite Γ,
-- TauCeti.simple_indFDRep_ofLinearCharacter_iff is the pinned unrestricted case.
-- Restricted to E, Ind θ is irreducible exactly when E ⊄ Kgp and θ differs from
-- its conjugate on E ∩ Kgp; when E ≤ Kgp it is the sum of two characters.
theorem quadratic_restriction {Γ k : Type*} [Group Γ] [Field k] (Kgp E : Subgroup Γ)
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

-- Missing actual cyclic automorphic descent, Galois invariance, one fixed η^i
-- chosen independently of λ, and matching ALL good characteristic polynomials.
-- These parameter functions are the suppliers' matrices, not arbitrary traces.
theorem compatible_descent (Pi : EClass) (r : Λ → V → GeneralLinearGroup (Fin 2) K)
    (sat : FClass → V → GeneralLinearGroup (Fin 2) K) (S : Finset V) :
    ∃ π : FClass, cyclicBaseChange FClass EClass π = Pi ∧
      ∀ ell v, v ∉ S → (sat π v).val.trace = (r ell v).val.trace ∧
        (sat π v).val.det = (r ell v).val.det := by sorry

-- Missing the extension/localRep/disjointness data supplied by R23, automorphic
-- invariance and consistent character matching at every cyclic tower step.
-- Galois descent alone is explicitly insufficient.
theorem potential_modularity_interface (Pi : EClass) :
    ∃ π : FClass, solvableBaseChange FClass EClass π = Pi := by sorry
end TransferExports

end TauCeti.GL2Transfer
