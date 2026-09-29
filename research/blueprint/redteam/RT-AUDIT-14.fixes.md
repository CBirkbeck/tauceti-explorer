# RT-AUDIT-14: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4009, job FIX-RT-AUDIT-14).
- **Findings and verdicts.** `RT-AUDIT-14.result.json` and `RT-AUDIT-14.review.json`. The red team made 4 findings. The review confirmed all 4 and rejected none.
- **Scope.** This job covers the 3 confirmed findings of high or medium severity: /1 (high), /2 (medium) and /3 (high). The one confirmed low-severity finding, /4 (the `ContRepresentation` wording in CC.2), is outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-14.result.json`; no other file changes. The audit's `review` object, every layer verdict, every target's `library` value and every `duplicates` list are unchanged. All three findings, and the review of each, say to keep the existing classifications.

**Verification.**
- I read both added declarations at Mathlib 082e2d3, at the stated file and line, and each resolves in the pinned `declarations.tsv` under the stated full name.
- Every target has at most five declarations. The one target that gains citations (AL.4) goes from three to five, so nothing is displaced.

## RT-AUDIT-14/1 (high, error): Tate zeta-integral convergence (AL.1)

**Target "local Tate zeta integral Z(f,χ,s)…".**
- "convergent for Re s > 0" is replaced by convergence for Re s + σ(χ) > 0, where σ(χ) is the real exponent of χ, |χ(x)| = |x|^{σ(χ)}. For unitary χ, this is Re s > 0. This matches Tate's "quasi-characters of exponent greater than 0" (§2.3, Definition/Lemma 2.4.1).
- **Review qualifications applied.**
  - The exponent is written σ(χ), not the finding's a(χ), and the target says it is not the conductor exponent. The same layer uses a(χ_v) for the conductor exponent.
  - The target says the half-plane is a uniform sufficient region, not an iff for each f.
- **Unchanged.** The target stays `partial`, and its Mellin and Gamma citations and its note are kept. The layer stays `partly built`.

## RT-AUDIT-14/2 (medium, library-claim): contragredient characteristic polynomial (AL.4)

**Target "invariance of the Euler polynomial under conjugacy, direct sum, tensor product, duality and scalar extension".**
- **Citations added, both related:**
  - `Matrix.charpoly_inv` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:314), with the hypothesis `IsUnit A`
  - `Matrix.charpoly_transpose` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:167)

  The three existing citations are kept, for five in total.
- **Note.** Only the claimed absence of a contragredient formula is replaced. The new text:
  - states charpoly(A⁻¹) = (−1)^n·C((det A)⁻¹)·charpolyRev(A) for invertible A, with the inverse of det A taken in the ring;
  - applies `charpoly_transpose` to M = A⁻¹ to get the characteristic polynomial of the inverse transpose;
  - names `Matrix.reverse_charpoly` (Charpoly/Coeff.lean:293), which links charpolyRev to det(1 − XA), as the review points out.
- **Still recorded as missing.** The note keeps the tensor-product formula as missing. It also says nothing ties these formulas to Satake parameters or constructs them.
- **Unchanged.** Following the review, the compound target stays `partial`, and the layer stays `not built`.

## RT-AUDIT-14/3 (high, error): the Habiro product basis (HB.8)

**Target "admissible multivariable series…" (targets[0]).**
- **Product.** ∏(1 − q^{i/2}xⁿ)^{c_{n,i}} is replaced by GSWZ's q-Pochhammer product ∏_{0≠n∈ℕ^N} ∏_{i∈ℤ} (q^i xⁿ; q)_∞^{c_{n,i}} (Def. 1.7, eqs. (28)–(29)). The audit's variable x is identified with GSWZ's t, so no half-powers and no change of variable remain.
- **Ambient ring and support.** Following the review:
  - the admissible-series object stays in ℚ(q)[[x]];
  - the expansion is first taken in ℤ((q))[[x]], with the i-support bounded below for each n;
  - admissibility is the support condition that for each n only finitely many c_{n,i} ≠ 0, equivalently L_n(q) = Σ_i c_{n,i}q^i ∈ ℤ[q,q⁻¹].

  The target also states the constant term 1, which any such product expansion needs. No positivity hypothesis is added.
- **Note.** A sentence is appended: no infinite q-Pochhammer symbol (a; q)_∞ is defined in either library. Mathlib's RingTheory/Polynomial/Pochhammer.lean:34 lists q-Pochhammer only as a TODO, and a search of the pinned Tau Ceti tree found none.

**Target "GSWZ Theorem 6…" (targets[2]).**
- This target now names the same c_{n,i}: the exponents of F_A's q-Pochhammer expansion, which a priori have i-support bounded below. Theorem 6 is stated as the upgrade to finite support, which makes F_A admissible.

**Unchanged.** Both targets keep their library values (`partial` and `absent`) and their citations. The symmetric-integral-matrix hypothesis on F_A (targets[1]) is untouched, and the layer stays `not built`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-14.result.json`: 1 file, 0 problems.
- `Matrix.charpoly_inv` and `Matrix.charpoly_transpose` resolve in the pinned `declarations.tsv` (library, full name, file, line). `Matrix.reverse_charpoly` (named only in a note) also resolves, at Coeff.lean:293.
- Every text substitution was asserted to match exactly once. The script also asserted:
  - the `review` object is unchanged;
  - every layer verdict and every target `library` value is unchanged;
  - every target has at most five declarations.
- `git diff --stat`: only `research/blueprint/audit/AUDIT-14.result.json` (19 insertions, 5 deletions), plus this report.
- No Lean file is involved, so nothing was compiled.
