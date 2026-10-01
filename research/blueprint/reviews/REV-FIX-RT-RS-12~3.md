# REV-FIX-RT-RS-12~3

Independent review of FIX-RT-RS-12~3 (Codex, session `codex-a71f92`, PR #5588), the fix of the three confirmed medium
findings of RT-RS-12~3 on the restructuring proposal RS-12, for issue #5548.

Reviewer: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write the fix. I did verify the red team it fixes:
REV-RT-RS-12~3 (PR #5369), whose verdicts stated the corrections that this fix applies. I wrote none of the proposal,
its earlier reviews or the handoff.

**Verdict: accepted.** All three fixes are right, and `RS-12.result.json` passes `check_restructure.py`. I made no
correction to the proposal. My `review` object replaces REV-RS-12~3's, which is kept verbatim in a new `reviewHistory`.

## What I checked

- **The fix itself.**
  - The full diff of `RS-12.result.json` in PR #5588: the AG2.0, AG2.4 and R19.1 reasons, the AG2.5 keeps, two new
    links and one new owner record. The proposal now has 32 links and 21 owners.
  - The fixes report, and the new section of `handoff/RS-12~3.md` that carries the packet-level obligations.
- **The nodes the instructions name.**
  - In the partial AG2.0 packet: `AG2.0/the-normalization-dictionary-fixed-by-the-sources`,
    `AG2.0/frobenius-polynomial-and-conventions` and the carried `AG2.4/hltt-construction-of-nonselfdual-systems`, with
    their prerequisites.
  - `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`, in the R14.3 packet file, with parent R14.6.
  - The R19.1 node that already lists that node as a prerequisite.
- **The graph.** I applied every accepted restructuring, with this RS-12 in place of the promoted one, to
  `data/atlas.json` using `scripts/restructure.py`. Both new links land, none is skipped, and the stage graph is
  acyclic.

## The findings

- **/1 (normalization migration): fixed.** The AG2.0 reason now requires more than a change of parent:
  - the rec comparison becomes a post-construction output of AG2.5;
  - the instructions remove its input to the HLTT node;
  - that input is replaced by the rec-free `frobenius-polynomial-and-conventions`, whose prerequisites are IHG.3 and the
    Hecke-character node only, plus an ET.6 request.

  AG2.5's keeps say the same.
  - **The projected node edges are acyclic.** AG2.0, AG2.1a, AG2.2 and ET.6 each reach AG2.4, and AG2.4 reaches
    AG2.5. Neither AG2.4 nor AG2.5 reaches ET.6, and AG2.4 does not reach AG2.2.
  - **The ET.7 split still works.** The required split of the base-change clause to AG2.2 stays compatible with HLTT's
    input.
  - **What stays open.** Theorem A's good-prime hypotheses are kept. The packet repair itself is handed to the owning
    AG2.0/AG2.4 checkpoints, as PROTOCOL §17 requires for an unfinished blueprint.
- **/2 (R14.6 → R19.1): fixed.**
  - **The new link and owner.** The link is acyclic. The owner record gives R14.6 the weight-two special-fibre relation,
    separate from R14.3's carrier.
  - **What R19.1 keeps.** The eigenspace deduction, normalization and the higher symmetric-power congruence. No second
    weight-two proof is commissioned.
  - **The handoff's request matches the supplier.** The R14.6 node states (T_p)_* = F + ⟨p⟩_* F^∨ on J_p for p ∤ N,
    which is exactly what the handoff requests.
  - **Not re-checked.** I did not reread the cited Deligne (Bourbaki 355) pages.
- **/3 (IHG.4 → AG2.4): fixed.**
  - **The new link.** It is acyclic and matches IHG.4's existing owner record, whose `formerly` includes AG2.4.
  - **What AG2.4 keeps.** The HLTT congruences at every power of p, the finite-module and continuity checks, and
    descent.
  - **Integrality.** AG2.4 must match HLTT's trace pseudorepresentation to a determinant law on the source's coefficient
    domain. The text states that density alone does not give integrality.
  - **What it leaves out.** The separate factor-separation obligation of RT-AREA-langlands-1/26 is excluded, rightly.

## Checks

- `check_restructure.py research/blueprint/restructure/RS-12.result.json`: ok, before and after the review object.
- **Assembled graph:** both new links present, nothing skipped, acyclic.
- **Not done:** no Lean file is involved, and nothing was compiled.
