# Grothendieck/Euler link fix

Completed for issue #5036 by Codex, session `codex-J6LwjP`, on 2026-09-30.
Base: `182ee99`. The single confirmed finding,
`RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms/1`, is fixed in the
research link packet. Its normal independent acceptance and promotion must
carry the revised packet into `data/links`; this submission does not manually
edit promoted data or the generated graph.

The fix follows the [red-team result](RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms.result.json)
and the [independent verifier's scope](RT-LINK-tauceti_TauCetiRoadmap_GrothendieckEulerForms.review.json).
It adds exactly the three confirmed `proposedLinks`, preserving their endpoint
IDs, `inferred` confidence and literal two-sided evidence:

| Supplier | Consumer | Contract |
| --- | --- | --- |
| QuiverRepresentations Layer 2 | GrothendieckEulerForms Layer 4 | Krull–Schmidt existence/uniqueness for the indecomposable-projective basis of split K₀. The simple basis is separately supplied by finite-length theory. |
| QuiverRepresentations Layer 3 | GrothendieckEulerForms Layer 4 | Projective covers and composition multiplicities identify the matrix of the existing Cartan map; `C_G = C_Qᵀ`, retaining division-endomorphism factors over a general field. |
| QuiverRepresentations Layer 4 | GrothendieckEulerForms Layer 5 | The ungraded length-one resolution and Ringel Hom-minus-Ext¹ identity for finite acyclic quivers. GEF supplies comparison with categorical Ext. |

The third reason includes the verifier's exact boundary: “Ungraded only;
the path-length-graded bigraded comparison and its q = 1 specialization
remain GEF Layers 5–6 work.” The stale partner-packet instruction to construct
the categorical Cartan map is not copied: that map already exists at the pin.

The first three `existingLinks` entries now say that their former host was
research-only and that the contracts are carried in this packet's `links`.
They retain their original `recordedIn` provenance. Summary, `reviewFollowUp`
and review narrative distinguish these three from the six genuinely promoted
SPC/Zigzag pairs. The original review date and status remain historical;
the edited narrative does not attribute a fresh review of this revision to
the former reviewer. `reviewValidation` is explicitly historical, and the
new `redteamFix` record identifies the finding, verifier, base and current
validation. The original fifteen links, five active overlaps, requests,
retired overlap, examined inventory and other six hosted entries are unchanged.

The promotion gap still exists at this base. The Quiver research packet is
partial and has no accepted review or `data/links` counterpart. The promoted
GEF packet has fifteen links. `build.assemble(require_distances=False)` gives
2,840 stages and 8,249 distinct stage edges. None of the three new pairs has a
direct edge, forward path or reverse path. All six other hosted pairs are
direct edges. Inspection of `scripts/build.py` and `merge_links` confirms that
only promoted packets' `links` arrays reach this graph; `existingLinks` is
metadata. No other roadmap needs to be promoted to fix these three contracts.

Read all five endpoint descriptions in full: Quiver Layers 2–4 and GEF
Layers 4–5. Rechecked the reviewed library coverage for GEF Layers 4–5 and the
relevant actual declarations at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `TauCeti.cartanMap`, in `Algebra/Category/ModuleCat/CartanMap.lean`, is
  already defined over an arbitrary ring, from finite projectives to finite
  modules. This link supplies its basis/matrix comparison.
- `TauCeti.eulerForm`, in `RepresentationTheory/Quiver/EulerForm.lean`,
  supplies the combinatorial form. The projective specialization
  `eulerForm_dimVector_indecProjRep_eq_finrank_hom` in
  `Representation/Projective/EulerForm.lean` is already built; it is not
  the general Hom-minus-Ext¹ identity required by this edge.

As a convention check for `1 → 2`,
`C_G = [[1,0],[1,1]]` and `E = [[1,-1],[0,1]]` give `C_Gᵀ E = I`.
This reproduces the projective/simple evaluation and guards the transpose.
No claim is made that an entire layer is implemented or that this small
matrix calculation proves the general comparison.

Validation completed:

- `check_links.py`: 18 links, five active overlaps, 217 historical examined
  roadmaps; **0 errors, 0 warnings**.
- All six added quotations are literal substrings of current endpoint stage
  descriptions; the new source/target/confidence/evidence fields equal the
  independently confirmed proposals.
- In-memory production assembly and `merge_links`: **8,249 → 8,252** distinct
  edges, with exactly the three expected pairs added. Repeating the merge
  gives **8,252** again. Its cycle check passes.
- Adding every research link packet and every assembled `requires` edge
  yields **8,360** distinct pairs and remains acyclic.
- Structural comparisons verify that the fifteen original links and all
  out-of-scope packet sections listed above are unchanged.
- `intake.py check-files` passes for the two deliverables; JSON parses;
  `git diff --cached --check` passes.

No Lean file was required or compiled, and no build/cache/LSP was started.
The assembly checks run the Python atlas functions in memory and write no
atlas or promotion artifacts. The revised research packet is ready for the
normal review/promotion workflow; the graph measurements describe its tested
effect, not a promotion already performed by this worker.
