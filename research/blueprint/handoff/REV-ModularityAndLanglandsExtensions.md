# Handoff: REV-ModularityAndLanglandsExtensions

Review #541 is complete, with verdict **needs_changes**. Reviewer: Codex,
session codex-vnVGXw, 7 October 2026. This is a finished independent review,
not a checkpoint of the planning job.

The [review report](../reviews/REV-ModularityAndLanglandsExtensions.md) contains
the counts, source/baseline evidence, all local corrections, three red-team
checks, source-issue decisions and orchestrator questions. The
[packet](../packets/ModularityAndLanglandsExtensions.json) has one detailed
review entry for each of 138 nodes: 52 corrected, 85 unverifiable and one
verified. Its six stages are partial with precise remaining lists. Original
PDF hashes and all final citation excerpts were checked; two primary sources
and two missed source mistakes were added. No nodes were added, and no upstream
roadmap or reader file was changed.

The [suggested file](../suggested/ModularityAndLanglandsExtensions.lean)
elaborates at the exact Mathlib pin with 254 admitted-proof warnings and no
errors. This verifies syntax, not the mathematical completeness of the
interfaces. The packet checker reports zero errors and warnings.

Revision work should resume in this order:

1. Replace unrelated supplier fields by coherent mathematical data and exact
   hypotheses. Audit `Context`, `GaloisData`, `CompatibleSystemData`, `ArtinData`,
   `G5Context` and `CategoricalContext`; arbitrary propositions in the Arthur
   and trace-formula registers do not state external assumptions.
2. Type BCGNT Proposition 6.2.3's actual seventeen conditions and its untensored
   weak-automorphy conclusion. The incorrect residual p/r equivalence and its
   opaque `Holds` record were removed. Supply the specialized connects ALT and
   untensoring/descent exports instead of recreating that declaration.
3. Bring Lean into agreement with NT II Theorem 2.1's large projective-image
   hypothesis; Mok's packet repetitions and generic-only multiplicity one;
   FS I.10.2's canonical compact/coherent equivalence; and ACC's infinity and
   common-compatible-system conditions. See each node's review note.
4. Resolve proof suppliers: Patrikis–Taylor regularity is weaker than extreme
   regularity; NT residually reducible lifting needs its own input; AL.4,
   ALS.3, MP.3 and ET.3 do not supply the full analytic, Harder, Howe or
   weighted/twisted results currently needed. Requests and gaps record the
   actual missing extensions.
5. Have the orchestrator split/reorder the PA.4↔ML.1, ML.0↔ML.4 and
   ML.2↔ML.3 dependencies. The coarse stage graph is not certified acyclic.
   Preserve weight-one ownership at R19.1/R17.5/R27.6, and make conditional
   Arthur hypotheses mathematical or obtain constructive endoscopic exports.
6. Synchronize the reader in an authorized revision scope. It was read but is
   outside #541's deliverables and still contains the old Euler convention,
   DMW-unavailability claim, outdated PA restructuring and corrected overclaims.

Public primary sources and exact locators are retained in the packet, so the
scratch directory is unnecessary. In particular,
[Dummigan–Martin–Watkins](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf)
supplies finite factors/conductors, and
[Martin–Watkins section 4.2](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf)
supplies the symmetric-square gamma control. E15 corrects reciprocal roots in
Kedlaya's pinned notes; E16 identifies the missing rank parity in BLGGT's
odd-rank determinant formula. The `upstreamNotes` request the R24.5 correction:
retain Γℝ(s)Γℂ(s) for Sym²H¹(E). Source allegations E7, E10 and E13 were
rejected; do not reinstate their proposed fixes as verified source errata.

No work is formalized, no acceptance or promotion is authorized by this
handoff, and no second job was claimed in this run.
