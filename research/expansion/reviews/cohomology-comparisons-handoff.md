# CohomologyComparisons — source-reading handoff (assignment R3)

Packet: `research/expansion/drafts/CohomologyComparisons.json` (draft, status `partial`, no
`review` object). Source: Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory*,
arXiv:1602.03148v3, supplied text extraction, SHA-256
`04b1f8357a38045fed39ab060d3cb01142bcdbcc15fca985bc80216b99fba774` (the same extraction the
AInfCohomology packet records). Extracted line numbers below refer to that file; printed page
numbers are the paper's.

## 1. Sections read

| Passage | Printed pages | Extracted lines | Depth |
| --- | --- | --- | --- |
| Theorem 1.1 and inequality (1) | 2–3 | 135–170 | statements |
| §2 introduction (pointer to §2.1–2.2) | 13 | 766–776 | statement; examples unread |
| Example 3.16 (ε, ξ, ξ̃_r) | 25 | 1519–1541 | with proof sketch |
| Lemma 3.23 | 27–28 | 1695–1706 | statement |
| Prop. 3.24, Lemmas 3.25–3.28, Cor. 3.29 | 28–30 | 1763–1871 | with proofs |
| Theorem 4.4, Remark 4.5, proof of 4.4 | 33–34 | 2017–2060 | statement + proof |
| §4.2 setup, Lemma 4.6 | 34–35 | 2060–2082 | statement + first proof paragraph |
| Lemma 4.9, 4.10, Rem. 4.11, Cor. 4.12, Prop. 4.13 | 35–37 | 2165–2281 | with proofs |
| Lemma 4.14, Cor. 4.15, Lemma 4.16, Cor. 4.17, Lemma 4.18, Lemma 4.19, Cor. 4.20, Rem. 4.21 | 37–40 | 2282–2473 | with proofs |
| Def. 4.22, Ex. 4.23 (start), Lemmas 4.26/4.27, Thm 4.28, Rem. 4.29, Prop. 4.34 | 40–44 | 2479–2498, 2542–2550, 2582–2590, 2610–2661, 2719–2740 | statements; Remark 4.29's argument in full |
| Theorem 5.1; Theorem 5.7 | 45; 48 | 2753–2766; 2945–2958 | statements (5.7 with proof) |
| Theorem 12.1; Theorem 13.1; Remark 13.20 | 96; 104; 114 | 6048–6066; 6629–6665 | statements |
| Prop. 13.21, Remark 13.22 | 116–117 | 7524–7560 | with proof |
| Theorem 14.1; Theorem 14.3; Remark 14.4 | 117–120 | 7587–7612; 7735–7781 | statements; 14.3 with proof |
| Theorem 14.5; Theorem 14.6; Remark 14.7 | 120–122 | 7782–7918 | with proofs |

Not read: §2.1–2.2, §§5–13 apart from the statements above, §13.4 beyond Prop. 13.21,
Cesnavicius–Koshikawa, Hyodo–Kato, Kisin.

## 2. What the packet contains

20 nodes (2 under CP.0, 3 under CP.2, 1 under CP.3, 14 under CP.5), 49 links, coverage records
for all seven CP stages (CP.0/2/3/5 partial; CP.1/4/6 not_read), 12 gaps.

The chain, as decomposed:

1. `CP.5/specialization-length-inequality` — Lemma 4.14: for finitely presented M over
   W_n(O♭), ℓ(M_η) = ℓ(M_s) − ℓ(Tor_1(M, W_n(k))) ≤ ℓ(M_s).
2. `CP.5/witt-versus-tilt-specialization-inequality` — Cor. 4.15: equal ranks and
   ℓ(M ⊗ W(k)/p^n) ≥ ℓ(M ⊗ W(K♭)/p^n).
3. `CP.5/derived-to-degreewise-witt-specialization` — Lemma 4.16: injectivity, rational
   bijectivity, bijectivity when H^{i+1}(C) has no x-torsion.
4. `CP.5/finite-presentation-and-freeness-criterion` — Cor. 4.17; and
   `CP.5/mu-inverted-freeness-criterion` — Lemma 4.19 + Cor. 4.20.
5. `CP.5/integral-torsion-length-inequality-over-C` — Thm 14.5(ii), with the inline length
   observation as `CP.5/length-monotonicity-under-torsion-cokernel`.
6. `CP.5/lattice-recovery-over-C` — Thm 14.5(iii), two tiers; `CP.5/dvr-lattice-recovery-via-breuil-kisin`
   — Thm 14.6(iii); `CP.5/dvr-torsion-length-inequality` — Thm 14.6(ii);
   `CP.5/mod-p-de-rham-dimension-bound` — inequality (1).

Supporting: `CP.5/perfectness-and-tor-bounds-for-ainf-modules` (Lemma 4.9),
`CP.5/ainf-module-structure-theorem` (Prop. 4.13 with Lemmas 4.6/4.10/Cor. 4.12),
`CP.5/crystalline-de-rham-torsionfreeness-equivalence` (Lemma 4.18, Remarks 4.21/14.4/14.7),
`CP.0/coherence-of-witt-vectors-of-perfectoid-integers` (Prop. 3.24, Lemmas 3.25–3.28, Cor. 3.29),
`CP.0/ainf-specialization-dictionary` (x, W̃, Q, A_inf → W(K♭), θ/ξ/μ, A_crys/B_crys^+),
`CP.2/rational-crystalline-comparison-over-C` (Thm 14.5(i)),
`CP.2/rational-crystalline-base-change-along-residue-section` (Prop. 13.21),
`CP.2/crystalline-comparison-over-discretely-valued-base` (Thm 14.6(i)),
`CP.3/good-reduction-bdr-lattice-identification` (Thm 13.1 statement, Remark 13.20, the
identification used in 14.5(i)/(iii) — proof unread).

## 3. Exact adjacent-degree hypotheses found

- Lemma 4.16 (p.38): bijectivity of H^i(C) ⊗ W(k) → H^i(C ⊗^L W(k)) requires
  **H^{i+1}(C) x-torsion-free**; the source's proof shows the obstruction is
  H^{i+1}(C)[x^{1/p^n}] in the Koszul sequence for A_inf/(x^{1/p^n}).
- Corollary 4.17 (p.39) and Corollary 4.20 (p.40): H^i(C) finite free needs
  H^i(C ⊗^L W(k)) p-torsion-free; the equality H^i(C) ⊗ W(k) = H^i(C ⊗^L W(k)) needs
  **moreover H^{i+1}(C) ⊗ W(k) p-torsion-free**, e.g. H^{i+1}(C ⊗^L W(k)) p-torsion-free.
- Theorem 14.5(iii) (p.121): with only H^i_crys(X_k/W(k)) p-torsion-free one gets
  H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)) and the φ-compatible inclusion
  H^i_crys ⊃ BKF(H^i_ét) ⊗ W(k); equality needs **H^{i+1}_crys also p-torsion-free**.
- Theorem 14.6(iii)/Theorem 1.1(iii): both H^i_crys and H^{i+1}_crys p-torsion-free.
- Remark 14.7 (p.122): each crystalline hypothesis may be replaced by torsion-freeness of
  H^i_dR(X) in the same degree (Lemma 4.18 is a fixed-index equivalence; Remark 14.4 notes the
  two-degree version follows from universal coefficients, the one-degree version does not).
- Inequality (1) (p.3): the reconstruction uses Theorem 1.1(ii) in degrees i **and** i+1.
- Lemma 4.14/Cor. 4.15/Thm 14.5(ii): no torsion hypothesis at all.

## 4. Corrections and qualifications to existing stage statements

CP.5
- "for every n≥1 ... in the proper smooth DVR case": the source proves the inequality for
  every n ≥ 0 over O_C first (Thm 14.5(ii)); the DVR case (Thm 14.6(ii)) is by base change
  along W(k) → W(k̄). The argument also yields equality of ranks, which CP.5 should state.
- The lattice-recovery statement should be recorded in two tiers as in Thm 14.5(iii): the
  canonical isomorphism H^i_Ainf ≅ BKF(H^i_ét) and the inclusion need only degree i; equality
  needs degree i+1. Over a DVR the recovered object is BK(H^i_ét(X_C,Z_p)) ⊗_S W(k).
- "Prove the mod-p de Rham dimension bound by the derived base-change spectral sequence":
  the source only states (1); the derivation needs (ii) in degrees i and i+1 and the
  universal-coefficient identifications on both the crystalline and the étale side.
- Remark 14.7's de Rham substitute for the crystalline hypotheses is not mentioned in CP.5.
- The source's Theorem 14.5(iii) cites Cor. 4.20; given Theorem 14.3's BKF conclusion, Cor. 4.17
  suffices (Cor. 4.20 adds only rational freeness, which AI.5 already supplies).

CP.2
- "Carry any auxiliary residue-field section through the proof and prove that the final
  descended map has the claimed independence": Prop. 13.21 fixes a section k → O/p; the source
  claims uniqueness only for k = F_p (Remark 13.22). In the DVR case the section
  k → O_K/p → O_C/p induced by W(k) → O_K is canonical (proof of 14.6, p.122), and for
  p^n ≥ e the map O_K → O_C/p^{1/p^n} factors through k, so the isomorphism used in the proof
  of 13.21 is canonical. CP.2 should state independence only for that canonical section.
- CP.2 says "compatibility with the de Rham filtration through CP.3", but the atlas has no
  CP.3 → CP.2 edge. The proof of 14.6(i) uses Theorem 13.1's agreement with Theorem 5.1. The
  packet adds a CP.3 → `CP.2/crystalline-comparison-over-discretely-valued-base` link
  (checked acyclic).
- G_K- and Frobenius-compatibility in 14.6(i) is asserted, not displayed.

CP.3
- Theorem 14.5(iii) consumes the B_dR^+-lattice of Theorem 13.1; the atlas has no CP.3 → CP.5
  edge. The packet adds CP.3 → `CP.5/lattice-recovery-over-C` (acyclic).

CP.0
- The μ-invertibility facts (μ a unit in W(K♭); A_inf[1/μ] → B_crys) are used without proof
  and should be part of the normalization dictionary.

## 5. Supplier requests and the AI.5 → CP.5 claim

- **AInfCohomology:AI.5 → CP.5 (verified).** AI.5's description says it proves "the linear
  algebra controlling integral torsion under these specializations" and that CP.5 "states the
  resulting torsion inequalities and lattice-recovery applications uniformly, importing this
  proof"; CP.5's description says "From AI.5's BKF linear algebra prove ...". Both sides agree.
  Encoded as links from AI.5 to the CP.5/CP.2 application nodes for the Theorem 14.3 package
  (perfectness, φ, BKF cohomology, comparisons (i)–(iv)). The generic §4.2 lemma nodes are
  tagged "[Supplier material ...]" in their statements and should be re-homed into the
  AInfCohomology packet (AI.5; Prop. 4.13 to AI.2, whose description owns "torsion
  decompositions" and Fargues' equivalence). Node ids must start with the owner roadmap, so this
  is a move, not a relabel.
- **AInfCohomology:AI.2 → CP.5 (verified, new links).** Def. 4.22, Lemma 4.26, Thm 4.28,
  Remark 4.29 are AI.2's per its description; two links added.
- **Ownership conflict to resolve.** Prop. 13.21 is required by AI.5's Theorem 14.3 (BKF
  property) and by CP.2's Theorem 14.6(i), while AI.5 → CP.2 is an existing edge. The packet
  keeps Prop. 13.21 under CP.2 (per CP.2's text) and adds no node → AI.5 link; recommend
  re-homing it to CrystallineCohomology CR.3 (Berthelot–Ogus-type rational base change) or AI.4.
- **CrystallineCohomology:CR.3 → CP.2/CP.5 nodes (links added):** crystalline base change
  (Prop. 13.21; k → k̄; RΓ_crys ⊗^L k ≃ RΓ_dR(X_k)). The char-p Frobenius-isogeny step for
  smooth qcqs (non-proper) k-schemes is a gap; candidate CR.3:Frobenius-isogeny, scope unchecked.
- **PadicHodgeTheory:R06.2 → CP.5/CP.2 nodes (links added):** D_crys/D_dR formalism in
  Prop. 4.34 and the crystallinity conclusion.
- **No supplier found for Kisin's Theorem 4.4 and Prop. 4.34.** R07.4's description covers
  finite-flat/p-divisible-group classification only; AI.7 disclaims it; PR.7 refers to "R07's
  Kisin functor". No link added; recorded as the first gap.
- **No supplier found for Scholze's Theorem 5.1** (proper smooth rigid de Rham comparison),
  used for filtration compatibility and for Ξ = D_dR(V) ⊗ B_dR^+.

## 6. Unresolved imports (see packet gaps)

Theorem 14.1(i)–(iv), Lemma 6.19, Prop. 9.17, Theorem 5.7's use (AI.4/AI.5); §13.1–13.4 and the
explicit-complex compatibility 12.1 ↔ 13.1 (CP.3); Kisin [49, Thm 1.2.1], [48, Prop. 2.1.12];
Beauville–Laszlo [4]; classification of finitely presented modules over valuation rings;
essential surjectivity in Lemma 4.6; formality of complexes with free cohomology; μ facts;
§2.1–2.2 examples; CK §§7–8; R07 small-weight comparison.

## 7. Next actions

1. Move the tagged generic nodes into the AInfCohomology packet (AI.5/AI.2) and re-point the
   CP.5 links; re-home Prop. 13.21.
2. Read BMS1 §2.1–2.2 (pp.13–20) and add the two counterexamples as CP.5 acceptance nodes.
3. Read §13.4 (Thm 13.19, Rem. 13.20) and the proof of Thm 13.1 (from p.115) for CP.3, then
   the 12.1 ↔ 13.1 compatibility.
4. Settle the owner of Kisin's Theorem 4.4/Prop. 4.34 and of Scholze's Theorem 5.1.
5. Verify the μ-invertibility facts in BMS1 §12 / Fontaine and record locators in CP.0.
6. Open Cesnavicius–Koshikawa §§7–8 for the semistable branch of CP.5 and §§5–6, 9 for CP.4.
