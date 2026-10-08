# Independent review of AutomorphicGaloisRepresentations, revision round 2

**Accepted at target level.** Claude (Claude Code), session `claude-5vBTNi`, reviewed revision round 2 on 8 October 2026 for issue #7029. This session wrote neither the plan nor its revision (the revision is by session `claude-sMV3ZX`, the earlier review by `codex-BsbIeh`). The acceptance is of one finished planning pass: all six layers R19.1–R19.6 are planned, none is closed, and every `implementationStatus` stays `unchecked`.

| Item | Result |
| --- | --- |
| Nodes | 66: 21 verified, 45 corrected in place, 0 added, 0 unverifiable |
| Kinds | 13 constructions, 2 definitions, 48 theorems, 3 lemmas |
| API items / unit tests / planets | 90 / 66 (one test added) / 27 (6, 4, 5, 2, 5, 5 by layer) |
| Baseline declarations | 13 read at the pins; all confirmed; none removed or replaced |
| Sources | 26, all public; every recorded SHA-256 reproduced |
| Gaps / supplier requests | 12 (one added, two reworded) / 51 (nine changed in substance; a process label reworded in nine) |
| Source issues | 6: E1–E4 confirmed, E5 and E6 added |
| Handed red-team findings | 11 checked; all handled in the packet |
| Earlier review's requirements | 5 of 5 made |

## Evidence and limits

I read the packet, the reader document and the suggested file in full, the earlier review report, the revision's handoff note, both protocols, the worker and upstream guides, the library audit for the six layers, and the red-team result and review files of the eleven handed findings.

All 26 sources were downloaded from the URLs recorded in the packet and their hashes reproduced. Each node's cited statement was read at its locator, and the proof steps were compared with the source's argument. Scans with a poor text layer (Deligne's Bourbaki exposé, Carayol, Skinner–Wiles, Ribet 1985, Saito 2000) were read on page images. The passages read are listed per source in the packet's `readSections`, in entries dated 2026-10-08.

Three sub-agents made a first pass over the legacy anchors of 53 nodes. Their reports arrived with the same confidence for right and wrong claims, so I re-read the source page for every finding before acting on it; the corrections below are those that survived. The nodes of the revision itself (the global object, the dictionary, Ramanujan and purity, the Hodge–Tate node, irreducibility, the two coefficient-prime theorems) I checked myself throughout.

Not read: Taylor 1989 and 1995, Saito 1997, Kisin 2003, Wintenberger's lifting paper, Blasius–Rogawski, Wiles 1988, Carayol §§7–9 (bad reduction and Drinfeld bases), the desingularisation sections of Scholl, and the published Inventiones text of Khare–Wintenberger II. The packet does not claim them: each is a recorded gap or a supplier request.

## The five requirements of the earlier review

| Requirement | Result |
| --- | --- |
| One global Hilbert object before local theorems are transported | Made. ρ_{π,λ} is defined once by its geometric Frobenius polynomial X² − t_vX + q_vs_v, and the dictionary node converts each source. Clauses (a)–(f) and (h) recomputed and right. Clause (g) was wrong and is corrected (below). |
| Purity outside Saito's geometric scope | Made, through Blasius's theorem and his Proposition 5 and Corollary 7. Read in full; one proof step corrected. |
| Reader synchronised | Made. A field-by-field comparison finds every statement, hypothesis, step, API item, test, prerequisite, request and gap of the packet in the reader (825 of 825 strings) and in the inventory of the suggested file (417 of 417). |
| The R34.6 dependency | Made. The Saito node imports the geometric model and requests the weight statement, with a gap. One further prerequisite on R34.6 was spurious and is removed. |
| Skinner's inputs named | Made. The Hodge–Tate node, the Picard-surface realisation and Wintenberger lifting are named; irreducibility makes no forward use of the coefficient-prime theorem. |

## Corrections in this review

Mathematical corrections:

1. **Skinner–Wiles normalisation** (dictionary clause (g), `R19.2/wiles-ordinary-hilbert-representation`, `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p`). Skinner–Wiles normalise class field theory so that uniformisers correspond to arithmetic Frobenius elements (§2.1, printed p. 9) and let Hecke operators act through g ↦ π(g^{−1}) ((3.1′), printed p. 30). Their representation is therefore σ_λ(π)^∨ = ρ_{π,λ} ⊗ ε_ℓ, not Carayol's σ_λ(π) as the revision said. For an elliptic curve it is V_ℓ(E), as it should be. The acceptance lines of both nodes already had the arithmetic shape, so they needed no change.
2. **Khare–Wintenberger convention.** A clause (j) is added: their ρ_f, with arithmetic polynomial X² − T_vX + N(v)ψ(π_v), is ρ_{π,λ}^∨ (pp. 5, 59–60, 80). The nodes that follow that source now say so, and three of them gained the dictionary as a prerequisite.
3. **Diamond–Flach–Guo's M_g.** Their premotivic structure has geometric polynomial X² − ψ(p)^{−1}a_pX + ψ(p)^{−1}p^{k−1}; it is the realisation of the conjugate form. The roadmap's M_g is its twist by M_{ψ^{−1}}, which is Scholl's M(g) for k ≥ 3. `R19.1/newform-rank-two-realisation` is restated, and five neighbouring nodes adjusted. Without the twist the determinant is wrong for characters of order at least three.
4. **Carayol's Theorem (A) at a special place.** Čebotarev gives equality of semisimplifications only; when the place is the one used for the Shimura curve and π is special there, the argument needs the irreducibility of the global representation. The global object now depends on Theorem (B) alone, so that Theorem (A) may use the irreducibility node without a loop.
5. **Other Carayol nodes.** The determinant argument (5.5: the twist is trivial or the ratio of the two characters); the Picard–Lefschetz statement, whose kernel was written the wrong way round (11.4), with the same fix in the request to its supplier; the local fundamental representation (10.5); the source of the unramified identification (4.6 against 5.6.3); and locators.
6. **CM forms.** The inducing character α has half-integral infinity type and is not algebraic; α′ = α|·|^{−1/2} is. Definition, API and tests are restated with α′, and a test on y² = x³ − x at 5 is added.
7. **Khare–Wintenberger's sign lemma** (`R19.4/quaternionic-sigma-place-local-form`). The source's proof does not determine the unramified character when N(v) ≡ −1 mod p and the residual restriction is a sum of two unramified characters. A hypothesis excluding this case is added, with source issue E6 and a gap.
8. **Ramanujan.** The step for the motivic cases follows Blasius's Proposition 5 (integrality of Frobenius weights and the classification of unitary representations), not good reduction; the twisting step names Grunwald–Wang and asks R17.5 for it.
9. **Smaller points.** The sign of the cyclotomic twist and the location of the pole in the irreducibility node (the latter is the source's own slip, E5); reducibility handled through Jordan–Hölder characters; the Weil-pairing adjointness needed for the Tate-module decomposition; A_f = J₁(11) in an acceptance line; infinity types of classical points in Skinner's family; the residual convention in three R19.6 nodes; the non-reduced cases of the full Hecke algebra; a level-88 computation attributed to Darmon–Diamond–Taylor that is not in their text (it is an instance of their Exercise 1.18 and is now described as such).

Closure and ownership:

10. The λ-adic character of an algebraic Hecke character, and the converse for Hodge–Tate characters, were requested from R01.1 although two existing nodes own them. Seven nodes now import `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, three import `PotentialModularityAndCompatibleSystems:R24.5/character-system`, and the R01.1 request is trimmed.
11. Prerequisites were added on 17 nodes and removed on five, and source anchors added or corrected on 20. One removed prerequisite was spurious: `WeightsInEtaleCohomology:R34.6` on the Eichler–Shimura node closed a stage loop for no mathematical reason.
12. The global-object node gained a `uses` list naming its consumers (R24.5, R22.1, R31.3), which finding langlands-2/2 asked for.

Rule compliance:

13. The reader's section on mistakes in the sources quoted the sources in French and English. It is regenerated from the packet in the roadmap's own words. Short quotations in the packet (in E3, in one request and in one anchor) are removed. A scan for runs of eight words shared with any of the 26 sources now finds only titles and stock phrases.
14. Process remarks ("Independent review interface:", notes on who added what, local file paths in edition lines) are replaced by timeless wording.

The per-node record, with what was checked and what was changed, is the `checked` list of the packet's review object. The earlier review object is kept under `reviewHistory`.

## Baseline and library audit

All 13 declarations were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `ModularForm`, `CuspForm`, `Matrix.card_GL_field`, `Subgroup.exists_right_complement'_of_coprime`, `nonempty_sections_of_finite_inverse_system`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `riemannZeta_residue_one`, `NumberField.Embeddings.finite_of_norm_le`, `TauCeti.LSeries.landau`, `Representation`, `Submodule.restrictScalars`, `DualNumber.eps` and `Matrix.det_fin_two`. Each exists under its name and states what the citing nodes use, with the same or weaker hypotheses. No citation was removed or replaced, and no near miss needed a node.

The reviewed library audit records all six layers as not built. The packet plans nothing the audit shows in the libraries.

## Closure, order and loops

Every target of the six layers is realised by a node or by a precise request. The node-level prerequisite graph of all packets, with this packet in place, has no cycle.

At stage level the plan has loops with later roadmaps, which the atlas build resolves by skipping links. A trial of the build with the corrected packet succeeds and skips six: GH.0 → R19.1, R20.2 → R19.3, R20.6 → R19.5, R20.6 → R19.6, R21.3 → R19.2 and R21.3 → R19.5. Each comes from a request for one statement of a later layer (Kuga–Sato geometry, level lowering, the ordinary Hecke algebra). Nothing is wrong at node level, but the layer order hides these inputs; see the questions below.

## The handed red-team findings

| Finding | Result |
| --- | --- |
| langlands-1/25 | Handled. Three R19.6 nodes import IHG.1 or IHG.4; R19.6 keeps the geometric Hecke-law instance. |
| langlands-2/2 | Handled. The global object covers every cohomological π; Taylor's two papers are a recorded gap; consumers are now named. |
| langlands-2/4 | Handled. Seven nodes import R17.4; the cubic base change node imports `R17.4/nonnormal-cubic-base-change`, and the stronger local statement stays requested. |
| langlands-2/5 | Handled. The fibre statement is corrected and recorded as E1, which I confirmed on the page image. |
| langlands-2/6 | Handled. The node cites Chenevier's Theorem 2.22(i) with Definition 2.19; the supposed descent step is gone. |
| langlands-2/8 | Handled as far as these files reach. R19.1 constructs the Artin representation once; the restructure entry records that ML.1 and R27.6 import it. The link itself belongs to ML.1's plan. |
| langlands-2/9 | Handled. The Eichler–Shimura node imports `R14.6/special-fibre-eichler-shimura` and keeps only the higher-coefficient congruence. |
| langlands-2/10 | Handled. The family node imports R24.5:operations; classical irreducibility imports the purity node of R34.6. |
| langlands-2/14 | Handled. `R19.5/kisin-hilbert-coefficient-prime` plans Kisin's theorem without a discrete-series hypothesis and imports R08.3. |
| padic-2/22 | Handled. R19.5 owns the modular, Kuga–Sato and Shimura-curve applications and imports R06.5 for the general comparison. |

## Mistakes in the sources

| Entry | Verdict |
| --- | --- |
| E1, Deligne, Bourbaki 355, p. 157 | Confirmed on the page image. The effect is on the proof paragraph, not on the proposition; the record is reworded to say so. |
| E2, Khare–Wintenberger II, reference [53] | Confirmed in the authors' final version. The published bibliography was not seen. |
| E3, Diamond–Flach–Guo, pp. 24 and 30 | Confirmed in arXiv v2 against pp. 9, 13 and 27. |
| E4, Skinner 2009, Hodge–Tate degrees | Confirmed on pp. 241, 242 and 251–252. |
| E5, Skinner 2009, Remark p. 256 (new) | A misprint in the variable of the L-function with the pole. Affects nothing. |
| E6, Khare–Wintenberger II, Lemma 7.2 (new) | A gap in the proof, described in correction 7. Scoped to the authors' final version of 30 May 2009. The lemma is not claimed to be false. |

Searches for published errata to the two new entries found none.

## API, tests, suggested file, planets

Each of the 15 definitions and constructions has at least three tests that separate it from a plausible wrong definition, and an API covering construction, characterisation, functoriality and examples. The dictionary's acceptance items check the conventions on 11a1 and on Δ, including the corrected Skinner–Wiles clause. No layer has more than six planets, and each planet is a named object or theorem.

The suggested file mirrors the corrected packet. It gained a prototype for the Skinner–Wiles polynomial with its acceptance example, and a closed arithmetic example for the CM test. It elaborates at the pinned Mathlib with exit status 0; its 29 warnings are all for declared placeholders. Only ten of the packet's 156 API and test names occur in active code; the rest are in the inventory comment, as in other accepted packets.

## Checks

- `python3 scripts/check_blueprint.py` on the packet, with the declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, placeholder warnings only.
- Intake file check on all changed files: no problem.
- Trial atlas build with the packet staged as promotion would stage it: succeeds.
- Field-by-field comparison of packet, reader and inventory: complete.

## Questions for the orchestrator

1. **Stage-level loops.** Six links are skipped at build time (listed above). The packet's restructure entry proposes a sub-layer R19.3b after R19.5 for the strict family and purity. That removes the loops inside the roadmap, not those with R20 and R21. Should R19.5 and R19.6 be split in the same way, or the three statements moved to earlier owners?
2. **Hecke-character node.** Seven nodes of this base roadmap now import a node of its own Part II (AG2.0). The node depends only on Tau Ceti class field theory and Hecke characters. Should a class-field-theory roadmap own it?
3. **Source issue E6.** The gap in Khare–Wintenberger's Lemma 7.2 concerns their modularity lifting argument at places with N(v) ≡ −1 mod p. Consumers in R20, R27 and R31 should be told; I did not decide whether both signs occur in one localisation.
4. **Extended requests.** R17.5 is asked for Grunwald–Wang, R14.2 for the Weil-pairing adjointness of Hecke operators, R14.6 for its conventions when the character has order at least three, and R07.3 for the residual inertia statement that Ribet's large-image theorem uses. Their owners' packets were not edited.
5. **Concurrent writers.** The queue lists fix and fix-review jobs that also write this packet (for the red-team areas langlands-2 and padic-2). Their changes will need merging with this review's.
