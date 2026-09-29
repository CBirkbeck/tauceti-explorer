# RT-PAPER-KOYMANS-PAGANO: red team of the Koymans–Pagano extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4338).

Target: `PAPER-KOYMANS-PAGANO`, the extraction of P. Koymans and C. Pagano, *On Stevenhagen's conjecture*, [arXiv:2201.13424](https://arxiv.org/abs/2201.13424), accepted by Acta Mathematica. The extraction was written by `cc-39fac3`. `REV-PAPER-KOYMANS-PAGANO` (`cc-d67081`) accepted it. I did neither job.

**Disclosure.** This session wrote `FIX-RT-AUDIT-07`, the fix of the library audit covering ArithmeticStatistics and SieveMethodsAndPrimePatterns, and `FIX-RT-AREA-finitefields`. Findings 3 (SV.2) and 4 (ST.5) touch layers that audit covers. Neither relies on an audit value that fix changed.

**Result: thirteen findings, five medium and eight low; none is high.** The mathematics of the extraction holds. The medium findings concern library statuses, the name of one analytic input, and two owners. The machine-readable file is [RT-PAPER-KOYMANS-PAGANO.result.json](RT-PAPER-KOYMANS-PAGANO.result.json).

## Source

I fetched these on 29 September 2026:

- **arXiv.** The abstract page lists only v1 (31 January 2022, no journal reference). The v1 PDF and the unversioned PDF both have SHA-256 `c7a93ffe…50cbd`, the recorded hash.
- **Version of record.** Koymans's publication page still says "To Appear in Acta Mathematica". Crossref lists Acta Mathematica through vol. 236 no. 2 (2026) without the paper. So there is no published text to compare.
- **Secondary sources:**
  - Smith, [arXiv 1702.02325v2](https://arxiv.org/pdf/1702.02325v2) (`e768b5ad…`), the version the paper's bibliography names;
  - Chan–Koymans–Milovic–Pagano, [arXiv 1908.01752v1](https://arxiv.org/pdf/1908.01752v1) (`385c90c9…`).

I read all 110 pages of v1 in the text layer, in three parts (pp. 1–34, 35–59 and 59–110 with the bibliography). I checked the typography of ten pages on page images.

## What held

- **Coverage.** Every numbered statement from Proposition 2.1 to Theorem 8.13 has an item with the right locator. So do the unnumbered inputs:
  - Hasse–Minkowski, Dirichlet, [FK1, Lemma 1] and Smith's (1.2);
  - Hilbert reciprocity, H²(Ẑ, 𝔽₂) = 0, the ℚ₂ self-cup subspace and the ℤ/4 transfer;
  - Erdős–Kac on 𝒟, Sathe–Selberg and the quadratic-character PNT;
  - Landau's repulsion, the effective exceptional-zero bound and Heilbronn;
  - Hoeffding, Chebyshev, MacWilliams, Rédei's 4-rank formula and genus theory.

  Massey and spin symbols appear only as motivation, and no Siegel–Walfisz theorem is used.
- **Main theorem, recomputed:**
  - α = ∏_{j odd}(1 − 2^{−j}) = 0.4194224418.
  - [KP3, (A.2)] holds exactly for m ≤ 7.
  - The symmetric-matrix limit law weighted by 1/(2^{m+1} − 1) sums to 1 − α.
  - Theorem 8.1's statement (m ≥ 2, the P(n_m, n_m, n_{m+1})/2^{n_m} transition, the error (log log log log N)^{−c/(m²6^m)}) matches p. 75.
- **Source issues.** E1–E51 hold at their locators, including E4's s = 1 counterexample, E7, E9, E13's repair, E15, E17, E18, E41, E46, E48 and E51. The one exception is the review's amendment of E12 (finding 6).
- **Library.** The seven cited declarations exist at Mathlib `082e2d3` and Tau Ceti `f790474`, and each gives its item.
- **Planned statuses.** Checked against the layer texts and the reviewed audit:
  - ClassFieldTheory Layers 10 and 14 (no Hilbert symbol or product formula exists);
  - QuadraticFormInvariants 6B, 6C and 7;
  - ProfiniteCohomology Layer 11;
  - LocalFieldsRamification Layers 2 and 4;
  - GlobalNumberFields Layer 0.

  These rightly leave /20, /29, /64, /87, /88, /95, /130–/132 and /134 planned. The exceptions are findings 1–2.
- **Routes.** RS-07 keeps exceptional zeros in AN.2, prime-ideal applications in AN.4, mean values in AN.5 and large sieves in SV.2. PM.1 plans Erdős–Kac. Koymans–Milovic's spins and governing fields and Burungale–Tian's use of Smith are consistent with the Part II. Lemma 6.3's product-set Ramsey theorem has no other owner.

## Findings

### 1. Five "planned" items are built (medium, library claim)

Tau Ceti `f790474` already has the following.

- **/36 and /52.** The continuous cochain complex: `ContCohomology.C1`, `d1` and `Z1` (LowDegree.lean:127, 228, 485). Its (d¹f)(g,h) = g·f(h) − f(gh) + f(g) is exactly the paper's d_x on N(χ_x). The paper applies d only to 1-cochains.
- **/83.** Corestriction on H¹ with any transversal (`explicitCor1Transversal`, `explicitCor1_eq_transversal`, Corestriction.lean:429, 461). With the transversal {1, σ} its formula gives χ(σ²) and χ(τ) + χ(σ⁻¹τσ), which is (3.1)–(3.2).
- **/28.** `maximalProPQuotient`, with `proPKernel` and the universal property (MaximalProP.lean:82–352).
- **/21.** `kummerMap` with `H1EquivOfSmulEqSelf` gives χ_γ. The Kummer isomorphism, which is not built, is not needed.

The reviewed audit records all of this. **Fix:** make /28, /36, /52 and /83 library, cite the declarations for /21, and update the counts and the brief.

### 2. Genus theory is built (medium, library claim)

Item /227's two surjections are both in Tau Ceti:

- `NarrowClassGroup.mem_closure_of_sq_eq_one`: Cl⁺[2] is generated by the ramified primes, for either signature;
- `genusCharFunElementaryTwoQuotientFamilyLinearMap_injective`: "the #s genus characters span the full dual of Cl⁺(K)/Cl⁺(K)²".

Item /5's "kernel of Cl⁺ → Cl has order ≤ 2" is `card_ker_toClassGroup_le_two`. **Fix:** make /227 library and cite that lemma in /5.

### 3. The large-sieve input is Jutila's, not Heath-Brown's (medium, error)

- The extraction says (7.11) needs "Heath-Brown's large sieve for quadratic characters". Route 5, the brief and the prerequisites all name Heath-Brown (Acta Arith. 1995).
- The paper cites only [42, Proposition 6.6]; its sole Heath-Brown reference is the Selmer paper [22].
- Smith proves Prop. 6.6 from Jutila (Acta Arith. 27, 1975), Lemma 3: Σ_{x₁}(Σ_{x₂} c(x₂)(x₁/x₂))² ≪ t₁|X₂| + t₁^{1/2}t₂² log⁶t₂. Cauchy–Schwarz then gives t₂t₁^{3/4+ε} for all t₁ ≤ t₂.

**Fix:** keep SV.2 as the owner, but ask it for Jutila's lemma and Smith's Proposition 6.6. Replace the Heath-Brown prerequisite with Jutila.

### 4. P(m, n, j) has two owners (medium, duplicate)

Item /211 sends P(m, n, j) to the Part II. The extraction sends P_Sym (/205) and (A.2) (/218) to ST.5. The accepted ST blueprint now owns P(m, n, j) at `ST.5/matrix-kernel-law-over-a-finite-field`, citing p. 75 and noting that the Part II imports it. **Fix:** split /211 and route P(m, n, j) to ST.5.

### 5. The unit passage for negative Pell belongs to CA.5 as well (medium, error)

- Items /5, /9 and /12 need units of ℤ[√d] and of 𝒪_K of norm −1 to correspond, for all squarefree d > 1. Route 2 names only CA.4.
- The CA blueprint puts that passage in CA.5 (`negative-pell-iff-unit-of-norm-minus-one`), and only for d ≢ 1 (mod 4). That excludes every odd d ∈ 𝒟.
- The missing cases:
  - d ≡ 1 (mod 8): units already lie in ℤ[√d];
  - d ≡ 5 (mod 8): the cube of a half-integral unit.

**Fix:** add CA.5 to route 2 and name these two cases.

### 6. The review's E12 amendment is wrong (low, error)

The review struck E12's "at most 2" on the ground that K ⊆ ∏L(ψ_{k+1}(x)). But a raw cocycle may be 0. For example, S = {65}, k = 1, ψ₂ = 0: then (2) splits, 5 ramifies in K, and ∏L = ℚ, so e₅ = 1. E12 now contradicts its own reason and item /104. **Fix:** restore "at most 2; equals 2 when each L(ψ_{k+1}(x)) ⊇ ℚ(√x)".

### 7. Item /69's rank formula is wrong (low, error)

The note says rk_{2^s}A = dim 2^{s−1}A[2^s] − dim(left kernel). In fact the left kernel has dimension rk_{2^{s+1}}A. For A = ℤ/4 and s = 1 the note gives 0 instead of 1.

### 8–10. Three new source mistakes (low, missing)

- **E52.** §4 allows a = 1. With ψ = 0 the triple can be profitable, and Theorem 4.6(b)'s support {…} ∪ {χ₁ = 0} is not linearly independent. Every use has a > 1.
- **E53–E54.** Lemma 6.3 cites "[42, Lemma 4.1]", but in v2 it is Proposition 4.1. The lemma also omits r ≥ 2. Item /159's note should record that Proposition 6.6 does follow from Smith's Proposition 4.4.
- **E55.** p. 3 says the error term is effectively computable. But the m = 2 case of Theorem 8.1 is quoted from CKMP Theorem 6.1, whose Proposition 5.7 uses Siegel's theorem. Theorem 1.1 is unaffected.

### 11. Prerequisites omit six sources (low, missing)

The missing sources are:

- Rédei and Rédei–Reichardt, for (7.27);
- Heilbronn;
- MacWilliams;
- Watkins;
- Jutila.

### 12–13. Bookkeeping (low, other)

- **12.** Items /13, /23 and /93 cite "(issues file)" entries that do not exist. /93's doubt is also unfounded: Proposition 3.3 does give the γ_h step.
- **13.** The file lacks `sourceVersions`, which §18 requires because E4 and E7 quote stated results. The Acta text will need collation.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KOYMANS-PAGANO.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports no problems.
- Lean: none.
