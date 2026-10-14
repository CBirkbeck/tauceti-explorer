# BP-FunctionFieldArithmetic~2 handoff

Codex session `codex-F4VieJ`; issue [#9304](https://github.com/CBirkbeck/tauceti-explorer/issues/9304); branch `codex-F4VieJ-function-field-revision-9304`; 14 October 2026. **The revision is complete, not a checkpoint.** The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9304#issuecomment-6163886102). None of the manager's priority issues was available when checked; this eligible blueprint revision was taken through the WORKERS fallback order. No second job was claimed.

This revises the plan originally written by session `codex-Mp7Yro` and independently reviewed by session `codex-JiJULy`. The [review report](../reviews/REV-FunctionFieldArithmetic.md) and [review handoff](REV-FunctionFieldArithmetic.md) required reader synchronization. Their authorship, dispositions and `needs_changes` verdict are preserved in the packet. This revision does not accept or review itself.

## Completed deliverables

The [reader](../readmes/FunctionFieldArithmetic.md) now agrees with the corrected [packet](../packets/FunctionFieldArithmetic.json) at every target: statements, hypotheses, proof steps, prerequisites, individual source locators and source matches, consumers, API entries, tests and acceptance conditions. The 28-entry baseline table, 29 supplier requests, five gaps, inventory and closing obligations agree as well. No target, API item, test, planet, source finding or supplier request was removed or added. The packet changes only the description of LEAN-INTERFACES and adds dated current-inventory receipts.

The synchronization includes all 22 corrected targets recorded by the independent review. In particular:

- **Fixed-length Schmid–Witt:** pair length n≥1 with the quotient of the multiplicative group by pⁿ-th powers, not its entire pro-p completion. Separate the infinite-length topologies. Use Kosters–Wan Theorem 3.4, p.8; Remark 4.1, pp.14–15; Proposition 4.2, p.15; Theorem 4.7 and proof, pp.18–19. A length-one character kills a uniformizer's pth power, whose full valuation remains nonzero.
- **Ray characters:** depth zero is the integral unit group; positive depth uses principal units. Keep finite image, the finite degree quotient, the geometric conductor and the chosen degree-one value separate. Degree one has valuation degree +1 and Yu degree −1. The expression 1+O contains zero and cannot define depth-zero units.
- **Trace and determinants:** EDC.8 is the registered forwarding receipt for the actual upstream TraceFormula owner. Preserve TORSION-DETERMINANT and the characteristic-ℓ counterexample; no characteristic-zero lift is assumed. The characteristic-zero Brauer–Nesbitt request uses DWP.0 and has only the semisimple-determination consumer. It supplies no torsion determinant identity.
- **Native group points:** use `TauCeti.AlgHom.instGroup`, which permits an arbitrary commutative value algebra, rather than the more restrictive pinned Mathlib convolution instance. Correct reductive-group module and Laurent-series ring/uniform/valuation comparisons appear in the baseline table.
- **Other conventions and locators:** Yoshida's existence reference is §5.3(iv), pp.425–428, with Theorem 6.15 and proof on pp.432–433. Remove the repeated SR.4 prerequisite. Retain finite constants, completed rather than algebraic residues, full central-degree conditions, FYZ's source rank n+2j and Serre dual, coefficient-specific Satake and the integral coefficient flatness argument. Individual citations now distinguish each source's contribution.

## Suggested file shape

The [Suggested file](../suggested/FunctionFieldArithmetic.lean) follows WORKERS.md's 12 October update: the README carries the complete API and tests, and Lean keeps a compact, nonexhaustive set of light real-bodied definitions and statements statable at the pins. This newer instruction expressly applies the shape from the start and overrides the older exhaustive-prototype wording in PROTOCOL §13 and the generated issue.

Removed admitted data definitions and formula statements whose missing supplier hypotheses made them false as unconditional theorems. Their full mathematical contracts remain in the reader. Kept native finite constants and weighted degrees, proof-bearing RR certificates, projective restricted products and the existing restricted-product units equivalence, effective-divisor zeta and actual point counts, Schmidt/RR end statements, matrix factors, an intersection of kernels of actual linear maps, and completion/L-polynomial certificates. Added the characteristic-three determinant control and fixed-length power/ray-unit controls. The completion certificate's full coefficient-section and topological algebra contract remains in the reader. Formal first-count certificates do not assert arbitrary all-extension counts or construct constant-extension certificates.

No theory was developed, no missing condition became a dummy logical field, and no data definition or data instance has an admitted body. The file has 325 lines. Its compact subset is intentional: the packet's 175 proposed target/API/test names remain the reader's complete contract, rather than an assertion that all 175 are Lean declarations.

## Sources and existing suppliers

All source statements are in our own words. Exact versions, hashes and locators remain in the packet and reader. Fifteen public source downloads reproduced the recorded SHA-256 values. The existing public Harder link returned HTTP 404; its earlier direct-reading receipt and the review's split-Chevalley restriction were retained, without claiming a fresh reading. No unavailable publisher text or uncleared Rosen, Stichtenoth or Weil book was used. No source file, extracted text or source passage is submitted.

Targeted source verification for the corrected contracts included:

- Kosters–Wan, Theorem 3.4 and proof, pp.8–9; Remark 4.1 and Proposition 4.2, pp.14–15; Theorem 4.7 and proof, pp.18–19; Theorem 4.12 and Proposition 4.14, pp.21–23.
- Yoshida, §2.2, pp.413–414, and §5.3(iv), pp.425–428, including the adjoining existence argument; Theorem 6.15 and proof, pp.432–433. Convert geometric to arithmetic Frobenius explicitly.
- Parshin, §§2.1–2.2, pp.6–9, and §2.5, pp.14–15; Milne, ADT Appendix A, A.7 and proof, pp.131–132, and A.10–A.11 and proofs, pp.134–136; Conrad, §2 and Theorems 3.1–3.2, pp.2–4. Conrad's stated ray-cover contracts do not close GEO-RAY, and ADT expressly excludes existence.
- Abdurrahman–Venkatesh, §§3.1–3.2, equations (3.1)–(3.2), pp.26–27; D'Addezio, the Chebotarev step in the proof of Theorem 5.3.3, p.27. The former uses a proper-curve inertia-stalk Euler product; the latter is a function-field consumer, not a number-field Chebotarev supplier.
- Ciubotaru–Harris, Proposition 3.1 and Lemma 3.2, §3, pp.8–9; BHKT, Proposition 8.2 and proof, §8.1, pp.34–35; FYZ, §§2.3–2.6, Theorem 2.3, Lemma 2.7, equations (2.10)–(2.12), Theorem 2.8 and proofs, pp.10–15; Li–Zhang, Theorem 3.5.1 and proof, pp.17–18. Inert density inputs are imported and split density remains a GN.3 enhancement.
- Yu's degree conventions, §§2.2–2.3, pp.8–11; Hess's cost model, §3.2, pp.3–4; Roquette's RR zeta derivation, §4.3.3, pp.25–28. Historical readings and the independently confirmed Yu source corrections remain attributed as recorded.

All 28 baseline declarations were reread at the recorded pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. All 13 Tau Ceti source modules used by those receipts agree byte-for-byte with the shared pinned Lean build. The read-only current upstream inventory was rechecked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Imported current completion and finite-adele maps, curve geometry, generic restricted products, vector bundles and local integral Satake are not reconstructed. IntegralLattices' quadratic-Z scope does not supply Hermitian densities. Current CFT Layer 8 does not supply equal-characteristic wild existence.

Upstream [TraceFormula PR #196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196) remained open at head `4bd72379658126cbe9be935656396f0c9dac4de0`. Its finite-coefficient conventions, Layers 0–4, 9–11 and 14–15 were rechecked. Finite-coefficient trace and perfect-complex determinant algebra are imported; the characteristic-zero sheaf determinant result in Layers 14–15 is not silently strengthened to the required finite coefficient-field theorem.

## Verification

- Packet checker with the generated index of the existing pinned build: **0 errors, 0 warnings**. Inventory: **48 nodes**, comprising **19 theorems, 16 constructions, 8 comparisons and 5 definitions**; **64 API items**, **63 tests**, **31 planets**, **28 baseline receipts**, **29 requests**, **5 gaps**.
- `lean-check research/blueprint/suggested/FunctionFieldArithmetic.lean`: **exit 0, only admitted-proof warnings** at the pinned shared build. A first revised-file check exposed the missing explicit ZMod field import; the import was corrected and the final file was rechecked. No library build, dependency update, cache fetch or language server was used. Elaboration proves no target.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmetic.lean`: **exit 0**. Intake `check-files`: **4 files, 0 problems**. `git diff --check`: **exit 0**.
- Exhaustive packet/reader comparison checked every target field, source locator/match, consumer, API item, test, request, gap and baseline receipt. Original review, mathematical nodes, coverage, baseline, sources, source-version boundaries, source findings and requests compare unchanged.
- Independent finite-field enumeration gives the elliptic counts **9 over F5, 27 over F25**, numerator **1+3T+5T²**, and degree-two constant-extension numerator **1+T+25T²**. The ASW affine model gives **4 over F3, 16 over F9**, numerator **1+3T²**. Each includes its unique projective infinity point; closed-point and effective-divisor coefficients independently satisfy the logarithmic/Newton relations.
- Characteristic-three identity matrices have zero power traces and determinant **1−T³**, different from the rank-zero factor. Depth-zero and fixed-length power controls, and Yu determinant/scalar cancellation signs, were also checked independently.

All useful findings are in these deliverables. The next worker needs no disposable scratch file, download or local machine path.

## What remains and who owns it

Every stage **FA.0, FA.1, FA.2, FA.3, FA.4, FA.5, FA.6 and FA.7 is planned**. None is closed or claimed implemented; every `implementationStatus` remains `unchecked`. The planning revision is complete even though mathematical supplier/proof boundaries remain open. Independent acceptance checking is the next action; the old review object is preserved for that reviewer to replace under their own authority.

The five boundaries remain precise: **LEAN-INTERFACES** requires actual geometric/arithmetic supplier interfaces; **GEO-RAY** requires the generalized-Jacobian ray construction, connectedness and conductor/Artin proof; **RG-RED** requires nonsplit reduction with all central degrees controlled; **GENERAL-POINT-COUNT** requires general curve count certificates from FF.3; **TORSION-DETERMINANT** requires the finite coefficient-field proper-curve Euler-product determinant theorem from TraceFormula. No boundary is hidden by a typed formula or a characteristic-zero lift.

The 29 requests are preserved: thirteen enhancements/normalization comparisons and sixteen existing upstream import receipts. The exact generalized Picard/Lang/Tsen, independent all-extension Weil, finite-field certificates, finite-coefficient determinant, characteristic-zero Brauer–Nesbitt, integral cup product, nonsplit reduction, integral Satake, split Hermitian density, local Siegel–Weil, function-field convergence/continuation and Whittaker-normalization contracts and consumers are in the reader. Those requests are recorded contracts; no other worker's packet or upstream file was edited.

The maintainer must forward the finite coefficient-field determinant enhancement through the recorded TraceFormula receipt and preserve all four ownership corrections:

1. **RT-AREA-finitefields/12:** FF.3 owns factorization and point-count certificates; FA.7 assembles L-polynomials. FF.3's present odd-characteristic elliptic certificate does not close general curve counting.
2. **RT-AREA-langlands-1/12:** GS.0/GS.1 supply Bun/Grassmannian geometry to ET.2b; FA.2/FA.6 supply arithmetic to ET.3.
3. **RT-AREA-algebraicgeometry/7:** FA.5 owns Schmidt's integer degree-one divisor. Retarget the named Bhargava–Shankar–Taniguchi route and AUDIT-01; its independent WC.5 estimate prevents a cycle through FA.4. No rational point is inferred and AC.5 is not replanned.
4. **RT-AREA-geomlanglands/12:** ES7 imports FA arithmetic and AA.0 topology while retaining division-algebra orders, compactness, spectral and trace targets.

All five confirmed source findings are preserved: Parshin's sum/product pairing, impossible injective nonprime finite-field scalar character and omitted translated test functions, and Yu's missing nonzero-vector hypothesis and determinant/scalar signs. Their corrections are present in the reader contracts; earlier independent confirmations, public-version scope and correction-search limits remain unchanged.
