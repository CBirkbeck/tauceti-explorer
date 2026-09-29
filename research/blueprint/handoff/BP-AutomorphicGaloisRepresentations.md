# Handoff: BP-AutomorphicGaloisRepresentations (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #685.

- Stages R19.1–R19.6. All six are partial. The checker reports no errors.
- RS-12 (this family's restructure) has review status **needs_changes**, so the current structure is used. Its owner table is followed only where it makes the stage texts explicit.
- The packet has 13 nodes: 8 carried over from the reviewed decomposition (with corrections) and 5 new. It has 10 planets.

## What this checkpoint does

R19.1:

- `geometric-construction-and-the-eichler-congruence-relation` (planet): now a construction with API and tests.
  - Deligne's Proposition 3.15 is corrected: over an ordinary point in characteristic p the fibre of q_1 has two points, not one (E1, flagged in the RS-12 report).
  - Weil I (R34.5) is requested to replace the conditional Theorem 5.1.
- `parabolic-realisation-premotive` (new construction), after Diamond–Flach–Guo arXiv v2 §§2–5:
  - the realisations, with C ⊗ Fil^{k−1} ≅ S_k(N, ψ);
  - the perfect pairing to K(1 − k);
  - the Hecke action (Lemma 5.1, Proposition 5.6).
- `newform-rank-two-realisation` (new, planet):
  - M_g has rank two with Fil^{k−1} = Kg and ∧²M_g ≅ M_ψ(1 − k) (Lemma 5.7);
  - ρ_{g,λ} := M_{g,λ}^∨ has the roadmap's arithmetic normalisation: Frobenius polynomial X² − a_pX + ψ(p)p^{k−1}, det ψχ^{k−1}, odd, absolutely irreducible;
  - it is identified with Deligne's ρ_λ.
- `lambda-adic-representation…` and `weight-one-artin-representation`: carried over, with prerequisites and planets.

R19.2 and R19.3: Carayol's Theorem (A), and strict compatibility with purity, are carried over. The Weil–Deligne sign is fixed as FNF^{−1} = q^{−1}N (see PadicHodgeTheory/E50).

R19.4:

- The Hecke-versus-Langlands node is kept, with its kind changed to theorem.
- `conductor-and-local-factors-classical` (new, planet):
  - the conductor equals the level;
  - the Steinberg local form (Darmon–Diamond–Taylor 3.1(d)–(e));
  - the bad Euler factors, read on M^{I_p} with geometric Frobenius;
  - Carayol's corollary for Weil curves.

R19.5: the inherited Saito node is rescoped to apply the Scholl–Saito compatibility already planned in PadicHodgeTheory R06.6 (#3856) to the Barsotti–Tate, ordinary and Steinberg cases. A restructure entry records the ownership question.

R19.6:

- `weight-two-tate-module-decomposition` (new, planet): V_ℓ(A_f) ≅ ⊕_{λ|ℓ} ρ_{f,λ}, free of rank two over K_f ⊗ Q_ℓ (Darmon–Diamond–Taylor Lemma 1.48, §3.1).
- `residual-representation-of-a-newform` (new construction).
- Chenevier's determinants are carried over.

## Requests answered

- EllipticCurveModularity: R19.4 (conductor, bad factors) and R19.6 (the Tate module of A_f).
- SerreWeightAndLevelOptimisation: R19.6 (the residual representation).
- PadicHodgeTheory--R06.5: R19.1 (M_g, its Hodge line, ∧²) and R19.4 (Carayol).

## Requests not yet answered

- GL2ModularityLifting R22.1: the Hecke-algebra representation for Hilbert forms (Carayol's descent), and the Steinberg-at-p local form (KW II Lemma 7.7).
- OrdinaryAutomorphicFormsAndModularityLifting: Wiles' ordinary Hilbert representations (R19.2), and the ordinary Hilbert R19.4 statement.

## What remains

- **R19.1:** integral lattices of M_g (DFG §6.4); Deligne–Serre §8; Scholl's Kuga–Sato realisation (requested from GeneralizedHeegnerCycles GH.0).
- **R19.2:** Carayol §§1–12 and the bad-reduction companion paper.
- **R19.3:** Saito's proof of purity; the compatible-system carrier (R24.5).
- **R19.4:** Carayol's proof; the comparison of σ with Saito's σ̌_h.
- **R19.5:** the endpoint weight; the ordinary Hilbert local form.
- **R19.6:** the Hecke-algebra representation (Carayol's descent); the residue-field descent of Chenevier's Theorem B (IHG.1 request).

## Requests made

- ModularCurvesPartII R14.3.
- GeneralizedHeegnerCycles GH.0.
- WeightsInEtaleCohomology R34.5 and R34.6.
- ArithmeticGaloisRepresentations R01.1, R01.2 and R01.6.
- GL2AutomorphicRepresentationsAndTransfer R16.3.
- HilbertModularVarietiesAndShimuraCurves R18.2 and R18.4.
- PotentialModularityAndCompatibleSystems R24.5.
- AlgebraicModularFormsAndSerreWeights R15.5.
- IntegralHeckeAndGaloisDeterminants IHG.1.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against the Mathlib 082e2d3 build, and `sorry` is its only warning.

It prototypes:

- the arithmetic and cohomological Frobenius polynomials;
- the Euler factor;
- the count of lines in (Z/p)² behind the Hecke fibre;
- the level-23 splitting check (`decide`);
- the trace identity for 11a1 mod 5 (`decide`).

## Source issues

- E1: Deligne, Bourbaki 355, Proposition 3.15, p. 157. Checked on the page image.
- The packet also uses PadicHodgeTheory/E48–E50 for Diamond–Flach–Guo's and Saito's conventions.
- Note for the PadicHodgeTheory packet: the decomposition reviewer had already flagged the Weil–Deligne half of E50 (the gap "Hecke normalizations and Weil–Deligne sign conventions…"). E50's "known: new" should say this. The φN half and the internal inconsistency with Saito's Theorem 2 are new.

## Sources

New in this checkpoint:

- Diamond–Flach–Guo, arXiv:2512.02348v2;
- Darmon–Diamond–Taylor, 2007 revision.

Re-read on page images: Deligne, Bourbaki 355 (p. 157) and Carayol (p. 412). All hashes match the decomposition's library copies.
