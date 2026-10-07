# Handoff — BP-HodgeStructuresPartII--H.5 (rigid loci, arithmetic models and integral variations)

Agent: Claude (Claude Code, Opus 5.5), session `claude-6aEErt`. Job `BP-HodgeStructuresPartII--H.5`, Refs #6943. The claim was confirmed by the bot before work began. This is a complete planning pass, not a checkpoint.

## Result

The packet `research/blueprint/packets/HodgeStructuresPartII--H.5.json` has status **complete**; its single stage `HodgeStructuresPartII:H.5` is **planned** (not closed). It has 54 nodes (1 application, 3 comparison, 6 construction, 13 definition, 1 lemma, 30 theorem), 140 API items, 84 unit tests, 6 planets, 22 baseline declarations (each read at the pinned commit), 15 supplier requests, 10 gaps and 5 source issues. Every implementation status is `unchecked`.

Planets: Rigid local system, Cohomological rigidity, Rigid local systems are variations, Splitting of the rigid Hodge locus, Nice arithmetic models, Integrality of rigid local systems.

What the layer plans, by proposed sub-layer:

- **H.5a Rigidity and rigid loci**: trace-free adjoint coefficients; tangent spaces with prescribed boundary classes (Klevdal–Patrikis 4.6, Esnault–Groechenig 2018 2.3); rigid, projective-rigid, cohomologically and strongly cohomologically rigid representations, connections and Higgs bundles; good compactifications and quasi-unipotence; the moduli with prescribed local monodromy; the intermediate-extension comparison; correspondence of rigid objects across the H.1 moduli; finiteness; Aut(ℂ)-invariance; fields of definition; the rigid locus as Mathlib's quasi-finite locus.
- **H.5b Hodge theory of rigid objects**: rigid Higgs bundles are 𝔾_m-fixed and nilpotent (EG Lemma 2.1); systems of Hodge bundles and Simpson's Lemma 4.1; the variation/Hodge-bundle correspondence; rigid local systems underlie complex variations (Simpson Lemma 4.5); deformation to variations (Simpson Theorem 3, Mochizuki); Landesman–Litt Lemma 4.3.2; unitary representations; vanishing graded Higgs field iff unitary; the rigid Hodge locus and its splitting (EG Lemma 4.9).
- **H.5c Arithmetic models**: smooth arithmetic models (EG Lemma 3.1), Langer's relative moduli, the nice models of EG Proposition 3.3 (a)–(e) and Proposition 4.10 (with corrected indices).
- **H.5d Integrality**: integral, strongly integral, integral realizations; finiteness criteria; the Salem-character example; the local criterion; Esnault–Groechenig and Klevdal–Patrikis integrality; geometric origin; integral PVHS; Landesman–Litt 2022 Theorems 1.2.5 and 1.2.12 and Lemma 7.2.1; cohomologically rigid SL₃ (Langer–Simpson); no symmetric differentials (Arapura, Brunebarbe–Klingler–Totaro); the fibrewise H¹ lemma; Landesman–Litt Proposition 8.2.1.

Routed catalogue items covered: Esnault–Groechenig 2020 items 001, 002, 008, 048–052, 062 (rigid locus part), 063–065, 089, 103, 105–107, 119, 121, 135, 136; Landesman–Litt 2024 items 37, 38, 58–61, 63, 72, 73, 79, 137, 138; Klevdal–Patrikis 2025 item 031 (integral realization). Items 003, 004, 006, 007, 061, 062 (moduli) are planned by H.1.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.5.json` (with the worker declaration index): 0 errors, 0 warnings.
- Every source excerpt was matched (Unicode-normalised, whitespace-collapsed) against the text of the downloaded public PDF it cites; hashes are recorded in `sources`.
- No node-level prerequisite cycle across all packets.
- Every definition, API item and unit test of the packet appears in the suggested file, either declared/stated natively or in the omission inventory with its statement (`signatureCoverage`).
- The suggested file elaborates: `lean-check` at Mathlib `082e2d37e8` exits 0 with no errors and 105 warnings, all "declaration uses `sorry`". The two imported Tau Ceti modules (`TauCeti.AlgebraicTopology.LocalCoefficient`, `TauCeti.Topology.Algebra.UnitaryGroup`) have no .olean in the shared build, so the check inlined their sources from the pinned commit f790474 in a scratch copy; the committed file imports them normally.
- The reader document is generated from the packet and contains none of the words the protocol forbids.

## Suggested file

8 nodes are fully declared, 11 partly, 35 only in the omission inventory; 121 names are native and 138 are listed with their statements. Native: trace-free adjoint, strong and boundary-relative cohomological rigidity via Mathlib group cohomology, Simpson's orbit form of rigidity, quasi-unipotence at loops, unitary/integral/strongly integral representations, integral realizations, the finiteness theorems, the Salem character, the rigid locus (quasi-finite locus), the Mathlib-expressible part of an arithmetic model, a chart model of systems of Hodge bundles, the fibrewise H¹ lemma. Omitted carriers: moduli spaces of H.1, flat bundles on varieties, polarized variations (H.2), PGL_r, completions/companions, Teichmüller space, general reductive group schemes, line bundles and projective morphisms.

## What remains (precisely)

- Lemma-level decomposition when the roadmap comes near the front of the line: split the multi-part theorems (rigid-hodge-splitting (i)–(v), nice-hodge-models (a)–(c), no-symmetric-differentials (a)–(c), rigid-sl3-geometric (a)–(b)) and promote the API items used as prerequisites (Hitchin scaling, trace splitting, base change of H¹) to lemma nodes.
- Resolve the recorded gaps: Mochizuki's tame theory, ℓ-adic companions and tame specialization (pending Part II roadmaps of GlobalShtukas and InverseGalois), Langer's mixed-characteristic boundedness, the analytic intermediate extension, the Tannakian inputs of the Hodge splitting, isomonodromy carriers, the Brunebarbe–Klingler–Totaro and Langer–Simpson inputs, and finite presentation of quasi-projective fundamental groups.
- Replace the stage prerequisites HodgeStructuresPartII:H.2 (polarized complex variations, semisimplicity and uniqueness up to shift, Schmid extension) and HodgeStructuresPartII:H.4 (Landesman–Litt Theorem 6.2.1, parabolic semistability) by node ids once those layers are planned, and check that their statements match the uses recorded here.
- Discharge the supplier requests (R09.1, R09.2, R09.4, R09.5, R09.7d, C5 with coefficients, EDC.5, LPV.1, SF.0, GS.6, DWP.7, IG.1, CA.6, Tau Ceti AlgebraicTopology stages 5–6).
- Elaborate the omission-inventory signatures of the suggested file against native moduli carriers once H.1's carriers exist.

Gaps (full text in the packet and reader):

- G1. Quasi-projective non-abelian Hodge theory (Mochizuki) — needed by deformation-to-cvhs, coh-rigid-semisimple-cvhs, low-rank-pvhs-unitary.
- G2. ℓ-adic companions on smooth varieties over finite fields — needed by integrality-EG18, integrality-KP.
- G3. Boundedness of semistable Λ-modules in positive and mixed characteristic — needed by relative-moduli.
- G4. Analytic intermediate extension of local systems — needed by intermediate-extension-h1.
- G5. Tannakian inputs for the equivariant splitting of the rigid Hodge locus — needed by rigid-hodge-splitting.
- G6. Isomonodromic deformations and analytically general curves — needed by low-rank-pvhs-unitary, very-general-rank-bound.
- G7. Symmetric differentials, positivity and p-adic harmonic maps — needed by no-symmetric-differentials.
- G8. Langer–Simpson's construction of geometric origin in rank three — needed by rigid-sl3-geometric.
- G9. Finite presentation of fundamental groups of smooth quasi-projective varieties — needed by prescribed-monodromy-moduli.
- G10. Native Lean carriers for the moduli statements — needed by rigid-connection, hodge-rigid-locus, relative-moduli, smooth-arithmetic-model, prescribed-monodromy-moduli, system-of-hodge-bundles.

## Requests to other roadmaps

- `AlgebraicModuliForArithmeticGeometry:R09.5` — for betti-tangent, projective-rigidity, prescribed-monodromy-moduli, relative-moduli, derham-betti-tangent.
- `AlgebraicModuliForArithmeticGeometry:R09.4` — for prescribed-monodromy-moduli.
- `AlgebraicModuliForArithmeticGeometry:R09.1` — for prescribed-monodromy-moduli.
- `AlgebraicModuliForArithmeticGeometry:R09.2` — for relative-moduli.
- `AlgebraicModuliForArithmeticGeometry:R09.7d` — for boundary-monodromy-data.
- `ComplexComparisonPartII:C5` — for derham-betti-tangent, geometric-origin, geometric-origin-integral-pvhs.
- `EtaleDualityAndPerverseSheaves:EDC.5` — for intermediate-extension-h1.
- `LefschetzPencilsAndVanishingCycles:LPV.1` — for boundary-monodromy-data, geometric-origin.
- `SchemeAndStackFoundations:SF.0` — for smooth-arithmetic-model, simultaneous-spreading, nilpotent-rigid-models, rigid-locus-exhaustion.
- `GlobalShtukasAndFunctionFieldLanglands:GS.6` — for integrality-EG18, integrality-KP.
- `DeligneWeightsAndPurity:DWP.7` — for integrality-EG18.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1` — for integrality-EG18, integrality-KP.
- `ClassicalArithmeticCompletion:CA.6` — for infinite-image-unitary-example.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` — for fibrewise-h1-vanishing.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` — for prescribed-monodromy-tangent.

## Notes for the reviewer and for H.2/H.4

- H.2 must supply: the polarized complex variation carrier (Simpson's convention, no lattice), semisimplicity and isotypic decomposition, uniqueness of a variation on an irreducible local system up to shift, and Schmid's extension of variations across a closed subset where the local system extends. Consumers: cvhs-hodge-bundles, zero-higgs-unitary, coh-rigid-semisimple-cvhs, geometric-origin, integral-pvhs, geometric-origin-integral-pvhs, low-rank-pvhs-unitary.
- H.4 must supply: Landesman–Litt Theorem 6.2.1 (H⁰(M, R¹π°_* V) = 0 for unitary V of rank < g on a punctured versal family, with Artinian coefficients) and the parabolic semistability of isomonodromic deformations (LL22 Corollary 6.1.2). Consumers: versal-unitary-rigidity, low-rank-pvhs-unitary.
- Source issue E-H5-2 (EG20 Lemma 4.9) is a gap in the printed proof, not a claim that the lemma is false: finiteness, the reduced splitting and the equivariant non-reduced splitting are proved here (the last via torsors on [𝔸¹/𝔾_m] and Ziegler's Theorem 1.3, whose Tannakian inputs are gap G5). EG20 also uses the splitting at W_i(k(s))-points of the arithmetic model (p.135), which needs it to spread to the model.
- The design packet's coverage text for H.5 asked for 'End-zero tangent conventions'; these are pinned as the trace-free adjoint g^der (sl_r for GL_r and PGL_r) throughout.
- Proposed restructure: sub-layers H.5a–H.5d (node lists in `restructure`).
- Upstream note for the Tau Ceti algebraic-topology roadmap: low-degree cohomology of local systems and the five-term sequence of a fibration.

## Sources

Read (public, hashed, 7 October 2026): Esnault–Groechenig, Acta 2020 (published PDF); Esnault–Groechenig 2018 (arXiv v3, complete); Landesman–Litt 2024 (arXiv v4, §§1.10, 4.3, 8, 9.1); Klevdal–Patrikis (arXiv v2, §§1, 3, 4); Langer–Simpson (arXiv v3, introduction); Brunebarbe–Klingler–Totaro (arXiv v3, introduction and §4); Landesman–Litt 2022 (arXiv v2, §§1.2, 7.2–7.3); Langer 2014 (arXiv v2, §1); Simpson 1992 (§4); Simpson 1994, Moduli II (introduction and §10, isosingularity); Simpson 1996 (Lemma 7.2, Theorem 9.1, Corollaries 9.2, 10.2–10.3); Ziegler 2015 (arXiv v4, §1 statements).
Not read: Mochizuki's Memoirs (tame harmonic bundles); Drinfeld 2012/2018; Lafforgue; Langer 2004; Arapura 2002; Daileda; the published versions of the arXiv papers above; Klevdal–Patrikis 2025 (Springer refused the PDF download; its routed item 031 is covered from KP20 and Landesman–Litt Definition 8.3.1).

The scratch directory (source PDFs, extracted text, builder scripts) is deleted after submission; everything needed to continue is in the four deliverables.
