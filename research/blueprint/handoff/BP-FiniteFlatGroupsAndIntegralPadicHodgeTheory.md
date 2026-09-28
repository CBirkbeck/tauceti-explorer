# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (fourth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–3 merged in #3824, #3827 and #3830.
- R07.1 is closed. R07.2 (Dieudonné theory over perfect fields) is partial.
- This checkpoint plans **R07.3, Fontaine–Laffaille theory**, which stays partial.
- R07.4–R07.6 are not yet read.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, status `partial`:
  - 58 nodes, 14 of them new in R07.3;
  - 6 R07.3 planets (17 in all);
  - 29 baseline declarations, 9 requests and 2 source issues;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index, and the intake file checks report 0 problems.
- **Roadmap document**, regenerated with an R07.3 section and the Fontaine–Laffaille conventions.
- **Suggested Lean file**, extended with a `TauCeti.FontaineLaffaille` section:
  - the `FLModule` structure over Mathlib's `WittVector p k`, with σ-semilinear φ^i and φ^i = pφ^{i+1};
  - the range predicate and morphisms;
  - the length, full-faithfulness and strong-divisibility statements.

## R07.3 (partial): Fontaine–Laffaille theory at e = 1

The source is FL 1982, specialised to A = W(k), π = p, E = ℚ_p.

**Filtered modules and S**
- `fl-filtered-modules` (FL 1.2–1.6);
- `mf-tor-abelian` (1.8–1.11, 3.2);
- `fl-ring-S`: S = W(R)[[x]/p] with v_R(x) = p (§2);
- `fl-period-comparison`: S_K is the filtered Galois ring of Fontaine's [F2], §4, and Ŝ ⊆ A_cris via R06.1.

**The torsion functor**
- `fl-functor-torsion`: U_S = Ext¹(−, S) = Hom(−, S_n).
- `fl-exact-faithful`: Theorem 3.3, with Remark 3.4 (same invariant factors).
- `fl-simple-objects`: Proposition 4.4.
- `fl-tame-inertia`: Theorem 5.3, with the weight dictionary. U_S(M(1; i)) = ω^i on inertia, so a filtration jump in degree i is Hodge–Tate weight i when HT(χ_cyc) = +1.
- `fl-full-faithfulness`: Theorem 6.1 on MF′ and MF″, with three consequences:
  - the safe interval [0, p − 2] ⊆ MF′;
  - the §0.9 endpoint collision U_S(M(1; 0)) ≅ U_S(M(1; p − 1));
  - at p = 2 the safe interval is [0, 0].

  FL prove Proposition 6.6 only for MF′ and indicate the MF″ case; the safe interval needs only MF′.
- `fl-essential-image-subquotients`: derived here. The argument uses exactness, full faithfulness and "simples go to simples". FL themselves say the whole essential image resists description (p. 589).

**Lattices and rational representations**
- `strongly-divisible-lattices`: 7.7, 7.8, 7.12; existence iff weakly admissible, using R06.2.
- `fl-lattice-functor`: 7.14–7.15.
- `fl-admissibility`: Theorem 8.4 with Proposition 7.17. Weakly admissible of filtration length < p implies admissible, and U_{S_K} is the dual of V_B. This rational statement is kept separate from the torsion safe interval, as the stage text requires.
- `fl-lattice-correspondence`: G_K-stable lattices of crystalline representations with weights in [0, p − 2] correspond to strongly divisible lattices.
  - Derived here; PadicHodgeTheory requests it "if provable".
  - The proof uses the subquotient lemma at a finite level, and strictness with the five lemma for strong divisibility.

## Requests from other roadmaps

PadicHodgeTheory's two requests to R07.3 are answered, with two notes:
- Their "Proposition 7.17" lattice correspondence is not FL's 7.17, which is only the dimension and injectivity statement. It is supplied by the derived `fl-lattice-correspondence`.
- FL §9 (finite flat groups ↔ MF_tor^{[0,1]}) remains open (below).

New requests: PadicHodgeTheory R06.2 (weak admissibility, V_cris/D_cris conventions) and R06.1 (R, W(R), θ, A_cris, B_dR, and the comparison of S).

## Source issues

- **E2, new.** FL §6.5 (p. 584) cites "théorème 4.3" where Theorem 3.3 is meant. Checked on the page image.
- It is also logged in the maintainer's local list of published errata.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## What a continuation could do

1. **R07.3, FL §9:** the dictionary between finite flat p-groups over W(k) and MF_tor^{[0,1]}.
   - FL's Proposition 9.10 (Honda systems ↔ MF_tor^{[0,1]}) is elementary.
   - The classification of p-groups by finite Honda systems is Fontaine's [F3] (Astérisque 47–48, not freely available). A continuation should find a free source, or route it through R07.2's Dieudonné theory, or through Breuil–Kisin (R07.4) for p > 2.
2. **R07.2 remaining:** Dieudonné crystals, Grothendieck–Messing, Cartier–Dieudonné theory and deformations.
3. **R07.4 (Breuil–Kisin), R07.5, R07.6.** PadicHodgeTheory and LocalGaloisDeformationRings have detailed R07.4 requests (Kisin 2006; Kim, Lau and Liu at p = 2).
