# Handoff: DESIGN-ShimuraCompactificationsPartII (issue #3424)

Worker: Claude (Opus 5.5), session claude-foXVuD, 2026-10-19.

## What was done

New roadmap `ShimuraCompactificationsPartII`, "Toroidal compactifications and boundary geometry, Part II:
integral models of Hodge type and at bad level", parent `ShimuraCompactifications` (TauCetiRoadmap PR #1053,
whose README was read at its PR head as the authoritative parent). It merges the four paper briefs routed to
`ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary` (Farb–Kisin–Wolfson, Maulik–Shankar–Tang, Pilloni,
Boxer–Pilloni) as one roadmap. Layers continue the parent's numbering:

- C7 normalization models over auxiliary good Siegel compactifications (Madapusi Pera §4.1, Lan 2016 §§4–7,
  Boxer–Pilloni §3.4.19–3.4.23), including the ℤ_p^cycl variant;
- C8 Lan 2016's normalized PEL compactifications with lattice collections, and the minimal-model input of the
  parent's C5.31 (Lan 2017 normalized blow-ups);
- C9 Hodge cycles on degenerating abelian varieties (Madapusi Pera §§1, 3.1–3.5, A.1–A.2);
- C10 Madapusi Pera's main theorem at arbitrary level (3.4.3, 4.1.5, Theorems 1, 4, 5);
- C11 hyperspecial level (Theorem 2, 4.3.5, 4.3.7–4.3.10, 5.3.1) and FKW Corollary 3.3.18;
- C12 minimal compactifications of Hodge type (§5) and MST §8.2 cusp coordinates;
- C13 Boxer–Pilloni's Siegel models at deep and Iwahori level, the extended chain and Gr_i;
- C14 Pilloni's Klingen and paramodular threefolds over ℤ_p (Theorem 6.1.5.1, §§6.2, 7.1, 14.9.2, p. 101);
- C15 the GSpin datum and the boundary of GSpin varieties (MST §§8.1–8.5).

Packet: 73 nodes (8 definitions, 17 constructions, 47 theorems, 1 comparison), 125 API items, 82 unit tests,
24 planets (at most 6 per layer), 12 baseline declarations, 28 requests, 3 gaps, 8 source issues. All nine
stages are `planned`; packet status `complete`. `python3 scripts/check_blueprint.py` with the baseline index:
0 errors, 0 warnings.

Suggested Lean file: 181 lines; real-bodied light definitions over Mathlib's relative normalization
(`NormalizedToroidalModel`, `.toAux`, `.generic`, `.desc` with proofs from Mathlib), the induced-cone
non-smoothness test (proved), the corrected Iwahori degrees and the Klingen/Lagrangian counts (proved), one
sorry'd theorem (`paramodularLattice_ne_top`). It elaborates with `lean-check` at the pinned Mathlib 082e2d3 /
Tau Ceti f790474 with `sorry` as its only warning; `scripts/check_sorry_data.py` passes. A closing comment lists
every packet API/test name that has no carrier at the pins (README-only targets).

Reader: `research/blueprint/readmes/ShimuraCompactificationsPartII.md`, rendered from the packet with
hand-written front matter (scope and ownership, conventions, supplier contracts, how to read the build),
about 32,000 words.

## Gaps (inputs owned by the pending ShimuraVarietiesPartII, issue #3356)

1. `gap/kisin-smoothness`: Kisin's smoothness and extension property of the interior at hyperspecial level
   (used by C11).
2. `gap/klingen-paramodular-interior`: Pilloni Proposition 6.1.4.1 (regular lci Klingen/paramodular moduli,
   finite non-smooth locus of Y_par) (used by C14/normal-lci).
3. `gap/iwahori-lattice-chain-moduli`: normality of Iwahori and Lagrangian lattice-chain moduli (C13/iwahori-
   level-one, C14/tp2-correspondence).

When #3356 plans these, cite its nodes and close the gaps. Its orthogonal Kuga–Satake direction should import
C15/gspin-datum (no other roadmap defines the GSpin Shimura datum).

## Requests and moves

- Requests (28) name the exact contracts used from ShimuraCompactifications C0, PELModuli M1/M2/M5/M6, ShimuraData
  D4, ShimuraVarieties V1/V2, AutomorphicBundles B1/B3, CrystallineCohomology CR.5/CR.6, CohomologyComparisons
  CP.4, PadicHodgeTheory R06.5, NeronModels R11.1/R11.3/R11.5, AbelianSchemes A4/A6, PadicDifferentialEquations
  RD.5 (Zarhin), AlgebraicModuli R09.6 (Artin approximation), FiniteFlat R07.2, ModularCurvesPartII R12.3,
  ReductiveGroupsPartII RG2.1 (Steinberg, upstream) and RG2.3, SchemeAndStackFoundations SF.0–SF.2.
  Parent nodes are cited by their accepted node ids (`ShimuraCompactifications:C*/roadmap/*`) and two accepted
  nodes of other roadmaps (`AutomorphicBundles:B1/absolute-hodge-propagation`,
  `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`).
- Restructure entries: (1) HigherHidaAndColemanTheory's requests to "ShimuraCompactifications C5/C3 Part II"
  should be re-pointed to C13/C14/C7/C8 here; (2) ShimuraVarietiesPartII owns the interior models (the three gaps);
  (3) the parent's C5.31 minimal-model hypothesis is discharged by C8/pel-normalized-minimal (also an upstreamNote).
- Not planned here (owned elsewhere, per the briefs): C^tor_t, D_i and blow-ups (HigherHida), Lan17 Theorem 8.6
  vanishing (IntegralCoherentHeckeComplexes), Igusa partial compactifications and BP Lemma 3.4.24 (Igusa Part II),
  Hecke operators T_{p,2}, U_{Kli(p),2}.

## Sources read (all free or maintainer-cleared)

Madapusi Pera arXiv:1211.1731v6 (Intro, §§1, 3.1–3.5, 3.7.4, 4, 5, A.1 headings); Lan 2016 author copy (§§1, 6–7,
9–12, 14); Lan 2017 author copy (intro, statement locations); Boxer–Pilloni author version 5 Nov 2025 (§§3.2–3.4,
4.1–4.2); Pilloni 2020 (maintainer-cleared copy; §§6.1–6.2, 7.1, p. 101, §14.9.2); FKW arXiv:2110.05534v2
(§§2.2.12–2.2.14, 3.3.11–3.3.19); MST author manuscript 25 Dec 2021 (§§8.1–8.5). Not read, cited through those
papers: Brylinski 1983 (Théorème 2.2.5), Stroh (Astérisque 370, Lemma 2.4.3), Bruinier–Zemel, Zemel, Kisin 2010.

## What a follow-up (review or lemma-level pass) should check

- C8/pel-local-properties extends Lan16 Prop. 14.2 to the lci property (not in Lan16); pin a reference for flat
  descent of complete intersections (Avramov) at lemma level.
- C9 is at target level only; MP §3.3 (canonical Tate tensors) and §3.6 (reduction of structure group) are long
  arguments that a lemma-level pass should split.
- Read Brylinski 1983 and Stroh 2015 directly if they become available.
- Source issues E1–E7 follow the paper extractions' records (PAPER-PILLONI-20 E34–E41, PAPER-BOXER-PILLONI-26
  E64–E67); E8 records Madapusi Pera's Remark 5.2.10 on Lan's book 7.2.3.5.
