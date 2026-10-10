# PKG-ArithmeticQuantumTopology — cokernel transport and geometric blocker

Worker: Codex, session `codex-AzrQ6v`, issue #7889, 2026-10-10.
Branch: `codex-AzrQ6v-arithmetic-quantum-topology`.
Starting explorer commit: `5cdfc20ff5997ed93a73fadb6310c5b00fab0451`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6097648913).
None of the forty manager-priority issues was available when jobs were listed.
WORKERS' fallback selected this eligible focus package. Only #7889 was claimed.

## Result

**Blocked checkpoint; the package remains incomplete.** This run proves the
existing matrix cokernel triviality criterion, constructs its unimodular
congruence equivalence, proves its representative formula and handle-slide
specialization, and adds five fully proved checks. The full suggested file
elaborates, with only the inherited admitted-proof warnings.

The substantive blocker is still G1's unresolved geometric supplier contracts
and the issue's package-only scope. This is not a request that all upstream
proofs be implemented before a roadmap can be written. The accepted plan itself
has eight honest gaps, nineteen supplier requests and no closed stage. Its
review identifies the framed multi-link comparison and actual filling/H₁/Kirby
interfaces as imports, with no alternate carrier defined here. The present
supplier README plans the geometric direction but its suggested file does not
provide the required signatures. There is no GeometricTopology Part II packet,
reader or package in this checkout that resolves these contracts. Inventing
local link/manifold placeholders or re-planning their owner would violate
PROTOCOL §§13, 15 and 20. Issue #7889 prohibits editing the packet or owners.

The blocker was checked against the current read-only libraries, rather than
inferred just from previous checkpoints. It is not elapsed time or a failed
compile. The permitted files cannot resolve the owner-level dependency. This
checkpoint preserves useful independent algebra without declaring G1 closed.

Only the package README, Suggested.lean and this handoff change. Metadata remains
absent, as in the inherited checkpoint: intake uses the presence of every
output path to distinguish complete submissions, and this is incomplete.
The intended metadata is `topic = "math.GT"`. The packet is unchanged.

## Completed algebra and tests

Within `TauCeti.QuantumTopology`, section `LinkingMatrices`:

- `linkingMatrixCokernel_trivial_iff` now has a proof: the quotient is
  subsingleton exactly when the matrix range is all of ℤⁿ, equivalently its
  determinant is a unit. It uses pinned Mathlib's quotient, range and matrix
  surjectivity results, rather than a new lattice or determinant theory.
- `linkingMatrixCokernelCongr A P hP` constructs an actual ℤ-linear equivalence
  from coker A to coker(PᵀAP). Only P is required to be unimodular; A need not
  be symmetric or nonsingular. The proof uses the linear equivalence Pᵀ on
  column vectors and im(AP)=im A.
- `linkingMatrixCokernelCongr_mk` proves the representative formula [x]↦[Pᵀx].
- `linkingMatrixCokernel_handleSlide` specializes this equivalence to
  P=I+E_ji for distinct i,j. Its conclusion is `Nonempty` of a genuine
  linear equivalence. It does not import the symmetry hypothesis that belongs
  only to the inherited diagonal-framing formula.

These refine the existing QT.0 surgery/cokernel and slide targets. No new layer,
planet, carrier or ownership move was introduced. They do not construct surgery
or establish geometric Kirby invariance.

Five checks are proved without `sorry`:

1. The rank-zero matrix has the empty congruence equivalence.
2. Identity transport fixes every quotient representative, for arbitrary A.
3. With A=diag(0,1), P=[[1,0],[1,1]], the constructed map sends [e₂] to [(1,1)].
4. For those same matrices, Pᵀe₂=(1,1) is a new relation, whereas Pe₂=e₂ is
   not in the new matrix image: all vectors in that image have equal entries.
   Thus omitting the transpose cannot even give a well-defined quotient map.
5. With A=[1], P=[2], congruence gives [4], whose image excludes 1. P is not
   unimodular, so dropping that hypothesis breaks the cokernel claim.

The isolated diagnostic passed with zero errors and zero warnings. Its
`#print axioms` for the criterion, congruence construction, representative
formula and slide specialization listed only `propext`, `Classical.choice`
and `Quot.sound`, with no `sorryAx`. Those print commands are not in the
package. Existing slide and native framing checks are preserved.

The README records the convention, representative API and negative controls.
Repeated QT.0 API/test prose was shortened to preserve the 200,000-byte bound;
all previous target headings, anchors, API names, tests and source locators
remain. No hypotheses were removed.

## Sources and existing interfaces

The publicly readable Habiro paper, *Refined Kirby calculus for integral
homology spheres*, [arXiv:math/0509039v2](https://arxiv.org/abs/math/0509039v2),
was read at §2.2, p. 1290; §2.3, Lemma 2.2, p. 1291; §3.1, Definition 3,
p. 1292; and §3.2, Lemma 3.1, pp. 1292–1293. The source writes φAφᵀ,
whereas this package takes P=φᵀ. Bands remain geometric data even if two
operations have the same elementary matrix. The cokernel equivalence is an
algebraic consequence of the congruence formula, not a theorem attributed
verbatim to Habiro. All exposition is in our own words. No restricted-library
file or source passage is included.

Pinned Mathlib statements inspected and used:

- `Submodule.Quotient.subsingleton_iff`, `Submodule.Quotient.equiv`,
  `Submodule.Quotient.equiv_apply`, `Submodule.mapQ_apply`
  (`Mathlib/LinearAlgebra/Quotient/Basic.lean`).
- `LinearMap.range_eq_top`, `LinearMap.range_comp`,
  `LinearMap.range_comp_of_range_eq_top`
  (`Mathlib/Algebra/Module/Submodule/Range.lean`).
- `LinearEquiv.ofLinearMap`
  (`Mathlib/Algebra/Module/Equiv/Basic.lean`).
- `Matrix.mulVecLin_mul`, `Matrix.mulVecLin_one`
  (`Mathlib/LinearAlgebra/Matrix/ToLin.lean`).
- `Matrix.isUnit_iff_isUnit_det`, `Matrix.isUnit_det_transpose`,
  `Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_mul`,
  `Matrix.mulVec_surjective_iff_isUnit`
  (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`).
- `Matrix.det_transvection_of_ne`
  (`Mathlib/LinearAlgebra/Matrix/Transvection.lean`).

The reviewed library audit has 1,316 layer entries and no direct
ArithmeticQuantumTopology or GeometricTopology entry. Its IntegralLattices
entries describe existing lattice/discriminant theory, which is not re-planned
here. Targeted reads of current IntegralLattices and its library found no exact
matrix quotient wrapper being duplicated; the generic quotient equivalence is
explicitly consumed from Mathlib. Missing audit entries alone do not certify
missing implementations.

Read-only upstream revisions checked:

- TauCetiRoadmap main: `e255659f8eb50cd472809d9d565c8f755acffd84`.
- Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Managed baseline Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Managed Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

GeometricTopology's full README and Suggested.lean and the full
RepresentationTheory/SemisimpleAlgebras README were read for the owner and
upstream style. Targeted current library reads confirm:

| Interface | What exists | G1 still needs |
| --- | --- | --- |
| `KnotTheory/SmoothLink/Basic.lean`, `SmoothLinkEmbedding` | Labelled disjoint smooth circle embeddings | Global component framing, linking numbers and presentation comparison |
| `KnotTheory/SmoothLink/Isotopy.lean`, `SmoothAmbientIsotopic` | One diffeotopy transporting all components, with a setoid | Transport of additional framing data |
| `KnotTheory/Markov.lean`, `FramedMarkovBraid`, `MarkovEquiv` | Integer component framings; ordinary equivalence of the forgotten braid | Framing-preserving relation and geometric comparison |
| `LowDimTopology/DehnSurgery/Slope.lean`, `BoundaryTorus.firstHomology`, `FramedBoundaryTorus.coord_symm_apply` | Actual torus singular H₁ and pμ+qλ coordinates | Link exterior, actual filled manifold and its H₁/Kirby comparison |

Focused searches in knot theory and low-dimensional topology supplied no exact
framed linking/filling/Kirby implementation. This is a focused dependency check,
not an exhaustive new library audit. No upstream checkout was edited or built.

## Restart after the blocker is resolved

The next worker needs the following already requested owner contracts, or a
maintainer reconciliation of the authoritative scope and ownership:

1. GeometricTopology layer 4: framed oriented link/tangle presentations with
   Seifert framing, linking matrix, and framing-preserving comparisons between
   presentations. This supplies QT.0, QT.1's bottom tangles/RT functor and QT.2's
   geometric Jones comparisons. A common genuine presentation suffices; a hub
   `Knot` type is not required.
2. GeometricTopology layer 5 or its Part II: actual oriented fillings at fμ+λ,
   H₁≅coker A, the determinant/IHS criterion, ordinary Kirby/Fenn–Rourke
   calculus, and geometric realization of stable unimodular-form moves.
   Filled manifolds must carry the ordinary topological/manifold instances;
   comparisons use geometric equivalences. Slide bands must remain explicit.
   QT owns refined admissible band slides and Hoste calculus.

Then instantiate the existing algebra on genuine supplier data, complete QT.0's
refined moves and presentation-existence targets, and state the unified
invariant on the resulting manifolds. Neither the new equivalence nor the
inherited framing regression discharges these geometric obligations.

The full inherited eight-layer worklist, other supplier requests, QT.7
ledger/native-sum progress and source receipts remain in the immutable
[predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/5cdfc20ff5997ed93a73fadb6310c5b00fab0451/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md)
and its linked older notes. Historical verification there is not claimed as
fresh work by this session. The eight packet gaps remain open.

## Validation

- Full `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, zero errors, 627 warnings, all `declaration uses sorry`, zero other
  warnings. The inherited total was 628; the criterion proof removes one.
  The isolated algebra diagnostic also passed as above.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  exit 0, zero errors/warnings; 106 nodes, 206 API items, 159 tests, 36 planets,
  24 baseline declarations, eight planned stages, zero closed stages,
  eight gaps and nineteen requests.
- `python3 research/blueprint/intake.py check-files` on the three changed files:
  three files, zero problems. `git diff --check` passed. README headings,
  anchors and previous API/test names were compared with the starting revision
  and preserved.
- README is 199,786 bytes; Suggested.lean is 249,397 bytes.
- Accepted packet SHA-256:
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- README SHA-256:
  `e4de95d6c7df803a904ad9281b9ba15b6c707a6ea2e571c48a7b282c874ed125`.
- Suggested.lean SHA-256:
  `64cee1daac2d848355e361f7514d84a5471512f750ab0066f481294347acce47`.

All Lean checks used the managed shared pinned build, with at least 97 GB
available before the full compile. No build/update/cache operation or language
server was started. Every session-owned compiler finished. Continuation needs
only the saved files and this note's immutable links; scratch can be deleted.
Submit as a checkpoint, stop after this pull request and claim no second issue.
