# Heegner-point Euler systems and arithmetic descent

Construct the actual CM-point system on modular and quaternionic Shimura curves, its cohomology classes and local relations, and the arithmetic inputs to Kolyvagin descent. The first global application is rank one and finite Sha from a non-torsion Heegner point. Anticyclotomic families and integral divisibility indices are later reusable milestones. Higher-weight generalized Heegner cycles are not silently included by changing the Tate-module coefficient.

## Ownership and scope

[EulerSystemsAndKolyvaginSystems](../EulerSystemsAndKolyvaginSystems/README.md) owns the general norm-relation structures, derivative operators, finite/singular comparisons, Kolyvagin-system descent and higher-rank machinery. This roadmap constructs a nontrivial arithmetic example and proves every hypothesis needed to use that machinery. [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) owns heights and complex/p-adic period identities. Existing EllipticCurves owns point groups, twists, Kummer/Selmer/Sha and canonical heights; [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md) owns generic cohomology/duality, and [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md) its local-condition complexes and tower comparisons.

Begin with E/ℚ, an imaginary quadratic field K and a chosen modular parametrization. The classical Heegner branch has all primes dividing N_E split in K. The quaternionic branch writes N=N⁺N⁻ with coprime factors, N⁻ squarefree supported on inert primes and with an even number of factors, plus the exact discriminant/conductor hypotheses of its CM construction. These are theorem hypotheses, not requirements on every E in the final rational rank-zero/one theorem. Use a chosen Galois embedding and Artin convention, and prove change-of-choice equivariance.

<a id="he-0"></a>
## HE.0. Quadratic orders, ring class fields and reciprocity

**Milestone:** `HE.0`

Construct orders O_c=ℤ+cO_K, proper invertible ideals, Pic(O_c), conductor-change maps and their comparison with the relevant idele-class quotients. Derive ring class fields and Artin maps from existing class field theory, including fields of definition, ramification, splitting, complex conjugation and the generalized-dihedral action. Compute the kernels of Pic(O_cℓ)→Pic(O_c) and extension degrees with the exceptional unit indices retained; ℓ+1 is only the inert, prime-to-conductor, ordinary-unit case.

For K/F CM, construct the order/idele variants actually required by the quaternionic curve. Prove compatibility of field norms, ideal norms, reciprocity and changing the finite level. Record the finitely many exceptional small discriminants separately; do not divide by a unit-group order in an integral theorem. Export the actual tower and finite Galois quotient maps, not a family of fields accompanied by assumed degrees.

**Dependencies:** GlobalNumberFields; ClassFieldTheory; NumberFieldArithmetic; HilbertModularVarietiesAndShimuraCurves H4–H5.

<a id="he-1"></a>
## HE.1. CM points and compatible modular parametrizations

**Milestone:** `HE.1`

Construct CM elliptic curves and cyclic-isogeny pairs over ℂ, identify them with the existing X₀(N) moduli objects, and prove descent to ring class fields by the main theorem of complex multiplication and the canonical-model reciprocity law. For quaternionic curves construct optimal embeddings of the specified orders and their CM points in the same canonical tower. Prove the local embedding conditions and the comparison with the complex description; a double coset alone is not a rational point until this descent is proved.

Map CM points to degree-zero Jacobian classes using a cusp or the normalized rational Hodge class, then to A or E through the existing modular quotient. Track denominators of ξ and the degree of the parametrization integrally. Construct a compatible family of points P_c and show its dependence on choices is given by the specified Galois/Hecke actions and torsion translation. Preserve the distinction between a trace to K and a point over its ring class field.

**Dependencies:** HE.0; EllipticCurveModularity R29.5; ModularCurvesPartII R14.1–R14.6; ShimuraVarieties V5–V8; AbelianSchemesAndArithmeticModuli A3; GrossZagierAndArithmeticHeights GZ.0 and GZ.3's Hodge class only.

<a id="he-2"></a>
## HE.2. Geometric norm and reduction-congruence relations

**Milestone:** `HE.2`

Compute Hecke correspondences on CM points by classifying the local cyclic subgroups/optimal embeddings. For inert ℓ prime to cN prove the trace relation with a_ℓP_c; for split or ramified primes and repeated conductor primes prove the full recurrence with its Frobenius and degeneracy corrections. Prove the initial conductor/unit exceptions explicitly. Derive the corresponding relations after passing to Jacobians and the modular quotient, without absorbing a torsion error into equality.

At primes above an inert auxiliary ℓ prove the reduction congruence relating P_cℓ to Frobenius on P_c, with an actual specialization map to the Néron model or good reduction curve. Establish the Eichler–Shimura relation used in the proof in the appropriate geometric category. These pointwise congruences, not just the trace relation, are the input to the finite/singular compatibility of derivative classes. Extend to the quaternionic Heegner hypothesis by the existing local models and transfer comparison.

**Dependencies:** HE.1; ModularCurvesPartII R14.3–R14.6; NeronModelsAndSemistableAbelianVarieties R11.2–R11.6; AutomorphicGaloisRepresentations R19; EulerSystemsAndKolyvaginSystems ES.2 for the target structure.

<a id="he-3"></a>
## HE.3. Kummer classes and exact Selmer conditions

**Milestone:** `HE.3`

Apply the existing finite and p-adic Kummer maps to P_c, proving compatibility with restriction, corestriction, coefficient reduction and the Weil-pairing self-duality. Construct the integral Tate-module classes and their finite torsion reductions using continuous cohomology, not an algebraic cohomology group with the wrong coefficient topology. Prove the classes are unramified outside the specified set and satisfy the finite/crystalline or ordinary local condition at the coefficient prime under the appropriate good-reduction assumptions.

At bad primes identify the local Kummer image and the precise component-group obstruction to replacing it by an unramified condition. At infinite places include the real/Tate correction when descending to ℚ. Track the exact relation between finite-level classes and a saturated lattice in the Selmer group; tensoring with ℚ_p cannot prove an integral local-condition statement. Export one actual family with comparisons to the rational and torsion coefficients.

**Dependencies:** HE.2; EllipticCurves Layer 7; ArithmeticGaloisDuality R02.1–R02.4; SelmerIwasawaCohomology L0–L4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07; EulerSystemsAndKolyvaginSystems ES.0.

<a id="he-4"></a>
## HE.4. Heegner derivative classes and choice independence

**Milestone:** `HE.4`

For squarefree products n of Kolyvagin primes inert in K, construct the finite quotient coefficient ideal from a_ℓ and ℓ+1 and invoke ES.3's derivative operator. Prove invariance of the differentiated Kummer class modulo that ideal, then descend it to K using the actual inflation–restriction sequence. If torsion invariants obstruct injectivity or uniqueness, retain them and prove the corrected construction rather than assuming unrestricted descent.

Include the tensor of cyclic Galois groups in the coefficient of the Kolyvagin system, so changing a chosen generator has a proved transformation law. At n=1 recover the Kummer image of the trace P_1. Prove reduction compatibility as p^m varies, relations on enlarging or shrinking the auxiliary-prime set, and the complex-conjugation parity. Do not assert that raw derivative classes automatically satisfy Mazur–Rubin's stronger relations; construct the corrected system and prove the exact Heegner/Howard compatibility.

**Dependencies:** HE.3; EulerSystemsAndKolyvaginSystems ES.1–ES.3; ArithmeticGaloisDuality R02.2.

<a id="he-5"></a>
## HE.5. Local reciprocity and arithmetic hypothesis verification

**Milestone:** `HE.5`

Use HE.2's reduction congruence to prove the finite/singular relation at every auxiliary prime and the transverse condition after ramification. Verify the self-dual/cartesian local-condition hypotheses and the twisted conjugation pairing required by Howard's Heegner version of Kolyvagin systems. Prove auxiliary-prime existence by Chebotarev applied to the actual residual representation and the finite extensions cutting out the classes; retain big-image/cohomological hypotheses exactly where used.

Compute local errors at p and at Tamagawa primes. Explain why residual surjectivity, residual irreducibility, no local p-torsion, and p-primality of Tamagawa factors are different assertions. Establish named comparison lemmas to turn the abstract ES.4 errors into these arithmetic quantities. Include a example with p dividing a Tamagawa factor and one with nonzero local p-torsion: neither may pass the error-free theorem by coercion.

**Dependencies:** HE.3–HE.4; EulerSystemsAndKolyvaginSystems ES.1, ES.4; ArithmeticGaloisDuality R02.4; NeronModelsAndSemistableAbelianVarieties R11.2.

<a id="he-6"></a>
## HE.6. Clean rank-one descent and precise index bounds

**Milestone:** `HE.6`

Apply the abstract descent engine to the actual Heegner system. For Howard Theorem A retain the standing D≠−3,−4 and require p odd, pairwise coprimality of p, the quadratic discriminant D and conductor N, and surjectivity of the full Tate representation G_K→GL₂(ℤ_p): a nonzero bottom class yields a rank-one compact Selmer lattice and a discrete Selmer group with one divisible rank-one summand and paired finite summands. Identify the finite summands with Sha through the Kummer exact sequence, and prove the length bound by the index of the bottom class. Give the exact direction of divisibility and the factor two from self-duality. These explicit clean hypotheses do not replace HE.7's exceptional-prime theorem.

Separate nonzero, primitive and primitive after local correction. ES.5 gives equality only when its stronger primitivity hypotheses have been proved. Instantiate Zhang's indivisibility theorem with its explicitly enumerated residual ramification assumptions, using the existing level-raising/transfer owners for their generic theory and proving the Heegner congruence/rank-lowering application here. A non-torsion Heegner point alone does not imply its p-indivisibility.

**Dependencies:** HE.5; EulerSystemsAndKolyvaginSystems ES.4–ES.5; GrossZagierAndArithmeticHeights GZ.8 only when supplying analytic nonvanishing; GL2AutomorphicRepresentationsAndTransfer R17.2–R17.5.

<a id="he-7"></a>
## HE.7. Integral classical descent and full Sha finiteness

**Milestone:** `HE.7`

Prove the classical theorem that a non-torsion Heegner point in the stated modular setting yields rank one and **finite entire Sha**, including all coefficient primes. This is a separate strengthening of HE.6. Construct bounded-denominator derivative classes for primes where clean residual or local hypotheses fail; prove uniform bounds on restriction/corestriction kernels, invariants and local-condition error terms using the actual Tate representation and finite-level torsion. Treat p=2 with the real-place/Tate correction and the integral conjugation argument rather than a decomposition by (1±c)/2 over ℤ₂.

For non-CM curves prove the required open-image/cohomological bounds and their uniformity; for CM curves prove the corresponding character/decomposition bounds over the CM field and descent back, keeping the cases separate. Bound the bad-reduction and parametrization denominators by a fixed nonzero integer. Use the finite index of the non-torsion point in the rank-one Mordell–Weil lattice to prove that Sha[p∞] vanishes for all but finitely many p and has bounded exponent for each remaining p. Combine bounded exponent with finite finite-level Selmer groups to prove finiteness. Finiteness of every individual p-primary part, or of a single one, is not by itself the desired conclusion.

The same construction supplies the Kolyvagin–Logachev extension for the specified admissible RM quotients of quaternionic Jacobians, with their field of definition, Hecke compatibility and local hypotheses retained. It does not claim unrestricted rank-one BSD for all abelian varieties over all totally real fields. This stage owns the arithmetic error verification; ES.4 owns the reusable error-tolerant descent argument.

**Dependencies:** HE.4–HE.6; EulerSystemsAndKolyvaginSystems ES.4; ArithmeticGaloisRepresentations R01.5–R01.6; ArithmeticGaloisDuality R02.1–R02.4; EllipticCurves Layers 5–7; NeronModelsAndSemistableAbelianVarieties R11.

<a id="he-8"></a>
## HE.8. Anticyclotomic families, nonvanishing and divisibility defects

**Milestone:** `HE.8`

At a good ordinary prime form the p-stabilized norm-compatible Heegner classes over the anticyclotomic ℤ_p-extension, with the initial Euler factor, finite ring-class torsion and possible class-number factor explicit. Prove their interpolation into Iwasawa cohomology and comparison with HE.4 after specialization. Establish the geometric CM-point distribution and nonvanishing inputs of Cornut–Vatsal in the precise modular/quaternionic setting used here: these are construction/proof targets, not a consequence of a formal inverse limit. Deduce nonzero Λ-adic bottom classes without asserting that every finite specialization is nonzero.

Apply the generic ES.8 and SelmerIwasawa control maps to obtain Howard's divisibility and its invariant paired torsion structure. The clean Howard Theorem B additionally requires good ordinary reduction and p∤h_K, alongside the Theorem A hypotheses; retaining a class-number factor in a construction does not remove that theorem's assumption. Prove the BCGS arithmetic comparison between specializations near the trivial character, local Tamagawa/torsion errors and the divisibility index of the Heegner system. For BCGS's refined result retain p>3, surjectivity and p-optimal parametrization; for its broader nonvanishing theorem retain the distinct weaker conditions. Construct the determinant/Selmer-complex reformulation used by Castella–Sano and prove its specialization correction terms; retain its main-conjecture condition at inert p rather than declaring that case unconditional.

<a id="he-8b"></a>
<a id="stage-HE.8b"></a>
**Milestone:** `HE.8b`

This substage owns the anticyclotomic Heegner-index main-conjecture proof used by BCGS, not supplied by ModularIwasawaMainConjectures L3's cyclotomic endpoint. Pin the actual BCS Theorems 1.2.2/1.2.4, Theorem 4.2.1 and §5: p>3, good ordinary reduction, and its (disc), (Heeg), (spl) conditions on K; residual irreducibility over ℚ supplies the rational statement, whereas the stated surjectivity hypothesis supplies the integral equality. State separately the Heegner-point characteristic-ideal formula and its Greenberg/BDP version char(X_Gr)Λ^ur=((L_BDP)²), where L_BDP is in BCGS's square-root convention, whose square equals BCS Theorem 1.2.4's single-power function, including coefficient extension, local-condition changes and primitive/imprimitive factors. Reuse [AutomorphicCongruences L5a](../AutomorphicCongruences/README.md) and L5w for BCS's GU(2,2)-over-quartic-CM Wan–Fujiwara congruence theorem, then prove the anticyclotomic comparison, explicit reciprocity and reverse divisibility using GZ.9 and the early HE.8 family. Do not import completed L5b's return cyclotomic descent or assume the main conjecture to construct a nonzero bottom class. BCGS Theorem 1.2.13(ii)/(iii) records the resulting rational/integral split. Its Eisenstein case (i), with φ|G_p≠1,ω, imports the distinct CGS proof in BSD.7a; BSD.7a consumes only early HE.8 classes, never this completed equality.

**Dependencies:** HE.3–HE.7; EulerSystemsAndKolyvaginSystems ES.8; SelmerIwasawaCohomology L3–L4; PadicMeasuresIwasawaAlgebras; PadicFamilies; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures L0 for generic formulations, not its narrower cyclotomic equality.

### HE.8c — Source hypotheses for anticyclotomic nonvanishing

For Cornut's modular-curve theorem retain the classical Heegner hypothesis and p∤N; it constructs a non-torsion trace at some conductor in the anticyclotomic tower, not a nonzero class at every character. For Cornut–Vatsal fix F totally real, K/F CM, π cuspidal parallel weight two, finite-order everywhere-unramified central character ω, and the prime-to-P part N′ prime to D_{K/F}. Define their finite exceptional set S and definite/indefinite parity from the local epsilon signs, and the torsion character χ₀ on G₀ with χ₀ω=1 on A_F×. Theorem 1.4's definite branch excludes the source's exceptional pair (π,K); Theorem 1.5's indefinite derivative branch additionally has ω=1 and N,D,P pairwise coprime. Prove the geometric CM distribution before applying GZ's formula. Neither statement says every sufficiently ramified character is nonzero: they assert existence in each sufficiently large conductor stratum with the fixed torsion type.

For BCGS Theorem A retain (Heeg), (disc), (tor)=E(K)[p]=0, p odd good ordinary and split in K, and its rational anticyclotomic Main Conjecture 1.2.10. Discharge that last condition only through HE.8b's named branches. The refined result retains the distinct p>3, surjectivity and p-optimal-parametrization assumptions; no automatic deletion of (tor) is permitted. Keep geometric nonvanishing (early HE.8) separate from the later main-conjecture-dependent Kolyvagin-system nonvanishing.

### HE.7s — Classical exceptional-prime and CM proof-source boundary

The all-prime target in HE.7 remains a proof target, not completed by Gross's acquired clean odd-prime non-CM exposition. Use Kolyvagin's full Euler-systems proof for bounded-denominator/error estimates and Kolyvagin–Logachev for the specified RM extension; the exact dyadic and CM source passages still need acquisition/verification. The selected additional CM source is Karl Rubin, *Tate-Shafarevich groups and L-functions of elliptic curves with complex multiplication*, Inventiones 89 (1987), 527–559, DOI 10.1007/BF01388984; the publisher identifies the article but the full text remains subscription-only in this acquisition pass. Its elliptic-unit route is not supplied by the cyclotomic unit roadmap. Do not infer from the title that the uninspected paper proves every rank-one or dyadic branch: the precise source-to-branch selection remains open until the full statements and proofs are checked. Record this as unresolved; do not silently narrow the all-E target or claim the elementary prototype establishes it.

## Acceptance and references

Test the n=1 trace, a one-prime derivative with a changed generator, a bad Tamagawa prime, the quadratic conjugation sign, a dyadic descent comparison and a CM elliptic curve. Show explicitly that changing a modular parametrization multiplies the bottom class and changes its integral index; the canonical arithmetic theorem is transported by isogeny, not by pretending the index is invariant.

Sources: Kolyvagin's classical papers and Kolyvagin–Logachev; Howard, §§1.1–1.7 and 2.1–2.3; Zhang, *Selmer groups and the indivisibility of Heegner points*, §§3–11; BCGS, §§1–2; Castella–Sano, §3; the Cornut–Vatsal nonvanishing papers. Primary PDFs, edition-specific theorem checks and access gaps are in the register. Suggested.lean provides the finite-sum and torsion algebra on existing types plus precise contracts for the geometric classes.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `HE.2` | Prove trace and reduction-congruence relations on actual CM points, retaining conductor and unit indices; both are needed for the finite–singular square. |
| `HE.7` | Split all-prime finiteness into almost-all primary vanishing and uniform bounded-exponent estimates at each remaining prime, then combine with finite finite-level Selmer groups. |
| `HE.8b` | Compare Heegner index and Greenberg/BDP characteristic formulas with the square-root convention and completed unramified coefficient extension, before any cyclotomic descent. |

**Producer–consumer handoff.** BSD.3–4 needs HE.7 including CM and dyadic verification, not only clean Howard hypotheses; L5b consumes HE.8b after its independent L5a supplier.

**Acceptance.** Test a changed parametrization, a Tamagawa prime, p=2 and a CM curve. A finite Sha[p∞] theorem at every individual p does not by itself prove finite Sha.

**Source-readiness boundary.** Classical CM/dyadic Kolyvagin source selection remains open and explicitly prevents marking the all-E endpoint proof-ready.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
