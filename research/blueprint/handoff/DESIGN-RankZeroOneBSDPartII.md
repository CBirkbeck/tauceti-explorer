# DESIGN-RankZeroOneBSDPartII — complete planning pass

Issue #3339; worker Codex, GPT-6; session `codex-U5afty`; 2026-10-19.
Claim confirmed by bot comment 6264516760. This run handles this issue only.

## Deliverables and scope

The five named deliverables are the new roadmap definition, complete blueprint
packet, reader, compact suggested Lean file and this handoff. The packet has
**17 nodes: 3 definitions, 3 comparisons, 10 theorems and 1 application; 14 API
items; 12 discriminating definition tests; 13 planets; 13 source-read baseline
declarations; 10 supplier requests; 1 explicit shared gap; 2 source findings**.
Every node is `unchecked`. All six stages, EC.0–EC.5, are `planned`; none is
`closed`. The packet's `complete` status means the target-level planning pass
is finished, not that the supplier theorems have been implemented.

The aggregate issue brief includes work already supplied by the accepted
CMRankZeroConverse and RankOneConverse designs and their independent reviews.
Their CM and Skinner endpoints, respective C.0–C.6 and PC.0–PC.6 plans, remain
with those owners. This new continuation supplies the unowned good-odd-prime
Eisenstein converse from CGLS §5.2, its finite-Selmer form and its correctly
restricted statistical applications. It reuses the shared p-converse property
from CMRankZeroConverse C.0. It does not import Skinner's irreducibility,
localization condition or p≥5 into the p=3 Eisenstein argument.

The packet's `targetCoverage` records all three brief directions. Its
`restructure` proposals ask the maintainer to reconcile the CGLS `/35`, `/37`
and `/38` source-item routes: parity stays SI L4, the converse goes to EC.3,
and the density application and diagnostics go to EC.4–EC.5. BT and Skinner
routes retain their existing owners. No external packet or source route was
edited by this job.

## Mathematical route

Fix an actual rational cyclic p-isogeny, p>2 of good reduction, whose actual
kernel character restricted at p is neither 1 nor the mod-p cyclotomic
character. The parent BSD.7a provides ordinarity and local p-torsion vanishing.
Ordinary modular Selmer parity and the parent's two nonvanishing branches
give complementary twists of analytic rank 1−r for r=0,1, with a Heegner field
of odd discriminant below −4 and all level primes and p split. The forward
theorem is applied only to that known-rank twist before proving the converse;
odd-primary Selmer descent then gives corank one over K.

At P₀=(γ−1), rational ordinary control kills the characteristic-ideal
augmentation valuation of the rank-one ordinary dual's torsion. The parent's
CGLS Heegner index-square equality is used in Λ[1/p], without inverting P₀.
The compact specialization kernel and precise stabilized bottom factor are
recorded explicitly. They give a nonzero Kummer image of the classical trace
point; the general complex Gross–Zagier formula yields a simple zero over K.
Quadratic factorization subtracts the complementary twist order. The forward
theorem then gives arithmetic rank equality and finiteness of the whole Sha.

The finite-Selmer upgrade requires the shared Cassels–Tate pairing modulo
divisible subgroups. Its paired finite primary factors make the difference
between finite-Selmer dimension and p∞ corank even; square cardinality alone
does not suffice. Full Sha finiteness is never assumed in this step.

The twist application defines an admissible subset using both good reduction
at3 and the same character exclusion. Assuming a good-at3 twist exists,
finite-place Selmer ratios and the two real signs produce positive-density
zero and odd signed strata while the admissible3-adic class is held fixed.
ArithmeticStatistics already owns the restricted-family 1/2 and 5/6 bounds;
this roadmap applies the converse and retains each stratum's actual density.

## Stage coverage and exact frontiers

| Stage | Status | Work remaining at implementation |
| --- | --- | --- |
| EC.0 | planned | Implement the hypothesis bundle on upstream isogeny/reduction carriers; register and prove GAP-CT's paired-primary endpoint and the finite-Selmer dimension comparison. |
| EC.1 | planned | Instantiate ordinary modular parity, both complementary nonvanishing branches and odd-primary quadratic Selmer comparison on the same modular/elliptic carriers. The existing SI parity proof interfaces remain supplier-owned. |
| EC.2 | planned | Establish finite discrete-control errors using actual localization images, ordinary compact saturation and the specialization kernel, retaining H²/Tor terms. Implement the parent characteristic equality and match the exact Heegner/Gross–Zagier normalizations. |
| EC.3 | planned | Prove the p∞ converse from EC.1–EC.2 and invoke the forward rank/Sha theorem. Prove the finite-Selmer version after EC.0's shared endpoint is supplied. |
| EC.4 | planned | Implement local 3 admissibility and fixed-class ratio strata, use the existing rational local-family density interface and restricted statistics, and propagate GAP-CT through the finite-Selmer converse. |
| EC.5 | planned | Connect the concrete invariant and tangent calculations to actual point order, reduction, twisting and the local-family carrier. Preserve the denominator and no-good-twist diagnostics. |

**GAP-CT** is the unregistered shared elliptic Cassels–Tate modulo-divisible
endpoint. Existing `PAPER-SKINNER-20/83–86` extension routes and RankOneConverse
requests assign it to SI L1–L2; their accepted packet has no exact node stating
the alternating pairing's divisible kernels and paired finite odd-primary
quotient. Replace these stage requests by the supplier's exact node when it is
registered. The gap affects EC.0's finite-Selmer comparison, EC.3's mod-p
endpoint and EC.4's analytic twist conversion. The p∞ converse does not use it.

The ten requests, all mathematical interfaces recorded in the packet rather
than separate issues filed by this worker, go to:

1. EllipticCurves Layer1: actual isogenies, duals, stable-kernel quotients and flex/order-three comparison.
2. EllipticCurves Layer2: actual residual kernel character and Weil determinant identity.
3. EllipticCurves Layer4: reduction, isogeny invariance, integral j and the good-ordinary3 local-character/twist dictionary.
4. EllipticCurves Layer5: actual twists and twisted kernel characters; invariant j and local squareclasses.
5. EllipticCurves Layer7: finite Kummer/Selmer sequences, cofinite generation and coefficient comparison.
6. SI L1: the existing shared pairing with maximal divisible kernels and elliptic alternation.
7. SI L2: its paired-primary module structure and finite-Selmer dimension interface.
8. SI L3: the CGLS ordinary instantiation of its exact kernel/derived-control contracts.
9. ArithmeticStatistics ST.5: existing local ratios, signed convention and restricted-family bounds, preserving the chosen admissible3 class.
10. ArithmeticStatistics's ST.0 local-family node: rational weak approximation and positive squarefree local density with actual masses.

Generic Selmer structures, characteristic ideals, Heegner constructions, main
conjectures and statistical distributions are imports, never newly planned
constructions here. There is no new supplier moved above its existing owner.

## Source findings and versions

The published author PDF of CGLS was read directly, including §3.4,
pp.564–566; §4.1, pp.566–569; §4.2, pp.569–570; §5.2, pp.573–575 and the
standing hypotheses in the introduction. Its §5.2 was collated with
arXiv:2008.02571v2, pp.31–32. The packet retains URLs, SHA-256 hashes and
reading dates. The author publication listing, arXiv history and journal page
were checked on 2026-10-19; no separate correction was located there.

- **E1**, previously `PAPER-CASTELLA-ETAL-22/E2`: Corollary5.2.3's displayed
  proof needs existence of a good-at3 twist. The curve y²+xy+3y=x³ has a
  rational 3-isogeny, but Δ=−2160, c₄=−71 and v₃(j)=−3. Twists preserve j,
  so none has good reduction at3. The scoped positive-proportion theorem
  makes the extra hypothesis explicit. This is a proof-scope finding, not
  a disproof of the unrestricted density conclusion by other methods.
- **E2**, previously `PAPER-CASTELLA-ETAL-22/E33`: Remark5.2.4's percentages
  cannot be transferred through this converse without tracking admissibility.
  For y²+y=x³+x²+x, Δ=−19, c₄=−32, c₆=8 and #E(𝔽₃)=6. The rational
  order-three point is (0,0); precisely the signed squarefree d≡2 mod3 are
  admissible, with density 3/8. Thus a rank-one set obtained only inside that
  conversion family has upper density at most 37.5%, below the advertised
  41.6%. This does not disprove that percentage for the full rank-one set.
  Valid lower bounds retain μ(A₃∩T₀) and μ(A₃∩(T₁∪T₋₁)).

BKLOS's public author version was read in §§2,9–11, pp.2–5,14–18, especially
its restricted-family averages, local-ratio formulas and weak approximation.
Poonen–Stoll's public author version, corrected2014, was read in §1, p.2;
§2, pp.3–4; §6, Theorem8 and Corollary9, pp.11–12 for the shared pairing
interface. All source descriptions and findings use our own words; no source
passage is retained. No source needed by the new targets is missing. No
restricted book was used, and no source file is part of the submission.

## Baseline, upstream audit and Lean boundary

Read the reviewed library-coverage audit for the parent, SI and ST.5. Read
current upstream EllipticCurves and ModularForms documents and screened the
nine newer roadmap families, including OperatorTheory's nested suggested
files, plus the current Tau Ceti library. Current-roadmap commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current-library commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was modified or
built. The pairing endpoint is not explicitly promised by upstream Layer7's
Selmer/Sha and isogeny-invariance targets; the existing SI extension owns it.

The thirteen baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: WeierstrassCurve, Δ, c₄, c₆,
IsElliptic, j, map, quadraticTwistOf, Δ_quadraticTwistOf, number-field logarithmic-height Northcott, finite naive-height sets, canonical-height nonnegativity and canonical-height zero iff finite additive order. The last four supply positive Heegner height without planning any new height theory; GZ.0 supplies its pinned/Poincaré normalization. The existing raw
twist has trace/norm parameters t,n, hence scaling by (t²−4n)⁶. The model
test uses t=0,n=−2 and factor8⁶, rather than confusing this model with a
one-parameter normalized twist.

The suggested file is **83 lines**. It has one real-bodied coefficient
definition, five API statements, four model-test signatures and one numerical
diagnostic. Its ellipticity assertion is a theorem, and the j signature takes
an explicit IsElliptic parameter. Heavy definitions, their APIs/tests and the
arithmetic endpoints are fully specified in the reader because their actual
supplier carriers are absent at the pins. The finite-field test reduces the
integral coefficient tuple; it does not assert a map from ℚ to 𝔽₃. The tangent
test states the numerical substitution; order-three identification remains
with the specified upstream point/isogeny interface.

`lean-check` succeeded at the pins on 2026-10-19: exit 0, zero errors, ten
`declaration uses` proof-placeholder warnings and no other warnings. Memory
was checked first and exceeded the required 20 GB. No language server, cache
download, library update or build was started.

## Validation and review handoff

- Blueprint checker with the existing pinned declaration index: **0 errors, 0 warnings**; inventories match the counts above.
- Source-issue schema is checked by the blueprint checker; the source-version validator also passes. The standalone errata-job CLI requires `errata-v1` and is not the packet checker.
- Intake path/content check: all five authorized deliverables, valid JSON and no local paths or extracted source text.
- Suggested-file data-placeholder check: passes; the only data definition has an actual body.
- Independent exact-rational arithmetic check: both curves' discriminants, c₄, c₆ and j agree with the existing formulas and 1728Δ=c₄³−c₆²; exhaustive enumeration gives five affine points modulo3.
- Reader/packet target, API, test and stage coverage correspondence and the projected stage dependency graph were checked; at most four planets occur in any layer and every planet name has at most 60 characters.

An independent reviewer should concentrate on the ordinary-control
instantiation and its compact specialization kernel, the single-owner pairing
frontier, the Heegner normalization at augmentation and the admissible local
denominators in the statistical application. The initial planning job is
finished; supplier implementation and the named frontiers remain as above.
All information needed to continue is in the five deliverables. Scratch
downloads and generation scripts can be deleted after the PR opens.
