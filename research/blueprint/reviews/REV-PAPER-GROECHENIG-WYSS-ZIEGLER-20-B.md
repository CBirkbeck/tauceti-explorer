# REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20-B — review of the extraction of Groechenig–Wyss–Ziegler, *Geometric stabilisation via p-adic integration*

**Verdict: accept. All four routes accepted, no coverage gap, all four recorded mistakes confirmed — and two more added, found by running the extraction's own class of finding exhaustively.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-7b31c4`, issue #1428 — 164 items (4 library, 20 planned, 140 missing), 4 routes, 4 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: JAMS **33** (2020), no. 3, [doi:10.1090/jams/948](https://doi.org/10.1090/jams/948), read in [arXiv:1810.06739v2](https://arxiv.org/abs/1810.06739v2) with its TeX source.

## Provenance — hash matches, and the paywall is real

`0139fc5a…91a5f2` (arXiv v2 PDF, 51 pp.) matches byte for byte. I also took the v2 e-print (`FL.tex`, 3126 lines) and checked every quotation there. I reproduced the extraction's report that the published text is unreachable: `doi.org/10.1090/jams/948` and the AMS article page both return **HTTP 403**. So all locators are against v2, as the extraction records, and neither it nor this review can speak for the journal text — which is worth stating, because the companion paper's extraction found the journal version of *that* paper to differ substantively from its preprint.

## 1. Numbering and coverage — and a trap I fell into first

Seventeen environments (`definition`, `construction`, `rmk`, `theorem`, `proposition`, `corollary`, `lemma`, `situation`, `goal`, …) share one per-section counter, and the appendix letters it.

**My first simulation gave 171 objects and was wrong**: it counted **commented-out** environments in the source (`%\begin{lemma}\label{lemma:neron}`, `%\begin{proposition}…prop:purity`, `%\begin{lemma}\label{lemma:Tate}` and more), which shifts every number after them. Stripping comments before simulating gives **154**, and that is the extraction's numbering. Every number I tested agrees: `thm:volume` = **Theorem 2.21** (the extraction's item 5 records "= Theorem 2.21, p. 13"), `situation:locally_quotient` = **Situation 2.6**, `defi:weight` = **Definition 2.20**, and the four findings' locators (Construction 2.13, Remark 6.19, Goal 6.21, Remark 6.24) all land on the right environment.

**Coverage: 150 of 154 objects appear in an item locator.** The four that do not are Situation 2.3, Situation 4.24 (Donagi–Gaitsgory — its content is in three item statements by name), Remark 4.33, and Goal 6.21 (which the findings cite). No gap worth recording.

## 2. Statuses

All four `library` items were read in the source at the pins:

- `MeasureTheory.Measure.haarMeasure`, `haarMeasure_unique`, `haarMeasure_self` — Mathlib `082e2d3`, `MeasureTheory/Measure/Haar/Basic.lean`.
- `AddCircle.toCircle`, `toCircle_add`, `toCircle_apply_mk` — `Analysis/SpecialFunctions/Complex/Circle.lean:380`, inside `namespace AddCircle`.
- `CategoryTheory.Abelian.DoldKan.equivalence`, `CategoryTheory.Idempotents.DoldKan.equivalence` — `AlgebraicTopology/DoldKan/Equivalence.lean:168–169`.
- `TauCeti.subsingleton_brauerGroup_of_finite` — Tau Ceti `f790474`, `TauCeti/Algebra/BrauerGroup/Trivial.lean:247`.

The 20 `planned` items and the routes cite 12 layers between them; **all 12 exist in `data/atlas.json`**.

## 3. Routes — one Part II, three sources, all accepted

The Part II title reproduces the parent's verbatim (`Endoscopic transfer and unitary trace comparison`), and **the companion paper's extraction proposes the identical Part II with the same parent and title**, so the two GWZ papers feed one roadmap rather than competing. The reason is the right one: the parent's ET.2b and ET.3 already aim at these two theorems along Ngô's route, and this paper supplies a second, independent proof that replaces the Decomposition and Support Theorems by p-adic integration.

The three source routes place general material outside the Part II — tame DM-stack moduli theory in `AlgebraicModuliForArithmeticGeometry:R09.4/R09.5`, classical p-adic integration in `LogicAndDefinabilityInNumberTheory:LD.2`, and Tate's local duality in `ArithmeticGaloisDuality:R02.4`. All stages exist and belong to the roadmaps claiming them.

## 4. The four recorded findings — all confirmed

All are mis-citations, quoted verbatim in the source: "condition (iii) of **Theorem** 2.12" where 2.12 is a Proposition and the same construction says "Proposition 2.12" two sentences later (**E1**); "stated in **Theorem** 6.18" where 6.18 is the Corollary the same remark has just called "Corollary 6.18" (**E2**); "the embedding described in **Lemma** 4.36" where 4.36 is a Construction, cited correctly three other times (**E3**).

**E4 deserves a note.** Goal 6.21(1) and (2) both end "See Lemma 6.34", and Lemma 6.34's statement and proof give only goal (1), the Hasse-invariant identity. The identification of `λ(α)` with the unramified twist is made where the entry says — in the **deferred** "Proof of Lemma 6.14", which is printed *after* the proof of Lemma 6.34 and contains "It follows from Lemma 6.29 that `α_{U_a} ∈ Ext²(…) = Ext¹(…)` corresponds to the unramified twists". A check by line order alone misattributes that sentence to Lemma 6.34; the deferred-proof structure is what settles it, and the extraction read it correctly.

## 5. Two findings added

Every recorded finding belongs to one mechanical class: a reference whose introducing word disagrees with the environment carrying the target label. So I ran that class **exhaustively** — for each `<word>~\ref{label}` in the source, compare the word with the label's environment, over all 154 objects. The paper has **five** such mismatches; the extraction recorded three. The two it missed are now in the file:

- **E5** — the §2 overview says the canonical measure is "introduced in **Definition 2.8**", but 2.8 is printed as **Lemma 2.8** (`defcanmes`, the existence of the canonical measure), and the paper itself cites it as "Lemma 2.8" in §6.
- **E6** — §6.3 says "a specialisation morphism (see **Definition 2.13**)", but 2.13 is **Construction 2.13** (`defi:e`), cited correctly as a Construction at four other places. This is a second, distinct slip about the object E1 also concerns.

Both are misprints affecting nothing, and both are settled by the paper against itself. The same audit found **no duplicate labels and no undefined references**.

**The lesson for the register:** when an extraction's findings all belong to one mechanical class, the reviewer's job is to run that class exhaustively rather than re-check its instances one at a time.

## 6. What this extraction does well

164 items for a 51-page paper, with the general-purpose material (p-adic integration, tame DM stacks, Tate duality) routed away from the Part II and only the geometric-stabilisation mathematics kept in it. The item statements I checked against the source — Theorem 1.1 with the hypotheses of Corollary 6.18 unfolded, and Theorem 1.5 with its weight function — are faithful and self-contained.

## Tools

A comment-stripping inventory simulator for the shared counter, a word/environment reference audit, and `git grep` against pinned Mathlib `082e2d3` and Tau Ceti `f790474`. Kept in the session scratchpad.
