# Algebraic moduli and representability for arithmetic geometry — R09.4

This layer constructs arithmetic moduli from a single scheme and stack interface. Its two new applications are generalized elliptic curves with a fixed polygon size and polarized abelian schemes with a fixed dimension and degree. The targets distinguish algebraicity, smoothness, the Deligne–Mumford property, separatedness, properness and tameness. Those conditions require different arguments and hold over different bases.

The smooth elliptic carrier, scheme-level group laws, finite quotients and integral Weierstrass presentation come from Tau Ceti’s **ModularCurves** roadmap. Proper nodal curves, cohomology, contractions and semistable reduction come from **StableReduction**. Field abelian varieties are already in Tau Ceti; **JacobianChallenge** supplies the field dual/polarization direction and relative coherent cohomology. This layer extends those plans to the required relative arithmetic moduli. It does not reconstruct their existing targets.

## Ownership and prerequisites

**SchemeAndStackFoundations:SF.1** owns the general theory: stacks in groupoids on the big fppf site of native schemes, stackification, representable diagonals, fibre products, atlases and their independence, algebraic and DM stacks, quotient stacks and finite-inertia tameness. Its existing node IDs are the prerequisites below. The Cat-valued Mathlib descent predicate does not by itself provide groupoid fibres or algebraicity. The ownership proposal adds SF.1 → R09.3 and SF.1 → R09.4; R09.3 retains moduli-object descent, Weil restriction as an algebraic space and comparison with the existing finite quotients.

The accepted **A0-extension** packet retains its R09.4 gerbe targets, including finite-quotient presentations under their stated hypotheses, commuting quotient exchange and commutative étale torsor twists. This document plans the missing arithmetic applications; it does not reprove gerbes or discharge that packet’s gaps. Its five planets remain. The new planet **Polarized abelian moduli** makes six for the unsplit layer.

Two inputs move down from higher tiers under WORKERS.md. The standard polygon, generalized curve, degeneracy and general positive-divisor contraction currently planned by **ModularCurvesPartII:R13.1** have the lower owners below. That Part II retains its DR structure criterion, Drinfeld cyclicity and Γ-specific arithmetic levels and moduli. The minimum relative abelian scheme, dual, polarization, torsion, rigid full level and fine scheme needed for algebraicity also have the lower owners here; **AbelianSchemesAndArithmeticModuli** retains its richer types, Rosati theory, integral arithmetic levels and correspondences. R09.5 consumes the fine-level scheme for coarse comparisons. R09.6 consumes the minimal polarized lifting theorem; smoothness here does not depend on the higher deformation-comparison layer.

### Stable pointed curves: existing Part II supplier

For g,n≥0 with 2g−2+n>0, a stable pointed curve is proper, flat and finitely presented with geometrically connected nodal genus-g fibres, n ordered disjoint smooth sections and ample logarithmic dualizing bundle. Its unique owner is **StableReductionPartII:key/moduli-curves**. The smooth proper DM theorem of relative dimension 3g−3+n is **StableReductionPartII:MC.2/pointed-dm-theorem**; the unpointed finite-unramified diagonal and properness inputs are **MC.1/finite-unramified-diagonal** and **MC.1/proper-moduli**. The pointed diagonal statement must cover the entire stable range, including genus zero and one.

That supplier has an unresolved independent review. Its generic R09.4 stack prerequisites must be replaced by SF.1 before composition, so no arithmetic-moduli cycle is created. Its genus-one base uses the rigid-triangle embedding, independently of the generalized elliptic compactification here. R09.5 must construct a **finite surjective scheme cover carrying the pulled-back universal stable family**, without asserting étaleness at wild primes or a universal family on the coarse space. SF.4’s alteration proof imports this cover and the Part II moduli theorem. The missing cover is an exact supplier request, not a duplicate stable-moduli definition in this layer.

## Conventions and construction order

All schemes and Over objects use the native Mathlib carrier. Fibre groupoids retain automorphisms. A generalized elliptic curve includes its smooth-group action on the proper curve; a pointed semistable curve with no such action is insufficient. A fixed positive integer n specifies every singular fibre’s polygon size, while all smooth elliptic fibres are admitted.

For polarized abelian moduli, g≥0 is constant and d≥1 means **rank ker λ=d²**, equivalently h⁰(L)=d on a fibre when L represents λ. Polarizations are homomorphisms λ:A→A∨; a global representing line bundle is not part of the moduli object. A full invertible level N is an unrestricted ordered basis of A[N], with change-of-basis group GL₂g(Z/NZ). A symplectic condition would define a different problem. The canonical doubled line bundle M satisfies φ_M=2λ; its cubic embedding has polynomial d(6t)^g.

The curve branch proceeds from polygons and generalized actions to fpqc descent, an auxiliary cyclic-subgroup fppf presentation, algebraicity, finite diagonal, properness and the exact inertia tests. The abelian branch proceeds from the native relative object to rigidity, relative duality and polarizations, bounded projective data, a framed Hilbert parameter scheme and fine-level GIT quotient, then DM algebraicity, finite diagonal and prime-to-degree smoothness. The supplier and proof-input ledger at the end marks the exact boundaries of these prerequisite chains.

## R09.4 targets

The following entries give each definition or key theorem once. The node suffixes identify the packet targets; smaller proof steps remain in their sketches. Every construction and definition has its uses, API and adversarial tests.

### 1. Standard Néron polygon

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-standard-ngon` · construction · proposed declaration `R094.standard_ngon`.

For every scheme S and integer n≥1 construct the proper flat finitely presented nodal genus-one S-curve C_n by cyclically identifying ∞ on component i of n copies of P¹_S with 0 on component i+1. For n=1 identify the two sections of one P¹. Its smooth locus is the S-group G_m×(Z/nZ)_S with identity (1,0), and its translation action extends to C_n. All constructions commute with arbitrary base change.

**Hypotheses.** S arbitrary; n is positive.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`, `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`.

**Construction or proof sketch.**

1. Build the node chart Spec(O_S[x,y]/xy) and glue its punctured branches to the standard projective-line charts; for n=1 use the same two branches on one normalization component.
2. Prove properness and flatness from the canonical relative-normalization/gluing construction, with normalization sequence giving genus one.
3. Descend (u,i)·(t,j)=(ut,i+j) from the normalization; compare the smooth-locus point group with native units and ZMod.

**Uses.**

- `FixedEllipticModuli.boundary`: Boundary objects and their automorphism group scheme.
- `ModularCurvesPartII:R13.1`: Shared object input moves down to this owner; its level-specific results consume it.

**API.**

| Name | Contract |
| --- | --- |
| `StandardNgon.baseChange` | C_n×_S T is canonically C_n over T, respecting zero and translation. |
| `StandardNgon.smoothPoints` | On affine test rings R the smooth-point group is Rˣ×Multiplicative(ZMod n), naturally in R. |
| `StandardNgon.normalization` | The canonical relative normalization is the disjoint union of n projective lines with the specified two branches at each node; this is not a claim about absolute normalization over a nonnormal base. |
| `StandardNgon.nodeCharts` | Every node has the standard xy=0 chart; n=1 still has two normalization flags. |

**Unit tests.**

- `StandardNgon.one_component` (degenerate): C_1 is the rational nodal genus-one curve; its smooth locus is G_m, not a smooth elliptic curve. A split cubic model over every base is y²z+xyz=x³, with normalization x=u(u+1), y=u²(u+1); the two branches u=0,−1 are distinct even in characteristic two.
- `StandardNgon.two_components` (computation): C_2 has two components meeting at two distinct nodes and smooth component group Z/2Z.
- `StandardNgon.base_change_nonreduced` (compatibility): The same normalization and xy=0 node charts persist over k[ε]/ε²; the construction does not discard nilpotents.

**Acceptance.**

- The proper polygon, rather than its smooth locus, is the geometric carrier.
- Do not use a set quotient of geometric points to construct the scheme.
- The split one-gon model must remain nodal over F₂; source issue E2 rejects the printed model there.

**Sources.**

- [Kęstutis Česnavičius, Definition 2.1.1, p.6](https://arxiv.org/pdf/1511.07475v2) — The cyclic coequalizer constructs the polygon, including the one-gon and its smooth group.
- [Brian Conrad, §2.1, pp.4–5, equation (2.1.2)](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The glued action and finite cyclic quotient descriptions work over arbitrary bases.

### 2. Generalized elliptic curve

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-generalized-elliptic` · definition · proposed declaration `R094.generalized_elliptic`.

A generalized elliptic curve over S is a proper flat finitely presented curve E→S whose geometric fibres are smooth connected genus-one curves or Néron polygons, a commutative group law with zero on E^sm, and an action E^sm×_S E→E extending that law. On polygon fibres translations act by rotations on the cyclic component graph, equivalently trivially on Pic⁰. Isomorphisms are S-isomorphisms respecting zero, law and action. Pullback uses the native scheme fibre product.

**Hypotheses.** S arbitrary. The action condition is part of the definition, beyond fibrewise shape.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-standard-ngon`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent`.

**Construction or proof sketch.**

1. Bundle the curve, its actual relative smooth open, the group object there, and its extension action.
2. Require the rotation condition, and establish morphism/extensionality and coherent pullback from the action and universal schematic density.
3. Identify the smooth restriction with the existing ModularCurves elliptic family, preserving the group law.

**Uses.**

- `FixedEllipticModuli`: Use zero-preserving isomorphisms and full family data in the fibre groupoid.
- `ModularCurvesPartII:R13.1–R13.2`: Add the arithmetic Drinfeld-level data to this same carrier.

**API.**

| Name | Contract |
| --- | --- |
| `GeneralizedEllipticCurve.smoothLocus` | Expose the native smooth open and its commutative group object. |
| `GeneralizedEllipticCurve.pullback` | Arbitrary scheme base change preserves all data, with identity/composition coherence. |
| `GeneralizedEllipticCurve.smoothEquivalence` | The full smooth subcategory is equivalent to ModularCurves Layer 1 elliptic families and their zero-preserving isomorphisms. |
| `GeneralizedEllipticCurve.iso_ext` | Isomorphisms equal on the universally schematically dense smooth locus are equal on E. |
| `GeneralizedEllipticCurve.ofStandardNgon` | The standard polygon carries the law and action above. |

**Unit tests.**

- `GeneralizedEllipticCurve.smooth_agreement` (compatibility): A smooth elliptic family with its existing law gives exactly the same generalized object.
- `GeneralizedEllipticCurve.nodal_onegon` (degenerate): The standard one-gon is admitted, including its inversion.
- `GeneralizedEllipticCurve.twisted_two_gon_excluded` (non-example): Over A=k[ε,ε′]/(ε,ε′)², the two-gon with node parameters ε and ε′ has no such group/action structure, even fpqc locally (Conrad Example 2.1.11 and Remark 2.1.13).

**Acceptance.**

- Bare pointed semistable genus-one families are not silently given an action.

**Sources.**

- [Kęstutis Česnavičius, Definition 2.1.3, p.6](https://arxiv.org/pdf/1511.07475v2) — The family condition includes the Pic⁰ action constraint.
- [Brian Conrad, Definition 2.1.4 and Remark 2.1.13, pp.5–7](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The action extends the smooth group law; some twisted polygon families do not admit it.

### 3. Schematic degeneracy locus

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-degeneracy` · construction · proposed declaration `R094.degeneracy`.

For a generalized elliptic curve f:E→S, let E^sing be cut out by Fitt_1(Ω¹_{E/S}), and S^∞ its schematic image in S. This closed subscheme decomposes locally finitely into open-and-closed pieces S^∞_n with n-gon fibres; E is fppf locally the standard n-gon over each piece. E^sing and S^∞, including the component-count pieces, commute with arbitrary base change.

**Hypotheses.** f is generalized elliptic, not just a DR semistable genus-one curve.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-generalized-elliptic`, `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`.

**Construction or proof sketch.**

1. Apply the native differential/Fitting-ideal scheme construction; keep the scheme structure of the image.
2. Use the polygon trivialization over the image to compare after arbitrary pullback.
3. Compute the node ideals and descend the locally constant component count.

**Uses.**

- `FixedEllipticModuli.cusp`: Defines the closed boundary substack with its scheme structure.
- `ModularCurvesPartII:R13.1`: Supplies its shared schematic degeneration input.

**API.**

| Name | Contract |
| --- | --- |
| `GeneralizedEllipticCurve.singularSubscheme` | The relative Fitting ideal cuts out the nonsmooth locus. |
| `GeneralizedEllipticCurve.degeneracyBaseChange` | S^∞(E_T)=S^∞(E)×_S T as closed subschemes. |
| `GeneralizedEllipticCurve.polygonTrivialization` | Over S^∞_n the generalized curve is fppf locally C_n. |

**Unit tests.**

- `GeneralizedEllipticCurve.polygon_degeneracy` (computation): For C_n/S the degeneracy subscheme is all of S.
- `GeneralizedEllipticCurve.smooth_degeneracy` (degenerate): For a smooth elliptic family the degeneracy subscheme is empty.
- `GeneralizedEllipticCurve.bare_curve_image_failure` (non-example): The twisted two-gon over A above has S^∞=Spec A, but pullback along ε=ε′ has degeneracy Spec k inside Spec(k[ε]/ε²); hence the base-change theorem cannot be generalized to bare curves.

**Acceptance.**

- The nilpotent structure of S^∞ is retained.

**Sources.**

- [Brian Conrad, Definition 2.1.8, Lemma 2.1.10, Theorem 2.1.12, pp.6–7](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The image and fppf polygon trivializations give base-change compatibility; the bare-curve counterexample explains the hypothesis.

### 4. Automorphisms of a Néron polygon

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polygon-automorphisms` · theorem · proposed declaration `R094.polygon_automorphisms`.

Aut_S(C_n) as a generalized elliptic curve is the group scheme µ_n×(Z/2Z)_S. A root ζ scales the coordinate on component i by ζ^i; the second factor acts by (t,i)↦(t⁻¹,−i). These actions commute. The formula is natural on all test schemes, including nonreduced ones; it is not merely a formula for algebraically closed points.

**Hypotheses.** n≥1; automorphisms preserve the identity and generalized group/action structure.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-standard-ngon`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-generalized-elliptic`, `mathlib:rootsOfUnity`.

**Construction or proof sketch.**

1. Extend the smooth-group coordinate formulas across the node charts.
2. A law-preserving automorphism either preserves or reverses the cycle; fixing zero forces its component scalings to be powers of one ζ with ζ^n=1.
3. Compute inversion conjugation directly: both the component index and the coordinate are inverted, so ζ is unchanged.

**Acceptance.**

- At n=1 the group is constant C₂.
- In characteristic p dividing n, µ_n is nonreduced and cannot be replaced by its geometric points.
- The prototype checks the smooth-group formulas and an infinitesimal µ₃ point; extension to the proper curve is explicitly unstated under G-native.

**Sources.**

- [Kęstutis Česnavičius, Lemma 2.1.6, p.7](https://arxiv.org/pdf/1511.07475v2) — The group scheme is the direct product, with inversion central.
- [Brian Conrad, Example 2.1.5, p.5](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The coordinate scaling formula is the same; its semidirect notation must be read with trivial conjugation.

### 5. Contraction of polygon components

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-contraction` · construction · proposed declaration `R094.contraction`.

For a proper flat finitely presented semistable genus-one curve E/S and a relative effective Cartier divisor D⊂E^sm finite locally free of positive rank, construct c_D(E) by contracting precisely fibre components disjoint from D, uniquely as the relative projective contraction and compatibly with arbitrary base change. Its smooth locus is the image of the open subgroup of E^sm consisting of retained components when E is generalized elliptic and D=G is a finite locally free subgroup. In that subgroup case the contraction inherits a unique generalized law and action, G becomes ample, and the map restricts to an isomorphism from the retained-component open in E^sm onto c_G(E)^sm.

**Hypotheses.** The general divisor construction yields a curve, not an asserted group object. The subgroup case uses a generalized elliptic input and a finite locally free subgroup. The contraction is not the scheme quotient E/G.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-generalized-elliptic`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-degeneracy`, `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Construction or proof sketch.**

1. Reduce by finite-presentation limits to a noetherian base. For every m>0, curve duality and fibre cohomology make f_*O(mD) locally free and compatible with arbitrary base change.
2. The graded algebra ⊕_{m≥0}f_*O(mD) is finitely generated with a uniform degree bound checked on smooth genus-one fibres and polygon fibres. Its relative Proj gives the proper flat contraction; fibrewise sections identify exactly the retained components.
3. Any candidate contraction has the same pullback divisor and graded section algebra, giving uniqueness. The base-change theorem for every graded piece identifies the relative Proj after arbitrary pullback.
4. For a subgroup divisor, its retained-component smooth open is a subgroup. Uniqueness transports translations to the contraction and proves the group and action identities; the finite subgroup becomes ample.

**Uses.**

- `FixedEllipticModuli.proper`: After ramification, choose a subgroup meeting exactly n components.
- `ModularCurvesPartII:R13.1–R13.2`: Shared contraction object; level-specific contractions consume it.

**API.**

| Name | Contract |
| --- | --- |
| `GenusOneCurve.contractDivisor` | Construct the relative projective contraction for a positive finite locally free smooth Cartier divisor; with a subgroup divisor it agrees with GeneralizedEllipticCurve.contract. |
| `GeneralizedEllipticCurve.contract` | Construct c_G(E) with its map and smooth law. |
| `GeneralizedEllipticCurve.contract_baseChange` | Pullback identifies the contracted curves and maps. |
| `GeneralizedEllipticCurve.contract_componentCriterion` | Exactly the components missing G are contracted. |
| `GeneralizedEllipticCurve.contract_unique` | The target and map are unique up to the specified commuting isomorphism. |

**Unit tests.**

- `GeneralizedEllipticCurve.contract_smooth` (compatibility): On a smooth elliptic curve contraction is the identity.
- `GeneralizedEllipticCurve.contract_to_one` (degenerate): On C_n the zero subgroup meets only the identity component and contracts to C_1.
- `GeneralizedEllipticCurve.contract_all_components` (computation): The subgroup {1}×Z/nZ meets every component and the contraction of C_n is the identity.
- `GenusOneCurve.divisor_without_law` (non-example): A divisor meeting selected components of a bare semistable genus-one curve produces its curve contraction, but supplies neither a zero nor a group action; the output is not automatically generalized elliptic.

**Acceptance.**

- c_G(E)=E for a smooth elliptic family.
- Contracting to a specified component count requires an appropriate subgroup; it is not an arbitrary map of polygons.

**Sources.**

- [Kęstutis Česnavičius, §3.2.1, pp.19–20](https://arxiv.org/pdf/1511.07475v2) — Contraction retains exactly the components met by G and is base-change compatible.
- [Brian Conrad, §2.1, equation (2.1.4) and the following discussion, pp.7–8](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The divisor contraction acquires its generalized structure when the divisor is a subgroup.
- [Kęstutis Česnavičius, §3.2.1, p.19; published version p.2025](https://arxiv.org/pdf/1511.07475v2) — The group isomorphism must be read on the retained-component open inside E^sm, as corrected in E4.
- [Pierre Deligne, Michael Rapoport, IV.1.1–IV.1.3, pp.DeRa63–65 (PDF indices 62–64)](https://publications.ias.edu/sites/default/files/Number22.pdf) — The proof reduces to noetherian bases, constructs the graded section algebra with compatible base change, proves uniqueness and transports the subgroup action.

### 6. Fixed-polygon elliptic moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-moduli` · construction · proposed declaration `R094.fixed_elliptic_moduli`.

For n≥1, form the groupoid-valued contravariant moduli pseudofunctor E_n on schemes over Z: objects are generalized elliptic curves whose singular geometric fibres are n-gons; arrows are the isomorphisms above. Keep all smooth elliptic fibres, including supersingular ones. The closed cusp E_n^∞ is defined by the schematic degeneracy locus. The open E_n^{n-ord} removes only smooth supersingular points in characteristics dividing n.

**Hypotheses.** n≥1 is fixed, not allowed to jump among different polygon sizes.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-generalized-elliptic`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-degeneracy`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`.

**Construction or proof sketch.**

1. Define pullback on curves, smooth groups and actions and use the scheme pullback coherence maps.
2. Use the component-count decomposition of the degeneracy base to identify the fixed-n subfunctor.
3. Define the supersingular exclusions on the smooth substack using the existing elliptic p-torsion criterion.

**Uses.**

- `FixedEllipticModuli.algebraic`: This is the stack carrier to which the presentation theorem applies.
- `AlgebraicModuliForArithmeticGeometry:R09.5`: Boundary coarse and level constructions consume this fixed-count stack.

**API.**

| Name | Contract |
| --- | --- |
| `FixedEllipticModuli.fibre` | Objects and zero-preserving isomorphisms over S form the specified groupoid. |
| `FixedEllipticModuli.pullback` | Pullback gives coherent contravariant transition functors. |
| `FixedEllipticModuli.smoothOpen` | Its smooth open is the existing elliptic moduli groupoid. |
| `FixedEllipticModuli.boundary` | The cusp is the closed subfunctor whose pulled-back degeneracy closed subscheme is all of S. |
| `FixedEllipticModuli.ordinaryOpen` | Only the indicated supersingular smooth geometric points are removed. |

**Unit tests.**

- `FixedEllipticModuli.smooth_inertia` (non-example): Inversion of a smooth elliptic curve is a nonidentity arrow, including characteristic two; its fibre is not a discrete set.
- `FixedEllipticModuli.standard_polygon` (computation): C_n lies in E_n^∞ with automorphism group scheme µ_n×C₂.
- `FixedEllipticModuli.wrong_polygon` (non-example): For m≠n, C_m is excluded although every smooth elliptic curve is included.

**Acceptance.**

- Do not replace fibre groupoids by isomorphism classes.

**Sources.**

- [Kęstutis Česnavičius, §3.1, pp.15–16; Proposition 3.1.5, p.17](https://arxiv.org/pdf/1511.07475v2) — The fixed-polygon stack and the n-ordinary open have different object sets.

### 7. Effective descent for generalized elliptic families

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-descent` · theorem · proposed declaration `R094.elliptic_descent`.

E_n is an fpqc stack in groupoids. Effective descent includes the proper curve, the smooth group law, its extension action and the fixed component-count condition, not only descent of an underlying sheaf of isomorphism classes.

**Hypotheses.** n≥1; arbitrary scheme bases and fpqc covers.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-moduli`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `tauceti:TauCetiRoadmap/ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent`.

**Construction or proof sketch.**

1. E^sm[n] is finite locally free and meets every component; as a relative Cartier divisor it supplies an ample line bundle.
2. Use sufficiently high powers to descend the projective curve and its coherent algebra from fpqc linear descent.
3. Descend the smooth open, law and action as morphisms, and check the geometric fibre conditions after the cover.

**Acceptance.**

- A descended scheme rather than an unidentified algebraic space is required.
- The native Pseudofunctor.IsStack is a useful predicate only after the groupoid-valued carrier is supplied.

**Sources.**

- [Kęstutis Česnavičius, §3.1, p.15](https://arxiv.org/pdf/1511.07475v2) — The ample n-torsion divisor proves effectivity over arbitrary bases.

### 8. Integral one-gon Weierstrass presentation

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass` · theorem · proposed declaration `R094.onegon_weierstrass`.

Let U⊂Spec Z[a₁,a₂,a₃,a₄,a₆] be the open where the ideal (Δ,c₄) is the unit ideal, so every geometric cubic fibre is smooth or nodal. Let G be the smooth integral Weierstrass coordinate-change group with parameters u∈G_m and r,s,t∈G_a. Its universal noncuspidal cubic, with zero at infinity and the generalized action, identifies E_1≃[U/G]. The presentation U→E_1 is smooth and surjective; E_1 is algebraic, DM and smooth over Z of relative dimension one.

**Hypotheses.** Only the irreducible smooth-or-one-gon fibres occur. The characteristic-two nodal model uses y²z+xyz=x³, not the erroneous printed cubic of E2.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-descent`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polygon-automorphisms`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `tauceti:TauCetiRoadmap/ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`.

**Construction or proof sketch.**

1. On a one-gon family the smooth zero is a relative Cartier divisor, and O(3·0) is relatively ample; relative curve cohomology gives the rank-three cubic model locally on the base. Extend the existing smooth elliptic coordinate argument to the nodal fibre, keeping the same coordinate-change group.
2. The smooth locus of an irreducible pointed genus-one family identifies with Pic⁰; its Picard action extends to the entire curve and yields the unique generalized structure, as in DR II.2.3–II.2.6. Thus cubic models and generalized E_1 objects give equivalent groupoids, not only the same fibre shapes.
3. The noncuspidal condition is the open D(Δ)∪D(c₄), including all residue characteristics. The coordinate group is smooth of relative dimension four and U of dimension five. Apply the quotient-stack criterion for algebraicity and smoothness.
4. Smooth elliptic stabilizers are finite unramified by the existing rigidity argument and one-gon stabilizers are constant C₂ by arith-polygon-automorphisms. Apply the unramified-diagonal criterion to obtain DM. This base theorem precedes the auxiliary B_n argument and avoids a hidden E_1/B_1 circular proof.

**Acceptance.**

- At Δ=0,c₄≠0 the fibre is nodal and belongs to E_1; the cuspidal Δ=c₄=0 locus is excluded.
- The fixed-n algebraicity proof consumes this theorem before B_n; this theorem never assumes that proof.
- Inversion gives constant C₂ at the one-gon even in characteristic two; finite étale does not imply tame there.

**Sources.**

- [Kęstutis Česnavičius, Proof of Proposition 3.1.5, pp.17–18](https://arxiv.org/pdf/1511.07475v2) — The B₁=E_1 base is used before the general auxiliary equivalence.
- [Pierre Deligne, Michael Rapoport, II.2.3–II.2.6, pp.DeRa44–46 (PDF indices 43–45); III.2.5–III.2.6, pp.DeRa61–62 (PDF indices 60–61)](https://publications.ias.edu/sites/default/files/Number22.pdf) — The Pic⁰ action supplies the generalized law and the irreducible component of the algebraic smooth stack supplies the E_1 base.
- [Tau Ceti roadmap and Atlas contributors, ModularCurves Layers 1C, 1E and 4B; StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap) — Extend the existing smooth cubic/cohomology argument to the nodal open; do not redeclare the smooth presentation.

### 9. Auxiliary cyclic-subgroup moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-moduli` · construction · proposed declaration `R094.cyclic_atlas_moduli`.

For n≥1 let B_n(S) classify E∈E_n(S) and an ample finite étale subgroup G⊂E^sm that is étale locally isomorphic to (Z/nZ)_S. Ampleness means that every geometric fibre component meets G. Isomorphisms preserve G without choosing a generator.

**Hypotheses.** No invertibility assumption on n. Subgroup étaleness is required even in residue characteristic dividing n.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-moduli`, `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`.

**Construction or proof sketch.**

1. Parameterize a generator by a section of E^sm[n] giving a closed immersion of the constant cyclic group.
2. Express immersion and ampleness as open conditions and divide the free generator-changing action of (Z/nZ)ˣ.
3. Define the forgetful map to E_n; over a supersingular elliptic curve in characteristic dividing n its fibre is empty.

**Uses.**

- `FixedEllipticModuli.algebraic`: Provides a finite-flat-type presentation, with its actual range stated.
- `FixedEllipticModuli.dmLocus`: Its existence does not force the target stack to be DM.

**API.**

| Name | Contract |
| --- | --- |
| `CyclicAtlasModuli.forget` | Forget G to obtain E_n. |
| `CyclicAtlasModuli.pullback` | Pullback preserves the subgroup and ampleness. |
| `CyclicAtlasModuli.generatorQuotient` | The subgroup space is the free (Z/nZ)ˣ quotient of its generator space. |
| `CyclicAtlasModuli.oneEquivalence` | B_1≃E_1, since the unique subgroup is the zero section and every allowed singular fibre is a one-gon. |

**Unit tests.**

- `CyclicAtlasModuli.one` (degenerate): B_1≃E_1 with the same automorphisms.
- `CyclicAtlasModuli.polygon` (computation): On C_n, G={1}×Z/nZ is an ample finite étale cyclic subgroup over every base.
- `CyclicAtlasModuli.supersingular_missing` (non-example): A supersingular elliptic curve over an algebraically closed field of characteristic p|n has no such subgroup of order n.

**Acceptance.**

- This is an étale subgroup, not a Drinfeld cyclic subgroup scheme.

**Sources.**

- [Kęstutis Česnavičius, §3.1, pp.16–17; Proposition 3.1.5](https://arxiv.org/pdf/1511.07475v2) — This auxiliary subgroup space supplies the n-ordinary fppf presentation.

### 10. Deligne–Mumford cyclic atlas

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-dm` · theorem · proposed declaration `R094.cyclic_atlas_dm`.

B_n is a Deligne–Mumford stack smooth over Z of relative dimension one.

**Hypotheses.** n≥1; the subgroup has exactly the properties in the preceding definition.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-descent`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-contraction`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass`.

**Construction or proof sketch.**

1. Use the Deligne–Rapoport V.1.4 equivalence with irreducible generalized elliptic curves equipped with a subgroup étale locally µ_n: quotient by G and dual kernel give the forward map.
2. The ample étale cyclic G acts freely on the polygon components and smooth locus; apply the existing finite scheme quotient to E/G, descend its law/action, and identify the dual multiplicative kernel. This is a quotient, distinct from the component contraction.
3. The inverse is the unique pointed cyclic finite étale cover extending the corresponding smooth isogeny; G-cyclic-cover records this extension input.
4. Over the one-gon moduli, the multiplicative-subgroup functor is representable étale by the Hilbert functor and formal rigidity of multiplicative subgroups.
5. Combine this with the explicit Weierstrass presentation for E_1 to obtain smoothness and an étale atlas.

**Acceptance.**

- B_n is DM even where E_n is not.
- The pointed-cover construction must preserve the generalized action on the boundary.

**Sources.**

- [Pierre Deligne, Michael Rapoport, V.1.1–V.1.5, pp.DeRa92–94 (PDF indices 91–93)](https://publications.ias.edu/sites/default/files/Number22.pdf) — The auxiliary equivalence and étaleness establish this conclusion.
- [Kęstutis Česnavičius, Proposition 3.1.5, p.17](https://arxiv.org/pdf/1511.07475v2) — Restates the DM and smoothness conclusion without inverting n.

### 11. Range and flatness of the cyclic presentation

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-cover` · theorem · proposed declaration `R094.cyclic_atlas_cover`.

B_n→E_n factors through E_n^{n-ord} and there is representable, separated, quasi-finite, faithfully flat and locally finitely presented. Together with the smooth open M_ell⊂E_n these maps cover E_n. The B_n map is not asserted étale, and for p|n is not surjective onto supersingular smooth elliptic curves.

**Hypotheses.** n≥1.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-dm`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-moduli`.

**Construction or proof sketch.**

1. For a fixed E, construct its subgroup scheme from the open generator locus inside E^sm[n] and the free generator quotient.
2. Prove flatness and finite presentation on the ordinary smooth locus and on polygon charts; ampleness is open.
3. Existence on ordinary smooth fibres and on every n-gon gives exactly the claimed range. Add the smooth elliptic open for the excluded points.

**Acceptance.**

- Do not call the composite from a smooth atlas of B_n an étale or smooth atlas of E_n.

**Sources.**

- [Kęstutis Česnavičius, Proposition 3.1.5 and proof, pp.17–18](https://arxiv.org/pdf/1511.07475v2) — States the representability, range and fppf properties needed for this cover.

### 12. Algebraicity and smoothness of fixed-polygon moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-algebraic` · theorem · proposed declaration `R094.fixed_elliptic_algebraic`.

For each n≥1, E_n is an algebraic stack smooth over Spec Z of relative dimension one.

**Hypotheses.** Use the fpqc groupoid carrier above; no assumption n is invertible.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-descent`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-cover`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-cyclic-atlas-dm`, `SchemeAndStackFoundations:SF.1/algebraic-stack`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-onegon-weierstrass`.

**Construction or proof sketch.**

1. Import the preceding integral one-gon Weierstrass theorem as the base algebraic smooth stack; this theorem does not depend on B_n or on the fixed-n conclusion.
2. Use the representable fppf cover from B_n and the smooth elliptic open with the fppf-presentation criterion, then construct a genuine smooth atlas.
3. Descend smoothness and relative dimension along the faithfully flat locally finitely presented presentation; SF.1 must supply these precise criteria.

**Acceptance.**

- A non-smooth µ_n stabilizer does not contradict smoothness of the stack.

**Sources.**

- [Kęstutis Česnavičius, Theorem 3.1.6(a) and proof, pp.18–19](https://arxiv.org/pdf/1511.07475v2) — The fixed-count stack is smooth and algebraic even with non-smooth inertia.
- [The Stacks Project Authors, Tag 06DC, Theorem 97.16.1](https://stacks.math.columbia.edu) — An fppf presentation by an algebraic source proves algebraicity; it does not identify that presentation as a smooth atlas.

### 13. Finite generalized-elliptic isomorphism schemes

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-finite-diagonal` · theorem · proposed declaration `R094.elliptic_finite_diagonal`.

For E,E′∈E_n(S), the scheme Isom_S(E,E′) of generalized-elliptic isomorphisms is finite over S, compatibly with arbitrary base change. Thus E_n has finite diagonal and is separated over Z.

**Hypotheses.** The two curves have the same geometric polygon count at common singular points.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polygon-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-algebraic`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Construction or proof sketch.**

1. Use the Hilbert/Hom–Isom owner for representability, with an ample torsion divisor restricting projective data; preserve law and action as closed conditions.
2. Quasi-finiteness follows from finite smooth elliptic automorphisms and the polygon automorphism group scheme, including its nonreduced part.
3. Prove properness by extending an isomorphism over a trait using minimal regular models, their blowups and contraction with matching component counts (G-trait-isom records the remaining extension lemma).
4. Pass to arbitrary bases by finite-presentation approximation and descent.

**Acceptance.**

- A finite diagonal is not automatically unramified.

**Sources.**

- [Brian Conrad, Theorem 3.2.4 and proof, pp.25–26](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) — The matched-count hypothesis gives finite relative Isom.
- [Kęstutis Česnavičius, Proposition 3.1.8, p.19](https://arxiv.org/pdf/1511.07475v2) — Compatible degeneracy counts give finite representability over arbitrary schemes.

### 14. Properness of fixed-polygon moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-proper` · theorem · proposed declaration `R094.elliptic_proper`.

E_n→Spec Z is proper for every n≥1, in addition to its finite diagonal and relative smoothness.

**Hypotheses.** Properness is a stack property, not properness of every presenting scheme.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-finite-diagonal`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-algebraic`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-contraction`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`.

**Construction or proof sketch.**

1. For an elliptic curve over a trait fraction field, use semistable reduction after a finite field extension.
2. Ramify further until the special polygon count is divisible by n, choose a finite locally free subgroup meeting n components, and contract to an n-gon; supply the component-count/ramification input in G-trait-model.
3. The finite diagonal supplies the separatedness part of the stack valuative criterion. Quasi-compactness follows from the smooth moduli plus the single standard-polygon boundary class; local finite presentation follows from smoothness.
4. Apply the existence-after-extension valuative criterion for proper algebraic stacks requested from SF.1.

**Acceptance.**

- The open smooth elliptic moduli is not proper; retaining the one-gon or n-gon boundary is essential.

**Sources.**

- [Kęstutis Česnavičius, Theorem 3.1.6(a) and proof, pp.18–19](https://arxiv.org/pdf/1511.07475v2) — Semistable reduction and prescribed polygon contraction prove properness.

### 15. Exact Deligne–Mumford locus

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-dm-locus` · theorem · proposed declaration `R094.elliptic_dm_locus`.

The maximal Deligne–Mumford open of E_n is the complement of the cusp fibres over Spec(Z/nZ). In particular E_1 is DM over Z, and E_n is DM over Z[1/n]. Smooth supersingular fibres remain DM, even when p|n.

**Hypotheses.** n≥1.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-finite-diagonal`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polygon-automorphisms`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`, `SchemeAndStackFoundations:SF.1/inertia`.

**Construction or proof sketch.**

1. Smooth elliptic automorphism schemes are unramified by the existing smooth elliptic rigidity argument.
2. At the n-gon the diagonal fibre is µ_n×C₂ and is unramified exactly where n is invertible.
3. Use the unramified-diagonal characterization and openness of the DM locus; do not confuse this locus with E_n^{n-ord}.

**Acceptance.**

- For n=3 in characteristic three a cusp is not DM, while a smooth supersingular object is.

**Sources.**

- [Kęstutis Česnavičius, Theorem 3.1.6(a), p.18](https://arxiv.org/pdf/1511.07475v2) — Specifies the exact largest DM open.

### 16. Cusp gerbe and Cartier boundary

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-cusp` · theorem · proposed declaration `R094.elliptic_cusp`.

E_n^∞ is canonically equivalent to B(µ_n×C₂), is reduced and smooth over Z of relative dimension zero, and is a relative effective Cartier divisor in E_n. Spec Z→E_n^∞ supplied by C_n is finite locally free of rank 2n.

**Hypotheses.** n≥1; reduced means the stack is reduced, not that every stabilizer group scheme is reduced.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-degeneracy`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polygon-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fixed-elliptic-algebraic`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`.

**Construction or proof sketch.**

1. Every boundary object is an fppf form of C_n. Use the torsor/automorphism equivalence to identify the entire boundary groupoid, not only its points.
2. Compute the trivial-torsor atlas and its degree from µ_n×C₂.
3. Use the Weierstrass nodal smoothing parameter and the auxiliary presentation to prove the relative Cartier assertion and reducedness.
4. Prove smoothness as a stack by the smooth quotient presentation criterion, not by claiming µ_n smooth.

**Acceptance.**

- Bµ_p can be a smooth algebraic stack in characteristic p without being DM.
- This special cusp identification consumes generic gerbe/torsor theory; it does not redeclare the inherited gerbe machinery.

**Sources.**

- [Kęstutis Česnavičius, Theorem 3.1.6(b)–(c), pp.18–19](https://arxiv.org/pdf/1511.07475v2) — States the boundary gerbe, its relative Cartier structure and its smoothness.

### 17. Tameness and wild elliptic inertia

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-tame` · theorem · proposed declaration `R094.elliptic_tame`.

The cusp E_n^∞ is tame exactly over Z[1/2], with no need to invert n. E_n over Z[1/6] is tame. In characteristic two its generic smooth stabilizer contains constant C₂ and is not linearly reductive, although the smooth moduli remains DM. Thus tameness, DM and properness are separate properties.

**Hypotheses.** Tameness means exact invariants for finite geometric stabilizers, using the finite-inertia criterion.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-cusp`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-finite-diagonal`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-dm-locus`, `SchemeAndStackFoundations:SF.1/tame-stack`, `SchemeAndStackFoundations:SF.1/tame-local-structure`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`.

**Construction or proof sketch.**

1. Diagonalizable µ_n is linearly reductive in every characteristic; constant C₂ is linearly reductive exactly away from characteristic two.
2. For smooth elliptic fibres in characteristic greater than three, the possible automorphism groups have orders 2, 4 or 6, invertible in that characteristic.
3. Apply the AOV finite-inertia stabilizer criterion; in characteristic two the constant inversion subgroup gives the counterexample.

**Acceptance.**

- For n=3 over F₃ the cusp is tame but not DM.
- No claim that all of E_n is tame over Z[1/2] is needed.

**Sources.**

- [Dan Abramovich, Martin Olsson, Angelo Vistoli, Definition 2.6 and Proposition 2.7, pp.1067–1068; Theorem 3.2, p.1077](https://www.numdam.org/article/AIF_2008__58_4_1057_0.pdf) — Diagonalizable factors and the finite-inertia criterion distinguish tame from DM.
- [Kęstutis Česnavičius, Lemma 2.1.6, p.7](https://arxiv.org/pdf/1511.07475v2) — Supplies the precise cusp stabilizer.

### 18. Relative abelian scheme

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme` · definition · proposed declaration `AbelianScheme`.

An abelian scheme over S is a group object A in the native category Over S whose structure morphism is smooth and proper with geometrically connected fibres. Commutativity is a theorem, not a redundant axiom. Relative dimension is locally constant; fixing g requires every geometric fibre to have dimension g. Over a field this category is equivalent to TauCeti.AlgebraicGeometry.AbelianVariety, respecting the underlying group object.

**Hypotheses.** S an arbitrary native scheme; g≥0 when a dimension is fixed.

**Prerequisites.** `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.GeometricallyConnected`, `mathlib:CategoryTheory.GrpObj`, `mathlib:CategoryTheory.Functor.grpObjObj`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

**Construction or proof sketch.**

1. Bundle only the native Over object, group law and established geometric predicates.
2. Transport the group object by Over.pullback and use the native stability instances for all three geometric predicates.
3. Use rigidity for commutativity. Smooth geometrically connected group fibres are geometrically integral, supplying the existing field adapter rather than a second field definition.

**Uses.**

- `PolarizedAbelianModuli`: The carrier for fixed dimension and degree.
- `AbelianSchemesAndArithmeticModuli:A.1–A.2`: The needed relative carrier moves down here; field abelian varieties stay with Tau Ceti and JacobianChallenge.

**API.**

| Name | Contract |
| --- | --- |
| `AbelianScheme.toScheme` | Expose the underlying native scheme from the Over carrier. |
| `AbelianScheme.zeroSection` | Expose its group-object unit S→A. |
| `AbelianScheme.zeroSection_comp` | The zero section composed with the structure map is the identity on S. |
| `AbelianScheme.baseChange` | Pullback gives an abelian scheme, with its native group object. |
| `AbelianScheme.baseChange_toOver` | Its Over object is exactly the native Over.pullback object. |
| `AbelianScheme.commutative` | Every such group object is commutative. |
| `AbelianScheme.ofAbelianVariety` | The existing field abelian variety gives a relative object over Spec K. |
| `AbelianScheme.toAbelianVariety` | The field restriction gives the existing geometrically integral abelian variety. |
| `AbelianScheme.field_roundtrip` | The field adapter followed by its inverse recovers the original native abelian variety. |
| `AbelianScheme.zeroDimensional` | The identity S→S with its trivial group law is an abelian scheme. |
| `AbelianScheme.zeroPreserving_isMonHom` | An Over morphism between abelian schemes preserving their zero sections is a native IsMonHom morphism; no second bundled homomorphism carrier is required. |
| `AbelianScheme.relativeDimension` | The dimension of the geometric fibre defines a locally constant function on S; fixing g means this function is everywhere g. Pullback composes this function with the map on base points. |
| `AbelianScheme.fieldEquivalence` | Over Spec K, the two native object adapters extend to an equivalence of zero-preserving isomorphism groupoids with Tau Ceti abelian varieties, compatible with extension of fields and the native underlying Over objects. |

**Unit tests.**

- `AbelianScheme.zero_dimension` (degenerate): The identity Spec K→Spec K is the dimension-zero object.
- `AbelianScheme.field_agreement` (compatibility): The field adapter recovers the native Tau Ceti variety including its law.
- `AbelianScheme.nonproper_excluded` (non-example): If G∈Over S is not proper, no abelian scheme has Over object G; in particular G_m over a field is excluded.

**Acceptance.**

- The zero-dimensional object is allowed.
- A torus is not admitted merely because it is a smooth connected commutative group.

**Sources.**

- [Jesse Kass, Definition 1 and Theorem 1, pp.1–3](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — The relative definition, rigidity and automatic commutativity are stated over scheme bases.
- [Martin Olsson, Definition 2.1.1, p.297](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The proper smooth connected-fibre group is the unpolarized relative carrier.

### 19. Relative abelian rigidity and torsion

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity` · theorem · proposed declaration `R094.relative_abelian_rigidity`.

A zero-preserving S-morphism from an abelian scheme to a separated S-group scheme is a group homomorphism. A homomorphism with zero geometric fibres is zero. For A/S of dimension g, [N]:A→A is finite locally free of rank N^(2g) for N≥1 and finite étale when N is invertible on S; kernel A[N] and these assertions commute with arbitrary base change.

**Hypotheses.** For rigidity A is proper smooth with geometrically connected fibres; for multiplication g is constant.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `mathlib:CategoryTheory.IsMonHom`.

**Construction or proof sketch.**

1. Prove the Artin-local rigidity lemma from proper flat cohomology/base change, reduce general bases by finite-presentation limits and local completion, then apply it to the commutator and addition defect.
2. For [N], apply the existing field degree/isogeny theorem on fibres and relative flatness to obtain finite locally free degree N^(2g).
3. Invertible differential N on the Lie algebra gives étaleness; kernel formation is a fibre product.

**Acceptance.**

- The proof must work over nonreduced bases, not only on geometric points.
- The necessary relative finite-flat passage from the field theorem is G-relative-torsion.

**Sources.**

- [Jesse Kass, Theorem 1 and proof, pp.2–3](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — Proves zero-preserving morphisms and commutativity using relative rigidity.
- [James S. Milne, §16, Proposition 16.1 and Corollary 16.2, pp.67–68](https://www.jmilne.org/math/CourseNotes/AV.pdf) — The field case is already owned; it is not enough by itself over a nonreduced base.
- [Martin Olsson, §2.1, pp.297–300](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Uses the relative torsion scheme and its invertible-level étaleness.
- [Jesse Kass, Corollary 1, p.3](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — States multiplication degree; its proof is assigned as an exercise, so the relative proof is still G-relative-torsion.

### 20. Relative dual abelian scheme

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual` · construction · proposed declaration `R094.relative_dual`.

For A/S an abelian scheme, represent its fppf sheaf of rigidified fibrewise algebraically trivial line bundles by an abelian scheme A∨/S, with normalized Poincaré line bundle on A×_S A∨. Duals commute with arbitrary base change; evaluation gives A≃A∨∨ and morphisms dualize contravariantly. The field restriction agrees with the dual in JacobianChallenge Layer E.

**Hypotheses.** Rigidification along zero and fibrewise algebraic triviality are part of the functor. No higher-tier dual construction is a prerequisite.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Construction or proof sketch.**

1. Define the rigidified Picard functor with its theorem-of-the-cube group law.
2. Use the abelian-specific relative representability argument, not merely the unproved blanket Picard representability target; G-dual records the missing proof from arbitrary bases.
3. Construct normalized Poincaré data and evaluate against it to prove base change and biduality by fibre comparison plus rigidity.

**Uses.**

- `Polarization`: Defines its target morphism and positivity criterion.
- `AbelianSchemesAndArithmeticModuli:A.2`: Relative duals and Poincaré data have this lower owner; Rosati and type results consume them.

**API.**

| Name | Contract |
| --- | --- |
| `AbelianScheme.dual` | Construct the abelian scheme representing the rigidified Pic⁰ sheaf. |
| `AbelianScheme.poincare` | Give its line bundle normalized on both zero sections. |
| `AbelianScheme.dual_baseChange` | (A_T)∨≃(A∨)_T with the Poincaré data. |
| `AbelianScheme.bidual` | Evaluation gives the canonical group isomorphism A≃A∨∨. |
| `AbelianScheme.dualMap` | A homomorphism A→B induces B∨→A∨ contravariantly. |

**Unit tests.**

- `AbelianScheme.dual_zero` (degenerate): The dual of the dimension-zero identity scheme is itself.
- `AbelianScheme.dual_field` (compatibility): Over Spec K the relative dual is the existing Layer E dual with the same normalized pairing.
- `AbelianScheme.dual_product` (computation): (A×_S B)∨≃A∨×_S B∨, with Poincaré line bundle the tensor product of the two pullbacks.

**Acceptance.**

- A Picard group of global line bundles is not the dual scheme.

**Sources.**

- [Martin Olsson, §2.1.3, p.298](https://library.slmath.org/books/Book59/files/65olsson.pdf) — States relative duality and the normalized universal line bundle.
- [Jesse Kass, §3, Theorems 3–5, pp.5–6](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — Confirms the dual and Poincaré statements but does not supply the omitted representability proof.

### 21. Polarization of fixed degree

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization` · definition · proposed declaration `R094.polarization`.

A polarization is a homomorphism λ:A→A∨ whose every geometric fibre equals φ_L:x↦t_x*L⊗L⁻¹ for an ample line bundle L. A degree parameter d≥1 means λ is finite locally free of rank d²; on a g-dimensional fibre h⁰(L)=d. Principal means d=1. The moduli object is λ, not a global choice of L. An isomorphism f:(A,λ)→(B,µ) obeys f∨∘µ∘f=λ.

**Hypotheses.** A/S an abelian scheme of constant dimension g≥0. For g=0 only d=1 occurs.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

**Construction or proof sketch.**

1. Define φ_L by the normalized Poincaré universal property and the theorem of the cube.
2. Require fibrewise ample representability and the finite-flat degree condition.
3. Use fibre Riemann–Roch and the existing field polarization degree theorem to relate rank ker λ and h⁰(L).

**Uses.**

- `PolarizedAbelianModuli`: Fixes the isomorphism groupoid and its degree component.
- `AbelianSchemesAndArithmeticModuli:A.2`: Consumes this relative input for polarization types and Rosati theory.

**API.**

| Name | Contract |
| --- | --- |
| `Polarization.toHom` | Expose the group homomorphism A→A∨. |
| `Polarization.degree` | The kernel is finite locally free of rank d². |
| `Polarization.ofAmple` | A fibrewise ample line bundle induces λ with the stated degree. |
| `Polarization.pullback` | Base change preserves the polarization and its degree. |
| `Polarization.isoCriterion` | Isomorphisms satisfy the dual-conjugation equation. |
| `Polarization.principal` | Principal is equivalent to λ being an isomorphism. |

**Unit tests.**

- `Polarization.dimension_zero` (degenerate): On the identity abelian scheme the unique polarization has d=1; d>1 is impossible.
- `Polarization.elliptic_degree` (computation): On an elliptic curve O(m·0), m≥1, induces [m] under the principal dual identification and has kernel rank m² and d=m.
- `Polarization.negative_excluded` (non-example): On an elliptic curve the map induced by O(−0) is not a polarization; symmetry alone is insufficient.

**Acceptance.**

- Degree d² of λ is not renamed degree d.
- Do not demand a chosen global ample representative.

**Sources.**

- [Martin Olsson, §2.1.5–§2.1.7, pp.298–300](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The homomorphism definition and square degree convention are the intended moduli data; E1 corrects its global translation claim.

### 22. Local representatives of a polarization

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-local-ample-representatives` · theorem · proposed declaration `R094.local_ample_representatives`.

Every polarization admits a representing ample line bundle fppf locally on S; if 2 is invertible it does so étale locally. Over an Artin local base, a chosen representing line bundle on the residue fibre lifts with a lifting polarization. For two representing bundles, their difference is an A∨-section; it is a translate globally only when that section is in λ(A(S)), but it is a translate fppf locally.

**Hypotheses.** Line bundles are understood up to pullback from S, or rigidified at zero.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

**Construction or proof sketch.**

1. Construct a canonical bundle representing 2λ from (id,λ)*Poincaré.
2. Its square-root torsor under A∨[2] supplies the local representative; this torsor is étale when 2 is invertible.
3. For a prescribed residue bundle use Oort Lemma 2.3.2 and the Picard exact sequence.
4. The correct translation criterion is the image of λ on S-sections, not all of A∨(S); use E1 to test the global distinction.

**Acceptance.**

- Over R the degree-two polarization on y²=x(x−1)(x+1) has same-polarization bundles differing by (0,0), which is not a double of a real point.

**Sources.**

- [Martin Olsson, Lemmas 2.1.8–2.1.9, pp.300–301; Remark 2.1.6, p.299](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The local conclusions are valid; E1 supplies the correction to the global translation sentence.
- [Frans Oort, Lemma 2.3.2 and its proof, pp.282–284](https://www.numdam.org/article/CM_1971__23_3_265_0.pdf) — Lifts a chosen representative over small Artin thickenings.

### 23. Canonical projective bundle for polarized families

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-canonical-bounded-bundle` · construction · proposed declaration `R094.canonical_bounded_bundle`.

For (A/S,λ) of dimension g and degree d², M=(id,λ)*Poincaré, normalized along zero, is relatively ample and represents 2λ. M³ is relatively very ample, and for r≥1 the pushforward f_*(M^(3r)) is locally free of rank d(6r)^g with arbitrary base-change compatibility. The corresponding Hilbert polynomial is P(t)=d(6t)^g.

**Hypotheses.** A has constant dimension g; the Poincaré bundle is normalized; g=0,d=1 gives the constant polynomial one.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

**Construction or proof sketch.**

1. Compute φ_M=2λ with the Poincaré identities and check positivity on every fibre.
2. Apply the abelian very-ampleness theorem to M³ on fibres; relative base change makes the embedding uniform.
3. Use higher-cohomology vanishing and Riemann–Roch on every abelian fibre, then coherent base change, to obtain ranks and the fixed polynomial.

**Uses.**

- `PolarizedAbelianModuli.framedAtlas`: Bounds its projective Hilbert parameter scheme.
- `AlgebraicModuliForArithmeticGeometry:R09.2`: Uses its existing Hilbert/Hom–Isom construction with this exact polynomial.

**API.**

| Name | Contract |
| --- | --- |
| `Polarization.canonicalBundle` | Construct the rigidified bundle M with φ_M=2λ. |
| `Polarization.canonicalBundle_baseChange` | M formation commutes with arbitrary pullback. |
| `Polarization.cubicVeryAmple` | M³ gives a relative closed immersion after locally choosing a frame of its pushforward. |
| `Polarization.sectionRank` | For r≥1 the section rank is d(6r)^g. |
| `Polarization.hilbertPolynomial` | Expose P(t)=d(6t)^g for the Hilbert owner. |

**Unit tests.**

- `Polarization.canonical_elliptic` (computation): For an elliptic principal polarization M has degree two, M³ degree six and h⁰=6.
- `Polarization.canonical_zero` (degenerate): For g=0,d=1, M³ is the trivial bundle and its pushforward has rank one.
- `Polarization.canonical_degree_distinction` (non-example): For g=1,d=2 the rank is 12, not 6 and not 24; rank ker λ is 4.

**Acceptance.**

- A local line bundle representing λ has a different Hilbert polynomial from this canonical doubled representative.

**Sources.**

- [Martin Olsson, §2.1.7–§2.1.10, pp.300–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The canonical doubled line bundle and its cubic embedding produce bounded projective data.

### 24. Polarized abelian moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-abelian-moduli` · construction · proposed declaration `R094.polarized_abelian_moduli`.

For g≥0,d≥1 form A_{g,d}(S), the groupoid of dimension-g abelian schemes with a polarization of degree d² and dual-compatible isomorphisms. It is an fppf stack. Neither a global representing line bundle nor a level structure is part of its objects.

**Hypotheses.** Base schemes are over Z; the g=0,d>1 stack is empty.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-local-ample-representatives`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**Construction or proof sketch.**

1. Give the groupoid and coherent pullback directly from the two preceding carriers.
2. Fppf locally choose the ample representative to descend the projective scheme, and then descend the group law and λ; remove the choice from the descended object.
3. Test degree and constant dimension on geometric fibres and establish locality.

**Uses.**

- `PolarizedAbelianModuli.algebraic`: The bounded projective construction supplies its atlas.
- `AbelianSchemesAndArithmeticModuli:A.6`: Higher arithmetic levels, types and correspondences consume this same carrier.

**API.**

| Name | Contract |
| --- | --- |
| `PolarizedAbelianModuli.fibre` | Its fibre is the stated groupoid of (A,λ) and isomorphisms. |
| `PolarizedAbelianModuli.pullback` | Its transition functors use the native pullback and commute coherently. |
| `PolarizedAbelianModuli.forget` | Forget λ to the relative abelian-scheme groupoid. |
| `PolarizedAbelianModuli.fppfDescent` | The actual groupoid satisfies effective fppf descent. |
| `PolarizedAbelianModuli.ellipticEquivalence` | A_{1,1} is equivalent to smooth elliptic moduli via its canonical principal polarization. |

**Unit tests.**

- `PolarizedAbelianModuli.elliptic` (compatibility): A_{1,1} is smooth elliptic moduli with its automorphisms, not its j-line coarse space.
- `PolarizedAbelianModuli.minus_one` (non-example): [−1] on a positive-dimensional polarized abelian variety is an automorphism; the unlevelled fibre is not a discrete set.
- `PolarizedAbelianModuli.zero` (degenerate): A_{0,1} is the terminal stack and A_{0,d} is empty for d>1.

**Acceptance.**

- Do not silently substitute the stack of varieties with a chosen ample line bundle.

**Sources.**

- [Martin Olsson, §2.1.10 and Theorem 2.1.11, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The stack classifies polarization homomorphisms with these conventions.

### 25. Prime-to-characteristic full level structure

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level` · construction · proposed declaration `R094.full_level`.

For N≥1 invertible on S, a full level-N structure on A/S of dimension g is an isomorphism of finite étale group schemes α:(Z/NZ)_S^(2g)≃A[N]. It is an ordered basis with no symplectic pairing imposed. Define A_{g,d}[N] by these structures and polarization-compatible isomorphisms preserving α.

**Hypotheses.** N is invertible on S. Scheme rigidity requires N≥3; the definition allows N=1,2.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-abelian-moduli`, `SchemeAndStackFoundations:SF.1/torsor`.

**Construction or proof sketch.**

1. Use the relative finite étale torsion kernel and its locally constant rank to construct the basis torsor.
2. Its change-of-basis action is GL_{2g}(Z/NZ), not a symplectic group without a Weil-pairing condition.
3. Bundle α with the preceding moduli data, and require arrows to preserve it.

**Uses.**

- `PolarizedAbelianModuli.fineScheme`: Its rigidifying finite étale cover constructs the algebraic atlas.
- `AlgebraicModuliForArithmeticGeometry:R09.5`: Uses this full-level owner for coarse and rigidification comparisons; richer arithmetic levels remain with their owners.

**API.**

| Name | Contract |
| --- | --- |
| `FullLevel.torsionBasis` | Expose α as an isomorphism of the two finite étale group schemes. |
| `FullLevel.baseChange` | The basis pulls back with the kernel and constant group. |
| `FullLevel.changeBasis` | Precomposition gives the free transitive basis action of GL_{2g}(Z/NZ). |
| `FullLevel.forget` | The forgetful map is a finite étale GL torsor over the unlevelled stack on Z[1/N]. |

**Unit tests.**

- `FullLevel.two_inversion` (non-example): On a positive-dimensional abelian variety in characteristic≠2, [−1] is nontrivial and fixes every full level-two structure.
- `FullLevel.three_rigid` (characterisation): For N=3 invertible, a polarized automorphism fixing a full basis is the identity.
- `FullLevel.bad_characteristic` (non-example): For an elliptic curve in characteristic p, E[p] has rank p² but is not an étale constant rank-two p-basis group; the definition cannot extend unchanged.

**Acceptance.**

- At N=2 inversion fixes the level; N≥3 cannot be weakened.

**Sources.**

- [Martin Olsson, Proof of Theorem 2.1.11, p.302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Full level kills automorphisms and supplies the finite étale cover over Z[1/N].
- [Jesse Kass, Theorem 8, p.7](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — States the N≥3 fine-level conclusion; its omitted proof is tracked in G-fine-level.

### 26. Finite polarized automorphisms and level rigidity

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity` · theorem · proposed declaration `R094.polarized_automorphism_rigidity`.

For a polarized abelian variety over an algebraically closed field, the polarization-preserving automorphism group scheme is finite étale. If N≥3 is invertible and an automorphism is the identity on A[N], it is the identity on A. The relative polarized Isom functor is unramified; infinitesimal homomorphisms fixing the special fibre vanish by relative rigidity.

**Hypotheses.** The field finite-group statement needs positivity of λ, not only symmetry.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-canonical-bounded-bundle`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

**Construction or proof sketch.**

1. Realize automorphisms as stabilizers of bounded projective data and use rigidity to eliminate tangent directions.
2. Use positivity of the Rosati form to prove boundedness/finiteness of integral automorphisms preserving λ; the minimal field argument, moved down from the higher Rosati owner, is G-level-rigidity.
3. Apply the congruence-kernel torsion lemma: a finite-order integral automorphism congruent to one at full level N≥3 is trivial; treat composite N including N=4, not just odd primes.
4. Pass to the relative Isom functor by the infinitesimal rigidity criterion and base change.

**Acceptance.**

- This key input is planned with a precise missing proof, not borrowed from a higher-tier arithmetic-moduli stage.

**Sources.**

- [Martin Olsson, Theorem 2.1.11 and proof, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Uses the finite unramified automorphisms and the level-rigidity theorem.
- [Jesse Kass, Theorem 8, p.7](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — Gives the fine-level consequence but does not prove the required congruence lemma.

### 27. Bounded framed polarized parameter scheme

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-framed-polarized-parameter` · construction · proposed declaration `R094.framed_polarized_parameter`.

For fixed g,d construct the scheme H_{g,d} of triples (A,λ,β), where (A,λ) is polarized abelian and β is a frame of f_*M³ of rank r=d6^g, modulo simultaneous scalar frames. Its tautological embedding lies in P^(r−1) with polynomial d(6t)^g. The forgetful map is a PGL_r torsor over A_{g,d}, with the equivariant universal polarized family. Adding full level gives H_{g,d}[N].

**Hypotheses.** For g=0,d>1 the parameter scheme is empty. Canonical M eliminates the arbitrary representing-line-bundle choice.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-canonical-bounded-bundle`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-abelian-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.1/torsor`.

**Construction or proof sketch.**

1. Start with the existing Hilbert scheme for the fixed polynomial and its universal embedded projective family.
2. Impose smooth connected abelian fibres, zero and group-law equations by Hom schemes and their closed equalizer conditions; construct the relative polarization morphism and the canonical-bundle compatibility locus.
3. Establish the locally closed parameter locus and its base-change universal property (G-framed-locus); equality of embedded data provides uniqueness.
4. Use local frames modulo scalars and canonical M to prove the PGL torsor description and equivariant universal family.

**Uses.**

- `PolarizedAbelianModuli.algebraic`: The PGL quotient gives algebraicity with a concrete atlas.
- `PolarizedAbelianModuli.fineScheme`: Its levelled GIT quotient gives the representable rigid cover.

**API.**

| Name | Contract |
| --- | --- |
| `PolarizedFrames.hilbertMap` | Map the tautological embedded family to the existing Hilbert scheme with polynomial d(6t)^g. |
| `PolarizedFrames.universalFamily` | Carry the universal group scheme and λ compatible with its canonical cubic embedding. |
| `PolarizedFrames.frameTorsor` | Forgetting the projective frame is a PGL_r torsor over the groupoid. |
| `PolarizedFrames.baseChange` | The representing scheme and universal family commute with base change. |

**Unit tests.**

- `PolarizedFrames.elliptic_rank` (computation): For g=d=1 the canonical ambient space is P⁵, not P².
- `PolarizedFrames.scalar` (characterisation): A frame and its nonzero scalar multiple give the same projective frame.
- `PolarizedFrames.missing_law` (non-example): A smooth embedded genus-one curve without zero and λ is not a point of H_{1,1}; Hilbert polynomial alone is insufficient.

**Acceptance.**

- The parameter locus requires an actual representability proof; it is not defined by arbitrary Prop labels on Hilbert points.

**Sources.**

- [Martin Olsson, §2.1.10 and proof of Theorem 2.1.11, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The bounded canonical embedding is the starting point for the representability construction.

### 28. Fine level scheme

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fine-polarized-scheme` · theorem · proposed declaration `R094.fine_polarized_scheme`.

For N≥3, A_{g,d}[N] over Z[1/N] is represented by a quasi-projective scheme carrying its universal polarized abelian scheme with full level. For d arbitrary no symplectic level pairing is imposed. The forgetful map is a finite étale GL_{2g}(Z/NZ) torsor in the stack sense.

**Hypotheses.** g≥0,d≥1,N≥3. Empty components cause no exception.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-framed-polarized-parameter`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level`, `SchemeAndStackFoundations:SF.1/fine-moduli-space`, `SchemeAndStackFoundations:SF.1/finite-group-quotient`.

**Construction or proof sketch.**

1. Apply the GIT stable quotient to H_{g,d}[N] by PGL_r, proving stable locus, orbit separation and relative quasi-projectivity; G-fine-level gives the precise unverified input instead of claiming that trivial inertia alone implies a scheme.
2. Use full-level rigidity to identify the quotient groupoid with its representing scheme.
3. Descend the equivariant universal family and level structure; identify the change-of-basis torsor.

**Acceptance.**

- Only the algebraic-space conclusion follows from trivial inertia without the additional GIT scheme argument.
- Do not state smoothness over all Z[1/N]; primes dividing d remain.

**Sources.**

- [Martin Olsson, Proof of Theorem 2.1.11, p.302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Cites the quasi-projective fine scheme construction; its original GIT proof has not been read here.
- [Jesse Kass, Theorem 8, p.7](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf) — States the fine scheme theorem without its proof.

### 29. Algebraic Deligne–Mumford polarized moduli

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-algebraic-dm` · theorem · proposed declaration `R094.polarized_algebraic_dm`.

A_{g,d} is an algebraic Deligne–Mumford stack of finite type over Z. On Z[1/N], N≥3, it is equivalent to [A_{g,d}[N]/GL_{2g}(Z/NZ)]. The level-three and level-four schemes give a representable étale surjective atlas after taking their disjoint union over Z[1/3] and Z[1/4], which cover Spec Z.

**Hypotheses.** g≥0,d≥1; the entire degree component, including primes dividing d.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-framed-polarized-parameter`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fine-polarized-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`.

**Construction or proof sketch.**

1. The bounded Hilbert frame scheme and PGL torsor prove algebraicity and finite type.
2. The GL basis torsor identifies each localized quotient groupoid; full-level rigidity supplies unramified diagonal.
3. Use N=3 and N=4 to cover every residue characteristic and obtain the explicit étale atlas.

**Acceptance.**

- The GL torsor is finite étale even when its constant group order is not invertible; tameness needs an independent order test.

**Sources.**

- [Martin Olsson, Theorem 2.1.11 and proof, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — States DM over Z and explains full-level covers.

### 30. Finite polarized relative isomorphisms

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-finite-diagonal` · theorem · proposed declaration `R094.polarized_finite_diagonal`.

For two dimension-g degree-d² polarized abelian schemes over S, the polarization-preserving Isom functor is represented by a finite unramified S-scheme, with arbitrary base-change compatibility. Consequently A_{g,d} has finite diagonal and is separated over Z.

**Hypotheses.** S arbitrary; no invertibility assumption on d.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-algebraic-dm`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

**Construction or proof sketch.**

1. Apply projective Hom–Isom with canonical bounded bundles, imposing the zero and polarization equations.
2. Rigidity gives unramifiedness and field automorphism finiteness gives quasi-finiteness.
3. Over a trait, extend a generic homomorphism between abelian schemes with good reduction and its inverse; equality of the polarization equation extends by separatedness. G-good-reduction-extension records the required theorem.
4. Apply the scheme valuative criterion, finite-presentation approximation and descent to obtain finiteness over arbitrary bases.

**Acceptance.**

- Finite field automorphism groups alone do not prove properness of relative Isom.

**Sources.**

- [Martin Olsson, Theorem 2.1.11 and proof, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — The proof requires relative finite polarized Isom; its good-reduction extension input is not supplied in detail.
- [James S. Milne, Theorem 17.1 and Remark 17.2, pp.69–71](https://www.jmilne.org/math/CourseNotes/AV.pdf) — The Néron-extension statement motivates the trait step, but the full relative proof remains G-good-reduction-extension.

### 31. Prime-to-degree polarized infinitesimal lifting

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-small-extension-lifting` · theorem · proposed declaration `R094.polarized_small_extension_lifting`.

Let R′→R be a square-zero surjection of Artin local rings with algebraically closed residue field k, and (A,λ)/R a dimension-g degree-d² polarized abelian scheme. If d is invertible in k, (A,λ) lifts to R′; the chosen ample representative on a residue fibre can be lifted compatibly. For fixed kernel I killed by the maximal ideal, the lifting obstruction is the polarization cup-product obstruction and vanishes because λ is separable.

**Hypotheses.** d prime to char(k). For full level N also invertible, the existing basis lifts uniquely. No assertion for inseparable polarizations.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-local-ample-representatives`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

**Construction or proof sketch.**

1. Use the relative abelian deformation torsor under H¹(A_k,T_A)⊗I and line-bundle obstruction in H²(A_k,O_A)⊗I (G-abelian-deformation records the missing general construction).
2. Cup with c₁(L) maps the abelian deformation directions onto the line-bundle obstruction when λ is separable. Choose a direction cancelling it.
3. Oort Lemma 2.3.2 matches lifted homomorphism polarizations with representatives; induction on length handles Artin local extensions.
4. Finite étale full level lifts uniquely across nilpotent thickenings.

**Acceptance.**

- The deformation comparison layer R09.6 consumes this minimal lifting result; using R09.6 here would make a cycle.

**Sources.**

- [Frans Oort, Theorem 2.4.1, implication (a)⇒(c), pp.286–287; Lemma 2.3.2, pp.282–284](https://www.numdam.org/article/CM_1971__23_3_265_0.pdf) — The separable-polarization implication is the exact smoothness input required here.

### 32. Smoothness away from polarization degree

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-smooth` · theorem · proposed declaration `R094.polarized_smooth`.

A_{g,d} is smooth over Z[1/d] of relative dimension g(g+1)/2. For N≥3 its fine full-level scheme is smooth over Z[1/(Nd)] of the same relative dimension.

**Hypotheses.** g≥0,d≥1. No smoothness assertion at primes dividing d.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-algebraic-dm`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-small-extension-lifting`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-fine-polarized-scheme`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`.

**Construction or proof sketch.**

1. Apply the infinitesimal smoothness criterion to the finite-type atlas using the lifting theorem.
2. The tangent space is the symmetric subspace selected by the polarization pairing, of dimension g(g+1)/2; relative étale full level adds no tangent directions.
3. Descend scheme smoothness to the stack and identify the relative dimension.

**Acceptance.**

- For g=1,d=1 this agrees with smooth elliptic moduli of dimension one.

**Sources.**

- [Martin Olsson, Theorem 2.1.11, p.301](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Specifies the smooth base Z[1/d].
- [Frans Oort, Theorem 2.4.1, pp.286–287](https://www.numdam.org/article/CM_1971__23_3_265_0.pdf) — Provides unobstructedness for separable polarizations.

### 33. Separated abelian moduli and tameness limits

Node `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-separation-tameness` · theorem · proposed declaration `R094.abelian_separation_tameness`.

A_{g,d} is separated of finite type with finite inertia, is tame in characteristic zero, and in characteristic p is tame exactly when each geometric polarization-preserving automorphism group has order prime to p. The family A_{1,1} is not proper over Z: an elliptic curve with multiplicative reduction over a trait has no abelian-scheme extension, although it extends in E_1. In characteristic two its generic constant inversion inertia is wild.

**Hypotheses.** The positive-characteristic test uses the finite étale automorphism theorem, not the degree d alone. No compactification is an object of A_{g,d}.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-finite-diagonal`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-abelian-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-elliptic-proper`, `SchemeAndStackFoundations:SF.1/tame-stack`, `SchemeAndStackFoundations:SF.1/tame-local-structure`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`.

**Construction or proof sketch.**

1. Use finite diagonal for separatedness; finite étale geometric inertia makes the AOV linear-reductivity condition the prime-to-p group-order condition.
2. Use the elliptic equivalence and a nodal multiplicative degeneration to refute properness of A_{1,1}; no finite extension removes the multiplicative reduction.
3. Record the constant C₂ subgroup in characteristic two. Keep coarse spaces and abelian compactifications with their existing owners.

**Acceptance.**

- Over characteristic two, d=1 is invertible but does not imply tame.

**Sources.**

- [Dan Abramovich, Martin Olsson, Angelo Vistoli, Theorem 3.2, p.1077; Proposition 2.7, pp.1067–1068](https://www.numdam.org/article/AIF_2008__58_4_1057_0.pdf) — Gives the exact stabilizer criterion.
- [Martin Olsson, Theorem 2.1.11, pp.301–302](https://library.slmath.org/books/Book59/files/65olsson.pdf) — Asserts separated DM moduli and smoothness, not properness; compactification is a distinct problem.
- [Kęstutis Česnavičius, Theorem 3.1.6, pp.18–19](https://arxiv.org/pdf/1511.07475v2) — The generalized-elliptic boundary explains the missing properness in the smooth elliptic open.

## Arithmetic acceptance matrix

| Moduli problem | Algebraic and smooth | Deligne–Mumford | Separated/proper | Tame |
| --- | --- | --- | --- | --- |
| E_n | Over Z, relative dimension one | Remove only cusp fibres in characteristics dividing n | Finite diagonal and proper over Z | Cusp exactly away from 2; entire stack over Z[1/6] |
| A_g,d | Algebraic finite type over Z; smooth over Z[1/d], dimension g(g+1)/2 | Over Z | Finite unramified diagonal, hence separated; A_1,1 is not proper | Characteristic zero; in characteristic p exactly the prime-to-p geometric automorphism-order test |
| Stable pointed curves, 2g−2+n>0 | Imported Part II smooth theorem, dimension 3g−3+n | Imported Part II, including pointed diagonal | Imported Part II properness; finite scheme cover requested from R09.5 | No blanket tameness assertion here |

The matrix prevents three tempting errors: replacing µ_n by geometric points at a bad cusp, deriving properness from finite inertia, and deriving tame from d being invertible. At n=3 in characteristic three the cusp is tame but is not DM; in characteristic two smooth elliptic moduli is DM but has wild inversion inertia.

## Native signatures and proof-input boundaries

The pinned commits are Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The suggested file uses individual modules and the existing native field abelian variety. Its abelian carrier, pullback and field adapters, zero-preserving homomorphism form, smooth polygon-point formulas and algebraic fragments of the corrected nodal cubic are typed against this baseline. Proof bodies do not claim implementation.

A geometric statement whose carrier is absent has a **named omission**, with its exact mathematical contract, in that file. It is not replaced by a propositional flag, a set of geometric points or a weakened definition. G-native records those missing conditions/signatures. In particular, the smooth-point group is not the proper Néron polygon. All 68 API items and 40 test names are present as native statements or explicit omissions. Elaboration can check only the native signatures; it cannot validate an omitted moduli theorem.

The target pass is complete and R09.4 is **planned**, with the following exact proof-input boundaries. These are mathematical/source reconstruction tasks rather than extra unnamed targets.

- **G-native — Native signatures for unimplemented geometric carriers.** The pinned baseline has neither the SF.1 stack carrier nor a bundled generalized elliptic curve, relative Picard/Poincaré bundle, relative Cartier divisor contraction or fixed-dimension predicate in the form required here. The suggested file explicitly names every omitted definition, theorem, API and test, and its exact mathematical contract. Only the native abelian-scheme carrier and field adapters and the polygon smooth-point formulas are typed; no omitted hypothesis is replaced by an arbitrary proposition. Elaborating this partial signature file does not certify any omitted statement. Affects `standard-ngon`, `generalized-elliptic`, `degeneracy`, `polygon-automorphisms`, `contraction`, `fixed-elliptic-moduli`, `elliptic-descent`, `cyclic-atlas-moduli`, `cyclic-atlas-dm`, `cyclic-atlas-cover`, `fixed-elliptic-algebraic`, `elliptic-finite-diagonal`, `elliptic-proper`, `elliptic-dm-locus`, `elliptic-cusp`, `elliptic-tame`, `abelian-scheme`, `relative-abelian-rigidity`, `relative-dual`, `polarization`, `local-ample-representatives`, `canonical-bounded-bundle`, `polarized-abelian-moduli`, `full-level`, `polarized-automorphism-rigidity`, `framed-polarized-parameter`, `fine-polarized-scheme`, `polarized-algebraic-dm`, `polarized-finite-diagonal`, `polarized-small-extension-lifting`, `polarized-smooth`, `abelian-separation-tameness`, `onegon-weierstrass`.
- **G-cyclic-cover — Pointed cyclic cover across the one-gon.** Reconstruct DR V.1.4’s inverse: the unique pointed finite étale cyclic cover of the irreducible generalized elliptic curve dual to the selected multiplicative subgroup, including its group/action extension on n-gons, in families and with base change. The DR scan’s OCR drops displayed formulas; the auxiliary equivalence is read but this reconstruction is not established. Affects `cyclic-atlas-dm`.
- **G-trait-isom — Matched-count generalized isomorphism extension.** From regular/minimal genus-one trait models prove a generic zero/law-preserving isomorphism of two generalized elliptic curves with matching polygon counts extends uniquely over the trait. Include the nodal special-fibre action and arbitrary-base finite-presentation descent; object-level stable reduction alone is insufficient. Affects `elliptic-finite-diagonal`.
- **G-trait-model — Prescribed polygon count after ramification.** Prove that an elliptic generic fibre after semistable reduction and additional finite ramification has a generalized model with polygon count divisible by any fixed n and admits a finite locally free smooth subgroup meeting exactly n components; contraction gives the required E_n object. Track extensions and smoothing rather than assume every semistable model already has the requested count. Affects `elliptic-proper`.
- **G-relative-torsion — Relative finite locally free multiplication.** Deduce [N] finite locally free degree N^(2g) from the existing field degree theorem over arbitrary schemes, including fibre flatness and finite-presentation descent; prove the invertible differential étaleness claim. Kass states the result but assigns the proof as an exercise. Affects `relative-abelian-rigidity`.
- **G-dual — Arbitrary-base dual abelian representability.** Prove the rigidified fibrewise Pic⁰ sheaf of an abelian scheme is an abelian scheme over arbitrary S, construct normalized Poincaré data, and prove base change and biduality. Olsson and Kass state this, without the general-base representability proof. Faltings–Chai is not cleared in the supplied library and has not been used. Affects `relative-dual`.
- **G-level-rigidity — Minimum field polarized finite-group and congruence argument.** Supply the minimum field proof of finiteness of polarization-preserving automorphisms and faithfulness on full level N≥3 invertible, including N=4. Use positivity/boundedness and the finite-order congruence-kernel lemma; do not infer it from an unproved fine scheme theorem or cite higher Rosati theory. The survey states the consequence, not this proof. Affects `polarized-automorphism-rigidity`.
- **G-framed-locus — Representability of the bounded polarized frame locus.** In the fixed Hilbert/Hom parameter spaces prove the group-law, connectedness, dual morphism, positivity and canonical-bundle compatibility conditions produce the representing scheme H_{g,d}, with its exact universal property. A Hilbert polynomial does not encode these data by itself. The survey’s boundedness ingredients are read, but this parameter-locus argument is not. Affects `framed-polarized-parameter`.
- **G-fine-level — GIT fine scheme rather than just an algebraic space.** Prove the stable relative PGL quotient of H_{g,d}[N] exists as a quasi-projective scheme over Z[1/N], with descended universal polarized family. Olsson cites Mumford GIT 1965 Chapter 7 Theorem 7.9 and its following remark; this original proof has not been read. Trivial inertia establishes at most an algebraic space without this input. No uncleared book copy was used. Affects `fine-polarized-scheme`.
- **G-good-reduction-extension — Trait homomorphism extension for good-reduction abelian schemes.** Prove Hom_R(A,B)→Hom_K(A_K,B_K) is bijective for abelian schemes over a DVR, by the Weil/Néron extension argument, then extend inverse and polarization equations and descend finiteness over arbitrary S. Milne’s Néron statement is not a substitute for the full proof or for relative Hom representability. Affects `polarized-finite-diagonal`.
- **G-abelian-deformation — Minimal abelian and line-bundle obstruction calculation.** Construct the abelian deformation torsor H¹(T_A)⊗I and the H²(O_A)⊗I line-bundle obstruction over small Artin extensions, and prove the polarization cup-product surjectivity when d is invertible and tangent dimension g(g+1)/2. Oort’s lifting implication is read but its underlying deformation construction is not reconstructed. This minimum input moves down from R09.6 to avoid an R09.4→R09.6→R09.4 cycle. Affects `polarized-small-extension-lifting`, `polarized-smooth`.
- **G-owner-rewiring — Apply shared-input ownership before composing suppliers.** SF.1→R09.3/R09.4 replaces the overlapping generic plan. StableReductionPartII’s generic R09.4 references must point to SF.1 before its theorem is used as the stable-curve supplier. The higher ModularCurvesPartII and AbelianSchemes plans must import the lower arithmetic inputs listed in restructure. Their packets are deliberately not edited here. This is an ownership prerequisite, not missing new stable-curve mathematics. Affects `fixed-elliptic-moduli`, `polarized-abelian-moduli`.

## Supplier contracts

- **`SchemeAndStackFoundations:SF.1`.** Supply the single groupoid-valued carrier on native schemes, quotient stacks and finite-inertia tameness criteria, respecting the listed existing node contracts. Add the precise fppf-presentation criterion of Stacks Tag 06DC; descent of smoothness/finite type/relative dimension along representable faithfully flat lfp covers; unramified-diagonal DM recognition; relative Cartier divisors; and the algebraic-stack valuative criterion with existence after finite trait extension. A quasi-finite flat cover must not be renamed a smooth atlas.
- **`tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`.** Use the existing smooth-point divisors, relative Cartier base change, schematic image/Fitting input and relative ampleness. The canonical polygon/gluing construction here extends these inputs; no second divisor carrier.
- **`tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.** Use finite flat and finite étale subgroup/dual-kernel constructions in the DR auxiliary equivalence; their extension across nodal fibres is G-cyclic-cover, not already supplied by smooth elliptic duality.
- **`tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`.** Use representable free finite-group quotients of generator spaces and their descent; compare the generalized polygon constructions with these existing scheme-level quotients.
- **`tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`.** Import the smooth elliptic law and zero-preserving morphisms, then prove the generalized-object smooth equivalence.
- **`tauceti:TauCetiRoadmap/ModularCurves#1e-the-cubic-polarisation-and-elliptic-descent`.** Import projective elliptic descent and its cubic ample bundle; extend descent here by the n-torsion divisor without redefining smooth elliptic families.
- **`tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`.** Import the smooth integral Weierstrass coordinate-change presentation and automorphism rigidity. Here its nodal-open extension must use the split cubic y²z+xyz=x³, including characteristic two, and be proved rather than assumed to lie in the smooth owner.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.** Import relative curve cohomology, duality, positivity and section/base-change arguments used in DR IV.1.2. General positive-divisor genus-one contraction is owned by arith-contraction, with the graded relative-Proj construction and the arbitrary-base approximation proof now outlined from the original source.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.** Import the existing semistable nodal curve and pointed-curve carriers; polygon action and subgroup contraction are the arithmetic extensions here.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.** Import blowup and intersection calculations for trait model comparison, with the exact genus-one matched-count extension still recorded as G-trait-isom.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.** Import minimal regular models and their contraction comparison; do not identify the missing generalized-group extension theorem with object-level minimality.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`.** Import semistable reduction after finite extension; the prescribed n-gon ramification/component argument is G-trait-model here.
- **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.** Use the existing relative coherent cohomology/base-change and Picard machinery for proper smooth families, especially finite locally free section bundles with fibre vanishing. It is not a certificate for relative dual representability or abelian deformation theory, which are G-dual and G-abelian-deformation.
- **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.** Import field abelian duality, polarization degree, Riemann–Roch/vanishing and cubic very-ampleness from the existing field direction; combine with native field abelian varieties. Relative duals, torsion and minimum polarized rigidity have the local lower-tier owner here; do not import higher arithmetic-moduli or Rosati plans.
- **`AlgebraicModuliForArithmeticGeometry:R09.1`.** Use its existing relative Picard-functor interface to state the rigidified algebraically trivial functor; G-dual requires the abelian-specific representability proof and must not be discharged by a blanket Picard assertion.
- **`AlgebraicModuliForArithmeticGeometry:R09.2`.** Supply the existing fixed-projective fp Hilbert/Hom–Isom construction, with canonical polynomial P(t)=d(6t)^g for polarized abelian data, and projective generalized curves via ample torsion divisors. The framed group/polarization locus and relative proper Isom extension remain local proof obligations.
- **`AlgebraicModuliForArithmeticGeometry:R09.5`.** Using StableReductionPartII’s stable pointed moduli, construct a finite surjective scheme cover with its pulled-back universal family for every stable (g,n); state base and finite-type hypotheses and prove existence without claiming étaleness at wild primes. Full prime-to-characteristic level abelian schemes needed for algebraicity already have the lower owner in R09.4; retain only coarse/rigidification comparisons here.
- **`StableReductionPartII:MC.2`.** Retain the existing pointed DM/smooth/proper theorem and definition; repair the independent review and replace generic R09.4 references by SF.1. Extend the finite-unramified diagonal statement from MC.1’s unpointed case to all stable (g,n), including genus zero and one. Do not depend on E_1 for the pointed genus-one base case.
- **`SchemeAndStackFoundations:SF.4`.** Use StableReductionPartII MC.1/MC.2 and the requested R09.5 finite scheme cover as the stable-family moduli input to alterations. Remove any suggestion that the construction is owned by an étale comparison layer.
- **`tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`.** Import the existing smooth elliptic O(3·0) coordinate/model/coordinate-change argument. Its nodal one-gon extension is the local arith-onegon-weierstrass key theorem, using curve cohomology and the Pic⁰ action, and must precede B_n; do not assume the general fixed-polygon algebraicity to obtain its n=1 base.

## Source corrections and provenance

The packet records source locators and edition hashes; no source passages are reproduced. The statements above use the following corrections, each justified independently.

- **E1**, [Martin Olsson, Remark 2.1.6, p.299](https://library.slmath.org/books/Book59/files/65olsson.pdf): Replace global translation by fppf-local translation. Globally the difference class must lie in λ(A(S)); equality of polarization maps only puts it in A∨(S). Over R, E:y²=x(x−1)(x+1) has two real components. P=(0,0) lies off the identity component and is not in 2E(R). The ample bundles O(2O) and O(O+P) induce the same degree-two polarization, but cannot differ by a translation of a real point. Pullbacks from Spec R do not repair this since Pic(R)=0. No correction found in the public survey or the author publication page on 2026-10-09; this is a local correction with the explicit counterexample.
- **E2**, [Brian Conrad, §2.1, p.5, paragraph immediately before equation (2.1.2)](https://math.stanford.edu/~conrad/papers/kmpaper.pdf): Use the split nodal cubic y²z+xyz=x³. Its normalization has x=u(u+1), y=u²(u+1) with the two preimages u=0,−1 of the node; a projective change of parameter identifies these with 0 and ∞. At the printed cubic’s node in characteristic two the tangent cone is (y+x)², and its parameterization has only one geometric preimage: it is cuspidal rather than nodal. Over R its tangent cone y²+x² is nonsplit, whereas the standard one-gon is split. The corrected tangent cone y(y+x) has distinct rational branches in every characteristic. No public correction found on the author paper page or by the title/errata search on 2026-10-09. The same equation occurs in the higher ModularCurvesPartII packet; its consumer should use this corrected owner.
- **E3**, [Jesse Kass, Lemma 1 proof, p.2, final pushforward identification](https://people.ucsc.edu/~jelkass/files/AbelianSchemes.pdf): The final sheaf is η_*O_S, using π_*O_X≃O_S. The displayed η:S→Y cannot push forward a sheaf on X. With O_S the map has the required target and defines the factored morphism. No correction found in the public author PDF or by the notes-title correction search on 2026-10-09.
- **E4**, [Kęstutis Česnavičius, §3.2.1, p.19, second contraction condition; published §3.2.1, p.2025](https://arxiv.org/pdf/1511.07475v2): Take the retained-component open inside E^sm, not the complement inside the proper curve E. This open maps isomorphically to c_G(E)^sm. If G meets every component of a polygon, no component is discarded. The literal complement inside E would be the proper singular polygon itself and cannot be group-isomorphic to its smooth locus. The intended open in E^sm is the full smooth locus and makes the identity-contraction test hold. The published 2017 version repeats the same wording; no contraction erratum was found by the title/errata search on 2026-10-09. Record this as an ambient-locus clarification rather than a failure of the contraction theorem.

The public sources read are Česnavičius’s fixed-polygon presentation and properties, Conrad’s generalized objects and finite-Isom argument, Deligne–Rapoport V.1.1–V.1.5, Olsson’s polarized-moduli section, Kass’s relative rigidity argument, Oort’s polarization-lifting implication, and AOV’s finite-inertia tameness criterion. Citations use the exact sections, theorem numbers and pages above. The original GIT fine-scheme proof and arbitrary-base dual representability proof are not certified by the surveys that cite them. No uncleared reference-book copy is used.
