# PAPER-IM-KIM-LE-ETAL-24 — Zagier–Hoffman's conjectures in positive characteristic

Claude Code — session `cc-7b31c4`; issue #1358; read on 22 September 2026.

Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, *Zagier–Hoffman's conjectures in positive
characteristic*, Forum of Mathematics, Pi **12** (2024), `doi:10.1017/fmp.2024.18` (open access). Read in the
authors' public version, [arXiv:2205.07165v2](https://arxiv.org/abs/2205.07165v2) (10 June 2024, 60 pages, "the
details of proofs have been added") — in its **LaTeX source** (`AMZV_ZagierHoffman_arxiv_v2.tex`, source archive
sha256 `362cf73f…`), since `pdftotext` was unavailable here — together with the published text on Cambridge Core.

**On numbering.** The preprint leaves the introduction unnumbered, so its statements are numbered `0.k`; the
published version numbers the introduction as Section 1, shifting every section number by one (arXiv Remark 1.1 =
published Remark 2.1, arXiv Theorem 3.6 = published Theorem 4.6, and so on), verified statement by statement.
Theorems A and B keep their letters. Every locator gives the preprint number with the published number in
parentheses.

The current extraction has **102 items: 2 library, 13 planned and 87 missing**. The following initial extraction count is historical: 42 items, with 1 library, 3 planned and 38 missing, of which **37 went to a Part II** of *Drinfeld modules, t-motives and
characteristic-p special values* — the same Part II proposed by `PAPER-CHANG-CHEN-MISHIBA-23` — and **1** as a
source for that roadmap's stage DM.8.

## Confirmed red-team fixes (Codex, codex-J6LwjP, 2 October 2026)

[Issue #5519](https://github.com/CBirkbeck/tauceti-explorer/issues/5519) applies all five independently confirmed findings. The [fixes report](../redteam/RT-PAPER-IM-KIM-LE-ETAL-24.fixes.md) gives the source and pinned-declaration checks. This section supersedes conflicting historical claims below. There are now **102 items (2 library, 13 planned, 87 missing)**, still 86 missing items in the shared Part II and one source item for DM.8, with **23 prerequisite works**. All original item IDs/statuses and all 36 source-issue records and review verdicts are preserved; these are extraction fixes, not new author errata or an independent review by this fixer.

- **Base field.** Item 1 now claims only the supplied algebraic/valued setup, explicitly citing `RatFunc.inftyValuation` and `RatFunc.CompletionAtInfty`. The new planned `analytic-C-infinity` item imports the normalized norm, rank-one/completion interfaces, characteristic-p completed algebraic closure and compatible embeddings from **DrinfeldModulesAndTModules:DM.2**. Its reviewed coverage is partial: the valued completion alone is insufficient, and `IsAlgClosed.of_denseRange` assumes characteristic zero.
- **Tate algebra.** `restricted-series-library-ingredients` records the available carrier, subring, bounded Gauss norm and multiplicativity, with their actual hypotheses. `ordinary-tate-algebra-and-gauss-norm` imports the remaining general analytic interfaces from **AdicSpaces Layer 0 §§0.4–0.5**. The old bundled item keeps its stable ID but now covers the specialized entire-series ring ℰ, its finite coefficient-field requirement and function-field evaluation/Frobenius interfaces. The Part II imports general Tate theory rather than constructing another copy. Unit-disc Tate evaluation does not authorize evaluation at θ, whose norm is q>1.
- **Convergence.** The authoritative statements of items 28, 30 and the ABP difference-system construction now require `‖Q_j‖_∞ < |θ|_∞^(q s_j/(q−1))` for every component. This ensures every consecutive subtuple, including each prefix and tail, is defined. The weaker printed whole-tuple condition is retained as historical text linked to accepted E14. The intended γ and γH_s applications satisfy the stronger bound. Cited whole-tuple lemmas retain their original scope; they are instantiated for tails only under the corrected setup.
- **Relations.** Theorem 3.4 (published 4.4) concerns **normalized periods indexed by J′_w, augmented by 1**. A nontrivial relation has a nonzero constant coefficient and forces `(q−1)|w`; uniqueness is after that coefficient is normalized to 1, with the original character restriction. AS_w itself is independent. General ACMPLs reduce to AS_w; their unrestricted relation space is not asserted one-dimensional. Item 34, including its γ normalization, is unchanged.
- **Prerequisites.** Added [Chang–Papanikolas–Yu](https://arxiv.org/abs/1411.0124) for the general motive/Frobenius construction and common denominators; [Chen–Harada](https://arxiv.org/abs/2012.00340) for the AMZV period formula; and the authors' [separate Note](https://hal.science/hal-04240841) for the small-weight proof details deferred in published §5.4. These cited suppliers remain black boxes at extraction scope.

The 49-page published PDF was checked at pp. 4, 20–23, 27, 30 and 47–48, with rendered pp. 20, 22, 23 and 30. SHA-256: `82e85086688c1274207d7265a310381a4b04d02243d11ee78bf67a8105ab7e98`. This session did not reread the full paper, collate the preprint or recursively audit suppliers. Exact checks covered the E14 exponent counterexample, the strict application bounds, and a q=3 truncated rational-function identity showing why the old unrestricted reader sentence fails. Paper, intake and whitespace checks passed. No Lean file or compilation was requested.

## Independent review (REV-PAPER-IM-KIM-LE-ETAL-24)

The independent review (Claude Code, session cc-2aeb03, 24 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-IM-KIM-LE-ETAL-24.md`; the counts in the sections below are the earlier ones
and were superseded by this review. The current fix counts above supersede these review counts.

- **Items: 99** (1 library, 11 planned, 87 missing), each missing item routed once: 86 to the Part II (route 1) and 1 as a
  source for DM.8 (route 2).
  - 12 bundled items split, one numbered result per item (7, 10, 17, 19, 20, 23, 28, 30, 34, 37, 38, 42); 57 items added for
    the split-off results and for the definitions, constructions and cited inputs the proofs use; none removed.
  - 78 fields corrected: 43 locators (every page was missing), 24 statements, 10 names and 1 kind. Item 26 (effective dual
    t-motives) is planned at DM.8 as well as DM.4.
- **Routes.** Both stand; the Part II brief carries the confirmed corrections.
- **Prerequisites.** Rebuilt as 20 entries, one work each, checked against Crossref. Harada's venue (Math. Z.), the DOIs of
  Todd and Chen and those authors' first names are corrected. The arXiv numbers the extraction gave for Ngo Dac (2007.11060,
  which is Green–Ngo Dac), Harada, Chang and Lara Rodríguez–Thakur belong to other papers and are dropped, here and below. Kuan–Lin (2016) is added.
- **Mistakes: 36 confirmed** (29 misprints, 6 gaps, 1 error); 1 reaches a stated result and 5 a proof.
  - **E1** is confirmed.
  - **E2–E36** are new, each checked a second time independently. The main ones:
    - **E14:** Condition (2.1), imposed on the whole tuple, does not make the sub-tuple series of Ψ_{s,Q} converge
      (s = (q−1, q−1), Q = (1, θ^{q+1})); every application satisfies the termwise bound.
    - **E12:** the proof of the strong Brown theorem (Theorem 1.11) asserts the congruence modulo D_1 without argument.
    - **E23, E30:** Theorem 3.4 passes between K-relations among Li-values and among 𝔏𝔦-values without saying that the
      algebra of §1 preserves characters.
    - **E31, E33:** gaps in the proofs of Propositions 4.10 and 4.11.
  - Theorems A and B stand; every gap is filled with the paper's own tools.

## What the paper proves

Over `A = F_q[θ]` with `K = F_q(θ)`, `K_∞`, `C_∞` and `A_+` the monic polynomials, Thakur's multiple zeta values
are `ζ_A(s) = Σ a_1^{−s_1} ⋯ a_r^{−s_r}` over `a_i ∈ A_+` with `deg a_1 > ⋯ > deg a_r`, and Harada's *alternating*
values twist the summand by `ε_1^{deg a_1} ⋯ ε_r^{deg a_r}` for `ε ∈ (F_q^×)^r`. Write `Z_w` and `AZ_w` for the
`K`-spans in weight `w`.

* **Theorem A.** `dim_K AZ_w = s(w)`, where `s(w) = (q − 1)q^{w−1}` for `1 ≤ w < q`,
  `s(q) = (q − 1)(q^{q−1} − 1)` and `s(w) = (q − 1)Σ_{i=1}^{q−1} s(w−i) + s(w−q)` for `w > q`, with an explicit
  Hoffman-like basis. This has no counterpart in the literature and is, as the authors say, the harder of the two
  theorems.
* **Theorem B.** `T_w` — the values `ζ_A(s)` of weight `w` with `s_i ≤ q` for `i < r` and `s_r < q` — is a
  `K`-basis of `Z_w`; hence `dim_K Z_w = d(w)`, Todd's conjecture. This is Thakur's basis conjecture, proved
  independently and simultaneously by Chang, Chen and Mishiba.
* **Why alternating Carlitz polylogarithms.** Inside the theory of alternating multiple zeta values the algorithm
  of Ngo Dac gives only a *weak* Brown theorem — the generating set `AT_w` is too large to be a basis — because
  one can move forward but not backward, for lack of control on the coefficients. The paper therefore develops
  the algebraic theory of **alternating Carlitz multiple polylogarithms** `Li(ε; s)` (whose stuffle relations are
  simpler than the shuffle relations for `ζ_A`), obtains the same generating set `AT_w` for `AL_w`, and deduces
  the **bridge** `AZ_w = AL_w` (Theorem 4.9).
* **The three new ingredients.** (i) The Hoffman-like set `AS_w`, indexed by tuples with `q ∤ s_i`, of cardinality
  exactly `s(w)`; (ii) the **strong Brown theorem** (Theorem 1.11): `AS_w` generates `AL_w`, so
  `dim_K AL_w ≤ s(w)`; (iii) an improved linear-independence criterion (Theorem 2.4) which, from a relation in
  weight `w` and independence in lower weights, produces a controlled system of Frobenius difference equations.
* **The transcendental part.** Through dual `t`-motives and the ABP criterion, with a character-splitting lemma
  (Lemma 3.2) and a Kuan–Lin degree bound (Lemma 3.3), Theorem 3.4 controls relations among normalized
  periods indexed by `J′_w`, augmented by `1`: a nontrivial relation forces `(q−1)|w` and a nonzero
  constant coefficient, with uniqueness after normalizing that coefficient to `1` and retaining the
  trivial-character qualification. `AS_w` is independent; general ACMPL relations are handled by reduction to it. Theorem 3.6 concludes
  that `AS_w` is a basis of `AL_w`; the bridge gives Theorem A, and restricting to non-alternating indices gives
  the lower bound `dim_K Z_w ≥ d(w)` (Proposition 4.10) and hence Theorem B.
* **What the direct route gives.** Section 4.3 records the ad hoc arguments inside the AMZV theory: they give
  `dim_K AZ_w ≤ s(w)` for `w ≤ 2q − 2` and `≥ s(w)` for `w ≤ 3q − 3`, and the authors explain exactly where they
  break down — the best justification for the detour through ACMPLs.

## What the atlas already has

The reconnaissance is the same as for `PAPER-CHANG-CHEN-MISHIBA-23`, and the conclusion is the same.
`DrinfeldModulesAndTModules` plans the Ore ring and Drinfeld modules with the Carlitz module (DM.0), analytic
uniformisation and the period (DM.2), Anderson `t`-modules and effective `t`-motives (DM.4), Carlitz zeta values
and Goss/Taelman `L`-values (DM.6), and Papanikolas's Tannakian difference-Galois theory with Carlitz logarithms
(DM.8) — and stops at depth one. `PeriodsAndSpecialValues:PS.9` plans the classical multiple zeta values with
shuffle, stuffle, regularisation and the motivic basis/spanning results, which is where Zagier, Hoffman, Brown and
Deligne–Goncharov–Terasoma belong, including the classical alternating bound. The pinned libraries supply `A`, `K`, the valued completion `K_∞`, monic polynomials and restricted-series/Gauss-norm ingredients. The normalized normed-field and `C_∞` package remains a DM.2 import; general Tate interfaces come from AdicSpaces Layer 0. Nothing anywhere plans multiple zeta values in characteristic `p`,
alternating or not, Carlitz polylogarithms, the `q`-shuffle or stuffle algebras, or the ABP criterion.

## The routes

### 1. Part II of *Drinfeld modules, t-motives and characteristic-p special values* — 86 missing items

`DrinfeldModulesAndTModulesPartII`, "…, Part II: multiple zeta values and Thakur's basis", area `functionfields`.
It plans Thakur's and Harada's values, Carlitz multiple polylogarithms and their alternating versions with the
power sums and Carlitz's identity, the combinatorics of tuples and arrays, the calculus of binary relations with
the operators `𝓑*` and `𝓒`, the weak and strong Brown theorems with `AT_w` and `AS_w`, the dual `t`-motive package
with the improved linear-independence criterion, the restricted normalized-period theorem followed by reduction of general ACMPLs to AS_w, and
the bridge with the two main theorems.

**This is deliberately the same Part II — same id, same title — that `PAPER-CHANG-CHEN-MISHIBA-23` proposes.** The
two papers prove Theorem B independently and at the same time (each acknowledges the other), and they share the
ABP criterion, the Frobenius difference systems, Carlitz's identity and the index sets; but each proves something
the other does not — the alternating dimensions here, the generating set of all `K`-linear relations there. The
brief asks the design job to plan the shared material once and then both routes, rather than creating two
roadmaps that would duplicate each other, which is what PROTOCOL section 15 requires.

### 2. Source for `DrinfeldModulesAndTModules` DM.8 — 1 item

The ABP criterion itself. DM.8 plans the Papanikolas theory that is built on it but does not state it; both this
paper and the Chang–Chen–Mishiba paper are sources for it, and both Part II routes import it.

## Prerequisites the atlas does not cover

Twenty-three current entries (12 in the initial extraction and 20 after review). The three new direct suppliers and dependent items are listed above. The older selection includes: **Ngo Dac** (Ann. of Math. 2021) for the algebraic part and the method;
**Harada** (Math. Z. 2021) for the alternating values themselves; **Anderson–Brownawell–Papanikolas**
(arXiv:math/0207168) for the criterion; **Thakur**'s book and papers for the values, the shuffle relations and the
basis conjecture; **Chang** (Compositio 2014) for Carlitz multiple polylogarithms and the Goncharov analogues;
**Chang–Chen–Mishiba** (arXiv:2205.09929), the simultaneous proof; **Todd** for the dimension conjecture;
**H.-J. Chen** for the shuffle formula; **Anderson–Thakur** for the period interpretation; **Papanikolas** for the
difference-Galois framework; **Lara Rodríguez–Thakur** for the relations behind the ad hoc sets; and
**Deligne–Goncharov**, **Terasoma** and **Brown** for the classical statements.

## Mistakes in the source

There are 36 existing source issues after independent review; this fix adds none. The following initial one-misprint account is historical.

* **E1** (Section 0.2.2, the definition of the alternating multiple zeta values; published Section 1.2.2): the
  tuples are introduced as `𝔰 = (s_1, …, s_r) ∈ N^n` and `𝛆 = (ε_1, …, ε_r) ∈ (F_q^×)^n`, where the ambient sets
  must be `N^r` and `(F_q^×)^r` — the displayed tuples have `r` entries and the sum runs over `r`-tuples of monic
  polynomials; the letter `n` is not introduced there. The same objects are written correctly with exponent `r`
  in Section 0.3.2, where the alternating Carlitz multiple polylogarithms are defined. **Still present in the
  published version.** It affects nothing.

The initial extraction recorded the following correction search at its original reading date; it was not rerun as a new search in this fix: arXiv 2205.07165 has versions v1 and v2 only, the Cambridge Core article carries none, and the
sequel (arXiv:2402.11539) does not correct this point.
