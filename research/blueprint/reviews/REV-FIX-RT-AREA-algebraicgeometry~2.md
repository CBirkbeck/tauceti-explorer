# Independent review of FIX-RT-AREA-algebraicgeometry~2

**Blocked checkpoint: the issue permits five packet/suggested pairs, but completion requires eleven.** Codex session `codex-dj6XVp`, reviewer `independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`, 10 October 2026. Refs [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702). The [bot confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5702#issuecomment-6093922208). This session did none of the author fix [#7968](https://github.com/CBirkbeck/tauceti-explorer/pull/7968).

## Fresh evidence and remaining action

This continuation independently checks the findings, verifier reasons, author ledger, affected contracts, previous reviews, source boundaries and dependency proposals inherited through [#8234](https://github.com/CBirkbeck/tauceti-explorer/pull/8234). It also discovers that the inherited ShimuraVarieties conclusion and compilation hash are stale after [#8228](https://github.com/CBirkbeck/tauceti-explorer/pull/8228). Carrying that old negative rationale into another review would be incorrect.

The following checks were performed by `codex-dj6XVp`:

- All eleven packets validate with zero errors and warnings against the pinned declaration index. Nine suggested files match their inherited positive compilation receipts; ShimuraData matches its inherited negative receipt. ShimuraVarieties has a different hash following #8228 and received a fresh successful `lean-check`: exit 0, 23 admitted-proof warnings, no other warnings or errors.
- A fresh full-file ShimuraData `lean-check` reproduces 66 error headers before the `maxErrors=100` limit, including application of `Hodge.Conjugation` as a function. There are 113 warning headers, three of them other than admitted-proof warnings. This independently confirms the unresolved elaboration defect; it is not an exhaustive count of errors.
- A fresh stage-graph assembly has 15,601 distinct edges and is acyclic. Removing the six proposed SF.5 inputs leaves the longer path below. The nine other proposed edges remain jointly acyclic; adding MC.4-to-SF.4 creates a cycle in both variants.
- Public de Jong, Artin, SGA 1, Huber–Muller-Stach and Tate loci were read directly, with the PDF hashes below. Tate's component table was visually inspected. De Jong 2.24, p.62 distinguishes a smooth-open finite-etale level cover from finite dominant projective normalization over the stable boundary, for every genus with at least three marks.
- The current upstream AlgebraicVectorBundles and StableReduction documents were read in full. Relative Spec belongs to AlgebraicVectorBundles L1A/L1B; proper coherent cohomology over locally Noetherian bases is not confined to curves. Current Tau Ceti's RelativeSpec/Basic and pinned Hodge.Conjugation were read. No current checkout was written or built.
- The precise PEL objections remain: `IsGoodPrime.unramified_reflex`, lines 476–479, concludes non-divisibility of a supplied integer, not unramifiedness of the actual reflex field; `toShimuraDatum`, line 519, returns only the domain set; `signature`, lines 532–544, lacks the native Hodge-multiplicity characterization. ShimuraData's D0 bridge contracts and compactifications' omitted geometric declarations remain independent of successful compilation of a represented slice.
- ShimuraVarieties #8228 supplies an explicit adapted-chart boundary predicate and synchronizes the reader. I read its revision handoff and affected packet/reader/omission-manifest contracts. The old review object was deliberately retained as historical evidence. Its missing-definition and stale-reader objections must be re-evaluated against the primary Baily–Borel source in the independent revision review, rather than copied as current findings. This session does not certify that new primary-source argument.

## Scope and blocker

Round 2 covers 32 confirmed findings: /1–4, /6–18, /20–21 and /23–35. Findings /5, /19 and /22 belong to earlier upstream notes; /36–46 are outside this high/medium review. The five issue-listed packets already carry accepted verdicts for their bounded area-fix dispositions. Their preceding review objects and SF.4's pointed-cover correction are preserved. Those acceptances neither implement suppliers nor discharge inherited gaps or install proposed edges.

Both lists in the live issue name only five packet/suggested pairs. The queue requires eleven pairs, or 23 outputs including this report. All outputs exist, but `issues.deliverables_complete` returns **false** because six packets lack this job's review marker. A negative verdict would satisfy that predicate; implementing unresolved supplier mathematics is not required to finish a review.

[WORKERS.md](../WORKERS.md), Doing the work, requires “Edit only the files the issue names, plus your own scratch space.” I requested explicit manager authorization for the six extra pairs while continuing independent read-only checks. No authorization arrived before this checkpoint. A path accepted by the submission checker does not expand the assignment. This session therefore changes only this report and the handoff. No packet, suggested file, reader, queue, prompt, issue body, label or upstream file was edited.

The mismatch existed at author merge `f0b79768c`. The review prompt is also absent. Before redispatch, authorize the six pairs and reconcile both issue lists while preserving the independent-review instructions. Repeatedly refreshing the five existing markers cannot complete this assignment. This checkpoint preserves the bounded Adic repair, five remaining packet actions, and the newly required reassessment of ShimuraVarieties. It is blocked on assignment scope, not an eight-hour timeout.

## Finding-by-finding review

“Recorded” approves an ownership correction or an explicit supplier request, rather than asserting that the requested mathematics exists. Additional consumers listed below were read-only evidence in this run.

| Finding | Disposition and reason |
|---|---|
| /1 | Recorded. SF.1 owns general algebraic spaces, atlases, diagonals and stacks. A0 imports that carrier and retains moduli-specific effective descent and algebraicity. Unfinished geometric stack interfaces remain gaps. |
| /2 | Recorded. The accepted A0-extension-2 already supplies G-ring permanence, polynomial approximation, common etale neighborhoods and formal-object approximation before the criterion. Creating another approximation owner in R09.6 would duplicate it. Henselian G-rings and Artin's original base restrictions are retained. |
| /3 | Consumer requests recorded. PEL and both Shimura packets ask C0 for the same analytic-space carrier with nilpotents, morphisms, gluing and products. SGA 1 XII 1.1–1.2 supports this generality; a reduced manifold carrier would be insufficient. The supplier gap stays visible. |
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
| /16 | SF ownership stands; Adic correction remains blocked. SF.4 is the unique schematic-alteration owner, and L5 keeps comparison descent and local calculations. Adic still incorrectly implies that deleting SF.4-to-SF.5 resolves the MC.4 reverse-edge problem. The graph counterexample below refutes that implication. |
| /17 | Corrected SF request. StableReductionPartII MC.0/MC.2 supplies pointed moduli and proper-DM theory; MC.4 supplies projective scheme covers. For de Jong 2.24 the cover request must include every genus and at least three marks. Finite etaleness is asserted on the smooth open, not across the normalized boundary. Node-level supplier separation remains required. |
| /18 | Recorded. SF.2's coherent-duality contract is the general scheme owner; A0 consumes it. Relative-curve duality is an imported specialization, not another general construction of f!. |
| /20 | Historical handoff checked against current upstream. StableReduction's current J-E contract already states prime-to-characteristic multiplication finite etale of degree ell^(2g) and geometric torsion. Preserve the Jacobian/abelian-theory supplier boundary; do not repeat an obsolete absence claim or call this a pinned implementation. |
| /21 | Recorded, directly checked against Tate Section 6, printed p.46. I0, I1 and II have one component; positive I_n has n, III has 2, IV 3, I0* 5, positive I_n* n+5, IV* 7, III* 8 and II* 9. These are geometric component counts, distinct from component groups and rational Tamagawa factors. G-Kodaira-resolution remains open. |
| /23 | Bounded upstream request adequate. The curve/Jacobian semistability criterion names R11.1/R11.3/R11.4 and Jacobian D, with the excellent-DVR and residue-field restrictions retained. Its eventual node placement must avoid circular blanket imports. |
| /24 | Handoff adequate. TB.2 needs the complete rank-one-valued theorem or an explicit model over a discretely valued subfield. A DVR-only reduction theorem cannot justify the stated non-Noetherian valuation-ring generality. |
| /25 | Handoff adequate. TB.2 imports the combinatorial dual graph, component genera and genus formula. Edge lengths, skeleton and retraction are the new tropical content. |
| /26 | Read-only consumer correction adequate. GZ.2 imports dual graphs, local models, surface intersection matrices/projection formulas and semistable base change from StableReduction 1/4/5/7. Archimedean Green functions, admissible measures/pairings and global height gluing remain GZ-owned. The broader negative review is preserved. |
| /27 | Read-only imports adequate. ShimuraData D1/D3 names native Hodge L0/L1 and compactifications C1 names L2. These imports do not repair D0's bridge contracts or ShimuraData's elaboration failures. Other consumer links remain handoffs. |
| /28 | Read-only handoff adequate. V1 retains the holomorphic-gluing gap and asks for the tracked complex-manifold proposal or an atlas-owned carrier with that contract. Proposal references are not pinned implementations. |
| /29 | Handoff adequate. C5 still needs constant-sheaf/singular comparison with additive coefficients and coefficient/product compatibilities. The finite-ring local-system comparison cannot substitute for integral, rational and complex coefficients. |
| /30 | Handoff adequate. Proper relative coherent GAGA, relative holomorphic Poincare and the applicable Ehresmann/local-system input remain supplier tasks. SGA 1 XII 4.2 preserves properness, coherence and locally finite-type complex schemes; absolute projective comparison alone is insufficient. |
| /31 | Typed correction stands. C5 owns Betti/de Rham comparison and SF.6 the etale/Betti side. Motives' PeriodComparison has pullback, connecting-map, unit and product laws; ProductCompatible and the Tate rank-one condition remain explicit. Doubling a comparison violates its unit law. The arbitrary-pair supplier extension is still a request. |
| /32 | Algebraic correction recorded. R09.1 names O(n), projective-space cohomology with multiplication and absolute/relative Serre A/B, importing general proper cohomology. Analytic comparison inputs into C1–C3 remain handoffs. |
| /33 | Handoff adequate. C4 imports the function-field/completion dictionary from AlgebraicCurves, rather than citing R09.3 quotient theory as its normalization supplier. |
| /34 | Read-only ownership correction adequate. C0 owns the arbitrary-ring finite-fan toric construction, including valuation-ring bases. Its sibling imports that construction and keeps formal/adic/perfectoid extensions. Face localizations, torus action, base change, the complex anchor, nilpotent bases and the zero cone are named. |
| /35 | Handoff adequate. SGA 1 XII gives the nonreduced analytification, proper relative pushforward, proper coherent equivalence and proper full-faithfulness targets at 1.1–1.2, 4.2, 4.4 and 4.5. Reader reconciliation belongs to its owner. |

## Alteration dependency check and pending correction

A fresh read-only assembly used `scripts.build.assemble(require_distances=False)`, promoted stage edges, each atlas stage's `requires`, and the research roadmap definitions' `requires`, oriented supplier to consumer. The union has **15,601 edges** and is acyclic. Removing SF.4-to-SF.5 and the R11.1/R11.3/StableReduction 7/8/9 forwarding edges remains acyclic but leaves this path:

```text
SchemeAndStackFoundations:SF.4
 -> DerivedDeRhamCohomology:DD.5
 -> PerfectoidQuotients:Q3 -> PerfectoidQuotients:Q4
 -> AdicEtaleGeometry:A3
 -> RelativeFarguesFontaine:RF0:integral-Y
 -> VectorBundlesAndIsocrystals:VB0
 -> AbelianSchemesAndArithmeticModuli:A4
 -> PELModuli:M2 -> PELModuli:M6
 -> StableReductionPartII:MC.4
```

Adding nine other proposed edges jointly also remains acyclic: SF.3/R09.1 to SF.5, SF.4 to L5/RD.5, MC.2 to SF.4, and R11.1/R11.3/R11.4/Jacobian D to StableReduction 7. Adding MC.4-to-SF.4 then creates a cycle, both with and without those nine edges. Nothing was installed.

After authorization, correct these two fields in `AdicCoefficientsAndComparisons.json`:

- `gaps[id=AdicCoefficientsAndComparisons/G-owners].detail`: retain SF.4 as the alteration owner and L5 tasks 4–5 as its consumers. Say explicitly that the SF.5 rescope breaks the short SF.4/SF.5/MC.4 cycle but leaves the longer path above. Keep the MC.4 pointed-cover extension as an open request attached only to alteration nodes. Require splitting or rerouting formal/cohomological consumers before approving a whole-stage reverse import. Keep RD.5 retargeting as its own job's action.
- The first rescope's `proposal`: replace the claim that removing SF.4-to-SF.5 suffices with the same longer-path boundary. Name de Jong 2.24's all-genus, at-least-three-marked range and the distinction between the smooth-open finite-etale level cover and finite/dominant/projective normalization across the boundary. Keep MC.6's pointed extension separate. Do not introduce a competing L5:alterations owner.

These Adic edits remain pending. The preceding review expanded the existing alteration-cover gap in the issue-listed SF packet. The gap now says explicitly that the level-torsion cover is finite etale over the smooth pointed-curve locus after inverting the level prime; normalization across the stable boundary is finite dominant and projective. This records de Jong 2.24, p.62, without asserting boundary etaleness. The every-genus, at-least-three-marked range and the longer-cycle warning remain. No supplier was declared implemented and no edge was installed.

## Remaining six packet dispositions

Once expanded scope is explicit, preserve each previous review object in `reviewHistory` and write the job's marker with the current date. Reassess ShimuraVarieties against #8228 before replacing its historical review; the other five bounded actions below remain ready. A negative verdict completes the review. Avoid blanket acceptance based on successful elaboration of a represented slice.

| Packet / suggested basename | Verdict after the bounded correction | Grounds and preceding review |
|---|---|---|
| AdicCoefficientsAndComparisons | accepted for the area-fix disposition after the two-field repair | Follows REV-AdicCoefficientsAndComparisons. Ownership is correct; the cycle implication is the remaining bounded defect. Preserve all eight inherited gaps and open supplier requests. Remove legacy source-excerpt fields if this packet is edited, following the standing no-quotation rule. |
| PELModuli | needs_changes | Follows REV-PELModuli. /3's consumer request is correct, but carriers/signatures omit or weaken target geometry. `toShimuraDatum` is only the domain set; signature multiplicities are not characterized by the native Hodge summands; `unramified_reflex` states only non-divisibility of an integer, rather than unramifiedness of the actual reflex field. Importing analytification does not repair these contracts. |
| ShimuraCompactifications--C0 | needs_changes | Follows REV-ShimuraCompactifications--C0. /3, /27 and /34 are correct. The full Lean file now has a successful receipt, so the old missing-olean objection is obsolete. The real remaining objection is 83 geometric declarations, 109 API items and 84 tests represented only as comment contracts. |
| ShimuraVarieties--V0 | reassess after #8228; preserve the historical negative review | /3 and /28 remain adequate consumer requests. #8228 specifies the boundary predicate and synchronizes the reader, so the previous missing-definition/reader objections are stale. Read the new Baily–Borel argument before recording a current broader verdict; the fresh successful Lean check certifies only the two native slices. |
| GrossZagierAndArithmeticHeights--GZ.0 | needs_changes | Follows REV-FIX-RT-AREA-automorphic-1~5 and the preserved blueprint review. /26's imports are correct. Broad source-version, supplier and native-carrier/API/test correspondence objections remain. This run does not certify the restricted 2013 YZZ book's pagination. |
| ShimuraData | needs_changes | Follows REV-ShimuraData~3. /27's native Hodge imports are correct. The full file fails Lean, and five D0 prototypes still assume or change their intended bridge conclusions. Repair native carriers/instances and binding without substituting placeholders or assuming the desired conclusion. |

No marker in this table was written to an out-of-scope file. Readers are not review deliverables, even after authorization for the six packet/suggested pairs.

## Sources and library boundaries checked this session

I read public source passages directly; the descriptions here are in my own words. No PDF, source passage or restricted book was copied into the repository.

| Public source | Locators freshly read | SHA-256 of fetched PDF |
|---|---|---|
| [de Jong, Smoothness, semi-stability and alterations](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) | 2.12, pp.56–57; 2.24, p.62; 4.1/4.2, pp.66–67; 5.8, p.79; 6.1–6.5, pp.82–83. These distinguish complete-DVR traits, pointed covers, perfect-field generic etaleness, excellent-base relative curves and strict semistable pairs after finite trait extension. | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |
| [Tate, Algorithm for determining the type of a singular fiber in an elliptic pencil](https://wstein.org/Tables/antwerp/tate/tate.pdf) | Section 6 table, printed p.46, visually inspected. Component counts lie above the characteristic restriction; the discriminant/conductor rows below it require residue characteristic different from 2 and 3. | `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc` |
| [Artin, Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf) | Theorem 1.10, p.26; Section 2's base convention, p.27; Corollary 2.6, pp.28–29. The original approximation and common-etale-neighborhood claims retain their stated base hypotheses. | `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434` |
| [SGA 1, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203v2) | XII 1.1–1.2, re-edition pp.239–241; 4.2, p.248; 4.4, pp.249–250; 4.5, pp.250–251. Nilpotents survive analytification; proper relative pushforward comparison and proper full faithfulness have their own precise contracts. | `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c` |
| [Huber–Muller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Theorem 2.10 and its proof, printed p.11, with the public definition of effective formal periods. Both diagram-edge relations and product-compatible comparison matter for the period algebra. The packet's rank-one Tate witness is stronger than bare finite-dimensionality. | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |

Stacks [16.13.1, Tag 07QY](https://stacks.math.columbia.edu/tag/07QY) and [16.13.2, Tag 07QZ](https://stacks.math.columbia.edu/tag/07QZ) distinguish a solution in a henselian Noetherian local G-ring from a solution in a pointed etale neighborhood without henselianity. The A0 prefix preserves that distinction.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No new baseline citation was introduced. The inherited build audit reports an exact Mathlib commit match and byte equality of all 5,477 Tau Ceti source files with the deployed baseline; that audit was not rerun here. Reading pinned `Hodge.Conjugation` confirms that it bundles `toEquiv` and involutivity without a function coercion, explaining the first ShimuraData failures.

I also read the current upstream AlgebraicVectorBundles and StableReduction READMEs in full, the relevant AlgebraicVectorBundles suggested interfaces, and the current Tau Ceti RelativeSpec declarations. Current roadmap commit `8c72a04753b11cab07fa593cc38ceaa7c0515380` and library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` are read-only evidence, distinct from the pinned baseline. AlgebraicVectorBundles L1A/L1B already owns relative Spec, its universal property, anti-equivalence and base-change API; SF's existing correction imports this work. Proper coherent cohomology over locally Noetherian bases is not restricted to relative curves. No Lake command was run in either current checkout.

## Validation and elaboration receipts

Fresh packet validation of all eleven files reports **zero errors and zero warnings**, using the pinned declaration index. No packet or suggested file changed in this session. Nine hashes match the positive sequential `lean-check` receipts of `codex-C7DgOu`, recorded in #8158 and preserved by #8203; those nine compilations were **not rerun here**. ShimuraVarieties changed in #8228 and was freshly compiled by `codex-dj6XVp`, with exit 0 and only the same 23 admitted-proof warnings. Its current hash replaces the stale inherited hash in this table.

| Suggested basename | Nodes | Sorry-only warning count | Checked SHA-256 |
|---|---:|---:|---|
| MotivesAndAlgebraicCycles | 182 | 805 | `f3874f8f0eb1355d40433cbef95f0cff7bd9d1165822483985bd9529fbfcb51f` |
| AlgebraicModuliForArithmeticGeometry--A0-extension | 476 | 1040 | `0f1da0e8f85427066acfe3b33981bc716e0ec952020678d07ced3b873b6b7575` |
| SchemeAndStackFoundations | 303 | 362 | `7d7dd0439924404df02f6ed8f1761e2751b060c04ff98710d7616deb9d4ce66e` |
| PELModuli | 91 | 274 | `440356076be289a6215d5b5a3214cb80ce1f20a9894913962e762fcf0e54d4ac` |
| ShimuraCompactifications--C0 | 90 | 28 | `45120a7155be6b4246f83ec1501b4197354fe99098bcdc38110516892325208e` |
| ShimuraVarieties--V0 | 69 | 23 | `346f61f69bf51c8bb85da98d105cd827f3ba361a1414710da7d630e2a1dd571b` |
| AnabelianGeometryAndNonabelianChabauty | 363 | 699 | `ca220b2dc0a473c710a4ad87d93e49a5b4c87904cb588aa38c59a0309eac5263` |
| AdicCoefficientsAndComparisons | 46 | 53 | `53536071d886ba06df9cb4e37ab26fa5034a453ec08f6ec500befbc63e9904e6` |
| NeronModelsAndSemistableAbelianVarieties | 78 | 53 | `562d40c7fabbf1c505626f1fa795dfcb5ea7413b24e35d0063a9c1ba6e9157a9` |
| GrossZagierAndArithmeticHeights--GZ.0 | 241 | 443 | `18674ddb9306f3600bf443cba1a3e79924204f47d3be7feeaeb803caf46a79d4` |

**Fresh ShimuraData check (`codex-dj6XVp`), reproducing `codex-wPmvcW` #8221:** after checking available memory, `lean-check` on the full unchanged file failed elaboration and stopped at line 883 with the `maxErrors=100` limit. The log contains **66 error headers**, including the limit diagnostic, and **113 warning headers**: 110 admitted-proof warnings plus three others. The unchanged hash identifies the checked input; this is not an exhaustive error count. SHA-256 is `9377216ae5607357bdeaebb207f84cdc25d3d958eea88c279947a171cc216cc9`; packet node count is 123.

Initial failures are applying `Hodge.Conjugation` as a function at lines 186/210/218, the stuck comodule at 213, the gradedRealHodge carrier mismatch at 285 and a reserved `GL` parser collision at 363. The other warnings concern SRep universes at 176 and class-valued definitions at 261/440. Fixing those syntactic/instance failures would not settle the five D0 mathematical bridge objections.

The graph checks above are fresh. No standalone link map or restructuring result changed; the embedded ownership proposals received the graph test. The submission file check and `git diff --check` pass. The stock completion predicate remains false because only five of eleven packets carry this review's marker. All eleven packets contain zero legacy source-excerpt fields. The handoff records the assignment repair and remaining work, including the newly detected stale ShimuraVarieties rationale and its fresh compilation receipt. No supplier, Lean signature or test was changed by this session.
