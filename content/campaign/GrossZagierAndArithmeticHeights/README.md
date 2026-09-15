# Gross–Zagier formulas and arithmetic heights

Construct the reusable height, toric-period and arithmetic-intersection theory behind Gross–Zagier, with the general quaternionic Shimura-curve formula over totally real fields as a main comparison theorem. The geometric scope is curves and abelian varieties parametrized by them, not an asserted general arithmetic Gan–Gross–Prasad theorem in higher dimension.

## Canonical owners and conventions

EllipticCurves Layer 6 already constructs the elliptic canonical height, pairing and regulator, and Layer 7 the rational elliptic BSD quotient. [ArakelovGeometryAndAbelianHeights](../ArakelovGeometryAndAbelianHeights/README.md) owns arithmetic degrees and stable Faltings heights; these are heights of varieties, not the point heights constructed here. Reuse its hermitian line bundles. JacobianChallenge and [AbelianSchemesAndArithmeticModuli](../AbelianSchemesAndArithmeticModuli/README.md) own Picard, dual abelian varieties, polarizations and Poincaré bundles. [NeronModelsAndSemistableAbelianVarieties](../NeronModelsAndSemistableAbelianVarieties/README.md) owns regular/semistable degeneration and component groups. [HeegnerPointEulerSystems](../HeegnerPointEulerSystems/README.md) owns CM points, reciprocity and ring-class variation; this roadmap owns their height identities. Generic smooth representations, local factors, automorphic forms and transfer are imported, not rebuilt.

Use a totally real field F, a CM quadratic extension K/F, a simple abelian variety A/F parametrized by the relevant Shimura tower, its endomorphism field M and a finite-order character χ with values in a finite extension of M. Retain the central-character condition ω_A χ|A_F×=1. The general formula pairs A with its dual, and χ with χ⁻¹; it is not initially a scalar self-height formula for an arbitrary GL₂ representation. Specify embeddings of coefficient fields and all archimedean and finite measures.

The corrected YZZ convention takes local epsilon factors from the **base-change** L-function over K. Its local sign test is ε(1/2,π_v,χ_v)=χ_v(−1)ε(B_v), without an extra η_v(−1). A Rankin–Selberg-over-F convention has a comparison factor and must be explicitly translated. The relevant torus measure has global volume 2L(1,η); it must not be silently identified with another Tamagawa normalization. Apply the YZZ erratum, especially the corrections to Theorem 1.3, measures, local L-shift, and cycle multiplicities.

<a id="gz-0"></a>
## GZ.0. Normalization and change-of-convention interfaces

**Milestone:** `GZ.0`

Fix the relation between motivic center s=1 and unitary automorphic center s=1/2, completed versus finite L-functions, trace versus normalized average of CM orbits, and geometric Artin reciprocity. Construct explicit comparison maps for the choices of volume, differential, polarization, Haar measure and coefficient embedding. Prove the rescaling formulas for every side of a period or height identity. For a bilinear pairing scaled by c, prove that its rank-r Gram determinant scales by c^r.

The existing elliptic height is normalized using the logarithmic x-height, twice one common convention. Determine the induced bilinear-pairing convention from its actual definition and prove its comparison with each source's pairing. Never infer a regulator factor merely from the name “Néron–Tate”. Keep powers of two visible, especially when a consumer studies the 2-part of BSD. Fix the relation of real-component periods, full real period and the possible c∞ factor to avoid counting components twice.

**Dependencies:** EllipticCurves Layers 6–7; ArakelovGeometryAndAbelianHeights R35.1–R35.2; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3.

<a id="gz-1"></a>
## GZ.1. Point heights on abelian varieties and the Poincaré pairing

**Milestone:** `GZ.1`

Construct Weil heights for the line bundles used on projective abelian varieties, their bounded-error functoriality and the canonical limit for symmetric bundles. Prove convergence, uniqueness among bounded-error quadratic refinements, addition and multiplication formulas, isogeny pullback, and independence under finite extension with the specified arithmetic-degree normalization. Prove positivity for ample symmetric bundles and characterize the zero locus as torsion over a number field using Northcott and finite generation. Construct the bilinear height A(F̄)×A∨(F̄)→ℝ from the Poincaré biextension, with adjunction under homomorphisms.

Pass to rational points modulo torsion and scalar extensions. For strict GL₂-type A, construct the M-linear pairing valued in M⊗ℚℝ whose trace is the rational pairing, and verify dual-endomorphism compatibility. Compare the dimension-one instance with EllipticCurves' existing height rather than defining a second public elliptic height. General Mordell–Weil or projective-height lemmas absent from the imported owners are construction targets here, proved through weak descent and the height argument, not assumed positivity axioms.

**Dependencies:** GZ.0; AbelianSchemesAndArithmeticModuli A1–A3; ArithmeticHeights #287 for existing general height APIs; EllipticCurves Layer 6 for its specialization.

<a id="gz-2"></a>
## GZ.2. Admissible pairings on arithmetic surfaces

**Milestone:** `GZ.2`

For a smooth proper geometrically connected curve over a number field, construct the arithmetic intersection pairing from finite-place intersection lengths and archimedean Green functions. Include regular models, vertical correction divisors, intersection matrices and their kernel, extension after semistable base change, projection formulas, and independence of auxiliary disjoint representatives. At nonarchimedean semistable places construct the reduction graph, Laplacian, admissible measure and Green kernel; show agreement with model intersection after the vertical correction. At infinite places prove existence and normalization of the Green kernel and the required analytic estimates.

Prove the Faltings–Hriljac comparison for degree-zero divisors with the canonical Jacobian pairing, including the sign and scalar fixed in GZ.0. Handle rational degree-one Hodge classes and self-intersections by a genuine regularization/intersection construction. The degenerate intersection matrix must not be inverted as an ordinary nonsingular matrix. Export local height decomposition, base-change and correspondence-adjunction APIs; the Faltings height of an abelian variety remains the R35 owner.

**Dependencies:** GZ.1; NeronModelsAndSemistableAbelianVarieties R11.3–R11.4; ArakelovGeometryAndAbelianHeights R35.1; ComplexComparisonPartII; JacobianChallenge.

<a id="gz-3"></a>
## GZ.3. Rational automorphic realizations and modular degrees

**Milestone:** `GZ.3`

On the existing quaternionic Shimura curves X_U, construct the degree-one normalized Hodge class ξ_U and its compatibility with level maps. Form the rational space of ξ-normalized maps X_U→A, its direct limit under level pullback and commuting endomorphism/Hecke actions. Identify it with the representation supplied by the GL₂ transfer owner; prove the precise strict-GL₂-type and field-of-definition statements under the geometric parametrization hypotheses. No assertion that all abelian varieties are modular is made.

Construct the pairing of the realization for A and A∨ by composing the induced homomorphisms of Jacobians and dividing by the specified curve volume. Prove independence of level, adjunction and perfectness, then compare with the Petersson pairing and local tensor factors. In dimension one identify the composition with the degree of the parametrization. Construct differential pullbacks and Manin constants as comparison quantities with exact isogeny functoriality; never assume the Manin constant is universally one.

**Dependencies:** GZ.0; HilbertModularVarietiesAndShimuraCurves R18.1–R18.4; ModularCurvesPartII R14.6; GL2AutomorphicRepresentationsAndTransfer R17.1–R17.3; AbelianSchemesAndArithmeticModuli A2/A6.

<a id="gz-4"></a>
## GZ.4. Local toric multiplicity one, dichotomy and test vectors

**Milestone:** `GZ.4`

For a quadratic étale algebra K_v/F_v embedded in the split or division quaternion algebra, construct the toric Hom space for an irreducible admissible representation and a character with matching center. Prove Saito–Tunnell multiplicity one and the epsilon dichotomy with GZ.0's convention. Treat split tori and nonsplit tori separately, including archimedean discrete-series contributions. Import the actual local correspondence and epsilon factors from ET.6/AL; the new content is the toric distinction theorem, not local Langlands again.

Construct normalized toric matrix-coefficient integrals, prove convergence or the exact regularization needed, rationality under coefficient embeddings and invariance under rescaling local pairings/measures. Prove the unramified value, so the normalized product is finite. Construct nonzero test vectors using local orders/newvectors and their translates, including conductor mismatch, ramified quadratic extensions and wild/dyadic cases in the general local theorem. The explicit formulas in Cai–Shu–Tian are separate theorems with their conductor hypotheses, not evidence that an unramified newvector always works.

**Dependencies:** GZ.0; SmoothRepresentationsOfLocalGroups SR.2–SR.5; AutomorphicLFunctionsAndLocalFactors AL.1–AL.3; EndoscopicTransferAndUnitaryTraceComparison ET.6; GL2AutomorphicRepresentationsAndTransfer R16.2–R16.3.

<a id="gz-5"></a>
## GZ.5. Coherent theta kernels and the Waldspurger formula

**Milestone:** `GZ.5`

Import Weil representations, adelic covers/splittings, theta kernels and convergence from [MetaplecticAutomorphicForms](../MetaplecticAutomorphicForms/README.md) MP.0–6. Here prove the quaternionic-norm-form specialization with its quadratic-character/measure comparison, coherent theta-lift identities and global toric factorization, distinguishing zero and nonzero cases. General Fourier analysis and the oscillator construction are not duplicated.

Establish the Waldspurger period formula for the stated GL₂/quaternionic toric data. Give the actual pairing identity including adjoint L-value, zeta/eta factors and normalized local toric forms; prove nonvanishing of a suitable toric period exactly under the matching local distinction conditions and nonzero central L-value. Use the coherent formula as a proved ingredient for GZ.6, not an assumed proportionality with an unspecified constant. Export the explicit split, ramified and definite-quaternionic specializations needed by Euler-system and level-raising consumers.

**Dependencies:** GZ.3–GZ.4; AutomorphicFormsOnReductiveGroups AF.1–AF.5; AutomorphicSpectralTheory AS.1–AS.4; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3.

<a id="gz-6"></a>
## GZ.6. Arithmetic generating series and incoherent analytic kernels

**Milestone:** `GZ.6`

Construct the CM divisors/correspondences on X_U from HE.1, their ξ-normalized degree-zero classes and arithmetic extensions. Define special cycles by the actual proper **push-forward with multiplicities**, not their set-theoretic images. Prove pullback/push-forward, Hecke and diagonal identities needed by the generating series. Establish modularity of the curve-level Chow-valued series through the relevant product formula and theta construction; build the needed Chow-divisor operations from existing cycle theory rather than introducing an abstract “modular height series” as a hypothesis.

Construct incoherent Eisenstein/Weil kernels and their central derivatives, normalized local Whittaker terms, holomorphic projection and cuspidal projection. Prove the functional-equation vanishing that permits differentiation and justify interchange of derivatives, sums and integrals. Compare the arithmetic height kernel with the analytic derivative modulo the explicitly identified constant/Eisenstein/old components; prove why those components disappear upon projection to the specified automorphic constituent.

**Dependencies:** GZ.2–GZ.5; HeegnerPointEulerSystems HE.1; ModularCurvesPartII R14.1–R14.4; AutomorphicSpectralTheory AS.3–AS.4.

<a id="gz-7"></a>
## GZ.7. Local arithmetic identities and boundary contributions

**Milestone:** `GZ.7`

Prove the finite-place identities between CM intersection multiplicities and derivatives of local representation densities/Whittaker functions. Separate split, inert and ramified extensions, ordinary, supersingular and superspecial reduction, horizontal intersections and vertical corrections. Build the deformation-length calculations using the existing finite-flat/Serre–Tate theory and the actual local models. Preserve residue characteristic 2 where a claimed general theorem includes it; state narrower explicit formulas separately. Prove the archimedean Green-function identity with convergent spectral expansion and matching normalization.

Handle self-intersection terms and the normalized Hodge divisor, and prove the noncompact modular-curve boundary/cusp corrections rather than applying a compact formula unchanged. The totally definite incoherent tower can be treated by finite-level curves; do not claim its inverse limit is a locally noetherian scheme in the exceptional modular case excluded by the erratum. Assemble local formulas into the global kernel comparison of GZ.6, including local terms supported at conductor and discriminant primes.

**Dependencies:** GZ.2, GZ.4, GZ.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4–R07.6; NeronModelsAndSemistableAbelianVarieties R11.4; HilbertModularVarietiesAndShimuraCurves R18.5 for Čerednik–Drinfeld uniformization and graph/monodromy; ModularCurvesPartII.

<a id="gz-8"></a>
## GZ.8. The general Gross–Zagier pairing and explicit specializations

**Milestone:** `GZ.8`

Prove YZZ's corrected height identity for all factorizable test vectors in the stated quaternionic realization, then extend by bilinearity. State it first as an equality of invariant bilinear forms, so a zero pairing is not placed in a denominator. Identify the L-linear pairing of the χ- and χ⁻¹-Heegner points with the central derivative, adjoint/zeta/eta constants and normalized local forms from GZ.4. Prove the zero case when the toric Hom space vanishes. For matching local signs deduce the global sign −1; for a suitable nonzero test vector obtain non-torsion from a nonzero derivative using GZ.1.

Specialize to X₀(N), a rational elliptic modular quotient, generalized-Heegner quaternionic curves and finite ring-class characters. Prove the explicit formulas of Cai–Shu–Tian under their stated conductor conditions, keeping unit-group factors, discriminants, degrees and Manin constants. Compare trace-normalized and averaged Heegner points and the existing elliptic height. A totally real extension concerns the precise parametrized strict-GL₂-type abelian variety and coefficient-character component, not an unproved universal BSD conclusion over F.

**Dependencies:** GZ.3–GZ.7; HeegnerPointEulerSystems HE.1–HE.3; EllipticCurveModularity R29.5.

<a id="gz-9"></a>
## GZ.9. The split ordinary p-adic logarithm/toric formula

**Milestone:** `GZ.9`

Construct the BDP/Brooks p-adic L-function for the weight-two Heegner setting at a good-reduction prime split in the imaginary quadratic field, with its actual interpolation range, CM periods and removed Euler factors. The ordinary CM geometry does not require the modular eigenform itself to be ordinary. In particular, construct the quaternionic good-supersingular case used in JSW §5.1/Propositions 5.1.6–5.1.7 (Brooks Proposition 8.13), with its squarefree/generalized-Heegner, residual and p-optimal-parametrization hypotheses stated for each comparison. Reuse PadicMeasuresIwasawaAlgebras for measures; invoke PadicFamilies' ordinary projector only in the separate ordinary Hida-family variant. Prove the p-adic Waldspurger identity at the weight-two point outside the interpolation range: the specified specialization equals the square/product of the formal logarithm of the corresponding Heegner point times the explicit local factors. The comparison with the constructed Kummer class uses the Bloch–Kato logarithm and the exact differential normalization.

Construct the quaternionic variant required by JSW, including its integral test-vector and period comparisons. Prove compatibility with isogenies, finite characters and anticyclotomic specialization. Distinguish a squared BDP L-function from its square root. Do not infer a nonzero logarithm from an arbitrary nonzero cohomology class, or identify this logarithm formula with a p-adic height derivative formula. A multiplicative exceptional-zero formula is a separate construction with its Tate-period/L-invariant term whenever consumed by the corrected BSD multiplicative branch; no good-ordinary interpolation argument is reused without proving that extension.

**Dependencies:** GZ.0, GZ.3–GZ.4; HeegnerPointEulerSystems HE.3; PadicFamilies L0–L1 for the ordinary-family variant only; PadicMeasuresIwasawaAlgebras; PadicHodgeRegulators; ModularSymbolsPadicLFunctions; EllipticCurves formal groups.

## Acceptance and sources

Required tests include the F=ℚ modular case with nontrivial torsion and two real components; a compact quaternionic curve with no rational cusp; a nontrivial ring-class character paired with its inverse; a local mismatch with zero toric Hom; a ramified conductor test vector; and an isogeny changing differential/degree. Each must reuse the same public points and pairings as the suppliers.

Primary source contracts: YZZ *The Gross–Zagier Formula on Shimura Curves*, Chapters 1–8 and the linked June 2026 erratum; Gross–Zagier, Chapters II–IV; Zhang, *Heights of Heegner points on Shimura curves*, §§3–7; Conrad, *Gross–Zagier revisited*, §§2–10; Cai–Shu–Tian, Theorems 1.5–1.9 and §§2–3. Wei Zhang's author survey §3.2–3.8 provides a checked formulation of YZZ Theorem 1.2 but its pre-erratum convention must be corrected. Detailed acquisition and exact inspection status are recorded in the reference register; the supplied full YZZ book is available as `references/papers/SUP_YZZ_GrossZagier_2013.pdf`. Its introductory Theorems 1.2–1.3 and the relevant June 2026 erratum passages were checked in this revision; the full book proof is still to be decomposed. Suggested.lean is a prototype file, not a substitute for these constructions.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `GZ.0` | Build one normalization table linking x-height, bilinear pairing, full real period, trace/average, unitary center and torus volume. Prove each rescaling before calculating a BSD p-part. |
| `GZ.4` | Use base-change epsilon factors and the corrected condition epsilon(1/2,pi_v,chi_v)=chi_v(−1)epsilon(B_v); compare any Rankin-over-F convention by its eta_v(−1) factor. |
| `GZ.8` | State YZZ first as an identity of chi/chi-inverse invariant bilinear forms on A and its dual; preserve zero toric-Hom cases, then obtain a nonzero-height corollary for a chosen test vector. |
| `GZ.9` | Construct the good-reduction BDP/Brooks logarithm-square comparison without forcing ordinarity of f; the multiplicative exceptional-zero term is a separate extension. |

**Producer–consumer handoff.** RankZeroOneBSD BSD.3–5 receives non-torsion and exact period/index factors; Heegner and generalized-cycle consumers receive the same normalized Kummer/logarithm square.

**Acceptance.** Test a compact curve without a cusp, two real components, a character paired with its inverse and an isogeny changing differential/degree.

**Source-readiness boundary.** Full YZZ is supplied and introductory theorem/erratum passages were checked here; Chapters 2–8 proof interiors, Brooks and Hriljac remain source-decomposition/access checks as applicable.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
