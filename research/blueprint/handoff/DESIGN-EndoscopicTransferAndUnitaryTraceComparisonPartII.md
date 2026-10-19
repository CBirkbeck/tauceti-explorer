# DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII

Issue: #3348. Worker: Codex / GPT-6, session `codex-TuWtgr`.
Branch: `codex-TuWtgr-endoscopic-part-ii`.
The bot confirmed this session's claim on 19 October 2026 at 11:25:24 UTC
([confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/3348#issuecomment-6266087634)).

## Delivered scope and status

This is a complete target-level design pass, ready for independent review,
not a checkpoint and not a claim of dependency closure. It implements the
issue's permission to plan the first continuation here and propose a split
for independent directions. The fixed roadmap id covers unitary
Friedberg–Jacquet relative endoscopy, the 35-item Leslie route formerly named
`UnitaryFriedbergJacquetRelativeEndoscopy`.

The five deliverables are the roadmap definition, packet, definitive reader,
compact suggested Lean file and this handoff. No extraction, sibling packet,
application code, atlas data, reserved ids or upstream checkout is changed.
All mathematics has implementation status `unchecked`.

| Stage | Targets | Planets | Coverage | Remaining inputs |
| --- | ---: | ---: | --- | --- |
| FJ.0 | 8 | 6 | planned | G1 and ET.1 orbital-integral export |
| FJ.1 | 6 | 4 | planned | G2, inherited G1, ET.3 ordinary transfer export |
| FJ.2 | 3 | 3 | planned | ET.3 base change and the normalized Hironaka compatibility |
| FJ.3 | 7 | 5 | planned | G3–G5, including corrected germ averaging and Weil interfaces |
| FJ.4 | 10 | 5 | planned | G6 and propagated analytic/normalization obligations |
| FJ.5 | 3 | 2 | planned | G7 unrestricted transfer; G8 full-spherical factors |

Total: **37 nodes** (9 construction, 5 definition, 17 theorem, 6 comparison),
**65 API items**, **50 discriminating unit tests**, **25 planets** and
**8 baseline declarations**. There are **8 gaps and 2 supplier requests**;
zero stages are closed. The reader contains every target, hypothesis, direct
prerequisite, proof outline, source locator, API item, unit test and Check.

## Ownership decisions

The parent continues to own ordinary stable conjugacy, endoscopic data,
factors, transfer and characteristic-coefficient quotients. GN.2/GN.3 own
Hermitian forms, lattices, diagonalization and densities; AA.2 owns quotient
measures. Exact existing node ids are used. The actual statements of these
nodes were read. Stages without sufficiently precise export nodes are used
only with requests, never as unsupported imports.

In particular **SR.4/parabolic-descent already owns the determinant-twisted
Levi map and its Satake scaling**. This design imports it. Its new targets
are base-change compatibility, the full Hermitian module and Fourier
extension, the additive Lie descent comparison and the relative application.
The affine quotient proof uses a direct split-coordinate dense-section
polynomial argument, with the full conjugation quotient imported from
ET.2b/chevalley-quotient and descent from SF.1/galois-descent-affine; it does
not assume an unregistered Igusa invariant-theory criterion.

The mathematical dependency direction is independent product-group
Jacquet–Rallis comparison → rank-shifted comparison → augmented transfer →
cyclic ordinary endoscopic transfer → graded relative lattice-unit theorem.
The product-group spectral supplier must not assume the FJ theorem.

## Exact work remaining

The packet's `gaps`, `requests` and stage `remaining` arrays are authoritative.

1. **G1:** identify/register the general p-adic analytic owner for local
   sections of the contraction torsor, surjectivity of compact test-function
   pushforward with fixed Haar measures, and orbitwise compact nonsingular
   cutoffs. Leslie19 Appendix A, Proposition A.3, pp. 25–26 supplies a
   mathematical source, not an existing formal supplier. AA.2 alone is
   insufficient.
2. **G2:** give the complete endoscopic datum, invariant, factor and measure
   transport when exchanging the two contractions, treating nonisometric
   Hermitian summands.
3. **G3:** the proposed Jacquet–Rallis sibling must register its actual local
   quotient/matching/distribution/smooth-transfer/Lie-descent exports and
   the product-to-block contraction identities (7.5)–(7.7). The gap spells
   out their invariant coordinates, factors and matching ranges. No sibling
   stage ids have been invented here.
4. **G4:** reconcile raw Tate germ measures with finite character inversion;
   prove the proposed coefficient (2^{-\#S_1}) for all quotient transports
   and the ordinary endoscopic factor comparison. Reconcile the different
   four-form sign conventions in Leslie and Xiao. The rank-one raw value
   (1/2) and the finite character-table inversion are checks, not a
   certification of the full corrected germ theorem. The spherical reduction
   uses only the nonzero reference/reference lower-rank test, and block
   exponents add so the averaging factors cancel.
5. **G5:** register the actual Weil actions on the two orbital-image spaces,
   their agreement on the intersection, self-dual **trace** pairings, the
   integral unit-norm reduction, generator argument and regular-base density.
   The defect is acted on in the **sum** of the images. The elementary
   extension from intersection agreement to the sum is planned here.
6. **G6:** the Jacquet–Rallis sibling must plan Leslie Theorem 11.1, p. 78,
   with its independent local/global spectral proof, all ranks including the
   trivial rank-zero factor, every spherical Hecke function and wrong-form
   vanishing. Only its statement and the application/contraction passages
   were read here. The intervening global proof has not been decomposed.
7. **G7:** prove arbitrary-support relative smooth transfer, a conjectural
   target in the references read. Neither the nonsingular-support theorem
   nor the unit theorem proves it. This is not a claim about the status of
   all subsequent literature.
8. **G8:** specify the augmented transfer factors, matching range and
   unmatched-zero clause for the full spherical module; Remark 3.7 does not
   give the formula. The Fourier-defined Levi extension is a precise
   operator and does not establish this missing orbital characterization.

Two requests, with exact contracts and consuming nodes in the packet:

- **ET.1:** normalized Hermitian orbital integrals and finite weighted sums,
  ordinary factors, rational-orbit correction and the Xiao germ/Lie-descent
  factor comparison in the same measure convention.
- **ET.3:** ordinary nonsingular Hermitian smooth transfer with an invariant
  determinant cutoff, and unramified GL base change with Satake substitution
  (Z_i\mapsto T_i^2), preserving units and products. No relative
  Jacquet–Rallis FL is requested from ET.3.

## Preservation of the other routes

`restructure[0].routeRecords` preserves all eight original route records,
complete briefs and item lists, totaling 466 route-item incidences. They are
the extractions' routing prose, not source excerpts.

- This fixed id receives the first Leslie route, 35 items. `routeCoverage`
  maps all 35; items 23, 24 and 28 are imported from SR.4, the other 32 are
  realized here.
- Keep `JacquetRallisRelativeTraceComparison` with its proposed title,
  parent, area and all four briefs: Leslie 55 + Zhang 60 + BPLZZ 34 + BPCZ
  31 = 180 items. It must include its independent spectral programme, not
  just the FJ interfaces. Its briefs retain the named BC25 continuation.
- Keep `EndoscopicTransferRigidInnerFormsPartII`, including its complete
  Kaletha brief and 104 items.
- Move **both** colliding geometric routes together to the proposed,
  unregistered `GeometricStabilisationViaPadicIntegration`: GWZ20-B 124 +
  GWZ20 23 = 147 items. Preserve their title, parent, area, briefs,
  finite-quotient corrections and separate DM-stack trace-formula direction.

No stages are assigned to these siblings and no blueprint coverage is claimed
for them. Accepting the split must update the two geometric route ids
coherently. No upstream roadmap is proposed for replacement or repair.

## Source reading and findings

Read on 19 October 2026; exact versions, URLs, dates, hashes and reading
ranges are in `sources` and `sourceVersions`. All locators refer to the
version actually read. The principal cleared PDF was read in place; no copy
or extracted passage is included in this submission.

- **Leslie25:** arXiv:1911.07907v3, accepted 12 March 2025, 89 pages. Read
  introductory conventions and all of Part 1, Sections 2–5, pp. 13–43;
  Sections 7.1–7.2.2, pp. 47–51; Theorem 11.1/Lemma 11.2, pp. 78–79;
  Section 11.2, pp. 85–86; references. The intervening global spectral proof
  is the explicitly unread G6 supplier boundary. The Annals published PDF
  was not compared: findings are confined to v3.
- **Leslie19:** public arXiv:1910.09685v2, 6 April 2020, 27 pages.
  Proposition 1.3, p. 4; Section 3.2, pp. 12–13; Section 4.2, pp. 14–15;
  Appendix A, pp. 25–26.
- **Xiao18:** public arXiv:1802.07624v1. Section 2.1, pp. 3–5;
  Proposition 3.8, pp. 11–12; Sections 4–6, pp. 15–24.
- **Hironaka99:** public published JMSJ PDF. Introduction, pp. 553–554;
  normalization and Theorem 2, pp. 570–571. Its unramified Hermitian theory
  does not impose odd residue characteristic.
- **Beuzart-Plessis21:** public arXiv:1901.02653v3, December 2020,
  Sections 1–4 and references, pp. 1–9, including the proof's use of the sum
  of orbital images on p. 8.

There are 13 source findings, stated in our own words, without passages or
an independent-review verdict. The first eight cross-reference the existing
Leslie extraction findings. Additional checks concern the modular-character
absolute-value convention; the false entrywise-even base-change support
claim (explicit rank-two counterexample); missing finite Fourier averaging;
the four-form sign conversion; and the location of the Weil defect. The last
is repaired by the sum-space argument already present in Beuzart-Plessis.
The article landing page, author research page and arXiv histories were
checked for corrections. No correction to this article was displayed in the
places checked; no claim of novelty across the literature is made. No author
was contacted.

## Baseline and upstream anti-duplication

Baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The eight exact Mathlib references
are `Matrix.conjTranspose`, `Matrix.IsHermitian`, the two Gram-product
Hermitian theorems, `Matrix.charpoly`, `Matrix.charpoly_mul_comm`,
`MvPolynomial.hsymm` and `MvPolynomial.bind₁`. The pinned Tau Ceti search and
the reviewed GN.2/GN.3/AA.2 library audit were also checked. Exact external
node statements were read rather than inferred from names.

The current upstream roadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read only,
including IntegralLattices/OrthogonalSpinGroups readers and suggested files,
and representation-theory searches. No build was run there. ClassicalGroups
and SchurWeyl roadmap readers were read as style/ownership references,
together with the full parent endoscopy reader and incoming link records.

## Validation and next action

`python3 scripts/check_blueprint.py research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparisonPartII.json`
reports **zero errors and zero warnings**. The internal prerequisite graph is
acyclic and every stage target is realized. Every definition/construction has
uses, an API and at least three unit tests. Planet counts are at most six per
stage.

The suggested file **compiled successfully with `lean-check` at the pins**,
exit zero, with twelve expected admitted-proof warnings and no other warnings.
It has two real-bodied light matrix definitions, five theorem signatures and
seven examples. The full p-adic, endoscopic, spherical and Weil targets remain
in the definitive reader, following the 12 October compact-file rule in
WORKERS.md; there are no fabricated carriers, admitted data definitions or
empty transfer predicates. Available memory was checked before compiling,
and no Lean process remains running.

The next action is independent review of this complete pass, particularly the
new normalization findings and sibling boundary. Follow-up design work must
discharge the precise gaps/requests and register the split suppliers; it must
not mark any stage closed on the strength of the signature check.
