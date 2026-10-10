# Independent review: Coleman power series, L1

Accepted as a finished planning pass for issue #6431 by Codex (GPT-6), session `codex-zdCsPZ`, on 10 October 2026. This session did not write the input: BP-ColemanPowerSeries--L1 was submitted by session `codex-CzJpqR` in #8560. Every node has an individual mathematical verdict in the packet: **15 verified, 25 corrected, two added, none unverifiable**. There are **42 nodes, nine definitions/constructions, 35 API items, 27 unit tests, six planets and 23 confirmed baseline references**. All new declarations remain `unchecked` specifications.

The pass is `complete`, with L1 coverage `planned`, not `closed`. Four precisely stated supplier requests remain. Acceptance means that the plan and its conditional proof routes are sound; it does not certify that those suppliers or the proposed Lean proofs have been implemented. The reader was outside this issue's allowed edits; assembly instructions below identify its necessary reconciliation.

## Corrections made in place

1. **Additive trace sources.** Replaced norm-only locators with Coleman, §II, Theorem 4 and Corollary 5(i), printed p.98, and Lemma 6, p.99. These support the integral trace, divisibility and finite-level trace square. The comparison with the independently supplied measure operator is explicitly a worker density argument; Coleman does not state a PMIA theorem.
2. **Norm and precision locators.** The norm evaluation square is §IV, Corollary 12(ii), p.102, rather than (i). Near-one digit gain is Lemma 13(i), p.103; the unit-ratio and iterated versions derive from (i). The residue Frobenius identity is equation (2) in the proof of Lemma 13(ii), p.103. The direct continuity sources are norm Theorem 11, p.102, and additive Theorem 4, p.98.
3. **Compactness source scope.** Lemma 2a is in §II, pp.95–96, rather than §I, pp.94–95. It is a bounded-series convergence criterion. Compactness in the finite-unramified setting is established by the packet's compact-product and clopen unit-constant argument, not attributed to that lemma as a stated theorem.
4. **Integral root-product proof.** The scalar map on multiplication-matrix entries is `map(ρ) ∘ Φ`; mere coefficient extension omits the scalar structure. With `x_i=C(ξ^i)Y`, the evaluated basis expansion gives `V A_f=diag(e_i) V`. Distinct primitive-root powers and the unit `Y` make the Vandermonde determinant nonzero. Taking determinants and cancelling in the domain `S[[T]]` proves the product with all p factors. This removes the unnecessary fraction-series extension and descent, and records the exact pinned Vandermonde and determinant-naturality prerequisites. Native `HasEval` is retained for the translated points.
5. **Exact supplier imports.** Added the existing L0 coefficient-level, absolute degree/basis, relative degree/minimal polynomial, unit norm/equalizer, Frobenius/inclusion and evaluation-point nodes where used. The L0 request now describes only the residual arithmetic adapters, rather than asking to plan those objects again. Eventual nonvanishing directly uses the absolute integral power-basis generator/dimension to deduce the minimal-polynomial degree, so its unnecessary generic L0 request was removed. The ψ comparison imports the two precise PMIA coefficient-extension nodes as well as its still-needed receiving-topology adapter.
6. **Used API properties and constructor acceptance.** Promoted `correctedNorm_continuous` and `normLimit_tendsto` to independent nodes, marked `addedBy: REV-ColemanPowerSeries--L1`. Their signatures already existed in Suggested. The first is a direct prerequisite of projector fixedness, interpolation existence and projector continuity. The second is a direct prerequisite of projector precision, with both value and inverse-value convergence in native Units topology explained. Removed continuity from the projector constructor's acceptance statement; the separate continuity theorem proves it without a forward dependency.

Current WORKERS.md and detail.json set target-level planning for every roadmap, superseding the generated issue's older lemma-level setting. Existing detail was preserved. The matrix steps stay in their proof sketch; only the two API properties used by other nodes were promoted, as PROTOCOL §4 requires. No owner, layer or target moved. Smaller coefficient calculations were not expanded into a new declaration catalogue.

## Mathematical and interface checks

The finite free ℤ_p coefficient basis transfers the accepted parent's coordinate injectivity and surjectivity componentwise. Substitution and the vectors `Y^i` have ℤ_p coefficients, so the component maps commute with them. This gives the native rank-p basis before invoking norm or trace, and prevents the native norm's non-finite fallback or a rank-one self-algebra from representing the construction.

The corrected coefficient action is arithmetic p-Frobenius, not q-power Frobenius. Reduction of the rank-p multiplication matrix gives the norm congruence `Nf≡Σf`. The determinant's linear term is divisible by p through the trace, and its higher terms have precision at least `2r≥r+1` for `r≥1`. Thus near-one gain and unit-ratio gain include p=2. Corrected iteration starts with one digit and gains one per step; the stated exponent `b+1` includes `b=0`.

Evaluation uses roots of order `p^(n+1)`, the actual integral closures, and native convergent `eval₂Hom`. The relative power basis is a characterized supplier input; the norm square is a conclusion of matrix specialization, never an assumed interpolation equation. Twisted evaluation is `σ_n^(−n) ε_n`. Descending a lift from m to n applies m−n norms and inverse coefficient Frobenius, leaving twist exponent n. The doubled-level approximation at 2r uses the exact exponent `2r−n≥r` for `n≤r`, so its errors are uniformly in `p^(r+1)` before evaluation.

Existence follows from a cofinal convergent subnet in compact native units, continuity of evaluation and M, and vanishing scalar p-power errors. Uniqueness uses the independent complete-DVR Weierstrass factorization and increasing minimal-polynomial degrees; it does not claim that the cyclotomic evaluation points converge to zero. The compact-to-Hausdorff inverse theorem gives the interpolation homeomorphism. The coefficient-Frobenius and ℤ_p comparisons follow from their evaluation characterizations and uniqueness.

The nine definitions/constructions each retain three tests. The tests distinguish the scalar substitution, rank-p determinant, trace normalization, coefficient Frobenius, inverse evaluation twist and projector. Native equality and coercion tests compare the intended library objects; all proofs remain placeholders. The dyadic examples use `s=(-1)^(p−1)`: `N(Y)=sY`, with fixed series `sY` and compatible tower `sζ_n`. The six planet names identify central constructions and the Coleman interpolation theorem. No source excerpt is stored.

## Baseline audit

The full statements and ambient hypotheses of every cited entry were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The two Tau Ceti source modules were also compared byte-for-byte with their exact-pin public files. No baseline citation was removed or replaced; the Vandermonde nonzero-determinant theorem was added. The module import elaborates at the same pin.

| Confirmed reference | Required interface |
| --- | --- |
| `mathlib:PowerSeries.substAlgHom` | Formal zero-constant substitution as an algebra homomorphism. |
| `mathlib:PowerSeries.mk` | Native series made from coefficient functions. |
| `mathlib:Module.Basis.linearCombination_repr` | Reconstruction of a vector from its native basis coordinates. |
| `mathlib:Module.Basis.mk` | Basis from linear independence and spanning in the specified module. |
| `mathlib:Continuous.homeoOfEquivCompactToT2` | A continuous equivalence from a compact space to a Hausdorff space is a homeomorphism. |
| `mathlib:Algebra.norm` | Determinant of multiplication as a monoid homomorphism; the module must be certified finite free for the intended value. |
| `mathlib:Algebra.trace` | Base-valued linear trace of left multiplication. |
| `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries` | Polynomial series are dense for the coefficientwise topology. |
| `mathlib:DenseRange.equalizer` | Continuous maps into a Hausdorff space agreeing on a dense range are equal. |
| `mathlib:RingHom.map_det` | Ring homomorphisms commute with finite matrix determinants. |
| `tauceti:PowerSeries.aeval_subst` | A continuous algebra map evaluates formal zero-constant substitution without requiring discrete coefficient uniformities. |
| `mathlib:PowerSeries.coeff_map` | Coefficient maps act coefficientwise. |
| `tauceti:TauCeti.Algebra.normUnits` | Native norm as a homomorphism of actual unit groups, by Units.map. |
| `mathlib:Units.map` | Restricts a monoid homomorphism to actual units including inverse witnesses. |
| `mathlib:MonoidHom.eqLocus` | Native equalizer subgroup of two homomorphisms. |
| `mathlib:PowerSeries.isUnit_iff_constantCoeff` | A series is a unit exactly when its constant coefficient is a unit. |
| `mathlib:PowerSeries.eval₂Hom` | Native convergent evaluation for continuous coefficients and HasEval in a complete Hausdorff linearly topologized target. |
| `mathlib:MulEquiv.ofBijective` | Native multiplicative equivalence associated to a bijective multiplicative homomorphism. |
| `mathlib:Algebra.norm_eq_matrix_det` | Computes the native norm in any finite basis. |
| `mathlib:Algebra.trace_eq_matrix_trace` | Computes the native trace in any finite basis. |
| `mathlib:PowerSeries.map_frobenius_expand` | For a commutative ring of exponential characteristic p and p≠0, coefficient Frobenius after expansion T↦T^p equals the p-th power of a series. |
| `mathlib:Matrix.det_pow` | The determinant of the n-th power of a finite square matrix over a commutative ring equals the n-th power of its determinant. |
| `mathlib:Matrix.det_vandermonde_ne_zero_iff` | For a finite Vandermonde matrix over an integral domain, its determinant is nonzero exactly when its point function is injective. This supplies cancellation in S[[T]] without inverting p. |

In particular, density uses the coefficientwise topology and a Hausdorff codomain; norm and trace use the explicit induced scalar module and finite basis; Frobenius expansion is used only after residue reduction to characteristic p; and convergent evaluation supplies its required continuous coefficient map and native `HasEval`. Name existence alone was not treated as an interface proof.

## Suppliers, ownership and open work

The parent ColemanPowerSeries packet and its L0 follow-up are accepted. The PMIA packet currently has `review: needs_changes`; its coefficient-extension and formal complete-DVR factorization nodes were read as planned supplier interfaces, not declared completed theorems. The independent exact-node traversal is acyclic, with **186 reachable nodes and 764 edges**; its two nonlibrary stage leaves are the explicitly requested Coleman L0 and PMIA L2 refinements. Upstream stage leaves are recorded as roadmap inputs rather than claimed pinned declarations.

The four open requests are:

- LocalFieldsRamification L0: canonical native integer rings, compact/complete Hausdorff adic topologies, the ℤ_p finite-free structure, and closed scalar p-power ideals with vanishing errors.
- LocalFieldsRamification L2: continuous arithmetic p-Frobenius and its residue action, preserving p and the native topology.
- Coleman L0: coherent valuation-ring/integral-closure and inclusion adapters, continuous evaluation, the relative integral basis `ζ_(n+1)^i`, integral/field norm and trace comparisons, Frobenius/norm commutation, and polynomial unit lifts. The accepted L0 G1 arithmetic receiver and chosen-generator basis refinement remains open. An absolute basis alone is not the relative rank-p adapter.
- PMIA L2: the finite-unramified coefficient and receiving-topology adapter for the independent bounded ψ with its polynomial action and continuity. The trace identity cannot be used to manufacture the supplier ψ.

The reviewed library-coverage audit was checked. Current read-only TauCetiRoadmap main `81207c7f16d5abf770f13a7d2bdcdb465c030787` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected for overlap. LocalFieldsRamification already owns the finite-extension topology/integer-ring/Frobenius constructions, including its `integerRing_eq_integralClosure` comparison. Current-library results newer than the pin remain imports through that owner. No Coleman integral power-series norm, bounded ψ or interpolation implementation was found in the current library or the newer roadmap set. Existing Weierstrass theory is reused through PMIA; none is replanned here. LocalFieldsRamification and ArithmeticDirichletSeries were read as upstream roadmap/interface examples. No upstream checkout was changed or built.

## Public sources and independently verified findings

Coleman was read in the [original journal scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), using the packet's Göttingen IIIF manifest. The inspected printed locators are pp.91–92, 94–106, including Theorem A; §II Lemma 2a, Theorem 4, Corollary 5 and Lemma 6; §III Theorem 8; and §IV Theorem 11 through Corollary 17. The source supports the finite-unramified multiplicative specialization. Component basis, determinant, compactness and measure comparisons are identified as worker arguments rather than attributed as separately printed theorems.

Sharifi was checked against the [author's PDF](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf), §5.4, printed pp.143–147, SHA-256 `99b3a36201cecf55045da6913d462cacdb8dff83bff5860c5883ab7ea824bd32`, and the [author's HTML](https://math.ucla.edu/~sharifi/notes/iwasawa-ch05.html). All three version-specific source findings are independently confirmed, with reasons and this review's id recorded in each finding:

- E-L1-1: Theorem 5.4.9, p.145, has a root exponent inconsistent with Notation 5.4.1's tower. At p=3, level zero would evaluate at zero in O and cannot represent every unit of the degree-two first cyclotomic layer. Reindexing consistently repairs the statement.
- E-L1-2: the proof of Proposition 5.4.6, p.144, omits the identity root from its product. A constant gives p−1 factors instead of the rank-p norm's p factors.
- E-L1-3: the final congruence identification in that proof, p.145, drops coefficient Frobenius. A residue coefficient outside the prime field distinguishes it from the corrected expression.

No published correction was found in the source versions and author-site results searched. Related L0 findings describe overlapping issues; this review confirms the L1 entries in place without editing another job or launching an errata job.

## Validation and assembly instructions

The packet checker reports **zero errors and zero warnings**. The source-finding validator, exact-node acyclicity traversal and submission path/content checks pass. The final Suggested file elaborates via `lean-check` at the pinned environment with **only declaration-uses-sorry warnings**. No Lean proof completion is claimed; arithmetic supplier realizations remain explicitly characterized hypotheses.

For assembly/package, update the unedited L1 reader's citation paragraphs, root-product proof, exact supplier dependencies and narrowed L0 request; add the two used API-property nodes and their direct edges; retain the separate projector-continuity proof; and carry all three confirmed source-finding verdicts. Keep `planned` coverage and all four requests until the native arithmetic receiver and independent ψ adapter have actually been discharged. The 42-node packet and elaborated signatures are the reviewed specification. There is no unresolved question requiring the orchestrator to send this review back, and no additional review work remains in this job.
