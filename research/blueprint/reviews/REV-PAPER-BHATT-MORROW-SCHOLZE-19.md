# REV-PAPER-BHATT-MORROW-SCHOLZE-19 — review of the extraction of Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*

**Verdict: accept. All thirteen routes accepted, no coverage gap, all twelve recorded mistakes confirmed, nothing corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-442dc5`, issue #1458 — 114 items (1 library, 56 planned, 57 missing), 13 routes, 12 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Publ. Math. IHÉS **129** (2019), 199–310, [doi:10.1007/s10240-019-00106-9](https://doi.org/10.1007/s10240-019-00106-9), read in the open-access published PDF on Centre Mersenne and in [arXiv:1802.03261v2](https://arxiv.org/abs/1802.03261) with its TeX source.

## Provenance — all three hashes match

`b2338ef1…b3594038` (arXiv v2 PDF, 88 pp.), `30968bad…4b91878ac` (v2 e-print, `bms2.tex`, 3266 lines) and `6b43d1ff…23ff23dd` (published PDF). Having both texts mattered here: two findings (E10, E11) are quoted in the published phrasing and were verified there.

## 1. Items and coverage — no gap, and a lesson about ranges

Sixteen theorem environments share one per-section counter. Simulating it independently gives **173 numbered objects**, exactly the extraction's count.

My first pass showed seven uncovered objects, including **two lemmas** — Lemma 4.16, the closure of quasisyntomic and quasismooth maps under composition and base change, and Lemma 4.26, the finite-free/flat injectivity criterion. Both turned out to be covered: the locators use **range notation**, "Lemmas 4.15–4.17" and "Lemmas 4.25–4.27", which a numeric matcher reads as two numbers instead of three. Lemma 4.16's content is also folded into the quasisyntomic-site item, whose statement records that `QSyn` and `qSyn_A` "are sites for quasisyntomic covers, with pushouts the p-completed tensor products". After expanding ranges, **the only uncovered objects are four introductory remarks**, all commentary: the forward reference to the prismatic site, the extension to `TR^r`, Schneider's sheaves, and the comparison with BMS1.

That is worth recording as an audit rule: expand locator ranges before concluding anything about coverage.

## 2. Statuses

The single `library` item cites `WittVector`, `PreTilt` and `WittVector.fontaineTheta`, all present at Mathlib `082e2d3` — `RingTheory/WittVector/Defs.lean:52`, `RingTheory/Perfection.lean:634`, and `RingTheory/Perfectoid/FontaineTheta.lean:165`, the last inside `namespace WittVector`. The **56 `planned`** items cite 22 layers, all of which exist in `data/atlas.json`.

## 3. Routes

Twelve `source` routes and one `part-ii`, all accepted. Every source route's cited stage exists and belongs to the roadmap that claims it, checked against `data/atlas.json`: `RefinedTraceMethods` (48 + 3 + 1 items), `DerivedDeRhamCohomology` (1 + 3 + 5 + 7), `AInfCohomology` (1 + 6), `CrystallineCohomology` (5) and `PrismaticCohomology` (1 + 11).

**The Part II route is the model case.** `RefinedTraceMethodsPartIIHenselianPairs` is already proposed as a Part II of `RefinedTraceMethods` by `PAPER-CLAUSEN-MATHEW-MORROW-21` (84 items — the paper that owns the rigidity theorem) and by `PAPER-CLAUSEN-MATHEW-21` (7 items), both with the same parent. This route adds **one** item, Theorem 7.15's comparison `K(S; Z_p) ≃ τ_{≥0}TC(S; Z_p)` for `S` henselian along `p` with semiperfect reduction, as a source for that roadmap; the title reproduces the parent's exactly, and the brief states outright that CMM owns the rigidity and that BMS2 exports only the consequence. A one-item Part II would normally deserve suspicion; here it is right, because the roadmap is someone else's and this is a contribution to it.

## 4. Mistakes in the paper — 12 of 12 confirmed

All checked at their locators; all misprints affecting nothing. Settled by the paper against itself:

- **E9** — the map is displayed as `d_R : Δ_S → AΩ_S` and referred to in the next sentence as "the comparison map `d_S`".
- **E2** — `L_{S/A} ∈ D(C)` with no `C` in scope, beside the same sentence's `L_{B/A} ⊗_B S ∈ D(S)`.
- **E5** — §7.4 writes `Z_p(i)(A) := gr^n TC(A; Z_p)[−2i]`, mixing indices, where the introduction's version of the same definition uses `n` throughout.
- **E12** — `gr^0(TC^-(A; Z_p)[1/u])` drops the relative base that Proposition 11.15 and the displays in its own proof carry, `A/𝕊[z]`.
- **E4** — "the (degenerate) homotopy fixed point **spectral** calculating `TC^-(R; Z_p)`": the word "sequence" is missing and the ring should be `S`.
- **E6** — `Ŝ^q` described as the completion of `S` rather than of `S^q`, and as a "quasisyntomic" rather than a *quasiregular* semiperfectoid.
- **E8** — sequences `(a_i) ∈ ∏_{i∈I} O_C^♭` where `N = ∏_{i∈I} O_C` was defined one line above.
- **E1** — the `t`-structure on `D(R)` described as having connective objects `DF^{≤0}(R)`, the filtered category being introduced only afterwards.

Two were settled by computation rather than comparison:

- **E7.** The diagram's isomorphism is `p^{i−1−n}V`, which degenerates exactly when `i − 1 − n = 0`, i.e. **`n = i − 1`**; the printed "boundary case `i = n − 1`" inverts it.
- **E10.** Writing `f = μ^j g` and using `μ = ξφ^{−1}(μ)`: `ξ^i φ^{−1}(μ^j g) = ξ^{i−j}(ξφ^{−1}(μ))^j φ^{−1}(g) = ξ^{i−j} μ^j φ^{−1}(g)`, so after dividing by `μ^j` the condition is `g − ξ^{i−j}φ^{−1}(g) ∈ Ô_X^{♭+}` and the printed coefficient `μ^{i−j}` is wrong. The integral-closedness argument then runs verbatim with `ξ^{i−j}`.

**E11** is confirmed in the published text, where the sentence's two halves genuinely differ: the inclusion is introduced into `A_inf(O_{K_∞})`, the ring Notation 11.1 uses, and then described as "the inclusion `𝔖 ↪ A_inf(O_K)` fixed earlier" — and `O_K` is not perfectoid, so `A_inf(O_K)` is not a ring used in §11.

## 5. Changes made

None. Every locator resolves, every quotation is accurate, the library item and all planned layers check out, and no route needed rerouting.

## Validation

~~~sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.result.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.result.json \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.review.json \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.md \
  research/blueprint/reviews/REV-PAPER-BHATT-MORROW-SCHOLZE-19.md
git diff --check
~~~

No Lean file is a deliverable of this review and no formalisation is claimed. All twelve findings enter the register as new confirmed mistakes, checked in the arXiv v2 source and, where the entry quotes the published phrasing, in the published text.
