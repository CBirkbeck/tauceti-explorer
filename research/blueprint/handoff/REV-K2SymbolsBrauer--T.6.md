# Handoff: REV-K2SymbolsBrauer--T.6

Completed the independent review of issue #10790 on 2026-10-19. Agent: Codex (GPT-6), session `codex-TtePAf`, branch `codex-TtePAf-review-k2-t6`. The bot confirmed the claim in comment 6271768680. The original pass was authored by the different `codex-PVxIak` session for #10817. Verdict: **accepted**, as a completed target-level planning pass under PROTOCOL §0. This is not a checkpoint. No review work remains.

The packet has individual verdicts for all 20 nodes: 8 verified and 12 corrected. It retains 26 API items, 19 discriminating tests, six planets per layer, five precise existing-roadmap import contracts and three explicit proof gaps. Both layers remain **planned**, all implementation statuses `unchecked`. Fourteen baseline references were checked at the exact pins: the 13 original declarations and the added existing Kummer-kernel characterization. Nine public source PDFs were independently retrieved, their hashes matched and every cited target locator read. Two source findings have confirmed verdicts, scoped to the hashed author chapter only: the original convention error and the missing minimal-polynomial hypothesis added during this review. The full evidence is in the review report and `review.checked`.

The corrections to preserve are:

- The cyclic-algebra split representation uses a weighted shift with wrap-around entry b. It needs a root of a alone; the former representation still required a root of b. Do not invoke the false unrestricted criterion in Weibel III.6.9.1: a nonscalar u with uⁿ=1 does not imply splitting without dim_F F[u]=n. The packet and reader give the degree-four counterexample and its norm proof.
- Current Tau Ceti already has `kummerCupPairing`, `h2MuToBr` and `h2MuToBr_cup_kummerClass`, including arbitrary fields and proper Kummer degree. Import them. Reversing the inputs in the last theorem and applying cup skew-symmetry gives the positive cyclic class for the displayed algebra. Do not package the former cocycle calculation as another planned theorem. The new adapter is the symbol-algebra matrix corner and the coefficient/K₂ transport.
- Use the corrected source locators in the packet and reader. In particular Levine’s relative theorem is unnumbered in §2.1, p.290; Weibel’s cyclic-cup remark is on p.59; Milne V Example 5.4, p.179, and VII Theorem 8.1(b), p.221, supply the reciprocity citations.
- Soulé’s product hypothesis (M) holds automatically for the two K₁ inputs in the degree-(2,2) comparison. Preserve integral reduction, its minus sign, the raw Hurewicz ε and the separate finite-coefficient Bockstein quotient.

Three mathematical proof inputs still need follow-ups for gap-free closure:

1. **G1:** generation and injectivity of the all-local Dennis–Stein presentation for nonfields with residue F₂ or F₃. The announcement and textbook statements do not supply this proof. The dyadic computations retain this dependency.
2. **G2:** the natural relative Steinberg-kernel/π₂-fibre equivalence, including the K₃(A/I) boundary. U.5’s degree-one and absolute-degree-two comparisons do not replace it.
3. **G3:** Keune Theorem 15’s complete guarded radical-relative presentation proof for I⊆Jac(A), with D3 guarded on its inputs. The differential, square-zero and dual-number calculations retain this input.

The original sources sought for these gaps, their DOIs and the exact missing statements remain in the packet and reader. Inaccessible proofs were not treated as read. No source passages or protected files were copied into the repository. No subsequent worker needs transient scratch material.

At assembly, merge this refinement into the earlier T.3 packet without keeping its incorrect extra inverse: D(r,s)=P(−r,s). Preserve the input guard, CA.1’s ownership of norm-residue symbols and higher reciprocity, the normalized invariant coordinate [k/m]↦k, the negative Artin-first/root-second exponent, the Picard kernel and the residue sign. Preserve inherited supplier gaps, especially T.2’s exact product orientation. Replace the planets in each layer as a set of six. There is no new ownership transfer or layer.

The read-only upstream checks used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including both nearby roadmaps, their relevant suggested declarations and a search of the nine newer roadmaps. Current implementations are imports beyond the pins, not new baseline claims. No Lake command ran in either read-only checkout.

Final validation passed: blueprint checker 0 errors/0 warnings; intake file rules; source-version validation; whitespace check; and `lean-check` on the final 178-line suggested file, exit 0 with exactly 9 `sorry` warnings and no other warnings. Available memory was 77 GB. The file has three real-bodied definitions, six proved examples and nine named theorem targets, all listed in the reader. No compiler or language server remains running.

Submit only this review’s five deliverables. After its PR is open, record its URL in the runner’s PR file and stop; this session must not claim a second issue.
