# PAPER-GAN-SAVIN-23-B: The local Langlands conjecture for G_2

Wee Teck Gan and Gordan Savin, *The local Langlands conjecture for G_2*, [Forum of Mathematics, Pi 11 (2023), e28, 1–42](https://doi.org/10.1017/fmp.2023.27); arXiv [2209.07346](https://arxiv.org/abs/2209.07346).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1377). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-GAN-SAVIN-23-B.result.json](PAPER-GAN-SAVIN-23-B.result.json). It has:
- 128 items: 1 in the libraries, 4 planned, 123 missing;
- 6 routes: 2 new roadmaps (one of them coalesced with a pending candidate), 2 Part IIs (one coalesced) and 2 source routes;
- 31 prerequisite entries;
- 15 recorded source issues.

## Sources read

- **The published version**, which is open access (CC BY 4.0), read in full. It is the version of record. Page numbers below are the journal's.
  - Fetched from Cambridge Core; SHA-256 `9a68ba45…d33b4ce`.
  - Received 9 November 2022, revised 24 August 2023, accepted 15 September 2023.
- **arXiv v2** (17 December 2022) predates the revision and was used only to check whether the recorded mistakes were already there. Every passage compared was, except the proof of Lemma 10.1 (E11), which is new. The journal rewrote some passages; for example, Lemma 10.1 assumes θ(π) is square-integrable in v2 and tempered in the journal.
- **Errata:** Crossref records no correction or update, and a Crossref search for a corrigendum found none. There is no arXiv version after the journal revision.
- **Cited inputs were not read.** Items that rest on one, such as Kret–Shin, Xu, Chenevier, Harris–Khare–Thorne and the companion papers [GS23], [GS24] and [GrS2], state it as the paper uses it.

## What the paper proves

**Main Theorem.** Let F be a p-adic field of characteristic 0. There is a natural surjective map L : Irr(G_2(F)) → Φ(G_2) with finite fibres. It has these properties:
- **(i)–(iii)** It respects discrete series, temperedness and Langlands quotients.
- **(iv)–(v)** It is characterised by two commutative diagrams:
  - through the theta correspondence with PD^× and the LLC for that inner form of PGL_3;
  - through the theta correspondence with PGSp_6, restriction to Sp_6 and Arthur's LLC for Sp_6.
- **(vi)** For generic discrete series it is compatible with a spin lifting from PGSp_6 to GL_8.
- **(vii)** For p ≠ 3, the fibre over φ is in natural bijection with Irr(S_φ). For p = 3 the same holds, except perhaps over the discrete parameters from PGL_3.
- **(viii)** It is compatible with the G_2-valued Galois representations of globally generic cusp forms.
- **(ix)–(x)** It preserves γ-factors of pairs, and is characterised by them.

**The method.**

1. **Transport along theta.** The dichotomy of the authors' earlier paper splits Irr(G_2) into the representations that lift to PD^× and those that lift to PGSp_6. The known correspondences are transported along these lifts.
   - A global argument shows that the Sp_6-parameter of θ(π) factors through G_2(C): globalise to the compact form of G_2, lift to PGSp_6, transfer to GL_7 with Arthur, and apply Chenevier's classification of subgroups of Spin(7) and SO(7).
2. **Packets over parameters from PGL_3.** The packet over φ = ι′ ∘ ρ comes from the three correspondences with Aut(D^+), for D running over the central simple algebras of degree 3 (Proposition 3.2).
3. **The remaining discrete parameters (Φ^♦_ds).** This is the new part.
   - Similitude theta lifting to PGSO_8, followed by triality, gives a spin lifting spin_* : Irr_gen(PGSp_6) → Irr(GL_8) (§4).
   - Kret–Shin's Spin_7-valued Galois representations give *Kret–Shin parameters* in Φ(PGSp_6) (§5). They are not unique in general, because Spin_7 is not acceptable (Chenevier–Gan). They are unique for theta lifts from G_2 (Proposition 5.2).
   - These give surjectivity (Proposition 6.1) and a unique generic member of each packet (Proposition 8.1).
   - Bin Xu's packets for PGSp_6 then identify the fibre over φ with one distinguished Xu packet (Proposition 8.2 and Lemma 8.3, 'one in, all in'), and hence with Irr(S_φ).
4. **Consequences.** §9 proves the Gross–Savin conjectures on these theta correspondences, and defines L-parameters for the distinguished Xu packets of PGSp_6.

**The appendices.**
- **Appendix A: globalisation.**
  - With prescribed components and a nonzero G_D-period on the definite G_2 (Proposition 10.5), via Poincaré series.
  - For generic representations (Proposition 10.7).
  - Isolation for G_2 (Lemma 10.8).
- **Appendix B: the Fell topology on the unitary dual of a split p-adic group.** Miličić's theorem, limits of generic representations, the isolation of the Steinberg representation in rank ≥ 2, and weak containment.
- **Appendix C: a weak LLC for PGSp_6**, as an outline. Parameters are taken up to 'weak equivalence', that is, up to equality of the standard and spin parameters. Its fibres are unions of Xu packets.

## What the atlas already has

- **In the libraries (1 item).** The Banach–Alaoglu theorem (Mathlib `WeakDual.isCompact_closedBall`). Mathlib also has the Krein–Milman theorem, but not the converse of Milman that the proof actually uses.
- **Planned (4 items):**
  - Arthur's classification for Sp_6 and SO_8 (ML.4);
  - the LLC for GL_n and Jacquet–Langlands for PD^× (ET.6);
  - Galois representations of regular algebraic self-dual cusp forms, with Taylor–Yoshida and Caraiani compatibility (AG2.2, AG2.5);
  - Rankin–Selberg γ-factors (AL.3).
- **Planned as inputs to items, in Tau Ceti:**
  - triality and spin representations over C (SpinRepresentations, Layers 5 and 8);
  - the local Brauer group (ClassFieldTheory, Layer 5);
  - the GL_n branching rule (ClassicalGroups, Layer 6).
- **Pending:** the exceptional theta correspondences are in ExceptionalThetaCorrespondencesForG2, proposed by PAPER-GAN-SAVIN-23. That candidate already records the L-parameters and desiderata for G_2 and the subgroups of G_2(C). Its brief asks to be designed so that this paper can extend it.
- **Not planned anywhere:**
  - a local Langlands correspondence for an exceptional group;
  - the spin lifting;
  - GSpin-valued Galois representations;
  - Xu's packets;
  - Langlands–Shahidi factors;
  - strong multiplicity one for GL_n;
  - the topology of the unitary dual.

## Routes

1. **New roadmap: `LocalLanglandsCorrespondenceForG2` (75 items).** Title "The local Langlands correspondence for G_2: theta lifting, spin lifting by triality and Kret–Shin parameters", area `langlands`.
   - **What it carries:** the Main Theorem and its proof, Lemma 2.4 and the group theory of G_2(C) ⊂ Spin_7(C), the spin lifting and Kret–Shin parameters, the fibres over Φ^♦_ds, §9, the globalisation results of §§10.2–10.3, and Appendix C.
   - **Why it is new:** ExceptionalThetaCorrespondencesForG2 is still a candidate, so it cannot have a Part II. This roadmap takes the candidate as its first prerequisite and starts where it stops. If the candidate is designed first, the reviewer may retitle this route as that roadmap's Part II.
   - **Why not merge into the candidate:** that would load a theta roadmap with Galois representations, Xu's packets, triality and globalisation.
   - **Source-gated inputs:** Kret–Shin's Theorem A, Chenevier's Theorems E and 6.4, [GS24] and Shin's Plancherel density theorem, until an owner exists.
   - **Proof obligations:** the self-dual case of Proposition 3.2 (E1), the scope of Theorem 9.1(ii) (E2), and the omitted steps of Appendix C.
2. **Coalesced with `ExceptionalThetaCorrespondencesForG2` (25 items).** The route keeps PAPER-GAN-SAVIN-23's id, title and area.
   - It carries the theta statements this paper restates or uses:
     - Theorem 2.1, Proposition 2.3, the explicit lifts and the preservation of genericity;
     - general L-parameters with component groups;
     - the pairs Aut(D^+) × G_2 for every D of degree 3;
     - Savin–Weissman, and Gan's depth-zero examples.
   - It also carries the local lemmas of §10.1: G_D, the Siegel orbits, the twisted Jacquet module, and Lemmas 10.1–10.4.
   - It adds a global layer: the dual pair in E_{7,3}, the nonvanishing and cuspidality results of [GrS2, Ch. 5], the generic global lifts of [HKT], and archimedean matching.
3. **New Part II: `SmoothRepresentationsPartIIUnitaryDual` (14 items).** Title "Smooth representations of local groups, Part II: the unitary dual, the Fell topology and isolated representations", area `representations`.
   - It carries Appendix B, which holds for any split simple p-adic group, together with its inputs: Miličić, Tadić, Heiermann–Opdam, Barbasch–Moy, Rodier, Howe–Moore, Raikov and Milman's converse.
   - No layer of SmoothRepresentationsOfLocalGroups treats unitary representations. The pending SmoothRepresentationsPartII goes in another direction (types and supercuspidals).
4. **Source of ML.4 (6 items).** Bin Xu's packets for PGSp_6 and his global multiplicity formula. These are classification inputs for a classical similitude group, of the kind ML.4 owns. PAPER-GAN-SAVIN-23 sent Gan–Takeda's GSp_4 correspondence there too.
5. **Source of MP.3 (2 items).** The similitude theta lift from PGSp_6 to PGSO_8, and the theta dichotomy of PGSp_6 between PGO_8 and PGO_{5,1}, via Sun–Zhu's conservation relation.
6. **Coalesced with `MetaplecticAutomorphicFormsPartIIShimuraWaldspurger` (1 item).** Proposed by PAPER-GAN-ICHINO-18. The item is the Gan–Qiu–Takeda nonvanishing criterion and the tower property, for Sp_6 × O_8 and its similitude version. That candidate already plans the Rallis inner product formula.

## Source issues (`sourceIssues` E1–E15)

**Gap (E1): Proposition 3.2 constructs no bijection when S_φ ≅ S_3.**
- **The claim.** The proof assumes every [φ] ∈ Φ^♠♣_ds(G_2) has a centraliser of order 3 in G_2(C). Everything after that rests on it:
  - C_[φ] = Z_{G_2}(S_[φ]) is taken to be simply connected of type A_2;
  - Irr(S_[φ]) is identified with Z/3Z.
- **Why it fails.** Lemma 2.4(i) itself says the centraliser is S_3 when the PGL_3-parameter is self-dual.
  - Such φ exist for every p. The subregular unipotent parameter is one, and Proposition 3.2 names it.
  - For them Z_{G_2}(S_3) ≅ SO_3(C), and Irr(S_3) has three elements.
- **What survives.** The fibre still has three members, and Theorem 9.1(i) predicts the matching. So the statement is plausible, but its natural bijection is not constructed for these φ. The same passage is in arXiv v2.

**Gap (E2): Theorem 9.1(ii) is stated for every π ∈ Irr(G_2).** The paper proves less:
- θ(π) = 0 on Irr^♠(G_2).
- The paper attaches enhanced parameters to representations of PGSp_6 only for the distinguished Xu packets over Φ^♦_ds(G_2).

So what is proved is the case L(π) ∈ Φ^♦_ds(G_2).

**Misprints (E3–E15).**
- **Wrong or missing symbols:**
  - E3: an unbalanced parenthesis in (ix);
  - E6: "octonion algebra over F" for "over k" in §3.3;
  - E7: "representations of G_2(F)" for PGSp_6(F) in the proof of Proposition 4.1;
  - E8: "lifts of φ" for "lifts of φ^♭", and the undefined Π̃^X_{φ,ν}, in §7;
  - E9: Φ̃_{φ♭} for Π̃_{φ♭} in §9;
  - E10: the missing D in "parameterized by D" in §10.1.
- **Wrong cross-references or names:**
  - E4: "§9" for "§10", and "Greiss" for Griess, in §1.2;
  - E5: "Theorem 2.1(i)" for (ii), twice.
- **An imprecision:** E11: "N-rank 2 … O(2)" for "N-rank at most 2 … O(m), m ≤ 2" in the proof of Lemma 10.1.
- **Appendix C:**
  - E12: π for σ, and G for PGSp_6, in §12.3 and in the proof of Theorem 12.6;
  - E13: L_{Sp_66};
  - E14: π and Σ′′♭ in the proof of Lemma 12.4;
  - E15: L for L_w, and Π for Σ, in the proof of Theorem 12.7.

None of these is known to affect the Main Theorem outside the S_3 packets of E1.

## Prerequisites not yet covered

Thirty-one entries. Their DOIs were confirmed on Crossref, the arXiv ids on arXiv and Li's paper on Numdam; Miličić's 1973 paper has no DOI.

- **The inputs to the LLC:**
  - Kret–Shin;
  - Xu's three papers;
  - Chenevier (Doc. Math. 2019); Chenevier–Gan;
  - Harris–Khare–Thorne; Savin–Weissman;
  - Gan–Savin 2020 and [GS24];
  - Gross–Savin 1997 and 1998;
  - Huang–Pandžić–Savin; Gan 1999; Hanzer–Savin;
  - Cogdell–Kim–Piatetski-Shapiro–Shahidi; Adams–Barbasch; Griess.
- **Globalisation:** Sakellaridis–Venkatesh, Ichino–Lapid–Mao, Gan–Qiu–Takeda, Sun–Zhu and Shin.
- **The unitary dual:**
  - Miličić (no DOI);
  - Tadić;
  - Barbasch–Moy; Heiermann–Opdam;
  - Chan–Savin; Li;
  - Bekka–de la Harpe–Valette; Vogan.

Each entry says what the paper takes from it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-SAVIN-23-B.result.json` reports no errors.
- The two library declarations were read in the pinned Mathlib (082e2d3):
  - `WeakDual.isCompact_closedBall` and `WeakDual.isCompact_polar` in `Mathlib/Analysis/Normed/Module/WeakDual.lean`;
  - `closure_convexHull_extremePoints` in `Mathlib/Analysis/Convex/KreinMilman.lean`, the Krein–Milman theorem without Milman's converse.

## Review (REV-PAPER-GAN-SAVIN-23-B, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1379](https://github.com/CBirkbeck/tauceti-explorer/issues/1379). **Verdict: accept.**
No item, status, route or locator changed.

- **All 15 mistakes confirmed**, four decisively by the paper's own text: E3 (Main Theorem (ix)'s
  brackets do not balance); E6 (an octonion algebra taken "over F" where the next sentence needs
  a global object over `k`); E13 (p. 36 prints `L_{Sp_6}` correctly eighteen lines before
  printing `L_{Sp_6 6}`); E5 (Theorem 2.1's decomposition is part (ii), cited as (i) twice).
- **The two gaps confirmed with scope stated.** E2 is settled by the paper's own theta dichotomy:
  Theorem 9.1(ii) is stated for every `π`, but Theorem 2.1(ii) says `π` lifts to exactly one of
  `PD^×` or `PGSp_6`, so "its local theta lift `θ(π) ∈ Irr(PGSp_6)`" has no referent for half of
  them. A restriction is needed; its exact form rests on the extraction.
- **E10** could not be settled from the text layer (the symbol after "parameterized by" is
  dropped); it is confirmed on the sentence's own logic, and the verdict says so.
- **Provenance:** the published PDF's `sha256` is **not reproducible** — Cambridge stamps each
  download, and two downloads gave two hashes, neither the recorded one. A reproducible
  stamp-stripped text hash (`f35be3dd…66f5`) was recorded in its place.
- **Items and routes:** the single library citation (Banach–Alaoglu) is correct; 4 planned items
  resolving; 123 missing routed exactly once; both new roadmap names free and both Part II titles
  exact prefix extensions. `ExceptionalThetaCorrespondencesForG2` is co-proposed by the companion
  paper PAPER-GAN-SAVIN-23, which is the right structure — the dichotomy is an input here and a
  theorem there.

Full report: `research/blueprint/reviews/REV-PAPER-GAN-SAVIN-23-B.md`.
