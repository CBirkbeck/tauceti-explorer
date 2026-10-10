# PKG-ArithmeticQuantumTopology — scalar-balanced tensor checkpoint

Worker: Codex, session `codex-qnYP5h`, issue #7889, 2026-10-10.
Branch: `codex-qnYP5h-arithmetic-quantum-topology`.
Starting explorer commit: `cf44bf85f3f8dc2053dc0701d0b88b361a18b7c3`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6098434632).
None of the manager-priority issues was available; WORKERS' fallback selected
this eligible focus package. Only #7889 was claimed.

## Result and scope

**Blocked checkpoint; the package is incomplete.** This session extends the
concrete generic quotient in QT.4 with the actual quadratic scalar extension,
the generated even subalgebra, and scalar-balanced tensor components, including
the empty tensor. It does not close the geometry specification gap or complete
all targets of the accepted plan.

Changes are restricted to the package README, Suggested.lean and this handoff.
The accepted packet, reader and source suggested file are untouched.
`metadata.toml` remains absent deliberately: `issues.deliverables_complete`
checks existence of every package output, and adding the last path would mark
this partial package complete. The intended final metadata is
`topic = "math.GT"`; add it only when the package meets the whole job.

## Added interfaces and tests

The additions are in `TauCeti.QuantumTopology.GenericQuantum`, after the
existing word/component grading and before `end GenericQuantum`.

- `scalarPolynomial` is X²−q over Mathlib's `RatFunc ℂ`; `Scalars` is
  `AdjoinRoot scalarPolynomial`. The field instance uses the stated
  irreducibility of this concrete quadratic, not a supplied arbitrary field.
- `scalarV_square` derives v²=q from `AdjoinRoot.eval₂_root`.
  `scalarBasis` reindexes Mathlib's monic quadratic power basis to `Fin 2`.
  Its two basis evaluations have proof bodies. `scalarComponent` gives the
  ℂ(q)-spans of 1 and v. `scalarV_not_even` uses basis coordinates to exclude
  v from the neutral span.
- `v_central_all` proves centrality for every quotient element by
  `FreeAlgebra.induction` and quotient surjectivity. `scalarToCenter` uses
  `AdjoinRoot.liftAlgHom`; `scalarMap` composes the center inclusion.
  The induced scalar algebra and `IsScalarTower` make the generic quotient
  an algebra over the concrete ℂ(v) field. `scalarMap_v` has a proof body.
- `evenAlgebra` is the `Algebra.adjoin` over that field of E_i, F_i K_i,
  K_i² and K_i⁻². `evenAlgebra_components` identifies its restricted
  ℂ(q)-module with the sum indexed by `QuantumParityGroup.evenSubgroup`.
- `TensorPower n` is native `PiTensorProduct Scalars` of n quotient
  algebras. `tensorEmptyEquiv` identifies n=0 with `Scalars`.
  `tensorDegree` multiplies the factor inclusions in the existing quotient
  grading group. `tensorComponent` spans pure tensors of homogeneous
  factors over ℂ(q); n=0 transports the two scalar components.
  These are not ℂ(v)-submodules: multiplication by v changes the component.
- `tensor_shared_v` proves that two factor algebra inclusions send v to
  the same tensor using `AlgHom.commutes`. Central sign identification is
  therefore supported by the actual balanced tensor product.
  `tensor_components_internal` and `tensor_components_mul` state the
  internal decomposition and homogeneous-product law, with diagonal 2,
  nonpositive off-diagonal, positive d and symmetric d*A hypotheses.

There are exactly six new admissions: quadratic irreducibility, scalar
internality, scalar product closure, the even-algebra comparison, tensor
internality and tensor product closure. The new definitions and other proof
bodies are explicit. The algebra and tensor results still rely on admitted
mathematics; this is a suggested specification, not an implemented theorem.
`#print axioms` lists no `sorryAx` for `v_central_all`. It does list `sorryAx`
for the scalar basis/equation/nonmembership and scalar/tensor map proofs,
because Lean's chosen scalar field instance depends on the admitted quadratic
irreducibility. Do not describe these as independent formalizations.

The regression examples include neutral 1, odd v, v²=q neutral but v not
neutral; the same odd inclusion and neutral exclusion for empty tensors;
shared v in two factors; and membership of E_i, F_i K_i and K_i² in the
actual even algebra. All examples have proof bodies. The README documents
these choices, APIs, tests and source locators. Introductory and generic
presentation prose was condensed to remain below 200,000 bytes; all target
headings, anchors and accepted API/test names remain.

## Source and library receipts

Kazuo Habiro and Thang T. Q. Lê,
[Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2),
was read at §3.3.2, p. 39 (Proposition 3.3 and even generators), §§6.1–6.2,
pp. 68–70 (central grading group and Proposition 6.2), and §§6.2.1–6.3,
p. 70 (balanced and empty tensor gradings and structure-map consumers).
The public PDF SHA-256 agrees with the accepted source receipt:
`234eae71d85a7b282e9b197ae505edb804d631fe6c33b3d641425de0dc9ae490`.
Repository statements are in our own words; no passage or restricted file was copied.

Source clarification for the next worker: §6.2.1, p. 70, gives the two
empty-product components over ℂ(q). The parenthetical empty-product display
in §6.2.2 instead uses the larger scalar field; taken literally it merges
the components and contradicts that decomposition. The new interfaces use
the coherent two-component ℂ(q) interpretation. The accepted packet's
`sourceIssues` was not edited because this package job does not authorize it.

Two upstream READMEs were read in full: GeometricTopology and
RepresentationTheory/RootSystems. Their suggested interfaces and relevant
current Tau Ceti declarations were inspected. No general quantum scalar/parity
implementation or GeometricTopology Part II supplier contract was found.
The reviewed library audit has 1,316 layers, no direct QT/GT entry and five
completed IntegralLattices entries; existing lattice work remains imported.
This is a focused dependency check, not a fresh exhaustive library audit.

Pinned Mathlib declarations inspected for these additions include
`AdjoinRoot.eval₂_root`, `liftAlgHom`, `powerBasis'`,
`Polynomial.monic_X_pow_sub_C`, `natDegree_X_pow_sub_C`,
`Submodule.mem_span_singleton`, `PiTensorProduct.isEmptyEquiv`,
`PiTensorProduct.singleAlgHom` and `RingQuot.mkAlgHom_surjective`.

Read-only revisions checked: TauCetiRoadmap
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The managed check uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and baseline Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No upstream tree was edited or built.

## Blocker and where to resume

The accepted plan's `ArithmeticQuantumTopology/G1` assigns the framed
multi-link and ordinary surgery/Kirby contracts to GeometricTopology,
Part II. Fresh checks of current GeometricTopology layers 4 and 5 show framed
presentation and filling targets, but no exact H₁/linking-matrix theorem,
ordinary Kirby/Fenn–Rourke calculus or stable-form geometric realization
contract. No corresponding Part II packet/roadmap was found. Current Tau Ceti
has smooth disjoint link embeddings, framed braids and torus H₁/slope
coordinates; its Markov relation forgets framing and its DehnSurgery module
is a slope interface rather than the filled-manifold construction.

This is an absent supplier specification, not a wait for an implementation.
PROTOCOL §§15 and 20 require importing the owner's target and preserving the
accepted plan; #7889 forbids packet edits. Completing the package by making
up a private carrier or moving the ordinary geometry here would violate
those instructions. The maintainer must reconcile ownership or supply the
missing Part II contract before the full package can be completed.

The needed supplier outputs are:

1. Layer 4/Part II: framed oriented labelled multi-links/tangles, pairwise
   linking, Seifert framing and framing-preserving presentation comparison.
2. Layer 5/Part II: actual filling at fμ+λ, H₁≅coker A, determinant/IHS
   criterion, ordinary Kirby/Fenn–Rourke calculus, and realization of stable
   unimodular-form moves with explicit slide bands.

Then instantiate QT.0's existing matrix/cokernel transport on genuine
geometric data and state QT.3's JM comparison on its resulting manifolds.
For independent quantum work, the next useful lane is the normalized d/root
adapter and generic-to-h-adic/PBW/core comparison. Use the present scalar
algebra and native tensors for those comparisons, retaining the six stated
proof obligations. Total-G module degree and multiplication are distinct
from the product-group algebra grading when G is noncommutative.

All eight accepted gaps and nineteen requests remain open. A text screen
finds 131 of 220 unique API names and 82 of 167 unique test names absent from
Suggested.lean. These are search leads, not mathematical completeness counts;
renamed statements need semantic checking. All these names occur in README.
The checker counts 206 API entries and 159 tests in its own validation scope.

The inherited eight-layer worklist, quantum PBW/core obligations, QT.7
ledger/native-sum progress and earlier source receipts remain in the immutable
[predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/cf44bf85f3f8dc2053dc0701d0b88b361a18b7c3/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md)
and its linked predecessors. Their historical checks are not this session's checks.

## Validation

- Full `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, zero errors, 639 warnings, all `declaration uses sorry`, no other warnings.
- Isolated scalar/parity diagnostic with the seven axiom inspections:
  exit 0, twelve `sorry` warnings, no other warnings/errors. Its six inherited
  admissions and six new admissions are explicit above.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  zero errors/warnings; 106 nodes, eight planned stages, zero closed,
  eight gaps and nineteen requests. This does not certify package completion.
- All 118 headings and 114 anchors agree with the starting README. Every
  accepted API/test name remains in it. README size: 199,973 bytes.
- Accepted packet SHA-256 remains
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverable paths: zero problems. `git diff --check` passes.

Compilation used the shared pinned build sequentially with 103–104 GB
available; no build/update/cache command or language server was started.
Continuation depends on the saved deliverables and linked handoff, not scratch.
Submit this checkpoint and stop; claim no second job.

Final package SHA-256 receipts:

- README.md (199973 bytes): `57d96a434c228eaf8c7b0253acd6a11e7ee1ec5b09777668875976f0b04a09c8`.
- Suggested.lean (281204 bytes): `40b4848ebe82cb6d76b6ecb3f1698f0226723d18cfaa3f2433c8b080e3338346`.
