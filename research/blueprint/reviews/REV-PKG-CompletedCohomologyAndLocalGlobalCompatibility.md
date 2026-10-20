# Independent package review: completed cohomology and local–global compatibility

Reviewer: Codex, session codex-duSGPF. Date: 2026-10-20. Job: REV-PKG-CompletedCohomologyAndLocalGlobalCompatibility, issue #10895.

**Verdict: accepted with the corrections in this change.** The package is ready for the draft upstream PR. This accepts a roadmap, not proofs of its arithmetic results. The exact supplier extensions in the README remain mathematical targets, with their prime, residual-image and normalisation restrictions; none is represented as an implemented theorem.

The input package was written by the different session codex-2jsUrj in PR #11073 (commit 0aff6750c). This session did not author that package. The accepted packet was read as input and was not edited. All 49 target subsections remain, all 57 named packet checks remain, and 105 of its 106 API names remain. The sole deletion is the generic `TauCeti.DefiniteQuaternionCompleted.heckeClosure`, already supplied by Mathlib. The arithmetic quaternionic Hecke algebra and its comparison targets remain. New names specify the degree-one Hecke comparison, Pan's twisted factorisation, and the typed patched functor and faithful quotient.

## Form, scope and prerequisite audit

The README retains its summary, boundaries, coefficient and action conventions, exact supplier contracts, six ordered layers, per-layer examples and dependencies, and references. Targets are prose statements with hypotheses, proof routes, locators, API outlines and discriminating checks. I read the UniversalCovers and Multiquadratic upstream README models and compared the arithmetic presentation with the opening and target sections of ModularCurves, ModularForms, AdicSpaces, LocalGaloisGroups and ProfiniteArithmetic. UPSTREAM_GUIDE.md and the package-review shape rules govern the result. Removed process phrasing from the globalisation discussion; its retained content is the mathematical distinction between implications with residual modularity as a hypothesis and implications using Serre's theorem.

The packet contains 49 targets, 31 baseline declarations, 106 API entries and 57 named tests. Every target was compared to its README subsection, rather than using name retention as a substitute for mathematical review. Definition subsections have at least three discriminating checks; theorem-only subsections need not invent additional definitions. In particular, the added boundary-weight, residual-projector, tensor-side and typed-module controls distinguish plausible incorrect definitions.

I read the 31 cited Mathlib declarations at commit 082e2d37e8b0463410cdb532e111cd43d5a66174, including the surrounding hypotheses of the three completion/Mahler theorems. `CompactSpace` does not supply Hausdorffness; `IsLocalRing` includes nontriviality; completion reduction needs a finitely generated ideal; Mahler density needs complete ultrametric coefficients and bounded scalar multiplication. The arithmetic coefficient ring is the mixed-characteristic ring of integers of a finite extension of Q_p, not an arbitrary complete DVR. The Lean signatures that are algebraic over arbitrary fields or rings are separately identified as such in the README.

The current-read-only audit used TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, in addition to the pins. Searches covered the nine newer roadmaps, Completed roadmaps, representation theory and the library, using objects and hypotheses: completed arithmetic towers, continuous equivariant Hom, integral coadmissibility, projective envelopes, central quotient functions, Iwasawa dimension, Hecke closure, typed patched modules and pro-modularity. Generic representation and isotypic vocabulary was checked against the existing carriers; no new intertwining-map carrier is introduced. No matching arithmetic comparison or integral cancellation theorem was found there. The already supplied generic co-Whittaker theory stays a boundary import from SR.5. The generic topological closure API was removed; `Subalgebra.topologicalClosure` is now the boundary reference.

The tier/bundle boundary was checked against upstream/CaraianiNewton.md and the named supplier layers. The three moves down from consumers already recorded in the package remain: pro-modular primes, nice-prime conditions and the global non-crystabelline locally algebraic comparison. Consumer references in the export discussion are not prerequisites. Scholze's geometric SZ.0–SZ.1 layers are inputs; SZ.4–SZ.6 arithmetic applications remain consumers. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisite remains. The new determinant-limit citation is the existing lower-tier IntegralHeckeAndGaloisDeterminants IHG.4, §4.2, whose statement was read; IHG.0's dense-set criterion supplies uniqueness, not existence.

## Corrections made

1. Separated the derived finite-image Hecke algebra of CC.8 from Emerton's faithful degree-one inverse limit. The new `heckeAlgebra_cohomologicalImage` target specifies compatible integral actions, extension to completion and faithfulness. A nilpotent derived-to-cohomological kernel preserves residual labels, not the ring; a subsequent degree-one quotient can discard labels. The quaternionic degree-zero agreement uses concentration in degree zero.
2. Corrected the cyclotomic twist check for geometric Frobenius: epsilon multiplies trace and determinant by l^-1 and l^-2; epsilon^-1 gives the positive powers. The unit-idelic notation in EM-PAMQ is interpreted through its reciprocity convention.
3. Fixed the side of the type tensor over the noncommutative Iwasawa algebra: the first factor is a right module through sigma(k^-1). Its scalar check selects inverse characters on the compact module, giving the stated type on its dual. The trivial-type check now means coinvariants, not the original module.
4. Replaced an overly narrow weight-two determinant comparison by R19.6's geometric Hecke determinant and representability interfaces. Added IHG.4's inverse-limit existence theorem; no tensor-limit commutation is presumed.
5. Specified Pan's Galois factorisation using the twist rho_lambda(-1), and sourced it to PAN-I §6.1.1 and PAN-II §7.1.4. Equality of multiplicity Hom spaces and isotypy of the entire eigenspace are separate steps; the latter uses Eichler–Shimura and Boston–Lenstra–Ribet.
6. Recomputed the Eichler–Shimura deviation identity in §3.5. For X²−TX+D the identity is rho(Frob)(T−tr rho)=1(D−det rho). EM11 (6.1.14), p. 68, prints the deviations with the same sign; the roadmap uses the sign obtained by subtraction, with a diagonal two-eigenvalue witness. The vanishing conclusion of Proposition 6.1.12 is unchanged.
7. Replaced a wrong Shimura H⁰ locator (the cited CDN pages concern quaternionic forms) by Scholze's proof of Proposition 7.7, p. 29. The finite O/varpi^n statement follows from his Q_p/Z_p vanishing by the finite-free coefficient extension, constant-sheaf injection and exact residual localisation. This uses global residual irreducibility, not an additional local irreducibility hypothesis.
8. Corrected Pan's Lemma 3.6.14, formerly called a corollary; expanded Nakamura Theorem 2.1 to pp. 17–18 so its assumptions are included. Clarified exceptional points by using EM11 Definition 3.3.18's double-root formulation. The matrix control does not claim existence of a scalar-Frobenius irreducible Galois representation.
9. Made the potentially diagonalisable regular lift, p not dividing 2n, residual-image and base-change conditions of CEGGPS globalisation explicit. The dyadic path retains its non-solvable image and ordinary seeds. Added primary references for these globalisation leaves and for the BLGG potential-automorphy hypothesis.
10. Identified the published 2004 DFG numbering and kept its ramified-crystalline-short, residual-modularity and quadratic-cyclotomic irreducibility hypotheses. The k=p extension is Emerton's argument on p. 96, not a stronger statement attributed to DFG. Recorded the assumptions of Böckle's original revision.
11. Corrected §6.2's density-to-injectivity step: the dense classical family must lie in the deformation space and factor through the Hecke map. Density in the target alone proves nothing about its kernel. Source reducedness is separately essential; both failures now have explicit controls.
12. Added positive and negative boundary good-weight tests, product-ring residual-projector tests, and named typed patched module/faithful image definitions with regular-module, lattice-scaling and zero-module controls. No arithmetic result was narrowed to make the Lean file shorter.

## Source checks: all author-flagged areas

I opened the specified public versions of the original sources. Twelve downloaded versions agree with the packet's SHA-256 digests: EM11, EM-PAMQ, EM06, CE, NAK, DLB, CDN, CEGGPS, EP, PAN, TUNG-P3 and TUNG-2. Additional primary sources below were read for the flagged supplier statements. Ding and Serre are not part of the random sample or the flagged statements; this report makes no full-source verification claim for them. Sources are identified by the keys and version links in the README.

| Flagged area | Primary passages checked and outcome |
|---|---|
| Scholze comparison | CDN Propositions 4.11–4.12, p. 51, and SCH §§7, pp. 22–24, proof of Proposition 7.7, p. 29. Exchanged quaternion invariants and the typic comparison remain required; only geometric functor layers are imported. |
| R30 extensions and prime ranges | EM11 §§3.1, 3.3 and NAK Proposition B.26. The stronger projective-envelope identification keeps p≥5 and its residual exclusions; small-p finite central maps are different inputs. |
| Ordinary Eisenstein seed | PAN Proposition 5.6.1, p. 86. Existence requires the specified ordinary construction and positive valuation of its p-adic L-value, not merely the generated ideal. |
| Globalisation leaves | CAL Proposition 3.2, pp. 5–6; SNO Propositions 8.2.1–8.2.2, p. 26 and their local hypotheses; KW II Lemma 3.5, p. 22, Theorem 6.1 and construction, pp. 53–56; PAS Lemma 3.29, p. 43; EG Proposition A.2/Corollary A.7, pp. 32–35; BLGG Theorem A.4.1, pp. 36–37. Residual automorphy, potential diagonalisation, adequacy and dyadic non-solvability were not conflated. The final KW II version is used, not an older draft with different section numbering. |
| Integral coadmissible cancellation | EM11 Proposition C.36, p. 112, and C.45–C.52, pp. 114–116. Nonzero orthonormalisable tensor factor, injectivity and saturated image are retained. Generic mixed tensor carriers do not supply these theorems. |
| Böckle/DFG density | BOE Assumption 2.1, p. 3, Corollary 3.5/Theorem 3.7, p. 9, Corollary 3.8/Theorem 3.9, p. 10; DFG Corollary 2.3, p. 698, Theorem 3.6, p. 723; EM11 pp. 95–96; NAK pp. 17–18. Clarified source hypotheses, the endpoint argument and which spectrum needs density. See access limitation below. |
| Unpublished away-from-p fibre input | EM11 Theorem 6.1.2 and surrounding discussion, pp. 66–67. Its citation to unpublished [42] is not independently verified; the exact integral smooth-dual fibre theorem is explicitly a supplier target, not silently assumed to follow from generic co-Whittaker theory. |
| Shimura H⁰ | SCH proof of Proposition 7.7, p. 29, and CDN §4.1.4, pp. 50–51. Corrected locator and supplied finite-coefficient argument; small stabilisers alone do not prove vanishing. |
| Pan/Tung determinant dictionary | PAN §3.3.5, p. 24; TUNG-2 Proposition 4.2.5, pp. 19–20. The determinants psi epsilon^-1 and psi_T epsilon remain separate until the named character/dual/Hecke dictionary is proved. |
| Pan Iwasawa dimension | PAN §3.6, pp. 34–37. Uniform quotient dimension 3[F:Q], associated graded polynomial algebra and block-multiplicity estimates remain separate from commutative support lemmas. Corrected Lemma 3.6.14. |
| Small and good weights | EM11 Theorem 5.7.7 and its inputs, pp. 63–66. The upper bound is not a weight-part converse; coefficient Ihara and good-weight multiplicity-one supplier targets remain explicit. |
| Auxiliary CM Serre weight | EM11 Remark 5.7.4, p. 63, and §7.4, p. 97. Occurrence of the selected weight, not just minimal weight, is required. |
| Algebraic determinant exponent | EM11 Theorem 3.3.22, p. 28, versus §7.4, pp. 97–98. det^(b+1) and det^b cannot be equated; the existing named normalisation comparison remains an obligation before export. |
| Unrestricted local ring | TUNG-P3 Proposition 3.9, p. 12. Odd-p irreducibility/reducedness, including nonsmooth cases, and the auxiliary factor choices are required; representability or a constrained lifting ring is insufficient. |
| Dyadic ordinary components | TUNG-2 Theorem 7.3.1 and cited inputs, p. 37. Ordinary automorphic seed, determinant, chosen local components and solvable base change remain hypotheses. |
| General definite F | PAN §§3.1–3.2, pp. 17–20. Nonparallel weights, central-unit closure and the norm condition in Proposition 3.2.4 are retained. No manifold assertion for the raw general-F quotient is introduced. |
| Prescribed CM Hecke character | DLB proof of Lemme 5.6, pp. 26–27. The prescribed inert-p and inert-l components and infinity type need the stated S-unit/character-extension target in R17.5; this is not proved merely by citing CM forms. |
| Dyadic cusp boundary | EM11 §5.3, pp. 49–54. The characteristic-two Eisenstein boundary computation is an explicit extension of the existing R14 supplier, not an inference from its p≥3 statement. |

Böckle access was limited: the original author-PDF download repeatedly timed out. I read the search-indexed author-PDF text for pp. 3, 9 and 10, and independently checked how EM11 pp. 95–96 and NAK pp. 17–18 use it. This verifies the cited assumptions and numbered statements; it is not a claim to have read every proof in Böckle. The unavailable [42] theorem is likewise not claimed independently read. Neither limitation is hidden behind an implemented-library claim: the needed mathematical result is stated explicitly in the supplier contracts.

## Additional random source sample

Selection was made before checking: collect unique (source key, locator) pairs from the 49 packet nodes and draw 15 with Python `random.Random(10895)`. Every selected passage was opened and read. All locators below identify the specified version, not whichever version a publisher currently serves.

| Sample | Locator and result |
|---|---|
| 1 | EM06 (4.3.7), p. 53: compact-support coefficient comparison; agrees with the rational dual route. |
| 2 | EM11 Proposition 6.1.12, p. 68, Remark 6.1.15/Corollary 6.1.16, p. 69: Hom-space equality confirmed; corrected the polynomial subtraction sign as above. |
| 3 | EM-PAMQ Lemma 7.2.1, Definition 7.2.2, Lemma 7.2.3, Corollary 7.2.4, pp. 62–63: completion, reduction and coefficient limits confirmed. |
| 4 | EM11 Definition 3.3.18, p. 27: double-root criterion confirmed and made consistent within §3.6. |
| 5 | EM11 Definitions 5.3.1–5.3.2, (5.3.3)–(5.3.4), Lemmas 5.3.5–5.3.6, pp. 49–50; Propositions 5.3.11, 5.3.13, Corollary 5.3.14, pp. 51–52: residual summands and admissibility confirmed. |
| 6 | CEGGPS Propositions 4.33–4.34/Theorem 4.35, pp. 72–74: genericity and the algebraic/smooth tensor description confirmed. |
| 7 | NAK Theorem 2.2, p. 20: universal local–global compatibility and dual module normalisation confirmed. |
| 8 | EM11 §6.1, Definition 6.1.1/Theorem 6.1.2/Remark 6.1.3, pp. 66–67: modified families and the integral fibre distinction confirmed; unpublished supplier limitation retained. |
| 9 | PAN Theorems 1.0.2, 4.1.7, 8.0.1, pp. 3, 39, 124: hypotheses differ between reducible and irreducible residual cases; modularity is retained where required. |
| 10 | EM-PAMQ Corollary 7.4.3, p. 70: classical newform tensor and contragredient algebraic factor confirmed. |
| 11 | PAN §4.1 assumptions and 4.1.3, pp. 37–38: pseudo-deformation map, local inertial restrictions and determinant confirmed. |
| 12 | EM06 Proposition 4.3.1/Corollary 4.3.2, pp. 52–53, (4.3.3)–(4.3.5), (4.3.7)–(4.3.8), p. 53: degrees, algebraic vectors and actions confirmed. |
| 13 | PAN Definition 4.1.4, Remarks 4.1.5–4.1.6, Theorem 4.1.7/Corollary 4.1.8, p. 39: kernel-containment pro-modularity and the nice-prime result confirmed. |
| 14 | TUNG-2 Lemma 4.2.4/Proposition 4.2.5, pp. 19–20: quaternionic semilocality and determinant convention confirmed. |
| 15 | DLB §5.1 and Définition 5.3, p. 25: quaternionic Hecke algebra and modular residual representation confirmed. |

The source prose in the README is mathematical paraphrase with locators, not copied passages or a section-by-section synopsis. No cleared-library book was needed or copied. No theorem of Tate's thesis is made a target; the local Langlands and Hecke normalisations here are separate from that prohibited material.

## Adversarial pass over all 49 targets

These are mathematical instances and negative controls, not claims that every arithmetic check is executable today. Light definitions have proved Lean examples; arithmetic carriers absent at the pins remain README targets. The standing coefficient convention excludes equal-characteristic k[[varpi]], and no integral p=varpi substitution is used for ramified O.

| Target | Instances tested and result |
|---|---|
| 1.1 Modular completion | s=1 versus s=0; ramified O with p a unit times varpi^e; colimit-before-completion order. Reduction is for positive s and uses the named comparison. |
| 1.2 Actions/admissibility | Identity translation, two group elements, finite level versus the full p-level action. No full G-action is asserted at a single level. |
| 1.3 Degrees/supports | Nonzero finite H²_c versus zero completed H²_c; two Frobenius eigenvalues under epsilon and epsilon^-1. Corrected the twist powers. |
| 1.4 Non-Eisenstein control | Reducible Eisenstein label, non-neat level, p=2 and rank zero. Absolute irreducibility/neatness or the stated exceptions and dyadic boundary extension are essential. |
| 1.5 Shimura tower | Small level with nonzero H⁰ before localisation; global irreducibility without local irreducibility. Replaced the vanishing citation and specified its coefficient argument. |
| 1.6 Definite module | Empty quotient, trivial character, incompatible central character, central fixed point with nontrivial scalar. The character submodule can be zero; inverse translation is explicit. |
| 1.7 Definite structure | Trivial compact group, empty space (zero regular summands), non-free orbit and general F rational units. Freeness and central quotient conditions are not discarded. |
| 2.1 Algebraic vectors | Weight two versus weight three, algebraic factor and its dual, open versus compact supports. Contragredient convention and rational scope retained. |
| 2.2 Density | Fixed-compact algebraic versus locally algebraic vectors; conductor divisible by p; general-F central character nonalgebraic at another p-place. The stronger fixed-compact claim has the needed conditions. |
| 2.3 Good weights | Empty occurrence set; r<p−1; r=p−1 with determinant weight present/absent; p=2. Added the positive boundary case so discarding every boundary weight fails. |
| 2.4 Weight bounds | No global occurrence versus predicted local weight; r=0 and r=p−1; one-dimensional away-from-p subobjects. Upper bound does not imply a converse. |
| 2.5 Classical points | Weight two level 11 at p=5 (a_5=1); weight one; prime-to-p conductor versus ramification. Polynomial and algebraic degree distinguish the cases. |
| 2.6 Homology coefficients | Trivial W, dual standard W, nontrivial finite smooth type, torsion coefficients. Rational duality is not an integral self-duality assertion. |
| 2.7 Quaternionic weights | Trivial K/type, fixed point with no invariant weight vector, scalar t versus t^-1 on W*. Weighted forms and equivariant dual maps agree with the stated handedness. |
| 2.8 Typed finite module | Trivial type gives coinvariants; scalar balancing t^-1=u; small-level rank and incompatible character. Added the right-module convention and scalar control. |
| 3.1 Modular Hecke | Finite coordinates, zero residual factor, and k[eta]/eta²→k. Added the arithmetic faithful degree-one comparison; residual-label agreement is not a ring isomorphism. |
| 3.2 Galois determinant | Weight k determinant chi(l)l^(k−1), zero coefficient ring, reducible residual pseudocharacter and inverse Frobenius. Replaced the overly narrow weight-two comparison; existence uses IHG.4. |
| 3.3 Deformation map | Classical specialisation, absolutely reducible residual representation, inertial constraint at a bad prime. Representation and pseudo-deformation universality stay distinct. |
| 3.4 Residual summand | T_1×T_2 on H_1⊕H_2, H_1=0, already local T. Added genuine projector controls; this is not taking m-torsion. |
| 3.5 Galois factorisation | Zero eigenspace; Pan's two eigenvalues scaled by l; diag(1,2) with trace/determinant deviations x,y; reducible rho. Corrected twist, isotypy step and deviation sign. |
| 3.6 Classical/allowable | Crystalline level-11 point, Steinberg point outside C, repeated root versus distinct roots, reducible local restriction. Added a third control and used the double-root criterion. |
| 3.7 Quaternionic Hecke | Zero form module, finite-level evaluation, central units and derived degree zero. Deleted generic closure API, retained arithmetic weak-closure/limit comparisons. |
| 3.8 Eisenstein/pro-modular | Unit ideal, zero Hecke quotient, prime kernel, specialisation and nonsurjective map. Kernel containment is correct; prime contraction equivalence requires surjectivity. |
| 4.1 Away-from-p family | Empty Sigma_0 (W=T, dual T'), non-generic specialisation and integral torsion. Co-Whittaker W is not identified with its smooth dual Pi. |
| 4.2 Family fibres | Non-minimal conductor and reducible local Galois restriction. Modified local Langlands and the full Mazur-principle hypotheses remain necessary. |
| 4.3 Multiplicity | H=0, V=0, H=V with identity; trivial G with V=E² gives a kernel; zero tensor factor; nonsaturated varpi O. Irreducibility, scalar endomorphisms and cancellation hypotheses retained. |
| 4.4 Refined compatibility | Zero away-from-p set, distinct versus equal residual characters, excluded one-dimensional local subobject. Integral smooth-dual and cotorsion-free hypotheses retained. |
| 4.5 Banach compatibility | Promodular versus arbitrary rho, de Rham versus arbitrary p-adic representation, excluded residual extensions. No unconditional automorphy is inferred. |
| 4.6 Mod-p compatibility | p=2, reducible restriction, r=p−1 overlap. Odd-prime restriction and good-weight conditions remain. |
| 4.7 Homology dual | Trivial weight and dual/twist reversal; compact versus smooth module topology. The dual comparison does not silently remove the Tate twist. |
| 4.8 Quaternionic multiplicity | Zero target, trivial type, scalar character compatibility and identity evaluation. Continuous equivariant Hom is used, not an invented carrier. |
| 4.9 Definite compatibility | General F versus Q, local residual irreducibility, zero multiplicity. Banach nonvanishing uses the arithmetic support hypothesis. |
| 4.10 Block multiplicity | Missing block, zero completed module, specialisation at an absolutely irreducible point. A finite central map is not promoted to an integral centre isomorphism. |
| 4.11 Pan compatibility | p=3 excluded block, non-maximal eigensystem, dimension comparison over k[[K_n/Z_n]]. Preserved canonical-dimension supplier, corrected lemma label. |
| 4.12 Scholze comparison | H⁰ before/after localisation, exchanged invariants, coefficient extension. Geometric SZ inputs alone do not imply the arithmetic comparison. |
| 5.1 Patched module | Zero compact dual, augmentation quotient, n=1 versus n=2, p dividing 2n. Added globalisation hypotheses; a fibre is not automatically nonzero or independent of global choices. |
| 5.2 Typed patching | Regular S_infty[[K]], lattice varpi sigma, zero module/zero faithful quotient, point outside support. Added definitions and controls; rank one is an arithmetic conclusion on support. |
| 5.3 Component support | M=0; product ring supported on one factor; nonreduced ring with nilpotent annihilator. Union of components is weaker than full support; reducedness is needed for faithfulness. |
| 5.4 Odd-p full support | p=3 exceptional nonsmooth local ring, reducible residual representation, auxiliary reducible factors. Unrestricted-ring and factor choices remain explicit. |
| 5.5 Quaternionic patched homology | Augmentation, fixed type versus big compact module, zero type fibre. Finite-level specialisation is not the whole patched module. |
| 5.6 Dyadic support | p=2, ordinary/nonordinary components, absent ordinary seed. The ordinary component theorem is a separate input, not inferred from the odd-p result. |
| 5.7 Nice-prime patching | Height-one prime not nice, residual reducibility, nonordinary component. Nice-prime conditions and their exact support conclusion are preserved. |
| 5.8 Irreducible Pan patching | Residual representation with no modular seed, p=3 exceptional block, central determinant. Residual modularity and block hypotheses remain. |
| 6.1 Consequences | Classical V_f times character, p=2, promodularity absent. Conditional consequences remain distinct from full-Serre consequences. |
| 6.2 R=T | k[x]→k and k[eta]/eta²→k, excluded local extension, Fontaine–Laffaille endpoint k=p. Corrected source-side density argument and retained reducedness and primary hypotheses. |
| 6.3 Global algebraic formula | a=b versus a>b; det^b versus det^(b+1); non-crystabelline potentially crystalline case. The named normalisation bridge and CM weight-occurrence input are prerequisites, not claimed identities. |
| 6.4 Supercuspidal globalisation | Prescribed inert-p character, regular auxiliary inert-l component, unramified twist. A generic existence of CM forms does not establish these local prescriptions. |
| 6.5 Globalisation dependencies | Residual modularity supplied as hypothesis versus inferred from oddness; adequate image without automorphic seed; dyadic solvable image. Added explicit CEGGPS/KW/BLGG restrictions; no independence assertion exceeds these inputs. |
| 6.6 Consumer implications | CC1 finite-type module, CC2 Hecke representation, CC4 component support and a missing supplier. Consumers receive conditional implications with exact conventions; they are not used to prove their own inputs. |

## Lean review and ten signature comparisons

`Suggested.lean` is 245 lines and imports `Mathlib`. It has seven light real-bodied definitions, six named theorems (one proved and five admitted milestones), and 13 proved examples. There are no sorry-bodied data definitions, opaque carrier encodings, admitted examples, `True` placeholders, auxiliary theory chains or undeclared arithmetic carriers. Every heavier definition is specified in the README and covered by the closing comment's topic list. `metadata.toml` is exactly `topic = "math.NT"` with a final newline.

| Signature | README agreement and control |
|---|---|
| `translate` | Inverse translation for a continuous left action; identity and evaluation at d·x are proved examples. |
| `withCentralCharacter` | Real submodule f(iota(z)x)=psi(z)f(x); arbitrary iota is permitted for the light predicate, while arithmetic centrality is a separate hypothesis. Trivial character and fixed-point vanishing are proved. |
| `functions_free_finite_orbits` | Compact K, compact Hausdorff X, continuous free action and finitely many orbits. Empty X admits zero summands; no nonempty-orbit hypothesis is silently needed. |
| `weightedForms` | f(kx)=rho(k)f(x), not invariance of W-valued functions. Trivial weight and fixed point without invariant vectors are proved. |
| `equivariantDualMaps` | Contragredient composition by rho(k^-1) matches inverse translation. The cancellation at k·x is a proved example. |
| `weightedForms_equiv` | Complete nontrivially normed E, finite-dimensional Hausdorff W and continuous scalar action give the canonical finite-dimensional topology. The algebraic dual-to-function map has the advertised continuous outputs. |
| `eisensteinIdeal` | Span of varpi and T_v−1−chi_v. It may be the unit ideal; the arithmetic ordinary-seed theorem is not built into the predicate. Both defining relations have proved membership checks. |
| `IsProModular` / contraction theorem | ker(phi)≤q, closed under specialisation; contraction equivalence explicitly assumes phi surjective. Zero target and prime kernel are proved controls. |
| `multiplicityEvaluation` / injectivity | v tensor f maps to f(v) on Mathlib intertwining maps; finite dimension, irreducibility and scalar endomorphisms are present. This is the algebraic injectivity step, with no integral/topological comparison smuggled into it. |
| `annihilator_span_eq` | Commuting R/B actions and B-span S=M suffice. Empty S with M=0 yields unit annihilators on both sides; finiteness over R is not assumed. |

`lean-check` exited 0 against Mathlib 082e2d3 and TauCeti f790474. Its only diagnostics were five `declaration uses sorry` warnings, at lines 76, 111, 167, 205 and 227. The file was unchanged during this review, so a second elaboration was unnecessary. This validates signatures and proved examples, not the truth of admitted milestones. Arithmetic sign controls remain in the README because their carriers are not at the pins; no unrelated numerical Lean tests were added.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/CompletedCohomologyAndLocalGlobalCompatibility.json`: 0 errors, 0 warnings (49 nodes, 106 packet API entries, 57 tests, 22 planets, 31 baselines, 18 planned gaps, 16 requests). The packet is unchanged.
- `python3 research/blueprint/intake.py check-files` over the changed package and review deliverables: 0 problems.
- `git diff --check`: passed.
- README API/test inventory: only the explicitly documented generic closure API was removed; all 57 named packet tests are present.

No package defect is deferred to another worker. Formal implementation still must prove the exact supplier extensions and comparisons stated in the roadmap, in particular integral smooth-dual fibres, the two convention bridges, dyadic boundary/ordinary inputs, general definite-F adapter, CM local prescriptions and the appropriate globalisation hypotheses. Acceptance does not assert these are already in Tau Ceti. The source-access limits above are recorded for any later implementation audit. No suspicious instructions in fetched sources or other authors' material were followed or encountered.
