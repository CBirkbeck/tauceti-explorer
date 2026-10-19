# Handoff: DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII (#3381)

Worker: Claude (claude-iPRLEs), 2026-10-19.

## What was decided

The brief carried nine continuations of GlobalShtukasAndFunctionFieldLanglands in six independent directions. This
roadmap plans the first, **Ramanujan and Arthur weight constraints** (Ciubotaru–Harris, Annals 204 (2026);
route GlobalShtukasPartIIRamanujanArthur of PAPER-CIUBOTARU-HARRIS-26, plus item 47 of
PAPER-GAN-HARRIS-SAWIN-ETAL-24). The other five directions are proposed as their own Part IIs in the packet's
restructure entry R1:

| Direction | Route id | Papers (items) |
| --- | --- | --- |
| Counting unramified ℓ-adic local systems | GlobalShtukasAndFunctionFieldLanglandsCountingPartII | Yu 2023 (77) |
| Crystalline companions | GlobalShtukasPartIICrystallineCompanions | Abe 2018 (17), D'Addezio 2023 (2) |
| Special cycles, higher Siegel–Weil | ShtukaSpecialCyclesAndHigherSiegelWeil | Yun–Zhang 2017 (33), 2019 (129), Feng–Yun–Zhang 2024 (25) |
| Tate cohomology of shtukas, cyclic base change | ShtukaTateCohomologyAndGlobalBaseChange | Feng 2024 (33); must import SheafTheoreticSmithTheory ST.3 |
| Ĝ-valued deformations, potential automorphy | GValuedDeformationsAndPotentialAutomorphy | Böckle–Harris–Khare–Thorne 2019 (28) |

Restructure entry R2 records that Gan–Harris–Sawin Theorem 1.2 with its inputs (Lemmas 3.5–3.6, Corollary 3.8,
Propositions 3.9 and 3.11, Corollary 3.12, Beuzart-Plessis's Lemma A.1) is planned here (RA.0, RA.1, RA.4); the held
GlobalShtukasPartIISupercuspidalParameters route must import it when redesigned.

The local half of Ciubotaru–Harris (§§2.1–2.2, 6–8, Lemma 5.2, Proposition 4.5, Lemma 10.9 and the tables) is
already planned in LieHighestWeightPartII (N0–N5) and SmoothRepresentationsOfLocalGroupsPartII (SRU.5–SRU.7), both
accepted, and is imported. The FunctionFieldArithmetic route of the extraction (Proposition 3.1, Lemma 3.2) is
FA.6/integral-coefficient-model.

## What is closed and what remains

- `research/blueprint/roadmaps/GlobalShtukasAndFunctionFieldLanglandsPartII.json`: 9 layers RA.0–RA.8, area
  functionfields, parent GlobalShtukasAndFunctionFieldLanglands.
- `research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglandsPartII.json`: 49 nodes (12 definitions,
  5 constructions, 32 theorems), 85 API items, 72 unit tests, 25 planets, 7 gaps, 5 requests, one new source issue
  (E1). Status `complete`; every stage `planned` with a `remaining` list. `check_blueprint.py` with the declaration
  index: 0 errors, 0 warnings.
- `routedItems` maps all 30 Ciubotaru–Harris items of the two routes (27 + the 3 FunctionFieldArithmetic items) and
  Gan–Harris–Sawin item 47 to nodes; no routed item is unmapped.
- Remaining work is listed per stage in `coverage` and in the gaps:
  - G1: the Deligne–Kazhdan simple trace formula and Gan–Lomelí globalization have no owner; requested from a Part II
    of FunctionFieldArithmetic at FA.6.
  - G2: number-field models of arbitrary discrete series (Ciubotaru–Harris Theorem 4.2, first claim). The cited
    argument only gives the same cuspidal support (new source issue E1).
  - G3: E10, Theorem 4.3 without geometricity.
  - G4: E11/E18, Satake parameters with non-central compact part. Theorem 5.4 is planned with central compact part
    at v, and Theorem 1.11(b)–(c) and Theorem 10.3 with the same condition.
  - G5: integrality of weights for stacks (Sketch 5.10).
  - G6: Beuzart-Plessis's elliptic orthogonality manuscript.
  - G7: the Annals version is not collated.

## Points for the reviewer

- **Published GHS has no restriction on p.** The extraction's "GHSv3 Theorem 1.2 assumes p > 3" refers to arXiv v3.
  The published Forum Math. Pi version proves Theorem 1.2 with no restriction on p (Xu–Zhu, Corollary 4.5.8 and
  Remark 4.5.10, remove the HNY prime restrictions). It is cited with the published numbering: Proposition 3.11,
  Corollary 3.12, Remark 3.13; Remark 3.10 is new.
- **ι-tempered anchor.** RA.5/generic-ramanujan proves the tempered-anchor case for a fixed embedding ι without
  E10: the ι-weights of the anchor are integers through the GHS purity of the Levi's discrete series. Temperedness
  for every embedding needs a discrete-series anchor, or geometricity.
- **Root-enumeration check.** The weight certificates of Theorem 10.3, as corrected by E3 and E5, were recomputed
  here (scratch script). They cover F₄ B₃ and Ã₁+A₁, E₇ D₅(a₁)+A₁, the four E₈ cases, and Sp(6) (2,2,2). The
  suggested file checks the Sp(6) and F₄ B₃ certificates by `decide`.
- **Corrected examples.** Several worked examples were checked and corrected by hand: the PGL₂ hermitian
  spherical dual, Klein-four endoscopy for SL₂, and the Salem polynomial x⁴ − x³ − x² − x + 1.

- **Sonnet cross-check.** Two Sonnet agents cross-checked all 71 source citations against the extracted texts.
  This led to the following fixes:
  - corrected page ranges;
  - the exact hypotheses of Li-Huerta's uniformization (N disjoint from v, large deg N, Harder–Narasimhan
    truncation, étale on generic fibres);
  - noting that Gan–Lomelí Proposition 8.2 is conditional on their Working Hypothesis II;
  - a wrong formula for the semisimple parameter in RA.0 (the SL₂ factor was counted twice);
  - an ambiguous "E1".

  The remaining flags are content that the nodes derive or take from another cited source (for example Lafforgue
  Corollaire VII.8 for arbitrary lisse sheaves, where Ciubotaru–Harris state it only for L(π, τ)).

## Requests made

| Request at | For |
| --- | --- |
| FA.6 | Part II: simple trace formula, Poincaré series, nonsplit cusp finiteness |
| SRU.3 | Pseudo-coefficients and Gan–Lomelí Lemma 8.1 in positive characteristic; BP elliptic orthogonality |
| HS2 | Equal-characteristic local shtuka moduli of Li-Huerta §§2–4 |
| DWP.8 | Part II: Sun's mixedness for stacks |
| RD.6 | Faithful representations are tensor generators |

## Suggested file

`research/blueprint/suggested/GlobalShtukasAndFunctionFieldLanglandsPartII.lean` (about 200 lines) elaborates with
`lean-check` at the pins. Its only warning is the placeholder proof of Property A. It contains:

- weight arrays with Property A;
- the Remark 10.8 example;
- weight counts with the Sp(6) and F₄ certificates;
- test representations by Cartan type.

## Sources read

Ciubotaru–Harris arXiv v1 was read in full. The other sources were read at the sections listed in the packet:
Gan–Harris–Sawin (published and arXiv v3), Li-Huerta v2, Sawin–Templier v4 §11, Xue (Épijournal) §§1, 3.6, 4.2,
Lafforgue–Zhu §§1–4, Sun Theorem 2.11, Gan–Lomelí Theorem 1.1 and §8, HNY Theorem 2, and L. Lafforgue
Chapter VII §2a. All are free. Not obtained:

- the Annals text of Ciubotaru–Harris;
- Beuzart-Plessis's elliptic orthogonality manuscript;
- Deligne–Kazhdan–Vignéras (Travaux en Cours, 1984), cited only through GHS Appendix A.
