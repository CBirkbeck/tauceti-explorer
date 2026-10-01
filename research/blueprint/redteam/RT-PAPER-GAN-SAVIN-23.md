# RT-PAPER-GAN-SAVIN-23

Completed by Codex, session `codex-rtOQ9t`, 2026-10-01. Refs #4152.

Three high-severity findings affect statements the accepted extraction sends to design. The extraction and its review were done by other sessions. The checked revision is `c162f5b`.

| Finding | Extracted item | Required correction |
|---|---|---|
| 1 | `cor-6-8` | Require the common theta lift to be nonzero before asserting injectivity. |
| 2 | `lemma-11-4` | Multiply the integrand by the inverse target character. |
| 3 | `rev-langlands-classification-and-harish-chandra` | For general reductive groups, temperedness requires `P = G` **and** a trivial positive real central twist. |

## 1. Two different representations can both lift to zero

For `F = Q₅`, let `D` be a cubic division algebra. Its trivial representation and a nontrivial unramified cubic character give two nonzero lifts to `G₂`: a non-supercuspidal discrete series and a nongeneric depth-zero supercuspidal. Both are tempered and nongeneric. Dichotomy makes both their `PGSp₆` lifts zero. The final implication in `cor-6-8` would identify these distinct representations.

This counterexample uses [arXiv v1, Proposition 7.1 and Theorem 6.1](https://arxiv.org/pdf/2102.00372v1#page=23). [Corollary 6.8](https://arxiv.org/pdf/2102.00372v1#page=22) omits the nonzero hypothesis, which its appeal to Proposition 6.6 needs. The later Theorems 12.4(ii) and 15.1(iii) include it. The [sequel’s Theorem 2.1](https://arxiv.org/pdf/2209.07346v2#page=8) also restricts the injective map to the nonvanishing locus. Fix the item, record the version-specific source issue, and pass the hypothesis to the exceptional-theta design brief.

## 2. The root-exchange integral has the wrong equivariance

For the Heisenberg group with multiplication

`(x,y,z)(x′,y′,z′) = (x+x′, y+y′, z+z′+xy′)`,

use its Schrödinger representation `π(x,y,z)f(t) = ψ(z+yt)f(t+x)`. Take `X = {(0,y,z)}`, `Y = {(x,0,z)}`, evaluation at zero as `ℓ`, and characters `ψ_X = ψ(z)`, `ψ_Y = ψ(z+x)`.

The extracted formula, using representatives `(x,0,0)`, gives `A(f) = ∫ f(x) dx`. It is translation invariant, whereas the required functional transforms by `ψ(x₀)`. A compact-open indicator and an `x₀` with `ψ(x₀) ≠ 1` exhibit the failure. Without representatives, the unweighted integrand does not even descend through the common centre.

The repair is

`ℓ′(v) = ∫_{Y/(X∩Y)} ψ_Y(y)⁻¹ ℓ(π(y)v) dy`.

The [proof of Lemma 11.4, p. 36](https://arxiv.org/pdf/2102.00372v1#page=36), already uses this character factor in its intertwiner, although the lemma’s display and the extracted statement omit it. Agreement of the characters on the intersection makes the corrected integrand descend; change of variables gives the target equivariance. Record the discrepancy and correct the general lemma. An unweighted formula needs an explicit choice of representatives on which the target character is trivial.

## 3. `P = G` does not remove central twists

The review-added item states the Langlands classification for **any** connected reductive group. For `G = GL₁`, every standard triple has `P = G`; its positivity conditions are empty. Taking the tempered character `σ = 1` and the positive real twist `|·|_F` gives the irreducible Langlands quotient `|·|_F`. Its value at a uniformizer has modulus `q⁻¹`, so it is nonunitary and nontempered.

[Silberger–Zink §§1.2–1.4](https://arxiv.org/pdf/1407.6494v1#page=4) retain the full real character space, including the central part. [Bernstein’s notes, IV §2.3](https://personal.math.ubc.ca/~cass/research/pdf/bernstein.pdf#page=92), explicitly impose compact centre in the corresponding discussion. The corrected general criterion is `P = G` and `ν = 0`. With unitary central character or anisotropic centre, the shorter criterion is valid. Update the item and its `SmoothRepresentationsOfLocalGroups:SR.3` source route. This overgeneralization was added by the extraction’s review; it is not an erratum to the paper’s `G₂` discussion.

## Scope and validation

Read the full 56-page arXiv v1, all 107 extracted items, 52 source-issue records, four routes and 28 prerequisite records, plus both review files. Checked decisive formulas on PDF page images. Read the sequel’s pp. 5–8 and its routing record, the general-classification sources at the cited sections, the cited pinned library declarations and the shared roadmap stages listed in the JSON `checked` field.

The [publisher page](https://doi.org/10.1007/s00222-022-01165-2) provides a subscription preview. The 78-page published version was not read. Findings 1 and 2 concern the accessible v1 and the accepted extraction; no claim is made that the published text still contains them. Existing gaps recorded by the earlier review are not new findings here. This was not a complete re-audit of every supplier paper.

All 103 missing items are routed once; item IDs and stage references resolve. The split-octonion core declarations exist at the pin. The reviewed caveats about its extra rank/nondegeneracy consequences remain caveats. The exceptional and classical theta routes have distinct owners, and the sequel shares the same exceptional-theta candidate.

Validation: `scripts/check_redteam.py`, `intake.py check-files` for the two deliverables, and `git diff --cached --check`. No Lean file is required; Lean was not run. The findings and their precise edit locations are in the companion result JSON.
