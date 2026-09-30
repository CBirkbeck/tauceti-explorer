# REV-PAPER-RODRIGUES-JACINTO-WILLIAMS-23: review of the extraction of Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions*

**Verdict: accept.** All seven source routes are accepted. Route 4's reason and route 6's reason were corrected. The extraction was corrected in place:
- 2 statuses changed;
- 1 item added;
- 17 item statements, 16 locators and several notes corrected.

All 103 recorded source issues are confirmed, and E60's correction is revised. Seven new mistakes, E104–E110, are added:
- 4 are gaps in proofs;
- 3 are misprints;
- none is an error in a stated result.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code `cc-e94dc5` (issue #4512).
- It had 539 items (71 library, 458 planned, 10 missing), 7 source routes and 103 `sourceIssues`, with status `complete`.
- `cc-f805bf` appears nowhere in its files.

Source:
- **Published version.** Essential Number Theory 4 (2025), no. 1, 101–216, DOI 10.2140/ent.2025.4.101.
  - Read at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, fetched 29 September 2026.
  - Its SHA-256 `78d0479b…44a6` matches the recorded hash. Printed page = PDF page + 99.
- **Preprint.** The authors' LaTeX of arXiv:2309.15692v2 (https://arxiv.org/e-print/2309.15692v2) was used for formulas. Its SHA-256 `f8acea24…6d83` also matches.
  - v2 (19 December 2024) is the latest arXiv version.
  - The two texts differ at E72, where the published version has a typesetting slip that v2 lacks.
- **Corrections in print.** None was found: the journal's article page, Crossref (29 September 2026) and the arXiv listing show no erratum.

## 1. Items

**What was read.**
- The whole paper, split into nine parallel section passes (§§1–2, §3.1–3.5, §3.5.5–§4, §4.3–§5, §§6–8, §§9–10, §§11–12, §13, Appendices A–B). Each pass read the proofs and checked every formula in an item against the 300-dpi page images.
- I read myself:
  - the passages behind every source issue;
  - §§4, 5.3, 6.2, 10.2–10.4 and 12.3–12.5, and §13.1 and §13.5 in the TeX and on the page images.
- I viewed the images of printed pp. 104, 107, 112, 123, 125, 130, 131, 137, 145, 154, 168, 170, 171, 172, 180, 186, 188, 194, 199 and 209.

**Checks redone.**
- The E3 counterexample: p = 3, k = 2, ℓ = 4 gives 23/60, of 3-adic valuation −1.
- The sign of Col(c(a)), from Proposition 10.4, Lemma 10.5 and Definitions 4.10 and 10.14.
- The parity argument against the printed Theorem 6.7(ii), and the pole argument for E54 and E89.
- The E74 example at p = 5.
- The E90 module Λ/(T⁴ − 3) at p = 3, which gives 4n − 1.
- The E92 counterexample ℚ(i), p = 5, by Chevalley's formula.
- The E96 congruence: 63 against 9.
- The E97 exponent.
- The section passes independently recomputed:
  - Lemmas 5.5, 5.9, 5.10 and 5.12 (with η of conductor 5, p = 3, and N = 15);
  - Theorem 6.1(ii) at p = 3 with the character mod 5;
  - Theorem 7.1's residue at p = 3 and 5;
  - Corollary 2.8, Lemmas 2.6–2.7, Remark 3.28(2), Lemma 3.29 and Corollary 3.30.

**Coverage.** Every numbered definition, lemma, proposition, theorem, corollary and display has an item. The only exceptions are motivational remarks (2.14, 3.46, 3.48, 13.2, 13.20, 13.24) and the survey sentences of B.2.1 and B.3, which the extraction deliberately left to `prerequisites`.

One implicit step on the way to Theorem 11.9 had no item. Definition 11.8 takes inverse limits of the 𝒞_{n,1}, which needs the norms to map 𝒟_{n+1} into 𝒟_n. It is now **item 540**, planned at ColemanPowerSeries:L4 ('Prove its membership, norm compatibility') and IntegralIwasawaTheory:L0.

**Statements corrected.**
- **Item 3 (Theorem 8.2).** It called A_0 = xζ_p/2 a pseudomeasure, against the extraction's own E54. It now reads "A_0 ∈ Q(ℤ_p^×), the twist by x of the pseudomeasure ζ_p/2".
- **Items 1, 2 and 241.** They now carry the conventions of E35 (ζ_η := ζ_p for D = 1), E44 (the Iwasawa logarithm) and E36 (the pole of ζ_{p,p−1}; no value at the trivial character for a pseudomeasure).
- **Item 222 (Lemma 5.12).** The Gauss-sum factorisation holds only for compatible roots of unity ε_{Dpⁿ}^D = ε_{pⁿ}, ε_{Dpⁿ}^{pⁿ} = ε_D.
- **Item 247.** Its parity argument repeated the k = 1 slip of E34 (θ = ω, k = 1). Corrected.
- **Item 262.** Over an integral domain; the cited Mathlib lemma needs `IsDomain`.
- **Items 286–288.** A broken template sentence.
- **Item 351.** Stated at the finite level that the library provides.
- **Item 355.** It said the "non-torsion cyclotomic units" form an Euler system in the sense of Definition 10.16. The smoothed family (ξ_m^a − 1)/(ξ_m − 1) fails the ℓ = p relation at n = 0: its norm carries 1 − Fr_p^{−1}. The item now names Rubin's c̃_m, as node EulerSystemsCyclotomicMainConjecture:L0/cyclotomic-euler-system does.
- **Item 456 (Proposition 13.15).** "(and trivially n = 0)" contradicted its own note and E83. Corrected.
- **Item 489.** Now cites the new E109.
- **Item 506.** Needs V/ω_nV finite.
- **Item 507 (Lemma A.11).** The added "p odd" is dropped. The lemma holds for p = 2: Q_{n₀+1} ≡ 2Q(Q+1) ≡ 0 mod 2.
- **Item 522.** It said the critical-slope function satisfies Theorem B.1's interpolation formula, "including θ-critical points". In the θ-critical case Bellaïche's function vanishes at all classical characters, as the atlas's own node ModularSymbolsPadicLFunctions:L3/theta-critical-comparison records. Rewritten.

**Locators corrected.**
- **Items 140–150.** Lemma 3.36 is on printed p. 130. The proof of 3.36(iii), Definition 3.37 and Lemma 3.38 are on p. 131. The extraction had pp. 131–132, but p. 132 begins with §3.7.
- **Item 242.** Remark 3.47 is on p. 135.
- **Item 373.** Now also cites the proof of Lemma 3.38.
- **Items 404 and 405.** Printed p. 182.
- **Item 534.** §13.5.3 is on p. 198.

## 2. Statuses

**Library citations.** The section passes opened every cited Mathlib and Tau Ceti declaration at the pinned trees (Mathlib 082e2d3, Tau Ceti f790474). All provide their items, with these caveats now in the notes:
- item 42 (partial holomorphy);
- item 62 (a composed corollary);
- item 478 (the contragredient action is planned at SelmerIwasawaCohomology:L2).

**Planned citations.** Every cited stage exists, and every quoted stage phrase is in the stage text. Every cited packet node exists, with one exception:
- item 446 cited EulerSystemsCyclotomicMainConjecture:L3/unconditional-statement-versus-the-vandiver-isomorphism, which is in no packet. The quoted text is in node L3/cyclotomic-main-conjecture, and the note now cites that.

**Two statuses changed.**
- **Item 147** (the augmentation ideal of a finite cyclic group ring is principal): now **library**. Mathlib's `Rep.FiniteCyclicGroup.leftRegular.range_applyAsHom_sub_eq_ker_linearCombination` (RepresentationTheory/Homological/FiniteCyclic.lean:113) says that the range of multiplication by [g] − 1 on k[G] is the kernel of the augmentation, for finite G generated by g.
- **Item 462** (Vandiver's conjecture): now **planned**. Packet node ArithmeticKTheory:N.7/vandiver-separation states the conjecture ('State the conjecture in both forms'). For regular p it holds because h⁺ divides h. The extraction's note said N.7 only forbids its use.

**Missing items I searched for** (declaration index, stage texts, packets):
- **Items 74 and 369.** Only partial library results exist, now cited in the notes:
  - item 74: `LinearMap.dualEmbedding_surjective`, which gives the surjectivity half of weak reflexivity; there is no non-archimedean Hahn–Banach;
  - item 369: Tau Ceti `ker_mapDomainRingHom_eq_span`.
- **Items 84, 148, 246, 285 and 370.** Nothing found.
- **Items 36 and 37.** No stage or packet mentions Mazur–Tate–Teitelbaum, p-adic BSD, trivial or exceptional zeros of the p-adic L-function of E, or Schneider.

**Borderline cases, left as they are.**
- **Item 238** (Remark 5.19's comparison with Washington's L_p). Only IntegralIwasawaTheory:I.3 plans a normalisation comparison, and the comparison is uniqueness by interpolation from Theorem 5.20. It stays planned, with the partial note.
- **Item 33.** It is planned only through the finite-level descent sequence of Tau Ceti EllipticCurves Layer 7, as its note says.

**Library audit.** It lists nothing in these roadmaps as built. No planned item is already in the libraries.

## 3. Routes

Every missing item (now 9: items 36, 37, 74, 84, 148, 246, 285, 369, 370) is routed exactly once. No Tau Ceti roadmap is re-planned. All routes are source routes into roadmaps that the maintainer's note says were built from these notes, so no Part II or new roadmap is warranted.

1. **PadicMeasuresIwasawaAlgebras** (L0, L0a, L1, L2, L3, L5). Accepted.
   - L0 plans the dual topologies and their completeness.
   - L1 plans functoriality and augmentation.
   - L3 plans the change of generator and positive-moment separation.
2. **DirichletPadicLFunctions** (L0, L2, L3, L4). Accepted. DT.3 must export Baker's theorem in its inhomogeneous form for item 246.
3. **ColemanPowerSeries** (L0–L4). Accepted. It now also carries item 540.
4. **IntegralIwasawaTheory** (L0–L4). Accepted as corrected: item 462 leaves the route as planned, so no item in it is missing.
5. **EulerSystemsCyclotomicMainConjecture** (L0, L3, L4). Accepted.
6. **ModularIwasawaMainConjectures** (L1, L3, L5). Accepted with the reason corrected.
   - The MTT p-adic BSD conjecture and Schneider's theorem are consequences of the main conjectures, which is L5's charge.
   - The extraction said no atlas layer builds the p-adic height pairing. The accepted Part II SelmerComplexesAndPadicHeights (review of PAPER-DISEGNI-LIU-24) plans Nekovář's height, whose ordinary elliptic-curve case is the Mazur–Tate/Schneider height. Tau Ceti EllipticCurves Layer 4 builds the Tate curve for q_E. The route and the report now say that L5 imports both and defines only the ℒ-invariant.
7. **LocallyAnalyticDistributions** (L3). Accepted.

## 4. Mistakes in the paper: 103 of 103 confirmed, 7 added

**Where I looked for corrections:**
- the msp.org article page;
- Crossref, by title and authors;
- the arXiv listing (v2 is the latest version).

None was found. At every recorded locator the published text reads as quoted. I checked each on the page image where a formula is involved, and against the published text layer and the TeX elsewhere.

**E1–E103: all confirmed.** The most consequential are:
- **E57/E76.** Col(c(a)) = −θ_aζ_p.
- **E49.** Theorem 6.7(ii) has the wrong parity; the left side should be L_p(θω^{1−k}, k). Remark 6.8 repeats the slip.
- **E2.** The sign in Corollary 2.8 at n = 0.
- **E45.** §6.2 is valid only for D > 1.
- **E54.** A_0 is not a pseudomeasure.
- **E77/E78.** The µ-part is over a uniformiser, and uniqueness of the invariants is needed.
- **E89.** The ideal is Tw_n(I(Γ⁺))·∂ⁿζ_p.

Three entries needed more than a verdict:
- **E60.** Its correction offered the smoothed family c_m(a) first. That family is non-torsion but fails the ℓ = p relation of Definition 10.16 at n = 0. The correction now leads with Rubin's c̃_m, and it states the multiplicative norm relations that the printed display writes as '(1 − ℓ^{−1})c_m'.
- **E75.** Point (2) ("a cannot be arbitrary") is overstated. Col(c(b)) = −([σ_b] − [1])ζ_p for every integer b > 1 prime to p, so the step can be repaired by density; the text simply does not justify it. The review reason records this.
- **E96.** For p = 2 the printed congruence fails even up to a unit, but the lemma still holds (item 507).

**New mistakes, all confirmed on the page images:**
- **E104 (gap, the proof; Lemma 5.10, p. 145).** (5-4) is obtained by summing Σ_n((1+T)ξε_D^c)^n, which diverges because its constant terms are roots of unity. The identity is true as an identity of rational functions, by Π_ξ(yξ − 1) = y^p − 1.
- **E105 (misprint; Lemma 10.11(iii), p. 168).** The congruences are taken modulo 𝔭_1ℤ_p⟦T⟧, where 𝒪_{K_1}⟦T⟧ is meant (η − 1 ∉ ℤ_p). This is the earlier lead ColemanPowerSeries/E4. The extraction had set it aside because the congruences themselves are right.
- **E106 (gap; §12.1, p. 180).** "the Γ-action on 𝒰_∞ fixes 1 ∈ µ_{p−1}, so it stabilises 𝒰_{∞,1}": every automorphism fixes 1. The reason is that Γ preserves 𝔭_n.
- **E107 (gap, the proof; Proposition 11.5, p. 176).** The "topological ideal" argument needs a closedness that multiplication by ζ_p does not give. I(Γ) = ([σ_a] − [1])Λ(Γ) repairs it.
- **E108 (gap; Corollary 13.16(iii), p. 194).** "ℰ⁺_{n,1} is by definition the p-adic closure of 𝒱⁺_{n,1}". The definitions take the closure first, so the two orders need a short argument.
- **E109 (misprint, a stated result; Appendix A, p. 199).** "r_2 is the number of complex embeddings". It is the number of complex places, as in Theorem 2.2; ℚ(i) has two independent ℤ_p-extensions, not three.
- **E110 (misprint; B.2.1, p. 209).** v_p(α) for v_p(α_p).

**Not recorded** (minor or expository):
- Remark 3.28(3) cites Remark 3.6 for what is in Definition 3.5.
- The citation '[20, Théorème 1.2.3.]', which I could not collate with Colmez's text.
- The §8 constant-term factor of 2.
- 'Li_s(1) = ζ(s)' without Re s > 1.
- §10.5 citing Proposition 10.4 for Theorem 10.15.
- The §13.5 opening's claim that Greenberg's conjecture for the trivial representation recovers Theorem 13.8. Remark 13.23 corrects it.

## 5. Corrections made

These are listed in full in the "Corrections by the independent review" section appended to `PAPER-RODRIGUES-JACINTO-WILLIAMS-23.md`. In summary, the review made these changes in `PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json`:
- the review verdicts on E1–E103, and the E60 correction;
- the new issues E104–E110;
- item 540;
- the status changes for items 147 and 462;
- the statement, locator and note corrections listed above;
- the route 3 item list, and the route 4 and route 6 reasons.

In the extraction report, the review corrected the route 4 and route 6 paragraphs in place.

**For the maintainer.** Beyond the atlas texts the extraction already lists, stage DirichletPadicLFunctions:L4 and node L4/positive-eisenstein-measure call A_0 a pseudomeasure (E54). Node SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology uses the torsion c_m (E60).

## 6. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-RODRIGUES-JACINTO-WILLIAMS-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: 0 problems.

## What I could not read

- Colmez's *Fonctions d'une variable p-adique*, cited as [20]. The copy at the author's page returned 404, so the citation '[20, Théorème 1.2.3.]' could not be collated.
- Coleman 1982 and Rubin's *Euler systems*, cited for E49 and E60. I relied on the statements as reproduced in Washington and in the atlas packets, and on my own parity and norm computations.
