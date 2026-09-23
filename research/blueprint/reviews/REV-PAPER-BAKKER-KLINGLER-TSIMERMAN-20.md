# REV-PAPER-BAKKER-KLINGLER-TSIMERMAN-20 — review of the extraction of Bakker–Klingler–Tsimerman, "Tame topology of arithmetic quotients and algebraicity of Hodge loci"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1423).
- **Authors:** Codex, sessions `codex-c83e7a` (#1670) and `codex-a71f92`, and Claude Code, sessions `cc-fb70e5` (#1840) and
  `cc-442dc5` (which completed it). This reviewer took no part in any of them.

**What was read.**

- **The paper.** J. Amer. Math. Soc. 33 (2020), 917–939, doi:10.1090/jams/952, in the published text (23 pages; printed page =
  PDF page + 916). It was read in full, as page images, in five ranges:
  - §1 (pp. 917–922);
  - §§2–3 (pp. 922–928);
  - §§4.1–4.4 up to Theorem 4.8 (pp. 928–931);
  - Lemma 4.10 and §4.5 (pp. 931–933);
  - §4.6, §5, Appendix A and the references (pp. 933–939).

  Every item was compared with the page. The authors' copy was compared where the print was in doubt.
- **The erratum.** The authors' erratum, J. Amer. Math. Soc. 36 (2023), doi:10.1090/jams/1025, was read in full. The copies of
  the authors' copy and of the erratum match the extraction's recorded hashes.
- **The libraries.** All 10 library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update relation for doi:10.1090/jams/952. The only correction is the authors' 2023
  erratum, which Crossref lists separately.

## 1. Items

- **Corrected fields (87):** 45 statements and 42 locators; three notes were updated. Examples:
  - Many locators gave the authors' copy's pages ("pp. 2–3", "p. 18") instead of the printed JAMS pages.
  - `definable-analytic-chow` cited "[PS09] Theorem 4.5". The paper cites Theorem 4.4 and Corollary 4.5.
  - Several statements disagreed with their sources:
    - the Orr–Schnell, van den Dries and Hodge-datum items, compared against erratum §1.4;
    - items in §5, which stated the extraction's repaired versions instead of the paper's text.
  - `basis-change-reducedness` now states the corrected claim (E3) on its own.
  - `local-period-definability` states Theorem 4.1 in its true, shrunken form (E1).
- **Removed (6), not in the paper.** Their content is kept where it is used:
  - `determinant-coordinate-control` and `basis-change-offdiagonal`: the extraction's own derivations for the basis transfer in
    §4.5. They are true, and are now in the note of `basis-change-reducedness`.
  - `buffered-transition-graph`: the extraction's repair for E17, now in the note of `compact-corners-definable`.
  - `cholesky-reconstruction` and `matrix-adjugate-inverse`: library support, not statements of the paper. The declarations are
    named in the note of `reduction-siegel-dictionary`.
  - `local-outer-boundary-obstruction`: the counterexample to Theorem 4.1 as printed. It is part of E1's record.
- **Kept.** `basis-change-reducedness` and `faithful-hodge-representation` are kept, because they are corrected forms of the
  paper's assertions.
- **Added (29).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - the original morphisms of arithmetic quotients;
  - fundamental sets;
  - the canonical definable structure of a complex algebraic variety;
  - Baily–Borel quasi-projectivity;
  - the generic Mumford–Tate group, the Hodge locus and its analyticity;
  - R_an-definable sets as globally subanalytic sets;
  - compact linear groups as real algebraic groups;
  - the Siegel-set convention comparison and the surjective-morphism step of §3.2;
  - the strip uniformization and Hodge-form functions of §4;
  - Kashiwara's splitting-independent estimates;
  - the Hodge-form map and reduced-form sets of §4.5;
  - the facts used in Lemma 4.10: transversality, the (−1,−1) monodromy logarithms, and the weight filtration of a centraliser;
  - that holomorphic maps to arithmetic varieties are period maps;
  - the Hodge locus of a Hodge variety.

  Two of them are planned:
  - Baily–Borel at ShimuraVarieties V2;
  - fundamental sets at AdelicAlgebraicGroups AA.3.

  Two duplicate pairs were merged.

## 2. Statuses

- **Library.** All 10 library declarations exist at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All eight routes are accepted; `PAPER-BAKKER-KLINGLER-TSIMERMAN-20.review.json` gives a reason for each.

- **Titles.** Both Part II titles already begin with their parents' exact atlas titles.
- **Briefs.** Routes 7 and 8 now name the confirmed corrections their designs must carry. Routes 1–6 are source routes and have
  no briefs. Their corrections are on the items.
- **Prerequisites.** Rebuilt as 24 cited works, one per entry, each with its DOI or a stable link and the place the paper uses it.
  - The old entries bundled works and pointed at personal copies.
  - The Orr–Schnell correction and Bakker–Grimm–Schnell–Tsimerman, which the erratum uses, now point at their publications.
    BGST's Proposition 28.1 in its arXiv version is Proposition 3.4 in the published one.
  - Works cited only as background are left out.

## 4. Mistakes

**The extraction's twenty-nine.** All are confirmed.

- **Revised, as the independent checks upheld:**
  - **E1.** Theorem 4.1 is false on the whole unit polydisk; the counterexample is exact. The proof fails at the reduction on
    p. 929, not at Lemma 4.2, which holds as stated.
  - **E7.** Now a gap. The citation [B-HC62, 7.5] is inapplicable, but the statement it supports is true (BGST Proposition 3.4).
  - **E8.** The first proof of Lemma 2.1 fails unless M is normal.
  - **E17.** Widened to the independence-of-choices and boundary-immersion steps on p. 936.
  - **E27.** Now affects nothing, with the monodromy argument added.
  - **E10, E26 and E28** were also revised: E28 is now a misprint.
- **Reach raised.** E3's reach is now "the proof", in line with the related false Claim (E60).

**New: 31 (E30–E60).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 38 claims, 33 were confirmed,
  1 reclassified and 4 rejected. Three were folded into E11, E27 and E59, because they were the same finding at the same place.
- **Rejected:**
  - a claimed dependence of Theorems 1.3 and 1.5 on the maximal compact subgroup, which cannot occur for Hodge manifolds, since
    K_t is the only maximal compact containing M;
  - "for any C > 0" in Lemma 4.5;
  - the analyticity of special images in §5;
  - the finite étale descent in §5.
- **In the erratum.** E30–E33 are misprints in the erratum itself. One of them concerns "A is the centre" in its §1.2, which,
  read literally, makes the Hilbert modular Siegel sets too large.

The main new ones:

- **E46.** As defined in Definition 4.4, roughly polynomial functions do not form a ring; there is an explicit counterexample.
  Requiring roughly monomial polynomial denominators repairs this, and every use in the paper satisfies that requirement.
- **E60.** The Claim on p. 933 is false for every basis. A tensor product of Tate-curve variations is a counterexample. It must
  be replaced by conditions (1) and (3) for one basis, which gives (dim V)! orderings and still proves Theorem 1.5.
- **E49 and E54.** Theorem 4.8 is stated for the rational splitting and applied to the complex one. Kashiwara's
  splitting-independent, multigraded form closes both gaps.
- **E53.** Lemma 4.10's lower bound is proved only for large y_n.
- **E56.** §4.5 proves Theorem 1.5 only on 𝔖^n_𝔥 after shrinking.
- **E58 and E59.** The proof of Theorem 4.12 must show that f is a period map. It must also show that the Theorem 1.1 structure
  and the Baily–Borel structure agree after expansion to ℝ_an,exp; applying Theorem 1.3 to the identity map does this.
- **E42.** Remark 3.1 is false: the Borel–Serre compactification is ℝ_alg-definable in the paper's own corner coordinates. It
  affects nothing.

With the erratum, Theorems 1.3 and 1.6 are not affected.

## Questions for the orchestrator

1. **Mistakes in the erratum.** E30–E33 are misprints in the 2023 erratum, recorded under this paper with erratum locators. If
   the register should hold errata as sources in their own right, they can be moved.
2. **Repair lemmas.** The extraction had added its own repair lemmas and library-support items as items. They were removed as
   not in the paper, and their content was kept in the notes of the items they support. A design job may want them back as
   nodes.
