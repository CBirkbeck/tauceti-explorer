# Fu (2024): extraction and routing

Issue [#1083](https://github.com/CBirkbeck/tauceti-explorer/issues/1083). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints of Codex (codex-c83e7a, #1659 and later), whose reports follow below as history.
- **The paper.** W. Fu, *Sharp bounds for multiplicities of Bianchi modular forms*, Ann. of Math. 200 (2024), 123–152.
  - The published text is now available from the NSF Public Access Repository (SHA-256 a6a15856…). It was read in full.
  - It was collated with arXiv v2, which the earlier checkpoints read. The numbered statements agree, and all locators now refer to the published pages.
- **Items.** The result has **137 items: 12 library, 11 planned and 114 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Seven are recorded under `sourceIssues`, now in the §18 form.

## This continuation (cc-442dc5)

**The published version.**
- **Source.** The earlier NSF link now serves the version of record: 30 pages with the Annals header.
- **Collation.**
  - The numbered statements match arXiv v2. The published Corollary 1.3 adds "Suppose K_f is sufficiently small".
  - Page 146 was checked as an image. The text layer drops the square root in "1/p < r′ < √(1/p)", and the printed bound is correct.

**The findings, converted.** The checkpoint's findings S1–S7 were in the older form. They are now PAPER-FU-24/E1–E7, with a quotation, published locators, `known` set to "new" and a `searched` list. The old text is kept in `previousForm`, and each was checked on the published page.
- **E1.** Equation (2) should use cuspidal cohomology, not compactly supported cohomology. The boundary terms are bounded by 3·(number of cusps), so nothing downstream changes.
- **E2.** In (16), D_r needs |λ_α|r^{|α|} → 0. The printed "bounded" condition describes a larger space.
- **E3.** Remark 5.8's "induced iff v(λ0) ≥ 2" is false.
  - λ is induced exactly when 2λ(∆) + 1 is a square in Z_p. For p = 3, λ(∆) = 1 is not induced.
  - So Section 5 proves Theorem 1.5 only for induced λ. The full theorem follows from Ardakov–Wadsley [AW14], which the paper cites.
  - Theorem 1.4 needs genericity only at the induced parameters, since these are the closure of the λ_k.
- **E4.** The Ore set in (17) contains 0 when R is ramified. Sections 5–7 work over Q_p, and a general K is reached by base change.
- **E5 (gap).** Theorem 5.7's graded argument needs the r′-quotient filtration on D_r/D_r(p²∆ + λ0) to be separated.
  - This is proved only for small radii. It is not proved at the radii p^{−1/p^n} that the proof of Theorem 5.1 uses.
  - Theorems 1.2–1.5 do not depend on it.
- **E6.** Theorem 1.2's minimum runs over r1 + r2 entries, and "∼" in Corollary 1.3 means bounded above and below.
- **E7.** Theorem 5.7 as printed is false for λ(∆) = p^{−1} at r = p^{−2/3}, where the quotient is zero. It needs v(λ0) ≥ 2.

**Checks made in the published text.** These steps were verified and found correct:
- the proof of Proposition 5.3: ‖X_i‖_r = p^{n−1} at r = p^{−1/p^n}, and the exponential series converges;
- Lemma 3.3's count of basis monomials, (d+1)²;
- the density argument in Theorem 5.2;
- the homological induction in the proof of Theorem 1.4;
- the passage in §7 from the r p-adic weights to the r1 + r2 archimedean weights.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded, including the gap in Theorem 5.7 (E5).
- What remains is the cited suppliers' proofs (AW13, AW14, Frommer, DDMS, Lazard, ST03).

## Mistakes found (`sourceIssues`)

- **E1** (error; affects nothing), §1, equation (2), p. 125, and Corollary 1.3, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* dim_C H_c^{r1+r2}(Y(K_f), W_k) = 2^{r1} dim_C S_k(K_f) … This space corresponds to the first compactly supported cohomology with coefficient local system W_k … by the Eichler–Shimura isomorphism (2). *Correction:* Read cuspidal (interior) cohomology, as in [Mar12, (4)]. Compactly supported cohomology differs from it by boundary terms, bounded here by 3·(number of cusps) in degrees 1 and 2, so Theorem 1.2 (an upper bound through ordinary cohomology) and Corollary 1.3 still hold.
- **E2** (misprint; affects nothing), §4, equation (16), p. 138, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* D_r(G, K) = {Σ λ_α b^α | λ_α ∈ K, sup_α |λ_α| r^{|α|} < ∞} *Correction:* The completion of D(G, K) for ‖·‖_r consists of the series with |λ_α| r^{|α|} → 0; the bounded condition describes a larger space.
- **E3** (error; affects the proof), Remark 5.8, second bullet, p. 147, with Theorems 1.5 and 5.1, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* The infinitesimal character λ is induced if and only if the valuation λ0 is at least 2 *Correction:* Only 'only if' holds. With λ_k(Δ) = ½((k+1)² − 1), λ is induced exactly when 2λ(Δ) + 1 is the square of an element of Z_p; for p = 3, λ(Δ) = 1 is integral but not induced. So Section 5 proves Theorem 1.5 only for induced λ. Theorem 1.5 for all λ ∈ Z_p^r follows from [AW14, Ths. 4.6 and 5.4], which the paper cites after Theorem 1.5, and Theorem 1.4 needs genericity only at induced parameters (the closure of the λ_k).
- **E4** (error; affects the proof), §4, equation (17), p. 138, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* S0 := ∪_{a⩾0} (p^a + m^{a+1}) ⊆ R[[G]], where m is the maximal ideal of R[[G]] and R the integers of a finite extension K of Q_p *Correction:* Take R = Z_p (or R unramified), as in [AW13, §10], and obtain the microlocalization over a general K by base change K ⊗_{Q_p} (18). For ramified R, p ∈ m² and 0 ∈ p^a + m^{a+1} for a ≥ 1. Sections 5–7 work over Q_p, so the main results are unaffected.
- **E5** (gap; affects a stated result), Proof of Theorem 5.7, pp. 145–146, as used in the proof of Theorem 5.1, p. 147, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* The associated graded ring for D_r^λ(G, Q_p) is gr_{r′} D_r^λ(G, Q_p) ≃ gr_{r′} D_r(G, Q_p)/gr_{r′}(p²∆ + λ0) by Lemma 2.2 … is an integral domain *Correction:* Passing from the graded ring to D_r^λ needs the filtration induced on D_r/D_r(p²∆ + λ0) by ‖·‖_{r′}, r′ < r, to be separated, i.e. D_r ∩ D_{r′}(p²∆ + λ0) = D_r(p²∆ + λ0). This is proved (checkpoint items) when p^{−1} < r < p^{−1/(p−1)}, where r′ = r works, but not for the radii r = p^{−1/p^n}, n ≥ 1, used in the proof of Theorem 5.1. Theorems 1.2–1.5 do not depend on it: Theorem 1.5 follows from [AW14].
- **E6** (misprint; affects nothing), Theorem 1.2, (3), and Corollary 1.3, p. 125, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* dim_C S_k(K_f) ≤_{K_f} (min_{1≤i≤r} k_i)^{−1} O(∆(k)) … dim_C H_c^n(Y(K_f), W_k) ∼_{K_f} k *Correction:* The minimum runs over the r1 + r2 archimedean entries of k; ∼_{K_f} means bounded above and below by positive constant multiples.
- **E7** (error; affects a stated result), Theorem 5.7, p. 145, in the published version, Ann. of Math. 200 (2024), 123–152 (NSF PAR copy, SHA-256 a6a15856…); arXiv v2 has the same numbering. *Printed:* Let p be an odd prime. If 1/p < r < 1, then D_r^λ(G, Q_p) is an integral domain. *Correction:* Add the hypothesis v_p(λ0) ≥ 2 (for instance λ(∆) ∈ Z_p), the only case used. For λ(∆) = p^{−1} and r = p^{−2/3}, ‖∆‖_r ≤ p^{2/3} < |λ|, so ∆ − λ is a unit and D_r^λ = 0, which is not an integral domain; the proof's own first branch reaches this zero quotient.

The reasons, the places searched and the checkpoint's original wording are in the JSON.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **Findings.** Every finding now passes the §18 checks.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E3, E5 and E7 on pp. 145–147, and the reliance of Theorem 1.5 on AW14.

## Checkpoint history (unchanged)

The reports of the earlier checkpoints follow as they were written. Where they say *partial*, refer to S1–S7 or say the published text was not obtained, this continuation supersedes them.

## PAPER-FU-24 — analytic quotient and coefficient interfaces

Refs #1083. Codex, session `codex-c83e7a`, 22 September 2026. Continues PR #1659.

**Status: partial.** The extraction now has **137 items: 12 library inputs, 11 planned imports and 114 missing items**, each missing item routed exactly once. All 123 inherited IDs are retained. The 43 definitions/constructions have 129 explicit planning API contracts, 129 proposed tests and concrete consumers. The 204-edge selected item graph and the proposed-route graph are acyclic; neither is a proof-closure certificate for every inherited dependency.

The main theorem remains the degree-one weight saving for fixed-level cohomological SL₂ forms over a number field with a complex place. The three existing Part II proposals retain their purposes. This continuation adds precise coefficient comparisons and a proved mathematical route for the central quotient at small real radii. The larger-radius separation step remains open.

### What this continuation establishes

Let `B_ρ` be the weighted PBW completion over Q_p for `sl₂(Z_p)^m`, with odd p and real `ρ≥1`. Let `I_λ` be the actual ideal generated by `Δ_i−λ_i`, for integral `λ_i`.

The previous bounded-division formula now gives a continuous projection `N` onto the normal PBW coefficient space with every h_i-exponent at most one. Algebraic normal-form uniqueness gives `N²=N` and kills each central ideal. By continuity these identities hold in the completion. Successive division gives

`f−N(f)=Σ_i (Δ_i−λ_i)Q_i(f)`.

Consequently `ker N=I_λ`, so the ideal is closed. Since `||N||≤1`, every representative of a quotient class has norm at least `||N(f)||`, and the representative `N(f)` attains this bound. This supplies the actual quotient norm and separatedness, not merely a computation of associated graded objects.

For `1≤σ≤ρ`, the remainder formulas commute with the coefficient-preserving radius map. A normal family maps to the same family at σ; it can vanish only when all its coefficients vanish. Hence

`B_ρ/I_λ → B_σ/I_λ`

is injective. The weight-one central quotient is the domain of Fu Lemma 3.3, so every weighted central quotient is a nonzero domain. No noetherianity theorem for every real weight is inferred.

For the first congruence group G, fix any real radius

`p^(-1) ≤ r < p^(-1/(p−1))`, and put `ρ=pr`.

Logarithm and exponential give inverse coordinates

`x_i ↦ p^(-1)log(1+b_i)`, `b_i ↦ exp(p x_i)−1`.

The nonlinear terms are strictly smaller than the linear term: for n≥2, both `v_p(n)` and `v_p(n!)` are at most `(n−1)/(p−1)`. The strict radius inequality therefore gives convergence and a norm-preserving substitution in each ordered variable. The logarithmic Lie brackets supply the algebra map; the inverse series and ordered weighted-c0 expansions give an isometric isomorphism `B_ρ≅D_r`.

Transporting the central projection proves that **the actual central ideal in D_r is closed and its quotient is a nonzero domain throughout this interval, including irrational log_p radii**. This proof does not use Frommer's rational-radius theorem to infer an unrestricted real-radius result. At the excluded endpoint the p-th nonlinear term ties the linear term, so the strict-contraction argument cannot be extended by changing a strict inequality to a weak one.

### The remaining larger-radius condition

Fu's Theorem 5.7 weakens the norm from R to a smaller r before passing to the quotient. For integral parameters, the outstanding condition is the contraction identity

`I_R = D_R ∩ I_r` inside `D_r`,

which would give injectivity of the larger quotient into the separated smaller quotient. Density alone supplies no such identity.

Here is a concrete regression for that false inference. Let `A=Q_p⟨T/R⟩`, with `0<r<|a|≤R`, `a≠0`, and `I=(T(T−a))`. The actual quotient is `Q_p×Q_p` by evaluation at 0 and a, so `[T]` and `[T−a]` are nonzero zero divisors. In the weaker r-norm, set

`q_N=−a^(-1)Σ_(j=0)^N(T/a)^j`.

Then

`T−T(T−a)q_N=T^(N+2)/a^(N+1)`

has norm `r(r/|a|)^(N+1)→0`. The quotient seminorm annihilates `[T]`; evaluation at zero shows that it is exactly the absolute value of the constant component. The weakened associated graded is therefore `gr(Q_p)`, a **nonzero domain**, even though the actual quotient has zero divisors. This tests the missing inference in the proof method. It is not a counterexample to Fu's integral-parameter theorem.

The earlier nonintegral-character zero-quotient example S7 is retained separately. Neither it nor the small-radius result discharges the full larger-radius assertion.

### Microlocalization and finite coefficients

This worker read the original [Ardakov–Wadsley published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v178-n2-p03-p.pdf), especially §§2.3–2.7, 10.1–10.11 and 11.1–11.3. Section 10.1 explicitly assumes that p is the uniformizer. Theorem 10.4 identifies microlocalization with the **rationalized** completed enveloping algebra. The earlier inventory statement omitted this final inversion of p and is corrected in place.

The new proof interfaces retain the maximal-ideal degree formula, the free k[t]-Lie PBW input, and the strict symbol comparison `b_i↦s u_i`, `p↦s`. General PBW over a free Lie module over a commutative ring is separated from the field-only supplier; the Z_p and k[t] cases need that stronger input.

Ramified finite coefficients are handled by two finite-dimensional comparisons. A finite Z_p-basis of O_K makes coefficient extension commute with the completed group-ring inverse system. Equivalence of finite-dimensional coordinate norms makes the same operation commute with weighted-c0 PBW completion. These are topological algebra isomorphisms; an arbitrary basis need not give an isometry. Flat scalar extension then supplies the microlocal map over K. It does not reuse the displayed maximal-ideal Ore set, which contains zero when ramification makes `p∈m²`.

AW13 Proposition 11.1's recovery argument is now decomposed: denominator injectivity becomes bijectivity in finite dimension; the localized good filtration is separated; its lattice is finite by Proposition 2.7 and hence complete. The semisimplicity argument uses the completed Lie projection and finite-group averaging. The original Zariskian Ore/completion results cited by AW13, its Lie-theoretic suppliers and the DDMS/Lazard foundations remain identified source dependencies.

### Library and route reconciliation

All nine previous baseline facilities were reopened at Mathlib `082e2d3` and Tau Ceti `f790474`. Three additional facilities are imported: Mathlib's restricted-series subring, Tau Ceti's last maximal weighted coefficient, and Tau Ceti's multiplicative Gauss norm. The latter theorem holds at every positive real radius over an ultrametric coefficient ring with multiplicative norm; it requires no completeness assumption. None of these commutative facilities supplies the missing noncommutative analytic distribution algebra.

| Route | Inventory in this continuation |
| --- | --- |
| PadicEnvelopingAlgebras, Part II of LieHighestWeight | 38 missing items; adds free-ring PBW, finite PBW coefficients, closed central projection and radius injection/domain |
| NoncommutativeAnalyticDistributions, Part II of LocallyAnalyticDistributions | 49 missing items; adds strict microlocal symbols, coefficient composition and small-real-radius comparisons |
| WeightAspectAutomorphicMultiplicity, Part II of ArithmeticLocallySymmetricSpaces | 25 missing items; inherited global application route |
| CompletedCohomologyPartII CC.2–CC.6 source | Four planned items; inherited tower/descent consumers |
| NoncommutativeAndEquivariantIwasawa NE.0 source | One missing homological input |
| PadicMeasuresIwasawaAlgebras L1 source | One missing finite coefficient-extension theorem for the already-owned completed group ring |

The added L1 route keeps a generic completed-group-ring operation with its existing owner. No new Part II or new roadmap is proposed by this continuation. Seven owner records/documents, the reviewed audit, reserved IDs, current packets/new roadmaps and decomposition inputs were refreshed. The complete relevant LA.0, NE.0 and L1 audit rows and the stated owner-layer descriptions were read. Earlier broader audit and auxiliary readings remain attributed to the previous worker in `inspectionHistory`.

### Sources, validation and resume points

This worker independently read every page, proof and reference of [Fu arXiv v2](https://arxiv.org/pdf/2201.11190v2). Its SHA-256 remains `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`. The publisher and author pages match the article identity. The conventional Annals PDF path returned 404 and the NSF published-version URL timed out; full published-version collation is still open.

Fresh auxiliary reading is recorded precisely in the JSON: the AW13 passages above; Kohlhaase pp.15–16 and its Frommer reference; ST03 pp.16–22, including the weighted-c0/bounded distinction and all-real multiplicativity versus rational-radius noetherianity/flatness. Original Frommer URLs returned 404, DNS or certificate errors. Acquisition of an auxiliary PDF is not represented as a full read.

The inherited exact regression passes **41,069 assertions**. New diagnostics pass **19,439 assertions**, checking the strict logarithm/exponential bounds, the excluded endpoint, and the displayed weak-quotient polynomial identity. All 129 API and definition-test names are unique; consumers resolve; all prior IDs survive; the selected 204-edge item graph and route graph are acyclic; all 114 missing items have one route; source and input hashes agree. The paper checker, three-file intake and fresh-main ownership/concurrency checks passed. No Lean file was required, written or compiled.

Resume with the larger-radius ideal-contraction problem, published-version collation, original Frommer/DDMS/Lazard and Zariskian source-proof decomposition, and independent review of the new analytic proofs. Preserve the old support convention, weighted-c0 correction, all-integral versus induced-character distinction, nonintegral zero-quotient example and lower-bound level restrictions. This remains a partial checkpoint.

### Retained prior source audit and proofs

The following record is retained from Codex `codex-a71f92`, PR #1659. Its references to “this continuation”, its 33/44/25 route counts, nine baseline inputs, and 126 API/test contracts describe that earlier checkpoint. The current inventory and the new proof scope are stated above. These older auxiliary reads are not newly claimed by `codex-c83e7a`.

### Source and conventions

The main source is [Fu, arXiv:2201.11190v2, 15 February 2024](https://arxiv.org/pdf/2201.11190v2).
The [publisher record](https://annals.math.princeton.edu/2024/200-1/p03) identifies
*Annals of Mathematics* 200 (2024), no.1, 123–152,
DOI `10.4007/annals.2024.200.1.3`. The earlier worker read the complete HTML;
this continuation downloaded the 25-page v2 PDF and read every section, proof
and reference. Its SHA-256 is
`d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`.
The [public NSF published-version URL](https://par.nsf.gov/servlets/purl/10625156)
was identified, but browser and command-line retrieval timed out. No published-PDF
hash, full version collation or comprehensive visual comparison is claimed.

Ten exact primary PDFs are now registered with URLs, SHA-256 and inspected scope
in `sourceArchives`. Acquisition does not mean that all those papers were read
completely. The main paper was; auxiliary reading is limited to the passages
specified below and in that register.

Equation locators in the JSON refer to **v2 HTML**: the section-6 free-module
sequences are (33) and (34), dimension shifting is (35)–(36), coefficient comparison
is (37), and the global spectral sequence is (38). The polynomial Peter–Weyl
formulae are unnumbered displays before (32), not (29).

For the local argument, fix odd `p`, a product `G` of `m` first congruence subgroups
of `SL₂(Z_p)`, and `W_k = ⊠ Sym^{k_i}`. Write `D_k = ∏(k_i+1)`. Rational Iwasawa
coefficients mean the bounded-denominator algebra `Q_p ⊗ Z_p[[G]]`, not the
unrestricted inverse limit of rational finite group rings. Enveloping completion
is taken on an integral lattice **before** inverting `p`. General finite coefficient
extensions occur only in the statements that provide the relevant comparison.

For the global argument, distinguish `d = [F:Q] = r₁+2r₂` from the number
`r₁+r₂` of archimedean places. The global weight has the latter number of even
entries `κ_v ≥ 2`, and

`Δ(κ) = ∏_(real v) κ_v · ∏_(complex v) κ_v²`.

At a completely split auxiliary prime, a real entry gives the exponent `κ_v−2`
and a complex entry gives two exponents `κ_v/2−1`. This is the dictionary needed
to turn a local multiaffine bound into the global bound; it is not a relabeling
of one weight vector. Modules, duals and Ore fractions retain their handedness.

### What the proof adds

The local endpoint is Fu Theorem 1.4: for a finitely generated rational Iwasawa
module `M` of rank `a`, both the error in

`dim H₀(G, M ⊗ W_k) = a D_k + error`

and every positive-degree homology dimension are bounded by one multiaffine
polynomial of total degree at most `m−1`. First prove the torsion degree-zero
bound. The two finite-module exact sequences give the upper and lower rank
estimates without assuming `H₁` vanishes. Only then use dimension shifting and
finite global dimension. This order avoids a circular use of the desired
higher-homology bound.

The main inputs are the generic cyclic-module bound (Theorems 1.6/3.2), the
comparison of algebraic quotients through microlocalization (Theorem 4.3), and
injectivity after **every integral** Casimir specialization (Theorem 1.5).
Sections 2–3 supply the filtration, central PBW and integral-image calculations;
sections 4–5 supply the analytic and microlocal comparison. Neither “PBW” nor
“locally analytic distributions” alone supplies this chain.

For fixed level and `r₂>0`, the resulting automorphic endpoint is
`dim S_κ ≤ C Δ(κ)/min_v κ_v`, and in parallel weight it is `O(κ^(d−1))`.
The Bianchi specialization gives the linear upper bound. Its two-sided sharpness
uses a separate base-change lower bound at suitable levels; it is not a
consequence of the upper estimate. Historical bounds, the totally-real asymptotic
and conjectural stronger predictions are recorded as context, not silently added
to the proof's dependency graph.

### Existing owners and baseline checks

The initial checkpoint used explorer `5b3798c`. This continuation checked live
main `5de4697bb48359dc1143d6f87bf9fbf6a6a767e4` against the local atlas snapshot.
The implementation baselines are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The following narrow interfaces were read directly in the pinned Lean sources.
They are imports, not new theorem targets:

| Existing input | Pinned source and scope |
| --- | --- |
| `IsRingFiltration`, `IsModuleFiltration`, integer-index constructor | Mathlib `RingTheory/FilteredAlgebra/Basic.lean`; does not supply the source-specific separation and strictness theorems. |
| Ore ring/module localization and its universal map | Mathlib `RingTheory/OreLocalization/Ring.lean`; an `OreSet` hypothesis is required, not manufactured by naming fractions. |
| PBW word filtration and exhaustivity | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/Basic.lean`; no ordered-monomial independence is inferred. |
| PBW graded pieces, direct sum and generator equation | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/AssociatedGraded.lean`; not the missing injectivity half of PBW. |
| Normalized `sl₂` Casimir operator and commutation | Tau Ceti `Algebra/Lie/Sl2/Casimir.lean`; field and characteristic restrictions are retained. |
| Primitive-vector eigenvalue `n(n+2)/2` | The same Casimir file, `sl2Casimir_apply_of_hasPrimitiveVectorWith`. |
| Integral standard lattice | `Sl2/IntegralLattice.lean`: `integralLattice`, coordinate equivalence, rank `n+1` and rational spanning. |
| Standard enveloping action | The same file: `repEnveloping` and generator formulas, with root-operator nilpotence. |
| Restricted Kostant action | The same file: `kostantFormRep`, ambient comparison, divided-power and Cartan-binomial preservation. |

The upstream **LieHighestWeight** roadmap owns the field PBW, highest-weight and
Harish–Chandra development. Its actual stage identifiers, including the `lλ`
suffix, are used. It is not re-planned. **ProfiniteProPGroups** supplies the
abstract profinite foundations, not all Lazard analytic theory.

**PadicMeasuresIwasawaAlgebras L1** already constructs completed group rings and
convolution for noncommutative profinite groups. **LocallyAnalyticDistributions
L0** already owns radius-indexed analytic function spaces, their inductive-limit
topology, continuous duals and the projective system of Banach duals. Its later
abelian Amice/character theory is not the general noncommutative Fréchet–Stein
algebra required here. **NoncommutativeAndEquivariantIwasawa NE.0** owns the
Lazard–Venjakob noetherian/homological direction; NE.1's canonical relative Ore
set is not Fu's microlocal set.

**ArithmeticLocallySymmetricSpaces ALS.0–1** supplies the quotient and local
systems. **CompletedCohomologyPartII CC.2–6** supplies the completed tower,
duality, finite chain models, finiteness/torsion and descent spectral sequence.
Its integrated decomposition already records the no-discrete-series torsion
input. Its existing source-proof gaps are not a reason to build another owner.

The relevant complete rows of reviewed AUDIT-13/14/25/26 were read: ALS.0–6
and finite-level duality, CC.0–6, LA L0–L4, NE.0–1 and PadicMeasures L0–L1.
All 50 relevant audit rows match live main. The seven relevant roadmap records
and all 60 of their stages also match the local atlas. The accepted CC torsion
and descent decomposition statements and their review qualifications were read;
the LA decomposition remains an L4 Fredholm/Riesz package, not the missing
noncommutative distribution algebra.

The full reserved-ID map contains no competing local-theory reservation. The
current tree has one blueprint packet (Lawrence–Venkatesh) and the same six
analytic/Habiro/Lawrence–Venkatesh new-roadmap definitions; none owns the proposed
extensions. No collision with the three proposed IDs was found. These checks
remove the former oversized-reader access gap. They are not an exhaustive proof
that every broad mathematical phrase in the entire catalogue has no overlap:
the independent review must still assess the route boundaries.

### Five proposed routes

#### 1. `PadicEnvelopingAlgebras` — 33 missing items

A Part II of **Representations of semisimple Lie algebras, highest weight theory,
and the Weyl formulas**. It adds integral `sl₂` PBW lattices, saturated ideal
completion, central reductions and their normal forms, integral image lattices,
the generic annihilator estimate and the affinoid Verma central-annihilator
construction. The integral symmetric-power representation belongs here, before
restricting it to analytic compact groups. Existing filtered-ring, Ore and
ordinary field Lie interfaces remain imports.

The finite-image comparison distinguishes the integral image lattice from all
integral matrices; only the rational image is identified with the full
endomorphism algebra. Infinite low-coordinate strips in the growth estimate are
handled by a direct bound, not dismissed as finitely many exceptional weights.
The explicit uniform majorant and bounded PBW-division argument appear below.
The equal-Casimir nongeneric example is initially an algebraic module; a completed
analogue would need its own quotient and domain argument.

#### 2. `NoncommutativeAnalyticDistributions` — 44 missing items

A Part II of **locally analytic distributions, growth, and character spaces**.
It imports the existing function/dual construction and the bounded completed
group ring, then adds uniform-group/Lie comparison, noncommutative analytic
convolution, radius algebras, flatness, microlocalization, algebraic quotient
recovery, crossed products, central analytic duality and the central injectivity
endpoint. The direct induced-character proof and the all-integral affinoid-Verma
route are distinct proof branches with explicit interfaces.

This is reusable local representation theory, not a hidden Bianchi-only lemma.
It does not include Colmez's correspondence or a geometric theorem about locally
analytic vectors of completed cohomology. Its coefficient, radius, handedness,
quotient and separatedness conditions must be present in the subsequent design.

#### 3. `WeightAspectAutomorphicMultiplicity` — 25 missing items

A Part II of **Arithmetic locally symmetric spaces and their cohomology**.
It imports the two local extensions and the existing completed-homology library,
then proves the torsion estimate, two rank inequalities, higher homology,
coefficient-field/weight comparisons, global spectral bound and Bianchi result.
The suitable-level lower bound and the support/boundary comparison are required
mathematics, not notation. No totally-real degree saving or unrestricted
arbitrary-level lower bound is proposed.

#### 4. Source addition to `CompletedCohomologyPartII`

Attach Fu section 7 and its Calegari–Emerton/Marshall inputs to **CC.2–CC.6**.
The four inventory items are already planned there. This gives an explicit
consumer and source trail rather than duplicating the tower or its spectral
sequence. In particular it does not reinstate the overstrong Ext/base-change
isomorphism criticized in the integrated CC review.

#### 5. Source addition to `NoncommutativeAndEquivariantIwasawa:NE.0`

Make the exact Auslander-regular/finite-global-dimension input explicit inside
NE.0's existing homological programme. The JSON marks the source-specific theorem
missing rather than claiming that a broad direction already states every
hypothesis. Groups with `p`-torsion are not granted finite global dimension.

### Source issues requiring explicit resolution

These are recorded as `S1`–`S7` in the JSON. They distinguish checked discrepancies
from further proof obligations; they do not claim to invalidate the main theorem.

**S1 — support convention.** [Marshall 2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf),
section 2.1, uses `H_c` for the cuspidal subspace of ordinary cohomology and states
its dimension identity for nontrivial coefficients. Fu describes it as compactly
supported. Keep the cuspidal injection for the upper bound and prove the
boundary long exact sequence and Poincaré–Lefschetz comparison before transporting
the two-sided statement. The trivial coefficient is a separate case. The lower
bound uses [FGT](https://arxiv.org/abs/0808.1204), Theorem 4.17 and Corollary 4.20,
and the indicated congruence-level class, with restriction/trace for sublevels.

**S2 — bounded series are not norm-completed series.**
[Schneider–Teitelbaum 2003](https://arxiv.org/abs/math/0206056), section 4,
distinguishes the weighted-`c₀` radius completion from the larger bounded space.
Fu (16) displays only boundedness. At `r=p^(-1/p)`, coefficients `c_(pj)=p^(-j)`
have weighted size one, so do not tend to zero. Keep both spaces distinct and
check each claimed density and radius-transition map on the correct one.

**S3 — all integral characters.** Fu 1.5 quantifies over `Z_p^m`, whereas 5.1
first concerns characters induced over `Q_p`. At `p=3`, the scalar `λ=1` would
require `(a+1)²=3`, which has no solution in `Q₃`. The alternate route through
[Ardakov–Wadsley 2014](https://arxiv.org/abs/1308.5104), 4.6 and 5.4, uses a finite
coefficient extension with integral roots and then faithful descent. The `n=0`
case is included in the inspected theorem. The continuation supplies the finite-free coefficient/descent argument below;
these are proposed mathematical proof steps, not an identification of the two
parameter sets or existing Lean comparison declarations.

**S4 — coefficient ramification.** The microlocal set displayed in Fu (17) must
be matched to the uniformizer hypotheses in
[Ardakov–Wadsley 2013](https://arxiv.org/abs/1102.2606), section 10. If `p` lies in
the square of the maximal ideal, a literal set of the form
`∪_a (p^a + m^(a+1))` may contain zero. Start with the unramified construction
needed over `Q_p`; prove the finite-coefficient-extension comparison separately.

**S5 — quotient topology.** A weaker norm filtration on a quotient must be
proved separated before its domain property follows from the associated graded.
The topological PBW comparison left to the reader at the end of Fu 5.1 also needs
a norm/decay and injectivity proof. The bounded-division argument below addresses
that U_r comparison. It does not settle separation of the weaker filtration on
D_r's quotient. Keep Fu's arbitrary-radius statement in view; a proof at the
cofinal rational radii is not automatically the all-real-radius theorem.

**S6 — indices and asymptotic meaning.** Use actual archimedean entries for the
minimum, and separate them from local factors after splitting. The Bianchi
sharpness conclusion is an upper and lower bound up to constants, not a proved
leading constant or ratio-one asymptotic.

**S7 — a domain must be nonzero.** The printed Fu 5.7 statement ranges over
central characters without an integrality/nonzero-quotient qualification. Take
`r=p^(-2/3)`, `λ=p^(-1)` for odd p. The logarithmic coordinates give
`||Δ||_r ≤ p^(2/3) < p = |λ|`. Hence
`Δ−λ = −λ(1−Δ/λ)` is a unit by a convergent geometric series, and the central
quotient is zero. This does not contradict the main integral-parameter theorem.
It does prevent an unqualified nonzero-domain import of the auxiliary statement.
A zero associated graded alone would not prove a zero quotient without separation;
the explicit Banach inverse avoids that inference.

### Primary-source reconciliation

The continuation acquired and read the following exact inputs:

- [Kohlhaase, author PDF](https://www.esaga.uni-due.de/f/jan.kohlhaase/Kohlhaase_Invariant_Distributions.pdf),
  §1.4, the theorem attributed to Frommer and Corollary1.4.1 with proof:
  discretely valued coefficients, rational radii in `p^Q`, weighted-c0
  logarithmic coordinates and finite right-module freeness. It locates the
  original Frommer result at §1.4 Lemma3 and Corollaries1–3. The old original
  preprint URL failed certificate-hostname validation; a candidate modern path
  returned404. Its original proof remains unacquired.
- [AW14 v1](https://arxiv.org/pdf/1308.5104v1), §§4.4–4.6,5.1,5.4:
  the affinoid Verma central annihilator and faithful Iwasawa action, including
  deformation level zero, simple connectedness, integral Cartan weight and
  very-good-prime hypotheses.
- [Ardakov–Brown author PDF](https://people.maths.ox.ac.uk/ardakov/Localisables.pdf)
  and [arXiv v1](https://arxiv.org/pdf/math/0412401v1), §5.4:
  the **lemma** supplies the finite-crossed-product Ext comparison, hence grade
  invariance. The following corollary is about injective dimensions. Fu's
  Corollary5.4 locator is therefore replaced by the precise lemma in the
  extraction. This is *Primeness, semiprimeness and localisation in Iwasawa
  algebras*, not the similarly named survey.
- [ST03 v1](https://arxiv.org/pdf/math/0206056v1), §4:
  the two radius spaces, hypothesis HYP, multiplicativity/noetherianity,
  flatness and selected faithful-flatness proof passages. The rational-radius
  restriction is retained.
- [ST02a v1](https://arxiv.org/pdf/math/0005066v1), coefficient conventions,
  Lemma3.4 and Theorem3.5 with proofs: compact continuous duality and
  admissibility, not the unrestricted algebraic vector-space dual.
- [ST02b v1](https://arxiv.org/pdf/math/9912073v1), Proposition3.7 with proof:
  connectedness of the ambient algebraic group is what makes the enveloping
  center central in distributions.
- [Venjakob v1](https://arxiv.org/pdf/math/0106269v1), §1.2, Theorems3.26 and
  3.29 with proofs: no p-torsion, Auslander regularity, and rational global
  dimension `cd_p(G)`. Their filtered-ring and Ext prerequisites remain
  explicit source inputs.
- [FGT v1](https://arxiv.org/pdf/0808.1204v1), §1 support/boundary discussion,
  Theorem4.17, its concluding proof paragraph and Corollary4.20:
  the lower bound is for `SL2(O_K)`; finite-index sublevels use restriction
  and trace. The complete base-change/local-type proof was not read here.

### Additional mathematical proof steps

#### A uniform polynomial with no exceptional-weight gap

Put `x_i=k_i+1`, and let `α` be the coordinatewise truncation degree obtained
from the generic element. One can take

`P_α(k)=2 Σ_i α_i ∏_(j≠i)(k_j+1)`.

When `k≥α`, telescope the difference of the two products of squares in Fu's
estimate. Each term is at most `2α_i x_i ∏_(j≠i)x_j²`; divide by
`D_k=∏x_i`. If `k_i<α_i`, then `D_k≤α_i∏_(j≠i)x_j≤P_α(k)`.
This covers the infinite low-coordinate strips directly. The polynomial has
nonnegative coefficients and total degree at most `m−1`.

#### Bounded central PBW division

For one factor, put `M_(a,b,c)=e^a f^b h^c`. For `c≥2`, the exact identity is

`M_(a,b,c) = -4M_(a+1,b+1,c-2)+(4b+2)M_(a,b,c-1)
 +(2λ-4b(b+1))M_(a,b,c-2)+2M_(a,b,c-2)(Δ-λ)`.

It follows from `[e,f^b]=b f^(b-1)(h-b+1)` and `hf=f(h-2)`.
Induction on c constructs remainder/division maps N,Q with
`f=N(f)+(Δ−λ)Q(f)`. The remainder has h-degree at most one, its total degree
does not increase, and Q lowers total degree by at least two. For integral λ at
odd p, coefficients stay integral. For a PBW Gauss weight `ρ≥1`, this gives
`||N||≤1` and `||Q||≤ρ^(-2)`.

Complete the finite PBW polynomials in the weighted-c0 norm. Boundedness extends
N,Q and their identity to this completion. The kernel of N is the **actual**
central ideal, since the Q term explicitly divides it; it is not just an
assertion about a dense ideal. Divide successively for the commuting factors.
At Fu's radius `r_n`, Frommer's theorem gives the normalized e,f,h weight
`ρ=p^n`. Forgetting weights maps the surviving coefficient sequences
injectively to the weight-one central completion. The algebraic owner supplies
weighted completion and bounded division; the analytic owner supplies the
Frommer comparison. There is no reverse roadmap dependency.

This is a proposed proof of the U_r normal-form/injection step. It does not
prove Fu's weaker-quotient-filtration claim for D_r, nor erase S5.

#### Finite coefficient descent for the all-integral branch

Adjoin roots of the monic polynomials `a_i²+2a_i−2λ_i`. They are integral in a
single finite extension K. A finite integral basis of O_K identifies the
completed group rings and PBW completions with finite-free coefficient
extension, component by component; decay and bounded denominators are
preserved. Flat extension commutes with the specified central quotients.

For `SL2^m`, odd p is very good and the normalized first-congruence lattice
is exactly the AW14 level-zero lattice. Apply AW14 4.6/5.4 to the integral
Cartan weight, using the existing highest-weight owner's center identification.
Faithfulness forces the Iwasawa-to-central-quotient map over K to be injective;
faithful field extension reflects this over Q_p. These comparison declarations
remain planned, but their mathematical route no longer depends on treating
every integral parameter as a Q_p-induced character.

#### The fixed-cusp boundary calculation

At a neat cusp let `z1,z2` generate its lattice in C. On
`E_n=Sym^n⊗conjugate Sym^n`, the two monodromy logarithms are
`z_j A+conjugate(z_j)B`, with `A=e⊗1`, `B=1⊗e`.
Their coefficient matrix is invertible. For nilpotent N,
`exp(N)−1=N u(N)` with u an invertible polynomial. The commuting changes of
operators identify the torus cochain complex with the Koszul complex of A,B.
Each one-variable complex has one-dimensional kernel and cokernel, even at
n=0. Their tensor has cohomology dimensions `(1,2,1)`.

For c cusps this bounds the boundary independently of n, and the long exact
sequence gives `|dim H_c^i−dim H^i|≤3c` for i=1,2. The ordinary/cuspidal
injection and Poincare–Lefschetz comparison use ALS's existing geometric
contracts. Non-neat finite stabilizers still require characteristic-zero
invariants/transfer; they are not silently turned into torus components.

### Reproducible exact regression

The following Python3 program uses only the standard library. It creates no files.

```python
"""Exact finite regressions for PAPER-FU-24, not a proof/formalization certificate."""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import product
from math import comb, factorial, prod

checks = 0

def check(condition):
    global checks
    assert condition
    checks += 1

def mat(n, fn):
    return [[Q(fn(i, j)) for j in range(n)] for i in range(n)]

def identity(n):
    return mat(n, lambda i, j: i == j)

def multiply(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)] for row in a]

def power(a, n):
    result = identity(len(a))
    for _ in range(n):
        result = multiply(result, a)
    return result

def combine(a, b, scalar=1):
    return [[x + scalar * y for x, y in zip(ar, br)] for ar, br in zip(a, b)]

def scale(a, c):
    return [[c * x for x in row] for row in a]

def flat(a):
    return tuple(x for row in a for x in row)

def rank(rows, prime=None):
    pivots = {}
    for row in rows:
        v = [int(x) % prime for x in row] if prime else list(map(Q, row))
        for j in range(len(v)):
            if not v[j]:
                continue
            if j in pivots:
                c = v[j]
                v = [x - c * y for x, y in zip(v, pivots[j])]
                if prime:
                    v = [x % prime for x in v]
            else:
                c = pow(v[j], -1, prime) if prime else 1 / v[j]
                v = [(x * c) % prime if prime else x * c for x in v]
                pivots[j] = v
                break
    return len(pivots)

def sl2(n):
    size = n + 1
    e = mat(size, lambda i, j: j if i + 1 == j else 0)
    f = mat(size, lambda i, j: n - j if i == j + 1 else 0)
    h = mat(size, lambda i, j: n - 2 * i if i == j else 0)
    return e, f, h

def valuation(n, p):
    assert n > 0
    v = 0
    while n % p == 0:
        n //= p
        v += 1
    return v

def choose_integer(n, k):
    return prod(n - j for j in range(k)) // factorial(k)

# Explicit large-coordinate and infinite-strip majorants.
for m in range(1, 4):
    for alpha in product((0, 1, 3), repeat=m):
        for k in product(range(8), repeat=m):
            x = tuple(v + 1 for v in k)
            dimension = prod(x)
            bound = 2 * sum(alpha[i] * prod(x[j] for j in range(m) if j != i)
                            for i in range(m))
            check(bound >= 0)
            if all(k[i] >= alpha[i] for i in range(m)):
                difference = prod(v * v for v in x) - prod(
                    (x[i] - alpha[i]) ** 2 for i in range(m))
                check(0 <= difference <= bound * dimension)
            else:
                for i in range(m):
                    if k[i] < alpha[i]:
                        strip = alpha[i] * prod(x[j] for j in range(m) if j != i)
                        check(dimension <= strip <= bound)

# PBW normal-form count and explicit integral standard-module formulas.
for n in range(41):
    count = sum(1 for c in (0, 1) for a in range(n + 1)
                for b in range(n + 1) if a + b + c <= n)
    check(count == (n + 1) ** 2)

for n in range(8):
    e, f, h = sl2(n)
    zero = mat(n + 1, lambda i, j: 0)
    check(combine(multiply(e, f), multiply(f, e), -1) == h)
    check(combine(multiply(h, e), multiply(e, h), -1) == scale(e, 2))
    check(combine(multiply(h, f), multiply(f, h), -1) == scale(f, -2))
    casimir = combine(combine(scale(multiply(h, h), Q(1, 2)), h, -1),
                      scale(multiply(e, f), 2))
    check(casimir == scale(identity(n + 1), Q(n * (n + 2), 2)))
    check(power(e, n + 1) == zero)
    check(power(f, n + 1) == zero)
    for k in range(n + 3):
        ep, fp = scale(power(e, k), Q(1, factorial(k))), scale(power(f, k), Q(1, factorial(k)))
        for i in range(n + 1):
            for j in range(n + 1):
                check(ep[i][j] == (comb(i + k, k) if j == i + k else 0))
                check(fp[i][j] == (comb(n - i + k, k) if k <= i and j == i - k else 0))
            check(Q(prod(n - 2 * i - j for j in range(k)), factorial(k)).denominator == 1)
            check(choose_integer(n - 2 * i, k) == Q(prod(n - 2 * i - j for j in range(k)), factorial(k)))
    monomials = [flat(multiply(multiply(power(e, a), power(f, b)), power(h, c)))
                 for c in (0, 1) for a in range(n + 1) for b in range(n + 1)
                 if a + b + c <= n]
    check(len(monomials) == (n + 1) ** 2)
    check(rank(monomials) == (n + 1) ** 2)
    for p in (3, 5, 7):
        if n == p:
            check(rank(monomials, p) < (n + 1) ** 2)
            # The Frobenius span of X^p,Y^p is invariant modulo p.
            for a in (e, f, h):
                check(all(int(a[i][j]) % p == 0 for i in range(1, p) for j in (0, p)))

# Logarithm and exponential convergence: exact exponents of p, no floats.
for p in (3, 5, 7):
    for n in (1, 2, 3):
        exponents = [Q(valuation(j, p)) - Q(j, p ** n)
                     for j in range(1, p ** (n + 1) + 1)]
        check(max(exponents) == n - 1)
        for k in range(1, 101):
            vfactorial = sum(valuation(j, p) for j in range(1, k + 1))
            check(-k + vfactorial <= -Q(k * (p - 2), p - 1))
    for j in range(1, 101):
        # At r=p^(-1/p), the coefficient p^(-j) in degree pj has size 1.
        check(Q(j) - Q(p * j, p) == 0)
        # At r'=p^(-2/p), the same term has norm p^(-j).
        check(Q(j) - Q(2 * p * j, p) == -j)
    # At r=p^(-2/3), ||Delta||<=p^(2/3)<p=|p^(-1)|.
    check(Q(2) - 2 * Q(2, 3) == Q(2, 3) < 1)
    check(Q(2, 3) - 1 == -Q(1, 3))
    # No integral 3-adic square root of 3: all residue candidates fail mod9.
check(not any(x * x % 9 == 3 for x in range(9)))

# Two commuting nilpotent cusp directions; Koszul cohomology dimensions 1,2,1.
for n in range(6):
    e, _, _ = sl2(n)
    s = n + 1
    pairs = list(product(range(s), repeat=2))
    a = [[e[i][u] * (j == v) for u, v in pairs] for i, j in pairs]
    b = [[(i == u) * e[j][v] for u, v in pairs] for i, j in pairs]
    check(multiply(a, b) == multiply(b, a))
    rank_d0 = rank(a + b)
    rank_d1 = rank([[-x for x in br] + ar for ar, br in zip(a, b)])
    dim = s * s
    check(dim - rank_d0 == 1)
    check(2 * dim - rank_d0 - rank_d1 == 2)
    check(dim - rank_d1 == 1)

# Ordered-PBW division by Delta-lambda, checking the polynomial identity and
# degree bounds that make the normal-form/division operators bounded.
def poly_sum(*terms):
    out = {}
    for coefficient, polynomial in terms:
        for key, value in polynomial.items():
            out[key] = out.get(key, 0) + coefficient * value
    return {key: value for key, value in out.items() if value}

for lam in (Q(0), Q(1), Q(3), Q(-1), Q(1, 2)):
    @lru_cache(None)
    def divide(a, b, c):
        if c < 2:
            return {(a, b, c): Q(1)}, {}
        replacements = ((-4, (a + 1, b + 1, c - 2)),
                        (4 * b + 2, (a, b, c - 1)),
                        (2 * lam - 4 * b * (b + 1), (a, b, c - 2)))
        remainder, quotient = {}, {(a, b, c - 2): Q(2)}
        for coefficient, index in replacements:
            nr, nq = divide(*index)
            remainder = poly_sum((1, remainder), (coefficient, nr))
            quotient = poly_sum((1, quotient), (coefficient, nq))
        return remainder, quotient

    for a, b, c in product(range(5), range(5), range(11)):
        remainder, quotient = divide(a, b, c)
        reconstructed = dict(remainder)
        for (u, v, w), coefficient in quotient.items():
            times_central = {
                (u, v, w + 2): Q(1, 2),
                (u, v, w + 1): -2 * v - 1,
                (u + 1, v + 1, w): 2,
                (u, v, w): 2 * v * (v + 1) - lam,
            }
            reconstructed = poly_sum((1, reconstructed), (coefficient, times_central))
        check(reconstructed == {(a, b, c): 1})
        check(all(index[2] < 2 and sum(index) <= a + b + c for index in remainder))
        check(all(sum(index) <= a + b + c - 2 for index in quotient))
        check(all(value.denominator & (value.denominator - 1) == 0
                  for value in list(remainder.values()) + list(quotient.values())))

print(f"PASS: {checks} exact finite assertions; no Lean or infinite-dimensional proof certified")
```

### Additional exact analytic diagnostics

These finite checks do not certify the completed-algebra arguments.

```python
from fractions import Fraction as F
import math
# Gauss-log/exp strict contraction bounds, using exact rational exponents.
def vp(n,p):
 k=0
 while n and n%p==0:n//=p;k+=1
 return k
count=0
for p in [3,5,7,11]:
 for a in [F(1), (F(1)+F(1,p-1))/2, F(1,p-1)+F(1,1000)]:
  assert F(1,p-1)<a<=1
  vfact=0
  for n in range(1,401):
   vfact+=vp(n,p)
   if n>=2:
    assert F(vp(n,p))<=F(n-1,p-1)
    assert F(vfact)<=F(n-1,p-1)
    assert vp(n,p)-a*n < -a and vfact-a*n < -a
    count+=4
 # At the excluded threshold, the pth nonlinear log and exp terms tie the linear term.
 a=F(1,p-1);assert 1-a*p==-a;assert vp(math.factorial(p),p)-a*p==-a;count+=2
# Exact coefficient identity for the weak quotient counterexample, a=p, R=1, r=p^-2.
def add(a,b):
 c=a.copy()
 for k,v in b.items():c[k]=c.get(k,F(0))+v
 return {k:v for k,v in c.items()if v}
def mul(a,b):
 c={}
 for i,v in a.items():
  for j,w in b.items():c[i+j]=c.get(i+j,F(0))+v*w
 return {k:v for k,v in c.items()if v}
for p in [3,5,7]:
 a=F(p);f={2:F(1),1:-a}
 for n in range(31):
  q={j:-1/a**(j+1)for j in range(n+1)};fq=mul(f,q);err=add({1:F(1)},{k:-v for k,v in fq.items()});assert err=={n+2:1/a**(n+1)}
  assert sum(v*a**k for k,v in f.items())==0
  # Error norm exponent at the weaker radius is -(n+3); tends strictly to -infinity.
  exponent=(n+1)-2*(n+2);assert exponent==-n-3;count+=3
 assert a!=0 and -a!=0

print(f"PASS: {count} exact finite assertions")
```
