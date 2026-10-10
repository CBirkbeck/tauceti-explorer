# PKG-ArithmeticQuantumTopology — matrix slide checks and geometric blocker

Worker: Codex (GPT-6), session `codex-ZAnHpk`, issue #7889, 2026-10-10.
Branch: `codex-ZAnHpk-arithmetic-quantum-topology`.
Starting explorer commit: `9ee2eae115ed01bbcafc097221007c2be6760144`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6097495903).
None of the forty manager-priority issues was in the available listing.
WORKERS' eligible fallback selected this focus package among equal candidates.
Only #7889 was claimed.

## Result

**Blocked checkpoint; the package remains incomplete.** This run completes the
existing matrix slide proof, adds two proved negative controls, and updates its
README description. It independently confirms the accepted plan's missing G1
geometric supplier interfaces. The blocker is the package-only scope and absent
owner contracts, not elapsed time, a failed compilation, or a demand that all
upstream proofs be implemented first.

The accepted packet has 106 nodes, eight planned stages, zero closed stages,
eight gaps and nineteen requests. Its review retains the geometric gaps. The
package cannot state its actual link/filling targets faithfully against the
inspected owner interfaces. Issue #7889 prohibits packet edits and work on
other owners. PROTOCOL §§13, 15 and 20 require genuine signatures and shared
foundations at their owner; substituting matrices for actual filled manifolds
would leave the stated targets unfulfilled.

Only the package README, Suggested.lean and this handoff change. The accepted
packet is unchanged. Intended metadata is `topic = "math.GT"`, but metadata is
still absent: intake's deliverable-completeness check requires every output
path, and supplying that final path would classify this incomplete checkpoint
as a finished package.

## Completed matrix work

`LinkingMatrices.linkingMatrix_congr_of_handleSlide` is now proved without
`sorry`: for symmetric integral A and distinct i,j, P=I+E_ji has unit determinant
and the ii-entry of PᵀAP is A_ii+A_jj+2A_ij. Its determinant proof imports the
existing pinned Mathlib `Matrix.det_transvection_of_ne`, rather than planning
another determinant theory.

Three examples are fully proved:

- The zero-framed Hopf matrix acquires diagonal entry 2 under the specified
  slide, testing the sign and the cross term.
- The identity matrix I₂ is admissible, but its slide [[2,1],[1,1]] is not;
  an ordinary slide does not preserve the admissible class used by band slides.
- For nonsymmetric [[0,1],[0,0]], the new diagonal is 1 while the symmetric
  formula would give 2, testing the symmetry hypothesis.

An isolated diagnostic containing only transparent matrix definitions, this
proof and these examples passed with zero errors and zero warnings.
`#print axioms` reported only `propext`, `Classical.choice` and `Quot.sound`;
there is no `sorryAx` in the slide theorem. These are matrix-level checks, not
new geometric supplier declarations. The inherited native framing negative
control remains in the package unchanged.

The freely accessible Habiro paper, *Refined Kirby calculus for integral
homology spheres*, [arXiv:math/0509039v2](https://arxiv.org/abs/math/0509039v2),
was read at §1, Theorem 1.1 (p. 1287), §2.1 Definition 1 (p. 1289), §2.2
Theorem 2.1 (p. 1290), §2.3 Lemma 2.2 (p. 1291), and §5 Corollary 5.1
(pp. 1309–1310). The paper's congruence convention is φAφᵀ; the saved matrix
convention takes P=φᵀ. Chosen bands remain part of the geometric operation:
identical elementary matrix symbols need not determine identical links.
No source passages or restricted library files are included in this submission.

## Supplier verification

Read-only revisions inspected:

- TauCetiRoadmap main: `e255659f8eb50cd472809d9d565c8f755acffd84`.
- Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Managed baseline Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Managed Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

GeometricTopology's full README and Suggested.lean and the full
RepresentationTheory/SemisimpleAlgebras README were read. GeometricTopology's
suggested file has no active declarations for the required link, filling or
Kirby contracts. The reviewed library audit has 1,316 entries and no direct
ArithmeticQuantumTopology entry; that absence is not evidence of implementation
absence. Targeted library reads provide the actual evidence:

| Inspected interface | Supplied | Still required by G1 |
| --- | --- | --- |
| `KnotTheory/SmoothLink/Basic.lean`, `SmoothLinkEmbedding` | Finite labelled disjoint smooth circle embeddings | Global component framing, pairwise linking, framed presentation comparison |
| `KnotTheory/SmoothLink/Isotopy.lean`, `SmoothAmbientIsotopic` | One ambient diffeotopy transporting all components, with a setoid | Transport preserving the additional framing data |
| `KnotTheory/Markov.lean`, `FramedMarkovBraid`, `MarkovEquiv` | Component integer framings, and ordinary equivalence of forgotten braids | A framing-preserving relation and geometric comparison |
| `LowDimTopology/DehnSurgery/Slope.lean`, `BoundaryTorus.firstHomology`, `FramedBoundaryTorus`, `coord_symm_apply` | Actual torus singular H₁ with ordered basis and pμ+qλ coordinates | Link exterior/filling and its H₁ comparison; ordinary Kirby calculus |
| `Geometry/Manifold/TubularNeighborhood/NormalFrame.lean` | Local normal frames at immersion points | Global component framing and push-off/linking transport |
| `LowDimTopology/Plumbing/Homology.lean` | Homology of a lattice short complex over F₂[U] | Singular H₁ of the actual filled manifold |

The Markov relation was also checked at the exact baseline revision. It acts
on the forgotten braid; framing coefficients 0 and 1 on the same one-strand
identity therefore cannot be distinguished by that relation. Targeted searches
found no exact supplier for framed geometric transport, linking matrix,
Dehn filling, its H₁ comparison or Kirby equivalence. This is a focused check,
not a complete audit of current Tau Ceti. No GeometricTopology Part II packet,
reader or package exists in this explorer checkout. No read-only checkout was
modified or built.

## Exact restart dependency

The accepted packet already requests these contracts from the following owners.
No ownership moves were made.

1. `tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here`:
   finite framed oriented link/tangle presentations, Seifert framing,
   symmetric linking matrix with diagonal f_i and off-diagonal lk(L_i,L_j),
   and framing-preserving presentation comparisons. This feeds QT.0,
   QT.1's bottom tangles/RT functor and QT.2's geometric Jones comparisons.
2. `tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery`:
   actual oriented filling at fμ+λ, H₁≅coker(A), the integral-homology-sphere
   criterion det A=±1, ordinary Kirby/Fenn–Rourke moves, and realization of
   stable unimodular-form diagonalization by geometric moves. This feeds
   QT.0's surgery/admissible presentation and QT.3's homology-sphere invariant.

A common geometric presentation with coherent framing transport suffices;
an umbrella knot type or hub quotient is not required. Filling must yield
an actual manifold type with standard instances and orientation data, and
its comparison must use geometric equivalence. The slide's chosen band must
remain visible. QT owns the refined admissible band-slide/Hoste calculus.

The supplier contracts must be furnished, or the maintainer must reconcile
the authoritative plans' scope and ownership, before this package can finish.
Once available, instantiate QT.0's saved algebra on genuine links and fillings,
state the refined moves and unified invariant on those carriers, and complete
the remaining layers against their exact suppliers. Preserve the native
framing control. The full inherited eight-layer worklist, QT.7 ledger/native-sum
progress, other supplier requests and source receipts remain in the immutable
[predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/9ee2eae115ed01bbcafc097221007c2be6760144/research/blueprint/handoff/PKG-ArithmeticQuantumTopology.md)
and its linked older notes. Historical verification there is not claimed as
fresh work by this session.

## Validation

- Full `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0; zero errors; 628 warnings, all `declaration uses sorry`; zero other
  warnings. The isolated slide diagnostic also passed as above. All compiles
  finished; no session-owned compiler remains running. The managed shared
  pinned build was used, with no build/update/cache operation or language server.
  Available memory was 101 GB before the full check.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  exit 0, zero errors/warnings. Its 106 nodes include 24 comparisons,
  24 definitions, 27 theorems, 26 constructions, four lemmas and one application;
  206 API items, 159 tests, 36 planets and 24 baseline declarations.
- `python3 research/blueprint/intake.py check-files` on the three edited files:
  three files, zero problems. `git diff --check` passed.
- README: 199,950 bytes, below the 200,000-byte cap. Suggested.lean: 245,181 bytes.
  README headings and anchors are preserved. Metadata remains absent.
- Accepted packet SHA-256:
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
- README SHA-256:
  `43f1756e4e8e3ae2359fa93408589ec10781db1fc3843bdc224dc6d3739179eb`.
- Suggested.lean SHA-256:
  `e1a2f9b8e0523c3a99bc05f7d0e28b969274011c9b809ee42f4f118c4b992e27`.

Continuation needs only this note, its immutable predecessor links, and the
saved package/packet. No scratch file is required. Submit as a checkpoint,
stop after its pull request and claim no second issue.
