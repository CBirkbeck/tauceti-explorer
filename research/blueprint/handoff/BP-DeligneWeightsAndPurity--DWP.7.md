# Handoff: BP-DeligneWeightsAndPurity--DWP.7 (issue #707)

Agent: **Claude** (Claude Code, model Claude Opus 5.5), session **claude-B5OXsE**. The bot confirmed this
session's claim on #707 on 2026-10-06.

## Status

**Complete.** All three stages in scope are `planned`; the packet status is `complete` and goes to its
independent review.

- Packet: `research/blueprint/packets/DeligneWeightsAndPurity--DWP.7.json` (part `DWP.7`, scope DWP.7,
  DWP.8, DWP.9).
- Reader document: `research/blueprint/readmes/DeligneWeightsAndPurity--DWP.7.md` (about 29,500 words,
  generated from the packet node by node, with hand-written introduction, conventions, sources,
  dependency table and layer introductions; the two agree).
- Suggested Lean file: `research/blueprint/suggested/DeligneWeightsAndPurity--DWP.7.lean`.

Counts: 52 nodes (31 theorems, 10 lemmas, 7 definitions, 3 constructions, 1 comparison); 93 API items;
49 unit tests; 14 planets (DWP.7: 2, DWP.8: 6, DWP.9: 6); 11 Mathlib declarations cited, each read at
the pinned commit; 20 requests; 1 gap. `python3 scripts/check_blueprint.py` reports 0 errors and
0 warnings.

## Lean

`lean-check research/blueprint/suggested/DeligneWeightsAndPurity--DWP.7.lean`: **exit 0, 31 warnings,
all `declaration uses 'sorry'`**, in the shared build at Mathlib 082e2d37e8 (more than 20 GB of memory
available; one compile at a time; no language server, no `lake build`). Only Mathlib is imported.

The file types what the pinned Mathlib can carry: `IsIntegralEnd` (the Frobenius-module form of integral
sheaves) with its API and five tests; `newtonCouple` (Weil II 3.3.7) on `AddValuation K (WithTop ℚ)` with
its API and five tests; `IsGeometricallySemisimple` and `geometricMonodromyGroup` for a representation
restricted to a subgroup, with four tests; Lemma 4.1.4 (`restrict_invariants_nondegenerate`) and its
non-example; `even_finrank_of_isAlt_of_nondegenerate`; and the primitive decomposition of a graded
operator (`primitivePiece`, `iSupIndep_lefschetzDecomposition`, `finrank_primitivePiece`,
`lefschetzPairing_nondegenerate`). Every other packet API item and unit test needs ℓ-adic sheaves,
complexes or étale cohomology, which the pins lack; they are listed by name in the file's header (a
script check confirmed that every packet API and test name occurs in the file). No sheaf or cohomology
group is replaced by a stand-in or a `Prop` field.

## How the job instructions were followed

- **RS-17 (accepted)** is followed: DWP.7 narrowed (dévissages and finite-type-over-ℤ scope, H_c upper,
  smooth-lisse H lower, pure image, smooth proper nonprojective purity, integrality bounds through
  SGA 7 XXI, valuation triangles, 3.3.11's exact dualizing hypothesis, 3.3.9's factors through WC.3);
  DWP.8 kept whole; DWP.9 narrowed (absolute hard Lefschetz, primitive decomposition and pairings, odd
  Betti parity, arithmetic models/spreading out, 6.2.13 with both support inequalities), importing
  6.2.8–6.2.12 from `LPV.7:invariant-cycles` and never using EDC.7.
- **Reviewed decomposition** `data/decompositions/DeligneWeightsAndPurity.json`: its four DWP.7 node ids are
  kept, because `WeilConjectures--WC.6` and `WeilConjectures--WC.0` cite them:
  `DWP.7/weights-mixed-sheaves-definitions` (now a comparison node pinning the scope and importing the
  definitions from DWP.5, as RS-17 relocates them), `DWP.7/fundamental-direct-image-theorem-3-3-1`,
  `DWP.7/cohomological-bounds-3-3-2-3-3-6` (3.3.4–3.3.6 in integer and ι forms) and
  `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11` (now proper smooth purity with lisse
  coefficients, 3.3.9 and 3.3.11; the triangles 3.3.7–3.3.8 became their own nodes). The decomposition's
  locators were reused and the page-206 diagram of 3.3.8 was read from the page image.
- **Library audit** (`data/library-coverage.json`, AUDIT-18): DWP.7–DWP.9 not built; the partial items
  (spreading out of morphisms; sl₂ decompositions, real symplectic evenness) do not cover what is
  needed: Tau Ceti's `TauCeti.SymplecticForm.even_finrank` is for ℝ only, so evenness over a general
  field is planned as a lemma.
- **Maintainer-added sources.**
  - Weil II (PAPER-DELIGNE-80): every extraction item planned at DWP.7, DWP.8 or DWP.9 is a node or part
    of one, except: §4.3 (4.3.2)–(4.3.8), routed by the extraction to DWP.9, is the proof of 4.1.3 and the
    argument 6.2.11 (ii) uses, so it is requested from LPV.7:invariant-cycles (restructure entry 2);
    (4.3.9)–(4.3.10) are planned here. The §1 items (1.1, 1.2.9–1.2.14, 1.3, 1.8.5–1.8.12, 1.10, 1.11)
    are DWP.5's by its stage text ('Weil II §§1.2–1.11'); this part imports (1.8.8)–(1.8.11) and
    (1.11.1), (1.11.5) from DWP.5. §2 is DWP.5's. §3.5 (equidistribution, 3.5.3, 3.5.7) is directed to
    DWP.10 by the issue text and is not planned here (see RT-AREA-etale/1 below). 3.6 is LPV.7's. 3.7 is
    FF.2's and R34.5's. 6.1.13 and 6.2.7 are planned in DWP.8.
  - Bergström–Faber–Payne: the weight spectral sequence of a normal crossings compactification is
    `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, with the orientation twist of
    PAPER-BERGSTROM-FABER-PAYNE-24/E7 and the M_{1,2} check as acceptance test; the stacky form imports
    WC.6's DM-stack purity and requests SF.1's stack cohomology.
  - Yu (PAPER-YU-23/041–042): the purity of H^i of pure lisse coefficients on a smooth proper curve is part
    (i) of `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, with Yu's Proposition 6.1.1
    quoted as a consumer. The Euler product and duality are WC.1's and EDC.2's, as the issue says.
  - Deligne, Weil I (for DWP.2, DWP.3) is outside this part's stages.
- **Red-team findings handed to the job:** none were listed in #707. RT-AREA-etale/1 (confirmed) asks for a
  DWP layer owning Weil II 3.5 (equidistribution); that belongs to the fix job and to DWP.10, not to
  DWP.7–DWP.9, and nothing here plans §3.5.

## What remains (precise)

1. **Gap — SGA 7 XXI (5.2.2).** `DWP.7/deligne-integrality-theorem-sga7-xxi` states Deligne's integrality
   theorem from Weil II's citation; SGA 7 II (LNM 340) was not available, so its proof is not
   decomposed. It feeds the integral clauses of 3.3.3–3.3.4 and the triangles 3.3.8 only. A worker with
   the text should decompose it (or find an openly available proof) and close the gap.
2. **Refinements recorded in the coverage records:** cite EDC.0's node for the commutation of j_* and the
   local monodromy filtration with base change in the tame relative-curve case once EDC.0 is planned;
   cite EDC.0's adic formalism node for the finite-level justification of Weil II (6.1.8)–(6.1.9); SF.1
   for the stacky weight spectral sequence; replace the LPV.7 stage prerequisite by its 6.2.11/6.2.12 node
   ids once LPV.7 is planned.
3. **For the DWP.0 part (issue #706), which plans DWP.5 and DWP.6:** this part needs, as nodes,
   (a) the predicates (1.2.2)–(1.2.7) and stabilities (1.2.5) on schemes of finite type over ℤ[1/ℓ] (not
   only over 𝔽_q), with the Weil-sheaf variants; (b) the local weight theorem (1.8.4) with (1.8.6)–(1.8.8)
   along a divisor finite étale over a base, and (1.8.9), (1.8.10), (1.8.11); (c) the specialisation
   theorem (1.11.1), (1.11.5); (d) Weil II 3.2.3 for every ι. They are recorded as `requests` to DWP.5 and
   DWP.6 with their consuming nodes. When those nodes exist, `DWP.7/weights-mixed-sheaves-definitions`
   should cite them.

## Requests made (20)

EDC.0 (D^b_c, Rf_!, Leray, lisse = representations, generic base change, tame base change of j_*); EDC.1
(f^!, D, biduality and exchange formulas, Verdier duality, also over ℤ[1/ℓ], and i^!ℚ_ℓ = ℚ_ℓ(−1)[−2] at a
closed point of Spec ℤ[1/ℓ]); EDC.2 (Poincaré duality, relative trace); EDC.3 (c₁, Gysin, projection
formula); EDC.4 (weak Lefschetz); SF.2 (proper/smooth base change, topological invariance, excision,
trace formula); SF.1 (stack cohomology); AdicCoefficientsAndComparisons L2 (noetherian approximation);
R02.2 (continuous Hochschild–Serre with quotient ℤ̂ or ℤ); WC.3 (the algebraic factor lemma for smooth
proper X); LPV.7:invariant-cycles (6.2.8–6.2.12, 4.1.3 and the §4.3 proof); LPV.1 (quasi-unipotence,
monodromy filtration); IG.0 and IG.1 (π₁ surjectivity for normal schemes; the arithmetic–geometric
sequence); Tau Ceti ModularCurves 0E, AlgebraicCurves layer 12, LocalFieldsRamification layers 3 and 4;
DWP.5 and DWP.6 (as above). Node ids of other packets are used where they supply exactly what is needed:
DWP.0's weight nodes, LPV.0/LPV.3/LPV.4/LPV.5 nodes, R02.2's Hochschild–Serre node and WC.6's DM-stack
purity node.

## Structural proposals (packet `restructure`)

1. WC.6's `purity-for-proper-smooth-varieties` re-derives the integral ℓ-independent factors that RS-17
   gives DWP.7 (3.3.9): narrow it to an adapter.
2. Weil II §4.3 (4.3.2)–(4.3.8) belongs with LPV.7's 6.2.11–6.2.12, not DWP.9.
3. DWP.5 plans the §1.2 predicates in the finite-type-over-ℤ[1/ℓ] scope; the kept DWP.7 definitions id
   then cites them.

## Sources

Read (URLs, SHA-256 and sections in the packet): Weil II (Numdam scan, with pages 206, 249 and 250 read as
images); Deligne, *Théorème de Lefschetz et critères de dégénérescence* (1968), §1; Bergström–Faber–Payne
arXiv v2, Proposition 4.2; Yu arXiv v5, Proposition 6.1.1. Not available: SGA 7 II Exposé XXI (the gap);
BBD (Astérisque 100) — the directional weight estimates are derived from Weil II 6.2.1–6.2.4 instead;
Petersen's equivariance of the weight spectral sequence, cited by Bergström–Faber–Payne — the packet gives
the proof from the resolution of j_! by normalised strata. No new mistakes were found in the sources
read; the corrections of PAPER-DELIGNE-80 (E2, E45, E46, E47, E70) and PAPER-BERGSTROM-FABER-PAYNE-24/E7
are used, not re-recorded (`sourceIssues` is empty).
