# PKG-ArithmeticQuantumTopology — generic Serre algebra and grading checkpoint

Worker: Codex, session `codex-gwayaY`, issue #7889, 2026-10-10.
Branch: `codex-gwayaY-arithmetic-quantum-topology`.
Starting explorer commit: `eb32c2d3450f60e02c9a82733aa7e25339e2eb99`.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6098089475).
None of the manager-priority issues was available; WORKERS' fallback selected
this eligible focus package. Only #7889 was claimed.

## Result

**Blocked checkpoint; the package remains incomplete.** This session adds a
concrete generic Drinfeld–Jimbo presentation and actual direct-sum parity-grading
signatures. The full Suggested.lean elaborates. These refine
QT.1/general-drinfeld-jimbo-algebra and QT.4/general-parity-grading; they do not
discharge every target of those nodes or close the geometric gap.

Only the package README, Suggested.lean and this handoff change. The accepted
packet, reader and source suggested file are untouched. Metadata remains absent:
intake regards presence of all output paths as a complete submission, and this
submission is incomplete. Its intended content is still `topic = "math.GT"`.

## Added interfaces

All additions are in `TauCeti.QuantumTopology`, section
`GenericDrinfeldJimbo`, after `GeneralParityGrading`.

- `QuantumRationalFunctions` is Mathlib's `RatFunc ℂ`; `quantumQ` is the
  polynomial algebra-map image of `Polynomial.X`. `quantumGaussian` gives
  the Gaussian recursion.
- `GenericQuantum.Presentation` is `FreeAlgebra` on the existing v, vInv,
  K, KInv, E and F generators. `Relation` imposes both inverse laws,
  centrality of v and vInv, v²=q, commuting K's, positive E and negative F
  weight relations, the EF commutator and both quantum Serre sums.
  `Algebra` is `RingQuot` of those relators. No carrier, multiplication or
  relation-holding proposition is supplied as an arbitrary extra assumption.
- `binomial` expresses the symmetric coefficient as
  v^(-d*k*(n-k))*Gaussian(q^d;n,k); `serre` sums over s=0,...,r.
  The commutator coefficient v^d/(q^d-1) equals 1/(v^d-v^(-d)).
- `cartanOfBase` consumes `RootPairing.Base` with crystallographic input
  over ℚ. Mathlib puts the root in the row; this presentation puts the
  coroot in the row. The transpose is explicit. `algebraOfBase` retains
  a chosen d and does not manufacture root or weight lattices.
- `quotientMap`, `generator`, `v_square`, `K_E`, `K_F`, `E_F`,
  `serre_eq_zero`, `lift` and `lift_generator` expose the quotient API and
  universal map to an algebra satisfying every relator. All six named
  equation theorems have proofs from Mathlib's quotient API.
- `word`, `wordDegree` and `component` construct actual quotient monomials,
  product parity degrees and their ℂ(q)-linear spans.
  `general_parity_grading` states `DirectSum.IsInternal`, unit/product closure
  and generator membership under diagonal 2, nonpositive off-diagonal,
  positive d and symmetric d*A hypotheses. `parity_grading_unique`
  characterizes these components by the generator degrees. No grading is
  assumed in the presentation itself.

Exactly three additions use `sorry`: direct-sum grading, its uniqueness,
and the long-root binomial test. These are suggested theorem signatures,
not implemented results. The generic quotient does not yet supply
`DrinfeldJimboDatum`, the h-adic `DrinfeldJimboAlgebra`, `quantumPBWBasis`,
the generic-to-h-adic embedding, integral cores or an ℂ(v)-balanced tensor
grading. Those remain separate obligations.

Tests check the generic rank-one negative F weight, commuting E and F at
a_ij=0, and G₂ with coroot-row matrix [[2,-3],[-1,2]], d=(1,3).
Gram symmetry and its failure with d=(1,1) are proved by computation.
The long-root coefficient is stated as v³+v⁻³. The rank-one example covers
only the generic F-weight portion of `DJ_sl2_relations`, not the full
h-adic comparison. Both commuting tests use the actual Serre relators.
The README pins these conventions and the grading construction. Redundant
introductory and bibliography prose was condensed to fit 200,000 bytes;
all targets, headings, anchors, API/test names, authors, links and fixed
versions remain.

## Sources and library checks

Kazuo Habiro and Thang T. Q. Lê,
[Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2),
was read at §3.1, pp. 36–38 (presentations and quantum coefficients),
§6.1, pp. 68–69 (parity presentation), and Proposition 6.2 in §6.2,
p. 69 (existence and uniqueness of the grading). §§6.3–6.10 were also
inspected for structural, integral and tensor consumers. The fixed public
PDF SHA-256 agrees with the packet receipt:
`234eae71d85a7b282e9b197ae505edb804d631fe6c33b3d641425de0dc9ae490`.
Repository prose is our own; no source passage or restricted file was copied.

Current GeometricTopology and RepresentationTheory/RootSystems READMEs
were read in full, and their suggested interfaces inspected. IntegralLattices
and LieHighestWeight were inspected at relevant dependency boundaries.
The reviewed library audit has 1,316 layers and no direct QT or GT entry;
its five completed IntegralLattices entries are imported, not replanned.
Targeted current-roadmap/library searches found no general quantum Serre
algebra, quantum PBW basis or quantum parity implementation under these names.
This is a focused check, not a new exhaustive library audit.

Pinned Mathlib statements read before use include `FreeAlgebra.ι`, `.lift`,
`.lift_ι_apply`; `RingQuot.mkAlgHom`, `.mkAlgHom_rel`, `.liftAlgHom`,
`.liftAlgHom_mkAlgHom_apply`; the polynomial algebra map into `RatFunc`;
`RootPairing.Base.cartanMatrixIn`, `.cartanMatrix` and their orientation;
and `DirectSum.IsInternal` for submodule families.

Read-only revisions checked: TauCetiRoadmap
`a7712b2de0fbbe57dc06903169fe84cc69cf71ab`; current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The managed build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and baseline Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No upstream tree was edited or built.

## Blocker and restart

G1 was checked afresh. GeometricTopology layer 4 plans framed presentations,
and layer 5 plans actual Dehn filling. Neither its README nor a
GeometricTopology Part II deliverable in this checkout specifies the entire
requested framed multi-link, surgery H₁, ordinary Kirby/Fenn–Rourke and
stable unimodular-form realization contract. Its Suggested.lean has no
compiled declarations. Current Tau Ceti supplies smooth disjoint link
embeddings, ambient isotopy, integer-framed braids and actual torus H₁/slope
coordinates. `MarkovEquiv` still forgets the framings. The only DehnSurgery
module is the slope interface, not a filled-manifold construction.

This is a specification/ownership blocker, not a demand for prerequisite
implementations before writing a roadmap. The accepted plan explicitly
assigns the missing ordinary topology to GeometricTopology Part II.
PROTOCOL §§15 and 20 prohibit duplicating that owner or silently changing
the plan; #7889 forbids packet edits. A placeholder manifold or new private
surgery theory cannot meet the required comparison.

The maintainer/owner reconciliation must identify or state:

1. Layer 4/Part II: framed oriented labelled multi-links/tangles, linking
   numbers, Seifert framings and framing-preserving presentation comparison.
2. Layer 5/Part II: actual filling at fμ+λ, H₁≅coker A, determinant/IHS
   criterion, ordinary Kirby/Fenn–Rourke calculus and geometric realization
   of stable unimodular-form moves, with explicit slide bands.

Then instantiate QT.0's existing matrix/cokernel transport on genuine
geometric data and state QT.3's JM comparison on the resulting manifolds.
For the independent quantum lane, next supply the normalized d adapter,
general h-adic presentation and quantum PBW/core comparisons. Use the
concrete components here for even-subalgebra and central-v-balanced tensor
grading. Do not replace them with arbitrary carriers or assumptions of the
desired theorem. All eight accepted gaps and nineteen requests remain open.

The inherited eight-layer worklist, QT.7 ledger/native-sum progress, QT.0
cokernel transport and earlier source receipts remain in the immutable
[predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/eb32c2d3450f60e02c9a82733aa7e25339e2eb99/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md)
and its linked predecessors. Their historical checks are not fresh checks
by this session. A fresh text screen finds 131 of 221 API names and 82 of
169 test names absent from Suggested.lean. These are search leads, not
mathematical completeness counts; renamed statements need semantic checking.

## Validation

- Full `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, zero errors, 633 warnings, all `declaration uses sorry`, zero other
  warnings. The integrated addition contributes exactly three admissions.
- The isolated presentation/parity diagnostic elaborates with its six
  expected admissions (three inherited, three new). `#print axioms` for
  `v_square`, `K_E`, `K_F`, `E_F`, `serre_eq_zero` and `lift_generator`
  lists only `propext`, `Classical.choice` and `Quot.sound`, no `sorryAx`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  zero errors/warnings; 106 nodes, eight planned stages, zero closed stages,
  eight gaps, nineteen requests. Packet status is not package completion.
- All 118 headings and 114 anchors match the starting README. All 221
  packet API names and 169 test names occur in it. README: 199,900 bytes.
- Accepted packet SHA-256 is unchanged:
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- `python3 research/blueprint/intake.py check-files` on the three changed
  paths: three files, zero problems. `git diff --check` passes.

Lean checks used the managed shared pinned build sequentially; available
memory was 97–99 GB. No build/update/cache command or language server was
started. No session-owned compiler remains running. Continuation needs the
saved deliverables and immutable links, not scratch. Submit this checkpoint
and stop; claim no second job.

Final package SHA-256 receipts:

- README.md (199900 bytes): `2fb76671923716f58a387c82b8703612ec09ac6e380ffd47e82cad68fd88f0cb`.
- Suggested.lean (270000 bytes): `24cbf7bdef1485d1bc70b585fb990da3cb8e91e13c1b8e1fa0adc04b062443eb`.
