# Handoff — BP-AutomorphicCongruences--L0 (issue #682)

Agent: Claude (Opus), session `claude-zBc10c`, 2026-10-19. Branch `claude-zBc10c-bp-ac-l0`.
Base: origin/main `77050f986`.

## Deliverables

- `research/blueprint/packets/AutomorphicCongruences--L0.json` — part `L0`, scope L0, L1, L2,
  L2s, L3, L4, L5, L5a; `status: complete`. 69 nodes (45 theorems, 11 constructions,
  6 definitions, 5 comparisons, 2 applications), 106 API items, 68 unit tests, 25 planets,
  13 pinned baseline declarations, 12 gaps, 17 requests, 3 new source issues (E8–E10; E1–E7
  belong to the sibling part `AutomorphicCongruences--L5b`), 5 structural proposals, and the
  ledgers `findingsCoverage` (13 findings), `routeCoverage` (17 Nakamura route items) and
  `requestLedger` (15 consumer requests).
- `research/blueprint/readmes/AutomorphicCongruences--L0.md` — the reader, generated from the
  packet (every node with statement, hypotheses, proof outline, checks, uses, API, tests,
  prerequisites and sources; per-layer dependencies and acceptance; requests, gaps, source
  issues, proposals, findings, route and ledger). Packet text is escaped for the site renderer
  (`\ * _ $`, backticks and `[`; never `]`), and a port of `src/markdown.js`'s inline rules
  found no unintended emphasis, mathematics or links.
- `research/blueprint/suggested/AutomorphicCongruences--L0.lean` — 478 lines. Real-bodied
  prototypes where Mathlib carries the objects: the Eisenstein ideal of a Hecke eigensystem
  (`EisensteinIdeal.hecke/base` with `quotientEquiv`, `localize`, `proper_iff`, `mono` and
  tests), the Euler-factor polynomials, the splitting conditions on the auxiliary quadratic
  fields (Jacobi symbols), and Λ = O⟦X₁,X₂,X₃⟧ (`FWLambda`). Every other node, API item and test
  is listed by its packet name and statement in a closing "Register of README targets"; a script
  confirmed every packet name occurs in the file. **Compiled:** `lean-check` (Mathlib 082e2d3,
  Tau Ceti f790474) elaborates it with `sorry` as the only warning.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L0.json --index <pinned declarations.tsv>` → 0 errors, 0 warnings (all 13 baseline names found in the pinned index).
- `python3 research/blueprint/intake.py check-files` on the four files → 0 problems.
- `lean-check` on the suggested file → only `declaration uses 'sorry'` warnings.
- Sonnet cross-checks: supplier contracts (242 citing/foreign node pairs) and a locator sweep
  (112 source references against the source texts); see "Cross-check results" below.

## Cross-check results (Sonnet, then judged here)

- **Supplier contracts** (242 pairs; 37 flags). Accepted and fixed: metaplectic theta-doubling
  nodes (MP.6 local-doubling-integral, doubling-schwartz-map) had been cited for the unitary
  Siegel-Eisenstein pullbacks — replaced by AutomorphicPadicLFunctions:L4's doubling nodes;
  PadicFamilies:L1/branch-l-functions (cyclotomic GL₂ family function) had been cited for the
  SU three-variable function and for Hida's CM-family Rankin–Selberg function — replaced by the
  requested stage AutomorphicPadicLFunctions:L3 or by the period-line node; tower-level control,
  CGLS-only Euler and global no-pseudo-null nodes removed from the L0 comparisons; unrelated
  IHG.1/coefficient-descent, Katz, Rubin–Coleman, Perrin-Riou big exponential, Hida–Katz µ and
  BDP-specialization citations removed; Kisin's medium-weight crystalline theorem replaced by
  the general de Rham lifting. Caveat added: PadicLocalLanglandsForGL2Qp:R30.5's nodes need
  p ≥ 5 (FW's p = 3 via Paškūnas–Tung is requested). Rejected: the Eischen–Wan flags (their r = 2
  case is exactly U(3,1)), the SR.5 co-Whittaker flags (the Whittaker functor at Σ₀), and the
  MIMC L0 range flags (handled by a hypothesis stating the comparison range).
- **Locators** (112 references): one flag, rejected after rereading SU p. 107 (the check of the
  four characters is in the proof of Thm 7.3.5, as cited).
- **Own verification of statements first taken from headings**: SU Thms 6.3.3, 6.3.10, 6.4.1
  (q = 0 or 1; control of the Hecke algebra with nilpotent kernel) and FW Thms 7.11–7.18 were
  read and the L1/L2 nodes corrected accordingly.
- **Cycle check**: a scripted check of every foreign prerequisite's stage ancestors found one
  stage cycle (L5a citing an HE.8b node, while HE.8b requires L5a); the citation was removed.
  L4's use of ModularIwasawaMainConjectures:L1/fw-ordinary-theorem is acyclic (that stage's
  AutomorphicCongruences ancestors are L0, L1, L2), as RS-11 intends.

## Structure followed

- **RS-11.** The fixed RS-11 proposal is `not_reviewed` (REV-FIX-RT-RS-11, issue #5710, is
  available); its previously accepted version is in `reviewHistory`. Both make the same layer
  assignments, which this packet follows: SU's GU(2,2) bound in L1 only; FW §4.8's ordinary
  reverse bound in L2 with KatoEulerSystems:L4 inside its proof; FW's pointwise and family
  endpoints in L4 (with ModularIwasawaMainConjectures:L1's ordinary equality as the seed);
  L5 an aggregate; L5a the early BCS product input, importing the ordinary BSTW comparison
  from the planned KatoEulerSystems L5. No layer is dropped.
- **Sibling part.** L5b and L5w are in the accepted `AutomorphicCongruences--L5b`; L5a uses
  its L5w nodes (quartic-CM divisibility, hypothesis discharge) and the L5 aggregate cites its
  L5b endpoints. The ASM job (`ASM-AutomorphicCongruences`) joins the two parts.

## Red-team findings (how each is handled)

- RT-AREA-automorphic-1/20: L2/L2s import MP.6's unitary Jacobi group and Fourier–Jacobi
  periods; Ikeda's Fourier–Jacobi lemma is requested from MP.6.
- RT-AREA-iwasawa-1/6: Galois representations of GU(2,2)/U(3,1) imported from
  AutomorphicGaloisRepresentationsPartII (AG2.2/2.5/2.6; request); the CAP exclusion names
  Kisin/Pan (requested from GL2ModularityLifting R32.4) and Harris (gap `harris-cap`).
- RT-AREA-iwasawa-1/7: Vatsal/Finis/Hsieh 2012 enter through AutomorphicPadicLFunctions:L3h's
  mod-p nonvanishing nodes; Vatsal 2003 stays L3h's recorded gap (`vatsal-mu`).
- RT-AREA-iwasawa-1/22: FW Thm 1.6 by §4.8 planned in L2 (`L2/fw-ordinary-reverse-bound`), with
  Castella–Wan Thm 3.8 (`L2/castella-wan-equivalence`) and the KLZ classes
  (`L2/klz-beilinson-flach-classes`, `L2/bf-explicit-reciprocity`) as named targets; the
  canonical/Gross period comparison is gap `canonical-gross-periods`.
- RT-AREA-iwasawa-1/24: L2 imports L2s's weight-two semi-ordinary theory and adds only FW §7.3.
- RT-AREA-iwasawa-1/25: L3h is a prerequisite of L2s; request to L3h to export to L2s.
- RT-AREA-iwasawa-1/26: CLW integrality stated with both inputs — Hida–Tilouine
  (`L0/hida-tilouine-anticyclotomic`, proposed sub-layer L0c, gap `hida-tilouine-not-read`) and
  Hida's CM-family Rankin–Selberg function (requested from AutomorphicPadicLFunctions:L3).
- RT-AREA-iwasawa-1/27: Yager modules imported from GH.7; L2 keeps FW §4.2.1's boundedness.
- RT-AREA-iwasawa-1/28: L3 imports R31.4, R30.5/R30.6 and SR.5 through node prerequisites.
- RT-AREA-iwasawa-1/29: L5a uses BCS Thm 4.1.3 (not 4.2.1); label mismatch recorded as E9.
- RT-AREA-iwasawa-1/30: ordinary BSTW comparison has the single planned owner KatoEulerSystems
  L5; L5a states the contract in `L5a/ordinary-two-variable-equivalence` (gap
  `ordinary-bstw-owner`) and does not depend on BSD.6a.
- RT-AREA-langlands-1/8: no L5/L5a node uses an Igusa supplier.
- RT-AREA-langlands-1/27: the generic congruence module/ideal are imported from PadicFamilies:L1.

## Requests made (17)

PadicMeasuresIwasawaAlgebras:L5 (determinant lines; on TauCetiRoadmap main as layer 5.1);
AutomorphicLFunctionsAndLocalFactors:AL.3 (Ichino's triple product formula); DirichletPadicLFunctions:L4;
SerreWeightAndLevelOptimisation:R20.6; KatoEulerSystems:L4 (for the planned L5, ordinary BSTW);
TauCetiRoadmap ProfiniteCohomology layer 7 (Shapiro, import); AutomorphicPadicLFunctions:L4
(GU(2,2)/GU(3,1) instances; Wan 2015's function over F); AutomorphicPadicLFunctions:L3 (Hida's
CM-family Rankin–Selberg function); AutomorphicPadicLFunctions:L3h (export Hsieh A/B/C to
L2s/L2); GeneralizedHeegnerCycles:GH.7 (Yager module in FW's form); MetaplecticAutomorphicForms:MP.6
(Ikeda's lemma); AutomorphicGaloisRepresentationsPartII:AG2.2; CompletedCohomology…:R31.4;
PadicLocalLanglandsForGL2Qp:R30.5; SmoothRepresentationsOfLocalGroups:SR.5 (unconditional GL₂
co-Whittaker families); GL2ModularityLifting:R32.4 (Pan, Kisin); IntegralHeckeAndGaloisDeterminants:IHG.6
(coordination of the polarized lattice theorem).

## Consumer requests answered (requestLedger)

ModularIwasawaMainConjectures (L1 SU, L2 FW §4.8, L4 FW endpoints) answered; RankOneConverse
(Wan20 Thm 1.2) answered; RankZeroOneBSD BSD.6a (FW Thm 4.41 + Cor 7.21, CLW Thm 8.2.1)
answered, its L5a request partial (interface to the planned KatoEulerSystems L5); BSD.7a's
request for Kriz's Eisenstein congruence **declined** (the Eisenstein analogue is BSD.7a's by
the L5a stage text); HE.7s/HE.8b requests to L5a answered (Thm 4.1.3 imported via interface);
the L5b part's requests to L0, L1, L5a answered or partial (Hilbert-specific pieces stay with L5w).

## What remains (precisely)

- Lemma-level refinement (listed in each coverage record's `remaining`): SU §§4.3–4.4, 9, 11,
  13.2–13.3; CLW §§5–7; FW §§3.2.2, 4.5–4.7; Nakamura §§2–4.
- Fix the hypotheses of `L0/hida-tilouine-anticyclotomic` from Hida–Tilouine 1993/1994 and
  Hida 2006 (not read); read KLZ17/LLZ14 for the Beilinson–Flach nodes.
- Write out FW §4.8's ordinary p-power step (gap `fw-4-8-sketch`, source issue E10).
- Replace `L5a/ordinary-two-variable-equivalence` by an import when KatoEulerSystems L5 exists.
- Owners still missing in the atlas: Ichino's triple product formula, Harris's CAP theorem,
  Pottharst's analytic Iwasawa theory (gaps).

## Sources

Read (all freely available, hashes in the packet): Skinner–Urban authors' copy (226 pp.):
§§1, 3.1–3.2, 3.5–3.6, 4 in full; statements of §§6.5, 7, 12–13. Fouquet–Wan arXiv v3:
§§1, 2, 3.2.1, 3.3, 4.6 statements, 4.8, 5, statements of Apps A–B. Castella–Liu–Wan arXiv v1:
§1, Thm 2.9.1, §§4.4, 4.6, 5.2–5.4, 6.1, 8. Nakamura arXiv v2: §1, §4.1–4.3 statements, §5.3
(published numbering taken from the paper route). Burungale–Castella–Skinner arXiv v2: whole.
Castella–Wan arXiv v1: Thms 3.6, 3.8. Wan arXiv:1408.4044v5: introduction.
Not read: Hida–Tilouine, Hida 2006, KLZ17, LLZ14, Harris 1984, Ichino 2008, Wan20 §9, Vatsal 2003,
and the proofs of the sections listed under "What remains".
