# REV-PAPER-KHARE-WINTENBERGER-09-I: review of the extraction of Khare–Wintenberger, *Serre's modularity conjecture (I)*

**Verdict: accept.** All four routes are accepted. The four recorded mistakes are confirmed, and two new misprints are added and confirmed. No status or route changes. One statement and two notes were corrected, and the report was updated.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-48533a` (PR #4553, issue #4505). It has 71 items (2 library, 62 planned, 7 missing), 4 routes and 4 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Invent. Math. **178** (2009), 485–504, [doi:10.1007/s00222-009-0205-7](https://doi.org/10.1007/s00222-009-0205-7). I read the authors' copy [results.pdf](https://www.math.ucla.edu/~shekhar/papers/results.pdf) completely. It has 23 pages and is dated 31 May 2009. Its SHA-256 `3c389dc3…bad82` matches the recorded hash. The UCLA server's TLS chain is incomplete, so the file was fetched without certificate verification; the matching hash covers that.

The Springer version of record was not read, because the Springer page answered with a client challenge. Crossref records no update to the DOI (update-to absent, and the `updates` filter returns 0 items).

## 1. Items: complete and accurate

Every numbered statement appears in an item locator, with the copy's own page numbers:
- Theorems 1.1, 1.2(1)–(2), 3.1–3.4, 4.1(1)–(2), 5.1 and 5.1(1)–(4), 9.1 and 10.1(i)–(ii);
- Definition 2.1;
- Lemmas 6.1, 6.2(i)–(ii), 6.3(i)–(ii) and 8.2;
- Corollaries 8.1(i)–(ii) and 10.2(i)–(ii);
- the hypotheses (L_r), (W_r), (D_r) and (H);
- the §7 estimates (1)–(4);
- the remarks after Theorems 3.4 and 5.1 and after Lemma 8.2 and (H).

The statements match the text, including these details:
- Definition 2.1's two bounds (t > max(Q(N/q²), 5, p); q ≡ 1 mod 8 and mod every prime r ≤ max(Q(N/q²), p)).
- Lemma 8.2's coefficients in the prime field 𝔽_p. The page image shows GL₂(𝔽_p), and the remark concerns an earlier 𝔽̄_p version.
- Theorem 5.1(2)'s two shapes of the inertial parameter at p.

I rechecked the arithmetic the items rely on:
- **Mod 3 step of Theorem 3.2.** χ′ = ω_{3,2}² is of level 2 (not a power of ω_{3,2}⁴) with (i, j) = (2, 0) and i + j even, and Theorem 5.1(4) gives weight q + 1 − (i − j) = 2.
- **Mod 5 step.** χ′ = ω₅² is non-trivial of order 2 with i even, and Theorem 5.1(3) gives weight i + 2 = q + 1 − i = 4.
- **The inductive step's intervals for i.** These have length (P − 1)/ℓ^e (odd ℓ) and 2(P − 1)/2^e (ℓ = 2), so they contain an admissible exponent. With (3) and (4) they give weights ≤ p + 1.
- **The (D_r) step of §8.4.** The new system (ρ′_λ) from Theorem 5.1(4) at the auxiliary prime p′ has k(ρ̄_{p′}) = 2, hence an unramified parameter at p′. So ρ̄′_s is unramified at p′, and the good-dihedral bounds for ρ̄′_s (with t = p′) hold; without this, q ≡ −1 mod p′ would clash with condition (ii).

One statement was corrected. Item /40 said the Rosser–Schoenfeld threshold is "3/2 − 1/30 ≈ 1.46". The page image shows "= 1.46̄" with a bar (1.466…), which is exact, so the statement now quotes it.

## 2. Statuses: all hold

- **Library items.** Mathlib `cyclotomicCharacter` (CyclotomicCharacter.lean:307), `modularCyclotomicCharacter` (:212) and `Nat.primeFactors` (PrimeFin.lean:37) were opened at 082e2d3. They provide /5 and /10, and `Nat.exists_prime_lt_and_le_two_mul`, cited in a note, exists (Bertrand.lean:222).
- **Packet nodes.** All 54 packet node ids cited in the notes resolve in data/decompositions or research/blueprint/packets on main. The one apparent miss is the abbreviation "theorem-5-1-part-1 … part-4"; all four nodes exist.
- **Stages cited without a node.** I read each stage text, and each plans what is claimed:
  - R19.3: compatible families, keeping the weak, almost strict and strict distinctions;
  - R17.5: the solvable two-dimensional Artin theorem with its weight-one form;
  - AL.2: the global Godement–Jacquet integral for cuspidal GL_n, with analytic continuation;
  - R16.5, R28.4 (the isogeny criterion), AN.4 (Brauer continuation versus Artin holomorphy);
  - R17.6 (the dyadic soluble case), R20.5 (Buzzard/Wiese);
  - Tau Ceti Chebotarev layer 10 (Dirichlet density).
- **Missing items.** I searched the stage texts for GL₂-type, Ribet, Shimura–Taniyama–Weil, weight one and Artin. /33, /59, /62, /65, /68, /70 and /71 are not planned. R25.5 defines GL₂(K)-type varieties only for terminal cases, and ML.1 names weight-one modularity only generically.

## 3. Routes: all four accepted

Every missing item is routed exactly once.

- **Route 1: source → ClassicalSerreModularity R26.1, R26.6, R27.1–R27.6** (29 planned items). KW I is the source of these layers, and each item already has a node there. The route records the paper and its source issues.
- **Route 2: source → PotentialModularityAndCompatibleSystems R24.3–R24.6** (15 items, one missing).
  - The missing item /33 says that lifts with q ∥ N(ρ) are minimal at q when p ∤ q − 1. It belongs with R24.3's minimal lifts.
  - I checked it. A character of I_q through (ℤ/q)^× has order prime to p, so it is the Teichmüller lift of its reduction. A unipotent ρ̄|_{I_q} lifts, with conductor exponent 1, only to a unipotent ρ|_{I_q}.
- **Route 3: source → ModularityAndLanglandsExtensions ML.1** (/59, /62, /65). These are Corollary 10.2(ii), Langlands' conjecture for Artin representations and Khare's weight-one descent: ML.1's "weight-one modularity in proved cases". Their inputs are planned elsewhere.
- **Route 4: Part II of EllipticCurveModularity, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties`** (/68, /70, /71).
  - No layer plans the modularity of GL₂-type abelian varieties. Corollary 10.2(i) generalises R29's theorem from dimension one.
  - The brief states the final theorem exactly, sets out Ribet's reduction, Faltings and Carayol's conductor formula, and names its imports.
  - make_queue folds it with the sibling Part IIs of EllipticCurveModularity, including Breuil–Conrad–Diamond–Taylor's `EllipticCurveModularityWild3Adic`, into DESIGN-EllipticCurveModularityPartII.

## 4. Mistakes in the paper: 4 of 4 confirmed, 2 added

- **E1** (misprint; proof of Theorem 9.1, p. 19, page image): confirmed. Theorem 5.1(4) is applied at q = 2 to ρ̄₃, whose restriction to D₂ was just shown to be (χ₃ ∗; 0 1). The conclusion concerns ρ′₃, so the system lifts ρ̄₃, not ρ̄.
- **E2** (misprint; p. 19, page image): confirmed. Finite flatness of ρ̄′₂ over the index-3 field comes from Theorem 5.1(4) and almost strict compatibility, not Theorem 5.1(2). The preceding sentence cites (4).
- **E3** (gap, affects the proof; §3.2, p. 6, page image): confirmed.
  - Theorem 3.4 concludes "is modular", while Theorem 1.2 claims weight k(ρ̄) and level N(ρ̄), and the paper never supplies the refinement.
  - For p = 2 the introduction presents Theorem 1.2(2) as filling exactly this dyadic case.
  - The correction works: Lemma 6.2(i), or Theorem 5.1(1) with Theorem 4.1.
- **E4** (misprint; p. 14, page image): confirmed. r is both the number of prime divisors in (W_r) and the exponent in ℓ^r ∥ P − 1.
- **E5** (new, misprint, affects nothing; Theorem 5.1(2), p. 9, page image). "(id, N) with N a non-zero nilpotent matrix ∈ GL₂(ℚ̄)": a non-zero nilpotent matrix has determinant 0, so M₂(ℚ̄) is meant.
- **E6** (new, misprint, affects nothing; proof of Theorem 9.1, p. 19, page image). "We would be done by Theorem 1.2(ii)": Theorem 1.2's parts are numbered 1 and 2, and part 2 (p = 2, weight 2) is the one used.

Not registered: the spellings "projectve" (p. 2), "divisior" (p. 14), "Diagramatically" (p. 5), "l + 1" for ℓ + 1 (p. 14), and "Chistopher", "Jounals" in the references.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The review's changes are:
- the six `review` verdicts and E5, E6;
- item /40's statement;
- the notes on /29 and /53;
- the report's header count, source-issue table and a new section "Corrections by the independent review".

The eight prerequisite links resolve on Crossref to the cited works.
