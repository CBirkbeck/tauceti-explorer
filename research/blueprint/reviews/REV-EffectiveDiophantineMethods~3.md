# Independent review: Effective Diophantine methods, revision 3

**Verdict: needs_changes.** This is a finished independent review of issue #7299, by Codex, session `codex-a2S7KJ`, on 8 October 2026. This session contributed to none of the three blueprint rounds. All 175 nodes were examined: **158 verified, eight corrected, nine unverifiable at primary locators**. The packet’s `review.checked` records an individual mathematical note for every node.

The seven requests R1–R7 of the preceding review have been addressed. The remaining acceptance obstacle is independent verification of nine citations in three original sources that this reviewer could not recover. It is not the existence of the packet’s honest supplier, implementation or numerical-data gaps. No contradiction remains among the in-place corrections described below.

The inputs included the packet, the entire suggested Lean file and reader, the preceding review and revision handoff, the binding blueprint and expansion protocols, the upstream guide, the pinned library declarations, the reviewed library audit and the supplying roadmap statements. This was a target-level review: statements, hypotheses, direct prerequisites, proof outlines, API, tests, omission contracts and planet choices were checked. No implementation or formal proof completion is claimed.

## Counts and stage status

| Stage | Nodes | API entries | Test contracts | Planets | Verified | Corrected | Unverifiable |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| ED.0 | 9 | 65 | 37 | 4 | 9 | 0 | 0 |
| ED.1 | 11 | 51 | 30 | 6 | 9 | 0 | 2 |
| ED.2 | 32 | 114 | 92 | 6 | 23 | 4 | 5 |
| ED.3 | 29 | 56 | 37 | 6 | 26 | 1 | 2 |
| ED.4 | 26 | 82 | 58 | 6 | 25 | 1 | 0 |
| ED.5 | 29 | 50 | 32 | 6 | 27 | 2 | 0 |
| ED.6 | 39 | 63 | 38 | 6 | 39 | 0 | 0 |
| Total | 175 | 481 | 324 | 40 | 158 | 8 | 9 |

The 24 definitions and 31 constructions account for 454 API entries and 317 tests, the subset counted by the structural checker. The other nodes comprise 102 theorems, 16 applications and two lemmas. Every definition/construction has at least three tests, including tests against plausible incorrect definitions. All seven stages remain `planned`, none is `closed`, and every implementation status remains `unchecked`. The packet remains a `complete` planning pass under its target-level budget, with 27 gaps, 40 requests, eight ownership/restructuring records and 69 exact omission records covering 185 names. There are 197 baseline declarations and 43 source findings after this review. No nodes were added, removed or consolidated in this review; no baseline citation was removed or replaced. One API entry and one test contract were added.

The stage targets have realizations in the node set. Recorded remaining work includes completion adapters, missing actual geometric carriers, complete raw producers, sharp height/index input and unreplayed numerical instances. Those are explicit work boundaries, not statements that the displayed `sorry` bodies implement them. Planet names remain mathematical definitions, constructions or named results, with at most six per stage and no newly invented planets.

## In-place corrections

**F1: good-reduction locator.** `ED.4/good-reduction-chabauty-datum` cited the opening of McCallum–Poonen §5 at author p.7. The good-reduction assumption is on author p.5; the residue parametrisation cited at p.6 remains there. The node’s source locator is corrected.

**F2: direct rank-bound dependency.** `ED.3/mordell-weil-basis-certificate` explicitly allows either two-descent or two-isogeny descent for its upper rank bound. The two-isogeny theorem was missing from the direct prerequisite list. Added `ED.3/two-isogeny-rank-bound`. The rank-zero alternative remains separate from the positive-dimensional index estimate.

**F3: unsupported numerical replay claims.** `ED.5/small-genus-two-nonexistence` said its individual certificates were reproduced in ED.6. They are not. The 1492-case list, 1447 sieve transcripts, other 45 cases and case-specific BSD labels remain a recorded data obligation. The node, reader and exact omission register now say this consistently. Likewise, the Box `X₀(43)` and Caraiani–Newton Proposition 7.4.5 examples are source acceptance cases for `ED.5/relative-symmetric-sieve`, not ED.6 replay instances. The reader’s general worked-example acceptance sentence is now explicitly a target for complete transcripts.

**F4: empty Thue covering.** `ThueFactorCovering` permits `M=∅`; completeness then proves that the equation has no solutions. The following constants node nonetheless took a minimum and maximum over representatives without stating nonemptiness. Added `ThueFactorCovering.solutions_eq_empty` and `covering_empty_solutions`, and specified dispatch before any representative extrema. The full raw constructor/checker contracts now distinguish no real roots, real roots with an empty complete covering, and real roots with a nonempty covering. Only the last tag constructs representative/unit-dependent constants and performs the usual reduction/search. The three affected exact omission contracts are synchronized between node records, the top-level register, reader and Lean comments. The surviving semantic constants record is still only a supporting record.

The suggested file contains the new theorem and regression signature with honest `sorry` bodies. Historical statements about an independently verified Silverman source were also scoped to the preceding revision, since this reviewer could not recover that source. One inherited prose quotation about Thue norm representatives was rewritten in the reviewer’s own words. The mathematics of its integrality qualification is unchanged. All changed node contracts have revision notes; metadata distinguishes this review’s source access from inherited reading history.

## Previous review requests

| Request | Independent disposition |
| --- | --- |
| R1: raw p-adic exclusion | Addressed. The raw finite p-adic record checks prime/precision, residues, matrix/target, coefficient box and rational distance data. Its six regression contracts distinguish parity, residue, distance and insufficient-precision failures. Real and distance helpers also have finite checks. |
| R2: full effective-bound/checker contracts | Addressed as a plan. Thirteen exact omissions preserve the intended original interfaces rather than presenting semantic summaries as raw computation. Unit rank, nonzero representatives, normalized valuation data, ramified pairwise/within-factor removing bounds, all five source cases and coverage of rejected rows are specified. The empty-covering correction above closes an additional boundary case. |
| R3: descent and half-height conventions | Addressed. The actual μ-kernel theorem is retained, and the faithful `x³−x` local/Selmer and `571a1` factories are exact omissions. Canonical-height intervals halve both naive height and Cremona’s comparison constants, with quantitative width and torsion tests. |
| R4: classical Chabauty geometry | Addressed as a plan. Actual curve, degree-g divisor, trace, topology, full residue-disc and symmetric-power hypotheses appear in the original-name omissions. Supporting finite-span and coefficient algebra has separate names. Full raw verdict trees are not asserted implemented. |
| R5: explicit QC geometry and precision | Addressed as a plan. Actual affine geometry, universal connection, nice correspondences, filtered bundle, Frobenius and Nekovář-height identification are required. The convention is `G=Φ⁻¹`, with `GS=S·diag(1,F,p)`. The full valuation bound retains `c₁,c₂,c₃,i₀` and the corrected tail condition. |
| R6: final modular applications | Addressed as a plan. The actual modular curves, projective point lists and CM/cusp identifications occur in exact original-name contracts. The nine `X₀⁺(N)` lists total 68 points; the ten-point 97 helper is not generalized to all levels. Numerical completeness remains a gap. |
| R7: Prickett provenance | Addressed. The five necessary saturation/group/index proof routes now use the independently read Siksek 1995 author preprint. Prickett is inherited, unused provenance; no fresh Prickett read is asserted. Further refinements and sharp point-recognition/index inputs remain explicit. |

## Sources and outstanding primary verification

Of 30 source records, 26 were recovered and their hashes matched the packet. Fincke–Pohst and Silverman AMS PDF requests returned HTTP 403; Matveev MathNet requests did not yield readable primary text. Prickett was not used as proof provenance for the revised five routes. The existing source records are historical bibliography; their new `reviewAccess` fields and dated `sourceVersions` identify this reviewer’s access. Published and preprint copies are not interchangeable.

The following is the scope of source inspection relevant to the target audit and errata, rather than a chapter-by-chapter account of any source. Pages are printed pages unless expressly described as author/arXiv pages.

| Source inspected | Target-bearing scope |
| --- | --- |
| [De Weger 1989](https://ir.cwi.nl/pub/13190/13190D.pdf) | Selected Chapter2 numerical methods pp32–34; Chapter3 lattice, distance, enumeration and p-adic logarithm lemmas pp42–67; Chapter6 bounds and Theorem6.3 pp115–127, TableII p130; Lemma7.3 p138. Formula and table images were checked against OCR. |
| [Tzanakis–de Weger 1989](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf) | Target-bearing Thue constants, root, unit, logarithmic-form and reduction arguments and worked equations, pp103–127; p116 was checked on the page image. |
| [Tzanakis–de Weger 1992](https://numdam.org/item/CM_1992__84_3_223_0.pdf) | Removing lemma, cases and bounds: selected pp223–227,230–234,237–241,247,249,258,260–271,275–279; original appendix/correction locators were compared with the corrigendum. |
| [1993 corrigendum](https://numdam.org/item/CM_1993__89_2_241_0.pdf) | Both pages241–242, including the missing factor, revised bounds/counts and three minor corrections. |
| [Yu 1994](https://numdam.org/item/CM_1994__91_3_241_0.pdf) | Cited statement and constant formulas for the normalized p-adic lower-bound adapter; local degree and valuation conventions were inspected on the source pages. |
| [Doyle–Krumm](https://arxiv.org/pdf/1111.4963v4) | §3 finite height algorithms, Proposition3.3/Lemma3.4 and the cited later algorithm/error-bound passages, including arXiv pp9–11,15. |
| [Cremona ChapterIII](https://johncremona.github.io/book/fulltext/chapter3.pdf) | Torsion pp69–71, height/generator bounds and Proposition3.5.1/Lemma3.5.2 pp75–78, two-descent/local-solubility passages through p91. |
| [Aitken–Lemmermeyer](https://arxiv.org/pdf/1108.6310v1) | Cited descent/Hasse-principle examples and appendices, arXiv pp12,14,16–17. |
| [Siksek 1995 author copy](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf) | Group/index and saturation arguments, author pp1–5,14–19; p18 notation/projective conditions. This is the 25-page author preprint, not the unread publication. |
| [Siksek over number fields](https://arxiv.org/pdf/1010.2603v2) | Pairing, local balls, matrix precision and local Chabauty criterion, arXiv pp4–11. Publisher p770 in inherited E22 was not independently opened. |
| [Siksek symmetric powers](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf) | Cited absolute/relative criteria and their proof/jet hypotheses, especially Theorems3.2 and4.3; the impossible i=0 inequality was checked in the published text. |
| [McCallum–Poonen](https://math.mit.edu/~poonen/papers/chabauty.pdf) | Formal logarithm, §§4.2–9 and AppendixA, including §5 pp5–7 and the cited example computations. |
| [FPS](https://arxiv.org/pdf/math/9508211v1) | Cited genus-two descent/group and3-adic series computations, selected arXiv pp10–23, including Proposition6 p15 and Theorem6 pp22–23. |
| [Poonen curve](https://arxiv.org/pdf/math/9512217v1) | Cited Jacobian/Chabauty computation pp13,15–17; infinity reduction and final parameter labels. |
| [Poonen errata](https://math.mit.edu/~poonen/papers/errata.pdf) | Entire seven-page list dated14 August 2025, with the relevant FPS/Poonen entries and bounded searches for the new findings. |
| [Stoll 2008](https://arxiv.org/pdf/0803.2836v2) | Known subgroup, conditional rank and Chabauty passages, arXiv pp7–10,12–13. |
| [Stoll 2019](https://arxiv.org/pdf/1307.1773v4) | Pairing/closure and bad-reduction passages, arXiv pp6–7,12–13. |
| [KRZB](https://arxiv.org/pdf/1504.00694v2) | Cited bad-reduction/model bound and hypotheses, arXiv pp19–24. |
| [BBK](https://arxiv.org/pdf/1004.4936v2) | Cited integration/logarithm conventions, arXiv pp1–3. |
| [Box](https://arxiv.org/pdf/1906.05206v3) | Symmetric/relative Chabauty and the sieve theorems, arXiv pp3–7. |
| [Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3) | §7.4, arXiv pp99–100, with the source acceptance cases and corrected subgroup index. |
| [Bruin–Stoll](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/29EFF630FD2859F8C79DFD48E1A33926/S1461157009000187a.pdf/the-mordell-weil-sieve-proving-non-existence-of-rational-points-on-curves.pdf) | Cited quotient/lifting, height, Kummer, bad/deep information and experiment passages, published pp272–301, including Corollary5.15 p294. |
| [BDMTV 2019](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | Cited setup/connection/Hodge/Frobenius/local-height and application passages, PDF pp1–12,25–50, including published equation(40) p921. |
| [BDMTV algorithms preprint](https://arxiv.org/pdf/2101.01862v4) | Cited algorithm, gauges, valuation/root precision and modular examples, arXiv pp12–15,18–19,24–32. |
| [BDMTV algorithms publication](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf) | Published p1129 and pp1133–1136 for comparison of the connection, valuation and truncation findings. |
| [Cremona ecdata](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999) | The571a1 record and its exact model. This data line does not prove its rank; the actual factory remains omitted. |

Nine nodes retain `unverifiable` verdicts, with precisely these checks outstanding:

| Primary source | Nodes | Passage to independently recover |
| --- | --- | --- |
| Fincke–Pohst1985 | `ED.1/short-vector-enumeration`, `ED.1/short-vector-enumeration-complete`, `ED.2/exponent-reduction-chain` | §2 pp464–466, Algorithm(2.8), relations(2.6)–(2.7) and the discussion after(2.12). The de Weger version and triangular completeness argument were checked, but do not certify these original locators. |
| Matveev2000 | `ED.2/logarithm-enclosure`, `ED.2/certified-linear-form-constant`, `ED.2/certified-linear-form-lower-bound`, `ED.2/thue-initial-bound` | §2, (2.1), Corollary2.3 and(2.4), p1219 in the specified English text. Check the complete numerical constant, normalized heights, logarithm/nonzero hypotheses and selected corollary against the actual file. |
| Silverman1990 | `ED.3/explicit-height-difference-bound`, `ED.3/canonical-height-enclosure` | Theorem1.1/Remark1.2 p725, weighted local/global convention pp727–728, and the additional abstract/§7 locator. The rational Cremona bound and its conversion to the pinned half-height were independently verified. |

Inherited statements that these originals were read in an earlier process are not substituted for independent source inspection. In particular, the number-field Silverman formula stays an exact interface obligation rather than acquiring an acceptance verdict from the accessible rational formula.

## Baseline, closure and ownership

All **157 Mathlib and 40 Tau Ceti baseline declarations** were inspected at the exact pinned commits, including their statements, relevant section variables and instances. The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration’s `checked` field now records this independent inspection. Names alone were not treated as evidence.

Particular convention checks included the pinned canonical height and pairing, Selmer/μ and torsion quotient, local squareclasses, finite-index and rank results, quotient maps, unit-group rank/maximal-rank theorem, characteristic polynomial/Mahler measure, Hensel distance, inverse infinity norm, geometric series and formal-power-series algebra. No near miss was promoted to a usable stronger theorem. Missing geometric or raw-checker interfaces stay in the exact omission register.

The validator’s one warning is an index defect: it finds `Finset.mem_filter` as `Finset.Finset.mem_filter`. Inspection of the pinned Lean declaration confirms the packet’s actual name `Finset.mem_filter`; replacing it by the doubly qualified index name would introduce a false citation. The warning is retained and explained, not silenced by changing the mathematical dependency.

All **106 distinct foreign prerequisites** were checked: 78 fine blueprint nodes and 28 stage/roadmap references, including nine upstream Tau Ceti roadmap references. The 40 requested interfaces remain requests rather than existing imports. Their actual supplier statements were read, with attention to height normalization, units/ideal completeness, divisor/reduction compatibility, differential geometry and modular interpretation. Broad stages do not certify extra fine theorems merely by their topic. The previously phantom quotient/special-fibre/Weil-style supplier references have been replaced by precise owner requests or honest gaps.

The reviewed `AUDIT-09` entries for all seven ED stages and the eight ownership/restructuring records were examined. Existing generic height, group, lattice, descent and power-series objects are reused; missing work in another roadmap’s direction is requested from that owner. No generic number-field, Jacobian, Coleman or QC foundation is duplicated here. Internal proof outlines are sound conditional on their stated planned prerequisites and explicit omissions; the missing direct two-isogeny edge was corrected. Target-level granularity is retained rather than splitting routine proofs into new lemma nodes.

The 481 API contracts, 324 tests and 69 omission records were checked for mathematical correspondence with the suggested signatures. Full raw checkers do not accept an input proof that the claimed list is complete. Actual geometric named results do not become theorems about arbitrary types whose fields already assert the answer. Supporting semantic implications, finite-set logic and matrix identities keep narrower names. Factory omissions also cover the actual arithmetic regressions that cannot yet be constructed from the pin.

## Source findings and exact arithmetic

All **E1–E36** received independent `confirmed` reviews at the inspected source versions. Checks included the affine sign and enumeration dimension/signs; transformed degree scale; Thue matrix orientation and convergent completeness; removing-lemma references and corrected Yu constants; torsion/residue/kernel notation; Kummer coefficient/factor/separating-prime bounds; actual differential basis index; gauge signs; and valuation/truncation hypotheses. E29 and E32–E34 were checked against the entire 1993 published corrigendum. E30 was compared with the corrected 2023 publication. E35–E36 are scoped to the Siksek1995 author copy. E22 was independently checked in the specified arXiv copy; its publisher comparison remains inherited provenance. No finding’s scope is extended to an unread publication.

Seven additional findings are recorded in own prose, with exact formulas, bounded correction searches and independent verdicts:

| Finding | Inspected locator | Correction and consequence |
| --- | --- | --- |
| E37 | TdW1989 p116 below(3.5) | `K₃′` also needs the factor `D` forced by `A′≤(q−p+1)DA`. The packet’s transferred scale is already correct. |
| E38 | FPS preprint Proposition6 p15 | Full rational torsion injection requires odd good reduction; at 2 only the prime-to-2 part is guaranteed. The actual3/5 example remains valid. |
| E39 | FPS preprint p22 | The displayed parameters have3-adic absolute values≤1/3, not additive valuations≤1/3. Their valuations are2 and1. |
| E40 | Poonen preprint p17 | With `t=y+3=3n`, the final point labels are `P₀,P₃,P₆`; the integers `n=0,1,2` are unchanged. |
| E41 | Cremona online ChapterIII §3.3 pp70–71 | The positive-y torsion scan must also output the inverse point, and the full list includes O. On `y²=x³+1`, `(0,±1)` are distinct order3 points. |
| E42 | TdW1992 Proposition16 p265 | The short-vector threshold must be strict for its finite logarithmic conclusion: equality can give zero in its denominator. ED.1 already has the strict condition. |
| E43 | De Weger Theorem6.3 p123/TableII p130 | Swap the summands22000 and6561, with their valuation blocks, to meet `x≤y`. Membership and the 545 count are unchanged. |

Exact integer/rational arithmetic was performed independently of the suggested Lean proof bodies. It verified the coefficient identity
`Q(X−Y,X+Y,X+Z)=16B(X,Y,Z)`, all seven displayed `X_s(13)` rational memberships, all 20 projective F17 points and their smoothness, and the 17 first-chart count. It also checked the ten `X₀⁺(97)` memberships and four `X_S4(13)` memberships, all 31 large S-unit triples for sum/gcd/prime support, and the counterexamples or parameter computations underlying E37–E42.

For E38, the curve `y²+xy=x³+4x²+x` has discriminant225, good reduction at 2, and the nonzero2-torsion point `(-1/4,1/8)`. Its primitive projective coordinates `[-2:1:8]` reduce to O. For E42, `R=3,S=16,l=5` satisfies the printed equality but gives `sqrt(l²−S)−R=0`. These checks establish the specific failures without depending on approximate arithmetic.

No full numerical completeness replay is claimed for the 545 S-unit solutions,72 Thue–Mahler solutions,1492 genus-two cases,68 points across the nine `X₀⁺(N)` curves, or the complete QC zero/matching tables. Those remain the packet’s explicit obligations. No external CAS/Magma run or filtered/mocked Lean file was used in this review.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json`: **0 errors, one explained baseline-index warning**.
- The repository `source_issues.check_issues` and `check_errata.versions_checked` checks on the packet’s43 findings and version records: **0 errors**.
- A correspondence check confirms every node has exactly one review verdict, and the exact per-node/top-level omission records agree and occur in both reader and Lean register. Counts and new API/test names agree with the reader.
- `lean-check research/blueprint/suggested/EffectiveDiophantineMethods.lean`: **did not compile**. It stops at line 16 because the available shared build lacks the compiled object for `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight`. No body was elaborated. No libraries were built or updated and no language server was started. The Mathlib source pin matches; source-level Tau Ceti inspection used the recorded pin, not the shared build’s moving source checkout.
- Exact arithmetic checks described above passed. `git diff --check` and the authorized path check passed before submission.

The remaining decision for the orchestrator is how to obtain independently readable public originals for the three precise source groups above. If primary text is recovered, resume at the nine `unverifiable` entries, compare the entire formula/hypothesis/locator, and reconcile any correction across the three deliverables. The earlier R1–R7 work need not be repeated merely because numerical producers remain omitted. After any changes, rerun the structural and version checks and elaborate the actual suggested file only when an existing pinned build can resolve its real imports.

The durable handoff is `research/blueprint/handoff/REV-EffectiveDiophantineMethods~3.md`. This review is complete; it is not a blueprint implementation or a checkpoint. The reviewer opens one pull request and stops without claiming another issue.
