# REV-RT-PAPER-GHOSH-SARNAK-22

This is an independent verification of the red-team result `RT-PAPER-GHOSH-SARNAK-22`
against the paper extraction `PAPER-GHOSH-SARNAK-22`: Ghosh–Sarnak, "Integral points on
Markoff type cubic surfaces", Invent. Math. 229 (2022). Reviewer: Claude Code, session
`cc-c2c06b`, 30 September 2026, at repository revision `561b3632`. Issue #4159.

**Verdict: all nine findings confirmed.** These are 1–3 (medium) and 4–9 (low). Two pieces
of evidence need correcting: finding 1's table number and finding 2's "mentions neither
Ghosh nor Sarnak". A mis-stated step in finding 7 needs rewording. None of these changes a
conclusion or a fix.

## Independence

The extraction is by `cc-fb70e5` and its review by `cc-442dc5`. The red team's session is
the one its report discloses. I did none of `RT-`, `PAPER-` or `REV-PAPER-GHOSH-SARNAK-22`.

## Texts read

I downloaded arXiv 1706.06712 v1, v2 and v3 and Loughran–Mitankin arXiv 1807.10223v3. All
four SHA-256 hashes match the red team's `sourceVersions`. I read them with `pdftotext` at
the locators below. The Inventiones version is paywalled, so, like the red team, I scope
every finding to v3.

## The findings

**1 (medium): item 5's inequality is backwards. Confirmed.** §1(d) defines
`h±_M(k) = |F±_k(ℤ)|` and says that "otherwise `h_M(k) ≤ h±_M(k)`". v1 and v2 print the same
sentence. The smallest counterexample needs no computer:

- `(0, 1, 2) ∈ V_5(ℤ)`, so `h_M(5) ≥ 1`.
- `u₁² + u₂² + u₃² + u₁u₂u₃ ≥ 54` whenever every `u_j ≥ 3`. §8 says so itself: "the smallest
  value of the polynomial is 54". So `F⁺_5(ℤ) = ∅`.

The red team's general argument is also sound. In §4.1, genericity is used only to make the
brackets `2(k − 5) + (x_i² − 4)(x_j² − 4)` of (4.1) positive, and they are positive for every
`k ≥ 5` once `|x_i|, |x_j| ≥ 3`. The up-tree of an F⁺-root has all coordinates at least 3,
so it is closed under Γ. Hence the roots stay inequivalent, and an orbit through a point with
a coordinate in `{0, ±1, ±2}` contains none of them.

I wrote my own enumeration of every F⁺ value up to 100,800 and reproduced both counts: 7,105
exceptional `k ≥ 5` with `F⁺_k(ℤ) = ∅`, the last 100,792, and 7,630 generic Hasse failures.
The 7,630 is not in Table 4, which starts at K = 6,552,000. It matches **Table 3**: 12.97620%
of the 58,800 admissible k is 7,630. The fix (correct item 5; add E21, affecting nothing)
is right.

**2 (medium): the source routes never reached the blueprint issues. Confirmed.** The review
accepted all five routes, the paper is in `papers.json`, and
`make_queue.accepted_routes('PAPER-GHOSH-SARNAK-22')` returns the four source routes. The
generator would add them, but the bodies of #1025, #1040, #1030, #1021 and #1022 do not
contain "Ghosh". Their later update dates come from label events only: after 23 September,
#1025's timeline shows only claim, submit and release labels.

The ClassicalArithmeticCompletion packet marks CA.4 `source_decomposed`. Its fourteen Markoff
nodes are all at coefficient three. #3367 does carry route 5's brief, which imports
Ghosh–Sarnak's fundamental sets from CA.4. One correction to the evidence: the packet
mentions "Sarnak" ten times, always as Bourgain–Gamburd–Sarnak, and never cites Ghosh–Sarnak.

The fix has two parts:

- **Maintainer:** regenerate the queue and refresh the issue bodies.
- **Fixer:** reopen CA.4 coverage, record #3367 on route 5, and make the brief's CA.4 import
  conditional.

Apply this once, together with RT-PAPER-CHEN-24/5 and RT-PAPER-GAMBURD-MAGEE-RONAN-19/7.

**3 (medium): route 1 names CA.1 after RS-03 moved Gauss sums to FF.1. Confirmed.** RS-03
narrows CA.1 and names FF.1 as the supplier of Gauss and Jacobi conventions. Its acceptance
(`780df618`, 13:30 UTC) came after this extraction's review (`ee0136e2`, 12:11 UTC), whose
"no restructuring touches the other stages" was therefore overtaken. `mathlib:gaussSum_sq`
exists at the pin (`GaussSum.lean:222`) and gives `S_p(1)² = (−1/p)p`, so the fix's imports
are right.

**4 (low): the Fricke identity is planned twice, over different rings. Confirmed.** BelyiMaps
Layer 4 plans it for SL(2,ℝ) only. PAPER-CHEN-24/78 plans it "for any ring R" and routes it
to NonabelianLevelStructures, whose design job is pending. I re-ran the mitigating check
myself: Corollary 6.3's explicit solution satisfies the congruence in all 720 cases.

**5 (low): E11's version history is wrong. Confirmed.** Theorem 1.2(i) says `(log K)^{−1/4}`
in v1 and v2 and `(log K)^{−1/2}` in v3. Loughran–Mitankin's pp.2–3 made that correction in
print. Remark 1.3(a)'s "order of magnitude √K" is off by `(log K)^{1/2}` against their
Theorem 1.4.

**6 (low): the file has no `sourceVersions`. Confirmed.** Four source issues affect a stated
result. §18 requires the field, but only `check_errata.py` enforces it, which is why the
omission passed `check_paper.py`.

**7 (low): items 3, 4 and 10 lack cross-references. Confirmed.** The n = 3, a = 1 case of
GMR-19/1 is exactly V_k with its Vieta moves, and it is routed to the same layer, CA.4. The
finding's mod-3 step is misworded, since `1 + 1 + 1 ≡ 0`. The correct argument uses the
product:

- If some `x_j ≡ 0`, the product vanishes, so the sum of squares must vanish too, which
  forces every `x_j ≡ 0`.
- If no `x_j ≡ 0`, the sum of squares is 0 while the product is not, which is impossible.

So `3 | x`, and `x = 3y` is a Markoff triple, as the finding says.

**8 (low): two misprints in §10 and a partly vacuous hypothesis. Confirmed.** In v3, §10's
"Sec. 7" is the counting section, and v1's "Sec. 6" was the same section before renumbering.
§3 never mentions admissibility. In Proposition 8.1(ii), 3 ∤ ν leaves only ν ≡ ±4 (mod 9).
The instances below 50 are ν = 23, 31, 41, 49. `k = 1062` is a generic Hasse failure in my
enumeration.

**9 (low): the report's counts are stale. Confirmed.** The header should read 4/2/57 items and
20 source issues, the heading E1–E20, and the design job is superseded, not pending.

## Checks run

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-GHOSH-SARNAK-22.review.json`:
  ok.
- Independent computations: the F⁺ enumeration to 100,800, the Corollary 6.3 check (720 cases)
  and the Proposition 8.1(ii) residues.
- No Lean was compiled. None belongs to this job.
