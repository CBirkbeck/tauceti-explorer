# REV-RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms

**Complete: the one finding is confirmed.** The fixer adds three incoming links to the accepted GEF map and retags the matching `existingLinks` entries. The reason in the verdict file sets the scope. It adds one clause the red team left out: the Quiver 4 → GEF 5 edge is ungraded only.

- **Job:** Refs #4362.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map (ChatGPT Pro `cgp-0d58f52c658d`);
  - its review (Codex `codex-hjdg0j`);
  - the red team (Codex `codex-J6LwjP`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms.review.json).

| Finding | Kind | Severity | Verdict | Scope of fix |
| --- | --- | --- | --- | --- |
| /1 Quiver prerequisites never reach the atlas | missing | medium | confirmed | add three links to the GEF `links` array; retag `existingLinks[0..2]`; correct the coverage narrative; re-review and re-promote |

## Evidence read

- The target link map at main `aee3144d`, with SHA-256 `aba604fd…28ed`. The promoted `data/links` copy is byte-identical. I read:
  - `existingLinks`;
  - `summary`;
  - `reviewFollowUp`;
  - the review block;
  - the list of 15 links, all outgoing.
- The GEF review report, including the line saying the three incoming Quiver pairs "remain hosted in QuiverRepresentations".
- The QuiverRepresentations link map, with SHA-256 `91978785…2568`. Its status is `partial` and it has no review block.
  - Link job #63 is `state:available`, since its claim lapsed on 21 September.
  - Review job #130 is `state:blocked`.
- The full atlas stage descriptions of GEF Layers 4 and 5 and of Quiver Layers 2, 3 and 4.
- `scripts/build.py` lines 69–75 and `merge_links` in `scripts/decompositions.py`.
- The pinned TauCeti `f790474` declarations index. I read `cartanMap` in `CartanMap.lean` and `eulerForm`/`titsPolarForm` in `Quiver/EulerForm.lean`.
- The SemisimpleAlgebras red-team verification, which is the same failure mode for a different pair.

No Lean was compiled; the finding does not need it.

## /1: confirmed

**The gap is real.** Promotion loads only `data/links`. `merge_links` accepts reviewed packets and reads only their `links`. The three pairs are in the GEF map's `existingLinks`, and in the `links` of a partial, unreviewed Quiver packet that has not been promoted. None of that reaches the graph. I ran the production assembler in memory:

- it gives 2,840 stages and 8,007 edges, the same as the red team;
- none of the three pairs is an edge, and there is no forward or reverse path between their endpoints;
- the six SPC/Zigzag hosted pairs are direct edges.

The GEF review's "nine partner pairs are present" meant present in some research file. For the three Quiver pairs, that did not make them part of the atlas.

**The mathematics is right.**

- *Quiver 2 → GEF 4.* K₀(proj A) is the group completion of the monoid of isomorphism classes of finitely generated projectives. Krull–Schmidt makes that monoid free on the indecomposable projectives. GEF 4 names the quiver roadmap as the source of these hypotheses. The simple basis of G₀ is Jordan–Hölder, as the reason says.
- *Quiver 3 → GEF 4.* Quiver uses `C_Q(i,j)=[P_i:S_j]` and GEF uses `[P_j:S_i]`, so the two matrices are transposes. Over a non-splitting field, `dim_k Hom(P_i,M) = dim_k End(S_i)·[M:S_i]`. Check on the quiver 1→2:
  - P₁ has dimension vector (1,1) and P₂ has (0,1);
  - so `C_G=[[1,0],[1,1]]` and `E=[[1,−1],[0,1]]`;
  - so `C_Gᵀ E = I`, that is, χ(P_i,S_j)=δ_ij.
- *Quiver 4 → GEF 5.* For acyclic Q, kQ is hereditary. The categorical Ext-Euler value is therefore `dim Hom − dim Ext¹`, and Ringel's identity gives the comparison. GEF still has to identify categorical Ext¹ with the cokernel of the resolution.

**The edges are substantive.** At the pin, TauCeti has `cartanMap` and the combinatorial `eulerForm`, `titsForm` and `titsPolarForm`. It has no Krull–Schmidt uniqueness and no Hom − Ext¹ identity.

**Challenges to the red team:**
- **Stale Quiver wording.** The Quiver packet's reason for the Quiver 3 pair says "construct the categorical Cartan map". That is stale, since `cartanMap` is already built. The red team's replacement ("identify the matrix of the already existing … map") is right and is the one to use.
- **"Tau Ceti's Ringel form".** GEF 5 speaks of "Tau Ceti's Ringel form", so one could argue that the library form alone suffices. It does not: the comparison needs the homological identity and the length-one resolution, which only Quiver 4 plans. Re-deriving them in GEF would duplicate Quiver 4.
- **Graded case omitted.** The red team did not mention the graded case. GEF 5 also asks for the comparison with the path-length grading, and Quiver 4 is ungraded. The reason must say so.

**Checks on the repair:**
- All six quotations are literal substrings of the current stage descriptions.
- A scratch copy of the map with 18 links passes `check_links.py` with 0 errors and 0 warnings.
- Merging the three links gives 8,010 edges. Merging them a second time also gives 8,010.
- The union of the assembled graph, every research link map, all `requires` entries and the proposals has 8,118 edges and is acyclic.

**Authorized scope:**
1. Add the three `proposedLinks` to the GEF `links` array:
   - keep their sources, targets, `inferred` confidence, evidence and red-team reasons verbatim;
   - do not use the Quiver packet's reasons;
   - add to the Quiver 4 → GEF 5 reason: "Ungraded only; the path-length-graded bigraded comparison and its q = 1 specialization remain GEF Layers 5–6 work."
2. Handle `existingLinks[0..2]` in one of two ways:
   - retag them, so they say the host is a partial, unreviewed research packet and the pair is now carried in `links`; or
   - remove them and record them in provenance.

   The other six entries stay unchanged.
3. Correct the `summary`, `reviewFollowUp` and review narrative: six partner pairs are promoted, and the three Quiver pairs are now GEF links.
4. Get the changed packet independently accepted again and promote it normally.

**Out of scope:**
- the 15 existing links, the overlaps and the requests;
- the roadmap READMEs;
- the Quiver packet;
- any graded Quiver→GEF edge;
- manual edits to the generated graph.

If a reviewed Quiver packet is promoted first, the fix is still harmless, because `merge_links` deduplicates ordered pairs.

## Checks

- `python3 scripts/check_redteam.py` on the review file: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The 15 links, five overlaps and three requests were not re-certified beyond what this finding required.
