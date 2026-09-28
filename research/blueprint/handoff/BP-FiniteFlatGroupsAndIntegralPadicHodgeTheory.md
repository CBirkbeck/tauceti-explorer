# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (eighth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–7 merged in #3824, #3827, #3830, #3832, #3838, #3842 and #3844.
- R07.1 is closed. R07.2–R07.6 are partial.
- This checkpoint extends **R07.4** with Kisin 2009 §§1.2–1.3: Kisin's theory with coefficients.

## What this checkpoint delivers

- **Packet**, status `partial`:
  - 100 nodes, 4 of them new in R07.4;
  - no new planets, since R07.4 is at the cap of six;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings, with the other packets from origin/main; the intake file checks report 0 problems.
- **Roadmap document**, with a new group "Coefficients (Kisin 2009, §§1.2–1.3)" in the R07.4 section.
- **Suggested Lean file**: unchanged in this checkpoint.

## New and changed R07.4 nodes

- `kisin-modules-with-coefficients` (definition): (Mod FI/𝔖)_A and (Mod FI/S)_A, Lemma 1.2.2, base change (1.2.3), and duality with étale ↔ multiplicative (1.2.10).
- `breuil-modules-with-coefficients`: Lemma 1.2.4 (an exact fully faithful functor for |A| < ∞) and Lemma 1.2.5 (an equivalence when pA = 0).
- `etale-phi-modules-with-coefficients`: Lemma 1.2.7 (T_A, base change, and freeness iff freeness) and Lemma 1.2.9.
- `crystalline-with-coefficients`: 1.3.1–1.3.5 (D_cris,A and V_cris between Rep^cris_A and (Mod/K₀)_{A-fr}).
- `multiplicative-etale-dictionary`, changed:
  - the proof of Proposition 1.2.11 is completed: u-torsion freeness, the nil/unit decomposition, freeness, base change and duality;
  - the statement now includes the duality isomorphisms of (1.2.11)(3).

## Coverage

Kisin 2009 §2 (moduli of finite flat models and their generic fibres) is recorded as the consumer's: LocalGaloisDeformationRings R08.4/finite-flat-model-moduli plans it from the coefficient theory planned here.

## Source issues

No new source issues: the pages of Kisin 2009 §§1.2–1.3 read show no mistakes.

## What a continuation could do

1. **R07.4:**
   - weights {0, p − 1} and {0, p}, with the KW reductions;
   - the Wach comparison;
   - descent data beyond weight two.
2. **R07.5:** general e, and the general p = 2 criterion.
3. **R07.6:** Fontaine's ramification bound and the R08 deformation calculations.
4. **R07.2 and R07.3:** crystals and Grothendieck–Messing, and FL §9.
