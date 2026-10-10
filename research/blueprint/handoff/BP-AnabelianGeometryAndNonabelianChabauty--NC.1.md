# NC.1 planning handoff

Issue: [#6342](https://github.com/CBirkbeck/tauceti-explorer/issues/6342). Agent: Codex, session `codex-qfrsuf`. The bot confirmed the claim in [comment 6102851047](https://github.com/CBirkbeck/tauceti-explorer/issues/6342#issuecomment-6102851047), following the session's claim comment. This is a complete target-level planning pass for `AnabelianGeometryAndNonabelianChabauty:NC.1`, ready for independent review. It is not a checkpoint or a closed formalization.

## What is done

The packet, reader and suggested file agree on 46 nodes: eight definitions, three constructions, 33 theorems and two comparisons; 49 API items; 33 definition/construction tests; six planets; ten pinned baseline declaration receipts; and 28 supplier requests. Coverage is **planned**, with four explicit gaps. Every implementation status remains unchecked. No other layer or parent packet was edited.

The three endpoints are stated separately: the number-field full-profinite Isom bijection, the sub-p-adic geometric-pro-p Hom bijection, and the number-field full-profinite Hom bijection. Each fixes the full arithmetic quotient and removes only target geometric conjugation. Proper curves have genus at least two, and Hom means dominant. The packet plans the stable-log Isom route and the canonical-relation Hom route, including the finite-field recovery of addition, geometric sections, actual line bundles, tame points, integral differential limits, inertia elimination and all-cover descent.

The shared centre argument has an explicit dependency order. Local and finitely generated Galois-centre triviality precede their reconstruction theorems. A punctured-elliptic helper, derived over finitely generated p-adic fields using the generic-source form, precedes sub-p-adic Galois-centre descent. This avoids using the sub-p-adic Hom theorem to prove its own arithmetic descent input.

Current upstream ProfiniteArithmetic and AlgebraicCurves documents were read in full; their suggested files and relevant current library sources were inspected. StableReduction was also read, with the local-field and class-field interfaces checked against their current roadmaps. Generic continuous outer actions, characteristic quotients, lower-central Lie rings, stable models, arbitrary-residue-field geometry and scheme/function-field dictionaries are imported from these owners. They are not re-planned here. Existing finer supplier-node statements are recorded in `supplierInterfaces`.

## What remains before closure and packaging

1. **G1 — genuine geometric types.** Instantiate the reader's arithmetic étale groups, stable-log cover categories, Picard extensions, relative Hodge–Tate families and completed differential section spaces against their suppliers. The suggested file has a named omission ledger for each unavailable geometric declaration, API and test, including actual canonical-multiplication base change. Its native group and kernel adapters do not construct these geometric realizations.
2. **G2 — integral comparison.** Discharge the relative almost-purity and integral comparison requests to PadicHodgeTheory `R06.5` and FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.1`. Keep the integral lattices and completed integral closure of the algebraic closure. For each fixed cover level the component-group correction is uniform in the sequence index; the auxiliary extension can depend on that cover level. The generalized-Jacobian bound is separately uniform in the finite puncture set.
3. **G3 — arithmetic pro-p cohomology.** Supply the pro-p-cover effacement/cofinality and continuous twisted Z_p product comparison requested from NC.0 and the cohomology owners. Full finite-coefficient effacement alone does not establish this interface.
4. **G4 — precise supplier extensions.** Supply cofinal hyperbolic Artin neighborhoods, dominant Hom/Isom representability and finite-étale spreading, universal families, generalized-Jacobian integral comparisons, and the free/surface pro-p centre results. All requests list their consuming nodes in the packet and reader. They have been recorded as planning requests; no separate supplier issue was opened.

Three structural proposals need reconciliation before assembly: ProfiniteProPGroups, Part II for the generic centre results; InverseGaloisAndArithmeticFundamentalGroups, Part II for admissible covers with invertible local node/marking indices but unrestricted total degree; and an independent early two-step Malcev/cup-relation portion extracted from NC.2. The last must precede both NC.1 and the reconstruction-dependent remainder of NC.2. Its existing graded Lie-ring input is reused, and the present same-part node graph is acyclic. This proposed split has not been applied to the atlas.

FunctionFieldArithmetic's existing function-field reciprocity interface is needed for finite-field tame reconstruction. It is outside the 94-roadmap Caraiani–Newton tier list, so the maintainer must place this supplier below NC.1 before upstream packaging. Number-field class field theory does not replace it. No mathematical ownership was moved from a higher-tier roadmap in this pass, and no current Tau Ceti roadmap was edited.

## Sources and corrections

All repository statements and proof plans use original wording with theorem, section and page locators. No source passages or source files are included. Public versions and their exact hashes are in `sources` and `sourceVersions`:

- Mochizuki 1996, published pp. 571–627: introduction and §§1–8, Lemma 9.1/Theorem 9.2, and §10. The independent ordinary-local results after Theorem 9.2 are outside this chain.
- Mochizuki 1999, author-copy printed pages: introduction and §§0–15, plus Theorem 16.5 and its remark on pp. 85–87. The higher-dimensional and subsequent results are outside this curve-only part.
- Tamagawa 1997, published version: the point/decomposition and centre inputs of §§1–2, relevant finite-field invariants in §3, and the complete finite-field tame reconstruction chain in §4, pp. 163–175. The subsequent number-field affine reconstruction is not used. Ambiguous extracted notation was checked against rendered pages.
- Mochizuki 1995, Hurwitz compactification author copy: §§3.3–3.13, printed pp. 18–25, for the precise admissibility and log-lift contract.
- Mochizuki's December 2012 and June 2019 comments were read; the August 2017 Hurwitz comments were checked while investigating the local exponent bound.

Three findings are recorded with the version read and correction search: the dominant-locus qualification in the 1999 Hom-scheme argument; the author-corrected incidence-kernel image in the 1996 paper; and the strict node-exponent bound in the 1995 author copy, corrected to the weak bound already used in its following proof. The third is not attributed to a publisher edition that was not collated. Independent proofs of the requested generic supplier extensions remain supplier work; no additional unread source is needed to locate the three NC.1 endpoints.

## Validation and resume point

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.1.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.1.lean`: exit 0, with only declaration-uses-`sorry` warnings. Checked in the existing shared build at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The imported Tau Ceti pro-p source was compared with pinned `f790474821cf4256814db967cb154e7af3d0c369`; its SHA-256 matches the pinned source receipt.
- The Lean file elaborates five native object adapters and 15 example signatures, with 24 of the packet's 49 API names typed. The remaining 25 API items, 18 tests, and all 35 geometric theorem/comparison signatures are explicit comment-ledger obligations. Compilation checks their native types, not the mathematical proofs or the omitted geometry.
- Source findings were additionally checked through `check_errata.py` using a scratch `errata-v1` wrapper of the packet's `sourceIssues` and `sourceVersions`: no errors. The packet itself retains `blueprint-v1` and is validated by `check_blueprint.py`.
- Reader/packet/Lean name coherence, unchecked statuses, the 46-node same-part DAG, and private-path/banned-word checks passed. The four deliverables pass the intake file check and the staged diff passes the whitespace check.

The independent reviewer should start from the three endpoint contracts and trace the two proof routes, then verify the precise supplier boundaries and centre ordering. A closure follow-up starts with G1–G4 and the structural proposals above; it should preserve the node ids, qualified hypotheses, original-wording source receipts and discriminatory tests. The definitive reader and packet contain all information needed to resume; no scratch file is required.
