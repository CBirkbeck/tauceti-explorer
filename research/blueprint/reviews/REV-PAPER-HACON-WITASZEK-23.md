# Review of PAPER-HACON-WITASZEK-23

**Job** REV-PAPER-HACON-WITASZEK-23 (issue #1370) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All nine routes accepted; all eleven `sourceIssues` confirmed; two
corrections made in place on route 7 and a source note added.

Paper: Christopher Hacon and Jakub Witaszek, *On the relative minimal model program for fourfolds in
positive and mixed characteristic*,
[Forum of Mathematics, Pi **11** (2023), e10, 1–35](https://doi.org/10.1017/fmp.2023.6).

## Source

The published Cambridge hash does not reproduce and cannot. A fresh download today gave
`32da0efb9d00570b929e2b5db0f9272145381cc15b84af2c4503ce7b94d06088` against the recorded
`d7ba34ec…`, and every page of my copy carries the stamp *"Downloaded from
https://www.cambridge.org/core. IP address: 178.33.239.142, on 23 Sep 2026 at 20:39:46"*. A
`sha256Note` now records this and names the arXiv v2 e-print as the reproducible pin. This is the
**fifth** instance in the corpus, after `PAPER-HE-18`, `PAPER-HE-21`,
`PAPER-SHANKAR-SHANKAR-TANG-ETAL-22` and `PAPER-BHATT-MATHEW-23`.

I read the published PDF in full — 35 pages, printed page = PDF page — and the arXiv v2 LaTeX source
(`extending-sections-char-p-1-16-2020.tex`, 2145 lines), which carries every passage the findings
quote outside §§4 and 6. The 2021 preprint and the 2023 article differ substantially in those two
sections, which is why the extraction collated only the difficulty and Lemma 2.16 passages against
it; E6, E7, E9, E10 and E11 I checked in the published text alone.

## Structure

163 items: 148 missing, 5 planned, 10 library. Nine routes — five source, four Part II. Every missing
item is routed exactly once, all five source stage ids resolve, all five planned ids resolve, all four
Part II parents exist, and `check_paper.py` passes.

A checker note for whoever runs one next: route 5's stage `AnalyticStacks:AS.1` **does** resolve, but
only if the checker reads `research/blueprint/roadmaps/AnalyticStacks.json`, whose stages are keyed
by `key` and not by `id`. A scan that collects only `id` fields reports it missing.

**Library.** All 18 declarations behind the 10 library items resolve: Tau Ceti's
`AlgebraicGeometry.InvertibleSheaf` with `.trivial` and `SheafOfModules.IsInvertible`, and Mathlib's
`IsIntegralHom`, `IsProper`, `Scheme.Hom.isClosedMap`, `IsFinite`, `DerivedCategory` with `Q`,
`localCohomology`, the four `WittVector` declarations, `frobenius`, `iterateFrobenius`,
`ModuleCat.exists_isRegular_tfae` and `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`.

**One provenance gap I did not fill.** No `libraryPins` are recorded, so there is no commit against
which those 18 declarations were checked. I verified them against the index this lane uses and they
are all there, but have not invented a pin the extraction did not use. `PAPER-BHATT-MATHEW-23` and
`PAPER-WOOD-19`, reviewed today, have the same gap.

**Locators.** Eleven of fifteen name-and-page checks on the findings land exactly; the four others
are right too — Proposition 2.15 is stated on p. 11 with its proof, and the difficulty definition, on
p. 12, and Corollary 1.3 is stated on pp. 2–3 with its proof on pp. 19–20. The item locators are
terse statement references without pages (`Proof2.11`, `Lem3.2 mixed case`); 115 of the 139 internal
statement references resolve in the text, and each of the 24 that do not carries an explicit external
key (`BMP`, `AHK`, `Wit21b`) and belongs to another paper's numbering. No locator error.

## The two corrections, both on route 7

Route 7 is the Part II of `CrystallineCohomology` for rational Witt cohomology on singular schemes.

**Its title truncated the parent's.** It read *"Crystalline cohomology, Part II: rational Witt
cohomology on singular schemes"*, where PROTOCOL §16 asks for the parent's atlas title verbatim —
*"Crystalline cohomology, de Rham–Witt and logarithmic foundations"*. The three sibling Part IIs of
the same parent in this corpus (`PAPER-ESNAULT-GROECHENIG-20`, `PAPER-BHATT-SCHOLZE-17`,
`PAPER-KISIN-MADAPUSIPERA-SHIN-22`) all write the full title. It now does too.

**Its area was not a galaxy id.** `cohomology` is an atlas *group*, not an entry of
`data/galaxies.json`. It is now `padic`, which is what `PAPER-ESNAULT-GROECHENIG-20` uses for its
Part II of the same parent, and what the content — Witt and rigid cohomology, slopes of Frobenius —
calls for. This is the defect class I reported corpus-wide when reviewing
`PAPER-CLAUSEN-MATHEW-MORROW-21`, where 33 of 502 route areas were group names;
`PAPER-KISIN-MADAPUSIPERA-SHIN-22` still carries `cohomology` on its Part II of this same parent and
should be fixed the same way.

## The eleven findings

All confirmed. The two errors in stated results are the substantial ones, and both counterexamples
check out in full.

**E1 — Lemma 2.2 uses the wrong index.** The lemma says "*m the Cartier index of `K_X` at `P`*" and
concludes that `mD` is Cartier for every divisor `D` near `P`, with
`(K_X+S)|_S = K_S + (1 − 1/m)P`. Take the `A₁` cone `X = Spec k[x,y,z]/(xy − z²)`, `S = V(x,z)`,
`Δ = S` and `P` the vertex. `X` is `Q`-factorial (local class group `Z/2`) and `(X,S)` is plt, hence
dlt: the minimal resolution has one `(−2)`-curve `E` and `K_{X'} + S' + ½E = f*(K_X+S)`. Since `A₁`
is Gorenstein, `K_X` is Cartier and `m = 1`, so the lemma asserts that every divisor is Cartier at
`P` — but `div(x) = 2S` and `(x,z)` is not principal there. With the **log** index, `m = 2`, `2D` is
Cartier and `(K_X+S)|_S = K_S + ½P`, which is the classical plt adjunction coefficient and agrees
with the resolution computation. The recorded correction is not a patch but the standard statement.

**E6 — Lemma 6.6 is false as stated.** Its hypotheses are: `𝒳` normal over a DVR of characteristic
`(0,p)`, central fibre `X` normal and `S₃`, a Weil divisor `𝒟` not containing `X` with `D = 𝒟|_X`
`Q`-Cartier, and a closed `Z ⊂ 𝒳` with `codim(Z ∩ X, X) ≥ 3` off which `D` is `Q`-Cartier. Take
`R = Z_p`, `p > 5`, and `𝒳 = Spec R[x,y,z,w]/(xy − zw)` with the closed point of the special fibre
removed. Then `𝒳` is integral, flat, normal and excellent; its special fibre is the cone minus its
vertex, hence smooth and so `S₃`; its only singular point is the vertex of the **generic** fibre,
which is a closed point `Z` of `𝒳` disjoint from `X`, so the codimension hypothesis holds vacuously
and `𝒳 ∖ Z` is regular. The ruling `𝒟 = V(x,z)` restricts to a Cartier divisor on the smooth `X` but
is not `Q`-Cartier at the generic node. Corollary 6.7(1)'s global `Q`-factoriality clause inherits
the same unrestricted form, which is why the correction asks for a neighbourhood of the special fibre
locally and properness globally.

**E2 — Lemma 2.16 is false as stated**, for the same surface. With `C = V(x,z)` and `B = bC`,
`0 < b < ½`, the minimal resolution is the single `(−2)`-curve and `(K_{S'} + bC' + aE)·E = 0` gives
`a = b/2`, so there is exactly one exceptional discrepancy, `−b/2`, and `m = 1` throughout; the log
discrepancies `1 − b/2` and `1 − b` both exceed `½`, so the pair is `½`-lc. Yet `−b/2` sweeps an
interval. Fixing a finite coefficient set, as the correction does, is what Proposition 2.15's use of
the lemma actually has available, since the boundaries along a flip sequence all have the
coefficients of `B`.

**E3 and E8 are two distinct sign slips in one proof**, both against that proof's own convention
`C_i² = −r_i c_i` with `r_i > 0`. The inequality `a_i C_i² ≥ −2r_i` gives `c_i ≤ 2/a_i`, not
`−c_i ≤ 2/a_i`, which is vacuous; and the equality case of convexity gives `c₂ = 2`, since `c₂ = −2`
would make an exceptional curve have positive self-intersection.

**E4 and E5 are settled by the definitions printed two lines above them.** `w⁺_α(x) = 1 − x` for
`x < α` and `0` otherwise, with `α ∈ (0,1)`, so `W⁺_α(b) = 0` for every `b ≤ 0` and the difficulty's
printed first sum is identically zero — the boundary term, which is exactly what drops when a flip
changes `ρ`, would vanish (E4). And the common domain `(−∞,1)` is right for `W^±_α` but not for the
lower-case weights, which are evaluated at `k(1−b) ∈ (0,∞)` and at discrepancies `a_v ∈ (−1,∞)` (E5).

**E7 is a real gap.** "Since `N¹(𝒳/S) → N¹(X)` is surjective, there exist Cartier divisors `𝒜` and
`ℋ` on `𝒳` such that `𝒜|_X = A` and `ℋ|_X = H`" — surjectivity of a map of numerical-class groups
gives divisors whose restrictions are *numerically equivalent* to `A` and `H`, and only after
rational scaling, not line bundles with prescribed restrictions.

**E9, E10 and E11** are confirmed verbatim, and E11's point is sharp: `H⁰_crys` of a geometrically
connected smooth proper `Y` has Frobenius eigenvalue 1 and slope 0, and that degree-zero term is
precisely the contribution that produces the congruence `|Y(F_q)| ≡ 1 (mod q)` being proved. E10's
trace formula is written for `X` where the left-hand side counts `Y`, and it is `Y` that is smooth
and proper. E9 calls a flip an isomorphism in codimension **two**, where the standard and sufficient
property — and what Lemma 2.7 asks for — is codimension one.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-HACON-WITASZEK-23.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-HACON-WITASZEK-23.result.json research/blueprint/papers/PAPER-HACON-WITASZEK-23.review.json

Both pass. No roadmap change beyond the two route-7 fields, no library claim and no Lean work is
proposed by this review.
