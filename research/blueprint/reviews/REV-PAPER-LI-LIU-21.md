# REV-PAPER-LI-LIU-21: independent review of the Li–Liu 2021 extraction

**Verdict: accept, with the extraction corrected in place.** All nine routes are accepted. Routes 8 and 9 were added by this review. E1–E11 are confirmed, E3 is settled, and nine new source issues are recorded (E12–E20).

Reviewer: Claude Code, session `cc-58621d`, 30 September 2026. Issue #1116.

**Independence.** The extraction was written by Claude Code, session `cc-fb70e5` (#1115). This session did not write it, and did not write the 2026-09-22 edit that recorded E10–E11; `cc-58621d` appears in none of the reviewed files.

**Earlier partial reviews.** The maintainer's note on #1116 asked the next reviewer to continue from the merged checkpoint, settle E3, and use the closed review where it holds up. This review does that.
- **The checkpoint.** ChatGPT's merged checkpoint (#2841) found E3's conditional input real and asked for a precise comparison before accepting any route. Section 1 answers it.
- **The closed review.** The full review on branch `cc-7b31c4-rev-liliu` (closed PR #2844) was written without seeing the checkpoint. It accepted all seven routes and confirmed all eleven issues. Its route reasons and several issue corrections held up and are reused; the counting fix for E6 is one of them. Its E3 verdict rested on the theorem number alone, and is replaced by the check below.

Deliverables: [PAPER-LI-LIU-21.result.json](../papers/PAPER-LI-LIU-21.result.json) (corrected in place), [PAPER-LI-LIU-21.review.json](../papers/PAPER-LI-LIU-21.review.json), the updated report [PAPER-LI-LIU-21.md](../papers/PAPER-LI-LIU-21.md), and this file.

## What was read

- **Li–Liu, authors' final version.** [AIPF.pdf](https://www.math.columbia.edu/~chaoli/AIPF.pdf), dated 20 October 2021, SHA-256 `6ef2d63e…e5e566`, the file the extraction read. It was re-read at every locator, with rendered pages where a glyph decides the question: the underlined u̲ on p.44, ⩾ on p.5, and the (G3) and Ψ passages on pp.12 and 20.
- **arXiv 2006.06139v5.** SHA-256 `b3705e15…cec289`, compared with the final version at every locator. arXiv still shows v5 as the latest version (checked 2026-09-30).
- **The typeset Annals article.** It is paywalled and was not read. `sourceVersions`, which the extraction lacked and `check_errata` requires, now says so.
- **Li–Zhang.** arXiv 1908.01701v3, §§10.4–10.5: Conjecture 10.4.1, Lemma 10.4.2, Theorem 10.4.3, Theorem 10.5.1 and Remark 10.5.4.
- **Li–Rapoport–Zhang.** arXiv:2404.02214v2: Theorem 14.6.2, Example 14.6.3, §16 and Corollary 16.1.5.
- **Disegni–Liu.** arXiv 2204.09239v3, §4.10 (Remarks 4.50–4.51) and Lemma 4.7.
- **Crossref and the Annals article page**, re-checked 2026-09-30: no correction notice or update relation.

## 1. E3 settled

**The problem.** Proposition 9.1 computes the local index at a place above S_π with Li–Zhang Theorem 10.5.1. Li–Zhang prove that theorem assuming their Conjecture 10.4.1: "Note that the result is conditional on Conjecture 10.4.1". Since |S_π| is odd, every application of Theorems 1.5 and 1.7 and Corollary 1.9 passes through such a place. As published, the main theorems therefore rested on an unstated hypothesis. The checkpoint established this; it stands.

**The repair.** Li–Rapoport–Zhang, Theorem 14.6.2, prove the structure of Ñ^{[1]}_n "conjectured by Kudla and Rapoport, … see also [LZ, Conj. 10.4.1]". The checkpoint warned that their statement is not the old conjecture verbatim:
- it gives properness and an isomorphism off the centre, not a blow-up along a named ideal;
- the exceptional divisor is the reduction of π₁^{−1}(N^•), not the scheme-theoretic preimage.

So this review went through every use of the conjecture in Li–Zhang §§10.4–10.5:

| Where in Li–Zhang | What it needs | Where Li–Rapoport–Zhang give it |
|---|---|---|
| Lemma 10.4.2 | Ñ¹_n regular; pullbacks of Cartier divisors stay Cartier (injective maps on local rings) | 14.6.2(i); π₁ finite flat by (ii), π₂ an isomorphism on the dense non-special locus by (iii) |
| Theorem 10.4.3 | π₁ finite flat of degree q + 1, étale off N^{1,ss}_n, totally ramified along it (the conjecture's (i)) | 14.6.2(ii), verbatim |
| | π₂ an isomorphism off the exceptional locus | 14.6.2(iii) |
| | the exceptional locus a reduced Cartier divisor ⊔ P_Λ with P_Λ ≅ P^{n−1} | 14.6.2(iv) |
| | the conjecture's (iii), used only for supports | Corollary 16.1.5: Ñ^{exc} = π₁^{−1}(N^{[1],•}_n)_red |
| Theorem 10.5.1 | projection formulas for the finite flat π₁ and the proper π₂ | 14.6.2(ii)–(iii) |
| (10.5.3.3) | χ(P_{Λ_1} ∩^L ⋯ ∩^L P_{Λ_n}) = (−1)^{n−1} or 0 | (14.6.1), 14.6.2(v) |

**The checkpoint's two distinctions do not bite.**
- The blow-up ideal of the conjecture's (ii) is never used.
- The preimage in (iii) enters only through its support, which Corollary 16.1.5 identifies.

**The verdict on E3.** Confirmed, as a conditional input when the paper appeared that is now discharged.
- `affects` is changed from "a stated result" to "the proof": with the added citation the stated results hold.
- `known` stays "new". No erratum to Li–Liu records the dependence, Disegni–Liu §4.10 lists only E10 and E11, and Li–Rapoport–Zhang cite Li–Zhang but not Li–Liu.
- The quote now keeps u̲, the place of F below u, as the p.44 image has it. Losing it collapses two residue fields.

The route-1 and route-3 briefs now import the identity on that basis. They keep the conjecture as a named hypothesis only if the Kudla–Rapoport design does not plan the Li–Rapoport–Zhang theorem.

## 2. New source issues (E12–E20)

**E12 (error; affects the proof).** The proofs of Proposition 6.9(2) (p.31) and Lemma 8.3 (p.37) say that H^{2r}(X, Q_ℓ(r)) → H^{2r}(X ⊗ Ē_u, Q_ℓ(r)) is injective "by the Hochschild–Serre spectral sequence and the Weil conjecture", for X smooth projective of dimension 2r − 1 over a p-adic field.
- **Why it fails.** The Weil conjectures kill only the weight −1 term H¹(E_u, H^{2r−1}(r)). The term H²(E_u, H^{2r−2}(r)) survives. Let h be ample and β generate H²(E_u, Q_ℓ(1)) ≅ Q_ℓ. The class π*β ∪ h^{r−1} dies over Ē_u, yet its cup product with h^r has trace deg(h^{2r−1})·β ≠ 0, so the class is not zero.
- **The repair.** An element s ∈ (S^R)^0 ∖ 𝔪 kills both H⁰(E_u, H^{2r}) and H²(E_u, H^{2r−2}), so s² ∉ 𝔪 kills H^{2r}(X_{L,u}) at every good place. The finite-field injectivity in Lemma 8.3 is correct.

**E13 (gap; affects a stated result).** Lemma 8.3 says "By definition, every element in (S^R_{Q^ac})^{⟨ℓ⟩}_{L_R} annihilates H^{2r}(X′_L ⊗_K Q̄_p, Q_ℓ(r)) ⊗ Q^ac".
- **Why it does not follow.** Definition 6.2(2) concerns the arithmetic cohomology over the fields E_u. That sees only Frobenius invariants and a quotient of H²(E_u, H^{2r−2}), not the geometric cohomology. X′_L also lives over the larger field K.
- **The repair.** H^{2r}(𝒳_L, Q_ℓ(r)) injects Hecke-equivariantly into H^{2r}(X′_L ⊗ Q̄_p, Q_ℓ(r)). The route is proper base change, then Hochschild–Serre over the finite field with weights, then smooth proper base change. Elements of (S^R)^0 kill that group by the de Rham comparison, so every element of (S^R)^0 is ℓ-tempered.
- **What changes.** Definition 6.3 should take each s_i to be a product of an element of (S^R)^{⟨ℓ⟩} and an element of (S^R)^0. Items 48, 56 and 57 now say so, and the main theorems go through. Whether the lemma holds as printed is left open.

**E14 (error; affects the proof).** The proof of Corollary B.15 (p.64) calls H^{2r}(𝒳, Q_ℓ(r)) ⊗_Q L a finitely generated S_L-module.
- **Why it fails.** Q_ℓ ⊗_Q Q^ac has uncountable dimension, and the Hecke algebra is countable.
- **The repair.** The conclusion holds because S acts Q_ℓ-linearly. An element outside 𝔪 that kills h_i ⊗ 1 for a Q_ℓ-basis {h_i} kills everything.

**Misprints and small errors.**
- **E15.** Proposition 3.6(3) prints "is irreducible" where only "zero or irreducible" is proved.
- **E16.** (G3) prints {e_{r+1}, …, e_{2m}} for {e_{m+1}, …, e_{2m}}.
- **E17.** Proposition 3.13 prints "supp(…) ∈ (V^{2r}_v)_reg" for ⊆, and its proof prints Ψ ∈ S(V^{2r}_reg) for S(Herm°_{2r}(F)).
- **E18.** p.38 prints r for m in the construction of ^K𝒵_T.
- **E19** (error, affects nothing). p.22 calls X_L smooth at every level. That holds for neat levels, which is all the paper needs.
- **E20.** p.30 prints ρ[π^∞] for ρ[π̃^∞].

## 3. The recorded issues E1–E11

All eleven are confirmed at their locators in both versions. Corrected in place:
- **E1:** `known` no longer says that the published article follows the final version "by its date". The agreement is inferred, since the Annals text was not read.
- **E6:** four occurrences of H^{2d}(𝒳, Q_ℓ(d)) in Corollary B.15, not three.
- **E7:** the displayed "=" becomes "⩽". The union of shells lies in a set meeting each ϖ^Z-orbit once, and is not itself a fundamental domain.
- **E9:** the quote has the regular model 𝒳, not X. The locators are given for both versions.
- **E10:** `affects` becomes "a stated result". Proposition 6.10(1) is false as printed for Hecke operators with non-real coefficients, although the main theorems are unaffected. The quotes are now verbatim, and the reason carries the coefficient check. The same substitution is recorded for §11 (Lemma 11.1(1) and its normalisations), which the authors' remark does not list. Theorem 1.5 is unaffected: complex conjugation on the coefficients exchanges the localizations at 𝔪^R_π and 𝔪^R_{π^∨}.
- **E11:** the two formulae are quoted, the lemma's pages are given (stated p.23, proved p.24), and its use in Proposition 4.7(2) is added.

## 4. Items and statuses

Forty-four items were corrected and four split off. The file now has 85 items: 9 planned and 76 missing.

**Statuses.** Section 16 allows "planned" only when a layer plans the item as stated.
- **Items 72, 75, 76, 77 and 78 are now missing.**
  - Item 72 (étale Hochschild–Serre): R02.2 and D7 plan only the group-cohomology spectral sequence.
  - Items 75 and 76: S.6/S.7 and M.8 name neither Gillet–Soulé K-theory with supports nor Gillet's Chern classes with supports.
  - Items 77 and 78: IG.1, IG.4 and IG.5 plan Igusa varieties and the Caraiani–Scholze results only for their own noncompact datum.
- **Splits.**
  - From item 14, Yamana's good sections, the Siegel–Weil sections and Z^♮ (item 82), and Remark 3.5, "finite and invertible" (item 83).
  - From item 26, H¹(E_u, ρ^c_{Π_j}(r)) = 0 (item 84).
  - From item 29, the unitary Shimura datum (item 85), which is of abelian type, not PEL.
- **Extended planned lists:** item 12 gains MP.4 (the adelic ω_m), item 29 gains V2, and item 71 gains MC.2 (the de Rham comparison of cycle classes).
- **Library:** nothing at the pins. The partial starts are `VectorFourier.fourierIntegral`, `AlgebraicGeometry.Scheme.EllAdicCohomology` and `groupCohomology.H1InfRes`; Hochschild–Serre is a TODO in Mathlib.

**Statements, grouped by correction.**
- **Propagating the issues.**
  - E10: items 51, 53, 55, 58, 59 and 63.
  - E12 and E13: items 48, 52, 56, 57, 72 and 73.
  - E3 and the u̲ notation: items 4, 44, 45, 57 and 59.
- **Hypotheses restored.**
  - Item 4: R ⊆ V^fin_F.
  - Item 9: a nonempty R ⊆ V^fin_F.
  - Items 55 and 59: Assumption 3.1 with Hypothesis 6.6.
  - Item 48: Definition 6.3's data and Lemma 6.4(2).
  - Item 49: Q̄_ℓ ≃ C and the quantifier on π̃^∞.
  - Item 53: F ≠ Q.
- **Paraphrases and citations.**
  - Item 6: Remark 1.10 misreported.
  - Item 16: Remark 3.4(1), and Remark 1.6(1) L(s, π) = L(s, BC(π)).
  - Item 25: Arthur's multiplicity formula restated, with its exhaustion clause and the use in Lemma 7.3.
  - Item 50: [Liu] is Liu's J. Number Theory paper, not the sequel; the target group is added.
  - Item 61: the Kudla–Millson citations.
  - Item 64: Remark B.1 and linearity.
  - Item 81: Remark 7.4's consequence; the sequel's theorem moved to the note.
- **Wording and locators.**
  - Item 2: footnote 2.
  - Item 43: r → m.
  - Item 41: footnote 19 as a hypothesis.
  - Items 39, 51, 57, 63, 74, 75, 77 and 78: page ranges.

## 5. Routes

| # | Route | Verdict | Changes |
|---|---|---|---|
| 1 | Part II of GrossZagierAndArithmeticHeights: `UnitaryArithmeticInnerProductFormula` (53 items) | accept | Takes items 82–84. The brief states that Beilinson's local index is also planned by the proposed SelmerComplexesAndPadicHeights (PAPER-DISEGNI-LIU-24 route 2), upstream of this design, and should be defined once, there. The imports are corrected, and E3 is settled. |
| 2 | Part II of PELModuli: `UnitaryRapoportZinkSpacesAndRSZModels` | accept | Takes item 85. The brief states its results exactly and names M1–M4. |
| 3 | Part II of GrossZagierAndArithmeticHeights: `UnitaryKudlaRapoportCycles` | accept | Both Li–Zhang identities stated in the brief, with u̲; the E3 paragraph updated. |
| 4 | Source of MetaplecticAutomorphicForms MP.3 | accept | Records the Howe-duality inputs. |
| 5 | Source of IgusaVarietiesAndTorsionConcentration | accept | Takes items 77–78 and names IG.0, IG.1 and IG.4. Lemma 7.3 is rational, so record it at IG.5 with IG.7 as consumer. |
| 6 | Source of SchemeAndStackFoundations SF.2 | accept | Takes item 72. The purity ownership is credited to the PAPER-CESNAVICIUS-19 route. |
| 7 | Source of MotivesAndAlgebraicCycles MC.7 | accept | Links PS.6; proved cases are registered only under Hypotheses 4.5 and 6.6. |
| 8 | Source of SchemeKTheoryOperations S.6/S.7 (new) | accept | Item 75 |
| 9 | Source of MotivicEtaleKTheory M.8 (new) | accept | Item 76 |

## 6. For the maintainer

- **Other extractions to reconcile with E3.** PAPER-LI-ZHANG-22-B/98 says no proof of Li–Zhang Conjecture 10.4.1 was found, and PAPER-LI-LIU-22/E4 records the same conditional input for the sequel. Both should now cite Li–Rapoport–Zhang Theorem 14.6.2 and Corollary 16.1.5. These files are outside this job.
- **The sequel may share E12, E13 and E10.** It keeps products of two elements of (S^R)^{⟨ℓ⟩} in its admissible sextuples (PAPER-LI-LIU-22 item 65), so E12–E13 probably apply to its analogue of Lemma 8.3. The §11 part of E10 may apply to its analogue of Lemma 11.1.
- **Unowned inputs.** Ramakrishnan's strong multiplicity one ([Ram, Thm. A], pp.31, 35, 42) and Matsushima's formula (p.31) are cited inputs with no item and no atlas owner.
- **Route 6 needs a refreshed brief.** BP-SchemeAndStackFoundations is claimed externally (#642), so route 6's note reaches that worker only if its issue brief is refreshed.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-LIU-21.result.json`: ok (85 items, 9 routes, 20 source issues).
- `check_errata.versions_checked` on the result file: no errors (sourceVersions present).
- `python3 research/blueprint/intake.py check-files` on the four deliverables: ok. `grep` finds no local paths.
- **Lean:** none written or compiled; none is a deliverable of a paper review.
