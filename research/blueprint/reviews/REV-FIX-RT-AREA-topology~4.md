# Independent review of topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-8VNvtM`, 11 October 2026,
branch `codex-8VNvtM-review-topology-6521`. The bot confirmed the
[claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6107486245).
This session authored neither the reviewed plans nor their fixes.

The bounded corrections to Polylogarithms (/7) and HabiroNahmSeries (/11)
are accepted. QSeriesPartitionsAndMockModularForms (/13) remains
**needs_changes** because its reader contradicts the corrected multiplier.
These verdicts concern the assigned fix, not closure of the entire roadmaps.
Every preceding packet review is retained whole in `reviewHistory`; the
separately attributed full-plan audits remain evidence. The prior QT full-plan
review by codex-qw7qpA was accepted, not a negative audit.

## Scope and completion

The live issue names three packets, three suggested files and this report.
The queue requires five packets, five suggested files and the report. All
11 outputs exist, but the unchanged completion predicate returns false:
Polylogarithms--P.2 and ArithmeticQuantumTopology retain their different
full-plan reviewer IDs. The discrepancy is independent of the mathematical
verdict; `needs_changes` is a valid completed review outcome.

[WORKERS.md](../WORKERS.md) requires “Edit only the files the issue names,
plus your own scratch space.” Authorization was requested for the two omitted
packet paths. Pending that answer, they remain unchanged. The authorized
three packets now record this session's independent bounded review, with no
change to their mathematical payload. Queue and completion code are unchanged.
The [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) gives a concrete path
through the scope blocker and the separate reader corrections.

## Review evidence

Read all 27 assigned findings, their verifier reasons, and the complete
[fix report](../redteam/RT-AREA-topology.fixes-4.md). Compared the affected
statements, hypotheses, prerequisites, source locators, definition APIs,
distinguishing tests and suggested signatures. Read the reviewed library
coverage for P.2, HB.4/HB.8/HB.10 and QM.5. This is not a fresh audit of all
537 QSeries nodes or 106 QT nodes.

### /7: geometric volume and regulator conventions

[Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
I.3 equations (3),(5), p.11, and I.4 equations (7)-(9), pp.13-14, connect
the alternating cross-ratio cocycle, ideal-tetrahedron formula and manifold
sum. [Neumann v2](https://arxiv.org/pdf/math/0307092v2), Theorem 2.6 and
section 3, pp.420-421, distinguish the extended regulator from ordinary
Bloch descent. These source statements require the geometric interpretation;
a formal sector integral alone does not establish oriented Riemannian volume.

Independently checked, with exact rational-complex arithmetic, the coordinates
`rP=(a-c)(b-d)/((a-d)(b-c))` and
`rQ=(c-b)(d-a)/((c-a)(d-b))`. In every order of `(0,1,-i,2)` they are
reciprocals, and exchanging the first two vertices swaps the coordinates.
In the displayed order their values are `(1+i)/4` and `2-2i`. The
Bloch-Wigner inversion rule therefore agrees with the sign of an odd vertex
permutation. This does not construct the oriented geometric carrier.

P.2 is the sole formula owner; GT 7/8 supplies geometric foundations and
QT.5 assembles the manifold comparison. The QT node
`QT.5/volume-and-chern-simons` already invokes the P.2 identity but omits
`Polylogarithms:P.2/hyperbolic-volume` from its direct prerequisites. That
edge is a concrete scope-dependent correction. Preserve the canonical-region,
signed-integration and regulator-calibration gaps. Neumann's convention gives
`i Vol - CS`; the QT/GZ convention `i Vol + CS` requires its recorded
conjugation and period comparison. Ordinary descent does not choose an
extended lift or an exponential representative.

### /11: the six Habiro exports

[Garoufalidis–Scholze–Wheeler–Zagier v2](https://arxiv.org/pdf/2412.04241v2),
section 2.5 equations (110)-(111), p.28, uses a symmetric invertible Hessian
over a rational algebra and a completion admitting cubic terms divided by
the loop parameter. Equations (117)-(119), pp.29-30, use regularized factors
and require residue periodicity. Equation (126), p.31, restricts the
auxiliary order to be coprime; the packet keeps that restriction even though
Theorem 8, pp.35-36, phrases its quantifier more broadly. The identification
lives in `Q[zeta]((x))[[t]]`, allowing pole order to grow with t-degree.
Theorems 3/5, p.14, retain a nondegenerate chosen solution, the coefficient
localization, inverse discriminant square root and excluded root orders.
Membership in the indexed module is not membership in the scalar ring.

[Garoufalidis–Zagier v1](https://arxiv.org/pdf/1812.07690v1), the analytic
datum on pp.2-3 and Theorem 3.1, equations (13)-(21), pp.4-6, instead
requires positive-definite rational A, an admissible odd root order,
branches and radial all-orders remainder estimates. Direct multiplication
shows that the figure-eight matrix `[[1,1],[1,1]]` kills `(1,-1)`; that
matrix cannot use the analytic theorem. For the nonsingular test Hessian
`[[2,1],[1,2]]`, inversion gives mixed formal moment `-h/3`.

The six exports are the HB.4 Euler–Maclaurin, formal Gaussian and radial
contracts, HB.8 collection and identification, and HB.9 module membership.
HB.10 explicitly imports the accepted follow-up regularization and corrected
identification with open Gaussian-prefactor and uniform-t-regularity gaps,
plus coefficientwise Kummer descent and arithmetic gluing obligations. The
h=1 real-polynomial Lean bracket remains a narrower prototype. Euler–Maclaurin
still needs endpoint, regularity, integrability and uniform remainder control.
QT owns geometric identification and presentation independence. The packet's
identification locator is p.14; its reader still says p.13.

### /13: scalar quantum modularity and the lower boundary

[Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf),
p.2 and Examples 3-5, pp.10-12, supports the scalar predicate and examples.
Example 5's knot transformation is discontinuous and does not establish the
real-analytic scalar predicate. The eight QM.5 supplier contracts leave
knot matrix laws, colors, roots, normalization and asymptotic modularity to
QT.7. Formal termination alone does not supply analytic radial limits.

[Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf),
section 3 Theorems 1-2 and the mean-zero periodic proposition, pp.98-99,
separate the normalized WRT limit and Ohtsuki expansion from a formal
root-of-unity evaluation. Section 4, pp.103-104, gives the Eichler route
through lower-half-plane period functions. General multipliers and finite
Weil image remain explicit supplier obligations.

Inspected rendered [Zagier, Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf),
section 6 equations (38)-(39), pp.958-959, because formula extraction is
unreliable. It gives the principal-branch generator identity and relates
general multipliers to eta. The packet's explicit piecewise correction is
an inference comparing branch conventions, not a formula printed there.
At `-I`, the chosen boundary weight is `i`; corrected epsilon is `-i`,
so their product is 1. The naive inverse eta choice gives -1. The packet
and Lean contain the correction at `c=0,d<0`; reader
`QM.5/kontsevich-quantum-modular`, lines 9069/9071 in this base, does not.
The cocycle API retains epsilon(1)=1 and common pole-free domains. Independent
finite products give F(1)=1, F(-1)=3 and F(i)=8-3i.

Keep QSeries needs_changes and the codex-jnfi6H full-plan audit
`REV-QSeriesPartitionsAndMockModularForms~2` (#6469), including its separate
no-ghost, invariant-form/alternation, Serre/radical, quantitative Stirling
and exact supplier objections. This review does not rejudge those subjects.

## Every assigned finding

An accepted handoff has an appropriate owner and contract; it does not prove
the requested mathematics. Upstream roadmap corrections remain maintainer
notes, since those roadmaps are existing work.

| Finding | Disposition and reason |
|---|---|
| /1 | Accept GT 1/4/5 imports. Existing diagram presentations are the baseline; tangle categories, realization, linking-matrix moves and surgery calculus still need their named extensions. |
| /2 | Accept admissible surgery independence. Habiro v1 section 9.2 Theorem 9.4 p.34 and section 10 Theorems 10.1-10.2 p.35 use isotopy/Hoste moves of algebraically split ±1-framed links. General Kirby moves need not preserve that class. |
| /3 | Accept named ribbon, integral-completion, bottom-tangle, pairing and twist suppliers, after the braided/rigid/Hopf foundations. Naming those contracts does not construct them. |
| /4 | Accept the explicit rank-one scope and separate general-root supplier; a rank-one construction cannot establish the unrestricted target. |
| /5 | Accept current Jones/Markov imports with variable, framing, mirror, color and root comparisons still required. The current trace has unknot value delta rather than 1; preserve G3. |
| /6 | Accept P.1/P.2 and V.3/V.4/V.6 ownership. QT.0 or V.5 dependencies require a named mathematical use rather than a blanket import. |
| /7 | Accept the P.2 supplier correction. The missing QT direct prerequisite needs the omitted packet scope; geometric carriers, orientation and manifold comparisons remain open. |
| /8 | Accept early ideal geometry followed by the cusped-manifold extension. Closed Mostow does not supply completeness, face-pairing or cusped rigidity contracts. |
| /9 | Accept extended relations, flattenings, Rogers descent and period/sign tracking. An ordinary Bloch lift cannot select the preferred extended class. |
| /10 | Accept the NZ dictionary with integral data and unimodular B, and exact coefficient/series suppliers. Keep G6 and the separate topological-invariance proof. |
| /11 | Accept six qualified exports. Formal algebra, analytic radial asymptotics and arithmetic module membership retain distinct hypotheses and open comparison gaps. |
| /12 | Accept fixed-color Kashaev evaluation/lift and the sourced case ledger. General volume limits keep the source's conjectural status. |
| /13 | Accept scalar ownership; QSeries needs_changes for its reader multiplier mismatch. The earlier full-plan objections survive independently. |
| /14 | Accept a single formal-pentagon owner. Faddeev/AK analysis still requires actual domains, contours, convergence, contractions and admissible 2-3 moves. |
| /15 | Accept the proved/conjectural distinction and phase tests. The handoff does not imply a general resurgence theorem. |
| /16 | Accept the Wheeler/MMR relative-Habiro/Alexander follow-up through HR.1, with the documented Bouis–Gazda exclusion. |
| /23 | Accept arbitrary based-pair definitions and low-degree carriers. Current AT Suggested.lean:341 already defines relative groups without NDR; its comparison theorems use NDR. README stage 8.1 still restricts the groups and needs upstream reconciliation. |
| /24 | Accept convergence, edge maps and naturality as explicit filtered-chain requests. Page/spectral-object infrastructure alone does not prove convergence. |
| /26 | Accept explicit CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz suppliers. |
| /29 | Accept maintainer coordination of AT dependencies/restructuring. Existing upstream stages are imports, not new atlas plans. |
| /33 | Accept the relative extensions. Pinned absolute homotopy maps and path-based basepoint transport already supply the stated baseline. |
| /81 | Accept current DG 5.5 as abstract corner-boundary/face owner, while GT supplies geometric balls, handles, collars, gluing and rounding comparisons. |
| /82 | Accept DG 3.3 homogeneity with finite-dimensional, connected, boundaryless hypotheses. Supported isotopy extension and gluing transport require further results. |
| /87 | Accept a single surface/mapping-class owner and boundary connected sum. Heegaard existence must name its triangulation or Morse supplier. |
| /91 | Accept upstream target/dependency coordination. GT 7 currently imports the Riemannian measure and Hopf–Rinow connection; neither should be planned again. |
| /103 | Accept DG forms, derivative, orientation and Stokes imports, retaining C1/compact-support and outward-first conventions. Floer consumers still need their actual comparisons. |
| /105 | Accept named Heegaard-triple 4-manifolds, Spin-c, handle moves, intersection/signature and absolute rational grading. Correction terms retain rational-homology-sphere scope. |

The /2 source is [Habiro v1](https://arxiv.org/pdf/math/0605314v1).
Its twisting theorem and admissible calculus give the chosen presentation
independence route, with their hypotheses retained.

## Library and validation

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Read the statements of bernoulliFun, Polynomial.bernoulli, trapezoidal_error,
IsBigO, PowerSeries, MvPowerSeries, MvPolynomial, Matrix.det,
Matrix.SpecialLinearGroup, Complex.cpow, AnalyticOnNhd and ZMod.LFunction.
The trapezoidal error is a signed difference definition; its estimate is a
separate theorem and neither is all-orders Euler–Maclaurin. ZMod.LFunction
requires nonzero modulus and supplies continuation, not an everywhere
convergent Dirichlet series. Determinant and formal series infrastructure
do not supply completed Gaussian integration or a total cusp action on Q.

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Read FramedOrientedPDCode (PDCode/Basic:129), TemperleyLieb.jones (107),
multivariateGaussian_eq_withDensity (Gaussian/Density:166), HomotopyGroup.map
and mapHom (Map:119/222), homotopyGroupMulEquivOfPath (BasepointChange:424),
and SmoothTwoForm (Manifold/TwoForm.lean:60). The last pinned module is
TwoForm.lean, not the current TwoForm/Basic.lean. Gaussian density requires
positive-definite covariance; based maps require the point equation, group
maps a nonempty index, and basepoint transport an actual path.

Read-only upstream HEAD: `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`;
current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read AT and DG, the relevant GT 7/8 contracts, and current Tau Ceti
MarkovBraid.jonesTrace (224), jonesTrace_one_strand (288),
MarkovEquiv.jonesTrace_eq (352), UpperHalfSpace.riemannianMetric (331),
isPretransitive_isom (483) and riemannianVolume (VolumeDensity/Volume:76).
The volume measure requires finite dimension, C1, Borel/Lindelof and a
continuous metric. Metric/homogeneity and a measure do not construct an
ideal-tetrahedron region. No Lake command ran in either read-only tree.

All five packets pass the blueprint checker with zero errors/warnings.
Nodes/gaps/requests remain P 75/19/21, HB 109/22/9, QSeries 537/24/27,
P.2 14/2/3 and QT 106/8/19. Serial pinned lean-check runs on the three
live-scope suggested files exited 0, with 462, 441 and 1491 `sorry`
warnings respectively and no other diagnostics. These establish signature
elaboration, not proofs. Suggested files are unchanged; no compiler remains
running. Structural comparison confirms that each edited packet's preceding
review was appended whole and its mathematical fields are unchanged.

Eight public PDFs were fetched on 11 October 2026. Only the cited portions
were used; no source passage or PDF is committed. Download SHA-256 receipts:

| Source | SHA-256 |
|---|---|
| Zagier dilogarithm | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| GSWZ v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| GZ v1 | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| Quantum modular forms | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| Lawrence–Zagier | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |
| Strange identity | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| Neumann v2 | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |
| Habiro v1 | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |

The two proposed omitted-packet objects pass the full checker, including its
pinned declaration index, through a read-only canonical-path substitution.
The proposed QT prerequisite creates no cycle. The actual completion
predicate remains false, while exactly that two-object substitution returns
true. Intake check-files accepts all five submission paths and git diff
--check is clean. The live issue was re-read and still omits the two packets;
with scope authorization pending, this submission is a checkpoint.
