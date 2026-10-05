# BP-BorelRegulators — handoff

Agent: Codex. Session: `codex-QK3Umo`. Issue: [#74](https://github.com/CBirkbeck/tauceti-explorer/issues/74). Branch: `codex-QK3Umo-borel-regulators`. The bot confirmed [this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/74#issuecomment-6002848734). This run takes one job only.

## Result and scope

The target-level pass is **complete** under PROTOCOL §0: every target of R.1–R.7 has a node and a dependency chain ending in a pinned declaration, an exact external node, a requested owner stage, or a named gap. All seven stages are **planned**; none is claimed closed or implemented. This is a completed planning pass for independent review, not a checkpoint of an unfinished pass. Each declaration remains `implementationStatus: unchecked`.

Deliverables:

- [Packet](../packets/BorelRegulators.json): 55 nodes — 4 definitions, 14 constructions, 32 theorems, 3 comparisons and 2 applications; 106 API items; 58 named unit tests; 31 planets; 27 baseline declarations; 22 precise supplier requests; 8 gaps. The checker counts 101 API items and 54 tests on definitions/constructions; the reserved rank theorem adds five API items and four tests.
- [Reader](../readmes/BorelRegulators.md): definitions, conventions, hypotheses, proof routes, dependencies, full APIs and tests for every node, source locators, supplier contracts and extension boundaries.
- [Suggested Lean file](../suggested/BorelRegulators.lean): native target, coordinate/measure, trace, analytic coefficient, lattice and matrix components, plus a complete mathematical signature register for canonical higher interfaces that the pins do not supply.

The reserved nodes are present with full APIs: `BorelRegulators:R.3/borel-rank-theorem` and `BorelRegulators:R.4/borel-regulator`. The latter specifies Burgos's renormalized convention and the arithmetic localization map, with the coordinate-free embedding target constructed first.

| Stage | Nodes | API items | Tests | Planets | Coverage |
| --- | ---: | ---: | ---: | ---: | --- |
| R.1 | 7 | 14 | 9 | 5 | planned |
| R.2 | 4 | 10 | 6 | 1 | planned |
| R.3 | 10 | 5 | 4 | 6 | planned |
| R.4 | 13 | 47 | 24 | 6 | planned |
| R.5 | 6 | 6 | 3 | 4 | planned |
| R.6 | 8 | 17 | 9 | 5 | planned |
| R.7 | 7 | 7 | 3 | 4 | planned |

## Ownership and important proof boundaries

[RS-04](../restructure/RS-04.result.json) was accepted before this job and is binding. Generic arithmetic/adelic infrastructure stays in AA, Borel–Serre quotients and early Betti/de Rham comparison in ALS, and continuous/relative Lie cohomology and van Est in AF.1a. R.6 retains the specialized primitive periods, norm-one volumes and Bloch comparison. No upstream roadmap or another packet is edited.

R.1 constructs division buildings and the integral Steinberg module, then specializes arithmetic duality to prove twisted homology finiteness. N.3 owns the Q rank filtration and final K-finiteness theorem. Its early filtration interface must be independent of final finite generation: the final theorem consumes the R.1 twisted homology input. Quillen's read argument is for maximal orders; a nonmaximal integral extension is a separate N.3 input. R.3's rational ranks work for all orders and do not use integral finite generation.

The arithmetic comparison uses the sufficient strict inequality `4q < n−1`; the compact-dual bound is separate and conservative. The graded stable limit is taken degree by degree. Primitive homology is paired with cohomology indecomposables. The plus model preserves `π₁ = K₁`; it is not replaced by a simply connected carrier.

The exact regulator convention is Burgos Definition 9.24. Its all-weight comparison is Theorem 10.9: `Bo_j = 2 Be_j`, yielding the determinant/covolume factor `2^d_j`. Relative-to-absolute injectivity and the infinitesimal-diagonal/Weil comparison are explicit prerequisites. Weight two is a test, not the proof for other weights. The exact Bloch–Wigner conversion in this Tate coordinate remains a named gap.

R.5 first uses the specialized norm-one volumes and compact cycles in R.6 to prove Borel's primitive-period theorem. It then applies the completed-zeta functional equation and the exact renormalization. The endpoint is rational proportionality, not the integral Lichtenbaum torsion formula. The signed discriminant correction is recorded as `BorelRegulators/E1`; positive Haar measures retain the absolute discriminant.

## Sources actually read

The packet records public URLs, SHA-256 hashes, access date and exact read sections for ten sources. The main source work reads Borel 1974 §§3,7–12, Borel 1977 §§1–6, the complete 1980 erratum, and Burgos §§3.4,4,8–10 at the cited passages. The erratum's mathematical formula list was visually checked against the PDF, not inferred solely from its OCR. Quillen's §1 was read in the collected Seattle scan; both printed page and scan-header locators are recorded.

Supporting passages read: Church–Farb–Putman §1 for buildings/Steinberg/duality conventions; Weibel chapters IV and VI for plus constructions, arithmetic ranks and regulators; Rapoport's introduction and §1 for Chern-character comparison; Goncharov's introduction and §§5.4–5.5, including Theorem 5.7 and its proof, for the weight-two normalization bridge. Read sections are distinguished from the complete contents of each downloaded book or paper.

Weil's IAS catalogue entry was accessible, but its full text and the relevant Springer proof were not obtained. Borel explicitly cites Weil Theorem 3.3.1 for the specialized Tamagawa theorem; no claim is made that its proof was read. Bloch's CRM 11 edition was identified, but the complete first four lectures were not accessible. Their exact pairing convention is not manufactured from a bibliographic reference.

## Remaining work and supplier requests

The eight gaps are specified in the packet with exact consuming nodes:

1. Export the genuine higher K/plus, arithmetic-order, relative Lie, compact-dual and Deligne carriers and maps from their owners before replacing their mathematical signature comments by Lean declarations.
2. Supply integral Steinberg/orientation duality, the connected simple H-space Cartan–Serre and finite-type theorems, the genuine cofinal plus comparison, and the separate nonmaximal-order finiteness input.
3. Construct Cartan-pair compact duals and compatible block functoriality in Lie groups Part II.
4. Supply the special degree-e splitting extension or number-field period=index theorem beyond the global Brauer sequence.
5. Read and decompose Weil's primary proof of the specialized norm-one Tamagawa theorem, with its exact measures and hypotheses.
6. Read Bloch's first four lectures and prove the exact pairing/measure conversion against the verified Borel interface.
7. Export early normalized higher Chern/Bott/Adams and infinitesimal-diagonal/Weil interfaces. Keep M.8's early universal construction independent of the late analytic comparison to avoid a cycle.
8. Determine the exact Bloch–Wigner/Suslin scalar and orientation relative to Burgos's Tate coordinate, including the measurable-to-continuous map and division by `2πi`.

The 22 requests cover AA.1–4, ALS.2 and ALS.5:finite-level-duality, AF.1a, H.3–4, K.2, N.3's two endpoints, M.8, RT.4:topological, four existing topology stages, two Lie groups stages and two class field theory stages. Their `need` fields give the mathematical contracts and their `neededBy` lists are exact. Exact existing nodes are imported for AL.1 continuation/functional equation, S.6 higher Adams operations, P.2 Bloch–Wigner and V.4 Suslin theory.

Five rescoping proposals record extension boundaries: Lie groups compact duals; class field theory degree-controlled Brauer splitting; the AF/M.8/RT early Chern–Weil boundary; ALS integral arithmetic duality; and H connected rational H-spaces. They do not change the current roadmap structure. Additional AA order/reduced-norm interfaces are expressly requested where AA.1 does not already provide them.

## Confirmed red-team findings

The following findings in [RT-AREA-ktheory-1](../redteam/RT-AREA-ktheory-1.result.json) were read and addressed at the planning level:

| Finding | Concrete treatment |
| --- | --- |
| /1 | Building, integral Steinberg coefficient and twisted homology finiteness are R.1 nodes; finite CW does not imply coefficient finiteness; N.3 owns the K endpoint. |
| /5 | Genuine locally acyclic plus, projective cofinality and connected H-space multiplication are requested; no simply connected substitute. |
| /6 | Brauer degree control, specialized Tamagawa theorem, local volumes, strong approximation and compact periods precede zeta proportionality. |
| /7 | Arbitrary commutative orders use Borel's order theorem; S-integers use N.3 localization and finite-field torsion. |
| /33 | Connected Cartan–Serre and the Serre/Lyndon–Hochschild–Serre spectral sequences are explicit, including monodromy and integral descent. |
| /34 | Genuine higher S.6 operations plus higher Chern/Bott compatibility are imported; a K₀-only Adams theorem is insufficient. |
| /35 | Early ALS.5 finite-level comparison is used, with no dependence on downstream AS.5. |
| /36 | Burgos's all-weight comparison and its proof interfaces fix the factor two; Bloch–Wigner remains a separate exact-convention test. |

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`: **0 errors, 0 warnings**. The shared declaration TSV index was absent, so this checker validates baseline reference form; it does not independently resolve their names. All 27 statements were therefore read at the recorded pins, and all 24 Mathlib references additionally resolved in a temporary `lean-check` audit.

`lean-check research/blueprint/suggested/BorelRegulators.lean`: **exit 0**, with only declaration-uses-`sorry` warnings. The shared Mathlib commit exactly equals the pin. The shared Tau Ceti checkout is newer than its pin, so its three cited statements were read with `git show` at the exact Tau Ceti pin. The suggested file imports only pinned Mathlib modules and does not depend on that newer checkout. Elaboration verifies native signature compatibility, not the missing proofs or the commented higher-object signatures.

The final cross-file audit checks every declaration/API/test name, all source hashes and literal excerpts, request-consumer membership, planet counts and deliverable paths. Source PDFs, extracted text, audit logs and generation scripts are scratch-only and are not needed by the next worker. Follow-up work starts from this packet's exact gaps and supplier contracts after independent review.
