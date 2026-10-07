# Complex Shimura varieties and canonical models

This roadmap constructs the finite-level Shimura variety and its Hecke tower for every pure Shimura datum, first over ℂ and then over its reflex field. Its arithmetic endpoint is an existence theorem for models satisfying reciprocity at every actual special pair. The specified complex comparison, finite-level maps, right translations and Galois action are part of that endpoint. The modular-curve comparisons identify the constructed models with the existing Katz–Mazur models over ℚ, including determinant components, cusps and Tate parameters.

The route has three distinct steps. Arithmetic quotients acquire an analytic structure in V0–V1. Baily–Borel constructs their algebraic varieties and minimal compactifications in V2; Borel proves algebraicity and uniqueness in V3. The torus reciprocity condition in V4 is then verified by CM theory for Siegel varieties, inherited by Hodge-type subdata, and reconstructed through connected derived data for abelian type. General pure data require the separate conjugation, coherence and continuous-descent argument of V7. V8 proves functoriality conditionally on actual canonical models and applies it to each existence theorem. Its abelian-type application therefore does not wait for V7.

This is a formalisation plan. All proposed declarations remain unchecked. The inventory contains 95 nodes, 72 API items and 42 unit-test specifications. Nine layers have planned coverage and V2 has partial coverage: its all-type boundary-growth predicate still needs an exact definition. No layer is closed. The supplier contracts and proof refinements below remain requirements for formalisation, including those inherited by a consumer through an exact node reference.

## Scope and neighbouring roadmaps

The boundaries follow the atlas prerequisites and consumers and the link maps to the existing ModularCurves, NumberFieldArithmetic and ClassFieldTheory roadmaps. Existing Tau Ceti targets are imports; the comparisons here prove additional compatibility with canonical models.

| Owner | Imported input or exported interface |
| --- | --- |
| ShimuraData D2–D5 | Pure data, Hermitian domains, cocharacter/reflex-field conventions, special pairs, Siegel/Hodge/abelian-type witnesses and adelic level subgroups. V0 proves the arithmetic properties of the already defined component subgroups. Connected derived data use the adjoint S-map described below. |
| AdelicAlgebraicGroups AA.3–AA.5; ArithmeticLocallySymmetricSpaces ALS.0 | Reduction theory, class-set finiteness, neat sublevels, approximation with its hypotheses, arithmetic/effective actions and the GL₂ component computation. Required arithmeticity, integral abelianization and rigidity refinements stay with these owners. |
| Tau Ceti ReductiveGroups Layer 7; ReductiveGroups Part II | Root, torus, parabolic and central-isogeny structure is imported from Layer 7. Rational real density, centre cohomology, torus norm obstructions and restriction-of-scalars refinements are requested from Part II; structural root theory does not supply these arithmetic theorems. |
| ComplexComparisonPartII C0, C2, C4 | Complex analytic spaces with nilpotents, holomorphic gluing, analytification, GAGA, Chow and definable graph comparison. The proposed CA.0 foundation supplies carriers before C0; the proposal is unapplied. V2 constructs the analytic automorphic ring before algebraization. |
| AlgebraicModuliForArithmeticGeometry R09 | Effective descent, finite quotients, closure and base change, relative cocharacter schemes, Hilbert irreducibility and characteristic-zero normal-crossing compactifications. These are scheme-theoretic suppliers, not canonical-model existence assumptions. |
| AbelianSchemesAndArithmeticModuli A2–A6; NeronModelsAndSemistableAbelianVarieties R11 | Actual abelian schemes, polarizations, Hom/endomorphisms, Tate modules, weight-one analytic families, semistable reduction and Néron–Ogg–Shafarevich. V5 proves the CM and arithmetic Shimura specializations. |
| PELModuli M3–M5 | Rational moduli objects, analytic comparison, Galois action and the genus-one identification with the existing full-level modular model. V5 proves the canonical condition; V8 compares the resulting canonical tower. PEL moduli is not an axiom giving all canonical models. |
| ComplexMultiplicationAndExplicitReciprocity CM.0 and proposed CM.S | CM types, reflex types and their product-algebra norm identities come from CM.0. V5 owns the main CM theorem used here. A shared Serre/Taniyama extension owner is proposed for V7; later explicit CM applications consume this roadmap, so the input must not be routed back through their later layers. |
| Tau Ceti ClassFieldTheory Layer 11; NumberFieldArithmetic Layer 2 | Arithmetic Artin reciprocity and norm/restriction compatibility, ray-class prime generation and Frobenius ideals. V4 explicitly converts arithmetic reciprocity to Milne's geometric convention. |
| Tau Ceti ModularCurves PR81; ModularCurvesPartII R12–R13 | Full ordered bases, Γ₁ and coarse Γ₀ models, analytic/homology comparisons, Hecke normalizations, generic compact curves and cusp/Tate charts. PR81 Layer 10's prime diamond quotients do not supply full principal-level or composite-level compactifications. R13.4a/b provide that independent base case. |
| AutomorphicBundles | Consumes algebraic towers and canonical-model comparisons. Algebraic automorphic bundles, absolute Hodge tensors and their moduli interpretation are owned there; they are not used to define the analytic section ring or to replace V7. |
| ShimuraCompactifications C1–C2 and general suffix | Consumes the complex minimal compactification from V2 and its arithmetic model from V8. Toroidal cone decompositions, mixed boundary torsors and toroidal extensions stay there. The pure codimension-one arithmetic extension in V8 uses Pink 12.10; it does not import the mixed torus torsor of Pink 12.8. |
| PerfectoidShimuraVarieties S0 and general suffix | Consumes compatible finite-level models and Hecke maps. Perfectoid inverse limits are separate targets; the finite-level functor here does not assert existence of an infinite-level scheme. |
| HilbertModularVarietiesAndShimuraCurves; HeegnerPointEulerSystems | Consume the datum, modular and CM specializations, with the actual reflex-field and level conventions. Their arithmetic applications are outside this roadmap. |

## Conventions

Write D=(G,X) for a pure Shimura datum, E=E(D)⊂ℂ for its reflex field, and K⊂G(𝔸_f) for a compact open subgroup. At finite level the point set is G(ℚ)\(X×G(𝔸_f))/K, with [x,a]_K=[qx,qak]_K. The quotient topology comes from the domain topology and the discrete finite-adelic coset space.

A component X⁺ is stabilized by G(ℚ)₊, the inverse image of Gᵃᵈ(ℝ)⁺; this need not be G(ℚ)∩G(ℝ)⁺. Arithmetic component groups act through their effective image in holomorphic automorphisms. Rational central elements may act trivially. For a normal level inclusion, use the effective image of K/K′ in automorphisms over the base. A disconnected cover can have additional deck automorphisms: equality with the full deck group requires a connected regular-cover argument.

Right translation is T_g([x,a]_K)=[x,ag]_L when g⁻¹Kg⊂L; at conjugate level it is an isomorphism. Applying T_h after T_g gives T_{gh}. The level-K Hecke span has apex J=K∩gKg⁻¹, first leg the projection to K and second leg T_g followed by the projection from g⁻¹Jg to K. Composition uses fibre products with the relevant double-coset multiplicities.

ClassFieldTheory supplies arithmetic reciprocity rec_F. Throughout this roadmap art_F(s)=rec_F(s)⁻¹ is Milne's geometric reciprocity, and r_h is the multiplicative reflex norm. For an actual special pair (T,h) and σ fixing E(T,h), the canonical condition is σ[h,a]_K=[h,r_h(s)a]_K when art_{E(T,h)}(s)=σ on E(T,h)ᵃᵇ. The field of definition and independence of the idele lift are part of the condition. An arbitrary chosen subset of points cannot replace the actual special pairs.

A strict torus datum (T,{h}) has a singleton domain. Component reciprocity instead uses the extended zero-dimensional set (T,Y,μ), where Y is a finite transitive T(ℝ)/T(ℝ)⁺-set and full ideles act at infinity as well as at finite places. For GL₂ principal level N≥3, Y={±1} gives the φ(N) determinant components and the model μ_N^prim over ℚ. The strict one-point 𝔾_m datum gives the quotient by {±1} and a real cyclotomic model. The two constructions are distinguished in the definitions and tests below.

For connected derived data, points are S→Gᵃᵈ_ℝ even when G is semisimple simply connected. A lift to G_ℝ need not exist. ConnectedTower is an analytic pro-object and its inverse-limit point set, with the congruence completion and Galois extension retained; it is not a finite-dimensional analytic inverse limit. Its marked cocharacter is in the adjoint special torus.

For a datum morphism D→D′, E(D′)⊂E(D). The compositum appearing in Milne's functoriality statement is thus E(D); target models are base changed there. In the GL₂ dictionary a row basis has action (P,Q)u=(aP+cQ,bP+dQ) for u with rows (a,b),(c,d), with determinant exponent on the Weil pairing. Fine full level requires N≥3 and fine Γ₁ level requires N≥4; Γ₀ comparisons are coarse. At a cusp of width w use q_c=exp(2πiz/w) and q=q_c^w.

Names live in `TauCeti.Shimura`; names displayed without that prefix are relative to it. The exact packet node identifiers are stable, including the three V8 foundations displayed in the V4 lane. Their parent stages and ownership remain V8.

## Sources and proof route

Milne's *Introduction to Shimura varieties* fixes the normalizations and the V0–V8 route. Its §3 gives the Baily–Borel/Borel outline, §§10–11 the CM argument, §§12–13 the canonical condition and uniqueness, and §14 the distinction between abelian-type reduction and general conjugation. Deligne's *Travaux de Shimura* supplies the disjoint-special-reflex-field argument and connected symmetry; Milne 1983 supplies the marked general conjugation argument, with the author's annotations applied. Milne 1999 supplies the continuous-descent criterion. Pink §§8 and 12 give the pure partial/minimal compactification construction. The independent modular compactification is supplied before that general construction.

The packet source identifiers `svi` and `milne-svi` refer to the same 16 September 2017 PDF (SHA-256 `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`). Other editions and exact locators are listed with their declarations. Source corrections at the end retain their part-qualified identities. The primary Baily–Borel, multivariable Borel, exceptional Kazhdan, connected-coherence and exceptional central-adjustment arguments have explicit remaining audits; a survey citation does not discharge them.

## Layer overview

| Layer | Target | Input lane | Coverage |
| --- | --- | --- | --- |
| [V0](#v0) | Arithmetic groups and finite components | D5; AA/ALS | planned |
| [V1](#v1) | The analytic tower | V0; analytic foundations | planned |
| [V2](#v2) | Baily–Borel and minimal compactification | V1; analytic foundations; GAGA/Chow | partial |
| [V3](#v3) | Borel algebraicity and uniqueness | V2; R09.7d | planned |
| [V4](#v4) | Torus models and the canonical condition | V3; D3–D4; class field theory | planned |
| [V5](#v5) | CM abelian varieties and Siegel existence | V4; abelian and PEL moduli; CM.0; R11 | planned |
| [V6](#v6) | Hodge and abelian type | V5; conditional V4 foundations | planned |
| [V7](#v7) | General data: conjugation and descent | V3–V6; general conjugation and continuous descent | planned |
| [V8](#v8) | The algebraic tower and modular comparisons | V4 foundations; actual V5/V6 models; modular comparisons | planned |
| [V8.general](#v8-general) | The general-data applications | V7; the same conditional V8 declarations | planned |

The conditional disjoint-field, translation-descent and model-uniqueness nodes are read after V4 and before V5–V6 use them. Their proofs consume V1–V4 and scheme-theoretic suppliers, with no V5, V6 or V7 existence premise. V8 later assembles and applies them. This reading order preserves the acyclic declaration graph and the existing identifiers.

<a id="v0"></a>

## V0. Arithmetic groups and finite components

Specialize the imported arithmetic and approximation interfaces to component stabilizers. Keep rational positivity, effective central kernels and the hypotheses of strong approximation in the component formula.

<a id="v0-stabilizer-arithmetic"></a>

### Arithmetic component stabilizers

Declaration **TauCeti.Shimura.stabilizer_arithmetic** (theorem), node `ShimuraVarieties:V0/stabilizer-arithmetic`.

For a pure datum (G,X), component X⁺, compact open K and a∈G(A_f), Γ_a=G(Q)_+∩aKa⁻¹ is an arithmetic subgroup of G(Q), of finite index in G(Q)∩aKa⁻¹. Its image in the effective real automorphism group of X⁺ is arithmetic and discrete. G(Q)_+ means the inverse image of G^ad(R)^+, with compact adjoint factors removed only in the effective image.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the congruence-intersection arithmeticity theorem of AA.3, not merely its discreteness clause; request the missing commensurability statement.
2. Passing to the finite-index component stabilizer preserves arithmeticity. The algebraic image theorem (Milne 3.2) and removal of the compact ineffective factor give a discrete arithmetic domain image.
3. Distinguish discreteness of Γ in all real group points from discreteness of its domain image: the latter is the input to D5/effective-free.

Direct inputs: `ShimuraData:D5/component-subgroup`, `ShimuraData:D5/effective-kernel`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3`.

Acceptance checks:

- For GL₂ at principal N≥3, the effective stabilizer of ℍ is the image of Γ(N).
- A real-quadratic central unit can lie in Γ_a and act trivially on X⁺; no faithfulness assertion follows.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.2 and 5.13, pp.33,57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Arithmetic component stabilizers**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#gap-v0-3), [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v0-stabilizer-commensurable"></a>

### Commensurability of stabilizers

Declaration **TauCeti.Shimura.stabilizer_commensurable** (theorem), node `ShimuraVarieties:V0/stabilizer-commensurable`.

For fixed G and X⁺, Γ_{a,K} and Γ_{b,L} are commensurable for arbitrary a,b∈G(A_f) and compact open K,L, since they are arithmetic in the same rational group. If b=qak with q∈G(Q)_+, k∈K and L=K, then Γ_b=qΓ_aq⁻¹, and x↦qx identifies their effective quotients.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Intersect the two compact open subgroups; their indices over the intersection are finite. Rational intersections and component stabilizers inherit finite indices.
2. Compute the conjugation identity for b=qak, preserving the chosen component.

Direct inputs: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), `ShimuraData:D5/component-subgroup`.

Acceptance checks:

- Commensurability does not require a,b to represent the same double coset.
- Representative change uses q∈G(Q)_+ when X⁺ is fixed.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

<a id="v0-neat-sublevels"></a>

### Shimura specialization of cofinal neat levels

Declaration **TauCeti.Shimura.neat_sublevels** (theorem), node `ShimuraVarieties:V0/neat-sublevels`.

Specialize AA.4/neat-level-exists to the rational group of a pure Shimura datum: every compact open K contains a normal open K₀ of finite index that is neat in the D5 rational-conjugate sense. Apply the same supplier inside every prescribed compact open sublevel for cofinality. Existence and the normal-core construction remain owned by AA.4; this node is only the convention bridge to the Shimura tower.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import AA.4/neat-level-exists, including its normality and finite-index conclusions; do not repeat its faithful-representation congruence proof.
2. Use the checked AA.4 neat-level and D5 neat-level predicates: both require rational points in every adelic conjugate to be neat. Representation independence identifies their conventions.
3. Apply the supplier to each prescribed compact open sublevel. Neatness is stable under subgroups, so these sublevels form a cofinal system for the tower.

Direct inputs: `AdelicAlgebraicGroups:AA.4/neat-level-exists`, `AdelicAlgebraicGroups:AA.4/neat-level`, `ShimuraData:D5/neat-level`, `ShimuraData:D5/neat-representation-independence`.

Acceptance checks:

- No assertion that all principal level 2 subgroups are neat.
- For GL₂ principal N≥3 use D5/gl2-congruence-neat; N=2 retains −I.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.5 and §5, pp.34,58. SVI gives the Shimura use of neat congruence subgroups. AA.4 owns existence; the local target imports it and identifies the D5 convention.

Atlas planet: **Neat levels in the Shimura tower**.

<a id="v0-effective-proper-action"></a>

### Proper effective arithmetic action

Declaration **TauCeti.Shimura.effective_proper_action** (theorem), node `ShimuraVarieties:V0/effective-proper-action`.

The effective image Γ_a^eff acts properly discontinuously on X⁺; at rationally neat K it acts freely. Thus its orbit projection is a covering map locally biholomorphic once the holomorphic quotient carrier is supplied. No conclusion that Γ_a itself acts freely is drawn.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Discreteness from stabilizer-arithmetic combines with the proper symmetric-space action supplied by ALS.0.
2. Use D5/effective-free to exclude effective stabilizers at neat level. Descend charts through disjoint translates; manifold gluing is an explicit requested supplier.

Direct inputs: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), `ShimuraData:D5/effective-free`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- Central totally real units survive neatness but disappear in Γ_a^eff.
- At non-neat level elliptic fixed points remain; the quotient is an analytic space.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.6, 3.11 and 5.13, pp.34,37,58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Effective arithmetic action**.

Remaining refinements: [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#gap-v0-2).

<a id="v0-component-decomposition"></a>

### Finite analytic component decomposition

Declaration **TauCeti.Shimura.component_decomposition** (theorem), node `ShimuraVarieties:V0/component-decomposition`.

For every compact open K, G(Q)_+\G(A_f)/K is finite, and choice of representatives a induces ⨿_a Γ_a\X⁺ ≅ G(Q)\(X×G(A_f)/K), first as topological spaces and then as complex analytic spaces. Changing a=qbk transports the component by q, so the decomposition is independent of representatives up to the specified analytic isomorphisms.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Finite index of G(Q)_+ in G(Q) refines AA.3 class finiteness to the plus double cosets.
2. Milne 5.11–5.13 identify representatives and stabilizers by the diagonal rational action.
3. For topology use open finite adelic cosets. For analytic compatibility use the effective quotient charts and representative-change holomorphic maps.

Direct inputs: `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, [`ShimuraVarieties:V0/stabilizer-commensurable`](#v0-stabilizer-commensurable), [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), `ShimuraData:D2/hermitian-domain-components`.

Acceptance checks:

- For the GL₂ datum principal N≥3 yields φ(N) components, not φ(N)/2.
- For a torus singleton domain the components are the finite torus double quotient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemmas 5.11–5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Finite component decomposition**.

Remaining refinements: [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#gap-v0-2).

<a id="v0-simply-connected-components"></a>

### Abelianized component formula

Declaration **TauCeti.Shimura.simply_connected_components** (theorem), node `ShimuraVarieties:V0/simply-connected-components`.

Assume G^der is simply connected. Put T=G/G^der and ν:G→T, T(Q)^†=ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)). Then π₀(Sh_K^an(G,X))≃T(Q)^†\T(A_f)/ν(K). Apply strong approximation only to the semisimple simply connected derived group, whose Q-simple factors have noncompact real points by SV3; never to G or a torus without hypotheses.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Specialize AA.4/class-set-abelianization to the component stabilizer G(Q)_+. The derived rational subgroup lies in G(Q)_+; retain the actual image ν(G(Q)_+).
2. Use SVI 5.18–5.20 and AA.4/hasse-principle-simply-connected to identify that image with T(Q)∩ν(Z(G)(R)). Finite-place torsors vanish by AA.4/kneser-local-torsor.
3. SVI 5.21 also needs surjectivity on integral points at almost all finite places: spread ν to a smooth model with connected kernel, apply Lang over the finite residue field, then lift by Hensel. This exact supplier refinement is recorded as a gap.
4. Apply strong approximation to G^der, with noncompactness on each Q-simple real factor supplied by SV3, to make the fibres single connected arithmetic quotients. Local openness gives compact open ν(K).

Direct inputs: [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/class-set-abelianization`, `AdelicAlgebraicGroups:AA.4/kneser-local-torsor`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`.

Acceptance checks:

- For GL₂, T(Q)^†=Q_{>0}; principal level N gives (Z/NZ)×.
- A definite quaternion norm-one group fails the real noncompactness condition.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.17, Lemmas 5.18–5.21 and component-fibre argument, pp.59–61. Lemma 5.20 identifies rational positivity; Lemma 5.21 supplies the adelic image/open-subgroup conclusions. The component-fibre argument applies strong approximation only to the derived group.

Atlas planet: **Abelianized components**.

Remaining refinements: [Adelic abelianization integral images](#gap-v0-15).

<a id="v1"></a>

## V1. The analytic tower

Construct the orbit carrier, charts, finite level maps, right translations, ordered Hecke spans and datum maps. Neat target levels give local biholomorphisms; arbitrary levels use finite normal analytic quotients.

<a id="v1-analytic-points"></a>

### Finite-level analytic Shimura points

Declaration **TauCeti.Shimura.AnalyticPoints** (definition), node `ShimuraVarieties:V1/analytic-points`.

For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.
2. Use the explicit component equivalence of V0 to specify the quotient topology and map points.

Direct inputs: `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/level-quotient`, `mathlib:MulAction.orbitRel.Quotient`, [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition).

Uses that determine the interface:

- **Milne 5.13:** component charts use this precise rational diagonal quotient
- **V8 level-tower:** analytic comparison of algebraic level maps

Planning API:

- `TauCeti.Shimura.AnalyticPoints.mk` (constructor): Send (x,a) to [x,a]_K.
- `TauCeti.Shimura.AnalyticPoints.mk_eq` (characterisation): [x,a]_K=[y,b]_K iff ∃q∈G(Q), k∈K with y=qx and b=qak.
- `TauCeti.Shimura.AnalyticPoints.lift` (universal-property): A function on X×G(A_f) invariant under the rational diagonal and right K actions descends uniquely; evaluation at [x,a] recovers its value.
- `TauCeti.Shimura.AnalyticPoints.level` (functoriality): For K′⊂K send [x,a]_{K′} to [x,a]_K; identity and composition hold.

Unit tests:

- `TauCeti.Shimura.AnalyticPoints.trivial` (degenerate): The trivial datum has one point at its unique level.
- `TauCeti.Shimura.AnalyticPoints.torus` (compatibility): For singleton torus datum, Sh_K^pts=T(Q)\T(A_f)/K, including the rational quotient.
- `TauCeti.Shimura.AnalyticPoints.keep_domain` (non-example): For GL₂ the fibre of one finite component is Γ_a\ℍ, an infinite set, not a singleton finite double coset.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, definition before Lemma 5.13, p.57. Supports finite-level analytic shimura points. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.

Atlas planet: **Analytic Shimura variety**.

<a id="v1-analytic-structure"></a>

### Complex analytic structure of the tower

Declaration **TauCeti.Shimura.analytic_structure** (theorem), node `ShimuraVarieties:V1/analytic-structure`.

The carrier Sh_K^pts has a canonical normal complex analytic-space structure characterized componentwise by Γ_a^eff\X⁺. If K is rationally neat it is a smooth complex manifold. For general K choose neat normal K′⊂K; the analytic finite quotient by the actual K/K′ action gives the same space, independently of K′.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat level glue the quotient local charts using holomorphic transition maps.
2. For general level take invariant local holomorphic functions under finite effective stabilizers; normality follows from invariants of normal local rings.
3. Compare normal sublevels through a common neat refinement. Analytic spaces with gluing and finite quotients are requested explicitly.

Direct inputs: [`ShimuraVarieties:V1/analytic-points`](#v1-analytic-points), [`ShimuraVarieties:V0/neat-sublevels`](#v0-neat-sublevels), [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), `ComplexComparisonPartII:C0`.

Acceptance checks:

- Smoothness is asserted at neat level only.
- Infinite ineffective central kernels never enter the local finite stabilizer action.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Analytic tower**.

Remaining refinements: [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#gap-v0-2).

<a id="v1-holomorphic-level-maps"></a>

### Holomorphic finite level maps

Declaration **TauCeti.Shimura.holomorphic_level_maps** (theorem), node `ShimuraVarieties:V1/holomorphic-level-maps`.

For K′⊂K, Sh_{K′}^an→Sh_K^an is finite and holomorphic. If K is neat it is locally biholomorphic; after algebraization in V3 it is finite étale. For K′ normal in K, the effective image H of K/K′ in Aut(Sh_{K′}^an) acts over Sh_K^an and its orbit quotient is Sh_K^an. H is a subgroup of the automorphisms over the base; it need not be the full deck group on a disconnected cover. A full deck-group formula requires the separate connected regular-cover hypotheses. For nonnormal K′ no such group formula is asserted.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.
2. Lift through component quotient charts to prove holomorphicity and local biholomorphicity at neat target.
3. Compute the kernel of K/K′ on all points; its effective image gives the finite quotient. Do not identify that image with every automorphism over the base of a disconnected cover.

Direct inputs: [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), `AdelicAlgebraicGroups:AA.4/level-covering-map`, [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), `AdelicAlgebraicGroups:AA.4`.

Acceptance checks:

- The quotient-action group is H=(K/K′)/ker(action); full deck-group equality is asserted only for an appropriate connected regular cover.
- For the norm datum on G_m, principal K(3) gives one point and K(21) gives six points. The effective K(3)/K(21) action is the regular C₆ action; the full automorphism group over the one-point base is S₆.
- A neat covering source does not remove ramification over elliptic points of a non-neat target.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, p.58; finite-level consequence of the arithmetic covering supplier. Supports holomorphic finite level maps. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.

Atlas planet: **Holomorphic level maps**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#gap-v0-3).

<a id="v1-right-translation"></a>

### Holomorphic right translations

Declaration **TauCeti.Shimura.right_translation** (theorem), node `ShimuraVarieties:V1/right-translation`.

For g∈G(A_f), R_g:Sh_K^an→Sh_{g⁻¹Kg}^an sends [x,a] to [x,ag]. It is a biholomorphism with inverse R_{g⁻¹}; R_h∘R_g=R_{gh} with conjugated intermediate levels. It commutes with level projections.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Check g⁻¹Kg is the target level by rewriting akg=ag(g⁻¹kg).
2. On component charts the map uses a rational representative change, hence is holomorphic.
3. Point formulas prove inverse, composition and commutation with level maps.

Direct inputs: [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), `AdelicAlgebraicGroups:AA.4/level-quotient`.

Acceptance checks:

- The conjugated target is g⁻¹Kg, not gKg⁻¹ for this direction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Holomorphic Hecke translations**.

<a id="v1-holomorphic-hecke"></a>

### Holomorphic Hecke correspondences

Declaration **TauCeti.Shimura.holomorphic_hecke** (theorem), node `ShimuraVarieties:V1/holomorphic-hecke`.

For K_g=K∩gKg⁻¹, the Hecke span is Sh_K^an←Sh_{K_g}^an→Sh_K^an with arrows [x,a]↦[x,a] and [x,a]↦[x,ag]. Both are finite holomorphic, and locally biholomorphic at neat K. Replacing g by k₁gk₂ gives an isomorphic span. Composition is represented by the fibre product of spans and its double-coset decomposition, retaining multiplicities and effective degrees.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the AA.4 topological span, then holomorphicity of its two factors.
2. For composition take the actual fibre product, not a single intersection level without the AA.4 product hypothesis U′L=U.
3. Enumerate the finite double cosets and identify the component isomorphisms; effective stabilizers correct raw indices.

Direct inputs: [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/hecke-cartesian`, `AdelicAlgebraicGroups:AA.4`.

Acceptance checks:

- Both arrows have target K by the chosen K_g convention.
- Normality of a sublevel alone does not make every Hecke pullback one intersection-level variety.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Holomorphic Hecke correspondences**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#gap-v0-3).

<a id="v1-datum-analytic-map"></a>

### Holomorphic maps of data

Declaration **TauCeti.Shimura.datum_analytic_map** (theorem), node `ShimuraVarieties:V1/datum-analytic-map`.

A morphism f:(G,X)→(H,Y) and levels f(K)⊂L induce a holomorphic map Sh_K^an(G,X)→Sh_L^an(H,Y), [x,a]↦[f(x),f(a)], compatible with levels and translations. An injective subdatum yields a closed immersion at suitable sufficiently small levels after V3 algebraization; no closed-immersion assertion is made at arbitrary coarse levels.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Descend the equivariant map of domain and finite adelic coordinates.
2. Holomorphicity is inherited from the Hodge-domain map, then checked on component quotient charts.
3. Retain Milne 5.16 separation of stabilizers for the suitably small-level embedding, used in V6.

Direct inputs: `ShimuraData:D4/datum-morphism`, [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), [`ShimuraVarieties:V1/right-translation`](#v1-right-translation).

Acceptance checks:

- A noninjective morphism need not be an embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and following clarification, pp.58–59. Supports holomorphic maps of data. Descend the equivariant map of domain and finite adelic coordinates.

<a id="v2"></a>

## V2. Baily–Borel and minimal compactification

Construct rational boundaries and the Satake topology before the analytic automorphic ring. Convergent separating sections, normality and finite generation give a projective realization; Chow and GAGA algebraize it. The no-PGL₂ condition controls Koecher, while modular factors retain cusp growth. The exact all-type growth predicate and primary proof audit remain open.

<a id="v2-rational-boundary"></a>

### Rational boundary components and incidence

Declaration **TauCeti.Shimura.rational_boundary** (theorem), node `ShimuraVarieties:V2/rational-boundary`.

For the effective Hermitian symmetric domain D of a rational semisimple adjoint group, construct its rational boundary components in the bounded realization, selected by rationality of their stabilizing parabolic and the corresponding rational boundary datum. Identify their Hermitian quotients and closure incidence. The rational extension D* is D together with these components, not the full Euclidean boundary.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Milne 3.12 describes rational components; the full general boundary classification in BB66 §§1–3 must be source-audited (recorded gap).
2. Use relative parabolic/root data to distinguish the rational components and their incidence. Import general group structure rather than rebuilding it.

Direct inputs: `ShimuraData:D2/hermitian-domain-components`, `ShimuraData:D3/borel-embedding`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite`.

Acceptance checks:

- For ℍ the rational extension adds P¹(Q), not every point of P¹(R).
- The Γ-orbits of rational boundary strata are finite.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Rational boundary components**.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-satake-compactness"></a>

### Satake topology and compactness

Declaration **TauCeti.Shimura.satake_compactness** (theorem), node `ShimuraVarieties:V2/satake-compactness`.

Equip D* with the rational Satake topology. For arithmetic Γ^eff, Γ^eff\D* is compact Hausdorff, contains Γ^eff\D as an open dense set and has finitely many boundary strata; the topology restricts to the usual complex topology on each stratum.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Specify cusp neighborhoods through rational parabolic height coordinates; use AA.3 finite-cover/overlap reduction.
2. Establish compactness and separation by the BB66 §4 rational-boundary construction, whose precise proof audit is a gap.

Direct inputs: [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`.

Acceptance checks:

- An anisotropic datum has empty rational boundary and a compact quotient.
- For a modular curve the cusp topology is the q-disk topology.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Satake compactification**.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-analytic-automorphic-ring"></a>

### Analytic automorphic graded ring

Declaration **TauCeti.Shimura.AutomorphicRing** (definition), node `ShimuraVarieties:V2/analytic-automorphic-ring`.

For a torsion-free effective arithmetic Γ on D, define A_n(Γ) as holomorphic sections of the n-th power of the canonical analytic automorphy factor satisfying the Baily–Borel holomorphy/growth conditions at every rational boundary component. In bounded local coordinates f(γz)det(Dγ_z)^n=f(z); in cusp coordinates allowable Fourier exponents lie in the nonnegative cone. A(Γ)=⊕_{n≥0}A_n with product of sections. One passes to a positive Veronese when required to clear automorphy characters. Cusp forms require additional vanishing and are a different subspace.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Define the analytic factor and its cocycle using the derivative of the domain action.
2. State the boundary growth condition before any algebraization; the exact all-type BB66 §§5–9 growth/extension equivalence remains a source gap.
3. Pointwise product preserves growth and grading; restrict to boundary through Siegel operators.

Direct inputs: [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), `ShimuraData:D3/homogeneous-variation`, `ComplexComparisonPartII:C0`.

Uses that determine the interface:

- **V2 projective-realization:** the graded analytic sections construct the projective embedding without an algebraic bundle assumption
- **AutomorphicBundles:B2:** compares the algebraized bundle/section ring with this analytic construction

Planning API:

- `TauCeti.Shimura.AutomorphicRing.degree` (data): The degree-n piece is A_n(Γ), with A_0=C on a connected quotient.
- `TauCeti.Shimura.AutomorphicRing.mul` (structure): Multiplication A_m×A_n→A_{m+n} is pointwise tensor product; unit and associativity hold.
- `TauCeti.Shimura.AutomorphicRing.siegel` (projection): Restriction to a rational boundary component is the weight-compatible Siegel operator and commutes with products.
- `TauCeti.Shimura.AutomorphicRing.level` (functoriality): For Γ′⊂Γ, pullback embeds A_n(Γ) into A_n(Γ′); identity and composition hold.
- `TauCeti.Shimura.AutomorphicRing.veronese` (compatibility): Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.
- `TauCeti.Shimura.AutomorphicRing.mk` (constructor): A weight-n holomorphic section satisfying the transformation law and the specified boundary predicate defines an element of A_n; its underlying section is unchanged.
- `TauCeti.Shimura.AutomorphicRing.ext` (extensionality): Two elements of A_n are equal if their holomorphic section values agree at every point of D.
- `TauCeti.Shimura.AutomorphicRing.eval` (projection): Evaluation on D is complex-linear on each degree and carries the graded product to pointwise multiplication.

Unit tests:

- `TauCeti.Shimura.AutomorphicRing.degree_zero` (degenerate): On a connected compactification the degree-zero piece consists of constants.
- `TauCeti.Shimura.AutomorphicRing.elliptic_weight` (compatibility): For ℍ the canonical n-th automorphy factor corresponds to scalar modular weight 2n, with holomorphy at cusps.
- `TauCeti.Shimura.AutomorphicRing.not_cusp` (non-example): For the torsion-free principal group Γ(3)⊂SL₂(Z), the restriction of E₄ is an allowed weight-4 (degree-two) form, with constant Fourier coefficient 1 at infinity. It is not a cusp form.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Automorphic graded ring**.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4), [Exact automorphic boundary predicate](#gap-v0-20).

<a id="v2-poincare-eisenstein"></a>

### Automorphic sections separating strata

Declaration **TauCeti.Shimura.poincare_eisenstein** (theorem), node `ShimuraVarieties:V2/poincare-eisenstein`.

For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of Γ\D* and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct series using sufficiently high weight and cusp estimates; use reduction to control convergence.
2. Establish rational boundary restrictions, then induction on strata for separation.
3. BB66 §§5–10 are the required primary proof; Milne only supplies the outline, so this is an explicit source-refinement gap, not an assumed separation axiom.

Direct inputs: [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/satake-compactness`](#v2-satake-compactness), `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`.

Acceptance checks:

- Point separation alone does not assert an immersion or analytic closed embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-normal-analytic-compactification"></a>

### Normal analytic Baily–Borel quotient

Declaration **TauCeti.Shimura.normal_analytic_compactification** (theorem), node `ShimuraVarieties:V2/normal-analytic-compactification`.

The compact Satake quotient Γ\D* has a canonical normal complex analytic-space structure whose sheaf restricts to the invariant holomorphic sheaf on each stratum and whose open stratum is the analytic quotient Γ\D. It agrees with the projective realization by high-weight automorphic sections.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct local analytic rings using boundary restrictions and normal extension.
2. Use separating sections to compare this ringed structure with local projective charts; the BB66 §§8–10 local-normality proof is a source gap.
3. Apply finite analytic quotient invariants for torsion Γ as well.

Direct inputs: [`ShimuraVarieties:V2/poincare-eisenstein`](#v2-poincare-eisenstein), [`ShimuraVarieties:V2/satake-compactness`](#v2-satake-compactness), `ComplexComparisonPartII:C0`.

Acceptance checks:

- Normality is required, not just a compact topological carrier.
- Non-neat quotients are allowed with finite effective local stabilizers.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(a), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-automorphic-finite-generation"></a>

### Finite generation of automorphic forms

Declaration **TauCeti.Shimura.automorphic_finite_generation** (theorem), node `ShimuraVarieties:V2/automorphic-finite-generation`.

The analytic graded C-algebra A(Γ) is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize Γ\D* as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Establish the ampleness/high-weight realization from the analytic boundary construction.
2. Prove finite generation of the section ring through that realization, not by declaring it algebraic at the outset.
3. Verify invariance under Veronese and under passage to finite invariant rings. The precise primary BB proof remains recorded.

Direct inputs: [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), [`ShimuraVarieties:V2/poincare-eisenstein`](#v2-poincare-eisenstein).

Acceptance checks:

- The weight-one piece need not itself generate the ring.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(c), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Baily–Borel projective realization**.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-baily-borel"></a>

### Baily–Borel algebraization

Declaration **TauCeti.Shimura.baily_borel** (theorem), node `ShimuraVarieties:V2/baily-borel`.

Every finite-level analytic Shimura variety has a normal quasi-projective C-scheme algebraization, smooth at neat level, with open immersion into its normal projective minimal compactification. Analytification identifies the compactification with the compact rational Satake quotient and identifies its algebraic boundary strata with the analytic arithmetic boundary quotients.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply Chow to the projective analytic realization and its boundary closed subspaces, importing C4 rather than reproducing it.
2. Normality and the open-stratum analytic comparison supply the quasi-projective open scheme.
3. Use projective GAGA for the coherent ideal and section comparisons; glue the finite components.

Direct inputs: [`ShimuraVarieties:V2/automorphic-finite-generation`](#v2-automorphic-finite-generation), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`, [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), `mathlib:AlgebraicGeometry.Scheme`.

Acceptance checks:

- Projective minimal compactifications may be singular even at neat level.
- The construction uses analytic automorphic forms before automorphic-bundle algebraization.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.12 and Remark 3.13, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Baily–Borel theorem**.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-koecher"></a>

### Koecher principle and boundary codimension

Declaration **TauCeti.Shimura.koecher** (theorem), node `ShimuraVarieties:V2/koecher`.

If the rational semisimple effective group has no quotient isomorphic over Q to PGL₂, the boundary of the minimal compactification has codimension at least two. In the resulting Koecher range holomorphic canonical-factor automorphic sections have the required boundary growth/extension, yielding the canonical-form section-ring description. In the modular-curve factor case retain cusp conditions and logarithmic canonical forms.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Compute dimensions of boundary strata from rational root data; identify the exceptional rational three-dimensional factor.
2. Apply the holomorphic Fourier/Koecher extension argument in codimension at least two.
3. Do not use Q-rank one alone to decide codimension: ball quotients of dimension at least two are rank-one examples with higher-codimension cusps.

Direct inputs: [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel).

Acceptance checks:

- Modular curves have codimension-one cusps.
- Rank-one ball quotients need not have divisorial minimal boundary.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(b)–(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v2-minimal-level-extension"></a>

### Level maps on minimal compactifications

Declaration **TauCeti.Shimura.minimal_level_extension** (theorem), node `ShimuraVarieties:V2/minimal-level-extension`.

Finite analytic level maps and Hecke right translations extend to the minimal compactifications through rational boundary maps and pullback of analytic automorphic forms. After algebraization these are finite algebraic maps for level changes and algebraic isomorphisms for translations, compatible with composition and the open immersion.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct the boundary map and compatible graded-ring pullback.
2. Use Proj and the finite/integral ring extension for finite-index arithmetic groups.
3. Compare analytifications and use proper graph algebraicity; extension is uniquely determined by the dense open. The exact general finite-extension source remains a refinement gap.

Direct inputs: [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), `ComplexComparisonPartII:C4`.

Acceptance checks:

- No claim of étaleness at the boundary.
- Reflex-field descent of these extensions belongs to V8/minimal-descent, not this complex construction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39 and Corollary 3.16 discussion, p.40; general extension proof is a gap. Supports level maps on minimal compactifications. Construct the boundary map and compatible graded-ring pullback.

Remaining refinements: [Baily–Borel primary proof decomposition](#gap-v0-4).

<a id="v3"></a>

## V3. Borel algebraicity and uniqueness

Extend maps from punctured polydisks to the minimal compactification, then algebraize their proper graphs. Borel applies to torsion-free effective targets. Algebraize translations at neat level and pass to finite quotients for other levels. The definable route has a separate target-comparison supplier and cannot certify itself.

<a id="v3-borel-extension"></a>

### Borel extension across punctured polydisks

Declaration **TauCeti.Shimura.borel_extension** (theorem), node `ShimuraVarieties:V3/borel-extension`.

Let D be Hermitian symmetric and Γ^eff a torsion-free arithmetic subgroup of Hol(D)^+. Every holomorphic map (Δ*)^r×Δ^s→Γ^eff\D extends holomorphically to Δ^{r+s}→(Γ^eff\D)^min as a map of complex analytic spaces.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the invariant metric and arithmetic cusp estimates to establish the big-Picard extension criterion, then its several-variable version (Milne 3.15, citing Borel/Kwack).
2. The extension is into the minimal compactification, not into the open quotient. Uniqueness follows from a dense open and separated analytic target.
3. The original Borel metric proof was not obtained from the public publisher endpoint; its detailed multi-variable proof is a recorded source gap.

Direct inputs: [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `ComplexComparisonPartII:C0`.

Acceptance checks:

- For a modular curve this specializes to big Picard into its compact curve.
- Torsion-free effective target is part of the statement.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 3.15, p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Borel extension theorem**.

Remaining refinements: [Borel multivariable extension proof source](#gap-v0-5).

<a id="v3-borel-algebraicity"></a>

### Borel algebraicity

Declaration **TauCeti.Shimura.borel_algebraicity** (theorem), node `ShimuraVarieties:V3/borel-algebraicity`.

For torsion-free arithmetic Γ^eff in Hol(D)^+ and a smooth finite-type C-scheme S, every holomorphic map S^an→(Γ^eff\D)^an is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Choose a smooth projective compactification with simple normal-crossing boundary from R09.7d. Its local inclusions are punctured polydisks.
2. Apply extension, glue by uniqueness, and algebraize the proper graph using C4. Restrict to S.
3. For a general smooth separated finite-type source use quasi-projective opens and scheme descent. For nonseparated source the same local gluing works whenever the holomorphic map and analytification are available.

Direct inputs: [`ShimuraVarieties:V3/borel-extension`](#v3-borel-extension), `AlgebraicModuliForArithmeticGeometry:R09.7d`, `ComplexComparisonPartII:C4`, [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel).

Acceptance checks:

- exp:C→A¹=Y(1) is a counterexample when the arithmetic target has torsion.
- The proper graph step does not by itself establish Borel for nonproper sources.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.14 and proof, pp.39–40. Supports borel algebraicity. Choose a smooth projective compactification with simple normal-crossing boundary from R09.7d. Its local inclusions are punctured polydisks.

Atlas planet: **Borel algebraicity theorem**.

Remaining refinements: [Borel multivariable extension proof source](#gap-v0-5).

<a id="v3-unique-algebraization"></a>

### Unique algebraization at neat level

Declaration **TauCeti.Shimura.unique_algebraization** (theorem), node `ShimuraVarieties:V3/unique-algebraization`.

Any two smooth finite-type C-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models owned by V8.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply Borel to the identity and inverse between the two analytic quotient descriptions.
2. Faithfulness of analytification identifies composites with identities. No arbitrary analytic automorphism is added to the chosen comparison.

Direct inputs: [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `ComplexComparisonPartII:C0`.

Acceptance checks:

- The isomorphism is unique relative to the chosen analytic comparison.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Corollary 3.16, p.40. Supports unique algebraization at neat level. Apply Borel to the identity and inverse between the two analytic quotient descriptions.

Atlas planet: **Uniqueness of algebraization**.

<a id="v3-algebraic-data-maps"></a>

### Algebraic maps of Shimura data

Declaration **TauCeti.Shimura.algebraic_data_maps** (theorem), node `ShimuraVarieties:V3/algebraic-data-maps`.

Holomorphic maps of data between neat-level analytic varieties algebraize, compatibly with levels, translations, identity and composition. An injective subdatum admits a closed immersion at sufficiently small compatible levels. These statements concern complex algebraizations; reflex-field functoriality is V8.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Borel into the neat target to algebraize the holomorphic datum map.
2. Apply the precise small-level separation theorem of Milne 5.16 for closed immersions.
3. Check functor laws after analytification, which is faithful.

Direct inputs: [`ShimuraVarieties:V1/datum-analytic-map`](#v1-datum-analytic-map), [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), [`ShimuraVarieties:V3/unique-algebraization`](#v3-unique-algebraization).

Acceptance checks:

- An inclusion can identify points at badly chosen larger level.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and 3.16, pp.58–59,40. The located passage supports algebraic maps of shimura data. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

<a id="v3-finite-quotient-algebraization"></a>

### Algebraic finite quotients and normalization

Declaration **TauCeti.Shimura.finite_quotient_algebraization** (theorem), node `ShimuraVarieties:V3/finite-quotient-algebraization`.

For neat normal K′⊂K, the finite group K/K′ acts algebraically on Sh_{K′,C}; its geometric quotient exists as a normal quasi-projective C-scheme and analytifies to Sh_K^an. Quotients through two sublevels agree via common refinement. The source at K′ is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat source algebraize translations by Borel into another neat source.
2. Import invariant affine quotients and invariant ample linearizations/finite quotients from the scheme-theoretic supplier; verify the quotient analytic comparison.
3. Normality is preserved by finite invariants; characterize normalization componentwise and use common refinement.

Direct inputs: [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V3/unique-algebraization`](#v3-unique-algebraization), `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- A quotient with stabilizers is not generally smooth or étale.
- Normalization is in the source field(s), not automatically the target field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Remark 3.13(a), p.39; neat tower p.58; finite quotient supplied by R09.3. Supports algebraic finite quotients and normalization. At neat source algebraize translations by Borel into another neat source.

Atlas planet: **Finite quotient algebraization**.

Remaining refinements: [General quasi-projective finite quotient API](#gap-v0-13).

<a id="v3-definable-target-comparison"></a>

### Definable comparison with the algebraic target

Declaration **TauCeti.Shimura.definable_target_comparison** (theorem), node `ShimuraVarieties:V3/definable-target-comparison`.

For a torsion-free effective arithmetic Hermitian quotient Γ\D and a fixed maximal compact K∞ defining its symmetric realization, the R_an,exp structure extending its corrected arithmetic R_alg structure agrees through the Baily–Borel algebraization with the definable structure induced by the C-scheme. This comparison is certified independently of Borel algebraicity.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Keep the maximal compact fixed, as required by the BKT erratum; arithmetic morphisms require its corrected Cartan compatibility.
2. Compare definable quotient charts with algebraic Baily–Borel charts using a separately established definability theorem. BKT §4.6 silently uses this agreement; it cannot be deduced from the desired algebraicity of all period maps.
3. The independent PS/KUY comparison source and its hypotheses are a precise supplier-extension gap.

Direct inputs: [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/orr-schnell-containment`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- The q=e^{2πiz} cusp comparison requires R_an,exp, not merely R_an.
- Do not assert maximal-compact-independent functoriality for arbitrary G/M.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2 and §4.6, pp.2–4,18. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Independent definable comparison and graph suppliers](#gap-v0-6).

<a id="v3-definable-borel"></a>

### Definable-graph proof of Borel algebraicity

Declaration **TauCeti.Shimura.definable_borel** (theorem), node `ShimuraVarieties:V3/definable-borel`.

For smooth quasi-projective S over C and a torsion-free effective arithmetic Hermitian quotient Y, a holomorphic S^an→Y^an is algebraic by the definable-graph argument once the independently proved algebraic-target comparison and period-map definability are supplied.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Pull back a faithful polarized homogeneous Hodge variation so the map is an actual period map; use BKT 1.3 with its hypotheses, not definability of every arbitrary holomorphic map.
2. Via the independent target comparison, the graph is both closed complex analytic and R_an,exp-definable in (S×Y)^an.
3. Apply the Peterzil–Starchenko o-minimal Chow theorem, then algebraize the graph projection. This named o-minimal theorem/period theorem is requested as a C4 Part II extension, not re-proved here.

Direct inputs: [`ShimuraVarieties:V3/definable-target-comparison`](#v3-definable-target-comparison), `ShimuraData:D3/polarized-integral-variation`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Using the arithmetic definable structure without comparison with the algebraic target leaves a gap.
- The extension proof remains an independent route and does not depend on this alternative.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §4.6, Theorems 4.12–4.13, p.18. The located passage supports definable-graph proof of borel algebraicity. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Definable Borel algebraicity**.

Remaining refinements: [Independent definable comparison and graph suppliers](#gap-v0-6).

<a id="v4"></a>

## V4. Torus models and the canonical condition

Convert Artin conventions, construct the reflex norm and its finite-level action, define the actual canonical condition and construct torus models. Special-point and Hecke density support the conditional uniqueness/descent foundations displayed after these definitions.

<a id="v4-geometric-artin"></a>

### Milne geometric Artin conversion

Declaration **TauCeti.Shimura.geometricArtin** (definition), node `ShimuraVarieties:V4/geometric-artin`.

Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.

Hypotheses:

- The supplied reciprocity homomorphism has abelian target and arithmetic Frobenius normalization.

Construction or proof:

1. Invert the arithmetic Artin homomorphism in its abelian target.
2. Preserve continuity, surjectivity and kernel; compare a local uniformizer and the cyclotomic character before applying CM reciprocity.

Direct inputs: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Uses that determine the interface:

- **V4 canonical condition:** pins the sign in σ[x,a]=[x,r_x(s)a]
- **V5 main CM theorem:** pins the Tate-module scalar normalization

Planning API:

- `TauCeti.Shimura.geometricArtin_apply` (simp): art_F(s)=rec_F(s)⁻¹.
- `TauCeti.Shimura.geometricArtin_mul` (structure): art_F(st)=art_F(s)art_F(t).
- `TauCeti.Shimura.geometricArtin_kernel` (compatibility): ker art_F=ker rec_F as closed subgroups.
- `TauCeti.Shimura.geometricArtin_norm` (functoriality): For L/F finite, art_F(N_{L/F}s)=res(art_L(s)).

Unit tests:

- `TauCeti.Shimura.geometricArtin_uniformizer` (computation): At an unramified place, art_F(π_v) is inverse arithmetic Frobenius.
- `TauCeti.Shimura.geometricArtin_one` (degenerate): art_F(1)=1.
- `TauCeti.Shimura.geometricArtin_cyclotomic` (compatibility): For u=χ_cyc(σ)∈Zhat×, art_Q(u)=σ on Q^ab; changing to rec reverses the action.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), §3, p.21, before Lemma 3.4. Supports milne geometric artin conversion. Invert the arithmetic Artin homomorphism in its abelian target.

<a id="v4-reflex-norm"></a>

### Reflex norm of a special torus

Declaration **TauCeti.Shimura.ReflexNorm** (definition), node `ShimuraVarieties:V4/reflex-norm`.

For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.
2. Check Galois invariance of the product formula and descend the morphism over Q.
3. Evaluate on restricted adelic points and prove rational-principal and level compatibility.

Direct inputs: `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.1/base-change-adelic`.

Uses that determine the interface:

- **V4 torus-model:** defines its finite Galois-set action
- **CM.2 normalized-idele-torsion-dictionary:** compares the global scalar with polarized CM lattice reciprocity

Planning API:

- `TauCeti.Shimura.ReflexNorm.apply_split` (simp): In splitting coordinates r_h(s)=∏ρ ρ(μ_h(s_ρ)).
- `TauCeti.Shimura.ReflexNorm.principal` (compatibility): For b∈E×, r_h(b)∈T(Q), hence its action on every torus double quotient is trivial.
- `TauCeti.Shimura.ReflexNorm.map` (functoriality): For a torus subdatum morphism f, after norm from a common reflex field, f∘r_h=r_{f∘h}; retain the field-change norm.
- `TauCeti.Shimura.ReflexNorm.cm_type` (compatibility): For the CM torus datum supplied by D5/cm-torus and CM.0, r_h agrees with the multiplicative reflex-type norm.
- `TauCeti.Shimura.ReflexNorm.continuous` (structure): The finite-idelic map is a continuous group homomorphism.
- `TauCeti.Shimura.ReflexNorm.ext` (extensionality): Two rational torus homomorphisms Res_{E/Q}G_m→T agreeing on the split cocharacter formula after a splitting-field base change are equal.
- `TauCeti.Shimura.ReflexNorm.mul` (simp): The reflex norm sends 1 to 1 and r_h(st)=r_h(s)r_h(t), as an algebraic group morphism and on finite ideles.

Unit tests:

- `TauCeti.Shimura.ReflexNorm.trivial` (degenerate): A trivial cocharacter gives the constant identity morphism.
- `TauCeti.Shimura.ReflexNorm.split_power` (computation): For T=G_m, E=Q and μ(t)=t^n, r_h(s)=s^n, including n=0 and negative n.
- `TauCeti.Shimura.ReflexNorm.aghmp` (compatibility): For T=Res_{E/Q}G_m/ker(N_{F/Q}) in AGHMP §3.1 and its distinguished cocharacter, r_h is the natural quotient map Res_E G_m→T.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §12, formulas (60)–(61), p.114, corrected from sums to products. Supports reflex norm of a special torus. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.

Atlas planet: **Reflex norm**.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v4-reciprocity-finite-action"></a>

### Finite-level reciprocity and idele independence

Declaration **TauCeti.Shimura.reciprocity_finite_action** (theorem), node `ShimuraVarieties:V4/reciprocity-finite-action`.

For a torus datum (T,h) and compact open K, the action of r_h(s) on the finite set T(Q)\T(A_f)/K factors continuously through Gal(E^ab/E) via art_E. Thus equal Artin lifts act identically at every level. At the full tower the natural reciprocity values lie in T(A_f)/closure(T(Q)); do not replace the closure by T(Q) without the needed additional CM norm lemma.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Principal ideles act through T(Q); infinite connected ideles are killed in the finite quotient. Continuity kills the closure of the Artin kernel.
2. Factor through the finite quotient Galois action, whose point stabilizers are open.
3. For general special points insert this torus map into the datum and pass through the double-quotient point map.

Direct inputs: [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- For torus levels, dependence only on Artin follows modulo T(Q)K; literal equality of reflex-norm ideles is unnecessary.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), §2, pp.3–4, reciprocity map and its finite-level action. The located passage supports finite-level reciprocity and idele independence. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Special-point reciprocity**.

<a id="v4-canonical-model"></a>

### Canonical-model condition

Declaration **TauCeti.Shimura.CanonicalModel** (definition), node `ShimuraVarieties:V4/canonical-model`.

A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.
2. Use reciprocity-finite-action to make the formula independent of the lift.
3. Record finite-level and compatible-tower variants and compare them via sufficiently small levels.

Direct inputs: [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), `ShimuraData:D4/special-pair`, `ShimuraData:D3/reflex-field`, [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Over`.

Uses that determine the interface:

- **V5 Siegel canonical model:** main CM theorem verifies the condition on all CM special points
- **V6 inheritance and V7 descent:** prove existence for actual data
- **V8 model-uniqueness:** uses this complete condition and adelic functoriality

Planning API:

- `TauCeti.Shimura.CanonicalModel.scheme` (projection): The underlying scheme is over Spec E(G,X), with normal/quasi-projective structure.
- `TauCeti.Shimura.CanonicalModel.comparison` (projection): The chosen comparison is an isomorphism of complex analytic spaces after base change to C.
- `TauCeti.Shimura.CanonicalModel.special_rational` (data): For every actual special pair and a, the comparison point is E(T,h)^ab-rational.
- `TauCeti.Shimura.CanonicalModel.special_action` (characterisation): Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
- `TauCeti.Shimura.CanonicalModel.level` (functoriality): A tower supplies level maps over E, with identity/composition and analytic point formula.
- `TauCeti.Shimura.CanonicalModel.baseChange` (compatibility): For E⊂L⊂C, base change retains the same comparison and restricted special-point action; the defining minimal field remains E.
- `TauCeti.Shimura.CanonicalModel.ofSpecialAction` (constructor): An E-scheme with the stated normal/quasi-projective structure, analytic comparison, special-point rationality and the full reciprocity formula defines a finite-level canonical model. Tower construction also requires compatible level maps and translations.
- `TauCeti.Shimura.CanonicalModel.hom_ext` (extensionality): Two E-morphisms between the underlying finite-level models whose complex analytic maps agree are equal, by faithful base change and analytification. This is morphism extensionality; model uniqueness remains V8.

Unit tests:

- `TauCeti.Shimura.CanonicalModel.trivial` (degenerate): The trivial datum has canonical model Spec Q with its one-point comparison.
- `TauCeti.Shimura.CanonicalModel.torus_neat` (compatibility): The finite étale torus model satisfies this condition using its constructed Galois action.
- `TauCeti.Shimura.CanonicalModel.not_arbitrary_subset` (non-example): For T=G_m, h(z)=z zbar and principal K(5), the analytic quotient has two points (Z/5Z)×/{±1}. The split model Spec Q ⊔ Spec Q with any two-point comparison passes an empty-subset test but fails canonicity: an automorphism with cyclotomic character 2 modulo 5 must interchange the two classes by reciprocity, whereas the split model fixes both.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 12.8, p.114 and Proposition 12.10, p.115. Supports canonical-model condition. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.

Atlas planet: **Canonical model**.

<a id="v4-torus-model"></a>

### Finite étale torus canonical models

Declaration **TauCeti.Shimura.torusModel** (construction), node `ShimuraVarieties:V4/torus-model`.

The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply the finite-étale-scheme/finite-continuous-Galois-set equivalence with its field/base-change comparison.
2. Use the actual finite torus double quotient as the Galois set, not just its cardinality.
3. Transport its complex point equivalence and verify all torus special-pair reciprocity maps by norm functoriality.

Direct inputs: [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Uses that determine the interface:

- **V4 functoriality:** constructs maps by finite Galois sets
- **AGHMP §3.1:** its neat CM Shimura scheme is this specific torus construction
- **V8 zero-dimensional-shimura-variety:** adds the general zero-dimensional component datum and tower reciprocity beyond singleton torus data

Planning API:

- `TauCeti.Shimura.torusModel.points` (equivalence): S_K(Qbar)≃T(Q)\T(A_f)/K as Galois sets, with the prescribed action.
- `TauCeti.Shimura.torusModel.level` (functoriality): For K′⊂K the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
- `TauCeti.Shimura.torusModel.translate` (functoriality): Right translation by a∈T(A_f) is defined over E and commutes with reciprocity.
- `TauCeti.Shimura.torusModel.map` (functoriality): A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
- `TauCeti.Shimura.torusModel.finiteEtale` (structure): The resulting scheme is finite étale over E, with degree equal to the Galois-set cardinality.
- `TauCeti.Shimura.torusModel.hom_ext` (extensionality): Two E-morphisms between finite étale torus models agreeing on all geometric points are equal under the finite-continuous-Galois-set equivalence.

Unit tests:

- `TauCeti.Shimura.torusModel.maximal_split` (computation): For T=G_m, h(z)=z zbar, K=Zhat×, E=Q, the coarse scheme is Spec Q.
- `TauCeti.Shimura.torusModel.split_level_five` (computation): For the same datum and principal K(5), the Galois set is (Z/5Z)×/{±1}; the degree-two model is Q(ζ₅+ζ₅⁻¹), not Q(ζ₅).
- `TauCeti.Shimura.torusModel.trivial` (degenerate): For the trivial torus every level gives Spec Q.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, p.416. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Torus canonical models**.

<a id="v4-aghmp-stack-comparison"></a>

### AGHMP torus stack and coarse model

Declaration **TauCeti.Shimura.aghmp_stack_comparison** (theorem), node `ShimuraVarieties:V4/aghmp-stack-comparison`.

For the specific AGHMP torus T=Res_{E/Q}G_m/ker(N_{F/Q}), distinguished cocharacter and neat normal K′⊂K, the generic CM Shimura stack is [S_{K′}/(K/K′)]. Its coarse space is S_K, independent of K′; at neat K it is the finite étale scheme above. At non-neat K retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the §3.1 computation that the reflex norm is the quotient map.
2. Construct the quotient stack through the stack supplier and compute the coarse quotient Galois set.
3. Verify common-refinement independence. Keep stabilizer data at non-neat level; the generic scheme alone cannot encode it.

Direct inputs: [`ShimuraVarieties:V4/torus-model`](#v4-torus-model), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Acceptance checks:

- For an imaginary quadratic E at maximal units, roots of unity contribute stack inertia even when the coarse scheme has one geometric point.
- Do not claim a finite DM stack for an arbitrary torus with infinite rational central-unit stabilizers.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, pp.415–416. The located passage supports aghmp torus stack and coarse model. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

<a id="v4-special-existence"></a>

### Existence and density of special points

Declaration **TauCeti.Shimura.special_existence** (theorem), node `ShimuraVarieties:V4/special-existence`.

Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in X in its real topology, hence their images are Zariski dense in each complex algebraized component.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Choose a regular semisimple Lie element in the compact-mod-centre real Cartan; approximate by a rational regular semisimple element.
2. Its rational maximal torus supports the conjugated special homomorphism. Apply the same construction near arbitrary domain points.

Direct inputs: `ShimuraData:D4/special-point`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel).

Acceptance checks:

- The rational approximant must remain regular semisimple, not merely a regular nilpotent element.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.3, p.117. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v4-hecke-density"></a>

### Density of Hecke translates

Declaration **TauCeti.Shimura.hecke_density** (theorem), node `ShimuraVarieties:V4/hecke-density`.

For any x∈X, the finite-level set {[x,a]_K:a∈G(A_f)} is Zariski dense in Sh_{K,C}. In particular the Hecke translates of a fixed actual special point are dense. This uses real approximation in G(Q)_+, not unrestricted strong approximation in G(A_f).

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.
2. Rewrite rational domain translates through the diagonal equivalence as finite-adelic Hecke translates.
3. Real analytic density implies algebraic Zariski density on each component.

Direct inputs: [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- This does not assert that each arithmetic Γ orbit in D is dense.
- The torus case says its finite Hecke orbit is the entire finite set.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.5, p.118. Supports density of hecke translates. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.

Atlas planet: **Hecke orbit density**.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v4-foundations"></a>

### Conditional foundations for canonical models

These three declarations keep their V8 identifiers and parent stage. They require actual candidate models satisfying V4; they do not assume that such models already exist for every datum. The disjoint-field lemma and scheme-theoretic descent force the field of definition, while Hecke density forces uniqueness.

<a id="v8-disjoint-special-reflex-fields"></a>

### Disjoint special reflex fields

Declaration **CanonicalModel.disjoint_special_reflex_fields** (theorem), node `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

For every pure datum D and finite extension L/E(D) in C, there is a special torus subdatum (T,h) of D such that E(T,h)/E(D) is linearly disjoint from L/E(D). The torus-reflex field is used, not the residue field of an arbitrarily chosen level point.

Hypotheses:

- G is connected reductive over Q; actual special pairs and cocharacter reflex fields are those of D3/D4.
- L/E(D) is finite.
- The schematic Lean field form uses an index of actual special-torus reflex fields; the missing datum/special-pair predicate must be restored, so it cannot select an arbitrary disjoint intermediate field.

Construction or proof:

1. Use Deligne 5.1: over the regular-semisimple open V in Lie(G), the incidence variety W of maximal tori, cocharacters in the datum class, and regular Lie elements maps finite étale surjectively to V and to Spec E(D).
2. Connected centralizers and conjugacy of maximal tori give geometrically irreducible fibres over E(D). The nonempty real open U of tori compact modulo the centre supplies special homomorphisms in X.
3. Apply Hilbert irreducibility with a real-open condition and linear-disjointness avoidance to W after base change to L. Its specialized cocharacter field contains the reflex field of the resulting torus datum; subextensions retain linear disjointness.

Direct inputs: `ShimuraData:D4/shimura-datum`, `ShimuraData:D3/reflex-field`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `mathlib:IntermediateField.LinearDisjoint`.

Acceptance checks:

- For GL2, take an imaginary quadratic field Q(sqrt(-p)) with p an odd prime unramified in L; ramification at p excludes its inclusion in L.
- Do not infer the field-disjointness theorem from mere density of special points.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 13.4, p.118. States the special-reflex-field lemma.

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1, 5.1.2, 5.1.3, pp.153–155 (page images checked). Incidence cover, connected-fibre argument and real-open Hilbert specialization.

<a id="v8-translation-descent"></a>

### Hecke translation over the reflex field

Declaration **CanonicalModel.translation_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/translation-descent`.

If g in G(A_f) and g^{-1}Kg is contained in L, the complex morphism T_g:[x,a]_K -> [x,ag]_L descends uniquely to an E-morphism M_K -> M_L. This is a conditional functoriality theorem for actual canonical models, with no general existence assumption.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- K,L are compact open and g^{-1}Kg is contained in L.

Construction or proof:

1. V1 gives the analytic map and V3 its algebraicity over C. For a special pair (T,h), V4 gives sigma[h,a]=[h,r_h(s)a] for sigma fixing E(T,h). Left multiplication r_h(s) commutes with right multiplication g.
2. V4 density of all Hecke translates of h identifies T_g with its sigma-conjugate as algebraic maps (source reduced, target separated).
3. First descend through Aut(C/E(T,h)) for one special pair: this gives a finite algebraic field of definition of T_g, rather than assuming every complex morphism has one. Apply disjoint-special-reflex-fields to its finite normal closure over E. Descent through the second fixing subgroup and linear disjointness force the map to be defined over E; faithful base change gives uniqueness.

Direct inputs: [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For g=1 and K contained in L this is the forgetful level map.
- For L=g^{-1}Kg this is an isomorphism, with inverse T_{g^{-1}}.
- The inclusion direction must be tested on a changed representative ak: k g=g(g^{-1}kg).

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 13.6, pp.118–119. Reciprocity, dense translates and disjoint reflex fields prove descent.

Atlas planet: **Hecke translations over the reflex field**.

<a id="v8-model-uniqueness"></a>

### Uniqueness of canonical models

Declaration **CanonicalModel.unique_iso** (theorem), node `ShimuraVarieties:V8/model-uniqueness`.

Two canonical E-models of the same finite-level Shimura variety have a unique E-isomorphism inducing their specified comparison over C. These isomorphisms commute with all descended level and translation maps.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. Repeat translation-descent with g=1, K=L and the two distinct specified model comparisons; the same special-pair action makes the complex identity descend.
2. Descend its inverse and verify the inverse identities by faithful base change. Naturality follows by comparing after C-base change.

Direct inputs: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- An arbitrary automorphism of an E-scheme is not the specified unique comparison.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 13.7(a), p.119. Uniqueness includes the fixed complex model identification.

<a id="v5"></a>

## V5. CM abelian varieties and Siegel existence

Algebraize polarized weight-one families through moduli and Borel. Spread full CM objects to number fields, prove potentially good reduction using semistable square-zero inertia and the reduced CM algebra, calculate Frobenius and pass from ideal reciprocity to the normalized idelic theorem. Polarization and level transport verify the Siegel canonical condition.

<a id="v5-weight-one-algebraization"></a>

### Algebraization of polarized weight-one variations

Declaration **TauCeti.Shimura.weight_one_algebraization** (theorem), node `ShimuraVarieties:V5/weight-one-algebraization`.

Over a smooth finite-type C-scheme S, the relative analytic equivalence between polarized abelian families and polarizable integral variations of homological types (−1,0),(0,−1) algebraizes: every such variation gives an abelian scheme, and morphisms correspond to morphisms of variations. Polarization type and actual integral level are retained.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.
2. Borel algebraizes its classifying map into the neat arithmetic quotient. Pull back the universal abelian scheme and descend through the level cover.
3. Algebraize homomorphisms via the relative moduli/rigidity and proper comparison, not a claim that all holomorphic functions on S are algebraic.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A5`, `PELModuli:M3`, [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), `AbelianSchemesAndArithmeticModuli:A3`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Homology conventions are (−1,0),(0,−1); the cohomological dual is not identified without dualization.
- Do not assume PEL M4 canonical models to prove the Siegel model.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.8, p.122; algebraization through M3 and V3. Supports algebraization of polarized weight-one variations. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.

Atlas planet: **Weight-one algebraization**.

<a id="v5-cm-abelian-variety"></a>

### CM abelian varieties with their algebra action

Declaration **TauCeti.Shimura.CMAbelianVariety** (definition), node `ShimuraVarieties:V5/cm-abelian-variety`.

For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.
2. Identify the eigenspaces through A5 and apply CM.0 type definitions.
3. Use Rosati positivity for the polarization compatibility; do not build a new CM-type carrier here.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A2`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`.

Uses that determine the interface:

- **V5 main theorem:** its actual E-linear Tate representation is compared with reflex reciprocity
- **V5 Siegel-special-CM:** tests every special point of the Siegel datum
- **CM.2 arbitrary-dimensional-classification:** imports the full general CM reciprocity theorem

Planning API:

- `TauCeti.Shimura.CMAbelianVariety.action` (data): The injective E-action on the actual abelian variety is part of the data.
- `TauCeti.Shimura.CMAbelianVariety.type` (projection): The type is the subset of embeddings appearing in Lie(A), using the imported CM.0 definition.
- `TauCeti.Shimura.CMAbelianVariety.homology` (compatibility): H₁(A,Q) is free of rank one over E, with eigenspace decomposition Φ in Lie(A).
- `TauCeti.Shimura.CMAbelianVariety.transport` (functoriality): An E-linear quasi-isogeny transports the full action and type; identity/composition hold.
- `TauCeti.Shimura.CMAbelianVariety.rosati` (characterisation): A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.
- `TauCeti.Shimura.CMAbelianVariety.ofAction` (constructor): An actual abelian variety with an injective CM-algebra action of dimension 2 dim A supplies the full CM object and its Lie type; a compatible polarization is included when Rosati data are requested.
- `TauCeti.Shimura.CMAbelianVariety.hom_ext` (extensionality): Two E-linear quasi-homomorphisms between full CM objects agreeing on H₁(-,Q), or on a rational Tate module after comparison, are equal.

Unit tests:

- `TauCeti.Shimura.CMAbelianVariety.quadratic` (computation): An elliptic curve with an imaginary quadratic embedding in End⁰ has a full CM action of degree two.
- `TauCeti.Shimura.CMAbelianVariety.product` (compatibility): The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
- `TauCeti.Shimura.CMAbelianVariety.insufficient_degree` (non-example): A scalar Q-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, p.123; field case §10. Supports cm abelian varieties with their algebra action. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.

Atlas planet: **CM abelian varieties**.

<a id="v5-cm-tate-rank-one"></a>

### Rank-one rational CM Tate module

Declaration **TauCeti.Shimura.cm_tate_rank_one** (theorem), node `ShimuraVarieties:V5/cm-tate-rank-one`.

For a full CM action (A,E), V_fA is free of rank one over E⊗_Q A_f, compatibly with H₁(A,Q)⊗A_f and with quasi-isogenies. If End(A)∩E=O_E, T_ℓA is free of rank one over O_E⊗Z_ℓ. For a nonmaximal order only the rational freeness is asserted without additional integral hypotheses. Quasi-isogenies act faithfully on V_fA.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.
2. At maximal order the integral lattice is locally an invertible O_E-module, yielding integral freeness.
3. Use injectivity of rational Hom on Tate modules for uniqueness of a quasi-isogeny.

Direct inputs: [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- The rational rank statement includes product CM algebras.
- An integral rank-one claim over an arbitrary nonmaximal order needs an invertible lattice hypothesis.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison 2007c §1.7. Supports rank-one rational cm tate module. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.

<a id="v5-cm-number-field-model"></a>

### Number-field models for full CM objects

Declaration **TauCeti.Shimura.cm_number_field_model** (theorem), node `ShimuraVarieties:V5/cm-number-field-model`.

A full CM abelian variety over C, with its finitely specified endomorphisms, polarization and finite level, admits a model over a number field after replacing its base by a finite extension. This establishes that CM reduction and arithmetic Frobenius arguments apply to actual complex points.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.
2. Extend the field to define the action/polarization/level. Do not assert that every arbitrary complex abelian variety has a number-field model.
3. The detailed CM moduli rigidity/descent proof is a specific source refinement, separated from the main theorem.

Direct inputs: [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), `PELModuli:M3`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/trace-reflex-field`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The field must define the CM action before the Galois representation is scalar E-linear.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.3 and proof, pp.100–101. Supports number-field models for full cm objects. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.

Remaining refinements: [Full CM spreading and specialization inputs](#gap-v0-7).

<a id="v5-cm-potential-good-reduction"></a>

### Potential good reduction for CM varieties

Declaration **TauCeti.Shimura.cm_potential_good_reduction** (theorem), node `ShimuraVarieties:V5/cm-potential-good-reduction`.

A full CM abelian variety over a number field has potentially good reduction at every finite place. With all E-endomorphisms defined, the inertia image on V_ℓA is finite for ℓ different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. First pass to a number field over which all E-endomorphisms are defined. At the chosen finite place apply R11.3/finite-separable-semistable-extension to acquire semistable reduction.
2. By R11.3/inertia-square-zero, (ρ_ℓ(σ)−1)²=0 for inertia after that extension, with ℓ different from the residue characteristic. By rank-one E-linearity, ρ_ℓ(σ) lies in the commutative finite étale algebra E⊗Q_ℓ, which is reduced. Thus ρ_ℓ(σ)=1. Equivalently its multiplication action is both semisimple and unipotent.
3. Apply R11.5/neron-ogg-shafarevich to get good reduction. The original inertia image is finite since an open inertia subgroup is killed. The extension can be chosen over the number field: the excellent DVR supplier applies to the local number-field ring, or realize a completion extension by Krasner.
4. Compactness and the Rosati norm constraint alone do not imply finite inertia. In particular, absolute local inertia is not virtually pro-p; the source error is recorded as E9.

Direct inputs: [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero`.

Acceptance checks:

- This is potential good reduction, not good reduction over the original field.
- The proof is valid in higher dimension.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 and proof, p.101. Proposition 10.5 states potential good reduction. Its absolute-inertia pro-p argument is corrected here via the existing semistable-reduction and inertia suppliers; see E9 and E11.

Source: [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Theorem 4.2, p.9; Remark 5.6, p.18; Proposition 6.5, pp.23–24. After finite separable extension inertia acts unipotently of height at most two. Rank-one multiplication in E⊗Q_ℓ is semisimple, forcing this inertia action to be trivial.

Atlas planet: **Potential good CM reduction**.

<a id="v5-cm-frobenius"></a>

### CM Frobenius endomorphism

Declaration **TauCeti.Shimura.cm_frobenius** (theorem), node `ShimuraVarieties:V5/cm-frobenius`.

Let A/k have full CM by O_E with the action defined over k, let k/Q be Galois containing all conjugates of E, and let P be a good reduction prime of residue cardinality q. The q-power Frobenius of the reduction is represented by π∈O_E under the specialized CM action, with ππbar=q for a compatible polarization.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Specialize the endomorphism action; the good-reduction Tate comparison identifies Frobenius with an E-linear scalar.
2. The full CM centralizer, endomorphism comparison and integrality place the scalar in O_E; the detailed positive-characteristic Hom comparison is a supplier request, not a rank-one linear-algebra shortcut.
3. Polarization identifies the conjugate product with q.

Direct inputs: [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V5/cm-potential-good-reduction`](#v5-cm-potential-good-reduction), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- The Frobenius is arithmetic q-power on the reduction; V4 art is its inverse on Galois reciprocity.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 10.9 and proof, p.103. Supports cm frobenius endomorphism. Specialize the endomorphism action; the good-reduction Tate comparison identifies Frobenius with an E-linear scalar.

Remaining refinements: [Full CM spreading and specialization inputs](#gap-v0-7).

<a id="v5-shimura-taniyama"></a>

### Shimura–Taniyama Frobenius calculation

Declaration **TauCeti.Shimura.shimura_taniyama** (theorem), node `ShimuraVarieties:V5/shimura-taniyama`.

Under the preceding good-reduction/maximal-order/Galois-field hypotheses, for every v|p put H_v={φ:E→k:φ⁻¹P=v}. The Frobenius π satisfies ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Equivalently the principal ideal (π) is the product over φ∈Φ of φ⁻¹(N_{k/φE}P), and agrees with the reflex norm of N_{k/E*}P. State the ramified-prime formula using normalized valuations; the clean unramified ideal proof suffices for the subsequent prime-generation argument.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).
2. Use type counting to identify the valuation at each CM prime.
3. Translate the product ideal through the reflex norm. For product algebras use the torus norm; the field reflex-type formula alone is not a product reflex type.

Direct inputs: [`ShimuraVarieties:V5/cm-frobenius`](#v5-cm-frobenius), `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`, [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), `AbelianSchemesAndArithmeticModuli:A4`.

Acceptance checks:

- For CM elliptic curves an inert prime has slope 1/2; a split prime has slopes 0 and 1.
- Valuations are normalized ratios, not a raw count independent of ramification.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 10.10, p.103 and proof pp.104–105; 2007c Theorem 2.1. Supports shimura–taniyama frobenius calculation. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).

Atlas planet: **Shimura–Taniyama formula**.

Remaining refinements: [Full CM spreading and specialization inputs](#gap-v0-7).

<a id="v5-cm-ideal-reciprocity"></a>

### CM ideal reciprocity with prime generation

Declaration **TauCeti.Shimura.cm_ideal_reciprocity** (theorem), node `ShimuraVarieties:V5/cm-ideal-reciprocity`.

For A/C with CM by O_E and type Φ, integer m>0 and σ fixing E*, there is an ideal multiplication α:A→σA acting as σ on A[m]. Its ray ideal class is determined by σ on a sufficiently divisible reflex ray class field and is the reflex-norm ideal class of an ideal b whose arithmetic Artin symbol is σ. This ideal statement uses arithmetic Artin; V5/main-CM converts to geometric art for ideles.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Same type gives an E-linear quasi-isogeny. Approximate its scalar at the finitely many primes dividing m to make it agree with σ on m-torsion.
2. Compose ideal multiplications to obtain a finite ray-class homomorphism; prove its continuity via finite torsion and a model field.
3. At almost every suitable good unramified prime use Shimura–Taniyama. Dirichlet/Chebotarev prime generation of ray classes extends equality to every class.

Direct inputs: [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/shimura-taniyama`](#v5-shimura-taniyama), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`.

Acceptance checks:

- Equality only on a few Frobenius elements is insufficient; excluded primes form a finite set and remaining primes generate every ray class.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.2, pp.19–20. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

<a id="v5-main-cm"></a>

### Main theorem of complex multiplication

Declaration **TauCeti.Shimura.main_cm** (theorem), node `ShimuraVarieties:V5/main-cm`.

Let (A,i:E→End⁰A) be full CM over C, allowing a CM product algebra, with type Φ and reflex field E*. For σ∈Aut(C/E*) and a finite idele s∈A_{f,E*}× with art_{E*}(s)=σ|E*ab, there is a unique E-linear quasi-isogeny α:A→σA satisfying α(r_Φ(s)x)=σx for every x∈V_fA. If s′ has the same Artin image and r_Φ(s′)=a r_Φ(s), a∈E×, replace α by α∘a⁻¹. The existence of this a is proved by the norm-kernel lemmas in the CM setting, not asserted for arbitrary tori.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Reduce by an E-linear quasi-isogeny to maximal integral order. Choose an E-linear comparison with σA and extract its rank-one Tate scalar η(σ).
2. The ideal theorem identifies η(σ)/r_Φ(s) modulo every finite torsion level. The conjugation/norm-one condition removes the residual closure ambiguity (2007c 3.6–3.12), using the norm local-global theorem.
3. Faithfulness on the rational Tate module gives uniqueness. Transport back through the chosen E-isogeny.

Direct inputs: [`ShimuraVarieties:V5/cm-ideal-reciprocity`](#v5-cm-ideal-reciprocity), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- The quasi-isogeny is unique for a fixed s; changing s changes the quasi-isogeny.
- σ is required to fix the reflex field, not necessarily the CM field itself as an embedded subfield.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Main theorem of complex multiplication**.

Remaining refinements: [CM norm-kernel inputs](#gap-v0-16).

<a id="v5-cm-polarization-level"></a>

### Polarization and level in CM reciprocity

Declaration **TauCeti.Shimura.cm_polarization_level** (theorem), node `ShimuraVarieties:V5/cm-polarization-level`.

For α from the main CM theorem and a compatible polarization form ψ with Rosati conjugation, ψ_{σA}(αx,αy)=c ψ_A(x,y) where c=χ_cyc(σ)/N_{E*/Q}(s)∈Q_{>0}. The actual Tate twist in ψ:A_f×A_f→A_f(1) is retained. For an adelic symplectic level representative, σ transport equals the reflex-norm action modulo the chosen level and the E-linear quasi-isogeny.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use ψ_{σA}(σx,σy)=χ_cyc(σ)ψ_A(x,y), Rosati conjugation and r_Φ(s)r_Φ(s)bar=N_{E*/Q}(s).
2. Class field theory identifies the quotient scalar as a positive rational number.
3. Apply the formula to the actual symplectic Tate trivialization and its K-orbit, not a raw matrix without the quasi-isogeny equivalence.

Direct inputs: [`ShimuraVarieties:V5/main-cm`](#v5-main-cm), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2`, [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin).

Acceptance checks:

- The similitude factor is χ/N, not N/χ in this α convention.
- An equality of unpolarized CM isogeny classes does not by itself prove the Siegel canonical condition.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(c), pp.22–23. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

<a id="v5-siegel-special-cm"></a>

### Siegel special points are full CM

Declaration **TauCeti.Shimura.siegel_special_cm** (theorem), node `ShimuraVarieties:V5/siegel-special-cm`.

For the Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree 2g. Products are included, so all special points rather than only simple CM fields are covered.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.
2. By complete reducibility and positive Rosati involution, a torus Mumford–Tate action gives a full CM algebra in the endomorphisms. Conversely a full CM algebra forces a torus Hodge image.

Direct inputs: [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), `ShimuraData:D5/siegel-datum`, `ShimuraData:D4/special-point`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- A product of CM elliptic curves is included.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124. Supports siegel special points are full cm. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.

<a id="v5-siegel-canonical"></a>

### The Siegel canonical model

Declaration **TauCeti.Shimura.siegel_canonical** (theorem), node `ShimuraVarieties:V5/siegel-canonical`.

The rational polarized Siegel moduli model with the actual adelic symplectic level is a canonical model over the Siegel reflex field Q. Its complex uniformization is the V1/V3 Siegel variety; for every actual special point its Galois action is precisely V4 reciprocity, including polarization, quasi-isogeny and level.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.
2. For every special point use the product-algebra CM criterion and main theorem to identify Galois transport of the represented polarized level object.
3. Compare its scalar action with the special-pair cocharacter reflex norm. Extend to all levels via finite quotients.

Direct inputs: [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), [`ShimuraVarieties:V5/siegel-special-cm`](#v5-siegel-special-cm), [`ShimuraVarieties:V5/cm-polarization-level`](#v5-cm-polarization-level), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), `PELModuli:M3`, `ShimuraData:D5/siegel-reflex-dual`.

Acceptance checks:

- This is a constructed instance, not a typeclass assumption that a model exists.
- The genus-one determinant/Weil-pairing identification at full level is exported to V8.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.12 and existence proof, pp.125–126. Supports the siegel canonical model. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.

Atlas planet: **Siegel canonical model**.

<a id="v6"></a>

## V6. Hodge and abelian type

Descend the small-level image of a subdatum by special reciprocity and density; obtain Hodge type from Siegel. For abelian type retain the connected completed symmetry, descend central isogenies and reconstruct full components with their target reflex-field action.

<a id="v6-hodge-inheritance"></a>

### Inheritance by Shimura subdata

Declaration **TauCeti.Shimura.hodge_inheritance** (theorem), node `ShimuraVarieties:V6/hodge-inheritance`.

If i:(G,X)↪(H,Y) is a Shimura subdatum and (H,Y) has a canonical tower, then (G,X) has a canonical tower over E(G,X), whose suitable neat levels embed into the ambient tower after base change to a common reflex field. Descent of the image to E(G,X) is proved using actual special points and their reciprocity, not by claiming every C-subvariety of a model descends.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the small-level closed-immersion theorem and transport the ambient Galois action on special points.
2. Field-disjoint special reflex fields and Hecke density establish invariance and the unique descent maps for the image.
3. Apply effective quasi-projective descent with continuity supplied by the finite orbit argument; construct all levels and verify reciprocity.

Direct inputs: [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/special-existence`](#v4-special-existence), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- Same derived group alone does not identify full Shimura varieties.
- No absolute-Hodge tensors are assumed in this bare-existence route.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports inheritance by shimura subdata. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Canonical-model inheritance**.

<a id="v6-hodge-canonical"></a>

### Canonical models of Hodge type

Declaration **TauCeti.Shimura.hodge_canonical** (theorem), node `ShimuraVarieties:V6/hodge-canonical`.

Every Hodge-type datum of D4 has a canonical tower over its reflex field, by choosing its actual embedding into a Siegel datum, applying Siegel existence and subdatum inheritance. The resulting tower is independent of the embedding through canonical-model uniqueness.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Choose the symplectic embedding supplied by the definition of Hodge type.
2. Apply hodge-inheritance to the constructed Siegel model.
3. Use V8 uniqueness only after both candidate models satisfy the full V4 condition; its foundational dependencies are checked to avoid a cycle.

Direct inputs: `ShimuraData:D4/hodge-type`, [`ShimuraVarieties:V5/siegel-canonical`](#v5-siegel-canonical), [`ShimuraVarieties:V6/hodge-inheritance`](#v6-hodge-inheritance), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness).

Acceptance checks:

- No new Hodge-type definition is introduced.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports canonical models of hodge type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Hodge-type canonical models**.

<a id="v6-connected-tower"></a>

### Connected Shimura tower with completed symmetry

Declaration **TauCeti.Shimura.ConnectedTower** (construction), node `ShimuraVarieties:V6/connected-tower`.

For the connected derived datum (G^der,X⁺), whose points are S→G^ad_R and are not required to lift to G^der_R, form the analytic pro-object M⁰=(Γ\X⁺)_Γ and its inverse-limit point set over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Construct the congruence-indexed inverse system and its compatible symmetry, as in the 1983 appendix.
2. Use the Deligne completed-symmetry construction to define the connected canonical datum with actual Galois compatibility. Its exact extension/coherence source must be checked separately, recorded as a gap.

Direct inputs: [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/adjoint-datum`.

Uses that determine the interface:

- **V6 connected-full-equivalence:** the completed/Galois symmetry reconstructs all components
- **Milne 1983 §§1–6:** the conjugation proof is carried out on this connected pro-object

Planning API:

- `TauCeti.Shimura.ConnectedTower.level` (projection): The Γ-level is the actual algebraized quotient Γ\X⁺.
- `TauCeti.Shimura.ConnectedTower.transition` (functoriality): Subgroup inclusion gives finite algebraic maps; identity and composition hold.
- `TauCeti.Shimura.ConnectedTower.completedAction` (structure): The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
- `TauCeti.Shimura.ConnectedTower.canonicalExtension` (data): The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.
- `TauCeti.Shimura.ConnectedTower.hom_ext` (extensionality): Two morphisms of the congruence-indexed tower diagrams agreeing at each finite level are equal; canonical morphisms additionally commute with the specified completion/Galois extension.
- `TauCeti.Shimura.ConnectedTower.lift` (universal-property): Compatible holomorphic maps from a test complex analytic space Y to every finite Γ\X⁺ quotient give a unique morphism from the constant pro-object Y to the analytic tower; projections recover those maps. The algebraic tower has the analogous compatible-morphism universal property in its pro-category. No finite-dimensional analytic-space structure is asserted on the inverse-limit point set.

Unit tests:

- `TauCeti.Shimura.ConnectedTower.trivial` (degenerate): A trivial derived group gives the one-point connected tower.
- `TauCeti.Shimura.ConnectedTower.sl2` (compatibility): For the GL₂ datum the connected tower is the congruence tower Γ\ℍ induced by SL₂, with effective ±I removed where present.
- `TauCeti.Shimura.ConnectedTower.not_full` (non-example): A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127; 1983 Appendix, p.263. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Connected Shimura tower**.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8).

<a id="v6-connected-full-equivalence"></a>

### Connected and full canonical formulations

Declaration **TauCeti.Shimura.connected_full_equivalence** (theorem), node `ShimuraVarieties:V6/connected-full-equivalence`.

A pure Shimura datum admits a full canonical model over E(G,X) if and only if its connected derived tower admits the connected canonical structure with completed adelic/Galois symmetry of V6/connected-tower. The comparison reconstructs finite components and their reciprocity, preserving the completion action; forgetting this symmetry invalidates the equivalence.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Deligne 2.7.13/Milne 14.15 to restrict and reconstruct the components with the extension action.
2. Check the Artin action on component classes and the stabilizing completion subgroup.
3. The precise connected extension and gluing formulas remain a primary-source refinement, explicitly shared with connected-tower.

Direct inputs: [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), [`ShimuraVarieties:V4/torus-model`](#v4-torus-model), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model).

Acceptance checks:

- The assertion is not an isomorphism between connected and full varieties.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127. The located passage supports connected and full canonical formulations. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8).

<a id="v6-connected-products"></a>

### Products of connected canonical models

Declaration **TauCeti.Shimura.connected_products** (theorem), node `ShimuraVarieties:V6/connected-products`.

The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Take product inverse systems and product level quotients.
2. Use reflex-norm functoriality to compare marked tori and the Galois extension.
3. Apply compatible finite-component descent where the full datum is reconstructed.

Direct inputs: [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), `ShimuraData:D4/product-datum`.

Acceptance checks:

- Product datum reflex field is the compositum, not necessarily either individual field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(a), p.127. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8).

<a id="v6-central-isogeny-descent"></a>

### Central-isogeny descent of connected models

Declaration **TauCeti.Shimura.central_isogeny_descent** (theorem), node `ShimuraVarieties:V6/central-isogeny-descent`.

For a central isogeny f:G₁→G₂ of semisimple derived groups with compatible connected data and a connected canonical model of (G₁,X₁⁺), the connected tower for (G₂,X₂⁺) is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be G₁, correcting the repeated G₂ misprint.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Compute the map of completed adjoint rational symmetry and its kernel; finite-level images act on the source quotient.
2. Construct the effective finite algebraic quotients and descend their Galois symmetry.
3. Verify reciprocity by central-isogeny compatibility of the cocharacter norm; compare the inverse systems.
4. Central isogenies identify the adjoint groups and hence the S-maps of connected data; no algebraic lift S→G₁ is required. D4/central-isogeny-lift only treats a given lift of a full datum and does not supply such an existence assertion.

Direct inputs: [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- This gives a quotient, not an identification of full varieties with the same derived group.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127. The located passage supports central-isogeny descent of connected models. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Central-isogeny descent**.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8).

<a id="v6-abelian-canonical"></a>

### Canonical models of abelian type

Declaration **TauCeti.Shimura.abelian_canonical** (theorem), node `ShimuraVarieties:V6/abelian-canonical`.

Every abelian-type datum as defined in D4 admits a canonical tower over its reflex field. Use the Hodge-type witness, products and central-isogeny descent for the connected derived datum, then connected-full-equivalence. The full components and reflex-field action are reconstructed rather than identified with those of the Hodge-type witness.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply the actual abelian-type central-isogeny relation to the derived connected data.
2. Descend the Hodge-type connected model through its completion kernel; reconstruct the target full tower.
3. Check V4 on all special pairs and use uniqueness to remove witness choices.

Direct inputs: `ShimuraData:D4/abelian-type`, [`ShimuraVarieties:V6/hodge-canonical`](#v6-hodge-canonical), [`ShimuraVarieties:V6/connected-products`](#v6-connected-products), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence).

Acceptance checks:

- This branch does not depend on V7 general-data conjugation.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §14, pp.127–128. The located passage supports canonical models of abelian type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Abelian-type canonical models**.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8).

<a id="v7"></a>

## V7. General data: conjugation and descent

Separate weak conjugation, identification by a marked special torus, completed equivariance, independence of the marking, the cocycle and its continuity. Totally real CM-splitting extensions and A₁ comparisons identify the marked twist. Kazhdan/rigidity and the exceptional central adjustment remain explicit proof refinements. Finite rigidifying special points permit effective descent only after continuity.

<a id="v7-simple-connected-reduction"></a>

### Reduction to simple simply connected data

Declaration **TauCeti.Shimura.simple_connected_reduction** (theorem), node `ShimuraVarieties:V7/simple-connected-reduction`.

To prove general canonical-model existence it suffices to prove marked conjugation with completed symmetry for connected data whose group is semisimple simply connected and almost Q-simple. Such a group is Res_{F/Q}G′ for a totally real number field F and an absolutely almost simple simply connected F-group G′. Products, the derived central cover and V6 reconstruction then restore the original reductive datum.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the classification of Q-simple semisimple groups as restrictions of scalars and the real Cartan condition to force F totally real.
2. Separate the central torus/component reconstruction from the semisimple conjugation assertion.
3. Use product and central-isogeny descent only with their completed symmetry; do not identify full data by derived groups.

Direct inputs: [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence), [`ShimuraVarieties:V6/connected-products`](#v6-connected-products), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), `ShimuraData:D4/shimura-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`.

Acceptance checks:

- Exceptional Hermitian E₆/E₇ factors remain in scope.
- No Langlands conjugation theorem is imported as an established prerequisite.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 7.1, p.262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Simple connected reduction**.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v7-auxiliary-cm-splitting"></a>

### Auxiliary totally real splitting extension

Declaration **TauCeti.Shimura.auxiliary_cm_splitting** (theorem), node `ShimuraVarieties:V7/auxiliary-cm-splitting`.

For the simple connected case and a maximal torus T′⊂G′ whose adjoint image contains the marked S-map, choose a finite totally real extension F′/F such that the base-changed torus splits over a CM quadratic extension L′/F′. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. The adjoint special torus is compact at every real place by the Cartan condition; since G′ is semisimple, its preimage T′ is also compact. Complex conjugation acts as −1 on its character lattice at every real embedding. In a finite Galois splitting field this involution is central, so the splitting field is CM; take a totally real extension containing its maximal real subfield, making the compositum quadratic CM.
2. Construct the diagonal inclusion into Res_{F′/Q}(G′_{F′}) with the induced components.
3. Apply the subgroup comparison principle of Milne 1.6 and §6.4. Compatibility and choice independence are checked in the marked comparison.

Direct inputs: [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`, [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- The extension need not be chosen canonically.
- Its purpose is splitting the special torus, not turning an exceptional group into abelian type.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, p.253; §6, pp.260–262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v7-rank-one-subdata"></a>

### Root subdata of type A₁

Declaration **TauCeti.Shimura.rank_one_subdata** (theorem), node `ShimuraVarieties:V7/rank-one-subdata`.

Assume T′ splits over a CM quadratic L/F. For each root α of (G′,T′) noncompact at some real place, the Lie algebra Lie(T′)⊕g_α⊕g_{−α} descends to a reductive F-subgroup H′_α containing T′, whose derived group has type A₁. Res_{F/Q}H′_α has an induced adjoint S-map obtained by projecting h through T^ad→(H′_α)^ad. After taking the simply connected cover of its derived group and removing compact ineffective factors it gives the required connected rank-one subdatum. No lift of h to that cover is required.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. The quadratic CM involution exchanges α and −α, so the displayed Lie algebra is stable under Gal(L/F).
2. Construct the reductive subgroup generated by T′ and the ±α root groups and descend it by quadratic Galois stability. Project the marked S-map to its adjoint group, then verify Hodge types and the Cartan condition. The semisimple cover carries the same adjoint S-map; do not use a full-datum lift existence assertion.
3. Use the A₁ symplectic realization and V5/V6 to prove its marked conjugation comparison from CM, not just canonical-model existence. The precise A₁ comparison bridge is an explicit refinement gap.

Direct inputs: [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, [`ShimuraVarieties:V6/abelian-canonical`](#v6-abelian-canonical), `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- A root may be compact at some places and noncompact at another.
- No claim that arbitrary A₁ subgroups generate G^ad(Q)^+.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, pp.253–254; Remark 1.5, p.242. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Rank-one Shimura subdata**.

Remaining refinements: [A₁ comparison and completion density](#gap-v0-12).

<a id="v7-rank-one-central-separation"></a>

### Central separation by noncompact roots

Declaration **TauCeti.Shimura.rank_one_central_separation** (theorem), node `ShimuraVarieties:V7/rank-one-central-separation`.

In the CM-split simple case, let Z_α=Z(H_α), with α ranging over roots noncompact at some real place. Then Z(G)=∩_α Z_α. Put Tbar=T/Z(G) and Zbar_α=Z_α/Z(G). Regard Zbar_α(A_f)/Zbar_α(Q) as subgroups of the abelian quotient Tbar(A_f)/Tbar(Q); their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use irreducibility of the absolute root system and Galois action to show the relevant noncompact roots span the root lattice as required by Proposition 4.3.
2. Compute each subgroup centre by vanishing of its root characters.
3. Apply Corollary 4.4 to their adelic intersections with the rational quotient retained.

Direct inputs: [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- The claim is the explicit centre intersection, not a stronger rational-generation theorem.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 4.3 and Corollary 4.4, p.254. Corollary 4.4 places the intersection in Tbar(A_f)/Tbar(Q), an abelian quotient; no quotient group by a nonnormal subgroup of an adjoint group is used.

Remaining refinements: [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v7-conjugated-datum"></a>

### Marked conjugated Shimura datum

Declaration **TauCeti.Shimura.conjugatedDatum** (construction), node `ShimuraVarieties:V7/conjugated-datum`.

Let G/Q be semisimple simply connected with connected datum X⁺, a G^ad(R)^+-class of h:S→G^ad_R satisfying the connected Shimura conditions. Choose a maximal rational torus T⊂G with h factoring through T^ad=T/Z(G); this is a D4 special pair for the adjoint datum. For τ∈Aut(C), the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1 supplies the Serre-protorus torsor S_τ and its distinguished finite-adelic point. The marked cocharacter μ_h is in X_*(T^ad), and gives ρ_h:S→T^ad. Use this inner action to form {}^{τ,h}G=S_τ×^S G. T is unchanged, {}^τh:S→({}^{τ,h}G)^ad_R factors through T^ad with cocharacter τμ_h, and {}^{τ,h}X⁺ is its connected adjoint real class. Retain the distinguished topological isomorphism G(A_f)≅{}^{τ,h}G(A_f). This construction is of connected data, not a full pure datum on the simply connected group.

Hypotheses:

- G is semisimple simply connected over Q; h:S→G^ad_R lies in X⁺ with the Appendix (C1)–(C3) conditions. The maximal special torus is read in the adjoint datum and pulled back to G. No lift h:S→G_R is assumed.

Construction or proof:

1. Construct the Serre/Taniyama extension and its finite-adelic splitting from the corrected reciprocity class formation; this missing common CM supplier is explicitly requested and recorded as a gap.
2. Form the contracted product for ρ_h:S→T^ad acting by conjugation. The pulled-back maximal torus T is unchanged because this action on T is trivial.
3. Descend τμ_h in T^ad to {}^τh:S→({}^{τ,h}G)^ad_R and verify the connected Shimura conditions. Compute the finite-local trivializations and the real class τμ_h(−1)/μ_h(−1) in H¹(R,T^ad); do not demand an S-map into the simply connected cover.

Direct inputs: [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraData:D4/adjoint-datum`, [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower).

Uses that determine the interface:

- **Milne 1983 Theorem 1.1:** the marked target of the comparison is this actual inner form
- **V7 special-independence:** compares twists obtained from two special tori
- **V7 general-canonical:** identifies the twist with the original datum for reflex-field-fixing automorphisms

Planning API:

- `TauCeti.Shimura.conjugatedDatum.group` (projection): The rational group is the contracted product inner form S_τ×^S G.
- `TauCeti.Shimura.conjugatedDatum.specialTorus` (data): The unchanged T embeds into the twist; the marked S-map factors through T^ad in the adjoint group and has cocharacter τμ_h.
- `TauCeti.Shimura.conjugatedDatum.adelic` (equivalence): The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
- `TauCeti.Shimura.conjugatedDatum.localClass` (characterisation): The inner twist is finite-locally trivial and its real cohomology class is represented by τμ_h(−1)/μ_h(−1).
- `TauCeti.Shimura.conjugatedDatum.map` (functoriality): An inclusion of connected data preserving the marked adjoint torus/cocharacter induces the compatible inclusion of twists and their adelic trivializations. Identity and composition hold.
- `TauCeti.Shimura.conjugatedDatum.descent_ext` (extensionality): Two morphisms of contracted-product twists agreeing after a common torsor-trivializing faithfully flat extension are equal; marked isomorphisms also retain the torus and distinguished adelic trivialization.

Unit tests:

- `TauCeti.Shimura.conjugatedDatum.identity` (degenerate): For τ=id the distinguished torsor section gives the original datum and identity adelic map.
- `TauCeti.Shimura.conjugatedDatum.sl2_conjugation` (computation): For G=SL₂ with the norm-one Q(i) torus and the standard upper-half-plane adjoint S-map, τ equal to complex conjugation sends μ_h to its inverse and selects the lower-half-plane component. The group twist is split SL₂: the real obstruction μ_h(−1)⁻² is trivial and all finite local obstructions vanish. The marked adjoint homomorphism changes even though the group remains isomorphic.
- `TauCeti.Shimura.conjugatedDatum.finiteLocal` (compatibility): For each finite prime p and t∈T(Q_p), the distinguished local isomorphism sends the embedded t to the same t in the untwisted marked torus of {}^{τ,h}G. An arbitrary unmarked local isomorphism need not have this property.

Acceptance checks:

- For the standard SL₂ connected datum the Hodge cocharacter lives in PGL₂, and need not lift to an integral cocharacter of SL₂.

Source: [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), Introduction, p.281 (Taniyama torsor and contracted product). The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Remark 1.4, pp.241–242; Appendix (C), pp.262–263. The Appendix puts the connected S-map in the adjoint group. Remark 1.4 records the marked-torus twist, finite-place triviality and real class; its shorthand is interpreted using that carrier.

Atlas planet: **Conjugated Shimura datum**.

Remaining refinements: [Serre/Taniyama extension common owner](#gap-v0-9).

<a id="v7-kazhdan-uniformization"></a>

### Uniformization of conjugate arithmetic quotients

Declaration **TauCeti.Shimura.kazhdan_uniformization** (theorem), node `ShimuraVarieties:V7/kazhdan-uniformization`.

For a torsion-free arithmetic Hermitian quotient Γ\D and τ∈Aut(C), the universal cover of τ(Γ\D) is a Hermitian symmetric domain D′, and its fundamental group acts as a lattice in Aut(D′)^+. This is a key theorem to prove, with its exceptional noncompact cases included.

Hypotheses:

- Γ is torsion-free effective arithmetic; D is Hermitian symmetric; τ is any field automorphism of C.

Construction or proof:

1. For symplectic/abelian-type quotients use moduli and polarized families. For compact quotients use the relevant metric theorem.
2. For the remaining E₆/E₇ and mixed D cases read and decompose Kazhdan’s primary proof; Milne 3.2 cites its result and does not supply the missing analytic argument.
3. Record that argument as a gap rather than assuming the general conjugation theorem.

Direct inputs: [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V3/unique-algebraization`](#v3-unique-algebraization), [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- This does not claim π₁ is unchanged by τ.
- The exceptional-case primary argument remains a named proof obligation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 3.2, p.246. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Kazhdan exceptional uniformization proof](#gap-v0-10).

<a id="v7-weak-conjugation"></a>

### Weak connected conjugation comparison

Declaration **TauCeti.Shimura.weak_conjugation** (theorem), node `ShimuraVarieties:V7/weak-conjugation`.

For a semisimple simply connected connected datum and τ∈Aut(C), there exist another connected datum (G₁,X₁⁺), an algebraic tower isomorphism τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺), and a compatible finite-adelic group isomorphism. This assertion does not yet identify G₁ with the special-torus twist.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Lift the conjugated Hecke correspondences to the universal Hermitian cover to construct Γ₀ and its compatible finite-adelic map, as in 3.3–3.5.
2. Use the precise S-arithmetic arithmeticity and superrigidity results at sufficiently large S, with rank at least two, to recover G₁ and its compatible local maps (3.6–3.7).
3. Handle the nonexceptional central obstruction using corrected 3.8. In the exceptional Aₙ cases §3.10 uses rank-one subgroups after a totally real extension making their semisimple forms isotropic at all finite places. Platonov–Rapinchuk 1979 Theorem 1 proves perfection of SL₁(D), not simplicity; it cannot be applied as a no-noncentral-normal-subgroup theorem to the full reductive Hα containing T. The exact passage from the semisimple perfection result to the central adjustment on the marked torus is an explicit proof gap (E12). Finite étale comparison rigidity in §§2.1–2.2 then gives the tower isomorphism once this adjustment is justified.

Direct inputs: [`ShimuraVarieties:V7/kazhdan-uniformization`](#v7-kazhdan-uniformization), [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`, [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata).

Acceptance checks:

- The finite adelic map does not identify the real forms.
- The corrected 3.8 concerns H¹(k,Z), not H¹(k,G).
- Do not infer simplicity or perfection of a full reductive rank-one group with a positive-dimensional centre from perfection of its simply connected semisimple factor.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 3.1 and §§3.3–3.10, pp.245–252. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), Theorem 1, p.279; final discussion, p.282 (Russian published original). For a quaternion algebra D over a number field, the norm-one group is perfect when D is split at every finite place; every element is a product of at most three commutators. The final discussion still treats simplicity modulo centre as a conjecture. Neither assertion supplies simplicity of the full reductive Hα in Milne §3.10.

Remaining refinements: [Kazhdan exceptional uniformization proof](#gap-v0-10), [S-arithmetic and central-cohomology supplier extension](#gap-v0-11), [Exceptional central adjustment and rank-one perfection](#gap-v0-18).

<a id="v7-marked-conjugation"></a>

### Conjugation comparison with a marked special point

Declaration **TauCeti.Shimura.marked_conjugation** (theorem), node `ShimuraVarieties:V7/marked-conjugation`.

For the simple simply connected case, τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺) by an algebraic isomorphism sending τ[h] to [{}^τh] and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded A₁ subvarieties.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Compare the weak target’s embedded special torus and its tangent characters; the tangent weights recover the transformed cocharacter (5.1–5.2).
2. At the CM-split auxiliary extension compare both maps on every rank-one subvariety using the established A₁/CM comparison.
3. The centre intersection forces the residual adelic adjustment to be rational. Normalize the marked point and use density of its rational/adelic orbit for uniqueness.

Direct inputs: [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation), [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum), [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/rank-one-central-separation`](#v7-rank-one-central-separation), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V6/abelian-canonical`](#v6-abelian-canonical).

Acceptance checks:

- No chosen isomorphism or Langlands axiom is an input.
- The construction is valid for exceptional Hermitian types.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 1.1 and uniqueness Remark 1.3, p.241; §§4–5, pp.253–256. Theorem 1.1 gives existence, and Remark 1.3 gives uniqueness using the dense rational orbit. The original excerpt conflated those two statements.

Atlas planet: **Marked conjugation comparison**.

Remaining refinements: [A₁ comparison and completion density](#gap-v0-12).

<a id="v7-completed-conjugation-equivariance"></a>

### Equivariance for completed symmetry

Declaration **TauCeti.Shimura.completed_conjugation_equivariance** (theorem), node `ShimuraVarieties:V7/completed-conjugation-equivariance`.

The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely G(A_f). Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use the finite-base-extension functoriality of the completed groups as in Proposition 6.1 and MS §8.
2. Prove the precise density and compatibility needed to extend equivariance continuously. The annotated scan deletes an extra proposed rank-one generator family; no such stronger generation claim is used.
3. Compare finite levels to obtain the completed action identity. Its exact density statement/source decomposition is an explicit gap.

Direct inputs: [`ShimuraVarieties:V7/marked-conjugation`](#v7-marked-conjugation), [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Equivariance for G(A_f) alone does not establish the connected canonical formulation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 6.1, p.257; MS §8, pp.340–341. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8), [A₁ comparison and completion density](#gap-v0-12).

<a id="v7-special-independence"></a>

### Independence of the marked special point

Declaration **TauCeti.Shimura.special_independence** (theorem), node `ShimuraVarieties:V7/special-independence`.

For maximal special h,h′ in X⁺, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use the Hasse-principle comparison of adjoint inner forms and explicit special-torus transition to define the comparison diagram (6.3–6.5).
2. After simultaneous CM splitting of the two tori, measure their real discrepancy by the sum of Weyl lengths. At length zero kill the positive torus norm obstruction by a further totally real extension.
3. For a compact reflection shorten via the real normalizer; for a noncompact reflection use its A₁ subgroup and weak approximation to localize the change at one real place. Induct on the length and compare common refinements.

Direct inputs: [`ShimuraVarieties:V7/marked-conjugation`](#v7-marked-conjugation), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance), [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Point-independence is proved by Weyl-length induction, not asserted from density of one chosen orbit.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.3 and proof, pp.258–262. The comparison diagrams in §6 give compatibility of marked comparisons. The transition/coherence construction remains tied to the recorded MS1982d and completed-symmetry refinement, rather than inferred from the word independent.

Remaining refinements: [S-arithmetic and central-cohomology supplier extension](#gap-v0-11), [Arithmetic reductive supplier ownership](#gap-v0-19).

<a id="v7-conjugation-cocycle"></a>

### Reflex-field descent cocycle

Declaration **TauCeti.Shimura.conjugation_cocycle** (theorem), node `ShimuraVarieties:V7/conjugation-cocycle`.

For σ fixing E(G,X), identify the conjugated datum with the original through the transformed cocharacter class and special-point-independent transition. The comparison defines an equivariant algebraic descent system f_σ:σSh_C→Sh_C with f_{στ}=f_σ∘σ(f_τ), compatible with levels, right translations and the actual special-pair reciprocity formula.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Reassemble connected comparisons through the central/torus component extension.
2. Normalize reflex-field-fixing twists using the cocharacter class and prove the same special-point action as V4.
3. Apply uniqueness of marked comparisons and transitive transitions to identify the two composites. This produces the cocycle law; continuity is a distinct next theorem.

Direct inputs: [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance), [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm).

Acceptance checks:

- A set-theoretic cocycle without continuity is insufficient for effective descent.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorems 7.1–7.2, p.262; Descent §2. Theorem 7.2 is the canonical-model consequence, not an explicit proof of the cocycle formula. Its MS1982d §7 reference and the torsor multiplication/marked-independence inputs supply that proof route; exact coherence is a recorded gap.

Remaining refinements: [Connected canonical symmetry and coherence](#gap-v0-8), [Serre/Taniyama extension common owner](#gap-v0-9).

<a id="v7-finite-rigidifying-points"></a>

### Finite rigidifying special points

Declaration **TauCeti.Shimura.finite_rigidifying_points** (theorem), node `ShimuraVarieties:V7/finite-rigidifying-points`.

At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset Σ whose pointwise stabilizer is trivial. In dimension zero the finite point set itself is a rigidifying set. The constructed descent system fixes Σ over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Milne 1999 Lemma 2.2: the normalizer of the arithmetic group is discrete and finite covolume gives finite index, or apply the log-general-type argument. The exact normalizer theorem is requested from ALS.0.
2. For each nonidentity automorphism choose a special orbit point it moves; their finite union rigidifies.
3. Reciprocity at finite level gives an open Galois stabilizer for each point; take a finite extension fixing all of them. For zero-dimensional levels use the explicit finite étale Galois set.
4. For a zero-dimensional finite étale level use all geometric points to rigidify its finite permutation group; do not impose positive dimension in the final canonical-model theorem.

Direct inputs: [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- A finite subset of an arbitrary orbit need not rigidify; density and finite automorphisms are used.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and Theorem 2.3, pp.4–5. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

<a id="v7-continuous-descent"></a>

### Continuity of the canonical descent system

Declaration **TauCeti.Shimura.continuous_descent** (theorem), node `ShimuraVarieties:V7/continuous-descent`.

The canonical descent system at each neat level is continuous: it splits over a finitely generated field extension of E inside C in the sense of Milne 1999 Theorem 1.1. A finite rigidifying subset fixed over a finite field forces this property by Corollary 1.2. Level comparisons then give the required compatible system at all levels.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Spread the variety and the finite rigidifying subset to a finitely generated field L.
2. For automorphisms fixing L the canonical comparisons and the split comparisons agree on Σ and hence agree globally.
3. Invoke the corrected continuity criterion; do not cite the older 1994 lemma with this hypothesis omitted.

Direct inputs: [`ShimuraVarieties:V7/finite-rigidifying-points`](#v7-finite-rigidifying-points), [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The infinite-transcendence hypothesis Ω=C over a number field satisfies the descent theorem.
- Open stabilizers of individual points alone are not a replacement for the finite rigidification argument.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Continuous canonical descent**.

<a id="v7-general-canonical"></a>

### Canonical models for every pure datum

Declaration **TauCeti.Shimura.general_canonical** (theorem), node `ShimuraVarieties:V7/general-canonical`.

Every pure Shimura datum admits a canonical tower over its reflex field, satisfying V4 at every level and independent of the auxiliary extension and marked special point. Apply effective quasi-projective descent to the continuous cocycle constructed above, descend finite quotients and level actions, and verify special reciprocity by comparison over C.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.
2. Descend all compatible finite-level maps using the constructed equivariant system; extend to non-neat levels by finite quotients.
3. The established canonical descent action verifies the exact V4 field of definition and geometric-Artin formula. Compare auxiliary choices through special-independence and specified analytic identity.

Direct inputs: [`ShimuraVarieties:V7/continuous-descent`](#v7-continuous-descent), [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- This target remains planned with explicitly named proof-source and supplier gaps; it is not a claim of implementation or gap-free proof.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2. Supports canonical models for every pure datum. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.

<a id="v8"></a>

## V8. The algebraic tower and modular comparisons

Apply the conditional V4 foundations to the actual models. Assemble the tower and finite Hecke legs, descend datum maps and component reciprocity, then compare GL₂ with the existing modular models. Construct the independent full-level compact curve before the Pink codimension-one extension and arithmetic minimal model. The complex partial-open/logarithmic and datum-functoriality interfaces remain recorded refinements of V2.

The foundational inputs are [disjoint special reflex fields](#v8-disjoint-special-reflex-fields), [translation descent](#v8-translation-descent) and [model uniqueness](#v8-model-uniqueness), displayed in the V4 lane above.

<a id="v8-level-tower"></a>

### Canonical algebraic level tower

Declaration **CanonicalTower.ofLevelMaps** (construction), node `ShimuraVarieties:V8/level-tower`.

For actual canonical models M_K, assemble the unique descended forgetful maps pi_{K,L} for K contained in L into the functor CanonicalTower.ofLevelMaps: Level(D) -> Over(Spec E). Level(D) and its inclusion arrows are supplied by V1/D5. Its values are the supplied models, not newly chosen arbitrary schemes. In the suggested file the index category and model family are parameters; the constructor is only the categorical assembly slice of this construction.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The categorical assembly signature takes the already proved identity and composition laws for the descended transitions. These laws are obtained here by uniqueness, rather than assumed in the mathematical descent theorem.

Construction or proof:

1. Apply translation-descent at g=1 to every inclusion.
2. The identity and composition equations hold over C by V1 and descend by uniqueness. Package these maps with the existing Functor constructor; retain the actual structure morphism in Over(Spec E).
3. After any extension E -> F, use Over.pullback to base change the entire functor; identity and successive base changes use the native natural isomorphisms.

Direct inputs: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), `ShimuraVarieties:V1`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Over`, `mathlib:CategoryTheory.Over.pullback`, `mathlib:CategoryTheory.Over.pullbackId`, `mathlib:CategoryTheory.Over.pullbackComp`, `mathlib:AlgebraicGeometry.Scheme`.

Uses that determine the interface:

- **PerfectoidShimuraVarieties:S0, S2, S4:** Supplies finite-level schemes and compatible maps before any inverse-limit or perfectoid construction.
- **Milne 12.10 and ShimuraVarieties:V8.general:** The canonical-model tower is a single functor; general existence supplies its values.
- **ShimuraCompactifications:C2 and AutomorphicBundles:B1:** Supplies arithmetic transition morphisms and common-base diagrams.

Planning API:

- `CanonicalTower.ofLevelMaps_obj` (projection): At i the constructor has value M(i), with its given map to the base.
- `CanonicalTower.ofLevelMaps_map` (projection): On an arrow f:i -> j the constructor evaluates to the supplied descended transition t(f). In the suggested file this is heterogeneous equality because the constructed object projections are propositional equalities.
- `CanonicalTower.ofLevelMaps_id` (simp): The map of the identity arrow at i is the identity of M(i).
- `CanonicalTower.ofLevelMaps_comp` (functoriality): The map of f followed by g is t(f) followed by t(g).
- `CanonicalTower.ofLevelMaps_baseChange` (compatibility): Postcomposing with Over.pullback(b) sends a transition f to the pullback of t(f), on the pulled-back models. This uses native base change rather than a second scheme carrier.

Unit tests:

- `CanonicalTower.test_identity_level` (degenerate): At any level K, t(id_K) is the identity of M_K.
- `CanonicalTower.test_nested_levels` (compatibility): For K1 contained in K2 contained in K3, the constructor map of the composite inclusion equals pi_{K1,K2} followed by pi_{K2,K3}.
- `CanonicalTower.test_preserves_supplied_arrow` (characterisation): For a supplied arrow f and a morphism u distinct from t(f), the constructor map of f is not u; replacing transitions by zero or arbitrary maps fails this test.
- `CanonicalTower.test_base_change` (compatibility): The base-changed constructor map on f is exactly Over.pullback(b).map(t(f)).
- `CanonicalTower.test_gl2_jline_degree` (computation): For GL2 and N >= 3 the tower map from level K(N) to GL2(Zhat) is identified with the j-map Y_full(N)_Q -> A^1_Q (gl2-full-level, PR81 9E); its degree is |GL2(Z/N)|/2 because -1 acts trivially, so 24 at N = 3, and |GL2(F_3)| = 48.
- `CanonicalTower.test_not_constant` (non-example): The tower is not constant: for GL2, M_{K(N)} has phi(N) geometric connected components (component-reciprocity) while M_{GL2(Zhat)} is geometrically connected, so for N >= 3 the transition is not an isomorphism; phi(3) = 2.

Acceptance checks:

- All levels retain their given structure morphisms to Spec E.
- A composite of three inclusions gives the same map for either parenthesization.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29(a), p.65; 12.10, p.115; 13.7(b), p.119. Assemble the algebraic models with their actual maps. Neither an infinite-level scheme nor its point formula is required.

Atlas planet: **Canonical algebraic tower**.

Remaining refinements: [Compact-open level index category](#gap-v8-5).

<a id="v8-translation-laws"></a>

### Right translation laws on the algebraic tower

Declaration **CanonicalTower.translation_comp** (theorem), node `ShimuraVarieties:V8/translation-laws`.

The descended T_g obey T_1=id at equal levels and T_h composed after T_g equals T_{gh}, whenever g^{-1}Kg is contained in L and h^{-1}Lh is contained in P. For k in K the equal-level T_k is the identity. For a fixed g the conjugate-level isomorphisms form a natural transformation from the tower to the conjugated-index tower.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. V1 proves these identities on the double quotient.
2. Compare the descended E-morphisms after faithful C-base change; use uniqueness. The product is gh in this right-action convention.

Direct inputs: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/level-tower`](#v8-level-tower), [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For g,h represented by noncommuting GL2 matrices, check gh rather than hg.
- No action of all G(A_f) on one finite-level scheme is asserted.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29(b)–(c), p.65. Source/target levels and coherent right translations.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Discussion before Definition 5.14, p.58. Pins the convention T(gh)=T(h)∘T(g): first T(g), then T(h).

<a id="v8-finite-level-maps"></a>

### Finite level maps and effective deck groups

Declaration **CanonicalTower.level_map_finite** (theorem), node `ShimuraVarieties:V8/finite-level-maps`.

For K1 contained in K2, pi_{K1,K2} is finite and surjective over E; when K2 (hence K1) is neat it is finite étale. If K1 is normal in K2, M_{K2} is the quotient of M_{K1} by the effective image of K2/K1 in automorphisms of M_{K1}; its kernel consists of elements acting trivially on the actual quotient (for GL2 and K(N) normal in GL2(Zhat), the element -1 acts trivially, so the effective group is GL2(Z/N)/{±1}). Deck groups and degree use this effective quotient, not K2/K1 without a kernel calculation.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. V1 supplies finite analytic coverings and the effective stabilizer calculation. V3 supplies finite algebraic maps and finite quotients at non-neat levels.
2. Finiteness, surjectivity and, for neat K2, étaleness descend along C/E. Apply the finite quotient universal property to the descended effective action.

Direct inputs: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/translation-laws`](#v8-translation-laws), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D5/neat-level`, `mathlib:AlgebraicGeometry.IsFinite`.

Acceptance checks:

- For torus data the dimension is zero; level morphisms are finite étale.
- Non-neat levels retain elliptic stabilizer ramification, so étaleness is not exported there.
- Y_full(3) -> Y(1) (the j-line) has degree |GL2(F_3)|/2 = 24 and ramifies over j = 0 and j = 1728: the target level GL2(Zhat) is not neat.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29(c), p.65. Finite quotient statement of 5.29(c), with the effective-kernel qualification inherited from V1.

<a id="v8-hecke-span"></a>

### Algebraic Hecke correspondence

Declaration **CanonicalHecke.span** (construction), node `ShimuraVarieties:V8/hecke-span`.

For D, actual canonical models and g in G(A_f), put J=K intersect gKg^{-1}. Construct CanonicalHecke.span as the native WalkingSpan diagram in Over(Spec E), with apex M_J, first leg pi_{J,K}, and second leg T_g:M_J -> M_{g^{-1}Jg} followed by pi_{g^{-1}Jg,K}. Both legs are finite. The suggested constructor receives these already descended legs and uses native span; supplying these arrows alone does not prove canonical descent.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- g is a finite-adelic element and K is compact open.

Construction or proof:

1. D5/V1 supply J, conjugate levels and both inclusion witnesses.
2. Apply translation-descent and finite-level-maps to obtain the two E-morphisms.
3. Use CategoryTheory.Limits.span, preserving the order of the two legs. The complex comparison is the V1 correspondence; applying native spanCompIso to Over.pullback supplies its base-change isomorphism.

Direct inputs: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V1/holomorphic-hecke`](#v1-holomorphic-hecke), `mathlib:CategoryTheory.Limits.span`, `mathlib:CategoryTheory.Limits.spanCompIso`, `mathlib:CategoryTheory.Over.pullback`.

Uses that determine the interface:

- **Milne 13.6 and ShimuraCompactifications:C3:** Uses the two separately descended finite morphisms; compactification extends the same ordered span.
- **ModularCurvesPartII:R12.5 and HeegnerPointEulerSystems:** Compares finite correspondences with moduli isogenies before applying pull-push to coefficients.

Planning API:

- `CanonicalHecke.span_apex` (projection): The value at WalkingSpan.zero is the supplied apex M_J.
- `CanonicalHecke.span_first` (projection): The image of WalkingSpan.Hom.fst is exactly pi_{J,K}. The suggested signature uses heterogeneous equality across the object projection equalities.
- `CanonicalHecke.span_second` (projection): The image of WalkingSpan.Hom.snd is exactly T_g followed by pi_{g^{-1}Jg,K}. The suggested signature uses heterogeneous equality across the object projection equalities.
- `CanonicalHecke.span_baseChange` (compatibility): Postcomposing the span with Over.pullback(b) is naturally isomorphic to native span on the two pulled-back legs, by spanCompIso.

Unit tests:

- `CanonicalHecke.test_identity` (degenerate): For equal apex and endpoints and both supplied legs the identity (the g=1 case), both WalkingSpan arrows evaluate to the identity.
- `CanonicalHecke.test_native_span` (compatibility): The constructed ordered diagram equals CategoryTheory.Limits.span(p1,p2) on the supplied legs.
- `CanonicalHecke.test_distinct_legs` (non-example): For two endomorphisms p1,p2 of a supplied apex with p1 distinct from p2, the first-leg evaluation is not p2. A construction that swaps the two legs fails this test.
- `CanonicalHecke.test_base_change` (compatibility): After Over.pullback(b), evaluation at the first WalkingSpan arrow is Over.pullback(b).map(p1).
- `CanonicalHecke.test_gl2_Tp_index` (computation): For GL2, K = GL2(Zhat) and g = diag(p,1) at a prime p, J = K ∩ gKg^{-1} is the preimage of the lower-triangular subgroup mod p, of index p+1 = |P^1(F_p)| in K; both legs of the Hecke span have degree p+1 over the coarse j-line, the classical T_p.

Acceptance checks:

- J is K intersect gKg^{-1}, not K intersect g^{-1}Kg.
- For g=1, J=K and both legs are the identity.
- For g = diag(p,1) the apex has index p+1, not p or p^2: J is K ∩ gKg^{-1}, the stabilizer of a line in F_p^2.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29, p.65; 13.6, p.118. Arithmetic descent of the two legs of the V1 Hecke correspondence.

Atlas planet: **Algebraic Hecke correspondences**.

<a id="v8-datum-functoriality"></a>

### Functoriality of canonical models in the datum

Declaration **CanonicalModel.datum_map_defined_over_compositum** (theorem), node `ShimuraVarieties:V8/datum-functoriality`.

For a datum morphism f:D -> Dprime, compact open K,Kprime with f(K) contained in Kprime, and actual canonical models on both sides, the complex map [x,a] -> [f(x),f(a)] descends uniquely to a morphism over E(D). Milne states the field as the compositum E(D)E(Dprime); it equals E(D), because E(Dprime) is contained in E(D) (the argument of Milne 12.3(c) applies to every datum morphism: f carries the cocharacter class of X into that of Xprime Galois-equivariantly). It commutes with admissible level maps and right translations, identity datum maps and compositions after the necessary base changes of the target models to E(D).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- Both data and their reflex fields are specified; the target also has actual canonical models.

Construction or proof:

1. V3 gives the complex algebraic map; D4 sends special pairs to special pairs.
2. Functoriality of V4 reflex norms makes the map Galois equivariant on the dense Hecke orbit of each source special pair (special points map to special points by D4). Apply the disjoint-field argument of translation-descent over E(D), which contains E(Dprime).
3. Descend by A; identities, compositions and Hecke compatibility follow from their complex formulas and faithful base change.

Direct inputs: `ShimuraData:D4/datum-morphism`, `ShimuraData:D4/special-image`, [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields), [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), `ShimuraVarieties:V4`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The identity datum map gives the identity scheme morphism.
- The determinant GL2 -> Gm is defined over Q, and must agree with the separately constructed torus canonical model.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 13.8, p.119. Milne's compositum statement; the compositum equals E(D).

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.4, pp.155–156. Special-pair proof of datum functoriality.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 12.3(c), p.112. The reflex field of the source contains that of the target; the argument uses only Galois-equivariance of the induced map on cocharacter classes.

Atlas planet: **Functoriality of canonical models**.

Remaining refinements: [Reflex-norm functoriality API promotion](#gap-v8-7).

<a id="v8-zero-dimensional-shimura-variety"></a>

### Zero-dimensional Shimura varieties and their canonical models

Declaration **ZeroDimShimura.shimuraSet** (construction), node `ShimuraVarieties:V8/zero-dimensional-shimura-variety`.

Let T be a Q-torus, Y a nonempty finite set on which T(R) acts transitively through T(R)/T(R)^+ (T(Q) acting through T(Q) ⊂ T(R)), and mu a cocharacter of T_C with field of definition E ⊂ C. For compact open K ⊂ T(A_f) put Sh_K(T,Y) = T(Q)\(Y × T(A_f))/K, the finite set of classes [y,a]_K with [y,a]_K = [q·y, q a k]_K for q in T(Q), k in K; the sets form an inverse system with right translations by T(A_f). For sigma in Gal(Qbar/E) choose s in the ideles of E with art_E(s) = sigma on E^ab, let r(s) = (r(s)_inf, r(s)_f) be its image under the multiplicative reflex norm r(T,mu) of V4, and put sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K (Milne, formula (64)). This is a continuous action independent of s, compatible with transitions and translations; the canonical model M_K(T,Y,mu) is the finite étale E-scheme attached to this Galois set. When Y is one point and mu = mu_h it is the V4 torus model of the strict torus datum (T,{h}); in general it is not: for (G_m,{±1}) and K = 1+N Zhat it is mu_N^prim, whereas the strict datum gives Spec of the real subfield of Q(zeta_N).

Hypotheses:

- T is a Q-torus; Y is a nonempty finite set with a transitive T(R)-action factoring through T(R)/T(R)^+ (Milne, zero-dimensional Shimura varieties, pp.62–63).
- mu is a cocharacter of T_C defined over the number field E ⊂ C; r(T,mu) is the multiplicative reflex norm of V4 (Milne (60) with the product correction E5) and art_E is the Artin map in the V4 normalization.
- K ranges over compact open subgroups of T(A_f).

Construction or proof:

1. Finiteness: T(Q)\T(A_f)/K is finite (Milne 5.22) and Y is finite.
2. Independence of s: two choices differ by an element of the kernel of art_E, the closure of E^× times the identity component at infinity; r(E^×) lies in T(Q), which acts trivially on the double quotient, r of the identity component lies in T(R)^+, which acts trivially on Y, and K is open, so the closure does not matter. The action factors through Gal(E^ab/E) and through a finite quotient.
3. Transitions [y,a]_K -> [y,a]_K′ for K ⊂ K′ and translations [y,a] -> [y,ag] commute with the action because T is commutative; apply the PR81 0D equivalence between finite étale E-schemes and finite continuous Galois sets to obtain the models and their E-morphisms.
4. For Y a point, (64) reduces to (62) for the special pair (T,h), because T(R) fixes h; this is the V4 torus model.

Direct inputs: [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), [`ShimuraVarieties:V4/torus-model`](#v4-torus-model), `ShimuraData:D5/torus-datum`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.

Uses that determine the interface:

- **Milne SVI §5, p.63 and §13, (64), p.119:** pi_0 of Sh_K(G,X) is the zero-dimensional Shimura variety Sh_{nu(K)}(T,Y), and (64) gives its canonical model.
- **ShimuraVarieties:V8/gl2-determinant-pairing:** the target of the determinant at level det K(N) is Sh(G_m,{±1}) ≅ mu_N^prim.
- **Pink 12.8 and 12.10 (the datum (G_m,Q,H_0)):** the quotient (GL2,H±)/SL2 in the codimension-one construction is a two-point zero-dimensional datum, whose canonical model is this one.

Planning API:

- `ZeroDimShimura.shimuraSet` (data): Sh_K(T,Y) = T(Q)\(Y × T(A_f))/K, the quotient of Y × T(A_f) by (y,a) ~ (q·y, q a k), q in T(Q), k in K.
- `ZeroDimShimura.mk` (constructor): The class [y,a]_K of y in Y and a in T(A_f).
- `ZeroDimShimura.mk_eq_mk` (characterisation): [y,a]_K = [y′,a′]_K if and only if y′ = q·y and a′ = q a k for some q in T(Q) and k in K.
- `ZeroDimShimura.map` (functoriality): For K ⊂ K′ the transition [y,a]_K -> [y,a]_K′, with map_id and map_comp.
- `ZeroDimShimura.singletonEquiv` (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the finite Shimura set of the V4 torus datum.
- `ZeroDimShimura.galoisAct` (structure): Formula (64): sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K; independent of s, continuous, compatible with map and translations.
- `ZeroDimShimura.canonicalModel` (other): The finite étale E-scheme attached to the Galois set (Sh_K(T,Y), galoisAct) by PR81 0D; its Qbar-points are Sh_K(T,Y) with this action.

Unit tests:

- `ZeroDimShimura.test_gl2_components` (computation): For T = G_m, Y = R^×/R_{>0} ≅ {±1} and K = 1+N Zhat, Sh_K(T,Y) ≅ (Z/NZ)^×, which has phi(N) elements (Milne p.63).
- `ZeroDimShimura.test_strict_datum_halves` (non-example): With Y replaced by one point (the strict datum (G_m,{det∘h}) of ShimuraData D5) the same level gives Q^×\A_f^×/K ≅ (Z/NZ)^×/{±1}, with phi(N)/2 elements for N >= 3; at N = 3 it is a single point, whereas mu_3^prim has two geometric points.
- `ZeroDimShimura.test_singleton` (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the set underlying the V4 torus model.
- `ZeroDimShimura.test_maximal_level` (degenerate): For T = G_m, Y = {±1} and K = Zhat^×, Sh_K(T,Y) is one point (Q_{>0}·Zhat^× = A_f^×), with model Spec Q.

Acceptance checks:

- For (G_m,{±1}) with mu(z)=z and K = 1+N Zhat the set has phi(N) points and Galois acts through the cyclotomic character (Milne p.125): the model is Spec Q[z]/Phi_N(z).
- Complex conjugation acts on Y={±1} by the sign of r(s)_inf; a one-point Y cannot record it.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties and the GL2 example, pp.62–63. Defines Sh(T,Y) for a finite set Y with transitive T(R)/T(R)^+-action, extending Deligne's one-point torus data; the GL2 example gives (Z/NZ)^× ≅ Gal(Q[zeta_N]/Q).

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, formula (64), p.119. Formula (64) defines the canonical model of a zero-dimensional Shimura variety.

<a id="v8-component-reciprocity"></a>

### Galois action on connected components

Declaration **CanonicalModel.component_map_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/component-reciprocity`.

Let D=(G,X) be a pure Shimura datum with G^der simply connected, nu: G -> T = G/G^der, T(R)^† the image of Z(R) and Y = T(R)/T(R)^† (Milne (34)), and mu = nu∘mu_x, which is independent of x in X and defined over E = E(D). For actual canonical models M_K over E, the complex map Sh_K(G,X) -> Sh_{nu(K)}(T,Y), [x,a]_K -> [y(x), nu(a)], with y: pi_0(X) -> Y induced by nu, descends uniquely to an E-morphism M_K -> M_{nu(K)}(T,Y,mu) into the canonical model of zero-dimensional-shimura-variety. For K as in Milne 5.17 (in particular every K(N) for GL2) its geometric fibres are the connected components, so it identifies pi_0(M_K ⊗_E C) with Sh_{nu(K)}(T,Y) compatibly with the Galois action (64). It commutes with level maps and with right translation by g in G(A_f), acting on the target by nu(g).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- G^der is simply connected; for the pi_0 bijection K is as in Milne 5.17 (sufficiently small, or K(N) for GL2).

Construction or proof:

1. Over C the map is well defined and, for K as in Milne 5.17, induces a bijection on connected components (V0's component decomposition).
2. For a special pair (T0,x0) and sigma fixing E(x0), (62) gives sigma[x0,a] = [x0, r_{x0}(s′)a]. Functoriality of reflex norms (V4) gives nu∘r(T0,mu_{x0}) = r(T,mu)∘Nm_{E(x0)/E}, compatible with the Artin maps; T0(R) fixes x0 (Milne 12.6), so the archimedean component of r(T,mu)(Nm s′) fixes y(x0). Hence the map commutes with sigma on the Hecke orbit of x0, which is dense (Milne 13.5): it is fixed by Aut(C/E(x0)) (Milne footnote 73).
3. Take x1 with E(x1) linearly disjoint from the normal closure of E(x0) over E (disjoint-special-reflex-fields); as in translation-descent, the map is defined over E(x0) ∩ E(x1) = E, uniquely by faithful base change (R09.3). Compatibility with level maps and translations holds over C and descends.

Direct inputs: [`ShimuraVarieties:V8/zero-dimensional-shimura-variety`](#v8-zero-dimensional-shimura-variety), [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields), [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), [`ShimuraVarieties:V0/simply-connected-components`](#v0-simply-connected-components), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), `ShimuraVarieties:V4`, `ShimuraData:D4/special-pair`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For GL2 at K(N), N >= 3, the target has phi(N) points and the fibres are the fixed-pairing curves of gl2-fixed-pairing-fibre.
- Complex conjugation interchanges the two components H^+ and H^- over a fixed level class: the target must use Y = {±1}, not the one-point torus datum.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, (64) and footnote 73, p.119. pi_0 of the canonical model is the canonical model of Sh(T,Y); footnote 73 gives the special-point argument.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), (34) and Theorem 5.17, p.59. The complex component set is the zero-dimensional Shimura variety when G^der is simply connected.

Remaining refinements: [Reflex-norm functoriality API promotion](#gap-v8-7).

<a id="v8-abelian-instance"></a>

### Abelian-type tower from V6

Declaration **CanonicalTower.abelian_type** (application), node `ShimuraVarieties:V8/abelian-instance`.

Applying the preceding canonical-model functoriality theorems to the models constructed by V6 produces the finite-level abelian-type tower, translations, finite maps, Hecke spans and datum functoriality. No premise imports V7 or V8.general.

Hypotheses:

- D is of abelian type in D4; V6 supplies actual models satisfying V4.

Construction or proof:

1. Supply the V6 construction to translation-descent and level-tower.
2. Use model-uniqueness to identify choices of Hodge-type covers and component descent.
3. Use the same finite-level and datum-morphism statements; do not identify entire varieties merely because derived groups are isogenous.

Direct inputs: [`ShimuraVarieties:V6/abelian-canonical`](#v6-abelian-canonical), [`ShimuraVarieties:V8/level-tower`](#v8-level-tower), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality).

Acceptance checks:

- GL2 is the genus-one GSp case, supplied through V5/V6.
- There is no dependency path from this node to V7.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 14.15–14.16 and the paragraph after them, p.127; 13.7, p.119. Specialize the conditional V8 results to V6, rather than replaying the V6 existence proof. On p.127 the second citation “(14.16)” should read (14.15); see E9.

<a id="v8-gl2-moduli-reciprocity"></a>

### Canonical reciprocity for full elliptic level

Declaration **GL2Modular.full_level_is_canonical** (theorem), node `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

For N>=3, the Q-scheme Y_full(N)_Q representing elliptic curves with an ordered full N-basis, with the complex identification supplied by R12.1/R12.2 and M3, satisfies the actual GL2 special-pair canonical-model condition of V4. The Galois action includes the Weil pairing and acts on the entire full-level model, not only a chosen cyclotomic fibre.

Hypotheses:

- N>=3; GL2 datum is the standard homology-weight minus one datum of D5.
- The fine generic-fibre full-level moduli scheme and analytic comparison are the suppliers' actual constructions.

Construction or proof:

1. Identify GL2=GSp2 and an elliptic curve with its canonical principal polarization. PELModuli M5 supplies the genus-one comparison of the Siegel moduli with PR81's Y_full(N), including the determinant/Weil-pairing convention; M3/R12.1 compare homology, Tate modules and the ordered level basis with the V3 complex variety.
2. V5 supplies normalized CM reciprocity on the elliptic special pairs and their Tate levels; M4 verifies that the constructed genus-one moduli model has that Galois action.
3. Apply V4 Artin-convention conversion, including the field of definition of each special point. A geometric-point bijection alone is insufficient to identify the Q-scheme.

Direct inputs: `ShimuraData:D5/gl2-datum`, `ShimuraData:D3/reflex-field`, [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V5/main-cm`](#v5-main-cm), [`ShimuraVarieties:V5/cm-polarization-level`](#v5-cm-polarization-level), [`ShimuraVarieties:V5/siegel-special-cm`](#v5-siegel-special-cm), [`ShimuraVarieties:V5/siegel-canonical`](#v5-siegel-canonical), `PELModuli:M3`, `PELModuli:M4`, `PELModuli:M5`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Acceptance checks:

- Use the actual special torus for an elliptic CM curve and compare its normalized Artin action on the ordered basis.
- Full level two is excluded: the residual minus-one automorphism preserves all two-torsion.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 14.12, p.125. The symplectic/abelian moduli description and normalized CM action certify the genus-one canonical condition.

<a id="v8-gl2-full-level"></a>

### Full-level modular curve comparison over Q

Declaration **GL2Modular.full_level_iso** (theorem), node `ShimuraVarieties:V8/gl2-full-level`.

For N>=3, there is a unique Q-isomorphism Sh_{K(N)}(GL2,H±) -> Y_full(N)_Q inducing the supplied complex uniformization. Here K(N)=ker(GL2(Zhat)->GL2(Z/N)). The source is the actual V5/V6 canonical model and the target is the PR81 fine full ordered-basis scheme.

Hypotheses:

- N>=3; full H± datum and principal adelic level; no chosen primitive root is incorporated into the Q-scheme.

Construction or proof:

1. Use gl2-moduli-reciprocity and model-uniqueness to descend the complex moduli identification to a Q-isomorphism.
2. Use the existing AA.5 principal-level component calculation and R12.2 comparison to identify its complex effect with the double-quotient formula.
3. Verify compatibility with the universal elliptic family/level interpretation through M3.

Direct inputs: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/abelian-instance`](#v8-abelian-instance), `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Acceptance checks:

- At N=3 the full curve has two geometric pairing components; it is not identified with a single Gamma(3) quotient.
- At N=4 there are phi(4)=2 pairing components; composite levels are covered without Layer 10.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 13.7(a), p.119. The moduli description followed by canonical-model uniqueness gives a scheme isomorphism over Q.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.9, p.175; 12.9, p.200 (author-typeset version). Genus-one full-level model is the arithmetic base case.

Atlas planet: **Full-level modular curve comparison**.

Remaining refinements: [AA.5 exact principal-level representative contract](#gap-v8-4).

<a id="v8-gl2-determinant-pairing"></a>

### Determinant is the Weil-pairing morphism

Declaration **GL2Modular.det_eq_weil_pairing** (comparison), node `ShimuraVarieties:V8/gl2-determinant-pairing`.

Let nu = det: GL2 -> G_m, T = G_m, Y = R^×/R_{>0} ≅ {±1} (Milne (34): T(R)^† = R_{>0}, T(Q)^† = Q_{>0}) and mu = det∘mu_x. Under full_level_iso, the Q-morphism of component-reciprocity, Sh_{K(N)}(GL2,H±) -> Sh_{det K(N)}(G_m,{±1}), is identified over Q with the PR81 determinant det_N: Y_full(N)_Q -> mu_N^prim, (E,P,Q) -> e_N(P,Q). Here det K(N) = ker(Zhat^× -> (Z/N)^×), Sh_{det K(N)}(G_m,{±1}) ≅ (Z/N)^× with Galois acting through the cyclotomic character, and its canonical Q-model is mu_N^prim = Spec Q[z]/Phi_N(z), not the constant disjoint union of phi(N) Q-points. The strict one-point torus datum (G_m,{det∘h}) of ShimuraData D5 is not the target: at this level its Shimura set is (Z/N)^×/{±1}, with model the spectrum of the real subfield of Q(zeta_N).

Hypotheses:

- N>=3; choose the analytic reference basis so that its pairing is the reference primitive root calibrated by R12.1; use the V4 normalization of the Artin map and reflex norm.

Construction or proof:

1. component-reciprocity (G^der = SL2 is simply connected) gives the Q-morphism to the canonical model of Sh_{det K(N)}(G_m,{±1}); zero-dimensional-shimura-variety identifies that set with (Z/N)^× (Milne p.63) and its Galois action (64) with the cyclotomic character (Milne p.125), so the model is mu_N^prim. AA.5 supplies the determinant-indexed components.
2. For a level eta, Milne 6.3 sends the moduli object to [ah, a∘eta]; the determinant records the multiplier of the alternating pairing. R12.1/R12.2 and PELModuli M5 identify that multiplier with the exponent of e_N(P,Q) relative to the calibrated reference root.
3. Both are Q-morphisms Y_full(N)_Q -> mu_N^prim agreeing on complex points; equality descends by faithful base change (R09.3).

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/component-reciprocity`](#v8-component-reciprocity), [`ShimuraVarieties:V8/zero-dimensional-shimura-variety`](#v8-zero-dimensional-shimura-variety), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `PELModuli:M5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For N=3 the primitive-root model is Spec Q[z]/(z^2+z+1), geometrically two points with nontrivial conjugation.
- A determinant-one basis change preserves the pairing; a determinant-u change raises it to the u-th power.
- With the one-point torus datum the N = 3 target would be a single Q-point, since (Z/3)^×/{±1} is trivial; the correct target has two geometric points.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, (64), p.119; §14, Siegel proof, p.125. Determinant-component Galois action.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.7, p.100 (root normalization corrected). The fixed-pairing condition; the chosen analytic reference root must be calibrated.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties, GL2 example, p.63. pi_0(Sh_K(N)) is T(Q)\{±1} × A_f^×/(1+N Zhat)^× ≅ (Z/NZ)^×, using Y = {±1}, not a one-point torus datum.

Remaining refinements: [AA.5 exact principal-level representative contract](#gap-v8-4).

<a id="v8-gl2-fixed-pairing-fibre"></a>

### Fixed-pairing fibre over a primitive root

Declaration **GL2Modular.fixed_pairing_fibre_iso** (comparison), node `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`.

For N>=3 and a primitive Nth root zeta in C, base change full_level_iso to Q(zeta) and take the scheme-theoretic fibre of its determinant/Weil-pairing map at zeta. This is an isomorphism to Y(N,zeta) over Q(zeta). Its complex analytification is Gamma(N)\H, and the fibre is geometrically connected and geometrically irreducible using the open comparison R12.4.

Hypotheses:

- The fibre is formed after cyclotomic base change; its scalar extension to C uses the chosen embedding Q(zeta)->C.

Construction or proof:

1. Use gl2-determinant-pairing and the functoriality of fibre products to restrict full_level_iso.
2. Apply R12.1/R12.2 fixed-pairing uniformization with the calibrated basis: if zeta=zeta_ref^u, replace the first standard torsion generator by u times it.
3. Import R12.4 open connectedness and smooth-curve irreducibility. This has no compactification prerequisite.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.4`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `mathlib:CategoryTheory.Over.pullback`.

Acceptance checks:

- Y_full(3)_C has two components whereas Y(3,zeta)_C has one.
- Taking a fibre over Q without adjoining zeta is not a fibre at a Q-rational primitive root for N>2.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.7–8.8, p.100. Fixed-pairing complex uniformization and cyclotomic model, with the normalization issue recorded.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.17, pp.59–61; connected components in section 13, p.119. The determinant separates full-level components.

<a id="v8-gl2-row-basis-dictionary"></a>

### Row-basis and adelic right actions

Declaration **GL2Modular.row_basis_right_translation** (comparison), node `ShimuraVarieties:V8/gl2-row-basis-dictionary`.

For N>=3 and u in GL2(Zhat) with reduction [[a,b],[c,d]], right translation [x,A]->[x,A u] corresponds under full_level_iso to (P,Q)->(aP+cQ,bP+dQ). The Weil pairing changes by exponent det(u mod N), so this map sends Y(N,zeta) to Y(N,zeta^{det u}). General finite-adelic g is compared through the two isogeny legs at the intersection level, not by pretending g has an integral reduction.

Hypotheses:

- The source K(N) is normalized by GL2(Zhat); full-level bases use the PR81 row convention.

Construction or proof:

1. Write the level as eta:V(A_f)->V_f(E). Milne 6.3 identifies it with [ah,a eta]. Replacing eta by eta composed with u changes a eta to (a eta)u.
2. Evaluate precomposition on the two standard column generators: columns of u give aP+cQ and bP+dQ. Thus the ordered basis is a row with right multiplication.
3. Use PR81 Weil-pairing bilinearity for the determinant exponent. For nonintegral g use R12.5 isogeny/Hecke comparison and the actual intersection-level span.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/translation-laws`](#v8-translation-laws), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), `ModularCurvesPartII:R12.5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Acceptance checks:

- For u=[[1,1],[0,1]] the basis goes to (P,P+Q), not (P+Q,Q).
- For u=[[0,1],[-1,0]] the basis goes to (-Q,P); determinant is one and pairing stays fixed.
- For diag(v,1), pairing is raised to v and the component changes unless v=1 mod N.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71. The literal level-map orientation fixes the right-action convention; use the corrected arrow directions in the proof.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md), Conventions, item 5: Full level and actions. The native row-basis convention to which the canonical model is compared.

<a id="v8-gl2-gamma1"></a>

### Gamma-one modular curve comparison

Declaration **GL2Modular.gamma1_iso** (comparison), node `ShimuraVarieties:V8/gl2-gamma1`.

For N>=4, the canonical Q-scheme at K1(N)={u in GL2(Zhat):u e1=e1 mod N} is Q-isomorphic to the fine curve Y1(N)_Q representing (E,P) with P of exact order N. The comparison is induced by the full-level forgetful map and preserves its specified point and its complex Gamma1(N) uniformization.

Hypotheses:

- N>=4; K1 fixes e1 (first column), so the row convention retains P.

Construction or proof:

1. Choose a full principal level M divisible by N with M>=3 and pass to the finite quotient of its level problem by the stabilizer of the chosen N-point.
2. Use finite-level-maps and the PR81/R12.2 fine quotient comparison to descend full_level_iso. Exact moduli representability at N>=4 eliminates automorphisms.
3. Use R12.5/R12.6 to match forgetful and diamond morphisms over Q.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary), `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Acceptance checks:

- At N=4 a point of exact order four excludes the residual minus-one automorphism.
- At N=1,2 the comparison cannot be labelled a fine universal elliptic scheme.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md), Layer 5A: Tate normal form and Y1(N) for N>=4. Imports the actual fine-moduli qualification rather than extending it to levels two or three.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29 and 13.7, pp.65,119. Canonical finite-level quotient and uniqueness.

<a id="v8-gl2-gamma0"></a>

### Gamma-zero coarse modular curve comparison

Declaration **GL2Modular.gamma0_coarse_iso** (comparison), node `ShimuraVarieties:V8/gl2-gamma0`.

For N>0, the canonical Q-scheme at K0(N)={u in GL2(Zhat):u preserves the line (Z/N)e1} is Q-isomorphic to the coarse curve Y0(N)_Q for elliptic curves with a cyclic order-N subgroup. At N=1 this is the j-line. The assertion is an isomorphism of coarse schemes, not fine representability or a bijection with rational isomorphism classes over every field.

Hypotheses:

- Characteristic zero generic fibre; N positive. The cyclic-subgroup problem and its coarse space are the actual PR81 constructions.

Construction or proof:

1. Choose full M-level with N dividing M and M>=3; use the subgroup stabilizer and its finite coarse quotient.
2. Compare this quotient with the canonical finite-level quotient from finite-level-maps, via gl2-full-level and the first-column convention.
3. Use PR81 9E and R12.2/R12.6 to identify the coarse scheme and its analytic quotient.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary), `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

Acceptance checks:

- For N=1 the j-line has elliptic objects with automorphisms; it is not a fine scheme with a universal elliptic curve.
- For N=6 use the general coarse construction, not the prime diamond-quotient theorem of Layer 10.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.6, p.100. Coarse characteristic-zero comparison; universal-family claims are deliberately excluded.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md), Layer 9E: the coarse j-line and Y0(N). The supplier of the coarse scheme, retaining elliptic stabilizers.

<a id="v8-gl2-compact-model"></a>

### Minimal compactification of the full modular curve

Declaration **GL2Modular.minimal_compact_iso** (comparison), node `ShimuraVarieties:V8/gl2-compact-model`.

For N>=3 the independently constructed proper normal coarse compact curve X_full(N)_Q from R13.4a, with its specified open Y_full(N)_Q, is the E=Q-model of the complex Baily–Borel minimal compactification for the GL2 principal-level datum, via the open isomorphism full_level_iso. This is the genus-one arithmetic compactification base case, constructed without assuming the general minimal-descent theorem.

Hypotheses:

- N>=3; the full and composite levels use the R13.4a construction. PR81 Layer 10 (prime N>=5 diamond quotients with H <= (Z/N)^×/{±1}) is not used here and supplies no full-level model.

Construction or proof:

1. R13.4a constructs the proper normal coarse compactification from generalized elliptic curves; R12.3 identifies its C-model with the independently constructed analytic modular compactification.
2. Use the full-level open comparison to specify the complex Baily–Borel identification and hence an actual Q-model containing the canonical open.
3. Normal proper-curve extension gives uniqueness. R13.4b certifies the generic-fibre component and cusp bookkeeping; it is not the source of R12.4 open connectedness.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

Acceptance checks:

- The level N=6 full compact model is supplied by R13.4a; prime-only Layer 10 cannot provide it.
- Boundary is the scheme-theoretic complement, not a hand-selected set of complex cusp points.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200. Uses the independent generalized-elliptic compact model to descend GL2 before the general compactification proof.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.20–10.21, pp.183–184. The complex compact comparison and cusp formal model.

<a id="v8-codim-one-extension"></a>

### Arithmetic codimension-one partial compactification

Declaration **CanonicalModel.codim_one_extension** (theorem), node `ShimuraVarieties:V8/codim-one-extension`.

Let D=(G,X) be a pure Shimura datum with actual canonical models and K neat. Let M_K(C)^+ ⊂ M_K(C)^min be the union of M_K(C) with the boundary strata of codimension one (Pink 8.2): it is smooth, its boundary is a smooth divisor and its complement in M_K(C)^min has codimension at least two. Then M_K(C)^+ has a unique normal E(D)-model M_K^+ containing the canonical model M_K as a dense open subscheme. The codimension-one strata come from the Q-simple factors of G^ad isomorphic to PGL2,Q, through surjections G -> PGL2,Q. When such a surjection lifts to a morphism (G,X) -> (GL2,H±), the corresponding partial extension is the scheme-theoretic closure of M_K in M_K′(G′,X′) ×_E (X_full(N)_Q ⊗ E) for (G′,X′) = (G,X)/SL2,Q (Pink 2.9), using gl2-compact-model; otherwise it is the quotient by a finite group of the corresponding extension for G̃ = G ×_{PGL2} GL2. The construction uses no torus torsor or mixed toroidal input (Pink 12.8 and ShimuraCompactifications C2 concern mixed data).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The auxiliary data (G,X)/SL2,Q and (G̃,X̃) of Pink 12.10 also carry actual canonical models; in the abelian-type lane their membership in the V5/V6 class is the recorded auxiliary-class gap.
- K is neat and the auxiliary levels are chosen as in Pink 12.10, so that the complex closed-immersion and finite-quotient statements of the recorded complex functoriality gap apply.

Construction or proof:

1. V2 and C1: the codimension-one boundary strata of M_K(C)^min belong to the rational boundary components whose parabolic is the preimage of a Borel subgroup under some G -> PGL2,Q; M_K(C)^+ is smooth with smooth boundary divisor (Pink 8.2). The strata of distinct factors are disjoint, so M_K^+ is glued along M_K from one partial extension per factor.
2. Lifted case (Pink 12.10, first paragraph): PGL2,Q lifts to an almost direct factor SL2,Q of G^der and (G,X) embeds in (G′,X′) × (GL2,H±), with E(G,X) = E(G′,X′) because E(GL2,H±) = Q. The product of the canonical model of (G′,X′) with X_full(N)_E (gl2-compact-model) is an E-model of the corresponding product partial compactification. By the complex closed-immersion statement, M_K(C)^+ is the closure of M_K(C) there; take the scheme-theoretic closure over E of the image of the descended embedding (datum-functoriality); closure commutes with the flat base change E -> C (R09.5) and closed subschemes descend (R09.3).
3. General case (Pink 12.10, second paragraph): G̃ = G ×_{PGL2} GL2 lifts, E(G̃,X̃) = E(G,X), and the complex map M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is finite surjective (H^1(A,G_m) = 0); define M_K^+ as the finite quotient of the lifted extension (finite-level-maps, R09.5), which exists by quasi-projectivity. Uniqueness: a normal model containing the dense open M_K is unique (Pink 12.6).

Direct inputs: [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), `ShimuraVarieties:V2`, `ShimuraCompactifications:C1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Acceptance checks:

- For G = GL2 itself, (G′,X′) is the two-point datum (G_m,{±1}) and M_K^+ = X_full(N)_Q, agreeing with gl2-compact-model.
- If no Q-simple factor of G^ad is PGL2,Q (for example Hilbert modular data over F ≠ Q), M_K^+ = M_K.
- No prerequisite on ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.10, pp.200–201 (author-typeset version). The lifted and general cases of the codimension-one extension for reductive P, using 12.9 for GL2, descent of closed subschemes and a finite quotient.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, p.132. Definition and properties of the partial compactification M^+(C).

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200. The GL2 case is the compactified moduli of generalized elliptic curves, supplied here by gl2-compact-model.

Remaining refinements: [Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding](#gap-v8-1), [Abelian auxiliary class for Pink 12.10](#gap-v8-2), [Log-canonical section interface on the codimension-one partial compactification](#gap-v8-6).

<a id="v8-minimal-descent"></a>

### Reflex-field descent of the minimal compactification

Declaration **CanonicalModel.minimal_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/minimal-descent`.

For a pure datum D with actual canonical open models, its normal projective complex Baily–Borel compactification M_K,C^min has a unique projective normal E(D)-model containing M_K and inducing the specified complex compactification. The theorem is for the same datum class as the supplied open models. Its construction must exhibit effective descent, not infer it solely from uniqueness of an open model.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex functoriality and auxiliary-class inputs of codim-one-extension, recorded as gaps, are supplied.

Construction or proof:

1. At neat level, codim-one-extension gives the normal E-model M_K^+ of M_K(C)^+: the open part with the codimension-one boundary strata, smooth with smooth boundary divisor and complement of codimension at least two in M_K(C)^min (Pink 8.2, 12.10).
2. On M_K^+ the sheaf omega[dlog] of top differentials with logarithmic poles along the boundary divisor is defined over E, and its global sections commute with the flat base change E -> C (R09.3). V2 (Pink 8.2, Baily–Borel 10.11): for n large, omega[dlog]^n is generated by global sections on M_K(C)^+ and the induced map extends to a closed embedding of M_K(C)^min.
3. Define M_K^min as the closure of M_K^+ in the projective space of Gamma(M_K^+, omega[dlog]^n) over E (Pink 12.12). Closure commutes with E -> C (R09.5), so its base change is M_K(C)^min; normality and projectivity descend.
4. Remove neatness by finite quotients (finite-level-maps, R09.5; Pink 12.6). Uniqueness: two normal models agreeing on the dense open M_K agree (Pink 12.6, normality and descent of morphisms).

Direct inputs: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V2/automorphic-finite-generation`](#v2-automorphic-finite-generation), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V2/koecher`](#v2-koecher), `ShimuraVarieties:V2`, [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Acceptance checks:

- When no codimension-one boundary occurs, M_K^+ = M_K and Koecher's principle makes the sections those of automorphic forms without growth condition; the closure argument is unchanged.
- For GL2 the construction agrees with gl2-compact-model.
- No prerequisite on AutomorphicBundles:B1, ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a), p.197; 12.6–12.7, pp.198–199; 12.10, pp.200–201; 12.12, p.202. The codimension-one extension and intrinsic logarithmic line make arithmetic descent effective.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, pp.132–133. The relevant ample line is the top logarithmic differential, built from complex BB geometry, not B1 canonical automorphic bundles.

Atlas planet: **Canonical minimal compactification**.

Remaining refinements: [Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding](#gap-v8-1), [Abelian auxiliary class for Pink 12.10](#gap-v8-2), [Log-canonical section interface on the codimension-one partial compactification](#gap-v8-6).

<a id="v8-minimal-map-extension"></a>

### Functoriality on minimal compactifications

Declaration **CanonicalModel.minimal_map_extension** (theorem), node `ShimuraVarieties:V8/minimal-map-extension`.

Every descended translation T_g and every admissible datum morphism has a unique extension between the corresponding minimal models over the same reflex field or specified compositum. The extensions preserve identity and composition and agree with complex Baily–Borel functoriality. In particular level maps and both Hecke legs extend. Extended level maps are finite where the complex finite-quotient theorem proves finiteness; no general étaleness across the boundary is asserted.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex extension theorem is supplied by V2/V3 with its applicable level/datum hypotheses.

Construction or proof:

1. Use minimal-descent for the source and target and V2/V3 for the complex extension.
2. On the schematically dense open, descent agrees with the known arithmetic map. Separatedness and reducedness give equality of conjugates on the whole source.
3. Apply descent of morphisms and faithful base change; finite level extensions inherit finiteness by descent. The same argument proves coherence of compositions.

Direct inputs: [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/translation-laws`](#v8-translation-laws), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), [`ShimuraVarieties:V2/minimal-level-extension`](#v2-minimal-level-extension), `ShimuraVarieties:V2`, [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- A level map may ramify at cusps even when its restriction to neat opens is étale.
- Restricting an extended correspondence to the open recovers the same ordered Hecke span.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197; 12.6, p.198. Functoriality follows only after the arithmetic compactification objects have been constructed.

Remaining refinements: [Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding](#gap-v8-1).

<a id="v8-gl2-cusps-tate"></a>

### Modular cusp loci and Tate parameters

Declaration **GL2Modular.cusp_tate_comparison** (comparison), node `ShimuraVarieties:V8/gl2-cusps-tate`.

The GL2 minimal/modular compact comparison identifies the cusp subschemes, their residue fields and their formal neighborhoods with the generalized-elliptic/Tate charts of R12.3/R12.6/R13.4b. At a chosen complex cusp of width w, the local analytic coordinate is q_c=exp(2 pi i z/w), with q=exp(2 pi i z)=q_c^w after a chosen cusp representative. Over the supplier's cusp residue field, the completed local ring of the normal curve is k(c)[[q_c]], using its chosen Tate parameter; changes of cusp representative introduce the specified roots of unity.

Hypotheses:

- N>=3 for full fine open level; other levels use their stated coarse curve and cusp stabilizers. Choose a cusp label, uniformizer and field embedding; no universal Q-rationality assertion.

Construction or proof:

1. Compare the scheme boundary by extension of the open isomorphism and R13.4b boundary identification.
2. Import R12.3 width/parameter computation and R12.6 cusp Galois fields, then match them with R13.4b formal Tate charts.
3. Use R12.1 normalization to identify the analytic exponential with the chosen Tate parameter, including roots of unity under changed representatives.

Direct inputs: [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0), `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C0/repair-analytification`.

Acceptance checks:

- At the infinity cusp of full principal level N, width is N and q=q_c^N.
- A different cusp label can have a nontrivial residue-field action; replacing the cusp scheme by a constant Q-set loses this information.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.21–10.22, pp.184–185; 12.9, p.200. The formal cusp comparison is an arithmetic deformation/Tate statement, not just an equality of complex points.

<a id="v8-gl2-tower-compatibility"></a>

### Compatibility of modular and canonical correspondences

Declaration **GL2Modular.tower_compatibility** (comparison), node `ShimuraVarieties:V8/gl2-tower-compatibility`.

The Q-isomorphisms for full, Gamma1 and Gamma0 levels commute with all admissible level maps and the ordered Hecke isogeny correspondences, with the Weil-pairing component transport dictated by row_basis_right_translation. Their compact extensions commute with the extended finite legs and the cusp/Tate charts. On coefficient sheaves, differential pullback and pull-push normalizations are precisely those of R12.5.

Hypotheses:

- Only the stated fine/coarse ranges and supplier's actual Hecke isogeny moduli are used; integral bad-prime models are not inferred.

Construction or proof:

1. R12.5/R12.6 supply the analytic/level/isogeny identities; compare each leg using gl2-full-level, row-basis-dictionary and canonical functoriality.
2. Faithful C-base change gives equality over Q. Apply minimal-map-extension and uniqueness of dense-open extension for the compact diagram.
3. Identify cusp formal maps using gl2-cusps-tate and R13.4b. Import the supplier normalization for differentials rather than redefining the Hecke operator.

Direct inputs: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate), `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For an integral unipotent at principal level the first generator stays P and the second becomes P+Q.
- For a nonintegral adelic prime isogeny, compare both legs rather than a putative automorphism of Y_full(N).
- For prime N>=5 diamonds with H <= (Z/N)^×/{±1}, verify the Layer-10 quotient range; use R13.4a for full/composite compact levels.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 5.29, pp.65–66; 6.3, pp.70–71; 13.6–13.8, pp.118–119. Arithmetic comparisons intertwine the actual finite-level maps.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197. The same compatibility persists on minimal compact models.

<a id="v8-general"></a>

## V8.general. The general-data applications

Supply V7 models to the same conditional tower and minimal constructions, including all auxiliary pure models. No second functoriality proof is introduced. General consumers retain every complex-functoriality and logarithmic-section gap.

<a id="v8-general-general-tower"></a>

### General-data canonical tower

Declaration **CanonicalTower.general_data** (theorem), node `ShimuraVarieties:V8.general/general-tower`.

For every pure Shimura datum D and every compact open K, supply the actual canonical models constructed by V7 to V8's conditional functoriality theorems. Obtain the same canonical E(D)-tower, right translations, finite level maps, effective quotients and ordered Hecke correspondences, independent up to the unique comparison of V8 of V7's auxiliary extension and special point. Datum maps are over the specified reflex-field composita.

Hypotheses:

- V7 has proved conjugation, cocycle, continuity and effective descent and has verified V4 on the resulting models. No placeholder existence witness is substituted.

Construction or proof:

1. Apply the V8 translation, tower and datum-map declarations to V7's actual schemes and comparisons.
2. Apply model-uniqueness to compare auxiliary choices; use its compatibility with maps to obtain the tower identification.
3. Use finite-level-maps and hecke-span with the effective stabilizers from V1. No second proof of canonical functoriality is introduced.

Direct inputs: [`ShimuraVarieties:V7/general-canonical`](#v7-general-canonical), [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/level-tower`](#v8-level-tower), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality).

Acceptance checks:

- The abelian-instance node has no dependency on this node.
- Choosing a non-abelian-type datum cannot be justified by relabelling a V6 model.

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 12.10, p.115; 13.6–13.8, pp.118–119. V8 applies to actual models independently of the argument establishing existence.

Atlas planet: **General-data canonical tower**.

<a id="v8-general-general-minimal"></a>

### General-data minimal compactification interface

Declaration **CanonicalModel.general_minimal** (application), node `ShimuraVarieties:V8.general/general-minimal`.

Apply codim_one_extension, minimal_defined_over_reflex and minimal_map_extension to the V7 models and the corresponding actual auxiliary pure models of Pink 12.10. This gives normal projective minimal compactifications and their functorial maps over reflex fields for all pure data; their open restriction is the general-data tower. Export these objects to C2.general and S0.general with the same complex-functoriality gap exposed.

Hypotheses:

- V7 supplies all pure auxiliary models in Pink 12.10 as well as the original datum; the complex Baily–Borel functoriality gap recorded in V8 must be discharged.

Construction or proof:

1. Instantiate codim-one-extension and minimal-descent with the V7 schemes and all auxiliary pure data; apply the existing argument, with no separate general compactification proof.
2. Instantiate minimal-map-extension and identify restrictions by general-tower and model-uniqueness.
3. Supply only this arithmetic minimal/open interface to downstream C2.general and S0.general; toroidal existence and perfectoid limits remain their own targets.

Direct inputs: [`ShimuraVarieties:V7/general-canonical`](#v7-general-canonical), [`ShimuraVarieties:V8.general/general-tower`](#v8-general-general-tower), [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension).

Acceptance checks:

- The same construction agrees with the abelian lane via model-uniqueness.
- No dependency imports the consuming C2.general toroidal model.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a)–(b), p.197; 12.10–12.12, pp.200–202. Same compactification construction specialized to the class supplied by general existence.

Remaining refinements: [Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding](#gap-v8-1), [Abelian auxiliary class for Pink 12.10](#gap-v8-2), [Log-canonical section interface on the codimension-one partial compactification](#gap-v8-6).

## Supplier contracts and remaining refinements

An exact node reference imports its statement together with its recorded gaps. It does not certify that its proof has been supplied. Stage references remain only where no finer node supplies the required interface; the contracts below state the missing output. The three remaining cross-part contracts are Level(D), the V2 partial-open/logarithmic and compactification-map refinements, and promotion of reflex-norm functoriality to a lemma node.

### Contracts originating in V0–V7

**`AdelicAlgebraicGroups:AA.3`.** Strengthen the existing arithmetic-subgroup-of-level discreteness node to: G(Q)∩aKa⁻¹ is commensurable with G(Q)∩GL_n(Z) for every faithful rational embedding and compact open K. Preserve finite-index rational component stabilizers. Import class-number-finite separately; do not replan reduction theory in V0.

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic).

**`AdelicAlgebraicGroups:AA.4`.** Extend the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or quotient-action degree. Supply finite topological level maps, the effective kernel of a normal K/K′ action, Hecke-span composition via double cosets, and the Cartesian comparison only with its precise U′L=U hypothesis. Arithmetic neatness remains owned by D5/AA.4. Distinguish the effective normal-level quotient action from the full automorphism group over the base of a disconnected cover. Specialize the existing class-set/Kneser/Hasse nodes for components; expose the integral almost-all-prime image and openness refinement of SVI 5.21.

Consumers: [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V1/holomorphic-hecke`](#v1-holomorphic-hecke), [`ShimuraVarieties:V0/simply-connected-components`](#v0-simply-connected-components).

**`ArithmeticLocallySymmetricSpaces:ALS.0`.** Properness of the symmetric-space isometry action, arithmetic finite covolume after compact ineffective factors, and the finite normalizer-index/finite automorphism theorem for torsion-free arithmetic Hermitian quotients. For weak conjugation additionally supply the precisely ranked S-arithmetic arithmeticity and superrigidity conclusions of Milne 1983 §§3.5–3.7; these additions are an explicit extension gap, not already present ALS.0 outputs.

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), [`ShimuraVarieties:V7/kazhdan-uniformization`](#v7-kazhdan-uniformization), [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation), [`ShimuraVarieties:V7/finite-rigidifying-points`](#v7-finite-rigidifying-points).

**`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.** Import the existing rational parabolic/root, maximal-torus, Weyl and reductive structural theory only. The rational real-density theorem, arithmetic images, restriction-of-scalars classification of Q-simple groups, real maximal-torus conjugacy, corrected finite-place H¹(k,Z) injectivity, adjoint Hasse principle, norm/weak-approximation assertions and root-centre identities require the specified ReductiveGroups Part II extension, recorded as a gap. The adelic ν-image/class-set and simply connected torsor inputs are imported separately from AA.4; none is claimed as an existing upstream Layer 7 output. For the exceptional §3.10 adjustment, import the exact Platonov–Rapinchuk rank-one perfection result and prove its marked-torus/central comparison; do not attribute simplicity of the full reductive Hα to it (E12).

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/special-existence`](#v4-special-existence), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/rank-one-central-separation`](#v7-rank-one-central-separation), [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum), [`ShimuraVarieties:V7/kazhdan-uniformization`](#v7-kazhdan-uniformization), [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence).

**`ReductiveGroupsPartII:RG2.0a`.** Weil restriction of affine group schemes, torus norms and their split character/cocharacter products, base-change maps and diagonal embeddings for finite field extensions. Apply these to the reflex norm and auxiliary totally real extension.

Consumers: [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting).

**`ComplexComparisonPartII:C0`.** Analytification of locally finite-type complex schemes as locally ringed spaces, including nonreduced spaces; compatibility with products, open and closed immersions, étale local isomorphisms and smooth manifolds; faithful analytic comparison of morphisms and invariant local finite quotients. The missing analytic category and gluing carrier are specified in the CA.0 ownership proposal and gap, rather than assumed to be in PR196 or retired LI.2.

Consumers: [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), [`ShimuraVarieties:V3/borel-extension`](#v3-borel-extension), [`ShimuraVarieties:V3/unique-algebraization`](#v3-unique-algebraization).

**`ComplexComparisonPartII:C2`.** Projective GAGA for coherent sheaves and ideals, section comparisons and algebraization of projective analytic data, applied to the already constructed automorphic compactification.

Consumers: [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel).

**`ComplexComparisonPartII:C4`.** Chow for closed projective analytic subspaces and graph algebraicity between proper algebraic schemes; proper graph comparison after normal-crossing compactification. The added definable-graph route requires an independent arithmetic-to-algebraic definability comparison, polarized period-map definability and Peterzil–Starchenko o-minimal Chow; route those additions to a Complex Comparison Part II extension, with gaps until certified.

Consumers: [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V2/minimal-level-extension`](#v2-minimal-level-extension), [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), [`ShimuraVarieties:V3/definable-target-comparison`](#v3-definable-target-comparison), [`ShimuraVarieties:V3/definable-borel`](#v3-definable-borel), [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization).

**`tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`.** Import Layer 0D’s already specified equivalence between finite continuous absolute-Galois sets and finite étale field schemes, with products and morphisms. Import Layer 0C’s invariant affine quotient/free-action gluing API. A general finite-group quotient of a normal quasi-projective characteristic-zero scheme still needs an invariant ample line bundle and invariant affine cover; request that exact extension from the algebraic-moduli owner rather than repeating the finite Galois-set construction in V4.

Consumers: [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/torus-model`](#v4-torus-model).

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.** Absolute arithmetic Artin reciprocity, continuity and kernel, compatibility of norms with restriction, ray class fields and generation by good primes. The upstream README §Conventions explicitly fixes arithmetic Frobenius; geometricArtin in V4 inverts that map. CM norm-kernel lemmas are proved in V5, not supplied by class field theory alone. Do not read a generic Hasse norm theorem or Chevalley’s topology on global units into Layer 11: their common-owner Part II proposal is the separate CM norm-kernel inputs gap.

Consumers: [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), [`ShimuraVarieties:V5/cm-ideal-reciprocity`](#v5-cm-ideal-reciprocity), [`ShimuraVarieties:V5/main-cm`](#v5-main-cm).

**`AlgebraicModuliForArithmeticGeometry:R09.3`.** Faithful base change and effective continuous quasi-projective descent of schemes/morphisms, including Milne 1999 Theorem 1.1 under infinite transcendence degree and its finite rigidifying-point criterion. Descend invariant closed images and finite quotient towers with compatible maps. Also expose the general characteristic-zero quasi-projective finite-group quotient through an invariant ample line bundle and invariant affine open cover; current 0C alone does not assert that general result.

Consumers: [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V4/torus-model`](#v4-torus-model), [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V6/hodge-inheritance`](#v6-hodge-inheritance), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V7/continuous-descent`](#v7-continuous-descent), [`ShimuraVarieties:V7/general-canonical`](#v7-general-canonical).

**`AlgebraicModuliForArithmeticGeometry:R09.4`.** Finite group quotient stacks with actual inertia and common-normal-refinement equivalence, for the AGHMP generic torus stack.

Consumers: [`ShimuraVarieties:V4/aghmp-stack-comparison`](#v4-aghmp-stack-comparison).

**`AlgebraicModuliForArithmeticGeometry:R09.5`.** Existence and finite quotient description of the coarse moduli scheme for the specific AGHMP finite-inertia torus stack; distinguish it from the stack.

Consumers: [`ShimuraVarieties:V4/aghmp-stack-comparison`](#v4-aghmp-stack-comparison).

**`AlgebraicModuliForArithmeticGeometry:R09.7d`.** For smooth quasi-projective schemes in characteristic zero, a smooth projective compactification whose boundary is a simple normal-crossing divisor, including the local punctured-polydisk charts after analytification. General smooth sources reduce by quasi-projective open covers.

Consumers: [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity).

**`PELModuli:M3`.** Generic rational Siegel moduli with actual polarization and integral/adelic symplectic level, including the fine/neat and coarse/non-neat distinctions, its analytic family/uniformization and the moduli map used after V3 to algebraize weight-one variations. This request uses M0–M3 only; M4 canonical models are not an input to V5.

Consumers: [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/siegel-canonical`](#v5-siegel-canonical).

**`AbelianSchemesAndArithmeticModuli:A2`.** Dual abelian schemes, rational polarizations and Rosati involutions, with E-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

Consumers: [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), [`ShimuraVarieties:V5/cm-polarization-level`](#v5-cm-polarization-level).

**`AbelianSchemesAndArithmeticModuli:A3`.** Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

Consumers: [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V5/cm-frobenius`](#v5-cm-frobenius), [`ShimuraVarieties:V5/cm-polarization-level`](#v5-cm-polarization-level).

**`AbelianSchemesAndArithmeticModuli:A4`.** Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and Lie-eigenspace comparison, including faithful action of quasi-isogenies.

Consumers: [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V5/shimura-taniyama`](#v5-shimura-taniyama).

**`AbelianSchemesAndArithmeticModuli:A5`.** The analytic equivalence of polarizable integral homological type (−1,0),(0,−1) variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is V5 after M3 and Borel; A5 must not use V5 to provide its analytic equivalence.

Consumers: [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety).

**`AbelianSchemesAndArithmeticModuli:A6`.** Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, rigidity and spreading of endomorphisms, and specialization of CM endomorphisms. For the Frobenius proof, supply the positive-characteristic rational Hom/Tate comparison or the precise Milne 10.8 substitute showing Frobenius lies in the specialized CM algebra; do not assume all geometric special-fibre endomorphisms lift.

Consumers: [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/cm-frobenius`](#v5-cm-frobenius), [`ShimuraVarieties:V5/siegel-special-cm`](#v5-siegel-special-cm).

### Contracts originating in V8

**`AlgebraicModuliForArithmeticGeometry:R09.2`.** The relative Hom scheme of cocharacters Hom(G_m, T) for the family of maximal tori T_v over the regular semisimple locus V of Lie(G), representing Deligne's incidence cover W -> V (Deligne 5.1) as a finite étale V-scheme, with its base change.

Consumers: [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields).

**`AlgebraicModuliForArithmeticGeometry:R09.3`.** Faithful field base change on morphisms; descent along C/E of morphisms fixed by Aut(C/E) (Milne 13.1) and of closed subschemes; effective polarized projective descent; flat base change of global sections of an invertible sheaf on a quasi-compact separated E-scheme; dense-open equality for reduced source and separated target.

Consumers: [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/translation-laws`](#v8-translation-laws), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension), [`ShimuraVarieties:V8/gl2-tower-compatibility`](#v8-gl2-tower-compatibility), [`ShimuraVarieties:V8/component-reciprocity`](#v8-component-reciprocity), [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension).

**`AlgebraicModuliForArithmeticGeometry:R09.5`.** Finite quotients of quasi-projective schemes by finite group actions (effective quotients), descent of finite/surjective/étale properties, normal projective curve compactifications and finite correspondences, and scheme-theoretic closure compatible with extension of fields.

Consumers: [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension).

**`InverseGaloisAndArithmeticFundamentalGroups:IG.2`.** Hilbert irreducibility for a finite étale cover over a number field with geometrically irreducible total incidence variety, prescribed nonempty real open, and linear disjointness from a fixed finite extension. Existing elementary-polynomial nodes do not state this.

Consumers: [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields).

**`ModularCurvesPartII:R12.1`.** Uniformisation E(C) ≅ C/Lambda with H_1(E,Z) = Lambda, compatible with Tate modules and full level-N bases, and the analytic formula for the scheme-theoretic Weil pairing; in particular the reference root zeta_ref = e_N(tau/N, 1/N) on C/(Z tau + Z), Im tau > 0, is independent of tau (the calibration behind E2).

Consumers: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate).

**`ModularCurvesPartII:R12.2`.** Analytic uniformization of the full ordered level N >= 3, fixed-pairing, Gamma1 (N >= 4) and coarse Gamma0 (every N > 0) curves as isomorphisms, with the ordered-basis determinant identified with the chosen root of unity. Agreement with AA.5's adelic component calculation is AA.5's own target, since AA.5 consumes R12.2.

Consumers: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0).

**`ModularCurvesPartII:R12.3`.** Cusp labels, effective stabilizers and widths, analytic parameter exp(2 pi i z/w) and its transformation under level maps.

Consumers: [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate).

**`ModularCurvesPartII:R12.4`.** Open fixed-pairing fibre geometrically connected and irreducible, deduced from Gamma(N) quotient without importing arithmetic compactification.

Consumers: [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre).

**`ModularCurvesPartII:R12.5`.** The basic isogeny correspondences on the modular curves (both legs as moduli maps), their description on the upper half-plane, and the pullback and trace normalization of the Hecke action on differentials. The adelic dictionary for nonintegral g is V8's row-basis node, not R12.5.

Consumers: [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-tower-compatibility`](#v8-gl2-tower-compatibility).

**`ModularCurvesPartII:R12.6`.** Compatibility of the analytic–algebraic comparison with level changes, diamond operators and complex conjugation; fields of definition of the components and of the canonical cusp. Residue fields of all cusps come from R13.4b.

Consumers: [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate), [`ShimuraVarieties:V8/gl2-tower-compatibility`](#v8-gl2-tower-compatibility).

**`ModularCurvesPartII:R13.4a`.** Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute Layer-10 prime diamond quotients.

Consumers: [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model).

**`ModularCurvesPartII:R13.4b`.** Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

Consumers: [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate), [`ShimuraVarieties:V8/gl2-tower-compatibility`](#v8-gl2-tower-compatibility).

**`PELModuli:M3`.** Genus-one fine full ordered-basis generic-fibre moduli scheme with N >= 3, homology/Tate comparison to the GL2/GSp2 complex double quotient.

Consumers: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity).

**`PELModuli:M4`.** Actual normalized CM action on genus-one full-level moduli and its agreement with the V4 special-pair reciprocity condition, including all determinant components.

Consumers: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity).

**`PELModuli:M5`.** The genus-one Siegel moduli and its comparison with #81's Y_full(N) (N >= 3), including the determinant/Weil-pairing convention, the basis-change determinant exponent and the cyclotomic target.

Consumers: [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity).

**`ShimuraCompactifications:C1`.** Complex rational boundary components with their parabolic subgroups and Levi quotients; the codimension-one components are those attached to surjections G -> PGL2,Q; the quotient data (G,X)/SL2,Q and (G̃,X̃) for G̃ = G ×_{PGL2} GL2 used in Pink 12.10. Arithmetic descent is V8's codim-one-extension.

Consumers: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension).

**`ShimuraVarieties:V1`.** The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither V1 nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

Consumers: [`ShimuraVarieties:V8/level-tower`](#v8-level-tower).

**`ShimuraVarieties:V2`.** Refine the complex Baily–Borel interface at neat level: the partial open M_K(C)^+ obtained by adjoining all codimension-one strata is smooth with smooth boundary divisor and complement of codimension at least two; sufficiently high powers of omega[dlog] are globally generated there and embed the full minimal compactification (Pink 8.2, BB66 10.11). Also supply the Pink 12.10 product closed immersion and finite-quotient statements and extension of datum morphisms to complex minimal compactifications. Existing rational-boundary, baily-borel, automorphic-finite-generation, koecher and minimal-level-extension nodes are cited separately and do not yet state these refinements. The arithmetic construction is V8/codim-one-extension, not a missing mixed torus-torsor input.

Consumers: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension).

**`ShimuraVarieties:V4`.** Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

Consumers: [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/component-reciprocity`](#v8-component-reciprocity).

**`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.** Connected centralizers of cocharacters, conjugacy and geometry of maximal tori, regular semisimple Lie open and compact-mod-centre real tori. Import this structure theory; the incidence specialization belongs to the requested IG.2/R09.2 contracts.

Consumers: [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields).

**`tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.** Existing full ordered-basis scheme for N >= 3 and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. R12.1/R12.2 supply the analytic comparison.

Consumers: [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary).

**`tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`.** Existing fine Gamma1 moduli scheme for N >= 4 with a point of exact order; the K1 stabilizer dictionary uses the first row-basis generator.

Consumers: [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1).

**`tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`.** Existing characteristic-zero coarse Gamma0 cyclic-subgroup moduli: Y_0(1) is the coarse j-line and, for N >= 3, Y_full(N)/B by the coarse Borel-quotient formula. No universal elliptic family is claimed.

Consumers: [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0).

**`tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.** The equivalence between finite étale K-schemes and finite continuous Gal(K^s/K)-sets over a field K, used to attach a scheme to the Galois set of formula (64).

Consumers: [`ShimuraVarieties:V8/zero-dimensional-shimura-variety`](#v8-zero-dimensional-shimura-variety).

**`tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.** Coarse moduli M([Gamma0(N)]) as a finite quotient of a rigidified representable cover, for N = 2, where 9E's Borel-quotient formula is not used.

Consumers: [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0).

### Proof and carrier gaps

The gap identifiers below are part-qualified display labels; the packet records retain their titles and consuming nodes. Every item remains open.

<a id="gap-v0-1"></a>

#### V0 G1. Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3

Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison. Encode CA.0→C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3 and list those consumers in the PR196 external record. C0/repair-analytification supplies a requested target, not a constructed carrier. The proposed CA.0 layer owns this repair and its consumer interfaces.

Consumers: [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V3/borel-extension`](#v3-borel-extension).

<a id="gap-v0-2"></a>

#### V0 G2. Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28

The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7). Encode M5/M6 or CA.0→AnalyticToricGeometry Layer 3 and M7 or CA.0→C0, with the direct V1 edge. If PR279 is tracked instead, expose those milestones as real stage ids. Update its external consumers and declared_by_areas with AnalyticToricGeometry. LI.4/LI.2 are retired and provide none of this; no edge through them remains in the packet.

Consumers: [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure).

<a id="gap-v0-3"></a>

#### V0 G3. Arithmetic and effective-level supplier extensions

AA.3/arithmetic-subgroup-of-level currently states discreteness, not the required arithmetic commensurability. AA.4 covering/freeness has a real stabilizer compact-mod-A_G hypothesis; rational central units in general Shimura data require an effective-domain extension. The two stage requests specify exactly these missing outputs.

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V1/holomorphic-hecke`](#v1-holomorphic-hecke).

<a id="gap-v0-4"></a>

#### V0 G4. Baily–Borel primary proof decomposition

Milne SVI 3.12–3.13 gives the correct proof path but explicitly says the only full proof is Baily–Borel (1966). Publisher access did not yield the full primary text. Certify §§3–4 rational boundary incidence/Satake compactness; §§5–7 Poincaré–Eisenstein convergence/restriction; §§8–10 analytic local rings/normality, separation, finite generation and graded projective realization; identify exact weight and growth conventions and finite-index boundary extension. These nodes are proof obligations, not imported theorem axioms. General rational boundary and automorphic growth signatures stay mathematically specified until this source/carrier refinement.

Consumers: [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V2/satake-compactness`](#v2-satake-compactness), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/poincare-eisenstein`](#v2-poincare-eisenstein), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), [`ShimuraVarieties:V2/automorphic-finite-generation`](#v2-automorphic-finite-generation), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V2/koecher`](#v2-koecher), [`ShimuraVarieties:V2/minimal-level-extension`](#v2-minimal-level-extension).

<a id="gap-v0-5"></a>

#### V0 G5. Borel multivariable extension proof source

SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument. Obtain the original algebraicity paper or a full public proof and certify the extension across (Δ*)ʳ×Δˢ with torsion-free effective target. Projective SNC source compactification is separately requested from R09.7d.

Consumers: [`ShimuraVarieties:V3/borel-extension`](#v3-borel-extension), [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity).

<a id="gap-v0-6"></a>

#### V0 G6. Independent definable comparison and graph suppliers

Certify the PS13/KUY16 theorem comparing the algebraic Baily–Borel definable structure with arithmetic fundamental-set charts independently of Borel algebraicity; state the o-minimal structure precisely. Import/propose a single owner for BKT period-map definability and Peterzil–Starchenko o-minimal Chow, with the corrected maximal-compact and Cartan conditions. A bare arithmetic-definable graph is not yet a graph in the algebraic-target definable structure.

Consumers: [`ShimuraVarieties:V3/definable-target-comparison`](#v3-definable-target-comparison), [`ShimuraVarieties:V3/definable-borel`](#v3-definable-borel).

<a id="gap-v0-7"></a>

#### V0 G7. Full CM spreading and specialization inputs

Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field, and the A6 positive-characteristic Hom/Tate comparison used to identify Frobenius with E. Integral eigenspace splitting in the unramified Frobenius calculation is over O_{k,P}, not globally O_k, as the published author erratum corrects.

Consumers: [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/cm-frobenius`](#v5-cm-frobenius), [`ShimuraVarieties:V5/shimura-taniyama`](#v5-shimura-taniyama).

<a id="gap-v0-8"></a>

#### V0 G8. Connected canonical symmetry and coherence

Read and specify Deligne 1979 §§2.7.10–2.7.13 completely: the adelic/Galois extension acting on the connected Qbar model, its group law, congruence completions, special reciprocity and reconstruction of finite components. The scanned 1983 appendix certifies the complex completion action only. The algebraic inverse system with completion alone is not the entire connected canonical object.

Consumers: [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence), [`ShimuraVarieties:V6/connected-products`](#v6-connected-products), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V6/abelian-canonical`](#v6-abelian-canonical), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance), [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle).

<a id="gap-v0-9"></a>

#### V0 G9. Serre/Taniyama extension common owner

MS1982c pp.229–230 and 242–243 and MS1982d p.281 were inspected, including the actual contracted product. No atlas layer owns the Serre protorus and Taniyama extension with finite-adelic section and compatible cocycle. Propose Complex Multiplication and Explicit Reciprocity, Part II, first new layer CM.S: Serre character lattice (σ−1)(c+1)χ=0, global Weil/class-formation extension, norm-compatible finite-adelic section, torsor multiplication and marked-cocharacter pushout. This is beyond existing CM.0 types/reflex types; refine the uninspected extension proof in MS1982c §§2–3. Supply CM.S→V7/conjugated-datum, with no CM.2/CM.4→V5 cycle.

Consumers: [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum), [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle).

<a id="gap-v0-10"></a>

#### V0 G10. Kazhdan exceptional uniformization proof

Milne 1983 Theorem 3.2 is a key theorem with proof references, not a full proof. Decompose Kazhdan’s universal-cover and lattice theorem for exceptional noncompact E₆/E₇/mixed D cases, including its analytic metric inputs; no general Langlands conjugation theorem can serve as an axiom. Route reusable metric results to the analytic supplier and retain this arithmetic conjugation application in V7.

Consumers: [`ShimuraVarieties:V7/kazhdan-uniformization`](#v7-kazhdan-uniformization), [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation).

<a id="gap-v0-11"></a>

#### V0 G11. S-arithmetic and central-cohomology supplier extension

ALS.0 does not yet expose Milne §§3.5–3.7: recovery of a Q-group from irreducible S-arithmetic lattices at total rank≥2, local finite-prime identifications and superrigidity. Extend ReductiveGroupsPartII for corrected Lemma 3.8: for simply connected semisimple G with no A_n factor n≥4, H¹(k,Z(G))→∏_{v finite}H¹(k_v,Z(G)) is injective; plus the adjoint Hasse principle/real localization and torus norm weak-approximation assertions used in §§6.3–6.6. Preserve the actual hypotheses; no arbitrary finite group cohomology theorem is asserted.

Consumers: [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence).

<a id="gap-v0-12"></a>

#### V0 G12. A₁ comparison and completion density

Canonical-model existence for A₁ is not itself its marked conjugation comparison. Certify the CM/Siegel comparison bridge in 1983 Remark 1.5/MS1982d §9 and its functorial inclusion. Read MS1982d §8 and corrected 1983 Proposition 6.1 for the exact finite totally real base-extension density in the congruence completion. Do not revive the deleted extra A₁-generation claim in the annotated scan.

Consumers: [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/marked-conjugation`](#v7-marked-conjugation), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance).

<a id="gap-v0-13"></a>

#### V0 G13. General quasi-projective finite quotient API

ModularCurves Layer 0D already explicitly plans the finite-continuous-Galois-set/finite-étale-field-scheme equivalence; V4 imports it. The remaining extension is the invariant ample line bundle and invariant affine-cover quotient API for a general finite-group action on a normal quasi-projective characteristic-zero scheme, supplied once by the algebraic-moduli owner. Current Layer 0C states affine/free-action cases, so it alone is not the general quotient theorem.

Consumers: [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization).

<a id="gap-v0-14"></a>

#### V0 G14. Suggested signatures requiring absent mathematical carriers

The exact mathematical declarations/API/tests are named in the reader and in the suggested file’s explicit omission manifest. The pinned libraries contain no pure Shimura datum, nilpotent complex analytic-space category/analytification, canonical model special-pair predicate, automorphic boundary section ring or connected canonical Galois extension. Their full Lean conditions cannot be stated yet. Section 13 requires omitting such conditions honestly: the compiled prototype implements the genuine double-orbit carrier and geometric Artin conversion at the native group-action/group-hom level, and gives no Prop-valued fake fields, unproved existence instances or schematic True conclusions. Restore each omitted signature when the recorded owner supplies its carrier, preserving all names and discriminating tests. Compilation certifies only the stated prototype, not the advanced mathematics. The point prototype specifies the orbit set without its quotient topology; the Artin prototype specifies inversion of a supplied homomorphism without constructing global reciprocity, profinite continuity or the literal number-field tests. Those mathematical specializations are also omitted conditions, not certified by the native tests.

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), [`ShimuraVarieties:V0/stabilizer-commensurable`](#v0-stabilizer-commensurable), [`ShimuraVarieties:V0/neat-sublevels`](#v0-neat-sublevels), [`ShimuraVarieties:V0/effective-proper-action`](#v0-effective-proper-action), [`ShimuraVarieties:V0/component-decomposition`](#v0-component-decomposition), [`ShimuraVarieties:V0/simply-connected-components`](#v0-simply-connected-components), [`ShimuraVarieties:V1/analytic-points`](#v1-analytic-points), [`ShimuraVarieties:V1/analytic-structure`](#v1-analytic-structure), [`ShimuraVarieties:V1/holomorphic-level-maps`](#v1-holomorphic-level-maps), [`ShimuraVarieties:V1/right-translation`](#v1-right-translation), [`ShimuraVarieties:V1/holomorphic-hecke`](#v1-holomorphic-hecke), [`ShimuraVarieties:V1/datum-analytic-map`](#v1-datum-analytic-map), [`ShimuraVarieties:V2/rational-boundary`](#v2-rational-boundary), [`ShimuraVarieties:V2/satake-compactness`](#v2-satake-compactness), [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring), [`ShimuraVarieties:V2/poincare-eisenstein`](#v2-poincare-eisenstein), [`ShimuraVarieties:V2/normal-analytic-compactification`](#v2-normal-analytic-compactification), [`ShimuraVarieties:V2/automorphic-finite-generation`](#v2-automorphic-finite-generation), [`ShimuraVarieties:V2/baily-borel`](#v2-baily-borel), [`ShimuraVarieties:V2/koecher`](#v2-koecher), [`ShimuraVarieties:V2/minimal-level-extension`](#v2-minimal-level-extension), [`ShimuraVarieties:V3/borel-extension`](#v3-borel-extension), [`ShimuraVarieties:V3/borel-algebraicity`](#v3-borel-algebraicity), [`ShimuraVarieties:V3/unique-algebraization`](#v3-unique-algebraization), [`ShimuraVarieties:V3/algebraic-data-maps`](#v3-algebraic-data-maps), [`ShimuraVarieties:V3/finite-quotient-algebraization`](#v3-finite-quotient-algebraization), [`ShimuraVarieties:V3/definable-target-comparison`](#v3-definable-target-comparison), [`ShimuraVarieties:V3/definable-borel`](#v3-definable-borel), [`ShimuraVarieties:V4/geometric-artin`](#v4-geometric-artin), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/reciprocity-finite-action`](#v4-reciprocity-finite-action), [`ShimuraVarieties:V4/canonical-model`](#v4-canonical-model), [`ShimuraVarieties:V4/torus-model`](#v4-torus-model), [`ShimuraVarieties:V4/aghmp-stack-comparison`](#v4-aghmp-stack-comparison), [`ShimuraVarieties:V4/special-existence`](#v4-special-existence), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V5/weight-one-algebraization`](#v5-weight-one-algebraization), [`ShimuraVarieties:V5/cm-abelian-variety`](#v5-cm-abelian-variety), [`ShimuraVarieties:V5/cm-tate-rank-one`](#v5-cm-tate-rank-one), [`ShimuraVarieties:V5/cm-number-field-model`](#v5-cm-number-field-model), [`ShimuraVarieties:V5/cm-potential-good-reduction`](#v5-cm-potential-good-reduction), [`ShimuraVarieties:V5/cm-frobenius`](#v5-cm-frobenius), [`ShimuraVarieties:V5/shimura-taniyama`](#v5-shimura-taniyama), [`ShimuraVarieties:V5/cm-ideal-reciprocity`](#v5-cm-ideal-reciprocity), [`ShimuraVarieties:V5/main-cm`](#v5-main-cm), [`ShimuraVarieties:V5/cm-polarization-level`](#v5-cm-polarization-level), [`ShimuraVarieties:V5/siegel-special-cm`](#v5-siegel-special-cm), [`ShimuraVarieties:V5/siegel-canonical`](#v5-siegel-canonical), [`ShimuraVarieties:V6/hodge-inheritance`](#v6-hodge-inheritance), [`ShimuraVarieties:V6/hodge-canonical`](#v6-hodge-canonical), [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V6/connected-full-equivalence`](#v6-connected-full-equivalence), [`ShimuraVarieties:V6/connected-products`](#v6-connected-products), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V6/abelian-canonical`](#v6-abelian-canonical), [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/rank-one-central-separation`](#v7-rank-one-central-separation), [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum), [`ShimuraVarieties:V7/kazhdan-uniformization`](#v7-kazhdan-uniformization), [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation), [`ShimuraVarieties:V7/marked-conjugation`](#v7-marked-conjugation), [`ShimuraVarieties:V7/completed-conjugation-equivariance`](#v7-completed-conjugation-equivariance), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence), [`ShimuraVarieties:V7/conjugation-cocycle`](#v7-conjugation-cocycle), [`ShimuraVarieties:V7/finite-rigidifying-points`](#v7-finite-rigidifying-points), [`ShimuraVarieties:V7/continuous-descent`](#v7-continuous-descent), [`ShimuraVarieties:V7/general-canonical`](#v7-general-canonical).

<a id="gap-v0-15"></a>

#### V0 G15. Adelic abelianization integral images

AA.4/class-set-abelianization and its simply connected Kneser/Hasse nodes are actual existing plans. For the rational-positivity specialization also expose ν(G(Q)_+)=T(Q)∩ν(Z(R)), and certify SVI 5.21: after spreading ν to a smooth model with connected kernel, Lang gives residue-field surjectivity at almost all finite primes and smooth Hensel lifting gives integral surjectivity. Combine this with local openness to show ν(K) compact open and with restricted-product surjectivity. This is an AA.4 extension request, not an RG Layer 7 theorem.

Consumers: [`ShimuraVarieties:V0/simply-connected-components`](#v0-simply-connected-components).

<a id="gap-v0-16"></a>

#### V0 G16. CM norm-kernel inputs

Milne 2007c Lemma 3.6 uses Chevalley’s theorem that the finite-idelic topology on a finite-index torsion-free subgroup of O_E× is its full profinite topology. This identifies closure(E×)/E× with a uniquely divisible group fixed by CM conjugation. Lemma 3.12 also uses the Hasse norm theorem for the cyclic quadratic CM extension E/E⁺ to turn a totally positive everywhere-local norm into a global norm. CFT Layer 11 does not state these inputs. Propose ClassFieldTheory, Part II, first new layer CFT.N, for these generic unit-topology/cyclic-norm interfaces, also consumed by the Serre-protorus construction; retain the CM-specific norm-kernel deduction in V5. Read the Chevalley and cyclic-norm primary proofs before claiming closure, and handle CM product algebras componentwise.

Consumers: [`ShimuraVarieties:V5/main-cm`](#v5-main-cm).

<a id="gap-v0-17"></a>

#### V0 G17. Connected adjoint datum convention and carrier

The Appendix (C) carrier is a connected class of S→G^ad_R, including when G is simply connected. D4/special-pair is applied to the adjoint pure datum, with the maximal torus pulled back to G. D4/central-isogeny-lift assumes a given full S-map lift and cannot provide one here: the standard PGL₂ Hodge cocharacter does not lift to SL₂. V6 must expose this connected carrier and its comparison to D4/adjoint-datum before the omitted Lean signatures are restored. The conjugated-datum signatures and tests must use this connected adjoint carrier.

Consumers: [`ShimuraVarieties:V6/connected-tower`](#v6-connected-tower), [`ShimuraVarieties:V6/central-isogeny-descent`](#v6-central-isogeny-descent), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), [`ShimuraVarieties:V7/rank-one-subdata`](#v7-rank-one-subdata), [`ShimuraVarieties:V7/conjugated-datum`](#v7-conjugated-datum).

<a id="gap-v0-18"></a>

#### V0 G18. Exceptional central adjustment and rank-one perfection

Milne 1983 §3.10, p.252, attributes absence of noncentral normal subgroups to Platonov–Rapinchuk 1979 and applies it to a reductive Hα containing the full maximal torus. The primary paper Theorem 1 (p.279) proves perfection of the three-dimensional norm-one group SL₁(D) when D is split at every finite place; its final discussion (p.282) still calls simplicity modulo centre a conjecture. The full reductive Hα need not be perfect: its derived rational subgroup is a proper noncentral normal subgroup when its central torus has positive dimension. Replace the printed argument with the exact semisimple perfection input, then prove the missing comparison that eliminates the central adjustment on the marked torus, retaining the totally real extension and all-place split hypotheses. A subgroup containing T is not interchangeable with its derived group. This remains a ReductiveGroups Part II proof-interface request, independent of corrected Lemma 3.8 centre cohomology; see E12.

Consumers: [`ShimuraVarieties:V7/weak-conjugation`](#v7-weak-conjugation).

<a id="gap-v0-19"></a>

#### V0 G19. Arithmetic reductive supplier ownership

The read upstream ReductiveGroups Layer 7 gives structural root/tori/parabolic theory, not rational real density, arithmetic images under algebraic maps, all-place torus norm obstructions or restriction-of-scalars classification with Hermitian real hypotheses. Route arithmeticity of adelic stabilizers to the existing AA.3 extension; route abelianized component images to AA.4; refine the remaining rational real-density/torus-conjugacy, Q-simple classification and cohomological/root-centre interfaces in ReductiveGroups Part II. Each use must preserve the input field, real component and centre hypotheses. These arithmetic refinements belong to Part II rather than to a duplicate of the upstream structural roadmap.

Consumers: [`ShimuraVarieties:V0/stabilizer-arithmetic`](#v0-stabilizer-arithmetic), [`ShimuraVarieties:V4/reflex-norm`](#v4-reflex-norm), [`ShimuraVarieties:V4/special-existence`](#v4-special-existence), [`ShimuraVarieties:V4/hecke-density`](#v4-hecke-density), [`ShimuraVarieties:V7/simple-connected-reduction`](#v7-simple-connected-reduction), [`ShimuraVarieties:V7/auxiliary-cm-splitting`](#v7-auxiliary-cm-splitting), [`ShimuraVarieties:V7/rank-one-central-separation`](#v7-rank-one-central-separation), [`ShimuraVarieties:V7/special-independence`](#v7-special-independence).

<a id="gap-v0-20"></a>

#### V0 G20. Exact automorphic boundary predicate

The general definition currently names Baily–Borel holomorphy/growth and a nonnegative Fourier cone without defining the all-type rational boundary charts, allowed exponents and analytic extension predicate. This is a missing definition, not just a missing convergence proof. SVI 3.13(c) specifies the Jacobian automorphy factor but does not provide that predicate. Obtain BB66’s primary definitions, state the precise predicate independently of the later compactification, and check the restriction/product API, weight-zero piece, modular weight 2n and Veronese convention. The Annals landing page https://annals.math.princeton.edu/1966/84-3/p11 exposes metadata but did not serve the full article. V2 is partial until this target is unambiguous.

Consumers: [`ShimuraVarieties:V2/analytic-automorphic-ring`](#v2-analytic-automorphic-ring).

<a id="gap-v8-1"></a>

#### V8 G1. Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding

Pink 12.10 for pure data needs, at suitable levels: (i) for a lift (G,X) -> (GL2,H±) of a surjection G -> PGL2,Q, that the embedding (G,X) -> (G′,X′) × (GL2,H±) induces a closed immersion of M_K(C)^+ into M_K′(G′,X′)(C) × M(C)^min(GL2), with image the closure of M_K(C); (ii) in general, that M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is the quotient by a finite group. minimal-map-extension also needs the extension of datum morphisms to complex Baily–Borel compactifications (Pink 3.4, 6.2 and the complex form of 12.3(b)). V2's stated targets cover the boundary stratification and level maps, not datum morphisms; no ShimuraCompactifications stage before V8 states them (C3's datum-morphism extensions are toroidal and consume V8). The arithmetic codimension-one extension itself is no longer a gap: codim-one-extension constructs it from gl2-compact-model, open canonical models, descent of closed subschemes and finite quotients, and uses no torus torsor (Pink 12.8 concerns mixed data). The natural owner of (i)–(ii) is V2.

Consumers: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension), [`ShimuraVarieties:V8.general/general-minimal`](#v8-general-general-minimal).

<a id="gap-v8-2"></a>

#### V8 G2. Abelian auxiliary class for Pink 12.10

In the abelian-type lane, Pink 12.10 needs canonical models of (G,X)/SL2,Q and of (G̃,X̃) for G̃ = G ×_{PGL2} GL2, including data in Pink's sense whose X maps non-injectively to Hom(S,G_R) (for GL2 itself, the two-point datum (G_m,{±1}) of zero-dimensional-shimura-variety). Verify that these stay in the existence class of V5/V6, or state precisely the stronger hypothesis on the actual auxiliary models; this prevents a hidden V7 dependency in the abelian lane. The logarithmic line is not part of this gap: on M_K^+ over E, omega[dlog] is defined algebraically and its sections commute with E -> C (R09.3), and V2's projective realization supplies the comparison with the complex Baily–Borel embedding.

Consumers: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8.general/general-minimal`](#v8-general-general-minimal).

<a id="gap-v8-3"></a>

#### V8 G3. Concrete canonical-model and comparison carriers at the pinned Lean baseline

Pinned Mathlib and Tau Ceti provide schemes/slice categories/functors/pullbacks/spans but no concrete pure datum, canonical reciprocity predicate, finite-adelic level tower or actual full modular-curve carrier under the audited names. Suggested theorem forms explicitly omit those not-yet-expressible conditions rather than use proposition fields or assume their conclusions. Their elaboration checks types only and is not a valid universal theorem about arbitrary schemes. Bind them to the named suppliers, restore every hypothesis and strengthen the schematic finite/proper forms to the full packet statements.

Consumers: [`ShimuraVarieties:V8/disjoint-special-reflex-fields`](#v8-disjoint-special-reflex-fields), [`ShimuraVarieties:V8/translation-descent`](#v8-translation-descent), [`ShimuraVarieties:V8/model-uniqueness`](#v8-model-uniqueness), [`ShimuraVarieties:V8/level-tower`](#v8-level-tower), [`ShimuraVarieties:V8/translation-laws`](#v8-translation-laws), [`ShimuraVarieties:V8/finite-level-maps`](#v8-finite-level-maps), [`ShimuraVarieties:V8/hecke-span`](#v8-hecke-span), [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/abelian-instance`](#v8-abelian-instance), [`ShimuraVarieties:V8/gl2-moduli-reciprocity`](#v8-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing), [`ShimuraVarieties:V8/gl2-fixed-pairing-fibre`](#v8-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/gl2-row-basis-dictionary`](#v8-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/gl2-gamma1`](#v8-gl2-gamma1), [`ShimuraVarieties:V8/gl2-gamma0`](#v8-gl2-gamma0), [`ShimuraVarieties:V8/gl2-compact-model`](#v8-gl2-compact-model), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8/minimal-map-extension`](#v8-minimal-map-extension), [`ShimuraVarieties:V8/gl2-cusps-tate`](#v8-gl2-cusps-tate), [`ShimuraVarieties:V8/gl2-tower-compatibility`](#v8-gl2-tower-compatibility), [`ShimuraVarieties:V8.general/general-tower`](#v8-general-general-tower), [`ShimuraVarieties:V8.general/general-minimal`](#v8-general-general-minimal), [`ShimuraVarieties:V8/zero-dimensional-shimura-variety`](#v8-zero-dimensional-shimura-variety), [`ShimuraVarieties:V8/component-reciprocity`](#v8-component-reciprocity), [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension).

<a id="gap-v8-4"></a>

#### V8 G4. AA.5 exact principal-level representative contract

The AA.5 plan supplies a target rather than an implemented comparison. Its GL2 principal-level calculation supplies the right target, but the literal stabilizer Gamma(N) requires determinant representatives g_c in GL2(Zhat), which normalize K(N); arbitrary finite-adelic representatives give conjugate stabilizers. Require this restriction or explicit conjugating isomorphisms in the supplying node. Do not reproduce the underlying adelic quotient in V8.

Consumers: [`ShimuraVarieties:V8/gl2-full-level`](#v8-gl2-full-level), [`ShimuraVarieties:V8/gl2-determinant-pairing`](#v8-gl2-determinant-pairing).

<a id="gap-v8-5"></a>

#### V8 G5. Compact-open level index category

The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither V1 nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

Consumers: [`ShimuraVarieties:V8/level-tower`](#v8-level-tower).

<a id="gap-v8-6"></a>

#### V8 G6. Log-canonical section interface on the codimension-one partial compactification

The V2 targets and nodes do not yet state the smooth partial-open and logarithmic global-generation interface of Pink 8.2 used in Pink 12.12. Supply M_K(C)^+, its smooth boundary divisor, codimension of the omitted strata, and the high-power logarithmic canonical section embedding. V2/koecher treats the no-PGL2 range; V2/automorphic-finite-generation does not alone identify this all-type log-canonical linear system. The existing complex-functoriality gap separately records the Pink 12.10 closed immersion/finite quotient and datum-morphism extensions. These refinements belong to V2 and do not invalidate the arithmetic partial-extension construction conditional on them.

Consumers: [`ShimuraVarieties:V8/codim-one-extension`](#v8-codim-one-extension), [`ShimuraVarieties:V8/minimal-descent`](#v8-minimal-descent), [`ShimuraVarieties:V8.general/general-minimal`](#v8-general-general-minimal).

<a id="gap-v8-7"></a>

#### V8 G7. Reflex-norm functoriality API promotion

Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

Consumers: [`ShimuraVarieties:V8/datum-functoriality`](#v8-datum-functoriality), [`ShimuraVarieties:V8/component-reciprocity`](#v8-component-reciprocity).

## Ownership refinements

The following proposals preserve the current mathematical owners until the orchestrator applies a restructuring. The V4 reading placement implements the proposed presentation of conditional foundations; it does not change node identifiers, parent stages or atlas ownership.

### Rescope: ComplexComparisonPartII

RT-AREA-algebraicgeometry/3 and /28: analytic spaces/analytification and holomorphic gluing have no mathematical owner; external PR196/279 are not encoded stages, and FoundationsAndLibraryIntegration is retired.

Insert CA.0: Complex analytic foundations before C0, with analytic local models including nilpotents, morphisms/gluing/fibre products, SGA1 analytification, smooth/étale comparison and compatible complex manifold gluing/finite-gluing topology/holomorphic bundles. Encode the consumer edges and PR196/279 external record updates listed in the two gaps. It agrees with PR196 Layers 0–2 and PR279 Milestones 5–7 if those PRs merge. CA.0 is the proposed owner of these foundations.

### Rescope: ComplexMultiplicationAndExplicitReciprocity

V7 needs the actual Serre/Taniyama torsor, not only types/reflex types or the scalar CM reciprocity theorem.

Add a Part II layer CM.S owning the Serre protorus and Taniyama extension with adelic section and norm/cocycle API. V7 owns the contracted-product Shimura twist and its comparison. Keep CM.0 types and V4 reflex-norm application, and avoid CM.2/CM.4→V5 cycles.

### Rescope: ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces

The common cohomological/rigidity inputs used in Milne 1983 are broader than the current exposed supplier scopes.

Expose the corrected finite-place centre H¹ injectivity, adjoint Hasse principle and real torus norm/weak approximation in ReductiveGroups Part II; expose precisely ranked S-arithmetic arithmeticity/superrigidity and normalizer finiteness in the locally symmetric supplier. V7 retains weak/marked conjugation and Weyl-length independence.

### Rescope: ShimuraVarieties

V6 imports the existing V8 foundational disjoint-reflex-field and conditional uniqueness nodes; their proofs depend on V1–V4, not on canonical-model existence in V6/V7. Keeping all of them behind an undifferentiated V8 stage creates a misleading stage cycle.

Read V8/disjoint-special-reflex-fields and the conditional V8 translation-descent/model-uniqueness foundation in the V4 canonical-model lane, preserving their identifiers. Actual-tower applications and V8.general remain in V8. Formal reassignment of the parent stage is a separate ownership proposal; the declaration graph is acyclic with the existing identifiers.

Pink 12.10 supplies the pure arithmetic codimension-one extension in V8; its residual complex interface belongs to V2. Mixed torus torsors remain with the mixed/toroidal development.

## Source corrections and cautions

Source-issue numbers overlap between the part packets. Qualify them by part, for example V0 E1 and V8 E1. Confirmed corrections below affect the source interpretation, not its entire theorem or publication. A rejected allegation is retained as a caution and is not applied.

### V0 ShimuraVarieties/E1: confirmed

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Lemma 3.8, printed p.250, annotated 1983 author scan.

Replace G by Z=Z(G) in both cohomology terms; preserve no A_n factor with n≥4.

The proof computes the finite centre and its Galois action and explicitly proves injectivity for H¹(k,Z). The displayed scan has the author’s handwritten Z corrections.

Verification: Confirmed in the annotated scan at p.250: the handwritten correction replaces G by its centre Z. The recorded restriction excluding Aₙ for n≥4 is essential; no unrestricted H¹(k,G) assertion is imported.

### V0 ShimuraVarieties/E2: confirmed

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), Theorem 1.1(1)–(2), author manuscript pp.3–4; corrected by author erratum §§1.1–1.3.

Fix maximal compact K for the definable structure; require the corrected morphism compatibility with K,K′ and preservation of the embedded Lie algebra by the target Cartan involution. Hodge manifolds and period maps retain their corrected canonical choice.

The erratum §1.6 gives distinct definable structures and morphisms without finite Siegel containment. The V3 alternative uses only the corrected symmetric/Hodge case.

Verification: Confirmed against the cited author manuscript and its public erratum: maximal-compact dependence and Cartan compatibility are missing from the broad functoriality claim. The packet’s fixed K∞ and corrected maps respect the erratum. This verdict is scoped to those author files, not an unread version of record.

### V0 ShimuraVarieties/E3: confirmed

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Formulas (60)–(61), p.114, SVI revised 16 September 2017.

Use the multiplicative product of the conjugate cocharacter values, not their sum.

The codomain is an arbitrary torus group, whose values admit multiplication, not addition. For G_m with μ(t)=tⁿ the Weil-restriction norm is ∏ρ ρ(a)ⁿ; summation is not a homomorphism and need not be invertible.

Verification: Confirmed at SVI p.114: the displayed expressions are written as sums although their values lie in multiplicative torus groups. The composition of Weil restriction and norm gives products; μ(t)=t detects the convention.

### V0 ShimuraVarieties/E4: confirmed

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127, more-precisely paragraph, SVI revised 16 September 2017.

The second source model is Sh⁰(G₁,X₁); quotient it by the kernel of the completion map for G₁→G₂.

The preceding assertion assumes existence for G₁. The following kernel is explicitly that of the source-to-target map; quotienting the already-target model would assume the conclusion and give the wrong tower.

Verification: Confirmed at SVI p.127: the sentence repeats G₂ in the source quotient. The isogeny goes from G₁ to G₂, so the quotient source is the G₁ model. The node uses the corrected source.

### V0 ShimuraVarieties/E5: confirmed

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(a), p.22, author article 2007c.

Use art_{E*}(s)=σ|E*ab, as in Theorem 3.10 and Lemma 3.9 immediately above.

The article defines art as the inverse of rec. An automorphism of order greater than two detects the sign; the change-of-lift lemma and stated quasi-isogeny formula both use art.

Verification: Confirmed at 2007c p.22: Remark 3.11(a) says rec where Theorem 3.10 and Proposition 3.9 use art. Since those maps are inverses, a class of order greater than two distinguishes the error. Fixed-s quasi-isogeny uniqueness uses art.

### V0 ShimuraVarieties/E6: confirmed

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 2.1(b) proof pp.16–17, author article 2007c; public author correction.

In the integral eigenspace decomposition at the good unramified prime P use O_{k,P} throughout the first two proof paragraphs, not global O_k.

Splitting E⊗k does not split O_E⊗O_k globally: conjugate roots can coincide modulo ramified primes. Localization at the unramified prime gives the needed étale eigenspaces. The V5 Frobenius proof requests this localized comparison.

Verification: Confirmed by the public author correction on 2007c.html and by the integral eigenspace argument: O_E⊗O_k does not split globally at ramified primes; localization at the chosen good unramified prime is required.

### V0 ShimuraVarieties/E7: confirmed

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Remark 1.3(c), p.2, 1999 author version, identifying Milne 1994 Lemma 3.23.

Use the finitely generated splitting criterion of Theorem 1.1 and finite rigidifying-point Corollary 1.2. The canonical system must be shown continuous before effective descent.

Remark 1.3(a) exhibits noneffective noncontinuous systems; a cocycle law by itself does not imply effectivity. V7 separates cocycle, finite rigidification, continuity and descent.

Verification: Confirmed in Descent Remark 1.3(c), with the explicit noncontinuous noneffective counterexamples in Remark 1.3(a). Theorem 1.1 and Corollary 1.2 supply the replacement criterion; cocycle, rigidity and continuity remain separate nodes.

### V0 ShimuraVarieties/E8: rejected

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.11, p.38, relative to the source’s geometrically-reduced definition of algebraic variety on pp.35–36.

The alleged correction is not adopted. Rejected as an established error against this source: the fat-point counterexample uses the broader nonreduced CA.0 category, whereas SVI Remark 3.9 specifies zero sets with a natural ringed-space structure and cites Shafarevich’s convention without explicitly saying O_U/(f₁,…,f_r). A nonreduced fat point has not been shown to belong to that source category. The reduced-versus-scheme qualification is necessary for the new carrier, but it does not by itself prove SVI’s convention-specific statement false. This rejection makes no claim that Chow/GAGA excludes nilpotents.

### V0 ShimuraVarieties/E9: confirmed

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101, revised 16 September 2017 author copy.

Absolute local inertia is not virtually pro-p. Either factor the abelian representation through local reciprocity, whose unit-group image is virtually pro-p, or use finite-extension semistable reduction and unipotent inertia. V5 uses the latter with the existing R11.3/R11.5 nodes.

For residue characteristic p, tame inertia has quotient ∏_{ℓ≠p} Z_ℓ(1); its infinite pro-ℓ quotients exclude a finite-index pro-p subgroup. Rank-one CM inertia becomes trivial after semistable extension because E⊗Q_ℓ is reduced and (ρ(σ)−1)²=0. The theorem survives; the printed step fails.

Verification: The printed claim is about absolute inertia. Its tame pro-ℓ quotient gives a direct counterexample for ℓ≠p; the corrected packet proof supplies the missing geometric input instead of assuming finiteness from compactness.

### V0 ShimuraVarieties/E10: confirmed

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Final paragraph p.127, after Proposition 14.16, revised 16 September 2017 author copy.

The final full/nonconnected reconstruction uses Theorem 14.15; Proposition 14.16 supplies products and isogenies only for connected data.

The previous sentence already obtains the connected abelian-type models by 14.16. Passing from them to the full tower is exactly the equivalence in 14.15. V6/abelian-canonical explicitly imports connected-full-equivalence.

Verification: The scopes of 14.15 and 14.16 identify the mistaken final cross-reference unambiguously. No mathematical target changes.

### V0 ShimuraVarieties/E11: confirmed

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101, E-linear representation sentence, revised 16 September 2017 author copy.

Use Gal(Qbar/K), after all E-endomorphisms are defined over K. A/K and its endomorphism action need not descend to Q.

The Tate representation of the abelian variety defined over K is of Gal(Qbar/K); its commutation with the defined E-action is what places its image in (E⊗Q_ℓ)×. There is no corresponding absolute-Q representation of that A without descent data.

Verification: The proposition’s base field is K and the E-linearity argument uses the K-defined action. The corrected V5 proof restricts to that base explicitly.

### V0 ShimuraVarieties/E12: confirmed

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §3.10, p.252, sentence citing [16]; compare the reductive subgroup definition in §4, pp.253–254. Scoped to the public annotated 1983 author scan..

The cited Platonov–Rapinchuk 1979 Theorem 1 proves perfection of the simply connected three-dimensional norm-one group when split at every finite place, not the printed simplicity claim for a full reductive group containing T. The central-adjustment proof must specify the semisimple factor and justify passage back to the marked torus. The passage from semisimple perfection to the marked-torus adjustment remains a proof gap.

In SU(4,1) over Q for Q(i)/Q with diagonal compact maximal torus, the noncompact ±α block subgroup Hα has derived SU(1,1)≅SL₂ and a positive-dimensional central torus. Its derived rational subgroup is normal, proper and noncentral, even though its semisimple factor is split at every finite place. Thus the literal assertion about this full reductive Hα is false. Independently, the primary 1979 Russian text states perfection in Theorem 1, p.279, and still calls simplicity modulo centre a conjecture on p.282. The central target is abelian, so perfection is the relevant weaker input, but the marked-torus passage is not supplied by citing it.

Verification: The full reductive Hα has a proper noncentral derived normal subgroup in the displayed unitary example. The actual cited paper supplies perfection of SL₁(D) and explicitly leaves its stronger simplicity question open; the packet now records the missing comparison as a proof gap without weakening the main target.

### V0 ShimuraVarieties/E13: confirmed

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Introduction, p.239, first reference to Langlands [8]; public annotated author scan.

Replace the page reference by [8, pp.232–233].

The public author erratum specifies the corrected Corvallis pages. This fixes source navigation, without changing a mathematical target.

Verification: The public author erratum specifies the corrected Corvallis pages. This fixes source navigation, without changing a mathematical target.

### V0 ShimuraVarieties/E14: confirmed

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Introduction, p.239, last displayed map; public annotated author scan.

Omit the second copy of G′_{A^f} in the displayed target.

The public author erratum removes this duplicate factor. The packet’s comparison target retains one finite-adelic group, consistently with Theorem 1.1.

Verification: The public author erratum removes this duplicate factor. The packet’s comparison target retains one finite-adelic group, consistently with Theorem 1.1.

### V8 ShimuraVarieties/E1: confirmed

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Example 8.9, p.100, MF v1.31 (2017).

The characteristic-zero coarse ordered level-two curve is the punctured lambda-line A¹ minus {0,1}. It is not a fine moduli scheme of all such families. The Legendre family is smooth only on the punctured line. Restrict the fine comparison in this packet to N >= 3.

The discriminant is 16 lambda²(1-lambda)². The automorphism [-1] fixes E[2]; nontrivial quadratic twists have the same geometric lambda invariant and obstruct the claimed universal property over arbitrary fields.

Verification: Checked MF v1.31, Example 8.9, p.100: it prints that A^1 is the solution for N = 2, with universal curve Y²Z = X(X−Z)(X−λZ), and that A^1 is a fine moduli variety. The Legendre curve is singular at λ = 0, 1 (discriminant 16λ²(λ−1)²), so A^1 is not even the coarse space; the quadratic twist dY² = X(X−1)(X−λ) carries the same level-2 structure and the same λ, and for j ≠ 0, 1728 and d a nonsquare it is not isomorphic over k, so E(k) → A^1(k) is not injective. Milne's Course Notes errata page (checked 2026-10-06) lists nothing for pp.98–101.

### V8 ShimuraVarieties/E2: confirmed

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemma 8.7, p.100, with its preceding arbitrary primitive-root convention, MF v1.31 (2017).

This reference basis has one fixed Weil-pairing root zeta_ref. For zeta = zeta_ref^u replace the first generator by u z/N (u a unit modulo N), or fix zeta=zeta_ref in the statement.

The ordered lattice/reference orientation fixes the pairing; the displayed generators do not vary with the arbitrary root in the preceding definition. Bilinearity gives the corrected exponent.

Verification: Checked MF v1.31, the definition before Lemma 8.7 and Lemma 8.7, p.100: E_N fixes an arbitrary primitive root ζ, but on C/(Zz+Z) with Im z > 0 the pairing e_N(z/N, 1/N) is constant in z (continuous with discrete values), a single reference root. For ζ = ζ_ref^u the displayed map lands in E_N only after replacing z/N by u z/N, by bilinearity. The Course Notes errata page lists nothing here.

### V8 ShimuraVarieties/E3: confirmed

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 6.3 proof, second paragraph, p.71, 2017 author copy.

Use a: W → V and a′: W′ → V, consistent with the setup on p.70; with q absorbed into a′, the comparison isomorphism W → W′ is (a′)⁻¹ a. Also use the corrected primed h′ and eta′ where specified in Jungin Lee’s errata. In the first paragraph use s′ in place of t′, the correction on p.70 line -3 in Jungin Lee’s list.

The printed directions make a h and a composed with eta ill-typed. The initial setup uses a: W → V, and the inverse expression for the comparison must have domain W.

Verification: Checked SVI 2017, p.71: the proof prints 'Choose isomorphisms a: V → W and a′: V → W′', while the setup on p.70 uses a: W → V, and (ah, a∘η) is only typed for a: W → V; with the corrected directions the comparison W → W′ is (a′)⁻¹∘a. Jungin Lee's list (linked from the official errata page) corrects p.70 lines −3 and −1 only, and the official page has nothing for p.71, so the arrow reversal is new.

### V8 ShimuraVarieties/E4: confirmed

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Remark 5.29(a), p.65, 2017 author copy.

For K contained in K′ the forgetful quotient map is S_K → S_K′.

Forgetting a finer level maps the smaller subgroup quotient to the larger subgroup quotient.

Verification: Checked SVI 2017, Remark 5.29(a), p.65: for K ⊂ K′ the printed map S_K′ → S_K goes the wrong way. Already corrected in Jungin Lee's list (p.65, line −6), as recorded.

### V8 ShimuraVarieties/E5: confirmed

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), The homomorphism r_x, displayed formula (60) and the final formula before Definition 12.8, p.114, 2017 author copy.

Replace the aggregation signs by products in these multiplicative torus formulas. In the r_x formula the embeddings are of E(x), the field of definition of μ_x, as specified in Jungin Lee’s errata. V8 uses the corrected V4 multiplicative reciprocity norm.

The target is the multiplicative torus; an additive sum does not define the asserted torus homomorphism. V8 imports the corrected V4 reciprocity norm.

Verification: Checked SVI 2017, (60) and the r_x formula, p.114: both are printed as sums over ρ: E → Q^a. The official errata page (sums to products, Ruida Di) and Jungin Lee's list (embeddings of E(x) in r_x) already correct them. The printed quote has been made literal (ρ and Q^a).

### V8 ShimuraVarieties/E6: confirmed

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1.3, printed p.155, published Numdam copy (page image checked).

Require U to be nonempty and F/E to be finite in the disjoint Hilbert-specialization assertion. These are precisely the hypotheses of its application in Theorem 5.1.

An empty real open has no specialization. Without finiteness of F the result is false: over E=Q, take the degree-two cover s²=t of V=A¹ minus {0}, U=(1,2), and F=Qbar. A rational specialization either splits or is a nontrivial quadratic field, which cannot be linearly disjoint from Qbar over Q.

Verification: Checked the page image of printed p.155: the lemma reads 'pour tout ouvert U ⊂ V(R) ... et toute extension F de E'. The counterexample is right: for W = {s² = t} → V = A^1 − {0} over Q, U = (1,2) and F = Qbar, each rational fibre is split or a quadratic field inside Qbar. Theorem 5.1 itself takes F finite, so the application is unaffected; empty U is trivially excluded.

### V8 ShimuraVarieties/E7: confirmed

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), Lemma 5.1.2(b), printed p.154, published Numdam copy (page image checked).

The maximal tori containing i(G_mC) are maximal tori of G_C, not of G_mC.

The centralizer and the surrounding incidence construction are in G_C; G_mC is the domain of i.

Verification: Checked the page image of printed p.154: 5.1.2(b) prints 'le schéma des tores maximaux de G_mC contenant i(G_mC)'; the tori are maximal tori of G_C, the centralizer being taken in G_C.

### V8 ShimuraVarieties/E8: confirmed

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), Hilbert specialization lemma (heading printed Lemme 5.13), p.154, and its proof p.155, published Numdam copy (page images checked).

Read the inserted lemma as 5.1.3 (following 5.1.2), and refer in its proof to its own hypotheses, not to 4.12.

The proof base changes the immediately preceding incidence-cover hypotheses; 4.12 is not that lemma.

Verification: Checked the page images of printed pp.154–155: the lemma is headed 'Lemme 5.13' between 5.1.2 and 5.2, and its proof refers to 'Les hypothèses de 4.12'; Deligne's 4.12 is a construction with a compact open subgroup and an integral lattice, unrelated, so the reference is to the lemma's own hypotheses.

### V8 ShimuraVarieties/E9: confirmed

Source: [J. S. Milne, Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Shimura varieties of abelian type, paragraph after Proposition 14.16, p.127, 2017 author copy.

The second citation should be (14.15): passing from the connected Shimura varieties Sh°(G^der, X^+) to Sh(G,X) is Theorem 14.15 (Deligne 1979, 2.7.13), not Proposition 14.16.

14.16 concerns products and isogenies of connected Shimura data only; the statement for the non-connected Sh(G,X) of abelian type is the 'if' direction of 14.15.

Verification: On p.127 the two citations in the sentence are both printed as (14.16).

## Pinned library and suggested declarations

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit marks the Shimura-variety layers as not built. The native declarations below supply carriers and generic categorical operations, not the missing Shimura constructions. Existing upstream roadmap imports name planned mathematical interfaces, not declarations already implemented at the baseline.

- `mathlib:MulAction.orbitRel` in `Mathlib/GroupTheory/GroupAction/Defs.lean`: Setoid with relation a ∈ orbit G b for a group action; no analytic structure asserted.
- `mathlib:MulAction.orbitRel.Quotient` in `Mathlib/GroupTheory/GroupAction/Defs.lean`: The quotient type by the actual orbit relation.
- `mathlib:MulAction.stabilizer` in `Mathlib/GroupTheory/GroupAction/Defs.lean`: Subgroup of group elements fixing a point.
- `mathlib:AlgebraicGeometry.Scheme` in `Mathlib/AlgebraicGeometry/Scheme.lean`: Schemes with native category and structure morphisms
- `mathlib:CategoryTheory.Over` in `Mathlib/CategoryTheory/Comma/Over/Basic.lean`: Slice category over the actual base scheme
- `mathlib:CategoryTheory.Functor` in `Mathlib/CategoryTheory/Functor/Basic.lean`: Objects, maps, identity and composition laws
- `mathlib:CategoryTheory.Over.pullback` in `Mathlib/CategoryTheory/Comma/Over/Pullback.lean`: Base-change functor on slice categories
- `mathlib:CategoryTheory.Over.pullbackId` in `Mathlib/CategoryTheory/Comma/Over/Pullback.lean`: Natural isomorphism for identity base change
- `mathlib:CategoryTheory.Over.pullbackComp` in `Mathlib/CategoryTheory/Comma/Over/Pullback.lean`: Natural isomorphism for successive base changes
- `mathlib:CategoryTheory.Limits.span` in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean`: Native ordered WalkingSpan functor
- `mathlib:CategoryTheory.Limits.spanCompIso` in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean`: Applying a functor to a span agrees naturally with the span of its images
- `mathlib:AlgebraicGeometry.IsFinite` in `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`: Native finite scheme morphism
- `mathlib:AlgebraicGeometry.IsProper` in `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`: Native proper scheme morphism
- `mathlib:AlgebraicGeometry.IsOpenImmersion` in `Mathlib/AlgebraicGeometry/OpenImmersion.lean`: Native open immersion of schemes
- `mathlib:IntermediateField.LinearDisjoint` in `Mathlib/FieldTheory/LinearDisjoint.lean`: Linear disjointness of actual intermediate fields via subalgebras

The [suggested Lean file](../suggested/ShimuraVarieties.lean) has one import block and uses these actual group-action, scheme, slice-category and field carriers. Its orbit quotient and geometric Artin inversion are genuine native slices. The tower/span constructors only package supplied models and arrows with supplied laws. The advanced scheme theorem forms omit unavailable datum, analytification, reciprocity and logarithmic conditions; they are incomplete signature sketches and must not be treated as universal theorems about arbitrary schemes. V0–V7 declarations whose signatures cannot yet be stated are listed in an explicit omission manifest, with their mathematical API and tests. Numeric proxies in V8 pin expected values but do not prove the corresponding modular transition or component identification.

## Bibliography

Exact editions and recorded source-read footprints are inherited from the part packets. The handoff distinguishes the assembly checks from those earlier source audits.

- `svi`, `milne-svi`: J. S. Milne, [Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf). Revised 16 September 2017
- `cm`: J. S. Milne, [The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf). Author article 2007c
- `action`: J. S. Milne, [The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf). Progress in Mathematics 35 (1983), pp.239–265; annotated author scan
- `descent`: J. S. Milne, [Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf). Michigan Mathematical Journal 46 (1999); author version dated 22 September 1998
- `bkt`: B. Bakker, B. Klingler, J. Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf). Author manuscript of JAMS (2020)
- `bkt-err`: B. Bakker, B. Klingler, J. Tsimerman, [Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf). Author erratum
- `aghmp`: F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Annals of Mathematics 187 (2018), pp.391–531
- `msc`: J. S. Milne and K.-y. Shih, [Langlands’s construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf). LNM 900 (1982), pp.229–260; author scan
- `msd`: J. S. Milne and K.-y. Shih, [Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf). LNM 900 (1982), pp.280–356; author scan
- `semistable`: B. Conrad, [Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf). Public Darmon CM notes (2011 directory)
- `platonov`: V. P. Platonov and A. S. Rapinchuk, [On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf). Dokl. Akad. Nauk SSSR 247:2 (1979), pp.279–282; Russian published original hosted by the coauthor
- `milne-mf`: J. S. Milne, [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf). Version 1.31, 22 March 2017
- `pink`: Richard Pink, [Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf). Author-typeset dissertation; numbering/pages of this copy
- `deligne-1971`: Pierre Deligne, [Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf). Version of record, 1970–1971, pp.123–165
- `pr81`: Tau Ceti contributors, [Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md). PR81 roadmap as present in the atlas clone on 2026-10-06

The remaining primary-source audits and exact supplier extensions are the gaps above. The complete request and restructuring register is also collected in the [assembly handoff](../handoff/ASM-ShimuraVarieties.md).
