# automorphic congruences and reverse main-conjecture divisibilities

Specialized SU/FW/BCS congruence and reverse-divisibility arguments.

## Canonical ownership and interfaces

- Generic pseudorepresentations, reducibility/congruence ideals and extension classes are owned by IntegralHeckeAndGaloisDeterminants; deformation rings/patching and p-adic local GL₂ correspondences import the modularity family.
- Completed cohomology imports the torsion/automorphic cohomology owner, local co-Whittaker/derivatives import SmoothRepresentationsOfLocalGroups. This roadmap constructs specialized zeta morphisms/congruence classes and proves the actual source hypothesis checks.

**Campaign dependencies:** [IntegralHeckeAndGaloisDeterminants](../IntegralHeckeAndGaloisDeterminants/README.md), [AutomorphicPadicLFunctions](../AutomorphicPadicLFunctions/README.md), [KatoEulerSystems](../KatoEulerSystems/README.md), [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md), [PadicLocalLanglandsForGL2Qp](../PadicLocalLanglandsForGL2Qp/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Prove the automorphic and deformation-theoretic inputs to the main-conjecture equalities in R16. Kato's Euler-system bound supplies only one divisibility. The opposite divisibility requires an independent construction of congruences and Galois extensions, or an independently proved main-conjecture argument. This roadmap contains that work, rather than treating Skinner–Urban or Fouquet–Wan as black-box hypotheses.

The targets are the exact ordinary modular result, the broader cohomological and universal-family result under Fouquet–Wan's hypotheses, and the ordinary elliptic-curve refinement of Burungale–Castella–Skinner. No general main conjecture for an arbitrary unitary representation is asserted.

## L0. Congruence modules and Selmer classes

Import congruence ideals/modules, generalized matrix algebras, pseudorepresentations, reducibility ideals and the general extension-class construction from IntegralHeckeAndGaloisDeterminants. Here prove their source-specific relation to the chosen integral periods and identify the actual automorphic extension classes. State the actual residual irreducibility/distinctness hypotheses required by each construction.

Show that the resulting classes satisfy the specified local conditions: unramified conditions, ramified Steinberg conditions and the ordinary condition at p. Prove the control of extension modules and their lengths by congruence ideals at height-one primes. Use these to derive an explicitly oriented divisibility of characteristic ideals. Compare primitive and imprimitive Selmer groups through the local cohomology exact sequence and match every removed Euler factor analytically.

## L1. The Skinner–Urban automorphic argument

Construct the unitary-group U(2,2) ordinary automorphic input used in SU: the relevant Shimura varieties and automorphic bundles, integral ordinary modules, Siegel/Klingen Eisenstein constructions, pullbacks, and constant/Fourier–Jacobi coefficient formulas. Use the carriers and local zeta-integral infrastructure of R14, but prove the extra congruence and cuspidality statements here.

Construct the p-adic family whose Eisenstein congruence is measured by the Rankin/cyclotomic L-function. Prove nonvanishing/primitivity of the required nonconstant coefficients, including the local test-vector choices and the relevant auxiliary-prime hypotheses. Establish the congruence with cusp forms and the associated Galois representation/extension. Deduce the required Selmer lower bound through L0. An interpolation formula for an Eisenstein series alone is not this congruence theorem.

For the FW Theorem 1.6 target, follow FW §4.8’s refined argument that bypasses the unavailable general comparison of canonical and Gross periods. Prove the specific exponential/local-factor comparisons used there, and transfer to the same lattice and analytic function as R10/R12. Retain any powers-of-p ambiguity in versions of the theorem for which that argument does not remove it; do not introduce a blanket canonical-period/Gross-period equality as a convenient lemma.

## L2. The distinct Fouquet–Wan automorphic input

Construct the U(3,1) Eisenstein/Rankin–Selberg families used by FW, with the auxiliary imaginary quadratic field and its two-variable extension. This is a distinct construction from the U(2,2) argument, not a renaming of it. Prove the local zeta integrals, ordinary or finite-slope hypotheses used in the relevant step, integral period comparisons, and the two-variable divisibility, including the exceptional height-one primes that are initially excluded. Construct the Rankin–Eisenstein/Beilinson–Flach classes used in FW §4.4 from products of modular curves, diagonal pushforward and Eisenstein classes; prove the tame and p-power norm relations, weight moments and explicit reciprocity with Rankin–Selberg L-values. This uses R12’s regulator machinery but is a genuinely new Euler-system construction. Construct the unramified local Iwasawa theory and Yager modules of FW §4.2, and prove their exponential-map comparison; the cyclotomic rank-one regulator alone is not that comparison.

Provide the analytic nonvanishing/auxiliary-character arguments needed to control those exceptional primes. For every theorem used in specializing to the cyclotomic line, prove its level, ramification and residual hypotheses from the selected auxiliary field and character. Do not silently drop a nonsplit-prime or minimality condition when changing the auxiliary field.

L2 imports the finite-slope Klingen construction from AutomorphicPadicLFunctions L4e (Eischen–Wan), and Hsieh's μ/nonvanishing theorem from L3h. Higher-weight generalized Heegner classes, corrected local conditions, explicit reciprocity and Hida-family comparison import GeneralizedHeegnerCycles GH.0–8. These are distinct from the Beilinson–Flach construction above and the point system. Verify the needed comparison on the same lattice and character domain; do not use an ordinary theorem at an unrestricted nonordinary specialization.

### L2s — Semi-ordinary GU(3,1) congruences: the CLW replacement

Own the semi-ordinary extension in Castella–Liu–Wan, *Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)*, the replacement for withdrawn arXiv:1412.1767. It is not obtained by using the ordinary Up projector on every weight-two modular form. Construct the two-dimensional subspace of the three-dimensional weight space, its semi-ordinary Up operator, cuspidal and noncuspidal Hida control and the boundary exact sequence (Theorem 2.9.1, §§2–4), then the semi-ordinary Klingen family, degenerate/nondegenerate Fourier–Jacobi calculations, Eisenstein ideal and lattice-to-Selmer argument (§§5–8). Import the generic finite/profinite projector from PadicFamilies L0a and Weil/Heisenberg/Jacobi structures from MetaplecticAutomorphicForms MP.0–6; prove the geometric finiteness/continuity hypotheses in this instance. Reuse L0's extension algebra and AutomorphicPadicLFunctions L4e's doubling construction, with explicit comparison maps, rather than duplicate them. This supplier does not assume L2's completed Fouquet–Wan divisibility; shared local test data are constructed before either arithmetic conclusion.

Theorem 8.2.1 uses §5.2: p≥3 split in imaginary quadratic K; π has weight two, is unramified at p, and at every finite place is unramified, Steinberg or its unramified quadratic twist; some ramified prime is nonsplit in K, and π is ramified at 2 if 2 is nonsplit; the residual representation restricted to G_K is irreducible. The algebraic character ξ has infinity type (0,k₀), k₀ even. First prove the fractional-ideal containment (L_{π,K,ξ}) ⊇ char(X_{π,K,ξ}) after inverting the nonzero elements of the cyclotomic coefficient subring. Under residual distinctness ξ_p≠ξ_p̄, prove integrality of the analytic function. The second containment is only after inverting p and also requires ξ|A_Q×=ω², k₀≡0 mod 2(p−1), local base-change root number +1 at every nonsplit finite place, and conductor supported at split primes. This is a one-sided divisibility: torsion, equality and removal of excluded height-one primes require further proved arguments. BSD.6a imports precisely this source-qualified input for its supersingular branch, not a universal nonordinary equality.

## L3. Deformation theory and universal zeta elements

Import framed/unframed deformation functors, tangent/obstruction spaces, representability and ring comparison from LocalGaloisDeformationRings and GlobalGaloisDeformations. Import patching from DeformationAndDerivedPatchingAlgebra and the applicable lifting theorem from GL2ModularityLifting. Here verify that FW's precise local conditions, residual hypotheses and coefficient rings fit those theorem interfaces, and deduce the source's reduced complete-intersection and Hecke comparison properties. An axiom labelled R=T is not an acceptable import.

Construct Nakamura’s universal zeta morphism from the compatible modular/Hecke-level classes, including the completed-cohomology and local co-Whittaker input described below, and its fundamental determinant line over the coefficient ring actually used by the source. Prove compatibility with change of level, coefficient ring, derived specialization and the complex used to define the cohomological main conjecture. Import completed cohomology/local–global compatibility from CompletedCohomologyAndLocalGlobalCompatibility, derivatives/co-Whittaker/essential vectors from SmoothRepresentationsOfLocalGroups, and the p-adic local Langlands/Montréal/Paškūnas comparison from PadicLocalLanglandsForGL2Qp. Prove the specific compatibility squares and hypotheses required for Nakamura’s morphism and FW Appendix A; missing general supplier theorems must be added to their canonical roadmap, not reconstructed here. R09’s (phi,Gamma)-module equivalence alone does not supply this input. Prove that this morphism specializes to R12’s Kato class. Show existence and density of the classical crystalline/ordinary points required by the argument. Finite flatness over a regular ring does not imply the deformation ring itself is regular; use perfect complexes where necessary.

## L4. Integral descent and specialization

Prove the height-one divisibility and integrality statement for the universal zeta element, combining L2 with the ordinary/crystalline specializations. Establish the exact commutative-algebra extension/descent results used to pass from those specializations to the universal fundamental line. Zariski density by itself cannot prove that a rational section is an integral generator, and a specialization where the value vanishes cannot be canceled.

Deduce FW's universal-family theorem and the pointwise theorem, including nonordinary and bad-reduction points covered by its hypotheses. Treat any singularity, Tor, local Euler or lattice correction in the derived specialization. Distinguish the determinant over the regular power-series subring in FW Theorem 1.8 from a stronger statement over the deformation ring itself. The output is the integral cohomological/determinant statement in R16; the signed or ordinary scalar version follows only after the separate local comparison.

## L5. The ordinary elliptic-curve refinement

This layer is now staged to consume the standalone arithmetic geometry suppliers. [HeegnerPointEulerSystems](../HeegnerPointEulerSystems/README.md) HE.0–5 and early HE.8 own CM/Heegner points, norm/Kummer relations, the anticyclotomic family and Cornut–Vatsal nonvanishing. [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) GZ.0–9 owns point heights, periods, complex Gross–Zagier and the BDP/Brooks logarithm formula. [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md) owns generic local-condition complexes. Import these actual constructions; the earlier provisional plan to rebuild them in this layer is superseded.

### L5a. Shared two-variable congruence input

Own BCS v2 Theorem 4.2.1's two-variable Iwasawa–Greenberg comparison. Import L5w's actual Wan–Fujiwara Hilbert/quartic-CM engine, not a relabelled GU(3,1) theorem. Construct the Rankin/Katz factors, local restrictions, lattice and characteristic-ideal comparisons with the early HE/GZ objects. Retain the no-vexing-prime and extra residual assumptions where used; prove their discharge at the final endpoint. Prove the CM-evaluation/μ calculation via AutomorphicPadicLFunctions L3h and its BCS specialization. Construct the local-control maps and derived base-change comparisons before asserting a specialized divisibility.

Export this early proof input to HE.8b, which owns BCS v2 Theorems 1.2.2/1.2.4's source-specific anticyclotomic endpoints and their Heegner-index/BDP comparison. HE.8b must not import the completed cyclotomic descent below. Its Eisenstein analogue is separately owned by RankZeroOneBSD BSD.7a, not obtained by deleting irreducibility here.

### L5w — Hilbert/quartic-CM Wan–Fujiwara proof input

Prove the source-specific GU(2,2) congruence/Iwasawa theorem over a totally real field used by Wan's published 2015 Theorem 3, then BCS v2 Theorem 3.2.1's specialization. In that application F is real quadratic and M/F CM quadratic, hence M is quartic CM. This is distinct from L2's GU(3,1) imaginary-quadratic argument. Construct the Hilbert Hida family, minimal deformation/Hecke comparison, Gorenstein duality and integral specialization maps. Generic deformation/patching is imported from its canonical owners; the minimal local type and freeness proof for this source is owned here.

Pin BCS Hypothesis 3.1.1: (H1) absolute irreducibility after restriction to G_{F(ζ_p)}; if p=5, exclude the simultaneous case that the projective image is PGL₂(F₅) and the mod-p cyclotomic character factors through that project's abelianized quotient PGL₂(F₅)^ab≅ℤ/2; (H2) a minimal modular lift over F in Fujiwara Definition 6.11; (H3) q_v≠−1 mod p when the local residual representation is absolutely irreducible but its inertia restriction is reducible. Fujiwara's publicly available 2006 manuscript supplies the proof route to Theorem 11.1, not a conjecture merely because it is a preprint. Its full theorem also states local nearly-ordinary/flat restrictions, Hypothesis 6.7, and, in the specified nonminimal case, Hypothesis 5.9. Prove the minimal local-type/freeness and auxiliary-hypothesis instances used by Wan 2015 Theorem 8 and BCS §3; do not cite the bare title R=T to erase these conditions. The campaign's target is the complete source-qualified proof chain, not an assumption that every totally-real deformation problem is Gorenstein.

For BCS Theorem 3.2.1 retain p>3 good ordinary, (pN,D_F)=1, (spl_F), (Δ), (NO_F,D_{M/F})=1, irreducibility over M, squarefree n⁻ with an even number of inert factors and residual ramification at each factor. Prove the oriented containment (L_p(g_F/M)) ⊇ char(X_ord), then the specialization of §5/Proposition 5.2.1. Prove H1–H3 for the selected auxiliary field, including the minimal base-change lift and empty n⁻ case, before exporting the weaker final residual hypotheses. Calling these conditions technical does not discharge them.

### L5b. Quadratic factorization and cyclotomic descent

After HE.8b's anticyclotomic endpoint, prove the local-control and quadratic-twist factorization arguments needed to descend and separate the cyclotomic factors in BCS Theorem 1.1.2. Track the actual class, period, Euler factors, Selmer structure and coefficient extension throughout. Keep equality after inverting p separate from the integral strengthening; prove how the rank-one image condition in ModularIwasawaMainConjectures L3 removes the p-power ambiguity. This final stage supplies the cyclotomic theorem, not the input used to construct its anticyclotomic proof.

Thus the staged order is early HE/GZ and L5w → L5a → HE.8b → L5b → ModularIwasawaMainConjectures L3. The separate stages preserve BCS scope without duplicating Heegner and Gross–Zagier theory.

**Acceptance:** opposite divisibilities on the same integral objects as Kato's; the SU and FW arguments have their actual automorphic and deformation inputs proved; the BCS rational/integral distinction survives every transfer; the theorem list of R16 contains no hidden 'assume the desired divisibility' field.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L0` | Construct the actual extension module from a congruence and prove every local Selmer condition; attach the height-one length comparison to its explicit reducibility ideal. |
| `L2s` | Build the semi-ordinary operator and boundary exact sequence before the CLW Eisenstein ideal. Keep localization in the cyclotomic coefficient subring separate from inversion of p. |
| `L5w` | Prove the auxiliary Hilbert/quartic-CM field satisfies Fujiwara H1–H3 and the required minimal-lift/freeness hypotheses before importing the BCS two-variable comparison. |
| `L5b` | Factor the quadratic analytic and Selmer terms using derived control, then remove the p-power ambiguity only under the integral rank-one-image condition. |

**Producer–consumer handoff.** HE.8b imports L5a and its L5w supplier before L5b; ModularIwasawaMainConjectures receives the final reverse divisibility on Kato-compatible lattices.

**Acceptance.** Record containment in words and ideals, test a vanishing specialization and an excluded height-one prime, and retain residual-coincidence branches separately.

**Source-readiness boundary.** Universal zeta morphism, semi-ordinary congruence and Fujiwara source interiors need decomposition; equality is not inferred from dense classical points.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
