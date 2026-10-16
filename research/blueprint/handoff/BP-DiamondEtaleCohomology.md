# BP-DiamondEtaleCohomology — codex-OTJOrW

Issue #9919. Agent: Codex. Date: 16 October 2026. This is a complete target-level planning pass, not a claim of mathematical closure or formalisation. Every layer C0–C9 remains **planned**, with its precise remaining obligations. Every declaration retains unchecked implementation status.

## Existing work and the continuation

The issue requests a whole-roadmap packet, but two independently accepted parts, their accepted assembly and an accepted package already exist. They must not be replanned or duplicated:

- `packets/DiamondEtaleCohomology--C0.json`: 119 nodes, C0–C7; independent review accepted 7 October 2026.
- `packets/DiamondEtaleCohomology--C8.json`: 65 nodes, C8–C9; independent review accepted 6 October 2026.
- `handoff/ASM-DiamondEtaleCohomology.md` records the assembly; `packages/DiamondEtaleCohomology` is the separately accepted package. Neither the part packets nor that package is edited here.

The new `packets/DiamondEtaleCohomology.json` has `part: null`, imports all 184 stable node identifiers, supplies a coverage manifest for each layer, and adds exactly two lemmas. Its `targetCoverage` maps all seven additional source assignments to their existing declarations or, for FS I.11.1, to an open-question record. The updated reader contains the entire 186-node specification.

| Layer | Nodes supplied | Status |
| --- | ---: | --- |
| C0 | 24 | planned |
| C1 | 12 | planned |
| C2 | 14 | planned |
| C3 | 11 | planned |
| C4 | 18 | planned |
| C5 | 9 | planned |
| C6 | 7 | planned |
| C7 | 25 | planned |
| C8 | 52 | planned |
| C9 | 14 | planned |

Combined totals: **21 definitions, 20 constructions, 94 theorems, 45 lemmas, five comparisons and one application; 256 API items, 176 unit tests and 44 planets; 47 distinct baseline declarations**. The new packet alone has two lemmas and nine baseline records; one of those records overlaps the accepted parts. It adds no definitions, API items, tests or planets to their inventories.

The packet's four `nodeRefinements` are explicit records for existing imported declarations. The reader already incorporates them. They are not new identifiers, and the atlas scripts do not automatically apply this custom field. A subsequent assembly or promotion reconciliation must apply these four records to the imported declarations while retaining their identifiers; do not silently regenerate the reader from the unrefined parts. The manifest and records make that operation reviewable without editing another job's files in this submission.

## Mathematical refinements

1. **C7/perfect-local-system-dualizable** names the duality needed by C9. For commutative coefficients and a locally spatial diamond, an étale-locally constant complex with perfect values is dualizable; its internal dual is another perfect local system and the canonical tensor–Hom map is an equivalence for arbitrary target complexes. This imports the two P7 perfect-module duality nodes, uses C5's étale projection formula for restriction of internal Hom, and descends the comparison through C2. It does not assume internal Hom commutes with arbitrary pullback. C9/perfect-local-system-compact now cites this lemma and states one common cohomological bound for all sheaves on the spatial target and every quasicompact separated étale test.
2. **C8/compact-procyclic-field-action** supplies the compactness step in ECD Lemma 21.17. Factorial recurrence and the ultrametric estimate make integer orbit maps uniformly continuous for the profinite uniformity. Extend into the complete field, prove the ring and action laws by density and isometry, and use negative powers to establish surjectivity of the limiting automorphisms. The image is compact in the pointwise function topology. Identify it with a closed-normal quotient of the profinite completion to obtain profiniteness; total disconnectedness is not inferred from an arbitrary continuous image. Nonnegative powers have the same closure. No local compactness of the field is needed.
3. **C8/wild-automorphism** now normalizes the residue homomorphism uniformly: maximize the displacement norm over the compact pro-ℓ Sylow subgroup, choose a maximizer, and divide every displacement by that one element. The resulting residue map is defined everywhere, additive and continuous. The pinned pro-p discrete-image theorem and coprime element-order theorem rule out a nontrivial image in residue characteristic p≠ℓ. This supports the inherited E3 compact-closure correction without asserting another unverified source error.
4. **C8/finite-topological-generators** imports the generic algebraic-closure completion helper from its existing P4 owner. Conrad's coefficient/root approximation proof works in every characteristic. The pinned `IsAlgClosed.of_denseRange` assumes characteristic zero, so it cannot discharge the characteristic-p use. The precise general helper is a P4 request; it is not replanned in C8.
5. **C8/analytic-dimension-bound** distinguishes Huber's read chain/rank reduction from the remaining valuative transcendence and completion comparisons. Huber 1.8.5(i), including its proof, is now read. It cites Bourbaki VI.10.3 Corollary 1; that proof and the modified-degree comparison remain obligations.

Two existing exports retain one proof owner: C8/strictly-disconnected-acyclic exports C0/std-etale-acyclic, and C9/bounded-filtered-compactness specializes the C7 restricted-compactness theorem. The early C8 point-quotient nodes precede C7's filtration; the support reduction follows that filtration.

## Ownership and current upstream

**RT-AREA-padic-1/11:** preserve the accepted parts' explicit first option. C4 owns ECD §18, including properness and canonical compactification. Correct the RS-05 owner entry to C4; D5's keep reason must describe ECD §§11–13, while effective descent belongs to D3, not D2. D5 supplies spatial geometry to C4, and S0/S1 consume C4's compactification. The accepted RS-05 file still needs the maintainer's reconciliation; this job does not edit it. The packet retains the concrete proposal, rather than describing the incorrect owner as implemented. C5 imports the existing H1 henselian construction instead of developing another one.

Read current TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and searched current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to the pins. Current AdicSpaces and DGAInfinity were consulted for the geometry/category interfaces. ProfiniteArithmetic Layers 0–1 already own generic profinite powers and procyclic group calculus: C8 adds only the field-action compactness argument. DGAInfinity Layers 5–6 already own the abstract compact/thick-generator theorem. LocalGaloisGroups and LocalFieldsRamification's discrete local-field statements do not replace C8's arbitrary value-group and residue-field arguments. No existing Tau Ceti roadmap is redeveloped here.

`data/library-coverage.json` has no C0–C9 entries. The DiamondEtaleCohomology section of AUDIT-36 was read as an unintegrated lead (the audit is pending review), alongside the accepted part reviews. Generic sites, ordinary derived categories, spectral topology and group cohomology remain imports. All nine baseline declarations newly cited here were read at the pins. Mathlib's profinite completion and uniform completion APIs are generic inputs; the proof sketch explains their field-action specialization. Tau Ceti's closed-normal quotient theorem supplies total disconnectedness, and its pro-p discrete-image theorem allows an infinite residue field.

## Remaining gaps and supplier contracts

The reader's **G1–G11** and the packet's `gaps` have matching text and named consumers. They are the place to resume:

| Gap | Required work |
| --- | --- |
| G1 | E46: higher v-pullback vanishing in degree ≥2; repair the Čech or hypercover matching-object argument without assuming Lemma 14.5 preserves the needed finite limits. |
| G2 | E11: perfect-constructible v-descent for non-noetherian coefficients through the strictly totally disconnected quotient; the noetherian specialization has its separate route. |
| G3 | General characteristic-independent algebraic-closure completion helper at P4 and its field-generating-degree application. |
| G4 | Finite-witness cardinal bounds, valued amalgamation, completed-residue-field and point-choice independence, and cutoff independence. |
| G5 | Huber's chain/rank and Bourbaki transcendence inputs, with completion/algebraic-closure and modified-degree comparisons. |
| G6 | Temkin 2010 Lemma 6.3.2's primitive-field perturbation proof and its use in the finite-degree comparison. |
| G7 | General residue/tame interiors of ECD 21.16: infinite Galois comparison, Brauer-to-cd criterion, tame-character topology and finite-adele/compact-lattice arguments. Compact procyclic closure and uniform wild residue normalization have explicit arguments here. |
| G8 | Valuation independence, cardinal-to-extended-natural conversion, algebraic-extension torsion and completion immediacy. |
| G9 | Scheiderer's quasi-augmentation, adjunction and descent proof; KST's specialization-chain account alone does not supply it. |
| G10 | General analytic Zariski–Riemann closure and partial-properness comparison, beyond the noetherian supplier scope, including infinite-rank conversion. |
| G11 | E2 finite-window/left-completion arguments, E3 enhancement/cutoff comparisons and application of DGAInfinity's compact-generator theorem. |

There are **25 requests**, not 25 new roadmaps. Their full statements and consumers are in the packet and reader. They retain the accepted parts' contracts for D0 coherent sites, D3 descent/valuative geometry, D5 spatial localization/field points, E2 completion/descent, E3 presentability/adjoints/compactness, SF.2 scheme base change, ProfiniteCohomology Layers 0/10/11, ProfiniteProPGroups Layers 2/3/6, ArithmeticGaloisDuality R02.1–R02.2, AdicSpaces, AdicEtaleGeometry A2 and DGAInfinity Layer 6. The stage-level C7 dualizability request is discharged by the named lemma. P4's exact completion helper replaces it in the request count. The pro-p request is narrowed to avoid asking again for the pinned discrete-image theorem.

FS Problem I.11.1 and ECD Question 21.4 remain questions. No equality of the three dimension invariants, or infinite-degree intermediate-field monotonicity, is assumed. CS17's formulas retain general analytic partial properness and relative residue transcendence degree.

## Sources and access

The accepted parts and their independent reviews supply the inherited source readings; this submission does not claim to have freshly read every section of ECD or every inherited supplier proof. Fresh readings are recorded with exact locations in the packet:

- ECD arXiv:1709.07343v4: 20.14, pp.119; 20.17, pp.121–122; 21.16–21.17, pp.126–127; assigned running text after 17.2 and 17.5, pp.97–98; Remark 18.2(b), p.101.
- Caraiani–Scholze, Annals 186 (2017), Propositions 4.2.19 and 4.2.21, Remark 4.2.20, pp.711–712.
- Fargues–Scholze arXiv:2102.13459v4, §I.11, pp.41–42.
- Conrad, *Completion of algebraic closure*, all three pages; Theorem 1.1 and §2 give the argument used here.
- Huber, *Étale cohomology of rigid analytic varieties and adic spaces* (1996), §1.8, Definitions 1.8.1–1.8.4 and Lemma 1.8.5 with proof, pp.90–91, read in the maintainer-cleared edition in place. No file or passage was copied.

Public PDF versions and checksums are in the packet/reader. The fresh source descriptions and mathematical statements are in our own words; no source excerpts are stored in these deliverables. Unread source boundaries include Bourbaki VI.10.3 Corollary 1, Temkin 2010 Lemma 6.3.2, Serre II.3.1 and Scheiderer §§2–4. No uncleared book copy was used. Scheiderer's previously reported inaccessible PDF and the alternative Stacks proof remain distinguished from reading the required quasi-augmented proof.

## Lean shape and validation

The former assembled suggested file exceeded the current 5,000-line limit and used surrogate carrier structures with admitted data definitions. It is replaced with **127 lines** using five individual imports and actual pinned normed fields, ring automorphisms, function topology, continuous group actions and `TauCeti.IsProP`. There are three milestone theorems and three examples. All 186 targets and every definition API/test remain in the reader. Targets whose geometric/enhanced carriers are absent are explicitly listed there; the prototype does not develop those carriers or assume the target conclusions in a structure.

Validation on 16 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondEtaleCohomology.json`: **0 errors, 0 warnings**, with the available pinned declaration index. The checker counts the two new nodes; combined statistics above include the imported parts.
- `lean-check research/blueprint/suggested/DiamondEtaleCohomology.lean`: **exit 0**, six warnings, all the expected `declaration uses sorry` warnings; no other warnings or errors. No Lean server or library build was started.
- Consistency check: 186 unique reader declarations agree with imported/new node IDs and kinds; all 256 API names and 176 test names occur; every definition/construction has uses, API and at least three tests; all ten coverage manifests match their declarations. The explicit node dependency graph, with the four refinement records applied, is acyclic. Stage-level supplier requests and the eleven gaps remain open contracts.
- `git diff --check` passes. Only this job's four deliverables are changed.

The next independent reviewer should assess the two new arguments and four refinements against the stated supplier contracts, then reconcile them with the accepted package before upstream use. A follow-up must discharge G1–G11 and the named requests before any layer can be called closed. Scratch material is disposable; this handoff and the source/version registers contain everything needed to resume.
