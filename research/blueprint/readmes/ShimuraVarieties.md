# Complex Shimura varieties and canonical models

This roadmap constructs finite-level pure Shimura varieties and their Hecke maps over ℂ and over the reflex field. The arithmetic endpoint is a model satisfying reciprocity at every actual special pair, together with its complex comparison, finite-level functoriality and component Galois action. The modular examples identify these models with the existing full-level, Γ₁ and coarse Γ₀ models, including determinant components, compactifications and Tate parameters.

The construction begins with arithmetic effective quotients and their analytic structures in V0–V1. V2 constructs the Baily–Borel algebraization and complex minimal compactification, including the logarithmic section system needed for arithmetic descent. V3 proves Borel algebraicity and uniqueness, and gives the independent definable-graph route. V4 fixes torus reciprocity and the canonical-model condition. CM theory gives Siegel existence in V5; Hodge embeddings and connected derived data give abelian type in V6. General data require the marked conjugation and continuous-descent argument of V7. V8 assembles the algebraic tower conditionally on actual models and compares modular curves; V8.general applies the general existence theorem. The abelian-type route uses no V7 existence hypothesis.

This is a target-level formalisation plan. All 100 targets remain unchecked. Each definition and construction has its complete mathematical API and at least three tests: 80 API items and 48 tests in total. All ten stages have planned coverage; none is closed. The precise supplier contracts and 20 refinements below describe what the proofs still need. Suggested Lean states only the two interfaces whose carriers exist at the pins; the reader specifies the remaining mathematical targets.

## Scope and neighbouring roadmaps

The boundaries follow the atlas prerequisites and consumers and the link maps to the existing ModularCurves, NumberFieldArithmetic and ClassFieldTheory roadmaps. Existing Tau Ceti targets are imports; the comparisons here prove additional compatibility with canonical models.

| Owner | Imported input or exported interface |
| --- | --- |
| ShimuraData D2–D5 | Pure data, Hermitian domains, cocharacter/reflex-field conventions, special pairs, Siegel/Hodge/abelian-type witnesses and adelic level subgroups. V0 proves the arithmetic properties of the already defined component subgroups. Connected derived data use the adjoint S-map described below. |
| AdelicAlgebraicGroups AA.3–AA.5; ArithmeticLocallySymmetricSpaces ALS.0 | Reduction theory, class-set finiteness, neat sublevels, approximation with its hypotheses, arithmetic/effective actions and the GL₂ component computation. Required arithmeticity, positive rational abelianization and effective-action refinements stay with these owners. |
| Tau Ceti ReductiveGroups Layer 7; ReductiveGroups Part II | Root, torus, parabolic and central-isogeny structure is imported from Layer 7. Rational real density, centre cohomology, torus norm obstructions and restriction-of-scalars refinements are requested from Part II; structural root theory does not supply these arithmetic theorems. |
| ComplexComparisonPartII C0, C2, C4 | Complex analytic spaces with nilpotents, holomorphic gluing, analytification, GAGA, Chow and definable graph comparison. The proposed CA.0 foundation supplies carriers before C0; the proposal is unapplied. V2 constructs the analytic automorphic ring before algebraization. |
| AlgebraicModuliForArithmeticGeometry R09 | Effective descent, finite quotients, closure and base change, relative cocharacter schemes, Hilbert irreducibility and characteristic-zero normal-crossing compactifications. These are scheme-theoretic suppliers, not canonical-model existence assumptions. |
| AbelianSchemesAndArithmeticModuli A2–A6; NeronModelsAndSemistableAbelianVarieties R11 | Actual abelian schemes, polarizations, Hom/endomorphisms, Tate modules, weight-one analytic families, semistable reduction and Néron–Ogg–Shafarevich. V5 proves the CM and arithmetic Shimura specializations. |
| PELModuli M3–M5 | Rational moduli objects, analytic comparison, Galois action and the genus-one identification with the existing full-level modular model. V5 proves the canonical condition; V8 compares the resulting canonical tower. PEL moduli is not an axiom giving all canonical models. |
| ComplexMultiplicationAndExplicitReciprocity CM.0 and proposed CM.S | CM types, reflex types and their product-algebra norm identities come from CM.0. V5 owns the main CM theorem used here. A shared Serre/Taniyama extension owner is proposed for V7; subsequent explicit CM applications consume this roadmap, so the input must not be routed back through their subsequent layers. |
| Tau Ceti ClassFieldTheory Layer 11; NumberFieldArithmetic Layer 2 | Arithmetic Artin reciprocity and norm/restriction compatibility, ray-class prime generation and Frobenius ideals. V4 explicitly converts arithmetic reciprocity to Milne's geometric convention. |
| Tau Ceti ModularCurves; ModularCurvesPartII R12–R13 | Full ordered bases, Γ₁ and coarse Γ₀ models, analytic/homology comparisons, Hecke normalizations, generic compact curves and cusp/Tate charts. ModularCurves Layer 10's prime diamond quotients do not supply full principal-level or composite-level compactifications. R13.4a/b provide that independent base case. |
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

Names live in `TauCeti.Shimura`; names displayed without that prefix are relative to it. The conditional uniqueness foundations keep V8 parent-stage ownership but are stated after V4, before the V5–V6 existence arguments use them.

The compact-open level category has an arrow K → L exactly for K ⊂ L and is cofiltered by intersections. Conjugation is C_g(K)=g⁻¹Kg, with C_h ∘ C_g=C_{gh}; the algebraic tower uses that actual category. Current AdelicAlgebraicGroups §5.2 fixes the second row covector for its K₁ convention (c≡0,d≡1). The modular dictionary here fixes the first column vector (a≡1,c≡0), retaining the first generator of the row basis. These compact opens have the same intersection Γ₁(N) with SL₂, which supplies the identity-component computation. Basis-swap conjugation does not identify them as full adelic levels. Principal determinant representatives lie in GL₂(ℤ̂); an arbitrary determinant representative need only give a conjugate component group.

## Sources and construction route

The normalizations and canonical-model route follow Milne's *Introduction to Shimura varieties*. Baily–Borel supplies the rational boundary topology and analytic automorphic section construction; Borel's extension theorem supplies algebraicity. The logarithmic canonical system in Pink 8.2 and its codimension-one construction in 12.10 make the minimal descent in 12.12 effective. The full-ring finite-generation claim has a separate proof refinement outside the hypotheses of Baily–Borel 10.14: a finite separating subring alone does not prove it.

The alternative V3 proof uses Bakker–Klingler–Tsimerman with its corrected maximal-compact conventions. Its target comparison is certified first by Klingler–Ullmo–Yafaev 1.9 and 4.1–4.2: semialgebraic cusp coordinates, restricted analytic bounded oscillation, the real exponential and compact complex cusp charts. This argument uses the complex compactification and does not appeal to the Borel theorem it is intended to prove. The general o-minimal and complex chart interfaces belong to the requested extension of ComplexComparisonPartII C4; arithmetic toroidal models stay with ShimuraCompactifications.

AGHMP §3.1 supplies the generic finite étale torus-model comparison in V4. At neat levels the stack is represented by a scheme; at non-neat levels isotropy must be retained. Its integral maximal-level models and CM Hodge lattices are inputs for their separate arithmetic owners. Milne's CM paper, Deligne's disjoint-field and connected constructions, the annotated 1983 conjugation paper, and the continuous-descent paper supply V5–V7 and the conditional V8 foundations. Exact locators and source corrections accompany their targets below.

The declaration baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap contracts were read at `0d144d044dacebca17b654695b6f1ad58f159b27`, including AdelicAlgebraicGroups, ReductiveGroups Part II and ModularCurves. The newer analytic, vector-bundle and real-algebraic roadmaps do not supply the missing nilpotent analytic category, holomorphic gluing or general o-minimal structures. An upstream roadmap target is an import contract, never a declaration claimed to be implemented at the pin.

## Layer overview

| Layer | Target | Coverage | Planets |
| --- | --- | --- | --- |
| V0 | Arithmetic groups and finite component decompositions | planned | 5 |
| V1 | The analytic tower | planned | 6 |
| V2 | Baily–Borel algebraicity and minimal compactification | planned | 6 |
| V3 | Borel algebraicity and uniqueness | planned | 5 |
| V4 | Torus models and the canonical-model condition | planned | 6 |
| V5 | CM abelian varieties and the Siegel canonical model | planned | 6 |
| V6 | Hodge and abelian type | planned | 5 |
| V7 | General data: conjugation and descent | planned | 5 |
| V8 | The algebraic tower and modular-curve comparison | planned | 6 |
| V8.general | General-data completion interface | planned | 1 |

Read the three conditional V8 foundations adjacent to V4. Their prerequisites use V1–V4 and scheme-theoretic descent, with no V5–V7 existence premise. The tower applications use the supplied models in the corresponding existence lane.

<a id="v0"></a>

## V0. Arithmetic groups and finite component decompositions

Specialize existing arithmetic and approximation interfaces to the effective Hermitian action. Retain rational component positivity, the actual central kernel and the simply connected derived-group hypotheses.

<a id="shimuravarieties-v0-plan-stabilizer-arithmetic"></a>

### Arithmetic component stabilizers

Declaration **TauCeti.Shimura.stabilizer_arithmetic** (theorem), node `ShimuraVarieties:V0/plan/stabilizer-arithmetic`.

For a pure datum (G,X), component X⁺, compact open K and a∈G(A_f), Γ_a=G(Q)_+∩aKa⁻¹ is an arithmetic subgroup of G(Q), of finite index in G(Q)∩aKa⁻¹. Its image in the effective real automorphism group of X⁺ is arithmetic and discrete. G(Q)_+ means the inverse image of G^ad(R)^+, with compact adjoint factors removed only in the effective image.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import AA §3.4 and Reduction.levelArithmetic_commensurable for arbitrary compact-open levels and adelic representatives. Identify one integral-model level with the faithful GL_n(Z) definition of arithmeticity; request that comparison and the algebraic-image/effective-kernel specialization from AA.3. The general pairwise commensurability theorem is already planned upstream.
2. Passing to the finite-index component stabilizer preserves arithmeticity. The algebraic image theorem (Milne 3.2) and removal of the compact ineffective factor give a discrete arithmetic domain image.
3. Distinguish discreteness of Γ in all real group points from discreteness of its domain image: the latter is the input to D5/effective-free.

Direct inputs: `ShimuraData:D5/component-subgroup`, `ShimuraData:D5/effective-kernel`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `AdelicAlgebraicGroups:AA.3`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level` imports `arithmetic-subgroup-of-level` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.3` imports `AA.3` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- For GL₂ at principal N≥3, the effective stabilizer of ℍ is the image of Γ(N).
- A real-quadratic central unit can lie in Γ_a and act trivially on X⁺; no faithfulness assertion follows.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.2 and 5.13, pp.33,57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.levelArithmetic_commensurable. Imports the current pairwise level commensurability target; the faithful-integral definition and effective arithmetic-image bridge are the remaining requested specialization.

Atlas planet: **Arithmetic component stabilizers**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#refinement-3), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v0-plan-stabilizer-commensurable"></a>

### Commensurability of stabilizers

Declaration **TauCeti.Shimura.stabilizer_commensurable** (theorem), node `ShimuraVarieties:V0/plan/stabilizer-commensurable`.

For fixed G and X⁺, Γ_{a,K} and Γ_{b,L} are commensurable for arbitrary a,b∈G(A_f) and compact open K,L, since they are arithmetic in the same rational group. If b=qak with q∈G(Q)_+, k∈K and L=K, then Γ_b=qΓ_aq⁻¹, and x↦qx identifies their effective quotients.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import Reduction.levelArithmetic_commensurable for the two compact-open level arithmetic subgroups; intersect with the same finite-index rational component subgroup. This gives commensurability for arbitrary representatives, without assuming they lie in one double coset.
2. Compute the conjugation identity for b=qak, preserving the chosen component.

Direct inputs: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), `ShimuraData:D5/component-subgroup`.

Acceptance checks:

- Commensurability does not require a,b to represent the same double coset.
- Representative change uses q∈G(Q)_+ when X⁺ is fixed.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.levelArithmetic_commensurable. Already specifies the arbitrary-representative, arbitrary-compact-open commensurability used here.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v0-plan-neat-sublevels"></a>

### Shimura specialization of cofinal neat levels

Declaration **TauCeti.Shimura.neat_sublevels** (theorem), node `ShimuraVarieties:V0/plan/neat-sublevels`.

Specialize AA.4/neat-level-exists to the rational group of a pure Shimura datum: every compact open K contains a normal open K₀ of finite index that is neat in the D5 rational-conjugate sense. Apply the same supplier inside every prescribed compact open sublevel for cofinality. Existence and the normal-core construction remain owned by AA.4; this node is only the convention bridge to the Shimura tower.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import AA.4/neat-level-exists, including its normality and finite-index conclusions; do not repeat its faithful-representation congruence proof.
2. Use the checked AA.4 neat-level and D5 neat-level predicates: both require rational points in every adelic conjugate to be neat. Representation independence identifies their conventions.
3. Apply the supplier to each prescribed compact open sublevel. Neatness is stable under subgroups, so these sublevels form a cofinal system for the tower.

Direct inputs: `AdelicAlgebraicGroups:AA.4/neat-level-exists`, `AdelicAlgebraicGroups:AA.4/neat-level`, `ShimuraData:D5/neat-level`, `ShimuraData:D5/neat-representation-independence`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/neat-level-exists` imports `neat-level-exists` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4/neat-level` imports `neat-level` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- No assertion that all principal level 2 subgroups are neat.
- For GL₂ principal N≥3 use D5/gl2-congruence-neat; N=2 retains −I.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 3.5 and §5, pp.34,58. SVI gives the Shimura use of neat congruence subgroups. AA.4 owns existence; the local target imports it and identifies the D5 convention.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Neat levels in the Shimura tower**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v0-plan-effective-proper-action"></a>

### Proper effective arithmetic action

Declaration **TauCeti.Shimura.effective_proper_action** (theorem), node `ShimuraVarieties:V0/plan/effective-proper-action`.

The effective image Γ_a^eff acts properly discontinuously on X⁺; at rationally neat K it acts freely. Thus its orbit projection is a covering map locally biholomorphic once the holomorphic quotient carrier is supplied. No conclusion that Γ_a itself acts freely is drawn.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Discreteness from stabilizer-arithmetic combines with the proper symmetric-space action supplied by ALS.0.
2. Use D5/effective-free to exclude effective stabilizers at neat level. Descend charts through disjoint translates; manifold gluing is an explicit requested supplier.

Direct inputs: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), `ShimuraData:D5/effective-free`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- Central totally real units survive neatness but disappear in Γ_a^eff.
- At non-neat level elliptic fixed points remain; the quotient is an analytic space.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.1, 3.6 and 5.13, pp.32,34–35,57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Effective arithmetic action**.

Remaining refinements: [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#refinement-2), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v0-plan-component-decomposition"></a>

### Finite analytic component decomposition

Declaration **TauCeti.Shimura.component_decomposition** (theorem), node `ShimuraVarieties:V0/plan/component-decomposition`.

For every compact open K, G(Q)_+\G(A_f)/K is finite, and choice of representatives a induces ⨿_a Γ_a\X⁺ ≅ G(Q)\(X×G(A_f)/K), first as topological spaces and then as complex analytic spaces. Changing a=qbk transports the component by q, so the decomposition is independent of representatives up to the specified analytic isomorphisms.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Finite index of G(Q)_+ in G(Q) refines AA.3 class finiteness to the plus double cosets.
2. Milne 5.11–5.13 identify representatives and stabilizers by the diagonal rational action.
3. For topology use open finite adelic cosets. For analytic compatibility use the effective quotient charts and representative-change holomorphic maps.

Direct inputs: `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, [`ShimuraVarieties:V0/plan/stabilizer-commensurable`](#shimuravarieties-v0-plan-stabilizer-commensurable), [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), `ShimuraData:D2/hermitian-domain-components`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/class-number-finite` imports `class-number-finite` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.3/component-decomposition` imports `component-decomposition` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- For the GL₂ datum principal N≥3 yields φ(N) components, not φ(N)/2.
- For a torus singleton domain the components are the finite torus double quotient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemmas 5.11–5.13, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Finite component decomposition**.

Remaining refinements: [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#refinement-2), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v0-plan-simply-connected-components"></a>

### Abelianized component formula

Declaration **TauCeti.Shimura.simply_connected_components** (theorem), node `ShimuraVarieties:V0/plan/simply-connected-components`.

Assume G^der is simply connected. Put T=G/G^der and ν:G→T, T(Q)^†=ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)). Then π₀(Sh_K^an(G,X))≃T(Q)^†\T(A_f)/ν(K). Apply strong approximation only to the semisimple simply connected derived group, whose Q-simple factors have noncompact real points by SV3; never to G or a torus without hypotheses.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Specialize AA.4/class-set-abelianization to the component stabilizer G(Q)_+. The derived rational subgroup lies in G(Q)_+; retain the actual image ν(G(Q)_+).
2. Use SVI 5.18–5.20 and AA.4/hasse-principle-simply-connected to identify that image with T(Q)∩ν(Z(G)(R)). Finite-place torsors vanish by AA.4/kneser-local-torsor.
3. Import AA §4.5 abelianization-integral-lifts and finite-adelic abelianization: smooth reductive models outside finitely many primes, connected-kernel residue-field surjectivity by Lang and integral lifting by Hensel are already planned. Restricted products then give adelic surjectivity; do not plan these inputs again. The positivity identity and local openness specialization remain the AA.4 request.
4. Apply strong approximation to G^der, with noncompactness on each Q-simple real factor supplied by SV3, to make the fibres single connected arithmetic quotients. Local openness gives compact open ν(K).

Direct inputs: [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `AdelicAlgebraicGroups:AA.4/class-set-abelianization`, `AdelicAlgebraicGroups:AA.4/kneser-local-torsor`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`, `ShimuraData:D4/shimura-datum`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` imports `strong-approximation-theorem` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4/class-set-abelianization` imports `class-set-abelianization` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4/kneser-local-torsor` imports `kneser-local-torsor` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected` imports `hasse-principle-simply-connected` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- For GL₂, T(Q)^†=Q_{>0}; principal level N gives (Z/NZ)×.
- A definite quaternion norm-one group fails the real noncompactness condition.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.17, Lemmas 5.18–5.21 and component-fibre argument, pp.59–61. Lemma 5.20 identifies rational positivity; Lemma 5.21 supplies the adelic image/open-subgroup conclusions. The component-fibre argument applies strong approximation only to the derived group.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §§4.1 and 4.5, abelianization-integral-lifts, finite-adelic abelianization and class-set abelianization. Supplies the existing local torsor, almost-all integral lift and restricted-product/class-set targets; the positive rational component image remains a Shimura specialization.

Atlas planet: **Abelianized components**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Positive rational abelianization and local openness](#refinement-15).

<a id="v1"></a>

## V1. The analytic tower

Construct the analytic quotient and its maps over the actual compact-open level category. Holomorphic gluing and analytic carriers are explicit supplier requirements. Topological normal-level actions use their effective image.

<a id="shimuravarieties-v1-plan-analytic-points"></a>

### Finite-level analytic Shimura points

Declaration **TauCeti.Shimura.AnalyticPoints** (definition), node `ShimuraVarieties:V1/plan/analytic-points`.

For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.
2. Use the explicit component equivalence of V0 to specify the quotient topology and map points.

Direct inputs: `ShimuraData:D4/shimura-datum`, `AdelicAlgebraicGroups:AA.4/level-quotient`, `mathlib:MulAction.orbitRel.Quotient`, [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition).

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/level-quotient` imports `level-quotient` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Uses:

- Milne 5.13: component charts use this precise rational diagonal quotient.
- V8 level-tower: analytic comparison of algebraic level maps.

API:

- **AnalyticPoints.mk** (constructor): Send (x,a) to [x,a]_K.
- **AnalyticPoints.mk_eq** (characterisation): [x,a]_K=[y,b]_K iff ∃q∈G(Q), k∈K with y=qx and b=qak.
- **AnalyticPoints.lift** (universal-property): A function on X×G(A_f) invariant under the rational diagonal and right K actions descends uniquely; evaluation at [x,a] recovers its value.
- **AnalyticPoints.level** (functoriality): For K′⊂K send [x,a]_{K′} to [x,a]_K; identity and composition hold.

Unit tests:

- **AnalyticPoints.trivial** (degenerate): The trivial datum has one point at its unique level.
- **AnalyticPoints.torus** (compatibility): For singleton torus datum, Sh_K^pts=T(Q)\T(A_f)/K, including the rational quotient.
- **AnalyticPoints.keep_domain** (non-example): For GL₂ the fibre of one finite component is Γ_a\ℍ, an infinite set, not a singleton finite double coset.

Acceptance checks:

- For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, definition before Lemma 5.13, p.57. Supports finite-level analytic shimura points. Form the right K-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Analytic Shimura variety**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-plan-analytic-structure"></a>

### Complex analytic structure of the tower

Declaration **TauCeti.Shimura.analytic_structure** (theorem), node `ShimuraVarieties:V1/plan/analytic-structure`.

The carrier Sh_K^pts has a canonical normal complex analytic-space structure characterized componentwise by Γ_a^eff\X⁺. If K is rationally neat it is a smooth complex manifold. For general K choose neat normal K′⊂K; the analytic finite quotient by the actual K/K′ action gives the same space, independently of K′.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat level glue the quotient local charts using holomorphic transition maps.
2. For general level take invariant local holomorphic functions under finite effective stabilizers; normality follows from invariants of normal local rings.
3. Compare normal sublevels through a common neat refinement. Analytic spaces with gluing and finite quotients are requested explicitly.

Direct inputs: [`ShimuraVarieties:V1/plan/analytic-points`](#shimuravarieties-v1-plan-analytic-points), [`ShimuraVarieties:V0/plan/neat-sublevels`](#shimuravarieties-v0-plan-neat-sublevels), [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), `ComplexComparisonPartII:C0`.

Acceptance checks:

- Smoothness is asserted at neat level only.
- Infinite ineffective central kernels never enter the local finite stabilizer action.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Analytic tower**.

Remaining refinements: [Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3](#refinement-1), [Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28](#refinement-2), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-plan-holomorphic-level-maps"></a>

### Holomorphic finite level maps

Declaration **TauCeti.Shimura.holomorphic_level_maps** (theorem), node `ShimuraVarieties:V1/plan/holomorphic-level-maps`.

For K′⊂K, Sh_{K′}^an→Sh_K^an is finite and holomorphic. If K is neat it is locally biholomorphic; after algebraization in V3 it is finite étale. For K′ normal in K, the effective image H of K/K′ in Aut(Sh_{K′}^an) acts over Sh_K^an and its orbit quotient is Sh_K^an. H is a subgroup of the automorphisms over the base; it need not be the full deck group on a disconnected cover. A full deck-group formula requires the separate connected regular-cover hypotheses. For nonnormal K′ no such group formula is asserted.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.
2. Lift through component quotient charts to prove holomorphicity and local biholomorphicity at neat target.
3. Compute the kernel of K/K′ on all points; its effective image gives the finite quotient. Do not identify that image with every automorphism over the base of a disconnected cover.

Direct inputs: [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), `AdelicAlgebraicGroups:AA.4/level-covering-map`, `AdelicAlgebraicGroups:AA.4`, [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition).

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/level-covering-map` imports `level-covering-map` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4` imports `AA.4` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- The quotient-action group is H=(K/K′)/ker(action); full deck-group equality is asserted only for an appropriate connected regular cover.
- For the norm datum on G_m, principal K(3) gives one point and K(21) gives six points. The effective K(3)/K(21) action is the regular C₆ action; the full automorphism group over the one-point base is S₆.
- A neat covering source does not remove ramification over elliptic points of a non-neat target.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, p.58; finite-level consequence of the arithmetic covering supplier. Supports holomorphic finite level maps. The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel extension requested for general data.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Holomorphic level maps**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#refinement-3), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-plan-right-translation"></a>

### Holomorphic right translations

Declaration **TauCeti.Shimura.right_translation** (theorem), node `ShimuraVarieties:V1/plan/right-translation`.

For g∈G(A_f), R_g:Sh_K^an→Sh_{g⁻¹Kg}^an sends [x,a] to [x,ag]. It is a biholomorphism with inverse R_{g⁻¹}; R_h∘R_g=R_{gh} with conjugated intermediate levels. It commutes with level projections.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Check g⁻¹Kg is the target level by rewriting akg=ag(g⁻¹kg).
2. On component charts the map uses a rational representative change, hence is holomorphic.
3. Point formulas prove inverse, composition and commutation with level maps.

Direct inputs: [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), `AdelicAlgebraicGroups:AA.4/level-quotient`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/level-quotient` imports `level-quotient` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- The conjugated target is g⁻¹Kg, not gKg⁻¹ for this direction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Holomorphic Hecke translations**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-plan-holomorphic-hecke"></a>

### Holomorphic Hecke correspondences

Declaration **TauCeti.Shimura.holomorphic_hecke** (theorem), node `ShimuraVarieties:V1/plan/holomorphic-hecke`.

For K_g=K∩gKg⁻¹, the Hecke span is Sh_K^an←Sh_{K_g}^an→Sh_K^an with arrows [x,a]↦[x,a] and [x,a]↦[x,ag]. Both are finite holomorphic, and locally biholomorphic at neat K. Replacing g by k₁gk₂ gives an isomorphic span. Composition is represented by the fibre product of spans and its double-coset decomposition, retaining multiplicities and effective degrees.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the AA.4 topological span, then holomorphicity of its two factors.
2. For composition take the actual fibre product, not a single intersection level without the AA.4 product hypothesis U′L=U.
3. Enumerate the finite double cosets and identify the component isomorphisms; effective stabilizers correct raw indices.

Direct inputs: [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/hecke-cartesian`, `AdelicAlgebraicGroups:AA.4`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/hecke-correspondence` imports `hecke-correspondence` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4/hecke-cartesian` imports `hecke-cartesian` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.4` imports `AA.4` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- Both arrows have target K by the chosen K_g convention.
- Normality of a sublevel alone does not make every Hecke pullback one intersection-level variety.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Holomorphic Hecke correspondences**.

Remaining refinements: [Arithmetic and effective-level supplier extensions](#refinement-3), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-plan-datum-analytic-map"></a>

### Holomorphic maps of data

Declaration **TauCeti.Shimura.datum_analytic_map** (theorem), node `ShimuraVarieties:V1/plan/datum-analytic-map`.

A morphism f:(G,X)→(H,Y) and levels f(K)⊂L induce a holomorphic map Sh_K^an(G,X)→Sh_L^an(H,Y), [x,a]↦[f(x),f(a)], compatible with levels and translations. An injective subdatum yields a closed immersion at suitable sufficiently small levels after V3 algebraization; no closed-immersion assertion is made at arbitrary coarse levels.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Descend the equivariant map of domain and finite adelic coordinates.
2. Holomorphicity is inherited from the Hodge-domain map, then checked on component quotient charts.
3. Retain Milne 5.16 separation of stabilizers for the suitably small-level embedding, used in V6.

Direct inputs: `ShimuraData:D4/datum-morphism`, [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation).

Acceptance checks:

- A noninjective morphism need not be an embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and following clarification, pp.58–59. Supports holomorphic maps of data. Descend the equivariant map of domain and finite adelic coordinates.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v1-level-index"></a>

### Compact-open level category

Declaration **TauCeti.Shimura.Level** (definition), node `ShimuraVarieties:V1/level-index`.

For D=(G,X), Level(D) is the poset category of compact open subgroups K of G(A_f), with a unique arrow K -> L exactly when K is contained in L. Identity and composition are those of inclusion. Finite intersections give common refinements, so this nonempty category is cofiltered. For g in G(A_f), conjugation C_g(K)=g^{-1}Kg is an automorphism of this index category; C_1=id and C_h composed after C_g equals C_{gh}. The analytic and algebraic towers use this same category.

Hypotheses:

- G(A_f) has the topological-group structure imported from AdelicAlgebraicGroups Layer 1 and compact open levels from D5.
- No fixed neat subcategory or arbitrary abstract index category replaces all compact open levels.

Construction or proof:

1. Use the existing subgroup inclusion order and its poset category on the subtype of compact open subgroups.
2. The intersection of two compact open subgroups is compact and open. At least one compact open exists by the adelic integral model; use intersections for the cofiltered cone.
3. Conjugation is a homeomorphism and an order isomorphism, so it preserves the subtype; multiplication computes the composition order.

Direct inputs: `ShimuraData:D5/neat-level`, `AdelicAlgebraicGroups:AA.4/level-quotient`, `mathlib:CategoryTheory.Functor`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/level-quotient` imports `level-quotient` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Uses:

- ShimuraVarieties:V8/plan/level-tower: Provides the actual index of the canonical tower and its conjugation natural transformations..

API:

- **Level.hom_iff** (characterisation): An arrow K -> L exists exactly when K is contained in L, and then its hom set has one element.
- **Level.id_comp** (functoriality): Identity is reflexive inclusion and composition is transitive inclusion.
- **Level.inf_refines** (compatibility): K intersect L is a compact open level with arrows to K and L.
- **Level.cofiltered** (structure): Level(D) is nonempty and cofiltered; parallel arrows already agree.
- **Level.conjugate** (functoriality): C_g sends K to g^{-1}Kg and inclusion to conjugated inclusion; C_{g^{-1}} is its inverse.
- **Level.conjugate_comp** (simp): C_1=id and C_h composed after C_g=C_{gh}, on objects and arrows.

Unit tests:

- **Level.trivial** (degenerate): For the trivial group the compact-open level category has one object and its identity arrow.
- **Level.nested** (compatibility): In the additive p-adic local model, p^2 Z_p -> p Z_p -> Z_p composes to p^2 Z_p -> Z_p. Forgetting arrows in the opposite direction fails.
- **Level.intersection** (computation): The common refinement of p Z_p and p^2 Z_p is p^2 Z_p; it maps to both.
- **Level.noncompact_top** (non-example): For the real additive local model the whole group R is an open subgroup but is not compact and is excluded. The adelic analogue likewise excludes the full noncompact G(A_f).

Acceptance checks:

- An arrow goes from the smaller subgroup to the larger one, matching the forgetful map.
- Conjugation changes the index; a general g gives no automorphism at a fixed K.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58; 5.29(a)–(b), p.65. The inclusions and conjugated levels defining the finite-level inverse system. The poset-category packaging is an owned deduction from these maps.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Compact-open levels**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v2"></a>

## V2. Baily–Borel algebraicity and minimal compactification

Construct rational boundary charts and the Satake topology before defining automorphic growth. Interpolation and normal analytic models give the projective algebraization. Complex minimal functoriality, codimension-one auxiliary data and the logarithmic linear system are owned here; the arithmetic model is a V8 target.

<a id="shimuravarieties-v2-plan-rational-boundary"></a>

### Rational boundary components and incidence

Declaration **TauCeti.Shimura.rational_boundary** (theorem), node `ShimuraVarieties:V2/plan/rational-boundary`.

Let D be the effective Hermitian symmetric domain of a rational semisimple adjoint group. A boundary component F in its bounded realization is rational precisely when its normalizer N(F), viewed as an algebraic subgroup, is defined over Q. For a Q-simple noncompact factor these are the proper maximal rational parabolics; for products take products of boundary components, allowing an interior factor. The image Γ(F) of N(F)∩Γ in N(F)/Z(F), where Z(F) fixes F pointwise, is an arithmetic discontinuous group on the Hermitian domain F. Construct the standard unbounded realization S_F of D and the holomorphic projection π_F:D→F. In adapted coordinates the ambient Jacobian determinant of each normalizer element is constant on π_F-fibres and induces an equivariant boundary line factor. The rational extension D*=D∪⋃F uses just these rational components, with their bounded-realization closure incidence.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use BB §§3.5–3.7 to identify rationality by the Q-defined normalizer and to obtain Γ(F). Relative rational roots and parabolics are imported from the reductive supplier; complete classification interfaces are the recorded refinement.
2. Construct S_F and π_F by the adapted Cayley/Siegel realization. BB §§1.8–1.11 and 3.3(ii) show that normalizer Jacobians descend along π_F, and that compatible realization changes identify the induced factors.
3. Use BB §§3.8–3.9 for nested boundary components and their simultaneous standard realizations; use the product decomposition of §§3.3(i), 8.9 for general semisimple domains.

Direct inputs: `ShimuraData:D2/hermitian-domain-components`, `ShimuraData:D3/borel-embedding`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite` imports `parabolic-double-cosets-finite` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- Let D be the effective Hermitian symmetric domain of a rational semisimple adjoint group. A boundary component F in its bounded realization is rational precisely when its normalizer N(F), viewed as an algebraic subgroup, is defined over Q. For a Q-simple noncompact factor these are the proper maximal rational parabolics; for products take products of boundary components, allowing an interior factor. The image Γ(F) of N(F)∩Γ in N(F)/Z(F), where Z(F) fixes F pointwise, is an arithmetic discontinuous group on the Hermitian domain F. Construct the standard unbounded realization S_F of D and the holomorphic projection π_F:D→F. In adapted coordinates the ambient Jacobian determinant of each normalizer element is constant on π_F-fibres and induces an equivariant boundary line factor. The rational extension D*=D∪⋃F uses just these rational components, with their bounded-realization closure incidence.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §3.3(ii), pp.470–472; §§3.5–3.7, pp.472–474; §§1.8–1.11, pp.454–457; §8.9, pp.512–514. Gives the rational normalizer criterion, arithmetic boundary group and adapted Jacobian/projection needed to define boundary restriction.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Rational boundary components**.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-satake-compactness"></a>

### Satake topology and compactness

Declaration **TauCeti.Shimura.satake_compactness** (theorem), node `ShimuraVarieties:V2/plan/satake-compactness`.

Equip D* with the rational Satake topology constructed by transporting the natural closures of arithmetic fundamental sets and their rational translates (BB §§4.8–4.9). It is independent of the chosen reduction fundamental set, restricts to the usual topology on every Hermitian stratum and makes rational domain automorphisms continuous. For x in a rational stratum F, good neighborhoods U form a basis: U is Γ_x-invariant, γU∩U is empty for γ∉Γ_x, and a rational stratum F′ meets U precisely when F lies in its natural closure. For arithmetic Γ the quotient Γ\D* is compact Hausdorff with open dense Γ\D and finitely many arithmetic boundary strata; closure is given by the rational incidence relation.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct the topology from closures of finitely many rationally translated Siegel domains, using AA.3 finite-cover and finite-overlap reduction. BB §4.9 proves independence, rational invariance and orbit separation.
2. Shrink at each boundary point to obtain the isotropy and incidence conditions of BB §§4.9(iv), 4.10. These good neighborhoods supply the local boundary-extension predicate without an analytic compactification assumption.
3. Apply BB §4.11 to the finitely many parabolic arithmetic orbits: fundamental-set compactness gives compactness, orbit separation gives Hausdorffness, and boundary incidence gives the closure of each quotient stratum. Exact topological/reduction interfaces remain the refinement in the gap register.

Direct inputs: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover` imports `real-siegel-finite-cover` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap` imports `real-siegel-finite-overlap` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- Equip D* with the rational Satake topology constructed by transporting the natural closures of arithmetic fundamental sets and their rational translates (BB §§4.8–4.9). It is independent of the chosen reduction fundamental set, restricts to the usual topology on every Hermitian stratum and makes rational domain automorphisms continuous. For x in a rational stratum F, good neighborhoods U form a basis: U is Γ_x-invariant, γU∩U is empty for γ∉Γ_x, and a rational stratum F′ meets U precisely when F lies in its natural closure. For arithmetic Γ the quotient Γ\D* is compact Hausdorff with open dense Γ\D and finitely many arithmetic boundary strata; closure is given by the rational incidence relation.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§4.8–4.11, pp.482–484. Provides the topology, good neighborhoods and compact quotient before analytic normality or algebraization.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Satake compactification**.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-analytic-automorphic-ring"></a>

### Analytic automorphic graded ring

Declaration **TauCeti.Shimura.AutomorphicRing** (definition), node `ShimuraVarieties:V2/plan/analytic-automorphic-ring`.

Let Γ be a torsion-free effective arithmetic group on D, with rational extension D* and Satake topology from rational-boundary and satake-compactness. For n≥0, A_n(Γ) consists of Γ-invariant holomorphic sections ω of K_D^⊗n satisfying the following boundary predicate. Write ω=f(z)(dz₁∧⋯∧dz_d)^⊗n in domain coordinates, so f(γz)det(Dγ_z)^n=f(z). For every rational boundary component F and every rational domain automorphism q carrying F to a standard component F_b, express the transported ω by its scalar coefficient f_{F,q} in the standard unbounded realization S_b of D. Require a holomorphic f^∂_{F,q}:F_b→C such that f_{F,q} on D and f^∂_{F,q} on F_b together define a continuous function on D∪F_b with its subspace Satake topology. Transport uses the canonical-section Jacobian rule, not the unchanged coefficient in a bounded chart. Equivalently, on every good neighborhood of x∈D*, an adapted coefficient extends continuously to the whole neighborhood and holomorphically on each rational stratum meeting it (BB §§8.3–8.5). For a product domain use adapted product realizations, with compact factors unchanged. The extension defines Φ_Fω in the n-th tensor power of the boundary factor ℰ_F induced from the ambient Jacobian along π_F, not in general K_F^⊗n. Define A(Γ)=⊕_{n≥0}A_n(Γ), with pointwise tensor product and constant unit. A cusp form has Φ_Fω=0 for every proper rational F, an additional condition. A positive common tensor power gives a Veronese ring; its projective comparison is proved after finite generation.

Hypotheses:

- D has the rational semisimple effective presentation of V0 and rational boundary data of V2; Γ is arithmetic, effective and torsion-free.
- The Satake topology and adapted unbounded realizations are constructed before this definition. No analytic or algebraic structure on Γ\D* is assumed in its boundary predicate.
- The convention uses a left domain action and canonical-section pullback; coordinate changes of coefficients include their determinant to the n-th power.

Construction or proof:

1. Use the derivative cocycle for K_D and the adapted π_F-fibre-constant determinants of rational-boundary to construct ℰ_F. BB §8.2 identifies this induced boundary factor under rational and nested realization changes.
2. Define admissibility by continuous extension in the subspace Satake topology and holomorphy on F. BB §8.3 proves independence of q and compatible unbounded coordinates; §§8.4–8.5 prove equivalence with the good-neighborhood predicate, including all incident strata.
3. Uniqueness on the dense interior gives compatible restriction Φ_F. Multiplying the extended coefficient functions preserves continuity and stratum holomorphy, hence grading and product restriction. Pullback to finite-index arithmetic subgroups preserves the predicate.
4. Use BB §8.9 to pass from Q-simple factors to their products and finite-index arithmetic groups, with compact factors unchanged. Once normal-analytic-compactification is proved, admissible degree-zero functions are holomorphic on a compact connected normal analytic space, hence constant.

Direct inputs: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/satake-compactness`](#shimuravarieties-v2-plan-satake-compactness), [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), `ShimuraData:D3/homogeneous-variation`, `ComplexComparisonPartII:C0`.

Uses:

- V2 projective-realization: the graded analytic sections construct the projective embedding without an algebraic bundle assumption.
- AutomorphicBundles:B2: compares the algebraized bundle/section ring with this analytic construction.

API:

- **AutomorphicRing.degree** (data): The degree-n piece is exactly the admissible analytic section space A_n(Γ) defined by the boundary predicate. After normal-analytic-compactification, A_0=C on a connected quotient by compactness and the maximum principle.
- **AutomorphicRing.mul** (structure): Multiplication A_m×A_n→A_{m+n} is pointwise tensor product; unit and associativity hold.
- **AutomorphicRing.siegel** (projection): For a rational F, Φ_F sends A_n(Γ) to (N(F)∩Γ)-invariant holomorphic sections of ℰ_F^⊗n, the factor induced by the ambient determinant along π_F. Retain the normalizer action on the factor; use the Γ(F) action when it descends, after a common tensor power if necessary to kill finite characters. It is complex-linear and Φ_F(ωη)=Φ_F(ω)Φ_F(η) in the induced grading. Transport and nested restriction commute under the specified factor isomorphisms; no equality with K_F^⊗n is asserted.
- **AutomorphicRing.level** (functoriality): For Γ′⊂Γ, pullback embeds A_n(Γ) into A_n(Γ′); identity and composition hold.
- **AutomorphicRing.veronese** (compatibility): Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.
- **AutomorphicRing.mk** (constructor): A holomorphic canonical n-section satisfying Γ-invariance and continuous, stratum-holomorphic extension in every rational adapted chart defines an element of A_n; evaluation returns the supplied section.
- **AutomorphicRing.ext** (extensionality): Two elements of A_n are equal if their holomorphic section values agree at every point of D.
- **AutomorphicRing.eval** (projection): Evaluation on D is complex-linear on each degree and carries the graded product to pointwise multiplication.
- **AutomorphicRing.integral_iff** (characterisation): Global boundary admissibility is equivalent to integral local sections on every good neighborhood: one adapted coefficient extends continuously over the whole neighborhood and holomorphically on each incident rational stratum. The rational-chart condition and this local condition use only D* topology and the induced factors.
- **AutomorphicRing.change_chart** (compatibility): Changing the rational transport or a compatible unbounded realization carries an admissible coefficient and its boundary limits to the new ones by the canonical Jacobian transition. Thus the extension predicate and induced boundary section are independent of those choices, via the ℰ_F factor isomorphism.

Unit tests:

- **AutomorphicRing.degree_zero** (degenerate): On a connected compactification the degree-zero piece consists of constants.
- **AutomorphicRing.elliptic_weight** (compatibility): For ℍ the canonical n-th automorphy factor corresponds to scalar modular weight 2n, with holomorphy at cusps.
- **AutomorphicRing.not_cusp** (non-example): For the torsion-free principal group Γ(3)⊂SL₂(Z), the restriction of E₄ is an allowed weight-4 (degree-two) form, with constant Fourier coefficient 1 at infinity. It is not a cusp form.
- **AutomorphicRing.pole_at_cusp** (non-example): The modular j-function is holomorphic on ℍ and Γ(3)-invariant in degree zero, but its q^−1 pole at infinity has no continuous finite boundary limit. It is excluded from A_0. Holomorphy and the interior transformation law alone are insufficient.
- **AutomorphicRing.induced_weight** (computation): For the genus-two Siegel domain, det(Dγ_Z)=det(CZ+D)^−3, so canonical degree n has scalar weight 3n. Restriction to a genus-one rational boundary retains scalar weight 3n, whereas intrinsic boundary canonical degree n has weight 2n. At n=2 the induced weight is 6, corresponding to intrinsic boundary degree 3, not degree 2. A Φ_F API replacing ℰ_F^⊗n by K_F^⊗n fails this calculation.

Acceptance checks:

- The predicate quantifies over every rational boundary component and rational adapted chart, uses the previously constructed Satake topology, and is independent of the subsequent analytic/projective compactification.
- Chart changes retain the canonical Jacobian factor; Φ_F has values in the ambient-induced boundary factor, with product compatibility. It need not preserve intrinsic boundary canonical weight.
- Degree-zero constants, modular weight 2n, noncuspidal E₄ at Γ(3), a cusp pole, and genus-two boundary weight must satisfy the tests below.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§8.2–8.5, pp.509–511; §8.7, p.512; §8.9, pp.512–514. Defines the induced boundary factor and continuous, stratum-holomorphic extension in adapted realizations; supplies local/global equivalence and product reduction before algebraization.

Atlas planet: **Automorphic graded ring**.

Remaining refinements: [Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3](#refinement-1), [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-poincare-eisenstein"></a>

### Automorphic sections separating strata

Declaration **TauCeti.Shimura.poincare_eisenstein** (theorem), node `ShimuraVarieties:V2/plan/poincare-eisenstein`.

For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of Γ\D* and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Form sufficiently high-weight Poincaré–Eisenstein series in adapted realizations. AA.3 reduction and BB §§6–7 provide the normal majorants on truncated Siegel neighborhoods; the exact inequalities/convergence proof remain a refinement.
2. BB §8.6 gives integral boundary extension and surjection to the boundary Poincaré-series space for the induced factor, with vanishing on the specified other strata. BB §§8.7–8.8 give admissible boundary Taylor interpolation and point separation; §8.9 extends this to products and finite-index groups.
3. Use that interpolation in the local analyticity criterion and projective comparison of §§9–10. Prescribing boundary Poincaré series is not a claim that every arbitrary boundary holomorphic function lifts; the induced factor and high/divisible-weight hypotheses are retained.

Direct inputs: [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/satake-compactness`](#shimuravarieties-v2-plan-satake-compactness), `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover` imports `real-siegel-finite-cover` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- Point separation alone does not assert an immersion or analytic closed embedding.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Theorem 8.6, pp.511–512; §§8.7–8.9, pp.512–514; §§7.7–7.9, pp.506–508 (convergence proof refinement). Identifies the precise boundary restriction and separation route; the majorant estimates and analytic-germ argument remain proof refinements.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-normal-analytic-compactification"></a>

### Normal analytic Baily–Borel quotient

Declaration **TauCeti.Shimura.normal_analytic_compactification** (theorem), node `ShimuraVarieties:V2/plan/normal-analytic-compactification`.

On the compact Satake quotient Γ\D*, let O(U) be the continuous complex functions on U whose restrictions to every arithmetic Hermitian stratum are holomorphic. This sheaf makes Γ\D* a normal complex analytic space, with its original analytic open stratum Γ\D and the specified holomorphic stratum restriction maps. Its structure agrees with the projective realization by sufficiently high-weight integral automorphic sections.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Define the sheaf by continuity and stratum holomorphy, before projective algebraization. Use local ratios of integral sections with nonzero denominator and the boundary interpolation from poincare-eisenstein.
2. Apply BB §9 analyticity criterion to obtain the normal local analytic models; §10.4 verifies its hypotheses for the Satake quotient. The complete local criterion proof and normality interfaces remain recorded refinements.
3. BB §§10.6–10.11 compare local rings with the section-built projective charts. Finite analytic invariants extend the result to arithmetic groups with torsion; invariants are not replaced by an orbifold point-set carrier.

Direct inputs: [`ShimuraVarieties:V2/plan/poincare-eisenstein`](#shimuravarieties-v2-plan-poincare-eisenstein), [`ShimuraVarieties:V2/plan/satake-compactness`](#shimuravarieties-v2-plan-satake-compactness), `ComplexComparisonPartII:C0`.

Acceptance checks:

- On the compact Satake quotient Γ\D*, let O(U) be the continuous complex functions on U whose restrictions to every arithmetic Hermitian stratum are holomorphic. This sheaf makes Γ\D* a normal complex analytic space, with its original analytic open stratum Γ\D and the specified holomorphic stratum restriction maps. Its structure agrees with the projective realization by sufficiently high-weight integral automorphic sections.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(a), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; §§10.6–10.11, pp.521–523; §§9.6–9.7, pp.517–518. States the normal analytic structure and projective comparison; the full §9 analyticity-criterion proof remains an explicit refinement.

Remaining refinements: [Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3](#refinement-1), [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-automorphic-finite-generation"></a>

### Finite generation of automorphic forms

Declaration **TauCeti.Shimura.automorphic_finite_generation** (theorem), node `ShimuraVarieties:V2/plan/automorphic-finite-generation`.

The analytic graded C-algebra A(Γ) is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize Γ\D* as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the boundary interpolation and normal analytic compactification to construct high-weight point-separating forms and the holomorphic projective map (BB §§10.6–10.8).
2. BB §§10.9–10.11 construct a finitely generated integrally closed graded subring from a finite separating system and its normalization, and identify its projective spectrum with the analytic compactification. This subring is not by definition the entire admissible ring A.
3. In the range with no three-dimensional Q-normal subgroup, BB Theorem 10.14 identifies the full holomorphic automorphic ring and proves finite generation via algebraic coherent sheaves on the projective realization. For modular-curve factors prove the corresponding identification with cusp-regular logarithmic canonical sections, then handle products and finite arithmetic quotients. These full-ring identifications remain the recorded proof refinement; existence of a finite separating subring alone does not establish them.
4. Check Proj invariance under positive Veronese and finite arithmetic invariants, retaining the tensor and character conventions fixed in analytic-automorphic-ring.

Direct inputs: [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), [`ShimuraVarieties:V2/plan/poincare-eisenstein`](#shimuravarieties-v2-plan-poincare-eisenstein), `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- The weight-one piece need not itself generate the ring.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(c), pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§10.6–10.11 and Theorem 10.14, pp.521–524. The earlier sections construct the normalized finite separating subring and its projective realization. Theorem 10.14 supplies full-ring finite generation under its additional exclusion of three-dimensional Q-normal subgroups; the modular-curve and mixed-factor cases need the recorded separate comparison.

Atlas planet: **Baily–Borel projective realization**.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-baily-borel"></a>

### Baily–Borel algebraization

Declaration **TauCeti.Shimura.baily_borel** (theorem), node `ShimuraVarieties:V2/plan/baily-borel`.

Every finite-level analytic Shimura variety has a normal quasi-projective C-scheme algebraization, smooth at neat level, with open immersion into its normal projective minimal compactification. Analytification identifies the compactification with the compact rational Satake quotient and identifies its algebraic boundary strata with the analytic arithmetic boundary quotients.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply Chow to the projective analytic realization and its boundary closed subspaces, importing C4 rather than reproducing it.
2. Normality and the open-stratum analytic comparison supply the quasi-projective open scheme.
3. Use projective GAGA for the coherent ideal and section comparisons; glue the finite components.

Direct inputs: [`ShimuraVarieties:V2/plan/automorphic-finite-generation`](#shimuravarieties-v2-plan-automorphic-finite-generation), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`, [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), `mathlib:AlgebraicGeometry.Scheme`.

Acceptance checks:

- Projective minimal compactifications may be singular even at neat level.
- The construction uses analytic automorphic forms before automorphic-bundle algebraization.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.12 and Remark 3.13, pp.38–39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; Theorem 10.11, p.523; §4.11, p.484. Combines the normal analytic Satake structure, normally projective realization and arithmetic boundary stratification; algebraization uses the separately imported Chow/GAGA suppliers.

Atlas planet: **Baily–Borel theorem**.

Remaining refinements: [Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3](#refinement-1), [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-koecher"></a>

### Koecher principle and boundary codimension

Declaration **TauCeti.Shimura.koecher** (theorem), node `ShimuraVarieties:V2/plan/koecher`.

If the rational semisimple effective group has no quotient isomorphic over Q to PGL₂, the boundary of the minimal compactification has codimension at least two. In the resulting Koecher range holomorphic canonical-factor automorphic sections have the required boundary growth/extension, yielding the canonical-form section-ring description. In the modular-curve factor case retain cusp conditions and logarithmic canonical forms.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Compute dimensions of boundary strata from rational root data; identify the exceptional rational three-dimensional factor.
2. Apply the holomorphic Fourier/Koecher extension argument in codimension at least two.
3. Do not use Q-rank one alone to decide codimension: ball quotients of dimension at least two are rank-one examples with higher-codimension cusps.

Direct inputs: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel).

Acceptance checks:

- Modular curves have codimension-one cusps.
- Rank-one ball quotients need not have divisorial minimal boundary.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(b)–(c), p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Proposition 3.15, p.478; Theorem 10.14, pp.523–524. These give boundary codimension and extension of holomorphic automorphic sections under the sufficient hypothesis excluding three-dimensional Q-normal subgroups. SVI gives the sharper split-PGL₂ exception used in this target; the two hypotheses are not identified.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-plan-minimal-level-extension"></a>

### Level maps on minimal compactifications

Declaration **TauCeti.Shimura.minimal_level_extension** (theorem), node `ShimuraVarieties:V2/plan/minimal-level-extension`.

Finite analytic level maps and Hecke right translations extend to the minimal compactifications through rational boundary maps and pullback of analytic automorphic forms. After algebraization these are finite algebraic maps for level changes and algebraic isomorphisms for translations, compatible with composition and the open immersion.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct the boundary map and compatible graded-ring pullback.
2. Use Proj and the finite/integral ring extension for finite-index arithmetic groups.
3. Compare analytifications and use proper graph algebraicity; extension is uniquely determined by the dense open. The exact general finite-extension source remains a refinement gap.

Direct inputs: [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), `ComplexComparisonPartII:C4`.

Acceptance checks:

- No claim of étaleness at the boundary.
- Reflex-field descent of these extensions belongs to V8/minimal-descent, not this complex construction.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39 and Corollary 3.16 discussion, p.40; general extension proof is a gap. Supports level maps on minimal compactifications. Construct the boundary map and compatible graded-ring pullback.

Remaining refinements: [Baily–Borel proof and carrier interfaces](#refinement-4), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-minimal-datum-extension"></a>

### Complex minimal compactification functoriality

Declaration **TauCeti.Shimura.minimal_datum_extension** (theorem), node `ShimuraVarieties:V2/minimal-datum-extension`.

A morphism of pure data f:D1 -> D2 and compatible compact open levels, with a compatible admissible right translation, induces a unique morphism of their complex Baily–Borel minimal compactifications extending the map of the open algebraic varieties. It sends rational boundary strata by the induced boundary morphisms and respects identity and composition. Level maps extend finitely, using the finite-level quotient theorem. No finiteness or boundary étaleness is asserted for an arbitrary datum morphism.

Hypotheses:

- Both complex compactifications are the specified V2 Baily–Borel constructions.
- For a translated map from K1 to K2, the translated image of K1 lies in K2.
- Use neat normal sublevels and effective finite quotients at non-neat levels.

Construction or proof:

1. Use rational boundary-component functoriality and the Satake topology. Pink 6.2, p.95 explicitly extends the maps of 3.4(a)–(b) holomorphically between the normal projective compactifications; this is the complex input, independent of 12.3 arithmetic descent.
2. Algebraize the graph in the projective product by C4. Equality on the dense reduced open with separated target proves uniqueness and all functor laws.
3. For level maps use V2/minimal-level-extension and finite quotients; descend from neat normal refinements for the general level.

Direct inputs: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/minimal-level-extension`](#shimuravarieties-v2-plan-minimal-level-extension), [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), `ComplexComparisonPartII:C4`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- For g=1 and an inclusion of levels the extension is the existing minimal level map.
- A constant datum morphism is not generally finite.
- At a modular cusp, extended level maps may ramify.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 3.4, pp.42–43; 6.2, pp.94–95 (holomorphic extension at end of p.95); 9.25, p.159; arithmetic consequence 12.3(b), p.197. Boundary functoriality and the complex antecedent of arithmetic extension; no arithmetic existence is an input here.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-codim-one-analytic-extension"></a>

### Codimension-one boundary and auxiliary data

Declaration **TauCeti.Shimura.codim_one_analytic_extension** (theorem), node `ShimuraVarieties:V2/codim-one-analytic-extension`.

For pure D=(G,X) and neat K, the codimension-one boundary strata arise from Q-simple factors of G^ad isomorphic to PGL2,Q, through surjections G -> PGL2,Q. Their parabolics are inverse images of rational Borels. If such a surjection lifts to D -> (GL2,H±), the derived SL2 factor defines Dprime=D/SL2 in Pink’s broader datum category and an embedding D -> Dprime × (GL2,H±), with the same reflex field. At compatible sufficiently small levels its corresponding codimension-one partial extension is a closed subspace of the product of the Dprime open variety with the GL2 minimal compactification, equal to the closure of the open image. In general Gtilde=G ×_{PGL2} GL2 has kernel G_m over G; its compatible partial extension maps finitely and surjectively onto the one for G, which is its effective finite quotient. These are complex statements only.

Hypotheses:

- Retain Pink’s finite domain over the homomorphism class for the auxiliary data; a quotient need not be a strict one-point torus datum.
- The partial extension includes only the boundary strata associated to the chosen PGL2 factor. Glue the partial extensions over the common open to include all codimension-one strata.
- Levels and their images are chosen as in Pink 12.10; arithmetic canonical models of auxiliary data are separate V8 hypotheses.

Construction or proof:

1. Apply rational-boundary classification and the codimension calculation to identify the PGL2,Q factors.
2. When the lift exists, the SL2 derived factor and connectedness of SL2(R) give the broader quotient datum and product embedding; boundary functoriality gives its closed extension at small levels.
3. Without the lift, the fibre-product group has kernel G_m and the adelic H1 vanishing makes the partial map surjective. The boundary quotient comparison makes it finite, and the effective finite group quotient recovers the original partial extension.

Direct inputs: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/minimal-datum-extension`](#shimuravarieties-v2-minimal-datum-extension), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), `ShimuraData:D4/datum-morphism`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- For GL2, Dprime is (G_m,{±1}); replacing it by a one-point domain loses a determinant component.
- For Hilbert data over F different from Q there is no PGL2,Q factor and no codimension-one boundary.
- At intersections of boundary divisors from distinct factors the codimension is at least two, so those intersections are omitted from the partial open.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 2.9, pp.32–33; 8.2, pp.132–133; 12.10, pp.200–201. Broader quotient data, the codimension-one partial open, lifted product embedding and finite-quotient case. The arithmetic step is owned by V8.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v2-log-canonical-sections"></a>

### Logarithmic canonical section embedding

Declaration **TauCeti.Shimura.log_canonical_section_embedding** (theorem), node `ShimuraVarieties:V2/log-canonical-sections`.

For pure D and neat K, let M_C^+ be the open of the normal minimal compactification consisting of M_C and all codimension-one boundary strata. It is smooth, its boundary B is a smooth divisor and its omitted complement has codimension at least two. Define omega[dlog]=det Omega^1_{M_C^+}(log B)=omega_{M_C^+}(B). Its n-th power has sections equal to the holomorphic automorphic forms of the corresponding canonical weight with the boundary growth condition. For some n0>0 and every positive multiple n of n0, these sections are finite dimensional, globally generate omega[dlog]^n on M_C^+, and the evaluation map to P(H0(M_C^+,omega[dlog]^n)^vee) extends to a closed embedding of the full minimal compactification. The pullback of O(1) restricts to omega[dlog]^n on M_C^+.

Hypotheses:

- Pure data and neat level, with the specified analytic Baily–Borel construction.
- PGL2,Q factors retain the cusp condition; away from these factors Koecher supplies the extension.
- This uses the logarithmic line on the partial open, not an intrinsic canonical bundle of a lower-dimensional boundary stratum.

Construction or proof:

1. Use the boundary codimension calculation to obtain smoothness and the smooth divisor on M_C^+.
2. On the open, powers of the top differential bundle identify with the canonical-weight automorphic forms. At PGL2 cusps, dq/q gives the logarithmic trivialization and holomorphy in q is exactly the growth condition. Apply Koecher for the other factors.
3. Apply the separating section system of Baily–Borel 10.11 as formulated in Pink 8.2; high divisible powers extend the evaluation map to the full closed embedding. This is the exact linear-system interface used in Pink 12.12, distinct from unrestricted full-ring finite generation.

Direct inputs: [`ShimuraVarieties:V2/codim-one-analytic-extension`](#shimuravarieties-v2-codim-one-analytic-extension), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/koecher`](#shimuravarieties-v2-plan-koecher), `ComplexComparisonPartII:C2`, [`ShimuraVarieties:V2/plan/poincare-eisenstein`](#shimuravarieties-v2-plan-poincare-eisenstein).

Acceptance checks:

- For modular curves, f(q)(dq/q)^n extends precisely when f is holomorphic at the cusp; j(q), which has a pole, fails.
- With no PGL2,Q factor, M_C^+=M_C and Koecher removes the additional cusp check.
- A sufficiently divisible n is required; the degree-one canonical system need not embed the compactification.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, pp.132–133; 12.12, p.202. Precise partial-open, logarithmic section and projective embedding statement.

Source: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), 10.11, pp.522–523. Separating automorphic section system; this use does not assert the stronger 10.14 without its hypotheses.

Atlas planet: **Logarithmic canonical embedding**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v3"></a>

## V3. Borel algebraicity and uniqueness

Use Borel extension for a smooth algebraic source and torsion-free effective target. Extend the conclusions to general levels through finite quotients. The definable route begins with an independent target comparison.

<a id="shimuravarieties-v3-plan-borel-extension"></a>

### Borel extension across punctured polydisks

Declaration **TauCeti.Shimura.borel_extension** (theorem), node `ShimuraVarieties:V3/plan/borel-extension`.

Let D be Hermitian symmetric and Γ^eff a torsion-free arithmetic subgroup of Hol(D)^+. Every holomorphic map (Δ*)^r×Δ^s→Γ^eff\D extends holomorphically to Δ^{r+s}→(Γ^eff\D)^min as a map of complex analytic spaces.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the invariant metric and arithmetic cusp estimates to establish the big-Picard extension criterion, then its several-variable version (Milne 3.15, citing Borel/Kwack).
2. The extension is into the minimal compactification, not into the open quotient. Uniqueness follows from a dense open and separated analytic target.
3. The original Borel metric proof was not obtained from the public publisher endpoint; its detailed multi-variable proof is a recorded source gap.

Direct inputs: [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `ComplexComparisonPartII:C0`.

Acceptance checks:

- For a modular curve this specializes to big Picard into its compact curve.
- Torsion-free effective target is part of the statement.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 3.15, p.39. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Borel extension theorem**.

Remaining refinements: [Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3](#refinement-1), [Borel multivariable extension proof source](#refinement-5), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-borel-algebraicity"></a>

### Borel algebraicity

Declaration **TauCeti.Shimura.borel_algebraicity** (theorem), node `ShimuraVarieties:V3/plan/borel-algebraicity`.

For torsion-free arithmetic Γ^eff in Hol(D)^+ and a smooth finite-type C-scheme S, every holomorphic map S^an→(Γ^eff\D)^an is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import R09.7/snc-compactification for the quasi-projective source: it preserves S and gives a smooth projective compactification with strict-SNC boundary. Its étale coordinate charts become local holomorphic charts by C0; the open inclusion is locally a punctured polydisk.
2. Apply extension, glue by uniqueness, and algebraize the proper graph using C4. Restrict to S.
3. For a general smooth separated finite-type source use quasi-projective opens and scheme descent. For nonseparated source the same local gluing works whenever the holomorphic map and analytification are available.

Direct inputs: [`ShimuraVarieties:V3/plan/borel-extension`](#shimuravarieties-v3-plan-borel-extension), `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`, `ComplexComparisonPartII:C4`, [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `ComplexComparisonPartII:C0`.

Acceptance checks:

- exp:C→A¹=Y(1) is a counterexample when the arithmetic target has torsion.
- The proper graph step does not by itself establish Borel for nonproper sources.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.14 and proof, pp.39–40. The proof reduces to a smooth projective SNC compactification and local punctured-polydisk extension. The existing R09.7/snc-compactification supplies the algebraic compactification, while C0 supplies the analytic chart comparison.

Atlas planet: **Borel algebraicity theorem**.

Remaining refinements: [Borel multivariable extension proof source](#refinement-5), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-unique-algebraization"></a>

### Unique algebraization at neat level

Declaration **TauCeti.Shimura.unique_algebraization** (theorem), node `ShimuraVarieties:V3/plan/unique-algebraization`.

Any two smooth finite-type C-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models owned by V8.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply Borel to the identity and inverse between the two analytic quotient descriptions.
2. Faithfulness of analytification identifies composites with identities. No arbitrary analytic automorphism is added to the chosen comparison.

Direct inputs: [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `ComplexComparisonPartII:C0`.

Acceptance checks:

- The isomorphism is unique relative to the chosen analytic comparison.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Corollary 3.16, p.40. Supports unique algebraization at neat level. Apply Borel to the identity and inverse between the two analytic quotient descriptions.

Atlas planet: **Uniqueness of algebraization**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-algebraic-data-maps"></a>

### Algebraic maps of Shimura data

Declaration **TauCeti.Shimura.algebraic_data_maps** (theorem), node `ShimuraVarieties:V3/plan/algebraic-data-maps`.

Holomorphic maps of data between neat-level analytic varieties algebraize, compatibly with levels, translations, identity and composition. An injective subdatum admits a closed immersion at sufficiently small compatible levels. These statements concern complex algebraizations; reflex-field functoriality is V8.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Borel into the neat target to algebraize the holomorphic datum map.
2. Apply the precise small-level separation theorem of Milne 5.16 for closed immersions.
3. Check functor laws after analytification, which is faithful.

Direct inputs: [`ShimuraVarieties:V1/plan/datum-analytic-map`](#shimuravarieties-v1-plan-datum-analytic-map), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V3/plan/unique-algebraization`](#shimuravarieties-v3-plan-unique-algebraization).

Acceptance checks:

- An inclusion can identify points at badly chosen larger level.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and 3.16, pp.58–59,40. The located passage supports algebraic maps of shimura data. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-finite-quotient-algebraization"></a>

### Algebraic finite quotients and normalization

Declaration **TauCeti.Shimura.finite_quotient_algebraization** (theorem), node `ShimuraVarieties:V3/plan/finite-quotient-algebraization`.

For neat normal K′⊂K, the finite group K/K′ acts algebraically on Sh_{K′,C}; its geometric quotient exists as a normal quasi-projective C-scheme and analytifies to Sh_K^an. Quotients through two sublevels agree via common refinement. The source at K′ is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat source algebraize translations by Borel into another neat source.
2. Import SF.1/finite-group-quotient for scheme existence, invariant affine covers and the free finite étale torsor case. Since the source is quasi-projective over C, every finite orbit lies in an affine open. Request only the additional descended ample-power/quasi-projectivity API, and use C0 for the quotient analytic comparison.
3. Normality is preserved by finite invariants; characterize normalization componentwise and use common refinement.

Direct inputs: [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V3/plan/unique-algebraization`](#shimuravarieties-v3-plan-unique-algebraization), `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`, `SchemeAndStackFoundations:SF.1/finite-group-quotient`, `SchemeAndStackFoundations:SF.1`, `ComplexComparisonPartII:C0`.

Acceptance checks:

- A quotient with stabilizers is not generally smooth or étale.
- Normalization is in the source field(s), not automatically the target field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Remark 3.13(a), p.39; neat tower p.58; general finite quotient imported from SF.1/finite-group-quotient. Supports algebraic finite quotients and normalization. At neat source algebraize translations by Borel into another neat source.

Atlas planet: **Finite quotient algebraization**.

Remaining refinements: [General quasi-projective finite quotient API](#refinement-13), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-definable-target-comparison"></a>

### Definable comparison with the algebraic target

Declaration **TauCeti.Shimura.definable_target_comparison** (theorem), node `ShimuraVarieties:V3/plan/definable-target-comparison`.

For a torsion-free effective arithmetic Hermitian quotient Γ\D and a fixed maximal compact K∞ defining its symmetric realization, the R_an,exp structure extending its corrected arithmetic R_alg structure agrees through the Baily–Borel algebraization with the definable structure induced by the C-scheme. This comparison is certified independently of Borel algebraicity.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Fix the maximal compact throughout, using the corrected BKT arithmetic definable atlas. Pass to a neat finite-index subgroup and remove compact ineffective factors using the existing AA contracts; transport back through the finite quotient.
2. Apply KUY Theorem 4.1: cover a semialgebraic Siegel set by finitely many cusp regions in adapted coordinates (x,y,t). Lemma 4.2 makes these coordinates semialgebraic. The bounded real parts of x make exp(2 pi i Re x) restricted analytic, while exp(-2 pi Im x) uses R_exp. After this exponential map each region has compact closure in a complex toroidal chart, so its holomorphic map into the algebraic Baily–Borel compactification is R_an-definable.
3. The arithmetic quotient atlas and the algebraic-target atlas therefore have a definable comparison in R_an,exp. Surjective definable charts give a definable inverse. The argument uses Baily–Borel and independently constructed complex cusp/toroidal charts, not Borel algebraicity. The general analytic chart and o-minimal suppliers remain requested from C4; do not import the subsequent arithmetic toroidal construction.

Direct inputs: [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/orr-schnell-containment`, `ComplexComparisonPartII:C4`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.3/real-siegel-set` imports `real-siegel-set` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `AdelicAlgebraicGroups:AA.3/orr-schnell-containment` imports `orr-schnell-containment` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- The q=e^{2πiz} cusp comparison requires R_an,exp, not merely R_an.
- Do not assert maximal-compact-independent functoriality for arbitrary G/M.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2 and §4.6, pp.2–4,18. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [B. Klingler, E. Ullmo, A. Yafaev, The hyperbolic Ax-Lindemann-Weierstrass conjecture](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf), Theorem 1.9, pp.336–337; §4, Theorem 4.1 and Lemma 4.2, pp.343–346. Independent comparison via semialgebraic cusp coordinates and complex toroidal charts, without the desired Borel algebraicity theorem.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Remaining refinements: [Independent definable comparison and graph suppliers](#refinement-6), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v3-plan-definable-borel"></a>

### Definable-graph proof of Borel algebraicity

Declaration **TauCeti.Shimura.definable_borel** (theorem), node `ShimuraVarieties:V3/plan/definable-borel`.

For smooth quasi-projective S over C and a torsion-free effective arithmetic Hermitian quotient Y, a holomorphic S^an→Y^an is algebraic by the definable-graph argument once the independently proved algebraic-target comparison and period-map definability are supplied.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Pull back a faithful polarized homogeneous Hodge variation so the map is an actual period map; use BKT 1.3 with its hypotheses, not definability of every arbitrary holomorphic map.
2. Via the independent target comparison, the graph is both closed complex analytic and R_an,exp-definable in (S×Y)^an.
3. Apply the Peterzil–Starchenko o-minimal Chow theorem, then algebraize the graph projection. This named o-minimal theorem/period theorem is requested as a C4 Part II extension, not re-proved here.

Direct inputs: [`ShimuraVarieties:V3/plan/definable-target-comparison`](#shimuravarieties-v3-plan-definable-target-comparison), `ShimuraData:D3/polarized-integral-variation`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Using the arithmetic definable structure without comparison with the algebraic target leaves a gap.
- The extension proof remains an independent route and does not depend on this alternative.

Source: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §4.6, Theorems 4.12–4.13, p.18. The located passage supports definable-graph proof of borel algebraicity. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Definable Borel algebraicity**.

Remaining refinements: [Independent definable comparison and graph suppliers](#refinement-6), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v4"></a>

## V4. Torus models and the canonical-model condition

Fix geometric Artin reciprocity, the reflex norm on full ideles and the actual canonical condition. Build generic torus models and prove special existence and density before uniqueness is used.

<a id="shimuravarieties-v4-plan-geometric-artin"></a>

### Milne geometric Artin conversion

Declaration **TauCeti.Shimura.geometricArtin** (definition), node `ShimuraVarieties:V4/plan/geometric-artin`.

Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.

Hypotheses:

- The supplied reciprocity homomorphism has abelian target and arithmetic Frobenius normalization.

Construction or proof:

1. Invert the arithmetic Artin homomorphism in its abelian target.
2. Preserve continuity, surjectivity and kernel; compare a local uniformizer and the cyclotomic character before applying CM reciprocity.

Direct inputs: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Uses:

- V4 canonical condition: pins the sign in σ[x,a]=[x,r_x(s)a].
- V5 main CM theorem: pins the Tate-module scalar normalization.

API:

- **geometricArtin_apply** (simp): art_F(s)=rec_F(s)⁻¹.
- **geometricArtin_mul** (structure): art_F(st)=art_F(s)art_F(t).
- **geometricArtin_kernel** (compatibility): ker art_F=ker rec_F as closed subgroups.
- **geometricArtin_norm** (functoriality): For L/F finite, art_F(N_{L/F}s)=res(art_L(s)).

Unit tests:

- **geometricArtin_uniformizer** (computation): At an unramified place, art_F(π_v) is inverse arithmetic Frobenius.
- **geometricArtin_one** (degenerate): art_F(1)=1.
- **geometricArtin_cyclotomic** (compatibility): For u=χ_cyc(σ)∈Zhat×, art_Q(u)=σ on Q^ab; changing to rec reverses the action.

Acceptance checks:

- Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), §3, p.21, before Lemma 3.4. Supports milne geometric artin conversion. Invert the arithmetic Artin homomorphism in its abelian target.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v4-plan-reflex-norm"></a>

### Reflex norm of a special torus

Declaration **TauCeti.Shimura.ReflexNorm** (definition), node `ShimuraVarieties:V4/plan/reflex-norm`.

For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.
2. Check Galois invariance of the product formula and descend the morphism over Q.
3. Evaluate on restricted adelic points and prove rational-principal and level compatibility.

Direct inputs: `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AdelicAlgebraicGroups:AA.1/base-change-adelic`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.1/base-change-adelic` imports `base-change-adelic` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-1-adelic-points-of-algebraic-groups`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.
- `ReductiveGroupsPartII:RG2.0a` imports `RG2.0a` from `tauceti:TauCetiRoadmap/ReductiveGroupsPartII#layer-rg20a-weil-restriction-and-the-deligne-torus`. Existing current-upstream Weil restriction and Deligne torus contract. The atlas stage id is its checked dependency key; this reference is not a pinned-library declaration.

Uses:

- V4 torus-model: defines its finite Galois-set action.
- CM.2 normalized-idele-torsion-dictionary: compares the global scalar with polarized CM lattice reciprocity.

API:

- **ReflexNorm.apply_split** (simp): In splitting coordinates r_h(s)=∏ρ ρ(μ_h(s_ρ)).
- **ReflexNorm.principal** (compatibility): For b∈E×, r_h(b)∈T(Q), hence its action on every torus double quotient is trivial.
- **ReflexNorm.map** (functoriality): For f:T0 -> T, mu=f composed with mu0 and E subset E0, f composed with r(T0,mu0)=r(T,mu) composed with Nm_{E0/E}; this holds on full ideles. The promoted map_full theorem proves it.
- **ReflexNorm.cm_type** (compatibility): For the CM torus datum supplied by D5/cm-torus and CM.0, r_h agrees with the multiplicative reflex-type norm.
- **ReflexNorm.continuous** (structure): The finite-idelic map is a continuous group homomorphism.
- **ReflexNorm.ext** (extensionality): Two rational torus homomorphisms Res_{E/Q}G_m→T agreeing on the split cocharacter formula after a splitting-field base change are equal.
- **ReflexNorm.mul** (simp): The reflex norm sends 1 to 1 and r_h(st)=r_h(s)r_h(t), as an algebraic group morphism and on finite ideles.

Unit tests:

- **ReflexNorm.trivial** (degenerate): A trivial cocharacter gives the constant identity morphism.
- **ReflexNorm.split_power** (computation): For T=G_m, E=Q and μ(t)=t^n, r_h(s)=s^n, including n=0 and negative n.
- **ReflexNorm.aghmp** (compatibility): For T=Res_{E/Q}G_m/ker(N_{F/Q}) in AGHMP §3.1 and its distinguished cocharacter, r_h is the natural quotient map Res_E G_m→T.

Acceptance checks:

- For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §12, formulas (60)–(61), p.114, corrected from sums to products. Supports reflex norm of a special torus. Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-1-adelic-points-of-algebraic-groups; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Source: [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Reflex norm**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v4-plan-reciprocity-finite-action"></a>

### Finite-level reciprocity and idele independence

Declaration **TauCeti.Shimura.reciprocity_finite_action** (theorem), node `ShimuraVarieties:V4/plan/reciprocity-finite-action`.

For a torus datum (T,h) and compact open K, the action of r_h(s) on the finite set T(Q)\T(A_f)/K factors continuously through Gal(E^ab/E) via art_E. Thus equal Artin lifts act identically at every level. At the full tower the natural reciprocity values lie in T(A_f)/closure(T(Q)); do not replace the closure by T(Q) without the needed additional CM norm lemma.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Principal ideles act through T(Q); infinite connected ideles are killed in the finite quotient. Continuity kills the closure of the Artin kernel.
2. Factor through the finite quotient Galois action, whose point stabilizers are open.
3. For general special points insert this torus map into the datum and pass through the double-quotient point map.

Direct inputs: [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- For torus levels, dependence only on Artin follows modulo T(Q)K; literal equality of reflex-norm ideles is unnecessary.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), §2, pp.3–4, reciprocity map and its finite-level action. The located passage supports finite-level reciprocity and idele independence. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Special-point reciprocity**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v4-plan-canonical-model"></a>

### Canonical-model condition

Declaration **TauCeti.Shimura.CanonicalModel** (definition), node `ShimuraVarieties:V4/plan/canonical-model`.

A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.
2. Use reciprocity-finite-action to make the formula independent of the lift.
3. Record finite-level and compatible-tower variants and compare them via sufficiently small levels.

Direct inputs: [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), `ShimuraData:D4/special-pair`, `ShimuraData:D3/reflex-field`, [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Over`.

Uses:

- V5 Siegel canonical model: main CM theorem verifies the condition on all CM special points.
- V6 inheritance and V7 descent: prove existence for actual data.
- V8 model-uniqueness: uses this complete condition and adelic functoriality.

API:

- **CanonicalModel.scheme** (projection): The underlying scheme is over Spec E(G,X), with normal/quasi-projective structure.
- **CanonicalModel.comparison** (projection): The chosen comparison is an isomorphism of complex analytic spaces after base change to C.
- **CanonicalModel.special_rational** (data): For every actual special pair and a, the comparison point is E(T,h)^ab-rational.
- **CanonicalModel.special_action** (characterisation): Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
- **CanonicalModel.level** (functoriality): A tower supplies level maps over E, with identity/composition and analytic point formula.
- **CanonicalModel.baseChange** (compatibility): For E⊂L⊂C, base change retains the same comparison and restricted special-point action; the defining minimal field remains E.
- **CanonicalModel.ofSpecialAction** (constructor): An E-scheme with the stated normal/quasi-projective structure, analytic comparison, special-point rationality and the full reciprocity formula defines a finite-level canonical model. Tower construction also requires compatible level maps and translations.
- **CanonicalModel.hom_ext** (extensionality): Two E-morphisms between the underlying finite-level models whose complex analytic maps agree are equal, by faithful base change and analytification. This is morphism extensionality; model uniqueness remains V8.

Unit tests:

- **CanonicalModel.trivial** (degenerate): The trivial datum has canonical model Spec Q with its one-point comparison.
- **CanonicalModel.torus_neat** (compatibility): The finite étale torus model satisfies this condition using its constructed Galois action.
- **CanonicalModel.not_arbitrary_subset** (non-example): For T=G_m, h(z)=z zbar and principal K(5), the analytic quotient has two points (Z/5Z)×/{±1}. The split model Spec Q ⊔ Spec Q with any two-point comparison passes an empty-subset test but fails canonicity: an automorphism with cyclotomic character 2 modulo 5 must interchange the two classes by reciprocity, whereas the split model fixes both.

Acceptance checks:

- A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 12.8, p.114 and Definition 12.10, p.115. Supports canonical-model condition. Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.

Atlas planet: **Canonical model**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v4-plan-torus-model"></a>

### Finite étale torus canonical models

Declaration **TauCeti.Shimura.torusModel** (construction), node `ShimuraVarieties:V4/plan/torus-model`.

The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply the finite-étale-scheme/finite-continuous-Galois-set equivalence with its field/base-change comparison.
2. Use the actual finite torus double quotient as the Galois set, not just its cardinality.
3. Transport its complex point equivalence and verify all torus special-pair reciprocity maps by norm functoriality.

Direct inputs: [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`.

Uses:

- V4 functoriality: constructs maps by finite Galois sets.
- AGHMP §3.1: its neat CM Shimura scheme is this specific torus construction.
- V8 zero-dimensional-shimura-variety: adds the general zero-dimensional component datum and tower reciprocity beyond singleton torus data.

API:

- **torusModel.points** (equivalence): S_K(Qbar)≃T(Q)\T(A_f)/K as Galois sets, with the prescribed action.
- **torusModel.level** (functoriality): For K′⊂K the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
- **torusModel.translate** (functoriality): Right translation by a∈T(A_f) is defined over E and commutes with reciprocity.
- **torusModel.map** (functoriality): A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
- **torusModel.finiteEtale** (structure): The resulting scheme is finite étale over E, with degree equal to the Galois-set cardinality.
- **torusModel.hom_ext** (extensionality): Two E-morphisms between finite étale torus models agreeing on all geometric points are equal under the finite-continuous-Galois-set equivalence.

Unit tests:

- **torusModel.maximal_split** (computation): For T=G_m, h(z)=z zbar, K=Zhat×, E=Q, the coarse scheme is Spec Q.
- **torusModel.split_level_five** (computation): For the same datum and principal K(5), the Galois set is (Z/5Z)×/{±1}; the degree-two model is Q(ζ₅+ζ₅⁻¹), not Q(ζ₅).
- **torusModel.trivial** (degenerate): For the trivial torus every level gives Spec Q.

Acceptance checks:

- The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, p.416. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Torus canonical models**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v4-plan-aghmp-stack-comparison"></a>

### AGHMP torus stack and coarse model

Declaration **TauCeti.Shimura.aghmp_stack_comparison** (theorem), node `ShimuraVarieties:V4/plan/aghmp-stack-comparison`.

For the specific AGHMP torus T=Res_{E/Q}G_m/ker(N_{F/Q}), distinguished cocharacter and neat normal K′⊂K, the generic CM Shimura stack is [S_{K′}/(K/K′)]. Its coarse space is S_K, independent of K′; at neat K it is the finite étale scheme above. At non-neat K retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the §3.1 computation that the reflex norm is the quotient map.
2. Import SF.1/quotient-stack and quotient-stack-algebraic for the finite constant group action, retaining inertia. SF.1/finite-quotient-coarse identifies its coarse scheme with the finite quotient Galois set S_K; the finite étale S_{K′} is affine, so its orbit-cover hypothesis holds.
3. At a common neat normal refinement the intermediate free level action is a finite étale torsor. Apply SF.1/stack-presentation, or the quotient-stack torsor description, to compare the presentations. Keep stabilizer data at non-neat level; the generic scheme alone cannot encode it.

Direct inputs: [`ShimuraVarieties:V4/plan/torus-model`](#shimuravarieties-v4-plan-torus-model), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `SchemeAndStackFoundations:SF.1/stack-presentation`.

Acceptance checks:

- For an imaginary quadratic E at maximal units, roots of unity contribute stack inertia even when the coarse scheme has one geometric point.
- Do not claim a finite DM stack for an arbitrary torus with infinite rational central-unit stabilizers.

Source: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, pp.415–416. The located passage supports aghmp torus stack and coarse model. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v4-plan-special-existence"></a>

### Existence and density of special points

Declaration **TauCeti.Shimura.special_existence** (theorem), node `ShimuraVarieties:V4/plan/special-existence`.

Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in X in its real topology, hence their images are Zariski dense in each complex algebraized component.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Choose a regular semisimple Lie element in the compact-mod-centre real Cartan; approximate by a rational regular semisimple element.
2. Its rational maximal torus supports the conjugated special homomorphism. Apply the same construction near arbitrary domain points.

Direct inputs: `ShimuraData:D4/special-point`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel).

Acceptance checks:

- The rational approximant must remain regular semisimple, not merely a regular nilpotent element.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.3, p.117. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v4-plan-hecke-density"></a>

### Density of Hecke translates

Declaration **TauCeti.Shimura.hecke_density** (theorem), node `ShimuraVarieties:V4/plan/hecke-density`.

For any x∈X, the finite-level set {[x,a]_K:a∈G(A_f)} is Zariski dense in Sh_{K,C}. In particular the Hecke translates of a fixed actual special point are dense. This uses real approximation in G(Q)_+, not unrestricted strong approximation in G(A_f).

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.
2. Rewrite rational domain translates through the diagonal equivalence as finite-adelic Hecke translates.
3. Real analytic density implies algebraic Zariski density on each component.

Direct inputs: [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- This does not assert that each arithmetic Γ orbit in D is dense.
- The torus case says its finite Hecke orbit is the entire finite set.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.5, p.118. Supports density of hecke translates. Fix a component representative a. Rational real approximation makes G(Q)_+x dense in X⁺ after choosing x in that component.

Atlas planet: **Hecke orbit density**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v4-plan-reflex-norm-functoriality"></a>

### Reflex norm under a torus morphism

Declaration **TauCeti.Shimura.ReflexNorm.map_full** (theorem), node `ShimuraVarieties:V4/plan/reflex-norm-functoriality`.

Let f:T0 -> T be a morphism of Q-tori and let mu0 be a cocharacter with mu=f composed with mu0. Put E0=E(mu0), E=E(mu), so E is contained in E0. Then f composed with r(T0,mu0) equals r(T,mu) composed with Nm_{E0/E}, as Q-group morphisms Res_{E0/Q}G_m -> T and on full ideles, including the archimedean factor. Geometric Artin maps obey art_E(Nm s)=art_{E0}(s)|_{E^ab}. These identities give special-pair functoriality and the component reciprocity map with its real-domain action.

Hypotheses:

- The cocharacters and their fields of definition are actual ones, not arbitrary chosen fields.
- For special-pair application use D4/special-image; for zero-dimensional component application retain the full idele and finite real-domain action.

Construction or proof:

1. Galois equivariance of f makes the stabilizer of mu0 a subgroup of the stabilizer of mu, proving E subset E0.
2. After a common splitting-field base change, group the factors of the product formula by embeddings of E; the product over embeddings extending one embedding is the field norm. Faithful descent proves equality of group morphisms.
3. Evaluate on all adelic points. Apply norm/restriction compatibility of arithmetic reciprocity and then invert to the V4 geometric convention.

Direct inputs: [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), `ShimuraData:D4/special-image`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Current upstream interfaces:

- `ReductiveGroupsPartII:RG2.0a` imports `RG2.0a` from `tauceti:TauCetiRoadmap/ReductiveGroupsPartII#layer-rg20a-weil-restriction-and-the-deligne-torus`. Existing current-upstream Weil restriction and Deligne torus contract. The atlas stage id is its checked dependency key; this reference is not a pinned-library declaration.

Acceptance checks:

- For T0=T=G_m, mu0(z)=z^m and f(z)=z^n over Q, both sides send s to s^{mn}.
- When mu is trivial but mu0 is not, its smaller reflex field must still appear through the norm; dropping that norm gives a wrongly typed formula.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.3(c), p.112; corrected (60)–(61), p.114; 13.8 and (64), p.119. Field containment, multiplicative norm definition and its functorial use in canonical/component maps.

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.4, pp.155–156. Special-pair functoriality underlying the arithmetic datum morphism.

Source: [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Reflex norm functoriality**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

## Conditional uniqueness foundations (V8 ownership)

These three results are conditional on specified canonical models; their proofs precede the existence arguments. Exact-node dependencies keep that logical order without a dependency on the entire V8 application stage.

<a id="shimuravarieties-v8-plan-disjoint-special-reflex-fields"></a>

### Disjoint special reflex fields

Declaration **CanonicalModel.disjoint_special_reflex_fields** (theorem), node `ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`.

For every pure datum D and finite extension L/E(D) in C, there is a special torus subdatum (T,h) of D such that E(T,h)/E(D) is linearly disjoint from L/E(D). The torus-reflex field is used, not the residue field of an arbitrarily chosen level point.

Hypotheses:

- G is connected reductive over Q; actual special pairs and cocharacter reflex fields are those of D3/D4.
- L/E(D) is finite.

Construction or proof:

1. Use Deligne 5.1: over the regular-semisimple open V in Lie(G), the incidence variety W of maximal tori, cocharacters in the datum class, and regular Lie elements has a finite étale surjective map f:W -> V. Separately, the cocharacter-class map p:W -> Spec E(D) has geometrically irreducible fibres by 5.1.2; p is not asserted finite étale.
2. Connected centralizers and conjugacy of maximal tori give geometrically irreducible fibres over E(D). The nonempty real open U of tori compact modulo the centre supplies special homomorphisms in X.
3. Apply Hilbert irreducibility with a real-open condition and linear-disjointness avoidance to W after base change to L. Its specialized cocharacter field contains the reflex field of the resulting torus datum; subextensions retain linear disjointness.

Direct inputs: `ShimuraData:D4/shimura-datum`, `ShimuraData:D3/reflex-field`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `mathlib:IntermediateField.LinearDisjoint`.

Acceptance checks:

- For GL2, take an imaginary quadratic field Q(sqrt(-p)) with p an odd prime unramified in L; ramification at p excludes its inclusion in L.
- Do not infer the field-disjointness theorem from mere density of special points.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.4, p.118. States the special-reflex-field lemma.

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1, 5.1.2, 5.1.3, pp.153–155 (page images checked). Incidence cover, connected-fibre argument and real-open Hilbert specialization.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-translation-descent"></a>

### Hecke translation over the reflex field

Declaration **CanonicalModel.translation_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/plan/translation-descent`.

If g in G(A_f) and g^{-1}Kg is contained in L, the complex morphism T_g:[x,a]_K -> [x,ag]_L descends uniquely to an E-morphism M_K -> M_L. This is a conditional functoriality theorem for actual canonical models, with no general existence assumption.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- K,L are compact open and g^{-1}Kg is contained in L.

Construction or proof:

1. V1 gives the analytic map and V3 its algebraicity over C. For a special pair (T,h), V4 gives sigma[h,a]=[h,r_h(s)a] for sigma fixing E(T,h). Left multiplication r_h(s) commutes with right multiplication g.
2. V4 density of all Hecke translates of h identifies T_g with its sigma-conjugate as algebraic maps (source reduced, target separated).
3. First descend through Aut(C/E(T,h)) for one special pair: this gives a finite algebraic field of definition of T_g, rather than assuming every complex morphism has one. Apply disjoint-special-reflex-fields to its finite normal closure over E. Descent through the second fixing subgroup and linear disjointness force the map to be defined over E; faithful base change gives uniqueness.

Direct inputs: [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For g=1 and K contained in L this is the forgetful level map.
- For L=g^{-1}Kg this is an isomorphism, with inverse T_{g^{-1}}.
- The inclusion direction must be tested on a changed representative ak: k g=g(g^{-1}kg).

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.6, pp.118–119. Reciprocity, dense translates and disjoint reflex fields prove descent.

Atlas planet: **Hecke translations over the reflex field**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-model-uniqueness"></a>

### Uniqueness of canonical models

Declaration **CanonicalModel.unique_iso** (theorem), node `ShimuraVarieties:V8/plan/model-uniqueness`.

Two canonical E-models of the same finite-level Shimura variety have a unique E-isomorphism inducing their specified comparison over C. These isomorphisms commute with all descended level and translation maps.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. Repeat translation-descent with g=1, K=L and the two distinct specified model comparisons; the same special-pair action makes the complex identity descend.
2. Descend its inverse and verify the inverse identities by faithful base change. Naturality follows by comparing after C-base change.

Direct inputs: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- An arbitrary automorphism of an E-scheme is not the specified unique comparison.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.7(a), p.119. Uniqueness includes the fixed complex model identification.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v5"></a>

## V5. CM abelian varieties and the Siegel canonical model

Import weight-one algebraization and abelian/PEL moduli, then prove the full product-CM reciprocity needed for the Siegel canonical model. Spreading, semistable inertia, scalar-extended Hom injectivity and the CM norm kernel are separate proof inputs.

<a id="shimuravarieties-v5-plan-weight-one-algebraization"></a>

### Algebraization of polarized weight-one variations

Declaration **TauCeti.Shimura.weight_one_algebraization** (theorem), node `ShimuraVarieties:V5/plan/weight-one-algebraization`.

Over a smooth finite-type C-scheme S, the relative analytic equivalence between polarized abelian families and polarizable integral variations of homological types (−1,0),(0,−1) algebraizes: every such variation gives an abelian scheme, and morphisms correspond to morphisms of variations. Polarization type and actual integral level are retained.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.
2. Borel algebraizes its classifying map into the neat arithmetic quotient. Pull back the universal abelian scheme and descend through the level cover.
3. Algebraize homomorphisms via the relative moduli/rigidity and proper comparison, not a claim that all holomorphic functions on S are algebraic.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A5`, `PELModuli:M3`, [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), `AbelianSchemesAndArithmeticModuli:A3`, `ComplexComparisonPartII:C4`.

Acceptance checks:

- Homology conventions are (−1,0),(0,−1); the cohomological dual is not identified without dualization.
- Do not assume PEL M4 canonical models to prove the Siegel model.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.8, p.122; algebraization through M3 and V3. Supports algebraization of polarized weight-one variations. Use A5 to obtain the analytic family. Add an appropriate level after an étale cover and use the relevant M3 algebraic moduli chart.

Atlas planet: **Weight-one algebraization**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-abelian-variety"></a>

### CM abelian varieties with their algebra action

Declaration **TauCeti.Shimura.CMAbelianVariety** (definition), node `ShimuraVarieties:V5/plan/cm-abelian-variety`.

For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.
2. Identify the eigenspaces through A5 and apply CM.0 type definitions.
3. Use Rosati positivity for the polarization compatibility; do not build a new CM-type carrier here.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A2`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`.

Uses:

- V5 main theorem: its actual E-linear Tate representation is compared with reflex reciprocity.
- V5 Siegel-special-CM: tests every special point of the Siegel datum.
- CM.2 arbitrary-dimensional-classification: imports the full general CM reciprocity theorem.

API:

- **CMAbelianVariety.action** (data): The injective E-action on the actual abelian variety is part of the data.
- **CMAbelianVariety.type** (projection): The type is the subset of embeddings appearing in Lie(A), using the imported CM.0 definition.
- **CMAbelianVariety.homology** (compatibility): H₁(A,Q) is free of rank one over E, with eigenspace decomposition Φ in Lie(A).
- **CMAbelianVariety.transport** (functoriality): An E-linear quasi-isogeny transports the full action and type; identity/composition hold.
- **CMAbelianVariety.rosati** (characterisation): A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.
- **CMAbelianVariety.ofAction** (constructor): An actual abelian variety with an injective CM-algebra action of dimension 2 dim A supplies the full CM object and its Lie type; a compatible polarization is included when Rosati data are requested.
- **CMAbelianVariety.hom_ext** (extensionality): Two E-linear quasi-homomorphisms between full CM objects agreeing on H₁(-,Q), or on a rational Tate module after comparison, are equal.

Unit tests:

- **CMAbelianVariety.quadratic** (computation): An elliptic curve with an imaginary quadratic embedding in End⁰ has a full CM action of degree two.
- **CMAbelianVariety.product** (compatibility): The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
- **CMAbelianVariety.insufficient_degree** (non-example): A scalar Q-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

Acceptance checks:

- For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, p.123; field case §10. Supports cm abelian varieties with their algebra action. Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.

Atlas planet: **CM abelian varieties**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-tate-rank-one"></a>

### Rank-one rational CM Tate module

Declaration **TauCeti.Shimura.cm_tate_rank_one** (theorem), node `ShimuraVarieties:V5/plan/cm-tate-rank-one`.

For a full CM action (A,E), V_fA is free of rank one over E⊗_Q A_f, compatibly with H₁(A,Q)⊗A_f and with quasi-isogenies. If End(A)∩E=O_E, T_ℓA is free of rank one over O_E⊗Z_ℓ. For a nonmaximal order only the rational freeness is asserted without additional integral hypotheses. Quasi-isogenies act faithfully on V_fA.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.
2. At maximal order the integral lattice is locally an invertible O_E-module, yielding integral freeness.
3. Use injectivity of rational Hom on Tate modules for uniqueness of a quasi-isogeny.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- The rational rank statement includes product CM algebras.
- An integral rank-one claim over an arbitrary nonmaximal order needs an invertible lattice hypothesis.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison 2007c §1.7. Supports rank-one rational cm tate module. Use uniformization and the full-degree E-module structure to prove rank-one H₁, then the complex torsion/Tate comparison.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-number-field-model"></a>

### Number-field models for full CM objects

Declaration **TauCeti.Shimura.cm_number_field_model** (theorem), node `ShimuraVarieties:V5/plan/cm-number-field-model`.

A full CM abelian variety over C, with its finitely specified endomorphisms, polarization and finite level, admits a model over a number field after replacing its base by a finite extension. This establishes that CM reduction and arithmetic Frobenius arguments apply to actual complex points.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.
2. Extend the field to define the action/polarization/level. Do not assert that every arbitrary complex abelian variety has a number-field model.
3. The detailed CM moduli rigidity/descent proof is a specific source refinement, separated from the main theorem.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), `PELModuli:M3`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/trace-reflex-field`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The field must define the CM action before the Galois representation is scalar E-linear.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.3 and proof, pp.100–101. Supports number-field models for full cm objects. Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.

Remaining refinements: [Full CM spreading and specialization inputs](#refinement-7), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-potential-good-reduction"></a>

### Potential good reduction for CM varieties

Declaration **TauCeti.Shimura.cm_potential_good_reduction** (theorem), node `ShimuraVarieties:V5/plan/cm-potential-good-reduction`.

A full CM abelian variety over a number field has potentially good reduction at every finite place. With all E-endomorphisms defined, the inertia image on V_ℓA is finite for ℓ different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. First pass to a number field over which all E-endomorphisms are defined. At the chosen finite place apply R11.3/finite-separable-semistable-extension to acquire semistable reduction.
2. By R11.3/inertia-square-zero, (ρ_ℓ(σ)−1)²=0 for inertia after that extension, with ℓ different from the residue characteristic. By rank-one E-linearity, ρ_ℓ(σ) lies in the commutative finite étale algebra E⊗Q_ℓ, which is reduced. Thus ρ_ℓ(σ)=1. Equivalently its multiplication action is both semisimple and unipotent.
3. Apply R11.5/neron-ogg-shafarevich to get good reduction. The original inertia image is finite since an open inertia subgroup is killed. The extension can be chosen over the number field: the excellent DVR supplier applies to the local number-field ring, or realize a completion extension by Krasner.
4. Compactness and the Rosati norm constraint alone do not imply finite inertia. In particular, absolute local inertia is not virtually pro-p; the source error is recorded as E9.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero`.

Acceptance checks:

- This is potential good reduction, not good reduction over the original field.
- The proof is valid in higher dimension.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 and proof, p.101. Proposition 10.5 states potential good reduction. Its absolute-inertia pro-p argument is corrected here via the existing semistable-reduction and inertia suppliers; see E9 and E11.

Source: [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Theorem 4.2, p.9; Remark 5.6, p.18; Proposition 6.5, pp.23–24. After finite separable extension inertia acts unipotently of height at most two. Rank-one multiplication in E⊗Q_ℓ is semisimple, forcing this inertia action to be trivial.

Atlas planet: **Potential good CM reduction**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-frobenius"></a>

### CM Frobenius endomorphism

Declaration **TauCeti.Shimura.cm_frobenius** (theorem), node `ShimuraVarieties:V5/plan/cm-frobenius`.

Let A/k have full CM by O_E with the action defined over k, let k/Q be Galois containing all conjugates of E, and let P be a good reduction prime of residue cardinality q. The q-power Frobenius of the reduction is represented by π∈O_E under the specialized CM action, with ππbar=q for a compatible polarization.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Specialize the defined O_E-action to the good reduction and use A4/etale-tate-module to identify the prime-to-p rational Tate module with that of the generic fibre. It remains rank one over E⊗Q_ℓ; q-power Frobenius commutes with the action defined over the residue field.
2. Let C be the centralizer of E in End⁰ of the reduction. A6/hom-is-free-of-finite-rank gives finite dimension and injects C⊗Q_ℓ into End_{E⊗Q_ℓ}(V_ℓ)=E⊗Q_ℓ. Thus dim_Q C≤dim_Q E; since E⊂C, C=E and Frobenius belongs to E. Only scalar-extended Hom injectivity is used, with ℓ different from the residue characteristic; no Tate surjectivity or lifting of all special-fibre endomorphisms is assumed.
3. A6/characteristic-polynomial-on-tate-module makes the Frobenius endomorphism integral over Z, so its element of E lies in O_E. The compatible polarization and Rosati conjugation give ππbar=q.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V5/plan/cm-potential-good-reduction`](#shimuravarieties-v5-plan-cm-potential-good-reduction), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

Acceptance checks:

- The Frobenius is arithmetic q-power on the reduction; V4 art is its inverse on Galois reciprocity.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 10.8 and Lemma 10.9 with proof, p.103. The centralizer calculation identifies the specialized CM algebra inside all rational endomorphisms; the Frobenius lemma then gives integrality and the polarization norm.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 2.1(a) and proof, p.16; Corollary 1.5, p.6. Prime-to-characteristic scalar-extended Hom injectivity bounds the centralizer by the rank-one E-linear Tate endomorphisms. The calculation needs injectivity, not a general Tate full-faithfulness theorem.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-shimura-taniyama"></a>

### Shimura–Taniyama Frobenius calculation

Declaration **TauCeti.Shimura.shimura_taniyama** (theorem), node `ShimuraVarieties:V5/plan/shimura-taniyama`.

Under the preceding good-reduction/maximal-order/Galois-field hypotheses, for every v|p put H_v={φ:E→k:φ⁻¹P=v}. The Frobenius π satisfies ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Equivalently the principal ideal (π) is the product over φ∈Φ of φ⁻¹(N_{k/φE}P), and agrees with the reflex norm of N_{k/E*}P. State the ramified-prime formula using normalized valuations; the clean unramified ideal proof suffices for the subsequent prime-generation argument.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).
2. Use type counting to identify the valuation at each CM prime.
3. Translate the product ideal through the reflex norm. For product algebras use the torus norm; the field reflex-type formula alone is not a product reflex type.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-frobenius`](#shimuravarieties-v5-plan-cm-frobenius), `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`, [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), `AbelianSchemesAndArithmeticModuli:A4`.

Acceptance checks:

- For CM elliptic curves an inert prime has slope 1/2; a split prime has slopes 0 and 1.
- Valuations are normalized ratios, not a raw count independent of ramification.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 10.10, p.103 and proof pp.104–105; 2007c Theorem 2.1. Supports shimura–taniyama frobenius calculation. Compare the Lie eigenspace lengths of the CM action at P with the Frobenius kernel length; account for ramification through normalized ord_v(q).

Atlas planet: **Shimura–Taniyama formula**.

Remaining refinements: [Full CM spreading and specialization inputs](#refinement-7), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-cm-ideal-reciprocity"></a>

### CM ideal reciprocity with prime generation

Declaration **TauCeti.Shimura.cm_ideal_reciprocity** (theorem), node `ShimuraVarieties:V5/plan/cm-ideal-reciprocity`.

For A/C with CM by O_E and type Φ, integer m>0 and σ fixing E*, there is an ideal multiplication α:A→σA acting as σ on A[m]. Its ray ideal class is determined by σ on a sufficiently divisible reflex ray class field and is the reflex-norm ideal class of an ideal b whose arithmetic Artin symbol is σ. This ideal statement uses arithmetic Artin; V5/main-CM converts to geometric art for ideles.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Same type gives an E-linear quasi-isogeny. Approximate its scalar at the finitely many primes dividing m to make it agree with σ on m-torsion.
2. Compose ideal multiplications to obtain a finite ray-class homomorphism; prove its continuity via finite torsion and a model field.
3. At almost every suitable good unramified prime use Shimura–Taniyama. Dirichlet/Chebotarev prime generation of ray classes extends equality to every class.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/shimura-taniyama`](#shimuravarieties-v5-plan-shimura-taniyama), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/type-product-identities`.

Acceptance checks:

- Equality only on a few Frobenius elements is insufficient; excluded primes form a finite set and remaining primes generate every ray class.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.2, pp.19–20. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-main-cm"></a>

### Main theorem of complex multiplication

Declaration **TauCeti.Shimura.main_cm** (theorem), node `ShimuraVarieties:V5/plan/main-cm`.

Let (A,i:E→End⁰A) be full CM over C, allowing a CM product algebra, with type Φ and reflex field E*. For σ∈Aut(C/E*) and a finite idele s∈A_{f,E*}× with art_{E*}(s)=σ|E*ab, there is a unique E-linear quasi-isogeny α:A→σA satisfying α(r_Φ(s)x)=σx for every x∈V_fA. If s′ has the same Artin image and r_Φ(s′)=a r_Φ(s), a∈E×, replace α by α∘a⁻¹. The existence of this a is proved by the norm-kernel lemmas in the CM setting, not asserted for arbitrary tori.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Reduce by an E-linear quasi-isogeny to maximal integral order. Choose an E-linear comparison with σA and extract its rank-one Tate scalar η(σ).
2. The ideal theorem identifies η(σ)/r_Φ(s) modulo every finite torsion level. The conjugation/norm-one condition removes the residual closure ambiguity (2007c 3.6–3.12), using the norm local-global theorem.
3. Faithfulness on the rational Tate module gives uniqueness. Transport back through the chosen E-isogeny.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-ideal-reciprocity`](#shimuravarieties-v5-plan-cm-ideal-reciprocity), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Acceptance checks:

- The quasi-isogeny is unique for a fixed s; changing s changes the quasi-isogeny.
- σ is required to fix the reflex field, not necessarily the CM field itself as an embedded subfield.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Main theorem of complex multiplication**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [CM norm-kernel inputs](#refinement-16).

<a id="shimuravarieties-v5-plan-cm-polarization-level"></a>

### Polarization and level in CM reciprocity

Declaration **TauCeti.Shimura.cm_polarization_level** (theorem), node `ShimuraVarieties:V5/plan/cm-polarization-level`.

For α from the main CM theorem and a compatible polarization form ψ with Rosati conjugation, ψ_{σA}(αx,αy)=c ψ_A(x,y) where c=χ_cyc(σ)/N_{E*/Q}(s)∈Q_{>0}. The actual Tate twist in ψ:A_f×A_f→A_f(1) is retained. For an adelic symplectic level representative, σ transport equals the reflex-norm action modulo the chosen level and the E-linear quasi-isogeny.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use ψ_{σA}(σx,σy)=χ_cyc(σ)ψ_A(x,y), Rosati conjugation and r_Φ(s)r_Φ(s)bar=N_{E*/Q}(s).
2. Class field theory identifies the quotient scalar as a positive rational number.
3. Apply the formula to the actual symplectic Tate trivialization and its K-orbit, not a raw matrix without the quasi-isogeny equivalence.

Direct inputs: [`ShimuraVarieties:V5/plan/main-cm`](#shimuravarieties-v5-plan-main-cm), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2`, [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin).

Acceptance checks:

- The similitude factor is χ/N, not N/χ in this α convention.
- An equality of unpolarized CM isogeny classes does not by itself prove the Siegel canonical condition.

Source: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(c), pp.22–23. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-siegel-special-cm"></a>

### Siegel special points are full CM

Declaration **TauCeti.Shimura.siegel_special_cm** (theorem), node `ShimuraVarieties:V5/plan/siegel-special-cm`.

For the Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree 2g. Products are included, so all special points rather than only simple CM fields are covered.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.
2. By complete reducibility and positive Rosati involution, a torus Mumford–Tate action gives a full CM algebra in the endomorphisms. Conversely a full CM algebra forces a torus Hodge image.

Direct inputs: [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), `ShimuraData:D5/siegel-datum`, `ShimuraData:D4/special-point`, `AbelianSchemesAndArithmeticModuli:A6`.

Acceptance checks:

- A product of CM elliptic curves is included.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124. Supports siegel special points are full cm. Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v5-plan-siegel-canonical"></a>

### The Siegel canonical model

Declaration **TauCeti.Shimura.siegel_canonical** (theorem), node `ShimuraVarieties:V5/plan/siegel-canonical`.

The rational polarized Siegel moduli model with the actual adelic symplectic level is a canonical model over the Siegel reflex field Q. Its complex uniformization is the V1/V3 Siegel variety; for every actual special point its Galois action is precisely V4 reciprocity, including polarization, quasi-isogeny and level.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.
2. For every special point use the product-algebra CM criterion and main theorem to identify Galois transport of the represented polarized level object.
3. Compare its scalar action with the special-pair cocharacter reflex norm. Extend to all levels via finite quotients.

Direct inputs: [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), [`ShimuraVarieties:V5/plan/siegel-special-cm`](#shimuravarieties-v5-plan-siegel-special-cm), [`ShimuraVarieties:V5/plan/cm-polarization-level`](#shimuravarieties-v5-plan-cm-polarization-level), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), `PELModuli:M3`, `ShimuraData:D5/siegel-reflex-dual`.

Acceptance checks:

- This is a constructed instance, not a typeclass assumption that a model exists.
- The genus-one determinant/Weil-pairing identification at full level is exported to V8.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.12 and existence proof, pp.125–126. Supports the siegel canonical model. Construct the rational generic Siegel moduli object from M0–M3 and its analytic family comparison.

Atlas planet: **Siegel canonical model**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v6"></a>

## V6. Hodge and abelian type

Inherit canonical models along Hodge embeddings and reconstruct abelian type through the connected canonical object. Its datum is adjoint, and the object includes the adelic/Galois extension, not only a congruence-completion action.

<a id="shimuravarieties-v6-plan-hodge-inheritance"></a>

### Inheritance by Shimura subdata

Declaration **TauCeti.Shimura.hodge_inheritance** (theorem), node `ShimuraVarieties:V6/plan/hodge-inheritance`.

If i:(G,X)↪(H,Y) is a Shimura subdatum and (H,Y) has a canonical tower, then (G,X) has a canonical tower over E(G,X), whose suitable neat levels embed into the ambient tower after base change to a common reflex field. Descent of the image to E(G,X) is proved using actual special points and their reciprocity, not by claiming every C-subvariety of a model descends.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the small-level closed-immersion theorem and transport the ambient Galois action on special points.
2. Field-disjoint special reflex fields and Hecke density establish invariance and the unique descent maps for the image.
3. Apply effective quasi-projective descent with continuity supplied by the finite orbit argument; construct all levels and verify reciprocity.

Direct inputs: [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/special-existence`](#shimuravarieties-v4-plan-special-existence), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- Same derived group alone does not identify full Shimura varieties.
- No absolute-Hodge tensors are assumed in this bare-existence route.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports inheritance by shimura subdata. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Canonical-model inheritance**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v6-plan-hodge-canonical"></a>

### Canonical models of Hodge type

Declaration **TauCeti.Shimura.hodge_canonical** (theorem), node `ShimuraVarieties:V6/plan/hodge-canonical`.

Every Hodge-type datum of D4 has a canonical tower over its reflex field, by choosing its actual embedding into a Siegel datum, applying Siegel existence and subdatum inheritance. The resulting tower is independent of the embedding through canonical-model uniqueness.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Choose the symplectic embedding supplied by the definition of Hodge type.
2. Apply hodge-inheritance to the constructed Siegel model.
3. Use V8 uniqueness only after both candidate models satisfy the full V4 condition; its foundational dependencies are checked to avoid a cycle.

Direct inputs: `ShimuraData:D4/hodge-type`, [`ShimuraVarieties:V5/plan/siegel-canonical`](#shimuravarieties-v5-plan-siegel-canonical), [`ShimuraVarieties:V6/plan/hodge-inheritance`](#shimuravarieties-v6-plan-hodge-inheritance), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness).

Acceptance checks:

- No new Hodge-type definition is introduced.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127. The located passage supports canonical models of hodge type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Hodge-type canonical models**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v6-plan-connected-tower"></a>

### Connected Shimura tower with completed symmetry

Declaration **TauCeti.Shimura.ConnectedTower** (construction), node `ShimuraVarieties:V6/plan/connected-tower`.

For the connected derived datum (G^der,X⁺), whose points are S→G^ad_R and are not required to lift to G^der_R, form the analytic pro-object M⁰=(Γ\X⁺)_Γ and its inverse-limit point set over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Construct the congruence-indexed inverse system and its compatible symmetry, as in the 1983 appendix.
2. Use the Deligne completed-symmetry construction to define the connected canonical datum with actual Galois compatibility. Its exact extension/coherence source must be checked separately, recorded as a gap.

Direct inputs: [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `ShimuraData:D4/adjoint-datum`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` imports `strong-approximation-theorem` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Uses:

- V6 connected-full-equivalence: the completed/Galois symmetry reconstructs all components.
- Milne 1983 §§1–6: the conjugation proof is carried out on this connected pro-object.

API:

- **ConnectedTower.level** (projection): The Γ-level is the actual algebraized quotient Γ\X⁺.
- **ConnectedTower.transition** (functoriality): Subgroup inclusion gives finite algebraic maps; identity and composition hold.
- **ConnectedTower.completedAction** (structure): The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
- **ConnectedTower.canonicalExtension** (data): The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.
- **ConnectedTower.hom_ext** (extensionality): Two morphisms of the congruence-indexed tower diagrams agreeing at each finite level are equal; canonical morphisms additionally commute with the specified completion/Galois extension.
- **ConnectedTower.lift** (universal-property): Compatible holomorphic maps from a test complex analytic space Y to every finite Γ\X⁺ quotient give a unique morphism from the constant pro-object Y to the analytic tower; projections recover those maps. The algebraic tower has the analogous compatible-morphism universal property in its pro-category. No finite-dimensional analytic-space structure is asserted on the inverse-limit point set.

Unit tests:

- **ConnectedTower.trivial** (degenerate): A trivial derived group gives the one-point connected tower.
- **ConnectedTower.sl2** (compatibility): For the GL₂ datum the connected tower is the congruence tower Γ\ℍ induced by SL₂, with effective ±I removed where present.
- **ConnectedTower.not_full** (non-example): A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

Acceptance checks:

- For the connected derived datum (G^der,X⁺), whose points are S→G^ad_R and are not required to lift to G^der_R, form the analytic pro-object M⁰=(Γ\X⁺)_Γ and its inverse-limit point set over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127; 1983 Appendix, p.263. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Connected Shimura tower**.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Connected adjoint datum convention and carrier](#refinement-17).

<a id="shimuravarieties-v6-plan-connected-full-equivalence"></a>

### Connected and full canonical formulations

Declaration **TauCeti.Shimura.connected_full_equivalence** (theorem), node `ShimuraVarieties:V6/plan/connected-full-equivalence`.

A pure Shimura datum admits a full canonical model over E(G,X) if and only if its connected derived tower admits the connected canonical structure with completed adelic/Galois symmetry of V6/connected-tower. The comparison reconstructs finite components and their reciprocity, preserving the completion action; forgetting this symmetry invalidates the equivalence.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Deligne 2.7.13/Milne 14.15 to restrict and reconstruct the components with the extension action.
2. Check the Artin action on component classes and the stabilizing completion subgroup.
3. The precise connected extension and gluing formulas remain a primary-source refinement, explicitly shared with connected-tower.

Direct inputs: [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), [`ShimuraVarieties:V4/plan/torus-model`](#shimuravarieties-v4-plan-torus-model), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model).

Acceptance checks:

- The assertion is not an isomorphism between connected and full varieties.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127. The located passage supports connected and full canonical formulations. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v6-plan-connected-products"></a>

### Products of connected canonical models

Declaration **TauCeti.Shimura.connected_products** (theorem), node `ShimuraVarieties:V6/plan/connected-products`.

The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Take product inverse systems and product level quotients.
2. Use reflex-norm functoriality to compare marked tori and the Galois extension.
3. Apply compatible finite-component descent where the full datum is reconstructed.

Direct inputs: [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), `ShimuraData:D4/product-datum`.

Acceptance checks:

- Product datum reflex field is the compositum, not necessarily either individual field.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(a), p.127. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v6-plan-central-isogeny-descent"></a>

### Central-isogeny descent of connected models

Declaration **TauCeti.Shimura.central_isogeny_descent** (theorem), node `ShimuraVarieties:V6/plan/central-isogeny-descent`.

For a central isogeny f:G₁→G₂ of semisimple derived groups with compatible connected data and a connected canonical model of (G₁,X₁⁺), the connected tower for (G₂,X₂⁺) is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be G₁, correcting the repeated G₂ misprint.

Hypotheses:

- Connected data use the Appendix (C1)–(C3) class of S→G^ad_R recorded in V6/connected-tower; an S-map into the semisimple cover is not assumed. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Compute the map of completed adjoint rational symmetry and its kernel; finite-level images act on the source quotient.
2. Construct the effective finite algebraic quotients and descend their Galois symmetry.
3. Verify reciprocity by central-isogeny compatibility of the cocharacter norm; compare the inverse systems.
4. Central isogenies identify the adjoint groups and hence the S-maps of connected data; no algebraic lift S→G₁ is required. D4/central-isogeny-lift only treats a given lift of a full datum and does not supply such an existence assertion.

Direct inputs: [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- This gives a quotient, not an identification of full varieties with the same derived group.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127. The located passage supports central-isogeny descent of connected models. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Central-isogeny descent**.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Connected adjoint datum convention and carrier](#refinement-17).

<a id="shimuravarieties-v6-plan-abelian-canonical"></a>

### Canonical models of abelian type

Declaration **TauCeti.Shimura.abelian_canonical** (theorem), node `ShimuraVarieties:V6/plan/abelian-canonical`.

Every abelian-type datum as defined in D4 admits a canonical tower over its reflex field. Use the Hodge-type witness, products and central-isogeny descent for the connected derived datum, then connected-full-equivalence. The full components and reflex-field action are reconstructed rather than identified with those of the Hodge-type witness.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Apply the actual abelian-type central-isogeny relation to the derived connected data.
2. Descend the Hodge-type connected model through its completion kernel; reconstruct the target full tower.
3. Check V4 on all special pairs and use uniqueness to remove witness choices.

Direct inputs: `ShimuraData:D4/abelian-type`, [`ShimuraVarieties:V6/plan/hodge-canonical`](#shimuravarieties-v6-plan-hodge-canonical), [`ShimuraVarieties:V6/plan/connected-products`](#shimuravarieties-v6-plan-connected-products), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence).

Acceptance checks:

- This branch does not depend on V7 general-data conjugation.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §14, pp.127–128. The located passage supports canonical models of abelian type. The stated specializations and proof-source refinements are identified in the proof steps and gap register.

Atlas planet: **Abelian-type canonical models**.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v7"></a>

## V7. General data: conjugation and descent

Reduce general data to the marked simply connected conjugation problem. Construct the Serre/Taniyama twist using its requested common owner, establish exceptional uniformization, marked equivariance and the cocycle, then apply continuous effective descent.

<a id="shimuravarieties-v7-plan-simple-connected-reduction"></a>

### Reduction to simple simply connected data

Declaration **TauCeti.Shimura.simple_connected_reduction** (theorem), node `ShimuraVarieties:V7/plan/simple-connected-reduction`.

To prove general canonical-model existence it suffices to prove marked conjugation with completed symmetry for connected data whose group is semisimple simply connected and almost Q-simple. Such a group is Res_{F/Q}G′ for a totally real number field F and an absolutely almost simple simply connected F-group G′. Products, the derived central cover and V6 reconstruction then restore the original reductive datum.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use the classification of Q-simple semisimple groups as restrictions of scalars and the real Cartan condition to force F totally real.
2. Separate the central torus/component reconstruction from the semisimple conjugation assertion.
3. Use product and central-isogeny descent only with their completed symmetry; do not identify full data by derived groups.

Direct inputs: [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence), [`ShimuraVarieties:V6/plan/connected-products`](#shimuravarieties-v6-plan-connected-products), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), `ShimuraData:D4/shimura-datum`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`.

Current upstream interfaces:

- `ReductiveGroupsPartII:RG2.0a` imports `RG2.0a` from `tauceti:TauCetiRoadmap/ReductiveGroupsPartII#layer-rg20a-weil-restriction-and-the-deligne-torus`. Existing current-upstream Weil restriction and Deligne torus contract. The atlas stage id is its checked dependency key; this reference is not a pinned-library declaration.

Acceptance checks:

- Exceptional Hermitian E₆/E₇ factors remain in scope.
- No Langlands conjugation theorem is imported as an established prerequisite.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 7.1, p.262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Simple connected reduction**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v7-plan-auxiliary-cm-splitting"></a>

### Auxiliary totally real splitting extension

Declaration **TauCeti.Shimura.auxiliary_cm_splitting** (theorem), node `ShimuraVarieties:V7/plan/auxiliary-cm-splitting`.

For the simple connected case and a maximal torus T′⊂G′ whose adjoint image contains the marked S-map, choose a finite totally real extension F′/F such that the base-changed torus splits over a CM quadratic extension L′/F′. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. The adjoint special torus is compact at every real place by the Cartan condition; since G′ is semisimple, its preimage T′ is also compact. Complex conjugation acts as −1 on its character lattice at every real embedding. In a finite Galois splitting field this involution is central, so the splitting field is CM; take a totally real extension containing its maximal real subfield, making the compositum quadratic CM.
2. Construct the diagonal inclusion into Res_{F′/Q}(G′_{F′}) with the induced components.
3. Apply the subgroup comparison principle of Milne 1.6 and §6.4. Compatibility and choice independence are checked in the marked comparison.

Direct inputs: [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0a`, [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), `ShimuraData:D4/adjoint-datum`.

Current upstream interfaces:

- `ReductiveGroupsPartII:RG2.0a` imports `RG2.0a` from `tauceti:TauCetiRoadmap/ReductiveGroupsPartII#layer-rg20a-weil-restriction-and-the-deligne-torus`. Existing current-upstream Weil restriction and Deligne torus contract. The atlas stage id is its checked dependency key; this reference is not a pinned-library declaration.

Acceptance checks:

- The extension need not be chosen canonically.
- Its purpose is splitting the special torus, not turning an exceptional group into abelian type.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, p.253; §6, pp.260–262; SVI §14, p.128. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Connected adjoint datum convention and carrier](#refinement-17), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v7-plan-rank-one-subdata"></a>

### Root subdata of type A₁

Declaration **TauCeti.Shimura.rank_one_subdata** (theorem), node `ShimuraVarieties:V7/plan/rank-one-subdata`.

Assume T′ splits over a CM quadratic L/F. For each root α of (G′,T′) noncompact at some real place, the Lie algebra Lie(T′)⊕g_α⊕g_{−α} descends to a reductive F-subgroup H′_α containing T′, whose derived group has type A₁. Res_{F/Q}H′_α has an induced adjoint S-map obtained by projecting h through T^ad→(H′_α)^ad. After taking the simply connected cover of its derived group and removing compact ineffective factors it gives the required connected rank-one subdatum. No lift of h to that cover is required.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. The quadratic CM involution exchanges α and −α, so the displayed Lie algebra is stable under Gal(L/F).
2. Construct the reductive subgroup generated by T′ and the ±α root groups and descend it by quadratic Galois stability. Project the marked S-map to its adjoint group, then verify Hodge types and the Cartan condition. The semisimple cover carries the same adjoint S-map; do not use a full-datum lift existence assertion.
3. Use the A₁ symplectic realization and V5/V6 to prove its marked conjugation comparison from CM, not just canonical-model existence. The precise A₁ comparison bridge is an explicit refinement gap.

Direct inputs: [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, [`ShimuraVarieties:V6/plan/abelian-canonical`](#shimuravarieties-v6-plan-abelian-canonical), `ShimuraData:D4/adjoint-datum`.

Acceptance checks:

- A root may be compact at some places and noncompact at another.
- No claim that arbitrary A₁ subgroups generate G^ad(Q)^+.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, pp.253–254; Remark 1.5, p.242. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Rank-one Shimura subdata**.

Remaining refinements: [A₁ comparison and completion density](#refinement-12), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Connected adjoint datum convention and carrier](#refinement-17).

<a id="shimuravarieties-v7-plan-rank-one-central-separation"></a>

### Central separation by noncompact roots

Declaration **TauCeti.Shimura.rank_one_central_separation** (theorem), node `ShimuraVarieties:V7/plan/rank-one-central-separation`.

In the CM-split simple case, let Z_α=Z(H_α), with α ranging over roots noncompact at some real place. Then Z(G)=∩_α Z_α. Put Tbar=T/Z(G) and Zbar_α=Z_α/Z(G). Regard Zbar_α(A_f)/Zbar_α(Q) as subgroups of the abelian quotient Tbar(A_f)/Tbar(Q); their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use irreducibility of the absolute root system and Galois action to show the relevant noncompact roots span the root lattice as required by Proposition 4.3.
2. Compute each subgroup centre by vanishing of its root characters.
3. Apply Corollary 4.4 to their adelic intersections with the rational quotient retained.

Direct inputs: [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- The claim is the explicit centre intersection, not a stronger rational-generation theorem.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 4.3 and Corollary 4.4, p.254. Corollary 4.4 places the intersection in Tbar(A_f)/Tbar(Q), an abelian quotient; no quotient group by a nonnormal subgroup of an adjoint group is used.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v7-plan-conjugated-datum"></a>

### Marked conjugated Shimura datum

Declaration **TauCeti.Shimura.conjugatedDatum** (construction), node `ShimuraVarieties:V7/plan/conjugated-datum`.

Let G/Q be semisimple simply connected with connected datum X⁺, a G^ad(R)^+-class of h:S→G^ad_R satisfying the connected Shimura conditions. Choose a maximal rational torus T⊂G with h factoring through T^ad=T/Z(G); this is a D4 special pair for the adjoint datum. For τ∈Aut(C), the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1 supplies the Serre-protorus torsor S_τ and its distinguished finite-adelic point. The marked cocharacter μ_h is in X_*(T^ad), and gives ρ_h:S→T^ad. Use this inner action to form {}^{τ,h}G=S_τ×^S G. T is unchanged, {}^τh:S→({}^{τ,h}G)^ad_R factors through T^ad with cocharacter τμ_h, and {}^{τ,h}X⁺ is its connected adjoint real class. Retain the distinguished topological isomorphism G(A_f)≅{}^{τ,h}G(A_f). This construction is of connected data, not a full pure datum on the simply connected group.

Hypotheses:

- G is semisimple simply connected over Q; h:S→G^ad_R lies in X⁺ with the Appendix (C1)–(C3) conditions. The maximal special torus is read in the adjoint datum and pulled back to G. No lift h:S→G_R is assumed.

Construction or proof:

1. Construct the Serre/Taniyama extension and its finite-adelic splitting from the corrected reciprocity class formation; this missing common CM supplier is explicitly requested and recorded as a gap.
2. Form the contracted product for ρ_h:S→T^ad acting by conjugation. The pulled-back maximal torus T is unchanged because this action on T is trivial.
3. Descend τμ_h in T^ad to {}^τh:S→({}^{τ,h}G)^ad_R and verify the connected Shimura conditions. Compute the finite-local trivializations and the real class τμ_h(−1)/μ_h(−1) in H¹(R,T^ad); do not demand an S-map into the simply connected cover.

Direct inputs: [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), `ShimuraData:D4/special-pair`, `ShimuraData:D3/cocharacter-class`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraData:D4/adjoint-datum`, [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower).

Uses:

- Milne 1983 Theorem 1.1: the marked target of the comparison is this actual inner form.
- V7 special-independence: compares twists obtained from two special tori.
- V7 general-canonical: identifies the twist with the original datum for reflex-field-fixing automorphisms.

API:

- **conjugatedDatum.group** (projection): The rational group is the contracted product inner form S_τ×^S G.
- **conjugatedDatum.specialTorus** (data): The unchanged T embeds into the twist; the marked S-map factors through T^ad in the adjoint group and has cocharacter τμ_h.
- **conjugatedDatum.adelic** (equivalence): The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
- **conjugatedDatum.localClass** (characterisation): The inner twist is finite-locally trivial and its real cohomology class is represented by τμ_h(−1)/μ_h(−1).
- **conjugatedDatum.map** (functoriality): An inclusion of connected data preserving the marked adjoint torus/cocharacter induces the compatible inclusion of twists and their adelic trivializations. Identity and composition hold.
- **conjugatedDatum.descent_ext** (extensionality): Two morphisms of contracted-product twists agreeing after a common torsor-trivializing faithfully flat extension are equal; marked isomorphisms also retain the torus and distinguished adelic trivialization.

Unit tests:

- **conjugatedDatum.identity** (degenerate): For τ=id the distinguished torsor section gives the original datum and identity adelic map.
- **conjugatedDatum.sl2_conjugation** (computation): For G=SL₂ with the norm-one Q(i) torus and the standard upper-half-plane adjoint S-map, τ equal to complex conjugation sends μ_h to its inverse and selects the lower-half-plane component. The group twist is split SL₂: the real obstruction μ_h(−1)⁻² is trivial and all finite local obstructions vanish. The marked adjoint homomorphism changes even though the group remains isomorphic.
- **conjugatedDatum.finiteLocal** (compatibility): For each finite prime p and t∈T(Q_p), the distinguished local isomorphism sends the embedded t to the same t in the untwisted marked torus of {}^{τ,h}G. An arbitrary unmarked local isomorphism need not have this property.

Acceptance checks:

- Let G/Q be semisimple simply connected with connected datum X⁺, a G^ad(R)^+-class of h:S→G^ad_R satisfying the connected Shimura conditions. Choose a maximal rational torus T⊂G with h factoring through T^ad=T/Z(G); this is a D4 special pair for the adjoint datum. For τ∈Aut(C), the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1 supplies the Serre-protorus torsor S_τ and its distinguished finite-adelic point. The marked cocharacter μ_h is in X_*(T^ad), and gives ρ_h:S→T^ad. Use this inner action to form {}^{τ,h}G=S_τ×^S G. T is unchanged, {}^τh:S→({}^{τ,h}G)^ad_R factors through T^ad with cocharacter τμ_h, and {}^{τ,h}X⁺ is its connected adjoint real class. Retain the distinguished topological isomorphism G(A_f)≅{}^{τ,h}G(A_f). This construction is of connected data, not a full pure datum on the simply connected group.
- For the standard SL₂ connected datum the Hodge cocharacter lives in PGL₂, and need not lift to an integral cocharacter of SL₂.

Source: [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), Introduction, p.281 (Taniyama torsor and contracted product). The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Remark 1.4, pp.241–242; Appendix (C), pp.262–263. The Appendix puts the connected S-map in the adjoint group. Remark 1.4 records the marked-torus twist, finite-place triviality and real class; its shorthand is interpreted using that carrier.

Atlas planet: **Conjugated Shimura datum**.

Remaining refinements: [Serre/Taniyama extension common owner](#refinement-9), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Connected adjoint datum convention and carrier](#refinement-17).

<a id="shimuravarieties-v7-plan-kazhdan-uniformization"></a>

### Uniformization of conjugate arithmetic quotients

Declaration **TauCeti.Shimura.kazhdan_uniformization** (theorem), node `ShimuraVarieties:V7/plan/kazhdan-uniformization`.

For a torsion-free arithmetic Hermitian quotient Γ\D and τ∈Aut(C), the universal cover of τ(Γ\D) is a Hermitian symmetric domain D′, and its fundamental group acts as a lattice in Aut(D′)^+. This is a key theorem to prove, with its exceptional noncompact cases included.

Hypotheses:

- Γ is torsion-free effective arithmetic; D is Hermitian symmetric; τ is any field automorphism of C.

Construction or proof:

1. For symplectic/abelian-type quotients use moduli and polarized families. For compact quotients use the relevant metric theorem.
2. For the remaining E₆/E₇ and mixed D cases read and decompose Kazhdan’s primary proof; Milne 3.2 cites its result and does not supply the missing analytic argument.
3. Record that argument as a gap rather than assuming the general conjugation theorem.

Direct inputs: [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V3/plan/unique-algebraization`](#shimuravarieties-v3-plan-unique-algebraization), [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- This does not claim π₁ is unchanged by τ.
- The exceptional-case primary argument remains a named proof obligation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 3.2, p.246. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Kazhdan exceptional uniformization proof](#refinement-10), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-weak-conjugation"></a>

### Weak connected conjugation comparison

Declaration **TauCeti.Shimura.weak_conjugation** (theorem), node `ShimuraVarieties:V7/plan/weak-conjugation`.

For a semisimple simply connected connected datum and τ∈Aut(C), there exist another connected datum (G₁,X₁⁺), an algebraic tower isomorphism τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺), and a compatible finite-adelic group isomorphism. This assertion does not yet identify G₁ with the special-torus twist.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Lift the conjugated Hecke correspondences to the universal Hermitian cover to construct Γ₀ and its compatible finite-adelic map, as in 3.3–3.5.
2. Use the precise S-arithmetic arithmeticity and superrigidity results at sufficiently large S, with rank at least two, to recover G₁ and its compatible local maps (3.6–3.7).
3. Handle the nonexceptional central obstruction using corrected 3.8. In the exceptional Aₙ cases §3.10 uses rank-one subgroups after a totally real extension making their semisimple forms isotropic at all finite places. Platonov–Rapinchuk 1979 Theorem 1 proves perfection of SL₁(D), not simplicity; it cannot be applied as a no-noncentral-normal-subgroup theorem to the full reductive Hα containing T. The exact passage from the semisimple perfection result to the central adjustment on the marked torus is an explicit proof gap (E12). Finite étale comparison rigidity in §§2.1–2.2 then gives the tower isomorphism once this adjustment is justified.

Direct inputs: [`ShimuraVarieties:V7/plan/kazhdan-uniformization`](#shimuravarieties-v7-plan-kazhdan-uniformization), [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ArithmeticLocallySymmetricSpaces:ALS.0`, [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata).

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` imports `strong-approximation-theorem` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- The finite adelic map does not identify the real forms.
- The corrected 3.8 concerns H¹(k,Z), not H¹(k,G).
- Do not infer simplicity or perfection of a full reductive rank-one group with a positive-dimensional centre from perfection of its simply connected semisimple factor.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 3.1 and §§3.3–3.10, pp.245–252. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Source: [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), Theorem 1, p.279; final discussion, p.282 (Russian published original). For a quaternion algebra D over a number field, the norm-one group is perfect when D is split at every finite place; every element is a product of at most three commutators. The final discussion still treats simplicity modulo centre as a conjecture. Neither assertion supplies simplicity of the full reductive Hα in Milne §3.10.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Remaining refinements: [Kazhdan exceptional uniformization proof](#refinement-10), [S-arithmetic and central-cohomology supplier extension](#refinement-11), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Exceptional central adjustment and rank-one perfection](#refinement-18).

<a id="shimuravarieties-v7-plan-marked-conjugation"></a>

### Conjugation comparison with a marked special point

Declaration **TauCeti.Shimura.marked_conjugation** (theorem), node `ShimuraVarieties:V7/plan/marked-conjugation`.

For the simple simply connected case, τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺) by an algebraic isomorphism sending τ[h] to [{}^τh] and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded A₁ subvarieties.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Compare the weak target’s embedded special torus and its tangent characters; the tangent weights recover the transformed cocharacter (5.1–5.2).
2. At the CM-split auxiliary extension compare both maps on every rank-one subvariety using the established A₁/CM comparison.
3. The centre intersection forces the residual adelic adjustment to be rational. Normalize the marked point and use density of its rational/adelic orbit for uniqueness.

Direct inputs: [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation), [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum), [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/rank-one-central-separation`](#shimuravarieties-v7-plan-rank-one-central-separation), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V6/plan/abelian-canonical`](#shimuravarieties-v6-plan-abelian-canonical).

Acceptance checks:

- No chosen isomorphism or Langlands axiom is an input.
- The construction is valid for exceptional Hermitian types.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 1.1 and uniqueness Remark 1.3, p.241; §§4–5, pp.253–256. Theorem 1.1 gives existence of the marked comparison. Remark 1.3 supplies uniqueness from the dense rational orbit; these are separate inputs.

Atlas planet: **Marked conjugation comparison**.

Remaining refinements: [A₁ comparison and completion density](#refinement-12), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-completed-conjugation-equivariance"></a>

### Equivariance for completed symmetry

Declaration **TauCeti.Shimura.completed_conjugation_equivariance** (theorem), node `ShimuraVarieties:V7/plan/completed-conjugation-equivariance`.

The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely G(A_f). Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use the finite-base-extension functoriality of the completed groups as in Proposition 6.1 and MS §8.
2. Prove the precise density and compatibility needed to extend equivariance continuously. The annotated scan deletes an extra proposed rank-one generator family; no such stronger generation claim is used.
3. Compare finite levels to obtain the completed action identity. Its exact density statement/source decomposition is an explicit gap.

Direct inputs: [`ShimuraVarieties:V7/plan/marked-conjugation`](#shimuravarieties-v7-plan-marked-conjugation), [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Equivariance for G(A_f) alone does not establish the connected canonical formulation.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 6.1, p.257; MS §8, pp.340–341. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [A₁ comparison and completion density](#refinement-12), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-special-independence"></a>

### Independence of the marked special point

Declaration **TauCeti.Shimura.special_independence** (theorem), node `ShimuraVarieties:V7/plan/special-independence`.

For maximal special h,h′ in X⁺, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

Hypotheses:

- Connected datum means the Appendix (C1)–(C3) adjoint S-map convention recorded in V6/connected-tower. Any special pair in this connected setting is instantiated in the adjoint datum, then its maximal torus is pulled back to the semisimple group. All additional hypotheses in the statement are mandatory.

Construction or proof:

1. Use the Hasse-principle comparison of adjoint inner forms and explicit special-torus transition to define the comparison diagram (6.3–6.5).
2. After simultaneous CM splitting of the two tori, measure their real discrepancy by the sum of Weyl lengths. At length zero kill the positive torus norm obstruction by a further totally real extension.
3. For a compact reflection shorten via the real normalizer; for a noncompact reflection use its A₁ subgroup and weak approximation to localize the change at one real place. Induct on the length and compare common refinements.

Direct inputs: [`ShimuraVarieties:V7/plan/marked-conjugation`](#shimuravarieties-v7-plan-marked-conjugation), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance), [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptance checks:

- Point-independence is proved by Weyl-length induction, not asserted from density of one chosen orbit.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.3 and proof, pp.258–262. The comparison diagrams in §6 give compatibility of marked comparisons. The transition/coherence construction remains tied to the recorded MS1982d and completed-symmetry refinement, rather than inferred from the word independent.

Remaining refinements: [S-arithmetic and central-cohomology supplier extension](#refinement-11), [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Arithmetic reductive supplier ownership](#refinement-19).

<a id="shimuravarieties-v7-plan-conjugation-cocycle"></a>

### Reflex-field descent cocycle

Declaration **TauCeti.Shimura.conjugation_cocycle** (theorem), node `ShimuraVarieties:V7/plan/conjugation-cocycle`.

For σ fixing E(G,X), identify the conjugated datum with the original through the transformed cocharacter class and special-point-independent transition. The comparison defines an equivariant algebraic descent system f_σ:σSh_C→Sh_C with f_{στ}=f_σ∘σ(f_τ), compatible with levels, right translations and the actual special-pair reciprocity formula.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Reassemble connected comparisons through the central/torus component extension.
2. Normalize reflex-field-fixing twists using the cocharacter class and prove the same special-point action as V4.
3. Apply uniqueness of marked comparisons and transitive transitions to identify the two composites. This produces the cocycle law; continuity is a distinct next theorem.

Direct inputs: [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance), [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm).

Acceptance checks:

- A set-theoretic cocycle without continuity is insufficient for effective descent.

Source: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorems 7.1–7.2, p.262; Descent §2. Theorem 7.2 is the canonical-model consequence, not an explicit proof of the cocycle formula. Its MS1982d §7 reference and the torsor multiplication/marked-independence inputs supply that proof route; exact coherence is a recorded gap.

Remaining refinements: [Connected canonical symmetry and coherence](#refinement-8), [Serre/Taniyama extension common owner](#refinement-9), [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-finite-rigidifying-points"></a>

### Finite rigidifying special points

Declaration **TauCeti.Shimura.finite_rigidifying_points** (theorem), node `ShimuraVarieties:V7/plan/finite-rigidifying-points`.

At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset Σ whose pointwise stabilizer is trivial. In dimension zero the finite point set itself is a rigidifying set. The constructed descent system fixes Σ over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Use Milne 1999 Lemma 2.2: the normalizer of the arithmetic group is discrete and finite covolume gives finite index, or apply the log-general-type argument. The exact normalizer theorem is requested from ALS.0.
2. For each nonidentity automorphism choose a special orbit point it moves; their finite union rigidifies.
3. Reciprocity at finite level gives an open Galois stabilizer for each point; take a finite extension fixing all of them. For zero-dimensional levels use the explicit finite étale Galois set.
4. For a zero-dimensional finite étale level use all geometric points to rigidify its finite permutation group; do not impose positive dimension in the final canonical-model theorem.

Direct inputs: [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), `ArithmeticLocallySymmetricSpaces:ALS.0`.

Acceptance checks:

- A finite subset of an arbitrary orbit need not rigidify; density and finite automorphisms are used.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and Theorem 2.3, pp.4–5. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-continuous-descent"></a>

### Continuity of the canonical descent system

Declaration **TauCeti.Shimura.continuous_descent** (theorem), node `ShimuraVarieties:V7/plan/continuous-descent`.

The canonical descent system at each neat level is continuous: it splits over a finitely generated field extension of E inside C in the sense of Milne 1999 Theorem 1.1. A finite rigidifying subset fixed over a finite field forces this property by Corollary 1.2. Level comparisons then give the required compatible system at all levels.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. Spread the variety and the finite rigidifying subset to a finitely generated field L.
2. For automorphisms fixing L the canonical comparisons and the split comparisons agree on Σ and hence agree globally.
3. Invoke the corrected continuity criterion; do not cite the older 1994 lemma with this hypothesis omitted.

Direct inputs: [`ShimuraVarieties:V7/plan/finite-rigidifying-points`](#shimuravarieties-v7-plan-finite-rigidifying-points), [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The infinite-transcendence hypothesis Ω=C over a number field satisfies the descent theorem.
- Open stabilizers of individual points alone are not a replacement for the finite rigidification argument.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2. The passage supplies the stated target; the proof sketch identifies specializations and explicit gaps rather than treating the source as an axiom.

Atlas planet: **Continuous canonical descent**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v7-plan-general-canonical"></a>

### Canonical models for every pure datum

Declaration **TauCeti.Shimura.general_canonical** (theorem), node `ShimuraVarieties:V7/plan/general-canonical`.

Every pure Shimura datum admits a canonical tower over its reflex field, satisfying V4 at every level and independent of the auxiliary extension and marked special point. Apply effective quasi-projective descent to the continuous cocycle constructed above, descend finite quotients and level actions, and verify special reciprocity by comparison over C.

Hypotheses:

- Pure datum means D4/shimura-datum; all additional hypotheses in this statement are mandatory.

Construction or proof:

1. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.
2. Descend all compatible finite-level maps using the constructed equivariant system; extend to non-neat levels by finite quotients.
3. The established canonical descent action verifies the exact V4 field of definition and geometric-Artin formula. Compare auxiliary choices through special-independence and specified analytic identity.

Direct inputs: [`ShimuraVarieties:V7/plan/continuous-descent`](#shimuravarieties-v7-plan-continuous-descent), [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- This target remains planned with explicitly named proof-source and supplier gaps; it is not a claim of implementation or gap-free proof.

Source: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2. Supports canonical models for every pure datum. At neat level combine quasi-projectivity from V2/V3 with Milne 1999 Theorem 1.1 to obtain an E-scheme and complex comparison.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v8"></a>

## V8. The algebraic tower and modular-curve comparison

Apply conditional descent and functoriality to actual models. The GL2 comparisons retain all determinant components and distinguish fine from coarse moduli. Minimal descent uses the V2 complex logarithmic system and explicitly supplied broader auxiliary models.

<a id="shimuravarieties-v8-plan-level-tower"></a>

### Canonical algebraic level tower

Declaration **CanonicalTower.ofLevelMaps** (construction), node `ShimuraVarieties:V8/plan/level-tower`.

For actual canonical models M_K, assemble the unique descended forgetful maps pi_{K,L} for K contained in L into the functor CanonicalTower.ofLevelMaps: Level(D) -> Over(Spec E), using V1/level-index. Its values are the actual supplied canonical models. Identity and composition follow from their complex counterparts and uniqueness of descent; base change uses the native slice-category pullback.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The categorical assembly signature takes the already proved identity and composition laws for the descended transitions. These laws are obtained here by uniqueness, rather than assumed in the mathematical descent theorem.

Construction or proof:

1. Apply translation-descent at g=1 to every inclusion.
2. The identity and composition equations hold over C by V1 and descend by uniqueness. Package these maps with the existing Functor constructor; retain the actual structure morphism in Over(Spec E).
3. After any extension E -> F, use Over.pullback to base change the entire functor; identity and successive base changes use the native natural isomorphisms.

Direct inputs: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V1/level-index`](#shimuravarieties-v1-level-index), `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Over`, `mathlib:CategoryTheory.Over.pullback`, `mathlib:CategoryTheory.Over.pullbackId`, `mathlib:CategoryTheory.Over.pullbackComp`, `mathlib:AlgebraicGeometry.Scheme`.

Uses:

- PerfectoidShimuraVarieties:S0, S2, S4: Supplies finite-level schemes and compatible maps before any inverse-limit or perfectoid construction..
- Milne 12.10 and ShimuraVarieties:V8.general: The canonical-model tower is a single functor; general existence supplies its values..
- ShimuraCompactifications:C2 and AutomorphicBundles:B1: Supplies arithmetic transition morphisms and common-base diagrams..

API:

- **CanonicalTower.ofLevelMaps_obj** (projection): At i the constructor has value M(i), with its given map to the base.
- **CanonicalTower.ofLevelMaps_map** (projection): On an inclusion K -> L the functor evaluates to the unique descended forgetful transition pi_{K,L}.
- **CanonicalTower.ofLevelMaps_id** (simp): The map of the identity arrow at i is the identity of M(i).
- **CanonicalTower.ofLevelMaps_comp** (functoriality): The map of f followed by g is t(f) followed by t(g).
- **CanonicalTower.ofLevelMaps_baseChange** (compatibility): Postcomposing with Over.pullback(b) sends a transition f to the pullback of t(f), on the pulled-back models. This uses native base change rather than a second scheme carrier.

Unit tests:

- **CanonicalTower.test_identity_level** (degenerate): At any level K, t(id_K) is the identity of M_K.
- **CanonicalTower.test_nested_levels** (compatibility): For K1 contained in K2 contained in K3, the constructor map of the composite inclusion equals pi_{K1,K2} followed by pi_{K2,K3}.
- **CanonicalTower.test_preserves_supplied_arrow** (characterisation): For a supplied arrow f and a morphism u distinct from t(f), the constructor map of f is not u; replacing transitions by zero or arbitrary maps fails this test.
- **CanonicalTower.test_base_change** (compatibility): The base-changed constructor map on f is exactly Over.pullback(b).map(t(f)).
- **CanonicalTower.test_gl2_jline_degree** (computation): For GL2 and N >= 3 the tower map from level K(N) to GL2(Zhat) is identified with the j-map Y_full(N)_Q -> A^1_Q (gl2-full-level, PR81 9E); its degree is |GL2(Z/N)|/2 because -1 acts trivially, so 24 at N = 3, and |GL2(F_3)| = 48.
- **CanonicalTower.test_not_constant** (non-example): The tower is not constant: for GL2, M_{K(N)} has phi(N) geometric connected components (component-reciprocity) while M_{GL2(Zhat)} is geometrically connected, so for N >= 3 the transition is not an isomorphism; phi(3) = 2.

Acceptance checks:

- All levels retain their given structure morphisms to Spec E.
- A composite of three inclusions gives the same map for either parenthesization.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(a), p.65; 12.10, p.115; 13.7(b), p.119. Assemble the algebraic models with their actual maps. Neither an infinite-level scheme nor its point formula is required.

Atlas planet: **Canonical algebraic tower**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-translation-laws"></a>

### Right translation laws on the algebraic tower

Declaration **CanonicalTower.translation_comp** (theorem), node `ShimuraVarieties:V8/plan/translation-laws`.

The descended T_g obey T_1=id at equal levels and T_h composed after T_g equals T_{gh}, whenever g^{-1}Kg is contained in L and h^{-1}Lh is contained in P. For k in K the equal-level T_k is the identity. For a fixed g the conjugate-level isomorphisms form a natural transformation from the tower to the conjugated-index tower.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. V1 proves these identities on the double quotient.
2. Compare the descended E-morphisms after faithful C-base change; use uniqueness. The product is gh in this right-action convention.

Direct inputs: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/level-tower`](#shimuravarieties-v8-plan-level-tower), [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For g,h represented by noncommuting GL2 matrices, check gh rather than hg.
- No action of all G(A_f) on one finite-level scheme is asserted.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(b)–(c), p.65. Source/target levels and coherent right translations.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Discussion before Definition 5.14, p.58. Pins the convention T(gh)=T(h)∘T(g): first T(g), then T(h).

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-finite-level-maps"></a>

### Finite level maps and effective deck groups

Declaration **CanonicalTower.level_map_finite** (theorem), node `ShimuraVarieties:V8/plan/finite-level-maps`.

For K1 contained in K2, pi_{K1,K2} is finite and surjective over E; when K2 (hence K1) is neat it is finite étale. If K1 is normal in K2, M_{K2} is the quotient of M_{K1} by the effective image of K2/K1 in automorphisms of M_{K1}; its kernel consists of elements acting trivially on the actual quotient (for GL2 and K(N) normal in GL2(Zhat), the element -1 acts trivially, so the effective group is GL2(Z/N)/{±1}). Deck groups and degree use this effective quotient, not K2/K1 without a kernel calculation.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Construction or proof:

1. V1 supplies finite analytic coverings and the effective stabilizer calculation. V3 supplies finite algebraic maps and finite quotients at non-neat levels.
2. Finiteness, surjectivity and, for neat K2, étaleness descend along C/E. Apply the finite quotient universal property to the descended effective action.

Direct inputs: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/translation-laws`](#shimuravarieties-v8-plan-translation-laws), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D5/neat-level`, `mathlib:AlgebraicGeometry.IsFinite`.

Acceptance checks:

- For torus data the dimension is zero; level morphisms are finite étale.
- Non-neat levels retain elliptic stabilizer ramification, so étaleness is not exported there.
- Y_full(3) -> Y(1) (the j-line) has degree |GL2(F_3)|/2 = 24 and ramifies over j = 0 and j = 1728: the target level GL2(Zhat) is not neat.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(c), p.65. Finite quotient statement of 5.29(c), with the effective-kernel qualification inherited from V1.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-hecke-span"></a>

### Algebraic Hecke correspondence

Declaration **CanonicalHecke.span** (construction), node `ShimuraVarieties:V8/plan/hecke-span`.

For D, actual canonical models and g in G(A_f), put J=K intersect gKg^{-1}. Construct CanonicalHecke.span as the native WalkingSpan diagram in Over(Spec E), with apex M_J, first leg pi_{J,K}, and second leg T_g:M_J -> M_{g^{-1}Jg} followed by pi_{g^{-1}Jg,K}. Both legs are finite.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- g is a finite-adelic element and K is compact open.

Construction or proof:

1. D5/V1 supply J, conjugate levels and both inclusion witnesses.
2. Apply translation-descent and finite-level-maps to obtain the two E-morphisms.
3. Use CategoryTheory.Limits.span, preserving the order of the two legs. The complex comparison is the V1 correspondence; applying native spanCompIso to Over.pullback supplies its base-change isomorphism.

Direct inputs: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V1/plan/holomorphic-hecke`](#shimuravarieties-v1-plan-holomorphic-hecke), `mathlib:CategoryTheory.Limits.span`, `mathlib:CategoryTheory.Limits.spanCompIso`, `mathlib:CategoryTheory.Over.pullback`.

Uses:

- Milne 13.6 and ShimuraCompactifications:C3: Uses the two separately descended finite morphisms; compactification extends the same ordered span..
- ModularCurvesPartII:R12.5 and HeegnerPointEulerSystems: Compares finite correspondences with moduli isogenies before applying pull-push to coefficients..

API:

- **CanonicalHecke.span_apex** (projection): The value at WalkingSpan.zero is the supplied apex M_J.
- **CanonicalHecke.span_first** (projection): The image of WalkingSpan.Hom.fst is exactly pi_{J,K}.
- **CanonicalHecke.span_second** (projection): The image of WalkingSpan.Hom.snd is exactly T_g followed by pi_{g^{-1}Jg,K}.
- **CanonicalHecke.span_baseChange** (compatibility): Postcomposing the span with Over.pullback(b) is naturally isomorphic to native span on the two pulled-back legs, by spanCompIso.

Unit tests:

- **CanonicalHecke.test_identity** (degenerate): For equal apex and endpoints and both supplied legs the identity (the g=1 case), both WalkingSpan arrows evaluate to the identity.
- **CanonicalHecke.test_native_span** (compatibility): The constructed ordered diagram equals CategoryTheory.Limits.span(p1,p2) on the supplied legs.
- **CanonicalHecke.test_distinct_legs** (non-example): For two endomorphisms p1,p2 of a supplied apex with p1 distinct from p2, the first-leg evaluation is not p2. A construction that swaps the two legs fails this test.
- **CanonicalHecke.test_base_change** (compatibility): After Over.pullback(b), evaluation at the first WalkingSpan arrow is Over.pullback(b).map(p1).
- **CanonicalHecke.test_gl2_Tp_index** (computation): For GL2, K = GL2(Zhat) and g = diag(p,1) at a prime p, J = K ∩ gKg^{-1} is the preimage of the lower-triangular subgroup mod p, of index p+1 = |P^1(F_p)| in K; both legs of the Hecke span have degree p+1 over the coarse j-line, the classical T_p.

Acceptance checks:

- J is K intersect gKg^{-1}, not K intersect g^{-1}Kg.
- For g=1, J=K and both legs are the identity.
- For G=GL₂, K=GL₂(ℤ̂) and g equal to diag(p,1) at p and the identity elsewhere, [K:J]=p+1: J=K ∩ gKg^{-1} is the preimage of the lower-triangular subgroup modulo p, which stabilizes the line spanned by e₂.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29, p.65; 13.6, p.118. Arithmetic descent of the two legs of the V1 Hecke correspondence.

Atlas planet: **Algebraic Hecke correspondences**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-datum-functoriality"></a>

### Functoriality of canonical models in the datum

Declaration **CanonicalModel.datum_map_defined_over_compositum** (theorem), node `ShimuraVarieties:V8/plan/datum-functoriality`.

For a datum morphism f:D -> Dprime, compact open K,Kprime with f(K) contained in Kprime, and actual canonical models on both sides, the complex map [x,a] -> [f(x),f(a)] descends uniquely to a morphism over E(D). Milne states the field as the compositum E(D)E(Dprime); it equals E(D), because E(Dprime) is contained in E(D) (the argument of Milne 12.3(c) applies to every datum morphism: f carries the cocharacter class of X into that of Xprime Galois-equivariantly). It commutes with admissible level maps and right translations, identity datum maps and compositions after the necessary base changes of the target models to E(D).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- Both data and their reflex fields are specified; the target also has actual canonical models.

Construction or proof:

1. V3 gives the complex algebraic map; D4 sends special pairs to special pairs.
2. Functoriality of V4 reflex norms makes the map Galois equivariant on the dense Hecke orbit of each source special pair (special points map to special points by D4). Apply the disjoint-field argument of translation-descent over E(D), which contains E(Dprime).
3. Descend by A; identities, compositions and Hecke compatibility follow from their complex formulas and faithful base change.

Direct inputs: `ShimuraData:D4/datum-morphism`, `ShimuraData:D4/special-image`, [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields), [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V4/plan/reflex-norm-functoriality`](#shimuravarieties-v4-plan-reflex-norm-functoriality), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- The identity datum map gives the identity scheme morphism.
- For the strict determinant datum morphism GL2 -> Gm at principal level N >= 3, the Q-map agrees with the V4 one-point torus model, whose geometric set is (Z/N)^×/{±1}. Under gl2-determinant-pairing it is the Weil-pairing map followed by the quotient zeta -> {zeta,zeta^(-1)} to the maximal-real cyclotomic model. The full component map to mu_N^prim uses component-reciprocity and Y={±1}.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.8, p.119. Milne's compositum statement; the compositum equals E(D).

Source: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.4, pp.155–156. Special-pair proof of datum functoriality.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.3(c), p.112. The reflex field of the source contains that of the target; the argument uses only Galois-equivariance of the induced map on cocharacter classes.

Atlas planet: **Functoriality of canonical models**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-zero-dimensional-shimura-variety"></a>

### Zero-dimensional Shimura varieties and their canonical models

Declaration **ZeroDimShimura.shimuraSet** (construction), node `ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety`.

Let T be a Q-torus, Y a nonempty finite set on which T(R) acts transitively through T(R)/T(R)^+ (T(Q) acting through T(Q) ⊂ T(R)), and mu a cocharacter of T_C with field of definition E ⊂ C. For compact open K ⊂ T(A_f) put Sh_K(T,Y) = T(Q)\(Y × T(A_f))/K, the finite set of classes [y,a]_K with [y,a]_K = [q·y, q a k]_K for q in T(Q), k in K; the sets form an inverse system with right translations by T(A_f). For sigma in Gal(Qbar/E) choose s in the ideles of E with art_E(s) = sigma on E^ab, let r(s) = (r(s)_inf, r(s)_f) be its image under the multiplicative reflex norm r(T,mu) of V4, and put sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K (Milne, formula (64)). This is a continuous action independent of s, compatible with transitions and translations; the canonical model M_K(T,Y,mu) is the finite étale E-scheme attached to this Galois set. When Y is one point and mu = mu_h it is the V4 torus model of the strict torus datum (T,{h}); in general it is not: for (G_m,{±1}) and K = ker(Zhat^× -> (Z/N)^×), N > 0, it is mu_N^prim, whereas the strict datum gives Spec of the real subfield of Q(zeta_N).

Hypotheses:

- T is a Q-torus; Y is a nonempty finite set with a transitive T(R)-action factoring through T(R)/T(R)^+ (Milne, zero-dimensional Shimura varieties, pp.62–63).
- mu is a cocharacter of T_C defined over the number field E ⊂ C; r(T,mu) is the multiplicative reflex norm of V4 (Milne (60) with the product correction E20) and art_E is the Artin map in the V4 normalization.
- K ranges over compact open subgroups of T(A_f).

Construction or proof:

1. Finiteness: T(Q)\T(A_f)/K is finite (Milne 5.22) and Y is finite.
2. Independence of s: two choices differ by an element of the kernel of art_E, the closure of E^× times the identity component at infinity; r(E^×) lies in T(Q), which acts trivially on the double quotient, r of the identity component lies in T(R)^+, which acts trivially on Y, and K is open, so the closure does not matter. The action factors through Gal(E^ab/E) and through a finite quotient.
3. Transitions [y,a]_K -> [y,a]_K′ for K ⊂ K′ and translations [y,a] -> [y,ag] commute with the action because T is commutative; apply the PR81 0D equivalence between finite étale E-schemes and finite continuous Galois sets to obtain the models and their E-morphisms.
4. For Y a point, (64) reduces to (62) for the special pair (T,h), because T(R) fixes h; this is the V4 torus model.

Direct inputs: [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), [`ShimuraVarieties:V4/plan/torus-model`](#shimuravarieties-v4-plan-torus-model), `ShimuraData:D5/torus-datum`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.

Uses:

- Milne SVI §5, p.63 and §13, (64), p.119: pi_0 of Sh_K(G,X) is the zero-dimensional Shimura variety Sh_{nu(K)}(T,Y), and (64) gives its canonical model..
- ShimuraVarieties:V8/plan/gl2-determinant-pairing: the target of the determinant at level det K(N) is Sh(G_m,{±1}) ≅ mu_N^prim..
- Pink 12.8 and 12.10 (the datum (G_m,Q,H_0)): the quotient (GL2,H±)/SL2 in the codimension-one construction is a two-point zero-dimensional datum, whose canonical model is this one..

API:

- **ZeroDimShimura.shimuraSet** (data): Sh_K(T,Y) = T(Q)\(Y × T(A_f))/K, the quotient of Y × T(A_f) by (y,a) ~ (q·y, q a k), q in T(Q), k in K.
- **ZeroDimShimura.mk** (constructor): The class [y,a]_K of y in Y and a in T(A_f).
- **ZeroDimShimura.mk_eq_mk** (characterisation): [y,a]_K = [y′,a′]_K if and only if y′ = q·y and a′ = q a k for some q in T(Q) and k in K.
- **ZeroDimShimura.map** (functoriality): For K ⊂ K′ the transition [y,a]_K -> [y,a]_K′, with map_id and map_comp.
- **ZeroDimShimura.singletonEquiv** (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the finite Shimura set of the V4 torus datum.
- **ZeroDimShimura.galoisAct** (structure): Formula (64): sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K; independent of s, continuous, compatible with map and translations.
- **ZeroDimShimura.canonicalModel** (other): The finite étale E-scheme attached to the Galois set (Sh_K(T,Y), galoisAct) by PR81 0D; its Qbar-points are Sh_K(T,Y) with this action.

Unit tests:

- **ZeroDimShimura.test_gl2_components** (computation): For T = G_m, Y = R^×/R_{>0} ≅ {±1} and K = ker(Zhat^× -> (Z/N)^×), N > 0, Sh_K(T,Y) ≅ (Z/NZ)^×, which has phi(N) elements (Milne p.63).
- **ZeroDimShimura.test_strict_datum_halves** (non-example): With Y replaced by one point (the strict datum (G_m,{det∘h}) of ShimuraData D5) the same level gives Q^×\A_f^×/K ≅ (Z/NZ)^×/{±1}, with phi(N)/2 elements for N >= 3; at N = 3 it is a single point, whereas mu_3^prim has two geometric points.
- **ZeroDimShimura.test_singleton** (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the set underlying the V4 torus model.
- **ZeroDimShimura.test_maximal_level** (degenerate): For T = G_m, Y = {±1} and K = Zhat^×, Sh_K(T,Y) is one point (Q_{>0}·Zhat^× = A_f^×), with model Spec Q.

Acceptance checks:

- For (G_m,{±1}) with mu(z)=z and K = ker(Zhat^× -> (Z/N)^×), N > 0, the set has phi(N) points and Galois acts through the cyclotomic character (Milne p.125): the model is Spec Q[z]/Phi_N(z).
- Complex conjugation acts on Y={±1} by the sign of r(s)_inf; a one-point Y cannot record it.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties and the GL2 example, pp.62–63. Defines Sh(T,Y) for a finite set Y with transitive T(R)/T(R)^+-action, extending Deligne's one-point torus data; the GL2 example gives (Z/NZ)^× ≅ Gal(Q[zeta_N]/Q).

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, formula (64), p.119. Formula (64) defines the canonical model of a zero-dimensional Shimura variety.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-component-reciprocity"></a>

### Galois action on connected components

Declaration **CanonicalModel.component_map_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/plan/component-reciprocity`.

Let D=(G,X) be a pure Shimura datum with G^der simply connected, nu: G -> T = G/G^der, T(R)^† the image of Z(R) and Y = T(R)/T(R)^† (Milne (34)), and mu = nu∘mu_x, which is independent of x in X and defined over E = E(D). For actual canonical models M_K over E, the complex map Sh_K(G,X) -> Sh_{nu(K)}(T,Y), [x,a]_K -> [y(x), nu(a)], with y: pi_0(X) -> Y induced by nu, descends uniquely to an E-morphism M_K -> M_{nu(K)}(T,Y,mu) into the canonical model of zero-dimensional-shimura-variety. For K as in Milne 5.17 (in particular every K(N) for GL2) its geometric fibres are the connected components, so it identifies pi_0(M_K ⊗_E C) with Sh_{nu(K)}(T,Y) compatibly with the Galois action (64). It commutes with level maps and with right translation by g in G(A_f), acting on the target by nu(g).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- G^der is simply connected; for the pi_0 bijection K is as in Milne 5.17 (sufficiently small, or K(N) for GL2).

Construction or proof:

1. Over C the map is well defined and, for K as in Milne 5.17, induces a bijection on connected components (V0's component decomposition).
2. For a special pair (T0,x0) and sigma fixing E(x0), (62) gives sigma[x0,a] = [x0, r_{x0}(s′)a]. Functoriality of reflex norms (V4) gives nu∘r(T0,mu_{x0}) = r(T,mu)∘Nm_{E(x0)/E}, compatible with the Artin maps; T0(R) fixes x0 (Milne 12.6), so the archimedean component of r(T,mu)(Nm s′) fixes y(x0). Hence the map commutes with sigma on the Hecke orbit of x0, which is dense (Milne 13.5): it is fixed by Aut(C/E(x0)) (Milne footnote 73).
3. Take x1 with E(x1) linearly disjoint from the normal closure of E(x0) over E (disjoint-special-reflex-fields); as in translation-descent, the map is defined over E(x0) ∩ E(x1) = E, uniquely by faithful base change (R09.3). Compatibility with level maps and translations holds over C and descends.

Direct inputs: [`ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety`](#shimuravarieties-v8-plan-zero-dimensional-shimura-variety), [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields), [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), [`ShimuraVarieties:V0/plan/simply-connected-components`](#shimuravarieties-v0-plan-simply-connected-components), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V4/plan/reflex-norm-functoriality`](#shimuravarieties-v4-plan-reflex-norm-functoriality), `ShimuraData:D4/special-pair`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For GL2 at K(N), N >= 3, the target has phi(N) points and the fibres are the fixed-pairing curves of gl2-fixed-pairing-fibre.
- Complex conjugation interchanges the two components H^+ and H^- over a fixed level class: the target must use Y = {±1}, not the one-point torus datum.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, (64) and footnote 73, p.119. pi_0 of the canonical model is the canonical model of Sh(T,Y); footnote 73 gives the special-point argument.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), (34) and Theorem 5.17, p.59. The complex component set is the zero-dimensional Shimura variety when G^der is simply connected.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-abelian-instance"></a>

### Abelian-type tower from V6

Declaration **CanonicalTower.abelian_type** (application), node `ShimuraVarieties:V8/plan/abelian-instance`.

Applying the preceding canonical-model functoriality theorems to the models constructed by V6 produces the finite-level abelian-type tower, translations, finite maps, Hecke spans and datum functoriality. No premise imports V7 or V8.general.

Hypotheses:

- D is of abelian type in D4; V6 supplies actual models satisfying V4.

Construction or proof:

1. Supply the V6 construction to translation-descent and level-tower.
2. Use model-uniqueness to identify choices of Hodge-type covers and component descent.
3. Use the same finite-level and datum-morphism statements; do not identify entire varieties merely because derived groups are isogenous.

Direct inputs: [`ShimuraVarieties:V6/plan/abelian-canonical`](#shimuravarieties-v6-plan-abelian-canonical), [`ShimuraVarieties:V8/plan/level-tower`](#shimuravarieties-v8-plan-level-tower), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality).

Acceptance checks:

- GL2 is the genus-one GSp case, supplied through V5/V6.
- There is no dependency path from this node to V7.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 14.15–14.16 and the paragraph after them, p.127; 13.7, p.119. Specialize the conditional V8 results to V6, rather than replaying the V6 existence proof. The final connected-to-full reference on p.127 is 14.15 (E24); the quotient after 14.16(b) starts from Sh°(G1,X1), not Sh°(G2,X2) (E25). Both misprints also occur on p.356 of the published 2005 version.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-moduli-reciprocity"></a>

### Canonical reciprocity for full elliptic level

Declaration **GL2Modular.full_level_is_canonical** (theorem), node `ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`.

For N>=3, the Q-scheme Y_full(N)_Q representing elliptic curves with an ordered full N-basis, with the complex identification supplied by R12.1/R12.2 and M3, satisfies the actual GL2 special-pair canonical-model condition of V4. The Galois action includes the Weil pairing and acts on the entire full-level model, not only a chosen cyclotomic fibre.

Hypotheses:

- N>=3; GL2 datum is the standard homology-weight minus one datum of D5.
- The fine generic-fibre full-level moduli scheme and analytic comparison are the suppliers' actual constructions.

Construction or proof:

1. Identify GL2=GSp2 and an elliptic curve with its canonical principal polarization. PELModuli M5 supplies the genus-one comparison of the Siegel moduli with PR81's Y_full(N), including the determinant/Weil-pairing convention; M3/R12.1 compare homology, Tate modules and the ordered level basis with the V3 complex variety.
2. V5 supplies normalized CM reciprocity on the elliptic special pairs and their Tate levels; M4 verifies that the constructed genus-one moduli model has that Galois action.
3. Apply V4 Artin-convention conversion, including the field of definition of each special point. A geometric-point bijection alone is insufficient to identify the Q-scheme.

Direct inputs: `ShimuraData:D5/gl2-datum`, `ShimuraData:D3/reflex-field`, [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V5/plan/main-cm`](#shimuravarieties-v5-plan-main-cm), [`ShimuraVarieties:V5/plan/cm-polarization-level`](#shimuravarieties-v5-plan-cm-polarization-level), [`ShimuraVarieties:V5/plan/siegel-special-cm`](#shimuravarieties-v5-plan-siegel-special-cm), [`ShimuraVarieties:V5/plan/siegel-canonical`](#shimuravarieties-v5-plan-siegel-canonical), `PELModuli:M3`, `PELModuli:M4`, `PELModuli:M5`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Acceptance checks:

- Use the actual special torus for an elliptic CM curve and compare its normalized Artin action on the ordered basis.
- Full level two is excluded: the residual minus-one automorphism preserves all two-torsion.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 14.12, p.125. The symplectic/abelian moduli description and normalized CM action certify the genus-one canonical condition.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-full-level"></a>

### Full-level modular curve comparison over Q

Declaration **GL2Modular.full_level_iso** (theorem), node `ShimuraVarieties:V8/plan/gl2-full-level`.

For N>=3, there is a unique Q-isomorphism Sh_{K(N)}(GL2,H±) -> Y_full(N)_Q inducing the supplied complex uniformization. Here K(N)=ker(GL2(Zhat)->GL2(Z/N)). The source is the actual V5/V6 canonical model and the target is the PR81 fine full ordered-basis scheme.

Hypotheses:

- N>=3; full H± datum and principal adelic level; no chosen primitive root is incorporated into the Q-scheme.

Construction or proof:

1. Use gl2-moduli-reciprocity and model-uniqueness to descend the complex moduli identification to a Q-isomorphism.
2. Use the existing AA.5 principal-level component calculation and R12.2 comparison to identify its complex effect with the double-quotient formula.
3. Verify compatibility with the universal elliptic family/level interpretation through M3.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/abelian-instance`](#shimuravarieties-v8-plan-abelian-instance), `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.5/gl2-principal-level` imports `gl2-principal-level` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#52-gl₂-over-ℚ-and-principal-levels`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- At N=3 the full curve has two geometric pairing components; it is not identified with a single Gamma(3) quotient.
- At N=4 there are phi(4)=2 pairing components; composite levels are covered without Layer 10.
- Use determinant representatives in GL2(Zhat) to obtain literal Gamma(N) stabilizers, as in current AdelicAlgebraicGroups §5.2; arbitrary representatives require the specified conjugating maps.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 13.7(a), p.119. The moduli description followed by canonical-model uniqueness gives a scheme isomorphism over Q.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.9, p.175; 12.9, p.200 (author-typeset version). Genus-one full-level model is the arithmetic base case.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), 52-gl₂-over-ℚ-and-principal-levels; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Atlas planet: **Full-level modular curve comparison**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-determinant-pairing"></a>

### Determinant is the Weil-pairing morphism

Declaration **GL2Modular.det_eq_weil_pairing** (comparison), node `ShimuraVarieties:V8/plan/gl2-determinant-pairing`.

Let nu = det: GL2 -> G_m, T = G_m, Y = R^×/R_{>0} ≅ {±1} (Milne (34): T(R)^† = R_{>0}, T(Q)^† = Q_{>0}) and mu = det∘mu_x. Under full_level_iso, the Q-morphism of component-reciprocity, Sh_{K(N)}(GL2,H±) -> Sh_{det K(N)}(G_m,{±1}), is identified over Q with the PR81 determinant det_N: Y_full(N)_Q -> mu_N^prim, (E,P,Q) -> e_N(P,Q). Here det K(N) = ker(Zhat^× -> (Z/N)^×), Sh_{det K(N)}(G_m,{±1}) ≅ (Z/N)^× with Galois acting through the cyclotomic character, and its canonical Q-model is mu_N^prim = Spec Q[z]/Phi_N(z), not the constant disjoint union of phi(N) Q-points. The strict one-point torus datum (G_m,{det∘h}) of ShimuraData D5 is not the target: at this level its Shimura set is (Z/N)^×/{±1}, with model the spectrum of the real subfield of Q(zeta_N).

Hypotheses:

- N>=3; choose the analytic reference basis so that its pairing is the reference primitive root calibrated by R12.1; use the V4 normalization of the Artin map and reflex norm.

Construction or proof:

1. component-reciprocity (G^der = SL2 is simply connected) gives the Q-morphism to the canonical model of Sh_{det K(N)}(G_m,{±1}); zero-dimensional-shimura-variety identifies that set with (Z/N)^× (Milne p.63) and its Galois action (64) with the cyclotomic character (Milne p.125), so the model is mu_N^prim. AA.5 supplies the determinant-indexed components.
2. For a level eta, Milne 6.3 sends the moduli object to [ah, a∘eta]; the determinant records the multiplier of the alternating pairing. R12.1/R12.2 and PELModuli M5 identify that multiplier with the exponent of e_N(P,Q) relative to the calibrated reference root.
3. Both are Q-morphisms Y_full(N)_Q -> mu_N^prim agreeing on complex points; equality descends by faithful base change (R09.3).

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/component-reciprocity`](#shimuravarieties-v8-plan-component-reciprocity), [`ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety`](#shimuravarieties-v8-plan-zero-dimensional-shimura-variety), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `PELModuli:M5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Current upstream interfaces:

- `AdelicAlgebraicGroups:AA.5/gl2-principal-level` imports `gl2-principal-level` from `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#52-gl₂-over-ℚ-and-principal-levels`. Import the corresponding target from the current upstream README and Suggested.lean, with its stated scope and effective-stabilizer hypotheses; this is a roadmap contract, not a library implementation.

Acceptance checks:

- For N=3 the primitive-root model is Spec Q[z]/(z^2+z+1), geometrically two points with nontrivial conjugation.
- A determinant-one basis change preserves the pairing; a determinant-u change raises it to the u-th power.
- With the one-point torus datum the N = 3 target would be a single Q-point, since (Z/3)^×/{±1} is trivial; the correct target has two geometric points.
- Use determinant representatives in GL2(Zhat) to obtain literal Gamma(N) stabilizers, as in current AdelicAlgebraicGroups §5.2; arbitrary representatives require the specified conjugating maps.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, (64), p.119; §14, Siegel proof, p.125. Determinant-component Galois action.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.7, p.100 (root normalization corrected). The fixed-pairing condition; the chosen analytic reference root must be calibrated.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties, GL2 example, p.63. pi_0(Sh_K(N)) is T(Q)\{±1} × A_f^×/(1+N Zhat)^× ≅ (Z/NZ)^×, using Y = {±1}, not a one-point torus datum.

Source: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), 52-gl₂-over-ℚ-and-principal-levels; corresponding current Suggested.lean targets. The upstream roadmap already owns the general supplier interfaces. Import them under their atlas dependency keys, applying only the stated Shimura specialization; no library implementation is claimed.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-fixed-pairing-fibre"></a>

### Fixed-pairing fibre over a primitive root

Declaration **GL2Modular.fixed_pairing_fibre_iso** (comparison), node `ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`.

For N>=3 and a primitive Nth root zeta in C, base change full_level_iso to Q(zeta) and take the scheme-theoretic fibre of its determinant/Weil-pairing map at zeta. This is an isomorphism to Y(N,zeta) over Q(zeta). Its complex analytification is Gamma(N)\H, and the fibre is geometrically connected and geometrically irreducible using the open comparison R12.4.

Hypotheses:

- The fibre is formed after cyclotomic base change; its scalar extension to C uses the chosen embedding Q(zeta)->C.

Construction or proof:

1. Use gl2-determinant-pairing and the functoriality of fibre products to restrict full_level_iso.
2. Apply R12.1/R12.2 fixed-pairing uniformization with the calibrated basis: if zeta=zeta_ref^u, replace the first standard torsion generator by u times it.
3. Import R12.4 open connectedness and smooth-curve irreducibility. This has no compactification prerequisite.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.4`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `mathlib:CategoryTheory.Over.pullback`.

Acceptance checks:

- Y_full(3)_C has two components whereas Y(3,zeta)_C has one.
- Taking a fibre over Q without adjoining zeta is not a fibre at a Q-rational primitive root for N>2.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.7–8.8, p.100. Fixed-pairing complex uniformization and cyclotomic model, with the normalization issue recorded.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.17, pp.59–61; connected components in section 13, p.119. The determinant separates full-level components.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-row-basis-dictionary"></a>

### Row-basis and adelic right actions

Declaration **GL2Modular.row_basis_right_translation** (comparison), node `ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`.

For N>=3 and u in GL2(Zhat) with reduction [[a,b],[c,d]], right translation [x,A]->[x,A u] corresponds under full_level_iso to (P,Q)->(aP+cQ,bP+dQ). The Weil pairing changes by exponent det(u mod N), so this map sends Y(N,zeta) to Y(N,zeta^{det u}). General finite-adelic g is compared through the two isogeny legs at the intersection level, not by pretending g has an integral reduction.

Hypotheses:

- The source K(N) is normalized by GL2(Zhat); full-level bases use the PR81 row convention.

Construction or proof:

1. Write the level as eta:V(A_f)->V_f(E). Milne 6.3 identifies it with [ah,a eta]. Replacing eta by eta composed with u changes a eta to (a eta)u.
2. Evaluate precomposition on the two standard column generators: columns of u give aP+cQ and bP+dQ. Thus the ordered basis is a row with right multiplication.
3. Use PR81 Weil-pairing bilinearity for the determinant exponent. For nonintegral g use R12.5 isogeny/Hecke comparison and the actual intersection-level span.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/translation-laws`](#shimuravarieties-v8-plan-translation-laws), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), `ModularCurvesPartII:R12.5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Acceptance checks:

- For u=[[1,1],[0,1]] the basis goes to (P,P+Q), not (P+Q,Q).
- For u=[[0,1],[-1,0]] the basis goes to (-Q,P); determinant is one and pairing stays fixed.
- For diag(v,1), pairing is raised to v and the component changes unless v=1 mod N.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71. The literal level-map orientation fixes the right-action convention; use the corrected arrow directions in the proof.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ModularCurves/README.md), Conventions, item 5: Full level and actions. The native row-basis convention to which the canonical model is compared.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-gamma1"></a>

### Gamma-one modular curve comparison

Declaration **GL2Modular.gamma1_iso** (comparison), node `ShimuraVarieties:V8/plan/gl2-gamma1`.

For N>=4, the canonical Q-scheme at K1(N)={u in GL2(Zhat):u e1=e1 mod N} is Q-isomorphic to the fine curve Y1(N)_Q representing (E,P) with P of exact order N. The comparison is induced by the full-level forgetful map and preserves its specified point and its complex Gamma1(N) uniformization.

Hypotheses:

- N>=4; K1 fixes e1 (first column), so the row convention retains P.

Construction or proof:

1. Choose a full principal level M divisible by N with M>=3 and pass to the finite quotient of its level problem by the stabilizer of the chosen N-point.
2. Use finite-level-maps and the PR81/R12.2 fine quotient comparison to descend full_level_iso. Exact moduli representability at N>=4 eliminates automorphisms.
3. Use R12.5/R12.6 to match forgetful and diamond morphisms over Q.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary), `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Acceptance checks:

- At N=4 a point of exact order four excludes the residual minus-one automorphism.
- At N=1,2 the comparison cannot be labelled a fine universal elliptic scheme.
- Current AdelicAlgebraicGroups §5.2 uses c≡0,d≡1, the stabilizer of the second row covector. Here a≡1,c≡0 fixes the first column vector. The two intersections with SL₂ agree as Γ₁(N), so import the identity-component uniformization. For the full adelic moduli dictionary retain this roadmap’s first-column level; basis-swap conjugation does not identify these compact opens.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ModularCurves/README.md), Layer 5A: Tate normal form and Y1(N) for N>=4. Imports the actual fine-moduli qualification rather than extending it to levels two or three.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29 and 13.7, pp.65,119. Canonical finite-level quotient and uniqueness.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-gamma0"></a>

### Gamma-zero coarse modular curve comparison

Declaration **GL2Modular.gamma0_coarse_iso** (comparison), node `ShimuraVarieties:V8/plan/gl2-gamma0`.

For N>0, the canonical Q-scheme at K0(N)={u in GL2(Zhat):u preserves the line (Z/N)e1} is Q-isomorphic to the coarse curve Y0(N)_Q for elliptic curves with a cyclic order-N subgroup. At N=1 this is the j-line. The assertion is an isomorphism of coarse schemes, not fine representability or a bijection with rational isomorphism classes over every field.

Hypotheses:

- Characteristic zero generic fibre; N positive. The cyclic-subgroup problem and its coarse space are the actual PR81 constructions.

Construction or proof:

1. Choose full M-level with N dividing M and M>=3; use the subgroup stabilizer and its finite coarse quotient.
2. Compare this quotient with the canonical finite-level quotient from finite-level-maps, via gl2-full-level and the first-column convention.
3. Use PR81 9E and R12.2/R12.6 to identify the coarse scheme and its analytic quotient.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary), `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

Acceptance checks:

- For N=1 the j-line has elliptic objects with automorphisms; it is not a fine scheme with a universal elliptic curve.
- For N=6 use the general coarse construction, not the prime diamond-quotient theorem of Layer 10.

Source: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.6, p.100. Coarse characteristic-zero comparison; universal-family claims are deliberately excluded.

Source: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ModularCurves/README.md), Layer 9E: the coarse j-line and Y0(N). The supplier of the coarse scheme, retaining elliptic stabilizers.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-compact-model"></a>

### Minimal compactification of the full modular curve

Declaration **GL2Modular.minimal_compact_iso** (comparison), node `ShimuraVarieties:V8/plan/gl2-compact-model`.

For N>=3 the independently constructed proper normal coarse compact curve X_full(N)_Q from R13.4a, with its specified open Y_full(N)_Q, is the E=Q-model of the complex Baily–Borel minimal compactification for the GL2 principal-level datum, via the open isomorphism full_level_iso. This is the genus-one arithmetic compactification base case, constructed without assuming the general minimal-descent theorem.

Hypotheses:

- N>=3; the full and composite levels use the R13.4a construction. PR81 Layer 10 (prime N>=5 diamond quotients with H <= (Z/N)^×/{±1}) is not used here and supplies no full-level model.

Construction or proof:

1. R13.4a constructs the proper normal coarse compactification from generalized elliptic curves; R12.3 identifies its C-model with the independently constructed analytic modular compactification.
2. Use the full-level open comparison to specify the complex Baily–Borel identification and hence an actual Q-model containing the canonical open.
3. Normal proper-curve extension gives uniqueness. R13.4b certifies the generic-fibre component and cusp bookkeeping; it is not the source of R12.4 open connectedness.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

Acceptance checks:

- The level N=6 full compact model is supplied by R13.4a; prime-only Layer 10 cannot provide it.
- Boundary is the scheme-theoretic complement, not a hand-selected set of complex cusp points.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200. Uses the independent generalized-elliptic compact model to descend GL2 before the general compactification proof.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.20–10.21, pp.183–184. The complex compact comparison and cusp formal model.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-codim-one-extension"></a>

### Arithmetic codimension-one partial compactification

Declaration **CanonicalModel.codim_one_extension** (theorem), node `ShimuraVarieties:V8/plan/codim-one-extension`.

Let D=(G,X) be a pure Shimura datum with actual canonical models and K neat. Let M_K(C)^+ ⊂ M_K(C)^min be the union of M_K(C) with the boundary strata of codimension one (Pink 8.2): it is smooth, its boundary is a smooth divisor and its complement in M_K(C)^min has codimension at least two. Then M_K(C)^+ has a normal E(D)-model M_K^+ containing the canonical model M_K as a dense open subscheme, with a specified complex comparison extending the open comparison. It is unique up to the E-isomorphism inducing that specified complex comparison. The codimension-one strata come from the Q-simple factors of G^ad isomorphic to PGL2,Q, through surjections G -> PGL2,Q. When such a surjection lifts to a morphism (G,X) -> (GL2,H±), the corresponding partial extension is the scheme-theoretic closure of M_K in M_K′(G′,X′) ×_E (X_full(N)_Q ⊗ E) for (G′,X′) = (G,X)/SL2,Q (Pink 2.9), using gl2-compact-model; otherwise it is the quotient by a finite group of the corresponding extension for G̃ = G ×_{PGL2} GL2. The construction uses no torus torsor or mixed toroidal input (Pink 12.8 and ShimuraCompactifications C2 concern mixed data).

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The auxiliary data (G,X)/SL2,Q and (G̃,X̃) of Pink 12.10 also carry actual canonical models; in the abelian-type lane their membership in the V5/V6 class is the recorded auxiliary-class gap.
- K is neat and the auxiliary levels satisfy V2/codim-one-analytic-extension; auxiliary arithmetic models remain a separate requirement.

Construction or proof:

1. V2/codim-one-analytic-extension: the codimension-one boundary strata of M_K(C)^min belong to the rational boundary components whose parabolic is the preimage of a Borel subgroup under some G -> PGL2,Q; M_K(C)^+ is smooth with smooth boundary divisor (Pink 8.2). The strata of distinct factors are disjoint, so M_K^+ is glued along M_K from one partial extension per factor.
2. Lifted case (Pink 12.10, first paragraph): PGL2,Q lifts to an almost direct factor SL2,Q of G^der and (G,X) embeds in (G′,X′) × (GL2,H±), with E(G,X) = E(G′,X′) because E(GL2,H±) = Q. The product of the canonical model of (G′,X′) with X_full(N)_E (gl2-compact-model) is an E-model of the corresponding product partial compactification. By the complex closed-immersion statement, M_K(C)^+ is the closure of M_K(C) there; take the scheme-theoretic closure over E of the image of the descended embedding (datum-functoriality); closure commutes with the flat base change E -> C (R09.5) and closed subschemes descend (R09.3).
3. General case (Pink 12.10, second paragraph): G̃ = G ×_{PGL2} GL2 lifts, E(G̃,X̃) = E(G,X), and the complex map M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is finite surjective (H^1(A,G_m) = 0); define M_K^+ as the finite quotient of the lifted extension (finite-level-maps, R09.5), which exists by quasi-projectivity. For uniqueness, use the specified complex comparison between two models of this same partial compactification. Its conjugates agree on M_K and hence on the whole reduced source with separated target. Descend this complex isomorphism and its inverse by R09.3 (Pink 12.6). Normality and a common dense open alone do not identify arbitrary compactifications.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/minimal-datum-extension`](#shimuravarieties-v2-minimal-datum-extension), [`ShimuraVarieties:V2/codim-one-analytic-extension`](#shimuravarieties-v2-codim-one-analytic-extension), [`ShimuraVarieties:V2/log-canonical-sections`](#shimuravarieties-v2-log-canonical-sections), `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Acceptance checks:

- For G = GL2 itself, (G′,X′) is the two-point datum (G_m,{±1}) and M_K^+ = X_full(N)_Q, agreeing with gl2-compact-model.
- If no Q-simple factor of G^ad is PGL2,Q (for example Hilbert modular data over F ≠ Q), M_K^+ = M_K.
- No prerequisite on ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.10, pp.200–201 (author-typeset version). The lifted and general cases of the codimension-one extension for reductive P, using 12.9 for GL2, descent of closed subschemes and a finite quotient.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, p.132. Definition and properties of the partial compactification M^+(C).

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200. The GL2 case is the compactified moduli of generalized elliptic curves, supplied here by gl2-compact-model.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Abelian auxiliary class for Pink 12.10](#refinement-20).

<a id="shimuravarieties-v8-plan-minimal-descent"></a>

### Reflex-field descent of the minimal compactification

Declaration **CanonicalModel.minimal_defined_over_reflex** (theorem), node `ShimuraVarieties:V8/plan/minimal-descent`.

For a pure datum D with actual canonical open models, its normal projective complex Baily–Borel compactification M_K,C^min has a unique projective normal E(D)-model containing M_K and inducing the specified complex compactification. The theorem is for the same datum class as the supplied open models. Its construction must exhibit effective descent, not infer it solely from uniqueness of an open model.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- V2/codim-one-analytic-extension and V2/log-canonical-sections apply; the actual auxiliary arithmetic models required by codim-one-extension are supplied.

Construction or proof:

1. At neat level, codim-one-extension gives the normal E-model M_K^+ of M_K(C)^+: the open part with the codimension-one boundary strata, smooth with smooth boundary divisor and complement of codimension at least two in M_K(C)^min (Pink 8.2, 12.10).
2. On M_K^+ the sheaf omega[dlog] of top differentials with logarithmic poles along the boundary divisor is defined over E, and its global sections commute with the flat base change E -> C (R09.3). V2 (Pink 8.2, Baily–Borel 10.11): for a positive sufficiently divisible n, omega[dlog]^n is generated by global sections on M_K(C)^+ and the induced map extends to a closed embedding of M_K(C)^min.
3. Define M_K^min as the closure of M_K^+ in the projective space of the dual of Gamma(M_K^+, omega[dlog]^n) over E (Pink 12.12). Closure commutes with E -> C (R09.5), so its base change is M_K(C)^min; normality and projectivity descend.
4. Remove neatness by finite quotients (finite-level-maps, R09.5; Pink 12.6). For uniqueness, the specified complex comparisons supply an isomorphism between the two models of the same Baily–Borel compactification. Its conjugates agree on the dense canonical open, hence on the reduced source with separated target. Descend the isomorphism and its inverse by R09.3; this does not claim uniqueness among arbitrary normal compactifications of M_K.

Direct inputs: [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/koecher`](#shimuravarieties-v2-plan-koecher), [`ShimuraVarieties:V2/minimal-datum-extension`](#shimuravarieties-v2-minimal-datum-extension), [`ShimuraVarieties:V2/codim-one-analytic-extension`](#shimuravarieties-v2-codim-one-analytic-extension), [`ShimuraVarieties:V2/log-canonical-sections`](#shimuravarieties-v2-log-canonical-sections), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Acceptance checks:

- When no codimension-one boundary occurs, M_K^+ = M_K and Koecher's principle makes the sections those of automorphic forms without growth condition; the closure argument is unchanged.
- For GL2 the construction agrees with gl2-compact-model.
- No prerequisite on AutomorphicBundles:B1, ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a), p.197; 12.6–12.7, pp.198–199; 12.10, pp.200–201; 12.12, p.202. The codimension-one extension and intrinsic logarithmic line make arithmetic descent effective.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, pp.132–133. The relevant ample line is the top logarithmic differential, built from complex BB geometry, not B1 canonical automorphic bundles.

Atlas planet: **Canonical minimal compactification**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Abelian auxiliary class for Pink 12.10](#refinement-20).

<a id="shimuravarieties-v8-plan-minimal-map-extension"></a>

### Functoriality on minimal compactifications

Declaration **CanonicalModel.minimal_map_extension** (theorem), node `ShimuraVarieties:V8/plan/minimal-map-extension`.

Every descended translation T_g and every admissible datum morphism has a unique extension between the corresponding minimal models over the same reflex field or specified compositum. The extensions preserve identity and composition and agree with complex Baily–Borel functoriality. In particular level maps and both Hecke legs extend. Extended level maps are finite where the complex finite-quotient theorem proves finiteness; no general étaleness across the boundary is asserted.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex extension theorem is supplied by V2/V3 with its applicable level/datum hypotheses.

Construction or proof:

1. Use minimal-descent for the source and target and V2/V3 for the complex extension.
2. On the schematically dense open, descent agrees with the known arithmetic map. Separatedness and reducedness give equality of conjugates on the whole source.
3. Apply descent of morphisms and faithful base change; finite level extensions inherit finiteness by descent. The same argument proves coherence of compositions.

Direct inputs: [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality), [`ShimuraVarieties:V8/plan/translation-laws`](#shimuravarieties-v8-plan-translation-laws), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), [`ShimuraVarieties:V2/plan/minimal-level-extension`](#shimuravarieties-v2-plan-minimal-level-extension), [`ShimuraVarieties:V2/minimal-datum-extension`](#shimuravarieties-v2-minimal-datum-extension), [`ShimuraVarieties:V2/codim-one-analytic-extension`](#shimuravarieties-v2-codim-one-analytic-extension), [`ShimuraVarieties:V2/log-canonical-sections`](#shimuravarieties-v2-log-canonical-sections), [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- A level map may ramify at cusps even when its restriction to neat opens is étale.
- Restricting an extended correspondence to the open recovers the same ordered Hecke span.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197; 12.6, p.198. Functoriality follows only after the arithmetic compactification objects have been constructed.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-cusps-tate"></a>

### Modular cusp loci and Tate parameters

Declaration **GL2Modular.cusp_tate_comparison** (comparison), node `ShimuraVarieties:V8/plan/gl2-cusps-tate`.

The GL2 minimal/modular compact comparison identifies the cusp subschemes, their residue fields and their formal neighborhoods with the generalized-elliptic/Tate charts of R12.3/R12.6/R13.4b. At a chosen complex cusp of width w, the local analytic coordinate is q_c=exp(2 pi i z/w), with q=exp(2 pi i z)=q_c^w after a chosen cusp representative. Over the supplier's cusp residue field, the completed local ring of the normal curve is k(c)[[q_c]], using its chosen Tate parameter; changes of cusp representative introduce the specified roots of unity.

Hypotheses:

- N>=3 for full fine open level; other levels use their stated coarse curve and cusp stabilizers. Choose a cusp label, uniformizer and field embedding; no universal Q-rationality assertion.

Construction or proof:

1. Compare the scheme boundary by extension of the open isomorphism and R13.4b boundary identification.
2. Import R12.3 width/parameter computation and R12.6 cusp Galois fields, then match them with R13.4b formal Tate charts.
3. Use R12.1 normalization to identify the analytic exponential with the chosen Tate parameter, including roots of unity under changed representatives.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0), `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C0/repair-analytification`.

Acceptance checks:

- At the infinity cusp of full principal level N, width is N and q=q_c^N.
- A different cusp label can have a nontrivial residue-field action; replacing the cusp scheme by a constant Q-set loses this information.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.21–10.22, pp.184–185; 12.9, p.200. The formal cusp comparison is an arithmetic deformation/Tate statement, not just an equality of complex points.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-plan-gl2-tower-compatibility"></a>

### Compatibility of modular and canonical correspondences

Declaration **GL2Modular.tower_compatibility** (comparison), node `ShimuraVarieties:V8/plan/gl2-tower-compatibility`.

The Q-isomorphisms for full, Gamma1 and Gamma0 levels commute with all admissible level maps and the ordered Hecke isogeny correspondences, with the Weil-pairing component transport dictated by row_basis_right_translation. Their compact extensions commute with the extended finite legs and the cusp/Tate charts. On coefficient sheaves, differential pullback and pull-push normalizations are precisely those of R12.5.

Hypotheses:

- Only the stated fine/coarse ranges and supplier's actual Hecke isogeny moduli are used; integral bad-prime models are not inferred.

Construction or proof:

1. R12.5/R12.6 supply the analytic/level/isogeny identities; compare each leg using gl2-full-level, row-basis-dictionary and canonical functoriality.
2. Faithful C-base change gives equality over Q. Apply minimal-map-extension and uniqueness of dense-open extension for the compact diagram.
3. Identify cusp formal maps using gl2-cusps-tate and R13.4b. Import the supplier normalization for differentials rather than redefining the Hecke operator.

Direct inputs: [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), [`ShimuraVarieties:V8/plan/minimal-map-extension`](#shimuravarieties-v8-plan-minimal-map-extension), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate), `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Acceptance checks:

- For an integral unipotent at principal level the first generator stays P and the second becomes P+Q.
- For a nonintegral adelic prime isogeny, compare both legs rather than a putative automorphism of Y_full(N).
- For prime N>=5 diamonds with H <= (Z/N)^×/{±1}, verify the Layer-10 quotient range; use R13.4a for full/composite compact levels.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29, pp.65–66; 6.3, pp.70–71; 13.6–13.8, pp.118–119. Arithmetic comparisons intertwine the actual finite-level maps.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197. The same compatibility persists on minimal compact models.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="v8-general"></a>

## V8.general. General-data completion interface

Apply the same conditional tower and minimal theorems after V7 supplies general strict pure-datum models. Supply Pink’s broader auxiliary datum models separately; strict existence does not automatically cover them.

<a id="shimuravarieties-v8-general-plan-general-tower"></a>

### General-data canonical tower

Declaration **CanonicalTower.general_data** (theorem), node `ShimuraVarieties:V8.general/plan/general-tower`.

For every pure Shimura datum D and every compact open K, supply the actual canonical models constructed by V7 to V8's conditional functoriality theorems. Obtain the same canonical E(D)-tower, right translations, finite level maps, effective quotients and ordered Hecke correspondences, independent up to the unique comparison of V8 of V7's auxiliary extension and special point. For a datum morphism D -> D′, E(D′) is contained in E(D), so its map is defined over E(D), with the target model extended to that field.

Hypotheses:

- V7 has proved conjugation, cocycle, continuity and effective descent and has verified V4 on the resulting models. No placeholder existence witness is substituted.

Construction or proof:

1. Apply the V8 translation, tower and datum-map declarations to V7's actual schemes and comparisons.
2. Apply model-uniqueness to compare auxiliary choices; use its compatibility with maps to obtain the tower identification.
3. Use finite-level-maps and hecke-span with the effective stabilizers from V1. No second proof of canonical functoriality is introduced.

Direct inputs: [`ShimuraVarieties:V7/plan/general-canonical`](#shimuravarieties-v7-plan-general-canonical), [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/level-tower`](#shimuravarieties-v8-plan-level-tower), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality).

Acceptance checks:

- The abelian-instance node has no dependency on this node.
- Choosing a non-abelian-type datum cannot be justified by relabelling a V6 model.

Source: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.10, p.115; 13.6–13.8, pp.118–119. V8 applies to actual models independently of the argument establishing existence.

Atlas planet: **General-data canonical tower**.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14).

<a id="shimuravarieties-v8-general-plan-general-minimal"></a>

### General-data minimal compactification interface

Declaration **CanonicalModel.general_minimal** (application), node `ShimuraVarieties:V8.general/plan/general-minimal`.

Apply codim_one_extension, minimal_defined_over_reflex and minimal_map_extension to the V7 models and the corresponding actual auxiliary pure models of Pink 12.10. This gives normal projective minimal compactifications and their functorial maps over reflex fields for all pure data; their open restriction is the general-data tower. Export these objects to C2.general and S0.general with the same auxiliary-model requirement exposed.

Hypotheses:

- V7 supplies the original and auxiliary strict pure-datum models. Models of any auxiliary data in Pink's broader sense are separately supplied through the recorded auxiliary-class gap; the two-point torus case is constructed here. V2 supplies the exact complex functoriality and logarithmic-section targets; their recorded proof and carrier refinements still apply.

Construction or proof:

1. Instantiate codim-one-extension and minimal-descent with the V7 schemes and all separately supplied broader auxiliary models; apply the existing argument, with no separate general compactification proof.
2. Instantiate minimal-map-extension and identify restrictions by general-tower and model-uniqueness.
3. Supply only this arithmetic minimal/open interface to downstream C2.general and S0.general; toroidal existence and perfectoid limits remain their own targets.

Direct inputs: [`ShimuraVarieties:V7/plan/general-canonical`](#shimuravarieties-v7-plan-general-canonical), [`ShimuraVarieties:V8.general/plan/general-tower`](#shimuravarieties-v8-general-plan-general-tower), [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension), [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8/plan/minimal-map-extension`](#shimuravarieties-v8-plan-minimal-map-extension).

Acceptance checks:

- The same construction agrees with the abelian lane via model-uniqueness.
- No dependency imports the consuming C2.general toroidal model.

Source: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a)–(b), p.197; 12.10–12.12, pp.200–202. Same compactification construction specialized to the class supplied by general existence.

Remaining refinements: [Suggested signatures requiring absent mathematical carriers](#refinement-14), [Abelian auxiliary class for Pink 12.10](#refinement-20).

## Shared proof and ownership refinements

Each item specifies the mathematical input still required. Planned coverage asserts target-level completeness, including these recorded ends of prerequisite chains; it does not assert proof closure.

<a id="refinement-1"></a>

### Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3

Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison. Encode CA.0→C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3 and list those consumers in the PR196 external record. C0/repair-analytification supplies a requested target, not a constructed carrier. The issue permits no edits to those supplier/atlas files, so the repair is a concrete unapplied ownership proposal.

Needed by: [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V3/plan/borel-extension`](#shimuravarieties-v3-plan-borel-extension).

<a id="refinement-2"></a>

### Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28

The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7). Encode M5/M6 or CA.0→AnalyticToricGeometry Layer 3 and M7 or CA.0→C0, with the direct V1 edge. If PR279 is tracked instead, expose those milestones as real stage ids. Update its external consumers and declared_by_areas with AnalyticToricGeometry. LI.4/LI.2 are retired and provide none of this; no edge through them remains in the packet.

Needed by: [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure).

<a id="refinement-3"></a>

### Arithmetic and effective-level supplier extensions

AA §3.4 and Reduction.levelArithmetic_commensurable already plan commensurability for arbitrary compact-open levels and representatives. The remaining AA.3 specialization identifies a faithful integral-model level with G(Q)∩GL_n(Z) and passes its arithmetic image through the compact ineffective kernel. AA.4 covering/freeness still has a real stabilizer compact-mod-A_G hypothesis; general Shimura central units need the effective-domain version. Requests retain those precise outputs, not a second pairwise-commensurability plan.

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V1/plan/holomorphic-hecke`](#shimuravarieties-v1-plan-holomorphic-hecke).

<a id="refinement-4"></a>

### Baily–Borel proof and carrier interfaces

The primary §§3.5–3.7, 4.8–4.11 and 8.2–8.9 now specify rational normalizers, Satake neighborhoods and the all-type analytic boundary predicate. Remaining refinements are the complete adapted-domain/classification and reduction-topology interfaces; §§6–7 normal-majorant convergence inequalities; §9 analyticity criterion and local normal models; full admissible Veronese section-ring comparison, using Theorem 10.14 in its no-three-dimensional-Q-normal-subgroup range and a separate cusp/logarithmic-canonical and mixed-factor argument outside that range; §§10.9–10.11 alone give only the finite separating subring; Koecher extension; and finite-index boundary-map/ring-integrality proofs. The read OCR loses signs in some displays: the canonical pullback convention is stated independently, but estimates must be checked in a legible primary copy before source-proof closure. No missing boundary definition is concealed in this proof gap.

Needed by: [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/satake-compactness`](#shimuravarieties-v2-plan-satake-compactness), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/poincare-eisenstein`](#shimuravarieties-v2-plan-poincare-eisenstein), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), [`ShimuraVarieties:V2/plan/automorphic-finite-generation`](#shimuravarieties-v2-plan-automorphic-finite-generation), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/koecher`](#shimuravarieties-v2-plan-koecher), [`ShimuraVarieties:V2/plan/minimal-level-extension`](#shimuravarieties-v2-plan-minimal-level-extension).

<a id="refinement-5"></a>

### Borel multivariable extension proof source

SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument. Obtain the original algebraicity paper or a full public proof and certify the extension across (Δ*)ʳ×Δˢ with torsion-free effective target. Projective SNC source compactification is imported from the existing R09.7/snc-compactification node; C0 still supplies the local analytic chart comparison.

Needed by: [`ShimuraVarieties:V3/plan/borel-extension`](#shimuravarieties-v3-plan-borel-extension), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity).

<a id="refinement-6"></a>

### Independent definable comparison and graph suppliers

The independent comparison source is now KUY Theorems 1.9/4.1 and Lemma 4.2 (pp.336–337,343–346), with the exact exp/compact-chart proof recorded in V3. C4 must expose o-minimal structures R_an and R_an,exp, the complex toroidal cusp-chart extension with relatively compact exponential images used by that proof, BKT Theorem 1.3 polarized period-map definability, and Peterzil–Starchenko o-minimal Chow (BKT 4.13). RealAlgebraicGeometry plans semialgebraic geometry but excludes general o-minimal structures, so it does not supply these. Only this complex chart input moves below V3; arithmetic toroidal models remain in ShimuraCompactifications. Keep the maximal compact fixed and the corrected Cartan-compatible functoriality. These are supplier/implementation refinements, not a missing comparison citation or an application of ordinary Borel to justify the alternative proof.

Needed by: [`ShimuraVarieties:V3/plan/definable-target-comparison`](#shimuravarieties-v3-plan-definable-target-comparison), [`ShimuraVarieties:V3/plan/definable-borel`](#shimuravarieties-v3-plan-definable-borel).

<a id="refinement-7"></a>

### Full CM spreading and specialization inputs

Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field. Integral eigenspace splitting in the unramified Frobenius calculation is over O_{k,P}, not globally O_k, as the published author erratum corrects. The centralizer part of cm-frobenius now imports existing A4/A6 nodes and is not a missing positive-characteristic Hom theorem.

Needed by: [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/shimura-taniyama`](#shimuravarieties-v5-plan-shimura-taniyama).

<a id="refinement-8"></a>

### Connected canonical symmetry and coherence

Read and specify Deligne 1979 §§2.7.10–2.7.13 completely: the adelic/Galois extension acting on the connected Qbar model, its group law, congruence completions, special reciprocity and reconstruction of finite components. The scanned 1983 appendix certifies the complex completion action only. The algebraic inverse system with completion alone is not the entire connected canonical object.

Needed by: [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence), [`ShimuraVarieties:V6/plan/connected-products`](#shimuravarieties-v6-plan-connected-products), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V6/plan/abelian-canonical`](#shimuravarieties-v6-plan-abelian-canonical), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance), [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle).

<a id="refinement-9"></a>

### Serre/Taniyama extension common owner

MS1982c pp.229–230 and 242–243 and MS1982d p.281 were inspected, including the actual contracted product. No atlas layer owns the Serre protorus and Taniyama extension with finite-adelic section and compatible cocycle. Propose Complex Multiplication and Explicit Reciprocity, Part II, first new layer CM.S: Serre character lattice (σ−1)(c+1)χ=0, global Weil/class-formation extension, norm-compatible finite-adelic section, torsor multiplication and marked-cocharacter pushout. This is beyond existing CM.0 types/reflex types; refine the uninspected extension proof in MS1982c §§2–3. Supply CM.S→V7/conjugated-datum, with no CM.2/CM.4→V5 cycle.

Needed by: [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum), [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle).

<a id="refinement-10"></a>

### Kazhdan exceptional uniformization proof

Milne 1983 Theorem 3.2 is a key theorem with proof references, not a full proof. Decompose Kazhdan’s universal-cover and lattice theorem for exceptional noncompact E₆/E₇/mixed D cases, including its analytic metric inputs; no general Langlands conjugation theorem can serve as an axiom. Route reusable metric results to the analytic supplier and retain this arithmetic conjugation application in V7.

Needed by: [`ShimuraVarieties:V7/plan/kazhdan-uniformization`](#shimuravarieties-v7-plan-kazhdan-uniformization), [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation).

<a id="refinement-11"></a>

### S-arithmetic and central-cohomology supplier extension

ALS.0 does not yet expose Milne §§3.5–3.7: recovery of a Q-group from irreducible S-arithmetic lattices at total rank≥2, local finite-prime identifications and superrigidity. Extend ReductiveGroupsPartII for corrected Lemma 3.8: for simply connected semisimple G with no A_n factor n≥4, H¹(k,Z(G))→∏_{v finite}H¹(k_v,Z(G)) is injective; plus the adjoint Hasse principle/real localization and torus norm weak-approximation assertions used in §§6.3–6.6. Preserve the actual hypotheses; no arbitrary finite group cohomology theorem is asserted.

Needed by: [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence).

<a id="refinement-12"></a>

### A₁ comparison and completion density

Canonical-model existence for A₁ is not itself its marked conjugation comparison. Certify the CM/Siegel comparison bridge in 1983 Remark 1.5/MS1982d §9 and its functorial inclusion. Read MS1982d §8 and corrected 1983 Proposition 6.1 for the exact finite totally real base-extension density in the congruence completion. Do not revive the deleted extra A₁-generation claim in the annotated scan.

Needed by: [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/marked-conjugation`](#shimuravarieties-v7-plan-marked-conjugation), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance).

<a id="refinement-13"></a>

### General quasi-projective finite quotient API

ModularCurves Layer 0D already plans finite-continuous-Galois-set descent. SF.1/finite-group-quotient already supplies the general finite group quotient and invariant affine cover, with every finite orbit in an affine open; the quasi-projective C-scheme source satisfies this hypothesis. The remaining SF.1 extension is descent of a suitable invariant ample power and the quasi-projectivity/normality output, not a second quotient-existence construction.

Needed by: [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization).

<a id="refinement-14"></a>

### Suggested signatures requiring absent mathematical carriers

At the pins no concrete pure Shimura datum, nilpotent analytic-space category, automorphic boundary ring, connected canonical Galois extension or actual canonical reciprocity predicate is available. The binding 2026-10-12 shape puts these mathematical targets, all hypotheses, APIs and tests in the reader. Suggested.lean states only the native double-orbit carrier and inversion of an abelian-target reciprocity homomorphism, with a few genuine generic tests and an explicit omission manifest. It declares no schematic universal finite/proper/canonical-model theorem over arbitrary schemes and no unproved data. Its elaboration does not establish analytic topology, number-field reciprocity, special-pair predicates or existence. Restore omitted declarations only after their mathematical carriers exist.

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), [`ShimuraVarieties:V0/plan/stabilizer-commensurable`](#shimuravarieties-v0-plan-stabilizer-commensurable), [`ShimuraVarieties:V0/plan/neat-sublevels`](#shimuravarieties-v0-plan-neat-sublevels), [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), [`ShimuraVarieties:V0/plan/component-decomposition`](#shimuravarieties-v0-plan-component-decomposition), [`ShimuraVarieties:V0/plan/simply-connected-components`](#shimuravarieties-v0-plan-simply-connected-components), [`ShimuraVarieties:V1/plan/analytic-points`](#shimuravarieties-v1-plan-analytic-points), [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V1/plan/right-translation`](#shimuravarieties-v1-plan-right-translation), [`ShimuraVarieties:V1/plan/holomorphic-hecke`](#shimuravarieties-v1-plan-holomorphic-hecke), [`ShimuraVarieties:V1/plan/datum-analytic-map`](#shimuravarieties-v1-plan-datum-analytic-map), [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V2/plan/satake-compactness`](#shimuravarieties-v2-plan-satake-compactness), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/poincare-eisenstein`](#shimuravarieties-v2-plan-poincare-eisenstein), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), [`ShimuraVarieties:V2/plan/automorphic-finite-generation`](#shimuravarieties-v2-plan-automorphic-finite-generation), [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/koecher`](#shimuravarieties-v2-plan-koecher), [`ShimuraVarieties:V2/plan/minimal-level-extension`](#shimuravarieties-v2-plan-minimal-level-extension), [`ShimuraVarieties:V3/plan/borel-extension`](#shimuravarieties-v3-plan-borel-extension), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V3/plan/unique-algebraization`](#shimuravarieties-v3-plan-unique-algebraization), [`ShimuraVarieties:V3/plan/algebraic-data-maps`](#shimuravarieties-v3-plan-algebraic-data-maps), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V3/plan/definable-target-comparison`](#shimuravarieties-v3-plan-definable-target-comparison), [`ShimuraVarieties:V3/plan/definable-borel`](#shimuravarieties-v3-plan-definable-borel), [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), [`ShimuraVarieties:V4/plan/canonical-model`](#shimuravarieties-v4-plan-canonical-model), [`ShimuraVarieties:V4/plan/torus-model`](#shimuravarieties-v4-plan-torus-model), [`ShimuraVarieties:V4/plan/aghmp-stack-comparison`](#shimuravarieties-v4-plan-aghmp-stack-comparison), [`ShimuraVarieties:V4/plan/special-existence`](#shimuravarieties-v4-plan-special-existence), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/cm-potential-good-reduction`](#shimuravarieties-v5-plan-cm-potential-good-reduction), [`ShimuraVarieties:V5/plan/cm-frobenius`](#shimuravarieties-v5-plan-cm-frobenius), [`ShimuraVarieties:V5/plan/shimura-taniyama`](#shimuravarieties-v5-plan-shimura-taniyama), [`ShimuraVarieties:V5/plan/cm-ideal-reciprocity`](#shimuravarieties-v5-plan-cm-ideal-reciprocity), [`ShimuraVarieties:V5/plan/main-cm`](#shimuravarieties-v5-plan-main-cm), [`ShimuraVarieties:V5/plan/cm-polarization-level`](#shimuravarieties-v5-plan-cm-polarization-level), [`ShimuraVarieties:V5/plan/siegel-special-cm`](#shimuravarieties-v5-plan-siegel-special-cm), [`ShimuraVarieties:V5/plan/siegel-canonical`](#shimuravarieties-v5-plan-siegel-canonical), [`ShimuraVarieties:V6/plan/hodge-inheritance`](#shimuravarieties-v6-plan-hodge-inheritance), [`ShimuraVarieties:V6/plan/hodge-canonical`](#shimuravarieties-v6-plan-hodge-canonical), [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V6/plan/connected-full-equivalence`](#shimuravarieties-v6-plan-connected-full-equivalence), [`ShimuraVarieties:V6/plan/connected-products`](#shimuravarieties-v6-plan-connected-products), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V6/plan/abelian-canonical`](#shimuravarieties-v6-plan-abelian-canonical), [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/rank-one-central-separation`](#shimuravarieties-v7-plan-rank-one-central-separation), [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum), [`ShimuraVarieties:V7/plan/kazhdan-uniformization`](#shimuravarieties-v7-plan-kazhdan-uniformization), [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation), [`ShimuraVarieties:V7/plan/marked-conjugation`](#shimuravarieties-v7-plan-marked-conjugation), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence), [`ShimuraVarieties:V7/plan/conjugation-cocycle`](#shimuravarieties-v7-plan-conjugation-cocycle), [`ShimuraVarieties:V7/plan/finite-rigidifying-points`](#shimuravarieties-v7-plan-finite-rigidifying-points), [`ShimuraVarieties:V7/plan/continuous-descent`](#shimuravarieties-v7-plan-continuous-descent), [`ShimuraVarieties:V7/plan/general-canonical`](#shimuravarieties-v7-plan-general-canonical), [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields), [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/level-tower`](#shimuravarieties-v8-plan-level-tower), [`ShimuraVarieties:V8/plan/translation-laws`](#shimuravarieties-v8-plan-translation-laws), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/hecke-span`](#shimuravarieties-v8-plan-hecke-span), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality), [`ShimuraVarieties:V8/plan/abelian-instance`](#shimuravarieties-v8-plan-abelian-instance), [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0), [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model), [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8/plan/minimal-map-extension`](#shimuravarieties-v8-plan-minimal-map-extension), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate), [`ShimuraVarieties:V8/plan/gl2-tower-compatibility`](#shimuravarieties-v8-plan-gl2-tower-compatibility), [`ShimuraVarieties:V8.general/plan/general-tower`](#shimuravarieties-v8-general-plan-general-tower), [`ShimuraVarieties:V8.general/plan/general-minimal`](#shimuravarieties-v8-general-plan-general-minimal), [`ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety`](#shimuravarieties-v8-plan-zero-dimensional-shimura-variety), [`ShimuraVarieties:V8/plan/component-reciprocity`](#shimuravarieties-v8-plan-component-reciprocity), [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension), [`ShimuraVarieties:V1/level-index`](#shimuravarieties-v1-level-index), [`ShimuraVarieties:V4/plan/reflex-norm-functoriality`](#shimuravarieties-v4-plan-reflex-norm-functoriality), [`ShimuraVarieties:V2/minimal-datum-extension`](#shimuravarieties-v2-minimal-datum-extension), [`ShimuraVarieties:V2/codim-one-analytic-extension`](#shimuravarieties-v2-codim-one-analytic-extension), [`ShimuraVarieties:V2/log-canonical-sections`](#shimuravarieties-v2-log-canonical-sections).

<a id="refinement-15"></a>

### Positive rational abelianization and local openness

Current AA §4.5 already plans abelianization-integral-lifts (Lang plus smooth Hensel outside finitely many primes), finite-adelic abelianization and class-set abelianization, with §4.1 Kneser/Hasse inputs. Import those targets. The remaining Shimura specialization proves ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)) and local openness of ν on finite local points, hence compact openness of ν(K), preserving the simply connected derived-group and real-component hypotheses of SVI Lemmas 5.20–5.21, pp.60–61. It is an AA.4 refinement, not a ReductiveGroups Layer 7 output.

Needed by: [`ShimuraVarieties:V0/plan/simply-connected-components`](#shimuravarieties-v0-plan-simply-connected-components).

<a id="refinement-16"></a>

### CM norm-kernel inputs

Milne 2007c Lemma 3.6 uses Chevalley’s theorem that the finite-idelic topology on a finite-index torsion-free subgroup of O_E× is its full profinite topology. This identifies closure(E×)/E× with a uniquely divisible group fixed by CM conjugation. Lemma 3.12 also uses the Hasse norm theorem for the cyclic quadratic CM extension E/E⁺ to turn a totally positive everywhere-local norm into a global norm. CFT Layer 11 does not state these inputs. Propose ClassFieldTheory, Part II, first new layer CFT.N, for these generic unit-topology/cyclic-norm interfaces, also consumed by the Serre-protorus construction; retain the CM-specific norm-kernel deduction in V5. Read the Chevalley and cyclic-norm primary proofs before claiming closure, and handle CM product algebras componentwise.

Needed by: [`ShimuraVarieties:V5/plan/main-cm`](#shimuravarieties-v5-plan-main-cm).

<a id="refinement-17"></a>

### Connected adjoint datum convention and carrier

The connected carrier is a G^ad(R)^+-class of S→G^ad_R even for simply connected G. Its actual analytic/pro-algebraic implementation and comparison to D4/adjoint-datum remain to be supplied. D4/special-pair applies to the adjoint datum, with the torus pulled back to G; the standard PGL₂ cocharacter does not lift integrally to SL₂. No S-map lift is assumed. V6 supplies this explicit connected convention before advanced V6/V7 Lean signatures can be restored.

Needed by: [`ShimuraVarieties:V6/plan/connected-tower`](#shimuravarieties-v6-plan-connected-tower), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum).

<a id="refinement-18"></a>

### Exceptional central adjustment and rank-one perfection

Milne 1983 §3.10, p.252, attributes absence of noncentral normal subgroups to Platonov–Rapinchuk 1979 and applies it to a reductive Hα containing the full maximal torus. The primary paper Theorem 1 (p.279) proves perfection of the three-dimensional norm-one group SL₁(D) when D is split at every finite place; its final discussion (p.282) still calls simplicity modulo centre a conjecture. The full reductive Hα need not be perfect: its derived rational subgroup is a proper noncentral normal subgroup when its central torus has positive dimension. Replace the printed argument with the exact semisimple perfection input, then prove the missing comparison that eliminates the central adjustment on the marked torus, retaining the totally real extension and all-place split hypotheses. A subgroup containing T is not interchangeable with its derived group. This remains a ReductiveGroups Part II proof-interface request, independent of corrected Lemma 3.8 centre cohomology; see E12.

Needed by: [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation).

<a id="refinement-19"></a>

### Arithmetic reductive supplier ownership

The read upstream ReductiveGroups Layer 7 gives structural root/tori/parabolic theory, not rational real density, arithmetic images under algebraic maps, all-place torus norm obstructions or restriction-of-scalars classification with Hermitian real hypotheses. Import AA §3.4 pairwise level commensurability and route the faithful-integral/effective arithmetic-image comparison to AA.3; route abelianized component images to AA.4; refine the remaining rational real-density/torus-conjugacy, Q-simple classification and cohomological/root-centre interfaces in ReductiveGroups Part II. Each use must preserve the input field, real component and centre hypotheses. These are ownership requests; the upstream roadmaps are read-only inputs.

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/special-existence`](#shimuravarieties-v4-plan-special-existence), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), [`ShimuraVarieties:V7/plan/rank-one-central-separation`](#shimuravarieties-v7-plan-rank-one-central-separation), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence).

<a id="refinement-20"></a>

### Abelian auxiliary class for Pink 12.10

In the abelian-type lane, Pink 12.10 needs canonical models of (G,X)/SL2,Q and of (G̃,X̃) for G̃ = G ×_{PGL2} GL2, including data in Pink's sense whose X maps non-injectively to Hom(S,G_R) (for GL2 itself, the two-point datum (G_m,{±1}) of zero-dimensional-shimura-variety). Verify that these stay in the existence class of V5/V6, or state precisely the stronger hypothesis on the actual auxiliary models; this prevents a hidden V7 dependency in the abelian lane. The logarithmic line is not part of this gap: on M_K^+ over E, omega[dlog] is defined algebraically and its sections commute with E -> C (R09.3), while the precise comparison with the complex Baily–Borel logarithmic section embedding is the owned V2/log-canonical-sections target. The auxiliary models in Pink's broader datum category must also be supplied in the general lane: V7's strict pure-datum existence statement alone does not cover a domain that maps non-injectively to Hom(S,G_R). The two-point torus case is constructed by zero-dimensional-shimura-variety.

Needed by: [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension), [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8.general/plan/general-minimal`](#shimuravarieties-v8-general-plan-general-minimal).

## Supplier contracts

These requests import the stated owner’s existing targets and identify only the required extensions. The lower-tier analytic and codimension-one inputs must precede this roadmap.

### AdelicAlgebraicGroups:AA.3

Import current AA §3.4 / Reduction.levelArithmetic_commensurable for arbitrary compact-open levels and representatives. Expose the remaining bridge from an integral-model compact level to G(Q)∩GL_n(Z) for every faithful rational embedding, and arithmeticity of the effective domain image after removing compact ineffective factors. Preserve the finite-index rational component subgroup. Import class-number-finite separately; V0 does not replan reduction or pairwise commensurability.

Current upstream locator: `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-3-reduction-and-arithmetic-quotients`.

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic).

### AdelicAlgebraicGroups:AA.4

Extend the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or quotient-action degree. Supply finite topological level maps, the effective kernel of a normal K/K′ action, Hecke-span composition via double cosets, and the Cartesian comparison only with its precise U′L=U hypothesis. Arithmetic neatness remains owned by D5/AA.4. Distinguish the effective normal-level quotient action from the full automorphism group over the base of a disconnected cover. Specialize the existing class-set/Kneser/Hasse nodes for components; import current AA §4.5 integral almost-all-prime lifts and finite-adelic abelianization, and request only the positive rational component image and local openness specialization of SVI 5.20–5.21.

Current upstream locator: `tauceti:TauCetiRoadmap/AdelicAlgebraicGroups#layer-4-approximation-neat-levels-and-hecke-maps`.

Needed by: [`ShimuraVarieties:V1/plan/holomorphic-level-maps`](#shimuravarieties-v1-plan-holomorphic-level-maps), [`ShimuraVarieties:V1/plan/holomorphic-hecke`](#shimuravarieties-v1-plan-holomorphic-hecke), [`ShimuraVarieties:V0/plan/simply-connected-components`](#shimuravarieties-v0-plan-simply-connected-components).

### ArithmeticLocallySymmetricSpaces:ALS.0

Properness of the symmetric-space isometry action, arithmetic finite covolume after compact ineffective factors, and the finite normalizer-index/finite automorphism theorem for torsion-free arithmetic Hermitian quotients. For weak conjugation additionally supply the precisely ranked S-arithmetic arithmeticity and superrigidity conclusions of Milne 1983 §§3.5–3.7; these additions are an explicit extension gap, not already present ALS.0 outputs.

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), [`ShimuraVarieties:V0/plan/effective-proper-action`](#shimuravarieties-v0-plan-effective-proper-action), [`ShimuraVarieties:V7/plan/kazhdan-uniformization`](#shimuravarieties-v7-plan-kazhdan-uniformization), [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation), [`ShimuraVarieties:V7/plan/finite-rigidifying-points`](#shimuravarieties-v7-plan-finite-rigidifying-points).

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Import the existing rational parabolic/root, maximal-torus, Weyl and reductive structural theory only. The rational real-density theorem, arithmetic images, restriction-of-scalars classification of Q-simple groups, real maximal-torus conjugacy, corrected finite-place H¹(k,Z) injectivity, adjoint Hasse principle, norm/weak-approximation assertions and root-centre identities require the specified ReductiveGroups Part II extension, recorded as a gap. The adelic ν-image/class-set and simply connected torsor inputs are imported separately from AA.4; none is claimed as an existing upstream Layer 7 output. For the exceptional §3.10 adjustment, import the exact Platonov–Rapinchuk rank-one perfection result and prove its marked-torus/central comparison; do not attribute simplicity of the full reductive Hα to it (E12).

Needed by: [`ShimuraVarieties:V0/plan/stabilizer-arithmetic`](#shimuravarieties-v0-plan-stabilizer-arithmetic), [`ShimuraVarieties:V2/plan/rational-boundary`](#shimuravarieties-v2-plan-rational-boundary), [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V4/plan/special-existence`](#shimuravarieties-v4-plan-special-existence), [`ShimuraVarieties:V4/plan/hecke-density`](#shimuravarieties-v4-plan-hecke-density), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting), [`ShimuraVarieties:V7/plan/rank-one-subdata`](#shimuravarieties-v7-plan-rank-one-subdata), [`ShimuraVarieties:V7/plan/rank-one-central-separation`](#shimuravarieties-v7-plan-rank-one-central-separation), [`ShimuraVarieties:V7/plan/conjugated-datum`](#shimuravarieties-v7-plan-conjugated-datum), [`ShimuraVarieties:V7/plan/kazhdan-uniformization`](#shimuravarieties-v7-plan-kazhdan-uniformization), [`ShimuraVarieties:V7/plan/weak-conjugation`](#shimuravarieties-v7-plan-weak-conjugation), [`ShimuraVarieties:V7/plan/completed-conjugation-equivariance`](#shimuravarieties-v7-plan-completed-conjugation-equivariance), [`ShimuraVarieties:V7/plan/special-independence`](#shimuravarieties-v7-plan-special-independence).

### ReductiveGroupsPartII:RG2.0a

Import the existing ReductiveGroups Part II finite-free Weil restriction of affine group schemes and descent/splitting interfaces, applying them to field extensions here. The reflex norm uses its split character/cocharacter products, torus norm, base-change and diagonal-embedding compatibilities; expose any missing norm/cocharacter specialization at this owner, without planning the general Weil restriction construction again.

Current upstream locator: `tauceti:TauCetiRoadmap/ReductiveGroupsPartII#layer-rg20a-weil-restriction-and-the-deligne-torus`.

Needed by: [`ShimuraVarieties:V4/plan/reflex-norm`](#shimuravarieties-v4-plan-reflex-norm), [`ShimuraVarieties:V7/plan/simple-connected-reduction`](#shimuravarieties-v7-plan-simple-connected-reduction), [`ShimuraVarieties:V7/plan/auxiliary-cm-splitting`](#shimuravarieties-v7-plan-auxiliary-cm-splitting).

### ComplexComparisonPartII:C0

Analytification of locally finite-type complex schemes as locally ringed spaces, including nonreduced spaces; compatibility with products, open and closed immersions, étale local isomorphisms and smooth manifolds; faithful analytic comparison of morphisms and invariant local finite quotients. The missing analytic category and gluing carrier are specified in the CA.0 ownership proposal and gap, rather than assumed to be in PR196 or retired LI.2. Apply the étale/smooth chart comparison to strict-SNC boundary coordinates, and identify analytification of a finite group quotient with the analytic quotient.

Needed by: [`ShimuraVarieties:V1/plan/analytic-structure`](#shimuravarieties-v1-plan-analytic-structure), [`ShimuraVarieties:V2/plan/analytic-automorphic-ring`](#shimuravarieties-v2-plan-analytic-automorphic-ring), [`ShimuraVarieties:V2/plan/normal-analytic-compactification`](#shimuravarieties-v2-plan-normal-analytic-compactification), [`ShimuraVarieties:V3/plan/borel-extension`](#shimuravarieties-v3-plan-borel-extension), [`ShimuraVarieties:V3/plan/unique-algebraization`](#shimuravarieties-v3-plan-unique-algebraization), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization).

### ComplexComparisonPartII:C2

Projective GAGA for coherent sheaves and ideals, section comparisons and algebraization of projective analytic data, applied to the already constructed automorphic compactification.

Needed by: [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel).

### ComplexComparisonPartII:C4

Chow for closed projective analytic subspaces and graph algebraicity between proper algebraic schemes; proper graph comparison after normal-crossing compactification. The added definable-graph route requires an independent arithmetic-to-algebraic definability comparison, polarized period-map definability and Peterzil–Starchenko o-minimal Chow; route those additions to a Complex Comparison Part II extension, with gaps until certified. For the alternative proof, expose KUY 1.9/4.1/4.2 with the exact complex cusp-chart/exponential compactness contract, BKT 1.3, and BKT 4.13; no ordinary Borel algebraicity or arithmetic toroidal model is used to certify that comparison.

Needed by: [`ShimuraVarieties:V2/plan/baily-borel`](#shimuravarieties-v2-plan-baily-borel), [`ShimuraVarieties:V2/plan/minimal-level-extension`](#shimuravarieties-v2-plan-minimal-level-extension), [`ShimuraVarieties:V3/plan/borel-algebraicity`](#shimuravarieties-v3-plan-borel-algebraicity), [`ShimuraVarieties:V3/plan/definable-target-comparison`](#shimuravarieties-v3-plan-definable-target-comparison), [`ShimuraVarieties:V3/plan/definable-borel`](#shimuravarieties-v3-plan-definable-borel), [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization).

### tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites

Import Layer 0D’s already specified equivalence between finite continuous absolute-Galois sets and finite étale field schemes, with products and morphisms. Import Layer 0C’s invariant affine quotient/free-action API through SF.1/finite-group-quotient. The general orbit-cover quotient construction is already planned by SF.1; only its descended ample-power/quasi-projectivity extension remains requested there.

Needed by: [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization), [`ShimuraVarieties:V4/plan/torus-model`](#shimuravarieties-v4-plan-torus-model).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Absolute arithmetic Artin reciprocity, continuity and kernel, compatibility of norms with restriction, ray class fields and generation by good primes. The upstream README §Conventions explicitly fixes arithmetic Frobenius; geometricArtin in V4 inverts that map. CM norm-kernel lemmas are proved in V5, not supplied by class field theory alone. Do not read a generic Hasse norm theorem or Chevalley’s topology on global units into Layer 11: their common-owner Part II proposal is the separate CM norm-kernel inputs gap.

Needed by: [`ShimuraVarieties:V4/plan/geometric-artin`](#shimuravarieties-v4-plan-geometric-artin), [`ShimuraVarieties:V4/plan/reciprocity-finite-action`](#shimuravarieties-v4-plan-reciprocity-finite-action), [`ShimuraVarieties:V5/plan/cm-ideal-reciprocity`](#shimuravarieties-v5-plan-cm-ideal-reciprocity), [`ShimuraVarieties:V5/plan/main-cm`](#shimuravarieties-v5-plan-main-cm).

### AlgebraicModuliForArithmeticGeometry:R09.3

Faithful base change and effective continuous quasi-projective descent of schemes/morphisms, including Milne 1999 Theorem 1.1 under infinite transcendence degree and its finite rigidifying-point criterion. Descend invariant closed images and finite quotient towers with compatible maps. Ordinary finite-group quotient existence is imported from SF.1/finite-group-quotient, rather than requested here.

Needed by: [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V6/plan/hodge-inheritance`](#shimuravarieties-v6-plan-hodge-inheritance), [`ShimuraVarieties:V6/plan/central-isogeny-descent`](#shimuravarieties-v6-plan-central-isogeny-descent), [`ShimuraVarieties:V7/plan/continuous-descent`](#shimuravarieties-v7-plan-continuous-descent), [`ShimuraVarieties:V7/plan/general-canonical`](#shimuravarieties-v7-plan-general-canonical).

### PELModuli:M3

Generic rational Siegel moduli with actual polarization and integral/adelic symplectic level, including the fine/neat and coarse/non-neat distinctions, its analytic family/uniformization and the moduli map used after V3 to algebraize weight-one variations. This request uses M0–M3 only; M4 canonical models are not an input to V5.

Needed by: [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/siegel-canonical`](#shimuravarieties-v5-plan-siegel-canonical).

### AbelianSchemesAndArithmeticModuli:A2

Dual abelian schemes, rational polarizations and Rosati involutions, with E-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

Needed by: [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), [`ShimuraVarieties:V5/plan/cm-polarization-level`](#shimuravarieties-v5-plan-cm-polarization-level), [`ShimuraVarieties:V5/plan/cm-frobenius`](#shimuravarieties-v5-plan-cm-frobenius).

### AbelianSchemesAndArithmeticModuli:A3

Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

Needed by: [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V5/plan/cm-frobenius`](#shimuravarieties-v5-plan-cm-frobenius), [`ShimuraVarieties:V5/plan/cm-polarization-level`](#shimuravarieties-v5-plan-cm-polarization-level).

### AbelianSchemesAndArithmeticModuli:A4

Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and Lie-eigenspace comparison, including faithful action of quasi-isogenies.

Needed by: [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V5/plan/shimura-taniyama`](#shimuravarieties-v5-plan-shimura-taniyama).

### AbelianSchemesAndArithmeticModuli:A5

The analytic equivalence of polarizable integral homological type (−1,0),(0,−1) variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is V5 after M3 and Borel; A5 must not use V5 to provide its analytic equivalence.

Needed by: [`ShimuraVarieties:V5/plan/weight-one-algebraization`](#shimuravarieties-v5-plan-weight-one-algebraization), [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety).

### AbelianSchemesAndArithmeticModuli:A6

Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, and rigidity and number-field spreading of endomorphisms. The Frobenius proof instead imports the existing all-characteristic scalar-extended Hom injectivity, finite-rank, characteristic-polynomial and normal-base extension nodes; no stronger positive-characteristic Tate theorem is requested.

Needed by: [`ShimuraVarieties:V5/plan/cm-abelian-variety`](#shimuravarieties-v5-plan-cm-abelian-variety), [`ShimuraVarieties:V5/plan/cm-tate-rank-one`](#shimuravarieties-v5-plan-cm-tate-rank-one), [`ShimuraVarieties:V5/plan/cm-number-field-model`](#shimuravarieties-v5-plan-cm-number-field-model), [`ShimuraVarieties:V5/plan/siegel-special-cm`](#shimuravarieties-v5-plan-siegel-special-cm).

### SchemeAndStackFoundations:SF.1

Extend the existing finite-group-quotient node with the characteristic-zero quasi-projectivity output: for a finite action on a normal quasi-projective scheme, tensor the translates of an ample bundle, take a power whose stabilizers act trivially, descend it to an ample bundle on the quotient, and expose the finite quotient/normality comparison. The invariant affine cover and scheme quotient existence are already provided by that node.

Needed by: [`ShimuraVarieties:V3/plan/finite-quotient-algebraization`](#shimuravarieties-v3-plan-finite-quotient-algebraization).

### AlgebraicModuliForArithmeticGeometry:R09.2

The relative cocharacter Hom scheme Hom(G_m,T) for the family of maximal tori T_v over the regular-semisimple locus V of Lie(G), and its locus where the cocharacter lies in the datum's geometric conjugacy class. This selected incidence locus is Deligne's finite étale cover W -> V (5.1, p.153), with its base change; the entire cocharacter Hom scheme need not be finite.

Needed by: [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields).

### AlgebraicModuliForArithmeticGeometry:R09.3

Faithful field base change on morphisms; descent along C/E of morphisms fixed by Aut(C/E) (Milne 13.1) and of closed subschemes; effective polarized projective descent; flat base change of global sections of an invertible sheaf on a quasi-compact separated E-scheme; dense-open equality for reduced source and separated target.

Needed by: [`ShimuraVarieties:V8/plan/translation-descent`](#shimuravarieties-v8-plan-translation-descent), [`ShimuraVarieties:V8/plan/model-uniqueness`](#shimuravarieties-v8-plan-model-uniqueness), [`ShimuraVarieties:V8/plan/translation-laws`](#shimuravarieties-v8-plan-translation-laws), [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/datum-functoriality`](#shimuravarieties-v8-plan-datum-functoriality), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8/plan/minimal-map-extension`](#shimuravarieties-v8-plan-minimal-map-extension), [`ShimuraVarieties:V8/plan/gl2-tower-compatibility`](#shimuravarieties-v8-plan-gl2-tower-compatibility), [`ShimuraVarieties:V8/plan/component-reciprocity`](#shimuravarieties-v8-plan-component-reciprocity), [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension).

### AlgebraicModuliForArithmeticGeometry:R09.5

Finite quotients of quasi-projective schemes by finite group actions (effective quotients), descent of finite/surjective/étale properties, normal projective curve compactifications and finite correspondences, and scheme-theoretic closure compatible with extension of fields.

Needed by: [`ShimuraVarieties:V8/plan/finite-level-maps`](#shimuravarieties-v8-plan-finite-level-maps), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0), [`ShimuraVarieties:V8/plan/minimal-descent`](#shimuravarieties-v8-plan-minimal-descent), [`ShimuraVarieties:V8/plan/codim-one-extension`](#shimuravarieties-v8-plan-codim-one-extension).

### InverseGaloisAndArithmeticFundamentalGroups:IG.2

Hilbert irreducibility for a finite étale cover over a number field with geometrically irreducible total incidence variety, prescribed nonempty real open, and linear disjointness from a fixed finite extension. Existing elementary-polynomial nodes do not state this.

Needed by: [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields).

### ModularCurvesPartII:R12.1

Uniformisation E(C) ≅ C/Lambda with H_1(E,Z) = Lambda, compatible with Tate modules and full level-N bases, and the analytic formula for the scheme-theoretic Weil pairing; in particular the reference root zeta_ref = e_N(tau/N, 1/N) on C/(Z tau + Z), Im tau > 0, is independent of tau (the calibration behind E2).

Needed by: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate).

### ModularCurvesPartII:R12.2

Analytic uniformization of the full ordered level N >= 3, fixed-pairing, Gamma1 (N >= 4) and coarse Gamma0 (every N > 0) curves as isomorphisms, with the ordered-basis determinant identified with the chosen root of unity. Agreement with AA.5's adelic component calculation is AA.5's own target, since AA.5 consumes R12.2.

Needed by: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0).

### ModularCurvesPartII:R12.3

Cusp labels, effective stabilizers and widths, analytic parameter exp(2 pi i z/w) and its transformation under level maps.

Needed by: [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate).

### ModularCurvesPartII:R12.4

Open fixed-pairing fibre geometrically connected and irreducible, deduced from Gamma(N) quotient without importing arithmetic compactification.

Needed by: [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre).

### ModularCurvesPartII:R12.5

The basic isogeny correspondences on the modular curves (both legs as moduli maps), their description on the upper half-plane, and the pullback and trace normalization of the Hecke action on differentials. The adelic dictionary for nonintegral g is V8's row-basis node, not R12.5.

Needed by: [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary), [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-tower-compatibility`](#shimuravarieties-v8-plan-gl2-tower-compatibility).

### ModularCurvesPartII:R12.6

Compatibility of the analytic–algebraic comparison with level changes, diamond operators and complex conjugation; fields of definition of the components and of the canonical cusp. Residue fields of all cusps come from R13.4b.

Needed by: [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1), [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate), [`ShimuraVarieties:V8/plan/gl2-tower-compatibility`](#shimuravarieties-v8-plan-gl2-tower-compatibility).

### ModularCurvesPartII:R13.4a

Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute Layer-10 prime diamond quotients.

Needed by: [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model).

### ModularCurvesPartII:R13.4b

Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

Needed by: [`ShimuraVarieties:V8/plan/gl2-compact-model`](#shimuravarieties-v8-plan-gl2-compact-model), [`ShimuraVarieties:V8/plan/gl2-cusps-tate`](#shimuravarieties-v8-plan-gl2-cusps-tate), [`ShimuraVarieties:V8/plan/gl2-tower-compatibility`](#shimuravarieties-v8-plan-gl2-tower-compatibility).

### PELModuli:M3

Genus-one fine full ordered-basis generic-fibre moduli scheme with N >= 3, homology/Tate comparison to the GL2/GSp2 complex double quotient.

Needed by: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity).

### PELModuli:M4

Actual normalized CM action on genus-one full-level moduli and its agreement with the V4 special-pair reciprocity condition, including all determinant components.

Needed by: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity).

### PELModuli:M5

The genus-one Siegel moduli and its comparison with #81's Y_full(N) (N >= 3), including the determinant/Weil-pairing convention, the basis-change determinant exponent and the cyclotomic target.

Needed by: [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity).

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Connected centralizers of cocharacters, conjugacy and geometry of maximal tori, regular semisimple Lie open and compact-mod-centre real tori. Import this structure theory; the incidence specialization belongs to the requested IG.2/R09.2 contracts.

Needed by: [`ShimuraVarieties:V8/plan/disjoint-special-reflex-fields`](#shimuravarieties-v8-plan-disjoint-special-reflex-fields).

### tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing

Existing full ordered-basis scheme for N >= 3 and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. R12.1/R12.2 supply the analytic comparison.

Needed by: [`ShimuraVarieties:V8/plan/gl2-moduli-reciprocity`](#shimuravarieties-v8-plan-gl2-moduli-reciprocity), [`ShimuraVarieties:V8/plan/gl2-full-level`](#shimuravarieties-v8-plan-gl2-full-level), [`ShimuraVarieties:V8/plan/gl2-determinant-pairing`](#shimuravarieties-v8-plan-gl2-determinant-pairing), [`ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre`](#shimuravarieties-v8-plan-gl2-fixed-pairing-fibre), [`ShimuraVarieties:V8/plan/gl2-row-basis-dictionary`](#shimuravarieties-v8-plan-gl2-row-basis-dictionary).

### tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4

Existing fine Gamma1 moduli scheme for N >= 4 with a point of exact order; the K1 stabilizer dictionary uses the first row-basis generator.

Needed by: [`ShimuraVarieties:V8/plan/gl2-gamma1`](#shimuravarieties-v8-plan-gl2-gamma1).

### tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n

Existing characteristic-zero coarse Gamma0 cyclic-subgroup moduli: Y_0(1) is the coarse j-line and, for N >= 3, Y_full(N)/B by the coarse Borel-quotient formula. No universal elliptic family is claimed.

Needed by: [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0).

### tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions

The equivalence between finite étale K-schemes and finite continuous Gal(K^s/K)-sets over a field K, used to attach a scheme to the Galois set of formula (64).

Needed by: [`ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety`](#shimuravarieties-v8-plan-zero-dimensional-shimura-variety).

### tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients

Coarse moduli M([Gamma0(N)]) as a finite quotient of a rigidified representable cover, for N = 2, where 9E's Borel-quotient formula is not used.

Needed by: [`ShimuraVarieties:V8/plan/gl2-gamma0`](#shimuravarieties-v8-plan-gl2-gamma0).

## Pinned native interfaces

The following existing declarations provide only the stated carriers and elementary interfaces. None supplies a Shimura datum, analytic category or canonical-model predicate.

| Declaration | Module | Imported interface |
| --- | --- | --- |
| `mathlib:MulAction.orbitRel` | `Mathlib/GroupTheory/GroupAction/Defs.lean` | Setoid with relation a ∈ orbit G b for a group action; no analytic structure asserted. |
| `mathlib:MulAction.orbitRel.Quotient` | `Mathlib/GroupTheory/GroupAction/Defs.lean` | The quotient type by the actual orbit relation. |
| `mathlib:MulAction.stabilizer` | `Mathlib/GroupTheory/GroupAction/Defs.lean` | Subgroup of group elements fixing a point. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes with native category and structure morphisms |
| `mathlib:CategoryTheory.Over` | `Mathlib/CategoryTheory/Comma/Over/Basic.lean` | Slice category over the actual base scheme |
| `mathlib:CategoryTheory.Functor` | `Mathlib/CategoryTheory/Functor/Basic.lean` | Objects, maps, identity and composition laws |
| `mathlib:CategoryTheory.Over.pullback` | `Mathlib/CategoryTheory/Comma/Over/Pullback.lean` | Base-change functor on slice categories |
| `mathlib:CategoryTheory.Over.pullbackId` | `Mathlib/CategoryTheory/Comma/Over/Pullback.lean` | Natural isomorphism for identity base change |
| `mathlib:CategoryTheory.Over.pullbackComp` | `Mathlib/CategoryTheory/Comma/Over/Pullback.lean` | Natural isomorphism for successive base changes |
| `mathlib:CategoryTheory.Limits.span` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean` | Native ordered WalkingSpan functor |
| `mathlib:CategoryTheory.Limits.spanCompIso` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean` | Applying a functor to a span agrees naturally with the span of its images |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | Native finite scheme morphism |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Native proper scheme morphism |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | `Mathlib/AlgebraicGeometry/OpenImmersion.lean` | Native open immersion of schemes |
| `mathlib:IntermediateField.LinearDisjoint` | `Mathlib/FieldTheory/LinearDisjoint.lean` | Linear disjointness of actual intermediate fields via subalgebras |

## Source corrections

All 26 records were checked by REV-ShimuraVarieties on 13 October 2026: 25 confirmed and one rejected. E3, E4 and E10 preserve inherited IDs for the fuller records E20, E25 and E24 respectively; they are not additional distinct findings. Earlier independent verdicts remain in the packet’s review history.

### ShimuraVarieties/E1 — misprint

Origin: `ShimuraVarieties/V0/E1`. Source `action`, Lemma 3.8, printed p.250, annotated 1983 author scan.

Issue: H¹(k,G) → ∏_{v finite} H¹(k_v,G)

Correction: Replace G by Z=Z(G) in both cohomology terms; preserve no A_n factor with n≥4.

Reason: The proof computes the finite centre and its Galois action and explicitly proves injectivity for H¹(k,Z). The displayed scan has the author’s handwritten Z corrections.

Published or author correction: Author’s annotated scan, https://jmilne.org/math/articles/1983a.pdf; the V7 issue explicitly requires this correction.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The annotated display and centre calculation on action p.250 use Z(G) throughout; the exclusion of A_n with n≥4 is unchanged.

### ShimuraVarieties/E2 — error

Origin: `ShimuraVarieties/V0/E2`. Source `bkt`, Theorem 1.1(1)–(2), author manuscript pp.3–4; corrected by author erratum §§1.1–1.3.

Issue: The source claims Ralg-definability for every morphism f : SΓ′,G′,M′ → SΓ,G,M between arithmetic quotients.

Correction: Fix maximal compact K for the definable structure; require the corrected morphism compatibility with K,K′ and preservation of the embedded Lie algebra by the target Cartan involution. Hodge manifolds and period maps retain their corrected canonical choice.

Reason: The erratum §1.6 gives distinct definable structures and morphisms without finite Siegel containment. The V3 alternative uses only the corrected symmetric/Hodge case.

Published or author correction: Bakker–Klingler–Tsimerman, author erratum, https://benjamin-bakker.github.io/DefArithErr.pdf, Theorem 1.2.

Effect: a stated result.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The full BKT author erratum restricts the chosen maximal compact and the Cartan-compatible morphisms. Its pure period-map consequence, rather than the original unrestricted functoriality, is the V3 input.

### ShimuraVarieties/E3 — misprint

Origin: `ShimuraVarieties/V0/E3`. Source `svi`, Formulas (60)–(61), p.114, SVI revised 16 September 2017.

Issue: ∑ ρ(μx(a))

Correction: Use the multiplicative product of the conjugate cocharacter values, not their sum.

Reason: The codomain is an arbitrary torus group, whose values admit multiplication, not addition. For G_m with μ(t)=tⁿ the Weil-restriction norm is ∏ρ ρ(a)ⁿ; summation is not a homomorphism and need not be invertible.

Published or author correction: Author xnotes errata, https://www.jmilne.org/math/xnotes/errata.html, SVI p.114; product correction credited to Ruida Di. See also Jungin Lee, https://www.jmilne.org/math/xnotes/SV_errata.pdf, for the embedding field.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The two torus expressions on SVI p.114 require multiplication. The official xnotes errata credit this correction to Ruida Di; E20 also records the corrected embedding field.

Duplicate of `ShimuraVarieties/E20`; retained for provenance.

### ShimuraVarieties/E4 — misprint

Origin: `ShimuraVarieties/V0/E4`. Source `svi`, Proposition 14.16(b), p.127, more-precisely paragraph, SVI revised 16 September 2017.

Issue: The source describes the canonical model of Sh⁰(G₂,X₂) as a quotient of that same canonical model of Sh⁰(G₂,X₂).

Correction: The second source model is Sh⁰(G₁,X₁); quotient it by the kernel of the completion map for G₁→G₂.

Reason: The preceding assertion assumes existence for G₁. The following kernel is explicitly that of the source-to-target map; quotienting the already-target model would assume the conclusion and give the wrong tower.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The kernel in SVI 14.16(b) maps the source completion to the target completion, so its quotient starts with the G1 model. Checked also on published 2005 p.356; E25 records the same correction.

Duplicate of `ShimuraVarieties/E25`; retained for provenance.

### ShimuraVarieties/E5 — misprint

Origin: `ShimuraVarieties/V0/E5`. Source `cm`, Remark 3.11(a), p.22, author article 2007c.

Issue: rec(s) = σ|E*ab

Correction: Use art_{E*}(s)=σ|E*ab, as in Theorem 3.10 and Lemma 3.9 immediately above.

Reason: The article defines art as the inverse of rec. An automorphism of order greater than two detects the sign; the change-of-lift lemma and stated quasi-isogeny formula both use art.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. CM 3.10 and 3.9 fix the inverse-Artin convention; the symbol rec in 3.11(a) reverses that convention. A class of order greater than two detects the discrepancy.

### ShimuraVarieties/E6 — error

Origin: `ShimuraVarieties/V0/E6`. Source `cm`, Theorem 2.1(b) proof pp.16–17, author article 2007c; public author correction.

Issue: O_k

Correction: In the integral eigenspace decomposition at the good unramified prime P use O_{k,P} throughout the first two proof paragraphs, not global O_k.

Reason: Splitting E⊗k does not split O_E⊗O_k globally: conjugate roots can coincide modulo ramified primes. Localization at the unramified prime gives the needed étale eigenspaces. The V5 Frobenius proof requests this localized comparison.

Published or author correction: Author erratum https://www.jmilne.org/math/articles/2007c.html.

Effect: the proof.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The author correction to CM 2.1 and its local eigenspace argument require the good-prime localization. A global integral splitting fails at ramified primes.

### ShimuraVarieties/E7 — gap

Origin: `ShimuraVarieties/V0/E7`. Source `descent`, Remark 1.3(c), p.2, 1999 author version, identifying Milne 1994 Lemma 3.23.

Issue: The source says the continuity requirements are omitted.

Correction: Use the finitely generated splitting criterion of Theorem 1.1 and finite rigidifying-point Corollary 1.2. The canonical system must be shown continuous before effective descent.

Reason: Remark 1.3(a) exhibits noneffective noncontinuous systems; a cocycle law by itself does not imply effectivity. V7 separates cocycle, finite rigidification, continuity and descent.

Published or author correction: Milne, Descent for Shimura varieties (1999), Theorem 1.1 and Corollary 1.2 explicitly replace the older lemma.

Effect: the proof.

Independent verdict: **confirmed**, REV-ShimuraVarieties. Descent Remark 1.3(c) identifies the missing continuity hypothesis in the older lemma. Theorem 1.1 and Corollary 1.2 supply the replacement used by the planned descent route.

### ShimuraVarieties/E8 — error

Origin: `ShimuraVarieties/V0/E8`. Source `svi`, Theorem 3.11, p.38, relative to the source’s geometrically-reduced definition of algebraic variety on pp.35–36.

Issue: The source asserts that each projective complex analytic space admits exactly one projective algebraic variety structure.

Correction: For analytic spaces with nilpotents use projective algebraic schemes. For the source’s geometrically-reduced varieties restrict the analytic space to be reduced. V2 uses normal reduced compactifications, so its statement is unaffected.

Reason: The projective analytic fat point with local ring C[ε]/(ε²) cannot analytify a geometrically-reduced variety. The CA.0 carrier must nevertheless include it for GAGA and general analytification.

Published or author correction: new

Effect: a stated result.

Independent verdict: **rejected**, REV-ShimuraVarieties. The source does not explicitly include quotient local rings with nilpotents in its analytic-space convention. A fat point therefore does not refute its reduced-variety theorem. The broader CA.0 scheme/analytic category is still needed independently.

### ShimuraVarieties/E9 — error

Origin: `ShimuraVarieties/V0/E9`. Source `svi`, Proposition 10.5 proof, p.101, revised 16 September 2017 author copy.

Issue: The source asserts the existence of a pro-p subgroup in I whose index is finite.

Correction: Absolute local inertia is not virtually pro-p. Either factor the abelian representation through local reciprocity, whose unit-group image is virtually pro-p, or use finite-extension semistable reduction and unipotent inertia. V5 uses the latter with the existing R11.3/R11.5 nodes.

Reason: For residue characteristic p, tame inertia has quotient ∏_{ℓ≠p} Z_ℓ(1); its infinite pro-ℓ quotients exclude a finite-index pro-p subgroup. Rank-one CM inertia becomes trivial after semistable extension because E⊗Q_ℓ is reduced and (ρ(σ)−1)²=0. The theorem survives; the printed step fails.

Published or author correction: new

Effect: the proof.

Independent verdict: **confirmed**, REV-ShimuraVarieties. Absolute inertia has infinite tame pro-ell quotients for ell≠p, so it has no finite-index pro-p subgroup. Semistable square-zero inertia in a reduced CM algebra supplies the recorded repair.

### ShimuraVarieties/E10 — misprint

Origin: `ShimuraVarieties/V0/E10`. Source `svi`, Final paragraph p.127, after Proposition 14.16, revised 16 September 2017 author copy.

Issue: The source attributes to (14.16) an existence proof covering every Shimura variety of abelian type.

Correction: The final full/nonconnected reconstruction uses Theorem 14.15; Proposition 14.16 supplies products and isogenies only for connected data.

Reason: The previous sentence already obtains the connected abelian-type models by 14.16. Passing from them to the full tower is exactly the equivalence in 14.15. V6/abelian-canonical explicitly imports connected-full-equivalence.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The last full-model step on SVI p.127 is the connected-to-full equivalence 14.15, whereas 14.16 handles connected products and isogenies. E24 records this again for both versions.

Duplicate of `ShimuraVarieties/E24`; retained for provenance.

### ShimuraVarieties/E11 — misprint

Origin: `ShimuraVarieties/V0/E11`. Source `svi`, Proposition 10.5 proof, p.101, E-linear representation sentence, revised 16 September 2017 author copy.

Issue: Gal(Qa/Q)

Correction: Use Gal(Qbar/K), after all E-endomorphisms are defined over K. A/K and its endomorphism action need not descend to Q.

Reason: The Tate representation of the abelian variety defined over K is of Gal(Qbar/K); its commutation with the defined E-action is what places its image in (E⊗Q_ℓ)×. There is no corresponding absolute-Q representation of that A without descent data.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The Tate module of A/K carries Gal(Qbar/K); defining its CM endomorphisms over K gives E-linearity for that subgroup, not a representation descending to Q.

### ShimuraVarieties/E12 — error

Origin: `ShimuraVarieties/V0/E12`. Source `action`, §3.10, p.252, sentence citing [16]; compare the reductive subgroup definition in §4, pp.253–254. Scoped to the public annotated 1983 author scan..

Issue: The source rules out any normal subgroup of Hα(Q) that is non-central.

Correction: The cited Platonov–Rapinchuk 1979 Theorem 1 proves perfection of the simply connected three-dimensional norm-one group when split at every finite place, not the printed simplicity claim for a full reductive group containing T. The central-adjustment proof must specify the semisimple factor and justify passage back to the marked torus. This review records that remaining proof gap rather than inventing the bridge.

Reason: In SU(4,1) over Q for Q(i)/Q with diagonal compact maximal torus, the noncompact ±α block subgroup Hα has derived SU(1,1)≅SL₂ and a positive-dimensional central torus. Its derived rational subgroup is normal, proper and noncentral, even though its semisimple factor is split at every finite place. Thus the literal assertion about this full reductive Hα is false. Independently, the primary 1979 Russian text states perfection in Theorem 1, p.279, and still calls simplicity modulo centre a conjecture on p.282. The central target is abelian, so perfection is the relevant weaker input, but the marked-torus passage is not supplied by citing it.

Published or author correction: new

Effect: the proof.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The full reductive root subgroup in the SU(4,1) example has a central torus and a proper noncentral derived normal subgroup. Platonov–Rapinchuk Theorem 1, p.279, proves perfection of the semisimple rank-one factor, and p.282 still discusses simplicity as a conjecture. Passing this input back to the marked torus remains an explicit proof gap.

### ShimuraVarieties/E13 — misprint

Origin: `ShimuraVarieties/V0/E13`. Source `action`, Introduction, p.239, first reference to Langlands [8]; public annotated author scan.

Issue: [8, pp.222–223]

Correction: Replace the page reference by [8, pp.232–233].

Reason: The public author erratum specifies the corrected Corvallis pages. This fixes source navigation, without changing a mathematical target.

Published or author correction: Public author erratum: https://www.jmilne.org/math/articles/1983a.html (Erratum section)

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The annotation on action p.239 and the public author erratum both replace the Langlands page reference with pp.232–233.

### ShimuraVarieties/E14 — misprint

Origin: `ShimuraVarieties/V0/E14`. Source `action`, Introduction, p.239, last displayed map; public annotated author scan.

Issue: G′_{A^f}.G′_{A^f}

Correction: Omit the second copy of G′_{A^f} in the displayed target.

Reason: The public author erratum removes this duplicate factor. The packet’s comparison target retains one finite-adelic group, consistently with Theorem 1.1.

Published or author correction: Public author erratum: https://www.jmilne.org/math/articles/1983a.html (Erratum section)

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The last display on action p.239 repeats the finite-adelic target factor; the public author erratum removes that repeat.

### ShimuraVarieties/E15 — misprint

Origin: `ShimuraVarieties/V0/E15`. Source `cm`, Corollary 1.5, p.6, third commutant in the statement; author PDF dated 23 May 2007.

Issue: F

Correction: The rational-endomorphism commutant is E, the full CM algebra, rather than F.

Reason: The hypotheses embed E in End⁰(A). The third paragraph of the proof bounds the commutant dimension using its prime-to-characteristic Tate realization and concludes that the commutant equals E. The printed F disagrees with that conclusion.

Published or author correction: new; the public author erratum at https://www.jmilne.org/math/articles/2007c.html records only the localized-base correction to Theorem 2.1.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. CM Corollary 1.5, p.6 prints F for the rational commutant, while the dimension argument in its proof identifies E. The planned Frobenius argument uses the corrected CM centralizer.

### ShimuraVarieties/E16 — error

Origin: `ShimuraVarieties/V8/E1`. Source `milne-mf`, Example 8.9, p.100, MF v1.31 (2017).

Issue: The source identifies A¹ as the answer to its moduli question when N = 2.

Correction: The characteristic-zero coarse ordered level-two curve is the punctured lambda-line A¹ minus {0,1}. It is not a fine moduli scheme of all such families. The Legendre family is smooth only on the punctured line. Restrict the fine comparison in this packet to N >= 3.

Reason: The discriminant is 16 lambda²(1-lambda)². The automorphism [-1] fixes E[2]; nontrivial quadratic twists have the same geometric lambda invariant and obstruct the claimed universal property over arbitrary fields.

Published or author correction: new

Effect: a stated result.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The Legendre discriminant vanishes at lambda=0,1, and generic nonsquare quadratic twists retain the ordered two-torsion while changing the field-isomorphism class. Thus MF Example 8.9 cannot give the stated unpunctured fine universal family. The course-note errata have no correction of this example.

### ShimuraVarieties/E17 — error

Origin: `ShimuraVarieties/V8/E2`. Source `milne-mf`, Lemma 8.7, p.100, with its preceding arbitrary primitive-root convention, MF v1.31 (2017).

Issue: With an arbitrary primitive Nth root fixed in the moduli condition, Lemma 8.7 uses the unchanged analytic basis (z/N,1/N).

Correction: This reference basis has one fixed Weil-pairing root zeta_ref. For zeta = zeta_ref^u replace the first generator by u z/N (u a unit modulo N), or fix zeta=zeta_ref in the statement.

Reason: The ordered lattice/reference orientation fixes the pairing; the displayed generators do not vary with the arbitrary root in the preceding definition. Bilinearity gives the corrected exponent.

Published or author correction: new

Effect: a stated result.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The reference basis in MF 8.7 has a constant Weil-pairing value on the connected half-plane. Multiplying its first generator by a unit changes that value by the corresponding exponent; an arbitrary primitive root needs that adjustment. No entry for this occurs in the course-note errata.

### ShimuraVarieties/E18 — misprint

Origin: `ShimuraVarieties/V8/E3`. Source `svi`, Proposition 6.3 proof, second paragraph, p.71, 2017 author copy.

Issue: The proof selects isomorphisms directed a: V → W, together with a′: V → W′.

Correction: Use a: W → V and a′: W′ → V, consistent with the setup on p.70; with q absorbed into a′, the comparison isomorphism W → W′ is (a′)⁻¹ a. Also use the corrected primed h′ and eta′ where specified in Jungin Lee’s errata. In the first paragraph use s′ in place of t′, the correction on p.70 line -3 in Jungin Lee’s list.

Reason: The printed directions make a h and a composed with eta ill-typed. The initial setup uses a: W → V, and the inverse expression for the comparison must have domain W.

Published or author correction: new

Effect: the proof.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The setup of SVI 6.3 gives maps W→V and Wprime→V. The proof composites require those directions and the comparison (aprime)^(-1) a. Jungin Lee corrects the adjacent primes and s/t variable, but not the two reversed arrows.

### ShimuraVarieties/E19 — misprint

Origin: `ShimuraVarieties/V8/E4`. Source `svi`, Remark 5.29(a), p.65, 2017 author copy.

Issue: The source calls the quotient morphism S_K′ → S_K immediate.

Correction: For K contained in K′ the forgetful quotient map is S_K → S_K′.

Reason: Forgetting a finer level maps the smaller subgroup quotient to the larger subgroup quotient.

Published or author correction: Jungin Lee, SV_errata.pdf, p.1: page 65 line -6.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. For K⊂Kprime the finer double quotient maps to the coarser one, so the map starts at S_K. Jungin Lee lists the same correction at SVI p.65.

### ShimuraVarieties/E20 — misprint

Origin: `ShimuraVarieties/V8/E5`. Source `svi`, The homomorphism r_x, displayed formula (60) and the final formula before Definition 12.8, p.114, 2017 author copy.

Issue: The displayed torus norm and special-point norm formulas aggregate conjugate cocharacter evaluations additively; the special-point formula indexes the embeddings by E.

Correction: Replace the aggregation signs by products in these multiplicative torus formulas. In the r_x formula the embeddings are of E(x), the field of definition of μ_x, as specified in Jungin Lee’s errata. V8 uses the corrected V4 multiplicative reciprocity norm.

Reason: The target is the multiplicative torus; an additive sum does not define the asserted torus homomorphism. V8 imports the corrected V4 reciprocity norm.

Published or author correction: Milne official xnotes errata, sums-to-products correction credited to Ruida Di, p.114; Jungin Lee SV_errata.pdf, embeddings indexed by E(x) in the r_x formula.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The norm in SVI p.114 is the product of the conjugate cocharacter values. The author xnotes index credits Ruida Di for the product signs, and Jungin Lee supplies E(x) for the embedding index.

### ShimuraVarieties/E21 — error

Origin: `ShimuraVarieties/V8/E6`. Source `deligne-1971`, 5.1.3, printed p.155, published Numdam copy (page image checked).

Issue: The assertion covers every real open U ⊂ V(R) and every field extension F of E.

Correction: Require U to be nonempty and F/E to be finite in the disjoint Hilbert-specialization assertion. These are precisely the hypotheses of its application in Theorem 5.1.

Reason: An empty real open has no specialization. Without finiteness of F the result is false: over E=Q, take the degree-two cover s²=t of V=A¹ minus {0}, U=(1,2), and F=Qbar. A rational specialization either splits or is a nontrivial quadratic field, which cannot be linearly disjoint from Qbar over Q.

Published or author correction: new

Effect: a stated result.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The actual Deligne p.155 lemma permits an empty real open and an unrestricted extension F/E. The empty-open case has no point; for s²=t over Q a field fibre cannot be disjoint from Qbar. Nonempty U and finite F/E are the hypotheses needed in its application.

### ShimuraVarieties/E22 — misprint

Origin: `ShimuraVarieties/V8/E7`. Source `deligne-1971`, Lemma 5.1.2(b), printed p.154, published Numdam copy (page image checked).

Issue: The source refers to maximal tori belonging to G_mC.

Correction: The maximal tori containing i(G_mC) are maximal tori of G_C, not of G_mC.

Reason: The centralizer and the surrounding incidence construction are in G_C; G_mC is the domain of i.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. Deligne p.154 uses the wrong ambient group for the maximal tori. The incidence space and the connected-centralizer argument require maximal tori of G_C containing the image of the cocharacter.

### ShimuraVarieties/E23 — misprint

Origin: `ShimuraVarieties/V8/E8`. Source `deligne-1971`, Hilbert specialization lemma (heading printed Lemme 5.13), p.154, and its proof p.155, published Numdam copy (page images checked).

Issue: The heading labels the result Lemme 5.13, while the proof invokes the assumptions numbered 4.12.

Correction: Read the inserted lemma as 5.1.3 (following 5.1.2), and refer in its proof to its own hypotheses, not to 4.12.

Reason: The proof base changes the immediately preceding incidence-cover hypotheses; 4.12 is not that lemma.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. Deligne pp.154–155 place the lemma after 5.1.2 and before 5.2. Its proof uses its own three preceding hypotheses; the heading 5.13 and reference to 4.12 are misnumbered.

### ShimuraVarieties/E24 — misprint

Origin: `ShimuraVarieties/V8/E9`. Source `svi`, Shimura varieties of abelian type, paragraph after Proposition 14.16, p.127, 2017 author copy; also published 2005 version, p.356.

Issue: The source attributes canonical-model existence for connected Shimura varieties of abelian type to (14.16). It then cites (14.16) again for existence in the general, possibly disconnected, abelian-type case.

Correction: The second citation should be (14.15): passing from the connected Shimura varieties Sh°(G^der, X^+) to Sh(G,X) is Theorem 14.15 (Deligne 1979, 2.7.13), not Proposition 14.16.

Reason: 14.16 concerns products and isogenies of connected Shimura data only; the statement for the non-connected Sh(G,X) of abelian type is the 'if' direction of 14.15.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. SVI 2017 p.127 and published 2005 p.356 both use 14.16 for the final full-model step. The relevant result is 14.15; neither the author xnotes errata nor Jungin Lee lists this correction.

### ShimuraVarieties/E25 — misprint

Origin: `ShimuraVarieties/V8/E10`. Source `svi`, Paragraph explaining Proposition 14.16(b), p.127 in the 2017 author copy; p.356 in the published 2005 version.

Issue: The target model of Sh°(G2,X2) is described as a quotient of the model of Sh°(G2,X2) itself by the kernel of the map between the two congruence completions.

Correction: The quotient starts from the canonical model of Sh°(G1,X1), the source of the isogeny; its quotient by that kernel is the canonical model of Sh°(G2,X2).

Reason: The setup only supplies a canonical model for the source. The first congruence completion acts on that source tower, and the kernel of its map to the second completion identifies precisely the points required for the target tower. Repeating the target index loses the source object whose quotient is being constructed.

Published or author correction: new

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. Both SVI 2017 p.127 and published 2005 p.356 repeat G2 as the model being divided out. The source completion is G1, so that model must have index 1. The target-existence statement is unchanged.

### ShimuraVarieties/E26 — misprint

Source `action`, Corollary 5.4, first line of printed p.256, public annotated 1983 author scan.

Issue: The marked torus is placed in the full domain X rather than its selected component X+ in the connected comparison.

Correction: Use the selected component X+ for the marked embedding in this connected statement.

Reason: Section 5 compares connected towers with a chosen special point. The author annotation and public erratum both give X+; V7 already retains that component.

Published or author correction: Milne author erratum, https://www.jmilne.org/math/articles/1983a.html, p.256 first line; also corrected in the annotated author scan.

Effect: nothing.

Independent verdict: **confirmed**, REV-ShimuraVarieties. The annotated p.256 and the explicit author erratum specify X+. This is a connected marked comparison; the existing V7 hypotheses already use its chosen component.

## Source editions and reading limits

Node locators distinguish printed pages from PDF page indices. Source sections below identify passages used by the targets; they are not summaries of the papers. Reading dates inherited from the accepted parts remain attributed to those parts; the current pass revisited the specific passages recorded in the handoff.

- **svi**: [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf). Revised 16 September 2017. SHA-256 `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`. Recorded access 2026-10-10.
- **cm**: [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf). Author article 2007c. SHA-256 `cec3ce6ffa0761aecf50e3b095a517ba96e4e525c545a80f9a3b39f518dc7607`. Recorded access 2026-10-10.
- **action**: [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf). Progress in Mathematics 35 (1983), pp.239–265; annotated author scan. SHA-256 `36caf35ff4759b920f26cff9f59f23b6f65ff689022522e1757462703dab2b42`. Recorded access 2026-10-10.
- **descent**: [J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf). Michigan Mathematical Journal 46 (1999); author version dated 22 September 1998. SHA-256 `9ce47be2db53ea4f97e548c47933c07f06f2cb4de37f31e836b77d241e4e34b5`. Recorded access 2026-10-10.
- **bkt**: [B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf). Author manuscript of JAMS (2020). SHA-256 `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e`. Recorded access 2026-10-10.
- **bkt-err**: [B. Bakker, B. Klingler, J. Tsimerman, Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf). Author erratum. SHA-256 `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`. Recorded access 2026-10-10.
- **aghmp**: [F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Annals of Mathematics 187 (2018), pp.391–531. SHA-256 `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`. Recorded access 2026-10-10.
- **msc**: [J. S. Milne and K.-y. Shih, Langlands’s construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf). LNM 900 (1982), pp.229–260; author scan. SHA-256 `a445a74d39559277971c090a677fc83a0b155813e802a4662765442ca8c0b700`. Recorded access 2026-10-10.
- **msd**: [J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf). LNM 900 (1982), pp.280–356; author scan. SHA-256 `c090098f609fd489a08778968eba653ecd8b67d7ad48e167381f6cc671c86b63`. Recorded access 2026-10-10.
- **semistable**: [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf). Public Darmon CM notes (2011 directory). SHA-256 `bfbad9fc883b2a6ac6e5f842abc664c2ebc84c348b9d80fa4ca6313b37e28173`. Recorded access 2026-10-10.
- **platonov**: [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf). Dokl. Akad. Nauk SSSR 247:2 (1979), pp.279–282; Russian published original hosted by the coauthor. SHA-256 `383739c32a4df0c626923f989acd050ad68f588250f823effcd450cdd72a2b50`. Recorded access 2026-10-10.
- **bb66**: [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11). Annals of Mathematics 84:3 (1966), pp.442–528; published article, OCR reproduction. Recorded access 2026-10-10.
- **upstream-aa**: [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AdelicAlgebraicGroups/README.md). TauCetiRoadmap current main at 0d144d044dacebca17b654695b6f1ad58f159b27. Recorded access 2026-10-13.
- **milne-mf**: [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf). Version 1.31, 22 March 2017. SHA-256 `977f06a4e838c43c77a7c9398c090789e60d67f64e013e1dcd9bcce0e0c27b8d`.
- **pink**: [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf). Author-typeset dissertation; numbering/pages of this copy. SHA-256 `6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669`.
- **deligne-1971**: [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf). Version of record, 1970–1971, pp.123–165. SHA-256 `054847cecac9c396e2a6f568443db180786a0c5528ec08530fd464d5474bd534`.
- **pr81**: [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ModularCurves/README.md). ModularCurves in current TauCetiRoadmap main at 0d144d044dacebca17b654695b6f1ad58f159b27.
- **kuy**: [B. Klingler, E. Ullmo, A. Yafaev, The hyperbolic Ax-Lindemann-Weierstrass conjecture](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf). Publications mathematiques de l’IHES 123 (2016), pp.333–360. SHA-256 `eed3040791f81df63004ae5b2fb4c0f9fd9b127a2df40722a574396a11690533`. Recorded access 2026-10-13.
- **upstream-rg2**: [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md). TauCetiRoadmap current main at 0d144d044dacebca17b654695b6f1ad58f159b27. Recorded access 2026-10-13.

- The publicly obtained Baily–Borel OCR is used only where legible; no convergence inequality is certified from damaged formulas.
- The original Borel metric proof was not obtained; its multivariable proof remains a source refinement.
- Connected Galois symmetry, exceptional uniformization and central adjustment remain explicit proof/supplier gaps.

Independent review, REV-ShimuraVarieties (13 October 2026): all node locators and finding locators were checked in the identified public versions, with sixteen matching PDF hashes and the stated published Baily–Borel OCR reproduction. Current upstream interfaces were read at the recorded roadmap commit. The recorded proof and supplier refinements remain open; acceptance verifies the target-level plan and does not certify those missing proofs.
