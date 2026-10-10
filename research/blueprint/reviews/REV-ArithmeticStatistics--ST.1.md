# Independent review of ArithmeticStatistics ST.1

Issue [#6311](https://github.com/CBirkbeck/tauceti-explorer/issues/6311), job `REV-ArithmeticStatistics--ST.1`. Reviewer: Codex, session `codex-w7B557`, 10 October 2026. The input was written by session `codex-22qwKl`; this reviewer did none of that work.

**Accepted after correction.** This is a complete target-level planning pass under PROTOCOL §0. ST.1 is planned, not closed. Its six precise gaps and four supplier requests remain necessary; acceptance does not claim their implementation or proof completion. Every node has an individual verdict and explanation in the packet's `review.checked` array.

| Item | Final count |
| --- | ---: |
| Nodes | 33: 7 definitions, 7 constructions, 15 theorems, 4 comparisons |
| Node verdicts | 23 verified, 10 corrected, 0 unverifiable |
| API items | 47, including 5 added |
| Discriminating examples | 44, including 2 added |
| Confirmed baseline declarations | 21, including 1 added |
| New nodes / planets | 0 / 0 |
| Recorded gaps / supplier requests | 6 / 4 |
| New source findings | 1 confirmed misprint |

## Corrections

1. `refinement-quartic-minors`: added determinant-weight row functoriality. This exposes the SL₂ invariance used in the fixed-label fibre, without unfolding the constructor.
2. `refinement-integral-quintic-realization`: corrected the common-isotropic-pair proof sketch to intersect the kernels of `vᵀA₂`, `vᵀA₃`, `vᵀA₄`. Published HCL IV Lemma13, p.85, instead prints indices1,2,3 after choosing `vᵀA₁=0`. New finding `ArithmeticStatistics/E727` records the rendered-page check, counterexample and repair. With A₁=A₂=A₃=0, A₄=e₁₂−e₂₁, v=e₁ and w=e₂, the printed intersection permits `vᵀA₄w=1`. The intended three remaining conditions leave dimension at least2. This is a misprint with no effect on the intended theorem. The nonétale rational descent and Lemma15 universal reduction calculations remain gaps.
3. `refinement-common-isotropic`: added **nonzero discriminant** to the finite-torsor and smooth-Fano assertions (BGW §4, pp.12–13). Distinguished rational subspaces are the K-points of a torsor scheme and can be empty. The coordinate definition still handles the zero pencil. Its geometric carriers are now linked to the recorded supplier gap.
4. `refinement-binary-form-order`: added the underlying-span and ideal-stability API. These connect the native subalgebra and submodule constructors to BGW §2, p.7, without assuming the finite étale algebra is a field.
5. `refinement-oriented-ideal-triples`: the Lean predicate now retains n≥3, the root relation and compatibility with the actual order basis. The degree-two rejection example catches silent natural subtraction in `n−3`; the missing negative-index ideal remains explicit.
6. `refinement-oriented-norm-pairs`: added actual algebra degree, n≥3 and separability to the Lean structure, and adjusted its constructors. Added extensionality and the non-example `L=K`, declared degree3: the norm equation alone cannot validate the wrong degree. Orientation remains actual scalar data.
7. `refinement-pencil-existence`: specified the augmentation as A⊕diag(1,0) and B⊕the rank-two off-diagonal form. Their signed determinant is f·y²; calling the whole augmentation a hyperbolic plane hid the distinction (BGW Theorems24–25, pp.14–16).
8. `refinement-q-hyperdeterminant`: added simultaneous SL₂ mixing invariance, needed when undoing the variable change in the odd weak lift (BSW II §3.2, p.9).
9. `refinement-one-matrix-slice`: extended the BSW I source range to printed p.11, where Theorem2.4 actually appears. The half-integral and quarter-integral domains remain unchanged.
10. `refinement-genus-one-stabilizer-schemes`: clarified that Aut(Jac(C)) means automorphisms fixing the elliptic origin. The full linear-group theta extensions remain separate from the invariant-fixed PGL₂ stabilizer (Bhargava–Ho Theorems4.1,4.5,4.11,4.14, pp.26–31).

No prerequisite or baseline citation was removed. All twenty original `checked` descriptions were corrected: the statements were independently read from git objects at the pinned commit, not inferred from the newer current checkout. `Module.Finite` and `IsDedekindDomain` are labelled classes. Added `Algebra.IsSeparable`, whose pinned statement expresses separability of every algebra element; finite-dimensionality and actual degree are separate requirements.

## Baseline, sources and scope

The declared pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All21 final citations are Mathlib declarations. Their module statements were read, including the default behavior of norm/trace outside finite free hypotheses, the native exterior-power maps, the exact matrix-to-linear-map convention, and the PID hypotheses of Smith normal form. None supplies a missing geometric orbit dictionary. The suggested file was elaborated in the existing build at the pinned Mathlib commit.

All seven independently downloaded public files match the packet's SHA-256 receipts exactly. The packet keeps the URLs, editions, hashes and mathematical locators; its review array states what was established for every target. The source versions used are:

| Source | Public version read |
| --- | --- |
| HCL III | [Published Annals 159 (2004)](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf) |
| HCL IV | [Published Annals 167 (2008)](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf) |
| Wood | [arXiv:1007.5501v2](https://arxiv.org/pdf/1007.5501v2) |
| Bhargava–Gross–Wang | [arXiv:1310.7692v2](https://arxiv.org/pdf/1310.7692v2) |
| Squarefree discriminants I | [arXiv:1611.09806v3](https://arxiv.org/pdf/1611.09806v3) |
| Squarefree discriminants II | [Author PDF dated 4 April 2025](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf) |
| Bhargava–Ho | [arXiv:1306.4424v1](https://arxiv.org/pdf/1306.4424v1) |

No agreement with unread published editions is asserted. The published HCL IV receipt is also in `sourceVersions` for E727. The search for an existing correction was limited to the atlas register, Annals article page and the recorded searches; no linked correction was located. Existing parent and routed-paper findings remain imports. In particular, HCL IV's finite geometric algebra-type statement is not treated as a finite list of rational isomorphism classes.

The reviewed `AUDIT-07` ST.1 entry does not provide these orbit dictionaries. Current Tau Ceti was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current TauCetiRoadmap at `81207c7f16d5abf770f13a7d2bdcdb465c030787`. IntegralLattices and OrthogonalSpinGroups own the generic lattice and orthogonal theory. PolynomialGaloisGroups Layer4 owns universal resolvent polynomials, which do not supply the integral sextic resolvent ring. No such theory was re-planned.

Supplier statements were checked in JacobianChallenge LayersA,D, EllipticCurves Layer7 and GeometryOfNumbersAndQuadraticArithmetic GN.2. Smooth Picard objects and general Selmer structures are useful inputs; they do not themselves supply the nodal Fano geometry, higher-genus two-cover torsors or theta-group descent. GN.2 is an exact request for integral ternary classification, not a claim that rational classification proves it. The six parent ST.1 planets are retained, keeping the layer within its existing limit. All new identifiers remain additive refinements of the accepted parent.

## Verification and orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.1.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ArithmeticStatistics--ST.1.lean`: exit0; 88 warnings, all `declaration uses sorry`; no errors or other warnings. Memory was checked first. Elaboration checks signatures and examples, not their proofs; implementation statuses remain unchecked.
- Every one of the47 API names and44 named test comments occurs in the suggested file. Each definition/construction has at least three discriminating examples.
- Independent exact-arithmetic calculations confirmed the sparse quintic coefficient, signed Q at g=1,2, the rational-completion |Q| counterexample, and the weak cubic examples at primes3,5,7,11. The source-index counterexample was also checked directly.

The separate [reader](../readmes/ArithmeticStatistics--ST.1.md) is not an output authorized by issue#6311 and was not edited. **Synchronize its common-isotropic paragraph, augmentation sketch, triple/norm-pair API, new API/tests and BSW I source range with this corrected packet before packaging.** This review's corrections supersede its earlier wording.

The orchestrator still needs to assign the geometric and group-scheme adapters, register the current upstream layer interfaces, and route the degree-two negative-index and even-q constructions. The six gap records specify the exact inputs and consuming nodes; no extra ownership move or second job was taken.
