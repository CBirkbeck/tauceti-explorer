# Handoff: BP-PhiGammaModulesAndIwasawaCohomology

Issue #975. Worker: ChatGPT Pro / GPT-6 Astra Pro. Session `chatgpt-20260926-c8f4a1`.
Branch `chatgpt-20260926-c8f4a1-phi-gamma`.

## Deliverables and status

Four authorized files: packet, roadmap document, suggested signatures and this handoff. **32 nodes:** 1 definition, 14 constructions, 8 lemmas, 7 theorems, 2 comparisons. **45 API entries**, **45 named tests**, **10 planets** (five PG.3, four PG.4, one PG.5), **9 pinned baseline declarations**, **5 gaps**, **3 supplier requests**. Three existing scalar Coleman imports are separately recorded, not recreated as nodes.

PG.3–PG.5 are partial. PG.0–PG.2 and PG.6–PG.7 have no new declaration nodes and retain full proof-source worklists. **No stage is closed.** The checkpoint uses native module/tensor/cochain/homotopy/homology carriers. It does not construct an arithmetic period ring, prove Fontaine equivalence or identify internal homology with Galois/Iwasawa cohomology.

## Mathematical progress

The integral module operator is the balanced extension of canonical scalar psi through the actual Frobenius linearization. Pure-tensor, left-inverse, uniqueness, naturality, semilinear Gamma and finite-coordinate continuity statements are explicit. Rank-one formulas retain the unit multiplier and its basis covariance. Existing scalar trace/psi comparisons are imported from the current Coleman packet.

For the signed Herr map F, put P=1-phi psi and let q be the inverse of gamma-1 on ker psi composed with P. Then Bq=qB=P, q phi=0 and psi q=0. The corrected section is id, (a,b)↦(-phi(a)-q(b),b), -phi. The homotopy has only H2(c)=(q(c),0). The packet derives both chain squares, FS=id and id-SF=dH+Hd. These section/homotopy formulas are worker expansions of KPX's kernel proof, not asserted source quotations. The actual analytic inverse remains a gap.

The native psi complex is supported in degrees 1 and 2. Its kernel/cokernel descriptions use canonical homology maps. The real inverse-corestriction comparison and derived character specialization still require their arithmetic proofs, inverse character twist and Tor corrections.

## Checks actually run

The scratch `regressions.py`, seed 975, passed **1,011 exact finite-algebra scenarios**: 180 projection/resolvent; 180 signed chain comparisons; 180 homotopy/retractions; 180 integral trace coordinates; 180 rank-one basis changes; 100 tensor-balancing/left-inverse cases; 11 negative controls.

The main fixtures use exact rational sparse Laurent polynomials, p in {2,3,5,7}, a non-scalar commuting rank-two Gamma action and an explicit model inverse for B. They are algebra fixtures, not actual period-ring Galois representations. Negative controls include wrong comparison signs, omitted correction or inverse hypothesis, phi psi mistaken for identity, arbitrary scalar-basis projection, torsion trace division, integral order-two invariants and nonzero Tor under specialization.

Local structural checks on the authored versions passed: JSON parsing, unique IDs, local prerequisite acyclicity, eight-stage coverage, API/uses/test requirements, per-stage planet bounds, companion node/API/test-name presence and prohibited-token checks. Published prose is condensed, with the same node/declaration/API/test inventory and mathematics. These local checks are not the official full-world/declaration-index validator; the unmodified PR CI supplies that validation and its live result is reported on the PR/issue.

**Lean was not compiled.** No Lean/lake or local pinned checkout is available. Check scalar restriction on tensor products, ModuleCat coercions, dependent term reduction, polynomial fixtures and native homology identifications during elaboration. The section and resolvent theorem explicitly bind the inverse and commutation hypotheses; they must not disappear because a prototype proof is admitted. Native Homotopy and HomotopyEquiv field names/conventions were checked in the pinned source. No claim that every signature elaborates is made.

## Inputs, ownership and baseline

Read current WORKERS, blueprint and source-faithfulness protocols, upstream guide, full current roadmap, atlas stage descriptions and accepted RS-26. Revisited introductory/interface portions of upstream ProfiniteCohomology and AdicSpaces as style examples; not a claim to have read both whole documents this pass.

Read relevant accepted AUDIT-38 PG records and REV-AUDIT-38. The oversized aggregate `data/library-coverage.json` could not be read, so the accepted source audit was used. Broad absence claims are attributed to that audit, not a fresh exhaustive search of both libraries. Its correction concerning existing topological-coefficient low-degree cups/corestriction is respected.

All nine cited baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti stays pinned at `f790474821cf4256814db967cb154e7af3d0c369`; no uninspected declaration is called a built arithmetic comparison.

Read current Coleman nodes `coleman-trace-coordinates`, `coleman-trace-divisibility`, `coleman-trace-psi`, `frobenius-zeroth-coordinate-psi` and immediate context. These already plan normalized trace and bounded scalar psi. This packet does not create a competing scalar operator.

Read the current ArithmeticGaloisDuality D7 and SelmerIwasawaCohomology L3 contracts. Exact PG.3/PG.4 searches in the links directory returned zero hits. The broader search returned 28 files, not all read; no exhaustive link-directory audit is claimed. The current atlas and accepted restructuring supply the ownership interfaces used here.

## Papers actually read

KPX: retrieved arXiv:1203.5718v3, 79 pages. Its margin is dated 19 November 2013; the retrieved cover says 1 November 2018. Both are recorded. Read scalar/module psi, signed Herr diagram, local kernel proof, kernel-inverse proof route, and two-term/derived specialization passages. Printed pp.16,21,22,27 were rendered. Imported original proofs, notably Pottharst [42], Theorem 2.8, remain unread. The JAMS publication PDF was unobtainable; UC eScholarship returned metadata, not the text.

LLZ: publisher ANT 5(8) (2011), 1095–1131, scalar coefficient/psi/Mellin conventions and section-3 input map. Parsed publisher text read; publication rendering failed. Berger introduction, arXiv:math/0210184v1, III.2.4 read and rendered for its torsion convention. No whole-paper or original equivalence-proof reading is claimed. No independently computed PDF hashes.

## Source finding

`PhiGammaModulesAndIwasawaCohomology/E1` records reversed finite-free ring orientation in retrieved KPX Definition 2.2.2, p.16. The displayed structural map, following trace and Q_p coordinate formula fix the intended direction. It is a **misprint with no change to intended mathematics**, scoped to the preprint. No independent verdict, publication accusation or novelty claim.

The Delta-convention difference is not classified as an error. It needs a comparison of presentations, not a correction of KPX.

## Exact continuation

1. Construct coefficient-ring/radius instances and scalar psi embeddings, using the existing Coleman comparisons. Retain coefficient Frobenius for general K and prove coordinate continuity in the actual topology.
2. Decompose KPX's analytic kernel inverse in its rational relative Robba setting, including norm estimates, bounds, projective complement and gluing. Prove any integral lattice preservation separately.
3. Build original Galois/Herr and derived-corestriction/psi comparison maps with the actual cochain and Iwasawa suppliers. Compose them with the explicit retraction rather than substituting that retraction for the arithmetic comparisons.
4. Prove torsion-presentation comparison, genuine p-adic generator units and integral p=2 derived descent; no integral averaging by 2.
5. Complete the Fontaine/overconvergence, Wach and family proofs recorded in PG.1,PG.2,PG.6,PG.7. Retain torsion/rational/flat coefficient hypotheses, Tor and derived-limit terms.
6. Elaborate all suggested signatures at the pin and extend the declaration graph for the remaining nonroutine arithmetic proofs.

Only this issue's four deliverables were edited. No issue was closed and no labels changed manually.
