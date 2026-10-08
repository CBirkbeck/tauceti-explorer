# REV-ShimuraVarieties--V8~2: completed review

Issue: [#7093](https://github.com/CBirkbeck/tauceti-explorer/issues/7093).
Worker: Codex, session `codex-9Nf2HQ`. Date: 2026-10-08.
Branch: `codex-9Nf2HQ-review-shimura-v8`.

**Accepted.** This independent round-2 review is complete. It resolves the
previous reader blocker and verifies the three nodes added in the first review.
The [review report](../reviews/REV-ShimuraVarieties--V8~2.md) records the
source checks, baseline statements, every correction and the remaining owner
interfaces. The [packet](../packets/ShimuraVarieties--V8.json) is `complete`;
both scoped stages remain `planned` and all nodes remain `unchecked`.

## What changed

Seven node verdicts are `corrected`, nineteen are `verified`. No nodes were
added or removed. Corrections distinguish the incidence cover from the
cocharacter-field map, the strict determinant target from the component
target, the actual unit congruence kernel, uniqueness for the specified complex
compactification, and the separate broader auxiliary-model hypothesis in the
general lane. The auxiliary gap and general remaining list now say the same
thing as those corrected proof contracts.

All corrections are reflected in the reader and relevant suggested-file
comments. Scalar source-issue effects now render as complete phrases. All
nine inherited source findings were independently confirmed; new E10 records
the repeated target index in Milne's quotient after Proposition 14.16(b),
p.127 of the 2017 author copy and p.356 of the published 2005 version. Both
versions were checked, and the published PDF hash is in `sourceVersions`.
All source statements and explanations are in our own words.

Counts: 26 nodes (13 theorems, three constructions, eight comparisons, two
applications), 16 API entries, 15 tests, seven planets, twelve baseline
declarations, 25 supplier requests, seven gaps and ten confirmed source findings.
All twelve baseline citations were retained after reading their exact Mathlib
statements at the pinned commit.

## Validation

- Packet checker: exit 0, zero errors and zero warnings, using the supplied
  declaration index. The baseline source statements were also checked
  independently and are detailed in the report.
- Agreement check: every declaration, hypothesis, proof, prerequisite, source
  match, acceptance, API/test statement, request, gap and coverage remaining
  list agrees with the reader. Every node/API name occurs in the suggested file,
  which contains 15 named test examples. Local prerequisite DAG and lane
  checks passed.
- `lean-check research/blueprint/suggested/ShimuraVarieties--V8.lean`:
  exit 0, no errors, 56 warnings, all `declaration uses sorry`; 111 GB available
  before compilation. Mathlib exactly matches
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports Mathlib only;
  the shared Tau Ceti checkout differs from the separately recorded packet pin.
  Elaboration checks the schematic forms, not arithmetic proofs.
- Five public PDF hashes reproduced, JSON parsing passed and
  `git diff --check` was clean. Changes are confined to the four issue
  deliverables and this handoff.

## What remains and where to resume

There is no unfinished task in this review. Future owner work should start from
the packet's seven gaps and stage-specific coverage lists:

1. V2: complex Baily–Borel datum maps and the Pink 12.10 partial-open closed
   immersion/finite quotient.
2. V5/V6 and the general existence lane: actual auxiliary models in Pink's
   broader datum category; strict V7 existence alone does not cover all domains.
3. Named suppliers: concrete canonical-model, reciprocity, analytic comparison
   and modular-curve carriers, with every schematic hypothesis restored.
4. AA.5: integral principal-level representatives or explicit conjugating
   stabilizer comparisons.
5. V1: the compact-open level index category and its laws.
6. V2: the all-type logarithmic-section embedding on the partial open from
   Pink 8.2, distinct from construction of the algebraic logarithmic line.
7. V4: promotion of reflex-norm functoriality with its full-idelic field-change
   norm and geometric Artin restriction.

The old C2 restructuring is superseded. No atlas promotion, upstream roadmap
edit, manual merge or issue closure is part of this review. The source files
and checking scripts were scratch material; all information needed for the
next worker is in the report, packet and this handoff. This run submits one
job and stops.
