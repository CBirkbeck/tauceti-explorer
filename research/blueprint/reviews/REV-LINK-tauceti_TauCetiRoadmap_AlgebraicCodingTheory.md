# Independent review: algebraic coding theory links

**Accepted with one added dependency.** All nine original links and three overlap recommendations are confirmed. ACT-L10 supplies the actual orthogonal lattice sum used in coding Layer 7, separately from the finite-form sum and coordinate-power API. No original link is removed.

Reviewer: Codex — `codex-c83e7a`, job `REV-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory`, issue #105, 2026-09-23. The original worker was ChatGPT Pro — `cgp-f522e092da3e`, PR #796. This reviewer did not write the input. Claim comment 5798038543 was confirmed before work began.

## Evidence and method

Read PROTOCOL §§9–10, the complete packet and handoff, all seven coding layers and their standing conventions, all five IntegralLattices layers, and the full FF.1, FF.4, AC.0 and GN.4 endpoint descriptions. Here Cj and ILj mean coding and IntegralLattices layer j; FF, AC and GN mean FiniteFieldsAndCharacterSums, AdditiveCombinatorics and GeometryOfNumbersAndQuadraticArithmetic. Canonical IDs remain in the packet.

Inputs were acquired at repository commit `7ce45a850ba7cfa28e9ce1340b68bfb34a8ab369`, with all current supplemental roadmap and link packets. Before publication, refreshed the concurrently reviewed GrothendieckEulerForms and SchurWeyl packets at `879a43a59c32230f32e26b93a7af789e7a579aec` and reran graph validation; the atlas and stage texts were unchanged. The world contains 2007 stages and 218 roadmap records; one roadmap, FoundationsAndLibraryIntegration, is retired. The input's 217 `examined` entries exactly cover the active IDs, **including its own roadmap**. The Completed/IntegralLattices path is active.

All **28 original evidence strings** are literal substrings of their named stage descriptions and match the stated source line ranges in the atlas's unnormalized README text. Both new quotes also match literally. Each quote was checked for relevance, not just substring validity.

## Every link

| ID | Decision and exact supply/use |
|---|---|
| ACT-L01: IL1 → C6 | Confirm. Reuse the full rational lattice, symmetric form and isometry carrier. Fullness of the code preimage must be proved; integral bundling requires self-orthogonality. `dot/m` is not the ordinary unscaled dot form. |
| ACT-L02: IL2 → C6 | Confirm. Reuse dual/discriminant and unimodularity criteria on the integral, nondegenerate application. The arbitrary-code literal dual-carrier identity remains an elementary residue-pairing proof, not an instance of an integral-only theorem. |
| ACT-L03: IL3 → C2 | Confirm. The target explicitly imports the finite Q/Z-valued alphabet. Perpendiculars and cardinality/double-perpendicular identities need nondegeneracy. Coordinate powers already exist; an arbitrary Hermitian field pairing is not definitionally this finite bilinear module. |
| ACT-L04: IL2 → C7 | Confirm. The literal dual and subtype quotient supply the carrier for the `m Z^i` discriminant-coordinate comparison. Reduction modulo m, the dual equality and pairing preservation must still be proved. |
| ACT-L05: IL3 → C7 | Confirm. Reuse finite bilinear/quadratic modules, isometries and orthogonal sums in the half-norm Q/Z convention. Neither a group-cardinality match nor an additive equivalence proves the required form-preserving alphabet comparison. |
| ACT-L06: IL4 → C7 | Confirm. Transport the actual additive code subgroup into the discriminant group before applying preimage gluing and `A_(L_H) ≅ H^perp/H`. Bilinear isotropy gives the integral result; the quadratic version requires the even base and vanishing quadratic values. |
| ACT-L07: IL5 → C7 | Confirm. Specialize the stated A_n and D_n forms to A2 and D4, keeping representatives and quadratic values: `a^2/3` for A2 and `1/2` on D4's three nonzero classes. Coding owns the F3/F4 maps and named-code checks. No direct ADE-classification dependency is needed. |
| ACT-L08: C1 → FF.4 | Confirm. FF.4 expressly names AlgebraicCodingTheory and requires encoding and dimension results. The common carrier and generator/check interface are the relevant input; family-specific evaluation/residue/BCH/Reed–Solomon construction stays in FF.4. Existing baseline code/matrix machinery is reused. |
| ACT-L09: C2 → FF.4 | Confirm. Its family distance bounds use the common Hamming/minimum-distance interface. Retain the zero-code convention and nonzero-shortening condition. This does not import the entire Hermitian or exceptional-code development. |
| ACT-L10: IL1 → C7 | **Add**, inferred, marked with this review's `addedBy`. C7 expressly uses an orthogonal lattice sum. IL1 supplies that lattice-side object and its canonical sum isometries; IL3 supplies a different, finite-form object. Finite-family iteration and its discriminant/coordinate-power comparison remain consumer work. No such directed pair was already recorded in the atlas or other link packets. |

The normalization checks support these boundaries. Since every `m e_i` lies in `P_m(C)`, a vector in its dual under `dot/m` has integral coordinates. Pairing against the remaining code lifts then imposes exactly the residue orthogonality condition. Thus the literal arbitrary-code dual identity is a code calculation. For even m, changing an integer lift by `m t` changes the half-norm by an integer; odd m instead leaves a norm-m vector in every nonempty-coordinate preimage. The nonempty hypothesis and separate bilinear/quadratic cases are essential.

## Every overlap and existing request

| ID | Recommendation judged |
|---|---|
| ACT-O01 | Confirm `rescope`. The generic coordinate-power and coordinatewise-isometry construction is already in the pinned library. Keep the finite-form API with IntegralLattices and the named alphabet and discriminant-coordinate maps with coding. No new wrapper or whole-roadmap merge is justified. |
| ACT-O02 | Confirm `keep`. The three stages share finite-character/Fourier primitives; the texts do not make MacWilliams depend on completion of FF.1 or AC.0. Use common normalization and reusable subspace-annihilator lemmas, while retaining the separate MacWilliams, Gauss/Jacobi and energy/convolution responsibilities. |
| ACT-O03 | Confirm `rescope` and `requires_consumer_contract`. GN.4's phrase “lattice codes” does not specify Construction A. Its rational-to-real isometry, norm/covolume and packing use must be named before adding a mandatory C6 → GN.4 dependency. FF.4's finite code families do not supply that geometric constructor. |

ACT-R01–R05 remain justified: reuse checked aliases and coordinate powers; clarify GN.4; factor an early coordinate/index lemma if using the general determinant formula; preserve the primitive-character target and coefficient transport; and keep exact modulus, parity and half-norm conventions. In particular, C6 must not depend on its completed C7 comparison. The new IL1 → C7 edge introduces no such reversal.

## Pinned sources and library coverage

Read all seven current reviewed AUDIT-16 coverage entries, including their partial/not-built distinctions. REV-AUDIT-16 records 203 checked items and 32 corrections. That audit's broader matrix, discriminant and gluing evidence is inherited, not a fresh declaration-by-declaration verification here.

I independently fetched and read the three cited files at the exact pins; all three blob hashes match the input packet:

- [Coding/Basic.lean, Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/InformationTheory/Coding/Basic.lean): the linear/additive aliases are precisely submodules/subgroups of function spaces, without a finiteness requirement on the alias.
- [FiniteBilinearModule/CoordinatePower.lean, same pin](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/FiniteBilinearModule/CoordinatePower.lean): literal Pi carriers, summed pairings and quadratic values, nondegeneracy transfer, perpendicular/isotropy membership and both coordinatewise-isometry constructions work for a finite coordinate type. This does not identify a lattice discriminant with a named code alphabet.
- [LegendreSymbol/AddCharacter.lean, Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean): `PrimitiveAddChar` stores its character in a cyclotomic extension; `FiniteField.primitiveChar` requires different characteristics. Nontrivial-character vanishing requires a domain-valued character on a finite additive group. The shifted-sum result and nontrivial-to-primitive implication do not say the character itself is injective. Identifying a subspace annihilator with the Euclidean dual uses field-linearity.

## Completeness spot-check

All seven own layers were searched across full stage and roadmap text, using code/carrier/matrix/encoding terms; puncturing, shortening and Hamming terms; MacWilliams, Krawtchouk and Fourier terms; Type II and the four named codes; Construction A; and discriminant/isotropic/Lagrangian and orthogonal-sum terms.

| Own layers | Findings and rejected matches |
|---|---|
| C1–2 | FF.4 is the existing consumer. Generic finite linear algebra is baseline material. Additive finite-form powers lead to IL3, already L03; no extra Hermitian supplier was established. |
| C3 | FF.1 and AC.0 are O02. ModularForms' finite Fourier/Gauss-sum bridge concerns modular-form presentations, not the code-subspace or weight-enumerator contract. |
| C4–5 | No named-code consumer requiring an additional stage edge was found. The source expressly excludes Mathieu identification, code/lattice classification and Gleason theory. CFSG presentation targets do not reverse that exclusion. |
| C6 | IL1/2 and the explicit GN.4 ambiguity are covered. The general gluing/index route is a choice recorded by R03, not a reason to add a circular prerequisite on C7. |
| C7 | Found the missing lattice-side orthogonal-sum input ACT-L10. Existing IL2–5 links cover its quotient, finite-form, gluing and ADE-value inputs. A general finite-family discriminant comparison remains unbuilt consumer work according to the reviewed audit. |

AlgebraicCurves' introductory Goppa motivation concerns curve-code families excluded from this roadmap; the specified FF.4 family owner is the relevant intermediary. Knot diagram codes, implementation “code”, Lie-theoretic BCH and number-field discriminants are different objects. The six supplemental roadmap definitions were included in the corpus search; no new coding contract was found there. Negative results describe this search, not a proof of all possible future nonrelationships.

## Validation

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json
10 links; 3 overlaps; 217 examined; 0 errors; 0 warnings

python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_AlgebraicCodingTheory.md
2 files; 0 problems
```

Additional assertions check 30 literal quotes, 28 original line locators, unchanged original link/overlap objects, exact active-catalogue coverage, and uniqueness of the new directed pair against atlas and other packets. The link validator checks the combined graph for cycles. No Lean file was produced or compiled and no whole-library absence claim was independently established. Only the two authorized deliverables change; source roadmap requests remain explicit future work.
