# Handoff: ASM-GL2AutomorphicRepresentationsAndTransfer (issue #231)

This job assembles the roadmap *GL₂ Automorphic Representations And Transfer* (`GL2AutomorphicRepresentationsAndTransfer`), titled “Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer” by both parts, from its two parts:
- part R16.1, layers R16.1–R16.6, R17.1 and R17.2, 55 nodes, written by BP-GL2AutomorphicRepresentationsAndTransfer--R16.1 (issue #733, Codex) and reviewed by REV-GL2AutomorphicRepresentationsAndTransfer--R16.1 (issue #410, Codex, 7 October 2026);
- part R17.3, layers R17.3–R17.6, 57 nodes, written by BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 (issue #734, Codex, PR #6723) and reviewed by REV-GL2AutomorphicRepresentationsAndTransfer--R17.3 (issue #411, Claude, 6 October 2026).

Both reviews corrected their packet in place and returned **accepted**; both packets are `complete`.

Worker: Claude, session claude-9TOgbh. I took no part in either part or in either review.

## Files

- `research/blueprint/readmes/GL2AutomorphicRepresentationsAndTransfer.md`: the full roadmap document. It is new; no roadmap-level document existed.
- `research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer.lean`: the two suggested files joined into one. It is new.
- `research/blueprint/handoff/ASM-GL2AutomorphicRepresentationsAndTransfer.md`: this note.

The part packets are not deliverables of this job: `queue.json` lists only the three files above, and the intake refuses any other path. They are unchanged. The edits they need are listed below for the jobs that own them, as earlier assemblies did (ASM-PrismaticCohomology, ASM-EllipticRegulators, ASM-GL2ModularityLifting). No node’s mathematics, no review verdict and no packet field was changed, so no node needs a re-review because of this job.

## What was done

**The roadmap document** is generated from the two packets as their reviews left them, so it agrees with them node for node. Both reviews asked for their part reader to be regenerated from the corrected packet (R16.1: counts, the added existence node, corrected locators and tests, CFT Layer 9, ModularForms Layer 8G, AS.2, the finite/archimedean supplier split, the conditional quaternion example; R17.3: every node section). Because every node entry is generated from the packets, all of these are current here; no text of the part readers is reused.
- **Coverage.** All 112 nodes with every statement, hypothesis, proof step, use, API item (81), unit test (66), acceptance check, prerequisite, source citation (251: locator, excerpt, match) and proposed module; all 67 requests (59 to other roadmaps, 8 inside the roadmap), 14 gaps, 15 source issues with their review verdicts, the 12 coverage records, 4 structural proposals, part R17.3’s layer links and interface exports, the 21 pinned declarations, both source ledgers with versions and hashes, and both packets’ records (summary, extension, restructuring basis, audit, review notes).
- **Scripted check.** 4,487 strings of the packets (every field above) occur in the document verbatim.
- **New sections.** Purpose; scope, granularity and status; boundaries (the upstream hand-off from ModularForms Layer 2, suppliers, consumers, red-team findings, the library audit, ownership); conventions with a dictionary between the parts; sources; layer overview; dependencies between the layers; how to read a node entry; the suggested Lean file; a written overview of each of the twelve layers; the records; what the blueprint does not claim.
- **Notation.** The parts share notation except in three places, which the Conventions dictionary fixes. (1) Part R17.3’s “arithmetic normalisation” and rec^{arith}: in its Hecke statements it is a_v = t_v, b_v = q_v·s_v, whose Satake class has the eigenvalues of recᵀ(π_v)(Φ); where it compares with Galois representations at an arithmetic Frobenius it is part R16.1’s rule of inverting the Frobenius on the whole Weil–Deligne datum (rec(π)∨ ≅ rec(π̃)). No R16.3 node states rec^{arith}. (2) T₁, T₀ (part R16.1) are T_v, S_v (part R17.3). (3) The source ids `jl70` and `cdn20` denote different files in the two parts (two IAS PDFs; the JAMS pagination against the author file GPW5); the node entries link each part’s own file.
- **Evidence for part R16.1.** Its packet records 55 of its 58 excerpts as one to three words (“restrictions”, “conductor”, “0”) and many `match` texts are templated (“The passage supplies the … input or motivating calculation”). The review accepted them. Three sub-agents downloaded the 18 sources these citations use (every SHA-256 matched the packet) and found the passage at each locator: 41 were checked against the text layer and 17 transcribed from page images (Casselman’s and Arthur–Clozel’s scans, and five text layers that garble formulas). The document prints each passage as an *Assembly note* under its citation, with the page used and a support label (14 exact, 7 specialisation, 35 supporting, 2 not supporting). The packet fix below lists the locator corrections.
- **Cross-part prerequisites.** Part R16.1 never cites part R17.3. Part R17.3’s nodes cite layers R16.1–R17.2 by 54 bare stage ids and by no node id. Two sub-agents mapped every citation to the R16.1 nodes that state what the citing node uses (14 clear, 31 probable, 9 none); every proposed id was checked to exist. The document prints each result as an *Assembly note* at the citing node; the table below lists them. Part R17.3’s eight requests to its own roadmap carry *Assembly status* lines: three answered (R16.1, R16.5, R17.2), five partly answered (R16.2, R16.3, R16.4, R16.6, R17.1).
- **Acyclicity and layer edges.** The node graph of the two packets is acyclic. The nodes use forty edges between this roadmap’s layers; the atlas declares thirteen. Twenty-eight used edges are undeclared; with RS-21’s four links, five follow from nothing: R16.3 → R16.5, R16.5 → R17.3, R16.5 → R17.4, R16.6 → R17.1, R16.6 → R17.3. Declaring R16.3 → R16.5 and R16.6 → R17.1 covers all of them. Promotion draws no edge inside one roadmap, so the maintainer must declare them. With them and the 121 cross-roadmap edges the two parts induce, the stage graph of `data/atlas.json` (with links and accepted restructurings) stays acyclic. The declared edge R17.3 → R17.4 is used by no node.

**`check_blueprint.py`** (with the pinned declaration index) reports 0 errors and 0 warnings on both packets, which are unchanged. `research/blueprint/intake.py check-files` passes on the three deliverables.

**The Lean file.**
- **Layout.** One standard note and one import block: the union of the parts’ blocks, 29 Mathlib modules (one added, `Mathlib.FieldTheory.IsAlgClosed.Basic`); no Tau Ceti import, because the shared build’s Tau Ceti is not at the pin. `noncomputable section` and the two linter options once. The R16.1 body (namespace `TauCeti.GL2Blueprint`) then the R17.3 body (`TauCeti.GL2Transfer`), each under a heading naming its layers, then a node index listing the Lean names typed for every node of both packets. A script confirmed that, apart from the lines listed here, both bodies match the part files line for line.
- **Elaboration.** `lean-check` at the pinned Mathlib 082e2d3 exits 0; its only warnings are 259 `declaration uses sorry` (the parts give 140 and 119). No `axiom`, no `True`, no `Prop`-valued placeholder.
- **Names.** Every node declaration (`declaration` / `leanName`), API name and test name of both packets (112, 81, 66) occurs in the file, each test name as a comment directly before its example; every declaration of the two part files is kept (103 and 92).
- **Changes beyond the join.** 26 comment lines headed *Layer inputs* in the R17.3 body name the `TauCeti.GL2Blueprint` declarations that stand for the inputs those sections take as parameters (20 distinct declarations). The section `AddedByReview` is renamed `GlobalisationAndModThree` and its doc comment no longer mentions the review. `TauCeti.GL2Transfer.quadratic_restriction` now assumes `[IsAlgClosed k]`: its packet node (`R17.6/quadratic-restriction`) requires an algebraically closed coefficient field, and over ℚ the statement is false (Γ = ℤ/4, Kgp = 2ℤ/4, θ(2) = −1, E = Γ: Ind θ is irreducible over ℚ but the right side fails). Its comment said “over any field”; it now says what the packet says.
- **Statements false for arbitrary parameters.** Both parts take the supplier carriers they cannot import as type and function parameters and name omitted conditions in `Missing:` comments, as both reviews accepted. An inventory of the joined file finds 112 of its 175 theorems and lemmas false for some value of their parameters, 2 more false jointly with another declaration, and 8 of its 20 definitions with a possibly empty type (e.g. `def globalJL (DClass FClass : Type*) : DClass ≃ FClass`). They are listed at the end of this note. They are the parts’ design and were left as they are; a revision of either part should replace them by statements about specific placeholder carriers or add the stateable hypotheses, as ASM-PrismaticCohomology did for its reviewed defects.

## Findings for other owners

- **Two cycles closed by other packets.** With every packet’s induced edges, R16.2–R17.6 lie in one strongly connected component of 365 stages, through the declared requirement AutomorphicGaloisRepresentationsPartII AG2.1a → EndoscopicTransferAndUnitaryTraceComparison ET.6. Two single edges each close a cycle through this roadmap: the AG2.0 packet’s `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` cites `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation` (R16.6 → R19.1 → AG2.0 → AG2.1a → ET.6 → R16.6), and the AutomorphicGaloisRepresentations packet’s `R19.3/skinner-density-one-ordinary-primes` cites `SerreWeightAndLevelOptimisation:R20.2` (R19.4 → R17.6 → R20.1 → R20.2 → R19.3 → R19.4, with R19.4 → R17.6 from `R17.6/rt-technical-lemma`). Neither packet is promoted; when one is, promotion skips the edge that closes the cycle and records it in `skippedLinks`.
- **Edges that promotion drops.** Fifteen cross-roadmap layer edges used by the parts cite node ids of unpromoted packets (AdelicAlgebraicGroups, ArithmeticGaloisRepresentations, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicGaloisRepresentations), so `blueprints.py` draws no edge for them: AA.1 → R16.1; R01.1 → R16.2; AF.2, AF.3 → R17.3, R17.4; AF.4 → R17.3; AF.5 → R16.5, R17.5; R19.4 → R17.6; AL.0 → R16.1, R16.2, R16.4; AL.1 → R17.4, R17.5. They appear when those packets are promoted; adding all of them creates no cycle.
- **RT-AREA-langlands-2/33** (confirmed) was handed to BP-…--R17.3 and asks for R17.4 → OrdinaryAutomorphicFormsAndModularityLifting R21.4. Neither part records it. The edge appears when the OrdinaryAutomorphicFormsAndModularityLifting packet (which cites R17.4 from R21.4 and R21.5) is promoted, or the maintainer can declare it.
- **RT-AREA-iwasawa-1/8** (confirmed) removes R17.5 → HeegnerPointEulerSystems HE.6; `data/atlas.json` still has that stage edge.
- **RS-21 revision.** The revised `research/blueprint/restructure/RS-21.result.json` (review REV-FIX-RT-RS-21 pending) keeps the GL₂ Whittaker expansion in R16.5 as a specialisation of AL.3, while part R16.1 plans it in R16.4 (`R16.4/global-whittaker-expansion`, from RT-AREA-automorphic-1/9). Its R16.5 `keeps` text should say “compare with the R16.4 expansion”. It also adds R16.2 → AutomorphicCongruences L3, which part R16.1 supplies through `R16.2/casselman-newvector` and `R16.2/normalized-newvector`.
- **Global quaternion algebras with prescribed ramification have no owner.** Every R17.3 node that uses a global quaternion algebra takes it as given data (`global-jl`, `definite-infinity`, `indefinite-parity`, `invariant-exchange`, `supercuspidal-globalization`); Hilbert reciprocity (ClassFieldTheory Layer 14) is requested only in its necessary direction, and part R16.1 records the existence as a gap (“Global realization of prescribed quaternion ramification”). No packet plans the existence theorem (the nearest, `BorelRegulators:R.6/archimedean-split-division`, has its own open gap). The R16.1 review’s second question to the orchestrator asks for this owner. A short route upstream: Tau Ceti GlobalQuadraticForms Layer 4.4 (sign prescription, O’Meara 71:19a) with QuadraticFormInvariants Layer 2 gives ℍ[F; a, b] ramified exactly at any even set of places; uniqueness needs ClassFieldTheory Layer 10 or Hasse–Minkowski. Consumers that rely on it include GL2ModularityLifting R22.1/minimal-level-data, OrdinaryAutomorphicFormsAndModularityLifting R21.1, PotentialModularityAndCompatibleSystems R23.3 and SmallRamificationAndAbelianVarietyBaseCases’ request to R17.3.
- **Consumers citing layers where nodes exist.** GL2ModularityLifting’s request to R17.4 for Gee’s Proposition 4.25 corresponds to `R17.6/compatible-descent` and `R17.6/potential-modularity-interface`; AutomorphicGaloisRepresentations R19.2 should cite `R17.4/nonnormal-cubic-base-change`, `R17.5/tunnell-primitive-globalization`, `R17.5/prescribed-local-induction` and the Artin nodes rather than layers (the R17.3 review’s third and fourth questions).
- **Candidate entries for the register of mistakes** (found while reading part R16.1’s sources): Casselman, Math. Ann. 201, p. 303, proof of the Lemma: the factor (1 0; dc⁻¹ 1) must be (1 0; cd⁻¹ 1), since its product with ((ad − bc)d⁻¹ b; 0 d) has lower-left entry c (checked on the page image by this job). Two more were reported by a sub-agent and not rechecked: JL70 Definition 10.2(iii), printed p. 169, “ξ is slowly increasing” where φ is meant; Cogdell, Fields lectures, Theorem 9.3, “π₁ ≃ ⊗′ π₂,v” where π₂ is meant.

## Edits the part packets need (not deliverables here)

Items 1–3 change prerequisites and evidence only. Items 4 and 5 add statements or gaps and need a review. Item 6 is atlas data.

1. **Part R17.3: replace the 54 layer citations by node ids** (PROTOCOL.md section 3), following the table. Rows marked `none` need a node of part R16.1 first (item 4) or keep the layer with a gap; rows marked `probable` carry the difference in their note, which the document prints at the citing node.

| # | R17.3 node | Layer cited | Replace by | Confidence |
|---|---|---|---|---|
| 1 | `R17.3/coefficient-conjugation` | R16.4 | `R16.4/cohomological-rationality`, `R16.4/strong-multiplicity-one` | probable |
| 2 | `R17.3/coefficient-conjugation` | R17.1 | `R17.1/local-quaternionic-comparison` | probable |
| 3 | `R17.3/definite-infinity` | R16.6 | `R16.6/hilbert-algebraic-weights`, `R16.6/primitive-classical-bijection`, `R16.6/classical-hecke-and-level` | probable |
| 4 | `R17.3/definite-infinity` | R17.1 | `R17.1/real-quaternionic-comparison` | clear |
| 5 | `R17.3/global-jl` | R16.1 | `R16.1/haar-quotient-comparison` | clear |
| 6 | `R17.3/global-jl` | R16.2 | `R16.2/local-classification`, `R16.2/archimedean-classification` | probable |
| 7 | `R17.3/global-jl` | R16.4 | `R16.4/strong-multiplicity-one`, `R17.2/continuous-residual-ledger` | probable |
| 8 | `R17.3/global-jl` | R17.1 | `R17.1/local-quaternionic-comparison`, `R17.1/real-quaternionic-comparison`, `R17.1/norm-character-steinberg` | probable |
| 9 | `R17.3/global-jl` | R17.2 | `R17.2/specialized-trace-comparison` | probable |
| 10 | `R17.3/invariant-exchange` | R17.1 | `R17.1/swapped-quaternion-invariants`, `R17.1/local-quaternionic-comparison`, `R17.1/real-quaternionic-comparison` | probable |
| 11 | `R17.3/local-factors` | R16.3 | `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison` | clear |
| 12 | `R17.3/local-factors` | R16.5 | `R16.5/whittaker-integral-comparison`, `R16.5/global-epsilon-normalization` | clear |
| 13 | `R17.3/local-factors` | R17.1 | `R17.1/wild-dyadic-transfer`, `R17.1/norm-character-steinberg`, `R17.1/local-quaternionic-comparison`, `R17.1/real-quaternionic-comparison` | probable |
| 14 | `R17.3/multiplicity-one` | R16.4 | `R16.4/global-multiplicity-one` | clear |
| 15 | `R17.3/multiplicity-one` | R17.2 | `R17.2/specialized-trace-comparison` | probable |
| 16 | `R17.3/norm-exception` | R16.2 | `R16.2/local-classification` | clear |
| 17 | `R17.3/norm-exception` | R16.4 | `R16.4/global-multiplicity-one` | clear |
| 18 | `R17.3/norm-exception` | R17.1 | `R17.1/norm-character-steinberg`, `R17.1/real-quaternionic-comparison` | probable |
| 19 | `R17.3/rational-models` | R16.4 | `R16.4/cohomological-rationality` | clear |
| 20 | `R17.3/split-hecke` | R16.2 | `R16.2/iwahori-center` | probable |
| 21 | `R17.3/strong-multiplicity-one` | R16.4 | `R16.4/strong-multiplicity-one` | clear |
| 22 | `R17.4/adjoint-lift` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter` | none |
| 23 | `R17.4/cyclic-base-change` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/tate-unitary-normalization` | probable |
| 24 | `R17.4/cyclic-base-change` | R16.4 | `R16.4/strong-multiplicity-one` | none |
| 25 | `R17.4/cyclic-base-change` | R17.2 | `R17.2/specialized-trace-comparison`, `R17.2/cyclic-local-matching` | probable |
| 26 | `R17.4/cyclic-descent` | R17.2 | `R17.2/specialized-trace-comparison`, `R17.2/cyclic-local-matching` | probable |
| 27 | `R17.4/isobaric-fibers` | R16.4 | — | none |
| 28 | `R17.4/local-compatibility` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/tate-unitary-normalization`, `R16.2/archimedean-classification` | none |
| 29 | `R17.4/nonnormal-cubic-base-change` | R16.3 | `R16.3/principal-series-parameter` | clear |
| 30 | `R17.4/nonnormal-cubic-base-change` | R16.4 | `R16.4/strong-multiplicity-one` | none |
| 31 | `R17.4/nonnormal-cubic-base-change` | R16.5 | `R16.5/full-gl2-converse` | probable |
| 32 | `R17.4/solvable-base-change` | R16.4 | `R16.4/strong-multiplicity-one` | none |
| 33 | `R17.4/tower-independence` | R16.4 | `R16.4/strong-multiplicity-one` | none |
| 34 | `R17.4/unramified-base-change` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/tate-unitary-normalization` | probable |
| 35 | `R17.5/dihedral-artin` | R16.4 | `R16.4/strong-multiplicity-one` | clear |
| 36 | `R17.5/octahedral-artin` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/supercuspidal-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.2/archimedean-classification` | probable |
| 37 | `R17.5/octahedral-artin` | R16.4 | `R16.4/strong-multiplicity-one` | probable |
| 38 | `R17.5/octahedral-artin` | R16.5 | `R16.5/full-gl2-converse`, `R16.5/global-epsilon-normalization` | probable |
| 39 | `R17.5/prescribed-local-induction` | R16.2 | `R16.2/local-classification`, `R16.2/archimedean-classification` | probable |
| 40 | `R17.5/prescribed-local-induction` | R16.3 | `R16.3/supercuspidal-parameter`, `R16.3/principal-series-parameter`, `R16.3/archimedean-factor-comparison` | probable |
| 41 | `R17.5/q-weight-one` | R16.2 | `R16.2/newvector-conductor`, `R16.2/casselman-newvector`, `R16.2/normalized-newvector`, `R16.3/conductor-epsilon-comparison` | clear |
| 42 | `R17.5/q-weight-one` | R16.6 | `R16.6/weight-one-classical-comparison` | probable |
| 43 | `R17.5/quadratic-induction` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/supercuspidal-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.2/archimedean-classification` | probable |
| 44 | `R17.5/quadratic-induction` | R16.5 | `R16.5/full-gl2-converse` | clear |
| 45 | `R17.5/solvable-artin` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/supercuspidal-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.2/archimedean-classification` | probable |
| 46 | `R17.5/solvable-artin` | R16.5 | `R16.5/full-gl2-converse`, `R16.5/global-epsilon-normalization` | probable |
| 47 | `R17.5/solvable-artin` | R16.6 | `R16.6/weight-one-classical-comparison`, `R16.2/archimedean-classification` | probable |
| 48 | `R17.5/tetrahedral-artin` | R16.3 | `R16.3/principal-series-parameter`, `R16.3/supercuspidal-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.2/archimedean-classification` | probable |
| 49 | `R17.5/tetrahedral-artin` | R16.4 | `R16.4/strong-multiplicity-one`, `R16.4/non-cm-self-twists` | probable |
| 50 | `R17.5/tetrahedral-artin` | R16.5 | `R16.5/full-gl2-converse`, `R16.5/global-epsilon-normalization` | probable |
| 51 | `R17.5/tr-weight-one` | R16.6 | `R16.6/weight-one-classical-comparison`, `R16.2/archimedean-classification` | none |
| 52 | `R17.5/tunnell-primitive-globalization` | R16.3 | — | none |
| 53 | `R17.6/potential-modularity-interface` | R16.4 | `R16.4/strong-multiplicity-one` | clear |
| 54 | `R17.6/unramified-katz` | R16.6 | `R16.6/weight-one-classical-comparison` | probable |

2. **Part R16.1: evidence.** Replace the one- to three-word excerpts by the passages the document prints under each citation (the *Assembly note* gives the page used), replace the templated `match` texts, and correct these locators:
   - `R16.3/steinberg-monodromy` (casselman73): the special representation is on p. 306; the ε remark runs over pp. 306–307.
   - `R16.6/classical-hecke-and-level` (casselman73): §3 Theorem 4 and the paragraph after it, p. 313, with Theorem 1, p. 302 (p. 308 only announces §3).
   - `R16.6/primitive-classical-bijection` (jl70): §5 Lemma 5.7, printed pp. 83–84, and Theorem 5.11, pp. 85–86; JL70 §11 has no holomorphic specialisation.
   - `R16.2/iwahori-oldforms` (cg20): pp. 5–6 of the cited advance-publication PDF (pp. 805–806 is the final Duke pagination, which that file does not print).
   - `R16.2/cdt-vexing-type` (cg18): §3.9.2 is PDF p. 54 (Invent. Math. 211, p. 350); its CDT part should be a separate cdt99 citation, §5.1 pp. 18–19 (σ_{S,p} on p. 19).
   - `R16.4/cohomological-rationality` (nt26): §1.2 (p. 8) only defines “regular algebraic”; Aut(ℂ)-conjugation is in the proof of Lemma 2.1 (p. 9) and Lemma 5.2 (p. 38). Newton–Thorne say nothing about the rationality field or Clozel’s models, so the node needs another source for them (AF.4’s).
   - Not supported by the cited passage: `R16.5/classical-l-function-comparison` (jl70 Theorem 11.1 has only the abstract functional equation; the classical normalization needs a classical source, e.g. upstream ModularForms Layer 7’s), and `R17.1/wild-dyadic-transfer` (cdn23 §4.1.2 only identifies the local groups at 𝔭, with p > 2; the content is ET.6’s).
   - Also: `R16.4/global-whittaker-expansion` cites the expansion “formally at least”; its convergence is JL70 Lemma 11.4, p. 193. `R16.5/whittaker-integral-comparison`’s match text names (11.1.2) as the unfolding, which is on p. 184 after Lemma 11.1.3. `R17.1/local-quaternionic-comparison`’s sign identity is JL70 Proposition 15.5, p. 256.
3. **Part R17.3: two small corrections.** `R17.5/tunnell-primitive-globalization` has a use naming the removed node `R17.6/extraordinary-cubic-compatibility` (drop it; `AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary` is the owner). Part R16.1’s test `TauCeti.GL2Blueprint.conductor_ramified_steinberg` reads “both formulas give2” (a missing space).
4. **Part R16.1: statements that part R17.3 uses and no node states** (from the request statuses and the `none` rows):
   - **isobaric strong multiplicity one** in R16.4: χ₁ ⊞ χ₂ is determined by its components at almost all places, and a cuspidal π never agrees with an isobaric sum at almost all places (Jacquet–Shalika). Five `none` rows depend on it (`R17.4/cyclic-base-change`, `solvable-base-change`, `tower-independence`, `isobaric-fibers`, `nonnormal-cubic-base-change`), and `R17.5/octahedral-artin` needs the cuspidal-against-isobaric case;
   - the **arithmetic normalization** rec^{arith}(π) = rec(π)∨ ≅ rec(π̃) in R16.3 (or part R17.3 restates its uses in part R16.1’s rec and recᵀ); the k = 1 Hecke and L-function dictionary over ℚ with the arithmetic-Frobenius conversion, and the totally real parallel-weight-one extension, in R16.6;
   - the **spherical eigenvalues** t_v = q_v^{1/2}(α_v + β_v), s_v = α_vβ_v of the unnormalized T_v, S_v over any number field (stated only over ℚ, in R16.4/cohomological-rationality), and the character criterion for square-integrability that `R17.3/global-jl` uses, in R16.2;
   - **local base change** matching restriction of parameters beyond the unramified case (Langlands–Shintani; the octahedral dyadic case), preservation of the GL₂ × GL₂ pair factors that `R17.4/adjoint-lift` needs, and ε of every twist outside supercuspidals, in R16.3;
   - JL70’s sign h_v = −1 and Aut(ℂ)-equivariance of local Jacquet–Langlands, in R17.1; matching at real places (Hamilton quaternions against GL₂(ℝ), and real places that become complex for ℓ = 2), in R17.1 and R17.2.
5. **Gaps to merge or answer.** Part R16.1’s gap “Global realization of prescribed quaternion ramification” is the input that part R17.3 takes as data (Findings above). Part R16.1’s two Lean gaps (“Supplier test-function and automorphic carriers in Lean”, “Suggested-file supplier conditions and full tensor coefficient types”) concern the suggested file, not mathematics.
6. **Layer edges.** Declare R16.3 → R16.5 and R16.6 → R17.1 in the stages’ `requires` (or the five edges listed above). The R16.1 review’s third question (the older R16.5 text still placing the global expansion there) is answered by the RS-21 revision above.

## Structural proposals of the parts

Part R16.1 records three proposals and part R17.3 one. The document prints each in full under “Structural proposals of the parts”.

| Part | Proposal | Status |
|---|---|---|
| R16.1 | rescope (GL2AutomorphicRepresentationsAndTransfer:R16.4, GL2AutomorphicRepresentationsAndTransfer:R16.5): Move the expansion target from R16.5 to R16.4; retain R16.4 → R16.5. Add the explicit AL.3 expansion and AL.0 Fourier prerequisites. | the packet already plans the expansion in R16.4 (`R16.4/global-whittaker-expansion`); the stage texts and both RS-21 versions still put it in R16.5 |
| R16.1 | rescope (GL2AutomorphicRepresentationsAndTransfer:R16.1): Add AL.0 → R16.1, retain AA.2 only for quotient/central-character L². No source or carrier is duplicated. | the packet cites AL.0 nodes; the atlas has no edge AL.0 → R16.1, and promotion draws none while the AutomorphicLFunctionsAndLocalFactors packet is unpromoted |
| R16.1 | split (AutomorphicFormsOnReductiveGroups:AF.1): Implement the verified AF.1 → AF.1b split: AF.1 retains algebraic (g,K) theory; AF.1b owns real reductive classification, discrete/limit series, GLn archimedean LLC and globalization. Until installed, the current AF.1 request carries the exact contract; no fictitious AF.1b dependency is used. | AF.1b is not in the atlas; the packet keeps the exact request to AF.1 |
| R17.3 | split (GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors): Add GL2AutomorphicRepresentationsAndTransfer:R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5, holding adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change. Its requires are R17.4, AutomorphicLFunctionsAndLocalFactors:AL.3, AutomorphicLFunctionsAndLocalFactors:AL.3b and MetaplecticAutomorphicForms:MP.5 (Gelbart–Jacquet's Shimura integral on the metaplectic cover); its consumer is R17.5. Until the stage exists these nodes realise R17.4. AL.3b is the GL_n converse theorem for all n (requires AL.3; consumers R17.4a and R16.5); R16.5 states its n=2 instance separately with its own hypotheses. After the split the non-normal cubic part of the R17.4 → AutomorphicGaloisRepresentations:R19.2 export becomes R17.4a → R19.2. Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is owned by AutomorphicGaloisRepresentations R19.2, which imports R17.4/R17.4a and R17.5 (accepted RT-AREA-langlands-2/4 fix); this packet does not plan it. | R17.4a and AL.3b are not in the atlas; the four nodes stay in R17.4 and the GL₃ inputs are a gap |

The first R16.1 proposal (the Whittaker expansion in R16.4) differs from both RS-21 versions, which keep it in R16.5; see “RS-21 revision” above.

## Requests of the parts

All 67 requests, as the packets record them: part R16.1 has 32, part R17.3 has 35 (8 of them to this roadmap’s own layers, with their status from the assembly). The document prints them grouped by supplier.

### Part R16.1

1. **`ReductiveGroupsPartII:RG2.4`**. Import finite-place Iwasawa/Cartan decompositions with the local integral maximal compact and dominant invariant factors; RG2.0 supplies integral-point topology, while AF.1 supplies real/complex decompositions. *Needed by:* `R16.1/local-adelic-compact-comparison`, `R16.1/iwasawa-cartan`.
2. **`ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`**. Use the existing compact-subgroup stable-lattice theorem for the finite CDT type over a finite nonarchimedean coefficient field; choose an invariant O-lattice and preserve coefficient extension, without asserting canonicity. *Needed by:* `R16.2/cdt-vexing-type`.
3. **`AdelicAlgebraicGroups:AA.2`**. Import quotient measures for Z(Fv)\G(Fv), central-character L² and compatible torus quotient measures; AL.0 alone owns Schwartz–Bruhat/Fourier theory. *Needed by:* `R17.2/steinberg-projector-difference`, `R17.2/continuous-residual-ledger`.
4. **`SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`**. The fixed-smooth-central-character abelian category in characteristic zero, exact compact-open invariants and projectivity of supercuspidal blocks. Include the L/ℚp scalar-extension case used by Dospinescu–Le Bras. No unrestricted-category or mod-p projectivity claim. *Needed by:* `R16.2/supercuspidal-projective`.
5. **`SmoothRepresentationsOfLocalGroups:SR.1`**. Use the existing C_c^∞ Hecke convolution carrier and its compact-mod-center ω⁻¹-equivariant variant, quotient Haar measure, character-isotypic compact-mod-center idempotents, double-coset operators, scalar extension and integrated representation. Keep 1_I and normalized e_K distinct. *Needed by:* `R16.1/finite-level-comparison`, `R16.2/iwahori-oldforms`, `R16.2/iwahori-center`, `R17.2/steinberg-projector-difference`.
6. **`SmoothRepresentationsOfLocalGroups:SR.2`**. Normalized induction with δ_B^{1/2}, its compact and Jacquet models, contragredients, finite-length exceptional principal series and induced-operator kernels. Supply the all-x,y constant-term criterion that makes an induced operator zero. *Needed by:* `R16.2/local-classification`, `R17.2/strong-cuspidal-vanishing`.
7. **`SmoothRepresentationsOfLocalGroups:SR.3`**. Admissibility, contragredient identity π∨≅π⊗ωπ⁻¹det for GL₂, compact-mod-center supercuspidal matrix coefficients, Bernstein inertial equivalence and typical K-types. Include characteristic-zero stable lattices for CDT finite-group types without declaring every integral realization canonical. *Needed by:* `R16.2/local-classification`, `R16.2/newvector-conductor`, `R16.2/henniart-unicity`, `R16.2/supercuspidal-projective`, `R17.2/strong-cuspidal-vanishing`, `R16.2/newvector-level-exists`.
8. **`SmoothRepresentationsOfLocalGroups:SR.4`**. Normalized Satake coordinates and the Bernstein/Iwahori presentation, center≅spherical via e_K, scalar-extension hypotheses and GL₂ generator conventions U₀,U₁,T₀,T₁. The general parahoric-center extension is the proposed SmoothRepresentationsPartIIParahoricCenters owner; use SR.4 until that roadmap is installed. *Needed by:* `R16.2/spherical-whittaker-values`, `R16.2/iwahori-oldforms`, `R16.2/iwahori-center`, `R17.2/cyclic-local-matching`.
9. **`SmoothRepresentationsOfLocalGroups:SR.5`**. The single local Whittaker/Kirillov functor, uniqueness, explicit Borel action, genericity, nonzero newvector evaluation for conductor-O ψ, spherical Whittaker values and Weyl operator from the gamma factor. Supply the finite L/ℚp Kirillov scalar extension/Γ descent used by Dospinescu–Le Bras; locally analytic theory remains R30. *Needed by:* `R16.2/local-classification`, `R16.2/casselman-newvector`, `R16.2/normalized-newvector`, `R16.2/spherical-whittaker-values`, `R16.2/supercuspidal-kirillov`, `R16.4/global-whittaker-expansion`, `R16.4/global-multiplicity-one`, `R16.2/newvector-level-exists`.
10. **`AutomorphicFormsOnReductiveGroups:AF.1`**. Through the verified RT-AREA-automorphic-1/2 fix, split off proposed AF.1b after AF.1: archimedean Wℝ,Wℂ representations, Langlands classification/globalization for GLn(ℝ),GLn(ℂ), nondegenerate limits, full-O(2) GL₂ discrete series and archimedean LLC with L/epsilon factors. The present request names current AF.1; no uninstalled AF.1b stage is treated as an existing dependency. Include real/complex O(2), U(2) compact subgroups, Iwasawa/singular-value decompositions, SU(2) algebraic highest-weight characters and GL₂(ℝ) Harish–Chandra characters needed to prove the explicit real-quaternionic comparison. This archimedean input is not supplied by finite-place ET.6. *Needed by:* `R16.2/archimedean-classification`, `R16.3/archimedean-factor-comparison`, `R16.5/full-gl2-converse`, `R16.6/hilbert-algebraic-weights`, `R17.1/real-quaternionic-comparison`, `R16.6/weight-one-classical-comparison`, `R16.1/local-adelic-compact-comparison`, `R16.1/iwasawa-cartan`.
11. **`AutomorphicFormsOnReductiveGroups:AF.2`**. The existing smooth automorphic/cuspidal isomorphism classes, determinant-twist action and Hecke-character classes, so non-CM is a subset of this carrier. Supply classical/adelic finite-level comparison and growth conditions; do not create another representation structure. *Needed by:* `R16.4/non-cm-self-twists`, `R16.5/full-gl2-converse`.
12. **`AutomorphicFormsOnReductiveGroups:AF.4`**. The relative-Lie-algebra-cohomological criterion for Sym^{kτ−2}⊗det^{mτ} at real GL₂, with explicit coefficient-dual and central-character convention, and compatibility under coefficient extension. Use existing rationality-field/clozel-rationality nodes for the general number-field model. *Needed by:* `R16.6/hilbert-algebraic-weights`.
13. **`AutomorphicLFunctionsAndLocalFactors:AL.1`**. Character L/epsilon factors over nonarchimedean and archimedean fields, ψ/measure change, ν-shifts and the discriminant convention in global products. Fix Γℝ,Γℂ, |z|ℂ and geometric Artin conventions explicitly. *Needed by:* `R16.3/principal-series-parameter`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.5/whittaker-integral-comparison`, `R16.5/full-gl2-converse`, `R16.5/global-epsilon-normalization`, `R16.6/weight-one-classical-comparison`.
14. **`AutomorphicLFunctionsAndLocalFactors:AL.2`**. The sole local standard-factor and Whittaker zeta-integral carrier, compatibility with LLC, local fractional ideal/test-vector theorem, epsilon shifts/conductor exponents, and archimedean gamma conventions. A normalized newvector realizes the untwisted standard L-factor; arbitrary ramified twists require their own test-vector statement. *Needed by:* `R16.2/casselman-newvector`, `R16.2/supercuspidal-kirillov`, `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/tate-unitary-normalization`, `R16.3/conductor-epsilon-comparison`, `R16.3/archimedean-factor-comparison`, `R16.5/whittaker-integral-comparison`, `R16.5/full-gl2-converse`.
15. **`AutomorphicLFunctionsAndLocalFactors:AL.3`**. General GLn global Fourier–Whittaker expansion (including convergence/injectivity) BEFORE multiplicity applications; GL₂×GL₁ integral comparison, full Hecke-character twisted functional equations and Mellin-inversion estimates; Rankin–Selberg pole criterion for π×π̃, nonvanishing and absence of poles at s=1 for omitted finite and archimedean Rankin–Selberg factors for cofinite strong multiplicity one. No second GL₂ carrier is created. *Needed by:* `R16.4/global-whittaker-expansion`, `R16.4/strong-multiplicity-one`, `R16.4/non-cm-self-twists`, `R16.5/whittaker-integral-comparison`, `R16.5/full-gl2-converse`, `R16.5/global-epsilon-normalization`.
16. **`AutomorphicSpectralTheory:AS.4`**. Cuspidal Hilbert decomposition with finite multiplicity, algebraic smooth restricted-tensor realization and its relation to the completion. Supply GL₂ discrete residual determinant-character identification from the generic spectral carrier; multiplicity one is not presupposed. *Needed by:* `R16.4/cuspidal-tensor-factorization`, `R16.4/global-multiplicity-one`, `R17.2/continuous-residual-ledger`.
17. **`AutomorphicSpectralTheory:AS.2`**. Import normalized global/local intertwining operators, their factorization, meromorphic continuation and residues from AS.2; AS.6 supplies their operator-valued derivative distributions in the trace formula. Use the same ψ/Haar and normalization. AS.5 weighted cohomology supplies none of this. *Needed by:* `R17.2/continuous-residual-ledger`.
18. **`AutomorphicSpectralTheory:AS.6`**. The invariant trace formula on compact-mod-center test functions, all identity/elliptic/unipotent terms, residual characters, continuous intertwining-derivative distributions and their measure normalization. Its specialization must expose every term needed by the concrete quaternionic/cyclic ledger. *Needed by:* `R17.2/continuous-residual-ledger`, `R17.2/strong-cuspidal-vanishing`, `R17.2/specialized-trace-comparison`.
19. **`EndoscopicTransferAndUnitaryTraceComparison:ET.1`**. The transfer-factor and norm conventions, regular centralizer identifications and measure factors for GL₂ ordinary, inner-form and cyclic twisted transfer. Provide archimedean input through the proposed AF.1b, not a second LLC classification. *Needed by:* `R17.2/cyclic-local-matching`, `R17.2/specialized-trace-comparison`.
20. **`EndoscopicTransferAndUnitaryTraceComparison:ET.3`**. Local transfer on the existing smooth test-function carriers, quaternionic matching with rank-two sign and common torus measure, cyclic ordinary/twisted orbital-integral transfer, and identity/singular-term compatibility. General transfer existence remains here. *Needed by:* `R17.2/quaternionic-orbital-matching`, `R17.2/cyclic-local-matching`, `R17.2/specialized-trace-comparison`.
21. **`EndoscopicTransferAndUnitaryTraceComparison:ET.4`**. The unramified spherical fundamental lemma and simple cyclic trace comparison with normalized norm/central-character pullback. Include quadratic exceptional induced and residual terms with their one-half Weyl weights, and the exact continuous/intertwining identities used in the GL₂ specialization. *Needed by:* `R17.2/cyclic-local-matching`, `R17.2/continuous-residual-ledger`, `R17.2/specialized-trace-comparison`.
22. **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`**. The canonical characteristic-zero GLn local LLC and GLr(D) inner-form/JL carrier, including normalized induction/segments, twisting, determinant, Artin conductor and L/epsilon compatibility. Supply all finite extensions of ℚp including dyadic primitive wild parameters, index-two Weil induction, Henniart typical-type interface and CDT Θ(θ) inertial comparison; no dependence on this GL₂ specialization. *Needed by:* `R16.2/local-classification`, `R16.2/henniart-unicity`, `R16.2/cdt-vexing-type`, `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/tate-unitary-normalization`, `R16.3/tamely-dihedral`, `R16.3/tamely-dihedral-supercuspidal`, `R16.3/cdt-inertia-multiplicity`, `R17.1/local-quaternionic-comparison`, `R17.1/norm-character-steinberg`, `R17.1/real-quaternionic-comparison`, `R17.1/wild-dyadic-transfer`, `R17.2/quaternionic-orbital-matching`.
23. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`**. Import the upstream quaternion algebra/reduced norm, local split/division classification and chosen splitting isomorphisms. This packet only applies these objects. *Needed by:* `R17.1/local-quaternionic-comparison`, `R17.1/norm-character-steinberg`, `R17.1/real-quaternionic-comparison`.
24. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`**. Import the LOCAL uniqueness of the quaternion division algebra over a nonarchimedean local field and the split/division comparison. This layer supplies no global prescribed-ramification existence theorem; the swapped global example assumes chosen algebras and records that missing realization separately. *Needed by:* `R17.1/local-quaternionic-comparison`, `R17.1/swapped-quaternion-invariants`.
25. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`**. Import the absolute Artin homomorphism with dense image, finite-quotient reciprocity, arithmetic/geometric Frobenius conversion and character conductors. This is NOT an isomorphism F×→G_Fᵃᵇ; inverse character transport uses Layer9 topological Weil-group reciprocity for F/ℚp finite. *Needed by:* `R16.3/principal-series-parameter`, `R16.3/cdt-inertia-multiplicity`.
26. **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`**. Import existing primitive newform/newspace and exact conductor theory, including bad-prime Hecke eigenproperties beyond the pinned Newform fields and their classical Euler factors. *Needed by:* `R16.5/classical-l-function-comparison`, `R16.6/primitive-classical-bijection`, `R16.6/classical-hecke-and-level`, `R16.6/weight-one-classical-comparison`.
27. **`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`**. Import the upstream coefficient-field theorem for primitive normalized forms and its compatibility with algebraic Hecke eigenvalues. *Needed by:* `R16.4/cohomological-rationality`.
28. **`tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`**. Import the upstream primitive classical finite Euler factors, Mellin completion and functional equation, with exact width, conductor, nebentypus and weight normalization. *Needed by:* `R16.5/classical-l-function-comparison`.
29. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`**. Import upstream reciprocity/parity of quaternion ramification for the swapped-invariant example; this is not a new global existence proof. *Needed by:* `R17.1/swapped-quaternion-invariants`.
30. **`ReductiveGroupsPartII:RG2.0`**. Import topology and compactness of integral GL₂ points and openness of congruence kernels; use determinant a unit, not merely nonzero. AA.1 then supplies the adelic restricted-product identification. *Needed by:* `R16.1/local-adelic-compact-comparison`.
31. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`**. Use localWeilArtinEquiv:F×≃ₜ*W_Fᵃᵇ onto the topological abelianization, with the Layer7 absolute-map compatibility and inversion for geometric Frobenius. This reciprocity export is available here only for finite extensions of ℚp. *Needed by:* `R16.3/principal-series-parameter`, `R16.3/cdt-inertia-multiplicity`.
32. **`tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`**. Import Galois stability/conjugate primitive newforms, CharacterField χ≤CoefficientField f, and rationality of the Hecke characteristic polynomials. Layer8 alone gives coefficient-field algebraicity and does not justify Galois conjugation of analytic forms. *Needed by:* `R16.4/cohomological-rationality`.

### Part R17.3

1. **`GL2AutomorphicRepresentationsAndTransfer:R16.1`**. The GL₂ specialisation over number fields of the generic carriers: chosen compact subgroups, Haar and quotient measures, the central-character quotient and finite-level function-space identifications, agreeing with AutomorphicFormsOnReductiveGroups AF.2. Generic automorphic representations and the restricted-tensor (Flath) factorization are imported from AF.2/automorphic-representation and AF.2/flath-factorization. *Needed by:* `R17.3/global-jl`. *Assembly status: answered.*
2. **`GL2AutomorphicRepresentationsAndTransfer:R16.2`**. Rank-two local classification, newvectors, arithmetic Hecke normalization and the distinction between principal series, twists of Steinberg and supercuspidal representations. *Needed by:* `R17.3/global-jl`, `R17.3/norm-exception`, `R17.3/split-hecke`, `R17.5/prescribed-local-induction`, `R17.5/q-weight-one`. *Assembly status: partly answered.*
3. **`GL2AutomorphicRepresentationsAndTransfer:R16.3`**. Arithmetic-normalized rank-two LLC, compatibility of twists, determinants, local factors and Weil–Deligne restriction, including extraordinary dyadic parameters. Also: preservation of L- and ε-factors (fixed ψ, every character twist) by the arithmetic rank-two LLC, and compatibility of the Langlands–Shintani local cyclic base change with restriction of the parameter for octahedral dyadic parameters and every prime degree ℓ. *Needed by:* `R17.3/local-factors`, `R17.4/adjoint-lift`, `R17.4/cyclic-base-change`, `R17.4/local-compatibility`, `R17.4/nonnormal-cubic-base-change`, `R17.4/unramified-base-change`, `R17.5/octahedral-artin`, `R17.5/prescribed-local-induction`, `R17.5/quadratic-induction`, `R17.5/solvable-artin`, `R17.5/tetrahedral-artin`, `R17.5/tunnell-primitive-globalization`. *Assembly status: partly answered.*
4. **`GL2AutomorphicRepresentationsAndTransfer:R16.4`**. GL₂ multiplicity one and strong multiplicity one over number fields for cuspidal and isobaric (χ₁⊞χ₂) representations, with the exact set of places where equality is required; and the GL₂/Hilbert-cohomological specialisation of AF.4/clozel-rationality (conjugate representations and models over a finite extension of the rationality field). The generic rationality definitions are AF.4/rationality-field. *Needed by:* `R17.3/coefficient-conjugation`, `R17.3/global-jl`, `R17.3/multiplicity-one`, `R17.3/norm-exception`, `R17.3/rational-models`, `R17.3/strong-multiplicity-one`, `R17.4/cyclic-base-change`, `R17.4/isobaric-fibers`, `R17.4/nonnormal-cubic-base-change`, `R17.4/solvable-base-change`, `R17.4/tower-independence`, `R17.5/dihedral-artin`, `R17.5/octahedral-artin`, `R17.5/tetrahedral-artin`, `R17.6/potential-modularity-interface`. *Assembly status: partly answered.*
5. **`GL2AutomorphicRepresentationsAndTransfer:R16.5`**. The GL₂ converse theorem over an arbitrary number field with the full Hecke-character twist family, growth, entireness/pole and functional-equation hypotheses, retaining all-place local factors (the n=2 instance of AL.3b, stated with its own hypotheses), as used by JL70 §12 for quadratic induction and inside the JPSS cubic construction; and the Godement–Jacquet standard factors of GL₂ and their twists with continuation and functional equation, imported from AL.2, for local-factors. *Needed by:* `R17.3/local-factors`, `R17.4/nonnormal-cubic-base-change`, `R17.5/octahedral-artin`, `R17.5/quadratic-induction`, `R17.5/solvable-artin`, `R17.5/tetrahedral-artin`. *Assembly status: answered.*
6. **`GL2AutomorphicRepresentationsAndTransfer:R16.6`**. (a) Over Q: π_∞ is the weight-one limit of discrete series (parameter 1⊕sign) exactly for holomorphic weight-one newforms (AF.5/gl2-dictionary gives the adelization for k ≥ 1 but identifies π_∞ only for k ≥ 2); newform level equals the conductor of π and nebentypus equals the central character, compared with Tau Ceti ModularForms Layer 4. (b) The totally real holomorphic parallel-weight-one extension. (c) The Hilbert cohomological weight conventions used by definite-infinity. *Needed by:* `R17.3/definite-infinity`, `R17.5/q-weight-one`, `R17.5/solvable-artin`, `R17.5/tr-weight-one`, `R17.6/unramified-katz`. *Assembly status: partly answered.*
7. **`GL2AutomorphicRepresentationsAndTransfer:R17.1`**. Quaternionic local JL: division places correspond to essentially discrete series; local characters correspond to Steinberg twists; real algebraic weights and split-place identifications use the fixed normalization. Also: local JL preserves L- and ε-factors (fixed ψ) after every character twist, with the sign h_v = −1 of JL70 at division places (a character χ∘Nrd of D_v× has the factors of St⊗χ), and JL_v is Aut(C)-equivariant on algebraic types. *Needed by:* `R17.3/coefficient-conjugation`, `R17.3/definite-infinity`, `R17.3/global-jl`, `R17.3/invariant-exchange`, `R17.3/local-factors`, `R17.3/norm-exception`. *Assembly status: partly answered.*
8. **`GL2AutomorphicRepresentationsAndTransfer:R17.2`**. The actual GL₂/quaternion and prime-cyclic trace comparisons with matching test functions, Haar measures, central characters and every continuous/residual cancellation; this is the engine used below. *Needed by:* `R17.3/global-jl`, `R17.3/multiplicity-one`, `R17.4/cyclic-base-change`, `R17.4/cyclic-descent`. *Assembly status: answered.*
9. **`AlgebraicModularFormsAndSerreWeights:R15.2`**. Wiese Proposition 7/Corollary 8 (descent of a Katz form from Γ₁(Nm) to Γ₁(N), for coprime N, m and a ring containing 1/(Nm) and the (Nm)-th roots of unity, iff it is independent of the m-level structure; same q-expansion) and Wiese Proposition 4/Corollary 5 (U_ℓ at auxiliary primes, degeneracy maps, stabilization with the companion matrices and repeated-root cases). T_ℓ for ℓ prime to the level is the existing node R15.2/integral-hecke-operators-from-q-expansions. Optionally, base change for Γ₁(N) cusp forms with N ≥ 5 and k ≥ 2, so that weight-two-witness can stay at level Γ₁(N). *Needed by:* `R17.6/unramified-katz`.
10. **`ArithmeticGaloisRepresentations:G7`**. The canonical adjoint representation and its scalar-quotient/traceless comparison in characteristic zero, restriction, determinant and coefficient-map operations; do not confuse the two carriers in characteristic dividing the rank. The adjoint of a local Weil–Deligne parameter, used by adjointLift_local, is taken on the R01.2/ET.6 Weil–Deligne carrier. *Needed by:* `R17.4/adjoint-lift`.
11. **`ArithmeticGaloisRepresentations:R01.1`**. Continuous finite-coefficient and finite-image characteristic-zero rank-two representations, coefficient extensions, stable lattices, semisimplified reduction, restriction and character twisting on the canonical carrier. *Needed by:* `R17.5/finite-projective-lift`, `R17.5/octahedral-mod-three-application`, `R17.5/odd-residual-lift`, `R17.5/q-weight-one`, `R17.5/residual-lt-application`, `R17.5/tr-weight-one`, `R17.6/compatible-base-change`, `R17.6/determinant-untwist`, `R17.6/disjoint-irreducibility`, `R17.6/solvable-dihedral`, `R17.6/wiese-odd-lift`.
12. **`ArithmeticGaloisRepresentations:R01.3`**. Artin conductors, their induction formula, invariance dimensions, prime-to-p conductor of reduction and ramification under twists. *Needed by:* `R17.5/q-weight-one`, `R17.6/determinant-untwist`, `R17.6/rt-technical-lemma`, `R17.6/serre-odd-trick`, `R17.6/teichmuller-conductor`, `R17.6/wiese-odd-lift`.
13. **`ArithmeticGaloisRepresentations:R01.4`**. Finite GL₂/PGL₂ classification over algebraically closed fields, solvable images and irreducibility, characteristic-two odd-order dihedral case, and bad-dihedral restriction criterion; apply it to finite Galois images here. *Needed by:* `R17.5/dihedral-artin`, `R17.5/octahedral-artin`, `R17.5/octahedral-mod-three-application`, `R17.5/odd-residual-lift`, `R17.5/solvable-artin`, `R17.5/tetrahedral-artin`, `R17.5/tunnell-primitive-globalization`, `R17.6/determinant-untwist`, `R17.6/disjoint-irreducibility`, `R17.6/quadratic-restriction`, `R17.6/solvable-dihedral`, `R17.6/teichmuller-conductor`, `R17.6/wiese-odd-lift`.
14. **`ArithmeticGaloisRepresentations:R01.5`**. Recognition of semisimple representations by full Frobenius characteristic polynomials, coefficient descent and Brauer–Nesbitt; trace alone is insufficient in characteristic two. *Needed by:* `R17.5/octahedral-mod-three-application`, `R17.5/q-weight-one`, `R17.5/residual-lt-application`, `R17.6/compatible-base-change`, `R17.6/compatible-descent`, `R17.6/rt-technical-lemma`, `R17.6/unramified-katz`, `R17.6/weight-two-witness`.
15. **`AutomorphicLFunctionsAndLocalFactors:AL.3`**. GL₃ and GL₂×GL₃ Rankin–Selberg local and global factors, all-place functional equations, vertical-strip bounds, the Jacquet–Shalika pole criterion and nonvanishing on Re s=1 for GL₃. The GL_n converse theorem is the proposed AL.3b and is recorded as a gap. *Needed by:* `R17.4/adjoint-lift`, `R17.4/cubic-character-induction`, `R17.4/gl3-recognition`, `R17.4/nonnormal-cubic-base-change`.
16. **`AutomorphicSpectralTheory:AS.6`**. The invariant trace formula for GL₂ and D× over a totally real field with test functions whose component at one finite place is a pseudo-coefficient of a supercuspidal representation, with its convergence and summation conditions, as the input to Clozel's limit-multiplicity globalization; that globalization itself is a recorded gap. *Needed by:* `R17.3/supercuspidal-globalization`.
17. **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`**. The characteristic-zero local Langlands correspondence for GL₃ (and GL₁) over p-adic fields with L- and ε-factors of pairs, to identify the local components of Ad(π) and of AI_{E/F}(θ) with Ad(rec π_v) and Ind θ_w. *Needed by:* `R17.4/adjoint-lift`, `R17.4/cubic-character-induction`.
18. **`MetaplecticAutomorphicForms:MP.5`**. The theta series on Mp(A) attached to a quadratic character and the genuine Eisenstein series on the metaplectic cover of SL₂ over a number field, with constant terms and continuation, used in Shimura's integral (Gelbart–Jacquet 1978 §§5–8, Theorem 8.1) to prove L(s,π,Ad⊗χ) entire. *Needed by:* `R17.4/adjoint-lift`.
19. **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`**. Dirichlet-density Chebotarev and the infinitude of every Frobenius class, applied to ray class fields of a quadratic field and to the splitting field of a residual representation, to choose auxiliary primes. *Needed by:* `R17.6/serre-odd-trick`, `R17.6/wiese-odd-lift`.
20. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`**. Brauer–Hasse–Noether exact sequence and local invariants for number fields, including the archimedean terms; combined with local reciprocity in Tate’s vanishing proof. *Needed by:* `R17.5/tate-vanishing`.
21. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**. Global Artin reciprocity matching finite-order Galois characters with finite-order Hecke characters and local characters. *Needed by:* `R17.4/cubic-character-induction`, `R17.4/cyclic-descent`, `R17.4/isobaric-fibers`, `R17.5/dihedral-artin`, `R17.5/quadratic-induction`, `R17.5/tate-vanishing`, `R17.5/tunnell-primitive-globalization`, `R17.6/compatible-descent`, `R17.6/determinant-untwist`, `R17.6/serre-odd-trick`, `R17.6/teichmuller-conductor`, `R17.6/wiese-odd-lift`.
22. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`**. Hilbert product formula: quaternionic local invariants have even total ramification cardinality; apply this result rather than constructing it again. *Needed by:* `R17.3/indefinite-parity`, `R17.3/invariant-exchange`.
23. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`**. The local Brauer group, the local invariant and Br(F_v)[p] ≅ H²(G_{F_v}, μ_p), used at each place in the proof of Tate's vanishing theorem. *Needed by:* `R17.5/tate-vanishing`.
24. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`**. Local reciprocity, used to show that a character of F_v^× is a p-th power exactly when it is trivial on μ_p(F_v), so that the local connecting map onto Br(F_v)[p] is surjective. *Needed by:* `R17.5/tate-vanishing`.
25. **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`**. Artin–Whaples weak approximation in the mixed finite/real form, with sign conditions at real places, and openness of the squares in F_v^× at finite places: used to choose a quadratic generator with prescribed local square classes and signs, and the coefficients of a quartic close to a given local quartic. *Needed by:* `R17.5/prescribed-local-induction`, `R17.5/tunnell-primitive-globalization`.
26. **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`**. Archimedean components and infinity types of Hecke characters, and Weil's criterion for a Hecke character with prescribed archimedean component (Patrikis Lemma 2.3.1), used to make an extension of an idele-torsion character finite order. *Needed by:* `R17.5/finite-hecke-extension`, `R17.5/prescribed-local-induction`.
27. **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`**. Identity component of the idele class group, ray quotient and profinite quotient; use for extending finite-order characters of idele torsion. *Needed by:* `R17.5/finite-hecke-extension`, `R17.5/prescribed-local-induction`, `R17.6/serre-odd-trick`, `R17.6/teichmuller-conductor`, `R17.6/wiese-odd-lift`.
28. **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`**. Norm pullback of Hecke characters with the placewise local norm and composition in finite towers. *Needed by:* `R17.4/cyclic-base-change`, `R17.4/isobaric-fibers`, `R17.4/nonnormal-cubic-base-change`, `R17.4/solvable-base-change`.
29. **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`**. The canonical continuous Hecke-character carrier, conductor, finite-order/ray-class dictionary and the Q Dirichlet-character parity dictionary. *Needed by:* `R17.4/cubic-character-induction`, `R17.4/cuspidality`, `R17.5/finite-hecke-extension`, `R17.5/prescribed-local-induction`, `R17.5/quadratic-induction`, `R17.5/tunnell-primitive-globalization`, `R17.6/determinant-untwist`, `R17.6/serre-odd-trick`, `R17.6/teichmuller-conductor`.
30. **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`**. Classical newform theory over Q in every weight including one: newform decomposition, bad-prime eigenvalues (Atkin–Lehner–Li), primitive forms and their conductor. *Needed by:* `R17.5/q-weight-one`, `R17.6/rt-technical-lemma`.
31. **`tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`**. Atkin–Lehner and Fricke operators W_Q for exact divisors Q‖N and their relations with T_n, including the Atkin–Li operators on forms with nontrivial character that Rohrlich–Tunnell use at Q = 2^ν (their §1, Case 2). *Needed by:* `R17.6/rt-technical-lemma`.
32. **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`**. Completions of a number field at finite places as local fields, and the dictionary between the places of F[x]/(f) above v and the irreducible factors of f over F_v (completionFactorsEquivPlaces), with Krasner's lemma from Mathlib: used to realise a given p-adic field K as a completion F_v and the splitting field of an approximating quartic as a completion L_w ≅ K(σ). *Needed by:* `R17.5/tunnell-primitive-globalization`.
33. **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`**. Continuous cohomology with discrete trivial Q/Z coefficients, filtered-colimit compatibility, inflation/restriction and connecting homomorphisms; Q/Z has trivial action, not the cyclotomic action. *Needed by:* `R17.5/tate-vanishing`.
34. **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`**. The Mackey decomposition formula over any commutative coefficient ring, for Res_{G_E} Ind_{G_K}^{G_F} θ with K/F quadratic, including residual characteristic two where the Layer 4 irreducibility criterion (|G| invertible) does not apply. *Needed by:* `R17.6/quadratic-restriction`.
35. **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`**. The existing factor-set and Schur-multiplier interface and character ambiguity of linear lifts; the arithmetic continuous finite-image step is new here. *Needed by:* `R17.5/finite-projective-lift`, `R17.5/odd-residual-lift`.

## Questions for the maintainer

1. Who owns the global existence and uniqueness of a quaternion algebra with prescribed even ramification (the R16.1 review’s second question)? Part R17.3 assumes it throughout R17.3.
2. Should isobaric strong multiplicity one for GL₂ be a node of R16.4, or does AutomorphicSpectralTheory / AutomorphicLFunctionsAndLocalFactors own the Jacquet–Shalika classification of isobaric representations for GL_n?
3. Declare the layer edges R16.3 → R16.5 and R16.6 → R17.1 (and RT-AREA-langlands-2/33’s R17.4 → R21.4).

## Validation

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> <packet>`: 0 errors, 0 warnings for both part packets (unchanged).
- `python3 research/blueprint/intake.py check-files` on the three deliverables: passes.
- `lean-check research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer.lean`: exit 0; 259 `declaration uses sorry` warnings and no other message (Mathlib 082e2d3).
- Verbatim check: 4,487 packet strings, all present in the document. Name coverage of the Lean file: all node declarations, API and test names of both packets.
- The document and this note avoid the words that UPSTREAM_GUIDE.md forbids, except two verbatim packet strings (a coverage item and the restructuring-basis note of part R17.3).

## Where to resume

Nothing remains of the assembly. The next work is the part revisions above (items 1–6) and the maintainer’s decisions; the document is regenerated from the packets after any packet edit (the generator renders each node from its packet fields, so a revision of either part changes only that part’s entries).

## Appendix: Lean statements false for some parameters

Inventory of the joined file. These declarations are as the parts wrote them; `quadratic_restriction`, the one changed, now matches its packet node and is not listed. Each line: declaration, layer, why it is false as stated.

### Part R16.1 (layers R16.1–R17.2)

- `TauCeti.GL2Blueprint.compactComparison` [R16.1]: `IsCompact K` for an arbitrary set K (K = univ in ℝ).
- `TauCeti.GL2Blueprint.iwasawaCartan` [R16.1]: K is an arbitrary subgroup: for K = ⊥ a non-diagonal g is not k·diag·l.
- `TauCeti.GL2Blueprint.haarComparison` [R16.1]: `μ K = 1` for an arbitrary measure and set (μ = 0).
- `TauCeti.GL2Blueprint.finiteLevelComparison` [R16.1]: `Nonempty (A ≃ₗ[ℂ] C)` for arbitrary modules (A = ℂ, C = 0).
- `TauCeti.GL2Blueprint.localClassification` [R16.2]: arbitrary constructor maps: with C, S empty and P = Unit no witness exists.
- `TauCeti.GL2Blueprint.newvectorLevelExists` [R16.2]: arbitrary ρ and K: for V = 0, or K n = ⊤ and ρ without invariants, no nonzero fixed vector.
- `TauCeti.GL2Blueprint.casselmanNewvector` [R16.2]: arbitrary ρ and K: trivial ρ on ℂ² with K n = ⊤ has dimension 2, not n + 1 at n = 0.
- `TauCeti.GL2Blueprint.iwahoriOldforms` [R16.2]: dimensions 2 and 1 for arbitrary modules V_I, V_K.
- `TauCeti.GL2Blueprint.iwahoriCenter` [R16.2]: arbitrary ring and units: q = 1, U₁ = 1, U₀ a non-central unit of M₂(ℚ) gives a non-central element.
- `TauCeti.GL2Blueprint.supercuspidalKirillov` [R16.2]: `Nonempty (V ≃ₗ[ℂ] C)` for arbitrary modules.
- `TauCeti.GL2Blueprint.henniartUnicity` [R16.2]: `multiplicity (typical π) π = 1` for an arbitrary function.
- `TauCeti.GL2Blueprint.cdtInertiaMultiplicity` [R16.3]: `Nonempty (Fixed ≃ₗ[ℂ] ΘSpace)` for arbitrary modules.
- `TauCeti.GL2Blueprint.principalParameter` [R16.3]: `rec (induction χ₁ χ₂) = directSum χ₁ χ₂` for arbitrary maps.
- `TauCeti.GL2Blueprint.supercuspidalParameter` [R16.3]: `L π s = 1` for an arbitrary function L.
- `TauCeti.GL2Blueprint.conductorEpsilon` [R16.3]: functional equation for an arbitrary ε : P → ℂ → ℂ and c.
- `TauCeti.GL2Blueprint.archimedeanClassification` [R16.2]: `rec (D (m+1) t) = realInd m t` for arbitrary maps.
- `TauCeti.GL2Blueprint.archimedeanFactors` [R16.3]: `standardL (D k) s = gammaC (…)` for arbitrary functions.
- `TauCeti.GL2Blueprint.tamelyDihedral_conjugate` [R16.3]: `ind (σ θ) = ind θ` for arbitrary σ and ind.
- `TauCeti.GL2Blueprint.tamelyDihedralSupercuspidal` [R16.3]: inclusion in an arbitrary set (supercuspidal = ∅ while ℓ = 3, q = 2 makes tamelyDihedral nonempty).
- `TauCeti.GL2Blueprint.cuspidalTensor` [R16.4]: `Nonempty (A ≃ₗ[ℂ] T)` for arbitrary modules.
- `TauCeti.GL2Blueprint.globalWhittakerExpansion` [R16.4]: `φ g = ∑' a, W (diag a * g)` for arbitrary φ, W.
- `TauCeti.GL2Blueprint.globalMultiplicityOne` [R16.4]: `mult π = 1` for an arbitrary function.
- `TauCeti.GL2Blueprint.strongMultiplicityOne` [R16.4]: a constant localFactor on C = Bool makes the hypothesis hold with π ≠ π'.
- `TauCeti.GL2Blueprint.cohomologicalRationality` [R16.4]: `coeff π n ∈ K` for arbitrary coeff and K (K = ℚ, coeff = I).
- `TauCeti.GL2Blueprint.whittakerIntegral` [R16.5]: `Zglobal s = ∏' v, Zlocal v s` for arbitrary functions.
- `TauCeti.GL2Blueprint.gl2Converse` [R16.5]: `∃ π, forget π = Pi` for an arbitrary forget (Cusp empty).
- `TauCeti.GL2Blueprint.classicalLFunction` [R16.5]: `Lunitary s = Lf (…)` for arbitrary functions.
- `TauCeti.GL2Blueprint.primitiveBijection` (def) [R16.6]: def `NClass ≃ AClass` between arbitrary types (Empty, Unit) is uninhabited.
- `TauCeti.GL2Blueprint.primitiveBijection_conductor` [R16.6]: `conductor (…) = N` for arbitrary conductor and N.
- `TauCeti.GL2Blueprint.primitiveBijection_weight_character` [R16.6]: arbitrary infinite/central maps and values Dk, χ.
- `TauCeti.GL2Blueprint.primitiveBijection_hecke` [R16.6]: trace/determinant identities for arbitrary α, β, ap, χp.
- `TauCeti.GL2Blueprint.primitiveBijection_normalized` [R16.6]: `a1 (…) = 1` for an arbitrary function a1.
- `TauCeti.GL2Blueprint.hilbertWeightRepresentation_dimension` [R16.6]: `finrank ℂ V = ∏ τ, (k τ - 1)` for the arbitrary section module V.
- `TauCeti.GL2Blueprint.geometricExports` [R16.6]: `finrank ℂ V = 1` for an arbitrary module V.
- `TauCeti.GL2Blueprint.localQuaternionic` [R17.1]: `charF (jl ρ) δ = -charD ρ δ` for arbitrary maps.
- `TauCeti.GL2Blueprint.normCharacterSteinberg` [R17.1]: `jl (normCharacter χ) = special χ` for arbitrary maps.
- `TauCeti.GL2Blueprint.realQuaternionic` [R17.1]: `realLocalJL (coeff k m) = D k m` for arbitrary maps.
- `TauCeti.GL2Blueprint.wildDyadicTransfer` [R17.1]: `recF (jl ρ) = recD ρ` for arbitrary maps.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_steinberg` [R17.2]: `trace (…) = 1` for an arbitrary functional.
- `TauCeti.GL2Blueprint.steinbergProjectorDifference_character` [R17.2]: `trace (…) = -1` for an arbitrary functional.
- `TauCeti.GL2Blueprint.quaternionicOrbitalMatching` [R17.2]: `O_G fG t = -O_D fD t` for arbitrary functions.
- `TauCeti.GL2Blueprint.cyclicMatching` (def) [R17.2]: def `EFunctions → FFunctions` between arbitrary types (Unit → Empty) is uninhabited.
- `TauCeti.GL2Blueprint.cyclicMatching_norm` [R17.2]: `O_F (…) t = TO_E φ t` for arbitrary O_F, TO_E.
- `TauCeti.GL2Blueprint.cyclicMatching_non_norm` [R17.2]: `O_F (…) t = 0` for arbitrary O_F (also contradicts cyclicMatching_norm).
- `TauCeti.GL2Blueprint.cyclicMatching_unit` [R17.2]: `cyclicMatching … unitE = unitF` for arbitrary unitF.
- `TauCeti.GL2Blueprint.cyclicMatching_satake` [R17.2]: Satake power rule for arbitrary satE, satF.
- `TauCeti.GL2Blueprint.spectralLedger` [R17.2]: five arbitrary complex values (cusp = 1, others 0).
- `TauCeti.GL2Blueprint.strongCuspidalVanishing` [R17.2]: `A = 0` for an arbitrary endomorphism.
- `TauCeti.GL2Blueprint.specializedTraceComparison` [R17.2]: `geometric = spectral` for two arbitrary complex values.
- `TauCeti.GL2Blueprint.weightOneClassicalComparison` [R16.6]: `Nonempty (X ≃ Y)` for arbitrary types.

Counts: 48 theorems/lemmas false alone and 0 false jointly, of 91 theorems/lemmas; 2 of 12 defs have an empty type for some parameters.

### Part R17.3 (layers R17.3–R17.6)

- `TauCeti.GL2Transfer.globalJL` (def) [R17.3]: def `DClass ≃ FClass` between arbitrary types is uninhabited.
- `TauCeti.GL2Transfer.globalJL_local` [R17.3]: arbitrary localD, localF, localJL.
- `TauCeti.GL2Transfer.globalJL_central` [R17.3]: `ωF (globalJL d) = ωD d` for arbitrary ωD, ωF.
- `TauCeti.GL2Transfer.globalJL_twist` [R17.3]: arbitrary twistD, twistF (twistD = id, twistF constant).
- `TauCeti.GL2Transfer.cyclicBaseChange` (def) [R17.4]: def `FClass → EClass` between arbitrary types (Unit → Empty) is uninhabited.
- `TauCeti.GL2Transfer.cyclicBaseChange_local` [R17.4]: arbitrary localF, localE, res.
- `TauCeti.GL2Transfer.cyclicBaseChange_unramified` [R17.4]: arbitrary satF, satE and degree f.
- `TauCeti.GL2Transfer.cyclicBaseChange_central` [R17.4]: arbitrary ωF, ωE, normPullback.
- `TauCeti.GL2Transfer.cyclicBaseChange_twist` [R17.4]: arbitrary twistF, twistE, normPullback.
- `TauCeti.GL2Transfer.cyclicBaseChange_galois` [R17.4]: `σ x = x` for an arbitrary σ : EClass → EClass.
- `TauCeti.GL2Transfer.cyclicBaseChange_coefficients` [R17.4]: arbitrary conjugateF, conjugateE.
- `TauCeti.GL2Transfer.solvableBaseChange` (def) [R17.4]: def `FClass → EClass` between arbitrary types is uninhabited.
- `TauCeti.GL2Transfer.solvableBaseChange_local` [R17.4]: arbitrary localF, localE, res.
- `TauCeti.GL2Transfer.solvableBaseChange_twist` [R17.4]: arbitrary twistF, twistE, normPullback.
- `TauCeti.GL2Transfer.adjointLift` (def) [R17.4]: def `FClass → GL3Class` between arbitrary types is uninhabited.
- `TauCeti.GL2Transfer.adjointLift_local` [R17.4]: arbitrary local2, local3, adjoint.
- `TauCeti.GL2Transfer.adjointLift_unramified` [R17.4]: arbitrary sat3 (only sat2 is constrained).
- `TauCeti.GL2Transfer.adjointLift_twist` [R17.4]: arbitrary twist (a constant twist forces adjointLift to be constant).
- `TauCeti.GL2Transfer.adjointLift_central` [R17.4]: `ω (adjointLift π) = 1` for an arbitrary ω.
- `TauCeti.GL2Transfer.cubicBaseChange` (def) [R17.4]: def `FClass → EClass` between arbitrary types is uninhabited.
- `TauCeti.GL2Transfer.cubicBaseChange_unramified` [R17.4]: arbitrary satF, satE and degree f.
- `TauCeti.GL2Transfer.cubicBaseChange_twist` [R17.4]: arbitrary twistF, twistE, normPullback.
- `TauCeti.GL2Transfer.cubicBaseChange_central` [R17.4]: arbitrary ωF, ωE, normPullback.
- `TauCeti.GL2Transfer.cubicBaseChange_unique` [R17.4]: a constant sat makes the hypothesis hold with Pi ≠ Ψ.
- `TauCeti.GL2Transfer.quadraticInduction` (def) [R17.5]: def `H → FClass` between arbitrary types is uninhabited.
- `TauCeti.GL2Transfer.quadraticInduction_local` [R17.5]: arbitrary localChar, induce, localRep.
- `TauCeti.GL2Transfer.quadraticInduction_central` [R17.5]: arbitrary ω, η, restrictChar.
- `TauCeti.GL2Transfer.quadraticInduction_baseChange` [R17.5]: arbitrary isobaricSum and σ.
- `TauCeti.GL2Transfer.quadraticInduction_twist` [R17.5]: arbitrary twist and normPullback.
- `TauCeti.GL2Transfer.quadraticInduction_cuspidal` [R17.5]: arbitrary σ, forget (σ = id with forget surjective).
- `TauCeti.GL2Transfer.norm_exception` [R17.3]: arbitrary forget, normChar (DFull = Unit).
- `TauCeti.GL2Transfer.split_hecke` [R17.3]: arbitrary T, S, T', S'.
- `TauCeti.GL2Transfer.local_factors` [R17.3]: arbitrary L, ε, L', ε'.
- `TauCeti.GL2Transfer.strong_multiplicity_one` [R17.3]: a constant localRep makes the hypothesis hold with d ≠ e.
- `TauCeti.GL2Transfer.multiplicity_one` [R17.3]: `multiplicity d = 1` for an arbitrary function.
- `TauCeti.GL2Transfer.coefficient_conjugation` [R17.3]: arbitrary conjD, conjF.
- `TauCeti.GL2Transfer.rational_models` [R17.3]: arbitrary aD, aF (φ is injective).
- `TauCeti.GL2Transfer.definite_infinity` [R17.3]: `weight (…) = k + 2` for arbitrary weight and k.
- `TauCeti.GL2Transfer.supercuspidal_globalization` [R17.3]: `∃ d, localRep d v = τ` for arbitrary localRep (DClass empty).
- `TauCeti.GL2Transfer.local_compatibility` [R17.4]: arbitrary recF, recE, res.
- `TauCeti.GL2Transfer.cyclic_descent` [R17.4]: arbitrary σ, forgetF (σ = id, CF empty).
- `TauCeti.GL2Transfer.cuspidality` [R17.4]: arbitrary twist, η (twist = id, forgetE surjective).
- `TauCeti.GL2Transfer.cyclic_descent_fibers` [R17.4]: arbitrary twist, η, ℓ (ℓ = 0 gives an empty right side).
- `TauCeti.GL2Transfer.isobaric_fibers` [R17.4]: arbitrary sumF, sumE, pullback.
- `TauCeti.GL2Transfer.solvable_descent` [R17.4]: `∃ π, solvableBaseChange π = Pi` with FClass empty.
- `TauCeti.GL2Transfer.prescribed_local_base_change` [R17.4]: arbitrary localF, localE.
- `TauCeti.GL2Transfer.cubic_character_induction` [R17.4]: arbitrary inducedLocal, local3 (GL3Class empty).
- `TauCeti.GL2Transfer.gl3_recognition` [R17.4]: a constant localRep makes the hypothesis hold with Pi ≠ Ψ.
- `TauCeti.GL2Transfer.finite_hecke_extension` [R17.5]: arbitrary groups: i trivial and ω nontrivial gives χ.comp i = 1 ≠ ω.
- `TauCeti.GL2Transfer.odd_residual_lift` [R17.5]: arbitrary G and r: r with infinite image (J empty) has no finite-image lift.
- `TauCeti.GL2Transfer.dihedral_artin` [R17.5]: `∃ π : FClass, …` for arbitrary rec (FClass empty).
- `TauCeti.GL2Transfer.tetrahedral_artin` [R17.5]: `∃ π : FClass, …` for arbitrary rec (FClass empty).
- `TauCeti.GL2Transfer.octahedral_artin` [R17.5]: `∃ π : FClass, …` for arbitrary rec (FClass empty).
- `TauCeti.GL2Transfer.solvable_artin` [R17.5]: `∃! π : FClass, …` for arbitrary rec (FClass empty).
- `TauCeti.GL2Transfer.q_weight_one` [R17.5]: `∃ f : Form, …` for arbitrary Form and projections (Form empty).
- `TauCeti.GL2Transfer.tr_weight_one` [R17.5]: `∃ f : Form, …` for arbitrary Form and weight (Form empty).
- `TauCeti.GL2Transfer.residual_lt_application` [R17.5]: `∃ w, realize w = r` for arbitrary realize (Witness empty).
- `TauCeti.GL2Transfer.tunnell_primitive_globalization` [R17.5]: `∃ g : Glob, …` with Glob empty.
- `TauCeti.GL2Transfer.prescribed_local_induction` [R17.5]: `∃ θ : H, …` with H empty.
- `TauCeti.GL2Transfer.octahedral_mod_three_application` [R17.5]: `∃ f : Form, …` for arbitrary Form (Form empty).
- `TauCeti.GL2Transfer.solvable_dihedral` [R17.6]: G trivial has no index-two subgroup.
- `TauCeti.GL2Transfer.rt_technical_lemma` [R17.6]: Form = {g} with weight 1 and character −1: no f of weight 2 and character 1.
- `TauCeti.GL2Transfer.serre_odd_trick` [R17.6]: arbitrary induce (constant trivial map has det 1).
- `TauCeti.GL2Transfer.rohrlich_tunnell` [R17.6]: `∃ f : Form, …` for arbitrary Form and projections (Form empty).
- `TauCeti.GL2Transfer.wiese_odd_lift` [R17.6]: arbitrary G, r: r with infinite image has no finite-image lift.
- `TauCeti.GL2Transfer.unramified_katz` [R17.6]: `∃ f : Form, …` for arbitrary Form and projections (Form empty).
- `TauCeti.GL2Transfer.qualitative_residual_modularity` [R17.6]: `∃ w, realize w = r` for arbitrary realize.
- `TauCeti.GL2Transfer.weight_two_witness` [R17.6]: `∃ w, …` for arbitrary Witness and realize.
- `TauCeti.GL2Transfer.compatible_descent` [R17.6]: `∃ π, …` for arbitrary r, sat (FClass empty).
- `TauCeti.GL2Transfer.potential_modularity_interface` [R17.6]: `∃ π, solvableBaseChange π = Pi` with FClass empty.

False jointly with another statement of the file:

- `TauCeti.GL2Transfer.solvableBaseChange_tower` [R17.4]: with solvableBaseChange_refl, F = L = Bool and E = Unit force the identity of Bool to factor through Unit.
- `TauCeti.GL2Transfer.tower_independence` [R17.4]: with solvableBaseChange_refl, FClass = EClass = Bool and LClass = Unit make the left side constant and the right side the identity.

Not counted (consistent alone, the carrier is identified only by its type):

- `TauCeti.GL2Transfer.globalJL_split` [R17.3]: type-level FClass = FClass stands for the split algebra.
- `TauCeti.GL2Transfer.solvableBaseChange_refl` [R17.4]: type-level FClass = FClass stands for E = F.

Counts: 64 theorems/lemmas false alone and 2 false jointly, of 84 theorems/lemmas; 6 of 8 defs have an empty type for some parameters.

### Totals

112 theorems/lemmas false alone, 2 false jointly, of 175 theorems/lemmas; 8 of 20 defs with an empty type for some parameters; 122 entries in all. (`TauCeti.GL2Transfer.quadratic_restriction`, false over fields that are not algebraically closed, now assumes `[IsAlgClosed k]` as its packet node does.)
