# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (seventh checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–6 merged in #3824, #3827, #3830, #3832, #3838 and #3842.
- R07.1 is closed. R07.2–R07.6 are partial.
- This checkpoint extends **R07.4** with Savitt's theory of tame descent data in weight two. LocalGaloisDeformationRings requested it for R08.4/savitt-weight-two-rings.

## What this checkpoint delivers

- **Packet**, status `partial`:
  - 96 nodes, 9 of them new in R07.4;
  - no new planets, since R07.4 already has the maximum of six;
  - 20 sources (Savitt 2005 and Breuil 2000 are new) and 14 source issues (E13–E14 are new);
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings, with the other packets from origin/main; the intake file checks report 0 problems.
- **Roadmap document**, with a new group "Descent data in weight two (Savitt)" at the end of the R07.4 section.
- **Suggested Lean file**, extended with `TauCeti.BreuilKisin.SemilinearDescentData` and the proved lemma `act_mul_apply`.
  - The new block was elaborated on its own with `lake env lean` against Mathlib 082e2d3, with no errors or warnings.
  - The whole file needs Tau Ceti modules and was not compiled.

## Sources

- **Savitt 2005**, *On a conjecture of Conrad, Diamond, and Taylor*, read in arXiv:math/0404327v3.
  - v3 folds in the author's corrigendum to Theorem 6.12(4) and keeps the published numbering.
  - §§2–5 were compared with v1 and v2.
  - The published Duke text on the author's site is behind a browser challenge and was not seen.
- **Breuil 2000**, *Groupes p-divisibles, groupes finis et modules filtrés*, in the author's copy. Read for the results Savitt and Kisin cite:
  - Théorèmes 4.2.1.6, 4.2.2.5, 4.2.2.9 and 5.3.2;
  - Corollaire 4.2.2.7 and Lemme 4.2.2.8;
  - Propositions 2.1.2.2 and 5.1.3.

  It is Kisin's [Br 3], which the checkpoint 5 coverage listed as unread.

## New R07.4 nodes

- `filtered-modules-with-descent-data` (definition): filtered (φ, N, F/F′, E)-modules, weak admissibility, WD(D) and the Galois type (Savitt §2.1–2.2, Definitions 2.6–2.8, 2.15).
- `potentially-semistable-descent-equivalence`: D^F_st and V^{F′}_st, and V_{st,k} with its weight range (Proposition 2.9, Corollaries 2.10 and 2.12).
- `tame-type-weight-two-filtered-modules`: the tame types, and the modules D_{x₁,x₂}, D′_{x₁,x₂} and D_{m,[a:b]}, all weakly admissible (Propositions 2.17–2.21).
- `descent-data-p-divisible-groups`: Definition 3.1, and Proposition 3.2 (lattices ↔ p-divisible groups with descent data).
- `strongly-divisible-modules-descent-data` (construction):
  - Breuil's categories and M_π(G);
  - descent data on M_π(G) (Proposition 3.3, Corollaries 3.4 and 3.6);
  - Definitions 3.7–3.8;
  - the canonical N (Breuil 5.1.3).
- `descent-data-lattice-classification`: Theorem 3.10, Proposition 3.11, Lemma 3.13 and Theorem 3.14.
- `strongly-divisible-modules-coefficients` (construction): Definition 4.1, Lemma 4.6 through Corollary 4.12, and Proposition 4.13 (every O_E-lattice arises).
- `breuil-modules-descent-data` (definition): Breuil modules, the equivalence T₀, and maximal and minimal Breuil modules (Lemma 4.14, Remark 4.15).
- `strongly-divisible-modules-for-characters`: Propositions 5.1–5.4.

Savitt §6 (the explicit families and deformation rings) stays with LocalGaloisDeformationRings R08.4, which cites it.

## Source issues

- **E13, new.** Savitt's Definition 3.1 indexes descent data by "g ∈ Gal(F′/F)"; since F′ ⊆ F, Gal(F/F′) is meant.
- **E14, new.** On p. 20, twice, Savitt writes "filtered (ϕ, N, F/F′, Zp)-module" where Lemma 3.13 has ℚ_p. Definition 2.7 needs a field of coefficients.
- Both slips are in arXiv v1–v3, were checked on the page images, and are not in the corrigendum.
- Both are also logged in the maintainer's local list of published errata.

## What a continuation could do

1. **R07.4:**
   - Kisin 2009 §§1.2–2 with coefficients;
   - weights {0, p − 1} and {0, p}, with the KW reductions;
   - the Wach comparison;
   - descent data beyond weight two (Breuil–Mézard's semistable strongly divisible modules).
2. **R07.5:** general e, and the general p = 2 criterion.
3. **R07.6:** Fontaine's ramification bound and the R08 deformation calculations.
4. **R07.2 and R07.3:** crystals and Grothendieck–Messing, and FL §9.
