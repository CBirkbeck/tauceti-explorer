# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-nnFZhT`, 10 October 2026.

The assigned independent review is complete, with **accepted** as its
bounded verdict. Read
[the review report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md) for each of the
eight findings, fresh public-source locators and download hashes, ownership
checks and the limits of the verdict. This session did none of the work
reviewed and claimed no second job.

The packet's only changes are `review` and `reviewHistory`. The exact prior
top-level algebraic-geometry verdict is archived. Mathematical fields,
all 22 gaps and 16 requests, partial coverage and implementation status
remain unchanged. The suggested file and reader were not edited.

Checks completed:

- Packet checker at the pinned declaration index: 0 errors, 0 warnings.
- Full suggested file via `lean-check`: exit 0, 805 admitted-proof warnings,
  no errors or other Lean warnings. Mathlib pin
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; file SHA-256
  `f3874f8f0eb1355d40433cbef95f0cff7bd9d1165822483985bd9529fbfcb51f`.
- Parsed preservation check, whitespace and submission file-scope checks.

There is no unfinished work for this review. The following obligations belong
to other authorized jobs or the maintainer, and this verdict leaves them open:

1. **Kato source-match follow-up.** The current accepted Kato blueprint's
   `L1/hecke-and-diamond-equivariance-of-the-moment-map` and its later review
   `REV-KatoEulerSystems~2` attribute `n^(r−1)` to Lemma 8.8(1). The fresh
   published page image, printed p.185, has `n^(r′−1)`, as the original
   verified finding /3 recorded. This is a discrepancy between the later
   owner and the source, not an applied Motives correction. Its owner must
   check the normalization derivation: either restore a source-faithful
   contract, or justify the mathematical replacement and record the printed
   formula as a source issue. Do not silently conflate `r` with `r′`.
   Public source: [Kato, Astérisque 295](https://www.numdam.org/item/AST_2004__295__117_0.pdf),
   Lemma 8.8(1), p.185. I did not edit or re-review that owner packet.
2. **PS.2 consumer.** Import the MC.5/MC.6 effective and localized Nori
   category/algebra contracts. State `P=P_eff[L⁻¹]`, extend integration using
   `ev(L)=2*pi*i≠0`, compare localized `P` with the full torsor and identify
   integration with the typed comparison point. Keep inverse and rank-one
   polynomial/Laurent tests. The atlas PS.2 stage wording remains a
   maintainer correction outside these deliverables.
3. **Relative comparison.** C5 must supply `PeriodComparison` for arbitrary
   pairs, with pullback, connecting-map, unit and product laws; SF.2 supplies
   the geometry, relative products and rank-one Tate calculation. The
   contracts are explicit, their construction remains requested.
4. **Reader refresh.** An authorized reader editor should refresh the
   displayed review/history and later packet annotations. All 182 headings
   and the six supplier nodes' substantive repaired contracts are present;
   the reader already explains Tate one-dimensionality. It does not yet
   name the later `gm_finrank` witness in the two new packet annotations.
   The report records the broader literal-string differences without
   claiming full present-day synchronization. This review's deliverables
   exclude the reader.
5. **Separate reconstruction review.** #5161,
   `REV-FIX-RT-AREA-geomlanglands~2`, remains responsible for the nine abstract
   reconstruction nodes and their 39 comment-only API/test names. Preserve
   its pending obligation and the inherited Basic Lemma, Artin/Tate,
   cellular realization, coboundary-product and universal-property gaps.

Public sources were read in disposable scratch; no source passages or
private filesystem paths are included in the deliverables. No upstream
checkout was edited or built. No manual promotion, merge, issue closure or
label change was made. The one PR submits this completed review.
