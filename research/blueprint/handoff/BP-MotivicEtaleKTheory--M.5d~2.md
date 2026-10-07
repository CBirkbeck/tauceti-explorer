# BP-MotivicEtaleKTheory--M.5d~2 — revision handoff

Codex — codex-HyXZcE, 2026-10-07. Refs #6995. This finishes the target-level revision of the existing plan; it is not a checkpoint. The packet is `complete`. M.5d, M.6, M.6a, M.6b, M.7 and M.8 are all `planned`; none is `closed`. All implementations remain `unchecked`. All 67 original node identifiers and the entire preceding independent `review` object are preserved. That historical `needs_changes` verdict is not a verdict on this revision; the next independent reviewer must replace it.

## Revision changes

The reader now reflects the reviewed packet, including all accepted corrections to source labels, coefficients, higher Chern normalization, proper K₀ GRR scope, semilinear pullbacks, supports, finite generation, Tate twists and local-condition image/range.

| Reviewed node | Revised interface and discriminating evidence |
| --- | --- |
| M.6a/global-model-comparison | An augmented-tower comparison contains transition and K(X)-augmentation squares. These are homotopy-category shadows of the supplier's coherent stable comparison. The geometric HC/FS filtered-zigzag gap remains explicit. |
| M.6b/motivic-exact-couple | Three range–kernel laws bind the actual i/j/k maps. Raw d₁=j∘k is motivic d₂, with square-zero proved from exactness. The requested H.6 derived couple is identified with homology of this differential. The negative-weight example uses the augmented filtration's vanishing. |
| M.6b/filtered-adams-operations | Actual transition/augmentation-compatible tower endomorphisms induce differential-compatible page maps. The augmentation agrees with scheme Adams, and the E₂ cycle identification transports the weight law for k≥2. |
| M.6b/rational-motivic-degeneration | Actual rational page actions commute with the same differential and inherit scalar weights through page homology. The conditional algebraic vanishing is proved using distinct powers of 2. Finite-filtration splitting uses corrected polynomial-projector identities. |
| M.6/motivic-spectral-sequence | Pullbacks commute with both differential and E₂ cycle identification, with H.6 identity/composition laws. Field-diagonal, weight-zero and F₃ K₁ examples use that field's cycle/Quillen models. General H⁰(X,Z(0)) is not identified with Z. |
| M.8/motivic-chern-character | The comparison is restricted to the simultaneous Adams eigenspace. It uses Adams compatibility and normalization on actual spanning cycle generators; no arbitrary comparison on all rational K-theory is asserted. |
| M.8/norm-compatible-regulator-families | Separate varying-ring norm families from Soulé's fixed-base A=O_F[1/p] output. Actual graded unit/Bott powers, extension and base carriers, coefficient/norm transfer squares and projection formula bind the construction. Tests evaluate exponents zero/one, the actual extension-to-base regulator/corestriction square, and the genuine C/R norm of the base unit 2 (4≠2). The source range i≥2 is distinguished from the elementary i=1 extension. |
| M.8/arithmetic-fundamental-line | Remove whole PS.4 and use the independent MC.2 realization, PS.0 period-space and L5 determinant inputs. Base change, triangles, zero and shift use actual supplied determinant operations. Integral-basis and selected rational-factor/sign obligations remain. |
| M.8/regulator-determinant-comparison | The line equivalence is induced by the actual regulator determinant map, conditional on bijectivity, and composed with the independent period comparison. Real and p-adic coefficient embeddings remain separate. PS.3/PS.4 consume this output downstream. |

Generic exact couples/pages/limits belong to H.6, coherent diagrams to E3, descent to E2 and concrete spectrum comparison to E5. Cycle complexes remain with M.4; scheme K/Adams/GRR with S.3/S.6/S.7. Scheme curve pairings use EDC.2 and MC.2 base change. No supplier is replanned. Accepted RS-08, RS-28 and RS-33 ownership is retained.

## Counts and validation

The final packet has **67 nodes: 33 theorems, 18 constructions, 11 lemmas, 2 definitions, 2 comparisons and 1 application; 66 API items; 61 named examples; 30 planets; 30 baseline declarations; 36 supplier requests; 11 proof/source gaps**. No node was added or removed. The two added API items are derived-couple homology and page-pullback identity/composition; the added example is the actual field-norm non-example.

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.5d.json` passes with **0 errors and 0 warnings**. Additional checks verify the internal prerequisite DAG, a named request for every stage prerequisite, declaration/API/example correspondence in the suggested file and reader, preserved IDs/review/inherited source findings, all 15 public PDF hashes and all 84 citation excerpts. The transitive atlas requires graphs visit 11 stages for PS.0, 10 for MC.2 and 6 for L5, including the supplier itself; none contains M.8. Broad atlas edges were not edited; early regulator exports remain declaration-specific.

All 30 baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The four added citations are the native norm of an algebra-map element, C/R finrank, strict monotonicity of powers and the linear equivalence induced by a bijective map.

The final `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.5d.lean` exited **0**, with **169 warnings, all declaration uses of `sorry`**, and no other diagnostics, at the pinned Mathlib. Memory available before the check was 100 GiB. Checks were sequential through the shared wrapper. No language server, Lake build/update/cache operation, separate project or repository copy was used. Placeholder warnings remain visible and nonfatal because the shared project's warning-as-error setting would otherwise reject planning prototypes. The compiled Tau Ceti semilinear-map module is absent from the shared build; its genuine typed map and derivation compatibility remain supplier inputs. Elaboration checks types, not the source-level geometric or arithmetic claims.

## Sources and findings

This revision retrieved all 15 public sources at their recorded hashes and rechecked the focused K-book VI.4.2/4.9 and V.11.11–11.13, Levine support/Adams/projector, Friedlander–Suslin 13.17/13.18, FGV Proposition 2.9, Soulé 4.1–4.4 and Kato 1.2/2.1 passages. In Levine's author-hosted preprint, Lemma 14.6 pp.71–72 was visually checked and Theorem 14.7 pp.73–74 read. This does not assert full rereading of every source or acquisition of the original proof inputs listed below. Public URLs, edition/read provenance and SHA-256 values are in the packet's source ledger.

The inherited independent source verdicts remain intact: **E1, E3, E501, E502 and E504 confirmed; E2 rejected**. The reader now states these verdicts. Two new findings await independent review: **E6**, omitted projected arguments in Levine Lemma 14.6(1)'s eigenvalue identities, with a two-weight counterexample; and **E7**, the opposite-direction induction in its part-(2) proof, which does not prove the stated reverse inclusion. E7 does not claim the lemma is false; the rational splitting uses part (1). Both findings are explicitly scoped to the author-hosted preprint, not a published version. The author catalogue and targeted correction searches found no correction; novelty remains unestablished.

The four assigned red-team routes remain covered: RT-AREA-ktheory-1/2 has the mod-prime motivic-complex bridge, separate Beilinson–Lichtenbaum truncation and Dedekind application; 1/3 places the independent Suslin real comparison before dyadic output and requests real BO/KO from RT.4 Part II; 1/13 keeps BGK independent of M.5a–M.5c with DD.3/CR.4 differential inputs; 2/18 exports early finite Chern classes/product identities to HB.1/HB.2/D.2 without late regulator prerequisites. Only this job's four deliverables were changed; no upstream roadmap, paper extraction or link file was edited.

## Precise remaining work and resumption

The 36 requests retain their exact exports and consumer node IDs in the packet. This revision replaces the PS.4 request with the independent PS.0 period-space request and extends the MC.2 realization request; L5 supplies determinant operations. Early Chern and number-field Deligne exports remain independent of downstream D.2/R.7 comparisons. Supplier blueprints and typed stand-ins do not discharge these imports.

The next independent reviewer should start with the nine repaired rows above, inspect their actual algebraic hypotheses and fixed-base transfer variance, verify E6/E7 visually at the recorded edition, then reconcile the preserved historical review with this revision. Follow-up source/proof refinement must address these 11 gaps:

1. **BGK elimination and relative proof engines.** Acquire/read Kato 1982, Galois cohomology of complete discrete valuation fields, LNM 967 §1, pp.215–238. Refine BK Proposition 2.4 into adapted-p-basis, relative diagram and lexicographic-elimination nodes; independent review confirmed E1/E3/E501/E502/E504 and rejected E2 as a demonstrated misprint. BK §2 was read, but its cited Kato proof input is not replaced by the defective supplementary sketch.

2. **Resolution-free Beilinson–Lichtenbaum input.** Geisser–Levine 2001, Invent. Math. 143, pp.55–113: original author PDF BlochKato.pdf returned 404. Read its resolution-free cone/truncation proof and extract the exact semilocal transfer hypotheses. SV2000 Theorem 7.4 was read with resolution of singularities and does not supply the unconditional version by itself; Geisser Dedekind §5 supplies only the cited application.

3. **Global filtered-model comparison.** Read the complete comparison between Levine homotopy coniveau and the Friedlander–Suslin global multi-relative K tower, and construct a filtered zigzag with augmentation/layer compatibility. Levine Theorem 6.4.1 and FS Theorem 13.13 each give their own layers; equality of E₂ pages is not the missing global equivalence.

4. **Filtered multiplicative comparison proof.** Read Levine, K-theory and motivic cohomology of schemes, §11 and Appendix D in full and extract the simultaneous-moving pair product and its coherent cycle comparison. The source statements, support diagram and degree conventions were read; a general multiplicative filtered diagram is not established just by a binary product on K groups.

5. **Admitted base-field and arithmetic tower extension.** The constructed tower and elementary convergence bound are for smooth finite-dimensional schemes over a perfect field. Read/resolve the continuity and arithmetic-base filtered construction needed for arbitrary fields and the Dedekind arithmetic motivic sequence; Geisser Theorem 1.2 gives the arithmetic low-degree complexes, not the entire filtered K tower.

6. **Thomason general descent proof.** Read Thomason 1985/1988 original Bott-inverted étale descent theorem and its Tate–Tsen filtration assumptions. FGV §§2.6–2.8 was read and the number-ring odd-prime case is explicit; do not promote its “mild hypothesis” to all fields or regular schemes. The totally imaginary dyadic extension requires the exact original coefficient/descent theorem.

7. **Coherent étale transfer source.** Read Blumberg–Mandell 2015 §10, cited by FGV transfer proof, for the map of étale descent towers. Refine ramified finite-perfect transfers with the relative dualizing/different-line correction; FGV’s principal-different cyclotomic example is not a proof for every ramified ring extension.

8. **Suslin neighbourhood and stability inputs.** The complete K-book VI §3 sketch and its reductions were read. Acquire the original Suslin/Lie-group small-neighbourhood homology and stabilization proof inputs cited in Lemmas 3.5–3.8, then refine them in the appropriate topology/rigidity owner. Do not use the real mod-2 table as a proof of the initial real comparison.

9. **Supported universal character original.** Acquire/read Gillet 1981 Definition 2.34(ii), Theorem 3.1 and §2.35, and Gillet–Soulé 1987 Proposition 5.5. Li–Liu Appendix B and its supported pairings were read but do not replace the universal supported Chern/γ-filtration proof.

10. **General motivic Deligne realization.** Read Huber’s mixed realization construction cited by K-book V Example 11.12 and its multiplicative realization of the cycle complex. Burgos §§10.1–10.4 supplies the actual logarithmic cone and early number-field map; generic compactification independence and the comparison with the integral motivic class still require the Hodge/MC.2 supplier.

11. **Local regulator and determinant case hypotheses.** Read/refine the precise Tate/elliptic rational fundamental-line factors and their determinant signs from the original formulation cited by Kato §2.1, plus the local Selmer/regulator comparison proofs. Kato’s rough description does not fix every factor/sign or prove the conjectural comparison. MC.2/PS.0 provide independent realization/period spaces and L5 provides determinants; no PS.4 theorem is assumed. Retain exact motivic finiteness, perfectness, coefficient embedding and regulator/period assumptions. No unconditional elliptic Tamagawa leading-value or integral-basis theorem is asserted.

Each scoped stage's remaining refinements are recorded in its coverage entry. M.5d needs BGK proof engines and resolution-free coefficient comparison; M.6/M.6a/M.6b need the global filtered, multiplicative and arithmetic-extension proofs and supplier constructions; M.7 needs original descent/transfer/real-stability inputs; M.8 needs original supported Chern/realization sources and exact conditional determinant/local-regulator data. Resume from those entries without adding proof-lemma decomposition as a condition of this finished target-level revision.

The scratch sources, extracted text and worklist are disposable. All information needed for resumption is in the four deliverables and their public source references; no scratch artifact is required.
