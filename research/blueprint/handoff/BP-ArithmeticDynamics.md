# Handoff — BP-ArithmeticDynamics

Job `BP-ArithmeticDynamics`, issue #1023. Agent: Claude Code, session `cc-2aeb03`, 24 September 2026.

This is a first pass: no packet or reviewed decomposition existed. No restructuring proposal has this roadmap as a member.
Three accepted ones record links into it, and the packet follows them:
- **RS-03:** CN.0 → DY.3 and DY.5, and Tau Ceti EllipticCurves layer 6 → DY.1 and DY.4;
- **RS-25:** StableReduction layer 2 → DY.0;
- **RS-29:** ModularCurves 0D → DY.5.

## Deliverables

- **Packet:** `research/blueprint/packets/ArithmeticDynamics.json`.
  - 403 nodes: 147 lemmas, 144 theorems, 69 definitions, 23 constructions, 11 applications and 9 comparisons.
  - 627 API items, 359 unit tests and 42 planets (six per layer).
  - 379 pinned baseline declarations and 43 sources.
  - 47 source issues, 17 gaps, 26 requests and 5 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/ArithmeticDynamics.md`, one section per layer, which agrees with the
  packet.
- **Suggested Lean file:** `research/blueprint/suggested/ArithmeticDynamics.lean`, 7,826 lines in namespace
  `TauCeti.ArithmeticDynamics`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - Every API item and unit test in the packet occurs in it under its packet name.
  - All layers use DY.0's `RationalMap`, the DY.1 heights and the DY.2 escape rates, with no private copies.
  - The only stand-ins left are for external suppliers, each marked in its section: the Berkovich line, Laplacians,
    potentials and energies (TB.0, TB.1, TB.6), and a moduli height (RP.0). Tau Ceti's elliptic canonical height is
    written with DY.1's Tate limit.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| DY.0 | source decomposed | 39 | nothing in the sources; the scheme structure of M_d, M_d^cm and Milnor's M₂ ≅ 𝔸² over ℤ waits for a GIT owner (gap, structural proposal) |
| DY.1 | source decomposed | 29 | nothing in the sources; the theorems for general varieties rest on RP.0's Weil height machine (request) |
| DY.2 | partial | 55 | Berkovich Fatou and Julia sets with supp µ = J; the archimedean nodes rest on two gaps (the measure-valued Laplacian on the Riemann sphere; Lyubich–Freire–Lopes–Mañé); Zieve's period-exponent bound (no public text) |
| DY.3 | partial | 68 | the CN.0, ED.0, ED.3 and ED.4 requests (exact arithmetic, point lists, Chabauty certificates); smoothness and irreducibility of the unicritical dynatomic curves (gap); the genus of X₁(n) and X₀(n); Morton's reduction of Φ₃ to an elliptic curve |
| DY.4 | source decomposed | 66 | nothing in the sources; the global Arakelov inputs to Yuan's theorem, Yuan–Zhang theory, the bifurcation measure and multiplicities of periodic points are gaps G1–G5 |
| DY.5 | partial | 65 | Jones's infinite-index theorem for PCF maps (needs Ihara); Jones's finite-index theorem (needs Siegel's theorem); Juul in positive characteristic; quadratic rational functions; the density theorems |
| DY.6 | partial | 81 | the proofs recorded as gaps (Cohen structure theorem, Lech, DeMarco–Faber/Favre degeneration, DeMarco–Wang–Ye, Tate's variation theorem, McMullen and Silverman for Ingram, Ghioca–Tucker–Zieve inputs); Ingram's Lemmas 7–12; specialisation over a general base curve |

**Acceptance conditions:**

- **DY.0.** Compares conjugate maps and a map whose resultant vanishes at a bad prime. Equality of iterates is equality
  of morphisms.
- **DY.1.** Uses the power map and multiplication on elliptic curves and abelian varieties. The ampleness-free
  statement (`canonical-height-for-a-divisorial-eigenclass`) is separate and does not carry the zero-height criterion.
- **DY.2.** Computes z² − z − 1 (good reduction everywhere) and bad-reduction maps, with the residue characteristic
  kept.
- **DY.3.** Handles a root of lower exact period with nontrivial dynatomic multiplicity.
- **DY.4.** Keeps sequences inside exceptional sets out of the generic hypothesis.
- **DY.5.** Proves every level for x² + 1 over ℚ, by Stoll's theorem.
- **DY.6.** Gives the power-map and Lattès examples. Uniform boundedness, dynamical Lehmer, general dynamical
  Mordell–Lang and André–Oort are statements consumed only as explicit hypotheses.

**Request answered.** The canonical height of a rational map of ℙ¹ normalised against Mathlib's Weil height is
`DY.1/canonical-height-on-the-projective-line`. ClassicalArithmeticCompletion CA.6 requested it.

**Sources beyond the roadmap document.** The accepted source routes of two paper extractions name these layers, and
their items are covered:

- **DeMarco–Krieger–Ye** (Ann. of Math. 2020), in DY.2, DY.4 and DY.6. This covers escape rates of the Legendre Lattès
  maps, canonical measures, adelic metrics and the Arakelov–Zhang pairing, the energy estimates, and Theorem 1.4.
- **DeMarco–Mavraki–Ye** (Forum Math. Pi 2026), in DY.0, DY.4 and DY.6. This covers M_d and M_d^cm, the critical height
  and Ingram's comparison, and equidistribution of PCF parameters.

The issue did not list either paper.

## Merge decisions

- **Duplicates removed.** Three DY.6 nodes duplicated earlier layers and were removed. Their users now cite the
  earlier node:
  - DY.6's critical divisor → `DY.0/critical-points-of-a-rational-map`;
  - DY.6's relative canonical height → `DY.1/canonical-height-over-a-global-height-field`;
  - DY.6's uniform-boundedness statement → `DY.3/uniform-boundedness-conjecture`.
- **API and tests carried over.** The removed nodes' useful API and tests moved to the surviving nodes:
  - the chain rule `RationalMap.criticalPoints_comp` (local degrees multiply) and `RationalMap.criticalPoints_iterate`;
  - the function-field test `relCanonicalHeight_sq_add_t_zero`: ĥ of z² + t at 0 over k(t) is 1/2;
  - the ℙ¹ form of uniform boundedness with an explicit constant.
- **Prototype restrictions.** Where the combined Lean file needed it, a statement was stated in a narrower form:
  - `periodForm_map` and `dynatomicForm_map` hold for field homomorphisms;
  - the function-field test takes the admissible absolute values of k(t) as a hypothesis.

## Requests made (26)

- **TropicalAndBerkovichArithmetic:**
  - TB.0 (three): the Berkovich line, analytification and the hybrid space;
  - TB.1 (two): potential theory and pull-backs;
  - TB.6 (two): local potential theory, metrics and Chambert-Loir measures.

  DY.2's TB.1 request and DY.4's TB.6 request cover overlapping potential theory, and their owners should merge them.
- **HeightsRationalPointsAndObstructions RP.0 (three):** the Weil height machine, Néron–Tate heights and ample heights on
  M_d.
- **SchemeAndStackFoundations:** SF.0 (two) and SF.5.
- **ComputationalNumberTheory CN.0.**
- **EffectiveDiophantineMethods:** ED.0, ED.3 (four) and ED.4.
- **InverseGaloisAndArithmeticFundamentalGroups IG.2:** Hilbert irreducibility.
- **Tau Ceti:** ModularCurves 0D, NumberFieldArithmetic layer 3, and AlgebraicCurves layers 6, 7 and 8.

## For the orchestrator

1. **Structural proposals:**
   - Geometric invariant theory as a layer of AlgebraicModuliForArithmeticGeometry, for M_d.
   - An owner for global adelic intersection theory and Yuan's arithmetic Siu inequality: the ArakelovGeometryAndAbelianHeights
     Part II proposed by PAPER-YUAN-26.
   - Move equidistribution of PCF maps in moduli to the proposed ArithmeticDynamicsPartIIBifurcation.
   - Sub-layers DY.4a–e.
   - Drop the unused stage edges ED.0, CN.0 and IG.0 → DY.5, and add IG.2 → DY.5.
2. **Stoll's Lean formalisation.** Stoll's own Lean formalisation of his 1992 theorem exists (GitHub
   `MichaelStollBayreuth/QuadraticIterates`, Apache-2.0). The DY.5 section cites it; integrating it should be coordinated
   with its author.
3. **Retired supplier.** The roadmap's input `FoundationsAndLibraryIntegration` (LI.4) names a roadmap retired on
   16 September 2026. No node names it.

## Sources

43 free sources were read. Their URLs, the sections read and the SHA-256 of each are in the packet. Among them:

- Call–Silverman (Compositio 1993, Numdam);
- Silverman's and Benedetto's Arizona Winter School notes;
- Milnor, and Levy;
- Rumely on the minimal resultant locus;
- Morton–Silverman, Hutz, Poonen, Flynn–Poonen–Schaefer and Stoll (2008);
- Baker–Rumely, Favre–Rivera-Letelier, Chambert-Loir, Petsche–Szpiro–Tucker and Yuan;
- Jones's survey, Aitken–Hajir–Maire and Juul;
- Ingram;
- Ghioca–Tucker–Zieve and Bell–Ghioca–Tucker;
- Milnor on Lattès maps;
- the two DeMarco papers.

All 33 arXiv numbers recorded in the packet were checked against their abstract pages.

**Missing:** Silverman's *The Arithmetic of Dynamical Systems*, Baker–Rumely's book, Tate's variation paper and Zieve's
thesis. Public substitutes are used wherever they exist.
