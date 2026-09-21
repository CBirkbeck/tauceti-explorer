# REV-RS-29: inverse Galois theory beyond Belyi maps

**Verdict: accepted with two in-place corrections.** This accepts ownership, not completion of the mathematics or a source-closed blueprint. Reviewer: `independent-review-REV-RS-29`, Codex — `codex-c83e7a`, 2026-09-21. Refs #857.

The original worker was Codex — `codex-a71f92`, a different session, on [issue #858](https://github.com/CBirkbeck/tauceti-explorer/issues/858), submitted in [PR #898](https://github.com/CBirkbeck/tauceti-explorer/pull/898). The corrected [proposal](../restructure/RS-29.result.json) contains its review object: one Part II extension, all seven stage IDs, five narrowed and two kept, 25 ownership entries and 30 supplier links. The original [report](../restructure/RS-29.md) is unchanged; the corrections below supersede its corresponding wording.

## Inspection and evidence

Read the complete member README and seven layer descriptions; the complete Belyi README, all fifteen layer descriptions and scope appendices; the proposal/report; all fifteen family leads; and the reviewed library-coverage records for both roadmaps. Inspected full relevant outside stage descriptions: ModularCurves 0D, AlgebraicCurves 8, LocalFieldsRamification 2–4, ProfiniteProPGroups 5, PolynomialGaloisGroups 9, NC.0, DY.5, LPV.1/5, FA.3, R01.2 and R09.4. Checked consumers against the full atlas. The repository tree has no accepted InverseGaloisAndArithmeticFundamentalGroups decomposition to migrate.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, direct statement checks established:

- [Galois/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/Basic.lean): `PreGaloisCategory` and its `FiberFunctor` impose substantial existence, preservation and reflection conditions. A geometric-point functor alone does not supply these instances.
- [Galois/Equivalence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/Equivalence.lean): `PreGaloisCategory.functorToContAction` has an `IsEquivalence` instance under `GaloisCategory C` and `FiberFunctor F`; its target is finite continuous actions.
- [Galois/Topology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/Topology.lean): `autEmbedding_isClosedEmbedding` supplies the compact, Hausdorff, totally disconnected topological-group instances on `Aut F`.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, [Place/Extension/RamificationGroup.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean) supplies `TauCeti.Place.ramificationGroup_one_eq_bot` under finiteness of the first ramification group and `CharZero P.ResidueField`. This concerns the residue field, not the fraction field.

Other coverage relies on the reviewed audits. This review does not claim new readings of all SGA, rigidity, Shafarevich or patching proofs. Current roadmap interfaces and future targets are not all implemented at the pinned libraries; ownership imports preserve that distinction.

## Corrections

1. IG.0 already imported Mathlib's abstract classification in prose, but omitted it from structured suppliers, links and owners. Added `UPSTREAM:Mathlib-Galois-category-classification` in all three, with actual hypotheses. The finite-étale scheme instance and geometric comparisons remain new work.
2. IG.1 asserted wild-inertia nonvanishing without hypotheses. Its retained scope now tracks the kernel and nontrivial examples while allowing triviality for tame finite extensions and finite first ramification groups at characteristic-zero residue fields. Characteristic zero of a mixed-characteristic local field does not imply trivial wild inertia.

No original supplier link, owner, stage or roadmap decision was removed.

## Duplication and preservation

All fifteen family leads have supplier links and the following substantive resolutions:

| Leads | Resolution |
| --- | --- |
| IG.0 / Belyi 12 (1) | The field-theoretic three-point group is imported. The general finite-étale scheme instance and scheme/field comparison remain IG.0. |
| IG.1 / Belyi 12 (1) | The three-point sequence/inertia is a compatibility target. The general scheme sequence and specialization remain new. |
| IG.3 / Belyi 0, 2, 3, 5–11 (10) | Import triple/dessin carriers, three-point realization, compactification, algebraization, Belyi's theorem and positive descent. General branch sets and rational rigidity remain additional work. |
| IG.6 / Belyi 11–13 (3) | Transport the arithmetic actions, cyclotomic convention and stated faithfulness theorem without reconstructing or strengthening them. |

The additional Belyi layer 1 supplier is justified: passport/normalizer orbits are not inner rigidity. Product-one counts alone do not establish generation or arithmetic realization.

| Stage | Preserved obligations |
| --- | --- |
| IG.0 | Scheme Galois-category/fibre-functor axioms; scheme components and ordinary base-point comparison with choices; `Spec K` via ModularCurves 0D; algebraically closed characteristic-zero `G_m` with Tate twist; three-point scheme/field comparison. |
| IG.1 | Geometric/arithmetic exactness in the selected SGA range; scheme decomposition/inertia and conjugacy; tame/wild comparison; smooth-proper specialization with characteristic restrictions; finite-field Frobenius and punctured-curve checks. |
| IG.2 | Hilbert irreducibility over number fields; full-group specialization away from branching; avoidance and linear disjointness; infinitely many distinct worked extensions and certificates. |
| IG.3 | General finite branch sets; braid/Hurwitz actions and Nielsen classes; general descent; rational rigidity with generation, centralizer and rationality assumptions; worked arithmetic realization; an actual moduli/definition obstruction example; imported dessin/triple and passport checks. |
| IG.4 | Properness on the supplier's continuous weak-solution carrier; local arithmetic constraints; Shafarevich proof with auxiliary ramification and successive proper solutions; cyclic, dihedral and weak-but-not-proper examples. |
| IG.5 | Hurwitz moduli/components using IG.3's actions; descent and regular extensions; tame positive-characteristic reduction with its group-order restriction; separate wild patching/Abhyankar proof obligations. |
| IG.6 | Actual polynomial/extension/cover maps and group isomorphisms; specialization hypotheses; imported symmetric-group realizations; transported arithmetic actions; theorem-indexed solved families; unrestricted inverse Galois over Q and generic-polynomial universality remain frontier statements. |

The following scope checks prevent false deletions or stronger claims:

- Belyi 11.6 gives positive descent but cites the negative phenomenon only as a warning. IG.3 must retain the constructed obstruction example. Moduli is not automatically definition; a descended genus-zero curve need not be the projective line.
- Belyi 12.6 requires full finite-cover categories including disconnected objects and compatibility of fibre functors. A bijection of connected isomorphism classes cannot discharge IG.0's comparison.
- Preserve the ordered triple convention `sigmaInf * sigma1 * sigma0 = 1`, relabeling and branch ordering. Belyi's cyclotomic formula is about individual conjugacy classes; componentwise powers need not give a product-one tuple. Its faithfulness theorem gives neither arbitrary reconstruction nor faithfulness in every fixed genus.
- Three-point inertia carries Tate twists and choices. LocalFieldsRamification requires finite residue fields; AlgebraicCurves 8 has separate residue-inseparability qualifications. FA.3, R01.2 and LPV.1 extend ramification in distinct arithmetic/coefficient settings, rather than supplying the general scheme theorem.
- ProfiniteProPGroups 5.1 defines a generic finite embedding problem despite its surrounding pro-p applications. Weak solutions need not be surjective; arithmetic properness remains IG.4.
- LPV.5's tame specialization at a dual locus does not supply general Hurwitz moduli or wild realization. IG.5 retains these and its algebraic-moduli input.

## Consumers and validation

The Part II title exactly prefixes Belyi's title. The proposal consumes the anchor's special cases, proves compatibility and starts beyond them. No Tau Ceti roadmap/layer is changed or targeted by a new prerequisite. Integration must put Belyi first among the extension's roadmap prerequisites, as PROTOCOL §15 requires.

All nine existing outgoing member-stage edges remain. The two outside consumers are IG.0 → DY.5 and IG.1 → NC.0. DY.5 also imports ModularCurves 0D directly. NC.0 additionally imports IG.0's finite-étale/base-point interface and Belyi 12. Ordinary geometric base-point comparison remains IG.0; arithmetic path torsors and tangential points remain NC.0. The correct direction is NC.0 → IG.6, with no reverse prerequisite. IG.2 → IG.6 makes specialization hypotheses explicit.

Validation against main `27e6175be94e0fca7241822b05e4ab6da9512d89`:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-29.result.json` passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/restructure/RS-29.result.json research/blueprint/reviews/REV-RS-29.md` passed.
- Scratch checks verified seven unchanged stage IDs, unchanged roadmap actions, unique owner targets and links, explicit edges for every structured supplier, all original owners/links, and coverage of all fifteen leads.
- Full-atlas reachability used 3,458 active existing edges plus 30 proposal links, excluding the recorded retired roadmap. No newly introduced edge has a return path. This does not assert that every pre-existing atlas component is acyclic.

No Lean file is requested or changed; Lean was not run. No atlas, queue, original report, anchor or library file is edited.

## Questions and integration note

The complete instructions on #857 require in-place proposal corrections and its review object, but `queue.json` lists only this Markdown report as REV-RS-29's output. The intake ownership check therefore omits the explicitly requested JSON. The maintainer should reconcile that metadata and process or rerun intake; the worker has not changed the queue or merged anything.

Blueprint work must select exact source statements for the SGA range, rational-rigidity variant, descent obstruction, Shafarevich proof and wild patching theorem. Acceptance resolves ownership, not these source/proof obligations. Preserve the original report's characteristic, topology, properness, convention and frontier restrictions during integration.
