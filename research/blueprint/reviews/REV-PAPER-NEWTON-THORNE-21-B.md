# Review: PAPER-NEWTON-THORNE-21-B (Newton–Thorne, Symmetric power functoriality for holomorphic modular forms, II)

Job `REV-PAPER-NEWTON-THORNE-21-B` (issue #1451), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by session `cc-39fac3`. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted; routes 5 and 6 were added by the review.

## What was read

- **The published version**, read in full: Publ. Math. IHÉS 134 (2021), 117–152. It is the open-access PDF from Springer and pmihes.centre-mersenne.org (the file the extraction read, SHA-256 ab39986290418f835708ca5f1114b231c628ef1efe5aa7f479f2666db6ae7a1b). Every recorded mistake was checked on page images.
- **The arXiv v2 TeX source**, read in full: https://arxiv.org/e-print/2009.07180v2, SHA-256 c06de00aba765bdc15083fcc076627a540d3549fd1da469b3dfa1b2a5f60c70b. A word-level comparison of the two versions found three copy-edits in the journal:
  - p. 130: the proof of Proposition 2.5 cites [ANT20, Proposition 2.5], where arXiv cites [BC09, Proposition 1.5.1];
  - p. 148: "potentially crystalline" twice, where arXiv has "potentially Barsotti–Tate";
  - p. 140: ⊗_{l∈T} for ⊗_{v∈T}.

  The extraction's statement that arXiv v2 is the published text was corrected.
- **Cited inputs** checked where the extraction's statements depended on them:
  - BLGGT14 §§1.3–1.4 and Theorem 4.2.1, in the arXiv source https://arxiv.org/e-print/1010.2561;
  - Stacks Tag 0BUS (Lemma 10.103.7).
- **The libraries.** The only library citation was read at Mathlib 082e2d3 (`Mathlib/FieldTheory/Galois/Basic.lean`: `IntermediateField.restrictNormalHomSupProd` and `restrictNormalHomSupProd_injective`). It was also read at Tau Ceti f790474 (`TauCeti/FieldTheory/Galois/FiberProduct.lean`: `IntermediateField.mem_range_restrictNormalHomSupProd_iff`, for finite Galois intermediate fields K, L). Together they give Lemma 3.8, so the citation stands. The libraries were also searched for Chebotarev's density theorem, Cohen–Macaulay modules, Dickson's classification and polynomial-law determinants. Tau Ceti has the Frobenius prime sets but not the density theorem; the rest are absent.
- **The atlas.** The description of every cited layer and of every layer proposed for a new item was read in `data/atlas.json`. The other two Newton–Thorne extractions were compared (PAPER-NEWTON-THORNE-21, PAPER-NEWTON-THORNE-26), as were the briefs of the pending candidates this extraction coalesces with (PolarizedAutomorphyLifting, SmoothRepresentationsPartII).

## Items 1–37

The statements and locators are faithful to the published text, with the corrections below. The mathematics of §2 was checked:
- the dimension counts behind Proposition 2.6 (dim R_loc⟦X_1, …, X_g⟧ = q + 4|S ∪ S_∞| = dim W_∞, and the p = 2 count with γ);
- the regularity argument at 𝔭′_∞;
- Lemma 2.4's Hilbert 90 construction;
- the claim in Lemma 2.7 that (α/β)^i ≠ 1 for i < n;
- in §3, the Mackey count in Lemma 3.4 (multiplicities p + 2 and p + 1);
- the arithmetic of Proposition 3.7 (b | i, the range b ≤ i ≤ q + 1 − b, and the element of projective order ≥ t/2);
- the bookkeeping of Propositions 3.9–3.11.

**Corrections.**
- **Item 36 (BLGGT14 Theorem 4.2.1).** The statement omitted the theorem's hypotheses. Read in the source, they are:
  - F imaginary CM, l odd, and (r, μ) regular algebraic, irreducible and polarized;
  - potential diagonalisability above l;
  - r̄|_{G_{F(ζ_l)}} irreducible, l ≥ 2(d + 1) and ζ_l ∉ F;
  - (r̄, μ̄) ordinarily or potentially diagonalisably automorphic.

  It is now stated exactly, with how the paper meets these hypotheses over ℚ.
- **Item 32 (the reductions in the proof of Theorem 3.1).** Rewritten against pp. 147–148:
  - the large-image choice of t;
  - "potentially crystalline" (published wording);
  - how the case 2 ∈ sc(π) must end (E3).
- **Item 34.** Gee's Theorem 4.6.1, a local statement about residual inertia that R24.3 does not plan, was split off as item 61.
- **Items 6, 15 and 18.** The "Kisin 2009" citations now name the paper: the Annals *Moduli* paper or the Inventiones *2-adic* paper.
- **Planned layers added:**
  - item 3: AutomorphicGaloisRepresentations R19.1 (Deligne–Serre);
  - item 6: LocalGaloisDeformationRings R08.5 (the real places);
  - item 7: GlobalGaloisDeformations R04.4 (the p = 2 variants with determinant fixed only on S).
- **Items 8 and 17 (Newton–Thorne 2020).** Rerouted; see Routes.
- **Item 14.** A note records the published citation of ANT20 Proposition 2.5.

## New items (24)

**Planned (20).** For each, the layer descriptions quoted in the item's note were read.
- 38: the definition of Sym^n π (ML.5, ML.0).
- 39: local Langlands, rec^T and Weil–Deligne representations (ET.6, R16.3, R01.2).
- 40: Galois representations of polarizable regular algebraic cuspidal representations, with local–global compatibility (AG2.2, AG2.5, AG2.6, R19.4, R19.5).
- 41: Gelbart's identification with eigenforms (R16.6).
- 42: Newton–Thorne I Theorem B, the base case (ML.3).
- 43: BCDT (R29.6).
- 44: Godement–Jacquet entireness (AL.2), which Corollary B uses silently.
- 45: Λ(Sym^n E, s) (ML.3).
- 46: the low-degree symmetric-power and tensor transfers of Appendix A (ML.5).
- 47: ordinarity and Geraghty's criterion (R19.5, R08.4).
- 48: soluble base change and descent, including BLGHT11 Lemma 1.5 (R17.4, ML.5).
- 49: Labesse's base change and descent for the unitary group (ET.7a, AG2.2).
- 50: Chenevier's determinants (IHG.0).
- 51: unique decomposition of residually multiplicity-free abelian determinants (IHG.1).
- 52: the Cohen–Macaulay and component lemmas of the support argument (R03.3, R03.6).
- 53: Cline–Parshall–Scott (R04.5, R01.4).
- 54: Chebotarev (Tau Ceti Chebotarev Layer 10, AN.4).
- 55: Dickson's classification (R01.4).
- 57: Hida control for Lemma 3.4 (R21.1, R21.2, PadicFamilies L0).
- 60: the Khare–Wintenberger invariant rings for free Ĝ_m^γ-actions (R04.4, R22.6).

**Missing (4).**
- 56: the Ribet–Momose large-image theorem, used without citation in Proposition 3.9 and Theorem 3.1. New source route 5, to R19.3.
- 58: BLGGT14's relations ∼ and ⇝, with Remark (6) on p. 524.
- 59: potential diagonalisability (BLGGT14 Lemma 1.4.3, Gee–Kisin Lemma 4.4.1, the BLGG11 remark).
- 61: Gee's Theorem 4.6.1. New source route 6, to R07.4–R07.5.

Items 58 and 59 go to route 4.

The totals are now 61 items: 1 library, 30 planned and 30 missing.

## Routes

1. **Source of ModularityAndLanglandsExtensions ML.1/ML.3/ML.5: accept.** Planned items 38, 45 and 46 were added.
2. **Part II `SymmetricPowerAutomorphyLifting`: accept.** ML.3 plans only the endpoint, and no layer plans the method:
   - the P → R patching;
   - the regularity of P_∞ in place of dual-Selmer control;
   - the seasoned killing of supercuspidal ramification.

   The method is distinct from the two Newton–Thorne I Part IIs. Items 8 and 17 were moved out (route 4). The brief was rewritten: final theorems exactly as printed, the layers, every import, and the corrections E1 and E3.
3. **Coalesced SmoothRepresentationsPartII (GL_2 types): accept.**
4. **Coalesced PolarizedAutomorphyLifting: accept.** It gained:
   - items 8 and 17: the Newton–Thorne 2020 conjugate self-dual semistable pseudodeformation ring and the vanishing of adjoint Bloch–Kato Selmer groups;
   - items 58 and 59: ∼ and potential diagonalisability.

   A brief addendum states what to record. These are general polarized-deformation results used by all three Newton–Thorne papers, so they need one owner.
5. **Source of AutomorphicGaloisRepresentations R19.3 (item 56): added and accepted.**
6. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4–R07.5 (item 61): added and accepted.**

**One treatment for the three Newton–Thorne papers.** The extraction asked the review to choose. For this paper:
- a Part II of ModularityAndLanglandsExtensions carries the method;
- the general inputs go to their general owners.

The Newton–Thorne 2020 results are currently routed three ways:
- here, to PolarizedAutomorphyLifting;
- in PAPER-NEWTON-THORNE-21 (item 73), to SymmetricPowersByAnalyticContinuation;
- in PAPER-NEWTON-THORNE-26 (`nt23-adjoint-selmer-vanishing`), to an ML source route.

The reviews of those two extractions should move them to PolarizedAutomorphyLifting. Otherwise the atlas plans the same theorem three times. PAPER-NEWTON-THORNE-26 routes its whole method as sources of ML.3; whether that stands is for its own review.

## Mistakes in the paper (`sourceIssues`)

- **E1 (misprint, p. 147): confirmed.** The 3-adic image statement concerns r̄_{π′,ι}, the good-dihedral form: the element of projective order t comes from π′_q, and Lemma 3.4 is applied to π′.
- **E2 (misprints, pp. 130, 132): confirmed.** Frob_ṽ should be Frob_w, and ad r̄⁰(1) should be ad⁰r̄(1).
- **E3 (gap, p. 148): new.** In the case 2 ∈ sc(π), the paper says to "repeat the same argument with 3 replaced by 2". That argument ends with Proposition 3.11, which needs 3 ∉ sc(π″). Lemma 3.4 at the prime 2 preserves supercuspidality at 3, so if π_3 is also supercuspidal, 3 ∈ sc(π″) and Proposition 3.11 does not apply. The repair is immediate: π″ has weight 2 and 2 ∉ sc(π″), which is the case already treated. It affects the proof, not the theorem.
- **E4 (misprints, pp. 127, 133, 136–138): new.** Notational slips in §2:
  - G(𝔸^∞_{F⁺}) for G(𝔸^∞_F);
  - H_D(U_1(Q; N))_{m_D} for the localisation at m_{D,Q};
  - U_1(Q; N), V_1(Q; N) for U_1(Q_N; N), V_1(Q_N; N) in both patching proofs;
  - H(V_1…) and H(V_0) for H_G;
  - H_∞ for H_{G,∞}.

No correction is in print: Crossref has no update relation, arXiv v2 ("Accepted version") is the last version, and the publisher's pages have no notice. None of E1–E4 affects a stated result.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NEWTON-THORNE-21-B.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and every planned and route stage id exists in the atlas.
- Lean: none (a review of an extraction).
