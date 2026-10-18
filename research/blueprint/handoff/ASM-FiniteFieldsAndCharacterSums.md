# ASM-FiniteFieldsAndCharacterSums

Assembly completed for issue #6279 by Codex, session `codex-hbxr9E`.

The [reader](../readmes/FiniteFieldsAndCharacterSums.md) now contains the reviewed parent and four continuations as one six-layer roadmap: 452 distinct targets, 691 API items, 475 tests, 496 distinct baseline declarations and 46 recorded source editions. Every target has one stable anchor. Full hypotheses, proof routes, source locators, APIs and discriminating tests remain in the reader. The [suggested Lean file](../suggested/FiniteFieldsAndCharacterSums.lean) is a 772-line selection on existing native carriers, with one standard note and one import block. Heavy constructions and signatures whose carriers are missing stay in the reader. The part readers and part Lean files were not edited.

This completes the assembly, not the mathematics. The accepted planning passes retain their explicit gaps and supplier obligations. None is promoted to mathematical closure or implementation. All five `review` objects, the parent's `independentReviewAudit`, and every `sourceVersions` record are unchanged. Their historical counts describe their own review snapshots; they do not certify the assembly edits below.

## Assembly decisions and independent re-review

The only changed theorem statement is `FF.4/linearized-polynomial-eval-linear` in the parent packet. Its coefficient field becomes a commutative `F`-algebra `K`; the target remains a commutative algebra `E`, with compatible `F`/`K`/`E` scalar tower. Evaluation is still `F`-linear by additivity of characteristic-p powers and scalar invariance under q-powers. This is the generality required by the accepted FF.4 continuation and the Drinfeld-module consumer. **Schedule independent mathematical re-review of this generalization.** Its suggested signature elaborates, which does not prove it.

Also re-review these proof-route reconciliations and their exact dependency edges:

- `FF.1/hasse-davenport-product-relation` uses the reviewed `/hasse-davenport-product-completion`. Its proof sketch now uses chosen-root Gross–Koblitz and exact Morita Gamma multiplication. The two native Dwork coefficient/splitting contracts remain required. A root-of-unity ratio and reduction alone do not eliminate a p-power root of unity.
- `FF.4/principal-units-of-galois-ring-two` uses `/principal-two-unit-torsion-count` and finite abelian classification. The obsolete claim that the dyadic count is unproved is removed. Boundary counts and the n≥3, r≥1 hypotheses remain essential.
- `FF.4/terras-graph-ramanujan` uses `/terras-spectral-character-transfer`. Its proof sketch now follows the decomposed norm-one and split character sums. The Lang-sheaf, tame Euler-characteristic and spectral-normalization gaps remain; the available DWP.7 weight bound alone does not close the estimate.
- Parent gap/coverage records now describe the continuations' actual frontiers: Hasse–Davenport, GOS, family cohomology, geometric conductors, uniform Lang–Weil and the finite-plane spectrum. The seven remaining parent gap records overlap the continuations' more precise gaps; they are not seven additional independent constructions.

The Fourier and graph edges listed below are exact interface reconciliations. No node was added, removed or renamed, and all 452 statements except the stated linearized-evaluation generalization are unchanged. API/test statements are preserved. Editorial reader wording removes review-history instructions from target exposition; source-correction provenance remains in its secondary register.

The parent AC.0 Fourier request is discharged by `AdditiveCombinatorics:AC.0/fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-parseval`, and `FF.1/finite-field-fourier-transport`. The field-coordinate transport uses the actual additive dual, including noncyclic additive groups. The two unresolved internal norm-one/spectral contracts remain explicit: no nonexistent Lang-sheaf node was invented to replace a stage reference.

## Ownership screen and native interfaces

The reviewed library audit was read for all six layers. The current TauCetiRoadmap screen used commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti source screen used `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These screens supplement the fixed implementation pins, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The screen included the nine post-snapshot roadmaps named in WORKERS.md and the Completed roadmaps. IntegralLattices' finite quadratic-module Gauss sums have different carriers and scope from the field-character targets here. AlgebraicCodingTheory supplies general codes and duality, and expressly leaves specialized RS/BCH/cyclic/AG families outside its scope. Its current plan and the library do not supply the general Singleton/MDS interface used here. Two full upstream roadmap examples, AlgebraicCodingTheory and Completed/OrthogonalL2Bases, informed the document shape.

Existing finite-field classification, Frobenius, norm/trace, normal-basis existence, ordinary Gauss/Jacobi identities and column orthogonality are inputs. Current `DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` supplies the ZMod case, not the general finite-ring target. Current `TauCeti.Place.exists_uniformizer_ord_aut_sub_of_artinSchreier_pole` supplies native uniformizer displacement; completion/normalized-order compatibility and geometric sheaf Swan comparison are the remaining extension. No second displacement theorem is planned.

Native AG signatures use `TauCeti.Place`, `residueFieldEquivOfDegreeEqOne`, actual divisors, `riemannRochSpace` and Weil differentials. The old `TCPlace`/`TCDivisor`/differential stand-ins and admitted constructions are gone from the main Lean file. The Hermitian polynomial code has an actual finite point carrier; its geometric comparison still requests the precise native Hermitian model. Galois rings use truncated Witt vectors, and Ore comparison uses native `SkewPolynomial` with possibly noninvertible Frobenius. Sequence formulas retain their phase term, primitive-generator hypotheses and GMW exponent range.

## Sources and editions

This assembly relies on the accepted packets' source readings and reviewed corrections; it does not claim a fresh reading or collation of all source editions. Source hashes, aliases and exact theorem/section/page locators are retained. The bibliography deduplicates identical recorded file hashes, while every target locator remains attached to its source alias. Reader text states the mathematics in the roadmap authors' words; no source excerpts are introduced.

The cleared-library index was checked. In particular, no non-cleared Cohen copy was opened or fetched: the Cohen normalization and erratum receipts are inherited from the independent FF.1 review. E750 is rejected (the modulus is the prime ideal); E751 is a known erratum at II.11.6.14, p.372, errata item 4. Goresky–Klapper public drafts, Wu–Liu v2 and the recorded ECT drafts remain edition-scoped; their findings are not promoted to publisher-version errata. The source-collation gap stays open. Kuang's author name is Jinghua Kuang.

## Validation

- All five packets: `python3 scripts/check_blueprint.py`, zero errors and zero warnings.
- Union graph: 452 unique IDs, no cycle and no unresolved same-roadmap prerequisite. Every cross-part target link resolves. Every target, API item and test is present in the reader; every local reader anchor link resolves.
- Global planets: FF.0 = 4, FF.1 = 6, FF.2 = 6, FF.3 = 6, FF.4 = 6, FF.5 = 4. The continuation marks are selections within these slots, not additional slots. Stable node and layer IDs are retained.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean`: exit 0 at the shared pinned build; 73 `declaration uses sorry` warnings, no errors or other Lean warnings. Memory was checked before the serial run. No library build or language server was started.
- `scripts/check_sorry_data.py`: pass; real-bodied light definitions, no admitted data construction; main suggested file has 772 lines, below 5,000.
- `research/blueprint/intake.py check-files` on every changed deliverable, and `git diff --check`: pass.

No assembly work remains. The independent reviewer should start with the statement/proof-route edits above, then the consuming gaps and ownership decisions below. The maintainer applies stage splits, foreign-roadmap edits and accepted Part II registrations; this submission changes only this job's authorized files.

## Exact prerequisite reconciliation

All changes below are in `prerequisites`; the consuming targets retain the full hypotheses and supplier contracts in the reader.

| Consumer | Removed coarse edge | Added exact edges |
|---|---|---|
| `FF.1/fourier-expansion-of-multiplicative-character` | `AdditiveCombinatorics:AC.0` | `AdditiveCombinatorics:AC.0/fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-parseval`, `FF.1/finite-field-fourier-transport` |
| `FF.1/hasse-davenport-product-relation` | — | `FF.1/hasse-davenport-product-completion` |
| `FF.2/swan-conductor-of-artin-schreier-sheaf` | — | `FF.2/geometric-artin-schreier-break` |
| `FF.2/deligne-cohomology-of-polynomial-sheaf` | — | `FF.2/polynomial-family-cohomology` |
| `FF.2/deligne-duality-for-polynomial-sheaf` | — | `FF.2/polynomial-family-cohomology` |
| `FF.2/uniform-lang-weil-estimate` | — | `FF.2/explicit-projective-betti-bound`, `FF.2/top-weight-albanese-comparison` |
| `FF.4/principal-units-of-galois-ring-two` | — | `FF.4/principal-two-unit-torsion-count` |
| `FF.4/permutation-character-criterion` | `FF.1` | `FF.1/additive-characters-are-shifts` |
| `FF.4/terras-graph-ramanujan` | `FF.2` | `FF.4/terras-spectral-character-transfer` |
| `FF.4/katz-quadratic-torus-estimate` | `FF.1` | Explicit missing Lang-sheaf contract; see F4-I01 below |
| `FF.4/terras-spectral-character-transfer` | `FF.2` | `FF.2/character-sheaf-trace-formula`, `FF.2/deligne-estimate-for-character-sums`, `FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FF.2/h1c-conductor-bound` |

## Supplier request register

The following table collects every one of the 57 open request records. The two byte-identical CN.0 requests are grouped across parent/FF.3, giving 55 distinct contracts. Each link goes to the complete statement and consumer IDs in the assembled reader. `P` means the parent packet and `F1`–`F4` the continuations; request numbers refer to the current arrays after the resolved AC.0 request was removed.

| Packet contracts | Supplier | Exact subject |
|---|---|---|
| [P-R01](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R01) | `WeilConjectures:WC.3` | Curve RH at every embedding, exact constants and reciprocal roots |
| [P-R02](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R02) | `WeilConjectures:WC.5:power-sum-converse` | Finite-spectrum power-sum converse |
| [P-R03](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R03) | `DeligneWeightsAndPurity:DWP.7` | Compact-support upper weights and ordinary lower weights, coefficient conventions |
| [P-R04](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R04) | `DeligneWeightsAndPurity:DWP.6` | Weight-one H¹ of the middle extension on a projective curve |
| [P-R05](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R05) | `DeligneWeightsAndPurity:DWP.0` | q-Weil numbers and all-conjugate convention |
| [P-R06](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R06) | `SchemeAndStackFoundations:SF.2` | Grothendieck–Lefschetz trace formula in every extension |
| [P-R07](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R07) | `SchemeAndStackFoundations:SF.2` | Finite-character torsor pushout and lisse/π₁ dictionary |
| [P-R08](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R08) | `SchemeAndStackFoundations:SF.2` | Rf!, base change, Künneth, affine vanishing and tame family constancy |
| [P-R09](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R09) | `EtaleDualityAndPerverseSheaves:EDC.2` | Poincaré duality and top compact-support coinvariants |
| [P-R10](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R10) | `EtaleDualityAndPerverseSheaves:EDC.2` | Geometric GOS formula and its coefficient passage |
| [P-R11](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R11) | `ArithmeticGaloisRepresentations:R01.3` | Equal-characteristic geometric Swan conductor and break API |
| [P-R12](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R12) | `WeilConjectures:WC.0` | Finite-extension rational points independent of presentation |
| [P-R13](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R13) | `SchemeAndStackFoundations:SF.0` | Geometric components and finite-field fields of definition |
| [P-R14](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R14) | `SchemeAndStackFoundations:SF.1` | Separate descent of each g⁻¹Frob^ν twist |
| [P-R15](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R15) | `FunctionFieldArithmetic:FA.5` | Function-field zeta rationality and exact genus degree |
| [P-R16](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R16) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves` | Artin–Schreier/Kummer models, ramification, constants and genus |
| [P-R17](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R17) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-` | Constant-field extension preserving genus and specified places |
| [P-R18](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R18) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge` | Affine integral-closure model and rational-place correspondence |
| [P-R19](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R19) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts` | Function-field/curve dictionary and rational points |
| [P-R20](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R20) | `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration` | Finite-residue ramification supplier, with explicit geometric extension gap |
| [P-R21](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R21), [F3-R01](../readmes/FiniteFieldsAndCharacterSums.md#contract-F3-R01) | `ComputationalNumberTheory:CN.0` | Operational algebraic cost/randomness model and bit translation |
| [P-R22](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R22), [F3-R02](../readmes/FiniteFieldsAndCharacterSums.md#contract-F3-R02) | `ComputationalNumberTheory:CN.0` | Executable polynomial presentations and refinement comparisons |
| [P-R23](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R23) | `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1` | Elliptic Hasse bound and Frobenius relation on points |
| [P-R24](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R24) | `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68` | Prime-to-characteristic elliptic torsion cardinality and faithfulness |
| [P-R25](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R25) | `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-1-finite-codes-matrices-and-elementary-constructions` | Native linear codes, matrices and evaluation/duality conventions |
| [P-R26](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R26) | `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-2-hamming-data-and-dual-codes` | Hamming minimum distance and dual codes, including the zero code |
| [P-R27](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R27) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus` | Native places, rational residues, divisors and Riemann–Roch spaces |
| [P-R28](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R28) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch` | Weil differential filtration and Riemann–Roch dimensions |
| [P-R29](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R29) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components` | Local components, residues and the abstract residue theorem |
| [P-R30](../readmes/FiniteFieldsAndCharacterSums.md#contract-P-R30) | `ComputationalNumberTheory:CN.5` | Kernel-checked exhaustive finite certificate schema and verification cost |
| [F1-R01](../readmes/FiniteFieldsAndCharacterSums.md#contract-F1-R01) | `PadicDifferentialEquationsAndRigidCohomology:RD.6` | Actual Robert-sign Dwork series coefficient norm estimate |
| [F1-R02](../readmes/FiniteFieldsAndCharacterSums.md#contract-F1-R02) | `PadicDifferentialEquationsAndRigidCohomology:RD.6` | Chosen-root Dwork splitting equality with Teichmüller trace and p=2 |
| [F2-R01](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R01) | `SchemeAndStackFoundations:SF.0` | Parameter/affine/projective schemes, smooth incidence and bounded presentations |
| [F2-R02](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R02) | `SchemeAndStackFoundations:SF.1` | Equivariant descent and bounds for each arithmetic Frobenius twist |
| [F2-R03](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R03) | `SchemeAndStackFoundations:SF.2` | Actual E-coefficient sheaf operations and torsion/adic comparison |
| [F2-R04](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R04) | `SchemeAndStackFoundations:SF.4` | Relative Artin–Schreier surface resolution compatible with products |
| [F2-R05](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R05) | `SchemeAndStackFoundations:SF.3` | Genus bound for normalization of singular projective curve sections |
| [F2-R06](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R06) | `EtaleDualityAndPerverseSheaves:EDC.0` | Constructible E-adic derived carriers and coefficient change |
| [F2-R07](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R07) | `EtaleDualityAndPerverseSheaves:EDC.2` | Duality, clean boundary, GOS and extremal curve cohomology |
| [F2-R08](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R08) | `EtaleDualityAndPerverseSheaves:EDC.4` | Affine weak Lefschetz with smooth hyperplane sections |
| [F2-R09](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R09) | `LefschetzPencilsAndVanishingCycles:LPV.0` | General-base local acyclicity and normalized local/global Fourier comparison |
| [F2-R10](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R10) | `ArithmeticGaloisRepresentations:R01.3` | Geometric equal-characteristic ℓ-adic conductors and tensor API |
| [F2-R11](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R11) | `DeligneWeightsAndPurity:DWP.5` | Family weight constancy with fixed-embedding/all-conjugate distinction |
| [F2-R12](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R12) | `DeligneWeightsAndPurity:DWP.7` | Sharp upper/lower cohomology weights with coefficient conventions |
| [F2-R13](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R13) | `DeligneWeightsAndPurity:DWP.8` | Geometric semisimplicity and weight quotients without arithmetic semisimplicity |
| [F2-R14](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R14) | `DeligneWeightsAndPurity:DWP.1` | Abelian-variety weight-one spectrum and Tate-module conventions |
| [F2-R15](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R15) | `AbelianSchemesAndArithmeticModuli:A2` | Rational Albanese–Weil, singular Picard and normal-projective comparison |
| [F2-R16](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R16) | `PadicDifferentialEquationsAndRigidCohomology:RD.6` | Explicit Adolphson–Sperber Euler degree bound and ℓ-adic comparison |
| [F2-R17](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R17) | `FunctionFieldArithmetic:FA.5` | Constant-field quotient and arithmetic Frobenius cosets |
| [F2-R18](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R18) | `WeilConjectures:WC.5:power-sum-converse` | Signed finite-spectrum power-sum extension |
| [F2-R19](../readmes/FiniteFieldsAndCharacterSums.md#contract-F2-R19) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-` | Native arbitrary-residue lower ramification/completion bridge |
| [F3-R03](../readmes/FiniteFieldsAndCharacterSums.md#contract-F3-R03) | `ComputationalNumberTheory:CN.5` | Certificate recording and constant instantiation, separate from algorithm soundness |
| [F3-R04](../readmes/FiniteFieldsAndCharacterSums.md#contract-F3-R04) | `WeilConjectures:WC.5` | General-model all-extension point bounds and concrete-model comparison |
| [F4-R01](../readmes/FiniteFieldsAndCharacterSums.md#contract-F4-R01) | `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves` | Native Hermitian function field, poles, affine places and genus |
| [F4-R02](../readmes/FiniteFieldsAndCharacterSums.md#contract-F4-R02) | `EtaleDualityAndPerverseSheaves:EDC.2` | Genus-zero tame Euler characteristic and extremal vanishing owner decision |

### Internal unresolved contracts

**[F4-I01](../readmes/FiniteFieldsAndCharacterSums.md#contract-F4-I01) — `FiniteFieldsAndCharacterSums:FF.1`.** Rank-one Lang character sheaf on the quadratic norm torus: rational-point trace ω, finite monodromy and tame rank-one structure. Import/promote the accepted EXT-08 supplier when assembled; do not create a second generic character-sheaf definition in FF.4.

Consumers: `FF.4/katz-quadratic-torus-estimate`.

**[F4-I02](../readmes/FiniteFieldsAndCharacterSums.md#contract-F4-I02) — `FiniteFieldsAndCharacterSums:FF.2`.** Compact-support trace formula and mixed Kummer bound for the actual Lang/Kummer tensor sheaves used here. For Jχ(a), the punctures are 0,∞ and the roots of δy²+(a−2δ)y+δ, with discriminant a(a−4δ)≠0; geometric nontriviality, χ_c and dim H¹_c≤2 must be checked.

Consumers: `FF.4/katz-quadratic-torus-estimate`, `FF.4/terras-spectral-character-transfer`.

These remain gaps in the consuming FF.4 packet. The exact FF.2 trace/conductor edges above supply the established AS/Kummer portion; they do not supply the missing norm-one Lang object or its comparison.

## Consolidated restructuring decisions

All 16 proposals are preserved below with their original packet/index for traceability. The resolution table gives precedence where their scopes conflict. No new stage IDs, foreign edges, link-map files or foreign roadmap targets were changed.

| Topic | Reconciled action |
|---|---|
| FF.1 grouping (P-S1) | Use the four proposed subject groups, with Fourier/projective interpolation in characters and the exact-Gamma completion in Hasse–Davenport. Keep the six assembled planets until a split is registered. |
| GOS/Euler (P-S2, F2-S1, F4-S4) | One EDC Part II after EDC.2: general geometric curve Euler characteristics with torsion-to-adic passage. The genus-zero tame specialization uses this same endpoint, subject to the maintainer’s ownership decision; do not register two Euler theorems under different owners. |
| FF.2 grouping (P-S3, F2-S5) | Retain the four parent branches and expose family/deformation, hyper-Kloosterman, uniform Betti/Albanese and correlation groups in the reader. No accepted stage split is presumed; one global six-planet selection applies. |
| Linearized/Ore (P-S4, F4-S2) | F4-S2 supersedes P-S4’s separate DM.0 comparison ownership. FF.4 owns the general commutative-algebra polynomial/composition/Ore comparison on native SkewPolynomial; DM.0 imports it and owns Drinfeld modules. Only the parent linearity signature and reader boundary are changed here. |
| FF.4 grouping (P-S5, F4-S3) | Use algebra/rings, linearized composition, sequences/correlation, codes and finite-plane spectra as independent reading groups. Bounds are imported only by the consequences that use them. |
| Geometric conductors (F2-S2) | AGR Part II supplies the general geometric complete-DVR conductor/tensor interface. Reuse Tau Ceti’s native displacement theorem; FF.2 owns its concrete reduced-pole application and completion comparison. |
| Coordinated geometric extensions (F2-S3) | One owner per general theorem: EDC affine weak Lefschetz; LPV general-base acyclicity; SF relative resolution, bounded presentations and singular-curve genus; RD explicit Euler degree/comparison; A2 rational Albanese–Weil/Picard comparisons. Exact requests appear in the register. |
| Global/local Fourier (F2-S4) | Global Artin–Schreier and Fourier–Deligne stay in FF.2. The proposed GeneralBasesFourier extension imports them and supplies local kernels/traits/vanishing cycles. Coordinate coefficient change at SF/EDC; preserve extra scope in the routed papers. |
| Algorithms and stage dependencies (F3-S1, F4-S1) | Register elementary factorization/Hensel, elliptic point-count and general point-bound components before changing blanket edges or recomputing depths. CN.1 imports the elementary owner and keeps refinement work; FA.7 retains its full function-field scope. A blanket WC.5 replacement would keep the unwanted cohomological dependency. |
| Monic census move (F3-S1) | The exact monic census remains at its stable FF.2 ID and parentStageId until the component/census move is registered. The reader labels it elementary. Move it once to FF.0 with all incoming references when applying that authorized restructure, without duplication. |
| Hermitian model (F4-S5) | AlgebraicCurves, Part II supplies the precise native model; FF.4 imports it and owns its code comparison and parameter bounds. |

### P-S1 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`.

FF.1 now holds 42 nodes in four groups that share few prerequisites: characters, conventions and elementary sums; the Hasse–Davenport relations; Stickelberger's congruence and the prime factorisation of Gauss and Jacobi sums; and harmonic analysis on F_q((1/T)) with measures on ℤ (the BKK route). For the atlas the layer reads better as four sub-layers (PROTOCOL §14).

FF.1a Characters and conventions: canonical-additive-character, additive-characters-are-shifts, norm-lift-of-a-multiplicative-character, trace-lift-of-an-additive-character, trivial-character-conventions, gauss-sum-transport, gauss-sum-galois-conjugation, gauss-sum-absolute-value, jacobi-sum-absolute-value, mulchar-column-orthogonality, power-count-via-characters, fourier-expansion-of-multiplicative-character, gauss-sum-frobenius-invariance, gauss-sum-duplication-formula. FF.1b Hasse–Davenport: hasse-davenport-weight, hasse-davenport-degree-sums, polynomial-euler-product-recurrence, hasse-davenport-orbit-sum, hasse-davenport-lifting, hasse-davenport-lifting-for-jacobi-sums, hasse-davenport-product-relation. FF.1c Stickelberger: teichmuller-character, prime-above-p-in-cyclotomic-compositum, multi-jacobi-sum, gauss-sum-product-and-multi-jacobi-sum, multinomial-coefficient-congruences, jacobi-sum-teichmuller-congruence, gauss-sum-teichmuller-base-congruence, stickelberger-congruence, gauss-sum-valuation-digit-sum, prime-factorisation-of-gauss-sums, stickelberger-relation, prime-factorisation-of-jacobi-sums. FF.1d Harmonic analysis on F_q((1/T)): fourier-transform-of-integer-measure, fourier-gap-from-residue-anticoncentration, residue-character-at-infinity, residue-pairing-duality, negative-power-torus, haar-measure-on-negative-power-torus, reduced-polynomial-fractions, torus-character-orthogonality, torus-finite-coordinate-integral.

### P-S2 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `FiniteFieldsAndCharacterSums`.

The Grothendieck–Ogg–Shafarevich Euler characteristic formula for lisse sheaves on curves is used by FF.2 (conductor bounds, the curve bound (3.5.2), Weil I 8.11) and by the proposed KloostermanMomentsAndPotentialAutomorphy, and no atlas stage states it (RT-AREA-finitefields/3, confirmed). It is a theorem about étale cohomology of curves, not about finite-field sums.

Add a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2 (inputs EDC.2 and the local Swan conductor of ArithmeticGaloisRepresentations:R01.3 in equal characteristic): χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) for F lisse on a dense open X of a smooth projective connected curve over an algebraically closed field, with χ_c = χ, sourced to Raynaud's Séminaire Bourbaki 286 or SGA 5 X. Link it to FiniteFieldsAndCharacterSums:FF.2. FF.2 keeps the local computation Sw_x(L_ψ(f)) = v*_x(f).

### P-S3 — split

Roadmaps: `FiniteFieldsAndCharacterSums`.

FF.2 has 88 nodes along four lines of development that read as separate stars in the atlas.

Divide FF.2 into sub-layers (parentStageId unchanged until the division is accepted): FF.2a 'One-variable L-functions and Stepanov's method' (additive-companion-sum, multiplicative-companion-sum, monic-l-series, monic-l-series-log-derivative, root-sum-additive-character, root-sum-multiplicative-character, additive-l-function, multiplicative-l-function, root-sum-additive-top-coefficients, additive-l-function-is-polynomial, root-sum-multiplicative-periodicity, multiplicative-l-function-is-polynomial, l-function-reciprocal-roots, primitive-ring-gauss-sum-norm, multiplicative-l-function-leading-coefficient, multiplicative-l-function-functional-equation, mixed-l-function-is-polynomial, trace-kernel-artin-schreier, artin-schreier-point-count-average, kummer-point-count-average, the Stepanov nodes stepanov-curve-ring … stepanov-bound-artin-schreier-curve, additive-l-function-root-bound, multiplicative-l-function-root-bound-coprime, weil-bound-additive, weil-bound-multiplicative-coprime-degree, and the degenerate-case nodes artin-schreier-reduced-form, artin-schreier-invariance, artin-schreier-trivial-sum, weil-bound-additive-reduced, multiplicative-perfect-power-sum); FF.2b 'Curves' (artin-schreier-function-field, artin-schreier-curve-point-count, artin-schreier-zeta-factorization, additive-l-function-purity, kummer-function-field, kummer-curve-point-count, kummer-zeta-factorization, multiplicative-l-function-purity); FF.2c 'Trace functions and Deligne bounds' (artin-schreier-sheaf, kummer-sheaf, character-sheaf-trace-formula, homotopy-invariance-of-endomorphism-action, character-sheaf-cohomology-vanishes, translation-cancellation, trace-function, lisse-sheaf-extremal-cohomology-on-curve, modified-pole-order, swan-conductor-of-artin-schreier-sheaf, h1c-conductor-bound, deligne-bound-for-trace-functions, deligne-estimate-for-character-sums, affine-concentration-criterion, rank-one-sheaf-l-function, rank-one-sheaf-root-bound, weil-bound-multiplicative, weil-bound-mixed, artin-schreier-sum-on-curve-bound, involution-eigenvalue-pairing, kloosterman-sum, kloosterman-l-function, kloosterman-bound, gauss-sum-frobenius-eigenvalue, hypersurface-through-all-rational-points, elementary-n-variable-bound, deligne-cohomology-of-polynomial-sheaf, deligne-duality-for-polynomial-sheaf, deligne-n-variable-bound); FF.2d 'Fourier–Deligne transform and Lang–Weil' (fourier-deligne-transform, fourier-deligne-inversion, fourier-input-for-one-modulus, lang-weil-estimate, uniform-lang-weil-estimate, dimension-from-point-counts, geometric-chebotarev). Dependencies run FF.2a → FF.2b, FF.2a → FF.2c → FF.2d.

### P-S4 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`, `DrinfeldModulesAndTModules`.

The reviewed audit flags that DrinfeldModulesAndTModules:DM.0 again constructs additive polynomials as the Ore ring L{τ} of F_q-linear endomorphisms of G_a, FF.4's additive-polynomial target.

FF.4 owns the polynomial-level theory of q-linearized polynomials over fields of characteristic p (FF.4 nodes linearized-polynomial, linearized-polynomial-eval-linear, linearized-polynomial-comp, roots-of-linearized-polynomial, linearized-polynomial-separable-iff, subspace-polynomial, subspace-polynomial-is-linearized, linearized-q-associate and the permutation criteria). DM.0 keeps the Ore ring L{τ} over F_q-algebras, its identification with FF.4's composition ring of q-polynomials (Wu–Liu Theorem 2.1) and Drinfeld modules, and imports the FF.4 nodes through a link FF.4 → DM.0.

### P-S5 — split

Roadmaps: `FiniteFieldsAndCharacterSums`.

FF.4 has 91 declaration-level nodes in five independent topics; the atlas would show it more legibly as sub-layers (parent nodes of the same roadmap), without changing the stage id or its edges.

Sub-layers of FF.4: (a) Galois rings: finite-local-ring-is-henselian … trace-of-galois-ring (16 nodes); (b) linearized and permutation polynomials: linearized-polynomial … dickson-permutation-criterion (22 nodes); (c) linear recurring sequences and correlation: least-period-of-sequence … decimation-cross-correlation-character-sum (17 nodes); (d) evaluation, BCH and algebraic geometry codes: singleton-bound … residue-code-parameters (23 nodes); (e) the finite upper half-plane and Hecke operators: finite-upper-half-plane … terras-graph-ramanujan (13 nodes).

### F2-S1 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `FiniteFieldsAndCharacterSums`.

Continue the parent GOS request and PAPER-DELIGNE-74 route 6; do not create a second owner.

Register EtaleDualityAndPerverseSheaves, Part II: CurveEulerCharacteristic after EDC.2 with the general lisse E_λ Euler formula, imported geometric conductor, torsion-to-adic proof and genus/boundary tests. Export to FF.2 and the proposed KloostermanMomentsAndPotentialAutomorphy. Reconcile the parent EDC.2:euler-characteristic proposal into this one endpoint.

### F2-S2 — rescope

Roadmaps: `ArithmeticGaloisRepresentations`, `FiniteFieldsAndCharacterSums`.

Geometric k̄((t)) conductors exceed the present arithmetic/finite-residue contract.

Extend Arithmetic Galois representations as Part II: Equal-characteristic geometric conductors. FF.2 keeps only its concrete Artin–Schreier reduced-pole calculation and imports the general conductor and tensor API.

### F2-S3 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `SchemeAndStackFoundations`, `LefschetzPencilsAndVanishingCycles`, `PadicDifferentialEquationsAndRigidCohomology`, `AbelianSchemesAndArithmeticModuli`.

The supplier screen found exact generality gaps, not existing exports.

Commission coordinated Part II contracts: affine weak Lefschetz at EDC; general-base local acyclicity at LPV; specific relative surface resolution, bounded presentations and singular curve genus at SF; explicit exponential-sum Euler degree/comparison at RD; rational Albanese–Weil and normal Picard comparisons at A2. Each general theorem has one owner; FF.2 holds its numerical applications and source-specific family arguments.

### F2-S4 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`, `LefschetzPencilsAndVanishingCycles`.

RT-AREA-etale/14: retain the accepted global Fourier and Artin–Schreier prefix, attach the missing comparison rather than duplicate it.

Keep the parent FF.2/artin-schreier-sheaf and /fourier-deligne-transform as sole E-valued global owners. The proposed GeneralBasesFourier extension imports those objects and owns local kernels, traits and vanishing cycles. Add the LPV comparison request above, and coordinate the shared torsion/adic coefficient generalization at SF.2/EDC.0. Re-route only the overlapping prefixes of ABE-25/A19, YANG-ZHAO-25/A02 and FRESAN-SABBAH-YU-22/33; their extra scope is retained.

### F2-S5 — split

Roadmaps: `FiniteFieldsAndCharacterSums`.

The parent has 88 FF.2 nodes and six planets; this part adds source-specific applications without editing their placement.

At assembly reconcile the parent’s proposed FF.2a–d split and add family/deformation and hyper-Kloosterman/correlation sublayers. Until that split is accepted, select only six planets across the union: Artin–Schreier sheaf (parent), Deligne’s exponential-sum bound (parent), Hyper-Kloosterman sums (this part), Trace-function quasi-orthogonality (this part), Uniform Lang–Weil estimate (parent), Constant-field Chebotarev theorem (this part). The six part-local planet marks are candidate landmarks; they are not six additional global slots.

### F3-S1 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`, `ComputationalNumberTheory`, `FunctionFieldArithmetic`.

RT finitefields /1,/11,/12: register separate elementary factorization/Hensel and point-count components, so CN.1 imports the elementary owner without inheriting cohomological bounds; preserve FA.7’s other function-field targets.

Register component stages before regenerating the graph: assign the polynomial census and prime-polynomial counts, square-free and distinct-degree decomposition, Cantor–Zassenhaus, Berlekamp, random irreducible generation, irreducibility/factorization certificates and Hensel lifting (including their correctness/cost exports) to an elementary FF.3 component with direct FF.0, CA.3 and the precise CN service inputs. Assign naive elliptic point counts, root-table certificates and Schoof to a point-count component using their elliptic suppliers; keep the affine hyperelliptic bound on its exact FF.2 supplier. Assign general all-extension curve/variety bounds and their model/certificate comparison to the point-bound component importing WC.5. Remove the compulsory all-FF.2 algorithm edge. CN.1 replaces its duplicate polynomial-factorization-over-finite-fields target with the elementary component’s square-free, DDF, Cantor–Zassenhaus and Berlekamp correctness/cost imports, retaining implementation/refinement obligations; it must not import the whole point-bound stage. Merely substituting WC.5 for FF.2 on an unsplit FF.3 stage would preserve the cohomological obstruction. FA.7 imports the elementary factorization component and the relevant point-count certificates, retaining place enumeration, Riemann–Roch computations, ray characters, conductors/local completions, its other certificate exports, and L-polynomial assembly/functional-equation checks. Counts through r=g determine the curve zeta numerator only for a smooth projective geometrically connected genus-g curve, using Newton identities and the normalized functional equation; this does not replace arbitrary Artin/ramified L-polynomial computations. Split FF.4’s elementary constructions (direct FF.0/FF.1 inputs) from bound-dependent applications (their exact FF.2/WC suppliers), allowing a specific FF.3 algorithm import when a consumer needs it. FF.5 packages each exact supplying component. Move the elementary accepted monic-polynomials-of-degree carrier from its present FF.2 placement to FF.0 during assembly, updating parentStageId and all incoming references consistently without duplicating the declaration. Keep current stable node ids until the authorized component/census moves are registered and applied; then recompute depths. No stage split or foreign-file change is applied by this packet.

### F4-S1 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`.

RT-AREA-finitefields/1: algebra and algorithms do not require Weil II; this packet’s direct dependency chains reflect that distinction.

Replace FF.3←FF.2 by FF.3←FF.0 and CA.3; use EllipticCurves Layer 3 and WC.5 for point-counting errors. FF.4 has algebraic inputs FF.0 and FF.1, with FF.2 only for analytic character-sum and spectral consequences. FF.5 imports each layer it packages directly. The maintainer applies stage-edge changes and regenerates depths outside this issue’s deliverable paths.

### F4-S2 — rescope

Roadmaps: `FiniteFieldsAndCharacterSums`, `DrinfeldModulesAndTModules`.

RT-AREA-finitefields/13: native SkewPolynomial already exists; a second Ore carrier in DM.0 is unnecessary.

FF.4 is the single owner of q-linearized polynomials over any commutative F_q-algebra, their linearity, separable root spaces, subspace polynomials and composition/Ore comparison. Generalize the parent field-only signatures at assembly. DM.0 imports FF.4 and retains Drinfeld modules, using native SkewPolynomial. Add FF.4→DM.0; this supersedes the parent proposal that kept a separately owned DM.0 Ore/linearized comparison.

### F4-S3 — split

Roadmaps: `FiniteFieldsAndCharacterSums`.

The parent 91 FF.4 nodes and this continuation’s 51 nodes span largely independent topics.

Keep IDs unchanged until accepted; expose sub-layers Galois rings, linearized composition algebras, sequences and correlation, cyclic/evaluation/AG codes, and finite upper half-plane spectra. The spectral sub-layer alone imports the norm-torus Weil/Deligne machinery.

### F4-S4 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `FiniteFieldsAndCharacterSums`.

The accepted EXT-08 Euler–Poincaré owner question was never delivered; EDC.2 is a candidate rather than a resolved owner.

Maintainer decides the owner of genus-zero tame Euler characteristics and promotes the accepted EXT-08 FF/ExponentialSums packets with their corrections; set integrated_partial and copy REVIEW-EXT-08-EXT-16 §§7–8 to DECISIONS. FF.3 versus CN.1 factorization placement and the FF.2 Lang trace-formula extension remain explicit decisions; DWP.7 supplies the compact-support weight bound at its exact cohomological-bounds node.

### F4-S5 — rescope

Roadmaps: `tauceti:TauCetiRoadmap/AlgebraicCurves`.

No native Hermitian-model export with the required pole orders and point–place bijection was found.

AlgebraicCurves, Part II supplies the Hermitian function-field model beyond the existing layer-10 plan; FF.4 imports it and owns the code comparison and parameters.
