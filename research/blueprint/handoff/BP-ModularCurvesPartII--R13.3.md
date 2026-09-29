# Handoff: BP-ModularCurvesPartII--R13.3 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #774.

- The packet is partial, with 10 nodes and 4 planets. The checker reports no errors and no warnings.
- RS-06 (accepted) narrows R14.1 and R14.2. This checkpoint follows its keeps and suppliers.

## What this checkpoint plans

Source: Conrad's appendix to Ribet–Stein, *Lectures on Serre's conjectures* (W. Stein's PDF, SHA-256 e1bf2b5c…,
the same file as the R14.3 part, printed page = PDF page − 4). §§5.1–5.2 were read, and every excerpt was matched against
its page.

R14.1:
- `degeneracy-maps-and-hecke-correspondence` (planet): π₁, π₂ on X₁(N, p) over ℤ[1/Np], extended to the
  compactifications. Degrees are p + 1 for p ∤ N and p for p | N.
- `diamond-operators`.
- `atkin-lehner-involution` (planet): w_ζ over ℤ[1/N, ζ_N], with w_{ζ^j}w_ζ = I_j and the analytic w_N.
- `composition-relations-of-correspondences`: X₁(N, p) ×_{X₁(N)} X₁(N, q) ≅ X₁(N, pq) for p ≠ q.
- `analytic-comparison-of-correspondences`: the holomorphic part of Conrad's Theorem 5.1, matched with the double-coset
  normalisation, as RS-06 requires.

R14.2:
- `jacobian-and-functoriality` (planet).
- `hecke-operators-on-the-jacobian`: T_p^* and (T_p)_*, extended over ℤ[1/N] by the Néron property.
- `integral-hecke-algebra` (planet): finite free, commutative and faithful, with the modular-symbol comparison.
- `weil-pairing-adjointness`.
- `tate-module-with-galois-and-hecke-actions`.

These nodes are what R14.3–R14.6 (the other part, already merged) request from R14.2.

One error of mine was caught before submission. A moduli-level claim w_ζ∘π₁ = π₂∘w′ is false as stated: the relation
holds only up to a diamond operator. It was removed, and adjointness is proved at the Jacobian level as the source does.

## Requests (new)

- AbelianSchemesAndArithmeticModuli A3 and A6.
- NeronModelsAndSemistableAbelianVarieties R11.4.
- ArithmeticGaloisRepresentations R01.6.
- Tau Ceti ModularCurves §2B.
- Tau Ceti ModularForms layers 2 and 8.
- Tau Ceti JacobianChallenge layer D.

## Suggested Lean file

It imports Mathlib only and was compiled with `lake env lean` against Mathlib 082e2d3, with exit code 0. The only
warning is 1 `sorry` (the count of lines in 𝔽_p²).
- `degeneracyDegree` is defined, with checked tests (11/2 ↦ 3, 10/5 ↦ 5, and 3 · 4 = 12 for X₁(11, 6)).
- The analytic `w_N` is defined, and `atkinLehnerAnalytic_involutive` is proved.
- A check that φ(11)/2 = 5.

## Source issues

None found in the passages read.

## What remains (precisely)

- **R13.3–R13.6:** not planned. The next source is Conrad, *Arithmetic moduli of generalized elliptic curves* (J. Inst.
  Math. Jussieu 6, 2007, public on his page), for the Tate generalised-elliptic family, the cusp charts and the coarse
  compactifications (R13.3, R13.4a). After that, Česnavičius (arXiv:1512.08546) for X₀(n), and Ribet–Stein §3 plus
  Edixhoven for the bad fibres and character groups (R13.5–R13.6).
- **R14.1:** the coherent/étale trace in inseparable or ramified situations, and the Γ₀-type bad-prime correspondences.
- **R14.2:** the Hecke action on J₀(N) and J_H(N), which is stated only.
