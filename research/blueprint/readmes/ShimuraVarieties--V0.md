# Complex Shimura varieties and canonical models: V0–V7

This roadmap constructs the complex Shimura tower and its canonical models from a pure Shimura datum. It begins with arithmetic stabilizers and the actual diagonal rational quotient, proves algebraicity through the automorphic compactification, formulates special-point reciprocity, constructs the Siegel model from the theorem of complex multiplication, and separates the abelian-type inheritance argument from the general conjugation argument. The final descent step requires a continuous system of algebraic comparisons. The mathematical objects, named declarations, proof routes and tests specified here are the definitive plan; the accompanying suggested file only prototypes signatures supported by the pinned libraries.

The packet is a complete **target-level planning pass**, with 69 declaration nodes. All eight stages are planned; none is closed. Fourteen explicit gaps and twenty supplier requests identify the inputs that must be certified to close the stages. This means that every scoped target has a route ending in the audited libraries, an existing supplier node, a requested supplier stage or a named gap. It does not mean that the theorem proofs or their advanced Lean signatures have been implemented. Every declaration retains unchecked implementation status. The bibliography distinguishes passages actually inspected from primary arguments that the gap register requires.

## Conventions and ownership

A pure datum is the object of `ShimuraData:D4/shimura-datum`; its domain, homomorphisms, cocharacter class and reflex field are imported from D2–D4. Write X⁺ for a connected domain component and G(Q)₊ for the inverse image of Gᵃᵈ(R)⁺. Compact adjoint factors are removed only when forming the effective domain action. For a compact open subgroup K of G(A_f), write [x,a]ₖ for the class of (x,a). The finite-adelic coordinate is essential. Neither the finite component double quotient nor one connected quotient is the full analytic variety.

The component arithmetic group is Γₐ=G(Q)₊∩aKa⁻¹. Quotient charts use its effective image Γₐᵉᶠᶠ. Rational neatness is the predicate owned by ShimuraData D5, with its representation independence. Neatness makes the **effective** action free once discreteness has been proved. It does not eliminate every rational central unit, and it does not make a raw level-group action faithful. Deck transformations are computed from the effective finite action, with its kernel retained. For GL₂ the full domain has its two half-plane components; at principal level N≥3 the full complex variety has φ(N) components, whereas the split one-point torus example has a quotient by ±1.

Arithmetic reduction, real Siegel sets, class-number finiteness, adelic quotient topology and the topological level/Hecke tower belong to AdelicAlgebraicGroups AA.3–AA.4 and the locally symmetric supplier, following accepted RS-04. V0 applies their results to Shimura components. V1 adds the holomorphic and analytic content. Strong approximation is used for the semisimple simply connected derived group, with its noncompact simple real factors, and never as an unrestricted statement about a reductive group or torus. Real density in the Hecke-orbit argument is a different input.

Complex analytic spaces include nilpotent holomorphic local models. An analytic space is locally a locally C-ringed space (V(I), O_U/I), with U open in Cⁿ and I a locally finitely generated holomorphic ideal. A quotient manifold is a special case. A carrier with only points and a topology cannot support coherent ideals, projective GAGA or analytic fibre products. The proposed CA.0 supplier owns these foundations, gluing and analytification; V1–V3 use them. The general foundation is not defined anew as a Shimura-specific structure. The current C0 repair target does not itself construct this category, and the retired integration roadmap cannot supply it.

The compactification in V2 is the rational Satake, or minimal Baily–Borel, compactification. The initial automorphic ring consists of **analytic** sections with specified boundary growth. It is not defined using the algebraic line bundle whose existence the construction is intended to prove. Cusp forms impose an additional vanishing condition. A positive tensor power changes the ring by a Veronese construction and must preserve the projective realization. General toroidal compactifications, their fans and integral models have separate owners.

The arithmetic Artin map rec sends a local uniformizer to arithmetic Frobenius. This document uses Milne's geometric convention art(s)=rec(s)⁻¹ in canonical-model formulas. Reflex norms are multiplicative products of conjugate cocharacters. For a special pair (T,h), its field is the field of definition of that cocharacter, not a field chosen by the user. A canonical model must test every actual special pair from D4 and every finite-adelic representative. A predicate checking an arbitrary designated subset, including an empty subset, cannot replace this requirement. Continuity and independence of the Artin lift are proved inputs.

The full CM algebra E can be a product of CM fields and has degree 2 dim A. The type and its reflex field are supplied by CM.0. V5 owns their application to actual abelian varieties and Siegel special points. It never assumes CM.2 or CM.4, whose proposed development consumes V5. Homological Hodge types are (−1,0) and (0,−1). A polarization retains its Rosati involution and Tate twist. A rational quasi-isogeny is distinct from an integral isogeny or an arbitrary scalar matrix. Integral Tate freeness over a nonmaximal order requires extra lattice hypotheses.

The canonical uniqueness and disjoint-special-reflex-field arguments already have V8 nodes. Their exact statements are imported, rather than duplicated here. Those foundational nodes depend on V1–V4 and are conditional on the canonical-model condition, so importing them does not assume V6 or V7 existence. At assembly their location should be made explicit through the recorded rescoping proposal, preserving identifiers and aliases. V8's tower applications and reflex-field functoriality remain outside this part.

The connected canonical object retains congruence-completed symmetry together with an adelic/Galois extension and its multiplication law. A bare inverse system of connected varieties over Qbar does not determine the full reflex-field model. General conjugation is proved through an actual Serre/Taniyama torsor and a marked special torus. Exceptional noncompact types require the Kazhdan argument. They cannot be reduced away by changing a CM splitting field or by assuming the conclusion as a conjugation axiom.

## Layer overview

| Stage | Purpose | Nodes | Coverage |
| --- | --- | ---: | --- |
| V0 | Arithmetic groups and finite components | 6 | planned |
| V1 | The analytic tower | 6 | planned |
| V2 | Baily–Borel and minimal compactification | 9 | planned |
| V3 | Borel algebraicity and uniqueness | 7 | planned |
| V4 | Torus models and the canonical condition | 8 | planned |
| V5 | CM abelian varieties and Siegel existence | 12 | planned |
| V6 | Hodge and abelian type | 7 | planned |
| V7 | General data: conjugation and descent | 14 | planned |

## V0. Arithmetic groups and finite components

The arithmetic quotient must be understood before its complex structure is glued. The three separate checks are arithmeticity of the rational stabilizer, discreteness of its effective image, and freeness of that image at neat level. The first is stronger than the currently exposed AA.3 discreteness statement. Passing between representatives uses an explicit rational conjugation. Finiteness of the adelic double quotient then turns the full space into a finite disjoint union of connected arithmetic quotients. The simply connected derived-group case gives a sharper abelianized component formula, whose positivity subgroup is retained. This formula is an application of qualified strong approximation and local surjectivity, not a replacement for the general component construction.

### Arithmetic component stabilizers

Declaration **TauCeti.Shimura.stabilizer_arithmetic** (theorem), node `ShimuraVarieties:V0/stabilizer-arithmetic`.

For a pure datum (G,X), component X⁺, compact open K and a∈G(A_f), Γ_a=G(Q)_+∩aKa⁻¹ is an arithmetic subgroup of G(Q), of finite index in G(Q)∩aKa⁻¹. Its image in the effective real automorphism group of X⁺ is arithmetic and discrete. G(Q)_+ means the inverse image of G^ad(R)^+, with compact adjoint factors removed only in the effective image.

The construction or proof follows this route:

1. Use the congruence-intersection arithmeticity theorem of AA.3, not merely its discreteness clause; request the missing commensurability statement.
2. Passing to the finite-index component stabilizer preserves arithmeticity. The algebraic image theorem (Milne 3.2) and removal of the compact ineffective factor give a discrete arithmetic domain image.
3. Distinguish discreteness of Γ in all real group points from discreteness of its domain image: the latter is the input to D5/effective-free.

Direct inputs: `ShimuraData:D5/component-subgroup`, `ShimuraData:D5/effective-kernel`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3`.

Acceptance checks:

- For GL₂ at principal N≥3, the effective stabilizer of ℍ is the image of Γ(N).
- A real-quadratic central unit can lie in Γ_a and act trivially on X⁺; no faithfulness assertion follows.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.2 and 5.13, pp.33,57–58. Atlas planet: **Arithmetic component stabilizers**.

### Commensurability of stabilizers

Declaration **TauCeti.Shimura.stabilizer_commensurable** (theorem), node `ShimuraVarieties:V0/stabilizer-commensurable`.

For fixed G and X⁺, Γ_{a,K} and Γ_{b,L} are commensurable for arbitrary a,b∈G(A_f) and compact open K,L, since they are arithmetic in the same rational group. If b=qak with q∈G(Q)_+, k∈K and L=K, then Γ_b=qΓ_aq⁻¹, and x↦qx identifies their effective quotients.

The construction or proof follows this route:

1. Intersect the two compact open subgroups; their indices over the intersection are finite. Rational intersections and component stabilizers inherit finite indices.
2. Compute the conjugation identity for b=qak, preserving the chosen component.

Direct inputs: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraData:D5/component-subgroup`.

Acceptance checks:

- Commensurability does not require a,b to represent the same double coset.
- Representative change uses q∈G(Q)_+ when X⁺ is fixed.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.13, pp.57–58.

### Cofinal neat congruence sublevels

Declaration **TauCeti.Shimura.neat_sublevels** (theorem), node `ShimuraVarieties:V0/neat-sublevels`.

Every compact open K⊂G(A_f) contains a compact open K₀ normal in K that is rationally neat at every adelic conjugate. The neatness predicate and its representation independence are imported from D5; this theorem proves existence, including normal core and cofinality.

The construction or proof follows this route:

1. Choose a faithful rational representation and a local principal congruence subgroup at an odd prime whose eigenvalue torsion gap forces rational neatness.
2. Intersect with K, then take its finite normal core inside K. Neatness survives subgroups and conjugation.
3. Repeat inside any prescribed open sublevel to prove cofinality.

Direct inputs: `ShimuraData:D5/neat-level`, `ShimuraData:D5/neat-representation-independence`, `ShimuraData:D5/local-torsion-gap`, `AdelicAlgebraicGroups:AA.4/padic-ball-torsion-free`.

Acceptance checks:

- No assertion that all principal level 2 subgroups are neat.
- For GL₂ principal N≥3 use D5/gl2-congruence-neat; N=2 retains −I.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.5 and §5, pp.34,58. Atlas planet: **Neat congruence sublevels**.

### Proper effective arithmetic action

Declaration **TauCeti.Shimura.effective_proper_action** (theorem), node `ShimuraVarieties:V0/effective-proper-action`.

The effective image Γ_a^eff acts properly discontinuously on X⁺; at rationally neat K it acts freely. Thus its orbit projection is a covering map locally biholomorphic once the holomorphic quotient carrier is supplied. No conclusion that Γ_a itself acts freely is drawn.

The construction or proof follows this route:

1. Discreteness from stabilizer-arithmetic combines with the proper symmetric-space action supplied by ALS.0.
2. Use D5/effective-free to exclude effective stabilizers at neat level. Descend charts through disjoint translates; manifold gluing is an explicit requested supplier.

Direct inputs: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraData:D5/effective-free`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- Central totally real units survive neatness but disappear in Γ_a^eff.
- At non-neat level elliptic fixed points remain; the quotient is an analytic space.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.6, 3.11 and 5.13, pp.34,37,58. Atlas planet: **Effective arithmetic action**.

### Finite analytic component decomposition

Declaration **TauCeti.Shimura.component_decomposition** (theorem), node `ShimuraVarieties:V0/component-decomposition`.

For every compact open K, G(Q)_+\G(A_f)/K is finite, and choice of representatives a induces ⨿_a Γ_a\X⁺ ≅ G(Q)\(X×G(A_f)/K), first as topological spaces and then as complex analytic spaces. Changing a=qbk transports the component by q, so the decomposition is independent of representatives up to the specified analytic isomorphisms.

The construction or proof follows this route:

1. Finite index of G(Q)_+ in G(Q) refines AA.3 class finiteness to the plus double cosets.
2. Milne 5.11–5.13 identify representatives and stabilizers by the diagonal rational action.
3. For topology use open finite adelic cosets. For analytic compatibility use the effective quotient charts and representative-change holomorphic maps.

Direct inputs: `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, `ShimuraVarieties:V0/stabilizer-commensurable`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraData:D2/hermitian-domain-components`.

Acceptance checks:

- For the GL₂ datum principal N≥3 yields φ(N) components, not φ(N)/2.
- For a torus singleton domain the components are the finite torus double quotient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemmas 5.11–5.13, pp.57–58. Atlas planet: **Finite component decomposition**.

### Abelianized component formula

Declaration **TauCeti.Shimura.simply_connected_components** (theorem), node `ShimuraVarieties:V0/simply-connected-components`.

Assume G^der is simply connected. Put T=G/G^der and ν:G→T, T(Q)^†=ν(G(Q)_+). Then π₀(Sh_K^an(G,X))≃T(Q)^†\T(A_f)/ν(K). Apply strong approximation only to the semisimple simply connected derived group, whose Q-simple factors have noncompact real points by SV3; never to G or a torus without hypotheses.

The construction or proof follows this route:

1. Use Milne 5.18–5.19 for the required real and nonarchimedean images of ν.
2. Strong approximation in G^der makes fibres of the component map single orbits. Preserve the rational positivity/image subgroup rather than replacing it by T(Q).

Direct inputs: `ShimuraVarieties:V0/component-decomposition`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/shimura-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- For GL₂, T(Q)^†=Q_{>0}; principal level N gives (Z/NZ)×.
- A definite quaternion norm-one group fails the real noncompactness condition.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.17 and Lemmas 5.18–5.19, pp.59–61. Atlas planet: **Abelianized components**.

## V1. The analytic tower

The carrier is a genuine orbit quotient of X×G(A_f), and its universal property controls all point formulas. Charts are descended through the effective arithmetic action. At neat levels these give manifolds; arbitrary levels use normal analytic finite quotients of neat normal sublevels. A level projection and a right translation have different target levels. With R_g([x,a])=[x,ag], the target is g⁻¹Kg. The Hecke span instead uses K∩gKg⁻¹ to give two arrows to level K. Composition uses the fibre product with its double-coset multiplicities, rather than an unjustified single-intersection formula. Datum maps are holomorphic at compatible levels; the closed-immersion assertion requires the small-level separation theorem.

### Finite-level analytic Shimura points

Declaration **TauCeti.Shimura.AnalyticPoints** (definition), node `ShimuraVarieties:V1/analytic-points`.

For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.

The construction or proof follows this route:

1. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.
2. Use the explicit component equivalence of V0 to specify the quotient topology and map points.

Direct inputs: `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/level-quotient`, `mathlib:MulAction.orbitRel.Quotient`, `ShimuraVarieties:V0/component-decomposition`.

The API is driven by these uses: Milne 5.13: component charts use this precise rational diagonal quotient; V8 level-tower: analytic comparison of algebraic level maps.

- **TauCeti.Shimura.AnalyticPoints.mk** (constructor): Send (x,a) to [x,a]_K.
- **TauCeti.Shimura.AnalyticPoints.mk_eq** (characterisation): [x,a]_K=[y,b]_K iff ∃q∈G(Q), k∈K with y=qx and b=qak.
- **TauCeti.Shimura.AnalyticPoints.lift** (universal-property): A function on X×G(A_f) invariant under the rational diagonal and right K actions descends uniquely; evaluation at [x,a] recovers its value.
- **TauCeti.Shimura.AnalyticPoints.level** (functoriality): For K′⊂K send [x,a]_{K′} to [x,a]_K; identity and composition hold.

Discriminating unit tests:

- **TauCeti.Shimura.AnalyticPoints.trivial** (degenerate): The trivial datum has one point at its unique level.
- **TauCeti.Shimura.AnalyticPoints.torus** (compatibility): For singleton torus datum, Sh_K^pts=T(Q)\T(A_f)/K, including the rational quotient.
- **TauCeti.Shimura.AnalyticPoints.keep_domain** (non-example): For GL₂ the fibre of one finite component is Γ_a\ℍ, an infinite set, not a singleton finite double coset.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, definition before Lemma 5.13, p.57. Atlas planet: **Analytic Shimura variety**.

### Complex analytic structure of the tower

Declaration **TauCeti.Shimura.analytic_structure** (theorem), node `ShimuraVarieties:V1/analytic-structure`.

The carrier Sh_K^pts has a canonical normal complex analytic-space structure characterized componentwise by Γ_a^eff\X⁺. If K is rationally neat it is a smooth complex manifold. For general K choose neat normal K′⊂K; the analytic finite quotient by the actual K/K′ action gives the same space, independently of K′.

The construction or proof follows this route:

1. At neat level glue the quotient local charts using holomorphic transition maps.
2. For general level take invariant local holomorphic functions under finite effective stabilizers; normality follows from invariants of normal local rings.
3. Compare normal sublevels through a common neat refinement. Analytic spaces with gluing and finite quotients are requested explicitly.

Direct inputs: `ShimuraVarieties:V1/analytic-points`, `ShimuraVarieties:V0/neat-sublevels`, `ShimuraVarieties:V0/effective-proper-action`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- Smoothness is asserted at neat level only.
- Infinite ineffective central kernels never enter the local finite stabilizer action.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58. Atlas planet: **Analytic tower**.

### Holomorphic finite level maps

Declaration **TauCeti.Shimura.holomorphic_level_maps** (theorem), node `ShimuraVarieties:V1/holomorphic-level-maps`.

For K′⊂K, Sh_{K′}^an→Sh_K^an is finite and holomorphic. If K is neat it is locally biholomorphic; after algebraization in V3 it is finite étale. If K′ is normal, the effective finite permutation group of K/K′ on Sh_{K′} is the deck group and its quotient is Sh_K. For nonnormal K′ no deck group formula is asserted.

The construction or proof follows this route:

1. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.
2. Lift through component quotient charts to prove holomorphicity and local biholomorphicity at neat target.
3. Compute the kernel on all points rather than cancelling K′ formally; a finite quotient may act ineffectively.

Direct inputs: `ShimuraVarieties:V1/analytic-structure`, `AdelicAlgebraicGroups:AA.4/level-covering-map`, `ShimuraVarieties:V0/component-decomposition`, `AdelicAlgebraicGroups:AA.4`.

Acceptance checks:

- The deck group is (K/K′)/ker(action), not invariably K/K′.
- A neat covering source does not remove ramification over elliptic points of a non-neat target.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, p.58; finite-level consequence of the arithmetic covering supplier. Atlas planet: **Holomorphic level maps**.

### Holomorphic right translations

Declaration **TauCeti.Shimura.right_translation** (theorem), node `ShimuraVarieties:V1/right-translation`.

For g∈G(A_f), R_g:Sh_K^an→Sh_{g⁻¹Kg}^an sends [x,a] to [x,ag]. It is a biholomorphism with inverse R_{g⁻¹}; R_h∘R_g=R_{gh} with conjugated intermediate levels. It commutes with level projections.

The construction or proof follows this route:

1. Check g⁻¹Kg is the target level by rewriting akg=ag(g⁻¹kg).
2. On component charts the map uses a rational representative change, hence is holomorphic.
3. Point formulas prove inverse, composition and commutation with level maps.

Direct inputs: `ShimuraVarieties:V1/analytic-structure`, `AdelicAlgebraicGroups:AA.4/level-quotient`.

Acceptance checks:

- The conjugated target is g⁻¹Kg, not gKg⁻¹ for this direction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. Atlas planet: **Holomorphic Hecke translations**.

### Holomorphic Hecke correspondences

Declaration **TauCeti.Shimura.holomorphic_hecke** (theorem), node `ShimuraVarieties:V1/holomorphic-hecke`.

For K_g=K∩gKg⁻¹, the Hecke span is Sh_K^an←Sh_{K_g}^an→Sh_K^an with arrows [x,a]↦[x,a] and [x,a]↦[x,ag]. Both are finite holomorphic, and locally biholomorphic at neat K. Replacing g by k₁gk₂ gives an isomorphic span. Composition is represented by the fibre product of spans and its double-coset decomposition, retaining multiplicities and effective degrees.

The construction or proof follows this route:

1. Use the AA.4 topological span, then holomorphicity of its two factors.
2. For composition take the actual fibre product, not a single intersection level without the AA.4 product hypothesis U′L=U.
3. Enumerate the finite double cosets and identify the component isomorphisms; effective stabilizers correct raw indices.

Direct inputs: `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-level-maps`, `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/hecke-cartesian`, `AdelicAlgebraicGroups:AA.4`.

Acceptance checks:

- Both arrows have target K by the chosen K_g convention.
- Normality of a sublevel alone does not make every Hecke pullback one intersection-level variety.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. Atlas planet: **Holomorphic Hecke correspondences**.

### Holomorphic maps of data

Declaration **TauCeti.Shimura.datum_analytic_map** (theorem), node `ShimuraVarieties:V1/datum-analytic-map`.

A morphism f:(G,X)→(H,Y) and levels f(K)⊂L induce a holomorphic map Sh_K^an(G,X)→Sh_L^an(H,Y), [x,a]↦[f(x),f(a)], compatible with levels and translations. An injective subdatum yields a closed immersion at suitable sufficiently small levels after V3 algebraization; no closed-immersion assertion is made at arbitrary coarse levels.

The construction or proof follows this route:

1. Descend the equivariant map of domain and finite adelic coordinates.
2. Holomorphicity is inherited from the Hodge-domain map, then checked on component quotient charts.
3. Retain Milne 5.16 separation of stabilizers for the suitably small-level embedding, used in V6.

Direct inputs: `ShimuraData:D4/datum-morphism`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V1/right-translation`.

Acceptance checks:

- A noninjective morphism need not be an embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and following clarification, pp.58–59.

## V2. Baily–Borel and minimal compactification

The proof order is rational boundary geometry, compact Satake topology, analytic automorphic sections, convergent separating series, analytic normality, finite generation and projective realization. Chow and GAGA then algebraize that realization. Quasi-projectivity of the open stratum follows from algebraicity of its boundary. This order prevents a circular definition of the section ring. The Koecher range is a statement about boundary codimension: excluding a rational PGL₂ quotient is the relevant hypothesis, not a blanket exclusion of rational rank one. Modular curves retain cusp growth conditions. The primary Baily–Borel arguments for general boundary components and high-weight convergence are identified as a source refinement; Milne's outline is evidence for the route, not a substitute proof.

### Rational boundary components and incidence

Declaration **TauCeti.Shimura.rational_boundary** (theorem), node `ShimuraVarieties:V2/rational-boundary`.

For the effective Hermitian symmetric domain D of a rational semisimple adjoint group, construct its rational boundary components in the bounded realization, selected by rationality of their stabilizing parabolic and the corresponding rational boundary datum. Identify their Hermitian quotients and closure incidence. The rational extension D* is D together with these components, not the full Euclidean boundary.

The construction or proof follows this route:

1. Milne 3.12 describes rational components; the full general boundary classification in BB66 §§1–3 must be source-audited (recorded gap).
2. Use relative parabolic/root data to distinguish the rational components and their incidence. Import general group structure rather than rebuilding it.

Direct inputs: `ShimuraData:D2/hermitian-domain-components`, `ShimuraData:D3/borel-embedding`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite`.

Acceptance checks:

- For ℍ the rational extension adds P¹(Q), not every point of P¹(R).
- The Γ-orbits of rational boundary strata are finite.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, pp.38–39. Atlas planet: **Rational boundary components**.

### Satake topology and compactness

Declaration **TauCeti.Shimura.satake_compactness** (theorem), node `ShimuraVarieties:V2/satake-compactness`.

Equip D* with the rational Satake topology. For arithmetic Γ^eff, Γ^eff\D* is compact Hausdorff, contains Γ^eff\D as an open dense set and has finitely many boundary strata; the topology restricts to the usual complex topology on each stratum.

The construction or proof follows this route:

1. Specify cusp neighborhoods through rational parabolic height coordinates; use AA.3 finite-cover/overlap reduction.
2. Establish compactness and separation by the BB66 §4 rational-boundary construction, whose precise proof audit is a gap.

Direct inputs: `ShimuraVarieties:V2/rational-boundary`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`.

Acceptance checks:

- An anisotropic datum has empty rational boundary and a compact quotient.
- For a modular curve the cusp topology is the q-disk topology.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. Atlas planet: **Satake compactification**.

### Analytic automorphic graded ring

Declaration **TauCeti.Shimura.AutomorphicRing** (definition), node `ShimuraVarieties:V2/analytic-automorphic-ring`.

For a torsion-free effective arithmetic Γ on D, define A_n(Γ) as holomorphic sections of the n-th power of the canonical analytic automorphy factor satisfying the Baily–Borel holomorphy/growth conditions at every rational boundary component. In bounded local coordinates f(γz)det(Dγ_z)^n=f(z); in cusp coordinates allowable Fourier exponents lie in the nonnegative cone. A(Γ)=⊕_{n≥0}A_n with product of sections. One passes to a positive Veronese when required to clear automorphy characters. Cusp forms require additional vanishing and are a different subspace.

The construction or proof follows this route:

1. Define the analytic factor and its cocycle using the derivative of the domain action.
2. State the boundary growth condition before any algebraization; the exact all-type BB66 §§5–9 growth/extension equivalence remains a source gap.
3. Pointwise product preserves growth and grading; restrict to boundary through Siegel operators.

Direct inputs: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraData:D3/homogeneous-variation`, `ComplexComparisonPartII:C0`.

The API is driven by these uses: V2 projective-realization: the graded analytic sections construct the projective embedding without an algebraic bundle assumption; AutomorphicBundles:B2: compares the algebraized bundle/section ring with this analytic construction.

- **TauCeti.Shimura.AutomorphicRing.degree** (data): The degree-n piece is A_n(Γ), with A_0=C on a connected quotient.
- **TauCeti.Shimura.AutomorphicRing.mul** (structure): Multiplication A_m×A_n→A_{m+n} is pointwise tensor product; unit and associativity hold.
- **TauCeti.Shimura.AutomorphicRing.siegel** (projection): Restriction to a rational boundary component is the weight-compatible Siegel operator and commutes with products.
- **TauCeti.Shimura.AutomorphicRing.level** (functoriality): For Γ′⊂Γ, pullback embeds A_n(Γ) into A_n(Γ′); identity and composition hold.
- **TauCeti.Shimura.AutomorphicRing.veronese** (compatibility): Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.

Discriminating unit tests:

- **TauCeti.Shimura.AutomorphicRing.degree_zero** (degenerate): On a connected compactification the degree-zero piece consists of constants.
- **TauCeti.Shimura.AutomorphicRing.elliptic_weight** (compatibility): For ℍ the canonical n-th automorphy factor corresponds to scalar modular weight 2n, with holomorphy at cusps.
- **TauCeti.Shimura.AutomorphicRing.not_cusp** (non-example): At full SL₂ level the Eisenstein series E₄ has nonzero constant coefficient and is an allowed weight-4 form; it is not a cusp form.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39. Atlas planet: **Automorphic graded ring**.

### Automorphic sections separating strata

Declaration **TauCeti.Shimura.poincare_eisenstein** (theorem), node `ShimuraVarieties:V2/poincare-eisenstein`.

For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of Γ\D* and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

The construction or proof follows this route:

1. Construct series using sufficiently high weight and cusp estimates; use reduction to control convergence.
2. Establish rational boundary restrictions, then induction on strata for separation.
3. BB66 §§5–10 are the required primary proof; Milne only supplies the outline, so this is an explicit source-refinement gap, not an assumed separation axiom.

Direct inputs: `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/satake-compactness`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`.

Acceptance checks:

- Point separation alone does not assert an immersion or analytic closed embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38.

### Normal analytic Baily–Borel quotient

Declaration **TauCeti.Shimura.normal_analytic_compactification** (theorem), node `ShimuraVarieties:V2/normal-analytic-compactification`.

The compact Satake quotient Γ\D* has a canonical normal complex analytic-space structure whose sheaf restricts to the invariant holomorphic sheaf on each stratum and whose open stratum is the analytic quotient Γ\D. It agrees with the projective realization by high-weight automorphic sections.

The construction or proof follows this route:

1. Construct local analytic rings using boundary restrictions and normal extension.
2. Use separating sections to compare this ringed structure with local projective charts; the BB66 §§8–10 local-normality proof is a source gap.
3. Apply finite analytic quotient invariants for torsion Γ as well.

Direct inputs: `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/satake-compactness`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- Normality is required, not just a compact topological carrier.
- Non-neat quotients are allowed with finite effective local stabilizers.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(a), pp.38–39.

### Finite generation of automorphic forms

Declaration **TauCeti.Shimura.automorphic_finite_generation** (theorem), node `ShimuraVarieties:V2/automorphic-finite-generation`.

The analytic graded C-algebra A(Γ) is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize Γ\D* as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

The construction or proof follows this route:

1. Establish the ampleness/high-weight realization from the analytic boundary construction.
2. Prove finite generation of the section ring through that realization, not by declaring it algebraic at the outset.
3. Verify invariance under Veronese and under passage to finite invariant rings. The precise primary BB proof remains recorded.

Direct inputs: `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/poincare-eisenstein`.

Acceptance checks:

- The weight-one piece need not itself generate the ring.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(c), pp.38–39. Atlas planet: **Baily–Borel projective realization**.

### Baily–Borel algebraization

Declaration **TauCeti.Shimura.baily_borel** (theorem), node `ShimuraVarieties:V2/baily-borel`.

Every finite-level analytic Shimura variety has a normal quasi-projective C-scheme algebraization, smooth at neat level, with open immersion into its normal projective minimal compactification. Analytification identifies the compactification with the compact rational Satake quotient and identifies its algebraic boundary strata with the analytic arithmetic boundary quotients.

The construction or proof follows this route:

1. Apply Chow to the projective analytic realization and its boundary closed subspaces, importing C4 rather than reproducing it.
2. Normality and the open-stratum analytic comparison supply the quasi-projective open scheme.
3. Use projective GAGA for the coherent ideal and section comparisons; glue the finite components.

Direct inputs: `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`, `ShimuraVarieties:V0/component-decomposition`, `mathlib:AlgebraicGeometry.Scheme`.

Acceptance checks:

- Projective minimal compactifications may be singular even at neat level.
- The construction uses analytic automorphic forms before automorphic-bundle algebraization.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.12 and Remark 3.13, pp.38–39. Atlas planet: **Baily–Borel theorem**.

### Koecher principle and boundary codimension

Declaration **TauCeti.Shimura.koecher** (theorem), node `ShimuraVarieties:V2/koecher`.

If the rational semisimple effective group has no quotient isomorphic over Q to PGL₂, the boundary of the minimal compactification has codimension at least two. In the resulting Koecher range holomorphic canonical-factor automorphic sections have the required boundary growth/extension, yielding the canonical-form section-ring description. In the modular-curve factor case retain cusp conditions and logarithmic canonical forms.

The construction or proof follows this route:

1. Compute dimensions of boundary strata from rational root data; identify the exceptional rational three-dimensional factor.
2. Apply the holomorphic Fourier/Koecher extension argument in codimension at least two.
3. Do not use Q-rank one alone to decide codimension: ball quotients of dimension at least two are rank-one examples with higher-codimension cusps.

Direct inputs: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/baily-borel`.

Acceptance checks:

- Modular curves have codimension-one cusps.
- Rank-one ball quotients need not have divisorial minimal boundary.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(b)–(c), p.39.

### Level maps on minimal compactifications

Declaration **TauCeti.Shimura.minimal_level_extension** (theorem), node `ShimuraVarieties:V2/minimal-level-extension`.

Finite analytic level maps and Hecke right translations extend to the minimal compactifications through rational boundary maps and pullback of analytic automorphic forms. After algebraization these are finite algebraic maps for level changes and algebraic isomorphisms for translations, compatible with composition and the open immersion.

The construction or proof follows this route:

1. Construct the boundary map and compatible graded-ring pullback.
2. Use Proj and the finite/integral ring extension for finite-index arithmetic groups.
3. Compare analytifications and use proper graph algebraicity; extension is uniquely determined by the dense open. The exact general finite-extension source remains a refinement gap.

Direct inputs: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- No claim of étaleness at the boundary.
- Reflex-field descent of these extensions belongs to V8/minimal-descent, not this complex construction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39 and Corollary 3.16 discussion, p.40; general extension proof is a gap.

## V3. Borel algebraicity and uniqueness

Borel's extension theorem is applied on local punctured-polydisk charts of a simple-normal-crossing compactification of a smooth source. The extended graph is proper and is algebraized by the scheme-theoretic graph/Chow supplier. Uniqueness of algebraization comes from applying algebraicity to the prescribed analytic identity and its inverse. The smooth source and torsion-free effective target hypotheses matter: exponential maps to a coarse modular affine line show why arbitrary torsion targets cannot be inserted. The definable proof is a second route. It requires an independently proved comparison of arithmetic and algebraic target definable structures, followed by period-map definability and o-minimal Chow. The corrected BKT maximal-compact and Cartan conditions stay visible, preventing this route from hiding its essential comparison premise.

### Borel extension across punctured polydisks

Declaration **TauCeti.Shimura.borel_extension** (theorem), node `ShimuraVarieties:V3/borel-extension`.

Let D be Hermitian symmetric and Γ^eff a torsion-free arithmetic subgroup of Hol(D)^+. Every holomorphic map (Δ*)^r×Δ^s→Γ^eff\D extends holomorphically to Δ^{r+s}→(Γ^eff\D)^min as a map of complex analytic spaces.

The construction or proof follows this route:

1. Use the invariant metric and arithmetic cusp estimates to establish the big-Picard extension criterion, then its several-variable version (Milne 3.15, citing Borel/Kwack).
2. The extension is into the minimal compactification, not into the open quotient. Uniqueness follows from a dense open and separated analytic target.
3. The original Borel metric proof was not obtained from the public publisher endpoint; its detailed multi-variable proof is a recorded source gap.

Direct inputs: `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V2/baily-borel`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- For a modular curve this specializes to big Picard into its compact curve.
- Torsion-free effective target is part of the statement.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 3.15, p.39. Atlas planet: **Borel extension theorem**.

### Borel algebraicity

Declaration **TauCeti.Shimura.borel_algebraicity** (theorem), node `ShimuraVarieties:V3/borel-algebraicity`.

For torsion-free arithmetic Γ^eff in Hol(D)^+ and a smooth finite-type C-scheme S, every holomorphic map S^an→(Γ^eff\D)^an is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

The construction or proof follows this route:

1. Choose a smooth projective compactification with simple normal-crossing boundary from R09.7d. Its local inclusions are punctured polydisks.
2. Apply extension, glue by uniqueness, and algebraize the proper graph using C4. Restrict to S.
3. For a general smooth separated finite-type source use quasi-projective opens and scheme descent. For nonseparated source the same local gluing works whenever the holomorphic map and analytification are available.

Direct inputs: `ShimuraVarieties:V3/borel-extension`, `AlgebraicModuliForArithmeticGeometry:R09.7d`, `ComplexComparisonPartII:C4`, `ShimuraVarieties:V2/baily-borel`.

Acceptance checks:

- exp:C→A¹=Y(1) is a counterexample when the arithmetic target has torsion.
- The proper graph step does not by itself establish Borel for nonproper sources.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.14 and proof, pp.39–40. Atlas planet: **Borel algebraicity theorem**.

### Unique algebraization at neat level

Declaration **TauCeti.Shimura.unique_algebraization** (theorem), node `ShimuraVarieties:V3/unique-algebraization`.

Any two smooth finite-type C-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models owned by V8.

The construction or proof follows this route:

1. Apply Borel to the identity and inverse between the two analytic quotient descriptions.
2. Faithfulness of analytification identifies composites with identities. No arbitrary analytic automorphism is added to the chosen comparison.

Direct inputs: `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V2/baily-borel`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- The isomorphism is unique relative to the chosen analytic comparison.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Corollary 3.16, p.40. Atlas planet: **Uniqueness of algebraization**.

### Algebraic maps of Shimura data

Declaration **TauCeti.Shimura.algebraic_data_maps** (theorem), node `ShimuraVarieties:V3/algebraic-data-maps`.

Holomorphic maps of data between neat-level analytic varieties algebraize, compatibly with levels, translations, identity and composition. An injective subdatum admits a closed immersion at sufficiently small compatible levels. These statements concern complex algebraizations; reflex-field functoriality is V8.

The construction or proof follows this route:

1. Use Borel into the neat target to algebraize the holomorphic datum map.
2. Apply the precise small-level separation theorem of Milne 5.16 for closed immersions.
3. Check functor laws after analytification, which is faithful.

Direct inputs: `ShimuraVarieties:V1/datum-analytic-map`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/unique-algebraization`.

Acceptance checks:

- An inclusion can identify points at badly chosen larger level.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and 3.16, pp.58–59,40.

### Algebraic finite quotients and normalization

Declaration **TauCeti.Shimura.finite_quotient_algebraization** (theorem), node `ShimuraVarieties:V3/finite-quotient-algebraization`.

For neat normal K′⊂K, the finite group K/K′ acts algebraically on Sh_{K′,C}; its geometric quotient exists as a normal quasi-projective C-scheme and analytifies to Sh_K^an. Quotients through two sublevels agree via common refinement. The source at K′ is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

The construction or proof follows this route:

1. At neat source algebraize translations by Borel into another neat source.
2. Import invariant affine quotients and invariant ample linearizations/finite quotients from the scheme-theoretic supplier; verify the quotient analytic comparison.
3. Normality is preserved by finite invariants; characterize normalization componentwise and use common refinement.

Direct inputs: `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/unique-algebraization`, `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- A quotient with stabilizers is not generally smooth or étale.
- Normalization is in the source field(s), not automatically the target field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Remark 3.13(a), p.39; neat tower p.58; finite quotient supplied by R09.3. Atlas planet: **Finite quotient algebraization**.

### Definable comparison with the algebraic target

Declaration **TauCeti.Shimura.definable_target_comparison** (theorem), node `ShimuraVarieties:V3/definable-target-comparison`.

For a torsion-free effective arithmetic Hermitian quotient Γ\D and a fixed maximal compact K∞ defining its symmetric realization, the R_an,exp structure extending its corrected arithmetic R_alg structure agrees through the Baily–Borel algebraization with the definable structure induced by the C-scheme. This comparison is certified independently of Borel algebraicity.

The construction or proof follows this route:

1. Keep the maximal compact fixed, as required by the BKT erratum; arithmetic morphisms require its corrected Cartan compatibility.
2. Compare definable quotient charts with algebraic Baily–Borel charts using a separately established definability theorem. BKT §4.6 silently uses this agreement; it cannot be deduced from the desired algebraicity of all period maps.
3. The independent PS/KUY comparison source and its hypotheses are a precise supplier-extension gap.

Direct inputs: `ShimuraVarieties:V2/baily-borel`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/orr-schnell-containment`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- The q=e^{2πiz} cusp comparison requires R_an,exp, not merely R_an.
- Do not assert maximal-compact-independent functoriality for arbitrary G/M.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2 and §4.6, pp.2–4,18.

### Definable-graph proof of Borel algebraicity

Declaration **TauCeti.Shimura.definable_borel** (theorem), node `ShimuraVarieties:V3/definable-borel`.

For smooth quasi-projective S over C and a torsion-free effective arithmetic Hermitian quotient Y, a holomorphic S^an→Y^an is algebraic by the definable-graph argument once the independently proved algebraic-target comparison and period-map definability are supplied.

The construction or proof follows this route:

1. Pull back a faithful polarized homogeneous Hodge variation so the map is an actual period map; use BKT 1.3 with its hypotheses, not definability of every arbitrary holomorphic map.
2. Via the independent target comparison, the graph is both closed complex analytic and R_an,exp-definable in (S×Y)^an.
3. Apply the Peterzil–Starchenko o-minimal Chow theorem, then algebraize the graph projection. This named o-minimal theorem/period theorem is requested as a C4 Part II extension, not re-proved here.

Direct inputs: `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraData:D3/polarized-integral-variation`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Using the arithmetic definable structure without comparison with the algebraic target leaves a gap.
- The extension proof remains an independent route and does not depend on this alternative.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §4.6, Theorems 4.12–4.13, p.18. Atlas planet: **Definable Borel algebraicity**.

## V4. Torus models and the canonical condition

Reciprocity supplies a finite continuous Galois action on the actual torus double quotient. At finite level this needs independence only modulo T(Q)K. At the inverse limit the natural values are modulo the closure of T(Q); literal principal equality is a stronger CM fact. The finite Galois-set equivalence constructs a finite étale scheme over the reflex field with these points and actions. The AGHMP stack at non-neat level retains inertia and is compared to its coarse scheme separately. The canonical-model condition uses these genuine special pairs inside any datum. Existence and density of special points, followed by Hecke density, supply the points used to rigidify descent. This stage formulates the condition and constructs the torus instance; it does not assume general existence.

### Milne geometric Artin conversion

Declaration **TauCeti.Shimura.geometricArtin** (definition), node `ShimuraVarieties:V4/geometric-artin`.

Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.

The construction or proof follows this route:

1. Invert the arithmetic Artin homomorphism in its abelian target.
2. Preserve continuity, surjectivity and kernel; compare a local uniformizer and the cyclotomic character before applying CM reciprocity.

Direct inputs: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

The API is driven by these uses: V4 canonical condition: pins the sign in σ[x,a]=[x,r_x(s)a]; V5 main CM theorem: pins the Tate-module scalar normalization.

- **TauCeti.Shimura.geometricArtin_apply** (simp): art_F(s)=rec_F(s)⁻¹.
- **TauCeti.Shimura.geometricArtin_mul** (structure): art_F(st)=art_F(s)art_F(t).
- **TauCeti.Shimura.geometricArtin_kernel** (compatibility): ker art_F=ker rec_F as closed subgroups.
- **TauCeti.Shimura.geometricArtin_norm** (functoriality): For L/F finite, art_F(N_{L/F}s)=res(art_L(s)).

Discriminating unit tests:

- **TauCeti.Shimura.geometricArtin_uniformizer** (computation): At an unramified place, art_F(π_v) is inverse arithmetic Frobenius.
- **TauCeti.Shimura.geometricArtin_one** (degenerate): art_F(1)=1.
- **TauCeti.Shimura.geometricArtin_cyclotomic** (compatibility): For u=χ_cyc(σ)∈Zhat×, art_Q(u)=σ on Q^ab; changing to rec reverses the action.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), §3, p.21, before Lemma 3.4.

### Reflex norm of a special torus

Declaration **TauCeti.Shimura.ReflexNorm** (definition), node `ShimuraVarieties:V4/reflex-norm`.

For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).

The construction or proof follows this route:

1. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.
2. Check Galois invariance of the product formula and descend the morphism over Q.
3. Evaluate on restricted adelic points and prove rational-principal and level compatibility.

Direct inputs: `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.1/base-change-adelic`.

The API is driven by these uses: V4 torus-model: defines its finite Galois-set action; CM.2 normalized-idele-torsion-dictionary: compares the global scalar with polarized CM lattice reciprocity.

- **TauCeti.Shimura.ReflexNorm.apply_split** (simp): In splitting coordinates r_h(s)=∏ρ ρ(μ_h(s_ρ)).
- **TauCeti.Shimura.ReflexNorm.principal** (compatibility): For b∈E×, r_h(b)∈T(Q), hence its action on every torus double quotient is trivial.
- **TauCeti.Shimura.ReflexNorm.map** (functoriality): For a torus subdatum morphism f, after norm from a common reflex field, f∘r_h=r_{f∘h}; retain the field-change norm.
- **TauCeti.Shimura.ReflexNorm.cm_type** (compatibility): For the CM torus datum supplied by D5/cm-torus and CM.0, r_h agrees with the multiplicative reflex-type norm.
- **TauCeti.Shimura.ReflexNorm.continuous** (structure): The finite-idelic map is a continuous group homomorphism.

Discriminating unit tests:

- **TauCeti.Shimura.ReflexNorm.trivial** (degenerate): A trivial cocharacter gives the constant identity morphism.
- **TauCeti.Shimura.ReflexNorm.split_power** (computation): For T=G_m, E=Q and μ(t)=t^n, r_h(s)=s^n, including n=0 and negative n.
- **TauCeti.Shimura.ReflexNorm.aghmp** (compatibility): For T=Res_{E/Q}G_m/ker(N_{F/Q}) in AGHMP §3.1 and its distinguished cocharacter, r_h is the natural quotient map Res_E G_m→T.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §12, formulas (60)–(61), p.114, corrected from sums to products. Atlas planet: **Reflex norm**.

### Finite-level reciprocity and idele independence

Declaration **TauCeti.Shimura.reciprocity_finite_action** (theorem), node `ShimuraVarieties:V4/reciprocity-finite-action`.

For a torus datum (T,h) and compact open K, the action of r_h(s) on the finite set T(Q)\T(A_f)/K factors continuously through Gal(E^ab/E) via art_E. Thus equal Artin lifts act identically at every level. At the full tower the natural reciprocity values lie in T(A_f)/closure(T(Q)); do not replace the closure by T(Q) without the needed additional CM norm lemma.

The construction or proof follows this route:

1. Principal ideles act through T(Q); infinite connected ideles are killed in the finite quotient. Continuity kills the closure of the Artin kernel.
2. Factor through the finite quotient Galois action, whose point stabilizers are open.
3. For general special points insert this torus map into the datum and pass through the double-quotient point map.

Direct inputs: `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V0/component-decomposition`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- For torus levels, dependence only on Artin follows modulo T(Q)K; literal equality of reflex-norm ideles is unnecessary.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), §2, pp.3–4, reciprocity map and its finite-level action. Atlas planet: **Special-point reciprocity**.

### Canonical-model condition

Declaration **TauCeti.Shimura.CanonicalModel** (definition), node `ShimuraVarieties:V4/canonical-model`.

A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.

The construction or proof follows this route:

1. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.
2. Use reciprocity-finite-action to make the formula independent of the lift.
3. Record finite-level and compatible-tower variants and compare them via sufficiently small levels.

Direct inputs: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraData:D4/special-pair`, `ShimuraData:D3/reflex-field`, `ShimuraVarieties:V4/reciprocity-finite-action`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Over`.

The API is driven by these uses: V5 Siegel canonical model: main CM theorem verifies the condition on all CM special points; V6 inheritance and V7 descent: prove existence for actual data; V8 model-uniqueness: uses this complete condition and adelic functoriality.

- **TauCeti.Shimura.CanonicalModel.scheme** (projection): The underlying scheme is over Spec E(G,X), with normal/quasi-projective structure.
- **TauCeti.Shimura.CanonicalModel.comparison** (projection): The chosen comparison is an isomorphism of complex analytic spaces after base change to C.
- **TauCeti.Shimura.CanonicalModel.special_rational** (data): For every actual special pair and a, the comparison point is E(T,h)^ab-rational.
- **TauCeti.Shimura.CanonicalModel.special_action** (characterisation): Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
- **TauCeti.Shimura.CanonicalModel.level** (functoriality): A tower supplies level maps over E, with identity/composition and analytic point formula.
- **TauCeti.Shimura.CanonicalModel.baseChange** (compatibility): For E⊂L⊂C, base change retains the same comparison and restricted special-point action; the defining minimal field remains E.

Discriminating unit tests:

- **TauCeti.Shimura.CanonicalModel.trivial** (degenerate): The trivial datum has canonical model Spec Q with its one-point comparison.
- **TauCeti.Shimura.CanonicalModel.torus_neat** (compatibility): The finite étale torus model satisfies this condition using its constructed Galois action.
- **TauCeti.Shimura.CanonicalModel.not_arbitrary_subset** (non-example): A model tested only on an empty chosen special subset does not satisfy the definition; every D4 special pair is required.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 12.8, p.114 and Proposition 12.10, p.115. Atlas planet: **Canonical model**.

### Finite étale torus canonical models

Declaration **TauCeti.Shimura.torusModel** (construction), node `ShimuraVarieties:V4/torus-model`.

The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.

The construction or proof follows this route:

1. Apply the finite-étale-scheme/finite-continuous-Galois-set equivalence with its field/base-change comparison.
2. Use the actual finite torus double quotient as the Galois set, not just its cardinality.
3. Transport its complex point equivalence and verify all torus special-pair reciprocity maps by norm functoriality.

Direct inputs: `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/canonical-model`, `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

The API is driven by these uses: V4 functoriality: constructs maps by finite Galois sets; AGHMP §3.1: its neat CM Shimura scheme is this specific torus construction; V8 zero-dimensional-shimura-variety: adds the general zero-dimensional component datum and tower reciprocity beyond singleton torus data.

- **TauCeti.Shimura.torusModel.points** (equivalence): S_K(Qbar)≃T(Q)\T(A_f)/K as Galois sets, with the prescribed action.
- **TauCeti.Shimura.torusModel.level** (functoriality): For K′⊂K the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
- **TauCeti.Shimura.torusModel.translate** (functoriality): Right translation by a∈T(A_f) is defined over E and commutes with reciprocity.
- **TauCeti.Shimura.torusModel.map** (functoriality): A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
- **TauCeti.Shimura.torusModel.finiteEtale** (structure): The resulting scheme is finite étale over E, with degree equal to the Galois-set cardinality.

Discriminating unit tests:

- **TauCeti.Shimura.torusModel.maximal_split** (computation): For T=G_m, h(z)=z zbar, K=Zhat×, E=Q, the coarse scheme is Spec Q.
- **TauCeti.Shimura.torusModel.split_level_five** (computation): For the same datum and principal K(5), the Galois set is (Z/5Z)×/{±1}; the degree-two model is Q(ζ₅+ζ₅⁻¹), not Q(ζ₅).
- **TauCeti.Shimura.torusModel.trivial** (degenerate): For the trivial torus every level gives Spec Q.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, p.416. Atlas planet: **Torus canonical models**.

### AGHMP torus stack and coarse model

Declaration **TauCeti.Shimura.aghmp_stack_comparison** (theorem), node `ShimuraVarieties:V4/aghmp-stack-comparison`.

For the specific AGHMP torus T=Res_{E/Q}G_m/ker(N_{F/Q}), distinguished cocharacter and neat normal K′⊂K, the generic CM Shimura stack is [S_{K′}/(K/K′)]. Its coarse space is S_K, independent of K′; at neat K it is the finite étale scheme above. At non-neat K retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

The construction or proof follows this route:

1. Use the §3.1 computation that the reflex norm is the quotient map.
2. Construct the quotient stack through the stack supplier and compute the coarse quotient Galois set.
3. Verify common-refinement independence. Keep stabilizer data at non-neat level; the generic scheme alone cannot encode it.

Direct inputs: `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/reflex-norm`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Acceptance checks:

- For an imaginary quadratic E at maximal units, roots of unity contribute stack inertia even when the coarse scheme has one geometric point.
- Do not claim a finite DM stack for an arbitrary torus with infinite rational central-unit stabilizers.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, pp.415–416.

### Existence and density of special points

Declaration **TauCeti.Shimura.special_existence** (theorem), node `ShimuraVarieties:V4/special-existence`.

Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in X in its real topology, hence their images are Zariski dense in each complex algebraized component.

The construction or proof follows this route:

1. Choose a regular semisimple Lie element in the compact-mod-centre real Cartan; approximate by a rational regular semisimple element.
2. Its rational maximal torus supports the conjugated special homomorphism. Apply the same construction near arbitrary domain points.

Direct inputs: `ShimuraData:D4/special-point`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraVarieties:V2/baily-borel`.

Acceptance checks:

- The rational approximant must remain regular semisimple, not merely a regular nilpotent element.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.3, p.117.

### Density of Hecke translates

Declaration **TauCeti.Shimura.hecke_density** (theorem), node `ShimuraVarieties:V4/hecke-density`.

For any x∈X, the finite-level set {[x,a]_K:a∈G(A_f)} is Zariski dense in Sh_{K,C}. In particular the Hecke translates of a fixed actual special point are dense. This uses real approximation in G(Q)_+, not unrestricted strong approximation in G(A_f).

The construction or proof follows this route:

1. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.
2. Rewrite rational domain translates through the diagonal equivalence as finite-adelic Hecke translates.
3. Real analytic density implies algebraic Zariski density on each component.

Direct inputs: `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V2/baily-borel`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- This does not assert that each arithmetic Γ orbit in D is dense.
- The torus case says its finite Hecke orbit is the entire finite set.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.5, p.118. Atlas planet: **Hecke orbit density**.

## V5. CM abelian varieties and Siegel existence

The relative weight-one analytic equivalence is algebraized through Siegel moduli and V3, with integral polarization type and level retained. Full product-CM objects are then descended to number fields so that reduction and Frobenius apply. Rank-one Tate modules and Rosati conjugation prove potential good reduction. The Shimura–Taniyama valuation formula yields an ideal reciprocity theorem using arithmetic Artin; passing through ray classes and all finite torsion levels produces the idelic theorem in geometric Artin normalization. The polarized Tate formula is needed to identify the actual Siegel moduli point, rather than only an unpolarized isogeny class. Every Siegel special point is full CM, including products, so the theorem verifies the complete canonical-model condition. No PEL canonical-model theorem is assumed on this route.

### Algebraization of polarized weight-one variations

Declaration **TauCeti.Shimura.weight_one_algebraization** (theorem), node `ShimuraVarieties:V5/weight-one-algebraization`.

Over a smooth finite-type C-scheme S, the relative analytic equivalence between polarized abelian families and polarizable integral variations of homological types (−1,0),(0,−1) algebraizes: every such variation gives an abelian scheme, and morphisms correspond to morphisms of variations. Polarization type and actual integral level are retained.

The construction or proof follows this route:

1. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.
2. Borel algebraizes its classifying map into the neat arithmetic quotient. Pull back the universal abelian scheme and descend through the level cover.
3. Algebraize homomorphisms via the relative moduli/rigidity and proper comparison, not a claim that all holomorphic functions on S are algebraic.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A5`, `PELModuli:M3`, `ShimuraVarieties:V3/borel-algebraicity`, `AbelianSchemesAndArithmeticModuli:A3`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Homology conventions are (−1,0),(0,−1); the cohomological dual is not identified without dualization.
- Do not assume PEL M4 canonical models to prove the Siegel model.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.8, p.122; algebraization through M3 and V3. Atlas planet: **Weight-one algebraization**.

### CM abelian varieties with their algebra action

Declaration **TauCeti.Shimura.CMAbelianVariety** (definition), node `ShimuraVarieties:V5/cm-abelian-variety`.

For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

The construction or proof follows this route:

1. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.
2. Identify the eigenspaces through A5 and apply CM.0 type definitions.
3. Use Rosati positivity for the polarization compatibility; do not build a new CM-type carrier here.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A2`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`.

The API is driven by these uses: V5 main theorem: its actual E-linear Tate representation is compared with reflex reciprocity; V5 Siegel-special-CM: tests every special point of the Siegel datum; CM.2 arbitrary-dimensional-classification: imports the full general CM reciprocity theorem.

- **TauCeti.Shimura.CMAbelianVariety.action** (data): The injective E-action on the actual abelian variety is part of the data.
- **TauCeti.Shimura.CMAbelianVariety.type** (projection): The type is the subset of embeddings appearing in Lie(A), using the imported CM.0 definition.
- **TauCeti.Shimura.CMAbelianVariety.homology** (compatibility): H₁(A,Q) is free of rank one over E, with eigenspace decomposition Φ in Lie(A).
- **TauCeti.Shimura.CMAbelianVariety.transport** (functoriality): An E-linear quasi-isogeny transports the full action and type; identity/composition hold.
- **TauCeti.Shimura.CMAbelianVariety.rosati** (characterisation): A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.

Discriminating unit tests:

- **TauCeti.Shimura.CMAbelianVariety.quadratic** (computation): An elliptic curve with an imaginary quadratic embedding in End⁰ has a full CM action of degree two.
- **TauCeti.Shimura.CMAbelianVariety.product** (compatibility): The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
- **TauCeti.Shimura.CMAbelianVariety.insufficient_degree** (non-example): A scalar Q-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, p.123; field case §10. Atlas planet: **CM abelian varieties**.

### Rank-one rational CM Tate module

Declaration **TauCeti.Shimura.cm_tate_rank_one** (theorem), node `ShimuraVarieties:V5/cm-tate-rank-one`.

For a full CM action (A,E), V_fA is free of rank one over E⊗_Q A_f, compatibly with H₁(A,Q)⊗A_f and with quasi-isogenies. If End(A)∩E=O_E, T_ℓA is free of rank one over O_E⊗Z_ℓ. For a nonmaximal order only the rational freeness is asserted without additional integral hypotheses. Quasi-isogenies act faithfully on V_fA.

The construction or proof follows this route:

1. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.
2. At maximal order the integral lattice is locally an invertible O_E-module, yielding integral freeness.
3. Use injectivity of rational Hom on Tate modules for uniqueness of a quasi-isogeny.

Direct inputs: `ShimuraVarieties:V5/cm-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- The rational rank statement includes product CM algebras.
- An integral rank-one claim over an arbitrary nonmaximal order needs an invertible lattice hypothesis.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison 2007c §1.7.

### Number-field models for full CM objects

Declaration **TauCeti.Shimura.cm_number_field_model** (theorem), node `ShimuraVarieties:V5/cm-number-field-model`.

A full CM abelian variety over C, with its finitely specified endomorphisms, polarization and finite level, admits a model over a number field after replacing its base by a finite extension. This establishes that CM reduction and arithmetic Frobenius arguments apply to actual complex points.

The construction or proof follows this route:

1. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.
2. Extend the field to define the action/polarization/level. Do not assert that every arbitrary complex abelian variety has a number-field model.
3. The detailed CM moduli rigidity/descent proof is a specific source refinement, separated from the main theorem.

Direct inputs: `ShimuraVarieties:V5/cm-abelian-variety`, `PELModuli:M3`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/trace-reflex-field`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The field must define the CM action before the Galois representation is scalar E-linear.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.3 and proof, pp.100–101.

### Potential good reduction for CM varieties

Declaration **TauCeti.Shimura.cm_potential_good_reduction** (theorem), node `ShimuraVarieties:V5/cm-potential-good-reduction`.

A full CM abelian variety over a number field has potentially good reduction at every finite place. With all E-endomorphisms defined, the inertia image on V_ℓA is finite for ℓ different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

The construction or proof follows this route:

1. The rank-one E-linear inertia representation and Rosati/polarization constrain the inertia image to a finite group.
2. Kill it after a finite extension and apply the imported general NOS criterion; keep this independent of the elliptic j-integrality argument.

Direct inputs: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-tate-rank-one`, `AbelianSchemesAndArithmeticModuli:A2`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`.

Acceptance checks:

- This is potential good reduction, not good reduction over the original field.
- The proof is valid in higher dimension.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 and proof, p.101. Atlas planet: **Potential good CM reduction**.

### CM Frobenius endomorphism

Declaration **TauCeti.Shimura.cm_frobenius** (theorem), node `ShimuraVarieties:V5/cm-frobenius`.

Let A/k have full CM by O_E with the action defined over k, let k/Q be Galois containing all conjugates of E, and let P be a good reduction prime of residue cardinality q. The q-power Frobenius of the reduction is represented by π∈O_E under the specialized CM action, with ππbar=q for a compatible polarization.

The construction or proof follows this route:

1. Specialize the endomorphism action; the good-reduction Tate comparison identifies Frobenius with an E-linear scalar.
2. The full CM centralizer, endomorphism comparison and integrality place the scalar in O_E; the detailed positive-characteristic Hom comparison is a supplier request, not a rank-one linear-algebra shortcut.
3. Polarization identifies the conjugate product with q.

Direct inputs: `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- The Frobenius is arithmetic q-power on the reduction; V4 art is its inverse on Galois reciprocity.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 10.9 and proof, p.103.

### Shimura–Taniyama Frobenius calculation

Declaration **TauCeti.Shimura.shimura_taniyama** (theorem), node `ShimuraVarieties:V5/shimura-taniyama`.

Under the preceding good-reduction/maximal-order/Galois-field hypotheses, for every v|p put H_v={φ:E→k:φ⁻¹P=v}. The Frobenius π satisfies ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Equivalently the principal ideal (π) is the product over φ∈Φ of φ⁻¹(N_{k/φE}P), and agrees with the reflex norm of N_{k/E*}P. State the ramified-prime formula using normalized valuations; the clean unramified ideal proof suffices for the subsequent prime-generation argument.

The construction or proof follows this route:

1. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).
2. Use type counting to identify the valuation at each CM prime.
3. Translate the product ideal through the reflex norm. For product algebras use the torus norm; the field reflex-type formula alone is not a product reflex type.

Direct inputs: `ShimuraVarieties:V5/cm-frobenius`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`, `ShimuraVarieties:V4/reflex-norm`, `AbelianSchemesAndArithmeticModuli:A4`.

Acceptance checks:

- For CM elliptic curves an inert prime has slope 1/2; a split prime has slopes 0 and 1.
- Valuations are normalized ratios, not a raw count independent of ramification.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 10.10, p.103 and proof pp.104–105; 2007c Theorem 2.1. Atlas planet: **Shimura–Taniyama formula**.

### CM ideal reciprocity with prime generation

Declaration **TauCeti.Shimura.cm_ideal_reciprocity** (theorem), node `ShimuraVarieties:V5/cm-ideal-reciprocity`.

For A/C with CM by O_E and type Φ, integer m>0 and σ fixing E*, there is an ideal multiplication α:A→σA acting as σ on A[m]. Its ray ideal class is determined by σ on a sufficiently divisible reflex ray class field and is the reflex-norm ideal class of an ideal b whose arithmetic Artin symbol is σ. This ideal statement uses arithmetic Artin; V5/main-CM converts to geometric art for ideles.

The construction or proof follows this route:

1. Same type gives an E-linear quasi-isogeny. Approximate its scalar at the finitely many primes dividing m to make it agree with σ on m-torsion.
2. Compose ideal multiplications to obtain a finite ray-class homomorphism; prove its continuity via finite torsion and a model field.
3. At almost every suitable good unramified prime use Shimura–Taniyama. Dirichlet/Chebotarev prime generation of ray classes extends equality to every class.

Direct inputs: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/shimura-taniyama`, `ShimuraVarieties:V5/cm-tate-rank-one`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`.

Acceptance checks:

- Equality only on a few Frobenius elements is insufficient; excluded primes form a finite set and remaining primes generate every ray class.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.2, pp.19–20.

### Main theorem of complex multiplication

Declaration **TauCeti.Shimura.main_cm** (theorem), node `ShimuraVarieties:V5/main-cm`.

Let (A,i:E→End⁰A) be full CM over C, allowing a CM product algebra, with type Φ and reflex field E*. For σ∈Aut(C/E*) and a finite idele s∈A_{f,E*}× with art_{E*}(s)=σ|E*ab, there is a unique E-linear quasi-isogeny α:A→σA satisfying α(r_Φ(s)x)=σx for every x∈V_fA. If s′ has the same Artin image and r_Φ(s′)=a r_Φ(s), a∈E×, replace α by α∘a⁻¹. The existence of this a is proved by the norm-kernel lemmas in the CM setting, not asserted for arbitrary tori.

The construction or proof follows this route:

1. Reduce by an E-linear quasi-isogeny to maximal integral order. Choose an E-linear comparison with σA and extract its rank-one Tate scalar η(σ).
2. The ideal theorem identifies η(σ)/r_Φ(s) modulo every finite torsion level. The conjugation/norm-one condition removes the residual closure ambiguity (2007c 3.6–3.12), using the norm local-global theorem.
3. Faithfulness on the rational Tate module gives uniqueness. Transport back through the chosen E-isogeny.

Direct inputs: `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- The quasi-isogeny is unique for a fixed s; changing s changes the quasi-isogeny.
- σ is required to fix the reflex field, not necessarily the CM field itself as an embedded subfield.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24. Atlas planet: **Main theorem of complex multiplication**.

### Polarization and level in CM reciprocity

Declaration **TauCeti.Shimura.cm_polarization_level** (theorem), node `ShimuraVarieties:V5/cm-polarization-level`.

For α from the main CM theorem and a compatible polarization form ψ with Rosati conjugation, ψ_{σA}(αx,αy)=c ψ_A(x,y) where c=χ_cyc(σ)/N_{E*/Q}(s)∈Q_{>0}. The actual Tate twist in ψ:A_f×A_f→A_f(1) is retained. For an adelic symplectic level representative, σ transport equals the reflex-norm action modulo the chosen level and the E-linear quasi-isogeny.

The construction or proof follows this route:

1. Use ψ_{σA}(σx,σy)=χ_cyc(σ)ψ_A(x,y), Rosati conjugation and r_Φ(s)r_Φ(s)bar=N_{E*/Q}(s).
2. Class field theory identifies the quotient scalar as a positive rational number.
3. Apply the formula to the actual symplectic Tate trivialization and its K-orbit, not a raw matrix without the quasi-isogeny equivalence.

Direct inputs: `ShimuraVarieties:V5/main-cm`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2`, `ShimuraVarieties:V4/geometric-artin`.

Acceptance checks:

- The similitude factor is χ/N, not N/χ in this α convention.
- An equality of unpolarized CM isogeny classes does not by itself prove the Siegel canonical condition.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(c), pp.22–23.

### Siegel special points are full CM

Declaration **TauCeti.Shimura.siegel_special_cm** (theorem), node `ShimuraVarieties:V5/siegel-special-cm`.

For the Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree 2g. Products are included, so all special points rather than only simple CM fields are covered.

The construction or proof follows this route:

1. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.
2. By complete reducibility and positive Rosati involution, a torus Mumford–Tate action gives a full CM algebra in the endomorphisms. Conversely a full CM algebra forces a torus Hodge image.

Direct inputs: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraData:D5/siegel-datum`, `ShimuraData:D4/special-point`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- A product of CM elliptic curves is included.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124.

### The Siegel canonical model

Declaration **TauCeti.Shimura.siegel_canonical** (theorem), node `ShimuraVarieties:V5/siegel-canonical`.

The rational polarized Siegel moduli model with the actual adelic symplectic level is a canonical model over the Siegel reflex field Q. Its complex uniformization is the V1/V3 Siegel variety; for every actual special point its Galois action is precisely V4 reciprocity, including polarization, quasi-isogeny and level.

The construction or proof follows this route:

1. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.
2. For every special point use the product-algebra CM criterion and main theorem to identify Galois transport of the represented polarized level object.
3. Compare its scalar action with the special-pair cocharacter reflex norm. Extend to all levels via finite quotients.

Direct inputs: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V4/canonical-model`, `PELModuli:M3`, `ShimuraData:D5/siegel-reflex-dual`.

Acceptance checks:

- This is a constructed instance, not a typeclass assumption that a model exists.
- The genus-one determinant/Weil-pairing identification at full level is exported to V8.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.12 and existence proof, pp.125–126. Atlas planet: **Siegel canonical model**.

## V6. Hodge and abelian type

A subdatum inherits a canonical model by proving that its suitably small-level image is stable under the appropriate descent comparisons, using special points and reciprocity. An arbitrary complex subvariety of a rational variety need not descend. A Hodge-type embedding into Siegel therefore gives the Hodge-type tower, with uniqueness removing the embedding choice. For abelian type, the witness concerns the connected derived datum. Products and central isogenies act through the completed symmetry; finite effective quotients descend that symmetry and special-point action. The connected/full equivalence then reconstructs the component Galois action over the target reflex field. It is this reconstruction, not equality of two witnesses' components, that gives the full abelian-type model.

### Inheritance by Shimura subdata

Declaration **TauCeti.Shimura.hodge_inheritance** (theorem), node `ShimuraVarieties:V6/hodge-inheritance`.

If i:(G,X)↪(H,Y) is a Shimura subdatum and (H,Y) has a canonical tower, then (G,X) has a canonical tower over E(G,X), whose suitable neat levels embed into the ambient tower after base change to a common reflex field. Descent of the image to E(G,X) is proved using actual special points and their reciprocity, not by claiming every C-subvariety of a model descends.

The construction or proof follows this route:

1. Use the small-level closed-immersion theorem and transport the ambient Galois action on special points.
2. Field-disjoint special reflex fields and Hecke density establish invariance and the unique descent maps for the image.
3. Apply effective quasi-projective descent with continuity supplied by the finite orbit argument; construct all levels and verify reciprocity.

Direct inputs: `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- Same derived group alone does not identify full Shimura varieties.
- No absolute-Hodge tensors are assumed in this bare-existence route.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.14, p.127. Atlas planet: **Canonical-model inheritance**.

### Canonical models of Hodge type

Declaration **TauCeti.Shimura.hodge_canonical** (theorem), node `ShimuraVarieties:V6/hodge-canonical`.

Every Hodge-type datum of D4 has a canonical tower over its reflex field, by choosing its actual embedding into a Siegel datum, applying Siegel existence and subdatum inheritance. The resulting tower is independent of the embedding through canonical-model uniqueness.

The construction or proof follows this route:

1. Choose the symplectic embedding supplied by the definition of Hodge type.
2. Apply hodge-inheritance to the constructed Siegel model.
3. Use V8 uniqueness only after both candidate models satisfy the full V4 condition; its foundational dependencies are checked to avoid a cycle.

Direct inputs: `ShimuraData:D4/hodge-type`, `ShimuraVarieties:V5/siegel-canonical`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V8/model-uniqueness`.

Acceptance checks:

- No new Hodge-type definition is introduced.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.14, p.127. Atlas planet: **Hodge-type canonical models**.

### Connected Shimura tower with completed symmetry

Declaration **TauCeti.Shimura.ConnectedTower** (construction), node `ShimuraVarieties:V6/connected-tower`.

For the connected derived datum (G^der,X⁺), form M⁰=lim_Γ Γ\X⁺ over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.

The construction or proof follows this route:

1. Construct the congruence-indexed inverse system and its compatible symmetry, as in the 1983 appendix.
2. Use the Deligne completed-symmetry construction to define the connected canonical datum with actual Galois compatibility. Its exact extension/coherence source must be checked separately, recorded as a gap.

Direct inputs: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`.

The API is driven by these uses: V6 connected-full-equivalence: the completed/Galois symmetry reconstructs all components; Milne 1983 §§1–6: the conjugation proof is carried out on this connected pro-object.

- **TauCeti.Shimura.ConnectedTower.level** (projection): The Γ-level is the actual algebraized quotient Γ\X⁺.
- **TauCeti.Shimura.ConnectedTower.transition** (functoriality): Subgroup inclusion gives finite algebraic maps; identity and composition hold.
- **TauCeti.Shimura.ConnectedTower.completedAction** (structure): The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
- **TauCeti.Shimura.ConnectedTower.canonicalExtension** (data): The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.

Discriminating unit tests:

- **TauCeti.Shimura.ConnectedTower.trivial** (degenerate): A trivial derived group gives the one-point connected tower.
- **TauCeti.Shimura.ConnectedTower.sl2** (compatibility): For the GL₂ datum the connected tower is the congruence tower Γ\ℍ induced by SL₂, with effective ±I removed where present.
- **TauCeti.Shimura.ConnectedTower.not_full** (non-example): A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127; 1983 Appendix, p.263. Atlas planet: **Connected Shimura tower**.

### Connected and full canonical formulations

Declaration **TauCeti.Shimura.connected_full_equivalence** (theorem), node `ShimuraVarieties:V6/connected-full-equivalence`.

A pure Shimura datum admits a full canonical model over E(G,X) if and only if its connected derived tower admits the connected canonical structure with completed adelic/Galois symmetry of V6/connected-tower. The comparison reconstructs finite components and their reciprocity, preserving the completion action; forgetting this symmetry invalidates the equivalence.

The construction or proof follows this route:

1. Use Deligne 2.7.13/Milne 14.15 to restrict and reconstruct the components with the extension action.
2. Check the Artin action on component classes and the stabilizing completion subgroup.
3. The precise connected extension and gluing formulas remain a primary-source refinement, explicitly shared with connected-tower.

Direct inputs: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/canonical-model`.

Acceptance checks:

- The assertion is not an isomorphism between connected and full varieties.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127.

### Products of connected canonical models

Declaration **TauCeti.Shimura.connected_products** (theorem), node `ShimuraVarieties:V6/connected-products`.

The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

The construction or proof follows this route:

1. Take product inverse systems and product level quotients.
2. Use reflex-norm functoriality to compare marked tori and the Galois extension.
3. Apply compatible finite-component descent where the full datum is reconstructed.

Direct inputs: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraData:D4/product-datum`.

Acceptance checks:

- Product datum reflex field is the compositum, not necessarily either individual field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.16(a), p.127.

### Central-isogeny descent of connected models

Declaration **TauCeti.Shimura.central_isogeny_descent** (theorem), node `ShimuraVarieties:V6/central-isogeny-descent`.

For a central isogeny f:G₁→G₂ of semisimple derived groups with compatible connected data and a connected canonical model of (G₁,X₁⁺), the connected tower for (G₂,X₂⁺) is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be G₁, correcting the repeated G₂ misprint.

The construction or proof follows this route:

1. Compute the map of completed adjoint rational symmetry and its kernel; finite-level images act on the source quotient.
2. Construct the effective finite algebraic quotients and descend their Galois symmetry.
3. Verify reciprocity by central-isogeny compatibility of the cocharacter norm; compare the inverse systems.

Direct inputs: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraData:D4/central-isogeny-lift`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- This gives a quotient, not an identification of full varieties with the same derived group.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.16(b), p.127. Atlas planet: **Central-isogeny descent**.

### Canonical models of abelian type

Declaration **TauCeti.Shimura.abelian_canonical** (theorem), node `ShimuraVarieties:V6/abelian-canonical`.

Every abelian-type datum as defined in D4 admits a canonical tower over its reflex field. Use the Hodge-type witness, products and central-isogeny descent for the connected derived datum, then connected-full-equivalence. The full components and reflex-field action are reconstructed rather than identified with those of the Hodge-type witness.

The construction or proof follows this route:

1. Apply the actual abelian-type central-isogeny relation to the derived connected data.
2. Descend the Hodge-type connected model through its completion kernel; reconstruct the target full tower.
3. Check V4 on all special pairs and use uniqueness to remove witness choices.

Direct inputs: `ShimuraData:D4/abelian-type`, `ShimuraVarieties:V6/hodge-canonical`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/connected-full-equivalence`.

Acceptance checks:

- This branch does not depend on V7 general-data conjugation.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §14, pp.127–128. Atlas planet: **Abelian-type canonical models**.

## V7. General data: conjugation and descent

The general proof separates existence of a weak conjugation comparison, identification of its target by a marked special torus, compatibility with completed symmetry, independence of the marking, and continuous descent. Reduction reaches a simply connected almost Q-simple restriction-of-scalars group over a totally real field. A further totally real extension makes the marked torus CM-quadratically split; rank-one subdata and their centre intersection then identify the marked comparison. The weak comparison uses Kazhdan uniformization and precisely ranked S-arithmetic rigidity. Weyl-length induction and real local cohomology compare different special tori. The resulting cocycle is still not effective descent until its continuity is proved. A finite rigidifying set in a dense special Hecke orbit provides that continuity through Milne's corrected 1999 descent criterion.

### Reduction to simple simply connected data

Declaration **TauCeti.Shimura.simple_connected_reduction** (theorem), node `ShimuraVarieties:V7/simple-connected-reduction`.

To prove general canonical-model existence it suffices to prove marked conjugation with completed symmetry for connected data whose group is semisimple simply connected and almost Q-simple. Such a group is Res_{F/Q}G′ for a totally real number field F and an absolutely almost simple simply connected F-group G′. Products, the derived central cover and V6 reconstruction then restore the original reductive datum.

The construction or proof follows this route:

1. Use the classification of Q-simple semisimple groups as restrictions of scalars and the real Cartan condition to force F totally real.
2. Separate the central torus/component reconstruction from the semisimple conjugation assertion.
3. Use product and central-isogeny descent only with their completed symmetry; do not identify full data by derived groups.

Direct inputs: `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraData:D4/shimura-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`.

Acceptance checks:

- Exceptional Hermitian E₆/E₇ factors remain in scope.
- No Langlands conjugation theorem is imported as an established prerequisite.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 7.1, p.262; SVI §14, p.128. Atlas planet: **Simple connected reduction**.

### Auxiliary totally real splitting extension

Declaration **TauCeti.Shimura.auxiliary_cm_splitting** (theorem), node `ShimuraVarieties:V7/auxiliary-cm-splitting`.

For the simple connected case and a maximal special torus T′⊂G′, choose a finite totally real extension F′/F such that the base-changed torus splits over a CM quadratic extension L′/F′. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

The construction or proof follows this route:

1. Choose a finite CM splitting field L for T′; take a totally real extension containing its maximal real subfield so LF′/F′ is quadratic.
2. Construct the diagonal inclusion into Res_{F′/Q}(G′_{F′}) with the induced components.
3. Apply the subgroup comparison principle of Milne 1.6 and §6.4. Compatibility and choice independence are checked in the marked comparison.

Direct inputs: `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`, `ShimuraVarieties:V3/algebraic-data-maps`.

Acceptance checks:

- The extension need not be chosen canonically.
- Its purpose is splitting the special torus, not turning an exceptional group into abelian type.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, p.253; §6, pp.260–262; SVI §14, p.128.

### Root subdata of type A₁

Declaration **TauCeti.Shimura.rank_one_subdata** (theorem), node `ShimuraVarieties:V7/rank-one-subdata`.

Assume T′ splits over a CM quadratic L/F. For each root α of (G′,T′) noncompact at some real place, the Lie algebra Lie(T′)⊕g_α⊕g_{−α} descends to a reductive F-subgroup H′_α containing T′, whose derived group has type A₁. Res_{F/Q}H′_α with the restricted special homomorphism supplies the required connected rank-one Shimura subdatum, after the derived cover/effective domain adjustment.

The construction or proof follows this route:

1. The quadratic CM involution exchanges α and −α, so the displayed Lie algebra is stable under Gal(L/F).
2. Integrate and descend its subgroup; verify the Hodge types and Cartan condition at each archimedean place.
3. Use the A₁ symplectic realization and V5/V6 to prove its marked conjugation comparison from CM, not just canonical-model existence. The precise A₁ comparison bridge is an explicit refinement gap.

Direct inputs: `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraData:D4/special-pair`, `ShimuraData:D4/central-isogeny-lift`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraVarieties:V6/abelian-canonical`.

Acceptance checks:

- A root may be compact at some places and noncompact at another.
- No claim that arbitrary A₁ subgroups generate G^ad(Q)^+.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, pp.253–254; Remark 1.5, p.242. Atlas planet: **Rank-one Shimura subdata**.

### Central separation by noncompact roots

Declaration **TauCeti.Shimura.rank_one_central_separation** (theorem), node `ShimuraVarieties:V7/rank-one-central-separation`.

In the CM-split simple case, let Z_α=Z(H_α), with α ranging over roots noncompact at some real place. Then Z(G)=∩_α Z_α. Put Tbar=T/Z(G) and Zbar_α=Z_α/Z(G). Regard Zbar_α(A_f)/Zbar_α(Q) as subgroups of the abelian quotient Tbar(A_f)/Tbar(Q); their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

The construction or proof follows this route:

1. Use irreducibility of the absolute root system and Galois action to show the relevant noncompact roots span the root lattice as required by Proposition 4.3.
2. Compute each subgroup centre by vanishing of its root characters.
3. Apply Corollary 4.4 to their adelic intersections with the rational quotient retained.

Direct inputs: `ShimuraVarieties:V7/rank-one-subdata`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- The claim is the explicit centre intersection, not a stronger rational-generation theorem.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 4.3 and Corollary 4.4, p.254.

### Marked conjugated Shimura datum

Declaration **TauCeti.Shimura.conjugatedDatum** (construction), node `ShimuraVarieties:V7/conjugated-datum`.

For the semisimple simply connected connected case, given τ∈Aut(C) and an actual maximal special torus (T,h), form the Serre-protorus torsor S_τ=π⁻¹(τ|Qbar) in the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1, with its distinguished finite-adelic section. The cocharacter μ_h gives ρ_h:S→T/Z(G); let S act on G by this inner action. Define the inner form {}^{τ,h}G=S_τ×^S G, its embedded untwisted T, the homomorphism {}^τh with cocharacter τμ_h, and its connected real conjugacy class {}^{τ,h}X⁺. This defines a connected datum and a distinguished G(A_f)≅{}^{τ,h}G(A_f).

The construction or proof follows this route:

1. Construct the Serre/Taniyama extension and its finite-adelic splitting from the corrected reciprocity class formation; this missing common CM supplier is explicitly requested and recorded as a gap.
2. Form the contracted product for the inner action. The torus is unchanged because its self-conjugation action is trivial.
3. Descend the transformed special cocharacter and check the Shimura conditions; compute finite-local triviality and the real class τμ_h(−1)/μ_h(−1).

Direct inputs: `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

The API is driven by these uses: Milne 1983 Theorem 1.1: the marked target of the comparison is this actual inner form; V7 special-independence: compares twists obtained from two special tori; V7 general-canonical: identifies the twist with the original datum for reflex-field-fixing automorphisms.

- **TauCeti.Shimura.conjugatedDatum.group** (projection): The rational group is the contracted product inner form S_τ×^S G.
- **TauCeti.Shimura.conjugatedDatum.specialTorus** (data): The unchanged T embeds into the twist and the marked homomorphism has cocharacter τμ_h.
- **TauCeti.Shimura.conjugatedDatum.adelic** (equivalence): The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
- **TauCeti.Shimura.conjugatedDatum.localClass** (characterisation): The inner twist is finite-locally trivial and its real cohomology class is represented by τμ_h(−1)/μ_h(−1).
- **TauCeti.Shimura.conjugatedDatum.map** (functoriality): An inclusion preserving the special torus and cocharacter induces the compatible inclusion of twisted data, with the same adelic trivialization.

Discriminating unit tests:

- **TauCeti.Shimura.conjugatedDatum.identity** (degenerate): For τ=id the distinguished torsor section gives the original datum and identity adelic map.
- **TauCeti.Shimura.conjugatedDatum.torus** (computation): For a torus the group is unchanged while the special cocharacter becomes τμ_h; this need not be μ_h.
- **TauCeti.Shimura.conjugatedDatum.finiteLocal** (non-example): All finite local groups agree through the specified maps, but the real form need not agree; finite adelic isomorphism is not a Q-isomorphism.

Acceptance checks:

- Given τ∈Aut(C) and an actual maximal special torus (T,h), form the Serre-protorus torsor S_τ=π⁻¹(τ|Qbar) in the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1, with its distinguished finite-adelic section. The cocharacter μ_h gives ρ_h:S→T/Z(G); let S act on G by this inner action. Define the inner form {}^{τ,h}G=S_τ×^S G, its embedded untwisted T, the homomorphism {}^τh with cocharacter τμ_h, and its full real conjugacy class {}^{τ,h}X. This defines a pure datum and a distinguished G(A_f)≅{}^{τ,h}G(A_f).

Source: [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), Introduction, p.281; 1983 Remark 1.4, pp.241–242. Atlas planet: **Conjugated Shimura datum**.

### Uniformization of conjugate arithmetic quotients

Declaration **TauCeti.Shimura.kazhdan_uniformization** (theorem), node `ShimuraVarieties:V7/kazhdan-uniformization`.

For a torsion-free arithmetic Hermitian quotient Γ\D and τ∈Aut(C), the universal cover of τ(Γ\D) is a Hermitian symmetric domain D′, and its fundamental group acts as a lattice in Aut(D′)^+. This is a key theorem to prove, with its exceptional noncompact cases included.

The construction or proof follows this route:

1. For symplectic/abelian-type quotients use moduli and polarized families. For compact quotients use the relevant metric theorem.
2. For the remaining E₆/E₇ and mixed D cases read and decompose Kazhdan’s primary proof; Milne 3.2 cites its result and does not supply the missing analytic argument.
3. Record that argument as a gap rather than assuming the general conjugation theorem.

Direct inputs: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V5/weight-one-algebraization`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- This does not claim π₁ is unchanged by τ.
- The exceptional-case primary argument remains a named proof obligation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 3.2, p.246.

### Weak connected conjugation comparison

Declaration **TauCeti.Shimura.weak_conjugation** (theorem), node `ShimuraVarieties:V7/weak-conjugation`.

For a semisimple simply connected connected datum and τ∈Aut(C), there exist another connected datum (G₁,X₁⁺), an algebraic tower isomorphism τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺), and a compatible finite-adelic group isomorphism. This assertion does not yet identify G₁ with the special-torus twist.

The construction or proof follows this route:

1. Lift the conjugated Hecke correspondences to the universal Hermitian cover to construct Γ₀ and its compatible finite-adelic map, as in 3.3–3.5.
2. Use the precise S-arithmetic arithmeticity and superrigidity results at sufficiently large S, with rank at least two, to recover G₁ and its compatible local maps (3.6–3.7).
3. Handle the remaining central obstruction with corrected 3.8 and §3.10/auxiliary rank-one comparison; finite étale comparison rigidity (§2.1–2.2) produces the isomorphism. Exact common supplier extensions are requested.

Direct inputs: `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V6/connected-tower`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- The finite adelic map does not identify the real forms.
- The corrected 3.8 concerns H¹(k,Z), not H¹(k,G).

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 3.1 and §§3.3–3.10, pp.245–252.

### Conjugation comparison with a marked special point

Declaration **TauCeti.Shimura.marked_conjugation** (theorem), node `ShimuraVarieties:V7/marked-conjugation`.

For the simple simply connected case, τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺) by an algebraic isomorphism sending τ[h] to [{}^τh] and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded A₁ subvarieties.

The construction or proof follows this route:

1. Compare the weak target’s embedded special torus and its tangent characters; the tangent weights recover the transformed cocharacter (5.1–5.2).
2. At the CM-split auxiliary extension compare both maps on every rank-one subvariety using the established A₁/CM comparison.
3. The centre intersection forces the residual adelic adjustment to be rational. Normalize the marked point and use density of its rational/adelic orbit for uniqueness.

Direct inputs: `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V6/abelian-canonical`.

Acceptance checks:

- No chosen isomorphism or Langlands axiom is an input.
- The construction is valid for exceptional Hermitian types.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 1.1 and §§5–6, pp.241,255–257. Atlas planet: **Marked conjugation comparison**.

### Equivariance for completed symmetry

Declaration **TauCeti.Shimura.completed_conjugation_equivariance** (theorem), node `ShimuraVarieties:V7/completed-conjugation-equivariance`.

The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely G(A_f). Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

The construction or proof follows this route:

1. Use the finite-base-extension functoriality of the completed groups as in Theorem 6.1 and MS §8.
2. Prove the precise density and compatibility needed to extend equivariance continuously. The annotated scan deletes an extra proposed rank-one generator family; no such stronger generation claim is used.
3. Compare finite levels to obtain the completed action identity. Its exact density statement/source decomposition is an explicit gap.

Direct inputs: `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Equivariance for G(A_f) alone does not establish the connected canonical formulation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.1, p.257; MS §8, pp.340–341.

### Independence of the marked special point

Declaration **TauCeti.Shimura.special_independence** (theorem), node `ShimuraVarieties:V7/special-independence`.

For maximal special h,h′ in X⁺, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

The construction or proof follows this route:

1. Use the Hasse-principle comparison of adjoint inner forms and explicit special-torus transition to define the comparison diagram (6.3–6.5).
2. After simultaneous CM splitting of the two tori, measure their real discrepancy by the sum of Weyl lengths. At length zero kill the positive torus norm obstruction by a further totally real extension.
3. For a compact reflection shorten via the real normalizer; for a noncompact reflection use its A₁ subgroup and weak approximation to localize the change at one real place. Induct on the length and compare common refinements.

Direct inputs: `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/conjugated-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Point-independence is proved by Weyl-length induction, not asserted from density of one chosen orbit.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.3 and proof, pp.258–262.

### Reflex-field descent cocycle

Declaration **TauCeti.Shimura.conjugation_cocycle** (theorem), node `ShimuraVarieties:V7/conjugation-cocycle`.

For σ fixing E(G,X), identify the conjugated datum with the original through the transformed cocharacter class and special-point-independent transition. The comparison defines an equivariant algebraic descent system f_σ:σSh_C→Sh_C with f_{στ}=f_σ∘σ(f_τ), compatible with levels, right translations and the actual special-pair reciprocity formula.

The construction or proof follows this route:

1. Reassemble connected comparisons through the central/torus component extension.
2. Normalize reflex-field-fixing twists using the cocharacter class and prove the same special-point action as V4.
3. Apply uniqueness of marked comparisons and transitive transitions to identify the two composites. This produces the cocycle law; continuity is a distinct next theorem.

Direct inputs: `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/special-independence`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/reflex-norm`.

Acceptance checks:

- A set-theoretic cocycle without continuity is insufficient for effective descent.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorems 7.1–7.2, p.262; Descent §2.

### Finite rigidifying special points

Declaration **TauCeti.Shimura.finite_rigidifying_points** (theorem), node `ShimuraVarieties:V7/finite-rigidifying-points`.

At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset Σ whose pointwise stabilizer is trivial. The constructed descent system fixes Σ over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

The construction or proof follows this route:

1. Use Milne 1999 Lemma 2.2: the normalizer of the arithmetic group is discrete and finite covolume gives finite index, or apply the log-general-type argument. The exact normalizer theorem is requested from ALS.0.
2. For each nonidentity automorphism choose a special orbit point it moves; their finite union rigidifies.
3. Reciprocity at finite level gives an open Galois stabilizer for each point; take a finite extension fixing all of them. For zero-dimensional levels use the explicit finite étale Galois set.

Direct inputs: `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- A finite subset of an arbitrary orbit need not rigidify; density and finite automorphisms are used.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and Theorem 2.3, pp.4–5.

### Continuity of the canonical descent system

Declaration **TauCeti.Shimura.continuous_descent** (theorem), node `ShimuraVarieties:V7/continuous-descent`.

The canonical descent system at each neat level is continuous: it splits over a finitely generated field extension of E inside C in the sense of Milne 1999 Theorem 1.1. A finite rigidifying subset fixed over a finite field forces this property by Corollary 1.2. Level comparisons then give the required compatible system at all levels.

The construction or proof follows this route:

1. Spread the variety and the finite rigidifying subset to a finitely generated field L.
2. For automorphisms fixing L the canonical comparisons and the split comparisons agree on Σ and hence agree globally.
3. Invoke the corrected continuity criterion; do not cite the older 1994 lemma with this hypothesis omitted.

Direct inputs: `ShimuraVarieties:V7/finite-rigidifying-points`, `ShimuraVarieties:V7/conjugation-cocycle`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The infinite-transcendence hypothesis Ω=C over a number field satisfies the descent theorem.
- Open stabilizers of individual points alone are not a replacement for the finite rigidification argument.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2. Atlas planet: **Continuous canonical descent**.

### Canonical models for every pure datum

Declaration **TauCeti.Shimura.general_canonical** (theorem), node `ShimuraVarieties:V7/general-canonical`.

Every pure Shimura datum admits a canonical tower over its reflex field, satisfying V4 at every level and independent of the auxiliary extension and marked special point. Apply effective quasi-projective descent to the continuous cocycle constructed above, descend finite quotients and level actions, and verify special reciprocity by comparison over C.

The construction or proof follows this route:

1. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.
2. Descend all compatible finite-level maps using the constructed equivariant system; extend to non-neat levels by finite quotients.
3. The established canonical descent action verifies the exact V4 field of definition and geometric-Artin formula. Compare auxiliary choices through special-independence and specified analytic identity.

Direct inputs: `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V7/special-independence`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- This target remains planned with explicitly named proof-source and supplier gaps; it is not a claim of implementation or gap-free proof.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2.

## Closing the dependency contracts

The following are required supplier outputs, with their consuming nodes recorded explicitly. Exact existing nodes are imported when they suffice. A stage-level request means that its present exposed declarations do not yet certify the needed statement; it does not certify an implementation. The requests stay in the owning mathematical direction and add no second owner in this packet.

### AdelicAlgebraicGroups:AA.3

Strengthen the existing arithmetic-subgroup-of-level discreteness node to: G(Q)∩aKa⁻¹ is commensurable with G(Q)∩GL_n(Z) for every faithful rational embedding and compact open K. Preserve finite-index rational component stabilizers. Import class-number-finite separately; do not replan reduction theory in V0.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`.

### AdelicAlgebraicGroups:AA.4

Extend the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or deck degree. Supply finite topological level maps, the effective kernel of a normal K/K′ action, Hecke-span composition via double cosets, and the Cartesian comparison only with its precise U′L=U hypothesis. Arithmetic neatness remains owned by D5/AA.4.

Required by: `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`.

### ArithmeticLocallySymmetricSpaces:ALS.0

Properness of the symmetric-space isometry action, arithmetic finite covolume after compact ineffective factors, and the finite normalizer-index/finite automorphism theorem for torsion-free arithmetic Hermitian quotients. For weak conjugation additionally supply the precisely ranked S-arithmetic arithmeticity and superrigidity conclusions of Milne 1983 §§3.5–3.7; these additions are an explicit extension gap, not already present ALS.0 outputs.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/finite-rigidifying-points`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Arithmetic images under rational algebraic homomorphisms; G(Q) real density with component positivity; Hermitian parabolic/root structure; the ν:G→G/G^der local-image lemmas of Milne 5.18–5.19; restriction-of-scalars decomposition of Q-simple groups; existence and real conjugacy of maximal tori. The new finite-place H¹(k,Z) injectivity, adjoint Hasse principle, torus norm obstruction, weak approximation and root-centre identities for V7 are requested as a ReductiveGroups Part II extension, not claimed as upstream Layer 7 theorems.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`.

### ReductiveGroupsPartII:RG2.0a

Weil restriction of affine group schemes, torus norms and their split character/cocharacter products, base-change maps and diagonal embeddings for finite field extensions. Apply these to the reflex norm and auxiliary totally real extension.

Required by: `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`.

### ComplexComparisonPartII:C0

Analytification of locally finite-type complex schemes as locally ringed spaces, including nonreduced spaces; compatibility with products, open and closed immersions, étale local isomorphisms and smooth manifolds; faithful analytic comparison of morphisms and invariant local finite quotients. The missing analytic category and gluing carrier are specified in the CA.0 ownership proposal and gap, rather than assumed to be in PR196 or retired LI.2.

Required by: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/unique-algebraization`.

### ComplexComparisonPartII:C2

Projective GAGA for coherent sheaves and ideals, section comparisons and algebraization of projective analytic data, applied to the already constructed automorphic compactification.

Required by: `ShimuraVarieties:V2/baily-borel`.

### ComplexComparisonPartII:C4

Chow for closed projective analytic subspaces and graph algebraicity between proper algebraic schemes; proper graph comparison after normal-crossing compactification. The added definable-graph route requires an independent arithmetic-to-algebraic definability comparison, polarized period-map definability and Peterzil–Starchenko o-minimal Chow; route those additions to a Complex Comparison Part II extension, with gaps until certified.

Required by: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V5/weight-one-algebraization`.

### tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites

Finite group quotients of normal quasi-projective schemes (existence through invariant affine charts and an invariant ample bundle), finite étale Galois covers, normalization in finite function-field extensions, and the finite-continuous-Galois-set/finite-étale-scheme equivalence. The last equivalence is an exact additional supplier requirement when the current Layer 0 wording does not expose it.

Required by: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/torus-model`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Absolute arithmetic Artin reciprocity, continuity and kernel, compatibility of norms with restriction, ray class fields and generation by good primes. The upstream README §Conventions explicitly fixes arithmetic Frobenius; geometricArtin in V4 inverts that map. CM norm-kernel lemmas are proved in V5, not supplied by class field theory alone.

Required by: `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`.

### AlgebraicModuliForArithmeticGeometry:R09.3

Faithful base change and effective continuous quasi-projective descent of schemes/morphisms, including Milne 1999 Theorem 1.1 under infinite transcendence degree and its finite rigidifying-point criterion. Descend invariant closed images and finite quotient towers with compatible maps.

Required by: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

### AlgebraicModuliForArithmeticGeometry:R09.4

Finite group quotient stacks with actual inertia and common-normal-refinement equivalence, for the AGHMP generic torus stack.

Required by: `ShimuraVarieties:V4/aghmp-stack-comparison`.

### AlgebraicModuliForArithmeticGeometry:R09.5

Existence and finite quotient description of the coarse moduli scheme for the specific AGHMP finite-inertia torus stack; distinguish it from the stack.

Required by: `ShimuraVarieties:V4/aghmp-stack-comparison`.

### AlgebraicModuliForArithmeticGeometry:R09.7d

For smooth quasi-projective schemes in characteristic zero, a smooth projective compactification whose boundary is a simple normal-crossing divisor, including the local punctured-polydisk charts after analytification. General smooth sources reduce by quasi-projective open covers.

Required by: `ShimuraVarieties:V3/borel-algebraicity`.

### PELModuli:M3

Generic rational Siegel moduli with actual polarization and integral/adelic symplectic level, including the fine/neat and coarse/non-neat distinctions, its analytic family/uniformization and the moduli map used after V3 to algebraize weight-one variations. This request uses M0–M3 only; M4 canonical models are not an input to V5.

Required by: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/siegel-canonical`.

### AbelianSchemesAndArithmeticModuli:A2

Dual abelian schemes, rational polarizations and Rosati involutions, with E-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

Required by: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/cm-polarization-level`.

### AbelianSchemesAndArithmeticModuli:A3

Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

Required by: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/cm-polarization-level`.

### AbelianSchemesAndArithmeticModuli:A4

Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and Lie-eigenspace comparison, including faithful action of quasi-isogenies.

Required by: `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/shimura-taniyama`.

### AbelianSchemesAndArithmeticModuli:A5

The analytic equivalence of polarizable integral homological type (−1,0),(0,−1) variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is V5 after M3 and Borel; A5 must not use V5 to provide its analytic equivalence.

Required by: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`.

### AbelianSchemesAndArithmeticModuli:A6

Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, rigidity and spreading of endomorphisms, and specialization of CM endomorphisms. For the Frobenius proof, supply the positive-characteristic rational Hom/Tate comparison or the precise Milne 10.8 substitute showing Frobenius lies in the specialized CM algebra; do not assume all geometric special-fibre endomorphisms lift.

Required by: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/siegel-special-cm`.

## Remaining proof and carrier refinements

Every scoped stage is planned and every prerequisite chain has an explicit terminal contract. Closing a stage requires eliminating the following relevant gaps and its supplier requests, not merely changing its coverage label. These are mathematical refinements of the complete target inventory. The two analytic-foundation findings are addressed by concrete ownership proposals; the four allowed deliverables cannot apply changes to supplier packets, external tracking records or atlas data.

### G1. Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3

Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison. Encode CA.0→C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3 and list those consumers in the PR196 external record. C0/repair-analytification supplies a requested target, not a constructed carrier. The issue permits no edits to those supplier/atlas files, so the repair is a concrete unapplied ownership proposal.

Required by: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V3/borel-extension`.

### G2. Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28

The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7). Encode M5/M6 or CA.0→AnalyticToricGeometry Layer 3 and M7 or CA.0→C0, with the direct V1 edge. If PR279 is tracked instead, expose those milestones as real stage ids. Update its external consumers and declared_by_areas with AnalyticToricGeometry. LI.4/LI.2 are retired and provide none of this; no edge through them remains in the packet.

Required by: `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V1/analytic-structure`.

### G3. Arithmetic and effective-level supplier extensions

AA.3/arithmetic-subgroup-of-level currently states discreteness, not the required arithmetic commensurability. AA.4 covering/freeness has a real stabilizer compact-mod-A_G hypothesis; rational central units in general Shimura data require an effective-domain extension. The two stage requests specify exactly these missing outputs.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`.

### G4. Baily–Borel primary proof decomposition

Milne SVI 3.12–3.13 gives the correct proof path but explicitly says the only full proof is Baily–Borel (1966). Publisher access did not yield the full primary text. Certify §§3–4 rational boundary incidence/Satake compactness; §§5–7 Poincaré–Eisenstein convergence/restriction; §§8–10 analytic local rings/normality, separation, finite generation and graded projective realization; identify exact weight and growth conventions and finite-index boundary extension. These nodes are proof obligations, not imported theorem axioms. General rational boundary and automorphic growth signatures stay mathematically specified until this source/carrier refinement.

Required by: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`.

### G5. Borel multivariable extension proof source

SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument. Obtain the original algebraicity paper or a full public proof and certify the extension across (Δ*)ʳ×Δˢ with torsion-free effective target. Projective SNC source compactification is separately requested from R09.7d.

Required by: `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`.

### G6. Independent definable comparison and graph suppliers

Certify the PS13/KUY16 theorem comparing the algebraic Baily–Borel definable structure with arithmetic fundamental-set charts independently of Borel algebraicity; state the o-minimal structure precisely. Import/propose a single owner for BKT period-map definability and Peterzil–Starchenko o-minimal Chow, with the corrected maximal-compact and Cartan conditions. A bare arithmetic-definable graph is not yet a graph in the algebraic-target definable structure.

Required by: `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`.

### G7. Full CM spreading and specialization inputs

Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field, and the A6 positive-characteristic Hom/Tate comparison used to identify Frobenius with E. Integral eigenspace splitting in the unramified Frobenius calculation is over O_{k,P}, not globally O_k, as the published author erratum corrects.

Required by: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/shimura-taniyama`.

### G8. Connected canonical symmetry and coherence

Read and specify Deligne 1979 §§2.7.10–2.7.13 completely: the adelic/Galois extension acting on the connected Qbar model, its group law, congruence completions, special reciprocity and reconstruction of finite components. The scanned 1983 appendix certifies the complex completion action only. The algebraic inverse system with completion alone is not the entire connected canonical object.

Required by: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/conjugation-cocycle`.

### G9. Serre/Taniyama extension common owner

MS1982c pp.229–230 and 242–243 and MS1982d p.281 were inspected, including the actual contracted product. No atlas layer owns the Serre protorus and Taniyama extension with finite-adelic section and compatible cocycle. Propose Complex Multiplication and Explicit Reciprocity, Part II, first new layer CM.S: Serre character lattice (σ−1)(c+1)χ=0, global Weil/class-formation extension, norm-compatible finite-adelic section, torsor multiplication and marked-cocharacter pushout. This is beyond existing CM.0 types/reflex types; refine the uninspected extension proof in MS1982c §§2–3. Supply CM.S→V7/conjugated-datum, with no CM.2/CM.4→V5 cycle.

Required by: `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/conjugation-cocycle`.

### G10. Kazhdan exceptional uniformization proof

Milne 1983 Theorem 3.2 is a key theorem with proof references, not a full proof. Decompose Kazhdan’s universal-cover and lattice theorem for exceptional noncompact E₆/E₇/mixed D cases, including its analytic metric inputs; no general Langlands conjugation theorem can serve as an axiom. Route reusable metric results to the analytic supplier and retain this arithmetic conjugation application in V7.

Required by: `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`.

### G11. S-arithmetic and central-cohomology supplier extension

ALS.0 does not yet expose Milne §§3.5–3.7: recovery of a Q-group from irreducible S-arithmetic lattices at total rank≥2, local finite-prime identifications and superrigidity. Extend ReductiveGroupsPartII for corrected Lemma 3.8: for simply connected semisimple G with no A_n factor n≥4, H¹(k,Z(G))→∏_{v finite}H¹(k_v,Z(G)) is injective; plus the adjoint Hasse principle/real localization and torus norm weak-approximation assertions used in §§6.3–6.6. Preserve the actual hypotheses; no arbitrary finite group cohomology theorem is asserted.

Required by: `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/special-independence`.

### G12. A₁ comparison and completion density

Canonical-model existence for A₁ is not itself its marked conjugation comparison. Certify the CM/Siegel comparison bridge in 1983 Remark 1.5/MS1982d §9 and its functorial inclusion. Read MS1982d §8 and corrected 1983 Theorem 6.1 for the exact finite totally real base-extension density in the congruence completion. Do not revive the deleted extra A₁-generation claim in the annotated scan.

Required by: `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`.

### G13. Finite étale Galois-set and finite quotient API

The generic finite Galois-set construction and invariant ample quotient API must be exposed by the ModularCurves Layer 0/AlgebraicModuli R09.3 suppliers in the precise generality requested; existing modular-curve-specific constructions alone do not certify arbitrary torus levels.

Required by: `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V3/finite-quotient-algebraization`.

### G14. Suggested signatures requiring absent mathematical carriers

The exact mathematical declarations/API/tests are named in the reader and in the suggested file’s explicit omission manifest. The pinned libraries contain no pure Shimura datum, nilpotent complex analytic-space category/analytification, canonical model special-pair predicate, automorphic boundary section ring or connected canonical Galois extension. Their full Lean conditions cannot be stated yet. Section 13 requires omitting such conditions honestly: the compiled prototype implements the genuine double-orbit carrier and geometric Artin conversion at the native group-action/group-hom level, and gives no Prop-valued fake fields, unproved existence instances or schematic True conclusions. Restore each omitted signature when the recorded owner supplies its carrier, preserving all names and discriminating tests. Compilation certifies only the stated prototype, not the advanced mathematics. The point prototype specifies the orbit set without its quotient topology; the Artin prototype specifies inversion of a supplied homomorphism without constructing global reciprocity, profinite continuity or the literal number-field tests. Those mathematical specializations are also omitted conditions, not certified by the native tests.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/stabilizer-commensurable`, `ShimuraVarieties:V0/neat-sublevels`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V1/analytic-points`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-hecke`, `ShimuraVarieties:V1/datum-analytic-map`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/aghmp-stack-comparison`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/shimura-taniyama`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/siegel-canonical`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/hodge-canonical`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`, `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V7/finite-rigidifying-points`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

## Ownership proposals for assembly

**ComplexComparisonPartII** (rescope). RT-AREA-algebraicgeometry/3 and /28: analytic spaces/analytification and holomorphic gluing have no mathematical owner; external PR196/279 are not encoded stages, and FoundationsAndLibraryIntegration is retired.

Insert CA.0: Complex analytic foundations before C0, with analytic local models including nilpotents, morphisms/gluing/fibre products, SGA1 analytification, smooth/étale comparison and compatible complex manifold gluing/finite-gluing topology/holomorphic bundles. Encode the consumer edges and PR196/279 external record updates listed in the two gaps. It agrees with PR196 Layers 0–2 and PR279 Milestones 5–7 if those PRs merge. This proposal is not applied in the present four-file job.

**ComplexMultiplicationAndExplicitReciprocity** (rescope). V7 needs the actual Serre/Taniyama torsor, not only types/reflex types or the scalar CM reciprocity theorem.

Add a Part II layer CM.S owning the Serre protorus and Taniyama extension with adelic section and norm/cocycle API. V7 owns the contracted-product Shimura twist and its comparison. Keep CM.0 types and V4 reflex-norm application, and avoid CM.2/CM.4→V5 cycles.

**ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces** (rescope). The common cohomological/rigidity inputs used in Milne 1983 are broader than the current exposed supplier scopes.

Expose the corrected finite-place centre H¹ injectivity, adjoint Hasse principle and real torus norm/weak approximation in ReductiveGroups Part II; expose precisely ranked S-arithmetic arithmeticity/superrigidity and normalizer finiteness in the locally symmetric supplier. V7 retains weak/marked conjugation and Weyl-length independence.

**ShimuraVarieties** (rescope). V6 imports the existing V8 foundational disjoint-reflex-field and conditional uniqueness nodes; their proofs depend on V1–V4, not on canonical-model existence in V6/V7. Keeping all of them behind an undifferentiated V8 stage creates a misleading stage cycle.

At assembly move the existing V8/disjoint-special-reflex-fields and the conditional V8 translation-descent/model-uniqueness foundation to the V4 canonical-model lane, preserving node ids by aliases. Keep V8 actual-tower applications and V8.general separated. Until assembly use those exact existing node ids; the expanded declaration graph is acyclic.

## Source corrections and scope

The corrected statements above use the following source findings. Author annotations and published errata take precedence over the uncorrected text. A missing proof source is recorded as a gap rather than given the force of an assumption.

### ShimuraVarieties/E1

**source**: action

**kind**: misprint

**locator**: Lemma 3.8, printed p.250, annotated 1983 author scan

**printed**: H¹(k,G) → ∏_{v finite} H¹(k_v,G)

**correction**: Replace G by Z=Z(G) in both cohomology terms; preserve no A_n factor with n≥4.

**reason**: The proof computes the finite centre and its Galois action and explicitly proves injectivity for H¹(k,Z). The displayed scan has the author’s handwritten Z corrections.

**affects**: nothing

**known**: Author’s annotated scan, https://jmilne.org/math/articles/1983a.pdf; the V7 issue explicitly requires this correction.

**searched**: Annotated author PDF p.250; author article list; roadmap V7 source correction instruction.


### ShimuraVarieties/E2

**source**: bkt

**kind**: error

**locator**: Theorem 1.1(1)–(2), author manuscript pp.3–4; corrected by author erratum §§1.1–1.3

**printed**: Any morphism f : SΓ′,G′,M′ → SΓ,G,M of arithmetic quotients is Ralg-definable.

**correction**: Fix maximal compact K for the definable structure; require the corrected morphism compatibility with K,K′ and preservation of the embedded Lie algebra by the target Cartan involution. Hodge manifolds and period maps retain their corrected canonical choice.

**reason**: The erratum §1.6 gives distinct definable structures and morphisms without finite Siegel containment. The V3 alternative uses only the corrected symmetric/Hodge case.

**affects**: a stated result

**known**: Bakker–Klingler–Tsimerman, author erratum, https://benjamin-bakker.github.io/DefArithErr.pdf, Theorem 1.2.

**searched**: Author manuscript Theorem 1.1; full author erratum §§1.1–1.6.


### ShimuraVarieties/E3

**source**: svi

**kind**: misprint

**locator**: Formulas (60)–(61), p.114, SVI revised 16 September 2017

**printed**: ∑ ρ(μx(a))

**correction**: Use the multiplicative product of the conjugate cocharacter values, not their sum.

**reason**: The codomain is an arbitrary torus group, whose values admit multiplication, not addition. For G_m with μ(t)=tⁿ the Weil-restriction norm is ∏ρ ρ(a)ⁿ; summation is not a homomorphism and need not be invertible.

**affects**: nothing

**known**: new

**searched**: SVI author version formulas (60)–(61), p.114; existing ShimuraVarieties--V8 sourceIssues (same correction recorded); author xnotes index searched.


### ShimuraVarieties/E4

**source**: svi

**kind**: misprint

**locator**: Proposition 14.16(b), p.127, more-precisely paragraph, SVI revised 16 September 2017

**printed**: the canonical model for Sh⁰(G₂,X₂) is the quotient of the canonical model for Sh⁰(G₂,X₂)

**correction**: The second source model is Sh⁰(G₁,X₁); quotient it by the kernel of the completion map for G₁→G₂.

**reason**: The preceding assertion assumes existence for G₁. The following kernel is explicitly that of the source-to-target map; quotienting the already-target model would assume the conclusion and give the wrong tower.

**affects**: nothing

**known**: new

**searched**: SVI author version p.127; author xnotes index searched; Deligne 1979 2.7.11 cited by source but its full extension construction remains a recorded source gap.


### ShimuraVarieties/E5

**source**: cm

**kind**: misprint

**locator**: Remark 3.11(a), p.22, author article 2007c

**printed**: rec(s) = σ|E*ab

**correction**: Use art_{E*}(s)=σ|E*ab, as in Theorem 3.10 and Lemma 3.9 immediately above.

**reason**: The article defines art as the inverse of rec. An automorphism of order greater than two detects the sign; the change-of-lift lemma and stated quasi-isogeny formula both use art.

**affects**: nothing

**known**: new

**searched**: Author article Theorem 3.10/Remark 3.11; https://www.jmilne.org/math/articles/2007c.html erratum (corrects §2.1, not this line).


### ShimuraVarieties/E6

**source**: cm

**kind**: error

**locator**: Theorem 2.1(b) proof pp.16–17, author article 2007c; public author correction

**printed**: O_k

**correction**: In the integral eigenspace decomposition at the good unramified prime P use O_{k,P} throughout the first two proof paragraphs, not global O_k.

**reason**: Splitting E⊗k does not split O_E⊗O_k globally: conjugate roots can coincide modulo ramified primes. Localization at the unramified prime gives the needed étale eigenspaces. The V5 Frobenius proof requests this localized comparison.

**affects**: the proof

**known**: Author erratum https://www.jmilne.org/math/articles/2007c.html.

**searched**: Public author erratum opened 6 October 2026; author PDF proof of Theorem 2.1.


### ShimuraVarieties/E7

**source**: descent

**kind**: gap

**locator**: Remark 1.3(c), p.2, 1999 author version, identifying Milne 1994 Lemma 3.23

**printed**: omits the continuity conditions

**correction**: Use the finitely generated splitting criterion of Theorem 1.1 and finite rigidifying-point Corollary 1.2. The canonical system must be shown continuous before effective descent.

**reason**: Remark 1.3(a) exhibits noneffective noncontinuous systems; a cocycle law by itself does not imply effectivity. V7 separates cocycle, finite rigidification, continuity and descent.

**affects**: the proof

**known**: Milne, Descent for Shimura varieties (1999), Theorem 1.1 and Corollary 1.2 explicitly replace the older lemma.

**searched**: Entire 1999 author version §§1–2; Remark 1.3(c) explicit correction.


### ShimuraVarieties/E8

**source**: svi

**kind**: error

**locator**: Theorem 3.11, p.38, relative to the source’s geometrically-reduced definition of algebraic variety on pp.35–36

**printed**: Every projective complex analyic space has a unique structure of a projective algebraic variety

**correction**: For analytic spaces with nilpotents use projective algebraic schemes. For the source’s geometrically-reduced varieties restrict the analytic space to be reduced. V2 uses normal reduced compactifications, so its statement is unaffected.

**reason**: The projective analytic fat point with local ring C[ε]/(ε²) cannot analytify a geometrically-reduced variety. The CA.0 carrier must nevertheless include it for GAGA and general analytification.

**affects**: a stated result

**known**: new

**searched**: SVI author version pp.35–38; ComplexComparisonPartII C0–C4 packet targets; author xnotes index searched.

## Pinned library and prototyping boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed roadmap audit and the declarations at these pins were inspected before planning. The native pieces used here supply an orbit setoid, its quotient, stabilizers, schemes and a fixed-base category. They do not supply a pure Shimura datum, a nilpotent analytic-space category, a special-pair canonical-model predicate, an automorphic boundary ring or a connected canonical Galois extension.

- **mathlib:MulAction.orbitRel**, Mathlib/GroupTheory/GroupAction/Defs.lean: Setoid with relation a ∈ orbit G b for a group action; no analytic structure asserted. Full statement read in the existing Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **mathlib:MulAction.orbitRel.Quotient**, Mathlib/GroupTheory/GroupAction/Defs.lean: The quotient type by the actual orbit relation. Full statement read in the existing Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **mathlib:MulAction.stabilizer**, Mathlib/GroupTheory/GroupAction/Defs.lean: Subgroup of group elements fixing a point. Full statement read in the existing Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **mathlib:AlgebraicGeometry.Scheme**, Mathlib/AlgebraicGeometry/Scheme.lean: Locally ringed space locally isomorphic to an affine spectrum. Full statement read in the existing Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **mathlib:CategoryTheory.Over**, Mathlib/CategoryTheory/Comma/Over/Basic.lean: Category of arrows with fixed codomain, for schemes over Spec E. Full statement read in the existing Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174.

The suggested file uses individual Mathlib imports and genuinely defined native orbit and homomorphism data. It elaborates at the pinned shared build with only proof-placeholder warnings. Its analytic-point prototype retains the domain and rational diagonal action, constructs the level map, and tests the singleton torus double quotient against an independently specified relation. The nontrivial-domain native test proves that a domain coordinate survives even for trivial groups; the literal GL₂ instance requires the absent datum carrier. Its Artin prototype inverts an actual homomorphism into an abelian group and tests Frobenius inversion and cyclotomic normalization transport. It does not construct the number-field reciprocity map or supply analytic topology. The explicit omission manifest retains every advanced declaration, API and test name with its exact mathematical statement, until the corresponding owner makes the necessary conditions expressible. Compilation certifies that native prototype only.

## Sources inspected

All fetched author copies have access date 6 October 2026. The packet records their SHA-256 digests, versions, short literal evidence and node locators. The scans were inspected as page images; unusable extracted text was not treated as source evidence. The Baily–Borel, original Borel metric proof, independent PS/KUY target comparison, full Deligne connected extension and exceptional Kazhdan primary proofs remain the precise refinements named above.

- [Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), J. S. Milne. Revised 16 September 2017. Inspected: §3 arithmetic groups, Baily–Borel and Borel; §5 finite components and analytic levels; §§10–11 CM reduction and reciprocity; §§12–14 canonical models, density, descent, Siegel/Hodge/abelian type and general-data reduction. Digest: `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.

- [The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), J. S. Milne. Author article 2007c. Inspected: §2 pp.16–18 Frobenius/valuation proof with author localized-base erratum; §3 pp.19–24 ideal form Theorem 3.2, geometric Artin convention, norm-kernel lemmas, Theorem 3.10 and polarization formula 3.11(c). Digest: `cec3ce6ffa0761aecf50e3b095a517ba96e4e525c545a80f9a3b39f518dc7607`.

- [The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), J. S. Milne. Progress in Mathematics 35 (1983), pp.239–265; annotated author scan. Inspected: Page images inspected: pp.239–244 (notation, marked comparison and finite étale rigidity); pp.245–254 (weak comparison, uniformization, S-arithmetic recovery, corrected Lemma 3.8, reduction and A1 root subgroups); pp.255–262 (special-point comparison, completed symmetry, Theorems 6.3, 7.1, 7.2); p.263 connected-tower appendix. Scan has no usable extracted text. Digest: `36caf35ff4759b920f26cff9f59f23b6f65ff689022522e1757462703dab2b42`.

- [Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), J. S. Milne. Michigan Mathematical Journal 46 (1999); author version dated 22 September 1998. Inspected: Entire §§1–2, especially Theorem 1.1, Corollary 1.2, Lemma 2.2 and Theorem 2.3; Remark 1.3(c) corrects missing continuity. Digest: `9ce47be2db53ea4f97e548c47933c07f06f2cb4de37f31e836b77d241e4e34b5`.

- [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), B. Bakker, B. Klingler, J. Tsimerman. Author manuscript of JAMS (2020). Inspected: Introduction arithmetic varieties and definable comparison; §4.6 Theorems 4.12–4.13 and graph proof. Other Hodge-locus targets are outside this job. Digest: `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e`.

- [Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf), B. Bakker, B. Klingler, J. Tsimerman. Author erratum. Inspected: Entire §§1.1–1.6: maximal-compact dependence, corrected Theorem 1.2 and Cartan-compatible Hodge-manifold functoriality; pure period-map consequences remain valid. Digest: `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`.

- [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera. Annals of Mathematics 187 (2018), pp.391–531. Inspected: §3.1 pp.415–416: quotient torus, reflex norm, finite étale Galois-set construction and distinction between schemes at neat level and quotient stacks. §3.2 integral-model boundary read, not planned in V4. Digest: `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`.

- [Langlands’s construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf), J. S. Milne and K.-y. Shih. LNM 900 (1982), pp.229–260; author scan. Inspected: Page images: introduction pp.229–230 (sign, Serre character lattice), §§2–3 transition pp.242–243 (extension, Weil group and class formation). The remaining extension construction is a precisely recorded supplier gap. Digest: `a445a74d39559277971c090a677fc83a0b155813e802a4662765442ca8c0b700`.

- [Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), J. S. Milne and K.-y. Shih. LNM 900 (1982), pp.280–356; author scan. Inspected: Page images: introduction pp.280–281 (Taniyama torsor and contracted-product twist), §8 pp.340–341 (connected symmetry), §9 pp.342–345 (reduction). Digest: `c090098f609fd489a08778968eba653ecd8b67d7ad48e167381f6cc671c86b63`.
