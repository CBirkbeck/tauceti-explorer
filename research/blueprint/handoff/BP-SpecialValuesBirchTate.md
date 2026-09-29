# BP-SpecialValuesBirchTate — checkpoint 5 (B.6)

Agent: Claude Code, session cc-fb70e5, 2026-09-29. Refs #998. The claim is confirmed by the bot.

## What this checkpoint supplies

**B.6 is partial** (5 nodes, 1 planet). Sources:
- Kurihara, *On class groups and Iwasawa modules of CM-fields* (author copy 2025, the catalogue copy, SHA-256 22ebb98e…), §4 in full.
- Kolster 1989 (as in B.5).

**Nodes:**
- `B.6/kurihara-kolster-series-dictionary`: G_F(T) = (T + 1 − u)·g(u(1 + T)^{−1} − 1), i.e. (G_F) = ι_u((γ − 1)g). It is proved from the two interpolation properties at even n and the Weierstrass identity theorem, and checked at s = −1 for ℚ.
- `B.6/kurihara-main-conjecture-over-f`: char X_{F_∞,S} = ((γ − 1)g), from Kurihara's Theorem 4.1 with k = F (I.9) and his remark at the augmentation prime.
- `B.6/kolster-kurihara-comparison-table`: the table the stage asks for, entries (a)–(h), tested on ℚ.
- `B.6/federer-conjecture-all-totally-real`.
- `B.6/birch-tate-all-totally-real` (planet): the Birch–Tate conjecture for every totally real field.

**The table.** The entries are:
- (a) the module comparison, with the factor 2^{[F:ℚ]};
- (b) Kummer duality at 2, with Kurihara's order-2 cokernel;
- (c) Burns–Flach compact support;
- (d) the specialisation κ²;
- (e) H³ = ℤ_2 against Kolster's pole factor;
- (f) the real places, contributing (Λ/2)^{[F:ℚ]};
- (g) the S-Euler factors;
- (h) the identification of W₂.

(c), (d), (e), (g) and (h) are proved here or by named suppliers. (a), (b) and (f) are the 'equality comparison to Kurihara' proof obligation, and are requested from IntegralIwasawaTheory I.10, whose stated scope it is.

**No new source issues** in Kurihara §4.

**Requests.**
- New:
  - IntegralIwasawaTheory I.9: Kurihara 4.1 at p = 2, k = F.
  - IntegralIwasawaTheory I.10: the module comparison.
- Consumer added: AutomorphicPadicLFunctions L3.

**Validation.**
- `check_blueprint --index`: 0 errors, 0 warnings.
- `check-files`: 0 problems.
- Every excerpt was checked against the page text.
- The B.6 Lean section elaborates in the Mathlib-only harness (exit 0). The full file imports Tau Ceti.

## Resume

1. B.8: the 2-part at real places (Rognes–Weibel).
2. B.3: the general real quadratic factorisation (Kronecker character).
3. B.7: show that changing S commutes with the comparisons.

## Checkpoint 4 (B.8)

Agent: Claude Code, session cc-fb70e5, 2026-09-29. Refs #998. The claim is confirmed by the bot.

## What this checkpoint supplies

**B.8 is partial** (4 nodes, 1 planet). Source: Kolster's Park City notes (the same author copy), Lecture 1 §2 (pp. 9–12) and Lecture 2 §3 (pp. 13–16).

**Nodes:**
- `B.8/cohomological-h2-model` (definition): H²(𝓞_F, ℤ(n)) = ∏_p H²_ét, h_n(F), the H¹ model with its ranks and w_n-torsion, and h_2 = #K₂.
- `B.8/lichtenbaum-formula-statements` (definition). LichtenbaumFormulaOddPart is Conjecture 3.6 away from 2; MotivicLichtenbaumFormula is Conjecture 3.7. Tests at ℚ, n = 2:
  - the odd part holds;
  - the K-theoretic formula fails at 2 (2/48 against 1/12);
  - the motivic formula holds exactly (2/24).
- `B.8/odd-primary-even-weight-euler-characteristic`: Theorem 3.3 and Corollary 3.4 for every even n. This generalises B.4's node for n = 2.
- `B.8/odd-primary-lichtenbaum-totally-real` (planet): the odd part of Lichtenbaum for totally real F in even weight, via Quillen–Lichtenbaum (M.7) and N.5's odd K-groups.

**Source issue E6 (error, affects nothing, new):** p. 11 prints the ranks of H¹(o_F, ℤ(n)) interchanged (r₂ for odd n, r₁ + r₂ for even n). This contradicts Proposition 2.1(5) and Borel's ranks; for F = ℚ, n = 2 the printed rank is 1 but the group is finite.

**Requests.**
- New:
  - BorelRegulators R.4: the regulator covolume.
  - BorelRegulators R.5: the order of vanishing, the leading coefficient, and Borel's rationality.
  - MotivicEtaleKTheory M.7: the Quillen–Lichtenbaum outputs at odd ℓ, and the corrected sequences at 2.
  - ArithmeticKTheory N.5: the torsion of the odd K-groups.
- Extended: I.5, I.2, L2, N.6, M.3 and AutomorphicPadicLFunctions L3 (interpolation at 1 − n).

**Remaining in B.8:**
- the correction at 2 with real places (Rognes–Weibel, M.7), not read;
- the equivariant refinement, not stated;
- the formula for fields with complex places, which is stated but not proved.

**Validation.**
- `check_blueprint --index`: 0 errors, 0 warnings.
- `check-files`: 0 problems.
- Every excerpt was checked against the page text.
- The B.8 Lean section elaborates in the Mathlib-only harness (exit 0); every API and test name has a declaration. The full file imports Tau Ceti and is not built here.

## Resume

1. B.6: Federer's conjecture for every totally real field from I.9–I.10, with the comparison table.
2. B.8: the 2-part at real places (Rognes–Weibel).
3. B.3: the general real quadratic factorisation.
4. B.7: show that changing S commutes with the comparisons.

## Checkpoint 3 (B.4)

Agent: Claude Code, session cc-fb70e5, 2026-09-29. Refs #998. The claim is confirmed by the bot.

## What this checkpoint supplies

**B.4 is source-decomposed** (5 nodes, 1 planet). Source: Kolster's Park City notes (the same author copy, SHA-256 5772ace9…). Read: Lecture 1 §§1–2 (Main Conjecture 1.3, Propositions 2.1 and 2.3, Corollary 2.2) and Lecture 2 §3 (Propositions 3.1–3.2, Theorem 3.3, Corollary 3.4).

**Nodes:**
- `B.4/k2-ell-part-unchanged-by-inverting-ell`: from B.7's S-integer order formula, since Nv − 1 is an ℓ-adic unit. This is the stage's 'elementary fact in the same diagram'.
- `B.4/k2-ell-part-as-etale-cohomology`: Tate, K₂(𝓞_F) ⊗ ℤ_ℓ ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)) for odd ℓ, by limits from MotivicEtaleKTheory M.3.
- `B.4/w2-ell-part-as-etale-cohomology`: the denominator group. H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))_tors ≅ W₂(F)_ℓ by the coefficient sequence, and it is all of H¹ for totally real F.
- `B.4/etale-euler-characteristic-and-zeta`: Kolster's Theorem 3.3 at χ = 1, n = 2, with the trivial-character pole exactly when W₂(F)_ℓ ≠ 0.
- `B.4/odd-primary-birch-tate` (planet).

B.5's final node now depends on this node instead of the stage.

**Source issues (Park City notes, new):**
- E3 (misprint): "cp. Theorem 3.4" should read Corollary 3.4.
- E4 (misprint): "H⁰(f, …)" should read H⁰(F, …).
- E5 (error, affects nothing): H¹(o′_F, ℤ_p(n))_tors ≅ H⁰(o′_F, ℚ_p/ℤ_p(n)) is stated for every n ∈ ℤ but fails at n = 0.

The published Park City volume was not accessed.

**Requests.**
- New:
  - IntegralIwasawaTheory I.5: Wiles's main conjecture with μ = μ(G).
  - MotivicEtaleKTheory M.3: Tate's S-integer comparison.
- Extended:
  - ArithmeticKTheory N.6: Proposition 2.1, Corollary 2.2, descent and codescent.
  - IntegralIwasawaTheory I.2: the Kummer–Selmer identification, and no finite submodules of the twisted even components.
  - IntegralIwasawaTheory L2.
  - AutomorphicPadicLFunctions L3: the G_ψ/H_ψ presentation and the interpolation at −1.

**Validation.**
- `check_blueprint --index`: 0 errors, 0 warnings.
- `check-files`: 0 problems.
- Every excerpt was checked against the page text.
- The B.4 Lean section and its two checked examples elaborate in the Mathlib-only harness (exit 0). The full file imports Tau Ceti and is not built here.

## Resume

1. B.6: Federer's conjecture for every totally real field from IntegralIwasawaTheory I.9–I.10, with the comparison table. Plug it into B.5/federer-implies-two-primary-birch-tate.
2. B.3: the general real quadratic factorisation.
3. B.7: S-change commutes with the comparisons. The ℓ-part case is B.4's first node.
4. B.8: the Lichtenbaum statements (Kolster Conjectures 3.6–3.7).

## Checkpoint 2 (B.5)

Agent: Claude Code, session cc-fb70e5, 2026-09-29. Refs #998. The claim is comment 5883524481, confirmed by the bot.

## What this checkpoint supplies

**B.5 is source-decomposed** (7 new nodes: 1 definition, 5 theorems or lemmas and 1 comparison; 3 planets). Sources:
- Kolster 1989 (Canad. Math. Bull. 32), read in full; SHA-256 6b8052fc…, identical to the programme's catalogue copy.
- Greither 1992, §1 and Lemma 3.3. Its §§1–4 are decomposed in EulerSystemsCyclotomicMainConjecture L4, whose nodes are imported.

**Nodes.**
- `B.5/federer-main-conjecture` (definition, planet): FedererMainConjecture(F), meaning (G_F) = (2^{[F:ℚ]}f_F) in ℤ₂[[T]]. It has 5 API items and 3 tests: ℚ, ℚ(√2), and the unnormalised non-example. The action convention on the dual is fixed so that Kolster's twist f(u^{−1}(1 + T) − 1) is right.
- `B.5/tame-kernel-two-part-via-iwasawa`: Kolster's Theorem 1, |K₂(o)(2)| = 2^{[F:ℚ]}·|(𝒯 ⊗ A_∞^-)^Γ|, for every totally real F.
- `B.5/minus-module-coinvariant-order`: Kolster's Lemma 2, for every totally real F.
- `B.5/federer-implies-two-primary-birch-tate` (planet): Kolster's Theorem 5, for every totally real F. It uses w₂^{(2)}(F) = 2^{e+1} from ArithmeticKTheory N.4/two-primary-w-invariant.
- `B.5/federer-conjecture-for-abelian-fields` (comparison): Federer's conjecture for every totally real F abelian over ℚ, from Greither's Theorem 3.2 and Lemma 3.3. Neither paper writes this comparison, so the proof is planned here:
  - the reduction to F′ = F(μ_{2^∞}) ∩ ℚ(μ_m), which is unramified at 2;
  - Kolster's Γ as a possibly diagonal subgroup {(φ(γ), γ)} of Δ′ × Γ′, as happens for F = ℚ(√6);
  - the characters of F are exactly the χ̌ρ with ρ(γ₁) = χ(φ(γ₁));
  - matching Weierstrass zeros through the characters of Gal(F_∞/ℚ);
  - μ(f_F) = 0 by Ferrero–Washington, and μ(G_F) = [F:ℚ] from the ½-normalisation.
- `B.5/two-part-birch-tate-abelian` and `B.5/birch-tate-for-real-abelian-fields` (planet): the full formula for totally real abelian fields, with odd ℓ from stage B.4.

Kolster's Theorem 1, Lemma 2 and Theorem 5 hold for every totally real field, so B.6 needs only Federer's conjecture from IntegralIwasawaTheory I.9–I.10.

**Source issues (new; no erratum on Cambridge Core or the web):**
- SpecialValuesBirchTate/E1: "ζ_e(−1)" should read ζ_E(−1) (p. 250).
- SpecialValuesBirchTate/E2: "Since A_∞^- has no non-trivial finite Λ-submodules" should be about the dual Ǎ_∞^- (p. 250). A_∞^- is a union of finite submodules. Both are misprints and affect nothing.

**Requests.**
- New:
  - ArithmeticKTheory N.6: Kolster's 1987 exact sequence.
  - IntegralIwasawaTheory I.2: the minus class module, Federer's no-finite-submodule theorem, and Iwasawa's 1983 Proposition 2.
  - IntegralIwasawaTheory L2: the coinvariant lemma and the twist rule.
  - IntegralIwasawaTheory L4: Ferrero–Washington at 2.
  - DirichletPadicLFunctions L2: second-kind twists at 2, with the root-of-unity convention made explicit.
- Extended: AutomorphicPadicLFunctions L3, for L₂(χ₀, s) = G_F(u^s − 1)/(u^s − u), G_F ∈ 2^{[F:ℚ]}Λ, the value at −1, and the abelian factorisation.

**Validation.**
- `check_blueprint --index`: 0 errors, 0 warnings.
- `check-files`: 0 problems.
- Every new excerpt was checked against the page text of its source.
- The suggested file still imports Tau Ceti modules, so it cannot be compiled on this server. The B.5 section was elaborated in a Mathlib-only harness with the same placeholders (exit 0, only `sorry` warnings). The four new checked examples compile on their own (exit 0).

## Resume

1. B.4: the odd-primary valuation identity. Tate's comparison (K2SymbolsBrauer T.7, MotivicEtaleKTheory M.3), localisation (ArithmeticKTheory N.2), I.5's Euler characteristic, and Kolster's Park City Theorem 3.3.
2. B.6: Federer's conjecture for every totally real field from I.9–I.10 (Kurihara), with the comparison table the stage asks for. Plug it into B.5/federer-implies-two-primary-birch-tate.
3. B.3: the general real quadratic factorisation (Kronecker character).
4. B.7: show that changing S commutes with the B.4–B.6 comparisons.
5. B.8: the Lichtenbaum statements.

## Checkpoint 1 (B.1, B.2, B.3, B.7)

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #998. The claim is comment 5874444221, confirmed by the bot. No packet existed before this checkpoint.

## What this checkpoint supplies

There are 23 nodes on 62 baseline declarations: 2 definitions, 10 lemmas, 10 theorems and 1 application, with 9 API items, 9 unit tests and 6 planets.

- **B.1 (closed).** `BirchTateFormula F` is the proposition ζ_F(−1) = (−1)^{[F:ℚ]}·#K₂(𝓞_F)/w₂(F). It is built on three imported objects:
  - K₂ from K2SymbolsBrauer T.1/k2-definition, finite by ArithmeticKTheory N.3;
  - w₂ from ArithmeticKTheory N.4;
  - the continued ζ_F, requested from AL.1.

  The unit tests catch three plausible wrong forms: the twist w₁ in place of w₂, a missing sign, and the field ℚ in place of its ring of integers.
- **B.2 (partial).**
  - Γ_ℝ(−1) = −2π and Γ_ℝ(2) = 1/π.
  - ζ_F(σ) is real and at least 1 for real σ > 1.
  - ζ_F is recovered from Λ_F through the entire reciprocal gamma factors. This is the "gamma-factor limit" the stage asks for, so no totalised gamma value is used.
  - The sign: ζ_F(−1) = (−1)^n |d_F|^{3/2} ζ_F(2)/(2π²)^n.
  - The formula fails for every field with a complex place.
  - Also: the absolute-value and primewise forms, the reconstruction of a positive rational from its prime valuations, and the denominator consequence.
- **B.3 (partial).**
  - ζ_ℚ equals riemannZeta off 1, so ζ_ℚ(−1) = −1/12.
  - #K₂(𝓞_ℚ) = 2, and Birch–Tate for ℚ follows.
  - For ℚ(√5):
    - the ideal count is 1 ⍟ χ₅;
    - ζ_F = ζ·L(χ₅), so ζ_F(−1) = 1/30, from Mathlib's Hurwitz values;
    - w₂ = 120;
    - the Birch–Tate check uses #K₂ = 4, which is requested.
- **B.7 (partial).**
  - The S-modified zeta function, on Tau Ceti's `EulerProductData.restrictAway`.
  - The Euler factors at −1.
  - #K₂(𝓞_{F,S}) = #K₂(𝓞_F)·∏(Nv − 1), from T.5's S-integer sequence.
  - The S-integral formula, with the sign (−1)^{[F:ℚ]+|S|}.

**Source issue.** The K-book's "pole of order r₂ at s = −1" (VI.8.6 and the note after VI.8.7) is already on record as ArithmeticKTheory/E18. It is cited, not recorded again, and this packet has no new source issues. Kolster's Conjecture 3.5 writes the sign as ±. That is an omission of the sign, not an error.

## Requests and gaps

**Requests:**

- AutomorphicLFunctionsAndLocalFactors AL.1: the continued ζ_F, and the completed Λ_F with Λ_F(1 − s) = Λ_F(s).
- AutomorphicPadicLFunctions L3: rationality of ζ_F(1 − 2k), and Deligne–Ribet integrality.
- K2SymbolsBrauer T.5: a certified #K₂(𝓞_{ℚ(√5)}) = 4.

**Gap:** the upper bound in K₂(ℤ) ≅ ℤ/2. It is recorded as a gap in T.5, and B.3 inherits it.

## Validation

- `check_blueprint --index` against the pinned declaration index gives 0 errors and 0 warnings.
- Every excerpt was checked against the text of the source read.
- Every name in the packet appears in the Lean file.
- **The suggested file was not compiled.** There is no pinned build on the shared machine.

In the Lean file, the three imported objects (`dedekindZetaCont`, `K2`, `wInvariant`) are marked placeholders, following ArithmeticKTheory N.7's file.

## Sources

- Weibel, *The K-book*, author draft of 29 August 2013, VI.8.1–8.8.
- Kolster, *Special values of L-functions at negative integers* (Park City notes, 2009), Lectures 1–2.

Kolster 1989 (Canad. Math. Bull. 32), which B.6 needs, was not read.

## Resume

1. B.3: the general real quadratic factorisation needs a Kronecker character, which neither library has.
2. B.4: plan the odd-primary valuation identity. The inputs are:
   - T.7 and M.3 (Tate's comparison);
   - N.2 (localisation to 𝓞_F[1/ℓ]);
   - I.5 (the Euler characteristic);
   - Kolster, Theorem 3.3.
3. B.5 and B.6: the abelian and 2-primary routes, from Kolster 1989 and IntegralIwasawaTheory I.9–I.10.
4. B.7: show that changing S commutes with the B.4–B.6 comparisons.
5. B.8: the Lichtenbaum statements, with BorelRegulators R.5.
