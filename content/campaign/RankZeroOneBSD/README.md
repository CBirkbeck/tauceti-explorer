# Rank-zero and rank-one Birch–Swinnerton-Dyer theory

Prove for every elliptic curve E/ℚ of analytic rank 0 or 1 that its Mordell–Weil rank equals that analytic rank and its entire Tate–Shafarevich group is finite. Develop the reusable analytic/arithmetic comparisons needed for leading-term formulas, and prove the specifically enumerated prime-part formulas below. This roadmap does **not** claim the full leading-coefficient formula for every such E at every prime.

## Existing owners and the exact statement

Reuse the existing WeierstrassCurve and affine Point types. EllipticCurves Layers 4, 6 and 7 own reduction/Tamagawa factors, Mordell–Weil and the canonical height/regulator, actual Selmer/Sha, the real period and the BSD quotient under Sha finiteness. [EllipticCurveModularity](../EllipticCurveModularity/README.md) R29.4–R29.6 proves the actual L-series comparison and analytic continuation. [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) and [HeegnerPointEulerSystems](../HeegnerPointEulerSystems/README.md) provide height formulas and arithmetic descent. Main-conjecture theorems are supplied by [ModularIwasawaMainConjectures](../ModularIwasawaMainConjectures/README.md); this roadmap proves their finite-level BSD consequences and all comparison factors.

Write L*(E,1)=L^(r)(E,1)/r!. With a precisely normalized regulator, the proposed arithmetic leading term is Ω_E Reg_E #Sha(E/ℚ)∏_{ℓ finite}c_ℓ/#E(ℚ)_tors². The full real period Ω_E already includes all real components, so no extra c∞ is inserted. Before matching a source, prove its height/regulator convention agrees via GZ.0; a factor 2^r is not discarded when studying p=2. A p-adic valuation of a real quotient is stated only after proving it is a nonzero rational number and identifying that rational value.

<a id="bsd-0"></a>
## BSD.0. Actual analytic L-functions, vanishing order and twists

**Milestone:** `BSD.0`

Build the interface from the Euler product/Dirichlet series of E to its modular entire continuation and completed functional equation, proving uniqueness from agreement on a connected convergence domain. Define analytic rank as the finite order of this actual analytic function at 1 and prove finiteness using nonvanishing in a half-plane; an arbitrary analytic germ is not a witness. Relate order zero to L(E,1)≠0 and order one to L(E,1)=0 with nonzero derivative. Prove the root-number parity relation for the analytic order.

For a quadratic character construct the existing quadratic twist and prove every local Euler-factor comparison, including bad primes, then the factorization L(E/K,s)=L(E,s)L(E^K,s). Establish product/additivity and derivative identities at the center with explicit finite/archimedean normalization. Supply the coefficient-field/rationality bridge from weight-two newforms with rational coefficients.

**Dependencies:** EllipticCurveModularity R29.4–R29.6; EllipticCurves Layer 5; ModularForms; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3.

<a id="bsd-1"></a>
## BSD.1. Arithmetic invariants and quadratic descent

**Milestone:** `BSD.1`

Use the existing Mordell–Weil lattice modulo torsion, regulator, period and finite-level Selmer groups. Prove compatibility of point restriction/trace and twisting with the rational ± eigenspaces over K. Construct the rank identity rank E(K)=rank E(ℚ)+rank E^K(ℚ) and its integral lattice-index correction. At odd p compare the corresponding Selmer/Sha primary parts; at p=2 retain the restriction/corestriction kernels and cokernels instead of asserting an integral direct sum.

Relate component groups, minimal differentials and periods under quadratic base change and twist, including ramified bad places and the finite support of Tamagawa factors. Reuse Cassels' isogeny-invariance theorem from EllipticCurves Layer 7 and its duality prerequisites. Show that Sha finiteness descends along a finite extension by bounding the restriction kernel using finite-group cohomology and finite generation of points. These arithmetic comparisons are available before the analytic rank theorem.

**Dependencies:** EllipticCurves Layers 4–7; ArithmeticGaloisDuality R02.2–R02.4; NeronModelsAndSemistableAbelianVarieties R11; GrossZagierAndArithmeticHeights GZ.0–GZ.1.

<a id="bsd-2"></a>
## BSD.2. Quadratic twists with prescribed local conditions and nonvanishing

**Milestone:** `BSD.2`

Prove the quadratic-twist nonvanishing theorem needed to choose a Heegner field, including finitely many prescribed splitting/local character conditions compatible with the functional equation. For a weight-two newform, construct twists with nonzero central value in the sign + branch and twists with a nonzero first derivative in the sign − branch. Specify the permitted discriminants, coprimality, negative sign at infinity and exclusions; choose infinitely many so finitely many CM-field or parametrization exceptions can be avoided.

Import metaplectic/Weil, Jacobi and genus-two half-integral-weight Eisenstein constructions and cover-specific continuation from [MetaplecticAutomorphicForms](../MetaplecticAutomorphicForms/README.md) MP.0–8. Here prove the BFH/Friedberg–Hoffstein unfolding, twist-series comparison, residue/positivity argument and local-test-function selection. Export K with every local property, including D≠−3,−4 for the clean Howard branch, and prove simultaneous satisfiability for BSD.3–4. A root number alone proves no nonvanishing; no Goldfeld density assertion is assumed.

**Dependencies:** BSD.0; GlobalNumberFields; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3; MetaplecticAutomorphicForms MP.0–8; AutomorphicSpectralTheory only through the proved cover comparison.

<a id="bsd-3"></a>
## BSD.3. Analytic rank one implies rank one and finite Sha

**Milestone:** `BSD.3`

Given analytic rank one over ℚ, use BSD.2 to choose K with the classical/generalized Heegner conditions and L(E^K,1)≠0. Prove that L(E/K,s) has a simple central zero. Apply GZ.8 with a suitable nonzero test vector and its explicit positive height comparison to obtain a non-torsion Heegner point in E(K). Apply HE.7, not just its clean large-p special case, to prove rank E(K)=1 and finiteness of Sha(E/K).

Show that the rational trace/eigenspace selected by the functional equation gives the rank-one part for E and not its twist, using the established conjugation law or the rank-zero twist argument without a circular appeal to this theorem. Descend rank and Sha finiteness by BSD.1. Prove the final theorem for all E/ℚ, including CM and nonsemistable curves; the auxiliary field restrictions have been discharged by its construction, not retained as extra hypotheses on E.

**Dependencies:** BSD.0–BSD.2; GrossZagierAndArithmeticHeights GZ.8; HeegnerPointEulerSystems HE.5–HE.7.

<a id="bsd-4"></a>
## BSD.4. Analytic rank zero implies rank zero and finite Sha

**Milestone:** `BSD.4`

Given L(E,1)≠0, choose a negative quadratic twist with a nonzero central derivative and the Heegner local conditions by BSD.2. The base-changed L-function then has order one. Apply GZ.8 and HE.7 to the base-change Heegner point; use its complex-conjugation sign to locate the rank-one part in the twist and prove rank E(ℚ)=0. This sign calculation supplies a direct proof independent of assuming BSD.3 for the twist. Descend finite Sha as in BSD.1.

Give a second explicitly scoped route via the actual Beilinson–Kato Euler system and its reciprocity law when its nonvanishing applies, comparing the resulting rational Selmer bound with the Heegner proof. The headline all-E statement does not rest on unproved primitivity of Kato classes or on a main conjecture. Combine BSD.3–BSD.4 into one theorem for analytic rank at most one; also expose the separate rank and finiteness conclusions for downstream use.

**Dependencies:** BSD.0–BSD.2; GrossZagierAndArithmeticHeights GZ.8; HeegnerPointEulerSystems HE.5–HE.7; KatoEulerSystems L0–L4 and EulerSystemsAndKolyvaginSystems ES.4 for the separate Kato comparison route.

<a id="bsd-5"></a>
## BSD.5. Rational leading-term quotient and Heegner index formula

**Milestone:** `BSD.5`

Prove the rationality and positivity of L*(E,1)/(Ω_E Reg_E) in analytic ranks 0 and 1: use modular-symbol rationality at rank zero and the Gross–Zagier/period/index comparison at rank one. Relate the height of a non-torsion Heegner point to the squared index of its class in the rank-one lattice, with torsion and rational-versus-quadratic regulator factors. Construct the modular/quaternionic parametrization-degree comparison used to recover local Tamagawa factors; build the precise Ribet–Takahashi character-group/degree calculation from R11 and the existing transfer APIs.

Define the rational BSD defect as the analytic leading term divided by the arithmetic expression, and prove invariance under isogeny using both arithmetic quotient and equality of all L-factors. Construct its p-adic valuation formula including the torsion denominator. Separate a bound on the index of a Heegner point, a bound on Sha and an exact formula: neither GZ nor a one-sided Euler-system divisibility alone gives equality of the BSD defect with 1.

**Dependencies:** BSD.1, BSD.3–BSD.4; GrossZagierAndArithmeticHeights GZ.0, GZ.3, GZ.8; HeegnerPointEulerSystems HE.6; ModularSymbolsPadicLFunctions; NeronModelsAndSemistableAbelianVarieties R11.4–R11.6.

<a id="bsd-6"></a>
## BSD.6. Irreducible-prime leading-term formulas

**Milestone:** `BSD.6`

Prove the following distinct prime-part theorems against BSD.5's rational defect, retaining their source hypotheses:

- Analytic rank one, E semistable, p≥5 of good reduction and E[p] irreducible: the Jetchev–Skinner–Wan formula. Include the source's p=3 good-reduction case with a₃=0 if supersingular. Do not conflate semistability with good reduction at the single prime p.
- Analytic rank zero, p odd of good ordinary or multiplicative reduction, E[p] irreducible, and a multiplicative prime q where E[p] ramifies: the Skinner–Urban/Skinner branch summarized precisely in JSW Theorem 7.2.1(ii). For the supersingular branch use its semistable (or explicitly permitted twist) condition and a_p=0. These are named branches, not a universal good-prime formula.
- Analytic rank one and multiplicative p>3: use **Castella's corrected Theorem A′**, requiring E[p] irreducible, a distinct nonsplit multiplicative prime q where E[p] ramifies, and E(ℚ_p)[p]=0. The erratum permits additive primes elsewhere, but the original wider uncorrected statement is not a target.

For each, derive the integral lower bound from a named main-conjecture theorem plus exact control, and the upper bound from the arithmetic Euler-system argument. Prove the auxiliary-field selection, p-adic logarithm identity, period/degree and local-factor comparisons, then match the two bounds. Record any rational main-conjecture statement before p-inversion and explain how its integral ambiguity is removed; finite modules and μ-factors cannot be dropped. The exact p=3 source upgrade beyond the specified branch requires its own verified theorem, not a comment that p≥5 “should” be unnecessary.

<a id="bsd-6a"></a>
<a id="stage-BSD.6a"></a>
**Milestone:** `BSD.6a`

Construct the genuinely additional main-conjecture arithmetic inputs for these exact branches. For the JSW supersingular proof, supply its named Wan two-variable divisibility and the Kobayashi/Pollack–Rubin signed ingredients where used, retaining each theorem's residual, ramification, a_p and CM/non-CM hypotheses. ModularIwasawaMainConjectures L4 supplies signed definitions and only its stated FW/LLZ consequence, not a blanket supersingular equality; prove the missing branch-specific congruence/reciprocity and integral comparison here. The quaternionic logarithm comparison consumes the good-reduction (not necessarily ordinary f) GZ.9 theorem. For the multiplicative branch prove Castella's corrected anticyclotomic Theorem 1.1: an ideal N of O_K with O_K/N≅ℤ/Nℤ; p split in K; E[p] irreducible; if 2 is nonsplit then 2∥N; every nonsplit q∥N is nonsplit multiplicative for E, at least one such q is residually ramified; and E(ℚ_p)[p]=0. Build its congruence/control proof from the exact final source inputs, not the invalid original Hida specialization step. Prove that BSD.2 can select the required K when applying A′.

The corrected multiplicative proof consumes GeneralizedHeegnerCycles GH.2–7: CH (4.7), §5.2 and Theorems 5.7/6.1, LV Theorem 4.7 and Cas Theorems 2.11/5.3. Its reverse divisibility imports AutomorphicCongruences L2's FW proof, AutomorphicPadicLFunctions L3h's Hsieh μ theorem and L4e's Eischen–Wan construction. These are genuine higher-weight inputs. Incorporate the CH erratum and KO20 replacement local-condition proof.

**Versioned supersingular proof route.** Wan arXiv:1411.6352 is withdrawn and explicitly superseded in part by Burungale–Skinner–Tian–Wan, *Zeta elements for elliptic curves and applications*, arXiv:2409.01350v2 (11 September 2024), Remark 1.4. The older source is archival provenance, not the normative missing PDF. Here own the source-specific two-variable zeta-element construction (Theorem 1.14, §§3–6), reusing KatoEulerSystems' actual Beilinson–Kato classes, PadicFamilies' CM family machinery and PadicHodgeRegulators' maps, and prove **both** explicit reciprocity laws and their common integral normalization. This is additional arithmetic construction, not a zeta element defined by its predicted images. For E/Q, require p∤2N, a_p=0 in the supersingular case (an extra condition at p=3), and for the auxiliary imaginary quadratic L require (D_L,N)=1, p split, `E[p](L)=0`. Retain the representation/twist and completed unramified coefficient conventions of (1.3)–(1.8).

Prove the main-conjecture comparison and cyclotomic descent of §§9–10 using the genuinely separate CLW semi-ordinary congruence divisibility from AutomorphicCongruences L2s and the Kato signed bound. Track the source's height-one, residual ramification, definite/indefinite and auxiliary-field conditions before their discharge. The exact elliptic endpoint is BSTW Theorem 1.3: semistable E/Q, odd good supersingular p, with a₃=0 if p=3, and the stated quadratic twists whose discriminants are coprime to Np and supported at primes of ordinary reduction of E. Export the signed equality through ModularIwasawaMainConjectures L6; derive the required rank-zero prime-part formula here and retain JSW's existing rank-one logarithm/height route. Do not silently broaden the twist range using a differently normalized modular-form statement, or import the additional p-adic Gross–Zagier proof of BSTW Theorem 1.5 without assigning its new inputs. Wan arXiv:1607.07729 is likewise withdrawn into the already pinned Fouquet–Wan 2107.13726v3, not an independent unacquired theorem. Full theorem/proof verification remains an implementation target even though the replacement sources are acquired.

**Dependencies:** BSD.2–BSD.5; GrossZagierAndArithmeticHeights GZ.9; HeegnerPointEulerSystems HE.6–HE.8; GeneralizedHeegnerCycles GH.2–GH.7; AutomorphicCongruences L2; AutomorphicPadicLFunctions L3h/L4e; ModularIwasawaMainConjectures L0/L4 for signed local conditions and the Kobayashi comparison via PadicHodgeRegulators L4; SelmerIwasawaCohomology L3–L4 for control, not a second signed-condition definition.

<a id="bsd-7"></a>
## BSD.7. Eisenstein-prime branches and exact local correction terms

**Milestone:** `BSD.7`

Prove the Castella–Grossi–Skinner Theorem D branch: p>2 of good reduction, a rational p-isogeny with residual character φ satisfying φ|G_p≠1,ω, and analytic rank 0 or 1. State the character as part of the actual kernel representation and verify that good Eisenstein reduction is ordinary. Its local exclusion implies the relevant absence of rational p-torsion, but the general BSD statement retains the torsion denominator rather than relying on an omitted factor in a source formula.

Prove the broader Keller–Yin Theorem C/4.2.1 branch for every odd good Eisenstein prime under its stated elliptic-curve hypotheses, including rational p-torsion. Construct the additional local-condition, residual extension/lattice and finite-submodule corrections in that proof; it is not obtained by deleting the character hypothesis from the preceding theorem. Distinguish the verified preprint's claim from published CGS in the source-status audit. At bad Eisenstein primes import only the separately established main-conjecture and comparison theorems; do not infer a BSD formula from a p-converse statement. The theorem list in this milestone is about leading terms, whereas Selmer-corank-to-analytic-rank converses have different hypotheses and conclusions.

<a id="bsd-7a"></a>
<a id="stage-BSD.7a"></a>
**Milestone:** `BSD.7a`

Own the additional CGS/Keller–Yin Eisenstein main-conjecture proofs required for these branches. Construct the residual-character comparison with the relevant character Iwasawa modules and p-adic L-functions, prove both divisibilities and exact local Euler-factor/μ corrections, then lift through congruence, integral control and the finite-submodule/lattice arguments. In Keller–Yin's broader branch retain the local invariants and extension terms which do not disappear for a rational p-torsion representation. Import generic formulations from ModularIwasawaMainConjectures L0, SelmerIwasawaCohomology, PadicHodgeRegulators, and HE.8's actual anticyclotomic classes; the irreducible cyclotomic theorem in L3 is not an Eisenstein supplier. State each construction's source theorem and hypotheses before using its equality to prove BSD.7.

**Dependencies:** BSD.5; HeegnerPointEulerSystems HE.8; GrossZagierAndArithmeticHeights GZ.9; ModularIwasawaMainConjectures; SelmerIwasawaCohomology; PadicFamilies; EulerSystemsAndKolyvaginSystems ES.4 and ES.8.

<a id="bsd-8"></a>
## BSD.8. From prime-part certificates to an exact leading term

**Milestone:** `BSD.8`

For the positive nonzero rational BSD defect prove that equality of every prime valuation to zero is equivalent to defect=1. Build a finite-support certificate: an explicit finite set S containing all numerator/denominator prime divisors, a proof of the p-part at every p∈S, and a theorem excluding all p∉S. Then derive the full formula for the individual curve or explicitly specified family. “All sufficiently large primes” only identifies a rational S-unit and is not full BSD.

Provide interfaces for certified finite descent/Sha computations, isogeny comparison and local calculations that can discharge the remaining primes, including 2 and 3 or additive/bad primes excluded by BSD.6–BSD.7. Such a certificate must prove its finiteness and index claims, not trust a database's predicted Sha order. Do not postulate a uniform theorem covering all residual exceptional primes. Expose exact full-formula corollaries only when a complete certificate or an independently proved all-prime family theorem supplies them.

**Dependencies:** BSD.5–BSD.7; EllipticCurves Layers 4, 6 and 7; ArithmeticGaloisDuality R02.4; existing rational factorization/valuation APIs.

<a id="bsd-9"></a>
## BSD.9. Reusable comparison tests and endpoint signatures

**Milestone:** `BSD.9`

Give separate public signatures for analytic-rank equality, finite Sha, a fixed-prime leading-term formula, and the full leading-term formula under a complete certificate. Test rank-zero and rank-one curves with known rational points/torsion, a CM curve, a nonsemistable curve and a curve with a rational p-isogeny. The test proves that each source's side conditions are satisfied before applying its theorem; numerical evidence of analytic rank is not a proof of a nonzero derivative.

For examples needing analytic certification, prove a Mellin-integral or modular-symbol expression for the actual central value/derivative with rigorous tail and approximation error bounds, then certify a nonzero enclosure. Keep that analytic certificate distinct from the arithmetic descent certificate. Verify all height/period rescalings, the empty determinant convention Reg=1 in rank zero, and torsion factors. Include a negative test showing that an unproved residual 2-part prevents full-formula assembly while leaving rank equality and finite Sha unaffected.

**Dependencies:** BSD.0–BSD.8; ModularSymbolsPadicLFunctions; EllipticCurves acceptance examples.

## Source and review contracts

The classical rank/finiteness theorem uses actual Gross–Zagier, quadratic-twist nonvanishing and full Kolyvagin descent. For precise prime-part targets consult JSW Theorems 1.2.1 and 7.2.1, CGS Theorems A/D, Keller–Yin Theorem C/4.2.1, and [Castella's erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) Theorem A′. The dated source register records what was acquired and inspected; it does not assert that these branches exhaust current research. Suggested.lean contains concrete comparison algebra and precise advanced contracts, not axioms standing in for BSD.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `BSD.2` | Construct the auxiliary quadratic twist with every local condition and the required nonzero value/derivative simultaneously; a root-number calculation alone supplies neither. |
| `BSD.5` | Prove the defect is a positive rational number from actual analytic and arithmetic quantities, retaining regulator, full period, torsion and isogeny comparison factors. |
| `BSD.8` | For a full-formula claim provide the finite support of the defect and a proved valuation certificate at each exceptional prime, with a theorem for all remaining primes. Keep this gate separate from rank equality and finite Sha. |

**Producer–consumer handoff.** PeriodsAndSpecialValues may reexport rank/finiteness, named p-part results and conditional full certificates separately; unrestricted leading-term BSD is a research statement.

**Acceptance.** Include rank zero with empty regulator determinant one, rank one with an index-square calculation, rational torsion and an unresolved 2-part that correctly blocks full assembly.

**Source-readiness boundary.** HE.7 CM/dyadic proof and each JSW/CGS/Keller–Yin/erratum branch require full statement-to-proof matching; this revision does not certify complete BSD proofs.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
