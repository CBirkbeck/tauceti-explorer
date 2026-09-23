# REV-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 — review of the extraction of Böckle–Harris–Khare–Thorne, "Ĝ-local systems on smooth projective curves are potentially automorphic"

Job: #1469. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json`,
by session cc-442dc5.

**Verdict: accept.** No item, status or route changed. All 16 recorded mistakes are
confirmed, two of their sub-elements are annotated as corrected in publication, and the
source block is corrected.

## The main contribution of this review: the published text is available

The extraction recorded:

> v2 is the last arXiv version and is contemporaneous with publication in Acta Math. 223
> (2019), 1–111. **The published version could not be consulted (Acta Mathematica is not open
> access)**, so all readings and the recorded source issues are against v2.

That is not so. Unpaywall reports `doi:10.4310/acta.2019.v223.n1.a1` as **gold open access**,
and the publisher serves the full text at

    https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf

I fetched it — **111 pages**, SHA-256
`15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`, printed page = PDF page —
and re-checked every recorded mistake against it. The source block now carries a
`publishedVersion` record, and **published page numbers have been added to twelve locators**
that previously cited arXiv v2 pages only.

arXiv v2 was also re-fetched and hashes to
`ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9`, matching the record.

## The published text is not identical to arXiv v2

This matters, because the errata register records mistakes in **published** work.
Copyediting repaired at least two of the recorded slips:

| element | arXiv v2 | published |
|---|---|---|
| E14(b) | "applying **Theorem 90**" | "applying **Hilbert's Theorem 90**" (p. 88) |
| E16(b) | "correspond**enec**" | does not occur anywhere in the published text |

Both are annotated in place as slips of v2 only. **They are not mistakes in the published
work** and must not be counted as such.

## Everything else survives into print, several decisively

**E4.** Published p. 69 sets up the Taylor–Wiles places with "Q is a finite set of places
`v` of `K` such that `σ̄_m(Frob_v)` is regular semisimple", and p. 71 then reads

> the regular semisimple element **`ρ̄_m(Frob_v)`** ∈ Ĝ(k) is trivial; this is equivalent to
> the condition that the centralizer in Ĝ_k of **`ρ̄_m(Frob_v)`** is connected

— `ρ̄_m` twice, for the element the same passage calls `σ̄_m`.

**E8.** Published p. 34 prints

    h¹(Γ_{K,S∪Q}, ĝ_k) = r#Q = h¹(Γ_{K,S∪Q}, ĝ_k) + (r−1)#Q,

the **same group on both sides**, so as printed the identity forces `(r−1)#Q = 0`, false for
`r > 1`. The line immediately above supplies the intended reading: "the case `Q = ∅` gives
the equality `h¹(Γ_{K,S}, ĝ_k) = h¹(Γ_{K,S}, ĝ^∨_k(1))`".

**E14(a).** Published p. 87 prints "Proposition 11.2. Let `η : G → H` denote the adjoint
group of `G`", while the proof of Theorem 11.1 **on the same published page** has it right:
"Let `H` denote the adjoint group of `G` and `η : G → H` be the canonical isogeny."

**E12.** Published p. 7 gives the *local* Artin map the source `K^×` rather than `K_v^×`;
p. 14 puts a non-degenerate invariant symmetric bilinear form "on `G`" rather than on `𝔤`.

**E1** (p. 75), **E2** (p. 67), **E3** (p. 69), **E5**, **E6** (p. 65), **E9** (p. 35),
**E10(a)** (p. 31), **E10(b)** (p. 37), **E11(a)**, **E15**, **E16(a),(c),(d)** (p. 83) are
all present in the published text as quoted.

## Where this review stops

Several findings bundle four or five elements, and some turn on hats — `ĝ` against `g`, `Ĝ`
against `G` — that the text layer flattens. The extraction handled this properly: it lists
the pages it read as rendered images. Where I located only some elements in print, or where
the correction depends on one of those page-image readings, **the verdict says so
explicitly** rather than implying a check I did not make. That applies to parts of E9, E10,
E11, E12 and to E3, E6, E7, E13 and E15, whose corrections rest on the extraction's reading
of the surrounding argument.

**E5** is the only one of the sixteen classed as affecting the proof, and that is the right
classification: Lemma 8.15's hypothesis names `M` and `N` without introducing them, while
its proof begins "We therefore need show that for each proper standard parabolic `P = MN` of
`G`" — which I located in the published text — and Lemma 8.16 supplies the vanishing for
every proper `P`. As stated, the hypothesis concerns one unspecified parabolic and the
conclusion does not follow.

## Items, statuses and routes

- **No library items**, which is right for this material.
- **5 planned items**, all naming atlas layers that exist, across `FunctionFieldArithmetic`,
  `ReductiveGroupsPartII`, `SmoothRepresentationsOfLocalGroups` and
  `GlobalShtukasAndFunctionFieldLanglands`.
- **31 missing items, routed exactly once each.**
- **No run-together numbering anywhere in the file.**
- **5 routes, all accepted.** The single Part II,
  `GValuedDeformationsAndPotentialAutomorphy`, has a title that is an **exact prefix
  extension** of its parent's, its name is free, and no other paper proposes it. The four
  source routes go to stages that already own the relevant material.

  Route 2 is worth singling out: it records that this paper proves the integral reductive
  invariant theory of §3 **in a stronger form than the characteristic-zero statements that
  PAPER-LAFFORGUE-18 routes to the same stage**. Two papers feeding one stage at different
  generality is exactly where a later builder can go wrong, and saying so in the route reason
  is the right place to catch it.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
