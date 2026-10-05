# REV-DESIGN-EllipticLegendreCharacterInterfaces

Codex · session **codex-LmWcb6** · Refs #1721 · 2026-10-05

**Verdict: accepted**, after the corrections below. This is an independent review of DESIGN-EllipticLegendreCharacterInterfaces (creator session codex-a71f92, issue #1692). It accepts a complete **target-level planning pass**, with the recorded requests and gaps, and certifies no implementation.

All **37 nodes** were checked: 32 verified and five corrected; none added or unverifiable. The packet has two definitions, six constructions, fourteen lemmas, fourteen theorems and one comparison. It retains **33 API items, 27 unit tests, 19 planets, 56 baseline declarations, three requests and four gaps**. All six layers remain planned; none is closed. Every implementation status remains unchecked.

## Scope, sources and ownership

The review read every node, prerequisite list, source locator and excerpt, every API/test, every roadmap layer description and the suggested file. The seven routed extraction items /28, /29, /30, /31, /34, /69 and /77 are accounted for by LG.0, LG.1, LG.1, LG.3, LG.3, LG.5 and LG.4 respectively, with LG.2 supplying their common native descent reading. The field, rational and prime-field domains are distinct. Singular parameter collisions and characteristic two are excluded wherever ellipticity is needed. Six labels are retained even when values coincide.

The [Bennett–Siksek publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) was downloaded and read at the cited passages on 2026-10-05: the Lemma 5.2 symmetric-curve paragraph (p.366), equation (17) and its context (p.367), the complete proofs of Lemmas 6.2 and 6.3 (pp.367–368), the descent discussion and complete Lemma 6.5 proof (p.370), and equation (22) and the local Lemma 6.6 argument (pp.370–372). Its SHA-256 is **3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf**, matching the packet. The review does not inherit the creator's full-paper reading as its own. Locators and excerpts agree with the publisher text after reading mathematical typography, including the prime on the twist equation and the superscripts in the exact two-adic divisibility statement.

The paired equation and invariant calculations are simultaneous coefficient calculations, compatible with the protocol's target-level granularity. The normalization, subgroup and finite-abelian arguments have explicit mathematical routes; proof sketches do not assume their desired conclusions. No additional declaration-sized mathematical target was needed in this review.

The reviewed audit entries for EllipticCurves Layers 2–6, CA.1, BSD.0 and R01.3 were compared with the actual pinned statements. The source-tree search found no Legendre declaration in either pinned elliptic-curve directory. Existing group law, descent, finite-point types, projective count, twist coefficients and root-count theorem are imported. The new CRT/squareclass maps are adapters for native A and M. They do not rebuild a generic descent map. The tuple is an ordered-root coordinate calculation; ModularCurves 9E retains the scheme-level Möbius action and invariant-ring theory.

Supplier statements were read directly: CA.1/quadratic-character-of-a-squareclass supplies valuation-parity support, squarefree odd conductor and the trivial character of conductor 1; EllipticCurves Layer 4 supplies minimal-model reduction and the j-integrality direction; R01.3 requests the actual conductor comparison; BSD.0 requests the generic twist factor comparison. The current EllipticCurves text at its Tate-algorithm paragraph explicitly places ramification-theoretic identification in a separate project, so the packet's R01.3 request is appropriate. The audit's broader duplication note does not authorize assuming that comparison. Upstream roadmaps were not modified. The complete Multiquadratic and ArithmeticDirichletSeries documents were read as nearby library-building models, together with the relevant EllipticCurves and ModularCurves passages.

## Corrections in place

1. **Affine coordinate conversion.** Added baseline `tauceti:WeierstrassCurve.Affine.μ₀_some` and made it a direct prerequisite of descent-off-roots and descent-at-root. Their proofs now explicitly follow μ_apply, μ₀_some and the appropriate μX branch. This matters for the native module interface: μ_apply alone yields μ₀, not μX.
2. **Trivial unit squareclasses.** Added baseline `mathlib:QuotientGroup.eq_one_iff` to the halving criterion. The quotient by the range of squaring is trivial exactly when the unit has a unit square root; a nonzero field square has such a root. At a cubic root, zero is still a field square and never a unit representative.
3. **Descent product closure.** Replaced the implicit split-algebra norm comparison by a proof through the listed O, nonroot and root formulas. The representative products are respectively 1, y², d⁴λ², d⁴(1−λ)² and d⁴λ²(λ−1)². Added the corresponding direct prerequisites. The norm theorem remains a compatible existing baseline fact, with no unplanned norm-comparison theorem assumed.
4. **Minus-one prototype.** Reproduced failure to infer ellipticity of scaledLegendre 1 (−1) over a symbolic field with 2 nonzero. The generic instance requests NeZero(λ−1), and typeclass search does not normalize (−1)−1. Added a derived specialized instance using the existing ellipticity iff; its body introduces no new admission and uses the admitted ellipticity equivalence, so it remains a prototype. The Mathlib projection now checks the formerly failing instance-resolution example.
5. **Baseline wording.** Clarified that `toCharNeTwoNF` requires invertible 2 over a ring; nonzero 2 suffices over a field. No citation was removed or renamed. Both added citations exist at the pins and provide exactly the described interfaces.
6. **Source finding.** Added this review's `confirmed` verdict to E1, with the required reviewer id. The publisher's Lemma 6.6 coordinate formula is checked at its exact locator. The corrected point and its third coordinate remain the ones already planned; this is confirmation of an existing finding, not a new novelty claim or contact with the authors.

No target statement, API item, unit test, planet, stage id, supplier or roadmap boundary was changed. The roadmap definition's review records acceptance. The two native character/conductor signatures remain explicitly omitted because their owner objects are unavailable; their exact mathematical statements and the prototype gap remain in LG.1.

## Node-by-node check

Node suffixes below are relative to `EllipticLegendreCharacterInterfaces:`; the packet review stores the full ids and these notes.

| Node | Verdict | Check |
|---|---|---|
| LG.0/legendre-model | verified | Published equation (17), p.367; five native coefficients, ring-map compatibility and all four rational/boundary tests checked. |
| LG.0/scaled-legendre-model | verified | Published twist-by-two equation, p.371; d,d² coefficient scaling and native twist discriminant d checked, including d=0. |
| LG.0/legendre-parameters | verified | Six published ratios, p.368; all labels and coincidences at −1,2,1/2 checked; ordered-root adapter is separate from ModularCurves 9E. |
| LG.0/legendre-invariants | verified | Direct substitution into pinned b-invariants gives the displayed Δ,c₄,j; field ellipticity excludes characteristic 2 and λ=0,1. |
| LG.0/scaled-invariants | verified | Same coefficient computation and pinned native twist invariants give d⁶,d² and unchanged j; d=0 is singular. |
| LG.0/parameters-from-root-orderings | verified | All six displayed root orders give the claimed ratios by cancellation of nonzero differences; rational regression checks labels and boundary exclusions. |
| LG.0/split-normalization | verified | Pinned VariableChange action uses old x=new x+e₀; comparing cubic coefficients gives d=e₁−e₀ and λ=(e₂−e₀)/d without assuming a rational square root of d. |
| LG.0/full-two-torsion-normalization | verified | Pinned completion of the square, native point equivalence, two-torsion root count and separability provide three distinct roots and the split factorization over ℚ. |
| LG.0/legendre-two-torsion | verified | Distinct roots are nonsingular on the elliptic native model; each root point doubles to O, and their horizontal-line sum is O. All three labelled tests checked. |
| LG.0/scaled-legendre-twist-identity | verified | All five coefficients of native quadraticTwistOf at (0,−d/4) agree; the discriminant parameter is d, not 4d. |
| LG.0/legendre-two-torsion-exhausts | verified | Pinned y_eq_zero_of_order_two forces every affine double-kernel point onto a root; native point constructors distinguish them from O. |
| LG.1/legendre-j-valuation | verified | Unequal-valuation calculation gives the three cases including p=3; rational numerator λ²−λ+1 is nonzero. Good j means integral, not necessarily a unit. |
| LG.1/good-prime-units | verified | Published Lemma 6.2(i) and the direct j calculation agree. Minimal-model good reduction, twist j-invariance and every root ordering are separated; exact local supplier request remains. |
| LG.1/legendre-good-model | verified | Integral coefficients and unit discriminant follow from the two unit hypotheses at an odd prime. Generic ℚ_p/unit/reduction bridge is explicitly requested. |
| LG.1/character-odd-support | verified | CA.1 squareclass-character node states odd support by valuation parity and includes conductor 1. Every allowed ω is an odd-prime unit, so good-prime units prove support containment. |
| LG.1/character-conductor-divides | verified | Published Lemma 6.2(ii); squarefree odd character conductor plus the exact R01.3 support request prove divisibility. Actual conductor is not replaced by a discriminant or Ogg exponent. |
| LG.2/split-cubic-crt | verified | Pinned native one-root CRT plus polynomial CRT and evaluation quotients give A≃K×K×K in the declared order; coprimality follows from distinct roots. |
| LG.2/split-squareclass-equivalence | verified | Units and squares transport through the ring equivalence and its inverse. The quotient map is native QuotientGroup.map; no second generic descent or squareclass theory is planned. |
| LG.2/descent-off-roots | corrected | Added native μ₀_some citation and explicit μ→μ₀→μX passage before evaluating x−θ. Nonzero differences and O branch checked. |
| LG.2/descent-at-root | corrected | Added native μ₀_some citation. The corrected root representative evaluates to f′(r) at r and r−s at other roots; all three sign-sensitive tuples agree with the source cases. |
| LG.2/descent-product | corrected | Replaced the unlisted split-norm compatibility step by direct nonroot/root/O cases using explicit prerequisites. Products are y², d⁴λ², d⁴(1−λ)² and d⁴λ²(λ−1)². |
| LG.2/halving-square-criterion | corrected | Added QuotientGroup.eq_one_iff as the precise unit-squareclass criterion; checked both nonroot and root branches, where zero is a field square but never a unit representative. |
| LG.3/two-by-four-subgroup | verified | Published Lemma 6.3: −1 nonsquare ensures one of the two root points is a double. A half has order 4 and an independent root point supplies Z/2×Z/4; count comparison is native. |
| LG.3/minus-one-order-four | verified | Published (i,1−i) witness, p.370; direct membership, nonzero tangent denominator and the two F₅ coordinate tests checked. |
| LG.3/minus-one-no-order-eight | verified | Published Lemma 6.5 proof: only (0,0) is divisible, its four halves have first class [i], and Euler’s criterion makes i nonsquare at p≡5 mod8. |
| LG.3/minus-one-point-count | verified | Finite-abelian structure plus four two-torsion points and the no-order-eight result gives at most Z/4×Z/4; nonhalving of (±1,0) rules out that order-16 case, leaving exact valuation 3. |
| LG.4/twist-halving-point | verified | Published p.371 display independently corrected: r=2t,s=2iv give x=r²+rs,y=rs(r+s), r²−s²=2. Membership and y≠0 hold under the stated field hypotheses; all four tests checked. |
| LG.4/twist-halving-double | verified | Denominator-cleared tangent numerator is 2rs(r+s)², slope r+s; native doubling gives (r²,0). Universal polynomial identities independently checked. |
| LG.4/twist-halving-order | verified | Its double is the nonzero labelled root point (2λ,0), whose double is O, so exact order is 4. |
| LG.4/twist-halving-descent | verified | The nonzero third difference is 4itv, unchanged by the y correction. The nonroot descent formula supplies its unit squareclass. |
| LG.5/symmetric-cubic-trace-zero | verified | Published symmetric equation in Lemma 5.2 proof, p.366; direct square-root counting and x↦−x character cancellation give count p+1 and trace 0, including p=3. |
| LG.5/twist-euler-factor-specialization | verified | Published twist-by-two trace sign, p.371; exact BSD.0 generic comparison request and coefficient twist identity specialize the native trace normalization. Square scalars and d=2 checked. |
| LG.2/split-cubic-evaluation | verified | Successive pinned CRT evaluation lemmas give (h(0),h(d),h(dλ)), including constants and the native root. |
| LG.2/split-squareclass-unit-reading | verified | Native quotient maps applied to CRT units give the three classes; the constant 4/2 tests distinguish a square from a nontrivial rational squareclass. |
| LG.3/minus-one-double | verified | Published doubling equation, p.370; native tangent formula has nonzero denominator 2(1−i) and gives (0,0). |
| LG.3/minus-one-order | verified | Native double is nonzero and killed by 2, so order is exactly 4; matches the published order-four list. |
| LG.3/minus-one-first-descent | corrected | Mathematical first class [i] checked against the source and nonroot reading. Added an explicit scaled minus-one ellipticity instance in the suggested file after reproducing a symbolic instance-resolution failure. |

## Baseline receipts

All 54 original declarations were read independently in their source files at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**, with surrounding namespaces and hypotheses. Every original module SHA-256 agrees with the packet. The table includes the two new declarations, making 56. Links refer to the actual pinned files; nested namespaces and `_root_` declarations were checked, not inferred from an unqualified-name search.

| Pinned module | Confirmed declarations |
|---|---|
| [Mathlib/GroupTheory/FiniteAbelian/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FiniteAbelian/Basic.lean) | `AddCommGroup.equiv_directSum_zmod_of_finite` |
| [Mathlib/RingTheory/Ideal/Quotient/Operations.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Operations.lean) | `Ideal.quotientMulEquivQuotientProd` |
| [Mathlib/RingTheory/Polynomial/Quotient.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Quotient.lean) | `Polynomial.quotientSpanXSubCAlgEquiv` |
| [Mathlib/GroupTheory/QuotientGroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean) | `QuotientGroup.map`, `QuotientGroup.eq_one_iff` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean) | `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.c₄`, `WeierstrassCurve.j`, `WeierstrassCurve.Δ` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean) | `WeierstrassCurve.Affine.Equation` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean) | `WeierstrassCurve.Affine.Point`, `WeierstrassCurve.Affine.Point.add_self_of_Y_ne` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean) | `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`, `WeierstrassCurve.minimal` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean) | `WeierstrassCurve.VariableChange`, `WeierstrassCurve.variableChange_j` |
| [Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean) | `WeierstrassCurve.toCharNeTwoNF` |
| [Mathlib/NumberTheory/LegendreSymbol/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/Basic.lean) | `ZMod.euler_criterion`, `ZMod.exists_sq_eq_neg_one_iff`, `legendreSym.at_neg_one`, `legendreSym.eq_neg_one_iff` |
| [Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean) | `legendreSym.at_two` |
| [Mathlib/NumberTheory/Padics/PadicVal/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean) | `padicValRat`, `padicValRat.add_eq_min`, `padicValRat.div`, `padicValRat.mul` |
| [Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean) | `quadraticChar`, `quadraticChar_card_sqrts` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean) | `WeierstrassCurve.Affine.A`, `WeierstrassCurve.Affine.M`, `WeierstrassCurve.Affine.equivProdA'`, `WeierstrassCurve.Affine.equivProdA'_apply`, `WeierstrassCurve.Affine.ker_μ_eq`, `WeierstrassCurve.Affine.normM_μ₀_eq_one`, `WeierstrassCurve.Affine.separable_f`, `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero`, `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`, `WeierstrassCurve.Affine.μ_apply`, `WeierstrassCurve.Affine.μ₀_zero`, `WeierstrassCurve.Affine.μ₀_some` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean) | `WeierstrassCurve.Affine.Point.equivVariableChange` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean) | `WeierstrassCurve.Affine.card_ker_nsmul_two` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean) | `WeierstrassCurve.Affine.finite_point` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean) | `WeierstrassCurve.c₄_quadraticTwistOf`, `WeierstrassCurve.isElliptic_quadraticTwistOf_iff`, `WeierstrassCurve.j_quadraticTwistOf`, `WeierstrassCurve.quadraticTwistOf`, `WeierstrassCurve.Δ_quadraticTwistOf` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean) | `WeierstrassCurve.frobeniusTrace`, `WeierstrassCurve.frobeniusTrace_def`, `WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_eq_card_point` |
| [TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean) | `WeierstrassCurve.y_eq_zero_of_order_two` |

## Validation and limits

- Official `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticLegendreCharacterInterfaces.json`: **zero errors, zero warnings**. This checks references, graph cycles, stage coverage, API/tests and planet constraints.
- The official source-issue validator and `check_errata.versions_checked` were called on the packet's sourceIssues/sourceVersions: **zero errors**. The standalone errata CLI expects an errata-v1 container and is not a packet checker.
- The full suggested file was attempted through **lean-check**, and failed immediately because the imported `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT` object is absent from the shared build. **Full native elaboration is not certified.** No libraries were built, no caches downloaded and no language server started.
- A derived scratch projection, removing only the Tau Ceti imports and the already separated native portion, elaborated through **lean-check** at the pinned Mathlib with exit 0, **61 admission warnings and no errors or other warnings**. It also contains a symbolic instance-resolution example for the minus-one correction. This is a signature check with admissions, not a proof of the mathematical targets.
- An independent exact-arithmetic program enumerated odd primes below 32, all nonsingular finite-field d/λ combinations for its halving and twist checks, admissible corrected witnesses, all relevant two-primary cases and rational parameters with numerator −10 through 10 and denominator 1 through 8. Repeated rational fractions count as cases. Its group law and counts were written independently of the submitted Lean signatures. Four universal witness identities were checked as sparse polynomials over the integers in r,s, without a symbolic-algebra dependency. All assertions passed.

| Independent diagnostic | Cases |
|---|---:|
| corrected_witness | 112 |
| halving | 72396 |
| minus_one_count | 3 |
| minus_one_witness | 6 |
| printed_off_curve | 100 |
| rational_valuations | 456 |
| root_orderings | 152 |
| root_products | 8700 |
| symmetric_trace | 88 |
| twist_trace | 2900 |
| two_by_four | 76 |
| universal_polynomial_identities | 4 |

The printed-witness failure count is an observation, not an assertion that the printed formula fails for every tuple. Finite examples are local formula checks, not solutions of the paper's global large-exponent hypotheses. The two-primary argument was checked separately: absence of order eight alone would not exclude Z/4×Z/4; the nonhalving of the other root points supplies that missing distinction.

Reproducibility receipts: regression source SHA-256 **6a8e885b01a7542730fc726e00f76e44e496d51438de01bff41e6861b5885ec7**; regression result SHA-256 **b823a056b31dc12e897f205a68a13e5625dd7b484afa14f84f5e6a7cc3ecc84d**; Mathlib projection SHA-256 **09f5a0b7217069625a096f110bfe42d3bc02dea03168fb14ad8c95100e5d78d5**. Scratch artifacts are removed after submission; the exact tested domains, mathematical formulas and persistent corrections are recorded here.

## Remaining work and orchestrator note

Acceptance retains four explicit gaps: unavailable compiled native imports; local minimalization/unit and conductor comparison requests; generic twist-factor comparison; and native character/conductor signature objects. Resume implementation by obtaining an existing compiled Tau Ceti baseline, then elaborating the native portion against its owners' actual declarations. Discharge each request on its existing supplier rather than building duplicates in this roadmap.

No mathematical decision or author contact is requested. The review issue does not authorize edits to the reader document. Its target statements remain unchanged and consistent; the orchestrator should synchronize its direct-input/proof bookkeeping for the three descent corrections and update the baseline count from 54 to 56. The old design handoff is historical and has not been overwritten. The new review handoff records the final receipts and boundaries. No new job was claimed.
