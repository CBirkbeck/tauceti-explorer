# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20: ninth checkpoint

Claude Code — `cc-d67081`, issue #1420, 2026-09-22. Status: partial.

## Done in this checkpoint

Two things, both small and both additive. **No item was added, removed or
edited**: the items array is byte-identical to the base blob, all 129 ids and
the status counts 27 library / 8 planned / 94 missing are unchanged, and so are
the six routes, the prerequisites, `selectedProofEdges` and every boundary except
`sourceIssueBoundary`. The base blobs on current main were result
`fd80b64ac7b1799e41b301dbdffa81f2f0a76c0a`, report
`7266f7b625b16d7718bb5e7a0914ee612ca77828` and handoff
`84733d337ecf4623065c860e0adeb62f9c224cd6`.

**1. Resume item 3 is closed with a negative result.** The final publisher text
is not reachable from this environment, for a structural rather than a transient
reason, and G0's detail now records the evidence: both Crossref full-text links
(`S0894-0347-2020-00945-6.pdf` and the accepted manuscript `jams945_AM.pdf`)
return HTTP 403 directly and the AMS application shell under a browser user
agent; the DOI resolves to a page whose only article link is `/Account/Login`;
and the AMS metadata records the journal's open-access type as GREEN, i.e.
self-archiving only — JAMS is not in a free-after-N-years programme. The arXiv
listing still shows only v1. **Do not spend another checkpoint on public
retrieval**; it needs an institutional subscription or an author copy.

**2. Three new proposed source issues, E5–E7, against arXiv v1.** arXiv
v1 was read in full, independently of the inherited extraction, and checked on
page images. Almost everything an independent reading finds is already in this
file, which is the main finding and is written out in the new report section:
the √π volume display is E4; the `i ≤ n−2` restriction in the quoted Minkowski
basis property is why `reduced-integral-basis` carries its own statement with the
comparison at `i = n−1`; the loose "length equals the sum of the squares" is
answered by `trace-metric-normalization`; the unreferenced genus-theory step is
`relative-genus-source-claim` with G2; and §7's two silent inputs are already
`degree-one-divisor` and `picard-divisor-comparison`. What is new:

- **E5** (§5.1 p.7): `B ≤ …` and `C ≤ …` are printed without absolute values,
  though A is not and all three take both signs.
- **E6** (Remark 7.2 p.10): the class number formula omits the factor
  `1 − |k|^{-1}`; the residue computation is given in the new report section.
- **E7** (Remark 7.3 p.10): in characteristic 2 the 2-torsion of the Jacobian
  over k̄ is said to "have size 2^g", where it has size at most 2^g.

All three affect nothing. They are located in **arXiv v1 only** — the February
2017 author copy behind E1–E4 and the publisher text were not consulted for them
— and `sourceIssueBoundary` says so. Like E1–E4 they are proposed records, not
reviewed errata.

## Checks

`python3 scripts/check_paper.py` reports ok and `python3
research/blueprint/intake.py check-files` reports 2 files, 0 problems on the
edited result and report. Before and after the edit the item ids and status
counts were compared programmatically (129 → 129, identical), and the items
array was checked to be byte-identical to the base blob, as were `routes`,
`prerequisites`, `summary`, `source`, `selectedProofEdges` and the other
boundaries. The JSON was re-emitted at the file's original two-space indent so
that the diff is 99 insertions and 27 deletions rather than a whole-file
rewrite. No Lean artifact was written or compiled, and no earlier checkpoint's
regression script was rerun; their recorded results stand unchanged. These
checks do not establish mathematical completeness, and this worker did not
review the inherited items, routes, gaps or the proposed issues E1–E4.

One spot check was done in passing and is recorded in the report: the arithmetic
of `feedback-constants` was recomputed independently (β = .27823867,
a = .27843374, c = .11176708, and 1/2 + a = .77843374) and agrees with that
item's test intervals and with the four decimals printed in the paper. That is a
spot check, not a review of the item.

## Resume here

The eighth handoff's list stands, with item 3 replaced:

1. Close a second G7 interface. Three of the four named in the seventh handoff
remain: rectangular evaluation-rank/kernel equivalence; the repeated-Rolle
derivative witness with its factorial bounds; nonzero specialization and degree
bounds. Read actual pinned statements and instantiate their hypotheses, as the
eighth checkpoint does for the Taylor adapter.
2. Instantiate the two suppliers named in the eighth checkpoint's table to finish
BP2's scaled inequality — apply `IsCompact.exists_isMaxOn` to
`fun y => |iteratedDeriv (n+1) f y|` rather than to the derivative itself.
3. **Superseded.** Public acquisition of the final 2019/2020 text has now been
tried twice and fails structurally (see G0). Either obtain an authorized copy
through a subscription, or leave G0 open and keep every locator qualified by its
version. Do not treat a restricted deposit as accessible, and do not equate the
author copy, arXiv v1 and the publisher text.
4. For the graph cover, establish proper Bézout through SF.5, smooth branch
continuation in open strips, and inversion of steep graphs. Do not promote the
weaker 8d³ finite-point cover to the source's stronger O(d²) whole-curve
decomposition.
5. Other substantial gaps remain, unchanged: G1 primitive-prefix generic
interfaces; G2 relative-genus diagnostic/source reconciliation; G3 original
Brumer–Kramer and HV proof interiors; G4 torus/resolvent transfer; G5
hyperelliptic descent and bad-prime/model discriminants; G6 del Pezzo height
normalization and singular fibers; G8 counting originals; G9 q-uniformity,
epsilon, gonality and characteristic-two/inseparability issues. G10 retains
recursive closure and the incomplete source-issue inventory.
6. E1–E7 are proposed issues, not accepted errata. E1–E4 were not reviewed in
this checkpoint; E5–E7 are new here and unreviewed. Preserve source-version
qualifiers: E1–E3 are against the Bombieri–Pila author preprint, E4 against the
February 2017 author copy, E5–E7 against arXiv v1.

Current generic owners stay unchanged: determinant methods imports generic
linear algebra/calculus and SF.5 intersection theory; basis reduction belongs to
GN.5; arithmetic torsion applications extend completed EffectiveBounds. Never
re-plan the inherited library objects. Do not reapply the obsolete guarded patch
and do not overwrite the 129-item result. The complete historical report, source
metadata and verification history must survive the next continuation.
