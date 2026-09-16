# Handoff: classical-group representation links

## Identity, ownership and inputs

Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups`.
Issue: [#58](https://github.com/CBirkbeck/tauceti-explorer/issues/58).
Worker: **ChatGPT Pro — cgp-87a9defc4f57** (GPT-6 Astra Pro).
Date: 2026-09-16. Branch: `cgp-87a9defc4f57-link-classical-groups`.
Own claim comment: `5697575139`; accepting bot comment: `5697577380`.
Both were re-read before submission. The rejected attempt on #27 is not an active claim.

The final input revision is `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`.
Initial protocol/roadmap reads used `088ac3dcfb573a1e875fcea971ce54526bbe74d3`;
the first complete-world screen used `262dee344399d4123a712655f2be585d7e68720d`.
The comparison with the final revision showed no changes to the atlas or any
quoted source document. Newly published roadmap definitions and link packets
were included in the final screen and validation.

The baseline file pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
**No Lean declaration-availability claim is made by this link packet.** Inherited
roadmap inventories were not converted into verified baseline evidence.

The browser-sized extracts were read through the GitHub connector. For complete
text search and execution of the unmodified repository validator, the same
connector downloaded the repository's published Pages artifact:

- workflow run `35099069170`, artifact `10446963221`, commit `be09b0f…`;
- archive SHA-256 `4e2e1610f490ae2125bc74ea94af72c1930531b80a476ace6928d6b6da4110c9`;
- complete `data/atlas.json` Git blob `37f2add06983c206067d1104e0f40a839cc3961a`,
  verified by hashing its bytes with the Git blob header, without running git.

The snapshot has 212 atlas roadmaps, 1,968 stages and 3,508 recorded stage edges.
The screen also covers six new roadmap definitions, hence **217 other roadmaps**:
211 other atlas entries and six definitions. All 59 other upstream roadmaps,
all same-area roadmaps and the foundations/algebra/topology summaries were
included. The final world contains 15 existing link packets.

## Deliverables and status

Only these files are submitted:

1. `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.json`
2. `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.md`

The packet is `links-v1`, status `complete`: the catalogue-mapping pass is
complete. This is **not** a claim that the roadmap's mathematics is complete,
that the interfaces below have been constructed, or that independent review has
accepted this submission. No review verdict or implementation status is changed.

There are **12 new incoming links**, **no new outgoing links**, four overlap
proposals and 217 examined entries. Every new edge has two literal quotations
with source paths and line locators; all quoted file blobs are in provenance.
The negative entries distinguish screening from proof of absence. Full-text
matching used synonyms for rational/algebraic/polynomial representations,
highest weights, Weyl formulas, Schur/Young/tableau theory, branching, central
characters, tensor powers, orthogonal/symplectic invariants and Gelfand–Tsetlin.

## Stage input/output inventory

Here C0–C6 denote the seven ClassicalGroups layers. R denotes ReductiveGroups;
L denotes LieHighestWeight; the packet carries complete, unchanged atlas IDs.

| Layer | Inputs and owned outputs |
| --- | --- |
| C0 | Coordinate Hopf comodules and char-zero linear reductivity; concrete matrix groups, standard action, polynomial/rational criteria, the C-point dictionary and its basis independence. |
| C1 | C0 and ordinary multilinear algebra; tensor, symmetric and exterior-power representations, duals and determinant twists with action-level comparisons. Generic commutative-ring functorial constructions do not by themselves supply every integral arithmetic coefficient system. |
| C2 | C1 plus SchurWeyl's Young element, tableau counts and duality; the GL action on the fixed Young-image model, comparisons and tensor-power decomposition. |
| C3 | Algebraic torus/root datum, differentiation and semisimple/reductive highest weights; integral decreasing GL tuples, the central determinant direction, group/Lie comparisons, isogeny-lattice descent and the disconnected orthogonal extension. |
| C4 | C2–C3, combinatorial Schur identities and the actual formal Weyl character theorem; trace/torus characters, Laurent determinant twists and classical character formulas. |
| C5 | C3 and the Lie-theoretic coroot product; group dimensions, positive rational products identified with natural dimensions, explicit classical products and hook-content comparison. |
| C6 | C3–C4, branching, enveloping-algebra functoriality and central characters; integral interlacing patterns, canonical lines, normalized basis vectors, enveloping-center generators and their joint eigenvalues. The branching-side dimension count must not depend circularly on C5. |

## New incoming edges

**ReductiveGroups supplies five.** R1→C0 supplies the comodule/matrix-coefficient
dictionary. R6→C0 supplies complete reducibility for smooth connected reductive
algebraic groups in characteristic zero, specialized to finite-dimensional
rational GL representations. R2→C3 supplies algebraic differentiation. R4→C3
supplies the split torus character/cocharacter lattice. R7→C3 supplies the full
algebraic-group root datum, including its isogeny-sensitive lattices.

**LieHighestWeight supplies seven.** L4→C3 supplies the semisimple irreducible
classification; L9→C3 supplies reductive gl and the central-scalar transfer;
L0→C3 supplies the explicit sl2 acceptance module. L6→C4 and L6→C5 supply the
formal Weyl character identity and the coroot dimension product. L3→C6 supplies
PBW functoriality and the subalgebra/enveloping-algebra embeddings. L7→C6 supplies
separation by full semisimple central characters, combined with the scalar center
of gl; it does not purport to supply the entire reductive Capelli-generator API.

The Weyl edges repair an important attribution boundary: a RootSystems Weyl-group
sum is not a theorem identifying that sum with a representation character.
The GL determinant direction is likewise not contained in the semisimple A-type
root lattice. The reasons on these edges retain the missing comparison steps,
rather than silently enlarging what the suppliers prove.

## Already recorded: deliberately not duplicated

The following nine edges stay in their original packets:

| Existing packet | Relations involving ClassicalGroups |
| --- | --- |
| `tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json` | RootSystems Layers 2, 4 and 5 → C3. |
| `tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json` | SchurWeyl Layers 2, 5 and 8 → C2; Layer 7 → C4. |
| `tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json` | C0 → Spin Layer 6; C1 → Spin Layer 5. |

Those packets also retain six overlap proposals: the full Spin-branching
boundary; GL's central lattice versus semisimple root data; Young-image ownership;
Schur identities versus classical characters; the bounded-tableau/GT dictionary;
and the complex bilinear-form/Brauer convention. They are referenced, not copied,
rewritten or assigned a new review verdict. In particular, no opposite
whole-layer Young-image edge is introduced and no full Spin branching theorem is
inferred from a statement about fundamental spin modules.

## Four ownership proposals and exact remaining mathematics

### Rational representations: keep one general carrier

Keep R1's coordinate-Hopf comodule framework. C0 owns the comparison to the
concrete C-point action and coordinate-entry predicates, including basis
independence. It must distinguish polynomial matrix coefficients from rational
ones, and rational representations from arbitrary abstract representations.
Only after this comparison can R6's comodule splitting be transported.

### Disconnected orthogonal groups: repair the Clifford generality

InductionRestriction Layer 5 explicitly assumes **finite G**, a splitting field
and the group-order invertibility hypothesis. That theorem cannot directly be
applied to the infinite group O_n(C) merely because O_n(C)/SO_n(C) has order two.
No such dependency edge has been emitted.

The reusable mechanism is the isotypic/inertia/extension argument. Either give it
a finite-index normal-subgroup version under an explicit semisimplicity of
restriction hypothesis, or own the index-two algebraic version in C3. The C3
application must prove rationality of the extension and induction, treat an
invariant SO constituent and an exchanged pair separately, track the determinant
twist, and handle small ranks. A new session cannot discharge this by citing
finite-group Maschke.

### Weyl formulas: preserve the abstract/concrete boundary

L6 owns the formal character identity and abstract dimension product. C4–C5 own
torus evaluation, identification of group and differentiated weight spaces,
the central Laurent/determinant twist, and the explicit classical/hook-content
calculations. Preserve coroots and work in Q before identifying the product with
a natural-number dimension. Keep combinatorial Schur identities with SchurWeyl.
This is a `keep` boundary, not a proposal to merge the entire roadmaps.

### Enveloping centers and GT bases: specify the missing reductive interface

L7's semisimple Harish–Chandra theory and L9's reductive split do not yet state a
complete named polynomial-center API for U(gl_k). Allocate that general
construction to one LieHighestWeight owner: identify the scalar polynomial
factor, include k=1, choose the degree-1 through degree-k generators, and pin
ordinary versus rho-shifted/dot-action conventions before transcribing eigenvalue
formulas. C6 owns the nested embeddings, commuting GT subalgebra, pattern
spectrum and basis.

The L7→C6 link supplies a precise ingredient: for k≥2, the semisimple central
character determines the dominant sl_k highest weight; adding the identity-matrix
eigenvalue determines the gl_k tuple in characteristic zero. It does **not** say
that one Casimir separates all irreducibles, nor that this proves the explicit
Capelli formulas or simultaneous diagonalization.

Canonical GT lines are not canonical nonzero vectors. A normalization condition
using only a contravariant form leaves v and −v indistinguishable. Specify a
highest vector and compatible lowering/transition scalars before exporting a
particular `gtBasis`. Keep integer patterns with negative entries; only the
polynomial specialization has the bounded-tableau interpretation. The
symplectic restriction must retain its own multiplicities: restricting the
standard Sp4 module to the standard embedded Sp2 gives its standard module and
two trivial lines, so a blanket GL-style multiplicity-free claim would fail.

## Rejected apparent consumers and comparison tests

Integral Weyl/dual-Weyl modules, good filtrations and mod-p linkage in
LanglandsParameterStacks LP3 and PotentialAutomorphyInfrastructure PA.1 are not
consequences of complex semisimplicity. ArithmeticGaloisRepresentations G7 and
compatible-system operations need finite-projective coefficients, continuity
and their local arithmetic comparisons. Automorphic bundles and raw cohomological
projectors retain their geometric/coefficient owners. BorelRegulators R.3 needs
compact-dual cohomology and fibrations, not the classification of finite-dimensional
classical representations. Derived exterior powers, symmetric powers of schemes,
Schur complements, Gelfand triples and the newly published Gelfand stacks/rings
are different objects and create no edge here.

The new Habiro definitions screened at the final revision are AnalyticHabiroStack,
AnalyticStacks, QWittVectors, RingStacksAndTransmutation and SolidAnalyticRings.
Their summaries, stage texts and relevant matches give no new classical-group
interface. The sixth new definition, MordellLawrenceVenkatesh, was included in the
original full-world screen.

Acceptance checks recorded for the next mathematical worker are the actual
rational/comodule comparison; GL1 determinant powers of negative exponent; the
n=0 empty-tuple case without evaluating a nonexistent last coordinate; restriction
of GL2 weight (m,0) to sl2's V(m); SO versus Spin descent; both index-two orthogonal
cases; and the GT pattern counts for (2,1,0) and its determinant shift (1,0,−1).
These are tests of the interfaces, not new claims of Lean implementation.

## Validation and source-readiness boundary

Executed the repository's unmodified validator on the final complete world:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.json
```

Result: **12 links, 4 overlaps, 217 examined; 0 errors, 0 warnings; exit code 0**.
The same validator had also passed the ten-link checkpoint and the pre-refresh
212-entry packet. Additional independent Python checks confirmed:

- all 24 quotations are literal substrings of the named Markdown files;
- all 217 examined roadmap IDs are distinct;
- no proposed pair duplicates another proposed pair or an atlas/15-packet edge;
- the entire union graph is acyclic: Kahn elimination removed all 1,568 non-isolated
  vertices, not just the new edges.

These are structural and provenance checks, not proof of mathematical correctness.
The PR workflow is expected to run its own checks; its result must be reported
separately from these local runs. No git command was executed and only the two
owned outputs are proposed for the branch.

Primary sources for this job are the roadmap documents and stage descriptions.
ClassicalGroups, ReductiveGroups and LieHighestWeight were read at contract level,
with neighbouring induction, root, Schur, spin, compact and Lie-group interfaces
examined as described in the packet. External books and their theorem-number
locators were **not** independently checked, and no such verification is claimed.
A reviewer should independently check the twelve matching contracts, the four
ownership proposals, and the coefficient/connectedness/central-character limits.
Integration and approval remain with the maintainer/orchestrator.
