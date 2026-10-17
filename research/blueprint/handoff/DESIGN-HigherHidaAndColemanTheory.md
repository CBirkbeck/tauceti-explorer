# DESIGN-HigherHidaAndColemanTheory

Agent: Codex. Session: `codex-vKSHH6`. Issue: #10100. The bot confirmed this
session's claim in issue comment 6226572082. This is a complete target-level
planning pass for the issue's four deliverables, with this handoff as the fifth
file. It is ready for independent review, not a claim of mathematical closure
or implementation.

## Result and coverage

The new roadmap is a Part-II-style extension of `PadicFamilies`, in area
`automorphic`. It separates the all-genus integral Siegel Hida theorem from the
general abelian-type Coleman theorem with quasi-split local group. Hodge/PEL
data satisfying the latter hypotheses are included. Extending integral Hida
theory to arbitrary Hodge/PEL data is G1, rather than an unsupported theorem.

The packet has 66 nodes: 15 definitions, 6 constructions, 40 theorems,
1 comparison and 4 applications; 88 API items, 63 discriminating unit tests,
37 planets, 4 checked baseline declarations, 24 supplier requests,
7 rescoping proposals, 8 mathematical gaps and 9 source findings.
Every definition and construction has uses, an API, and at least three tests.

| Layer | Status | Main output |
| --- | --- | --- |
| A0 | planned | Weight dictionary, relative cone exclusions, scalar normalization |
| D1 | planned | Dynamical supports, ordinary finiteness, perfectness, base change and duality |
| H2 | planned | Integral Siegel strata, normalized fixed-weight complexes and Cousin control |
| I3 | planned | Admissible towers, perfect Iwasawa complexes, derived control, Hecke image and duality |
| C4 | planned | Geometric Bruhat-supported Coleman theory, vanishing, duality and classicality |
| F5 | planned | Analytic coefficients, perfect slope blocks, Tor specialization and BGG control |
| E6 | planned | Cohomological eigenvariety, interior deformation and sharp interior bounds |
| B7 | planned | Siegel ordinary/Coleman comparison and rational amplitudes |
| X8 | planned | Modular, genus-two, singular Klingen and split-unitary Checks; consumer contract |

All nine stages are planned; none is closed. Every implementation status is
`unchecked`. The README carries the exact targets, hypotheses, direct inputs,
proof routes, locators, APIs, tests, worked computations and acceptance checks.
The roadmap definition's stage requirements are generated from the packet's
direct dependencies and agree with them.

The modular Check imports the degree-zero ordinary module from
`PadicFamilies:L0`, and retains the degree-one dual family. The genus-two Check
keeps central/parity restrictions and distinguishes naive, integral and
standard operator slopes. The Klingen family is one-variable partial ordinary,
with all-k integral local control and all-k rational global Klingen control;
the hyperspecial torsion H0 assertion has the separate range k > p+1.
The unitary Check has all n+1 Weyl strata and asserts rational Coleman results,
not an unproved integral unitary Hida theorem.

## Baseline and ownership checks

Read the relevant reviewed records of `data/library-coverage.json`, the
supplier stage descriptions and the exact external nodes used by the packet.
The new roadmap has no pre-existing reviewed audit entry of its own. Generic
solid localization, continuous derived algebra, compact spectral machinery,
Igusa geometry, compactifications and coefficient representations remain with
their existing owners.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, read the actual declarations and
assumptions of `Module.End`, `zpow_sub₀`, `DerivedCategory` and `CondensedMod`.
The last two do not provide solid analytic localization or six operations.
Searches of the pinned library did not find the higher supported automorphic
complexes, their control theorems or their cohomological eigenvarieties.

Also searched the read-only current TauCetiRoadmap at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the full current
AlgebraicVectorBundles and ReductiveGroups reader documents for the bundle and
root interfaces. Checked the nine additions that postdate the atlas snapshot
and their suggested files, including OperatorTheory's nested files. No
existing target was replanned. Nothing was built in those read-only trees.

Exact imports include the locally finite ordinary projector, four
finite-slope-complex interfaces, complex spectral support, toroidal period
maps, Bruhat tubes and level groups, and Levi reduction. The 24 stage-level
requests are explicitly strengthened mathematical contracts, not statements
that their current stages already prove everything needed here.

Seven rescoping proposals place generic extensions in their owners' Part II:
PadicFamilies L2a; ShimuraCompactifications C3/C5;
HodgeTateAndCanonicalSubgroups T5; PerfectoidShimuraVarieties S4;
OverconvergentAutomorphicForms O0/O1; AdicSpacesPartII R3/F1; and
AnalyticStacks AS.3. The other requests import the named existing owners for
weights, measures, automorphic bundles, PEL models, derived algebra and solid
rings. No supplier files were edited. There are no upward Caraiani–Newton
consumer imports: potential modularity and Siegel lifting consume X8's output.

## Sources read

The packet and README give public URLs, exact editions, hashes, reading dates
and numbered statement/page locators. All prose and proof routes are in this
roadmap's own words. No source excerpt, PDF, extracted source text or private
absolute path is included in the deliverables.

- Boxer–Pilloni, *Higher Hida theory for Siegel modular forms*: 65-page author
  edition, §§1–6, especially supported dynamics, Igusa normalization,
  interpolation and §6 comparison. Journal identification: Inventiones 244
  (2026), 45–141, DOI 10.1007/s00222-025-01393-2. No public arXiv identifier was
  located in the title and author-listing searches; the author URL and hash
  replace a guessed identifier. This is an explicit bibliographic deviation
  from the brief's requested arXiv citation.
- Boxer–Pilloni, *Higher Coleman theory*: arXiv:2110.10251v1, 19 October 2021,
  174 pages, checked against the revised 180-page author edition. The revised
  edition, identified by its hash and 3 March 2025 file metadata, is normative
  for every unqualified Coleman locator. Read the introduction, support and
  duality inputs, §3 root/representation conventions, the used §4 geometry and
  torsor reductions, §§5.4–5.12, §5.14 and §§6.1–6.10.
- Pilloni, *Higher coherent cohomology and p-adic modular forms of singular
  weights*, Duke 169 (2020), 2511–2659: maintainer-cleared 113-page author
  edition. Read the used introduction, §2, §§5.1.3–5.1.5, §9, §10.7, §11,
  §§13.1–13.3 and §§14.7–14.9, including the inverse-different lattice and
  trace divisibility argument on pp. 103–106. The cleared file was read in
  place and was not copied or extracted to a file.
- Boxer–Pilloni, *Higher Hida and Coleman theories on the modular curve*:
  arXiv:2002.06845v2, 11 September 2022, Theorems 1.1–1.4 and §2.1, for the
  modular normalization and degree-zero/degree-one Checks.

No target is blocked on access to an uncleared book. References made within
these papers do not imply that their books or full reference lists were read.
Findings E1–E9 are scoped to the exact author versions read, not to unread
journal typesettings. Author listings, original/revised Coleman files and
title-plus-erratum searches were checked; no novelty claim is made.

## Precise open obligations

The packet's coverage records list each stage's direct requests and gaps.
Follow-up work must discharge or respecify these, rather than change the
coverage flags alone:

1. **G1:** general integral Hodge/PEL Hida geometry and trace-integral dynamics
   beyond the proved Siegel setting.
2. **G2:** sharp integral amplitudes in genus at least three, still
   Conjecture 5.6.1 in the Hida author edition. The genus-at-most-two integral
   result and all-genus rational result remain distinct.
3. **G3:** sharp bounds on full general noncompact Coleman cohomology, distinct
   from the proved weak bounds, interior theorem and Siegel comparison.
4. **G4:** reconcile the printed strongly-small coefficient formulas across
   Coleman §5.11 and §6.8. F5 uses the explicit finite BGG exclusions derived
   from the two proved bounds, named BGGsafe, without asserting equivalence
   with the disputed printed formula.
5. **G5:** verify the arithmetic weight-map inversion across Hida Remark 5.4.3
   and §6.2. I3 labels specialization by the inverse character and B7 inserts
   the corresponding inversion pullback explicitly.
6. **G6:** Klingen large-weight level comparison with repeated nonordinary
   eigenvalues: the cited distinct-pair-products lemma does not cover these
   cases from valuations alone. Supply the unique-ordinary-refinement lemma
   or justify extension from the distinct locus. Preserve the I^(−3) lattice
   and codimension-two argument. No full-torus/partial-ordinary equivalence is
   asserted.
7. **G7:** prove the solid/light-universe comparison and respect the
   finite-type-over-Z scope of the supplied six operations before extending
   to larger noetherian bases.
8. **G8:** resolve the top-differential and derived-shift ambiguity in Coleman
   Proposition 2.7.3. The plan uses the unambiguous H0/Hc^d pairing and requests
   the convention-correct general supplier theorem.

E1–E9 record the source slips or unresolved conventions underlying these
choices. Independent review should prioritize G4/G5/G8 and the Klingen
starting comparison; check every source finding at its exact version/locator.
It should also check sufficiently dominant arithmetic weights satisfy the
explicit safe exclusions used in the interior deformation proof. Sharp
compact-datum bounds are obtained downstream from the interior theorem when
D is empty, avoiding a circular use in the earlier geometric slope argument.

## Validation and resumption

`python3 scripts/check_blueprint.py` on the packet with the pinned declaration
index passes with **0 errors and 0 warnings**. Additional checks verified the
66-node internal graph is acyclic, stage requirements equal direct node
dependencies, the README contains every target/API/test statement, all names
are unique, each definition/construction has at least three tests, and every
layer has at most six planets. Independent arithmetic checked the C2 shifted
weights, singular wall, Serre partners, U(2,1) weights and scalar slope shift.

The 93-line suggested file **compiled successfully with `lean-check` at the
pinned shared build**; its only warnings were `declaration uses sorry`.
It has two light real-bodied definitions on existing carriers, scalar and
weight milestones, and discriminating examples. Heavy carriers, full APIs and
theorems remain README targets under WORKERS.md's binding 12 October 2026 shape
rule; there are no admitted data definitions or artificial stand-in carriers.
This supersedes the older instruction to prototype every heavy declaration.

The next step is an independent review of this complete pass, followed by
the supplier and mathematical closure work above. No checkpoint or additional
job is being submitted. All durable information needed to resume is in the
five deliverables; the session scratch directory is disposable.
