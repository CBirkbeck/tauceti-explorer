# BP-HabiroCohomologyFoundations--HQ.8~2 — revision handoff

Codex, session `codex-v9a8F6`, issue #6492, 6 October 2026.

The revision pass is **complete**. Coverage of `HabiroCohomologyFoundations:HQ.8`
is **planned**, not closed. The independent review object remains unchanged for
the next reviewer to replace. Every node remains `implementationStatus: unchecked`.

## Changes in this round

- Regenerated the reader from the independently corrected packet, retaining all
  17 node ids and the eight square records. It now states the q-PD/prism ideal
  distinction, the bounded-prism route to AΩ, the two separate décalage squares,
  the filtered quotient by q^{p^α}−1, the ordinary-to-q-Witt map without an inverse
  or restriction maps, the q = 1 torsion sequence, and the gluing obstruction
  without turning it into a no-go theorem. The 17 API items, six unit tests,
  direct prerequisites, source locators, loss ledger and staging rule agree with
  the packet. The six planets are retained.
- Corrected stale fifteen-node/seven-square metadata. Clarified the polynomial
  acceptance witness: multiplication by q−1 is injective on each quotient by
  [n+1]_q. This does not claim the two ideals are comaximal; the reader gives the
  constant-term and cancellation argument.
- The checker rejects a complete packet below its node budget with partial
  stage coverage. To represent the previously missing stage target honestly,
  added two comparison nodes: `compatibility-with-the-theta-de-rham-row` and
  `compatibility-with-the-witt-crystalline-row`. They specify the exact canonical
  composites, hypotheses, coefficient operations and acceptance witnesses.
  Their map equalities remain **unproved target obligations** in the CP.1 gap;
  they are not added to the eight-square commutation theorem. All stage targets
  now have nodes whose prerequisites end in cited objects, supplier requests or
  recorded gaps, which is planned coverage under the protocol.
- Read BS §18 in full and BMS1 Theorem 14.1 with its proof. BS18.2 requires full
  symmetric monoidal functors on p-completely smooth algebras over a perfectoid
  base with Hodge–Tate structure maps. It cannot be applied automatically to
  the subcategory of ℤ-defined lifts or to two arbitrary maps after reduction.
  The proof route and this limitation are explicit. Added requests to AI.4 and
  CR.2 and extended the PR.6/CP.1/CP.6/DD.1 requests to the two targets.
- Recorded E806, an exponent-index misprint in the proof of BS Lemma 18.3,
  checked against Remark 2.13 and the author PDF. The correction preserves the
  induction. E801–E805 and their independent confirmations are retained; E806
  awaits independent review. The published BS text was not obtained, so this
  finding is scoped to arXiv v4 and the author copy.
- Kept the accepted Lean declarations and signatures. Added comments specifying
  the two new targets and why they cannot be faithfully declared at this pin.
  No assumed square or opaque proposition replaces the missing proofs.

## Verification and provenance

Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue and independent review;
checked the reviewed HQ.8 audit and accepted RS-10 ownership. Read the AdicSpaces
and HodgeStructures upstream documents. Checked the stage inputs and touching
links, all existing companion-node references, and the CP.1/CP.6 and CR.2 supplier
scope. CP.1's current packet has no node proving its comparison diagram.

Re-downloaded the seven exact arXiv source archives listed in the packet. All
seven gzip hashes match. Every one of the 68 original node excerpts and all new
node excerpts is a literal passage in those sources. Inspected the cited
statements and proof contexts for the reviewer’s corrections. This does not
claim full rereading of the imported PR.3/PR.6, relative de Rham–Witt or trace
proofs; their reading boundaries remain gaps. The original source metadata and
version distinctions are retained, with the new §18/14.1 reading and author-copy
hash recorded. No source text is committed.

Read all eleven baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Checked the Tau Ceti baseline
`f790474821cf4256814db967cb154e7af3d0c369`, the audit and ownership boundary.
The shared Lean build has exactly the pinned Mathlib; its Tau Ceti checkout is
newer, but this file imports **no Tau Ceti module**. No library was built or
updated.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundations--HQ.8.json`:
  **0 errors, 0 warnings**; complete packet, one planned stage.
- `lean-check research/blueprint/suggested/HabiroCohomologyFoundations--HQ.8.lean`:
  **exit 0**, only three `declaration uses 'sorry'` warnings (the two completion
  unit tests and the torsion-sequence theorem). Final file has 728 lines. The
  advanced comparisons remain owner-supplied category shadows, not formalized
  cohomology theories. Compilation finished with no background Lean process.
- Source-issue and version validation passed; review object unchanged; original
  node ids retained; all implementation statuses unchecked; all API/test names
  present in reader and suggested file. `git diff --check` passed.

Final counts: **19 nodes** (1 definition, 1 lemma, 6 comparisons, 9 theorems,
2 applications); **17 API items, 6 unit tests, 6 planets, 11 baseline
citations, 5 gaps, 14 supplier requests, 6 source issues**.

## What remains and where to resume

A follow-up must close the five recorded gaps, starting with the two CP.1 target
nodes. Compare β's explicit q-PD/Koszul maps with the canonical θ and Witt rows,
including the differential, or verify extension to the full functor domain and
Hodge–Tate structure maps before invoking BS18.2. Import the canonical CR.2
Poincaré map for the W(k)-lift and prove agreement with the cyclotomic/prismatic
maps without inverting the ordinary-to-q-Witt map. Export compatible sheaf maps
and descent to CP.1's proper smooth setting.

The other obligations remain with their named owners: RT.6 must record its
syntomic squares; PR.3/PR.6 must close the imported comparison proofs; HQ.4/CR.4
must check the relative ordinary-to-q-Witt factorization and classical
crystalline inputs; CP/AI must resolve the proper-smooth étale composite and
record its non-conservative base changes. No analytic Habiro comparison or
unconditional integral equivalence is asserted. All details and next source
actions are in `gaps`; the supplier specifications and consumers are in
`requests`.

All reproducible mathematical statements, source versions and resume points are
in the deliverables. The disposable scratch sources, generator and check logs
are removed when the pull request opens; no follow-up depends on those files.
