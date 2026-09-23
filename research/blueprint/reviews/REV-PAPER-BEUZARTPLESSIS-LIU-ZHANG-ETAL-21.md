# REV-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 — review of the extraction of Beuzart-Plessis–Liu–Zhang–Zhu, "Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1114).
- **Author:** Claude Code, session `cc-39fac3` (#2043). This reviewer took no part in it.

**What was read.**

- **The paper.** Ann. of Math. 194 (2021), 519–584, doi:10.4007/annals.2021.194.2.5. It was read, as the extraction read it,
  in arXiv:1912.07169v3, the authors' final version: 48 pages, with printed page = PDF page. The PDF and the TeX source both
  have SHA-256 hashes matching the extraction's record. It was read in full, as page images, with the TeX source for formulas,
  in six ranges:
  - §1 (pp. 1–8);
  - §2.1 to Lemma 2.21 (pp. 8–15);
  - the rest of §2.4 (pp. 15–21);
  - §3 (pp. 21–31);
  - §4.1–§4.2 (pp. 31–37);
  - §4.3–§4.4, Appendix A and the references (pp. 37–48).

  Every item was compared with the page. Chaudouard–Zydor (arXiv:1611.09656) and Ramakrishnan (arXiv:1806.08429) were
  checked where the paper cites them.
- **The libraries.** The extraction has no library items. Mathlib 082e2d3 and Tau Ceti f790474 were searched for the new
  items (Weierstrass products, Paley–Wiener, parabolic induction), and neither has them.
- **The atlas.** Every planned stage was checked in `data/atlas.json`, and so were the candidate roadmaps the routes coalesce
  with.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.4007/annals.2021.194.2.5.

## 1. Items

- **Split (20).** Twenty items bundled several numbered results, for example "Lemmas 2.20, 2.21 and 2.23" and "Definitions
  3.3–3.5". The protocol asks for one item per numbered result, so each is narrowed to its first result. Its other results are
  added as items of their own:
  - items 10 and 39 in §1;
  - items 12, 13, 14, 18, 22, 23 and 25 in §2;
  - items 29, 35, 36 and 37 in §3;
  - items 44, 45, 50 and 51 in §4.1–§4.2;
  - items 41, 54 and 63 in §4.3–§4.4 and Appendix A.
- **Corrected fields (98):** 41 statements, 36 locators, 17 names and 4 kinds; three notes gained a correction. Examples:
  - Theorem 1.1 lets σ be non-unitary, and ω lives on the maximal F-split central torus. Under a unitary-only reading the
    theorem is false: the trivial representation of SL_2 would count as non-CAP.
  - Lemma 2.20 was stated with its bound for each ϑ separately, which is false.
  - Remark 2.16 was said to be "known for G split"; the paper proves only the "if" direction there.
  - The relative fundamental lemma (item 46) now includes the vanishing on the non-split hermitian space, which pp. 38 and 41
    use.
  - Lemma 4.12 (item 53) needs χ^V to base-change to χ′.
  - Theorem 4.14 (item 58) now carries "π cuspidal automorphic" in part (4) (E45).
  - §4 begins on p. 31, and the proof of Theorem 1.10 is on p. 43; several locators pointed one page early.
- **Removed:** none. Every item is in the paper.
- **Added (65).** They are the results split off above, and definitions, constructions and cited inputs the proofs use without
  an item. Examples:
  - Lemma 2.2, Proposition 2.4, Corollaries 2.5–2.6 and Remarks 2.7, 2.9 and 2.17;
  - θ of a real form, the abstract Cartan, the seminorms p_{ϑ,M,r} and the difference-operator algebras of §2.4;
  - Lemmas 2.21 and 2.23, Kostant's annihilating polynomial, Harish-Chandra's subquotient theorem and generic irreducibility;
  - Definitions 3.1, 3.4, 3.5 and 3.9, the level-K spaces, Arthur's admissible maximal compact subgroups;
  - the types 𝔗_M and levels K_M of §3.3, Lemmas 3.13–3.14 and Propositions 3.15 and 3.17;
  - Theorem 3.19, the main result of §3;
  - the Jacquet–Shalika classification, which turns Theorem 3.19 into Theorem 1.3;
  - Proposition 4.2, Definition 4.4(1)–(3), the base change maps (4.5)–(4.7) and Remark 4.10;
  - Zhang's positive-type test functions, Asai poles, Rodier heredity, pure inner forms and the quasi-split pair V*;
  - the reductions (A.2)–(A.5), Paley–Wiener for split tori, Aizenbud–Gourevitch and Sakellaridis in Appendix A.

  One is already supplied: normalized parabolic induction is planned at SmoothRepresentationsOfLocalGroups SR.2 and
  AutomorphicSpectralTheory AS.1. Two pairs of duplicate proposals were merged.

## 2. Statuses

- **Library.** No item is in the libraries at the pinned commits.
- **Planned.** Every planned stage exists, and its description covers the item.

## 3. Routes

All three routes are accepted; `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.review.json` gives a reason for each, based on each
route's recorded reason.

- **Titles.** Both Part II titles begin with their parents' exact atlas titles. All three routes use the same ids and titles
  as the candidates other papers propose.
- **Briefs.** All three briefs now name the confirmed corrections their designs must carry.
- **Prerequisites.** The 25 cited works, one per entry, were checked against Crossref. Jacquet–Shalika (1981), used for Theorem
  1.3, is added. None of them is in the paper registry.

## 4. Mistakes

**The extraction's nine.** All are confirmed. Two are revised, as the independent checks upheld:

- **E1.** The written proof of Proposition 4.13(1) works whenever BC(π^V) is cuspidal, and fails only when it is a non-trivial
  isobaric sum. The repair via Theorem 3.19 survives Lemma 4.12's rescaling of the multiplier. The locator is now pp. 38–39.
- **E4.** Only the double bars in (2.2) are a misprint. The |u| ≤ 1 versus |u| = 1 mismatch is harmless by the maximum
  modulus principle.

**New: 38 (E10–E47).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 40 claims, 39 were confirmed
  and 1 rejected. The duplicated label [BP], found twice, is one entry (E38).
- **Rejected:** that Proposition 4.11's "the subspace S_tr" is ambiguous. The subspace of all functions with a transfer is a
  valid choice, the proof of Proposition 4.11 uses exactly that reading, and p. 36 says the proposition is not used.

The main new ones:

- **E39.** The proof of Proposition 4.7 extends Chaudouard–Zydor from pure tensors "by density". Their theorem already covers
  finite sums of pure tensors that match as a whole. What it does not cover is a matching pair whose archimedean component lies
  in the completed Schwartz space. Density alone does not preserve matching, and nothing is known about continuity of the
  archimedean transfer. Proposition 4.13 and the proof of Theorem 1.8 apply it to such pairs, so Theorems 4.14 and 1.8–1.10
  rest on this step. The extension is expected to hold, and later work uses the same framework, so it is recorded as a gap in
  the proof.
- **E45.** Theorem 4.14(4) is false as printed for an arbitrary irreducible admissible π: changing π_∞ leaves BC(π) unchanged.
  It needs "π cuspidal automorphic", which its one use, in Lemma 4.16, satisfies.
- **E19.** Remark 2.16 says the infinitesimal characters of G are exactly ⋃_ϑ h*_{ϑ,C} ⊕ Y*_ϑ. For SU(2), 0 is in the union
  but is not an infinitesimal character, so the kernel description fails. For SU(3), the "only if" half of the remark's
  conjecture fails too. Theorem 2.13 uses only the inclusion. E25 is the same overstatement for tempered representations in the
  proof of Proposition 2.24, where it affects nothing.
- **E16.** The set of involutions of the root datum is said to be finite. It is not, already for G_m², nor for GL_n × GL_{n+1}
  at a real place. Lemma 2.10 needs θ finite, which holds from §2.3 on.
- **E36.** In the proof of Proposition 3.17 for M = G, a bare element of H_G^T is not a T-multiplier; the multiplier is
  μ⁰_∞ ⊗ h.
- **Gaps reaching a proof:**
  - E21: Lemma 2.18, where limits of discrete series must be included;
  - E34: Lemma 3.12, which needs finitely many conjugate levels;
  - E35: Lemma 3.13, whose proof never uses the first χ_∞-typicality condition, without which the conclusion fails;
  - E43: Proposition 4.13, where S must be enlarged so that π^V is unramified outside it.
- **E12.** The strategy sketch on p. 6 says the K_∞-type step alone leaves finitely many components with M = G. Level-one Maass
  forms for PGL_2 show it does not; the proof in §3.3 is unaffected.
- **E31.** Remark 3.10's final "only if" fails for G = SL_1(D); it is never used.
- **E10.** Remark 1.2(2) needs a fact the paper does not prove for general G.
- **E37 and E38.** [PS79] is printed where [JS81, Theorem 4.4] is meant, and two different works share the label [BP].

The rest are misprints.

With the corrections, Theorems 1.1, 1.3 and 1.4 stand. Theorems 1.8–1.10 and 4.14 hold once the extension in Proposition 4.7
is supplied (E39), and Theorem 4.14(4) needs π cuspidal automorphic (E45).

## Questions for the orchestrator

1. **The archimedean extension in Proposition 4.7 (E39).** It is recorded as a gap in the proof, not as an error in a stated
   result, because the extension is expected and later work relies on the same framework. The design of the Jacquet–Rallis
   Part II should either prove it or keep the test functions in the algebraic tensor product.
2. **Split items.** Twenty bundled items were split, so the item count rose from 63 to 128. The original ids keep their first
   numbered result.
