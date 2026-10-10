# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-I3ds2G`, 10 October 2026.
Input revision `5488856e76e2f94c95260e0c54f19bdb648479ed`; integrated current
main `334197e7d` before submission, preserving its intervening review.

This is a **checkpoint blocked by conflicting dispatch scope**, not a finished
queue job. The previous #8423 submission was also merged as a checkpoint.
The live issue authorizes only the Motives packet, its suggested file and the
review report; the queue additionally requires GH.0 and Kato packet verdicts.
WORKERS.md says "Edit only the files the issue names, plus your own scratch
space." A clarification request received no answer during this run. No extra
packet, reader, queue file, generated atlas file or upstream checkout was edited.

## What is done

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md) records every
confirmed finding, fresh public-source locators/hashes, pinned library checks,
current upstream ownership and the limits of the verdict. This session did
none of the original work reviewed and took no second job.

The six Motives supplier corrections are accepted within the assigned scope,
after fixing one additional mismatch: `period_torsor` now consumes the
compatible good-pair product structures and the typed complex comparison
already required by its packet. Its hypothesis, proof and acceptance explain
the complex point and nonemptiness used for faithful flatness. The formal-period
source locator now includes Definition 2.8 p.10 and Remark 2.9 p.11.

The top-level review names this job and retains `needs_changes` at file level.
The geomlanglands verdict remains unchanged in history, and the intervening
algebraic-geometry verdict by `codex-XnOZ0w` is archived unchanged. Its relative Beck
preservation adapter and missing typed reconstruction interfaces remain
unresolved; the bounded period correction does not discharge them. All 182
node ids/order, prerequisites, 23 gaps, 16 requests, partial coverage,
implementation statuses, source issues, baseline declarations and planets
are preserved.

## Checks

- Packet checker with the pinned declaration index: 0 errors, 0 warnings.
- Full suggested file via `lean-check`, before and after the correction:
  exit 0; final run 806 warnings, all admitted-proof warnings, no errors or
  other warnings. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Final file SHA-256:
  `99299f01dccfb3946d18ebf7f4497f104b49a216a6727151bd839eb5a0954150`.
  Compilation does not prove the admitted declarations or supply missing
  reconstruction interfaces.
- Parsed preservation, `git diff --check` and intake file checks pass.
- `issues.deliverables_complete` remains false: GH.0 and Kato still name their
  separate owner reviews, rather than this job. No completion claim is made.

## Resume here

1. **Reconcile dispatch scope first.** The queue's additional pairs are
   `packets/GeneralizedHeegnerCycles--GH.0.json` with its suggested file, and
   `packets/KatoEulerSystems.json` with its suggested file. The maintainer can
   authorize that review scope and refresh the issue, or align queue outputs
   with a genuinely Motives-only job. Do not change unrelated review markers
   or trim queue outputs merely to make intake complete.
2. **GH.0 bounded review if authorized.** Read BDP §2.2 p.1060, §3.2 p.1067,
   the introduction p.1040 and Conrad appendix pp.1139–1140. Current
   `cm-product-good-model`, `p-adic-abel-jacobi-map` and
   `finite-local-abel-jacobi-class` require the unramified local field and
   supplied smooth proper models for both factors/product. The conductor
   application is distinguished from arbitrary ramified twists. Check their
   actual Lean/API contracts and retain prior review history.
3. **Kato bounded review if authorized.** Findings /2–/7 largely survive in
   the present owner: twist `k−r`, linear Euler factors, filtration steps with
   upper endpoint `i≥k`, twist before specialization, dual restriction limit,
   and divisor pushforward. A real source-match discrepancy remains:
   `L1/hecke-and-diamond-equivariance-of-the-moment-map` and
   `REV-KatoEulerSystems~2` attribute `n^(r−1)` to Lemma 8.8(1), printed p.185,
   whose displayed formula is `n^(r′−1)`. I checked the page image. Either
   restore a justified source-faithful contract or derive the intended
   normalization and record a source issue; do not conflate r and r′. The
   two diamond exponents and determinant factor are separate from this
   Hecke discrepancy. Record a needs_changes verdict if it cannot be resolved.
4. **Reader refresh by an authorized editor.** Transfer the new period-torsor
   witnesses/proof/acceptance, formal-period page locator, later period-point
   annotations and current reconstruction review/status. All six supplier
   statements occur in the reader, but literal synchronization is incomplete.
5. **Keep separate supplier/consumer obligations.** C5 must construct the
   typed comparison of arbitrary pairs. PS.2 owns integration/evaluation:
   import `P=P_eff[L⁻¹]`, extend by `ev(L)=2πi≠0`, identify the typed period
   point and retain inverse and polynomial/Laurent tests. The atlas's PS.2
   wording remains a maintainer edit. The geomlanglands review's relative
   reconstruction gap is not cleared by this run.

Public source URLs and exact mathematical locators are in the review report.
Sources were read only in disposable scratch, with no passages copied into
the deliverables. No build or modification was made in either upstream
checkout. No manual promotion, merge, issue closure or label change was made.
