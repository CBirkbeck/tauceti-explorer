# Finished revision 2: AG2.0–AG2.5

Issue [#7301](https://github.com/CBirkbeck/tauceti-explorer/issues/7301), job `BP-AutomorphicGaloisRepresentationsPartII--AG2.0~2`. Codex session `codex-cIVwMR`, 8 October 2026. This is a completed revision, not a checkpoint. One issue was claimed; no second job was taken.

The [packet](../packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json) remains `complete` as a target-level planning pass. Its definitive [reader](../readmes/AutomorphicGaloisRepresentationsPartII--AG2.0.md) now agrees with the corrected mathematical packet from [the independent review](../reviews/REV-AutomorphicGaloisRepresentationsPartII--AG2.0.md). That review's top-level object is preserved exactly, including its `needs_changes` verdict, for the next independent reviewer to replace. Acceptance is still an independent review action.

## Changes in this round

Regenerated all declaration sections from the reviewed packet, including hypotheses, uses, API, test categories, proof steps, acceptance conditions, direct prerequisites and source locators. Updated the stage introductions, all supplier contracts, all gaps and all five confirmed source-issue discussions. The reader includes the six API items already added by the reviewer: dominant-weight construction, extensionality, base-change identity/composition, and Hodge–Tate multiset cardinality/no-repetition.

The reader now carries the corrected integer-weight and symmetric-power rank assumptions; reciprocal Frobenius and Hodge–Tate conventions; compact surface and signature `(3,3)` dimensions; trivial coefficient selector; and tensor-monodromy example. It imports the direct IG.1, AF.1, AF.4, arbitrary-regular existence, WD and number-field recognition inputs recorded in the packet. Generic polarization belongs to **ArithmeticGaloisRepresentations G7**. The sign assembly treats fixed irreducible factors by orthogonal sums and exchanged factors by hyperbolic pairings.

CH's family retains every Special Hypothesis 1.2, including nonsplit sphericality, and distinguishes even-rank interpolation from the odd geometric branch. Arbitrary-regular field removal uses the opening paragraph of the proof of 3.2.3 as well as Theorem 3.1.2. HLTT's finite-slope dagger sections embed into ordinary formal sections; Proposition 6.15's factor `p^{mn[F:Q]}` and Corollary 6.17's slope shift are explicit. Caraiani's product comparison uses Propositions 3.9, 4.6 and 4.10 and Corollary 4.29, with a common trait, characteristic-zero coefficients and the kernel/image filtrations of total monodromy. Corollary 5.9's rank-one case is supplied separately by characters.

Accepted [RS-12](../restructure/RS-12.result.json) keeps the separate general-rank roadmap titled **Galois representations attached to regular algebraic automorphic representations of GL_n**. The reader and suggested-file introduction now use that title and architecture. Historical roadmap/node identifiers remain unchanged. The early rec-free dictionary and raw geometry precede ET's local comparison; R19 appears in subsequent overlap comparisons. The historical normalization-comparison node keeps its identifier and its reviewed parent stage AG2.5. AG2.1 remains a process aggregate, with no independent mathematical nodes.

The finite-part notation is now `π^∞` wherever its stabilizer defines automorphic rationality. Finite Galois realization remains a subsequent AG2.3 theorem with its AG2.6 Hodge input. Clarified page locators for Caraiani's product and temperedness results, Bellaïche–Chenevier's sign theorem, and Liu's coefficient field; corrected the GSp₄ finding reference to `RT-AREA-langlands-1/19`. Paraphrased the two weight-definition signatures in the packet, reader and suggested ledger, and removed a misleading claim about literal source text. No source-excerpt fields or source passages are included.

## Counts and coverage

| Item | Count |
|---|---:|
| Definitions / constructions | 5 / 12 |
| Lemmas / theorems / comparisons | 5 / 44 / 11 |
| Total declarations | 77 |
| API items / discriminating tests | 84 / 58 |
| Planets | 35 |
| Pinned baseline declarations | 4 |
| Public sources / node source entries | 20 / 99 |
| Supplier requests / gaps | 50 / 13 |
| Confirmed source issues / owner refinements | 5 / 3 |

AG2.0, AG2.1a, AG2.1b, AG2.2, AG2.3, AG2.4 and AG2.5 are `planned`; AG2.1 is `source_decomposed`. No stage is closed. All 77 implementation statuses remain `unchecked`. Planet counts in the seven mathematical stages are respectively 4, 6, 4, 3, 6, 6, 6.

## The eight handed red-team findings

| Finding | Preserved correction and reader update |
|---|---|
| `RT-AREA-langlands-1/2` | Raw trace geometry precedes LLC and Igusa stabilization. The EDC.8 trace-class/ET.5 fixed-point gap explicitly requires one earlier generic geometric theorem; no trace class is treated as that theorem. |
| `RT-AREA-langlands-1/3` | The global Mantovan contract includes alternating smooth Ext, level colimit, dimension twist and global equality. The reader now includes direct IG.1 and the generalized Steinberg/parabolic local realization request. |
| `RT-AREA-langlands-1/4` | Compact one-signature geometry is distinguished from the quasi-split `(n,n)` datum. Compact, possibly ramified IG/PEL and ST/END trace specializations remain explicit requests; the dimension examples are corrected. |
| `RT-AREA-langlands-1/5` | Effective Kottwitz triples require polarized O_F-linear realization with the determinant/local type and vanishing α₀ obstruction. The reader preserves the PEL/IG request and effectivity gap. |
| `RT-AREA-langlands-1/18` | TC.4's characteristic-zero input is arbitrary-regular AG2.3 existence. The integral/residual exports belong to AG2.7; raw geometry does not consume IG.7 torsion concentration. |
| `RT-AREA-langlands-1/19` | Generic GL_n WD/sign theory uses the arithmetic owner. Dedicated GSp₄ existence, normalization and ramified comparisons retain the proposed absent owner and an explicit gap, without fabricated stage identifiers. |
| `RT-AREA-langlands-1/26` | IHG.4 supplies generic interpolation/separation independently of TC.2. The reader states the Hasse quotient-descent versus injective-witness mismatch explicitly. |
| `RT-AREA-padic-2/32` | RD.4 owns the dagger–rigid comparison, RD.5 finiteness and RD.6 weight bounds; F1 supplies geometry. Intrinsic boundary-pair independence remains unproved. |

## Sources and baseline checks

All 20 recorded public PDFs were obtained afresh with matching SHA-256 values. This round reread correction loci, not all twenty papers in full. The eleven new `readSections` records identify exactly what was reread:

- BLGGT §2.1, pp. 31–34, and Appendix A.2, p. 87: weights, parity and algebraic characters.
- CH Special Hypotheses 1.2, pp. 3–4, and §§2–3, pp. 7–12: interpolation, field removal and Proposition 3.2.5.
- Shin Lemma 5.1, p. 30; model/Mantovan discussion, pp. 33–34; Corollaries 6.5(iv), 6.8 and Remark 6.9, pp. 47–49.
- Taylor–Yoshida's coefficient projector and relative-degree identity, p. 12.
- HLTT Lemmas 6.10–6.12, Proposition 6.15, Corollary 6.17 and §6.5, pp. 211–218.
- Caraiani Propositions 3.9, 4.6 and 4.10, pp. 24, 29 and 33; Corollary 4.29, p. 51; Corollary 5.9, p. 64; §7, pp. 83–85.
- Bellaïche–Chenevier Theorems 1.1–1.2 and Corollary 1.3, pp. 1337–1339.
- Liu Definition 3.1.1 and Lemma 3.1.2, pp. 138–139.
- Newton–Thorne §5.1, Theorem 5.1 and Lemma 5.2, recorded preprint p. 38.
- Varma's proof of Proposition 8.1, p. 19.
- Published Caraiani–Scholze Corollary 5.5.5 and Remark 5.5.6, pp. 745–746.

E1–E5 retain their independently confirmed verdicts and recorded publication-search scope. Their descriptions state the source claims in our own words. E2 retains the corrected multiplier parity; E3 retains the exact maximal-rank counterexample and uses pure-WD uniqueness with all monodromy powers; E4 keeps the first CH proof; E5 distinguishes weight `n−1` of the individual normalized parameter from `2n−2` of its square. Historical source/version checks are preserved and are not claimed as new publication collations in this round.

Read the reviewed library coverage, accepted RS-12, relevant links, actual generic polarization/recognition and EDC.8 contracts, and both upstream SemisimpleAlgebras and SchurWeyl roadmap models. Rechecked all four Mathlib statements at `082e2d37e8b0463410cdb532e111cd43d5a66174`: `NumberField.IsCMField`, `NumberField.IsCMField.complexConj`, `NumberField.IsCMField.complexEmbedding_complexConj`, and `Multiset.prod_X_sub_C_coeff`. The declared Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti Lean declaration is cited by this packet and the suggested file imports only Mathlib.

The cleared-library index was checked. It does not supply the Harris–Taylor passages needed here; no uncleared book copy was used. The precise unavailable proof steps remain gaps rather than being inferred from their surrounding results.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json`: zero errors and warnings.
- Independent correspondence check: every node's statement, hypotheses, uses, API, tests, proof steps, acceptance, prerequisites and source matches its reader section and correct parent stage. All 50 requests, 13 gaps, five source issues and baseline/source metadata agree. The top review, scope and node identifiers are unchanged.
- Suggested-file ledger correspondence: all 77 mathematical signatures and their hypotheses, 84 API items and 58 tests agree with the packet. Missing advanced carriers have individual omission notes. This check does not claim every planned signature has an elaborated declaration.
- Own-node dependency DFS: 77 nodes, no cycle. The ancestor closure of raw AG2.1a contains no late automorphic-existence node, ET.6/ET.7 local correspondence or R19 input. This does not close cross-owner supplier refinements.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.0.lean`: exit 0 at the pinned Mathlib, with only five `declaration uses sorry` warnings. The active weight/polynomial/numerical prototypes compiled. Memory was checked first; no Lean language server, Lake build/update/cache operation or background compile was used.
- `git diff --check`: clean. Only the four issue deliverables changed.

## What remains and where to resume

The next action is independent review of this revision. The precise contracts are in the reader's **Exact supplier contracts** section and packet `requests`; the seven stage-specific closure lists are in `coverage.remaining`. The pass already meets target granularity, so existing supplier work alone does not require repeating it.

All thirteen remaining gaps are retained:

1. Supply the Harris–Taylor pp. 97–98 recipe `ξ ↦ (m_ξ,t_ξ,ε_ξ)`, with graded Young signs, parity and Tate normalization.
2. Prove polarized O_F-linear Kottwitz-triple effectivity, including prescribed local type and α₀; unpolarized Honda–Tate is insufficient.
3. Supply the Harris–Taylor p. 207 selected-constituent cancellation argument used by Shin Corollary 6.5.
4. Supply Harris–Taylor Proposition VII.1.8's divisibility of each irreducible Galois multiplicity, under Shin Remark 6.9's assumptions.
5. Obtain and verify CHT08 Lemma 4.1.4 and the requested global twisting-character prescriptions.
6. Supply the group-specific definite-unitary Banach, classicality and density proof cited by CH, beyond generic Fredholm/gluing machinery.
7. Create/reconcile the proposed dedicated GSp₄ owner and its exact routed contracts.
8. Prove intrinsic boundary-pair independence for the stronger target wording; the current plan uses the specified pair and transition colimit.
9. Reconcile HLTT's surjective Hecke quotient with IHG.4's injective congruence-witness API, preserving continuity and determinant identities.
10. Supply the polarized local family comparison cited by CH from Bellaïche–Chenevier §6.5, before Caraiani/Varma upgrades.
11. Keep Liu Hypothesis 3.2.10 conditional beyond its proved range until the cited unpublished realization input is available.
12. Prove the regular Hodge/de Rham input and rational-eigenvalue descent needed by CH Proposition 3.2.5; AG2.0 rationality alone does not provide it.
13. Assign/prove one generic fixed-point theorem before raw AG2.1a and ET.5 stabilization, reconciling the existing EDC.8/ET.5 boundary.

The 50 requests also specify compact ramified PEL/Igusa models, Mantovan and local realization, archimedean packet calculation, affinoid determinant continuity, effective solvable patching, dagger–rigid functoriality and weights, integral Bernstein/type operators, product nearby cycles and generic WD partition/purity APIs. Supplier roadmaps, atlas data and source-route files were not edited. No stage was promoted or declared implemented. The handoff and deliverables contain everything needed for review and subsequent work; no scratch file is required.
