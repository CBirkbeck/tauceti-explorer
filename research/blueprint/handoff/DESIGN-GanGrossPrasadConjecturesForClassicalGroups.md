# DESIGN-GanGrossPrasadConjecturesForClassicalGroups

Completed design pass for issue #3395, by Codex, session `codex-jINKya`, 2026-10-19. Branch: `codex-jINKya-ggp-framework`. The bot confirmed the claim before work began. This submission finishes this one design job; no second issue was claimed. It is a complete planning pass for independent review, not an unfinished checkpoint or a claim that the mathematics is formalized.

## Deliverables and coverage

The five issue deliverables are the new roadmap JSON, blueprint packet, reader, compact suggested Lean file and this handoff. The roadmap has nine layers, GGP.0–GGP.8. All 44 items in the five coalesced design briefs have an explicit target mapping in `routedCoverage` and the reader’s routed target ledger.

There are 61 targets: 24 definitions, 4 constructions, 23 theorems, 2 lemmas and 8 comparisons. The definitions and constructions have 113 API items and 84 discriminating unit checks in total. The atlas has 39 selected planets, at most six in each layer. All nine layers have coverage status `planned`; the packet status is `complete`, with 15 precise proof/source or incoming-supplier contracts and 12 requests to registered stages. It is deliberately not marked `closed`. Every node remains `implementationStatus: unchecked`.

The reader carries the full mathematical statements, hypotheses, API, uses, tests, proof routes, source locators, ownership contracts and worked examples. The suggested file has 119 lines: two real-bodied light definitions on existing carriers, nine theorem signatures and six examples. It follows the 2026-10-12 shape rule in WORKERS.md: absent analytic, packet and geometric carriers remain reader targets, with no proxy structures or missing data bodies in Lean.

## Mathematical decisions and boundaries

- Relevant inner forms twist the inclusion and retain the complementary space. They are not arbitrary products of independently chosen inner forms. The SO determinant/orientation and even-SO outer-orbit conventions are explicit.
- Hermitian forms and metrics are linear first; the GN.2 convention is conjugated on import. A bilinear model with second factor σ branches into σ∨. The branching period uses the conjugate second cusp form. The raw four-vector local form exchanges the two u-slots when interpreted on π⊗σ∨.
- Local generic/tempered ranges are separated, with classification conditions retained. Individual multiplicity one is distinguished from total packet multiplicity one and from the stronger full-induction statement.
- Global fixed-realization and coherent-packet propositions are definitions, with no axioms. Genericity of a parameter does not assert that every member is generic, coherent or automorphic. The routed generic-discrete cuspidality theorem is a target with its residual-exclusion proof contract recorded.
- The unitary refined formula uses the completed shifted quotient and unquotiented sign group: a stable pair has order 4, an endoscopic pair with three constituents order 8. Removed-place refinements retain the actual component-group factor inside an average when it varies.
- The weighted mean has the existing atlas-confirmed SO₃/SO₂ non-self-twist correction. Weyl counting has no such hypothesis. Weak subconvexity retains the unrestricted endpoint through the corrected bounded-factor argument; a fixed-window average alone would not prove the little-o claim. The exponent uses Borel dimension, with restriction of scalars at a complex distinguished place.
- LTX Lemma 8.2.1 is a definite finite diagonal-period endpoint, including integral coefficients, self-dual lattices and hyperspecial levels. Its weak arithmetic conjecture is derivative-to-Chow nonvanishing in the Hecke quotient. The unused finite-prime quantifier is removed; no Abel–Jacobi conclusion is added.

Current upstream TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read only. ClassicalGroups and CompactGroups documents were read in full; their suggested files and the relevant OrthogonalSpinGroups, SmoothRepresentations and ReductiveGroups interfaces were checked. The nine post-snapshot roadmap additions were checked for overlapping ownership. Classical groups, compact branching and Peter–Weyl are imported. The library audit and actual pinned declarations were checked separately.

The proposed `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups` keeps relative-character sums, allowability, microlocal calculus, stable-orbit machinery and limit states; it imports the raw local period here. The proposed `JacquetRallisRelativeTraceComparison` keeps the known stable/endoscopic global and refined proof machinery; it imports the shared propositions here. The arithmetic application consumes its returned theorem, so package scheduling must separate framework exports from returned proof consumption to avoid a coarse roadmap cycle. `UnitaryRapoportZinkSpacesAndRSZModels` keeps the unitary Shimura models and level maps. No unregistered supplier node was invented. General cycle/graph theory is imported from MotivesAndAlgebraicCycles, and canonical datum functoriality/neat sublevels from ShimuraVarieties. No higher-tier dependency or ownership move was added.

## Sources and corrections

The packet and reader give exact versions, SHA-256 hashes and actual reading scope for eleven sources. Original statements and relevant proof passages were read for GGP, Jiang–Zhang, BPLZZ, BCZ, Nelson–Venkatesh, Beuzart-Plessis, Gan–Ichino, Mœglin–Waldspurger, Luo, Harris and LTX. Long local trace-formula, invariant-distribution and induction proofs were not claimed as read end to end; their exact closure contracts are recorded. BPLZZ/Harris locators refer to their specified arXiv versions, rather than silently borrowing journal numbering.

The cleared published LTX copy was read in place under the maintainer’s library index. No cleared file, extracted text or source passage was copied. All deliverable formulations and source-issue records are paraphrases. Six existing atlas corrections were carried through, with their prior finding/review identifiers; this design does not assign itself an independent erratum verdict. In particular it retains the cuspidal-source correction to BPLZZ’s base-change assertions.

The four baseline records are native intertwining maps, algebraic dual, finite product with its generated additive sum, and Tau Ceti’s special orthogonal subgroup. The source-only declaration index omits generated `Finset.sum`; its actual generating definition/attribute was read and the sum was checked by elaboration. The packet cites the indexed `Finset.prod` entry with the additive API explicitly described. No declaration-index bypass is needed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GanGrossPrasadConjecturesForClassicalGroups.json`: zero errors and zero warnings, using the machine’s pinned declaration index.
- `lean-check research/blueprint/suggested/GanGrossPrasadConjecturesForClassicalGroups.lean`: exit 0 at the shared pinned build, only the 15 expected declaration-uses-`sorry` warnings. Available memory was 86 GB before compilation. No language server or build/update/cache command was started.
- Full-scope route mapping: all 44 routed items have existing targets; every definition/construction has API, uses and at least three tests; own-node dependency graph and maximum planet counts validated.
- The final five-file intake and whitespace checks are recorded in the PR. No repository files outside these five deliverables are part of the submission.

## Follow-up for independent review

Review all nine planned layers and the convention transports, especially the local tensor slot swap, the precise generic-discrete cuspidality supplier range, and the source correction used for SO₃/SO₂. The packet’s contracts L1–L4, P1–P2, F1, C1, O1–O3, S1, A1, J1 and U1 specify exactly what remains for closure: original-proof decomposition for the deep local analytic inputs; refined pure-twist/classification and residual interfaces; Asai/adjoint extensions and restriction decay; registered orbit-method, comparison and unitary-model exports; tempered induction topology; and the numerical Tamagawa-volume theorem. These are named target-level obligations, not assertions of available Lean implementation.

The twelve registered stage requests cover SR.2, SR.2a, SR.3, SR.3a, ET.0, ET.1, AL.3, AL.4, AF.3, AA.2 and the two existing upstream classical/compact group layers. Three rescope proposals place the missing Asai/adjoint factors, relative restriction estimates and numerical classical Tamagawa theorems in Part II extensions of their existing directions, each with its base roadmap as its first prerequisite. The residual-spectrum and adelic quotient-volume decomposition nodes are imported explicitly. No request changes another job’s files. The independent review should decide which incoming contracts become supplier refinements and which proof-decomposition refinements are needed before the packet can be closed.

The transient scratch sources, generator and worklist are not review inputs. They are deleted after submission; all durable mathematical decisions and remaining contracts are in the five deliverables.
