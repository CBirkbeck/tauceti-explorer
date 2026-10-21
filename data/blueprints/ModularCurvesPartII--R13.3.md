# Modular curves, following Katz–Mazur, Part II: Uniformization, integral boundary and Hecke cohomology

## Scope and conventions

This part constructs the generalized integral boundary and its coarse modular curves, compares their generic fibres with the existing analytic curves, computes the modular bad fibres used by level lowering and intersection theory, and realizes Hecke operators on their Jacobians and integral cohomology. It covers R13.3, the R13.4 aggregate and its R13.4a/R13.4b suppliers, R13.5, R13.6, R14.1 and R14.2. It continues the ten checkpoint targets with their identifiers preserved. The accepted RS-06 revision of 30 September 2026 fixes this ownership.

Use a positive integer N for level, p for a geometric residue or Hecke prime, and ℓ for a coefficient prime. A prime-to-residue-characteristic Tate module requires ℓ≠p. Γ(N) means an honest Drinfeld framing; fixing a primitive Weil pairing chooses a generic component. A projective framing is a framing modulo scalar and has residual automorphisms. These are different moduli problems. X_s(ℓ) denotes the normalizer of split Cartan, equivalently an unordered pair of distinct ℓ-subgroups; it denotes the Fricke quotient of X₀(ℓ²), not the ordered split-Cartan curve.

Keep a stack, its formal framed atlas, its coarse curve and its normalized plane image distinct. A coarse completion requires an invariant-ring/completion theorem. Stack finite flatness does not imply coarse finite flatness. A nodal special fibre, a regular total space and a stable model are separate assertions. In particular, a normal local node uv=ϖⁿ need not have a regular total space; regular resolution subdivides that thickness into unit edges. Graphs retain loops, parallel edges, branch orientations and thicknesses.

Write π₁ for forgetful and π₂ for quotient degeneracy maps. Upper Jacobian Hecke means π₁*π₂^* and lower means π₂*π₁^*. Lower cotangent action is classical T_p; upper is its Petersson adjoint. Diamonds transport P to aP. Distinguish A_m, every order-m subgroup, from C_m, cyclic order-m subgroups: their degrees are σ₁(m) and ψ(m). The coherent operator on weight-k forms is a normalized trace whose integral p-divisibility needs proof. Picard norm and integral étale trace use no inverse-degree averaging.

## Existing work and the construction order

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The actual baseline declaration read for this part is HeckeRing.GL2.heckeT_mul_of_coprime: for positive m,n with coprime underlying naturals, the two full-subgroup operators multiply to T_(mn). It supplies abstract algebra; it does not identify cyclic operators at repeated primes.

The current upstream ownership screen used TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Current TauCeti.tateCurve already owns the integral Weierstrass coefficients, Δ=X times a unit, its coefficient −24 in degree two, and j=X⁻¹(1+744X+…). Its valued-field specialization requires a unit q of norm less than one. This part adds the generalized proper n-gon family and its modular comparison, rather than planning those coefficients again. These current declarations are ownership information, not claims about the pinned baseline.

Import ModularCurves 2B/2E for elliptic quotients and the pairing, 7F–7H for the actual Serre–Tate/rigidity/regularity engine, and 8C for cyclic-generator deformation rings. Its Layer 10 owns the prime N≥5 diamond quotient over ℤ[1/N], including Tate torsion, normalized cusp charts, widths, the characteristic-2/3 table and the distinction between finite-flat j-fibre, reduced cusps and Cartier boundary. Agreement with that package is a comparison target. Only composite/small levels, level-dividing primes and the generalized family are new boundary work here.

JacobianChallenge and StableReduction were read in full. JacobianChallenge D supplies a field-curve Jacobian; it does not construct every relative Picard scheme over ℤ[1/N]. Relative Picard representability and lifting come from AlgebraicModuliForArithmeticGeometry A0-extension, with an explicit relative curve norm/polarization request. StableReduction owns nodes, dual graphs, general blowups, minimal models, semistable existence and stabilization. Néron theory belongs to NeronModelsAndSemistableAbelianVarieties. Lower-tier LPV.7 owns general nodal-curve normalization, specialization and monodromy. This part supplies the modular components and maps for those theorems. The nine roadmaps absent from the older atlas snapshot were screened in their current README/Suggested files; no modular carrier was assigned to them by a name match.

Construct the algebraic curves in R13.4a first. R12.3 and R12.6 import that result for components/uniformization and canonical comparison; R13.4b then reconciles maps and operator conventions. R13.4 itself is an aggregate and has no mathematical node. The two supplier nodes carry aggregate coverage credit so the packet checker can recognize its coverage; their mathematical parents remain R13.4a/R13.4b. R13.6 uses lower-tier LPV.7 rather than the upward Weights R34.3 dependency. R14.2 does not use R14.3 to prove faithful Hecke realization.

## Target and API conventions

Each numbered target below corresponds to the packet identifier printed after its title. Its statement includes its scope and hypotheses; its proof route lists the nonroutine imported inputs. API names are relative to TauCeti.ModularCurves. Every definition/construction has at least three distinct kinds of tests. These are mathematical specification tests: most require carriers absent from the pins and therefore belong in this reader. The compact suggested file states only end theorems and computes light examples on existing finite, complex and ring carriers. Nothing in this document is claimed formalized.


## R13.3. Tate families, formal boundary and Hodge evaluation


### 1. Generalized Tate n-gons

Target `ModularCurvesPartII:R13.3/generalized-tate-n-gon` (construction).

For n≥1 put A=ℤ[[t]], q=tⁿ. Glue the n formal node charts A{Xᵢ,Yᵢ}/(XᵢYᵢ−t), i∈ℤ/n, along their punctured branches to a proper formal n-gon; the identifications match consecutive branches and preserve the sections (1,t). Algebraize with the ample rotation orbit of these sections. The resulting generalized elliptic curve Tateₙ(t)/A has split n-gon fibre at t=0, smooth elliptic generic locus t≠0, degeneracy ideal (t), and canonical identity-component formal group Ĝₘ. Its generic elliptic curve is Tate₁(q), with the comparison fixed at the identity. This adds the generalized proper family to the existing equation-level Tate curve, not new coefficients.


Additional hypotheses and boundary conditions:

- No inversion of 2, 3 or n; a node has complete local equation XY=t.
- The conventional Weierstrass coefficients and Laurent-series ellipticity already exist in current Tau Ceti; the construction is the proper generalized family.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorem 2.5.2, p.18. The glued formal family, ample rotation divisor, algebraization and uniqueness give the generalized n-gon extension.


Proof route:

1. Glue node charts with the cyclic branch identification from Conrad §2.5; compare the formal smooth locus to Ĝₘ and the rotation action.
2. Use the supplied polarized formal algebraization and full faithfulness to algebraize the curve and action.
3. Apply the Deligne–Rapoport structure criterion imported from R13.1; Theorem 2.5.2 identifies the generic Tate curve and makes the identity comparison unique.


Prerequisites: `ModularCurvesPartII:R13.1/generalized-elliptic-curve`; `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`; `SchemeAndStackFoundations:SF.4`.


API:

- `generalizedTate` (constructor): Tateₙ(t) with its zero, group action and generic-fibre comparison.
- `generalizedTate_special` (compatibility): Its closed fibre is the imported split n-gon with identity on component 0.
- `generalizedTate_degeneracy` (characterisation): The scheme-theoretic degeneracy ideal is (t), not (tⁿ).
- `generalizedTate_formalGroup` (equivalence): The completion along zero is Ĝₘ with invariant differential du/u.
- `generalizedTate_unique` (universal-property): A generalized n-gon extension with this generic and identity-formal comparison is uniquely isomorphic to Tateₙ(t).


Tests:

- `generalizedTate_one` (degenerate): Tate₁(t) at t=0 is the pointed nodal cubic.
- `generalizedTate_two_nodes` (computation): Tate₂(t) has two components and two nodes, although the graph has only two vertices.
- `generalizedTate_pole` (compatibility): j(Tateₙ(t)) has pole order n, while every node has thickness one over ℤ[[t]].


Uses: Conrad07 Theorem 4.3.6: Supplies generalized curves on completed cusp charts.; R14.1: Extends universal isogenies and differentials to cusps.


Check:

- n=1 specializes to the pointed nodal cubic; n=2 has two rational components and two nodes.
- The generic invariant satisfies j=q⁻¹+744+O(q), hence pole order n in t.


### 2. Power isogenies at the boundary

Target `ModularCurvesPartII:R13.3/tate-power-isogeny` (construction).

For m,n≥1 the formal power maps on each branch give a pointed finite flat degree-m morphism Tateₙ(t)→Tateₙ(tᵐ), with kernel μₘ in the identity component of the smooth locus and pullback du/u↦m du/u. The target is the base change t↦tᵐ of the n-gon family, so its node equation is XY=tᵐ; it need not have regular total space. Generic fibres are the map u↦uᵐ from Tate₁(tⁿ) to Tate₁(tⁿᵐ).


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Example 2.5.1, p.18; Theorem 4.4.3, pp.43–46. Power maps are finite flat and extend the universal isogeny in the multiplicative boundary case.


Proof route:

1. Raise branch coordinates to the mth power, respecting the overlap and equations XY=t and XY=tᵐ.
2. Finite flatness is checked on the formal charts; use full faithfulness to obtain the algebraic map.
3. The smooth-locus power map gives kernel and differential, including the zero differential in characteristic dividing m.


Prerequisites: `ModularCurvesPartII:R13.3/generalized-tate-n-gon`; `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.


API:

- `tatePower` (constructor): The pointed degree-m map with its source and target comparisons.
- `tatePower_kernel` (characterisation): The smooth-locus kernel is μₘ, not the constant group ℤ/m in bad characteristic.
- `tatePower_differential` (simp): Pullback of du/u is m du/u.
- `tatePower_comp` (functoriality): Composition of the mth and rth power maps is the mrth power map with the necessary base changes.


Tests:

- `tatePower_one` (degenerate): m=1 gives the identity.
- `tatePower_char_two` (computation): m=2 in characteristic 2 has rank-two kernel μ₂ and zero differential.
- `tatePower_target_thickness` (non-example): For m=2 the target node XY=t² has thickness 2; it is not the original regular smoothing.


Uses: Conrad07 §4.5: Explains the p-divisibility of the coherent Hecke trace.; R13.6: Tracks thicknesses under boundary morphisms.


Check:

- For m=p in characteristic p, the geometric map is inseparable and the differential vanishes; its scheme degree remains p.


### 3. Formal level structures at cusps

Target `ModularCurvesPartII:R13.3/formal-level-cusp-charts` (construction).

For a specified Γ-level problem, form its finite generic level cover on Tate₁(q) and take the integral closure of the q-adic base in each generic component. Classify the boundary data on split n-gons via their smooth locus Gₘ×ℤ/n and Drinfeld generators, keeping the stabilizer action on the smoothing parameter and Hodge line. The resulting formal stack charts, with their descent groupoids, describe the completion of the compactified stack. A complete local ring of its coarse curve is an invariant ring only under the applicable coarse-completion theorem; it is not the framed stack chart itself. On the prime N≥5 diamond class over ℤ[1/N], use Layer 10’s existing cusp charts and prove comparison with this generalized family.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorems 4.3.6–4.3.7, pp.40–42. Tate families with Drinfeld level yield completed boundary charts and explicit stack covers.; [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2, Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.36–38. Normalization of the Tate generic Γ₀ cover computes integral cusp charts, including level-dividing primes.


Proof route:

1. Identify the generic level cover using the imported torsion/Drinfeld definitions and contraction maps.
2. Normalize each generic component and extend the generalized curve with its identity-formal comparison.
3. Compute stabilizers on the chosen chart before descending; compare the exact prime-level overlap to Layer 10 by uniqueness.


Prerequisites: `ModularCurvesPartII:R13.3/generalized-tate-n-gon`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`; `ModularCurvesPartII:R13.2`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.


API:

- `formalLevelChart` (constructor): A normalized formal level chart with generic level data, generalized family and descent arrows.
- `formalLevelChart_generic` (compatibility): Restriction q≠0 identifies the chosen generic level cover.
- `formalLevelChart_inertia` (projection): The full stabilizer acts on the parameter and on du/u; retain infinitesimal inertia.
- `formalLevelChart_completion` (equivalence): The formal stack completion is obtained from these charts and their overlap groupoid.
- `formalLevelChart_primeComparison` (compatibility): Agreement with the Layer 10 chart after inverting prime N≥5.


Tests:

- `formalLevelChart_width_one` (degenerate): No level and the chosen 1-gon chart give parameter q and width 1.
- `formalLevelChart_prime_import` (compatibility): For prime Γ₀(N), j⁻¹ has orders 1 and N at its two cusps, as in Layer 10.
- `formalLevelChart_wild_invariants` (non-example): In characteristic 2 the Γ₁(4) coarse completion cannot be obtained by asserting arbitrary base change of invariant rings.


Uses: R13.4a: Produces the independent algebraic compactification.; R13.4b and R15: Supplies precise cusp fields, widths and evaluation of sections.


Check:

- A cusp width is the valuation of q in a local smoothing parameter, not the number of components of the coarse j-fibre.
- The prime Γ₀(N) widths 1 and N and the characteristic-2/3 table are imported.


### 4. Integral Γ₁ cusp strata

Target `ModularCurvesPartII:R13.3/gamma-one-integral-boundary` (theorem).

For d|N let B_d be the d-gon boundary stratum of the Γ₁(N) stack. It is reduced, regular, proper, quasi-finite and flat of relative dimension zero over ℤ. If d>2, it is a disjoint union of φ(d)/2 copies of Spec ℤ[ζ_(N/d)], indexed by b∈(ℤ/d)×/{±1}. Its geometric generic degree is φ(d)φ(N/d)/2. A primitive root ζ_(N/d)^r, r a unit modulo N/d, labels a geometric embedding within that cyclotomic component, not an additional component indexed by a positive divisor of d. This corrects the author PDF’s component indexing in Theorem 4.3.4. If d≤2, the stratum is nowhere a scheme for (N,d)=(1,1),(2,1),(2,2),(4,2). In the remaining partial schematic cases N=pˢ or 2pˢ the required inversion is δ=p; in other cases δ=1. The canonical degree-two cover by Spec ℤ[ζ_(N/d)] remains finite flat without that inversion; on the schematic locus over ℤ[1/δ] it is Spec(ℤ[ζ_(N/d)]⁺[1/δ]). The same covers extend to every infinitesimal boundary neighbourhood. Do not erase the residual inertia in a nowhere-schematic case.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 4.3.3, Theorems 4.3.4 and 4.3.7, pp.37–42. Use the schematic locus and degree-two covers with the exceptional small levels; correct the d>2 component indexing by the isomorphism calculation in the proof, rather than the overcount in the printed statement.


Proof route:

1. In characteristic zero write a point as (ζ_N^r,b), with b a unit modulo d and r a unit modulo N/d. The μ_d automorphisms change r by (N/d)b times an integer, leaving r modulo N/d; inversion sends (r,b) to (−r,−b). For d>2 it acts freely on b. Cyclotomic Galois action is transitive on r modulo N/d, so there is one cyclotomic component per b modulo sign. Normality and finite flatness extend this decomposition integrally.
2. Use the twisted Tate charts for existence and the completed moduli property for the full infinitesimal claim.
3. Descend the degree-two cover only on the stated schematic locus.


Prerequisites: `ModularCurvesPartII:R13.3/formal-level-cusp-charts`.


Tests:

- `gammaOneBoundary_five` (computation): N=d=5 has two cyclotomic components, each Spec ℤ, and two geometric 5-gon cusps; no extra divisor label.
- `gammaOneBoundary_four` (degenerate): N=d=4 has one 4-gon cusp, although the 2-gon boundary stratum is nowhere schematic.
- `gammaOneBoundary_galois` (compatibility): For N=15,d=5 there are two copies of Spec ℤ[ζ₃], hence four geometric cusps; conjugation moves r within a component.
- `gammaOneBoundary_overcount` (non-example): Independent b and positive-divisor r labels give eight components for N=d=5, contradicting the two isomorphism classes.


Check:

- N=4,d=2 has a non-schematic boundary stratum; taking its real cyclotomic ring does not turn it into a fine moduli scheme.
- For d>2 each cyclotomic chart is a scheme even at primes dividing N.


### 5. Twisted Tate charts for Γ₁

Target `ModularCurvesPartII:R13.3/gamma-one-twisted-tate-chart` (construction).

For d|N and a unit r modulo N/d, the unmarked regularized Tate curve over ℤ[ζ_(N/d)][[t]], t=q^(1/d), has generic parameter ζ_(N/d)^(−r)q and boundary ideal (t); over ℤ[ζ_N] it is Tate_d(ζ_N^(−r′)t), for any lift r′ modulo N. For a marked Γ₁ chart choose b a unit modulo d and a unit lift b′ modulo N. The point denoted q^(b/d) descends from Tate_d(ζ_N^(−r′(b′)⁻¹)t) to the regularized family with generic parameter ζ_(N/d)^(−r(b′)⁻¹)q. For d>2 this identifies the completion of the component indexed by b modulo sign. The unit r changes its cyclotomic embedding, not its component count; impose no purported unique positive-divisor lift of r. For d≤2 retain the finite flat degree-two formal cover; when N/d>2 it is étale only after inverting δ. For d=2, after inverting δ on the schematic locus, the invariant parameter is (1+ζ_(N/d)⁻¹)t, as in Theorem 4.3.7, rather than an unqualified parameter t on the real base.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorems 4.3.6–4.3.7, pp.40–42. Twists, cyclotomic base changes, formal moduli property and the conjugation-invariant parameter are explicit.


Proof route:

1. Twist the generic Tate parameter by the root of unity fixed by the cusp label.
2. Use Tateₙ uniqueness to descend the regularized generalized curve with its Γ₁ point.
3. Verify the involution on the d≤2 cover and descend the parameter only with the stated étaleness and schematic hypotheses.


Prerequisites: `ModularCurvesPartII:R13.3/generalized-tate-n-gon`; `ModularCurvesPartII:R13.3/gamma-one-integral-boundary`.


API:

- `twistedTateChart` (constructor): The chart with b modulo sign, a chosen unit r and lift b′, its Γ₁ point, family and generic parameter; changes of lifts have specified descent comparisons.
- `twistedTateChart_degeneracy` (simp): The boundary ideal is generated by t.
- `twistedTateChart_cyclotomic` (compatibility): The unmarked twist is Tate_d(ζ_N^(−r′)t); for the descended Γ₁ point the exponent is −r′(b′)⁻¹.
- `twistedTateChart_formalModuli` (universal-property): For d>2 it represents the framed boundary deformation problem; for d≤2 keep the covering groupoid.
- `twistedTateChart_realDescent` (compatibility): The d=2 descent uses (1+ζ⁻¹)t with the conjugation action of Theorem 4.3.7.


Tests:

- `twistedTateChart_pole` (computation): j has pole order d in t because its generic parameter is a unit times tᵈ.
- `twistedTateChart_integral` (characterisation): The special fibre is a d-gon and its degeneracy divisor is t=0.
- `twistedTateChart_nowhereScheme` (non-example): For (N,d)=(4,2), the finite flat chart is a cover of a stack and not its coarse universal family.


Uses: R13.4b: Computes cusp fields and their Galois descent.; R14.1: Checks compactified Hecke maps on explicit charts.


Check:

- The chart is over the ring of integers, not just a cyclotomic field; the divisor t=0 survives in characteristic dividing N.


### 6. Boundary carriers and Hodge evaluation

Target `ModularCurvesPartII:R13.3/boundary-carriers-and-hodge-evaluation` (theorem).

On each stated integral stack chart the boundary is an effective relative Cartier divisor cut out by its smoothing parameter, and ω=e*Ω¹ of the smooth locus agrees with the pushforward of the relative dualizing line. It is trivialized on Tate charts by du/u, invariant under contraction. A weight-k section evaluates as a formal series times (du/u)^k, equivariantly for chart stabilizers; restriction of global sections is injective whenever the chosen union of formal boundary charts meets every irreducible component and the sheaf has the required torsion-free/density property. This is the formal comparison supporting the q-expansion principle; one-cusp integral descent is a separate R15 input. Distinguish the Cartier boundary, its reduced boundary locus and the finite-flat scheme j⁻¹(∞), whose ramification multiplicities are cusp widths. For general Γ₀ integral coarse spaces use the Cartier and regular-cusp theorem below; finite flatness of a reduced coarse cusp locus over ℤ is not inferred.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43; §4.5 Example 4.5.3, p.48. The Hodge line and contraction comparison give the Tate differential and evaluation formula.; [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), Theorem 5.13, pp.60–61; Theorem 6.7, pp.63–64. The refined boundary is a relative Cartier divisor, and the coarse cusp locus is regular even at 2 and 3.


Proof route:

1. Compare the generalized curve’s dualizing line to invariant differentials on its smooth locus and use contraction invariance.
2. Evaluate on the formal charts and retain the stabilizer linearization; injectivity follows from the supplied density/restriction theorem.
3. Read cusp fibre multiplicities from valuations of j⁻¹, keeping reduction and Cartier constructions separate.


Prerequisites: `ModularCurvesPartII:R13.3/gamma-one-twisted-tate-chart`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `SchemeAndStackFoundations:SF.2`.


Check:

- On Γ₀(5)/ℤ[1/5] the j-cusp fibre is [∞]+5[0], although the reduced boundary has two points; this is an imported Layer 10 check.
- In characteristic 2, the weight-k Hodge action of [−1] must be tracked as a group-scheme linearization, not removed by the equality of coarse maps.


### 7. Prime-power Γ₀ cusp rings

Target `ModularCurvesPartII:R13.3/gamma-zero-prime-power-cusp-rings` (theorem).

For every prime p and n≥1, the normalized Tate Γ₀(pⁿ) cover of ℤ[[q]] is the disjoint union of ℤ[[q]], ℤ[[s]] with q=s^(pⁿ), and, for a+b=n with a,b>0, the following rings: if a≥b, ℤ[ζ_(pᵇ)][[q]]; if b>a, ℤ[ζ_(pᵃ)][[q]][z]/(z^(p^(b−a))−ζ_(pᵃ)q). These are q-adically complete finite rings, each regular. The generic mixed component comes from the cyclotomic condition Φ_p(z^(p^(b−1))/q^(p^(a−1)))=0 before normalization. For Γ₀(pⁿM), p∤M, factor the generic level cover, tensor with the prime-to-p cusp cover and normalize; the tensor product before normalization need not be normal. This is a composite/bad-level extension; prime-level rings after inverting p remain Layer 10’s.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2.2, Proposition 1.2.2.1, p.37; §1.2.3, p.38. The normalized rings are explicit, with a≥b in the cyclotomic-power-series case, and the prime-to-p product requires normalization.


Proof route:

1. Split the generic cyclic Tate subgroup cover by a+b=n.
2. For a≥b divide the coordinate by the appropriate q power, giving a primitive pᵇ root; for b>a adjoin z with the displayed relation.
3. Check regularity in these parameters and compare with the integral closure; normalize the prime-to-p tensor product.


Prerequisites: `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.4a/coarse-cusp-regularity`.


Check:

- n=2 gives two outer charts and ℤ[ζ_p][[q]]; their j-degrees sum to 1+p²+(p−1)=p²+p.
- p=2,n=3,(a,b)=(1,2) gives z²=−q, a regular formal cusp chart at 2 despite its ramification.


## R13.4. Integral coarse spaces: aggregate


This process aggregate introduces no definition or theorem. R13.4a supplies the algebraic integral construction and R13.4b supplies generic-fibre/component/correspondence comparison. No prerequisite in this packet cites the aggregate as a mathematical supplier. Its coverage is closed under accepted RS-06.


## R13.4a. Algebraic coarse construction


### 1. Integral coarse modular curves

Target `ModularCurvesPartII:R13.4a/integral-coarse-curves` (construction).

For an open H≤GL₂(Ẑ) containing Γ(n), take the finite-inertia coarse space X_H of the corresponding compactified level stack supplied by R13.2. It is a projective normal ℤ-scheme, finite locally free over ℙ¹_j and flat of relative dimension one. The construction is algebraic: normalize the j-line in the generic level algebra and compare the stack coarse space to this normalization. Full level has its determinant/cyclotomic constant algebra, fixed-pairing level is over the corresponding cyclotomic integer base, Γ₁ is the marked-generator problem, and Γ₀ uses the refined cyclic-subgroup stack. Keep disconnected full-level generic components in the normalization algebra. No analytic connectedness or R12.6 is used.


Sources: [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), §6.1–6.3, pp.62–63. Coarse curves are normal projective and finite locally free over the j-line; their quotient and KM descriptions agree.


Proof route:

1. Apply finite-inertia coarse existence to the actual level stack; descend the finite j-map through the categorical universal property.
2. Compare on the dense generic level locus with integral closure in its full generic algebra.
3. Normality, projectivity and Cohen–Macaulayness in dimension two yield the finite locally free j-map, as in §6.1.


Prerequisites: `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.2`; `SchemeAndStackFoundations:SF.1/keel-mori`; `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`; `AlgebraicModuliForArithmeticGeometry:A0-extension/arithmetic-normalization`.


API:

- `integralCoarseCurve` (constructor): X_H with coarse map, j-map and dense elliptic open.
- `integralCoarseCurve_universal` (universal-property): Any map of the level stack to an algebraic space factors uniquely through X_H.
- `integralCoarseCurve_normal` (structure): X_H is normal and projective over ℤ.
- `integralCoarseCurve_j` (projection): The j-map is finite locally free; the full-level generic algebra retains every determinant component.
- `integralCoarseCurve_levelMap` (functoriality): Maps of the specified level stacks induce coarse maps by categorical universality; composing level maps composes the induced maps.


Tests:

- `integralCoarseCurve_levelOne` (degenerate): X(1)=ℙ¹_ℤ with its j coordinate.
- `integralCoarseCurve_fullFive` (computation): Over ℂ honest full level 5 has four determinant components; fixed pairing has one.
- `integralCoarseCurve_noUniversalFamily` (non-example): The universal elliptic curve does not descend to X(1) merely because a coarse space exists.


Uses: R12.3: Supplies algebraic curves before proving analytic uniformization.; R13.5: Supplies the single integral object whose bad fibres are studied.


Check:

- For trivial H the result is ℙ¹_j over ℤ.
- A fixed Weil pairing changes the base; forgetting it is not a geometrically connected full-level curve over ℚ.


### 2. Coarse normalization comparisons

Target `ModularCurvesPartII:R13.4a/coarse-normalization-comparisons` (comparison).

On the elliptic locus X_H agrees with the affine coarse moduli scheme from ModularCurves 9D, by equality of the moduli problem and its categorical coarse property. It also agrees with the Katz–Mazur compactification as in Česnavičius Proposition 6.3. For prime N≥5 and diamond H over ℤ[1/N], identify the generalized-stack coarse compactification with Layer 10’s X_H by checking normality, finiteness over ℙ¹_j, an open immersion of Y_H with schematic density, and that every component meets Y_H. Then normalization uniqueness identifies the curves and their maps. The universal property of relative normalization alone does not recognize an arbitrary proposed compactification.


Sources: [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), Lemma 6.2 and Proposition 6.3, p.62. Finite quotient descriptions and KM comparison identify the same algebraic coarse curves.


Proof route:

1. Compare affine coarse maps using their universal property.
2. Both compactifications are finite normal extensions of the same dense level algebra; verify all components meet the elliptic open.
3. Apply normalization uniqueness, then use separatedness and schematic density to identify maps.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.


Check:

- For prime N=5 the generalized Γ₀ coarse construction agrees with the pre-existing compactification; no second set of cusp widths is built.


### 3. Base change for coarse modular curves

Target `ModularCurvesPartII:R13.4a/legal-coarse-base-change` (theorem).

The coarse formation X_H commutes with arbitrary base change over ℤ[1/gcd(6,n)] and X_H is smooth over ℤ[1/n], where Γ(n)⊂H. Away from 6 one uses tame inertia; at 2 or 3 with that prime not dividing n use the separate normal-fibre/rigidification argument of Česnavičius Proposition 6.4. Elsewhere retain only the applicable flat or tame base-change theorem. Γ₁(4) in characteristic 2 is an explicit obstruction to unrestricted coarse base change. Normalization is not asserted to commute with arbitrary base change.


Sources: [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), Proposition 6.4 and Remark 6.6, pp.62–63. The base-change range includes non-tame primes not dividing level; the Γ₁(4) counterexample excludes a general claim.


Proof route:

1. Apply tame coarse invariants after inverting 6.
2. At a level-prime-free 2 or 3, use the finite normal fibre comparison and the rigidification argument in Proposition 6.4.
3. Keep the characteristic-2 counterexample outside the statement.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`; `SchemeAndStackFoundations:SF.1/keel-mori`.


Check:

- n=5 allows arbitrary base change over all ℤ, even though stack stabilizers need not be tame at 2 or 3.
- n=4 only provides the advertised arbitrary range after inverting 2.


### 4. Regularity at integral Γ₀ cusps

Target `ModularCurvesPartII:R13.4a/coarse-cusp-regularity` (theorem).

For every N≥1, the integral Γ₀(N) coarse curve is regular at every cusp, including residue characteristics 2 and 3. More generally Česnavičius Theorem 6.7 gives regularity after removing the closed bad-prime points with j=0 or 1728. The refined and naive Γ₀ stacks have the same coarse curve for all N by Proposition 6.9; the refined stack remains necessary for stack regularity, finite-inertia descent and compactified level maps. This theorem gives a regular neighbourhood of the boundary, not smoothness of the whole fibre at a level-dividing prime.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.37–38. The prime-power formal rings normalize to regular charts, and factorization plus Atkin–Lehner proves regularity for arbitrary N.; [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), Theorem 6.7 and Proposition 6.9, pp.63–64. Coarse cusp regularity is uniform and naive/refined coarses agree.


Proof route:

1. Compute prime-power cusp covers by normalizing the Tate cyclic-subgroup cover.
2. Factor prime-to-p level and normalize; exchange the two mixed cusp types using the dual cyclic isogeny.
3. Use the all-level coarse comparison to identify the resulting regular rings with the refined coarse curve.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`.


Check:

- X₀(4) has regular cusps at 2; this does not make the Γ₁(4) coarse base-change assertion true.


### 5. The cyclic modular polynomial

Target `ModularCurvesPartII:R13.4a/modular-polynomial` (construction).

For m≥2 define Φ_m(U,V) by the generic cyclic degree-m quotient of the universal j-elliptic curve: its roots in V are j(E/C) for cyclic subgroups C of order m. This gives the irreducible polynomial in ℤ[U,V], monic of degree ψ(m)=m∏_(p|m)(1+1/p) in each variable, symmetric in U,V. Set Φ₁(U,V)=V−U with this orientation. The map (j,j′) from Y₀(m)_ℚ is finite birational onto the plane curve Φ_m=0, and ℚ(X₀(m))=ℚ(j,j′); the smooth coarse curve is its normalization. The integral plane image is not asserted to be the normal integral modular curve, nor does this normalization commute with arbitrary reduction. Cyclic degree ψ(m) differs from the full-subgroup Hecke degree σ₁(m).


Sources: [David Masser and Umberto Zannier](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646. Integrality, separate monicity and ψ(m) degree of the cyclic modular polynomial are the input used here.; [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §1, p.226. The function field of X₀(N) is generated by its two j-invariants.


Proof route:

1. On the generic j-line take the characteristic polynomial of the target j over the cyclic subgroup algebra.
2. Use finite local freeness of the cyclic coarse algebra over ℤ[j] to make the characteristic polynomial integral; its generic distinct roots give the minimal polynomial. Dual isogeny supplies symmetry for m≥2.
3. Generic distinct targets give birationality and the stated function-field equality; normalize the plane image, rather than identifying it as a smooth model.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`.


API:

- `modularPolynomial` (constructor): The normalized integral polynomial with its distinguished orientation at m=1.
- `modularPolynomial_cyclic` (characterisation): In characteristic zero, Φ_m(j(E),j(E′))=0 precisely when a cyclic degree-m isogeny exists.
- `modularPolynomial_degree` (simp): For m≥2 its degree in each variable is ψ(m), with leading coefficient 1.
- `modularPolynomial_dual` (compatibility): For m≥2 dual cyclic isogenies interchange the variables and preserve Φ_m.
- `modularPolynomial_normalization` (equivalence): Y₀(m)_ℚ is the normalization of the affine plane image, with function field ℚ(j,j′).


Tests:

- `modularPolynomial_one` (degenerate): Φ₁(U,V)=V−U; swapping variables changes its sign.
- `modularPolynomial_four_degree` (computation): deg_V Φ₄=6, not 7.
- `modularPolynomial_nonNormalImage` (non-example): A special elliptic pair can admit several cyclic isogenies of degree m; its plane image point does not encode a unique subgroup or a universal family.


Uses: Masser–Zannier §3.1: Provides an integral equation and degree bound.; ComplexMultiplicationAndExplicitReciprocity CM.3/CM.5: Imports this polynomial for arithmetic congruences; those congruences are not prerequisites here.


Check:

- ψ(4)=6 whereas σ₁(4)=7; E[2] is the extra noncyclic subgroup of order 4.
- For a transcendental j, Φ₂(j,V) has degree 3.


### 6. Projective scalar level quotients

Target `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient` (construction).

For prime p>3 over ℤ[1/p], form the coarse quotient of honest full level p by scalar change of frame a∈𝔽_p×. It classifies a torsion framing modulo scalar up to isomorphism, as a coarse moduli space. The element [−1] remains an automorphism of the unrigidified projective-frame stack, so this quotient is not a fine moduli scheme carrying a descended universal curve. Over ℂ it has two components indexed by the square class of the determinant/Weil pairing; PGL₂(𝔽_p) exchanges these when the determinant is nonsquare, and PSL₂ fixes each. On the p-gon compactification, distinguish full raw stabilizers from the effective rigidification by [−1]; the effective ramification orders over the j-line are 2,3,p. The p-gon automorphism and torsion carriers themselves are imported from R13.1.


Sources: [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1–2.2, pp.713–715; §3, p.717. The scalar framing and effective orbifold are the application; the fine-moduli and raw-stabilizer wording must be corrected.


Proof route:

1. Take the scalar quotient of the honest framing stack, keeping its residual central automorphism.
2. Compute the determinant action a↦a² and then the PGL₂ action.
3. Use the p-gon formal parameter and imported automorphism action; rigidify the ubiquitous [−1] before reading effective inertia orders.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`; `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse`; `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`.


API:

- `projectiveLevelCurve` (constructor): The coarse scalar quotient with its map from honest full level.
- `projectiveLevelCurve_pairingClass` (projection): The Weil pairing is retained only modulo squares.
- `projectiveLevelCurve_pglAction` (instance): The effective PGL₂ action permutes the two components by determinant square class.
- `projectiveLevelCurve_rigidification` (compatibility): Rigidification removes the central [−1] from inertia while preserving the coarse curve.
- `projectiveLevelCurve_cusp` (compatibility): The completed p-gon cover has effective inertia p; before rigidification the stabilizer contains the inversion factor.


Tests:

- `projectiveLevelCurve_five` (computation): p=5 gives two scalar-framed complex components, not four and not one.
- `projectiveLevelCurve_minusOne` (non-example): [−1] fixes a projective framing and prevents a fine universal family.
- `projectiveLevelCurve_orbifold` (compatibility): After rigidification the three ramification orders are 2,3,p, matching the analytic (2,3,p) orbifold from R12.3.


Uses: Bakker–Tsimerman §§2–3: Defines their coarse X(p) and effective orbifold without changing upstream elliptic carriers.; R13.4b: Checks components and analytic comparison.


Check:

- For p=5 honest full level has 4 complex components and the scalar quotient has 2; on one component the effective covering group is PSL₂(𝔽₅).


### 7. The split Cartan normalizer quotient

Target `ModularCurvesPartII:R13.4a/split-cartan-quotient` (comparison).

For a prime ℓ, over ℚ there is an algebraic isomorphism X₀(ℓ²)/⟨w_(ℓ²)⟩≃X_s(ℓ), where X_s denotes the normalizer of split Cartan, or equivalently the moduli of an unordered pair of distinct ℓ-subgroups. Given a cyclic chain E→E/C_ℓ→E/C_(ℓ²), the middle curve has two distinct order-ℓ subgroups, one from the dual first isogeny and the other from the second; reversing the chain exchanges the pair. The inverse construction and finite-normal compactification comparison establish the isomorphism. This is not the ordered split-Cartan curve. At ℓ itself it is a generic-fibre identification; the semistable quotient is constructed after the explicit extension in R13.5.


Sources: [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, proof of Theorem 6.6, p.929; §6.3, pp.929–930. The rational identification with the Fricke quotient is the algebraic input to the split Cartan semistable model.


Proof route:

1. Construct the unordered middle pair from a cyclic ℓ²-chain, using dual isogenies and the coprimality of the two middle directions.
2. Reconstruct a chain from an unordered pair up to reversal; this identifies the elliptic open moduli functors over ℚ.
3. Extend the finite birational map between normal compactifications; no analytic connectedness is required.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `ModularCurvesPartII:R14.1/exact-divisor-atkin-lehner`.


Check:

- For ℓ=13 the quotient has genus 3; calling the ordered split-Cartan curve X_s would change the degree and genus.


## R13.4b. Generic-fibre and map comparison


### 1. Generic components and cusp fields

Target `ModularCurvesPartII:R13.4b/generic-component-comparison` (comparison).

After the algebraic construction, use R12.3/R12.6 to identify each generic-fibre component of X_H with the compactified analytic quotient for its determinant orbit. For honest full level n over ℚ the constant algebra is the cyclotomic determinant algebra; fixed pairing over ℚ(ζ_n) selects a component. A subgroup H descends these components by its determinant image. Identify the cusp residue fields and smoothing parameters from R13.3’s cyclotomic charts with the rational boundary points and widths in the analytic quotient. On the scalar-framed prime-p quotient, determinant classes modulo squares give exactly two complex components. No analytic comparison is used to construct X_H.


Sources: [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1, pp.713–714. The scalar quotient has two determinant-square-class components.; [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.3, Theorems 4.3.4 and 4.3.6–4.3.7, pp.38–42. Cyclotomic formal cusp fields and parameters fix the integral-to-generic comparison.


Proof route:

1. Apply the earlier component and uniformization theorem to the independently constructed normal curves.
2. Identify generic formal parameters and residue fields using the Tate charts, including conjugation in d≤2 charts.
3. Descend using the specified determinant action, rather than imposing geometric connectedness on full level.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.4a/coarse-normalization-comparisons`; `ModularCurvesPartII:R13.3/gamma-one-twisted-tate-chart`; `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient`; `ModularCurvesPartII:R12.3`; `ModularCurvesPartII:R12.6`.


Check:

- Full level 5: four complex components before scalars, two after scalars, one after fixing an honest primitive pairing.


### 2. Compactified map comparison

Target `ModularCurvesPartII:R13.4b/compactified-map-comparison` (comparison).

The compactified forgetful and quotient isogeny maps constructed algebraically agree under the generic-fibre comparison with their classical analytic degeneracy maps. On a Γ₁(N;p) chart, π₁ forgets the p-subgroup and π₂ quotients by it then contracts to the allowed level polygon. The generic analytic conventions are π₁(z)=z and π₂(z)=pz on the chosen standard branch. At every cusp compare the induced homomorphism of completed rings and the pullback of du/u. A map to a coarse curve factors by categorical universality, but finite flat stack legs do not automatically become finite flat coarse legs; descent uses the actual stabilizer action or a schematic locus where it is trivial.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. The stack degeneracy maps are finite flat, including the boundary quotient construction.; [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §§5.1–5.2, pp.65–66,71–72. Analytic and algebraic moduli descriptions fix the two maps and their normalization.


Proof route:

1. Identify both maps on the elliptic dense open through the moduli quotient.
2. Use generalized Tate charts and contraction for the boundary maps; retain the power factor on invariant differentials.
3. Separate categorical existence of coarse maps from the finite-flat descent claim; use the finite-correspondence supplier and schematic locus when needed.


Prerequisites: `ModularCurvesPartII:R13.4b/generic-component-comparison`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`; `AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent`.


Check:

- The two legs have different j coordinates. Extension is not obtained by pretending that π₂ is a map over the same j-line.


### 3. Hecke normalization and descent

Target `ModularCurvesPartII:R13.4b/hecke-normalization-comparison` (comparison).

On characteristic-zero fibres the geometric pull–trace correspondences agree with the earlier classical Hecke action, with the differential factor of the universal isogeny included. For weight k, the finite-flat coherent trace is pT_p, not T_p; integrality of its division by p is a separate local theorem. For Picard and étale cohomology the action is the integral push–pull of the correspondence without division by its degree. The full-subgroup A_m and cyclic C_m have their separate degrees and repeated-prime relations. These identifications descend to the field of definition with the diamond and cyclotomic Atkin–Lehner conventions fixed.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, Theorem 4.5.1 and Example 4.5.3, pp.46–48. The geometric trace gives pT_p and the integral normalized operator is derived locally.; [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–68; §5.2, pp.71–72. The geometric cohomological upper/lower conventions and comparison are explicit.


Proof route:

1. Compare the classical formula on the Tate cusp and use the imported analytic q-expansion determination.
2. Use finite-flat trace, rather than a sum over distinct points, on ramified/inseparable charts.
3. Descend the maps with their actual cyclotomic data and distinguish the two correspondence conventions.


Prerequisites: `ModularCurvesPartII:R13.4b/compactified-map-comparison`; `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`; `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`; `ModularCurvesPartII:R14.1/coherent-hecke-trace`.


Check:

- For weight 2 at p∤N, the normalized coefficient formula is a_n(T_pf)=a_(np)(f)+p a_(n/p)(⟨p⟩f); the unnormalized coherent trace has an extra factor p.


## R13.5. Bad fibres and explicit modular models


### 1. Igusa components of modular fibres

Target `ModularCurvesPartII:R13.5/igusa-components` (construction).

Over a perfect field k of characteristic p, an Igusa pʳ structure on an ordinary elliptic curve E with prescribed prime-to-p level is a Drinfeld generator of ker(Vʳ:E^(pʳ)→E). On the ordinary locus ker Vʳ is étale cyclic of rank pʳ, so its generator cover has degree φ(pʳ) before the effective residual automorphism quotient. Compactify by normalizing the corresponding level curve in this generator cover. Keep the auxiliary rigidifying level when discussing ±1 and other automorphisms; Ig(p)/±1 and Ig(p)/C₄ in Edixhoven/BDMTV denote effective quotient level problems, not two arbitrary additional quotients of an already coarse curve. Γ₀ p-power mixed components, and the middle components after the p² extension, are identified with the relevant descended Igusa problems. Smoothness, ramification at supersingular points and small-p behavior are assertions proved by the local models, not part of a definition of an ordinary cover.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3, pp.34–35; §2.1, pp.55–56. The cyclic-component and p² semistable descriptions use auxiliary-level Igusa moduli.; [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, p.928; Theorems 6.5–6.6, pp.928–929. Igusa is defined through Verschiebung and the middle-component quotients are specified.


Proof route:

1. Define the ordinary generator cover using imported relative V and Drinfeld cyclicity.
2. Normalize its compactification and descend along the actual auxiliary level and effective automorphism action.
3. Use the p² local model below to compare the descended middle components.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`; `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`; `AbelianSchemesAndArithmeticModuli:A3`.


API:

- `igusaCover` (constructor): The ordinary Verschiebung-generator cover with auxiliary prime-to-p level.
- `igusaCover_degree` (simp): Its degree before stabilizer quotient is φ(pʳ).
- `igusaCurve` (constructor): The normal compactification in the Igusa generic function field.
- `igusaCurve_effectiveQuotient` (compatibility): The quotient preserves the specified moduli problem and its residual effective action.
- `igusaCurve_localModel` (compatibility): The local generator ring identifies with the component chart from the universal cyclic deformation calculation.


Tests:

- `igusaCover_firstLevel` (computation): For p=5,r=1 a rigidified ordinary generator cover has degree 4, and the M=1 sign-class cover has degree 2.
- `igusaCover_heightZero` (degenerate): r=0 gives the trivial generator problem, not a φ(1)=0 cover.
- `igusaCover_supersingular` (non-example): The étale-generator description on ordinary curves is not an étale cover at a supersingular point.


Uses: R20.3: Provides the geometric Igusa/Frobenius inputs for local weight calculations, not the residual Galois theorem.; BDMTV Theorem 6.6: Identifies the two vertical Igusa/C₄ components.


Check:

- For M=1 and p>3, the ordinary generator classes up to sign have generic degree (p−1)/2; an auxiliary rigidifier changes how this quotient is presented.


### 2. Γ₀ prime-power local models

Target `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model` (theorem).

Let p>3, n≥1 and M≥1 with p∤M. The Γ₀(pⁿM) coarse special fibre has n+1 components indexed (a,b), a+b=n, each abstractly X₀(M)_𝔽p, of multiplicity φ(p^min(a,b)). All meet at every supersingular Γ₀(M) point and nowhere else; this intersection is not claimed to be transverse for n>1. Under an étale auxiliary rigidifier the completed surface ring at a relevant noncuspidal point is W[[x,y]]/(f₀+p u), u a unit, where W=W(k̄). At a supersingular point f₀=(x^(pⁿ)−y)(x−y^(pⁿ))∏_(a+b=n,a,b>0)(x^(p^(a−1))−y^(p^(b−1)))^(p−1); on the ordinary mixed (a,b) component f₀=(x^(p^(a−1))−y^(p^(b−1)))^(p−1). These x,y are local moduli of source and target; the component-to-j maps may involve Frobenius. The all-N component/multiplicity statement extends to p=2,3 as the Katz–Mazur/Edixhoven cyclic-deformation target, but its wild invariant-ring/resolution calculation is the separate recorded gap.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5, pp.34–36. The component multiplicities and explicit f₀ deformation rings are stated before the tame invariant-ring resolution.; [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III §1, pp.254–255. The arbitrary-level component/multiplicity input is used for intersection theory; its regularity locus needs the correction below.


Proof route:

1. Express cyclic pⁿ-subgroups in the imported Drinfeld deformation of the elliptic curve and its isogeny; split by connected/étale type a,b.
2. Use the source/target deformation coordinates to obtain the displayed f₀ and unit p-term.
3. Descend the auxiliary rigidifier with its stabilizer action. Read multiplicities from f₀, retaining possible inseparable component maps.
4. At 2 or 3 keep the component target but do not apply the tame quotient criterion; the wild calculation is recorded as an unresolved input.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.5/igusa-components`; `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`.


Check:

- n=1 gives two reduced components, local f₀=(xᵖ−y)(x−yᵖ).
- n=2 has multiplicities 1,p−1,1; for p=5 these are 1,4,1, so the coarse fibre is not reduced.


### 3. The corrected coarse singular locus

Target `ModularCurvesPartII:R13.5/corrected-coarse-singular-locus` (theorem).

For p>3, p∤M and n≥1, a noncuspidal point of the integral Γ₀(pⁿM) coarse surface is singular exactly when its elliptic pair has automorphisms beyond ±1 and it is either supersingular or lies on a mixed (a,b) component with a,b>0. Cusps are regular. The extra automorphism condition concerns the pair (E,C_M), not just the value j=0 or 1728. Ordinary points with a=0 or b=0 are smooth over ℤ_p. This corrects the supersingular-only exception in Gross–Zagier III Proposition (1.4); no identical criterion is claimed at p=2 or 3.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5 and Theorem 1.1.4.1, pp.34–36; §§1.3.2–1.3.6, pp.39–46. The candidates are extra-automorphism supersingular or ordinary mixed points, and the explicit actions give the exact locus.; [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III Proposition (1.4), p.255. The printed exception omits ordinary mixed points; its statement is used only in the corrected form.


Proof route:

1. Outside this locus an auxiliary quotient is étale or acts by pseudo-reflections on the regular deformation ring.
2. At the stated isolated extra-automorphism points compute the effective order-2 or order-3 action on the two local moduli; it is not generated by pseudo-reflections.
3. Apply the supplied tame invariant-ring criterion and the independent cusp regularity theorem.


Prerequisites: `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`; `ModularCurvesPartII:R13.4a/coarse-cusp-regularity`; `AlgebraicModuliForArithmeticGeometry:R09.5`.


Check:

- At p=5,M=1,n=2 the ordinary j=1728 point on (1,1) is singular although it is not supersingular.


### 4. Regular resolutions of modular fibres

Target `ModularCurvesPartII:R13.5/tame-regular-resolution` (construction).

For p>3 and p∤M construct the minimal regular resolution of the Γ₀(pⁿM) coarse surface at p from the preceding local rings. Resolve the effective order-2/3 stabilizer action by equivariant blowups until each fixed point has pseudo-reflection cotangent action; take the tame quotient and contract the resulting exceptional −1 curves. For j=1728 the order-2 action on source/target parameters is (x,y)↦(−x,−y); one blowup yields a regular quotient with one exceptional rational curve of self-intersection −2. For j=0 supersingular and n even, the effective order-3 action has equal eigencharacters and one blowup gives one exceptional −3 curve. For j=0 supersingular and n odd, the eigencharacters are inverse; blow up the two remaining fixed points and contract the resulting −1 curve, leaving two exceptional −2 curves. Ordinary mixed points use the corresponding a>b,a=b,a<b variants. Export every component’s multiplicity and intersections by total-transform valuations and F·C=0, not just the reduced incidence graph. General blowups, intersection theory and minimal-model contractions are StableReduction’s.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §§1.3.1–1.3.6 and algorithm §1.4, pp.38–48. The local actions, blowup charts and exceptional configurations give the all-prime-power tame modular resolution algorithm.


Proof route:

1. Start with the explicit regular rigidified deformation ring and the effective stabilizer representation.
2. Substitute y=xv or x=yu in f₀+p u and compute valuations; repeat at the fixed points specified in §§1.3.2–1.3.6.
3. Take invariants only after pseudo-reflection regularity is verified; contract the indicated −1 curve in the order-3 inverse-character case.
4. Determine multiplicities and intersection matrix from the total transform and F·C=0; glue with the unchanged regular cusp and ordinary outer charts.


Prerequisites: `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`; `ModularCurvesPartII:R13.5/corrected-coarse-singular-locus`; `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.


API:

- `modularRegularResolution` (constructor): The proper birational regular model with its identified generic fibre.
- `modularRegularResolution_exceptional` (projection): Its exceptional divisors have recorded genus, multiplicity, self-intersection and attachment maps.
- `modularRegularResolution_fibre` (compatibility): The total special fibre equals the pullback of the coarse fibre with computed valuations.
- `modularRegularResolution_minimal` (characterisation): No exceptional −1 curve over the resolved surface remains.
- `modularRegularResolution_baseChange` (functoriality): Flat unramified base change transports charts and the resolution; a ramified change requires normalization and a fresh regularity check.


Tests:

- `modularRegularResolution_noExtra` (degenerate): A regular point with trivial effective stabilizer is unchanged.
- `modularRegularResolution_orderTwo` (computation): The effective −1 action on both parameters contributes one −2 exceptional component.
- `modularRegularResolution_notSemistable` (non-example): For n=2,p=5 the regular model still has a component of multiplicity 4; regularity does not imply reduced semistability.


Uses: Gross–Zagier Chapter III: Provides the regular model and fibre intersection data.; R13.6: Exports the labelled modular graph and component maps.


Check:

- The resolution of the p=5 ordinary mixed j=1728 point contains a −2 rational exceptional curve; ignoring ordinary singularities misses it.


### 5. One-factor mixed-level models

Target `ModularCurvesPartII:R13.5/one-factor-mixed-level-model` (theorem).

For p∤M and M≥5, the compactified Γ₁(M)∩Γ₀(p) model over ℤ[1/M] has geometric fibre at p consisting of two copies of X₁(M)_𝔽p meeting at the supersingular Γ₁(M) points. On the fine rigidified locus the complete node equation is uv=p up to a unit, hence this is a regular semistable model. The components classify the Frobenius and Verschiebung choices and their maps to X₁(M) include the corresponding Frobenius/diamond transports. For Γ₀(Mp) remove the auxiliary rigidifier and use the tame or wild stabilizer quotient, resolving before using a semistable graph; a coarse extra-automorphism intersection can have higher thickness. For M<5 retain the stack/rigidified statement and descend with the explicit stabilizer analysis, rather than asserting a fine scheme. The cases needed by R20 are listed in the reader, including p=2,3 with p∤M.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.44–46, Figure 3 and sequence (3.1). The mixed-level fibre consists of two lower-level copies meeting at supersingular points and supplies the Jacobian degeneration.; [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. Compactified mixed Γ₁-level maps and generalized quotient moduli are finite flat.


Proof route:

1. Use the cyclic p-subgroup deformation on the fine prime-to-p curve to split the special fibre into Frobenius and Verschiebung components.
2. At a supersingular point the two local branches give the smoothing uv=p; retain the lower-level marking in the component maps.
3. Apply the coarse quotient/resolution separately when an effective stabilizer survives; small-level/wild descent belongs to the recorded gap.


Prerequisites: `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`; `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`.


Check:

- At p=2 with M=5 the fine Γ₁(M) marking removes elliptic automorphisms; this is not the same claim as tame coarse Γ₀(10) descent.


### 6. Prime-square semistable modular models

Target `ModularCurvesPartII:R13.5/prime-square-semistable-model` (construction).

For p>3, p∤M and an étale auxiliary rigidifying prime-to-p level, over W(k̄)[ϖ] with ϖ^((p²−1)/2)=p construct the proper normal nodal model of X₀(p²M) supplied by Edixhoven §2.1. It has two outer vertical lower-level components and two middle descended Igusa p-components, and a horizontal component over each supersingular lower-level point. With effective automorphism order 1,2,3 the horizontal smooth completion has equation y^((p+1)/e)=x(x−1)^(p−1), with e respectively 1,2,3; these are equations for the normal smooth projective completions, not claims that the affine plane equation is nonsingular. Attachments are at the designated points over 0,1,∞. The quotient by auxiliary level and its effective stabilizers gives the stated coarse modular model. Stabilization or minimal regular resolution uses StableReduction under its genus hypotheses; this nodal model need not itself be stable.


Sources: [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §2.1, pp.55–56; §§2.2–2.4, pp.56–65. The explicit extension, horizontal equations, vertical Igusa components and quotient gluing give the p² nodal model.


Proof route:

1. Base change and normalize the rigidified cyclic p² model over the displayed extension.
2. Compute the supersingular charts as in §2.2; normalize their plane equations and compare the overlap maps.
3. Glue to the ordinary Igusa charts and take the specified effective stabilizer quotient; use §2.4 for nodalness.
4. Use the existing stabilization theorem only where its genus/marking conditions apply.


Prerequisites: `ModularCurvesPartII:R13.5/tame-regular-resolution`; `ModularCurvesPartII:R13.5/igusa-components`; `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`.


API:

- `primeSquareModel` (constructor): The nodal model with its generic-fibre identification over W[ϖ].
- `primeSquareModel_vertical` (projection): Four outer and two middle components on the auxiliary rigidified presentation.
- `primeSquareModel_horizontal` (projection): The normalized horizontal curve and its attachment points for each effective automorphism type.
- `primeSquareModel_quotient` (compatibility): Auxiliary-level descent retains the effective stabilizer quotient and nodal charts.
- `primeSquareModel_stabilize` (compatibility): Its stable contraction agrees with the imported stabilization, when the genus/marking hypotheses hold.


Tests:

- `primeSquareModel_extensionThirteen` (computation): p=13 gives ϖ⁸⁴=13.
- `primeSquareModel_extraAutomorphisms` (non-example): At a supersingular j=0 with effective order 3, the horizontal exponent is (p+1)/3, not p+1.
- `primeSquareModel_generic` (compatibility): The generic fibre remains X₀(p²M), with the original two j-invariant maps.


Uses: BDMTV Theorem 6.5: Provides the explicit prime-square semistable fibre and Fricke action.; R13.6: Computes graphs and Jacobian/nearby-cycle inputs.


Check:

- A rational component with fewer than three special points can be present in this semistable model; it is contracted in the stable model when stabilization applies.


### 7. Split Cartan semistable fibres

Target `ModularCurvesPartII:R13.5/split-cartan-semistable-model` (theorem).

Let ℓ=12k+1 be prime and W=W(𝔽̄_ℓ). Over W[ϖ], ϖ^(12k(6k+1))=ℓ, X₀(ℓ²) has k horizontal curves u²=v^(ℓ+1)+1, and four vertical curves, two rational and two Ig(ℓ)/±1. Each horizontal meets each vertical once, with no other intersections. Fricke fixes each horizontal via (u,v)↦(u,−v), exchanges the rational verticals and preserves the two Igusa verticals. Its tame quotient is a proper nodal model of X_s(ℓ): k horizontals u²=v^(6k+1)+1 of genus 3k, one rational vertical and two Ig(ℓ)/C₄ verticals of genus (k−1)(3k−2)/2. Its dual graph is K_(k,3); hence b₁=2k−2 and g=6k²−3k. The equality ϖ^(ℓ²−1)=ℓ² is equivalent to the chosen equation and is not a different extension.


Sources: [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, Theorems 6.5–6.6 and their proof, pp.928–929. The explicit fibre, Fricke action, tame quotient, component genera and incidence are all stated with ℓ≡1 modulo 12.


Proof route:

1. Specialize the prime-square model to ℓ≡1 mod 12, where no supersingular j=0,1728 correction occurs.
2. Use Fricke action from the source, and tame invariant base change to identify the quotient special fibre.
3. The horizontal quotient replaces v² by its coordinate; the Igusa quotient is the effective C₄ level quotient.
4. Compute genera by the double-cover branch count and the imported nodal genus formula.


Prerequisites: `ModularCurvesPartII:R13.5/prime-square-semistable-model`; `ModularCurvesPartII:R13.4a/split-cartan-quotient`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.


Check:

- k=1 gives one genus-3 horizontal and three rational vertical leaves; k=3 (ℓ=37) gives total genus 45.


### 8. Good reduction of the level-13 curve

Target `ModularCurvesPartII:R13.5/split-cartan-thirteen-good-reduction` (application).

The split Cartan normalizer curve X_s(13) has good reduction at every prime other than 13 and acquires good reduction over Frac(W(𝔽̄₁₃)[ϖ]), ϖ⁸⁴=13. At 13 the k=1 semistable model above has a genus-3 horizontal u²=v⁷+1 with three rational leaves; contracting those leaves gives a smooth proper model. Away from 13 use the first Baran plane quartic on BDMTV p.930: (−Y−Z)X³+(2Y²+YZ)X²+(−Y³+Y²Z−2YZ²+Z³)X+2Y²Z²−3YZ³=0. It is smooth over ℤ[1/13], including at 2. The second quartic obtained by the determinant-2 substitution in the source is only smooth away from 2 and 13 and cannot prove the claim at 2.


Sources: [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Corollary 6.7, p.929 and first Baran model in §6.3, p.930. The semistable fibre proves potential good reduction at 13; the first integral equation provides the away-from-13 assertion.


Proof route:

1. For ℓ=13 specialize the stated quotient graph; contract the three genus-zero leaves using the existing surface contraction theorem.
2. Verify smoothness of the resulting genus-3 fibre and generic-fibre identification.
3. For primes other than 13 apply the Jacobian criterion to the first homogeneous quartic, with all projective charts, including characteristic 2.
4. Check the first quartic at 2 directly. On Z=1 the three derivative equations force t=Y+1≠0, X=t³+1, g=t⁷+t³+1=0 and F=t¹⁰+1. The Bézout identity (t⁹+t⁸+t⁷+t³+t²+t+1)g+(t⁶+t⁵+t⁴+t²+t)(t¹⁰+1)=1 rules out a singular point over the algebraic closure. On Z=0 the derivatives force X=Y≠0 but F_Z=X³≠0.


Prerequisites: `ModularCurvesPartII:R13.5/split-cartan-semistable-model`; `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.


Check:

- The Jacobian has toric rank zero after the extension because the graph is a tree; a tree alone would not prove smoothness without contracting the leaves.
- The determinant-2 change of plane coordinates is not an integral isomorphism at 2.


## R13.6. Modular degeneration interfaces


### 1. Modular dual graphs and thicknesses

Target `ModularCurvesPartII:R13.6/modular-dual-graphs` (construction).

Attach to each specified semistable modular model its imported labelled dual multigraph, retaining the normalized component, each pair of branches, node thickness, residue-field action, marked cusp section and its R13.3 parameter. For a fine one-factor Γ₁(M)∩Γ₀(p) model the graph has two vertices and one edge per supersingular marked elliptic curve, so for s geometric nodes b₁=s−1. For the ℓ² split Cartan model the graph is K_(k,3), with the component genera above. A nonreduced coarse pⁿ fibre is instead exported as a weighted intersection configuration until a stated reduced nodal model is chosen; it is not a semistable dual graph. An n-gon has n edges, also for n=1 (a loop) and n=2 (two parallel edges).


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), §3.9, Figure 3 and sequence (3.1), pp.45–46. The two-component geometry supplies the graph input to the character group.; [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6 and Figure 1, pp.928–929. The split Cartan incidence has k horizontal and three vertical vertices.; [Bas Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.4, pp.47–48; §2.1, pp.55–56. Weighted regular configurations and nodal p² models are distinct.


Proof route:

1. Choose the exact proper model and base from R13.5 and use the imported graph construction.
2. Read branch incidences and thickness from its completed local charts; mark cusp sections via the cyclotomic chart maps.
3. Compute the graph ranks without removing loops or parallel edges; export weighted coarse configurations separately.


Prerequisites: `ModularCurvesPartII:R13.5/one-factor-mixed-level-model`; `ModularCurvesPartII:R13.5/tame-regular-resolution`; `ModularCurvesPartII:R13.5/split-cartan-semistable-model`; `ModularCurvesPartII:R13.3/gamma-zero-prime-power-cusp-rings`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.


API:

- `modularGraph` (constructor): The imported graph attached to the supplied modular model and base.
- `modularGraph_components` (projection): The normalized component curves, genera and residue action.
- `modularGraph_nodes` (projection): The two branch flags at each node and its positive thickness.
- `modularGraph_cusps` (projection): The cusp sections with component labels and formal parameter maps.
- `modularGraph_modelComparison` (compatibility): A regular semistable resolution subdivides an edge according to its thickness without changing the generic curve.


Tests:

- `modularGraph_twoParallel` (computation): A 2-gon has two parallel edges and b₁=1, not a single edge and b₁=0.
- `modularGraph_thirteen` (computation): For X_s(13) the graph is a three-leaf tree and Σ g_v=3.
- `modularGraph_nonReduced` (non-example): The multiplicity-4 middle component of X₀(25) cannot be silently entered as a reduced nodal component.
- `modularGraph_subdivision` (compatibility): Resolving a thickness-n edge by a chain increases both edge and vertex counts by n−1, so H₁ rank is unchanged.


Uses: R11.4 and R20: Supplies the actual character lattice geometry.; Lower-tier LPV.7: Instantiates the general normalization and nearby-cycle sequences.


Check:

- At ℓ=13 the quotient graph is K_(1,3), b₁=0; at ℓ=37 it is K_(3,3), b₁=4.


### 2. Character groups of modular bad fibres

Target `ModularCurvesPartII:R13.6/modular-character-group-interface` (application).

For a proper regular semistable model C/R specified above, apply R11.4 to its nodal special fibre Y. The identity fibre of the Néron model of Jac(C_K) has torus T with character lattice H₁(Γ,ℤ), and abelian quotient ∏_v Jac(Ỹ_v). The monodromy pairing is the thickness-weighted edge pairing on the cycle lattice. Reorienting an edge changes its coordinate sign, not the intrinsic lattice or pairing. For the fine two-component one-factor model, H₁ is the degree-zero subgroup of the free lattice on its s supersingular marked points. The coarse Γ₀ model requires the resolved thicknesses/automorphism weights; it is not obtained by ignoring the stabilizers.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), §3.9, sequence (3.1) and character description, pp.45–46; §3.10.2, pp.47–48. The modular application of the torus/abelian exact sequence is used by level lowering.; [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6, p.929. The explicit quotient geometry provides its modular genus and toric-rank example.


Proof route:

1. Use the imported normalized Picard/Néron comparison for the exact semistable model.
2. Identify the cycle lattice with the kernel of its signed incidence map, and apply the imported weighted edge pairing.
3. In the two-vertex graph the incidence map is the degree sum on supersingular edges, giving the augmentation kernel.


Prerequisites: `ModularCurvesPartII:R13.6/modular-dual-graphs`; `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`; `NeronModelsAndSemistableAbelianVarieties:R11.4`.


Check:

- For X_s(13) after ϖ⁸⁴=13 the torus vanishes and the abelian quotient is the genus-3 horizontal Jacobian.
- For K_(3,3) the character lattice has rank 4, not rank equal to its 9 nodes.


### 3. Nearby cycles of modular nodal models

Target `ModularCurvesPartII:R13.6/modular-nearby-cycle-interface` (application).

For a specified proper nodal semistable modular model over a henselian trait, ℓ distinct from the residue characteristic, import the LPV.7 normalization and specialization sequences. With Γ its geometric graph and Ỹ its normalization, they give 0→H¹(Γ,ℚ_ℓ)→H¹(Y,ℚ_ℓ)→H¹(Ỹ,ℚ_ℓ)→0 and 0→H¹(Y,ℚ_ℓ)→H¹(C_K̄,ℚ_ℓ)→H₁(Γ,ℚ_ℓ)(−1)→0. Retain residue Galois action and the distinction H¹ versus H₁. The monodromy graded pieces are graph cohomology, component H¹, and twisted graph homology; no canonical splitting is asserted. Finite trait extension of ramification e multiplies the twisted monodromy by e and an old edge of thickness n becomes e n unit edges in a regular resolution. This is a modular instantiation of lower-tier LPV, replacing the upward prerequisite on WeightsInEtaleCohomology R34.3.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.45–46. The specific nodal modular model supplies the geometric input; the general étale theorem is imported from LPV.; [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorems 6.5–6.6, pp.928–929. The explicit proper nodal models supply a second modular instance.


Proof route:

1. Verify the exact model’s properness, smooth generic fibre and reduced nodal special fibre before using LPV.
2. Apply the lower-tier normalization and specialization statements with their branch coordinates and Galois actions.
3. Use the LPV choice/base-change comparison for subdivision and ramification; do not apply this theorem to an unreduced coarse fibre.


Prerequisites: `ModularCurvesPartII:R13.6/modular-dual-graphs`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-choice-basechange-compatibility`.


Check:

- For the level-13 good model Γ is a tree, so graph terms vanish and generic H¹ is the horizontal H¹.
- A thickness-2 node after ramification 3 gives six unit edges; replacing it by only three would give the wrong pairing.


### 4. Degeneracy maps on modular components

Target `ModularCurvesPartII:R13.6/degeneracy-on-components` (theorem).

For the one-factor fine Γ₁(M)∩Γ₀(p) special fibre, identify the two components by the Frobenius and Verschiebung subgroups, retaining transported level points. With lower-level point x=(E,P), the Frobenius component has (π₁,π₂)=(id,F), where F sends (E,P) to (E^(p),P^(p)); on the Verschiebung component π₂ is the identity and π₁ is F followed by the inverse diamond transport needed to send the quotient marked point back to P. Thus the ordinary quotient sum is (E^(p),P^(p))+p(E^(p⁻¹),pP^(p⁻¹)), with the p multiplicity coming from the inseparable leg. Prime-to-level Hecke correspondences act on supersingular marked edges by quotient isogenies and their actual multiplicities; reversing the legs gives the polarization-dual action on the cycle lattice. After a coarse quotient or resolution use the induced branch and thickness maps, rather than transporting a map of sets alone.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.3, pp.77–79; §3.9, pp.45–46. The ordinary subgroup closures give Frobenius plus the p-multiple inverse-Frobenius/diamond branch; the degeneration is Hecke invariant.


Proof route:

1. Label the connected subgroup by ker F and the étale subgroup by ker V, with the correct marked-point quotient.
2. Read the component maps and inseparable degree from the universal isogeny; the ordinary divisor formula fixes the inverse diamond transport.
3. Extend from the ordinary dense locus through the integral component maps and nodal branch data; apply the imported Picard/graph functoriality.
4. The oldspace and transposed character-group matrices are consumers in R20; do not reconstruct their exact-sequence theory here.


Prerequisites: `ModularCurvesPartII:R13.6/modular-dual-graphs`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R14.1/diamond-operators`; `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`; `ModularCurvesPartII:R13.6/modular-character-group-interface`.


Check:

- For Γ₀ level the diamond is trivial and the special correspondence is Frobenius plus transpose Frobenius, with scheme multiplicities.
- Do not give the same matrix [[T_q,q],[−1,0]] to Jacobians and character groups: the latter uses [[T_q,−1],[q,0]] in R20’s conventions.


## R14.1. Algebraic Hecke correspondences and traces


### 1. Compactified Hecke degeneracy maps

Target `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence` (construction).

For N≥1 and a prime p, the disjoint Γ₁(N;p) level stack parametrizes a Γ₁(N) structure and an order-p cyclic subgroup disjoint from its marked divisor in the required generalized-curve sense. Its two maps to Γ₁(N) forget the subgroup or quotient by it and contract the polygon to restore the ample marked divisor. Both stack maps are representable finite flat over ℤ, of degree p+1 if p∤N and p if p∣N. Their universal isogeny induces ξ:π₂*ω→π₁*ω. For squarefree q use the analogous Γ₁(N;q) disjoint level problem and finite-flat legs. In characteristic zero these are the customary curve correspondences. Coarse finite flatness is asserted only after its own descent check; it does not follow just from stack finite flatness.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. Both maps and the universal differential extend over the compactification, with the disjoint level condition.; [Kęstutis Česnavičius](https://arxiv.org/pdf/1511.07475), Lemma 4.7.1, p.49. The squarefree version is finite flat also when q and N share primes.; [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72. The degree is p+1 or p according to p∤N or p∣N.


Proof route:

1. Use the R13.2 disjoint Drinfeld level stack, not an arbitrary subgroup pair on a degenerate polygon.
2. Form the quotient generalized curve and contract; use the formal power isogeny at multiplicative cusps.
3. Apply the cited finite-flat moduli theorem over ℤ and compute generic degree. On any coarse model verify the separate descent hypotheses.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `ModularCurvesPartII:R13.2`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`.


API:

- `heckeLevelStack` (constructor): The disjoint compactified level stack with its universal quotient isogeny.
- `degeneracy1` (projection): Forget the p-subgroup then contract the allowed polygon.
- `degeneracy2` (projection): Quotient by the subgroup then contract, retaining the transported level point.
- `degeneracyDegree` (characterisation): The rank of either finite-flat stack leg is p+1 or p as specified.
- `degeneracyHodgeMap` (functoriality): The isogeny differential ξ extends over every cusp and equals the power-map differential on multiplicative charts.


Tests:

- `degree_degeneracy_coprime` (computation): N=11,p=2: degree 3, the three lines of E[2].
- `degree_degeneracy_dvd` (computation): N=10,p=5: degree 5; the level-intersecting subgroup is excluded.
- `degeneracy_boundary` (compatibility): On the multiplicative-kernel cusp, ξ sends du/u to p du/u, even when its residue is zero.
- `degeneracy_point_count` (non-example): The purely inseparable ordinary branch has one geometric preimage with rank p, so counting points gives the wrong trace.


Uses: Conrad07 §4.5: Defines the coherent trace whose division by p needs a theorem.; R14.2 and R13.6: Supplies Jacobian push–pull and special-fibre maps.


Check:

- N=11,p=2 gives degree 3; N=10,p=5 gives degree 5.
- In characteristic p a leg can be inseparable on one component. Counting geometric points is not a degree computation.


### 2. Diamond operators

Target `ModularCurvesPartII:R14.1/diamond-operators` (construction).

For a∈(ℤ/N)×, I_a sends (E,P) to (E,aP) on the compactified Γ₁(N) problem, with the necessary contraction on generalized curves. It preserves the coarse curve over ℤ and the Hodge sheaf via the identity on E. The stack action is the whole unit group. On a coarse curve I_−1 is the identity through the isomorphism [−1] of marked curves, but that same isomorphism acts as −1 on ω; weight-k descent therefore requires the appropriate sign/character. I_a I_b=I_ab. On Γ₀(N) every diamond is trivial. Do not identify the Hodge action with a trivial coarse action when k is odd.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43, Lemma 4.4.1. Diamond-invariant forms and the descent of ω retain stabilizer action.; [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–66; §5.2, p.71. The geometric diamond convention and its cohomological action are fixed.


Proof route:

1. Change the Drinfeld marked point by a unit; the ample divisor and contraction are preserved.
2. Use the inverse unit for inverse and the product for composition.
3. Track the differential of [−1] when the underlying coarse map becomes identity.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.


API:

- `diamond` (constructor): Compactified automorphism I_a and its Hodge identification.
- `diamond_mul` (simp): Composition follows multiplication of units.
- `diamond_inv` (instance): I_(a⁻¹) is inverse.
- `diamond_minusOne` (compatibility): I_−1 is trivial on the coarse curve but has sign −1 on the Hodge fibre.
- `diamond_baseChange` (functoriality): Formation commutes with the legal base changes of the moduli problem.


Tests:

- `diamond_group_order_11` (computation): φ(11)/2=5 for the coarse unit quotient.
- `diamond_minusOne_hodge` (non-example): Weight one with trivial character cannot descend by asserting I_−1 acts trivially on ω.
- `diamond_gammaZero` (degenerate): On Γ₀(N) the curve diamond maps are identity.
- `diamond_product` (compatibility): I_2 I_3=I_6 for N=11, including the boundary.


Uses: R14.1 and R14.2: Determines repeated-prime terms, adjoints and Galois conventions.


Check:

- N=11 gives an effective unit quotient of order 5 on X₁(11); N=3 gives a genus-zero coarse curve, whose Jacobian action is trivial.


### 3. Cyclotomic Fricke involution

Target `ModularCurvesPartII:R14.1/atkin-lehner-involution` (construction).

For N≥5 over ℤ[1/N,ζ_N], with ζ_N primitive, construct w_ζ on X₁(N) by quotienting E by ⟨P⟩ and choosing the dual-kernel generator determined by e_N(P,Q)=ζ_N. Extend by the generalized quotient/contraction at cusps. On the coarse curve w_ζ²=id and w_(ζ^a) w_ζ=I_a (the point inversion in the double quotient is already trivial on the coarse curve). Thus w_ζ=w_(ζ⁻¹) on this curve, and it descends to the real cyclotomic base ℤ[1/N,ζ_N+ζ_N⁻¹]. Galois acts by g w_ζ g⁻¹=w_(gζ). It is not generally defined over ℚ. The prime Γ₀(N) integral normalization extension over ℤ[1/N] is Layer 10’s existing construction.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.70–73. The moduli construction, real-cyclotomic descent and composition law are explicit.


Proof route:

1. Use the Weil pairing and dual quotient isogeny to select the target marked point.
2. Compare two successive quotient constructions, fixing the diamond convention by the displayed law.
3. Extend on Tate charts, then use normality/full faithfulness for equality and descent.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R14.1/diamond-operators`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.


API:

- `atkinLehner` (constructor): The cyclotomic pointed quotient map extended to X₁(N).
- `atkinLehner_sq` (simp): The coarse map is involutive.
- `atkinLehner_changeRoot` (compatibility): w_(ζ^a) w_ζ=I_a.
- `atkinLehner_galois` (functoriality): Conjugation changes ζ to gζ.
- `atkinLehner_realDescent` (universal-property): Descent along ζ↔ζ⁻¹ to the real cyclotomic base.


Tests:

- `atkinLehner_sq_eq_id` (compatibility): Two cyclic quotients recover the coarse marked curve.
- `atkinLehner_change_root` (characterisation): At N=11 two root choices with ratio exponent a differ by the nontrivial diamond I_a when a≠±1.
- `atkinLehner_rationality` (non-example): A full Γ₁ Fricke map is not automatically ℚ-rational just because the Γ₀ Fricke map is.
- `atkinLehnerAnalytic_involutive` (computation): For N,z≠0, −1/(N(−1/(Nz)))=z.


Uses: R14.2: Controls polarization adjoints and the twisted Hecke pairing.; R13.5: The Γ₀ version acts on the p² model.


Check:

- Replacing ζ by ζ^a changes the map by a diamond; omitting the field of definition destroys the Galois conjugation law.


### 4. Exact-divisor Atkin–Lehner operators

Target `ModularCurvesPartII:R14.1/exact-divisor-atkin-lehner` (construction).

For d∣N with gcd(d,N/d)=1, split a cyclic N-subgroup into its d and N/d factors and quotient by the d factor, replacing that factor by the dual kernel. This defines the ℚ-rational involution w_d on X₀(N); compactification is by normalization and the Tate boundary comparison. They commute and w_d w_e=w_(de/gcd(d,e)²), so the group has 2^ω(N) elements. The full Fricke map is d=N. No such involution is asserted from a nonexact divisor. Prime N≥5 over ℤ[1/N] uses the Layer 10 map; at primes dividing N extending to a chosen regular or semistable model is a separate equivariant-model assertion.


Sources: [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227. The exact-divisor involutions and their group law fix the Γ₀ convention.; [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.5 and proof of Theorem 6.6, pp.928–929. w_(ℓ²) extends to the explicit semistable model and its tame quotient is computed.


Proof route:

1. Construct the coprime subgroup decomposition and its dual quotient on the elliptic open.
2. Extend the map by normal compactification and invert it by the same construction.
3. Compute the composition from prime-power factor decompositions. Import the prime-level integral overlap rather than redo it.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `ModularCurvesPartII:R14.1/atkin-lehner-involution`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.


API:

- `atkinLehnerExact` (constructor): w_d with a proof d is an exact divisor.
- `atkinLehnerExact_mul` (simp): The composition has exact divisor de/gcd(d,e)².
- `atkinLehnerExact_one` (simp): w₁ is identity.
- `atkinLehnerExact_field` (compatibility): The Γ₀ construction is over ℚ, independently of a primitive root.
- `atkinLehnerExact_model` (compatibility): On the specified p² semistable model it is the component/branch action of R13.5.


Tests:

- `atkinLehnerExact_twelve` (computation): N=12: exactly four exact-divisor operators.
- `atkinLehnerExact_nonexact` (non-example): d=2 at N=12 cannot be supplied as an exact divisor.
- `atkinLehnerExact_one` (degenerate): d=1 gives identity.
- `atkinLehnerExact_product` (compatibility): w₃w₄=w₁₂ and w₄²=id for N=12.


Uses: Gross–Zagier Chapter I: Fixes Γ₀ arithmetic correspondences.; BDMTV §6.2: Constructs the split-Cartan normalizer quotient.


Check:

- N=12 has exact divisors 1,3,4,12; 2 is not exact. The product w₃w₄ is w₁₂.
- w₄w₄=w₁, not w₁₆.


### 5. Full and cyclic isogeny correspondences

Target `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences` (construction).

For m≥1 prime to N on the smooth characteristic-zero Γ₁(N) curve, let A_m parametrize every subgroup scheme of order m, and let C_m parametrize only cyclic subgroups of order m, transporting the marked point by the quotient. Compactify each elliptic-open correspondence by its normal finite closure, retaining cycle multiplicity. The degrees of both legs are σ₁(m)=Σ_(d∣m)d for A_m and ψ(m)=m∏_(p∣m)(1+1/p) for C_m. On a split Tate cover the subgroups are indexed by a d=m and 0≤b<d; the quotient parameter is q′=ζ_d^b q^(a/d), and the isogeny is u↦u^a. The subgroup is cyclic exactly when gcd(a,b,d)=1. Every noncyclic subgroup has a unique scalar elementary-divisor factor r, and A_m=Σ_(r²∣m)⟨r⟩ C_(m/r²) as operators/cycles in this transported-level convention. The equality is on completed correspondences with their maps, not an assertion that raw cusp fibre products are normal.


Sources: [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §1, p.226. The full order-m subgroup correspondence has σ₁(m) degree.; [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717. The cyclic definition and Tate boundary specialization are used with corrected degree and polygon domains.; [David Masser and Umberto Zannier](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646. The modular polynomial parametrizes the cyclic correspondence and has ψ(m) degree.


Proof route:

1. Classify finite-index rank-two lattices by Hermite normal form; their elementary divisors give the cyclicity criterion and both counts.
2. Read the corresponding Tate quotient on the split cover and keep the root of unity and differential multiplier a.
3. Use the unique scalar subgroup E[r] factor to derive the diamond-weighted decomposition; normalize the compactified finite closures.


Prerequisites: `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R14.1/diamond-operators`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure`; `AlgebraicModuliForArithmeticGeometry:R09.5/normalized-correspondence`.


API:

- `allSubgroupCorrespondence` (constructor): A_m, its two finite generic legs and normalized compactification.
- `cyclicSubgroupCorrespondence` (constructor): C_m with the cyclic condition and its finite normalized closure.
- `allSubgroupCorrespondence_degree` (characterisation): Its degree is σ₁(m).
- `cyclicSubgroupCorrespondence_degree` (characterisation): Its degree is ψ(m).
- `correspondenceTateBranch` (compatibility): The branch (a,d,b) has q′=ζ_d^b q^(a/d) and differential multiplier a.
- `allSubgroupCorrespondence_scalarDecomposition` (compatibility): The decomposition has the diamond ⟨r⟩ attached to E[r].


Tests:

- `fullCyclic_four` (computation): σ₁(4)=7 and ψ(4)=6; the pair (a,d,b)=(2,2,0) is the noncyclic one.
- `fullCyclic_one` (degenerate): A₁=C₁ is the identity correspondence.
- `fullCyclic_squarefree` (characterisation): For m=6 all twelve branches satisfy the cyclic criterion.
- `fullCyclic_tate` (compatibility): For m=p the multiplicative branch has q′=q^p and p other branches have q′=ζ_p^b q^(1/p).
- `fullCyclic_diamond` (non-example): At N=11,m=4 the scalar E[2] term transports P to 2P; replacing it by an identity-level correspondence loses the diamond.


Uses: Bakker–Tsimerman §2.5 and §6: Fixes cyclic degrees and boundary geometry.; R14.2 and ModularityLifting: Fixes repeated-prime algebra relations.


Check:

- m=4 gives seven full subgroups and six cyclic ones. The omitted subgroup is E[2], whose quotient transports P to 2P.
- m=6 gives both degrees 12 because squarefree subgroups are cyclic.


### 6. Hecke composition relations

Target `ModularCurvesPartII:R14.1/composition-relations-of-correspondences` (theorem).

For m,n prime to N and gcd(m,n)=1, composition of full correspondences A_m A_n=A_(mn); cyclic correspondences also satisfy C_m C_n=C_(mn). The correspondence equality is a normalized cycle equality, not a raw fibre-product isomorphism at the boundary. For p∤N the repeated-prime relations in the transported-level convention are A_p²=A_(p²)+p⟨p⟩, A_(p²)=C_(p²)+⟨p⟩, and C_p²=C_(p²)+(p+1)⟨p⟩. At p∣N the disjoint U_p correspondences instead compose as U_p U_(p^r)=U_(p^(r+1)), on their specified level problem; no unit diamond ⟨p⟩ exists there. Abstract double-coset algebra is imported from ModularForms layers 2–3 and the pinned Tau Ceti Hecke ring; this theorem realizes it on these modular cycles.


Sources: [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §1, p.226. The full subgroup correspondence convention determines the classical repeated-prime identity.; [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72. The disjoint level correspondence agrees with the classical Hecke/U operators.


Proof route:

1. For coprime indices split each subgroup into its unique primary factors; compare the transported marked point.
2. For p² count chains above a cyclic subgroup (one) and above E[p] (p+1); the latter transports P to pP.
3. Use normal finite closures for cycle equality and the disjoint bad-prime subgroup condition for U.


Prerequisites: `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R14.1/diamond-operators`; `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`.


Check:

- At p=2 the cyclic relation has coefficient 3, whereas the full relation has coefficient 2.
- At N=11,m=2,n=3 both sides have degree 12.


### 7. Classical and geometric Hecke actions

Target `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences` (comparison).

Over ℂ on a chosen honest component, identify the modular curves with the earlier compactified congruence quotients. Under Shimura’s weight-two identification, π₁*π₂^* on H¹ is the classical upper Hecke operator and its conjugate on the antiholomorphic summand. On holomorphic weight-k forms include the universal isogeny differential ξ^k; the unnormalized coherent trace is p times classical T_p. Full versus cyclic operators, transported diamonds, and the Γ₁ cyclotomic Fricke map retain the R14.1 conventions. The analytic map w_N(z)=−1/(Nz) is the component-fixed shadow of the chosen root, not proof of rational descent.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorems 5.1–5.2, pp.65–67. Shimura comparison and cup/Petersson compatibility fix the upper convention.; [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48. The weight-k trace includes the isogeny differential and the factor p.


Proof route:

1. Compare the maps on the elliptic analytic open with the fixed quotient lattice and point conventions.
2. At cusps use the Tate quotient and differential, then use q-expansion determination from the earlier modular-form supplier.
3. Apply the cited cohomological comparison and record upper/lower adjoint conventions separately.


Prerequisites: `ModularCurvesPartII:R13.4b/generic-component-comparison`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R14.1/diamond-operators`; `ModularCurvesPartII:R14.1/atkin-lehner-involution`; `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`; `ModularCurvesPartII:R12.6`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.


Check:

- For p∤N weight two has a_n(T_pf)=a_(np)+p a_(n/p)(⟨p⟩f); a pointwise average would give a different operator.


### 8. Integral coherent Hecke trace

Target `ModularCurvesPartII:R14.1/coherent-hecke-trace` (construction).

For k≥1, over Γ₁(N)/ℤ define F=Tr_(π₁)∘ξ^k∘π₂^* on ω^k. The local finite-flat theorem shows F(ω^k)⊂pω^k, hence T_p=F/p exists integrally over ℤ and is compatible with base change as a normalized integral operator. On a characteristic-p base its construction uses lifts modulo p² and the proved divisibility/independence of the lift; it is not division by zero in the residue field. On multiplicative ordinary/kernel and cusp charts ξ vanishes modulo p; on the étale-kernel ordinary chart the purely inseparable leg has trace zero modulo p. The local operators glue by the coherent-extension lemma. On q expansions, for p∤N, a_n(T_pf)=a_(np)(f)+p^(k−1)a_(n/p)(⟨p⟩f), with a_(n/p)=0 unless p∣n; for p∣N it is a_(np). Nothing here defines a normalized étale/Picard trace by dividing by p.


Sources: [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.5.1, Lemma 4.5.2 and Example 4.5.3, pp.46–48. The p-divisibility calculation, glueing, lifting in characteristic p and both q-expansion formulas are the targets.


Proof route:

1. Construct the honest finite-flat trace and ξ^k on the integral stack.
2. Prove p-divisibility on the two ordinary charts and Tate boundary charts; extend by the cited local CM/coherent lemma.
3. Divide over ℤ, prove independence of lifts modulo p² and glue; use the Tate branches to verify the coefficient formula.


Prerequisites: `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R13.3/boundary-carriers-and-hodge-evaluation`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `SchemeAndStackFoundations:SF.2`.


API:

- `coherentHecke` (constructor): The integral normalized T_p on ω^k for k≥1.
- `coherentHecke_rawTrace` (characterisation): p T_p=Tr_(π₁) ξ^k π₂^* over the integral model.
- `coherentHecke_baseChange` (functoriality): Base change of the proved normalized operator, including residue characteristic p.
- `coherentHecke_qExpansion` (simp): The good and bad coefficient formulas with the displayed diamond.
- `coherentHecke_liftIndependence` (compatibility): Modulo-p² lifts define the same characteristic-p operator.


Tests:

- `coherentHecke_weight_one` (computation): Modulo p at k=1 retain both a_(np) and a_(n/p)(⟨p⟩f).
- `coherentHecke_weight_two` (computation): Modulo p at k=2 the p-multiple term vanishes.
- `coherentHecke_bad` (compatibility): For p∣N only a_(np) occurs, without an undefined ⟨p⟩.
- `coherentHecke_division` (non-example): An operator on a characteristic-p ring cannot be defined by inverting p; it is the reduction of the normalized integral trace.


Uses: R13.4b and ModularForms: Fixes integral geometric/classical normalization.; R14.2: Distinguishes differential trace from Picard norm.


Check:

- For k=1 in characteristic p the second q-term has coefficient 1; for k≥2 it vanishes modulo p.
- The construction needs k≥1: ξ^0 does not give the multiplicative-kernel divisibility argument.


### 9. Integral étale correspondence trace

Target `ModularCurvesPartII:R14.1/integral-etale-trace` (theorem).

For the actual finite maps f:D→C between smooth proper geometric generic-fibre modular curves and ℓ invertible in their base, use duality to define the integral H¹_et trace f_* dual to f^*. It satisfies f_*f^*=[deg f] and is compatible with Picard norm through T_ℓ Pic⁰≃H¹_et(−,ℤ_ℓ(1)). Thus π₁*π₂^* and its leg reversal give integral Hecke endomorphisms, even when ℓ divides deg π₁; no averaging is imposed. In special characteristic p≠ℓ an inseparable finite map still has its degree-weighted Gysin trace, not the sum of its distinct geometric fibres. At a bad nodal fibre use the R13.6 nearby-cycle/interface comparison; smooth-curve duality is not asserted on that singular carrier.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorem 5.1 and Lemmas 5.4,5.7, pp.65–69. The integral geometric pull–push and Picard/cup comparison fix the trace convention.


Proof route:

1. Import the finite-curve duality trace and prove the degree formula using the actual fundamental class.
2. Compare with Kummer and Picard norm, then compose the two correspondence legs.
3. For special nodal models use the supplied specialization exact sequence, retaining multiplicities.


Prerequisites: `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; `EtaleDualityAndPerverseSheaves:EDC.6`.


Check:

- A degree-2 map with ℓ=2 has f_*f^*=[2], not identity.
- Absolute Frobenius in characteristic p has degree p and its duality trace retains that factor although it is a bijection on geometric points.


### 10. Hecke cycles on projective level curves

Target `ModularCurvesPartII:R14.1/projective-boundary-hecke-and-degree` (theorem).

For prime level p>3 and m prime to p, compactify the cyclic degree-m correspondence on the scalar-framed coarse X(p) with its transported framing. For a d=m use C_(pd) as a splitting polygon: the auxiliary map φ_d:C_(pd)→C_p has smooth formula (x,c)↦(x^d,c mod p), degree d² and an isomorphism on p-torsion. For a transverse cyclic subgroup G of order d, its quotient ψ_G:C_(pd)→C_p has degree d, and ξ_a:C_p→C_p is power a on Gₘ and identity on ℤ/p. The boundary framing is ξ_a[p] ψ_G[p] φ_d[p]⁻¹ f. Retain only choices whose composite kernel is cyclic (the Tate criterion gcd(a,b,d)=1); taking every divisor a,d and every transverse G without this condition gives the full-subgroup boundary union. The source of φ_d is Gₘ×ℤ/(pd), and that of ξ_a is Gₘ×ℤ/p. Keep the μ_p-equivariance, smoothing parameter and raw/effective stabilizer distinction. For μ=id×α and ν=id×β on X(p)×T_m, the image cycle ν_*μ^*C has canonical degree ψ(m) times that of C, by projection formula and numerical equality of α^*K and β^*K. For the full-subgroup convention the multiplier is σ₁(m). This is numerical intersection equality, not a canonical line-bundle isomorphism.


Sources: [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717; §6, p.736. The polygon formula needs domain ℤ/(pm), and the degree multiplier depends on whether the correspondence is cyclic or full.


Proof route:

1. Use the split (a,d,b) Tate branch; φ_d has degree d² and is only an auxiliary p-torsion identification. The actual ξ_a ψ_G map has degree ad=m. Its kernel is cyclic exactly under the stated filter.
2. Transport the projective frame, retaining scalar-equivalence and stabilizers rather than introducing a nonexistent universal family.
3. Apply the cycle projection formula; use numerical degree on the curve, then the two equal correspondence degrees.


Prerequisites: `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient`; `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`; `SchemeAndStackFoundations:SF.5`.


Check:

- m=4 gives cyclic multiplier 6, full multiplier 7.
- For m=1 the cycle and canonical degree are unchanged; Γ₁ fine-level geometry is not inferred from this coarse projective statement.


## R14.2. Jacobians and faithful integral realization


### 1. Modular Jacobians and norms

Target `ModularCurvesPartII:R14.2/jacobian-and-functoriality` (construction).

For N≥5 put S=Spec ℤ[1/N] and let C=X₁(N)/S, the smooth proper geometrically connected coarse curve. Construct J₁(N)=Pic⁰_(C/S), an abelian scheme of relative dimension g(C), with its canonical principal polarization. For X₀(N) or another smooth proper geometrically connected coarse quotient use the same construction on its legal smooth base; disconnected honest full level requires componentwise Picard and field descent. For a finite flat map f:D→C of such curves, define Picard pullback f^*:J_C→J_D and divisor norm f_*:J_D→J_C, with f_*f^*=[deg f]; the polarization dual of f^* is f_*. Norm counts the ramification/inseparable lengths, not just distinct geometric images. Under the polarization this agrees with the Albanese functor. A bad-level singular coarse fibre is not an abelian scheme: use its smooth generic Jacobian and the lower Néron model.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Lemma 5.4 and Definitions 5.5–5.6, pp.67–68; §5.2, pp.70–72. Picard pullback and Albanese/norm are transpose under the canonical polarization; J₁ extends over ℤ[1/N].


Proof route:

1. Use the imported relative Picard representability; H² of a curve vanishes, giving smoothness via the requested lifting criterion.
2. Use the proper neutral-component and polarization supplier to identify the abelian scheme and its dual.
3. Construct norm on line bundles/divisors, checking ramification multiplicities and relative base change; prove degree and duality identities.


Prerequisites: `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.4a/legal-coarse-base-change`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting`; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `AbelianSchemesAndArithmeticModuli:A2`; `NeronModelsAndSemistableAbelianVarieties:R11.1`.


API:

- `modularJacobian` (constructor): The relative neutral Picard abelian scheme on the specified smooth base.
- `modularJacobian_dimension` (characterisation): Its relative dimension is the fibre genus.
- `jacobianPull` (functoriality): Contravariant pullback of degree-zero line bundles.
- `jacobianNorm` (functoriality): Covariant norm with scheme multiplicities.
- `jacobianNorm_pull` (simp): f_*f^*=[deg f].
- `jacobianNorm_dual` (compatibility): f_* is the polarization transpose of f^*.
- `modularJacobian_baseChange` (compatibility): Relative Pic⁰ and its canonical polarization commute with the supplied base changes.


Tests:

- `jacobian_genus_zero` (degenerate): J₀(1)=0; its endomorphism ring and all Hecke operators are zero.
- `albanese_comp_picZero_degeneracy` (computation): N=11,p=2: π₁*π₁^*=[3].
- `jacobianNorm_ramification` (non-example): A totally ramified degree-2 map contributes multiplicity 2 to the norm identity.
- `jacobianNorm_composition` (compatibility): Norm of g∘f is g_*f_*, while pullback reverses order.


Uses: R14.2: Carries the geometric Hecke algebra and its faithful realizations.; R13.6/R20: Supplies the generic Jacobian whose special degeneration is computed.


Check:

- For genus zero J=0, so multiplication by any degree is the unique zero endomorphism.
- For a degree-2 map, norm after pullback is [2], not an identity retraction.


### 2. Upper and lower Jacobian Hecke operators

Target `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian` (construction).

On the generic fibre define upper T_p^J=π₁*π₂^* and lower (T_p^J)_*=π₂*π₁^*, with the same disjoint correspondence for p∣N. Define upper diamond by Picard pullback I_a^* and lower diamond by Albanese norm I_a*. Extend these endomorphisms uniquely over J₁(N)/ℤ[1/N] by normal-base Hom extension; for p∤N the degeneracy maps themselves exist on the smaller smooth base ℤ[1/Np] before this extension. The endomorphisms commute and satisfy the full-subgroup Hecke algebra relations. Their polarization transposes exchange upper/lower. On the cotangent space the lower operator is classical T_p, whereas the upper operator is its Petersson adjoint. On a bad-level Néron model extend the generic endomorphism by the Néron mapping property, without declaring its identity fibre abelian.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Definitions 5.5–5.6, p.68; §5.2, pp.71–72. Upper and lower operators, their cotangent conventions and integral extension are specified.


Proof route:

1. Compose the actual Picard and norm maps, then apply polarization duality to reverse the legs.
2. Compare cotangent action under Shimura and use its faithfulness in characteristic zero to transport the classical relations.
3. Extend over the normal good-level base using the imported relative Hom theorem; use Néron extension separately at bad-level DVRs.


Prerequisites: `ModularCurvesPartII:R14.2/jacobian-and-functoriality`; `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`; `ModularCurvesPartII:R14.1/diamond-operators`; `ModularCurvesPartII:R14.1/composition-relations-of-correspondences`; `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`; `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`; `ModularCurvesPartII:R14.1/integral-etale-trace`.


API:

- `heckeUpper` (constructor): π₁*π₂^* on the generic Jacobian and its unique good-base extension.
- `heckeLower` (constructor): π₂*π₁^* with the transpose convention.
- `heckeJacobian_dual` (compatibility): Canonical polarization exchanges the two leg orders.
- `heckeJacobian_cotangent` (compatibility): Lower is classical and upper is its adjoint on weight-two cotangent forms.
- `heckeJacobian_extend` (universal-property): Unique extension across the normal good-base dense open.
- `heckeJacobian_relations` (simp): The full-subgroup Hecke/diamond and bad U relations hold in End(J).


Tests:

- `heckeJacobian_good_norm` (computation): N=11,p=2: each same-leg norm–pull is [3], without a factor 1/3.
- `heckeJacobian_bad` (non-example): At p∣N do not define diamond p, and do not apply good-prime adjoint formulas using its inverse.
- `heckeJacobian_upperLower` (compatibility): Polarization transpose of π₁*π₂^* is π₂*π₁^*.
- `heckeJacobian_zero` (degenerate): On J₀(1)=0 both operators are zero.


Uses: R14.2/R14.3: Gives the actual integral endomorphisms before extracting eigenspaces or representations.; R13.6: Restricts the endomorphisms to the modular torus and abelian component factors.


Check:

- For p∣N the geometric operator is U_p; there is no ⟨p⟩ unit to insert.
- For Γ₀(N) good p the diamond is trivial and upper/lower agree, but this equality is not imposed on general Γ₁ level.


### 3. The geometric integral Hecke algebra

Target `ModularCurvesPartII:R14.2/integral-hecke-algebra` (definition).

Define T_J as the unital image of the abstract integral full-subgroup Hecke/diamond algebra in End(J₁(N)), using the upper convention and all good/bad operators; lower gives its polarization-transpose isomorphic image. It is a commutative finite free ℤ-algebra as a ℤ-module because End(J) is finite free and T_J is a submodule. Faithful action means injectivity of this image algebra into End(J), integral Betti H¹ and End(T_ℓJ), not faithfulness of the entire abstract double-coset algebra before quotienting its kernel. Its rational rank is computed by the modular-form comparison below; on Γ₀ it equals dim_ℚ S₂(Γ₀(N),ℚ). If g=0 the image is the zero ring, of rank 0. No R14.3 eigenspace freeness or rank-two Galois theorem is used here.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.66–69; §5.2, pp.71–72. The integral Hecke ring is a finite free image algebra and agrees with the Jacobian action.; [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306. For Γ₀ the characteristic-zero coefficient pairing computes the rational rank.


Proof route:

1. Take the image ring of the specified realization, inheriting the commutative relations.
2. Use the imported finite-freeness of the abelian Hom group to deduce finite-freeness of its ℤ-submodule.
3. Identify the faithful realized integral action and postpone any rank-two eigenspace claim to R14.3.


Prerequisites: `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`; `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.


API:

- `heckeAlgebraUpper` (constructor): The image subring of End(J) with its upper action.
- `heckeAlgebraUpper_finiteFree` (instance): Its underlying ℤ-module is finite free, including the zero case.
- `heckeAlgebraLower_equiv` (equivalence): Polarization transpose identifies upper and lower commutative image algebras.
- `heckeAlgebraUpper_faithful` (characterisation): The image acts faithfully on J and the supplied integral realizations.
- `heckeAlgebraUpper_rank` (compatibility): Its rational rank agrees with the appropriately descended weight-two form space.


Tests:

- `heckeAlgebra_genus_zero` (degenerate): Γ₀(1) gives the zero image ring of rank 0.
- `heckeAlgebra_gammaZero_eleven` (computation): The Γ₀(11) image ring has ℤ-rank 1.
- `heckeAlgebra_image_kernel` (non-example): An abstract Hecke operator annihilating all level-N forms is zero in T_J.
- `heckeAlgebra_transpose` (compatibility): Duality reverses products, but on this commutative image it is a ring isomorphism between conventions.


Uses: R14.3: Supplies the finite faithful integral coefficient ring; R14.3 owns eigenquotients and rank-two assertions.; ModularForms Layer 8: The geometric realization comparison identifies its existing algebra.


Check:

- For genus zero T_J=0, not ℤ. For Γ₀(11), g=1 so T_J has rank 1.
- Replacing the image algebra by the abstract Hecke algebra loses finite rank and faithfulness.


### 4. Polarization and Hecke adjoints

Target `ModularCurvesPartII:R14.2/weil-pairing-adjointness` (theorem).

The canonical polarization gives a perfect alternating Weil pairing T_ℓJ×T_ℓJ→ℤ_ℓ(1). Upper and lower Hecke operators are mutually adjoint. For p∤N and upper diamond convention, T_p^†=⟨p⟩⁻¹T_p and ⟨a⟩^†=⟨a⟩⁻¹. At bad p use leg reversal, or conjugation by the chosen cyclotomic Fricke map w_ζ; do not substitute an undefined diamond p. Fricke conjugation exchanges upper/lower for all Hecke operators, so the w-twisted bilinear pairing makes the image algebra self-adjoint; this twisted pairing is not claimed alternating. After choosing ℚ̄→ℂ and roots ζ_(ℓ^r)=exp(2πi/ℓ^r), the Weil form on T_ℓPic⁰ corresponds to the negative of the integral cup form on H¹, as in Conrad’s sign convention. With Galois action retain the Tate-twist multiplier and g w_ζ g⁻¹=w_(gζ).


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Theorem 5.2, Corollary 5.3, Lemma 5.7 and Theorem 5.8, pp.67–69. Petersson adjoints, the negative cup/Weil sign and twisted self-adjointness fix all conventions.


Proof route:

1. Use norm/pullback polarization transposes to compute the adjoint of each correspondence.
2. Compare with Petersson and the Fricke conjugation law to obtain the stated diamond factors.
3. Fix the roots-of-unity identification before comparing Weil and cup signs; retain the Galois twist instead of treating the pairing as ℤ_ℓ-valued intrinsically.


Prerequisites: `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`; `ModularCurvesPartII:R14.1/atkin-lehner-involution`; `ModularCurvesPartII:R14.1/diamond-operators`; `AbelianSchemesAndArithmeticModuli:A3`; `ModularCurvesPartII:R14.1/integral-etale-trace`.


Check:

- For Γ₀ good p the diamond is trivial and T_p is self-adjoint.
- Negating the cup form changes the comparison sign but not the norm–pullback transpose; a convention-free equality would fail.


### 5. The modular Jacobian Tate module

Target `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions` (construction).

For ℓ prime, over ℚ define T_ℓJ=lim_r J[ℓ^r](ℚ̄), a finite free ℤ_ℓ-module of rank 2g with its continuous G_ℚ action and commuting rational Hecke/diamond action. Intrinsically Kummer identifies it with H¹_et(C_ℚ̄,ℤ_ℓ(1)); choosing a complex embedding and compatible roots removes the twist in the comparison with integral Betti H¹⊗ℤ_ℓ. It is not identified with H₁ without duality/polarization. The map End(J)⊗ℤ_ℓ→End_(ℤ_ℓ)(T_ℓJ) is injective with torsion-free cokernel in the supplied Hom theorem; equality with the Galois centralizer is not asserted. Good reduction over ℤ[1/N] makes this representation unramified outside Nℓ by the lower arithmetic good-reduction criterion. w_ζ is defined over its cyclotomic field and obeys semilinear Galois conjugation, rather than commuting with all G_ℚ. The module is rank 2g over ℤ_ℓ; rank 2 over a Hecke factor belongs to R14.3.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.67–69; §5.2, pp.72–73. The integral H¹/Tate comparison, commuting rational endomorphisms and unramified good-base action are the modular instance.


Proof route:

1. Import the A4 inverse-limit carrier, its freeness and continuous action.
2. Apply Kummer to Pic⁰ and the supplied integral comparison, tracking the twist and sign.
3. Use the A6 Hom injection for faithfulness and the arithmetic good-reduction criterion for unramifiedness; handle Fricke through its field of definition.


Prerequisites: `ModularCurvesPartII:R14.2/jacobian-and-functoriality`; `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`; `ModularCurvesPartII:R14.2/integral-hecke-algebra`; `ModularCurvesPartII:R14.2/weil-pairing-adjointness`; `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`; `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; `ModularCurvesPartII:R14.1/integral-etale-trace`; `ArithmeticGaloisRepresentations:R01.6`.


API:

- `jacobianTateModule` (constructor): The inverse-limit ℤ_ℓ lattice with topology and continuous Galois action.
- `jacobianTateModule_rank` (characterisation): Its ℤ_ℓ-rank is 2g.
- `jacobianTateModule_kummer` (equivalence): T_ℓ Pic⁰≃H¹_et(C,ℤ_ℓ(1)), retaining the twist.
- `jacobianTateModule_hecke` (instance): The rational geometric Hecke image acts continuously and commutes with G_ℚ.
- `jacobianTateModule_faithful` (compatibility): The imported Hom injection makes the integral image algebra faithful.
- `jacobianTateModule_unramified` (compatibility): Unramifiedness away from Nℓ follows from the specified good abelian model.


Tests:

- `jacobianTateModule_zero` (degenerate): Genus zero gives a rank-zero lattice.
- `jacobianTateModule_eleven` (computation): Γ₀(11) gives rank 2 over ℤ_ℓ, rather than rank 1.
- `jacobianTateModule_twist` (non-example): Removing ℤ_ℓ(1) without a roots-of-unity choice loses the cyclotomic Galois multiplier.
- `jacobianTateModule_fricke` (compatibility): g w_ζ g⁻¹=w_(gζ), while rational Hecke endomorphisms commute with g.


Uses: R14.3: Starting carrier for Hecke eigenspaces and automorphic Galois representations.; R13.6 and R20: Specializes into the modular torus/component sequence without rebuilding general monodromy.


Check:

- At genus zero the Tate module is zero. For Γ₀(11) it has ℤ_ℓ-rank 2, and the Hecke algebra has rank 1.
- At ℓ=2 the degree-2 trace remains multiplication by 2 rather than an invertible normalization.


### 6. The rational coefficient pairing

Target `ModularCurvesPartII:R14.2/rational-coefficient-pairing` (theorem).

For Γ₀(N) over ℚ identify cotangent forms with S₂(Γ₀(N),ℚ), the rational q-expansion space, using the earlier descent supplier. With the lower Jacobian Hecke image T and β(T,f)=a₁(Tf), the pairing (T⊗ℚ)×S₂(Γ₀(N),ℚ)→ℚ is perfect. The identities a_m(f)=a₁(T_m f), determination by q expansion, commutativity, and faithful cotangent action prove its two nondegeneracy statements. Consequently dim_ℚ(T⊗ℚ)=g(X₀(N)). For Γ₁ or character components, use the actual descended coefficient field and diamond action; this statement does not replace the field by ℚ without proof. Rational perfection alone does not imply an integral unimodular pairing on a chosen q-lattice.


Sources: [Benedict H. Gross and Don B. Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306. Faithful cotangent Hecke action and the rational a₁-pairing prove the Γ₀ rank formula.


Proof route:

1. If β(T,f)=0 for all T, each Fourier coefficient of f is zero, so f=0.
2. If β(T,f)=0 for every f, then β(T_m,Tf)=β(T_mT,f)=0 for all m,f; hence Tf=0 for every f.
3. Use cotangent faithfulness in characteristic zero to conclude T=0, then use finite dimension for perfection.


Prerequisites: `ModularCurvesPartII:R14.2/integral-hecke-algebra`; `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`; `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`; `ModularCurvesPartII:R12.5`.


Check:

- Γ₀(1): both sides have dimension 0. Γ₀(11): both have dimension 1.
- A determinant of an integral pairing need not be ±1 merely because its rationalization is perfect.


### 7. Integral Hecke realization comparison

Target `ModularCurvesPartII:R14.2/integral-hecke-realization-comparison` (comparison).

With upper/lower transpose conventions fixed, identify the same integral image of the abstract Hecke algebra on J, Betti H¹(C(ℂ),ℤ), the corresponding modular-symbol lattice, and T_ℓJ for every ℓ. Equality of integral kernels uses the faithful Hom/Betti comparison and the supplied End⊗ℤ_ℓ injection; equality after tensoring with ℚ alone is insufficient to identify integral lattices. The cotangent/classical-form comparison is the lower action, and the upper action is its adjoint; the normalized coherent weight-two T_p comes from its separate local p-divisibility theorem, whereas the Jacobian/étale push–pull has no inverse-degree normalization. These are comparisons with ModularForms Layer 8’s existing integral Hecke algebra, not a new algebra or a rank-two eigenspace theorem.


Sources: [Kenneth A. Ribet and William A. Stein; appendix Brian Conrad](https://www.wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–69; §5.2, pp.71–72. The integral Betti/Jacobian action and its dual conventions give the realization comparison.; [Brian Conrad](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48. The coherent normalization is separate from integral Picard push–pull.


Proof route:

1. Use complex comparison to identify integral Betti and Tate lattices after the required choices, compatibly with both correspondence legs.
2. An endomorphism acting as zero on the lattice is zero by the imported Hom injection, so all integral image kernels coincide.
3. Compare with the actual ModularForms modular-symbol carrier and its coefficient/diamond conventions, retaining the integral image lattice.


Prerequisites: `ModularCurvesPartII:R14.2/integral-hecke-algebra`; `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`; `ModularCurvesPartII:R14.2/rational-coefficient-pairing`; `ModularCurvesPartII:R14.1/coherent-hecke-trace`; `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `ModularCurvesPartII:R14.1/integral-etale-trace`.


Check:

- For degree p+1 with ℓ∣p+1 the same-leg norm–pull still acts as [p+1] in every realization.
- A rationally isomorphic but index-2 different Hecke lattice is not accepted as this integral comparison.


## Finite bad-level case audit

The geometry is chosen against the actual R20 consumers, with no unrestricted higher-power stable-model formula.

| Required case | Geometry supplied | Consumer and boundary |
|---|---|---|

| Good p∤N ordinary/supersingular Γ₁ level | `igusa-components`, `one-factor-mixed-level-model`, `degeneracy-on-components` | R20 Serre weight inputs via Igusa/Frobenius; prime-to-p auxiliary rigidifier when the level is small. |

| Γ₁(M)∩Γ₀(p), p∤M; M may contain arbitrary ℓ-powers | `one-factor-mixed-level-model`, `modular-dual-graphs`, `modular-character-group-interface`, `degeneracy-on-components` | R20 Mazur principle and trivial-character Γ₀(Mp) level lowering: p≠ℓ, ℓ odd, with their respective residual hypotheses. Includes p=2,3: fine geometry is separated from the recorded coarse wild descent gap. |

| Γ₀(pⁿM), arbitrary n≥1, p∤M | `gamma-zero-prime-power-cusp-rings`, `gamma-zero-prime-power-local-model`, `corrected-coarse-singular-locus`, `tame-regular-resolution` | Gross–Zagier integral intersection model, all N. For p>3 the minimal regular modular algorithm is explicit; p=2,3 wild interior resolution remains a gap. |

| Two added primes p,q, pq∤M | `one-factor-mixed-level-model`, `degeneracy-on-components`, `modular-character-group-interface` | R20 character-group/Jacobian oldspace matrices; the common lower geometry is imported once, while R20 owns the exact sequence and level-lowering theorem. |

| Residual characteristic 2, M odd or 2∥M, p odd and p∤M | `one-factor-mixed-level-model`, `modular-dual-graphs`, `modular-character-group-interface` | Buzzard/R20 mod-2 level lowering. Includes p=3 and hence does not silently omit the coarse wild quotient. |

| Γ₀(p²M), p>3 and split Cartan ℓ=12k+1 | `prime-square-semistable-model`, `split-cartan-semistable-model`, `split-cartan-thirteen-good-reduction` | The explicit ramified nodal extension and BDMTV NC.5 use. No pⁿ,n>2 stable-model formula is inferred from the p² calculation. |


## Supplier contracts and closure

The seven mathematical stages are planned; the process aggregate is closed. The complete pass records 30 supplier contracts and the following three mathematical gaps. A planned stage has all its targets represented; it does not assert that these contracts are already formalized or closed.


**Wild coarse bad-level interior models at 2 and 3.** The required arbitrary-N Γ₀(pⁿM) component/multiplicity target and R20 cases include p=2,3. Edixhoven’s exact interior invariant-ring/minimal-resolution formulas are proved for p>3. Česnavičius gives all-prime coarse cusp regularity and regularity away from exceptional interior j-values, not the missing wild local equations. Required calculation: use imported cyclic deformation rings, compute the actual finite stabilizer action at level-dividing 2 or 3 (including infinitesimal inertia), identify normal invariant completions and their multiplicities, resolve and export branch/thickness maps. A tame order-2/3 eigencharacter argument is insufficient. The fine rigidified one-p-factor uv=p model is separated from this coarse descent gap.


**Relative curve norm and principal polarization contract.** JacobianChallenge D proves the field curve Jacobian. A0-extension supplies relative Picard space, lifting and a neutral-component criterion; it does not by itself supply the curve-specific relative canonical principal polarization/norm theorem over ℤ[1/N]. The request to A0-extension and AbelianSchemes A2 names this exact additional comparison. No fictional relative Jacobian carrier or field-only-to-relative inference is made.


**Polarized proper formal algebraization contract.** The gluing produces a proper formal n-gon with an ample orbit divisor. SF.4 Grothendieck existence on an already algebraic proper scheme alone does not algebraize this formal curve. The SF.4 request is effective algebraization of the polarized proper formal curve and full faithfulness for its maps/group action, in the Noetherian complete setting used by Conrad §2.5.


- `SchemeAndStackFoundations:SF.4`: Algebraization of a proper adic formal curve over a Noetherian complete ring equipped with a relatively ample invertible sheaf; full faithfulness for morphisms and compatible group actions. Cohomological Grothendieck existence on an already algebraic curve alone is insufficient.


- `ModularCurvesPartII:R13.2`: Refined Γ₀(n) compactification of Česnavičius Theorem 5.13, using decontractions and compatibility of cyclic subgroups, as well as honest Γ(n), fixed-pairing and Γ₁(n) stacks. In particular distinguish the regular DM refined stack from the naive Artin Γ₀ stack; their coarse spaces agree, not their stacks.


- `AlgebraicModuliForArithmeticGeometry:R09.6`: Completed-atlas comparisons and stabilizer actions for framed deformation groupoids; compare formal stack charts with coarse invariant completions only with the finite-inertia/quotient hypotheses, including non-tame stabilizers.


- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`: Import the prime N≥5 diamond quotient cusp package over ℤ[1/N]: Tate torsion/level covers, integral closures, cusp labels, widths, characteristic-2/3 ramification and stabilizers; establish identity-compatible agreement rather than rebuilding it.


- `SchemeAndStackFoundations:SF.2`: Coherent restriction, flat base change and dualizing sheaves for proper flat nodal curves; torsion-free sections are determined on a schematically dense locus, including the formal-completion restriction when each component meets the boundary.


- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`: The KM affine coarse quotient of the supplied relatively representable affine level problem, its classifying map, normality and categorical universal property.


- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`: Elliptic quotients by finite locally free subgroup schemes, the universal quotient isogeny and its degree; no new elliptic-curve or quotient carrier is defined here.


- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`: Relative Weil pairing on elliptic torsion, alternating perfection and compatibility with an isogeny, including the multiplier equal to its degree.


- `ModularCurvesPartII:R12.3`: Algebraic/analytic component identification of the already constructed coarse curves, including determinant orbits, cusp fields and honest full-level versus scalar-framed conventions.


- `ModularCurvesPartII:R12.6`: Canonical algebraic/analytic compactification comparison with its cusp parameters, descent maps and weight-two normalization; use R13.4a as its algebraic input, never the aggregate R13.4.


- `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`: The universal ordinary elliptic deformation with Serre–Tate parameter and the supersingular one-dimensional deformation, including Frobenius/Verschiebung torsion and Drinfeld-generator conditions. The exact current ModularCurves Layer 7F–7H and Layer 8C outputs are imported, not re-planned.


- `AbelianSchemesAndArithmeticModuli:A3`: Relative Frobenius and Verschiebung, finite-flat kernels and their duality for elliptic schemes in characteristic p; quotients by finite locally free subgroups are the existing ModularCurves 2B interface.


- `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`: Deformations of elliptic isogenies and their finite-flat kernels on the universal deformation ring; preserve inseparable cases and the chosen source/target local moduli.


- `AlgebraicModuliForArithmeticGeometry:R09.5`: For a regular local ring finite over its invariant subring, a finite residue-trivial group of order invertible in the residue field has regular invariants exactly when its cotangent image is generated by pseudo-reflections. Use this tame quotient criterion only in the stated scope.


- `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`: Existing arithmetic-surface blowups, total transforms, exceptional self-intersection, contractions of admissible −1 curves, regular resolutions and compatibility with flat base change. This part adds only the modular input rings and stabilizer actions.


- `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`: Import the actual cyclic-generator comparison and its supersingular deformation rings; combine with Layer 7F–7H and the existing rigidifier/representability package. The mixed-level node supplies only the modular one-factor component calculation.


- `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`: The existing semistable/stable reduction and stabilization of a proper nodal model with identified generic fibre; genus and marked stability hypotheses remain explicit.


- `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`: Existing dual multigraph of a proper nodal curve with loops, multiple edges, arithmetic genus Σ g_v+b₁ and the branch data; import rather than define a second graph carrier.


- `NeronModelsAndSemistableAbelianVarieties:R11.4`: Comparison of the Néron identity fibre with Pic⁰ of a proper regular semistable curve, the thickness-weighted graph monodromy pairing and its component-group discriminant. Import the general theorem; this part supplies the modular component/branch data.


- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`: Existing double-coset Hecke algebra/action and its full-subgroup multiplication convention; this part realizes those relations on the actual integral modular correspondence.


- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`: Existing abstract Hecke/diamond relations and bad-prime U convention; import, never build another abstract Hecke algebra.


- `EtaleDualityAndPerverseSheaves:EDC.6`: Integral comparison with complex H¹ and compatibility of its trace/cup product with finite curve maps; Tate twist in the Jacobian comparison.


- `SchemeAndStackFoundations:SF.5`: Projection formula for proper pushforward and flat pullback of curve cycles on a product of proper curves; numerical degree of pullback along a finite curve map is its degree times the original degree.


- `AlgebraicModuliForArithmeticGeometry:A0-extension`: For a proper smooth geometrically connected curve over ℤ[1/N], relative Picard representability, smooth/proper neutral component and base change, using the existing A0-extension nodes picard-space-representability, picard-zero-criterion and picard-infinitesimal-lifting. Supply the curve-specific relative norm and canonical principal polarization with pullback/norm duality; JacobianChallenge D alone is only a field theorem.


- `AbelianSchemesAndArithmeticModuli:A2`: Dual abelian schemes, canonical principal polarization of a relative curve Jacobian, and the norm/pullback transpose identity; use the curve-specific relative construction requested in A0-extension.


- `NeronModelsAndSemistableAbelianVarieties:R11.1`: Néron extension of generic Jacobian homomorphisms over a DVR when the modular coarse fibre is singular; do not claim abelian good reduction at level-dividing primes.


- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`: Existing integral Hecke image acting on Betti/modular-symbol lattices, diamond/bad-prime conventions and rational coefficient-field comparison. This part proves agreement with the geometric Jacobian image, rather than planning another Hecke algebra.


- `ArithmeticGaloisRepresentations:R01.6`: The prime-to-residue-characteristic good-reduction/unramified Tate-module criterion for an abelian variety; apply only the implication from the existing good abelian model, not a new isogeny or automorphic theorem.


- `ModularCurvesPartII:R12.5`: Weight-two cotangent identification and rational/cyclotomic q-expansion descent, with the correct coefficient field for Γ₀, Γ₁ and character components. Rational q-expansion determination and a_m(f)=a₁(T_m f) are imported from the earlier classical forms package.


- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`: Existing field-curve Picard/Jacobian scheme theorem with dimension, principal polarization and field-base change. Use it for each geometric fibre; the relative norm/polarization extension is requested separately from A0-extension/A2.


Stage completion conditions:


- `R13.3`: planned. Resolve the polarized proper formal algebraization request and the exact R13.2 refined-stack boundary/decontraction interface.

- `R13.4`: closed. Accepted RS-06 REV-FIX-2026-09-30 and the reviewed audit treat R13.4 as a process aggregate. It owns no mathematical node. R13.4a supplies algebraic coarse construction; R13.4b supplies generic-fibre/map comparison.

- `R13.4a`: planned. Discharge the coarse finite-inertia/completion and refined-stack comparison supplier requests; independently verify the finite-normal comparison on every component.

- `R13.4b`: planned. Reconcile component/cusp-field and map conventions with the R12.3/R12.6 suppliers; verify the integral trace comparison after those contracts are supplied.

- `R13.5`: planned. Complete the explicit wild level-dividing p=2,3 invariant-ring/resolution calculation and small-level coarse descent in the finite R20 case audit. Higher pⁿ>p² needs regular resolution only; no unsupported stable-reduction formula is asserted.

- `R13.6`: planned. Export the graphs, branch/thickness and Hecke maps for the wild small-prime cases when their local equations are supplied; reconcile R20’s character-group matrix conventions.

- `R14.1`: planned. Discharge finite-correspondence descent and integral trace/coefficient comparison requests; verify the corrected projective-level boundary union with its cyclicity filter.

- `R14.2`: planned. Supply relative norm/principal polarization and the exact integral modular-symbol realization comparison; the rational coefficient pairing does not prove integral unimodularity.


## Source corrections and routes

The packet records six source findings in our own words, with versions and searches for corrections. No source passage is reproduced. They require independent review.


**ModularCurvesPartII/E1 (error).** Gross–Zagier (1986), Chapter III Proposition (1.4), p.255. For p>3 also include ordinary mixed (a,b), a,b>0, extra-automorphism points of the elliptic level pair; use Edixhoven’s resolution. At p=2,3 keep the wild calculation separate. At p=5,N=25, the ordinary j=1728 point on (1,1) has effective order-2 cotangent action (−x,−y), hence singular invariants. It is not supersingular. Known: Edixhoven 1990 §1.1.4–1.1.5, pp.35–36, identifies the omission and gives the corrected locus and resolution.


**ModularCurvesPartII/E2 (error).** Bakker–Tsimerman (2016), §2.1, pp.713–714. Use its coarse moduli curve or rigidify the ubiquitous central inversion; do not claim a universal elliptic family descends to the scalar quotient. [−1] acts as scalar −1 on E[p], fixes a projective framing and is a nonidentity automorphism of its unrigidified object. new; the linked metric erratum does not correct this moduli convention.


**ModularCurvesPartII/E3 (error).** Bakker–Tsimerman (2016), §2.5, p.717. Use ψ(m) for the cyclic correspondence; σ₁(m) is the degree of the full order-m subgroup correspondence. The unfiltered divisor boundary union is full-subgroup data, so filter by cyclicity for the cyclic definition. At m=4, subgroup E[2] is noncyclic: seven order-4 subgroups, six cyclic. The three (a,d) families have 4+2+1 branches but only 4+1+1 cyclic branches. new; neither the author metric erratum nor the checked journal/arXiv listing gives a correction to this convention.


**ModularCurvesPartII/E4 (misprint).** Bakker–Tsimerman (2016), §2.5, pp.716–717, two smooth-locus polygon domains. The first has component domain ℤ/(pm) and reduction modulo p; the second has domain ℤ/p and identity component index. The auxiliary first map has degree m² and is used only for its p-torsion identification; it is not the degree-m isogeny. C_r smooth locus is Gₘ×ℤ/r. The first map has smooth-locus kernel μ_m times a component subgroup of order m, while p∤m makes its map on p-torsion an isomorphism. new; the inspected erratum does not address these domains.


**ModularCurvesPartII/E5 (error).** Bakker–Tsimerman (2016), §2.2, p.715. Its raw pointed generalized-elliptic automorphism group is μ_p⋊{±1}, of order 2p in characteristic zero. Order p is the effective stabilizer after central inversion is rigidified; use that effective stack for the (2,3,p) orbifold. The source itself gives the two factors of the p-gon automorphism group; inversion persists on the unframed object. Correspondingly the raw interior orders 4,6 become effective 2,3. new; the inspected metric erratum does not address this stack convention.


**ModularCurvesPartII/E6 (error).** Conrad, author PDF dated 18 July 2006, Theorem 4.3.4 p.38 and the final component clause of Theorem 4.3.6 p.40, sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8. Use φ(d)/2 cyclotomic components indexed by b modulo sign. A unit r modulo N/d selects an embedding of the cyclotomic field. Keep the marked twist exponent −r(b′)⁻¹, and allow arbitrary residue lifts rather than a unique positive divisor. Automorphisms identify r modulo N/d and inversion identifies (r,b) with (−r,−b). N=d=5 consequently has two 5-gon cusps, whereas the printed indexing gives eight; N=d=4 similarly has one rather than six. For N=d=5 the unique residue class modulo 1 has at least the positive-divisor lifts 1 and 5. Known component overcount: Frederick Vu, 2023 UCLA dissertation A map in Sharifi’s conjecture for general non-exceptional characters and tame level, §3.2.2, discussion explicitly pointing out the error in Conrad Theorem 4.3.4 (eScholarship item 4th7g01n, indexed text inspected; PDF pagination unavailable through the access challenge). The related positive-lift uniqueness failure is checked here directly. Journal text was not accessible; this finding asserts the inspected author version only.


Masser–Zannier 2020: §3.1 modular polynomial and cyclic degree are R13.4a; CM congruences are imported by CM.3/CM.5, not planned twice.


Bakker–Tsimerman 2016: Projective scalar coarse quotient, cusp/polygon compatibility, boundary Hecke cycles and numerical degree are covered here; earlier polygon carriers and analytic orbifold/metric inputs remain R12.2–R13.2.


BDMTV 2019: §6.2–6.3 exact split-Cartan nodal quotient and level-13 good reduction; local-height consequences belong to NonAbelianChabauty NC.5.


Gross–Zagier 1986: Arbitrary Γ₀ local targets/corrected locus, exact-divisor involutions, rational a₁-pairing and function field; Kronecker congruence belongs to CM.3/CM.5 and is a comparison input to the p-factor fibre, not a prerequisite for the polynomial construction.


Calegari–Geraghty 2018 and Calegari–Dimitrov–Tang 2025: Their requested group/tree/amalgam results belong to R14.4, outside this part’s scope. No assertion that these papers were read for this job.


## Versions and reading scope

All following public files were accessed and read for the stated target scope on 13 October 2026. Page numbers refer to each recorded version, not to a different edition. The hash fixes the version; the reading list is a locator inventory, not a source summary. Katz–Mazur material outside the maintainer’s cleared Chapter 5 extract was not used.


- [Arithmetic moduli of generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Brian Conrad. Author PDF dated 18 July 2006; published J. Inst. Math. Jussieu 6 (2007), 209–278; locators use the author PDF’s printed pages. Read: §2.5 pp.16–18; §§4.3–4.5 pp.37–48. SHA-256 `f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8`.


- [A modular description of X₀(n)](https://arxiv.org/pdf/1511.07475), Kęstutis Česnavičius. arXiv:1511.07475v2, header 5 October 2017, text dated 6 October 2017; printed pp.1–65. Read: Lemma 4.7.1 p.49; Theorem 5.13 pp.60–61; §6 pp.62–65. SHA-256 `94d0532f68812cd97a2fc119377c2adff529d5a2fa03fbda4fe8c2623ba4d0bd`.


- [Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Bas Edixhoven. Published Ann. Inst. Fourier 40 (1990), 31–67, Numdam scan; first PDF page is a repository cover, so use printed page numbers. Read: §§1.1–1.4 pp.33–48; §2.1–2.4 pp.55–64; §1.6 pp.50–54 inspected for the conormal route, not claimed as an additional target. SHA-256 `cff6a257adcae5ca95a9859ec7a0319a363718bac3a40fe8afe146e59da5926a`.


- [Lectures on Serre’s conjectures, including Conrad’s The Shimura construction in weight 2](https://www.wstein.org/papers/serre/ribet-stein.pdf), Kenneth A. Ribet and William A. Stein; appendix Brian Conrad. Author PDF with internal printed pp.1–94 (printed page = PDF page − 4); published IAS/Park City Math. Ser. 9 (2001), 143–232. Locators here are internal, not publication pagination. Read: §3.9 pp.44–46; §3.10.2 pp.47–48; Chapter 5 §§5.1–5.2 pp.63–73; §5.3 ordinary subgroup closure pp.77–79. SHA-256 `e1bf2b5cd14de064bcb48c4ca843251198db74dd8bcfaad63c26f6773f63f604`.


- [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Benedict H. Gross and Don B. Zagier. Published Invent. Math. 84 (1986), 225–320, MPIM author-hosted scan; locators use journal pages. Read: Chapter I §§1–2 pp.226–227; Chapter III §1 pp.254–255; Chapter V §1 p.306. SHA-256 `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521`.


- [p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Benjamin Bakker and Jacob Tsimerman. Published Ann. Math. 184 (2016), 709–744; journal PDF, printed pages. Read: §§2.1–2.5 pp.713–717; §3 orbifold setup pp.717–718; §6 degree setup p.736. SHA-256 `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.


- [Errata to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), Benjamin Bakker and Jacob Tsimerman. Author-hosted erratum; no date printed on the inspected first pages. Read: pp.1–2, Proposition 14 and Proposition 26 corrections; metric/CM and bicusp estimates are outside these targets. SHA-256 `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.


- [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. Published Ann. Math. 189 (2019), 885–944; journal PDF, printed pages. Read: §6.2–6.3 pp.927–930, Theorems 6.5–6.6, Corollary 6.7, first Baran quartic. SHA-256 `e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8`.


- [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), David Masser and Umberto Zannier. Published Ann. Math. 191 (2020), 635–674; journal PDF, printed pages. Read: §3.1(ii),(v) pp.645–646, the cyclic modular-polynomial input only. SHA-256 `8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60`.
