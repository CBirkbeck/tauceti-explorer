# Review of PAPER-CESNAVICIUS-21

**Job** REV-PAPER-CESNAVICIUS-21 (issue #2185) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: accept.** All three routes accepted; all three `sourceIssues` confirmed; one item split, two route
reasons sharpened, nothing rejected or deleted.

Paper: Kęstutis Česnavičius, *Macaulayfication of Noetherian schemes*,
[Duke Math. J. **170** (2021), no. 7, 1419–1455](https://doi.org/10.1215/00127094-2020-0063);
arXiv [1810.04493](https://arxiv.org/abs/1810.04493).

Reviewed: `research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json` and its report. The machine-readable
verdict is `PAPER-CESNAVICIUS-21.review.json` beside the extraction.

## What I read

Both files the extraction names, and I reproduced both hashes it records:

- the author's copy of the published version,
  `https://webusers.imj-prg.fr/~kestutis.cesnavicius/macaulayfication.pdf`, sha256
  `55ded201a17ae161400c1989d67ad7a09356c23f87b2e88eef2e763632939ac6`;
- arXiv v2, PDF sha256 `a07d62e6ef1e4c2126c172426391e97031d28006b92ccb6c5f3afd9c2ddb07b9`, together with its
  LaTeX e-print.

## Items and statuses

**Numbering, checked independently.** I re-derived the paper's numbering from the LaTeX and then verified the
statements that the extraction's locators and findings depend on directly in the text of **both** PDFs:
Conjecture 1.1, Example 1.3, Corollary 1.8, Remark 1.9, Corollary 1.10, Corollary 1.11, Lemma 2.11,
Proposition 3.11, Theorem 3.14, Theorem 5.3, Proposition 5.5. They agree, and neither version has a Corollary
1.12 — so the extraction's claim that the published and arXiv numberings coincide is right, and the locators
point where they say.

**Declarations, opened at the pin.** All seven cited Mathlib declarations exist at `082e2d3` and provide what
is claimed: `RingTheory.Sequence.IsRegular` and `IsWeaklyRegular` (`Mathlib/RingTheory/Regular/RegularSequence.lean`),
`IsWeaklyRegular.of_flat` (`Regular/Flat.lean`), and the four `localCohomology` declarations
(`Mathlib/Algebra/Homology/LocalCohomology.lean`). The item on regular sequences also claims stability under
localisation, and `IsWeaklyRegular.of_isLocalization` and `of_isLocalizedModule` are there.

**One status corrected.** Item 38 was `library`, but its name and statement were *"Local cohomology **and its
Čech and spectral-sequence calculus**"*, and the pinned Mathlib has no such calculus: the module docstring of
`LocalCohomology.lean` lists under **"## Future work"** the equivalence with the right-derived functor
definition, the Koszul characterisation, **the Čech characterisation** and **the long exact sequences**. The
extraction knew this — the item's note says so and the Part II brief schedules these as additions — so this
was bookkeeping rather than a false claim, but the parts of the item that §3 actually uses were carried only
in prose. I split it:

- **38** stays `library`: the local-cohomology functor as the colimit of `Ext` over ideal powers, its
  dependence only on the radical, and the cofinal-diagram comparison.
- **38a** is new and `missing`: the Čech computation and the vanishing above the number of generators,
  `H^0_{(r)} = 0` for a nonzerodivisor with `H^1_{(r)}(M) = colim_m M/r^mM`, and the composition spectral
  sequence `H^j_𝔞(H^{j'}_𝔟(M)) ⇒ H^{j+j'}_{𝔞+𝔟}(M)`. Routed to route 2, which is where the rest of §3's local
  cohomology goes.

**Coverage.** The 61 inherited items run through §§1–5 in the paper's own order and reach Proposition 5.5; the
15 prerequisites carry citations and reasons. I found no definition or key theorem on the way to Theorem 1.6
that is absent.

## Routes

All three accepted. Mechanically they are in order: both Part II titles have the required
`<parent title>, Part II: <topic>` form, both parents exist, both new roadmap ids are free, the areas
`algebraicgeometry` and `commutative` are galaxy ids, the briefs are 519 and 481 words and name their final
theorems and their imports, and the source route's layer `SchemeAndStackFoundations:SF.0` is owned by a
roadmap of origin `campaign`, so it is not a Tau Ceti re-plan.

I checked the ownership claims myself and corrected two overstatements in place.

- **Route 1** claimed "nothing in the atlas defines quasi-excellence or catenarity". Quasi-excellence, no; but
  catenarity does appear — `DeformationAndDerivedPatchingAlgebra:R03.3` says to "state hypotheses on
  catenarity and excellence rather than importing geometric conclusions for arbitrary local rings". That is a
  hypothesis to be stated, not a theory to be built, so the route stands; the reason now says so.
- **Route 2** claimed "the only dualizing complexes in the atlas are the perverse-sheaf ones of
  EtaleDualityAndPerverseSheaves". They also occur in `DeligneWeightsAndPurity:DWP.8` and
  `EndoscopicTransferAndUnitaryTraceComparison:ET.2/ET.2a`, and — as a **coherent** rather than perverse
  object — in the Tau Ceti roadmap `StableReduction`, Layer 2, which builds "the relative dualizing
  complex/sheaf for proper flat finitely presented relative Cohen–Macaulay curves". That is a special case, in
  a roadmap that is never re-planned, so the Part II remains the right vehicle for the general Noetherian
  theory; the reason now names it.
- **Route 3** I checked hardest, because the Nagata compactification sounds like something the atlas should
  already own. It does not: `AlgebraicModuliForArithmeticGeometry:R09.7` and `R09.7d` mention it only to say
  that "no general Nagata compactification is silently assumed", and `AdicCoefficientsAndComparisons:L4` uses
  it without planning it. SF.0 is the right home.

## Mistakes in the paper

All three confirmed, each checked in both versions; verdicts are in the JSON.

- **E1** (Corollary 1.11): "`X̄ ∖ X` is a (possibly nonreduced) divisor in `X`" — `X̄ ∖ X` is disjoint from
  `X`, so `X̄` is meant. Misprint.
- **E2** (§1.13): "ificaiton". Misprint.
- **E3** (Lemma 2.11): the final clause is stated and the proof never returns to it; its only trace is the
  parenthesis about why the statement has a direct sum. A mild but real gap — the missing sentence is that
  after the reduction to a local `X`, the hypothesis says exactly that the set of isolated points of the
  punctured spectrum is empty, so no direct sum is needed.

I looked for further mistakes around each locator and found none to add. My own mechanical audit of the LaTeX
agrees with the extraction's: no duplicate label, no cross-reference whose word disagrees with its
environment, no leftover markers. (The paper labels with a custom `\lab` macro, so a naive audit reports every
reference as undefined; that is an artefact, not a finding.)

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json` reports ok after
the changes, and `research/blueprint/intake.py check-files` reports no problems. The extraction now has 62
items — 2 library, 2 planned, 58 missing — with every missing item routed exactly once, and `status` stays
`complete`.
