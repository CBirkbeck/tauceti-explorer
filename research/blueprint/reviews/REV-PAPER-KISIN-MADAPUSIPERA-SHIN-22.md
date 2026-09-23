# REV-PAPER-KISIN-MADAPUSIPERA-SHIN-22 — review of the extraction of Kisin–Madapusi Pera–Shin, "Honda–Tate theory for Shimura varieties"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1315).
- **Authors:** Codex, session `codex-c83e7a` (#1679 and #2151); Claude Code, session `cc-fb70e5` (#1830, the repairs of N29 and
  T23); and Claude Code, session `cc-442dc5` (#2154, which completed it). This reviewer took no part in any of them.

**What was read.**

- **The paper.** Duke Math. J. 171 (2022), 1559–1614, doi:10.1215/00127094-2021-0063. It was read, as the extraction read it,
  in the 41-page author PDF, whose SHA-256 matches the extraction's record; the Duke text is not openly available. It was read
  in full, as page images, in five ranges:
  - the introduction, the notational conventions and §§1.1.1–1.1.8 (pp. 1–9);
  - §1.1.9 to §1.2 (pp. 8–15);
  - §1.3 and §2.1 (pp. 15–24);
  - §2.2 (pp. 24–30);
  - §2.3, Appendix A and the references (pp. 30–41).

  Every item was compared with the page. Kisin–Pappas (2018) and Kisin (2017) were checked where the paper cites them.
- **The libraries.** All 25 library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.1215/00127094-2021-0063.

## 1. Items

- **Corrected fields (53):** 38 statements and 15 locators; six notes were updated. Examples:
  - S08 (Proposition 1.3.10) now takes the place v′ of E_T induced by ι_p (E24).
  - S19 states Corollary 1.3.18 with the hypotheses of [KP18, Cor. 0.3] (E27).
  - T37 states Lemma 2.3.13 as printed and records the hypothesis it needs (E41).
  - A15 records that the alterations of Corollary A.7 must carry a semi-abelian extension (E49).
  - N27, N29, N22 and N24 now carry the corrections to Proposition 1.1.13, Corollary 1.1.15, Definition 1.1.7 and Lemma
    1.1.10.
- **Removed (10), not in the paper.**
  - L05, the rank-one isocrystal classification, and N05, a common-denominator adapter for the coroot cone. The paper states
    neither.
  - C03–C10, the extraction's own quaternion counterexample chain for E8. The computation is correct and is now in E8 itself.
- **Kept.** C02 is kept, because it is the corrected form of the existence assertion of §1.3.15: the μ-ordinary class
  exists for quasi-split G_{Q_p}.
- **Added (71).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - the Newton-to-π₁ map, the averaging isomorphism, μ♯ and the transfer N_ξ of §1.1.5;
  - Kottwitz's and Rapoport–Richartz's results on basic classes and elliptic tori;
  - Wintenberger's Cartan-coset realisation, the Levi reduction and Mazur's inequality used in Proposition 1.1.13;
  - the torus-twisting step of Proposition 1.2.5;
  - Kisin's closed immersion into the Siegel variety, F-isocrystals, the universal F-isocrystal and its Tannakian envelope;
  - Grothendieck–Katz specialization, finiteness of B(G, {μ}) and [KP18, Cor. 0.3];
  - the comparison maps i_ℓ and the auxiliary split prime of §2.1;
  - Deligne's accommodating embedding, Noot's power argument, Néron–Ogg–Shafarevich and the transfer of tori of §2.2;
  - the realization isogeny schemes, the non-emptiness criterion for P_ℓ and the Kottwitz and Kisin inputs of §2.3;
  - Ogus's extension of sections in Appendix A.

  Some are already supplied:
  - **Planned (7):**
    - the derived group and the simply connected cover at ReductiveGroups Layer 6;
    - the absolute Weyl group at ReductiveGroups Layer 7;
    - Néron–Ogg–Shafarevich at NeronModelsAndSemistableAbelianVarieties R11.5;
    - Weil's estimate for Frobenius at DeligneWeightsAndPurity DWP.1;
    - real approximation at AdelicAlgebraicGroups AA.4;
    - the existence of special points at ShimuraVarieties V4;
    - Deligne's absolute Hodge theorem at AutomorphicBundles B1.
  - **Already an item.** Steinberg's theorem over L is G06, so it was not added again.

## 2. Statuses

- **Library.** All 25 library declarations exist at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All six routes are accepted; `PAPER-KISIN-MADAPUSIPERA-SHIN-22.review.json` gives a reason for each, based on each route's
recorded reason.

- **Titles.** The three Part II titles already begin with their parents' exact atlas titles.
- **Briefs.** Routes 2–4 now name the confirmed corrections their designs must carry. Route 3's brief no longer imports the
  removed items C07–C10.
- **Source routes.** Routes 1, 5 and 6 have no briefs, so their corrections are on the items: N22, N24, N27 and N29 carry E13,
  E14 and E16–E18, and T42 carries E47.
- **Prerequisites.** Rebuilt as 30 cited works, one per entry, each with its DOI or a stable link and the place the paper uses
  it.
  - The old entries bundled works and pointed at bibliography labels.
  - Kisin (2017) and Kisin–Pappas (2018), which the registry already has, are left out.

## 4. Mistakes

**The extraction's twelve.**

- **Rejected (1): E10.** I_{s0}(Q_p) ∩ Aut(A_{s0}) and I_{s0}(Q) ∩ Aut(A_{s0}) are the same group, since Aut(A_{s0}) consists of
  rational points and I_{s0} is defined over Q.
- **Confirmed (11).** Three are revised, as the independent checks upheld:
  - **E5.** Now an error in the proof: G × T is not inside GSp(V ⊕ V), and 1 × T maps onto G^ab. The fibre product
    G ×_{G^ab} T repairs Lemma 2.2.8.
  - **E8.** Rewritten without the removed items, with an instance inside the paper's setting: the Shimura curve of an
    indefinite quaternion algebra ramified at an odd p is of Hodge type with G_{Q_p} = D^×, and it has no μ-ordinary class.
    For Theorem 3 this makes the μ-ordinary locus undefined rather than the density false, since that special fibre is not
    locally integral.
  - **E9.** Now an error in the proof: the printed equivalence C_{𝒟,L} ≃ Rep_L G_{s0} fails for a CM elliptic curve, where
    the Tannakian group has dimension 1 and G_{s0} has dimension 2. Corollary 1.3.13 holds with the Tannakian group H ⊂ G_{s0}.

**New: 37 (E13–E49).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 41 claims, 37 were
  confirmed, 1 reclassified and 3 rejected. One confirmed claim, on Theorem 3, was folded into E8.
- **Rejected:**
  - that ⪯ on X_*(T)_R is only a preorder, which is standard usage, fixed by the paper's own "using dominant
    representatives";
  - a gap in the proof of Lemma 1.1.6, which [RR96, Prop. 2.4(ii)] covers exactly;
  - γ written for γ″ in §2.2.7, which the paper's definition of γ″ makes literally correct.

The main new ones:

- **E41.** Lemma 2.3.13 is false as stated. On the modular curve at an ordinary point, a CM lift and its twist by the
  nontrivial automorphism of T cannot both have P^T non-empty. The lemma needs the lift to have the Frobenius of s0, which
  the lift built in Proposition 2.3.11 has, so Corollaries 2.3.14 and 2.3.15 stand.
- **E27.** Corollary 1.3.18 drops hypotheses of [KP18, Cor. 0.3]: a special vertex of B(G, Q_p^ur) and p ∤ |π₁(G^der)|. With
  "special" read over Q_p, the quaternionic Shimura curve at O_D^× is a counterexample.
- **E24.** In the proof of Proposition 1.3.10, the place v′ of E_T must be the one induced by ι_p. For a sextic CM field and
  GSp₆, another place gives a different Newton class. The proposition stands.
- **E17.** The proof of Proposition 1.1.13 treats coinvariants as exact. G = SU(4)/μ₂ is a counterexample to the printed
  step, and the argument is repaired after ⊗Q.
- **E32.** In §2.2.7, G″ is not inside GSp(V″, ψ″); it must require equal similitude factors.
- **Gaps reaching a proof:**
  - E28: §2.1.5, where φ-invariance alone does not make the crystalline tensors rational over Q_{q^m} (the uniqueness in
    Proposition 1.3.7 does);
  - E34: §2.2.7, where γ″₁ must be made neat by a further power;
  - E49: Corollary A.7, where the alterations must carry a semi-abelian extension.
- **E16 and E18.** Two small gaps in the proofs of Proposition 1.1.13 and Corollary 1.1.15 that affect nothing: the π₁
  condition, and a rational Levi factor.
- **E36.** In the proof of Proposition 2.2.13 the centralizer M is not in general a Levi subgroup (GSp₄), but it is not
  needed. It affects nothing.
- **E39.** The remark after Conjecture 2.3.8 cites [Kis10] for [Kis17, (2.2.3), (2.2.5)], which also needs p > 2.

The rest are misprints.

With the corrections, Theorems 1, 2 and 4–6 stand. Theorem 3 and Corollaries 1.3.16 and 1.3.18 need G quasi-split at p
(E8), and Corollary 1.3.18 also needs the hypotheses of [KP18] (E27).

## Questions for the orchestrator

1. **Removed counterexample items.** C03–C10 proved, correctly, that the μ-ordinary class can fail to exist for D^×. They are
   not statements of the paper, so they were removed and their content is kept in E8. A design job may want them back as
   nodes.
2. **Published text.** The extraction and this review read the author PDF. The Duke text was not available, so the locators
   use the PDF's pages, and some misprints may be corrected in print.
