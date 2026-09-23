# Review: PAPER-TREUMANN-VENKATESH-16 (Treumann–Venkatesh, Functoriality, Smith theory, and the Brauer homomorphism)

Job `REV-PAPER-TREUMANN-VENKATESH-16` (issue #1178), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4` (with its correction #1973). **Verdict: accept**, after the corrections below, which were made in place. All three routes are accepted.

## What was read

- **The extraction read only the preprint**, arXiv 1407.2346v1, from its TeX source.
- **The published version**, Ann. of Math. 183 (2016), 177–228 (52 pp.), is free from the Annals article page's citation_pdf_url (annals-v183-n1-p04-p.pdf, SHA-256 15513cab…). The review read it in full, with four checkers, and compared it with the preprint (the same source archive).
- **Errata:** Crossref records no update, the Annals page links no erratum, and no follow-up paper with the promised details was found.
- **Checks on page images:** every published mistake was checked on a page image, and every preprint-only one in the TeX.

## The two versions

- **§§1–8** are the same in outline, and the statements are numbered by subsection in both.
- **Moved or removed:**
  - The preprint's §§2.12–2.13 (Borel–de Siebenthal and endoscopic subgroups) are not in print.
  - Global pseudoroots and the σ-dual definition move to published §9.1–9.3.
  - The C-group and c-group (§7.8), Theorem 7.9, the §8.15 criterion and Lemma 8.16 are not in print.
  - The preprint's unnumbered Theorem of §8.1 becomes the published **Theorem 8.10**, proved in §8.15.
- **The preprint's §§9–12**, the existence of σ-dual homomorphisms and its case-by-case construction, are replaced by a published §9 of examples:
  - cyclic base change (9.4);
  - mod 2 Eisenstein series (9.5);
  - the exotic transfer from Sp_2n (9.6);
  - SL_3 → G_2 (9.7).
- **The existence theorem** is only announced in §1.3, p. 181: "we have verified … Details will appear elsewhere."
- **Changes in content:** the published version corrects the preprint's formula for X*(L^ab) in §2.7 and the (7.9.2) misprint, and keeps only torsion-free levels in §5.1.

## Changes made to the extraction

- **Locators:** all 107 now give both the preprint and the published location, or say that the item is not in print.
- **Statements:** 35 corrected. Among them:
  - item 7 claimed that T_can(F) is the unit group of the étale algebra for all semisimple G; this holds only for adjoint or simply connected G;
  - item 12 has the published X*(L^ab);
  - items 31–32 and 52 note the gaps below;
  - items 33–35 are re-pointed to §4.4;
  - item 82 notes that Theorem 9.1 is only announced in print and incompletely proved in the preprint.
- **Statuses:** unchanged. Notes are recorded where a planned citation is loose (items 37 and 43) and where item 16's library covers only the algebra.
- **Library citations:** all four library items were checked at the pinned commits. The new item's `modularCyclotomicCharacter` exists at Mathlib 082e2d3.
- **New items (14):**
  - **1 library:** the mod p cyclotomic character.
  - **13 missing:**
    - 8 to SigmaDualHomomorphismsInCharacteristicP: the four global transfers of §1.2 and their σ-dual verifications in §§9.5–9.7;
    - 4 to SmithTheoryAndModPFunctoriality: the Tate-cohomology form of Theorem 4.4, §5.3's definition, the Rohlfs–Speh invariant and linkage for H^p;
    - 1 to SmoothRepresentationsOfLocalGroups: the injectivity step of Satake (ii).
- **Briefs:** both Part II briefs have a corrections paragraph.

## Mistakes in the paper (`sourceIssues`, E1–E53)

- **E1–E4** are confirmed.
  - E1–E3 are in preprint passages that are not in print. E1 is in §12.3, not §12.2.
  - E4 is in the c-group, which print drops.
- **E5–E53** are new: 34 misprints, 6 errors that affect nothing, and the following. Each is present in both versions unless noted.
  - **E19 (error, a stated result):** the explicit formula (4.3.1) for nBr uses h^{∗p}. It must use the norm product h ∗ h^σ ∗ ⋯ ∗ h^{σ^{p−1}}.
    - Counterexample: GL_1 × GL_1 with σ the swap. There br(t_2) must be the unit t, but (4.3.1) gives 0.
    - §8.15 works from the definition, so nothing downstream is affected.
  - **E20 (gap):** step (3) of the proof of Theorem 4.4 assumes the column spectral sequence of the Smith double complex converges. For unbounded singular chains, vanishing of H_*(X/K) in high degrees does not give this; a mapping telescope of odd spheres is a counterexample. Run the argument on a bounded complex, as §1.4 suggests. The same step recurs in Theorem 6.5.
  - **E21 (gap):** (a) ⇒ (b) in Theorem 4.4 needs H^*(X/K) finite-dimensional. It is finite-dimensional for [G]_K, so Theorem 5.8 is unaffected.
  - **E27 (gap):** Proposition 5.6 applies Lang's theorem to a torsor under the special fibre of 𝔊^σ, which need not be connected. Exclude the finitely many bad places.
  - **E31 (gap):** §6.4's admissibility argument needs S to avoid the places above p.
  - **E32 (error, a stated result):** the q_v-normalisations of (7.2.1), §7.4(a)(i) and (7.4.3) are inverted relative to §2.9 and (7.5.2)–(7.5.3). A PGL_2 check shows it; replace q_v by q_v^{-1}. Theorem 8.10 holds with the corrected reading.
  - **E48 (gap, a stated result; preprint):** Theorem 12.1(i)–(iii) are given no proof, so the preprint's Theorem 9.1 is unproved in those rows. For the SO forms of (ii)–(iii), G^σ is disconnected.
  - **E50 (error, a stated result):** Remark 9.2 asserts canonical pseudoroots whenever G is simply connected. It also needs H semisimple: SL_3 ⊃ GL_2 at p = 3 has none.
  - **E52 (gap; print only):** a step in §9.7 whose argument is only in the preprint.
  - **Errors that affect nothing:**
    - §2.4's T_can claim (SO(3,1) counterexample);
    - §2.11's C_m(X/K) = k[…]^K (the invariants vanish; it should be the coinvariants);
    - §8.4;
    - Remark 9.2's PGL_2 example, which excludes only L-homomorphisms nontrivial on Ĥ;
    - the displayed Σ_H in the preprint's Proposition 9.5;
    - "1720 extensions" (read 16).
- **Effect:** Theorems 4.4, 5.8, 6.5 and 8.10 stand. Theorem 9.1 is announced in print and unproved in three families of cases.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-TREUMANN-VENKATESH-16.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once, and every stage id exists in the atlas.
