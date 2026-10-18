# Independent review: GC.3 symmetric local systems

**Verdict: accepted after corrections.** Reviewer: Codex, session
`codex-EAU44Z`, job `REV-FunctionFieldArithmeticPartII--GC.3`, 18 October 2026.
The reviewed input was written by another worker. This accepts a complete
planning pass, with GC.3 **planned**, not closed. The three stack-theory inputs
and missing geometric Lean carriers remain explicit gaps.

## Scope and counts

Checked the packet, reader and suggested Lean file together, all thirteen
new nodes and the twelve imported parent targets, every pinned baseline
citation, source locators, actual supplier statements, API contracts, tests,
planet and ownership boundaries.

- Thirteen nodes: one definition, five lemmas, three theorems, two
  constructions and two comparisons. Twelve verdicts are corrected and one
  verified. No node was added or removed; the antisymmetrization construction
  became a compatibility lemma because its maps already exist.
- Twenty-five pinned baseline declarations confirmed; none removed. One
  `provides` description was narrowed to its actual endomorphism hypothesis.
- The three definition/construction nodes have 28 API entries and 17 tests
  (five, seven and five respectively). The compatibility lemma retains one
  additional API entry and four convention checks for imported maps.
- One planet, *Cohomology of symmetric powers*, retained. Four gaps and three
  integration/reuse requests remain. All five source findings are confirmed;
  the fifth carries forward a relevant parent finding omitted by this part.

## Corrections by target

| Target (prefix `FunctionFieldArithmeticPartII:GC.3/`) | Review and resulting change |
| --- | --- |
| `koszul-sign-action` | Verified the inverse-permutation action, sign and degree-zero/one conventions. Tau Ceti's `commute_reindexRepresentation_map` only concerns endomorphisms; general naturality between different modules uses Mathlib `PiTensorProduct.map_reindex`. The five tests distinguish the unsigned action and failure of a characteristic-zero conclusion in characteristic two. |
| `antisymmetrization` | Current Mathlib and Tau Ceti already provide the tensor/exterior maps, factorial composites and naturality. Reclassified the node as the additional assertion that antisymmetrization lands in Koszul-signed invariants. Recorded exact current-library imports; removed the duplicate proposed map API from the Lean targets. Private light models let the missing compatibility be stated at the older mandatory pins. |
| `alternating-invariants-exterior` | Checked both composite identities: one is factorial times the exterior identity, the other the signed permutation sum. They prove the arbitrary-module result when the factorial is a unit. Qualified Conrad's locator: his vector-space discussion is not itself the all-module theorem. The current-library identities supply the general proof. |
| `averaging-exactness` | Checked the invariant-lift argument and the categorical argument using a split projector. Qualified Etingof's complex-vector-space proof, Abramovich–Vistoli's quasi-coherent argument, and the consequence drawn from the Stacks Karoubian section. The general ring and additive-functor assertions have explicit algebraic proof steps and the pinned projector API. |
| `finite-group-rational-acyclicity` | Current Tau Ceti already proves ordinary all-degree annihilation by the group order. Reused it and retained only the invertible-order consequence. ProfiniteCohomology Layer 3 compares degrees 0–2; it cannot justify an all-degree comparison. The revised proof uses the implemented ordinary theorem directly and treats Layer 10 as the existing transfer direction. |
| `tensor-character-kernel` | The character identity holds for any commutative group. The cohomological consequence requires a finite group; the geometric pushforward interpretation additionally needs the recorded stack input. Added the infinite cyclic kernel example, where rational first cohomology is nonzero. |
| `root-curve-character-dictionary` | Restricted the rational representation dictionary to connected normal stacks and local systems defined over a finite coefficient extension. Checked the square-root chart, tame inertia subgroup, extension over regular charts and coarse-space descent criterion. These hypotheses suffice for every use here. |
| `monodromy-symmetric-local-system` | Corrected the geometric fundamental-group notation. Removed dependence on geometric pushforward from the construction. Determined the boundary stabilizer character by local constancy along a connected root boundary and its generic product chart. Added induced maps, identity/composition laws and scalar/zero-map tests. The sign-obstruction test is explicitly in degree two. |
| `symmetric-coarse-model` | Made the injection into the dense-open direct image explicit. Added induced maps, identity/composition laws and the scalar/zero-map test. The example asserting failure of lissity now requires positive degree. |
| `rational-coarse-comparison` | The full fibre can be nonreduced; its reduction is the stabilizer gerbe. Added the root-fibre prerequisite and nilpotent invariance to the stalk gap. Abramovich–Vistoli's local quotient and quasi-coherent results do not establish the rational étale stalk formula, which remains a gap. Corrected the Lemma 2.3.3–2.3.4 locator to p. 5. |
| `symmetric-power-cohomology` | Verified the statement and finite-quotient/Künneth/projector proof. The scheme supplier includes the Koszul symmetry. The cohomological permutation action has the sign even though the linearization defining the rank-one sheaf is unsigned. Frobenius and coefficient-extension requirements are explicit in the integration request. |
| `twisted-curve-cohomology` | Added direct prerequisites for rational coarse comparison and scheme cohomological dimension. Checked the rational curve duality supplier, the geometric bound above degree two, and extension from finite coefficient fields. Negative-degree vanishing follows because the coefficient is an ordinary sheaf. |
| `pushforward-description-comparison` | Reduced the fibre to a finite groupoid only after nilpotent invariance. Identified relative stabilizers as kernels of multiplication and the adjunction unit as the identity on the invariant line. This supplies an actual stalkwise isomorphism, beyond equality of dimensions. Nonrepresentable proper base change remains a gap. |

The reader and geometric omission ledger were updated with these corrections.
There are no admitted data definitions or stand-in stack/sheaf carriers.

## Baseline and existing work

Read the declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The confirmed inventory is:

| Module family | Declarations (namespace prefixes as in the packet) |
| --- | --- |
| Exterior algebra/powers | `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`, `exteriorPower.alternatingMapLinearEquiv`, `exteriorPower.map`, `exteriorPower.finrank_eq` |
| Alternating maps | `MultilinearMap.alternatization`, `AlternatingMap.coe_alternatization` |
| Tensor products | `PiTensorProduct.reindex`, `PiTensorProduct.map_reindex`, `PiTensorProduct.lift`, `PiTensorProduct.tprod`, `TensorPower` |
| Permutations | `Equiv.Perm.sign` |
| Invariants | `GroupAlgebra.average`, `Representation.averageMap`, `Representation.isProj_averageMap`, `Representation.invariants` |
| Group cohomology | `groupCohomology` |
| Idempotents | `CategoryTheory.IsIdempotentComplete`, `CategoryTheory.Idempotents.isIdempotentComplete_iff_idempotents_have_kernels` |
| Finite products | `map_prod` |
| Tau Ceti tensor action | `PiTensorProduct.reindexRepresentation`, `PiTensorProduct.commute_reindexRepresentation_map`, `PiTensorProduct.invariants_reindexRepresentation` |
| Tau Ceti norm | `Representation.range_norm_eq_invariants` |

In particular the rank formula requires a nontrivial coefficient ring and a
finite free module; the signed-invariant isomorphism itself needs neither
finiteness nor freeness. The unsigned-invariant theorem does not supply the
signed comparison.

Read the eight FunctionFieldArithmetic entries of the reviewed library audit.
Checked current TauCetiRoadmap main at
`350e970ce49f707a327909beac0b7b7c782cc7ee`, including relevant portions of the
nine roadmaps newer than the atlas snapshot, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current-library reuse is recorded
separately from the mandatory pinned baseline:

- `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean`, lines 170–247: exterior
  projection, tensor/exterior composite identities, injectivity, naturality
  and the signed-operator image. Reuse these maps; retain the comparison with
  the separately specified Koszul representation.
- `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`,
  lines 153–169 and 430–445: ordinary transfer and positive-degree
  annihilation by the finite group order. Reuse these; retain the
  invertible-order vanishing consequence.

Read the actual root-stack, normal dense-open fundamental-group, adic local
system, tame inertia and rational curve-duality suppliers. For the scheme
operations read EtaleCohomologyFoundations at its recorded PR #938 head,
§§F.2.1, F.2.6–F.2.7, F.3, F.4.5–F.4.6. The normality restriction matters:
a general rational lisse sheaf on a nonnormal space need not be described by a
representation of the profinite fundamental group. Scheme operations and
quasi-coherent coarse exactness do not fill the stack étale-operation gaps.

## Sources and source findings

Read all node locators in the public sources linked in the packet. The main
text was the [published author-hosted Yun–Zhang PDF](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Appendix A, printed pp. 514–520; the relevant proof was collated with
[arXiv v2](https://arxiv.org/pdf/1712.08026v2), pp. 85–86. Independently checked
page images of printed pp. 506, 519 and 520. The packet preserves version URLs,
dates and PDF hashes. No restricted library material was used.

| Finding | Independent verdict and effect |
| --- | --- |
| EGC3-1, Lemma A.6 proof, p. 519 | Confirmed the two omitted geometric base changes. The statement already has the intended base change. |
| EGC3-2, §A.2.1, p. 519 | Confirmed the nonrepresentability qualification: multiplication of at least two branch stabilizers has a nontrivial kernel. The pushforward proof needs a theorem for that class of stack morphisms. |
| EGC3-3, §7.1.1 p. 506 and §A.2.1 p. 519 | Confirmed the perverse-shift terminology issue; the displayed normalization fixes the intended unshifted object. |
| EGC3-4, Lemma A.8 proof and (A.5)–(A.6), p. 520 | Confirmed that arbitrary rank-one input need not have sign-valued global monodromy. An unramified order-three arithmetic character is a counterexample to that restriction. Corrected the old page locator. |
| EGC3-5, §A.1.3 pp. 515–516 and the A.7 fibre argument | Carried forward parent E2 and confirmed the full fibre has a square-zero coordinate. Only its reduction is the classifying gerbe. Added nilpotent invariance to both affected stack-operation gaps. |

Also checked Noohi §4 and Theorem 7.11 (pp. 8–10, 17), Abramovich–Vistoli
Lemmas 2.2.3 and 2.3.3–2.3.4 (pp. 4–5), Conrad §4 (pp. 12–13), Milne
II.1.30–1.31 (p. 70), Etingof et al. Theorem 3.8 (p. 37), and Stacks tags
0H2W, 0EYG, 0EYF, 0BMB and 09SF. Their use and limits are stated at the nodes.
The journal and author pages linked in the source findings had no correction
for the passages at issue. All descriptions are in our own words.

## Validation and assembly questions

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.3.json`:
  **0 errors, 0 warnings**.
- The shared `source_issues.check_issues` and `check_errata.versions_checked`
  validators accept all five findings and their version metadata. The errata
  command-line entry point is for standalone `errata-v1` files, not packets.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.3.lean`:
  **exit 0, 25 warnings, all for admitted proofs**. The shared build is at
  the mandatory pins; compilation was serial and memory was checked first.
  Elaboration validates signatures, not the admitted mathematics.
- Intake file validation: five files, zero problems. The admitted-data checker
  accepts the suggested file; `git diff --check` is clean.

There is no unresolved contradiction preventing acceptance. The assembly must
apply the packet's prerequisite rewiring to the imported parent targets,
reuse the two current-library interfaces, merge the overlapping GC.4 lisse
adapter gap, and carry the three precise stack-theory requests to the proposed
stacks Part II. No change to an upstream roadmap is made here. A generic owner
may later receive the additional signed-action and averaging/vanishing targets;
existing tensor/exterior maps and transfer must not be planned again.
