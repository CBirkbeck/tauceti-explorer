# REV-PAPER-KHARE-WINTENBERGER-09-II: review of the extraction of Khare–Wintenberger, *Serre's modularity conjecture (II)*

**Verdict: accept.** All eleven source routes are accepted. Of the 32 recorded mistakes, 31 are confirmed and one, E13, is rejected. No item, status or route changes.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-48533a` (PR #4560, issue #4507). It has 340 items (7 library, 304 planned, 29 missing), 11 routes and 32 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Invent. Math. **178** (2009), 505–586, doi:10.1007/s00222-009-0206-6. I used the authors' copy [proofs.pdf](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) (98 pages, dated 30 May 2009). Its SHA-256 `53f45f8b…6ed4` matches the recorded hash. The UCLA TLS chain is incomplete, so it was fetched without certificate verification; the matching hash covers that. The Springer version of record was not compared.

## 1. Items: complete and accurate

- **Coverage.** A script read the statement headers from the text layer: 59 numbered theorems, propositions, lemmas and corollaries, and Definitions 2.4, 3.4, 4.2 and 7.9. Every one appears in an item locator.
- **Locators.** Each locator lies within two pages of its statement. The larger gaps are proof pages and the continuing parts of long statements, such as Theorem 6.1(iii) on p. 54.
- **Statements.** I compared the items for these statements with the text:
  - Propositions 4.1 (a power series ring in 4|S| − 1 variables), 4.5 and 5.11;
  - Theorems 8.2, 9.7 and 10.1;
  - Definitions 3.4 and 7.9;
  - Lemma 4.6.

  They match. Where the paper is wrong, the items state the corrected form and point to the source issue: /310 marks the comparison maps of E29 "as printed".
- **Not read.** I did not read every proof in the 98 pages. I read the passages at each source issue and the statements of all numbered results.

## 2. Statuses: all hold

- **Library items.** The twelve declarations cited by the seven library items are all in the pinned index. They are:
  - Mathlib `cyclotomicCharacter`, `modularCyclotomicCharacter` and the coyoneda/`CorepresentableBy` pair;
  - the Weierstrass division and factorization theorems;
  - `groupCohomology.H1InfRes(_exact)`;
  - `Subgroup.relIndex_dvd_index_of_normal`;
  - `HenselianLocalRing`;
  - Tau Ceti's character-determines-representation theorems.

  I opened three at Mathlib 082e2d3 and they say what the items claim: `H1InfRes_exact` is the exact complex H¹(G/S, A^S) → H¹(G, A) → H¹(S, A); `relIndex_dvd_index_of_normal` gives [K : H ∩ K] | [G : H] for normal H; `HenselianLocalRing` is the simple-root lifting property.
- **Planned and missing items.** The planned stages were checked by the checker. The stage texts behind the routes contain the phrases their reasons quote:
  - R20.6: "Supply the optimisation inputs used inside KW";
  - R01.4: "Isolate characteristic two";
  - R22.1: "the required local type and determinant";
  - R22.4: "the exact level-change theorems";
  - IG.4: embedding problems and solvable realizations.

## 3. Routes: all eleven accepted

Every route is a source route into an existing layer. Each takes the general inputs its layer needs but does not yet state:
1. R03.1–R03.4: commutative algebra of CNL_𝒪-algebras.
2. R08.4/R08.6: Lemma 3.8.
3. R06.4: ordinarity for unramified F_v.
4. R02.5: Kummer theory over F^nr.
5. R01.4: SL₂(𝔽_{2^r}) facts.
6. R04.5: Lemma 4.3(4).
7. R23.3/R23.5/R24.1: Khare's Lemmas 2.2 and 4.2.
8. IG.4: Grunwald–Wang.
9. R18.3: Taylor's neatness lemma.
10. R22.1/R22.4: the characters ψ, Lemma 7.10 and Kisin's level raising.
11. R20.6: Theorems 8.2, 8.4 and Lemma 8.3 over totally real fields.

The reasons are in the JSON.

## 4. Mistakes in the paper: 31 of 32 confirmed, E13 rejected

- **Substantive issues, all confirmed.**
  - **E29.** The comparison maps β, α of Theorem 10.1 exist only mod p. A semistable local condition at ℓ ≠ p stays ramified over every finite extension.
  - **E11.** In §3.3.3 for p = 2, the tame relation forces the eigenvalue ε^q on ρ(F)(e₁ + λe₂).
    - The printed ε⁻¹ is correct only if ε^{q+1} = 1.
    - That fails for every level-2 character of 2-power order when q ≡ 1 mod 4, for example q = 5 with ε of order 8.
    - KW I's parity condition confines the application to q ≡ 3 mod 4.
  - **E19.** When ρ̄ is unramified at v and N(v) ≡ −1 mod p, γ and γη give the same residual eigenvalues.
  - **E14.** For p = 2, a trace-one h_v is not trace-zero plus scalar, so x_v ∪ h_v is undefined. The L_v^⊥ repair is correct.
  - **E17.** Theorem 6.1(iii) b) is stated for ℓ_i = 2 but proved only for ℓ_i ≠ 2, p.
  - **E10.** Proposition 2.2 needs domains.
  - **E8.** An unramified ρ̄_v is finite flat with k = p.
  - **E20.** At v | p the proof needs Saito and Kisin, not [10], [61].
  - **E23.** Lemma 7.1 is stated for compact U.
  - **E24.** χ must be split at S, not only unramified.
- **Checks on page images.** E12 (p. 30) and E18 (p. 68) were confirmed on page images: the blackboard 𝔽 in (ℙ₁)_𝔽, and the exponent ω_p^{k−2} with k = 2.
- **E31 and E32.** E31 was checked with the arXiv API: math/0612077 is "Hilbert modular forms and p-adic Hodge theory". For E32, Crossref has no page range and Project Euclid served a challenge page. KW I's own reference [24] gives 557–589.
- **E13 rejected.** The extraction reports that the bar on R̄^{□,ψ}_v is missing in the second bullet of §4.1.3 (p. 39), from the PDF content stream.
  - The page image, zoomed to 300 dpi, shows the bar. It is typeset as an overline, a drawn rule wider than the \bar accents of the neighbouring bullets.
  - A rule is not a glyph, which is why the text layer and a glyph search miss it. The printed text is correct.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The review's changes are:
- the 32 `review` verdicts;
- the report's source-issue count;
- a new section "Corrections by the independent review".
