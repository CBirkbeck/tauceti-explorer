# Independent package review: complex multiplication and explicit reciprocity

Job `REV-PKG-ComplexMultiplicationAndExplicitReciprocity`, issue #7509. Reviewer: Codex, session `codex-hk5P0S`, 9 October 2026. The package was assembled by `codex-eI8gR5`; this reviewer contributed to neither that assembly nor its accepted input.

**Verdict: accepted after source-locator corrections.** All six package criteria hold within the signature-prototyping convention of PROTOCOL §13. Acceptance preserves the accepted plan's five explicit source/supplier boundaries; it establishes neither their closure nor a mathematical implementation.

The entire README and Suggested.lean were read and compared with the accepted packet, its review, the package handoff, the CM library audit and the cited baseline statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Multiquadratic and HodgeStructures were read in full as upstream form and density references. The source checks used the public editions identified in the package bibliography; all 20 retrieved PDF hashes match the accepted packet. No restricted book was needed.

## Criteria and inventory

| Criterion | Finding |
| --- | --- |
| Upstream form | Introduction, notation/conventions, boundaries, ordered layers, grouped constructions, exact targets, prerequisites, API, test specifications and bibliography follow UPSTREAM_GUIDE. The corrected README is 133,855 bytes, below 200 KB. |
| Fidelity | All 69 nodes, 75 API statements, 61 named tests and 37 supplier contracts are present. No unsupported target was added. All prerequisites retain their owner and mathematical contract. |
| Own words and locators | The organization follows the mathematics, rather than the order of a source. The statements and proof sketches are paraphrases; no source passage or section-by-section source summary is included. Target citations give numbered results or sections and printed pages. Corrections are listed below. |
| No process in README | No packet names, job identifiers, reviews, checkpoints, agent names or coverage statuses occur. Mathematical source limitations and contracts remain explicit. |
| Suggested.lean | Every node and API has its proposed fully qualified declaration; all 61 test names label examples. Code, ignoring comments and whitespace, equals the accepted suggested file. Independent `lean-check` finished with exit 0, zero errors and 243 warnings, all `declaration uses sorry`. Compilation scope is stated below. |
| Metadata | Exactly one line, `topic = "math.NT"`, with a final newline; the category fits the subject. |

| Layer | Nodes | API items | Tests | Mathematical content checked |
| --- | ---: | ---: | ---: | --- |
| CM.0 | 9 | 17 | 15 | Types, field-scoped primitivity, trace reflex field, reflex type/order, norm identities, quartic and nonmaximal examples |
| CM.1 | 14 | 12 | 9 | Proper ideal lattices, actual endomorphisms, Picard action, forms, isogeny degrees, Serre tensor and realizations |
| CM.2 | 11 | 12 | 9 | Polarized lattice classification, ideal/idele reciprocity, level stabilizers, relative moduli, dimension-two example |
| CM.3 | 8 | 8 | 6 | Integral class products, Artin action, ring/ray value fields, regularity and joint separation |
| CM.4 | 9 | 8 | 6 | CM characters, conductors, Tate components, all-place Euler factors, induction, Cartan containment and canonical Gross conditions |
| CM.5 | 18 | 18 | 16 | Deuring comparisons, lifting and graphs, analytic bounds, numerical/CRT certificates, full ordinary order verification and algorithm contracts |
| Total | 69 | 75 | 61 | All accepted mathematical targets |

The packet's CM.6 export/example material is distributed among the constructions it exercises; no mathematical target is lost by omitting its process layer. Of the 69 node statements, 67 are literal matches to the accepted prose. The other two preserve the full mathematical assertion: `relative-moduli-orbit` expresses the absolute-moduli adapter as a separate required theorem, and `crt-algorithm-soundness-termination` names the CN.3 procedures without referring to the act of requesting them. Every API and test statement is a literal match. The 16 upstream supplier identifiers are resolved through reference-style links to the same roadmap and layer anchors; the other 21 appear directly. All internal anchor links and all reference-style links resolve within the document.

## Clear corrections applied

Only the README's citations and bibliography changed. Statements, hypotheses, dependency contracts, Lean code and metadata are unchanged.

| Target or bibliography entry | Correct locator and reason |
| --- | --- |
| `CMType.typeNorm_identities` | Milne CM, Example 1.28, printed p.18, rather than p.19. |
| `idealLatticeCurve` and `idealLatticeCurve.endomorphismRing`; MIT16 bibliography | MIT Lecture 16, Theorem 16.4 p.4 and Corollary 16.5 p.5 give uniformization and analytic/algebraic comparison. The proper-ideal dictionary is §16.4, Definition 16.9 and Theorem 16.12, pp.6–7, rather than §16.3. |
| `cmSerreTensor.ideal_kernel_degree`; KS bibliography | Kings–Sprang v4, §1.2, equation (1.2.3) p.9 and Definition 1.9 p.10 locate the Serre-tensor/kernel-degree interface. The bibliography range extends through §1.3, which contains the p.10–11 results already cited. |
| `classPolynomial.integral` | MIT Lecture 20, Lemma 20.9 p.5, Theorem 20.12 and Corollary 20.13 p.6 locate the monic modular-polynomial argument and integrality of the class product and singular values. |
| `cmTateComponents` | Milne CM, Proposition 7.3 p.53 locates rank-one Tate structure; Theorem 9.10 and footnote 25 p.78 locate the reciprocity/elliptic convention. The theorem number is no longer presented as a section number. |
| `cmIsogenyGraphDictionary`; MIT22 bibliography | MIT Lecture 22, §22.1, Theorems 22.3 and 22.5 and Definition 22.4, pp.2–3 locate the order correspondence and the actual horizontal/ascending/descending counts. Remark 22.2 remains pp.1–2. |

## Hypotheses, conventions and ownership

The field/product distinction is retained: a product CM algebra has embedding types, but the unique primitive core and double-reflex comparison are field-scoped. The selected reflex-factor image has a relative discriminant, distinct from the original order's absolute discriminant. Proper invertible ideals and the native ClassGroup/Pic carriers continue to support nonmaximal orders.

The dependency direction is CM.0 → ShimuraVarieties V4/V5 → CM.2. V4 supplies torus norms and V5 supplies the main theorem; CM specializes them. D3 owns the generic cocharacter reflex field; GN11 owns orders; A0/A1 and A4/A5/A6 own tensor, realization, polarized geometry and endomorphism interfaces; CN.3/CN.4 own generic certified computation. The package does not re-plan these suppliers or existing Tau Ceti layers. No CM link map adds a conflicting ownership contract.

Arithmetic Artin normalization, inverse ideal action and the transported polarization parameter are kept consistently. The comparison multiplier and the natural Galois Weil-pairing multiplier are distinct. Milne CM Theorem 9.10 and Remark 9.11(c), p.78, and Theorem 9.17, pp.80–81, support the stated comparisons. Streng Theorems 2.4–2.5 and Definition 2.7, pp.7–8, retain the inverse matrix action, prime-to-modulus and regularity conditions. A family of separating values and its joint stabilizer are required for equality of the generated field. The relative reflex-field orbit is not promoted to an absolute unmarked field-of-moduli equality.

The Tate/Hecke comparisons distinguish covariant Tate arithmetic Frobenius from cohomological geometric Frobenius, retaining finite-inertia and bad-place factors. Hecke values lie in the coefficient field's units, not necessarily its integral units. Cartan-normalizer containment does not assert the full image. Canonical Gross support does not supply local conductor exponents or an existence proof.

CM.5 keeps geometric versus base-field endomorphisms, all-characteristic classification including 2 and 3, lifting of a specified endomorphism, and the distinction between maximal curve orders and level-pair Eichler orders. The analytic enclosure requires a complete proper-class census, proved tails and integrality before integer recovery. Endo v2 §2.4, Corollary 4, pp.5–6 supplies the prime-power separation conditions; exact valuations at 2 and 3 are handled separately. Order certificates use actual independent relation counts. CRT reconstruction requires independently validated ordinary seeds with the full Picard orbit, distinct primes and the strict inequality M > 2B. GRH complexity claims are separate from conditional soundness and termination contracts.

Concrete acceptance examples were compared with their signatures, including the Gaussian and nonmaximal orders, the primitive non-Galois quartic, the Gaussian product surface with rank-four 3-torsion, the degree-two level-3 ray field, the −23 reduction counterexample, forged relation counts, conductor prime powers and the strict CRT boundary. These are admitted specifications, not executed arithmetic tests.

## Compilation and inherited limits

The independent run used `lean-check research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean`, after checking available memory (111 GB). It finished within the wrapper limit: **exit 0; zero errors; 243 `sorry` warnings; no other warnings**. No Lean declarations changed afterward, so a repeat compilation was unnecessary.

Active imports use the exact Mathlib pin. The shared build's Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the reference `f790474821cf4256814db967cb154e7af3d0c369`. The two unavailable Tau Ceti imports are commented, as in the accepted input. Exact reference declarations were read, but the compilation does not validate their native adapters or a file importing them. GAP comments explicitly omit missing supplier conditions, as PROTOCOL §13 allows; the displayed binders alone need not imply those conclusions. The definitive mathematical hypotheses remain in the README. No proof, algorithm execution or Tau Ceti adapter validation is inferred from elaboration.

The five inherited boundaries remain: the absolute/relative moduli adapter; primary canonical Gross existence and conductor refinements; complete Deuring proof decomposition and generic integral quaternion orders; certified j-evaluation and exhaustive finite-field/order-search suppliers; and native geometric/realization/function/conductor adapters. Targeted source reading verifies the packaging and conventions, without claiming a full extraction of every source or closure of these gaps. Source-version cautions are kept within the editions actually identified.

`python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocity.json` reports zero errors and zero warnings. The unchanged packet remains accepted. Package inventory, links, source hashes, size, metadata, process-language exclusion, declaration correspondence and `git diff --check` also passed. The review leaves no package correction or checkpoint outstanding.
