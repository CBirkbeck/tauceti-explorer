# Independent review of the round-four p-adic fixes

Reviewer: **Codex**, session **codex-5FwGoc**, 10 October 2026. Review issue [#6519](https://github.com/CBirkbeck/tauceti-explorer/issues/6519); fix [#6518](https://github.com/CBirkbeck/tauceti-explorer/issues/6518), by Claude session claude-u7hFFB. Input commit: `b9ba38061383810d0da07c603653912ba7715c7c`. This session wrote none of the fix, preceding reviews, red team or verification.

**Faltings and Adic are accepted for the scoped fixes. Perfectoid needs changes because its broader review remains unfinished.** The reader corrections requested in [the preceding review](REV-FIX-RT-AREA-padic-2~3.md) are correct and synchronized. All three suggested files elaborate with only admitted-proof warnings.

The review authorized by the live issue is finished. This submission is a **blocked checkpoint** because the generated queue requires twelve additional packets that the live issue does not authorize. The [handoff](../handoff/REV-FIX-RT-AREA-padic-2~4.md) records the exact scope repair needed. A fresh worker cannot resolve that mismatch merely by repeating this review.

## Scope and preservation

Read the claims, evidence, proposed fixes and verified reasons for findings `/1`–`/36` in [the findings](../redteam/RT-AREA-padic-2.result.json) and [verification](../redteam/RT-AREA-padic-2.review.json), the complete [round-four fix report](../redteam/RT-AREA-padic-2.fixes-4.md), and the preceding independent fix review. Findings `/37`–`/46` are outside this review. Earlier rejections of `/38` and `/41` remain in force.

The fix changes two readers and its report. The mathematical repairs already reside in the packets. Checked the six affected Faltings supplier nodes, three Perfectoid nodes, eight uses of two Adic F1 constructions, and their relevant prerequisites, requests, coverage, source locators, acceptance examples and suggested declarations/comments. This is a review of these fixes, not a new comprehensive audit of the 919 inherited nodes. It introduces no node or supplier and changes no mathematical contract.

Only the three authorized packets' top-level review objects and history are changed, together with this report and handoff. Each immediately preceding review is appended to `reviewHistory`, including the newer padic-1 reviews dated 10 October. Their mathematical qualifications remain effective. The suggested files and readers are unchanged. No atlas, campaign, queue, receiving packet or upstream file is edited or promoted by this worker.

## Faltings: the repaired inertia example is correct

At the places `v_i | l` used in `R28.2/inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion`, the toric submodule of the split Tate curve is `Z_l(1)`. Inertia acts there through the cyclotomic character. A finite extension of `Q_l` still has an infinite ramified cyclotomic tower, so this restriction has infinite image. The whole representation consequently has diagonal eigenvalues other than one and cannot generally be called unipotent. Quotienting by the toric submodule gives the trivial representation, consistent with the node. Semistable unipotent inertia concerns an auxiliary Tate-module prime different from the residue characteristic.

The repaired reader bullet matches `acceptance[2]`. A section-local whitespace-normalized comparison also finds all **48** statement, hypothesis and acceptance strings of the six affected nodes. The preceding review's only new reader defect for this packet is therefore resolved.

Fresh source checks preserve the other qualifications of `/5`:

- Faltings 1983, Lemma 6, pp.358–359 concerns inertia on the quotient. The determinant calculation on p.359 uses the positive twist on the covariant Tate module; p.360 separately invokes global class field theory. A local finite-inertia conclusion alone does not supply global finite order.
- Tate, Proposition 2 and its proof, pp.164–165 give a discriminant computation. The count of invariant differentials also needs the linear term of multiplication by `l^n` on the formal group: rank `d` gives `(R_i/l^n)^d`, of cardinality `l^(n m_i d)`. The supplier proof remains requested.
- Tate, Proposition 12, pp.181–182 requires a Galois-stable direct summand. Saturation is essential: `l Z_l` inside `Z_l` is a negative control. Stabilization produces a divisible shifted tail, not divisibility of every original closure or a closed immersion of the resulting model.
- Raynaud, §4, pp.271–272 assumes a strictly henselian mixed-characteristic base; Theorem 4.1.1 additionally has `e <= l-1`. Faltings p.364 uses its unramified application. Raynaud's absolute different in the appendix, Definition 8, p.279 is not by itself the still-requested comparison with invariant differentials.

For `/20`, the three early `R06.1` parent references remain qualified supplier requests. The candidate nodes `PadicHodgeTheory:R06.1/tate-sen-theorem` and `R06.2/hodge-tate-decomposition-tate` currently have **22** and **160** strict ancestors in the combined packet graph, with no R07 or R28 ancestor. This checks the proposed route's packet-level cycle concern; unresolved external stage leaves are not a whole-atlas proof. Contrary to the round-four report's earlier snapshot, P7 now has a `needs_changes` review (`REV-FIX-RT-RS-01`, 10 October). It remains partial. Do not silently replace these requests by supposedly accepted exact suppliers. Analytic normalized-trace estimates and completed cyclotomic descent still require their owner.

**Verdict: accepted for these fixes.** The 12 gaps and 37 requests remain open; the packet remains partial.

## Perfectoid: synchronized primitive-kernel examples, broader gaps retained

The reader now contains all three acceptance items of `P1/distinguished-element-criterion`, including the corrected positive and negative examples. Both `p - [pflat]` and the cyclotomic sum `xi_cyc` are primitive elements of the same theta kernel over `O_{C_p}`. Since that kernel has a regular generator, they differ by a unit. Scholze 2013, Lemma 6.3, pp.35–36 and BMS, Lemma 3.10/Remark 3.11, pp.22–23 support this criterion.

For the negative example, `mu = [epsilon]-1 = ([epsilon]^(1/p)-1) xi_cyc`. The first factor has zeroth Witt coefficient in the maximal ideal of the tilted valuation ring, hence is a nonunit. Regularity of `xi_cyc` then rules out equality of the two principal ideals: equality would allow cancellation and force the factor to be a unit. Thus kernel membership alone cannot certify primitivity. The reader matches the packet's argument. No new claim about a concrete elaborated Lean test is made; the suggested file has an explanatory comment and the proposed associated-element theorem.

All three affected supplier-use records also match their reader sections: the theta-kernel record has four uses and the untilt-classification record has three. AI.0 specializes through Q0. The rational field generator/filtration remains R06's responsibility. RF2's general coefficient field, equal-characteristic and ramified Witt constructions, integral divisor interpretation and graded line modules remain separate adapters. A chosen generator trivializes a rank-one module; identifying a Tate twist needs period data. Diamonds, Lemmas 3.14–3.16 and their proofs, pp.17–18 supplies the general Tate-pair theta/kernel scope, whereas the freshly read Scholze 2013 statement assumes a perfectoid characteristic-zero base field.

The latest padic-1 review remains substantively binding: general-base root-annihilator/almost-flatness comparison, invariance under almost elements and field-base comparison are gaps. Precise Cohen/power-series/quotient/normality/filtered-colimit supplier interfaces remain missing. The P7 tower theorem and negative-test text is not an elaborated signature/example. The earlier comprehensive source, dependency, baseline, API, test and planet audit remains unfinished. Correcting these acceptance examples does not finish it. Reader discrepancies outside these fixes are already recorded in the round-four report and retain their separate owners.

**Verdict: needs_changes.** The scoped round-four fixes are correct; all 17 gaps and 13 requests and the wider audit obligations remain. The packet remains partial.

## Adic: ordinary comparison and boundary spectral sequence remain distinct

All eight affected use records agree with their own reader sections: five for `F1/dagger-de-rham-complex` and three for `F1/compact-support-log-complex`. The relevant F1 coverage and suggested comment retain the same ownership boundary.

Grosse-Klönne, Theorem 5.1(c), pp.23–24 applies to the open dagger tube of `Y`, inside the partially proper space attached to its closure, with a proper admissible formal ambient space over a complete mixed-characteristic DVR, smooth along `Y`. This is not an arbitrary generic-fibre or logarithmic comparison. Section 5.2 gives a compact-support sketch, leaving general adapters as proof obligations.

HLTT, Lemma 6.8, pp.189–190 supplies ordinary comparison and functoriality in its smooth quasi-projective setting. Lemma 6.21, p.207 instead constructs a boundary-stratum spectral sequence with rigid cohomology groups on its first page and boundary-support cohomology as abutment. RD.4 owns the ordinary comparisons on the strata; AG2.4 owns that sequence. Corollaries 6.22 and 6.24, pp.207–208 use separate finiteness and weight inputs. Lemma 6.8 does not directly identify the whole boundary abutment with one ordinary rigid cohomology group.

The two existing constructions retain 18 API items and nine planned tests. In characteristic zero the dagger-disc primitive distinguishes it from the rigid closed disc; the rigid series has a formal primitive whose coefficients do not tend to zero. For `(P1,{0,infinity})`, the boundary-vanishing complex has zero degree-zero hypercohomology, unlike ordinary cohomology of its complement. The naive boundary ideal times ordinary differentials fails to be a complex because differentiating the boundary parameter exits that ideal. These are meaningful negative controls, but their text remains comments in the suggested file, not compiled Lean tests. Compilation verifies only the declarations actually present.

**Verdict: accepted for the supplier-use corrections.** It does not certify a new comprehensive audit of 537 nodes or install the pending sousperfectoid split. The newer padic-1 split verdict and all 73 gaps and 22 requests remain preserved.

## Disposition of every assigned finding

“Handoff” means the verified qualification and receiving assignment are preserved. It is not acceptance of the receiving blueprint or a claim to have freshly read all its literature. Current bodies of all sixteen receiving issues were fetched on 10 October; all remain open and carry the assignments below. `/15`'s generic Koszul owner #708 is an additional obligation, not an explicit assignment in that issue. #978 also lists `/16`.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff #664: finite-free, algebraically closed scope; distinguish BMS full faithfulness from Scholze–Weinstein essential surjectivity and import Witt isocrystals. |
| /2 | Handoff #704: DD0 ordinary de Rham and CR0 PD foundations are separate; retain comparison/base-change hypotheses. |
| /3 | Handoff #664, #697, #757, #968: local `Rnu_* A_inf` and proper global primitive comparison have separate sources, covers and derived-completion inputs. |
| /4 | Handoff #731, #697, #978: Kummer and cyclotomic towers differ; integral lattices retain weight ranges and annulus/slope inputs. |
| /5 | Local corrections accepted as checked above; supplier #731 still owes differential, shifted-closure, Hodge–Tate and Raynaud proofs, especially the different comparison. |
| /6 | Handoff #978: BS22 Theorem 9.1 is a derived formal comparison with its hypotheses, not an unrestricted degree-zero syntomic assertion. |
| /7 | Handoff #708: strict surjectivity is insufficient for lci; retain regular-sequence conditions and the non-lci square-zero counterexample. The ambiguous colimit claim stays uncertified. |
| /8 | Handoff #704: relative de Rham–Witt has general `Z_(p)` bases and continuous differentials; crystalline nilpotence and Tor conditions cannot be omitted. |
| /9 | Local no-op, handoff #664: ordinary Witt sheaves and derived completion remain distinct AI3 inputs. |
| /10 | Handoff #664: ordinary rational Witt sheaves map to rationalized completion; no unproved inverse or early structural-comparison cycle. |
| /11 | Handoff #664: import CR3 Frobenius-isogeny input; BMS 13.21 remains rational, proper smooth and dependent on the chosen residue-field section. |
| /12 | Handoff #704: DD3 Cartier needs its Frobenius twist, lift and torsion-freeness conditions. |
| /13 | Handoff #665: AI6 imports CP3's canonical period comparison in the proper semistable range. |
| /14 | Handoff #705: integral quasicoherent non-fine log and finite-level PD hypotheses remain; no arbitrary mixed-base envelope claim. |
| /15 | Handoff #664; generic Koszul ownership #708/DD1 remains qualified. AI1 applications retain the cohomological shift by dimension. |
| /16 | Handoff #704/#978: pro-exactness uses restriction-minus-Frobenius, multiplication by powers of p and iterated restriction; do not assert fixed-level injectivity or identify topologies. |
| /17 | Local theta specialization and primitive acceptance accepted; #664 retains the remaining AI0 audit. Library kernel principality remains outside the baseline. |
| /18 | Handoff #968: Berger's slope route imports RD/PG common coefficient and annulus scopes; an alternative FF route is not established by its name. |
| /19 | Handoff #968: PG2 Robba and R01.2 Weil–Deligne carriers remain separate, with coefficient-prime distinctions and appendix qualifications. |
| /20 | Local early supplier requests accepted with the partial P7 qualification above; #968 owes analytic trace and completed cyclotomic descent. |
| /21 | Local P1 imports accepted; #968/#985 retain the rational field adapters and RF2's general-field, integral-divisor and graded-line scope. |
| /22 | Handoff #685, #687, #969: R06 owns general comparisons; R19/AG2 own the later modular and Shimura applications. |
| /23 | Handoff #697: first Chern classes alone do not supply higher classes or projective-bundle formula; the formal/scheme/adic adapter needs proof. |
| /24 | Handoff #978: arc generic-fibre torsion descent is a proposed-owner request, not already supplied by perfectoid v-descent. |
| /25 | Local no-op, handoff #978: qualified torsion Spec/Spa comparison does not identify all sites; integral p-adic coefficients need derived inverse limits. |
| /26 | Handoff #978: DD3 Cartier retains the twist, multiplication and Bockstein compatibility. |
| /27 | Handoff #978: the early Witt input has its torsion-freeness restriction; the later general theorem follows décalage in PR3 without a reverse dependency. |
| /28 | Handoff #978: relative and absolute Nygaard, twists and syntomic fibres have distinct owners and formal/scheme sites. |
| /29 | Local no-op, handoff #978: WCart is a formal quotient on p-nilpotent tests, using completed QCoh/Perf rather than an ordinary affine scheme. |
| /30 | Handoff #978/#731: lisse integral descent needs completeness and finite mod-p data; the slope-zero extended-Robba dictionary concerns finite-free lattices. |
| /31 | Local no-op, handoff #964: reuse F1 dagger carriers while retaining imperfect-residue, Cohen/Frobenius-lift and relative fringe inputs; scalar Bézout does not prove relative Bézout. |
| /32 | Local use corrections accepted; #964 ordinary tube comparison and #686 boundary spectral sequence remain separate, with finiteness and weights passed through the sequence. |
| /33 | Local no-op, handoff #964: the chosen point of the finite-étale neighborhood must be smooth; L5 geometric descent does not supply rigid-cohomological descent. |
| /34 | Handoff #964: local irregularity is early; global index follows RD4 cohomology, with irregularity–Swan and equal-characteristic conductor inputs separately owned. |
| /35 | Handoff #708: DD5 uses elementary Q0 perfectoid covers, not late Q3 André inputs. |
| /36 | Handoff #704/#708: classical PD belongs to CR0; regular/lci derived comparison belongs to DD4. Naming an envelope does not construct it. |

No receiving issue body or packet was changed. Existing receiving files remain subject to their own reviews.

## Fresh sources and pinned-library checks

Reading date: 10 October 2026. The following ledger records bounded passages actually read, not full-paper reading claims. Cleared library copies were read in place; no files or passages were copied from that library. All mathematical discussion here is in the reviewer's own words.

| Public source | Bounded reading | SHA-256 |
|---|---|---|
| [Tate](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | Images, printed pp.164–165,176–177,180–183: local linear term/discriminant, character criterion, dual twist and complete Proposition 12 stabilization argument. | `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| [Faltings 1983](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf) | Images, printed pp.358–360,364: Lemma 6, differential count, local/global determinants and Raynaud application. | `f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a` |
| [Raynaud](https://www.numdam.org/item/10.24033/bsmf.1779.pdf) | Images, printed pp.271–272,279: §4 hypotheses, 4.1.1 argument and appendix Definition 8. | `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| [Grosse-Klönne](https://arxiv.org/pdf/1408.3329v1) | PDF pp.22–24: complete 5.1 statement/proof and 5.2 sketch. | `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b` |
| [HLTT](https://arxiv.org/pdf/1411.6717v1) | PDF pp.189–190,207–208: 6.8 statement/proof, 6.21 sequence and 6.22/6.24 proof routes. | `66b646fa40ec558b96eeb1c06456051398dbe2021de3d864b4930da001b647f6` |
| [BMS](https://arxiv.org/pdf/1602.03148v3) | PDF pp.22–23: 3.9/3.10 statements/proofs and 3.11 distinguished criterion. | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [Scholze 2013](https://arxiv.org/pdf/1205.3463v2) | PDF pp.35–36: kernel proof 6.3 and graded description 6.4 with perfectoid-field hypotheses. | `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| [Diamonds](https://arxiv.org/pdf/1709.07343v4) | PDF pp.17–18: 3.14–3.16 and proofs in general Tate-pair scope. | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |

The Faltings erratum and SGA 7 orthogonality provenance are inherited, not freshly reread; Tate independently supports the saturation/tail qualification. The full different comparison and original finiteness/weight proofs remain unverified suppliers. Other findings' complete source literature was not reread. No new source-error allegation is made.

The existing baseline source repositories and declaration-index manifest match Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the following affected declarations and surrounding hypotheses:

- `PreTilt`, `RingTheory/Perfection.lean:634`, is algebraic perfection of reduction modulo p. Topological tilting still requires the packet's adapter.
- `PreTilt.untilt`, `RingTheory/Perfectoid/Untilt.lean:49`, is multiplicative and needs p-adic completeness, prime p and its nonunit condition; the mod-p coordinate formula follows.
- `WittVector.frobeniusEquiv`, `RingTheory/WittVector/Frobenius.lean:286`, requires a perfect coefficient ring.
- `WittVector.fontaineTheta`, its Teichmüller formula and `surjective_fontaineTheta`, `RingTheory/Perfectoid/FontaineTheta.lean:164–215`, require the actual completeness/nonunit hypotheses; surjectivity additionally requires Frobenius surjective modulo p.
- `fontaineThetaInvertP`, `BDeRhamPlus` and `BDeRham`, `RingTheory/Perfectoid/BDeRham.lean:57–100`, define localization/completion. Principal kernel, extended theta and valuation-ring results remain TODOs, not imported theorems.
- `Algebra.normalizedTrace`, `FieldTheory/NormalizedTrace.lean:81`, is an algebraic characteristic-zero linear map, not completed cyclotomic trace estimates.
- `CochainComplex`, `Algebra/Homology/HomologicalComplex.lean:157`, and `ExteriorAlgebra.exteriorPower`, `LinearAlgebra/ExteriorAlgebra/Basic.lean:79`, provide algebraic carriers, not dagger sheaves or hypercohomology.
- Tau Ceti's affine-group-scheme property and finite-locally-free commutative refinement were checked in `AlgebraicGeometry/AffineGroupScheme/Basic.lean` and `CartierDuality/FiniteLocallyFree.lean`. They do not supply the requested divisible tower/determinant comparisons. The corresponding files in the shared Lean build are byte-identical to this pinned source.

Read the relevant reviewed library-coverage entries and the current read-only AdicSpaces and LocalFieldsRamification roadmaps, and inspected the current Tau Ceti affine finite-flat carrier. Current upstream checkouts have different commits from the pins; they were used for ownership checks, never as pinned baseline evidence. No new planning or upstream edit is introduced.

## Validation and completion boundary

Fresh `scripts/check_blueprint.py` against the pinned declaration index reports **zero errors and zero warnings** for all three packets: 56, 326 and 537 nodes. No link map or restructuring proposal is under review, so their checkers are not applicable.

Fresh sequential `lean-check` runs all return **exit 0**: Faltings **197**, Perfectoid **1285**, Adic **912** warnings, all exclusively declarations using `sorry`. No build, update, cache download or language server was run. Commented specifications and external supplier obligations are not thereby formalized.

Semantic comparison against the input confirms only review replacements/history appends in the packets. All node IDs, mathematical statements, source records/verdicts, baselines, prerequisites, APIs/tests, planets, coverage, gaps and requests are preserved. `research/blueprint/intake.py check-files` and `git diff --check` pass for the five changed files.

The stock `issues.deliverables_complete` predicate succeeds when given the live issue's seven authorized outputs and fails for the actual generated queue entry's 31 outputs. The latter demands review objects for fifteen packets, twelve outside this issue's allowed files. The handoff lists them and the maintainer action. The blocker is administrative scope reconciliation; no further permitted mathematical edit can make the queue entry complete.

## Continuation: completion-boundary verification

Codex session **codex-hHkBnT**, 10 October 2026, independently checked the administrative boundary at input `fb0cd9eed77d7eb6fbd7226707e91d90fa7acdfe`. The bot confirmed this session's claim in [comment 6099408303](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6099408303). This continuation does not replace the mathematical review above or its source-reading attribution.

The live issue still authorizes seven outputs, whereas the generated queue names 31. All 31 exist. Using the unmodified `issues.deliverables_complete` function gives `True` for the live seven-output scope and `False` for the queue scope. The three authorized packets already carry this job's reviewer identifier. Each of the twelve extra packets carries an **accepted** verdict from its own independent review:

| Extra packet | Existing independent review job |
|---|---|
| AInfCohomology--AI.0 | REV-AInfCohomology--AI.0~2 |
| CrystallineCohomology--CR.0 | REV-CrystallineCohomology--CR.0~2 |
| CohomologyComparisons | REV-CohomologyComparisons~2 |
| IgusaVarietiesAndTorsionConcentration | REV-IgusaVarietiesAndTorsionConcentration~2 |
| PrismaticCohomology--PR.0 | REV-PrismaticCohomology--PR.0~2 |
| DerivedDeRhamCohomology | REV-DerivedDeRhamCohomology~2 |
| AInfCohomology--AI.6 | REV-AInfCohomology--AI.6~2 |
| CrystallineCohomology--CR.5 | REV-CrystallineCohomology--CR.5~3 |
| RelativeFarguesFontaine--RF0 | REV-RelativeFarguesFontaine--RF0~2 |
| AutomorphicGaloisRepresentations | REV-AutomorphicGaloisRepresentations~2 |
| AutomorphicGaloisRepresentationsPartII--AG2.6 | REV-AutomorphicGaloisRepresentationsPartII--AG2.6~2 |
| AutomorphicGaloisRepresentationsPartII--AG2.0 | REV-AutomorphicGaloisRepresentationsPartII--AG2.0~2 |

This is a metadata inspection, not a new review of those packets. Their accepted statuses do not establish that this fix review has checked them. The completion predicate explicitly requires the exact reviewer identifier for every packet in the job's outputs; it cannot be satisfied by their existing, different identifiers.

The generator location requiring maintainer attention is `research/blueprint/make_queue.py`, function `fix_rounds` (lines 1909–1969 at this input). It preserves the initial finished fix's outputs, derives each review from `current_outputs`, and may append newly routed `missing` blueprint paths when advancing rounds. Historical later-round scope is preserved only under the `made` branch's conditions. Compare the recorded round-four fix's historical outputs and actual submitted changes with the regenerated review's outputs before regenerating. Do not simply refresh the live issue with the enlarged scope: those twelve receiving packets were not part of the submitted reader-synchronization fix.

Fresh validation in this continuation: all three authorized packet checks pass with **zero errors and zero warnings**, using the declaration index whose manifest matches the pinned commits. The mathematical packets, readers and suggested Lean files are unchanged. Lean was not rerun: this continuation changes documentation only, and the prior successful elaborations remain attributed to the prior session. No fresh primary-source reading or new mathematical verdict is claimed.

## Continuation: current-main blocker remains

Codex session **codex-Ndn8bk**, 10 October 2026, claimed issue #6519 with bot confirmation in [comment 6099697112](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6099697112). Input commit: `1a52d36eb0e5ea0a37b1788804817c49abb8cc92`. This continuation inspected the full live issue, its claim/checkpoint history, the round-four fix report, previous report and handoff, queue-generation logic and completion predicate. It preserves the mathematical verdicts and their original source-reading attribution.

The queue was also fetched independently from GitHub's current `main`, rather than relying solely on the clone. It still marks this review pending and lists **31 outputs**, including **15 packets**. The live issue lists **seven outputs**, including **three packets**. All twelve extra packets have accepted reviews by their own independent jobs, with different reviewer identifiers. The unmodified `issues.deliverables_complete` returns **True** for the live seven-output scope and **False** for the generated scope. In `issues.py`, the review branch requires this job's exact reviewer identifier on every packet output. An accepted review by a different job does not satisfy that test; a `needs_changes` verdict by this job does. Thus the retained Perfectoid verdict is not the administrative blocker.

Fresh `scripts/check_blueprint.py` runs against the declaration index whose manifest records Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` pass for all three authorized packets: **56, 326 and 537 nodes; zero errors and zero warnings each**. No link map or restructuring proposal is in scope. No mathematical file changed, no source-reading claim is added, and Lean was not rerun for this documentation-only continuation. Earlier successful elaborations remain attributed to their original session.

This is a blocked checkpoint. Completing the queue's larger review would require edits outside the issue's explicit file restrictions. The maintainer should reconcile the historical fix/review outputs with queue generation and issue scope, and keep this issue unavailable until that repair is made; otherwise each new process can only rediscover the same blocker. Retain the existing three-packet review. Do not overwrite twelve unrelated independent verdicts merely to satisfy the identifier test. The existing handoff reproducer and extra-path table remain sufficient to resume without scratch files.


## Continuation: historical scope independently recovered

Codex session **codex-iYcsUX**, 10 October 2026, at input `0d2178b78bf6a3deea5f4c16c2165442659a2a38`; claim confirmed in [comment 6099841027](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6099841027). This continuation inspected the full claimed issue, earlier handoffs, round-four fix report, completion predicate and round-generation logic. It preserves the mathematical review and source-reading attribution above.

Both the checked-out queue and a freshly fetched current-main queue still require **31 outputs / fifteen packets**, against the live issue's **seven outputs / three packets**. The stock completion predicate gives `True` for the live scope and `False` for the queue scope. Every additional packet has an accepted review with a separate independent reviewer identifier; metadata inspection does not constitute a new mathematical review of those packets.

The historical queue at [the round-four fix merge, 888f12f5c9d80d8205c6f7dd55cbbb933633b5e6](https://github.com/CBirkbeck/tauceti-explorer/commit/888f12f5c9d80d8205c6f7dd55cbbb933633b5e6) provides new evidence: the fix had **ten outputs**, and this review had **seven**, exactly matching the live issue. The merge changed only two readers and the fix report. The historical scope therefore gives the maintainer a concrete restoration source. Preserve those already-created scopes in `make_queue.py` before regenerating: the current `fix_rounds` preservation branch is conditional on neither newly missing blueprint outputs nor a send-back being present. Validate preservation after regeneration rather than relying on a queue-only edit.

Fresh pinned-index packet checks pass with **zero errors and warnings** for all three authorized packets, with **56, 326 and 537 nodes**. No link map or restructuring proposal is under review. Only the report and handoff change; no new source reading, mathematical verdict or source-error claim is added. Lean was not rerun for these documentation-only changes. Prior compilation evidence remains attributed to the session that obtained it.

This remains a **blocked checkpoint**, because scope reconciliation requires changes outside the explicit issue deliverables. The handoff identifies the historical source and required maintainer action. Repeating the bounded review or changing its Perfectoid verdict cannot make the larger queue scope complete.
