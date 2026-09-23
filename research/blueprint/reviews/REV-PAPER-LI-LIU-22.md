# REV-PAPER-LI-LIU-22 — review of the extraction of Li–Liu, "Chow groups and L-derivatives of automorphic motives for unitary groups, II"

Job: #1385. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-LI-LIU-22.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. All 5 recorded mistakes are
confirmed, three of them decisively; two records were added to the source block.

## What I read

Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary
groups, II*, Forum of Mathematics Pi **10** (2022), e5, 71 pp.; doi:10.1017/fmp.2022.2. Open
access. **Printed page = PDF page**, which I confirmed against the running heads rather than
assuming (pdf 54 carries "54", pdf 55 "55").

No erratum: Crossref's DOI record carries no update or relation entry.

## A provenance problem

The source block's `sha256` is **not reproducible**. Cambridge stamps every page with the
download time. Two downloads on 23 September 2026:

| | |
|---|---|
| recorded | `0661582a…1fc0` |
| download 1 | `a6106215…64be` |
| download 2 | `041c8bb9…a896` |

I recorded `source.sha256Note` and a hash that **is** reproducible:
`publishedTextSha256 = 223a9e92de9b0189273ae69d7ad3ae554e485748200735275f45f38e87e052a8`,
the stamp-stripped `pdftotext` output, identical from both downloads.

## Three settled decisively

### E1 — the same formula, six times, two of them wrong

The expression `1 + q + ⋯ + q^j + (b₂ − ?)q^j` appears six times. On published **p. 27** it is
correct four times:

- the `∂Den(𝑳)` display,
- the sentence "the number of `L ∈ 𝔏` with `j(L) = j` … equals `1 + q + ⋯ + q^j + (b₂ − j)q^j`",
- the `|𝔏|` display,
- the `Int(𝑳) = ∂Den(𝑳)` display.

And it is wrong twice, at exactly the two places the finding identifies:

- **(2.17)**, p. 27: `length_{O_Ĕ} W_{x₁E,j} ∩ N(x₂) = 2(1 + q + ⋯ + q^j + (b₂ − **l**)q^j)`
- the following display, p. 28: `Int(𝑳) = length_{O_Ĕ} N(x₁) ∩ N(x₂) = Σ 2(1 + q + ⋯ + q^j + (b₂ − **l**)q^j)`

The summation index is `j` throughout, so `l` is the slip. Four `j` against two `l` in one
formula is about as decisive as this kind of evidence gets.

### E2 — the condition and its conclusion disagree on the same line

Published p. 35:

> ◦ If `(x,x)_𝑽 ∈ u^{e_i−1}O_F`, then `(b₁, b₂) = (a_i − 1, a_i − 1)`.
> ◦ If `(x,x)_𝑽 ∉ u^{e_i−1}O_F`, then `b₁ ⩽ a_i − 2`.

The condition is written with `e_i`, the conclusion on the very same line with `a_i`, so
`u^{a_i−1}` is meant in both conditions. The other half is p. 33's "satisfying `θ(x_i) = 1`":
`θ` lies in `U(𝑽)(F)` and acts on basis vectors, so `θ(x_i) = x_i` is meant. (That sentence also
drops a "be" after "Let θ", which the extraction does not record and which I have not added.)

### E3 — the text layer settles it

Lemma 2.15 on published p. 12 prints its summation range as

    L ⊆ L′ ⊆ L′𝑣𝑒𝑒

— the literal letters `v`, `e`, `e` in math italic where the dual `∨` belongs. This is not an
extraction artefact: every other superscript on the line renders normally. And p. 60 prints "For
`0 ⩽ h ⩽ g − 1`, we denote by `σ(i)` the sequence starting …", under a quantifier that
introduces `h` and puts no `i` in scope.

## E4 and E5

**E4** is confirmed as printed at p. 64: "Part (1) is proved in the same way as [LL21,
Proposition 8.1]. Part (2) is proved in the same way as [LL21, Proposition 9.1]." The substance
— that Proposition 4.27(2), and with it Theorems 1.4 and 1.5 and Corollary 1.7 whenever
`S_π ≠ ∅`, should carry Li–Zhang Conjecture 10.4.1 as a hypothesis because the cited proposition
does — rests on the extraction's reading of [LL21], which I did not fetch. I confirm that the
proof is a bare appeal with no hypothesis carried across, which is what makes this a gap rather
than a misprint.

**E5**'s locator repays checking, and is exactly right; the three passages differ, so it would
have been easy to get wrong. Published **p. 55** carries the admissibility bullet "for `i = 1,
2`, `s_i` is a product of two elements in `(S^R_{Q^ac})_{L_ℓ^R}`", while the set-minus form the
finding quotes appears in the two proofs, at **p. 57** and **p. 64**: "there exist elements
`s_{u1}, s_{u2} ∈ S^R_{Q^ac} ∖ 𝔪^R_π` such that …". The correction — that these should be taken
in `S^R_{Q^ac} ∖ 𝔪^R_{π^∨}`, and [LL21, Proposition 6.10(1)] quoted with `χ^R_{π^∨}(s)` — rests
on the extraction's analysis, which I did not re-derive.

## Items, statuses and routes

- **No library items**, right for this material.
- **3 planned items**, all naming atlas layers that exist.
- **81 missing items, routed exactly once each.**
- **6 routes, all accepted**: three Part IIs and three source additions.
  - All three Part II titles are **exact prefix extensions** of their parents' and all three
    names are free.
  - Two are large multi-way merges: `UnitaryRapoportZinkSpacesAndRSZModels` is proposed with
    identical id, parent and title by **five** other papers (HE-LI-SHI et al. 23, LI-LIU-21,
    LI-ZHANG-22-B, LIU et al. 22, ZHANG-21), and `UnitaryKudlaRapoportCycles` by **four**. That
    is convergence rather than conflict, and a sign the boundary between these roadmaps is drawn
    where the mathematics actually divides.
  - The source routes are specific about what the stage owns and what the paper adds — GN.3
    already constructs local representation densities and this adds the ramified hermitian case;
    MP.2/MP.3 own Weil-representation formulas and local theta modules; IG.5/IG.7 own the Igusa
    trace comparison and localized concentration, which is where Theorem 4.21 belongs.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-LIU-22.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
