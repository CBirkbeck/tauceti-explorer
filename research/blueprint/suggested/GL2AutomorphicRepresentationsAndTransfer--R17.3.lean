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

namespace TauCeti.GL2Transfer

open Matrix

section GlobalJL
variable {DClass FClass V LD LF H C : Type*}

/-- Missing: F a number field, quaternion algebra D, fixed central character;
DClass is the non-norm spectrum and FClass the D-compatible cuspidal spectrum,
with the exact finite/infinite localRep hypotheses of R17.3/global-jl. -/
noncomputable def globalJL (DClass FClass : Type*) : DClass ≃ FClass := by sorry

lemma globalJL_local (d : DClass) (v : V)
    (localD : DClass → V → LD) (localF : FClass → V → LF)
    (localJL : V → LD → LF) :
    localF (globalJL DClass FClass d) v = localJL v (localD d v) := by sorry

lemma globalJL_central (d : DClass) (ωD : DClass → C) (ωF : FClass → C) :
    ωF (globalJL DClass FClass d) = ωD d := by sorry

lemma globalJL_inverse (d : DClass) (π : FClass) :
    (globalJL DClass FClass).symm (globalJL DClass FClass d) = d ∧
    globalJL DClass FClass ((globalJL DClass FClass).symm π) = π := by sorry

lemma globalJL_twist (d : DClass) (χ : H)
    (twistD : H → DClass → DClass) (twistF : H → FClass → FClass) :
    globalJL DClass FClass (twistD χ d) = twistF χ (globalJL DClass FClass d) := by sorry

-- Missing: the quaternion algebra is split and all localRep identifications are identity.
lemma globalJL_split (π : FClass) : globalJL FClass FClass π = π := by sorry

-- TauCeti.GL2Transfer.jl_split_test
example (π : FClass) : globalJL FClass FClass π = π := by sorry

-- TauCeti.GL2Transfer.jl_steinberg_test
-- Missing: D/Q ramified at {p,infinity}, π weight two with π_p=St⊗χ;
-- charNrd is the supplied division-place character class χ∘Nrd.
example (π : FClass) (p : V) (localD : DClass → V → LD) (charNrd : LD) :
    localD ((globalJL DClass FClass).symm π) p = charNrd := by sorry

-- TauCeti.GL2Transfer.jl_inverse_test
example (π : FClass) :
    globalJL DClass FClass ((globalJL DClass FClass).symm π) = π := by sorry
end GlobalJL

section Satake
variable {K L : Type*} [CommRing K] [CommRing L]

/-- The transfer-specific power rule on the existing GL, not a Satake carrier.
f=0 is the formal matrix-power extension, not a field extension. -/
noncomputable def unramifiedBaseChange (A : GeneralLinearGroup (Fin 2) K)
    (f : ℕ) : GeneralLinearGroup (Fin 2) K := by sorry

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
-- This literal Satake calculation checks the localRep rule; no global form with
-- arbitrarily prescribed diagonal Satake eigenvalues is asserted.
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] := by sorry

-- TauCeti.GL2Transfer.cyclic_induced_test
-- Missing: θ≠θ^σ, quadratic E/F and the actual isobaric direct-sum operation.
example (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (ai : H → FClass) (isobaricSum : H → H → EClass) :
    cyclicBaseChange FClass EClass (ai θ) = isobaricSum θ (σ θ) := by sorry

-- TauCeti.GL2Transfer.cyclic_odd_degree_test
-- The algebraic obstruction to a nontrivial prime-odd self-twist. The
-- automorphic identification of this obstruction is in the packet.
example {A : Type*} [Group A] (η : A) (ℓ : ℕ) (hprime : ℓ.Prime)
    (hodd : ℓ ≠ 2) (horder : orderOf η = ℓ) : η ^ 2 ≠ 1 := by sorry
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

section Adjoint
variable {FClass GL3Class V LF L3 H : Type*}

/-- Missing: π unitary cuspidal over a number field, and the supplier-owned
isobaric rank-three carrier. This is Ad=Sym²⊗ω⁻¹, not untwisted Sym². -/
noncomputable def adjointLift (FClass GL3Class : Type*) : FClass → GL3Class := by sorry

lemma adjointLift_local (π : FClass) (v : V)
    (local2 : FClass → V → LF) (local3 : GL3Class → V → L3) (adjoint : LF → L3) :
    local3 (adjointLift FClass GL3Class π) v = adjoint (local2 π v) := by sorry

lemma adjointLift_unramified {K : Type*} [Field K] (π : FClass) (v : V)
    (α β : K) (hα : α ≠ 0) (hβ : β ≠ 0)
    (sat2 : FClass → V → Matrix (Fin 2) (Fin 2) K)
    (sat3 : GL3Class → V → Matrix (Fin 3) (Fin 3) K)
    (hsat : sat2 π v = diagonal ![α, β]) :
    sat3 (adjointLift FClass GL3Class π) v = diagonal ![α / β, 1, β / α] := by sorry

lemma adjointLift_twist (π : FClass) (χ : H) (twist : H → FClass → FClass) :
    adjointLift FClass GL3Class (twist χ π) = adjointLift FClass GL3Class π := by sorry

lemma adjointLift_central {C : Type*} [Monoid C] (π : FClass) (ω : GL3Class → C) :
    ω (adjointLift FClass GL3Class π) = 1 := by sorry

-- The next four examples are literal diagonal formulas in the localRep rule
-- of adjointLift_unramified; they do not assert global existence for a chosen A.
-- TauCeti.GL2Transfer.adjoint_diagonal_test
example : diagonal ![(2 : ℚ) / 3, 1, 3 / 2] = !![2/3, 0, 0; 0, 1, 0; 0, 0, 3/2] := by sorry

-- TauCeti.GL2Transfer.adjoint_scalar_test
example {K : Type*} [Field K] (a : K) (ha : a ≠ 0) :
    diagonal ![a / a, 1, a / a] = (1 : Matrix (Fin 3) (Fin 3) K) := by sorry

-- TauCeti.GL2Transfer.adjoint_twist_test
example {K : Type*} [Field K] (α β u : K) (hα : α ≠ 0) (hβ : β ≠ 0) (hu : u ≠ 0) :
    diagonal ![(u * α) / (u * β), 1, (u * β) / (u * α)] =
      diagonal ![α / β, 1, β / α] := by sorry

-- TauCeti.GL2Transfer.adjoint_not_sym_square_test
example : diagonal ![(2 : ℚ) / 3, 1, 3 / 2] ≠ diagonal ![(4 : ℚ), 6, 9] := by sorry
end Adjoint

section Cubic
variable {FClass EClass V W HF HE C K : Type*} [CommRing K]

/-- Missing: separable non-Galois cubic K/F, its S₃ closure, the JPSS
construction and strong localRep upgrade; this is not a prime-cyclic tower. -/
noncomputable def cubicBaseChange (FClass EClass : Type*) : FClass → EClass := by sorry

lemma cubicBaseChange_unramified (π : FClass) (v : V) (w : W) (f : ℕ)
    (satF : FClass → V → GeneralLinearGroup (Fin 2) K)
    (satE : EClass → W → GeneralLinearGroup (Fin 2) K) :
    satE (cubicBaseChange FClass EClass π) w = unramifiedBaseChange (satF π v) f := by sorry

lemma cubicBaseChange_twist (π : FClass) (χ : HF) (normPullback : HF → HE)
    (twistF : HF → FClass → FClass) (twistE : HE → EClass → EClass) :
    cubicBaseChange FClass EClass (twistF χ π) =
      twistE (normPullback χ) (cubicBaseChange FClass EClass π) := by sorry

lemma cubicBaseChange_central (π : FClass) (ωF : FClass → HF) (ωE : EClass → HE)
    (normPullback : HF → HE) :
    ωE (cubicBaseChange FClass EClass π) = normPullback (ωF π) := by sorry

-- Missing: sat is the actual unramified localRep class projection on isobaric classes.
lemma cubicBaseChange_unique (Pi Ψ : EClass) (S : Finset W)
    (sat : EClass → W → C) (h : ∀ w, w ∉ S → sat Pi w = sat Ψ w) : Pi = Ψ := by sorry

-- TauCeti.GL2Transfer.cubic_split_test
example (A : GeneralLinearGroup (Fin 2) K) :
    (unramifiedBaseChange A 1, unramifiedBaseChange A 1, unramifiedBaseChange A 1) =
      (A, A, A) := by sorry

-- TauCeti.GL2Transfer.cubic_one_two_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    ((unramifiedBaseChange A 1).val, (unramifiedBaseChange A 2).val) =
      (!![2, 0; 0, 3], !![4, 0; 0, 9]) := by sorry

-- TauCeti.GL2Transfer.cubic_inert_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 3).val = !![8, 0; 0, 27] := by sorry

-- TauCeti.GL2Transfer.cubic_not_three_test
example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 1, unramifiedBaseChange A 2) ≠
      (unramifiedBaseChange A 3, unramifiedBaseChange A 3) := by sorry
end Cubic

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
example {K : Type*} [CommRing K] (a b : K) :
    ( (!![0, a; b, 0] : Matrix (Fin 2) (Fin 2) K)).det = -(a * b) := by sorry

-- TauCeti.GL2Transfer.induction_noninvariant_test
-- Missing: rank-one isobaric classes do not lie in the supplied cuspidal subtype.
example {CuspidalClass : Type*} (θ : H) (σ : H → H) (hθ : θ ≠ σ θ)
    (forget : CuspidalClass → FClass) :
    ∃ π : CuspidalClass, forget π = quadraticInduction H FClass θ := by sorry
end QuadraticInduction

/-! R17.3 theorem interfaces. Each abstract projection must be its named supplier
operation; the number-field/quaternion data and eligible spectra of GlobalJL are
still omitted. These are not assertions about arbitrary sets of classes. -/
section JLTheorems
variable {DClass FClass DFull H V C : Type*}

theorem norm_exception (forget : DClass → DFull) (normChar : H → DFull)
    (d : DClass) (χ : H) : forget d ≠ normChar χ := by sorry

theorem split_hecke (d : DClass) (v : V) (T S : DClass → V → C)
    (T' S' : FClass → V → C) :
    T' (globalJL DClass FClass d) v = T d v ∧
    S' (globalJL DClass FClass d) v = S d v := by sorry

theorem local_factors (d : DClass) (v : V) (s : ℂ) (χ : H)
    (L ε : DClass → V → H → ℂ → ℂ) (L' ε' : FClass → V → H → ℂ → ℂ) :
    L' (globalJL DClass FClass d) v χ s = L d v χ s ∧
    ε' (globalJL DClass FClass d) v χ s = ε d v χ s := by sorry

theorem strong_multiplicity_one (d e : DClass) (S : Finset V)
    (localRep : DClass → V → C) (h : ∀ v, v ∉ S → localRep d v = localRep e v) : d = e := by sorry

theorem multiplicity_one (d : DClass) (multiplicity : DClass → ℕ) :
    multiplicity d = 1 := by sorry

-- Missing: cohomological infinity types, rational structures and their conjugates.
theorem coefficient_conjugation (d : DClass) (conjD : DClass → DClass)
    (conjF : FClass → FClass) :
    globalJL DClass FClass (conjD d) = conjF (globalJL DClass FClass d) := by sorry

-- The supplied coefficient models may require a finite extension; this prototype
-- compares their Hecke scalars, rather than promising arbitrary whole-module descent.
theorem rational_models {K L : Type*} [Field K] [Field L] (φ : K →+* L)
    (d : DClass) (v : V) (aD : DClass → V → K) (aF : FClass → V → K) :
    φ (aF (globalJL DClass FClass d) v) = φ (aD d v) := by sorry

-- Missing: D/Q ramified at p,infinity; coefficient type W(-k,0); d non-norm.
-- The excluded k=0 norm branch has weight zero, as stated in the packet.
theorem definite_infinity (d : DClass) (k : ℕ) (weight : FClass → ℕ) :
    weight (globalJL DClass FClass d) = k + 2 := by sorry

-- Apply imported Hilbert reciprocity to the actual finite ramification set first.
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

-- Missing CDN23's even-degree totally real E and the common representation
-- compatible with both invariant-exchanged quaternion algebras, plus level data.
theorem invariant_exchange {D0Class : Type*} (π : FClass) :
    ∃ d0 : D0Class, ∃ d : DClass,
      globalJL D0Class FClass d0 = π ∧ globalJL DClass FClass d = π := by sorry

-- Missing the precise Clozel limit-multiplicity hypotheses, compatible central
-- character after the permitted twist, and the specified infinity type.
theorem supercuspidal_globalization (v : V) (τ : C) (localRep : DClass → V → C) :
    ∃ d : DClass, localRep d v = τ := by sorry
end JLTheorems

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

-- Missing: t₁/t₂ are the composites through two actual subnormal prime-cyclic
-- towers to the same solvable Galois field, not arbitrary class maps.
theorem tower_independence (t₁ t₂ : FClass → EClass) : t₁ = t₂ := by sorry

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

-- Missing: cyclic cubic E/F, the localRep induction operation and Hecke character.
-- Only existence is prototyped; the orbit-size-three criterion is in the document.
theorem cubic_character_induction {GL3Class : Type*} (θ : H)
    (inducedLocal : H → V → C) (local3 : GL3Class → V → C) :
    ∃ Pi : GL3Class, ∀ v, local3 Pi v = inducedLocal θ v := by sorry

-- Missing: generic AL converse, all Hecke-character twists with dual entireness,
-- functional equations and strip bounds; GL₃ isobaric uniqueness/pole criterion.
theorem gl3_recognition {GL3Class : Type*} (Pi Ψ : GL3Class) (S : Finset V)
    (localRep : GL3Class → V → C) (h : ∀ v, v ∉ S → localRep Pi v = localRep Ψ v) : Pi = Ψ := by sorry

-- The concrete determinant-plus-restriction recognition used by Carayol.
-- Missing: G=W_F, H the chosen degree-three Sylow-2 preimage, ρ primitive
-- tetrahedral/octahedral and σ irreducible; not an arbitrary subgroup criterion.
theorem extraordinary_cubic_compatibility {G H : Type*} [Group G] [Group H]
    (i : H →* G) (ρ σ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hdet : GeneralLinearGroup.det.comp ρ = GeneralLinearGroup.det.comp σ)
    (P : GeneralLinearGroup (Fin 2) ℂ)
    (hres : ∀ h, ρ (i h) = P * σ (i h) * P⁻¹) :
    ∃ Q : GeneralLinearGroup (Fin 2) ℂ, ∀ g, ρ g = Q * σ g * Q⁻¹ := by sorry
end BCTheorems

section ArithmeticLifting
variable {G I T : Type*} [Group G] [Group I] [Group T]

-- Missing: I is the idele class group of a number field; T its n-torsion quotient
-- with the global μ_n factored out; ω continuous and trivial at complex places.
-- Continuous/finite-order data and the GW exceptional choice must be restored.
theorem finite_hecke_extension (i : T →* I) (ω : T →* ℂˣ) :
    ∃ χ : I →* ℂˣ, Set.Finite (Set.range χ) ∧ χ.comp i = ω := by sorry

-- AddCircle 1 over Q is the existing additive Q/Z quotient. Missing: G=G_F,
-- discrete trivial coefficients and continuous cochains. The equation displays
-- exactly the trivial-action obstruction that must vanish, without a fake H² type.
theorem tate_vanishing (α : G → G → AddCircle (1 : ℚ))
    (hα : ∀ g h k, α g h + α (g * h) k = α g (h * k) + α h k) :
    ∃ b : G → AddCircle (1 : ℚ), ∀ g h, α g h = b g + b h - b (g * h) := by sorry

-- Missing: G is the canonical absolute Galois group of a number field and r
-- continuous; the output must be continuous too. Generic groups do not have
-- this lifting property. The matrix/projective carriers are already in Mathlib.
theorem finite_projective_lift (r : G →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : Set.Finite (Set.range r)) :
    ∃ ρ : G →* GeneralLinearGroup (Fin 2) ℂ,
      Set.Finite (Set.range ρ) ∧ ProjGenLinGroup.mk.comp ρ = r := by sorry

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
section Artin
variable {G V FClass : Type*} [Group G] (W : V → Type*) [∀ v, Group (W v)]
    (emb : ∀ v, W v →* G)
    (rec : FClass → ∀ v, W v →* GeneralLinearGroup (Fin 2) ℂ)

theorem dihedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

theorem tetrahedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

-- Missing the original Tunnell/JPSS comparison as well as the S₄ image hypothesis.
theorem octahedral_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃ π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry

theorem solvable_artin (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (hfinite : Set.Finite (Set.range ρ)) :
    ∃! π : FClass, ∀ v, rec π v = ρ.comp (emb v) := by sorry
end Artin

section WeightOne
variable {G Form V C : Type*} [Group G]

-- Missing: G=G_Q, solvable finite irreducible ρ, odd at c; Form is the actual
-- normalized weight-one newform carrier. S excludes the bad primes, and N is
-- the Artin conductor. Coefficient field, λ and lattice are supplier data.
theorem q_weight_one (ρ : G →* GeneralLinearGroup (Fin 2) ℂ) (c : G)
    (hodd : GeneralLinearGroup.det (ρ c) = -1) (N : ℕ) (S : Finset V)
    (Frob : V → G) (weight level : Form → ℕ) (a : Form → V → ℂ) :
    ∃ f : Form, weight f = 1 ∧ level f = N ∧
      ∀ v, v ∉ S → a f v = (ρ (Frob v)).val.trace := by sorry

-- Missing: G=G_F, F totally real, Form the holomorphic parallel-weight-one
-- Hilbert carrier; real c's all have the weight-one (1,sign) Weil parameter.
theorem tr_weight_one {J : Type*} (ρ : G →* GeneralLinearGroup (Fin 2) ℂ)
    (c : J → G) (hodd : ∀ j, GeneralLinearGroup.det (ρ (c j)) = -1)
    (weight : Form → J → ℕ) : ∃ f : Form, ∀ j, weight f j = 1 := by sorry

-- Missing: the data produced by odd_residual_lift/tr_weight_one with the chosen
-- coefficient place and lattice; this is a supplied residual witness, not its definition.
theorem residual_lt_application {k Witness : Type*} [Field k]
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (realize : Witness → G →* GeneralLinearGroup (Fin 2) k) :
    ∃ w : Witness, realize w = r := by sorry
end WeightOne

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

-- Missing: the actual induced Teichmüller lift, its quadratic field K and the
-- conductor maps. The equality retains both the discriminant and norm factor.
theorem teichmuller_conductor (D conductorNorm N ν : ℕ) :
    D * conductorNorm = 2 ^ ν * N := by sorry

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
    (r : G →* GeneralLinearGroup (Fin 2) k) (D N ν : ℕ)
    (hD : D % 2 = 1 ∨ 8 ∣ D) (hN : N % 2 = 1)
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

-- Missing G=G_F, H=G_E, i restriction and E linearly disjoint from the finite
-- projective-kernel field. Equality of projective ranges is the criterion that
-- gives residual absolute irreducibility, imported from R01.4.
theorem disjoint_irreducibility (i : H →* G)
    (r : G →* GeneralLinearGroup (Fin 2) K) :
    Set.range (ProjGenLinGroup.mk.comp (r.comp i)) = Set.range (ProjGenLinGroup.mk.comp r) := by sorry

-- Missing quadratic K/F, E/F and the supplied inducing character θ. H is G_EK;
-- E does not contain K. This is the character-distinctness half of the imported
-- Mackey criterion; the containing-K reducible branch remains in the packet.
theorem quadratic_restriction {J : Type*} [Group J]
    (i : H →* J) (θ θσ : J →* Kˣ)
    (hinduced : H →* GeneralLinearGroup (Fin 2) K) :
    θ.comp i ≠ θσ.comp i →
      ∃ g : H, θ (i g) ≠ θσ (i g) := by sorry

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
