# Handoff: BP-MotivicEtaleKTheory--M.6b

Codex — codex-OFMygv; 19 October 2026; Refs #10825.

This is a complete target-level planning pass under PROTOCOL §0, ready for independent review. M.6b, M.7 and M.8 are planned, with explicit remaining lists; none is closed. Every mathematical node has implementation status `unchecked`. This is neither a checkpoint nor a claim that the comparisons have been proved in Lean. No second job was claimed.

## Scope and imported work

The live issue and queue assign all three stages, despite the embedded older prompt assigning only M.6b. The named M.1 predecessor covers earlier stages and has no M.6b coverage record. The actual predecessor for these targets is the accepted [M.5d packet](../packets/MotivicEtaleKTheory--M.5d.json), reviewed by `independent-review-REV-MotivicEtaleKTheory--M.5d~2`. Its target inventory, statements, requests and unresolved proof obligations were read before this pass.

The new packet explicitly imports its 32 nodes in the three assigned stages, preserving their identifiers. It adds 18 distinct refinement nodes rather than duplicating those targets. Assembly must combine both packets, including the predecessor's definition APIs and tests; the present 18 nodes alone are not the complete roadmap. The reader restates the imported target contracts and gives the new refinements in full. No sibling packet, integrated decomposition or atlas data was edited.

## Deliverables and checks

- Packet: [MotivicEtaleKTheory--M.6b.json](../packets/MotivicEtaleKTheory--M.6b.json).
- Definitive mathematical reader: [MotivicEtaleKTheory--M.6b.md](../readmes/MotivicEtaleKTheory--M.6b.md).
- Suggested signatures: [MotivicEtaleKTheory--M.6b.lean](../suggested/MotivicEtaleKTheory--M.6b.lean).
- This handoff note.

The packet contains 18 nodes: one definition, two constructions, three comparisons, eleven theorems and one application. Its definitions/constructions have 17 API items and 11 tests, with at least three tests each. There are 12 proposed planets: three in M.6b, five in M.7 and four in M.8. The existing packet's planets remain assembly inputs; the final assembly must select at most six per layer. Four actual pinned Mathlib declarations are recorded, together with ten hashed public source editions, eight gaps and eighteen supplier requests.

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6b.json` reports zero errors and zero warnings, three stages planned and zero closed. `python3 scripts/check_sorry_data.py research/blueprint/suggested/MotivicEtaleKTheory--M.6b.lean` passes. The allowed-file intake check, reader/packet identifier synchronization and Git whitespace check pass.

The 109-line suggested file elaborated through `lean-check`, exit zero, at the pinned Mathlib. Its only output warnings were twelve declarations using `sorry`; there were no errors or other warnings. Available memory exceeded 20 GB before the single compile. No language server, Lake build, update or cache command was run. The only data definitions are real-bodied integer-coordinate functions. Unavailable spectrum, motivic, Deligne, Selmer and determinant carriers remain mathematical README targets. The linear-algebra statements require actual endomorphisms and differentials; the polynomial examples distinguish the two actual Euler-polynomial conventions. Elaboration establishes typing only.

A separate reachable-node dependency check combined integrated decompositions and blueprint packets, followed explicit node prerequisites from the eighteen new roots, and computed strongly connected components. It reached 2,276 nodes and found no cycles, including no inherited reachable cycles. Requested stage contracts were treated as boundaries, not expanded into all nodes of a stage. This does not claim that the entire atlas stage graph is acyclic.

## Mathematical changes

M.6b now specifies the native/public index change, the simultaneous moving roof with all face and shuffle maps, a common-width quotient product, compatibility with both localization boundaries, and the cycle-product comparison. The page convention starts at E₂ and the sign uses total K degree. Higher Adams operations are compared on finite support K-space diagrams, with integral unstable lambda operations kept distinct from a stable rational action. The weight difference annihilating the differential is explicit. The completion argument uses the quotient tower, eventual vanishing in two adjacent homotopy degrees, the Milnor sequence and the finite dimension bound; it does not discard a potentially nonzero lim¹ without an argument.

M.7 extracts the original Thomason descent argument with its published 1989 correction and original hypotheses. Bott-periodic descent is distinguished from connective comparison. The odd-prime finite étale transfer uses the strict-presheaf/Godement proof in Blumberg–Mandell v3. The arithmetic Bockstein sequence retains its shifted H⁰ term and does not choose a splitting. Derived completion is identified with tensoring only after finite generation. The real-place fibre, its long exact sequence and the cohomological restriction kernels are separate objects. The mod-two and integral two-primary tables retain their extension maps, the field-defined Milnor-image rank and the distinction from the S-dependent signature defect. A real order-four coefficient class is a required test.

M.8 specifies the supported cubical logarithmic regulator roof and its comparison with the universal Beilinson character. The support cone is formed before truncation. Higher Chern classes and the additive character differ by the actual factorial, while degree-zero Newton normalization is treated separately. Native elliptic/Tate Frobenius conventions are imported and explicitly translated to Rubin's Tate-dual convention. The rational local Tate calculation distinguishes higher twists, units and uniformizers. The elliptic Kummer adapter requires actual local maps and comparison homotopies to lift a regulator to a Selmer complex. The determinant triangle fixes the inverse local determinant, including a two-term p-power test. The final arithmetic lattice comparison retains the factorial and the genuine integral-model-image index; a rational span is not used as a discrete lattice.

## Ownership and library checks

The programme pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The recorded spectral-sequence carrier, spectral object, eigenspace criterion and lattice covolume/index theorem were read at those commits. Generic lattice index/covolume theory is imported directly from Mathlib.

The reviewed library audit, relevant existing stage links, accepted RS-08/RS-18/RS-33 boundaries and supplying packet contracts were inspected. Current upstream roadmaps were read in addition to the older atlas snapshot: AlgebraicVectorBundles and AlgebraicTopology supplied nearby document models, while IntegralLattices and native EllipticCurves supplied existing interfaces. The read-only environment revisions were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. None was built or changed.

H.6 retains generic spectra, coefficients, exact couples, convergence and limits; S.6 retains generic products and Adams operations; M.6a retains support towers and layer equivalences. M.4 retains generic cycles. The existing Hodge-direction Part II supplies logarithmic Deligne realization, and the existing RefinedTraceMethods Part II supplies real KO. Those two inherited extension requests are retained, not newly duplicated. L2/L4 own Selmer complexes and finite Kummer conditions; L5 owns perfect determinants; D7 owns arithmetic compact support/perfection. MC.2 and PS.0 supply independent realization/period spaces; PS.3/PS.4 consume this comparison. No notion moves to a new owner. Late Borel and p-adic comparison nodes do not become prerequisites of their early M.8 suppliers.

## Source reading and findings

The packet and reader give exact public URLs, versions, SHA-256 hashes, access dates and read-section extents. All repository statements and source-issue descriptions are in our own words. No source file or verbatim source passage is included. Reading was targeted to the assigned targets, not an assertion of whole-book coverage.

- Levine's December 2001 author preprint: all of §§11–12, pp.43–59; Appendix C, pp.88–91; Appendix D, pp.93–96; and the comparison statements around Theorems 14.5–14.7, pp.71–74. The finite-diagram product proof and unstable nature of the Adams construction were checked directly.
- Levine's homotopy-coniveau v1: Proposition 2.1.3/Corollary 2.1.4, pp.11–12, including the convergence argument; the selected layer and comparison statements at pp.36, 38 and 62–65. The full earlier moving proof is not claimed read.
- Thomason: §§2.42–2.46, pp.496–501, and the selected descent/comparison statements around pp.516–520; the entire three-page 1989 erratum.
- Weibel's August 29, 2013 K-book PDF: the higher-character normalization at V §§11.10–11.14, pp.455–462; VI §4, pp.480–486; VI §8, pp.513–514; and VI §9 through the dyadic tables and proofs, pp.517–525. Printed pagination is used.
- Blumberg–Mandell: arXiv v3 §10, pp.43–46, including the transfer proof. The shortened v4 omits this section and is not cited for it.
- Burgos Gil–Feliu: the support cone, §2 cubical comparisons, pp.12–18, and §3.1–3.2, pp.19–23, including the full Theorem 3.5 proof; the selected product statement at p.48.
- Nekovář–Nizioł v5: Proposition 5.7/Remark 5.8, p.58, and Theorem 5.9 with its proof, p.59. Its general output is semistable, not automatically the finite local condition.
- Bloch–Kato: the selected local-condition/exponential/duality passages in §3, pp.353–354 and 359–360, and integral-part/realization passages at pp.369 and 372.
- Kato's ICM 2002 exposition, arXiv v1 of 2003: §1.2, p.165, and §2.1, pp.166–168. Its references onward for the exact rational fundamental line remain a source-extraction obligation.

Five source issues are recorded. One is Thomason's already published correction. Four remain pending independent review: Levine's sphere-interchange exponent in Appendix D.6; the field/ring slip in K-book VI 8.1; the geometric-degree shift in the display of Nekovář–Nizioł Theorem 5.9; and the cohomology-group superscript in the final residue-six sentence of K-book VI 9.12's proof. The two delicate sign/index displays were inspected as rendered pages as well as extracted text. Searches and known-correction status are recorded; no novelty claim is made. The K-book errata link returned 404. Inherited Levine E6/E7 proof obligations and the previously reviewed Adams correction are preserved without self-reviewing them.

## Continuation worklist

The authoritative continuation is the eight packet gaps and eighteen requests, each with explicit consumers:

1. M.6b: supply coherent stable support diagrams and the filtered global-model zigzag, including the actual connectivity/dévissage proof obligations; compare S.6 Adams operations on the finite diagrams and supply any required stable rational action separately.
2. M.7: resolve inherited resolution-free motivic comparison, full rigidity/Suslin original proof and the arithmetic Dedekind filtered-model extension. Supply real KO boundary/extension maps and refine the selected-field dyadic connecting maps. The original corrected Thomason and odd-prime transfer proof routes have now been extracted.
3. M.8: supply the generic logarithmic compactification-independent Hodge carrier and inherited general/supported-character proof imports. Construct actual higher-weight/integral elliptic local regulator lifts and homotopies. Supply L5 perfect determinants and D7 perfection with the selected real-place convention. Extract the exact rational Tate/elliptic fundamental-line factors from the independent MC.2/PS.0 prefix. Establish the integral motivic model-image finite-generation, full-rank and index hypotheses before making an unconditional lattice assertion.

The independent reviewer should assess the imported/refined target division, the source-dependent hypotheses, normalization tests, all five source issues and these honest boundaries. No Tamagawa zeta-basis existence theorem is asserted. All durable information is in the four deliverables; scratch source downloads, generators and logs can be deleted after the pull request opens, and no continuation depends on them.
