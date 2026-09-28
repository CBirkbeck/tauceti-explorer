# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (third checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–2 merged in #3824 and #3827; R07.1 is closed.
- This checkpoint begins R07.2 (Dieudonné theory), which stays partial.
- R07.3–R07.6 are not yet read.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, status `partial`:
  - 44 nodes, 14 of them new in R07.2: 2 definitions, 3 constructions, 4 lemmas and 5 theorems;
  - 5 R07.2 planets (11 in all);
  - 28 baseline declarations and 7 requests;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index, and the intake file checks report 0 problems.
- **Roadmap document**, regenerated with an R07.2 section and the Dieudonné convention added to the conventions.
- **Suggested Lean file**, extended with a `TauCeti.Dieudonne` section: Dieudonné modules as a structure over Mathlib's `WittVector p k`, and the finite and p-divisible Dieudonné functors with their length, freeness and dimension statements.

## R07.2 (partial): Dieudonné theory over a perfect field

- **Convention: contravariant** (Demazure, Fontaine, Pink). F on M(G) comes from F_G. Then:
  - M(ℚ_p/ℤ_p) = (W, F = σ) and M(μ_{p^∞}) = (W, F = pσ);
  - dim G = dim_k M/FM;
  - the slope of M_{a,b} is b/(a + b).
- **Frobenius, Verschiebung and Witt groups:**
  - `frobenius-verschiebung`: Pink §14, Theorem 14.4, V∘F = p = F∘V, in general; ModularCurves 7E PD-3 is the elliptic case;
  - `canonical-decomposition`: Pink Theorem 15.5;
  - `witt-group-schemes`: W_n and W_n^m with the E-action, Pink §22 and Proposition 23.1, on Mathlib's truncated Witt vectors;
  - `dieudonne-ring`: E = W(k){F, V}.
- **Finite group schemes:**
  - `dieudonne-module-finite`: Pink (28.1) with the dual N*;
  - `dieudonne-equivalence-finite`: Pink Theorem 28.3, from the local–local case 23.2, the étale case 27.1 and duality 26.3; length = log_p |G|;
  - `dieudonne-tangent-space`: Pink Proposition 28.4;
  - `dieudonne-galois-descent`: perfect base change, descent from k̄, and Lang via Pink Proposition 27.3. This is the "descent/forms" work RS-02 keeps.
- **p-divisible groups:**
  - `dieudonne-p-divisible`: Demazure III.8, through the nLab transcription, and Yu Theorem 3. The module is W-free of rank h, M(G_n) = M/p^n M, and there are duality and base change.
  - `dieudonne-lie-algebra`: Lie(G) ≅ (M/FM)^∨, and h = dim G + dim G^D. The latter reproves R07.1's Tate Proposition 3 over perfect fields.
  - `standard-dieudonne-modules`: μ_{p^∞}, ℚ_p/ℤ_p, M1 and M2, matched with Mathlib's `StandardOneDimIsocrystal` 0 and 1.
  - `elliptic-dieudonne`: Yu Lemma 4, cross-checked with ModularCurves 7E PD-5.
- **Slopes and isogeny:**
  - `dieudonne-slopes`: M_{a,b}, slope sequences and a-numbers;
  - `isogeny-classification`: derived from Theorem 3 and Dieudonné–Manin; dim G is the sum of the slopes.
  - Dieudonné–Manin itself is imported from VectorBundlesAndIsocrystals VB0 (new request), as RS-02 prescribes.
- **Requests:**
  - new: VB0 (Dieudonné–Manin and the slope convention);
  - extended: ModularCurves 7E (PD-3, PD-5).

## Source notes

- **Pink's notes** give complete proofs for finite group schemes; the printed page is the PDF page − 4. His script ℓ ('Grℓ') is extracted as a backtick, so word-matching scores for those excerpts are lower although the excerpts are exact.
- **Demazure's LNM 302 is not freely available.** Its §III.8 is cited through the nLab transcription.
  - That page has transcription slips, which are not recorded as source issues because nLab is not the published text. One example: its Remark repeats "G is finite iff M(G) is torsion-less", where the Theorem above it correctly says "p-divisible iff".
  - The plan cites the correct Theorem form.
- **Yu (arXiv:2603.11506, 2026)** is a recent expository note; it states Theorem 3 with exactness, perfect base change, the dual M^t, height = rank and Lie(G) ≅ Hom(M/FM, k).
- No source mistakes were found in the published sources read here.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## What a continuation could do (R07.2 remaining, then R07.3–R07.6)

1. **The Dieudonné crystal over non-perfect bases.**
   - Build it on CrystallineCohomology CR.0/CR.1 (Grothendieck's Montréal notes; Berthelot–Breen–Messing).
   - Check which sources are freely available first. Messing's LNM 264 and BBM's LNM 930 are Springer.
2. **The consolidated Grothendieck–Messing equivalence**, with the nilpotence hypotheses kept separate as RS-02 requires.
3. **Covariant Cartier–Dieudonné theory over general bases in characteristic p.**
   - Zink's displays and the Norman–Oort deformations, from Yu §§2.3–2.4 and its references (Zink, Norman–Oort).
   - The comparison D*(G) ≅ M(G)^t.
4. **R07.3 (Fontaine–Laffaille), R07.4 (Breuil–Kisin), R07.5 and R07.6**, in order. R07.6 needs Fontaine's ramification bound; Yoshida (arXiv:0905.1171) reduces it to property (P_m).
