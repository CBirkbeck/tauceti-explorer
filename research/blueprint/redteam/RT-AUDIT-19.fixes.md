# RT-AUDIT-19: fixes

Fixer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #4014, job FIX-RT-AUDIT-19).
- Findings: `RT-AUDIT-19.result.json`.
- Verdicts: `RT-AUDIT-19.review.json`.
- Two findings, both high severity, both confirmed. Both are corrections to the audit's account of the finite-field layers of `FiniteFieldsAndCharacterSums`; neither changes a library classification or a layer verdict.

The only file changed besides this report is `research/blueprint/audit/AUDIT-19.result.json`, in the `FiniteFieldsAndCharacterSums` entry: its `summary`, and in layer `FiniteFieldsAndCharacterSums:FF.2` the `target` and `note` of the second target and of the fifth (degenerate-case) target. Every `library` value, every declaration list, both layer verdicts (FF.1 partly built, FF.2 not built), the `duplicates` lists and the `review` block are unchanged. `data/library-coverage.json` is left for the orchestrator to regenerate (`scripts/merge_library_audit.py`), as the finding asks.

## RT-AUDIT-19/1 (high, error): the multiplicative Weil bound now excludes constant multiples of e-th powers and defines m

**Finding.** The second FF.2 target stated `|∑_x χ(f(x))| ≤ (m − 1)√q when f is not an ord(χ)-th power`, without saying where the power is taken or what `m` is. Read in `F_q[X]`, this is false. Take q = 5, χ the quadratic character with χ(0) = 0, and f = 2X². Then f is not a square in `F_5[X]`, but the sum is −4, while the bound is 0 for m = 1 distinct root, or √5 if m were read as the degree.

**What I checked.**
- The counterexample, by hand. The squares in `F_5^×` are 1 and 4. So χ(2x²) = χ(2) = −1 for x ≠ 0 (2·1 = 2 and 2·4 = 3 are non-squares), and χ(0) = 0. The sum is −4.
- The convention, at Mathlib 082e2d3. `quadraticChar` (`Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`) vanishes at 0, is 1 on nonzero squares and −1 on non-squares, and every `MulChar` sends non-units to 0. So the audit's zero-extended convention is the library's.
- The equivalence that the corrected target states. For nonzero f ∈ F_q[X] and e ≥ 1, the following are equivalent:
  1. f = c·h^e with c ∈ F_q^× and h ∈ F_q[X];
  2. f is an e-th power in F̄_q[X].

  (1) ⇒ (2) because c has an e-th root in F̄_q. For (2) ⇒ (1), write f = c·∏π_i^{a_i} with distinct monic irreducible π_i. Since F_q is perfect, each π_i is separable, and distinct π_i have no common root. So every root of π_i has multiplicity exactly a_i in f. If f is an e-th power over F̄_q, then e divides every a_i, and f = c·(∏π_i^{a_i/e})^e.
- The planned nodes the finding says to align with, in `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`:
  - `FF.2/weil-bound-multiplicative`: χ of exact order e ≥ 2, g not c·h^e over F̄, m the number of distinct roots in F̄, bound (m − 1)√q;
  - `FF.2/multiplicative-perfect-power-sum`: the degenerate sum χ(c)^{[L:F]}(|L| − #{h = 0}), and the converse descent from F̄ to F;
  - `FF.2/weil-bound-mixed`: ψ ≠ 1, deg f = n ≥ 1 prime to p, χ arbitrary, g nonzero with m distinct roots, bound (m + n − 1)√q.

  The corrected audit text uses the same hypotheses. I added no node and no request, since the packet already plans all three statements.

**What I changed** in `AUDIT-19.result.json`, layer FF.2:
1. **Second target, `target`.** It now reads: for a multiplicative character χ of F_q of order e > 1, complex-valued and extended by χ(0) = 0, and a nonzero f ∈ F_q[X] not of the form c·h^e with c ∈ F_q^× and h ∈ F_q[X] (equivalently, not an e-th power in F̄_q[X]), |∑_{x∈F_q} χ(f(x))| ≤ (m − 1)√q, with m the number of distinct roots of f in F̄_q.

   The mixed sums are now a separate statement with their own hypotheses, as the finding and the review require. The bound is |∑ χ(f(x))ψ(g(x))| ≤ (m + n − 1)√q, where:
   - ψ is a nontrivial additive character;
   - g has degree n ≥ 1, prime to p;
   - χ is any zero-extended multiplicative character;
   - f is nonzero, with m distinct roots in F̄_q.

   Its hypotheses are those of `FF.2/weil-bound-mixed`. They are not derived from the multiplicative bound: the cancellation comes from the additive phase, so f needs no non-degeneracy condition. By Grothendieck–Ogg–Shafarevich, L_χ(f) ⊗ L_ψ(g) on A¹ minus the roots of f has H¹_c of dimension m + n − 1, and H⁰_c = H²_c = 0.
2. **Second target, `note`.** The original sentence is kept. Added:
   - that the degenerate class is the constant multiples c·h^e, not only the e-th powers in F_q[X];
   - the perfectness argument for the equivalence of the two descriptions;
   - the planned node ids.
3. **Fifth target (degenerate cases).**
   - The `target` now names the constant multiples c·h^e with c ∈ F_q^× (e = ord χ) among the multiplicative perfect powers that receive no square-root bound.
   - The `note` gives the exact degenerate sum χ(c)·#{x : h(x) ≠ 0}, and records 2X² over F_5 as the rejection test (sum −4 against the bounds 0 and √5). It adds the opposite test from the packet: X² for a cubic character is a perfect power but not c·h³, and its sum is 0. It points to the planned nodes `FF.2/multiplicative-perfect-power-sum` and `FF.2/artin-schreier-trivial-sum`.

**Not changed.** `library` stays `absent` for both targets, the declarations cited under the second target are kept, and the FF.2 verdict stays `not built`.

## RT-AUDIT-19/2 (high, error): the summary's Gauss-sum product now inverts both characters

**Finding.** The roadmap summary wrote g(χ)g(χ⁻¹) = q with the additive character suppressed. For a fixed primitive ψ the product is χ(−1)q. For example, over F_3 the quadratic character is its own inverse, χ(−1) = −1, and g² = −3. The detailed FF.1 target already inverts both characters correctly.

**What I checked** at Mathlib 082e2d3, `Mathlib/NumberTheory/GaussSum.lean` and `Mathlib/NumberTheory/JacobiSum/Basic.lean`, reading the statements and their section variables:
- `gaussSum_mul_gaussSum_eq_card` (line 188), for χ ≠ 1 and ψ primitive on a finite field, with values in a domain: gaussSum χ ψ · gaussSum χ⁻¹ ψ⁻¹ = #F;
- `gaussSum_mul_gaussSum_pow_orderOf_sub_one` (line 205): with ψ fixed, gaussSum χ ψ · gaussSum χ^(ord χ − 1) ψ = χ(−1)·#F, and χ^(ord χ − 1) = χ⁻¹;
- `gaussSum_sq` (line 222): the quadratic case, g² = χ(−1)·#F;
- `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum` (line 193, χφ ≠ 1, ψ primitive) and `gaussSum_pow_eq_prod_jacobiSum` (line 342, ord χ ≥ 2, ψ primitive). Both use one fixed primitive ψ throughout. `jacobiSum_mul_jacobiSum_inv` (line 203) involves no additive character.

I also redid the F_3 computation exactly. With ψ(x) = ζ^x for a primitive cube root of unity ζ, g = ζ − ζ², so g² = ζ² − 2 + ζ = −3, which is χ(−1)·3.

**What I changed.** In the `FiniteFieldsAndCharacterSums` summary, the phrase "Gauss and Jacobi sums with g(χ)g(χ⁻¹) = q, J = gg/g, J·J(χ⁻¹,φ⁻¹) = q and g^n = χ(−1)q∏J" now reads:

> Gauss and Jacobi sums with g(χ,ψ)·g(χ⁻¹,ψ⁻¹) = q for χ nontrivial and ψ primitive (with ψ fixed the product is g(χ,ψ)·g(χ⁻¹,ψ) = χ(−1)q), and, for a fixed primitive ψ, J(χ,φ) = g(χ,ψ)g(φ,ψ)/g(χφ,ψ), J(χ,φ)·J(χ⁻¹,φ⁻¹) = q and g(χ,ψ)^n = χ(−1)q∏J.

This is the finding's preferred repair, matching the detailed FF.1 entry, and it also records the fixed-ψ form it allows. The finding asked only for the product formula. I also made the additive character explicit in the Jacobi and power identities of the same sentence, so that the abbreviated "g" is no longer ambiguous next to the corrected formula. Their content is unchanged, and each matches the cited Mathlib statement.

**Not changed.** The FF.1 targets and their citations (including the correct "g(χ,ψ)·g(χ⁻¹,ψ⁻¹) = q" target), the FF.1 verdict `partly built`, and the FF.2 note that already wrote the product with both characters inverted. No new Gauss-product node is requested.

## Checks

- `python3 research/blueprint/intake.py check-files` on both deliverables: valid JSON, deliverable paths only, no local paths.
- The edited audit round-trips through `json.load` / `json.dumps(indent=1, ensure_ascii=False)` byte for byte, apart from the five changed strings. `git diff` shows exactly five changed lines.
- No Lean was written or compiled. This job corrects statements in the audit, and every declaration named above was read in the pinned Mathlib source.
