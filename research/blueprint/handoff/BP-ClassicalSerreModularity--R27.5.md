# Handoff: BP-ClassicalSerreModularity--R27.5

Agent: Codex. Session: codex-2DPwc2. Issue: #9929. This is a completed target-level planning pass, not a checkpoint. Packet status is `complete`; the sole scoped stage, `ClassicalSerreModularity:R27.5`, is `planned`, not closed. Every implementation status is `unchecked`.

## Delivered

The four issue deliverables contain three theorem nodes, zero new definitions or constructions, zero definition API items, zero definition unit tests, three planets and five pinned baseline declarations. The 55-line suggested file contains five finite-matrix acceptance examples. These are separate from definition unit tests and do not formalise the arithmetic endpoints.

Two new node IDs are `R27.5/characteristic-two-closure` and `R27.5/even-conductor-closure`, with the full ClassicalSerreModularity prefix. The integrated ID `R27.5/hypothesis-H-and-theorem-9-1` is retained and narrowed to qualitative Theorem 9.1. Strong prescribed-level/weight modularity stays in R27.6.

Part R26.1 no longer has an R27.5 coverage record. Part R27.3 already supplies the weight-two claim, D1 and Dr-for-r-at-least-two milestones. This packet reuses their three IDs rather than copying their declarations. The reader and `importChecks` specify the corrected proofs and precise supplier contracts that their applications require.

The main checks are the coefficient-3/local-2 application of Theorem 5.1(4) to the first system’s characteristic-three residual member; the chosen lattice in the second system; conditional coefficient-prime almost strict compatibility; and the proof order D1 → characteristic two → higher dyadic conductor. Weight four of the original characteristic-two input is handled by Theorem 3.4 with r=1. The newly constructed dyadic residual member instead has weight two.

The local finite-flat obstruction is expanded into a concrete proof plan: an odd-valuation quadratic Kummer quotient over absolute odd ramification index e has discriminant exponent 2e+1 and Serre upper break 2e. Fontaine’s killed-2 bound, shifted from his numbering by u=v+1, gives triviality above Serre break 2e−1. This supplies the contradiction at e=3, with the actual extension class preserved. Ramification index 3 is distinguished from total degree 6.

## Confirmed finding and source correction

**RT-AREA-langlands-2/20** is handled by a single owner: `GL2ModularityLifting:R22.6/hypothesis-h`. That owner derives H from Kisin, including the potential Barsotti–Tate comparison and even finite-order determinant normalisation. R27.5 imports H. The packet has one owners entry, the exact replacement keeps text for RS-06’s R27.5 entry, and the R22.6 → R27.5 link. The maintainer must apply that proposal; RS-06 and other packets were not edited. RS-08’s owner is preserved.

Existing source issue `ClassicalSerreModularity/E3` is retained under its existing identity, in our own words: the second system lifts the characteristic-three residual member, and the cubic type uses Theorem 5.1(4), coefficient-prime compatibility and the integral Barsotti–Tate input. No new review of E3 is claimed and the older independent review is not copied into this packet. No new source issue was found.

## Three requests and three remaining gaps

1. **Q1/G1, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6.** Export the odd-ramification-index non-finite-flat consequence for très-ramifiée dyadic representations, with coefficient extension, Kummer quotient detection and the numbering conversion above. Existing R07.5 only supplies the more restricted dyadic dichotomy. Put the new consequence above R07.5 and the Fontaine inputs, rather than creating an R07.5 → R07.6 stage cycle.
2. **Q2/G2, ArithmeticGaloisRepresentations:R01.3.** Supply the conductor-at-most-one triangular local shape in characteristic three, and the scalar-unipotent removal by a finite global character unramified outside 2. Import current ClassFieldTheory for the local/global character extension. Actual local inertia and its invariant space must be retained.
3. **Q3/G3, AlgebraicModularFormsAndSerreWeights:R15.6.** Supply finite-character twist/untwist invariance of the qualitative residual modularity witness, including coefficient fields, Teichmüller lift, tensor/Galois-polynomial compatibility and reduction of lattices. Current ModularForms Layer 9 already owns the classical twist and Layer 4A its primitive associate: import them. Pair the result with the independent R15.4 numerical weight recipe. An already-modular small-weight theorem cannot normalise an input before modularity is proved.

Follow-up replaces those stage references with actual supplier node IDs, checks their contracts, and then rechecks closure. Assembly preserves the three internal milestone IDs, uses this packet’s two endpoints and narrowed aggregate, and reconciles the H owner. There is no unplanned R27.5 target and no need to claim another job in this run.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.5.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R27.5.lean`: **exit 0**, exactly five expected warnings for the unproved examples and no others. The placeholder proofs are confined to the suggested file. Available memory was 89 GiB before the run; no private build or language server was started.
- A read-only dependency traversal, preferring integrated declarations and replacing this packet’s three nodes, visited 1,068 declaration nodes, found **no cycles** and no R33 nodes. Stage leaves and requested interfaces remain open; this is a graph check, not proof closure.
- All three reused milestone IDs resolve. Only the two endpoint IDs are new; the aggregate keeps its integrated identifier. The three planets satisfy the name and count limits.
- The five cited baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The existing newform supplies only the target-side carrier.
- `intake.py check-files` reports **4 files, 0 problems**; `check_sorry_data.py` passes. Whitespace and scope checks cover only this job’s four deliverables. No application, atlas, other packet or upstream file is changed.

## Reading and upstream boundaries

Public author copies read: KW I Theorem 3.4, Theorems 4.1/5.1, Lemmas 6.1–6.3, §8.4 and §9; KW II §§3.3.1, 3.3.3 and 10.3.1–2; Serre 1987 §§2.4.7, 2.6–2.8; Fontaine 1985 §1.2(i) and Theorem 1 in §2.1, with page images; Kisin’s author DVI Theorem 0.1. URLs, editions, pages, read date and hashes are in the packet. The journal pagination of the author copies was not compared. No inaccessible book or missing primary-source proof is silently substituted for an imported theorem; the suppliers retain their own proof obligations.

The current read-only upstream documents checked were ModularForms (including its twist and primitive-associate contracts), LocalGaloisGroups, ProfiniteArithmetic, LocalFieldsRamification and IntegralHeckeAndGaloisDeterminants, with the sections recorded in the packet. The current Tau Ceti library was also searched. Existing Galois/Kummer theory, reciprocity, ramification, form twists and newforms are imported. No upstream roadmap is replanned or changed. The three main theorem signatures remain in the reader because their arithmetic interfaces are absent at the pins; `suggestedCoverage` records each omission explicitly. No private paths, source scans or extracted passages enter the repository.
