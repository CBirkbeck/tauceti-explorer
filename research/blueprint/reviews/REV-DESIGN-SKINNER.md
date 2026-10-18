# Independent review of RankOneConverse

Accepted on 2026-10-18 by Codex, session `codex-NTUrrW`, for
[issue #955](https://github.com/CBirkbeck/tauceti-explorer/issues/955).
This reviews DESIGN-SKINNER by a different session. The acceptance is a verdict
on a complete target-level planning pass: PC.0–PC.6 remain **planned**, none is
closed, fourteen supplier requests remain, and every implementation status is
`unchecked`.

The [packet](../packets/RankOneConverse.json) contains a verdict and reason for
every node and source finding. The [reader](../readmes/RankOneConverse.md) and
[roadmap definition](../roadmaps/RankOneConverse.json) have been synchronized.
The [suggested Lean file](../suggested/RankOneConverse.lean) was checked without
changes: the corrections concern arithmetic carriers that properly remain
README targets under the binding roadmap shape.

## Counts and coverage

| Item | Reviewed result |
|---|---:|
| Nodes | 26: 18 verified, 8 corrected |
| Kinds | 6 lemmas, 7 comparisons, 3 constructions, 1 definition, 8 theorems, 1 application |
| Nodes added or removed | 0 |
| Definition/construction API items | 17 |
| Discriminating unit tests | 18, including 1 added |
| Planets | 12; layer counts 1, 2, 3, 2, 2, 1, 1 |
| Baseline declarations | 9 confirmed; 0 removed or replaced |
| Source findings | 13: 12 confirmed, 1 rejected; 1 finding added |
| Stages | 7 planned, 0 closed |
| Internal gaps / supplier requests | 0 / 14 |

All stage targets are realized. The graph remains acyclic and at target level;
no proof has been split into an unnecessary chain of lemma nodes. Theorems A,
A′, B, C and E retain the squarefree and local hypotheses of the published
statements. Theorem D remains with ArithmeticStatistics ST.4 as a downstream
consumer. In particular, B(d) is conditional on a common level/discriminant
prime, and B concludes finiteness of the entire Tate–Shafarevich group.

## Corrections made

1. **PC.0/normalized-heegner-point.** Wrote the actual rational representative
   explicitly as the degree-zero class of the CM divisor minus its degree
   times the normalized degree-one Hodge class. Its coefficient projection is
   the Hecke-normalized point. This makes the input to BSW unambiguous; the
   refined coefficient idempotent is not silently absorbed by the quotient.
2. **PC.0/transfer-differential.** Corrected the source match: Brooks §2.7,
   p.4190, supplies rational normalization of the transferred form, while the
   Petersson-norm ratio comes from its separate GZ.9 supplier. The quotient
   logarithm comparison is in Brooks §8.6, p.4239.
3. **PC.1/selmer-parity.** Added p∤N, matching Skinner Lemma 2.2.1, p.337;
   p∤D already follows from splitting. The imported ordinary parity statement
   is broader, but every application here uses good p. No final theorem has
   acquired an additional hypothesis.
4. **PC.2/deformed-selmer.** Replaced the claim of finite errors under lattice
   change by bounded p-primary kernels and cokernels, with an isomorphism of
   compact duals after inverting p. Added the test Λ/(p): it is infinite but
   killed by p, and its characteristic ideal becomes a unit after inverting p.
   Finite augmentation errors still require the separate local calculation.
5. **PC.2/wan-divisibility.** Added the distinction between p-primary errors
   and arbitrary pseudo-null errors over a two-variable ring. The latter
   cannot simply be discarded after inverting p. The proof retains Wan's
   actual fixed-weight Fitting bound, exact control, Fitting base change and
   divisorial closure. Corrected Skinner–Urban's author-copy locators to
   §3.1.6, pp.19–20, and Proposition 3.2.8/Corollary 3.2.9, pp.23–24.
   Added the precise published Wan §7E locator, pp.445–449, and synchronized
   the source reading records in both JSON files.
6. **PC.2/augmentation-control.** Replaced a purported finite difference
   between rational conditions by their exact equality. The kernel of local
   restriction to inertia is the unramified cohomology of the inertia
   invariants, which vanishes by the good-ordinary Frobenius calculation.
   The finite integral control error remains a distinct obligation.
7. **PC.4/theorem-a.** Made the analytic order d conclusion explicit: run
   the converse argument for every Galois conjugate, whose modular abelian
   isogeny class and local alternatives are unchanged, then take the actual
   product of the conjugate L-functions. Added BSD.0 as a direct prerequisite,
   its request's consumer, and a PC.4 layer input.
8. **PC.6/theorem-e.** Similarly justified nonvanishing for every conjugate
   before taking the abelian L-function product. Nonvanishing for just one
   embedding is not treated as a product-order argument.

The reader includes each corrected statement, hypothesis, proof step, API,
test, locator and dependency. It now records independent acceptance and the
source-verdict distinctions below. No baseline citation needed correction,
no new mathematical node was necessary, and no supplier's files were edited.

## Source verification

All seven public PDFs were read at the relevant locators; their URLs, access
date and SHA-256 hashes are recorded in the packet. Skinner was read in full.
The directly checked inputs include:

| Source | Material checked |
|---|---|
| Skinner, Annals 191 (2020), 329–354 | Theorems A–E, all local/representation conventions, Lemmas 2.2.1–2.3.2 and 2.8.1, Propositions 2.5.1–2.7.3 and their proof arguments |
| Burungale–Skinner–Wan, arXiv:2603.20886v2 | Theorem 1.1, Theorem 2.3, Remark 2.4 and the analytic-subgroup proof in §§3–4; actual-point and coefficient-projector boundary |
| Wan, Algebra & Number Theory 14 (2020) | Theorem 1.2, pp.385–386; §2B–C, pp.392–394; §7E, pp.445–449; fixed-weight Fitting bound in the proof on p.480 |
| Brooks, IMRN 2015 | §2.7–2.8, pp.4190–4191; Theorem 8.11 and §8.6, pp.4237–4239, with the final page visually checked |
| Skinner–Urban author-hosted copy | Fitting/divisorial algebra, §3.1.6, pp.19–20, and the control/specialization results of §3.2, pp.23–26 |
| Poonen–Stoll author-hosted copy | Pairing conventions and kernel; §6, Theorem 8 and Corollary 9, pp.11–12, including paired elementary divisors rather than cardinality alone |
| Bump–Friedberg–Hoffstein (1990) | Both branches of the introductory theorem, printed pp.543–544, read from the rendered scan |

The Wan source is the published **ordinary** theorem, not the withdrawn
nonordinary preprint. The finite branch character and exact coefficient-ring
comparison remain part of the explicit supplier requirements. The BFH theorem
applies to the normalized first twist even when its level is not squarefree.
A positive second discriminant split at all relevant primes preserves the
first discriminant's local characters and produces the appropriate value or
derivative nonvanishing branch. Infinitely many choices can be obtained by
enlarging the split set to exclude each previous discriminant.

The source findings received the following independent decisions. The packet
retains each precise locator, reason, correction and correction-search record;
all source descriptions use our own words.

| Finding | Verdict and clarification |
|---|---|
| E1 | Confirmed: componentwise-logarithm justification missing in Lemma 2.2.2; BSW §1.2, p.2, identifies it and Theorem 1.1 supplies it. |
| E2 | Confirmed: Corollary 2.6.2 needs the chosen eigencomponent to be nonzero; apply BSW to the actual point before coefficient projection. |
| E3 | Confirmed as UFD terminology; the specialization proof separately requires Fitting/control algebra. |
| E4 | Confirmed: the hypothetical invariant line is for restriction to G_K. |
| E5 | Confirmed: the tame-inertia argument uses one selected ramified prime. |
| E6 | Confirmed only as a dropped form argument; corrected the locator to the proof of **Proposition 2.6.1**, p.344. The text already explains the projector comparison, so the original description of an unidentified choice was removed. |
| E7 | Confirmed after moving the locator to the **opening of §2.6**, p.341. |
| E8 | Confirmed: the rank bound needs the finite-condition subscript. |
| E9 | Confirmed as character/extension terminology. |
| E10 | Rejected as a substantive gap: §4 abbreviates the auxiliary-field argument and BFH has the derivative branch required. The blueprint rightly expands that branch; the source does not claim that the sign alone proves simplicity. |
| E11 | Confirmed after correcting what the citation supplies: rational transfer normalization in Brooks §2.7, not a Petersson-norm definition. |
| E12 | Confirmed visually: Brooks Propositions 8.12–8.13 have lost the logarithm square present in Theorem 8.11. |
| E13, added | Confirmed: the intervening logarithm pullback rule on p.4239 assigns its input point to the target instead of the source curve. |

The Annals landing page and existing atlas correction records were checked.
Primary-source searches for Brooks corrections at OUP and EPFL did not surface
an erratum; the publisher/DOI landing pages could not be retrieved. This is
recorded as a search limitation, not proof that no correction exists.

## Baseline, ownership and closure

All nine declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, with surrounding hypotheses:

- `Module.finrank`, `LinearMap.ker`, `LinearMap.fst`, `LinearMap.snd` and
  `LinearMap.prod` provide the finite-dimensional and product-map substrate.
- `continuousCohomology` is the existing topological-cochain homology carrier;
  it does not supply Bloch–Kato conditions or arithmetic duality.
- `TauCeti.AlgebraicGeometry.AbelianVariety` and its `TangentSpace` provide
  the geometric carriers, with no new abelian-variety definition needed.
- `WeierstrassCurve.Affine.selmerGroup₂` is concrete square-class 2-descent,
  distinct from the requested odd-p and rational finite Selmer comparisons.

The reviewed library audit was checked for BSD, Selmer, Iwasawa algebras,
heights and Heegner descent. Current read-only TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also checked. The nine
post-snapshot roadmap trees were searched; the nearby EllipticCurves and
LocalGaloisGroups readers were read for their existing scope. EllipticCurves
Layer 7 already owns general discrete Selmer structures and finite elliptic
Kummer/Sha targets; the packet imports them and requests only further
comparisons from the proposed Selmer owner. No upstream file was changed or
built.

Every cross-roadmap node was checked against its exact supplier statement,
including nodes held in split packets. In particular, GZ.9's Kummer-logarithm
comparison covers arbitrary abelian points, while its eigenlogarithm result
requires an actual point. HE.7's admissible-RM theorem alone does not supply
the full GL₂-type forward theorem, and the elliptic BSD.3–4 nodes do not
replace that obligation. The existing exact-control and analytic-period
nodes also do not silently close the general ramified/quaternionic cases.
The fourteen requests state these extensions precisely and remain with the
existing owners. No ownership move, duplicate foundation, dependency on
statistics, or new successor roadmap is needed.

There are no questions requiring an orchestrator decision. Supplier exports
and inherited supplier proof obligations must be resolved before packaging
can claim closed layers; this review does not discharge them.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankOneConverse.json`:
  **0 errors, 0 warnings**.
- Source-issue structure, source-version consistency, complete review matrix,
  reader synchronization and definition/test counts: **passed**.
- Intake `check-files` for all five changed files:
  **0 problems**.
- `git diff --check`: **clean**.
- `lean-check research/blueprint/suggested/RankOneConverse.lean`:
  **exit 0** at pinned Mathlib, with only the ten expected proof-placeholder
  warnings. The file remains 106 lines, with one real-bodied definition,
  four API signatures, four examples and two layer milestones. Available
  memory was 78 GiB before compilation. No Lean server or background process
  was left running.
