# REV-PAPER-ZHU-17 — review of the extraction of Zhu, "Affine Grassmannians and the geometric Satake in mixed characteristic"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1152).
- **Authors:** Codex, session `codex-c83e7a`, and Claude Code, session `cc-442dc5` (#2123, which completed it). This reviewer
  took no part in either.

**What was read.**

- **The paper.** Ann. of Math. 185 (2017), 403–492, doi:10.4007/annals.2017.185.2.2, in the published version: 90 pages, with
  printed page = PDF page + 402. Its SHA-256 matches the extraction's record. It was read in full, as page images, in seven
  ranges:
  - §0 (pp. 403–412);
  - §§1.1–1.3 (pp. 412–425);
  - §1.4–§2.2 (pp. 425–440);
  - §§2.3–2.5 (pp. 440–455);
  - §3 (pp. 455–464);
  - Appendix A (pp. 464–482);
  - Appendix B and the references (pp. 482–492).

  Every item was compared with the page. arXiv v2 and v3 were compared where recorded mistakes concern them. Lusztig–Yun
  (arXiv:1203.0521 and the published version) and Howard–Pappas were read where findings depend on them.
- **The libraries.** All library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ZHU-17.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.4007/annals.2017.185.2.2.

## 1. Items

- **Corrected fields (163):** 88 statements, 74 locators and 1 name; ten notes gained a correction. Examples:
  - Many §2 labels were wrong: Lemma for Proposition, Theorem for Corollary.
  - D14 stated Theorem 0.5 for X_≤μ(b), not the stratum X_μ(b).
  - G29 dropped "ind" from "ind-perfect algebraic space".
  - Several Appendix B items wrote Gr_N for its closure.
  - The Lusztig–Yun items cited arXiv v1 numbering, while the bibliography gives the published paper.
- **Removed (1).** G29e duplicated G24; both recorded Proposition 1.20.
- **Added (104).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - the standing notation of §0.5 (Witt vectors, Teichmüller lifts, discs, reductive group schemes, the dual group);
  - the equal-characteristic Grassmannian and its determinant bundle;
  - Gabber's Dieudonné theory;
  - the numbered statements of §§1.2–1.3 (Lemmas 1.5–1.18, Propositions 1.12–1.13, Corollaries 1.7 and 1.19);
  - the semi-infinite orbits and quasi-minuscule coweights of §2.2;
  - the machinery of §2.4 (the commutativity constraint, Θ, the Lusztig–Yun normalised complexes);
  - the Rapoport–Zink inputs of §3.2;
  - the perfect-scheme and equivariant-cohomology foundations of Appendix A;
  - the Demazure-model constructions of Appendix B.

## 2. Statuses

- **Library.** Every library declaration exists at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All eighteen routes are accepted; `PAPER-ZHU-17.review.json` gives a reason for each, based on each route's recorded reason.

- **Titles.** Three Part II titles now begin with their parents' exact atlas titles:
  - "Finite flat group schemes and integral p-adic Hodge theory, Part II: …";
  - "Hecke correspondences and local shtuka cohomology, Part II: integral parahoric models and crystalline diagrams";
  - "Geometric Satake over the Fargues–Fontaine curve, Part II: the rational Gelfand symmetry proof".
- **Briefs.** The briefs of routes 15, 17 and 18 name the confirmed corrections. On the source routes the corrections are on
  the items.
- **Prerequisites.** Rebuilt as 23 cited works, one per entry, each with its DOI or a stable link and the place the paper uses
  it.
  - The old entries bundled works and pointed at bibliography labels.
  - Bhatt–Scholze (2017), which the registry already has, is left out.

## 4. Mistakes

**The extraction's thirty-four.**

- **Rejected (1).** E18: Liu–Yun do derive their theorem from the orbit sign and geometric Satake, as the paper says.
- **Confirmed (33).** Fifteen are revised, as the independent checks upheld:
  - **E1.** Now a gap in arXiv v2's torsor argument, fixed in v3 and the published text.
  - **E27.** Worse than recorded. The top-degree trace depends on the model up to powers of p: perfected Frobenius on
    (P¹)^perf acts by p. So the bases in Remark 2.4 and Corollary 2.9 are canonical only up to powers of p.
  - **E19.** Theorems 0.5 and 3.1 need X_μ(b) nonempty. It is recorded as a misprint, with the correct pages.
  - **E20 and E21.** Revised within §3.
  - **E13, E15, E23, E24, E25, E33 and E34.** Revised in their corrections or locators.
  - **E7, E8 and E9.** Their quotations are fixed.

**New: 41 (E35–E75).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 44 claims, 37 were
  confirmed, 5 reclassified and 2 rejected. The rejected two are Remarks B.5 and B.6, read over-literally. One claim was a
  second finding at the place of E44 and was folded into it.

The main new ones:

- **E64.** §3.2 takes b in G(W)p^μG(W) with a Hodge filtration of type μ. So Theorem 3.10(3) (and Proposition 0.4) fail
  when {μ} is not defined over Q_p; Res_{Z_{p²}/Z_p} G_m is a counterexample. Howard–Pappas and Kim's final version use
  G(W)σ(μ)(p)G(W). The dimension results are unaffected.
- **E46, E51, E53, E58.** Errors in §2:
  - Proposition 2.5's "more precisely" equality fails when S_λ ∩ Gr_{≤μ} is empty.
  - The filtration in the proof of Corollary 2.10 is not complementary.
  - The proof of Lemma 2.11 omits part of the exceptional fibre.
  - The proof of Lemma 2.32 claims H*(Gr_μ) is generated by H², which fails for Gr(2,4).

  The stated results hold, except the refinement in Proposition 2.5.
- **E38, E39, E48, E61, E66.** Gaps:
  - Lemma 1.3 (fpqc against étale quotient);
  - Lemma 1.5 (rank over a subring);
  - Corollary 2.8 (descent to a finite field fails for some wildly ramified F);
  - the twisted trace formula for P^{σ,⋄} (p. 454);
  - Lemma A.7(7).
- **E57.** In Lemma 2.28, c_vect is the Koszul-signed flip.
- **E52 and E71.** Two false side claims that nothing uses:
  - Q_{1/2} is not maximal in type A_n, n ≥ 2 (E52, an error that affects nothing);
  - the choice of J₁ matters unless J₁ is connected (E71, a misprint).
- **E35 and E36.** Theorem 0.3 omits "k algebraically closed", and "adjoint" should read "simple of adjoint type".

The rest are misprints.

The geometric Satake equivalence and the dimension formula stand.

## Questions for the orchestrator

1. **Versions.** E1 concerns arXiv v2 and is fixed in v3. It is kept with its version locator.
