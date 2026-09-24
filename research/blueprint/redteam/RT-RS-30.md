# RT-RS-30 — red-team report

Agent: Codex. Session: `codex-c83e7a`. Issue: #1629. Date: 2026-09-24.
Status: **complete**. Findings: **none substantiated**.

The accepted restructuring survives the checks below. It preserves all twelve
stages, assigns the eleven shared outputs to suitable owners, and retains the
specialized arithmetic comparisons and proof gates. The 86 links contain no
proposal-edge cycle in either graph tested. This is structural acceptance only;
it does not certify the BSD proof leaves or a universal leading-term theorem.

## Independence and inputs

The original [PR #901](https://github.com/CBirkbeck/tauceti-explorer/pull/901)
is by session `gpt-20260921-c74f2a`; the accepted
[review PR #1039](https://github.com/CBirkbeck/tauceti-explorer/pull/1039) is by
`codex-a71f92`. I checked the actual PR metadata and file history before claiming.
Neither is this worker session. Read the complete
[family](../restructure/RS-30.json), [result](../restructure/RS-30.result.json),
[original report](../restructure/RS-30.md) and [accepted review](../reviews/REV-RS-30.md).
The review's corrected JSON, including its added handoffs and normalization
wording, is the accepted target; the original report's smaller link count is
historical rather than a second decision packet.

The initial snapshot is `9bafe01650e531e445ddc4c723d239c061dfb6ee`;
the final refresh is `9a8b296654ed82cbba5e57179b736475abf4e6d6`. No acquired input changed.
Read the complete [member](../../../content/campaign/RankZeroOneBSD/README.md)
and its twelve extracted stages. The complete
[EllipticCurves anchor](../../../content/tau-ceti/EllipticCurves/README.md) was
already read in this session's preceding elliptic-link red team. Its blob remains
`e8d4cabfb37922b00a582aaf623102876c77f33e`; I reused that full reading and reread
the load-bearing ownership, height, period, Selmer/Sha and isogeny contracts here.
This is reuse of unchanged primary input, not reliance on the RS-30 author's summary.

## Stage-preservation attack

| Stage | Retained targets and ownership boundary checked |
| --- | --- |
| BSD.0 | Actual finite analytic order, zero/derivative criteria, parity, quadratic local factors and product/central-derivative identities remain. The existing twist, full newform coefficient rationality and actual elliptic/newform continuation are imported. |
| BSD.1 | Point restriction/trace, rational eigenspaces/rank sum, integral lattice index, odd-primary comparisons, explicit 2-primary kernels/cokernels, ramified components/differentials/periods and finite-kernel descent of whole-Sha finiteness remain. |
| BSD.2 | Both central-value and central-derivative nonvanishing branches, simultaneous local conditions, infinitely many permitted discriminants, clean-branch exclusions and BFH/Friedberg–Hoffstein proof work remain; a root number is not used as nonvanishing. |
| BSD.3 | All-E/Q analytic-rank-one rank equality and entire-Sha finiteness remain, including CM/nonsemistable cases, full HE.7 and noncircular conjugation/eigenspace descent. |
| BSD.4 | The independent rank-zero twist/sign argument, whole-Sha descent, separately scoped Kato route and combined rank-at-most-one interface remain. |
| BSD.5 | Positive rational normalized leading term/defect, specialized Heegner lattice-index and torsion/Q–K comparisons, Ribet–Takahashi degree calculation, valuation formula and composition proving defect isogeny invariance remain. |
| BSD.6 | Distinct JSW, Skinner–Urban/Skinner and corrected Castella branches retain semistability/reduction/residual and special p=3 conditions, both divisibilities and local/integral error terms. |
| BSD.6a | Source-qualified signed/supersingular and corrected multiplicative proof inputs remain; the BSTW construction and both reciprocity laws are proof obligations, with separate congruence/regulator suppliers. |
| BSD.7 | CGS and Keller–Yin hypotheses remain distinct; rational p-torsion corrections remain. A p-converse is not substituted for a leading-term formula. |
| BSD.7a | Both Eisenstein divisibilities, integrality, local invariants, residual lattices and finite-submodule corrections remain; early HE.8 classes are inputs, completed HE.8b equality is an output. |
| BSD.8 | A positive rational defect, proved finite exceptional support, a certificate at every exceptional prime and the outside-support theorem remain necessary for a full formula. |
| BSD.9 | Separate rank, whole-Sha, named-prime and complete-certificate APIs remain; rigorous analytic enclosures and every positive/negative acceptance test survive the import of the foundation lemmas. |

No layer is moved or dropped. The first prerequisite is the unchanged Elliptic
curves roadmap, with the exact Part II title. The proposal does not rename or
alter an upstream stage. Its specialized proof obligations are additional to
that anchor's statement-only BSD endpoint, so the extension begins where the
anchor stops.

## Attempts to break the ownership boundary

**Mordell–Weil is not the analytic rank theorem.** Layer 6 owns finite generation,
torsion and the height/regulator package. BSD.1 keeps rank splitting, the proper
finite-index calculation and arithmetic descent. BSD.3/4 keep the analytic
rank and whole-Sha conclusions. The general `fg_point` normal-form hypotheses
are not improperly imposed on E/Q: the pinned `fg_point_of_numberField` handles
an arbitrary elliptic Weierstrass model.

**A twist equivalence is not an integral decomposition.** Layer 5 owns the
quadratic-twist curve and its point/Galois equivalence. BSD.0 keeps local
Euler-factor/base-change formulas, and BSD.1 keeps trace/restriction, local
Selmer conditions and the integral corrections. In particular, the decision
retains the 2-primary kernels/cokernels instead of importing a rational
±-eigenspace split as an integral theorem.

**General isogeny invariance has an existing owner.** Layer 7 explicitly owns
the Cassels arithmetic quotient, its duality/Kummer prerequisites and equality
of isogenous curves' local Euler factors. Its implementation status does not
move that ownership to BSD.5. Conversely, BSD.5 still constructs the positive
rational defect and proves its compatibility with the imported arithmetic and
analytic invariances; the Heegner/index/modular-degree calculations are retained.

**Rational periods do not supply general-field periods.** Layer 7's elementary
period/arithmetic quotient is explicitly restricted to E/Q. The corrected
ownership label and BSD.1 `keeps` preserve that restriction. Quadratic-field and
ramified-place period comparisons remain BSD.1 work with its geometric and GZ
inputs. The full real period already counts all components; no extra infinity
factor is introduced.

**Basis independence is not a sublattice-index formula.** The inspected regulator
file changes between bases of the same torsion quotient. It does not by itself
prove the quadratic or Heegner finite-index calculation. BSD.1/5 explicitly
retain those calculations. Importing the rank-zero regulator theorem likewise
does not delete BSD.9's end-to-end normalization test.

**The pairing must be compared, not inferred from its name.** The anchor prose
uses the full logarithmic x-height normalization. The pinned definition instead
uses `h(2^n P)/(2 * 4^n)` and the pinned pairing is the halved polar form.
[GZ.0](../../../content/campaign/GrossZagierAndArithmeticHeights/README.md#gz-0)
owns explicit change-of-convention maps and rank-dependent determinant scaling.
Its introductory prose inherits the anchor convention, but its actual contract
requires reading the implemented pairing. The accepted BSD.5 decision makes
that comparison explicit before identifying regulators or valuations. Thus the
known discrepancy is not silently assumed away by this restructuring. I do not
infer a universal source regulator factor from the height name alone.

**Analytic inputs and arithmetic proof exports are distinct.** Read actual
[R29.3/R29.6](../../../content/campaign/EllipticCurveModularity/README.md)
statements: full coefficient-field rationality and actual curve/newform
L-function comparison are the assigned outputs. New quadratic analytic adapters
stay in BSD.0. Read the complete HE.8b, MIMC:L6 and PS.6 consumer descriptions:
MIMC:L6 is a formulation/convention reexport, not a proof of BSD.6a/7a, and
HE.8b does not prove the Eisenstein input it imports from BSD.7a. PS.6 preserves
exceptional-prime gates rather than inferring a full formula from finite Sha.

## Consumer and cycle attacks

All **22** extracted endpoint/member/consumer descriptions are literal text in
their source documents. I read all **20** external line contexts returned by
screening current content README files for `RankZeroOneBSD` and BSD-stage
references. These include the MP.7/8 nonvanishing-supplier boundary, GH.4/7
reciprocity inputs and the source-specific congruence/reexport directions.
No additional narrowed-stage consumer was found lacking its supplier handoff.

All **11** owner rows have a link from their unique owner to every listed former
stage. All **86** links have distinct, live, non-retired endpoints and were read
with their reasons. The direct-consumer check uses the full graph union, so it
includes handoffs that themselves make BSD.1 a supplier to further stages:

| Narrowed stage | Direct consumers | Missing direct supplier handoffs |
| --- | --- | --- |
| BSD.0 | BSD.2, .3, .4, .5, .9 | 0 |
| BSD.1 | BSD.3, .4, .5, .6, .6a, .7, .7a, .8, .9 | 0 |
| BSD.5 | BSD.6, .6a, .7, .7a, .8, .9 | 0 |
| BSD.9 | None | 0 |

The four pre-existing external exports survive: BSD.7a→HE.8b,
BSD.6a/7a→MIMC:L6 and BSD.8→PS.6. Their producer IDs are preserved because
they export the additional proofs/certificates, not a removed foundation.

The baseline combines atlas edges, stage requirement/consumer fields, proposed
roadmaps and all current link packets: **4,440** distinct pairs. Of RS-30's 86
pairs, **25** already exist; the union has **4,501** pairs. Searching the whole
union for a return path for each proposal edge finds none. Including every
other accepted restructuring gives **7,053** pairs, again with no return path
for any RS-30 edge. The changed counts since REV-RS-30 reflect the current link
catalogue, not a lost proposal edge. This does not certify every unrelated
pre-existing edge as mathematically justified.

## Library evidence and validation

Read all **57** target/qualification records and their duplicate leads across
the twelve integrated reviewed AUDIT-27 member layers. Their absence and
implementation claims remain attributed to that audit; this is not a fresh
library-wide absence search. In particular, explicit 2-descent does not supply
the general cohomological Selmer/Sha package.

Independently read the cited statements with surrounding hypotheses at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, and compared all four local source
files byte-for-byte with their pinned remote copies:

| Source | Load-bearing declarations |
| --- | --- |
| [FinitelyGenerated.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean#L64-L139) | `finite_torsion`, `fg_point`, `fg_point_of_variableChange`, `fg_point_of_numberField`, with Northcott, ellipticity and the relevant field/domain hypotheses. |
| [Regulator.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean#L65-L114) | Basis-change congruence and determinant invariance, the absolute Gram determinant on `PointModTorsion`, arbitrary-basis computation and rank-zero value one. |
| [CanonicalHeight.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean#L116-L125) | Actual height definition and, at lines 369–393, `neronTatePairing`, its halved-polar formula and diagonal value. |
| [QuadraticTwist.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean#L797-L814) | Point equivalence; naturality at 857–865 and character-equivariance at 918–940, under separable quadratic/tower/ellipticity hypotheses. |

The paired Mathlib pin is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
No kernel build or transitive axiom audit is claimed. The member's source-readiness
gates for HE.7, CM/dyadic descent and the enumerated prime branches remain future
proof work. I did not redo every source-paper proof; I checked that restructuring
keeps those proof obligations and their hypotheses with the appropriate owners.

Validation:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-30.result.json`: passed.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-30.result.json`: passed.
- `python3 research/blueprint/intake.py check-files` on the two deliverables: passed.
- Independent inventory, owner/supplier handoff, source-text, live-endpoint,
  graph, pinned-byte and input-immutability checks: passed.

Only the two RT deliverables change. The accepted result, reports and upstream
roadmaps remain untouched. No Lean file was required, written or compiled;
nothing is claimed formalised. No git command was run.
