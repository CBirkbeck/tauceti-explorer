# Independent review of topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-T33A8J`, 11 October 2026,
branch `codex-T33A8J-review-topology-6521`. The bot confirmed
[claim 6106904494](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6106905513).
This session authored neither the plans nor the fix being reviewed.

## Verdict and completion boundary

Accept the bounded Polylogarithms /7 and HabiroNahmSeries /11 supplier
corrections. Keep QSeriesPartitionsAndMockModularForms **needs_changes**:
its scalar ownership is appropriate, but its reader contradicts the corrected
multiplier in its packet and suggested file. Each preceding review is retained
whole in `reviewHistory`, including the separately attributed full-plan audits.
This review follows the codex-yGPDT3 bounded review of 11 October 2026.
These verdicts assess the assigned fix, not full roadmap closure.

The live issue authorizes three packets, three suggested files and this report.
Its queue job instead requires five packets and five suggested files. All eleven
outputs exist. The two extra packets still carry different full-plan reviewer
IDs, so the actual completion predicate is false. Concrete bounded changes
were prepared in scratch for `Polylogarithms--P.2.json` and
`ArithmeticQuantumTopology.json`; authorization to apply them was requested.
WORKERS says “Edit only the files the issue names, plus your own scratch space.”
Until that scope question is resolved, this remains a checkpoint. Neither
omitted packet, the queue nor the completion predicate has been edited.
Negative mathematical verdicts themselves are valid completed review outcomes.

## Independent checks

Read all 27 assigned findings, the verifier's reasons, and the entire
[fix report](../redteam/RT-AREA-topology.fixes-4.md). Rechecked the changed
supplier statements, hypotheses, APIs, distinguishing tests and suggested
contracts. Read the reviewed coverage entries for P.2, HB.4/HB.8/HB.10 and
QM.5 (AUDIT-30/14/15). The full-plan negative reviews remain evidence with
their original attribution; this session does not claim a new audit of all
537 QSeries nodes or all 106 QT nodes.

Read current AlgebraicTopology and DifferentialGeometry README documents,
relevant GeometricTopology layers and suggested contracts, and the current
Tau Ceti declarations discussed below. Current upstream owners supersede
absence claims based on the atlas snapshot. No upstream file was changed.

### /7: the volume identity needs its geometric interpretation

[Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
I.3 equations (3),(5), printed p.11, and I.4 equations (7)-(9), pp.13-14,
locate the alternating cross-ratio cocycle, ideal-tetrahedron formula and
manifold sum. [Neumann v2](https://arxiv.org/pdf/math/0307092v2),
Theorem 2.6 and section 3, pp.420-421, uses another ordered coordinate.
Writing the two coordinates as

`rP(a,b,c,d)=(a-c)(b-d)/((a-d)(b-c))` and
`rQ(a,b,c,d)=(c-b)(d-a)/((c-a)(d-b))`,

exact rational-complex arithmetic gives `rQ=1/rP` and
`rP(b,a,c,d)=rQ(a,b,c,d)` in all 24 orders of `(0,1,-i,2)`.
The displayed order gives `(1+i)/4` and `2-2i`. Bloch-Wigner inversion
negates the value, matching an odd vertex permutation of an oriented
geometric carrier. This check does not construct that carrier.

P.2 owns the identity and imports GT 7/8 geometry. QT owns the manifold
assembly. Its `QT.5/volume-and-chern-simons` statement already invokes this
identity but lacks the direct prerequisite
`Polylogarithms:P.2/hyperbolic-volume`; adding that edge is the prepared
correction. The canonical region, signed-sector integral and regulator
calibration remain gaps. A sector-integral prototype does not establish
signed Riemannian volume. Current metric and measure should be imported.

Neumann's regulator convention gives `i Vol - CS` modulo its periods.
QT's `i Vol + CS` convention needs the already recorded conjugation/sign
comparison and chosen representatives. Ordinary Bloch/Suslin descent does
not select a preferred extended lift. Keep QT needs_changes and G4/G5.

### /11: six exports retain different hypotheses

The exports are HB.4 Euler–Maclaurin with remainder, formal Gaussian
integration and radial asymptotics; HB.8 the FGI collection and identification
theorem; HB.9 module membership. Their HB.10 uses specify what QT may import.

[Garoufalidis–Scholze–Wheeler–Zagier v2](https://arxiv.org/pdf/2412.04241v2),
section 2.5 equations (110)-(111), p.28, uses a symmetric invertible Hessian
over a rational algebra and the completion admitting cubic terms divided by
the loop parameter. Preserve coefficientwise finiteness. Equations (117)-(119),
pp.29-30, require regularized factors and a proved residue periodicity.
Theorems 3/5, p.14, and Theorem 8, pp.35-36, retain the exact coefficient
ring, coprime auxiliary order, nondegenerate solution, quadratic extension and
excluded primes. Module membership is not scalar-ring membership.
Section 1.8, pp.15-17, requires integral NZ data with unimodular B for the
integral matrix dictionary. The packet's p.14 identification locator is
correct; its reader's p.13 locator remains a separate synchronization task.

[Garoufalidis–Zagier v1](https://arxiv.org/pdf/1812.07690v1), analytic datum
pp.2-3 and Theorem 3.1, equations (13)-(21), pp.4-6, instead needs
positive-definite rational data, admissible odd root order, radial approach,
branches and an all-orders remainder. The figure-eight matrix
`[[1,1],[1,1]]` kills `(1,-1)` and cannot use that theorem. A formal Hessian
at a nonreal solution has a different role. Inverting `[[2,1],[1,2]]`
gives mixed second moment `-h/3`, as the supplier test requires.

The real-polynomial h=1 suggested bracket is a narrower prototype than the
completed formal domain. The fix does not erase that obligation or any other
Habiro gap. Euler–Maclaurin retains regularity, integrability, endpoint and
uniform-remainder conditions. QT retains topological identification and
presentation independence.

### /13: scalar examples and knot laws have separate owners

[Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf),
p.2 and Examples 3-5, pp.10-12, supports the scalar predicate and examples.
Example 5's discontinuous knot defect is not an instance of the real-analytic
scalar predicate. QM.5's eight supplier contracts correctly leave knot
matrix laws, color/root/normalization comparisons and asymptotic modularity
to QT.7. Termination of a formal series does not prove a radial limit.

[Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf),
section 3 Theorems 1-2 and the periodic mean-zero proposition, pp.98-99,
and section 4, pp.103-104, provide the normalized WRT/false-theta and
Eichler routes. General multipliers and the finite-Weil image remain explicit
supplier obligations.

Inspected rendered pages of [Zagier, Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf),
section 6 equations (38)-(39), pp.958-959: extracted formulas are corrupted.
The source states the principal-branch generator identity and describes a
general multiplier related to eta. The packet's explicit lower-boundary
convention requires a correction to the naive inverse eta value at
`c=0,d<0`. In particular at `-I`, epsilon is `-i` and the weight factor is
`i`, yielding 1; the naive inverse would yield -1. This is a convention
comparison, not a claim that the source prints the packet's piecewise formula.

The packet and Lean signature contain the correction; the reader's
`QM.5/kontsevich-quantum-modular` statement and ambient hypotheses at
lines 9069/9071 still identify the multiplier with the unqualified inverse
eta multiplier. That reader is outside the editable issue list. Keep
needs_changes and the full earlier negative audit by codex-jnfi6H,
`REV-QSeriesPartitionsAndMockModularForms~2` (#6469), including no-ghost,
alternation/invariant forms, Serre/radical, quantitative Stirling and exact
supplier obligations. The cocycle API retains epsilon(1)=1 and common
pole-free domains. Fresh finite products give F(1)=1 and F(-1)=3.

## Disposition of every assigned finding

Acceptance of a handoff means its owner and contract are suitable. It does
not establish the outstanding mathematics. Upstream corrections stay with
the maintainer.

| Finding | Verdict and remaining boundary |
|---|---|
| /1 | Accept GT 1/4/5 inputs. Framed tangles, realizations, linking-matrix transformations and stronger surgery calculus remain extensions. |
| /2 | Accept the admissible-surgery route. Habiro section 9.2 Theorem 9.4 p.34 and section 10 Theorems 10.1-10.2 p.35 distinguish twisting from Hoste invariance on algebraically split ±1-framed links. Ordinary Kirby moves need not stay admissible. |
| /3 | Accept the named h-adic ribbon/integral-completion/bottom-tangle/pairing/twist suppliers after braided, rigid and Hopf foundations. Their constructions remain required. |
| /4 | Accept the rank-one restriction or an explicit general-root quantum supplier; rank one cannot imply the general target. |
| /5 | Accept with the current Jones/Markov library import and its required variable, framing, mirror, color and root comparisons. Keep G3. |
| /6 | Accept P.1/P.2 analytic/regulator and V.3/V.4/V.6 group/comparison owners. QT.0 and V.5 become prerequisites only with a named use. |
| /7 | Accept sole formula ownership and geometry imports. Prepare the missing QT direct prerequisite; retain signed carrier, orientation and manifold comparisons. |
| /8 | Accept early ideal geometry followed by the cusped-manifold extension. Completeness, face pairings and cusped rigidity exceed closed Mostow. |
| /9 | Accept extended relations, flattenings, Rogers descent and period/sign conventions. Ordinary descent does not choose the extended lift. |
| /10 | Accept the integral/unimodular NZ dictionary and exact coefficient/series imports. Keep G6 and topological invariance separate. |
| /11 | Accept all six scoped exports with their formal, analytic and arithmetic hypotheses. QT owns geometric identification. |
| /12 | Accept fixed-color Kashaev evaluation/lift and the sourced case ledger. General volume limits remain conjectural where the source says so. |
| /13 | Accept the scalar ownership split; QSeries still needs_changes for the reader multiplier and preserved full-plan objections. |
| /14 | Accept one formal-pentagon owner. Analytic Faddeev/AK requires its own domains, contours, convergence, contractions and admissible 2-3 analysis. |
| /15 | Accept sourced asymptotics with proved/conjectural status and G8 phase tests. No general resurgence conclusion is supplied. |
| /16 | Accept the Wheeler/MMR relative-Habiro/Alexander follow-up with HR.1 inputs and the recorded Bouis–Gazda exclusion. |
| /23 | Accept arbitrary based-pair definitions and honest low-degree carriers. Current AT Suggested.lean:341 already has no NDR premise on relativeHomotopyGroup; its comparisons at 404/418 do. README stage 8.1 still says to restrict groups to NDR pairs: reconcile upstream, do not replan. |
| /24 | Accept filtered-chain convergence, edge-map and naturality requests. Spectral-object/page infrastructure does not itself give convergence. |
| /26 | Accept explicit CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz suppliers. |
| /29 | Accept maintainer coordination of AT dependencies and restructuring. Existing stages remain imports. |
| /33 | Accept relative extensions while importing pinned absolute homotopy maps and path-based basepoint change. |
| /81 | Accept current DG 5.5 as abstract corner-boundary/face owner. GT owns balls, handles, collars, gluing and rounding comparisons. |
| /82 | Accept DG 3.3's finite-dimensional connected boundaryless homogeneity. Supported isotopy extension and gluing transport remain further inputs. |
| /87 | Accept one surface/mapping-class owner, boundary connected sum and an actual triangulation/Morse supplier for Heegaard existence. |
| /91 | Accept maintainer repair of GT target placement/dependencies. Current GT 7 already imports Riemannian measure and Hopf–Rinow. |
| /103 | Accept current DG 0-2/5 form, derivative, orientation and Stokes imports with regularity, compact support and outward-first signs. |
| /105 | Accept named Heegaard-triple four-manifolds, Spin-c/handle/intersection/signature and absolute rational-grading inputs. Correction terms retain rational-homology-sphere scope. |

The /2 source is [Habiro v1](https://arxiv.org/pdf/math/0605314v1).
Its twisting theorem feeds the stated admissible presentation-independence
proof rather than an unrestricted Kirby-invariance assertion.

## Library evidence and validation

Pinned Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Fresh statement reads checked Bernoulli function/polynomials, trapezoidal
error, IsBigO, power series, multivariable series/polynomials, determinant,
special linear group, complex power, neighborhood analyticity and
ZMod.LFunction. These are infrastructure, not the missing exported results.
The trapezoidal error is a difference definition, not an all-orders estimate;
ZMod.LFunction requires nonzero modulus and is the continued L-function.

At pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
FramedOrientedPDCode (PDCode/Basic:129), TemperleyLieb.jones (107),
multivariateGaussian_eq_withDensity (Gaussian/Density:166), HomotopyGroup.map
and mapHom (Map:119/222), homotopyGroupMulEquivOfPath (BasepointChange:424),
and SmoothTwoForm (TwoForm:60). Based maps need the point equation, group maps
need a nonempty index and basepoint transport needs a path. Gaussian density
requires positive-definite covariance; it is not the formal bracket.

Current read-only upstream is `070dc2becd74419e76303ede84b465ed4a69461f`;
current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
MarkovBraid.jonesTrace (TemperleyLieb:224), its unknot theorem (288) and
MarkovEquiv.jonesTrace_eq (352) now exist, with unknot value the loop value,
not the normalized value 1. UpperHalfSpace.riemannianMetric (331) and
isPretransitive_isom (483) supply metric/homogeneity, not an ideal region.
riemannianVolume (VolumeDensity/Volume:76) glues chart measures under finite
dimension, C1, Borel/Lindelof and continuous-metric hypotheses. DG already
owns forms, orientations, Stokes and abstract corner boundaries. Import these
owners and retain the additional comparison work. No Lake command ran there.

All five packets passed fresh blueprint checks with zero errors and warnings.
Inventories (nodes/gaps/requests) remain P 75/19/21, HB 109/22/9,
QSeries 537/24/27, P.2 14/2/3 and QT 106/8/19. Fresh serial lean-check
runs on the three live-issue suggested files exited 0 with respectively
462, 441 and 1491 `sorry` warnings and no other diagnostics. No suggested
file was changed. These checks establish signature elaboration, not proofs.
Available memory exceeded 20 GB and no compiler remains running.

Eight public PDFs were downloaded afresh on 11 October 2026; their SHA-256
values match the preceding review's provenance. Only the cited portions were
used. No private book, source excerpt or PDF is committed. The three edited
packets preserve every mathematical field and append their predecessors whole.
The remaining scope-dependent work and reader follow-ups are in the handoff.

Public-download hashes, accessed 11 October 2026:

| Source | SHA-256 |
|---|---|
| Zagier dilogarithm | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| Neumann v2 | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |
| Garoufalidis–Zagier v1 | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| GSWZ v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| Quantum modular forms | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| Habiro v1 | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| Strange identity | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| Lawrence–Zagier | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |

The two proposed packet objects also pass the full checker, including the
baseline declaration index, when supplied read-only under their canonical
paths. No replacement was written. The unchanged completion predicate returns
false for the actual checkout and true with precisely those two proposed
objects. The five submitted paths pass intake check-files; git diff --check
is clean. No link or restructuring map was changed.
