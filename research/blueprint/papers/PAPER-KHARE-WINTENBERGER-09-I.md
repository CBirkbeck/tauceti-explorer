# Khare–Wintenberger, *Serre's modularity conjecture (I)*: extraction and routing

Job PAPER-KHARE-WINTENBERGER-09-I. Claude Code, session `cc-48533a`, 29 September 2026. The machine-readable extraction is `PAPER-KHARE-WINTENBERGER-09-I.result.json`: 71 items, 4 routes, 8 prerequisite papers, 4 source issues.

**Version read.** The authors' copy `results.pdf` from Khare's UCLA page (23 pages, PDF dated 31 May 2009, SHA-256 `3c389dc3…bad82`), read in full. It is the same file the atlas's Serre-modularity packets cite, by hash.

It is taken to be the accepted version of Invent. Math. 178 (2009), 485–504 (published online 4 July 2009), for two reasons: it predates publication by five weeks, and it contains the post-refereeing remark on Lemma 8.2. The Springer text could not be opened and was not compared. Locators are the copy's own page numbers.

## What the paper proves

**Theorem 1.2** proves Serre's conjecture, in its strong form (weight k(ρ̄), level N(ρ̄)), in two cases:

1. odd characteristic with odd level;
2. characteristic 2 with weight 2. This includes the case ρ̄|_{D₂} scalar with non-dihedral image, which the earlier qualitative-implies-refined results of Buzzard and Wiese left open.

**Theorem 9.1** shows that the rest of the conjecture follows from Hypothesis (H). Hypothesis (H) is modularity of odd, potentially Barsotti–Tate, 2-adic lifts with non-solvable modular residual image, and Kisin has since proved it.

The proof is a double induction on two parameters: the number of primes dividing the level, and the residual characteristic.

- **Locally good-dihedral representations (Definition 2.1).** The representations considered are ramified at an auxiliary prime q in a way that keeps every residual representation met later irreducible, with non-solvable image (Lemma 6.3).
- **Reduction to weight 2 (Theorem 3.2).** The step from (W_r) to (L_r) changes characteristic through Theorem 5.1's lifts, using the prime estimates of §7.
- **Killing ramification in weight 2 (Theorem 3.1).** The step from (L_r) to (W_{r+1}).
- **The start of the induction (Theorem 3.3).** (W₁) follows from Khare's level-one theorem through Corollary 8.1.
- **Raising the level (Theorem 3.4).** Chebotarev (Lemma 8.2) produces a good dihedral prime for an arbitrary ρ̄.

Two results are stated here and proved in Part II:

- **Theorem 4.1:** modularity lifting, 2-adic and odd-prime.
- **Theorem 5.1:** almost strictly compatible systems through prescribed lifts of four types.

§10 draws the consequences:

- **Theorem 10.1.** Irreducible odd two-dimensional compatible systems of G_ℚ come from newforms: regular systems from weight ≥ 2, irregular ones from weight 1.
- **Corollary 10.2.** Abelian varieties of GL₂-type over ℚ are modular, and odd two-dimensional complex representations of G_ℚ come from weight-one newforms. The second statement gives Langlands' conjecture, and hence Artin's conjecture, for them; the new case is projective image A₅.

## What the atlas already has

The atlas was built for this proof, and almost everything in §§1–9 already has a reviewed node or a packet node.

- **ClassicalSerreModularity** (reviewed decomposition, and packets `--R26.1` and `--R27.3`):
  - Theorem 1.1 and Corollary 8.1(i): R26.1.
  - Corollary 8.1(ii): R26.6.
  - Definition 2.1, Lemmas 6.1–6.3, Dickson and Lemma 8.2: R27.1.
  - (L_r), (W_r), (D_r), Theorem 3.2 and the §7 estimates: R27.2. RS-06 moved the estimates here from R26.3.
  - Theorems 3.1 and 3.3 and the double induction: R27.3.
  - Theorem 3.4 and Theorem 1.2: R27.4.
  - (H), Theorem 9.1 and the dyadic weight claim: R27.5.
  - The full theorem, and Theorem 10.1 as an application: R27.6.
- **PotentialModularityAndCompatibleSystems** (packet `--R24.3`):
  - the four lift types of Theorem 5.1 and the minimal-lift definition: R24.3;
  - Theorem 4.1: R24.4;
  - the compatible-system definitions (strict, almost strict, plain) and Theorem 5.1 as a statement about systems, with Savitt's weights: R24.5;
  - linked systems and modularity transfer: R24.6.
- **GL2ModularityLifting** (packet `--R22.1`):
  - the odd-prime lifting theorems: R22.5;
  - the dyadic theorem, Kisin's Barsotti–Tate theorem and (H): R22.6.
- **Other suppliers:**
  - S-type, "arises from" and N, k: AlgebraicModularFormsAndSerreWeights R15.4 and R15.6, and ArithmeticGaloisRepresentations R01.3 and R01.4;
  - fundamental characters and Weil–Deligne representations: R01.2 and PadicHodgeTheory R06.3;
  - Gross and Coleman–Voloch: SerreWeightAndLevelOptimisation R20.3;
  - Breuil–Kisin: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4;
  - Faltings: R28.4;
  - A_f ⊂ J₁(N): ModularCurvesPartII R14.5;
  - GL₂-type abelian varieties: SmallRamificationAndAbelianVarietyBaseCases R25.5;
  - Artin L-functions: AnalyticNumberTheory AN.4;
  - Langlands–Tunnell: GL2AutomorphicRepresentationsAndTransfer R17.5;
  - Godement–Jacquet: AutomorphicLFunctionsAndLocalFactors AL.2.
- **Chebotarev density.** Tau Ceti's Chebotarev roadmap plans it (Layer 10). The pinned Tau Ceti f790474 has Frobenius prime sets but not the density theorem.
- **In the libraries:**
  - the cyclotomic characters: Mathlib `cyclotomicCharacter` and `modularCyclotomicCharacter`;
  - the largest-prime-factor function Q(n): `Nat.primeFactors`.

  Both were read at Mathlib 082e2d3. Bertrand's postulate is in Mathlib, but it is weaker than the §7 estimate the proof needs.

## Routes

**1. Source of ClassicalSerreModularity R26.1, R26.6 and R27.1–R27.6** (29 planned items). The paper is already the source these layers were written for, and the route confirms that. It also records, for these layers, the source issues below and one fact: Theorem 10.1 is only an application node at R27.6, and its weight-one half needs an item this extraction routes to ML.1.

**2. Source of PotentialModularityAndCompatibleSystems R24.3–R24.6** (14 planned items and 1 missing). The missing item is the remark after Theorem 5.1: if q ∥ N(ρ̄) and p ∤ q − 1, every geometric lift with q ∥ N(ρ) is minimal at q.

The paper calls this "not difficult to see". It holds because a character of (ℤ/qℤ)^× of p-power order is trivial when p ∤ q − 1, so the lift of the tame character is forced to be the Teichmüller one. It is a statement about minimal lifts, so it belongs with the minimal-lift definition at R24.3. No node there states it.

**3. Source of ModularityAndLanglandsExtensions ML.1** (3 missing items). ML.1's text is to "organize Deligne-Serre Artin representations, weight-one modularity in proved cases", kept apart from the weight ≥ 2 GL₂/ℚ endpoints. KW I's weight-one consequences are exactly this:

- Corollary 10.2(ii);
- the statement of Langlands' conjecture that it proves for odd two-dimensional ρ;
- Khare's weight-one descent (IMRN 1997), the step of Theorem 10.1(ii) after Serre's conjecture. If infinitely many residual members of a Hodge–Tate (0, 0) system come from mod ℓ weight-one forms at a fixed level, the system comes from a classical weight-one form.

The inputs are all planned elsewhere, and ML.1 imports them:

- Theorem 10.1 from R27.6;
- the mod ℓ weight-one criterion from R20.3;
- the Deligne–Serre lifting lemma from R15.5;
- Deligne–Serre representations from R19.1;
- Langlands–Tunnell from R17.5;
- Artin L-functions from AN.4.

A new layer is not needed.

**4. Part II of EllipticCurveModularity: abelian varieties of GL₂-type** (3 missing items). The items are:

- Corollary 10.2(i): abelian varieties of GL₂-type over ℚ are modular (the generalised Shimura–Taniyama–Weil conjecture);
- Ribet's Theorem 4.4, which KW I cite for it;
- the definition of a modular abelian variety.

No layer owns them, for three reasons.

- EllipticCurveModularity proves the dimension-one case (R29.2–R29.6), and RS-06 keeps it to "an arbitrary E/ℚ".
- ML.1 explicitly excludes weight ≥ 2 GL₂/ℚ endpoints.
- ClassicalSerreModularity R27.6 keeps the residual theorem and leaves abelian-variety applications to R29.

Section 15 therefore makes this a Part II of EllipticCurveModularity. The Part II generalises R29 step by step and cites it rather than rebuilding it.

The brief asks for four things:

- the definition and equivalent forms of "modular";
- the strictly compatible, odd, irreducible, weight-(1, 0) system V_λ(A) of an abelian variety of GL₂-type (Ribet §§2–4);
- the application of Theorem 10.1(i) and Faltings;
- Carayol's conductor formula cond(A) = N_f^{dim A}, which gives the optimal level.

KW I's "N = M^n", with M the conductor of A, is correct but not optimal: the optimal level is M^{1/n}.

## Source issues

| Id | Kind | Where | What |
|---|---|---|---|
| E1 | misprint | §9, proof of Theorem 9.1, p. 19 | "lift (ρ′_λ) of ρ̄" should be "of ρ̄₃". Theorem 5.1(4) is applied at q = 2 to the mod-3 member. |
| E2 | misprint | §9, the claim k(ρ̄′₂) = 2, p. 19 | "by Theorem 5.1(2)" should be "by Theorem 5.1(4) and almost strict compatibility at 2". Item (2) prescribes the type at p = 3, not at 2. |
| E3 | gap (the proof) | §3.2 and the remark after Theorem 3.4, p. 6 | Theorem 3.4 gives only modularity. The passage to weight k(ρ̄) and level N(ρ̄) in Theorem 1.2 (Lemma 6.2(i), or Theorem 5.1(1) with Theorem 4.1) is not written out. |
| E4 | misprint | §8.2, inductive step, p. 14 (with §7, p. 12) | r is both the number of primes in (W_r) and the exponent in ℓ^r ∥ P − 1. |

E1–E3 are already recorded and confirmed in the atlas as ClassicalSerreModularity/E3 and /E9, and they are cross-referenced there. E4 is new: the reviewed node R27.2/theorem-3-2-weight-reduction reproduces the clash without flagging it. Crossref registers no erratum for the article (checked 29 September 2026), and a web search found none.

The paper also corrects two things in the literature it cites. First, the reference in Khare's level-one paper for the proof of Corollary 1.2. Second, it adds Skinner's correction to Skinner–Wiles (§8.3). Both are mistakes in those sources, not in KW I, and both are already noted at ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof.

## Checked in detail

- **The §7 consequences (3) and (4).** Both follow from (1) and (2) by clearing denominators. The Rosser–Schoenfeld threshold 3/2 − 1/30 is below both right-hand sides for p > 31.
- **Diamond's list of pairs (i, j) after Theorem 5.1.** It satisfies i + qj = m(q² − 1)/p^r. The condition j < i is equivalent to m < p^r/2, and i = j + 1 never occurs, because q is odd.
- **The p = 2 conditions in Theorem 5.1(4).** Here the admissible χ′ have order 2^a with 2 ≤ a ≤ v₂(q + 1). The generator of the whole 2-part is excluded by the parity condition i + j even.
- **The compatibility of the four Chebotarev conditions in Lemma 8.2.** Frob_q fixes √−1, √2, √ℓ* and √p (since p ≡ 1 mod 4), hence every quadratic subfield of the cyclotomic field. Also, ρ̄^proj(c) lies in PSL₂(𝔽_p).
- **Lemma 6.3(ii)'s reduction argument.** Reduction mod r is injective on D_{2t^a} for t odd and t ≠ r, including r = 2: its kernel would be a normal r-subgroup, and there is none.
- **The mod 3 and mod 5 steps of Theorem 3.2.** The chosen characters satisfy the hypotheses of Theorem 5.1(3) and (4), and they give the weights 2 and 4 stated.

## Prerequisite papers not yet covered by the atlas

1. Ribet, *Abelian varieties over Q and modular forms* (1992; reprinted 2004, doi:10.1007/978-3-0348-7919-4_15). The main source of route 4.
2. Khare, *Remarks on mod p forms of weight one*, IMRN 1997 and its 1999 corrigendum. Route 3.
3. Gross, *A tameness criterion…*, Duke Math. J. 61 (1990).
4. Coleman–Voloch, *Companion forms and Kodaira–Spencer theory*, Invent. Math. 110 (1992).
5. Skinner, *Nearly ordinary deformations of residually dihedral representations*. Cited as "to appear"; no published article with that title was found.
6. Diamond, *An extension of Wiles' results* (1997). Its Theorem 4.1 is used in §8.4, and its §3 defines minimal lifts.
7. Rosser–Schoenfeld, *Approximate formulas for some functions of prime numbers* (1962). The §7 estimate.
8. Wiese, *Dihedral Galois representations and Katz modular forms*, Doc. Math. 9 (2004). Lemma 6.2(i) at p = 2.

Each link was checked against Crossref or the DOI resolver. None of Ribet, Khare's weight-one note, Gross, Coleman–Voloch or Skinner's correction was read for this job; their statements here are the ones KW I cite.

## Not claimed

- The strong form at p = 2 in Edixhoven's sense. This asks that ρ̄ be unramified at 2 if and only if it comes from a Katz form of weight 1. The paper says (pp. 2–3) that it does not know this, and the extraction does not list it as a result.
- Nothing is claimed for base fields other than ℚ, or for representations of dimension greater than two.
