# Independent review of Polylogarithms P.6

**Verdict: accepted.** Reviewer: Codex, session `codex-PaORFX`; job
`REV-Polylogarithms--P.6`, issue #6406; date 6 October 2026. The planning
session was `codex-Omyv0N`, so this review is independent.

This is a complete target-level follow-up pass. It establishes a plan for the
missing weight-three differential and its exact examples, while importing the
accepted base packet's other P.6 targets. Coverage remains **planned**, with
three supplier requests and one explicitly exposed inherited proof gap.
Acceptance certifies the plan reviewed here, not implementation or proof
closure of its suppliers.

## Counts and changes

The packet has two nodes: one theorem and one application; zero new
definitions or constructions; five exact application tests; one planet; four
baseline declarations; three requests; and one inherited gap. Both nodes were
checked: the theorem is verified and the application is corrected. No node was
added, and no baseline citation was removed or replaced. The checker reports
zero definition/construction unit tests because all five tests belong to the
application; all five appear as Lean examples.

The complete list of changes is:

1. Added `Polylogarithms:P.1/bloch-wigner-positivity` as a direct prerequisite
   of the application. Its strict sign test uses this promoted theorem, rather
   than acquiring positivity from the definition of the dilogarithm. Updated
   the proof step, acceptance assertion and corresponding test explanation.
2. Exposed the existing positivity proof obligation in `gaps` and
   `coverage.remaining`. The accepted base packet already records a missing
   strong minimum principle for superharmonic functions. Only strict negativity
   in `trilog_diff_i_sign` needs that input; its derivative equalities and the
   other four examples do not. The suggested file now identifies this exact
   supplier and gap in its comment. No theorem signature changed.
3. Named the existing accepted
   `ColemanIntegration:L0/iwasawa-logarithm` and
   `ColemanIntegration:L0/log-branch-field-compatibility` nodes in the regulator
   target's import inventory. Narrowed the D.1 request to the regulator-specific
   principal-unit, finite-kernel and rationalised-rank comparison. Its request
   also names `ColemanIntegration:L0/log-branch` for the homomorphism laws.
   D.1 consumes those objects; the request does not build another logarithm.
   Updated the corresponding assembly refinement.
4. Added the independent verdict confirming `Polylogarithms/E22` and the
   packet's top-level review object. Added the reviewer attribution to the
   suggested file. This report and the review handoff record the checks and
   remaining assembly work.

The reader document was read and left unchanged: it is outside this review's
deliverable paths. Its formula, examples, three requests and ownership boundary
agree with the reviewed packet. Its assertion of no *new local* proof gap does
not discharge the inherited P.1 positivity gap exposed here. Assembly should
carry that distinction into the combined document.

## Source and mathematical checks

I fetched and read Goncharov's
[*Explicit regulator maps on polylogarithmic motivic complexes*, arXiv
math/0003086v1](https://arxiv.org/pdf/math/0003086v1): §2 items 1, 4 and 6,
and §4 Proposition 4.1 with its entire proof, equations (28)–(38), printed
pages 17–20. The inspected PDF's SHA-256 is
`47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea`,
matching the packet. Both node locators reach the correct passages and both
short excerpts occur literally in the text.

For weight three, (28) has just the correction with coefficient
β₂ = 1/3. Equation (15) and the definition of α on printed page 5 identify
that correction. The even-weight convention is L̂₂ = iD, so multiplying it
by d i arg supplies the negative angular term. These are the packet's
normalisation and sign.

I independently differentiated
L₃ = Re(Li₃ − a Li₂ + a² Li₁/3), where a = log|z|. Put
b = log|1−z|, Li₁ = −b−iφ and Li₂ = u+iw. The derivative recurrences
cancel the u da terms; the angular coefficient becomes −(w+aφ) = −D;
the remaining terms are ab da/3 − a² db/3. Also
db[v] = Re(v/(z−1)), fixing the last denominator's sign.

The imported single-valued and branch-change nodes explicitly supply real
analyticity away from 0 and 1, including across the classical cut. Thus the
derivative and the displayed one-form are continuous there and their equality
extends from the dense cut complement. A principal-argument derivative on its
cut is never assumed. The rotated local-log step is legitimate: near a
nonzero z₀, choose c = z₀⁻¹; then cz lies in the slit plane near z₀,
Re log(cz) differs from log|z| by the constant log|c|, and the chain rule gives
Re(v/z).

All five examples agree with the theorem and the supplied real-axis
vanishing of D: at 1/2 the coefficient is 4(log 2)²/3; at 2 it is
−(log 2)²/3; at −1 it is zero; on the unit circle the radial value is zero
and the positively oriented angular value is −D. At i the angular direction
is −1 and the radial direction is i. The additional strict sign uses the
separate positivity supplier. Every example asserts differentiability, so the
zero totalisation of `fderiv` cannot certify a nonexistent derivative.

I inspected the page images for printed pages 3 and 19. The first
single-valued definition prints logarithm exponent n−k; equation (33) prints
k. The weight-two example and the stated Bernoulli coefficients confirm the
correction. E22 is therefore confirmed for this preprint. No published text
was inspected, and this verdict does not extend to its typography. The
existing record already identifies the internal correction and the searches
for external corrections.

## Baseline, suppliers and ownership

All four baseline statements were read in the Mathlib source tree at exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Statement checked and use |
| --- | --- |
| `DifferentiableAt` | Existence of a continuous linear derivative; valid for the real normed spaces used here. [FDeriv/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/FDeriv/Defs.lean). |
| `fderiv` | Chosen Fréchet derivative, totalised through `fderivWithin`; differentiability is separately asserted. Same source file. |
| `Complex.log_re` | Re log z = log ‖z‖, with no nonzero hypothesis. [Complex/Log](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Log.lean). |
| `Complex.hasStrictFDerivAt_log_real` | Real derivative of log is multiplication by z⁻¹, under z ∈ slitPlane; that restriction is respected. [Complex/LogDeriv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean). |

I also checked `bernoulli`, `bernoulli_one` and `bernoulli_two` to confirm the
prototype's coefficients. The reviewed library-coverage entries P.1 and P.6
show these targets absent. Searches of the pinned Mathlib analysis and number
theory sources, and of Tau Ceti's `TauCeti` source tree at
`f790474821cf4256814db967cb154e7af3d0c369`, found no higher polylogarithm or
Bloch–Wigner implementation supplying these targets. The open-PR metadata
preserved by the author is not a baseline claim or a proof dependency.

I read the supplying statements and relevant APIs in the accepted
Polylogarithms packet: the classical function, single-valued function,
branch-change lemma, Bloch–Wigner function and separate positivity lemma;
the P.6 regulator, conjecture adapter, equivalence and tests. Their conventions
match. I also read the exact K₃ V.6 Bloch-element constructor and five-term
certificate statements; their proved boundaries and integral quotient
conventions justify importing them without new certificate objects. The
follow-up does not reverify the base packet's older NSW locators or close its
P.5 current and source obligations.

The I.2, L4, D.1 and automorphic L0 supplier descriptions were read, together
with the existing Coleman logarithm nodes named above. The three requests
state precise outstanding interfaces, including torsion at p = 2. The
Leopoldt defect compares rationalised ranks; completed-map injectivity also
requires the explicit torsion passage. The ordinary diagonal unit embedding
is not the conjecture.

Confirmed finding RT-AREA-ktheory-2/26 and its verifier were checked. Both the
packet and reader assign the early completed map, strong conjecture and defect
to I.2, with I.2 → L4, I.2 → automorphic L0 and I.2 → P.6. Weak cyclotomic
Leopoldt remains distinct from the strong statement for the base number field. P.6 retains
the regulator, equivalence and tests. Reassigning ownership and the statement's
planet does not delete the mathematical statement, in agreement with the
verifier. These are proposed assembly edges, not edits to the reviewed atlas
base; no reverse polylogarithm dependency is introduced.

## Prototype, checks and assembly handoff

The prototype has the required introductory note, individual Mathlib imports,
three clearly labelled existing supplier function forms, the named theorem
and all five examples. Its only placeholder definition returns a function's
data, never an unconstrained proposition. No new definition needs a separate
API or three additional definition tests. The single planet is the key
differential theorem, within the layer's count and name limits. All
implementation statuses remain unchecked. The upstream ConformalMapping and
ArithmeticDirichletSeries documents were read for the roadmap standard.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.6.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/Polylogarithms--P.6.lean`:
  exit 0 with only seven intended `sorry` warnings. The shared build's Mathlib
  commit is the exact pin. The file imports only Mathlib, so no unpinned Tau
  Ceti declaration enters the check. Available memory was 112 GB before
  compilation. No language server or library build was started.

Assembly must bind the I.2 and D.1 interfaces, retain the direct Coleman
imports, recast the old conjecture node as an I.2 adapter, transfer its planet,
and attach the new differential to the old P.6 test node. Remove only the
weight-three clause of the old differential source gap. Preserve the
general-weight, higher-Bloch, P.5-current and P.1-positivity obligations under
their owners. No unresolved contradiction remains in this follow-up; these
bounded supplier and assembly tasks remain explicit.
