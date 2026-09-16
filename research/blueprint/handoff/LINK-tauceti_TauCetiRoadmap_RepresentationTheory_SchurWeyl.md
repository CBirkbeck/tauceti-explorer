# Schur–Weyl links: handoff

**Job:** `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl`  
**Issue:** #65  
**Worker:** ChatGPT Pro — cgp-8384bdb1c668  
**Packet status:** `complete` means the catalogue-wide screen is complete, not that the proposed mathematics is implemented, independently reviewed or integrated.

The only deliverables are this note and `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json`. No Lean code, baseline declaration inventory, integrated atlas edit, reserved identifier, queue edit or review of another worker is included. The claim was accepted specifically for this worker in bot comment 5696731641, following claim comment 5696730048. Both were re-read before preparing submission; no competing claim was present.

## Revisions and acquisition

Initial input revision: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. Protocol-refresh revision: `b82b494ac1b384423eacc1276c6716f15e186b6d`. Final submission base and validation revision: `1338883fe31f3b357dd91b7d5916e76e3b950c81`. The comparisons from the initial input through the final submission base leave `data/atlas.json`, the cited campaign/upstream source documents and `baseline.json` unchanged. The first refresh adds two other link packets, the Mordell–Lawrence–Venkatesh roadmap, browser-sized atlas extracts and protocol/validator updates; these additions were incorporated in the final screen and validation. The subsequent four-commit comparison adds the ZigzagPreprojective link packet but changes no atlas, source document, baseline, protocol or validator. Its 13 links were also included before submission.

| Input | Verified Git blob SHA |
| --- | --- |
| `data/atlas.json` | `37f2add06983c206067d1104e0f40a839cc3961a` |
| `research/blueprint/baseline.json` | `fdb00afdfae8e5728e070f310f5a880707764bc2` |
| SchurWeyl README | `c9f1134c62149df359500b5f40e9aa40fd4e6926` |
| ClassicalGroups README | `704591a74a1a23eaa259892bdf4f4331a6b8c7fc` |
| CharacterTheory README | `d3ff27de283532af3a7fc4bd142a9f9e108b12f0` |
| Final `scripts/check_links.py` | `88135efe5a74ef82e088f3fa3189893e27a7867a` |
| Final browser instructions | `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0` |
| Final blueprint protocol | `41099c03ea64d701d05b1277a83141ef9d4868db` |

The pins read from the baseline are **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and **Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. The atlas records a different upstream *roadmap* snapshot, `faa5423b925964415cc926802ab206567719d3f4`; it must not be confused with the code baseline. No source declaration in either Lean repository was checked for this link job, and no README claim of library presence or absence is adopted as verified. Implementation remains unchecked.

The connector initially could not return the 14 MB atlas as a file. Its Git blob response allowed text search. Full local input was then obtained from the repository's existing, successful public Pages build artifacts using the authorized GitHub download action, without running `git` or changing any workflow:

- Run **35091187921**, commit `7821d19ab4fd547181beb46287f8968ec64847d1`, artifact **10444087116**; ZIP SHA-256 `ec8711bd4875c69130e3e5ad90082fec733a3cf097eb378002647240d9c6dc99`.
- Protocol refresh: run **35092670298**, commit `b82b494ac1b384423eacc1276c6716f15e186b6d`, artifact **10443974393**; ZIP SHA-256 `948e8c35e3db2354b3abec24525c55a8287f216094a393739b0865c152e52d5c`.

- Final refresh: run **35093449521**, commit `1338883fe31f3b357dd91b7d5916e76e3b950c81`, artifact **10445750299**; ZIP SHA-256 `ff1e2ef356da1b91a708874dcaf079ff9e618afd4274eb73979ec0a96c5284b1`.

All three ZIP digests were checked. Regular reference files were extracted into session scratch, and blob hashes were computed using SHA-1 of the Git blob header and bytes, not a Git command. The first artifact's atlas, baseline and central source documents matched the initially fetched blobs. The second artifact supplies the updated validator; the third adds the final other-packet inputs. This is full-world validation, not validation against a reconstructed subset.

## Coverage and source scope

All **212 atlas roadmaps** were screened, including all **60 upstream** roadmaps and all same-area algebra roadmaps. The own roadmap was excluded from `examined`; the newly added **MordellLawrenceVenkatesh** definition was then screened, producing **212 unique other-roadmap entries**. Every atlas title/summary was examined, and full README/stage text was searched. Negative results mean no exact supply/use was found in this screen, not a proof that a relationship cannot exist.

The search covered Schur–Weyl and spelling variants, Specht/polytabloid, Young symmetrizer/subgroup/diagram/tableau, partitions and fixed-point cycle types, Murnaghan–Nakayama, Frobenius characteristic, RSK/Robinson–Schensted, hook length/content, Schur functor/function/polynomial, Jacobi–Trudi, Pieri/Littlewood–Richardson, Brauer diagrams, image centralizers/bicommutants, tensor powers, induced trivial representations and Gelfand–Tsetlin. Normalized whole-text searches caught hyphenated and line-broken terminology; summary screening covered neighbouring arithmetic, automorphic, cohomological, analytic and topological areas.

The SchurWeyl, ClassicalGroups and CharacterTheory READMEs were read in full, including their conventions and ordering. Every endpoint stage of every proposed link and overlap was read in full. InductionRestriction conventions, Layer 2 and its Young-subgroup examples; SemisimpleAlgebras conventions and Layers 1–3; LieHighestWeight Layer 6 and relevant reductive passages; PolynomialGaloisGroups Layer 0; AutomorphicBundles B4; and the full AutomorphicGaloisRepresentationsPartII document received additional targeted reading. The `examined` notes distinguish these reads from summary/full-text-search screening.

Only repository roadmap texts were used as evidence for the links. Printed monographs and the maintainer's private source library were not consulted. The source texts' theorem citations are not claimed to have been independently verified. Precise locators below locate the actual planning contracts, not proofs in those external books.

## Own-stage input/output ledger

Write **SWj** for SchurWeyl Layer j, **CTj** for CharacterTheory Layer j, **CGj** for ClassicalGroups Layer j, **IRj** for InductionRestriction Layer j, and **SAj** for SemisimpleAlgebras Layer j. These are abbreviations only; all JSON endpoints retain the full existing atlas identifiers.

| Stage | Inputs and actual proposed output |
| --- | --- |
| SW0, lines 166–195 | Finite permutations and partitions; positive sorted row lengths, diagram and conjugacy-class equivalences, dominance, finite standard tableaux, row/column subgroups. Fixed points must remain parts of size one. |
| SW1, 196–217 | SW0 and generic left-coset induction; ordered-block Young subgroup, tabloids, rational permutation representation, index/character comparison and combinatorial Kostka counts. No premature Specht multiplicity statement. |
| SW2, 218–235 | Row/column subgroup sums in the rational group algebra; fixed product `a_t b_t`, scalar-square relation, normalized idempotent and the stated intersection/vanishing arguments. Composition-order prose requires correction below. |
| SW3, 236–250 | SW1–2; polytabloid Specht submodule, left-ideal comparison and submodule theorem with the matching action side. |
| SW4, 251–275 | SW3, the integral standard-basis part of SW5 and CT2 over C; irreducibility, endomorphism-ring/absolute-irreducibility step, distinctness, complex completeness then rational descent, Young multiplicities. |
| SW5, 276–289 | Polytabloids and independent straightening; finite standard basis and rational dimension. Hook formula is first multiplicative, with divisibility proved before a natural-number quotient. Sum of squares uses the independent early RSK lane, not the later character theory. |
| SW6, 290–313 | Specht modules, integer character refinement, full cycle partitions and class-size weights; Murnaghan–Nakayama recursion and a partition-labelled table. CT5's complex specification requires scalar and indexing transports. |
| SW7, 314–342 | Finite-alphabet semistandard tableaux, integer-indexed complete functions and Kostka data; integral Schur polynomials and Jacobi–Trudi. A degree-bounded Frobenius map needs an explicit coefficient field. RSK is a separate early construction; the stable Hall-ring theorem is deferred. |
| SW8, 343–368 | Complex tensor permutations and diagonal GL action; commuting actions, mutual **image** commutants, partition-filtered decomposition, and Young-image comparison. Identifying the GL span with the S_n commutant is not a consequence of generic density alone. |
| SW9, 369–471 | Nondegenerate bilinear forms and tensor operations; loop-weighted Brauer diagrams, generator/action relations, first-fundamental-theorem image statement, reverse commutant with hypotheses, and harmonic filtration. The symplectic crossing convention is inconsistent as currently stated; generic Brauer semisimplicity cannot be substituted at geometric parameters. |

## Proposed links and exact quote locators

The numbered rows match JSON array order. Upstream paths have prefix `content/tau-ceti/RepresentationTheory/`; the arithmetic consumer is `content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`.

| Link | Producer quote | Consumer quote | Contract retained |
| --- | --- | --- | --- |
| 1. IR2 → SW1 | InductionRestriction 266 | SchurWeyl 207–208 | `Ind_H^G 1` equals the left-coset permutation module over Q; Young-block combinatorics stays in SW1. |
| 2. CT2 → SW4 | CharacterTheory 238–239 | SchurWeyl 264–265 | Splitting-field count, used over C only after absolute irreducibility and distinctness. |
| 3. CT4 → SW6 | CharacterTheory 270–271 | SchurWeyl 293–295 | Complex integrality plus rational trace/base-change comparison yields the integer character refinement. |
| 4. CT5 → SW6 | CharacterTheory 318–320 | SchurWeyl 297–298 | Cast the integral matrix to C, transport labels and prove every specification clause. |
| 5. CT0 → SW7 | CharacterTheory 193 | SchurWeyl 328–329 | Class-function carrier; rational linear map and integral virtual-character lattice remain separate. |
| 6. SW2 → CG2 | SchurWeyl 222–223 | ClassicalGroups 219–221 | One Young group-algebra element transported Q → C, not a duplicate constructor. |
| 7. SW5 → CG2 | SchurWeyl 278–280 | ClassicalGroups 234–235 | Standard-basis dimension supplies the GL-factor multiplicity after base change. |
| 8. SW7 → CG4 | SchurWeyl 318–319 | ClassicalGroups 274–276 | Finite Schur/Jacobi–Trudi/tableau interface only; not an unchecked general LR export. |
| 9. SW8 → CG2 | SchurWeyl 359 | ClassicalGroups 233–234 | Image-level complex duality and tensor decomposition, with length bound and external-factor swap. |
| 10. SW2 → AG2.1a | SchurWeyl 226–227 | Campaign document 35 | Rational projector identity only; actual correspondences, signs, twists, descent and cohomological realization remain AG2.1a work. |

The 20 quotation strings are literal substrings, each 48–232 characters, and below 300 characters. Quoting an existing target does not assert its proof has been completed. `explicit` records named contract/cross-roadmap use; `inferred` records the exact specialization not expressly named by the consumer.

## Recursive dependency checks and rejected shortcuts

CT2 itself uses CT1's centre dimension and the split Wedderburn input. CT3 adds the class-function basis/idempotents; CT4 and CT5 depend on those precise earlier constructions. Those stages and their standing field hypotheses were read. CT2 explicitly does **not** require the whole SemisimpleAlgebras roadmap: it treats the baseline Wedderburn theorem as its direct planned input, with a separately reusable block/simple dictionary. This note does not verify that baseline declaration, nor introduce a fictitious SA → CT dependency.

For SW4, the complex count does not establish rational completeness until the standard-basis/endomorphism-ring argument and descent are proved. For SW6, the base-changed trace is an algebraic integer and is the image of a rational number; this supplies a route to its unique integer preimage. Rational character values alone are never used to infer absolute irreducibility. The CT5 specification is stronger than square-matrix orthogonality: central-character/eigenvector, normalization and positivity/integrality clauses must also be checked.

IR2's ordinary induction comparison is an earlier generic construction than its Young-subgroup worked example. Importing the whole Young example back from SW1 as a prerequisite of IR2 would conceal a cycle. The generic Dixon algorithm similarly must not wait for Murnaghan–Nakayama just because both can test S_3/S_4. Their shared test comparison is a downstream use of CT5, recorded as a keep-separate overlap.

CG2 and SW8 both presently describe Schur-image constructors; CG4 and SW8 both describe the character identification. The packet records the existing supplier-to-consumer direction and flags the shared-constructor boundary for rescoping. It does not add CG2/CG4 → SW8 reverse whole-stage edges. The apparent SW4/SW5/SW7 ordering cycle is resolved only by splitting early integral straightening and RSK from late completeness/Frobenius-characteristic results; no proof may use the late lane to establish its own early prerequisite.

The arithmetic link ends at **AG2.1a**, not the AG2.1 aggregate or AG2.1b. The document expressly forbids using the local Langlands comparison or completed automorphic constituents as inputs to raw cohomology. A Q-algebra homomorphism sends an idempotent to an idempotent, but constructing the correct correspondence action and proving its selected Schur functor is exactly the missing geometric input, not a free consequence of the complex SW8 theorem.

## Requests and remaining mathematical work

These are proposed declaration-sized mathematical contracts, not Lean declaration names or newly allocated stage IDs. They are recorded here because this issue authorizes no edits to the other owners.

**R1 — one equivariant Young-image constructor and its comparison.** SW2/CG2/SW8 must share coefficient transport of `a_t b_t`, its normalized idempotent, the equality of its image with the unnormalized image (nonzero scalar), GL-stability, tableau-choice comparison and multiplicity-space/image equivalence. CG4 owns highest-weight/character identification; SW7 owns the combinatorial polynomial. Partition/rational highest weights remain distinct: determinant twists may have negative exponents and need Laurent characters. This is overlap 1; do not solve it with reverse whole-stage imports.

**R2 — advertised symmetric-function exports.** SW7 must separately state bialternant numerator divisibility and quotient equality, finite-variable Pieri, and the chosen Littlewood–Richardson coefficient rule before CG4 can import them. Their current attribution is not a supplied proof target. LieHighestWeight Layer 6 proves the minuscule Lie-theoretic case only; it is not a substitute for general LR. Keep the integer-indexed `hZ` convention, so negative Jacobi–Trudi indices are zero rather than truncated natural subtraction. A finite alphabet other than `Fin d` also needs an order; finiteness alone does not define semistandardness. This is overlap 2.

**R3 — the GT dictionary has the wrong advertised supplier.** CG6 should construct the equivalence between interlacing patterns and bounded semistandard tableaux. Bounds concern entries in diagram cells; empty diagrams and zero-dimensional alphabets must be handled separately. Rational weights require a determinant-shift extension allowing negative pattern entries. RSK does not provide this dictionary. This is overlap 3.

**R4 — bilinear group and Brauer signs.** CG0/SW9 must agree on the complex symmetric-bilinear orthogonal group and the exact symplectic action. The contradictory mentions of `Matrix.orthogonalGroup` are only documentary evidence here, not a checked Mathlib API assertion. More decisively, SW9 lines 414–425 combine the usual relation `s_i e_i = e_i`, alternating cup/cap, and an unsigned tensor-flip action on a crossing. For a two-dimensional symplectic space, let `P` flip the two tensor factors, let the cap have coordinates `(0,1,-1,0)`, and choose inverse cup `(0,-1,1,0)`. Then `E = cup · cap` satisfies `E² = -2E`, but `PE = EP = -E ≠ E`. Thus the unsigned crossing violates the stated relation. Replacing `P` by `-P` repairs this particular relation and keeps `P²=1`; the full braid/mixed relations and resulting sign-twisted permutation comparison still require proof. Inserting an inverse permutation cannot repair an adjacent-transposition sign, since that permutation is its own inverse. This is overlap 4 and a blocking upstream convention request, not a claim that this link job repaired SW9.

**R5 — semisimple-image bicommutant and GL-span lemmas.** SA3's stated hypothesis is a simple module finite over its endomorphism division ring. Request a separate theorem for a finite-dimensional semisimple image algebra acting on a finite-dimensional module, proved by decomposition into simple blocks and multiplicity spaces. Independently, SW8 must identify the GL image/span with the full S_n commutant. Semisimplicity of the S_n algebra establishes neither that identification nor the needed module simplicity. No SA3 → SW8 edge is submitted. This is overlap 5.

**R6 — finite permutation adapter.** Compare the underlying multiset of SW0's partition with PolynomialGaloisGroups Layer 0's `fullCycleType`, naturally under equivalences of finite sets. Keep fixed points; test identity, transposition and the empty set. Arithmetic factorization/Frobenius proofs and Specht classification are irrelevant to this adapter. This is overlap 6; the direction remains a shared-API ownership decision, not a fabricated prerequisite.

**R7 — rational Frobenius map versus integral lattice.** State a Q-linear map from `ClassFunction Q S_n` to homogeneous symmetric polynomials over Q for `d ≥ n`, and separately show that the Z-span of irreducible characters maps to the Z-span of Schur polynomials. For example, half a character must map to half its Schur polynomial, which is not generally integral. No map on all rational class functions can be asserted to land integrally while retaining the stated linear character-to-Schur normalization. The stable graded ring and Hall isometry are later targets, not imported here.

**R8 — Young product-order prose.** SW2 lines 223–225 says the opposite product produces a conjugate/dual Specht module. Reversing the two factors is not, by itself, conjugation of the partition: in Q[S_2], for shape `(2)`, `a = 1+s` and `b = 1`; both products are `1+s` and give the trivial image, whereas the conjugate shape `(1,1)` gives the sign image. Also, a left action of `a b` applies `b` before `a`. Preserve the algebraic definition, but repair the temporal-order/transpose/dual comparison before consumers use it. Links 6 and 10 use only the fixed element and idempotent identity, not this incorrect prose.

**R9 — arithmetic projector realization.** For AG2.1a, prove the correspondence-algebra map, its permutation-product convention, compatibility with the realization functor, the cohomological Koszul sign and the selected partition/Schur functor. Prove coefficient-field descent, field of definition, Tate twist and degree separately. This work cannot be replaced by an unproved base change of the complex GL theorem, or by treating a projector on graded cohomology as an ungraded tensor projector.

**R10 — unresolved external diagram reference and review.** SW9 cites TemperleyLieb, but no corresponding canonical roadmap record was found in the imported atlas. Do not invent an endpoint. Either import a reviewed supplier with an actual ID, or keep loop-stacking associativity local to SW9. An independent reviewer must still check all ten links and seven overlaps, especially the narrow scope of the arithmetic link and the ownership decisions above.

## Negative matches worth preserving

Brauer *groups* of central simple algebras are not Brauer *diagram algebras*. The Frobenius characteristic of class functions is not a Frobenius characteristic polynomial in arithmetic cohomology. Schur complements, Hausdorff–Young and Fenchel–Young are not Young symmetrizers. Hook-length dimension of a Specht module is not the GL hook-content formula. Spin/half-spin modules are not supplied merely by harmonic tensors of the standard orthogonal representation. AutomorphicBundles B4 needs geometric/descent compatibility, not an automatic direct import of a complex tensor theorem. The newly added Mordell–Lawrence–Venkatesh roadmap uses semilinear centralizers and Aff(q) projectors, not a stated Young-projector or Specht-classification contract.

## Validation and handoff state

Executed in the isolated reference tree with full original atlas inputs, then repeated after refreshing the validator and other inputs through `1338883fe31f3b357dd91b7d5916e76e3b950c81`:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json
status: complete; links: 10; overlaps: 7; examined: 212
0 error(s), 0 warning(s)
```

Additional executed Python assertions checked JSON parsing, the exact set of 212 unique other-roadmap IDs, all 20 literal quotes with length below 300, endpoint ownership, and absence of duplicate proposed edges against all 3508 atlas edges plus all three other on-disk link packets. Those packets are StandardDistributions (blob `fceb8f47a841329804eacf2267e8903d592d8a43`), UniversalCovers (blob `d8d0a060c9bc35b6f9130ffb7c4bbafa1fc6327f`) and ZigzagPreprojective (blob `5e65d8ae7fb32b7898891cd85ba8b08dd8c02b22`). The repository validator performs the cycle check against that combined graph. A separate exact-arithmetic check of Q[S_2] verified R8's example; integer 4-by-4 matrix calculations verified R4's `PE = EP = -E`, `E² = -2E` example. These examples do not prove a general Brauer action.

There are no baseline declaration checks, Lean compilation, new theorem implementations or external-book theorem verifications to report. A structural validator pass is not mathematical correctness or reviewer acceptance. The isolated branch `swarm/cgp-8384bdb1c668/link-schur-weyl` was created from the final submission base through the authorized connector. Final GitHub commit/PR identifiers and any remote CI result belong in the submission comment; until those actual actions succeed, local validation alone is not a GitHub submission.

After an independent reviewer addresses the requests, the orchestrator decides which edges/overlaps to integrate and which declaration-sized follow-up jobs to allocate. No issue closure, merge, approval, `state:done` transition or release of another worker's claim is requested.
