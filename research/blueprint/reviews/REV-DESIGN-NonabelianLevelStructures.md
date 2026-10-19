# Independent review: Nonabelian level structures

Accepted on 19 October 2026 by Codex, session `codex-25MtZA`, for job `REV-DESIGN-NonabelianLevelStructures` (#3581). The designer was a different session, `codex-sBIBVj`. Input: commit `21561713566623c19bb44da7935a6d373b2ff84a`.

This accepts a correct target-level plan with explicit supplier requests and gaps. It does not certify an implementation, discharge the missing source inputs, or close any layer. The packet's `review.checked` records a separate mathematical verdict for every target.

## Counts and coverage

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| NL.0 | 13 | 6 | planned |
| NL.1 | 9 | 4 | planned |
| NL.2 | 5 | 2 | planned |
| NL.3 | 7 | 5 | planned |
| NL.4 | 3 | 3 | planned |
| NL.5 | 11 | 6 | planned |
| NL.6 | 10 | 6 | planned |
| NL.7 | 7 | 6 | planned |
| Total | 65 | 38 | none closed |

There are 52 verified and 13 corrected nodes; no nodes were added or removed. The 16 definitions and 10 constructions have 106 API items and 82 tests. Two API items and two counterexamples were added; one repeated test was replaced. All 22 baseline citations are confirmed, with none removed or replaced. All 24 inherited source findings are confirmed; five findings were added, giving 29 independently reviewed entries. Four gaps and fourteen supplier requests remain. Every implementation status remains unchecked.

Each roadmap target is represented by a node. The target-level granularity is appropriate: normalization equivalence, the cusp automorphism sequence, degree congruence, character quotient and geometric consequences each have a mathematical specification and proof plan. Their routine algebra stays in those plans. The source-to-target routing still disposes of all 66 routed items, including imported item 39; this review adds no duplicate general curve, stack or dynamics construction.

## Corrections applied

The packet, roadmap target descriptions and reader agree on the following changes. Proof plans, hypotheses, API entries, tests and source matches were synchronized where applicable.

1. **NL.0/reduced-ramification.** Reducedness of the base implies reducedness of its finite étale ramification divisor. The converse needs surjectivity. For an unramified trivial-group cover over the dual numbers the divisor is empty and reduced over a nonreduced base. Added this counterexample and the conditional reducedness API. Corrected the locator to **Remark** 2.2.4, p. 324.
2. **NL.0/ramification-monodromy.** A connected étale atlas does not itself preserve connected finite covers. The universal centralizer argument now uses the fixed-subgroup loci and the faithful inertia character, constant on a connected component after adjoining roots. Its monodromy preserves that character and therefore centralizes inertia. This also avoids the erroneous properness assertion in the source's marked-curve proof on p. 353.
3. **NL.0/monodromy-dictionary.** Imported the existing `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy` node for the analytic ordered moduli identification. The missing Nielsen, orientation, stack-comparison and cofinality extensions remain explicit in G-MAPPING. Updated the roadmap's layer input, coverage note and supplier audit.
4. **NL.1/cusp-gluing-data.** Made the restriction over the thrice-punctured line explicitly a right G-torsor. Added the corresponding API and a counterexample: the faithful three-point S3 action gives a finite quotient cover but has nontrivial stabilizers and is not a six-point torsor.
5. **NL.3/degree-obstructions.** Replaced the repeated trivial-character check by a family of character orders 2 and 4. Its common exponent is 4, not the product 8.
6. **NL.3/combinatorial-obstructions.** Removed inherited geometric and nontrivial-inertia hypotheses from a definition for any finite group and element, so its trivial-group and empty-family examples are in scope.
7. **NL.3/combinatorial-congruence.** Allowed c=1, whose modulus is 1, consistently with its proof. Corrected the citation to **Remark** 4.10.6, pp. 386–387.
8. **NL.5/fricke-trace-polynomial.** Corrected **Lemma** 5.2.4, p. 396.
9. **NL.5/outer-trace-action.** Replaced the nonexistent Remark 5.2.7 citation by Proposition 5.2.5, pp. 396–397, and the direct inner/central-inversion invariance calculation. Definition 5.2.7 is not the cited factorization result.
10. **NL.6/trace-orbit-congruence.** Stated the quotient modulus directly. The previous opening appeared to assert divisibility by the stronger component modulus before allowing its factor-two loss. The odd-characteristic torus modulus has the factor 4, while the even-characteristic modulus retains the odd-order cancellation.
11. **NL.7/geometric-markoff-components.** Specified that transitivity uses Vieta moves and coordinate permutations without adjoining even sign changes. The orientation-coset fixed-point argument needs that precise group.
12. **NL.7/bounded-field-finiteness.** Corrected **Theorem** 5.6.4, p. 419. Retained the correct conclusion on j-invariants/geometric classes, rather than K-isomorphism classes.
13. **NL.7/alternating-monodromy.** Added the missing group-theoretic transition: the orientation image is normal of index at most two, and its intersection with the large alternating group is the whole alternating group. Branch parity then distinguishes the alternating and symmetric images.

The suggested Lean file required no change: its selected signatures already express these corrected mathematical specializations and use Lemma 5.2.4 correctly. It has 198 lines, five light definitions with real bodies and nine examples; missing geometric carriers remain reader targets.

## Sources and independent errata check

Read the target statements, hypotheses and relevant proofs at every node's locator in William Y. Chen, *Nonabelian level structures, Nielsen equivalence, and Markoff triples*, Annals 199 (2024), 301–443, including the cited appendices through p. 434. The controlling copy is the [published author PDF](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf), SHA-256 `9386db34c31671966440f18bccfefe11bd806aa221010e0e3336fecf8ff920ac`. Results and repairs are stated in our own words, with no source excerpts.

Independently read [arXiv v2](https://arxiv.org/pdf/2011.12940v2), Theorem 1.1.2 on p. 5, Theorem 2.5.2(7) on p. 26 and the proof of Theorem 5.5.7(a) on p. 82. These confirm the historical findings E14, E15 and E17 and their published-version boundaries. Corrected E17's locator: the v2 item is a theorem, while the published item is a corollary. The historical PDF receipt is recorded in `sourceVersions`; it does not control current target numbering.

The [official Annals article](https://annals.math.princeton.edu/2024/199-1/p05), [author site](https://www.williamyunchen.com/), arXiv version listing and title/author correction searches were checked on 19 October 2026. No separate erratum was located. Every source issue now has an independent verdict and reason. E1 also records Proposition 2.4.4, p. 330, as another occurrence of the finite-flat error.

| New finding | Locator | Verification and consequence |
| --- | --- | --- |
| E25 | Remark 2.2.4, p. 324; Proposition 3.2.2(a), p. 352 | An empty divisor over the dual numbers disproves the unconditional reducedness converse and the e=1 degree formula. Restrict the converse to a surjective divisor and the positive degree formula to e≥2. |
| E26 | §4.11, p. 388 | For odd dihedral groups the centralizer quotient is trivial, so d′=1. The value 2 belongs to the normalizer quotient. The target already had the correct value. |
| E27 | Proposition 3.2.2(b), proof p. 353 | The configuration space of distinct markings is not proper. Smooth surjectivity and geometrically connected fibres suffice for the source's connected-cover argument. |
| E28 | Proposition 5.2.16(d), proof p. 402 | A dihedral generating pair can be a rotation and a reflection, rather than two involutions. Its reflection and product give the required two zero traces. Over F7, diag(2,4) and the matrix with rows (0,6),(1,0) provide the missing case. |
| E29 | Lemma 5.3.1, parenthetical p. 405 | The condition that the last two traces are not both zero does not exclude all dihedral pairs. Swapping the E28 matrices gives the absolutely irreducible trace triple (0,6,0). The rotation conclusion survives, and the target already uses the stronger hypothesis where needed. |

E2 and G-GENERAL-J identify an unproved step in the general-j argument, rather than assert that its conclusion is false. The checked j=0 proof is enough for the stated NL.4 targets. E24 is likewise a proof repair using finite indices for possibly infinite cyclic groups. The unread original Vdovin, Asada, BBCL, BGS and Meiri–Puder proofs remain assigned inputs, not silently verified theorems. No restricted book was used or copied.

## Baseline and supplier audit

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the actual statements of all declarations below, including surrounding hypotheses and namespaces. Mathlib's source HEAD matches its pin; the three Tau Ceti source files used below equal their git blobs at f790474. No baseline correction was necessary.

| Confirmed declarations | Scope or convention checked |
| --- | --- |
| `alternatingGroup.isSimpleGroup`; `nat_card_alternatingGroup` | Cardinality at least 5 for simplicity; nontrivial underlying type for the factorial/2 formula. |
| `commutatorElement`; `orderOf`; `Function.minimalPeriod` | Commutator xyx⁻¹y⁻¹; zero order/period for the infinite/nonperiodic case. |
| `FreeGroup`; `Subgroup.centralizer`; `Subgroup.zpowers`; `MulAction.orbit` | Existing group, centralizer, cyclic-subgroup and orbit carriers; no geometric comparison is inferred from these names. |
| `Matrix.SpecialLinearGroup`; `Matrix.trace` | Determinant-one matrix subtype and sum of diagonal entries on the finite index type. |
| `Nat.totient`; `Nat.factorization` | Coprime counting and valuations, with positive finite group orders in applications. |
| `CategoryTheory.PreGaloisCategory.FiberFunctor` | The categorical axioms only; stack Riemann existence remains a separate input. |
| `WeierstrassCurve.j` | Elliptic/unit-discriminant hypothesis and c4³/Δ convention. |
| `CongruenceSubgroup.Gamma`; `CongruenceSubgroup.IsCongruenceSubgroup` | Reduction kernel and existence of a nonzero level contained in the subgroup. |
| `TauCeti.PermutationTriple`; `.eulerChar`; `.genus`; `.IsConnected.two_sub_two_mul_genus` | Product order σ∞σ1σ0=1, cycle counts, and connectedness needed for the genus identity. |
| `TauCeti.CoveringSpace.monodromyFunctor` | Actual topological covering-space monodromy; no algebraic stack Riemann-existence theorem is supplied. |

Read the reviewed library audit, generated 21 September 2026: it has no entry for this new roadmap. Independently inspected current TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without building or editing either. Read the scope and supplying interfaces in PeripheralActions and ProfiniteArithmetic, the relevant StableReduction and ModularCurves contracts, and SemisimpleAlgebras Layer 5, together with the corresponding Suggested declarations. Recursively searched the Suggested files of all nine newer roadmap directories and the current library for the specific targets.

The current ModularCurves 9D quotient-smoothness theorem already permits noninvertible finite-group order over a regular base and is imported, not replanned. SemisimpleAlgebras supplies field-based Skolem–Noether for the two finite-dimensional central simple matrix algebras actually used. PeripheralActions concerns pro-p punctured-sphere automorphisms, and does not supply the discrete punctured-torus comparison. The current library's thrice-punctured-sphere topology is also not that comparison.

Read all 33 distinct external node contracts, including the applicable integrated Dickson statement, and the five external stage scopes. Checked the requests against them: six expose existing contracts and eight specify extensions. The R09.6 framed-atlas result does not automatically provide the full geometric-residue-field extension; SF.5's rational-pushforward gap stays open; IG.3's Riemann existence is for schemes, not stacks. The fourteen precise contracts remain in the packet and reader.

G-MAPPING was narrowed after finding the supplier's 62-node packet and importing its C.0 node. G-DYNAMICS still requires the unregistered counting, strong-approximation and large-image contracts. The required order remains NL.6 → the supplying dynamics stages → NL.7. G-VDOVIN and G-GENERAL-J retain their exact conditional/scope boundaries. None is hidden by marking a stage closed.

## Validation and finite checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/NonabelianLevelStructures.json`: zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/NonabelianLevelStructures.lean`: passed, with no admitted data bodies.
- `lean-check` on the unchanged suggested file at the pinned shared build: elaborated successfully, with only 19 expected warnings for admitted proofs. Memory was checked before compilation. This establishes well-typed signatures, not theorems.
- Checked that all 65 statements occur identically in their roadmap layer and reader, every API/test statement appears in the reader, every source match equals its node's own-word statement, all implementation statuses are unchecked and every source issue has a verdict.
- Exact rational evaluation of the genus formula for all 337 primes in 13≤p<2304 gives minimum 5 at p=13. Also checked g5=0, g7=0 and g11=1. The reader's elementary tail estimate handles p≥2304.
- Independently enumerated punctured Markoff triples for p=5,7,11,13,17,19,23,29,31. Verified all three branch cycle counts, the cusp formula, genus, orientation-generator transitivity at those primes, free even-sign quotient and quotient branch parity. These reproduce the reader's table and do not replace the general transitivity input.
- Over F4, checked all nonzero vectors on the relevant conics for every a and t≠2. Their exact rotation period equals the matrix order. The four trace values give orders 2,3,5,5, retaining the nonsplit case in characteristic two.
- Independently enumerated all SL2 pair trace triples over F2,F3,F5,F7 and generating pairs up to simultaneous conjugacy. All 8,27,125,343 triples are attained; generating commutator trace sets are {1}, {0}, {1,3}, {3,4,5,6}. This checks both the small-field exceptions and unrestricted trace surjectivity.

The finite procedures are reproducible from the formulas and enumeration instructions in the reader. They require no retained source files or scratch material. Submission also checks the allowed paths, JSON intake and whitespace.

## Questions for the orchestrator

No question blocks acceptance. The next dependency work is to register the precise G-MAPPING extensions beyond C.0, assign G-DYNAMICS stages in the stated order and supply the CFSG-dependent cube bound. Preserve the j=0 scope until the general-j proof is repaired. Package preparation must keep the fourteen supplier contracts and all four gaps visible; this review does not promote any work upstream.
