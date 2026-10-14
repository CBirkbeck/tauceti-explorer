# BP-PadicDifferentialEquationsAndRigidCohomology--RD.7 — handoff

Job #9749, agent Claude (Opus 5.5), session `claude-n6fYvL`, 14 October 2026. The bot confirmed
[the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9749#issuecomment-6171287134).
The work starts from atlas commit `2aa75cda9`.

## Deliverables and status

This is a **complete** follow-up pass over stage RD.7, ready for its independent review.

- [Packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.7.json) has status `complete`,
  part `RD.7` and scope `PadicDifferentialEquationsAndRigidCohomology:RD.7`.
  - 13 new nodes: 2 constructions, 7 theorems, 2 lemmas and 2 applications.
  - 17 API items, 8 unit tests on the two constructions, and acceptance checks on every node.
  - 3 planets, 6 baseline declarations, 3 requests, 3 gaps, 3 restructuring proposals and
    4 source issues (E701–E704).
  - RD.7 coverage is `planned`, with a precise `remaining` list.
- [Reader document](../readmes/PadicDifferentialEquationsAndRigidCohomology--RD.7.md), about 13,500 words.
  It opens with the scope, conventions, owners and the dependency chains. Five sections follow,
  each giving every node's statement, hypotheses, API, uses, unit tests, proof, acceptance,
  prerequisites and sources. It then lists the requests, gaps, structure proposals, source
  mistakes, remaining work and sources.
- [Suggested Lean](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.7.lean), 239 lines.
  It states the rationality descent, the local and global Fatou lemmas and the weight-separation
  theorem, the light definition `ellipticWeilFactor` built on Tau Ceti's
  `WeierstrassCurve.frobeniusTrace`, and the four precision exponents with their examples. All
  other API and test names are listed in its "Unstated interfaces" comment, because their
  carriers are not at the pins.

The parent packet's 11 RD.7 nodes are cited by id and are not edited or restated. The assembly
joins the two.

## What is now closed

The parent's RD.7 `remaining` list, item by item:

1. **Berthelot's comparison (parent gap 'proved only in outline').** The plan follows Berthelot,
   *Finitude et pureté*, Proposition 1.9 and its full proof, preprint pp. 14–15.
   - The proof runs through `RD.7/tube-to-envelope-comparison-map`, the map through the closed
     tube of radius |p|^{1/p}, then `RD.7/comparison-map-quasi-isomorphism`, which reduces to a
     smooth affine lift.
   - The crystalline side uses CR.2/smooth-ambient-comparison and its derived-limit p-adic
     version, which supplies the p-adic formal-embedding computation the parent recorded as a CR.2 supplier gap.
   - Ogus's comparison with coefficients and Frobenius is
     `RD.7/crystalline-rigid-comparison-with-coefficients`, planned from Shiho, *Relative log
     convergent cohomology I*, Theorem 2.36 (public). Ogus's own papers were not needed.
2. **Katz–Messing.** The paper is still inaccessible (Springer paywall, no GDZ or author copy).
   This is recorded as a gap that no step uses.
3. **Kedlaya's errata, Edixhoven's Lemma 4.3.5 and the integrality of the Frobenius matrix.** All
   three were read.
   - `RD.7/kedlaya-reduction-denominators` states Lemma 2 and the corrected Lemma 3,
     p^{⌊log_p((2g+1)(2m+3)−2)⌋}, together with the final division by d.
   - `RD.7/hyperelliptic-integral-frobenius-lattice` answers the integrality question from
     Edixhoven's Proposition 5.3.1. The matrix on x^i dx/y is not integral in general, its
     entries lie in p^{−⌊log_p(2g−1)⌋}Z_q, and an L-basis gives integral matrices.
   - New source issue E701: the errata's replacement formula, read in arXiv Lemma 3's indexing,
     is too small. The counterexample is Q = x^3 + x + 1, p = 5, where y dx reduces to
     (2/5)x + 3/5, computed exactly. The journal's own indexing was not available, so the
     finding is scoped to the arXiv numbering. E702 and E703 are misprints.
4. **Ordinary convergent coefficient model.** RD.3 owns the category, the convergent site and
   the equivalence with F-crystals up to isogeny. RD.7 now owns and plans the cohomological
   comparison. Restructure proposal 3 asks the RD.3 follow-up (#9745) and the assembly to drop
   "the rational Ogus–Shiho cohomology comparison used in RD.7" from RD.3's list. RD.7 cites
   `RD.3/restriction-to-convergent` for the coefficient model.
5. **Kloosterman (Fresán–Sabbah–Yu).**
   - Proposition 5.23 is planned as `RD.7/kloosterman-semistable-realization`, Corollary 5.27 and
     Remark 5.28 as `RD.7/kloosterman-newton-above-hodge`, and Mieda's map as
     `RD.7/mieda-p-adic-picard-lefschetz`.
   - The period rings and D_st/D_cris are requested from NeronModelsAndSemistableAbelianVarieties:R11.5
     (package §5.3, tier 8), and weak admissibility from FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3
     (tier 10).
   - C_dR and C_st are owned only by CohomologyComparisons:CP.4 and PadicHodgeTheory, which are
     higher tiers. They are recorded as a gap, not moved down, because moving them would
     duplicate the core of p-adic Hodge theory. Restructure proposal 2 moves the two applications
     up to CP.4 instead.
   - The Kloosterman F-isocrystal and its middle cohomology are cited at stage level
     (`PadicDifferentialEquationsAndRigidCohomology:RD.6`) until the RD.6 follow-up (#9748) gives
     them node ids.
6. **Weight separation (formerly the stray WC.3 request).** This is planned as
   `RD.7/rational-zeta-descent-and-fatou` (Hankel descent, local and global Fatou) and
   `RD.7/weight-separated-factor-extraction` (Deligne, Weil I, pp. 276–277). The parent's
   `RD.7/weil-factors-rational-and-integral` and ℓ-adic comparison steps that said "local
   weight-separated factor argument (a recorded gap)" can now cite these nodes.
7. **Pending TraceFormula provider.** PR 196 is still open at `4bd72379658126cbe9be935656396f0c9dac4de0`
   (checked 14 October 2026), and current TauCetiRoadmap main `0d144d0` has no CohomologicalPointCounting.
   The parent's SF.2 request stands. An upstream note records that Layer 13 does not state
   Fatou integrality.

Requests and routes from other work, answered:
- **PadicHodgeTheory:R06.5 request** (degree-one Katz–Messing with conventions tracked) is answered
  by `RD.7/abelian-variety-crystalline-frobenius-polynomial`. It uses
  AbelianSchemesAndArithmeticModuli:A6 and the Tate realisation requested from
  ArithmeticGaloisRepresentations:R01.6, the same supplier the DWP package uses as its input E11.
  PAPER-DADDEZIO-23/7 and the Calegari–Geraghty item land here too.
- **EffectiveDiophantineMethods:ED.6 request** (BDMTV item /95, Tuitman's certified algorithm) is
  answered by `RD.7/tuitman-frobenius-structure-algorithm` and `RD.7/tuitman-precision-certification`.
  These include Assumption 1 with the June 2020 erratum (E704, known), the Frobenius matrix,
  the primitives f, and the reduction of arbitrary forms. The specific g, h equations of BDMTV
  (22) are obtained by applying that reduction to their right-hand sides; the equations
  themselves belong to the Chabauty roadmap.
- **Guo–Reinecke route item 168** (rational crystalline cohomology equals convergent cohomology)
  is covered by the coefficient comparison.

## What remains (RD.7 `remaining`)

- Mieda's paper (Math. Z. 257, 2007; doi only, no arXiv copy found) is unread. Decompose the
  Mieda node once a copy is cleared (gap 1).
- The Kloosterman applications rest on C_dR/C_st (gap 2). Apply restructure proposal 2, or move
  the comparisons down, then re-point the prerequisites.
- Replace the RD.6 stage citations in the Kloosterman nodes by the RD.6 follow-up's node ids.
- When TraceFormula lands upstream, cite its Layers 12–13 in the parent's
  `RD.7/rigid-zeta-expression` and `RD.7/ell-adic-comparison-smooth-projective`.
- Compare with Katz–Messing's argument once the paper is accessible (gap 3).

## Notions moved down, and ownership notes for the maintainer

- WeilConjectures WC.1/local-fatou-normalization, WC.1/rationality-over-q-via-hankel-determinants
  and WC.3/degreewise-pure-factor-extraction now have RD.7 counterparts, as the accepted parent
  review assigned. DeligneWeightsAndPurity (tier 11) cites the same WC statements as package
  inputs E50–E53. Restructure proposal 1 therefore names DWP.0 as the final single owner. When
  DWP's upward citations are moved down, transfer the two RD.7 nodes there and point WC.1, WC.3
  and RD.7 at them.
- The Fresán–Sabbah–Yu applications are proposed to move up to CohomologyComparisons:CP.4
  (restructure proposal 2).

## Checks run

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- Source-issue fields pass the checker's `check_issues`, and all four findings carry `searched`
  lists and `sourceVersions` with URLs and SHA-256 hashes.
- **Lean: `lean-check` exited 0.** It reported 15 `declaration uses sorry` warnings and no other
  diagnostics, against Mathlib `082e2d37e8` in the shared build. Memory was checked first (91 GB
  available). No language server, build or cache download was started, and nothing is left
  running.
- All six baseline declarations were read at the pins. The five Mathlib declarations were read
  in the shared build and the index. `WeierstrassCurve.frobeniusTrace` was read at Tau Ceti
  `f790474` through the GitHub contents API.
- The numerical checks were rerun:
  - the Q = x^3 + x + 1, p = 5 reduction, in exact rational arithmetic;
  - point counts of y^2 = x^3 + x + 1 over F_7 (5 points, so a = 3) and y^2 = x^3 + x over F_5
    (4 points, so a = 2), by hand;
  - Tuitman's B = 3 for genus two over F_7.
  - The genus-two Frobenius polynomial T^4 + 3T^3 + 7T^2 + 21T + 49 is inherited from the
    parent's PARI/GP check and was not rerun.

## Sources read (all public; URLs, hashes and sections in the packet)

- Berthelot, *Finitude et pureté*, author's 1997 preprint, Internet Archive copy of the former
  Rennes page; §1, printed pp. 13–16. Journal pagination is not collated.
- Shiho, arXiv:0707.1742v2, pp. 1, 30–31.
- Kedlaya, *Notes on isocrystals* v6, pp. 2–3 and 19–20.
- Guo–Reinecke, arXiv v3, PDF pp. 60–61.
- Deligne, Weil I, Numdam, pp. 275–277.
- Milne, *Lectures on étale cohomology* v2.21, pp. 156–159.
- Kedlaya's point-counting paper (arXiv v2), pp. 5–6, and his 2003 errata note.
- Edixhoven's 2006 course notes, pp. 11–19.
- Harvey, arXiv v2, pp. 5–6.
- Tuitman, *Counting points II* (arXiv v2), pp. 2–5, 9, 11 and 13–15, and its June 2020 erratum.
- BDMTV, arXiv:1711.05846v1, pp. 25–26.
- Fresán–Sabbah–Yu v5, pp. 49–52; p. 51 was checked on the page image.
- D'Addezio, arXiv:2012.12879v4, p. 25.
- Kedlaya, Fourier transforms and p-adic Weil II (arXiv v3), pp. 3 and 50–52.

Not read:
- Katz–Messing (paywalled).
- Mieda 2007 (paywalled; no arXiv copy).
- Ogus 1984/1990 (not needed).
- The journal versions of Kedlaya's paper and Tuitman's paper.

No cleared atlas-library book was needed. No source text is in the repository.
