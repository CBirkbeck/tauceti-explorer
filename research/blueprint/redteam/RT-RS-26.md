# RT-RS-26 — structural red-team report

Worker: Codex — codex-a71f92. Issue: #1623. Date: 2026-09-24.
Target: accepted RS-26. Status: complete, with no substantiated findings.

The proposal survives this attack. It preserves three distinct programmes:
the common cyclotomic (φ,Γ) engine, regulators, and local Langlands for
GL₂(Q_p). All 25 stages remain, the nine shared-owner contracts agree with
the member documents, and the five added dependencies introduce no cycle or
loss of an existing consumer input. This is not certification of the
underlying mathematical proofs.

## Inputs and independence

Snapshot: `1ed743b888d9015618f5b6c56c2c2f0fd4ee8904`.
Submission preflight at `b5a41a198ef1117dd139638563e6f80fdf89f17d`
found no intervening changes to the attacked files, member/supplier/consumer
documents, atlas, coverage, rules or validation scripts.
I read the complete family, accepted result, author report and independent
review, and all three complete member documents:

- [Regulators](../../../content/campaign/PadicHodgeRegulators/README.md)
- [Local Langlands](../../../content/campaign/PadicLocalLanglandsForGL2Qp/README.md)
- [(φ,Γ)-modules](../../../content/campaign/PhiGammaModulesAndIwasawaCohomology/README.md)

The proposal author is `astra-7c41e9`; its reviewer is
`astra-20260921-f6b2d8`. Neither is this worker. I did not write or review
RS-26. No target, roadmap, audit or atlas file is changed by this submission.

The companion JSON records SHA-256 hashes of the two attacked files, all
three member documents, the full atlas and reviewed coverage. All 25 atlas
stage descriptions were independently matched, after whitespace normalization,
to the complete documents just read; all 25 IDs match the explicit keep ledger.

## Attack on ownership and target conservation

The 24 directed family leads reduce to 12 unordered pairs. They are explicitly
unreviewed audit leads, not independent duplicate proofs. I checked every pair
against the current source scope:

| Pair, using Reg/PLL/PG abbreviations | Why no defect was established |
|---|---|
| Reg L2 / PLL R30.1 | Both import PG.0–3; regulator generator/lattice diagrams and the GL₂ covariance bridge are different outputs. |
| Reg L2 / PLL R30.3 | A common source category does not identify the regulator with Colmez's representation construction. |
| Reg L2 / PG.0 | PG.0 owns specialized cyclotomic coefficients and semilinear modules, on the early analytic carrier. |
| Reg L2 / PG.1 | The equivalence and inverse maps are PG.1 imports, not another construction at L2. |
| Reg L2 / PG.3 | Generic Herr/cochain, sign, cup and dyadic comparisons stay at PG.3; regulator-specific diagrams remain L2 work. |
| Reg L2 / PG.5 | PG.5 supplies the actual ψ/Iwasawa comparison; Selmer L3 supplies its independent inverse-corestriction target. |
| Reg L4 / PG.6 | Wach existence, freeness and generic basis change are not the LLZ logarithmic matrix and integral image theorem. |
| Reg L4 / PG.7 | Relative perfectness/base change and a qualified regulator/interpolation theorem are distinct. |
| PLL R30.1 / PG.0 | R30.1 explicitly forbids a second coefficient or module carrier. |
| PLL R30.1 / PG.1 | The fixed-field equivalence is imported; the GL₂ normalization bridge remains. |
| PLL R30.1 / PG.2 | Overconvergence is imported without equating all Robba modules with étale ones. |
| PLL R30.1 / PG.7 | Specialization of a later relative category does not make the earlier fixed-field construction depend on the family theorem. |

All nine owner endpoints exist. The analytic carrier belongs to
`PadicHodgeTheory:P7:annulus-foundations`; specialized coefficients,
Fontaine equivalence, overconvergence, Herr comparison, ψ, ψ/Iwasawa
comparison, Wach theory and relative cohomology belong respectively to
PG.0–7. The `formerly` arrays mark shared occurrences/import sites, not
deletions from the unchanged applications.

I checked conservation beyond the abbreviated action labels:

- Reg D.1–D.5 retain normalized analytic comparisons, the syntomic/étale
  construction, the derived-completed unramified p>3 K₃ theorem, arithmetic
  localization, and good-reduction curve regulators. KU-padicreg remains
  readiness aggregation. No ramified or small-prime extension, global
  injectivity, or unconditional p-adic Beilinson theorem is introduced.
- Reg L0–L4 retain period imports, Bloch–Kato maps, the PG comparison interface,
  the vector big logarithm, and signed/de Rham-domain extensions. Scalar
  projections still require a defined functional; singular Euler operators
  still require their kernel/cokernel or exceptional-zero treatment.
- PLL R30.1–R30.6 retain covariance, the three representation categories,
  Colmez/Galois functors, locally algebraic vectors, projective envelopes,
  and the separate local theorem branches. There is no GL₂(K) upgrade or
  conflation of local equivalence with global completed-cohomology occurrence.
- PG.0–PG.7 retain field-of-norms descent, integral/torsion/rational distinctions,
  overconvergence, chain-level Herr comparison, integral ψ, degrees-(1,2)
  derived Iwasawa comparison, bounded unramified Wach theory, and relative
  Tor/exceptional-locus qualifications. In particular, the dyadic branch
  does not use exact averaging over order-two torsion.

The family contains no Tau Ceti anchor, and the proposal changes no Tau Ceti
roadmap or stage. Distinct outputs sharing a supplier do not require a merger
or a Part II rename here. No stage is dropped, narrowed, moved or renamed.

## Five dependency attacks

I read the source and target descriptions for every proposed edge, including
the early-versus-late PHT scope, Selmer L2/L3, PG.5's final comparison,
Reg L1/L2/L4, PLL R30.1 and PadicFamilies L4. I also read PHT R06.1/R06.2,
ArithmeticGaloisDuality D7/R02.1 and GL₂ R16.3 to check the claimed suppliers.

| Proposed edge | Contract and old graph path |
|---|---|
| Early PHT annulus → Reg L2 | Analytic carrier import already explicit in L2; previously reachable through PG.0–5. |
| Early PHT annulus → PLL R30.1 | Same early carrier, not late period comparison; previously through PG.0. |
| PG.6 → Reg L4 | Wach object/freeness/basis input for the signed maps; previously through PG.7. |
| PG.7 → PadicFamilies L4 | Relative triangulation/cohomology/specialization at the expressly named consumer; no old path. |
| Reg L1 → PG.5 | Final Bloch–Kato normalization comparison, not the ψ construction; previously through Selmer L2 → L3. |

The new family edge does not supply arithmetic classes, reciprocity,
constant crystalline rank, or uniform integral lattices. Those conclusions
are not consequences of relative cohomology alone.

The independent graph reconstruction used both `stageEdges` and
`stages[].requires`; their edge sets agree exactly:

- 1,968 stage vertices and 51 external input vertices: 2,019 total.
- 3,508 edges before RS-26; five distinct, previously non-direct additions;
  3,513 afterward.
- Both graphs are acyclic. No proposed target has a return path to its source.
- Four additions expose existing paths. Only PG.7 → PadicFamilies L4 adds
  reachability.

As adversarial controls I substituted Reg L2, L3 and L4 as suppliers to PG.5,
and full PHT P7 as supplier to PG.0. Every substitution creates a cycle.
Concrete return paths include PG.5 → Reg L2, PG.5 → Reg L2 → Reg L3,
PG.5 → PG.6 → Reg L4, and PG.0 → PG.1 → PG.2 → PG.3 → full PHT P7.
The accepted proposal uses none of these substitutions.

The early annulus extract includes trailing prose about later period
comparisons. Its opening scope explicitly excludes Herr/Wach/regulators,
and its recorded prerequisite is R06.1; full P7 separately imports PG.3/6.
I checked that distinction rather than treating all text under the parent
heading as prerequisites of the early construction.

Likewise the coarse Selmer graph already makes Reg L1 reachable at PG.5.
The proposal's explicit late-normalization qualification preserves an
independent ψ/core comparison proof. This is not evidence that the core
theorem should be rebuilt from the big logarithm.

## Consumer preservation

I enumerated and read every one of the 21 direct external consumer
descriptions in the recorded atlas:

- CompletedCohomology R31.4 and GL2ModularityLifting R32.1;
- EllipticRegulators ER.8 and KU-ellipticpadic;
- GeneralizedHeegnerCycles GH.2, GH.4 and GH.7;
- GrossZagierAndArithmeticHeights GZ.9 and HeegnerPointEulerSystems HE.3;
- HabiroNumberFields HB.7 and KU-habiromodules;
- KatoEulerSystems L3 and ModularIwasawaMainConjectures L0;
- MotivicEtaleKTheory M.8 and full PadicHodgeTheory P7;
- Polylogarithms P.6 and SpecialValuesBirchTate KU-conjectures;
- RankZeroOneBSD BSD.6a and BSD.7a;
- SelmerIwasawaCohomology L2 and L4.

Every old edge and its supplying stage survives. The restrictive branch
conditions survive with the supplying statements: the unramified p>3
normalization for Habiro, good-reduction syntomic comparison for ER,
integral Coleman-image corrections for signed Selmer conditions, and the
separate nonzero/injective/isomorphism and small-prime local–global ranges.

PadicFamilies L4 is the additional direct consumer. I also read
AutomorphicCongruences L3 and ModularIwasawaMainConjectures L4, named in the
author's prose. Their textual or transitive use is not counted as a
pre-existing direct edge.

## Library and audit attack

All ten Regulator entries in reviewed coverage were read. Reproducing the
actual `merge_library_audit.py` projection without writing the aggregate
gives exact equality with accepted AUDIT-26 for targets, verdicts, selected
evidence and duplicate lists. REV-AUDIT-26 was read in full.
KU-padicreg has no audit record. The six PLL and eight PG stages are not in
the reviewed aggregate; AUDIT-33 and AUDIT-38 remain pending. Their target
and duplicate lists were read only as leads. In particular, an unreviewed
description of the Coleman norm as “ψ” is not adopted as an identification
with the additive normalized-trace operator.

I independently checked both specific Mathlib citations at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, accessed 2026-09-24:

1. [CyclotomicCharacter.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean):
   read the definition, roots-of-unity specification, reduction and Galois
   continuity statements with their surrounding hypotheses. Without enough
   roots of unity the definition is trivial; the desired specification
   requires the appropriate instances. Continuity alone supplies no
   convergent Robba action. The header's old future-work sentence is not
   evidence against the actual later declarations.
2. [ContCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean):
   read the entire file, including `TopRep.homogeneousCochains`,
   `continuousCohomology`, the coefficient/topology assumptions and
   iterated-continuous-function convention. The file's unresolved comparison
   with the usual n-variable model must not be replaced by an alleged
   existing Herr or inverse-corestriction quasi-isomorphism.

GitHub's pinned blob IDs match the read copies:
`9e9cdccb270bfa4a2f909181e931e40309c973e4` and
`b99681e6460d7a79fcd3d65f6660d3e317e5debb`.
Their SHA-256 values are respectively
`7ebfb3362d5a8ae5e0a47cb525209acfb0786c4986385800e70d8e2d7e2146f8`
and `894d44893c995096ce5b1b83f3cbe9d3e35b56b86bf0c6944fceaac36ee13110`.

The paired Tau Ceti baseline remains
`f790474821cf4256814db967cb154e7af3d0c369`. I did not repeat an exhaustive
whole-library absence audit or the proofs of Fontaine, Herr, Berger, KPX,
LLZ or Colmez. No such claim is needed for the no-deletion ownership result.

## Limits, checks and handoff

No additional error, missing owner or duplicate within this restructuring
was established. The known cross-family Chern-class, elliptic-regulator,
generic representation-category and differential-equation interfaces remain
the proposal's explicit coordination tasks; this result does not silently
declare them resolved.

The graph claim concerns the complete **recorded atlas plus RS-26**, not
the simultaneous application of all pending proposals, or dependencies
inside proofs that have not yet been decomposed. All relevant stage
descriptions and tests remain obligations; no library implementation or
primary-source proof completion is promoted.

The unchanged proposal passes `scripts/check_restructure.py` and its
eight regression tests. Independent checks pass for 25-stage conservation,
12-pair accounting, nine owner endpoints, five additions, acyclicity,
four negative controls, 21 old external consumers and ten audit projections.
The companion `redteam-v1` result is complete with an empty findings list.
The red-team validator passes; the intake scope check reports two files and
zero problems. All 52 restructuring, red-team, intake and red-team-queue
regression tests pass. No Lean file is required or compiled.

For independent verification, start at the two delicate dependency cuts:
early PHT annuli versus late P7, and Reg L1's normalization comparison
versus the Reg L2–L4 constructions. There is no unfinished work required
for this bounded red-team job.
