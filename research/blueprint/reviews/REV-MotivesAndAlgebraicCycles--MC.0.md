# Independent review of MC.0

**Accepted after corrections, 19 October 2026.** Reviewer: Codex,
session `codex-vmQphu`, job `REV-MotivesAndAlgebraicCycles--MC.0`, issue #10799.
The planning author was the different session `codex-Bsi10n`.

This verdict accepts the target-level planning pass in the
[packet](../packets/MotivesAndAlgebraicCycles--MC.0.json) and synchronized
[reader](../readmes/MotivesAndAlgebraicCycles--MC.0.md). The packet remains
`complete`, and MC.0 remains `planned`, with three gaps and eight supplier
requests. It is not closed coverage or a claim of implementation. The issue's
embedded seven-stage brief is context: its deliverable filenames and packet
scope identify MC.0 alone. No MC.1–MC.6 review is claimed.

## Inventory and verdicts

The packet has fifteen new nodes: three definitions, five theorems, two
comparisons, two constructions and three applications. Its nineteen exact
imports bring the reader to 34 targets: six definitions, eight constructions,
eight theorems, seven lemmas, two comparisons and three applications. The
new nodes have 35 API items and twenty unit tests; the full inventory has
84 API items and 51 tests. All definitions and constructions have at least
three tests. Six imported planets remain; none was added.

Every local node has an individual verdict in `review.checked`. The following
table records the main mathematical checks; identifiers are suffixes of
`MotivesAndAlgebraicCycles:MC.0/`.

| Target | Verdict and decisive check |
| --- | --- |
| algebraic-equivalence | Verified: integral refined-fibre subgroup over the ground field; characteristic-zero coefficients are its linear span. Marked points and geometric base change remain distinct. |
| algebraic-equivalence-adequate | Verified: imported Chow interchange, product and base-change laws preserve families and their differences; the adequate-quotient construction is reused. |
| curve-parameterisation | Verified: ACMV Lemma 2.8, Proposition 2.10 and the smooth projective zero-cycle case of Proposition 2.11, pp. 6–8, justify the stated field restrictions. |
| algebraic-implies-homological | Corrected citation: curve parameterisation and the actual classical Weil axioms give equality of the two parameter-point classes and hence equality of fibre classes. |
| equivalence-quotient-comparisons | Corrected source match: the forward chain follows from the preceding inclusion and trace-degree, followed by quotient universal properties. No reverse comparison or independence of the selected theory is inferred. |
| universal-ch0-support | Verified: every algebraically closed extension has a possibly different support. Fixed support over every field extension is separately defined and stronger. |
| diagonal-decomposition | Verified as a fixed-support statement: finite descent, transfer and right-exact localization give the multiplier and the specified two supports. The varying-support adapter remains G1. |
| cohomology-sheaf-correspondence-action | Corrected support API: the bidegree and twist agree with CTV Proposition 9.1; support factorizations use the actual projected images of individual cycle components. |
| supported-diagonal-vanishing | Corrected lifting and twist: degree-one strict transforms preserve the multiplier; the second-support intermediate twist is `A(w−d)`. Negative first degree and high nonequivariant sheaf degree give the two vanishings. |
| real-universal-surface-vanishing | Verified sourced target with explicit G1: BW Proposition 5.1(i) and rational regular-module splitting give the equivariant consequence of the nonequivariant vanishing. |
| low-degree-hypersurface-ch0 | Corrected source generality: acknowledged Roitman's global uncountability convention and explained why the finite special-line argument and Jacobian divisibility apply over every algebraically closed characteristic-zero field. |
| quartic-universal-support | Corrected source match to use that explained extension. The boundary `e=n=4` applies after each algebraically closed extension; an R-point is unnecessary. |
| intermediate-index | Verified: Kollár's support-dimension Euler ideal, zero-ideal convention and generator divisibility have the stated direction. |
| euler-characteristic-mod-index | Verified: effective flat families and lower-support dévissage give a congruence for ground-field algebraic equivalence, rather than an unjustified integer equality. |
| karpenko-quadric | Verified as a sourced target with G2–G3: the integral Euler lift and arithmetic continuous étale calculation remain explicit obligations. Rationalization loses the torsion counterexample. |

All nineteen imports were checked against their whole-roadmap specifications,
reader statements, API/tests and source locators. These are
`correspondence-group`, `correspondence-action-on-cycles`,
`correspondence-composition`, `composition-associative`, `graph-correspondence`,
`category-of-correspondences`, `correspondence-functor`,
`transpose-correspondence`, `graph-acts-as-gysin-and-pushforward`,
`tensor-of-correspondences`, `projective-line-idempotents`,
`pointed-curve-idempotents`, `adequate-equivalence-relation`,
`numerical-equivalence`, `correspondences-with-the-point`,
`composition-compatible-with-action`, `correspondences-of-disjoint-union`,
`tensor-interchange` and `graph-against-diagonals`. The graph orientation,
transpose degree `r+dim X−dim Y`, graph/diagonal degree `−dim Y`, and the
nontriviality condition on coarsest adequate equivalence all agree. Their
ownership and original nodes were retained without edits or duplication.

## Corrections made in place

1. Milne's short notes do not state the algebraic-to-homological theorem at
   the original locator. Replaced that attribution by Stacks Section 7,
   tags 0FGV–0FGW, pp. 14–16, and the explicit curve argument. Restricted
   the other Milne match to rational/numerical quotients and Section 6,
   p. 8, Conjecture D. Updated reading metadata and reader references.
2. A resolution of an arbitrary whole support need not lift every supported
   component. Applied ACMV's diagonal monograph, Lemma 3.1 and proof,
   pp. 15–16: replace the support by the actual projected image of an
   integral component, resolve that image, and close the transform over the
   birational isomorphism locus. Each component then pushes forward with
   degree one. A finite sum of these factorizations preserves the same N.
   Added this locator to the two consuming nodes and reader source entries.
3. Corrected the second-support intermediate coefficient twist from
   `A(d−w)` to `A(w−d)`, matching its degree `w−d` in the stated action.
4. Restricted R3's high-sheaf-degree vanishing to complex singular and
   nonequivariant semialgebraic cohomology. General equivariant sheaves
   need not vanish above the dimension in the presence of real points;
   BW Proposition 5.1(iv), pp. 64–65, supplies the boundary. The rational
   equivariant conclusion still uses the regular-module argument.
5. Added dimension at least one to R2's prescribed-point Bertini statement,
   as required by ACMV Appendix A, Theorem A.1, pp. 17–18.
6. Recorded Roitman's uncountability convention at p. 571 and supplied the
   reason the particular low-degree proof needs no such assumption. The
   special-line directions solve finitely many homogeneous equations, while
   multiplication on a curve Jacobian is surjective on points over every
   algebraically closed field. Synchronized the quartic citation.
7. Added independent verdicts to all six source issues and replaced the
   reader's pending-review descriptions. Added the packet's review object
   and linked this report from the reader.
8. The original ordering note incorrectly claimed that the full
   `MC.2/weil-cohomology-by-base-change` node had no MC.1 prerequisite; its
   list includes `MC.1/motives-universal-property`. Removed that broad
   prerequisite from the MC.0 comparison. Defined its geometric class-map
   kernel directly using the existing componentwise cohomology and algebraic
   field-extension nodes, whose prerequisites are early. Corrected the
   restructure proposal: assembly must separate this elementary formula
   from the full node's later realization construction. No supplier was
   changed or duplicate cohomology target introduced.

No new nodes were needed. No baseline citation was removed or replaced.
No verbatim `excerpt` field was present. The Suggested file needed no change.

## Baseline, suppliers and current ownership

Read all three actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Confirmed boundary |
| --- | --- |
| `AlgebraicGeometry.AlgebraicCycle` | Locally finite point functions with coefficients; no dimension-graded Chow quotient. |
| `AlgebraicGeometry.AlgebraicCycle.map` | Semiring coefficients, quasi-compact map and weight-conditioned residue-degree coefficients; not general Chow pushforward. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFiniteCodimensionOneCycles` | Native Weil divisors identified with finite integer cycles supported in codimension one; no higher intersection theory. |

Read the reviewed SF.5 coverage audit and the actual supplying statements for
SF.5 Chow operations, SF.3 curve models and Abel maps, SF.4 Bertini/resolution,
SF.2 coherent and Hochschild–Serre interfaces, SchemeKTheoryOperations S.3/S.7,
QuadraticFormInvariantsPartII Q2.2/Q2.4, EDC.3 cycle classes and the early MC.2
Weil interface. The requests extend these statements precisely: in particular,
codimension-filtered K-theory does not silently supply dimension-filtered G₀
on arbitrary proper schemes, and a discrete étale spectral sequence does not
supply the continuous integral ℤ₂ computation.

Also read the full nearby HodgeStructures and current JacobianChallenge
documents, and inspected current AlgebraicVectorBundles and
RealAlgebraicGeometry boundaries and Suggested files. Current TauCetiRoadmap
head was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti head
was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Their native bundle,
Picard/Jacobian and real algebraic interfaces are imported. They do not
provide the missing Chow or cohomology-sheaf theory. Nothing was run in the
read-only upstream environment.

## Source issues and reading scope

Read every source at its target locators, using the ten public sources and
version hashes in the packet. Karpenko's relevant scanned pages were checked
visually. Roitman's English text was read through the public publisher web
rendering; no local PDF hash or private-library reading is claimed. All
mathematical discussion here is in the reviewer's own words.

| Finding | Independent verdict |
| --- | --- |
| E48 | Confirmed: the CTV Lemma 9.3 final target must have base Y×Z. Both recorded preprints were collated; the journal PDF remains uncollated. |
| E49 | Confirmed: the projective-bundle basis ends at N−g, and dimension counting gives `W_j` dimension i+g+j. Present in the July revision, publisher HTML formula (3.2), and current author formula (3.6). |
| E50 | Confirmed: the projective-space diagonal needs the endpoint i=r. Present in the diagonal publisher and current author copies. |
| E51 | Confirmed: the printed effective family's marked fibre difference has the opposite sign. The proposed projection swap restores it in all three recorded versions. |
| E52 | Confirmed: multiplication by N requires the action of NΔ. Present in both diagonal copies. |
| E53 | Confirmed within the stated arbitrary-ring scope: cancelling N is invalid. For the recorded mod-two elliptic counterexample, a half of the generic point would give a rational self-map φ with `4·deg φ=1`; thus the nonzero degree-two class contradicts the claimed uniqueness for the zero strict decomposition. The N=1 consequence is unaffected. |

These are the six existing reports with independent reasons added, not six
new source findings. Existing whole-roadmap corrections E3, E6, E10 and E11
remain inherited. No new mistake in a source was found by this review.

## Follow-up and orchestrator decisions

The three open verification obligations are accurate and remain routed:

- **G1, R1–R3:** justify varying support over algebraically closed extensions
  and the proper-to-projective adapter in the real closed vanishing argument.
- **G2, R6–R7:** specialize the Clifford index and integral K-theory lattice
  lift to the explicit quadric, checking odd Euler characteristic.
- **G3, R8:** compute the integral continuous arithmetic Hochschild–Serre
  terms, differentials and extensions proving torsion-freeness in degree four.

R4–R5 additionally retain coherent Euler constancy and the curve/Jacobian
divisibility adapter. These are exact supplier extensions, not implementation
claims. Assembly should expose the early axiomatized Weil interface before
the comparisons, without importing the entire MC.2 realization stage.

The current upstream checkout lacks SchemeAndStackFoundations although the
status register records its package merged. The orchestrator should reconcile
the actual merged supplier package at assembly. No new ownership decision is
needed for this MC.0 review and no supplier files were edited.

Checked the three inherited red-team entries themselves. Their dispositions
are correct: RT-AREA-iwasawa-3/8 belongs to PS.2's Tate localization and the
MC.5–MC.6 category/torsor boundary; RT-AREA-algebraicgeometry/31 concerns C5
comparison edges into SF.6/MC.2; RT-AREA-geomlanglands/17 requires one relative
Tannakian reconstruction/recognition owner for MC.6 and GS4. None is an MC.0
target, and this acceptance does not mark those findings resolved.

## Validation

- `scripts/check_blueprint.py` with the configured pinned declaration index:
  zero errors, zero warnings.
- Source-issue schema and version checks: passed for all six entries.
- Inventory, reader concordance, API/test minimums and local dependency-cycle
  checks: passed; all 34 target specification headings occur once in the reader.
  The reader retains its equivalent complex elliptic numerical-equivalence
  test in place of the import's more specific rational example. Recursive
  node dependencies through the whole packet are acyclic and reach no MC.1 node.
- Intake file checks and `git diff --check`: passed.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.0.lean`:
  exit code zero, no warnings or errors; 76 GB available before compilation.
  The file has only the explanatory note and `import Mathlib`, with zero
  mathematical declarations or proofs. Elaboration therefore validates the
  import only. This follows the current WORKERS/UPSTREAM_GUIDE shape rule for
  targets lacking native carriers, rather than the issue's older prototype
  instruction.
