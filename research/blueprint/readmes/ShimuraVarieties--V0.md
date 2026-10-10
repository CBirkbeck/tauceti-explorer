# Complex Shimura varieties and canonical models: V0–V7

This roadmap constructs the complex Shimura tower and its canonical models from a pure Shimura datum. It begins with arithmetic stabilizers and the actual diagonal rational quotient, proves algebraicity through the automorphic compactification, formulates special-point reciprocity, constructs the Siegel model from the theorem of complex multiplication, and separates the abelian-type inheritance argument from the general conjugation argument. The final descent step requires a continuous system of algebraic comparisons. The mathematical objects, named declarations, proof routes and tests specified here are the definitive plan; the accompanying suggested file only prototypes signatures supported by the pinned libraries.

The packet is a complete **target-level planning pass**, with 69 declaration nodes, 58 API items, 29 discriminating test specifications and 41 planets. All eight stages are planned; none is closed. Nineteen explicit proof/carrier refinements and eighteen supplier requests identify the inputs that must be certified to close the stages. This means that every scoped target has a route ending in the audited libraries, an existing supplier node, a requested supplier stage or a named gap. It does not mean that the theorem proofs or their advanced Lean signatures have been implemented. Every declaration retains unchecked implementation status. The bibliography distinguishes passages actually inspected from primary arguments that the gap register requires.

## Conventions and ownership

A pure datum is the object of `ShimuraData:D4/shimura-datum`; its domain, homomorphisms, cocharacter class and reflex field are imported from D2–D4. Write X⁺ for a connected domain component and G(Q)₊ for the inverse image of Gᵃᵈ(R)⁺. Compact adjoint factors are removed only when forming the effective domain action. For a compact open subgroup K of G(A_f), write [x,a]ₖ for the class of (x,a). The finite-adelic coordinate is essential. Neither the finite component double quotient nor one connected quotient is the full analytic variety.

The component arithmetic group is Γₐ=G(Q)₊∩aKa⁻¹. Quotient charts use its effective image Γₐᵉᶠᶠ. Rational neatness is the predicate owned by ShimuraData D5, with its representation independence. Neatness makes the **effective** action free once discreteness has been proved. It does not eliminate every rational central unit, and it does not make a raw level-group action faithful. For a normal level inclusion the quotient-action subgroup is computed from the effective finite action, with its kernel retained. A disconnected cover can have more automorphisms over its base: for the norm G_m datum, K(21)⊂K(3) gives six points over one, with regular quotient-action group C₆ and full automorphism group S₆. For GL₂ the full domain has its two half-plane components; at principal level N≥3 the full complex variety has φ(N) components, whereas the split one-point torus example has a quotient by ±1.

Arithmetic reduction, real Siegel sets, class-number finiteness, adelic quotient topology and the topological level/Hecke tower belong to AdelicAlgebraicGroups AA.3–AA.4 and the locally symmetric supplier, following accepted RS-04. V0 applies their results to Shimura components. V1 adds the holomorphic and analytic content. Strong approximation is used for the semisimple simply connected derived group, with its noncompact simple real factors, and never as an unrestricted statement about a reductive group or torus. Real density in the Hecke-orbit argument is a different input.

Complex analytic spaces include nilpotent holomorphic local models. An analytic space is locally a locally C-ringed space (V(I), O_U/I), with U open in Cⁿ and I a locally finitely generated holomorphic ideal. A quotient manifold is a special case. A carrier with only points and a topology cannot support coherent ideals, projective GAGA or analytic fibre products. The proposed CA.0 supplier owns these foundations, gluing and analytification; V1–V3 use them. The general foundation is not defined anew as a Shimura-specific structure. The current C0 repair target does not itself construct this category, and the retired integration roadmap cannot supply it.

The compactification in V2 is the rational Satake, or minimal Baily–Borel, compactification. The initial automorphic ring consists of **analytic** canonical sections whose coefficients in every rational adapted unbounded realization extend continuously in the Satake topology and holomorphically on the boundary stratum. Boundary restriction takes values in the line factor induced by the ambient Jacobian; its intrinsic boundary weight can differ. It is not defined using the algebraic line bundle whose existence the construction is intended to prove. Cusp forms impose an additional vanishing condition. A positive tensor power changes the ring by a Veronese construction and must preserve the projective realization. General toroidal compactifications, their fans and integral models have separate owners.

The arithmetic Artin map rec sends a local uniformizer to arithmetic Frobenius. This document uses Milne's geometric convention art(s)=rec(s)⁻¹ in canonical-model formulas. Reflex norms are multiplicative products of conjugate cocharacters. For a special pair (T,h), its field is the field of definition of that cocharacter, not a field chosen by the user. A canonical model must test every actual special pair from D4 and every finite-adelic representative. A predicate checking an arbitrary designated subset, including an empty subset, cannot replace this requirement. Continuity and independence of the Artin lift are proved inputs.

The full CM algebra E can be a product of CM fields and has degree 2 dim A. The type and its reflex field are supplied by CM.0. V5 owns their application to actual abelian varieties and Siegel special points. It never assumes CM.2 or CM.4, whose proposed development consumes V5. Homological Hodge types are (−1,0) and (0,−1). A polarization retains its Rosati involution and Tate twist. A rational quasi-isogeny is distinct from an integral isogeny or an arbitrary scalar matrix. Integral Tate freeness over a nonmaximal order requires extra lattice hypotheses.

The canonical uniqueness and disjoint-special-reflex-field arguments already have V8 nodes. Their exact statements are imported, rather than duplicated here. Those foundational nodes depend on V1–V4 and are conditional on the canonical-model condition, so importing them does not assume V6 or V7 existence. At assembly their location should be made explicit through the recorded rescoping proposal, preserving identifiers and aliases. V8's tower applications and reflex-field functoriality remain outside this part.

A connected datum on a semisimple group G is a Gᵃᵈ(R)⁺-class of maps S→Gᵃᵈ_R; even for simply connected G, no full S-map lift to G is assumed. The standard PGL₂ Hodge cocharacter does not lift integrally to SL₂. Special tori are pulled back to G, while their marked cocharacters and Serre action live in Tᵃᵈ.

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

The arithmetic quotient must be understood before its complex structure is glued. The separate checks are arithmeticity of the rational stabilizer, discreteness of its effective image and freeness at neat level. Current AA §3.4 already provides arbitrary pairwise level commensurability; V0 imports it and requests the faithful-integral arithmetic definition and effective-image comparison. Neat normal cofinal sublevels are also imported from AA.4. Rational representative changes and class-set finiteness identify the finite disjoint union of connected arithmetic quotients. The simply connected derived-group case uses qualified strong approximation and the exact positive rational abelianization image. Current AA §4.5 already supplies integral Lang/Hensel lifts and finite-adelic surjectivity; the local openness and rational positivity specialization remain explicit requests.

### Arithmetic component stabilizers

Declaration **TauCeti.Shimura.stabilizer_arithmetic** (theorem), node `ShimuraVarieties:V0/stabilizer-arithmetic`.

For a pure datum (G,X), component X⁺, compact open K and a∈G(A_f), Γ_a=G(Q)_+∩aKa⁻¹ is an arithmetic subgroup of G(Q), of finite index in G(Q)∩aKa⁻¹. Its image in the effective real automorphism group of X⁺ is arithmetic and discrete. G(Q)_+ means the inverse image of G^ad(R)^+, with compact adjoint factors removed only in the effective image.

The construction or proof follows this route:

1. Import AA §3.4 and Reduction.levelArithmetic_commensurable_pair for arbitrary compact-open levels and adelic representatives. Identify one integral-model level with the faithful GL_n(Z) definition of arithmeticity; request that comparison and the algebraic-image/effective-kernel specialization from AA.3. The general pairwise commensurability theorem is already planned upstream.
2. Passing to the finite-index component stabilizer preserves arithmeticity. The algebraic image theorem (Milne 3.2) and removal of the compact ineffective factor give a discrete arithmetic domain image.
3. Distinguish discreteness of Γ in all real group points from discreteness of its domain image: the latter is the input to D5/effective-free.

Direct inputs: `ShimuraData:D5/component-subgroup`, `ShimuraData:D5/effective-kernel`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3`.

Acceptance checks:

- For GL₂ at principal N≥3, the effective stabilizer of ℍ is the image of Γ(N).
- A real-quadratic central unit can lie in Γ_a and act trivially on X⁺; no faithfulness assertion follows.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.2 and 5.13, pp.33,57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dea8191cc6047d6142a65872ebce6eeeb841a29b/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.levelArithmetic_commensurable_pair. Imports the current pairwise level commensurability target; the faithful-integral definition and effective arithmetic-image bridge are the remaining requested specialization.

Atlas planet: **Arithmetic component stabilizers**.

### Commensurability of stabilizers

Declaration **TauCeti.Shimura.stabilizer_commensurable** (theorem), node `ShimuraVarieties:V0/stabilizer-commensurable`.

For fixed G and X⁺, Γ_{a,K} and Γ_{b,L} are commensurable for arbitrary a,b∈G(A_f) and compact open K,L, since they are arithmetic in the same rational group. If b=qak with q∈G(Q)_+, k∈K and L=K, then Γ_b=qΓ_aq⁻¹, and x↦qx identifies their effective quotients.

The construction or proof follows this route:

1. Import Reduction.levelArithmetic_commensurable_pair for the two compact-open level arithmetic subgroups; intersect with the same finite-index rational component subgroup. This gives commensurability for arbitrary representatives, without assuming they lie in one double coset.
2. Compute the conjugation identity for b=qak, preserving the chosen component.

Direct inputs: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraData:D5/component-subgroup`.

Acceptance checks:

- Commensurability does not require a,b to represent the same double coset.
- Representative change uses q∈G(Q)_+ when X⁺ is fixed.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dea8191cc6047d6142a65872ebce6eeeb841a29b/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.levelArithmetic_commensurable_pair. Already specifies the arbitrary-representative, arbitrary-compact-open commensurability used here.

### Shimura specialization of cofinal neat levels

Declaration **TauCeti.Shimura.neat_sublevels** (theorem), node `ShimuraVarieties:V0/neat-sublevels`.

Specialize AA.4/neat-level-exists to the rational group of a pure Shimura datum: every compact open K contains a normal open K₀ of finite index that is neat in the D5 rational-conjugate sense. Apply the same supplier inside every prescribed compact open sublevel for cofinality. Existence and the normal-core construction remain owned by AA.4; this node is only the convention bridge to the Shimura tower.

The construction or proof follows this route:

1. Import AA.4/neat-level-exists, including its normality and finite-index conclusions; do not repeat its faithful-representation congruence proof.
2. Use the checked AA.4 neat-level and D5 neat-level predicates: both require rational points in every adelic conjugate to be neat. Representation independence identifies their conventions.
3. Apply the supplier to each prescribed compact open sublevel. Neatness is stable under subgroups, so these sublevels form a cofinal system for the tower.

Direct inputs: `AdelicAlgebraicGroups:AA.4/neat-level-exists`, `AdelicAlgebraicGroups:AA.4/neat-level`, `ShimuraData:D5/neat-level`, `ShimuraData:D5/neat-representation-independence`.

Acceptance checks:

- No assertion that all principal level 2 subgroups are neat.
- For GL₂ principal N≥3 use D5/gl2-congruence-neat; N=2 retains −I.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.5 and §5, pp.34,58. SVI gives the Shimura use of neat congruence subgroups. AA.4 owns existence; the local target imports it and identifies the D5 convention.

Atlas planet: **Neat levels in the Shimura tower**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.6, 3.11 and 5.13, pp.34,37,58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Effective arithmetic action**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemmas 5.11–5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Finite component decomposition**.

### Abelianized component formula

Declaration **TauCeti.Shimura.simply_connected_components** (theorem), node `ShimuraVarieties:V0/simply-connected-components`.

Assume G^der is simply connected. Put T=G/G^der and ν:G→T, T(Q)^†=ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)). Then π₀(Sh_K^an(G,X))≃T(Q)^†\T(A_f)/ν(K). Apply strong approximation only to the semisimple simply connected derived group, whose Q-simple factors have noncompact real points by SV3; never to G or a torus without hypotheses.

The construction or proof follows this route:

1. Specialize AA.4/class-set-abelianization to the component stabilizer G(Q)_+. The derived rational subgroup lies in G(Q)_+; retain the actual image ν(G(Q)_+).
2. Use SVI 5.18–5.20 and AA.4/hasse-principle-simply-connected to identify that image with T(Q)∩ν(Z(G)(R)). Finite-place torsors vanish by AA.4/kneser-local-torsor.
3. Import AA §4.5 abelianization-integral-lifts and finite-adelic abelianization: smooth reductive models outside finitely many primes, connected-kernel residue-field surjectivity by Lang and integral lifting by Hensel are already planned. Restricted products then give adelic surjectivity; do not plan these inputs again. The positivity identity and local openness specialization remain the AA.4 request.
4. Apply strong approximation to G^der, with noncompactness on each Q-simple real factor supplied by SV3, to make the fibres single connected arithmetic quotients. Local openness gives compact open ν(K).

Direct inputs: `ShimuraVarieties:V0/component-decomposition`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/class-set-abelianization`, `AdelicAlgebraicGroups:AA.4/kneser-local-torsor`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`.

Acceptance checks:

- For GL₂, T(Q)^†=Q_{>0}; principal level N gives (Z/NZ)×.
- A definite quaternion norm-one group fails the real noncompactness condition.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.17, Lemmas 5.18–5.21 and component-fibre argument, pp.59–61. Lemma 5.20 identifies rational positivity; Lemma 5.21 supplies the adelic image/open-subgroup conclusions. The component-fibre argument applies strong approximation only to the derived group.
- [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dea8191cc6047d6142a65872ebce6eeeb841a29b/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §§4.1 and 4.5, abelianization-integral-lifts, finite-adelic abelianization and class-set abelianization. Supplies the existing local torsor, almost-all integral lift and restricted-product/class-set targets; the positive rational component image remains a Shimura specialization.

Atlas planet: **Abelianized components**.

## V1. The analytic tower

The carrier is a genuine orbit quotient of X×G(A_f), and its universal property controls all point formulas. Charts are descended through the effective arithmetic action. At neat levels these give manifolds; arbitrary levels use normal analytic finite quotients of neat normal sublevels. A level projection and a right translation have different target levels. With R_g([x,a])=[x,ag], the target is g⁻¹Kg. The Hecke span instead uses K∩gKg⁻¹ to give two arrows to level K. Composition uses the fibre product with its double-coset multiplicities, rather than an unjustified single-intersection formula. Datum maps are holomorphic at compatible levels; the closed-immersion assertion requires the small-level separation theorem.

### Finite-level analytic Shimura points

Declaration **TauCeti.Shimura.AnalyticPoints** (definition), node `ShimuraVarieties:V1/analytic-points`.

For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.

The construction or proof follows this route:

1. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.
2. Use the explicit component equivalence of V0 to specify the quotient topology and map points.

Direct inputs: `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/level-quotient`, `mathlib:MulAction.orbitRel.Quotient`, `ShimuraVarieties:V0/component-decomposition`.

Uses that determine the API:

- **Milne 5.13**: component charts use this precise rational diagonal quotient.
- **V8 level-tower**: analytic comparison of algebraic level maps.

Planning API:

- **TauCeti.Shimura.AnalyticPoints.mk** (constructor): Send (x,a) to [x,a]_K.
- **TauCeti.Shimura.AnalyticPoints.mk_eq** (characterisation): [x,a]_K=[y,b]_K iff ∃q∈G(Q), k∈K with y=qx and b=qak.
- **TauCeti.Shimura.AnalyticPoints.lift** (universal-property): A function on X×G(A_f) invariant under the rational diagonal and right K actions descends uniquely; evaluation at [x,a] recovers its value.
- **TauCeti.Shimura.AnalyticPoints.level** (functoriality): For K′⊂K send [x,a]_{K′} to [x,a]_K; identity and composition hold.

Discriminating unit-test specifications:

- **TauCeti.Shimura.AnalyticPoints.trivial** (degenerate): The trivial datum has one point at its unique level.
- **TauCeti.Shimura.AnalyticPoints.torus** (compatibility): For singleton torus datum, Sh_K^pts=T(Q)\T(A_f)/K, including the rational quotient.
- **TauCeti.Shimura.AnalyticPoints.keep_domain** (non-example): For GL₂ the fibre of one finite component is Γ_a\ℍ, an infinite set, not a singleton finite double coset.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, definition before Lemma 5.13, p.57. Supports finite-level analytic shimura points. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.

Atlas planet: **Analytic Shimura variety**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Analytic tower**.

### Holomorphic finite level maps

Declaration **TauCeti.Shimura.holomorphic_level_maps** (theorem), node `ShimuraVarieties:V1/holomorphic-level-maps`.

For K′⊂K, Sh_{K′}^an→Sh_K^an is finite and holomorphic. If K is neat it is locally biholomorphic; after algebraization in V3 it is finite étale. For K′ normal in K, the effective image H of K/K′ in Aut(Sh_{K′}^an) acts over Sh_K^an and its orbit quotient is Sh_K^an. H is a subgroup of the automorphisms over the base; it need not be the full deck group on a disconnected cover. A full deck-group formula requires the separate connected regular-cover hypotheses. For nonnormal K′ no such group formula is asserted.

The construction or proof follows this route:

1. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.
2. Lift through component quotient charts to prove holomorphicity and local biholomorphicity at neat target.
3. Compute the kernel of K/K′ on all points; its effective image gives the finite quotient. Do not identify that image with every automorphism over the base of a disconnected cover.

Direct inputs: `ShimuraVarieties:V1/analytic-structure`, `AdelicAlgebraicGroups:AA.4/level-covering-map`, `ShimuraVarieties:V0/component-decomposition`, `AdelicAlgebraicGroups:AA.4`.

Acceptance checks:

- The quotient-action group is H=(K/K′)/ker(action); full deck-group equality is asserted only for an appropriate connected regular cover.
- For the norm datum on G_m, principal K(3) gives one point and K(21) gives six points. The effective K(3)/K(21) action is the regular C₆ action; the full automorphism group over the one-point base is S₆.
- A neat covering source does not remove ramification over elliptic points of a non-neat target.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, p.58; finite-level consequence of the arithmetic covering supplier. Supports holomorphic finite level maps. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.

Atlas planet: **Holomorphic level maps**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Holomorphic Hecke translations**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Holomorphic Hecke correspondences**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and following clarification, pp.58–59. Supports holomorphic maps of data. Descend the equivariant map of domain and finite adelic coordinates.

## V2. Baily–Borel and minimal compactification

The proof order is rational boundary geometry, compact Satake topology, analytic automorphic sections, convergent separating series, analytic normality, finite generation and projective realization. The boundary predicate uses the topology and adapted Jacobian factors already constructed, so it does not depend on the eventual analytic or algebraic compactification. Baily–Borel §§8.2–8.5 specify continuous extension and holomorphy on rational strata; §8.9 handles products and compact factors. The induced boundary factor differs from the boundary’s intrinsic canonical factor, as the genus-two test shows. Chow and GAGA algebraize the projective realization. Identification of the full admissible Veronese section ring is a separate proof obligation: a finite separating subring alone does not prove it. The Koecher hypothesis excludes rational PGL₂ quotients, rather than every rational-rank-one factor; modular curves keep the cusp extension condition. Remaining convergence, local-normality and ring-identification refinements are listed precisely below.

### Rational boundary components and incidence

Declaration **TauCeti.Shimura.rational_boundary** (theorem), node `ShimuraVarieties:V2/rational-boundary`.

Let D be the effective Hermitian symmetric domain of a rational semisimple adjoint group. A boundary component F in its bounded realization is rational precisely when its normalizer N(F), viewed as an algebraic subgroup, is defined over Q. For a Q-simple noncompact factor these are the proper maximal rational parabolics; for products take products of boundary components, allowing an interior factor. The image Γ(F) of N(F)∩Γ in N(F)/Z(F), where Z(F) fixes F pointwise, is an arithmetic discontinuous group on the Hermitian domain F. Construct the standard unbounded realization S_F of D and the holomorphic projection π_F:D→F. In adapted coordinates the ambient Jacobian determinant of each normalizer element is constant on π_F-fibres and induces an equivariant boundary line factor. The rational extension D*=D∪⋃F uses just these rational components, with their bounded-realization closure incidence.

The construction or proof follows this route:

1. Use BB §§3.5–3.7 to identify rationality by the Q-defined normalizer and to obtain Γ(F). Relative rational roots and parabolics are imported from the reductive supplier; complete classification interfaces are the recorded refinement.
2. Construct S_F and π_F by the adapted Cayley/Siegel realization. BB §§1.8–1.11 and 3.3(ii) show that normalizer Jacobians descend along π_F, and that compatible realization changes identify the induced factors.
3. Use BB §§3.8–3.9 for nested boundary components and their simultaneous standard realizations; use the product decomposition of §§3.3(i), 8.9 for general semisimple domains.

Direct inputs: `ShimuraData:D2/hermitian-domain-components`, `ShimuraData:D3/borel-embedding`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite`.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §3.3(ii), pp.470–472; §§3.5–3.7, pp.472–474; §§1.8–1.11, pp.454–457; §8.9, pp.512–514. Gives the rational normalizer criterion, arithmetic boundary group and adapted Jacobian/projection needed to define boundary restriction.

Atlas planet: **Rational boundary components**.

### Satake topology and compactness

Declaration **TauCeti.Shimura.satake_compactness** (theorem), node `ShimuraVarieties:V2/satake-compactness`.

Equip D* with the rational Satake topology constructed by transporting the natural closures of arithmetic fundamental sets and their rational translates (BB §§4.8–4.9). It is independent of the chosen reduction fundamental set, restricts to the usual topology on every Hermitian stratum and makes rational domain automorphisms continuous. For x in a rational stratum F, good neighborhoods U form a basis: U is Γ_x-invariant, γU∩U is empty for γ∉Γ_x, and a rational stratum F′ meets U precisely when F lies in its natural closure. For arithmetic Γ the quotient Γ\D* is compact Hausdorff with open dense Γ\D and finitely many arithmetic boundary strata; closure is given by the rational incidence relation.

The construction or proof follows this route:

1. Construct the topology from closures of finitely many rationally translated Siegel domains, using AA.3 finite-cover and finite-overlap reduction. BB §4.9 proves independence, rational invariance and orbit separation.
2. Shrink at each boundary point to obtain the isotropy and incidence conditions of BB §§4.9(iv), 4.10. These good neighborhoods supply the local boundary-extension predicate without an analytic compactification assumption.
3. Apply BB §4.11 to the finitely many parabolic arithmetic orbits: fundamental-set compactness gives compactness, orbit separation gives Hausdorffness, and boundary incidence gives the closure of each quotient stratum. Exact topological/reduction interfaces remain the refinement in the gap register.

Direct inputs: `ShimuraVarieties:V2/rational-boundary`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§4.8–4.11, pp.482–484. Provides the topology, good neighborhoods and compact quotient before analytic normality or algebraization.

Atlas planet: **Satake compactification**.

### Analytic automorphic graded ring

Declaration **TauCeti.Shimura.AutomorphicRing** (definition), node `ShimuraVarieties:V2/analytic-automorphic-ring`.

Let Γ be a torsion-free effective arithmetic group on D, with rational extension D* and Satake topology from rational-boundary and satake-compactness. For n≥0, A_n(Γ) consists of Γ-invariant holomorphic sections ω of K_D^⊗n satisfying the following boundary predicate. Write ω=f(z)(dz₁∧⋯∧dz_d)^⊗n in domain coordinates, so f(γz)det(Dγ_z)^n=f(z). For every rational boundary component F and every rational domain automorphism q carrying F to a standard component F_b, express the transported ω by its scalar coefficient f_{F,q} in the standard unbounded realization S_b of D. Require a holomorphic f^∂_{F,q}:F_b→C such that f_{F,q} on D and f^∂_{F,q} on F_b together define a continuous function on D∪F_b with its subspace Satake topology. Transport uses the canonical-section Jacobian rule, not the unchanged coefficient in a bounded chart. Equivalently, on every good neighborhood of x∈D*, an adapted coefficient extends continuously to the whole neighborhood and holomorphically on each rational stratum meeting it (BB §§8.3–8.5). For a product domain use adapted product realizations, with compact factors unchanged. The extension defines Φ_Fω in the n-th tensor power of the boundary factor ℰ_F induced from the ambient Jacobian along π_F, not in general K_F^⊗n. Define A(Γ)=⊕_{n≥0}A_n(Γ), with pointwise tensor product and constant unit. A cusp form has Φ_Fω=0 for every proper rational F, an additional condition. A positive common tensor power gives a Veronese ring; its projective comparison is proved after finite generation.

Additional hypotheses and carrier conventions:

- D has the rational semisimple effective presentation of V0 and rational boundary data of V2; Γ is arithmetic, effective and torsion-free.
- The Satake topology and adapted unbounded realizations are constructed before this definition. No analytic or algebraic structure on Γ\D* is assumed in its boundary predicate.
- The convention uses a left domain action and canonical-section pullback; coordinate changes of coefficients include their determinant to the n-th power.

The construction or proof follows this route:

1. Use the derivative cocycle for K_D and the adapted π_F-fibre-constant determinants of rational-boundary to construct ℰ_F. BB §8.2 identifies this induced boundary factor under rational and nested realization changes.
2. Define admissibility by continuous extension in the subspace Satake topology and holomorphy on F. BB §8.3 proves independence of q and compatible unbounded coordinates; §§8.4–8.5 prove equivalence with the good-neighborhood predicate, including all incident strata.
3. Uniqueness on the dense interior gives compatible restriction Φ_F. Multiplying the extended coefficient functions preserves continuity and stratum holomorphy, hence grading and product restriction. Pullback to finite-index arithmetic subgroups preserves the predicate.
4. Use BB §8.9 to pass from Q-simple factors to their products and finite-index arithmetic groups, with compact factors unchanged. Once normal-analytic-compactification is proved, admissible degree-zero functions are holomorphic on a compact connected normal analytic space, hence constant.

Direct inputs: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraData:D3/homogeneous-variation`, `ComplexComparisonPartII:C0`.

Uses that determine the API:

- **V2 projective-realization**: the graded analytic sections construct the projective embedding without an algebraic bundle assumption.
- **AutomorphicBundles:B2**: compares the algebraized bundle/section ring with this analytic construction.

Planning API:

- **TauCeti.Shimura.AutomorphicRing.degree** (data): The degree-n piece is exactly the admissible analytic section space A_n(Γ) defined by the boundary predicate. After normal-analytic-compactification, A_0=C on a connected quotient by compactness and the maximum principle.
- **TauCeti.Shimura.AutomorphicRing.mul** (structure): Multiplication A_m×A_n→A_{m+n} is pointwise tensor product; unit and associativity hold.
- **TauCeti.Shimura.AutomorphicRing.siegel** (projection): For a rational F, Φ_F sends A_n(Γ) to (N(F)∩Γ)-invariant holomorphic sections of ℰ_F^⊗n, the factor induced by the ambient determinant along π_F. Retain the normalizer action on the factor; use the Γ(F) action when it descends, after a common tensor power if necessary to kill finite characters. It is complex-linear and Φ_F(ωη)=Φ_F(ω)Φ_F(η) in the induced grading. Transport and nested restriction commute under the specified factor isomorphisms; no equality with K_F^⊗n is asserted.
- **TauCeti.Shimura.AutomorphicRing.level** (functoriality): For Γ′⊂Γ, pullback embeds A_n(Γ) into A_n(Γ′); identity and composition hold.
- **TauCeti.Shimura.AutomorphicRing.veronese** (compatibility): Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.
- **TauCeti.Shimura.AutomorphicRing.mk** (constructor): A holomorphic canonical n-section satisfying Γ-invariance and continuous, stratum-holomorphic extension in every rational adapted chart defines an element of A_n; evaluation returns the supplied section.
- **TauCeti.Shimura.AutomorphicRing.ext** (extensionality): Two elements of A_n are equal if their holomorphic section values agree at every point of D.
- **TauCeti.Shimura.AutomorphicRing.eval** (projection): Evaluation on D is complex-linear on each degree and carries the graded product to pointwise multiplication.
- **TauCeti.Shimura.AutomorphicRing.integral_iff** (characterisation): Global boundary admissibility is equivalent to integral local sections on every good neighborhood: one adapted coefficient extends continuously over the whole neighborhood and holomorphically on each incident rational stratum. The rational-chart condition and this local condition use only D* topology and the induced factors.
- **TauCeti.Shimura.AutomorphicRing.change_chart** (compatibility): Changing the rational transport or a compatible unbounded realization carries an admissible coefficient and its boundary limits to the new ones by the canonical Jacobian transition. Thus the extension predicate and induced boundary section are independent of those choices, via the ℰ_F factor isomorphism.

Discriminating unit-test specifications:

- **TauCeti.Shimura.AutomorphicRing.degree_zero** (degenerate): On a connected compactification the degree-zero piece consists of constants.
- **TauCeti.Shimura.AutomorphicRing.elliptic_weight** (compatibility): For ℍ the canonical n-th automorphy factor corresponds to scalar modular weight 2n, with holomorphy at cusps.
- **TauCeti.Shimura.AutomorphicRing.not_cusp** (non-example): For the torsion-free principal group Γ(3)⊂SL₂(Z), the restriction of E₄ is an allowed weight-4 (degree-two) form, with constant Fourier coefficient 1 at infinity. It is not a cusp form.
- **TauCeti.Shimura.AutomorphicRing.pole_at_cusp** (non-example): The modular j-function is holomorphic on ℍ and Γ(3)-invariant in degree zero, but its q^−1 pole at infinity has no continuous finite boundary limit. It is excluded from A_0. Holomorphy and the interior transformation law alone are insufficient.
- **TauCeti.Shimura.AutomorphicRing.induced_weight** (computation): For the genus-two Siegel domain, det(Dγ_Z)=det(CZ+D)^−3, so canonical degree n has scalar weight 3n. Restriction to a genus-one rational boundary retains scalar weight 3n, whereas intrinsic boundary canonical degree n has weight 2n. At n=2 the induced weight is 6, corresponding to intrinsic boundary degree 3, not degree 2. A Φ_F API replacing ℰ_F^⊗n by K_F^⊗n fails this calculation.

Acceptance checks:

- The predicate quantifies over every rational boundary component and rational adapted chart, uses the previously constructed Satake topology, and is independent of the later analytic/projective compactification.
- Chart changes retain the canonical Jacobian factor; Φ_F has values in the ambient-induced boundary factor, with product compatibility. It need not preserve intrinsic boundary canonical weight.
- Degree-zero constants, modular weight 2n, noncuspidal E₄ at Γ(3), a cusp pole, and genus-two boundary weight must satisfy the tests below.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§8.2–8.5, pp.509–511; §8.7, p.512; §8.9, pp.512–514. Defines the induced boundary factor and continuous, stratum-holomorphic extension in adapted realizations; supplies local/global equivalence and product reduction before algebraization.

Atlas planet: **Automorphic graded ring**.

### Automorphic sections separating strata

Declaration **TauCeti.Shimura.poincare_eisenstein** (theorem), node `ShimuraVarieties:V2/poincare-eisenstein`.

For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of Γ\D* and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

The construction or proof follows this route:

1. Form sufficiently high-weight Poincaré–Eisenstein series in adapted realizations. AA.3 reduction and BB §§6–7 provide the normal majorants on truncated Siegel neighborhoods; the exact inequalities/convergence proof remain a refinement.
2. BB §8.6 gives integral boundary extension and surjection to the boundary Poincaré-series space for the induced factor, with vanishing on the specified other strata. BB §§8.7–8.8 give admissible boundary Taylor interpolation and point separation; §8.9 extends this to products and finite-index groups.
3. Use that interpolation in the local analyticity criterion and projective comparison of §§9–10. Prescribing boundary Poincaré series is not a claim that every arbitrary boundary holomorphic function lifts; the induced factor and high/divisible-weight hypotheses are retained.

Direct inputs: `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/satake-compactness`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`.

Acceptance checks:

- Point separation alone does not assert an immersion or analytic closed embedding.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Theorem 8.6, pp.511–512; §§8.7–8.9, pp.512–514; §§7.7–7.9, pp.506–508 (convergence proof refinement). Identifies the precise boundary restriction and separation route; the majorant estimates and analytic-germ argument remain proof refinements.

### Normal analytic Baily–Borel quotient

Declaration **TauCeti.Shimura.normal_analytic_compactification** (theorem), node `ShimuraVarieties:V2/normal-analytic-compactification`.

On the compact Satake quotient Γ\D*, let O(U) be the continuous complex functions on U whose restrictions to every arithmetic Hermitian stratum are holomorphic. This sheaf makes Γ\D* a normal complex analytic space, with its original analytic open stratum Γ\D and the specified holomorphic stratum restriction maps. Its structure agrees with the projective realization by sufficiently high-weight integral automorphic sections.

The construction or proof follows this route:

1. Define the sheaf by continuity and stratum holomorphy, before projective algebraization. Use local ratios of integral sections with nonzero denominator and the boundary interpolation from poincare-eisenstein.
2. Apply BB §9 analyticity criterion to obtain the normal local analytic models; §10.4 verifies its hypotheses for the Satake quotient. The complete local criterion proof and normality interfaces remain recorded refinements.
3. BB §§10.6–10.11 compare local rings with the section-built projective charts. Finite analytic invariants extend the result to arithmetic groups with torsion; invariants are not replaced by an orbifold point-set carrier.

Direct inputs: `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/satake-compactness`, `ComplexComparisonPartII:C0`.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(a), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; §§10.6–10.11, pp.521–523; §§9.6–9.7, pp.517–518. States the normal analytic structure and projective comparison; the full §9 analyticity-criterion proof remains an explicit refinement.

### Finite generation of automorphic forms

Declaration **TauCeti.Shimura.automorphic_finite_generation** (theorem), node `ShimuraVarieties:V2/automorphic-finite-generation`.

The analytic graded C-algebra A(Γ) is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize Γ\D* as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

The construction or proof follows this route:

1. Use the boundary interpolation and normal analytic compactification to construct high-weight point-separating forms and the holomorphic projective map (BB §§10.6–10.8).
2. BB §§10.9–10.11 construct a finitely generated integrally closed graded subring from a finite separating system and its normalization, and identify its projective spectrum with the analytic compactification. This subring is not by definition the entire admissible ring A.
3. In the range with no three-dimensional Q-normal subgroup, BB Theorem 10.14 identifies the full holomorphic automorphic ring and proves finite generation via algebraic coherent sheaves on the projective realization. For modular-curve factors prove the corresponding identification with cusp-regular logarithmic canonical sections, then handle products and finite arithmetic quotients. These full-ring identifications remain the recorded proof refinement; existence of a finite separating subring alone does not establish them.
4. Check Proj invariance under positive Veronese and finite arithmetic invariants, retaining the tensor and character conventions fixed in analytic-automorphic-ring.

Direct inputs: `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/poincare-eisenstein`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- The weight-one piece need not itself generate the ring.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(c), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§10.6–10.11 and Theorem 10.14, pp.521–524. The earlier sections construct the normalized finite separating subring and its projective realization. Theorem 10.14 supplies full-ring finite generation under its additional exclusion of three-dimensional Q-normal subgroups; the modular-curve and mixed-factor cases need the recorded separate comparison.

Atlas planet: **Baily–Borel projective realization**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.12 and Remark 3.13, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; Theorem 10.11, p.523; §4.11, p.484. Combines the normal analytic Satake structure, normally projective realization and arithmetic boundary stratification; algebraization uses the separately imported Chow/GAGA suppliers.

Atlas planet: **Baily–Borel theorem**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(b)–(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Proposition 3.15, p.478; Theorem 10.14, pp.523–524. These give boundary codimension and extension of holomorphic automorphic sections under the sufficient hypothesis excluding three-dimensional Q-normal subgroups. SVI gives the sharper split-PGL₂ exception used in this target; the two hypotheses are not identified.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39 and Corollary 3.16 discussion, p.40; general extension proof is a gap. Supports level maps on minimal compactifications. Construct the boundary map and compatible graded-ring pullback.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 3.15, p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Borel extension theorem**.

### Borel algebraicity

Declaration **TauCeti.Shimura.borel_algebraicity** (theorem), node `ShimuraVarieties:V3/borel-algebraicity`.

For torsion-free arithmetic Γ^eff in Hol(D)^+ and a smooth finite-type C-scheme S, every holomorphic map S^an→(Γ^eff\D)^an is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

The construction or proof follows this route:

1. Import R09.7/snc-compactification for the quasi-projective source: it preserves S and gives a smooth projective compactification with strict-SNC boundary. Its étale coordinate charts become local holomorphic charts by C0; the open inclusion is locally a punctured polydisk.
2. Apply extension, glue by uniqueness, and algebraize the proper graph using C4. Restrict to S.
3. For a general smooth separated finite-type source use quasi-projective opens and scheme descent. For nonseparated source the same local gluing works whenever the holomorphic map and analytification are available.

Direct inputs: `ShimuraVarieties:V3/borel-extension`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`, `ComplexComparisonPartII:C4`, `ShimuraVarieties:V2/baily-borel`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- exp:C→A¹=Y(1) is a counterexample when the arithmetic target has torsion.
- The proper graph step does not by itself establish Borel for nonproper sources.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.14 and proof, pp.39–40. The proof reduces to a smooth projective SNC compactification and local punctured-polydisk extension. The existing R09.7/snc-compactification supplies the algebraic compactification, while C0 supplies the analytic chart comparison.

Atlas planet: **Borel algebraicity theorem**.

### Unique algebraization at neat level

Declaration **TauCeti.Shimura.unique_algebraization** (theorem), node `ShimuraVarieties:V3/unique-algebraization`.

Any two smooth finite-type C-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models owned by V8.

The construction or proof follows this route:

1. Apply Borel to the identity and inverse between the two analytic quotient descriptions.
2. Faithfulness of analytification identifies composites with identities. No arbitrary analytic automorphism is added to the chosen comparison.

Direct inputs: `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V2/baily-borel`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- The isomorphism is unique relative to the chosen analytic comparison.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Corollary 3.16, p.40. Supports unique algebraization at neat level. Apply Borel to the identity and inverse between the two analytic quotient descriptions.

Atlas planet: **Uniqueness of algebraization**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and 3.16, pp.58–59,40. The located passage supports algebraic maps of shimura data. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

### Algebraic finite quotients and normalization

Declaration **TauCeti.Shimura.finite_quotient_algebraization** (theorem), node `ShimuraVarieties:V3/finite-quotient-algebraization`.

For neat normal K′⊂K, the finite group K/K′ acts algebraically on Sh_{K′,C}; its geometric quotient exists as a normal quasi-projective C-scheme and analytifies to Sh_K^an. Quotients through two sublevels agree via common refinement. The source at K′ is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

The construction or proof follows this route:

1. At neat source algebraize translations by Borel into another neat source.
2. Import SF.1/finite-group-quotient for scheme existence, invariant affine covers and the free finite étale torsor case. Since the source is quasi-projective over C, every finite orbit lies in an affine open. Request only the additional descended ample-power/quasi-projectivity API, and use C0 for the quotient analytic comparison.
3. Normality is preserved by finite invariants; characterize normalization componentwise and use common refinement.

Direct inputs: `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/unique-algebraization`, `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `SchemeAndStackFoundations:SF.1/finite-group-quotient`, `SchemeAndStackFoundations:SF.1`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- A quotient with stabilizers is not generally smooth or étale.
- Normalization is in the source field(s), not automatically the target field.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Remark 3.13(a), p.39; neat tower p.58; general finite quotient imported from SF.1/finite-group-quotient. Supports algebraic finite quotients and normalization. At neat source algebraize translations by Borel into another neat source.

Atlas planet: **Finite quotient algebraization**.

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

Sources:

- [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2 and §4.6, pp.2–4,18. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

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

Sources:

- [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §4.6, Theorems 4.12–4.13, p.18. The located passage supports definable-graph proof of borel algebraicity. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Definable Borel algebraicity**.

## V4. Torus models and the canonical condition

Reciprocity supplies a finite continuous Galois action on the actual torus double quotient. At finite level this needs independence only modulo T(Q)K. At the inverse limit the natural values are modulo the closure of T(Q); literal principal equality is a stronger CM fact. The finite Galois-set equivalence constructs a finite étale scheme over the reflex field with these points and actions. The AGHMP stack at non-neat level retains inertia and is compared to its coarse scheme separately. The canonical-model condition uses these genuine special pairs inside any datum. Existence and density of special points, followed by Hecke density, supply the points used to rigidify descent. This stage formulates the condition and constructs the torus instance; it does not assume general existence.

### Milne geometric Artin conversion

Declaration **TauCeti.Shimura.geometricArtin** (definition), node `ShimuraVarieties:V4/geometric-artin`.

Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.

Additional hypotheses and carrier conventions:

- The supplied reciprocity homomorphism has abelian target and arithmetic Frobenius normalization.

The construction or proof follows this route:

1. Invert the arithmetic Artin homomorphism in its abelian target.
2. Preserve continuity, surjectivity and kernel; compare a local uniformizer and the cyclotomic character before applying CM reciprocity.

Direct inputs: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Uses that determine the API:

- **V4 canonical condition**: pins the sign in σ[x,a]=[x,r_x(s)a].
- **V5 main CM theorem**: pins the Tate-module scalar normalization.

Planning API:

- **TauCeti.Shimura.geometricArtin_apply** (simp): art_F(s)=rec_F(s)⁻¹.
- **TauCeti.Shimura.geometricArtin_mul** (structure): art_F(st)=art_F(s)art_F(t).
- **TauCeti.Shimura.geometricArtin_kernel** (compatibility): ker art_F=ker rec_F as closed subgroups.
- **TauCeti.Shimura.geometricArtin_norm** (functoriality): For L/F finite, art_F(N_{L/F}s)=res(art_L(s)).

Discriminating unit-test specifications:

- **TauCeti.Shimura.geometricArtin_uniformizer** (computation): At an unramified place, art_F(π_v) is inverse arithmetic Frobenius.
- **TauCeti.Shimura.geometricArtin_one** (degenerate): art_F(1)=1.
- **TauCeti.Shimura.geometricArtin_cyclotomic** (compatibility): For u=χ_cyc(σ)∈Zhat×, art_Q(u)=σ on Q^ab; changing to rec reverses the action.

Sources:

- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), §3, p.21, before Lemma 3.4. Supports milne geometric artin conversion. Invert the arithmetic Artin homomorphism in its abelian target.

### Reflex norm of a special torus

Declaration **TauCeti.Shimura.ReflexNorm** (definition), node `ShimuraVarieties:V4/reflex-norm`.

For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).

The construction or proof follows this route:

1. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.
2. Check Galois invariance of the product formula and descend the morphism over Q.
3. Evaluate on restricted adelic points and prove rational-principal and level compatibility.

Direct inputs: `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.1/base-change-adelic`.

Uses that determine the API:

- **V4 torus-model**: defines its finite Galois-set action.
- **CM.2 normalized-idele-torsion-dictionary**: compares the global scalar with polarized CM lattice reciprocity.

Planning API:

- **TauCeti.Shimura.ReflexNorm.apply_split** (simp): In splitting coordinates r_h(s)=∏ρ ρ(μ_h(s_ρ)).
- **TauCeti.Shimura.ReflexNorm.principal** (compatibility): For b∈E×, r_h(b)∈T(Q), hence its action on every torus double quotient is trivial.
- **TauCeti.Shimura.ReflexNorm.map** (functoriality): For a torus subdatum morphism f, after norm from a common reflex field, f∘r_h=r_{f∘h}; retain the field-change norm.
- **TauCeti.Shimura.ReflexNorm.cm_type** (compatibility): For the CM torus datum supplied by D5/cm-torus and CM.0, r_h agrees with the multiplicative reflex-type norm.
- **TauCeti.Shimura.ReflexNorm.continuous** (structure): The finite-idelic map is a continuous group homomorphism.
- **TauCeti.Shimura.ReflexNorm.ext** (extensionality): Two rational torus homomorphisms Res_{E/Q}G_m→T agreeing on the split cocharacter formula after a splitting-field base change are equal.
- **TauCeti.Shimura.ReflexNorm.mul** (simp): The reflex norm sends 1 to 1 and r_h(st)=r_h(s)r_h(t), as an algebraic group morphism and on finite ideles.

Discriminating unit-test specifications:

- **TauCeti.Shimura.ReflexNorm.trivial** (degenerate): A trivial cocharacter gives the constant identity morphism.
- **TauCeti.Shimura.ReflexNorm.split_power** (computation): For T=G_m, E=Q and μ(t)=t^n, r_h(s)=s^n, including n=0 and negative n.
- **TauCeti.Shimura.ReflexNorm.aghmp** (compatibility): For T=Res_{E/Q}G_m/ker(N_{F/Q}) in AGHMP §3.1 and its distinguished cocharacter, r_h is the natural quotient map Res_E G_m→T.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §12, formulas (60)–(61), p.114, corrected from sums to products. Supports reflex norm of a special torus. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.

Atlas planet: **Reflex norm**.

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

Sources:

- [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), §2, pp.3–4, reciprocity map and its finite-level action. The located passage supports finite-level reciprocity and idele independence. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Special-point reciprocity**.

### Canonical-model condition

Declaration **TauCeti.Shimura.CanonicalModel** (definition), node `ShimuraVarieties:V4/canonical-model`.

A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.

The construction or proof follows this route:

1. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.
2. Use reciprocity-finite-action to make the formula independent of the lift.
3. Record finite-level and compatible-tower variants and compare them via sufficiently small levels.

Direct inputs: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraData:D4/special-pair`, `ShimuraData:D3/reflex-field`, `ShimuraVarieties:V4/reciprocity-finite-action`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Over`.

Uses that determine the API:

- **V5 Siegel canonical model**: main CM theorem verifies the condition on all CM special points.
- **V6 inheritance and V7 descent**: prove existence for actual data.
- **V8 model-uniqueness**: uses this complete condition and adelic functoriality.

Planning API:

- **TauCeti.Shimura.CanonicalModel.scheme** (projection): The underlying scheme is over Spec E(G,X), with normal/quasi-projective structure.
- **TauCeti.Shimura.CanonicalModel.comparison** (projection): The chosen comparison is an isomorphism of complex analytic spaces after base change to C.
- **TauCeti.Shimura.CanonicalModel.special_rational** (data): For every actual special pair and a, the comparison point is E(T,h)^ab-rational.
- **TauCeti.Shimura.CanonicalModel.special_action** (characterisation): Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
- **TauCeti.Shimura.CanonicalModel.level** (functoriality): A tower supplies level maps over E, with identity/composition and analytic point formula.
- **TauCeti.Shimura.CanonicalModel.baseChange** (compatibility): For E⊂L⊂C, base change retains the same comparison and restricted special-point action; the defining minimal field remains E.
- **TauCeti.Shimura.CanonicalModel.ofSpecialAction** (constructor): An E-scheme with the stated normal/quasi-projective structure, analytic comparison, special-point rationality and the full reciprocity formula defines a finite-level canonical model. Tower construction also requires compatible level maps and translations.
- **TauCeti.Shimura.CanonicalModel.hom_ext** (extensionality): Two E-morphisms between the underlying finite-level models whose complex analytic maps agree are equal, by faithful base change and analytification. This is morphism extensionality; model uniqueness remains V8.

Discriminating unit-test specifications:

- **TauCeti.Shimura.CanonicalModel.trivial** (degenerate): The trivial datum has canonical model Spec Q with its one-point comparison.
- **TauCeti.Shimura.CanonicalModel.torus_neat** (compatibility): The finite étale torus model satisfies this condition using its constructed Galois action.
- **TauCeti.Shimura.CanonicalModel.not_arbitrary_subset** (non-example): For T=G_m, h(z)=z zbar and principal K(5), the analytic quotient has two points (Z/5Z)×/{±1}. The split model Spec Q ⊔ Spec Q with any two-point comparison passes an empty-subset test but fails canonicity: an automorphism with cyclotomic character 2 modulo 5 must interchange the two classes by reciprocity, whereas the split model fixes both.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 12.8, p.114 and Definition 12.10, p.115. Supports canonical-model condition. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.

Atlas planet: **Canonical model**.

### Finite étale torus canonical models

Declaration **TauCeti.Shimura.torusModel** (construction), node `ShimuraVarieties:V4/torus-model`.

The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.

The construction or proof follows this route:

1. Apply the finite-étale-scheme/finite-continuous-Galois-set equivalence with its field/base-change comparison.
2. Use the actual finite torus double quotient as the Galois set, not just its cardinality.
3. Transport its complex point equivalence and verify all torus special-pair reciprocity maps by norm functoriality.

Direct inputs: `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/canonical-model`, `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`.

Uses that determine the API:

- **V4 functoriality**: constructs maps by finite Galois sets.
- **AGHMP §3.1**: its neat CM Shimura scheme is this specific torus construction.
- **V8 zero-dimensional-shimura-variety**: adds the general zero-dimensional component datum and tower reciprocity beyond singleton torus data.

Planning API:

- **TauCeti.Shimura.torusModel.points** (equivalence): S_K(Qbar)≃T(Q)\T(A_f)/K as Galois sets, with the prescribed action.
- **TauCeti.Shimura.torusModel.level** (functoriality): For K′⊂K the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
- **TauCeti.Shimura.torusModel.translate** (functoriality): Right translation by a∈T(A_f) is defined over E and commutes with reciprocity.
- **TauCeti.Shimura.torusModel.map** (functoriality): A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
- **TauCeti.Shimura.torusModel.finiteEtale** (structure): The resulting scheme is finite étale over E, with degree equal to the Galois-set cardinality.
- **TauCeti.Shimura.torusModel.hom_ext** (extensionality): Two E-morphisms between finite étale torus models agreeing on all geometric points are equal under the finite-continuous-Galois-set equivalence.

Discriminating unit-test specifications:

- **TauCeti.Shimura.torusModel.maximal_split** (computation): For T=G_m, h(z)=z zbar, K=Zhat×, E=Q, the coarse scheme is Spec Q.
- **TauCeti.Shimura.torusModel.split_level_five** (computation): For the same datum and principal K(5), the Galois set is (Z/5Z)×/{±1}; the degree-two model is Q(ζ₅+ζ₅⁻¹), not Q(ζ₅).
- **TauCeti.Shimura.torusModel.trivial** (degenerate): For the trivial torus every level gives Spec Q.

Sources:

- [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, p.416. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Torus canonical models**.

### AGHMP torus stack and coarse model

Declaration **TauCeti.Shimura.aghmp_stack_comparison** (theorem), node `ShimuraVarieties:V4/aghmp-stack-comparison`.

For the specific AGHMP torus T=Res_{E/Q}G_m/ker(N_{F/Q}), distinguished cocharacter and neat normal K′⊂K, the generic CM Shimura stack is [S_{K′}/(K/K′)]. Its coarse space is S_K, independent of K′; at neat K it is the finite étale scheme above. At non-neat K retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

The construction or proof follows this route:

1. Use the §3.1 computation that the reflex norm is the quotient map.
2. Import SF.1/quotient-stack and quotient-stack-algebraic for the finite constant group action, retaining inertia. SF.1/finite-quotient-coarse identifies its coarse scheme with the finite quotient Galois set S_K; the finite étale S_{K′} is affine, so its orbit-cover hypothesis holds.
3. At a common neat normal refinement the intermediate free level action is a finite étale torsor. Apply SF.1/stack-presentation, or the quotient-stack torsor description, to compare the presentations. Keep stabilizer data at non-neat level; the generic scheme alone cannot encode it.

Direct inputs: `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/reflex-norm`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `SchemeAndStackFoundations:SF.1/stack-presentation`.

Acceptance checks:

- For an imaginary quadratic E at maximal units, roots of unity contribute stack inertia even when the coarse scheme has one geometric point.
- Do not claim a finite DM stack for an arbitrary torus with infinite rational central-unit stabilizers.

Sources:

- [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, pp.415–416. The located passage supports aghmp torus stack and coarse model. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

### Existence and density of special points

Declaration **TauCeti.Shimura.special_existence** (theorem), node `ShimuraVarieties:V4/special-existence`.

Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in X in its real topology, hence their images are Zariski dense in each complex algebraized component.

The construction or proof follows this route:

1. Choose a regular semisimple Lie element in the compact-mod-centre real Cartan; approximate by a rational regular semisimple element.
2. Its rational maximal torus supports the conjugated special homomorphism. Apply the same construction near arbitrary domain points.

Direct inputs: `ShimuraData:D4/special-point`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraVarieties:V2/baily-borel`.

Acceptance checks:

- The rational approximant must remain regular semisimple, not merely a regular nilpotent element.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.3, p.117. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.5, p.118. Supports density of hecke translates. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.

Atlas planet: **Hecke orbit density**.

## V5. CM abelian varieties and Siegel existence

The relative weight-one analytic equivalence is algebraized through Siegel moduli and V3, with integral polarization type and level retained. Full product-CM objects are then descended to number fields so that reduction and Frobenius apply. After a finite extension, semistable reduction gives square-zero inertia on the Tate module. Endomorphisms are defined over the base, and inertia acts by multiplication in the reduced product-CM algebra E⊗Q_ℓ, forcing triviality. NOS then gives good reduction. This argument does not require absolute inertia to be virtually pro-p. The Shimura–Taniyama valuation formula yields an ideal reciprocity theorem using arithmetic Artin; passing through ray classes and all finite torsion levels produces the idelic theorem in geometric Artin normalization. The polarized Tate formula is needed to identify the actual Siegel moduli point, rather than only an unpolarized isogeny class. Every Siegel special point is full CM, including products, so the theorem verifies the complete canonical-model condition. No PEL canonical-model theorem is assumed on this route.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.8, p.122; algebraization through M3 and V3. Supports algebraization of polarized weight-one variations. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.

Atlas planet: **Weight-one algebraization**.

### CM abelian varieties with their algebra action

Declaration **TauCeti.Shimura.CMAbelianVariety** (definition), node `ShimuraVarieties:V5/cm-abelian-variety`.

For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

The construction or proof follows this route:

1. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.
2. Identify the eigenspaces through A5 and apply CM.0 type definitions.
3. Use Rosati positivity for the polarization compatibility; do not build a new CM-type carrier here.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A2`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`.

Uses that determine the API:

- **V5 main theorem**: its actual E-linear Tate representation is compared with reflex reciprocity.
- **V5 Siegel-special-CM**: tests every special point of the Siegel datum.
- **CM.2 arbitrary-dimensional-classification**: imports the full general CM reciprocity theorem.

Planning API:

- **TauCeti.Shimura.CMAbelianVariety.action** (data): The injective E-action on the actual abelian variety is part of the data.
- **TauCeti.Shimura.CMAbelianVariety.type** (projection): The type is the subset of embeddings appearing in Lie(A), using the imported CM.0 definition.
- **TauCeti.Shimura.CMAbelianVariety.homology** (compatibility): H₁(A,Q) is free of rank one over E, with eigenspace decomposition Φ in Lie(A).
- **TauCeti.Shimura.CMAbelianVariety.transport** (functoriality): An E-linear quasi-isogeny transports the full action and type; identity/composition hold.
- **TauCeti.Shimura.CMAbelianVariety.rosati** (characterisation): A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.
- **TauCeti.Shimura.CMAbelianVariety.ofAction** (constructor): An actual abelian variety with an injective CM-algebra action of dimension 2 dim A supplies the full CM object and its Lie type; a compatible polarization is included when Rosati data are requested.
- **TauCeti.Shimura.CMAbelianVariety.hom_ext** (extensionality): Two E-linear quasi-homomorphisms between full CM objects agreeing on H₁(-,Q), or on a rational Tate module after comparison, are equal.

Discriminating unit-test specifications:

- **TauCeti.Shimura.CMAbelianVariety.quadratic** (computation): An elliptic curve with an imaginary quadratic embedding in End⁰ has a full CM action of degree two.
- **TauCeti.Shimura.CMAbelianVariety.product** (compatibility): The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
- **TauCeti.Shimura.CMAbelianVariety.insufficient_degree** (non-example): A scalar Q-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, p.123; field case §10. Supports cm abelian varieties with their algebra action. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.

Atlas planet: **CM abelian varieties**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison 2007c §1.7. Supports rank-one rational cm tate module. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.3 and proof, pp.100–101. Supports number-field models for full cm objects. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.

### Potential good reduction for CM varieties

Declaration **TauCeti.Shimura.cm_potential_good_reduction** (theorem), node `ShimuraVarieties:V5/cm-potential-good-reduction`.

A full CM abelian variety over a number field has potentially good reduction at every finite place. With all E-endomorphisms defined, the inertia image on V_ℓA is finite for ℓ different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

The construction or proof follows this route:

1. First pass to a number field over which all E-endomorphisms are defined. At the chosen finite place apply R11.3/finite-separable-semistable-extension to acquire semistable reduction.
2. By R11.3/inertia-square-zero, (ρ_ℓ(σ)−1)²=0 for inertia after that extension, with ℓ different from the residue characteristic. By rank-one E-linearity, ρ_ℓ(σ) lies in the commutative finite étale algebra E⊗Q_ℓ, which is reduced. Thus ρ_ℓ(σ)=1. Equivalently its multiplication action is both semisimple and unipotent.
3. Apply R11.5/neron-ogg-shafarevich to get good reduction. The original inertia image is finite since an open inertia subgroup is killed. The extension can be chosen over the number field: the excellent DVR supplier applies to the local number-field ring, or realize a completion extension by Krasner.
4. Compactness and the Rosati norm constraint alone do not imply finite inertia. In particular, absolute local inertia is not virtually pro-p; the source error is recorded as E9.

Direct inputs: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-tate-rank-one`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero`.

Acceptance checks:

- This is potential good reduction, not good reduction over the original field.
- The proof is valid in higher dimension.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 and proof, p.101. Proposition 10.5 states potential good reduction. Its absolute-inertia pro-p argument is corrected here via the existing semistable-reduction and inertia suppliers; see E9 and E11.
- [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Theorem 4.2, p.9; Remark 5.6, p.18; Proposition 6.5, pp.23–24. After finite separable extension inertia acts unipotently of height at most two. Rank-one multiplication in E⊗Q_ℓ is semisimple, forcing this inertia action to be trivial.

Atlas planet: **Potential good CM reduction**.

### CM Frobenius endomorphism

Declaration **TauCeti.Shimura.cm_frobenius** (theorem), node `ShimuraVarieties:V5/cm-frobenius`.

Let A/k have full CM by O_E with the action defined over k, let k/Q be Galois containing all conjugates of E, and let P be a good reduction prime of residue cardinality q. The q-power Frobenius of the reduction is represented by π∈O_E under the specialized CM action, with ππbar=q for a compatible polarization.

The construction or proof follows this route:

1. Specialize the defined O_E-action to the good reduction and use A4/etale-tate-module to identify the prime-to-p rational Tate module with that of the generic fibre. It remains rank one over E⊗Q_ℓ; q-power Frobenius commutes with the action defined over the residue field.
2. Let C be the centralizer of E in End⁰ of the reduction. A6/hom-is-free-of-finite-rank gives finite dimension and injects C⊗Q_ℓ into End_{E⊗Q_ℓ}(V_ℓ)=E⊗Q_ℓ. Thus dim_Q C≤dim_Q E; since E⊂C, C=E and Frobenius belongs to E. Only scalar-extended Hom injectivity is used, with ℓ different from the residue characteristic; no Tate surjectivity or lifting of all special-fibre endomorphisms is assumed.
3. A6/characteristic-polynomial-on-tate-module makes the Frobenius endomorphism integral over Z, so its element of E lies in O_E. The compatible polarization and Rosati conjugation give ππbar=q.

Direct inputs: `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

Acceptance checks:

- The Frobenius is arithmetic q-power on the reduction; V4 art is its inverse on Galois reciprocity.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 10.8 and Lemma 10.9 with proof, p.103. The centralizer calculation identifies the specialized CM algebra inside all rational endomorphisms; the Frobenius lemma then gives integrality and the polarization norm.
- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 2.1(a) and proof, p.16; Corollary 1.5, p.6. Prime-to-characteristic scalar-extended Hom injectivity bounds the centralizer by the rank-one E-linear Tate endomorphisms. The calculation needs injectivity, not a general Tate full-faithfulness theorem.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 10.10, p.103 and proof pp.104–105; 2007c Theorem 2.1. Supports shimura–taniyama frobenius calculation. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).

Atlas planet: **Shimura–Taniyama formula**.

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

Sources:

- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.2, pp.19–20. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

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

Sources:

- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Main theorem of complex multiplication**.

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

Sources:

- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(c), pp.22–23. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

### Siegel special points are full CM

Declaration **TauCeti.Shimura.siegel_special_cm** (theorem), node `ShimuraVarieties:V5/siegel-special-cm`.

For the Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree 2g. Products are included, so all special points rather than only simple CM fields are covered.

The construction or proof follows this route:

1. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.
2. By complete reducibility and positive Rosati involution, a torus Mumford–Tate action gives a full CM algebra in the endomorphisms. Conversely a full CM algebra forces a torus Hodge image.

Direct inputs: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraData:D5/siegel-datum`, `ShimuraData:D4/special-point`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- A product of CM elliptic curves is included.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124. Supports siegel special points are full cm. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.12 and existence proof, pp.125–126. Supports the siegel canonical model. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.

Atlas planet: **Siegel canonical model**.

## V6. Hodge and abelian type

A subdatum inherits a canonical model by proving that its suitably small-level image is stable under the appropriate descent comparisons, using special points and reciprocity. An arbitrary complex subvariety of a rational variety need not descend. A Hodge-type embedding into Siegel therefore gives the Hodge-type tower, with uniqueness removing the embedding choice. For abelian type, the witness concerns the connected derived datum. Products and central isogenies act through the completed symmetry; finite effective quotients descend that symmetry and special-point action. The connected/full equivalence then reconstructs the component Galois action over the target reflex field. It is this reconstruction, not equality of two witnesses' components, that gives the full abelian-type model. The connected tower is a pro-object with compatible diagrams and a completion action. The connected adjoint carrier and the full adelic/Galois extension are specified separately; a point-set inverse limit is not a finite-dimensional analytic manifold.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports inheritance by shimura subdata. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Canonical-model inheritance**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports canonical models of hodge type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Hodge-type canonical models**.

### Connected Shimura tower with completed symmetry

Declaration **TauCeti.Shimura.ConnectedTower** (construction), node `ShimuraVarieties:V6/connected-tower`.

For the connected derived datum (G^der,X⁺), whose points are S→G^ad_R and are not required to lift to G^der_R, form the analytic pro-object M⁰=(Γ\X⁺)_Γ and its inverse-limit point set over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.

Additional hypotheses and carrier conventions:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Construct the congruence-indexed inverse system and its compatible symmetry, as in the 1983 appendix.
2. Use the Deligne completed-symmetry construction to define the connected canonical datum with actual Galois compatibility. Its exact extension/coherence source must be checked separately, recorded as a gap.

Direct inputs: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/adjoint-datum`.

Uses that determine the API:

- **V6 connected-full-equivalence**: the completed/Galois symmetry reconstructs all components.
- **Milne 1983 §§1–6**: the conjugation proof is carried out on this connected pro-object.

Planning API:

- **TauCeti.Shimura.ConnectedTower.level** (projection): The Γ-level is the actual algebraized quotient Γ\X⁺.
- **TauCeti.Shimura.ConnectedTower.transition** (functoriality): Subgroup inclusion gives finite algebraic maps; identity and composition hold.
- **TauCeti.Shimura.ConnectedTower.completedAction** (structure): The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
- **TauCeti.Shimura.ConnectedTower.canonicalExtension** (data): The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.
- **TauCeti.Shimura.ConnectedTower.hom_ext** (extensionality): Two morphisms of the congruence-indexed tower diagrams agreeing at each finite level are equal; canonical morphisms additionally commute with the specified completion/Galois extension.
- **TauCeti.Shimura.ConnectedTower.lift** (universal-property): Compatible holomorphic maps from a test complex analytic space Y to every finite Γ\X⁺ quotient give a unique morphism from the constant pro-object Y to the analytic tower; projections recover those maps. The algebraic tower has the analogous compatible-morphism universal property in its pro-category. No finite-dimensional analytic-space structure is asserted on the inverse-limit point set.

Discriminating unit-test specifications:

- **TauCeti.Shimura.ConnectedTower.trivial** (degenerate): A trivial derived group gives the one-point connected tower.
- **TauCeti.Shimura.ConnectedTower.sl2** (compatibility): For the GL₂ datum the connected tower is the congruence tower Γ\ℍ induced by SL₂, with effective ±I removed where present.
- **TauCeti.Shimura.ConnectedTower.not_full** (non-example): A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127; 1983 Appendix, p.263. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Connected Shimura tower**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127. The located passage supports connected and full canonical formulations. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

### Products of connected canonical models

Declaration **TauCeti.Shimura.connected_products** (theorem), node `ShimuraVarieties:V6/connected-products`.

The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

Additional hypotheses and carrier conventions:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Take product inverse systems and product level quotients.
2. Use reflex-norm functoriality to compare marked tori and the Galois extension.
3. Apply compatible finite-component descent where the full datum is reconstructed.

Direct inputs: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraData:D4/product-datum`.

Acceptance checks:

- Product datum reflex field is the compositum, not necessarily either individual field.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(a), p.127. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

### Central-isogeny descent of connected models

Declaration **TauCeti.Shimura.central_isogeny_descent** (theorem), node `ShimuraVarieties:V6/central-isogeny-descent`.

For a central isogeny f:G₁→G₂ of semisimple derived groups with compatible connected data and a connected canonical model of (G₁,X₁⁺), the connected tower for (G₂,X₂⁺) is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be G₁, correcting the repeated G₂ misprint.

Additional hypotheses and carrier conventions:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Compute the map of completed adjoint rational symmetry and its kernel; finite-level images act on the source quotient.
2. Construct the effective finite algebraic quotients and descend their Galois symmetry.
3. Verify reciprocity by central-isogeny compatibility of the cocharacter norm; compare the inverse systems.
4. Central isogenies identify the adjoint groups and hence the S-maps of connected data; no algebraic lift S→G₁ is required. D4/central-isogeny-lift only treats a given lift of a full datum and does not supply such an existence assertion.

Direct inputs: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- This gives a quotient, not an identification of full varieties with the same derived group.

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127. The located passage supports central-isogeny descent of connected models. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Central-isogeny descent**.

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

Sources:

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §14, pp.127–128. The located passage supports canonical models of abelian type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Abelian-type canonical models**.

## V7. General data: conjugation and descent

The general proof separates existence of a weak conjugation comparison, identification of its target by a marked special torus, compatibility with completed symmetry, independence of the marking, and continuous descent. Reduction reaches a simply connected almost Q-simple restriction-of-scalars group over a totally real field. A further totally real extension makes the marked torus CM-quadratically split; rank-one subdata and their centre intersection then identify the marked comparison. The weak comparison uses Kazhdan uniformization and precisely ranked S-arithmetic rigidity. Weyl-length induction and real local cohomology compare different special tori. The resulting cocycle is still not effective descent until its continuity is proved. A finite rigidifying set in a dense special Hecke orbit provides that continuity through Milne's corrected 1999 descent criterion. The contracted-product twist uses S→Tᵃᵈ acting by inner automorphisms; it leaves the pulled-back torus T unchanged. The exceptional central-adjustment argument needs a marked-torus bridge from the exact semisimple perfection theorem. The full reductive root subgroup can have a proper noncentral derived normal subgroup, so a simplicity assertion about it cannot supply that bridge.

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

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 7.1, p.262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Simple connected reduction**.

### Auxiliary totally real splitting extension

Declaration **TauCeti.Shimura.auxiliary_cm_splitting** (theorem), node `ShimuraVarieties:V7/auxiliary-cm-splitting`.

For the simple connected case and a maximal torus T′⊂G′ whose adjoint image contains the marked S-map, choose a finite totally real extension F′/F such that the base-changed torus splits over a CM quadratic extension L′/F′. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. The adjoint special torus is compact at every real place by the Cartan condition; since G′ is semisimple, its preimage T′ is also compact. Complex conjugation acts as −1 on its character lattice at every real embedding. In a finite Galois splitting field this involution is central, so the splitting field is CM; take a totally real extension containing its maximal real subfield, making the compositum quadratic CM.
2. Construct the diagonal inclusion into Res_{F′/Q}(G′_{F′}) with the induced components.
3. Apply the subgroup comparison principle of Milne 1.6 and §6.4. Compatibility and choice independence are checked in the marked comparison.

Direct inputs: `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- The extension need not be chosen canonically.
- Its purpose is splitting the special torus, not turning an exceptional group into abelian type.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, p.253; §6, pp.260–262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

### Root subdata of type A₁

Declaration **TauCeti.Shimura.rank_one_subdata** (theorem), node `ShimuraVarieties:V7/rank-one-subdata`.

Assume T′ splits over a CM quadratic L/F. For each root α of (G′,T′) noncompact at some real place, the Lie algebra Lie(T′)⊕g_α⊕g_{−α} descends to a reductive F-subgroup H′_α containing T′, whose derived group has type A₁. Res_{F/Q}H′_α has an induced adjoint S-map obtained by projecting h through T^ad→(H′_α)^ad. After taking the simply connected cover of its derived group and removing compact ineffective factors it gives the required connected rank-one subdatum. No lift of h to that cover is required.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. The quadratic CM involution exchanges α and −α, so the displayed Lie algebra is stable under Gal(L/F).
2. Construct the reductive subgroup generated by T′ and the ±α root groups and descend it by quadratic Galois stability. Project the marked S-map to its adjoint group, then verify Hodge types and the Cartan condition. The semisimple cover carries the same adjoint S-map; do not use a full-datum lift existence assertion.
3. Use the A₁ symplectic realization and V5/V6 to prove its marked conjugation comparison from CM, not just canonical-model existence. The precise A₁ comparison bridge is an explicit refinement gap.

Direct inputs: `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- A root may be compact at some places and noncompact at another.
- No claim that arbitrary A₁ subgroups generate G^ad(Q)^+.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, pp.253–254; Remark 1.5, p.242. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Rank-one Shimura subdata**.

### Central separation by noncompact roots

Declaration **TauCeti.Shimura.rank_one_central_separation** (theorem), node `ShimuraVarieties:V7/rank-one-central-separation`.

In the CM-split simple case, let Z_α=Z(H_α), with α ranging over roots noncompact at some real place. Then Z(G)=∩_α Z_α. Put Tbar=T/Z(G) and Zbar_α=Z_α/Z(G). Regard Zbar_α(A_f)/Zbar_α(Q) as subgroups of the abelian quotient Tbar(A_f)/Tbar(Q); their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Use irreducibility of the absolute root system and Galois action to show the relevant noncompact roots span the root lattice as required by Proposition 4.3.
2. Compute each subgroup centre by vanishing of its root characters.
3. Apply Corollary 4.4 to their adelic intersections with the rational quotient retained.

Direct inputs: `ShimuraVarieties:V7/rank-one-subdata`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- The claim is the explicit centre intersection, not a stronger rational-generation theorem.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 4.3 and Corollary 4.4, p.254. Corollary 4.4 places the intersection in Tbar(A_f)/Tbar(Q), an abelian quotient; no quotient group by a nonnormal subgroup of an adjoint group is used.

### Marked conjugated Shimura datum

Declaration **TauCeti.Shimura.conjugatedDatum** (construction), node `ShimuraVarieties:V7/conjugated-datum`.

Let G/Q be semisimple simply connected with connected datum X⁺, a G^ad(R)^+-class of h:S→G^ad_R satisfying the connected Shimura conditions. Choose a maximal rational torus T⊂G with h factoring through T^ad=T/Z(G); this is a D4 special pair for the adjoint datum. For τ∈Aut(C), the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1 supplies the Serre-protorus torsor S_τ and its distinguished finite-adelic point. The marked cocharacter μ_h is in X_*(T^ad), and gives ρ_h:S→T^ad. Use this inner action to form {}^{τ,h}G=S_τ×^S G. T is unchanged, {}^τh:S→({}^{τ,h}G)^ad_R factors through T^ad with cocharacter τμ_h, and {}^{τ,h}X⁺ is its connected adjoint real class. Retain the distinguished topological isomorphism G(A_f)≅{}^{τ,h}G(A_f). This construction is of connected data, not a full pure datum on the simply connected group.

Additional hypotheses and carrier conventions:

- G is semisimple simply connected over Q; h:S→G^ad_R lies in X⁺ with the Appendix (C1)–(C3) conditions. The maximal special torus is read in the adjoint datum and pulled back to G. No lift h:S→G_R is assumed.

The construction or proof follows this route:

1. Construct the Serre/Taniyama extension and its finite-adelic splitting from the corrected reciprocity class formation; this missing common CM supplier is explicitly requested and recorded as a gap.
2. Form the contracted product for ρ_h:S→T^ad acting by conjugation. The pulled-back maximal torus T is unchanged because this action on T is trivial.
3. Descend τμ_h in T^ad to {}^τh:S→({}^{τ,h}G)^ad_R and verify the connected Shimura conditions. Compute the finite-local trivializations and the real class τμ_h(−1)/μ_h(−1) in H¹(R,T^ad); do not demand an S-map into the simply connected cover.

Direct inputs: `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraData:D4/adjoint-datum`, `ShimuraVarieties:V6/connected-tower`.

Uses that determine the API:

- **Milne 1983 Theorem 1.1**: the marked target of the comparison is this actual inner form.
- **V7 special-independence**: compares twists obtained from two special tori.
- **V7 general-canonical**: identifies the twist with the original datum for reflex-field-fixing automorphisms.

Planning API:

- **TauCeti.Shimura.conjugatedDatum.group** (projection): The rational group is the contracted product inner form S_τ×^S G.
- **TauCeti.Shimura.conjugatedDatum.specialTorus** (data): The unchanged T embeds into the twist; the marked S-map factors through T^ad in the adjoint group and has cocharacter τμ_h.
- **TauCeti.Shimura.conjugatedDatum.adelic** (equivalence): The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
- **TauCeti.Shimura.conjugatedDatum.localClass** (characterisation): The inner twist is finite-locally trivial and its real cohomology class is represented by τμ_h(−1)/μ_h(−1).
- **TauCeti.Shimura.conjugatedDatum.map** (functoriality): An inclusion of connected data preserving the marked adjoint torus/cocharacter induces the compatible inclusion of twists and their adelic trivializations. Identity and composition hold.
- **TauCeti.Shimura.conjugatedDatum.descent_ext** (extensionality): Two morphisms of contracted-product twists agreeing after a common torsor-trivializing faithfully flat extension are equal; marked isomorphisms also retain the torus and distinguished adelic trivialization.

Discriminating unit-test specifications:

- **TauCeti.Shimura.conjugatedDatum.identity** (degenerate): For τ=id the distinguished torsor section gives the original datum and identity adelic map.
- **TauCeti.Shimura.conjugatedDatum.sl2_conjugation** (computation): For G=SL₂ with the norm-one Q(i) torus and the standard upper-half-plane adjoint S-map, τ equal to complex conjugation sends μ_h to its inverse and selects the lower-half-plane component. The group twist is split SL₂: the real obstruction μ_h(−1)⁻² is trivial and all finite local obstructions vanish. The marked adjoint homomorphism changes even though the group remains isomorphic.
- **TauCeti.Shimura.conjugatedDatum.finiteLocal** (compatibility): For each finite prime p and t∈T(Q_p), the distinguished local isomorphism sends the embedded t to the same t in the untwisted marked torus of {}^{τ,h}G. An arbitrary unmarked local isomorphism need not have this property.

Acceptance checks:

- For the standard SL₂ connected datum the Hodge cocharacter lives in PGL₂, and need not lift to an integral cocharacter of SL₂.

Sources:

- [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), Introduction, p.281 (Taniyama torsor and contracted product). The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Remark 1.4, pp.241–242; Appendix (C), pp.262–263. The Appendix puts the connected S-map in the adjoint group. Remark 1.4 records the marked-torus twist, finite-place triviality and real class; its shorthand is interpreted using that carrier.

Atlas planet: **Conjugated Shimura datum**.

### Uniformization of conjugate arithmetic quotients

Declaration **TauCeti.Shimura.kazhdan_uniformization** (theorem), node `ShimuraVarieties:V7/kazhdan-uniformization`.

For a torsion-free arithmetic Hermitian quotient Γ\D and τ∈Aut(C), the universal cover of τ(Γ\D) is a Hermitian symmetric domain D′, and its fundamental group acts as a lattice in Aut(D′)^+. This is a key theorem to prove, with its exceptional noncompact cases included.

Additional hypotheses and carrier conventions:

- Γ is torsion-free effective arithmetic; D is Hermitian symmetric; τ is any field automorphism of C.

The construction or proof follows this route:

1. For symplectic/abelian-type quotients use moduli and polarized families. For compact quotients use the relevant metric theorem.
2. For the remaining E₆/E₇ and mixed D cases read and decompose Kazhdan’s primary proof; Milne 3.2 cites its result and does not supply the missing analytic argument.
3. Record that argument as a gap rather than assuming the general conjugation theorem.

Direct inputs: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V5/weight-one-algebraization`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- This does not claim π₁ is unchanged by τ.
- The exceptional-case primary argument remains a named proof obligation.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 3.2, p.246. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

### Weak connected conjugation comparison

Declaration **TauCeti.Shimura.weak_conjugation** (theorem), node `ShimuraVarieties:V7/weak-conjugation`.

For a semisimple simply connected connected datum and τ∈Aut(C), there exist another connected datum (G₁,X₁⁺), an algebraic tower isomorphism τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺), and a compatible finite-adelic group isomorphism. This assertion does not yet identify G₁ with the special-torus twist.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Lift the conjugated Hecke correspondences to the universal Hermitian cover to construct Γ₀ and its compatible finite-adelic map, as in 3.3–3.5.
2. Use the precise S-arithmetic arithmeticity and superrigidity results at sufficiently large S, with rank at least two, to recover G₁ and its compatible local maps (3.6–3.7).
3. Handle the nonexceptional central obstruction using corrected 3.8. In the exceptional Aₙ cases §3.10 uses rank-one subgroups after a totally real extension making their semisimple forms isotropic at all finite places. Platonov–Rapinchuk 1979 Theorem 1 proves perfection of SL₁(D), not simplicity; it cannot be applied as a no-noncentral-normal-subgroup theorem to the full reductive Hα containing T. The exact passage from the semisimple perfection result to the central adjustment on the marked torus is an explicit proof gap (E12). Finite étale comparison rigidity in §§2.1–2.2 then gives the tower isomorphism once this adjustment is justified.

Direct inputs: `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V6/connected-tower`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `ShimuraVarieties:V7/rank-one-subdata`.

Acceptance checks:

- The finite adelic map does not identify the real forms.
- The corrected 3.8 concerns H¹(k,Z), not H¹(k,G).
- Do not infer simplicity or perfection of a full reductive rank-one group with a positive-dimensional centre from perfection of its simply connected semisimple factor.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 3.1 and §§3.3–3.10, pp.245–252. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.
- [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), Theorem 1, p.279; final discussion, p.282 (Russian published original). For a quaternion algebra D over a number field, the norm-one group is perfect when D is split at every finite place; every element is a product of at most three commutators. The final discussion still treats simplicity modulo centre as a conjecture. Neither assertion supplies simplicity of the full reductive Hα in Milne §3.10.

### Conjugation comparison with a marked special point

Declaration **TauCeti.Shimura.marked_conjugation** (theorem), node `ShimuraVarieties:V7/marked-conjugation`.

For the simple simply connected case, τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺) by an algebraic isomorphism sending τ[h] to [{}^τh] and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded A₁ subvarieties.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Compare the weak target’s embedded special torus and its tangent characters; the tangent weights recover the transformed cocharacter (5.1–5.2).
2. At the CM-split auxiliary extension compare both maps on every rank-one subvariety using the established A₁/CM comparison.
3. The centre intersection forces the residual adelic adjustment to be rational. Normalize the marked point and use density of its rational/adelic orbit for uniqueness.

Direct inputs: `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V6/abelian-canonical`.

Acceptance checks:

- No chosen isomorphism or Langlands axiom is an input.
- The construction is valid for exceptional Hermitian types.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 1.1 and uniqueness Remark 1.3, p.241; §§4–5, pp.253–256. Theorem 1.1 gives existence of the marked comparison. Remark 1.3 supplies uniqueness from the dense rational orbit; these are separate inputs.

Atlas planet: **Marked conjugation comparison**.

### Equivariance for completed symmetry

Declaration **TauCeti.Shimura.completed_conjugation_equivariance** (theorem), node `ShimuraVarieties:V7/completed-conjugation-equivariance`.

The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely G(A_f). Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Use the finite-base-extension functoriality of the completed groups as in Proposition 6.1 and MS §8.
2. Prove the precise density and compatibility needed to extend equivariance continuously. The annotated scan deletes an extra proposed rank-one generator family; no such stronger generation claim is used.
3. Compare finite levels to obtain the completed action identity. Its exact density statement/source decomposition is an explicit gap.

Direct inputs: `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Equivariance for G(A_f) alone does not establish the connected canonical formulation.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 6.1, p.257; MS §8, pp.340–341. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

### Independence of the marked special point

Declaration **TauCeti.Shimura.special_independence** (theorem), node `ShimuraVarieties:V7/special-independence`.

For maximal special h,h′ in X⁺, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

Additional hypotheses and carrier conventions:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

The construction or proof follows this route:

1. Use the Hasse-principle comparison of adjoint inner forms and explicit special-torus transition to define the comparison diagram (6.3–6.5).
2. After simultaneous CM splitting of the two tori, measure their real discrepancy by the sum of Weyl lengths. At length zero kill the positive torus norm obstruction by a further totally real extension.
3. For a compact reflection shorten via the real normalizer; for a noncompact reflection use its A₁ subgroup and weak approximation to localize the change at one real place. Induct on the length and compare common refinements.

Direct inputs: `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/conjugated-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Point-independence is proved by Weyl-length induction, not asserted from density of one chosen orbit.

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.3 and proof, pp.258–262. The comparison diagrams in §6 give compatibility of marked comparisons. The transition/coherence construction remains tied to the recorded MS1982d and completed-symmetry refinement, rather than inferred from the word independent.

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

Sources:

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorems 7.1–7.2, p.262; Descent §2. Theorem 7.2 is the canonical-model consequence, not an explicit proof of the cocycle formula. Its MS1982d §7 reference and the torsor multiplication/marked-independence inputs supply that proof route; exact coherence is a recorded gap.

### Finite rigidifying special points

Declaration **TauCeti.Shimura.finite_rigidifying_points** (theorem), node `ShimuraVarieties:V7/finite-rigidifying-points`.

At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset Σ whose pointwise stabilizer is trivial. In dimension zero the finite point set itself is a rigidifying set. The constructed descent system fixes Σ over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

The construction or proof follows this route:

1. Use Milne 1999 Lemma 2.2: the normalizer of the arithmetic group is discrete and finite covolume gives finite index, or apply the log-general-type argument. The exact normalizer theorem is requested from ALS.0.
2. For each nonidentity automorphism choose a special orbit point it moves; their finite union rigidifies.
3. Reciprocity at finite level gives an open Galois stabilizer for each point; take a finite extension fixing all of them. For zero-dimensional levels use the explicit finite étale Galois set.
4. For a zero-dimensional finite étale level use all geometric points to rigidify its finite permutation group; do not impose positive dimension in the final canonical-model theorem.

Direct inputs: `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- A finite subset of an arbitrary orbit need not rigidify; density and finite automorphisms are used.

Sources:

- [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and Theorem 2.3, pp.4–5. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

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

Sources:

- [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Continuous canonical descent**.

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

Sources:

- [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2. Supports canonical models for every pure datum. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.

## Supplier interfaces

These requests specify the outputs consumed here. An existing target is imported from its owner; a required extension is stated separately. No supplier is an assumption asserting this roadmap’s conclusion.

### AdelicAlgebraicGroups:AA.3

Import current AA §3.4 / Reduction.levelArithmetic_commensurable_pair for arbitrary compact-open levels and representatives. Expose the remaining bridge from an integral-model compact level to G(Q)∩GL_n(Z) for every faithful rational embedding, and arithmeticity of the effective domain image after removing compact ineffective factors. Preserve the finite-index rational component subgroup. Import class-number-finite separately; V0 does not replan reduction or pairwise commensurability.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`.

### AdelicAlgebraicGroups:AA.4

Extend the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or quotient-action degree. Supply finite topological level maps, the effective kernel of a normal K/K′ action, Hecke-span composition via double cosets, and the Cartesian comparison only with its precise U′L=U hypothesis. Arithmetic neatness remains owned by D5/AA.4. Distinguish the effective normal-level quotient action from the full automorphism group over the base of a disconnected cover. Specialize the existing class-set/Kneser/Hasse nodes for components; import current AA §4.5 integral almost-all-prime lifts and finite-adelic abelianization, and request only the positive rational component image and local openness specialization of SVI 5.20–5.21.

Consumers: `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`, `ShimuraVarieties:V0/simply-connected-components`.

### ArithmeticLocallySymmetricSpaces:ALS.0

Properness of the symmetric-space isometry action, arithmetic finite covolume after compact ineffective factors, and the finite normalizer-index/finite automorphism theorem for torsion-free arithmetic Hermitian quotients. For weak conjugation additionally supply the precisely ranked S-arithmetic arithmeticity and superrigidity conclusions of Milne 1983 §§3.5–3.7; these additions are an explicit extension gap, not already present ALS.0 outputs.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/finite-rigidifying-points`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Import the existing rational parabolic/root, maximal-torus, Weyl and reductive structural theory only. The rational real-density theorem, arithmetic images, restriction-of-scalars classification of Q-simple groups, real maximal-torus conjugacy, corrected finite-place H¹(k,Z) injectivity, adjoint Hasse principle, norm/weak-approximation assertions and root-centre identities require the specified ReductiveGroups Part II extension, recorded as a gap. The adelic ν-image/class-set and simply connected torsor inputs are imported separately from AA.4; none is claimed as an existing upstream Layer 7 output. For the exceptional §3.10 adjustment, import the exact Platonov–Rapinchuk rank-one perfection result and prove its marked-torus/central comparison; do not attribute simplicity of the full reductive Hα to it (E12).

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`.

### ReductiveGroupsPartII:RG2.0a

Import the existing ReductiveGroups Part II finite-free Weil restriction of affine group schemes and descent/splitting interfaces, applying them to field extensions here. The reflex norm uses its split character/cocharacter products, torus norm, base-change and diagonal-embedding compatibilities; expose any missing norm/cocharacter specialization at this owner, without planning the general Weil restriction construction again.

Consumers: `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`.

### ComplexComparisonPartII:C0

Analytification of locally finite-type complex schemes as locally ringed spaces, including nonreduced spaces; compatibility with products, open and closed immersions, étale local isomorphisms and smooth manifolds; faithful analytic comparison of morphisms and invariant local finite quotients. The missing analytic category and gluing carrier are specified in the CA.0 ownership proposal and gap, rather than assumed to be in PR196 or retired LI.2. Apply the étale/smooth chart comparison to strict-SNC boundary coordinates, and identify analytification of a finite group quotient with the analytic quotient.

Consumers: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/finite-quotient-algebraization`.

### ComplexComparisonPartII:C2

Projective GAGA for coherent sheaves and ideals, section comparisons and algebraization of projective analytic data, applied to the already constructed automorphic compactification.

Consumers: `ShimuraVarieties:V2/baily-borel`.

### ComplexComparisonPartII:C4

Chow for closed projective analytic subspaces and graph algebraicity between proper algebraic schemes; proper graph comparison after normal-crossing compactification. The added definable-graph route requires an independent arithmetic-to-algebraic definability comparison, polarized period-map definability and Peterzil–Starchenko o-minimal Chow; route those additions to a Complex Comparison Part II extension, with gaps until certified.

Consumers: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V5/weight-one-algebraization`.

### tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites

Import Layer 0D’s already specified equivalence between finite continuous absolute-Galois sets and finite étale field schemes, with products and morphisms. Import Layer 0C’s invariant affine quotient/free-action API through SF.1/finite-group-quotient. The general orbit-cover quotient construction is already planned by SF.1; only its descended ample-power/quasi-projectivity extension remains requested there.

Consumers: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/torus-model`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Absolute arithmetic Artin reciprocity, continuity and kernel, compatibility of norms with restriction, ray class fields and generation by good primes. The upstream README §Conventions explicitly fixes arithmetic Frobenius; geometricArtin in V4 inverts that map. CM norm-kernel lemmas are proved in V5, not supplied by class field theory alone. Do not read a generic Hasse norm theorem or Chevalley’s topology on global units into Layer 11: their common-owner Part II proposal is the separate CM norm-kernel inputs gap.

Consumers: `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`.

### AlgebraicModuliForArithmeticGeometry:R09.3

Faithful base change and effective continuous quasi-projective descent of schemes/morphisms, including Milne 1999 Theorem 1.1 under infinite transcendence degree and its finite rigidifying-point criterion. Descend invariant closed images and finite quotient towers with compatible maps. Ordinary finite-group quotient existence is imported from SF.1/finite-group-quotient, rather than requested here.

Consumers: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

### PELModuli:M3

Generic rational Siegel moduli with actual polarization and integral/adelic symplectic level, including the fine/neat and coarse/non-neat distinctions, its analytic family/uniformization and the moduli map used after V3 to algebraize weight-one variations. This request uses M0–M3 only; M4 canonical models are not an input to V5.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/siegel-canonical`.

### AbelianSchemesAndArithmeticModuli:A2

Dual abelian schemes, rational polarizations and Rosati involutions, with E-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

Consumers: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/cm-frobenius`.

### AbelianSchemesAndArithmeticModuli:A3

Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/cm-polarization-level`.

### AbelianSchemesAndArithmeticModuli:A4

Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and Lie-eigenspace comparison, including faithful action of quasi-isogenies.

Consumers: `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/shimura-taniyama`.

### AbelianSchemesAndArithmeticModuli:A5

The analytic equivalence of polarizable integral homological type (−1,0),(0,−1) variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is V5 after M3 and Borel; A5 must not use V5 to provide its analytic equivalence.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`.

### AbelianSchemesAndArithmeticModuli:A6

Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, and rigidity and number-field spreading of endomorphisms. The Frobenius proof instead imports the existing all-characteristic scalar-extended Hom injectivity, finite-rank, characteristic-polynomial and normal-base extension nodes; no stronger positive-characteristic Tate theorem is requested.

Consumers: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/siegel-special-cm`.

### SchemeAndStackFoundations:SF.1

Extend the existing finite-group-quotient node with the characteristic-zero quasi-projectivity output: for a finite action on a normal quasi-projective scheme, tensor the translates of an ample bundle, take a power whose stabilizers act trivially, descend it to an ample bundle on the quotient, and expose the finite quotient/normality comparison. The invariant affine cover and scheme quotient existence are already provided by that node.

Consumers: `ShimuraVarieties:V3/finite-quotient-algebraization`.

## Remaining proof and carrier refinements

All stages are planned at target level. None is closed: the following named refinements remain, and advanced implementation status is unchecked. A missing proof interface is distinguished from an imprecise mathematical definition; the all-type automorphic boundary predicate above is now explicit.

### G1. Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3

Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison. Encode CA.0→C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3 and list those consumers in the PR196 external record. C0/repair-analytification supplies a requested target, not a constructed carrier. The issue permits no edits to those supplier/atlas files, so the repair is a concrete unapplied ownership proposal.

Required by: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V3/borel-extension`.

### G2. Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28

The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7). Encode M5/M6 or CA.0→AnalyticToricGeometry Layer 3 and M7 or CA.0→C0, with the direct V1 edge. If PR279 is tracked instead, expose those milestones as real stage ids. Update its external consumers and declared_by_areas with AnalyticToricGeometry. LI.4/LI.2 are retired and provide none of this; no edge through them remains in the packet.

Required by: `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V1/analytic-structure`.

### G3. Arithmetic and effective-level supplier extensions

AA §3.4 and Reduction.levelArithmetic_commensurable_pair already plan commensurability for arbitrary compact-open levels and representatives. The remaining AA.3 specialization identifies a faithful integral-model level with G(Q)∩GL_n(Z) and passes its arithmetic image through the compact ineffective kernel. AA.4 covering/freeness still has a real stabilizer compact-mod-A_G hypothesis; general Shimura central units need the effective-domain version. Requests retain those precise outputs, not a second pairwise-commensurability plan.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`.

### G4. Baily–Borel proof and carrier interfaces

The primary §§3.5–3.7, 4.8–4.11 and 8.2–8.9 now specify rational normalizers, Satake neighborhoods and the all-type analytic boundary predicate. Remaining refinements are the complete adapted-domain/classification and reduction-topology interfaces; §§6–7 normal-majorant convergence inequalities; §9 analyticity criterion and local normal models; full admissible Veronese section-ring comparison, using Theorem 10.14 in its no-three-dimensional-Q-normal-subgroup range and a separate cusp/logarithmic-canonical and mixed-factor argument outside that range; §§10.9–10.11 alone give only the finite separating subring; Koecher extension; and finite-index boundary-map/ring-integrality proofs. The read OCR loses signs in some displays: the canonical pullback convention is stated independently, but estimates must be checked in a legible primary copy before source-proof closure. No missing boundary definition is concealed in this proof gap.

Required by: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`.

### G5. Borel multivariable extension proof source

SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument. Obtain the original algebraicity paper or a full public proof and certify the extension across (Δ*)ʳ×Δˢ with torsion-free effective target. Projective SNC source compactification is imported from the existing R09.7/snc-compactification node; C0 still supplies the local analytic chart comparison.

Required by: `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`.

### G6. Independent definable comparison and graph suppliers

Certify the PS13/KUY16 theorem comparing the algebraic Baily–Borel definable structure with arithmetic fundamental-set charts independently of Borel algebraicity; state the o-minimal structure precisely. Import/propose a single owner for BKT period-map definability and Peterzil–Starchenko o-minimal Chow, with the corrected maximal-compact and Cartan conditions. A bare arithmetic-definable graph is not yet a graph in the algebraic-target definable structure.

Required by: `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`.

### G7. Full CM spreading and specialization inputs

Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field. Integral eigenspace splitting in the unramified Frobenius calculation is over O_{k,P}, not globally O_k, as the published author erratum corrects. The centralizer part of cm-frobenius now imports existing A4/A6 nodes and is not a missing positive-characteristic Hom theorem.

Required by: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/shimura-taniyama`.

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

Canonical-model existence for A₁ is not itself its marked conjugation comparison. Certify the CM/Siegel comparison bridge in 1983 Remark 1.5/MS1982d §9 and its functorial inclusion. Read MS1982d §8 and corrected 1983 Proposition 6.1 for the exact finite totally real base-extension density in the congruence completion. Do not revive the deleted extra A₁-generation claim in the annotated scan.

Required by: `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`.

### G13. General quasi-projective finite quotient API

ModularCurves Layer 0D already plans finite-continuous-Galois-set descent. SF.1/finite-group-quotient already supplies the general finite group quotient and invariant affine cover, with every finite orbit in an affine open; the quasi-projective C-scheme source satisfies this hypothesis. The remaining SF.1 extension is descent of a suitable invariant ample power and the quasi-projectivity/normality output, not a second quotient-existence construction.

Required by: `ShimuraVarieties:V3/finite-quotient-algebraization`.

### G14. Suggested signatures requiring absent mathematical carriers

The exact mathematical declarations/API/tests are named in the reader and in the suggested file’s explicit omission manifest. The pinned libraries contain no pure Shimura datum, nilpotent complex analytic-space category/analytification, canonical model special-pair predicate, automorphic boundary section ring or connected canonical Galois extension. Their full Lean conditions cannot be stated yet. Section 13 requires omitting such conditions honestly: the compiled prototype implements the genuine double-orbit carrier and geometric Artin conversion at the native group-action/group-hom level, and gives no Prop-valued fake fields, unproved existence instances or schematic True conclusions. Restore each omitted signature when the recorded owner supplies its carrier, preserving all names and discriminating tests. Compilation certifies only the stated prototype, not the advanced mathematics. The point prototype specifies the orbit set without its quotient topology; the Artin prototype specifies inversion of a supplied homomorphism without constructing global reciprocity, profinite continuity or the literal number-field tests. Those mathematical specializations are also omitted conditions, not certified by the native tests.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/stabilizer-commensurable`, `ShimuraVarieties:V0/neat-sublevels`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V1/analytic-points`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-hecke`, `ShimuraVarieties:V1/datum-analytic-map`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/aghmp-stack-comparison`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/shimura-taniyama`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/siegel-canonical`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/hodge-canonical`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`, `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V7/finite-rigidifying-points`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

### G15. Positive rational abelianization and local openness

Current AA §4.5 already plans abelianization-integral-lifts (Lang plus smooth Hensel outside finitely many primes), finite-adelic abelianization and class-set abelianization, with §4.1 Kneser/Hasse inputs. Import those targets. The remaining Shimura specialization proves ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)) and local openness of ν on finite local points, hence compact openness of ν(K), preserving the simply connected derived-group and real-component hypotheses of SVI Lemmas 5.20–5.21, pp.60–61. It is an AA.4 refinement, not a ReductiveGroups Layer 7 output.

Required by: `ShimuraVarieties:V0/simply-connected-components`.

### G16. CM norm-kernel inputs

Milne 2007c Lemma 3.6 uses Chevalley’s theorem that the finite-idelic topology on a finite-index torsion-free subgroup of O_E× is its full profinite topology. This identifies closure(E×)/E× with a uniquely divisible group fixed by CM conjugation. Lemma 3.12 also uses the Hasse norm theorem for the cyclic quadratic CM extension E/E⁺ to turn a totally positive everywhere-local norm into a global norm. CFT Layer 11 does not state these inputs. Propose ClassFieldTheory, Part II, first new layer CFT.N, for these generic unit-topology/cyclic-norm interfaces, also consumed by the Serre-protorus construction; retain the CM-specific norm-kernel deduction in V5. Read the Chevalley and cyclic-norm primary proofs before claiming closure, and handle CM product algebras componentwise.

Required by: `ShimuraVarieties:V5/main-cm`.

### G17. Connected adjoint datum convention and carrier

The connected carrier is a G^ad(R)^+-class of S→G^ad_R even for simply connected G. Its actual analytic/pro-algebraic implementation and comparison to D4/adjoint-datum remain to be supplied. D4/special-pair applies to the adjoint datum, with the torus pulled back to G; the standard PGL₂ cocharacter does not lift integrally to SL₂. No S-map lift is assumed. V6 supplies this explicit connected convention before advanced V6/V7 Lean signatures can be restored.

Required by: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/conjugated-datum`.

### G18. Exceptional central adjustment and rank-one perfection

Milne 1983 §3.10, p.252, attributes absence of noncentral normal subgroups to Platonov–Rapinchuk 1979 and applies it to a reductive Hα containing the full maximal torus. The primary paper Theorem 1 (p.279) proves perfection of the three-dimensional norm-one group SL₁(D) when D is split at every finite place; its final discussion (p.282) still calls simplicity modulo centre a conjecture. The full reductive Hα need not be perfect: its derived rational subgroup is a proper noncentral normal subgroup when its central torus has positive dimension. Replace the printed argument with the exact semisimple perfection input, then prove the missing comparison that eliminates the central adjustment on the marked torus, retaining the totally real extension and all-place split hypotheses. A subgroup containing T is not interchangeable with its derived group. This remains a ReductiveGroups Part II proof-interface request, independent of corrected Lemma 3.8 centre cohomology; see E12.

Required by: `ShimuraVarieties:V7/weak-conjugation`.

### G19. Arithmetic reductive supplier ownership

The read upstream ReductiveGroups Layer 7 gives structural root/tori/parabolic theory, not rational real density, arithmetic images under algebraic maps, all-place torus norm obstructions or restriction-of-scalars classification with Hermitian real hypotheses. Import AA §3.4 pairwise level commensurability and route the faithful-integral/effective arithmetic-image comparison to AA.3; route abelianized component images to AA.4; refine the remaining rational real-density/torus-conjugacy, Q-simple classification and cohomological/root-centre interfaces in ReductiveGroups Part II. Each use must preserve the input field, real component and centre hypotheses. These are ownership requests; the upstream roadmaps are read-only inputs.

Required by: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/special-independence`.

## Ownership proposals for assembly

**ComplexComparisonPartII**. RT-AREA-algebraicgeometry/3 and /28: analytic spaces/analytification and holomorphic gluing have no mathematical owner; external PR196/279 are not encoded stages, and FoundationsAndLibraryIntegration is retired.

Insert CA.0: Complex analytic foundations before C0, with analytic local models including nilpotents, morphisms/gluing/fibre products, SGA1 analytification, smooth/étale comparison and compatible complex manifold gluing/finite-gluing topology/holomorphic bundles. Encode the consumer edges and PR196/279 external record updates listed in the two gaps. It agrees with PR196 Layers 0–2 and PR279 Milestones 5–7 if those PRs merge. This proposal is not applied in the present four-file job.

**ComplexMultiplicationAndExplicitReciprocity**. V7 needs the actual Serre/Taniyama torsor, not only types/reflex types or the scalar CM reciprocity theorem.

Add a Part II layer CM.S owning the Serre protorus and Taniyama extension with adelic section and norm/cocycle API. V7 owns the contracted-product Shimura twist and its comparison. Keep CM.0 types and V4 reflex-norm application, and avoid CM.2/CM.4→V5 cycles.

**ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces**. The common cohomological/rigidity inputs used in Milne 1983 are broader than the current exposed supplier scopes.

Expose the corrected finite-place centre H¹ injectivity, adjoint Hasse principle and real torus norm/weak approximation in ReductiveGroups Part II; expose precisely ranked S-arithmetic arithmeticity/superrigidity and normalizer finiteness in the locally symmetric supplier. V7 retains weak/marked conjugation and Weyl-length independence.

**ShimuraVarieties**. V6 imports the existing V8 foundational disjoint-reflex-field and conditional uniqueness nodes; their proofs depend on V1–V4, not on canonical-model existence in V6/V7. Keeping all of them behind an undifferentiated V8 stage creates a misleading stage cycle.

At assembly move the existing V8/disjoint-special-reflex-fields and the conditional V8 translation-descent/model-uniqueness foundation to the V4 canonical-model lane, preserving node ids by aliases. Keep V8 actual-tower applications and V8.general separated. Until assembly use those exact existing node ids; the expanded declaration graph is acyclic.

## Source corrections and scope

The source-finding ledger retains fourteen confirmed findings and one rejected finding. Descriptions below are in our own words; the cited locators identify the source evidence. E8 is a rejected convention-specific source-error claim, while the analytic foundation still requires nilpotent scheme-valued GAGA.

### ShimuraVarieties/E1

**Verdict: confirmed.** [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Lemma 3.8, printed p.250, annotated 1983 author scan.

**Finding as formulated:** H¹(k,G) → ∏_{v finite} H¹(k_v,G)

**Correction or qualification:** Replace G by Z=Z(G) in both cohomology terms; preserve no A_n factor with n≥4.

**Reason:** The proof computes the finite centre and its Galois action and explicitly proves injectivity for H¹(k,Z). The displayed scan has the author’s handwritten Z corrections.

**Independent verdict:** The annotated p.250 display uses Z(G), and its proof computes the centre; the exclusion of Aₙ for n≥4 remains essential.

**Known correction and search:** Author’s annotated scan, https://jmilne.org/math/articles/1983a.pdf; the V7 issue explicitly requires this correction. Annotated author PDF p.250; author article list; roadmap V7 source correction instruction.

### ShimuraVarieties/E2

**Verdict: confirmed.** [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), Theorem 1.1(1)–(2), author manuscript pp.3–4; corrected by author erratum §§1.1–1.3.

**Finding as formulated:** The source claims Ralg-definability for every morphism f : SΓ′,G′,M′ → SΓ,G,M between arithmetic quotients.

**Correction or qualification:** Fix maximal compact K for the definable structure; require the corrected morphism compatibility with K,K′ and preservation of the embedded Lie algebra by the target Cartan involution. Hodge manifolds and period maps retain their corrected canonical choice.

**Reason:** The erratum §1.6 gives distinct definable structures and morphisms without finite Siegel containment. The V3 alternative uses only the corrected symmetric/Hodge case.

**Independent verdict:** The full author erratum requires the chosen maximal compact and Cartan-compatible maps. The broad manuscript functoriality claim exceeds that corrected range.

**Known correction and search:** Bakker–Klingler–Tsimerman, author erratum, https://benjamin-bakker.github.io/DefArithErr.pdf, Theorem 1.2. Author manuscript Theorem 1.1; full author erratum §§1.1–1.6.

### ShimuraVarieties/E3

**Verdict: confirmed.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Formulas (60)–(61), p.114, SVI revised 16 September 2017.

**Finding as formulated:** ∑ ρ(μx(a))

**Correction or qualification:** Use the multiplicative product of the conjugate cocharacter values, not their sum.

**Reason:** The codomain is an arbitrary torus group, whose values admit multiplication, not addition. For G_m with μ(t)=tⁿ the Weil-restriction norm is ∏ρ ρ(a)ⁿ; summation is not a homomorphism and need not be invertible.

**Independent verdict:** SVI p.114 writes sums in a multiplicative torus. Weil restriction followed by norm is the product of conjugate cocharacter values, as the split G_m example checks.

**Known correction and search:** new SVI author version formulas (60)–(61), p.114; existing ShimuraVarieties--V8 sourceIssues (same correction recorded); author xnotes index searched.

### ShimuraVarieties/E4

**Verdict: confirmed.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127, more-precisely paragraph, SVI revised 16 September 2017.

**Finding as formulated:** The source describes the canonical model of Sh⁰(G₂,X₂) as a quotient of that same canonical model of Sh⁰(G₂,X₂).

**Correction or qualification:** The second source model is Sh⁰(G₁,X₁); quotient it by the kernel of the completion map for G₁→G₂.

**Reason:** The preceding assertion assumes existence for G₁. The following kernel is explicitly that of the source-to-target map; quotienting the already-target model would assume the conclusion and give the wrong tower.

**Independent verdict:** In SVI 14.16(b) the isogeny starts at G₁, so the quotient construction must start with its model. The repeated G₂ would assume the target model exists.

**Known correction and search:** new SVI author version p.127; author xnotes index searched; Deligne 1979 2.7.11 cited by source but its full extension construction remains a recorded source gap.

### ShimuraVarieties/E5

**Verdict: confirmed.** [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(a), p.22, author article 2007c.

**Finding as formulated:** rec(s) = σ|E*ab

**Correction or qualification:** Use art_{E*}(s)=σ|E*ab, as in Theorem 3.10 and Lemma 3.9 immediately above.

**Reason:** The article defines art as the inverse of rec. An automorphism of order greater than two detects the sign; the change-of-lift lemma and stated quasi-isogeny formula both use art.

**Independent verdict:** The fixed-idele formula in 2007c Theorem 3.10 uses art, while Remark 3.11(a) changes the name to rec. An Artin class of order greater than two distinguishes these inverse maps.

**Known correction and search:** new Author article Theorem 3.10/Remark 3.11; https://www.jmilne.org/math/articles/2007c.html erratum (corrects §2.1, not this line).

### ShimuraVarieties/E6

**Verdict: confirmed.** [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 2.1(b) proof pp.16–17, author article 2007c; public author correction.

**Finding as formulated:** O_k

**Correction or qualification:** In the integral eigenspace decomposition at the good unramified prime P use O_{k,P} throughout the first two proof paragraphs, not global O_k.

**Reason:** Splitting E⊗k does not split O_E⊗O_k globally: conjugate roots can coincide modulo ramified primes. Localization at the unramified prime gives the needed étale eigenspaces. The V5 Frobenius proof requests this localized comparison.

**Independent verdict:** The author correction and the unramified local eigenspace argument require O_{k,P}. A global O_k decomposition would fail at other ramified primes.

**Known correction and search:** Author erratum https://www.jmilne.org/math/articles/2007c.html. Public author erratum opened 6 October 2026; author PDF proof of Theorem 2.1.

### ShimuraVarieties/E7

**Verdict: confirmed.** [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Remark 1.3(c), p.2, 1999 author version, identifying Milne 1994 Lemma 3.23.

**Finding as formulated:** The source says the continuity requirements are omitted.

**Correction or qualification:** Use the finitely generated splitting criterion of Theorem 1.1 and finite rigidifying-point Corollary 1.2. The canonical system must be shown continuous before effective descent.

**Reason:** Remark 1.3(a) exhibits noneffective noncontinuous systems; a cocycle law by itself does not imply effectivity. V7 separates cocycle, finite rigidification, continuity and descent.

**Independent verdict:** Descent Remark 1.3(c) explicitly identifies the omitted continuity condition; Remark 1.3(a) shows that a cocycle alone does not give an effective model.

**Known correction and search:** Milne, Descent for Shimura varieties (1999), Theorem 1.1 and Corollary 1.2 explicitly replace the older lemma. Entire 1999 author version §§1–2; Remark 1.3(c) explicit correction.

### ShimuraVarieties/E8

**Verdict: rejected.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.11, p.38, relative to the source’s geometrically-reduced definition of algebraic variety on pp.35–36.

**Finding as formulated:** The source asserts that each projective complex analytic space admits exactly one projective algebraic variety structure.

**Correction or qualification:** For analytic spaces with nilpotents use projective algebraic schemes. For the source’s geometrically-reduced varieties restrict the analytic space to be reduced. V2 uses normal reduced compactifications, so its statement is unaffected.

**Reason:** The projective analytic fat point with local ring C[ε]/(ε²) cannot analytify a geometrically-reduced variety. The CA.0 carrier must nevertheless include it for GAGA and general analytification.

**Independent verdict:** SVI Remark 3.9 does not explicitly put nonreduced quotient local rings in its analytic category. The proposed fat point therefore does not establish an error within that convention. The broader CA.0 category still needs schemes and nilpotent GAGA.

**Known correction and search:** new SVI author version pp.35–38; ComplexComparisonPartII C0–C4 packet targets; author xnotes index searched.

### ShimuraVarieties/E9

**Verdict: confirmed.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101, revised 16 September 2017 author copy.

**Finding as formulated:** The source asserts the existence of a pro-p subgroup in I whose index is finite.

**Correction or qualification:** Absolute local inertia is not virtually pro-p. Either factor the abelian representation through local reciprocity, whose unit-group image is virtually pro-p, or use finite-extension semistable reduction and unipotent inertia. V5 uses the latter with the existing R11.3/R11.5 nodes.

**Reason:** For residue characteristic p, tame inertia has quotient ∏_{ℓ≠p} Z_ℓ(1); its infinite pro-ℓ quotients exclude a finite-index pro-p subgroup. Rank-one CM inertia becomes trivial after semistable extension because E⊗Q_ℓ is reduced and (ρ(σ)−1)²=0. The theorem survives; the printed step fails.

**Independent verdict:** Absolute inertia has an infinite tame pro-ℓ quotient for every ℓ≠p, preventing a finite-index pro-p subgroup. The semistable square-zero inertia argument repairs potential good reduction.

**Known correction and search:** new The revised SVI author PDF and author xnotes/svi.html index; official-site search for Proposition 10.5 inertia/pro-p errata; older author svi2005.pdf and 2005aX.pdf repeat the sentence. No correction located.

### ShimuraVarieties/E10

**Verdict: confirmed.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Final paragraph p.127, after Proposition 14.16, revised 16 September 2017 author copy.

**Finding as formulated:** The source attributes to (14.16) an existence proof covering every Shimura variety of abelian type.

**Correction or qualification:** The final full/nonconnected reconstruction uses Theorem 14.15; Proposition 14.16 supplies products and isogenies only for connected data.

**Reason:** The previous sentence already obtains the connected abelian-type models by 14.16. Passing from them to the full tower is exactly the equivalence in 14.15. V6/abelian-canonical explicitly imports connected-full-equivalence.

**Independent verdict:** The final p.127 step restores full models from connected canonical structures, which is Theorem 14.15. Proposition 14.16 only supplies connected products and isogenies.

**Known correction and search:** new SVI pp.126–128 and author xnotes/svi.html index; official-site search for corrections to the 14.15/14.16 cross-reference. No correction located.

### ShimuraVarieties/E11

**Verdict: confirmed.** [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101, E-linear representation sentence, revised 16 September 2017 author copy.

**Finding as formulated:** Gal(Qa/Q)

**Correction or qualification:** Use Gal(Qbar/K), after all E-endomorphisms are defined over K. A/K and its endomorphism action need not descend to Q.

**Reason:** The Tate representation of the abelian variety defined over K is of Gal(Qbar/K); its commutation with the defined E-action is what places its image in (E⊗Q_ℓ)×. There is no corresponding absolute-Q representation of that A without descent data.

**Independent verdict:** The Tate representation of A/K is defined on Gal(Qbar/K). Its E-linearity requires the action to be defined over K and does not supply a representation over Q.

**Known correction and search:** new SVI Proposition 10.5 and author xnotes/svi.html index; official-site search for its Gal/inertia correction; older svi2005.pdf and 2005aX.pdf also use the absolute-Q group. No correction located.

### ShimuraVarieties/E12

**Verdict: confirmed.** [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §3.10, p.252, sentence citing [16]; compare the reductive subgroup definition in §4, pp.253–254. Scoped to the public annotated 1983 author scan..

**Finding as formulated:** The source rules out any normal subgroup of Hα(Q) that is non-central.

**Correction or qualification:** The cited Platonov–Rapinchuk 1979 Theorem 1 proves perfection of the simply connected three-dimensional norm-one group when split at every finite place, not the printed simplicity claim for a full reductive group containing T. The central-adjustment proof must specify the semisimple factor and justify passage back to the marked torus. This review records that remaining proof gap rather than inventing the bridge.

**Reason:** In SU(4,1) over Q for Q(i)/Q with diagonal compact maximal torus, the noncompact ±α block subgroup Hα has derived SU(1,1)≅SL₂ and a positive-dimensional central torus. Its derived rational subgroup is normal, proper and noncentral, even though its semisimple factor is split at every finite place. Thus the literal assertion about this full reductive Hα is false. Independently, the primary 1979 Russian text states perfection in Theorem 1, p.279, and still calls simplicity modulo centre a conjecture on p.282. The central target is abelian, so perfection is the relevant weaker input, but the marked-torus passage is not supplied by citing it.

**Independent verdict:** The full reductive root subgroup contains a central torus and has a proper noncentral derived normal subgroup in the stated SU(4,1) example. The cited 1979 theorem supplies semisimple perfection, and p.282 still discusses simplicity as a conjecture. The remaining marked-torus bridge is correctly a gap.

**Known correction and search:** new The annotated 1983 scan pp.252–254 and author 1983a.html/add/1983a.pdf comments (no correction to this sentence located). The public 1988aT author transcription repeats a simplicity claim in its analogous argument. The cited 1979 Russian published original on the coauthor’s UVA page, Theorem 1 p.279 and final discussion p.282; Math-Net catalogue identifies Dokl. Akad. Nauk SSSR 247:2, 279–282.

### ShimuraVarieties/E13

**Verdict: confirmed.** [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Introduction, p.239, first reference to Langlands [8]; public annotated author scan.

**Finding as formulated:** [8, pp.222–223]

**Correction or qualification:** Replace the page reference by [8, pp.232–233].

**Reason:** The public author erratum specifies the corrected Corvallis pages. This fixes source navigation, without changing a mathematical target.

**Independent verdict:** The handwritten correction on the introduction and the public author erratum both give the Langlands reference as pp.232–233.

**Known correction and search:** Public author erratum: https://www.jmilne.org/math/articles/1983a.html (Erratum section) The public author scan at the printed page and the full 1983a.html Erratum section, read 2026-10-06.

### ShimuraVarieties/E14

**Verdict: confirmed.** [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Introduction, p.239, last displayed map; public annotated author scan.

**Finding as formulated:** G′_{A^f}.G′_{A^f}

**Correction or qualification:** Omit the second copy of G′_{A^f} in the displayed target.

**Reason:** The public author erratum removes this duplicate factor. The packet’s comparison target retains one finite-adelic group, consistently with Theorem 1.1.

**Independent verdict:** The introduction displays a duplicated finite-adelic target factor, which the public author erratum deletes; the marked comparison has one such target.

**Known correction and search:** Public author erratum: https://www.jmilne.org/math/articles/1983a.html (Erratum section) The public author scan at the printed page and the full 1983a.html Erratum section, read 2026-10-06.

### ShimuraVarieties/E15

**Verdict: confirmed.** [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Corollary 1.5, p.6, third commutant in the statement; author PDF dated 23 May 2007.

**Finding as formulated:** F

**Correction or qualification:** The rational-endomorphism commutant is E, the full CM algebra, rather than F.

**Reason:** The hypotheses embed E in End⁰(A). The third paragraph of the proof bounds the commutant dimension using its prime-to-characteristic Tate realization and concludes that the commutant equals E. The printed F disagrees with that conclusion.

**Independent verdict:** The page image prints F as the third commutant, while the proof concludes C=E by the two dimension inequalities. The corrected Frobenius proof uses this E-centralizer calculation.

**Known correction and search:** new; the public author erratum at https://www.jmilne.org/math/articles/2007c.html records only the localized-base correction to Theorem 2.1. Author PDF Corollary 1.5 and complete proof, p.6, text and page image; full public author erratum 2007c.html, read 2026-10-10.

## Pinned library and prototyping boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All five cited native full declarations and their hypotheses were read at the Mathlib pin. The current upstream-roadmap and Tau Ceti screens are separate from this pinned verification; existing current roadmap targets are imported even when absent from the atlas snapshot.

- **mathlib:MulAction.orbitRel** (def), `Mathlib/GroupTheory/GroupAction/Defs.lean`: Setoid with relation a ∈ orbit G b for a group action; no analytic structure asserted. Full declaration and hypotheses read on 10 October 2026 in the Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174. Supplies precisely the stated native carrier; no advanced analytic or arithmetic structure follows.

- **mathlib:MulAction.orbitRel.Quotient** (abbrev), `Mathlib/GroupTheory/GroupAction/Defs.lean`: The quotient type by the actual orbit relation. Full declaration and hypotheses read on 10 October 2026 in the Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174. Supplies precisely the stated native carrier; no advanced analytic or arithmetic structure follows.

- **mathlib:MulAction.stabilizer** (def), `Mathlib/GroupTheory/GroupAction/Defs.lean`: Subgroup of group elements fixing a point. Full declaration and hypotheses read on 10 October 2026 in the Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174. Supplies precisely the stated native carrier; no advanced analytic or arithmetic structure follows.

- **mathlib:AlgebraicGeometry.Scheme** (structure), `Mathlib/AlgebraicGeometry/Scheme.lean`: Locally ringed space locally isomorphic to an affine spectrum. Full declaration and hypotheses read on 10 October 2026 in the Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174. Supplies precisely the stated native carrier; no advanced analytic or arithmetic structure follows.

- **mathlib:CategoryTheory.Over** (def), `Mathlib/CategoryTheory/Comma/Over/Basic.lean`: Category of arrows with fixed codomain, for schemes over Spec E. Full declaration and hypotheses read on 10 October 2026 in the Mathlib source tree at exact pinned HEAD 082e2d37e8b0463410cdb532e111cd43d5a66174. Supplies precisely the stated native carrier; no advanced analytic or arithmetic structure follows.

The suggested file has two genuine native slices. The group-action slice retains the domain and rational diagonal/right-level action, constructs quotient descent and level maps, and checks singleton double-coset compatibility and survival of a nontrivial domain coordinate. The group-homomorphism slice inverts a supplied arithmetic reciprocity homomorphism into a commutative group and checks inverse-Frobenius and cyclotomic normalization transport. It supplies no analytic topology, actual Shimura datum or global number-field reciprocity construction. Its explicit omission manifest records every advanced node, API and mathematical test until the actual owners make their conditions expressible. Compilation certifies only the native slices; the manifest specifies mathematics without asserting advanced declarations exist.

## Sources and inspected portions

The reviewer independently reread these public copies on 10 October 2026 and matched all eleven PDF digests to the packet. The primary Baily–Borel OCR reproduction identifies the extension predicate and ring conventions, but illegible displays and remaining proof estimates still need a legible primary copy. The listed portions describe audit scope, rather than a reproduction of source text.

- [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf). Revised 16 September 2017. Read: 2026-10-10. Inspected: §3 arithmetic groups, Baily–Borel and Borel; §5 finite components and analytic levels; §§10–11 CM reduction and reciprocity; §§12–14 canonical models, density, descent, Siegel/Hodge/abelian type and general-data reduction. Verified digest: `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.

- [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf). Author article 2007c. Read: 2026-10-10. Inspected: Corollary 1.5 and its proof, p.6: scalar-extended Hom injectivity and the CM centralizer dimension argument; the printed third commutant has an E/F misprint. §2 pp.16–18 Frobenius/valuation proof with author localized-base erratum; §3 pp.19–24 ideal form Theorem 3.2, geometric Artin convention, norm-kernel lemmas, Theorem 3.10 and polarization formula 3.11(c). Verified digest: `cec3ce6ffa0761aecf50e3b095a517ba96e4e525c545a80f9a3b39f518dc7607`.

- [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf). Progress in Mathematics 35 (1983), pp.239–265; annotated author scan. Read: 2026-10-10. Inspected: Page images inspected: pp.239–244 (notation, marked comparison and finite étale rigidity); pp.245–254 (weak comparison, uniformization, S-arithmetic recovery, corrected Lemma 3.8, reduction and A1 root subgroups); pp.255–262 (special-point comparison, completed symmetry, Theorems 6.3, 7.1, 7.2); p.263 connected-tower appendix. Scan has no usable extracted text. Verified digest: `36caf35ff4759b920f26cff9f59f23b6f65ff689022522e1757462703dab2b42`.

- [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf). Michigan Mathematical Journal 46 (1999); author version dated 22 September 1998. Read: 2026-10-10. Inspected: Entire §§1–2, especially Theorem 1.1, Corollary 1.2, Lemma 2.2 and Theorem 2.3; Remark 1.3(c) corrects missing continuity. Verified digest: `9ce47be2db53ea4f97e548c47933c07f06f2cb4de37f31e836b77d241e4e34b5`.

- [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf). Author manuscript of JAMS (2020). Read: 2026-10-10. Inspected: Introduction arithmetic varieties and definable comparison; §4.6 Theorems 4.12–4.13 and graph proof. Other Hodge-locus targets are outside this job. Verified digest: `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e`.

- [B. Bakker, B. Klingler, J. Tsimerman, Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf). Author erratum. Read: 2026-10-10. Inspected: Entire §§1.1–1.6: maximal-compact dependence, corrected Theorem 1.2 and Cartan-compatible Hodge-manifold functoriality; pure period-map consequences remain valid. Verified digest: `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`.

- [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Annals of Mathematics 187 (2018), pp.391–531. Read: 2026-10-10. Inspected: §3.1 pp.415–416: quotient torus, reflex norm, finite étale Galois-set construction and distinction between schemes at neat level and quotient stacks. §3.2 integral-model boundary read, not planned in V4. Verified digest: `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`.

- [J. S. Milne and K.-y. Shih, Langlands’s construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf). LNM 900 (1982), pp.229–260; author scan. Read: 2026-10-10. Inspected: Page images: introduction pp.229–230 (sign, Serre character lattice), §§2–3 transition pp.242–243 (extension, Weil group and class formation). The remaining extension construction is a precisely recorded supplier gap. Verified digest: `a445a74d39559277971c090a677fc83a0b155813e802a4662765442ca8c0b700`.

- [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf). LNM 900 (1982), pp.280–356; author scan. Read: 2026-10-10. Inspected: Page images: introduction pp.280–281 (Taniyama torsor and contracted-product twist), §8 pp.340–341 (connected symmetry), §9 pp.342–345 (reduction). Verified digest: `c090098f609fd489a08778968eba653ecd8b67d7ad48e167381f6cc671c86b63`.

- [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf). Public Darmon CM notes (2011 directory). Read: 2026-10-10. Inspected: Theorem 4.2, p.9; Theorem 5.5 and Remark 5.6, pp.17–18; Proposition 6.5 and global torsion-field consequence, pp.23–24. These corroborate the existing NeronModels R11.3 supplier used to repair the CM inertia argument. Verified digest: `bfbad9fc883b2a6ac6e5f842abc664c2ebc84c348b9d80fa4ca6313b37e28173`.

- [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf). Dokl. Akad. Nauk SSSR 247:2 (1979), pp.279–282; Russian published original hosted by the coauthor. Read: 2026-10-10. Inspected: Page images: introduction and Theorem 1, p.279; proof conclusion and final simplicity-conjecture discussion, p.282. These check the precise result cited in Milne 1983 §3.10; the full perfection proof still requires supplier transcription. Verified digest: `383739c32a4df0c626923f989acd050ad68f588250f823effcd450cdd72a2b50`.

- [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11). Annals of Mathematics 84:3 (1966), pp.442–528; published article, OCR reproduction. Read: 2026-10-10. Inspected: §§1.8–1.11, pp.454–457, and §3.3(ii), pp.470–472: adapted unbounded realizations, projection and ambient Jacobian factors. §§3.5–3.7, pp.472–474: rational normalizers and arithmetic boundary quotients; Proposition 3.15, p.478: boundary codimension under the no-three-dimensional-Q-normal-subgroup hypothesis; §§4.8–4.11, pp.482–484: Satake topology, good neighborhoods, incidence and compactness. §§8.1–8.9, pp.509–514: induced boundary bundles, local and global integral forms, coordinate independence, restriction and product factors. §§9.6–9.7, pp.517–518, and §§10.4–10.11, pp.520–523: portions of normality and projective realization; full convergence estimates, analyticity-criterion proof and complete section-ring identification remain refinements. Theorem 10.14, pp.523–524: full holomorphic section-ring finite generation under the exclusion of three-dimensional Q-normal subgroups; this does not close the modular-curve/mixed-factor comparison. [Primary article reproduction read](https://paperzz.com/doc/6992794/compactification-of-arithmetic-quotients-of-bounded-symme...).

- [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dea8191cc6047d6142a65872ebce6eeeb841a29b/TauCetiRoadmap/AdelicAlgebraicGroups/README.md). TauCetiRoadmap main at dea8191cc6047d6142a65872ebce6eeeb841a29b. Read: 2026-10-10. Inspected: §§3.4, 4.1, 4.3–4.5 and Suggested.lean declaration Reduction.levelArithmetic_commensurable_pair: level commensurability, neat existence, local/global simply connected inputs, integral abelianization lifts and class-set abelianization. These are roadmap specifications, not implementation claims.
