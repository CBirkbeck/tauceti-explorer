# PKG-ArithmeticQuantumTopology — confirmed geometric supplier blocker

Worker: Codex (GPT-6), session `codex-qtT0GU`, issue #7889, 2026-10-10.
Branch: `codex-qtT0GU-arithmetic-quantum-topology`.
Starting explorer commit: `bd62adda22331a1426e1fb48512837fe587e5cee`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6097338059)
was confirmed by the bot for this session. None of the forty manager-priority
issues was available in the two available-issue listings before the claim.
The initially available focus revision #6928 was claimed by another worker;
WORKERS' fallback ordering then selected this available focus package.
Only #7889 was claimed.

## Result

**Blocked checkpoint. The package is incomplete.** This submission changes
only this handoff. It independently checks the accepted G1 contracts against
newer read-only upstream and current library sources, reruns the packet and
whole-file elaboration checks, and verifies the inherited framing obstruction
in isolation without admitted proofs. The obstruction is a missing supplier
interface, rather than this run's time limit or a Lean error.

The accepted plan is a complete target-level pass with eight planned stages,
eight gaps and nineteen open requests; no stage is closed. Its independent
review explicitly retains the missing geometric contracts. Issue #7889's
statement that the plan is complete does not establish that those supplier
signatures exist. In particular, successful elaboration of the package's
matrix cokernel does not supply homology of an actual filled manifold.

The README, Suggested.lean and accepted packet remain unchanged. The intended
metadata is `topic = "math.GT"`, but metadata remains absent: the package is
incomplete, and `issues.deliverables_complete` first requires all output paths
to exist. Adding that last path would classify this checkpoint as a finished
package without resolving its omitted signatures.

## Fresh evidence

Read-only sources inspected:

- TauCetiRoadmap main at `e255659f8eb50cd472809d9d565c8f755acffd84`.
- Current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Baseline Tau Ceti declarations at
  `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib pin used by the managed elaborator:
  `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Read GeometricTopology and RepresentationTheory/SemisimpleAlgebras READMEs
in full, and GeometricTopology's entire Suggested.lean. The geometric roadmap
sets the required presentation/manifold conventions, but its suggested file
contains no active link, filling or Kirby declaration. No read-only checkout
was modified or built.

| Declaration actually inspected | What it supplies | Missing G1 interface |
| --- | --- | --- |
| `TauCeti/KnotTheory/SmoothLink/Basic.lean`, `SmoothLinkEmbedding` | Finite labelled disjoint smooth circle embeddings; empty and singleton presentations | Separate framing data with transport, oriented pairwise linking numbers, and framed presentation comparisons |
| `TauCeti/KnotTheory/SmoothLink/Isotopy.lean`, `SmoothAmbientIsotopic` | One ambient diffeotopy carrying every labelled component simultaneously, with its setoid | Framing-preserving transport of those geometric presentations |
| `TauCeti/KnotTheory/Markov.lean`, `FramedMarkovBraid`, `MarkovEquiv`, `MarkovEquiv.refl` | An integer framing on each permutation orbit; ordinary Markov equivalence on the forgotten braid | A relation retaining framings and a comparison with the geometric presentation |
| `TauCeti/LowDimTopology/DehnSurgery/Slope.lean`, `BoundaryTorus.firstHomology`, `FramedBoundaryTorus`, `coord_symm_apply` | Actual torus singular H₁ with an ordered basis; the class pμ+qλ in that basis | A link exterior, oriented filling, the filling's H₁ comparison, and ordinary Kirby/Fenn–Rourke calculus |

The Markov declarations were also read at the exact baseline commit. Targeted
searches across current Tau Ceti and upstream Lean files found no active
linking-number/matrix, Dehn-filling, Kirby-equivalence or framed geometric
transport declaration supplying these contracts. A corresponding baseline
search found only a Dehn-filling reference in the slope file's documentation.
No GeometricTopology Part II packet, roadmap definition or package exists in
this explorer checkout. These are targeted supplier checks, not a complete
library audit. The reviewed library audit has 1,316 entries and no direct
ArithmeticQuantumTopology entry; that absence establishes no implementation.

The package still has no active declarations named `linkingMatrix`, `surgery`,
`homology_surgery`, `isIntegralHomologySphere_iff` or `surgery_disjoint_union`.
The accepted QT.0 contracts and README require all five. The matrix predicates,
matrix cokernel and matrix handle-slide formula already saved in Suggested.lean
remain useful, but cannot instantiate those geometric declarations by themselves.

## Native negative control, verified again

The inherited `FramingChecks` uses the actual baseline `FramedMarkovBraid`.
The identity one-strand braid with coefficient 0 and with coefficient 1 has
the same forgotten braid; `MarkovEquiv.refl` therefore relates the forgotten
presentations. Their one-component coefficient matrices are [0] and [1],
respectively. `IsAdmissible` rejects the former and accepts the latter.

An isolated scratch diagnostic retained only the two transparent matrix
predicates and the native framing checks, with individual imports. It
elaborated with zero errors and zero warnings. `#print axioms` for both
`FramingChecks.framing_change_admissibility` and
`FramingChecks.admissibility_not_descends` reported only `propext`,
`Classical.choice` and `Quot.sound`, with no `sorryAx`. Thus forgetting framing
cannot serve as the required transport relation. No new mathematical target
or supplier theory was added to the package.

## Exact restart dependency

The accepted packet already assigns these interfaces to these owners. No
ownership was moved in this run.

1. `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`
   supplies framed oriented finite-component link/tangle presentations,
   Seifert framing, pairwise linking numbers and framing-preserving
   presentation comparisons. The linking matrix has diagonal f_i and
   off-diagonal lk(L_i,L_j), is symmetric, and is invariant under the chosen
   framed transport. This feeds QT.0's linking-matrix node and QT.1's bottom
   tangles/RT functor, then the geometric QT.2 Jones comparisons.
2. `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`
   supplies an actual oriented manifold filling at slope fμ+λ, its
   H₁≅coker(A) comparison, the integral-homology-sphere criterion det A=±1,
   ordinary Kirby/Fenn–Rourke moves, and stable integral-form realization.
   This feeds QT.0's surgery, ordinary moves and admissible-presentation
   existence, and QT.3's invariant on homology spheres.

A common geometric presentation and coherent framing transport suffice;
upstream does not require an umbrella `Knot` type or a hub quotient. Filling
must produce a manifold type with the standard Mathlib instances and
orientation data; comparisons use the corresponding geometric equivalence.
Handle slides retain their chosen band: equal matrix congruences do not
identify different geometric operations. QT continues to own the admissible
band-slide/Hoste refinements.

Issue #7889 permits only its package files and this handoff, prohibits packet
edits, and directs plan mistakes here. PROTOCOL §§13, 15 and 20 require the
actual plan signatures while retaining shared foundations at their owner.
Completing the absent geometric supplier here, replacing it by a matrix-only
carrier, or dropping its consumers would fail that scope. The supplier's
existing contract must be furnished, or the maintainer must reconcile the
scope/ownership in the authoritative plans, before this package can finish.

Once it is furnished, instantiate the saved QT.0 algebra on those
presentations/fillings, write the genuine refined-move and unified-invariant
signatures, and preserve the native framing negative control. Then complete
the remaining layers' interfaces and tests against their exact suppliers.
The full inherited eight-layer worklist, QT.7 ledger/native-sum progress,
seventeen other supplier requests and prior source receipts are preserved in
the immutable [previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/bd62adda22331a1426e1fb48512837fe587e5cee/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md).
That note also links the older detailed source and normalization receipts.
Historical checks are not represented as fresh verification by this session.
No source passage, restricted book or private source file was used here.

## Validation in codex-qtT0GU

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  exit 0, zero errors/warnings; 106 nodes (24 comparisons, 24 definitions,
  27 theorems, 26 constructions, four lemmas, one application), 206 API items,
  159 tests, 36 planets, 24 baseline declarations, eight gaps, nineteen
  requests, eight planned stages and zero closed stages. Packet unchanged.
- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, zero errors, 630 warnings, all `declaration uses sorry`, zero other
  warnings. Available memory was 94 GB before the check. Only the managed
  shared build was used, with no build/update/cache operation or language
  server. Elaboration certifies the signatures present, not the omitted ones.
- The isolated native framing diagnostic also passed as described above.
  Both checks finished; no session-owned compile is left running.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md`:
  one file, zero problems. `git diff --check` passed.
- README remains 199,935 bytes, below the 200,000-byte cap; Suggested.lean
  remains 243,907 bytes. Metadata remains absent.
- Accepted packet SHA-256:
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- README SHA-256:
  `1fc8c2e9efb5127db5233f0f0934572f00185b2cc5bd83ba83c22a5b88cf8f88`.
- Suggested.lean SHA-256:
  `5952e089688f85408096f962f3ef957e7d8b96e9e3b2e7b7360f3ea238b29110`.

All continuation material is here, in the linked historical note,
and in the unchanged mathematical files; no scratch file is required.
Submit this as a checkpoint, stop after its pull request, and claim no second
job. The issue's availability should be reconciled with the missing G1
supplier before another package run is assigned.
