# Automorphic congruences: Hilbert input and cyclotomic descent

This part plans `AutomorphicCongruences:L5w` and `AutomorphicCongruences:L5b`.
Its two outputs are an integral, hypothesis-bearing quartic-CM reverse divisibility
and the rational cyclotomic equality for an ordinary elliptic curve over ℚ,
with a separate integral refinement under the exact rank-one image condition.
The plan includes the comparisons that connect these outputs. All targets are
planned; the supplier refinements described below remain mathematical obligations.
Nothing in this document asserts that a target has been formalized.

The starting elliptic hypotheses are good ordinary reduction at a prime p>3
and irreducibility of E[p] over ℚ. The rational endpoint adds no residual
surjectivity condition and no auxiliary multiplicative-reduction prime.
For the integral endpoint, the additional condition is the existence of
σ∈G_{ℚ(μ_{p∞})} such that T_p(E)/(σ−1)T_p(E) is free of rank one over ℤ_p.
A rational rank-one quotient with finite p-torsion does not meet this condition.

## Objects and conventions

Write O for the fixed p-adic integer coefficient ring. For a real quadratic
F and an imaginary quadratic K, write M=FK and use η_F, η_K and η_Fη_K for
the three quadratic characters. The four elliptic curves are E, E^K, E^F
and E^{FK}; the last superscript denotes the character η_Fη_K, not a
base-change field. The Hilbert modular form g_F is a different object,
the automorphic base change of the weight-two form associated with E.
The existing Multiquadratic and InductionRestriction roadmaps provide the
field and character machinery.

For a CM quadratic extension M/F with [F:ℚ]=d, Γ_M denotes the compositum
of its cyclotomic and anticyclotomic towers, of rank d+1. For the selected
biquadratic M it has rank three. Γ_K has rank two and Γ_ℚ has rank one.
Use Λ_M=O[[Γ_M]], Λ_K=O[[Γ_K]] and Λ_ℚ=O[[Γ_ℚ]], with the actual continuous
quotient maps. The family ring I is a local normal finite integral extension
of the parallel Hilbert weight ring; Wan's Eisenstein datum D gives Λ_D
and its ordinary cuspidal Hecke image h_D. The extra character directions
in Λ_D are matched with the source's I[[Γ_M]] before making arithmetic
comparisons. A formal identification of abstract power-series rings alone
does not identify the Galois actions or the arithmetic points.

For a Galois-stable lattice T_g, the discrete Iwasawa coefficient module is
T_g⊗Λ_M^∨, with the reciprocal tautological action on the dual factor.
At a prime w|p use Fil⁺_w(T_g)⊗Λ_M^∨. The BCS ordinary Selmer group is the
kernel of the global localization map whose away-p components are the full
H¹(M_w,–), and whose p-components are H¹(I_w,–/Fil⁺_w). Its Pontryagin dual
is X_ord. These locally trivial away-p conditions must be compared with
the inertia conditions in the control literature. The imprimitive version
removes specified away-p components; its difference from the primitive
version is expressed by actual local modules and Euler factors.

For a finite torsion module X over a normal Iwasawa domain, char(X) is its
height-one length ideal. The domain and characteristic-ideal theory are
imports from `PadicMeasuresIwasawaAlgebras:L4`. Wan also assigns ideal zero
to a non-torsion dual when stating a one-sided bound. That convention does
not prove torsion and cannot be used in factor cancellation. Genuine
torsion and nonzero analytic functions are separate prerequisites.

Let L_PR(E/K) denote the Perrin–Riou function with CGS's modular-degree,
Manin-constant and Néron-period normalization. Let L_MSD(E/ℚ) denote the
ordinary MSD function with its actual Néron periods and unit root. The
Wan Hilbert family function is normalized by its canonical congruence
period and integral projector. These functions are related by specified
comparison theorems; their period names do not identify their lattices.
Every removed Euler factor remains visible until a primitive comparison
proves the required relation. Integral statements include the height-one
prime (p); statements in Λ[1/p] do not.

## Ownership and order

The mathematical order is

`L5w → L5a → {L5b, HeegnerPointEulerSystems:HE.8b}`,

with independent `KatoEulerSystems:L4 → L5b`, followed by
`L5b → ModularIwasawaMainConjectures:L3`. The general Wan engine and its
conditional selected-field check precede the auxiliary-field theorem in
L5a that instantiates them. There is no dependency on the completed
anticyclotomic endpoint in the cyclotomic descent.

Generic minimal totally real R=T and freeness are supplied by
`OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; existence and
base-change minimality are supplied by `GlobalGaloisDeformations:R04.6`.
L5w checks the exact Wan–Fujiwara instance and its local types.
The existing nice-prime Skinner–Wiles targets in R21.4 do not already state
Fujiwara's exact minimal theorem. The requested extension has to include
Fujiwara Definition 6.11, Theorems 11.1–11.2 and Corollary 11.5.
No non-ordinary minimal case is used in this selected application.

Hilbert Hida theory and family control belong to `PadicFamilies:L5`.
The Hilbert Rankin carrier, local sections, doubling/pullback and ordinary
GU(2,2) form module belong to `AutomorphicPadicLFunctions:L4` and its
specified ordinary/boundary suppliers. The toric period and primitivity
inputs belong to `AutomorphicPadicLFunctions:L3h`. The current upstream
`IntegralHeckeAndGaloisDeterminants` roadmap supplies integral Hecke
images, determinant interpolation and Ribet/Fitting algebra through
IHG.2, IHG.4 and IHG.6. Those theories are imported, rather than rebuilt.
This part specializes their interfaces to Wan's actual eigenpacket and
polarized 1+2+1 representation.

L5a owns the *early* integral product bound (BCS Proposition 5.2.1),
auxiliary-field existence (Lemma 5.2.3), and the quartic-to-K comparisons
(Lemmas 5.1.1–5.1.2). Its μ argument is independent of HE.8b.
L5b owns the further cyclotomic projection, four quadratic factors and
factor separation. The added Nakamura source belongs to L3/L4 and supplies
no new target in this part.

## L5w — Hilbert/quartic-CM Wan–Fujiwara input

The five planets are Hilbert Klingen family, Eisenstein congruence ideal, Eisenstein congruence bound, Wan’s Hilbert divisibility, Quartic-CM divisibility. The intermediate comparisons retain the period, coefficient and primitive-local information needed for the integral export.

### 1. Fujiwara’s minimal theorem in the Wan instance

Named declaration: `fujiwaraInstance` (`AutomorphicCongruences:L5w/fujiwara-instance`).

For the specified nearly ordinary weight-two residual Hilbert representation and its minimal deformation type D, identify Wan’s localized Hecke algebra with the R=T algebra supplied by R21.4. Verify every condition of Fujiwara 11.1, then use 11.2 and 11.5 for freeness of the precise quaternionic/Hilbert module and the Hida-family comparison. The minimal algebra is a relative complete intersection; the appropriate finite flat Hecke algebra is Gorenstein. This is an application of the supplier theorem, not a new proof of totally real R=T.

Hypotheses:

- p>3; F totally real, p unramified in F; residual representation absolutely irreducible on G_{F(ζ_p)}.
- For p=5 exclude the simultaneous PGL2(F5) projective-image and mod-p-cyclotomic factorization through its abelianization of order two.
- The local nearly ordinary types are distinguished; flat types satisfy Fujiwara’s unramified base-field restriction; a minimal modular lift exists as in Definition 6.11.
- Verify Hypothesis 6.7 via Theorem 6.8 in the ordinary/weight-two instance; retain Hypothesis 5.9 in exactly the nonminimal cases where 11.1 requires it. Odd [F:Q] requires the Shimura-curve Ihara input in Wan 8.
- Exclude the actual exceptional 0E case using the induced-representation description: the local representation is absolutely irreducible, its inertia restriction is absolutely reducible, and q_v≡−1 mod p. BCS H3 excludes this case. Additionally verify Wan 8’s literally printed irreducible-inertia q_v test. SourceIssues E1/E5 explain the wording discrepancy; the literal test alone is not used as an exclusion of the actual induced type.

Proof route:

1. Match the determinant, Teichmuller twist characters, finite local deformations away p and nearly ordinary/flat local deformation conditions, not just residual representations.
2. Apply the exact minimal supplier theorem and freeness; the existing nice-prime Skinner–Wiles theorem in R21.4 is not by itself this theorem.
3. Use finite flatness over the regular weight ring and complete-intersection duality to deduce Gorenstein; finite flatness alone does not imply regularity.

Imports: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GlobalGaloisDeformations:R04.6`, `PadicFamilies:L5`.

Acceptance checks:

- At real quadratic F no odd-degree Ihara condition is invoked.
- A general residual irreducibility statement without minimal lift or local types does not satisfy this target.

Sources: [Fujiwara, Definition 6.11, pp.54–55; Theorems 11.1–11.2, p.95; Corollary 11.5, p.97](https://arxiv.org/pdf/math/0602606v2) — Exact minimal conditions and freeness.; [Wan, Theorem 8, pp.6–7](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Gorenstein input and the actual inertia condition.; [BCS, Hypothesis 3.1.1 and Remark 3.1.2, pp.7–8](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Application conditions; BCS H3 matches the induced exceptional type, while the source wording discrepancies are recorded.

### 2. Integral projector and canonical period

Named declaration: `canonicalPeriodDuality` (`AutomorphicCongruences:L5w/canonical-period-duality`).

In the specified ordinary Hilbert Hecke algebra T over the normal Hida coefficient ring I, let e_f be the rational idempotent of the f-component. Identify T∩I_frac e_f with the rank-one integral congruence line generated by ℓ_f=η_f e_f, using the supplied Gorenstein duality and free Hecke module. Wan’s canonical period divides the specified Petersson pairing by η_f with the archimedean factors of Definition 79. Replacing ℓ_f by uℓ_f, u∈I×, changes the normalized p-adic L-function and Eisenstein family by the matching unit; their ideals are unchanged.

Hypotheses:

- The Hecke algebra and module are those in the preceding Fujiwara instance, not an arbitrary finite flat algebra.
- The f-component is generically isolated; the congruence number is nonzero at the chosen arithmetic point; the actual integral lattice and pairing are fixed.

Proof route:

1. Import generic congruence-line duality from IHG and the free module from the minimal theorem.
2. Match Wan 7.2.1/Definition 79, including the choice of generator, powers of 2 and i, conductor and conjugate/twisted form.
3. Use the integral projector ℓ_f in interpolation; retain e_f only for the rational version.

Imports: `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L0`, `IntegralHeckeAndGaloisDeterminants:IHG.6`, `mathlib:Ideal.span_singleton_mul_left_unit`.

Acceptance checks:

- The rational idempotent is not declared integral.
- No equality of the period over F with the square of a period over Q is inferred.

Sources: [Wan, §7.2.1, Definition 79, Remark 80, pp.65–66; Theorem 82, pp.66–68](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Canonical normalization and integral versus rational projector.

### 3. Quaternionic period and primitive anticyclotomic input

Named declaration: `quaternionicPeriodPrimitivity` (`AutomorphicCongruences:L5w/quaternionic-period-primitivity`).

For the Jacquet–Langlands transfer of the parallel even-weight member of the Hilbert family, compare the quaternionic self-pairing congruence period with Wan’s canonical period up to an integral unit. Under squarefree n− of parity [F:Q] and residual ramification at every n− factor, the transfer has the same localized Hecke algebra and rank-one module needed for this comparison. Import Hung/Hsieh nonvanishing with that period: NV1 is nonzero, and under the Fujiwara instance NV2 is primitive modulo the uniformizer. Nonsplit imprimitive Euler factors are kept and may contribute positive μ.

Hypotheses:

- p≥5 unramified in F; M/F CM with p split; residual irreducibility and ordinary distinctness.
- n− squarefree with #prime factors ≡[F:Q] mod 2; residual ramification at each factor; the branch character used in Wan 86 is trivial.

Proof route:

1. Check stabilizer orders are prime to p (a p-torsion element would yield a quadratic field containing μ_p, impossible here for p≥5 unramified in F).
2. Use the imported free quaternion module and integral pairing to identify the congruence generator.
3. Apply the precise toric nonvanishing supplier on its character domain and compare primitive versus removed-Euler-factor normalizations.

Imports: `AutomorphicCongruences:L5w/canonical-period-duality`, `AutomorphicPadicLFunctions:L3h`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`.

Acceptance checks:

- n−=1 is allowed when [F:Q]=2.
- A μ=0 assertion for every imprimitive function fails at nonsplit Euler factors and is excluded.

Sources: [Wan, Definition 85 and Theorem 86, pp.69–70; Lemma 87, pp.70–71](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Period comparison, NV1/NV2, and exceptional Euler factors.

### 4. Normalized Hilbert Klingen family and its boundary

Named declaration: `wanKlingenInterpolation` (`AutomorphicCongruences:L5w/klingen-interpolation`).

In the imported ordinary GU(2,2)/F module of p-adic forms, take the Klingen family ℰ_D supplied by APL L4 from the actual local sections and pullback, and prove its normalized coefficient and boundary identities. At every cusp x its coefficients c_D(β,x) lie in Λ_D and specialize at each generic arithmetic point φ to the classical Klingen coefficient normalized by Ω_{f_φ,can}. Indices β are positive semidefinite Hermitian rank-two matrices; the degenerate indices det β=0 are included. Every degenerate coefficient (det β=0) belongs to (L_f,M,ξ^Σ L_ξ′^Σ). This is the boundary divisibility needed for a cuspidal congruence.

Hypotheses:

- D=(A,I,f,ψ,ξ,Σ) is Wan’s p-adic Eisenstein datum; Σ contains p and every bad prime; local sections are generic at the interpolation points.
- Residual irreducibility, ordinary distinctness and the Gorenstein instance hold; the auxiliary finite ψ has the specified central restriction and is unramified outside Σ.

Proof route:

1. Import the GU(2,2) carrier, doubling/pullback integrals and Λ-adic q-expansion/control from APL L4 and the ordinary unitary-form supplier.
2. Use ℓ_f rather than e_f to obtain integral coefficients, then check the local p sections and tame local factors against Wan’s interpolation formula.
3. Evaluate the Siegel operator at every cusp; the degenerate coefficient computation gives the product of Rankin and abelian p-adic L-functions.

Imports: `AutomorphicCongruences:L5w/canonical-period-duality`, `AutomorphicPadicLFunctions:L4`, `AutomorphicCongruences:L1`, `PadicFamilies:L5`.

Acceptance checks:

- Use GU(2,2), not GU(3,1) or the semi-ordinary projector.
- Check boundary divisibility at all cusps, not just the standard constant coefficient.

Sources: [Wan, §§6–7; Theorem 82, pp.66–68; Theorem 88, p.71; Theorem 27, p.23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Actual source-specific integral family and boundary ideal.

### 5. Nonconstant Fourier coefficient coprimality

Named declaration: `wanFourierCoprimality` (`AutomorphicCongruences:L5w/fourier-coefficient-coprimality`).

For ℰ_D, the ideal generated by the selected nondegenerate Fourier–Jacobi/theta pairings is contained in no height-one prime of Λ_D except possibly a prime pulled back from R+=I[[Γ_M+]]. At each remaining height-one prime dividing L_f,M,ξ^Σ there is an actual nonconstant coefficient which is a unit after localization. This supplies the coefficient which survives the cuspidal congruence; nonzero interpolation alone is insufficient.

Hypotheses:

- Wan’s irreducibility/distinctness and Gorenstein conditions, auxiliary theta/CM characters and their prescribed local conductors are satisfied.
- The CM character is chosen with its period-normalized algebraic value a p-adic unit, with local Euler factors units and CM residual irreducibility/distinctness; all factors are tested on the chosen lattice.

Proof route:

1. Apply the explicit Fourier–Jacobi identity and Hecke projection of Wan 95; keep its A_D,g factor in R+ and its B_D,g factor in Λ_D.
2. Choose the auxiliary CM family and characters as in 96, importing the CM p-adic L-value and congruence-period theorem from APL L3h/L3.
3. Show the B factor is a unit and identify the remaining possible divisors as pulled-back primes.

Imports: `AutomorphicCongruences:L5w/klingen-interpolation`, `AutomorphicCongruences:L5w/quaternionic-period-primitivity`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L3`.

Acceptance checks:

- At an excluded prime from R+ use the exceptional-prime target, rather than this coprimality statement.
- A single dense set of nonzero classical coefficients does not imply integral primitivity.

Sources: [Wan, Proposition 95, pp.78–79; Proposition 96 and proof, pp.79–81](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Selected coefficient ideal and the CM unit computation.

### 6. Wan’s coefficient Eisenstein ideal

Named declaration: `wanEisensteinIdeal` (`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`).

For Λ_D→h_D, where h_D is the reduced localized cuspidal ordinary Hecke image, let J index the exact characteristic-polynomial coefficients, central-character values and ordinary U_p eigenvalues in Wan §9.1. For every unramified inert place include all coefficients of Q_v−Q_v,D and its central Z_v,0 difference; for each split place include Q_w−Q_w,D, Q_wbar−Q_wbar,D and both central Z_v,0^(i) differences. The polynomial constant coefficient is 1, so only degrees 1–4 contribute. At every v|p include u_t,v−λ_ℰ_D(u_t,v) for t=diag(p^a1,p^a2,p^a4,p^a3), a1≤a2≤a3≤a4. Reciprocity uses geometric Frobenius and the central character is σ_ψσ_ξ^−1. Write H_j∈h_D and λ_j∈Λ_D for these cuspidal operators and Eisenstein values. Let I_D be the ideal generated by H_j−λ_j, and define 𝔈_D=I_D∩Λ_D, equivalently the kernel of Λ_D→h_D/I_D. The exact Hecke-generator dictionary proves the structure map onto h_D/I_D is surjective, so Λ_D/𝔈_D≅h_D/I_D. The definition does not assume surjectivity or identify a reducibility ideal with a congruence ideal.

Hypotheses:

- The coefficient inclusion is a unital ring map; the Hecke carrier, reduced image and eigenvalues are supplied by the ordinary-form/IHG owners.
- The actual index set J contains all operators listed in Wan §9.1, with its central and U_p relations.

Proof route:

1. Use the existing ideal span, preimage and quotient API to specialize the generic congruence construction to the source eigenpacket.
2. Prove its kernel and generator relations using membership in a generated ideal.
3. Use the IHG/form supplier’s exact Hecke-generation dictionary: polynomial-coefficient, central and ordinary differences reduce every generator to its Eisenstein scalar. Check that inverted central/ordinary/localizing elements have unit scalar images. This proves coefficient-to-quotient surjectivity; scalar maps otherwise give only the stated kernel inclusion.

Imports: `mathlib:Ideal.comap`, `mathlib:Ideal.mem_comap`, `mathlib:Ideal.map_span`, `AutomorphicCongruences:L0`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

The definition is used in the congruence-length theorem and in the Galois/Selmer instance, where its local quotient length is the arithmetic congruence input. Its API is:

- `wanEisensteinIdeal_mem`: r∈𝔈_D iff its image in h_D belongs to the ideal generated by the operator differences.
- `wanEisensteinIdeal_quotient_kernel`: 𝔈_D equals the kernel of the coefficient map followed by the quotient h_D→h_D/I_D.
- `wanEisensteinIdeal_generator`: Each operator H_j and the image of λ_j agree in h_D/I_D.
- `wanEisensteinIdeal_quotient_surjective`: If the coefficient-to-quotient map is surjective, its induced map Λ_D/𝔈_D→h_D/I_D is a ring equivalence.
- `wanEisensteinIdeal_baseChange_le`: For a commuting coefficient/Hecke square and transported operator values, the extension of 𝔈_D is contained in the new coefficient Eisenstein ideal; equality requires a proved kernel-base-change condition.

Discriminating unit tests:

- `eisenstein_equal_eigenvalues`: For Λ=h=ℤ, identity coefficient map, one operator H=7 and λ=7, E=(0).
- `eisenstein_mod_five`: For Λ=h=ℤ, identity coefficient map, H=8 and λ=3, E=(5), not (25).
- `eisenstein_unit_difference`: For Λ=h=ℤ, identity coefficient map, H=2 and λ=1, E=ℤ.
- `eisenstein_kernel_noninjective`: For the coefficient map ℤ→ZMod 5 and an operator equal to its eigenvalue, I_D=0 but E_D=(5), detecting the coefficient kernel.

The zero-difference test rejects a definition with a spurious constant relation. The modulus-five test detects squaring the generated ideal. The unit test detects taking the wrong ideal direction. The noninjective-map test distinguishes the coefficient preimage from the zero Hecke ideal.

Acceptance checks:

- The ideal lives in Λ_D, distinct from I_D in h_D.
- The coefficient map need not be injective in the general algebraic prototype; arithmetic h_D uses the actual coefficient action.

Sources: [Wan, §9.1, pp.81–83 (definitions of h_D, I_D and E_D)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — The source-specific operator list and coefficient kernel, using existing ideal theory.

### 7. Cuspidal lift and Eisenstein congruence length

Named declaration: `wanHeightOneCongruence` (`AutomorphicCongruences:L5w/height-one-congruence`).

At a height-one prime P of Λ_D not pulled back from R+, with a nonconstant Fourier coefficient of ℰ_D outside P, construct a cusp family congruent to ℰ_D modulo the Rankin factor L^Σ. The induced map h_D/I_D→Λ_D,P/(L^Σ) is onto; the coefficient structure map is onto and its kernel 𝔈_D has ord_P(𝔈_D)≥ord_P(L^Σ). In the rational projector variant retain b e_f integral, b(φ0)≠0, P⊂φ0, and the coefficient nonvanishing condition on b times the rational family.

Hypotheses:

- The integral family and coprimality theorem, ordinary boundary exact sequence and lifting/control theorem hold for all cusps.
- P is height one; the local ring is a DVR; the Rankin factor is nonzero. The unwanted abelian factor is removed only with the actual unit/localization argument of Wan.

Proof route:

1. Use Wan 27 to lift the cuspidal reduction of the family; verify the boundary and flatness hypotheses of the form module.
2. Divide the Hecke-translated nonconstant coefficient by the coefficient which is a unit at P; this defines the quotient eigenpacket modulo P^r, r=ord_P(L^Σ).
3. The quotient map forces 𝔈_D⊂P^r locally. Apply source-specific Gorenstein duality, not a blanket kernel-base-change assertion.

Imports: `AutomorphicCongruences:L5w/klingen-interpolation`, `AutomorphicCongruences:L5w/fourier-coefficient-coprimality`, `AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`, `AutomorphicCongruences:L1`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- The inequality is ≥, not strict >; verify against the PDF symbols.
- A vanishing/nonunit coefficient cannot be used as a denominator.

Sources: [Wan, Theorem 27, p.23; §9.1 and Theorem 97, pp.81–84](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Cuspidal congruence and orientation of the local length bound.

### 8. Polarized 1+2+1 extension with ordinary local conditions

Named declaration: `wanGaloisSelmerInstance` (`AutomorphicCongruences:L5w/galois-selmer-instance`).

Apply IHG’s integral determinant/reconstruction and Ribet extension theorem to the actual cuspidal rank-four Galois representation congruent to χ′⊕ρ⊕χ. Verify all ten hypotheses of Wan §9.2.1 on the completed height-one Hecke algebra. The resulting extension classes belong to the Σ-imprimitive ordinary Selmer group for the same rank-two lattice and twist as the Rankin function. For P0⊂I[[Γ_M]] height one not pulled back from R+=I[[Γ_M+]], require that P=P0Λ_D is the corresponding height-one prime. If the plus/minus local constituents are residually disjoint modulo P, obtain ord_P0(char X^Σ)≥ord_P(𝔈_D).

Hypotheses:

- Λ_D is a Krull domain; h_D is finite, local and reduced; completions at corresponding primes retain I_D∩Λ_D=E_D and the quotient identification.
- The three residual constituents are disjoint, the rank-two one absolutely irreducible, and the polarization and local ordinary characteristic polynomials have Wan’s twists.
- The cuspidal characteristic-zero constituents are absolutely irreducible or satisfy the precise rank-two alternative in condition (10); CAP exclusion and ordinary modularity lifting prove this alternative.
- The scalar-character Selmer characteristic ideal has valuation zero at P by the totally real character main conjecture; the plus/minus local pieces have no common irreducible constituent modulo P.
- For primes containing 𝔈_D, set A0=Λ_D, A=completion of (A0)_P (a DVR), R0=(h_D)_m, and R=completion at the inverse image Q of P in R0. A0 is a profinite Z_p Krull domain; R0 is finite local reduced over A0. The ideals I0=I_D and J0=𝔈_D satisfy I0∩A0=J0, A0/J0≅R0/I0, and their extended ideals recover I0 and J0 by contraction. At a prime not containing 𝔈_D the congruence valuation is zero and the inequality is immediate.
- Wan setup (1)–(3): use H=G_F,Σ, G=G_M,Σ and its conjugation c. The continuous polarization character ν extends to H; χ is a continuous character of G and χ′=νχ^(−c) has different residual character. The rank-two ρ is defined on a free A0-lattice, satisfies ρ^c≅ρ^∨⊗ν, and its residual representation is absolutely irreducible and disjoint from both residual characters. Residual disjointness is witnessed by coprime characteristic polynomials of some group-algebra element, as in the supplier theorem.
- Wan setup (4)–(6): the rank-four σ is defined over the image of R0 in R, with integral traces and a finitely generated R-orbit module for every vector. It satisfies the same polarization; the proper congruence ideal I has nonzero J=A∩I and A/J≅R/I, and tr σ≡χ′+tr ρ+χ modulo I. The irreducible ρ has a compatible polarization pairing Φ with Φ^t=−ν(c)Φ.
- Wan setup (7)–(9): at every v|p the plus and minus rank-two lattice pieces are free over A0, and the plus and minus rank-four pieces are free over R⊗_A Frac(A). For every element x of the local group algebra, the plus characteristic polynomial of σ agrees modulo I with Ch(ρ^+,x,T)(1−χ(x)T); the minus relation uses χ′. The two combined local pieces have no common residual irreducible constituent.
- Wan setup (10): for each characteristic-zero specialization of R⊗_A Frac(A), σ is absolutely irreducible or has the specified absolutely irreducible rank-two subrepresentation whose trace is congruent to χ+χ′. The ordinary lifting and CAP exclusion supplier proves this alternative; it is not assumed for an arbitrary trace.
- Match the exact twist dictionary of Wan §9.2.2, p.87: ρ=ρ_f⊗σ_ξ^(−c)σ_ψ^c ε^(−2), χ=σ_ψ^c ε^(−3), and χ′=νχ^(−c), using ε for the p-adic cyclotomic character. The final Selmer lattice is (T_f⊗I[[Γ_M]])(ε_M^(−c))⊗ε and its ordinary line, with the actual coefficient map and primitive/Σ conventions. All height-one extension and coefficient normalization comparisons are verified before identifying the valuations.

Proof route:

1. Import the determinant/Ribet construction from the current upstream IHG roadmap, and specialized local-condition bridge from AC L0.
2. Match Wan’s characters χ, χ′, ν, rank-two lattice and cyclotomic/CM twists using the displayed formulas on p.87; keep the polarization sign.
3. Use the ordinary lifting/CAP theorem for condition (10), and the abelian main-conjecture supplier to kill the unwanted character extension.
4. Apply the length theorem and compare the resulting local conditions with the source Selmer group; if X is not torsion the source’s extended characteristic ideal is zero, not a nonzero genuine characteristic ideal.

Imports: `AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`, `AutomorphicCongruences:L5w/height-one-congruence`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `IntegralHeckeAndGaloisDeterminants:IHG.6`, `AutomorphicCongruences:L0`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `DirichletPadicLFunctions:L4`, `SelmerIwasawaCohomology:L3/kernel-control`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- A trace congruence alone is not used to produce an integral representation.
- The scalar Selmer term and the common-local-constituent condition are not suppressed.

Sources: [Wan, §9.2.1, Proposition 98, pp.84–86; §9.2.2, Theorem 100, pp.87–88](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Actual polarized extension instance and ordinary local-condition check.

### 9. The pulled-back height-one primes

Named declaration: `wanExceptionalPrimes` (`AutomorphicCongruences:L5w/exceptional-height-one-primes`).

For a height-one P pulled back from I[[Γ_M+]], bound ord_P(L^Σ) by the sum of valuations of the nonsplit removed Euler factors, using primitive NV2 and the period comparison. If X^Σ is torsion, Poitou–Tate and the vanishing of the compact global term give the exact primitive/imprimitive characteristic-ideal comparison with those local factors. Hence ord_P(char X^Σ)≥ord_P(L^Σ). If X^Σ is not torsion, record only the zero extended-ideal containment. No uniform imprimitive μ=0 assertion is made.

Hypotheses:

- The ordinary primitive and imprimitive local conditions use the same lattice; Σ includes bad primes and p.
- NV2 holds for the primitive function; local H¹ finite-part modules have the indicated Euler characteristic ideals; the necessary compact global term vanishes after checking torsion and torsion-freeness.

Proof route:

1. Apply Wan 87 to the primitive-normalized function with the nonsplit Euler product retained.
2. Use the Selmer supplier’s Poitou–Tate exact sequence; prove its global compact term is both torsion-free (residual irreducibility) and torsion under the stated cotorsion hypothesis.
3. Match each local characteristic ideal with the analytic Euler factor and use characteristic multiplicativity; normality extends the height-one inequalities.

Imports: `AutomorphicCongruences:L5w/quaternionic-period-primitivity`, `AutomorphicCongruences:L0`, `SelmerIwasawaCohomology:L4`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- Nonsplit factors with positive μ are included on both sides.
- The non-torsion case is not reported as a proof of torsionness.

Sources: [Wan, Lemma 87, p.71; proof of Theorem 101, p.89](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Exceptional primes and local-factor comparison rather than automatic primitivity.

### 10. Wan’s parallel Hilbert-family divisibility

Named declaration: `wanFamilyDivisibility` (`AutomorphicCongruences:L5w/wan-family-divisibility`).

Let F be totally real of degree d, p≥5 unramified in F, M/F CM with p split, and I a local normal finite integral extension of the parallel Hida weight algebra. Let f be a nearly ordinary I-adic eigenform of trivial character with an ordinary specialization of even parallel weight κ0≥2. Under residual irreducibility over M, distinctness, the full Wan 8/Fujiwara instance, Δ+ (M not in the narrow Hilbert class field of F and F/Q-ramified primes split in M), squarefree n− with parity d, and residual ramification at all n−, prove char^Σ(X_f,M)⊂(L_f,M^Σ). For Σ including all bad primes, the normalized function is integral. For arbitrary Σ the result is a fractional-ideal statement with the Euler factors restored. Here char^Σ means the usual characteristic ideal when the finite dual is torsion; in the non-torsion case Wan’s assertion uses zero.

Hypotheses:

- All conditions in the statement, including the integral Gorenstein period normalization and the same lattice in the analytic and Galois comparisons.
- No general main conjecture for an arbitrary unitary-group representation or arbitrary weight Hida family is inferred.

Proof route:

1. Combine the coefficient coprimality, congruence length and Galois extension bounds at non-pulled-back primes.
2. Use the exceptional-prime target on the complementary primes.
3. Import height-one detection of divisorial ideal containment over the normal coefficient ring; remove/add local factors through Poitou–Tate to treat each Σ.

Imports: `AutomorphicCongruences:L5w/height-one-congruence`, `AutomorphicCongruences:L5w/galois-selmer-instance`, `AutomorphicCongruences:L5w/exceptional-height-one-primes`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- Test p=5 and κ0=2 against the PDF, whose text extraction drops ≥.
- Separate the source’s extended ideal from cotorsion needed to use a nonzero characteristic divisor.

Sources: [Wan, Theorems 3 and 101, pp.3–4 and 88–89](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Parallel-family theorem with fractional and integral domains separated.

### 11. Arithmetic specialization with control corrections

Named declaration: `wanArithmeticSpecialization` (`AutomorphicCongruences:L5w/arithmetic-specialization`).

At the ordinary weight-two point φ:I→O giving g_F, extend φ to Λ_D→Λ_M and compare the specialized Rankin function with the fixed-form normalized one. On the Selmer side construct the actual coefficient-control map and show the image of the big characteristic ideal contains the characteristic ideal of the specialized dual, with the derived Tor/local corrections either zero in this instance or retained explicitly. Establish the source-specialization containment for g_F on its original integral lattice. The normalized Eisenstein coefficient kernel has only a general base-change inclusion until its kernel compatibility is proved.

Hypotheses:

- φ is the point of the same parallel family; the integral period/projector matches the fixed-form normalization.
- Finite Selmer duals and compatible ordinary/away-p local conditions; residual no-invariants and local ordinary quotient hypotheses needed for control. A height-one generator must have nonzero specialization before cancellation.

Proof route:

1. Use the imported Hida control theorem to identify the form and its Galois lattice at φ.
2. Apply derived control and its Tor spectral sequence; prove the kernel/localization-image corrections vanish using the actual residual representation, not irreducibility as a generic substitute.
3. Use the source Fitting-to-characteristic specialization inequality, then prove the period and Euler-factor comparison on the same O[[Γ_M]].
4. Use P7 residual Nakayama only for a pseudo-coherent comparison cone; use R03.6 support-base-change for finite modules only.

Imports: `AutomorphicCongruences:L5w/wan-family-divisibility`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/rational-specialization`, `PadicFamilies:L5`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-residual-nakayama`, `DeformationAndDerivedPatchingAlgebra:R03.6/support-base-change`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- No assertion that tensor product commutes with every Selmer kernel.
- No replacement of a normal Hida branch by a regular ring just because it is finite flat.

Sources: [BCS, Proof of Theorem 3.2.1, p.8 (arXiv v2 p.7)](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Weight-two specialization, whose control and integral normalization must be checked.; [SUauthor, Proposition 3.2.8, Corollary 3.2.9, pp.23–24](https://www.math.columbia.edu/~urban/eurp/MC.pdf) — Ordinary control and oriented characteristic inequality.

### 12. The BCS quartic-CM input

Named declaration: `quarticCMDivisibility` (`AutomorphicCongruences:L5w/quartic-cm-divisibility`).

For a weight-two elliptic newform g of level N and good ordinary p>3, let F be real quadratic with gcd(pN,D_F)=1, and M/F CM quadratic, p split, gcd(NO_F,D_M/F)=1. Require residual irreducibility over M, the exact H1/minimal-lift conditions, both local inertia checks of the Fujiwara instance, and Δ+. If n− is squarefree with an even number of inert prime factors and the residual representation is ramified at each factor, prove (L_p(g_F/M))⊇char(X_ord(g/M∞)) in O[[Γ_M]], in the torsion case. State separately the source’s zero-ideal containment when the dual is not torsion; torsion must come from the explicit Selmer/Kato supplier. This is the source-qualified integral engine exported to L5a.

Hypotheses:

- All field, local and residual hypotheses in the statement; p>3 entails p≥5.
- The integral ordinary local conditions away p are BCS §2’s locally trivial ones; compare Wan’s inertia/Σ conventions through actual local Euler modules before changing primitive status.
- The fixed-form analytic object is the normalized specialization of the family object; sourceIssues E1/E5 record the incompatible inertia wording in Fujiwara/Wan, and E2 explains why ordinary Δ alone is not used to discharge the narrow condition.

Proof route:

1. Verify the full minimal theorem instance and the canonical period.
2. Apply the family divisibility and arithmetic specialization targets on the same coefficient ring and lattice.
3. Remove precisely the Euler factors for the fixed primitive Selmer convention; record any nonunit rather than cancel it without a comparison.
4. Use the separate torsion supplier for a genuine characteristic ideal.

Imports: `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L5w/arithmetic-specialization`, `AutomorphicCongruences:L0`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `SelmerIwasawaCohomology:L3`.

Acceptance checks:

- The empty n− product has zero factors and satisfies parity in degree two.
- The output is one divisibility; no quartic-CM main-conjecture equality is claimed.

Sources: [BCS, Theorem 3.2.1, pp.7–8; §2, pp.5–7](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The quartic-CM specialization with strengthened explicit supplier conditions.; [Wan, Theorems 8, 82 and 101, pp.6–7, 66–68, 88–89](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Integral family input, not a universal torsion theorem.

### 13. Discharging the auxiliary-field hypotheses

Named declaration: `selectedBaseChangeHypotheses` (`AutomorphicCongruences:L5w/selected-base-change-hypotheses`).

For K,F selected by L5a’s BCS Lemma 5.2.3 contract, prove the quartic engine’s conditions. K has odd discriminant not −3, all primes N split, and p splits; F has odd discriminant coprime pN, p inert, D_F-primes split in K, and an N-prime ℓ is inert in F exactly when ℓ≡−1 mod p. Residual irreducibility holds over M=FK and G_{F(ζ_p)} (absolute irreducibility is verified for the elliptic application), with the p=5 exceptional case excluded. Then p splits in M/F, discriminants are coprime to N, n−=1, both local q_v tests hold, and a minimal modular lift base-changes to a minimal lift over F. Ensure K has a new ramified prime outside D_F, so M/F is ramified at a finite place and cannot lie in the narrow Hilbert class field.

Hypotheses:

- The complete selected-field conditions, rather than arbitrary quadratic fields, and the exact minimal modular lift over Q supplied by R04.6/R21.4.
- The p=5 auxiliary exclusion F≠Q(ζ5)+ is available; for elliptic representations the projective exception is also excluded by Fujiwara 9.8.

Proof route:

1. Import multiquadratic field/splitting theory; do not rebuild the compositum or its three characters.
2. At ℓ|N, inertness in F turns q=ℓ into q=ℓ²≡1 when ℓ≡−1; otherwise q≠−1 already. Outside N the residual representation is unramified; at p the ordinary residual representation is reducible/distinguished. Thus BOTH local inertia tests are discharged.
3. Match all six clauses of Fujiwara 6.11 under base change; invoke the specific local minimality theorem supplied by the deformation owner.
4. Since K is chosen ramified at a new odd prime outside D_F, M/F is not unramified at all finite places. Verify n−=1 directly from Heegner splitting in K.

Imports: `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GlobalGaloisDeformations:R04.6`, `tauceti:TauCetiRoadmap/Multiquadratic#layer-1-the-prime-splitting-law`.

Acceptance checks:

- No Heegner or anticyclotomic endpoint is used.
- Record the ownership of auxiliary-field existence in L5a; this target verifies its Wan/Fujiwara application, not a second existence theorem.

Sources: [BCS, Proposition 5.2.1 and Lemma 5.2.3, pp.11–12 (v2 pp.9–10)](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Discharge all conditions before using the weaker endpoint hypotheses.; [Wan, Proof of Theorem 103, pp.91–92](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) — Minimal base-change lift route.; [Fujiwara, Definition 6.11, pp.54–55; Proposition 9.8, p.83](https://arxiv.org/pdf/math/0602606v2) — Minimality and elliptic p=5 exception.

## L5b — Quadratic factorization and cyclotomic descent

The early L5a inequality controls a product over K, rather than each factor.
Cyclotomic projection turns this into four factors over ℚ. Kato supplies
four independent inequalities in the opposite direction. Only together do
they force equality for each factor. The rational and integral versions use
the same argument in different coefficient rings, with different upper-bound
hypotheses.

For J_χ=char(X_χ) and A_χ=(L_χ), the directions are

| Input | Ideal inclusion |
| --- | --- |
| Each Kato bound | A_χ ⊂ J_χ |
| Early product after descent | ∏J_χ ⊂ ∏A_χ |
| Factor separation | J_χ=A_χ for every χ |

At every height-one prime the four nonnegative Kato defects sum to at most
zero. Each therefore vanishes. This includes the p-primary defect only when
all four Kato bounds and all comparisons are integral.

### 1. The four quadratic twists on integral Tate lattices

Named declaration: `fourTwistLatticeDictionary` (`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`).

For E/Q, distinct quadratic fields K imaginary and F real, and p>3 unramified in K and F, identify T_p(E^χ) with T_p(E)⊗χ integrally for χ∈{1,η_K,η_F,η_Kη_F}. Use the existing quadratic-twist point isomorphism and its character-equivariance, restrict to all p-power torsion and take the compatible inverse limit. Every twist has good ordinary reduction at p; its ordinary line is the transported line twisted by χ. The cyclotomic Iwasawa coefficient ring and reciprocal tautological action are the same for all four twists.

Hypotheses:

- E has good ordinary reduction at p; the quadratic discriminants are prime to p; all extensions and the algebraic closure embeddings are fixed.
- The inverse-limit transition maps and ordinary filtration are the actual Tate-module ones; no rational isogeny is substituted for an integral lattice equivalence.

Proof route:

1. Apply the pinned Tau Ceti point-group isomorphism with its quadratic character, then restrict to E[p^n] and check compatibility with multiplication by p.
2. Pass to the inverse limit and verify the selected ordinary sublattice using unramified quadratic twisting at p.
3. For the product character use composition of the two twists and the canonical integral scalar action; keep the character Galois restriction maps.

Imports: `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `SelmerIwasawaCohomology:L2`.

Acceptance checks:

- A p-power index in the lattice comparison would invalidate the integral endpoint and must not be discarded.
- The product character is the third quadratic subfield character, not the real base-change representation g_F.

Sources: [BCS, Proof of Theorem 1.1.2, p.12; Lemma 5.1.1, p.10](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The four twists must satisfy Kato on their actual integral lattices.; [SUauthor, §3.1.1–3.1.5, pp.16–19](https://www.math.columbia.edu/~urban/eurp/MC.pdf) — Twisted coefficient convention used in Shapiro.

### 2. Integral quadratic Selmer decomposition

Named declaration: `quadraticSelmerDecomposition` (`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`).

For any finite extension of the cyclotomic tower in the chosen setting, restriction and the idempotents (1±c)/2 give Sel_ord(E/KQ∞)≅Sel_ord(E/Q∞)⊕Sel_ord(E^K/Q∞), on the same integral p-primary lattices and ordinary local conditions. The Pontryagin dual decomposition is Λ-linear. Apply it also to E^F and, when needed for the early torsion check, to the biquadratic compositum to obtain all four summands. For torsion duals, characteristic ideals multiply exactly. At away-p places retain the localization-image and primitive/imprimitive errors until the matching local-condition comparison proves them absent.

Hypotheses:

- p odd makes 2 a unit; coefficient ring O is the fixed p-adic integer ring.
- The ordinary sublattice is stable under the larger decomposition group and transports to both primes of K over p; the same Σ is pulled back from Q.
- The local condition is specified: BCS uses the locally trivial away-p condition; the inertia-kernel convention in SU requires a proved comparison or explicit Euler corrections.

Proof route:

1. Import continuous Shapiro and local restriction functoriality from ProfiniteCohomology; compare the local conditions at every place.
2. Split the quadratic group ring using the integral ± idempotents, dualize, and use the Tate-twist lattice dictionary.
3. Apply the existing characteristic-ideal multiplicativity theorem only after proving finiteness and torsion.

Imports: `AutomorphicCongruences:L5b/four-twist-lattice-dictionary`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`, `SelmerIwasawaCohomology:L3/kernel-control`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

Acceptance checks:

- After inverting p the decomposition agrees with the rational representation decomposition.
- At p=2 the idempotents are unavailable; the theorem excludes that case.

Sources: [SUauthor, Lemma 3.1.5, p.19; Lemma 3.2.5, p.22](https://www.math.columbia.edu/~urban/eurp/MC.pdf) — Integral quadratic and cyclotomic-tower decompositions.; [BCS, Proof of Theorem 1.1.2, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The decomposition used in four-factor descent.

### 3. Cyclotomic projection and characteristic inequality

Named declaration: `cyclotomicControl` (`AutomorphicCongruences:L5b/cyclotomic-control`).

For each of E and E^F over K, construct the map X_ord(K∞)/I−X_ord(K∞)→X_ord(KQ∞), where π+:Λ_K→Λ_Q and I−=ker π+. Under the actual no-invariants, ordinary inertia-quotient and primitive local-control hypotheses, prove the required isomorphism; otherwise retain the finite/pseudo-null correction with its divisor. In the exact case, π+(char_ΛK X)⊇char_ΛQ(X/I−X). This is a divisibility, not a general equality of specialized characteristic ideals. Use Kato’s cyclotomic torsion for the two twists and Nakayama with the finite dual to establish the torsion needed for the nonzero two-variable characteristic ideal.

Hypotheses:

- Λ_K≅O[[T+,T−]], Λ_Q≅O[[T+]] are normal domains with the actual continuous quotient map.
- The source control condition excludes a trivial subquotient of T* over the tower; its p-inertia quotient action factors through the cyclotomic group. Σ∪{p} contains every ramified prime for the imprimitive comparison.
- Every removed Euler factor is compared on both sides before passing back to primitive Selmer groups; specialization of the analytic/characteristic generator is nonzero.

Proof route:

1. Apply the Selmer kernel-control theorem to global and local restriction maps, including the image of localization.
2. Use SU 3.2.8 and 3.2.11 on the verified ordinary lattice; import derived control for correction complexes.
3. Apply the Fitting-to-characteristic inequality of SU 3.2.9(ii) or its exact supplier implementation.
4. Use the quadratic decomposition and early Kato torsion to prove the quotient dual torsion, then localized Nakayama to rule out positive generic rank of the two-variable dual. This does not import the completed cyclotomic equality.

Imports: `AutomorphicCongruences:L5b/quadratic-selmer-decomposition`, `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/derived-control`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `AutomorphicCongruences:L0`.

Acceptance checks:

- π+(char X) is not replaced by char(X/I−X) without an additional theorem.
- The zero extended characteristic ideal of a non-torsion module cannot be canceled.

Sources: [SUauthor, Proposition 3.2.8, Corollary 3.2.9(ii), Proposition 3.2.11, pp.23–24](https://www.math.columbia.edu/~urban/eurp/MC.pdf) — Control and the correct direction of characteristic specialization.; [BCS, §5.1 and proof of Theorem 1.1.2, pp.10–12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The projection used for descent.

### 4. Period-normalized analytic quadratic factorization

Named declaration: `cyclotomicAnalyticFactorization` (`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`).

For E/Q and imaginary quadratic K with odd discriminant, p split and all N-primes split, project the Perrin–Riou Rankin function to the cyclotomic line. With CGS’s normalization by deg(π_E)/c_E² and H_p(E), prove (π+L_PR(E/K))=(L_MSD(E/Q)L_MSD(E^K/Q)) in the integral cyclotomic coefficient ring when the analytic objects are integral, and in its p-inversion for the rational normalization. The relation is up to a Λ_Q-unit, represented by the discriminant character factor and the real-component factor, with p odd. Prove the analogous identity for E^F using its own Néron periods and primitive Euler factors.

Hypotheses:

- The modular parametrization π_E, Manin constant c_E, ordinary unit root α_p and Néron differentials of E and E^K are the actual objects used by CGS.
- Use a common coefficient extension containing character values, then descend by the supplier’s faithful coefficient comparison. All four primitive functions are nonzero.
- At E^F its level may acquire D_F²; those primes split in K, so its required Heegner and period comparison conditions still hold.

Proof route:

1. Import the MSD/Rankin interpolation carriers; compare at finite characters of positive p-power conductor using complex quadratic factorization and the Gauss-sum identity.
2. Match the Petersson integral to the Néron period via deg(π_E)c_E² and check the real-component factor is a power of 2, hence a p-adic unit.
3. Use uniqueness of the bounded p-adic measure/interpolation on the stated domain, not bare Zariski density.
4. Repeat for E^F and match every tame Euler factor and coefficient norm.

Imports: `AutomorphicCongruences:L5b/four-twist-lattice-dictionary`, `ModularSymbolsPadicLFunctions:L1`, `ModularSymbolsPadicLFunctions:L2`, `AutomorphicPadicLFunctions:L5`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-9`, `mathlib:Ideal.span_singleton_mul_left_unit`.

Acceptance checks:

- There is no assumed canonical-period-over-F equals period-over-Q squared identity.
- Do not use a character interpolation identity before checking the functions lie in the same bounded/integral function space.

Sources: [CGS, Definition 1.2.2, Remark 1.2.3, Proposition 1.2.4 and proof, pp.7–8](https://arxiv.org/pdf/2303.04373v1) — The actual Perrin–Riou to MSD normalization and cyclotomic product.; [BCS, Proof of Theorem 1.1.2, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Apply analytic factorization to both quadratic-twist pairs.

### 5. The early four-factor cyclotomic bound

Named declaration: `fourFactorProductBound` (`AutomorphicCongruences:L5b/four-factor-product-bound`).

For the auxiliary K,F supplied by L5a’s Lemma 5.2.3 contract, project its early integral ordinary product bound (L_PR(E/K)L_PR(E^F/K))⊇char(X_E/K∞)char(X_EF/K∞) to Λ_Q. The analytic factorization, Selmer decompositions and correctly oriented characteristic-control comparisons give ∏_{χ∈{1,η_K,η_F,η_Kη_F}}(L_MSD(E^χ/Q))⊇∏_χ char(X_Eχ/Q∞). The same assertion holds after p-inversion. This is the only reverse input used for factor separation; it is not an individual reverse inequality.

Hypotheses:

- All of L5a’s selected-field, minimality, μ and integral product-bound conditions are proved in that supplier; the Fourier/period/Euler normalization is matched here.
- The four cyclotomic duals are finite torsion and the four functions nonzero; the control and analytic comparison targets apply to E and E^F.

Proof route:

1. Import the early Proposition 5.2.1 bound, independently of the Heegner endpoint; the μ upgrade belongs to L5a.
2. Extend the product ideal through π+ using Ideal.map_mul, then apply the analytic identity.
3. Use the two Selmer projection inequalities and quadratic multiplicativity to reach the four-factor characteristic product on the same ring.

Imports: `AutomorphicCongruences:L5a`, `AutomorphicCongruences:L5b/cyclotomic-control`, `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`, `mathlib:Ideal.map_mul`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

Acceptance checks:

- HE.8b, Theorem 4.2.1 and the anticyclotomic main conjectures are not prerequisites.
- Record the product orientation: characteristic product is contained in the analytic product ideal.

Sources: [BCS, Proposition 5.2.1, pp.11–12; proof of Theorem 1.1.2, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The early product bound and its four-factor cyclotomic projection.

### 6. The rank-one image condition survives quadratic twisting

Named declaration: `rankOneImageQuadraticTwist` (`AutomorphicCongruences:L5b/rank-one-image-twist`).

Let T=T_p(E), p odd, and σ∈G_Q(μ_p∞) satisfy T/(σ−1)T≅Z_p as Z_p-modules. Then every quadratic twist T⊗χ satisfies the same condition for some element of G_Q(μ_p∞). If χ(σ)=1 use σ. If χ(σ)=−1 use σ²: det ρ(σ)=1, the free rank-one cokernel forces ρ(σ) to be a nontrivial unipotent with unit off-diagonal in a suitable integral basis, and σ²−1 doubles that unit. The factor 2 is a unit. Hence one exact (im) hypothesis on E suffices for all four twists; residual surjectivity is only a stronger sufficient condition.

Hypotheses:

- The determinant is the cyclotomic character, so it equals 1 on the chosen group.
- T is free rank two over Z_p; the cokernel is free of rank one, rather than merely having rank one after tensoring with Q_p.
- χ takes values ±1 and p>2.

Proof route:

1. Use the direct-summand kernel/image consequence of the free cokernel and determinant one to choose an integral unipotent basis.
2. Compute (1+N)²−1=2N, N²=0, on the same lattice.
3. Use χ(σ²)=1 and invertibility of 2 to preserve the integral cokernel; pass through the existing twist-lattice equivalence.

Imports: `AutomorphicCongruences:L5b/four-twist-lattice-dictionary`, `KatoEulerSystems:L4`.

Acceptance checks:

- The matrix [[1,p],[0,1]] has cokernel Z_p⊕Z/p and fails (im).
- For p=2 the squaring argument loses the unit and the target is not asserted.

Sources: [BCS, Theorem 1.1.2(b), p.2; proof, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The exact image condition used for the integral four-twist argument.; [Kato, Theorem 17.4, p.273](https://www.numdam.org/item/AST_2004__295__117_0.pdf) — The integral strengthening needs an integral lattice condition, not just rational rank.

### 7. Kato’s four ordinary bounds with period and image conditions

Named declaration: `fourTwistKatoBound` (`AutomorphicCongruences:L5b/four-twist-kato-bound`).

For each E^χ in the selected set of four twists, apply the ordinary cyclotomic torsion and Euler-system bound on T_p(E^χ), with the MSD/Néron period normalization: (L_MSD(E^χ/Q))⊂char(X_Eχ/Q∞) after inverting p. Under (im) on E, use its twist stability and the exact strengthened Kato elliptic contract to obtain all four inclusions integrally. The general non-CM modular-form 17.4(3) hypotheses and the elliptic (im) refinement are distinguished. If the endpoint includes CM curves, import their separately proved rational elliptic-unit bound; never apply a non-CM theorem to them.

Hypotheses:

- p>3 good ordinary, residual E[p] irreducible; the four quadratic characters are unramified at p, so each twist is good ordinary and residual irreducible.
- Nonzero primitive analytic functions, compatible dual-form lattices and good period generators.
- Integral version: exact (im) on the original Tate lattice, not an assertion that every irreducible residual representation is surjective.

Proof route:

1. Check the four residual representations remain irreducible under scalar quadratic twisting and the actual integral Tate lattices match.
2. Invoke the rational ordinary supplier, including the separate CM branch if applicable.
3. For the integral case invoke the (im) refinement and the rank-one-twist theorem; preserve every period, bad-prime Euler factor and local-condition comparison.
4. Use the analytic nonvanishing supplier before factoring characteristic generators.

Imports: `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `AutomorphicCongruences:L5b/rank-one-image-twist`, `AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`.

Acceptance checks:

- No HE.8b or completed main-conjecture equality is used as an upper bound.
- The existing Kato packet does not yet prove the exact elliptic (im)+MSD refinement; the precise request is retained.

Sources: [Kato, Theorem 17.4 and §17.5, pp.273–274; Theorem 12.5, pp.211–212](https://www.numdam.org/item/AST_2004__295__117_0.pdf) — Rational torsion/divisibility and qualified integral hypotheses.; [BCS, Theorem 1.1.2 and its proof, pp.2,12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The elliptic (im) refinement used on all four factors.

### 8. Separating four characteristic factors

Named declaration: `factorSeparation` (`AutomorphicCongruences:L5b/factor-separation`).

Over A=O[[Γ_Q]] or A[1/p], a noetherian normal UFD, let all X_χ be finite torsion, J_χ=char_A(X_χ) nonzero principal, and L_χ nonzero. Suppose (L_χ)⊂J_χ separately for each χ and ∏J_χ⊂(∏L_χ). Then J_χ=(L_χ) for every χ. At each height-one prime, each ord(L_χ)−ord(J_χ) is nonnegative and their sum is nonpositive; hence each is zero. Equivalently choose generators j_χ, write L_χ=j_χa_χ and conclude ∏a_χ is a unit, so each a_χ is a unit. This argument needs every individual upper inequality; the product bound alone cannot separate factors.

Hypotheses:

- All four factors lie in the same domain and use the same integral/rational coefficient extension and primitive normalizations.
- Torsion and nonvanishing have already been proved; principal characteristic ideals are supplied by the Iwasawa algebra owner.
- The integral claim uses integral inequalities at the prime (p) too; rational equality has no information there.

Proof route:

1. Import characteristic ideals, height-one lengths and coefficient descent from the owner.
2. Choose nonzero generators or work with the associated finite effective divisors; orient the inequalities correctly.
3. Apply the four individual Kato inequalities and early product inequality; use normality/principality to conclude equality of ideals.

Imports: `AutomorphicCongruences:L5b/four-factor-product-bound`, `AutomorphicCongruences:L5b/four-twist-kato-bound`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-9`.

Acceptance checks:

- A rational equality cannot be upgraded integrally without eliminating the p-primary defect.
- Test a product with factors p and p^−1 over the fraction field: without individual upper bounds a product equality gives no integral factor equality.

Sources: [BCS, Proof of Theorem 1.1.2, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Nonnegative defects and factorwise equality.

### 9. BCS’s rational cyclotomic theorem

Named declaration: `rationalCyclotomicEndpoint` (`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`).

For E/Q and good ordinary p>3 with E[p] irreducible as a G_Q-module, X_ord(E/Q∞) is finite Λ_Q-torsion and char_ΛQ(X)Λ_Q[1/p]=(L_p(E/Q))Λ_Q[1/p]. Here L_p is the MSD function with the actual Néron periods, and X is the Pontryagin dual of the classical p-primary Selmer group. Apply the auxiliary-field existence supplied by L5a, the four-factor product bound and Kato’s rational individual inequalities, then select the trivial character factor. No residual surjectivity or multiplicative-reduction prime is added.

Hypotheses:

- Precisely p>3 good ordinary and residual irreducibility, plus the verified supplier conclusions used to construct the auxiliary fields and compare classical/ordinary Selmer conventions.
- CM and non-CM curves use the correct separately owned upper-bound route.

Proof route:

1. Choose K,F by the supplier’s existence theorem and verify all field/local hypotheses, including the new ramified K-prime refinement.
2. Apply factor separation over Λ_Q[1/p] to the four finite torsion cyclotomic duals.
3. Use the actual classical-Selmer versus ordinary-Galois-Selmer comparison, with primitive local conditions; descend coefficient scalars if enlarged.
4. Export the equality to ModularIwasawaMainConjectures:L3, never import that consumer’s result back.

Imports: `AutomorphicCongruences:L5b/factor-separation`, `AutomorphicCongruences:L5a`, `SelmerIwasawaCohomology:L2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-9`.

Acceptance checks:

- It includes p=5; p=3 and supersingular reduction are outside scope.
- The statement remains rational even if an integral analytic object is separately available.

Sources: [BCS, Theorem 1.1.2(a), p.2; proof, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — The endpoint under irreducibility, after p-inversion.

### 10. BCS’s integral rank-one-image refinement

Named declaration: `integralCyclotomicEndpoint` (`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`).

Under the rational endpoint hypotheses and (im): there exists σ∈G_Q(μ_p∞) with T_p(E)/(σ−1)T_p(E)≅Z_p as Z_p-modules, prove char_ΛQ(X_ord(E/Q∞))=(L_p(E/Q)) in Λ_Q itself. Apply the twist-stable (im) hypothesis and the integral Kato inequalities to all four factors, then separate them using the integral early product bound. Every p-power lattice, Euler and period discrepancy has been accounted for before equality. Residual surjectivity is not substituted for (im); its use is only as a sufficient implication if separately proved.

Hypotheses:

- Exactly the preceding rational endpoint hypotheses and the free rank-one quotient condition on the integral Tate lattice.
- The early product bound, analytic factorization and all four Kato bounds are integral on the same lattice and Néron-normalized functions.

Proof route:

1. Use rankOneImageQuadraticTwist, not rational lattice independence, for the four integral upper bounds.
2. Apply factorSeparation in Λ_Q, including the height-one prime (p).
3. Descend any coefficient extension by the faithful characteristic-ideal/analytic comparison supplier; export precisely this hypothesis-bearing endpoint to the consumer.

Imports: `AutomorphicCongruences:L5b/rank-one-image-twist`, `AutomorphicCongruences:L5b/factor-separation`, `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`.

Acceptance checks:

- A cokernel with nonzero finite p-torsion fails the hypothesis.
- The theorem does not assume a canonical Hilbert period is the square of an elliptic period.

Sources: [BCS, Theorem 1.1.2(b), p.2; proof, p.12](https://web.math.ucsb.edu/~castella/BCS-print.pdf) — Integral equality under the exact image condition.

## Supplier refinements and mathematical closure

Every chain ends at a pinned declaration, a named supplier node, a requested
supplier stage or an explicit gap. Both stages have coverage **planned**,
with no assertion of closure. The requested interfaces must be proved before
the endpoint targets can be treated as results of a formal library.

The accepted P7 pseudo-coherent residual-Nakayama node is used only for a
comparison cone satisfying its finiteness conditions. The accepted R03.6
support-base-change node is used only for finite modules. Neither supplies
ordinary control or a canonical-period identity. The PadicMeasures
characteristic-ideal, multiplicativity and coefficient-norm nodes provide
the abstract ideal theory; their existence does not prove any analytic or
Selmer comparison in this part.

**Exact minimal theorem and period suppliers.** R21.4’s written nodes do not yet export Fujiwara 11.1/11.2/11.5 in this exact ordinary Hilbert type. R04.6 must supply minimal lift and base-change minimality, and APL L3h must supply the matching quaternionic period/primitivity instance. Requests identify those mathematical targets; this packet does not redevelop their generic theories.

**Integral fixed-form analytic/control refinements.** Wan 82 is integral for the imprimitive normalization with all bad primes removed; arbitrary Σ is only fractional. The BCS fixed primitive integral landing, coefficient/ordinary Selmer control and Euler reinstatement need the exact requested maps. Bare interpolation, density, finite flatness or the Katz carrier do not supply them.

**Torsion and local convention bridge.** Wan 101 uses characteristic ideal zero for a non-torsion dual. That convention is separated from genuine torsion characteristic ideals. The Selmer supplier must prove finiteness/torsion for the quartic and two-variable modules using compatible early Kato/control inputs, and compare local-trivial versus inertia Selmer conventions before cancellation.

**Exact elliptic image refinement and CM upper bound.** The existing Kato packet retains a general large-image condition and p-power error; it does not yet supply the BCS (im)+MSD normalized integral export. Its separate CM early elliptic-unit input is also an explicit request. Endpoints here are planning targets contingent on those proved supplier results, not claims that the gaps are already filled.

**Full arithmetic signatures.** The pinned libraries lack Hilbert/ordinary GU(2,2) form carriers, continuous Selmer/Iwasawa arithmetic objects and the named analytic functions. The suggested file elaborates concrete ideal, matrix, kernel and algebraic reduction interfaces; full arithmetic targets remain clearly marked mathematical comments with omitted conditions. No opaque proposition fields, fake expected-conclusion structures or formalization claims are used.

The exact supplier contracts are:

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`: Supply Fujiwara v2 Definition 6.11, Theorems 11.1/11.2 and Corollary 11.5 for the actual nearly ordinary minimal totally real problem: determinant/twist type, local flat restrictions, Hypotheses 6.7 and applicable 5.9, p=5 exception, free quaternionic/Hilbert module, finite flat Hida lift and Gorenstein duality. Existing nice-prime Skinner–Wiles nodes are insufficient for this exact contract. Also supply the ordinary lifting/CAP alternative of Wan 9.2 condition (10).
- `GlobalGaloisDeformations:R04.6`: Export the exact minimal modular lift for the selected residual elliptic representation and its quadratic base change; prove all six Fujiwara 6.11 clauses under the specified local splitting pattern, with determinant/Teichmuller types fixed. Distinguish existence, modularity, and preservation of local minimality.
- `PadicFamilies:L5`: Use L5/totally-real-weight-algebra, L5/hida-freeness, L5/hida-hecke-finite, L5/hida-control-nearly-ordinary and L5/algebraic-primes-dense. Extend their exact contract to Wan’s parallel ordinary Hilbert branch through g_F, with its integral eigenlattice and fixed arithmetic specialization. Supply ordinary GU(2,2) form/boundary control with compatible coefficient change, rather than merely GL2 eigenforms.
- `AutomorphicPadicLFunctions:L4`: Provide Wan 2015 §§4–7 local sections, pullback/doubling, GU(2,2)/F ordinary module and q-expansion/Siegel-operator interface, Theorems 82/88 with all cusp and degenerate coefficients, correct ψ, ξ, α_p and period normalization. L3’s Katz object alone is not the Hilbert Rankin function. Analytic carrier/existence is owned here; L5w proves the source-specific congruence and arithmetic compatibility.
- `AutomorphicPadicLFunctions:L3h`: Supply Hung’s theorem used in Wan 86 and the exact quaternionic/canonical-period comparison domain, primitive NV1/NV2 for p≥5 including the empty n− degree-two case. Supply the CM auxiliary-character unit value and Fourier–Jacobi pairing inputs of Wan 96; retain nonsplit imprimitive Euler μ terms.
- `AutomorphicPadicLFunctions:L3`: Provide the abelian CM-character p-adic L-function and canonical congruence-period unit comparison used in Wan 88 and 96; the argument needs the specified character infinity type, conductors and Euler units, not just existence of a Katz measure.
- `AutomorphicPadicLFunctions:L5`: Supply the actual Perrin–Riou/Hida Rankin normalization on the elliptic cyclotomic line, matching CGS 1.2.2–1.2.4, and the MSD comparison for both E and E^F. Track Manin constants, modular degrees, Néron periods, p unit roots, discriminant character units and primitive local Euler factors.
- `AutomorphicCongruences:L0`: Supply the specialized primitive/inertia/local-trivial Selmer comparison with explicit local modules and Euler factors, the period/congruence-line match, local ordinary extension-to-Selmer bridge, and finite Fitting-to-characteristic control. Generic determinant/Ribet and ideal constructions remain IHG-owned.
- `AutomorphicCongruences:L1`: Supply the integral ordinary GU(2,2) boundary exact sequence and cuspidal lifting theorem used by Wan 27/97 over F, with flatness and all-cusp q-expansion checks. Import the geometric carrier and local doubling machinery from APL L4 rather than reconstruct it.
- `IntegralHeckeAndGaloisDeterminants:IHG.2`: Import the current upstream roadmap’s actual integral Hecke images and localized reduced cuspidal Hecke algebra, with the eigenvalue polynomial/central/U_p dictionary used for the Wan quotient. The atlas snapshot is not evidence that this roadmap needs replanning.
- `IntegralHeckeAndGaloisDeterminants:IHG.4`: Import current upstream determinant interpolation with the actual rank-four GU(2,2) Hecke polynomial normalization, coefficient ring and ramification set; obtain the integral trace/determinant data needed for Wan 9.2.
- `IntegralHeckeAndGaloisDeterminants:IHG.6`: Import current upstream integral Ribet/Fitting bound and congruence-line algebra; instantiate Wan’s polarized 1+2+1 data and all ten source hypotheses. A determinant is not replaced by a characteristic-zero trace-only stand-in.
- `DirichletPadicLFunctions:L4`: Supply the totally real abelian-character main-conjecture bound used by Wan 100 to show the scalar Selmer characteristic ideal has zero valuation at non-pulled-back primes; match the character χ′/χ, lattice and local conditions.
- `SelmerIwasawaCohomology:L4`: Provide the exact Poitou–Tate primitive/Σ-imprimitive sequence of Wan 101, local H¹_f characteristic Euler factors, and vanishing of the compact global term under stated torsion/torsion-free hypotheses.
- `SelmerIwasawaCohomology:L3`: In addition to the existing kernel-control and derived-control nodes, prove the precise ordinary coefficient specialization, cyclotomic quotient and torsion lifting used by Wan/BCS/SU, including localization-image, local Euler and Tor terms. A nonzero characteristic ideal requires torsion; Wan 101’s zero-extended convention does not prove it. Supply the quartic-CM torsion verification from early Kato bounds and compatible quadratic descent without using the final endpoint.
- `SelmerIwasawaCohomology:L2`: Supply the integral p-divisible Tate-module and ordinary-filtration comparison under unramified quadratic twisting, and the actual classical elliptic p-primary Selmer versus BCS ordinary Selmer identification, including finite/inertia/local-trivial away-p conventions.
- `ModularSymbolsPadicLFunctions:L1`: Supply MSD p-adic functions with the precise Néron periods for E and its three twists, modular parametrization/Manin-constant comparison of CGS 1.2.3, and good-period alignment with Kato’s dual-form lattice.
- `ModularSymbolsPadicLFunctions:L2`: Supply ordinary refinement/interpolation with the chosen unit root and finite-character normalization, plus the uniqueness principle in the bounded measure space used for CGS cyclotomic factorization.
- `KatoEulerSystems:L4`: Refine the existing ordinary-selmer-divisibility and elliptic-ordinary-and-multiplicative-divisibility exports to the exact BCS elliptic (im) condition on T_p(E), the MSD/Néron periods and primitive ordinary Selmer group: torsion and (L)⊂char X rationally, and integrally under (im), for all four quadratic twists. The existing general SL2-image criterion and error p^t are not silently identified with (im). Export the separately proved CM rational elliptic-unit case for the elliptic endpoint; do not apply the non-CM theorem there. Nonvanishing is provided by the existing analytic-twist-nonvanishing node.
- `AutomorphicCongruences:L5a`: Supply the EARLY integral ordinary product inequality of BCS Proposition 5.2.1 and auxiliary-field existence of Lemma 5.2.3, including prime-to-pN discriminants, Heegner/split conditions, residual restrictions, minimality, μ upgrade, period/Euler/lattice comparisons and a new ramified K-prime outside D_F to ensure narrow Δ+. It depends on L5w’s general quartic engine and conditional hypothesis-discharge theorem, not on L5b’s endpoint or HE.8b. Export torsion/nonzero functions and actual coefficient maps. Own the quartic-to-K specialization Lemmas 5.1.1–5.1.2 here, not a duplicate in L5b.
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`: Import the existing torsion/Tate-module construction, retaining the integral inverse limit, twist-equivariant transition maps and Weil-pairing determinant; no new elliptic geometry roadmap is planned.
- `tauceti:TauCetiRoadmap/Multiquadratic#layer-1-the-prime-splitting-law`: Import the existing quadratic/biquadratic field and character interface for F, K and M=FK, and use the current Tau Ceti multiquadratic library; no field-compositum construction is replanned.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`: Import the existing continuous Shapiro and coinduction interface on the actual Tate lattice and local restriction maps; this is an existing upstream contract, not a request to replan it.

## Source checks requiring independent verification

The following are discrepancies found by direct comparison of source versions. Their descriptions are paraphrases. The indicated corrections supply the contracts used here; independent source verification remains an acceptance condition. No published correction was found in the searches recorded in the packet.

**E1 — misprint (arXiv:math/0602606v2, §3.1, p.16, exceptional type 0E; compared with BCS Hypothesis 3.1.1(H3), published p.8).** The description of 0E uses absolutely irreducible inertia and then describes the same rank-two representation as induced from a character of an unramified quadratic extension. For an unramified quadratic extension H⊂G, inertia I lies inside H. Restricting Ind_H^G ψ to I gives ψ|_I⊕ψ^Frob|_I, hence a direct sum of two characters over the algebraic closure. The literal irreducible-inertia phrase contradicts the induced description on the same page. This is an internal source inconsistency, not evidence that BCS H3 is wrong. In the induced exceptional type, inertia is absolutely reducible. Retain absolute irreducibility of the whole local representation, q_v≡−1, and the induced-character description. BCS H3 uses this reducible-inertia condition and excludes that exceptional type. Effect recorded: the proof.

**E2 — gap (Published §2.1 condition Δ, p.7, and Theorem 3.2.1, pp.7–8; arXiv v2 §2.1 p.6).** Δ excludes M from the Hilbert class field H_F, named without the narrow qualification, and this is used to invoke Wan’s theorem. Wan §1, p.1 explicitly uses the narrow Hilbert class field; the ordinary and narrow Hilbert class fields can differ over a totally real field. Noncontainment in the smaller ordinary field does not imply noncontainment in the narrow field. The selected finite-ramification condition gives a valid common hypothesis. Use the narrow Hilbert class field condition Δ+ required by Wan §1. For the selected M=FK choose a K-ramified prime outside D_F, proving finite ramification of M/F and hence excluding containment in the narrow Hilbert class field. Retain the stronger condition in the general quartic engine. Effect recorded: the proof.

**E3 — misprint (Published proof of Proposition 5.2.1, p.11; arXiv v2 p.10).** The minimal-lift base-change step cites Theorem 103 in Wan’s 2021 paper. Wan 2015 has precisely Theorem 103 and that quadratic base-change minimal-lift argument. The cited 2021 paper is the separate Heegner-point Kolyvagin-system paper, not the Hilbert paper. The intended locator is Wan’s 2015 Hilbert paper, Theorem 103 and proof, pp.91–92. Effect recorded: nothing.

**E4 — misprint (Published proof of Lemma 5.1.2, p.11; arXiv v2 p.9).** The interpolation comparison cites Proposition 84 of the 2021 Wan paper. Wan 2015 Proposition 84 is the directly read interpolation comparison. The 2021 reference is the Heegner-point Kolyvagin-system paper. BCS itself cites the same comparison correctly in the note after Conjecture 4.1.1. Use Wan 2015, Proposition 84 and its proof, pp.68–69, comparing Hida and Wan on the parallel arithmetic subfamily with the stated local Euler factors. Effect recorded: nothing.

**E5 — gap (Published Theorem 8, final local bullet, p.7; compared with Fujiwara v2 §3.1, p.16 and BCS H3, published p.8).** The local q_v condition in Theorem 8 applies to absolutely irreducible inertia. Fujiwara’s induced representation has reducible inertia by restriction to the index-two unramified subgroup. Wan’s printed antecedent does not test those representations. Without a corrected interpretation or a separate no-0E proof, the stated route to the requisite Hecke/freeness comparison is not justified by that local bullet. No counterexample to the Gorenstein conclusion is asserted. The BCS selected-field q_v argument checks both tests and avoids the ambiguity. For the exact Hilbert/quaternionic Hecke comparison also exclude the actual induced exceptional type 0E: absolutely irreducible local representation with absolutely reducible inertia and q_v≡−1. Verify both the printed Wan condition and the corrected exceptional-type exclusion in the selected instance; use Fujiwara’s full exact theorem rather than infer this exclusion from the printed condition alone. Effect recorded: the proof.

The inertia discrepancies must be read together. Fujiwara's induced
representation restricts to the two character lines on inertia; BCS H3 is
consistent with that description. Wan's printed irreducible-inertia bullet
is a different test. This plan verifies both the literal bullet and the
actual exceptional-type exclusion. The selected F changes an inert
ℓ≡−1 to residue cardinality ℓ²≡1 and therefore discharges both.

The Hilbert-class-field discrepancy concerns the ordinary versus narrow
field. A new finite ramified K-prime outside D_F makes M/F ramified and
discharges the stronger narrow condition. Existence of this refinement
belongs to the auxiliary-field supplier. E3 and E4 correct source locators
and have no mathematical effect.

## Sources and versions

All mathematical statements above are in this document's own words. Page
numbers for BCS refer to the published 15-page copy; the 12-page arXiv v2
is explicitly distinguished. Wan's numbers use the published 95-page PDF.
Fujiwara's numbers refer to arXiv v2. The publicly accessible Skinner–Urban
author manuscript uses section-based numbers: Lemma 3.1.5, Lemma 3.2.5,
Proposition 3.2.8, Corollary 3.2.9 and Proposition 3.2.11. BCS cites the
published control results as Propositions 3.6/3.7/3.9 and Corollary 3.8;
this plan uses the directly read manuscript locators and does not identify
the two numberings by guesswork. The analytic CGS proposition is used
independently of that paper's Eisenstein-prime main-conjecture hypotheses.

- [Ashay Burungale, Francesc Castella, Christopher Skinner, *Base Change and Iwasawa Main Conjectures for GL2*](https://web.math.ucsb.edu/~castella/BCS-print.pdf). IMRN 2025(8), rnaf082, published author-hosted copy, 15 pages. Read 2026-10-11. Sections checked: §1.1, pp.1–2; §§2–3, pp.5–8; §4.1, pp.8–9 (ownership comparison only); §§5.1–5.2, pp.10–12; references pp.14–15.
- [Ashay Burungale, Francesc Castella, Christopher Skinner, *Base change and Iwasawa Main Conjectures for GL2*](https://arxiv.org/pdf/2405.00270v2). arXiv:2405.00270v2, 18 March 2025, 12 pages. Read 2026-10-11. Sections checked: §§1–5, pp.1–11; references pp.11–12; compared §§3 and 5 with the published copy.
- [Xin Wan, *The Iwasawa main conjecture for Hilbert modular forms*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf). Forum of Mathematics, Sigma 3 (2015), e18, 95 pages, published open-access PDF. Read 2026-10-11. Sections checked: §1, pp.1–7; §3.4–3.5, pp.22–24, Theorem 27 and q-expansion control; §§4.1 and 6–7, local section and interpolation contracts, pp.24–25, 53–72; §8, pp.73–81; §§9.1–9.3, pp.81–89; Theorem 103 and proof, pp.91–92.
- [Kazuhiro Fujiwara, *Deformation rings and Hecke algebras in the totally real case*](https://arxiv.org/pdf/math/0602606v2). arXiv:math/0602606v2, 25 July 2006, manuscript pagination. Read 2026-10-11. Sections checked: §3.1, pp.16–18; Hypothesis 5.9, p.45; §6.2, pp.52–57, Definition 6.11; Proposition 9.8, p.83; §11, pp.95–97, Theorems 11.1–11.2 and Corollary 11.5.
- [Francesc Castella, Giada Grossi, Christopher Skinner, *Mazur’s main conjecture at Eisenstein primes*](https://arxiv.org/pdf/2303.04373v1). arXiv:2303.04373v1, 8 March 2023, 33 pages; only the independently applicable analytic factorization is used. Read 2026-10-11. Sections checked: §§1.1–1.2, pp.6–8, Proposition 1.2.4; no Eisenstein main-conjecture theorem imported.
- [Christopher Skinner, Eric Urban, *The Iwasawa main conjectures for GL2*](https://www.math.columbia.edu/~urban/eurp/MC.pdf). Author preprint hosted at Columbia, 226 PDF pages; numbering differs from Inventiones 195 (2014). Read 2026-10-11. Sections checked: §§3.1–3.2, manuscript pp.16–25, Lemmas 3.1.5 and 3.2.5, Propositions 3.2.8 and 3.2.11, Corollary 3.2.9; these are the control statements cited by BCS as published Propositions 3.6/3.7/3.9 and Corollary 3.8.
- [Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), pp.117–290, published Numdam scan. Read 2026-10-11. Sections checked: Theorem 12.5 and §12.8, pp.211–213; §17, Theorem 17.4 and good periods in §17.5, pp.273–274.
