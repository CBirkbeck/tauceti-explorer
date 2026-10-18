# Independent review: FunctionFieldArithmeticPartII, GC.1

**Verdict: accepted at planned coverage.** Reviewed on 18 October 2026 by
Codex (GPT-6), session `codex-90LXMA`, independently of the planning session
`codex-B8iByz`. This reviews `BP-FunctionFieldArithmeticPartII--GC.1`, a
follow-up of `DESIGN-FunctionFieldArithmeticPartII`.

The packet contains 13 nodes: four constructions, seven theorems and two
comparisons. Twelve nodes are verified and one is corrected. No nodes are
added or removed. All 11 baseline citations are confirmed; none needs removal
or replacement. The four constructions have 21 API items and 16 unit tests,
four tests each. All ten parent GC.1 targets have explicit refinement coverage.

Acceptance concerns a completed target-level planning pass. GC.1 remains
`planned`, with four supplier requests and `GC1-NATIVE-GEOMETRY` open. No
implementation status changes and no closed coverage are asserted.

## Corrections made

1. **Ordered-inertia permutation compatibility.** The isomorphism from a
   multiplication kernel to all but one of its coordinates depends on the
   omitted coordinate. The old wording could suggest an ordinary permutation
   action on those remaining coordinates. The statement and proof now
   transport the distinguished index under reindexing, or use the conjugated
   action when keeping that index fixed. A three-factor check makes the
   distinction explicit: from the kernel tuple
   `((zeta eta) inverse, zeta, eta)`, exchanging factors zero and one acts on
   the retained pair by
   `(zeta, eta) mapped to ((zeta eta) inverse, eta)`.
2. **Suggested milestones.** Added `orderedInertia_reindex`, a statement over
   the native finite-product carrier, and clarified the distinguished-index
   convention in the kernel theorem's documentation. No geometric carrier or
   data construction is introduced.
3. **Source-issue verdicts.** Added this review's required `review` object to
   each inherited issue, confirming E2 and E5. Their original extraction and
   review credits remain intact. Updated the inherited-only convention to
   distinguish the original planning pass from this independent review.
4. **Reader alignment.** Mirrored the permutation correction and its check,
   described the added milestone, repaired malformed subsection locators and
   section-equation notation, and recorded the independent source-issue check.
5. **Review record.** Added all 13 node verdicts and the accepted review object
   to the packet. No targets, planets, requests or ownership boundaries change.

## Source and baseline checks

All eight source records and every node's locators and `match` were checked.
The principal source is the author-hosted published version of
[Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
*Annals of Mathematics* 189 (2019), 393–526. Its SHA-256 matches the packet.
The check covered A.1.1–A.1.5, Definitions A.1–A.3 and Lemma A.4, printed
pp. 514–517; A.2.1 and Lemma A.7, pp. 519–520; and the equation in the proof
of Lemma A.9, p. 521. E5 was also checked on the printed p. 515 page image.
E2 requires the full nilpotent root fibre rather than just its reduction;
E5 corrects the reference to the preceding global section. No new erratum or
independent correction search is claimed. No source passages are reproduced.

The numbered Stacks inputs were read directly:

- [44.3.1–44.3.6 and Remark 44.3.7](https://stacks.math.columbia.edu/tag/0B9C)
  for relative divisors, residual subtraction and ordinary ordering geometry.
- [101.37.1–101.37.5](https://stacks.math.columbia.edu/tag/0CL4), especially
  101.37.5(2), for the required properness conventions and permanence.
- [101.23.2–101.23.8](https://stacks.math.columbia.edu/tag/06PT) and
  [101.24.1–101.24.4](https://stacks.math.columbia.edu/tag/0G2L) for the
  nonrepresentable quasi-finite convention.
- [101.21.4](https://stacks.math.columbia.edu/tag/06MC) and
  [101.31.2](https://stacks.math.columbia.edu/tag/06UI) for the residual-gerbe
  input. The additional finite-type, zero-dimensional and algebraically
  closed hypotheses needed here remain explicit in the supplier request.

The baseline check read actual statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Ingredient group | Confirmed scope |
| --- | --- |
| `rootsOfUnity`, `restrictRootsOfUnity` | Native group and value-change maps; arbitrary commutative value rings suffice. |
| `Pi.evalMonoidHom`, `MonoidHom.finsetProd_apply`, `map_prod` | Evaluation products and their compatibility with homomorphisms. |
| `RootsOfUnityGroup.groupScheme`, `schemePointsMulEquiv`, `schemePointsMulEquiv_mapValue` | Native group-scheme points and algebra-map naturality in the recorded universe. |
| `AlgebraicGeometry.InvertibleSheaf` | Invertible sheaves with module maps; isomorphism arrows require the core. |
| `WeilDivisor.EffectiveDivisorOfDegree`, `equivSym_add` | Formal divisors on a type and addition compatibility, not relative symmetric schemes. |

The reviewed AUDIT-20 entry in `data/library-coverage.json` marks FA.1 partly
built and concerns arithmetic formal divisors and Riemann–Roch. There is no
Part II audit entry. Current Tau Ceti, at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, was searched and its relative
effective Cartier and rigidified Picard statements read. They do not replace
the relative root-stack targets here.

The read-only current TauCetiRoadmap check used commit
`0d144d044dacebca17b654695b6f1ad58f159b27`. The README and Suggested files of
[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/JacobianChallenge)
and [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles)
confirm the ownership of ordinary relative divisor/Picard geometry and
general tensor/pullback coherence. The pointed Jacobian goal is not silently
used as an unpointed stack interface. No upstream environment was built or
modified, and no restricted-library source was needed.

## Node verdicts

Ids below are relative to `FunctionFieldArithmeticPartII:GC.1/`; the packet
contains the fuller per-node reasons and locators.

| Node | Verdict | Principal check |
| --- | --- | --- |
| `relative-evaluation-equivalence` | verified | Objects, arrows, comparison isomorphism, inverse and coherent restriction adapter. |
| `effective-open-base-change` | verified | Geometric-fibre condition, Cartier divisors and nilpotent-section test. |
| `incidence-residual-equivalence` | verified | Scheme-theoretic residual construction, excess intersections and repeated support. |
| `evaluation-atlas-differential` | verified | Frame directions and zero-coordinate covectors; no factorial inversion. |
| `root-normal-crossing-chart` | verified | Prescribed coordinates, sign quotient and effective-open smoothness. |
| `root-coarse-chart` | verified | Invariants, arbitrary coefficient change and requested quotient properness. |
| `full-fibre-inertia` | verified | Full nonreduced fibre, reduced gerbe and distinct-branch inertia. |
| `addition-chart-map` | verified | Root-coordinate product, equivariance, nilpotents and tensor descent. |
| `ordered-inertia-comparison` | corrected | Distinguished-coordinate permutation convention and three-factor check. |
| `ordered-geometric-fibres` | verified | Orderings, relative kernels, residual gerbes and stack morphism properties. |
| `ordered-block-permutation-coherence` | verified | Imported coherent tensor comparisons, including empty blocks. |
| `refined-abel-jacobi-fibre` | verified | Fixed-object affine equation, possible emptiness and effective puncture. |
| `abel-jacobi-relative-compatibility` | verified | Four maps, coherent squares and degree-zero/nilpotent tests. |

## Closure, acceptance boundary and validation

All direct node references resolve. Traversing the current packet's
prerequisites through the available packet graph visits 171 nodes without a
cycle. The parent nodes and direct SF.0/SF.1/SF.3 supplier statements were
read. The four requests state the extra restriction, permanence,
curve-family and prescribed-coordinate contracts precisely; they do not
pretend that a nearby supplier node already proves them. In particular, a
section vanishing on geometric fibres need not factor through the zero
section on a nonreduced test scheme. The supplier's zero-section language
does not justify such a functor-of-points identification.

The layer adds one planet, **Ordered root divisors**, to the parent's five,
so the combined selection has six. There is no restructuring, tier move or
new duplicate owner. All construction APIs serve recorded uses, and their
tests distinguish plausible incorrect definitions.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.1.json`:
  **0 errors, 0 warnings**, with the available declaration index.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.1.lean`:
  **exit 0**, with exactly nine `sorry` warnings and no other diagnostics.
  The file has one real-bodied abbreviation, three admitted theorems and six
  admitted examples. Its omission ledger retains all 13 geometric targets,
  21 API items and 16 tests that require supplier carriers. Elaboration does
  not establish those geometric statements.
- `git diff --check`: passed.

There are no unresolved review questions for the orchestrator. Further
planning must adopt the four named supplier contracts and resolve
`GC1-NATIVE-GEOMETRY` before changing GC.1 to closed coverage. This review
does not require another pass on the mathematics already verified above.
