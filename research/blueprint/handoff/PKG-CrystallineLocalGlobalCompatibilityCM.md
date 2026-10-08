# PKG-CrystallineLocalGlobalCompatibilityCM — checkpoint

Issue: #7462. Agent: Codex. Session: `codex-yCIhEa`. Date: 2026-10-08.

## Status and blocker

This is a **checkpoint**, not a complete package submission. The reader assembly is finished and the supplied expressible Lean cores elaborate. The package's full definition/theorem/API/test signature requirement is still blocked by missing genuine supplier types. Nothing is claimed to be implemented.

The accepted input is a complete **target-level planning pass**. Its review explicitly distinguishes this from closure and implementation: 97 targets, ten planned layers, zero closed layers, 27 supplier requests and 40 gaps. This does not invalidate that acceptance. However, the original suggested file omits 91 target signatures, 91 API signatures and 92 test examples, recording them in comments instead. Joining that file cannot produce all the typed declarations requested by the package job. Successful elaboration of its algebraic cores does not establish elaboration of these omitted declarations.

The immediate witnesses are `GAP-PROTOTYPE-CL-0` through `GAP-PROTOTYPE-CL-9` in [the accepted packet](../packets/CrystallineLocalGlobalCompatibilityCM.json). Its catalogue identifies every missing name, mathematical statement, prerequisite and source. PROTOCOL §13 forbids replacing missing notions by propositions with assumed conclusions; §15 assigns the underlying libraries to their existing owners. This issue permits edits only to its package files and this handoff, so supplier roadmap work cannot be completed here.

`metadata.toml` is deliberately **not submitted**. `issues.py:deliverables_complete` treats a package as complete solely when all output paths exist; it does not inspect its handoff or its Lean omissions. Supplying even the trivial metadata file would therefore finish the queue job automatically despite this checkpoint. Its final content is `topic = "math.NT"` followed by a newline. Add it when the full package can be submitted. No intake code, packet or other issue's files were changed.

## Work retained

- [Package README](../packages/CrystallineLocalGlobalCompatibilityCM/README.md): 165,253 UTF-8 bytes, under the 200 KB ceiling. It supplies motivation, boundaries, conventions, a connected construction narrative, ten ordered layers, every one of the 97 target statements, their hypotheses and prerequisite identifiers, all 103 API items and 104 acceptance tests, and all 27 precise supplier interfaces. Prerequisites within each layer precede their consumers. Bibliographic versions and theorem/section/page locators are retained. Process material and source excerpts are absent.
- [Package Suggested.lean](../packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean): one package-local header and one block of eleven individual Mathlib imports. The executable region is byte-for-byte identical to the accepted suggested file. Its four algebraic object cores and two theorem signatures remain explicit; the catalogue of absent arithmetic signatures remains explicitly labelled as omissions, not executable declarations.
- Read WORKERS, both protocols, UPSTREAM_GUIDE and the complete upstream ReductiveGroups and Multiquadratic READMEs. Checked neighbouring ownership through the input prerequisites and supplier requests; no link map for this roadmap was found. No restricted book was needed.
- Read the nine cited baseline declarations at the specified Mathlib and Tau Ceti commits, and checked the library audit's ALS entries and the partial PadicFamilies Fitting interface. Neither algebraic `Representation` nor `DerivedCategory` supplies the missing arithmetic or smooth categories.

## Lean boundary and continuation order

The typed target names are `CrystallineCM.WeylElements`, `PositiveCentralCocharacters`, `ParahoricPVBC`, `RescaledActions`, `degree_shift_bound` and `subquotient_mod_p_pow`. The first four have twelve API lemmas and twelve named examples altogether. There is also an unnamed odd-dimension numerical example. These are algebraic cores, with the arithmetic interpretation and hypotheses stated in the reader.

| Layer | Omitted target signatures | Required genuine carriers |
|---|---:|---|
| CL.0 | 6 | Integral dual Weyl modules, split-place coefficient dictionary, local positive monoids and arithmetic Hecke actions |
| CL.1 | 13 | Smooth derived representations of open monoids, compact derived invariants and completed arithmetic towers |
| CL.2 | 6 | Integral weight modules, inverse monoids and derived coefficient pairings |
| CL.3 | 15 | Smooth compact-mod-parabolic induction on local Bruhat strata, norm-unit characters and continuous cochains |
| CL.4 | 5 | Cuspidal unitary representations, local Hecke actions, filtered (φ,N)-modules, Galois and Weil–Deligne representations |
| CL.5 | 8 | Equivariant locally constant derived coefficients on adelic and Borel–Serre towers and actual retracts |
| CL.6 | 12 | Localized arithmetic cohomology, its actual integral/dual Hecke actions and local-field congruence level families |
| CL.7 | 7 | Continuous absolute-Galois representations, automorphic Hecke systems and crystalline/ordinary deformation quotients |
| CL.8 | 7 | Non-neat PGL₂ towers, enhanced perfect complexes, derived Hecke images and support/generalization relations |
| CL.9 | 12 | Global fixed-determinant problems, BT/type conditions, Taylor–Wiles covers, Selmer spaces and base change/descent |

Resume from the ten prototype gaps and the 27 supplier contracts, not by repeating reader assembly. Begin with SmoothRepresentationsOfLocalGroups:SR.0, ArithmeticLocallySymmetricSpaces:ALS.1/ALS.3/ALS.6 and PotentialAutomorphyInfrastructure:PA.0. Their types are prerequisites for the first missing arithmetic signatures. The README's supplier-interface section specifies the required generality; the packet records request ids and consumers. Replace each corresponding omission with the faithful typed declaration, its API lemmas and tests once its supplier interface can be expressed at the allowed baseline. Update imports accordingly and run `lean-check` again.

If the programme instead intends package assembly to preserve all accepted commented omissions, that interpretation needs explicit resolution of the full-signature requirement before declaring this checkpoint complete. This run does not infer that mere name occurrence in a comment discharges a typed-signature requirement.

## Mathematical limitations preserved

- The final Barsotti–Tate lifting target is qualified by `[F(ζ_p):F] ≠ 3` or projective residual image different from A₄. The unrestricted case remains `GAP-CUBIC-TETRAHEDRAL`. Solvable preparation preserves the full residual-plus-cyclotomic field. No claim that the unrestricted lifting theorem is false is made.
- Exact nonvanishing of the unipotent coefficient object across its full dimension range is specified only at zero selected weights. General coefficients have the cohomological-dimension bound; `GAP-GENERAL-COEFFICIENT-NONVANISHING` remains.
- AKT theorem numbers and printed pages refer to arXiv:1910.12986v2. The journal reference is bibliographic; `GAP-JOURNAL-COLLATION` remains.
- Retained inverse rescaling, geometric Frobenius, the reversed unitary first weight block, dual exterior cohomology, actual Hecke images, separate ambient decomposed genericity, arbitrary-prime deep splitting and input-independent nilpotence exponents. The statement-scope appendix locates the unitary polynomial correction at CN (2.1.6), p.18 and displays the incoming differential of CN Proposition 4.2.6, p.64.

## Verification

1. `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`: **0 errors, 0 warnings**. Input unchanged. It reports 97 nodes, 103 API items, 104 tests, 37 planets, nine baseline declarations, 27 requests and 40 gaps; ten planned and zero closed layers.
2. `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`: **exit 0**, no errors, exactly **31 warnings**, all `declaration uses sorry`. Available memory exceeded 20 GB. No language server or library build was started.
3. The shared checker used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, exactly the requested pin. Its enclosing Tau Ceti checkout was `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the roadmap pin. This file imports only Mathlib modules, so this verifies the imported pinned Mathlib cores, **not** a Tau Ceti import test at `f790474821cf4256814db967cb154e7af3d0c369`. The cited Tau Ceti declaration was separately read at that exact pin.
4. A scratch verifier checked all 97 canonical target names, normalized statements and hypotheses, source locators, 103 API names/statements, 104 test names/statements, 27 supplier contracts, ten-layer order and the README size. It compared executable Lean byte-for-byte with the original, counted the 91/91/92 omissions and verified the warning log. The proposed TOML parsed to exactly `{"topic": "math.NT"}` before being withheld for checkpoint intake.
5. Independently enumerated the F₇ binary-tetrahedral example in the reader: 24 elements, determinant image of order three after twisting, eight-element quaternion determinant kernel, and the squared-trace identity for every element outside that kernel. The two quaternion generators square to −1 and anticommute, excluding a common invariant line in odd characteristic.
6. `python3 research/blueprint/intake.py check-files` on the three submitted paths: **0 problems**. `issues.deliverables_complete` returns **false** with metadata absent, so this submission is recognized as a checkpoint. No private filesystem paths appear in the deliverables.

Scratch is disposable; every continuation-relevant result is recorded here. No second job was claimed.
