# Independent review of StableReductionPartII MC.3

**Verdict: accepted, with corrections.** Reviewer: Codex, session `codex-vAOWiv`, job `REV-StableReductionPartII--MC.3`, issue #8939, 2026-10-18. The input planning session was `codex-vcN4Mc`; this reviewer did not author it.

The packet is a complete target-level pass for MC.3, whose coverage remains **planned**, not closed. Its six new nodes refine the eight imported MC.3 targets. Acceptance certifies the corrected mathematical plan and its explicit dependency boundary; it does not certify implementation or discharge inherited gaps. No unresolved contradiction remains within that boundary.

## Inventory and disposition

| Item | Result |
| --- | --- |
| New refinement nodes | 6: two constructions and four theorems; all six corrected and checked individually in the packet review object |
| Nodes added or removed | 0 |
| Imported original MC.3 targets | 8, retaining their original ids |
| Construction API items | 15, including two added extensionality interfaces |
| Construction unit tests | 10, five per construction; all retained |
| Baseline declarations | All 6 original citations confirmed; 1 native finiteness lemma added; none removed |
| Source records | 8, with the cited passages independently read |
| Source findings | 1 inherited error, independently confirmed against the published scan |
| Closure boundary | 3 precise requests and 2 explicit gap records retained |
| Planets | 1 new, “Smoothing conormal line”; 5 inherited, for 6 across the combined stage |
| Suggested file | 108 lines, two real-bodied polynomial fixtures and nine admitted examples; no admitted data or surrogate geometric carrier |

## Corrections made

1. **Respect the parent’s base convention.** Current StableReduction, “Base convention”, explicitly keeps coherent pushforward, duality and representability over locally Noetherian bases and excludes extension by Noetherian approximation. R3 previously assigned that extension to the parent. R3 now imports only its locally Noetherian contract. MC3-G2 names Part II’s already existing “Arbitrary-base moduli foundations and tricanonical frame comparison” gap as the extension obligation. It specifies spreading and model independence for the families, relative cuts, genera, dualizing and marking-line comparisons that MC.3 needs. Every new node’s hypotheses, the coverage remainder, upstream note and reader now expose this condition. MC3-G1 distinguishes local-chart/relative-cut refinements from this inherited extension.
2. **Use current implementations.** At current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, inspected `TauCeti.NodeAlgebra`, `NodeAlgebra.jacobianQuotientEquiv`, `AlgebraicGeometry.Scheme.singularLocus`, and `NodeAlgebra.singularLocusIso`. These implement the arbitrary-ring local node algebra and the affine-base singular-scheme calculation, including nilpotent parameters. Their modules are absent at the pinned `f790474`. Added exact module, scope and commit receipts in `currentLibraryAudit.implementedInputs` and the reader. The three named local-algebra signatures in Suggested are now anonymous examples of this existing calculation, with an explicit instruction to reuse the current API. The two polynomial abbreviations are pinned-presentation test fixtures, not new library targets. Updated the Lean shape and compilation receipt.
3. **Add two immediate dependencies.** The incidence finiteness proof now directly cites the pinned scheme lemma `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`. The smoothing construction now lists `MC.3/boundary-normalization-comparison`, which its identification of the chosen-node stack with the normalized boundary uses. Neither addition creates a cycle.
4. **Complete arrow and descent uniqueness APIs.** Added `PersistentNode.isoEquiv`, characterizing node-preserving arrows and faithfulness of forgetting the node. Added `SmoothingConormal.hom_ext`, checking equality after a jointly surjective étale selected-node atlas. Both serve the cut/glue equivalence and uniqueness of descended comparisons. Copied their mathematical contracts into the reader tables.
5. **Distinguish a line isomorphism from a vanishing map.** The marking-line theorem now states that the contraction map π*Lᵢ→Lᵢ factors through the isomorphism π*Lᵢ≅Lᵢ(−D) and then the canonical inclusion. The map has a simple zero; the isomorphism does not. The negative twist, degree-one M̄₀,₄ check and arbitrary-family pullback warning are retained.
6. **Verify the source finding and version.** Added the required independent `sourceIssues.review` and a published `sourceVersions` receipt with the downloaded scan’s SHA-256. Confirmed inherited finding `StableReductionPartII/E3`; no new-discovery claim is made. Packet and reader retain finite unramified clutching and distinguish selected nodes through normalization.
7. **Record the review and checks.** Added the top-level acceptance object with six individual corrected verdicts, refreshed validation counts and Lean hash, and synchronized all repeated reader contracts. No source excerpt, new source error, new node or unrelated file was introduced.

## Source and mathematical checks

| Node | Passages checked and mathematical check |
| --- | --- |
| Persistent-node incidence | Knudsen II, Definition 3.8 and Corollary 3.9(a), §3, printed p.190, PDF30; Stacks Lemma 53.21.1, tag 0CBY. The relative singular scheme of xy=a is Spec R/(a). This accounts for nonflat smoothing incidence and the missing section for xy=ε over dual numbers. A persistent node has a constant étale branch-ordering torsor, including in characteristic two. |
| Decorated node fibres | Same Knudsen passage; Edidin–Fulghesu, Proposition 3.7 and §4, Definitions 4.1, Propositions 4.4–4.6 and Theorem 4.7, pp.175–180, PDF9–14. Their fixed-stratum étaleness is distinguished from finite unramified compactified clutching. The proposed extension is an explicit relative cut/glue equivalence with a fixed target isomorphism and a graph decoration torsor. Proper flat relative cuts and constancy of connected-component genus/leg partition are required by R2, rather than inferred from absolute normalization or geometric point counting. |
| Pointed node atlas | Stacks 0CBY and Lemma 41.21.6, tag 0CBR; imported MC.1 versal parameters and MC.2 pointed DM/expansion statements. Independent node parameters on the smooth moduli chart give disjoint incidence branches V(tⱼ), each regular over Z. Pullback to an arbitrary family retains the incidence formula, not regularity or a Cartier embedding. The inherited arbitrary-base gap is explicit. |
| Boundary normalization | Edidin–Fulghesu Theorem 4.7, p.180; Stacks §101.46, Lemmas 101.46.1–2 and Definition 101.46.3, tags 0GMI–0GMK; Stacks 0CBR. The accepted R09.5 supplier is used exactly for smooth-chart normalization and Nagata finiteness over Z. Distinct local branches are separated even within one global boundary type. The checks include the empty boundary, M̄₀,₄’s three sections and the stack BC₂ for M̄₁,₁. Ordinary normalization is not asserted to commute with arbitrary base change. |
| Smoothing conormal | Polishchuk v3, Proposition 3.5, §3.3 p.11, and Lemma 4.6/proof of Theorem 1.1, §4.3 pp.15–16; Hacking §3 pp.810–811 and Lemma 4.2, §4 pp.813–814; Stacks 0CBY. Checked the integral cokernel A/(x,y)=R for the hypersurface Jacobian map, product-of-slopes transition, elimination of higher-coordinate lift errors, unsigned exchange and coherent descent. Hacking is a characteristic-zero comparison; Polishchuk’s rational Theorem 1.2 is not used integrally. Chosen-branch and total-boundary conormals have different comparisons at a crossing. |
| Marking-line coherence | Knudsen III, §4 p.201 and Theorem 4.1(c) with proof pp.202–203, PDF2–4; Knudsen II p.190 and the Hacking comparison above. Gluing is an isomorphism near retained markings. The smooth-section cotangent/conormal identification and the transverse-section proof give the negative forgetful twist and simple zero. The line identity survives pullback into the divisor even when its Cartier presentation does not. |

All five downloaded public PDFs had the SHA-256 recorded in the packet. The Knudsen scans were read visually. The eight public URLs and reading limits are in the packet and reader; no restricted source was needed. Statements are in the workers’ own words, and no `excerpt` field remains.

For E3, the published Knudsen II p.190 scan makes the separating closed-immersion assertion under the stated unequal-genus/nonempty-marking alternative. Three pairwise nonisomorphic elliptic curves in a chain, with one mark on the middle component, give two nonisomorphic preimages under the same M̄₁,₁×M̄₂,₂→M̄₃,₁ map. The first elliptic factors differ. This contradicts the claimed closed immersion while preserving Corollary 3.9(a). Fresh bounded searches for this exact corollary and an erratum found no exact published correction; the finding remains attributed to the inherited accepted review, distinct from the known repair to the proof of 3.7.

## Baseline, ownership and closure

Independently read the six original declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `Ideal.Cotangent`, `Ideal.Quotient.mk`, `TensorProduct.comm`, `TensorProduct.map`, `TensorProduct.map_comp`, and `TauCeti.AlgebraicGeometry.InvertibleSheaf`. Their scalar hypotheses and ungraded symmetry agree with the uses. Ideal cotangent is a module, and invertible sheaves are on schemes; neither is a stack-conormal implementation. The added proper/locally-quasi-finite lemma has no Noetherian assumption. No baseline citation was removed or renamed.

Read the reviewed library coverage of StableReduction Layers1–3. Read current StableReduction and JacobianChallenge and the pertinent AlgebraicVectorBundles L0A–L0C signatures at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`. Screened the nine post-snapshot areas and the actual Completed tree. Ordinary line operations stay with AlgebraicVectorBundles/Jacobian, general normalization stays with R09.5, and nodal families and scheme gluing stay with StableReduction. No current stack-clutching implementation was located; this is a bounded search, not a universal absence claim.

Read both exact R09.5 normalization nodes and all six imported SF.1 interfaces. R09.5’s locally Noetherian chart construction and finite-type-over-Nagata finiteness apply to the reduced boundary over Z. SF.1 remains `needs_changes`; only quotient/torsor, representability and compatible-family QCoh descent contracts are consumed. No exactness of invariants, tame stabilizer or stack-QCoh pushforward claim enters the argument. Read the imported MC.0–MC.2 and original MC.3 target statements, including their scope warnings. All eight original MC.3 endpoints have explicit target-coverage entries. The six-node target granularity is appropriate; the local algebra stays in the proof sketches, and existing upstream notions are not redeclared.

## Validation and handoff to orchestration

- `check_blueprint.py` with a seven-entry subset derived from the independently inspected pinned declaration sources: exit 0, no errors or warnings. This subset is a check of the seven references, not an exhaustive library index.
- Source-issue field validation and published-version receipt validation: pass.
- Exact reader comparison of all six statements, hypotheses, proof steps, acceptance clauses, direct prerequisites, fifteen API contracts and ten tests: pass.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.3.lean`: exit 0; nine admission warnings, no errors or other warnings. Compilation used the shared pinned build, after checking more than 20 GB available memory; no language server or library build was started.
- `git diff --check`: pass.

No decision is needed to accept this pass. For subsequent closure, preserve MC3-G1’s exact R1/R2 refinements and route MC3-G2’s approximation work to the existing Part II foundations obligation, not back to the parent. Do not infer closure from the accepted review or from SF.1’s imported ids. No ownership move to a higher-tier roadmap is proposed, and no upstream roadmap was edited.
