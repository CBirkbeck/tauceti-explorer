# PAPER-JANNSEN-16: Hasse principles for higher-dimensional fields

Uwe Jannsen, *Hasse principles for higher-dimensional fields*, [Annals of Mathematics 183 (2016), 1–71](https://doi.org/10.4007/annals.2016.183.1.1); arXiv [0910.2803](https://arxiv.org/abs/0910.2803).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1172). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-JANNSEN-16.result.json](PAPER-JANNSEN-16.result.json). It has:
- 61 items: 9 planned, 52 missing;
- 9 routes: 6 source routes and 3 Part II candidates, two of them reused;
- 14 prerequisite entries;
- 9 recorded source issues.

## Sources read, and how they differ

- **arXiv v2** (4 December 2014, 70 pages), read in full from its TeX source.
- **The published Annals version** (71 pages; received October 2009, revised April 2015). The PDF is on the Annals website. A word-level diff against v2 located every change, and the changed parts were read in full: the introduction, the case labels of §3, the statements in §4, and all of §5.

The versions differ in substance, so **this extraction follows the published version**:
- **§0 is renumbered.**

  | arXiv v2 | Published |
  |---|---|
  | Theorem 0.1 | Theorem 0.4 |
  | Theorem 0.2 | Theorem 0.6 |
  | Corollaries 0.3, 0.4 | Corollaries 0.7, 0.8 |
  | Theorems 0.5, 0.6, 0.7 | Theorems 0.9, 0.10, 0.11 |

- **The claims are narrower.** v2 proved Kato's Conjectures 2 and 3 (Theorems 0.9–0.11) for n invertible *without* resolution of singularities, via Gabber's alterations (v2 §6, with the hypercovering appendix §7). The published version drops §§6–7. It proves those theorems only over number fields, or under resolution of singularities, and credits Kerz–Saito (Publ. IHÉS 2012) with the unconditional prime-to-p cases. The injectivity results (Theorems 0.4, 0.6 and 2.10) still use Gabber's alterations and are unconditional for n invertible.
- **§5 is rewritten.**
  - It adds Lemma 5.20: Chow correspondences act on Kato homology, via Bloch–Ogus and Barbieri-Viale's 𝓗-cohomology.
  - It adds Proposition 5.16 and Lemma 5.17: the naive homology theory of a complex agrees with its Gillet–Soulé extension.
  - v2 had applied Gillet–Soulé's construction to Kato complexes without checking the Chow-motive hypothesis. The published version supplies it.

Statement numbers and page locators below are the published ones.

## What the paper proves

Kato generalized the Brauer–Hasse–Noether sequence 0 → Br K → ⊕_v Br K_v → Q/Z → 0 to function fields and varieties.

**Main results.**
- **Theorem 0.4 (Kato's Conjecture 1).** For a primary function field F in d variables over a global field K, and n invertible in K, the map H^{d+2}(F, Z/n(d+1)) → ⊕_v H^{d+2}(F_v, Z/n(d+1)) is injective.
  - It is deduced from Theorem 0.6 (Q_ℓ/Z_ℓ coefficients) and the Bloch–Kato conjecture.
  - Corollary 0.8 is its mod-2 case. Corollary 0.7, with Colliot-Thélène, bounds the Pythagoras number of a finitely generated field of characteristic 0 by 2^{d+1}.
- **Theorem 0.9 (Kato's Conjecture 2).** For X connected, smooth and proper over K, the complex C^{2,1}(X) satisfies the Hasse principle: H_a(C^{2,1}(X)) ≅ ⊕_v H_a(C^{2,1}(X_v)) for a > 0, with an exact sequence ending in Z/n for a = 0. This holds over number fields, or with resolution of singularities.
- **Theorem 0.10 (Kato's Conjecture 3, over finite fields).** H_a(C^{1,0}(X)) = Z/n for a = 0 and 0 otherwise, assuming resolution of singularities.
- **Theorem 0.11.** The common generalization, for coinvariant complexes C^{0,0}(X̄)_{G_K} over finitely generated K.

**Method.**
- **§1.** Hochschild–Serre reduces the problem to H²(K, H^d(FK̄)) → ⊕_v H²(K_(v), −), using Henselizations (Proposition 1.2 and Lemma 1.3). Weights then give a Hasse principle for Galois modules of weight ≠ −2 (Theorem 1.5).
- **§2.**
  - The weight spectral sequence of a normal-crossings compactification, after removing a Bertini hyperplane, splits H^d(Ū⁰) into a part of weights < 2d and a torus-type part (Proposition 2.2).
  - The Hasse principle for tori (Theorem 2.5) finishes the proof of Theorem 2.4.
  - Gabber's prime-to-ℓ alterations handle positive characteristic (Theorems 2.10–2.11).
  - A rigidity argument passes from Henselizations to completions (Theorems 2.12–2.13).
- **§3.**
  - The key exact sequence (Theorem 3.1): 0 → H^d(Ū, Q_ℓ/Z_ℓ(d))_{G_K} → H⁰(Y̅^{[d]})_{G_K} → H²(Y̅^{[d−1]})_{G_K}, for every prime ℓ.
  - It gives the injectivity of the coinvariant Bloch–Ogus residue (Theorem 3.17) and a Hasse principle for unramified cohomology (Theorem 3.8).
- **§§4–5.**
  - Kato complexes are homology theories (Lemma 4.23). Such a theory is determined by its values on function fields (Lemma 4.24).
  - Weight homology, built by Gillet–Soulé's extension of functors on Chow motives to all varieties (Theorems 5.9 and 5.13), vanishes on function fields below the top degree (Theorem 5.10).
  - Coinvariant Kato homology equals weight homology (Theorem 5.12), which proves Theorem 4.19.

## What the atlas already has

**Planned (9 items).**
- Poitou–Tate duality (ArithmeticGaloisDuality R02.4) and Hochschild–Serre (R02.2).
- Deligne weights (DeligneWeightsAndPurity DWP.0 with WeightsInEtaleCohomology R34.1), and purity of H^i(X̄, Q_ℓ) (DWP.10 and R34.5).
- Gysin maps (EtaleDualityAndPerverseSheaves EDC.3) and weak Lefschetz (EDC.4).
- The norm-residue theorem (MotivicEtaleKTheory M.5).
- Resolution of singularities in characteristic 0 (AlgebraicModuliForArithmeticGeometry R09.7).
- Chow motives (MotivesAndAlgebraicCycles MC.1).

**HL.6 already plans this paper's subject.** HigherLocalFieldsAndHigherClassFieldTheory HL.6 plans "Kato complexes and boundary-square-zero before … sourced cohomological Hasse principles". RS-28 kept that scope, and PAPER-DITTMANN-POP-23 already routes Jannsen's injectivity theorem, the arithmetic Kato complex and Kerz–Saito's divisorial detection to HL.6.

**Existing candidates for the other inputs.**
- The Bloch–Ogus/Cousin package is routed to SF.2 by PAPER-BENOIST-WITTENBERG-20.
- Gabber's prime-to-degree alterations are a candidate Part II from PAPER-DITTMANN-POP-23.
- Real function fields and sums of squares are a candidate Part II from PAPER-BENOIST-19.

**Not in the atlas.** Nothing plans Gillet–Soulé weight complexes, hyperenvelope descent or weight homology. MC.0–MC.4 stop at correspondences, pure motives, realizations and Voevodsky-type mixed motives.

**Libraries.** None of this is in Mathlib or Tau Ceti: no étale cohomology of schemes, Galois cohomology of fields beyond low-degree group cohomology, Milnor K-theory or Chow motives.

## Routes

1. **Source → HigherLocalFieldsAndHigherClassFieldTheory:HL.6** (33 items). This is the paper's home.
   - Kato's complexes C^{r,s} and Conjectures 1–3.
   - Theorems 0.4, 0.6, 0.9–0.11, 2.4, 2.10, 3.1, 3.8, 3.17, 4.8, 4.19 and 5.12.
   - Propositions 1.2, 2.2, 4.10 and 5.7.
   - Lemmas 1.3, 3.15, 4.14, 4.15, 4.20, 4.23, 5.20 and 5.25.
   - Remark 4.6, and the cited rigidity Theorem 4.11.
2. **Source → HL.2** (1 item). The coefficient convention H^i(L, Z/n(j)) with its W_rΩ_log summand, where Dittmann–Pop already routed it.
   - PAPER-BRIGHT-NEWTON-23 routed the same convention into its proposed LocalFieldsPartIIKatoSwanConductors. The two should be reconciled with HL.2 as the owner.
3. **Source → ArithmeticGaloisDuality:R02.4** (2 items). Both are global Galois-cohomology consequences of Poitou–Tate:
   - Theorem 1.5, the Hasse principle for modules mixed of weights ≠ −2 / ≠ 0;
   - Theorem 2.5 with Lemma 2.6, the Hasse principle for tori.
4. **Source → SchemeAndStackFoundations:SF.2** (3 items). These join Benoist–Wittenberg's coniveau/Cousin suffix:
   - unramified cohomology (Definition 3.5, Lemma 3.6, Proposition 3.7);
   - Bloch–Ogus–Gabber universal exactness;
   - the injectivity Theorems 2.12–2.13 (limits of étale cohomology and Greenberg's strong density).
5. **Source → DeligneWeightsAndPurity:DWP.10** (1 item). The weight spectral sequence (2.1) of a normal-crossings compactification, with its degeneration at E_3.
6. **Source → CrystallineCohomology:CR.4** (2 items). The p-part inputs, which are statements about logarithmic Hodge–Witt cohomology of smooth varieties:
   - Gros–Suwa Gysin maps and purity, and Suwa's weak Lefschetz;
   - p-adic weights (Remark 1.7(g)), importing Katz–Messing from RD.7.
7. **Part II → PrimeToDegreeAlterations** (1 item). Reuses Dittmann–Pop's candidate for Gabber's Theorem 2.11 at a general prime ℓ, with the corestriction argument.
8. **Part II → QuadraticFormsRealFunctionFields** (1 item). Reuses Benoist's candidate for the Pythagoras bound (Corollary 0.7).
9. **Part II → MotivesPartIIWeightHomology**, "Algebraic cycles, pure and mixed motives, Part II: weight complexes and weight homology" (8 items; parent MotivesAndAlgebraicCycles, area `motives`).
   - **Contents:**
     - the homology-theory formalism with Lemma 4.24;
     - weight homology of normal-crossings pairs (Definitions 5.1–5.3, Proposition 5.4, Corollaries 5.5–5.6);
     - Theorems 5.9, 5.10 and 5.13;
     - Proposition 5.16 and Lemma 5.17;
     - Gillet–Soulé's hyperenvelope theorem.
   - **Why a separate roadmap:** these are general motivic tools, also used by Kerz–Saito, so they get their own owner and HL.6 imports them.

## Source issues (`sourceIssues` E1–E9)

All nine are in the published version; E1–E6 and E8 are also in v2. No erratum was found: the Annals page lists none and Crossref has no update relation.

- **E1 (misprint, §2, pp. 17–18).**
  - **Printed:** the weight spectral sequence's differentials vanish "for r > 3", giving E_∞ = E_3.
  - **Correction:** r ≥ 3.
  - **Why:** the weights p + 2q and p + 2q − r + 2 differ exactly when r ≠ 2.
  - In the next paragraph, "d_1" is a slip for d_r.
- **E2 (misprint, proof of Theorem 1.5, p. 16).**
  - **Printed:** "cokernel of α_A … A(−1)_{G_k}".
  - **Correction:** β_A, G_K.
- **E3 (misprint, proof of Theorem 2.10, p. 24).**
  - **Printed:** "as in (G)".
  - **Correction:** as in Theorem 2.11.
- **E4 (misprint, Theorem 3.17 and Case 3.17.A, p. 35).**
  - **Printed:** "RS1(U) (see the beginning of Section 2)".
  - **Correction:** RS2(U), the good-compactification condition defined there, which the proof uses. (RS1) is only defined later, in Definition 4.18, and says something else.
- **E5 (misprint, Case 3.8.B, pp. 38–39).**
  - **Printed:** the displays use H^{d+1}_nr(−, Q_ℓ/Z_ℓ(d)).
  - **Correction:** H^{d+2}_nr(−, Q_ℓ/Z_ℓ(d+1)), the groups of Theorem 3.8.
  - The printed groups are those of the finite-field Case 3.17.B.
- **E6 (gap, Theorem 3.1, p. 29).**
  - **Problem:** the induction applies the theorem to the divisors Y_r ∩ Y_i on Y_r. These are smooth but in general reducible: two curves on a surface meeting in two points already give two points. The theorem assumes irreducible components, and the base case uses "the unique point x ∈ Y".
  - **Fix:** state it for smooth, not necessarily irreducible, divisors. The base case extends because H_1(G, Q_ℓ/Z_ℓ) = 0. The intersections are non-empty for d ≥ 2 because X ∖ Y_1 is affine.
- **E7 (gap, proof of Theorem 5.12, p. 65).**
  - **Printed:** "(RS2) (which holds because K has characteristic zero)", and no finite-field Bertini step.
  - **Why it matters:** Theorem 5.12 is stated, and used for Theorem 0.10, over finite fields under resolution of singularities.
  - **Fix:** (RS2) holds by hypothesis. For finite K, pass to an extension of q-power degree (q ≠ ℓ) to find the hyperplane section, and descend by trace and restriction as in Theorem 5.10. arXiv v2 had one sentence to this effect; the published version dropped it.
- **E8 (misprint, Theorem 0.11, p. 7).**
  - **Problem:** "connected" is missing. For X = Spec K ⊔ Spec K, H_0 = (Z/n)².
  - Theorem 4.19 assumes X irreducible.
- **E9 (misprint, cross-references).**
  - **Wrong references:**
    - Lemma 4.24 "as in 4.20" should be 4.22.
    - Remark 4.25 "4.22(ii)" should be 4.24(ii).
    - Proposition 5.16 "via Theorem 5.12" should be 5.13.
    - The proof of Theorem 5.12 "by Lemma 5.17" should be Proposition 5.16.
  - **Dangling reference:** the history paragraph cites "Corollary 0.4", which does not exist in the published numbering. v2's "Theorem 0.4" did not exist there either.

The items use the corrected statements.

## Prerequisites not yet covered

1. Kato, *A Hasse principle for two dimensional global fields* (Crelle 366, 1986).
2. Jannsen–Saito–Sato, *Étale duality for constructible sheaves on arithmetic schemes* (Crelle 688, 2014).
3. Kerz–Saito, *Cohomological Hasse principle and motivic cohomology for arithmetic schemes* (Publ. IHÉS 115, 2012).
4. Gillet–Soulé, *Descent, motives and K-theory* (Crelle 478, 1996).
5. Jannsen, *Rigidity theorems for K- and H-cohomology and other functors* (arXiv:1503.08742).
6. Barbieri-Viale, *𝓗-cohomologies versus algebraic cycles* (Math. Nachr. 184, 1997).
7. Bloch–Ogus, *Gersten's conjecture and the homology of schemes* (ASENS 1974).
8. Colliot-Thélène–Hoobler–Kahn, *The Bloch–Ogus–Gabber theorem* (Fields Inst. Commun. 16, 1997).
9. Illusie–Laszlo–Orgogozo (eds.), *Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents* (Astérisque 363–364, 2014).
10. Jannsen, *On the Galois cohomology of l-adic representations attached to varieties over local or global fields* (1988).
11. Jannsen, *Principe de Hasse cohomologique* (1992).
12. Suwa, *A note on Gersten's conjecture for logarithmic Hodge–Witt sheaves* (K-Theory 9, 1995).
13. Gros–Suwa, *Application d'Abel–Jacobi p-adique et cycles algébriques* (Duke 57, 1988).
14. Greenberg, *Rational points in Henselian discrete valuation rings* (Publ. IHÉS 31, 1966).

DOIs were checked against Crossref. Jannsen 1988 has no DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-JANNSEN-16.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- Cited stages were checked against data/restructure: RS-28 narrows HL.2 and HL.6 but keeps both the Kato-complex and Hasse-principle scope and the logarithmic-coefficient interfaces used here.
- **Checked by hand:**
  - §1: Proposition 1.2, Lemma 1.3, and Theorem 1.5 with its weight bookkeeping.
  - §2: Proposition 2.2, Theorems 2.4, 2.5 and 2.10, and 2.12–2.13.
  - §3: the induction in Theorem 3.1 (whence E6), the cases of Theorems 3.8 and 3.17.
  - §4: Lemmas 4.14–4.15 and 4.20.
  - §5: the published argument for Theorem 5.12 (whence E7).
- No Lean was written or compiled; this is an extraction.
