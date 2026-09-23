# REV-PAPER-KISIN-PAPPAS-18 — review of the extraction of Kisin–Pappas, "Integral models of Shimura varieties with parahoric level structure"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1461).
- **Authors:** Codex, session `codex-c83e7a` (#1684), and Claude Code, session `cc-fb70e5` (#2014, which completed it).
  This reviewer took no part in either.

**What was read.**

- **The paper.** Publ. Math. IHÉS 128 (2018), 121–218. The 98-page Numdam PDF was re-fetched; its SHA-256 (`e2b4a076…`)
  matches the extraction's, and printed page = PDF page + 120. It was read in full, as page images, in six ranges:
  - the introduction and §§1.1–1.2;
  - §§1.3–2.2;
  - §2.3 and §3.1;
  - §§3.2–3.3;
  - §§4.1–4.5;
  - §§4.6–4.7 and the references.

  Every item was compared with the page.
- **The sequel.** Kisin–Pappas–Zhou (Forum Math. Pi 2026) was read at §§1.3.1 and 7.3, where the authors list their own
  corrections to this paper.
- **The libraries.** All 14 library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-PAPPAS-18.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no correction record for doi:10.1007/s10240-018-0100-0. The authors' corrections are in
  Kisin–Pappas–Zhou.

## 1. Items

- **Corrected fields (97):** 73 statements, 21 locators, 2 kinds and 1 name. Examples:
  - G07 claimed a closure description for GL_D that the paper does not give.
  - G08 made existence depend on faithfulness.
  - R04 and R06 held instructions rather than the paper's statements.
  - D16 repeated the false claim of Lemma 3.2.9.
  - M01 misplaced where the global Grassmannian's torsors are trivialized.
  - Several locators named the wrong part or footnote.
- **Item removed:** D07. Its content, the relative-frame functor and its normal-pair basis, is Kisin–Pappas–Zhou
  §5.1.4–5.1.18, not this paper's.
- **Items added (105).** They cover the inputs and constructions the proofs use:
  - the Bruhat–Tits extension principle and big-cell criteria;
  - Landvogt's maps of buildings;
  - Prasad–Yu tame descent and Edixhoven's fixed points;
  - Tits' irreducible representations and minuscule weights;
  - Gille's Serre II and the flasque and rank-one parahoric steps of §1.4;
  - the Pappas–Zhu and Görtz local-model inputs of §2;
  - the display, Zink, Breuil, de Jong, Raynaud–Gruson, Broshi and Haines–Rapoport inputs of §3;
  - the Shimura-datum, Deligne, Moret-Bailly, Faltings–Chai and Madapusi Pera inputs of §4.

  Duplicates across ranges were merged. Moret-Bailly is planned (PotentialModularityAndCompatibleSystems R23.1); the rest
  are routed with their sections' existing items.

## 2. Statuses

- **Library.** All 14 library declarations exist at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All ten routes are accepted; `PAPER-KISIN-PAPPAS-18.review.json` gives a reason for each. The corrections:

- **Titles.** Five Part II titles now begin with their parents' exact atlas titles:
  - "Reductive algebraic groups, Part II: …" (twice);
  - "Geometric Satake over the Fargues–Fontaine curve, Part II: integral local models";
  - "Finite flat group schemes and integral p-adic Hodge theory, Part II: tensors and displays";
  - "Complex Shimura varieties and canonical models, Part II: integral models and reduction".
- **Briefs.** Each brief now names the confirmed corrections its design must carry.
- **Prerequisites.** Rebuilt as 22 papers the paper cites, each with its DOI. The old entries pointed at bibliography
  numbers. Dropped:
  - Kisin (2017) and Kisin–Pappas–Zhou (2026), which the registry already has;
  - Hu (2013), which the paper does not cite.

## 4. Mistakes

**The extraction's seven.** E1–E7 record the authors' own corrections in Kisin–Pappas–Zhou. All are confirmed, and five are
revised:

- **E2:** its locator is extended to §3.3.11, where the same choice of Ψ is made again.
- **E3:** widened to Proposition 4.2.2, Corollary 4.2.4, the last assertion of Lemma 4.5.9 and Theorem 4.6.23, all of which
  need a very good Hodge embedding. Proposition 4.3.7 is left out: its use of 4.2.2 is replaceable, since normalization
  commutes with finite étale change of prime-to-p level.
- **E4:** reclassified as a misprint affecting nothing. q^loc is a trivial torsor for the action on the Dieudonné side.
- **E6:** extended to (4.6.20) in the proof of Corollary 4.6.18, which the authors' erratum omits.
- **E7:** now affects nothing. 4.6.21 is used only for abelian-type data.
- **Attribution:** the credit to Yu Luo and Peihang Wu is moved from E7 to E6.

**New findings.** 75 further claims were each checked a second time, independently, on the page image:

- 73 confirmed, 3 of them reclassified;
- 2 rejected:
  - the uniqueness in Lemma 3.1.17 follows at once from the proof's estimate;
  - weak admissibility in §3.2.5 does hold, so citing [43] Lemma 1.4.5 is fine.

The 73 are E8–E80. None is in the authors' correction lists. The main ones:

- **E17 (error, a stated result).** Lemma 1.4.6 needs cd(Frac W(k)[[u]]) = 2, which fails for finite k (it is 3). The
  lemma is used only for k algebraically closed, so Proposition 1.4.3 stands. Fix: add that hypothesis.
- **E58 (gap, stated results).** Corollaries 4.2.12 (second sentence) and 4.2.13 assume K_p = K_p°, but the Lang step
  needs 𝒢 = 𝒢°. A norm-one torus of Q_p(p^{1/3}) with p ≡ 2 mod 3 separates the two. Kisin–Pappas–Zhou Theorem 7.1.3(3)
  assumes 𝒢 = 𝒢°.
- **E51 (gap, a stated result).** Proposition 3.3.13 applies Proposition 3.3.8 to a new deformation whose étale tensors
  need not define a Bruhat–Tits stabilizer. An extra hypothesis is needed; it holds in the paper's one application.
- **E31 (misprint, a stated result).** In §2.3.15 the Grassmannian has rank ½·dim V′.
- **Errors in proofs whose statements survive:**
  - E13: the construction (1.2.23)–(1.2.24) keeps one factor where K_1 ⊗_K K^ur splits.
  - E29: the proof of Proposition 2.3.7 omits the degrees of the centralizer division algebras; the D^× example is checked.
  - E41: "E([π]) is not a zero divisor" is false, since p − V(1) kills it; only φ(E([π])) is needed.
- **Gaps in proofs:**
  - E15: Proposition 1.3.9, which restricts scalars along an infinite extension.
  - E21: Proposition 1.4.3, Step 3, which uses Bruhat–Tits theory over an imperfect residue field.
  - E27: Lemma 2.3.3.
  - E33: Corollary 2.3.16.
  - E43: Corollary 3.2.11, which proves membership in W, not Ŵ.
  - E46: Proposition 3.2.17.
  - E59: Lemma 4.3.2, where the inertia group is needed.
  - E61: Lemma 4.4.6.
  - E70: Lemma 4.6.22(3), where only one prime is shown to split; a repair is given.

The rest are misprints.

## Questions for the orchestrator

1. **Titles for shared Part II ids.** As in the Kisin (2017) review, the extractions sharing each id use varying titles.
   This review uses the parents' exact atlas titles; the design jobs should settle one per id.
2. **Items that record corrected statements.** The extraction folds the authors' corrections into some item statements, as
   the protocol asks, and records the printed text under `sourceIssues`. The reviewed items follow that convention.
