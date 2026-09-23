# Review of PAPER-CANNING-LARSON-PAYNE-24

**Job** REV-PAPER-CANNING-LARSON-PAYNE-24 (issue #1363) · **Date** 23 September 2026 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All three routes accepted; the single `sourceIssue`
confirmed; no correction needed.

Paper: Samir Canning, Hannah Larson and Sam Payne, *Extensions of tautological rings and motivic
structures in the cohomology of `M̄_{g,n}`*,
[Forum of Mathematics, Pi **12** (2024), e22](https://doi.org/10.1017/fmp.2024.24), read in the
arXiv v3 source.

## Source

The recorded arXiv e-print hash reproduces byte for byte —
`7828f493e9e3f26f141687381b26e379d8d5f56319351a525d4d34ed6b8bd391` — and the archive contains the
recorded `STEForumPiRevision.tex`, 1506 lines, which I read.

The extraction reads the LaTeX source rather than the typeset PDF, and `source.read` says so along
with the consequence: page numbers are not quoted and statement numbers are the ones the source
produces. That is an honest convention and a checkable one — it is what let me verify the numbering
mechanically below.

## Structure

93 items: 87 missing, 5 planned, 1 library. Three routes — one new roadmap, two source. Every missing
item is routed exactly once, both source stage ids resolve, all five planned ids resolve, and
`check_paper.py` passes. The single library item's three declarations resolve: Mathlib's
`ModularForm` and `CuspForm` in `NumberTheory/ModularForms/Basic.lean`, and `SlashInvariantForm` in
`SlashInvariantForms.lean`.

**The new roadmap is justified**, and the checks support it rather than merely permitting it.
`MotivicStructuresInModuliOfCurves` appears in neither `data/atlas.json` nor
`research/blueprint/roadmaps/` nor `reserved-ids.json`, so the id is free; and a title scan of the
atlas finds no roadmap on moduli of curves or on tautological rings — the only near hits, in
`LefschetzPencilsAndVanishingCycles` and `NeronModelsAndSemistableAbelianVarieties`, are about
semistable curves in unrelated settings. Serre–Tate extensions, the Chow–Künneth generation property,
the tautological ring of `M̄_{g,n}` and the thirteenth and fifteenth homology have no home in the
atlas. Its area `algebraicgeometry` is a galaxy id, and the brief is 547 words.

The five planned items show the imports going the right way, which is what §15 asks for: pure,
polarized and mixed Hodge structures from the Tau Ceti `HodgeStructures` roadmap, weights and purity
from `DeligneWeightsAndPurity:DWP.9`, motives from `MotivesAndAlgebraicCycles:MC.2`, moduli
representability from `AlgebraicModuliForArithmeticGeometry:R09.1`, local cohomology from
`SchemeAndStackFoundations:SF.2` and pointed stable curves from the Tau Ceti `StableReduction` layer.
None of them is replanned here, and route 3 keeps `MC.2`'s own item with `MC.2`.

## Locators, checked mechanically

The paper numbers every environment off one shared counter. The source declares twelve of them —
`thm`, `prop`, `lem`, `cor`, `conj`, `goal`, `deflemma`, `construction`, `definition`, `example`,
`rem`, `question` — all `[thm]`-counted and numbered by section. I rebuilt that counter from the
source and checked every statement reference in the extraction against it:

**84 of the 85 references resolve to a statement of exactly the cited kind and number.** The one that
does not is item 49's `Lemma 10.5`, which its own locator labels "Lemma 10.5 of Canning–Larson" and
which belongs to another paper. No locator error.

(A reconstruction that omits the six less common environments shifts §1 by one and makes every
reference look wrong; that is a trap for a future checker, not a defect here.)

## The single finding

**E1 is confirmed verbatim.** The proof of Theorem 1.5(3) opens

    We now show that $H_k(\Mb_{g,n})$ is tautological for even $k \geq 14$.

while the theorem being proved states `H_k(M̄_{g,n})`, **for even `k ≤ 14`**, for all `g` and `n`,
and the proof's own next-but-one sentence reads "When `g ≥ 3`, in all of these cases **with `k ≤ 14`**
we know that `M_{g,n}` has the CKgP and `A^*(M_{g,n}) = R^*(M_{g,n})`". Conjecture 1.8, which the
introduction describes as open for `k = 16, 18, 20`, is the statement for even `k ≤ 20`. So the
printed inequality is reversed; `≤` is the only reading under which the proof's appeal to the CKgP
table applies, and `affects: nothing` is the right grading. My reconstruction of the counter confirms
the finding's statement numbers: Theorem 1.5 is `thm:taut` and Conjecture 1.8 is `lowk`.

## One provenance gap, not filled

No `libraryPins` are recorded, so there is no commit against which the three library declarations
were checked. I verified them against the index this lane uses and they are there, but have not
invented a pin the extraction did not use. `PAPER-BHATT-MATHEW-23`, `PAPER-WOOD-19` and
`PAPER-HACON-WITASZEK-23`, all reviewed today, have the same gap — four in one day looks systematic
rather than accidental, and may be worth a queue-level fix rather than four separate notes.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
