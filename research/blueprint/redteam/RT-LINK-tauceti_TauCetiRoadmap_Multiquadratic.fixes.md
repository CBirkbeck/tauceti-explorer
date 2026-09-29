# RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3993).
- Findings: `RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic.result.json`.
- Verdicts: `.review.json`.
- Two findings, both confirmed.

The only edited deliverable is `research/blueprint/links/tauceti_TauCetiRoadmap_Multiquadratic.json`. No link, owner or dependency edge changed, and the historical `review` text is untouched.

**Source check.** I read both pinned files in full, from GitHub at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their SHA-256 hashes agree with the local baseline tree:
- `NarrowGenusField.lean`: 7,959 bytes, `bb1d50d8…`;
- `Multiplicative.lean`: 9,426 bytes, `9d5d2984…`.

I also re-read `GenusField.lean` lines 55–57 and QuadraticFormInvariants README lines 615–620 at `origin/main`.

## /1 (medium, library-claim): the narrow genus-field predicate already exists

**Checked.** `TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.lean` contains the following.

| Line | Declaration | What it gives |
|---|---|---|
| 68 | `IsNarrowGenusField d L y` | root, quadratic subfield, abelian Galois, unramified at every nonzero finite prime over ℚ(y), and maximality; no infinite-place condition |
| 100 | `IsNarrowGenusField.exists_algEquiv_apply_eq` | uniqueness by an equivalence respecting the chosen roots |
| 130 | `IsNarrowGenusField.nonempty_algEquiv` | uniqueness up to isomorphism |
| 140 | `isNarrowGenusField_candidateGenusField` | the predicate for `candidateGenusField hd`, for `Squarefree d` and d not a rational square, with no sign condition |

The comment at `GenusField.lean` lines 55–57, which says a narrow predicate "remains future work", is therefore stale.

**Changes.**
- **`overlaps[1].proposal`.** The sentence treating the narrow predicate as future work is replaced by imports of these declarations, with their lines and file. It notes, as the review asks, that the narrow predicate's maximality quantifies over comparison fields in the same universe. The ordinary `IsGenusField` quantifies over `M : Type v`, so its cross-universe signature is not claimed for the narrow one.
- **`requests[MQ-LINK-R1]`.** The "distinct remaining obligation" to package a narrow predicate is removed. The request now says to import the existing predicate, theorem and uniqueness API, and to correct the stale comment alongside the README. It keeps the genuine README correction, the ordinary/narrow prime-discriminant-compositum sentence, together with Cl/Cl² versus Cl[2]. It also states the distinction the review wants preserved: for positive radicands the ordinary construction uses `candidateGenusFieldReal`, while the narrow one uses the full `candidateGenusField`.
- **`reviewBaseline.qualification`** is rewritten to say the comment is stale and to name the two files. **`reviewBaseline.sources`** gains `NarrowGenusField.lean`, with URL, SHA-256, access date and size.

The ray-class, narrow-class and unit-sign comparisons (overlaps[1], MQ-LINK-R3) are unchanged, as the review requires.

## /2 (medium, library-claim): the generic square-class adapters are imports

**Checked.** `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean` supplies the three generic interop bullets of QuadraticFormInvariants Layer 0 (README lines 615–620), with only `Field` hypotheses and no characteristic-two exclusion:

| Adapter | Declarations (line) |
|---|---|
| multiplicative avatar and `ZMod 2` dictionary | `MultiplicativeSquareClassGroup` (45), `multiplicativeSquareClassEquiv` (65), `elementaryTwoQuotientEquivSquareClassGroup` (80) |
| pushforward along a field homomorphism | `RingHom.multiplicativeSquareClassMap` (118) and `RingHom.squareClassMap` (148), with identity, composition and comparison laws |
| cardinality transfer | `finite_multiplicativeSquareClassGroup_iff` (99), `natCard_multiplicativeSquareClassGroup` (105) |

**Changes.**
- **`links[0].reason`.** It no longer says "the consumer adds multiplicative notation, field-map and cardinality adapters". It names these declarations as pinned imports alongside `SquareClass/Basic.lean`, and leaves only form-specific uses and comparisons as consumer work. It also states that the `Nat.card` equality transfers cardinality without asserting finiteness, and that this does not make the whole quadratic-form layer implemented. The edge Multiquadratic Layer 0 → QuadraticFormInvariants Layer 0 and its evidence are unchanged.
- **`reviewBaseline.sources`** gains `Multiplicative.lean`.
- **New request `MQ-LINK-R4`** (owner `tauceti:TauCetiRoadmap/QuadraticFormInvariants`, open). The owner README is outside this job's scope, so this is the source-correction request the finding asks for. It asks to mark the "Square-class interop" milestone as landed at the baseline, and to keep only the form-specific uses as remaining Layer 0 work.

## Checks

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Multiquadratic.json`: 0 errors, 0 warnings (3 links, 2 overlaps).
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The unit suite passes.

**For the maintainer.** Both findings also point at source text outside this job:
- the stale comment at `GenusField.lean` lines 55–57, in the Tau Ceti library;
- QuadraticFormInvariants README lines 615–620.

MQ-LINK-R1 and the new MQ-LINK-R4 carry these corrections.
