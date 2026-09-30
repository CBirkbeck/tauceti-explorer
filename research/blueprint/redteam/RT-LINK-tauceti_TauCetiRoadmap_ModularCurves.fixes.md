# RT-LINK-tauceti_TauCetiRoadmap_ModularCurves: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5030).
- Findings: [`RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.result.json`](RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.result.json).
- Verdicts: [`RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.review.json`](RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.review.json) and the report `research/blueprint/reviews/REV-RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.md`, whose authorized scope this fix follows.
- Base: `76be6c6`. Two findings, both confirmed. Only /1 (medium) is in this job's scope; /2 (low) is noted below and not applied.

The only edited file is the link map `research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json`. As in the Grothendieck/Euler, SemisimpleAlgebras and ClassicalGroups link fixes, the promoted copy in `data/links` is not edited. It was byte-identical to the research file before this fix, and normal independent acceptance and promotion carry the revised packet there. This fix does not edit the generated graph, the Elliptic Curves or Algebraic Curves packets or either roadmap README.

## /1 (medium, missing): Elliptic Curves Layer 1 → 2A and → Layer 10 are recorded nowhere in the atlas

**Rechecked at the base.**
- `review.removed[0]` and `review.removed[1]` still remove EC Layer 1 → MC 2A and EC Layer 1 → MC Layer 10 with the reason "Required equation-level result already exists at the pin; see libraryReuse." `libraryReuse` still holds both pairs (`originalLink` 8 and 10) with their two-sided `preservedEvidence`.
- All four preserved quotations are raw text that occurs exactly once in the current stage description and in the roadmap README:
  - Elliptic Curves README line 442: "base-change compatibility, and \*\*\`deg [n] = n²\`\*\* (AEC III.6.2)";
  - Modular Curves README lines 648–649: "consume the equation-level theorem \`deg [N] = N²\` from\nthe Elliptic Curves roadmap, including its division-polynomial and inseparable cases.";
  - Elliptic Curves README lines 498–499: "\*\*\`Aut (E, O)\` is built here too\*\*, as the units of the endomorphism ring over the field at\n  hand";
  - Modular Curves README lines 2217–2218: "the elliptic-curves\nroadmap's \`Aut(E)\` carrier — the characteristic-\`2\`/\`3\` classification".
- The consumer passages name the supplier: 2A says the Elliptic Curves roadmap "is a Lean dependency" and that `deg [N] = N²` is "owed by that roadmap's Layer 1" (README lines 652–656); Layer 10's dependency list names "the elliptic-curves roadmap's `Aut(E)` carrier" and assigns "the characteristic-`2`/`3` classification and normaliser computations on top of it" to its own item 3. The supplier text does not name Modular Curves. Under the link-job contract ("explicit" when a text names the other roadmap or stage), which the verifier applied, the confidence is `explicit`.
- Pinned Tau Ceti `f790474`, read for this fix:
  - `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.lean` line 79: `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero [W.IsElliptic] {n : ℤ} (hn : n ≠ 0) : (mulByIntIsogenyOfNeZero W hn).degree = n.natAbs ^ 2`, for `W : WeierstrassCurve F` over a field `F`, with no invertibility hypothesis on `n`;
  - `TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean` line 212: `WeierstrassCurve.autGroup`, the stabiliser of `W` in `VariableChange R` over a commutative ring `R`;
  - the same file, line 222: `WeierstrassCurve.autGroupMulEquiv [E.IsElliptic] (hj₀ : E.j ≠ 0) (hj₁₇₂₈ : E.j ≠ 1728) : E.autGroup ≃* Multiplicative (ZMod 2)`. It sits in the file's `Domain` section, so it holds over an integral domain, in particular over a field (the libraryReuse note and the verifier say "over a field", which is correct but narrower). It is the generic-`j` case, not the exceptional classification.
- The in-memory production assembly (`build.assemble(require_distances=False)`) gives 2,840 stages and 8,254 distinct stage edges. The red team's 8,007 is lower because other link packets were promoted since. Neither pair is an edge, and there is no forward or reverse path for either pair through the edges and `requires` entries. The only Elliptic Curves → Modular Curves edge is still EC Layer 2 → MC 2E.

**Changes.**

1. **Two links appended** to `links` (now 45), each with `explicit` confidence and `origin` `restored-from-libraryReuse-by-FIX-RT-LINK-tauceti_TauCetiRoadmap_ModularCurves`:
   - EC Layer 1 → MC `2a-group-homomorphisms-multiplication-maps-and-their-degree`;
   - EC Layer 1 → MC `layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.

   The evidence of each is the `preservedEvidence` of the matching `libraryReuse` entry, copied unchanged. Each reason records the ownership and states the libraryReuse scope, within the verifier's limits:
   - **2A.** EC Layer 1 owns `[n]` as an equation-level isogeny and `deg [n] = n²`; 2A consumes it, including the division-polynomial and inseparable cases. The result is imported now from `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` (hypotheses as above), and 2A does not wait for the rest of EC Layer 1. 2A keeps the scheme/function-field bridge, relative finite local freeness (flatness) and the rank of `E[N]`, which the library theorem does not discharge.
   - **Layer 10.** EC Layer 1 builds `Aut(E, O)`; Layer 10 names that carrier. `WeierstrassCurve.autGroup` and `autGroupMulEquiv` (hypotheses as above) are imported now through Layer 10's scheme/equation comparison, without waiting for an endomorphism-ring presentation. The reason says that the link does not assert that EC Layer 1's identification of the units of `End(E)` with the stabiliser is proved, and that the generic-`j` theorem does not supply the exceptional groups. Layer 10 keeps the characteristic-2 and characteristic-3 automorphism groups, their actions on cyclic subgroup schemes, the normalisers and the orbit computations.

2. **`libraryReuse` kept as the implementation note.** Both entries are unchanged, with two new fields each: `state` (`implementation note; pair restored to links`) and `stateNote`, which says that the review's replacement by library reuse left the pair out of the atlas, that this fix restores it to `links`, and that the entry remains the note for the pinned import.

3. **Summary.** One closing sentence is added: the red-team fix restores the two pairs as explicit ownership links, the pinned results stay library imports, and each link keeps the scheme-level and exceptional work in Modular Curves. The rest is unchanged.

4. **Elliptic Curves `examined` note.** One sentence is appended: the Layer 1 links to 2A and Layer 10, replaced by libraryReuse in review, are carried in `links` again as ownership records with the pinned imports. The other 216 examined entries are unchanged.

5. **Review narrative.** In `review.notes`, after "replaced two already-built supplier edges by pinned library reuse.", a red-team correction is inserted. It says that the removal left EC Layer 1 joined to neither consumer, that a built result is still a prerequisite, that the fix restores both links with the libraryReuse evidence and scope, and that the two `removed` entries are history. It also says that the review's status and date are historical and do not represent a review of this revision, which needs renewed independent acceptance before promotion. `review.status`, `reviewer`, `date`, `removed` and `added` are unchanged. The original reviewer is not credited with reviewing the restored links.

6. **Fix provenance.** A new `redteamFix` object, following the Grothendieck/Euler, SemisimpleAlgebras and ClassicalGroups precedents, records the job, finding, verification file, agent, session, date, base, scope and the validation numbers below.

**Not changed (out of scope).**
- the 43 original links (checked equal field by field);
- the 20 overlaps, `deduplicatedLinks`, `completenessSpotChecks`, `provenance` and `reviewProvenance`;
- both roadmap READMEs, the Elliptic Curves roadmap and `data/links`;
- the generated atlas data.

The verifier's limits are followed: the links do not make Modular Curves wait for the unfinished parts of EC Layer 1, do not claim that the units-of-End/stabiliser comparison is proved, and do not let the generic-`j` `autGroupMulEquiv` stand for the characteristic-2/3 exceptional groups. The scheme-level comparison and the exceptional computations stay explicit Modular Curves work.

## /2 (low, error): four Tau Ceti–only overlaps labelled `rescope` — not applied

Confirmed by the verifier (overlaps 1, 3, 4 and 15, one-based: JacobianChallenge D / MC 2D, MC 7C / EC Layer 1, MC Layer 10 / EC Layer 4, MC 0B / ReductiveGroups Layers 0, 3, 4), at low severity: the label is metadata that no script acts on. This job's issue lists only finding /1 as in scope, so the four `recommendation` values are left as `rescope`. The verifier's fix, for a later edit or the renewed review, is to change exactly those four labels to `keep` and leave their proposals unchanged.

**For the maintainer.**
- The revised packet needs renewed independent acceptance and promotion. The existing review signature does not cover the changed text. The renewed review can also apply the /2 relabelling.
- The same pattern (a built result removed as a link and kept only as a library note) may occur in other link packets; the accepted EffectiveBounds and AlgebraicCurves maps keep such edges, as the verifier notes.

## Validation

- `python3 scripts/check_links.py` on the edited map: 45 links, 20 overlaps, 217 examined; **0 errors, 0 warnings**.
- In memory, merging the edited packet with `merge_links` into the assembled atlas gives **8,254 → 8,256** edges. The two new edges are exactly EC Layer 1 → MC 2A and EC Layer 1 → MC Layer 10. A second merge gives **8,256** again. Both targets' `requires` now contain EC Layer 1, and the merge's own cycle check passes.
- I took the union of the assembled edges, every `requires` entry and the `links` of all 36 research link maps, with the edited map in place of the old one. It has **8,363** distinct pairs (8,361 without the two new pairs) and is **acyclic**.
- `python3 research/blueprint/intake.py check-files` on both deliverables (link map and this report): 0 problems. `git diff --check` passes.
- The edit was applied by one script that asserts these preconditions:
  - 43 links, with neither pair in `links`, and no existing `redteamFix`;
  - the two `libraryReuse` entries and the first two `review.removed` entries on exactly these pairs, with the old reason;
  - the exact anchors in the old summary, the Elliptic Curves examined note and the review notes.

  It checks all four quotations as unique raw substrings of the current stage descriptions and READMEs. It also asserts that every other key is unchanged. The file round-trips exactly through two-space JSON serialisation, so the layout is kept, and the script checks that the result parses to exactly the intended object.

No Lean file is involved; nothing was compiled or built. The graph numbers describe the tested effect of the revised packet, not a promotion performed by this fix.
