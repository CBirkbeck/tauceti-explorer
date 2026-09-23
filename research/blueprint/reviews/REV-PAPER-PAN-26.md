# Review of PAPER-PAN-26

**Job** REV-PAPER-PAN-26 (issue #2169) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: accept.** All ten routes accepted; all three `sourceIssues` confirmed; two corrections
made in place; nothing rejected and no item deleted.

Paper: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*,
Annals of Mathematics **203** (2026), no. 1, 121–281,
[doi:10.4007/annals.2026.203.1.3](https://doi.org/10.4007/annals.2026.203.1.3); read in arXiv
[2209.06366](https://arxiv.org/abs/2209.06366) v1.

Reviewed: `research/blueprint/papers/PAPER-PAN-26.result.json` and its report, written by session
`cc-fb70e5`. The machine-readable verdict is `PAPER-PAN-26.review.json` beside the extraction.

## The version

arXiv v1 reproduces the recorded hash,
`0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. The extraction is explicit that
this is the only arXiv version, that the published text is 161 Annals pages against the preprint's
127, that Annals is paywalled within five years, and that every locator is therefore v1's; it
records this as a gap and repeats it in each finding's `searched` field. That is the right handling,
and nothing in the review could improve on it — the published text is not obtainable.

## Locators

273 items and 3 findings is the largest extraction I have reviewed, and its locators are the most
careful. Two features made the check worth doing properly:

- a locator normally carries **both** this paper's reference and the source it quotes, as in
  "Theorem 3.2.2 with its proof, pp. 19-20; deduced from [Pan22, Theorem 4.3.9 and Lemma 5.1.2]" or
  "Proposition 2.2.3, p. 14; quoted from Schneider, *Nonarchimedean functional analysis*, Lemma
  16.9". The numbering inside the brackets belongs to the other paper, and a check that does not
  separate the two produces sixty false alarms;
- several locators name a statement together with its proof across a page break.

Separating the two, **211 of 215 checks land on exactly the page given**. Three of the four
remainders are statements whose label sits at the foot of the preceding page with the statement and
proof on the page cited (Lemma 5.5.11 at the very end of p. 77 with p. 78 cited; Lemma 6.3.3 at the
foot of p. 98 with pp. 99–100 cited). The fourth was a real slip and is corrected below.

## Items, statuses and routes

**No item is `library`,** which is right: nothing in either library touches locally analytic vectors,
completed cohomology or the Hodge–Tate period map. **All six planned items** name layers that exist,
and so do the thirteen distinct planned layer ids used across the items. **All twenty stages** named
by the nine source routes exist in `data/atlas.json`.

**Routing arithmetic.** 267 items are routed — the missing ones, exactly once each — and no planned
item is routed.

**The Part II route follows the maintainer.** `papers.json` fixes it: "a Part II,
`LocallyAnalyticCompletedCohomology` (DESIGN-PAN), of the completed-cohomology roadmap. **Do not
re-route it**". The extraction obeys, with the parent and roadmap id the maintainer's guide records.
Since DESIGN-PAN is still `pending` in `queue.json` and no
`research/blueprint/roadmaps/LocallyAnalyticCompletedCohomology.json` exists yet, the route names no
stages and carries its 206 items to the roadmap id; the reason says exactly that. I checked one
thing the extraction does not mention: `CompletedCohomologyPartII`, which *is* in the atlas, is the
Part II of a different roadmap ("Completed cohomology, homology and arithmetic towers"), so this is
the first Part II of this parent and there is no collision.

**The nine source routes land in layers that own their subject**: `LocallyAnalyticDistributions`
L0–L2 for the functional analysis (L0 is "Banach spaces of locally analytic functions"),
`PerfectoidShimuraVarieties` S3/S5 for the Hodge–Tate period map and the modular tower,
`EndoscopicTransferAndUnitaryTraceComparison` ET.6a/ET.6 for the Drinfeld and Lubin–Tate towers
(ET.6a is the two-tower cohomological realization), `PadicHodgeTheory` R06.1 for the period rings,
`CohomologyComparisons` CP.0/CP.3, `PadicDifferentialEquationsAndRigidCohomology` RD.4 for the rigid
cohomology of Igusa curves, `GL2AutomorphicRepresentationsAndTransfer` R16.3/R17.1/R17.3 (R16.3 is
"Local Langlands for GL₂"), `SmoothRepresentationsOfLocalGroups` SR.2, and
`AlgebraicModularFormsAndSerreWeights` R15.2/R15.5 for Deligne–Serre.

## The three recorded mistakes

All three are printed exactly as quoted.

- **E1** (Theorem 5.3.8, p. 65). The hypothesis introduces a sequence `d_{i,j,k}` and bounds its
  growth; the series asserted to converge is written with `c_{i,j,k}`, which the theorem never
  defines.
- **E2** (Theorem 5.3.17(1), p. 67). The theorem constructs `d̄^{k+1}_Dr`, and part (2) and both
  parts of the "Moreover" list print `Dr`; part (1) alone prints `LT`. The extraction is right that
  this is more than cosmetic: `d̄^{k+1}_LT` is a different operator, constructed in Theorem 5.2.16,
  with a different linearity.
- **E3** (footnote 3, p. 58). "Here we need a compatibility between the Higgs bundle in Liu-Zhu's
  work and the Higgs field constructed … We plan to provide more details in a future work." The
  author flags it himself, and recording it as a gap rather than an error is the right call, since
  the second (conceptual) proof of Theorem 5.2.6 is what depends on it and the first proof does not.

## Two corrections made in place

1. **The Part II title now matches the parent's title exactly.** The route proposed "Completed
   cohomology and p-adic local**-**global compatibility over Q, Part II: …" with a hyphen, while the
   parent's title in `data/atlas.json` — and the maintainer's own guide entry — write
   "local**–**global" with an en dash. Section 16 asks for `<parent title>, Part II: <topic>`, and
   the design job will take this title verbatim, so the prefix now reproduces the parent exactly.
   (The topic half still writes "Hodge-Tate"; the atlas's house style is "Hodge–Tate", but that half
   is free-form and I left it alone.)
2. **Item 553's page.** Its locator said "Theorem 7.3.7 and Remark 7.3.8, p. 123"; both are on
   **p. 124** — p. 123 ends with Remark 7.3.6.

## What this review did not do

- The published Annals text was not obtained; see above.
- The cited theorems, above all Pan's first paper `[Pan22]`, were read only as this paper states
  them; the eighteen prerequisites record them.
- No Lean file was written or compiled, and no library claim was made, there being none.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PAN-26.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
