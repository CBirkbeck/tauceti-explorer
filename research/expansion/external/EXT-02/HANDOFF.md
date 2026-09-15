# EXT-02 handoff — Geometry and cohomology (internal claim, 2026-09-15)

Status: IN PROGRESS. Updated as packets are written. All packets are `status: partial`.

## Files written (all validated: json.load, node parents / link endpoints / coverage ids checked against data/atlas.json, link graphs acyclic, every stage of each roadmap has a coverage record)
- `AdicSpacesPartII.json` — 24 nodes, 14 links, 8 coverage records (R0-R5 partial; F0, F1 not_read), 9 gaps.
- `ClassicalAdicEtaleCohomology.json` — 18 nodes, 19 links, 10 coverage records (H0, H1, H1:henselian, H1:formal-adic-comparison, H5 partial; H1:valuation-nearby-cycles, H1:valuation-exports, H2, H3, H4 not_read), 6 gaps. Deepest stage: H1:formal-adic-comparison (Huber §3.5 complete with the §3.6 proofs).
- `AdicEtaleGeometry.json` — 10 nodes, 16 links, 5 coverage records (A0-A4 all partial), 5 gaps. A1 carries the pro-étale site with the erratum's corrected covering convention; A3 records ECD 6.4(iv) as a sketch with its FS/KL16 imports; A4 carries ECD 15.1-15.6.
- `AdicCoefficientsAndComparisons.json` — 14 nodes, 20 links, 7 coverage records (L0-L6 all partial), 6 gaps. ECD §§26-27 read completely; de Jong 4.1/5.8/6.5 statements and reduction strategies read.

## Sources read (with exact scope)
- Huber 1996, in addition to the Chapter 1-2 passages below: §2.4 (2.4.1-2.4.7), §2.6 (2.6.1-2.6.2), §3.1 complete, §3.2 complete (proofs of 3.2.4 read; 3.2.5 delegated to [Hu3]), §3.3 (3.3.1-3.3.3 statement), §3.4 (3.4.2-3.4.3 statements and the derivation of 3.2.12), §3.5 complete, §3.6 complete (proof of 3.6.1 and of 3.5.8-3.5.10), §3.7 complete, §3.8 complete, §3.9 statement and outline, §6.1 Proposition 6.1.1 statement.
- Scholze, p-adic Hodge theory for rigid-analytic varieties, §3 complete, and the 3-page erratum complete.
- Scholze, Étale cohomology of diamonds (14 April 2026 manuscript): §5 (5.7-5.11), §6 complete, §15 complete, §26 complete, §27 complete; statements of 14.6, 14.12, 16.1, 16.3, 17.6, 19.5, 24.4.
- de Jong, Smoothness, semi-stability and alterations: 2.12, 2.16, 4.1-4.11, 5.8-5.10, 6.1-6.9.
- Bhatt-Scholze, The pro-étale topology for schemes: 3.4.1, 3.4.2, 3.4.4, 3.4.12, 3.5 setup, 3.5.1, 3.5.7 with proof.
- Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces* (Vieweg 1996; library OCR copy, sha256 8e470878…): §1.1 (1.1.11); §1.2 (1.2.1-1.2.7 with the proof of 1.2.2); §1.3 (1.3.1-1.3.19 with proofs of 1.3.4, 1.3.6-1.3.8, 1.3.12-1.3.16); §1.4 (1.4.1-1.4.9 with proofs); §1.5 (1.5.1-1.5.10 with proofs); §1.6 (1.6.1-1.6.10); §1.7 (1.7.1-1.7.11 with proofs); §1.9 (1.9.1-1.9.6); Chapter 2 introduction and §2.1 (2.1.1-2.1.4 with proofs), §2.2 (2.2.1-2.2.2, proof of case (a)); §3.5 opening paragraph and the statement of Lemma 3.5.1; bibliography.
- Conrad, *Modular curves and rigid-analytic spaces* (author manuscript, sha256 ab6daecb…): §1.2 GAGA remarks; §3.1 (3.1.1-3.1.5 with proof, 3.1.6 statement and first proof paragraph); §4.1 proof of Theorem 4.1.1 (the fpqc reduction and local |a_Γ| description); Appendix A.1 (A.1.1-A.1.5 with proofs); B.3.3-B.3.4.
- Kedlaya-Liu, *Relative p-adic Hodge theory: foundations* (arXiv 1301.0792, sha256 a6a11742…): §2.4 (2.4.23-2.4.24), §2.5 (2.5.1-2.5.5, 2.5.20-2.5.21), §2.7 (2.7.1-2.7.9), §2.8 (2.8.10-2.8.12).
- Scholze-Weinstein, *Berkeley Lectures* (2020 print PDF, sha256 22550517…): §6.3 (6.3.1-6.3.4 with proofs).
- Birkbeck-Heuer-Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties* (AIF 73 (2023), sha256 d59b7f70…): §3.1 (3.2-3.5; proof of Corollary 3.4).

## Corrections / clarifications to existing stage statements
1. **AdicSpacesPartII:R2 "Hasse domains"**: Conrad's admissible loci S^{>h}, S^{≥h} (Thm 4.1.1) are defined through the Hasse invariant h(E) = max(|a|, 1/p) with a the X^p-coefficient of [p]^*(X) on the formal group of a semistable model (Def. B.3.3), and the local description is |a_{Γ_A}| > h on formal affines of a proper model. The stage's formulation "rational subdomains cut out by a section of a line bundle and a valuation bound" is not what this source proves; no read source supplies the line-bundle-section formulation. Recorded as remaining work.
2. **AdicSpacesPartII:R1 "proper GAGA"**: Huber's book contains no GAGA theorem; Conrad's paper only cites "GAGA over fields/artin rings" (Köpf, [C3]). The R1 GAGA obligation currently has no source in the library.
3. **AdicSpacesPartII:R0 finiteness**: Huber Prop. 1.5.5 ("quasi-finite and proper ⇔ finite", for morphisms locally of finite type between analytic adic spaces) is the book's finiteness theorem; it needs properness, and Lemma 1.7.6 (flatness of étale maps) is proved only when A^▷ has a noetherian ring of definition or is a strongly noetherian Tate ring. Both restrictions are recorded in the nodes.
4. **AdicSpacesPartII:R2 comparison 1.9.6**: Huber gives no proof ("One can easily prove"); the isomorphism d(X̂) ≅ X ×_Y d(Ŷ) requires f separated and universally specializing (not merely finite type). Recorded as a gap.
5. **AdicSpacesPartII:R5**: BHW attribute "étale over sousperfectoid is sousperfectoid" to Berkeley 6.3.3(ii); the read statement 6.3.3(2) covers finite étale algebras, so the étale case needs 6.3.3(1)+(2) plus Huber 1.7.1 local structure. Recorded in the node hypotheses.
6. **AdicSpacesPartII:R1 rigid/adic properness comparison (Huber 1.3.19)**: the converse "r(f) partially proper ⇒ f partially proper" is only asserted for discretely valued k° (via Lütkebohmert), except in the locally quasi-finite case (1.5.9). Stage texts that transport properness from adic to rigid over nondiscrete fields should retain this caveat.

## Shared-supplier requests
- A supplier for *Huber 1994 (Math. Z. 217)* material (completed tensor products/universal property [Hu 3.5], scheme-adic fibre products [Hu 3.8], the functors t and r [Hu 4.1, 4.3]) is needed by AdicSpacesPartII R0-R2; no stage in the atlas owns it and the article is not in the library.
- A supplier for the coherent-sheaf trace along finite locally free maps (R3) — none found; algebraic candidate Mathlib `Algebra.trace`.
- Bosch-Lütkebohmert I/II (formal models, flattening, quasi-finite models, rig-points): needed by R2's fibral finiteness node and by the PadicFamilies gap (see below); no owner.

## Rigid-analytic finiteness supplier question (PadicFamilies gap "Formal-model finiteness beyond the existing geometric outline")
Answer after reading AdicSpacesPartII R0-R2 sources: **no existing stage's scope covers it.**
- The closest adic-level source statements are Huber Prop. 1.5.5 (quasi-finite + proper ⇔ finite; morphisms locally of finite type between analytic adic spaces) with Lemma 1.4.7 (a proper fibre gives finiteness over a neighbourhood) and Lemma 1.4.9 (descent of finiteness along a finite faithfully flat affinoid map). These sit inside AdicSpacesPartII:R0's scope ("finite maps … related to topological and stalkwise properties only under the hypotheses that justify the relation") and are now nodes `AdicSpacesPartII:R0/finite-morphisms` and `AdicSpacesPartII:R0/quasi-finite-and-finiteness-criteria`. They do **not** supply Conrad Thm A.1.2, because A.1.2 replaces properness by "flat + quasi-compact + separated + finite fibres + locally constant fibre rank"; properness is the conclusion, not an input, in the eigenvariety application.
- Conrad A.1.2 itself is now recorded as the node `AdicSpacesPartII:R2/fibral-finiteness-criterion` (with A.1.4, A.1.5, Remark A.1.3), whose proof imports [BL1, Prop. 4.7] (formal model of a separated map is separated), [BL1, §3.5] (rig-points), [BL2, Thm. 5.2] (flattening by admissible blow-up), [BL2, Cor. 5.3] (quasi-finite formal model), and EGA IV_4 18.5.11(c), IV_3 9.8.8. None of these is in the library; the node is a *proposed home*, not yet a supplier. The statement that would supply the PadicFamilies nodes `L2a/constant-rank-finiteness` and `L2a/admissible-slope-cover` is exactly Theorem A.1.2 as recorded there; it becomes usable once Bosch-Lütkebohmert I §3.5, §4 and II §5 are read and decomposed under R2.
- AdicSpacesPartII:F0 cannot host it: its scope is restricted to complete separated *noetherian* adic rings, and Conrad's Remark A.1.3 explicitly notes that local rings of formal models are non-noetherian for nondiscrete k. AdicEtaleGeometry:A2 supplies formal models only "in the scope required by H1" (étale cohomology), and ClassicalAdicEtaleCohomology:H1:henselian constructs affinoid henselizations, not the scheme lemma A.1.4.

## Unresolved cross-job dependencies
- EXT-03 (PerfectoidSpaces P0/P3): R5 consumes "perfectoid spaces" and Berkeley Thm 7.4.5(1) (finite étale over perfectoid is perfectoid, almost purity); not read here.
- EXT-04 (DiamondsAndVStacks / DiamondEtaleCohomology): H2/H4/H5 consumers of ClassicalAdicEtaleCohomology use ECD lemmas 14.6, 16.3, 19.5, 24.1, 27.x; not yet read here.
- EXT-01 (SchemeAndStackFoundations SF.1): fpqc descent on the scheme side for Conrad Lemma A.1.4.

## Further corrections / clarifications (packets 2-4)
7. **ClassicalAdicEtaleCohomology:H1:formal-adic-comparison**: the displays of Huber 3.5.8.ii, 3.5.11, 3.5.13(*), 3.5.16, 3.5.17 are lost in the library OCR; the packet reconstructs them from the proofs and flags them for page-image verification (pp. 205-210).
8. **ClassicalAdicEtaleCohomology:H5**: Huber's Lemma 3.7.3 (f^ad quasi-compact) is proved in the book only for O_R(R) noetherian or discrete; the general case is delegated to [Hu4, 3.12.8]. Theorem 3.8.1 is not proved in the book; the source gives two routes (SGA 4 XVI.4 + 3.7.2 + 3.9.1(b) + 3.8.2 in char 0; Berkovich 7.5 + 5.7.2 + 7.5.3 in char p).
9. **AdicEtaleGeometry:A3**: ECD 6.4(iv) is a proof sketch citing [FS26, IV.4.19] and [KL16]; the stage's decomposition into tasks 1-5 is recorded against the sketch, and Huber's proof of 1.7.1 uses noetherianity at point (3), confirming that a pseudocoherent replacement is needed.
10. **AdicEtaleGeometry:A1**: Scholze's Proposition 3.7(i) is false as printed and the erratum restricts pro-étale covers to transfinite compositions of pullbacks of finite étale surjections; Proposition 3.8 and the last sentence of 3.13 are deleted. Recorded verbatim.
11. **AdicCoefficientsAndComparisons:L6**: ECD 27.7's proof passes through 27.6 and therefore inherits the prime-to-p, finite-coefficient hypothesis; 27.6-27.7 defer four computations (purity/Kummer on normal-crossing strata, dimension induction, Spec K -> Spec O, descent from alterations) that no read source writes out.
12. **AdicCoefficientsAndComparisons:L0**: ECD 26.2 uses Bhatt-Scholze 3.5.7 with noetherianity replaced by the regular-sequence hypothesis; BS15's text as read only states the unbounded extension for regular m (3.5.7(5)); Lemma 3.5.5 unread.

## Next actions
- DeligneWeightsAndPurity: DWP.2 from Weil I §3 (in progress); DWP.7 from Weil II §3.3.
- LefschetzPencilsAndVanishingCycles: LPV.0 from SGA 7 II XIII §§1-2; LPV.2 from XV.
- EtaleDualityAndPerverseSheaves: SGA 4½ [Dualité], [Cycle]; BBD needs OCR (library PDF is image-only; tesseract is available).
- ClassicalAdicEtaleCohomology: H1:valuation-nearby-cycles from Huber §4.2 (pp. 240-253).
