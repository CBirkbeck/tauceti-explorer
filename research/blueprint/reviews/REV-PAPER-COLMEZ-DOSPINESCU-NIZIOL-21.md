# REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-21

Status: complete independent review. Verdict: **revise**. The corrected extraction remains **partial**.

Reviewer: Codex — codex-a71f92. Input: PAPER-COLMEZ-DOSPINESCU-NIZIOL-21, issue #1322, submitted by Claude Code cc-fb70e5 in PR #2061. I did not author any input checkpoint. Claim #1323 was confirmed by the bot after comment 5804584913.

## Reviewed input and evidence

Snapshot: `9dae258635aa613763739a779007b11c0d618be7`. Input result blob: `c4afcab2fac8ae8ed39c351cea11f6bb1fc44d83`. All 43 input items, all six routes, the twelve bibliography entries, the fourteen source findings and five claimed gaps were inspected. The resulting source review does not certify every cited supplier proof.

The 24-page [Nizioł PDF](https://webusers.imj-prg.fr/~wieslawa.niziol/integral-Omega3.pdf), SHA-256 `0535b22d7a61aff68405a2b364ff4d6b62cb7928eb14479840989dd46db14d34`, was read completely, including the proof of Theorem 2.9, the symbol-normalization diagrams, the integration argument and the derived-Nakayama assembly. Rendered pages 11 and 21 were inspected to check the exponents and degree-i factorization, not just text extraction.

The source-history claim in the input is wrong. [arXiv:1905.11495](https://arxiv.org/abs/1905.11495) exists, lists v1 submitted 27 May 2019, and identifies journal pages 575–613. Its 21-page PDF was downloaded and selected parallel passages inspected. The [Dospinescu author version](https://dospinescu.perso.math.cnrs.fr/cdn4.pdf) is 36 pages, compiled 19 July 2020; corresponding passages for the confirmed input findings were checked. Full hashes, dates and the exact reading boundary are in the result's source.versions array. Neither alternative witness is claimed fully read.

The DOI fetch failed and the Project Euclid page supplied no readable full text or correction history. Author publication pages and exact-title erratum/correction searches identified no applicable notice, but this does **not** establish absence of a published correction. Every finding's search record now states that limitation instead of the input's false arXiv/publisher assertions.

Other primary statements inspected: [Stacks 091V](https://stacks.math.columbia.edu/tag/091V), [091Q](https://stacks.math.columbia.edu/tag/091Q), [091S](https://stacks.math.columbia.edu/tag/091S), [0A0G](https://stacks.math.columbia.edu/tag/0A0G); BMS1 arXiv:1602.03148v3 §6, Corollary 6.5 and neighboring statements; Scholze's Theorem 1.2 and Proposition 8.2 in [p-adic Hodge theory for rigid-analytic varieties](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), and the complete three-page cover/period-sheaf corrigendum. These are targeted supplier checks, not complete extractions of those papers.

## Mathematical and coverage review

| Input region | Check and correction |
|---|---|
| §1 and §5 | Main integral/F_p statements, twists, actions and vanishing match. Keep arbitrary p for this paper and p≥5 only for the quoted compact-support result. Remark 1.2 is historical, and its abstract duality is not a canonical pairing. |
| §2.1 | Completion and Lη statements substantially match but are heavily bundled. The ringed-topos theorem now names the finite-type ideal and its extension under f. Generic completion is not owned by AI.1. |
| §2.2 | Preserve θ versus θ̃ and Tate versus BK twists. Do not generalize the field/domain/regular-sequence assertions verbatim to every perfectoid ring. The integral period sheaf is not a mere name for Witt vectors. |
| §2.3 | Smooth and semistable comparisons require separate clauses, cup maps and canonical-normalization proofs. AI.6's proper-DVR wording does not establish all non-proper O_C models here. |
| §2.4 | Truncation and semilinear Frobenius/fibre types checked. The general flat-model extension is missing, not automatically imported from BMS2's good-reduction theorem. |
| §3 | The Hodge–Tate/étale normalization uses μ and ζ_p−1 exactly as stated. Corrected formal-model differentials in an ε_* target to generic-fibre Ω_X. The proof outline is a theorem/compatibility entry, not a new object. |
| §4.1–2 | Corrected the false complaint about the source's LC-dual display: the Steinberg dual is its annihilator submodule. For abelian coefficients use Hom_Z; A-linearity requires a coefficient ring. Residue field k means reduction modulo the maximal ideal, not generally O_K/p. |
| §4.3 | The degree-i regulator extension is not proved by relabeling Hom(Π,Z_p(i)) as H^i. The actual complete cochain model, maps and limits remain a gap. Constant symbols vanish after the geometric Kummer regulator, not by an unrestricted ordinary Milnor-K identity. Integer-round the exponent in the p-divisibility estimate. |
| §4.4 | The algebraic reduction/Nakayama argument is distinct from the topology argument. Preserve adjacent-degree torsion and twist transport. No general homeomorphism theorem follows just from a mod-ξ̃ homeomorphism and torsion-freeness. |

The last point has a useful negative test: the identity from Z_p with the discrete topology to Z_p with its p-adic topology is continuous, bijective, algebraically complete and torsion-free. Both mod-p quotient topologies are discrete, yet the inverse is not continuous. This does not disprove the paper's theorem; it exposes the additional topology hypothesis/proof the extraction must carry.

At p=2, graded commutativity alone does not imply an odd-degree square is zero. The source's alternating symbols require the actual Kummer/constant-symbol argument. The revised gap list records that input instead of assuming it from a sign.

The input's completion claim was too strong. Among the remaining mandatory splits are six derived-completeness properties; the independent Lη properties; Theorems 2.2, 2.3(a–c), 2.4(a–b), 2.5(a–b), 2.8(1–3); Lemmas 2.10(a–b), 2.11(a–c); the representation/lattice results; the de Rham/Hodge–Tate/base-change regulators; and the two coefficient conclusions of Theorem 5.1. Original IDs are retained, with three narrative construction entries corrected to theorem/compatibility entries. The result explicitly records partial coverage rather than disguising these bundles as atomic declarations.

## Pinned-library review

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The input had no library items. Eight narrowly scoped ones were added after reading declaration statements:

| Item | Existing interface | Boundary |
|---|---|---|
| B01 | DerivedCategory, DerivedCategory.Q | Ordinary derived category, not enhanced completion |
| B02 | WittVector, WittVector.ext | Carrier, not the A_inf period package |
| B03 | LocallyConstant, LocallyConstant.ext | Functions, not their LF topology/Steinberg quotient |
| B04 | AbstractMeasure, AbstractMeasure.toCLMEquiv | Continuous dual, not yet the LC-distribution comparison |
| B05 | AbstractMeasure.dirac, AbstractMeasure.dirac_apply | Evaluation, not density or regulator extension |
| B06 | PadicInt | Coefficient ring, not its pro-étale sheaf |
| B07 | KaehlerDifferential, D, linearMapEquivDerivation | Algebraic differentials, not completed/log sheaves |
| B08 | ExteriorAlgebra, ι, exteriorPower, ι_sq_zero | Exterior algebra, not geometric cup-isomorphism |

Each item carries the inspected file/line, full pinned commit and SHA-256. The regression check reverified all eight evidence entries against their seven distinct local files. No cited declaration was accepted just from a name search.

Both pinned trees were searched for the main missing objects and comparisons; hits for finite-group Steinberg relations and classical Hodge constructions were not counted as p-adic generalized Steinberg cohomology. The reviewed library audit was read for the relevant owners: AUDIT-25 distinguishes the existing bounded-measure carrier from the missing functional-analysis comparisons. Exact AI/PR/DD/P8/A1 keys had no matching audit entry; this absence is not a proof of implementation or of absence.

## Ownership and routes

Read the authoritative AInfCohomology README in full and the relevant AdicEtaleGeometry A1, PrismaticCohomology PR.4, PadicHodgeTheory P8:local-rational, DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E4 and ClassicalAdicEtaleCohomology H0 contracts. Read the companion extraction's Drinfeld and quasi-abelian functional-analysis proposals. Import boundaries were corrected without editing their owners' files.

| Route | Verdict | Reason |
|---|---|---|
| 1 — shared Drinfeld proposal | Reject | Correct destination, but complete-cochain regulator, topology, splitting and atomic closure are not design-ready. |
| 2 — A_inf Part II | Reject | Narrowed to new symbol/flat-formal-model interfaces. Local AΩ was never proper-only. Exact extension scope and construction remain to be decomposed. |
| 3 — AI.0/1/3/4 | Accept | Periods/twists, Lη, toric smooth construction and smooth specializations are inside the explicit contracts. Removed unused AI.5 and unsupported AI.6 coverage. |
| 4 — PR.4 | Accept | One owner for ψ_i, fixed-point lemmas and nearby-cycle theorem, including the missing flat-model extension. |
| 5 — P8:local-rational | Accept | Exact Kummer-normalized comparison is a missing source addition at the early rational local owner. |
| 6 — H0 | Accept | Coefficient/derived-limit and affinoid K(pi,1) source additions, not the A1 site owner. |
| 7 — DD.1 | Accept | Generic completion/Nakayama is explicitly owned here. |
| 8 — shared functional-analysis proposal | Reject | Correct home for the naive-topology convention, but required strictness/LC/completion interfaces are not design-ready. |
| 9 — E4 | Accept | The separately extracted Stacks 0A0G theorem is the sheaf application of DD.1 completion. |

Accepted source routes add mathematical proof tasks, not declarations that are already formalized. Rejected routes must not seed design jobs yet. All 37 missing items have exactly one route. The companion proposed IDs are reused; no Tau Ceti roadmap is replanned. The original A_inf Part II ID is retained for stable references while its title and scope are corrected.

## Every source finding

| ID | Verdict | Independent conclusion |
|---|---|---|
| E1 | Confirmed | §4.4 uses Hodge–Tate ι_HT, not ι_HK; retained in the alternate author witness. |
| E2 | Confirmed | The coefficient-reduction exact sequence must retain the twist {i} in its middle term. |
| E3 | Confirmed as gap | Natural degree-i complete-cochain factorization and completion/limit maps are missing. The input's proposed H^i replacement is not a verified repair. |
| E4 | Confirmed narrowly | Ordinary K^M needs the ring input. Does not prove constant-symbol vanishing in raw K^M. |
| E5 | Rejected | Defining the unused x_0=1 is valid. |
| E6 | Confirmed | The final Steinberg factor remains degree i−1; the zero coefficient makes the conclusion unaffected. |
| E7 | Confirmed | μ^{-1}a(1) belongs to A_inf{1}, not generally A_inf(1). |
| E8 | Confirmed | The quotient in the multiplication-by-μ^i diagram is by μ^i. |
| E9 | Rejected | Repeated citation of 091V does not itself establish an error. 091Q gives a direct generator-criterion reference. |
| E10 | Confirmed | BMS1 labels the result Corollary 6.5. Correct the footnote, not the earlier correct citation. |
| E11 | Rejected | * is a contextual placeholder selecting one of two theories. |
| E12 | Rejected | Explicitly typed compatible maps can share γ; no ill-defined composite is established. |
| E13 | Rejected | A secondary exposition of Schneider–Stuhler is a legitimate citation. |
| E14 | Confirmed | Four spelling slips, no mathematical effect. |
| E15 | Confirmed, already corrected | ArXiv v1 §5 omits the extra A_inf{1} coefficient twist. Both 2020 author versions correct it. |

The nine confirmed input findings are retained in the July witness; E15 is version-specific and explicitly marked known/corrected. No finding is claimed independently checked against the inaccessible published text. There are ten confirmed entries in total, five rejected, and no external notification to the authors.

## Changes and acceptance boundary

The result now has 53 items (8 library, 8 planned, 37 missing), nine routes, fifteen findings and nine explicit gaps. Initial API and boundary-test outlines were added to every definition/construction entry. The two newly isolated supplier theorems are ringed-topos completion and the affinoid K(pi,1)/continuous-cochain comparison. Already extracted BMS1, BMS2 and CDN20 were moved out of the unprocessed-prerequisite list to sourceDependencies; the survey citation was separated from Scholze's original paper. Nine unprocessed prerequisite entries remain, some themselves needing bibliography/statement splitting.

The retained bundles and omitted proof interiors are reasons for **revise**, not hidden assumptions. To finish: split the enumerated results; construct E3's complete higher-degree regulator; verify integral free splitting, LC/measure topology and strict completed-tensor limits; prove the topological inverse; check exact local non-proper/site scope; close the supplier-version/locator audit; then complete declaration-level dependency, API and tests. Do not weaken hypotheses or invent these constructions as structure fields.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COLMEZ-DOSPINESCU-NIZIOL-21.result.json`: pass.
- Reviewer finite regressions: 53 distinct items, every missing item routed exactly once, every definition/construction has API/tests, 8 pinned evidence matches; 16 finite quotient-dual counts, 5 integral alternating cocycle identities, 16,418 finite-group cup-cocycle cases and 12 torsion-quotient cases: pass.
- `python3 -m unittest tests.test_check_paper tests.test_source_issues tests.test_check_errata tests.test_errata tests.test_papers_queue tests.test_intake`: 55 tests pass.
- Final intake: 5 files, 0 problems. Fresh-main preflight found no input/instruction/owner/audit changes; exact commit is recorded in the handoff.

The numerical checks are limited counterexample/normalization diagnostics. They do not prove the geometric claims. No Lean file was requested for this paper review and none was compiled. Only the four issue deliverables and this job's handoff are submitted; scratch scripts, PDFs and images are not included.
