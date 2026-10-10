# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex, session
`codex-LwWaSJ`, 10 October 2026. Atlas base
`fb99cf051cb90cec265ac63529c9541642546aee`.

This continues Codex `codex-ERbW4d`'s checkpoint in
[PR #8414](https://github.com/CBirkbeck/tauceti-explorer/pull/8414), which continued
Codex `codex-RtLe8Y`'s checkpoint in
[PR #8353](https://github.com/CBirkbeck/tauceti-explorer/pull/8353), which continued
Claude `claude-I6EWxn`'s
[PR #6944](https://github.com/CBirkbeck/tauceti-explorer/pull/6944).
Reviewed work: `FIX-RT-AREA-topology~4`, Codex `codex-BLPWxk`,
[PR #6873](https://github.com/CBirkbeck/tauceti-explorer/pull/6873),
merge `c1b39075`. I did none of that fix, its preceding rounds, the red team,
its verification, or the blueprints and assemblies examined here.

The three supplier reviews specified by the GitHub issue are complete.
`needs_changes` is a completed review with identified corrections, not an
unfinished attempt to audit the packet. All 27 assigned findings are accounted
for below. This is not a fresh audit of unrelated blueprint declarations or
a review of Tau Ceti's own roadmaps.

| Packet | Verdict | Reason |
|---|---|---|
| Polylogarithms | **accepted** | /7's ownership and geometric prerequisites are correct; the early ideal-region gap remains explicit. |
| HabiroNahmSeries | **accepted** | /11's formal/analytic split and qualified exports are correct; assembly resolved the earlier material reader objections. The preceding checkpoint's small corrections were confirmed. |
| QSeriesPartitionsAndMockModularForms | **needs_changes** | /13's scalar owner split and Part II routing are correct after clarification below, but reader synchronization remains. Earlier broad blueprint rejections remain binding. |

The replaced top-level reviews are preserved in `reviewHistory`, including
QSeries' later `REV-FIX-RT-AREA-automorphic-1~5` rejection. The new objects name
`independent-review-REV-FIX-RT-AREA-topology~4` and identify this bounded review.

## Supplier contracts and corrections

### /7: ideal-tetrahedron volume

`P.2/hyperbolic-volume` imports GeometricTopology layers 7 and 8, with matching
structured requests. Its cross-ratio has `r(∞,0,1,z)=z`, with positive volume
for positive imaginary part; the K3BlochGroups convention is converted
explicitly. Goncharov's introduction item 5, p. 7, and §6, p. 53 support those
conventions. P.2 owns the tetrahedron identity; QT.5 consumes it for the
manifold sum. No QT.5 prerequisite is introduced in P.2.

The accepted P.2 part supplies the Milnor/Lobachevsky route through
`P.2/milnor-angle-volume`. The assembled reader's note after the inherited
target explains this relationship. The early ideal-boundary, orientation and
measurable finite-region carrier remains a distinct supplier gap: a volume
measure or closed Mostow rigidity does not supply it. No mathematical edit
was needed for /7.

Current upstream GeometricTopology layer 7 already consumes HopfRinow's
connection and implemented `TauCeti.riemannianVolume`; the current library's
`VolumeDensity/Volume.lean` and `Isometry.lean` provide the measure and its
isometry interface. Those are existing work, not new atlas targets. This
current-library observation is separate from the packet's pinned baseline.

### /11: formal data and qualified Habiro exports

The knot-matrix node takes geometric input at QT.5. QT.6 owns identification,
triangulation/choice invariance and state-integral comparisons; QT.7 owns knot
modularity. No base Habiro node has a QT.6 or QT.7 prerequisite.

The figure-eight matrix kills `(1,-1)`, so positive-definite analytic
asymptotics cannot be applied to it. The formal route uses the invertible
Hessian at a chosen non-real solution. GZ Theorem 3.1, pp. 5–6 retains positive
definiteness, odd root order and coprimality with a denominator of the quadratic
datum. GSWZ §1.8, pp. 15–17 keeps the formal topology-to-Nahm comparison
separate, under its NZ integrality/unimodularity conditions.

The export node already incorporates the checkpoint's corrections. The
Euler–Maclaurin export retains integrability, endpoint and uniform-remainder
hypotheses. Formal Gaussian integration requires a symmetric invertible
Hessian and its specified coefficient algebra/completion. The radial theorem
retains its analytic hypotheses and coefficientwise Kummer-descent obligation.
The Gaussian collection uses the corrected normalization and HB.9 jet;
identification is through `HB.8/refinement-gaussian-identification`, under G1
prefactor reconciliation and G2 uniform regularity, with auxiliary root-order
coprimality. Membership retains the coefficient extension, excluded primes,
signed Kummer orientation and all-order integral gluing. It is not an automatic
scalar ring-membership or topological-invariance theorem.

These qualifications agree with the accepted HB.4/HB.8/HB.9 parts and current
QT.6 `topological-habiro-module-comparison`; the consumer's G6 preserves them.
The earlier reader omissions are resolved: every one of the 109 base node IDs
occurs in the assembled reader, with controlling refinements and G1/G2. Its
opening distinguishes a complete planning pass from proofs or implementation.
Its export target is governed by `HB.10/etale-nahm-cohomology-export`, requiring
actual comparison maps.

Corrections from PR #8353, independently confirmed in this continuation:

- Replace the knot-matrix source's TeX label by GSWZ Remark 4.2, equation
  (233), printed p. 48, with an accurate description of the integral recipe.
- In `HB.10/figure-eight-example`, make the finite-decimal regulator value
  explicitly approximate and assign its manifold-volume identification to
  QT.5. The acceptance case likewise separates a numerical check from that
  theorem.
- Add suggested-file comments preserving Gaussian G1/G2, signed Kummer,
  integral-gluing and coefficient-field obligations, and the numerical-volume
  boundary. No Lean declaration changed.

A subsequent reader synchronization should carry the small locator and numeric
wording improvements. Its material owner split and export hypotheses already
agree; no error in this round's supplier correction remains. Historical partial
coverage, honest gaps and `implementationStatus: unchecked` are retained.

### /13: scalar periods and knot matrix cocycles

Nine QM.5 nodes now offer explicit QT.7 contracts, including
`quantum-modular-cocycle`. Its additive scalar period relation assumes a
normalized nonzero automorphy factor. It does not supply multiplicative matrix
cocycles. The canonical definition has an API and discriminating tests,
including the integer-indicator non-example and lower-boundary half-integral
weight sign. Cocycle normalization excludes the zero-factor counterexample.
No new definition or API was introduced here.

The Kontsevich export retains the inverse eta multiplier and lower-boundary
convention. Strange coefficients belong to the normalized series, with their
factorial and power-of-24 scaling; a trefoil Kashaev identification is still a
QT comparison obligation. Lawrence–Zagier's Theorems 1–2, p. 98 concern the
rescaled WRT function, while the formal Habiro comparison also imports
QT.3/QT.4 and HC.3/HC.4. Its §4 vector law, pp. 102–104 is not an unrestricted
scalar law: the packet keeps the subgroup and multiplier/finite-image
qualifications. Formal evaluation is not an automatic analytic limit.

Corrections from PR #8353, independently confirmed in this continuation:

- Correct the Poincaré comparison's inconsistent locator to Zagier Example 4,
  equations (28)–(30), printed pp. 11–12; identify the additional formal
  comparison inputs.
- Replace the restructuring detail which called QT.7 both unplanned and
  written with the actual mathematical owner split. Remove its prediction of
  future promotion of an already accepted consumer. Preserve the open matrix
  request and QM.5 → QT.7 direction. No reverse QT.7 prerequisite occurs in
  QM.5.

PR #8414 corrected the QM.5 coverage note's undecided owner wording; this
continuation independently confirms that correction.
The consumer's open request already has the explicit route
`QSeriesPartitionsAndMockModularForms, Part II where this general interface is absent`.
The base packet records that route consistently, retaining the common
pole-free domains, branch-aware weights and analytic-extension requirements.
This is an honest supplier gap with an assigned owner, not an unfixed scalar
definition or a reason by itself to reject the bounded correction. No new
generic matrix interface is claimed. A knot-specific conditional composition
identity still does not supply that interface.

Remaining reader corrections are concrete. Its eight-row export table omits
the scalar cocycle and calls the Kontsevich multiplier the eta multiplier
rather than its inverse. Its first QM.5 acceptance bullet calls
`1, 23, 1681, 257543` the Taylor coefficients of `e^{-t/24}F(e^{-t})`;
these are the scaled numbers `c_n`, with coefficients `c_n/(24^n n!)`.
Independent truncated expansion with exact rational arithmetic through degree
three gives
`1, 23/24, 1681/1152, 257543/82944`, agreeing with the packet's normalization.
The reader's restructuring paragraph still says QT.7 has no nodes and describes
a prospective consumer, although its current accepted packet has 106 nodes.
Synchronize these locations with all nine packet contracts. The reader's
trefoil row already requires the color, orientation and normalization
comparison, so the inherited report's claim that this row still needed that
qualification is withdrawn.
Also retain the native-form, fifth-order coordinate and proof/supplier
obligations of `REV-QSeriesPartitionsAndMockModularForms` and its pending
revision. A narrow fix review cannot promote the whole packet past them.

## Every assigned finding

For files excluded by the fix issue, **handoff accepted** means the fix assigned
the right owner and hypotheses, not that the owner's proofs are complete.
ArithmeticQuantumTopology is no longer unwritten: its current 106-node packet
is complete and accepted by `REV-ArithmeticQuantumTopology~2`, 8 October. The
current interfaces below were inspected for the handoffs; this is not a second
full review of that blueprint.

| Finding | Verdict and reason |
|---|---|
| /1 | **Handoff accepted.** QT.0 reuses geometric link/surgery contracts and pinned diagram data. Current framed-link/linking-matrix and surgery nodes retain geometric supplier G1; a PD code is not a realized link. |
| /2 | **Handoff accepted.** Current Hoste, refined Kirby and admissible-presentation nodes feed QT.3 twisting/well-definedness. Admissible-class invariance is distinguished from unrestricted Kirby moves. |
| /3 | **Handoff accepted.** H-adic quantum algebra, ribbon/even-integral-form and bottom-tangle nodes feed the cyclotomic completion and twist. Ordinary category/Hopf APIs are imported; quantum completion remains G2. |
| /4 | **Handoff accepted.** General Drinfeld–Jimbo/core, filtration/parity, Kirby-color and WRT nodes name the general-Lie-type inputs. G2 retains the generic universal invariant and highest-weight/color contracts; rank one is insufficient. |
| /5 | **Handoff accepted.** `QT.2/jones-normalization-comparison` and G3 keep variable, mirror, framing and root conventions explicit. A Temperley–Lieb representation is not a Markov trace. |
| /6 | **Handoff accepted.** Specific P.1/P.2 regulator and V.3/V.4/V.6 group/comparison prerequisites replace the wrong regulator attribution. V.5 computations are not treated as a regulator supplier. |
| /7 | **Supplier fix accepted.** Both geometric prerequisites and matching requests are present; P.2 owns the tetrahedron formula and QT.5 the manifold comparison. The early geometry gap remains. |
| /8 | **Handoff accepted.** Cusped ordered face-pairings, completeness and finite-volume geometry are requested explicitly. G4 retains the missing supplier/connectivity/rigidity conditions; closed Mostow material is insufficient. |
| /9 | **Handoff accepted.** Extended pre-Bloch/kernel, flattening and Rogers nodes specify the extra comparison. G5 keeps cut-cover, transfer and torsion issues; no canonical lift follows from ordinary Bloch descent. |
| /10 | **Handoff accepted.** QT.6 names NZ and root-refined data/series, invariance and integral-Nahm comparison. G6 retains unimodularity, parity, coefficients and normalization; the actual Habiro refinement is imported. |
| /11 | **Supplier fix accepted.** Formal and analytic exports remain distinct and qualified. Material reader omissions are resolved; the prior checkpoint's locator, numerical boundary and comment corrections were confirmed. |
| /12 | **Handoff accepted.** Current Kashaev evaluation/lift, volume conjecture and sourced proved cases keep G3 normalization and distinguish conjectures from theorems. |
| /13 | **Needs changes in the reader.** Nine scalar supplier contracts are correct. The prior checkpoint clarified the base coverage note to agree with the consumer's existing Part II route for the generic matrix interface; the gap remains explicit. Reader synchronization and broad independent blueprint objections remain. |
| /14 | **Handoff accepted.** Faddeev, functional/inversion and operator-pentagon, selected analytic and AK charged/leveled nodes name the missing interfaces. G7 retains contour, operator, microlocal and tail obligations. The formal pentagon remains a common-toolkit request. |
| /15 | **Handoff accepted.** General resurgence/Borel summation is explicitly outside QT. The retained knot coefficient-asymptotic statement is a named conjecture with its phase discrepancy in G8. |
| /16 | **Handoff accepted.** Current restructuring records QT Part II's Wheeler knot-specific lift and relative-Habiro supplier, with Habiro §7/MMR inputs. Bouis–Gazda is explicitly excluded. |
| /23 | **Upstream handoff accepted.** Relative homotopy belongs to every based pair; NDR/CW assumptions belong on the appropriate comparison/excision theorems. Pinned `TopPair` is an embedding arrow. Current upstream Stage 8.1 README still contains the restriction, but its Suggested.lean defines relativeHomotopyGroup for an arbitrary BasedTopPair at lines 341–343 (a planning declaration, with an admitted proof). The remaining discrepancy is in the prose; the fibration comparison remains a maintainer export. |
| /24 | **Upstream handoff accepted.** Spectral objects are not the missing convergent filtered-chain package. Current upstream inventory still lists exact couples. One owner must specify boundedness, convergence, edge maps and naturality before the six consumers. |
| /26 | **Upstream handoff accepted.** CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz are the right prerequisite contracts, not new targets of the three suppliers. |
| /29 | **Upstream handoff accepted.** Record the document's internal algebraic-topology order and exact external suppliers/consumers. Links between Tau Ceti roadmaps remain maintainer work. |
| /33 | **Upstream handoff accepted.** Absolute higher-homotopy maps/basepoint transport already have a UniversalCovers/library owner; AlgebraicTopology keeps relative groups and comparisons. |
| /81 | **Upstream handoff accepted, owner updated.** Handle/gluing, closed-ball and rounding contracts stay with GeometricTopology. DifferentialGeometry 5.5 already owns abstract corner boundaries/face orientations, and GeometricTopology cites it. Do not plan that interface again. |
| /82 | **Upstream handoff accepted, owner updated.** Support-sensitive isotopy extension and ambient gluing independence remain distinct from a disc-embedding isotopy. DifferentialGeometry 3.3 already owns connected-manifold homogeneity; import that ingredient. |
| /87 | **Upstream handoff accepted.** Surface classification/mapping classes are not diffeomorphism-group topology. Boundary connected sum and a specific triangulation/Morse existence route are needed. Current layer 9 still has the old mapping-class attribution. |
| /91 | **Upstream handoff accepted.** Geometric internal dependencies and misplaced unlocks need maintainer coordination. Current layer 7 imports HopfRinow and the implemented Riemannian measure; update records around these existing owners. |
| /103 | **Upstream handoff accepted, supplier choice superseded.** DifferentialGeometry 0–2 and 5 already own forms, derivative/pullback, orientation and Stokes. Its actual Stokes signature carries regularity, compact support and outward-first orientation. HF/arithmetic consumers must import it; a new forms/Stokes roadmap would duplicate upstream work. |
| /105 | **Upstream handoff accepted.** HF's triple-manifold/Spin-c assignment, cobordism handles and absolute grading need actual four-dimensional contracts. Neither three-dimensional Kirby calculus nor an algebraic spin group supplies them. Keep rational-homology-sphere hypotheses on correction terms. |

All eleven upstream dispositions remain maintainer notes. No upstream roadmap,
atlas extract, live data, link map or restructuring-result file was edited.

## Evidence and checks

Read WORKERS, both protocols, UPSTREAM_GUIDE, the full fix report, all 27 claims
and verification records, the three preceding checkpoint reports, relevant accepted supplier
parts/readers and current consumer. Reviewed library audits: AUDIT-30 for P.2,
AUDIT-14 for HB.4/HB.8/HB.10 and AUDIT-15 for QM.5. Their historical duplicate
attributions are checked against current contracts.

Confirmed the shared-build Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174` and independently read `AnalyticOnNhd`
(`Analysis/Analytic/Basic.lean`), `Matrix.PosDef`
(`LinearAlgebra/Matrix/PosDef.lean`), `Matrix.PosDef.det_pos`
(`Analysis/Matrix/PosDef.lean`) and `TopPair`
(`Topology/Category/TopPair.lean`). At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, checked `FramedOrientedPDCode`'s
component framing, `covMatrix_multivariateGaussian` and
`multivariateGaussianPDFReal_def`. Their three shared-build source files match
the raw files at that commit byte for byte. These
give tools, not Nahm asymptotics, a formal Gaussian bracket or link realization.
No new baseline declaration or definition was added.

Read current upstream at `670582c502e1d4497d9ccd492b36c67028ef6666`: the complete
AlgebraicTopology and Completed/UniversalCovers READMEs, relevant
DifferentialGeometry layers and the actual `integralTopForm_mextDeriv` signature,
GeometricTopology layers and AlgebraicTopology relative-homotopy declarations.
The current Tau Ceti library is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; independently read its
Riemannian volume and measure-preserving isometry signatures.
No Lake command was run in that read-only environment.

Public PDFs read on 10 October 2026; source statements are expressed in our
own words. No restricted book or source passage was copied.

| Source | Results checked | PDF SHA-256 |
|---|---|---|
| [Goncharov, math/0207036v3](https://arxiv.org/pdf/math/0207036v3) | Introduction item 5, p. 7; §6 normalization, p. 53. | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| [Garoufalidis–Zagier, 1812.07690v1](https://arxiv.org/pdf/1812.07690v1) | §1 positive-definite setup, pp. 2–4; §3 Theorem 3.1, pp. 5–6. | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [GSWZ, 2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | §1.8, pp. 15–17; Remark 4.2, (233), p. 48; §4.5, pp. 54–55. | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | Definition/cocycle, p. 2; Example 4, (28)–(30), pp. 11–12; Example 5 boundary, pp. 12–16. | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [Zagier, strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | §6 Theorem, (37)–(39), pp. 958–959. | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| [Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | §3 Theorems 1–2, p. 98; §4, (15)–(18), pp. 102–104. | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |
| [Habiro, math/0605314v1](https://arxiv.org/pdf/math/0605314v1) | §9 Theorem 9.4, p. 34; §10 Theorems 10.1–10.2, p. 35; §11 Lemma 11.2, p. 38. | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| [Habiro, refined Kirby calculus, math/0509039v2](https://arxiv.org/pdf/math/0509039v2) | §5 Corollary 5.1 and proof, pp. 1309–1310. | `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416` |

`python3 scripts/check_blueprint.py` passes on all three packets with **0 errors,
0 warnings**. Node counts: 75, 109 and 537. There are no link-map or
restructuring-result deliverables; packet-internal restructuring notes are
checked with their packets. No `excerpt` field is present in any of them.
`python3 research/blueprint/intake.py check-files` passes on all five changed
files with **0 problems**; `git diff --check` also passes.

With 100 GB memory available before compilation, fresh sequential `lean-check` runs
at the prescribed pin returned exit 0 for all three:

| Suggested file | Errors | Warnings |
|---|---|---|
| Polylogarithms.lean | 0 | 462, all `sorry` |
| HabiroNahmSeries.lean | 0 | 441, all `sorry` |
| QSeriesPartitionsAndMockModularForms.lean | 0 | 1,469, all `sorry` |

The Habiro count belongs to the current assembled file, not the earlier
273-warning file. No suggested declaration changed in this continuation. Elaboration verifies
signatures and tests, not the admitted proofs or analytic comparisons.

## Submission scope

GitHub issue #6521 explicitly names the three supplier packets and their Lean
files, still confirmed by a fresh issue read before submission.
[WORKERS.md](../WORKERS.md) requires: "Edit only the files the issue names,
plus your own scratch space." The local queue additionally names ArithmeticQuantumTopology and
Polylogarithms--P.2 packets/Lean files; its prompt file is absent. Those two
packets currently have different independent top-level reviewers, so the
`issues.py` completion predicate demands reviews outside the issue's writable
scope. This discrepancy was raised for clarification before the independent
checks; no authorization to expand the file list has arrived. The three specified
reviews and all 27 dispositions above are complete; the two additional reviews
were not silently overwritten contrary to WORKERS.md's file restriction.

## Summary

This session completed the three issue-authorized bounded supplier reviews,
accounted for all 27 findings, and confirmed the prior mathematical corrections
against public sources and pinned library statements. Polylogarithms and
HabiroNahmSeries are accepted for this round; QSeries still needs the specified
reader synchronization, with its broader blueprint objections preserved.
All three packet validators pass, and all three suggested files elaborate with
only `sorry` warnings. The new upstream observation is the discrepancy between
AlgebraicTopology's restricted prose and its unrestricted relative-homotopy
carrier; no upstream file was edited.

The submission is a checkpoint because the queue requires two additional
packet reviews outside the GitHub issue's writable scope. Completion under the
issue's seven outputs is true; under the queue's eleven outputs it is false.
The handoff identifies the precise metadata reconciliation or scope
authorization required. This is a scope blocker, not a time limit.
