# Independent package review: CrystallineLocalGlobalCompatibilityCM

**Verdict: accepted after corrections.** The package now assigns integral coefficients and smooth monoid categories to existing lower-tier targets, cites the actual upstream induction and reconstruction targets, corrects two ACC+ locators, and gives discriminating support and orientation checks. It is ready for a draft roadmap PR. This is a roadmap acceptance, not a claim that its arithmetic targets are formalized.

Reviewer: Codex, session codex-pxk5UX, 2026-10-14; independent of the package author's session codex-OOPgkr. Review job #7481. The accepted packet was read and left unchanged.

## Corrections

1. Replaced the unassigned `ReductiveGroupsIntegralRepresentationsPartII` coefficient dependency by the current **PotentialAutomorphyInfrastructure** §0.4 `IntegralDualWeylModule` and §0.5 `dual_weyl_levi_splitting`, with its §0.3 weight dictionary and §0.9 coefficient retract. Their finite-free integral lattices and base-change contracts are present; the rational Young-symmetrizer construction is insufficient. Siegel evaluation surjectivity and its rescaled kernel control remain here.
2. Separated SR's group categories and injective-resolution interfaces from the positive monoid categories. The latter are the parent's §3.2 `SmoothMonoidModules`. The contracting transfer and P-ordinary localization retain their own exact targets in §§1.2–1.3.
3. Removed proposed declaration names that are absent from the current IHG roadmap. Its actual §0.7 target is “Algebraic induction”; the reconstruction contract is §1.6 “Local lifts compatible with global quotient reconstruction”. Their mathematics was checked in the current upstream README, including the absence of a flatness hypothesis on the torsion target algebra.
4. Corrected ACC+ “Theorem 3.4.2” to **Theorem 2.4.2**, and “Corollary 2.4.4” to **Theorem 2.4.4**. Both the arXiv v2 and cleared published author's copy were read. CN's proof of Lemma 4.1.4 inherits the former citation error. Theorem 2.4.2 is on preprint pp.46–49 / published pp.941–945; Theorem 2.4.4 and its coefficient splitting are on preprint pp.49–50 / published pp.945–946.
5. Re-sourced the P-stability assertion to CN Lemma 4.2.3 and proof, p.60, rather than claiming an unchecked Cab84 Proposition 2 locator. Made the integral step explicit: the complementary lattice is saturated because it is a direct summand, so rational P-stability gives integral P(O)-stability. Recorded the remaining historical-reference collation limits described below.
6. Strengthened `BruhatStratumInduction_test_empty_support`: on the longest GL₂ Borel stratum the characteristic function of Z_p is allowed, and constant 1 on Q_p is excluded. Merely identifying empty support with zero did not test compact support.
7. Corrected “zero coefficients” to **zero selected weights with the nonzero trivial coefficient line R_m** in the two unipotent coefficient checks. Zero coefficients would give zero cohomology.
8. Added the computed orientation witness χ(diag(2,1)) = 2⁻¹, with residue 3 at p=5, and its Lean example. Added the closing inventory of the full README definitions and constructions absent from the representative Lean file.

No accepted target was dropped, weakened, or replaced by a carrier with an admitted body. The metadata already consists of the appropriate single line `topic = "math.NT"` and needed no change.

## Fidelity, shape and dependency audit

Read the complete README, Suggested.lean, accepted packet and author's handoff. All **97 packet targets** remain: 63 theorems, 19 definitions and 15 constructions. All **103 packet API names and 104 named checks** remain. Every definition/construction section has at least three checks; the support check was strengthened in place. Supplemental naturality, uniqueness and equivariance statements keep the chosen maps and follow from the stated comparison square.

The current **LocalGaloisGroups** and **ProfiniteArithmetic** README/Suggested pairs were used as form models. The package has the required summary, ownership boundaries, conventions, exact supplier contracts, ordered mathematical layers, examples, dependencies and references. The 2026-10-12 shape instruction permits the complete README despite the older issue's 200 KB limit. Suggested.lean remains a short signature file, with light real definitions and no development of missing arithmetic carriers.

Every prerequisite was classified as a pinned declaration, a prior local target, an existing upstream target, or a lower-tier supplier. The roadmap is tier 27; the highest external tier it consumes is ModularityAndLanglandsExtensions at tier 26. PotentialAutomorphyInfrastructure is tier 23 and PotentialModularityAndCompatibleSystems tier 22. The supplier statements are obligations of their owners, not assertions that they are already library theorems. There are no `UPSTREAM:` placeholders, FoundationsAndLibraryIntegration dependencies, or upward citations in this package.

Read the pinned declarations for derived categories, algebraic representations and their duals, dual evaluation/naturality, finite reversal and block exchange, Fitting decomposition, algebra-homomorphism ranges, Artin–Rees, and projective matrix groups. Read the smooth discrete monoid carrier and restriction statement, and the group-only inverse dictionary. The Fitting theorem retains Artinian and Noetherian module assumptions; it does not identify valuation-zero eigenspaces over a p-adic field. The controlled-lift theorem has surjections *onto* a fixed submodule; the natural quotient comparison here is obtained from its filtration control and is stated with its actual image and square.

Checked the current upstream checkout at **0d144d044dacebca17b654695b6f1ad58f159b27** and current Tau Ceti at **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**, by mathematical object as well as names. This included all nine newer roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Their targets do not supply the arithmetic P-ordinary, degree-shifting or two-system patching targets here. In particular, LocalGaloisGroups treats local Galois presentations and trivial-coefficient comparisons, and ProfiniteArithmetic explicitly defers continuous cohomology. Current rational Weyl modules still require a Q-algebra and do not replace integral dual Weyl lattices.

The relevant overlaps are already boundary deferrals: general Bruhat decomposition, group induction and derived invariants, compact continuous cohomology, finite stable-image/localization theory, Artin–Rees, determinant reconstruction and algebraic induction. Read the current IHG §§0.7, 1.6, 2.3 and SR.6.5 contracts. Read the current discrete-coinduction `traceLinear` and `trace_eq_sum_transversal`; the degree-zero transfer composes this existing sum with the raw contracting operator rather than rebuilding a trace. The local Bruhat targets retain right **P**-translation and P-double-coset strata; the parent's Borel-chart targets have right **B**-translation. The arithmetic variants therefore remain distinct. **No further owned target removal was required.** The dependency/name corrections above are the changes resulting from this audit.

`data/library-coverage.json` has no direct entry for this extension. Its AG2.2/AG2.5 entries mark the automorphic parameter, Galois and local–global exports as absent, consistent with keeping them as named supplier contracts. Direct inspection of the current library, rather than that older inventory alone, informed the duplication decision.

## Source audit

Read CN **2301.10509v3** and AKT **1910.12986v2**, using their printed preprint pages. The random sample is reproducible as `random.Random(7481).sample(packet["nodes"], 15)`, in the packet's node order. Each sampled passage was opened and its statement and necessary proof context read; all fifteen agree after expanding the standing notation.

| Sampled target | Confirmed CN locator | Point checked |
|---|---|---|
| `levi_coefficient_tensor` | Lemma 2.2.14, p.30 | Two conjugate places, weight reversal and tensor factors |
| `ordinary_commutes_compact_invariants` | Lemma 2.2.4, p.27 | Exact localization and compact Levi invariants |
| `IotaQOrdinary` | Definition 3.1.1, p.43 | Every partial operator has valuation-zero eigenvalue |
| `local_constituent_separating_twist` | Sub-lemma 1, pp.70–71 | Prime-to-p character and the two local restrictions |
| `pgl2_hecke_galois_representation` | Proposition 5.5.2, pp.80–81 | Derived Hecke image, uniform nilpotence and trace descent |
| `coefficient_evaluation_surjective` | Lemma 2.1.12, pp.17–18 | Integral evaluation, not only rational highest weights |
| `bruhat_filtration_exact` | Proposition 2.3.3, p.34 | Quotient sums over every stratum of that length |
| `integral_local_global_deformation_factorization` | Theorem 4.2.15, pp.71–72 | Torsion Hecke target and auxiliary finite-flat lift |
| `rescaled_lattice_stable` | Lemma 2.1.17, p.20 | Inverse lowest-weight scalar and integral stability |
| `ParahoricVariant` | §2.2.11, p.29 | Q-level variant does not replace POrd by all QOrd operators |
| `PreparedPGL2Level` | Proposition 5.6.1 proof, pp.82–83 | Three parabolic branches and choice of the mixed place |
| `completed_siegel_boundary_summand` | Theorem 4.1.3, p.54 | Hecke-equivariant derived summand |
| `InductionFiltrationFunctors` | §2.3.1, p.34 | Open unions and compact support modulo left P |
| `q_ordinary_crystalline_blocks` | Theorem 3.1.2, pp.43–44 | Strict block slopes, Hodge weights, zero monodromy |
| `parabolic_cohomology_inflation` | Lemma 4.1.6, pp.55–56 | Arithmetic congruence-tower acyclicity, not a Lie-algebra formula |

The author's uncollated supplier citations were also audited. Jantzen **I.3.3–3.7, pp.38–41** was read in the maintainer-cleared 2003 book, without copying it or recording an excerpt. It fixes induction covariance, translation, reciprocity and the flatness conditions. Read Kisin's author-hosted Lecture 1 **Theorem 1.4.1, pp.3–4**, and Gee's AWS notes **Lemma 3.7, pp.12–13**: the former supplies strict conjugacy; the latter also supplies descent to the closed coefficient subring. Their hypotheses agree with the explicit supplier contract.

Read DDT **Theorem 2.47(b), p.81** for the finite projective-image classification; Newton–Thorne **§2.2.7, Proposition 2.10 and Corollary 2.11, pp.13–14** for integral Levi splitting; Calegari–Geraghty **Lemma 6.2, p.65** for the perfect-complex codimension/depth bound; Emerton **Lemma 2.1.10, p.4** for the injective embedding criterion; and Hauseux's **Lemme 3.3.1, p.26** for higher-cohomology contracting-operator vanishing. The Hauseux locator is in the extensions-between-principal-series paper, not the later parabolic-induction paper's Proposition 3.3.1.

Additionally read ACC+ **Theorems 2.4.2, 2.4.4**, **Lemma 6.3.7, p.156**, and **Proposition 6.5.13, pp.175–176** in the preprint, together with the published coefficient passages. Read AKT **Proposition A.4, Lemma A.5 and Proposition A.6, pp.86–87**: the small-image and p=5 exception hypotheses, degree-one Taylor–Wiles primes, dual-Selmer killing and the generator count are preserved.

**Historical-reference limit:** Cab84's original main theorem and Ger19 §5.2 were not directly accessible in this run. This is explicitly marked in the README. The precise P-stability claim is independently sourced to CN Lemma 4.2.3 and proof, p.60, and the potentially ordinary hypothesis to CN Theorem 5.2(5b), p.74. There is no retained unsupported Cab84 proposition-number claim. Direct page-level collation of those two originals belongs with their supplier sources; it is not represented as completed. Other citations internal to proofs of supplied deformation and p-adic Hodge results are likewise not a claim of an independent proof audit of those whole theories.

## Adversarial mathematics pass

Read every target, supplementary identity and convention. The rows cover all 97 targets, grouped by layer, and record the most useful discriminating instances. Global number-field targets retain their standing hypotheses; empty-rank or equal-characteristic examples are used only where the algebraic carrier admits them.

| Statements checked | Instances and witnesses | Result or correction |
|---|---|---|
| Conventions; CL.0, 10 targets | n=0,1,2 block exchange; exponents (−1,−2) versus (0,1); unitary weight (1,1,0,0); inverse scalar rescaling; GL₂ Hecke polynomial X²−T₁X+qT₂ | Negative common shifts remain allowed. Full reversal fails the n=2 witness. Scalar denominators are units in E. Repaired coefficient supplier ownership. |
| CL.1, 13 targets | U=1, U=0, mixed diag(1,0); trivial group; contraction z↦pz on Z_p with F_p coefficients; empty selected set | Transfer is the sum of p terms and is zero, so raw identity and averaging would be wrong. Exact smooth localization is distinct from the finite projector. Repaired smooth monoid supplier ownership. |
| CL.2, 6 targets | m=1; trivial selected weight; the kernel with ũ^m=0; upper versus lower congruence invariants for dual coefficients | Inverting the prescribed operator kills the kernel. Dual ordinary control keeps inverse operators and opposite orientation; dual cohomology is not an unshifted linear dual. |
| CL.3, 16 targets and naturality supplements | GL₂ longest cell Q_p; characteristic function of Z_p versus constant 1; χ(diag(2,1)) mod 5 = 3; χ(diag(p,1))=1; U₀=Z_p^r with r=0,1; N′=pZ_p at ambient depths one and two | Replaced vacuous compact-support check and added inverse-orientation example. Degree-one ambient image is zero, while intrinsic N′/pN′ is nonzero; depth two repairs the actual square. Artin–Rees shift precedes all quotients and depths. |
| CL.4, 5 targets | Two commuting operators 1,p on an E-line; zero weight in rank four with blocks (2,2); equality versus strict Newton/Hodge inequality | Nonzero Fitting range is insufficient for the all-unit subspace. Lists (0,1) and (2,3) fix block order. Crystallinity uses zero monodromy, not unramified traces alone. |
| CL.5, 8 targets | Empty places; zero selected weights; rank-one U₀=Z_p; zero module versus trivial coefficient line | Corrected the coefficient checks: the zero module has zero cohomology, whereas trivial R_m has H⁰=H¹=R_m. Full-degree nonvanishing is restricted to zero selected weights. Tower acyclicity retains its arithmetic proof obligation. |
| CL.6, 13 targets | n=3,D=3,R=2,q=13 gives d−q=14≤18; n=0; q>d; complex O→O with differential ϖ; characters with equal central but unequal partial-operator values | Floor/ceiling and natural subtraction are consistent. Reduction creates H⁰ not present integrally, so no automatic reduction map of integral Hecke images is assumed. CTG and all partial eigencharacters remain required. |
| CL.7, 7 targets | B=O→A=O/ϖ; two generic factors; p∣n negative control; totally real F with F⁺=F | Only auxiliary B is finite flat. Actual corner, full determinant laws, generic bases and continuity remain inputs. Fixed-determinant section requires p∤n. Cyclic preparation leaves the selected local fields unchanged for crystalline descent. |
| CL.8, 7 targets | Special-fibre generic primes (ϖ,x),(ϖ,y) of O[[x,y]]/(xy−ϖ²) versus closed point (ϖ,x,y); two complexes with identified residual fibers; non-neat finite stabilizers | Unique generic generalization is not asserted at a closed point. Support uses derived Hecke images modulo nilpotents, not a fictitious strict deformation-ring complex. Perfectness over R_m needs bounded derived residue reduction. |
| CL.9, 12 targets | Empty Q and empty character set; unequal/equal Frobenius eigenvalues; all three prepared partitions; p=2 excluded; p=3,5 cyclotomic degree; cyclic diagonal image; characteristic-seven binary tetrahedral image | Diamond augmentation gives the unramified quotient, not an unrestricted forgetting map. The ambient projective quotient retains a nontrivial cyclic image. The cubic tetrahedral exception is retained in the finite-image criterion and final theorem; preservation of full residual image and cyclotomic degree is explicit. |

Independent arithmetic calculations checked the degree inequality for n=0..9, D,R=0..19 and q=0..199 under its hypotheses, and block-exchange involutivity for n=0..9. These checks are negative-control searches, not proofs of the general targets. The characteristic-seven matrix closure has order 24, determinant image of order 3, projective image of order 12, determinant kernel of order 8 and projective kernel image of order 4. The trace-square identity holds on all 16 elements outside the kernel. The invertible anticommuting quaternion generators cannot share an eigenline over any characteristic-seven extension, so the negative control is absolute, not just a test for F₇-rational lines.

## Lean signature audit and validation

Checked all nine light definitions and all four theorem signatures, exceeding the ten-signature requirement:

| Signature | Contract checked |
|---|---|
| `WeylElements` and `WeylElements_levi_conjugation` | Existing block permutation; arbitrary commutative ring; block exchange, no transpose |
| `PositiveCentralCocharacters` | Antitone integral exponents, closed under addition, no nonnegativity restriction |
| `lowestWeightScalar` | Single-embedding unit-valued specialization with reversed weight indices |
| `RescaledActions` | Field, monoid and module hypotheses; inverse scalar character; no claimed integral stability |
| `adicSubmoduleImage` and `adicSubmoduleImageMap` | Actual image in ambient p-power quotient and its canonical surjection |
| `subquotient_mod_p_pow_uniform` | Finite ambient Z_p-module, chosen submodule, one shift before all quotient maps and positive depths, commuting square |
| `degree_shift_bound` | Natural variables; two numerical hypotheses; odd floor and truncated subtraction |
| `projectiveMatrixImage` | Range in ambient PGL₂, not quotient by the centre of the image |
| `determinantKernelHasLine` | A one-dimensional K-submodule stable under every determinant-one element |
| `determinant_kernel_reducible_except_tetrahedral` | Finite source, algebraically closed characteristic p, odd p, nontrivial determinant image, full trace hypothesis and cubic tetrahedral alternative |
| `preparedUnitaryPartition` | Light combinatorial value; README imposes the admissible orientation stᶜ≤st |

Final `lean-check` **exited 0** at Mathlib 082e2d3 / Tau Ceti f790474. The only warnings were **24 declarations using `sorry`**: four milestone theorems and twenty examples. Suggested.lean has **313 lines**. Its nine definitions have real bodies; there is no admitted data definition, `True` placeholder, circular hypothesis or `Prop := sorry`. Every README definition/construction appears as a declaration or in the closing comment.

Final file validation: `intake.py check-files` on all six deliverable/handoff files returned **0 problems**; JSON parsed; metadata remained one line; `git diff --check` passed. Packet validation separately returned **0 errors and 0 warnings**. No source excerpt, private path or copied source file was added.

## Remaining work

No package defect requiring a checkpoint remains. The next step is the maintainer's draft upstream submission and its independent gate. The exact supplier contracts describe future formalization obligations and must remain visible. The Cab84/Ger19 historical-reference source gap is explicitly documented; this review does not certify their original page-level citations or the full proofs of imported theories.
