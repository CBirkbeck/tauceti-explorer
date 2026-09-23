# REV-PAPER-DUKE-IMAMOGLU-TOTH-16 — review of the extraction of Duke–Imamoḡlu–Tóth, "Geometric invariants for real quadratic fields"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1171).
- **Authors:** Codex, sessions `codex-c83e7a` and `codex-a71f92`, and Claude Code sessions, among them `cc-fb70e5` and
  `cc-442dc5` (#2089, which completed it). This reviewer took no part in any of them, nor in the errata job and its review.

**What was read.**

- **The paper.** Ann. of Math. 184 (2016), 949–990, doi:10.4007/annals.2016.184.3.8, in the published text: 42 pages, with
  printed page = PDF page + 948. Its SHA-256 matches the extraction's record. It was read in full, as page images, in five
  ranges:
  - §§1–3 (pp. 949–959);
  - §§4–5 (pp. 959–967);
  - §§6–7 (pp. 967–973);
  - §§8–10 (pp. 973–983);
  - Appendix A and the references (pp. 983–990).

  Every item was compared with the page.
- **Other sources.** The extraction's items and recorded mistakes that live in other sources were checked there:
  - Duke–Imamoḡlu–Tóth, Ann. of Math. 173 (2011) ("DIT11");
  - Biró, Acta Arith. 94 (2000), in the author's copy of the published text;
  - Duke, Invent. Math. 92 (1988), in the author's copy.
- **The libraries.** All library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.4007/annals.2016.184.3.8.

## 1. Items

- **Corrected fields (103):** 73 locators and 30 statements; five notes gained a correction or library link. Examples:
  - Most §2 locators were about two pages late and cited shifted equation numbers, for example (2.7) for Gauss–Bonnet, which
    is (2.8).
  - Many §5 locators were one equation number too high.
  - Item 29 mixed the fundamental polygon of Γ_A with the core F_A, and paired the end arcs by T^m instead of T^mS.
  - Item 30 called the points w_k "cyclic rotations"; they are integer translates of the rotations.
  - Item 150 now states the corrected (6.6) (E6) on its own.
- **Removed (31), not in the paper.**
  - What they were:
    - the extraction's own repairs, adapters and regression examples, for Appendix A, E6 and E13;
    - library-support items (hypergeometric series, Beta/Gamma identities, dominated differentiation, duality, Vitali, the
      theta function);
    - the planning items 156, 173 and 174;
    - steps inside the proofs of DIT11 (Lemma 9) and Biró (Lemmas A.2–A.3, Lemma 10 and identity (14), the one-point
      principle) that this paper neither states nor cites;
    - item 132, an observation behind E2.
  - All of them were checked and are true.
  - Their content is kept where it is used:
    - the Rankin–Selberg norm identity is in item 150's note;
    - the library links are in item 118's note;
    - the Frobenius uniqueness step is recorded as E11.
  - The items for the results this paper cites from DIT11, Biró (p. 129) and Duke (1988, Theorem 5) stay.
- **Added (31).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - the narrow class number;
  - the standard domain F and the surface F_Γ with its boundary convention;
  - the generators and signature of PSL(2,ℤ);
  - the infinite index of Γ_A;
  - the arc-cutting construction (3.6);
  - the vanishing of the wrong-sign Weyl integrals;
  - Siegel's theorem and the class number formula;
  - completed Hecke L-functions and Hecke's formulas;
  - the oriented cycle C_Q and the geometric trace T(φ,χ);
  - Fay's Fourier expansions of the resolvent in weights 0 and 1/2;
  - the Shimura Dirichlet-series identity;
  - the series (A.2) and (A.3) and the Bessel equation of Appendix A.

  Three of them are planned at AnalyticNumberTheory AN.4, which plans Hecke characters, completed L-functions and the class
  number formula.

## 2. Statuses

- **Library.** All 16 remaining library declarations exist at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All ten routes are accepted; `PAPER-DUKE-IMAMOGLU-TOTH-16.review.json` gives a reason for each.

- **Titles.** Both Part II titles already begin with their parents' exact atlas titles.
- **Briefs.** Route 9's brief now names the corrections to the proof of Theorem 1 (E19, E20). Routes 1–8 are source routes
  and have no briefs, so their corrections are on the items:
  - item 106 (Lemma 6) carries E28 and E30;
  - item 127 (Proposition 6) carries E8 and E33;
  - item 94 carries E26;
  - item 150 carries E6.
- **Prerequisites.** Rebuilt as 22 cited works, one per entry, each with its DOI and the place the paper uses it. The old
  entries bundled several works each.

## 4. Mistakes

**The extraction's sixteen.** All are confirmed. Five are revised, as the independent checks upheld:

- **E3.** The quotation now has its "=".
- **E6.** Now an error: (6.6) is false as printed, not just unproved.
  - With a(1) = 1, Theorem 4 and Duke's Theorem 5 give an extra factor cosh²(πr/4).
  - D = −4 disproves the printed bound.
  - The unit-vector form is what Theorem 2 uses.
- **E8.** Widened: the proof of Proposition 6 also writes D^{3/4} and "D > 1".
- **E11.** A small gap in the proof of (A.1): uniqueness at t = 0, termwise integration, and differentiation under the
  integral. Lemma 7 itself is true.
- **E14.** DIT11 prints U₄∘W₄ where W₄∘U₄ is meant. It affects nothing.

E12–E14 are mistakes in DIT11 and Biró, which the extraction read, not in this paper; see the questions below.

**New: 18 (E17–E34).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 21 claims, 17 were
  confirmed, 1 reclassified and 3 rejected.
- **Rejected:**
  - an imprecise citation for the correct weight-1/2 Eisenstein series;
  - the termwise integration in the deduction of Theorem 2, a routine step;
  - the "as in Biró p. 129" step, which Baruch–Mao's theorem covers.

The main new ones:

- **E28.** Lemma 6 has DIT11's orientation, opposite to the C_Q of Lemma 5. Combined with (9.2) and Lemma 7, it gives minus
  Lemma 5, and this was checked numerically for D = 12, 21 and 28. So one of the two lemmas is false as printed. Theorem 4 is
  unaffected.
- **E19 and E20.** The proof of Theorem 1 has two gaps:
  - it does not show that the arc from z to γ(z) crosses the circle about n_1;
  - it reads the class from distances between lifts in H rather than on the surface, and at D = 28 the cycle it uses is
    not intrinsic.

  The theorem is true. The repair treats F_A as an orbifold with its cone points and normalises at the cusp.
- **E22.** ⟨½θ, ½θ⟩ = π/2, not 6. This was checked two ways.
- **E24.** The Conrey–Iwaniec exponent is 5/12, not 1/3.
- **E26.** The residue of Φ(−m,n;s) on p. 975 has a(m)a(n) where a(−m)a(n) is right.
- **E33.** The p = 2 Euler factor in §10 is undefined. B_r should be taken among plus-space eigenfunctions at 2.
- **E30.** Lemma 6's hypothesis on φ is too strong for its use in Lemma 5.

The rest are misprints. E22, E24 and E26 are false statements in remarks that nothing uses.

With the corrections, Theorems 1–4 stand.

## Questions for the orchestrator

1. **Mistakes in other sources.** E12–E14 record mistakes in DIT11 and Biró, which the extraction read. The protocol has an
   extraction list mistakes found in its sources, so they are kept and confirmed here, with locators naming the source. The
   errata review of this paper (REV-ERRATA-PAPER-DUKE-IMAMOGLU-TOTH-16) left them out of the errata file. The register
   should attribute them to DIT11 and Biró.
2. **Reach of false remarks.** False statements in remarks that nothing uses (E5, E22, E24, E26) are recorded here as
   errors affecting nothing. The errata review recorded E5 as reaching a stated result. One convention should be chosen.
3. **Repair items.** As in the Bakker–Klingler–Tsimerman review, the extraction's own repair, adapter and library-support
   items were removed as not in the paper, and their content was kept in notes and in the mistakes. A design job may want
   them back as nodes.
