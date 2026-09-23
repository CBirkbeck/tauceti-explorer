# Review: PAPER-KINGS-SPRANG-25 (Kings–Sprang, Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation)

Job `REV-PAPER-KINGS-SPRANG-25` (issue #1066), by Claude Code, session `cc-d67081`, 23 September
2026. **Verdict: accept.** All four routes are accepted. All eight recorded mistakes are confirmed,
two of them by computations I did myself. One correction was made: the missing source hash.

## What was read

- **arXiv [1912.03657](https://arxiv.org/abs/1912.03657)v4** (14 September 2024, "Final version. To
  appear in Annals of Mathematics"), 86 pages, fetched into scratch.
- Every recorded mistake at its locator, with **Lemma 3.16 and the definitions of `vol` and `l̃` read
  on page images**, since the contraction signs are exactly what finding E2 is about and pdftotext
  loses the formulas.
- **Erratum check:** arXiv stops at v4, which is itself the final version; Crossref's record of
  `10.4007/annals.2025.202.1.1` has no `update-to`, `updated-by` or relation. The published text
  (Ann. of Math. 202 (2025), no. 1, 1–109) is paywalled and was not compared, as the extraction says.

## The correction

**The source block recorded no `sha256`.** Every other extraction I reviewed today carries one, and
without it the locators cannot be tied to a fixed file — arXiv keeps versions immutable, so the hash
is the thing that makes "v4, p. 37" checkable. I fetched
<https://arxiv.org/pdf/1912.03657v4>, hashed it, and recorded
`fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72` with a note saying the review
supplied it. Nothing else changed: no item, status, route or locator.

## Mistakes in the paper (`sourceIssues` E1–E8)

All eight confirmed. Four are classified `error`, which is a high proportion, so they got the most
work.

- **E3 (error) — verified by computation.** The proof of Theorem 3.20 expands
  `1/(π‖l/√r‖²_H + l̃)^{j+1}` as `Σ_b ((j+b)!/j!) (π‖l/√r‖²_H)^{−(b+j+1)} l̃^{[b]}`. For a nilpotent
  `l̃` with divided powers, `(A + l̃)^{−(j+1)} = Σ_b (−1)^b C(j+b,b) l̃^b A^{−(j+b+1)}` and
  `l̃^b = b!·l̃^{[b]}`, so the coefficient of `l̃^{[b]}` is `(−1)^b (j+b)!/j!·A^{−(b+j+1)}`. I expanded
  `(A + t)^{−(j+1)}` as an exact rational power series for `j = 0, 1, 2` and `b ≤ 5`: every
  coefficient matches. **The printed series omits `(−1)^b` and is wrong for every odd `b`**, which is
  what forces the alternating sign in Definition 3.15 and in the current solving
  `∇″(φ^{(n)}) = δ_f vol`.
- **E2 (error) — base case verified from the paper's own definitions.** On p. 36 the paper sets
  `vol := ((2πi)^d/vol(𝒜)) ⋀_{i=1}^d dz_i ∧ dz̄_i` and `l̃ := Σ_i (l̄_i ū_i)/r_i`, viewed as an
  **anti-holomorphic** vector field, i.e. `Σ_i (l̄_i/r_i) ∂/∂z̄_i`. Contracting the `2d`-form,
  `dz̄_k` sits at position `2k`, so `ι_{∂/∂z̄_k}` carries sign `(−1)^{2k−1} = −1` and
  `ι_l̃ vol = −((2πi)^d/vol(𝒜)) Σ_k (l̄_k/r_k) Ω_k`, where `Ω_k` is the volume form with `dz̄_k`
  deleted. And `ω_{e_k} = ι_{−Σ_i r_i ∂/∂r_i}(⋀_i ω^i_{e_k}) = Ω_k`, since the single `dr_k` sits at
  position `2k` and the two minus signs cancel. So at `j = 0` the coefficient is `(−1)^{j+1}`, not
  the printed `(−1)^j` — which is the extraction's correction, and which also shows why the statement
  should begin at `j = 0` rather than the printed `1 ≤ j ≤ d−1`. **I did not redo the induction on
  `j`**, and my verdict says so: the claim for `1 ≤ j ≤ d−1`, and the `(−1)^{d(d+1)/2}` of part (c),
  rest on the extraction's derivation rather than mine.
- **E4 (error).** Corollary 4.15 (p. 54) concludes `L_𝔣(χ,0)/c⁺_τ R_{L/ℚ}M(χ) ∈ ℚ̄^×`, and Remark
  4.16 states Deligne's conjecture — proved by Blasius and Kufner — as membership in `E^×`. Deligne's
  conjecture is a **rationality** statement, placing the ratio in `E`; it says nothing about
  non-vanishing, and a critical L-value may vanish. I searched pp. 45–60 for a non-vanishing
  hypothesis and found none, so both statements assert more than is proved.
- **E6 (error).** Located at the proof of Theorem 5.27, Step 1. The extraction's point is that the
  transfer through Proposition 4.6 — the route the proof of Theorem 4.9 uses — carries a factor
  `(−1)^{d(d−1)/2}` that the displayed identity omits, absorbable into `µ_𝔣`. I checked that the step
  is as quoted and that the cited route is the paper's own; **I did not re-derive the constant**, and
  the verdict says so.
- **E5, E8 (misprints)** are clear on the page: `(5.6.1)` writes `σ(λ)^{µ(λ)}` where the infinity
  type `µ` is a function on embeddings, so the exponent must be `µ(σ)` — as printed the product does
  not depend on `σ` at all; and Appendix A says "each `γ ∈ G`" where the group acting is `Γ` (`G` is
  never introduced there) and writes `Hom_{Γ,O_X}(O_X, 𝒢) ≅ Γ(X, ℱ)^Γ` where the left side is the
  global sections of `𝒢`.
- **E1, E7 (misprints)** were checked at their locators and are sound readings; for E1 my verdict
  records that I verified the quotation but did not re-derive the functional equation.

## Items, statuses and routes

- **Library (2 items).** Both resolve at the pinned commits — Dirichlet's unit theorem
  (`NumberField.Units.rank`, `basisModTorsion`, `exist_unique_eq_mul_prod`) and group (co)homology
  (`groupCohomology`, `groupHomology`) — and their notes are precise about what is *not* there: the
  cap product and `H_i(ℤ^r, ℤ) ≅ ⋀^i ℤ^r` are correctly left to item 039 rather than claimed.
- **Planned (8 items).** Every cited stage id resolves.
- **Missing (74 items).** Routed exactly once. None is in either library: Eisenstein–Kronecker
  classes, Hecke characters, the Poincaré bundle, critical values and Hilbert modular forms all
  return nothing from the pinned index.
- **Routes (4).** Both Part II parents exist, both ids are free, both titles begin with their
  parents' and both areas (`iwasawa`, `arithmeticgeometry`) are galaxy ids. The split between them is
  the right one: the Poincaré-bundle geometry goes to the abelian-schemes parent and the p-adic
  L-function material to the automorphic parent, rather than being merged.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KINGS-SPRANG-25.result.json` ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 74 missing items, 74 routed, each exactly once.
- Every planned and route stage id resolves; both Part II parents exist and both ids are free.
- Lean: none.
