# Scholze, *Étale cohomology of diamonds*: extraction and routing

Job PAPER-SCHOLZE-17. Claude Code, session `cc-48533a`, 29 September 2026. The machine-readable extraction is `PAPER-SCHOLZE-17.result.json`:

- 619 items: 581 planned, 19 library, 19 missing (after the independent review; the extraction had 617 items: 575 planned, 19 library, 23 missing);
- 6 routes (5 in the extraction);
- 5 prerequisite papers;
- 101 source issues (73 in the extraction, 28 added by the review).

**Version read.** arXiv:1709.07343v4 (14 April 2026), the "final version to appear in Astérisque": 168 pages, SHA-256 `78ca42bb…33efc`. The earlier arXiv versions (v1 2017, v2 2021, v3 2022) were not compared, and the Astérisque version has not appeared. Locators are v4 statement numbers and pages.

**How it was read.** The maintainer asked for this long text to be taken in checkpoints by chapter. It was instead read in full in one pass, by six readers in parallel, each taking a block of sections (§§1–6, 7–10, 11–12, 13–17, 18–21, 22–27). They drafted the items with exact statements, locators and a status against the atlas. The drafts were then merged:

- items that appeared in more than one part were removed (six, most of them outside results);
- one status that two parts disagreed on was settled;
- every library citation (32 declarations) was checked against the index at the pins;
- every quoted passage in the source issues was matched against the text;
- every source issue claiming an error in a stated result, and each principal gap, was checked again against the paper.

The extraction is complete, so no handoff is needed.

## What the paper proves

The paper builds a six-functor formalism for the étale cohomology of diamonds and small v-stacks, with coefficients torsion prime to p. The steps are:

- **§§2–6.** Spectral spaces and perfectoid spaces of characteristic p.
- **§§7–9.** Totally disconnected and w-local spaces; the pro-étale and v-topologies. The v-topology is subcanonical and O⁺ is almost acyclic on affinoid perfectoids (Theorem 8.7). Descent.
- **§§10–13.** v-stacks, diamonds, small v-stacks, spatial and locally spatial diamonds and their underlying spectral spaces, spatial morphisms.
- **§§14–15.** The comparison of étale, quasi-pro-étale and v-cohomology, and the category D_ét. The functor X ↦ X^♢ from analytic adic spaces over ℤ_p, with X^♢_ét = X_ét.
- **§§16–17.** Base change, and the four functors ⊗, RHom, f^*, Rf_*.
- **§§18–19.** Proper and partially proper morphisms, proper base change, and invariance under change of algebraically closed base field.
- **§§20–21.** Constructible sheaves and dimension theory.
- **§§22–23.** Rf_! and Rf^!, with the projection formula and base change.
- **§§23–24.** ℓ-cohomological smoothness, Poincaré duality for smooth maps of adic spaces, and quotients by profinite groups.
- **§25.** Biduality and finiteness over Spa(C, O_C).
- **§26.** Adic coefficients.
- **§27.** The comparison with étale cohomology of schemes.

## What the atlas already has

The atlas's diamond roadmaps were built from this text, and 581 of the 619 items are planned (575 of 617 in the extraction):

- **§§2–6:** PerfectoidSpaces P0–P6 and DiamondsAndVStacks D0.
- **§§7–13:** DiamondsAndVStacks D1–D5.
- **§§14–21:** DiamondEtaleCohomology C0–C9, with D6 and AdicEtaleGeometry for §15.
- **§§22–25:** DiamondSixOperations S0–S6. That roadmap has no packet yet, so these items cite its layer texts rather than nodes.
- **§§26–27:** AdicCoefficientsAndComparisons L0–L6.

ClassicalAdicEtaleCohomology and EnhancedDerivedSheaves supply the classical and ∞-categorical inputs.

Nineteen items are in the libraries, all read at the pins. Mathlib has:

- spectral spaces, spectral maps and the constructible topology;
- quotient maps onto compact Hausdorff spaces, and the Stone–Čech presentation;
- Krull dimension and Krasner's lemma;
- faithfully flat descent and descent data;
- Fontaine's θ;
- cardinal-filtered categories.

Tau Ceti has Huber's Tate rings, power-bounded elements, rings of integral elements and the open mapping theorem.

## Routes

The 19 missing items (23 in the extraction; the review found five of them planned and added one) all go as sources to existing layers; no Part II or new roadmap is needed. They are:

- remarks, and statements made in running text;
- outside inputs the owning layers use in proof steps but do not state.

The five routes:

1. **DiamondsAndVStacks D0 and D5** (5 missing items and 1 planned; the review replaced D3 and D4 by D5).
   - In D0, the foundations the whole paper rests on:
     - π₀ of a spectral space is profinite;
     - the reduction of cofiltered limits to ordinal-indexed ones;
     - the flasque constant sheaf on a spectral space with a generic point (Stacks 02UW);
     - SGA 4 VI 8.7.7 on limits of coherent topoi (SGA 4 VI 5.2 is already planned by a D0 node).
   - In D5, the localization Y_y of a spatial diamond at a point (added by the review).
   - The three algebraic inputs to Lemma 9.5 moved to routes 5 and 6.
2. **DiamondEtaleCohomology C2, C3, C4 and C7** (4 items):
   - the D⁺ formula for R_Yét;
   - the comparison of Rf_* with the left-completed étale pushforward;
   - Remark 18.2(b);
   - Proposition 20.14, which C7's plan for 20.15–20.16 uses but no node states.
3. **DiamondSixOperations S4, S5 and S6** (4 items). The remarks that bound the six-operation statements:
   - descent of representability along universally open covers (S4; the formal-smoothness criterion is planned by VStackSheavesAndLisseCategories VS1);
   - Rq^! ≠ q^* (S5);
   - the failure, and the conditional extension, of conservativity (S6).
4. **EnhancedDerivedSheaves E3 and E5:presentability** (3 missing items and 1 planned). Lurie's HTT 5.5.3.12 and 5.5.3.13, and Neeman's compact-objects criterion; HTT 5.5.2.2 is already stated by a node.
5. **SchemeAndStackFoundations SF.2** (2 missing items and 1 planned). Invariance of scheme étale cohomology under extension of algebraically closed field, and Grothendieck's refinement of fppf covers of strictly henselian rings (moved from route 1). Proper base change for schemes is planned by SF.2, whose text asks for scheme proper and smooth base change.
6. **AdicSpacesPartII R2** (1 missing item and 1 planned; added by the review). Raynaud–Gruson finite presentation over valuation rings of any height, and the lifting of special-fibre points (planned by R2/specialisation-map).

## Source issues

There are 73 source issues: 44 misprints, 18 gaps and 11 errors. 25 affect a proof and 7 a stated result; none affects a main theorem of the introduction. Twenty were already recorded in the atlas (in PerfectoidSpaces, AdicEtaleGeometry, DiamondEtaleCohomology and ClassicalAdicEtaleCohomology), and each is cross-referenced; the rest are new. (The review added 28 more, E74–E101, of which five repeat further atlas findings; see the end of this report.)

**Stated results that need a correction:**

- **E14, Lemma 7.2(iii).** "Γ is exact, i.e. commutes with all finite colimits" is false for a disconnected X. On the two-point discrete space, which satisfies (i) and (ii), Γ does not preserve coproducts. The proof establishes, and the later steps use, only commutation with coequalizers.
- **E57, Proposition 20.14.** It is stated over 𝔽_ℓ but used for general Λ in Propositions 20.15–20.16.
- **E66, Proposition 23.16(iii).** It omits the hypotheses on f that make Rf^! defined.
- **E68, Proposition 23.17.** It omits "Λ ℓ-power torsion", which Theorem 1.10(ii) has.
- **E73, Proposition 27.7.** It needs Λ killed by an integer prime to p, the hypothesis of Proposition 27.6, which its proof uses.
- **Already recorded:** E5 (Proposition 4.4 for singular κ, PerfectoidSpaces/E40) and E49 (Lemma 15.3 for non-complete Tate rings, AdicEtaleGeometry/E19).

**Main gaps and errors in proofs:**

- **E1 and E2, Lemmas 2.9 and 2.10.** The generic-point argument intersects all opens U with U ∩ Z ≠ ∅ but never intersects with the preimage of Z, so the point it finds need not lie in Z. On Spec of a DVR with Z the closed point, the only such U is the whole space. The repair intersects with the pro-constructible preimage of Z and uses that Z is irreducible. The node DiamondsAndVStacks:D0/spectral-quotient-criterion copies the step.
- **E4, Proposition 3.5.** "R° ⊂ ⋃_k Φ^{−k}(R₀)" is false: take 𝔽_{p²}((t^{1/p^∞})), R₀ = 𝔽_p + tK°, and λ ∈ 𝔽_{p²} ∖ 𝔽_p. Only ϖR° is covered, which still gives boundedness.
- **E31, Example 11.12.** "For affinoid Z every continuous map |Z| → T to a compact Hausdorff space factors through π₀(Z)" fails for the perfectoid closed disc, whose map to its Berkovich space is not constant. Reducing to strictly totally disconnected Z repairs it. The node D4/compact-hausdorff-diamonds repeats the claim.
- **E33 and E34, Proposition 11.26, Lemma 11.31 and Proposition 12.20.** "The maximal point is open" fails when C⁺ has rank greater than one.
- **E46, Proposition 14.7.** The Čech argument needs H^q = 0 for 0 < q < i on the fibre powers of X′ over X, which are not strictly totally disconnected. As written it proves only i = 1.
- **E60, Theorem 19.5(ii).** Theorem 19.2 is applied to the annulus Y′_n → Spa(C′, C′⁺). That map is not proper when C′⁺ ≠ O_{C′}: the valuative criterion fails, since tⁿ/ϖ maps to a unit outside C′⁺.
- **Other gaps and errors:** in Lemmas 5.4, 7.6, 7.13, 10.13, 16.3 and 23.6, Propositions 6.5, 8.2, 8.3, 9.3, 20.16, 27.5 and 27.6, and Theorem 25.1, each with its correction in the JSON.

Where an atlas node copies a faulty step, the issue says so: DiamondsAndVStacks D0, D1, D3, D4 and D5, and PerfectoidSpaces. The misprints are wrong labels, swapped letters, missing primes and wrong cross-references; all are listed with their corrections.

## Prerequisite papers not yet covered by the atlas

1. Grothendieck, *Le groupe de Brauer III* (1968).
2. Neeman, *The Grothendieck duality theorem via Bousfield's techniques and Brown representability* (JAMS 1996), doi:10.1090/S0894-0347-96-00174-9.
3. Scheiderer, *Quasi-augmented simplicial spaces* (JPAA 1992), doi:10.1016/0022-4049(92)90062-K.
4. Temkin, *Topological transcendence degree* (J. Algebra 2021), doi:10.1016/j.jalgebra.2020.10.002.
5. Grothendieck–Verdier, *Conditions de finitude. Topos et sites fibrés* (SGA 4, Exposé VI), Lecture Notes in Math. 270 (1972), doi:10.1007/BFb0061319. (Added by the review, which removed Huber, Math. Ann. 1993: the atlas already has it as a source of the ClassicalAdicEtaleCohomology H0 packet.)

The DOIs were confirmed on Crossref. None of these papers was read for this job.

## Corrections by the independent review

REV-PAPER-SCHOLZE-17 (Claude Code, session `cc-f805bf`, 29 September 2026) made these changes. The reasons are in `research/blueprint/reviews/REV-PAPER-SCHOLZE-17.md`.

- **Source issues.**
  - A `review` verdict on each of E1–E73; all are confirmed.
  - Field corrections: E5 (reason), E12 (correction), E27 and E63 (printed), E32 (reason: the sentence is new in v4), E43 (correction), E46 and E50 (reason). The atlas ids cited in `known` for E4, E6, E7, E9, E10, E22, E24 and E27 now name their packet, because PerfectoidSpaces--P0 and --P8 reuse the ids E1–E34.
- **New issues E74–E101 (28).**
  - Five affect a stated result:
    - E74: Theorem 1.8(iii) has A and B on the wrong spaces;
    - E83: "X → ∗ quasicompact implies X quasicompact" is false in a general algebraic topos (the warning before Proposition 8.3);
    - E94: the unbounded case of Theorem 19.2 omits "f quasi-pro-étale or nΛ = 0";
    - E99: Proposition 22.15 needs Ỹ quasiseparated;
    - E100: Propositions 24.2–24.3 never state that Λ is ℓ-power torsion.
    - (E57, already recorded, is kept as a misprint in a stated result.)
  - Six gaps in proofs: E78 (Proposition 3.5, fractional exponents), E81 (Proposition 6.4(iv)), E84 and E85 (Lemmas 9.4 and 9.5), E88 (Proposition 13.13: open and closed neighbourhoods of a point of |Y|^B are not cofinal), E95 (proof of Theorem 19.2 cites Proposition 17.6 in the quasi-pro-étale case).
  - Two errors that affect nothing: E91 (Remark 16.2) and E101 (Remark 25.6's example fails for discretely valued K).
  - Fifteen misprints that affect nothing.
- **Items.**
  - New items 618 (the localization Y_y, missing, routed to D5) and 619 (the Pro(Y_ét,qc,sep) basis from the proof of Proposition 14.8, planned at C0).
  - Statements corrected (16): 28, 113, 145, 182, 329, 391, 530, 568, 579 and 318–324; locators 197, 304, 401, 543, 552–554; names 454 and 318–324. The Berkovich space is now written |X|^B, as in the paper.
  - Notes corrected or extended in 96 items, among them 15, 74, 144, 193, 199, 247, 306, 316, 324, 352, 357, 364, 384, 401, 478, 496, 502, 517, 612, 613, the 52 notes that said DiamondEtaleCohomology has nodes only for C8 (C8–C9), and cross-references to the new issues.
- **Statuses.**
  - Five missing items are planned: 210 (AdicSpacesPartII:R2), 406 (EnhancedDerivedSheaves:E5:presentability), 441 (SchemeAndStackFoundations:SF.2), 598 (DiamondsAndVStacks:D0) and 604 (VStackSheavesAndLisseCategories:VS1).
  - Planned lists shortened for 193, 334, 366 and 505 (a layer that consumes the item was listed as planning it); library lists extended for 26, 154 and 471.
- **Routes.**
  - Route 1 now names D0 and D5, loses 208–210 and gains 618.
  - Route 3 loses 604; routes 3 and 4 have corrected reasons.
  - Route 5 gains 208 and keeps 441 as a planned item.
  - New route 6: AdicSpacesPartII R2 for 209 (and 210, planned).
- **Prerequisites.** Huber 1993 removed (already an atlas source); SGA 4 Exposé VI added.
- **Summary.** Updated with the new counts and findings.
