# REV-PAPER-DING-25 — review of the extraction of Ding, "p-adic Hodge parameters in the crystabelline representations of GL_n"

Job: #1441. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-DING-25.result.json`, by session cc-442dc5.

**Verdict: accept.** Nothing needed correcting in place. All 24 recorded mistakes are
confirmed, and one point about a shared Part II title is referred to the maintainer.

## What I read

Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*,
Publ. Math. IHÉS **142** (2025), 1–74; doi:10.1007/s10240-025-00156-2.

The published open-access Centre Mersenne PDF, re-fetched and hashing to
`741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` — matching the record —
74 pages, into scratch only. Printed page = PDF page, as the source block states.

No later version or erratum corrects anything below: arXiv 2407.21237 stops at v2 and
Crossref's DOI record carries no `update-to`, `updated-by` or relation entry (checked 23
September 2026).

## The eleven verified in full

Several are settled by arithmetic or by the paper contradicting itself.

### E1 — the paper's own count decides it

Page 38 prints the index set of (3.12) as `I ⊂ {1,…,n−1}, #I = i`, and asserts in the same
proposition

    dim_E Ext¹(π_alg(φ,h), π₁(φ,h)) = n + (2ⁿ − 1)d_K.

Page 35 says `π₁(φ,h)` is built as an extension of `⊕ C(I,s_{i,σ})` with **"(2ⁿ − 2)d_K
constituents in total"**. I checked both counts exactly:

| n | `I ⊂ {1,…,n}`: Σ C(n,i) | `I ⊂ {1,…,n−1}`: Σ C(n−1,i) |
|---|---|---|
| 3 | 6 = 2³−2 | 3 = 2²−1 |
| 4 | 14 = 2⁴−2 | 7 = 2³−1 |
| 5 | 30 = 2⁵−2 | 15 = 2⁴−1 |

So the stated constituent count **and** the stated dimension
(`n + d_K + (2ⁿ−2)d_K = n + (2ⁿ−1)d_K`) both require `I ⊂ {1,…,n}`; the printed index set
would give `n + 2^{n−1}d_K`. The index set is what is wrong, since the dimension is what is
used afterwards — Corollary 3.25 on p. 51 carries the matching exponent
`(2ⁿ − n(n+1)/2 − 1)d_K`.

### E2 — the sum cannot be direct

Page 49 prints `(3.43): Hom(T(K),E) ≅ ⊕_{j=1}^{n−1} Hom(Z_j(K),E) ⊕ Hom(Z(K),E)`, with `Z_j`
described on the next line as the centre of `L_j`, the Levi of the maximal parabolic `P_j`.
That makes `Z_j` a two-dimensional torus, so `dim_E Hom(Z_j(K),E) = 2(1+d_K)` and the right
side has dimension `(2n−1)(1+d_K)` against `dim_E Hom(T(K),E) = n(1+d_K)`:

| | LHS | RHS |
|---|---|---|
| n=3, K=Q_p | 6 | 10 |
| n=3, d_K=2 | 9 | 15 |
| n=4, K=Q_p | 8 | 14 |

Never equal. The replacement — that `Hom(T(K),E)` is **spanned** by the images — is what the
proof uses and states four lines later, and is true.

### E13 — the corrected arithmetic is exact

    2(1 + (n²−n+1)d_K) − (1 + (n²−2n+2)d_K)
      = 1 + (2n²−2n+2 − n²+2n−2)d_K = 1 + n²d_K ✓

matching the assertion, and matching Corollary 2.33's intersection dimension
`1 + (n²−2n+2)d_K`. Only the bracketing is wrong in print (note `n(n−1)+1 = n²−n+1`, so the
summands are unchanged).

### E18 and E20 — the paper against itself

**E18.** Page 40 defines the blocks with the offset: `h^i := (h_{n₁+⋯+n_{i−1}+1}, …,
h_{n₁+⋯+n_i})`. Three lines below, the `n_i = 1` case prints
`φ_{n₁+⋯+n_{i−1}} z^{h_{n₁+⋯+n_{i−1}}}` — the `+1` dropped in both subscripts.

**E20.** Page 38 line 15: "Schraen's spectral sequence [58, Cor. 4.9] and **[31**, Lem.
2.26]". Five lines later, same page: "using **[32**, Lem. 2.26]". The same lemma, two
reference numbers.

### E10, E9, E16, E3, E4, E6

- **E10.** p. 63 prints "the universal extension of `π₁(φ,h)` by `π_alg(φ,h)`", reversed
  against the convention Corollary 3.25 fixes (`π_min(D)` is the universal extension of
  `π_alg(φ,h)^{⊕…}` by `π₁(φ,h)`, and (4.8) identifies `π_min(D)` with `π̃[m_{A_D}]`).
- **E9.** p. 56: "Similarly, replacing `D_σ` by `D′_σ`, we obtain `L ≅ L(D_σ, D_{1,σ},
  C_{1,σ})`" — a sentence that replaces `D_σ` and then concludes with `D_σ` unchanged is
  vacuous.
- **E16.** p. 20 bounds the Hodge–Tate–Sen weights of `D ⊗ D^∨` by `i,j = 1,…,r`; `D` has
  rank `n`, and `r` is the number of parabolic blocks elsewhere in that section.
- **E3.** Settled on a page image, since it turns on whether the summation carries `σ ∈ Σ_K`.
  It does — so `|λ|` is a single integer, while p. 9 defines `z^k` **only** for a tuple
  `k ∈ Z^{Σ_K}`. The tuple reading is the only one under which
  `∧ⁿD ≅ R_{K,E}(χ_D ε^{−n(n−1)/2})` can hold, and the two readings coincide exactly when
  `d_K = 1`.
- **E4.** `Hom_{T(Q_p)}` is printed twice on pp. 34–35 where `T(K)` is the group acting;
  every parallel statement in the paper prints `T(K)`.
- **E6.** Printed as quoted at p. 19; the correction from `− n` to `+ n` follows the
  extraction's use of Proposition 2.13 and (2.14)/(2.16), which I did not re-derive.

## The remaining thirteen

For E5, E7, E8, E11, E12, E14, E15, E17, E19, E21, E22, E23 and E24 the quotation was
verified against the published text, but the correction follows the extraction's reading of
the surrounding argument. **Each of those verdicts says so explicitly**, rather than
implying a check that was not made.

## Items, statuses and routes

- **No library items**, which is right for this material.
- **18 planned items**, all naming atlas layers that exist.
- **138 missing items, routed exactly once each.**
- **No run-together numbering anywhere in the file.**
- **11 routes, all accepted**: four new/Part II and seven source additions. The reasons are
  specific about dependencies rather than generic — route 5 names Liu's Euler characteristic
  formula as the thing every dimension count in §2.3 instantiates; route 6 names `W⁺_dR`
  with its `Σ_K`-decomposition, "without which no 'partially de Rham' statement can even be
  formulated"; and route 11 says plainly that the eigenvariety of §4.2.2 is Emerton's and
  **not** built from overconvergent forms, routing it to `OverconvergentAutomorphicForms:O0`
  for the weight space alone. Disclaiming the part of a stage you are not using is exactly
  the right habit.
- **Three of the four proposed roadmaps are co-proposed** with byte-identical id, parent and
  title — `LocallyAnalyticRepresentationsOfLocalGroups` by three papers,
  `TriangulineVarietyAndItsLocalModel` by three,
  `LocalGlobalCompatibilityPartIIEigenvarietyCompanions` by two — so they are merges, and
  route 2's reason names the originating Breuil–Hellmann–Schraen proposal and the PR it was
  merged in. The fourth, `PadicHodgeParametersInLocallyAnalyticRepresentations`, is unique to
  this paper.

## One point referred to the maintainer rather than edited

The Part II title drops "over Q" from its parent's title ("Completed cohomology and p-adic
local–global compatibility **over Q**"), so it is not literally the "`<base>`, Part II: …"
form PROTOCOL 15 prescribes.

**Three papers now carry this title verbatim** — this one, PAPER-BREUIL-HELLMANN-SCHRAEN-19
and PAPER-NEWTON-THORNE-21. I raised the same point in
`REV-PAPER-BREUIL-HELLMANN-SCHRAEN-19` and take the same line here: editing one of three
would desynchronise the proposals and break the merge their agreement makes possible. It is
**one** decision for whoever merges them, not three.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DING-25.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
