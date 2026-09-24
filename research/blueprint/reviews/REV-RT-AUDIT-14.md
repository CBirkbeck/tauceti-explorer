# REV-RT-AUDIT-14 — independent verification

Codex / codex-7e92bd · 2026-09-24 · explorer `e47d5d09cdcee887d2f7987e2168f2a95a1d0777`

**All four findings are confirmed:** two high, one medium and one low.
The two mathematical mistakes are in the audit’s statements, not in the source papers.
The proposed corrections preserve the targets’ existing library classifications.

| Finding | Severity | Correction |
| --- | --- | --- |
| RT-AUDIT-14/1 | High | Include the quasi-character’s real exponent in Tate’s convergence region. |
| RT-AUDIT-14/2 | Medium | Credit the existing inverse-transpose characteristic-polynomial formula. |
| RT-AUDIT-14/3 | High | Restore infinite q-Pochhammer factors before asserting finite exponent support. |
| RT-AUDIT-14/4 | Low | Describe continuous operators without asserting continuity in the group variable. |

AUDIT-14 was completed by `claude6/2`. Its review was completed by `claude4/1`
after a `claude/1` limit entry. The red team was Codex / `codex-c83e7a`
(issue #1578, PR #2670). None is this session. Bot comment 5806616459 confirmed
claim 5806615198 on issue #1577; I reread the complete issue after confirmation.

I read all four findings, their report discussion, the original review, the affected
audit entries and roadmap contracts, and the declaration statements with ambient
hypotheses. The report’s 411-citation inventory and whole-batch absence claims are
not recertified by this four-finding review. Full public source URLs and hashes
are recorded in the JSON.

**Tate convergence.** [Tate’s thesis, §2.3 and Definition/Lemma 2.4.1](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf)
uses the total quasi-character exponent. I inspected PDF pages 14, 16 and 17
(printed 2.07, 2.09 and 2.10), including the page images. If
`|χ(x)| = |x|^e(χ)`, twisting by `|x|^s` changes it to `e(χ)+Re(s)`.
The correct uniform sufficient region is positive total exponent.

The counterexample can be checked without any continuation theorem. For
`F=Q_p`, `f=1_(Z_p)`, `χ=|·|_p^(-1)` and `s=1`, the integrand is one on every
annulus `p^m Z_p^×`, `m≥0`. Normalize multiplicative Haar measure so units have
measure one. Translation by `p^m` preserves that measure, so integrating over
the first `N+1` disjoint annuli gives `N+1`, which diverges. Yet `Re(s)>0`.
For a unitary character the absolute annular contributions are `p^(-m Re(s))`,
which confirms the intended unshifted control case.

Use `e(χ)` or `σ(χ)` for the real exponent to distinguish it from a conductor.
Do not replace the sufficient half-plane by an iff for every test function;
a function supported away from zero may converge on a larger region. The roadmap
only asks for the stated half-plane; the audit introduced the unjustified bound.
Mathlib’s `mellin` and `mellin_cpow_smul` were read as supporting real-place
normalization checks, not as a proof of the local-field theorem.

**The contragredient input.** The public
[`Matrix.charpoly_inv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean#L314) and
[`Matrix.charpoly_transpose`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean#L167) compose to give

`charpoly((A⁻¹)ᵀ) = (−1)^n C(det(A)⁻¹) charpolyRev(A)`.

The statements assume a commutative coefficient ring, a finite decidable index
type, and `IsUnit A` for the inverse formula. At this generality the determinant
inverse is the ring inverse. `charpolyRev` is `det(1−XA)`, and `reverse_charpoly`
connects it to the usual characteristic polynomial. Three exact symbolic examples
in dimensions 1, 2 and 3 checked the sign and determinant factor. The source
theorems establish the general input; the examples are diagnostic only.
Add the two citations to the existing three, staying within the five-citation
limit. Preserve the remaining tensor-product and Satake-identification obligations.

**The Habiro product.** I inspected the formulas on printed pages 12 and 24 of
[GSWZ, 13 August 2025 version](https://guests.mpim-bonn.mpg.de/stavros/publications/habiro-ring-number-field.pdf), including both page images.
Definition 1.7 and Theorem 6 use `(q^i t^n;q)_∞`, not `1−q^(i/2)t^n`.
The opening proof gives lower-bounded i-support in `Z((q))[[t]]` before the
finite-support conclusion. The admissible object is stated in `Q(q)[[t]]`.

For the one-by-one matrix `A=(1)`, direct substitution in the n=1 summand gives
`[t]F_A=−q/(1−q)`. The audit’s finite-support binomial exponents instead give a
finite Laurent polynomial `−Σ_i c_(1,i)u^i` for `u=q^(1/2)`. The rational function
`−u²/(1−u²)` has a pole at `u=1`; its residue there is `1/2`. Laurent polynomials
cannot have such a pole. Higher-degree t factors do not affect this coefficient.
A single Pochhammer `(qt;q)_∞` already contains infinitely many binomials and
has the required linear coefficient. No identity for the entire series is needed.

Restore the Pochhammer product and identify the same exponents in both affected
targets. Preserve the symmetric-integral matrix hypothesis; positive definiteness
belongs to a different analytic branch. A half-power convention must transform
both the argument and the Pochhammer base, not discard that base.

**Continuity.** The declaration and ambient variables in
[`ContRepresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L46) contain no topology on `G`.
They assert that each element acts by a continuous linear operator on `V`.
That is weaker than separate continuity of `G×V → V`. Replace both instances
of “separately continuous” in the note, retaining the outstanding group-variable
and joint-continuity requirements. No classification change follows.

The four affected layers match the coverage mirror on target text, note, library
status, layer verdict and duplicate records. The mirror omits per-target citations;
this is a comparison of common fields. The normal audit-fix intake should regenerate
coverage after applying the confirmed corrections.

Four source files were byte-compared with the pinned Mathlib Git blobs. The PDFs
were downloaded completely and hashed before reading. No Lean file was changed
or compiled; pinned build artifacts are unavailable. The JSON checker and intake
are appropriate for these two review deliverables, not a blueprint packet check.

**PASS:** red-team checker; exact coverage of all four supplied finding IDs with no extras; two-file intake with zero problems. All 20 captured input blobs and both output guards matched fresh main `9aef8a776a9990e4a58cee945e1b80f3100c8906`. The bot-confirmed claim and issue instructions were unchanged before publication.
