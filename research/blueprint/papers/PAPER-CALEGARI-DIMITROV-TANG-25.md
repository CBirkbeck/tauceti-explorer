# PAPER-CALEGARI-DIMITROV-TANG-25: The unbounded denominators conjecture

Frank Calegari, Vesselin Dimitrov and Yunqing Tang, *The unbounded denominators conjecture*, [Journal of the American Mathematical Society 38 (2025), no. 3, 627–702](https://doi.org/10.1090/jams/1053); arXiv [2109.09040](https://arxiv.org/abs/2109.09040) (v4).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1414). Status: **complete**. The whole published article was read, and every missing item is routed exactly once. The machine-readable extraction is [PAPER-CALEGARI-DIMITROV-TANG-25.result.json](PAPER-CALEGARI-DIMITROV-TANG-25.result.json):

- 148 items: 14 library, 5 planned, 129 missing;
- 9 routes: three Part IIs and six source routes;
- 26 prerequisite entries;
- 11 source issues.

**Source.** The publisher's offprint on the first author's page, pp.627–702, SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`, read in full on 2026-09-22, with formulas checked against the page images.

It has the same mathematics as arXiv v4 (SHA-256 `9bffb129…f62956ad`). v4 numbers the items of §5.1 from (5.1.11) on one lower; locators follow the published version.

## What the paper proves

**Theorem 1.0.1.** Let f ∈ ℤ[[q^{1/N}]] (q = e^{πiτ}) be holomorphic on ℍ, with f|_kγ = f for γ in a finite-index subgroup Γ ⊂ SL₂(ℤ), and meromorphic at the cusps. Then f is modular for a congruence subgroup. It follows that a noncongruence form with rational coefficients has unbounded denominators. The same holds with algebraic-integer coefficients (Remarks 6.3.1–6.3.2). Shimura proved the converse.

The proof has four parts.

1. **Arithmetic holonomy bound (§2).** Theorem 2.0.1 is a quantitative André algebraicity criterion. Suppose ℚ(p(x))-independent power series f₁,…,f_m have integral t-expansions and extend holomorphically along a map φ with |φ′(0)| > 1. Then m ≤ e·∫_𝕋 log⁺|p∘φ| / log|φ′(0)|. The integrated growth term, rather than a supremum, is the new point. Three proofs are given:
   - Nevanlinna's quotient representation (§2.3);
   - plurisubharmonicity (§2.4);
   - equidistribution with a Vandermonde damping (§2.5).

   Corollary 2.0.5 turns this into a bound on the dimension of a space of holonomic power series with trivial local monodromy.
2. **Reduction and leveraging (§§3–4).**
   - Proposition 3.0.1 bounds [R_{2N} : ℚ(λ)] by CN³ log N. Here R_{2N} is spanned over ℚ(λ) by bounded-denominator modular functions whose cusp widths divide 2N. The bound needs two inputs: the conformal radius of ℂ∖μ_N, and a mean-growth bound for its uniformization.
   - A noncongruence f gives new independent forms f(pτ) (Theorems 4.3.1–4.3.2), so the degree over the congruence field M_{2N} doubles at every prime. This beats the logarithmic slack (Proposition 4.3.5).
   - The group theory behind this is: the Wohlfahrt level; a nonabelian Ihara lemma from the amalgam structure and congruence subgroup property of SL₂(ℤ[1/p]) (Lemma 4.4.1); and, in §§4.5–4.6, the vanishing of SL₂(Ẑ)-invariants in completed cohomology (Theorem 4.5.2), which gives an enhanced Ihara lemma.
3. **The uniformization of ℂ∖μ_N (§5).** Hempel's Schwarzian method and hypergeometric functions give |F_N′(0)| = 16^{1/N}Γ(1+1/2N)²Γ(1−1/N)/(Γ(1−1/2N)²Γ(1+1/N)) = 16^{1/N}(1 + ζ(3)/2N³ + ⋯) (Theorem 5.1.4, also Kraus–Roth). The Fuchsian group, horoballs and Shimizu's lemma give the crude bound sup log|F_N| ≪ N/(1−r) (Lemma 5.2.18).
4. **Nevanlinna theory (§6).** The logarithmic derivative lemma for zero-free functions and the identity x^N/(x^N−1) = (x/N)Σ1/(x−ζ) upgrade that bound to ∫ log⁺|F_N^N| ≪ log(N/(1−r)), uniformly in N (Theorem 6.0.1).

§7 gives three consequences:

- integral solutions of ODEs on ℙ¹∖{0, 1/16, ∞} with finite local monodromy at 0 are algebraic and congruence-modular in λ/16 (Theorem 7.2.1);
- a component of a vector-valued modular form with ℤ[[q]] expansion is a congruence modular form (Theorem 7.3.3). The proof uses Chudnovsky, Bombieri–André and Katz to make the local monodromy finite. This gives Mason's conjecture (Corollary 7.3.4);
- the π₁ of the connected Néron model of X(N) over O_K is that of Spec O_K (Theorem 7.4.10).

§7 also includes weakly holomorphic quasi-modular examples and an open question (7.4.5).

## What the libraries and the atlas already have

**Library (14 items).**
- *Mathlib:* congruence subgroups, q-expansions, η, Δ and E₂ (with logDeriv η = (πi/12)E₂), Siegel's lemma, Stirling's formula, Jensen's formula on closed discs, eVariationOn, and sequential Banach–Alaoglu with Riesz–Markov. It also has Chebyshev's bounds, which suffice where the paper quotes the prime number theorem. Goursat's lemma, H¹ inflation–restriction, the Γ and digamma identities (ψ(1) = −γ), and the Nevanlinna proximity function (a circle average) complete the list.
- *Tau Ceti:* the Cayley transform (`UpperHalfPlane.discCoordinateEquiv`).

**Planned (5 items).**
- Cusp widths and ramification: FuchsianOrbifolds Layers 3–4.
- Free presentations of Γ(N): FuchsianOrbifolds Layer 2.
- M_{2N} as the function field of Y(2N)/ℚ: ModularCurvesPartII R12.4 and AlgebraicModularFormsAndSerreWeights R15.1.
- Continuous Hochschild–Serre: ArithmeticGaloisDuality R02.2/D7.
- Theta functions and the triple product: QSeries QM.0–QM.1.

**Near misses, recorded as missing.**
- Mathlib's `ModularForm` is holomorphic at the cusps. The paper needs forms meromorphic at the cusps.
- Mathlib's Nevanlinna characteristic, counting function and first main theorem are stated for functions meromorphic on all of ℂ. The paper works on the disc.
- The Herglotz representation of log g is not stated, only the Poisson formula and the derivative of the Herglotz integral.
- Tau Ceti has universal covers, the Riemann mapping theorem, reflection and the monodromy theorem. It has no holomorphic uniformization of a multiply connected plane domain.

**Missing from both.**
- The modular λ-function and the λ-covering ℍ/Γ(2) ≅ ℂ∖{0,1}. ConformalMapping's document assigns the covering to ModularForms, but no layer plans it.
- The Wohlfahrt level and noncongruence subgroups.
- Arithmetic algebraization.
- The paper's own results.

## Routes

1. **Part II `NoncongruenceModularForms`** (60 items): *Modular forms — Hecke theory, newforms, and L-functions, Part II: noncongruence subgroups and the unbounded denominators theorem*, area `automorphic`.
   - It takes the modular-forms and group-theoretic material:
     - weakly holomorphic forms, cusp widths at every cusp, the Wohlfahrt level and Wohlfahrt's theorem;
     - the λ-function and its covering, and Jacobi's formula;
     - R_{2N} and M_{2N}, and Proposition 3.0.1;
     - the leveraging argument of §§4.3–4.4, and the invariant-vector computations of §§4.5–4.6;
     - Theorem 1.0.1 and its algebraic-integer form;
     - the applications of §7 and the examples.
   - **Why a Part II.** These are modular forms on finite-index subgroups, the objects of the Tau Ceti ModularForms roadmap, pushed beyond congruence subgroups. A Tau Ceti roadmap is extended only by a Part II.
   - **Why the λ-covering is here.** It belongs to the modular-forms family by ConformalMapping's and BelyiMaps' own boundary statements, and nothing plans it.
2. **Part II `ArithmeticAlgebraizationAndHolonomyBounds`** (20 items): *Diophantine approximation and transcendence, Part II: arithmetic algebraization and holonomy rank bounds*, area `analytic`.
   - It takes §2: Lemma 1.1.2, André's criterion, Eisenstein's theorem, Lemmas 2.0.8, 2.1.2 and 2.4.2, the equidistribution lemmas of §2.5, Theorem 2.0.1, Definition 2.0.4, Corollary 2.0.5 and §2.5.27.
   - **Why a Part II.** DiophantineApproximationAndTranscendence plans G-functions (DT.5) but no algebraicity criteria or holonomy bounds, so these are new layers in its direction.
3. **Part II `PuncturedPlaneUniformizationAndValueDistribution`** (37 items): *Conformal mapping and the geometric theory of holomorphic functions, Part II: uniformization of punctured planes and value distribution on the disc*, area `analysis`.
   - It takes:
     - linear ODEs in the complex domain and the Schwarzian;
     - holomorphic uniformization of punctured planes, the uniformization radius and Hempel's theorem;
     - all of §5 (F_N, Theorem 5.1.4, the Fuchsian group of ℂ∖μ_N, Shimizu's lemma, Lemma 5.2.18);
     - Nevanlinna theory on the disc, with Blaschke products, the Herglotz formula and Lemmas 2.3.1 and 6.1.7;
     - Theorem 6.0.1.
   - **Why a Part II.** This continues Tau Ceti's geometric function theory beyond simply connected domains.
   - **Shimizu's lemma** is stated there for all discrete subgroups of PSL₂(ℝ). FuchsianOrbifolds plans precisely invariant horodiscs, but not this bound.
4. **Source of DiophantineApproximationAndTranscendence DT.5:** G-functions, Chudnovsky's theorem, the Bombieri–André theorem and Katz's local monodromy theorem (the inputs of Theorem 7.3.3).
5. **Source of ModularCurvesPartII R14.4:**
   - Ihara's lemma in Ribet's Γ(N) form (Lemma 4.6.2);
   - the amalgam presentation of the level-N subgroup of SL₂(ℤ[1/p]);
   - the congruence subgroup property of SL₂(ℤ[1/p]).

   R14.4 already plans Ihara's lemma through this tree geometry.
6. **Source of AlgebraicModularFormsAndSerreWeights R15.2:** Shimura's bounded-denominators theorem for congruence forms. R15.2 plans the integral q-expansion principle. Its decomposition imports Shimura's Theorem 3.52 without a node and records a related finite-freeness gap.
7. **Source of ArithmeticGaloisDuality D7:** universal coefficients and Sylow reduction for finite groups, and the Künneth formula for mod-ℓ cohomology of profinite products. D7 declares itself the generic owner of these extensions of ProfiniteCohomology.
8. **Source of NoncommutativeAndEquivariantIwasawa NE.0:** Lazard's theorem H*(G, 𝔽_p) = ∧*H¹ for p-powerful torsion-free pro-p groups. NE.0 takes its homological inputs from Lazard.
9. **Source of ArithmeticGaloisRepresentations G7:** H¹(SL₂(𝔽_p), ad⁰) = 0 for p ≥ 3, p ≠ 5 ([DDT97, Lemma 2.48]). G7's integrated node checks the enormous condition for SL₂(𝔽_p) with p ≥ 5, so the p = 5 exception matters there.

**Dependencies.** The three Part IIs have no cycle:

- NoncongruenceModularForms imports the other two, which export Corollary 2.0.5 and Theorems 5.1.4 and 6.0.1.
- ArithmeticAlgebraizationAndHolonomyBounds imports Lemma 2.3.1, the uniformization radius and the ODE layer from the ConformalMapping Part II.
- Example 5.1.22, which links F₂ to λ, is placed with λ in NoncongruenceModularForms.

## Source issues (`sourceIssues` E1–E11)

- **E1** (misprint). Lemma 4.5.11 prints dim H¹(Γ(5), 𝔽₃)^{SL₂(𝔽₅)} = 0, but the proof of Theorem 4.5.2 uses ℓ = N = 5.
  - *As printed, it is false.* SL₂(𝔽₅) is perfect, so the character SL₂(ℤ) → ℤ/12 → 𝔽₃ restricts to a nonzero invariant class on Γ(5). Over 𝔽₃, the 5-dimensional constituent of H¹(Γ(5), ℚ) also acquires a trivial composition factor (5 ≡ 1 + 4 mod 3 for A₅).
  - *The intended 𝔽₅ statement holds.*
- **E6** (error, affects the proof).
  - *The claim.* §4.4 says that reduction mod p on ⟨E, Γ(N)⟩ ∩ Γ₀(p) has kernel Γ(Np).
  - *Why it fails.* For N > 2 the kernel also contains elements ≡ −I mod N and ≡ I mod p. So the deduction of (4.4.9) as written only gives G ∩ Γ(p). That is weaker than the (4.4.10) that Theorem 4.3.1 needs.
  - *The repair.* Run the argument on Γ(N) ∩ Γ₀(p), where the proof of Lemma 4.4.4 already works, and adjoin E. The result stands.
- **E7** (gap). The group G_{2N} of Lemma 4.2.3 must be intersected with ⟨E, Γ(2N)⟩ before taking the normal core. Otherwise it need not lie in ⟨E, Γ(2N)⟩ or have level exactly 2N.
- **E11** (gap). The proof of Lemma 4.5.6 never treats ℓ = p = 2 for n = 1. This case follows from SL₂(ℤ₂)^{ab} ≅ ℤ/4.
- **Misprints** (E2–E5, E8–E10):
  - **E2:** the sign of Euler's constant in (5.2.10) and in the proof of Lemma 5.2.12 (ψ(1) = −γ).
  - **E3:** an index in the digamma estimate of Lemma 5.2.9.
  - **E4:** diag(p, 1/p) should be diag(1/p, p) in Lemma 4.1.7.
  - **E5:** R_{2Np} should be R_{2N} in the proof of Theorem 4.3.2.
  - **E8:** R := (1 − r)/2 should be (1 + r)/2 in Corollary 6.2.11.
  - **E9:** S(M, N) should be s·S(M, N) in Lemma 5.2.18. arXiv v1 and v3 had it right.
  - **E10:** the relation between E and K in §7.4.2 has the wrong overall sign; its right side equals −(2/π)E(16x).

The following were verified by computation here:

- the conformal radius formula (both forms, and the N = 2, 3 values);
- the ζ(3), ζ(5) expansion, with a positive remainder;
- the Schwarzian identity and its three constraints;
- the ODEs (5.1.9) and (5.1.17);
- all q-series identities of §§1 and 7.4.2 (λ/16, the inverse series, h, Jacobi, (2/π)E(λ) and Zudilin's formula), and the Catalan integralities.

Only E10 failed. No correction notice exists: the arXiv versions, the publisher offprint, Crossref (no update relation) and the author's page were checked.

## Prerequisites not yet covered

- André (2004), the algebraicity criterion; Bost (1999); Bost–Charles (arXiv:2206.14242).
- Hempel (1988); Kraus–Roth (2016).
- Thompson with Serre's letter (1989), Berger (1994), Serre (1970), Mennicke (1967), Ribet (1984) and Wohlfahrt (1964).
- Calegari–Emerton (2011, 2016); Lazard (1965).
- Katz (1970); Dwork–Gerotto–Sullivan (1994).
- Ihara (1994); Bilu (1997).
- Knopp–Mason (2003) and Mason (2012); Stiller (1984); Atkin–Swinnerton-Dyer (1971).
- Standard references: Shimura's book (Theorem 3.52), Nevanlinna and Hayman, Drmota–Tichy, and DDT97 Lemma 2.48.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALEGARI-DIMITROV-TANG-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the deliverables: 0 problems.
- Every missing item is in exactly one route, and no Part II takes a library or planned item. The Part II briefs are 573, 341 and 390 words.
- Every cited declaration was read in its source file at Mathlib 082e2d3 or Tau Ceti f790474, with file and line recorded in the item notes.
- Planned layer ids were checked against `data/atlas.json`.
- No Lean was written or compiled; none is a deliverable of this job.

## Review (REV-PAPER-CALEGARI-DIMITROV-TANG-25, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1415), **accepted** this
extraction and all nine routes, and needed no correction. The full record is
[REV-PAPER-CALEGARI-DIMITROV-TANG-25.md](../reviews/REV-PAPER-CALEGARI-DIMITROV-TANG-25.md).

Both recorded hashes reproduce. The offprint is an encrypted PDF (RC4-128, `R = 3`), so the reviewer
implemented the standard security handler and read the **published** text; every page number checked
is the journal's. 148 items, all 129 missing ones routed exactly once; the 124 numbered environments
in the published text are all cited; 147 of 158 locator checks land exactly and the other eleven are
`proof of X, p.N` locators whose statement sits on the previous page, two of which were read in
full. All 28 declarations behind the 14 library items resolve at the pins. The three Part II titles
reproduce their parents' atlas titles exactly, two of those parents being Tau Ceti roadmaps, the
areas are galaxy ids, and the three proposed roadmap ids appear in no other extraction. Each source
route was checked against its layer's description, including G7, whose text defines enormous image
by `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, which is what route 9 sends there.

All eleven findings are **confirmed**. E1's printed `H¹(Γ(5), F₃)^{SL₂(F₅)} = 0` is false as stated,
since `SL₂(F₅)` is perfect and `H¹(SL₂(Z), F₃) = F₃` restricts injectively; E4's matrix factor is
inverted; E6's counterexample works with `E = ⟨−I⟩`, so the printed kernel is `⟨E, Γ(N)⟩ ∩ Γ(p)`;
E7 is a real gap, because §4.3 uses `G_{2N} ⊂ ⟨E, Γ(2N)⟩` while the construction gives only level
dividing `2N`; E10 was recomputed coefficientwise, and the printed identity is exactly the negative
of the correct one; and E11's missing case `p = ℓ = 2` is repaired by `SL₂(Z₂)^{ab} ≅ Z/4`. The
remaining five are constant- and index-level slips, each printed as quoted.
