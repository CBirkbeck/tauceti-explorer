# Independent package review: Euler systems and Kolyvagin systems

Job: `REV-PKG-EulerSystemsAndKolyvaginSystems~codex3`; issue #11277. Reviewer: Codex, session `codex-E4BoFt`, 2026-10-20.

**Verdict: accepted with the corrections below and the expressly permitted open subtargets retained.** This accepts a roadmap, not proofs of its proposed theorems. In particular, the four residue items specified in the issue remain mathematical work for formalisation. They are neither supplied by Lean elaboration nor silently imported from the cited papers. The central dependency-order registry still needs the integration action recorded below before an upstream port.

## Scope, independence and conservation

I did not write the package under review. I read the accepted packet and its resolved imports, the available original package-review report, the fourth- and fifth-round fix handoffs, and the incoming `review.json`. The older suffixed review report named in the generated issue is absent from this checkout; the available unsuffixed report supplies the D1–D5 findings. Prior workers' descriptions were leads to inspect, rather than evidence of correctness.

The resolved plan has 151 target records, 429 API entries and 232 test entries. I compared these with the README, read the statements and prerequisite chains through all nine layers, and read every definition's API and Checks. All 429 API names are now represented. Of the 151 target records, 149 map to numbered sections and two to the opening propagation and Euler-characteristic contracts. The added finite-R comparison and local-order construction are also numbered sections; consequently numbered-section count alone is not a conservation proof.

Five accepted test labels have been replaced by more precise tests, with their content retained: the nonfree scalar test in 0.3; the two distinct rank-one BSS tests in 6.2; the strict-dual-zero and freeness tests there; the zero and rank-one norm checks in 7.1; and the separate transverse-condition and edge-relation requirements in 8.12. In the last case, calling the raw weak system an object with no edge relations would itself be inaccurate. No packet was edited.

The README retains its full detail. The binding 2026-10-12 shape rule supersedes the generated issue's older 200 KB instruction. I compared its form with current upstream ProfiniteArithmetic and LocalGaloisGroups: scope and conventions, supplier contracts, successive layers with exact hypotheses, named APIs and discriminating Checks, and dependencies. `metadata.toml` remains the fitting single line `topic = "math.NT"`. No source passage or source-by-source synopsis was added.

## Corrections made

1. **Missing general API:** restored `KolyvaginSystems.divisibilityIndex` as the supremum of maximal-ideal divisibility depths over a commutative local ring. It is distinct from the truncated principal-artinian system invariant. Three Checks cover zero, a nonzero residue, powers of p, and the nonseparated module Q_p over Z_p. Restored the accepted name `EulerSystems.deltaCorrection` for the higher derivative's determinant correction. Both are listed in the Lean closing inventory.
2. **Coefficient hypotheses:** made the noetherian assumption explicit wherever the BSS self-injective local coefficient convention is invoked. BSS II §2, p.7 supplies that convention; finite residue field plus arbitrary local self-injectivity is not a sufficient replacement. This preserves the general nonprincipal finite-R branch.
3. **Prime selection:** corrected 4.10's explanation to use affine bad cosets in a common finite quotient. Each of the two sets has index at least p, so the excluded proportion is at most 2/p. This explains the odd-prime hypothesis; an assertion about the union of two subgroups alone would not explain the affine evaluation.
4. **Specialisation and its owner:** PadicMeasuresIwasawaAlgebras Layer 4 supplies the height-one classification and structure theorem, but does not state the perturbation-length comparison attributed to it. Named the application `KolyvaginSystem.specializationLength` in 8.18, with an elementary-module proof plan and separate horizontal and coefficient-prime formulas. For a uniformizer ϖ, these are `md·ord_(g) char(Z)+O(1)` along `g+ϖ^m`, and `m·ord_(ϖ) char(Z)+O(1)` along `T^m+ϖ`, measured in O-length. Conversion to Z_p-length multiplies by the residue degree. The corresponding p-power horizontal formula in the opening contract is compatible with this normalization. The paired argument remains in 8.28. Added horizontal, vertical and finite-error Checks; the finite module Λ/(ϖ,T) demonstrates why the bounded error cannot be omitted.
5. **Ramified coefficients:** 8.31 now uses ϖ in its finite-extension formulation, specifies its DVR lengths, and distinguishes the varying descent error from the uniformly bounded comparison errors required for the paired structure. The coefficient-prime perturbation is `T^m+ϖ`, whose quotient is already normal with index one. `T^m+p` can fail to be Eisenstein when O is ramified. The linear perturbation Check now requires depth at least one.
6. **Negative controls:** qualified the nonprimitive-bottom-class example to start with a primitive system whose bottom class is nonzero. Restored concrete norm/augmentation tests, the Hilbert-class-field and roots-and-units tests of Rubin's hypothesis, and the reducible trivial rank-two infinite-cohomology test. These distinguish the individual fields and hypotheses instead of testing only the coinvariant rank.
7. **Existing algebra:** added exact boundary deferrals to current Tau Ceti's finite Wedderburn algebra presentation and opposite endomorphism-ring comparison. The local valuation, integral lattice and rectangular two-centralizer refinements remain here.
8. **Source access:** changed the eight published Rubin links to the working non-www host. Draft and published numbering remain distinguished.

## The four permitted open subtargets

The issue specifically permits acceptance with these targets when their general statements, supported cases and obstructions are explicit. I checked the actual definitions in 2.8, 3.16 and 4.9, rather than treating the issue's permission as a correctness certificate.

| Subtarget | General obligation retained | Established case and control separating it |
| --- | --- | --- |
| `chiGlobalDerivativeCongruence` | Actual global χ-Euler families on the original broad prime set must give norm-lift-independent invariant derivatives for every d dividing p−1. | The refined set uses the full field E_M, all root coinvariants and `X^d−1` divisibility modulo M. Ordinary admissible towers have Rubin's proof. The broad-prime congruence is not deduced from residue-unit orders alone. |
| `chiCompatibleCochainLifts` | Compatible equivariant lifts and independence after applying the derivative, without assuming finite-level invariant vanishing; the semidirect presentation also needs its base-change/Ext control. | If `H⁰(L_r,W_M)=0`, the coinduced kernel is injective and the lifts split; their difference is killed by the connecting map. Under residual irreducibility and d>1 the stated p-extension argument gives this vanishing in the exponent-bound application. A lattice with Frobenius 1+p has no lattice invariants but has residual invariants, rejecting a false shortcut. |
| `chiRayCongruenceLift` / `chiRayTorsionCongruence` | An O-linear natural construction from lower, unramified family data must lift the norm class, and the actual upper class must have zero difference in `H[e_χ]`. The upper ramified component is excluded from the construction's input. | For ordinary d=1 the integral divided-polynomial formula and admissible-tower argument apply. A trivial/zero torsion obstruction permits cancellation only under its stated hypothesis. In rigidity alternative (c), the specified congruence is additional family data, imposed after construction. The norm relation alone leaves an undetermined torsion class. |
| `SharpConductorEvaluation.functional_descent` | Recover the sharper `c₀d₀` bound for the original conductor pair by eliminating or bypassing the restriction obstruction. | A functional descends exactly when its restriction to the tensor kernel is zero. Annihilating that kernel does not suffice: the identity on Z/9 is nonzero on 3(Z/9), although 3 kills that submodule. The valid uniform `c₀d₀³` bound remains available, and maximal orders give the sharp constant one. |

The χ theory retains all three alternatives of published Rubin Definition 9.4.1 and every d dividing p−1. The full translated O[G_r] Euler relations are imposed before evaluation on actual global classes; no cyclicity or relative freeness is assumed from the presentation. The local residue-unit χ-part has order controlled by `Q−χ(s)`, with the singular Q-inverse twist. Its norm equation specifies a class modulo `H[e_χ]`, not a division in H. The p=3, q=2 rank-one control and the p=3, q=17 rank-two control distinguish the refined derivative congruence from an unjustified integral ordinary denominator. They are local controls, not claimed global counterexamples. Published §9.4's proof sketch is not labelled a complete proof of the semidirect lifting or general integral comparison.

The exponent theorem consumes these inputs and measures annihilator exponent. It is not the inherited all-prime square-index *length* theorem with a constant independent of the imaginary quadratic field. That application boundary remains separate. The original Kolyvagin paper was not inspected in this review; its unread-source limitation remains explicit.

## Independent assessment of D1–D3, D5 and the CM consequence

**D1, local orders and pairing.** I checked 4.8 against the division valuation and maximal-order sources, including the positive-characteristic trace issue. The determinant valuation is normalized by the full F-dimension; the nondegenerate trace is reduced trace followed by the separable centre trace, not the potentially zero regular trace. Minimal-valuation division and matrix reduction give the one-sided ideal and cyclic-module statements. A column over a matrix order is projective, generally not free. The rectangular model `M_(n,m)(Δ)` retains both positive multiplicities, both full corners and the opposite-ring endomorphism convention.

In 4.9, finiteness of W is essential for the corner cardinality argument. The two conductor maps compose to d₀ on the extended finite module. The reduction kernel gives `d₀²K=0`; multiplying the extended functional by d₀² allows descent. Multiplication by c₀ brings its maximal-order image into X, and the return through the lattice reduction costs one more d₀. This yields `c₀d₀³`, uniformly in N. The infinite direct-sum pairing is excluded; the zero representation and maximal-order cases are treated separately. I found no missing multiplicity or non-zero-divisor assumption in this route.

**D2, finite-R arithmetic duality.** In 0.2 the finite noetherian self-injective local ring has a rank-one Matlis character module. A chosen generator λ identifies `Hom_R(A,R)(1)` with the additive Cartier dual, including nonfree finite A. The arithmetic R-valued pairing is specified by evaluating λ on every scalar multiple; a change of generator is accounted for by a unit. Local orthogonality transports through images and inverse images, retaining coefficient H¹ kernels. The six-term Selmer sequence follows from finite Poitou–Tate with that dictionary. General quotients are not asserted to stay self-injective. The nonprincipal Frobenius-ring and dual-numbers trace examples test precisely the extra generality; a constant-coefficient trace is degenerate. This supplies the BSS comparison, rather than claiming O-adic duality already has that scope.

**D3, coefficient-prime application.** In 8.34–8.35 I checked both residual-character orientations and the global-invariant and augmentation hypotheses against Keller–Yin. The use of finite-character unramified μ-vanishing is retained as arithmetic input. Finite residual Selmer/control errors give finiteness modulo ϖ and hence the torsion μ-zero claim. Local ordinary graded characters have the cyclotomic powers appropriate to weight r; an unramified quotient is available only in its stated weight-one case. The local correction modules are O-cofinite, not automatically finite. Their Iwasawa H² obstructions are killed by a polynomial nonzero modulo ϖ, so disappear after localization at `(ϖ)`.

The compact H⁰ vanishing makes localized local H¹ torsion-free, with ranks 1, 1 and 2. The inertia determinant kills strict/unramified correction terms after the same localization. The two nested Poitou–Tate comparisons are both needed: first `(o,0)⊂(f,0)` obtains a free rank-one dual module, then `(o,0)⊂(o,o)` embeds the remaining torsion correction in a free module and kills it. Kernel terms and finite-character controls have not been removed by a rank count. The prime `(γ−1)` is kept separate from `(ϖ)`.

**D5, repaired MR16 fields.** The printed containment in MR16 (H.2) does not determine the representation action used in Lemma 4.5; the F₅ quadratic-character example at 11 confirms this. The package uses `E=L·H_M(T)` and requires (H.3) over E. The cyclotomic quadratic-unit example explains why allowing arbitrary L with only the old vanishing would be false. Finite-level E_k are nested; residual inflation runs from E_k to E_infinity. Chebotarev is applied to finite extensions at each level.

For small p, the argument distinguishes k-nonisomorphism from F_p-nonisomorphism. After a coboundary adjustment, the bad conditions are linear; distinct prime-field simple types separate them. A common type with different k-structures has a finite subfield of order at least p², on which four proper linear subspaces cannot cover. The F₄ character example tests this branch. The MR04 bridge uses its actual Frobenius containment. The prime-to-p character applications use the Kummer-character exclusions, and the large-image symplectic application uses a regular unipotent with rank-one coinvariants; a single higher-dimensional transvection would fail.

**CM consequence.** I read Nekovář's coefficient data, non-CM hypothesis and both error-constant branches, and the Castella–Hsieh canonical CM alternatives. In 4.13 the replacement for the pairing constant depends only on the two fixed orders, not coefficient depth. Inserting the valuation of `c₀d₀³` in the error term therefore preserves the uniformity required by this application. The sharper unverified conductor target is not needed for that uniform consequence. This does not upgrade the separate exponent bound into the inherited uniform square-index length formula.

## Source checks

The deterministic random sample used seed 11277 on the README's citation occurrences. All fifteen locators were opened and checked. Pages in this table are source page numbers. Results are stated in my own words.

| README section | Version and locator inspected | Assessment |
| --- | --- | --- |
| 1.12 | Mazur–Rubin 2004, §3.5, pp.27–28 | The full (H.0)–(H.6) list is retained. |
| 0.10 | MR16 arXiv:1312.4052v1, Theorem 5.4, p.10 | The archimedean core-rank contribution matches. |
| 4.15 | MR04, Theorem 4.1.16, p.39 | Prescribed-submodule leading vertices agree. |
| 2.9 | Castella–Hsieh author PDF, Lemma 4.7 and proof, pp.18–19 | Rational Frobenius, not its cohomological square, is used in the norm congruence. |
| 8.4 | Rubin 1999 draft, II §3 Definition 3.1, p.28 | Tower class and hypotheses agree. |
| 3.18 | Published Rubin, Example 4.8.2 and (4.13), p.103 | Denominator is over K(1); completion convention retained. |
| 4.18 | CGLS arXiv:2008.02571v2, Theorem 3.2.1, p.17 | The stated error constants and coefficient scope agree. |
| 8.27 | MR04, Corollary 5.3.19, p.65 | Nonzero system gives the stated weak-Leopoldt consequence. |
| 4.12 | MR04, Theorem 4.1.10 and Definition 4.1.11, p.38 | Core and leading vertex conventions agree. |
| 0.8 | MR04, Theorem 4.1.5 and Definition 4.1.11, pp.36–38 | Core rank concerns the Selmer structure, with the stated base-field scope. |
| 4.10 | Rubin draft, V Lemma 2.3, p.81; Lemma 2.1 proof, pp.79–81 | Locator valid; corrected affine-coset proof explanation. |
| 4.16 | MR04, Definition 4.3.1, p.41 | Stub module and edge construction agree. |
| 7.2 | BSS II arXiv:1805.08448v1, Corollary 6.13, p.42, with §6 hypotheses | Higher derivative retains its required arithmetic hypotheses. |
| 3.11 | Rubin draft, IV §5 Lemma 5.2/Definition 5.3, pp.67–68; §7 proof, p.76 | Lifted telescoping and finite–singular sign agree. |
| 5.9 | MR04, Proposition 6.2.6, p.75 | Arithmetic nonprimitivity is not identified with vanishing of the bottom class. |

Additional issue-flagged passages read include published Rubin Theorems 9.3.3 and 9.4.3 and Definition 9.4.1, pp.179–183; MR16 published §4, pp.154–155 and its v1 global consumers; BSS II §2 p.7 and Theorem 3.1 p.12; Keller–Yin arXiv:2402.12781v2, §§1.2–1.4 pp.13–25; Nekovář §§3, 5.19, 6.4 and 7.3; Yu arXiv:1105.2897v1, Lemma 4.4/Theorem 4.5 pp.12–13 and Lemma 5.2 p.14; Milne CFT IV §§1,4 pp.124–125,139–140; and Landesman–Swaminathan–Tao–Xu arXiv:1607.04698v2, Theorem 1 p.1 and §2.2 pp.3–4. For the new local specialization application I checked MR04 proof of Theorem 5.3.10 p.66 and Howard arXiv:1202.6340v1 proof of Theorem 2.2.10 pp.27–28. The finite-extension normalization is explained as an algebraic extension of those arguments.

Public source links are in the package's References and at the individual targets. I read the cleared-library index; no restricted book was used or copied. The original Kolyvagin article remains outside this review's inspected sources. No claim to have verified every source citation is intended by the fifteen-locator sample.

## Existing libraries, supplier contracts and ownership

The pinned elaboration uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. I inspected actual declarations for discrete H¹, right-translation coinduction and closed-subgroup Shapiro, PID torsion decomposition, module length, the DVR class, monic division, Frobenius pairings, characteristic polynomials and linear-map kernels/images. Discrete H¹ is not presumed to supply the missing compact arithmetic carriers.

Current upstream was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot roadmaps and Completed roadmaps. Current Tau Ceti was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object-based searches and local reading covered coinduction, residual p-group irreducibility, Frobenius rings, Fitting ideals and base change, Morita corners, semisimple presentations and matrix endomorphisms. The existing generic algebra is deferred; no further arithmetic target removal was justified. ReductiveGroups Part II's use of local division orders in buildings does not already supply this integral two-centralizer lattice API. IntegralLattices' commutative material does not replace it either.

I checked supplier statements rather than just matching their titles: ClassicalArithmeticCompletion 7.21/7.56; SelmerIwasawaCohomology 2.5, 2.10, 2.16–17, 3.2–3.5, 3.12, 4.12 and 4.25; ArithmeticGaloisDuality R02.4.3, R02.5.1 and D7's compact-Shapiro and Matlis contracts; PadicMeasuresIwasawaAlgebras Layers 1, 4, 5 and 6; current ClassFieldTheory Layers 5, 7, 12 and 13; Chebotarev Layer 10; ProfiniteCohomology Layer 11; and EllipticCurves Layer 7. Their remaining formalisation targets are used as roadmap inputs, not described as library theorems. The perturbation application misattribution was corrected as described above. Generic multivariable Iwasawa algebra, twisting, continuous Nakayama and group-ring algebra remain with their existing owners.

No ownership transfer or packet change is needed. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder survives. Geometric Euler-family verifications are application premises, avoiding an upward dependency on HeegnerPointEulerSystems.

## Lean signature audit

The 507-line file has ten light real-bodied definitions, fourteen named theorems (twelve admitted milestones), and proved examples. It has no admitted data, admitted example, `set_option`, vacuous `True` target or invented arithmetic carrier. The following comparisons exceed the required ten signatures.

| Signature or group | Hypothesis, direction or boundary checked |
| --- | --- |
| `IsMatlisGenerator` and its equivalence | Finite local scope; zero character fails on a nonzero ring; standard Z/N character is injective. |
| `expAt` | Infimum of killing powers; zero exponent is 0, not infinity. |
| `ordAt` | Supremum of division depths; zero has value infinity. |
| `expAt_ordAt_zmod_nine` | Element 3 has both values 1; element 1 has killing exponent 2. |
| `abundanceExponent` | Initial values 1,1; next values 4,10 fix the recurrence. |
| `charError` | Lean specializes to Z_p-valued units; the general coefficient version remains a separate README target. |
| `eulerPoly` / constant coefficient | Reverse characteristic polynomial is `det(1−fX)` and has constant 1. |
| `aeval_inv_eulerPoly_eq_zero` | Requires an actual linear equivalence and evaluates at its inverse. |
| `eulerPoly_id_rank_one` | Value `1−X` fixes the characteristic-polynomial sign. |
| `kolyvaginDerivative` | Weights 0 through m−1; order 2 gives σ, order 3 gives σ+2σ². |
| `liftedNorm` and telescoping | Before imposing σ^m=1, norm uses powers 1 through m and right side is mσ^m−N. |
| Cyclic telescoping | The power-one hypothesis is explicit; the trivial-group derivative is zero. |
| `fsQuotientPoly_spec` | Exact monic division of P−P(1); for P=1−X its quotient is −1. |
| `selectedDescent_eq/spec/zero` | Formula is a² times a preimage of ax; kernel killing gives independence, image gives cubic scale. |
| `selectedDescent_factor` | Uses the intermediate global map's kernel bound; does not assume bounded local ramified restriction. |
| `scaled_inverse` | Irreducible uniformizer, c<n, actual image containment, both matrix products; rank zero is allowed. |

The χ and functional-descent examples test the actual polynomial or linear-map obstructions, not general assertions that the arithmetic theory has been implemented. The closing comment preserves names for heavy README definitions; this review adds the two recovered API names there.

## Adversarial pass

I checked every target and definition through the following groups. An outcome of “retained” records consistency under the stated hypotheses and the tested cases, not an additional proof of each proposed theorem.

| Targets / conventions | Instances and calculation | Result |
| --- | --- | --- |
| Opening contracts; 0.1–0.6 | Zero coefficients, empty conductor set, multiplication by ϖ between quotients, nonsurjective H¹ coefficient maps; nonprincipal self-injective rings | Preserve image/inverse-image distinction and finite-R comparison; noetherian scope made explicit. |
| 0.7–0.10 | Core ranks −2,0,1; trivial and cyclotomic characters; levels ϖ and ϖ² | Signed core rank differs from absolute rank; archimedean and local invariants remain. |
| 1.1–1.10 | Conductor one, nontrivial p-class group, Fr=1 versus Fr−1 a unit, zero module, Z/9, strict/relaxed/transverse local lines | Base is K(1); tensor and inverse-twist directions retained; no division by a vanishing operator. |
| 1.11–1.16; 1.21–1.23 | Empty tuple, scalar localization ϖ^a, p=2,3, F₄ character pair, hidden residual field, affine prime-selection conditions | Span and prescribed-kernel assumptions retained; repaired MR16 field and (H.3) scope independently audited. |
| 1.17–1.20 | Exceptional characters 1 and ω; elliptic classical versus canonical structure; transvection versus regular unipotent | No false admissibility converse or core-rank-one assertion from representation rank alone. |
| 2.1–2.7 | Rank zero, rank-one identity, trivial extension, changed Euler factor, inverse character | Euler polynomial constant and norm direction fixed; twisted norm relation is not unconditional identity. |
| 2.8–2.9 | d=1 and d>1, p=3 q=2 and q=17, residue degree greater than one, all three rigidity alternatives, both canonical CM branches | Integral χ comparison remains explicit work; ordinary denominator is not copied to the χ-ray case. |
| 3.1–3.4; 3.9–3.15 | Cyclic orders 1,2,3, lifted m=0, norm/derivative augmentation, P=1−X, conductor one | Restored norm tests; lifted versus cyclic telescope and finite–singular signs retained. |
| 3.5–3.8 | Identity restriction, multiplication by 5, nontrivial intermediate kernel, local ramification | Cubic selected descent and global factorization retained. |
| 3.16–3.20 | Nonreduced O/M, all roots with unit differences, norm-lift change, residual invariants, cochain change by t, two primes | Refined invariance is proved at its stated scope; broad invariance and general compatible lifting remain named obligations. |
| 4.1–4.7; 4.10–4.12; 4.14–4.20 | Zero stalk, empty graph, unit ideal, odd/even eigenspaces, scaled primitive section, infinite error cohomology | Graph labels, exponent/length distinction and hypothesis scopes retained; affine explanation and missing negative controls corrected. |
| 4.8–4.9 | F₂((t)), quaternion division algebra, M₂(F) lattice, rectangular M_(2,3), product centre, zero V, infinite W, depth N | Opposite side and multiplicities retained; finite-W `c₀d₀³` proof works uniformly; sharp obstruction kept. |
| 4.13; 4.21 | All primes including 2, two character-error branches, zero leading class, complementary finite-depth ideal | Larger uniform conductor constant preserves CM application; annihilator exponent is not length. |
| 5.1–5.13 | Zero system, length-two artinian ring, p³ then p² scaling, Q_p as Z_p-module, paired elementary divisors | Restored general index; finite truncated invariant differs from infinity; nonprimitive-bottom example qualified. |
| 6.1–6.9 | Rank zero/one, torsion bidual, nonprincipal coefficients, zero dual Selmer group, coefficient quotient not self-injective | Bidual rather than exterior power retained; transition and freeness hypotheses kept; separate BSS records remain distinct. |
| 7.1–7.7 | Rank zero, rank-one norm, two-prime determinant correction, orientation change, modified unit group, minus part | Determinant correction name restored; Rubin–Stark existence and class-group applications retain their arithmetic premises. |
| 8.1–8.17 | Trivial/exceptional action, augmentation, multivariable rank, zero leading class, true versus restricted Selmer module | Weak system relations and correction remain distinct; generic algebra stays with its supplier. |
| 8.18–8.24 | `(T)`, `(T²−p³)`, positive perturbation depth, finite pseudo-null module, ramified O | Added named length application and three controls; normalization and Λ-action are not conflated. |
| 8.25–8.33 | Primitive/nonprimitive system, horizontal versus coefficient prime, paired elementary divisors, rank-zero torsion part | Uniform comparison errors remain where paired structure needs them; ϖ replaces invalid ramified p-Eisenstein choice. |
| 8.34–8.39 | Both ordered residual extensions, exceptional/augmentation character, weight r=1 versus r>1, O-cofinite local correction, `(ϖ)` versus `(γ−1)` | Both Poitou–Tate comparisons and μ-input retained; no rank argument discards local kernels. |

Purely algebraic DVR controls allow equal characteristic when stated; number-field coefficient and Iwasawa length formulas retain their mixed-characteristic hypotheses. Odd-prime sign arguments are not extended to p=2. Every restored or new definition has at least three discriminating prose Checks; the representative Lean definitions have proved checks or named boundary theorem targets as appropriate.

## Validation and integration boundary

- `lean-check` exited 0: 507 lines, exactly twelve warnings, all declarations using `sorry`; no other warning or error. All examples are proved. The file's substantive signatures were unchanged by this review.
- Packet validation: zero errors and zero warnings; 27 local and 124 imported targets, nine stages, 26 requests and two explicit gaps. The accepted packet is unchanged.
- Dependency checker: both the unmodified baseline and this candidate report **119 roadmaps, 1,136 edges, one problem** and exit 1. The sole problem is **EulerSystemsAndKolyvaginSystems absent from `ORDER.txt`**. No cycle or upward-edge problem is reported. This is not a passing dependency check and this issue supplies no exemption. Central ordering files are outside this job's allowed edits; the maintainer must register this roadmap after its last supplier before upstream porting. The mathematical review does not remove that integration requirement.
- `intake.py check-files` on the five submitted files: five files, zero problems, exit 0. `git diff --check`: exit 0, no whitespace errors.

No additional mathematical defect remains beyond the four explicitly permitted subtargets and the inherited application/source limits stated above. No suspicious instruction encountered in source or other-worker material was acted upon. This review is complete; central registry integration and future proofs belong to their respective next steps.
