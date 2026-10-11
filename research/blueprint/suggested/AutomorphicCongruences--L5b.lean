/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex
-/
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Nothing here claims implementation.

AutomorphicCongruences, L5w and L5b, at Mathlib 082e2d3 / Tau Ceti f790474.

The coefficient-ideal definition, all five API items and all four tests have signatures.
The further signatures below concern concrete algebraic reductions. The actual Hilbert,
GU(2,2), continuous Tate/Selmer and p-adic L-function carriers are absent at this baseline.
Their arithmetic declarations are recorded by name and exact mathematical statement in
comments at the end. Those comments are signature gaps, not elaborated arithmetic theorems.
No arbitrary proposition field stands in for a missing object or hypothesis.
-/

namespace AutomorphicCongruencesL5b

section CoefficientIdeal
variable {R H J : Type*} [CommRing R] [CommRing H]

/-- AutomorphicCongruences:L5w/eisenstein-coefficient-ideal
The preimage in the coefficient ring of the ideal of the actual Hecke differences.
The arithmetic index J includes all of Wan 9.1's polynomial, central and ordinary operators. -/
noncomputable def wanEisensteinIdeal
    (ι : R →+* H) (operator : J → H) (eigenvalue : J → R) : Ideal R := by
  sorry

lemma wanEisensteinIdeal_mem
    (ι : R →+* H) (operator : J → H) (eigenvalue : J → R) (r : R) :
    r ∈ wanEisensteinIdeal ι operator eigenvalue ↔
      ι r ∈ Ideal.span (Set.range (fun j => operator j - ι (eigenvalue j))) := by
  sorry

lemma wanEisensteinIdeal_quotient_kernel
    (ι : R →+* H) (operator : J → H) (eigenvalue : J → R) :
    wanEisensteinIdeal ι operator eigenvalue =
      RingHom.ker ((Ideal.Quotient.mk
        (Ideal.span (Set.range (fun j => operator j - ι (eigenvalue j))))).comp ι) := by
  sorry

lemma wanEisensteinIdeal_generator
    (ι : R →+* H) (operator : J → H) (eigenvalue : J → R) (j : J) :
    Ideal.Quotient.mk (Ideal.span (Set.range (fun k => operator k - ι (eigenvalue k))))
        (operator j) =
      Ideal.Quotient.mk (Ideal.span (Set.range (fun k => operator k - ι (eigenvalue k))))
        (ι (eigenvalue j)) := by
  sorry

/-- First isomorphism theorem, with the coefficient action preserved. Surjectivity is an
actual hypothesis; in the arithmetic application it needs the Hecke-generator argument. -/
lemma wanEisensteinIdeal_quotient_surjective
    (ι : R →+* H) (operator : J → H) (eigenvalue : J → R)
    (honto : Function.Surjective
      ((Ideal.Quotient.mk
        (Ideal.span (Set.range (fun j => operator j - ι (eigenvalue j))))).comp ι)) :
    ∃ e : (R ⧸ wanEisensteinIdeal ι operator eigenvalue) ≃+*
        (H ⧸ Ideal.span (Set.range (fun j => operator j - ι (eigenvalue j)))),
      ∀ r, e (Ideal.Quotient.mk _ r) = Ideal.Quotient.mk _ (ι r) := by
  sorry

/-- A commuting coefficient/Hecke square gives inclusion, without asserting kernel
base-change equality for an arbitrary specialization. -/
lemma wanEisensteinIdeal_baseChange_le
    {R' H' : Type*} [CommRing R'] [CommRing H']
    (ι : R →+* H) (ι' : R' →+* H') (α : R →+* R') (β : H →+* H')
    (operator : J → H) (eigenvalue : J → R)
    (hsquare : β.comp ι = ι'.comp α) :
    Ideal.map α (wanEisensteinIdeal ι operator eigenvalue) ≤
      wanEisensteinIdeal ι' (fun j => β (operator j)) (fun j => α (eigenvalue j)) := by
  sorry

-- eisenstein_equal_eigenvalues: zero difference and injective coefficient map.
example : wanEisensteinIdeal (RingHom.id ℤ)
    (fun _ : Unit => (7 : ℤ)) (fun _ : Unit => (7 : ℤ)) = ⊥ := by
  sorry

-- eisenstein_mod_five: detects both the direction and multiplicity of the ideal.
example :
    wanEisensteinIdeal (RingHom.id ℤ)
        (fun _ : Unit => (8 : ℤ)) (fun _ : Unit => (3 : ℤ)) =
      Ideal.span ({(5 : ℤ)} : Set ℤ) ∧
    wanEisensteinIdeal (RingHom.id ℤ)
        (fun _ : Unit => (8 : ℤ)) (fun _ : Unit => (3 : ℤ)) ≠
      Ideal.span ({(25 : ℤ)} : Set ℤ) := by
  sorry

-- eisenstein_unit_difference: a unit relation destroys the entire quotient.
example : wanEisensteinIdeal (RingHom.id ℤ)
    (fun _ : Unit => (2 : ℤ)) (fun _ : Unit => (1 : ℤ)) = ⊤ := by
  sorry

-- eisenstein_kernel_noninjective: the coefficient kernel survives even with no difference.
example : wanEisensteinIdeal (Int.castRingHom (ZMod 5))
    (fun _ : Unit => (3 : ZMod 5)) (fun _ : Unit => (3 : ℤ)) =
      Ideal.span ({(5 : ℤ)} : Set ℤ) := by
  sorry
end CoefficientIdeal

section IntegralAlgebra
variable {R : Type*} [CommRing R]

/-- Algebraic reduction only: changing the period/projector by a unit preserves its ideal.
The arithmetic identification of that unit remains in the named comparison target. -/
theorem canonicalPeriodDuality (a : R) (u : Rˣ) :
    Ideal.span ({(u : R) * a} : Set R) = Ideal.span ({a} : Set R) := by
  sorry

/-- Algebraic reduction only: the order-two splitting is integral when 2 is invertible.
The continuous global and local Selmer maps are missing hypotheses/carriers, not proved here. -/
theorem quadraticSelmerDecomposition
    {M : Type*} [AddCommGroup M] [Module R M]
    (c : M →ₗ[R] M) (hc : c.comp c = LinearMap.id) (h2 : IsUnit (2 : R)) :
    Nonempty (M ≃ₗ[R]
      ((LinearMap.ker (c - LinearMap.id)) × (LinearMap.ker (c + LinearMap.id)))) := by
  sorry

/-- Algebraic reduction only: a unit-normalized product has the same principal ideal.
The analytic interpolation and Neron-period identities are omitted arithmetic hypotheses. -/
theorem cyclotomicAnalyticFactorization (L L₁ L₂ : R)
    (hfactor : ∃ u : Rˣ, L = (u : R) * (L₁ * L₂)) :
    Ideal.span ({L} : Set R) =
      Ideal.span ({L₁} : Set R) * Ideal.span ({L₂} : Set R) := by
  sorry

/-- Algebraic reduction only: transport the EARLY bound, then use correctly oriented control.
I is the two-variable characteristic product, A the early analytic product. -/
theorem fourFactorProductBound
    {S : Type*} [CommRing S] (π : S →+* R) (I A : Ideal S)
    (J₀ J₁ J₂ J₃ B₀ B₁ B₂ B₃ : Ideal R)
    (hearly : I ≤ A)
    (hcontrol : J₀ * J₁ * J₂ * J₃ ≤ Ideal.map π I)
    (hanalytic : Ideal.map π A = B₀ * B₁ * B₂ * B₃) :
    J₀ * J₁ * J₂ * J₃ ≤ B₀ * B₁ * B₂ * B₃ := by
  sorry

/-- Algebraic reduction only: in an integral unipotent basis, squaring doubles the off-diagonal.
The Galois group, determinant, twist character and existence of this basis are omitted here. -/
theorem rankOneImageQuadraticTwist (u : R) (hu : IsUnit u) (h2 : IsUnit (2 : R)) :
    (!![(1 : R), u; 0, 1] : Matrix (Fin 2) (Fin 2) R) ^ 2 - 1 =
      !![(0 : R), 2 * u; 0, 0] ∧ IsUnit (2 * u) := by
  sorry

/-- The actual cokernel reduction used after the integral-basis step. No p-power index is
removed: the parameter must be a unit in R itself. The map sends (x,y) to (u*y,0). -/
example (u : Rˣ) :
    ∃ n : (R × R) →ₗ[R] (R × R),
      (∀ v, n v = ((u : R) * v.2, 0)) ∧
      Nonempty (((R × R) ⧸ LinearMap.range n) ≃ₗ[R] R) := by
  sorry

open scoped BigOperators

/-- Algebraic reduction with all four individual bounds, the reverse product bound and
nonzero characteristic generators. The arithmetic hypotheses reside in the packet. -/
theorem factorSeparation [IsDomain R]
    (L j : Fin 4 → R) (hj : ∀ i, j i ≠ 0)
    (hupper : ∀ i, j i ∣ L i)
    (hlower : (∏ i, L i) ∣ (∏ i, j i)) :
    ∀ i, Ideal.span ({L i} : Set R) = Ideal.span ({j i} : Set R) := by
  sorry

-- Nonzero generators and upper bounds cannot be dropped from the reduction.
example : (2 : ℤ) * 3 = 1 * 6 ∧
    Ideal.span ({(2 : ℤ)} : Set ℤ) ≠ Ideal.span ({(1 : ℤ)} : Set ℤ) := by
  sorry
end IntegralAlgebra

section ExistingTwistInterface
variable {K L M : Type*} [Field K] [Field L] [Field M]
variable [Algebra K L] [Algebra.IsQuadraticExtension K L] [Algebra.IsSeparable K L]
variable [Algebra K M] [Algebra L M] [IsScalarTower K L M] [DecidableEq M]
variable (E : WeierstrassCurve K) [E.IsElliptic]

/-- fourTwistLatticeDictionary starts with this existing point-group character equivariance.
Restriction to E[p^n], compatible transition maps, continuous inverse limits and ordinary
sublattices still require the supplier APIs stated in the packet. This example is the baseline
statement, not a newly planned twist or a claim that those further comparisons are built. -/
example (σ : M ≃ₐ[K] M) (P : ((E.quadraticTwist L).baseChange M).toAffine.Point) :
    E.quadraticTwistPointEquiv L M (WeierstrassCurve.Affine.Point.map σ.toAlgHom P) =
      (Algebra.IsQuadraticExtension.quadraticCharacter K L (σ.restrictNormal L) : ℤ) •
        WeierstrassCurve.Affine.Point.map σ.toAlgHom (E.quadraticTwistPointEquiv L M P) := by
  sorry
end ExistingTwistInterface

end AutomorphicCongruencesL5b

/-!
## Arithmetic signatures awaiting supplier carriers

The following are the exact mathematical declarations named by the packet. A named
algebraic reduction above does not replace its arithmetic declaration. These signature
gaps need the requested carrier APIs, not opaque type aliases or assumed conclusions.

### fujiwaraInstance
AutomorphicCongruences:L5w/fujiwara-instance

For the specified nearly ordinary weight-two residual Hilbert representation and its minimal
deformation type D, identify Wan’s localized Hecke algebra with the R=T algebra supplied by
R21.4. Verify every condition of Fujiwara 11.1, then use 11.2 and 11.5 for freeness of the
precise quaternionic/Hilbert module and the Hida-family comparison. The minimal algebra is a
relative complete intersection; the appropriate finite flat Hecke algebra is Gorenstein. This is
an application of the supplier theorem, not a new proof of totally real R=T.

Additional hypotheses:
- p>3; F totally real, p unramified in F; residual representation absolutely irreducible on
  G_{F(ζ_p)}.
- For p=5 exclude the simultaneous PGL2(F5) projective-image and mod-p-cyclotomic factorization
  through its abelianization of order two.
- The local nearly ordinary types are distinguished; flat types satisfy Fujiwara’s unramified
  base-field restriction; a minimal modular lift exists as in Definition 6.11.
- Verify Hypothesis 6.7 via Theorem 6.8 in the ordinary/weight-two instance; retain Hypothesis
  5.9 in exactly the nonminimal cases where 11.1 requires it. Odd [F:Q] requires the Shimura-
  curve Ihara input in Wan 8.
- Exclude the actual exceptional 0E case using the induced-representation description: the local
  representation is absolutely irreducible, its inertia restriction is absolutely reducible, and
  q_v≡−1 mod p. BCS H3 excludes this case. Additionally verify Wan 8’s literally printed
  irreducible-inertia q_v test. SourceIssues E1/E5 explain the wording discrepancy; the literal
  test alone is not used as an exclusion of the actual induced type.
Sources: Fujiwara Definition 6.11, pp.54–55; Theorems 11.1–11.2, p.95; Corollary 11.5, p.97; Wan Theorem 8, pp.6–7; BCS Hypothesis 3.1.1 and Remark 3.1.2, pp.7–8.

### canonicalPeriodDuality
AutomorphicCongruences:L5w/canonical-period-duality

In the specified ordinary Hilbert Hecke algebra T over the normal Hida coefficient ring I, let
e_f be the rational idempotent of the f-component. Identify T∩I_frac e_f with the rank-one
integral congruence line generated by ℓ_f=η_f e_f, using the supplied Gorenstein duality and
free Hecke module. Wan’s canonical period divides the specified Petersson pairing by η_f with
the archimedean factors of Definition 79. Replacing ℓ_f by uℓ_f, u∈I×, changes the normalized
p-adic L-function and Eisenstein family by the matching unit; their ideals are unchanged.

Additional hypotheses:
- The Hecke algebra and module are those in the preceding Fujiwara instance, not an arbitrary
  finite flat algebra.
- The f-component is generically isolated; the congruence number is nonzero at the chosen
  arithmetic point; the actual integral lattice and pairing are fixed.
Sources: Wan §7.2.1, Definition 79, Remark 80, pp.65–66; Theorem 82, pp.66–68.

### quaternionicPeriodPrimitivity
AutomorphicCongruences:L5w/quaternionic-period-primitivity

For the Jacquet–Langlands transfer of the parallel even-weight member of the Hilbert family,
compare the quaternionic self-pairing congruence period with Wan’s canonical period up to an
integral unit. Under squarefree n− of parity [F:Q] and residual ramification at every n− factor,
the transfer has the same localized Hecke algebra and rank-one module needed for this
comparison. Import Hung/Hsieh nonvanishing with that period: NV1 is nonzero, and under the
Fujiwara instance NV2 is primitive modulo the uniformizer. Nonsplit imprimitive Euler factors
are kept and may contribute positive μ.

Additional hypotheses:
- p≥5 unramified in F; M/F CM with p split; residual irreducibility and ordinary distinctness.
- n− squarefree with #prime factors ≡[F:Q] mod 2; residual ramification at each factor; the
  branch character used in Wan 86 is trivial.
Sources: Wan Definition 85 and Theorem 86, pp.69–70; Lemma 87, pp.70–71.

### wanKlingenInterpolation
AutomorphicCongruences:L5w/klingen-interpolation

In the imported ordinary GU(2,2)/F module of p-adic forms, take the Klingen family ℰ_D supplied
by APL L4 from the actual local sections and pullback, and prove its normalized coefficient and
boundary identities. At every cusp x its coefficients c_D(β,x) lie in Λ_D and specialize at each
generic arithmetic point φ to the classical Klingen coefficient normalized by Ω_{f_φ,can}.
Indices β are positive semidefinite Hermitian rank-two matrices; the degenerate indices det β=0
are included. Every degenerate coefficient (det β=0) belongs to (L_f,M,ξ^Σ L_ξ′^Σ). This is the
boundary divisibility needed for a cuspidal congruence.

Additional hypotheses:
- D=(A,I,f,ψ,ξ,Σ) is Wan’s p-adic Eisenstein datum; Σ contains p and every bad prime; local
  sections are generic at the interpolation points.
- Residual irreducibility, ordinary distinctness and the Gorenstein instance hold; the auxiliary
  finite ψ has the specified central restriction and is unramified outside Σ.
Sources: Wan §§6–7; Theorem 82, pp.66–68; Theorem 88, p.71; Theorem 27, p.23.

### wanFourierCoprimality
AutomorphicCongruences:L5w/fourier-coefficient-coprimality

For ℰ_D, the ideal generated by the selected nondegenerate Fourier–Jacobi/theta pairings is
contained in no height-one prime of Λ_D except possibly a prime pulled back from R+=I[[Γ_M+]].
At each remaining height-one prime dividing L_f,M,ξ^Σ there is an actual nonconstant coefficient
which is a unit after localization. This supplies the coefficient which survives the cuspidal
congruence; nonzero interpolation alone is insufficient.

Additional hypotheses:
- Wan’s irreducibility/distinctness and Gorenstein conditions, auxiliary theta/CM characters and
  their prescribed local conductors are satisfied.
- The CM character is chosen with its period-normalized algebraic value a p-adic unit, with
  local Euler factors units and CM residual irreducibility/distinctness; all factors are tested
  on the chosen lattice.
Sources: Wan Proposition 95, pp.78–79; Proposition 96 and proof, pp.79–81.

### wanHeightOneCongruence
AutomorphicCongruences:L5w/height-one-congruence

At a height-one prime P of Λ_D not pulled back from R+, with a nonconstant Fourier coefficient
of ℰ_D outside P, construct a cusp family congruent to ℰ_D modulo the Rankin factor L^Σ. The
induced map h_D/I_D→Λ_D,P/(L^Σ) is onto; the coefficient structure map is onto and its kernel
𝔈_D has ord_P(𝔈_D)≥ord_P(L^Σ). In the rational projector variant retain b e_f integral, b(φ0)≠0,
P⊂φ0, and the coefficient nonvanishing condition on b times the rational family.

Additional hypotheses:
- The integral family and coprimality theorem, ordinary boundary exact sequence and
  lifting/control theorem hold for all cusps.
- P is height one; the local ring is a DVR; the Rankin factor is nonzero. The unwanted abelian
  factor is removed only with the actual unit/localization argument of Wan.
Sources: Wan Theorem 27, p.23; §9.1 and Theorem 97, pp.81–84.

### wanGaloisSelmerInstance
AutomorphicCongruences:L5w/galois-selmer-instance

Apply IHG’s integral determinant/reconstruction and Ribet extension theorem to the actual
cuspidal rank-four Galois representation congruent to χ′⊕ρ⊕χ. Verify all ten hypotheses of Wan
§9.2.1 on the completed height-one Hecke algebra. The resulting extension classes belong to the
Σ-imprimitive ordinary Selmer group for the same rank-two lattice and twist as the Rankin
function. For P0⊂I[[Γ_M]] height one not pulled back from R+=I[[Γ_M+]], require that P=P0Λ_D is
the corresponding height-one prime. If the plus/minus local constituents are residually disjoint
modulo P, obtain ord_P0(char X^Σ)≥ord_P(𝔈_D).

Additional hypotheses:
- Λ_D is a Krull domain; h_D is finite, local and reduced; completions at corresponding primes
  retain I_D∩Λ_D=E_D and the quotient identification.
- The three residual constituents are disjoint, the rank-two one absolutely irreducible, and the
  polarization and local ordinary characteristic polynomials have Wan’s twists.
- The cuspidal characteristic-zero constituents are absolutely irreducible or satisfy the
  precise rank-two alternative in condition (10); CAP exclusion and ordinary modularity lifting
  prove this alternative.
- The scalar-character Selmer characteristic ideal has valuation zero at P by the totally real
  character main conjecture; the plus/minus local pieces have no common irreducible constituent
  modulo P.
- For primes containing 𝔈_D, set A0=Λ_D, A=completion of (A0)_P (a DVR), R0=(h_D)_m, and
  R=completion at the inverse image Q of P in R0. A0 is a profinite Z_p Krull domain; R0 is
  finite local reduced over A0. The ideals I0=I_D and J0=𝔈_D satisfy I0∩A0=J0, A0/J0≅R0/I0, and
  their extended ideals recover I0 and J0 by contraction. At a prime not containing 𝔈_D the
  congruence valuation is zero and the inequality is immediate.
- Wan setup (1)–(3): use H=G_F,Σ, G=G_M,Σ and its conjugation c. The continuous polarization
  character ν extends to H; χ is a continuous character of G and χ′=νχ^(−c) has different
  residual character. The rank-two ρ is defined on a free A0-lattice, satisfies ρ^c≅ρ^∨⊗ν, and
  its residual representation is absolutely irreducible and disjoint from both residual
  characters. Residual disjointness is witnessed by coprime characteristic polynomials of some
  group-algebra element, as in the supplier theorem.
- Wan setup (4)–(6): the rank-four σ is defined over the image of R0 in R, with integral traces
  and a finitely generated R-orbit module for every vector. It satisfies the same polarization;
  the proper congruence ideal I has nonzero J=A∩I and A/J≅R/I, and tr σ≡χ′+tr ρ+χ modulo I. The
  irreducible ρ has a compatible polarization pairing Φ with Φ^t=−ν(c)Φ.
- Wan setup (7)–(9): at every v|p the plus and minus rank-two lattice pieces are free over A0,
  and the plus and minus rank-four pieces are free over R⊗_A Frac(A). For every element x of the
  local group algebra, the plus characteristic polynomial of σ agrees modulo I with
  Ch(ρ^+,x,T)(1−χ(x)T); the minus relation uses χ′. The two combined local pieces have no common
  residual irreducible constituent.
- Wan setup (10): for each characteristic-zero specialization of R⊗_A Frac(A), σ is absolutely
  irreducible or has the specified absolutely irreducible rank-two subrepresentation whose trace
  is congruent to χ+χ′. The ordinary lifting and CAP exclusion supplier proves this alternative;
  it is not assumed for an arbitrary trace.
- Match the exact twist dictionary of Wan §9.2.2, p.87: ρ=ρ_f⊗σ_ξ^(−c)σ_ψ^c ε^(−2), χ=σ_ψ^c
  ε^(−3), and χ′=νχ^(−c), using ε for the p-adic cyclotomic character. The final Selmer lattice
  is (T_f⊗I[[Γ_M]])(ε_M^(−c))⊗ε and its ordinary line, with the actual coefficient map and
  primitive/Σ conventions. All height-one extension and coefficient normalization comparisons
  are verified before identifying the valuations.
Sources: Wan §9.2.1, Proposition 98, pp.84–86; §9.2.2, Theorem 100, pp.87–88.

### wanExceptionalPrimes
AutomorphicCongruences:L5w/exceptional-height-one-primes

For a height-one P pulled back from I[[Γ_M+]], bound ord_P(L^Σ) by the sum of valuations of the
nonsplit removed Euler factors, using primitive NV2 and the period comparison. If X^Σ is
torsion, Poitou–Tate and the vanishing of the compact global term give the exact
primitive/imprimitive characteristic-ideal comparison with those local factors. Hence ord_P(char
X^Σ)≥ord_P(L^Σ). If X^Σ is not torsion, record only the zero extended-ideal containment. No
uniform imprimitive μ=0 assertion is made.

Additional hypotheses:
- The ordinary primitive and imprimitive local conditions use the same lattice; Σ includes bad
  primes and p.
- NV2 holds for the primitive function; local H¹ finite-part modules have the indicated Euler
  characteristic ideals; the necessary compact global term vanishes after checking torsion and
  torsion-freeness.
Sources: Wan Lemma 87, p.71; proof of Theorem 101, p.89.

### wanFamilyDivisibility
AutomorphicCongruences:L5w/wan-family-divisibility

Let F be totally real of degree d, p≥5 unramified in F, M/F CM with p split, and I a local
normal finite integral extension of the parallel Hida weight algebra. Let f be a nearly ordinary
I-adic eigenform of trivial character with an ordinary specialization of even parallel weight
κ0≥2. Under residual irreducibility over M, distinctness, the full Wan 8/Fujiwara instance, Δ+
(M not in the narrow Hilbert class field of F and F/Q-ramified primes split in M), squarefree n−
with parity d, and residual ramification at all n−, prove char^Σ(X_f,M)⊂(L_f,M^Σ). For Σ
including all bad primes, the normalized function is integral. For arbitrary Σ the result is a
fractional-ideal statement with the Euler factors restored. Here char^Σ means the usual
characteristic ideal when the finite dual is torsion; in the non-torsion case Wan’s assertion
uses zero.

Additional hypotheses:
- All conditions in the statement, including the integral Gorenstein period normalization and
  the same lattice in the analytic and Galois comparisons.
- No general main conjecture for an arbitrary unitary-group representation or arbitrary weight
  Hida family is inferred.
Sources: Wan Theorems 3 and 101, pp.3–4 and 88–89.

### wanArithmeticSpecialization
AutomorphicCongruences:L5w/arithmetic-specialization

At the ordinary weight-two point φ:I→O giving g_F, extend φ to Λ_D→Λ_M and compare the
specialized Rankin function with the fixed-form normalized one. On the Selmer side construct the
actual coefficient-control map and show the image of the big characteristic ideal contains the
characteristic ideal of the specialized dual, with the derived Tor/local corrections either zero
in this instance or retained explicitly. Establish the source-specialization containment for g_F
on its original integral lattice. The normalized Eisenstein coefficient kernel has only a
general base-change inclusion until its kernel compatibility is proved.

Additional hypotheses:
- φ is the point of the same parallel family; the integral period/projector matches the fixed-
  form normalization.
- Finite Selmer duals and compatible ordinary/away-p local conditions; residual no-invariants
  and local ordinary quotient hypotheses needed for control. A height-one generator must have
  nonzero specialization before cancellation.
Sources: BCS Proof of Theorem 3.2.1, p.8 (arXiv v2 p.7); SUauthor Proposition 3.2.8, Corollary 3.2.9, pp.23–24.

### quarticCMDivisibility
AutomorphicCongruences:L5w/quartic-cm-divisibility

For a weight-two elliptic newform g of level N and good ordinary p>3, let F be real quadratic
with gcd(pN,D_F)=1, and M/F CM quadratic, p split, gcd(NO_F,D_M/F)=1. Require residual
irreducibility over M, the exact H1/minimal-lift conditions, both local inertia checks of the
Fujiwara instance, and Δ+. If n− is squarefree with an even number of inert prime factors and
the residual representation is ramified at each factor, prove (L_p(g_F/M))⊇char(X_ord(g/M∞)) in
O[[Γ_M]], in the torsion case. State separately the source’s zero-ideal containment when the
dual is not torsion; torsion must come from the explicit Selmer/Kato supplier. This is the
source-qualified integral engine exported to L5a.

Additional hypotheses:
- All field, local and residual hypotheses in the statement; p>3 entails p≥5.
- The integral ordinary local conditions away p are BCS §2’s locally trivial ones; compare Wan’s
  inertia/Σ conventions through actual local Euler modules before changing primitive status.
- The fixed-form analytic object is the normalized specialization of the family object;
  sourceIssues E1/E5 record the incompatible inertia wording in Fujiwara/Wan, and E2 explains
  why ordinary Δ alone is not used to discharge the narrow condition.
Sources: BCS Theorem 3.2.1, pp.7–8; §2, pp.5–7; Wan Theorems 8, 82 and 101, pp.6–7, 66–68, 88–89.

### selectedBaseChangeHypotheses
AutomorphicCongruences:L5w/selected-base-change-hypotheses

For K,F selected by L5a’s BCS Lemma 5.2.3 contract, prove the quartic engine’s conditions. K has
odd discriminant not −3, all primes N split, and p splits; F has odd discriminant coprime pN, p
inert, D_F-primes split in K, and an N-prime ℓ is inert in F exactly when ℓ≡−1 mod p. Residual
irreducibility holds over M=FK and G_{F(ζ_p)} (absolute irreducibility is verified for the
elliptic application), with the p=5 exceptional case excluded. Then p splits in M/F,
discriminants are coprime to N, n−=1, both local q_v tests hold, and a minimal modular lift
base-changes to a minimal lift over F. Ensure K has a new ramified prime outside D_F, so M/F is
ramified at a finite place and cannot lie in the narrow Hilbert class field.

Additional hypotheses:
- The complete selected-field conditions, rather than arbitrary quadratic fields, and the exact
  minimal modular lift over Q supplied by R04.6/R21.4.
- The p=5 auxiliary exclusion F≠Q(ζ5)+ is available; for elliptic representations the projective
  exception is also excluded by Fujiwara 9.8.
Sources: BCS Proposition 5.2.1 and Lemma 5.2.3, pp.11–12 (v2 pp.9–10); Wan Proof of Theorem 103, pp.91–92; Fujiwara Definition 6.11, pp.54–55; Proposition 9.8, p.83.

### fourTwistLatticeDictionary
AutomorphicCongruences:L5b/four-twist-lattice-dictionary

For E/Q, distinct quadratic fields K imaginary and F real, and p>3 unramified in K and F,
identify T_p(E^χ) with T_p(E)⊗χ integrally for χ∈{1,η_K,η_F,η_Kη_F}. Use the existing quadratic-
twist point isomorphism and its character-equivariance, restrict to all p-power torsion and take
the compatible inverse limit. Every twist has good ordinary reduction at p; its ordinary line is
the transported line twisted by χ. The cyclotomic Iwasawa coefficient ring and reciprocal
tautological action are the same for all four twists.

Additional hypotheses:
- E has good ordinary reduction at p; the quadratic discriminants are prime to p; all extensions
  and the algebraic closure embeddings are fixed.
- The inverse-limit transition maps and ordinary filtration are the actual Tate-module ones; no
  rational isogeny is substituted for an integral lattice equivalence.
Sources: BCS Proof of Theorem 1.1.2, p.12; Lemma 5.1.1, p.10; SUauthor §3.1.1–3.1.5, pp.16–19.

### quadraticSelmerDecomposition
AutomorphicCongruences:L5b/quadratic-selmer-decomposition

For any finite extension of the cyclotomic tower in the chosen setting, restriction and the
idempotents (1±c)/2 give Sel_ord(E/KQ∞)≅Sel_ord(E/Q∞)⊕Sel_ord(E^K/Q∞), on the same integral
p-primary lattices and ordinary local conditions. The Pontryagin dual decomposition is Λ-linear.
Apply it also to E^F and, when needed for the early torsion check, to the biquadratic compositum
to obtain all four summands. For torsion duals, characteristic ideals multiply exactly. At
away-p places retain the localization-image and primitive/imprimitive errors until the matching
local-condition comparison proves them absent.

Additional hypotheses:
- p odd makes 2 a unit; coefficient ring O is the fixed p-adic integer ring.
- The ordinary sublattice is stable under the larger decomposition group and transports to both
  primes of K over p; the same Σ is pulled back from Q.
- The local condition is specified: BCS uses the locally trivial away-p condition; the inertia-
  kernel convention in SU requires a proved comparison or explicit Euler corrections.
Sources: SUauthor Lemma 3.1.5, p.19; Lemma 3.2.5, p.22; BCS Proof of Theorem 1.1.2, p.12.

### cyclotomicControl
AutomorphicCongruences:L5b/cyclotomic-control

For each of E and E^F over K, construct the map X_ord(K∞)/I−X_ord(K∞)→X_ord(KQ∞), where
π+:Λ_K→Λ_Q and I−=ker π+. Under the actual no-invariants, ordinary inertia-quotient and
primitive local-control hypotheses, prove the required isomorphism; otherwise retain the
finite/pseudo-null correction with its divisor. In the exact case, π+(char_ΛK X)⊇char_ΛQ(X/I−X).
This is a divisibility, not a general equality of specialized characteristic ideals. Use Kato’s
cyclotomic torsion for the two twists and Nakayama with the finite dual to establish the torsion
needed for the nonzero two-variable characteristic ideal.

Additional hypotheses:
- Λ_K≅O[[T+,T−]], Λ_Q≅O[[T+]] are normal domains with the actual continuous quotient map.
- The source control condition excludes a trivial subquotient of T* over the tower; its
  p-inertia quotient action factors through the cyclotomic group. Σ∪{p} contains every ramified
  prime for the imprimitive comparison.
- Every removed Euler factor is compared on both sides before passing back to primitive Selmer
  groups; specialization of the analytic/characteristic generator is nonzero.
Sources: SUauthor Proposition 3.2.8, Corollary 3.2.9(ii), Proposition 3.2.11, pp.23–24; BCS §5.1 and proof of Theorem 1.1.2, pp.10–12.

### cyclotomicAnalyticFactorization
AutomorphicCongruences:L5b/cyclotomic-analytic-factorization

For E/Q and imaginary quadratic K with odd discriminant, p split and all N-primes split, project
the Perrin–Riou Rankin function to the cyclotomic line. With CGS’s normalization by
deg(π_E)/c_E² and H_p(E), prove (π+L_PR(E/K))=(L_MSD(E/Q)L_MSD(E^K/Q)) in the integral
cyclotomic coefficient ring when the analytic objects are integral, and in its p-inversion for
the rational normalization. The relation is up to a Λ_Q-unit, represented by the discriminant
character factor and the real-component factor, with p odd. Prove the analogous identity for E^F
using its own Néron periods and primitive Euler factors.

Additional hypotheses:
- The modular parametrization π_E, Manin constant c_E, ordinary unit root α_p and Néron
  differentials of E and E^K are the actual objects used by CGS.
- Use a common coefficient extension containing character values, then descend by the supplier’s
  faithful coefficient comparison. All four primitive functions are nonzero.
- At E^F its level may acquire D_F²; those primes split in K, so its required Heegner and period
  comparison conditions still hold.
Sources: CGS Definition 1.2.2, Remark 1.2.3, Proposition 1.2.4 and proof, pp.7–8; BCS Proof of Theorem 1.1.2, p.12.

### fourFactorProductBound
AutomorphicCongruences:L5b/four-factor-product-bound

For the auxiliary K,F supplied by L5a’s Lemma 5.2.3 contract, project its early integral
ordinary product bound (L_PR(E/K)L_PR(E^F/K))⊇char(X_E/K∞)char(X_EF/K∞) to Λ_Q. The analytic
factorization, Selmer decompositions and correctly oriented characteristic-control comparisons
give ∏_{χ∈{1,η_K,η_F,η_Kη_F}}(L_MSD(E^χ/Q))⊇∏_χ char(X_Eχ/Q∞). The same assertion holds after
p-inversion. This is the only reverse input used for factor separation; it is not an individual
reverse inequality.

Additional hypotheses:
- All of L5a’s selected-field, minimality, μ and integral product-bound conditions are proved in
  that supplier; the Fourier/period/Euler normalization is matched here.
- The four cyclotomic duals are finite torsion and the four functions nonzero; the control and
  analytic comparison targets apply to E and E^F.
Sources: BCS Proposition 5.2.1, pp.11–12; proof of Theorem 1.1.2, p.12.

### rankOneImageQuadraticTwist
AutomorphicCongruences:L5b/rank-one-image-twist

Let T=T_p(E), p odd, and σ∈G_Q(μ_p∞) satisfy T/(σ−1)T≅Z_p as Z_p-modules. Then every quadratic
twist T⊗χ satisfies the same condition for some element of G_Q(μ_p∞). If χ(σ)=1 use σ. If
χ(σ)=−1 use σ²: det ρ(σ)=1, the free rank-one cokernel forces ρ(σ) to be a nontrivial unipotent
with unit off-diagonal in a suitable integral basis, and σ²−1 doubles that unit. The factor 2 is
a unit. Hence one exact (im) hypothesis on E suffices for all four twists; residual surjectivity
is only a stronger sufficient condition.

Additional hypotheses:
- The determinant is the cyclotomic character, so it equals 1 on the chosen group.
- T is free rank two over Z_p; the cokernel is free of rank one, rather than merely having rank
  one after tensoring with Q_p.
- χ takes values ±1 and p>2.
Sources: BCS Theorem 1.1.2(b), p.2; proof, p.12; Kato Theorem 17.4, p.273.

### fourTwistKatoBound
AutomorphicCongruences:L5b/four-twist-kato-bound

For each E^χ in the selected set of four twists, apply the ordinary cyclotomic torsion and
Euler-system bound on T_p(E^χ), with the MSD/Néron period normalization:
(L_MSD(E^χ/Q))⊂char(X_Eχ/Q∞) after inverting p. Under (im) on E, use its twist stability and the
exact strengthened Kato elliptic contract to obtain all four inclusions integrally. The general
non-CM modular-form 17.4(3) hypotheses and the elliptic (im) refinement are distinguished. If
the endpoint includes CM curves, import their separately proved rational elliptic-unit bound;
never apply a non-CM theorem to them.

Additional hypotheses:
- p>3 good ordinary, residual E[p] irreducible; the four quadratic characters are unramified at
  p, so each twist is good ordinary and residual irreducible.
- Nonzero primitive analytic functions, compatible dual-form lattices and good period
  generators.
- Integral version: exact (im) on the original Tate lattice, not an assertion that every
  irreducible residual representation is surjective.
Sources: Kato Theorem 17.4 and §17.5, pp.273–274; Theorem 12.5, pp.211–212; BCS Theorem 1.1.2 and its proof, pp.2,12.

### factorSeparation
AutomorphicCongruences:L5b/factor-separation

Over A=O[[Γ_Q]] or A[1/p], a noetherian normal UFD, let all X_χ be finite torsion,
J_χ=char_A(X_χ) nonzero principal, and L_χ nonzero. Suppose (L_χ)⊂J_χ separately for each χ and
∏J_χ⊂(∏L_χ). Then J_χ=(L_χ) for every χ. At each height-one prime, each ord(L_χ)−ord(J_χ) is
nonnegative and their sum is nonpositive; hence each is zero. Equivalently choose generators
j_χ, write L_χ=j_χa_χ and conclude ∏a_χ is a unit, so each a_χ is a unit. This argument needs
every individual upper inequality; the product bound alone cannot separate factors.

Additional hypotheses:
- All four factors lie in the same domain and use the same integral/rational coefficient
  extension and primitive normalizations.
- Torsion and nonvanishing have already been proved; principal characteristic ideals are
  supplied by the Iwasawa algebra owner.
- The integral claim uses integral inequalities at the prime (p) too; rational equality has no
  information there.
Sources: BCS Proof of Theorem 1.1.2, p.12.

### rationalCyclotomicEndpoint
AutomorphicCongruences:L5b/rational-cyclotomic-endpoint

For E/Q and good ordinary p>3 with E[p] irreducible as a G_Q-module, X_ord(E/Q∞) is finite Λ_Q-
torsion and char_ΛQ(X)Λ_Q[1/p]=(L_p(E/Q))Λ_Q[1/p]. Here L_p is the MSD function with the actual
Néron periods, and X is the Pontryagin dual of the classical p-primary Selmer group. Apply the
auxiliary-field existence supplied by L5a, the four-factor product bound and Kato’s rational
individual inequalities, then select the trivial character factor. No residual surjectivity or
multiplicative-reduction prime is added.

Additional hypotheses:
- Precisely p>3 good ordinary and residual irreducibility, plus the verified supplier
  conclusions used to construct the auxiliary fields and compare classical/ordinary Selmer
  conventions.
- CM and non-CM curves use the correct separately owned upper-bound route.
Sources: BCS Theorem 1.1.2(a), p.2; proof, p.12.

### integralCyclotomicEndpoint
AutomorphicCongruences:L5b/integral-cyclotomic-endpoint

Under the rational endpoint hypotheses and (im): there exists σ∈G_Q(μ_p∞) with
T_p(E)/(σ−1)T_p(E)≅Z_p as Z_p-modules, prove char_ΛQ(X_ord(E/Q∞))=(L_p(E/Q)) in Λ_Q itself.
Apply the twist-stable (im) hypothesis and the integral Kato inequalities to all four factors,
then separate them using the integral early product bound. Every p-power lattice, Euler and
period discrepancy has been accounted for before equality. Residual surjectivity is not
substituted for (im); its use is only as a sufficient implication if separately proved.

Additional hypotheses:
- Exactly the preceding rational endpoint hypotheses and the free rank-one quotient condition on
  the integral Tate lattice.
- The early product bound, analytic factorization and all four Kato bounds are integral on the
  same lattice and Néron-normalized functions.
Sources: BCS Theorem 1.1.2(b), p.2; proof, p.12.

-/
