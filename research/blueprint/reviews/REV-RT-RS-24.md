# REV-RT-RS-24 — independent verification

**Result: no finding verdicts are needed.** The complete RT-RS-24 result contains
`findings: []`, and the companion report likewise states that it found no evidenced
defect. The review JSON therefore retains an empty list; it does not invent a
“confirmed” entry or request a fix job.

Reviewer: Codex — codex-rtOQ9t, 2026-09-30. Refs #4413.
Base: `3a93019ff0952407d829cb98ac00c9e387959f7e`.
The red team was Codex — codex-a71f92; the restructuring author was
ChatGPT Pro — gpt-20260921-c74f2a and its reviewer Claude Code — cc-442dc5.
This session participated in none of those three jobs. Claim comment 5911482580
was confirmed by bot comment 5911485569 before work began.

## Scope and independent checks

Read the red-team JSON/report, RS-24 family leads, proposal/report and original
independent review. Read both complete member READMEs, all twelve member contracts,
the five narrowing decisions, fourteen owner assignments and the fifteen concrete
external stage contracts appearing in the links. Rechecked the relevant ownership
clauses of RS-12, RS-16 and RS-21.

The [accepted restructuring](https://github.com/CBirkbeck/tauceti-explorer/blob/3a93019ff0952407d829cb98ac00c9e387959f7e/research/blueprint/restructure/RS-24.result.json)
is explicitly a decision patch preserving existing edges. A shortened `keep`
reason is not a replacement theorem statement. With that interpretation:

| Boundary | Independent conclusion |
|---|---|
| IHG.0 | Import existing polynomial-law/divided-power carriers. Retain homogeneous multiplicative laws, representability/base change, characteristic polynomials, operations, continuity, finite-projective comparison and the coefficient restriction on traces. |
| IHG.3 | SR.4 owns Satake; IHG retains the integral GL_n polynomial, arithmetic Frobenius, twists and n=1/2 tests. No formula for an unspecified L-group representation is asserted. |
| IHG.2 / TC.2 | The generic bounded-amplitude ghost-ideal composition theorem is separate from constructing the actual geometric action, comparison diagram, limits and quantified quotient. Nilpotence of individual endomorphisms would not suffice. |
| IHG.5 / TC.3–4 | The generic descent theorem takes an actual comparison as input. TC proves its geometric premise and applies it; no TC.2 → IHG.5 construction edge is required. |
| TC.3 | Imports determinant and ALS boundary infrastructure while retaining ambient/Levi normalization, auxiliary characters, ring endomorphisms, factor separation, change of coefficients and choice independence over nilpotent quotients. |
| TC.4 | Retains all four concrete routes, source-qualified level/exponent uniformity, inverse systems and genuinely nonlifting torsion tests. |
| IHG.6 / TC.4 | The integral Ribet branch is distinct from TC validation. Both Ribet versions, residual coincidence, local factors and extra coboundary generators survive; its I.7 export remains. |
| Unnarrowed TC.0–1 | Actual formal-model/sheaf and integral bundle/section comparisons remain, including boundary ideals, approximation hypotheses and almost errors. |

The CM/unitary and explicitly conditional symplectic branches remain distinct.
This review preserves their source-qualified contracts; it does not re-certify the
current status of external classification theorems.

The fourteen ownership records agree with the inspected neighboring clauses:
RS-12 keeps generic reconstruction/interpolation/normalization in IHG.1/4/3;
RS-16 keeps the residual-coincidence Ribet theorem in IHG.6; RS-21 keeps general
Satake in SR.4. The word `formerly` in the TC.2 ownership row does not assert
that IHG.5 constructed its geometric hypothesis or create a reversed edge.

## Pinned library evidence

Read the actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [PolynomialLaw/Basic.lean:77–85](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PolynomialLaw/Basic.lean#L77):
  the carrier is a natural family on scalar-extended modules over commutative
  semirings. Its coefficient-algebra universe is explicit. This is not by itself
  homogeneous multiplicative determinant theory.
- [DividedPowerAlgebra/Init.lean:74–101](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean#L74)
  and [its weak lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean#L317):
  the congruence quotient exists, while the lift takes an explicit family satisfying
  the divided-power relations. These declarations support reuse of the carrier,
  not automatic discharge of IHG.0's remaining comparison theorems.

No new Tau Ceti availability or full-library absence claim is made.

## Graph reproduction and a counting clarification

Fresh checks at the review base reproduce:

- Two roadmap decisions; twelve layer decisions; five narrowings.
- Fourteen ownership records; twenty-eight unique directed link pairs.
- Nine pairs additional to the native snapshot.
- All six native external exports preserved: IHG.1 → R01.5/AG2.3,
  IHG.3 → AG2.0, IHG.4 → IG.6, IHG.6 → I.7, and TC.4 → IG.6.
- The seven other native external prerequisites remain under the patch semantics:
  AdicSpacesPartII F0/R3 and PerfectoidSpaces P2/P8 → TC.0;
  AutomorphicBundles B3 and PerfectoidShimuraVarieties S3 → TC.1;
  ArithmeticGaloisDuality R02.1 → IHG.6.

The production assembler now yields **2,840 stages and 8,007 directed pairs**.
All twenty-eight RS-24 pairs already occur in that assembly and in the consumers'
`requires`. Unioning them again leaves 8,007 pairs. For every proposed edge,
search from its target finds no path back to its source. Thus the present
production check supports the red team's cycle conclusion without relying on
its older intermediate graph counts.

There is one presentation correction to the red-team report's endpoint count:
the link array has **25 distinct concrete stage endpoints plus one upstream
sentinel**, rather than 27 concrete endpoints plus the sentinel. The 27-stage
reading set is correctly obtained by combining **all twelve member stages**
with **fifteen external stages**; TC.0 and TC.1 are read as member stages but
do not occur in the twenty-eight link rows. All actual endpoints resolve.
This arithmetic slip neither loses a mathematical target nor changes any edge,
owner or finding verdict, and warrants no high/medium fix job.

## Validation and limits

`scripts/check_restructure.py` on the unchanged proposal passes.
`scripts/check_redteam.py` on the empty review and the submission
`intake.py check-files` pass; `git diff --check` is clean.
No Lean file is required or compiled. No restructuring, source document,
accepted result or generated atlas was edited.

This verifies the submitted no-findings result with independent preservation,
carrier and production-graph checks. It is not a new exhaustive proof audit of
Scholze, Chenevier, DKSW, ACC+ or the classification literature, nor a certificate
that the roadmap endpoints have been formalized.

| Reviewed input | SHA-256 |
|---|---|
| RT-RS-24 result | `99823fd110816620f7b19a5aacb789c0ce47465d766c4da41117a498ab1052bc` |
| RT-RS-24 report | `380e4d754b371b9ad4b4d6b68e3dbc801906962e5be5037ed2b794a597852e31` |
| RS-24 proposal | `d3e408505fabd957339d6bbe5f2f972b9b908a928bcc4688dc0f7dc4ee9d4ba8` |
| IHG README | `cfd7dc2457a3f303facf9eec2ac2561454512ad8cd1eba229cbc44ed428c96ca` |
| TC README | `590309c17dbbff974a4056da1fb0f5319c847d432af2f15bc137374ea299f92e` |
