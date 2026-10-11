# Independent review: topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-yGPDT3`, 11 October 2026,
branch `codex-yGPDT3-review-topology-6521`. The bot confirmed
[claim 6106562318](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6106563443).
This worker authored neither the original plans nor the fix under review.

## Verdicts and scope

Accept the Polylogarithms /7 ownership and geometric-input correction and
HabiroNahmSeries /11 export correction. Keep QSeriesPartitionsAndMockModularForms
**needs_changes**: /13's scalar owner split is correct, but its reader still
contradicts the packet's multiplier. Acceptance here concerns the assigned
fixes, not closure of these blueprints. All previous review objects, including
the preceding codex-yMAXQs review, are preserved in `reviewHistory`.

This is a **scope-blocked checkpoint**. The mathematical audit is complete,
but the requested scope clarification remains unanswered: the live issue names three packets and three suggested files,
whereas its queue job requires five of each. All eleven outputs exist, but
`issues.deliverables_complete` still returns false because
`Polylogarithms--P.2.json` and `ArithmeticQuantumTopology.json` carry their
previous full-plan reviewer IDs. The two bounded packet changes were prepared and validated read-only in
memory; the unchanged completion predicate returns true with just those two
objects supplied and all eleven outputs retained. Neither packet has been
edited without authorization. WORKERS requires “Edit only
the files the issue names, plus your own scratch space.” The issue's report
and its own handoff are authorized submission paths. No queue, issue body or
completion code was changed. Negative verdicts are valid completed review
outcomes; the discrepancy in editable paths is the completion blocker.

## What was checked

Read every assigned finding and verifier reason, and the entire
[round-four fix report](../redteam/RT-AREA-topology.fixes-4.md). The 27 dispositions
below assess the supplier changes and the consumer/upstream handoffs. Source
checks, API and test checks, and elaboration cover the contracts changed or
exported by this fix. The separately attributed full-plan audits remain in the
packet histories; this review does not claim a fresh audit of all 537 QSeries
nodes or all 106 QT nodes.

Read the current AlgebraicTopology and DifferentialGeometry README documents
in full, the relevant GeometricTopology sections and suggested contracts, and
the current Tau Ceti implementations named below. These sources were read
only. Existing upstream owners take precedence over absence claims in the
older atlas snapshot.

### /7: one volume formula, with an ordered geometric comparison

The P.2 volume node correctly imports GeometricTopology layers 7 and 8; QT.5
uses it for the manifold sum. The sources are
[Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
I.3 equations (3),(5), printed p. 11, I.4 equations (7)-(9), pp. 13-14, and
[Neumann v2](https://arxiv.org/pdf/math/0307092v2), Theorem 2.6 and section 3,
pp. 420-421. Their ordered coordinates require a comparison:

`rP(a,b,c,d)=(a-c)(b-d)/((a-d)(b-c))`,

`rQ(a,b,c,d)=(c-b)(d-a)/((c-a)(d-b))=1/rP(a,b,c,d)`.

Fresh exact rational-complex arithmetic checked all 24 orders of
`(0,1,-i,2)`, including `rP(b,a,c,d)=rQ(a,b,c,d)`. The displayed order gives
`rP=(1+i)/4` and `rQ=2-2i`. Bloch-Wigner inversion reverses the sign; a
first-two-vertex exchange also reverses signed geometric orientation. An
extra sign must follow from an actual region/orientation comparison.

The base packet and P.2 follow-up retain the missing canonical ideal region,
signed-sector integration and map-level regulator calibration. The analytic
sector integral is useful but does not construct the geometric carrier.
Current metric and volume suppliers should be imported. QT's
`QT.5/volume-and-chern-simons` explicitly uses the formula but lacks the direct
`Polylogarithms:P.2/hyperbolic-volume` prerequisite. That single edge is the
prepared mathematical correction. Keep QT needs_changes with G4/G5: extended
flattening data and a preferred extended lift do not follow from ordinary
Bloch/Suslin descent. Neumann's regulator is `i Vol - CS`; QT already records
the required comparison with `i Vol + CS`, including periods and representatives.

### /11: six exports, with formal, analytic and arithmetic boundaries

The checked exports are HB.4 `euler-maclaurin-with-remainder`,
`formal-gaussian-integration`, `radial-asymptotic-expansion`; HB.8
`fgi-collection`, `identification-theorem`; and HB.9 `module-membership`.
The HB.10 examples and non-consequence application name those contracts.

[Garoufalidis-Scholze-Wheeler-Zagier v2](https://arxiv.org/pdf/2412.04241v2),
section 2.5 equations (110)-(111), p. 28, requires a symmetric invertible formal
Hessian and a completion allowing cubic terms divided by the loop parameter.
Coefficientwise finiteness remains necessary. The real polynomial bracket at
h=1 is a narrower prototype. Theorems 3/5, p. 14, section 1.8, pp. 15-17, and
Theorem 8, pp. 35-36, retain the exact coefficient ring, auxiliary root-order
coprimality and integral unimodular B in the NZ dictionary. The export preserves
nondegeneracy, the quadratic coefficient extension, excluded primes, Kummer
choices and integral gluing. It supplies module membership, not scalar-ring
membership or knot presentation invariance. The identification-theorem p. 14
locator was already corrected by codex-yMAXQs; this worker verified and retained
it. Its reader still says p. 13 and needs separate synchronization.

[Garoufalidis-Zagier v1](https://arxiv.org/pdf/1812.07690v1), the analytic datum
on pp. 2-3 and Theorem 3.1 with equations (13)-(21), pp. 4-6, instead require
positive-definite rational Nahm data, radial approach, odd admissible root order,
branch choices and an all-orders remainder. The figure-eight matrix
`[[1,1],[1,1]]` kills `(1,-1)` and cannot use that theorem. A formal Hessian at a
chosen nonreal solution is a different input. Exact inversion of
`[[2,1],[1,2]]` confirms its mixed formal second moment `-h/3`. QT retains the
geometric identification and invariance work. All existing Habiro gaps remain.

### /13: scalar examples do not imply knot modularity

[Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf),
p. 2 and Examples 3-5, pp. 10-12, supports the weak scalar predicate and shared
examples. Example 5's discontinuous knot defect does not meet the real-analytic
scalar predicate. The eight supplier `uses` contracts correctly distinguish
QM.5's examples from QT.7's matrix and asymptotic laws. QT must also supply
color, orientation, root and normalization comparisons. Formal termination
and Habiro evaluation alone do not establish a radial limit.

[Lawrence-Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf),
section 3 Theorems 1-2 and the periodic mean-zero proposition, pp. 98-99, and
section 4, pp. 103-104, give the normalized WRT/false-theta and Eichler
comparison routes. Their general multiplier and finite-Weil obligations
remain explicit in the packet.

Freshly inspected rendered pages of
[Zagier, Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf),
section 6 equations (38)-(39), pp. 958-959, because extracted formulas are
corrupted. The packet and Lean signature correctly include their additional
negative-real-cut sign at `c=0,d<0`. At `-I`, epsilon is `-i`, the lower-boundary
weight factor is `i`, and the product is 1; naive inverse eta gives -1. The
reader's `QM.5/kontsevich-quantum-modular` theorem and ambient hypotheses
(lines 9069/9071 in this base) omit that correction. Its path is outside this
issue's editable list. Keep needs_changes until that discrepancy and the
full-plan concerns are addressed.

The checked cocycle API includes `epsilon(1)=1` and the common pole exclusions
needed for inverses and generator reduction. Exact finite sums independently
recover `F(1)=1` and `F(-1)=3`; these checks concern terminating values, not
analytic convergence. The full negative review by codex-jnfi6H,
`REV-QSeriesPartitionsAndMockModularForms~2` (#6469), remains preserved,
including no-ghost, general alternation/invariant forms, Serre/radical,
quantitative Stirling and exact supplier obligations.

## All assigned findings

Accepting a handoff approves its owner and required contract; it does not
establish the missing mathematics. Upstream notes remain maintainer work.

| Finding | Assessment |
|---|---|
| /1 | Accept the GT 1/4/5 and framed-diagram inputs. Framed tangles, realization, linking-matrix transformations and stronger surgery calculus remain explicit extensions. |
| /2 | Accept the admissible-surgery handoff. Habiro v1 section 9.2 Theorem 9.4, p. 34, and section 10 Theorems 10.1-10.2, p. 35, use algebraically split ±1-framed links and Hoste moves; arbitrary Kirby moves leave this class. |
| /3 | Accept the named quantum inputs after braided/rigid/Hopf foundations: the h-adic ribbon algebra, even integral completion, bottom tangles, pairing and twist still need their construction. |
| /4 | Accept explicit rank-one scope or a general-Lie-type quantum-group/root-order supplier. A rank-one theorem cannot support the general target. |
| /5 | Accept with a current-library qualification: the Jones/Markov trace now exists. Import it and prove the variable, framing, mirror, color and root normalization comparisons retained by G3. |
| /6 | Accept the P.1/P.2 analytic/regulator and V.3/V.4/V.6 group/comparison owners. QT.0 and V.5 require a named use before becoming prerequisites. |
| /7 | Accept the supplier correction, with the missing QT direct prerequisite prepared. Retain the ordered carrier, orientation and manifold/incidence comparisons. |
| /8 | Accept the early geometry and later cusped-manifold extension order. Finite-volume completeness, ideal face pairings and cusped rigidity do not follow from closed Mostow alone. |
| /9 | Accept explicit extended relations, flattenings, Rogers descent and period/sign conventions. An ordinary Bloch or Suslin lift does not select the extended class. |
| /10 | Accept the integral/unimodular NZ dictionary and exact rooted-series/coefficient imports. Keep G6 and presentation-invariance obligations separate from the matrix recipe. |
| /11 | Accept the six export contracts and formal/analytic/arithmetic distinction described above. The consumer owns topological identification. |
| /12 | Accept the fixed-color Kashaev evaluation/lift handoff and explicit proven-case ledger. Keep each sourced limit separate from general conjectures. |
| /13 | Accept the scalar ownership correction. Retain QSeries needs_changes, its reader discrepancy and complete earlier negative review. |
| /14 | Accept the single formal-pentagon owner and the separate analytic Faddeev/AK obligations: domains, contours, convergence, operator/distribution contractions and admissible 2-3 analysis. |
| /15 | Accept sourced knot asymptotics with their actual proved/conjectural status and G8 phase tests. The fix excludes unsupported general resurgence. |
| /16 | Accept the Wheeler/MMR/relative-Habiro follow-up with Alexander and HR.1 inputs; the recorded Bouis-Gazda exclusion remains. |
| /23 | Accept the arbitrary-based-pair definition request, honest low-degree carriers and NDR restrictions on comparison results. Current AT stage 8 still restricts the definition and needs the maintainer note. |
| /24 | Accept the filtered-chain convergence/edge-map/naturality request. Existing spectral objects and page APIs do not provide those assertions without filtration hypotheses. |
| /26 | Accept named CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz suppliers, rather than implicit prerequisites. |
| /29 | Accept upstream coordination of AT dependencies and restructuring-dependent directions. Current explicit stage order is an input, not an atlas target to rebuild. |
| /33 | Accept relative extension only: pinned absolute homotopy maps and path-based basepoint change must be imported. |
| /81 | Accept with current DG 5.5 as the abstract corner-boundary/face owner. GT retains balls, handles, collars, gluing and corner-rounding comparisons. |
| /82 | Accept with current DG 3.3 supplying finite-dimensional connected boundaryless homogeneity. Supported ambient isotopy extension and gluing transport remain distinct requirements. |
| /87 | Accept a single surface/mapping-class owner, boundary connected sum and an actual triangulation or Morse supplier for Heegaard existence. |
| /91 | Accept maintainer repair of misplaced GT targets and dependency records; current GT 7 already imports Riemannian measure and Hopf-Rinow inputs. |
| /103 | Accept current DG 0-2/5 as the forms, derivative, orientation and Stokes owner. Keep regularity, compact support and outward-first signs. |
| /105 | Accept named Heegaard-triple, four-dimensional Spin-c/handle/intersection/signature and absolute rational-grading inputs. Correction terms retain rational-homology-sphere scope. |

The /2 check used [Habiro v1](https://arxiv.org/pdf/math/0605314v1), at the
specified theorem/page locators. It verifies the refined surgery hypothesis
and the route from twisting to presentation independence.

## Library evidence and verification limits

Read the reviewed P.2, HB.4/HB.8/HB.10 and QM.5 coverage entries (AUDIT-30,
AUDIT-14, AUDIT-15). Fresh statement reads at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` checked the 14 direct baseline
citations used by the exports: Bernoulli function/polynomials, trapezoid error,
big-O, power series, multivariable power series/polynomials, determinant,
special linear group, complex power, neighborhood analyticity, power-series
summability, primitive roots and periodic L-function. In particular,
`trapezoidal_error` is a definition, not the all-orders estimate;
`Asymptotics.IsBigO` at Defs.lean:85 is an eventual bound; and
`ZMod.LFunction` at ZMod.lean:85 needs nonzero modulus and is the continued
L-function rather than a divergent total Dirichlet sum.

Fresh additional pinned reads checked `Matrix.PosDef` at PosDef.lean:161,
`Abelian.SpectralObject` at SpectralObject/Basic.lean:41 and
`HasSpectralSequence` at HasSpectralSequence.lean:303. The latter governs
successive pages, not filtered-homology convergence.
At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, checked
`FramedOrientedPDCode` (PDCode/Basic.lean:129), `TemperleyLieb.jones`
(TemperleyLieb.lean:107), `multivariateGaussian_eq_withDensity`
(Gaussian/Density.lean:166), `HomotopyGroup.map`/`mapHom` (Map.lean:119/222),
`homotopyGroupMulEquivOfPath` (BasepointChange.lean:424) and `SmoothTwoForm`
(TwoForm.lean:60). Based maps require their point equation, group maps their
nonempty index, and basepoint change an actual path. The Gaussian density
requires positive-definite covariance; it is not a formal bracket theorem.

Current read-only upstream commit is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing
`MarkovBraid.jonesTrace` and `MarkovEquiv.jonesTrace_eq` (TemperleyLieb.lean:224/352)
include an unknot value equal to the loop value (line 288), so normalization
still matters. `UpperHalfSpace.riemannianMetric` and `isPretransitive_isom`
(UpperHalfSpace.lean:331/483) supply metric/homogeneity, with curvature -1
and completeness explicitly unproved. `riemannianVolume` at
VolumeDensity/Volume.lean:76 supplies a chart-glued measure under finite
dimension, C1, Borel/Lindelof and continuous-metric hypotheses. These do not
supply the canonical ideal tetrahedron or its signed volume comparison.
Current DG's form/derivative, corner-boundary, homogeneity and Stokes contracts
are the existing owners; its Stokes signature carries C1 compact support,
Hausdorff/sigma-compact smooth half-space hypotheses and outward-first
orientation. No upstream file was changed and no Lake command ran there.

Fresh packet validation returns zero errors and warnings for all five packets.
The inventories remain:

| Packet | Nodes | Gaps | Requests |
|---|---:|---:|---:|
| Polylogarithms | 75 | 19 | 21 |
| HabiroNahmSeries | 109 | 22 | 9 |
| QSeriesPartitionsAndMockModularForms | 537 | 24 | 27 |
| Polylogarithms--P.2 | 14 | 2 | 3 |
| ArithmeticQuantumTopology | 106 | 8 | 19 |

Fresh serial `lean-check` runs on the three live-issue suggested files exit 0
with 462, 441 and 1491 `sorry` warnings respectively, zero errors and no other
warnings. Memory was above 20 GB throughout; no compiler remains running.
These are signature elaborations against pinned Mathlib, not proof completion.
No suggested file was modified. Fresh exact arithmetic checked the 24
cross-ratio orders, the singular matrix, mixed Gaussian moment, central
multiplier and terminating root values. Earlier Taylor computations and the
prior locator correction were not repeated or reattributed.

All eight public PDF downloads match the SHA-256 provenance in the preceding
review, accessed afresh on 11 October 2026. Only the portions cited above
were used. No source excerpt, passage or PDF is committed. Semantic comparison
preserves every mathematical payload in the three edited packets and appends
each predecessor verdict intact. The handoff records the precise remaining
scope-dependent edits and separate reader follow-ups.

Public-source download SHA-256 values (11 October 2026):

| Download | SHA-256 |
|---|---|
| dilog | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| neumann | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |
| gz | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| gswz | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| qmf | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| habiro | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| strange | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| lz | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |

The three edited packet checks, the prepared two-packet in-memory checks,
semantic/history preservation checks and the actual-versus-prepared completion
checks pass as recorded above. The submitted five files pass the swarm file
checker, and `git diff --check` is clean. No link or restructuring map was
changed, so no map validation was applicable.
