# RT-PAPER-NIKOLAUS-SCHOLZE-18: red team of the Nikolaus–Scholze extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4336).

**Target.** `PAPER-NIKOLAUS-SCHOLZE-18`, the extraction of T. Nikolaus and P. Scholze, *On topological cyclic homology*, [Acta Math. 221 (2018), 203–409](https://doi.org/10.4310/ACTA.2018.v221.n2.a1), with the [correction in Acta Math. 222 (2019), 215–218](https://doi.org/10.4310/ACTA.2019.v222.n1.a2). The arXiv preprint is [1707.01799](https://arxiv.org/abs/1707.01799).

**Who did what.** `cc-442dc5` wrote the extraction (issue #2192). `REV-PAPER-NIKOLAUS-SCHOLZE-18` (`cc-7b31c4`, issue #2193) accepted it. I did neither job.

**Result: eleven findings, five medium and six low. None is high.**

- The extraction is sound in its main lines: the main theorems, the routing, the 0-library status, and the error E1.
- The medium findings are:
  - two item statements that misstate the paper (the coalgebra adjoint of §II.5, and Goodwillie's integral TC);
  - a new source error in §IV.3;
  - one piece of mathematics owned twice;
  - missing items for the ∞-category of spectra.

The machine-readable file is [RT-PAPER-NIKOLAUS-SCHOLZE-18.result.json](RT-PAPER-NIKOLAUS-SCHOLZE-18.result.json).

## Source

I fetched these on 30 September 2026.

| Text | Where | SHA-256 |
| --- | --- | --- |
| Open-access Acta PDF (207 pp., created 31 March 2019) | [intlpress](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) | `8b1856fa…1eb8ef` |
| Acta correction | [intlpress](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0222/0001/ACTA-2019-0222-0001-a002.pdf) | `0b98fb63…f27944` |
| arXiv v2 (7 September 2018) | [arXiv](https://arxiv.org/pdf/1707.01799v2) | `12b6cdbd…0cec3` |

- All three hashes match the ones the extraction records.
- arXiv lists only v1 and v2.
- I found no correction other than the Acta one.

**How I read it.**

- I re-read the whole paper in the text layer, in parallel parts: the introduction with Chapter I, then Chapters II, III and IV, and finally the appendices.
- I checked every finding below myself against the text.
- I checked 22 pages on page images. The text layer loses bars and relation symbols, and two of the findings turn on exactly that.

## What held

- **Locators.** Every locator of items /1–/162 names the right statement and printed page.
- **Coverage.** Every numbered statement is covered by an item or an item's note. The exceptions are expository remarks, plus the gaps in findings 2, 5 and 6.
- **Named topics in the job.** Each has an item: stable ∞-categories, the Tate construction and Tate diagonal, the Segal conjecture (Lin, Gunawardena), genuine and Borel spectra, both kinds of cyclotomic spectra, THH and its Frobenius, TC = map(S, THH), the bounded below equivalence, Frobenius lifts, spherical Witt vectors and TC(F_p). The paper never computes TC of perfect F_p-algebras beyond F_p.
- **Source issues.** E1 re-derives. Over KU with trivial action, the two fibres are ∏Ω^∞W_p^{hT} and ∏Ω^∞W_p^{hC_{p^∞}}, and W_p^{hC_{p^∞}} ≃ W_p because the Tate group cohomology of C_{p^∞} with rational coefficients vanishes in positive degrees. The Gysin fibre Σ^{−2}W_p^{hT} is non-zero, so the fibres differ. No later theorem uses the false identification, since §II.6 uses the coalgebra functor instead.
  - E2's cover gap and its repair hold.
  - E3's counterexample holds; TC of a connective cyclotomic spectrum is (−2)-connective.
  - E4 and E5 hold. The F_p^×-invariant classes sit in degrees 2n(p−1).
  - E6–E19, E20, E21, E23, E24 and E25 hold.
  - E22 is wrong as the review amended it (finding 9).
- **Library.** The cited declarations exist at Mathlib `082e2d3` and Tau Ceti `f790474`:
  - `tateCohomology` and `tateCohomologyFunctor`;
  - `WittVector.frobenius` and `frobenius`;
  - `LocalizedMonoidal`, `SSet.Quasicategory` and `SSet.KanComplex`;
  - `Rep.FiniteCyclicGroup.periodicIso` and `tateCohomologyIsoEven`.

  I also searched the index for spectra, equivariant spectra, Postnikov towers, Hochschild homology, the cyclic category, homotopy colimits, Steenrod operations and ∞-categorical Verdier quotients. None of them is there, so no item should be `library`, and none is.
- **Planned statuses.** I checked them against the layer texts of RT.1–RT.4, E5:abstract, E5:presentability, H.1, H.2, H.5, H.6, L.4 and L.5. H.2's text plans the levelwise-realisation theorem, so /159 is right. L.5 plans Bökstedt periodicity and TC of perfect fields, so /130–/133 are right.
- **Later packets.**
  - The KTheoryFiniteLocalFields packet imports cyclotomic and genuine foundations from RT.2 and cites Theorem II.4.10. This matches routes 1 and 5.
  - The E5 packet plans none of route 3's items.
- **Route 6.** The Part II is justified. No layer and no Tau Ceti roadmap plans the Steenrod algebra, the Adams spectral sequence or the Segal conjecture. Benoist–Wittenberg's semi-algebraic Steenrod squares are a different object.

## Findings

### 1. /68–/70, /74 write R_F for R_{F̄} (medium, error)

Two different right adjoints are involved:

- R_F: C → C is the right adjoint of F;
- R_{F̄} is the right adjoint of the shifted-coalgebra functor F̄ on CoAlg_F.

On pp. 270 and 276 the page images show R_{F̄}. The text layer drops the bar.

Item /70 states the conclusion of Lemma II.5.4 as "the counit F R_F → id is an equivalence". That is the lemma's standing hypothesis. The actual conclusion is that F̄R_{F̄} → id is an equivalence. The item also omits two hypotheses the lemma uses:

- F preserves pullbacks;
- C is presentable and F preserves colimits.

These lemmas carry the proofs of Theorem II.5.6 and Lemma II.5.11, and through them the main equivalence.

**Fix.** Write R_{F̄} in /68, /69 and /74, and restate /70 with the hypotheses and the correct conclusion.

### 2. /60 misstates integral TC^gen; the p-completion facts have no item (medium, error)

- **Where the definition is.** Goodwillie's integral TC^gen is diagram (1) on p. 266, not part of Definition II.4.4.
- **What it is.** It is the pullback X^{hT} ×_{∏(X_p^∧)^{hT}} ∏ TC^gen(X,p)_p^∧, taken over primes. The item says "over all n".
- **Missing facts.** No item states the paper's facts about completion:
  - the vertical maps of (1) are profinite completions;
  - TC(X)_p^∧ ≃ TC(X_p^∧) ≃ TC(X_p^∧, p) for bounded below X.

  Proposition IV.3.4 (pp. 351–352) cites the second fact.

**Fix.** Correct /60, and add one item to route 1.

### 3. Proposition IV.3.4 and Lemma IV.3.5 need a T-action; new source error (medium, error)

- **The mismatch.** The paper states both results for p-cyclotomic spectra, which carry only a C_{p^∞}-action, with a C_{p^∞}-equivariant Frobenius lift (p. 351). The proofs use X^{hT}, ΣX_{hT} and "the T ≅ T/C_p-equivariant map φ̃_p" (p. 353).
- **The paper's claim.** The paper covers the gap with "the C_{p^∞}-action on X_p^∧ extends automatically to a T-action" (p. 352). Its own Remark II.1.3 says the opposite: "not every C_{p^∞}-action on a p-complete spectrum extends to a T-action".
- **A counterexample.** Take HF_p[C_{p^∞}] with the translation action and zero Frobenius. It is bounded below and p-complete, and it has a Frobenius lift. But C_{p^∞} acts non-trivially on π_0, so the action cannot extend to the connected group T.
- **Consequences.** Item /124 copies the hypothesis. Theorem IV.3.6, the application, has a T-action and is unaffected.

**Fix.** Restate /124 for cyclotomic spectra with a T-equivariant lift, and record the mistake as E26.

### 4. Trivial cyclotomic spectra are owned twice (medium, duplicate)

- **NS18's route.** Item /136 (Proposition IV.4.14: X ↦ X^triv is left adjoint to TC) goes to RefinedTraceMethods:RT.2 in route 1.
- **CMM's route.** The accepted extraction PAPER-CLAUSEN-MATHEW-MORROW-21 routes the same statement, its item /021, as missing to the Part II RefinedTraceMethodsPartIIHenselianPairs. Its item /022 (HF_p^triv) overlaps /135–/137.
- **Consequence.** The pending DESIGN-RefinedTraceMethodsPartII would plan trivial cyclotomic spectra again.

**Fix.** RT.2, which defines Cyc Sp, is the right owner. Note the overlap in /136 and /137. For the maintainer, CMM's /021 should become planned in RT.2.

### 5. No items for Sp, bounded below spectra, p-completion or Postnikov truncations (medium, missing)

The paper works in the ∞-category Sp throughout and takes these from Higher Algebra:

- Sp itself, with ⊗_S and the sphere S (p. 205);
- bounded below spectra and p-completion (Theorem 1.7, p. 211);
- Postnikov truncations (Lemma I.2.6).

None of them has an item or a status, although dozens of items are stated in their terms.

They are planned only piecemeal:

- H.5 plans a concrete spectrum model;
- H.6 plans p-completion;
- E2 plans Postnikov towers;
- the comparison with the abstract stable ∞-category (E5:spectra-comparison) is described in its own packet as late and "not a prerequisite".

RT.2 needs the symmetric monoidal ∞-category Sp from the start.

**Fix.** Add three definition items with these planned statuses, plus a request that RT.2 import Sp early.

### 6. /138's inputs have no items (low, missing)

Item /138 gives the fibre sequence for TC of E_2-rings of characteristic p, "even if A is not bounded below". It rests on two inputs:

- **Footnote 9, p. 219.** The Tate orbit and fixpoint lemmas hold for all HZ-modules. /12 assumes bounded below and /19 covers only Eilenberg–MacLane spectra HM.
- **The Mahowald–Hopkins theorem (Remark IV.4.5, p. 357).** HF_p is the free E_2-algebra with p = 0. It gives an E_2-map HF_p → A. That map suffices for the module structure, although both the paper and /138 call A an "E_2-HF_p-algebra".

**Fix.** Add both as items, and correct the wording of /138.

### 7. Three imprecise item statements (low, error)

- **/104.** The item claims the F-equivalence for every orthogonal ring spectrum R. The paper's argument needs properness, which Lemma III.5.2 proves only for R levelwise well pointed with S⁰ → R_0 an h-cofibration.
- **/55.** The two sides of the coherence identity start from Φ^{C_m}Φ^{C_n}X and Φ^{C_n}Φ^{C_m}X respectively.
- **/155.** The item copies the paper's "proper paracyclic" in Proposition B.19(ii). It must be "cyclic", because sd_p^* is only defined on cyclic objects.

### 8. Five unrecorded misprints (low, missing)

All five are also in arXiv v2, and the correction does not list them.

| Page | Printed | Should be |
| --- | --- | --- |
| p. 238 | cites Lemma I.2.6 (ii) for Postnikov limits | Lemma I.2.6 (i) |
| p. 310 | min over H ⊊ V | H ⊊ C_p |
| p. 395 | Proposition B.19(ii): "paracyclic" | "cyclic" |
| p. 389, footnote 46 | "successor" | "predecessor" (otherwise f is not non-decreasing) |
| p. 378 | the transformation G′_1F → G′_0 | G′_0 → G′_1F, matching the 2-cell G_0 → G_1∘LF on p. 377 |

### 9. The review's amendment of E22 is wrong (low, error)

- **What the review changed.** The review rewrote E22's locator to say that the correction lists "five occurrences" of "[?]" and does not list pp. 281 and 284.
- **What the correction says.** It lists seven occurrences, including "page 281, line 6" and "page 284, line 11". These are Remarks II.6.4 and II.6.10.
- **The original.** The extraction's original locator was right.

### 10. The review's route reasons do not match the routes (low, other)

- **Route 1.** The review says "22 planned"; route 1 has 15.
- **Route 3.** The review lists lax equalizers and coalgebras. Those are in route 1.
- **Route 4.** The review lists the cyclic categories and the cofinality theorem. Those are also in route 1.

The verdicts stand, but the reasons should describe the routes as they are.

### 11. Record-keeping under §18 (low, other)

- **No review verdicts.** No sourceIssue carries the reviewer's `review` block. As a result, `research/errata/REGISTER.md` lists all nineteen new NS18 mistakes, E1 included, as awaiting review.
- **No `sourceVersions`.** The file has no `sourceVersions` list, although E1 affects a stated result. `scripts/check_errata.py` flags this.

**Fix.** Add `sourceVersions` with the three texts above, and the review verdicts.
