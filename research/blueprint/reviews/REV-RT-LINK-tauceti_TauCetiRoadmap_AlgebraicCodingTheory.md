# REV-RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory

**Complete: the one finding is confirmed, with a narrower fix.** The fixer rewrites one examined note and adds one `requests` entry. It adds **no** link and **no** overlap. The fixer follows the reason in the verdict file, not the red team's fix text.

- **Job:** Refs #4360.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map (ChatGPT Pro `cgp-f522e092da3e`);
  - its review (Codex `codex-c83e7a`);
  - the red team (Codex `codex-rtOQ9t`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review.
- **Disclosure:** this session wrote FIX-RT-AREA-finitefields (PR #4632). That fix touched FiniteFieldsAndCharacterSums FF.4 ownership of coding theory (Singleton, Reed–Solomon, BCH, AG and cyclic codes). This finding and verdict do not touch FF.4, links L08–L09 or overlap O03.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory.review.json).

| Finding | Kind | Severity | Verdict | Scope of fix |
| --- | --- | --- | --- | --- |
| /1 moonshine/Leech handoff | missing | medium | confirmed, narrowed | new examined note for QSeries (result stays `none`) and one request; no overlap, no link |

## Evidence read

- The target link map, with SHA-256 `a568f32f…e2e5`, equal to the red team's input hash. I read:
  - the QSeries examined entry;
  - overlaps ACT-O01 to ACT-O03;
  - requests ACT-R01 to ACT-R05;
  - the review block.
- The red-team result and report.
- The QSeries packet, with SHA-256 `177eaefe…050bc`, also equal to the red team's hash. I read the full moonshine-module gap and the QM.6 nodes that name lattices.
- Line 3823 of the rendered QSeries blueprint README.
- The atlas text of QM.6 and of coding Layers 5 and 6.
- The coding README: introduction, standing conventions, Layers 5 and 6.
- The scope lines of the IntegralLattices README.
- A screen of every atlas roadmap, packet and link map for "Leech", "Golay", "Construction A" and "Mathieu".

No Lean was compiled; the finding does not need it.

## /1: confirmed, narrowed

**The stale note.** The map says:

> Theta/partition and moonshine applications do not state a code-stage input

The QSeries packet's gap for the Frenkel–Lepowsky–Meurman moonshine module lists as consumers `QM.6/monster-head-characters` and `QM.6/monstrous-moonshine-theorem`. It says the construction needs:

> the Leech lattice (no roadmap of the atlas constructs it; AlgebraicCodingTheory Layers 5–6 supply the Golay code and Construction A)

That sentence arrived in #2875 on 24 September. The map had been accepted on 23 September, and the QM.6 atlas stage text still names no coding input. So the map was right when it was reviewed and is stale now. The red team says the same.

**The ownership gap is real.** The Leech lattice is constructed nowhere in the atlas:
- IntegralLattices excludes Niemeier and Leech constructions (README lines 20–21);
- coding excludes rank-24 glue tables and classification;
- every other occurrence of "Leech" is an exclusion line;
- there is no QSeries link map that could carry the handoff.

**The guard is right.** In the coding convention, `P_m(C) = ρ_m⁻¹(C)` carries the form `B_m(x,y) = (Σ x_i y_i)/m`. The vector `2e_i` reduces to 0, so it lies in `P_2(C)` for every binary code, and `B_2(2e_i, 2e_i) = 2`. Since `G₂₄` has minimum weight 8, the only roots of `P_2(G₂₄)` are the 48 vectors `±2e_i`. So `P_2(G₂₄)` is an even unimodular lattice of rank 24 with roots, and it is not the Leech lattice. The Leech lattice needs a further step: pass to the sublattice with coordinate sum ≡ 0 mod 4, then add a glue vector. The existing request ACT-R05 already warns against the identification.

**The cycle test passes, but no edge is authorized.** I added coding Layer 5 → QM.6 and Layer 6 → QM.6 to the atlas stage edges together with every link map's links (4,163 distinct edges). Neither creates a cycle. They are still not authorized: QM.6 consumes the Leech lattice, not Construction A, and the owner of the step in between is missing.

**Corrections to the red team's fix:**
- **No overlap.** Section 10 uses an overlap when the texts leave the direction unsettled. Here the direction is not in doubt. The only evidence is a partial, unreviewed packet gap, not two stage texts. The GN.4 precedent (ACT-O03) is different, because GN.4's own stage text names FF.4.
- **Examined entry.** Keep the QSeries result as `none`. Replace the note: the stage text states no code input; the unreviewed packet gap names coding Layers 5–6 as inputs to an unowned Leech lattice; see the new request.
- **One request, for example ACT-R06.** The owner is QSeriesPartitionsAndMockModularForms. The stages are coding Layers 5 and 6 and QM.6. The status is `unresolved_consumer_contract`. The request records four points:
  - the Leech lattice (rank 24, even, unimodular, rootless) needs an owner, decided by the maintainer under PROTOCOL §15, without expanding IntegralLattices or coding in place;
  - its construction imports the Golay code and Construction A but is not `P_2(G₂₄)`, with a cross-reference to ACT-R05;
  - an edge is added only once that owner and the rational-to-real comparison are fixed;
  - the QSeries packet must be reviewed before such an edge is added.
- **Nothing else changes:** no links, no overlaps, no roadmap README text, no QSeries packet content.

Severity stays medium, at its upper edge. Nothing coding builds changes, but a planned theorem has a prerequisite that no roadmap owns.

## Checks

- `python3 scripts/check_redteam.py` on the result and review: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The ten existing links, three overlaps and five requests were not re-certified beyond what this finding required.
