# RT-AREA-langlands-3: second-round fixes

Job `FIX-RT-AREA-langlands-3~2`, Refs #6980. Claude (Claude Code), session `claude-c9cXZu`, 17 October 2026. The bot confirmed this session's claim before work began. This is a completed fix pass for independent review (`REV-FIX-RT-AREA-langlands-3~2`). It is not a checkpoint, and it does not claim that ModularityAndLanglandsExtensions is closed.

- **Findings:** `RT-AREA-langlands-3.result.json`. **Verdicts:** `RT-AREA-langlands-3.review.json`: /1 and /4 are confirmed, /2 and /3 rejected. **Round 1:** `RT-AREA-langlands-3.fixes.md` (cc-39fac3, 29 September 2026). Round 1 could edit no finished blueprint, so it wrote its changes as edits to `content/campaign/`, `data/atlas.json` and paper routes for the maintainer.
- **Base:** origin/main `4c26da696`.
- **Files changed:** `research/blueprint/packets/ModularityAndLanglandsExtensions.json`, its reader `research/blueprint/readmes/ModularityAndLanglandsExtensions.md`, its suggested file `research/blueprint/suggested/ModularityAndLanglandsExtensions.lean`, and this report. Node ids, coverage statuses, planets, implementation statuses and the independent-review object are unchanged.
- **Disclosure:** this session wrote none of the red team, its verification, round 1, the roadmap's blueprint revisions, its package or their reviews.

## Summary

| Finding | Verdict | This round |
|---|---|---|
| /1 (high, missing): ML.4's classification inputs have no constructive owner | confirmed | **Changed.** The packet already had an owner node for every routed classification input; BP-ModularityAndLanglandsExtensions~2 and its review added them after round 1. This round does three things. It separates the unconditional GSp₄ exports from the conditional ones in every node concerned. It makes the trace-formula register state each input's status from Atobe–Gan–Ichino–Kaletha–Mínguez–Shin. It records round 1's five sub-stages as a sub-layer proposal of ML.4. Ishimoto, Gee–Taïbi and Gan–Takeda §12 were read directly. Every routed item is mapped to its owning node in the table below. |
| /2 (high, missing) | rejected | No change. |
| /3 (medium, missing) | rejected | No change. Round 1's note for R20.3's blueprint stands. |
| /4 (medium, missing): definite quaternionic completed cohomology | confirmed | **Handed on, unchanged.** The finding concerns CompletedCohomologyAndLocalGlobalCompatibility, which has no blueprint yet. Its blueprint job `BP-CompletedCohomologyAndLocalGlobalCompatibility` (issue #700) already lists RT-AREA-langlands-3/4 among its confirmed findings. Round 1's R31.1:definite and R31.4:definite texts, read from Dospinescu–Le Bras, are the design that job should follow. |

## /1: ML.4's classification inputs

### State at the start of this round

Round 1 described five sub-stages of ML.4: gsp4-local, gsp4-arthur, classical-arthur, real-packets and xu-packets. It also described a status rule (local correspondences unconditional, multiplicity formulas conditional on the twisted weighted fundamental lemma), nine paper-route edits and an edit to BCGP route 4's Part II brief. None of these files was edited.

The finished blueprint now contains what those sub-stages were to own. Its 31 ML.4 targets include `gan-takeda-llc-gsp4`, `gsp4-arthur-classification`, `local-arthur-packets`, `arthur-multiplicity-formula`, `mok-unitary-classification`, `kmsw-inner-forms`, `vogan-packets-so-v`, `amf-nonsplit-so-v`, `adams-johnson-packets`, `moeglin-renard-packets`, `xu-gsp2n-packets` and `xu-multiplicity-formula`. Status is recorded in `ML.0/arthur-dependency-gate`, `ML.4/trace-formula-inputs-register` and `ML.4/symplectic-branch-status`, and `restructure` proposes a constructive endoscopic Part II (proposal 2). So the routed inputs had owners. Three things the verifier asked for were still missing:

1. **A blanket conditional label on the GSp₄ branch.** `symplectic-branch-status` was titled as if the whole branch were conditional. `gl4-symplectic-descent` marked its whole statement conditional, although Gan–Takeda Theorem 12.1 gives the existence of a generic descent without the trace formula. The verifier had asked that Gan–Takeda's unconditional results be kept apart from the source-dependent multiplicity statements.
2. **A register that did not give the statuses it promised.** `trace-formula-inputs-register` said each input carried a status but did not list them. Its only source was BCGP §1.4.1, while its match described Atobe–Gan–Ichino–Kaletha–Mínguez–Shin.
3. **No packet-level form of round 1's sub-stages, and an unchecked Ishimoto claim.** Round 1 left the non-quasi-split SO(V) branch open as a check. The packet cited Ishimoto only through Gan–Ichino.

### Changes to the packet (each synchronised in the reader and in the suggested file's manifest)

- **`ML.4/symplectic-branch-status`** (rewritten; retitled "Status of the symplectic (GSp₄) branch: unconditional local exports, conditional global ones"). It now lists two groups.
  - *No stabilised twisted trace formula:* Gan–Takeda's rec_GT; the packet L(ρ); Gan–Takeda's strong generic lift (Theorem 12.1) and its consequence Gee–Taïbi Proposition 7.3.1; the archimedean computations.
  - *Conditional on the twisted weighted fundamental lemma:* Gee–Taïbi's Theorems 3.1.1 and 7.4.1, and each node built on them, named one by one.

  It records the outcome of round 1's verification task. Gee–Taïbi's disclosure (§1.1, p. 3) ties their status to Arthur 2013 and Mœglin–Waldspurger; [A24] is Mœglin–Waldspurger I.4.11, and [A25]–[A27] are AGIKMS's main theorems. That leaves the twisted weighted fundamental lemma as the only hypothesis. The node does not assert a status for Chan–Gan's tempered character relations, because Chan–Gan was not read.
- **`ML.4/trace-formula-inputs-register`** (statement, proof steps, sources). Inputs (1)–(4) now each have a status and an owner, read from AGIKMS v3 (pp. 4–5, §0.1, §0.3, §0.4):
  - all unweighted fundamental lemmas are proved;
  - the weighted Lie-algebra lemma is proved only for split groups, and no proof is written of its non-split or non-standard forms;
  - the twisted weighted fundamental lemma is the one open input;
  - the local intertwining relation is proved for quasi-split groups by AGIKMS, by KMSW at their generic scope, and by Ishimoto (his Theorem 4.13) for L-parameters.

  The register also records that Arthur proves the local and global theorems in one induction (AGIKMS §0.1), so the local packets are conditional as well. The source list is corrected: BCGP's match now describes BCGP, and AGIKMS, Arthur §3.2 and Ishimoto are added.
- **`ML.4/local-arthur-packets`** (second hypothesis, one source): the reason the local theorem is conditional (it is proved in the same induction as the global theorems) and the current hypothesis.
- **`ML.4/gsp4-arthur-classification`** (statement, hypotheses, proof steps, four Gee–Taïbi sources). Its changes:
  - it states Gee–Taïbi Theorem 7.4.1 itself;
  - the packet interface: Theorem 3.1.1's packets, and for tempered p-adic parameters Gan–Takeda's L-packets (Theorem 2.8.1), so the packets and rec_GT have one normalisation;
  - the unconditional clause from Proposition 7.3.1.

  The restriction "F totally real; an arbitrary number field needs a separately checked export" is removed, because Gee–Taïbi work over any number field (§2.5, p. 12, and Theorem 7.4.1). Consumers keep BCGP's totally real fields and the F = ℚ of Calegari–Geraghty and Pilloni.
- **`ML.4/gl4-symplectic-descent`** (statement, hypotheses, proof steps, prerequisites, one source). The existence of a globally generic cuspidal descent with matching L-parameters at every place is now stated as unconditional and valid over any number field, by Gan–Takeda Theorem 12.1(iii)(a), (iv). The packet statement (every member automorphic, with multiplicity one) stays conditional. New prerequisites are `ML.4/gan-takeda-llc-gsp4` and `MetaplecticAutomorphicForms:MP.3`. The MP.3 request now also asks for the global theta lift used in Theorem 12.1.
- **`ML.4/self-dual-cuspidal-type`** (statement, one hypothesis, one API statement, prerequisite, one source). The pole definition and the symplectic/orthogonal dichotomy are unconditional; Gee–Taïbi §2.5 is added as the source of the dichotomy. Arthur's Theorem 1.5.3 identification, the API item `selfDualType_iff_transfer`, carries the gate. `ML.5/ckpss-generic-transfer` uses only the pole definition and stays unconditional.
- **`ML.5/grs-descent`** (statement, one hypothesis, prerequisite). For split SO₂ₙ₊₁ the descent and its properties use no trace-formula input. Only its identification as the generic member of Arthur's global packet carries the gate.
- **`ML.4/vogan-packets-so-v`** and **`ML.4/amf-nonsplit-so-v`** (hypotheses, a proof step, Ishimoto sources). Round 1's open check is now settled from Ishimoto (arXiv:2301.12143v2):
  - Theorem 3.14(1) gives the local correspondence with the endoscopic character relations for bounded generic parameters of every inner form of SO₂ₙ₊₁;
  - Theorem 3.12 gives the near-equivalence decomposition for all A-parameters, which is Gan–Ichino's §3.1 input;
  - Theorem 3.14(2), with Theorem* 3.13, gives the multiplicity formula for generic parameters, which is Gan–Ichino's (6.1).

  Mœglin–Renard's construction lacks the local intertwining relation (Ishimoto, p. 2). Both nodes stay conditional through Arthur's quasi-split classification.
- **Gap "Arthur's endoscopic classification is an external conditional input"** (G4 in the reader). Its detail now gives the status of the local intertwining relation for quasi-split groups and for inner forms, and names Chan–Gan as unread. It now also names `gl4-symplectic-descent` and `vogan-packets-so-v`.
- **`restructure`, new entry (Ownership contract 5 in the reader):** the five sub-layers of ML.4. Every node keeps `parentStageId` ML.4 and its id, as the other sub-layer proposals in the atlas do:
  - ML.4:gsp4-local (2 nodes, unconditional);
  - ML.4:classical-arthur (13);
  - ML.4:gsp4-arthur (12);
  - ML.4:real-packets (2);
  - ML.4:xu-packets (2).

  Node prerequisites order them gsp4-local, classical-arthur → gsp4-arthur, real-packets, xu-packets. gsp4-local uses no classification node, and classical-arthur uses no GSp₄ node, so the unconditional sub-layer stays visibly separate. The six planets are unchanged.
- **Sources:** new entry `ishimoto-2024`. The read sections of `agikms-2024`, `gee-taibi-2019` and `gan-takeda-2011` are extended with this round's reading.
- **Reader:** the ML.4 introduction gains a paragraph on the five sub-layers and the status division. The bibliography gains Ishimoto.

### Corrections to round 1

- **Arthur's local packets are conditional.** Round 1's classical-arthur status said that local classifications are unconditional where their sources are local. That holds for Gan–Takeda, but not for Arthur's Theorem 1.5.1. AGIKMS §0.1 (pp. 5–6) explains that Arthur proves the local classification, the intertwining relations and the global classification in one induction, with the stabilised trace formula as its main input. So `local-arthur-packets`, and the local statements of Mok, KMSW and Ishimoto, are conditional exactly as the global ones are.
- **Gee–Taïbi's field.** Round 1's gsp4-arthur text, like the packet, was silent on the field. Gee–Taïbi's classification holds over any number field; the totally real restriction belongs to BCGP's use of it.
- **Descent.** BCGP Theorem 2.9.3's existence part does not need Arthur's classification: Gan–Takeda Theorem 12.1 gives it. Round 1 put all of Theorem 2.9.3 under gsp4-arthur.

### Owner of every item routed to ML.4

The accepted paper routes that send items to ML.4 are listed below with the node that owns each item; "sub-layer" is the proposed sub-layer of that node. Items that the routes send to ML.0, ML.1 or ML.3 are included where the same route names ML.4.

| Paper and route | Item | Owner node | Sub-layer / status |
|---|---|---|---|
| BOXER-CALEGARI-GEE-PILLONI-21, route 8 | /14 rec_GT | ML.4/gan-takeda-llc-gsp4 | gsp4-local; unconditional |
| | /161 Definition 2.3.1, L(ρ), n(π) | ML.0/gsp4-galois-l-packet | gsp4-local; unconditional |
| | /206 discrete, symplectic and general type | ML.4/gsp4-discrete-spectrum-types | gsp4-arthur; definition |
| | /32 Theorem 2.9.3 | ML.4/gl4-symplectic-descent | gsp4-arthur; existence unconditional, packet form conditional |
| | /33 conditional status | ML.4/symplectic-branch-status, ML.0/arthur-dependency-gate | register |
| | /207 Lemma 2.9.1 | ML.4/non-general-type-reducible | gsp4-arthur; conditional |
| | /186 Shahidi's exterior square | ML.4/shahidi-exterior-square | gsp4-arthur (not a classification input) |
| | /200 non-solvable residual modularity | ML.1/non-solvable-residual-modularity | ML.1 |
| | /336 Kim's exterior square | ML.3/kim-sym4 (assigned to ML.1) | ML.1 |
| BOXER-CALEGARI-GEE-PILLONI-25, route 15 | 1.6-arthur-gate | ML.0/arthur-dependency-gate | ML.0 register |
| | 10.4.1, 10.4.2-large-primes | ML.0/regular-weight-serre-implies-abelian-surface-modularity | gsp4-arthur; conditional |
| CALEGARI-GERAGHTY-20, route 15 | ext-arthur-gsp4-classification | ML.4/gsp4-arthur-classification | gsp4-arthur; conditional |
| | ext-mok-archimedean-packet | ML.4/gsp4-archimedean-limit-packets | gsp4-arthur; packet description unconditional, Arthur-packet equality conditional |
| | ext-sorensen-transfer-infinitesimal-character, archimedean-transfer-gsp4-gl4 | ML.4/gsp4-gl4-archimedean-transfer | gsp4-arthur; unconditional |
| | unitary-descent-of-gl4-transfer | ML.4/unitary-descent-of-gl4-transfer | gsp4-arthur; conditional |
| | conj-weight-22-abelian-varieties | ML.0/weight-22-abelian-variety-conjecture | gsp4-arthur; conjectural |
| PILLONI-20, route 14 | arthur-classification-nongeneral-type-reducible | ML.4/non-general-type-reducible | gsp4-arthur; conditional |
| | ext-arthur-classification-gsp4 | ML.4/gsp4-arthur-classification | gsp4-arthur; conditional |
| | ext-bhr-archimedean-L-packet | ML.4/gsp4-archimedean-limit-packets | gsp4-arthur; first assertion unconditional |
| | ext-schmidt-packet-types-with-limit-of-discrete-series | ML.4/limit-discrete-series-packet-types | gsp4-arthur; conditional |
| | remark-5-3-2-expected-newton-above-hodge | ML.0/expected-crystallinity-newton-above-hodge | ML.0; conjectural |
| GAN-SAVIN-23, route 4 | gsp4-llc | ML.4/gan-takeda-llc-gsp4 | gsp4-local; unconditional |
| GAN-ICHINO-18, route 3 | llc-so-inner | ML.4/vogan-packets-so-v | classical-arthur; conditional |
| | lemma-5-1, lemma-5-5 | ML.4/packet-member-irreducibility | classical-arthur |
| | amf-nonsplit | ML.4/amf-nonsplit-so-v | classical-arthur; conditional |
| | selfdual-types | ML.4/self-dual-cuspidal-type | classical-arthur; definition unconditional, Arthur 1.5.3 conditional |
| JIANG-ZHANG-20, route 4 | prop-b-1 | ML.4/generic-packets-standard-modules | classical-arthur; conditional |
| KURINCZUK-SKODLERACK-STEVENS-21, route 4 | 406 extended parameters | ML.4/extended-langlands-parameter | classical-arthur; definition |
| CHENEVIER-TAIBI-20, route 8 | amr18-adams-johnson | ML.4/adams-johnson-packets | real-packets |
| | moeglin-renard | ML.4/moeglin-renard-packets | real-packets |
| ICHINO-PRASANNA-23, route 7 | 101 | ML.4/adams-johnson-packets | real-packets |
| GAN-SAVIN-23-B, route 4 | 67–71 | ML.4/xu-gsp2n-packets | xu-packets; conditional |
| | 72 | ML.4/xu-multiplicity-formula | xu-packets; conditional |

### Outside this job's files (for the maintainer)

- **Paper routes and the atlas stage records.** Round 1 described edits to nine `research/blueprint/papers/PAPER-*.result.json` routes, to BCGP route 4's brief (the GSp₄ Part II) and to `data/atlas.json`. None of these is a deliverable here, and none has been applied: no file on main contains `ML.4:gsp4-local`. With the sub-layer proposal, the route edits become pointers to the owner nodes in the table above. The route `stages` can name ML.4:gsp4-local, ML.4:gsp4-arthur, ML.4:classical-arthur, ML.4:real-packets or ML.4:xu-packets once the maintainer installs the sub-layers. In BCGP route 4's brief, "Gan–Takeda … (ML.4)" becomes `ML.4/gan-takeda-llc-gsp4` (unconditional), and "Arthur's transfer and multiplicities … (ML.4)" becomes `ML.4/gsp4-arthur-classification` and `ML.4/gl4-symplectic-descent` (conditional, except the generic descent).
- **The package.** `research/blueprint/packages/ModularityAndLanglandsExtensions/` (PKG~3, reviewed 17 October 2026) carries the earlier text of these nodes:
  - §3.26 still restricts F to totally real fields, cites no Gee–Taïbi locator and states no packet interface;
  - §3.18 and §3.23 cite Ishimoto only through Gan–Ichino;
  - §3.4, §3.15 and the convention entries "Trace formula and intertwining inputs" and "The classification input for the symplectic branch" lack this round's division into unconditional and conditional exports;
  - the package has no section for BCGP Theorem 2.9.3, so the unconditional generic descent (Gan–Takeda Theorem 12.1) is missing from it.

  Its §3.2 already plans the weighted stabilisation that the packet's register leaves as a gap. These corrections should reach the package before its TauCetiRoadmap pull request; a package fix job is the route.
- **Consumers in other roadmaps.** AutomorphicGaloisRepresentationsPartII AG2.6 (three nodes) and MetaplecticAutomorphicForms MP.3 (three nodes) cite ML.4 as a stage. They use its local normalisation dictionaries and local packets; MP.3's unitary theta node uses the local correspondence for unitary groups, which is conditional through Mok. Both roadmaps are open TauCetiRoadmap pull requests (#1006 and #1063), so any status note belongs there. TorsionCohomologyInfrastructure TC.3 already carries the conditional status.

### Not done, and why

- **Chan–Gan, The local Langlands conjecture for GSp(4) III (J. Number Theory 2015)** was not found in a public version and was not read. The tempered p-adic packet interface therefore cites Gee–Taïbi Theorem 2.8.1, and no status of its own is claimed for it.
- **Gee–Taïbi §3** (local packets for parameters non-trivial on SL₂) was read only for its statement and case division. Whether its arguments avoid the trace formula is not asserted: the node keeps Gee–Taïbi's own disclosure as the status of Theorem 3.1.1 as a whole.
- **Arthur 2013, Mok, KMSW, Xu, Mœglin–Renard and Arancibia–Mœglin–Renard** were not re-read. Their statements are as the packet records them, with the locators its earlier rounds checked.

## /4: definite quaternionic completed cohomology

Handed to `BP-CompletedCohomologyAndLocalGlobalCompatibility` (issue #700), whose instructions already list RT-AREA-langlands-3/4. Round 1's two sub-stage texts (R31.1:definite and R31.4:definite, from Dospinescu–Le Bras §4.1, §5.1 and the §13 appendix) are the design that job should use. No packet is written for that roadmap here.

## Sources read in this round

All were read on 17 October 2026, downloaded to the job's scratch directory and not stored in the repository; hashes are SHA-256.

- **Atobe, Gan, Ichino, Kaletha, Mínguez and Shin**, *Local intertwining relations and co-tempered A-packets of classical groups*, arXiv:2410.13504v3, https://arxiv.org/pdf/2410.13504v3 (7aef4423…, as recorded in the packet). Abstract (p. 1); Introduction (pp. 4–5); §0.1 (pp. 5–6); §0.3 (p. 14); §0.4 (p. 15); table of contents for Main Theorems 1–3.
- **Gee and Taïbi**, *Arthur's multiplicity formula for GSp₄ and restriction to Sp₄*, arXiv:1807.03988v1, https://arxiv.org/pdf/1807.03988v1 (4c77cbb4…, as recorded). §1.1 (pp. 1–3); §2.4–§2.8 (pp. 10–16); Theorem 3.1.1 (p. 16); Proposition 7.3.1 (p. 39); Theorem 7.4.1 and its case division (pp. 39–41).
- **Gan and Takeda**, *The local Langlands conjecture for GSp(4)*, Ann. of Math. 173 (2011), https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf (68cd44f6…, as recorded). §12, Theorem 12.1 and its proof (pp. 1878–1880).
- **Ishimoto**, *The endoscopic classification of representations of non-quasi-split odd special orthogonal groups*, arXiv:2301.12143v2, https://arxiv.org/pdf/2301.12143v2 (76cbb46c32bfa836536717ac22a7caf336474e49cca4dd295796d198fe99aa58). Abstract and Introduction (pp. 1–3, Theorem 1.2); Theorems 3.12–3.14 (pp. 21–22); the opening of §4.9 (p. 33).

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: 0 errors, 0 warnings (142 nodes, six stages planned, none closed).
- A separate cycle check over the packet's node prerequisites: acyclic.
- The reader and the suggested-file manifest were regenerated for the nine changed nodes with a renderer that reproduces the existing sections of every one of them byte for byte; gap G4, request R22, Ownership contract 5, the ML.4 introduction and the bibliography were edited in the same pass.
- `lean-check research/blueprint/suggested/ModularityAndLanglandsExtensions.lean` (shared build, Mathlib 082e2d3): exit 0, 38 `declaration uses sorry` warnings, no errors and no other warnings. The edits are to the manifest comment; no declaration changed.
- `git diff --check`: clean.
