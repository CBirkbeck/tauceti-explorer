# BP-HabiroNumberFields--HB.1

Agent: Codex, session `codex-NVgsZd`. Issue: #6493. This is the complete target-level planning pass for `HabiroNumberFields:HB.1`, continuing the accepted BP-HabiroNumberFields parent. It is a finished blueprint submission, not a checkpoint. The stage is **planned**, with the specific supplier work below; no implementation is claimed.

## Delivered

- `research/blueprint/packets/HabiroNumberFields--HB.1.json`: part `HB.1`, scope exactly the one assigned stage, status `complete`.
- `research/blueprint/readmes/HabiroNumberFields--HB.1.md`: the retained conventions and target interfaces, seven added proof inputs, exact hypotheses, dependencies and acceptance cases.
- `research/blueprint/suggested/HabiroNumberFields--HB.1.lean`: four active signatures with placeholder proofs and three named mathematical supplier contracts in comments.

The packet has **7 new nodes: 2 lemmas, 2 applications and 3 theorems**. It imports all 16 HB.1 parent nodes by their existing IDs. There are **0 new definition/construction API items and 0 new definition unit tests**, because no definition or construction is added; the parent API/tests remain imported. Every new result has acceptance cases. There are **2 new planets**, making five together with the parent’s three, and **28 verified baseline declarations**. There are **2 gaps and 5 requests**.

The finite obstruction argument distinguishes Picard torsion from the Picard quotient. The ordinary-unit argument lifts through injective exact maps without averaging and uses the valuation image lattice D, retaining D/n rather than assuming saturation in the full coordinate group. The direct unit-character calculation restores Mathlib’s omitted logarithmic coordinate, uses the actual Galois place action, and consumes the pinned lattice-basis and stabilizer declarations. It supplies the parent equivariant-rank gap without adding a duplicate general Dirichlet theorem. The residual comparison retains the μ₃ contribution and explains the integral-to-p-adic rank step.

## Red-team findings

**RT-AREA-ktheory-2/14:** Keune is already a node at `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection` in `ArithmeticKTheory--N.1.json`. This packet imports it directly and adds the exact Pic[n] obstruction and unit-lifting applications. It never substitutes an ordinary K₂–étale comparison for the twisted Pic/n injection. The original proof and exact finite-level hypothesis translation remain source-gapped at N.6 and are propagated here.

**RT-AREA-ktheory-2/17:** V.3 owns every integral Bloch convention/comparison, including the degenerate symbols and published Lemma 2.2. The packet’s supplier interface imports the updated published V.3 IDs, and its explicit link records V.3→HB.1. The parent already has a direct convention dependency; assembly must use the updated published coefficient exports there. HB.1 contains no new Bloch construction. RS-10 is now accepted, contrary to the issue text’s historical description; the accepted wording is acknowledged, and a rescope proposal makes the ownership unambiguous. PLAN-HABIRO §4.2 and the stage description are outside this job’s allowed paths and must be reconciled by their owner.

**RT-AREA-ktheory-2/18:** Generic Soulé finite classes and products remain owned by M.8 under RS-08. A precise request and split proposal specify an early prefix requiring M.7, consumed by HB.1, HB.2 and D.2. This packet adds neither a fictitious stage ID nor an edge from the whole late M.8. HB.1 retains only the c_ζ specialization and inverse-character identification from the parent. Acceptance of that prefix and substitution of its real node IDs remain an explicit gap.

## What is supplied and what remains

The equivariant-unit-rank proof chain is planned directly from the baseline. All stage targets are mapped in `targetCoverage`; definitions and already accepted results are imported rather than copied. The new `refines` records indicate the inputs assembly attaches to the parent ordinary-unit, rank and counting targets.

The two unresolved gaps are:

1. At N.6, obtain/read Keune’s original K-Theory 2 (1989), 625–645, DOI 10.1007/BF00535049, and verify the exact hypotheses and injection used at finite level. The read CGZ published Lemma 3.5 supplies its consequence but does not replace this verification. The downstream applications are explicitly conditional on the supplier contract.
2. Accept the early M.8 split and provide its actual finite-Chern/compatibility/product node IDs. Replace the corresponding inherited requests without importing all of late M.8.

Five precise requests are made to existing owners: LocalFieldsRamification Layer 3’s Eisenstein criterion; NumberFieldArithmetic Layer 5’s completion/decomposition dictionary; M.3’s equivariant étale Kummer sequence and algebraic Selmer comparison; ProfiniteCohomology Layer 9’s field Kummer naturality; and the early M.8 prefix. Keune uses its existing finer node, not another request to the whole N.6 stage.

Assembly also replaces the parent’s ambiguous complex χ notation at composite n by genuine complex characters satisfying the stabilizer conditions. The modular χ continues to mean Mathlib’s root-exponent map. Preserve the corrected p=3 count and the fact that an eigenclass lift is not an eigenunit representative. No HB.2 regulator or comparison theorem is developed here.

## Validation and Lean

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.1.json --index <pinned declaration index>` reports **0 errors and 0 warnings**. Source-version records also pass `check_errata.versions_checked`; the standalone `check_errata.py` command is for errata-v1 files and is not the validator for a blueprint packet. The seven proposed declaration names all occur in the suggested file. New node IDs are disjoint from the accepted parent, and the combined planet count is five. The refinement-overlay prerequisite audit and `git diff --check` pass.

`lean-check research/blueprint/suggested/HabiroNumberFields--HB.1.lean` elaborates successfully with only four expected placeholder-proof warnings. Its active declarations are:

- `finiteEndomorphism_torsionKernel_eq_zero`;
- `eigenclass_existsUnique_lift`;
- `cyclotomic_primePrimes_fixed`;
- `oddCharacter_unitMultiplicity`.

The shared check uses the exact pinned Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; the file imports Mathlib modules only. Tau Ceti baseline declarations were separately read at `f790474821cf4256814db967cb154e7af3d0c369`. No language server or Lake build/update/cache operation was used.

The three comments named `picard_inverseCyclotomicEigen_torsion_eq_zero`, `etale_inverseCyclotomicEigen_unitLift` and `unit_inverseCyclotomicEigen_torsionSequence` are mathematical contracts, not elaborated Lean theorems. Replace them with real signatures when their K-theory, étale-cohomology and residual eigenspace interfaces exist. Compilation proves no planned result and does not certify these comments. No missing object is replaced by a proposition-valued carrier.

## Sources and continuity

The public source URLs, hashes, access date 2026-10-06, and exact sections read are in the packet. The published CGZ PDF was read at §§2.4–2.6 and §§3.1–3.5, with §§3.1–3.5 read in full. Its arXiv v3 was collated with the parent. Sutherland’s MIT 18.785 Fall 2021 Lecture 24, *Artin reciprocity in the unramified case*, Definitions 24.4–24.5, Theorem 24.6 and Lemma 24.7, pp.2–4, was read for the unit-module description. The packet records published collation of inherited findings E1, E2, E6 and E7 without copying an independent-review verdict into this submission.

Keune’s original publisher DOI/PDF could not be accessed and no public author copy was obtained. No original theorem number or proof is guessed. Re-fetch the recorded public sources when needed; PDFs and extracted text are scratch-only and are not committed.

The reviewed HB.1 library audit, parent coverage/gaps, N.6 supplier, updated V.3 conventions and accepted RS-08/RS-10 records were read. Multiquadratic and ArithmeticDirichletSeries were read in full as the two upstream models. The scratch directory is disposable; this note and the packet contain all continuity information required by review or a follow-up.
