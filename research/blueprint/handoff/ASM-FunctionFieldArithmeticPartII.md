# ASM-FunctionFieldArithmeticPartII — assembly handoff

Issue: [#9244](https://github.com/CBirkbeck/tauceti-explorer/issues/9244). Worker: Codex — `codex-PJFFPa`. Status: completed assembly, awaiting independent assembly review; no implementation or independent mathematical acceptance is claimed.

The aggregate [reader](../readmes/FunctionFieldArithmeticPartII.md) now has one purpose/scope statement, shared conventions, source register, layer overview, ten ordered layer catalogues and a shared supplier frontier. It retains every parent target and accepted refinement, including the supporting affine algebra, full API/check contracts and worked boundary calculations. The aggregate [suggested file](../suggested/FunctionFieldArithmeticPartII.lean) joins the ten fragments under one standard note/import block and keeps only light native definitions, milestone statements and representative examples. The former developed parent prototype and the developed GC.2 functor/GC.3 exterior-map copies are superseded as suggested code; their mathematical specifications remain in the reader.

Only the fourteen issue deliverables are changed. Part readers and part Lean files remain inputs. All prior review records and verdicts are unchanged. All 834 node statements, hypotheses, API items, tests and implementation fields are unchanged. The prerequisite/proof-route, ownership, gap and roster changes listed next are **assembly changes requiring independent re-review**, even where they implement an accepted refinement's instructions. Do not treat the inherited acceptances as acceptance of these changes.

## Review-sensitive reconciliations

1. **GC.3 proof route.** Parent `tame-local-systems`, `collision-kernel`, `collision-descent`, `cohomology-vanishing`, `koszul-exterior` and `exterior-cohomology` now point to their accepted exact refinement ids. Cohomology uses rational coarse comparison, twisted curve cohomology and scheme symmetric-power cohomology, rather than a scheme-only duality prerequisite on a stack. Its proof outline and the exterior-cohomology outline are rewritten accordingly. The parent pushforward/perverse description remains a separate comparison target with explicit pushforward/coarse frontiers. The former EXTERIOR-COMP mathematical gap is retired in favour of the accepted alternating-invariants target; implementation is unchecked.
2. **GC.4/GC.5 consumers.** Parent fibre-triviality, empty-ramification descent, signed-divisor tensor line and unit trivialization, plus the GC.4 refinement's chart-descent-line/high-degree-effective-descent, consume `GC.3/monodromy-symmetric-local-system`. Parent high-degree descent explicitly consumes the accepted effective-descent node and uses the proper scalar quotient, degree-zero proper base change and normalized smooth gluing. Algebraic-space overlaps are refined by étale scheme charts. GC5-DESCENT is narrowed to this route; connected fibres alone never supply effective descent along a general nonproper map.
3. **GC.6 closure.** The parent obstruction milestone now consumes `norm-descent-obstruction` and `invariance-versus-descent`; away-generation consumes `actual-unit-image-determination`; quadratic-input consumes `reciprocity-root-unit-triviality`; closed-point-trace consumes `rank-one-cyclic-tensor-trace`. NORM-2EXACT and FA-APPROX now identify the remaining native torsor/curve dictionary, with no new generic weak approximation request. The source's exactness interpretation remains qualified.
4. **One stack-lisse owner.** ASM-STACK-LISSE consolidates GC3-STACK-PI1 and GC4-LISSE-ADAPTER as two precise facets of the proposed EtaleDualityAndPerverseSheaves stacks Part II. Their original hypotheses remain in the part gaps and reader. GC3-STACK-PUSHFORWARD and GC3-COARSE-STALKS remain separate exports of that owner. No provisional unregistered ST stage is presented as available, and no broad decomposition or general nonproper descent theorem is commissioned. Parent ST-LISSE/ST-OPS requests are narrowed; empty historical requests are marked historical rather than silently removed.
5. **Current upstream ownership.** Generic stackification/two-fibre products, site-independent quotient stacks, the line-section classifier and finite roots are imported from current SchemeAndStackFoundations §§1.18/1.21; the native Picard core is §3.4. Ten stable finite-root ids carry import-and-compare metadata. Generic D0 prerequisites in the parent, RS.0, GC.0 and GC.6 are replaced by the exact existing SF.1 two-fibre-product/quotient-stack ids and its stage-level stackification contract. The RS.0 universe-stack adapter is requested from SF.1. The old all-roots-local restructuring proposal is explicitly superseded. RS.2's coherent infinite diagram and the root-Picard applications stay local. RS1-DIAGONALIZABLE-COARSE retains the exact nonreduced diagonalizable generality absent from the current finite-group coarse statement.
6. **Sources.** Published YZ19 Appendix A has A.2.1 and A.2.2, with Lemma A.10 and Proposition A.11 in A.2.2, pp. 521–523. Parent locators naming nonexistent A.2.3 are corrected to A.2.2/Proposition A.11. This changes citations, not mathematical statements. All repository text is authored paraphrase/specification; no source passages are added.
7. **Combined planet roster.** RS.1's separate accepted rosters totalled ten planets. Retain Root stacks and the five native-refinement milestones (comparison, universal root, affine quotient, coarse space, regularity). Demote parent affine-chart, closed-fibre, affine-invariants and root-fpqc-descent only to supporting contracts, recording their former names and reasons in assemblyPlanetDisposition. Their statements/API/tests remain intact. The ten unified layer rosters now satisfy the six-planet limit.
8. **Planning status and code shape.** The ten parent coverage entries become planned, because the accepted refinements and explicit supplier frontiers now specify the plan. They remain unimplemented, with no stage closed. LEAN-GEOMETRY, TOWER-TYPING and GC3-LEAN-CARRIERS describe the actual aggregate omission boundary. Removal of private copies of current exterior maps and of the developed adelic functor follows the current roadmap shape; it does not discharge a geometric obligation.

## Upstream and source evidence

The read-only local roadmap checkout was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, including AlgebraicCurves, JacobianChallenge and AlgebraicVectorBundles, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The checked-in link catalogue has no FunctionFieldArithmeticPartII-specific link map; the AlgebraicCurves/Jacobian boundaries are reflected in the introduction. The local roadmap checkout predates the current finite-root contract, so the assembly also read the single current [SchemeAndStackFoundations README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/9a305e195e7870e5136053897997f7538a01121e/TauCetiRoadmap/SchemeAndStackFoundations/README.md) and suggested file at that commit. No upstream file was edited or built. Existing exterior maps and identities were read in current `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean`, lines 170–247; they are imports, not new construction targets. The reviewed AUDIT-20 arithmetic and AUDIT-01 SF.3 coverage records were consulted; the inherited 347-entry baseline audit is not represented as a new exhaustive audit by this worker.

The assembly independently read the complete published YZ19 Appendix A, pp. 514–526, from the public author PDF (SHA-256 `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`). RS inputs also use the specified Talpo–Vistoli v2 §3, pp. 12–16 and AGV v2 Appendix B, pp. 52–54, with inherited edition-specific qualifications. Earlier detailed reviews/source receipts remain attributed to the eleven packets. No uncleared book or copied source passage is needed for this assembly.

## Validation


- All eleven `check_blueprint.py` runs: **0 errors, 0 warnings**.
- Combined inventory: **834 targets, 826 API entries, 723 check entries across all node kinds**, with unique ids. All same-roadmap prerequisites resolve to exact node ids; the 1934-edge graph is acyclic. Reader target/API/test inventory and internal links pass.
- Every definition/construction has at least three tests. Review records, target statements, hypotheses, APIs, tests and implementation fields compare equal to the input packets. Four explicitly listed RS.1 planet designations are the only roster removals.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII.lean`: **compiled at the mandatory pins**, exit 0; 106 warnings, all `declaration uses sorry`. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory was checked before compilation. No Lean server or library build was used.
- Aggregate Lean: **1040 lines**, SHA-256 `4c0b2af05c5bee118926d2c8abdc4d38c074c0e832c54695f57d96ffaa4d922d`. `check_sorry_data.py`: passed.
- `git diff --check` and intake `check-files` on the fourteen deliverables: passed.


| Packet | Targets | API | Checks | Requests | Restructures |
| --- | ---: | ---: | ---: | ---: | ---: |
| parent | 717 | 591 | 564 | 13 | 3 |
| RS.0 | 13 | 36 | 24 | 4 | 0 |
| RS.1 | 11 | 18 | 13 | 1 | 2 |
| RS.2 | 21 | 40 | 25 | 7 | 1 |
| GC.0 | 9 | 18 | 13 | 3 | 0 |
| GC.1 | 13 | 21 | 16 | 4 | 0 |
| GC.2 | 9 | 15 | 8 | 1 | 0 |
| GC.3 | 13 | 29 | 21 | 3 | 3 |
| GC.4 | 5 | 27 | 21 | 1 | 1 |
| GC.5 | 5 | 14 | 9 | 1 | 0 |
| GC.6 | 18 | 17 | 9 | 2 | 0 |

Combined planets by layer: RS.0: 6, RS.1: 6, RS.2: 6, GC.0: 3, GC.1: 6, GC.2: 4, GC.3: 6, GC.4: 6, GC.5: 6, GC.6: 6.

## Exact cross-part and supplier prerequisite edits

The following compares input packets with the final packets. Prefix `FunctionFieldArithmeticPartII:` is abbreviated as `local:`. No omitted prerequisite is implicitly supplied.

- **local:GC.0/square-quotient-comparison**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; add `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:GC.0/section-quotient-comparison**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:GC.4/chart-descent-line**; remove `local:GC.3/collision-descent`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.4/high-degree-effective-descent**; remove `local:GC.3/collision-descent`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.6/root-torsor-comparison**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:GC.6/torsor-fibre-sequences**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.0/native-stackification-equivalence**; remove `DiamondsAndVStacks:D0/stackification`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.0/native-chart-frame-independence**; remove `DiamondsAndVStacks:D0/stackification`; add `SchemeAndStackFoundations:SF.1`.
- **local:RS.0/native-universe-adapter**; remove `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1`.
- **local:key/root-stacks**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.1/two-pullback**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.1/affine-chart**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.1/closed-fibre**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.2/infinite-root-stack**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1`.
- **local:GC.0/root-picard**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:GC.0/square-action-quotient**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:GC.3/tame-local-systems**; add `local:GC.3/root-curve-character-dictionary`.
- **local:GC.3/collision-kernel**; add `local:GC.3/tensor-character-kernel`.
- **local:GC.3/collision-descent**; add `local:GC.3/monodromy-symmetric-local-system`, `local:GC.3/pushforward-description-comparison`.
- **local:GC.3/cohomology-vanishing**; remove `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; add `local:GC.3/rational-coarse-comparison`, `local:GC.3/twisted-curve-cohomology`.
- **local:GC.3/koszul-exterior**; add `local:GC.3/alternating-invariants-exterior`.
- **local:GC.3/exterior-cohomology**; add `local:GC.3/rational-coarse-comparison`, `local:GC.3/symmetric-power-cohomology`, `local:GC.3/twisted-curve-cohomology`, `local:GC.3/alternating-invariants-exterior`.
- **local:GC.4/fibre-triviality**; remove `local:GC.3/collision-descent`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.4/empty-ramification-descent**; remove `local:GC.3/collision-descent`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.4/high-degree-descent**; add `local:GC.4/high-degree-effective-descent`.
- **local:GC.5/divisor-tensor-line**; remove `local:GC.3/symmetric-local-system`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.5/unit-trivialization**; remove `local:GC.3/symmetric-local-system`; add `local:GC.3/monodromy-symmetric-local-system`.
- **local:GC.6/picard-descent-obstructions**; add `local:GC.6/norm-descent-obstruction`, `local:GC.6/invariance-versus-descent`.
- **local:GC.6/quadratic-input**; add `local:GC.6/reciprocity-root-unit-triviality`.
- **local:GC.6/closed-point-trace**; add `local:GC.6/rank-one-cyclic-tensor-trace`.
- **local:GC.6/away-ramification-generation**; add `local:GC.6/actual-unit-image-determination`.
- **local:RS.2/kummer-torsor-limit**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.
- **local:RS.2/infinite-affine-quotient**; remove `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`; add `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/quotient-stack`.

## Supplier requests — complete collection

There are 40 retained request records. The stable ids, exact needs and consumers below are collected from the final packets. Anonymous inherited requests are labelled by packet and one-based array position; these labels do not invent registered stage ids. Parent records can describe an umbrella or historical disposition; the accepted refinement states the narrower live interface. The upstream/library ownership notes above govern commissioning.

### parent

#### STACK-GEOM

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[0]`.

- **id**: STACK-GEOM
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Integrate the current SchemeAndStackFoundations §§1.18–1.23 stackification, two-fibre product, quotient, algebraic-stack, diagonal/atlas and finite-root interfaces on the actual native scheme site. Reuse its ordinary affine fpqc descent and the flat-surjective Spec criterion. The remaining contract is compatibility of those carriers, charts and arrows with native root data and big-site universes; the exact nonreduced finite-diagonalizable coarse extension is RS1-DIAGONALIZABLE-COARSE. No foundational stack carrier, finite root or general quotient theorem is replanned here.
- **neededBy**:
  - FunctionFieldArithmeticPartII:key/root-stacks
  - FunctionFieldArithmeticPartII:RS.1/two-pullback
  - FunctionFieldArithmeticPartII:RS.1/affine-chart
  - FunctionFieldArithmeticPartII:RS.1/closed-fibre
  - FunctionFieldArithmeticPartII:RS.1/coarse-space
  - FunctionFieldArithmeticPartII:RS.1/regular-dm
  - FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe
  - FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes
  - FunctionFieldArithmeticPartII:GC.0/root-picard
  - FunctionFieldArithmeticPartII:GC.0/square-action-quotient
  - FunctionFieldArithmeticPartII:GC.1/evaluation-pullback
  - FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion
  - FunctionFieldArithmeticPartII:GC.1/ordered-proper
  - FunctionFieldArithmeticPartII:GC.4/weighted-cover
  - FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf
  - FunctionFieldArithmeticPartII:GC.6/root-norm
  - FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions

#### CURVE-GEOM

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[1]`.

- **id**: CURVE-GEOM
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Supply ordinary line-bundle Picard stacks in all integer degrees and Pic^d torsors without chosen k-rational point, Sym^d X and effective-section equivalence, smoothness of symmetric powers, coherent Riemann–Roch/Serre duality and family base change/evaluation, closed-point divisors, line-bundle norm and norm sections for finite-flat curve covers. Integrate upstream JacobianChallenge A/B/D/F and AlgebraicCurves’ comparison dictionary instead of constructing them here. The existing function-field Riemann–Roch theorem alone does not supply this family geometry.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.0/root-picard
  - FunctionFieldArithmeticPartII:GC.0/square-action-quotient
  - FunctionFieldArithmeticPartII:GC.1/root-symmetric-space
  - FunctionFieldArithmeticPartII:GC.1/evaluation-pullback
  - FunctionFieldArithmeticPartII:GC.1/incidence-transversality
  - FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid
  - FunctionFieldArithmeticPartII:GC.4/evaluation-surjective
  - FunctionFieldArithmeticPartII:GC.4/weighted-cover
  - FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected
  - FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent
  - FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors
  - FunctionFieldArithmeticPartII:GC.6/norm-residue-square
  - FunctionFieldArithmeticPartII:GC.6/root-norm
  - FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions
  - FunctionFieldArithmeticPartII:GC.6/hat-root-norm
  - FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid

#### FA-ADELES

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[2]`.

- **id**: FA-ADELES
- **supplier**: FunctionFieldArithmetic:FA.2
- **need**: Supply the function-field local rings/completions, residue maps and unit groups, ideles and degree, the divisor/idele gluing equivalence and strong approximation with specified finite local congruences. A number-field idele construction is insufficient.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.2/root-units
  - FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid
  - FunctionFieldArithmeticPartII:GC.6/away-ramification-generation
  - FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid
- **assemblyDisposition**: Native places, valuation completions, residue maps, divisors, restricted products and finite-precision weak approximation are existing inputs, not new targets. The live application boundary is GC2-COMPLETED-LATTICES and GC6-CURVE-DICTIONARY, including weighted curve degrees and root frames.

#### FA-RECIPROCITY

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[3]`.

- **id**: FA-RECIPROCITY
- **supplier**: FunctionFieldArithmetic:FA.4
- **need**: Supply geometric-Frobenius-normalized quadratic reciprocity, local residue-square character at odd-characteristic ramified places, and the character-determination statement after finite congruence conditions. For x outside R, inverse uniformizer corresponds to O_X(x) and yields the local quadratic Frobenius sign. Infinite reciprocity keeps profinite completion/dense image.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.6/quadratic-input
  - FunctionFieldArithmeticPartII:GC.6/away-ramification-generation

#### PI1

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[4]`.

- **id**: PI1
- **supplier**: InverseGaloisAndArithmeticFundamentalGroups:IG.0
- **need**: Supply the scheme finite-étale-cover/fibre-functor equivalence and projective-space simple connectivity in the stated geometric setting. The packet’s existing IG.2 specialization nodes do not provide IG.0. Root-stack extensions are separately gap ST-LISSE, not silently asserted by this scheme request.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected
  - FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent
- **assemblyDisposition**: GC.3 consumers now use their exact accepted follow-up node ids. Remaining scheme projective-space input is GC4-PROJECTIVE-PI1; this record is historical where neededBy is empty.

#### TAME-INERTIA

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[5]`.

- **id**: TAME-INERTIA
- **supplier**: InverseGaloisAndArithmeticFundamentalGroups:IG.1
- **need**: Supply geometric/arithmetic scheme fundamental-group exact sequences and tame local inertia for punctured smooth curves, with the arithmetic/geometric Frobenius conventions. The root-stack inertia comparison is separately gap ST-LISSE.
- **neededBy**:
- **assemblyDisposition**: GC.3 consumers now use their exact accepted follow-up node ids. Remaining scheme projective-space input is GC4-PROJECTIVE-PI1; this record is historical where neededBy is empty.

#### DUALITY-SCHEME

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[6]`.

- **id**: DUALITY-SCHEME
- **supplier**: EtaleDualityAndPerverseSheaves:EDC.2:pairings
- **need**: Supply the scheme graded Poincaré pairing and its rank-one/dual-character vanishing interface. The smooth-DM and rational tame-coarse comparisons consumed here require the shared stacks Part II and remain gap ST-OPS.
- **neededBy**:
- **assemblyDisposition**: GC.3 consumers now use their exact accepted follow-up node ids. Remaining scheme projective-space input is GC4-PROJECTIVE-PI1; this record is historical where neededBy is empty.

#### JAC-A

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[7]`.

- **id**: JAC-A
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Integrate the existing upstream AlgebraicVectorBundles L0A tensorSection, tensor/unit comparisons and coherent strong monoidal module pullback, and L0B preservation of finite local freeness/rank one, through the native InvertibleSheaf interface. Supply the coordinate adapter showing that tensorSection followed by the trivial-line unit isomorphism evaluates to multiplication, that the free unit section evaluates to 1, and that the fixed recursive powers and section powers respect identity/composition and pullback. The general sheaf tensor construction and pullback structure are imports from that roadmap, never new targets here. SF.3/JacobianChallenge supplies the invertible-sheaf integration and the root-specific coordinate consequences consume it.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.0/tensor-power
  - FunctionFieldArithmeticPartII:RS.0/section-power
  - FunctionFieldArithmeticPartII:RS.0/root-object
  - FunctionFieldArithmeticPartII:key/root-stacks
  - FunctionFieldArithmeticPartII:RS.2/transition
  - FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism
  - FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization
  - FunctionFieldArithmeticPartII:RS.0/section-power-transport
- **upstreamPrerequisites**:
  - UPSTREAM:AlgebraicVectorBundles:L0A
  - UPSTREAM:AlgebraicVectorBundles:L0B

#### ORDINARY-STACKS

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[8]`.

- **id**: ORDINARY-STACKS
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Import generic stackification/two-fibre products and site-independent quotients from current SchemeAndStackFoundations §§1.18 and 1.21, and the line-with-section classifier and finite roots from §1.21. DiamondsAndVStacks D0 is the Perf/v instance, not the generic scheme-site owner. Native coherent-root limit carriers remain the RS2-LIMIT-TYPING contract; big-site universe adapters remain explicit.
- **neededBy**:
  - FunctionFieldArithmeticPartII:key/root-stacks
  - FunctionFieldArithmeticPartII:RS.1/two-pullback
  - FunctionFieldArithmeticPartII:RS.1/affine-chart
  - FunctionFieldArithmeticPartII:RS.1/closed-fibre
  - FunctionFieldArithmeticPartII:RS.2/infinite-root-stack
  - FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient
  - FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit
  - FunctionFieldArithmeticPartII:GC.0/root-picard
  - FunctionFieldArithmeticPartII:GC.0/square-action-quotient

#### ROOT-ALGEBRAIC

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[9]`.

- **id**: ROOT-ALGEBRAIC
- **supplier**: AlgebraicModuliForArithmeticGeometry:R09.4
- **need**: Apply the algebraic quotient criterion to [Spec A[t]/(t^n-f)/μ_n] for finite flat diagonalizable μ_n, using a smooth atlas obtained through μ_n→Gm. Supply inertia/DM criteria with actual branch-point and exponent-invertibility hypotheses and the regularity comparison. This is the general algebraic-stack criterion owned by R09.4, not the root construction itself. Do not call the infinite fpqc quotient algebraic of finite presentation.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.1/affine-chart
  - FunctionFieldArithmeticPartII:RS.1/regular-dm
- **assemblyDisposition**: Current generic owner is SchemeAndStackFoundations §§1.19–1.23. Reuse that roadmap. RS1-DIAGONALIZABLE-COARSE retains the nonreduced diagonalizable coarse generality; the relative/native comparisons stay local.

#### ROOT-COARSE

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[10]`.

- **id**: ROOT-COARSE
- **supplier**: AlgebraicModuliForArithmeticGeometry:R09.5
- **need**: For a finite diagonalizable group acting on an affine scheme, give the quotient stack’s coarse-space universal property from its invariant algebra, with compatibility under arbitrary base change in this linearly reductive case. Distinguish it from general finite-inertia flat/tame base-change statements and from a fine moduli object.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.1/coarse-space
- **assemblyDisposition**: Current generic owner is SchemeAndStackFoundations §§1.19–1.23. Reuse that roadmap. RS1-DIAGONALIZABLE-COARSE retains the nonreduced diagonalizable coarse generality; the relative/native comparisons stay local.

#### TOWER-AFF

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[11]`.

- **id**: TOWER-AFF
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Integrate the ordinary affine inverse-limit carrier and its finite projections with the locally owned RS.2/flat-torsor-tower-limit statement, coframe-inverse-limit and coframe-fpqc-torsor. Its finite-flat torsors, affine faithfully flat transitions, tensor-product comparison, finite quotient recoveries and arrows are specified by those exact nodes; do not commission a second generic torsor-tower theorem. Supply the finite-type affine-chart/closed-point residue-field comparison over Q used by RS.2/non-fppf-torsor.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit
  - FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient
  - FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf
- **assemblyDisposition**: Generic torsor-tower statement is now planned locally by RS.2/flat-torsor-tower-limit; RS2-TOWER-AFF retains only its affine-limit/finite-projection integration. Do not commission a duplicate theorem.

#### KUMMER-FINITE

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `requests[12]`.

- **id**: KUMMER-FINITE
- **supplier**: SchemeAndStackFoundations:SF.2
- **need**: For every positive n over an arbitrary field k, the fppf Kummer sequence is exact and identifies μ_n torsor classes with H1_fppf(k,μ_n)=k×/(k×)^n, using H1(k,Gm)=Pic(k)=0. Retain the actual quotient maps μ_(nm)→μ_n and compatibility on classes. Identify torsor classes with derived H1 on the fpqc site for the affine inverse-limit band G. No assertion that every fpqc G-torsor is fppf-locally trivial is allowed.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift
  - FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes

### RS.0

#### JAC-A-RS0

Packet: [FunctionFieldArithmeticPartII--RS.0.json](../packets/FunctionFieldArithmeticPartII--RS.0.json), `requests[0]`.

- **id**: JAC-A-RS0
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Integrate, without replanning, AlgebraicVectorBundles L0A–L0B tensorSection, the unit comparison and coherent strong symmetric monoidal module pullback on native InvertibleSheaf. Supply explicit pure-tensor coordinate multiplication, unit-section coordinate1, naturality under actual module maps and section-pullback compatibility with unit/tensor and identity/composition comparisons. Reuse current native trivializationCoordinate and unitsGlobalSectionsMulEquivAut; their generic definitions are already implemented. This refines parent JAC-A only at its still-needed section/tensor comparison boundary. Fix β₀:h*O_T≅O_Y and β₂:h*(M⊗N)≅h*M⊗h*N, so the root-power recursion uses their inverses.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.0/native-power-pullback
  - FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence
  - FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality

#### AFFINE-BASIS-RS0

Packet: [FunctionFieldArithmeticPartII--RS.0.json](../packets/FunctionFieldArithmeticPartII--RS.0.json), `requests[1]`.

- **id**: AFFINE-BASIS-RS0
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Supply restriction/extension equivalence for groupoid-valued stacks between the scheme fppf site over X and its affine test basis, with the topology induced by covering refinements, and compatibility with the chosen native module and section pullbacks. Reuse native fppf/fpqc topologies and effective module descent from R09.3; this is a generic site-basis adapter, not a second root-stack or quotient definition.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.0/native-stackification-equivalence

#### UNIVERSE-GEOMETRY-RS0

Packet: [FunctionFieldArithmeticPartII--RS.0.json](../packets/FunctionFieldArithmeticPartII--RS.0.json), `requests[2]`.

- **id**: UNIVERSE-GEOMETRY-RS0
- **supplier**: SchemeAndStackFoundations:SF.0
- **need**: Coherent ambient-universe lifts of native schemes/modules/invertible sheaves on a fixed small site, with inverse equivalences on their essential images and comparison isomorphisms for sections, units, tensor, Spec/Γ and pullback. On each matched test scheme, additionally require essential surjectivity onto the full enlarged invertible-sheaf groupoid, full faithfulness and section bijections, compatible with those comparisons. An image-only inverse for module lifts is insufficient for the root-groupoid equivalence; no equivalence of all module categories across universes is requested. Specify actual carriers and identity/composition diagrams. Restrict the test-site equivalence to the lifted site, not all genuinely larger test schemes.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.0/native-universe-adapter

#### UNIVERSE-STACKS-RS0

Packet: [FunctionFieldArithmeticPartII--RS.0.json](../packets/FunctionFieldArithmeticPartII--RS.0.json), `requests[3]`.

- **id**: UNIVERSE-STACKS-RS0
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Transport groupoid-valued pseudofunctors, covering topologies, IsStack and stackification across an equivalence with the essential-image lifted site, including strong transformations and invertible modifications. Root-specific transport uses this generic adapter; no equality between all universe levels of schemes is asserted.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.0/native-universe-adapter
- **assemblyDisposition**: Generic site-level stackification and quotient carriers now belong to current SchemeAndStackFoundations §§1.18 and 1.21. The equivalent-site/universe adapter is requested from that owner, not its Perf/v instance.

### RS.1

#### RS1-DIAGONALIZABLE-COARSE

Packet: [FunctionFieldArithmeticPartII--RS.1.json](../packets/FunctionFieldArithmeticPartII--RS.1.json), `requests[0]`.

- **id**: RS1-DIAGONALIZABLE-COARSE
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: For any commutative A, finite abelian character group H, and H-graded commutative A-algebra B with A→B_0 an isomorphism and B finite locally free over A, let D_A(H) act via its grading. Prove that [Spec B/D_A(H)]→Spec A is coarse for maps to arbitrary algebraic spaces, including geometric isomorphism classes; its QCoh pushforward is degree zero and exact, and formation commutes with every A→A′. Supply the comparison with the existing constant finite-group quotient theorem when the group becomes constant étale. No invertibility of |H| or Noetherian assumption is allowed. This is the finite diagonalizable extension of current upstream §1.17/§1.23, not a request to rebuild generic stacks or invariant rings.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.1/native-coarse-space
- **sources**:
  -
    - **sourceId**: AOV08
    - **locator**: Proposition 2.7 and Theorem 3.2/Corollary 3.3, pp.1067 and 1077–1079
    - **match**: The supplier should combine finite diagonalizable quotient geometry and degree-zero invariants with the tame coarse base-change theorem.
- **ownership**: Propose Scheme and stack foundations, Part II: finite diagonalizable coarse quotients, with the existing roadmap as first prerequisite; root-specific application remains RS.1. No extension roadmap files are edited in this job.

### RS.2

#### RS2-TOWER-AFF

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[0]`.

- **id**: RS2-TOWER-AFF
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Supplied by the merged TauCetiRoadmap roadmap SchemeAndStackFoundations (main at 42d0023, merged on 14 October 2026; its README is authoritative), Layer 1: §1.1 qcoh_fpqc_descent (quasi-coherent modules descend along fpqc coverings, and with them quasi-coherent algebras and affine morphisms; effective descent of affine schemes along one faithfully flat morphism is cited there from ModularCurves 0E), §1.15 torsors (IsTorsor, with the fpqc torsor theory for flat affine G as a standing hypothesis; Torsor.hom_isIso, Torsor.baseChange) and §1.16 contracted products and pushforwardTorsor. RS.2 uses these in part (g) of RS.2/flat-torsor-tower-limit and for the descent of root systems. The limit theorem for towers of finite flat torsors is not in that README and is planned here as RS.2/flat-torsor-tower-limit; the closed point with finite residue field is Mathlib's finite_of_finite_type_of_isJacobsonRing.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/coframe-tower
  - FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit

#### RS2-SSF-LAYER0

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[1]`.

- **id**: RS2-SSF-LAYER0
- **supplier**: SchemeAndStackFoundations:SF.0
- **need**: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), Layer 0: §0.9 affine_transition_limits (a cofiltered diagram of schemes with affine transition maps has a limit, computed affine-locally; Stacks 01YW, 01YX) and §0.1 relative Spec of a quasi-coherent O_T-algebra with its universal property (Tau Ceti RelativeSpec and upstream AlgebraicVectorBundles L1A–L1B; not at the pins). Used for the limit of RS.2/flat-torsor-tower-limit and for the global coframe torsor Spec_T(⊕_(0≤i<n) M^(⊗i)) of RS.2/normalized-coframes.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/normalized-coframes
  - FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit
- **addedBy**: REV-FunctionFieldArithmeticPartII--RS.2

#### RS2-JAC-A

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[2]`.

- **id**: RS2-JAC-A
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), §3.4: picardGroupoid X := Core(InvertibleSheaf X) with its symmetric monoidal structure (tensor powers with coherent associativity and unit constraints), pullback as a functor of Picard groupoids and isStack. Together with upstream AlgebraicVectorBundles L0A (module pullback as a strong symmetric monoidal functor with coherent identity and composition comparisons; tensorSection in its Suggested.lean) and L0B (FiniteLocallyFreeSheaf, closure under arbitrary pullback, rank one identified with InvertibleSheaf). The pinned Tau Ceti InvertibleSheaf.tensorProduct, tensorProductAssoc and unit isomorphisms are what these structures organize; the pins have no monoidal-category instance and no pullback on InvertibleSheaf. The root-section equations under tensor powers and pullback are routine consequences.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/transition-native
  - FunctionFieldArithmeticPartII:RS.2/normalized-coframes

#### RS2-ORDINARY-STACKS

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[3]`.

- **id**: RS2-ORDINARY-STACKS
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023): §1.18 (the generic site-level Stack.twoFibreProduct, objectwise categorical pullback with its 2-universal property, and Stack.stackification) and §1.21 (the generic Stack.quotient J (X,R) on any site: objects over T are locally trivial R-torsors, R ≃ X ×_[X/R] X, and the isomorphism classes form the sheafified quotient; actionQuotient.torsorEquiv: objects are G_T-torsors with equivariant maps). RS.2 uses them on the fpqc site of schemes with the action groupoid of G = D(ℚ/ℤ) on Spec C_A(f). That README states that DiamondsAndVStacks D0.26 is the (Perf, v) instance of these constructions, so the scheme-level owner is SchemeAndStackFoundations, not DiamondsAndVStacks:D0. The constructions are stated for small sites; their use on the big fpqc site of schemes needs the universe adapters recorded in RS2-NATIVE-CARRIERS.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/root-limit-base-change-native
  - FunctionFieldArithmeticPartII:RS.2/infinite-quotient-native

#### RS2-LIMIT-TYPING

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[4]`.

- **id**: RS2-LIMIT-TYPING
- **supplier**: AlgebraicModuliForArithmeticGeometry:R09.4
- **need**: Expose compatible-limit-family and limit-stack-descent on the native fpqc stack carrier, with evaluation, strong-transformation pullback and componentwise arrow extensionality in explicit object/morphism universes. Retain neutralization-equivalence and classifying-abelian-gerbe. No extra generic two-limit or gerbe construction is owned by RS.2. These targets are in the AlgebraicModuliForArithmeticGeometry package README (TauCetiRoadmap pull request #853): §4.3 neutralizationEquivalence and classifyingAbelianGerbe, and the compatible-limit sample API (GerbeSampleAPI.compatibleLimit).
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/coherent-roots-native
  - FunctionFieldArithmeticPartII:RS.2/root-limit-descent-native
  - FunctionFieldArithmeticPartII:RS.2/dvr-residual-gerbe-native
  - FunctionFieldArithmeticPartII:RS.2/kummer-tower-native
  - FunctionFieldArithmeticPartII:RS.2/kummer-classes-native
  - FunctionFieldArithmeticPartII:RS.2/neutralization-change-native

#### RS2-KUMMER-FINITE

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[5]`.

- **id**: RS2-KUMMER-FINITE
- **supplier**: SchemeAndStackFoundations:SF.2
- **need**: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), Layers 1–2: §2.11 fppf_kummer_sequence (exact on the big fppf site for every n ≥ 1) with kummer_test_field (H¹_fppf(Spec K, μ_n) = K×/K×ⁿ for every field and every n, including n = p in characteristic p) and the description of H¹_fppf(μ_n) by pairs (L, α: L^(⊗n) ≅ O) (Stacks 040Q); §2.3 NonabelianH1 J G on any site, with map along homomorphisms (map_id, map_comp) and connecting maps compatible with map, which gives the compatibility of the Kummer identifications with μ_m → μ_n; §1.15 torsorClasses with pushforward. Classes of fpqc G-torsors are NonabelianH1 on fpqcTopology for G = lim μ_n; the comparison of fpqc and fppf torsors for the finite μ_n is part (g) of RS.2/flat-torsor-tower-limit. The étale Kummer sequence alone is not enough.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/normalized-coframes
  - FunctionFieldArithmeticPartII:RS.2/coframe-tower
  - FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit
  - FunctionFieldArithmeticPartII:RS.2/kummer-coordinate-diagram
  - FunctionFieldArithmeticPartII:RS.2/kummer-lift-native
  - FunctionFieldArithmeticPartII:RS.2/kummer-classes-native

#### RS2-FINITE-ROOT-STACKS

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `requests[6]`.

- **id**: RS2-FINITE-ROOT-STACKS
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Supplied by the merged SchemeAndStackFoundations README (TauCetiRoadmap main, 42d0023), §1.21: rootStack n (L,s) := X ×_[A¹/G_m] [A¹/G_m] along the nth-power map, with rootStack.baseChange, .one, .isIso_away, .affineChart (Spec A[t]/(t^n − s) modulo μ_n), .transition and the checks test_dvr_chart and test_fibre_nonreduced (Cadman 2005, §§2.1–2.2), and lineBundleSectionStack ([A¹/G_m] classifies pairs (L,s)). RS.2's finite transitions, DVR charts and finite zero fibres are these; RS.2 adds the coherent pseudodiagram, the infinite limit and the Kummer comparisons. The equivalence of the native root triples of RS.0–RS.1 with this fibre-product definition is the comparison named in this packet's restructure proposal.
- **neededBy**:
  - FunctionFieldArithmeticPartII:RS.2/transition-native
  - FunctionFieldArithmeticPartII:RS.2/dvr-uniformizer-native
  - FunctionFieldArithmeticPartII:RS.2/dvr-residual-gerbe-native
- **addedBy**: REV-FunctionFieldArithmeticPartII--RS.2

### GC.0

#### GC0-WEIL-FRAMES

Packet: [FunctionFieldArithmeticPartII--GC.0.json](../packets/FunctionFieldArithmeticPartII--GC.0.json), `requests[0]`.

- **id**: GC0-WEIL-FRAMES
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: For finite étale R→Spec k of rank ρ, give the actual scheme-site functors T(S)=Γ(R_S,O)× and V(S)=Γ(R_S,O), represent them by Res_R/k G_m and Res_R/k A¹, and identify after an étale splitting with G_m^ρ and A^ρ. Formation must commute with arbitrary S′→S. For each native invertible K on R_S, represent the relative frame functor S′↦Isom(O_R_S′,K_S′) as an affine T_S-torsor, locally inhabited on the fppf (indeed étale) site; compare its arrows with native isomorphisms, and descend its linear section charts. These are generic finite-étale Weil-restriction/frame inputs, not a new GC.0 construction of generic rigidified line bundles.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.0/root-frame-action
  - FunctionFieldArithmeticPartII:GC.0/relative-root-gerbe
  - FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison

#### GC0-NATIVE-INTEGRATION

Packet: [FunctionFieldArithmeticPartII--GC.0.json](../packets/FunctionFieldArithmeticPartII--GC.0.json), `requests[1]`.

- **id**: GC0-NATIVE-INTEGRATION
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Realize the existing SF.3/picard-groupoid and picard-stack-curve contracts on the same native InvertibleSheaf fibres used here, with explicit comparison of the new current-library InvertibleSheaf.pullback, RigidifiedLineBundle and eulerDegree interfaces to the atlas-pin module pullback, tensor/unit and full isomorphism groupoids. Restriction to R_S, pullback in S, native duality and tensorSection must share coherent identity/composition, tensor and unit comparisons. Identify fibrewise integer degree with the ordinary degree-d substack. Keep the ordinary Picard stack, Picard sheaf and rigidified Picard functor distinct, and retain Pic^d torsors without any chosen degree-one point. This asks integration of existing owners (JacobianChallenge A/D; AlgebraicVectorBundles L0A/L0B), not their replanning.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.0/native-root-fibres
  - FunctionFieldArithmeticPartII:GC.0/root-tensor-coherence
  - FunctionFieldArithmeticPartII:GC.0/root-degree-components
  - FunctionFieldArithmeticPartII:GC.0/native-root-section-fibres

#### GC0-ORDINARY-SITE

Packet: [FunctionFieldArithmeticPartII--GC.0.json](../packets/FunctionFieldArithmeticPartII--GC.0.json), `requests[2]`.

- **id**: GC0-ORDINARY-SITE
- **supplier**: SchemeAndStackFoundations:SF.1/stack-in-groupoids
- **need**: On the actual big scheme fppf site, identify the native invertible-sheaf pseudofunctors and their root-arrow groupoids with the supplier stack carrier. Use the current generic SF.1 two-fibre-product, quotient-stack and stackification interfaces on this site, preserving the explicit isomorphism in each two-fibre object and all torsor descent arrows. Provide the ordinary quotient universal property for the rigidified Picard groupoid, including the R=empty stack case; the nonempty-R algebraic-space reduction uses the imported setoid criterion. This is a comparison between existing ordinary stack interfaces, not diamond geometry.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.0/native-root-fibres
  - FunctionFieldArithmeticPartII:GC.0/square-quotient-comparison
  - FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison

### GC.1

#### GC1-RESTRICTION

Packet: [FunctionFieldArithmeticPartII--GC.1.json](../packets/FunctionFieldArithmeticPartII--GC.1.json), `requests[0]`.

- **id**: GC1-RESTRICTION
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: For a finite etale k-scheme R, supply the restriction stack whose T-objects are invertible sheaves with sections on R times T, its equivalence with [Res_R A1/Res_R G_m], the tensor-square 1-morphism, and its Galois-equivariant identification after a splitting extension with a product indexed by all geometric points of R. The existing line-bundle-section-stack node gives the rank-one factor, but does not state this restriction/descent adapter. Its chosen comparisons must obey identity/composition pullback coherence.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence

#### GC1-PERMANENCE

Packet: [FunctionFieldArithmeticPartII--GC.1.json](../packets/FunctionFieldArithmeticPartII--GC.1.json), `requests[1]`.

- **id**: GC1-PERMANENCE
- **supplier**: SchemeAndStackFoundations:SF.1
- **need**: Extend the actual stack-morphism-property interface with the nonrepresentable quasi-finite definition of Stacks 101.23.2 and 101.24.1, its base-change law, properness base change/composition, and Lemma 101.37.5(2): over a base, any morphism from a proper stack to a separated stack is proper. Include the proper finite-quotient chart criterion: for finite etale Gamma, a finite Gamma-equivariant affine scheme over A gives a proper quotient stack over Spec A (finite diagonal, finite type, universally closed). Existing stack-morphism-properties defines properness but does not supply these exact permanence statements. Also supply the finite-type zero-dimensional DM residual-gerbe decomposition: over an algebraically closed field a reduced such stack with finitely many points is the disjoint union of its residual gerbes, each neutralized by a chosen object.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.1/root-coarse-chart
  - FunctionFieldArithmeticPartII:GC.1/ordered-geometric-fibres

#### GC1-CURVE-FAMILY

Packet: [FunctionFieldArithmeticPartII--GC.1.json](../packets/FunctionFieldArithmeticPartII--GC.1.json), `requests[2]`.

- **id**: GC1-CURVE-FAMILY
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Using SF.3/universal-section-stack and picard-stack-curve, supply the ordinary section-functor restriction map to a finite etale divisor R, and the left-exact kernel identification for L(-R)→L→L restricted to R, functorially in actual invertible sheaves and pullbacks. Over a field identify these section functors with their finite-dimensional affine spaces, including after extension to arbitrary test algebras. Integrate upstream JacobianChallenge C/D without assuming a rational point. In general parameter families do not replace the section functor by a vector bundle or assert that pi_*L commutes with every base change in small degree. The fibrewise-zero locus is a statement about geometric fibres: a nilpotent-valued section supported there need not factor through the zero-section substack.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.1/effective-open-base-change
  - FunctionFieldArithmeticPartII:GC.1/incidence-residual-equivalence
  - FunctionFieldArithmeticPartII:GC.1/refined-abel-jacobi-fibre
  - FunctionFieldArithmeticPartII:GC.1/ordered-geometric-fibres

#### GC1-SMOOTH-COORDINATES

Packet: [FunctionFieldArithmeticPartII--GC.1.json](../packets/FunctionFieldArithmeticPartII--GC.1.json), `requests[3]`.

- **id**: GC1-SMOOTH-COORDINATES
- **supplier**: SchemeAndStackFoundations:SF.0
- **need**: For a smooth finite-type scheme Z over an algebraically closed field and functions f_1,...,f_r, supply the prescribed-function criterion: Z→A^r is smooth at z precisely when the df_i at z are linearly independent, and an independent list extends locally to etale coordinates. SF.0/etale-coordinates supplies some coordinates at a smooth point; it does not state that they can start with these specified functions. Use the scheme cotangent/Jacobian interface, not a set-theoretic tangent test.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.1/evaluation-atlas-differential
  - FunctionFieldArithmeticPartII:GC.1/root-normal-crossing-chart

### GC.2

#### GC2-COMPLETED-LATTICES

Packet: [FunctionFieldArithmeticPartII--GC.2.json](../packets/FunctionFieldArithmeticPartII--GC.2.json), `requests[0]`.

- **id**: GC2-COMPLETED-LATTICES
- **supplier**: tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts
- **need**: Specialize the existing curve/place/divisor dictionary to smooth projective geometrically connected X/k. For every signed divisor D, identify the generic fibre of O_X(D) with F and its completed stalk at each closed x with {z∈F_x : z=0 or ord_x(z)≥−D_x}=π_x^{−D_x}O_x as a submodule of F_x, naturally in divisor addition and in multiplication by rational functions. Identify the residue of that completed rank-one lattice with the algebraic fibre. For invertible sheaves with given generic frames, a rational scalar extends to a sheaf map exactly when it carries each completed lattice into the target lattice; the extension is unique. These comparisons must commute with tensor product, duality and the already planned point/place and completed residue-field identifications. This is an exact interface to existing AlgebraicCurves Layer 12D and JacobianChallenge A, not a request to rebuild formal patching, Picard schemes or Riemann–Roch.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.2/generic-framed-root-picard
  - FunctionFieldArithmeticPartII:GC.2/fully-framed-root-picard
  - FunctionFieldArithmeticPartII:GC.2/fully-framed-idele-comparison

### GC.3

#### GC.3-request-1

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `requests[0]`.

- **supplier**: SchemeAndStackFoundations:SF.2
- **need**: For proper schemes Y,Z of finite type over k and constructible Q̄ℓ-sheaves F,G: the Künneth isomorphism H*(Y_k̄×Z_k̄,F⊠G)≅H*(Y_k̄,F)⊗H*(Z_k̄,G), Frobenius-equivariant, under which the exchange of the factors of Y×Y is the Koszul-signed exchange of graded factors; exactness of pushforward along finite morphisms and proper base change for them. The upstream owner of these scheme statements is EtaleCohomologyFoundations (TauCetiRoadmap pull request #938, §§F.2.1, F.2.6, F.2.7, F.4.5); this request asks only for its integration, not for a second plan. Also integrate the geometric cohomological-dimension bound for a curve (F.3), extension from finite E/Qℓ to Q̄ℓ (F.4.5), and continuity/Frobenius compatibility of these operations (F.4.6).
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.3/symmetric-coarse-model
  - FunctionFieldArithmeticPartII:GC.3/symmetric-power-cohomology
  - FunctionFieldArithmeticPartII:GC.3/twisted-curve-cohomology

#### GC.3-request-2

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `requests[1]`.

- **supplier**: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
- **need**: Reuse ordinary transfer and the all-degree finite-group annihilation theorem already implemented in current Tau Ceti (currentLibraryImports). Layer 10 owns transfer; no new corestriction target or all-degree ordinary/continuous comparison is requested. The additional target here is only vanishing when |G| acts invertibly.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.3/finite-group-rational-acyclicity

#### GC.3-request-3

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `requests[2]`.

- **supplier**: tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality
- **need**: Reuse the already implemented tensor/exterior maps and identities listed in currentLibraryImports, consumed by the one-column Schur-functor comparison. No reconstruction of antisymmetrization, exteriorProjection, factorial composites or their naturality is requested. The current implementations work over an arbitrary commutative ring and module, beyond the complex finite-dimensional Schur-Weyl specialization.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.3/antisymmetrization
  - FunctionFieldArithmeticPartII:GC.3/alternating-invariants-exterior

### GC.4

#### GC4-PROJECTIVE-PI1

Packet: [FunctionFieldArithmeticPartII--GC.4.json](../packets/FunctionFieldArithmeticPartII--GC.4.json), `requests[0]`.

- **id**: GC4-PROJECTIVE-PI1
- **supplier**: InverseGaloisAndArithmeticFundamentalGroups:IG.0
- **need**: Export pi1_et(P^m_K)=1 for every m>=0 over an algebraically closed field K, in arbitrary characteristic, together with the existing finite-etale-cover/fibre-functor interface. Source: SGA 1, Expose XI Proposition 1.1, recomposed p. 219 (original p. 285). Existing IG.0 finite cover and adic nodes were read but no projective-space simple-connectivity target was located. This request is only the scheme theorem; finite covers and lisse sheaves on root and quotient stacks are gap GC4-LISSE-ADAPTER.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.4/relative-projective-quotient
  - FunctionFieldArithmeticPartII:GC.4/high-degree-effective-descent

### GC.5

#### GC5-CURVE-COMPARISON

Packet: [FunctionFieldArithmeticPartII--GC.5.json](../packets/FunctionFieldArithmeticPartII--GC.5.json), `requests[0]`.

- **id**: GC5-CURVE-COMPARISON
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Integrate the existing AlgebraicCurves Layer 12A/12D closed-point/place and degree-preserving divisor dictionary and the ordinary Picard stack/tensor interface with the parent root-Picard objects. Identify native auxiliaryDivisors(S_R,d,B) with effective divisors on U. Use ordinary picard-stack-curve, picard-scheme-without-point and universal-section-stack supplier targets and upstream JacobianChallenge A/C/D; do not assume a degree-one rational point or replace a Pic^d torsor by a pointed Jacobian. Only this comparison and ordinary geometry are requested, not lisse descent.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.5/auxiliary-index
  - FunctionFieldArithmeticPartII:GC.5/signed-divisor-line
  - FunctionFieldArithmeticPartII:GC.5/signed-character-translation

### GC.6

#### GC6-CURVE-DICTIONARY

Packet: [FunctionFieldArithmeticPartII--GC.6.json](../packets/FunctionFieldArithmeticPartII--GC.6.json), `requests[0]`.

- **id**: GC6-CURVE-DICTIONARY
- **supplier**: SchemeAndStackFoundations:SF.3
- **need**: Integrate the existing upstream AlgebraicCurves Layer12 function-field/scheme comparison and JacobianChallenge LayerA divisor-line/degree interface: closed points of X correspond to native TauCeti.Place k k(X), with residue fields and valuations; a rational line section has its signed divisor, O(div s) is isomorphic to the line sending the canonical rational section to s, and order0 identifies its residue with the value in a regular local frame. Supply this at non-rational points and for negative divisors, including degree multiplication under finite flat pullback and degree preservation under norm. Existing SF.3 picard-groupoid/line-bundle-norm nodes are imported, and general tensor/pullback coherence remains owned by AlgebraicVectorBundles L0A/L0B/L0C. Do not rebuild any of these upstream targets.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.6/root-framed-support-moving
  - FunctionFieldArithmeticPartII:GC.6/degree-descent-counterexample
- **upstreamPrerequisites**:
  - UPSTREAM:AlgebraicCurves:Layer12
  - UPSTREAM:JacobianChallenge:LayerA

#### GC6-TAME-RESIDUE

Packet: [FunctionFieldArithmeticPartII--GC.6.json](../packets/FunctionFieldArithmeticPartII--GC.6.json), `requests[1]`.

- **id**: GC6-TAME-RESIDUE
- **supplier**: FunctionFieldArithmetic:FA.4
- **need**: Export the tame ramified quadratic local specialization in odd residue characteristic from the existing ClassFieldTheory local Artin/conductor interface: for the completion at x and a ramified quadratic extension, the quadratic Artin character of a local integral unit u is the quadratic character of its nonzero residue. In particular every square-residue unit is killed and every nonsquare-residue unit has sign-1. Compare the arithmetic uniformizer normalization of FA.4 with geometric Frobenius on inverse uniformizers. The finite global Artin norm quotient and function-field ideles already have exact node imports and are not requested again.
- **neededBy**:
  - FunctionFieldArithmeticPartII:GC.6/reciprocity-root-unit-triviality
- **upstreamPrerequisites**:
  - UPSTREAM:ClassFieldTheory:Layers6-7

## Restructuring proposals — complete collection

There are 10 retained proposals, collected with all fields below. This assembly does not apply them or edit any neighbouring roadmap. The superseded parent all-roots-local ownership proposal has been replaced by the current finite/infinite boundary above. The sibling symplectic proposal retains all 38 item contracts, source corrections and proposed stage assignments, without making it a prerequisite of either endpoint here. Proposed stacks owners remain proposals.

### parent proposal 1

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `restructure[0]`.

- **action**: split
- **roadmaps**:
  - FunctionFieldArithmeticPartII
- **detail**: The two issue briefs share the FunctionFieldArithmetic parent but have different targets and proof closures. Yun–Zhang Appendix A builds rank-one sheaves with root ramification; AV §§3–6/App. D uses everywhere-unramified Sp/GSp systems, spinor norms, Hurwitz monodromy and Hilbert–Siegel slices. No proof of either endpoint consumes the other endpoint. The coherent infinite-root and root-Picard applications remain here after the split; generic finite roots are imported from current SchemeAndStackFoundations §1.21.
- **proposal**: Keep FunctionFieldArithmeticPartII with stages RS.0–RS.2 and GC.0–GC.6 for the first route. Create the sibling SymplecticLFunctionsModSquares, parent FunctionFieldArithmetic, area etale, title “Global function fields, reciprocity and automorphic foundations, Part II: central values of symplectic L-functions mod squares”, with stage assignments below. Both keep the parent as their first roadmap prerequisite. Preserve all 38 contracts, source issues and route-A imports; do not reassign AV to the root-stack stages.
- **stageAssignments**:
  -
    - **key**: SL.0
    - **title**: Normalized symplectic Frobenius and central square classes
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/39
      - PAPER-ABDURRAHMAN-VENKATESH-25/40
      - PAPER-ABDURRAHMAN-VENKATESH-25/41
      - PAPER-ABDURRAHMAN-VENKATESH-25/42
      - PAPER-ABDURRAHMAN-VENKATESH-25/43
      - PAPER-ABDURRAHMAN-VENKATESH-25/44
      - PAPER-ABDURRAHMAN-VENKATESH-25/45
      - PAPER-ABDURRAHMAN-VENKATESH-25/46
      - PAPER-ABDURRAHMAN-VENKATESH-25/47
      - PAPER-ABDURRAHMAN-VENKATESH-25/48
      - PAPER-ABDURRAHMAN-VENKATESH-25/49
  -
    - **key**: SL.1
    - **title**: Valuations and characteristic-zero compatible systems
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/50
      - PAPER-ABDURRAHMAN-VENKATESH-25/51
      - PAPER-ABDURRAHMAN-VENKATESH-25/52
  -
    - **key**: SL.2
    - **title**: Hurwitz-stack Step A
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/53
      - PAPER-ABDURRAHMAN-VENKATESH-25/54
      - PAPER-ABDURRAHMAN-VENKATESH-25/55
      - PAPER-ABDURRAHMAN-VENKATESH-25/56
      - PAPER-ABDURRAHMAN-VENKATESH-25/57
      - PAPER-ABDURRAHMAN-VENKATESH-25/58
      - PAPER-ABDURRAHMAN-VENKATESH-25/59
      - PAPER-ABDURRAHMAN-VENKATESH-25/60
  -
    - **key**: SL.3
    - **title**: Hilbert–Siegel systems and unit-reduction fields
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/61
      - PAPER-ABDURRAHMAN-VENKATESH-25/62
      - PAPER-ABDURRAHMAN-VENKATESH-25/63
      - PAPER-ABDURRAHMAN-VENKATESH-25/64
      - PAPER-ABDURRAHMAN-VENKATESH-25/65
  -
    - **key**: SL.4
    - **title**: Slicing, moments and Step B
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/66
      - PAPER-ABDURRAHMAN-VENKATESH-25/67
      - PAPER-ABDURRAHMAN-VENKATESH-25/68
      - PAPER-ABDURRAHMAN-VENKATESH-25/69
      - PAPER-ABDURRAHMAN-VENKATESH-25/70
      - PAPER-ABDURRAHMAN-VENKATESH-25/71
      - PAPER-ABDURRAHMAN-VENKATESH-25/72
      - PAPER-ABDURRAHMAN-VENKATESH-25/73
  -
    - **key**: SL.5
    - **title**: Quaternionic tests beyond the main hypotheses
    - **items**:
      - PAPER-ABDURRAHMAN-VENKATESH-25/91
      - PAPER-ABDURRAHMAN-VENKATESH-25/92
      - PAPER-ABDURRAHMAN-VENKATESH-25/93
- **itemInventory**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/39
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/39
      - **kind**: theorem
      - **name**: Functional equation and ε-factors with torsion coefficients
      - **statement**: L(X, ρ, t) = ε(ρ, t) L(X, ρ^∨, 1/(qt)) with ε(ρ, t) = αt^m (α ∈ ℓ^×, m ∈ Z), and ε(ρ) = Π_x ε_x(ρ, ψ, μ) for an additive character ψ of the adeles and a factorized measure (Deligne, 'Les constantes des équations fonctionnelles', Thm. 7.11, (7.9.1)); ε_x = ε_{0,x}·det(−F_x q^{deg(x)/2} | V^{I_x}) (7.6.3), and ε_{0,x}(ρ ⊗ χ) = ε_{0,x}(χ)^{dim ρ} for unramified ρ of trivial determinant ((5.5.3)).
      - **locator**: §3.2, (3.3), p. 27; §5.4.1, pp. 45
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/40
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/40
      - **kind**: theorem
      - **name**: The normalized Frobenius is special orthogonal
      - **statement**: Let ρ : π_1(X) → Sp_{2r}(ℓ) with √q ∈ ℓ fixed and H^0 = H^2 = 0 geometrically. Then H^1(X_{k̄}, ρ) has dimension 2(dim ρ)(g − 1), a symmetric pairing with ⟨Fx, Fy⟩ = q⟨x, y⟩, and F̄ = q^{−1/2}F ∈ SO(H^1): ε(ρ, t) = (−√q t)^{dim H^1} det F̄ and ε(ρ, 1/√q) = 1 for unramified ρ of trivial determinant.
      - **locator**: §3.3, pp. 27–28
      - **status**: missing
      - **note**: The printed intermediate formula for ε is off by q^{dim H^1}; see sourceIssues E5.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/41
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/41
      - **kind**: definition
      - **name**: The square classes L(X, ρ) and L^*(X, ρ)
      - **statement**: L(X, ρ) is the image of L(X, ρ, 1/√q) in ℓ^×/2 when nonzero; in general L^*(X, ρ) = spinor norm(F̄) = (h!·det⟨v_i, v_j⟩)^{−1}(d^h/dt^h)L(X, ρ, t)|_{t=1/√q} ∈ ℓ^×/2, where h (even) is the order of vanishing, the dimension of the generalized fixed space of F on H^1(X_{k̄}, ρ), with basis v_1, …, v_h. For GSp-valued ρ^{(g)} with cyclotomic multiplier and ρ = ρ^{(g)}(−1/2), L(X, ρ^{(g)}) is the square class of L(X, ρ^{(g)}, 1) = L(X, ρ, 1/√q).
      - **locator**: §3.3, (3.4), p. 28; §3.4, (3.5), pp. 28–29
      - **status**: missing
      - **note**: The second equality is Zassenhaus's formula (Appendix B.9.1) applied to the even-dimensional H^1 of square discriminant.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/42
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/42
      - **kind**: theorem
      - **name**: Lemma 3.5.1 and §3.5: square discriminant of H^1
      - **statement**: For a closed oriented surface Σ and ρ : π_1(Σ) → Sp_{2r}(ℓ), ℓ finite, the quadratic form on H^*(Σ, ρ) (the cup-product form on H^1, and the Poincaré pairing between H^0 and H^2) has square discriminant. Consequently, by lifting to the Witt vectors and to C, H^1(X_{k̄}, ρ) has square discriminant and L(X, ρ) does not depend on the choice of √q.
      - **locator**: §3.5, Lemma 3.5.1, pp. 29–30
      - **status**: missing
      - **note**: Proof: the discriminant is a bordism invariant (a Lagrangian image and dim H^* ≡ 0 mod 4), giving MSO_2(BSp_{2r}(ℓ)) = H_2(Sp_{2r}(ℓ), Z) → ℓ^×/2, which vanishes because H_2 has odd order (sourceIssues E3).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/43
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/43
      - **kind**: definition
      - **name**: The trace map and c_et(X, ρ)
      - **statement**: For A finite of order prime to p, the Hochschild–Serre spectral sequence and the trace H^2(X_{k̄}, A(1)) ≅ A give trace_X : H^3_et(X, A(1)) ≅ H^1(Gal(k̄/k), A) ≅ A (via the Frobenius generator). For ρ : π_1(X) → Sp(ℓ), c_et(X, ρ) := trace_X(ρ^*c_et) ∈ ℓ^×/2 (A = ℓ^×/2 ≅ Z/2).
      - **locator**: §3.6, (3.6)–(3.7), pp. 30–31
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/44
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/44
      - **kind**: definition
      - **name**: Admissible and GSp-admissible pairs
      - **statement**: (X, ρ), with X a smooth projective geometrically irreducible curve over k = F_q and ρ : π_1(X) → Sp_{2r}(ℓ), is admissible if (a1) ρ is geometrically surjective, (a2) q is prime to #Sp_{2r}(ℓ), (a3) q is a square in the prime field of ℓ. It is GSp-admissible (ρ : π_1(X) → GSp_{2r}(ℓ) with cyclotomic multiplier) if (a1)′ the geometric image contains Sp_{2r}(ℓ) and (a2)′ q is prime to #GSp_{2r}(ℓ). Admissible implies GSp-admissible for ρ^{(g)}.
      - **locator**: §3.7, p. 31; §4.1.1, p. 35
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/45
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/45
      - **kind**: theorem
      - **name**: Theorem 3.1: the main theorem
      - **statement**: Let (X, ρ) be admissible, #ℓ ≡ ±1 (mod 8) and q ≡ 1 (mod 8). Then L(X, ρ) = c_et(X, ρ) in ℓ^×/2 (with L = L^* when the central value vanishes).
      - **locator**: §3.7, Theorem 3.1, p. 31; §1, p. 2
      - **status**: missing
      - **note**: The proof in v1 does not cover r = 1, #ℓ = 9 (sourceIssues E4).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/46
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/46
      - **kind**: theorem
      - **name**: Equivalence of the Sp and GSp formulations
      - **statement**: For ρ = ρ^{(g)}(−1/2): L(X, ρ^{(g)}) = L(X, ρ) and c_et(X, ρ^{(g)}) = c_et(X, ρ), since the class on GSp(ℓ) pulls back along π_1(X) → Sp(ℓ) × Ẑ → GSp(ℓ) to c_et ⊗ 1 plus a term in H^2(Sp(ℓ), ℓ^×/2) ⊗ ℓ^×/2 = 0.
      - **locator**: §3.8, (3.8)–(3.9), pp. 31–32
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/47
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/47
      - **kind**: theorem
      - **name**: Lemma 3.9.1: even valuation of central values of compatible systems
      - **statement**: Let {σ_λ : π_1(X) → GSp_{2r}(o_{E,λ})} be a compatible system (traces of Frobenius powers in E, independent of λ ∤ p), with L(X, σ, t) ∈ E(t). If λ ∤ 2p and σ_λ has geometric image Zariski dense in Sp_{2r}, then the valuation at λ of L(X, σ) = L(X, σ, 1), if nonzero, is even.
      - **locator**: §3.9, Lemma 3.9.1, p. 32
      - **status**: missing
      - **note**: The spinor norm of an orthogonal map preserving a unimodular lattice has even valuation (O'Meara 92:5).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/48
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/48
      - **kind**: theorem
      - **name**: Larsen's big-image theorem for compatible systems
      - **statement**: For a compatible system {σ_λ} with Zariski-dense image, for a density-one set of λ the image of σ_λ in PSp_{2r}(E_λ) contains a conjugate of the image of Sp_{2r}(o_λ) (Larsen, Thm. 3.17).
      - **locator**: §3.10, proof of (*), p. 33
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/49
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.0
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/49
      - **kind**: theorem
      - **name**: §3.10 (*): Theorem 3.1 determines L-values of compatible systems
      - **statement**: Let {σ_λ} be a compatible system of GSp_{2r}-valued representations over X/F_q, q ≡ 1 (mod 8), with L(X, σ) ≠ 0, such that (a) the p-cyclotomic extension of E(√2) has degree > 4r² and (b) σ_λ has Zariski-dense image for a density-one set of λ. Then Theorem 3.1 applied to the reductions of σ determines the square class of L(X, σ) in E(√q)^×/2 up to multiplication by 2.
      - **locator**: §3.10, pp. 32–34
      - **status**: missing
      - **note**: Not used elsewhere in the paper.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/50
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.1
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/50
      - **kind**: definition
      - **name**: The defect δ(X, ρ) and Frobenius of k
      - **statement**: δ(X, ρ) := L^*(X, ρ)/c_et(X, ρ) ∈ ℓ^×/2 (similarly for GSp-admissible ρ^{(g)}). For M/Q finite Galois unramified at p, Frob_k ∈ Gal(M/Q) is the conjugacy class of Frob(ϖ/p)^n for q = p^n.
      - **locator**: §4.1, (4.2), p. 34; §4.1.1, p. 35
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/51
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.1
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/51
      - **kind**: theorem
      - **name**: Step A: the defect is a Dirichlet character
      - **statement**: For fixed r and ℓ there is a quadratic character χ_{r,ℓ} : Gal(Q̄/Q) → {±1}, unramified outside the primes dividing #Sp_{2r}(ℓ), such that δ(X, ρ) = χ_{r,ℓ}(Frob_k) (under {±1} ≅ ℓ^×/2) for every GSp-admissible (X, ρ) over k.
      - **locator**: §4.2, (4.4), p. 35; §5.6, p. 47
      - **status**: missing
      - **note**: The proof uses Lemma 5.1.1, which fails for r = 1, #ℓ = 9 (sourceIssues E4).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/52
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.1
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/52
      - **kind**: theorem
      - **name**: Step B: χ_{r,ℓ} is unramified outside 2ℓ
      - **statement**: For #ℓ ≡ ±1 (mod 8), the character χ_{r,ℓ} of Step A is unramified outside 2ℓ: for each odd prime m ≠ ℓ there is a Galois extension M* of Q unramified at m such that for every sufficiently large prime p split in M* there is a GSp-admissible (X, ρ) over F_{p^j}, j odd, with δ(X, ρ) = 1.
      - **locator**: §4.2, p. 35; §4.4, (4.5)–(4.6), p. 36; §6, pp. 47–61
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/53
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/53
      - **kind**: theorem
      - **name**: Steps A and B imply Theorem 3.1
      - **statement**: If χ_{r,ℓ} is unramified outside 2ℓ then χ_{r,ℓ}(Frob_p) = (Z/p) with Z ∈ ⟨−1, 2, ℓ_0⟩; writing Z = Z_0 or Z_0ℓ_0′ (ℓ_0′ = (−1)^{(ℓ_0−1)/2}ℓ_0) and using (ℓ_0′/p)^n = (q/ℓ_0) = 1 for admissible (X, ρ), δ(X, ρ) = (Z_0/p)^n, a character mod 8 of q = p^n, which is 1 when q ≡ 1 (mod 8).
      - **locator**: §4.1, (4.1), p. 34; §4.2, p. 35
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/54
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/54
      - **kind**: construction
      - **name**: Hurwitz stacks 𝔐^G_g and 𝔐^{G*}_g
      - **statement**: For G = Sp_{2r}(ℓ), N = #G: the Deligne–Mumford stack 𝔐^G_g over Z[1/N] of smooth projective genus-g curves Σ/S with a finite étale G-torsor f : Σ̃ → Σ whose geometric fibres Σ̃_s are irreducible; and its twisted form 𝔐^{G*}_g for G̃ = GSp_{2r}(ℓ) with an identification of the associated ℓ^×-cover with the cyclotomic one (fibres with #ℓ − 1 components). Over C a component is 𝒯/Γ̃_0 for Teichmüller space 𝒯 and the central extension Γ̃_0 of the stabilizer Γ_0 of a surjection π_1(Σ) → G by Z(G); 𝔐^G_g is a gerbe over Deligne–Mumford's stack of Teichmüller level structures. Admissible pairs give k-points of 𝔐^G_g, GSp-admissible pairs k-points of 𝔐^{G*}_g.
      - **locator**: §5.1, Examples 5.1–5.2, pp. 39–41
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/55
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/55
      - **kind**: theorem
      - **name**: Livingston–Dunfield–Thurston: mapping class group orbits on surjections
      - **statement**: For a finite group G with H_2(G, Z) = 0 and g sufficiently large, the mapping class group of a closed genus-g surface Σ acts transitively on the set of conjugacy classes of surjections π_1(Σ) → G (Dunfield–Thurston, Thm. 6.25, after Livingston). In general the orbits are classified by the image of [Σ] in H_2(G, Z).
      - **locator**: Proof of Lemma 5.1.1, p. 40
      - **status**: missing
      - **note**: The paper notes that Dunfield–Thurston's Theorem 6.25 is slightly misstated (the action is by the mapping class group modulo the group).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/56
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/56
      - **kind**: theorem
      - **name**: Lemma 5.1.1: irreducibility in large genus
      - **statement**: If H_2(Sp_{2r}(ℓ), Z) = 0, i.e. unless r = 1 and #ℓ = 9, there is g_0(r, ℓ) such that for g ≥ g_0 the Q̄-fibre of 𝔐^G_g is irreducible (and so is that of 𝔐^{G*}_g).
      - **locator**: §5.1, Lemma 5.1.1, p. 40
      - **status**: missing
      - **note**: Stated as corrected; the paper asserts it for all (r, ℓ) (sourceIssues E4).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/57
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/57
      - **kind**: construction
      - **name**: The universal classes 𝔜 and 𝔜′
      - **statement**: On the universal curve π : 𝔘* → 𝔐^{G*} with its G̃-cover 𝔘* → BG̃: 𝔜 ∈ H^1_et(𝔐^{G*}, Z/2) is π_*(pullback of c_et) (trace shifting degree by 2), and 𝔜′ ∈ H^1(𝔐^{G*}, ℓ^×/2) classifies the spinor-norm torsor of the orthogonal local system 𝒪 = R^1π_*𝒮 (𝒮 the symplectic ℓ-local system, with pairing to ℓ(1)). For a GSp-admissible (X, ρ) over k, 𝔜 and 𝔜′ specialize to c_et(X, ρ) and L(X, ρ) in H^1(k, Z/2) = k^×/2.
      - **locator**: §5.2, pp. 40–41
      - **status**: missing
      - **note**: Uses étale cohomology of Artin stacks (Laszlo–Olsson).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/58
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/58
      - **kind**: theorem
      - **name**: Lemma 5.2.1: 𝔜 = 𝔜′ on the geometric generic fibre
      - **statement**: 𝔜 and 𝔜′ coincide on 𝔐^{G*}_{Q̄}.
      - **locator**: §5.2, Lemma 5.2.1, (5.1), pp. 41–42
      - **status**: missing
      - **note**: For a loop γ, 𝔜(γ) = trace_M(ρ^*c_et) on the mapping torus M and 𝔜′(γ) = spinor norm of the monodromy on H^1(fibre, ρ), equal by (1.5); here the coefficients are finite, where the paper proves (1.5) only in characteristic 0 (sourceIssues E25). The stack is handled through a smooth cover (Y × E)/Δ with E an approximation of BΔ (Totaro).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/59
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/59
      - **kind**: theorem
      - **name**: Lemma 5.3.1: 𝔜 − 𝔜′ comes from Z[1/N]
      - **statement**: For g ≥ g_0(r, ℓ), 𝔜 − 𝔜′ is the pullback to 𝔐^{G*} of a class in H^1(Z[1/N], Z/2), i.e. of a quadratic character unramified outside N.
      - **locator**: §5.3, Lemma 5.3.1, pp. 42–43
      - **status**: missing
      - **note**: Uses irreducibility (Lemma 5.1.1), purity (injectivity of H^1(𝔐^{G*}) → H^1(𝔐^{G*}_Q)) and W-points of 𝔐^{G*} for each w ∤ N (Sp_{2r}(ℓ) is 2-generated).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/60
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.2
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/60
      - **kind**: theorem
      - **name**: §5.4 Claim: odd-degree cyclic covers preserve δ
      - **statement**: Let (X, ρ) be GSp-admissible, m odd and prime to ℓ with ℓ of odd order t modulo m, and f : X̃ → X a Z/m-Galois cover by a geometrically irreducible smooth proper curve. Then (X̃, f^*ρ) is GSp-admissible and δ(X, ρ) = δ(X̃, f^*ρ).
      - **locator**: §5.4, pp. 43–45
      - **status**: missing
      - **note**: c_et is preserved since f^* : H^3(X, Z/2) → H^3(X̃, Z/2) is an isomorphism; for L^* the Artin decomposition over the characters of Z/m, the functional equation and §5.4.1 show the extra factors are squares.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/61
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.3
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/61
      - **kind**: theorem
      - **name**: §5.4.1: ε-factors of twists of symplectic systems
      - **statement**: For ρ symplectic and unramified with det ρ = 1 and χ a character, ε(ρ ⊗ χ) = ε(χ)^{dim ρ} (an equality, not only of square classes); in particular ε(ρ ⊗ χ) is a square.
      - **locator**: §5.4.1, (5.4), p. 45
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/62
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.3
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/62
      - **kind**: theorem
      - **name**: §5.5 Claim: raising the genus
      - **statement**: For each GSp-admissible (X, ρ) over k there is g_0′(X, ρ) such that for every g ≥ g_0′ there is a GSp-admissible (X′, ρ′) of genus g over k with δ(X′, ρ′) = δ(X, ρ).
      - **locator**: §5.5, pp. 45–47
      - **status**: missing
      - **note**: X′ is a ramified Z/M-cover, M a product of primes m ≡ 3 (mod 4) with q and ℓ of odd order mod m and gcd of the (m−1)/2 equal to 1, built by class field theory and Riemann–Hurwitz.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/63
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.3
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/63
      - **kind**: theorem
      - **name**: §6.1 Claim: totally real fields with prescribed unit reduction
      - **statement**: For a finite field ℓ with #ℓ ≡ ±1 (mod 8) and an odd prime m ≠ char ℓ, there is a totally real field F with (i) [F:Q] ≥ 3, (ii) D_F prime to m, (iii) a prime λ_0 with o_F/λ_0 ≅ ℓ such that U_F^+ (totally positive classes in H^1(o_F[1/2], Z/2) ⊂ F^×/2) maps trivially to ℓ^×/2, and (iv) a Galois extension M ⊃ F of Q unramified at m such that for every p unramified, prime to 2ℓ and completely split in M, U_F^{(p+)} also maps trivially to ℓ^×/2.
      - **locator**: §6.1, pp. 48–50
      - **status**: missing
      - **note**: F = Q[x]/f for f = x^n + Σa_i x^{n−i} ± ℓ with real roots, roots ≡ 1 (mod 8) in Q_2, a prescribed ℓ_0-adic factorization, discriminant prime to m and irreducible; λ_0 = (α) with α a square at the places above 2.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/64
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.3
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/64
      - **kind**: theorem
      - **name**: Compatible systems on the Hilbert–Siegel variety
      - **statement**: For each place λ of F with residue characteristic prime to Δ, 𝒮[1/λ] carries the étale local system ρ_λ of o_{F,λ}-modules from the Tate module of the universal abelian scheme, pure of weight −1, coming over C from a local system of o_F-modules; at an F_q-point (q prime to Δ) the trace of Frobenius on ρ_λ lies in F and is independent of λ (Shimura, 11.10). The geometric image of ρ_λ is Sp_{2r}(o_{F,λ}) for λ ∤ e, and Zariski dense for λ | e.
      - **locator**: §6.2 (b)–(c), p. 51; §6.4, p. 54
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/65
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.3
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/65
      - **kind**: theorem
      - **name**: Vanishing of H^1 of the Hilbert–Siegel variety
      - **statement**: H^1(S_C, ρ_λ) = 0; equivalently H^1(Γ, F^{2r} ⊗_ι C) = 0 for an arithmetic Γ ≤ Sp_{2r}(F) and each embedding ι : F → C.
      - **locator**: §6.2 (e), (6.5), p. 51
      - **status**: missing
      - **note**: The paper sketches this from superrigidity or the congruence subgroup property ([F:Q] ≥ 3 gives real rank ≥ 3).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/66
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/66
      - **kind**: theorem
      - **name**: Lemma 6.3.1: α_C = 0
      - **statement**: Let α ∈ H^3_et(𝒮, ℓ^×/2) be the pullback of c_et along the reduction of ρ_{λ_0} (a GSp_{2r}(ℓ)-local system). Its restriction to S_C is trivial.
      - **locator**: §6.3, (6.6), Lemma 6.3.1, p. 52
      - **status**: missing
      - **note**: Over C the local system lifts to Sp_{2r}(o_F); c_et then factors through U_F, landing in U_F^+ by the vanishing of c_31 on Sp_{2r}(R), and U_F^+ → ℓ^×/2 is trivial by §6.1 (iii).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/67
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/67
      - **kind**: theorem
      - **name**: Lemma 6.3.2: killing α on special fibres
      - **statement**: There is a finite Galois extension M/Q, unramified outside 2Δ (so at m), such that Frob_k trivial in Gal(M/Q) implies α_k = 0.
      - **locator**: §6.3, Lemma 6.3.2, (6.7), pp. 52–53
      - **status**: missing
      - **note**: Rπ_*(Z/2) on Z[1/Δ] has lcc cohomology sheaves (via the normal crossings compactification, SGA 4½ 'Théorèmes de finitude', appendix); M is the maximal exponent-2 abelian extension, unramified outside 2Δ, of the splitting field of H^2(S_Q̄, Z/2).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/68
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/68
      - **kind**: theorem
      - **name**: Slicing down to a surface
      - **statement**: For a geometrically irreducible component S° ⊂ P^m_{M_0} (M_0 = Q(ζ_e)) of dimension ≥ 3 whose boundary in its closure has codimension ≥ 3, a general M_0-rational hyperplane section is smooth, geometrically irreducible, has boundary codimension ≥ 3, and induces an isomorphism on π_1 of the complex points (Goresky–MacPherson, Stratified Morse Theory II.1.1), hence on H^1(−, ρ_λ). Iterating, one reaches a smooth projective surface with the same properties (a)–(d) of §6.4, which spread out over o_{M_0}[1/S] and specialize to F_p for large p split in M_0 (geometric monodromy preserved by SGA 1 X; H^1 = 0 by proper smooth base change).
      - **locator**: §6.4, pp. 54–56
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/69
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/69
      - **kind**: theorem
      - **name**: Guralnick–Tiep: the eighth-moment criterion for SO
      - **statement**: For a reductive algebraic subgroup Γ ⊂ O(W), W orthogonal over a field of characteristic zero (of large enough dimension), dim(W^{⊗8})^Γ = dim(W^{⊗8})^{SO(W)} = C_4 = 8!/(4!·2^4) implies Γ ⊃ SO(W) (Guralnick–Tiep, Thm. 1.4).
      - **locator**: §6.4, (6.14), p. 56
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/70
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/70
      - **kind**: theorem
      - **name**: Lemma 6.4.2: points impose independent conditions on hypersurfaces
      - **statement**: For pairwise distinct x_1, …, x_r in S°(F_q) and D ≥ r − 1, vanishing at all x_i is a codimension-r condition on Γ(S°_{F_q}, 𝒪(D)) (Poonen, Lemma 2.1), so the fraction of degree-D slices through them is (q^{E−r} − 1)/(q^E − 1) = q^{−r}(1 + O(q^{r−E})), E = dim Γ(S°, 𝒪(D)).
      - **locator**: §6.4, Lemma 6.4.2, p. 58
      - **status**: missing
      - **note**: Stated as corrected: the paper's choice of D does not guarantee D ≥ r − 1 (sourceIssues E8).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/71
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/71
      - **kind**: theorem
      - **name**: Lemma 6.4.1: slices with nonvanishing central value
      - **statement**: There are D_0 and p_0(D) such that for D ≥ D_0 and p ≥ p_0(D) split in M_0, the orthogonal local system 𝖶 (fibre H^1(X_h, ρ_λ)(−1)) on the space ℋ_D of smooth degree-D slices of the surface S°_{F_p} has geometric monodromy Zariski dense in SO; and there are an odd j and h ∈ ℋ_D(F_{p^j}) with slice X = X_h a smooth proper geometrically irreducible curve such that (i) L(X, ρ_λ, 1) ≠ 0, (ii) the geometric monodromy of (X, ρ_λ) equals that of (S°, ρ_λ), (iii) j is odd.
      - **locator**: §6.4, Lemma 6.4.1, pp. 56–60
      - **status**: missing
      - **note**: Method of moments: the eighth moment of the Frobenius traces on H^1(X_h, ρ_λ) over ℋ_D is bounded by C_4 q^4(1 + o(1)) using Lemma 6.4.2, Deligne's bound (6.15) and a Möbius inversion over set partitions; then Guralnick–Tiep and Chebotarev. (ii) is Grothendieck's Lefschetz theorem (SGA 2 XII Cor. 3.5).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/72
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/72
      - **kind**: theorem
      - **name**: Lemma 6.5.1: c_et of the slices
      - **statement**: There is a Galois extension M_1/Q, unramified at m, such that for the slices (X, ρ) of Lemma 6.4.1 (ρ the reduction of ρ_{λ_0}), c_et(X, ρ) is trivial whenever p is split in M_1.
      - **locator**: §6.5, Lemma 6.5.1, (6.27), p. 60
      - **status**: missing
      - **note**: The printed statement says 'unramified outside m' (sourceIssues E11).
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/73
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.4
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/73
      - **kind**: theorem
      - **name**: Lemma 6.5.2: L-value of the slices
      - **statement**: There is a Galois extension M_2/Q, unramified at m, such that L(X, ρ) is trivial whenever p is split in M_2 and sufficiently large: L(X, ρ_·, 1) ∈ F^× is totally positive (Riemann hypothesis) with even valuation at every λ ∤ 2p (Lemma 3.9.1), so its class lies in U_F^{(p+)}, which maps trivially to ℓ^×/2 by §6.1 (iv).
      - **locator**: §6.5, Lemma 6.5.2, (6.28)–(6.29), pp. 60–61
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/91
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.5
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/91
      - **kind**: theorem
      - **name**: c_et on the quaternion group
      - **statement**: The pullback of the étale Chern class from H^3(SL_2(Q(i)), Q(i)^×/2) to Q_8 (Pauli matrices) is the unique nonzero class of H^3(Q_8, Z/2), valued in the subgroup generated by i: for q ≡ 5 (mod 8), Q_8 is a 2-Sylow subgroup of SL_2(F_q) and H_3(Q_8) → H_3(SL_2(F_q)) is onto, while i is a nonsquare in F_q.
      - **locator**: Appendix D.1, pp. 90–91
      - **status**: missing
      - **note**:
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/92
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.5
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/92
      - **kind**: construction
      - **name**: Both sides of Theorem 3.1 for quaternionic covers of curves
      - **statement**: A Q_8-cover of a curve X/F_q is a quadratic étale X̃/X with involution σ and α : Pic(X̃) → Z/4 with σ^*α = −α and α|_{Pic X} the character of X̃/X (D.1). Then ∫_X of the generator of H^3(Q_8) equals y(ℒ_x), y ∈ H^1(X, Z/2) evaluated by class field theory on the 2-torsion bundle of x (Lemma D.4.1: ∫x² ∪ y = ∫β′(x) ∪ y, (D.2)); and L(X, ρ, 1/√q) = L(X̃, α, 1/√q) = Σ_k q^{−k/2}L_k with L_k = Σ_{deg D=k} α(D), symmetric under k ↔ 2g − 2 − k with sign α(𝒦). For genus-2 X : y² = xQ(x) with X̃ : w² = Q(t²) this gives qL(½, ρ) = 2q + Σ_{deg D=2} α(D) (D.6), and the invariant (D.5) vanishes iff (0) − (∞) ∈ π_*(ker α²).
      - **locator**: Appendix D.2–D.6, (D.1)–(D.6), pp. 91–95
      - **status**: missing
      - **note**: Several slips in D.2–D.6 are recorded as sourceIssues E22–E24.
  -
    - **item**: PAPER-ABDURRAHMAN-VENKATESH-25/93
    - **proposedStage**: SymplecticLFunctionsModSquares:SL.5
    - **contract**:
      - **id**: PAPER-ABDURRAHMAN-VENKATESH-25/93
      - **kind**: theorem
      - **name**: Numerical examples beyond the hypotheses of Theorem 3.1
      - **statement**: Each of the hyperelliptic curves 2x⁸ + 2x⁶z² − 4x⁴z⁴ − 3x²z⁶ − 3z⁸ + y² = 0 over F_5, x⁸ + 4x⁶z² + 2x⁴z⁴ + 3x²z⁶ + 5z⁸ + y² = 0 over F_11, 5x⁸ + 2x⁶z² − 6x⁴z⁴ − 7x²z⁶ + 7z⁸ + y² = 0 over F_13 and 5x⁸ + 15x⁶z² + 15x⁴z⁴ + 2x²z⁶ + 12z⁸ + y² = 0 over F_17 carries a quaternionic local system with nonsquare qL(½) and nonvanishing invariant (D.5); in all computed examples 'qL(½) is a square' coincided with vanishing of (D.5).
      - **locator**: Appendix D.7, p. 95
      - **status**: missing
      - **note**: Recomputed independently (class groups and all 8 admissible α per curve): every nonzero qL(½) is ~ i and the pairing is nonzero; on the F_5 curve 4 of the 8 α have L(½) = 0, a case the paper does not discuss.
- **imports**:
  - SymplecticReidemeisterTorsionModSquares: Theorem 2.1 and finite-coefficient extension of (1.5)/circle formula
  - StableReductionPartII:key/moduli-curves (reserved canonical moduli definition)
  - FunctionFieldArithmetic:FA.3–FA.5
  - DeligneWeightsAndPurity:DWP.3/DWP.7–DWP.8
  - WeilConjectures:WC.2
  - EtaleDualityAndPerverseSheaves:EDC.2/EDC.4/EDC.8
  - LefschetzPencilsAndVanishingCycles:LPV.3
  - InverseGaloisAndArithmeticFundamentalGroups:IG.1/IG.5
  - AlgebraicModuliForArithmeticGeometry:R09.4
  - PELModuli:M1–M2
  - ShimuraVarieties:V2
  - ShimuraCompactifications:C5
  - ArithmeticLocallySymmetricSpaces:ALS.1
  - MotivicEtaleKTheory:M.8
- **requiredCorrections**:
  - AV E4: exclude r=1,#ℓ=9 from the v1-supported main theorem until Step A is repaired component by component; H₂(SL₂(F₉),Z)=Z/3 prevents the asserted geometric irreducibility.
  - AV E25: require route A’s circle/mapping-torus formula over finite fields of odd characteristic; characteristic-zero Jacobson–Morozov is not enough.
  - Keep all AV E1–E25 with the future route, including Poonen D≥r−1, the unramified-at-m wording and the zero-central-value quaternion cases; do not upgrade the version-of-record without reading it.
- **finalContract**: For a smooth projective geometrically irreducible curve X/F_q and geometrically surjective ρ:π₁(X)→Sp_{2r}(ℓ), ℓ finite of characteristic different from 2 and char F_q, require q coprime to #Sp_{2r}(ℓ), q a square in the prime field of ℓ, #ℓ≡±1 mod 8 and q≡1 mod 8. Outside (r,#ℓ)=(1,9) the v1 proof target is L*=trace_X(ρ*c_et) in ℓ×/(ℓ×)². When the central value is zero use the normalized-Frobenius spinor norm, not a nonexistent square class of zero. Preserve the source-scoped characteristic-zero §3.10 statement and its degree >4r²/density-one hypotheses.

### parent proposal 2

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `restructure[1]`.

- **action**: rescope
- **roadmaps**:
  - SchemeAndStackFoundations
  - FunctionFieldArithmeticPartII
- **detail**: The earlier local reservation for all roots predates the merged generic SchemeAndStackFoundations finite-root contract. Current upstream ownership governs this assembly.
- **proposal**: Import generic stackification/two-fibre products from SchemeAndStackFoundations §1.18 and the line-section classifier, site-independent quotients and finite root stacks (including transitions, affine charts and nonreduced zero fibres) from §1.21. Its §3.4 supplies the native Picard core; AlgebraicVectorBundles supplies coherent native tensor/section/pullback. Preserve the local finite-root ids only as native specialization/comparison anchors. FunctionFieldArithmeticPartII RS.2 owns the coherent infinite diagram, fpqc quotient and DVR/Kummer application; GC.0–GC.6 own the root-Picard application. RS.1 retains relative/stack-base/wild geometry and the precise nonreduced diagonalizable coarse request. Point YZ19/160 and Bresciani/36–37 at those contracts according to their finite or infinite scope. Do not replan a generic finite root or use DiamondsAndVStacks D0, the Perf/v instance, as the generic scheme-site owner.
- **assemblyDisposition**: Supersedes the old all-roots-local ownership proposal; this is an ownership correction for independent assembly review, not a change to any review verdict or a performed atlas restructure.

### parent proposal 3

Packet: [FunctionFieldArithmeticPartII.json](../packets/FunctionFieldArithmeticPartII.json), `restructure[2]`.

- **action**: rescope
- **roadmaps**:
  - EtaleDualityAndPerverseSheaves
  - FunctionFieldArithmeticPartII
- **detail**: The generic scheme EDC roadmap cannot supply the DM-stack operations required for root symmetric powers and Picard stacks.
- **proposal**: Coordinate with the already proposed EtaleDualityAndPerverseSheavesPartIIStacks owner in the repaired YZ17/YZ19 routes. Place ST-LISSE/ST-OPS there, with finite-type tame-DM and coefficient hypotheses. Preserve its existing Artin-stack limits, boundedness conditions and groupoid weighting; the local root-Picard application and character construction remain here. Its unregistered provisional ST keys are not valid existing dependencies.
- **assemblyDisposition**: Consolidate the exact GC3-STACK-PI1 and GC4-LISSE-ADAPTER facets as ASM-STACK-LISSE. Retain GC3-STACK-PUSHFORWARD and GC3-COARSE-STALKS separately. GC.3 cohomology uses its rational coarse/scheme route; GC.4 uses its proper-quotient/chart-gluing route. No general decomposition theorem or nonproper descent theorem is commissioned.

### RS.1 proposal 1

Packet: [FunctionFieldArithmeticPartII--RS.1.json](../packets/FunctionFieldArithmeticPartII--RS.1.json), `restructure[0]`.

- **action**: narrow
- **stages**:
  - FunctionFieldArithmeticPartII:RS.1
- **keeps**: Native comparisons with the accepted root objects, effective descent restriction, relative fibre/coarse application, the wild smooth-presentation regularity proof and exact DM locus.
- **suppliedBy**:
  - SchemeAndStackFoundations:SF.1
  - SchemeAndStackFoundations:SF.3
  - SchemeAndStackFoundations:SF.4
- **reason**: Current upstream §1.21 already owns finite root stacks, quotient charts, universal data, base change, n=1, complement and invertible-index DM. Generic QCoh descent, 2-pullbacks, quotients and coarse/tame geometry are likewise current upstream. Retain the reserved canonical root id only as a compatibility anchor, not a competing definition.
- **owner**: FunctionFieldArithmeticPartII:key/root-stacks

### RS.1 proposal 2

Packet: [FunctionFieldArithmeticPartII--RS.1.json](../packets/FunctionFieldArithmeticPartII--RS.1.json), `restructure[1]`.

- **action**: extend
- **title**: Scheme and stack foundations, Part II: finite diagonalizable coarse quotients
- **extends**: tauceti:TauCetiRoadmap/SchemeAndStackFoundations
- **targets**:
  - RS1-DIAGONALIZABLE-COARSE
- **reason**: Only the missing finite nonreduced diagonalizable affine coarse universal property is proposed; no existing upstream roadmap is edited.

### RS.2 proposal 1

Packet: [FunctionFieldArithmeticPartII--RS.2.json](../packets/FunctionFieldArithmeticPartII--RS.2.json), `restructure[0]`.

- **action**: rescope
- **roadmaps**:
  - FunctionFieldArithmeticPartII
  - SchemeAndStackFoundations
- **detail**: SchemeAndStackFoundations, merged into TauCetiRoadmap on 14 October 2026, now owns finite root stacks: its §1.21 defines rootStack n (L,s) as X ×_[A¹/G_m] [A¹/G_m] along the nth power, with base change, the case n = 1, the isomorphism away from s = 0, the affine chart Spec A[t]/(t^n − s) modulo μ_n, transitions, the DVR chart and the nonreduced zero fibre. Its §3.4 supplies the Picard groupoid Core(InvertibleSheaf X) with its symmetric monoidal structure and pullback, and §§1.18 and 1.21 own generic 2-fibre products and quotient stacks on any site. FunctionFieldArithmeticPartII RS.0–RS.1, and the parent RS.2 transition node, plan these finite objects natively, and the reserved key definition FunctionFieldArithmeticPartII:key/root-stacks names them.
- **proposal**: Rescope FunctionFieldArithmeticPartII so that RS.1 imports SchemeAndStackFoundations §1.21 for finite root stacks and keeps one comparison theorem (the native root triples (M,t,φ) of RS.0 form a groupoid equivalent to rootStack n (L,s), compatibly with transitions and base change, through lineBundleSectionStack), together with what §1.21 does not state: stack bases, relative coarse spaces and the invariant-ring calculation in arbitrary characteristic. RS.2 keeps the infinite root stack, its coherent pseudodiagram, the fpqc quotient, the DVR gerbe and the Kummer comparisons, and cites §1.21 for the finite stages, as this packet now does. The key definition algebraicgeometry/root-stacks then has its finite case in SchemeAndStackFoundations; FunctionFieldArithmeticPartII keeps the infinite case.
- **addedBy**: REV-FunctionFieldArithmeticPartII--RS.2

### GC.3 proposal 1

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `restructure[0]`.

- **action**: rescope
- **roadmaps**:
  - FunctionFieldArithmeticPartII
- **detail**: Assembly edits for GC.3, so that the accepted parent nodes rest on the follow-up's nodes rather than on the parent gaps ST-LISSE, ST-OPS and EXTERIOR-COMP. No parent statement changes; only prerequisites and gaps.
- **proposal**: Add prerequisites: GC.3/tame-local-systems ← GC.3/root-curve-character-dictionary; GC.3/collision-kernel ← GC.3/tensor-character-kernel; GC.3/collision-descent ← GC.3/monodromy-symmetric-local-system, GC.3/pushforward-description-comparison; GC.3/cohomology-vanishing ← GC.3/rational-coarse-comparison, GC.3/twisted-curve-cohomology; GC.3/koszul-exterior ← GC.3/alternating-invariants-exterior; GC.3/exterior-cohomology ← GC.3/rational-coarse-comparison, GC.3/symmetric-power-cohomology, GC.3/twisted-curve-cohomology, GC.3/alternating-invariants-exterior. Retire EXTERIOR-COMP; in ST-LISSE and ST-OPS remove the GC.3 consumers listed above and point them to GC3-STACK-PI1, GC3-COARSE-STALKS and GC3-STACK-PUSHFORWARD; replace the requests PI1, TAME-INERTIA and DUALITY-SCHEME, for GC.3, by the accepted node ids cited here. Consumers in GC.4–GC.6 that need L_d only as a lisse sheaf (GC.4/fibre-triviality, GC.4/empty-ramification-descent, GC.5/divisor-tensor-line, GC.5/unit-trivialization) may cite GC.3/monodromy-symmetric-local-system and avoid stack pushforward. These edits create no cycle: none of the new nodes depends on a parent GC.3 node except GC.3/pushforward-description-comparison, which depends only on GC.3/symmetric-local-system.

### GC.3 proposal 2

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `restructure[1]`.

- **action**: rescope
- **roadmaps**:
  - EtaleDualityAndPerverseSheaves
  - FunctionFieldArithmeticPartII
- **detail**: Consumer needs of GC.3 for the proposed stacks Part II of EtaleDualityAndPerverseSheaves (route EtaleDualityAndPerverseSheavesPartIIStacks, RT-AREA-etale/3, layers ST.0–ST.6, to be designed under DESIGN-EtaleDualityAndPerverseSheavesPartII). That fix moves the Yun–Zhang stack items there; this packet records which statements GC.3 actually needs, so the design can give them exact hypotheses.
- **proposal**: For GC.3 the stacks Part II should state, for tame Deligne–Mumford stacks of finite type over a field and Q̄ℓ coefficients: (a) in ST.0/ST.2, the étale fundamental group of a connected normal Deligne–Mumford stack (Noohi §4) and the equivalence of lisse Q̄ℓ-sheaves with its continuous representations, with atlas descent (GC3-STACK-PI1); (b) in ST.0–ST.2, the coarse pushforward Rω_* with stalks H^i(G_ȳ,F_ỹ) and the Leray comparison (GC3-COARSE-STALKS); (c) in ST.1, proper base change for proper quasi-finite non-representable morphisms (GC3-STACK-PUSHFORWARD). Intermediate extension, perverse sheaves and a decomposition theorem on stacks are not needed by GC.3. The same coarse comparison is requested by DeligneWeightsAndPurity (DWP.7/purity-of-smooth-proper-dm-stacks, from SF.1) and WeilConjectures WC.6, so one owner serves all three. Include nilpotent invariance in the coarse and proper-pushforward inputs; the classifying-gerbe descriptions refer to reduced fibres.

### GC.3 proposal 3

Packet: [FunctionFieldArithmeticPartII--GC.3.json](../packets/FunctionFieldArithmeticPartII--GC.3.json), `restructure[2]`.

- **action**: rescope
- **roadmaps**:
  - FunctionFieldArithmeticPartII
- **detail**: The generic maps α_d and π_d, their factorial/norm composites and naturality already exist in current Tau Ceti and Mathlib (currentLibraryImports). GC.3/antisymmetrization is narrowed to compatibility with the Koszul-signed action, not their reconstruction. The signed-action comparison, general categorical averaging and invertible-order vanishing are the additional targets; ordinary corestriction and finite-group cohomology annihilation are existing inputs.
- **proposal**: Reuse the current-library maps and API. Keep only the additional signed-action compatibility/comparison and averaging/vanishing targets in GC.3 under a generic linear-algebra home; if a generic owner is designated, import those targets from it. Do not plan new RamifiedClassField versions of the existing tensor/exterior maps.

### GC.4 proposal 1

Packet: [FunctionFieldArithmeticPartII--GC.4.json](../packets/FunctionFieldArithmeticPartII--GC.4.json), `restructure[0]`.

- **action**: rescope
- **roadmaps**:
  - FunctionFieldArithmeticPartII
  - EtaleDualityAndPerverseSheaves
- **detail**: The parent ST-LISSE gap spans generic stack sheaves and a root-specific nonproper descent claim. The latter has an explicit proper-quotient proof here; generic stack sheaves are outside the existing scheme EDC stages.
- **proposal**: Keep all root-specific evaluation charts, positive-weight quotients and Abel–Jacobi descent in GC.4. In the parent proposed EtaleDualityAndPerverseSheaves, Part II: Stacks extension, own the generic stack-lisse/finite-cover comparison, smooth descent and degree-zero proper-base-change adapter of GC4-LISSE-ADAPTER. This is a proposed extension, not a registered stage dependency. GC.5 should import the reviewed effective GC.4 result and replace its inherited nonproper-fibration requirement by this exact adapter.

## Next action

Run the independent assembly review over the fourteen deliverables, concentrating on the eight review-sensitive reconciliations above and the exact supplier hypotheses. There is no unfinished assembly checkpoint. Geometric implementation and the collected supplier/restructuring work remain future roadmap work. The scratch directory is disposable and is not needed by the next worker; all durable decisions, counts, hashes, source locations and requests are recorded here or in the packets.
