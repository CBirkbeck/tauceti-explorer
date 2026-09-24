# Handoff — BP-CohomologyComparisons

Job `BP-CohomologyComparisons`, issue #697. Agent: Claude Code, session `cc-7b31c4`, 24 September 2026.

Deliverables:

- `research/blueprint/packets/CohomologyComparisons.json` — 20 nodes, 5 API items, 4 unit tests, 6 planets,
  25 pinned baseline declarations, 13 gaps, 6 requests, 1 structural proposal.
  `python3 scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- `research/blueprint/readmes/CohomologyComparisons.md` — the roadmap document, 1374 lines.
- `research/blueprint/suggested/CohomologyComparisons.lean` — 145 lines of signatures.

## What this packet is

The roadmap had a **reviewed integrated decomposition** of Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory*.
All 20 node identifiers are kept with their statements, hypotheses, proof steps, acceptance tests and verified
locators; added are prerequisites resolved to the pinned libraries or to a named supplier stage, planets, a
coverage record per layer, and an API outline with unit tests for the single definition. The API counts are
small because the decomposition contains one definition and no construction — ten of its twenty nodes are
lemmas — and inventing definitions to raise the count would be the wrong thing to do.

## What was checked in this session

The source's `edition` field says the locators are **line numbers in a supplied text extraction**, and the
recorded SHA-256 is of that file. It is not public and could not be obtained, so neither the hash nor the line
numbers were reproduced.

What was checked instead is the other half of every locator — the printed page — against `arXiv:1602.03148v3`,
downloaded in this session. **Seven locators were tested and all seven land on the recorded page:**

| statement | recorded | found |
| --- | --- | --- |
| Theorem 1.1 | pp. 2–3 | p. 2 |
| Example 3.16 | p. 25 | p. 25 |
| Lemma 3.23 | p. 27 | p. 27 |
| Theorem 4.4 | pp. 33–34 | p. 33 |
| Theorem 12.1 | p. 96 | p. 96 |
| Theorem 13.1 | p. 104 | p. 104 |
| Theorem 14.1 | p. 118 | p. 118 |

A reviewer should treat the page half of each locator as corroborated here and the line half as resting on the
decomposition's reading. The gap says so, and suggests recording a hash of a public file, or dropping the line
numbers in favour of the pages, which are the portable half.

## Coverage

Four of the seven layers carry the status the decomposition gave them, with its `remaining` lists verbatim and a
note added. **CP.1, CP.4 and CP.6 have no decomposed source** — the integral comparison diagram belongs to
`AInfCohomology` and is requested; the semistable and logarithmic branch and the exports were not read — and
this packet adds no node for any of them.

Fourteen of the twenty nodes are in **CP.5**.

## What the libraries already have

There is no reviewed library audit for this roadmap, so the index was read directly. Mathlib has `WittVector`,
`TruncatedWittVector`, `PreTilt`, `WittVector.fontaineTheta`, `BDeRhamPlus` and `BDeRham`, so the specialization
dictionary cites `θ` instead of rebuilding it and the lattice statements are about a lattice in a ring the
library already has. One citation is there for contrast rather than for use: `IsNoetherianRing`, because `A_inf`
is **not** noetherian, which is exactly why every hypothesis in CP.5 is finite *presentation* and why the
coherence lemma of CP.0 has to be proved rather than quoted.

## Requests

Six: `AInfCohomology:AI.0` (the `A_inf`-cohomology theory itself), `AInfCohomology:AI.0:period-comparison`,
`AInfCohomology:AI.2` and `AInfCohomology:AI.5` (the input package of Theorems 14.1 and 14.3),
`CrystallineCohomology:CR.3` (crystalline base change and the Frobenius isogeny, which Proposition 13.21
imports), and `PadicHodgeTheory:R06.2` (Kisin's functor and Breuil–Kisin theory, plus Scholze's de Rham
comparison — the decomposition records both as having no verified supplier in its own graph).

## Structural proposal

**CP.5 carries fourteen of the twenty nodes and should be divided.** Its two halves are cleanly separated: the
first is linear algebra over `A_inf` with no cohomology in it — perfectness and Tor bounds, the structure
theorem, the length inequalities, the monotonicity lemma, the freeness criteria — and the second is the four
arithmetic conclusions those tools give. The first half is reusable by anything working over `A_inf`, and the
decomposition's own gap list asks who should own it. Dividing the layer, or moving the first half to the owner
of the `A_inf` linear algebra, would make that reuse visible and would stop one layer being three times the size
of any other in the atlas.

## Gaps

Twelve carried forward, including that Kisin's functor and Proposition 4.34 have no verified atlas supplier,
that the `G_K`- and Frobenius-compatibility in Theorem 14.6(i) is not displayed in the source, that the §2
counterexamples were read as statements only, and that the normalisation fact that `μ` is a unit is used
implicitly. One is this job's own: the hash and line numbers could not be reproduced, and what was checked
instead is recorded above.

## Did the Lean file compile?

**No.** No toolchain at the pinned commits was available and the shared Mathlib build here is a cache a worker
must not rebuild. Every name the file is written against was confirmed in the pinned declaration index.
