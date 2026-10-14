# PKG-AnabelianGeometryAndNonabelianChabauty~2

Revision round 2 of the package, for issue #9856. Author: Claude, session `claude-9CwWri`, 2026-10-14. This revision answers the review in `research/blueprint/reviews/REV-PKG-AnabelianGeometryAndNonabelianChabauty.md` (verdict needs_changes). It kept that review's in-place corrections and changed only the README, the closing comment of Suggested.lean and this note. `review.json` is left in place for the next reviewer.

## What changed

### 1. The prerequisites with no owner below tier 16 (ledger G1–G18) are now targets here

Every item has exact hypotheses, a proof route, Checks (at least three for every definition or construction), and a source checked at the page. The front-matter contract paragraphs and the proof sketches that used these items now link to the new targets.

| Ledger | New target (anchor) | Layer | Sources checked at the page |
| --- | --- | --- | --- |
| G1 | `mixed-extensions`, `nekovar-local-heights`, `nekovar-global-height` (new opening subsection 6.1) | 6 | Balakrishnan–Dogra I §4, pp. 13–17 (Defs 4.1–4.6, Lemma 4.7, Lemma 4.8, Remark 4.9, §4.3.3); BDMTV §§3.1–3.3, pp. 901, 903, 904; Balakrishnan–Dogra II §§3.1, 3.4, 3.5, author pp. 10–19 |
| G2, G18 | `relative-hodge-tate-small-base`, `integral-hodge-tate-differentials` | 3 | Mochizuki 1999 §2, pp. 19–21 (Lemmas 2.1–2.3, Prop. 2.4); §9, consequences (1)–(3) and the Remark, p. 51; Faltings 1988 §I Thms 4.2, 4.4 (pp. 268–271), §II Thms 2.4, 3.1 (pp. 283, 288) |
| G3 | `olsson-unipotent-comparison` | 2 | Olsson (author manuscript) §1.1, pp. 1–2; Assumption 1.6, p. 4; Thms 1.7–1.11, pp. 4–5; remark on ramified bases, p. 7; (7.17.2)–(7.17.3), p. 69; §§8.27–8.32, p. 83; Assumption 9.2, p. 85; Thms 9.28, 9.46, pp. 96, 104; Thm D.3, p. 132 |
| G4 | `pi1-etale-comparison` | 1 | Achinger arXiv:1407.0337v1 §1.3, §§2.3–2.4, §3.2, Def. 3.3, proof of Prop. 3.4, pp. 2–8; Stacks Tags 0DV5, 03RV |
| G5 | `finite-etale-pushforward-descent` | 1 | Stacks Prop. 59.55.2 and Lemma 59.55.3 (Tag 03QN), Thm 59.51.3 (Tag 09YQ), Lemma 32.10.1 (Tag 01ZM), Section 32.8 |
| G6 | `prime-field-kunneth` | 1 | Stacks Lemma 59.97.9 (Tag 0F13): finite type over a separably closed field, n invertible, no properness. Planned here rather than re-pointed to TauCetiRoadmap pull request #196, which is not merged |
| G7 | `pi1-products` | 1 | SGA 1 Exp. XIII Prop. 4.6, p. 310; Exp. X Cor. 1.7, pp. 203–204; Stacks Lemma 58.14.3 (Tag 0BTX) |
| G8 | `tangential-fibre-functors` | 1 | Chen, Annals 199 (2024) §4.2, Defs 4.2.1–4.2.2, Prop. 4.2.3, Remarks 4.2.4–4.2.5, pp. 362–365; §4.3, p. 366 |
| G9 | `admissible-log-coverings` | 3 | Mochizuki 1995 (Hurwitz scheme) §§3.5–3.13, pp. 19–25 |
| G10 | `hyperbolic-hom-schemes` | 3 | Mochizuki 1999, paragraph after Lemma 15.2, p. 76; Mochizuki 1996 Lemma 8.3, pp. 610–611. Stated for proper hyperbolic curves, which is what the consumers use |
| G11 | `split-unipotent-quotients` | 4 | Milne, Algebraic Groups (notes v2.00) 3.28, 9.28, 15.28, 15.31, 15.35, 15.36, 15.55–15.56, 19.25, §22.j (pp. 61–405). A free source replaces Demazure–Gabriel |
| G12 | `correspondence-cycle-classes` | 6 | BDMTV §2.3, Lemma 2.4 and proof, p. 900; Remark 2.5, p. 901; Balakrishnan–Dogra I §6.2, p. 25 |
| G13 | `rational-rosati-descent` | 6 | Milne, Abelian Varieties (notes v2.00) §8 p. 37, §10 p. 50, Prop. 14.2 p. 61; BDMTV proof of Lemma 2.4, p. 900 |
| G14 | `open-curve-product-cohomology` (placed before §7.3, which already uses it) | 7 | Stacks Lemmas 59.69.3 (Tag 03RR) and 59.97.9 (Tag 0F13) |
| G15 | `proper-curve-coleman-charts` | 5 | Besser arXiv:math/0011269v1 §1, p. 2; Prop. 4.21, p. 16; §5, pp. 16–19; BDMTV §4.1 p. 909, §5.5 p. 925, §§6.4–6.6 pp. 930–934 |
| G16 | (re-pointed by the review) | — | — |
| G17 | `bloch-kato-subgroups` | 4 | Kim 2005 arXiv v1 §3, p. 15; Kim 2009 p. 118; Berger arXiv:math/0209283v1 Prop. II.5, p. 13 |

One further target: `curve-kummer-cohomology` (Layer 1). SchemeAndStackFoundations has the Kummer sequences but not the curve computations H¹(C,μₙ)=Pic⁰(C)[n] and H²(C,μₙ)=ℤ/n, pullback by the degree, or the affine vanishing, which Layer 1 used as if SF.2 supplied them (Stacks Lemmas 59.69.1–59.69.3, Tags 03RQ, 0AMB, 03RR).

G2 needed the maintainer's decision. There was no answer, and HodgeTateAndCanonicalSubgroups is tier 16 but not bundled with this roadmap, so it may not be cited. Mochizuki's inputs are therefore planned here, in exactly the form his §2 and §9 use them. The rational statements are over a small logarithmic base. The integral statements hold in good reduction, with denominators bounded by p^(n₀), where n₀ depends only on K and g. If the maintainer later bundles the two roadmaps, these two targets can be replaced by citations of HodgeTateAndCanonicalSubgroups' Faltings-complex targets.

### 2. Exact supplier contracts rewritten

Each paragraph now states only what its supplier states. Everything a supplier lacked is named as a target of this roadmap with its link. The phrases "must add", "extension contract", "supplier interface", "supplier theorem" and "shared height theory" are gone from the whole README, along with about thirty sentences in proof sketches that leaned on them. The reference "CohomologyComparisons CP.2 and CP.3" is now package Layers 3 and 2. The Scope paragraph no longer routes heights to a Selmer Part II outside the order.

### 3. Layer 0 folded into its definitions' API lists

In the first pass, 219 lemma-level targets whose Lean name was already an interface entry of a definition became that entry. In a second pass, 21 more lemma-level targets became new entries of the preceding definition in the same subsection. Each entry keeps:
- its anchor (`- <a id=…></a>` at the start of the entry), so every existing link still resolves;
- its title, statement and proof sketch;
- its hypotheses (by standing label or in full) when they differ from the parent's;
- its source when it differs from the parent's;
- its extra prerequisites.

Checks bullets that only restated the statement were dropped, about 190 in all, including the 21 "Construct …" bullets. The other bullets moved to the parent's Checks. The result is Layer 0 with 104 headed targets instead of 344, plus 240 anchored interface entries, and 1.14 MB for the whole README instead of 1.20 MB. The theorem-level results (exact sequences, the central extension, finite-quotient colimits, inflation–restriction exactness) remain headed targets. "How to read the build" explains the entry format.

### 4. Two honest limits recorded in the targets

- `ramified-endpoint-comparison`: Olsson writes his proofs over W(k). He only remarks, on p. 7, that a possibly ramified extension of W(k) suffices. The target now says so, and it remains a target to carry out. Kim 2009 (p. 119) applies the comparison over ramified Fᵥ.
- The definitions of H¹ₑ ⊆ H¹_f ⊆ H¹_g are Bloch–Kato's (Grothendieck Festschrift I, 1990, §3). That volume is not freely readable here, so the locators are the freely readable Kim 2005, Kim 2009 and Berger. Similarly, Nekovář's 1993 heights paper is cited only through Balakrishnan–Dogra and BDMTV, which state everything used.

## Checks run

- Every one of the 535 accepted target ids has an anchor. All 643 API names and all 465 test names occur in the README. All 2,181 internal links resolve (scripted).
- Every original target statement still occurs verbatim, except five that were deliberately rewritten to drop contract wording: `ramified-endpoint-comparison`, `nc-3-filtered-affine-torsor-comparison`, `nc-4-crystalline-period`, `finite-away-kummer-image` and `nc-5-pair-of-heights`. No proof sketch was lost (scripted).
- Every definition and construction, old and new, has at least three Checks (scripted). No new forward link was introduced into any "Use" line: there were three before and two now (scripted).
- Locators of the new targets: I read them at the page. A Sonnet cross-check of 35 locators then found four slips, all corrected: Olsson §1.1 starts on p. 1; Besser §5 ends on p. 19; BDMTV Lemma 3.2 is on p. 903; and Balakrishnan–Dogra II §2.3 does not discuss Weil restriction, so that citation was dropped. The Faltings 1988 page numbers come from an OCR text layer.
- `lean-check research/blueprint/packages/AnabelianGeometryAndNonabelianChabauty/Suggested.lean`: exit 0, 55 warnings, all `declaration uses sorry`; elaborated in the shared pinned build (Mathlib 082e2d37e8, Tau Ceti f790474). Only the closing comment changed (524 lines). `scripts/check_sorry_data.py`: exit 0.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.

## For the next reviewer and the maintainer

- The new targets are mathematics planned here for the first time. An adversarial pass on them was done (degenerate cases, signs, the characteristic-p failures of the unipotent statements, stability of the admissible-cover examples), but a reviewer should read them as fresh plan content.
- Notions planned here that other roadmaps may wish to import rather than re-plan:
  - mixed extensions and Nekovář heights (the Selmer and heights direction);
  - homogeneous quotients of unipotent groups (ReductiveGroups direction);
  - the comparison εⁿ, Künneth for prime-field coefficients and π₁ of products (InverseGaloisAndArithmeticFundamentalGroups / SchemeAndStackFoundations direction);
  - tangential fibre functors and admissible coverings (InverseGaloisAndArithmeticFundamentalGroups IG.1, IG.5);
  - Coleman charts on proper curves (ColemanIntegration);
  - the Bloch–Kato subgroups (SelmerIwasawaCohomology);
  - correspondences on H¹⊗H¹ (EtaleDualityAndPerverseSheaves, MotivesAndAlgebraicCycles).
- Still for the maintainer, from the review: queue an errata entry for the gauge convention in Kim's survey (CEJM 8 (2010), p. 642); and decide whether EllipticCurves' nonabelian H¹ should point to Layer 0 here or to PELModuli §M0.9.
- References to TauCetiRoadmap pull request #196 (ConstructibleEtale Layer 3, ComplexComparison Layer 8) remain where the review placed them; they should be updated if that pull request changes before this package goes upstream.
