# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (sixth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–5 merged in #3824, #3827, #3830, #3832 and #3838.
- R07.1 is closed. R07.2, R07.3 and R07.4 are partial.
- This checkpoint plans **R07.5, local residual types**, which stays partial, and starts **R07.6** with one node.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, status `partial`:
  - 87 nodes: 9 new in R07.5 and 1 in R07.6;
  - 4 R07.5 planets (27 in all);
  - 34 baseline declarations (`WeierstrassCurve.HasGoodReduction` is new), 16 requests (3 new) and 12 source issues (E12 is new);
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index, with the other packets from origin/main; the intake file checks report 0 problems.
- **Roadmap document**, regenerated with R07.5 and R07.6 sections and a convention paragraph on tame inertia and "finite at p".
- **Suggested Lean file**, extended in `TauCeti.FiniteFlat` with `tameInertia`, `fundamentalCharacter` and `IsPeuRamifieeClass`, with three examples.
  - The new block was elaborated on its own with `lake env lean` against Mathlib 082e2d3: 0 errors, only warnings for placeholder declarations.
  - The whole file needs Tau Ceti modules and was not compiled.

## Sources

- **Serre 1972**, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent. Math. 15. Read in the Göttingen (GDZ) scan of the published article.
  - The scan has no text layer, and no OCR tool is installed here. The pages of §1 were rendered and read as images, and the excerpts are transcriptions.
- **Serre 1987**, *Sur les représentations modulaires de degré 2*, Duke 54. Read in the Collège de France scan, which has an OCR text layer.
- **Raynaud 1974**, already a source. Re-read to check a citation.
- **Stix's notes**, already a source. §9.2 (6) was re-read.

## R07.5 (partial)

- `tame-inertia-characters` (planet): θ : I_t ≅ lim μ_d, the fundamental characters, χ̄ = θ_{p−1}^e on I_t, and the levels of a two-dimensional representation (Serre 1972, Prop. 1, §1.7, Prop. 8; Serre 1987, Prop. 1).
- `formal-group-torsion-inertia`: Serre 1972, Prop. 9 and Cor. 1–3 (e = 1, height h).
- The elliptic-curve cases:
  - `ordinary-torsion-inertia`: Prop. 11 and its corollary;
  - `supersingular-torsion-inertia` (planet): Prop. 12, the non-split Cartan;
  - `multiplicative-torsion-inertia`: Prop. 13, and the Kummer criterion for tame inertia, q ∈ K_nr^{*p}.
- `peu-tres-ramifiee` (planet): Serre 1987 §2.4.
- `finite-flat-kummer-extensions`:
  - extensions of μ_p by ℤ/p split over ℤ_p^nr;
  - extensions of ℤ/p by μ_p are unit Kummer classes;
  - hence finite exactly when peu ramifiée.
- `finite-flat-weight-two-criterion` (planet): Serre 1987, Prop. 3–4, on the finite-flat side. For p odd and det|_I = χ̄, ρ is finite iff it is level-2 fundamental or peu ramifiée (χ̄ *; 0 1). This answers SerreWeightAndLevelOptimisation's R07.5 request, and R15.4 keeps the weight recipe.
- `dyadic-finite-flat-dichotomy`: (1 u; 0 1) at p = 2 is finite iff K = ℚ₂(√d) with d a unit (discriminant 1 or 4). The finite-flat argument is written out here; Serre states only the weights.

## R07.6 (partial)

- `abelian-scheme-torsion-finite-flat`: A[n] is finite locally free of rank n^{2g} (from A3), and A[p^∞] is p-divisible.
- For E/ℚ with good reduction at p, E[p^v] is the generic fibre of a finite flat ℤ_p-group scheme. This answers EllipticCurveModularity's R07.6 request (R29.2/finite-flat-weight-two).

## Requests

**New:**
- Tau Ceti EllipticCurves Layer 4: the Tate curve and the Kummer class of q.
- ArithmeticGaloisRepresentations R01.6: the Weil-pairing determinant and the reduction of torsion.
- AbelianSchemesAndArithmeticModuli A3: [n] finite locally free of rank n^{2g}.

**Extended:**
- ModularCurves 7E, for PD-1.
- ModularCurves 0E, for étale descent in the criterion.

## Source issues

- **E12, new.** Serre 1987 §2.8, proof of Proposition 4, case (a) cites "Raynaud [35], th. 2.4.3". Raynaud 1974 has no §2.4, and the result meant is Théorème 3.4.3.
  - Checked on the page image.
  - Also logged in the maintainer's local list of published errata.
- No mistakes were found in the pages of Serre 1972 that were read.

## What a continuation could do

1. **R07.5:**
   - e > 1: Serre 1972 §1.10 and Proposition 10, the Newton polygon of [p];
   - the general p = 2 finite-flat criterion, which Serre calls "analogous";
   - the conductor remark of §2.4.
2. **R07.6:**
   - Fontaine's ramification bound, requested by SmallRamification R25.1. Fontaine's paper is still not freely available.
   - the R08 tangent and obstruction calculations.
3. **R07.4, still open:**
   - descent data (Savitt, Breuil–Mézard);
   - Kisin 2009 with coefficients;
   - weights {0, p − 1} and {0, p};
   - the Wach comparison.
4. **R07.2 and R07.3, still open:** crystals and Grothendieck–Messing, and FL §9.
