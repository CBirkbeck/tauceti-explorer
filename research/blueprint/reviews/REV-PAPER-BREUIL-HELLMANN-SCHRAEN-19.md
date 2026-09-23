# REV-PAPER-BREUIL-HELLMANN-SCHRAEN-19 — review of the extraction of Breuil–Hellmann–Schraen, "A local model for the trianguline variety and applications"

Job: #1457. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json`,
by session cc-442dc5.

**Verdict: accept.** Nothing needed correcting in place. All 11 recorded mistakes are
confirmed, and one point about a shared Part II title is referred to the maintainer rather
than edited.

## What I read

C. Breuil, E. Hellmann and B. Schraen, *A local model for the trianguline variety and
applications*, Publ. Math. IHÉS **130** (2019), 299–412; doi:10.1007/s10240-019-00111-y.

The published Numdam PDF, re-fetched and hashing to
`34ffd69795468054b4caab7847d5ae90393826c889b187397dbe53e16993967a` — matching the record —
114 pages, into scratch only. The source block's page map is correct and I used it
throughout: **printed page = PDF page + 298** (printed 299 = PDF 1, printed 412 = PDF 114).

No later version or erratum corrects anything below: arXiv 1702.02192 has only v1, and
Crossref's DOI record carries no `update-to`, `updated-by` or relation entry (checked 23
September 2026). The extraction had already gone further and searched the main follow-up
paper (Z. Wu, Ann. Sci. ÉNS 2024) for any correction naming BHS, finding none — a good
piece of diligence that I did not need to repeat.

## All eleven confirmed

Four are settled by the paper contradicting itself, which is the strongest evidence a
misprint can have.

### E2 — the genericity locus collapses as printed

Page 352 prints, exactly as quoted:

> Denote by `T₀ ⊂ T_L` the subset which is the complement of the `L`-valued points `z^k`,
> `ε(z)z^k` …, and by `T₀ⁿ` the characters `δ = (δ₁,…,δₙ)` such that `δᵢ/δⱼ ∈ T₀` for `i ≠ j`.
> **Equivalently `T₀ⁿ ⊂ T_Lⁿ` is the complement of the characters `(δ₁,…,δₙ)` such that
> `δᵢδⱼ⁻¹` and `εδᵢδⱼ⁻¹` are algebraic for `i ≠ j`.**

Negating the first definition gives: the complement of `T₀ⁿ` is the set of `δ` for which
`δᵢδⱼ⁻¹` **or** `εδᵢδⱼ⁻¹` is algebraic for **some** `i ≠ j` — the correction exactly. As
printed, with "and", the condition asks both at once; since `ε = N_{K/Q_p}|N_{K/Q_p}|` is not
algebraic, `δᵢδⱼ⁻¹` algebraic forces `εδᵢδⱼ⁻¹` non-algebraic, so **no** character satisfies
it, the complement is all of `T_Lⁿ`, and `T₀ⁿ = T_Lⁿ` — contradicting the sentence
immediately before. This matters: `T₀ⁿ` is the genericity locus on which §3 and §4 run.

### E4 — Lemma 5.2.4 is empty as printed

Facing pages, word for word:

- **Lemma 5.2.3** (p. 392): "For any `s ∈ Z_{≥1}` the `L`-vector space
  `Hom_{U(g)}(U(g)⊗_{U(b)} μ, Π^an)^{U_0}[m^s_{ε_sm}]` is finite dimensional **and we have an
  isomorphism** …"
- **Lemma 5.2.4** (p. 393): "For any `s ∈ Z_{≥1}` the `L`-vector space
  `Hom_{U(g)}(U(g) ⊗_{U(b)} μ, Π^an)^{U_0}[m^s_{ε_sm}]` is finite dimensional"

The second is the first assertion of the first, and nothing else. Its own proof gives the
general statement — "a direct consequence of Lemma 5.2.3, the left exactness of the functor
…, the fact that each simple object of the category `O` is a quotient of a Verma module and
that each object of `O` has finite length" is a dévissage proving finite-dimensionality for
an **arbitrary object `M` of `O`**, which is what §5.3 uses. The extraction's reconstruction
is right, and its aside that the printed sentence carries no full stop is correct too.

### E5 and E6 — the paper cites its own conventions against itself

**E5.** 2.2.1 is a **Proposition**: p. 311 prints "Proposition 2.2.1. — The projection
`V_w → U_w` induced by `π` is a geometric vector bundle", and it is cited correctly as a
Proposition on pp. 315 and 320. Only p. 313 calls it a Lemma. The typo on the same page is
printed as quoted: "As the `V_w` are pairwise disjoint **is also follows** that none of the
`X_w` is contained in another".

**E6.** Page 321 states the convention: "Recall that `P_{x,y} = 0` if and only if `x ⋠ y`
and that `P_{x,x}(1) = 1`" — `P` vanishes unless the **first** index precedes the second.
Page 323 then prints

> As `P_{w,w′}(1) = 0` unless `w′ ≼ w` and `P_{w₀w,w₀w′}(1) = 1`, it follows that the matrix
> `(P_{w₀w,w₀w′}(1))` … is also invertible

— the first factor without `w₀`, the second with it, **in the same clause**, and the matrix
at issue is the `w₀`-twisted one. With the convention, `P_{w₀w,w₀w′}(1) = 0` unless
`w₀w ≼ w₀w′`, which is equivalent to `w′ ≼ w` since multiplication by `w₀` reverses the
Bruhat order — precisely the triangularity the argument needs. So the missing `w₀`s, not the
relation, are the slip, exactly as the correction says.

### E3 — checked on a page image

Both the relation symbol and the (in)equality are single glyphs the text layer drops, so I
rendered the page. The Claim on p. 397 reads

    Hom_{U(g)}(L(ww₀·μ), Π^an_∞[m^∞_{r_y}])^{U_0}[m^∞_{ε_w,sm}] ≠ 0   if w_R ≼ w.

The extraction quoted it **exactly right**, including the `≠` and the `≼`, which
distinguishes it from the vanishing statement (5.15) higher on the same page. (I had
suspected a misquote from the text layer; the image settled it in the extraction's favour.)
The substance holds too: `y` ranges over the patched space, and its Weyl element is
introduced two paragraphs earlier as "`w_y ∈ ∏ S_n^{[F_ṽ:Q_p]}` **as we defined `w_R` in
(5.13)**", while `w_R` is defined only for a refinement `R` of the fixed global `ρ` and so
has no meaning for a general `y`. Step 4, immediately below, reads "Let `w` … such that
`w_y ≼ w`".

### E1, and E7–E11

**E1** is printed as quoted (p. 301, Remark 1.1: "We thank the referee for pointing out that
we forgot the assumption `ᵖ√1 ∉ F` in a first version of this paper…"). The extraction is
right that no correction to *this* paper is called for — it is the paper correcting its own
predecessors — and right to record it, since a roadmap built on those predecessors as
printed would carry a hypothesis set the authors have declared incomplete. A well-judged
entry.

**E7–E11** each bundle a principal element with one or two subsidiary ones. Every principal
element is confirmed against the published text:

| id | principal element, verified |
|----|------------------------------|
| E7 | (3.5) on p. 336 builds the filtration on `D_pdR(W)` and everything around it says `D_pdR`; the `D_dR(W)` inside (3.6) is a slip, and `D_dR(W)` is defined nowhere |
| E8 | p. 337 prints graded pieces "free of rank 1"; filtrations are defined on p. 336 as decreasing, exhaustive and separated, so `gr^i = 0` for `\|i\|` large and they cannot all have rank one |
| E9 | p. 361 prints `ξ_A = (A, W⁺_A, F_W, ι_A, α_A)`; `F_W` is defined nowhere, the deformed filtration being `F_{A,•}` |
| E10 | p. 375 prints `z^h : z ↦ ∏_{τ∈Σ} τ(z)^{h_{τ,i}}` with a free index `i` and one argument, although `z^h` is a character of `(K^×)^n` |
| E11 | p. 386 prints `Ŝ(U^p,L)_{m^S} := lim←_s S(U^p,O_L/m^s)_{m^S}`, whose right side the same page has already identified with the `O_L`-module `Ŝ(U^p,O_L)`, so `⊗_{O_L} L` is missing |

Where a **subsidiary** element rests on the extraction's reading rather than on a check of
mine, that verdict says so explicitly.

## Items, statuses and routes

- **No library items**, which is correct: nothing in this paper is in the pinned libraries.
- **12 planned items**, all naming atlas layers that exist, including two Tau Ceti roadmap
  layers (Borel–Weil/Bruhat and Verma modules) that route 1 relies on importing.
- **123 missing items, routed exactly once each.**
- **No run-together numbering anywhere in the file** — unusual, and welcome.
- **7 routes, all accepted**, and the best-evidenced this reviewer has seen. Route 2
  establishes that "trianguline" occurs in the atlas only as an adjective inside hypotheses
  and never as the geometric object `X_tri(r̄)`; route 1 names its near neighbours and says
  how each differs; route 7 quotes its target stage's own description. Both new roadmap
  names are free, and three other papers — PAPER-DING-25, PAPER-NEWTON-THORNE-21 and
  PAPER-DOSPINESCU-LEBRAS-17 — propose them with **byte-identical id, parent and title**, so
  these are merges rather than conflicts.

## One point referred to the maintainer rather than edited

The Part II is titled

> Completed cohomology and p-adic local–global compatibility, **Part II:** eigenvarieties,
> classicality and companion constituents

while its parent's title is "Completed cohomology and p-adic local–global compatibility
**over Q**". Dropping "over Q" means the title is not literally the "`<base roadmap>`,
Part II: …" form PROTOCOL 15 prescribes.

The omission may well be deliberate — this paper works over a CM field, not over Q, so
"over Q, Part II" would be misleading. **I did not change it.** PAPER-DING-25 and
PAPER-NEWTON-THORNE-21 propose this roadmap with the identical title, and editing one of
three would desynchronise them and break the merge that their agreement makes possible. The
decision — whether all three gain "over Q", or the parent's title is read with "over Q" as a
scope note — belongs to whoever merges them.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
