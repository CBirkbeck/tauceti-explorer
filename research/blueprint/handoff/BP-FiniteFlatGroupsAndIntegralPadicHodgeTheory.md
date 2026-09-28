# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (fifth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #731.

- Checkpoints 1–4 merged in #3824, #3827, #3830 and #3832.
- R07.1 is closed. R07.2 (Dieudonné theory over perfect fields) and R07.3 (Fontaine–Laffaille theory at e = 1) are partial.
- This checkpoint plans **R07.4, Breuil–Kisin modules**, which stays partial.
- R07.5–R07.6 are not yet read.

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, status `partial`:
  - 77 nodes, 19 of them new in R07.4;
  - 6 R07.4 planets (23 in all);
  - 33 baseline declarations (4 new Mathlib entries), 13 requests (4 new) and 11 source issues (9 new);
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned index, with the other packets taken from origin/main, and the intake file checks report 0 problems.
- **Roadmap document**, regenerated with an R07.4 section and the Breuil–Kisin conventions.
- **Suggested Lean file**, extended with a `TauCeti.BreuilKisin` section:
  - `Sfrak p k = W(k)⟦u⟧` with `frob` built from `PowerSeries.expand` and `WittVector.frobenius`;
  - `KisinModule` over an Eisenstein polynomial, `HeightLE`, morphisms, the functor `V_𝔖` and its full faithfulness;
  - Kisin's classification of p-divisible groups and Fontaine's conjecture, with the period rings as placeholders.

## Sources

All four Kisin papers were read in the author's DVI files from his Harvard page. Locators use DVI page numbers; the published pagination was not seen.

- Kisin 2006, *Crystalline representations and F-crystals*.
- Kisin 2008, *Potentially semi-stable deformation rings*, including its "Errata for [Ki 2]".
- Kisin 2009, *Moduli of finite flat group schemes, and modularity*.
- Kisin 2009b, *Modularity of 2-adic Barsotti–Tate representations*.
- Kim, arXiv:1007.1904v3, for p = 2.

The text was extracted from the DVI files. The msam glyph in Theorem (0.1) was decoded as ⩽ from the font tables, and hat accents are lost in the extraction.

## R07.4 (partial): Breuil–Kisin modules

**Coefficient rings and Kisin modules**
- `bk-coefficient-rings`: 𝔖, 𝒪_ℰ, ℰ^ur, 𝔖^ur, 𝒪, λ, N_∇ and S. Kisin's erratum (E.3) places ℰ in W(Fr R)[1/p].
- `kisin-modules`: Mod^φ_{/𝔖}, E-height ≤ h, BT^φ_{/𝔖}, the torsion categories and étale/multiplicative objects.
- `kummer-etale-phi-modules`: Fontaine's equivalence for G_{K∞}, V_𝔖, torsion and coefficients.

**Kisin's classification of semistable representations**
- `phi-n-nabla-modules`: 1.2.2, 1.2.8 and 1.2.15. The cokernel formula ⊕(𝒪/E(u)ⁱ)^{hᵢ} is what bounds E-height by the top weight.
- `weakly-admissible-slope-zero`: Theorem 1.3.8 and Lemma 1.3.13, via Kedlaya (requested from RD.1).
- `kisin-crystalline-embedding` (planet): Corollary 1.3.15 and Theorem 0.1.
- `kisin-etale-full-faithfulness`: 2.1.9, 2.1.10 and 2.1.12, with the repaired proof of Errata (E.4).
- `finite-height-lattices`: uniqueness, Lemma 2.1.15, and stability of height ≤ h over all lattices. The last is derived here; Kisin 2008 asserts it, citing 2.1.15.
- `semistable-finite-height`: Proposition 2.1.5, weakly admissible ⇒ admissible, and semistable with weights in [0, h] ⇒ E-height ≤ h (Kisin 2008, Theorem 2.5.5).
- `crystalline-restriction-full-faithfulness` (planet): Breuil's conjecture, 2.1.14.

**p-divisible groups**
- `bt-type-equivalence`: 2.2.2.
- `breuil-s-modules`: A.5, A.6 and 2.2.3. The Dieudonné crystal and Grothendieck–Messing come from R07.2, where they are still to be planned.
- `tate-module-acris`: Lemma 2.2.4 and (2.2.8). This rests on Faltings's Theorem 7, which is cited but was not read here.
- `crystalline-01-is-bt` (planet): Fontaine's conjecture for every p (2.2.6).
- `kisin-p-divisible-classification` (planet): 2.2.7 for p > 2, and up to isogeny for p = 2. It also covers Kisin 2009's (2.2.22). The lattice form, for every p, is in `crystalline-01-is-bt`.

**Finite flat group schemes and p = 2**
- `finite-flat-classification`: 2.3.1–2.3.6 for p > 2, with Kisin 2009 (1.1.13) for Galois compatibility and (E.5).
- `multiplicative-etale-dictionary`: Kisin 2009, 1.1.15 and 1.2.11.
- `finite-flat-restriction-full-faithfulness`: Kim's Corollary 4.4 for every p. Kim credits the deduction to Breuil; the formal argument is written out here.
- `dyadic-classification` (planet): Kim's Theorem 4.1, Proposition 4.2 and Corollary 4.3, with Kisin 2009b's Theorem 0.8 for the connected case.

## Requests

**Answered.** These consumers' requests to R07.4 are answered:
- LocalGaloisDeformationRings: L7/finite-height-lattices, R08.3/semistable-height-quotient, and R08.4/finite-flat-model-moduli, flat-generic-fibre and ordinary-type-of-components;
- GL2ModularityLifting R22.6/hypothesis-h;
- PadicHodgeTheory: R06.4/barsotti-tate-crystalline-criterion (a), and R06.2's two mentions.

**Still open:**
- Savitt's descent-data request (LocalGaloisDeformationRings R08.4/savitt-weight-two-rings);
- PadicHodgeTheory R06.4 (b), weights {0, p − 1} and {0, p};
- the P7 Wach comparison.

**New requests:**
- PhiGamma PG.0: the field of norms of the Kummer tower.
- PhiGamma PG.1: Fontaine's equivalence without Γ.
- RD.1: Kedlaya's slope theory.
- R06.1: B⁺_st presented with log[π̃].

## Source issues

**New:**
- **E3.** Kisin 2006's introduction switches Hodge–Tate conventions between Theorem (0.1) and Theorem (0.3). Read in the convention of the preceding paragraph, Theorem (0.3) would be false. Affects nothing, since the body is consistent.
- **E4.** Kisin 2006 §2.3 cites (2.2.5) where (2.2.7) is meant.
- **E5.** Kisin 2006 (1.3.3) cites "(4)" where (1.3.2)(2) is meant.
- **E6.** Kisin 2006, Theorem (2.3.5) and Corollary (2.3.6), omit "p > 2", which the proof needs. The introduction's Theorem (0.5) has the hypothesis. The p = 2 statement was proved afterwards, by Kim, Lau and Liu.
- **E7.** In the proof of Kisin 2009's (2.2.22), (Mod FI/S)_{𝔽_p} is written where (Mod FI/𝔖)_{𝔽_p} is meant.

**Known**, from Kisin's own errata: E8 = (E.1), E9 = (E.3), E10 = (E.4), E11 = (E.5).

All nine are also in the maintainer's local list of published errata.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## What a continuation could do

1. **R07.4, descent data:**
   - Savitt's and Breuil–Mézard's strongly divisible modules with tame descent data;
   - Kisin modules with descent data for potentially Barsotti–Tate representations.
2. **R07.4, coefficients:** Kisin 2009 §§1.2–2 with coefficients (finite flat models and their generic fibres).
3. **R07.4, weights beyond {0, 1}:** weights {0, p − 1} and {0, p}, and the reductions of Khare–Wintenberger I, Theorem 4.1.
4. **R07.4, Wach modules:** the comparison with Breuil–Kisin modules for K = K₀.
5. **R07.2:** crystals and Grothendieck–Messing, which `breuil-s-modules` needs.
6. **R07.3:** FL §9.
7. **R07.5 and R07.6.**
