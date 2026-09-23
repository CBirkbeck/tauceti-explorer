# REV-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23

Independent review of the extraction of Bary-Soroker–Koukoulopoulos–Kozma, *Irreducibility of
random polynomials: general measures*, Inventiones Mathematicae **233** (2023), 1041–1120
(doi 10.1007/s00222-023-01193-6; arXiv 2007.14567).

Issue [#1249](https://github.com/CBirkbeck/tauceti-explorer/issues/1249). Reviewer: Claude Code,
session cc-d67081, 23 September 2026. The extraction under review is the checkpoint of Codex
(codex-a71f92, [#1905](https://github.com/CBirkbeck/tauceti-explorer/pull/1905)) completed by
Claude Code session cc-442dc5 ([#2058](https://github.com/CBirkbeck/tauceti-explorer/pull/2058));
neither is this session.

**Verdict: accept.** All seven routes accepted. No item, status, route or locator changed.

## The source

[arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3), re-fetched on 23 September 2026 and
hashed to `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1` — **the recorded
hash, byte for byte**. An arXiv PDF is not stamped per download, so unlike a publisher's copy
this record is reproducible, and I could confirm it rather than substitute a text-layer hash.
65 pages; **printed page = PDF page**, checked against the running heads on the even pages
(2, 4, …, 64). arXiv marks v3 "Final version, to appear in Inventiones Mathematicae"; the
published text is paywalled and was not seen, as the extraction says, so every verdict below is
about v3.

## Mistakes in the paper

All **25** recorded findings were checked at their locators. **All 25 are confirmed.** One more
was found and added as **E26**.

### Settled by the paper contradicting itself

These six need no judgement — the paper prints both readings:

| id | one place | the other |
|----|-----------|-----------|
| **E1** | Theorem 7, p. 13: "`A(T)` has **no** divisors of degree ⩽ θn … ⩽ C₁n^(−c)" | its proof, p. 14: "`A(T)` **has a** divisor of degree ⩽ min{θ,½}n ⩽ Cn^(−c)" |
| **E3** | Corollary 2, p. 5: "in the setting of **Theorems 1-5**" | Theorem 6, eighteen lines above: "In the setting of Theorems **1(a) and 3-5**" |
| **E9** | p. 53: the small-divisor term is `O(n^(−2/5))` | Proposition 2.1, p. 8, invoked two paragraphs earlier: `≪ n^(−7/20)` |
| **E14** | Lemma 9.2, p. 43: "Fix θ ∈ (0,1) and C₁, **C₂ ⩾ 3**" | its application, p. 49: "take the **C₂** of Lemma 9.2 **to be 2**" |
| **E23** | Lemma 9.2(b), p. 44 and p. 48: `e^(−(t log t−t+1)L)` | p. 49: `e^((−t log t−t+1)(log m+O(1)))` |
| **E25** | Lemma 3.1, p. 18: `𝒩 ⊂ [−N^(log log(100N)), …]` | its proof, two lines later: "if `𝒩 ⊂ [−N^(log log(3N)), …]`" |

E1 is the most consequential of them: as printed, Theorem 7 says that a random polynomial almost
surely **has** a small divisor, which contradicts Theorem 1(a), deduced from it. The proof is
correct; only the statement lost the negation.

### Refuted by counterexample

- **E2.** Theorem 8(b), p. 16, asks only for "an integer P ⩽ n^(1/4)", while its own heading says
  "modulo four primes" and Theorem 7(b), p. 13, spells out "that is the product of four distinct
  primes" — which the proof needs, since it applies Theorem 7. With **P = 1** no pair has QR = P
  and Q > 1, so condition (b) is vacuous; take μ₀ = δ₋₁ and μⱼ = δ₀ for j ⩾ 1. Condition (a)
  holds, a₀ ≠ 0 holds, and the only polynomial in the support is **Tⁿ − 1**, divisible by T − 1
  and with abelian Galois group. The theorem as printed is false.
- **E7.** "Then the prime p divides `I_ℓ(N)` … and thus `|I_ℓ(N)| ⩾ p > p₀`" (p. 21) fails when
  A(N) = 0, and that happens inside the lemma's own range: for 𝒩 = {−2,−1} (so N = 2) and
  A = Tⁿ − T^(n−1) − ⋯ − T − 2, A(2) = 2ⁿ − (2ⁿ − 2) − 2 = **0**. The repair is minimal, and the
  paper supplies its own justification: A ↦ A(N) is injective on each slice, so one polynomial per
  slice is discarded.
- **E13.** All three parts hold. f(x) = x(x−3) on {1,2,3} takes the values −2, −2, 0, so the
  uniform measure on the **set** 𝒩 gives −2 mass ½ while the displayed identity returns ⅔ (it
  computes the push-forward); f(x) = 5x with Q = 5 has all five residues as roots, against
  `d^ω(Q)` = 1; and at d = 1 the bound needs `Q^ε ⩾ 4`, false at Q = 2.
- **E17.** The Hölder step in Remark 2.2(b) bounds `Σ|μ̂|^(2s)`, not `Σ|μ̂|^s` — taking f = g = |x|^s
  in Hölder, or λ = 1/u in Lyapunov, both land on u⁻¹·us + v⁻¹·vs = 2s — and since |μ̂| ⩽ 1 the
  printed inequality is the stronger one. It is also false. Take P = 210 and μ uniform on
  {1,…,210} weighted ¾ on the even and ¼ on the odd residues, so |μ̂(j/210)| is 1 at j = 0, ½ at
  j = 105 and 0 elsewhere; the binding divisor is Q = 2 and **γ(s) = 1 − log₂(1 + 2^(−s))**. Then
  γ(1) = 0.41504 < γ(2) = 0.67807, so γ(s) ⩾ γ(us)/u + γ(vs)/v fails at s = 1, u = v = 2, and
  θ(1) = 0.41504 < 2θ(2) = 0.67807. The extraction's replacements are right: γ non-decreasing, θ
  non-increasing (which **is** the "θ is a decreasing function" the paper wanted) and γ concave.

### Recomputed rather than believed

Three numerical claims were redone from scratch.

1. **E20, Table 1 (p. 19).** α(s,γ;210) < 1 holds exactly when γ < γ(s). Recomputing γ(s_N) over
   all 24 divisors Q > 1 of 210 and all shifts reproduces the extraction's list **exactly**: the
   printed γ exceeds γ(s_N) for **N = 2, 10, 11, 12, 13, 14, 17, 18, 21, 22, 26, 27, 28, 33, 34**,
   and there α lies between **1.0000030** (N = 26) and **1.0000276** (N = 11). So the table's
   claim fails for 15 of its 33 rows — the printed values are γ(s_N) rounded to nearest, and
   rounding up is what breaks them. All 33 truncated γ(s_N) recorded in item /132 match mine to
   the last digit.
2. **E20, the ±1 case (p. 22).** The paper's γ = 0.500019700732702471… **is γ(735) itself**: at 60
   decimal digits γ(735) = 0.5000197007327024714749…, where α = 1 exactly, while Theorem 7 asks for
   `⩽ (1 − n^(−1/10))·Q^(1−γ)`, strictly below. The fix costs nothing qualitatively, but I have
   recorded the margin: −log(1 − γ(735)/735) = 0.00068053042086…, so the **δ = 0.00068053** of
   Theorem 3.5 survives by 4.2·10⁻¹⁰, and the printed δ therefore needs n large enough that
   n^(−1/10)/log 1155 < 3.1·10⁻⁷. Theorem 3.5 permits that: its n₀ depends only on P.
3. **Item /47.** max α(210) over N ⩾ 35 is **0.992105 at N = 35**, matching the certificate, and
   α² = 0.984273 < 997/1000.

### The two gaps with repairs, checked

- **E12 (Lemma 12.9, p. 63)** is a real hole and the repair holds. E₁ constrains only pairs of
  parts **both ⩽ n/4**; in Cases 2b and 3 the companion cycle lies in a union of blocks that can
  be all of [n], so its part k is unbounded and "contradicts our assumption that ρ ∈ E₁" is
  unlicensed. The repair: a cycle meeting r′ blocks of one block orbit has length divisible by r′,
  so two long parts sharing an orbit would have gcd ⩾ r′ > n^α with both ⩽ n/4, against E₁ — the
  orbits are therefore disjoint; at most three cycles exceed n/4 and at most one long part falls in
  Case 2a, so five long parts in Case 2 and four in Case 3 leave one whose companions are all
  ⩽ n/4, where the printed argument runs verbatim. The strengthened E₅ is free: the proof of
  Lemma 12.6 (p. 61) bounds P(B₅(r)) through `Σ f_r(k) ⩽ t·L_r` with L_r ≍ 2α(1−1/r)log n → ∞, so
  raising the threshold from 1 to 4 is swallowed and the bound is unchanged.
- **E18 (Theorem 4, p. 23).** Coefficients k^d reach H^d, so Theorem 7(a) needs n ⩾ (d log H)³, not
  the printed (log H)³. The repair (item /131) checks out on its exponents: with H = exp(Cn^(1/3))
  the Dobrowolski prime is p ≪ Cn^(1/3)(log n)³, so P(D|A) = exp(−Ω(n^(17/30)/(C(log n)³))) against
  #𝒟(n^(1/10)) ⩽ exp(O(Cn^(8/15))), and **17/30 > 8/15**. With C = d this restores Theorem 4 as
  printed, n₀ being allowed to depend on d.

### New: E26

In Case 1 of the proof of Lemma 12.9 (p. 63) the paper prints

> … it follows that ρ too must possess a subset U of its parts such that **Σ_{u∈U} = nr′/r**.

with the summand dropped, one line after printing the parallel construction correctly as
"Σ_{v∈V} v = nr′/r". It must read Σ_{u∈U} **u** = nr′/r, which is what E₂ (Lemma 12.3) is about.
Read on a **rendered page image**, not only in the extracted text layer — a dropped character is
exactly the artefact a text layer invents. Affects nothing; recorded with verdict `confirmed`.

## Items, statuses, routes

**133 items: 15 library, 3 planned, 115 missing.** All **22** cited declarations were opened at
the pinned commits (Mathlib `082e2d3`, Tau Ceti `f790474`) and each says what its item claims. Two
worth singling out:

- `TauCeti.isPretransitive_iff_irreducible` carries the hypothesis `p.Separable`, and its
  doc-string gives **the same counterexample as finding E16** — "over `ℚ` the polynomial
  `(X ^ 2 - 2) ^ 2` is reducible, yet its Galois group acts transitively on its two distinct
  roots." The library and the finding corroborate each other.
- `NumberField.exists_isArithFrobAt_int_of_liesOver` indeed has **no unramified hypothesis**, which
  is what item /97 and route 2 rest on.

The claimed absences hold at the pins: no prime number theorem (Tau Ceti has the smoothed
Wiener–Ikehara asymptotic and Chebyshev machinery, but not π(x) ~ x/log x), no large sieve, no
Mertens estimates (the single Mathlib hit is the unrelated Dedekind–Mertens lemma), no Brun sieve,
no Dobrowolski, no Łuczak–Pyber. Nothing in the atlas owns random polynomials of growing degree or
random partitions.

**Structural checks I ran myself:** 133 unique ids; every missing item routed **exactly once**
(the three planned items are also routed, to the layers that plan them); all prerequisites
resolve; the prerequisite graph is acyclic; all 40 definitions carry ≥ 3 API contracts and ≥ 3
tests. All 17 cited stage ids exist. Both proposed roadmap ids are free, and both Part II titles
are **exact prefix extensions** of their parents'.

All seven routes accepted; the reasons are in the `.review.json`. Two points deserve repeating
here.

- **Route 2 does not re-plan a Tau Ceti roadmap.** Upstream layer 5 states that
  `IsGoodPrime f p` (`p ∤ disc f`) "is the hypothesis of everything below" and that where "a factor
  can repeat … no theorem below applies". Item /100, the merging cycle type at a **possibly
  ramified** prime, is exactly the excluded case. "Importing its layers 0, 1, 5 and 9" is not a
  typo: the upstream numbering runs 0–6 and then 9.
- **Route 1's boundary is independently corroborated.** PAPER-SKOROBOGATOV-SOFOS-23 closes its
  gate G10 by keeping "fixed-degree Schinzel averages separate from the growing-degree
  `ArithmeticStatisticsPartIIRandomPolynomials`" — a second paper, worked by another agent, expects
  this Part II to own precisely this material.

## Corrections made in place

1. All 25 findings carry a `review` verdict; **E26** added with mine.
2. `verification.structural` still said "112 missing items" — the checkpoint's count, from before
   items /131–/133 were added. Corrected to **115**, with a note saying why.

Everything else is byte-identical to the merged file: `source`, `summary`, `items`, `routes`,
`prerequisites`, `baseline`, `completionGates`, `coverage`.

**One thing left alone, deliberately.** Item /103 still calls itself a gated target whose
acceptance requires the large-part argument of E12, while the report's *Repairs* section presents
E12 as repaired. I did not reconcile them: the conservative reading is the honest one, because the
repair is a worker's and not the paper's, and /103 is right to say so. A reader should follow it to
items /108, /113 and /117.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **3 files, 0 problems**
- **No Lean was written or compiled.** API names and tests are planning contracts.
