# Independent review: CM rank-zero converses

**Accepted as a target-level plan with recorded supplier gaps.** Reviewer: Codex,
session `codex-pTbq4l`; job `REV-DESIGN-CMRankZeroConverse`, issue #1889;
2026-10-18. The design was written by a different worker/session. This review
does not close a layer or assert a formal implementation.

The packet now records 28 verified nodes and two corrected nodes. No node was
added or removed. All six baseline citations are confirmed; none needed
replacement. The inventory remains seven planned layers, 30 nodes, 29 API items,
21 unit tests, 17 planets, ten supplier requests and two gaps. The six definitions
or constructions each have at least three discriminating tests.

## Corrections made

1. In `C.1/selmer-zero-h2`, expanded the first Poitou–Tate application. It first
   kills H²(W′) and identifies a one-dimensional global quotient. The global
   Euler identity then gives dim H¹(W′)=1 and therefore H¹_f(W′)=0. Only then
   does the second application kill H²(W). The dyadic rationalization boundary
   is preserved. This makes the existing correct proof route explicit.
2. In `C.3/reciprocity-nonvanishing`, corrected the coefficient-domain step.
   The theorem allows γ over E=F_λ, whereas Kato's complex period formula is
   stated on the F-rational realization. Choose an F-basis, extend it to E,
   and use E-linearity of the regulator composite: a nonzero image of γ
   implies a nonzero image of a basis vector. Apply the period formula to
   that vector. The theorem retains its original generality without assuming
   a complex period map on completed scalars. Added an acceptance check and
   reflected this in the roadmap's C.3 description.
3. Added an independent verdict to every source finding, its source id,
   version metadata and correction-search record. Only E2 is confirmed.
   Added the independent current-upstream audit note and the complete
   per-node review object. Existing search/provenance entries are preserved.

The suggested Lean statements require no correction. The reader document is
outside this issue's deliverables and was left untouched. Its pre-review
“Source checks and corrections” section must be reconciled with these verdicts
when packaging; its reciprocity proof should also include the F-basis step.
The reviewed packet and this report record the final review decisions.

## Sources and version boundary

Read the entire seven-page [Burungale–Tian arXiv v2](https://arxiv.org/pdf/2506.03465v2),
especially Theorems 2.3–2.6 and 3.1, pp. 4–6, and Theorems 3.3/3.5 and
Remark 3.6, pp. 6–7. Read the cited passages in
[Kato's Numdam scan](https://www.numdam.org/article/AST_2004__295__117_0.pdf):
Theorems 12.4–12.5, pp. 221–222; §§14.8–14.13, pp. 238–242;
§15.6, pp. 253–255; and §§15.13–15.17, pp. 264–265.
Also read [BKLOS's public author copy](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf),
§2, pp. 2–5, §9.2, p. 14, and §11, pp. 18–19.
All three downloaded-file hashes match the packet. Source descriptions and
arguments here are in the reviewer's own words.

The [Annals publication page](https://annals.math.princeton.edu/2026/203-1/p01)
confirms the 13-page published article but did not supply its text; Project
Euclid returned no readable body. The arXiv history has no version later than
v2. No separate correction was located on the checked publication listings;
the author's indexed page could be located but direct access failed. Thus the
source verdicts concern **arXiv v2 only**. This review does not claim to have
collated the version of record or discovered a new published erratum. No
restricted source was needed.

| Finding | Verdict | Independent check |
| --- | --- | --- |
| E1: H² implication | Rejected as an erratum | The two duality applications and dimension count follow from Kato (14.9.3), (14.9.5) and Proposition 14.12, pp. 240–242. BT's abbreviated argument is valid; the expanded implementation lemma remains. |
| E2: CM Selmer display | Confirmed preprint misprint | BT p. 6 uses the number field K as an untyped p-adic scalar field and omits the central twist in the displayed modular groups. Kato (14.10.1), p. 240, fixes the convention. The completed-field Kummer Tate-module comparison in C.4 gives the intended vanishing implication. |
| E3: finite/geometric condition | Rejected as an erratum | Kato (14.10.4)–(14.10.5), p. 241, exclude crystalline eigenvalue one after the central twist, including bad p. Bloch–Kato dimensions give H_g=H_f. Making this local check explicit is appropriate for implementation; no false assertion or absent input has been established in the source. |
| E4: conjugation sign | Rejected | BT p. 6 explicitly requires the correct nonzero ε projection. Kato Theorem 12.5(1), p. 221, supplies exactly the sign relation used in the packet. |
| E5: statistical Selmer strength | Rejected | BT Theorem 3.5 already states corank zero. BKLOS §9.2 supplies the stronger Selmer-zero subset; §11, p. 19, explicitly gives the maximal-order isogeny reduction. The packet correctly imports their corank consequence. |
| E6: positive parameter family | Rejected | BT Theorem 3.3 explicitly uses positive squarefree parameters and 2∞ corank; its footnote 2 uses that family. The extra fundamental-discriminant comparison is a valid consequence, not a correction to the source's ordering. |

## Baseline, suppliers and ownership

Read each declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Statement supplies |
| --- | --- |
| `HeckeRing.GL2.Newform` | A nonzero new cuspidal eigenform away from the level, with coefficient-one normalization; the carrier needed by the modular realization suppliers. |
| `WeierstrassCurve` | The five-coefficient model used by `cubeSumModel`. |
| `WeierstrassCurve.Δ` | The discriminant polynomial used in the calculation. |
| `WeierstrassCurve.IsElliptic` | Invertibility of Δ, equivalent to Δ≠0 over ℚ. |
| `WeierstrassCurve.j` | The j-invariant on an elliptic model. |
| `WeierstrassCurve.map` | Coefficient-wise base change. |

The Newform source hash independently matches the raw pinned file. All 43
distinct named cross-roadmap supplier nodes were found and their statements,
hypotheses and proof routes read. The 57 named prerequisite occurrences comprise
52 blueprint occurrences and five integrated occurrences. Stage-level requests
are substantive: generic finite-module Euler characteristic does not replace
rational Kato duality; generic Selmer-complex control does not replace control
of Kato's exact j_* complex; and CM induction for E/ℚ does not cover E/K without
descent. The existing requests identify those extensions precisely.

Read the reviewed coverage audit for the parent and relevant supplier layers.
The plan reuses actual curve/newform/twist carriers, analytic order, generic
duality/control and counting theory. It does not redevelop finite Selmer groups,
completed group algebras or generic L-functions. Independently screened the
current Suggested files of the nine newer upstream directions, read the
relevant LocalGaloisGroups/ProfiniteArithmetic scope and the current ModularForms
L7 and EllipticCurves L5/L7 specifications, and inspected the current Tau Ceti
completed-algebra and elliptic/Selmer directions. No owned target was found
already implemented or planned upstream. Those checkouts were read only.

## Coverage and mathematical checks

Every node has a separate verdict in the packet. The following records the
checks that matter for the whole dependency chain:

| Layers | Checks |
| --- | --- |
| C.0 | The implication direction and corank carrier are correct. The sign has the right weights and total-function boundary. Kato's p. 240 page image uses inverse arithmetic Frobenius, agreeing with the packet's geometric convention. The central evaluation has negative half-weight and the dyadic component survives until rationalization. |
| C.1 | Absolute irreducibility kills H⁰. The two duality applications precede the global dimension-one conclusion. Local weights on ker N at bad p exclude φ=1 on W′ and justify the exponential kernel. |
| C.2 | Both Tor corrections survive until amplitude and vanishing remove them. Nakayama is applied after finite generation. Characteristic equality, rather than one divisibility, gives the basis. The sign and the away-p finite-condition comparison are explicit. |
| C.3 | The period formula uses f*, exponent h−1 and F-rational vectors. Nonvanishing of the omitted-factor product implies full nonvanishing without dividing by an Euler factor. The general converse is conditional; the CM endpoint has its own missing supplier. |
| C.4 | Rational Kummer Tate modules, completed coefficients, the central twist and Shapiro are typed correctly. The CM order can be nonmaximal and E need not descend. The rational corank and full L-function doubling arguments include p=2 and bad primes. |
| C.5 | Corank is not finite Sel₂ dimension. Both exact half-density upper and lower bounds are supplied. Under the fundamental-discriminant height, the three sign-plus residue weights sum to 3 and all six weights to 6; restriction to positive-density pieces and finite rescaling preserve the o(X) error. |
| C.6 | The BKLOS result yields a lower limiting proportion in the stated support height. Both cubic coordinate substitutions and inverse composites check exactly; the discriminant and four model examples are correct. The exceptional j cases give at most two descent cosets. Unramified rational primes contribute ℓ², giving the O(√X) thin set and the non-descent lower bound. |

The seven layers are in dependency order and realize all stated targets at
planning granularity. Their largest planet count is three, below the limit six.
The definition APIs and examples distinguish wrong signs, wrong rank carriers,
wrong coefficient scale, singular parameters and wrong density notions.
The 119-line suggested file uses two real-bodied light definitions on pinned
carriers, ten API lemmas and seven examples. Heavy supplier carriers remain
reader targets; there are no mock cohomology objects or data placeholders.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CMRankZeroConverse.json`:
  zero errors and zero warnings.
- Source-issue schema and version metadata checks: pass for all six entries.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/CMRankZeroConverse.lean`:
  pass.
- `lean-check research/blueprint/suggested/CMRankZeroConverse.lean` at the pins:
  exit 0; exactly 17 `declaration uses sorry` warnings and no other diagnostics.
  Available memory was 78 GB before the single compile.
- Exact sparse-polynomial arithmetic verifies both homogeneous cubic
  substitutions and both inverse composites; rational arithmetic verifies the
  discriminant-rescaling weights.
- JSON, review-node coverage, minimum test counts, planet counts and diff
  whitespace checks pass.

## Handoff to the orchestrator

The review job is complete. Before implementation closure, register the
`CMAllPrimeMainConjectures` equality endpoint and the unconditional
`ArithmeticStatisticsPartIISmithMethod` positive-family corank endpoint, then
replace GAP-CM and GAP-SMITH by exact imports. Discharge the ten existing
interface requests, especially rational Kato-complex control/duality, arbitrary
E/K theta induction and the positive linear support-height squareclass count.
The request for isogeny corank invariance remains with upstream EllipticCurves
L7; the statistical theorem should consume that owner.

Packaging should reconcile the existing reader with the reviewed packet,
retain the source-version boundary and all five rejected-erratum verdicts, and
retain the shared `pConverse` owner for the rank-one Part II consumer. No
additional job is claimed by this worker.
