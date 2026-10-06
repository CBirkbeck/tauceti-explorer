# Handoff — BP-RelativeFarguesFontaine--RF4 (issue #986)

Agent: Claude (Claude Code), session `claude-QXE3hL`, 6 October 2026. Branch `claude-QXE3hL-bp-rf4`.
This run continues the checkpoint of `cc-7b31c4` (PR #2859) and finishes the pass.

## Deliverables

- `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` — `"status": "complete"`, `"part": "RF4"`.
  22 nodes (4 definitions, 2 constructions, 15 theorems, 1 comparison), 57 API items, 25 unit tests,
  7 planets, 32 baseline declarations, 1 gap, 2 requests, 3 structural notes, `sourceIssues: []`.
- `research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` — about 22,000 words. Its per-node sections are
  generated from the packet, so the two agree.
- `research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean` — 944 lines,
  SHA-256 `d97fb791a5453d5e7e6c94e428e184486f6fa461361dc1c7da1e8749a0492253`.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF4.json` with the
  pinned declaration index: **0 errors, 0 warnings**. Every one of the 32 baseline declarations is in the
  index, and its statement was read in its source file at Mathlib 082e2d3 or Tau Ceti f790474.
- Stage-level acyclicity: every cross-roadmap prerequisite was lifted to a stage edge and added to the atlas
  `stageEdges` together with RS-20's links. **No cycle.** The new edges are AdicSpacesPartII R3/R5, VB1,
  VB2:ampleness, DiamondsAndVStacks D2/D4, PadicHodgeTheory R06.1 and RF0:integral-Y, RF1, RF3, all into RF4.
- **The suggested Lean file was compiled.** `lean-check` (`lake env lean` in the shared build, Mathlib 082e2d3)
  ran on 6 October 2026: exit code 0, no errors, and the only warnings are 24 `declaration uses 'sorry'`. The
  file imports Mathlib only.
- A script checked that every API name, unit-test name and suggested theorem name of the packet occurs in the
  Lean file. None is missing.

## What changed from the checkpoint, and why

**RS-20 is accepted** (1 October 2026, `independent-review-REV-FIX-RT-RS-20~3`) and binds this job.

- RF4:vector-bundles is *keep*: the linear Beauville–Laszlo theorem on the actual rings, with exactness,
  tensor/dual, coefficient and divisor-change compatibility, disjoint and colliding legs, and effectivity.
- RF4:G-torsors is *narrow*: "Apply BG0's already proved equivalence … Do not reconstruct the general
  three-description equivalence." Its owners record makes BG0 the owner, "formerly RF4:G-torsors". So the
  checkpoint's nodes `three-notions-of-G-torsor` (definition) and `three-descriptions-of-G-torsors` (theorem)
  were **withdrawn**. Their content, the Scholze–Weinstein 19.5 locators the previous worker read, now sits with
  `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions` and the BG0 request.
- RS-20's nodeReconciliation for `meromorphic-modification-at-a-divisor` asks that its G-valued and Grassmannian
  prose become a later composite. The node keeps its id but is now the **linear** lattice theorem. The G-version
  is `RF4:G-torsors/tannakian-transfer-of-gluing`, and the Grassmannian side is GS0's.
- `v-descent-and-local-triviality` keeps its id and its source hypotheses. The Hck and Gr quotient presentations
  were removed from its statement: they are GS0:loop-geometry's.
- `beauville-laszlo-module-gluing` keeps its id. It is now a theorem, and **its proof has been read**: Stacks
  project Section 15.92 (tag 0BNI) proves Beauville–Laszlo for non-noetherian rings in full. This closes the
  checkpoint's open item "only the statement of SW20 Lemma 5.2.9 was read". Kedlaya–Liu Remark 2.7.9 gives a
  second proof.
- **[GR03, Proposition 5.4.21] is now matched.** In Gabber–Ramero arXiv v3, Proposition 5.4.21 is the henselian
  approximation theorem: for a henselian pair `(R, tI)` and `X` smooth quasi-projective over `R[1/t]`, `X(R[1/t])`
  is dense in `X(R^[1/t])`. That is exactly what Fargues–Scholze need to make torsors trivial étale-locally. The
  other half of their step, "triviality modulo `I_S` implies triviality", is in Mathlib as
  `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`. The published LNM numbering was not checked;
  this is listed under `remaining`.
- The checkpoint's nine gaps were roadmap-wide and are carried by the RF0 part's packet. The one about three
  notions of torsor was superseded by RS-20, and the GR03 and Beauville–Laszlo items are resolved. One new gap
  remains (below).
- The checkpoint's restructure proposal ("say which Tannakian statement RF4 owns") was resolved by RS-20 and
  removed.

## What the pass plans

- **Algebra.** Exact squares and glueing data (KL 1.3.7); finite projective and finite étale glueing (KL
  1.3.8–1.3.10). Glueing pairs and glueable modules (Stacks 15.92). The Beauville–Laszlo theorem (SW20 5.2.9,
  KL 1.3.6, Stacks 15.92.16–15.92.19).
- **The curve.**
  - Modifications at a relative Cartier divisor of any degree.
  - The lattice theorem, which is the stage's gluing functor, fully faithful and essentially surjective
    (SW20 19.1.2 and 14.1.1, HK 4.3, FS VI.1).
  - Exact tensor, base-change and coefficient-change compatibility (CS17 3.5.1).
  - Disjoint, colliding and locally finite families of legs (FS VI.1.2, SW20 12.4.6, FF 5.3.1).
- **The schematic curve.** Kedlaya–Liu 8.9.3–8.9.6: the affine complement of the untilt divisor, `B_e(A)`,
  `B^+_dR(A)`, `B_dR(A)`, B-pair cohomology, and bundles as relative B-pairs, with CS17 3.5.1 and FF 5.3.2–5.3.3.
- **Exports to Fargues' theorem.** `lattices-and-modifications-of-trivial-bundles` (SW20 12.4.6 and 14.1.1
  (2)⇔(3)) and `kedlaya-algebraicity-of-punctured-bundles` (Kedlaya 3.8–3.9, SW20 14.2.1).
- **G-torsors.** Six theorems and constructions beside the G-modification definition:
  - G-modifications (FS III.3);
  - the Tannakian transfer with effectivity (SW20 19.1.2, CS17 3.5.2);
  - the faithful-representation criterion (Deligne–Milne 2.20);
  - change of structure group (DM 2.21);
  - base change and addition of legs;
  - v-descent and étale-local triviality (SW20 19.5.3, FS VI.1.7, GR03 5.4.21);
  - the modification of a G-bundle by a lattice (HK 4.3), exported to GS0, BG2, HS0 and HS2.

All three stages are `planned`. None is `closed`, because a gap and two requests remain.

## How the red-team finding is handled

**RT-AREA-padic-1/19** (medium, confirmed): the edge RF4:vector-bundles → AI.2 serves only essential
surjectivity. I read BMS1 Remark 4.29 at its locator. It says full faithfulness "is easy to prove directly"
without the curve.

- The two exports to AI.2 are marked in their hypotheses as essential-surjectivity inputs only.
- Structural note 1 proposes the retargeting that the fix report specifies: split AI.2 and move the link to
  `AInfCohomology:AI.2:essential-surjectivity`.
- No node here depends on AI.2.

## Sources the maintainer added

Two of the issue's sources fall in this part's stages.

- **Kedlaya–Liu §8.9**, items 336–341. Lemma 8.9.3, Definition 8.9.4 and Theorem 8.9.6(a)–(c) are nodes.
  Conjecture 8.8.20 is recorded in the reader as a conjecture, not a target, with the known mistakes E78 and E79.
  Items 17–21 (§1.3) are also planned here, as the extraction routed them.
- **Guo–Reinecke**, item 129. Kedlaya's algebraicity is the node `kedlaya-algebraicity-of-punctured-bundles`.
  - The **φ-module freeness** parts of item 129 are not planned here: Ivanov Theorem 6.1, and Kedlaya–Liu
    Proposition 3.2.13 and Lemma 3.2.6 (extraction items /124 and /129, both "missing"). They are statements
    about Frobenius modules over perfect rings and over arc-local products of valuation rings, not about
    patching. Structural note 2 proposes routing them to the owner of KL §3.2 or to the Guo–Reinecke Part II.
  - Note that the RT-AREA-padic-1 fix report suggested the opposite split: algebraicity to a new
    RF0:crystalline-end, and the freeness parts to RF4. That stage does not exist yet, and the accepted
    Guo–Reinecke route names RF4:vector-bundles. Structural note 2 explains the choice and how to avoid
    planning anything twice.

The issue's other sources (Zhu, Bhatt–Scholze 17, Fargues–Scholze, Scholze–Weinstein 13.1.1,
Fargues–Fontaine §1.2 and Kedlaya–Liu §§3, 5) are for RF0–RF2 and belong to `BP-RelativeFarguesFontaine--RF0`.

## Requests

1. **`BunGAndNewtonStrata:BG0`** must supply three things:
   - the scheme-theoretic three descriptions (SW20 19.5.1, Broshi) for torsors over `Spec B^+_{Div^d}(S)`;
   - the O_E-integral adic version (SW20 19.5.2 with FS's footnote);
   - faithful-representation independence and extension of structure group, as BG0's stage text promises.

   Also: BG0's node `g-torsors-three-descriptions` lists RF4:G-torsors and RF4:vector-bundles as prerequisites.
   RS-20 forbids that direction, so the next BG0 revision should drop them. **This is the only cross-packet cycle
   risk found.**
2. **`DiamondsAndVStacks:D2`** must supply v-descent of vector bundles on perfectoid spaces (SW20 17.1.8).

## Gap

**The crystalline end of `Spa W(R^+)` has no owning layer** (RT-AREA-padic-1/18). Kedlaya's algebraicity uses
charts that meet `[x] = 0`. RF0:integral-Y removes that locus, and the proposed RF0:crystalline-end does not
exist yet. The node therefore carries the chart construction in its proof steps.

When the stage exists:

- make it a prerequisite of the node;
- add the stage edge RF0:crystalline-end → RF4:vector-bundles. It is acyclic.

## Sources read in this run, all on 2026-10-06, with hashes

The SW20 Berkeley lectures, Fargues–Scholze (author PDF), Kedlaya–Liu (arXiv v5), Gabber–Ramero (arXiv v3),
BMS1 (arXiv v3) and Fargues–Fontaine (`courbe.pdf`) all reproduce the hashes recorded in earlier packets. New
sources:

- Stacks project 15.92, 15.9.14 and 15.11.4;
- Caraiani–Scholze, arXiv v1;
- Howe–Klevdal, arXiv v2;
- Kedlaya, *Some ring-theoretic properties of A_inf*, arXiv v5;
- Guo–Reinecke, arXiv v3;
- Deligne–Milne, *Tannakian categories*, 2018 revision.

Locators are in each node, and read sections in `sources`.

**Not read:**

- the published Asterisque and LNM texts, so the GR03 numbering is open;
- Broshi's paper (SW20 19.5.1 is cited through BG0);
- Ivanov's paper.

## Where to resume

The packet is complete and goes to its independent review. A reviewer should check, in this order:

1. the Stacks 15.92 proof outline against `beauville-laszlo-module-gluing`;
2. the local proof of `meromorphic-modification-at-a-divisor`, including the inclusions
   `ξ^k M' ⊆ M ⊆ ξ^{-k} M'` deduced from Beauville–Laszlo exactness;
3. the GR03 5.4.21 match in `v-descent-and-local-triviality`;
4. structural note 2, on Kedlaya's algebraicity versus RF0:crystalline-end.

The follow-up work is the gap and the two requests above.
