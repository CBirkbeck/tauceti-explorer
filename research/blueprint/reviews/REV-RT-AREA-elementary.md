# REV-RT-AREA-elementary

Both findings are **rejected** as omission findings. The named mathematics is absent from the older concise stage descriptions, but accepted paper routes already assign it to the cited stages. The proposed repair for the trace problem also changes the mathematical constant incorrectly.

Reviewer: Codex, session `codex-c83e7a`, 24 September 2026. Issue: #1470. The reviewed red-team result was written by Claude Code, session `cc-fb70e5`; this session did not write it. This session previously worked on Martin and Smith paper extractions. This review checks the later red-team assertions against the current accepted routes and public sources; it does not replace either paper's independent review.

Inputs were acquired at `e483a30e545b0d5c5ea3ef5e8aacaebdb5289564`. The report and machine verdict give a decision for each of the two findings.

| Finding | Verdict | Decisive point |
| --- | --- | --- |
| RT-AREA-elementary/1 | rejected | Four accepted source routes already assign the Markoff and Markoff–Hurwitz foundations to CA.4. |
| RT-AREA-elementary/2 | rejected | Accepted Smith route 3 already assigns the classical trace problem to CA.6; its proposed infimum definition is false. |

## How ownership is recorded

[PROTOCOL.md section 16](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/PROTOCOL.md#L537) permits a `source` route for missing mathematics that belongs inside an existing proposed layer. Acceptance adds the paper to that roadmap's blueprint instructions. The mechanism does not require the short original README, atlas description and historical library audit to repeat every newly routed item before it has an owner.

I read the full ClassicalArithmeticCompletion document and stage extract, its partial integrated decomposition, the relevant AUDIT-18 entries, RS-03's treatment of CA.4/CA.6, the five paper result files at the cited routes/items, and all five independent route reviews. The integrated decomposition is explicitly partial, largely about CA.0/CA.1; it is not a completed CA.4/CA.6 blueprint that purports to omit these subjects.

The queue code independently corroborates the protocol: [accepted_routes](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/make_queue.py#L388) reads accepted route verdicts, [the source-route branch](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/make_queue.py#L834) collects the named stages and item IDs, and [added_sources](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/make_queue.py#L485) makes them mandatory blueprint inputs. I did not run the queue generator or alter the queue.

The live [blueprint issue #1025](https://github.com/CBirkbeck/tauceti-explorer/issues/1025), read during this review, already includes Martin's CA.4 source and items /1–/13. Its last body update was 23 September at 13:31 UTC and it does not yet display all later accepted additions. I distinguish that publication snapshot from the current accepted route records; I do not claim every route is already displayed in the issue.

## Finding /1: the Markoff owner exists

The accepted routes and their reviewed assignments are:

| Source | Route / items relevant here | Existing owner |
| --- | --- | --- |
| [Martin](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-MARTIN-25.result.json) | 1; /1–/13: carrier, Vieta moves, positivity, descent, tree and reduction | CA.4 |
| [Ghosh–Sarnak](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json) | 1; notably /3–/13: level surfaces, moves, descent and fundamental sets | CA.4, with CA.1 for character/reciprocity inputs |
| [Chen](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-CHEN-24.result.json) | 1; /9, /10, /90: trace coordinates, positive orbit and normalization comparison | CA.4 |
| [Gamburd–Magee–Ronan](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json) | 1; /1–/5: n-variable equation, exceptional families and descent | CA.4 |

Each corresponding `.review.json` accepts that route. The n-variable construction is explicitly covered; it was not inferred from Pell equations or a matching keyword. The coefficient-three and trace-coordinate models need their comparison, with the factor-three invertibility restriction over general rings; this is already present in the accepted Chen route.

I checked the mathematical objects at [Martin §1](https://arxiv.org/pdf/2502.15960#page=1), [Ghosh–Sarnak §§1–2](https://arxiv.org/pdf/1706.06712v3#page=3), [Chen §5.5, pp.80–81](https://arxiv.org/pdf/2011.12940v2#page=80), and [Gamburd–Magee–Ronan (1.1), Definition 15, Proposition 16 and Corollary 17](https://arxiv.org/pdf/1603.06267v3#page=11). They support the distinctions made in those routes. Naming them in an expanded README would improve navigation, but their absence from the old synopsis does not create the asserted ownership gap.

## Finding /2: existing assignment and an unsafe repair

[Smith route 3](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-SMITH-24.result.json) assigns the classical trace objects and auxiliary-polynomial method to CA.6; [its independent review](https://github.com/CBirkbeck/tauceti-explorer/blob/e483a30e545b0d5c5ea3ef5e8aacaebdb5289564/research/blueprint/papers/PAPER-SMITH-24.review.json) expressly accepts that division so the potential-theory roadmap imports the constant. The latter route also owns Smith's new endpoint. This is already the one-owner structure requested by the finding.

The proposed ordinary infimum is wrong. For `P(X)=X²−3X+1`, both roots `(3±√5)/2` are positive, irrational algebraic integers, and their normalized trace is `3/2`. Thus the proposed infimum is at most `3/2`, inconsistent with the very Schur bound cited by the finding. The cofinite liminf in [Smith, Notation 5.8 and Example 5.9, p.37](https://arxiv.org/pdf/2111.12660v2#page=37) discards finite exceptional sets. The introduction's word “least” for the finite-exception threshold must be read as “greatest”; copying that misstatement from either the preprint or extraction is not a repair. [Theorem 1.1, p.2](https://arxiv.org/pdf/2111.12660v2#page=2) also refutes the historical value two, and that theorem already has its routed destination.

Pinned library reuse requires care. [NumberField.IsTotallyPositive](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/TotallyPositive.lean#L70) quantifies over real places only; it does not assert that all complex conjugates are real. In a totally complex field it is vacuous. Use integrality and a real-conjugates condition, such as working in the totally real field generated by the element, before making the comparison with this API. [Mathlib's IsTotallyReal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean#L47) supplies the relevant field condition.

These are constraints on any subsequent blueprint, not confirmed instances of the submitted omission. This two-file verification does not edit the source extraction, the roadmap or the library audit.

## Checks and limits

Reproduced the relevant searches from the declaration index through both pinned source trees, then through atlas extracts, proposed roadmaps, packets and integrated decompositions. No Markoff/Vieta-involution API or trace-constant package was found. A “totally positive algebraic integer” source hit belongs to the coprime-ideal representative theorem, not the trace problem. The search results agree with the unbuilt-library boundary; they do not negate accepted planning routes.

The three library files used for the total-positivity distinction were verified against the pinned Git tree blob hashes. The Gamburd–Magee–Ronan PDF matches the extraction's SHA-256 `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a`; Smith matches `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9`. Exact polynomial/trace arithmetic and route-to-item checks were run separately.

`check_redteam.py` passes; `intake.py check-files` reports two files and no problems. No Lean file changed or compiled. This is a verification of the two findings, not a fresh full-paper extraction or a re-audit of all eight stages.

Before publication, guarded inputs were refreshed at `1ba3304ed9e2a49a934653dad040f92e92dd2b4a`. The only changes recorded completion of RT-AUDIT-03 and this review's claim in the queue; the finding text, accepted routes, roadmap and ownership evidence were unchanged.
