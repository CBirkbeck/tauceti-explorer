# Independent review: ClassicalArithmeticCompletion, CA.2 follow-up

**Verdict: accepted.** The packet is a complete target-level pass over layer CA.2 (*Sequences and generating functions*). It plans what the accepted first pass left open, with one honest gap. Every node was verified or corrected in place. The reader and the suggested Lean file were brought into line with the corrections.

Job `REV-ClassicalArithmeticCompletion--CA.2`, issue #9675. Reviewer: Claude, session claude-xDS6Fs, 14 October 2026. The plan was written by session claude-ZmmAC5 (`BP-ClassicalArithmeticCompletion--CA.2`, PR #9694). This session wrote no part of it.

## Inventory

| Item | Count |
|---|---:|
| Nodes (definitions / construction / theorems / lemmas) | 20 (2 / 1 / 13 / 4) |
| Verified / corrected / added | 9 / 11 / 0 |
| API items / unit tests | 22 / 16 |
| Planets | 4 |
| Baseline declarations (confirmed / added / removed) | 65 (64 / 1 / 0) |
| Requests (before / after) | 2 / 1 |
| Gaps | 1 |
| Source findings (confirmed / rejected / new) | 2 / 0 / 0 |
| Frontier dispositions checked | 20 |

## Method

- **Sources.** All twelve PDF sources were downloaded again, and their SHA-256 hashes match those in the packet. DLMF §24.9 was read online. Every node was read at each of its locators. The eight sources that had no `sourceVersions` entry now have one.
- **Baseline.** Every one of the 65 declarations was looked up in the pinned index and found in its cited module. The statements that the proofs depend on were read at Mathlib 082e2d3 and Tau Ceti f790474:
  - Tau Ceti's `zsmul_point_eq_smulEval`, `isDvdSequence_normEDS`, `isEllipticNet_normEDS` and `normEDS_two_three_two_eq_id`;
  - Mathlib's `X_ne_zero_of_Z_eq_zero`, `nonsingular_zero`, `PowerSeries.derivative.ext`, `hasSum_zeta_nat`, `Ring.choose_neg`, `Nat.IsStrongDvdSequence` and the formal `sin`/`cos`.
- **Numbers.** Every numerical claim was recomputed with exact arithmetic:
  - the Eulerian identities, unimodality and Lawrence–Sawin's Lemmas C.1–C.5 for n ≤ 71, with brute-force descent counts for n ≤ 7;
  - Yu's Lemme 7.2.2 for 0 < |n| ≤ 40;
  - the p-free factorial split, including p = 0 and p = 1 under Lean's conventions;
  - both binomial factorisations, and the Luo–Zhu congruences with their exceptional case;
  - the discriminant formula Δ(E_{b,c,d}) = −D/(b⁴c³), at 500 random rational points;
  - every EDS example;
  - Ward's criterion. The 1552 sequences in the packet were rechecked, along with 3232 more: b, c ∈ [−12, 12], d ∈ [−6, 6], m, n ≤ 32. No coprime sequence fails, and no non-coprime sequence in the packet's range is strongly divisible.
- **Duplicates.** Current TauCetiRoadmap main and the current Tau Ceti library plan or build none of these objects. The pinned Mathlib has no Eulerian numbers and no formal derivative lemmas for `PowerSeries.sin` and `cos`. The library audit lists strong divisibility of EDS as missing.
- **Lean.** `lean-check` elaborates the corrected suggested file at the pins with exit 0. The only warnings are the 77 proof placeholders. A `run_cmd` audit of all 82 constants, with examples renamed to theorems, found no placeholder inside a statement or a definition body. Every packet API item, unit test and `library` declaration appears in the file.
- **Reader.** The reader is a node-by-node rendering of the packet. A renderer was written and checked: it reproduces all 20 node sections of the submitted reader byte for byte. The corrected packet was then rendered with it.
- **Checks.** `check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. `intake.py check-files` reports no problems. An in-memory `merge_blueprints` against `data/atlas.json` succeeds.

## Corrections

| Node | Change and reason |
|---|---|
| `reduction-filtration-of-an-integral-weierstrass-equation` | The node cited and requested Tau Ceti's EllipticCurves Layer 4 for Ê(𝔪) ≅ E₁(K) "from a minimal equation". The current EllipticCurves README plans that identification **for an integral model** in Layer 1, milestone (iv). The Layer 4 prerequisite and its request are removed. Proof steps 1 and 4 now name milestone (iv). What this node adds is the finer filtration E_k (AEC VII, Exercise 7.4). Streng's pages are corrected to 16–18: Lemma 2.3's proof is on p. 18, and the thesis's printed page is its PDF page minus four. |
| `eulerian-basic-identities` | Proof step (d) took Stanley's Proposition 1.4.4 with A_n(x) = Σ_j A(n, j)x^{j+1} at every n. At n = 0 Stanley sets A₀(x) = 1, not x. The step now uses 1.4.4 for n ≥ 1 and checks n = 0 directly. The Lawrence–Sawin locator gave p. 93 for the factorial sum, but that page only fixes the vanishing convention; the match now says which page states which fact. |
| `bernoulli-coefficients-do-not-decay` | DLMF (24.9.8) bounds (−1)^{n+1}B₂ₙ below by 2(2n)!/(2π)^{2n} · 1/(1 − 2^{−2n}). The packet printed the exponent as −2 − 2n and called this "the same lower bound". It is slightly stronger. The match and the proof step are corrected. |
| `eds-attached-curve` | Stange's Theorem 8 (p. 8) is stated over fields of characteristic zero and gives no explicit curve. The match now says so. The node's curve is justified by its own computation, over every field. |
| `formal-sine-cosine-identities` | `PowerSeries.derivative.ext` needs `IsAddTorsionFree`. For a ℚ-algebra this comes from the lemma (not an instance) `IsAddTorsionFree.of_module_rat`, now a prerequisite and a baseline entry. Stanley §1.6.1 reduces Proposition 1.6.1 to 2y′ = y² + 1 and asserts that sec + tan is its solution. The match no longer credits him with the trigonometric identities. |
| `division-polynomials-at-a-nonsingular-point` | Part (c), the coordinates (φₙ/ψₙ², ωₙ/ψₙ³) of n·P, is used by the good-primes theorem but had no Lean signature. `zsmul_some_eq_some_of_evalEval_ψ_ne_zero` is added to the suggested file and to the node's `library` list. |
| `ward-strong-divisibility` | `isEllipticNet_normEDS` was a prerequisite that no proof step used. A first step now uses it: normEDS satisfies the EDS recursion. Together with Silverman–Stephens §1, p. 3 (added as a source), this shows that Ward's recursively defined integral EDS are exactly the normEDS b c d. |
| `eds-zero-set-is-a-subgroup` | Silverman's Theorem 8 (p. 6) states the periodicity F_{kr+n} = a^{kn}b^{k²}Fₙ, not the zero set. The match now derives the zero set from it. |
| `eulerian-unimodal` | Stanley's pages: Exercise 1.49 is on p. 124, its solution on p. 177, and the solution of 1.50(e) on p. 178. The packet had pp. 123, 176 and 177. The source's `readSections` is fixed to match. |
| `p-free-factorial` | Yu uses the unit property f_p(p^α) ∈ ℤ_p^× on p. 72, so the locator now cites p. 72 as well as p. 71. |
| `eulerian-numbers` | The degenerate unit test had the same name, `eulerian_zero_zero`, as an API lemma, but it states the row sum at n = 0. It is renamed `sum_eulerian_zero` in the packet and in the Lean docstring. |

Packet-level changes:

- **Requests.** One request remains: to EllipticCurves Layer 1. It now names milestones (i), (iii) and (iv).
- **Upstream note.** The old note said Layer 4 should drop minimality. It is rewritten: Layer 1 (iv) already covers integral models. The finer filtration E_k is not named upstream. A remark on E₁ of a nonminimal equation would prevent a mismatch with Layer 4's kernel of reduction.
- **Restructure.** The "wiring at assembly" entry now also adds the summability supplier that the p-adic-digit frontier disposition names, `NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one` with `IsUltrametricDist.nonarchimedeanGroup`, to the prerequisites of `p-adic-digit-expansion`. Both exist at the pin, but the first-pass node does not list them.
- **Gap.** The gap records the review's wider numerical check.
- **Source versions.** Eight `sourceVersions` entries are added.
- **Reader.**
  - The *Boundaries* paragraph and §7 describe the Layer 1 dependency correctly.
  - The site renderer (`src/markdown.js`) treats `_` after a non-ASCII character, as in `Σ_`, `ℤ_p` and `Λ_r`, as opening emphasis. Twenty-eight such underscores dropped characters on the site. Every underscore after a non-ASCII character is now escaped: 63 in all.

## Source findings

- **E1201: confirmed.** In arXiv:1611.06506v1, p. 16, the third line of the display in the proof of Lemma 4.6 carries p^α(n − 1) twice. The 2021 deposit has it once (Lemma 3.1, p. 6), and expanding the block product modulo p^{2α} gives the single factor.
- **E1202: confirmed.** Slide 1 of Silverman's 2007 ICMS lecture (PDF page 2) claims strong divisibility for every integral EDS with W₂W₃ ≠ 0 and W₂ | W₄. normEDS 1 (−6) (−6) meets those hypotheses but has gcd(W₃, W₄) = 6. The curve 37a, with W₃ = W₆ = −1, shows that the absolute value is needed.

No new mistakes were found. Two places in Lawrence–Sawin's proof of Lemma C.4 are loosely worded. The case split reads "r > √n" where the argument uses r ≥ r₀. The monotonicity is written at index r where it is used at r − 1. Neither changes a statement, and the packet's restatement already uses the intended forms, so neither is recorded as a finding.

## What was checked and stands

- **Lawrence–Sawin.** Lemmas C.1–C.5 match the source's statements and ranges.
- **Yu.** Lemme 7.2.2 and the two factorisations on p. 71 match.
- **Luo–Zhu.** Lemma 3.1 and its exceptional case match.
- **Streng and BLRN.** Both treat non-minimal integral equations, which is what the filtration node needs.
- **The good-primes theorem.** The argument is sound step by step.
  1. p ∤ bc gives a p-integral model on which P is nonsingular modulo p.
  2. Ayad's coprimality holds over 𝔽_p even when the reduced cubic is singular, because the Tau Ceti theorem behind part (b) has no hypothesis on Δ.
  3. Then x(nP) = φₙ/ψₙ², and the filtration applies.
- **The frontier.** All 20 dispositions were checked against the REV~2 and REV~3 assessments in the first-pass packet. Where a disposition names suppliers, they were checked against the pinned index and the first-pass prerequisites.
- **The AdditiveCombinatorics rescope.** It is correct. The roadmap is outside the 94, and AN.5's (log 2 + ε) bound implies the requested one.

## Questions for the orchestrator

1. **Assembly wiring.** At assembly, apply the `restructure` wiring entry. It adds the three supplier nodes of this packet, and the p-adic summability supplier, to the first-pass nodes they serve.
2. **CA.2 sub-layers.** The split proposal divides CA.2 into four sub-layers, CA.2a–d. Between them the two packets put ten planets on CA.2, which is more than one star shows.
3. **Ward's gap.** The gap is primes dividing W₂W₃, and singular attached curves. It needs either a public proof or a proof built from Stange's singular-reduction valuations. Ward's 1948 memoir would settle it. If the maintainer can clear a copy, a follow-up could close the gap.

## Tier

ClassicalArithmeticCompletion is in tier 5. The corrected packet's prerequisites point only to Mathlib, Tau Ceti, Tau Ceti's EllipticCurves Layer 1 and its own nodes. Nothing points upward.
