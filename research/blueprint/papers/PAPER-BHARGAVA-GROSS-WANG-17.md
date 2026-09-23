# PAPER-BHARGAVA-GROSS-WANG-17: A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension

Manjul Bhargava, Benedict H. Gross and Xiaoheng Wang (appendix by Tim and Vladimir Dokchitser), *A positive proportion of locally soluble hyperelliptic curves over ℚ have no point over any odd degree extension*, [J. Amer. Math. Soc. 30 (2017), 451–493](https://doi.org/10.1090/jams/863); arXiv [1310.7692](https://arxiv.org/abs/1310.7692).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1436). Status: **complete**. The whole paper, including the appendix, was read and every missing item is routed once. The machine-readable extraction is [PAPER-BHARGAVA-GROSS-WANG-17.result.json](PAPER-BHARGAVA-GROSS-WANG-17.result.json): 56 items (1 library, 5 planned, 50 missing), 6 routes, 16 prerequisite entries and 5 recorded source issues.

**Source.** arXiv v2 (24 February 2017, 42 pages), SHA-256 `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2`, read in full on 2026-09-22.

- The JAMS PDF (online 27 July 2016) returned 403 to scripted access and was not read. v2 postdates it and is presumably the final text.
- Locators are v2 pages.

## What the paper proves

Order hyperelliptic curves z² = f(x, y) of genus g (deg f = 2g + 2) by the height max|fᵢ|.

- **Theorems 1, 2 and 12.** For every g ≥ 1, a positive proportion of locally soluble curves have no point over any odd-degree extension of ℚ. Equivalently, J¹ = Pic¹ has no rational point, and the index is 2.
- **Corollary 3.** A positive proportion have nontrivial Ш[2].
- **Theorems 10–11 and Corollary 9.** The failure is a Brauer–Manin obstruction for J¹. As g → ∞ it is one for Sym^k(C) in 100% of cases.
- **Theorem 6, the key estimate.** The average size of the 2-Selmer set Sel₂(J¹) of locally soluble two-covers of J¹ is at most 2. When Sel₂(J¹) is nonempty, its size is #Sel₂(J), which is at least 2 and at least 4 when the 2-Selmer rank is even.
- **Theorem 5.** The appendix shows that both parities occur with positive proportion. Together with Theorem 6 this makes Sel₂(J¹) empty a positive proportion of the time.
- **Theorem 7.** Selmer sets "of order k" have average below 2, tending to 0 as g → ∞.

**The parametrization.**
1. **§2.** Wood's ideal-class parametrization of SLₙ- and (SLₙ/μ₂)-orbits on pairs of symmetric forms, over Dedekind domains.
2. **§§4–5, pencils of quadrics.**
   - The Fano variety F of a generic pencil is a torsor for J with 2[F] = [J¹] (Wang's group J ⊔ F ⊔ J¹ ⊔ F).
   - Regular pencils, with invariant form f·y², bring in the generalized Jacobian J_m of the nodal curve C_m.
   - The resulting criterion for f to be the discriminant of a pencil (Theorems 13, 24, 25) is that f₀ ∈ K^{×2}N(L^×), equivalently [J¹_m] ∈ 2H¹(K, J_m).
3. **§§6–8, soluble and locally soluble orbits.** Soluble orbits correspond to J¹(K)/2J(K). Locally soluble ones correspond to Sel₂(J¹), with Sel₂(J) acting simply transitively. Two examples of Cremona and Elkies show the subtleties.
4. **§9.** Integral representatives exist after scaling by κ² = 16.
5. **§§10–12.** Counting and a weighted sieve, after Bhargava's *Most hyperelliptic curves have no rational points*, with τ(SLₙ/μ₂) = 2.

## What the atlas already has

- **Library.** Kummer theory Kˣ/Kˣ² ↪ H¹(K, μ₂): Tau Ceti `kummerClassMap_injective`, with Mathlib's Hilbert 90 for surjectivity.
  - Mathlib has the Brauer group.
  - Tau Ceti has elliptic-curve 2-Selmer groups via x − T, the genus-one analogue.
- **Planned.**
  - SchemeAndStackFoundations SF.3: Jacobians and Picard schemes.
  - NeronModelsAndSemistableAbelianVarieties R11.1: Néron models.
  - AbelianSchemesAndArithmeticModuli A3: Weil pairing.
  - InverseGaloisAndArithmeticFundamentalGroups IG.2: Hilbert irreducibility.
  - HeightsRationalPointsAndObstructions RP.3: Skorobogatov–Stoll, descent obstruction = Brauer–Manin.
- **Not in the atlas or the libraries.** Pencils of quadrics and their Fano varieties, the hyperelliptic orbit parametrization, Selmer sets of torsors, the counting, and the Dokchitsers' parity machinery.

## Routes

1. **Source of ArithmeticStatistics ST.0 and ST.1** (21 items):
   - the family and height;
   - 2 ⊗ Sym²(n) over Dedekind domains, R_f, and Theorems 16–17 with Corollaries 19–20;
   - the pencil geometry: Fano schemes, Theorem 23, regular pencils, and Theorems 24–25 with 13;
   - x − T, and Theorems 28–31 with 14;
   - local orbit counts over F_q and ℝ;
   - the §8 examples;
   - integral representatives: Theorems 15 and 33, Propositions 34–35.

   RS-07 scopes ST.1 to orbit parametrizations with stabilizers, degenerate loci, local solubility and the comparison to Selmer objects, naming genus one. This paper extends that to all genera, in the same direction as the SOₙ representation already routed to ST.1 from PAPER-BHARGAVA-SHANKAR-WANG-22.
2. **Source of ArithmeticStatistics ST.2** (4 items): the weighted orbit counts (Theorems 36 and 38), large families, and the geometric-sieve tail (Proposition 42).
3. **Source of ArithmeticStatistics ST.4** (18 items):
   - the Selmer-set average (Theorems 40–41, local masses, τ(G) = 2);
   - its consequences: Theorems 1, 2, 5, 6, 7, 12 and 44, Corollaries 3 and 8, and Remark 4;
   - Dembo–Poonen–Shao–Zeitouni;
   - the appendix: Theorems A.1–A.3, Proposition A.4 with Lemma A.5, Theorem A.7 with Corollary A.8, and Poonen–Stoll's local terms for Ш[2].
4. **Source of HeightsRationalPointsAndObstructions RP.1 and RP.3** (4 items):
   - RP.1: two-covers and W[2]; W[2] and odd factorizations; Sel₂(J¹) and the order-k sets;
   - RP.3: the Brauer–Manin consequences (Corollary 9, Theorems 10–11).
5. **Source of NeronModelsAndSemistableAbelianVarieties R11.4** (2 items): the nodal curve C_m and generalized Jacobian J_m, and Proposition 22 on 2-torsion and the torsors W_m[2], W[2].
6. **Source of SchemeAndStackFoundations SF.3** (1 item): Proposition 21, rational divisor classes versus divisors via Br(K′/K).

No new roadmap or Part II is needed.

## Source issues (`sourceIssues` E1–E5)

- **E1** (error, affects the proof).
  - **The problem.** In the proof of Theorem 28, the explicit (g + 1)-planes claimed isotropic are not B′-isotropic for g ≥ 1, in both the non-Weierstrass and the Weierstrass case. The (g − 1)-st vector pairs with the last one to ∓1.
  - **Correction.** Give that vector third coordinate 1: (β^{g−1}, 0, 1), resp. ((β − x₀)^{g−1}, 0, 1). For g = 1 in the Weierstrass case the vector is (h₁(β) − h₁(x₀), 0, −h₁(x₀)).
  - **Evidence.** Gram matrices computed symbolically: the printed planes fail, and the corrected ones are isotropic in random examples with g = 1, 2, 3.
  - **Consequence.** Theorem 28 stands.
- **E2** (misprint). The conductor-571 curve of §8 is y² + y = x³ − x² − 929x − 10595 (Cremona 571b1), not y² + xy = ⋯.
  - **Evidence.** The printed equation has conductor 43792070 and analytic rank 1. The corrected curve has conductor 571, rank 0 and analytic Ш of order 4, and is the Jacobian of the quartic (PARI).
  - **Also checked.** All other numbers in both examples, including Ш of order 16 for y² = x³ − 1221.
- **E3** (gap, affects a stated result). Theorem 44 (stated without proof) needs, via Theorem A.3, conditions at 2 whenever 2 has a unique prime above it in ℚ(√p, √q). That happens exactly when one of p, q is ≡ 3 mod 4 and the other ≡ 5 mod 8, e.g. (5, 3). The hypotheses omit this.
- **E4** (misprint). Theorems 33, 40 and 41 ask for coefficients in 16ⁿℤ. The proof and Theorem 15 (κ = 4) need only 16ℤ.
- **E5** (misprints).
  - In the proof of Proposition 34, x^{n−2}y should be x^{n−2}y².
  - In the proof of Lemma A.5(3), "> n" should be "> 2n + 2".
  - Two bibliography entries are wrong: Skorobogatov's tract is no. 144 (2001), and Stoll's paper is in ANT 1 (2007).

**Also checked and correct:**
- the orbit and stabilizer counts of §7 over F_q and ℝ, rederived from Corollary 20;
- the sign and counting arguments for Theorems 5 and 7, where S_{g+1}(k) < 2^g for k < g;
- the local ratios a_ν;
- the reduction y² + xy = x^{2g+1} of Proposition A.4;
- the 2^{−4n−4} of Theorem A.1, from disjoint twist quadruples.

Crossref records no correction notice or update relation.

## Prerequisites not yet covered

- Bhargava, *Most hyperelliptic curves over ℚ have no rational points*.
- Wang's pencils-of-quadrics paper and thesis.
- Wood 2011 and 2014.
- Arithmetic invariant theory I and II.
- Bhargava–Gross 2013, and Shankar–Wang.
- Bhargava–Shankar 2015 (binary quartics and ternary cubics).
- Bhargava's geometric sieve.
- Poonen–Stoll (Cassels–Tate pairing; densities), and Poonen–Schaefer.
- Skorobogatov and Stoll (descent obstructions).
- The Dokchitsers' regulator constants and self-duality papers.
- Dembo–Poonen–Shao–Zeitouni.
- Colliot-Thélène–Sansuc, and Colliot-Thélène–Poonen.
- Bruin–Stoll.
- Serre, *Groupes algébriques et corps de classes*.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-GROSS-WANG-17.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Stage ids were checked against `data/atlas.json` and the accepted restructures:
  - RS-07 narrows ST.0–ST.4;
  - RS-29 keeps IG.2;
  - no other cited stage is restructured or retired.
- Library citations were read:
  - Tau Ceti `FieldTheory/GaloisCohomology/Kummer.lean:298` at f790474;
  - Mathlib `RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84` at 082e2d3.
- Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Review (REV-PAPER-BHARGAVA-GROSS-WANG-17, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1437), **accepted** this
extraction and all six routes, with two corrections made in place. The full record is
[REV-PAPER-BHARGAVA-GROSS-WANG-17.md](../reviews/REV-PAPER-BHARGAVA-GROSS-WANG-17.md).

The recorded hash of arXiv v2 reproduces. Every one of the 49 numbered environments the paper
declares (Theorems 1–44 and A.1–A.8 with their propositions, lemmas, corollaries, definitions and
Remark 4) appears in an item; 65 of 66 name-and-page locator checks land exactly, and the
exception — item 13 citing p.34 inside the proof of Theorem 7, which begins on p.33 — is right too.
All eight stage ids and all five planned layer ids exist, and route 1's two cross-claims hold: RS-07
keeps ST.1's orbit-parametrization scope, and `PAPER-BHARGAVA-SHANKAR-WANG-22` does route its SO_n
representation to ST.0/ST.1, so the pencils go to an existing direction rather than a new roadmap.

**Correction 1.** Item 21, the Kummer identification `H¹(K, μ₂) = K^×/K^{×2}`, is now `planned` at
the Tau Ceti `ProfiniteCohomology` roadmap's Layer 9 rather than `library`. Tau Ceti's
`kummerClassMap_injective` gives only the injection — its docstring says surjectivity "is what would
upgrade it to the Kummer isomorphism" — and Mathlib's cited lemma is the finite-Galois Hilbert 90,
not the profinite statement that surjectivity needs; the paper uses the identification itself on
p.8. The cited name is also corrected to `TauCeti.kummerClassMap_injective`: `FieldTheory` is part
of the file path, not of the namespace.

**Correction 2.** E1's correction gave the sign of the failing pairing in the Weierstrass case as
`+1`; it is `−1` for `g ≥ 2` (and `h_1(x_0)` for `g = 1`), as E1's own reason says.

All five findings are **confirmed**, each recomputed or re-read independently: E1's Gram matrices
were rebuilt from the definitions on p.18 for `g = 1, 2, 3` in both cases, and the printed planes
fail for `B′` in exactly one entry while all three proposed replacements are isotropic; E2's two
curves have discriminants `2⁵·5·7·79·7919` and `−571`, and the corrected one is isomorphic over ℚ,
with `u = 6`, to `y² = x³ − 27Ix − 27J`; E3's missing hypothesis at 2 arises exactly when one of
`p, q` is `≡ 3 mod 4` and the other `≡ 5 mod 8`, and no prime besides `p`, `q` and `2` can have a
unique prime above it in `ℚ(√p, √q)`; E4's proof states the hypothesis as `16ℤ` and Theorem 15 claims
`κ = 4`; and Crossref confirms E5's two reference corrections. The JAMS text remains unread (403),
so every verdict is a verdict about arXiv v2.
