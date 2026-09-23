# REV-PAPER-BHATT-MORROW-SCHOLZE-18 — review of the extraction of Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory*

**Verdict: accept. All fourteen routes accepted, no coverage gap, all eighteen recorded mistakes confirmed, nothing corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-442dc5`, issue #1462 — 190 items (2 library, 92 planned, 96 missing), 14 routes, 18 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Publ. Math. IHÉS **128** (2018), 219–397, [doi:10.1007/s10240-019-00102-z](https://doi.org/10.1007/s10240-019-00102-z), read in the open-access published PDF on Centre Mersenne and in [arXiv:1602.03148v3](https://arxiv.org/abs/1602.03148) with its TeX source.

## Provenance — all three hashes match

| artifact | recorded | re-downloaded |
| --- | --- | --- |
| arXiv v3 PDF (124 pp.) | `285f7d20…9c4e072a` | identical |
| arXiv v3 e-print (`integralpadicHodge.tex`, 5932 lines) | `ff989b40…262b5aa4` | identical |
| published PDF, Centre Mersenne | `a924d36c…52702bb` | identical |

Because the published text is open access, the locators' published page numbers are checkable, and I checked the findings against both texts.

## 1. Items and coverage — no gap

Every theorem environment shares one per-section counter (`\newtheorem{theorem}{Theorem}[section]`, everything else `[theorem]`). Simulating that from the source independently gives **237 numbered objects** — exactly the count the extraction reports — distributed 20, 12, 29, 34, 7, 20, 10, 17, 18, 14, 17, 9, 23, 7 over §§1–14.

**229 of the 237 appear in an item locator, and the eight that do not are all remarks, none of them a gap.** The only one carrying mathematical content is **Remark 14.2**, which weakens Theorem C's hypothesis to "C perfectoid, with all p-power roots of unity" — and the extraction folds it verbatim into every Theorem 14.1 item, whose statements read "a perfectoid field containing all p-power roots of unity suffices, Remark 14.2". The other seven are the introduction's commentary on the surprise of a Frobenius action (1.9), the open question about a site-theoretic formalism (1.11), the Faltings-site variant (1.13), the history of `Lη` (1.14), the announcement of the canonical representative `K_n^•` (1.15) and two remarks on §2's examples (2.6, 2.11).

## 2. Statuses

**Both `library` items were opened at Mathlib `082e2d3`** and provide what they claim: `PreTilt` (`Mathlib/RingTheory/Perfection.lean:634`), `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean:52`), and in `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` both `fontaineTheta` (line 165) and `fontaineTheta_teichmuller` (182), which sit inside `namespace WittVector`, and `surjective_fontaineTheta` (195), which falls **after** that namespace closes at line 190. The extraction cites the first two as `WittVector.…` and the third with no namespace — a distinction it would have been easy to get wrong, and it is right.

The **92 `planned` items** cite 27 layers, all of which exist, concentrated in `AInfCohomology:AI.1`–`AI.5` (12, 7, 15, 11, 12 items) with `CohomologyComparisons:CP.3` and `CP.5` next. That is the right concentration: `AInfCohomology` is the roadmap whose own layer descriptions name BMS1 as their source.

## 3. Routes

**All fourteen are `source` routes, and all fourteen are accepted.** The extraction's judgement is that the atlas already owns this paper's mathematics and that no new roadmap or Part II is needed — an unusual verdict for a paper of this weight, and it holds up:

- Every cited layer exists in `data/atlas.json`, and every stage belongs to the roadmap that claims it (`check_paper.py` enforces the latter and passes).
- **Ten of the fourteen layer descriptions name BMS1 or its authors explicitly** — `AInfCohomology:AI.0` through `AI.5`, `CohomologyComparisons:CP.3` and `CP.5`, `CrystallineCohomology:CR.3` and `CR.4`. AI.0 names §3 for `A_inf`, θ, μ, ξ and the Breuil–Kisin twist; AI.1 names §§6–7 for `Lη`; AI.3 names §§7–9 for `AΩ`; AI.4 names §§8, 10–12 and Theorem 1.10 for the specializations.
- The four that do not name it — `AI.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `PadicHodgeTheory:P8` and `PerfectoidQuotients:Q0:integral-algebra` — own respectively the `𝔖 = W(k)[[u]]`-valued Breuil–Kisin cohomology, Breuil–Kisin modules, the relative period sheaves used by CP.3, and integral perfectoid algebra, which is what their routed items need (the torsion structure theorem for Breuil–Kisin modules, the `A_inf` base change, Theorem 5.1's rational comparison, and the definition of integral perfectoid rings).

## 4. Mistakes in the paper — 18 of 18 confirmed

All were checked at their locators in both the TeX and the published PDF. All are misprints affecting nothing, which is the expected profile for a 179-page paper this closely read. The per-finding reasons are in the result JSON; the ones worth reading here are those the **paper itself settles**:

- **E7** — the subcomplex is described with `(dx, dy + (−1)^n g y)` while the displayed differential two lines above is `(x,y) ↦ (dx, dy + (−1)^n g x)`.
- **E13** — the proof establishes `R(α) ∈ (η_μ D)^n`, computes `d(R(α)) ∈ ξ̃_r μ^{n+1} D^{n+1}`, and concludes about `H^n((η_μ D^•)/ξ̃_r)`; the `(η_{φ(μ)}D)^{n+1}/ξ̃_r` in between is the slip.
- **E18** — the display reads `AΩ_R ⊗̂ φ^r(A_crys^{(m)})` and the cohomology line beneath it `AΩ_r`.
- **E8** — Theorem 9.4(ii) is the part whose quasi-isomorphisms give the sheaf property of `W̃_rΩ^psh`; (iii) is the same statement for `AΩ`.
- **E17** — Proposition 13.15 has exactly **two** parts, so "(i) and (ii) are clear from the construction" followed by "the proof of (iii)" cannot stand; what follows constructs `η` and `ψ`, which is part (ii).
- **E11** — a composite of five stray `A`s in §11.1, where the base ring is written `(S)` fifty-four times in the same passage and Remark 11.3 itself writes `W_rΩ^•_{B/S}`.
- **E9** — decided by the sentence's own logic: the hypothesis is used "only to guarantee that `W_r(R) → W_r(R′)` is étale", so it is a condition on `R`.
- **E3** — the map `f` is genuinely nameless: the paragraph before Lemma 4.30 introduces "the map `𝔖 → A_inf` that sends `T` to `[π^♭]^p`" without a symbol, Lemma 4.30 calls it "the map above", and Proposition 4.32's proof then writes `f(E)`. **One addition:** the same sentence prints "is a Breuil–Kisin–Fargues **modules**", which the entry quotes but its correction does not mention; a formaliser reading the correction alone would fix only the `f`.

## 5. Changes made

None. Every locator resolves, every quotation is accurate, the statuses check out at the pinned commits, and no route needed rerouting.

## Validation

~~~sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.review.json \
  research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.md \
  research/blueprint/reviews/REV-PAPER-BHATT-MORROW-SCHOLZE-18.md
git diff --check
~~~

No Lean file is a deliverable of this review and no formalisation is claimed. All eighteen findings enter the register as new confirmed mistakes, checked in both the arXiv v3 and the published text.
