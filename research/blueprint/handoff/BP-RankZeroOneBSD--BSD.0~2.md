# BP-RankZeroOneBSD--BSD.0~2 — completed revision pass

Issue: #7003. Agent: Codex (GPT-6), session `codex-Lm4QNs`, 2026-10-10. Branch: `codex-Lm4QNs-bsd-revision`.

This is a complete target-level revision, not a checkpoint or an independent acceptance. The packet is `complete`; BSD.0, BSD.1, BSD.2, BSD.3, BSD.4, BSD.5, BSD.6 and BSD.6a are all `planned`, with no `closed` stage. The remaining proof/source refinements below are explicit, as the issue permits for a planned stage. All 68 node IDs, their order, and the historical `review` object are preserved. Every implementation status remains `unchecked`; the next independent reviewer replaces the historical review.

## Deliverables and counts

- [Packet](../packets/RankZeroOneBSD--BSD.0.json): 68 targets — four constructions, five definitions, 48 theorems, four comparisons, six lemmas and one application; 78 API items; 37 unit tests; 34 planets; 68 baseline declarations; 49 supplier requests; eight gaps; seven source issues; 17 version receipts.
- [Reader](../readmes/RankZeroOneBSD--BSD.0.md): every target's exact statement, hypotheses, proof outline, prerequisites and source locators, with every definition's API, consumers, tests and acceptance conditions. Includes the three review-added targets and all supplier contracts. Source mathematics is paraphrased, without source excerpts or passages.
- [Suggested Lean](../suggested/RankZeroOneBSD--BSD.0.lean): elaborates against the real pinned imports through `lean-check`, with declaration-uses-`sorry` warnings only. All 78 API names are actual declarations and all 37 named tests have distinct doc blocks immediately followed by `example`s. The file retains upstream's nonexhaustive-prototype note; the reader is definitive. Imported owner fixtures remain unproved, clearly identified interfaces.

## What this round changes

The two carrier/signature defects that made BSD.1 and BSD.6a partial are addressed.

The quadratic complex period now uses an actual `Submodule ℤ ℂ` integration lattice, discrete/full-lattice instances, native `ZLattice.covolumeL`, and an invertible fractional differential ideal over `𝓞 K` with native rational absolute norm. Its body is norm times four covolumes. The seven API items and three examples retain this normalization, nonzero rationality and p-unit hypotheses; the non-example detects the missing factor two. GZ.0 supplies the integration image and R11.6 supplies the differential ideal and twist pullback comparison, through exact new requests. These fixtures identify geometric objects rather than defining the period by an arbitrary scalar or a vacuous existential.

The signed prototype uses actual geometric torsion-point inverse limits for the Tate module, Tau Ceti continuous H¹ of global/decomposition subgroups, compatible corestriction limits, local signed submodules, and Λ/Λ^ur coefficient rings. The six BSTW API items and four examples are declarations. The zeta class is not defined by imposing desired reciprocity identities as fields. Col is at v, Log at v̄. Cyclotomic cohomology is constructed independently; identification with a quotient requires the SIC control export. BSTW6.26(i) compares with the normalized combination of **two** Kato classes over rational coefficients. Its integral refinement requires primitive differential/Betti bases. BSTW §§2.2.4–2.2.5, pp.13–14, uses cohomological T_g with determinant χ_cyc⁻¹; R29.4 and polarization compare T_g(1) with geometric V_pE. Matching integral lattices and their indices is a separate normalization obligation. This prototype does not introduce a further twist of geometric T_pE.

Native baseline checks remove an artificial number-field-height gap and its obsolete EC.6 request. Mathlib `NumberTheory/Height/NumberField.lean` already supplies admissible absolute values and Northcott at the pin; Tau Ceti `fg_point_of_numberField` gives finite generation. The regulator comparison uses native `Matrix.det_mul`, `Matrix.det_transpose` and `AddSubgroup.index_eq_natAbs_det`, replacing a nonexistent GZ Gram-determinant export. Generic lattice comparisons belong to current IntegralLattices, not this roadmap. Current Tau Ceti's compact Tate module and Galois action are existing material; only their pin-compatible fixture is used here.

All accepted reviewer corrections are retained and synchronized into the reader: the conditional L-series junk-value example, completed entire continuation at gamma poles, normalized Fricke sign, combined trace compositions [2], finite isogeny-Selmer requirements, split p in Skinner–Zhang9.2, BFH weighted-vector residues and per-discriminant infinitude, Heegner sign and index-square formulas, regulator factor 2^r, positive nonzero defect and valuation directions, and actual isogeny hypotheses.

The six handed-in findings are handled as follows:

| Finding | Revised contract |
| --- | --- |
| RT/4 | Skinner §3.2's anomalous factor cancels; finite Selmer/Fitting and the multiplicative Hida deduction and period comparison have distinct exact requests. |
| RT/14 | Skinner–Urban/Skinner retains q≠p, q∥N and residual ramification; this is not silently replaced by FW1.6's stronger condition. |
| RT/15 | FO supplies Lemma2.14 local type, not nonexistent Cor7.2.1. FWv3 Cor7.21 supplies Rankin/Katz/class-number factorization at AC L2. CGS2.4.5 projection is APL L3h. BSD owns Σ extension and the higher-weight integral Kolyvagin target; C1/C2, augmentation and FW full ramified-special hypotheses remain explicit obligations. |
| RT/16 | Positivity uses separately requested central-value nonnegativity and positive Gross–Zagier height, with nonvanishing. |
| RT/17 | Separate p∤2N and p∥N period comparisons; geometric discriminant multiplicities replace nonsplit rational Tamagawa numbers; integral degree freeness remains explicit. |
| RT/30 | Ordinary BSTW element/laws/comparison belong to early Kato L5. BSD owns signed construction and signed Proposition9.18, whose proof is omitted in the source. Early BSD.6z supplies AC L5a and finished BSD.6a. |

The added direct BSTW1.5 semistable rank-one endpoint and its Lean signature are retained. It does not establish the older JSW auxiliary-twist argument in the wider coprime-discriminant range. The named BSD.6 endpoints now have geometric residual p-torsion, inertia and actual reduction hypotheses. The Castella A′ endpoint allows additive reduction away from p, and retains E(ℚ_p)[p]=0 and its nonsplit residually ramified multiplicative q.

## The 19 previously unverifiable targets

These are not reclassified as independently verified. Direct reading clarifies the endpoints and the following proof/carrier/source obligations; the packet records exact requests or gaps.

| Target(s), abbreviated after RankZeroOneBSD: | This revision and remaining obligation |
| --- | --- |
| BSD.0/congruent-number-root-numbers | Rechecked BT footnote2; original Birch–Stephens dyadic proof still unacquired. |
| BSD.1/quadratic-period | Geometric carrier, native norm/covolume and named prototype supplied; dyadic exponent and Néron differential comparison remain. |
| BSD.2/prescribed-local-conditions-value-branch; auxiliary-fields-for-prime-parts | FH Theorem B is a direct-reading gap; ramified compatibility and supersingular ordinary-support selection are not inferred from the coprime formula. |
| BSD.4/kato-rank-zero-finiteness; kato-p-part-upper-bound | Read Kato14.2(2), p.235, all-prime/CM range; exact L4 local-condition/CM and one-sided finite-bound exports remain, without assuming an MC equality. |
| BSD.5/ribet-takahashi-degree-comparison | Exact integral multiplicity-one/freeness discharge remains; use geometric ord_ℓΔ. |
| BSD.6/jsw-lower-bound; jsw-upper-bound; jsw-rank-one-p-part | Exact μ/control/degree inputs remain. BSTW's twist range is narrower than the older source; the direct semistable endpoint is separate. |
| BSD.6/castella-multiplicative-rank-one-p-part | Read full erratum A′; chosen ramified q makes the twist additive, so a separate rank-zero input and additive-away-p control/GZ range are required. |
| BSD.6a/anticyclotomic-selmer-control; wan-anticyclotomic-divisibility | Compact/discrete Poitou–Tate, finite Selmer/Fitting and excluded-prime/μ discharge have exact requests. Derived global descent alone is insufficient. |
| BSD.6a/bstw-two-variable-zeta-element; bstw-explicit-reciprocity-laws | Actual carriers, both-prime laws, all six API/four examples supplied; integral images, coefficient-lattice and cyclotomic controls remain. |
| BSD.6a/bstw-signed-main-conjecture; bstw-rank-zero-p-part | Signed Proposition9.18 proof, CLW/image indices and two non-torsion local specializations remain. |
| BSD.6a/castella-anticyclotomic-main-conjecture; castella-higher-weight-input | Torsion is asserted for X, not its ideal. Distinct FW/FO/CGS/BCK/GH inputs and the owned integral higher-weight extension remain explicit, including Σ, C1/C2 and augmentation. |

## Source and baseline readings

Re-read the independent review's full correction ledger and actual supplier statements, the accepted RS-30 restrictions, the library coverage audit and every relevant cross-roadmap link. Read current upstream EllipticCurves and ModularForms and the nine newer roadmaps at TauCetiRoadmap main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the current Tau Ceti Tate-module files and the pinned height, lattice, continuous-cohomology, Galois/descent and Mordell–Weil statements. Existing upstream material is imported, never replanned.

Direct source readings include:

- JSW published CJM5, §§7.1–7.4, pp.420–428, including geometric versus congruence periods and the squared index; Skinner arXiv1407.1093v1, Theorems A–C, §§3.1–3.2, pp.1–3,19–24.
- BSTW arXiv2409.01350v2, Theorems1.3/1.5, pp.3–4; 1.14/1.15, p.7; coefficient lattice §§2.2.4–2.2.5, pp.13–14; 6.25/6.26, p.68; Proposition9.18, pp.83–84.
- Castella arXiv1704.06608v2 and the five-page author-hosted erratum, A′, corrected1.1 and Lemmas2.1–2.2/Theorem2.3; CGS arXiv2303.04373v2, Proposition2.4.5 and Theorem6.5.1.
- FW arXiv2107.13726v3, Theorems1.6/4.41, pp.6–7,58, and Corollary7.21/Lemma7.22, p.89; FO author-hosted `ControlF-O.pdf`, Lemma2.14, pp.12–13.
- BFH §9, pp.614–617, checked visually; Gross §1, pp.235–237, and Proposition5.3, p.243; Gross–Zagier V.§2, pp.310–312, checked visually.
- Kato §14.1–14.3, pp.234–236, and §15.19–15.21, pp.266–267; Skinner–Zhang Corollary9.2, p.29; Pollack–Weston CR and §6 including6.8/6.9, p.21; BT footnote2.

Version-specific URLs, read dates and digests are in the packet; original reviewed receipts are retained. FH1995 Theorem B and Birch–Stephens1966 original full texts were not acquired. This does not claim they are unavailable online. Cha05/Matar–Nekovář/CGLS inputs to the higher-weight C1/C2 proof remain an acquisition/applicability obligation, not a completed reading. No uncleared book copy was used and no private files/passages were copied.

## Ownership moves, graph checks and completion work

The internal dependency graph is acyclic: 68 nodes, 177 edges. The atlas stage graph has 1,365 vertices and 3,458 edges and is acyclic. Adding this packet's projected prerequisites and requests gives 3,527 edges and the BSD.4↔BSD.5 cycle. Applying all early-placement proposals together yields 1,369 vertices, 3,549 edges and an acyclic graph. This check covers atlas edges plus this packet and the listed proposal edges, not every other packet's internal graph.

The maintainer must apply the proposals and redirect consumers together:

1. Move `BSD.5/rank-zero-rationality` to early BSD.0a, feeding BSD.4 and BSD.5.
2. Place `BSD.3a/definite-congruence-period` in early BSD.3a, feeding HE.6 and BSD.5. It does not consume the finished Heegner-index or BSD results.
3. Place the signed zeta, reciprocity and signed-comparison targets in early BSD.6z, feeding AC L5a and BSD.6a. Ordinary construction/laws/Proposition9.18 are requested from Kato L5, before these consumers; AC does not duplicate them.
4. Separate BSD.6's named prime-part endpoints from BSD.6a's anticyclotomic/signed inputs in the atlas descriptions.

No atlas data, other packet or upstream roadmap has been edited. Of the 49 requests, four new contracts specify GZ.0 period geometry, R11.6 differential lattice, SIC L3 actual tower/cohomology control and APL L3 signed analytic functions; the obsolete height-instance request is removed. Existing requests are refined to exact ranges rather than treated as proved suppliers. The R29.4 node is the coefficient dictionary supplier.

A follow-up must resolve the eight packet gaps: FH original theorem; dyadic period/Tamagawa bookkeeping; Birch–Stephens local computation; ramified/supersingular auxiliary choices; integral degree hypotheses; higher-weight integral/Σ/C1/C2/FW range; signed9.18 omitted proof; integral signed image/coefficient-lattice/Selmer/cyclotomic control. The next independent review should assess these target-level contracts and the two repaired prototypes without treating them as implemented proofs.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.0.json`: zero errors, zero warnings. JSON, source receipts, exact preserved review/node IDs, all unchecked implementation statuses, native baseline uniqueness, actual API declarations, distinct example blocks, reader statement/API/test coverage, internal DAG and cumulative stage projections were checked. `git diff --check` passes. The final `lean-check` returns exit zero; its only diagnostics are declaration-uses-`sorry` warnings, with no linter suppression. No build/cache/update/language server was run. Scratch sources are deleted after submission; everything needed to resume is in this note and the packet.
