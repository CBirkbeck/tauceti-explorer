# PAPER-WEI-26 — gamma values and CM periods over function fields

Original extraction: Claude Code cc-7b31c4, #1193. Independently corrected by Codex codex-a71f92, #1194, 23 September 2026.

Status: **partial; revise**. The review is finished, but the extraction is not closed. See [the independent review](../reviews/REV-PAPER-WEI-26.md) for the full change, source-error and gap ledgers.

## Sources and result

Fu-Tsun Wei, [Algebraic relations among special gamma values and the Chowla–Selberg phenomenon over function fields](https://link.springer.com/article/10.1007/s00222-026-01406-8), Inventiones mathematicae 244 (2026), 815–897, DOI 10.1007/s00222-026-01406-8. The published article is open access and was read in full by the reviewer; the earlier paywall statement is withdrawn. [ArXiv v2](https://arxiv.org/abs/2207.01165), dated 11 January 2026, and its TeX source were used to compare disputed formulas. Version hashes and the correction-search record are in result.json.

For q a prime power, distinguish A=F_q[θ], k=F_q(θ), the completed algebraic closure C∞ and k-bar inside it from the motivic copies F_q[t], 𝕜=F_q(t). ℓ is positive. The paper relates arithmetic, geometric and two-variable gamma products to CM dual t-motive periods.

The main trdeg target is

```text
trdeg_kbar kbar(Γ_geo(x), Γ_ari(y), Γ(x,y))
  = 1 + (ℓ − 1/(q−1)^ε_n) · #(F_q[t]/n)×,
x ∈ n(θ)⁻¹A \ (−A_+ ∪ {0}), y ∈ (q^ℓ−1)⁻¹Z,
ε_n = 1 if deg n>0, otherwise 0.
```

It also claims completeness of algebraic relations via the gamma functional equations, with the necessary rational-root interpretation. The review does not declare this main formula false; it records failures in auxiliary finite-level claims used in its proof.

The period distribution is a Q-linear map S(G)→C∞×/k-bar×. Here S(G) means locally constant rational functions invariant under [G,G∞], whose normalized average over G∞ is independent of the coset. It is **not** defined by an order-two complex-conjugation relation. The distribution interpolates CM period symbols and is identified with the gamma distributions.

The Chowla–Selberg results describe a **Galois-indexed family** of gamma monomials spanning quasi-periods, not a single monomial. In the Drinfeld case that family is an algebraically independent basis. The Hilbert–Blumenthal result gives an ideal-parametrized entire period lattice after an algebraic coordinate change. The Deligne–Gross result concerns nonzero pairings with **algebraic CM eigendifferentials**; arbitrary transcendental rescaling of a differential is excluded.

## What can be imported

The corrected inventory has 93 items: 4 library, 9 planned, 80 missing.

Polynomial/rational-function/Laurent-series carriers, transcendence degree, locally constant functions/profinite groups/Haar measure, and a restricted-power-series Tate carrier are present at the pins. Normed C∞ is not supplied merely by LaurentSeries; the reviewed DM.2 audit records the remaining analytic construction. Existing Tate, valuation, curve and finite-comodule infrastructure must not be rebuilt.

The accepted narrowed source route to DrinfeldModulesAndTModules uses DM.0/DM.2/DM.4/DM.8 for Carlitz period and C∞, Drinfeld definitions/uniformization, abelian τ-motives, and the exact ABP lifting criterion. It excludes the Hartl–Juschka σ-duality comparison, arbitrary quasi-period pairing, special soliton functions and BCPW CM transcendence theorem. In particular “contravariant τ-motive” does not mean “inverse-Frobenius σ-dual motive”.

The accepted narrowed FunctionFieldArithmetic route uses FA.3/FA.4/FA.5 for finite decomposition/constant extensions, the later Carlitz ray-class comparison and correctly normalized primitive/imprimitive Artin factors. It does not supply a CM period distribution or the compatible absolute-Galois/decomposition-subgroup assembly.

## Proposed Part II: withheld

GammaValuesAndCMPeriods is a plausible direction, but route 1 is rejected until its brief is buildable. It currently holds all 80 missing items once, solely to preserve routing accountability. It must resolve shared dual-motive/ABP foundations with the existing multiple-zeta Part II proposals, import general analytic/curve infrastructure and supply exact formulas and proof prerequisites. Classical HodgeStructures does not cover Hodge–Pink structures.

The principal gaps are the complete universal-distribution relations, soliton divisors and convergence, all six gamma-relation clauses, the three-part explicit Chowla–Selberg target, and Hodge–Pink morphism/realization/determinant machinery. Wei 2020's Kronecker-limit and stable Taguchi-height consequences and the Namoijam–Papanikolas pairing input were also missing from the prerequisites.

## Source findings

There are 23 independently checked source findings: four earlier misprints and nineteen additions. They include an inconsistent bracket seed and false finite-level span at q=2,ℓ=1; inconsistent geometric gamma normalization at q=2; zero divisors incorrectly called generalized CM types; a missing monic condition; a missing x^(q−3) factor in a reflection identity over arbitrary C∞; a missing sum/degree normalization in explicit epsilon; and conductor-one exceptions. Minor notation errors are recorded separately.

Do not replace the source's all-q theorem by a silently restricted theorem. The repaired statements and explicit gates in result.json distinguish confirmed counterexamples from unresolved downstream proof repairs. The review report gives elementary witnesses and states exactly what has not been disproved.

## Verification

The paper checker, paper/source-issue/queue unit tests and independent exact-arithmetic boundary/inventory checks pass as recorded in the review. No Lean implementation or compilation is claimed.
