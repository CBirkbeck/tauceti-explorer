# FIX-RT-PAPER-SKOROBOGATOV-SOFOS-23

Completed by Codex, session **codex-J6LwjP**, 2026-10-02. [Issue #5506](https://github.com/CBirkbeck/tauceti-explorer/issues/5506). Inputs: the original extraction, RT-PAPER-SKOROBOGATOV-SOFOS-23 and its independent review. All three independently confirmed findings have been applied to the result JSON and reader. Implementation and proof closure are not claimed.

## Source and scope

The [published article](https://eprints.gla.ac.uk/292484/1/292484.pdf), Inventiones Mathematicae 231 (2023), 673–739, matches the original PDF SHA-256 `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1`. The [repository record](https://eprints.gla.ac.uk/292484/) identifies it as the published version. Targeted text and rendered-page checks covered printed pp. 675, 677, 680, 691, 694, 720 and 727. The arXiv record was checked for version metadata only; no new preprint download, full-paper rereading or version collation is claimed. These fixes concern extracted contracts and routing, not newly alleged mistakes in the published source. All 42 existing sourceIssues, evidence and review verdicts are preserved without adding a new author erratum or own review verdict.

## Finding 1: degree compatibility and nonempty families

**Applied.** The standing coefficient-family hypotheses on p. 677 include deg Qᵢ ≤ dᵢ. Item 9 now distinguishes the shorter printed Theorem 1.9 (p. 680) from the usable theorem contract. The contract restores degree compatibility, positive fixed degree data and modulus, and sufficiently large height. Items 11 and 74 carry the corresponding restriction in the density and character-cancellation contracts; their original unit/coprimality conditions are retained. No extra coprimality condition is imposed on the general mean-discrepancy theorem. Coefficient counts, the dispersion expansion, theta averages, many-prime witnesses, applications and route briefs carry the same standing guard. Fixed A₁,A₂ and n<A₁<A₂ remain explicit.

**Denominators.** Item 1 records the direct construction: coefficients below the leading one lie in 0,…,M−1 and the leading coefficient lies in 1,…,M, in their prescribed congruence classes. Compatibility ensures this polynomial has degree d and height ≤M. Products give nonempty Poly(H) for H≥M. Under the source unit condition, item 24's positive asymptotic Schinzel density gives eventual nonemptiness of Schinzel(H). The usable relative-density statements therefore divide only by positive cardinalities at sufficiently large height. No claim that every compatible family is nonempty at every small height is made. The looser condition that all coefficients above degree d vanish modulo M is noted only as a possible sufficient generalization, not substituted into the sourced theorem contract.

**Regression.** Q=t²+1, M=2, d=1 has no degree-one lift, including at H=3,7,25; the coefficient obstruction proves emptiness for every H. Exact checks construct bounded lifts and confirm positive product counts for 1,259 compatible families with M≤5 and d≤3. M=4, Q=1 gives the small-height boundary: no degree-one positive-leading lift at H=3, a lift at H=4. The optional reduced-degree congruence example is checked separately. These checks validate domain handling, not the asymptotic analytic estimates.

## Finding 2: the two-sided L1 bound

**Applied.** `l1-bound-truncated-von-mangoldt` now separates the positive-input estimate from the coefficient sum over both signs and zero. For positive t, the divisor bound is uniform for z≥1; its mean is O(y log² y). For the two-sided sum, d≥1 and δ₂>0 are fixed, k,m are positive with k,m≤(log H)^δ₂, and 1≤z≤H. This gives O_{d,δ₂}(H log² H max(k,m)^d), hence the stated polylogarithmic bound. The API and tests distinguish the two ranges and keep the even extension of Λ already present in the extraction.

At zero, Λ_z(0)=−Σ_{e≤z}μ(e)log e and E_z(0)=−Λ_z(0); its crude bound z log z is controlled by H log H under the restored cutoff. It cannot be omitted or treated by the positive divisor bound. Proposition 3.8 (item 98, p. 694) is unchanged and still has H^δ₁≤z≤H with 0<δ₁<1. Its lower cutoff is unnecessary for this elementary L1 bound alone, not removed from the proposition.

**Regression.** At t=1,z=1 the term vanishes. For every one of 25 primes p<100, exact symbolic log-prime coefficients confirm Λ_p(0)−Λ_{p−1}(0)=log p. Since primes are unbounded, these jumps rule out an absolute bound on Λ_z(0) over arbitrary z at fixed H: bounded successive values would bound their difference. No floating-point cancellation is used.

## Finding 3: ClassFieldTheory ownership

**Applied.** Item 63's planned supplier is `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`. Its note and the geometric route distinguish Layer 13's strict Hilbert class field and totally-positive-principal splitting criterion from Layer 12's underlying global correspondence. The actual Layer 12/13 atlas contracts and coverage were inspected. Layer 13 explicitly provides the narrow/strict Hilbert class field, named ray fields, cyclic Hasse norm theorem and Kronecker–Weber, with earlier layers as prerequisites. It remains planned; no field construction or theorem is claimed available. Local invariants, unramified unit norms and ABHN remain in Layers 5,6,10. No upstream roadmap, blueprint packet or separate competing field API was edited.

## Validation and remaining boundaries

- 149 original item IDs and statuses: **7 library, 10 planned, 132 missing**. Every missing item remains routed exactly once across the original eight routes.
- All 12 prerequisites, 42 source issues and 10 completion gates are unchanged. All unaffected item records are byte-equivalent after JSON parsing, all original `uses` and prerequisite lists are unchanged, and every dependency resolves in an acyclic graph. Route fields outside the two affected briefs are unchanged.
- The exact regressions above passed. `scripts/check_paper.py`, intake `check-files` for the three deliverables, and `git diff --check` passed.
- No Lean files were requested and no compilation was performed. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369` remain the pinned baseline. Existing library claims were not broadened.
- Historical analytic repairs, independent review conclusions and finite certificates remain attributable to their original sessions. This fix does not independently prove those repairs or rerun unrelated certificates. The extraction remains complete at its stated interface/routing scope, with implementation and supplier proof gates still explicit.
