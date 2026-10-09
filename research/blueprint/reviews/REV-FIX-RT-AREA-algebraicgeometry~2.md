# Independent review of FIX-RT-AREA-algebraicgeometry~2

**Verdict: accepted, with the corrections below.** Reviewer `independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`, Codex session `codex-sH10uY`, 9 October 2026. Job [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702), reviewing [#5701](https://github.com/CBirkbeck/tauceti-explorer/issues/5701).

This accepts the area-fix dispositions in the five packets named by the issue. It does not complete their outstanding blueprint parts, approve a restructuring, install stage edges, or certify the other fix rounds awaiting independent review. Every inherited coverage boundary, source issue, gap and request remains. No stage becomes closed.

I did none of the original red team, its verification, either fix round, or the earlier reviews. I read the claims, evidence, verified verdicts and fixes for findings 1–35, both fix ledgers, and the earlier `REV-FIX-RT-AREA-algebraicgeometry` report. Round 2 addresses 32 of those findings; /5, /19 and /22 remain earlier upstream notes. The eleven low findings /36–/46 are outside this review.

## Scope and method

The live issue authorizes Motives, A0-extension, SchemeAndStackFoundations, AnabelianGeometry and NeronModels packets and their suggested files. The current queue lists six additional packets. I read the relevant consumer requests, gaps and ownership records in PELModuli, ShimuraCompactifications--C0, ShimuraVarieties--V0, AdicCoefficientsAndComparisons, GrossZagierAndArithmeticHeights--GZ.0 and ShimuraData as evidence, but did not change or replace their reviews. Findings whose owner is outside the issue are assessed as handoffs, not as completed mathematics.

I read the current upstream StableReduction and JacobianChallenge roadmaps in full, and the current ReductiveGroupsPartII RG2.0a.1 and AlgebraicVectorBundles ownership/successor boundaries. StableReduction already owns general relative Proj, polarized étale descent, arbitrary finite-type-ideal blowups and curve-family reduction. JacobianChallenge C and StableReduction's J-C contract are not restricted to relative dimension one. Current upstream RG2.0a already plans affine restriction of scalars, finiteness and base change: it is an import, not a new blueprint assignment. AlgebraicVectorBundles leaves projective/Grassmann/flag bundles and geometric Hodge realization to successors.

I read the relevant reviewed library-audit targets and sampled their pinned declarations, including Mathlib's pseudofunctor stack predicate, Tau Ceti's line-bundle class and absolute scheme-module cohomology. I checked the newly used `Subspace.dual_finrank_eq` statement in Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/LinearAlgebra/Dual/Lemmas.lean`, line 550. Tau Ceti's review baseline is `f790474821cf4256814db967cb154e7af3d0c369`; the current library was also searched for the affected geometric constructions. This is not a fresh audit of every inherited baseline citation or source decomposition.

## Finding-by-finding verdicts

“Recorded” means the packet carries the ownership correction and preserves unimplemented obligations. “Handoff” means another job must implement it. Neither means that a requested theorem is available.

| Finding | Verdict and reason |
|---|---|
| /1 | Recorded correctly. SF.1 owns algebraic spaces, diagonals and atlases; general Artin/DM-stack targets remain its unfinished work. A0 requests those interfaces, and the R09.3/R09.4 part jobs retain moduli-specific tasks. |
| /2 | Corrected here against the final current base. Approximation must precede the A0 Artin criterion; importing the whole R09.6 would oppose RS-27. Accepted/promoted A0-extension-2 already plans all four approximation leaves. I withdrew the duplicate R09.6:approximation proposal, recorded imports of those existing A0 leaves, and retained Artin's standing base hypotheses and the henselian/étale distinction. SF.0 remains the G-ring/completion/Popescu input. |
| /3 | Consumer handoff adequate. The three read-only moduli/Shimura packets request C0's nilpotent-preserving analytic carrier and retain its gap. The ledger's PEL reader correction does not establish that carrier. ComplexComparisonPartII and ModularCurvesPartII still carry the owner/application work. |
| /4 | Recorded correctly on the Motives consumer side. Its geometric Hodge gap asks for a new ComplexComparisonPartII layer after C5 and says no owner is accepted. Abstract HodgeStructures is not used as a geometric Hodge theorem. |
| /5 | Outside round 2. The earlier upstream note still separates divisor degree from the Euler-characteristic agreement theorem; no degree theorem was changed here. |
| /6 | Maintainer note adequate. AlgebraicCurves 12B must import the projective-morphism package already owned by StableReduction 2. No second projectivity construction was added. |
| /7 | Handoff adequate. FunctionFieldArithmetic FA.5 must supply the degree-one-divisor theorem with its finite-constant-field hypotheses; the algebraically closed/finite-field parenthesis is not a proved library theorem. |
| /8 | Recorded correctly. SF.3 leaves abelian NS and Picard number to A2. NC.5 asks A2 for Pic/Pic0, the injection into symmetric Hom, finite generation and rho. Those requests do not certify a constructed NS group or the quadratic-Chabauty criterion. |
| /9 | Handoff adequate. C4 imports the single AlgebraicCurves 12 model/completion construction, rather than obtaining completion from an algebraic-space quotient stage. Its owner remains outside this issue. |
| /10 | Recorded correctly. R09.3 imports ModularCurves 0C's finite locally free quotients and requires compatibility with the SF.1 general quotient, alongside 0E and polarized étale descent. These compatibility leaves remain pending. |
| /11 | Recorded correctly. SF.0 builds no Weil restriction. The chain preserves ModularCurves 0F's affine finite-presentation case, current upstream RG2.0a's affine extension, and R09.3's algebraic-space extension. The historical handoff to a new RG2.0a blueprint is superseded by current upstream ownership. |
| /12 | Recorded correctly. R09.1 imports ModularCurves 0G and StableReduction 2's Proj/ampleness; R09.3 imports the applicable polarized descent. The remaining flags, twists and application comparisons are not reported complete. |
| /13 | Handoff adequate. R09.7a's characteristic-zero marked-ideal work imports StableReduction 4's general scheme blowup. A0's R09.7 coverage agrees. |
| /14 | Recorded correctly. Locally Noetherian proper coherent cohomology and base change are imported in every relative dimension; only the specified non-Noetherian/perfect/Tor-amplitude extension remains with A0. |
| /15 | Corrected here. Removing SF.4→SF.5 and the five forwarded Neron/reduction links, while supplying SF.3, R09.1 and StableReduction 4, is consistent with SF.5's intersection tasks. The original claim that this also enables MC.4→SF.4 is false on the current promoted graph; that additional edge is now deferred. |
| /16 | Recorded correctly with the finer prerequisite boundary retained. SF.4 is the schematic-alterations owner; L5 keeps comparison descent/local calculations. RD.5's stale request to L5 remains an external retargeting task. The schematic supplier component must avoid H1/H5 and satisfy the cover ordering described below. |
| /17 | Recorded, prerequisite claim corrected here. StableReductionPartII MC.0/MC.2 own the stable pointed-curve stack and proper-DM theorem; MC.4 owns the projective cover. De Jong §2.24 requires every genus with at least three marks, beyond the current unpointed genus-at-least-two cover. Removing the short SF.5 cycle leaves a longer promoted path, so a checked node/consumer split is still required. |
| /18 | Recorded correctly. SF.2's reserved coherent-duality key is the single owner; A0 routes its duality work there and does not add a competing duality node. StableReduction's relative-curve specialization remains distinct from the general duality carrier. |
| /19 | Outside round 2. The earlier Jacobian A–C/ModularCurves 0A→StableReduction 2 supplier note remains upstream work. This review does not install or close it. |
| /20 | Maintainer note adequate. The torsion contract is A3 applied to Pic0, with Jacobian D/E supplying the curve's abelian variety. No multiplication/torsion theorem was attributed to representability alone. |
| /21 | Verified and clarified here. Tate §6, p.46 supplies the geometric counts and distinguishes geometric components from component groups. I made n≥1 explicit for I_n and I_n*. The table does not justify tame discriminant or conductor values in characteristics 2 and 3. The resolution/completion/descent proof remains `G-Kodaira-resolution`. |
| /22 | Outside round 2. The earlier numerical-input note, including the rational-point hypothesis, multicross and Gorenstein inputs, remains upstream work. Importing R11.4 wholesale is not certified. |
| /23 | Maintainer note adequate. The curve–Jacobian criterion requests R11.1, R11.3, R11.4 and Jacobian D and retains excellence and the residue-field hypothesis. Its node-level placement is essential in the broader research graph; this is not a blanket extension of the arbitrary-DVR main reduction theorem. |
| /24 | Handoff adequate. TB.2 needs the rank-one-valuation Bosch–Lütkebohmert theorem or a DVR restriction; the DVR curve-family supplier does not imply the former. |
| /25 | Handoff adequate. TB.2 imports the existing nodal graph/genus theory and keeps metric lengths, skeleton and retraction. No second general dual-graph owner is established. |
| /26 | Read-only consumer disposition adequate. GZ.2 requests StableReduction 1/4/5/7 for graph, finite intersection, regular model and semistable base change; Green/admissible and local-to-global height work stays with GZ. |
| /27 | Read-only consumer disposition adequate. ShimuraData imports Hodge L0/L1 and compactifications import L2. Selmer/Abelian consumers and outgoing atlas links remain handoffs; the existing abstract Hodge carrier is not rebuilt. |
| /28 | Consumer handoff adequate. V1 requests C0 and retains the PR279/open-gluing gap. No untracked gluing theorem is treated as a pinned library theorem. |
| /29 | Handoff adequate. The partial C5 additive sheaf/singular comparison still needs its AlgebraicTopology input and full coefficient scope. The finite-coefficient PR196 contract is not substituted for complex coefficients. |
| /30 | Handoff adequate. Relative proper GAGA, relative Poincare/Gauss–Manin and any Ehresmann supplier remain ComplexComparisonPartII work, with proper/smooth hypotheses retained. |
| /31 | Ownership correction verified; the earlier comparison-law defect is now encoded. C5 supplies Betti–de Rham, SF.6 only etale–Betti transport; relative pairs remain an explicit C5 extension request. I made the Tate rank-one calculation a typed homology-supplier hypothesis, as detailed below. MC.2's monoidal realization comparison remains partial. The other fix reviews and reader reconciliation are not replaced. |
| /32 | Recorded correctly on the algebraic supplier side. R09.1 now names twists, projective-space cohomology with multiplication, and absolute/relative Serre A/B. StableReduction/Jacobian supply general proper cohomology; the C1–C3 analytic comparison remains a handoff. |
| /33 | Handoff adequate. C4's function-field/smooth-completion dictionary imports AlgebraicCurves 6 and 12, not R09.3's quotient theory. |
| /34 | Read-only owner disposition adequate. The compactification packet names its arbitrary-ring finite-fan toric scheme as the shared owner, including valuation-ring bases. The nonarchimedean Part II imports it; paper-route reconciliation remains external. |
| /35 | Handoff adequate. SGA 1 XII is retained in the partial ComplexComparisonPartII source plan for nilpotents, proper relative pushforward and proper GAGA. The campaign source-anchor update is still a maintainer action. |

## Corrections and prerequisite checks

The SchemeAndStackFoundations rescope originally allowed MC.4→SF.4 after deleting SF.4→SF.5. I assembled the current atlas using `scripts.build.assemble(require_distances=False)`, including promoted blueprints, accepted restructurings and links, then included stage `requires` and the research roadmap definitions. After the proposed deletions it still contains:

```text
SF.4 → DerivedDeRhamCohomology:DD.5
     → PerfectoidQuotients:Q3 → Q4 → AdicEtaleGeometry:A3
     → RelativeFarguesFontaine:RF0:integral-Y
     → VectorBundlesAndIsocrystals:VB0
     → AbelianSchemesAndArithmeticModuli:A4
     → PELModuli:M2 → M6 → StableReductionPartII:MC.4
```

Thus MC.4→SF.4 closes a cycle even without the unreviewed PR.1 path acknowledged by the fixer. I corrected the embedded proposal, SF.4 coverage and matching gap: keep the projective-cover request on the alteration nodes, and split/reroute the formal and cohomological consumers before approving any whole-stage edge. No unimplemented split is represented as available. The corrected SF.5 rescope and its MC.2/L5/RD.5 edges and the four criterion-note edges are acyclic when checked together on that assembled graph. The broader research-stage criterion path still requires the node-level restriction stated in the Neron note.

The final sync brought in the accepted/promoted A0-extension-2 and R09.6 packets. The former already plans `A0-extension/g-ring-finite-type`, `/polynomial-approximation`, `/common-etale-neighbourhood` and `/formal-object-approximation`; the latter explicitly imports that prefix. I read those four statements, hypotheses and prerequisites. The area fix's proposed new `R09.6:approximation` owner is therefore obsolete. I replaced its proposal and both affected coverage records by the existing A0 prefix, preserving the node order SF.0/SF.1→A0 approximation→A0 criterion→R09.6. No reverse stage edge or second approximation plan is requested. The historical paper routes must follow the existing A0 nodes. The graph check was repeated after syncing these newly promoted packets at main `6908ce6c3`.

For /31 I inspected `PeriodComparison.natural`, `.delta`, `.one`, `.mul`, `ProductCompatible`, `toTensorIsoOver`, and the period-point/formal-evaluation signatures and doubled-comparison regression. They now carry the laws absent in the earlier review. A remaining local issue was that nonzero vectors in arbitrary finite-dimensional dual spaces need not pair nontrivially. The prototype referred to one-dimensional Tate cohomology but `PairHomology` did not encode its computation. I added `PairHomology.gm_finrank`, made the packet's homology/period hypotheses and SF.2 request explicit, and proved `singularRep_gm` from that field and dual-rank equality. This supplies a faithful typed input for the nonzero Tate-period argument; it does not prove the actual geometric homology computation or the pair-comparison supplier. No new node or target was added.

The current Motives reader now describes the partial 182-node packet and the typed comparison, resolving the earlier severe coverage mismatch. It still reports 453 APIs/263 tests rather than the packet's 451/254 and retains the previous current-review metadata. It also cannot include this review's new Tate-supplier hypothesis. The reader is outside the issue's deliverables: regeneration/review-metadata reconciliation remains a handoff, and this review does not certify that reader or substitute for the queued iwasawa-3~3 and geomlanglands~2 reviews.

I replaced all five packet review objects with this bounded verdict and preserved their full earlier objects in `reviewHistory`. The other edits are the approximation-owner/base clarification and the explicit positive-index Kodaira counts. No atlas, source, roadmap, link-map or reader file was changed.

## Public source checks

All prose above states the checked results in my own words. These are selected target checks, not full source decompositions. Copies were fetched on 9 October 2026.

| Source and public URL | Locators and review use | SHA-256 |
|---|---|---|
| [de Jong, Smoothness, semi-stability and alterations](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) | §2.24, printed p.62: pointed stack and finite projective cover, including genus zero/one; its hypotheses are retained in the pending cover request. | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |
| [Tate, Algorithm for determining the type of a singular fiber in an elliptic pencil](https://wstein.org/Tables/antwerp/tate/tate.pdf) | §6, printed p.46: geometric count/group/configuration rows and the location of the characteristic restriction. The §7 resolution algorithm was not newly decomposed. | `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc` |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Theorem 1.6 proof, p.5; Theorem 2.10/evaluation, p.11; Definition B.14/Proposition B.16, pp.20–22; Assumption B.20, p.24. Checked comparison, products, unit and rank-one localization inputs. The cited Huber book was not used as independently checked evidence. | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Artin, Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf) | §2 standing conventions, p.27; Corollary 2.6 and proof, pp.28–29. Retained the original finite-type base over a field/excellent Dedekind domain. | `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434` |
| [Deligne, The Hodge conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf) | §§1–2, pp.1–3: smooth projective complex geometric Hodge/cycle context, distinct from the abstract Hodge carrier and arbitrary relative pairs. | `e308d945ea3cf5dad8b187a06509013712c467b589039eb41b365cc4c988f0c8` |

I also checked the statements and proofs of Stacks [Theorem 16.13.1, 07QY](https://stacks.math.columbia.edu/tag/07QY) and [Theorem 16.13.2, 07QZ](https://stacks.math.columbia.edu/tag/07QZ): the first uses a Noetherian local henselian G-ring, the second supplies an étale neighbourhood for a Noetherian local G-ring. These are different formulations, not two henselian conclusions. [Proposition 15.51.10, 07PV](https://stacks.math.columbia.edu/tag/07PV) supplies the G-ring permanence for essentially finite-type algebras used by the existing A0 prefix. [Lemma 48.27.1, 0FVV](https://stacks.math.columbia.edu/tag/0FVV) retains properness over a field and derived quasi-coherent inputs; it supports the general coherent-duality owner boundary, not an arbitrary relative/formal extension.

## Validation

All five packets passed `scripts/check_blueprint.py` with the pinned declaration index, with zero errors and zero warnings. The final inventories are:

| Packet | Nodes | API | Tests | Gaps | Requests | Closed stages |
|---|---:|---:|---:|---:|---:|---:|
| Motives | 182 | 451 | 254 | 22 | 16 | 0 |
| A0-extension | 476 | 611 | 564 | 16 | 22 | 0 |
| SchemeAndStackFoundations | 303 | 253 | 236 | 16 | 0 | 0 |
| AnabelianGeometry | 363 | 321 | 254 | 10 | 17 | 0 |
| NeronModels | 78 | 110 | 33 | 39 | 14 | 0 |

All five suggested files elaborated sequentially with `lean-check` at the pinned build. Only `declaration uses sorry` warnings remain: 805 in final Motives, 1040 in A0-extension, 362 in SchemeAndStackFoundations, 699 in AnabelianGeometry and 53 in NeronModels. The new dual-rank proof elaborates without `sorry`. This validates signatures, not the admitted mathematical implementations; Neron's explicit suggestion omissions also remain.

No standalone link map or restructuring result is under review, so their file checkers have no input here. Embedded proposals were checked by the packet checker and by the prerequisite analysis above. Intake file checks, structural-diff checks, the complete 1–35 disposition ledger and whitespace checks passed. No source-excerpt fields were present or added, and nothing was promoted.
