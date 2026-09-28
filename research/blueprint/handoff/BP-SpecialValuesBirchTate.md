# BP-SpecialValuesBirchTate — first checkpoint (B.1, B.2, B.3, B.7)

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
