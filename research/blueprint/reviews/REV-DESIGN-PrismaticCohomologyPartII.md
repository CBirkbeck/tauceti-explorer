# Independent review: prismatic Dieudonné theory

**Verdict: needs_changes.** Codex, session `codex-9W82Rn`, reviewed job #3593 on 2026-10-17. This is a completed review of the design, not a checkpoint. The review did not author the original design. The corrected files preserve a usable target-level plan, while leaving the unrestricted Zink–Lau proof and its identification with the particular prismatic display functor explicitly unverified.

The mathematical classification statement is not being rejected. The authors’ 2025 erratum confirms it survives via Zink and Lau. What is missing here is direct verification of Lau08’s unrestricted proof and a justified comparison of that construction with Z_R over nonreduced/general bases. Agreement on perfect-field fibres and Hodge filtrations does not give that comparison.

## Coverage and counts

- Original nodes read: 82. Retained: 81. Removed duplicate: 1. Added targets: 2. Final nodes: 83.
- Kinds: 9 definition, 9 construction, 63 theorem, 2 lemma.
- Nodewise verdicts: 2 added, 51 corrected, 1 unverifiable, 29 verified. The packet contains a checked entry for every retained/added node.
- API items: 116; discriminating tests: 67. Every one of the 18 definition/construction nodes has at least three tests.
- Planets: 27, including the lower-owned Hodge–Tate sequence. All are definitions, central constructions or named results, rather than source-number labels.
- Baseline declarations: 19 names and statements checked at the prescribed Mathlib pin. No baseline name removed; two descriptions narrowed to their actual scope.
- Eight stages are planned at target level; none is closed. Fifteen explicit gaps and three supplier requests remain. Under PROTOCOL §0, complete marks a finished planning pass, and planned permits chains ending in a recorded gap. The review object separately records needs_changes.

## Main corrections

The frame carrier now consistently uses the Cais–Lau radical convention, and topological deformation results state their completeness/continuity assumptions. The unit window needs no extra image-generation hypothesis; a genuine zero-Frobenius non-example tests the generation axiom. The minuscule convention is finite projective, with an explicit locally free extension of AL23’s free formulation, and naive duality is orientation-dependent. The Cais–Lau inverse uses the correctly typed factorization ψ and the forward Frobenius includes its factor d.

The reader and packet distinguish the big relative quasi-syntomic site from DD.5’s absolute category. Inverse image is sheafification. Global Mathlib Ext does not provide the internal Ext sheaf used in the definition of the functor. The compatible infinite-root cover and inverse-limit exactness are exposed as obligations rather than inferred from finite-level surjectivity.

Scholze–Weinstein’s p⁻¹-normalized covariant Frobenius and absolute PD envelope are distinguished from the relative crystalline envelope and the Česnavičius–Scholze convention. The abelian calculation uses X[1/p]. The u-torsion-free assertion concerns full H_Δ/p, not reduced cohomology over 𝒪_K/p. The characteristic-p crystalline-prism structure uses the Frobenius-induced R→D/p.

The q-logarithm derivative is (q−1)/log q, and log_q(q)=q−1 exactly. The explicit inverse is expressed as Frobenius-compatible linear maps to O^pris, avoiding an undefined integral Frobenius on a naive dual. Torsion cokernels require p-isogenies. Finite Cartier duality is the perfectoid Ext¹-dual with the mandatory multiplicative twist, deduced from a two-term isogeny presentation; the unsupported universal derived-dual formula was removed.

Displays distinguish all windows/3n-displays from Zink’s V-nilpotent subclass. The module F₁ is data, not the coefficient Verschiebung inverse. Contravariant formal groups give F-nilpotence; dual windows are used before Zink’s covariant BT functor. The Nygaard-to-Witt scalar was inverted to match the declared u-morphism equations. Étale comparison separates α on the integral site from the generic-fibre morphism j.

## Ownership and library checks

Removed `PrismaticCohomologyPartII:PD.1/opris-vector-bundles`, an exact duplicate of parent `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison`; all internal references now import the parent. The parent supplier was read, including its scope. No proof of that equivalence is replanned.

Added `PD.3/p-divisible-hodge-tate-sequence` with API and three tests because its former supplier is in tier 18, above this tier-13 bundle. Added `PD.7/formal-p-divisible-group` with API and three tests because the R07 formal-Lie carrier is only complete noetherian local. Removed PELModuli and GeometricSatakeAndFusion prerequisites. The later Hodge–Tate and PEL plans should import these lower owners; this is also in the handoff.

The AInf admissible-prismatic dictionary would be circular, so only its BKF carrier/linear algebra is imported. PerfectoidSpaces P7’s actual regular-perfectoid-tower node and PerfectoidQuotients Q0’s actual henselization-stability node are imported directly. The A4 Serre–Tate supplier is used within its nilpotent/affine scope, with nonnoetherian effectivity recorded separately. The R07 Tate/generic-fibre, formal-Lie, CR.7 characteristic-p evaluation and BT_n smoothness statements were read and their narrower hypotheses were not silently strengthened. The parent Kisin comparison supplies its Fargues-pair compatibility.

The reviewed `data/library-coverage.json` was consulted; it has no direct PrismaticCohomology/PartII layer entry, so it is not evidence of absence for this job. Current readonly upstream checks used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmap families were searched at their Suggested.lean files; the relevant AlgebraicVectorBundles scheme-module statements were read. Their scheme internal Hom is already owned, and they do not supply Witt-vector v-descent. The current library also contains ordinary internal Hom for module sheaves on a small site: `SheafOfModules.ihomObjEquiv` and `ihomCompForgetIso` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean` were read with their commutative-ring, smallness and sheafification hypotheses. The generic `SheafOfModules.pullbackPushforwardAdjunction` and `pullbackIso` were read at Mathlib 082e2d3 in `Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean`. Their continuity, presheaf right-adjoint and sheafification assumptions must be instantiated. Gap 5 imports these existing constructions and asks only for the relative-site specialization, size/instance comparison, derived internal Ext and its compatibilities.

Current Tau Ceti Witt Frobenius, completeness and Huber-ring statements and its henselian idempotent-lifting statement were read. The current `TauCeti.exists_projective_quotient_smul_top_linearEquiv` was also read: it lifts a split summand modulo one element under endomorphism-ring adic completeness. It does not give finite-projective lifting for every henselian pair. These existing narrower results are not replanned.

## Baseline ledger

| Declaration | Statement scope confirmed at pin |
| --- | --- |
| `mathlib:CategoryTheory.Abelian.Ext` | Global Ext groups in an abelian category with HasExt; does not supply an internal Ext sheaf. (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`) |
| `mathlib:CategoryTheory.Functor.IsCocontinuous` | Covering-sieve condition for a cocontinuous site functor; does not itself construct the inverse-image adjunction or prove its exactness. (`Mathlib/CategoryTheory/Sites/CoverLifting.lean`) |
| `mathlib:CategoryTheory.Sheaf` | Sheaves on a site (`Mathlib/CategoryTheory/Sites/Sheaf.lean`) |
| `mathlib:ExteriorAlgebra` | The exterior algebra of a module (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`) |
| `mathlib:ExteriorAlgebra.ι` | The inclusion of a module into its exterior algebra (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`) |
| `mathlib:HenselianRing` | Henselian pairs (R, I): I in the Jacobson radical and simple roots of monic polynomials lift (`Mathlib/RingTheory/Henselian.lean`) |
| `mathlib:Ideal` | Ideals of a ring (`Mathlib/RingTheory/Ideal/Defs.lean`) |
| `mathlib:Ideal.jacobson` | The Jacobson radical of an ideal (`Mathlib/RingTheory/Jacobson/Ideal.lean`) |
| `mathlib:IsAdicComplete` | I-adically complete modules (`Mathlib/RingTheory/AdicCompletion/Basic.lean`) |
| `mathlib:IsRegularLocalRing` | Regular local rings (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`) |
| `mathlib:Module.Finite` | Finitely generated modules (`Mathlib/RingTheory/Finiteness/Defs.lean`) |
| `mathlib:Module.FinitePresentation` | Finitely presented modules (`Mathlib/Algebra/Module/FinitePresentation.lean`) |
| `mathlib:Module.Free` | Free modules (`Mathlib/LinearAlgebra/FreeModule/Basic.lean`) |
| `mathlib:Module.Projective` | Projective modules (`Mathlib/Algebra/Module/Projective.lean`) |
| `mathlib:Submodule` | Submodules (`Mathlib/Algebra/Module/Submodule/Defs.lean`) |
| `mathlib:TensorProduct` | Tensor products of modules (`Mathlib/LinearAlgebra/TensorProduct/Defs.lean`) |
| `mathlib:WittVector` | p-typical Witt vectors (`Mathlib/RingTheory/WittVector/Defs.lean`) |
| `mathlib:WittVector.frobenius` | The Witt vector Frobenius (`Mathlib/RingTheory/WittVector/Frobenius.lean`) |
| `mathlib:WittVector.verschiebung` | The Witt vector Verschiebung (`Mathlib/RingTheory/WittVector/Verschiebung.lean`) |

The two narrowed descriptions are `CategoryTheory.Abelian.Ext` (global Ext, not an internal sheaf) and `CategoryTheory.Functor.IsCocontinuous` (a sieve condition, not the constructed exact adjunction). The remaining baseline citations provide exactly the ring/module/sheaf carriers or algebra named by their consumers. There are no Tau Ceti declarations in the pinned baseline list.

## Source reading and issues

All locators in the original 82-node packet were checked against the public source texts, except the explicitly attributed but unread Lau08 theorem. Direct reading included the cited portions of AL23, SW13, SW20, CS24, Cais–Lau, Lau10/14/18, Zink, Bhatt–Lurie Theorem 7.5.6, Bhatt–Scholze Proposition 2.14 and all six cited Stacks tags. AL23’s freely accessible published version was found and compared for the reported errors; the old claim that it could not be read freely was removed. Public URLs and version hashes are in the packet and reader. No source passages were put in these files.

- E1 confirmed: the general regular-local statement has a written one-variable prismatic proof, in arXiv Theorem 5.2.5 p. 79 and published Theorem 5.12 p. 74. This is a limitation of the written comparison argument, not a claim that general Breuil-window classification is false.
- E2 confirmed: the Dieudonné coefficient terms in arXiv Remark 4.8.4 p. 70 / published Remark 4.85 p. 66 contain the wrong dual-group argument. The global derived-fibre expression is also typed explicitly.
- E3 added and confirmed: the unit in the Nygaard-to-Witt proposition is reciprocal to the earlier u-morphism convention (arXiv pp. 32,88; published pp. 28,83).
- E4 added as a known issue: the 2025 erratum retracts the display proof’s nilpotence argument and gives Senger’s fixed-element counterexample. The theorem survives through other proofs.
- E5 added and confirmed: SW20 Example 12.1.6 p. 100 gives the wrong sign/offset for the projective-hull height index. A rational projective point requires height one, so use projective dimension plus one.
- Removed phantom issue references and the asserted crystal/module “misprint”: those categories are intentionally equivalent, so the word choice is not a source error. No unread arXiv versions are claimed to have been searched.

## Every node changed

The following ledger lists changed fields and the reason. The packet’s review.checked contains the full final source locator for each node; unlisted retained nodes have verified verdicts.

| Node | Changed fields | Correction |
| --- | --- | --- |
| `PrismaticCohomologyPartII:PD.0/frame` | api, hypotheses, proofSteps, sources, statement, tests | Use the general Cais–Lau radical condition with an explicit ϖ, consistently with the Lean structure; distinguish Lau’s unit-image convention. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.0/prism-frames` | hypotheses, proofSteps, statement | Restrict the complete prism applications to bounded prisms and prove the radical condition without assuming arbitrary quotients complete.  |
| `PrismaticCohomologyPartII:PD.0/window` | acceptance, api, tests | Correct the generation non-example and remove the unnecessary unit-image hypothesis on the unit window. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.0/window-base-change` | api, hypotheses, proofSteps | Make the normal-decomposition hypothesis explicit for the base-change construction. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.0/minuscule-breuil-kisin` | api, hypotheses, sources, statement, tests | Use finite projective modules rather than globally free modules and state the orientation dependence of naive duality. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.0/minuscule-cokernel-projective` | proofSteps | Spell out the residue-field Tor argument and the bounded-below hypothesis in the fibre criterion.  |
| `PrismaticCohomologyPartII:PD.0/cais-lau-equivalence` | hypotheses, proofSteps | Give the correctly typed inverse Cais–Lau construction.  |
| `PrismaticCohomologyPartII:PD.0/window-deformation` | hypotheses, proofSteps | Require the separated complete topology used by convergence and avoid an inverse of a nonprojective filtration linearization.  |
| `PrismaticCohomologyPartII:PD.1/prism-to-qsyn-topoi` | api, hypotheses, proofSteps, statement | Distinguish the big relative site from the absolute quasi-syntomic category, and correct inverse image to sheafification. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.1/pullback-exactness` | proofSteps | Separate exact sheafified inverse image from a bare cocontinuity class.  |
| `PrismaticCohomologyPartII:PD.1/opris-sheaves` | api, hypotheses, tests | Restrict the zero evaluation to additive/ring coefficients, where it is valid. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.1/qrsp-prism-henselian` | proofSteps | Correct the auxiliary ideal in the henselianity proof.  |
| `PrismaticCohomologyPartII:PD.1/prismatic-dieudonne-crystal` | api, hypotheses, prerequisites, proofSteps, tests | Remove a phantom source issue and make injectivity and the negative test precise. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.1/prismatic-dieudonne-module` | api, prerequisites, tests | Remove the circular AInf prismatic dictionary; retain the existing BKF carrier only. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.1/admissible-over-perfectoid` | prerequisites | Prove admissibility here rather than import a dictionary stated in this roadmap’s own terms.  |
| `PrismaticCohomologyPartII:PD.1/crystals-modules-qrsp` | prerequisites | Remove the purported crystal/module misprint: equivalence of those categories is intentional.  |
| `PrismaticCohomologyPartII:PD.1/filtered-dieudonne-crystal` | api, sources | Use the source’s introductory filtered definition and the Nygaard-window construction without a misleading extra locator.  |
| `PrismaticCohomologyPartII:PD.2/functorial-resolution` | api, proofSteps, tests | Distinguish finite disjoint unions from a single point in the zero-object test and remove an extraneous sum in the spectral sequence.  |
| `PrismaticCohomologyPartII:PD.2/dieudonne-functor` | api, proofSteps | Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.2/pushforward-description` | proofSteps | Aligned the changed proofSteps fields with the corrected ownership, scope or API. Statement, hypotheses, proof sketch, direct supplier scopes and source locators checked.  |
| `PrismaticCohomologyPartII:PD.2/tate-module-description` | proofSteps | Record the infinite-cover exactness requirement instead of inferring inverse-limit exactness from finite-level epimorphisms.  |
| `PrismaticCohomologyPartII:PD.3/scholze-weinstein-theorem-b` | hypotheses, prerequisites, proofSteps | Move the upward Hodge–Tate input here; remove the noetherian-domain generic-fibre supplier and record the projective-dimension source typo.  |
| `PrismaticCohomologyPartII:PD.3/oc-minuscule-bkf` | acceptance, prerequisites | Remove the circular AInf prismatic dictionary and use the lower linear-algebra carrier.  |
| `PrismaticCohomologyPartII:PD.3/formal-abelian-variety-cover` | prerequisites | Oort’s existence theorem supplies a realization up to isogeny; retain the necessary isogeny adjustment.  |
| `PrismaticCohomologyPartII:PD.3/bkf-crystalline-dieudonne` | hypotheses, proofSteps, statement | Make the p⁻¹-normalization of Scholze–Weinstein’s covariant crystalline Frobenius explicit.  |
| `PrismaticCohomologyPartII:PD.3/scholze-weinstein-perfectoid` | hypotheses, prerequisites, proofSteps, statement | Disambiguate the absolute PD envelope used by SW17.5 and remove the out-of-order Witt-geometry supplier.  |
| `PrismaticCohomologyPartII:PD.3/perfectoid-prismatic-classification` | statement | Write the variance of the perfectoid classification explicitly.  |
| `PrismaticCohomologyPartII:PD.4/abelian-conjugate-degeneration` | proofSteps | Record the missing unpolarized abelian lifting input at p=2 rather than infer splitting from a Hopf algebra argument.  |
| `PrismaticCohomologyPartII:PD.4/abelian-dieudonne-crystal` | acceptance, proofSteps | Use p-localization X[1/p], and restrict the split ordinary example to algebraically closed residue field.  |
| `PrismaticCohomologyPartII:PD.4/abelian-prismatic-cohomology` | hypotheses, statement | Correct the u-torsion-free object: full prismatic cohomology modulo p, not its Hodge–Tate reduction.  |
| `PrismaticCohomologyPartII:PD.4/pdiv-locally-free` | hypotheses, prerequisites, proofSteps, statement | Restrict to quasi-syntomic bases and expose the inverse-limit closure obligation.  |
| `PrismaticCohomologyPartII:PD.4/crystalline-comparison` | hypotheses, prerequisites, proofSteps, statement | Restrict the module-valued part to quasi-syntomic bases and use the Frobenius-induced map R → D/p.  |
| `PrismaticCohomologyPartII:PD.4/charp-hom-description` | acceptance | Remove the covariance-mismatched Witt-covector supplier.  |
| `PrismaticCohomologyPartII:PD.4/admissibility-and-lie` | prerequisites, proofSteps | Import henselization stability from its existing owner, rather than silently assume henselian perfectoid presentations.  |
| `PrismaticCohomologyPartII:PD.5/q-logarithm` | api, proofSteps, tests | Correct the formal derivative test and the exact evaluation of log_q(q). Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.5/etale-dieudonne` | proofSteps | Aligned the changed proofSteps fields with the corrected ownership, scope or API. Statement, hypotheses, proof sketch, direct supplier scopes and source locators checked.  |
| `PrismaticCohomologyPartII:PD.5/tate-module-recovery` | hypotheses, proofSteps, statement | Correct the G/G* misprint and type the derived expression on evaluated QRSP modules.  |
| `PrismaticCohomologyPartII:PD.5/full-faithfulness` | hypotheses | Make contravariance explicit in full faithfulness.  |
| `PrismaticCohomologyPartII:PD.5/essential-surjectivity` | prerequisites | Use the exact henselization-stability supplier for the perfectoid presentation.  |
| `PrismaticCohomologyPartII:PD.5/explicit-quasi-inverse` | proofSteps, statement | Define fixed points of the dual by a Frobenius-compatible Hom equation, since the dual Frobenius can be rational.  |
| `PrismaticCohomologyPartII:PD.6/torsion-dieudonne-module` | acceptance, api, sources | Require an actual p-isogeny in the cokernel constructor and fix Lau’s definition number. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.6/finite-group-classification` | hypotheses | Distinguish Lau’s p≥3 theorem from Anschütz–Le Bras’s all-p argument.  |
| `PrismaticCohomologyPartII:PD.6/finite-cartier-duality` | acceptance, hypotheses, prerequisites, proofSteps, sources, statement | Replace an unsupported universal derived-dual formula and false remark locator by the perfectoid Ext¹-dual formula with its necessary twist.  |
| `PrismaticCohomologyPartII:PD.6/covariant-normalisation` | hypotheses | Correct constant-height finite freeness to finite projectivity and prevent an incorrect literal interchange of the two operators.  |
| `PrismaticCohomologyPartII:PD.7/regular-perfectoid-cover` | prerequisites | Import the existing regular perfectoid tower by its exact node identifier.  |
| `PrismaticCohomologyPartII:PD.7/breuil-kisin-comparison` | hypotheses, proofSteps, statement | Separate dimension zero and equal-characteristic examples, and record the missing connection argument.  |
| `PrismaticCohomologyPartII:PD.7/kisin-functor-comparison` | proofSteps | Replace an unjustified full-faithfulness assertion about all S→A_inf lattices by the Fargues-pair comparison used in the source.  |
| `PrismaticCohomologyPartII:PD.7/display` | api, prerequisites, statement, tests | Distinguish all windows/3n-displays from Zink’s V-nilpotent displays; F₁ is the module operator, not coefficient Verschiebung inverse. Added the extensionality/naturality API check.  |
| `PrismaticCohomologyPartII:PD.7/nygaard-to-witt-frame` | proofSteps, statement | Correct the inverse unit in the Nygaard-to-Witt frame morphism.  |
| `PrismaticCohomologyPartII:PD.7/display-functor` | proofSteps, statement | Do not descend arbitrary torsion-free presentations without a compatible BT presentation; record the missing stack input.  |
| `PrismaticCohomologyPartII:PD.7/zink-lau-classification` | acceptance, hypotheses, prerequisites, proofSteps, statement | Correct Zink’s nilpotence direction and the general formal carrier; mark Lau’s unrestricted proof and comparison as unverified. The erratum endorses the classification, but Lau08’s unrestricted proof was not directly accessible and the deformation-level comparison with Z_R remains a gap. |
| `PrismaticCohomologyPartII:PD.7/etale-comparison` | hypotheses, prerequisites, proofSteps, statement | Correct the domains of α and j, the generic-fibre composition, and the mod-pⁿ invariant parentheses.  |

The removed duplicate and two added nodes are described in the ownership section. Top-level changes also reconcile the eight stage descriptions and prerequisites; source URLs/reading records; sourceVersions; review; supplier requests; ownership proposals; coverage.remaining; and the fifteen precise gaps. The reader was regenerated from the final node fields, replacing its outdated introduction, source-error claims and ownership inventory.

## Remaining questions for the orchestrator

1. Obtain a public or cleared direct copy of Lau08, then verify its unrestricted theorem and the deformation-level identification with Z_R. This is the unverified node that prevents acceptance.
2. Route the ringed-site/internal-Ext, compatible-cover, mixed-characteristic coefficient and full-BT-presentation infrastructure gaps to exact owners. The listed nearby suppliers do not yet state these inputs.
3. Point the later HodgeTateAndCanonicalSubgroups T0/T2 and PELModuli M2 plans at the lower targets here. Keep Witt-vector v-descent and the general Hodge–Tate proof as explicit gaps until an allowed owner is supplied.
4. Resolve the period-image/rigid-theory, Oort/isotriviality, nonnoetherian formal effectivity, p=2 abelian lifting, characteristic-p connection and higher-dimensional comparison gaps listed with their exact consumers in the packet.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomologyPartII.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomologyPartII.lean`: exit 0 at Mathlib 082e2d3, four warnings, all `sorry`; memory was checked before compiling.
- The suggested file is 122 lines, has no sorry-defined data, and contains two representative examples. The omitted heavy carriers and constructions are explicit README targets.
- JSON/reader synchronization, nodewise review coverage, unit-test counts, allowed prerequisite direction and whitespace are checked before submission.
