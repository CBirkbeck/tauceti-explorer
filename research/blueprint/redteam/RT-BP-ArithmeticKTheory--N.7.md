# Red team: the ArithmeticKTheory N.7–N.8 blueprint

Claude Code, session `cc-c2c06b`, 30 September 2026. Target: `BP-ArithmeticKTheory--N.7`,
covering N.7 (regular primes and Bernoulli numbers) and N.8 (certified examples). The
packet is by `cc-7b31c4` and its review by `cc-fb70e5`. Issue #4429. I did neither.

**Result: two findings, one medium and one low.** The mathematics of the 15 nodes survives
attack. Both findings concern how the plan is written down: the suggested Lean file, and the
owner of one definition.

## What survives

I recomputed the following:

- **Bernoulli numbers.** The convention bridge B_k^top = (−1)^{k+1}B_{2k} holds; for example
  B₁₂ = −691/2730 and B₁₀ = 5/66.
- **The w-invariant.** w_{2k}(ℚ) = den(B_{2k}/4k) gives 24, 240 and 504, and the test
  correctly notes that the unconverted formula gives 48 at i = 4. The test w₂(ℚ(i)) = 24 is
  right: the image of G_{ℚ(i)} in (ℤ/16)^× is ⟨5⟩, and 5² ≠ 1.
- **Kummer's criterion.** p is irregular exactly when p divides the numerator of some
  B_{2k} with 1 ≤ k ≤ (p−3)/2. A regular p can still divide a numerator (5 divides the
  numerator of B₁₀), but never that of B_{2k}/k.
- **Herbrand–Ribet.** The eigenspace index is ℓ−2k.
- **Theorem 10.6.** It has (ℓ+3)/2 generators, which matches the ℓ = 5 ranks
  1,1,0,0,0,1,0,1.
- **N.8's numbers.** K_*(ℤ) is ℤ, ℤ/2, ℤ/2, ℤ/48, 0, and ℤ/48 is ℤ/2w₂ because ℚ has a
  real place. K₃(ℚ(i)) = ℤ ⊕ ℤ/24. The ℤ[1/p] sequence is exact, since K₁(𝔽_p) → K₁(ℤ) is
  zero. Birch–Tate holds for ℚ.
- **The Lean statements that are written out**: IsRegularPrime, Iwasawa's form, Kummer's
  criterion and the w-invariant formulas are faithful.

## Finding 1 (medium): the suggested file fakes the statements it cannot make

§13 lets a suggested file leave out what it cannot yet state. It forbids replacing a
condition with `def _ : Prop := sorry`. This file does three things instead:

- **`VandiverConjecture … : Prop := by sorry`** is exactly the forbidden pattern, and it was
  avoidable. Mathlib at the pin has `NumberField.maximalRealSubfield`, so Vandiver's condition,
  that ℓ does not divide h(ℚ(ζ_ℓ)⁺), can be stated.
- **Fourteen named theorems read `: True := by sorry`.** They assert nothing and are provable
  by `trivial`, while giving contributors Lean names to converge on. Some are stateable now,
  for example the residue field at the prime above ℓ having ℓ − 1 units. Others need K₂ or
  K₃, which neither library has, and belong in comments naming their owners.
- **`ArithmeticData` and `CertifiedExample`** are `dummy : Unit` structures, although the
  certified-example node lists their fields.

## Finding 2 (low): Vandiver's condition has another owner

IntegralIwasawaTheory L3 already plans "Define Vandiver(p) by p not dividing the class number
of Q(mu_p)^+". This packet defines it again and never mentions IntegralIwasawaTheory, not even
L0, which stage N.7 requires. **Fix:** import the predicate from L3, and keep this packet's
separation rule and its conditional K-theory statements.

## For the maintainer: the placeholder pattern is not local

Across all 145 suggested files:

- **9 files** use `: True := by sorry` theorems. The largest counts are DiamondsAndVStacks
  (332), GlobalShtukasAndFunctionFieldLanglands (254) and GeneralAlgebraicKTheory--K.1 (98).
- **8 files** use `: Prop := by sorry`.

`check_blueprint.py` flags neither pattern, and accepted reviews have let them through. A
checker warning would stop it at submission. Outside the findings, one dated fact: the node
records Vandiver's conjecture as verified up to 163 million, the bound its 2013 source gives.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-BP-ArithmeticKTheory--N.7.result.json`:
  ok.
- No Lean was compiled.
