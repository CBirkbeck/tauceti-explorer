# DESIGN-CMAllPrimeMainConjectures — handoff

Job: DESIGN-CMAllPrimeMainConjectures (issue #1884), Claude session claude-dBmbUG, 2026-10-18/19.

## What was done

A new roadmap, `CMAllPrimeMainConjectures`: "Main conjectures for modular forms and their families, Part II: all-prime CM zeta-element main conjectures". Its area is iwasawa and its parent is ModularIwasawaMainConjectures. It has seven layers and the packet is complete.

- `research/blueprint/roadmaps/CMAllPrimeMainConjectures.json` — roadmap definition. Stages CZ.0–CZ.6; each stage's `requires` is derived from its nodes' prerequisites.
- `research/blueprint/packets/CMAllPrimeMainConjectures.json` — 54 nodes:
  - by kind: 3 definitions, 8 constructions, 31 theorems, 4 lemmas, 6 comparisons, 2 applications;
  - 78 API items, 46 unit tests, 25 planets;
  - 12 baseline declarations, 22 requests, 7 gaps, 6 restructure proposals and 2 new source issues.
  - Every stage is `planned`.
  - `python3 scripts/check_blueprint.py … --index …/declarations.tsv` reports 0 errors and 0 warnings.
- `research/blueprint/readmes/CMAllPrimeMainConjectures.md` — the reader (about 28,000 words). It has conventions, a layer overview, sources and editions, the corrections used, the baseline, supplier contracts, the exports, and every node with its API and unit tests, gaps, structure and acceptance tests.
- `research/blueprint/suggested/CMAllPrimeMainConjectures.lean` — a compact file, as the 2026-10-12 shape prescribes. It contains:
  - the twisting automorphism `Tw_χ` of a group algebra;
  - evaluation at a character, and the Euler factor `1 − g⁻¹`, which vanishes on the trivial component;
  - the decidable predicate for `Q(√d) ⊂ Q(μ_{p^∞})`, with its characterization stated, plus examples.

  Heavy objects (ray towers, Iwasawa cohomology, elliptic units, Kato's realization, characteristic ideals over completed group algebras) are README targets, because their carriers are not at the pins. **The file compiled** with `lean-check` at Mathlib 082e2d37e8; its only warnings are `sorry`. `twist_of`, `charEval_of`, `charEval_one_eulerFactor` and all the examples are proved.

## Layers

| Layer | Content | Key exports |
| --- | --- | --- |
| CZ.0 | Ray tower Z_p²×Δ_f (no p ∤ #Δ), Iwasawa cohomology H^q_{p∞f}, h¹/h², Kummer (15.6.1), class/H² (15.6.2) with Brauer and p-place terms, O[1/p]↔O[1/pf] Euler sequence, module structure, CM theta aθ_E, canonical CM pair, elliptic units, Kronecker limit formula, z and z_{p∞f}, cotorsion | the early elliptic-unit foundation; depends on no main conjecture |
| CZ.1 | Kato's V(ψ), S(ψ), per_ψ for all r; height-one KK3 applied to the CM p-divisible groups; (15.9.1); Prop. 15.9 | elliptic-unit reciprocity (its r = 1 case is Burungale–Kobayashi–Ota's) |
| CZ.2 | Elliptic-unit Euler system; s = 0 Tamagawa input; zeta-element comparison; Euler-system bound; JLK Theorem 5.2 at every p; Corollary 5.3; Rubin's modules; Rubin Theorem 4.1 plus JLK §5.4 classical form | the integral main conjecture |
| CZ.3 | Split p: two-variable Coleman map, image = Katz measure, Katz form, anticyclotomic θ-components (CGLS item 9), functional equation and λ(L_ψ)=λ(L_φ) | for BSD.7a and HE.8b |
| CZ.4 | Regular-prime equality (JLK §7.2); BT Theorem 2.1 corrected; printed-form range | rational equivariant equality |
| CZ.5 | CM characterization; Lemma 15.11(1) (the Galois normalization (15.11.2)); Kato 13.5 for CM (Rohrlich 1988 Thm 1); (15.12.1); twisted tower cohomology; Lemma 15.13 and 15.14; Lemma 14.15; **CM case of Kato 12.4 at every p**; Prop. 15.17 | for the CM branch of KatoEulerSystems L2/L4 |
| CZ.6 | Lemma 15.11(2) (the archimedean normalization (15.11.3)); (15.12.2); twisted equivariant equality on ψ-components; (15.16.1); **equality descent** (the step Kato lacks); **BT Theorem 2.6**; CM divisibility in Z(f) form; normalization dictionary; acceptance at Q(i), p=2 and Q(√−3), p=3 | for CMRankZeroConverse C.3–C.6 |

## Routed items → nodes

PAPER-BURUNGALE-TIAN-26, route 7:

| Item | Node |
| --- | --- |
| units-finite, units-torsionfree, units-rank-one | CZ.0/tower-unit-module-structure |
| classes-finite, classes-torsion | CZ.0/tower-class-module-torsion |
| elliptic-units | CZ.0/standard-elliptic-unit, CZ.0/elliptic-unit-module |
| elliptic-unit-cotorsion | CZ.0/elliptic-unit-cotorsion |
| class-cohomology | CZ.0/class-module-h2-comparison |
| h2-euler-comparison | CZ.0/h2-euler-comparison |
| ray-coefficient-iwasawa-cohomology | CZ.0/ray-tower-iwasawa-cohomology |
| cm-realization | CZ.1/cm-hecke-realization |
| cm-elliptic-reciprocity | CZ.1/cm-elliptic-reciprocity (with cm-p-divisible-reciprocity and cm-eisenstein-evaluation); (15.12.2) is CZ.6/cm-coefficient-reciprocity |
| regular-prime-equality | CZ.4/regular-prime-equality |
| equivariant-main | CZ.4/rational-equivariant-main-conjecture (corrected), CZ.4/printed-equivariant-form-range |
| cm-comparison-map | CZ.5/cm-comparison-map |
| cm-descent | CZ.5/cm-descent-lemma |
| cm-contained-descent | CZ.5/cm-contained-descent |
| cm-h2-torsion | CZ.5/cm-h2-torsion |
| cm-characterization | CZ.5/cm-newform-characterization |
| twisted-equivariant-equality | (a), (b): CZ.5/twisted-tower-cohomology; (c): CZ.6/twisted-equivariant-equality |
| cm-zeta-bridge | CZ.6/cm-zeta-bridge |
| equality-descent | CZ.6/equality-descent |
| cm-kato-main | CZ.6/cm-kato-main-conjecture |

The route 7 brief's integral layer is CZ.2/lambda-main-conjecture (JLK Theorem 5.2, all p) and CZ.2/classical-two-variable-main-conjecture (JLK §5.4 classical form and Rubin's Theorem 4.1, hypotheses checked against Rubin 1991). The Coleman/Katz form is CZ.3.

Other routes:

| Route item | Node |
| --- | --- |
| PAPER-CASTELLA-ETAL-22 route 8, item 9: (1) | CZ.3/anticyclotomic-theta-main-conjecture |
| item 9: (2) | the λ-equality in the same node |
| item 9: (3) | CZ.3/katz-functional-equation-lambda |
| PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 6, rubin-two-variable-main-conjecture | CZ.2/classical-two-variable-main-conjecture (ii), as Rubin states it; see the correction below |

## Corrections and findings

- **New source issue CMAllPrimeMainConjectures/E1 (misprint).** Kato's proof of Prop. 15.17 (p. 265) applies "Lemma 14.12", but Lemma 14.15 (pp. 243–244) is meant. Proposition 14.12 (p. 241) is about local cohomology. I checked the page image; no erratum was found.
- **BKO route 6 misreads Rubin.** The item states an inert-prime equality char(X_∞^χ) = char(U_∞^χ/C̄_∞^χ) and attributes it to Rubin's Theorem 4.1(ii). But Rubin's 4.1(ii) (p. 37) concerns A_∞ and Ē_∞/C̄_∞: it gives a divisibility, with equality for χ nontrivial on the decomposition group of 𝔭. Rubin's Remark 2 says X_∞ and U_∞/C̄_∞ are not torsion for nonsplit p. Agboola–Howard II Proposition 3.3(ii) (read, p. 5) deduces the Selmer form char(X_str) = char(S_rel/C) from 4.1(ii) as printed. The node exports Rubin's statement. InertAnticyclotomicCMMainConjecture (#1690) should import it and own the Agboola–Howard deduction, and the extraction item should be corrected. This is recorded in the restructure entry.
- The BT errata E1, E2 and E13 (all confirmed) are used as stated: the Euler factors, the missing equality step, and the contained case.
- **New source issue CMAllPrimeMainConjectures/E2 (misprint).** The proof of Lemma 15.11(2) (p. 262) writes L_S(ψ, χ, k − 1) and L_S(f, χ, k − 1). The results it invokes give L_S(ψ̄, …) and L_S(f*, …): (15.9.2) on p. 259 and Theorem 6.6 on p. 163. The misprint is harmless, because L(f*, s) = L(ψ̄, s).
- **Cross-check.** A Sonnet agent compared all 109 references to Kato, JLK, BT, CGLS and AH against the texts, and I checked every substantive finding on the page images. The packet now keeps Kato's conventions exactly:
  - L_{pf}(ψ̄, χ, r) in Prop. 15.9 and (15.9.1);
  - L_{{p}}(f*, χ, k − 1) in (15.12.2);
  - the idele action a_v^r ψ(a)^{-1} in 15.8;
  - the §3.8 normalizations (|·|^{-s}, D^{k−1}dlog, E^{(0)} = lim s^{-1}E(0, τ, z, s), on p. 140).

  It also fixes the CGLS chain (H^1 versus Selmer), drops an unsupported unit claim in the functional-equation node, and corrects three page locators (Kato 3.8 is pp. 138–140; Kato 8.2 is pp. 180–181; JLK p. 15). Statements that are this design's own derivations, not the sources', are now marked as such: the Ω-coefficient Euler sequence, the weak-Leopoldt route, the level formula N = |d_K|N(f_ψ) and the classification of K ⊂ Q(μ_{p^∞}).

## Requests (22)

Stage-level requests:

- AutomorphicPadicLFunctions L0: the CM ray tower.
- IntegralIwasawaTheory I.2: non-cyclotomic tower limits, and weak Leopoldt for cyclotomic towers.
- PadicMeasuresIwasawaAlgebras L1: completed group algebras of Z_p²×Δ.
- ComplexMultiplicationAndExplicitReciprocity CM.4: the weight-k induction (Kato 15.10) only.
- PadicHodgeRegulators D.2: KK3 Theorem 4.3.1 with h = 1.
- AnalyticNumberTheory AN.4: edge nonvanishing for infinite-order unitary Hecke characters.
- ColemanPowerSeries L1 and L2: the height-one relative Lubin–Tate Coleman operator, and sign conventions.
- AutomorphicPadicLFunctions L3: Katz's two-variable measure, tame branches, functional equation.
- AutomorphicPadicLFunctions L3h: Hida μ = 0.
- ModularIwasawaMainConjectures L0: Kato's j_* formulation. **L0's text says "extension-by-zero"; that should be fixed in its owner.**

Eleven Tau Ceti layers are cited as they stand.

## Gaps (7)

1. The s = 0 Tamagawa input at p = 2 rests on Itakura's preprint. For p ≠ 2 it rests on Huber–Kings, which I did not read. No roadmap owns the integral class-number-formula determinant.
2. KK3 Theorem 4.3.1 in height one is not yet a node of PadicHodgeRegulators D.2.
3. The weight-k CM induction is not yet planned in CM.4.
4. Ribet's LNM 601 (self-twist ⇒ CM) was not read.
5. Rohrlich 1988's proof is not decomposed, and the infinite-order Hecke edge nonvanishing is missing.
6. The two-variable Coleman map and Katz identification come from Yager and de Shalit. Neither is free, and neither was read.
7. The split-prime Katz form when p | h_K: Rubin's hypothesis p ∤ [K₀:K] fails there.

## Restructure proposals (for the maintainer)

1. **KatoEulerSystems.**
   - The CM branch of L4/rational-iwasawa-module-structure should import CZ.5/cm-h2-torsion.
   - The CM divisibility belongs here: CZ.5/cm-length-inequality, or CZ.6/cm-kato-divisibility. L4/cohomological-divisibility-one-direction should be restricted to non-CM forms, to keep the stage graph acyclic, because CZ.6 imports L2/rational-kato-zeta-morphism.
   - L4/analytic-twist-nonvanishing may import CZ.5/cm-twist-nonvanishing.
2. **AnticyclotomicLocalUnits ALU.4 and ColemanPowerSeriesPartII AU.4.** Re-point their "early CM zeta classes plus 15.9" gaps to CZ.0/standard-elliptic-unit, CZ.0/elliptic-unit-module and CZ.1/cm-elliptic-reciprocity. These two Part II roadmaps also look like duplicates of each other.
3. **cm-galois-induction.** Kato 15.10 goes to CM.4. Lemma 15.11 stays here, split in two: CZ.5/cm-induction-normalization holds the Galois normalization (15.11.2), and CZ.6/cm-period-normalization holds the archimedean normalization (15.11.3), which needs Kato 6.6 from KatoEulerSystems L3. The split keeps CM.4 → CZ.1 → CZ.5 acyclic. It also keeps KatoEulerSystems L3 out of CZ.5, so KatoEulerSystems L4 can import CZ.5/cm-h2-torsion without a stage cycle. The CM case of Kato 12.4 uses Prop. 15.9 through (15.12.1) in S(ψ)-terms, not (15.12.2).
4. **HE.7s, HE.8b and BSD.7a.** Replace their "imaginary-quadratic elliptic-unit IMC owner" gaps with CZ.2/classical-two-variable-main-conjecture, CZ.3/katz-form-main-conjecture, CZ.3/anticyclotomic-theta-main-conjecture and CZ.3/katz-functional-equation-lambda. Hida–Tilouine stays with AC L0c, and Hida μ with L3h.
5. **CMRankZeroConverse.** Replace C.3/cm-newform-converse's gap with CZ.6/cm-kato-main-conjecture plus CZ.5/cm-h2-torsion; the dictionary is CZ.6/cm-kato-normalization-dictionary.
6. **InertAnticyclotomicCMMainConjecture (#1690).** Import CZ.0–CZ.2 (see the correction above). The BT review suggested a merge; this design keeps the two separate.

## Sources

Read (URL, SHA-256 and access date are in the packet):

- Burungale–Tian, arXiv 2506.03465v2, in full.
- Kato, Astérisque 295 on Numdam: §15 in full, 13.4–13.8, Lemma 14.15 and 3.8; page images checked for pp. 253–255 and 265.
- Johnson-Leung–Kings, arXiv 0804.2828v2, in full.
- Rubin 1991, Invent. Math. 103 (GDZ scan): pp. 25–27, 36–38 and 58–59.
- Rohrlich 1988, Math. Ann. 281 (GDZ): pp. 611–612.
- Agboola–Howard II, arXiv math/0401124v2: §3.
- Castella–Grossi–Lee–Skinner, arXiv 2008.02571v2: §§1.2 and 2.2.

Not read (all non-free, or not available): Yager 1982; de Shalit 1987; Ribet LNM 601; Huber–Kings 2003; Itakura's preprint; Kato–Kurihara–Tsuji / KK3.

## Where the next worker resumes

The packet is complete and goes to its independent review, REV-DESIGN-CMAllPrimeMainConjectures. Each `remaining` list names refinements for a lemma-level pass. The gaps close when:

- PadicHodgeRegulators D.2 states KK3 in height one;
- CM.4 states the weight-k induction;
- an owner decomposes the s = 0 Tamagawa input (including p = 2);
- the Yager/de Shalit identification is read from an obtainable copy.
