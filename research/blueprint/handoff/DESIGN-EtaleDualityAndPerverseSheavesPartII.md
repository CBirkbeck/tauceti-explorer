# Handoff: DESIGN-EtaleDualityAndPerverseSheavesPartII (issue #3363)

Worker: Claude (Opus 5.5), session claude-AHla9D, 2026-10-19.

## What was delivered

- `research/blueprint/roadmaps/EtaleDualityAndPerverseSheavesPartII.json`: roadmap definition, area `etale`, parent
  `EtaleDualityAndPerverseSheaves`, nine layers EQ.0–EQ.8, title "Étale duality, cycle classes and perverse sheaves,
  Part II: Gabber's finiteness, affine Lefschetz and duality theorems on quasi-excellent schemes".
- `research/blueprint/packets/EtaleDualityAndPerverseSheavesPartII.json`: target-level packet, status `complete`, 57 nodes
  (45 theorems, 7 definitions, 4 constructions, 1 application), 66 API items, 47 unit tests, 23 planets (at most 4 per
  layer), 15 baseline declarations confirmed in the pinned index and read in the Mathlib source at 082e2d3,
  6 requests, 4 gaps, 3 source issues, 4 restructure proposals, 2 upstream notes, route coverage for all 14 routed items.
  `scripts/check_blueprint.py` (with `TAUCETI_BASELINE`): 0 errors, 0 warnings. Every stage is `planned`, with lemma-level
  refinements listed in `remaining`.
- `research/blueprint/readmes/EtaleDualityAndPerverseSheavesPartII.md`: reader document (about 19,500 words), rendered from
  the packet with hand-written scope, conventions, supplier table, build order, source status and references.
- `research/blueprint/suggested/EtaleDualityAndPerverseSheavesPartII.lean`: **elaborates with `lean-check` at the pins
  (Mathlib 082e2d3, Tau Ceti f790474) with `sorry` as the only warning** (8 warnings, no errors);
  `scripts/check_sorry_data.py` passes. It states only what the pins can carry: `PartiallyAlgebraizable` (real body) with
  `of_iso`, `dim_lt`, `inter` and three unit tests, the Cohen–Gabber theorem (`cohenGabber`) and equal-characteristic
  partial algebraization. The header lists by name every definition, API item and unit test of the packet that is a
  README target, because the pins have no derived étale cohomology of schemes, no strict henselization of schemes, no
  alteration topology and no perfectoid predicate.

## Scope decisions (read before reviewing)

1. **Three independent directions; the first is planned here.** The routes give (A) Česnavičius–Scholze's absolute purity
   with Gabber's local theorems, (B) étale operations on Artin and Deligne–Mumford stacks (Yun–Zhang 2017 items 35, 56, 57;
   2019 items 120, 227) and (C) the Serre quotient of ind-perverse sheaves by constructible ones (Yun–Zhang 2019 items 63,
   64, 176). They share no targets. A is planned; B and C are proposed as their own design jobs in packet restructure
   entries 0 and 1, with the consumer statements already recorded by EDC.7, FunctionFieldArithmeticPartII (GC.3, GC.4),
   WeilConjectures (WC.0, WC.6), MotivicStructuresInModuliOfCurves (B) and GS.3 and SheafConvolutionOnAbelianVarieties
   request 1 (C).
2. **Absolute purity is imported, not planned.** TauCetiRoadmap LefschetzPencilsAndVanishingCycles §0.10 (draft PR #873,
   head 1e3ff24) plans Gabber's absolute purity by Riou's proof; the accepted PurityForFlatCohomology restructure 0 already
   asked this design to import it. CS24 Theorem 3.1.3 and Remark 3.1.4 are therefore EQ.7 consequences of the LPV.0 request.
   SchemeAndStackFoundations' packets still point absolute purity at the old route name "EtaleDualityAbsolutePurityPartII";
   restructure entry 2 asks for those pointers to be updated.
3. **What the brief's "local results on excellent schemes" require.** CS24 Lemma 3.2.3 (consumed by PurityForFlatCohomology
   PF.1, gap EDP-PII-local-lefschetz) needs Gabber's affine Lefschetz theorem (ILO XV), the dualizing complex of a regular
   excellent local ring and local duality (ILO XVII). Their proofs rest on Gabber's finiteness theorem (XIII), weak and
   prime-to-ℓ local uniformization (II, III, IV, V, VII, IX), oriented descent (XI, XII), dimension functions (XIV) and the
   cohomological dimension bound (XVIII-A). None of these is owned anywhere in the atlas or upstream (checked against
   EtaleCohomologyFoundations PR #938, EtaleDualityAndPerverseSheaves PR #1040, LPV PR #873, SchemeAndStackFoundations
   main, and every packet), so they are planned here at target level. ILO VI, VIII, X (log regularity, very tame quotients,
   Gabber's modification theorems) are imported from AdicCoefficientsAndComparisonsPartII PA.4; resolution of excellent
   surfaces from PA.0; de Jong's theorems over fields and traits from SchemeAndStackFoundations §§4.16–4.20.
4. **CS24 Theorem 2.2.7 (algebraic tilting) is EQ.8**, as the accepted PurityForFlatCohomology restructure asked; its
   arc-descent inputs are ArcTopologyAndDescent AT.3/AT.8/AT.11/AT.12 and its perfectoid inputs PerfectoidQuotients Layer 0
   and PerfectoidQuotientsPartII Q5–Q6. Only (2.1.7.2), the multiplicative tilt of A[1/ϖ], was unowned and is planned here.
5. **Other "EtaleDualityAndPerverseSheaves, Part II" proposals** in accepted packets (perfect schemes and hyperbolic
   localization, integral perversity, curve Euler characteristic, integral pairings on curves, W(F̄_p) coefficients, ULA
   dualizability, Kashiwara's conjecture, general qcqs constructible complexes, trait perverse sheaves) are not routed to this
   job; restructure entry 3 lists them for an owner decision.

## Gaps (precise)

- `gap/ILLUSIE-2003`: the proof of Gabber's affine Lefschetz theorem over a trait (Illusie, Perversité et variation,
  Manuscripta Math. 112 (2003), Théorème 2.4) was not read; no free copy was found. The node states the theorem from ILO XV
  1.1.3 and 3.3.2.
- `gap/GABBER-2004`: Gabber's Notes on some t-structures (2004) not read; the perverse t-structure node follows ILO XVII §5.2.
  Confirm the exact monotonicity hypothesis on the perversity function.
- `gap/EPP-1973`: Epp, Invent. Math. 19 (1973), Theorem 1.9, not read (free on GDZ); statement from ILO IV 3.1.2.
- `gap/GENERIC-CONSTRUCTIBILITY`: Deligne's generic constructibility over an arbitrary noetherian base (SGA 4½ [Th. finitude]
  1.9) is used by ILO XIII 2.2.3; EtaleCohomologyFoundations §F.3 states it only over a field base. Requested from EDC.0.

## Source issues recorded (all `new`, affects nothing)

- E1: ILO XIV Corollaire 2.5.2 writes trdeg(κ(f(y))/κ(y)) for trdeg(κ(y)/κ(f(y))).
- E2: ILO IX §1 and Exposé 0 cite II-4.3.1 for the prime-to-ℓ uniformization theorem, which is II-4.3.2.
- E3: ILO II Théorème 4.2.1 says "residue field algebraically closed" where the proof and Remarque 4.2.2 need the fraction
  field; counterexample W(F̄_p) against Spec ℤ_p[√p] → Spec ℤ_p.
- Version note (not an issue): CS24 cites ILO XVII "Théorème 0.2" (Astérisque numbering); arXiv v1 numbers it 0.9.

## Requests made

LPV.0 (absolute purity, §0.10), SF.0, SF.2, SF.4 (imports from SchemeAndStackFoundations main), EDC.0 (generic
constructibility over a noetherian base), EDC.5 (middle perversity, for the comparison test of Gabber's t-structures).

## Sources read

ILO arXiv:1207.3648v1 (sha256 18a6193d…), the sections listed in the packet; CS24 arXiv:1912.10932v3 (sha256 2f9d3ee8…)
§§2.1.7, 2.2, 3.1, 3.2; de Jong, Families of curves and alterations (Numdam) §2. Not read: Illusie 2003, Gabber 2004,
Epp 1973, SGA 4½, SGA 5 I (cited through ILO and CS24).

## What a follow-up must do

- Reviewer: check the scope split (decision 1) and the import of absolute purity (decision 2); spot-check the ILO page
  locators (printed page = PDF page − 6 in arXiv v1); check the three source issues.
- After acceptance: the open stages are refinements to lemma level (each stage's `remaining`), the four gaps, and the two
  split-off designs (stacks; ind-constructibles), which the orchestrator registers if it accepts restructure entries 0–1.
