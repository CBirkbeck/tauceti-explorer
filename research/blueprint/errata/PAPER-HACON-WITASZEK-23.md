# Mistakes in Hacon–Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*

Job ERRATA-PAPER-HACON-WITASZEK-23. Worker: Claude Code, session `cc-7b31c4`, 23 September 2026. The
findings are in `PAPER-HACON-WITASZEK-23.json` beside this file: **11 findings — 7 misprints, 3 errors and
1 gap; 7 reach nothing, 1 reaches a proof and 3 reach a stated result.**

**Paper and versions.** Christopher Hacon and Jakub Witaszek, *Forum of Mathematics, Pi* **11** (2023),
e10, 1–35, DOI [10.1017/fmp.2023.6](https://doi.org/10.1017/fmp.2023.6). The extraction
`PAPER-HACON-WITASZEK-23.result.json` (complete, 163 items, three checkpoints ending with Codex
`codex-c83e7a`) read **all 35 pages of the published version**, sha256 `d7ba34ec…`, inspecting pp. 13, 17,
20, 29, 30 and 33 as images, and recorded the eleven findings against it.

**What this job could and could not re-check.** The published PDF could not be re-fetched on 23 September
2026: the Cambridge Core version-of-record endpoint returned HTTP 504 and then HTTP 404 on repeated
attempts, the core-reader view is rendered client-side and serves no body text, Unpaywall lists that same
endpoint as the only publisher open-access copy, and the DOAJ record returns HTTP 403. The published page
locators are therefore the earlier worker's, who did read them.

What could be done instead is a check against the **preprint**. arXiv:2009.02631 has two versions, and v2
(16 August 2021) is the latest; it predates publication by two years, and its comment records that it is
"a significantly changed version with the mixed characteristic case, and applications thereof, added". Its
LaTeX source (one file, 2145 lines, e-print sha256 `d1378136…`) was read at each of the eleven locators.
The result is recorded in each finding's `searched` list:

- **nine findings — E1 to E9 — are already present in arXiv v2**, verbatim, so they were in the preprint
  and survived into print;
- **two — E10 and E11 — are not in arXiv v2 at all.** The string "crys" does not occur anywhere in its
  source, and there is no point-counting or trace-formula argument there: the crystalline argument in the
  proof of Corollary 1.3 is material added between August 2021 and publication, so it can only be checked
  in the published version, where the earlier worker read it.

**Existing corrections.** None, so all eleven findings are new. Crossref registers no update, correction or
erratum against the DOI; arXiv stops at v2; the Cambridge article page links no correction.

## Effect on the main results

The paper's main theorems are the existence of the relative MMP for `Q`-factorial dlt fourfolds over a
perfect field of characteristic `p > 5` or a DVR of mixed characteristic `(0,p)` with `p > 5`, its
application to families over a DVR, and the liftability results for threefolds. **No finding refutes any of
them.** Three reach stated results, and each is a hypothesis that has to be added or strengthened:

- **E1 (error, Lemma 2.2).** The second paragraph takes `m` to be the Cartier index of `K_X` at a
  codimension-one point `P` of `S` and concludes that `mD` is Cartier for every divisor `D` near `P` and
  that `(K_X+S)|_S = K_S + (1 − 1/m)P`. Both fail for that `m`: on the `A₁` surface singularity
  `xy = z²` with `S` a ruling, `K_X` is Cartier, so `m = 1`, but `S` itself is not Cartier at the vertex
  and the different of adjunction is `P/2`. The right `m` is the **log** index, the Cartier index of
  `K_X + S` at `P`, which for a plt surface germ is the order of the local class group; with it both
  conclusions hold. Present in arXiv v2.
- **E2 (error, Lemma 2.16).** As stated — `ε`-lc excellent surface pairs whose minimal log resolution has
  at most `m` distinct discrepancies have finitely many discrepancies in total — the lemma is false: on the
  `A₁` surface with `C` a ruling and `B = bC` for `0 < b < 1/2`, the minimal resolution is a single
  `(−2)`-curve `E`, `K_{S′} + bC′ + (b/2)E = f*(K_S + bC)`, the pair is `½`-lc for every such `b`, `m = 1`,
  and the one exceptional discrepancy `−b/2` varies continuously. The fix is to fix a finite coefficient
  set `I ⊂ [0,1)` and require the coefficients of `B` to lie in `I` — which is what the proof of
  Proposition 2.15 needs anyway, since the boundaries along a flip sequence have coefficients in a fixed
  finite set. Present in arXiv v2.
- **E6 (error, Lemma 6.6 and Corollary 6.7(1)).** The global `Q`-Cartier statement fails without a
  neighbourhood or properness hypothesis: over `R = Z_p` with `p > 5`, remove the closed special vertex
  from `Spec R[x,y,z,w]/(xy − zw)`. The result is integral, flat, normal and excellent with smooth special
  fibre; the ruling `D = V(x,z)` restricts to a Cartier divisor on the special fibre and is Cartier away
  from the remaining closed generic vertex, yet it is not `Q`-Cartier there. The local deformation lemma
  must keep a neighbourhood of the special fibre, and its global application needs properness. Present in
  arXiv v2.

One reaches a proof:

- **E7 (gap, proof of Theorem 6.1(2b)).** The hypothesis is surjectivity of `N¹(𝒳/S) → N¹(X)`, that is of
  `Pic ⊗ Q` modulo numerical equivalence, which supplies divisors with `𝒜|_X ≡ A`, not line bundles with
  `𝒜|_X = A` on the nose. The repair is to work with `Q`-Cartier numerical representatives and to
  construct the effective boundary separately. The preprint contains both readings side by side: one
  passage writes `𝒜|_X ≡ A` and the one at issue writes `𝒜|_X = A`.

The remaining seven reach nothing. Two of them (E3 and E8) are sign slips in the same proof, and they are
worth separating because they have different sources: `C_i² = −r_ic_i` with `C_i² < 0` forces `c_i > 0`, so
"`−c_i ≤ 2/a_i`" is vacuous where "`c_i ≤ 2/a_i`" is what the displayed inequality gives and what the next
sentence uses, and "`c_2 = −2`" would make an exceptional curve on a minimal resolution have positive
self-intersection where `c_2 = 2`, i.e. `C_2² = −2r_2`, is meant.

## The eleven findings

- **E1** (error, reaches a stated result) — Lemma 2.2, second paragraph, published p. 5 (arXiv v2 Lemma 2.2,
  p. 6). **Printed:** "index of `K_X`". **Correction:** `m` should be the Cartier index of `K_X + S` at `P`,
  the log index; for the plt surface germ obtained by localising at `P` this is the order of the local class
  group, and the conclusions then hold. **Why:** the `A₁` counterexample above.
- **E2** (error, reaches a stated result) — Lemma 2.16, published p. 13 (arXiv v2 Lemma 2.16, p. 14).
  **Printed:** "all these discrepancies". **Correction:** fix a finite set `I ⊂ [0,1)` and require the
  coefficients of `B` to lie in `I`; the exceptional discrepancies over the minimal resolution then take
  finitely many values. **Why:** the `bC` counterexample above.
- **E3** (misprint, reaches nothing) — proof of Lemma 2.16, published p. 13 (arXiv v2 p. 15). **Printed:**
  `−c_i ≤ 2/a_i`. **Correction:** `c_i ≤ 2/a_i ≤ 2/ε`. **Why:** `C_i² = −r_ic_i` gives `c_i > 0`, so the
  printed inequality is vacuous; the displayed `−a_ir_ic_i ≥ −2r_i` gives the corrected one, which is what
  the next sentence uses.
- **E4** (misprint, reaches nothing) — proof of Proposition 2.15, the difficulty `d⁺_α`, published p. 12
  (arXiv v2, same passage). **Printed:** the first sum is over `b_i ≤ 0`. **Correction:** over `b_i ≥ 0`,
  which is [AHK07, Definition 2.3]'s index `a(B_i) ≤ 0` with `a(B_i) = −b_i`. **Why:**
  `W⁺_α(b) = Σ_{k≥1} w⁺_α(k(1−b))`, and for `b ≤ 0` every argument `k(1−b) ≥ 1 > α`, so `W⁺_α(b) = 0` and
  the printed first sum is identically zero — the difficulty would lose exactly the boundary term that
  drops when a flip changes `ρ`.
- **E5** (misprint, reaches nothing) — proof of Proposition 2.15, published p. 12. **Printed:** the four
  weight functions are declared on `(−∞, 1)`. **Correction:** `W^±_α` is defined on `(−∞,1)`, but the
  weights `w^±_α` must be defined on all of `R`, or at least on `(−1,∞)`, with value `0` above `α`, as in
  [AHK07, Definition 2.2]. **Why:** `w^±_α` is evaluated at `k(1−b) ∈ (0,∞)` inside `W^±_α` and at
  discrepancies `a_v ∈ (−1,∞)`, both of which can be `≥ 1`; the formula's own "otherwise" clause shows the
  intended value there.
- **E6** (error, reaches a stated result) — Lemma 6.6, published pp. 28–29, and the global `Q`-factoriality
  clause of Corollary 6.7(1), p. 29. **Printed:** "also `Q`-Cartier". **Correction:** retain a
  neighbourhood of the special fibre in the local deformation lemma and add properness for its global
  application; the unrestricted global statements fail. **Why:** the `Spec Z_p[x,y,z,w]/(xy−zw)`
  counterexample above.
- **E7** (gap, reaches a proof) — proof of Theorem 6.1(2b), published p. 33, the choice of `𝒜`, `ℋ`.
  **Printed:** `𝒜|_X = A`. **Correction:** use `Q`-Cartier numerical representatives, with restrictions
  numerically equivalent after rational scaling, and construct the needed effective boundary separately.
  **Why:** surjectivity of `Pic ⊗ Q` modulo numerical equivalence does not supply prescribed line bundles.
- **E8** (misprint, reaches nothing) — proof of Lemma 2.16, published p. 13, equality case in the convexity
  paragraph. **Printed:** `c_2 = −2`. **Correction:** `c_2 = 2`, equivalently `C_2² = −2r_2`. **Why:** the
  same proof sets `C_i² = −r_ic_i` with `r_i > 0`, and an exceptional curve on the minimal resolution has
  negative self-intersection.
- **E9** (misprint, reaches nothing) — proof of Theorem 4.3, published p. 17, last paragraph. **Printed:**
  "codimension two". **Correction:** the flip is an isomorphism in codimension one, equivalently off
  subsets of codimension at least two. **Why:** the lemma invoked at that step assumes equality on opens
  containing all codimension-one points; a small fourfold flip may change a codimension-two surface, so it
  need not be an isomorphism at codimension-two points, and the weaker standard property is what is
  needed.
- **E10** (misprint, reaches nothing) — proof of Corollary 1.3, published p. 20, the crystalline trace
  display. **Printed:** `H^i_crys(X/K)`. **Correction:** `H^i_crys(Y/K)` for the smooth proper resolution
  `Y` whose point count appears on the left. **Why:** the argument has already compared the point counts of
  `X` and `Y` modulo `q`, and the trace formula that follows computes `|Y(F_q)|`. Not in arXiv v2.
- **E11** (misprint, reaches nothing) — proof of Corollary 1.3, published p. 20, the sentence after the
  trace display. **Printed:** "all the slopes". **Correction:** the slope `≥ 1` assertion is for positive
  cohomological degrees; degree zero supplies the contribution `1`. **Why:** for a geometrically connected
  smooth proper `Y`, `H⁰` has Frobenius eigenvalue `1` and slope `0`, and including it would remove the
  very contribution that gives the congruence `1` modulo `q`. Not in arXiv v2.

## Method

The eleven findings were converted from the extraction unchanged: every `id`, `kind`, `affects`, `locator`,
`printed`, `correction`, `reason` and `known` is byte-identical, and the existing `searched` entries are
kept in order (checked by a script). What this job adds is one further `searched` entry on each, recording
the 23 September 2026 re-check of Crossref, arXiv and Cambridge Core, the failure to re-fetch the published
PDF with the exact HTTP responses, and the outcome of reading the arXiv v2 source at that finding's
locator. Nothing in the earlier work was edited.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-HACON-WITASZEK-23.json` reports no errors.
Only the two named deliverables change. No Lean file is part of an errata job and no formalisation is
claimed.
