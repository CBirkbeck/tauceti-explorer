# Handoff: DESIGN-PrismaticCohomologyPartII (issue #3365)

Worker: Claude (Opus 5.5), session claude-gvW4rL, 2026-10-17.

## What was done

The job combined six paper routes into one Part II of PrismaticCohomology. They split into four
independent directions with disjoint endpoints, so, as the instructions allow, this job plans the
first listed direction — **prismatic Dieudonné theory** — as `PrismaticCohomologyPartII`, and records
a split proposal for the other three in the packet's `restructure` (first entry):

| Direction | Routes | Here? |
|---|---|---|
| Prismatic Dieudonné theory | Anschütz–Le Bras (route 1), Česnavičius–Scholze (route 6), Scholze–Weinstein Berkeley lectures (route 1) | **planned here** (PD.0–PD.7) |
| Crystalline local systems on smooth formal schemes | Guo–Reinecke (route 1, 167 items) | proposed: `PrismaticCohomologyPartIICrystallineLocalSystems` |
| F-smoothness and p-adic étale Tate twists | Bhatt–Mathew (route 1, 60 items) | proposed: `PrismaticCohomologyPartIIFSmoothnessAndEtaleTateTwists` |
| Integral Riemann–Hilbert and CM vanishing | Bhatt et al. (route 14, 5 items) | proposed: `PrismaticCohomologyIntegralRiemannHilbert` |

The orchestrator should record the split in `research/blueprint/splits.json` so that the three
directions get design jobs of their own.

Deliverables:
- `research/blueprint/roadmaps/PrismaticCohomologyPartII.json` — 8 stages PD.0–PD.7, area `padic`,
  parent `PrismaticCohomology`.
- `research/blueprint/packets/PrismaticCohomologyPartII.json` — status `complete`, 82 nodes
  (8 definitions, 8 constructions, 64 theorems, 2 lemmas), 95 API items, 61 unit tests, 26 planets
  (≤ 6 per layer), 19 baseline declarations, 6 requests, 4 gaps, 2 restructure proposals, 2 new
  source issues. `check_blueprint.py --index …/declarations.tsv`: 0 errors, 0 warnings.
- `research/blueprint/readmes/PrismaticCohomologyPartII.md` — generated from the packet, ≈26,000
  words, with scope, conventions, imports, every entry's statement, proof sketch, API, Checks,
  source and Needs, examples, corrections to the sources, unowned inputs and references.
- `research/blueprint/suggested/PrismaticCohomologyPartII.lean` — 257 lines. **Compiled with
  `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474): no errors, only `sorry` warnings.**

## Layers and stage coverage

All eight stages are `planned`; PD.3 and PD.7 carry `remaining` lists naming the recorded gaps.

- PD.0 Frames, windows, minuscule Breuil–Kisin modules, Cais–Lau, deformation of windows (12 nodes).
- PD.1 u, v, O^pris/N^{≥1}/I^pris, prismatic Dieudonné crystals and modules, admissibility,
  Nygaard windows, perfectoid automatic admissibility, filtered crystals (14).
- PD.2 The functor ℳ_Δ(G) = ℰxt¹(G, O^pris), Hom-vanishing, pushforward and Tate-module
  descriptions, Breen's resolution and derived Yoneda (6).
- PD.3 Perfectoid case: SW Theorem B, 𝒪_C ↔ minuscule BKF, formal abelian variety cover, A_crys
  comparison, SW Theorem 17.5.2, universal covers, AL 4.3.6–4.3.8 (7).
- PD.4 Abelian schemes (AL §4.5), finite groups and BT_n, finiteness, admissibility with Lie(Ǧ),
  exactness, crystalline and classical comparisons (15).
- PD.5 q-logarithm, μ_{p^∞} and étale/multiplicative groups, Cartier duality, Tate-module
  recovery, full faithfulness, essential surjectivity, **the main theorem (§PD.5.10)**, quasi-inverse,
  characteristic-p corollary (12).
- PD.6 Torsion modules, finite group schemes over perfectoid rings, Cartier duality, ČS covariant
  normalisation, Gabber–Lau over perfect F_p-schemes (6).
- PD.7 Regular local rings (perfectoid cover, automatic admissibility, Breuil–Kisin comparison,
  Kisin's functor), Witt frame, displays, frame map, display functor, Zink–Lau, étale comparison (10).

## Ownership decisions (checked against current upstream PR heads, 2026-10-17)

Imported, not planned (all cited by node id): FiniteFlatGroups R07.1 (Raynaud embedding, Illusie
BT_n recognition, henselian lifting, p-complete flat descent, universal cover), R07.2 (classical
Dieudonné, SW f-semiperfect, Berthelot perfect valuation rings), R07.4 (Kisin, dyadic);
AbelianSchemes A4 (exterior cohomology, BT carrier, Grothendieck–Messing; the crystalline
Dieudonné crystal A4.CR.7.2 is cited through CrystallineCohomology CR.7/dieudonne-evaluation);
AInf AI.2 (BKF modules, Fargues, minuscule dictionary), AI.4; PrismaticCohomology PR.0–PR.7
(incl. PR.7/quasisyntomic-crystal-comparison, which already plans AL Prop. 4.1.4 in the
Bhatt–Scholze F-crystal form, and PR.4/syntomic-low-weights for Bhatt–Lurie 7.5.6).
Upstream FiniteFlatGroups R07.2.29 explicitly leaves Gabber/Lau over all perfect rings out; it is
planned here (§PD.6.6) as a corollary of the perfectoid torsion classification. Upstream
FiniteFlatGroups leaves Zink's displays to PELModuli; PELModuli M2.15 defines them in
characteristic p only, so displays over p-complete rings and the Zink–Lau theorem are planned here.

Requests (stage-level, each with a precise need): PerfectoidSpaces P7 (P7.17 regular towers),
AbelianSchemes A4 (A4.9 Serre–Tate), GeometricSatakeAndFusion GS0:Witt-geometry (v-descent on perfect
schemes), PELModuli M2 (M2.15 displays), DiamondsAndVStacks D3, PerfectoidQuotients Q0:integral-algebra.

## Gaps (recorded in the packet)

1. Fargues' p-divisible rigid-analytic groups (input to SW Theorem B for spherically complete C).
2. SW 2013 Theorem C (input to Theorem B for general C).
3. SW 2013 Theorem 5.1.4(i) (isotriviality over 𝒪_C/p) and Oort's existence theorem (inputs to
   SW Proposition 14.9.4, used by AL 4.3.6).
4. The Breuil–Kisin comparison over complete regular local rings of dimension ≥ 2 (AL proves d = 1).

No atlas roadmap owns 1–3; they are natural targets for a Part II of HodgeTateAndCanonicalSubgroups
or of FiniteFlatGroupsAndIntegralPadicHodgeTheory (periods of p-divisible groups).

## Source issues (new, in `sourceIssues`)

- `PrismaticCohomologyPartII/E1` (gap): AL Theorem 5.2.5 is stated for all complete regular local
  rings but proved after assuming d = 1 ("we hope the general case works similarly").
- `PrismaticCohomologyPartII/E2` (misprint): AL Remark 4.8.4 writes ℳ_Δ(Ǧ) where ℳ_Δ(G) is meant.
The paper extraction's AL E1–E5 (including the 2025 erratum retracting the proof of Prop. 5.3.5) and
SW E1/E3 are used in the corrected form and mentioned in the README; they are not duplicated.

## Sources read

Anschütz–Le Bras arXiv v4 (sha256 6eb02c16…, every locator page-checked by script, PDF page = printed
page) and the 2025 erratum (b4575e5c…); Scholze–Weinstein Berkeley lectures (maintainer's library
copy, Lectures 12, 14, 15, 17 appendix; page numbers checked); Scholze–Weinstein 2013 §5 (library
copy; pages checked); Česnavičius–Scholze arXiv v3 §4 (2f9d3ee8…); Lau 2010 (5fac35dd…; locators
checked), Lau 2014, Lau 2018, Cais–Lau, Zink 2002 (author copy). Not read: Lau 2008 (Invent. Math.,
not freely available; cited through AL), Berthelot–Breen–Messing (cited through AbelianSchemes
A4.CR.7.2 and AL), Fargues 2019 (gap).

## Suggested Lean file

States what has carriers at the pins: `Frame`, `Frame.UMorphism` (with `id`, `comp`),
`Frame.quotient`, `Window`, `Window.Hom`, `Window.hodgeQuotient`, `Window.unit`, `IsMinuscule` with its
three tests, `henselian_projective_lifting`, `henselian_projective_iso_lift`, `Frame.witt`,
`Frame.witt_frobOne_verschiebung`. Prismatic objects (O^pris, crystals, ℳ_Δ, the classification) have
no carrier at the pins (PrismaticCohomology is not upstream yet); the file lists them, with the Lean
names the README fixes, as README targets. Data definitions with real bodies; `Frame.witt` chooses
the inverse Verschiebung through a sorry'd existence lemma.

## What a follow-up must do

- Orchestrator: decide the split (record in `splits.json`), which opens three design jobs.
- Review: check the perfectoid-case gaps and whether to accept PD.3 with them open; check that
  AInfCohomology's two Dieudonné-language nodes (rescope note, second restructure entry) need no change.
- Later: close gaps 1–4 by locating owners.
