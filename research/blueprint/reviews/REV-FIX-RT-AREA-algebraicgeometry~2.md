# Independent review of FIX-RT-AREA-algebraicgeometry~2

## Current result — codex-4qd2Az

**Blocked checkpoint, 10 October 2026.** Codex (GPT-6), session `codex-4qd2Az`, independently continues [checkpoint #8406](https://github.com/CBirkbeck/tauceti-explorer/pull/8406). Refs [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702); [confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5702#issuecomment-6097743264). This session authored none of the fixes in [#7968](https://github.com/CBirkbeck/tauceti-explorer/pull/7968) and claimed no second job. None of the manager's listed priorities was available when this issue was selected from the permitted top-tier review jobs.

The live issue names five packet/Suggested pairs. All five already carry accepted bounded area-fix verdicts for `independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`, and their mathematical ownership corrections remain adequate. The queue requires eleven verdicts. [WORKERS.md](../WORKERS.md), Doing the work, requires: “Edit only the files the issue names, plus your own scratch space.” A concrete completion patch for the six omitted packets and one PEL Suggested signature was prepared and validated before requesting authorization. No authorizing reply has arrived, and the live issue still omits those paths. The full issue-comment history contains no authorization for the omitted paths. This checkpoint changes only this report and the required handoff.

This continuation independently reproduced the prepared completion patch, its preservation assertions, the eleven current and six candidate packet checks, the PEL candidate elaboration, and both surviving graph paths. Six public sources were freshly retrieved and their relevant statements inspected, including a fresh image inspection of Tate’s component-count table. The current upstream roadmap and library commits were checked separately from the pinned baseline. The following conclusions from #8406 stand:

- The accepted [PEL revision-2 review](REV-PELModuli~2.md) replaces the earlier carrier and domain objections. It fixes the ordinary analytic carrier at SF.2 Part II and retains C0's local comparison. A separate source/signature defect survives: `RationalPELDatum.unramified_reflex` omits the rational-prime hypothesis. A scratch candidate adds `(hpprime : p.Prime)` and makes the same hypothesis explicit in its existing API statement. The full candidate elaborates successfully.
- The accepted [Gross–Zagier revision-2 review](REV-GrossZagierAndArithmeticHeights--GZ.0~2.md) has already completed the independent review of the revised input. Its 243-node audit supersedes the predecessor's request to obtain that review. A new bounded area-fix verdict should preserve that acceptance and the entire audit.
- Adic still needs the two prose corrections described below. Deleting the six SF.5 forwarding inputs leaves both long paths from SF.4 to MC.4. Removing only the short path cannot authorize the reverse whole-stage import.
- Compactifications and ShimuraData retain their existing negative full-review decisions. Completing this review requires recording those decisions, not implementing their broader missing mathematics.

The actual `issues.deliverables_complete` returns **false** on the current checkout and **true** on a read-only overlay of the proposed seven-file completion patch with every other job output unchanged. This confirms the remaining deliverables; it does not authorize edits outside the live issue. The handoff gives the exact paths, changes and preservation rules needed to resume without any scratch artifact. The packet preservation check independently confirms that only two Adic prose fields and one PEL API statement change outside the review/history objects; every supplier request and complete preceding review is retained.

## Finding-by-finding disposition

I read all 32 in-scope high/medium finding claims, evidence, fixes and independent verifier reasons: /1–4, /6–18, /20–21 and /23–35. Findings /5, /19 and /22 concern only upstream roadmaps; low-severity /36–46 are outside this round. The ledger below preserves the preceding bounded dispositions, with /3, /16 and /26 updated against the newer inputs. I freshly inspected the affected coverage, supplier requests and targeted signatures; the original full blueprint and source audits remain inherited. “Recorded” approves a correction or precise supplier request, not implementation of the supplier. The latest predecessor #8377 also independently recompiled the unchanged ShimuraData file and confirmed its failure; that successful execution of a failing check is inherited here. The earlier predecessor evidence is in [#8357](https://github.com/CBirkbeck/tauceti-explorer/pull/8357) and #8377 and in the packets' unchanged review histories.

| Finding | Disposition and reason |
|---|---|
| /1 | Recorded. SF.1 owns general algebraic spaces, atlases, diagonals and stacks. A0 imports that carrier and retains moduli-specific effective descent and algebraicity. Unfinished geometric stack interfaces remain gaps. |
| /2 | Recorded. The accepted A0-extension-2 already supplies G-ring permanence, polynomial approximation, common etale neighborhoods and formal-object approximation before the criterion. Creating another approximation owner in R09.6 would duplicate it. Henselian G-rings and Artin's original base restrictions are retained. |
| /3 | Consumer correction adequate. The newer accepted REV-PELModuli~2 fixes the ordinary complex-analytic carrier at SF.2 Part II; C0 retains its local comparison. The Shimura consumers retain carrier, nilpotent, product and gluing requests. SGA 1 XII 1.1–1.2, pp.239–241 supports the required scheme-level generality. The owner contracts are planning inputs, not implemented analytic geometry. |
| /4 | Recorded. Motives requests geometric Hodge decomposition and degeneration after C5 and marks the proposed owner as unaccepted. Abstract completed HodgeStructures is an input, not a replacement for geometric Hodge theory. |
| /6 | Upstream handoff adequate. AlgebraicCurves 12B must import projectivity and composition/finite-morphism results from StableReduction 2. They must not be presented as a general projective-morphism API already in the pinned library. |
| /7 | Upstream handoff adequate. FA.5 is asked for the degree-one-divisor theorem with finite exact constants. The zeta-free AlgebraicCurves scope and a remark mentioning Schmidt do not themselves supply the result. |
| /8 | Recorded. NC.5 requests NS(A) = Pic(A)/Pic0(A), its injection into symmetric Hom, finite generation and Picard rank from A2. A6 provides the finite-generation input, without becoming a second quotient/map owner. |
| /9 | Handoff adequate. C4 uses AlgebraicCurves 12B/12C's regular projective model and uniqueness, plus Layer 6's open-immersion dictionary. No second smooth projective completion is planned. |
| /10 | Recorded. R09.3 imports finite locally free quotients from ModularCurves 0C, object/polarized descent from 0E and StableReduction 2, and broader geometric descent from SF.1. Restriction comparisons remain explicit. |
| /11 | Recorded against current upstream. SF.0 imports Weil restriction rather than rebuilding it. ModularCurves 0F supplies the initial affine case, existing RG2.0a its affine extension and R09.3 the algebraic-space extension. |
| /12 | Recorded. R09.1 imports ModularCurves 0G's locally free Grassmannians and StableReduction 2's Proj/projectivity/ampleness. Its flags, twists and broader applications remain extensions. Current AlgebraicVectorBundles must also be respected. |
| /13 | Handoff adequate. R09.7a imports the blowup package and flat, hence smooth, base change from StableReduction 4. Controlled transforms, permissible centers and marked-ideal calculations remain its own extension. |
| /14 | Recorded. General proper coherent cohomology over locally Noetherian bases is imported in every relative dimension. The retained A0 extension is specified in non-Noetherian/perfect-complex/Tor-amplitude terms, not merely as going beyond curves. |
| /15 | SF correction stands. Remove the unnecessary SF.4/formal and Neron/StableReduction forwarding inputs to SF.5 while retaining its genuine curve, projective-bundle and duality inputs. This rescope does not eliminate every SF.4-to-MC.4 path. |
| /16 | SF ownership stands; the two-field Adic correction is prepared but outside the live issue scope. SF.4 uniquely owns schematic alterations; L5 imports them for proper comparison descent and local calculations. Both long paths in the graph below survive the six SF.5 deletions, so a blanket MC.4-to-SF.4 reverse import remains circular. |
| /17 | Corrected SF request. StableReductionPartII MC.0/MC.2 supplies pointed moduli and proper-DM theory; MC.4 supplies projective scheme covers. For de Jong 2.24 the cover request must include every genus and at least three marks. Finite etaleness is asserted on the smooth open, not across the normalized boundary. Node-level supplier separation remains required. |
| /18 | Recorded. SF.2's coherent-duality contract is the general scheme owner; A0 consumes it. Relative-curve duality is an imported specialization, not another general construction of f!. |
| /20 | Historical handoff checked against current upstream. StableReduction's current J-E contract already states prime-to-characteristic multiplication finite etale of degree ell^(2g) and geometric torsion. Preserve the Jacobian/abelian-theory supplier boundary; do not repeat an obsolete absence claim or call this a pinned implementation. |
| /21 | Recorded, freshly checked against Tate’s Section 6 table, printed p.46 (PDF page 14). I0, I1 and II have one component; positive I_n has n, III has 2, IV 3, I0* 5, positive I_n* n+5, IV* 7, III* 8 and II* 9. These are geometric component counts, distinct from component groups and rational Tamagawa factors. G-Kodaira-resolution remains open. |
| /23 | Bounded upstream request adequate. The curve/Jacobian semistability criterion names R11.1/R11.3/R11.4 and Jacobian D, with the excellent-DVR and residue-field restrictions retained. Its eventual node placement must avoid circular blanket imports. |
| /24 | Handoff adequate. TB.2 needs the complete rank-one-valued theorem or an explicit model over a discretely valued subfield. A DVR-only reduction theorem cannot justify the stated non-Noetherian valuation-ring generality. |
| /25 | Handoff adequate. TB.2 imports the combinatorial dual graph, component genera and genus formula. Edge lengths, skeleton and retraction are the new tropical content. |
| /26 | Consumer correction adequate. GZ.2 imports general models, dual graphs, surface intersections and semistable base change from StableReduction 1/4/5/7. Admissible arithmetic specialization, Green functions and global height gluing remain GZ-owned; TB.3 owns general graph analysis. REV-GrossZagierAndArithmeticHeights--GZ.0~2 has now accepted the revised 243 targets, superseding the earlier handoff request for that independent review. Its full source audit is inherited. |
| /27 | Read-only imports adequate. ShimuraData D1/D3 names native Hodge L0/L1 and compactifications C1 names L2. These imports do not repair D0's bridge contracts or ShimuraData's elaboration failures. Other consumer links remain handoffs. |
| /28 | Read-only handoff adequate. V1 retains the holomorphic-gluing gap and asks for the tracked complex-manifold proposal or an atlas-owned carrier with that contract. Proposal references are not pinned implementations. |
| /29 | Handoff adequate. C5 still needs constant-sheaf/singular comparison with additive coefficients and coefficient/product compatibilities. The finite-ring local-system comparison cannot substitute for integral, rational and complex coefficients. |
| /30 | Handoff adequate. Proper relative coherent GAGA, relative holomorphic Poincare and the applicable Ehresmann/local-system input remain supplier tasks. SGA 1 XII 4.2 preserves properness, coherence and locally finite-type complex schemes; absolute projective comparison alone is insufficient. |
| /31 | Typed correction stands. C5 owns Betti/de Rham comparison and SF.6 the etale/Betti side. Motives' PeriodComparison has pullback, connecting-map, unit and product laws; ProductCompatible and the Tate rank-one condition remain explicit. Doubling a comparison violates its unit law. The arbitrary-pair supplier extension is still a request. |
| /32 | Algebraic correction recorded. R09.1 names O(n), projective-space cohomology with multiplication and absolute/relative Serre A/B, importing general proper cohomology. Analytic comparison inputs into C1–C3 remain handoffs. |
| /33 | Handoff adequate. C4 imports the function-field/completion dictionary from AlgebraicCurves, rather than citing R09.3 quotient theory as its normalization supplier. |
| /34 | Read-only ownership correction adequate. C0 owns the arbitrary-ring finite-fan toric construction, including valuation-ring bases. Its sibling imports that construction and keeps formal/adic/perfectoid extensions. Face localizations, torus action, base change, the complex anchor, nilpotent bases and the zero cone are named. |
| /35 | Handoff adequate. SGA 1 XII gives the nonreduced analytification, proper relative pushforward, proper coherent equivalence and proper full-faithfulness targets at 1.1–1.2, 4.2, 4.4 and 4.5. Reader reconciliation belongs to its owner. |


## Alteration ownership and graph evidence

The fresh read-only graph uses `scripts.build.assemble(require_distances=False)`, promoted stage edges, atlas stage `requires`, and `research/blueprint/roadmaps/*.json` stage `requires`, directed from supplier to consumer. It has **15,601** edges and is acyclic. Removing exactly SF.4, Neron R11.1, Neron R11.3 and StableReduction Layers 7/8/9 into SF.5 leaves **15,595** edges and an acyclic graph. Both of these paths still exist:

```text
SF.4 → DD.5 → PerfectoidQuotients Q3 → Q4 → AdicEtaleGeometry A3
     → RelativeFarguesFontaine RF0:integral-Y → VectorBundlesAndIsocrystals VB0
     → AbelianSchemesAndArithmeticModuli A4 → PELModuli M2 → M6
     → StableReductionPartII MC.4

SF.4 → DD.5 → PerfectoidQuotients Q3 → Q4 → AdicEtaleGeometry A3
     → RelativeFarguesFontaine RF0:integral-Y → VectorBundlesAndIsocrystals VB0
     → FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 → PELModuli M2 → M6
     → StableReductionPartII MC.4
```

The second path was independently found with A4 excluded. Adding MC.4 → SF.4 makes the graph cyclic. The current SF packet already warns of this; no edit there is necessary. Adic's `G-owners.detail` and first `restructure.proposal` still imply that the SF.5 deletion suffices. The prepared correction names both surviving branches, preserves SF.4 as the unique schematic-alteration owner, retains L5 tasks 4–5, and requires an actual alteration-node supplier split or rerouting of both formal/cohomological branches before a whole-stage reverse import is accepted. RD.5's retargeting remains its owner's job. No graph edge was changed.

[de Jong, §2.24, printed p.62](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) was freshly read. The MC.4 projective-cover request must cover every genus `g ≥ 0` with `n ≥ 3` marks. After inverting a prime level `ℓ ≥ 3`, the level cover is finite étale on the smooth pointed-curve locus. Its normalization across the stable boundary gives a finite dominant projective cover; boundary étaleness is not asserted. MC.6 separately supplies pointed stable extension. These remain precise requests, not blanket stage edges.

## Remaining packet decisions

These are prepared decisions, **not written packet reviews**. In each case the entire current top-level review would be appended unchanged to `reviewHistory`, preserving every older entry, node verdict, source decision and supplier request.

| Packet | Prepared verdict | Bounded correction and inherited full-review boundary |
| --- | --- | --- |
| AdicCoefficientsAndComparisons | accepted | Correct the two cycle descriptions; retain its 46-node audit, eight gaps and fourteen requests. |
| PELModuli | accepted after the prime-hypothesis repair | Preserve REV-PELModuli~2's accepted 91-node ledger, 54 verified/37 corrected, forty supplier requests and all source corrections. Add the available prime assumption to the reflex-field signature and its API statement. |
| ShimuraCompactifications--C0 | needs_changes | The area-fix imports and arbitrary-ring toric ownership are adequate. Preserve REV-ShimuraCompactifications--C0~2's entire negative 90-node ledger, 67 verified/23 corrected. Its full typed correspondence is only 7/90 nodes, 11/119 API items and 12/92 tests, with further partial fragments; the area corrections do not repair it. |
| ShimuraVarieties--V0 | accepted | Preserve the newer accepted REV-ShimuraVarieties--V0~2, all 69 node verdicts, nineteen refinements and eighteen requests. It resolved the old boundary-definition objection; the analytic-gluing supplier remains an explicit request. |
| GrossZagierAndArithmeticHeights--GZ.0 | accepted | Preserve the newer accepted 243-node audit, 211 verified/30 corrected/two added, all 78 requests, ten gates and 86 source decisions. The general StableReduction imports are correct and do not duplicate admissible arithmetic specialization. |
| ShimuraData | needs_changes | Preserve REV-ShimuraData~3's entire 123-node ledger and 26 requests. The native Hodge L0/L1 imports are correct; the five D0 prototypes still assume comparison isomorphisms or map commutativity, or substitute a scalar identity for the requested Lie comparison. Its inherited full-file Lean check fails. |

[Lan, Corollary 1.2.5.7, printed p.91](https://www.kwlan.org/articles/cpt-PEL-type-thesis.pdf), with Definition 1.2.5.4 and Corollary 1.2.5.6 on pp.90–91, was freshly read. The source assumes a rational prime and uses containment of the reflex field in the normal closure of the actual centre. The current line-840 signature already has the actual-centre condition, but quantifies over natural numbers without primality. The scratch repair restores that hypothesis; it does not claim a counterexample to a separate theorem for arbitrary integers. It is a native hypothesis available now, not a missing geometric supplier.

## Source and library evidence

Six public PDFs were freshly retrieved and the selected statements below read. No source file or passage is committed. The broader independent source audits in the latest packet reviews are inherited, not recertified by this area-fix review. Tate’s scanned §6 table, printed p.46 (PDF page 14), was freshly inspected as an image; its geometric component-count row precedes the characteristic-restricted equations. The unread 2013 YZZ edition was neither acquired nor certified; the newer GZ review separately identifies its public alternatives.

| Source | Freshly inspected locators and use | SHA-256 |
| --- | --- | --- |
| [de Jong](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) | §2.24, p.62: pointed projective cover and smooth-locus level hypotheses. | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |
| [Lan thesis](https://www.kwlan.org/articles/cpt-PEL-type-thesis.pdf) | Definition 1.2.5.4, pp.90–91; Corollaries 1.2.5.6–7, p.91: traces, normal closure and rational-prime reflex statement. | `c3086d5140bab887e31a508cf4bf8804f092326a35882fc003a3422c4ab65bdd` |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 2.8, p.10; Theorem 2.10 and proof, p.11: period relations, exterior product and inversion of the Tate period. Motives' typed comparison retains the unit/product and diagram compatibilities. | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [SGA 1, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203v2) | XII 1.1–1.2, re-edition pp.239–241; 4.2–4.5, pp.248–251: locally finite-type analytification, proper relative coherent pushforward, proper coherent equivalence and proper full faithfulness have distinct contracts. | `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c` |
| [Artin 1969](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf) | Theorem 1.10, p.26; §2, p.27; Corollary 2.6, pp.28–29: the original-base approximation and common étale-neighborhood results retain their stated field/excellent-DVR or Dedekind-base hypotheses. | `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434` |
| [Tate, Antwerp notes](https://wstein.org/Tables/antwerp/tate/tate.pdf) | §6 table, printed p.46 (PDF page 14): geometric irreducible-component counts, distinguished from component groups and rational Tamagawa factors. | `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc` |

Stacks [Theorem 16.13.1, Tag 07QY](https://stacks.math.columbia.edu/tag/07QY) and [Theorem 16.13.2, Tag 07QZ](https://stacks.math.columbia.edu/tag/07QZ) were freshly read. They distinguish solutions in a henselian Noetherian local G-ring from solutions after a pointed étale extension of a non-henselian G-ring. These broader statements do not erase the original Artin source restrictions.

The reviewed library audit entries for SF.0–SF.4, A0-extension, NC.5 and R11.2 were inspected. The unchanged baseline citations inherit their existing full audits; no new baseline citation was introduced. The exact atlas pin remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The pinned `Hodge.Conjugation` source was freshly read: its conjugate-semilinear carrier map is `toEquiv`, with involutivity and no function coercion. No replacement library declaration or new baseline citation is proposed.

Current upstream is separate read-only evidence: TauCetiRoadmap `670582c502e1d4497d9ccd492b36c67028ef6666` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant StableReduction and AlgebraicVectorBundles ownership contracts were freshly read. Those files are unchanged from the predecessor's roadmap snapshot `e255659f8eb50cd472809d9d565c8f755acffd84`; later upstream commits do not change these ownership conclusions. StableReduction's proper coherent-cohomology convention covers locally Noetherian bases in all relative dimensions; its J-E contract already includes prime-to-characteristic finite étale multiplication, degree and geometric torsion. AlgebraicVectorBundles L1A/L1B owns relative Spec and its anti-equivalence. The current library's `RelativeSpec/Functor.lean` was read and provides the contravariant functor and affine-chart/identity/composition API. These are imports, not missing targets to plan again, and current declarations are not recast as pinned implementations. No Lake command ran in either read-only checkout. The cleared-source index was read; no restricted source was needed or copied.

## Validation and elaboration

All eleven current packets and all six prospective packet updates pass `check_blueprint.py` against the pinned declaration index: **zero errors and zero warnings**. The prospective patch preserves all nodes except the explicit prime wording of one existing PEL API item, every request, every older review-history entry and every complete preceding review object. There are no literal source-passage fields; historical excerpt-count metadata and native-code compilation descriptions are not source passages. No link map or standalone restructuring result is under review.

The full **scratch PEL candidate** ran through `lean-check` and elaborated with **784 admitted-proof warnings and no other warning or error**. Its SHA-256 is `8eeb4fad27c512c682838860b65059b628af2a706ef0befa7fcbe6f7606491ed`. Memory available before compilation was 100 GB. This successful input is not committed because the live issue omits the PEL paths. All unchanged elaboration results below are inherited; they are not fresh runs. The table records freshly computed current input hashes, with the newer PEL/GZ review receipts replacing obsolete predecessor counts and hashes.

| Suggested basename | Nodes | Inherited admitted-proof warnings / provenance | Current input SHA-256 |
| --- | ---: | --- | --- |
| MotivesAndAlgebraicCycles | 182 | 805; #8265 | `f3874f8f0eb1355d40433cbef95f0cff7bd9d1165822483985bd9529fbfcb51f` |
| AlgebraicModuliForArithmeticGeometry--A0-extension | 476 | 1040; #8265 | `0f1da0e8f85427066acfe3b33981bc716e0ec952020678d07ced3b873b6b7575` |
| SchemeAndStackFoundations | 303 | 362; #8265 | `7d7dd0439924404df02f6ed8f1761e2751b060c04ff98710d7616deb9d4ce66e` |
| PELModuli | 91 | 784; REV-PELModuli~2 | `d6b4f179dbe8e6e2043956187c0104a1b2282a7a85af94c9cf247f0d9c8a8b69` |
| ShimuraCompactifications--C0 | 90 | 51; #8313 | `061788dad5cca38ba2e5012c492fbf2bf74d8bfb027069579300fe1a77e3219a` |
| ShimuraVarieties--V0 | 69 | 23; #8265 | `ba6da265f4db78eb9f4ae9a298a8a5f65025d532b00edaf12016d9f6df0ab8ff` |
| AnabelianGeometryAndNonabelianChabauty | 363 | 699; #8265 | `ca220b2dc0a473c710a4ad87d93e49a5b4c87904cb588aa38c59a0309eac5263` |
| AdicCoefficientsAndComparisons | 46 | 53; #8265 | `53536071d886ba06df9cb4e37ab26fa5034a453ec08f6ec500befbc63e9904e6` |
| NeronModelsAndSemistableAbelianVarieties | 78 | 53; #8265 | `562d40c7fabbf1c505626f1fa795dfcb5ea7413b24e35d0063a9c1ba6e9157a9` |
| GrossZagierAndArithmeticHeights--GZ.0 | 243 | 443; REV-GrossZagierAndArithmeticHeights--GZ.0~2 | `2be109731885b977ee21135a2f927cb13cd6826beb6c37059778c84783fce030` |
| ShimuraData | 123 | exit 1; #8377 (codex-2sonJP) | `9377216ae5607357bdeaebb207f84cdc25d3d958eea88c279947a171cc216cc9` |

The ten inherited successes report admitted-proof warnings only. The latest ShimuraData full-file receipt is codex-2sonJP's fresh run in #8377, inherited here at the unchanged input hash. It confirms the first error at line 186, where the conjugation is applied as a function instead of using its `toEquiv` accessor, and the reserved `GL` identifier at line 363, followed by further scalar/universe/interface errors. The receipt has 66 printed error headers, including the maximum-error diagnostic, and 113 warnings, three of them other than admitted-proof warnings; the error count is not exhaustive. The five D0 signatures were freshly inspected, but the unchanged failing file was not recompiled. No language server, build, update or cache command was started, and no process remains running.

The mathematics and prepared verdicts are ready to apply after the seven paths are authorized. The completion blocker is the live issue's stale file scope. The checkpoint's durable handoff supersedes the obsolete PEL and GZ instructions; it contains the full remaining edit recipe.
