# Independent review: level-one automorphic forms for classical groups

**Verdict:** accepted as a complete target-level plan, with explicit implementation and source obligations. No declaration is certified as implemented and no stage is closed.

**Reviewer:** Codex, session `codex-40kHaS`; job `REV-DESIGN-LevelOneAutomorphicFormsForClassicalGroups`, issue #3559. Date: 2026-10-19. This session did not write the design under review.

## Inventory and scope

The review read all 107 original nodes, their statements, hypotheses, source matches, proof sketches and direct prerequisites. The corrected packet has 108 nodes: 94 verified, 13 corrected and one added. Its `review.checked` gives an individual verdict and reason for each node. There are 18 definitions, 12 constructions, 8 comparisons, 45 theorems, 20 lemmas and 5 applications. All 30 definitions/constructions have a checked API and at least three discriminating tests: 91 API entries and 92 tests in total. The eight planned stages have 40 planets and an acyclic dependency graph.

All six pinned baseline citations are confirmed. The packet retains 12 explicit gaps, 27 supplier requests and the Arthur dependency gate. These are obligations of the plan, not claims that their proofs or certificates exist. Acceptance follows the issue's rule allowing an accurate plan with recorded gaps; there is no unresolved contradiction in the revised targets.

The reader, roadmap definition and suggested file were synchronized. The reader includes every node's full statement, source locators, API, tests and acceptance conditions. This report is also the completed-job handoff; there is no unfinished review work to resume.

## Corrections

| Target or boundary | Correction and reason |
|---|---|
| LO.1 archimedean invariants, purity/duality and self-dual type | Removed nonexistent numbered equations and P1–P3 labels. The actual sources are CT20 §2.1, pp.273–274, and §2.2, pp.274–275. The determinant, gamma and epsilon conventions and simple-weight hypothesis remain explicit. |
| LO.2 GL₂ dimension recovery | Replaced the incorrect §2.4.7 citation by CT20 p.271 and §2.4.5, pp.283–284. This is a conditional application of the general exclusion algorithm, with the full known eigenclass set. |
| LO.2 repeated-weight GL₄ vanishing | Added the omitted target from CT20 §2.4.7, p.285, marked `addedBy` this review. For odd 1≤w≤53 it excludes self-dual level-one PGL₄ classes of infinity type 2I_w. Its 27 strict certificates at ℓ=5 remain CN obligations. The recipe must use all classical GL₂ eigenclasses, not a zero-or-one shortcut. |
| LO.5 weight-23 cover | Distinguished the paper's reported 265-element two-class cover from the companion database's 269 stored types and the PARI finder’s 1.001 enlarged cutoff. The Sage rational-Gram enumeration has another specified cutoff. A certified cover needs its own domain, cutoff and completeness manifest. The one-class database has 12293 distinct rows, 12106 stored negative outcomes and 187 residuals; removing the six multiplicity-free types leaves 181 types in dimensions 10–38. |
| LO.5 weight≤22 | Corrected the public French CL14 Theorem F locator to p.15. |
| LO.6 first occurrence | Corrected the French references to CL14 V §§1–2, pp.135–140, and IX §4.3, Theorem 4.4, p.326. First occurrence remains an earlier theta-tower input, independent of the later Siegel classification. |
| LO.6 small-lattice eigenparameters | Corrected the nontrivial rank-16 compact parameter to Δ₁₁[4]⊕[7]⊕[1], of dimension 16. Δ₁₁[4] alone has dimension 8. The degree remains four. Sources: CL14 Theorem E, p.12, Table I.2, pp.13–14, Theorem 4.4, p.326, and Table C.5, p.440. Added the dimension acceptance check and synchronized the reader's overview. |
| LO.7 scalar/nonscalar tables | Corrected CT20 Theorem 2 to p.263. Independently checked all 58 regular weight/parameter rows, including the two-class GL₂ distinction; the three singular scalar rows remain separate. |
| LO.8 stable parameter remainders | Made even k explicit before using k/2. The trivial distinguished H1 block forces evenness, and the character test then forces 4∣k. |
| LO.8 Leech invariants and alternating forms | Imported the existing Golay owner and current native code. Narrowed FF.4 to the missing Mathieu action and incidence/orientation data. Kept the twisted Leech comparison with the lattice owner. Ordinary Construction A has norm-two roots and cannot supply rootless Leech uniqueness. |
| Baseline convention | Clarified that `CuspForm.discriminantEquiv` divides by the discriminant from cusp weight k to modular weight k−12; its inverse multiplies. No baseline citation was removed. |
| Source bookkeeping and reader | Reviewed every inherited source finding, added E22, rejected the unsupported English-page claim E11, corrected French overview locators, and synchronized supplier/gap lists and counts. Source-version hashes and access dates are recorded, and the two author-copy version labels use the protocol spelling. |

## Baseline, suppliers and ownership

The full cited declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- `TauCeti.Symplectic.groupScheme`, `TauCeti.Symplectic.pointsMulEquiv` and `TauCeti.Symplectic.instSmoothCoordinateHopfAlgebra` supply the existing split symplectic model, points and smoothness.
- `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` supplies an eigenvector at a nonzero local extremum. It does not itself prove that the eigenvalue is least; LO.2 retains that step.
- `ModularForm.dimension_level_one` and `CuspForm.discriminantEquiv` supply the existing classical dimensions, with the direction clarified above.

The reviewed library audit and the exact relevant statements of every cited supplier were checked. The requests distinguish existing outputs from required extensions: real LLC and classical/adelic dictionaries; the analytic explicit formula; EP trace and orbital distributions; Arthur/AJ/MR packet inputs; interval scalars and complete covers; theta, Rallis and Böcherer normalization; lattice completeness; and finite group certificates. Broad stage names alone are not treated as proofs of the stronger requested statements.

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected separately from the compilation pins. RootSystems and SpinRepresentations served as structural examples; the relevant current IntegralLattices, ModularForms, OrthogonalSpinGroups, ReductiveGroups, LieHighestWeight and AlgebraicCodingTheory interfaces were read. Existing lattice carriers, symplectic models, classical dimensions and Golay code are imported. Current lattice reference constructions do not imply exhaustive rank-16 or rank-24 classifications. Rank-16 completeness remains with OrthogonalTamagawaAndLatticeMass 7I. No upstream file was edited.

## Independent finite checks and source findings

Exact cyclotomic-exponent enumeration used the effective bound m≤2d² from φ(m)≥√(m/2), determinant parity, and the explicit action of polynomial negation. It reproduces the reader's full and square-support orbit counts, including 1158 for Sp₁₄ and 766 hard columns for Sp₁₆. The SO₃ character matrix has determinant 288 and mass solution (−1/12,1/4,1/3,0,0). These are exact arithmetic checks, not certificates for every mass dataset.

Independent enumeration of shifted Arthur blocks and Weil epsilon signs gives 198 collapsed positive-genus shapes and 223 actual candidates. All 25 extra candidates arising from the two weight-23 GL₂ classes fail the character test. There are 58 survivors, split into 29 scalar and 29 nonscalar regular rows; every survivor agrees with the reader's explicit rows. Including genus zero gives 199 shapes and 59 survivors.

Independent parsing of the companion weight-23 data establishes the one-class counts and dimension endpoints above. Its two-class data have 269 distinct stored types and one nonnegative outcome, at the exceptional type. Reading the verifier and search code does not prove completeness of those raw lists. No Sage/PARI run, new interval certificate or formal cover witness is claimed.

There are now 22 source findings: 21 confirmed and one rejected, each with an individual reason and reviewer identity. E1–E10 and E12–E21 were checked against their locators and the relevant arithmetic or companion code. This includes the average multiplicity normalization, exceptional self-dual two-class gap, actual lift genus in the Rallis relation, the SO₃ sine denominator, qualified non-positive critical values, and relative additional-class interpretation of the exclusion algorithm.

New E22 concerns CT20 §2.4.7, p.285: the claimed size-one classical range contradicts dim S₂₄=dim M₁₂=2 and dim S₅₄=dim M₄₂=4, using the pinned declarations. The GL₄ target therefore requires certificates with the full known set. A targeted public erratum search found no correction; this does not establish that none exists.

E11 is rejected because the inherited correction to an English book page could not be checked. That book was not used. The public French CL14 IX Proposition 3.17, pp.304–306, supplies the verified alternative for the scalar/tail formulas. Rejection is of the asserted page correction, not a claim that the unavailable page is correct.

The public sources read at the cited target locations were [CT20, published version](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), [Taïbi 2017, published version](https://www.numdam.org/item/10.24033/asens.2321.pdf), [CL14, French preprint](https://arxiv.org/pdf/1409.7616), [CT19a, version 1](https://arxiv.org/pdf/1907.08781v1), the [author's source/data archive](https://otaibi.perso.math.cnrs.fr/levelone/levelone_src_data.tar.gz), and the [Böcherer companion note](https://otaibi.perso.math.cnrs.fr/levelone/verif_bocherer.pdf). These were targeted readings, not whole-book or whole-literature proof audits. In particular the original Böcherer 1989 theorem and general Arthur/endoscopic proofs remain explicit supplier/source gates. No source passages are reproduced.

## Orchestrator follow-through

The corrected plan is ready for the next programme step. Its existing gaps and requests remain binding during packaging and implementation:

1. Route generic integral spinor norms and local GSpin lifting through the proposed Orthogonal and spin groups, Part II, imported by GN.2. Route rank-24 completeness, rootless Leech uniqueness and embedding/stabilizer results through the proposed Integral lattices, Part II, imported by GN.3. Neither proposal replans an existing carrier or changes upstream here.
2. Preserve current AlgebraicCodingTheory ownership of the Golay code. Arrange the additional Mathieu orientation and twisted Leech comparison contracts with the finite-group and lattice owners.
3. Require content-bound interval and completeness manifests, including the exceptional self-dual two-class exclusion and all 27 repeated-weight GL₄ cases. Do not identify the paper, raw database and replacement cover cardinalities.
4. Preserve ML.0's Arthur gate and MP.6's original Böcherer-theorem source obligation. The companion specializations and conditional interfaces do not discharge those proofs.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LevelOneAutomorphicFormsForClassicalGroups.json`: zero errors and zero warnings.
- All 108 individual verdicts, source locators and full target statements checked for packet/reader consistency; all source-version hashes match the public artifacts read.
- `lean-check research/blueprint/suggested/LevelOneAutomorphicFormsForClassicalGroups.lean`: exit 0 at the pinned baseline, with `sorry` as the only warning. The 255-line file states only targets available over pinned carriers; higher automorphic/theta targets remain in the reader.
- `git diff --check`: clean. Changes are restricted to the five issue deliverables.
