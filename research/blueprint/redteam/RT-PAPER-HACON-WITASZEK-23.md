# Red team: Hacon–Witaszek, relative fourfold MMP

Codex, session `codex-rtOQ9t`, 2026-10-01. Refs #4224.

The audit found **two medium findings** after reading the complete published paper
and all 163 extraction items. Both concern proof information that the next worker
needs. Neither establishes that the main MMP theorems are false.

The audited extraction is at repository commit
`e3b895cf3e6bdb7f0f8de6ac0fcae84fc9db26dd`; hashes, library declarations read,
source versions and bounded reading coverage are in the companion JSON.
This worker did not write or review the extraction. Other Codex sessions named
in its reading log are distinct workers.

## 1. Proposition 5.8 needs a compactification step and a resolution-hypothesis adapter

The [`embedded-to-birational` item](../papers/PAPER-HACON-WITASZEK-23.result.json)
has an empty gap list and repeats the printed principalize-then-resolve argument.
That outline loses a real issue with a quasi-projective target.

Take the birational rational map from `X = P¹` to `Y = A¹` over an algebraically
closed field of characteristic greater than five. Principalization on `P¹` is
available. A regular projective birational modification of `P¹` is still `P¹`,
and all its global regular functions are constant. It therefore cannot admit
the birational morphism to `A¹` required by the printed intermediate step.
The proposition's conclusion remains true in this example: the identity of
`A¹` already supplies the desired regular source. This distinguishes a failed
proof step from a false conclusion.

A repair must first work over a projective compactification and then restrict
the resolved source to the inverse image of `Y`, proving properness and the
exceptional/boundary conclusions there. The later use of embedded resolution
on the new ambient `X′` also needs justification: the proposition only assumes
embedded resolution for subschemes of the original fixed `X`. Transfer that
property, or give a simultaneous-principalization argument on `X`. A stronger
ambient-uniform assumption is a possible provisional contract, but it must be
identified as stronger. These obligations belong in an explicit gap and a
source diagnostic. [Published Proposition 5.8, p.26](https://doi.org/10.1017/fmp.2023.6).

## 2. Three proof corrections are missing from the source register

The existing E1–E11 register does not include these passages:

| Passage | Correction to preserve |
|---|---|
| Proposition 2.15 proof, p.12: echo blowup centres | After blowing up `C`, use the intersection of the new exceptional divisor with the strict transform of the unique boundary component, and iterate. The strict transform of the blown-up centre itself is empty. AHK07 Example 1.4 gives the intended construction. |
| Corollary 4.7 proof, p.19: divisorial contraction | For `f : Y → Z` over `X`, the maps from `S` and its normalization used in relative vanishing and the displayed equality of higher direct images have codomain `Z`. Push forward along `Z → X` in the subsequent Leray argument. |
| Claim 6.8 proof, p.30: terminality | The vertical-discrepancy argument must use the new total space `𝒴`, its plt pair `(𝒴,Y)` and Cartier fibre `Y`. For an exceptional vertical divisor, `A_𝒴(E) = A_(𝒴,Y)(E) + ord_E(Y) > 1`. |

The `echoes` and `partial-terminalization` items already allude to corrections,
but Protocol §18 requires the source mistake, its locator and the repair to be
recorded explicitly. Add separate sourceIssues for these three slips and link
the affected items. Preserve the existing theorem conclusions and E1–E11.
[Published paper, pp.12,19,30](https://doi.org/10.1017/fmp.2023.6);
[AHK07 v2, Example 1.4, p.3](https://arxiv.org/pdf/math/0605137v2).

## Existing ownership follow-up

`AnalyticStacks:AS.1` is a draft stage, absent from the current assembled atlas.
It is not an invented identifier. Its classical coherent-duality contribution
is already covered by [RT-AREA-algebraicgeometry/18](RT-AREA-algebraicgeometry.result.json).
That finding recommends a single scheme-coherent-duality owner at SF.2; the
[algebraic-geometry key-definition survey](../keydefs/KEYDEF-algebraicgeometry.json)
lists this paper and BMP among the clients and records an unresolved owner.

When that consolidation is applied, include this extraction's `dualizing` and
`derived-local` route and its birational Part II brief. The singular finite-trace
and local-duality requirements exceed the draft's proper smooth Serre-duality
target. This is recorded as an existing cross-target follow-up, not counted as
a newly discovered finding or a request to build another theory.

## Scope and verification

All published pages 1–35, including proofs and references, were read. Page
images 12, 19, 26 and 30 confirmed the reported formulas and symbols. Selected
parallel preprint and supplier passages were read as identified in the JSON;
the published text controls the findings. Cambridge adds a download-time footer,
which explains why its downloaded hash differs from the extraction's old hash.

All 163 item contracts, the reader and accepted review, 9 route briefs,
18 prerequisite records, 14 gap records and 11 sourceIssues were examined.
All 148 missing items are routed exactly once. Item prerequisite identifiers
resolve and the item dependency graph is acyclic. The 46 definition/construction
APIs have planning tests. Existing local/global Q-Cartier and numerical/Picard
guards were preserved in this audit; no known frontier was relabelled as a new
discovery simply because its supplier proof remains incomplete.

All 18 declarations in the extraction's baseline list were read at Mathlib
`082e2d3` and Tau Ceti `f790474`. Reviewed library coverage and current/draft
owner records were checked. Existing Witt-vector rings, line bundles, proper
morphisms, ordinary derived categories and local cohomology do not by themselves
implement the required geometric MMP or singular duality. The full transitive
supplier proofs were not independently completed.

Correction searches on 2026-10-01 covered the publisher record and PDF,
[arXiv version history](https://arxiv.org/abs/2009.02631),
[Witaszek's publications page](https://sites.math.northwestern.edu/lro1793/publications.html),
Crossref DOI metadata and title/author searches for errata or corrigenda.
No correction to the new passages was located; this is a bounded search.
The two findings remain subject to independent verification.

Validation: `scripts/check_redteam.py`, the issue-deliverable `intake.py
check-files` gate and `git diff --check`. No Lean file is a deliverable for this
job, and no Lean build or language server was started.
