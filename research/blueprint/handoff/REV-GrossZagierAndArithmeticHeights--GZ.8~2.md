# REV-GrossZagierAndArithmeticHeights--GZ.8~2 — handoff

Independent review of revision round 2 of the GZ.8–GZ.9 blueprint. Issue #7054, by Claude session `claude-oI96gE`, 2026-10-08/09. **The review is finished.** The verdict is in the packet's `review` object, and the full account is in `research/blueprint/reviews/REV-GrossZagierAndArithmeticHeights--GZ.8~2.md`.

## What was done

- **Nodes.** All 36 nodes were checked against the public sources and the pinned libraries. Every finding was applied in place to the packet, the suggested Lean file and the reader. The reader's node, request, gap and source sections are generated from the packet; its hand-written sections were rewritten to match.
- **Source findings.** E2–E7 were re-checked and confirmed. Eight new findings, E87–E94, were added with verdicts. They are numbered after the sibling GZ.0 packet's E1–E86. One draft finding was withdrawn after a check of the PDF.
- **Supplier citations.** Stage-level requests were replaced by node citations wherever a supplier blueprint now plans the statement: GH.4, ED.4, PHR L1, R18.1, R18.2, R17.3, GZ.3, GZ.4, BSD.2 and MSPL L1. New requests went to PMI L2 and L4, HE.1 and R11.1.
- **Lean.** The suggested file elaborates at Mathlib 082e2d3, with the pinned Tau Ceti f790474 sources of its two Tau Ceti imports inlined. The shared build lacks their compiled modules. `sorry` is the only warning.

## For the orchestrator

1. **GH.1 decomposition node.** `data/decompositions/GeneralizedHeegnerCycles.json`, node GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images, prints BDP's Euler factor with χ̄(p̄) where BDP p.1038 has χ⁻¹(p̄). Its owner should correct it. GZ.9 no longer cites it.
2. **GH.8.** The accepted GeneralizedHeegnerCycles--GH.8 packet duplicates GZ.9's weight-two Abel–Jacobi/logarithm comparisons. In a revision it should import GZ.9/weight-two-abel-jacobi-is-logarithm and GZ.9/isogeny-and-differential-compatibility (restructure entry 4).
3. **Proposed stage edges.** The edges listed in restructure entries 1–2 should be added to the atlas: L3h, GH.4, GH.1, ED.4, Coleman L1, GZ.5, R29.5, DT.3 and BSD.2 into GZ.8/GZ.9, and GZ.8 → GZ.9. The edge ModularSymbolsPadicLFunctions:L2 → GZ.9 should be dropped. None of these closes a cycle.
4. **E89.** Jetchev–Skinner–Wan state that (gen-H) forces root number −1. This can fail when a ramified prime divides N⁺: 11a1 over ℚ(√−11) has root number +1. RankZeroOneBSD packets that use (gen-H) with ramified primes should be checked for this.
5. **Incoming requests and proposals.**
   - BSD.0's Kobayashi p-adic height request, and EffectiveDiophantineMethods' rank/Ш request, are redirected (restructure entry 9).
   - Castella's A′ extension is a new gap.
   - Three Part II proposals remain: Coleman integration (semistable), GL₂ transfer (integral lattices), and Diophantine approximation (abelian p-adic analytic subgroups).
6. **YZZ book.** A cleared copy would allow the projector reduction and the book's L-value conventions to be checked; this is the first gap.

Nothing in this job's scratch space is needed later.
