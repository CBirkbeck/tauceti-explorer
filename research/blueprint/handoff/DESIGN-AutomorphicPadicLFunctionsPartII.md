# DESIGN-AutomorphicPadicLFunctionsPartII — issue #3350

Codex, session `codex-ucfSVA`. This is a complete target-level planning submission, not a checkpoint and not a formalization claim. The confirmed claim is [comment 6260437264](https://github.com/CBirkbeck/tauceti-explorer/issues/3350#issuecomment-6260437264).

## Deliverables and coverage

The roadmap definition, packet, reader and suggested file cover the critical Hecke-value direction. There are 44 nodes: 13 definitions, 11 constructions, 19 theorems and one comparison; 72 API items, 73 definition/construction tests and 35 planets. Every definition/construction has at least three tests. Seven native Mathlib declarations are cited after reading their actual statements at the pin. The packet uses Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

All nine stages KV.0–KV.8 are **planned**. None is declared mathematically closed. The complete status means every target has its statement, hypotheses, construction/proof spine and a prerequisite chain ending at an existing declaration, an existing owner’s node, an exact supplier request or a recorded mathematical obligation. Implementation status remains unchecked throughout.

All 52 Kings–Sprang routed items have a ledger to their target nodes. Generic tensor, Poincaré and ordinary-trivialization theory stays in the actual AbelianSchemesAndArithmeticModuliPartII P0–P4 packet, replacing the obsolete PoincareBundle routing alias. Generic CM Serre tensors and Hodge decompositions remain in CM.0–CM.1. The current DifferentialGeometry roadmap already owns generic forms, integration and de Rham theory. These are not planned again.

The ten independent BKO items are assigned, item by item, to the four-layer **NonordinaryCMSpecialValues** split proposal in `restructure`. Its direction is NonordinaryCMSpecialValues → AnticyclotomicLocalUnits → InertAnticyclotomicCMMainConjecture, plus the direct first-to-last edge. It imports the proposed shared elliptic-unit foundation from CMAllPrimeMainConjectures rather than creating another one. Rubin’s decomposition and dependent p-adic L-function do not move here. No other roadmap or queue files were edited.

## Mathematical obligations and supplier interfaces

Three obligations remain, each explicitly traced to consumers:

- **G1:** prove the complete algebraic-residue/current/orientation/p-adic-coordinate sign comparison, incorporating the corrected contraction and binomial signs. Local coefficient checks do not settle the final unsigned interpolation convention.
- **G2:** prove bounded integral desmoothing by uniform Kummer congruences or integral Iwasawa-algebra divisibility. Individual integral character values do not suffice; the finite C_p counterexample is included.
- **G3:** prove integral full-unit descent for these residue classes at nonunit torsion indices. The integral cap is first defined for torsion-free groups; normalized extension divides by the torsion order only where valid.

Ten precise requests are recorded: SF.2 inverse-limit/affine/Borel comparisons; C1 bundle-valued current topology and local resolution; C5 trace/integration compatibility; R07.1 ordinary finite-flat pairings; measure L2 finite-free integral Amice naturality; measure L3 bounded localization/divisibility; PS.0 Hecke-motive period operations; PS.1 criticality and CM periods; L0’s explicit Weil admissibility classification; and the existing ReductiveGroups Layer 4 weight-decomposition interface. Existing supplier nodes are imported directly, not replaced with stage requests.

The independent review should verify all source corrections, especially additional findings E9–E13: completed versus uncompleted residues; the desmoothing bound; torsion transfer; the tame-congruence unit kernel; and the missing moving-torsion-orbit hypothesis in Lemma 3.25. These findings concern the preprint actually read, not the unread published PDF. The reader and packet use corrected/restricted targets and retain the unresolved consequences as G1–G3.

## Sources and baseline checks

Read Kings–Sprang arXiv:1912.03657v4 (14 September 2024, 85 pages), §§1–5 and the relevant appendices, with its source TeX used to disambiguate displayed fractions and indices. Every locator is preprint pagination. The Annals 202 (2025), 1–109 publication metadata was verified, but the journal PDF could not be read. No assertion is made that its text retains the preprint findings. E1–E8 recheck the extraction’s findings; E9–E13 add independently checkable observations. The arXiv history, journal page and author publication list yielded no linked correction.

Read the published BKO author-repository PDF: introduction pp.943–944, §3 pp.950–954 and §6 pp.961–962. Finis, Kato and Deligne results are specified through these sources and explicit supplier interfaces; their original sources are not claimed as read. The private-library index was checked. No cleared de Shalit copy was listed, and no other copy or passages from restricted books were used.

Read the reviewed L0/L3/L5 library audit, actual pinned Mathlib statements, and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Checked the post-snapshot roadmaps and current library for overlap. Read GlobalNumberFields and ArithmeticDirichletSeries readers, and relevant ReductiveGroups and DifferentialGeometry readers/signatures. Public Zulip/Mathlib PR searches provided design leads only; native source statements determine the cited interfaces.

## Validation and submission

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctionsPartII.json --index <pinned-declaration-index> --json`: **zero errors and zero warnings**; all 44 nodes and nine stages resolve.
- `lean-check` on the suggested file: **compiled successfully at the pins**, with only 25 proof-placeholder warnings. The file has 162 lines, eight light real-bodied coordinate definitions and no substitute carriers, data placeholders or heavy constructions. The full reader carries the unstated heavy targets.
- Exact integer exterior-algebra calculations in dimensions 1–5 check the local contraction recurrence and top coefficients. These are informal diagnostic computations, not Lean proofs of the global comparison.
- Reader/packet consistency, routed coverage, planet limits, stage references, JSON/file intake and whitespace checks are checked before submission.

The next step is independent review of this complete plan, followed by the mathematical obligations and supplier refinements above. No second job is claimed by this session.
