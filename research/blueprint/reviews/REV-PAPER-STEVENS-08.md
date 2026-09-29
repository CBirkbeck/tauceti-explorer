# REV-PAPER-STEVENS-08: review of the extraction of Stevens, *The supercuspidal representations of p-adic classical groups*

**Verdict: accept, after corrections made in place.** All three routes are accepted; one of them was added by the review.

- **Routes.** Six general facts about finite reductive groups move from route 1 to a new route 3, which joins ModularRepresentationsOfFiniteReductiveGroups.
- **Items.** Three duplicate pairs are merged, 25 locators and nine statements are corrected, and eleven placeholder issue ids are replaced by real ones.
- **Mistakes.** All 42 recorded mistakes are confirmed. Six entries are corrected, and E37's `known` field is repaired. Twelve new mistakes are added.
- **Citations of the published correction.** The `known` fields now cite the published Appendix A of Miyauchi–Stevens (2014).

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-e94dc5` (PR #4616, issue #4587): 306 items (6 library, 9 planned, 291 missing), two `part-ii` routes and 42 `sourceIssues`. `cc-fb70e5` appears nowhere in it.

**Method.**

- **Read myself.** I read the Introduction, §1 and §7.2.2 in full. I checked the substantive findings myself: E1–E4, E27, E36, E37 and E40.
- **Section checks.** I ran three read-only checks of the LaTeX source, one per section group: §§2–3, §§4–5 and §§6–7. They verified the other findings and the items, and each one's report cites the TeX lines.
- **Rechecked.** I rechecked every new mistake and every entry change they proposed at its TeX lines before accepting it.

**Sources.**

- **arXiv.** math/0607622 v2 (the accepted version, "To appear in Inventiones mathematicae, 2008") and v1. Both match the recorded SHA-256 hashes (PDF `b5b40926…7109`, v2 source `071f2bb6…a5d`, v1 source `a599f565…9f53`).
- **The Inventiones version** (172 (2008) 289–352) is not freely available. Crossref lists only a text-and-data-mining licence, and the UEA repository record (eprint 17017) has no full text. Findings therefore stay scoped to arXiv v2, as the extraction scoped them, and `sourceVersions` now says so.
- **Miyauchi–Stevens**, *Semisimple types for p-adic classical groups*, Math. Ann. 358 (2014) 257–288. I read the published version from the UEA repository (eprint 43291) and arXiv:1212.0525v1. The published version has an Appendix A, "Correction to the proof of [29, Theorem 7.14]", where [29] is this paper.

## 1. Items

The items cover the paper. §1 (Morris's Proposition 4.13 variant, Theorem 1.2) and the Introduction's results agree with the text.

**Duplicates.** Three pairs state the same thing, and each pair is merged into the lower-numbered item. References to the removed ids are renumbered.

- **301 into 5:** [S4, Theorem 5.1]. Both say every supercuspidal contains a skew semisimple character.
- **200 into 9:** the Hecke algebra of a representation of a compact open subgroup. Item 9 absorbs 200's function model.
- **304 into 253:** compact induction and Frobenius reciprocity. Item 253 absorbs the deduction π ≅ c-Ind_J^G λ used in §7.3.

**Locators.** 25 locators are corrected: TeX ranges that missed their passage, page numbers, and usage pointers.

**Statements** corrected:

- **27:** the gloss of E5.
- **133:** the lattice sequence 𝔐_Λ of (4.11) now carries an explicit re-indexing to a common 𝔬_F-period. The plain direct sum is not an 𝔬_F-lattice sequence when the e(E_i/F) differ (E21).
- **153:** [Λ, n, −k₀, β] is never semisimple; the stratum is [Λ, n, 0, β].
- **170:** a garbled clause.
- **173:** J̃_P̃ is used there for a decomposition that is only subordinate (new finding E50).
- **185:** the intertwining spaces of both ρ̃ and ρ must be at most one-dimensional.
- **201–211:** they use K ∩ P⁺ and ∩ M⁺, as E26 and E31 require.

**Placeholder ids.** Eleven items cited ids E/I1–E/I8 that no finding carries. They now cite E36–E42. E/I8 matched nothing and is dropped; the remark it tagged is not a mistake over ℂ.

## 2. Statuses

The six library items hold. I opened each cited declaration at Tau Ceti f790474 (Mathlib at 082e2d3):

- `TauCeti.simple_indFDRep_iff` (Irreducible.lean:249) and `TauCeti.MackeyDisjoint` (:141);
- `FDRep.clifford_restrict_iso` (Clifford/Equivalence.lean:281);
- `Rep.mackeyDecomposition` (Mackey/Decomposition.lean:390);
- `TauCeti.Rep.indFunctorCompIso` (Transitivity.lean:213);
- `TauCeti.finrank_hom_indFDRep` (FrobeniusReciprocity.lean:109).

The two planned items that also carry library pointers name real layers, and those declarations exist too: `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff` (SchurMultiplier.lean:295) and `TauCeti.TitsSystem.exists_mem_doubleCoset` (Bruhat/Basic.lean:397). After the merge there are 8 planned and 289 missing.

## 3. Routes

**Route 1, SmoothRepresentationsPartII: accepted, now 281 items.**

- The classical-group type theory belongs in this Part II. The route joins the accepted Fintzen candidate with byte-identical id, parent, title and area.
- Its brief states the final theorems as Miyauchi–Stevens corrected them, and it names its imports correctly: SR.0–SR.3, RG2.1–RG2.4, the Fintzen branch, FiniteWeilRepresentationsPartII and ET.6.
- The brief now also imports route 3's six facts.

**Route 2, FiniteWeilRepresentationsPartII: accepted.** Its id, parent, title and area are those of the accepted PAPER-FINTZEN-21 route 3.

**Route 3, ModularRepresentationsOfFiniteReductiveGroups: added by the review, accepted.** It takes six items the extraction's own notes called "finite-group input" not supplied by the p-adic Part II:

- 94: [DM, p. 129] on [𝒰, 𝒰];
- 95: characters of 𝒰 intertwined by the group;
- 97: SL_2(𝔽_3);
- 130: characters trivial on unipotents;
- 278: Harish-Chandra irreducibility for GL_{a+b}(k);
- 295: self-dual cuspidals of GL_d(k).

Why this owner:

- PROTOCOL.md §15 plans general finite-reductive-group facts once, in their foundational owner. That is the Part II of Tau Ceti's Reductive algebraic groups proposed by LLHLM20, which REV-PAPER-LUST-STEVENS-20 also made the owner of Green's classification and Harish-Chandra theory.
- The route copies that roadmap's id, parent, title and area.
- Its brief cites `TauCeti.simple_GL2PrincipalSeries_iff` (GL2/PrincipalSeries/Irreducible.lean:269) and `TauCeti.simple_indFDRep_iff_doubleCoset` (Irreducible.lean:218), both read at the pin.

Every missing item is routed exactly once: 281 + 2 + 6 = 289.

## 4. Mistakes

**All 42 findings are confirmed.**

- **Checked myself: E1–E4, E27, E36, E37 and E40.**
  - E2, E4 and E36 are corrected in the published Miyauchi–Stevens appendix: Remark A.1 and §A.1, which also thank Van-Dinh Ngo.
  - E27 is corrected there in §5.1.
  - E1 and E3 follow from Remark A.1 and §2.2.
  - E40's v1 text read "Put i = i_m"; v2 introduced "i_m = l".
  - E37 (case (ii) of §7.2.2):
    - With 0 < q_{m−1} < q_m < e/2, the jump of W^{(m−1)} falls between 𝔐₀(0) = Λ(1 − q_m) and 𝔐₀(1) = Λ(q_m).
    - So q_{m−1}(𝔐₀) = 0, and Lemma 6.7(ii) puts s_{m−1}, hence s_m s_{m−1}, outside P⁺(𝔐₀).
    - Building 𝔐₀ from q_{m−1} repairs the argument.
    - Miyauchi–Stevens restate the elements in their case (ii)(b) without addressing this, so E37 is new.
- **The v1 comparisons also hold.** E28 is the same in v1, E30's clause is new in v2, E35's v1 printed s_j^ϖ, and E42's wording is repeated by Miyauchi–Stevens.

**Entries corrected:**

- **E5.** Its gloss is too weak. For a ramified quadratic E, the sequence Λ(k) = 𝔭_F^k consists of 𝔬_E-lattices but is not normalized by E^×. The locator is TeX 958–959.
- **E7.** The proof of Lemma 2.12 never writes 𝔞₀; only its use in §4 does.
- **E9.** The gap bites when some E_i/F has residue degree > 1, not always.
- **E24.** P̃¹ is the paper's own occasional notation for P̃₁ (TeX 531, 536, 609, 3725, 3992). Only the citation (Proposition 3.1 for 3.2) is a slip.
- **E31.** With K ⊆ G⁺ the lemma also needs K_P = H¹(K ∩ P⁺) and ∩ M⁺ in (iii). Otherwise, for K = J⁺(β, Λ) ⊄ G, the index doubles and part (i) fails.
- **E32.** The statements are printed on pp. 7 and 20. The finding absorbs a third label slip, "Lemma 7.12" for Corollary 7.12 (TeX 4558).
- **E37.** Its `known` field read "new (…)". `scripts/errata.py` files any value other than "new" as corrected in print, so it is now "new", with the Miyauchi–Stevens remark moved to the reason.

**New: twelve, E43–E54.** Each was checked at its TeX lines.

- **One gap, E50.** J̃_P̃ is defined only for properly subordinate decompositions, but the proof of Lemma 5.8 uses it for a subordinate one. The group H̃¹(J̃ ∩ P̃) does what the proof needs, so the proof stands.
- **Eleven misprints:**
  - E43: the form h is never named;
  - E44: "check thus";
  - E45: "self-dual" is missing twice in §3.2;
  - E46: J⁺_M(β, Λ) for J⁺(β, Λ^M);
  - E47: "self-dual" is missing in Case 3 of Lemma 4.3;
  - E48: "0.β";
  - E49: "the Lemma" in the proof of Proposition 5.5;
  - E51: "(ii)" for "(i)" in the proof of Lemma 6.1;
  - E52: κ_0 for κ^{(0)};
  - E53: κ_{E_i} for k_{E_i}, three times;
  - E54: "containing θ_M" is missing.


## 5. Prerequisites

- All eight works are in the paper's bibliography, and none is cited by the atlas.
- Every DOI resolves on Crossref.
- The title of Stevens (2001) now follows the journal ("… for p-adic classical groups"); the paper's bibliography inverts it.

## 6. Checks

- `python3 scripts/check_paper.py` passes on the corrected result.
- `scripts/errata.py` runs on it.
- `research/blueprint/intake.py` file checks: 0 problems.
- Every missing item is routed exactly once. No reference points to a merged item, and no placeholder id remains.
- Nothing was compiled; a paper review has no Lean file.

## Findings

| Finding | Kind | Locator (arXiv v2) | Status | Review |
|---|---|---|---|---|
| E1 | error | Introduction, arXiv v2 p. 2 (TeX 386-389); §1 item (ii) after Proposition 1.1, p. 7 (TeX 7 | known (Miyauchi–Stevens) | confirmed |
| E2 | error | Introduction, arXiv v2 pp. 3-4 (TeX 555-564); = Definition 6.17 / Proposition 6.18 / Corol | known (Miyauchi–Stevens) | confirmed |
| E3 | error | Abstract and Introduction, arXiv v2 p. 1; Theorem 7.14, p. 53 (TeX 4665-4669) | known (Miyauchi–Stevens) | confirmed |
| E4 | gap | Introduction, arXiv v2 p. 4 ('The idea then is to show that, if the compact subgroup P(Λ_{ | known (Miyauchi–Stevens) | confirmed |
| E5 | misprint | §2.1, Definition 2.2(ii), arXiv v2 p. 9 (TeX 958-959); same in v1 | new | entry corrected |
| E6 | misprint | §2.2, Lemma 2.10, arXiv v2 p. 12 (TeX 1189); same in v1 | new | confirmed |
| E7 | misprint | §2.2, Lemma 2.12, arXiv v2 p. 12 (TeX 1240); the lemma is new in v2 | new | entry corrected |
| E8 | misprint | §2.2, paragraph before Lemma 2.12, arXiv v2 p. 12 (TeX 1236); new in v2 | new | confirmed |
| E9 | gap | §2.2, proofs of Lemma 2.10 (arXiv v2 p. 12, TeX 1206-1210) and Lemma 2.12 (p. 12, TeX 1247 | new | entry corrected |
| E10 | misprint | §3.3, proof of Lemma 3.10, arXiv v2 p. 18 (same in v1) | new | confirmed |
| E11 | misprint | §3.3, proof of Lemma 3.9, arXiv v2 p. 17 (v1: 'gives as the required extension') | new | confirmed |
| E12 | misprint | §3.2, Lemma 3.6, arXiv v2 p. 15 (same in v1) | new | confirmed |
| E13 | misprint | §3.2, Remark after Proposition 3.7, arXiv v2 p. 16 (same in v1) | new | confirmed |
| E14 | gap | §3.3, proof of Lemma 3.10, arXiv v2 p. 18 (same in v1) | new | confirmed |
| E15 | error | §3.3, proof of Lemma 3.9, parenthesis after the citation of [DM, page 129], arXiv v2 p. 17 | new | confirmed |
| E16 | misprint | §4.1, proof of Theorem 4.1, arXiv v2 p. 20 | new | confirmed |
| E17 | misprint | §4.2, Lemma 4.4; proof of Lemma 4.3 (Case 3); Definition 4.5; arXiv v2 pp. 21–23 | new | confirmed |
| E18 | misprint | §4.2, proof of Lemma 4.4, first displayed isomorphism, arXiv v2 p. 21 | new | confirmed |
| E19 | misprint | §4.2, proof of Lemma 4.3, Case 2, arXiv v2 p. 22 | new | confirmed |
| E20 | misprint | §4.2, Proposition 4.7, arXiv v2 p. 23 | new | confirmed |
| E21 | misprint | §4.2, display (4.11) and following sentence, arXiv v2 pp. 24–25 | new | confirmed |
| E22 | misprint | §5.1, end of the proof of Proposition 5.2(ii), arXiv v2 p. 27 | new | confirmed |
| E23 | misprint | §5.2, proof of Proposition 5.5, step (ii), arXiv v2 p. 29 | new | confirmed |
| E24 | misprint | §5.2, proof of Lemma 5.8, arXiv v2 pp. 30–31 | new | entry corrected |
| E25 | misprint | §5.3, Glauberman paragraph, arXiv v2 p. 32 | new | confirmed |
| E26 | misprint | §5.3, definition of J⁺_P (arXiv v2 p. 32) and paragraph after Proposition 5.13 (p. 33) | new | confirmed |
| E27 | error | §6.1, Definition 6.5 and the characterization after it (p. 37); §6.3, final paragraph on N | known (Miyauchi–Stevens) | confirmed |
| E28 | misprint | §6.2, definition of 𝓑^{(−j)}, arXiv:math/0607622v2 p. 38 (TeX line 3332) | new | confirmed |
| E29 | misprint | §6.4, proof of Proposition 6.18, displayed formula, arXiv:math/0607622v2 p. 43 | new | confirmed |
| E30 | misprint | §6.2, consequence (iii) in the paragraph after Lemma 6.7, arXiv:math/0607622v2 p. 39 | new | confirmed |
| E31 | misprint | §6.1, Lemma 6.1 (first line) and Corollary 6.2, arXiv:math/0607622v2 pp. 34–35 | new | entry corrected |
| E32 | misprint | §6 introduction ('the result of Morris, Lemma 1.1', p. 34) and proof of Proposition 6.3 (' | new | entry corrected |
| E33 | gap | §6.3, Remark 6.12, last two sentences, arXiv:math/0607622v2 p. 41 | new | confirmed |
| E34 | gap | §6.3, proof of Proposition 6.14, first paragraph ('The remaining part of w can be written  | new | confirmed |
| E35 | misprint | §6.3, paragraph after Corollary 6.13, arXiv:math/0607622v2 p. 41 | new | confirmed |
| E36 | gap | §7.2.2, case (i) after Corollary 7.12, arXiv v2 p. 52 | known (Miyauchi–Stevens) | confirmed |
| E37 | gap | §7.2.2, case (ii), arXiv v2 p. 52 | new | entry corrected |
| E38 | misprint | §7.2, definition of Λ′ after (7.8), arXiv v2 p. 48 | new | confirmed |
| E39 | misprint | §7.2, properties of Λ′ after its definition, arXiv v2 p. 48 | new | confirmed |
| E40 | misprint | §7.2.2, arXiv v2 pp. 50–52 | known (Miyauchi–Stevens) | confirmed |
| E41 | misprint | §7.2, first paragraph, arXiv v2 p. 46 | new | confirmed |
| E42 | misprint | §7.2.2, proof of Proposition 7.13, arXiv v2 p. 53 | new | confirmed |
| E43 | misprint | §2.1, first paragraph, p. 8 (TeX 842–845) (arXiv v2) | new | added by the review |
| E44 | misprint | §2.2, paragraph after Lemma 2.10, p. 12 (TeX 1229) (arXiv v2) | new | added by the review |
| E45 | misprint | §3.2, remark after Proposition 3.7, p. 16 (TeX 1505, 1512) (arXiv v2) | new | added by the review |
| E46 | misprint | §4.1, first paragraph, p. 20 (TeX 1849–1851) (arXiv v2) | new | added by the review |
| E47 | misprint | §4.2, proof of Lemma 4.3, Case 3, p. 22 (TeX 2069) (arXiv v2) | new | added by the review |
| E48 | misprint | §5.1, Definition 5.1(i), p. 25 (TeX 2329) (arXiv v2) | new | added by the review |
| E49 | misprint | §5.2, proof of Proposition 5.5, p. 29 (TeX 2584) (arXiv v2) | new | added by the review |
| E50 | gap | §5.2, definition of J̃_P̃ (TeX 2521–2524, p. 28) and its use in the proof of Lemma 5.8 (Te | new | added by the review |
| E51 | misprint | §6.1, proof of Lemma 6.1, p. 35 (TeX 3082–3084) (arXiv v2) | new | added by the review |
| E52 | misprint | §6.2, proof of Corollary 6.10(i), p. 40 (TeX 3561) (arXiv v2) | new | added by the review |
| E53 | misprint | §6.3, Remark 6.12 and Corollary 6.13, p. 41 (TeX 3582–3584, 3601–3602) (arXiv v2) | new | added by the review |
| E54 | misprint | §6.4, before Definition 6.17, p. 43 (TeX 3805–3810) (arXiv v2) | new | added by the review |
