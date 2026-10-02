# Independent verification of RT-PAPER-DEMARCO-MAVRAKI-YE-26

Verified by Codex, session `codex-J6LwjP`, 2 October 2026, for issue #4201. Repository baseline: `cbdcb4b`. Claim confirmed by the swarm bot after comment [5945644280](https://github.com/CBirkbeck/tauceti-explorer/issues/4201#issuecomment-5945644280).

**26 confirmed, 1 rejected.** Both high findings and all twelve medium findings are confirmed, with the corrected repairs in the machine-readable reasons. Twelve low findings are confirmed; /20 is rejected. The review is of the findings, not an acceptance of the extraction or of an unproved replacement argument. The fix job must read the qualified reasons, particularly /1–2, /6, /9, /12–14 and /26.

## Independence and scope

I did not write the target extraction, its original review, or this red team. My prior work on GHOSH–SARNAK/GAMBURD routing and REV-RT-RS-27 is related coordinator context: their accepted routes and retained scopes are read here as ownership facts, not independently approved again. My YUAN-adjacent Gao–Habegger/Gao–Ge–Kühne work is likewise disclosed. I fetched PR5125's authorship/body: its prior DMY height correction belongs to another Codex session, `codex-rtOQ9t`, not this session.

I read the red team's 27 entries, checked list and report; all 35 current extraction items, five routes, 16 prerequisites and nine sourceIssues; and the extraction/original-review reports and review JSON. I reread WORKERS, PROTOCOL §§15–17 and the upstream/expansion rules. This submission writes only the two authorized verification deliverables.

The published main PDF was read through all 22 pages as text. Formula-critical page images 10, 14, 17 and 18 were also inspected. The arXiv v3 diagonal and zoom passages were compared at pp.15 and 24; this is **not** a complete version-by-version collation. Direct prerequisite readings are recorded below. In particular I checked the cited rigid-repeller criterion, graph pairing, mass and height inequalities rather than accepting the target review's summaries.

## Source evidence

All downloads below were made on 2 October 2026. The SHA256 values identify the actual public bytes inspected. Downloading a paper does not mean its entire proof was read: the final column gives the direct check. McMullen is a scanned author PDF; printed pp.472–473 were read as images. Dujardin's requested v1 URL delivers a file whose internal date is 2018; the hash identifies it without claiming historical identity. The unversioned BD/FG2 URLs similarly identify these downloads, not every historical version.

| Public source | Pages / SHA256 | Direct reading |
|---|---|---|
| [DMY published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9332CDF5976ED22544E3CE98CF126F71/S2050508626100249a.pdf/bounded_geometry_for_pcfspecial_subvarieties.pdf) | 22 / `f828d3f3e08e163d35d4487671a54a4fac752bbecb89fc1bcd8de40bc47b88b3` | Entire text, pp.1–22; selected formula images above |
| [DMY arXiv v3](https://arxiv.org/pdf/2405.17343v3) | 31 / `bb103ede86e058ca2a2601ce9f6a18bb3590f014ee186f6766c198c0eeeb4384` | Diagonal/zoom passages pp.15,24 |
| [DeMarco–Mavraki v2](https://arxiv.org/pdf/2212.13215v2) | 38 / `6e01632178150cdff9d1967acb4652b1861df9a3ae091718cd8d9e5dbc41c5e9` | §4.3 and Proposition 4.8, p.19 |
| [Yuan–Zhang v6](https://arxiv.org/pdf/2105.13587v6) | 231 / `86348af5b6f37c8ff028b4573264c23d9a35bb06e8f0006b08a7ea42e7eb4636` | Theorem 1.3.2 p.12; 4.1.3 p.112; 4.2.3 pp.119–120; 5.3.3 p.170; 5.4.3 p.177; 5.4.4 pp.180–181; 6.1.1 pp.191–192; 6.2.1–2 pp.199–201 |
| [Dujardin public PDF](https://arxiv.org/pdf/1202.3249v1) | 13 / `42dd506d6400c69c609c434e1cc7dca71025e002b3df11815b0be575abde0233` | Introductory theorem pp.1–2 |
| [Gauthier v3](https://arxiv.org/pdf/1810.02385v3) | 28 / `8effc6b764ab1353b5fa66c3f29b1666e07f37de651580b5da82acafe9e07a0a` | Theorem 2.6 statement p.13; rescaling setup/proof pp.15–19 |
| [Ingram v3](https://arxiv.org/pdf/1610.07904v3) | 27 / `c16ae2acce1076ecb8ce8447aa326f3212a73fac3bff45b2983fcd3feae76827` | Theorem 1 and ample-height discussion pp.1–2 |
| [Baker–DeMarco](https://arxiv.org/pdf/1211.0255) | 31 / `777805257450f19e79cb81b40d01e2404341f850de6a2f08fb7b8c9add8c9295` | Theorem 1.1 p.2; Proposition 2.6 and beginning of proof p.12 |
| [DeMarco 2016 published PDF](https://msp.org/ant/2016/10-5/ant-v10-n5-p04-s.pdf) | 29 / `a24d7ee9cac183a7080f3b14c7fa8b5e4a6293fcdeaf6257b5ab43cfbec86f48` | Theorem 6.2, relation conditions and proof, printed pp.1052–1055 |
| [McMullen author PDF](https://people.math.harvard.edu/~ctm/%68ome/text/papers/families/families.pdf) | 27 / `5b16faae90a8306f645cd844b3c4a625a0a22d151f74f48f796a380530cc4751` | Theorem 2.2 and Corollary 2.3, printed pp.472–473 images |
| [Gauthier–Okuyama–Vigny author PDF](https://perso.pages.math.cnrs.fr/users/thomas.gauthier/non-Arch-approx_v3.pdf) | 46 / `d54d2489e040add2870d82f1b2bb4e7b2a37c97ecbe7f52e2ec08ff06816d3d4` | Lemma 6.8 and its proof, pp.30–31 |
| [Favre–Gauthier](https://arxiv.org/pdf/1603.05126) | 37 / `25d6c0c24335d80fc86496aeed1708cf82b38eb5f68bc18cea92de36a48f9d01` | Theorem B p.3; section 5/Theorem 5.1 p.21 |

Fresh web searches for the paper title with “erratum” and “correction” returned the primary [Cambridge article](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/bounded-geometry-for-pcfspecial-subvarieties/9332CDF5976ED22544E3CE98CF126F71) and [arXiv record](https://arxiv.org/abs/2405.17343), without a correction notice in the inspected results. That is a bounded search, not proof no erratum exists. I did not repeat the old extraction's Crossref check. New sourceIssue entries must record the fix worker's actual searches and uniquely allocated ids rather than copy E1–E9's historical search list.

## Libraries and ownership

Freshly verified checkout pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read Mathlib `Mathlib/NumberTheory/Height/NumberField.lean:120–158`, especially the definitions at 137–147. `NumberField.absLogHeight₁` covers algebraic elements in any characteristic-zero field, so Qbar is covered; the P1 convention at infinity must still be stated. I did not compile a Lean adapter or conduct an exhaustive new library-absence audit.

Checked current DY.0–DY.6 stage scopes and the relevant ArithmeticDynamics packet nodes, all its gaps and restructuring proposals; R09.1/R09.2 with accepted RS-27; SF.1 and the promoted geometric-quotients key definition; TB.6; the relevant library-coverage entries; CV.2's draft roadmap and the CV.0-only partial packet; upstream PDE C.12–C.15. Also checked the named YUAN/BT16/DKY items and briefs and the Markoff parent routes and current reviews/queue. BT16's actual file is `PAPER-BAKKER-TSIMERMAN-16`, not BAKKER–KLINGLER–TSIMERMAN. Searched the paper registry and extraction source fields for the named omitted prerequisites; no comprehensive library nonexistence conclusion is drawn from that search.

Fresh `assemble(require_distances=False)` produced **2,956 actual stages, 8,563 directed edges, acyclic**, counting stage edges and dependency-to-stage `requires` edges. The ArithmeticDynamics packet remains partial without an accepted review; the proposed bifurcation/Arakelov Part IIs are not live vertices. Hence /1 identifies a prospective proof/owner loop, not a demonstrated cycle in the current assembled graph. `make_queue.py:463–478,699–740` and `queue.json` confirm the parent-based accepted-route grouping and pending canonical design names.

## Findings and required qualifications

| Findings | Decision | Required disposition |
|---|---|---|
| /1 | Confirmed, high | Separate early critical definitions/analytic rigidity from late equidistribution and uniform endpoints. Deleting one export does not repair the whole supplier chain. |
| /2 | Confirmed, high | The diagonal does not establish DM1 isolatedness. Both nonvanishing and witness need a proof. The global A3 example and off-diagonal replacement are not certified. |
| /3–4 | Confirmed | Commit actual Chow-variety and bifurcation designs; coordinate canonical ids. R09's Chow lemma is different mathematics. |
| /5–6 | Confirmed | Reuse planned PCF/Lattes definitions; separate generic SF.1 GIT from a single chosen dynamics instance owner and the finite family-carrying cover. |
| /7–8 | Confirmed | Record precise density and prerequisite inputs, preserving critical-relation nondegeneracy and existing Ingram supplier status. |
| /9 | Confirmed | The ambient/component height comparison is open. Any surviving conclusion is also conditional on /2, not newly proved here. |
| /10–11 | Confirmed | Record section height/curvature interfaces and exact nef height inequality; coalesce generic YZ theory and retain distinct application consumers. |
| /12 | Confirmed | Coordinate shared psh/current/Bedford–Taylor foundations; draft CV.2 is not an accepted supplier. |
| /13–14 | Confirmed | Same-critical-point basin density and independent-product prerepelling density are unclosed inputs. The proposed recipes are not verified proofs. |
| /15–19 | Confirmed | Repair brief quantifiers, McMullen locator, ample Chow-height convention, positive Ingram comparison and stale planned statuses. |
| /20 | **Rejected** | The unused classification/questions are background; §16 does not mandate a vague statement-only conjecture item. |
| /21–24 | Confirmed | Split applications, synchronize height prose/counts, specify parameter domains/rigid-repeller conditions and individual-potential zoom convergence. |
| /25 | Confirmed | Record generic bounded fiber geometry as a planned/derived R09 input with projective closures and induction, rather than a new missing private theory. |
| /26 | Confirmed | Register genuine slips; qualify norm choice and existing iterate replacement before assigning erratum status. |
| /27 | Confirmed | Propagate nu and its support inclusion consistently; keep the actual slicing/continuity assumptions and unproved witness boundary. |

For /2, the source's first landing germ has dimension k−r−1. If the family incidence allows z in this germ and y0 on a common member, the tuples (z,y0,…,y0) remain simultaneous solutions. A positive-dimensional germ is incompatible with the cited isolated-intersection criterion. This establishes a gap in the extraction's asserted repair, not a counterexample to the published theorem. GOV's positive-mass lemma supplies no missing transversality. In the illustrative line-family calculation, the asserted global A3-to-critically-marked-moduli map needs an independent construction; dimension alone is insufficient.

For /13, parabolic existence/density does not assign its basin to an arbitrarily selected marked critical point. The strengthened local statement needed in the proof must be sourced or proved. This verification does not validate the red team's Montel/renormalization recipe. For /14, neither Dujardin's P1 theorem nor Gauthier's P^k theorem covers the independent product family as cited.

For /18, Ingram's primary theorem excludes **all** Lattes maps. DMY's off-flexible comparison requires the additional fixed-degree rigid-Lattes control. For /21, FG2's algebraic multiplier locus at multiplier 1 includes lower-period root-of-unity phenomena, so an exact-period definition cannot silently replace the entire closed locus. These corrections are in the finding reasons and must survive the fix.

## Validation

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DEMARCO-MAVRAKI-YE-26.review.json` and `python3 research/blueprint/intake.py check-files` pass. A separate correspondence check matches all 27 finding ids exactly, with no duplicates, and verifies severity totals: 2 high + 12 medium + 12 low confirmed, 1 low rejected. `git diff --check` passes; the submission contains only the review JSON and this report. No source/extraction, blueprint, upstream base or queue file is edited.
