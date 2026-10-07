# Étale duality, cycle classes and perverse sheaves

This roadmap develops scheme-theoretic étale duality into the tools needed for Lefschetz arguments, intersection cohomology and cohomological correspondences. Starting from the small étale site and the existing derived-category machinery, it constructs the exceptional inverse image, normalizes trace and purity, and specifies the resulting Poincaré pairings, supported cycle classes and Gysin maps. The continuation gives weak Lefschetz, projective-bundle and blow-up cohomology, the early perverse category, coefficient comparisons, rational geometric decomposition and the Lefschetz–Verdier trace formalism.

The plan consists of 112 nodes in two packets: [EDC.0–EDC.3](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json) and [EDC.4–EDC.8](../packets/EtaleDualityAndPerverseSheaves--EDC.4.json). Those packets specify the identifiers, prerequisites and source witnesses used below. The [suggested Lean file](../suggested/EtaleDualityAndPerverseSheaves.lean) proposes names and signatures. Every declaration remains `implementationStatus: unchecked`; nothing here is claimed to be formalised. A proof plan describes work to carry out, and a recorded proof gate is an obligation, even when the target is a published theorem. The packets have open supplier requests and proof/signature gaps, so this is not a closed blueprint.

## Scope and boundaries

The basic objects are schemes. For relative six-operation statements, compactifiable means that the morphism has the required open-immersion/proper factorization over the stated base. In the usual setting this comes from a separated finite-type morphism over a quasi-compact quasi-separated base. Separated and locally of finite type alone do not give that compactification. Constructible statements retain the finite-type, coefficient and base hypotheses of their nodes; the abstract t-structure material in EDC.5 is more general.

Ownership follows the [RS-17](../restructure/RS-17.result.json) and [RS-19](../restructure/RS-19.result.json) contracts and the neighbouring interfaces recorded in [the link maps](../links/). EDC owns the exceptional inverse image and its duality, trace and purity normalizations; supported étale fundamental classes and the cycle-class compatibility targets; general weak Lefschetz and smooth-centre blow-up cohomology; constructible middle perversity and IC; transport of these operations through independently owned comparisons; perverse geometric decomposition and relative hard Lefschetz; and general cohomological correspondence/trace classes. It imports the following work.

| Supplier | Imported interface and boundary |
|---|---|
| CohomologicalPointCounting, through `SchemeAndStackFoundations:SF.2` | Constructible sheaves, Kummer theory, pullback and derived direct image, the finite-level compact-support functor, base change, cohomological dimension, finiteness, ℓ-adic realization and Artin comparison. EDC.0 lifts the existing compact-support functor to the enhancement. EDC.8 builds the general correspondence formalism on the existing ordinary Frobenius point-counting theorem. |
| `SchemeAndStackFoundations:SF.0`, `SF.5` | Projective bundles, blow-up and ample-divisor geometry, universal complete-intersection families; Chow groups, rational equivalence, intersection products and deformation to the normal cone. EDC plans their étale classes and compatibility proofs. |
| `EnhancedDerivedSheaves:E0–E4` | Enhanced derived categories, replacements, derived tensor/internal Hom, adjoints, mates and coherent diagrams, and coefficient-system reconstruction on a replete topos. The reconstruction theorem alone supplies neither constructibility nor the constructible six operations. |
| [JacobianChallenge](../../../content/tau-ceti/JacobianChallenge/README.md), Layers A and D; `AbelianSchemesAndArithmeticModuli:A3` | Picard groups and degree, the Jacobian, and its perfect Weil pairing. The independent curve duality proof uses these inputs before general étale biduality. |
| `DeligneWeightsAndPurity:DWP.8`, `DWP.9` | Mixedness, directional weight estimates and absolute hard Lefschetz. EDC.7 develops their perverse relative consequences with a chosen ample class; it does not prove a second absolute hard Lefschetz theorem. |
| `AdicCoefficientsAndComparisons:L2–L6`; `ClassicalAdicEtaleCohomology:H5` | The scheme/diamond comparison functors and their exact operation identities; the proper and nonarchimedean scheme/adic comparisons. EDC.6 specifies what they transport. Full faithfulness does not imply exceptional-pullback or internal-Hom preservation of the essential image. |
| [AdicSpaces](../../../content/tau-ceti/AdicSpaces/README.md) and the adic/diamond roadmaps | The analytic spaces and diamond carriers used in those comparisons. This roadmap adds no alternative adic-space or diamond foundation. |
| `LefschetzPencilsAndVanishingCycles` | Pencil incidence geometry, nearby cycles over a trait and their t-exactness, Picard–Lefschetz and the enlarged nonconstructible support criterion. EDC.4 supplies the cohomology of the axis blow-up; EDC.5 supplies early constructible perversity. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `ET.5` | The Hitchin-specific support theorem and the stronger contracting-boundary/Fujiwara trace application. They verify their own geometric and coefficient hypotheses when importing EDC.7–EDC.8. |
| `WeilConjectures:WC.2` and geometric Langlands consumers | The zeta functional equation, Satake/fusion constructions, shtuka and Igusa applications. EDC.8 exports the actual graded pairing, reciprocal polynomials and determinant sign, without defining a second zeta function. |

Artin and Deligne–Mumford stacks require smooth descent and stack-specific six operations. Perfect algebraic spaces require finite-type-model transport and its independence, including orientation. Both are proposed as Part II roadmaps, with the consumers and source items recorded below and in the [assembly handoff](../handoff/ASM-EtaleDualityAndPerverseSheaves.md). A stack theorem cited by a consumer is not a scheme-to-stack comparison. Witt-Grassmannian IC stalk parity belongs to GeometricSatakeAndFusion. Scheme-level relative perversity and ULA over a curve, nearby cycles over general bases, absolute purity for regular pairs over a trait, and the Grothendieck–Ogg–Shafarevich formula retain their explicit ownership gaps/proposals.

## Conventions and existing library

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [reviewed library audit](../../../data/library-coverage.json), AUDIT-18, records the EDC target layers as not built. This does not make their foundations new. The 49 distinct baseline declarations in the packets include the small étale site, geometric points and their conservative fibre functors, the unbounded derived category and canonical t-structure, Ext and sheaf cohomology, the scheme morphism classes, algebraic cycles and their pushforward, Baer's criterion, perfect pairings, and the relevant linear algebra. Mathlib's `TStructure.heart` supplies the heart as an object property; `AbelianSubcategory.abelian` supplies an abelian-category criterion. Showing the heart satisfies that criterion is the new EDC.5 argument.

Write Sh(X_ét, Λ) for sheaves of Λ-modules on the small étale site, D(X, Λ) for their unbounded derived category, D^b_c(X, Λ) for bounded complexes with constructible cohomology, and D_ctf(X, Λ) for constructible complexes with a uniform finite Tor-amplitude bound. Constructibility requires a finite stratification with locally constant finitely generated cohomology on strata; finite stalks alone are insufficient. A geometric point x̄ is a morphism Spec Ω → X with Ω separably closed. Geometric stalks detect zero objects and isomorphisms; global sections generally do not. The suggested file shares the `EtaleSheaf`, `EtaleDerived` and `GeometricPoint` carriers across both parts. Its restricted operation data are under `TauCeti.EtaleDuality.Dbc`, while the ambient derived operations retain `TauCeti.EtaleDuality` names.

Cohomological shifts satisfy ℋ^i(K[r]) = ℋ^{i+r}(K). Thus a sheaf L[d] has its ordinary cohomology in degree −d. The coefficient and duality distinctions are:

| Coefficients | Required interpretation |
|---|---|
| Λ killed by an invertible integer n | The finite-level torsion formalism. Each node states its further noetherian, constructible or finite-Tor hypotheses. The quasi-finite flat sheaf trace itself needs no torsion hypothesis. |
| Λ = O/π^m, m ≥ 1, O a DVR | Λ is self-injective, so finitely generated stalk modules have an ordinary exact dual and biduality. The example ℤ/ℓ over ℤ/ℓ² is nonprojective and still has this duality. General coefficient rings require the stated derived/Tor restrictions. |
| O_E, E/ℚ_ℓ finite, uniformizer λ | Integral duality is derived. Its Ext¹ terms and cohomological torsion survive. A lisse integral local system used in the finite-free arguments is locally finite free. |
| E or ℚ̄_ℓ | Rational degreewise pairings are perfect on finite-dimensional geometric cohomology. Decomposition and geometric semisimplicity use characteristic-zero coefficients. Eigenvalue multisets are not conclusions for arbitrary ℤ/ℓ^m-modules. |

Λ(1) is the Kummer twist, Λ(r) its tensor powers, and K(r) = K ⊗^L Λ(r). On a scheme over 𝔽_q, geometric Frobenius acts on Λ(1) by q⁻¹ and on Λ(−d) by q^d; arithmetic Frobenius is its inverse. For a smooth geometrically connected variety of dimension d, the trace has target H^{2d}_c(X̄, Λ(d)) → Λ. Accordingly the untwisted Poincaré pairing is a similitude of multiplier q^d. Degree, Gysin shifts and twists are explicit throughout. Odd middle-degree graded commutativity alone proves alternation when 2 is invertible; curve alternation for all n comes separately from the Weil pairing.

For a : X → Spec k, K_X = a^!Λ and D_XK = RHom(K, K_X). Relative duality lives in D(k_ét, Λ); geometric duality is applied to X ⊗ k_s. Neither is automatically an absolute duality theorem for RΓ(X, −) over an arithmetic field. In particular Spec 𝔽_q has cohomology in degrees 0 and 1, whereas its ordinary derived coefficient dual has degrees 0 and −1. Geometric finiteness assertions are restricted to the separably closed setting or to explicit arithmetic finiteness hypotheses.

Use P(E) = Proj Sym(E^∨), parametrizing lines in E, with tautological O(−1). For ξ = c₁(O(1)), the Chern relation is Σ_r π^*c_r(E)ξ^{rank E−r} = 0. For a line bundle L this says ξ + c₁(L) = 0. This convention fixes the exceptional-divisor signs in EDC.4. Cycle classes built through a dense smooth locus are stated over a perfect field; their descent to Chow groups and Tor-intersection compatibility remain separate proof gates.

Middle perversity uses dim(x) = dim closure{x}: stalks vanish in degrees i > −dim(x), and costalks in i < −dim(x). IC_X(L) = j_!*(L[d]) on an irreducible d-dimensional X, with L a local system on a dense smooth open. No half Tate twist is implicit, and dense-open independence is only asserted for this local-system input. A constant sheaf on a curve has perverse degree +1. Arbitrary closed immersions have one-sided exactness, without a general amplitude-one bound.

Weights use the shifted convention: K of weights ≤ w has ℋ^i(K) of weights ≤ w+i, and Tate twist (r) subtracts 2r. Rational pure objects split geometrically, with a simultaneous finite direct sum; arithmetic and Frobenius semisimplicity are not inferred. Relative hard Lefschetz requires a projective morphism and a chosen relatively ample class η; its two twisted sides have weight w−i.

For a correspondence C → X × Y, use the labelled legs ←c : C → X and →c : C → Y and a morphism u : ←c^*L → →c^!M. This is Varshavsky's c₁^*L → c₂^!M, adjoint to c_{2!}c₁^*L → M. The original stage formula c₂^*K → c₁^!K names the legs oppositely. All restriction, composition and pushforward contracts below use the labelled-leg convention. A proper map of supports is part of the data. Local-term integration requires a proper fixed component; scheme automorphism order is stronger than order of its underlying topological map.

## Sources and development order

The source spine is Deligne's SGA 4 XVII–XVIII for compact supports, traces and duality, Milne's *Lectures on Étale Cohomology* for the geometric calculations, BBD for t-structures and perverse sheaves, and Weil I/II for equivariance, Lefschetz and weights. Bhatt–Scholze supplies pro-étale coefficient comparisons; Scholze's ECD §27 and Huber supply the independently owned analytic/diamond comparisons. Varshavsky and Lu–Zheng give the correspondence formalism. The final bibliography retains source editions and part-specific locators, including the motivating papers. SGA 4½ cycle/duality/finiteness, SGA 7 II XVIII and SGA 5 III are not silently treated as publicly checked alternatives: where the accessible replacement does not prove the requested step, a gap remains.

The first part develops EDC.0 → EDC.1:adjoint → EDC.2:trace-purity → EDC.1:biduality → EDC.2:pairings → EDC.3. EDC.1 and EDC.2 are collector stages. The independent Jacobian/Kummer curve calculation precedes general purity and biduality. Constructible biduality must prove its boundary induction without importing the reverse exchange that depends on it. The displayed purity proof route also retains the obligation to identify its stalkwise isomorphism with the chosen trace-adjoint map.

The second part starts with EDC.4 and EDC.5 using precise first-part node identifiers. EDC.6's classical coefficient-category construction precedes rational/integral instances used elsewhere in the second part; its perverse coefficient-extension adapter then consumes EDC.5. Thus the section order is not a claim that every theorem in a layer precedes every theorem in the next layer. EDC.7 consumes the perverse/category interfaces and the DWP weight and absolute Lefschetz nodes. EDC.8 consumes the duality, Gysin and pairing interfaces. The union has 358 internal prerequisite edges, including 80 across the part boundary, and is acyclic.

| Layer | Interface | Principal boundary |
|---|---|---|
| EDC.0 | Coefficients, stalks, supports, enhancement | Imports finite-level Rf_!; enhancement coherence is an obligation. |
| EDC.1:adjoint | f^!, pseudofunctoriality, dualizing complex, formal exchange | Constructed before purity. |
| EDC.2:trace-purity | Weighted finite-flat and curve traces, effacement, smooth purity | Smooth purity; trait absolute purity is outside the scope. |
| EDC.1:biduality | Constructible biduality, recollement, relative/geometric duality | Self-injective finite coefficients; regular-base and noncircular induction gates. |
| EDC.2:pairings | Cup-product trace pairing, Frobenius, integral/rational forms | Derived integral torsion retained. |
| EDC.3 | Supported classes, Gysin, Chern and cycle classes | Perfect-field singular cycles; Chow descent and specialization gates. |
| EDC.4 | Weak Lefschetz, projective bundles, blow-ups | No division by a degree that is a nonunit in the coefficient ring. |
| EDC.5 | Abstract recollement, middle perversity, j_!*, IC | Finite-type constructible scope; integral p/p⁺ distinguished. |
| EDC.6 | Classical/pro-étale, analytic and diamond transport | Rational analytic stable-lattice image; Rc_* recovery distinguished from stronger c^* transport. |
| EDC.7 | Pure IC, geometric decomposition, relative hard Lefschetz | Characteristic-zero coefficients; projectivity and chosen η; specialization gates. |
| EDC.8 | Correspondences, local terms, reciprocal polynomials | Proper integration and actual morphism coherence; no Frobenius semisimplicity assumption. |

## Part I — coefficients, duality, trace and classes

### EDC.0 — Coefficient, support and enhancement interfaces

Fix the derived coefficient categories and their geometric stalks before defining duality. Import the existing compact-support functor and prove the amplitude/colimit properties that make the enhanced adjoint construction possible. The enhanced lift must descend from a genuine complex-level model and compare with the K-injective presentation; termwise Godement replacement alone is not a K-injectivity argument. Cohomology with supports retains the closed immersion and its open complement as part of the localization data.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.0-etale-derived-category"></a>

#### The étale derived category D(X, Λ) and its geometric stalks ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; definition. Planet: “Étale derived category D(X, Λ)”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/DerivedCategory`; namespace: `TauCeti.EtaleDuality`.

Let X be a scheme and Λ a commutative ring. The étale derived category is D(X, Λ) := the unbounded derived category of the Grothendieck abelian category Sh(X_ét, Λ) of sheaves of Λ-modules on Mathlib's small étale site X.smallEtaleTopology. Its full subcategories D⁺, D⁻, D^b are cut out by the canonical t-structure (cohomology sheaves ℋ^q K). For a geometric point x̄ : Spec Ω → X (Ω separably closed) the geometric stalk K ↦ K_x̄ : D(X, Λ) → D(Λ) is the derived functor of the exact fibre functor of the point pointSmallEtale x̄. Global cohomology is H^q(X, K) := Hom_{D(X,Λ)}(Λ_X, K[q]) and RΓ(X, −) is the right derived functor of global sections. When Λ is torsion with nΛ = 0, n invertible on X, D(X, Λ) is the finite-level coefficient category of SGA 4 XVII–XVIII written D(X, Λ) there; this node fixes the notation every node of this packet uses and adds no new category.

**Hypotheses.** X any scheme for the definition; quasi-compact quasi-separated wherever a compactifiable morphism or Rf_! appears. Λ a commutative ring; for the duality statements Λ is torsion with nΛ = 0 for an integer n invertible on X (SGA 4 XVIII 1.1.1). The site is Mathlib's small étale site; the big étale site is never used for coefficients.

**Construction and proof plan.**

1. Take the abelian category Sheaf X.smallEtaleTopology (ModuleCat Λ); it is Grothendieck abelian by Mathlib's isGrothendieckAbelian_sheaf_smallEtaleTopology, so it has enough injectives and K-injective resolutions (EnhancedDerivedSheaves E1).
2. Form Mathlib's DerivedCategory of it (HasDerivedCategory.standard); D⁺, D⁻, D^b are the usual subcategories for the canonical t-structure.
3. The fibre functor of pointSmallEtale x̄ is exact on abelian sheaves (filtered colimit over étale neighbourhoods), so Functor.mapDerivedCategory gives the triangulated stalk functor; conservativity of the family of geometric stalks follows from isConservativeFamilyOfPoints_pointSmallEtale' and exactness (a complex is acyclic iff all its stalks are).
4. H^q(X, F) for a sheaf F agrees with Ext^q(Λ_X, F), which for Λ = ℤ is Mathlib's Sheaf.H.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`; `mathlib:AlgebraicGeometry.Scheme.Etale`; `mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`; `mathlib:DerivedCategory`; `mathlib:HasDerivedCategory.standard`; `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`; `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`; `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`; `mathlib:CategoryTheory.Functor.mapDerivedCategory`; `mathlib:DerivedCategory.TStructure.t`; `mathlib:CategoryTheory.Sheaf.H`; `mathlib:DerivedCategory.singleFunctor`; `mathlib:DerivedCategory.homologyFunctor`; `mathlib:CategoryTheory.constantSheaf`; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Uses that determine the API.**

- SGA 4 XVIII 3.1.4 and 3.2.5: the source and target categories D(X, f^*𝒜) and D(S, 𝒜) of Rf_! and Rf^!
- EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image: the categories between which f^! is the right adjoint of Rf_!
- LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.0): bounded complexes, hypercohomology and conservative geometric stalks
- DeligneWeightsAndPurity:DWP.7 (request to EDC.0): the derived category D^b_c(X, ℚ̄_ℓ) is built from these finite-level categories by EDC.6 and EllAdicRealization

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.EtaleSheaf` | data | EtaleSheaf Λ X := Sheaf X.smallEtaleTopology (ModuleCat Λ), the abelian category of étale sheaves of Λ-modules. |
| `TauCeti.EtaleDuality.EtaleDerived` | data | EtaleDerived Λ X := DerivedCategory (EtaleSheaf Λ X), pretriangulated, with shift [1]. |
| `TauCeti.EtaleDuality.EtaleDerived.constant` | constructor | Λ_X ∈ D(X, Λ): the constant sheaf Λ placed in degree 0. |
| `TauCeti.EtaleDuality.EtaleDerived.stalk` | projection | For a geometric point x̄ : Spec Ω → X, the triangulated functor K ↦ K_x̄ : D(X, Λ) → D(Λ) induced by the exact fibre functor of pointSmallEtale x̄. |
| `TauCeti.EtaleDuality.EtaleDerived.isIso_iff_stalk` | characterisation | A morphism u in D(X, Λ) is an isomorphism iff u_x̄ is an isomorphism for every geometric point x̄; an object is zero iff all its stalks are zero. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology` | projection | H^q(X, K) := Hom(Λ_X, K[q]), an abelian group (its Λ-module structure is that of cohomologyModule), functorial in K and contravariant in X; long exact sequences for distinguished triangles. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology_sheaf` | compatibility | For a sheaf F placed in degree 0, H^q(X, F) ≅ Ext^q(Λ_X, F), equal to Mathlib's Sheaf.H when Λ = ℤ. |
| `TauCeti.EtaleDuality.EtaleDerived.equivModuleOfSepClosed` | equivalence | For X = Spec Ω with Ω separably closed, global sections give an equivalence D(X, Λ) ≃ D(Λ) compatible with shifts. |
| `TauCeti.EtaleDuality.GeometricPoint` | data | A geometric point of X: a separably closed field Ω with a morphism Spec Ω → X. |
| `TauCeti.EtaleDuality.globalSections` | projection | Γ(X, −) : EtaleSheaf Λ X ⥤ Mod_Λ, evaluation at the terminal étale X-scheme X → X. |
| `TauCeti.EtaleDuality.cohomologyModule` | projection | H^q(X, K) as a Λ-module: the q-th cohomology of RΓ(X, K) ∈ D(Λ). |
| `TauCeti.EtaleDuality.compactCohomologyModule` | projection | H^q_c(X, K) as a Λ-module for X separated of finite type over a separably closed field: cohomology of RΓ(Ra_!K). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.etaleDerived_isZero_of_isEmpty` | degenerate | If X is empty then every object of D(X, Λ) is zero. |
| `TauCeti.EtaleDuality.etaleDerived_spec_sepClosed` | compatibility | For Ω separably closed, D(Spec Ω, Λ) is equivalent to D(Λ) by global sections, and H^q(Spec Ω, F) = 0 for q > 0. |
| `TauCeti.EtaleDuality.etaleDerived_stalk_conservative` | characterisation | A complex K with K_x̄ ≅ 0 for every geometric point x̄ of X is zero in D(X, Λ). |
| `TauCeti.EtaleDuality.etaleDerived_globalSections_not_conservative` | non-example | Over Spec 𝔽₂ with Λ = ℤ/3, the rank-one character sending arithmetic Frobenius to −1 gives a nonzero sheaf with H⁰ = 0 (−1−1 is a unit in ℤ/3). Global sections do not detect zero objects. |

**Acceptance examples.**

- X = Spec Ω with Ω separably closed: global sections is an exact equivalence Sh(X_ét, Λ) ≃ Mod_Λ, so D(X, Λ) ≃ D(Λ).
- Agreement with EnhancedDerivedSheaves E1: the homotopy category of the enhancement is this D(X, Λ).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.1, p. 484-485. The finite-level coefficient category D(X, 𝒜) of étale sheaves of modules over a ring killed by n invertible on X; this node names it on Mathlib's site.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.1 (tag 0G2C). The unbounded category D(X_étale, Λ) on which the adjoint is constructed.

<a id="node-EDC.0-constructible-ctf-complexes"></a>

#### Constructible complexes D^b_c(X, Λ) and complexes of finite Tor-dimension D_ctf(X, Λ) ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`; definition. Planet: “Constructible complexes D^b_c(X, Λ)”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Constructible`; namespace: `TauCeti.EtaleDuality`.

Let X be a noetherian scheme (in practice separated of finite type over a field or over a regular base of dimension ≤ 1) and Λ a noetherian torsion ring with nΛ = 0, n invertible on X. A complex K ∈ D(X, Λ) is constructible, K ∈ D^b_c(X, Λ), when it is bounded and every cohomology sheaf ℋ^q K is a constructible sheaf of Λ-modules in the sense imported from ConstructibleEtale (there is a finite partition of X into locally closed constructible subschemes on each of which the sheaf is locally constant with finitely generated stalks). K is of finite Tor-dimension, K ∈ D_ctf(X, Λ), when moreover there is an a such that K ⊗^L_Λ M has ℋ^q = 0 for q < a for every Λ-module M (equivalently K is locally quasi-isomorphic to a bounded complex of flat constructible sheaves). D_ctf ⊂ D^b_c ⊂ D^b are full triangulated subcategories, constructibility requires the finite stratification just specified; finite Tor-amplitude is checked on geometric stalks with a common bound. Finite stalks alone do not imply constructibility.

Open obligations: [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** Λ noetherian, torsion, with nΛ = 0 and n invertible on X. The notion of constructible sheaf is ConstructibleEtale's (imported through SchemeAndStackFoundations SF.2); this node only names the derived subcategories and their closure properties. Finite Tor-dimension is a separate condition: for Λ = ℤ/ℓ², the constructible sheaf (ℤ/ℓ)_X is in D^b_c but not in D_ctf.

**Construction and proof plan.**

1. Constructibility of each ℋ^q is stable under extensions, kernels and cokernels of constructible sheaves (imported), so the long exact cohomology sequence makes D^b_c a triangulated subcategory closed under shifts and direct summands.
2. Finite Tor-dimension is tested stalkwise because the geometric stalks are exact and conservative (EDC.0/etale-derived-category) and commute with ⊗^L (EDC.0/derived-tensor-and-internal-hom).
3. Stability: f^* preserves both (exact on stalks); ⊗^L preserves D_ctf and sends D_ctf × D^b_c to D^b_c; Rf_! preserves both for f separated of finite type (imported finiteness and SGA 4 XVII 5.2.10 for Tor-dimension); Rf_* preserves D^b_c for f of finite type over a field or a regular base of dimension ≤ 1 (imported finiteness theorem of SGA 4½ [Th. finitude]).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 3.2.6: Poincaré duality is stated for locally constant constructible coefficients
- EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality: the category on which D_X is an anti-equivalence
- DeligneWeightsAndPurity:DWP.7 (request to EDC.0): D^b_c with Rf_*, Rf_! and the long exact sequences, for mixed complexes
- EtaleDualityAndPerverseSheaves:EDC.5: the perverse t-structure lives on D^b_c over a coefficient field

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.IsConstructibleComplex` | data | IsConstructibleComplex K : Prop, K bounded with every ℋ^q K constructible (imported sheaf notion). |
| `TauCeti.EtaleDuality.IsCtf` | data | IsCtf K : Prop, K constructible and of finite Tor-dimension over Λ. |
| `TauCeti.EtaleDuality.isConstructibleComplex_shift` | structure | IsConstructibleComplex K ↔ IsConstructibleComplex (K[1]); likewise for IsCtf. |
| `TauCeti.EtaleDuality.isConstructibleComplex_of_triangle` | structure | In a distinguished triangle K → L → M → K[1], two constructible vertices force the third. |
| `TauCeti.EtaleDuality.isConstructibleComplex_iff_stalk` | characterisation | For X of finite type over a field, K ∈ D^b_c iff K is bounded and there is a finite stratification on whose strata the ℋ^q K are locally constant with finitely generated stalks. |
| `TauCeti.EtaleDuality.IsCtf.tensor` | structure | IsCtf K → IsCtf L → IsCtf (K ⊗^L L), and IsCtf K → IsConstructibleComplex L → IsConstructibleComplex (K ⊗^L L). |
| `TauCeti.EtaleDuality.IsConstructibleComplex.pullback` | functoriality | f^* preserves D^b_c and D_ctf for any morphism f. |
| `TauCeti.EtaleDuality.IsConstructibleComplex.lowerShriek` | functoriality | For f separated of finite type, Rf_! preserves D^b_c and D_ctf (imported finiteness; SGA 4 XVII 5.2.10). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.isCtf_constant` | computation | For Λ = ℤ/ℓⁿ and X of finite type over a field with ℓ invertible, the constant sheaf Λ_X is in D_ctf(X, Λ). |
| `TauCeti.EtaleDuality.not_isCtf_reduction` | non-example | For ℓ prime, Λ = ℤ/ℓ² and nonempty X with ℓ invertible, (ℤ/ℓ)_X is constructible but not of finite Tor-dimension: its derived tensor with ℤ/ℓ has nonzero cohomology in every degree ≤ 0 at each geometric point. |
| `TauCeti.EtaleDuality.not_isConstructible_infinite_skyscrapers` | non-example | Assume Λ ≠ 0. On A¹ over an algebraically closed field, ⊕_{a ∈ ℕ} (i_a)_*Λ over infinitely many distinct closed points is not constructible. |
| `TauCeti.EtaleDuality.isConstructible_zero` | degenerate | The zero complex is in D_ctf, and on empty X every complex is. |

**Acceptance examples.**

- Over Spec Ω (Ω separably closed), D^b_c is the category of bounded complexes with finitely generated total cohomology, and D_ctf is the category of perfect complexes of Λ-modules.
- The constant sheaf Λ_X is in D_ctf; a direct sum of skyscraper sheaves at infinitely many closed points of A¹ is not in D^b_c.

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), 5.2.10, p. 359. Finite Tor-dimension is preserved by Rf_!; the D_ctf subcategory is the one SGA 4 uses for coefficients.

<a id="node-EDC.0-tate-twist"></a>

#### Tate twists Λ(i) and K(i), with the Frobenius convention ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; construction. Planet: “Tate twist”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/TateTwist`; namespace: `TauCeti.EtaleDuality`.

Let X be a scheme, n ≥ 1 an integer invertible on X and Λ a ring with nΛ = 0. The Tate-twist sheaf is Λ(1) := μ_n ⊗_{ℤ/n} Λ, where μ_n is the étale sheaf U ↦ μ_n(Γ(U, O_U)) (locally free of rank one over ℤ/n); Λ(i) := Λ(1)^{⊗i} for i ≥ 0 and Λ(i) := Hom(Λ(−i), Λ) for i < 0. For K ∈ D(X, Λ), K(i) := K ⊗_Λ Λ(i), an exact autoequivalence. The construction does not depend on n: for n = dn′ the d-th power map gives μ_n ⊗ ℤ/n′ ≅ μ_{n′} (SGA 4 XVIII 1.1.1.2). For X over 𝔽_q, the geometric Frobenius acts on Λ(1)_x̄ by q⁻¹ (arithmetic Frobenius ζ ↦ ζ^q is its inverse), so it acts on Λ(−d) by q^d.

**Hypotheses.** n invertible on X and nΛ = 0; for torsion Λ of order prime to the residue characteristics, twists are defined as colimits over n (SGA 4 XVIII 1.1.1.4). The sheaf μ_n and its exactness properties (Kummer sequence) are imported from ConstructibleEtale through SchemeAndStackFoundations SF.2.

**Construction and proof plan.**

1. Λ(1) is locally free of rank one over Λ, so −⊗_Λ Λ(i) is exact and needs no derivation; Λ(i) ⊗ Λ(j) ≅ Λ(i + j) canonically.
2. f^*(Λ(1)_S) ≅ Λ(1)_X because μ_n is defined by the same formula on every scheme; hence f^*(K(i)) ≅ (f^*K)(i), and by the projection formula Rf_*, Rf_! commute with twists.
3. Over a separably closed field a primitive n-th root of unity gives an isomorphism Λ(1) ≅ Λ, not canonical; over 𝔽_q the Galois action is the cyclotomic character.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); `mathlib:rootsOfUnity`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 2.9: the trace R^{2d}f_!f^*F(d) → F has a twist d
- SGA 4 XVIII 3.2.5: smooth purity f^! = f^*(d)[2d]
- DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters: Λ(1) with geometric Frobenius acting by q⁻¹ (request to EDC.0)
- EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map: cycle classes live in H^{2r}(X, Λ(r))

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.tateTwistSheaf` | data | Λ(1) ∈ EtaleSheaf Λ X, the sheaf μ_n ⊗ Λ, locally free of rank one. |
| `TauCeti.EtaleDuality.tateTwist` | constructor | tateTwist i : D(X, Λ) ⥤ D(X, Λ), K ↦ K(i), an exact autoequivalence. |
| `TauCeti.EtaleDuality.tateTwistZeroIso` | simp | K(0) ≅ K naturally. |
| `TauCeti.EtaleDuality.tateTwistAddIso` | relation | K(i)(j) ≅ K(i + j) naturally, associative and unital. |
| `TauCeti.EtaleDuality.tateTwist_pullback` | functoriality | f^*(K(i)) ≅ (f^*K)(i), and Rf_*(K(i)) ≅ (Rf_*K)(i), Rf_!(K(i)) ≅ (Rf_!K)(i). |
| `TauCeti.EtaleDuality.tateTwist_shift` | compatibility | (K[m])(i) ≅ (K(i))[m] compatibly with the triangulated structure. |
| `TauCeti.EtaleDuality.tateTwistSheaf_iso_of_sepClosed` | example | Over Spec Ω with Ω separably closed, a primitive n-th root of unity in Ω gives Λ(1) ≅ Λ. |
| `TauCeti.EtaleDuality.tateTwist_geomFrobenius` | characterisation | Over 𝔽_q, geometric Frobenius acts on the stalk Λ(i)_x̄ by q^{-i}. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.tateTwist_sepClosed_trivial` | computation | Over Spec Ω with Ω separably closed of characteristic prime to n, Λ(1) ≅ Λ as sheaves. |
| `TauCeti.EtaleDuality.tateTwist_zero` | degenerate | Λ(0) = Λ and K(0) ≅ K. |
| `TauCeti.EtaleDuality.not_tateTwist_trivial_F2` | non-example | Over Spec 𝔽_2 with n = 3 and Λ = ℤ/3, Λ(1) is not isomorphic to Λ: Frobenius acts on μ_3(𝔽̄_2) by ζ ↦ ζ², which is not the identity. |
| `TauCeti.EtaleDuality.tateTwist_frobenius_eigenvalue` | characterisation | Over 𝔽_q, geometric Frobenius acts on Λ(−1) by multiplication by q and on Λ(1) by q⁻¹. |

**Acceptance examples.**

- The Frobenius convention: over 𝔽_q, Λ(−1) has geometric Frobenius eigenvalue q; this is the convention of DeligneWeightsAndPurity and WeilConjectures.
- Independence of n via (1.1.1.2), checked on the diagram (1.1.3.5) of Kummer sequences.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.1, (1.1.1.1)-(1.1.1.3), p. 484. Definition of the twists Z/n(i) and F(i) = F ⊗ Z/n(i).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16, p. 108. The same twist, defined by sections over affine étale U.

<a id="node-EDC.0-derived-tensor-and-internal-hom"></a>

#### Derived tensor product and internal Hom on D(X, Λ)

Node `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`; comparison. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

For X a scheme and Λ a commutative ring, the derived tensor product ⊗^L_Λ and the derived internal Hom RHom_Λ on D(X, Λ) constructed by EnhancedDerivedSheaves E1 (K-flat and K-injective replacements on the ringed site (X_ét, Λ)) satisfy: (i) Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M)) naturally, so ⊗^L ⊣ RHom; (ii) (K ⊗^L L)_x̄ ≅ K_x̄ ⊗^L_Λ L_x̄ for every geometric point; (iii) f^*(K ⊗^L L) ≅ f^*K ⊗^L f^*L and Hom(f^*K, M) ≅ Hom(K, Rf_*M); (iv) RHom(Λ_X, K) ≅ K and RΓ(X, RHom(K, L)) ≅ RHom_X(K, L), whose H^0 is Hom_{D(X,Λ)}(K, L). For a closed immersion i, i^* preserves ⊗^L, and for an étale j, j^* preserves RHom.

**Hypotheses.** Unbounded complexes are allowed: the replacements are the unbounded K-flat/K-injective ones of EnhancedDerivedSheaves E1, not bounded-below injective resolutions. No constructibility is needed for (i)-(iv).

**Construction and proof plan.**

1. Import the bifunctors and the adjunction from EnhancedDerivedSheaves E1 for the site X_ét with constant ring Λ.
2. The stalk formula holds because geometric stalks are exact, commute with tensor products and send K-flat complexes to K-flat complexes of Λ-modules.
3. Pullback is exact and monoidal on sheaves and preserves K-flatness, which gives (iii); the Leray identity RΓ(X, −) ∘ RHom = RHom_X is the global sections of (i) (Stacks Cohomology on Sites, Lemmas 19.1 and 35.2, the two equalities used in the proof of More Étale 11.5).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`; `mathlib:CategoryTheory.Adjunction`.

**Acceptance examples.**

- For X = Spec Ω with Ω separably closed these are the usual ⊗^L_Λ and RHom_Λ on D(Λ).
- RHom(Λ_X, K) ≅ K and Λ_X is a unit for ⊗^L.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.5 (tag 0GLC), proof. The pullback/pushforward and tensor/RHom adjunctions on the unbounded étale derived category, used as the formal input to the sheafified adjunction.

<a id="node-EDC.0-cohomology-with-supports"></a>

#### Cohomology with supports and the localization triangle ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`; construction. Planet: “Cohomology with supports”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Supports`; namespace: `TauCeti.EtaleDuality`.

Let i : Z → X be a closed immersion with open complement j : U → X, and Λ a ring. On sheaves, i^!F := i^{-1}(ker(F → j_*j^*F)) is the sheaf of sections of F supported on Z; it is right adjoint to the exact functor i_*, so its right derived functor Ri^! : D(X, Λ) → D(Z, Λ) is right adjoint to i_* on derived categories. The cohomology of X with supports in Z is RΓ_Z(X, K) := RΓ(Z, Ri^!K), with groups H^q_Z(X, K). There is a distinguished triangle i_*Ri^!K → K → Rj_*j^*K → (i_*Ri^!K)[1], hence RΓ_Z(X, K) ≅ fibre(RΓ(X, K) → RΓ(U, j^*K)) and the long exact sequence of the pair … → H^q_Z(X, K) → H^q(X, K) → H^q(U, K) → H^{q+1}_Z(X, K) → …; for Z ⊂ Z′ closed there is the sequence of the triple. Excision: for φ : X′ → X étale with Z′ := φ^{-1}(Z) → Z an isomorphism, RΓ_Z(X, K) ≅ RΓ_{Z′}(X′, φ^*K). The construction retains the immersion i and the category D(Z, Λ), and depends only on Z_red.

Open obligations: [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** Any scheme X; Z ⊂ X closed with its reduced or nonreduced structure (the étale sites of Z and Z_red coincide). Λ any ring; no torsion or constructibility hypothesis.

**Construction and proof plan.**

1. i_* is exact and fully faithful on sheaves and i^{-1}i_* = id; ker(F → j_*j^*F) is supported on Z, so i^! is right adjoint to i_* and preserves injectives.
2. The localization triangle comes from the exact sequence 0 → i_*i^!I → I → j_*j^*I → 0 for injective I (surjectivity: injective sheaves are flasque in the étale sense) applied to a K-injective replacement.
3. Excision is Stacks More Étale Lemma 2.1 (growing sections) applied to injective resolutions.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); `mathlib:AlgebraicGeometry.IsClosedImmersion`; `mathlib:AlgebraicGeometry.IsOpenImmersion`; `mathlib:CategoryTheory.Adjunction`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 3.1.8 (ii): f^! for a closed immersion is sections with support
- Milne LEC 16.1 and 23.1: purity and semi-purity are statements about H^q_Z(X, −)
- EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class: the fundamental class lives in H^{2c}_Z(X, Λ(c))
- EtaleDualityAndPerverseSheaves:EDC.5: the open-closed recollement uses i^! and the localization triangle

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.supportSections` | data | i^! : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Z, sections supported on Z. |
| `TauCeti.EtaleDuality.supportAdjunction` | universal-property | i_* ⊣ i^! on sheaves; i^!i_* ≅ id. |
| `TauCeti.EtaleDuality.derivedSupport` | constructor | Ri^! : D(X, Λ) ⥤ D(Z, Λ), right adjoint to i_* on derived categories. |
| `TauCeti.EtaleDuality.localizationTriangle` | relation | i_*Ri^!K → K → Rj_*j^*K → (i_*Ri^!K)[1] is distinguished, naturally in K. |
| `TauCeti.EtaleDuality.cohomologyWithSupports` | projection | H^q_Z(X, K) := H^q(Z, Ri^!K), a Λ-module. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_exact` | relation | The long exact sequence of the pair (X, U) and of a triple Z ⊂ Z′. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_excision` | characterisation | For φ : X′ → X étale with φ^{-1}(Z) → Z an isomorphism, H^q_Z(X, K) ≅ H^q_{φ^{-1}Z}(X′, φ^*K). |
| `TauCeti.EtaleDuality.derivedSupport_reduced` | characterisation | Ri^! depends only on the closed subset: the thickening Z_red → Z identifies the étale sites and the functors. |
| `TauCeti.EtaleDuality.localizationTriangle_distinguished` | relation | For j the open complement of i, the localization triangle is distinguished. |
| `TauCeti.EtaleDuality.forgetSupports` | projection | The map H^q_Z(X, K) → H^q(X, K) forgetting supports. |
| `TauCeti.EtaleDuality.restrictToOpen` | projection | The restriction H^q(X, K) → H^q(U, j^*K) to the open complement. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.cohomologyWithSupports_self` | degenerate | For Z = X (i = id), H^q_Z(X, K) = H^q(X, K). |
| `TauCeti.EtaleDuality.cohomologyWithSupports_empty` | degenerate | For Z = ∅, H^q_Z(X, K) = 0. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_origin_line` | computation | For X = A¹_Ω, Ω algebraically closed, Z = {0} and Λ = ℤ/n with n invertible: H²_Z(X, Λ(1)) ≅ Λ and H^q_Z(X, Λ(1)) = 0 for q ≠ 2. |
| `TauCeti.EtaleDuality.not_cohomologyWithSupports_eq_cohomology_of_support` | non-example | H⁰_{0}(A¹_Ω, Λ) = 0 while H⁰({0}, Λ) = Λ: cohomology with supports is not the cohomology of Z. |

**Acceptance examples.**

- Z = X gives RΓ_Z = RΓ; Z = ∅ gives 0.
- For X = A¹ over an algebraically closed field, Z = {0}, Λ = ℤ/n: H^q_Z(X, Λ(1)) is Λ for q = 2 and 0 otherwise (Kummer theory on A¹ − {0}; this is EDC.3's purity for a point on a curve).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.8 (ii), p. 571. For a closed immersion the sheaf-level right adjoint is sections with support.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 2.1 (tag 0F6F). Étale excision for sections with support.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 138. The sequence of the triple used for semi-purity and cycle classes.

<a id="node-EDC.0-coefficient-change"></a>

#### Change of coefficients and the reduction identities

Node `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Coefficients`; namespace: `TauCeti.EtaleDuality`.

Let φ : Λ → Λ′ be a homomorphism of commutative rings. Restriction of scalars ρ : D(X, Λ′) → D(X, Λ) is exact; extension of scalars Λ′ ⊗^L_Λ − : D(X, Λ) → D(X, Λ′) is its left adjoint. ρ commutes with f^*, Rf_*, Rf_! and Ri^! (for i a closed immersion); extension commutes with f^* and, for Λ and Λ′ torsion, with Rf_! (projection formula). In particular, for an ideal I ⊂ Λ (reduction), (Λ/I) ⊗^L_Λ Rf_!K ≅ Rf_!((Λ/I) ⊗^L_Λ K) and RΓ_c(X_k̄, (Λ/I) ⊗^L K) ≅ (Λ/I) ⊗^L RΓ_c(X_k̄, K). These identities use derived tensor products; the underived tensor product is not exact.

**Hypotheses.** Λ, Λ′ commutative; for the Rf_! statements both torsion and f compactifiable. The identities hold in the unbounded derived categories; no finite Tor-dimension hypothesis.

**Construction and proof plan.**

1. Adjunction: Hom_{Λ′}(Λ′ ⊗^L_Λ K, L) ≅ Hom_Λ(K, ρL) from the sheaf-level adjunction and K-flat replacements (EnhancedDerivedSheaves E1).
2. ρ commutes with f^* trivially and with Rf_* because ρ preserves K-injectives' acyclicity for f_* (flasque sheaves); with Rf_! because Rf_! = R f̄_* ∘ j_! on a compactification (SGA 4 XVII 5.1.14, Stacks More Étale Remark 10.8).
3. Extension commutes with Rf_! by the projection formula Rf_!E ⊗^L K ≅ Rf_!(E ⊗^L f^{-1}K) with K = Λ′ (Stacks More Étale Lemma 10.7; SGA 4 XVII 5.2.9).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); `SchemeAndStackFoundations:SF.2`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Uses that determine the API.**

- SGA 4 XVIII 3.1.12.1: f^! commutes with restriction of scalars ('le faisceau d'anneaux joue un rôle bidon')
- EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality: passage between O_E/πⁿ levels uses the reduction identity
- EtaleDualityAndPerverseSheaves:EDC.6: normalized adic systems are built from reduction maps

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.restrictScalars` | constructor | ρ_φ : D(X, Λ′) ⥤ D(X, Λ), exact and triangulated. |
| `TauCeti.EtaleDuality.extendScalars` | constructor | Λ′ ⊗^L_Λ − : D(X, Λ) ⥤ D(X, Λ′). |
| `TauCeti.EtaleDuality.extendRestrictAdjunction` | universal-property | extendScalars φ ⊣ restrictScalars φ. |
| `TauCeti.EtaleDuality.restrictScalars_lowerShriek` | compatibility | ρ ∘ Rf_! ≅ Rf_! ∘ ρ for f compactifiable and torsion coefficients. |
| `TauCeti.EtaleDuality.extendScalars_lowerShriek` | compatibility | Λ′ ⊗^L Rf_!K ≅ Rf_!(Λ′ ⊗^L K) (the reduction identity). |
| `TauCeti.EtaleDuality.restrictScalars_derivedSupport` | compatibility | ρ ∘ Ri^! ≅ Ri^! ∘ ρ for a closed immersion i. |
| `TauCeti.EtaleDuality.restrictScalars_comp` | functoriality | ρ_{ψ∘φ} ≅ ρ_φ ∘ ρ_ψ and ρ_id ≅ id. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.extendScalars_id` | degenerate | For φ = id, extension and restriction are isomorphic to the identity. |
| `TauCeti.EtaleDuality.extendScalars_reduction_unbounded` | computation | For Λ = ℤ/ℓ², Λ′ = ℤ/ℓ: ℋ^{-q}(Λ′ ⊗^L_Λ Λ′_X) ≅ Λ′_X for all q ≥ 0. |
| `TauCeti.EtaleDuality.restrictScalars_constant` | compatibility | ρ(Λ′_X) is the constant sheaf with value Λ′ regarded as a Λ-module. |
| `TauCeti.EtaleDuality.not_extendScalars_underived_exact` | non-example | The underived tensor product with ℤ/ℓ is not exact: tensoring the injection ℤ → ℤ, x ↦ ℓx, with ℤ/ℓ gives the zero map on ℤ/ℓ ≠ 0 (shown for ℓ = 2); coefficient extension must be derived. |

**Acceptance examples.**

- Λ = ℤ/ℓ², Λ′ = ℤ/ℓ: (ℤ/ℓ) ⊗^L_{ℤ/ℓ²} (ℤ/ℓ)_X has ℋ^{-q} ≅ (ℤ/ℓ)_X for every q ≥ 0, so extension of scalars leaves D^b.
- Restriction of scalars of Λ′_X is the constant sheaf Λ′ regarded as a Λ-module.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Remark 11.8 (tag 0GLF). Restriction of scalars commutes with Rf_! (Remark 10.8) and with Rf^! (Remark 11.8).
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Proposition 5.2.9, p. 358. The projection formula, which gives the reduction identity for extension of scalars.

<a id="node-EDC.0-enhanced-compact-pushforward"></a>

#### The enhanced compactly supported direct image Rf_! ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`; construction. Planet: “Enhanced compactly supported direct image”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/LowerShriek`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be compactifiable (separated, of finite type, S quasi-compact quasi-separated), with fibres of dimension < d, and Λ a torsion ring. Choose a compactification X → X̄ (open immersion j) followed by f̄ : X̄ → S proper. The complex-level functor f_!^•(F) := f̄_* τ_{≤2d} Cℓ^*(j_!F), with Cℓ^* the modified canonical flasque resolution (filtered colimit of canonical flasque resolutions of constructible subsheaves), is exact, commutes with filtered colimits and computes Rf_! (SGA 4 XVIII 3.1.4.5-3.1.4.7). It defines an exact functor of the EnhancedDerivedSheaves enhancements Rf_!^{enh} : 𝒟(X, Λ) → 𝒟(S, Λ) that preserves all small colimits and whose homotopy-category functor is the imported finite-level Rf_! : D(X, Λ) → D(S, Λ) of CompactSupport; the equivalences (gh)_!^{enh} ≃ g_!^{enh} h_!^{enh} and the base-change equivalences are coherent, and the construction is independent of the compactification up to coherent equivalence.

Open obligations: [Enhanced compactification and localization coherence still require a supplier contract](#gap-EDC0-5); [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** f separated of finite type over a quasi-compact quasi-separated S (compactifiable by Nagata, imported from CompactSupport). Λ torsion; the unbounded category is used, which needs the finite cohomological dimension of EDC.0/compact-pushforward-amplitude-and-colimits. This lifts the imported Rf_!; it is not a second definition of Rf_! (RS-19: EDC.0 does not own the finite-level Rf_!).

**Construction and proof plan.**

1. Truncation: for every sheaf F the terms of τ_{≤2d}Cℓ^*j_!F are f̄_*-acyclic: for i < 2d they are filtered colimits of flasque sheaves, and for i = 2d R^k f̄_* of the term is R^{k+2d}f_!F = 0 (SGA 4 XVIII 3.1.4.5, using XVII 5.2.8.1).
2. Apply the exact bounded resolution functor termwise on complexes and prove that it preserves quasi-isomorphisms; descend to the dg localization and compare this model with the K-injective presentation of EnhancedDerivedSheaves E1. It does not directly give a functor between K-injective subcategories.
3. Its homotopy-category functor is the imported Rf_! (both are R f̄_* ∘ j_!), and it preserves small colimits because it is exact and commutes with direct sums (EDC.0/compact-pushforward-amplitude-and-colimits).
4. Composition and base change require a coherent diagram of these compactification models and the localization comparisons, compatible with the Beck-Chevalley mates of EnhancedDerivedSheaves E3. The supplier gives mates abstractly; the missing diagram and compactification comparison are the explicit coherence gap, not an established contractibility theorem in this packet.
5. The target-level construction must use dg localization; a termwise f_!^• on complexes is not automatically a functor between K-injective subcategories. Its comparison and localization coherence are recorded as a gap, including the point choices in source issue E9.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`; `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 0.1 (I)-(III): existence of the adjoint needs base change, finite cohomological dimension with colimits, and a complex-level model
- EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image: f^! is the right adjoint of Rf_!^{enh}, produced by the adjoint functor theorem of EnhancedDerivedSheaves E3
- ExcursionOperatorsAndSpectralAction:ES7 and GlobalShtukasAndFunctionFieldLanglands (requests to EDC.0): the six operations on schemes, with their coherence

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.enhancedLowerShriek` | constructor | Rf_!^{enh} : 𝒟(X, Λ) → 𝒟(S, Λ), an exact functor of the EnhancedDerivedSheaves stable categories. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_homotopy` | compatibility | The homotopy-category functor of Rf_!^{enh} is isomorphic to the imported Rf_! : D(X, Λ) ⥤ D(S, Λ). |
| `TauCeti.EtaleDuality.enhancedLowerShriek_preservesColimits` | instance | Rf_!^{enh} preserves all small colimits. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_comp` | functoriality | (g ∘ h)_!^{enh} ≃ g_!^{enh} ∘ h_!^{enh}, with the coherent associativity and unit data. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_baseChange` | compatibility | For a cartesian square, g^*Rf_!^{enh} ≃ Rf′_!^{enh}g′^*, coherently (proper base change). |
| `TauCeti.EtaleDuality.lowerShriek_openImmersion` | simp | For an open immersion j, Rj_! is extension by zero j_!, left adjoint to j^*. |
| `TauCeti.EtaleDuality.lowerShriek_proper` | simp | For proper f, Rf_! ≅ Rf_*. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.lowerShriek_openImmersion_stalk` | computation | For j : U → X open and K ∈ D(U, Λ), (Rj_!K)_x̄ = 0 for x̄ outside U and = K_x̄ for x̄ in U. |
| `TauCeti.EtaleDuality.lowerShriek_finiteEtale` | computation | For f finite étale, Rf_! ≅ f_* is exact (no higher cohomology sheaves). |
| `TauCeti.EtaleDuality.lowerShriek_affineLine` | computation | For a : A¹_Ω → Spec Ω, Ω algebraically closed, n invertible: H^q(Ra_!Λ(1)) = Λ for q = 2 and 0 for q ≠ 2. |
| `TauCeti.EtaleDuality.not_lowerShriek_eq_pushforward` | non-example | For j : A¹_Ω → P¹_Ω, Rj_!Λ ≇ Rj_*Λ: their stalks at ∞ are 0 and Λ (in degree 0) respectively. |

**Acceptance examples.**

- Open immersion j : U → X: Rj_!^{enh} is extension by zero.
- Finite étale f: Rf_!^{enh} = f_* (exact).
- Structure map a : A¹_Ω → Spec Ω, Ω algebraically closed: H^q(Ra_!Λ(1)) is Λ for q = 2 and 0 otherwise, the same as the imported Rf_!.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.1 (III), p. 481. The property of Rf_! that the enhancement uses.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), proof of 3.1.4, (3.1.4.7), p. 568-569. The complex-level model f_!^• of Rf_!.

<a id="node-EDC.0-compact-pushforward-amplitude-and-colimits"></a>

#### Rf_! has finite amplitude and commutes with direct sums and filtered colimits

Node `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be compactifiable with fibres of dimension ≤ d and Λ a torsion ring. (a) For every sheaf F of Λ-modules, (R^q f_!F)_s̄ = H^q_c(X_s̄, F) for each geometric point s̄ of S, and R^q f_!F = 0 for q > 2d; R^{2d}f_! is right exact. (b) Hence Rf_! has finite cohomological amplitude and is defined on the unbounded D(X, Λ); there is N with H^i(Rf_!E) = 0 for i ∉ [a, b + N] when H^i(E) = 0 for i ∉ [a, b]. (c) Rf_! : D(X, Λ) → D(S, Λ) commutes with arbitrary direct sums, and the functors R^q f_! commute with filtered colimits of sheaves. (d) Rf_! preserves D^b_c and D_ctf (imported finiteness).

**Hypotheses.** f compactifiable; Λ torsion (for (c) on the unbounded category). The finite-level Rf_!, its stalk formula and its cohomological dimension are CompactSupport's (imported); this node records them in the form the adjoint construction consumes.

**Construction and proof plan.**

1. (a) is SGA 4 XVII 5.2.8 and 5.2.8.1: reduce by base change to S the spectrum of an algebraically closed field and use cohomological dimension 2 dim X̄ of a compactification (SGA 4 X 4.3).
2. (b) follows from (a) by the way-out lemma (Stacks More Étale Lemma 10.2, SGA 4 XVIII Remark 3.1.5).
3. (c): reduce to an open immersion (j_! is a left adjoint) and a proper morphism (Rf_* commutes with direct sums for torsion Λ by finite cohomological dimension), Stacks More Étale Lemma 10.1; filtered colimits by SGA 4 XVIII 0.1 (II).
4. (d) is imported from CompactSupport and the finiteness theorem through SchemeAndStackFoundations SF.2.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); `SchemeAndStackFoundations:SF.2`; `mathlib:DerivedCategory.TStructure.t`.

**Acceptance examples.**

- For X = A^d over an algebraically closed field, R^{2d}a_!Λ(d) ≅ Λ and R^q a_!Λ = 0 for q > 2d.
- For f finite, Rf_! = f_* is exact, so the amplitude is [0, 0].

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Corollaire 5.2.8.1, p. 358. Amplitude bound (a).
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 10.1 (tag 0G29). Colimit preservation (c) on the unbounded category.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.1 (II), p. 481. The properties Deligne isolates as the input to the existence of Rf^!.

### EDC.1 — Exceptional inverse image and Verdier duality

This collector is realised by the adjoint and biduality sublayers. The adjoint exists independently of the later smooth calculation. Biduality, constructible exchanges and geometric duality use the trace/purity inputs described between the two sublayers below.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

### EDC.1:adjoint — Exceptional inverse image and Verdier duality — adjoint

Construct f^! as the right adjoint of the enhanced, colimit-preserving Rf_!. Uniqueness of adjoints provides composition comparisons, while mates provide exchange maps. The intended coherence uses the actual compactification/localization diagrams and their chosen comparisons. Define the dualizing complex and Verdier dual, and identify closed-immersion upper shriek with local cohomology. Base-change transformations are not unrestricted isomorphisms.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.1-adjoint-exceptional-inverse-image"></a>

#### The exceptional inverse image f^!, right adjoint to Rf_! ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`; construction. Planet: “Exceptional inverse image f^!”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/UpperShriek`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be compactifiable and Λ a torsion ring. The exceptional inverse image f^! : D(S, Λ) → D(X, Λ) is the right adjoint of Rf_!: it is the homotopy-category functor of the right adjoint f^!_{enh} of Rf_!^{enh}, which exists by the adjoint functor theorem for colimit-preserving functors of presentable stable categories (EnhancedDerivedSheaves E3) and is exact. There are natural isomorphisms Hom_{D(S,Λ)}(Rf_!K, L) ≅ Hom_{D(X,Λ)}(K, f^!L) with unit K → f^!Rf_!K and counit Rf_!f^!L → L; f^! is triangulated. On D⁺ it is SGA 4 XVIII's partial adjoint (3.1.4) and the derived functor of the complex-level f^{!•} right adjoint to f_!^•; on the unbounded category it agrees with the Brown-representability adjoint of Stacks More Étale Lemma 11.1, by uniqueness of adjoints. If f has fibres of dimension ≤ d and H^i(L) = 0 for i ≤ k then H^i(f^!L) = 0 for i ≤ k − 2d. For f étale, f^! = f^* with counit the trace f_!f^* → id; for f quasi-finite, f^! is the right derived functor of the sheaf-level right adjoint of f_!; for a closed immersion it is Ri^! of EDC.0/cohomology-with-supports.

**Hypotheses.** f separated of finite type over a quasi-compact quasi-separated base S; Λ torsion. No smoothness, purity or constructibility is assumed: this is the formal prefix of SGA 4 XVIII §3.1, independent of §§1-2 (XVIII 0.2). The right adjoint is produced, not assumed (EnhancedDerivedSheaves E3).

**Construction and proof plan.**

1. Rf_!^{enh} preserves small colimits between presentable stable categories (EDC.0/enhanced-compact-pushforward), so EnhancedDerivedSheaves E3 produces its right adjoint f^!_{enh} with unit and counit; pass to homotopy categories.
2. Agreement with SGA 4 XVIII 3.1.4 on D⁺ and with Stacks 0G2C on D: both are right adjoints of the same functor Rf_!, hence canonically isomorphic.
3. Amplitude: by adjunction with L′ := τ_{≤k−2d}f^!L, Rf_!L′ has cohomology in degrees ≤ k so Hom(Rf_!L′, L) = 0 (XVIII 3.1.7 (i), Stacks 0GLA).
4. Étale f: f_! is left adjoint to f^* with the trace as counit (SGA 4 XVII 6.2.11), so f^! = f^*; quasi-finite f: Rf_! = f_! is exact and commutes with filtered colimits, so it has a sheaf-level right adjoint whose derived functor is f^! (XVIII 3.1.8 (i)); closed immersion: XVIII 3.1.8 (ii).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`; `mathlib:CategoryTheory.Adjunction`; `mathlib:CategoryTheory.Functor.IsTriangulated`; `mathlib:CategoryTheory.Functor.CommShift`; `mathlib:AlgebraicGeometry.Etale`; `mathlib:AlgebraicGeometry.LocallyQuasiFinite`.

**Uses that determine the API.**

- SGA 4 XVIII 3.2.5: Poincaré duality identifies f^! for smooth f
- SGA 7 XIII 2.1.6-2.1.7 via LefschetzPencilsAndVanishingCycles:LPV.0 (request to EDC.1): Rf^! for quasi-finite and separated finite-type morphisms, for the functorialities of RΨ
- DeligneWeightsAndPurity:DWP.7 (request to EDC.1): f^! for separated finite-type morphisms over 𝔽_q and over ℤ[1/ℓ]
- EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex: K_X := a^!Λ
- EtaleDualityAndPerverseSheaves:EDC.5: recollement uses i^! and j^! = j^*

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriek` | constructor | f^! : D(S, Λ) ⥤ D(X, Λ) for f compactifiable and Λ torsion. |
| `TauCeti.EtaleDuality.lowerShriekUpperShriekAdjunction` | universal-property | Rf_! ⊣ f^!, with unit and counit. |
| `TauCeti.EtaleDuality.upperShriek_commShift` | instance | f^! commutes with the shift functors. |
| `TauCeti.EtaleDuality.upperShriek_isTriangulated` | instance | f^! is a triangulated functor. |
| `TauCeti.EtaleDuality.upperShriek_id` | simp | id^! ≅ id. |
| `TauCeti.EtaleDuality.upperShriek_etale` | simp | For f étale (separated, of finite type), f^! ≅ f^* with counit the trace f_!f^* → id. |
| `TauCeti.EtaleDuality.upperShriek_closedImmersion` | compatibility | For a closed immersion i, i^! ≅ Ri^! (derived sections with support). |
| `TauCeti.EtaleDuality.upperShriek_amplitude` | other | If f has fibres of dimension ≤ d and L ∈ D^{≥k+1}, then f^!L ∈ D^{≥k+1−2d}. |
| `TauCeti.EtaleDuality.upperShriek_quasiFinite` | characterisation | For f quasi-finite, f^! is the right derived functor of the right adjoint of the exact functor f_! on sheaves. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriek_id_eq` | degenerate | For f = 𝟙_X, f^! ≅ 𝟭 (D(X, Λ)). |
| `TauCeti.EtaleDuality.upperShriek_openImmersion` | computation | For j : U → X an open immersion, j^!K ≅ j^*K, and the counit j_!j^*K → K is extension by zero of the identity. |
| `TauCeti.EtaleDuality.upperShriek_point_line` | computation | For i : {0} → A¹_Ω (Ω algebraically closed, n invertible, Λ = ℤ/n), i^!Λ ≅ Λ(−1)[−2]. |
| `TauCeti.EtaleDuality.not_upperShriek_eq_pullback_closed` | non-example | For i : {0} → A¹_Ω, i^!Λ ≇ i^*Λ = Λ: the exceptional inverse image of a closed immersion is not the pullback. |

**Acceptance examples.**

- X = S, f = id: f^! = id.
- j : U → X open immersion: j^! = j^*.
- i : {0} → A¹_Ω, Ω algebraically closed: i^!Λ ≅ Λ(−1)[−2] (computed by EDC.3/smooth-pair-purity), so f^! ≠ f^* for closed immersions.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.1.4, p. 567. Existence of the right adjoint on D⁺.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Définition 3.1.6, p. 570-571. Name and definition.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.1 (tag 0G2C). The unbounded right adjoint (by Brown representability), isomorphic to ours by uniqueness of adjoints.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8, p. 571. The étale case.

<a id="node-EDC.1-adjoint-upper-shriek-pseudofunctor"></a>

#### Composition and localization for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

For compactifiable S-morphisms X →h Y →g Z there are isomorphisms c^!_{g,h} : h^!g^! ≅ (gh)^!, transposed from the composition isomorphism Rg_!Rh_! ≅ R(gh)_!, satisfying the cocycle condition for triple composites and unit conditions; so the categories D(X, Λ) form a category fibred (by f^!) and cofibred (by Rf_!) over compactifiable morphisms. For a commutative square of compactifiable morphisms there is the cobase-change map Rf′_!g′^! → g^!Rf_!. For k : V → S étale with X_V := X ×_S V, there is the localization isomorphism k_X^*f^! ≅ f_V^!k^*.

Open obligations: [Enhanced compactification and localization coherence still require a supplier contract](#gap-EDC0-5).

**Hypotheses.** Compactifiable morphisms over a quasi-compact quasi-separated base; Λ torsion.

**Construction and proof plan.**

1. Transpose the composition isomorphism of EDC.0/enhanced-compact-pushforward by uniqueness of adjoints; the coherence of the enhancement (EnhancedDerivedSheaves E3 mates) gives the cocycle condition (SGA 4 XVIII 3.1.13.1).
2. Localization: k_!Rf_{V!} ≅ Rf_!k_{X!} transposes, using k^! = k^* for étale k (EDC.1:adjoint/exceptional-inverse-image), to (3.1.10.1).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](#node-EDC.0-enhanced-compact-pushforward); `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

**Acceptance examples.**

- For h = id, c^!_{g,id} is the identity.
- For two open immersions U ⊂ V ⊂ X, the composite of restrictions is restriction.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, (3.1.13.1), p. 576. Composition isomorphisms for f^!.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), proof of 3.1.10, (3.1.10.1), p. 573. Localization isomorphism for étale base change.

<a id="node-EDC.1-adjoint-sheafified-adjunction"></a>

#### The sheafified adjunction Rf_*RHom(L, f^!K) ≅ RHom(Rf_!L, K) and the induction formulas

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be compactifiable and Λ torsion. (a) For K ∈ D(S, Λ) and L ∈ D(X, Λ), the composite Rf_*RHom(L, f^!K) → RHom(Rf_!L, Rf_!f^!K) → RHom(Rf_!L, K) is an isomorphism; taking RΓ gives RHom_X(L, f^!K) ≅ RHom_S(Rf_!L, K). (b) Induction formula: for K ∈ D(S, Λ) and L ∈ D(S, Λ), RHom(f^*K, f^!L) ≅ f^!RHom(K, L). (c) Base change: for a cartesian square with g : S′ → S and f′ : X′ → S′, Rg′_*f′^!L ≅ f^!Rg_*L. (d) Coefficient restriction: for a ring map Λ → Λ′ of torsion rings, ρf^! ≅ f^!ρ.

**Hypotheses.** f compactifiable, Λ torsion; unbounded complexes allowed (Stacks); SGA 4 XVIII states (a)-(c) with K ∈ D⁻, L ∈ D⁺, which the unbounded version contains. No smoothness or constructibility.

**Construction and proof plan.**

1. (a) Test against M ∈ D(S, Λ): Hom(M, Rf_*RHom(L, f^!K)) = Hom(f^{-1}M ⊗^L L, f^!K) = Hom(Rf_!(f^{-1}M ⊗^L L), K) = Hom(M ⊗^L Rf_!L, K) = Hom(M, RHom(Rf_!L, K)), the fourth equality being the projection formula (Stacks More Étale Lemmas 11.5-11.6; SGA 4 XVIII 3.1.10).
2. (b)-(d) are the three special cases of the induction isomorphism (3.1.11.4) of SGA 4 XVIII 3.1.12, transposed from base change and the projection formula (XVII 5.2.6, 5.2.9) by uniqueness of adjoints; (c) is also Stacks 0GLE, (d) Stacks 0GLF.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- For f étale, (a) reduces to f_*RHom(L, f^*K) ≅ RHom(f_!L, K), the usual adjunction formula.
- For f = i a closed immersion and L = Λ_X, (a) gives i_*Ri^!K ≅ RHom(i_*Λ_Z, K) = RHom_Z-supported, the local-cohomology form.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.5 (tag 0GLC). Statement (a).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Corollaires 3.1.12.2-3.1.12.3, p. 575-576. Statements (b) and (c).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Corollaire 3.1.12.1, p. 575. Statement (d).

<a id="node-EDC.1-adjoint-local-cohomology-identification"></a>

#### i_*i^! is local cohomology

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

For a closed immersion i : Z → X with open complement j : U → X and Λ torsion, the exceptional inverse image i^! of EDC.1:adjoint/exceptional-inverse-image is canonically isomorphic to Ri^! of EDC.0/cohomology-with-supports, compatibly with the adjunctions i_* ⊣ i^!; hence i_*i^!K ≅ RHom(i_*Λ_Z, K) (the local cohomology complex, by the sheafified adjunction for the finite morphism i), RΓ(Z, i^!K) = RΓ_Z(X, K), and there is a distinguished triangle i_*i^!K → K → Rj_*j^*K → with j^! = j^*.

**Hypotheses.** i a closed immersion (finite, hence compactifiable with Ri_! = i_*); Λ torsion.

**Construction and proof plan.**

1. Ri_! = i_* (finite morphism); the right adjoint of i_* on derived categories is Ri^! (EDC.0/cohomology-with-supports); uniqueness of adjoints identifies it with i^!.
2. The triangle is the localization triangle of EDC.0/cohomology-with-supports with Rj_* = j_* ∘ (right adjoint of j^* = j^!).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction).

**Acceptance examples.**

- Z = X: i^! = id; Z = ∅: i^! = 0.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8 (ii), p. 571. Identification of i^! with sections with support.

<a id="node-EDC.1-adjoint-dualizing-complex"></a>

#### The dualizing complex K_X = a^!Λ ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`; definition. Planet: “Dualizing complex”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Dualizing`; namespace: `TauCeti.EtaleDuality`.

Let k be a field, n invertible in k, Λ a ring with nΛ = 0, and a : X → Spec k separated of finite type. The dualizing complex of X is K_X := a^!Λ ∈ D(X, Λ). More generally, for f : X → S compactifiable, the relative dualizing complex is K_{X/S} := f^!Λ_S. For an étale (separated, finite type) map u : V → X, u^*K_X ≅ K_V; for a closed immersion i : Z → X, i^!K_X ≅ K_Z; for compactifiable X → Y → S, K_{X/S} ≅ h^!K_{Y/S}. No identification K_X ≅ Λ(d)[2d] is part of this definition: it is the theorem EDC.1:biduality/dualizing-complex-of-smooth-scheme, after smooth purity.

**Hypotheses.** X separated of finite type over a field k (or compactifiable over a quasi-compact quasi-separated S); Λ torsion, n invertible. Defined before and independently of smooth purity and biduality (SGA 4 XVIII 0.2).

**Construction and proof plan.**

1. Apply EDC.1:adjoint/exceptional-inverse-image to the structure morphism; the restriction and composition formulas are the étale case and the pseudofunctoriality (EDC.1:adjoint/upper-shriek-pseudofunctor).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor).

**Uses that determine the API.**

- SGA 4 XVIII 3.2.6: global duality RΓ(X, D F) ≅ RHom(RΓ_c(X, F), Λ)
- EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual: D_X := RHom(−, K_X)
- DeligneWeightsAndPurity:DWP.7 (request to EDC.1): K_X = Ra^!ℚ̄_ℓ and D = RHom(−, K_X)
- EtaleDualityAndPerverseSheaves:EDC.5: the self-duality of the middle perversity is measured against K_X

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.dualizingComplex` | data | K_X := a^!Λ ∈ D(X, Λ) for a : X → Spec k separated of finite type. |
| `TauCeti.EtaleDuality.relativeDualizingComplex` | data | K_{X/S} := f^!Λ_S for f compactifiable. |
| `TauCeti.EtaleDuality.dualizingComplex_spec` | simp | K_{Spec k} ≅ Λ. |
| `TauCeti.EtaleDuality.dualizingComplex_etale` | compatibility | u^*K_X ≅ K_V for u : V → X étale separated of finite type. |
| `TauCeti.EtaleDuality.dualizingComplex_closedImmersion` | compatibility | i^!K_X ≅ K_Z for a closed immersion i : Z → X. |
| `TauCeti.EtaleDuality.relativeDualizingComplex_comp` | functoriality | K_{X/S} ≅ h^!K_{Y/S} for compactifiable X →h Y → S. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.dualizingComplex_point` | degenerate | For X = Spec k, K_X ≅ Λ. |
| `TauCeti.EtaleDuality.dualizingComplex_finiteSeparable` | computation | For X = Spec L with L/k finite separable, K_X ≅ Λ_X. |
| `TauCeti.EtaleDuality.dualizingComplex_curve` | computation | For X a smooth curve over an algebraically closed k, K_X ≅ Λ(1)[2] (after EDC.2:trace-purity/smooth-purity). |
| `TauCeti.EtaleDuality.not_dualizingComplex_shift_of_constant` | non-example | Assume Λ ≠ 0. For X = Spec k ⊔ A¹_k (k algebraically closed), K_X restricts to Λ on the point and to Λ(1)[2] on the line, so K_X is not Λ_X(d)[2d] for any single d. |

**Acceptance examples.**

- K_{Spec k} = Λ.
- For X = Spec L, L/k finite separable, K_X = Λ_X (a étale).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, (3.2.6.1), p. 586. The role of a^!Λ (here identified with Z/n(d)[2d]) as the dualizing object of global duality.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.3 (tag 0GL9). Restriction of the dualizing complex along étale maps.

<a id="node-EDC.1-adjoint-verdier-dual"></a>

#### The Verdier duality functor D_X = RHom(−, K_X) ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`; definition. Planet: “Verdier duality functor”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/VerdierDual`; namespace: `TauCeti.EtaleDuality`.

For X separated of finite type over a field k (n invertible, Λ torsion), the Verdier duality functor is the contravariant triangulated functor D_X : D(X, Λ)^op → D(X, Λ), D_X(K) := RHom(K, K_X). It satisfies D_X(K[m]) ≅ D_X(K)[−m], D_X(Λ_X) ≅ K_X, D_X(K ⊗^L L) ≅ RHom(K, D_X L), and there is a natural evaluation morphism ev_K : K → D_X D_X K. For u : V → X étale, u^*D_X ≅ D_V u^*. Biduality (ev_K an isomorphism on D^b_c) is not part of this definition: it is EDC.1:biduality/constructible-biduality.

**Hypotheses.** X separated of finite type over a field; Λ torsion; the functor is defined on all of D(X, Λ).

**Construction and proof plan.**

1. Compose the internal RHom of EDC.0/derived-tensor-and-internal-hom with K_X; the shift and tensor formulas are the closed monoidal structure; ev_K is adjoint to the evaluation K ⊗^L RHom(K, K_X) → K_X.
2. Étale restriction: u^*RHom(K, K_X) ≅ RHom(u^*K, u^*K_X) for u étale and u^*K_X ≅ K_V (EDC.1:adjoint/dualizing-complex).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](#node-EDC.1-adjoint-dualizing-complex); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); `mathlib:CategoryTheory.Functor.IsTriangulated`.

**Uses that determine the API.**

- SGA 4½ [Dualité] via DeligneWeightsAndPurity:DWP.7 (request to EDC.1): D = RHom(−, K_X) with D² ≅ id on D^b_c and the exchange formulas
- EtaleDualityAndPerverseSheaves:EDC.5: self-duality of the perverse t-structure and D_X IC_X(L) ≅ IC_X(L^∨(d))
- LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.1:biduality): support duality and D_Y i^*K = i^*DK(−1)[−2] for a transversal section

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.verdierDual` | constructor | D_X : (D(X, Λ))ᵒᵖ ⥤ D(X, Λ), K ↦ RHom(K, K_X). |
| `TauCeti.EtaleDuality.verdierDual_shift` | compatibility | D_X(K[m]) ≅ D_X(K)[−m]. |
| `TauCeti.EtaleDuality.verdierDual_constant` | simp | D_X(Λ_X) ≅ K_X. |
| `TauCeti.EtaleDuality.verdierDual_tensor` | relation | D_X(K ⊗^L L) ≅ RHom(K, D_X L). |
| `TauCeti.EtaleDuality.verdierDualEval` | data | ev_K : K ⟶ D_X(D_X K), natural in K. |
| `TauCeti.EtaleDuality.verdierDual_etale` | compatibility | u^* ∘ D_X ≅ D_V ∘ u^* for u : V → X étale. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.verdierDual_point` | computation | For X = Spec Ω, Ω algebraically closed, Λ self-injective (e.g. ℤ/n) and M a finitely generated Λ-module in degree 0, D_X(M) ≅ Hom_Λ(M, Λ) in degree 0. |
| `TauCeti.EtaleDuality.verdierDual_zero` | degenerate | D_X(0) ≅ 0. |
| `TauCeti.EtaleDuality.verdierDual_smoothCurve_constant` | computation | For X a smooth curve over an algebraically closed field, D_X(Λ_X) ≅ Λ(1)[2]. |
| `TauCeti.EtaleDuality.not_verdierDual_eq_linearDual` | non-example | Assume Λ ≠ 0 and X nonempty. D_X(Λ_X) ≇ RHom(Λ_X, Λ_X) = Λ_X on a smooth curve: duality is measured against K_X, not against Λ_X. |

**Acceptance examples.**

- X = Spec Ω with Ω algebraically closed, Λ = ℤ/n: D(M) = Hom_{ℤ/n}(M, ℤ/n) for a finite ℤ/n-module M placed in degree 0 (ℤ/n is self-injective).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586. The dual on locally constant coefficients, the model case of D_X.

<a id="node-EDC.1-adjoint-formal-duality-exchange"></a>

#### Formal exchange: D_S ∘ Rf_! ≅ Rf_* ∘ D_X and D_X ∘ f^* ≅ f^! ∘ D_S

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be a morphism of schemes separated of finite type over a field k, Λ torsion. With K_X ≅ f^!K_S (composition of exceptional inverse images): (a) for every L ∈ D(X, Λ), D_S(Rf_!L) ≅ Rf_*(D_X L); (b) for every K ∈ D(S, Λ), D_X(f^*K) ≅ f^!(D_S K). Both hold without constructibility or biduality. The dual forms D_S Rf_* ≅ Rf_! D_X and D_X f^! ≅ f^* D_S need biduality and are EDC.1:biduality/duality-exchange-isomorphisms.

**Hypotheses.** X, S separated of finite type over k; f compactifiable; Λ torsion.

**Construction and proof plan.**

1. (a) is EDC.1:adjoint/sheafified-adjunction (a) with K := K_S, using f^!K_S ≅ K_X.
2. (b) is the induction formula EDC.1:adjoint/sheafified-adjunction (b) with L := K_S.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor).

**Acceptance examples.**

- For f = j an open immersion, (b) reads D_U(j^*K) ≅ j^*D_X K.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.6 (tag 0GLD). The global form of (a) with K = K_S.

<a id="node-EDC.1-adjoint-base-change-exchange-maps"></a>

#### The formal base-change and exchange maps for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Exchange`; namespace: `TauCeti.EtaleDuality`.

For a cartesian square X′ →g′ X, f′ : X′ → S′, f : X → S, g : S′ → S with f compactifiable and Λ torsion, construct natural transformations: (i) the isomorphism Rg′_* f′^! ≅ f^! Rg_* (transpose of proper base change g^*Rf_! ≅ Rf′_!g′^*); (ii) the base-change morphism g′^*f^! → f′^!g^* (mate of (i)); (iii) the cobase-change morphism Rf′_!g′^! → g^!Rf_! for g compactifiable; (iv) the exchange morphism f^*RHom(K, L) → RHom(f^*K, f^*L) and its dual form f^!RHom(K, L) ≅ RHom(f^*K, f^!L). These are constructed as mates in the EnhancedDerivedSheaves coherent diagrams and satisfy the pasting laws for horizontal and vertical composition of squares. (ii) is an isomorphism for g étale here and for g smooth after EDC.2:trace-purity/smooth-purity; it is not an isomorphism for an arbitrary g.

Open obligations: [Enhanced compactification and localization coherence still require a supplier contract](#gap-EDC0-5).

**Hypotheses.** f compactifiable, S and S′ quasi-compact quasi-separated, Λ torsion.

**Construction and proof plan.**

1. Take the mates of the proper base change isomorphism under the adjunctions Rf_! ⊣ f^!, g^* ⊣ Rg_* (EnhancedDerivedSheaves E3 mates and Beck-Chevalley), giving (i) and (ii); (iii) is the mate of the composition isomorphism (SGA 4 XVIII 3.1.13.2); (iv) is EDC.1:adjoint/sheafified-adjunction (b).
2. Pasting: the mate correspondence is functorial for pasting of squares (EnhancedDerivedSheaves E3).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 3.1.12-3.1.14: the induction and cobase-change isomorphisms used in the duality proofs
- LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.1:biduality): pullback exchange with all shifts and Tate twists
- EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity: for smooth g the base-change map becomes an isomorphism

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriekPushforwardIso` | compatibility | Rg′_* ∘ f′^! ≅ f^! ∘ Rg_* for a cartesian square. |
| `TauCeti.EtaleDuality.upperShriekBaseChange` | data | The natural transformation g′^* ∘ f^! ⟶ f′^! ∘ g^*, the mate of (i). |
| `TauCeti.EtaleDuality.upperShriekCobaseChange` | data | Rf′_! ∘ g′^! ⟶ g^! ∘ Rf_! for g compactifiable. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_etale` | simp | For g étale, upperShriekBaseChange is an isomorphism. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_paste` | functoriality | Compatibility of upperShriekBaseChange with horizontal and vertical pasting of cartesian squares. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriekBaseChange_id` | degenerate | For g = id the base-change map is the identity of f^!. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_openImmersion` | computation | For g an open immersion, g′^*f^! ≅ f′^!g^*. |
| `TauCeti.EtaleDuality.not_upperShriekBaseChange_iso_closedPoint` | non-example | Over an algebraically closed field with nonzero prime-to-characteristic torsion Λ, take f = g = i : {0} → A¹ and f′ = g′ = id_{point}. This is the cartesian self-pullback of the closed immersion. Its base-change map i^!Λ = Λ(−1)[−2] → Λ is not an isomorphism. For f = id and arbitrary g the base-change map is an isomorphism. |

**Acceptance examples.**

- For g étale, (ii) is the localization isomorphism of EDC.1:adjoint/upper-shriek-pseudofunctor.
- Over an algebraically closed field with nonzero prime-to-characteristic torsion Λ, take f = g = i : {0} → A¹ and f′ = g′ = id_{point}. In this cartesian self-pullback square, (ii) on Λ is i^!Λ = Λ(−1)[−2] → Λ, which is zero and not an isomorphism. For f = id and arbitrary g, (ii) is an isomorphism.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, (3.1.13.2), p. 576. Cobase-change map (iii).
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.7 (tag 0GLE). Isomorphism (i).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.14, (3.1.14.2), p. 577–578. Cartesian base-change transformation, separately from the cobase-change map in 3.1.13.

### EDC.2 — Smooth trace, relative purity and Poincaré duality

This collector is realised by trace-purity and pairings. First construct and normalize the trace and its smooth purity isomorphism. Only then use constructible biduality to obtain the general pairings. The elementary curve input is independent of that later biduality theorem.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

### EDC.2:trace-purity — Smooth trace, relative purity and Poincaré duality — trace purity

Begin with the geometric-stalk weighted trace for a quasi-finite flat map and with the Kummer first Chern class. The curve trace and the Jacobian/Weil-pairing proof of curve duality lead to effacement; affine-space traces and the general flat top-degree trace then give the smooth calculation. A nonreduced component retains its multiplicity in the trace even though its étale site agrees with the reduction. The replacement proof of smooth purity must identify the induced stalk map with the chosen trace-adjoint normalization; this remains an explicit gate.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.2-trace-purity-quasi-finite-flat-trace"></a>

#### The trace for quasi-finite flat morphisms ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`; construction. Planet: “Trace for finite flat maps”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/FiniteFlat`; namespace: `TauCeti.EtaleDuality`.

For f : X → S separated, flat, of finite presentation and quasi-finite, and F an abelian sheaf on S, there is a unique trace morphism Tr_f : f_!f^*F → F such that (Var 1) Tr_f is natural in F; (Var 2) it is compatible with every base change S′ → S; (Var 3) for f = gh with g, h of the same kind, Tr_f = Tr_g ∘ g_!(Tr_h)g^*; (Var 4) if f is finite locally free of constant rank r, the composite F → f_*f^*F = f_!f^*F → F is multiplication by r. On geometric stalks over s̄, (f_!f^*F)_s̄ = ⊕_{x̄ ↦ s̄} F_s̄ and Tr_f is (a_x̄) ↦ Σ m_x̄ a_x̄, where m_x̄ is the length of the local ring of the fibre X_s̄ at x̄. For f étale, Tr_f is the counit of the adjunction f_! ⊣ f^*. With F replaced by K ∈ D(S, Λ), it gives Rf_!f^*K = f_!f^*K → K.

**Hypotheses.** f separated, flat, of finite presentation, quasi-finite (relative dimension zero); S arbitrary. F any abelian sheaf (no torsion hypothesis is needed in relative dimension zero).

**Construction and proof plan.**

1. Reduce étale-locally to the finite flat pieces of SGA 4 XVII 6.2.1–6.2.2. Define the trace on a geometric fibre as the sum of coefficient stalks weighted by the lengths of its local rings; the weighted morphism construction in 6.2.3–6.2.5 glues these maps and proves base change and composition. Algebra.trace on regular functions is a different map and is not an input.
2. Étale case: SGA 4 XVII 6.2.11 identifies f_! with the left adjoint of f^* and Tr_f with the counit.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); `mathlib:AlgebraicGeometry.Flat`; `mathlib:AlgebraicGeometry.LocallyQuasiFinite`; `mathlib:AlgebraicGeometry.IsFinite`; `mathlib:AlgebraicGeometry.Scheme.Hom.finrank`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 2.9 (Var 4)(I) and 2.10: the d = 0 case of the general trace
- SGA 4 XVIII 1.1.6: the curve trace is glued from quasi-finite flat maps to P¹ composed with Tr_{P¹}
- ClassicalAdicEtaleCohomology:H0 (request to EDC.2:trace-purity): compatibility of the curve trace with finite flat maps (degree)
- EtaleDualityAndPerverseSheaves:EDC.3/gysin-map: proper pushforward along a finite map of degree δ composes with pullback to δ

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.finiteFlatTrace` | constructor | Tr_f : f_!f^*F ⟶ F for f separated flat of finite presentation and quasi-finite. |
| `TauCeti.EtaleDuality.finiteFlatTrace_natural` | functoriality | Tr_f is natural in F. |
| `TauCeti.EtaleDuality.finiteFlatTrace_baseChange` | compatibility | g^*(Tr_f) corresponds to Tr_{f′} under the base-change isomorphism g^*f_! ≅ f′_!g′^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_comp` | functoriality | Tr_{gh} = Tr_g ∘ g_!(Tr_h). |
| `TauCeti.EtaleDuality.finiteFlatTrace_unit` | relation | For f finite locally free of constant rank r, Tr_f ∘ (unit of f^* ⊣ f_*) = r · id. |
| `TauCeti.EtaleDuality.finiteFlatTrace_etale` | compatibility | For f étale, Tr_f is the counit of f_! ⊣ f^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_stalk` | characterisation | On the stalk at s̄, Tr_f is (a_x̄) ↦ Σ_x̄ m_x̄ a_x̄ with m_x̄ the multiplicity of the fibre at x̄. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.finiteFlatTrace_separable` | computation | For Spec L → Spec K with L/K finite separable of degree r, Tr ∘ unit = r on every sheaf. |
| `TauCeti.EtaleDuality.finiteFlatTrace_square_map` | computation | For f : A¹ → A¹, x ↦ x², over an algebraically closed field of characteristic ≠ 2, the stalk of Tr_f at 0 is multiplication by 2 on F_0. |
| `TauCeti.EtaleDuality.finiteFlatTrace_id` | degenerate | For f = id, Tr_f is the identity. |
| `TauCeti.EtaleDuality.not_finiteFlatTrace_counit_ramified` | non-example | For x ↦ x² on A¹ the trace is not the counit of an adjunction f_! ⊣ f^*: at 0 it is 2 · id rather than an isomorphism compatible with a left adjoint, so 'trace = counit' holds only for étale f. |

**Acceptance examples.**

- Spec L → Spec K for a finite separable extension of degree r: Tr ∘ unit = r.
- x ↦ x² on A¹ over an algebraically closed field of characteristic ≠ 2: at the origin the stalk of f_!f^*F is F_0 and Tr is multiplication by 2.

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Théorème 6.2.3, p. 422-423. Existence and uniqueness with (Var 1)-(Var 4).
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Théorème 6.2.3 (Var 4), p. 423. Degree normalization.
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Proposition 6.2.11, p. 430. Étale case.

<a id="node-EDC.2-trace-purity-first-chern-class"></a>

#### The Kummer first Chern class c₁ : Pic(X) → H²(X, Λ(1)) ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`; construction. Planet: “Kummer first Chern class”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/FirstChernClass`; namespace: `TauCeti.EtaleDuality`.

Let X be a scheme with n invertible on X and Λ a ring with nΛ = 0. The Kummer sequence 0 → μ_n → G_m →(·)^n G_m → 0 is exact on X_ét, and H¹(X_ét, G_m) = Pic(X) (both imported). The first Chern class is the composite c₁ : Pic(X) = H¹(X, G_m) →δ H²(X, μ_n) → H²(X, Λ(1)). It is a group homomorphism, natural for pullback, and kills nPic(X). For an effective Cartier divisor D ⊂ X with complement U, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, μ_n) (boundary of the class of a local equation in H¹(U, μ_n)) under H²_D(X) → H²(X).

**Hypotheses.** n invertible on X; Λ with nΛ = 0. The Kummer sequence and Pic(X) = H¹(X, G_m) are imported (ConstructibleEtale through SchemeAndStackFoundations SF.2); Pic(X) and degrees of line bundles on curves come from JacobianChallenge Layer A.

**Construction and proof plan.**

1. δ is the connecting map of the long exact sequence of the Kummer sequence (SGA 4 IX 3.2); compose with μ_n → Λ(1).
2. Naturality from the naturality of the Kummer sequence under f^{-1}; additivity because δ is a homomorphism and [L ⊗ M] = [L] + [M] in H¹(G_m).
3. Divisor form: the section 1 of O(D) trivializes O(D) on U, so [O(D)] comes from H¹_D(X, G_m), whose δ is the local class.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); `SchemeAndStackFoundations:SF.2`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

**Uses that determine the API.**

- SGA 4 XVIII 1.1.3 and 1.1.6: the curve trace is normalized by c₁ of a degree-one line bundle
- EtaleDualityAndPerverseSheaves:EDC.3/chern-classes: c₁ of O(1) generates the projective-bundle cohomology
- DeligneWeightsAndPurity:DWP.7 (request to EDC.3): c₁ : Pic(X) → H²(X, ℚ_ℓ(1)), additive and natural, and the Lefschetz operator
- CohomologyComparisons:CP.6: compares étale c₁ under the Kummer map with other realizations

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.firstChernClass` | constructor | c₁ : Pic(X) →+ H²(X, Λ(1)), the Kummer boundary. |
| `TauCeti.EtaleDuality.firstChernClass_tensor` | simp | c₁(L ⊗ M) = c₁(L) + c₁(M), c₁(O_X) = 0, c₁(L^∨) = −c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pullback` | functoriality | c₁(f^*L) = f^*c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pow` | relation | c₁(L^{⊗n}) = 0 for nΛ = 0. |
| `TauCeti.EtaleDuality.firstChernClass_divisor` | characterisation | For an effective Cartier divisor D, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, Λ(1)). |
| `TauCeti.EtaleDuality.firstChernClass_changeN` | compatibility | For n′ \| n, reduction μ_n → μ_{n′} (via (·)^{n/n′}) sends c₁ to c₁ (SGA 4 XVIII (1.1.3.5)). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.firstChernClass_projectiveLine` | computation | On P¹ over an algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n. |
| `TauCeti.EtaleDuality.firstChernClass_trivial` | degenerate | c₁(O_X) = 0. |
| `TauCeti.EtaleDuality.not_firstChernClass_injective` | non-example | c₁(O_{P¹}(n)) = 0 although O(n) is nontrivial: c₁ only sees Pic(X)/n. |
| `TauCeti.EtaleDuality.firstChernClass_degree_curve` | compatibility | For X a smooth projective connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n (with EDC.2:trace-purity/curve-trace). |

**Acceptance examples.**

- On P¹ over an algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n and its curve trace is 1.
- c₁(O_X) = 0 and c₁(L^{⊗n}) = 0.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.3, (1.1.3.2), p. 485. Kummer identification on a complete curve, built from c₁.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 138. Definition of c₁ (text layer of the PDF as extracted).

<a id="node-EDC.2-trace-purity-curve-trace"></a>

#### The trace morphism for curves ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`; construction. Planet: “Trace morphism for curves”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Curve`; namespace: `TauCeti.EtaleDuality`.

(a) Let X be a curve (separated, finite type, pure dimension one) over an algebraically closed field k of exponent characteristic p, n prime to p, with irreducible components c and multiplicities n_i = length O_{X,η_i}. Then H²_c(X, ℤ/n(1)) ≅ H²(X̄_red, ℤ/n(1)) ≅ Pic(X̄_red)/n ≅ (ℤ/n)^c (X̄ a completion of X_red, c₁ and degree), and Tr_X : H²_c(X, ℤ/n(1)) → ℤ/n is (a_i) ↦ Σ n_i a_i; it extends to Tr_X : H²_c(X, F(1)) → F for every torsion abelian group F prime to p. (b) For a flat compactifiable curve f : X → S (flat, finite presentation, separated, fibres of pure dimension one) and a torsion sheaf F on S prime to the residue characteristics, there is a unique Tr_f : R²f_!(f^*F(1)) → F, natural in F, compatible with every base change, and equal to (a) on geometric fibres. It satisfies: additivity over components (1.1.4); compatibility with quasi-finite flat traces on either side (1.1.7, 1.1.8); and Tr_f is an isomorphism when f is smooth with geometrically irreducible fibres (1.1.9).

**Hypotheses.** k algebraically closed for (a); in (b) S arbitrary (quasi-compact quasi-separated for compactifiability) and F torsion prime to residue characteristics. Uses the cohomology of curves over algebraically closed fields (H² = Pic/n, vanishing above 2), imported through SchemeAndStackFoundations SF.2, and the degree of line bundles from JacobianChallenge Layer A.

**Construction and proof plan.**

1. (a): H²_c(X) ≅ H²_c(X_red) (topological invariance), and for the dense open X_red ⊂ X̄ the localization sequence (SGA 4 XVII 5.1.16.3) with the finite complement gives H²_c(X) ≅ H²(X̄); Kummer and degree give (ℤ/n)^c; define t((a_i)) = Σ n_i a_i (SGA 4 XVIII 1.1.3).
2. (b): on P¹_S the Kummer map ℤ/n → R²p_*ℤ/n(1) is an isomorphism (checked fibrewise); its inverse is Tr_p. Where X admits a quasi-finite flat S-map u to P¹_S, set Tr_f := Tr_p ∘ Tr_u (EDC.2:trace-purity/quasi-finite-flat-trace), independent of u by checking fibrewise via 1.1.5; glue over such opens using right exactness of R²f_!; in general restrict to the dense Cohen-Macaulay locus. For F with nF = 0 use R²f_!ℤ/n(1) ⊗ F ≅ R²f_!(f^*F(1)) (projection formula) and pass to the limit (SGA 4 XVIII 1.1.6).
3. 1.1.4, 1.1.7-1.1.9 are checked fibre by fibre from (a).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`](#node-EDC.2-trace-purity-quasi-finite-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist); `SchemeAndStackFoundations:SF.2`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

**Uses that determine the API.**

- SGA 4 XVIII 2.8-2.9: the trace of A¹ and the general trace are built from the curve trace
- SGA 4 XVIII 1.6.9: the effacement lemma needs Tr_{f′} to be an isomorphism on a small neighbourhood
- ClassicalAdicEtaleCohomology:H0 (request to EDC.2:trace-purity): the torsion trace for smooth separated curves over an arbitrary base, compatible with base change and normalized by c₁(O(1))
- EllipticKTheory:E.5 (request to EDC.2:trace-purity): H² of a smooth proper curve via the normalized trace

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.curveTrace` | constructor | Tr_f : R²f_!(f^*F(1)) ⟶ F for a flat compactifiable curve f : X → S and torsion F prime to the residue characteristics. |
| `TauCeti.EtaleDuality.curveTrace_baseChange` | compatibility | Tr_f is compatible with every base change S′ → S. |
| `TauCeti.EtaleDuality.curveTrace_components` | relation | For nonempty opens U_i of the irreducible components, the sum of the Tr_{U_i} factors through Tr_X (SGA 4 XVIII 1.1.4). |
| `TauCeti.EtaleDuality.curveTrace_quasiFiniteFlat` | functoriality | For u : X → Y quasi-finite flat over a curve Y, Tr_{fu} = Tr_f ∘ R²f_!(Tr_u) (1.1.7), and the dual compatibility for a quasi-finite flat base (1.1.8). |
| `TauCeti.EtaleDuality.curveTrace_isIso` | characterisation | If f is smooth with geometrically irreducible fibres, Tr_f is an isomorphism. |
| `TauCeti.EtaleDuality.curveTrace_firstChernClass` | compatibility | For X a proper smooth connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.curveTrace_projectiveLine` | computation | On P¹ over an algebraically closed field, Tr(c₁(O(1))) = 1 ∈ ℤ/n. |
| `TauCeti.EtaleDuality.curveTrace_twoLines` | computation | For X = A¹ ⊔ A¹ over an algebraically closed field, H²_c(X, Λ(1)) ≅ Λ² and Tr_X(a, b) = a + b. |
| `TauCeti.EtaleDuality.curveTrace_empty` | degenerate | For the empty curve, H²_c = 0 and Tr = 0. |
| `TauCeti.EtaleDuality.not_curveTrace_isIso_doubleLine` | non-example | For X = Spec k[x, y]/(y²) (a double line) and n = 2, Tr_X is multiplication by the multiplicity 2 on H²_c(X, ℤ/2(1)) ≅ ℤ/2, hence zero and not an isomorphism. |

**Acceptance examples.**

- P¹ over k algebraically closed: Tr(c₁(O(1))) = 1.
- Two disjoint lines: H²_c ≅ Λ² and Tr is the sum.
- The double line Spec k[x, y]/(y²): Tr is multiplication by 2 on H²_c ≅ ℤ/n, not an isomorphism for n even.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.3, (1.1.3.3), p. 486. Definition over an algebraically closed field, with multiplicities.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 1.1.6, p. 489. Relative curve trace.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 1.1.9, p. 491. Isomorphism criterion.

<a id="node-EDC.2-trace-purity-curve-h1-duality"></a>

#### Poincaré duality on a smooth curve over an algebraically closed field

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let U be a smooth connected curve over an algebraically closed field k and n invertible in k. For every finite locally constant sheaf F of ℤ/n-modules on U and every r, the pairing H^r_c(U, F) × H^{2−r}(U, F^∨(1)) → H²_c(U, μ_n) →Tr ℤ/n is perfect. In particular H¹_c(U, ℤ/n) and H¹(U, μ_n) are dual, and for a tame finite étale cover u : U′ → U the trace Tr_u : H¹_c(U′, ℤ/n) → H¹_c(U, ℤ/n) is (after choosing μ_n ≅ ℤ/n) the transpose of u^* : H¹(U, ℤ/n) → H¹(U′, ℤ/n). The proof uses the Jacobian and Kummer theory and is independent of the general duality theorem.

**Hypotheses.** k algebraically closed, n invertible; U smooth connected (affine or proper). This is the curve input of SGA 4 XVIII §1 and must not be deduced from EDC.1:biduality or EDC.2:pairings (it is used to prove them).

**Construction and proof plan.**

1. Dévissage (Milne LEC 14.7, steps 0-4): both sides vanish outside 0 ≤ r ≤ 2; both are δ-functors in F; a finite map U′ → U reduces F to a direct image of a constant sheaf; removing a point x compares the pair sequences, with H^r_x(U, μ_n) = ℤ/n for r = 2 and 0 otherwise (Kummer on the henselian trait); so it suffices to treat F = ℤ/n on a complete smooth curve X.
2. Complete curve: H⁰ and H² are dual by the trace (EDC.2:trace-purity/curve-trace). In degree 1, Kummer gives H¹(X, μ_n) = Pic(X)[n] = J(k)[n] for the Jacobian J (JacobianChallenge Layer D) and H¹(X, ℤ/n) = Hom(π₁, ℤ/n) = Hom(J[n], ℤ/n) via the Abel-Jacobi pullback of isogenies; the cup product pairing is identified with the Weil pairing on J[n] (Milne LEC 14.8), which is perfect for the principal polarization (AbelianSchemesAndArithmeticModuli A3).
3. Transposition 1.6.6: the trace Tr_u and u^* are adjoint for the cup-product pairing by the projection formula Tr_u(a ∪ u^*b) = Tr_u(a) ∪ b; perfectness on U and U′ then makes Tr_u the transpose of u^* (SGA 4 XVIII 1.6.6, first proof via 1.6.5.1).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); `AbelianSchemesAndArithmeticModuli:A3`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`; `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- U = A¹: H¹_c(A¹, ℤ/n) = 0 = H¹(A¹, μ_n).
- U = G_m: H¹_c(G_m, ℤ/n) ≅ ℤ/n and H¹(G_m, μ_n) = Γ(G_m, O)^×/n ≅ ℤ/n (generated by the Kummer class of the coordinate t), and the pairing is perfect.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 14.7, p. 93. Statement (symbols restored from the page; the text layer drops them).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Example 14.8, p. 93. The Jacobian input.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 1.6.6, p. 545. The transposition statement used for effacement.

<a id="node-EDC.2-trace-purity-curve-effacement-lemma"></a>

#### The fundamental effacement lemma for smooth curves ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`; theorem. Planet: “Fundamental effacement lemma”.

Let f : X → S be a smooth compactifiable curve, x̄ a geometric point of X with image s̄, and n ≥ 1 invertible on S. There exist an étale neighbourhood V of s̄ in S and an étale neighbourhood U of x̄ in X_V, with f′ : U → V, such that R⁰f′_!ℤ/n = 0, the trace map Tr_u : R¹f′_!ℤ/n → R¹f_{V!}ℤ/n of the étale map u : U → X_V is zero, and Tr_{f′} : R²f′_!ℤ/n(1) → ℤ/n is an isomorphism.

**Hypotheses.** f smooth compactifiable of relative dimension one; n invertible on S.

**Construction and proof plan.**

1. R⁰f′_! = 0 holds once f′ is quasi-affine, and Tr_{f′} is an isomorphism once the geometric fibres of f′ are connected (curve-trace, 1.1.9); both are arranged étale-locally by EGA IV 15.6.5 (SGA 4 XVIII 1.6.8).
2. Killing R¹: on a geometric fibre, take the maximal abelian n-torsion Galois cover U′ → U of a connected affine fibre; u^* is zero on H¹(U, ℤ/n), so by EDC.2:trace-purity/curve-h1-duality (1.6.6) Tr_u is zero on H¹_c (SGA 4 XVIII 1.6.7).
3. Spread out the cover and use the acyclicity lemma for smooth morphisms (SGA 4 XV 2.6, imported with smooth base change) to make the images of Tr_u for shrinking U a decreasing filtered system with stationary value zero (SGA 4 XVIII 1.6.9).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](#node-EDC.2-trace-purity-curve-h1-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`](#node-EDC.2-trace-purity-quasi-finite-flat-trace); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- For S = Spec k with k algebraically closed and X = A¹, U := A¹ minus a point with the n-th power cover already kills R¹.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme fondamental 1.6.9, p. 548. Statement.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.2, p. 481-482. The inputs of the proof.

<a id="node-EDC.2-trace-purity-affine-space-trace"></a>

#### The trace isomorphism for affine space

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/AffineSpace`; namespace: `TauCeti.EtaleDuality`.

For a quasi-compact quasi-separated S, the standard vector bundle a_d : E^d_S = A^d_S → S, and a torsion sheaf F on S prime to the residue characteristics, there is an isomorphism Tr_{a_d} : R^{2d}a_{d!}a_d^*F(d) → F defined by induction: Tr_{a_0} = id, Tr_{a_1} is the curve trace (an isomorphism by 1.1.9), and Tr_{a_{d+1}} is the composite of Tr_{a_d} and R^{2d}a_{d!}(Tr_{a_1}) through E^{d+1} = E¹ ×_S E^d. Its source and target commute with base change; it is invariant under permutation of coordinates (any connected algebraic group acting on E^d acts trivially on R^{2d}a_{d!}).

**Hypotheses.** S quasi-compact quasi-separated; F torsion prime to the residue characteristics.

**Construction and proof plan.**

1. Induction via the composition isomorphism R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_! (maximal-degree argument in the Leray spectral sequence, SGA 4 XVIII 2.7).
2. Permutation invariance: the affine group acts on the base-change-compatible sheaf R^{2d}a_{d!}F(d), and a connected group acts trivially (2.8.2).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); `mathlib:AlgebraicGeometry.AffineSpace`.

**Uses that determine the API.**

- SGA 4 XVIII 2.9 (Var 4)(II): normalization of the general trace on the affine line
- EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement: smooth morphisms are étale-locally affine spaces

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.affineSpaceTrace` | constructor | Tr_{a_d} : R^{2d}a_{d!}a_d^*F(d) ≅ F. |
| `TauCeti.EtaleDuality.affineSpaceTrace_succ` | relation | Tr_{a_{d+1}} = Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_{a_1}) under E^{d+1} = E¹ ×_S E^d. |
| `TauCeti.EtaleDuality.affineSpaceTrace_perm` | relation | Tr_{a_d} is invariant under permutations of the coordinates. |
| `TauCeti.EtaleDuality.affineSpaceTrace_baseChange` | compatibility | Tr_{a_d} commutes with every base change S′ → S. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.affineSpaceTrace_zero` | degenerate | For d = 0, Tr_{a_0} is the identity of F. |
| `TauCeti.EtaleDuality.affineSpaceTrace_line` | computation | For d = 1 over an algebraically closed field, Tr_{a_1} sends the class in H²_c(A¹, Λ(1)) of a point (Gysin image of 1) to 1. |
| `TauCeti.EtaleDuality.affineSpaceTrace_swap` | characterisation | For d = 2, Tr_{a_2} ∘ σ^* = Tr_{a_2} for the coordinate swap σ of A². |
| `TauCeti.EtaleDuality.not_affineSpaceTrace_lower_degree` | non-example | R^q a_{d!}Λ = 0 for q ≠ 2d (d ≥ 1, algebraically closed field): there is no nonzero trace in degree 2d − 1, so a 'trace' placed in any degree but 2d is zero. |

**Acceptance examples.**

- d = 1: the curve trace of A¹; it sends the compactly supported class of a point to 1.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.8, (2.8.1), p. 552-553. Definition.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.8.2, p. 553. Permutation invariance.

<a id="node-EDC.2-trace-purity-flat-trace"></a>

#### The trace morphism Tr_f : R^{2d}f_!f^*F(d) → F ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`; construction. Planet: “Trace morphism Tr_f”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Flat`; namespace: `TauCeti.EtaleDuality`.

Consider triples (f, d, F): f : X → Y compactifiable, d an integer, F a torsion sheaf on Y prime to the residue characteristics, where f satisfies (∗)_d: there is an open U ⊂ X on which f is flat of finite presentation with fibres of dimension ≤ d and the fibres of X − U have dimension < d. There is a unique trace Tr_f : R^{2d}f_!f^*F(d) → F such that (Var 1) it is natural in F; (Var 2) it commutes with base change along Y′ → Y (Y′ quasi-compact quasi-separated); (Var 3) for composable X →g Y →f Z satisfying (∗)_e and (∗)_d, fg satisfies (∗)_{d+e} and Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g) under R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_!; (Var 4)(I) for d = 0 and f finite locally free of rank r, F → f_*f^*F → F is multiplication by r; (II) for the affine line it is the isomorphism (2.8.1). For d = 0 it is the quasi-finite flat trace, for curves the curve trace, for affine space (2.8.1) (Prop. 2.10). It is compatible with Künneth: Tr_{f×g} = Tr_f ⊗ Tr_g (2.12). In derived form, Tr_f : Rf_!(f^*K(d)[2d]) → K for K ∈ D(Y, Λ), Λ killed by n invertible (2.13.2). For Λ = ℤ/n with n ≥ 2, the sheaf trace R^{2d}f_!Λ(d) → Λ is an isomorphism iff every geometric fibre has exactly one d-dimensional irreducible component and its multiplicity is prime to n (Remark 2.10.1). This criterion does not assert that the derived trace Rf_!f^*K(d)[2d] → K is an isomorphism; it is not an iff for arbitrary F, for instance F = 0.

Open obligations: [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** f compactifiable satisfying (∗)_d (e.g. flat of finite presentation of pure relative dimension d); F torsion prime to residue characteristics. Uses only §1.1 of SGA 4 XVIII (not the effacement lemma).

**Construction and proof plan.**

1. Reduction to the dense open U and to the Cohen-Macaulay locus: R^{2d} does not see closed subsets of fibre dimension < d (SGA 4 XVIII 2.1, 2.3) and is computed by étale covers (2.2).
2. Locally on a Cohen-Macaulay flat X, choose a quasi-finite flat map u : X → E^d_Y and set Tr_f := Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_u) (affine-space trace and quasi-finite flat trace); independence of u: two systems of parameters are joined by a chain changing one coordinate at a time (2.5-2.6), and changing one coordinate reduces to the curve case (1.1.7-1.1.8). Glue by uniqueness.
3. Uniqueness: (Var 2) reduces to S an algebraically closed field, and (Var 3)-(Var 4) pin the trace on the generating classes.
4. Künneth compatibility from (Var 3) and the asymmetric description of the Künneth map (SGA 4 XVII 5.4.3.5); the derived form by tensoring with K via the projection formula (2.13.1).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`](#node-EDC.2-trace-purity-quasi-finite-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`](#node-EDC.2-trace-purity-affine-space-trace); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); [`EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`](#node-EDC.0-derived-tensor-and-internal-hom); `mathlib:AlgebraicGeometry.Flat`; `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- SGA 4 XVIII 3.2.1-3.2.5: the adjoint of the derived trace is the purity map t_f : f^*K(d)[2d] → f^!K
- DeligneWeightsAndPurity:DWP.7 (request to EDC.2): the relative trace R^{2N}f_!ℚ_ℓ(N) → ℚ_ℓ compatible with base change
- LefschetzPencilsAndVanishingCycles:LPV.0 (request to EDC.2): the relative trace R^{2n}f_*ℚ_ℓ(n) ≅ ℚ_ℓ for smooth proper f with connected fibres
- ArithmeticStatistics:ST.5 (request to EDC.2): H^{2n}_c of a geometrically irreducible smooth component is ℚ_λ(−n)

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.trace` | constructor | Tr_f : R^{2d}f_!f^*F(d) ⟶ F for f compactifiable satisfying (∗)_d. |
| `TauCeti.EtaleDuality.derivedTrace` | constructor | Tr_f : Rf_!(f^*K(d)[2d]) ⟶ K in D(Y, Λ), natural in K. |
| `TauCeti.EtaleDuality.trace_baseChange` | compatibility | (Var 2): compatibility with base change. |
| `TauCeti.EtaleDuality.trace_comp` | functoriality | (Var 3): Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g). |
| `TauCeti.EtaleDuality.trace_finite` | relation | (Var 4)(I): for d = 0 and f finite locally free of rank r, Tr_f ∘ unit = r. |
| `TauCeti.EtaleDuality.trace_affineLine` | compatibility | (Var 4)(II): for the affine line Tr_f is the isomorphism (2.8.1). |
| `TauCeti.EtaleDuality.trace_kunneth` | compatibility | Tr_{f×g} ∘ (Künneth) = Tr_f ⊗ Tr_g (SGA 4 XVIII 2.12). |
| `TauCeti.EtaleDuality.trace_isIso_iff` | characterisation | For Λ = ℤ/n, n ≥ 2, the sheaf trace R^{2d}f_!Λ(d) → Λ is an isomorphism iff each geometric fibre has one d-dimensional irreducible component of multiplicity prime to n. No such criterion for the derived trace or an arbitrary sheaf F is asserted. |
| `TauCeti.EtaleDuality.higherLowerShriek` | projection | R^q f_!K := ℋ^q(Rf_!K), the sheaf on which the trace is defined. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.trace_projectiveSpace` | computation | For P^d over an algebraically closed field, Tr(c₁(O(1))^d) = 1. |
| `TauCeti.EtaleDuality.trace_dimZero_separable` | computation | For Spec k′ → Spec k finite separable of degree r and d = 0, Tr ∘ unit = r. |
| `TauCeti.EtaleDuality.trace_twoComponents` | computation | Assume Λ ≠ 0. For X = P¹ ⊔ P¹ over an algebraically closed field (d = 1), H²(X, Λ(1)) ≅ Λ² and Tr is the sum, so Tr is surjective but not injective. |
| `TauCeti.EtaleDuality.not_trace_ignores_multiplicity` | non-example | For the double plane X = Spec k[x, y, z]/(z²) over an algebraically closed k and d = 2, Tr is multiplication by 2 on H⁴_c(X, Λ(2)) ≅ Λ; a trace defined without multiplicities (the identity there) violates (Var 4)(I) after a finite flat projection. |

**Acceptance examples.**

- For X = Spec k′ → Spec k finite separable of degree r and d = 0, Tr ∘ unit = r.
- For P^d over an algebraically closed field, Tr(c₁(O(1))^d) = 1.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 2.9, p. 553. Existence and uniqueness with (Var 1)-(Var 4).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 2.10, p. 559. Special cases.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.13, (2.13.2), p. 560. Derived form.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Remarque 2.10.1, p. 559. Isomorphism criterion.

<a id="node-EDC.2-trace-purity-smooth-effacement"></a>

#### Effacement for smooth morphisms (SGA 4 XVIII 2.14)

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement`; theorem.

Let f : X → S be smooth compactifiable of pure relative dimension d and n ≥ 1 invertible on S. For every geometric point x̄ of X over s̄ there are an étale neighbourhood V of s̄ and an étale neighbourhood U of x̄ in X_V, with f′_V : U → V and j : U → X_V, such that R^i f′_{V!}ℤ/n → R^i f_{V!}ℤ/n (the trace of j) is zero for i < 2d and Tr_{f′_V} : R^{2d}f′_{V!}ℤ/n(d) → ℤ/n is an isomorphism. Consequently (2.14.4) the map Rf′_{V!}ℤ/n(d) → Rf_{V!}ℤ/n(d) factors in D^b(V, ℤ/n) through Rf′_{V!}ℤ/n(d) → ℤ/n[−2d], the composite of the truncation and Tr_{f′_V}.

**Hypotheses.** f smooth compactifiable of pure relative dimension d; n invertible.

**Construction and proof plan.**

1. d = 0 is trivial and d = 1 is EDC.2:trace-purity/curve-effacement-lemma. For d ≥ 2, factor f étale-locally as a smooth curve over a smooth morphism of relative dimension d − 1 and iterate, composing traces by (Var 3) of EDC.2:trace-purity/flat-trace.
2. Lemma 2.14.2: in D^b of an abelian category, a composite of 2k morphisms each zero on H^p for p < k between complexes concentrated in [0, k] factors through H^k(K_0)[−k]; apply with 4d successive neighbourhoods to obtain the factorization 2.14.4.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`](#node-EDC.2-trace-purity-curve-effacement-lemma); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Acceptance examples.**

- For f : A^d_S → S and U a suitable étale neighbourhood, the factorization exhibits Rf′_!ℤ/n(d)[2d] → ℤ/n as the pro-trace.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 2.14, p. 560-561. Hypotheses of the effacement theorem.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Corollaire 2.14.4, p. 562. The derived factorization used in the purity proof.

<a id="node-EDC.2-trace-purity-smooth-purity"></a>

#### Smooth purity (Poincaré duality): f^!K ≅ f^*K(d)[2d] ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`; theorem. Planet: “Smooth purity f^! ≅ f^*(d)[2d]”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let f : X → S be smooth and compactifiable, d the locally constant relative dimension, n ≥ 1 invertible on S, and Λ a ring with nΛ = 0. The morphism t_f : f^*K(d)[2d] → f^!K adjoint to the derived trace Tr_f : Rf_!(f^*K(d)[2d]) → K is an isomorphism for every K ∈ D(S, Λ). Hence f^! has finite cohomological amplitude, Rf_! is left adjoint to K ↦ f^*K(d)[2d] with counit Tr_f, and Hom(L, f^*K(d)[2d]) ≅ Hom(Rf_!L, K). The isomorphism is additive over the components of different relative dimension, compatible with composition (t_{gh} = t_h ∘ h^*t_g under (gh)^! ≅ h^!g^!, SGA 4 XVIII 3.2.4), with base change along any S′ → S (via the base-change map of EDC.1:adjoint/base-change-exchange-maps, which is therefore an isomorphism for smooth f), with products (Künneth compatibility of traces) and, for d = 0 (f étale), with the identification f^! = f^* whose counit is the quasi-finite flat trace. The normalization is fixed by Tr(class of a degree-one point) = 1 and Tr(c₁(O(1))) = 1 on P¹.

Open obligations: [Trace compatibility in the proposed replacement purity proof remains to be checked](#gap-EDC0-10).

**Hypotheses.** f smooth compactifiable (S quasi-compact quasi-separated); d : X → ℕ locally constant. Λ any ring killed by n invertible on S, unbounded K allowed. This is smooth purity, not Gabber's absolute purity for regular pairs over arbitrary regular bases.

**Construction and proof plan.**

1. Reduce to d constant. By the localization formula (EDC.1:adjoint/upper-shriek-pseudofunctor) and Stacks More Étale Lemma 16.1, ℋ^q(f^!K) restricted to affine étale U → X is the sheaf associated to U ↦ Hom(R(U → S)_!Λ, K[q]), functorial for étale maps through the traces of étale maps.
2. By the effacement factorization (EDC.2:trace-purity/smooth-effacement, SGA 4 XVIII 2.14.4), the pro-system of R(U → S)_!Λ(d) over étale neighbourhoods U of x̄ is pro-isomorphic, through the traces, to Λ[−2d]; hence the colimit over U of Hom(R(U → S)_!Λ, K[q]) is the colimit over étale neighbourhoods V of s̄ of Hom(Λ(−d)[−2d], K[q]|_V), i.e. ℋ^q(K(d)[2d])_s̄ = ℋ^q(f^*K(d)[2d])_x̄, and the identification is induced by Tr, hence by t_f (this direct stalk argument replaces Deligne's Lemma 3.2.3, whose proof the author did not understand; see sourceIssues).
3. Stalks are conservative (EDC.0/etale-derived-category), so t_f is an isomorphism on D⁺; finite amplitude of f^*(d)[2d] extends it to unbounded K (SGA 4 XVIII 3.2.5 and note 43).
4. Composition (3.2.4), base change and products follow from (Var 2), (Var 3) and Künneth compatibility of Tr (EDC.2:trace-purity/flat-trace) by transposition.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement`](#node-EDC.2-trace-purity-smooth-effacement); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps); [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Acceptance examples.**

- For X = A¹ over an algebraically closed field: a^!Λ ≅ Λ(1)[2].
- For f étale (d = 0): t_f is the identification f^! = f^*.
- For a closed point i : x → C of a smooth curve over an algebraically closed field: i^!Λ ≅ Λ(−1)[−2], from (a_C)^! = Λ(1)[2] and (a_x)^! = Λ.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5 (Dualité de Poincaré), p. 585. Statement.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.4, p. 584-585. Compatibility with composition.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 16.1 (tag 0GLK). The stalk formula for f^! used in the proof.

<a id="node-EDC.2-trace-purity-top-degree-compact-cohomology"></a>

#### Top-degree compactly supported cohomology of a variety

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be separated of finite type of dimension ≤ d over an algebraically closed field k, n invertible in k, Λ = ℤ/n. Then H^q_c(X, F) = 0 for q > 2d and every torsion sheaf F, and étale topological invariance and the reduced smooth loci give H^{2d}_c(X, Λ(d)) ≅ Λ^{C_d}, C_d the set of irreducible components of dimension d, when the structure morphism satisfies (*)_d, its trace on the factor of a component of multiplicity m is multiplication by m. In particular, for X geometrically irreducible of dimension d over a field k₀ with k = k̄₀, H^{2d}_c(X_k, Λ) ≅ Λ(−d) as a Galois module (geometric Frobenius acting by q^d over 𝔽_q). For X smooth connected of dimension d and F locally constant constructible, H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d) (coinvariants); this is EDC.2:pairings/extreme-degree-cohomology.

**Hypotheses.** X separated of finite type over an algebraically closed field (for the Galois statement, base change from k₀).

**Construction and proof plan.**

1. Vanishing above 2d: SGA 4 XVII 5.2.8.1.
2. Remove the smaller-dimensional components and a closed subset of dimension < d (XVIII 2.1). Pass to X_red using étale topological invariance, then to a dense smooth open in each component. Smooth purity identifies each summand with Λ. The trace of 2.9, when (*)_d holds, separately acts on this reduced-cohomology identification with the generic multiplicities (2.10.1); it need not be an isomorphism for nonreduced X.
3. Galois equivariance: use topological invariance to pass to X_red, then a Galois-stable dense smooth open. On that geometrically irreducible smooth open, the trace is an isomorphism and is Galois-equivariant by (Var 2), giving H^{2d}_c(X_k, Λ) ≅ Λ(−d). The possibly noninvertible multiplicity-weighted trace of X itself is not used to deduce this identification.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); `mathlib:IsSepClosed`.

**Acceptance examples.**

- X = P^d: H^{2d}(P^d, Λ(d)) ≅ Λ.
- X = A^d ∪ A^{d−1} (disjoint): H^{2d}_c ≅ Λ.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 2.1, p. 550. Top degree does not see small closed subsets.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Remarque 2.10.1, p. 559. Component count.

### EDC.1:biduality — Exceptional inverse image and Verdier duality — biduality

On a smooth d-dimensional scheme the trace identifies K_X with Λ(d)[2d]. For self-injective finite coefficients, local-system duality has no higher coefficient Ext. Extend to constructible complexes by stratification and recollement, retaining the missing noncircular boundary argument and regular-base input as proof gates. Reverse duality exchanges follow after biduality, and cannot be used to prove it. Global duality is stated separately in relative and geometric form.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.1-biduality-dualizing-complex-of-smooth-scheme"></a>

#### The dualizing complex of a smooth scheme and the dual of a local system

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be smooth of pure dimension d over a field k, n invertible in k, Λ with nΛ = 0. Then K_X ≅ Λ(d)[2d] canonically (via t_a for a : X → Spec k). If moreover Λ is self-injective (e.g. ℤ/ℓⁿ or O/πⁿ) and L is a locally constant constructible sheaf of Λ-modules, then RHom(L, Λ) = L^∨ := Hom(L, Λ) in degree 0 and D_X(L) ≅ L^∨(d)[2d]; the evaluation L → D_X D_X L is an isomorphism. For a smooth closed pair Z ⊂ X of pure codimension c, i^!K_X = K_Z gives i^!Λ_X ≅ Λ_Z(−c)[−2c].

**Hypotheses.** X smooth of pure dimension d over a field k; Λ killed by n invertible. Self-injectivity of Λ is used for L^∨ to be the derived dual; over ℤ_ℓ the derived dual has Ext terms (EDC.2:pairings/adic-and-rational-poincare-duality).

**Construction and proof plan.**

1. K_X = a^!Λ ≅ a^*Λ(d)[2d] = Λ(d)[2d] by EDC.2:trace-purity/smooth-purity.
2. For L locally constant constructible, ℰxt^q(L, Λ) is computed étale-locally where L is constant with finite stalk M, and Ext^q_Λ(M, Λ) = 0 for q > 0 because Λ is self-injective (EDC.1:biduality/self-injective-coefficients); so RHom(L, Λ(d)[2d]) = L^∨(d)[2d], and biduality reduces to M ≅ Hom(Hom(M, Λ), Λ) for finitely generated modules over a self-injective artinian ring (Matlis duality).
3. Closed pair: i^!K_X ≅ K_Z by composition, then cancel twists (EDC.3/smooth-pair-purity gives the canonical form).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](#node-EDC.1-adjoint-dualizing-complex); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients`](#node-EDC.1-biduality-self-injective-coefficients).

**Acceptance examples.**

- X a smooth curve over an algebraically closed field: K_X ≅ Λ(1)[2].

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586. Dual of a local system over a self-injective ring.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5, p. 586. K_X ≅ Λ(d)[2d].

<a id="node-EDC.1-biduality-self-injective-coefficients"></a>

#### ℤ/ℓⁿ and O/πⁿ are self-injective

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients`; lemma. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let O be a discrete valuation ring with uniformizer π (for example ℤ_ℓ or the ring of integers O_E of a finite extension E/ℚ_ℓ) and n ≥ 1. Then Λ = O/πⁿ is injective as a module over itself. Consequently Hom_Λ(−, Λ) is exact on Λ-modules, Ext^q_Λ(M, Λ) = 0 for q > 0, and M → Hom(Hom(M, Λ), Λ) is an isomorphism for finitely generated M. For Λ = ℤ/ℓ² the module ℤ/ℓ is not projective, so finite-level duality is a statement about the self-injective ring, not about a field.

**Hypotheses.** O a discrete valuation ring; n ≥ 1.

**Construction and proof plan.**

1. Baer's criterion (Mathlib Module.Baer): the ideals of O/πⁿ are πᵏO/πⁿ; a map πᵏO/πⁿ → O/πⁿ sends πᵏ to an element killed by π^{n−k}, which lies in π^kO/πⁿ, so it extends to multiplication by an element.
2. Matlis duality for the artinian local Gorenstein ring O/πⁿ gives the double-dual isomorphism on finitely generated modules (each is a sum of O/πᵏ).

**Prerequisites.** `mathlib:Module.Injective`; `mathlib:Module.Baer.injective`; `mathlib:ZMod`.

**Acceptance examples.**

- Hom_{ℤ/ℓ²}(ℤ/ℓ, ℤ/ℓ²) ≅ ℤ/ℓ, generated by 1 ↦ ℓ.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586. Self-injectivity is what turns derived duality into ordinary duals.

<a id="node-EDC.1-biduality-constructible-biduality"></a>

#### Verdier biduality on constructible complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`; theorem. Planet: “Verdier biduality”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be separated of finite type over a field k (or over a regular noetherian base of dimension ≤ 1 such as ℤ[1/ℓ]), n invertible, and Λ = O/πⁿ (more generally a noetherian self-injective ring killed by n). Then D_X preserves D^b_c(X, Λ) and D_ctf(X, Λ), and for K ∈ D^b_c(X, Λ) the evaluation ev_K : K → D_X D_X K is an isomorphism. Hence D_X : D^b_c(X, Λ)^op → D^b_c(X, Λ) is an anti-equivalence with D_X² ≅ id. For a general finite coefficient ring the statement is restricted to D_ctf, and no biduality is asserted for non-Gorenstein Λ.

Open obligations: [Constructible biduality dévissage and the regular-base extension are not closed](#gap-EDC0-6).

**Hypotheses.** X separated of finite type over a field (for the regular one-dimensional base, SGA 4½ [Th. finitude] 4.3, as DWP.7 requests); n invertible. Λ self-injective (Gorenstein of dimension 0) and noetherian; over ℤ_ℓ or ℚ_ℓ biduality is obtained by passage to the limit in EDC.6. Uses the finiteness theorem (Rj_* and Ri^! preserve D^b_c), imported through SchemeAndStackFoundations SF.2.

**Construction and proof plan.**

1. Both sides are triangulated in K, so by dévissage along a stratification X = ⊔ X_α into smooth connected locally closed strata on which the ℋ^q K are locally constant (the stratification exists by constructibility, refined to smooth strata because the reduced strata are generically smooth over a perfect closure; over an imperfect field use a purely inseparable base change, which does not change étale sites), and the localization triangles j_!j^* → id → i_*i^* →, it suffices to treat K = (j_α)_!L with L locally constant on a smooth stratum.
2. Exchange (EDC.1:adjoint/formal-duality-exchange): D_X((j_α)_!L) ≅ R(j_α)_*D_{X_α}L, and on the smooth stratum D(L) = L^∨(d)[2d] (EDC.1:biduality/dualizing-complex-of-smooth-scheme). Constructibility of R(j_α)_* (imported finiteness) gives D_X preserves D^b_c.
3. Biduality for (j_α)_!L: apply D again; D_X(Rj_*M) ≅ j_!D_U(M) for M ∈ D^b_c(U) is the dual statement, proved by induction on dim X using the same dévissage on X − U and the identity i^!Rj_* = 0; the local calculation on a smooth stratum is L ≅ L^∨∨ (self-injectivity).
4. Review gate: the induction and regular one-dimensional base extension in the preceding steps are not established by the cited smooth calculation; see the constructible-biduality gap. The reverse exchange cannot be imported from the dependent duality-exchange-isomorphisms node.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange`](#node-EDC.1-adjoint-formal-duality-exchange); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`](#node-EDC.1-adjoint-local-cohomology-identification); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = Spec Ω (Ω separably closed): biduality is M ≅ Hom(Hom(M, Λ), Λ) on perfect complexes over Λ = ℤ/ℓⁿ.
- X a smooth curve, K = j_*L for j : U → X dense open and L locally constant: D_X(j_*L) ≅ j_*(L^∨)(1)[2] (used for Weil I 2.12).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, (3.2.6.1), p. 586. The smooth-stratum calculation that the dévissage reduces to.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.2, p. 481. This is the introduction describing §2 (trace and smooth calculations), not a citation proving general constructible biduality. A source and proof of the missing dévissage are still required.

<a id="node-EDC.1-biduality-duality-exchange-isomorphisms"></a>

#### Duality exchanges f_* with f_! and f^* with f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`; theorem.

Under the hypotheses of EDC.1:biduality/constructible-biduality, for f : X → S a morphism of schemes separated of finite type over k and constructible complexes: D_S ∘ Rf_* ≅ Rf_! ∘ D_X on D^b_c(X, Λ) and D_X ∘ f^! ≅ f^* ∘ D_S on D^b_c(S, Λ); in particular, for i : Z → X closed and j : U → X open, D_Z i^* ≅ i^! D_X, D_X i_* ≅ i_* D_Z, D_U j^* ≅ j^* D_X and D_X Rj_* ≅ j_! D_U. Moreover D_X(K ⊗^L L) ≅ RHom(K, D_X L) for K, L ∈ D^b_c, and f^! preserves D^b_c.

Open obligations: [Constructible biduality dévissage and the regular-base extension are not closed](#gap-EDC0-6).

**Hypotheses.** As in constructible-biduality; constructibility of Rf_* and f^! is part of the conclusion (f^! via f^! = D f^* D).

**Construction and proof plan.**

1. Apply D to the formal exchanges D_S Rf_! ≅ Rf_* D_X and D_X f^* ≅ f^! D_S (EDC.1:adjoint/formal-duality-exchange) and use biduality on both sides; constructibility of f^!K follows from f^!K ≅ D_X f^* D_S K.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange`](#node-EDC.1-adjoint-formal-duality-exchange).

**Acceptance examples.**

- For i the inclusion of a closed point of a smooth curve C over an algebraically closed field: i^!Λ ≅ D(i^*D_C Λ) = D(Λ(1)[2]) = Λ(−1)[−2].

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.10 and 3.2.6, p. 573 and 586. The sheafified adjunction from which the exchange isomorphisms follow after biduality.

<a id="node-EDC.1-biduality-recollement-adjunctions"></a>

#### Open-closed recollement on constructible complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`; theorem. Planet: “Open–closed recollement”.

Let X be separated of finite type over a field, i : Z → X closed with open complement j : U → X, Λ = O/πⁿ (or a self-injective noetherian ring killed by n invertible). On D^b_c the six functors i^*, i_* = i_!, i^!, j_!, j^* = j^!, Rj_* satisfy: i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣ Rj_*; i_*, j_! and Rj_* are fully faithful; j^*i_* = 0, i^*j_! = 0 and i^!Rj_* = 0; and there are distinguished triangles j_!j^*K → K → i_*i^*K → and i_*i^!K → K → Rj_*j^*K →, natural in K. Duality exchanges the two triangles. These are the recollement data (BBD 1.4.3) that EDC.5 uses to glue the perverse t-structure.

Open obligations: [Constructible biduality dévissage and the regular-base extension are not closed](#gap-EDC0-6).

**Hypotheses.** X separated of finite type over a field; constructible coefficients; Λ as in constructible-biduality.

**Construction and proof plan.**

1. The adjunctions and triangles hold on the unbounded categories (EDC.0/cohomology-with-supports, EDC.1:adjoint/local-cohomology-identification); constructibility of Rj_* and i^! (imported finiteness and EDC.1:biduality/duality-exchange-isomorphisms) restricts them to D^b_c.
2. The vanishing statements are checked on stalks (j^*i_*) or by adjunction (i^!Rj_* = right adjoint of j^*i_* = 0).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`](#node-EDC.1-adjoint-local-cohomology-identification); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = A¹, Z = {0}: for K = Λ the second triangle has i^!Λ = Λ(−1)[−2] and Rj_*Λ with stalk at 0 equal to Λ ⊕ Λ(−1)[−1]: both triangles and all shifts are verified (the closed-point acceptance test of EDC.1).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8, p. 571. The two exceptional inverse images of the recollement.

<a id="node-EDC.1-biduality-relative-and-geometric-duality"></a>

#### Global Verdier duality over a field: relative and geometric forms ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`; theorem. Planet: “Global Verdier duality”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be separated of finite type over a field k with a : X → Spec k, n invertible, Λ = O/πⁿ (or self-injective, killed by n). (a) Relative duality in D(k_ét, Λ): Ra_*D_X K ≅ RHom(Ra_!K, Λ) for every K ∈ D(X, Λ), as complexes of Gal(k_s/k)-modules. (b) Geometric duality: for X̄ := X ⊗_k k_s, RΓ(X̄, D_X̄ K̄) ≅ RHom_Λ(RΓ_c(X̄, K̄), Λ), and for K ∈ D^b_c, H^{−q}(X̄, D K̄) ≅ Hom_Λ(H^q_c(X̄, K̄), Λ) since Λ is self-injective. The relative form is not the same as a statement about absolute cohomology RΓ(X, −) = RΓ(k, Ra_*−): for X = Spec 𝔽_q and K = Λ, the absolute groups RΓ(X, D_X Λ) = RΓ(𝔽_q, Λ) are Λ in degrees 0 and 1, while RHom_Λ(RΓ(𝔽_q, Λ), Λ) is Λ in degrees 0 and −1, so the absolute analogue of (b) is false. Over ℤ_ℓ the derived dual and its Ext terms are retained (EDC.6 and EDC.2:pairings/adic-and-rational-poincare-duality).

**Hypotheses.** X separated of finite type over a field k; n invertible in k. (a) holds for all K ∈ D(X, Λ); the degreewise form in (b) uses self-injectivity of Λ.

**Construction and proof plan.**

1. (a) is EDC.1:adjoint/sheafified-adjunction (a) for a with L := K and K := Λ, using a^!Λ = K_X (EDC.1:adjoint/dualizing-complex).
2. For the displayed geometric duality, apply sheafified adjunction directly to ā : X_k̄ → Spec k̄. Do not commute Ra_* across the field extension by the proper base change theorem when a is not proper. Any separate comparison of the original relative duality object with its geometric stalk requires its own constructibility/base-change hypotheses.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](#node-EDC.1-adjoint-dualizing-complex); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients`](#node-EDC.1-biduality-self-injective-coefficients); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = Spec k: (a) is RHom(K, Λ) ≅ RHom(K, Λ).
- X = Spec 𝔽_q, K = Λ: relative duality holds in D(𝔽_q,ét, Λ), while the absolute form fails in degrees ±1 (H¹(𝔽_q, Λ) = Λ against Ext^{−1} = Λ in degree −1), as the stage requires to be tested.
- X = P¹ over an algebraically closed field: H^{−q}(X, D Λ) = H^{2−q}(X, Λ(1)) is dual to H^q(X, Λ).

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586. Geometric global duality over an algebraically closed field.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.6 (tag 0GLD). Relative form.

### EDC.2:pairings — Smooth trace, relative purity and Poincaré duality — pairings

Identify the adjunction pairing with cup product followed by the normalized trace. Keep the sign, Tate twist, Galois action and the degreewise self-injectivity hypothesis visible. Integral passage retains the universal-coefficient Ext terms; rational passage gives perfect finite-dimensional pairings. The curve j_* theorem uses the underived extension and its monodromy invariant/coinvariant calculation. Tensor-Hom orders and the field-coefficient hypotheses on nontrivial rank-one monodromy matter for the applications.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.2-pairings-poincare-duality-torsion"></a>

#### Poincaré duality for smooth varieties with torsion coefficients ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`; theorem. Planet: “Poincaré duality pairing”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be smooth, separated, of finite type and of pure dimension d over a separably closed field k, n invertible in k, Λ = O/πⁿ (e.g. ℤ/ℓⁿ), and F a locally constant constructible sheaf of Λ-modules. Then RΓ(X, F^∨(d)[2d]) ≅ RHom_Λ(RΓ_c(X, F), Λ), and for every i the pairing H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → H^{2d}_c(X, Λ(d)) →Tr Λ is a perfect pairing of finitely generated Λ-modules. For X proper, H_c = H. For general Λ killed by n the derived statement holds with F^∨ := RHom(F, Λ) and the degreewise statement needs self-injectivity.

**Hypotheses.** k separably closed (for a general k apply to X ⊗ k_s with Galois action: EDC.2:pairings/galois-frobenius-equivariance). X smooth separated of pure dimension d; F locally constant constructible; Λ = O/πⁿ.

**Construction and proof plan.**

1. Combine EDC.1:biduality/relative-and-geometric-duality (b) with D_X F = F^∨(d)[2d] (EDC.1:biduality/dualizing-complex-of-smooth-scheme).
2. The adjunction isomorphism is given by evaluation F ⊗ F^∨ → Λ followed by the counit R a_!a^!Λ → Λ. Taking cohomology identifies this map with cup product and the smooth trace; this is the formal evaluation/counit calculation, independent of the later cup-product-trace-pairing node.
3. Finiteness of H^i_c and H^i: imported finiteness theorem.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](#node-EDC.1-biduality-relative-and-geometric-duality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = P¹, F = Λ: H⁰ × H²(Λ(1)) → Λ and H¹ = 0.
- X = G_m, F = Λ: H¹_c(G_m, Λ) ≅ Λ is dual to H¹(G_m, Λ(1)) ≅ Λ.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, (3.2.6.2), p. 586. Statement.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 24.1, p. 144. Pairing form (symbols restored from the page).

<a id="node-EDC.2-pairings-cup-product-trace-pairing"></a>

#### The duality pairing is cup product followed by the trace; graded symmetry

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; theorem.

In the situation of EDC.2:pairings/poincare-duality-torsion, the pairing defined by the duality isomorphism equals ⟨x, y⟩ = Tr_X(x ∪ y) for x ∈ H^i_c(X, F), y ∈ H^{2d−i}(X, F^∨(d)), where ∪ : H^i_c(X, F) ⊗ H^j(X, G) → H^{i+j}_c(X, F ⊗ G) is the cup product and F ⊗ F^∨ → Λ is evaluation. For F = Λ and X proper, the cup-product pairing H^i(X, Λ) × H^{2d−i}(X, Λ(d)) → Λ satisfies ⟨x, y⟩ = (−1)^{i(2d−i)}⟨y, x⟩ = (−1)^i ⟨y, x⟩ after identifying Λ(d) ⊗ Λ ≅ Λ ⊗ Λ(d); in the middle degree i = d with d odd, graded commutativity proves alternation when 2 is invertible in Λ, and with d even it proves symmetry. The curve alternation for all n follows separately from the Weil pairing (curve-h1-duality); no general 2-primary alternation is deduced from the Koszul sign alone. For smooth proper f : X → S of relative dimension d with connected geometric fibres, R^{2d}f_*Λ(d) ≅ Λ via Tr_f and the fibrewise pairings R^jf_*Λ ⊗ R^{2d−j}f_*Λ → R^{2d}f_*Λ → Λ(−d) are morphisms of sheaves compatible with base change, so monodromy preserves them.

**Hypotheses.** As in poincare-duality-torsion; for the relative form f smooth proper with geometrically connected fibres, n invertible on S.

**Construction and proof plan.**

1. The duality isomorphism is the adjoint of Tr through the evaluation K ⊗^L D K → K_X; on cohomology this is cup product with the evaluation map followed by Tr (SGA 4 XVIII 3.2.6, Milne LEC 24.1 discussion).
2. Graded commutativity of the cup product on H*(X, Λ) (Koszul sign (−1)^{ij}), with i(2d − i) ≡ i mod 2. To infer ⟨x,x⟩ = 0 from 2⟨x,x⟩ = 0 require 2 invertible, or the separate curve Weil-pairing argument.
3. Relative form: Tr_f is an isomorphism for connected geometric fibres (EDC.2:trace-purity/flat-trace, isomorphism criterion) and commutes with base change (Var 2); R^jf_* = R^jf_! commutes with base change (proper base change, imported).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](#node-EDC.2-trace-purity-curve-h1-duality).

**Acceptance examples.**

- Curve (d = 1): the pairing on H¹ is alternating, matching the Weil pairing on J[n] (Milne LEC 14.8).
- Surface (d = 2): the pairing on H² is symmetric; on P¹ × P¹ its matrix in the basis of the two rulings is [[0, 1], [1, 0]].

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §24, p. 145. The pairing is cup product.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 2.12, p. 559-560. Trace compatible with products, used for the cup product form.

<a id="node-EDC.2-pairings-galois-frobenius-equivariance"></a>

#### Galois and Frobenius equivariance of the Poincaré pairing

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`; theorem.

Let X₀ be smooth separated of finite type of pure dimension d over a field k₀, X = X₀ ⊗ k_s, and F₀ locally constant constructible on X₀. The pairing H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → Λ of EDC.2:pairings/poincare-duality-torsion is Gal(k_s/k₀)-equivariant (Λ with trivial action). Over k₀ = 𝔽_q with geometric Frobenius F: for the untwisted pairing H^i_c(X, Λ) × H^{2d−i}(X, Λ) → H^{2d}_c(X, Λ) ≅ Λ(−d), one has ⟨Fx, Fy⟩ = q^d⟨x, y⟩. Consequently, if F acts on H^i_c with eigenvalue α then q^d/α is an eigenvalue of F on H^{2d−i}, with multiplicities preserved. Eigenvalue multisets and their algebraic multiplicities are statements for field coefficients (𝔽_ℓ or, after adic-and-rational-poincare-duality, ℚ_ℓ), not for modules over ℤ/ℓᵐ. The torsion-ring conclusion is the equivariance of the pairing itself.

**Hypotheses.** k₀ arbitrary for Galois equivariance; k₀ = 𝔽_q for the Frobenius statement.

**Construction and proof plan.**

1. Trace and cup product are compatible with base change (Var 2) and hence with the Galois action; the twist Λ(d) carries the cyclotomic character.
2. Geometric Frobenius acts on Λ(−d) by q^d (EDC.0/tate-twist).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](#node-EDC.2-pairings-cup-product-trace-pairing); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist).

**Acceptance examples.**

- X = P¹ over 𝔽_q: F acts on H⁰ by 1 and on H² by q, and ⟨F·1, Fy⟩ = q⟨1, y⟩.
- Elliptic curve E over 𝔽_q: the Frobenius eigenvalues α, β on H¹ satisfy αβ = q.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.4), p. 281. The Galois-equivariant rational pairing and eigenvalue reciprocity. Finite-level equivariance follows from trace base change; eigenvalues require field coefficients.

<a id="node-EDC.2-pairings-adic-and-rational-poincare-duality"></a>

#### ℓ-adic and rational Poincaré duality, with the integral derived form kept separate ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; theorem. Planet: “ℓ-adic Poincaré duality”.

Let X be smooth separated of finite type of pure dimension d over a separably closed field k, E/ℚ_ℓ finite with ring of integers O_E and uniformizer π, ℓ invertible in k, and F a lisse O_E-sheaf (compatible system (F_m) of locally constant constructible O_E/π^m-sheaves). With H^i_c(X, F) := lim_m H^i_c(X, F_m) and H^i(X, F^∨(d)) := lim_m H^i(X, F_m^∨(d)) (finitely generated O_E-modules), there is a derived duality RΓ(X, F^∨(d)[2d]) ≅ RHom_{O_E}(RΓ_c(X, F), O_E), hence short exact sequences 0 → Ext¹_{O_E}(H^{2d−i+1}_c(X, F), O_E) → H^i(X, F^∨(d)) → Hom(H^{2d−i}_c(X, F), O_E) → 0. After ⊗E, the pairing H^i_c(X, F_E) × H^{2d−i}(X, F_E^∨(d)) → E is a perfect pairing of finite-dimensional E-vector spaces, Galois-equivariant (Frobenius-equivariant over 𝔽_q).

**Hypotheses.** k separably closed; ℓ invertible; F lisse; finite-level duality is applied at each level O_E/π^m (self-injective). The ℓ-adic realization (limits, Mittag-Leffler for finite groups, finiteness of H^i) is imported from EllAdicRealization through SchemeAndStackFoundations SF.2; the pro-étale comparison is EDC.6.

**Construction and proof plan.**

1. At level m: RΓ(X, F_m^∨(d)[2d]) ≅ RHom_{O/π^m}(RΓ_c(X, F_m), O/π^m) (EDC.2:pairings/poincare-duality-torsion), compatible with reduction (EDC.0/coefficient-change).
2. Pass to the derived limit: R lim of RHom_{O/π^m}(C ⊗^L O/π^m, O/π^m) is RHom_{O_E}(C, O_E) for C a perfect O_E-complex computing RΓ_c(X, F) (finiteness), and the groups are finite so lim¹ vanishes.
3. The universal coefficient sequence for RHom_{O_E}(C, O_E) gives the Ext¹ terms; they are torsion and vanish after ⊗E.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](#node-EDC.2-pairings-galois-frobenius-equivariance); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X a smooth projective curve of genus g, F = ℤ_ℓ: H¹(X, ℤ_ℓ) is free of rank 2g and the pairing H¹ × H¹ → ℤ_ℓ(−1) is perfect (unimodular).
- An Enriques surface over k of characteristic ≠ 2, ℓ = 2: H²(X, ℤ_2) has torsion ℤ/2 and H³(X, ℤ_2) ≅ ℤ/2, illustrating the Ext¹ term; over ℚ_2 the pairing is perfect.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.14) A), p. 283. Passage from torsion to ℓ-adic coefficients.

<a id="node-EDC.2-curve-poincare-duality-with-j-star-statement"></a>

#### Poincaré duality on a projective curve with j_* coefficients (Weil I 2.12)

Node `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`; theorem.

Write Λ for ℚ_ℓ in the rational case and O/πᵐ in the finite-level case. Let X be a projective smooth connected curve over an algebraically closed field k, j : U → X the inclusion of a dense open, ℓ invertible in k, and F a lisse ℚ_ℓ-sheaf (or a locally constant constructible O/πⁿ-sheaf) on U. Then D_X(j_*F) ≅ j_*(F^∨)(1)[2], and the pairing Tr(x ∪ y) : H^i(X, j_*F) ⊗ H^{2−i}(X, j_*F^∨(1)) → H²(X, j_*(F ⊗ F^∨)(1)) → H²(X, Λ(1)) → Λ is a perfect duality, Frobenius-equivariant when X, U and F are defined over 𝔽_q. The stalks of j_*F at the points of X − U are the local monodromy invariants. In the finite-level variant the trace target is Λ = O/πᵐ; in the rational variant it is ℚ_ℓ. The invariant/coinvariant duality used locally is valid for these self-injective finite coefficients.

**Hypotheses.** X projective smooth connected curve over k algebraically closed; F lisse on U; for ℚ_ℓ coefficients pass to the limit as in EDC.2:pairings/adic-and-rational-poincare-duality. The torsion statement needs the dual of j_*F to be j_*(F^∨)(1)[2], which is the local calculation at the punctures.

**Construction and proof plan.**

1. Local calculation (the computation Deligne calls 'pas difficile', Weil I (2.14) E): at a puncture s with inclusion i_s, i_s^*j_*F = F^{I_s} (invariants) and i_s^!j_*F = (F_{I_s})(−1)[−2] (coinvariants), and the duality between invariants and coinvariants of the dual representation gives D(j_*F) ≅ j_*(F^∨)(1)[2] (EDC.1:biduality/constructible-biduality, example).
2. Then global duality (EDC.1:biduality/relative-and-geometric-duality) gives RΓ(X, j_*F^∨(1)[2]) ≅ RHom(RΓ(X, j_*F), Λ), identified with the cup-product pairing (EDC.2:pairings/cup-product-trace-pairing); pass to ℚ_ℓ.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](#node-EDC.1-biduality-relative-and-geometric-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](#node-EDC.2-pairings-cup-product-trace-pairing); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality).

**Acceptance examples.**

- Used in Weil I (3.9) and Weil II (3.3.5) to turn upper weight bounds into lower bounds; the pairing is on j_*F, not on j_!F.
- U = X: the usual Poincaré duality on the curve.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, Théorème (2.12), p. 283. Statement (displayed pairing reconstructed from the OCR fragments).
- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.14) E), p. 283. Import boundary: the local computation is the first proof step.

<a id="node-EDC.2-pairings-extreme-degree-cohomology"></a>

#### Cohomology in degrees 0 and 2d with compact supports

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`; theorem.

Let X be smooth, separated, connected of dimension d ≥ 1 over a separably closed field k, n invertible, and F a locally constant constructible sheaf of Λ-modules (Λ = O/πⁿ) or a lisse ℚ_ℓ-sheaf. (a) H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d), the coinvariants of the monodromy representation, twisted. (b) If X is affine, H⁰_c(X, F) = 0. (c) For d = 1 (a curve, Weil I (2.10)): H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x̄)_{π₁(X, x̄)}(−1). In particular, for a rank-one F over a field coefficient ring with geometrically nontrivial monodromy on a non-proper geometrically connected X, H⁰_c = H^{2d}_c = 0. For finite-ring coefficients require that some monodromy scalar χ(γ)−1 is a unit; nontrivial monodromy alone is insufficient. For example the ℤ/4 Kummer local system on G_m with monodromy −1 has coinvariants ℤ/2.

**Hypotheses.** X smooth connected; for (b) affine (or more generally with no proper component).

**Construction and proof plan.**

1. (a): by EDC.2:pairings/poincare-duality-torsion, H^{2d}_c(X, F) is dual to H⁰(X, F^∨(d)) = ((F_x̄)^∨)^{π₁}(d), and duality exchanges invariants of the dual with coinvariants.
2. (b): a section of F with compact (proper) support on a connected non-proper X is zero (its support is open and closed and proper).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`](#node-EDC.2-trace-purity-top-degree-compact-cohomology).

**Acceptance examples.**

- X = A¹, F = Λ: H⁰_c = 0 and H²_c = Λ(−1).
- X = G_m, F = the Kummer sheaf of a nontrivial character χ of μ_m: H⁰_c = H²_c = 0.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Scholie (2.10), p. 282. Statement for curves (OCR symbols restored).

<a id="node-EDC.2-pairings-lisse-tensor-hom-duality-on-curves"></a>

#### H⁰ and H² of F₁ ⊗ F₂^∨ on a proper curve

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves`; theorem.

Let X be a projective smooth connected curve over an algebraically closed field (or the geometric curve of one over 𝔽_q), and F₁, F₂ lisse ℚ̄_ℓ-sheaves. Then H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁) and H²(X, F₁ ⊗ F₂^∨) ≅ H⁰(X, F₁^∨ ⊗ F₂(1))^∨ = Hom_X(F₁, F₂)^∨(−1), Frobenius-equivariantly for Weil sheaves; on a non-proper U the same holds for H⁰_c = 0 and H²_c by EDC.2:pairings/extreme-degree-cohomology. (Yu prints the two Hom's in the opposite order; see sourceIssues.)

**Hypotheses.** Lisse ℚ̄_ℓ coefficients (via finite E and passage to the limit).

**Construction and proof plan.**

1. F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁) as lisse sheaves, so global sections are Hom_X(F₂, F₁).
2. Poincaré duality (EDC.2:pairings/adic-and-rational-poincare-duality) on the proper curve gives H²(X, G) ≅ H⁰(X, G^∨(1))^∨ with G^∨ = F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂).
3. Frobenius equivariance from EDC.2:pairings/galois-frobenius-equivariance.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](#node-EDC.2-pairings-galois-frobenius-equivariance); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`](#node-EDC.2-pairings-extreme-degree-cohomology).

**Acceptance examples.**

- F₁ = F₂ irreducible: H⁰ and H² are one-dimensional, giving the pole of the self-pair L-function (Yu Prop. 6.1.1).

**Sources.**

- [Yu-2023](https://arxiv.org/pdf/1807.04659v5), §6.1, equations (6.1.1)-(6.1.2), p. 42. The printed formulas, with the Hom arguments reversed; the node states the corrected form (known erratum PAPER-YU-23/E14).

<a id="node-EDC.2-pairings-relative-duality-locally-constant"></a>

#### Relative Poincaré duality for smooth morphisms with locally constant coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/relative-duality-locally-constant`; theorem.

Let f : X → S be smooth compactifiable of pure relative dimension d, n invertible on S, Λ = O/πⁿ, and F a locally constant constructible sheaf of Λ-modules on X such that the R^q f_!(F^∨) are locally constant constructible for all q. Then R^q f_*F ≅ Hom_Λ(R^{2d−q}f_!(F^∨), Λ)(−d) for every q, compatibly with base change; in particular, for f proper smooth the sheaves R^q f_*F and R^{2d−q}f_*(F^∨(d)) are dual local systems. This is the scheme analogue of Berkovich's Theorem 7.4.9 requested by ClassicalAdicEtaleCohomology H5.

**Hypotheses.** f smooth compactifiable of pure relative dimension d; F locally constant constructible with locally constant R^q f_!(F^∨); Λ self-injective.

**Construction and proof plan.**

1. Rf_*RHom(F^∨, f^!Λ) ≅ RHom(Rf_!F^∨, Λ) (EDC.1:adjoint/sheafified-adjunction), with f^!Λ = Λ(d)[2d] (EDC.2:trace-purity/smooth-purity) and RHom(F^∨, Λ) = F.
2. If the R^q f_!F^∨ are locally constant constructible, ℰxt^p(R^q f_!F^∨, Λ) = 0 for p > 0 (self-injectivity, stalkwise), so the spectral sequence degenerates to the stated isomorphism.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients`](#node-EDC.1-biduality-self-injective-coefficients).

**Acceptance examples.**

- f : A^d_S → S, F = Λ: R^q f_*Λ = Λ for q = 0 and 0 otherwise, dual to R^{2d}f_!Λ(d) ≅ Λ.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5, p. 585. The relative setting in which the duality holds.

### EDC.3 — Gysin maps and cycle classes

Use smooth-pair purity and semi-purity to extend supported fundamental classes from the dense smooth locus of an integral cycle over a perfect field. Gysin maps use the adjunction counit and dualizing normalizations, including dimension differences. Projective-bundle freeness defines Chern classes in the fixed lines convention. The additive supported cycle-class map is distinct from its still-open descent to rational equivalence and compatibility with Tor intersection multiplicities. General self-intersection additionally needs the purity-compatible cohomological comparison for the normal-cone deformation.

Coverage: `planned`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.3-smooth-pair-purity"></a>

#### Cohomological purity for a smooth pair ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`; theorem. Planet: “Purity for smooth pairs”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let k be a field, n invertible in k, Λ with nΛ = 0, X smooth over k and i : Z → X a closed immersion with Z smooth over k, of pure codimension c. Then there is a canonical isomorphism i^!Λ_X ≅ Λ_Z(−c)[−2c] in D(Z, Λ); equivalently ℋ^q_Z(Λ_X) = 0 for q ≠ 2c and ℋ^{2c}_Z(Λ(c)) ≅ Λ_Z, and for every locally constant constructible F on X, H^q_Z(X, F) ≅ H^{q−2c}(Z, i^*F(−c)). The generator s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) corresponding to 1 is the fundamental class (EDC.3/fundamental-class); for c = 1 it is the Kummer local class of the divisor Z (EDC.2:trace-purity/first-chern-class). The formula is for a smooth pair over a field; a regular immersion into a singular ambient scheme, or a regular pair over a trait, is not covered (that is Gabber's absolute purity, outside this roadmap's stated scope).

**Hypotheses.** X and Z smooth over the field k; i a closed immersion of pure codimension c. F locally constant constructible for the version with coefficients (projection formula for i^!).

**Construction and proof plan.**

1. Composition of exceptional inverse images: i^!a_X^! ≅ a_Z^! (EDC.1:adjoint/upper-shriek-pseudofunctor), with a_X^!Λ = Λ(d)[2d] and a_Z^!Λ = Λ(d − c)[2(d − c)] (EDC.2:trace-purity/smooth-purity), so i^!Λ_X(d)[2d] ≅ Λ_Z(d − c)[2d − 2c]; cancel the invertible twist and shift (EDC.0/tate-twist).
2. Canonicity: the composite is independent of d (additivity over components) and compatible with étale localization on X; for c = 1, compare with the Kummer local class by reducing étale-locally to Z = {t = 0} ⊂ A¹ × Z and the computation on A¹ (EDC.0/cohomology-with-supports test).
3. Coefficients: i^!(F) ≅ i^*F ⊗ i^!Λ for F locally constant (projection formula / induction formula, EDC.1:adjoint/sheafified-adjunction).
4. Local calculation: a smooth pair is étale-locally isomorphic to the zero section Z → Z × A^c (EGA IV 17.12.2); by étale excision (EDC.0/cohomology-with-supports) and the Künneth formula the canonical isomorphism is the c-fold external product of the point-on-a-line case H²_{0}(A¹, Λ(1)) ≅ Λ, so the identification is independent of the chart and agrees with the composition isomorphism.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`](#node-EDC.1-adjoint-local-cohomology-identification); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist); `mathlib:AlgebraicGeometry.IsClosedImmersion`; `mathlib:AlgebraicGeometry.Smooth`.

**Acceptance examples.**

- A point on a curve: i^!Λ ≅ Λ(−1)[−2].
- A hyperplane P^{n−1} ⊂ P^n: H^q_{P^{n−1}}(P^n, Λ) ≅ H^{q−2}(P^{n−1}, Λ(−1)).

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 16.1, p. 108. Statement over an algebraically closed field (symbols restored from the page).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, p. 576. Composition of f^!, which reduces purity of the pair to smooth purity of X and Z.

<a id="node-EDC.3-semi-purity"></a>

#### Semi-purity: H^q_Z(X, Λ) = 0 for q < 2c

Node `EtaleDualityAndPerverseSheaves:EDC.3/semi-purity`; theorem. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; namespace: `TauCeti.EtaleDuality`.

Let X be smooth over a perfect field k, n invertible, and Z ⊂ X a closed subset of codimension ≥ c. Then H^q_Z(X, F) = 0 and ℋ^q_Z(F) = 0 for q < 2c and every locally constant constructible F. Consequently, for Y ⊂ Z closed of codimension ≥ c + 1 in X, restriction H^{2c}_Z(X, F) → H^{2c}_{Z−Y}(X − Y, F) is an isomorphism (and injective in degree 2c + 1).

**Hypotheses.** X smooth over a perfect field k (so the regular locus of a reduced closed subscheme is smooth and dense); codim Z ≥ c.

**Construction and proof plan.**

1. Induction on dim Z: the singular locus Y of Z_red has smaller dimension; the triple sequence H^q_Y(X) → H^q_Z(X) → H^q_{Z−Y}(X − Y) gives the vanishing from purity for the smooth pair (Z − Y, X − Y) (EDC.3/smooth-pair-purity) and induction for Y (codimension ≥ c + 1, so H^q_Y = 0 for q < 2c + 2) (Milne LEC 23.1).
2. The isomorphism in degree 2c follows from the same sequence.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); `mathlib:PerfectField`.

**Acceptance examples.**

- Z a point on a surface (c = 2): H^q_Z = 0 for q < 4.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Lemma 23.1 (Semi-purity), p. 138. Statement (Λ restored).

<a id="node-EDC.3-fundamental-class"></a>

#### The fundamental class with supports of a cycle ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`; construction. Planet: “Fundamental class with supports”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/FundamentalClass`; namespace: `TauCeti.EtaleDuality`.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ). For an integral closed subscheme Z ⊂ X of codimension c with (smooth, dense) regular locus Z° = Z − Y, the fundamental class s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) is the unique class restricting to the purity generator s_{Z°/(X−Y)} ∈ H^{2c}_{Z°}(X − Y, Λ(c)) (EDC.3/smooth-pair-purity), which exists and is unique by semi-purity. Extend linearly to cycles: for α = Σ m_i[Z_i] of codimension c with support |α|, s_α := Σ m_i s_{Z_i/X} ∈ H^{2c}_{|α|}(X, Λ(c)). For Z smooth it is the image of 1 under purity; for c = 1 and Z a Cartier divisor it is the Kummer local class. Smooth purity is never applied to a singular Z; over an imperfect field, where the regular locus may fail to be smooth, the construction is not asserted.

Open obligations: [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** X smooth over a perfect field k; Z integral of pure codimension c; n invertible. Perfectness of k makes the regular locus of Z smooth and dense (covers finite fields and algebraically closed fields).

**Construction and proof plan.**

1. Semi-purity (EDC.3/semi-purity) with Y = Sing(Z) of codimension ≥ c + 1 in X gives H^{2c}_Z(X) ≅ H^{2c}_{Z°}(X − Y); define s_{Z/X} as the preimage of the purity generator.
2. Compatibility with étale restriction and with open restriction X′ ⊂ X follows from uniqueness.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity); [`EtaleDualityAndPerverseSheaves:EDC.3/semi-purity`](#node-EDC.3-semi-purity); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); `mathlib:AlgebraicGeometry.AlgebraicCycle`; `mathlib:PerfectField`.

**Uses that determine the API.**

- Milne LEC §23: the direct definition of the cycle map uses s_{Z/X} for singular Z via the smooth locus
- EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map: cl(Z) is the image of s_{Z/X} in H^{2c}(X, Λ(c))
- LefschetzPencilsAndVanishingCycles:LPV.0 (request to EDC.3): cycle classes of the generatrices of a quadric
- EtaleDualityAndPerverseSheaves:EDC.4: the exceptional divisor class in the blowup formula

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.fundamentalClass` | constructor | s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) for Z ⊂ X integral of codimension c, X smooth over a perfect field. |
| `TauCeti.EtaleDuality.fundamentalClass_restrict` | characterisation | s_{Z/X} is the unique class restricting to the purity generator on X − Sing(Z). |
| `TauCeti.EtaleDuality.fundamentalClass_smooth` | compatibility | For Z smooth, s_{Z/X} is the image of 1 under purity H⁰(Z, Λ) ≅ H^{2c}_Z(X, Λ(c)). |
| `TauCeti.EtaleDuality.fundamentalClass_divisor` | compatibility | For c = 1 and Z a Cartier divisor, s_{Z/X} is the Kummer local class; its image in H²(X, Λ(1)) is c₁(O(Z)). |
| `TauCeti.EtaleDuality.fundamentalClass_etale` | functoriality | u^*s_{Z/X} = s_{u^{-1}Z/X′} for u : X′ → X étale. |
| `TauCeti.EtaleDuality.fundamentalClassOfCycle` | constructor | s_α ∈ H^{2c}_{\|α\|}(X, Λ(c)) for a codimension-c cycle α, additive in α. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.fundamentalClass_hyperplane` | computation | For a hyperplane H ⊂ P^n over an algebraically closed field, the image of s_{H/P^n} in H²(P^n, Λ(1)) is c₁(O(1)). |
| `TauCeti.EtaleDuality.fundamentalClass_nodalCubic` | computation | For the nodal cubic C ⊂ P² over an algebraically closed field of characteristic ≠ 2, 3, the image of s_{C/P²} is 3c₁(O(1)), computed through the smooth locus. |
| `TauCeti.EtaleDuality.fundamentalClass_whole` | degenerate | For Z = X (c = 0), s_{X/X} = 1 ∈ H⁰(X, Λ). |
| `TauCeti.EtaleDuality.not_fundamentalClass_purity_singular` | non-example | Over an algebraically closed characteristic-zero field with Λ = ℤ/3, let Z = {xy = 0} ⊂ A². The stalk at the crossing of ℋ²_Z(Λ(1)) is Λ², generated by the two branches (local Kummer residues), whereas Λ_Z has stalk Λ. Thus i^!Λ cannot be Λ_Z(−1)[−2]; the fundamental classes of the branches exist without asserting purity for the singular union. |

**Acceptance examples.**

- For a hyperplane H ⊂ P^n, s_{H/P^n} maps to c₁(O(1)) in H²(P^n, Λ(1)).
- For the nodal cubic C ⊂ P², s_{C/P²} maps to 3c₁(O(1)) = c₁(O(3)) although C is singular.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 139. Construction through the dense smooth locus (symbols restored).

<a id="node-EDC.3-gysin-map"></a>

#### Gysin maps and proper pushforward in cohomology ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`; construction. Planet: “Gysin map”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/Gysin`; namespace: `TauCeti.EtaleDuality`.

(a) For a closed immersion i : Z → X of smooth k-schemes of pure codimension c and F locally constant constructible on X, the Gysin map i_* : H^q(Z, i^*F(m)) → H^{q+2c}(X, F(m + c)) is the composite of the purity isomorphism H^q(Z, i^*F(m)) ≅ H^{q+2c}_Z(X, F(m + c)) and forgetting supports. (b) For f : Y → X proper between smooth k-schemes of pure dimensions d_Y and d_X, e := d_Y − d_X, f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) is the map induced by the adjunction Rf_*f^!Λ → Λ and f^!Λ_X ≅ Λ_Y(e)[2e]; for k separably closed it is the transpose of f^* : H^{2d_X−q+2e}_c(X) → H^{2d_Y−q}_c(Y) under Poincaré duality. Properties: f_*(y ∪ f^*x) = f_*y ∪ x (projection formula); (gf)_* = g_*f_*; i_*1 = cl(Z); for X, Y proper over k separably closed, Tr_X ∘ f_* = Tr_Y; for f finite flat of degree δ, f_*f^* = δ; transverse base change g^*i_* = i′_*g′^* for a cartesian square with g transverse to Z.

Open obligations: [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** Smooth schemes over a field k; proper f; F locally constant constructible (twists explicit).

**Construction and proof plan.**

1. (a) from EDC.3/smooth-pair-purity and the localization triangle; (b) from smooth purity for Y and X and the counit of Rf_! = Rf_* ⊣ f^!.
2. Agreement of (a) and (b) for closed immersions: both are adjoint to restriction under duality (Milne LEC 24.2 (b)).
3. Projection formula and composition follow from the projection formula for Rf_* and composition of f^! (EDC.1:adjoint/upper-shriek-pseudofunctor). For general proper f, Tr_X ∘ f_* = Tr_Y is the composition law for adjunction counits after identifying the smooth dualizing complexes. The finite flat degree formula additionally uses (Var 4)(I) of EDC.2:trace-purity/flat-trace.
4. Transverse base change: g^!-compatibility of purity for g transverse (the base change map of EDC.1:adjoint/base-change-exchange-maps is an isomorphism for the smooth pair pulled back transversally).
5. For a general proper map between smooth schemes use the canonical counit Rf_*f^! → id together with the dualizing-complex identifications. The flat top-degree trace transitivity of XVIII 2.9 alone does not cover a nonflat proper map.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps); `mathlib:AlgebraicGeometry.IsProper`; [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](#node-EDC.3-fundamental-class).

**Uses that determine the API.**

- Milne LEC 24.2: Gysin maps defined by duality, with projection formula and degree
- DeligneWeightsAndPurity:DWP.7 (request to EDC.3): Gysin map of a smooth hyperplane section with i_*(i^*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i^*x)
- GeneralizedHeegnerCycles:GH.0 (request to EDC.3): compatibility of cycle classes with correspondences
- EtaleDualityAndPerverseSheaves:EDC.4: weak Lefschetz in its dual Gysin form and the blowup formula

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.gysin` | constructor | i_* : H^q(Z, Λ(m)) → H^{q+2c}(X, Λ(m + c)) for a smooth pair of codimension c. |
| `TauCeti.EtaleDuality.properPushforward` | constructor | f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) for f proper between smooth schemes, e = dim Y − dim X. |
| `TauCeti.EtaleDuality.properPushforward_projection` | relation | f_*(y ∪ f^*x) = f_*y ∪ x. |
| `TauCeti.EtaleDuality.properPushforward_comp` | functoriality | (g ∘ f)_* = g_* ∘ f_*, and id_* = id. |
| `TauCeti.EtaleDuality.gysin_one` | simp | i_*1 = cl(Z). |
| `TauCeti.EtaleDuality.trace_properPushforward` | compatibility | For X, Y proper over k separably closed, Tr_X(f_*y) = Tr_Y(y) on top-degree classes. |
| `TauCeti.EtaleDuality.properPushforward_finiteFlat` | relation | For f finite flat of degree δ, f_*f^* = δ. |
| `TauCeti.EtaleDuality.gysin_baseChange` | compatibility | For a cartesian square with g transverse to Z, g^* ∘ i_* = i′_* ∘ g′^*. |
| `TauCeti.EtaleDuality.gysin_eq_properPushforward` | compatibility | For a closed immersion, the purity Gysin map agrees with the duality pushforward. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.gysin_point_curve` | computation | For a closed point i : x → C of a smooth projective connected curve over an algebraically closed field, Tr_C(i_*1) = 1. |
| `TauCeti.EtaleDuality.gysin_hyperplane_powers` | computation | For i : P^{n−1} → P^n a hyperplane over an algebraically closed field, i_*(h^j) = h^{j+1} in H*(P^n, Λ). |
| `TauCeti.EtaleDuality.properPushforward_id` | degenerate | id_* = id. |
| `TauCeti.EtaleDuality.not_properPushforward_ring_hom` | non-example | Assume Λ ≠ 0. For f : C′ → C finite flat of degree 2 between smooth projective connected curves over an algebraically closed field (n odd), f_*(1_{C′}) = 2 · 1_C ≠ 1_C in H⁰(C, Λ): proper pushforward is H*(C)-linear by the projection formula but not a ring homomorphism. |

**Acceptance examples.**

- Point i : x → C on a smooth projective curve: i_*1 = cl(x) and Tr_C(i_*1) = 1.
- Hyperplane i : P^{n−1} → P^n: i_*(h^j) = h^{j+1}.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2, p. 145. Definition by duality and agreement with the purity Gysin map (symbols restored; see sourceIssues for the misprinted degree).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2 (e)-(f), p. 145. Projection formula and degree.

<a id="node-EDC.3-gysin-sequence"></a>

#### The Gysin sequence

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`; theorem.

For a smooth pair (Z, X) of pure codimension c over a field k, U := X − Z, n invertible and F locally constant constructible on X, there is a long exact sequence … → H^{q−2c}(Z, F(−c)) →i_* H^q(X, F) → H^q(U, F) → H^{q−2c+1}(Z, F(−c)) → …, functorial in F and compatible with base change along k′/k; in particular H^q(X, F) ≅ H^q(U, F) for q < 2c − 1 and H^{2c−1}(X, F) ↪ H^{2c−1}(U, F). The same holds in families: for a smooth pair over a base S with smooth proper structure maps, the sequence of the sheaves R^q f_* is exact.

**Hypotheses.** Smooth pair over a field (or a relative smooth pair over S for the family version); F locally constant constructible.

**Construction and proof plan.**

1. Substitute the purity isomorphism (EDC.3/smooth-pair-purity) into the long exact sequence of the pair (EDC.0/cohomology-with-supports) (Milne LEC 16.2).
2. Family version: apply Rf_* to the localization triangle and use relative purity i^!Λ = Λ(−c)[−2c] for a relative smooth pair (smooth purity for Z → S and X → S, composition).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = P¹, Z = {∞}: 0 → H¹(P¹) = 0 → H¹(A¹) = 0 → H⁰(pt)(−1) → H²(P¹) → H²(A¹) = 0, so H²(P¹, Λ) ≅ Λ(−1).

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Corollary 16.2, p. 108. Statement.

<a id="node-EDC.3-projective-bundle-freeness"></a>

#### Cohomology of a projective bundle is free on powers of ξ

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`; theorem.

Let X be a scheme with n invertible, E a locally free O_X-module of rank m + 1, π : P(E) → X the projective bundle with O(1), and ξ := c₁(O(1)) ∈ H²(P(E), Λ(1)). Then the map ⊕_{j=0}^{m} H^{q−2j}(X, F(−j)) → H^q(P(E), π^*F), (a_j) ↦ Σ π^*a_j ∪ ξ^j, is an isomorphism for every q and every locally constant constructible F on X; equivalently Rπ_*Λ ≅ ⊕_{j=0}^m Λ(−j)[−2j] via ξ^j. This is the input that defines Chern classes; the refined decomposition with Frobenius on every summand, and the blowup formula, are EDC.4's.

**Hypotheses.** X quasi-compact quasi-separated (finite cover by trivializing opens) with n invertible; F locally constant constructible.

**Construction and proof plan.**

1. Case E trivial: P(E) = X × P^m, and H*(P^m_{k̄}, Λ) = Λ[h]/(h^{m+1}) with h = c₁(O(1)) (EDC.3/projective-space-cohomology) plus Künneth (imported) or proper base change for Rπ_*.
2. General case: the map Σ ξ^j ∪ π^*(−) : ⊕ Λ(−j)[−2j] → Rπ_*Λ is a map of complexes on X that is an isomorphism Zariski-locally, hence an isomorphism (Milne LEC 23.2, by Mayer-Vietoris).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = Spec k, E = k^{m+1}: H*(P^m) is free on 1, h, …, h^m.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.2, p. 139. Statement (symbols restored).

<a id="node-EDC.3-chern-classes"></a>

#### Chern classes of vector bundles in étale cohomology ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`; construction. Planet: “Chern classes”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/ChernClass`; namespace: `TauCeti.EtaleDuality`.

Let X be a scheme with n invertible (in applications smooth over a perfect field). For a locally free E of rank m + 1 with π : P(E) → X and ξ = c₁(O_{P(E)}(1)), the Chern classes c_r(E) ∈ H^{2r}(X, Λ(r)) are the unique classes with Σ_{r=0}^{m+1} π^*c_r(E) ∪ ξ^{m+1−r} = 0 and c₀ = 1 (Grothendieck's definition through EDC.3/projective-bundle-freeness). They satisfy: functoriality c_r(f^*E) = f^*c_r(E); normalization c₁(L) is the Kummer class for a line bundle; Whitney formula c_t(E) = c_t(E′)c_t(E″) for 0 → E′ → E → E″ → 0; c_r(E) = 0 for r > rank E; splitting principle. The top Chern class of the normal bundle computes self-intersections (EDC.3/self-intersection-formula).

**Hypotheses.** n invertible; E locally free of finite rank (Zariski-locally free).

**Construction and proof plan.**

1. Existence and uniqueness of the relation from freeness of H*(P(E)) over H*(X) (Grothendieck's method, Milne LEC 23.3).
2. Normalization and convention: P(E) := Proj Sym(E^∨) parametrizes lines in E and O(−1) is the tautological line subbundle; for E = L of rank one, P(L) = X with O(−1) = L, so the relation ξ + c₁(E) = 0 gives c₁(E) = −c₁(O(1)) = c₁(L), the Kummer class (Milne LEC 23.3 (b)).
3. Whitney formula and splitting principle: pull back to the flag bundle, where E has a filtration with line-bundle quotients and π^* is injective (iterate projective-bundle freeness).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`](#node-EDC.3-projective-bundle-freeness); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); `SchemeAndStackFoundations:SF.0`.

**Uses that determine the API.**

- Milne LEC 23.3: Chern classes from the projective-bundle relation
- EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula: c_c(N_{Z/X}) computes i^*i_*
- ExcursionOperatorsAndSpectralAction / GeometricSatakeAndFusion (perfect-scheme Part II): characteristic classes of torsors, built from Chern classes (Zhu A.3.2); routed to the proposed Part II
- CohomologyComparisons:CP.6: comparison of Chern classes across realizations

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.chernClass` | constructor | c_r(E) ∈ H^{2r}(X, Λ(r)) for E locally free. |
| `TauCeti.EtaleDuality.totalChernClass` | data | c(E) = Σ c_r(E), a unit in ⊕ H^{2r}(X, Λ(r)). |
| `TauCeti.EtaleDuality.chernClass_pullback` | functoriality | c_r(f^*E) = f^*c_r(E). |
| `TauCeti.EtaleDuality.chernClass_one_lineBundle` | compatibility | For L invertible, c₁(L) = firstChernClass L and c_r(L) = 0 for r ≥ 2. |
| `TauCeti.EtaleDuality.totalChernClass_whitney` | relation | c(E) = c(E′) ∪ c(E″) for 0 → E′ → E → E″ → 0. |
| `TauCeti.EtaleDuality.chernClass_eq_zero_of_rank_lt` | simp | c_r(E) = 0 for r > rank E. |
| `TauCeti.EtaleDuality.chernClass_projectiveBundle_relation` | characterisation | Σ_r π^*c_r(E) ∪ ξ^{rank E − r} = 0 in H^{2 rank E}(P(E), Λ(rank E)). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.chernClass_tangent_projectiveSpace` | computation | For X = P^m over an algebraically closed field, c(T_{P^m}) = (1 + h)^{m+1} in Λ[h]/(h^{m+1}). |
| `TauCeti.EtaleDuality.chernClass_trivial` | degenerate | c(O_X^r) = 1. |
| `TauCeti.EtaleDuality.chernClass_sum_lines` | computation | Assume Λ ≠ 0. c(O(1) ⊕ O(1)) = (1 + h)² on P^m, so c₂ = h² ≠ 0 for m ≥ 2. |
| `TauCeti.EtaleDuality.not_chernClass_two_of_line` | non-example | For a line bundle L, c₂(L) = 0 although c₁(L)² may be nonzero (e.g. L = O(1) on P²): c₂ is not c₁². |

**Acceptance examples.**

- c(T_{P^m}) = (1 + h)^{m+1}.
- c(O ⊕ O(1)) on P^m is 1 + h.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 140. Definition (Milne writes ch_r for c_r; symbols restored).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.3, p. 140. Axioms.

<a id="node-EDC.3-cycle-class-map"></a>

#### The étale cycle class map CH^r(X) → H^{2r}(X, Λ(r)) ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; construction. Planet: “Cycle class map”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Duality/CycleClass`; namespace: `TauCeti.EtaleDuality`.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ, and with ℤ_ℓ, ℚ_ℓ coefficients by passage to the limit). The cycle class of a codimension-r cycle α is cl_X(α) := image of the fundamental class s_α ∈ H^{2r}_{|α|}(X, Λ(r)) in H^{2r}(X, Λ(r)). The map cl_X : Z^r(X) → H^{2r}(X, Λ(r)) is additive and factors through rational equivalence, giving cl_X : CH^r(X) → H^{2r}(X, Λ(r)) (Chow groups imported from SchemeAndStackFoundations SF.5). For r = 1 it is c₁ ∘ (divisor ↦ line bundle); it is compatible with flat pullback, with proper pushforward (Gysin maps of EDC.3/gysin-map), with intersection products (cl(α · β) = cl(α) ∪ cl(β) for properly intersecting cycles, hence a ring homomorphism CH*(X) → ⊕ H^{2r}(X, Λ(r)) for X smooth quasi-projective), and with the Galois action (cl is Gal(k̄/k)-equivariant into H^{2r}(X_k̄, Λ(r))). For X proper over k̄, Tr_X(cl(point)) = 1, so Tr ∘ cl = degree on 0-cycles. No comparison between numerical and homological equivalence is asserted.

Open obligations: [Cycle-class descent to Chow groups and intersection multiplicities need a proof](#gap-EDC0-7); [Suggested Lean declarations do not yet implement every packet signature](#gap-EDC0-9).

**Hypotheses.** X smooth over a perfect field; for the ring structure X smooth quasi-projective (moving lemma imported with the intersection product from SF.5). Over an imperfect field the construction through the smooth locus is not asserted (inseparable descent is outside this stage).

**Construction and proof plan.**

1. Additivity by construction; flat pullback and étale-local nature from EDC.3/fundamental-class.
2. For W smooth, a principal divisor maps to i_{W*}c₁(O(div f)) = 0. Extending this argument to singular integral W is an open proof gate: Sing(W) may have codimension r in X, so semi-purity does not justify the proposed restriction argument. Supply the normalization/proper-pushforward or deformation proof recorded in the cycle-class gap.
3. Proper pushforward: cl(f_*α) = f_*cl(α) from the trace compatibility of fundamental classes (finite case: (Var 4); generically finite by restriction to an open; contracted components push forward to 0 in both).
4. Intersection compatibility requires the non-routine identification of cup products of supported fundamental classes with Serre Tor multiplicities. The intended comparison SGA 4½ [Cycle] 2.3.8 needs a registered public source and a proof outline. Milne LEC 23.4 explicitly omits the comparison proof and does not close this gate.
5. Galois equivariance and Tr(cl(point)) = 1 from base change of purity and the normalization of the trace.
6. Review gate: the singular rational-equivalence and Tor-multiplicity steps above are unproved by this chain. The recorded gap is part of this target; Milne 23.4 is not an alternative proved prerequisite.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](#node-EDC.3-fundamental-class); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/semi-purity`](#node-EDC.3-semi-purity); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); `SchemeAndStackFoundations:SF.5`; `mathlib:AlgebraicGeometry.AlgebraicCycle`; `mathlib:AlgebraicGeometry.AlgebraicCycle.map`.

**Uses that determine the API.**

- MotivesAndAlgebraicCycles:MC.2 (request to EDC.3): ℓ-adic cycle class map compatible with pullback, pushforward, intersection and with Tr(cl(point)) = 1
- WeilConjectures:WC.6 (request to EDC.3): actual CH^j cycle map, Galois/Frobenius equivariance in ℚ_ℓ(j) and intersection compatibility
- GeneralizedHeegnerCycles:GH.1 (request via GH.0): étale cycle classes and homological triviality of generalized Heegner cycles
- WeightsInEtaleCohomology:R34.5 (request to EDC.3): the arithmetic first Chern class η and cup-product naturality

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.cycleClass` | constructor | cl_X : Z^r(X) →+ H^{2r}(X, Λ(r)), on Mathlib AlgebraicCycle X ℤ restricted to codimension r. |
| `TauCeti.EtaleDuality.cycleClass_rationalEquiv` | characterisation | cl_X vanishes on cycles rationally equivalent to zero, so factors through CH^r(X). |
| `TauCeti.EtaleDuality.cycleClass_divisor` | compatibility | For a Cartier divisor D, cl_X(D) = c₁(O(D)). |
| `TauCeti.EtaleDuality.cycleClass_pullback` | functoriality | cl(f^*α) = f^*cl(α) for f flat (and for f between smooth schemes with the refined pullback). |
| `TauCeti.EtaleDuality.cycleClass_pushforward` | functoriality | cl(f_*α) = f_*cl(α) for f proper between smooth schemes. |
| `TauCeti.EtaleDuality.cycleClass_intersection` | relation | cl(α · β) = cl(α) ∪ cl(β) for properly intersecting cycles. |
| `TauCeti.EtaleDuality.trace_cycleClass_point` | simp | Tr_X(cl(x)) = 1 for a closed point of X proper over k separably closed; Tr ∘ cl = deg on 0-cycles. |
| `TauCeti.EtaleDuality.cycleClass_galois` | compatibility | cl is Gal(k̄/k)-equivariant into H^{2r}(X_k̄, Λ(r)); over 𝔽_q geometric Frobenius fixes cl(α) in the twisted group. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.cycleClass_hyperplane` | computation | On P^n over an algebraically closed field, cl(H) = h and cl of a linear subspace of codimension r is h^r. |
| `TauCeti.EtaleDuality.cycleClass_transverse_curves` | computation | For two transverse curves C, D on a smooth projective surface over an algebraically closed field, Tr(cl(C) ∪ cl(D)) = #(C ∩ D). |
| `TauCeti.EtaleDuality.cycleClass_zero` | degenerate | cl_X(0) = 0, and cl_X([X]) = 1 for r = 0. |
| `TauCeti.EtaleDuality.cycleClass_principal` | characterisation | For f a nonzero rational function on X, cl_X(div f) = 0. |
| `TauCeti.EtaleDuality.not_cycleClass_injective` | non-example | For an elliptic curve E over an algebraically closed field, the 0-cycle [p] − [q] (p ≠ q) is not rationally equivalent to 0 but cl([p] − [q]) = 0 in H²(E, Λ(1)): cl is not injective (and nothing about numerical vs homological equivalence is asserted). |

**Acceptance examples.**

- Hyperplanes in P^n: cl(H) = h and cl(H₁ ∩ … ∩ H_r) = h^r for transverse hyperplanes.
- A transverse intersection of two curves on a surface: Tr(cl(C) ∪ cl(D)) = #(C ∩ D).
- Self-intersection of a line on P²: cl(L)² = h², Tr = 1 = deg N_{L/P²}.
- A singular divisor (the nodal cubic in P²): cl(C) = 3h through the fundamental class built on the smooth locus.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 139. Direct definition (symbols restored).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.4, p. 142. The two constructions agree (Milne gives no proof; see the proof steps).

<a id="node-EDC.3-self-intersection-formula"></a>

#### The self-intersection formula

Node `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`; theorem.

For a closed immersion i : Z → X of smooth k-schemes of pure codimension c with normal bundle N = N_{Z/X}, and y ∈ H^q(Z, Λ(m)), one has i^*i_*y = c_c(N) ∪ y in H^{q+2c}(Z, Λ(m + c)); in particular i^*cl(Z) = c_c(N). For c = 1, i^*cl(Z) = c₁(O(Z)|_Z) = c₁(N).

Open obligations: [Self-intersection specialization needs a cohomological comparison](#gap-EDC0-8).

**Hypotheses.** Smooth pair over a field; n invertible.

**Construction and proof plan.**

1. Use the deformation pair (Z × A¹, M°), with fibres (Z, X) at 1 and (Z, N) at 0, supplied by SF.5. Construct its relative fundamental class and establish a cohomological specialization/homotopy comparison compatible with purity; that comparison is the recorded gap, and smoothness of a nonproper family alone is insufficient. Once it is supplied, reduce to the zero-section calculation s^*s_*1 = c_top(N) using the projective-bundle relation on P(N ⊕ O) (EDC.3/chern-classes).
2. For c = 1, directly: i^*c₁(O(Z)) = c₁(O(Z)|_Z) and O(Z)|_Z = N.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](#node-EDC.3-chern-classes); [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.5`.

**Acceptance examples.**

- A line L ⊂ P²: i^*cl(L) = c₁(O_L(1)), degree 1.
- The diagonal Δ ⊂ C × C of a curve of genus g: Tr(cl(Δ) ∪ cl(Δ)) = 2 − 2g.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2 (e), p. 145. The projection formula, which with the self-intersection formula computes i^*i_*.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.3, p. 140. The c = 1 case.

<a id="node-EDC.3-projective-space-cohomology"></a>

#### Cohomology of projective space and degrees

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`; theorem.

Let k be separably closed, n invertible, Λ = ℤ/n. Then H^q(P^m_k, Λ) = 0 for q odd, and ⊕_r H^{2r}(P^m_k, Λ(r)) = Λ[h]/(h^{m+1}) as a ring under cup product, with h = c₁(O(1)) = cl(hyperplane) ∈ H²(P^m, Λ(1)) and Tr(h^m) = 1. More generally, for X smooth projective of pure dimension d over k and L a line bundle, Tr_X(c₁(L)^d) = deg_L(X) := (L^d) mod n, and for i : Y → X a smooth hyperplane section, i_*(i^*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i^*x).

Open obligations: [Cycle-class descent to Chow groups and intersection multiplicities need a proof](#gap-EDC0-7).

**Hypotheses.** k separably closed; X smooth projective for the degree formula (intersection number (L^d) from SF.5).

**Construction and proof plan.**

1. Induction on m with the Gysin sequence for P^{m−1} ⊂ P^m with complement A^m (H^q_c(A^m) concentrated in degree 2m, H^q(A^m) = Λ in degree 0): EDC.3/gysin-sequence, EDC.2:trace-purity/affine-space-trace; h generates H² by the curve trace on a line.
2. Degree formula: in CH*(X), take the integral self-intersection c₁(L)^d and use cl(c₁(L)) = c₁(L), multiplicativity and Tr ∘ cl = degree on 0-cycles (cycle-class-map). This proves the stated degree formula once that compatibility gap is closed; do not divide by a very-ample multiple modulo n.
3. Hyperplane formulas: projection formula and Tr_X ∘ i_* = Tr_Y (EDC.3/gysin-map).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`](#node-EDC.3-gysin-sequence); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`](#node-EDC.2-trace-purity-affine-space-trace); `SchemeAndStackFoundations:SF.5`; [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace).

**Acceptance examples.**

- P¹: H⁰ = Λ, H² = Λ(−1), Tr(h) = 1.
- A smooth quadric surface Q ⊂ P³: Tr(h²) = 2.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), proof of Theorem 23.2, p. 139. Cohomology of projective space (symbols restored).


## Part II — Lefschetz, perversity, comparisons and correspondences

### EDC.4 — Weak Lefschetz, projective bundles and blowups

Artin vanishing and Poincaré duality give low-degree compact-support vanishing on a smooth affine complement, hence weak Lefschetz. The Gysin sequence gives its dual form; universal coefficients give the saturated integral statement. Complete intersections inherit the integral torsion-freeness and high-degree rank-one groups, but powers of the hyperplane class need not be generators when the degree is a nonunit. For blow-ups, build the derived splitting using the unit and exceptional Gysin columns, then check it on stalks; knowledge of the cohomology sheaves alone would not split the complex. Vanishing and restricted subspaces are orthogonal complements without an automatic direct-sum decomposition.

Coverage: `partial`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.4-affine-vanishing-hypercohomology"></a>

#### Artin vanishing for constructible complexes on affine schemes

Node `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`; theorem.

Let k be a separably closed field, n ≥ 1 invertible in k, Λ a noetherian ring with nΛ = 0, and U an affine scheme of finite type over k. (a) For every constructible sheaf F of Λ-modules on U_ét with dim Supp F ≤ e, H^q(U, F) = 0 for q > e (Artin's affine vanishing theorem, SGA 4 XIV 3.1–3.2, imported). (b) Let K ∈ D^b_c(U, Λ) and let d_q ∈ ℤ ∪ {−∞} satisfy dim Supp ℋ^q(K) ≤ d_q for every q (dim ∅ = −∞). Then H^m(U, K) = 0 for every m > max_q (q + d_q). (c) In particular, if dim Supp ℋ^q(K) ≤ −q for all q, then H^m(U, K) = 0 for m > 0; and H^m(U, K) = 0 for m > dim U + max{q : ℋ^q(K) ≠ 0}. The same bounds hold for K ∈ D^b_c(U, O_E) and D^b_c(U, E) (E/ℚ_ℓ finite, ℓ invertible in k), by passage to the limit.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k separably closed; n invertible in k; Λ noetherian with nΛ = 0 (for (a) and (b)). U affine of finite type over k; affineness is essential: H²(P¹, Λ(1)) = Λ although dim P¹ = 1. For O_E and E coefficients, the finiteness and Mittag-Leffler properties of the ℓ-adic formalism are imported (EllAdicRealization through SchemeAndStackFoundations:SF.2).

**Construction and proof plan.**

1. (a) is SGA 4 XIV Corollaire 3.2 (Artin), requested from SchemeAndStackFoundations:SF.2 as part of the constructible-sheaf toolkit of CohomologicalPointCounting; BBD Corollaire 4.1.4 restates it.
2. (b) Use the hypercohomology spectral sequence E₂^{p,q} = H^p(U, ℋ^q K) ⇒ H^{p+q}(U, K), which converges because K is bounded. By (a), E₂^{p,q} = 0 for p > d_q, so every term with p + q = m vanishes when m > q + d_q for all q.
3. (c) is (b) with d_q = −q, respectively d_q = dim U.
4. Adic coefficients: H^m(U, K) = lim_r H^m(U, K ⊗^L O_E/λ^r) for K ∈ D^b_c(U, O_E) (finite groups, Mittag-Leffler), and H^m(U, K ⊗ E) = H^m(U, K) ⊗ E.

**Prerequisites.** `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- U = 𝔸¹_k, F constructible: H^q(𝔸¹, F) = 0 for q ≥ 2; the bound is sharp: H¹(𝔾_m, ℤ/n) ≅ ℤ/n(−1) ≠ 0.
- K = i_{x*}Λ[−q] for a closed point x: d_q = 0, and H^m(U, K) = 0 for m ≠ q, as (b) predicts.
- Non-example: U = P¹ is not affine and H²(P¹, Λ(1)) ≅ Λ, so affineness cannot be dropped.

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 218. Deligne's proof of weak Lefschetz rests on the cohomological dimension of affine varieties (SGA 4 XIV 3.2).
- [SGA4-XIV](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf), XIV, Corollaire 3.2, LNM 305 pp. 159–160. Artin's affine vanishing: cd X ≤ dim X for X affine of finite type over a separably closed field (the retyped text keeps the margin page number 160 and the footnote mark (4)).

<a id="node-EDC.4-compact-support-vanishing-smooth-affine"></a>

#### Vanishing of low-degree compactly supported cohomology of smooth affine varieties

Node `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`; theorem.

Let k be separably closed, n invertible in k, Λ = O/π^m (more generally a noetherian self-injective ring killed by n), U a smooth affine k-scheme of pure dimension d and L a locally constant constructible sheaf of Λ-modules on U. Then H^i_c(U, L) = 0 for i < d. The same holds for a lisse O_E-sheaf or a lisse E-sheaf L (E/ℚ_ℓ finite, ℓ invertible in k).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k separably closed, n invertible; U smooth, affine, of pure dimension d. Λ self-injective, so that Poincaré duality is a perfect pairing degreewise; for O_E use the derived duality and the universal-coefficient sequence. A lisse O_E-sheaf here means locally finite free over O_E; geometric cohomology finiteness and coefficient reduction are used for the integral limit.

**Construction and proof plan.**

1. Poincaré duality (EDC.2:pairings/poincare-duality-torsion): H^i_c(U, L) ≅ Hom_Λ(H^{2d−i}(U, L^∨(d)), Λ).
2. Artin vanishing (EDC.4/affine-vanishing-hypercohomology (a)) with e = d: H^{2d−i}(U, L^∨(d)) = 0 when 2d − i > d, that is i < d.
3. For O_E: the derived duality RΓ_c(U, L) ≅ RHom_{O_E}(RΓ(U, L^∨(d)[2d]), O_E) of EDC.2:pairings/adic-and-rational-poincare-duality and the vanishing of H^j(U, L^∨(d)) for j > d give H^i_c = 0 for i < d (the Ext¹ term involves H^{2d−i+1}, which vanishes for i < d + 1).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- U = 𝔸^d: H^i_c(𝔸^d, Λ) = 0 for i ≠ 2d, in particular for i < d.
- U = 𝔾_m (d = 1): H⁰_c(𝔾_m, Λ) = 0 while H¹_c(𝔾_m, Λ) = Λ ≠ 0 — the bound i < d is sharp.
- Non-example: U = P¹ − ∅ is not affine and H⁰_c(P¹, Λ) = Λ ≠ 0 although d = 1.

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne deduces the vanishing of H^i_c(X − Y) for i < n from affine vanishing and Poincaré duality on the smooth affine X − Y.

<a id="node-EDC.4-weak-lefschetz"></a>

#### The weak Lefschetz theorem ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`; theorem. Planet: “Weak Lefschetz theorem”.

Let k be a separably closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n + 1 with a closed immersion X ⊂ P^N_k, H ⊂ P^N a hyperplane and Y = X ∩ H (scheme-theoretic, Y ≠ X), with inclusion i : Y → X. Let Λ be ℤ/ℓ^m, O_E/λ^m, O_E or E (E/ℚ_ℓ finite), and L a locally constant constructible (respectively lisse) sheaf of Λ-modules on X. Then the restriction i^* : H^q(X, L) → H^q(Y, i^*L) is an isomorphism for q < n and injective for q = n. Y need not be smooth. If X, Y and L are defined over a subfield k₀ with k = k₀^sep, i^* is Gal(k/k₀)-equivariant; over k₀ = 𝔽_q it commutes with the geometric Frobenius.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k separably closed; ℓ invertible in k; X smooth projective of pure dimension n + 1; Y = X ∩ H for a hyperplane H of an embedding X ⊂ P^N. U := X − Y is affine (a closed subscheme of P^N − H ≅ 𝔸^N) and smooth of pure dimension n + 1; these are the only properties of Y used. This theorem is distinct from hard Lefschetz (DeligneWeightsAndPurity:DWP.9) and makes no claim about the nondegeneracy of the intersection form on the vanishing part (EDC.4/vanishing-and-restriction-subspaces). For O_E coefficients use finite-free lisse sheaves. Rational and integral coefficient categories are imported from EDC.6/classical-and-proetale-adic-categories.

**Construction and proof plan.**

1. U = X − Y is affine: X − Y → P^N − H is a closed immersion, hence an affine morphism (mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom), into the affine scheme P^N − H = D_+(h) ≅ Spec of a degree-zero localization (mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec); so U is affine (mathlib:AlgebraicGeometry.isAffine_of_isAffineHom).
2. The localization triangle j_!j^*L → L → i_*i^*L → for j : U → X open and i : Y → X closed (EDC.1:biduality/recollement-adjunctions) gives, X being proper, the exact sequence … → H^q_c(U, L) → H^q(X, L) → H^q(Y, i^*L) → H^{q+1}_c(U, L) → ….
3. By EDC.4/compact-support-vanishing-smooth-affine applied to the smooth affine U of pure dimension n + 1, H^q_c(U, L) = 0 for q < n + 1. Hence i^* is injective for q ≤ n and surjective for q ≤ n − 1.
4. Equivariance: all maps are induced by morphisms of schemes defined over k₀, hence commute with the Galois action (EDC.2:pairings/galois-frobenius-equivariance for the conventions).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`](#node-EDC.4-compact-support-vanishing-smooth-affine); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](#node-EDC.2-pairings-galois-frobenius-equivariance); `mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`; `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec`; `mathlib:AlgebraicGeometry.isAffine_of_isAffineHom`; [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- X = P^{n+1}, Y = P^n a hyperplane: i^* : H^q(P^{n+1}, Λ) → H^q(P^n, Λ) is an isomorphism for q ≤ 2n (EDC.3/projective-space-cohomology), consistent with the theorem.
- X = P¹ × P¹ ⊂ P³ (n + 1 = 2), Y a smooth conic: i^* is injective on H¹ = 0 and an isomorphism on H⁰; on H² (outside the range) the map Λ(−1)² → Λ(−1) is not injective, so the range q ≤ n is sharp.
- n + 1 = 1 (X a smooth projective curve, Y a finite set of points): H⁰(X) → H⁰(Y) is injective.

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 218–219. Deligne's weak Lefschetz: the long exact sequence of relative cohomology together with the vanishing of H^i_c(X − Y) for i < n gives the restriction statement.
- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 299. Weil I derives weak Lefschetz from affine vanishing and Poincaré duality, exactly the route of this node.

<a id="node-EDC.4-weak-lefschetz-gysin"></a>

#### The dual (Gysin) form of weak Lefschetz

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`; theorem.

In the situation of EDC.4/weak-lefschetz assume moreover that Y is smooth (a smooth hyperplane section, of pure dimension n). Then the Gysin map i_* : H^q(Y, i^*L) → H^{q+2}(X, L(1)) is an isomorphism for q > n and surjective for q = n, for Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E and L locally constant constructible (lisse). Equivalently H^{q+2}(X, L(1))/i_*H^q(Y, i^*L) injects into H^{q+2}(U, L(1)), which vanishes for q + 2 > n + 1.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** As in EDC.4/weak-lefschetz, with Y smooth of pure dimension n (smooth pair (Y, X) of codimension 1).

**Construction and proof plan.**

1. The Gysin sequence of the smooth pair (Y, X) (EDC.3/gysin-sequence): … → H^{q+1}(U, L(1)) → H^q(Y, i^*L) →i_* H^{q+2}(X, L(1)) → H^{q+2}(U, L(1)) → ….
2. U = X − Y is affine of dimension n + 1, so H^m(U, L(1)) = 0 for m > n + 1 (EDC.4/affine-vanishing-hypercohomology (a)).
3. Hence i_* is surjective when q + 2 > n + 1 (q ≥ n) and injective when q + 1 > n + 1 (q > n).
4. For field coefficients this is the transpose of EDC.4/weak-lefschetz under Poincaré duality on X and Y (EDC.3/gysin-map: i_* is the transpose of i^*), which gives the same ranges.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`](#node-EDC.3-gysin-sequence); [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz).

**Acceptance examples.**

- X = P^{n+1}, Y = P^n: i_* : H^q(P^n) → H^{q+2}(P^{n+1})(1) sends h^j to h^{j+1}; it is an isomorphism for n < q ≤ 2n and surjective for q = n.
- n = 0: Y a finite set of d points on a curve X; i_* : H⁰(Y) = Λ^d → H²(X, Λ(1)) = Λ is the sum map, surjective.
- The range is sharp: for X = P¹ × P¹ and Y a conic, i_* : H⁰(Y) → H²(X)(1) is not surjective onto Λ² (q = 0 < n = 1).

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne states the Gysin (dual) form of weak Lefschetz.
- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 300. Weil I uses the surjectivity of the Gysin map H^{n−1}(Y)(−1) → H^{n+1}(X) as the dual of weak Lefschetz.

<a id="node-EDC.4-weak-lefschetz-integral"></a>

#### Integral weak Lefschetz: torsion-freeness of the cokernel

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`; theorem.

In the situation of EDC.4/weak-lefschetz with L = ℤ_ℓ (U = X − Y, n + 1 = dim X): the group H^{n+1}_c(U, ℤ_ℓ) is torsion-free, and consequently H^n(Y, ℤ_ℓ)/i^*H^n(X, ℤ_ℓ) is torsion-free. The same holds for O_E in place of ℤ_ℓ.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k separably closed, ℓ invertible; X smooth projective of pure dimension n + 1; Y = X ∩ H a hyperplane section; U = X − Y. RΓ_c(U, ℤ_ℓ) is a perfect complex of ℤ_ℓ-modules with RΓ_c(U, ℤ_ℓ) ⊗^L ℤ/ℓ ≅ RΓ_c(U, ℤ/ℓ) (ℓ-adic formalism imported through SchemeAndStackFoundations:SF.2).

**Construction and proof plan.**

1. Universal coefficients: there is a short exact sequence 0 → H^n_c(U, ℤ_ℓ) ⊗ ℤ/ℓ → H^n_c(U, ℤ/ℓ) → Tor₁^{ℤ_ℓ}(H^{n+1}_c(U, ℤ_ℓ), ℤ/ℓ) → 0.
2. H^n_c(U, ℤ/ℓ) = 0 by EDC.4/compact-support-vanishing-smooth-affine (n < n + 1), so H^{n+1}_c(U, ℤ_ℓ)[ℓ] = Tor₁(H^{n+1}_c(U, ℤ_ℓ), ℤ/ℓ) = 0; a finitely generated ℤ_ℓ-module without ℓ-torsion is torsion-free.
3. The exact sequence H^n(X, ℤ_ℓ) → H^n(Y, ℤ_ℓ) → H^{n+1}_c(U, ℤ_ℓ) of EDC.4/weak-lefschetz embeds H^n(Y)/i^*H^n(X) into the torsion-free H^{n+1}_c(U, ℤ_ℓ).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`](#node-EDC.4-compact-support-vanishing-smooth-affine); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = P^{n+1}: H^{n+1}_c(𝔸^{n+1}, ℤ_ℓ) = 0 (torsion-free) and the cokernel H^n(P^n)/H^n(P^{n+1}) = 0.
- X a smooth projective surface (n = 1) with Y a smooth hyperplane curve: H¹(Y, ℤ_ℓ)/i^*H¹(X, ℤ_ℓ) is a free ℤ_ℓ-module (the vanishing part of the curve's H¹ is saturated).
- Non-example: for the non-affine complement of a non-ample divisor the statement fails in general; the proof uses H^n_c(U, ℤ/ℓ) = 0, which needs U affine.

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne's (4.1.6): the universal coefficient formula gives the torsion-freeness of H^{n+1}_c(X − Y, ℤ_ℓ), hence of H^n(Y, ℤ_ℓ)/H^n(X, ℤ_ℓ).

<a id="node-EDC.4-ample-divisor-weak-lefschetz"></a>

#### Weak Lefschetz for ample divisors and hypersurface sections

Node `EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`; theorem.

Let k be separably closed, ℓ invertible in k, X a smooth projective k-scheme of pure dimension n + 1, ℒ an ample invertible O_X-module, r ≥ 1 and s ∈ Γ(X, ℒ^{⊗r}) with zero scheme Y = V(s) ≠ X. Then the conclusions of EDC.4/weak-lefschetz (restriction H^q(X, L) → H^q(Y, L) bijective for q < n, injective for q = n) and, when Y is smooth, of EDC.4/weak-lefschetz-gysin hold, for Λ = ℤ/ℓ^m, O_E/λ^m, O_E, E. In particular they hold for Y = X ∩ V(F) with F a homogeneous form of degree r on P^N ⊃ X. By induction they hold along a chain X = X_0 ⊃ X_1 ⊃ … ⊃ X_c of smooth successive ample divisors.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth projective of pure dimension n + 1 over k separably closed; ℒ ample; Y the zero scheme of a section of a positive power of ℒ. Only the affineness of X − Y = X_s and its smoothness are used, together with topological invariance of the étale site (Y and Y_red have the same cohomology).

**Construction and proof plan.**

1. X is proper over k and ℒ^{⊗r} is ample, so X_s = X − Y is affine (Stacks, Tag 0EKE: for f universally closed and ℒ f-ample, X_s → S is affine; requested from SchemeAndStackFoundations:SF.0). Ampleness alone does not suffice without properness: on a quasi-affine non-affine X with ℒ = O_X and s = 1, X_s = X.
2. With U = X_s affine and smooth of pure dimension n + 1, the proofs of EDC.4/weak-lefschetz and EDC.4/weak-lefschetz-gysin apply verbatim: they use only EDC.4/compact-support-vanishing-smooth-affine and EDC.4/affine-vanishing-hypercohomology for U.
3. Alternatively, ℒ^{⊗rN} is very ample for N ≫ 0 and s^N is a hyperplane section in the corresponding embedding; Y and V(s^N) have the same reduced subscheme, and étale cohomology only depends on it (topological invariance, imported through SchemeAndStackFoundations:SF.2). For F of degree r on P^N, V(F) is a hyperplane section of the r-th Veronese re-embedding (Weil I, 5.7).
4. Chains: apply the statement to each X_{j+1} ⊂ X_j (each smooth projective) and compose.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`](#node-EDC.4-weak-lefschetz-gysin); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = P^{n+1}, Y a smooth quadric hypersurface (r = 2): H^q(Y) ≅ H^q(P^{n+1}) for q < n.
- n + 1 = 2, X = P², Y a smooth plane cubic curve: H⁰(P²) → H⁰(Y) is an isomorphism (q = 0 < n = 1) and H¹(P²) = 0 → H¹(Y) = Λ² is injective.
- Non-example: ℒ = O(0, 1) on X = P¹ × P¹ is nef but not ample; for Y a fibre P¹ × {pt}, X − Y = P¹ × 𝔸¹ is not affine and H²(X − Y, Λ) = Λ(−1) ≠ 0, so the affine-vanishing input fails; the theorem requires ample ℒ.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. Weil I's Veronese re-embedding turns degree-r hypersurface sections into hyperplane sections.
- [Stacks-Morphisms](https://stacks.math.columbia.edu/download/morphisms.pdf), Morphisms of Schemes, Lemma 44.18, Tag 0EKE. For X proper (universally closed) and ℒ ample, X_s is affine: the complement of an ample divisor in a proper scheme is affine.

<a id="node-EDC.4-complete-intersection-cohomology"></a>

#### Cohomology of smooth complete intersections

Node `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`; theorem.

Let k be separably closed, ℓ invertible in k, and X ⊂ P^N_k a smooth complete intersection of dimension m ≥ 1 (there is a chain P^N = X_N ⊃ X_{N−1} ⊃ … ⊃ X_m = X with each X_r = X_{r+1} ∩ H_r for a hypersurface H_r, all X_r smooth). Let Λ = ℤ/ℓ^a, ℤ_ℓ or ℚ_ℓ and h = c₁(O(1))|_X ∈ H²(X, Λ(1)). Then: (a) for q ≠ m, 0 ≤ q ≤ 2m, H^q(X, Λ) = 0 for q odd and H^q(X, Λ(q/2)) is free of rank one for q even; h^{q/2} generates for q < m. For q > m, a generator is dual to h^{m−q/2} under Poincaré duality, and h^{q/2} is deg(X) times that generator (after the trace normalization); the restriction H^q(P^N, Λ) → H^q(X, Λ) is an isomorphism for q < m. (b) H^m(X, Λ) = Λ(−m/2)·h^{m/2} ⊕ H^m(X, Λ)_0 when m is even (for Λ = ℚ_ℓ, and for ℤ/ℓ^a or ℤ_ℓ when deg X is prime to ℓ), with H^m(X)_0 := ker(∪h : H^m(X) → H^{m+2}(X)(1)); H^m(X) = H^m(X)_0 when m is odd. (c) With ℤ_ℓ coefficients all H^q(X, ℤ_ℓ) are torsion-free. (d) If X is defined over 𝔽_q, the geometric Frobenius acts on H^{2j}(X, ℚ_ℓ), 2j ≠ m, by multiplication by q^j. The comparison of primitive ranks across characteristics is the separate target EDC.6/complete-intersection-betti-comparison; it is not a conclusion of this node.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X a smooth complete intersection in P^N over a separably closed field; ℓ invertible. The splitting in (b) uses that h^m has degree deg X on X (Tr(h^m) = deg X): it is a direct sum over ℚ_ℓ, and over ℤ/ℓ^a or ℤ_ℓ only when deg X is a unit.

**Construction and proof plan.**

1. Induction along the chain X_N = P^N ⊃ … ⊃ X_m = X, each X_r an ample divisor in the smooth projective X_{r+1} (EDC.4/ample-divisor-weak-lefschetz): H^q(X_{r+1}) → H^q(X_r) is bijective for q < r and injective for q = r; the Gysin map H^q(X_r)(−1) → H^{q+2}(X_{r+1}) is bijective for q > r and surjective for q = r (EDC.4/weak-lefschetz-gysin).
2. Hence H^q(X) ≅ H^q(P^N) for q < m (EDC.3/projective-space-cohomology), and by Poincaré duality on X (EDC.2:pairings/poincare-duality-torsion, adic form EDC.2:pairings/adic-and-rational-poincare-duality) H^q(X) for q > m is dual to H^{2m−q}(X), which is Λ·h^{m−q/2} or 0.
3. Torsion-freeness: for each smooth divisor X_r in X_{r+1}, integral weak Lefschetz gives an injection H^r(X_{r+1}, ℤ_ℓ) → H^r(X_r, ℤ_ℓ) with torsion-free cokernel. The source group is in a degree below dim X_{r+1}, hence identified with the free projective-space group by the already proved low-degree calculation. Therefore the middle group of X_r is free as well. Integral Poincaré duality and its universal-coefficient sequence then give freeness in all higher degrees, including degree r+1. This avoids assuming freeness in degree r+1 to prove it in degree r.
4. Splitting (b): Tr_X(h^m) = deg X (EDC.3/projective-space-cohomology, degree formula), so h^{m/2} ∪ h^{m/2} ≠ 0 and Λh^{m/2} is a direct summand complementary to the kernel of ∪h when deg X is invertible in Λ.
5. Frobenius: the low-degree hyperplane powers have eigenvalue q^j in untwisted cohomology. In high degrees use the perfect Frobenius-equivariant pairing with low degrees, whose multiplier is q^m; the resulting eigenvalue is q^j even when h^j is not an integral generator.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](#node-EDC.4-ample-divisor-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`](#node-EDC.4-weak-lefschetz-gysin); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`](#node-EDC.4-weak-lefschetz-integral); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist).

**Acceptance examples.**

- X = P^m itself (N = m): H^m(X)_0 = 0 and every statement reduces to EDC.3/projective-space-cohomology.
- X a smooth plane cubic (m = 1): H¹(X, ℚ_ℓ) = H¹(X)_0 has dimension 2 = b_1^0 for degree 3.
- X a smooth quadric surface in P³ (m = 2, degree 2): H²(X, ℚ_ℓ(1)) = ℚ_ℓh ⊕ H²_0 with dim H²_0 = 1; with ℤ/2 coefficients the splitting fails (deg X = 2 is not invertible), as the hypothesis requires.
- Smooth plane conic with Λ = ℤ/2: H²(X, Λ(1)) ≅ Λ but h = 2[point] = 0. With ℤ₂, h spans an index-two submodule. Thus high-degree freeness must not be stated as generation by h.

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16 (aside on complete intersections), p. 110. Milne gives the low-degree calculation, dual high-degree groups and primitive rational decomposition. The integral refinement uses saturated weak Lefschetz and integral duality; it does not assert that high integral hyperplane powers are generators.

<a id="node-EDC.4-projective-bundle-decomposition"></a>

#### The projective-bundle decomposition with Tate twists and Frobenius ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`; theorem. Planet: “Projective bundle formula”.

Let X be a quasi-compact quasi-separated scheme with n invertible, Λ = ℤ/n or O/π^r. For Λ = O_E or E require additionally that X is of finite type over a field with ℓ invertible and take bounded constructible K. Let V be a locally free O_X-module of rank m + 1, π : P(V) → X the projective bundle and ξ = c₁(O(1)) ∈ H²(P(V), Λ(1)). (a) The map ⊕_{j=0}^{m} Λ_X(−j)[−2j] → Rπ_*Λ_{P(V)} given by ξ^j is an isomorphism in D(X, Λ) (refining EDC.3/projective-bundle-freeness), hence H^q(P(V), π^*K) ≅ ⊕_j H^{q−2j}(X, K(−j)) for every K ∈ D(X, Λ). (b) Ring structure: ⊕_q H^q(P(V), Λ(∗)) = H^∗(X, Λ(∗))[ξ]/(Σ_{r=0}^{m+1} c_r(V) ξ^{m+1−r}). (c) For X smooth over k and π_* the Gysin pushforward (relative dimension m), π_*(π^*a ∪ ξ^j) = 0 for j < m and π_*(π^*a ∪ ξ^m) = a. (d) If X and V are defined over a field k₀ and k = k₀^sep, the decomposition H^q(P(V)_k, Λ) ≅ ⊕_j H^{q−2j}(X_k, Λ)(−j) is Gal(k/k₀)-equivariant; over k₀ = 𝔽_q the geometric Frobenius acts on the j-th summand as F_X ⊗ q^j (untwisted cohomology). (e) For X smooth proper of pure dimension d over k separably closed, the Poincaré pairing on P(V) restricted to the summands j and j' vanishes when j + j' < m and is ⟨π^*a ξ^j, π^*b ξ^{m−j}⟩ = ⟨a, b⟩_X when j + j' = m.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X qcqs with n invertible (for (c) and (e): X smooth, respectively smooth proper, over a field); E locally free of rank m + 1 (Zariski-locally free). Twists and Frobenius conventions are those of EDC.0/tate-twist (geometric Frobenius acts on Λ(−1) by q). The arbitrary-qcqs finite-coefficient decomposition is imported from EDC.3/projective-bundle-freeness. The adic extension uses EDC.6/classical-and-proetale-adic-categories in its finite-type range; the coefficient field and vector bundle are distinct objects.

**Construction and proof plan.**

1. (a) is EDC.3/projective-bundle-freeness for Λ = ℤ/n and O/π^m; for O_E pass to the limit over m (the maps are compatible with reduction), and for E tensor with E.
2. (b) is the definition of Chern classes (EDC.3/chern-classes) together with the freeness in (a).
3. (c) Projection formula for the Gysin map (EDC.3/gysin-map): π_*(π^*a ∪ ξ^j) = a ∪ π_*(ξ^j); π_*(ξ^j) ∈ H^{2j−2m}(X) vanishes for j < m by degree and π_*(ξ^m) = 1 because on a fibre P^m, Tr(ξ^m) = 1 (EDC.3/projective-space-cohomology).
4. (d) ξ is the Chern class of a line bundle defined over k₀, so it is Galois-invariant in H²(P(E)_k, Λ(1)); in untwisted cohomology F^*ξ = q·ξ (EDC.0/tate-twist), which gives the stated action.
5. (e) Tr_{P(E)} = Tr_X ∘ π_* (EDC.3/gysin-map, compatibility of traces), and (c).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`](#node-EDC.3-projective-bundle-freeness); [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](#node-EDC.3-chern-classes); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](#node-EDC.2-pairings-galois-frobenius-equivariance); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- X = Spec k, E = k^{m+1}: P(E) = P^m and (a) is H^∗(P^m) = Λ[ξ]/(ξ^{m+1}) (EDC.3/projective-space-cohomology).
- P¹-bundle over a curve C over 𝔽_q: the geometric Frobenius has eigenvalues those of H^q(C) and q times those of H^{q−2}(C) on H^q(P(E)); e.g. dim H²(P(E)) = 2 with eigenvalues q, q.
- The Frobenius twist on the summand j is q^j, not 1: 'equal Betti numbers' is not enough (the stage forbids merely equating Betti numbers).

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, Theorem 23.2, p. 139. Milne's projective bundle theorem: H^∗(P(E)) is free over H^∗(X) on 1, ξ, …, ξ^m (text-layer rendering of 'ξ', 'P(E)', 'Λ(1)').

<a id="node-EDC.4-blowup-direct-images"></a>

#### Direct images along the blow-up of a smooth centre

Node `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`; theorem.

Let k be a field, ℓ invertible in k, X a smooth k-scheme, i : Z → X a smooth closed subscheme of pure codimension c ≥ 2, π : X̃ = Bl_Z X → X the blow-up, E = π^{−1}(Z) the exceptional divisor with j : E → X̃ and p = π|_E : E → Z, and ζ := c₁(O_E(1)) = −j^*c₁(O_X̃(E)) ∈ H²(E, Λ(1)). Then X̃ is smooth, E is a smooth divisor with E ≅ P(N_{Z/X}) over Z (imported), Λ_X → Rπ_*Λ_X̃ is split injective, and Rπ_*Λ_X̃ ≅ Λ_X ⊕ ⊕_{a=1}^{c−1} i_*Λ_Z(−a)[−2a]; equivalently π_*Λ = Λ, R^{2a}π_*Λ ≅ i_*Λ_Z(−a) for 1 ≤ a ≤ c − 1 (generated by the image of ζ^a under j^*), and R^qπ_*Λ = 0 for all other q > 0. Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth over a field k, Z ⊂ X smooth of pure codimension c ≥ 2; ℓ invertible in k. The geometry of the blow-up (X̃ smooth, E = P(N_{Z/X}), O_X̃(−E)|_E = O_E(1), π an isomorphism over X − Z, π proper) is requested from SchemeAndStackFoundations:SF.0.

**Construction and proof plan.**

1. Over X − Z, π is an isomorphism, so Rπ_*Λ|_{X−Z} = Λ.
2. π is proper, so proper base change (requested from SchemeAndStackFoundations:SF.2) gives (R^qπ_*Λ)_z̄ = H^q(P^{c−1}_{z̄}, Λ) at geometric points z̄ of Z: Λ(−a) for q = 2a ≤ 2(c − 1), 0 otherwise (EDC.3/projective-space-cohomology).
3. Use the adjunction unit for Λ_X and, for 1 ≤ a ≤ c−1, the morphism i_*Λ_Z(−a)[−2a] → Rπ_*Λ_X̃ obtained from p^*, multiplication by ζ^{a−1}, and the exceptional-divisor Gysin map j_*. Their direct sum defines the proposed decomposition morphism.
4. Check this morphism on geometric stalks by proper base change. Off Z it is the identity. Over Z its restriction to E has columns 1 and −ζ^a, since j^*j_*y = −ζ∪y by EDC.3/self-intersection-formula. These form the projective-bundle basis, so the morphism is an isomorphism. The trace π_* splits its first column by the degree-one projection formula. Merely knowing the cohomology sheaves of a complex would not prove a derived splitting.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`](#node-EDC.4-projective-bundle-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](#node-EDC.3-self-intersection-formula); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- Blow-up of a point in a surface (c = 2): R²π_*Λ = Λ_x(−1) at the point x, generated by the class of the exceptional curve.
- c = 3, Z a point in a threefold: R²π_*Λ = Λ_x(−1), R⁴π_*Λ = Λ_x(−2), R¹ = R³ = 0.
- Non-example: for c = 1 the blow-up is an isomorphism and Rπ_*Λ = Λ; the formula's sum over 1 ≤ a ≤ c − 1 is then empty, so no correction term appears.

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, proof of Lemma 33.2, p. 194. Milne computes the direct images along the blow-up of the codimension-two axis by proper base change: π_*Λ = Λ, R²π_*Λ supported on A ∩ X, other R^r = 0.

<a id="node-EDC.4-blowup-formula"></a>

#### The blow-up formula along a smooth centre ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`; theorem. Planet: “Blow-up formula”.

In the situation of EDC.4/blowup-direct-images, for every q the map Φ : H^q(X, Λ) ⊕ ⊕_{a=1}^{c−1} H^{q−2a}(Z, Λ(−a)) → H^q(X̃, Λ), (x, (z_a)) ↦ π^*x + Σ_a j_*(ζ^{a−1} ∪ p^*z_a), is an isomorphism, where j_* : H^{r}(E, Λ(s)) → H^{r+2}(X̃, Λ(s+1)) is the Gysin map of the divisor E. Its inverse has first component π_* (the Gysin pushforward, with π_*π^* = id). Compatibilities: j^*π^*x = p^*i^*x; π_*j_*(ζ^{a−1} ∪ p^*z) = 0 for 1 ≤ a ≤ c − 1 (degree reasons along the fibres P^{c−1}); for X proper over k separably closed, Tr_X̃(π^*x) = Tr_X(x) on top-degree classes; if X, Z are defined over k₀ (k = k₀^sep) Φ is Gal(k/k₀)-equivariant and over 𝔽_q the geometric Frobenius acts on the summand H^{q−2a}(Z)(−a) as F_Z ⊗ q^a (untwisted). Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** As in EDC.4/blowup-direct-images; for Galois and Frobenius statements X and Z are defined over k₀ and the cohomology is that of X_k, Z_k. For cohomology over a non-separably-closed k₀ the decomposition is of Galois modules after base change to k.

**Construction and proof plan.**

1. Apply RΓ(X, −) to Rπ_*Λ_X̃ ≅ Λ_X ⊕ ⊕_a i_*Λ_Z(−a)[−2a] (EDC.4/blowup-direct-images): H^q(X̃) ≅ H^q(X) ⊕ ⊕_a H^{q−2a}(Z)(−a).
2. Identify the summands with Φ: the first is π^* (adjunction unit). For the others, j_*(ζ^{a−1} ∪ p^*z) restricted to E is exactly −ζ^a ∪ p^*z, because j^*j_*y = y ∪ c₁(O(E))|_E = −y ∪ ζ (self-intersection formula, EDC.3/self-intersection-formula); the explicit projective-bundle basis on geometric stalks shows that Φ realises the decomposition.
3. π_*π^* = id: π is proper birational between smooth schemes of the same dimension (EDC.3/gysin-map, projection formula with π_*1 = 1).
4. Traces: Tr_X̃ = Tr_X ∘ π_* (EDC.3/gysin-map) and π_*π^* = id. Equivariance and Frobenius as in EDC.4/projective-bundle-decomposition (d): ζ and the Gysin map of E are defined over k₀ and j_* raises the twist by one.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](#node-EDC.4-blowup-direct-images); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](#node-EDC.3-self-intersection-formula); [`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`](#node-EDC.4-projective-bundle-decomposition).

**Acceptance examples.**

- Blowing up a point x on a smooth projective surface S (c = 2): H²(S̃) = H²(S) ⊕ Λ(−1)·[E] with [E]² = −1, H¹, H³ unchanged; over 𝔽_q the new eigenvalue is q. Checked independently of any Weil bound (the stage's acceptance test).
- Blowing up a point in P³ (c = 3): b₂ and b₄ both increase by one, b_odd unchanged.
- Euler characteristic: χ(X̃) = χ(X) + (c − 1)χ(Z); for c = 1 nothing changes.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 299. Weil I uses the blow-up formula along the smooth codimension-two centre A ∩ X: H*(X̃) = H*(X) ⊕ H^{*−2}(A ∩ X)(−1).
- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, proof of Lemma 33.2, p. 194. Milne obtains H*(X*) ≅ H*(X) ⊕ H*−2(A ∩ X)(−1) from the degenerating Leray spectral sequence of the blow-up.

<a id="node-EDC.4-pencil-axis-blowup"></a>

#### Cohomology of the blow-up along the axis of a pencil

Node `EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup`; application.

Let X ⊂ P^N be a smooth projective k-scheme of pure dimension n + 1 over a separably closed field k (ℓ invertible), and A ⊂ P^N a linear subspace of codimension 2 meeting X transversally, so that A ∩ X is smooth of pure codimension 2 in X (possibly empty). Let π : X̃ = Bl_{A∩X}X → X. Then for Λ = ℤ/ℓ^m, ℤ_ℓ, ℚ_ℓ: H^q(X̃, Λ) ≅ H^q(X, Λ) ⊕ H^{q−2}(A ∩ X, Λ)(−1), via π^* and j_*p^*, with π^* split injective; if X and A are defined over 𝔽_q the decomposition commutes with the geometric Frobenius, which acts on the second summand as q·F_{A∩X}. In particular b_q(X̃) = b_q(X) + b_{q−2}(A ∩ X) and χ(X̃) = χ(X) + χ(A ∩ X). The identification of X̃ with the incidence variety of the pencil and the map X̃ → P¹ belong to LefschetzPencilsAndVanishingCycles:LPV.3 and are not used here.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth projective of pure dimension n + 1; A a codimension-2 linear subspace transverse to X (so A ∩ X is smooth of codimension 2).

**Construction and proof plan.**

1. This is EDC.4/blowup-formula with c = 2, Z = A ∩ X, E = P(N_{Z/X}) a P¹-bundle over Z, ζ⁰ = 1.
2. Frobenius on the summand: EDC.4/blowup-formula (twist (−1) contributes the factor q).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`](#node-EDC.4-blowup-formula).

**Acceptance examples.**

- X = P² ⊂ P³ a plane (n + 1 = 2) and A a line meeting it transversally in one point x: X̃ = Bl_x P², b₂(X̃) = 1 + 1 = 2.
- A ∩ X = ∅: X̃ = X and the second summand vanishes.
- X a smooth surface in P³ and A a line meeting X transversally in d = deg X points: b₂(X̃) = b₂(X) + d.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, proof of Lemme (7.1), p. 299. Weil I passes to the blow-up of X along the smooth codimension-two centre A ∩ X (the axis of the pencil) and uses its cohomology.
- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, Lemma 33.2 and proof, p. 193–194. Milne blows up along the axis A ∩ X of a Lefschetz pencil before applying the Leray spectral sequence of X* → P¹.

<a id="node-EDC.4-pullback-injective-blowup-bundle"></a>

#### Pullback along blow-ups and projective bundles is split injective

Node `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`; theorem.

Let σ : X' → X be either (i) the blow-up of a smooth k-scheme X along a smooth closed subscheme Z of pure codimension c ≥ 2, or (ii) a projective bundle P(E) → X of relative dimension r ≥ 1 over a qcqs X, with ℓ invertible. For Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E, σ^* : H^q(X, Λ) → H^q(X', Λ) is split injective, with retraction π_* in case (i) and a ↦ σ_*(ξ^r ∪ −) in case (ii); the same holds for cohomology with compact supports and for cohomology with supports in a closed subset T ⊂ X and its preimage. In case (ii) with r = 1 the cokernel is H^{q−2}(X, Λ)(−1), and in case (i) the cokernel is ⊕_{a=1}^{c−1} H^{q−2a}(Z, Λ)(−a), so σ^* is bijective in degrees q < 2 (and an isomorphism in all degrees when Z = ∅).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** As in EDC.4/blowup-formula (case (i)) or EDC.4/projective-bundle-decomposition (case (ii)); integral coefficients O_E allowed. The adic projective-bundle case has the finite-type and bounded-constructible range of EDC.4/projective-bundle-decomposition. Supports and compact supports use the same proper derived decomposition, not a new pullback on compact supports for arbitrary nonproper morphisms.

**Construction and proof plan.**

1. (i) EDC.4/blowup-formula: H^q(X') = σ^*H^q(X) ⊕ (exceptional summands), with π_*σ^* = id.
2. (ii) EDC.4/projective-bundle-decomposition (a) and (c).
3. Compact supports and supports in T: apply the same decompositions of Rσ_*Λ (EDC.4/blowup-direct-images, EDC.4/projective-bundle-decomposition (a)), which are isomorphisms in D(X, Λ), to RΓ_c(X, −) and RΓ_T(X, −) (proper base change for σ proper, imported through SchemeAndStackFoundations:SF.2).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`](#node-EDC.4-blowup-formula); [`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`](#node-EDC.4-projective-bundle-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](#node-EDC.4-blowup-direct-images); `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- P¹-bundle over a point: H⁰(pt) → H⁰(P¹) bijective, H²(P¹) = Λ(−1) is the cokernel.
- Blow-up of a point on a surface: σ^* bijective on H⁰, H¹, H³, H⁴ and injective with cokernel Λ(−1) on H².
- Integral coefficients: σ^* is split injective on H^q(X, ℤ_ℓ), so torsion in H^q(X, ℤ_ℓ) injects into H^q(X', ℤ_ℓ).

**Sources.**

- [Liu-Tian-Xiao-Zhang-Zhu-2022](https://arxiv.org/pdf/1912.11942v3), §5.11, Lemma 5.11.3(3), p. 98 (arXiv v3). Liu–Tian–Xiao–Zhang–Zhu use injectivity of the pullback along a blow-up with smooth centre or a P¹-bundle (Lemma 5.11.3(3)–(4)); this node is that statement for étale cohomology with O_λ coefficients.

<a id="node-EDC.4-vanishing-and-restriction-subspaces"></a>

#### Vanishing and restricted subspaces of a hyperplane section, and primitive subspaces

Node `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Lefschetz/VanishingSubspace`; namespace: `TauCeti.EtaleDuality`.

Let k be separably closed, ℓ invertible, E a field of coefficients (finite of characteristic ℓ, or finite over ℚ_ℓ), X a smooth projective k-scheme of pure dimension n + 1 and i : Y → X a smooth hyperplane section (pure dimension n), with Lefschetz class L = c₁(O_X(1)) ∈ H²(X, E(1)). Define the vanishing subspace Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1))) and the restricted subspace Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E)), both E-subspaces of H^n(Y, E). Then, with respect to the Poincaré pairing ⟨y, y'⟩ = Tr_Y(y ∪ y') on H^n(Y, E) (perfect and (−1)^n-symmetric after the identification E(n) ≅ E over k), Res(Y) = Van(Y)^⊥ and Van(Y) = Res(Y)^⊥; dim Res(Y) + dim Van(Y) = dim H^n(Y). Moreover i_*i^* = L ∪ − on H^∗(X). For 0 ≤ q ≤ n + 1 the primitive subspace is P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))). No decomposition H^n(Y) = Res(Y) ⊕ Van(Y) and no Lefschetz decomposition into primitive parts is asserted: both require hard Lefschetz (DeligneWeightsAndPurity:DWP.9).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth projective of pure dimension n + 1 over k separably closed; Y a smooth hyperplane section; field coefficients E (so that orthogonal complements have complementary dimensions).

**Construction and proof plan.**

1. Van(Y) and Res(Y) are kernels and images of E-linear maps between finite-dimensional spaces (finiteness imported through SchemeAndStackFoundations:SF.2).
2. i_* is the transpose of i^* for the Poincaré pairings of Y and X (EDC.3/gysin-map): ⟨i^*x, y⟩_Y = ⟨x, i_*y⟩_X. Hence y ⊥ Res(Y) ⟺ i_*y ⊥ H^n(X) ⟺ i_*y = 0 (perfectness on X, EDC.2:pairings/poincare-duality-torsion), i.e. Res(Y)^⊥ = Van(Y); the pairing on Y is perfect, so Van(Y)^⊥ = Res(Y) and the dimensions add up.
3. i_*i^*x = cl(Y) ∪ x = L ∪ x (EDC.3/projective-space-cohomology, the hyperplane-section formula).
4. P^q(X) is a kernel of an E-linear map; nothing about its complement is claimed.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`](#node-EDC.4-weak-lefschetz-gysin); `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality).

**Uses that determine the API.**

- DeligneWeightsAndPurity:DWP.9 (orthogonal decomposition of a hyperplane section, Weil II 4.3.9): hard Lefschetz upgrades Res(Y) = Van(Y)^⊥ to H^n(Y) = Res(Y) ⊕ Van(Y)
- LefschetzPencilsAndVanishingCycles:LPV.4 (global vanishing cycles): the vanishing cycles of a Lefschetz pencil span Van(Y) and Res(Y) is their orthogonal
- Deligne, Weil II (4.3.1)–(4.3.2): Ev(Y) and Ev(Y)^⊥ for the trace pairing on H^n(Y)

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.vanishingSubspace` | constructor | Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1))) as an E-subspace of H^n(Y, E). |
| `TauCeti.EtaleDuality.restrictedSubspace` | constructor | Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E)) as an E-subspace of H^n(Y, E). |
| `TauCeti.EtaleDuality.restrictedSubspace_eq_orthogonal` | characterisation | Res(Y) = Van(Y)^⊥ for the Poincaré pairing of Y. |
| `TauCeti.EtaleDuality.vanishingSubspace_eq_orthogonal` | characterisation | Van(Y) = Res(Y)^⊥ for the Poincaré pairing of Y. |
| `TauCeti.EtaleDuality.finrank_restricted_add_vanishing` | relation | dim Res(Y) + dim Van(Y) = dim H^n(Y, E). |
| `TauCeti.EtaleDuality.gysin_comp_restriction` | relation | i_* ∘ i^* = L ∪ − : H^q(X, E) → H^{q+2}(X, E(1)). |
| `TauCeti.EtaleDuality.primitiveSubspace` | constructor | P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))) for q ≤ n + 1. |
| `TauCeti.EtaleDuality.vanishingSubspace_galois` | functoriality | If X, Y are defined over k₀, Van(Y) and Res(Y) are Gal(k/k₀)-stable subspaces. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.vanishingSubspace_projectiveSpace` | computation | For X = P^{n+1} and Y = P^n a hyperplane, Van(Y) = 0 and Res(Y) = H^n(Y). |
| `TauCeti.EtaleDuality.restrictedSubspace_planeCubic` | computation | For X=P² embedded by O(3), a smooth plane cubic Y is a hyperplane section; Res(Y)=0 and Van(Y)=H¹(Y,E) has dimension 2. |
| `TauCeti.EtaleDuality.vanishingSubspace_zero_of_curve_point` | degenerate | For n=0, X a smooth connected projective curve and Y a nonempty reduced hyperplane section of d points, Van(Y) is the kernel of the sum map E^d → E and has dimension d−1. |
| `TauCeti.EtaleDuality.not_vanishing_inf_restricted_eq_bot` | non-example | Over 𝔽₂ take X a smooth quadric threefold and Y its smooth quadric surface hyperplane section. H²(Y) ≅ 𝔽₂², Res(Y) is spanned by h = (1,1), and h∪h has trace 2 = 0, so Res(Y) = Van(Y) is nonzero. This detects an unjustified direct-sum axiom. |

**Acceptance examples.**

- X = P^{n+1}, Y = P^n: Van(Y) = 0 for n odd (H^n(Y) = 0) and for n even Van(Y) = 0 since i_* is an isomorphism H^n(P^n) → H^{n+2}(P^{n+1}); Res(Y) = H^n(Y).
- Take X = P² with its O(3) Veronese embedding and Y a smooth plane cubic, which is a hyperplane section for that embedding. Then Res(Y)=0 and Van(Y)=H¹(Y), of dimension 2.
- The intersection Res(Y) ∩ Van(Y) is not asserted to be 0: in characteristic ℓ coefficients E = 𝔽_2 and n even, the restricted class of a quadric hyperplane section can be isotropic; only orthogonality is proved.

**Sources.**

- [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4.3, before Lemme (4.3.2), p. 222. Deligne uses the vanishing part of H^n(Y) and its orthogonal for the trace pairing; this node constructs both as subspaces without the hard-Lefschetz splitting.

### EDC.5 — The early perverse category and intermediate extension

First develop the abstract heart, t-cohomology, t-exactness, recollement and intermediate extension against the existing Mathlib t-structure carriers. Apply gluing to the constructible scheme category, and define j_!* as the image in the heart. The IC input is a shifted local system on a dense smooth open; arbitrary perverse inputs do not have its dense-open independence. Ordinary truncation descriptions require the dimension-ordered filtration and ordinary input bound. Affine vanishing, dimension estimates and small/semismall pushforward then provide the consumer interfaces. Integral coefficients have two tilted perversities p and p⁺, exchanged by duality.

Coverage: `partial`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.5-t-structure-heart-abelian"></a>

#### The heart of a t-structure is abelian

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian`; theorem.

Let C be a triangulated category and t = (C^{≤0}, C^{≥0}) a t-structure on C (Mathlib's TStructure). The heart C^♥ = C^{≤0} ∩ C^{≥0} (Mathlib's TStructure.heart, as a full subcategory) is an abelian category; a sequence 0 → A → B → C → 0 in C^♥ is short exact if and only if it extends to a distinguished triangle A → B → C → A[1] of C, and this extension is unique. Ext¹_{C^♥}(C, A) → Hom_C(C, A[1]) is an isomorphism and Hom_C(A, B[n]) = 0 for n < 0 and A, B ∈ C^♥.

**Hypotheses.** C triangulated (IsTriangulated, octahedral axiom); t a t-structure.

**Construction and proof plan.**

1. Hom_C(A, B[n]) = 0 for n < 0 and A, B in the heart: B[n] ∈ C^{≥1} when n < 0 (Mathlib TStructure.zero').
2. Every morphism f : A → B of the heart is admissible: complete it to a triangle A → B → S → A[1]; S ∈ C^{[−1,0]}, and the truncation triangle τ^{≤−1}S → S → τ^{≥0}S → gives K := (τ^{≤−1}S)[−1] and Q := τ^{≥0}S in the heart with the triangle K[1] → S → Q → required by Mathlib's AbelianSubcategory criterion (BBD 1.2).
3. Apply mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian to the inclusion of the heart (BBD 1.3.6). Short exact sequences ↔ triangles is BBD 1.3.6's proof (1.2.4).

**Prerequisites.** `mathlib:CategoryTheory.Triangulated.TStructure`; `mathlib:CategoryTheory.Triangulated.TStructure.heart`; `mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian`.

**Acceptance examples.**

- The canonical t-structure on D(A) for A abelian (mathlib:DerivedCategory.TStructure.t): the heart is equivalent to A.
- C = 0: the heart is the zero category, abelian.
- Non-example: a triangle of heart objects A → B → C → A[1] with nonzero A[1]-component gives a non-split extension; the heart is not semisimple in general (D^b(ℤ): 0 → ℤ → ℤ → ℤ/2 → 0).

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 1.3.6, p. 31. The heart of a t-category is an admissible abelian subcategory and H⁰ is cohomological.

<a id="node-EDC.5-t-cohomology-functor"></a>

#### Cohomology functors of a t-structure

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`; construction. Intended module: `TauCeti/CategoryTheory/Triangulated/TStructure/Homology`; namespace: `TauCeti.EtaleDuality`.

For a t-structure t on a triangulated category C, the functor H⁰_t := τ^{≥0}τ^{≤0} : C → C^♥ (Mathlib's truncation functors, corestricted to the heart) is a homological functor: it sends distinguished triangles to long exact sequences in the abelian category C^♥ (EDC.5/t-structure-heart-abelian). Set H^n_t(X) := H⁰_t(X[n]). For X ∈ C^♥, H⁰_t(X) ≅ X; for X ∈ C^{≤a} ∩ C^{≥b} (a bounded object), X = 0 if and only if H^n_t(X) = 0 for all n, and X ∈ C^{≤0} if and only if H^n_t(X) = 0 for n > 0.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** C triangulated, t a t-structure; conservativity statements are for bounded objects (t-structures need not be nondegenerate).

**Construction and proof plan.**

1. Define H⁰_t from Mathlib's truncations τ^{≤0}, τ^{≥0} (TStructure.truncLE, truncGE) — the composite lands in the heart.
2. Homological: BBD 1.3.6 (second assertion) — for a triangle X → Y → Z →, the long sequence of H^n_t is exact; proved by reducing to triangles in C^{≤0} and C^{≥0} with the truncation triangles.
3. Conservativity on bounded objects by induction on the length using the truncation triangles.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian`](#node-EDC.5-t-structure-heart-abelian); `mathlib:CategoryTheory.Triangulated.TStructure`; `mathlib:CategoryTheory.Functor.IsHomological`; `mathlib:DerivedCategory.TStructure.t`.

**Uses that determine the API.**

- BBD 1.3.6–1.3.7 and §2.1: perverse cohomology pH^n := H^n_t for the perverse t-structure; the long exact sequences used throughout §§1.4–5
- EtaleDualityAndPerverseSheaves:EDC.7 (decomposition theorem): K ≅ ⊕ pH^i(K)[−i] is stated with the perverse cohomology functors
- LefschetzPencilsAndVanishingCycles:LPV.6: t-exactness of nearby cycles is checked on perverse cohomology

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.TStructure.homologyZero` | constructor | H⁰_t : C ⥤ heart(t), the composite τ^{≥0}τ^{≤0} corestricted to the heart. |
| `TauCeti.EtaleDuality.TStructure.homology` | constructor | H^n_t := H⁰_t ∘ [n] : C ⥤ heart(t). |
| `TauCeti.EtaleDuality.TStructure.homologyZero_isHomological` | instance | H⁰_t is a homological functor (Mathlib Functor.IsHomological). |
| `TauCeti.EtaleDuality.TStructure.homologyZero_obj_heart` | simp | For X in the heart, H⁰_t(X) ≅ X. |
| `TauCeti.EtaleDuality.TStructure.isZero_of_homology_isZero` | characterisation | For X bounded for t, X ≅ 0 iff H^n_t(X) ≅ 0 for all n. |
| `TauCeti.EtaleDuality.TStructure.isLE_iff_homology` | characterisation | For X bounded for t (X ∈ C^{≥a} ∩ C^{≤b} for some a,b), X ∈ C^{≤0} iff H^n_t(X) ≅ 0 for every n > 0. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.homologyZero_canonical` | compatibility | For the canonical t-structure on D(A), H^n_t ≅ the homology functor DerivedCategory.homologyFunctor A n. |
| `TauCeti.EtaleDuality.homologyZero_zero` | degenerate | H⁰_t(0) ≅ 0. |
| `TauCeti.EtaleDuality.homologyZero_shift_ne` | non-example | H⁰_t does not commute with shifts: on D(A), H⁰_t(A[1]) = 0 while H⁰_t(A) = A for A ≠ 0 in A, so H⁰_t is not a triangulated functor. |
| `TauCeti.EtaleDuality.not_isLE_iff_homology_of_bounded_below` | non-example | For the degenerate t-structure (C^{≤0}, C^{≥0}) = (0,C) on a nonzero triangulated category, every object is bounded below and every H^n_t is zero, but nonzero objects are not in C^{≤0}. Bounded below alone does not imply the characterization. |

**Acceptance examples.**

- For the canonical t-structure on D(A), H^n_t agrees with the usual homology functor H^n : D(A) → A.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 1.3.6, p. 31. H⁰ = τ_{≥0}τ_{≤0} with values in the heart is a cohomological functor.

<a id="node-EDC.5-t-exact-functor"></a>

#### Left and right t-exact functors

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`; definition. Intended module: `TauCeti/CategoryTheory/Triangulated/TStructure/Exact`; namespace: `TauCeti.EtaleDuality`.

Let (C₁, t₁), (C₂, t₂) be triangulated categories with t-structures and T : C₁ → C₂ a triangulated functor. T is right t-exact if T(C₁^{≤0}) ⊂ C₂^{≤0}, left t-exact if T(C₁^{≥0}) ⊂ C₂^{≥0}, and t-exact if both. If T is left (right) t-exact, the induced functor pT := H⁰_{t₂} ∘ T ∘ ι : C₁^♥ → C₂^♥ is left (right) exact. For an adjoint pair T* ⊣ T_* of triangulated functors, T* is right t-exact if and only if T_* is left t-exact. Composites of right (left) t-exact functors are right (left) t-exact.

**Hypotheses.** Triangulated functors between triangulated categories with t-structures.

**Construction and proof plan.**

1. Definition by the two inclusions; the adjoint criterion: Hom(T*X, Y) = Hom(X, T_*Y) and the characterisation C^{≤0} = ⊥(C^{≥1}) (BBD 1.3.17 (iii)).
2. Exactness of pT: from the long exact sequence of H⁰_t applied to T of a triangle (EDC.5/t-cohomology-functor), BBD 1.3.17 (i).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](#node-EDC.5-t-cohomology-functor); `mathlib:CategoryTheory.Triangulated.TStructure`.

**Uses that determine the API.**

- BBD 1.4.16 and 4.1.1–4.2.4: exactness properties of j_!, j_*, i^*, i^!, affine and smooth morphisms are stated as t-exactness
- LefschetzPencilsAndVanishingCycles:LPV.6: nearby cycles RΨ[−1] is t-exact for the perverse t-structure
- IgusaVarietiesAndTorsionConcentration:IG.4: semiperversity bounds are one-sided t-exactness statements

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Functor.IsRightTExact` | constructor | T is right t-exact: T(C₁^{≤0}) ⊆ C₂^{≤0}. |
| `TauCeti.EtaleDuality.Functor.IsLeftTExact` | constructor | T is left t-exact: T(C₁^{≥0}) ⊆ C₂^{≥0}. |
| `TauCeti.EtaleDuality.Functor.IsTExact` | constructor | T is t-exact: both. |
| `TauCeti.EtaleDuality.Functor.IsRightTExact.comp` | functoriality | Composites of right t-exact functors are right t-exact. |
| `TauCeti.EtaleDuality.Functor.isRightTExact_iff_isLeftTExact_of_adjunction` | characterisation | For T* ⊣ T_*, T* is right t-exact iff T_* is left t-exact. |
| `TauCeti.EtaleDuality.Functor.heartFunctor` | data | pT := H⁰_{t₂} ∘ T ∘ ι : heart(t₁) ⥤ heart(t₂). |
| `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteColimits` | other | If T is right t-exact, pT is right exact (preserves finite colimits). |
| `TauCeti.EtaleDuality.Functor.IsLeftTExact.comp` | functoriality | Composites of left t-exact functors are left t-exact. |
| `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteLimits` | other | For a triangulated left t-exact T, the induced functor pT preserves finite limits. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.isTExact_id` | degenerate | The identity functor of C is t-exact for every t. |
| `TauCeti.EtaleDuality.isRightTExact_shift_one` | computation | The shift functor [1] is right t-exact for every t. |
| `TauCeti.EtaleDuality.not_isLeftTExact_shift_one` | non-example | For the canonical t-structure on D(A) with A ≠ 0, the shift [1] is not left t-exact. |
| `TauCeti.EtaleDuality.isTExact_canonical_exactFunctor` | compatibility | An exact functor F : A → B of abelian categories induces a t-exact functor D(A) → D(B) for the canonical t-structures. |

**Acceptance examples.**

- The identity is t-exact; the shift [1] is right t-exact and not left t-exact for a nondegenerate t.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 1.3.16, p. 36. Definition of left/right t-exact functors and the adjoint criterion.

<a id="node-EDC.5-recollement-data"></a>

#### Recollement of triangulated categories

Node `EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`; definition. Intended module: `TauCeti/CategoryTheory/Triangulated/TStructure/Recollement`; namespace: `TauCeti.EtaleDuality`.

A recollement of triangulated categories D_F ⟶ D ⟶ D_U consists of triangulated functors i_* : D_F → D and j^* : D → D_U with left and right adjoints i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣ j_*, such that i_*, j_! and j_* are fully faithful, j^*i_* = 0, and for every K ∈ D the adjunction maps extend to distinguished triangles j_!j^*K → K → i_*i^*K → and i_*i^!K → K → j_*j^*K →. Equivalently: i_* identifies D_F with the kernel of j^* and the two triangles exist (BBD 1.4.3). Consequences: i^*j_! = 0, i^!j_* = 0, the triangles are functorial and unique. The main instance is constructible étale sheaves on X with a closed subscheme Z = F and open complement U (EDC.1:biduality/recollement-adjunctions).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** D, D_F, D_U triangulated; the six functors triangulated.

**Construction and proof plan.**

1. Record the six functors and adjunctions as data, and full faithfulness, vanishing and the existence of triangles as properties (BBD 1.4.3).
2. Derived identities: i^*j_! = 0 from Hom(i^*j_!A, B) = Hom(A, j^*i_*B) = 0; uniqueness of the connecting maps from Hom(j_!j^*K, i_*i^*K[−1]) = 0 (BBD 1.1.10).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions); `mathlib:CategoryTheory.Functor.IsTriangulated`.

**Uses that determine the API.**

- BBD 1.4.10: a t-structure on D is glued from t-structures on D_U and D_F
- EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure: induction over a stratification glues the perverse t-structure
- GeometricSatakeAndFusion:GS1: the relative perverse t-structure is glued along Schubert strata

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Recollement` | constructor | The structure of a recollement: i_*, j^*, their adjoints i^*, i^!, j_!, j_* with the adjunctions, full faithfulness, j^*i_* ≅ 0 and the two triangles. |
| `TauCeti.EtaleDuality.Recollement.triangleLowerShriek` | data | The functorial distinguished triangle j_!j^*K → K → i_*i^*K → (j_!j^*K)[1], with the adjunction maps and its connecting map. |
| `TauCeti.EtaleDuality.Recollement.triangleUpperShriek` | data | The functorial distinguished triangle i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]. |
| `TauCeti.EtaleDuality.Recollement.upperStar_lowerShriek_eq_zero` | relation | i^* ∘ j_! ≅ 0 and i^! ∘ j_* ≅ 0. |
| `TauCeti.EtaleDuality.Recollement.ofClosedOpen` | constructor | The constructible étale recollement for Z ⊂ X closed with open complement U. |
| `TauCeti.EtaleDuality.Recollement.op` | other | The opposite recollement on the opposite categories exchanges j_! with j_* and i^* with i^!. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.recollement_ofClosedOpen_empty` | degenerate | For Z = ∅, i_* = 0 and j^* is an equivalence D(X) ≌ D(U). |
| `TauCeti.EtaleDuality.recollement_ofClosedOpen_upperStar` | compatibility | In Recollement.ofClosedOpen, j^* is the restriction functor pullback j of the imported étale operations. |
| `TauCeti.EtaleDuality.recollement_triangle_point` | computation | For X = 𝔸¹, Z = {0}, K = Λ_X: the triangle j_!Λ_U → Λ_X → i_*Λ_Z → is the localization triangle. |
| `TauCeti.EtaleDuality.not_recollement_without_adjoints` | non-example | A semiorthogonal decomposition D = ⟨D_F, D_U⟩ with only a left adjoint to i_* is not a recollement: both adjoints of i_* and j^* are required for gluing t-structures. |

**Acceptance examples.**

- The étale recollement for Z ⊂ X closed with open complement U satisfies the axioms (EDC.1:biduality/recollement-adjunctions).

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 1.4.3 (1.4.3.1)–(1.4.3.2), p. 44. The axioms of a recollement situation (i_*, j^* with adjoints, triangles).

<a id="node-EDC.5-glued-t-structure"></a>

#### Gluing t-structures along a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`; theorem.

Given a recollement D_F ⟶ D ⟶ D_U (EDC.5/recollement-data) and t-structures t_F on D_F and t_U on D_U, D^{≤0} := {K : j^*K ∈ D_U^{≤0}, i^*K ∈ D_F^{≤0}} and D^{≥0} := {K : j^*K ∈ D_U^{≥0}, i^!K ∈ D_F^{≥0}} form a t-structure on D (BBD 1.4.10). For it: j_! and i^* are right t-exact, j_* and i^! are left t-exact, i_* and j^* are t-exact (BBD 1.4.16); the induced functors on hearts satisfy pj^* ∘ pi_* = 0 and p(i_*) identifies D_F^♥ with the objects A of D^♥ with j^*A = 0. Boundedness of t_F and t_U implies boundedness of the glued t-structure.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** A recollement; t-structures on D_F and D_U.

**Construction and proof plan.**

1. Axiom (i) (Hom(D^{≤0}, D^{≥1}) = 0) from the first triangle of K and the adjunctions; axiom (ii) by shift invariance; axiom (iii) (truncation triangles) by the two-step construction of BBD 1.4.10 using τ_U and τ_F and the octahedral axiom.
2. Exactness (1.4.16) from the definitions and EDC.5/t-exact-functor's adjoint criterion.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`](#node-EDC.5-recollement-data); [`EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`](#node-EDC.5-t-exact-functor); `mathlib:CategoryTheory.Triangulated.TStructure`.

**Acceptance examples.**

- Z = ∅: the glued t-structure is t_U transported along j^*.
- The perverse t-structure on a curve X with a closed point Z is glued from the shifted standard t-structure on U and the standard one on Z (EDC.5/perverse-t-structure).

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 1.4.10, p. 48. The pair (D^{≤0}, D^{≥0}) defined by j^*, i^*, i^! is a t-structure, glued from those on D_U and D_F.

<a id="node-EDC.5-abstract-intermediate-extension"></a>

#### Intermediate extension in a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`; construction. Intended module: `TauCeti/CategoryTheory/Triangulated/TStructure/IntermediateExtension`; namespace: `TauCeti.EtaleDuality`.

In a recollement with glued t-structure (EDC.5/glued-t-structure), write pj_! := H⁰ ∘ j_! and pj_* := H⁰ ∘ j_* : D_U^♥ → D^♥. The intermediate extension j_!* : D_U^♥ → D^♥ sends B to the image of the canonical map pj_!B → pj_*B (BBD 1.4.22). It satisfies j^*j_!*B ≅ B; j_!*B has no nonzero subobject or quotient of the form i_*C with C ∈ D_F^♥, and it is the unique extension of B with this property (BBD 1.4.23–1.4.25); j_!* is fully faithful; it sends simple objects to simple objects, and every simple object of D^♥ is either j_!*S with S simple in D_U^♥ or i_*T with T simple in D_F^♥ (BBD 1.4.26).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** A recollement with the glued t-structure.

**Construction and proof plan.**

1. Define j_!* as the image in the abelian heart (EDC.5/t-structure-heart-abelian) of pj_!B → pj_*B, the map adjoint to B → j^*pj_*B.
2. Characterisations: BBD 1.4.23 (truncation descriptions j_!*B = τ^F_{≤−1}j_*B and = τ^F_{≥1}j_!B for the glued truncations) and 1.4.24–1.4.25 (no sub/quotient from D_F, uniqueness).
3. Simple objects: BBD 1.4.26 via the exact sequences relating pj_!, j_!*, pj_* with i_*-terms.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`](#node-EDC.5-glued-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian`](#node-EDC.5-t-structure-heart-abelian); [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](#node-EDC.5-t-cohomology-functor).

**Uses that determine the API.**

- BBD 2.1.7–2.1.11: the intersection complex is j_!* of a shifted local system
- EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension: the étale j_!* is this construction for the perverse t-structures
- GeometricSatakeAndFusion:GS1: simple equivariant perverse sheaves on the affine Grassmannian are intermediate extensions from orbits

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Recollement.intermediateExtension` | constructor | j_!* : heart(t_U) ⥤ heart(glued), B ↦ image(pj_!B → pj_*B). |
| `TauCeti.EtaleDuality.Recollement.upperStar_intermediateExtension` | simp | j^* ∘ j_!* ≅ 𝟭 on heart(t_U). |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_no_sub_quotient` | characterisation | j_!*B has no nonzero subobject or quotient in the essential image of i_* : heart(t_F) → heart. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_unique` | characterisation | An object A of the heart with j^*A ≅ B and no sub/quotient from heart(t_F) is isomorphic to j_!*B. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.Recollement.simple_classification` | characterisation | Every simple object of the heart is j_!*S with S simple or i_*T with T simple. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.intermediateExtension_empty_closed` | degenerate | If D_F = 0 then j_!* ≅ the inverse of the equivalence j^* on hearts. |
| `TauCeti.EtaleDuality.intermediateExtension_simple` | characterisation | j_!* sends simple objects to simple objects. |
| `TauCeti.EtaleDuality.intermediateExtension_ne_lowerShriek` | non-example | For j : 𝔾_m → 𝔸¹ and B = Λ[1] with field coefficients, 0 → i_*Λ_0 → pj_!B → Λ_{𝔸¹}[1] → 0 is exact in Perv. The nonzero boundary subobject shows pj_!B ≇ j_!*B; it is a subobject, not a quotient. |

**Acceptance examples.**

- Z = ∅: j_!* = identity up to the equivalence j^*.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Définition 1.4.22, p. 54. j_!*B is the image of pj_!B in pj_*B.

<a id="node-EDC.5-perverse-t-structure"></a>

#### The middle perverse t-structure ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`; construction. Planet: “Middle perverse t-structure”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Perverse/TStructure`; namespace: `TauCeti.EtaleDuality`.

Let k be a perfect field, X a separated scheme of finite type over k, ℓ invertible in k, and Λ either a finite field of characteristic ℓ or Λ = O/π^m (self-injective) or a finite extension E of ℚ_ℓ (with D^b_c(X, E) imported, EDC.6/classical-and-proetale-adic-categories). For a point x of X let dim(x) := dim of its closure. Define pD^{≤0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^i(K)_x̄ = 0 for i > −dim(x), for all points x} — equivalently dim Supp ℋ^{−i}(K) ≤ i for all i — and pD^{≥0}(X, Λ) := {K : ℋ^i(i_x^!K)_x̄ = 0 for i < −dim(x), for all x}, where i_x : x̄ → X; for Λ a field, K ∈ pD^{≥0} iff D_X K ∈ pD^{≤0}. Then (pD^{≤0}, pD^{≥0}) is a bounded t-structure on D^b_c(X, Λ), the middle perverse t-structure. It is local for the étale topology, it is obtained by gluing (EDC.5/glued-t-structure) the shifted standard t-structures on the strata of any stratification adapted to K, and for X = Spec k with k separably closed it is the standard t-structure.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X separated of finite type over a perfect field k; ℓ invertible in k. For the rational category and source-faithful BBD §4 statements, require also that H^i(Gal(k^sep/k′), ℤ/ℓ) is finite for every finite k′/k and every i (BBD 4.0; e.g. finite or algebraically closed k). Broader modern versions need a separate justification. Coefficients: finite fields of characteristic ℓ, O/π^m, or E/ℚ_ℓ finite. Integral O_E coefficients need the separate torsion-pair construction EDC.5/integral-perverse-torsion-pair; no statement about them is made here. The costalk condition uses i_x^! for the inclusion of a (non-closed) point, computed as a colimit over open neighbourhoods of strata; equivalently, for a stratification {S} adapted to K, i_S^!K has cohomology sheaves in degrees ≥ −dim S.

**Construction and proof plan.**

1. Choose a stratification by smooth locally closed strata S such that the ℋ^i(K|_S) and ℋ^i(i_S^!K) are locally constant (constructibility, EDC.0/constructible-ctf-complexes, and stability of D^b_c under the six operations, EDC.1:biduality/duality-exchange-isomorphisms).
2. On each stratum take the standard t-structure shifted by −dim S; glue by induction on the number of strata with EDC.5/glued-t-structure along the recollement of an open union of strata and its closed complement (EDC.5/recollement-data, EDC.1:biduality/recollement-adjunctions); this is BBD 2.1.3 in the étale setting (BBD 2.2.10–2.2.19).
3. Independence of the stratification: refine (BBD 2.1.14); étale locality from the stalk description; the duality characterisation for field coefficients from the exchange D i_S^* = i_S^! D (EDC.1:biduality/duality-exchange-isomorphisms) and self-duality of the shifted standard t-structure on lisse sheaves (EDC.1:biduality/dualizing-complex-of-smooth-scheme).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`](#node-EDC.5-glued-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`](#node-EDC.5-recollement-data); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); `mathlib:CategoryTheory.Triangulated.TStructure`; [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Uses that determine the API.**

- BBD §4.0: pD^{≤0}, pD^{≥0} defined by dimension of supports and costalks
- Yun–Zhang II, §§3.5, 7.1 (PAPER-YUN-ZHANG-19/10): perverse sheaves and IC complexes on finite-type schemes with characteristic-zero ℓ-adic coefficients
- Caraiani–Scholze, §6.1 (PAPER-CARAIANI-SCHOLZE-17/164): perverse 𝔽_ℓ-sheaves on finite-type schemes over an algebraically closed field
- GeometricSatakeAndFusion:GS1: the scheme-side model for the relative perverse t-structure of FS VI.7
- LefschetzPencilsAndVanishingCycles:LPV.6 and LPV.7: nearby cycles RΨ[d] are perverse

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.perverseTStructure` | constructor | The middle perverse t-structure on D^b_c(X, Λ). |
| `TauCeti.EtaleDuality.perverseTStructure_le_iff` | characterisation | K ∈ pD^{≤0} iff for every geometric point x̄ over x and every j with j + dim(x) > 0, ℋ^j(K)_x̄ = 0. |
| `TauCeti.EtaleDuality.perverseTStructure_ge_iff_verdierDual` | characterisation | For Λ a field: K ∈ pD^{≥0} iff D_X K ∈ pD^{≤0}. |
| `TauCeti.EtaleDuality.perverseTStructure_bounded` | other | Every K ∈ D^b_c(X, Λ) lies in pD^{≥a} ∩ pD^{≤b} for some a ≤ b. |
| `TauCeti.EtaleDuality.perverseTStructure_restrict_etale` | functoriality | For u : V → X étale, u^* is t-exact for the perverse t-structures. |
| `TauCeti.EtaleDuality.perverseTStructure_glue` | compatibility | For Z ⊂ X closed with complement U, the perverse t-structure of X is the gluing of those of U and Z along Recollement.ofClosedOpen. |
| `TauCeti.EtaleDuality.perverseTStructure_point` | compatibility | For X = Spec k, k separably closed, the perverse t-structure is the canonical t-structure. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.perverse_point_eq_canonical` | compatibility | For X = Spec Ω, Ω separably closed, pD^{≤0}(X, Λ) = D^{≤0} under D^b_c(Spec Ω, Λ) ≃ D^b_{fg}(Λ). |
| `TauCeti.EtaleDuality.perverse_curve_constant_shift` | computation | For X a smooth curve over a separably closed field, Λ_X[1] lies in the heart. |
| `TauCeti.EtaleDuality.perverse_empty` | degenerate | For X = ∅ the category is zero and both halves are everything. |
| `TauCeti.EtaleDuality.not_perverse_curve_constant` | non-example | For a nonempty smooth curve and nonzero coefficients, Λ_X in degree 0 has its only perverse cohomology in degree +1: it lies in pD^{≥1} and fails pD^{≤0}; it is not perverse. |

**Acceptance examples.**

- X = Spec k, k separably closed: pD^{≤0} = D^{≤0}.
- X a smooth curve: Λ_X[1] ∈ pD^{≤0} ∩ pD^{≥0}; Λ_X ∉ pD^{≥0}.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, (4.0.1)–(4.0.2), p. 102. The middle perversity conditions in terms of dim(x) for X of finite type over a field.
- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.1.3, p. 57. The perverse t-structure is obtained by gluing along strata.

<a id="node-EDC.5-perverse-sheaves"></a>

#### Perverse sheaves ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`; definition. Planet: “Perverse sheaves”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Perverse/Basic`; namespace: `TauCeti.EtaleDuality`.

In the situation of EDC.5/perverse-t-structure, the category of perverse sheaves Perv(X, Λ) is the heart pD^{≤0}(X, Λ) ∩ pD^{≥0}(X, Λ), an abelian category (EDC.5/t-structure-heart-abelian), with perverse cohomology functors pH^n : D^b_c(X, Λ) → Perv(X, Λ) (EDC.5/t-cohomology-functor). Perverse sheaves form a stack for the étale topology: morphisms glue (U ↦ Hom(K|_U, L|_U) is a sheaf for K, L perverse) and objects glue (BBD 2.1.23, 2.2.19). For Λ a field (or O/π^m), every perverse sheaf has finite length (EDC.5/simple-perverse-sheaves).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** As in EDC.5/perverse-t-structure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Define Perv(X, Λ) as the heart; abelian by EDC.5/t-structure-heart-abelian.
2. Stack property: for K ∈ pD^{≤0}, L ∈ pD^{≥0}, the complex RHom(K, L) has no cohomology in negative degrees (BBD 2.1.21), so ℋ⁰RHom(K, L) is the sheaf of morphisms (2.1.22); gluing of objects (2.1.23) follows by the standard descent argument for objects of a heart with vanishing negative Exts.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian`](#node-EDC.5-t-structure-heart-abelian); [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](#node-EDC.5-t-cohomology-functor).

**Uses that determine the API.**

- Caraiani–Scholze, Corollary 6.1.4: perverse 𝔽_ℓ-sheaves and their generic concentration in one degree
- EtaleDualityAndPerverseSheaves:EDC.7: pure perverse sheaves, their weight filtration and semisimplicity
- GlobalShtukasAndFunctionFieldLanglands:GS.1: every sheaf in the Satake category is perverse (scheme models)
- EndoscopicTransferAndUnitaryTraceComparison:ET.2b and ET.5: perverse sheaves on Hitchin bases and Igusa varieties

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.PerverseSheaf` | constructor | Perv(X, Λ) := the heart of perverseTStructure, as a full subcategory of D^b_c(X, Λ). |
| `TauCeti.EtaleDuality.PerverseSheaf.abelian` | instance | Perv(X, Λ) is abelian. |
| `TauCeti.EtaleDuality.perverseCohomology` | constructor | pH^n : D^b_c(X, Λ) ⥤ Perv(X, Λ), n ∈ ℤ. |
| `TauCeti.EtaleDuality.perverseCohomology_isHomological` | instance | pH⁰ is homological: distinguished triangles give long exact sequences of perverse sheaves. |
| `TauCeti.EtaleDuality.PerverseSheaf.restrictEtale` | functoriality | For u : V → X étale, u^* : Perv(X, Λ) ⥤ Perv(V, Λ) is exact. |
| `TauCeti.EtaleDuality.PerverseSheaf.hom_isSheaf` | other | For K, L perverse, U ↦ Hom(K\|_U, L\|_U) is a sheaf on X_ét; in particular, for u : V → X étale surjective, two morphisms K ⟶ L that agree after u^* are equal. |
| `TauCeti.EtaleDuality.PerverseSheaf.isIso_of_restrictEtale` | other | For u : V → X étale surjective, a morphism of perverse sheaves that becomes an isomorphism after u^* is an isomorphism (the conservativity used to glue objects along an étale cover, BBD 2.2.19). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.perverseSheaf_point` | compatibility | Perv(Spec Ω, Λ) ≌ finitely generated Λ-modules, Ω separably closed. |
| `TauCeti.EtaleDuality.perverseSheaf_skyscraper` | computation | For x a closed point of X, i_{x*}M (M a finitely generated Λ-module, degree 0) is perverse. |
| `TauCeti.EtaleDuality.perverseSheaf_empty` | degenerate | Perv(∅, Λ) is the zero category. |
| `TauCeti.EtaleDuality.not_perverse_constant_surface` | non-example | For a nonempty smooth surface, Λ_X[1] has perverse degree +1 and is not perverse; Λ_X[2] is perverse. |

**Acceptance examples.**

- Perv(Spec Ω, Λ) ≃ finitely generated Λ-modules for Ω separably closed.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Corollaire 2.1.23, p. 65. p-perverse sheaves on the opens of X form a stack.

<a id="node-EDC.5-lisse-shift-is-perverse"></a>

#### Shifted local systems on smooth schemes are perverse

Node `EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`; theorem.

Let X be smooth over k of pure dimension d (ℓ invertible) and L a locally constant constructible sheaf of Λ-modules (Λ a field of characteristic ℓ, O/π^m, or a lisse E-sheaf). Then L[d] is perverse. More generally, for K ∈ D^b_c(X, Λ) with locally constant cohomology sheaves, K ∈ pD^{≤0} iff ℋ^i(K) = 0 for i > −d, and for Λ a field K ∈ pD^{≥0} iff ℋ^i(K) = 0 for i < −d.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth of pure dimension d over a field; locally constant cohomology sheaves. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Support condition: Supp ℋ^{−d}(L[d]) ⊂ X has dimension d and ℋ^{−i} = 0 otherwise.
2. Cosupport: D_X(L[d]) = L^∨(d)[d] (EDC.1:biduality/dualizing-complex-of-smooth-scheme), again a shifted local system in degree −d, so L[d] ∈ pD^{≥0} by the duality characterisation (EDC.5/perverse-t-structure); for O/π^m use the costalk description i_x^!L = L_x̄(−c)[−2c] at points of codimension c (purity, EDC.3/smooth-pair-purity, applied on a stratification by smooth strata).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme); [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](#node-EDC.3-smooth-pair-purity).

**Acceptance examples.**

- X a smooth curve: L[1] is perverse for every local system L.
- X = 𝔸²: Λ[2] is perverse while Λ[1] is not.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0 (Exemples), p. 102. A lisse sheaf placed in degree −d on X smooth of pure dimension d is perverse.

<a id="node-EDC.5-perverse-recollement"></a>

#### Open–closed recollement of perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`; theorem.

Let X be of finite type over k, i : Z → X closed with open complement j : U → X, and Λ as in EDC.5/perverse-t-structure. The perverse t-structure on D^b_c(X, Λ) is glued (EDC.5/glued-t-structure) from those on U and Z. Hence j_! and i^* are right t-exact, Rj_* and i^! are left t-exact, i_* and j^* are t-exact; i_* : Perv(Z, Λ) → Perv(X, Λ) is fully faithful with essential image the perverse sheaves supported on Z; and for K perverse there are exact sequences 0 → i_*pH^{−1}i^*K → pj_!j^*K → K → i_*pH⁰i^*K → 0 and 0 → i_*pH⁰i^!K → K → pj_*j^*K → i_*pH¹i^!K → 0 in Perv(X, Λ) (BBD 1.4.19).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** As in EDC.5/perverse-t-structure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. The étale recollement (EDC.5/recollement-data with EDC.1:biduality/recollement-adjunctions) and the stalk/costalk definitions show that the perverse t-structure of X is the glued one (BBD 2.1.3, 2.2).
2. Exactness: EDC.5/glued-t-structure (BBD 1.4.16).
3. Take perverse cohomology of the two recollement triangles and use only i^*K ∈ pD^{≤0}, i^!K ∈ pD^{≥0}, j_!j^*K ∈ pD^{≤0}, Rj_*j^*K ∈ pD^{≥0}. This gives the five-term exact sequences by BBD 1.4.19. No bound [−1,0] or [0,1] holds for an arbitrary closed immersion: restricting Λ_X[2] from a smooth surface to a point gives degree −2 for i^* and +2 for i^!.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`](#node-EDC.5-glued-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`](#node-EDC.5-recollement-data); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions).

**Acceptance examples.**

- X = 𝔸¹, Z = {0}, K = Λ_X[1]: i^*K = Λ[1] so pH^{−1}i^*K = Λ_0 and the first sequence is 0 → i_*Λ_0 → j_!Λ_U[1] → Λ_X[1] → 0.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Propositions 1.4.16 and 1.4.19, pp. 51–53. 1.4.16 supplies the one-sided t-exactness; 1.4.19 supplies the five-term sequences. Neither says that an arbitrary closed restriction has amplitude one.

<a id="node-EDC.5-intermediate-extension"></a>

#### Intermediate extension of perverse sheaves ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`; construction. Planet: “Intermediate extension”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Perverse/IntermediateExtension`; namespace: `TauCeti.EtaleDuality`.

Let j : U → X be a locally closed immersion of schemes of finite type over k (factor j = ī ∘ j' with j' : U → Ū open dense and ī : Ū → X closed) and Λ as in EDC.5/perverse-t-structure. The intermediate extension j_!* : Perv(U, Λ) → Perv(X, Λ) is j_!* := ī_* ∘ j'_!*, where j'_!*A is the image of pH⁰(j'_!A) → pH⁰(Rj'_*A) (EDC.5/abstract-intermediate-extension for the recollement of EDC.5/perverse-recollement). j_!*A is the unique perverse extension P of A to Ū with i^*P ∈ pD^{≤−1}(Z) and i^!P ∈ pD^{≥1}(Z) for Z = Ū − U; in stalk terms, for any stratification of Z, ℋ^i(P)_x̄ = 0 for i ≥ −dim(x) and the costalks vanish for i ≤ −dim(x) at points x of Z (BBD 2.1.9). For the dimension-ordered filtration of BBD 2.1.11, with perversity values p(S) = −dim S and U_r the union of strata with p(S) ≤ r, the standard truncation step is τ_{≤r}Rj_{r*}; it applies to input in ordinary D^{≤r}. For a single closed smooth stratum of dimension e this gives j_!*A ≅ τ_{≤−e−1}Rj_*A only when A lies in ordinary D^{≤−e−1} on U. For general perverse A use the relative glued truncation of BBD 1.4.23 or the image definition. j_!* is fully faithful, preserves simple objects, and is transitive: (j₂j₁)_!* = j₂_!* ∘ j₁_!*.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over k; j a locally closed immersion; Λ as in EDC.5/perverse-t-structure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Open dense case: EDC.5/abstract-intermediate-extension for the recollement of U ⊂ Ū (EDC.5/perverse-recollement).
2. Stalk/costalk characterisation: BBD 2.1.9 (uniqueness of the extension with the strict bounds on Z), using the truncation description 1.4.23.
3. Deligne's formula: BBD 2.1.11, by induction on the strata with the formula of 1.4.23 at each step.
4. Transitivity and independence of the factorisation from the characterisation.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`](#node-EDC.5-abstract-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`](#node-EDC.5-perverse-recollement); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian`](#node-EDC.5-t-structure-heart-abelian).

**Uses that determine the API.**

- BBD 4.3.1 and §5.3: simple perverse sheaves and pure IC complexes are intermediate extensions
- Zhu, Appendix A.3.1 (PAPER-ZHU-17/E05): IC_X = j_!*Q̄_ℓ[d] on finite-type models of perfect spaces
- EtaleDualityAndPerverseSheaves:EDC.7/ic-purity: j_!* preserves purity for affine j
- IgusaVarietiesAndTorsionConcentration:IG.4: intermediate extensions in the nearby-cycle support bounds

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.intermediateExtension` | constructor | j_!* : Perv(U, Λ) ⥤ Perv(X, Λ) for j : U ⟶ X an open immersion (locally closed immersions by composing with the closed pushforward). |
| `TauCeti.EtaleDuality.intermediateExtension_eq_image` | characterisation | j_!*A ≅ image(pH⁰(j_!A) → pH⁰(Rj_*A)). |
| `TauCeti.EtaleDuality.restrict_intermediateExtension` | simp | j^*(j_!*A) ≅ A. |
| `TauCeti.EtaleDuality.intermediateExtension_stalk_bound` | characterisation | For a point x of Z = X − U and j' : U → X open dense, ℋ^i(j_!*A)_x̄ = 0 for i ≥ −dim(x). |
| `TauCeti.EtaleDuality.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.intermediateExtension_comp` | functoriality | (j₂ ∘ j₁)_!* ≅ j₂_!* ∘ j₁_!*. |
| `TauCeti.EtaleDuality.intermediateExtension_truncation_formula` | relation | For U open with closed smooth stratum Z of pure dimension e, and A ∈ Perv(U) whose ordinary cohomology vanishes above −e−1, j_!*A ≅ τ_{≤−e−1}Rj_*A. Without the ordinary bound, use relative perverse truncation, not global standard truncation. |
| `TauCeti.EtaleDuality.intermediateExtension_costalk_bound` | characterisation | At a boundary point x with dim closure e, ℋ^i(i_x^!j_!*A) = 0 for i ≤ −e. Together with the stalk bound this distinguishes the unique extension from arbitrary perverse extensions. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.intermediateExtension_iso` | degenerate | If j is an isomorphism, j_!* ≅ 𝟭. |
| `TauCeti.EtaleDuality.intermediateExtension_curve_constant` | computation | For j : 𝔾_m → 𝔸¹ over a separably closed field and Λ a field, j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1]. |
| `TauCeti.EtaleDuality.intermediateExtension_kummer` | computation | For j : 𝔾_m → 𝔸¹ and L a nontrivial rank-one Kummer local system, j_!*(L[1]) ≅ j_!L[1] ≅ Rj_*L[1]. |
| `TauCeti.EtaleDuality.not_intermediateExtension_eq_lowerShriek` | non-example | For j : 𝔾_m → 𝔸¹ and Λ a field, j_!(Λ[1]) is perverse but not isomorphic to j_!*(Λ[1]). |
| `TauCeti.EtaleDuality.not_unrestricted_standard_truncation` | non-example | For U = 𝔾_m ⊂ 𝔸¹ and A a skyscraper at 1 in degree 0, j_!*A is the same nonzero skyscraper, while τ_{≤−1}Rj_*A = 0. This catches a global standard truncation formula without the input bound. |

**Acceptance examples.**

- j an isomorphism: j_!* = id.
- j : 𝔾_m → 𝔸¹, A = L[1] for a nontrivial Kummer local system L: j_!*A = j_!A = Rj_*A.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.1.9, p. 59. j_!*P is the unique extension with strict stalk and costalk bounds on the strata of F; Deligne's truncation formula.

<a id="node-EDC.5-intersection-complex"></a>

#### The intersection complex IC_X(L) ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`; definition. Planet: “Intersection complex”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Perverse/IntersectionComplex`; namespace: `TauCeti.EtaleDuality`.

Let X be an irreducible scheme of finite type over k of dimension d, U ⊂ X a dense open subscheme that is smooth over k, and L a locally constant constructible sheaf of Λ-modules on U (Λ a field of characteristic ℓ or E/ℚ_ℓ; lisse for E). The intersection complex is IC_X(L) := j_!*(L[d]) for j : U → X (EDC.5/intermediate-extension, EDC.5/lisse-shift-is-perverse). It is independent of U: for U' ⊂ U dense open, IC_X(L) ≅ IC_X(L|_{U'}). IC_X := IC_X(Λ). For X smooth, IC_X(L) = L[d]; for X a curve, IC_X(L) = (j_*L)[1] with j_* the underived direct image; IC_X(L) is simple when L is irreducible; for a finite surjective birational ν : X' → X with X' smooth, an open U over which ν is an isomorphism, and a lisse sheaf L' on X' extending L under that identification, IC_X(L) ≅ ν_*(L'[d]). No Tate half-twist normalization is built in: IC_X(L) is the unnormalized j_!*(L[d]).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X irreducible of finite type over k, of dimension d; U dense, open and smooth; Λ a field (finite of characteristic ℓ) or E/ℚ_ℓ. A dense smooth open exists over a perfect field; over an imperfect k, take U regular and smooth over k if it exists (the definition requires a smooth dense open).

**Construction and proof plan.**

1. Definition through EDC.5/intermediate-extension.
2. Independence of U: for U' ⊂ U, j_{U'!*} = j_{U!*} ∘ (U' ⊂ U)_!* by transitivity, and (U' ⊂ U)_!*(L|_{U'}[d]) = L[d] because L[d] on smooth U has no sub/quotient supported on U − U' (EDC.5/lisse-shift-is-perverse and the characterisation of j_!*).
3. Curves: Deligne's formula with one closed stratum of dimension 0: τ_{≤−1}(Rj_*L[1]) = j_*L[1].
4. Finite birational ν with the specified extension L′: proper base change computes both stalks and costalks; finite fibres preserve their perverse degree bounds. Thus ν_*(L′[d]) is perverse and satisfies the strict boundary conditions. This uses the finite-map stalk/costalk argument directly, avoiding the later amplitude node, whose duality prerequisite already imports IC.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`](#node-EDC.5-lisse-shift-is-perverse); `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- Zhu, Appendix A.3.1 (PAPER-ZHU-17/E05): IC_X = j_!*Q̄_ℓ[d] for X geometrically irreducible of dimension d
- Yun–Zhang II, §3.5.3 (PAPER-YUN-ZHANG-19/11): small-map pushforwards are identified with IC complexes
- EtaleDualityAndPerverseSheaves:EDC.7/ic-purity: IC_X(L) is pure of weight w + d for L pure of weight w
- GeometricSatakeAndFusion:GS3 and GS4: IC complexes of Schubert varieties of Witt Grassmannian models
- GlobalShtukasAndFunctionFieldLanglands:GS.1: IC complexes of global Hecke stacks (via their scheme models)

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.intersectionComplex` | constructor | IC_X(L) := j_!*(L[d]) ∈ Perv(X, Λ) for j : U ⟶ X dense open smooth and L locally constant on U. |
| `TauCeti.EtaleDuality.intersectionComplex_restrict` | characterisation | IC_X(L) ≅ IC_X(L\|_{U'}) for U' ⊂ U dense open: independence of the chosen open. |
| `TauCeti.EtaleDuality.intersectionComplex_of_smooth` | simp | If X is smooth (U = X), IC_X(L) ≅ L[d]. |
| `TauCeti.EtaleDuality.intersectionComplex_curve` | simp | If dim X = 1, IC_X(L) ≅ (j_*L)[1] with j_* the underived direct image. |
| `TauCeti.EtaleDuality.intersectionComplex_simple` | other | If L is irreducible, IC_X(L) is a simple perverse sheaf. |
| `TauCeti.EtaleDuality.intersectionComplex_finite_birational` | compatibility | For ν : X' → X finite surjective birational with X' smooth, U a dense open over which ν is an isomorphism, and L' lisse on all of X' extending L, IC_X(L) ≅ ν_*(L'[d]). The extension of L is an explicit hypothesis. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.intersectionComplex_smoothCurve` | computation | For X a smooth curve over a separably closed field, IC_X ≅ Λ_X[1]. |
| `TauCeti.EtaleDuality.intersectionComplex_nodalCurve` | computation | For X a nodal cubic with normalization ν : P¹ → X, IC_X ≅ ν_*Λ_{P¹}[1], whose stalk at the node is Λ² in degree −1. |
| `TauCeti.EtaleDuality.intersectionComplex_cuspidalCurve` | computation | For X a cuspidal cubic, ν is a universal homeomorphism and IC_X ≅ Λ_X[1]. |
| `TauCeti.EtaleDuality.not_intersectionComplex_nodal_constant` | non-example | For X nodal with node s, Λ_X[1] is perverse but not IC_X: the exact sequence 0 → i_{s*}Λ → Λ_X[1] → ν_*Λ_{P¹}[1] → 0 in Perv(X) exhibits a nonzero subobject supported at the node. |

**Acceptance examples.**

- X a smooth curve: IC_X = Λ[1].

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 4.3.1 (ii), p. 112. Simple perverse sheaves are j_!*(L[d]) of irreducible local systems on smooth irreducible locally closed V.
- [Zhu-2017](https://arxiv.org/pdf/1407.8519v3), Appendix A.3.1, p. 54 (arXiv v3). Zhu uses perverse sheaves, intermediate extension and IC on (models of) perfect spaces exactly as defined here; the perfect-space transport is the proposed Part II.

<a id="node-EDC.5-simple-perverse-sheaves"></a>

#### Perverse sheaves have finite length; classification of simple objects

Node `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`; theorem.

Let X be of finite type over k and Λ a finite field of characteristic ℓ or E/ℚ_ℓ finite. Perv(X, Λ) is artinian and noetherian: every perverse sheaf has a finite composition series. The simple objects are exactly the i_{V*}j_!*(L[dim V]) where V ⊂ X is an irreducible locally closed subscheme smooth over k, i_V the closure inclusion, and L an irreducible locally constant sheaf on V (lisse for E); two such are isomorphic iff the closures of V agree and the L agree on a common dense open.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over k (perfect, or so that the needed smooth dense opens exist); Λ a field. Use the perfect-field and rational Galois-cohomology finiteness range of EDC.5/perverse-t-structure; over an imperfect field BBD 4.3.1 uses the reduced geometric smooth locus after passing to the perfect closure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Noetherian induction on X with EDC.5/perverse-recollement: on a dense smooth open U where K has lisse cohomology, the category of lisse sheaves (finite length for field coefficients) controls K|_U; the exact sequences of BBD 4.1.10 reduce to lower-dimensional supports (BBD 4.3.1).
2. Simple objects: EDC.5/abstract-intermediate-extension (simple objects of a recollement heart) with EDC.5/intersection-complex.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](#node-EDC.5-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`](#node-EDC.5-perverse-recollement); [`EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`](#node-EDC.5-abstract-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Acceptance examples.**

- X = Spec Ω: simple perverse sheaves are Λ (one-dimensional) — Perv(Spec Ω, Λ) = finite-dimensional Λ-vector spaces.
- X a smooth curve: the simple objects are skyscrapers i_{x*}Λ at closed points and IC_X(L) = (j_*L)[1] for L irreducible on dense opens.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 4.3.1 (ii), p. 112. Perv is artinian and noetherian; simple objects are intermediate extensions of irreducible local systems.

<a id="node-EDC.5-verdier-duality-perverse"></a>

#### Self-duality of the middle perversity and duality of IC complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`; theorem. Planet: “Verdier duality of perverse sheaves”.

Let X be separated of finite type over k (ℓ invertible) and Λ a finite field of characteristic ℓ or E/ℚ_ℓ finite. The Verdier dual D_X (EDC.1:adjoint/verdier-dual) exchanges pD^{≤0}(X, Λ) and pD^{≥0}(X, Λ); it induces an anti-equivalence D_X : Perv(X, Λ)^op ≅ Perv(X, Λ) with D_X² ≅ id, pH^n(D_X K) ≅ D_X pH^{−n}(K), D_X ∘ j_!* ≅ j_!* ∘ D_U, and for X irreducible of dimension d with smooth dense open U, D_X IC_X(L) ≅ IC_X(L^∨(d)) where L^∨ = Hom(L, Λ). No identification of IC_X(L) with its dual is made without a given pairing L ⊗ L → Λ(−d).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X separated of finite type over a field; Λ a field (finite of characteristic ℓ, or E/ℚ_ℓ). Integral O_E: duality exchanges p and p⁺ instead (EDC.5/integral-perverse-torsion-pair). The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Biduality on D^b_c (EDC.1:biduality/constructible-biduality) and the exchanges D i^* = i^! D, D Rj_* = j_! D (EDC.1:biduality/duality-exchange-isomorphisms) show D(pD^{≤0}) = pD^{≥0} from the stalk/costalk definition (BBD 2.1.16–2.1.17, 4.0).
2. D_X ∘ j_!* ≅ j_!* ∘ D_U: D exchanges pj_! and pj_* (by the exchange formulas and t-exactness), hence the images.
3. D_U(L[d]) = L^∨(d)[d] on smooth U (EDC.1:biduality/dualizing-complex-of-smooth-scheme); apply j_!*.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`](#node-EDC.5-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](#node-EDC.5-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual).

**Acceptance examples.**

- X a smooth curve: D_X(Λ[1]) = Λ(1)[1], i.e. D IC_X = IC_X(1).
- X = Spec Ω: D is Hom_Λ(−, Λ) on finite-dimensional vector spaces.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0 (autodualité), p. 102. For the middle perversity, duality exchanges pD^{≤0} and pD^{≥0} (self-duality of p_{1/2}).

<a id="node-EDC.5-affine-perverse-artin-vanishing"></a>

#### Perverse Artin vanishing for affine morphisms ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`; theorem. Planet: “Perverse Artin vanishing”.

Let f : X → Y be an affine morphism of schemes of finite type over k (ℓ invertible) and Λ as in EDC.5/perverse-t-structure. Then Rf_* : D^b_c(X, Λ) → D^b_c(Y, Λ) is right t-exact and (for f separated) Rf_! is left t-exact for the perverse t-structures (BBD 4.1.1, 4.1.2). If f is quasi-finite and affine, Rf_* and Rf_! are t-exact (BBD 4.1.3). In particular, for X affine over a separably closed k and K perverse, H^i(X, K) = 0 for i > 0 and H^i_c(X, K) = 0 for i < 0; for a constructible sheaf F, H^i(X, F) = 0 for i > dim X (BBD 4.1.4 = SGA 4 XIV 3.2).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** f affine between schemes of finite type over a field; Λ a field, O/π^m or E/ℚ_ℓ; separatedness for Rf_!. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Right t-exactness of Rf_* for f affine: Artin's theorem on the dimension of supports of R^qf_* for affine f (SGA 4 XIV 3.1, requested from SchemeAndStackFoundations:SF.2 together with EDC.4/affine-vanishing-hypercohomology) gives dim Supp R^qf_*F ≤ d(F) − q, which is BBD 4.1.1's estimate.
2. Left t-exactness of Rf_!: by duality (EDC.5/verdier-duality-perverse, D Rf_* = Rf_! D) for field coefficients; for O/π^m by BBD's direct argument (4.1.2).
3. Quasi-finite affine: Rf_* is also left t-exact because the fibres have dimension 0 (EDC.5/perverse-amplitude-estimates), and dually for Rf_! (BBD 4.1.3).
4. Y = Spec k gives the vanishing of H^i(X, K) for i > 0, and H^i_c by duality.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`](#node-EDC.5-lisse-shift-is-perverse); [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`](#node-EDC.5-verdier-duality-perverse); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = 𝔸¹, K = Λ[1]: H^i(𝔸¹, Λ[1]) = 0 for i > 0 (indeed H^{−1} = Λ, H^0 = 0).
- j : 𝔾_m → 𝔸¹ is affine and quasi-finite: Rj_* and j_! send perverse sheaves to perverse sheaves.
- Non-example: for P¹ → Spec k (not affine), H^1(P¹, Λ[1]) = H²(P¹, Λ) ≠ 0.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Corollaire 4.1.3, p. 103. Rf_* is right t-exact for f affine; quasi-finite affine maps are t-exact; Artin vanishing as a corollary.

<a id="node-EDC.5-perverse-amplitude-estimates"></a>

#### Perverse amplitude of pushforward and pullback

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`; theorem.

Let f : X → Y be a morphism of schemes of finite type over k whose fibres have dimension ≤ d, and Λ as in EDC.5/perverse-t-structure. Then (BBD 4.2.4): f^* sends pD^{≤0} to pD^{≤d} and f^! sends pD^{≥0} to pD^{≥−d}; Rf_! sends pD^{≤0} to pD^{≤d} and Rf_* sends pD^{≥0} to pD^{≥−d}. If f is smooth of pure relative dimension d, f^*[d] ≅ `f^![−d](−d)` is t-exact and, for f moreover with geometrically connected fibres, f^*[d] : Perv(Y) → Perv(X) is fully faithful (BBD 4.2.5). For f finite, f_* = Rf_* = Rf_! is t-exact; for i a closed immersion i_* : Perv(Z) → Perv(X) is fully faithful; étale pullback is t-exact.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** f a morphism of finite type schemes over k with fibre dimension ≤ d; Λ as in EDC.5/perverse-t-structure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. The estimate for f^* from the stalk condition: dim of the closure of a point of X is at most dim of its image plus d (BBD 4.2.4); the other three by duality and adjunction (EDC.5/t-exact-functor adjoint criterion).
2. Smooth f: smooth purity f^! = f^*(d)[2d] (EDC.2:trace-purity/smooth-purity) makes the two one-sided estimates meet.
3. Full faithfulness for smooth f with connected fibres: BBD 4.2.5 (Hom computed by f_*f^* on ℋ⁰RHom).
4. Finite f: fibres of dimension 0 give both estimates.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor`](#node-EDC.5-t-exact-functor); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`](#node-EDC.5-verdier-duality-perverse).

**Acceptance examples.**

- f : 𝔸^d_Y → Y: f^*[d] sends Λ_Y[dim Y] to Λ[dim Y + d], perverse.
- f = closed immersion of a point: i_*Λ is perverse.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.4, p. 108. Amplitude estimates for f_!, f^!, f^*, f_* when the fibres have dimension ≤ d; duality exchanges them.

<a id="node-EDC.5-generic-degree-concentration"></a>

#### A perverse sheaf is concentrated in one degree at generic points of its support

Node `EtaleDualityAndPerverseSheaves:EDC.5/generic-degree-concentration`; theorem.

Let Y be a scheme of finite type over an algebraically closed field k of characteristic ≠ ℓ, and K a perverse sheaf of 𝔽_ℓ-modules (more generally Λ as in EDC.5/perverse-t-structure) on Y supported on a closed subset of dimension ≤ e. Then for every geometric point x̄ of Y whose closure has dimension e, the stalk K_x̄ is concentrated in degree −e: ℋ^i(K)_x̄ = 0 for i ≠ −e.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** Y of finite type over an algebraically closed field; K perverse with dim Supp K ≤ e. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. On a dense open V of each e-dimensional irreducible component of Supp K, smooth of dimension e, the ℋ^i(K)|_V are locally constant (constructibility).
2. The support condition gives ℋ^i(K)_x̄ = 0 for i > −e at the generic point x of the component.
3. On V, K|_V has locally constant cohomology, so the costalk condition at x (codimension 0 in V) reads ℋ^i(K)_x̄ = 0 for i < −e (EDC.5/lisse-shift-is-perverse); hence only i = −e survives.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`](#node-EDC.5-lisse-shift-is-perverse).

**Acceptance examples.**

- K = IC_Y for Y irreducible of dimension e: the generic stalk is Λ in degree −e.
- K = i_{x*}Λ for a closed point (e = 0): concentrated in degree 0.
- Non-example: at a non-generic point of the support the stalk can have several degrees (the stalk of IC of a cone over a smooth projective curve of genus g ≥ 1 at the vertex has two nonzero degrees).

**Sources.**

- [Caraiani-Scholze-2017](https://arxiv.org/pdf/1511.02418v1), discussion after Corollary 6.1.4, p. 87 (arXiv v1). Caraiani–Scholze: on the largest stratum where a perverse sheaf is nonzero it is concentrated in one degree.

<a id="node-EDC.5-semismall-pushforward-perverse"></a>

#### Stratified semismall proper maps preserve perversity

Node `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`; theorem.

Let f : X → Y be a proper morphism of schemes of finite type over k, with stratifications {X_α} of X and {Y_β} of Y such that f is stratified (each f^{−1}(Y_β) is a union of strata and f|: X_α ∩ f^{−1}(Y_β) → Y_β is a locally trivial fibration in the étale topology on strata) and semismall: for every stratum X_α and every Y_β ⊂ f(X_α̅), dim(f^{−1}(y) ∩ X_α) ≤ ½(dim X_α − dim Y_β) for y ∈ Y_β. Then Rf_* = Rf_! sends perverse sheaves on X constructible with respect to {X_α} to perverse sheaves on Y. In particular, if X is smooth of pure dimension n and f is semismall (2 dim X ×_Y X ≤ 2n), Rf_*Λ_X[n] is perverse.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** f proper, stratified and semismall as stated; Λ as in EDC.5/perverse-t-structure. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. Support condition: for y ∈ Y_β, (Rf_*K)_ȳ = RΓ(f^{−1}(ȳ), K) by proper base change (requested from SchemeAndStackFoundations:SF.2); each stratum X_α ∩ f^{−1}(y) contributes in degrees ≤ −dim X_α + 2 dim(f^{−1}(y) ∩ X_α) ≤ −dim Y_β (cohomological dimension 2·dim of a variety, Artin), giving the stalk condition (Mirković–Vilonen, Lemma 4.3).
2. Cosupport condition: dual argument with Rf_! = Rf_* and EDC.5/verdier-duality-perverse (or directly with costalks for O/π^m).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`](#node-EDC.5-perverse-amplitude-estimates); [`EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`](#node-EDC.5-verdier-duality-perverse); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- f = id: trivially semismall.
- The Springer resolution of the nilpotent cone of sl₂ (blow-up of the quadric cone at its vertex) is semismall: Rf_*Λ[2] is perverse, ≅ IC ⊕ i_{0*}Λ. This direct-sum example uses characteristic-zero ℓ-adic coefficients; the integral or mod-2 Springer pushforward need not split.
- Non-example: the blow-up of a point in a smooth threefold is not semismall (fibre P² of dimension 2 > 3/2): Rf_*Λ[3] ≅ Λ[3] ⊕ i_*Λ(−1)[1] ⊕ i_*Λ(−2)[−1] has summands in perverse degrees −1 and 1, so it is not perverse.

**Sources.**

- [Mirkovic-Vilonen-2007](https://arxiv.org/pdf/math/0401222v5), §4, Lemma 4.3, p. 14 (arXiv v5). Mirković–Vilonen prove the stratified semismall perverse statement for complex stratified spaces. The étale scheme formulation here is the analogous stalk/costalk dimension argument using the separately requested proper base change and cohomological dimension; it is not a literal scheme theorem quoted from MV.
- [deCataldo-Migliorini-2009](https://arxiv.org/pdf/0712.0349v2), §4.2, Proposition 4.2.1, p. 56 (arXiv v2). Definition of semismall maps and perversity of Rf_*Q[n] for semismall f from a smooth source.

<a id="node-EDC.5-small-map-intersection-complex"></a>

#### Small maps push intersection complexes to intersection complexes

Node `EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex`; theorem.

Let f : X → Y be a proper surjective morphism of irreducible schemes of finite type over k, X smooth of pure dimension n, and suppose f is small: for every r ≥ 1, dim{y ∈ Y : dim f^{−1}(y) ≥ r} < n − 2r. Let V ⊂ Y be a dense open over which f is finite étale (it exists in characteristic 0 or after shrinking where f is generically étale) and L := (f_*Λ)|_V. Then Rf_*Λ_X[n] ≅ IC_Y(L). The same holds with Λ_X replaced by a local system on X.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** f proper surjective, X smooth of pure dimension n, f small; f finite étale over a dense open V (assume f generically étale, e.g. separable). The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly. Require a dense smooth open V ⊂ Y over which f is finite étale; this is an explicit generic-étaleness hypothesis, not a consequence of smallness in characteristic p. Smallness makes dim Y = n and gives the strict boundary bounds, including zero-dimensional fibres outside V.

**Construction and proof plan.**

1. Rf_*Λ[n] is perverse by EDC.5/semismall-pushforward-perverse (small implies semismall).
2. Smallness gives the strict inequalities: for y outside V in a stratum Y_β of dimension b, ℋ^i(Rf_*Λ[n])_ȳ = H^{i+n}(f^{−1}(ȳ)) = 0 unless i + n ≤ 2 dim f^{−1}(y) < n − b, i.e. i < −b; dually for costalks. These are the strict bounds characterising j_!* (EDC.5/intermediate-extension, BBD 2.1.9), so Rf_*Λ[n] = j_!*((Rf_*Λ[n])|_V) = IC_Y(L).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`](#node-EDC.5-semismall-pushforward-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](#node-EDC.5-intersection-complex).

**Acceptance examples.**

- f finite surjective birational from a smooth X (e.g. the normalization of a nodal curve): f is small, Rf_*Λ[n] = IC_Y.
- Non-example: a semismall but not small map (the blow-up of a point in a smooth surface, r = 1 with dim{y} = 0 = n − 2r) gives Rf_*Λ[2] = IC_Y ⊕ i_*Λ(−1), not IC.

**Sources.**

- [deCataldo-Migliorini-2009](https://arxiv.org/pdf/0712.0349v2), §4.2, Remark 4.2.4, p. 56 (arXiv v2). Small maps: Rf_*Q_X[n] is the intersection complex of the generic local system.
- [Yun-Zhang-2019](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), §7.1, proof of Proposition 7.1(1), published p. 507. Yun–Zhang use smallness to identify a proper pushforward with an IC complex.

<a id="node-EDC.5-integral-perverse-torsion-pair"></a>

#### Integral perverse t-structures p and p⁺

Node `EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Perverse/Integral`; namespace: `TauCeti.EtaleDuality`.

Let X be of finite type over k (ℓ invertible), E/ℚ_ℓ finite with ring of integers O = O_E and uniformizer λ, and D^b_c(X, O) the integral constructible category (EDC.6/classical-and-proetale-adic-categories). The middle perverse t-structure p on D^b_c(X, O) is defined by the stalk and costalk conditions of EDC.5/perverse-t-structure (equivalently by gluing). The dual t-structure p⁺ is defined by p⁺D^{≤0} := {K ∈ pD^{≤1} : pH¹(K) is λ-torsion} and p⁺D^{≥0} := {K ∈ pD^{≥0} : pH⁰(K) is λ-torsion-free} (the tilt of p along the torsion pair (torsion, torsion-free) in Perv(X, O)). Then (BBD 3.3): p⁺ is a t-structure; pD^{≤0} ⊂ p⁺D^{≤0} ⊂ pD^{≤1}; the Verdier dual D_X exchanges p and p⁺ (D_X(pD^{≤0}) = p⁺D^{≥0}); K ↦ K ⊗^L_O E is t-exact from p (and from p⁺) to the middle perverse t-structure of D^b_c(X, E); reduction K ↦ K ⊗^L_O O/λ is right t-exact from p to p and left t-exact from p⁺ to p. Integral duality does not preserve the heart of p.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over a field; O = O_E a complete DVR with residue characteristic ℓ invertible on X. The base field, separated finite-type and rational coefficient-category hypotheses are those of the corrected EDC.5/perverse-t-structure; broader field variants require the perfect-closure or modern-category argument explicitly.

**Construction and proof plan.**

1. p on D^b_c(X, O) by gluing along strata as in EDC.5/perverse-t-structure with the standard t-structure of D^b_{fg}(O) on each stratum (BBD 3.3.4).
2. Torsion pair: torsion and torsion-free objects of the noetherian abelian category Perv(X, O) form a torsion pair; the tilt (Happel–Reiten–Smalø) gives p⁺ (BBD §3.3 for the stratified case).
3. Duality: on D^b_{fg}(O), RHom(−, O) exchanges the standard t-structure with its tilt (Ext¹(T, O) for T torsion lands in degree 1); glue with the exchange formulas (EDC.1:biduality/duality-exchange-isomorphisms, in its adic form EDC.6/adic-transport-of-duality-and-classes).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`](#node-EDC.5-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); `mathlib:CategoryTheory.Triangulated.TStructure`; [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

**Uses that determine the API.**

- BBD §3.3: the integral perversities p and p⁺ and their exchange under duality
- LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.5): integral p/p⁺ conventions for nearby cycles are not imported from rational self-duality
- GeometricSatakeAndFusion:GS1: integral perverse sheaves on Witt Grassmannians (ℓ^{a(μ)} bounds compare p and p⁺ objects)

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.perverseIntegral` | constructor | The middle perverse t-structure p on D^b_c(X, O). |
| `TauCeti.EtaleDuality.perversePlus` | constructor | The t-structure p⁺ on D^b_c(X, O), tilt of p along torsion/torsion-free. |
| `TauCeti.EtaleDuality.perversePlus_le_iff` | characterisation | K ∈ p⁺D^{≤0} iff K ∈ pD^{≤1} and pH¹(K) is λ-torsion. |
| `TauCeti.EtaleDuality.perversePlus_ge_iff` | characterisation | K ∈ p⁺D^{≥0} iff K ∈ pD^{≥0} and pH⁰(K) is λ-torsion-free. |
| `TauCeti.EtaleDuality.verdierDual_perverse_le_iff` | relation | K ∈ pD^{≤0} iff D_X K ∈ p⁺D^{≥0}. |
| `TauCeti.EtaleDuality.perverse_le_perversePlus_le` | relation | pD^{≤0} ⊆ p⁺D^{≤0} ⊆ pD^{≤1}. |
| `TauCeti.EtaleDuality.rationalize_tExact` | compatibility | K ↦ K ⊗^L_O E is t-exact from p (and from p⁺) to the middle perverse t-structure on D^b_c(X, E). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.perversePlus_point_torsion` | computation | For X = Spec Ω, O/λ placed in degree 1 lies in the heart of p⁺ and O/λ in degree 0 does not. |
| `TauCeti.EtaleDuality.perversePlus_point_free` | computation | For X = Spec Ω, O in degree 0 lies in the hearts of both p and p⁺. |
| `TauCeti.EtaleDuality.perversePlus_empty` | degenerate | For X = ∅, p = p⁺. |
| `TauCeti.EtaleDuality.not_perverse_eq_perversePlus` | non-example | p ≠ p⁺ on D^b_c(Spec Ω, O): O/λ[0] is in the heart of p but not of p⁺. |

**Acceptance examples.**

- X = Spec Ω: p is the standard t-structure on D^b_{fg}(O); its p⁺ heart contains O/λ[−1] but not O/λ[0].

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0 (a), p. 101, with 3.3.4, p. 99–100. For coefficients ℤ (or a Dedekind ring), the perversities p and p⁺ glued from the standard t-structures, exchanged by duality.

### EDC.6 — Integral, analytic and diamond comparison of operations

Construct the classical/pro-étale bounded constructible coefficient interface before transporting duality, classes and perversity. Keep geometric finiteness separate from arithmetic cohomology. Artin comparison is an equivalence for finite coefficients; rational comparison is fully faithful onto the stable-lattice image. Normalize the complex orientation by the Kummer/exponential sequence and the positive class of O(1). Universal smooth complete-intersection families give equality of Betti ranks without canonical identifications of every fibre. On the diamond side, the cited identities recover duality by Rc_*; stronger c^* transport needs the missing essential-image comparison.

Coverage: `partial`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.6-scheme-adic-diamond-operation-comparisons-index"></a>

#### Scheme, adic and diamond comparisons of the duality operations, with their exact hypotheses

Node `EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`; comparison.

Index of comparisons, with each construction imported from its owner. In characteristic p, for torsion Λ killed by an integer prime to p, ECD 27.1–27.3 give monoidal pullback c_X^*, its full faithfulness, and its right adjoint Rc_{X*}; the internal-Hom and pushforward identities are right-adjoint identities. For f : Y → X separated of finite type between qcqs schemes of characteristic p, ECD 27.4 gives Rf^◇_!c_Y^* ≅ c_X^*Rf_! and Rf^!Rc_{X*} ≅ Rc_{Y*}Rf^{◇!}. It does not assert c_Y^*Rf^! ≅ Rf^{◇!}c_X^*, or c^*RHom ≅ RHom(c^*−,c^*−). The analogous ! comparison over a complete DVR with perfect residue field is imported from L4 (27.5), while constructible Rf_* comparison and full faithfulness in that setting are imported from L6 (27.6–27.7). For scheme → adic, H5/proper-comparison-3-7-2 supplies proper comparison for torsion sheaves in its stated generality, and H5/comparison-over-nonarchimedean-fields-3-8-1 supplies the finite-type comparison over a complete nonarchimedean field with coefficient torsion prime to char(k), not necessarily prime to the residue characteristic. Duality recovered by Rc_{X*} is EDC.6/diamond-transport-of-duality; stronger c^* transport requires the additional comparison recorded as a gap.

Open obligations: [Strong exceptional-pullback and duality transport to diamonds](#gap-EDC4-6); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** Per comparison, the qcqs, finite-type, characteristic and ℓ-invertibility hypotheses of ECD 27.1–27.7 and Huber 3.7.2, 3.8.1; coefficients torsion and prime to p (rational statements by passage to the limit in EDC.6/adic-transport-of-duality-and-classes).

**Construction and proof plan.**

1. Import the comparison theorems from their owners: AdicCoefficientsAndComparisons L2 (qcqs compactification), L3 (27.1–27.4), L4 (27.5), L6 (27.6–27.7), and ClassicalAdicEtaleCohomology H5 (Huber 3.7.2 and 3.8.1).
2. Do not invert a right-adjoint identity to obtain a pullback identity. Apply 27.3–27.4 and the unit K ≅ Rc_{X*}c_X^*K to recover scheme duality via Rc_{X*}; see EDC.6/diamond-transport-of-duality.

**Prerequisites.** `AdicCoefficientsAndComparisons:L2`; `AdicCoefficientsAndComparisons:L3`; `AdicCoefficientsAndComparisons:L4`; `AdicCoefficientsAndComparisons:L6`; `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`; `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`; [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](#node-EDC.1-adjoint-dualizing-complex); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality).

**Acceptance examples.**

- X = 𝔸¹ over a perfectoid field of characteristic p: Rf^◇_!Λ = c^*Rf_!Λ = Λ(−1)[−2] (ECD 27.4).
- D_{X^◇}(Λ) ≅ c^*K_X for X smooth of dimension d: Λ(d)[2d] on both sides.

**Sources.**

- [Scholze-ECD-2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.2, p. 163. c_X^* is fully faithful for any scheme X of characteristic p with Λ as in the statement.
- [Scholze-ECD-2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.4, p. 165. Rf^◇_!c_Y^* ≅ c_X^*Rf_! for f separated of finite type between qcqs schemes of characteristic p.

<a id="node-EDC.6-classical-and-proetale-adic-categories"></a>

#### Classical and pro-étale ℓ-adic constructible categories

Node `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`; comparison.

Let X be a scheme of finite type over a field (or over ℤ[1/ℓ]-regular bases of dimension ≤ 1), ℓ invertible on X, E/ℚ_ℓ finite with ring of integers O and uniformizer λ. The integral constructible category D^b_c(X, O) — defined either as Ekedahl's category of λ-adic systems (normalized complexes (K_m) with K_m ∈ D_ctf(X, O/λ^m) and K_{m+1} ⊗^L O/λ^m ≅ K_m) as imported from EllAdicRealization (through SchemeAndStackFoundations:SF.2), or as Bhatt–Scholze's D_cons(X_proét, O) of derived λ-complete objects whose reductions are constructible — are equivalent, compatibly with the reduction functors K ↦ K ⊗^L O/λ^m. D^b_c(X, E) := D^b_c(X, O) ⊗ E is the full subcategory D_cons(X_proét, E) of Bhatt–Scholze, and D^b_c(X, Ē) is the 2-colimit over finite E'/E. Both carry the six operations f^*, Rf_*, Rf_!, f^!, ⊗, RHom, compatible with the finite-level ones under reduction, and with coefficient extension E → E'.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over a field (or a regular base of dimension ≤ 1) with ℓ invertible; E/ℚ_ℓ finite. For the six operations use the hypotheses of Bhatt–Scholze §§6.6–6.7 and Remark 6.8.15: noetherian finite-dimensional bases with ℓ invertible, and the quasi-excellence hypothesis of 6.7.1 for nonproper direct image. E4 reconstructs coefficient systems on a replete topos; constructibility, boundedness and the scheme six operations are additional inputs, not consequences of repleteness alone.

**Construction and proof plan.**

1. Pro-étale side: D(X_proét, O) and derived completion are EnhancedDerivedSheaves E4 (coefficient-system reconstruction, EnhancedDerivedSheaves:E4/coefficient-system-reconstruction); D_cons is the subcategory of complete objects with constructible reductions (Bhatt–Scholze 6.5).
2. The equivalence with λ-adic systems: K ↦ (K ⊗^L O/λ^m)_m with inverse R lim (Bhatt–Scholze, comparison with Ekedahl's category; EnhancedDerivedSheaves:E4/inverse-limit-reconstruction).
3. Six operations on D^b_c(X, O): defined levelwise on normalized systems by the finite-level operations (EDC.0/coefficient-change, EDC.1:adjoint/exceptional-inverse-image) which preserve D_ctf and commute with ⊗^L O/λ^m (projection formula, imported finiteness through SchemeAndStackFoundations:SF.2); E and Ē by localization and colimit (Bhatt–Scholze 6.8).

**Prerequisites.** `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`; [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = Spec Ω, Ω separably closed: D^b_c(X, O) ≃ D^b_{fg}(O) and D^b_c(X, E) ≃ D^b_{fd}(E).
- The constant system (O/λ^m)_m corresponds to O_X; its rationalization is E_X.

**Sources.**

- [Bhatt-Scholze-proetale-2015](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Lemma 6.7.1, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X_proét with O and E coefficients and compare them with the classical category.

<a id="node-EDC.6-adic-transport-of-duality-and-classes"></a>

#### Transport of traces, duality and Gysin classes to ℓ-adic and rational coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`; theorem.

In the situation of EDC.6/classical-and-proetale-adic-categories, for X separated of finite type over a field k: (a) the dualizing complex K_X := a^!O ∈ D^b_c(X, O) reduces to the finite-level K_X ⊗^L O/λ^m and D_X := RHom(−, K_X) preserves D^b_c(X, O); the evaluation K → D_XD_XK is an isomorphism for all K ∈ D^b_c(X, O) (no self-injectivity needed at the integral level, because biduality holds at each finite level O/λ^m and passes to the limit) and for D^b_c(X, E); D_X exchanges Rf_* and Rf_!, f^* and f^!. (b) The smooth trace Tr_f, the purity isomorphism f^!O ≅ O(d)[2d] for smooth f of relative dimension d, the Gysin maps and the cycle class map cl : CH^r(X) → H^{2r}(X, O(r)) are the limits of their finite-level versions (EDC.2:trace-purity, EDC.3), with integral torsion retained: for geometric cohomology (X over a separably closed field), H^q(X, O) = lim H^q(X, O/λ^m) is a finitely generated O-module whose torsion is not discarded, and the universal-coefficient sequences 0 → H^q(X, O) ⊗ O/λ^m → H^q(X, O/λ^m) → H^{q+1}(X, O)[λ^m] → 0 hold. (c) After ⊗E these give the rational statements, compatible with extension of scalars E → E' ⊂ Ē (D_X, traces and cycle classes commute with − ⊗_E E').

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X separated of finite type over a field; ℓ invertible; O = O_E. The inverse-limit, finite-generation and finite-group Mittag-Leffler assertions in (b) concern geometric cohomology over a separably closed field. Arbitrary-field arithmetic cohomology is not asserted finite. Cycle-class transport uses the perfect-field and cycle hypotheses of the imported EDC.3/cycle-class-map.

**Construction and proof plan.**

1. Each finite-level operation commutes with reduction O/λ^{m+1} → O/λ^m (EDC.0/coefficient-change, projection formula for Rf_! and f^!, imported finiteness), so it defines a functor on normalized systems; biduality and the exchange formulas hold levelwise (EDC.1:biduality/constructible-biduality, EDC.1:biduality/duality-exchange-isomorphisms) and pass to R lim (Mittag-Leffler for finite groups). The finite-group Mittag-Leffler argument here is used over a separably closed field; it cannot be applied to arbitrary arithmetic cohomology.
2. Traces and Gysin maps are compatible with reduction by construction (their finite-level constructions are natural in Λ), hence define maps of systems; cycle classes likewise (EDC.3/cycle-class-map).
3. Universal coefficients: RΓ(X, K) ⊗^L O/λ^m ≅ RΓ(X, K ⊗^L O/λ^m) for K ∈ D^b_c(X, O) (projection formula) and RΓ(X, K) ∈ D^b_{fg}(O). The finiteness clause is geometric; over arbitrary k the absolute Galois cohomology need not be finitely generated.
4. Coefficient extension: E' is finite free over E, so all operations commute with − ⊗_E E'.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change).

**Acceptance examples.**

- X smooth proper of dimension d over k separably closed: H^{2d}(X, O(d)) ≅ O via the limit trace, and Poincaré duality over O has the Ext¹ correction of EDC.2:pairings/adic-and-rational-poincare-duality.
- An Enriques surface over k separably closed of characteristic ≠ 2 with ℓ = 2: H²(X, ℤ_2) has torsion ℤ/2, which the integral statement retains.

**Sources.**

- [Bhatt-Scholze-proetale-2015](https://arxiv.org/pdf/1309.1198v2), Remark 6.8.15, p. 62 (arXiv v2). Bhatt–Scholze: the six operations and duality on constructible ℓ-adic complexes on the pro-étale site.

<a id="node-EDC.6-rational-perverse-coefficient-extension"></a>

#### Perverse t-structures with ℓ-adic coefficients and coefficient extension

Node `EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension`; theorem.

For X of finite type over k (ℓ invertible) and E/ℚ_ℓ finite, the middle perverse t-structure of EDC.5/perverse-t-structure on D^b_c(X, E) and on D^b_c(X, Ē) := 2-colim_{E'} D^b_c(X, E') is compatible with coefficient extension: for E ⊂ E', K ↦ K ⊗_E E' is t-exact, induces an exact functor Perv(X, E) → Perv(X, E'), commutes with j_!* and IC (IC_X(L) ⊗_E E' ≅ IC_X(L ⊗_E E')), and Hom_{Perv(X,E')}(K ⊗ E', L ⊗ E') = Hom_{Perv(X,E)}(K, L) ⊗_E E'. Reduction from O to O/λ (K ↦ K ⊗^L O/λ) is right t-exact for p and sends the heart of p to pD^{[−1,0]} (EDC.5/integral-perverse-torsion-pair). Simple objects of Perv(X, Ē) are defined over some finite E'.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over a field, ℓ invertible; E ⊂ E' finite extensions of ℚ_ℓ. Use the corrected base-field/category hypotheses of EDC.5/perverse-t-structure. The Hom scalar-extension identity is for a finite coefficient-field extension (general algebraic extensions through the stated filtered colimit), not an arbitrary field homomorphism.

**Construction and proof plan.**

1. The stalk/costalk conditions are insensitive to the faithfully flat extension E → E' (ℋ^i(K ⊗ E') = ℋ^i(K) ⊗ E'), so ⊗E' is t-exact; j_!* commutes with ⊗E' by its truncation formula (EDC.5/intermediate-extension, Deligne's formula) (BBD 2.2.18).
2. Homs: RHom commutes with the finite free extension (EDC.6/adic-transport-of-duality-and-classes).
3. Reduction: K ⊗^L O/λ sits in the triangle K →λ K → K ⊗^L O/λ →, whose perverse cohomology sequence gives the amplitude [−1, 0].

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`](#node-EDC.5-integral-perverse-torsion-pair); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories); [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](#node-EDC.6-adic-transport-of-duality-and-classes).

**Acceptance examples.**

- IC_X(Ē) of a smooth curve is Ē[1].
- For X = Spec Ω, ⊗E' is the scalar extension of finite-dimensional vector spaces.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.18, p. 73. BBD's treatment of ℚ_ℓ and Q̄_ℓ coefficients for the perverse t-structure.

<a id="node-EDC.6-complex-analytic-comparison"></a>

#### Comparison with the complex-analytic constructible category ★

Node `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`; theorem. Planet: “Comparison with complex-analytic sheaves”.

Let X be separated of finite type over ℂ, X^an its analytification and Λ a finite ring (killed by n), O_E or E. The comparison functor ε^* : D^b_c(X_ét, Λ) → D^b_c(X^an, Λ) (constructible for algebraic stratifications) is an equivalence for finite Λ (BBD 6.1.2, from Artin's comparison theorem SGA 4 XVI 4.1), commutes with the six operations f^*, Rf_*, Rf_!, f^!, ⊗^L, RHom for morphisms of finite type (in particular with Verdier duality D_X), and is t-exact for the middle perverse t-structures, so it identifies Perv(X_ét, Λ) with algebraically constructible perverse sheaves on X^an and preserves j_!* and IC. For O_E coefficients the corresponding equivalence follows from finite-level comparison. For E coefficients the functor is fully faithful with essential image the algebraically constructible complexes whose cohomology local systems on normal connected strata admit monodromy-stable O_E lattices (BBD 6.1.2(A″),(B″)); it is an equivalence onto that image; the comparison of trace maps and cycle classes with topological orientation classes is EDC.6/trace-orientation-comparison.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X separated of finite type over ℂ; algebraically constructible complexes; Λ finite, O_E or E. For E coefficients the analytic target is restricted to the monodromy-stable-lattice essential image. A rank-one E local system on ℂ× with monodromy ℓ admits no stable O_E lattice and is not the analytification of an étale E local system.

**Construction and proof plan.**

1. Artin's comparison theorem (H^q(X_ét, F) ≅ H^q(X^an, F^an) for constructible F, SGA 4 XVI 4.1; and Rf_* comparison for f of finite type) is requested from CohomologicalPointCounting ComplexComparison through SchemeAndStackFoundations:SF.2 (its owner in the atlas convention).
2. Commutation with Rf_! follows from Rf_* for proper maps and j_! for open immersions (Nagata); with f^! and D by adjunction and the dualizing complexes on both sides (BBD 6.1.2).
3. Perverse t-exactness: the stalk/costalk conditions are computed on points of X and stratifications, which agree on both sides.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](#node-EDC.6-adic-transport-of-duality-and-classes); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = 𝔸¹_ℂ: H^q(𝔸¹_ét, Λ) = H^q(ℂ, Λ) = Λ for q = 0, 0 otherwise.
- IC of the nodal cubic over ℂ: ε^*IC_X = ν_*Λ_{P¹(ℂ)}[1], the topological IC complex.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 6.1.2(A′)–(C′), pp. 149–150. Finite and integral comparison are equivalences; rational comparison is fully faithful with the lattice essential image. Commutation with operations is (C′).

<a id="node-EDC.6-trace-orientation-comparison"></a>

#### Algebraic traces and cycle classes versus topological orientation

Node `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`; theorem.

Let X be smooth separated of pure dimension d over ℂ and Λ = ℤ/n, ℤ_ℓ or ℚ_ℓ. Under the comparison isomorphism H^q(X_ét, Λ) ≅ H^q(X^an, Λ) (EDC.6/complex-analytic-comparison) and the identification Λ(1) ≅ Λ given by exp(2πi/n) ↦ 1 (ζ_n ↦ 1): (a) the étale trace Tr : H^{2d}_c(X_ét, Λ(d)) → Λ (EDC.2:trace-purity) corresponds to integration against the complex orientation, Tr_X ↦ ∫_{X^an}, sending the class of a point to 1; (b) the étale cycle class cl(Z) ∈ H^{2r}(X_ét, Λ(r)) of a closed subvariety of codimension r corresponds to the topological fundamental class of Z^an (Poincaré dual of [Z^an]); (c) cup products and compactly supported duality pairings correspond. The sign convention: c₁(O(1)) on P¹ maps to the positive generator of H²(P¹(ℂ), ℤ) for the complex orientation, with the Kummer sequence matched to the exponential sequence by exp(2πi·/n).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X smooth over ℂ; the identification Λ(1) ≅ Λ through e^{2πi/n} is part of the statement (other choices change Tr by a sign or a unit).

**Construction and proof plan.**

1. The Kummer sequence 0 → μ_n → 𝔾_m → 𝔾_m → 0 maps to the exponential sequence on X^an via μ_n ≅ ℤ/n, e^{2πi k/n} ↔ k; hence c₁ corresponds to the topological first Chern class (CohomologicalPointCounting ComplexComparison L10–12, requested through SchemeAndStackFoundations:SF.2).
2. Traces are normalized by points and c₁(O(1)) on P¹ (EDC.2:trace-purity), and the topological integration satisfies the same normalization; both are compatible with Gysin maps of points, so they agree.
3. Cycle classes: both sides are determined by the fundamental class of the smooth locus and semi-purity (EDC.3/fundamental-class).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`](#node-EDC.2-trace-purity-top-degree-compact-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](#node-EDC.3-fundamental-class); `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- X = P¹: Tr(c₁(O(1))) = 1 on both sides (the stage's acceptance: P¹'s orientation).
- X an open curve: H²_c(X, Λ(1)) ≅ Λ with the same normalization.
- A smooth divisor D ⊂ X: cl(D) = c₁(O(D)) maps to the topological Poincaré dual of [D] under both routes.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 6.1.2 (B′), p. 149. The comparison of étale and analytic constructible categories over ℂ underlying the trace comparison.

<a id="node-EDC.6-complete-intersection-betti-comparison"></a>

#### Betti numbers of smooth complete intersections are independent of the field

Node `EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`; theorem.

Fix N, m and a multidegree (d_1, …, d_{N−m}). For every separably closed field k of characteristic ≠ ℓ and every smooth complete intersection X ⊂ P^N_k of that multidegree and dimension m, dim H^m(X, ℚ_ℓ) equals the topological Betti number b_m(X_ℂ^an) of any smooth complete intersection X_ℂ ⊂ P^N_ℂ of the same multidegree, and hence the primitive rank b_m^0 = dim H^m(X, ℚ_ℓ)_0 of EDC.4/complete-intersection-cohomology is a function of (N, m, d_•) only; for a smooth hypersurface of degree d, b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d.

Open obligations: [Euler characteristic of smooth complete intersections](#gap-EDC4-5); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** Smooth complete intersections of a fixed multidegree; ℓ invertible in k.

**Construction and proof plan.**

1. The parameter scheme S ⊂ ∏ P(Sym^{d_i}) over Spec ℤ[1/ℓ] of tuples defining a smooth complete intersection of dimension m is open with geometrically irreducible (hence connected) fibres and nonempty over every point; the universal family f : 𝒳 → S is smooth and proper (imported scheme geometry from SchemeAndStackFoundations:SF.0).
2. Smooth proper base change makes R^mf_*ℚ_ℓ lisse on the connected parameter scheme, hence its rank is constant. Identifications of different geometric fibres require a choice of path or specialization data; the canonical conclusion here is equality of ranks, not a canonical identification of all fibres.
3. Over ℂ, Artin's comparison (EDC.6/complex-analytic-comparison) identifies dim H^m(X_ℂ, ℚ_ℓ) with the topological Betti number; the hypersurface formula is the classical Euler characteristic computation (χ(X) = deg c_m(T_X), with EDC.4/complete-intersection-cohomology giving all other Betti numbers).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`](#node-EDC.4-complete-intersection-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`.

**Acceptance examples.**

- Smooth plane cubics: b_1 = 2 over every k (= (8 − 2)/3 = 2 by the formula with m = 1, d = 3).
- Smooth quadric surfaces: b_2^0 = (1 + 1)/2 = 1.

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16, p. 110. Milne: the primitive rank depends only on m and the degrees, with the explicit hypersurface formula.

<a id="node-EDC.6-diamond-transport-of-duality"></a>

#### Transport of duality and perversity statements to diamonds in characteristic p

Node `EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`; theorem.

Let k be of characteristic p, X separated of finite type over k, and Λ torsion killed by an integer prime to p. Put a : X → Spec k, B = (Spec k)^◇, and K_{X^◇/B} = a^{◇!}c_{Spec k}^*Λ. For K ∈ D^b_c(X, Λ), ECD 27.2–27.4 imply Rc_{X*}K_{X^◇/B} ≅ K_X and Rc_{X*}RHom(c_X^*K, K_{X^◇/B}) ≅ D_XK. These recover scheme duality through the right adjoint. The stronger assertions c_X^*K_X ≅ K_{X^◇/B} and c_X^*D_XK ≅ D_{X^◇/B}c_X^*K are conditional on an additional exceptional-pullback/internal-Hom comparison and preservation of the essential image; these inputs are not supplied by 27.1–27.4. No perverse t-structure on arbitrary diamonds is asserted.

Open obligations: [Strong exceptional-pullback and duality transport to diamonds](#gap-EDC4-6); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** Characteristic p, finite-type separated X over k, torsion coefficients prime to p; the dualizing complex is relative to B = (Spec k)^◇. The strong pullback transport requested by the stage remains a recorded gap; this node proves only right-adjoint recovery.

**Construction and proof plan.**

1. Use R a^! Rc_{Spec k*} ≅ Rc_{X*}R a^{◇!} and Rc_{Spec k*}c_{Spec k}^*Λ ≅ Λ to recover K_X.
2. Apply the internal-Hom right-adjoint identity of 27.3 with first input c_X^*K, then the unit K ≅ Rc_{X*}c_X^*K to obtain D_XK.
3. A counit c_X^*Rc_{X*}D_{X^◇/B}c_X^*K → D_{X^◇/B}c_X^*K need not be an isomorphism by full faithfulness alone; the missing essential-image argument is recorded as a gap.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](#node-EDC.1-adjoint-dualizing-complex); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); `AdicCoefficientsAndComparisons:L3`.

**Acceptance examples.**

- X = 𝔸^d over k: K_{(𝔸^d)^◇} ≅ Λ(d)[2d] = c^*K_{𝔸^d}.
- X = P¹: D commutes with c^* on Λ_X, giving Λ(1)[2] on both sides.

**Sources.**

- [Scholze-ECD-2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.4, p. 165. 27.4 compares ! operations using c^* for Rf_! and Rc_* for Rf^!; together with 27.2–27.3 it supplies right-adjoint recovery, not an unconditional c^* duality isomorphism.

### EDC.7 — Pure intersection complexes and decomposition

Import the independently owned weight estimates and absolute hard Lefschetz. Construct weight filtrations and pure intermediate extensions, then deduce geometric semisimplicity and simultaneous finite decomposition over the algebraic closure. Geometric Ext¹ need not vanish: the Frobenius-invariant class of the arithmetic extension vanishes. For a projective morphism, the chosen relatively ample η yields twisted relative hard Lefschetz. Categorical primitive decomposition needs its own graded-object/kernel construction; a vector-space theorem cannot be substituted unchanged. Characteristic-zero transport retains the restricted stratification/coefficient categories, geometric-origin definition and descent obligations.

Coverage: `partial`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.7-weights-and-perverse-truncation"></a>

#### Weights are compatible with perverse truncation

Node `EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`; theorem.

Let X₀/𝔽_q be as in Weil II and K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) a mixed complex (DeligneWeightsAndPurity:DWP.8/mixed-complexes). Then: (a) the perverse cohomology sheaves pH^i(K₀) are mixed; (b) K₀ has weights ≤ w iff each pH^i(K₀) has weights ≤ w + i, and K₀ has weights ≥ w iff each pH^i(K₀) has weights ≥ w + i (BBD 5.4.1); (c) the six operations satisfy the weight estimates f_!, f^* preserve D_{≤w}, f_*, f^! preserve D_{≥w}, and D exchanges D_{≤w} and D_{≥−w} (BBD 5.1.14; owned by DWP.8 and imported here); (d) for j an affine immersion, j_! sends mixed perverse sheaves of weights ≤ w to weights ≤ w, and j_* sends those of weights ≥ w to weights ≥ w; the opposite bounds are not asserted.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8.

**Construction and proof plan.**

1. (c) is imported: DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11, DWP.8/compact-support-direct-image-upper-weights-6-2-3 and DWP.8/directional-weight-estimates (Weil II 6.1.11, 6.2.3).
2. (a),(b): BBD 5.4.1 — by induction on the perverse amplitude using the truncation triangles and the fact that D_{≤w} is stable under extensions; the 'if' directions use the triangles directly, the 'only if' directions use (c) for i^*, i^! on strata and the stalk description of pD^{≤0}.
3. (d): j affine, so j_* and j_! are t-exact on perverse sheaves when quasi-finite (EDC.5/affine-perverse-artin-vanishing), and (c).

**Prerequisites.** `DeligneWeightsAndPurity:DWP.8/mixed-complexes`; `DeligneWeightsAndPurity:DWP.8/pure-complexes`; `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`; `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`](#node-EDC.5-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](#node-EDC.5-t-cohomology-functor); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](#node-EDC.5-affine-perverse-artin-vanishing).

**Acceptance examples.**

- K₀ = ℚ̄_ℓ on a smooth curve X₀ over 𝔽_q (pure of weight 0): its only perverse cohomology is pH^1(K₀) = ℚ̄_ℓ[1], pure of weight 1 = w + i, as (b) requires.
- K₀ = ℚ̄_ℓ[1] on the same curve is perverse and pure of weight 1.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.4.1, p. 141 (with Stabilités 5.1.14, p. 128). Stability of weights under the six operations and duality; weights of perverse cohomology.

<a id="node-EDC.7-ext-vanishing-weights"></a>

#### Ext-vanishing between weights

Node `EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights`; theorem.

In the situation of Weil II over 𝔽_q: (a) if K₀ has weights ≤ w and L₀ has weights ≥ w, then the Frobenius module H^i(X, RHom(K, L)) has weights ≥ i for every i, and Hom(K₀, L₀[i]) = 0 for i ≥ 2; (b) if K₀ and L₀ are perverse, K₀ of weights ≤ w and L₀ of weights > w, then Hom(K₀, L₀) = 0 and Ext¹_{Perv(X₀)}(K₀, L₀) = Hom(K₀, L₀[1]) = 0 (BBD 5.1.15).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8.

**Construction and proof plan.**

1. RHom(K₀, L₀) = D(K₀ ⊗^L D L₀) has weights ≥ 0 when K₀ ∈ D_{≤w} and L₀ ∈ D_{≥w}, since D L₀ ∈ D_{≤−w}, ⊗ adds upper weights and D exchanges D_{≤0} and D_{≥0} (EDC.7/weights-and-perverse-truncation (c)); pushing forward to Spec 𝔽_q preserves D_{≥0} (Rf_* of a complex of weights ≥ 0), so H^i(X, RHom(K, L)) has weights ≥ i.
2. The Hochschild–Serre sequence 0 → H^{i−1}(X, RHom)_F → Hom(K₀, L₀[i]) → H^i(X, RHom)^F → 0 for the absolute Frobenius (Weil II 5.1.2.5) and the absence of the eigenvalue 1 in weights ≠ 0 give (a); for perverse K, L, H^i(X, RHom(K, L)) = 0 for i < 0, and in (b) H⁰ and H¹ have weights > 0, so neither the invariants of H⁰ nor the coinvariants of H⁰ (which compute Hom and Ext¹) survive (BBD 5.1.15).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](#node-EDC.7-weights-and-perverse-truncation); `DeligneWeightsAndPurity:DWP.8/pure-complexes`; `DeligneWeightsAndPurity:DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`.

**Acceptance examples.**

- On Spec 𝔽_q take K₀ = ℚ̄_ℓ of weight 0 and L₀ = ℚ̄_ℓ(−1) of weight 2: the strict-order hypotheses apply and Hom = Ext¹ = H¹(𝔽_q, ℚ̄_ℓ(−1)) = 0.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 5.1.15, p. 129. Vanishing of Hom and Ext¹ between complexes of incompatible weights.

<a id="node-EDC.7-mixed-perverse-weight-filtration"></a>

#### The weight filtration of a mixed perverse sheaf

Node `EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-weight-filtration`; theorem.

A mixed perverse sheaf F₀ on X₀ (separated of finite type over 𝔽_q, coefficients ℚ̄_ℓ) has a unique finite increasing filtration W (the weight filtration) by perverse subsheaves such that Gr^W_i F₀ is pure of weight i; every morphism of mixed perverse sheaves is strictly compatible with the weight filtrations (BBD 5.3.5). The subcategory of mixed perverse sheaves is stable under subquotients and extensions in Perv(X₀).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8.

**Construction and proof plan.**

1. Stability of mixed perverse sheaves under subquotients (BBD 5.3.1) and induction on length (EDC.5/simple-perverse-sheaves), with Ext¹(V₀, U₀) = 0 for simple U₀, V₀ of weights u > v (EDC.7/ext-vanishing-weights) to order the composition factors (BBD 5.3.5).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights`](#node-EDC.7-ext-vanishing-weights); [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](#node-EDC.7-weights-and-perverse-truncation); [`EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`](#node-EDC.5-simple-perverse-sheaves).

**Acceptance examples.**

- A pure perverse sheaf has a one-step filtration.
- Rj_*ℚ̄_ℓ[1] for j : 𝔾_m → 𝔸¹ over 𝔽_q: W₁ = ℚ̄_ℓ_{𝔸¹}[1] (weight 1) and Gr^W_2 = i_{0*}ℚ̄_ℓ(−1) (weight 2).

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.3.5, p. 136. A mixed perverse sheaf has a unique finite increasing weight filtration with pure graded pieces; morphisms are strict.

<a id="node-EDC.7-ic-purity"></a>

#### Purity of intersection complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/ic-purity`; theorem. Planet: “Purity of intersection complexes”.

Let X₀ be separated of finite type over 𝔽_q, j : U₀ → X₀ a locally closed immersion with U₀ smooth irreducible of dimension d, and L₀ a lisse ℚ̄_ℓ-sheaf on U₀ pure of weight w. Then IC_{X₀}(L₀) := j_!*(L₀[d]) is pure of weight w + d. More generally, j_!* preserves purity: if F₀ is a perverse sheaf on U₀ pure of weight w then j_!*F₀ is pure of weight w (BBD 5.3.2); for j affine, j_!*F₀ is the image of the weight-≤-w object j_!F₀ in the weight-≥-w object j_*F₀.

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8. L₀ lisse and pure of weight w on the smooth U₀; the weight is shifted by d in the perverse normalization (L₀[d] has weight w + d).

**Construction and proof plan.**

1. Reduce to j affine (an open immersion with complement a Cartier divisor, then compose; BBD 5.3.2).
2. For j affine and quasi-finite, j_! and j_* are t-exact (EDC.5/affine-perverse-artin-vanishing); j_!F₀ has weights ≤ w and j_*F₀ has weights ≥ w (EDC.7/weights-and-perverse-truncation (d)); subquotients of objects of weights ≤ w (≥ w) have weights ≤ w (≥ w) (BBD 5.3.1), so the image j_!*F₀ has weights both ≤ w and ≥ w.
3. L₀[d] is pure of weight w + d (DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](#node-EDC.5-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](#node-EDC.7-weights-and-perverse-truncation); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](#node-EDC.5-affine-perverse-artin-vanishing); `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`.

**Acceptance examples.**

- X₀ smooth: IC_{X₀}(L₀) = L₀[d], pure of weight w + d.
- X₀ the nodal cubic over 𝔽_q with split node s: IC = ν_*ℚ̄_ℓ[1] is pure of weight 1, while ℚ̄_ℓ[1] on X₀ is mixed: its perverse subobject i_{s*}ℚ̄_ℓ has weight 0.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Corollaire 5.3.2, p. 135. j_!* of a pure perverse sheaf along an affine immersion is pure of the same weight.

<a id="node-EDC.7-geometric-semisimplicity"></a>

#### Pure perverse sheaves are geometrically semisimple ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity`; theorem. Planet: “Geometric semisimplicity”.

Let F₀ be a perverse sheaf on X₀ (separated of finite type over 𝔽_q) pure of weight w. Then F := F₀ ⊗ 𝔽̄_q is a semisimple object of Perv(X, ℚ̄_ℓ): F ≅ ⊕ i_{V*}j_!*(L[dim V]) with L irreducible lisse on smooth V (BBD 5.3.8). No semisimplicity of F₀ itself, of the Frobenius action, or of any mod-ℓ or integral object is asserted.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8.

**Construction and proof plan.**

1. The weight filtration of EDC.7/mixed-perverse-weight-filtration and Ext-vanishing reduce to F₀ pure simple-graded; on a smooth dense open, F₀ is a shifted pure lisse sheaf and Deligne's semisimplicity theorem (DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii) makes it geometrically semisimple.
2. Boundary extensions: BBD 5.3.6–5.3.8 split the pure arithmetic extensions after geometric base change. The geometric Ext¹ of pure pieces need not vanish; its Frobenius weights are ≥1, so the Frobenius-invariant geometric extension class of an arithmetic extension vanishes. This is the required splitting argument, not a claim that the entire geometric Ext¹ group is zero.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-weight-filtration`](#node-EDC.7-mixed-perverse-weight-filtration); [`EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights`](#node-EDC.7-ext-vanishing-weights); [`EtaleDualityAndPerverseSheaves:EDC.7/ic-purity`](#node-EDC.7-ic-purity); `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`; [`EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`](#node-EDC.5-simple-perverse-sheaves).

**Acceptance examples.**

- A pure lisse sheaf on a smooth curve: geometric semisimplicity is Deligne's theorem.
- Non-example: F₀ = the unipotent rank-2 local system on 𝔾_m over 𝔽_q with nontrivial geometric monodromy is mixed, not pure, and F is not semisimple.
- On a point over 𝔽_q, a two-dimensional unipotent Frobenius representation with eigenvalues 1 is pure of weight 0 and arithmetically nonsplit, but becomes a sum of constant sheaves over 𝔽̄_q. On an elliptic curve, geometric Ext¹(ℚ̄_ℓ[1],ℚ̄_ℓ[1]) = H¹(X,ℚ̄_ℓ) is nonzero, so geometric Ext¹-vanishing is not a valid proof.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.3.8, p. 138. A pure perverse sheaf on X₀ becomes semisimple on X.

<a id="node-EDC.7-pure-complex-decomposition"></a>

#### Pure complexes decompose geometrically ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition`; theorem. Planet: “Decomposition theorem (finite fields)”.

Let K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) be pure of weight w (X₀ separated of finite type over 𝔽_q). Then over 𝔽̄_q, K ≅ ⊕_i pH^i(K)[−i] (BBD 5.4.5), each pH^i(K₀) is pure of weight w + i, and each pH^i(K) is semisimple (EDC.7/geometric-semisimplicity); hence K is a direct sum of shifted IC complexes i_{V*}j_!*(L[dim V])[n] with L irreducible lisse on smooth V (BBD 5.4.6). The splitting is not canonical and need not be compatible with the Weil structure of K₀.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8.

**Construction and proof plan.**

1. pH^i(K₀) pure of weight w + i (EDC.7/weights-and-perverse-truncation (b)).
2. The connecting map of the truncation triangle pτ_{<i}K → pτ_{≤i}K → pH^i(K)[−i] → is a class in Ext¹(pH^i(K)[−i], pτ_{<i}K); weights force its image to vanish after base change to 𝔽̄_q (BBD 5.4.4 with 5.1.15), so each triangle splits geometrically (BBD 5.4.5).
3. Combine with EDC.7/geometric-semisimplicity (BBD 5.4.6).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](#node-EDC.7-weights-and-perverse-truncation); [`EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights`](#node-EDC.7-ext-vanishing-weights); [`EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity`](#node-EDC.7-geometric-semisimplicity).

**Acceptance examples.**

- K₀ = ℚ̄_ℓ ⊕ ℚ̄_ℓ(−1)[−2] on Spec 𝔽_q (pure of weight 0): K = ℚ̄_ℓ ⊕ ℚ̄_ℓ[−2].
- Non-example: K₀ = Rj_*ℚ̄_ℓ[1] for j : 𝔾_m → 𝔸¹ is perverse and mixed of weights 1 and 2; over 𝔽̄_q the sequence 0 → ℚ̄_ℓ[1] → Rj_*ℚ̄_ℓ[1] → i_{0*}ℚ̄_ℓ(−1) → 0 does not split (Hom(i_{0*}ℚ̄_ℓ, Rj_*ℚ̄_ℓ[1]) = 0), so purity is needed.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.4.5, p. 142. A pure complex is, over F̄, the direct sum of its shifted perverse cohomology sheaves, which are sums of IC complexes.

<a id="node-EDC.7-proper-direct-image-decomposition"></a>

#### The decomposition theorem for proper maps over finite fields

Node `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`; theorem.

Let f₀ : X₀ → Y₀ be a proper morphism of schemes separated of finite type over 𝔽_q and K₀ a perverse sheaf on X₀ pure of weight w (e.g. K₀ = IC_{X₀}(L₀) with L₀ pure of weight w − dim X₀). Then Rf₀_*K₀ is pure of weight w, and over 𝔽̄_q: Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i] with each pH^i(Rf_*K) semisimple, a direct sum of i_{V*}IC_{V̅}(L) for irreducible lisse L on smooth locally closed V ⊂ Y. In particular, for a pure arithmetic IC complex of weight w on X₀ proper over 𝔽_q, H^j(X, IC_X(L)) is pure of weight w+j. An arbitrary local system without a pure arithmetic model is not covered. The finite-type proper models and resolutions over 𝔽̄_q used by GeometricSatakeAndFusion GS3/GS4 are instances; no mod-ℓ or integral decomposition is asserted.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8. f₀ proper; K₀ pure perverse.

**Construction and proof plan.**

1. Rf₀_* = Rf₀_! preserves purity for f₀ proper (DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6, Weil II 6.2.6).
2. Apply EDC.7/pure-complex-decomposition to Rf₀_*K₀ and EDC.7/geometric-semisimplicity to its perverse cohomology.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition`](#node-EDC.7-pure-complex-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity`](#node-EDC.7-geometric-semisimplicity); [`EtaleDualityAndPerverseSheaves:EDC.7/ic-purity`](#node-EDC.7-ic-purity); `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`.

**Acceptance examples.**

- f = identity: the statement is EDC.7/geometric-semisimplicity.
- f : Bl_x S → S the blow-up of a point of a smooth surface: Rf_*ℚ̄_ℓ[2] ≅ ℚ̄_ℓ[2] ⊕ i_{x*}ℚ̄_ℓ(−1).
- f : X → Spec 𝔽_q with X smooth proper: H^∗(X) pure (Weil II), and the decomposition is the grading by degree.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.4.5, p. 142. Applied to Rf_*F for f proper and F pure perverse.
- [Zhu-2017](https://arxiv.org/pdf/1407.8519v3), proof of Lemma 2.11, p. 26 (arXiv v3). Zhu applies the decomposition theorem to a finite-type model of a resolution of a Schubert variety (PAPER-ZHU-17/E06), the instance this node supplies.

<a id="node-EDC.7-relative-hard-lefschetz"></a>

#### Relative hard Lefschetz ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`; theorem. Planet: “Relative hard Lefschetz theorem”.

Let f₀ : X₀ → Y₀ be a projective morphism of schemes separated of finite type over 𝔽_q, η ∈ H²(X₀, ℚ̄_ℓ(1)) the first Chern class of an f₀-ample line bundle, and F₀ a perverse sheaf on X₀ pure of weight w. Then for every i ≥ 0, cup product with η^i induces isomorphisms η^i : pH^{−i}(Rf₀_*F₀) ≅ pH^i(Rf₀_*F₀)(i), between pure perverse sheaves both of weight w − i: the untwisted pH^i has weight w + i and the twist (i) subtracts 2i (BBD 5.4.10). A proper morphism has no automatic ample class; the statement requires projectivity and a chosen relatively ample class.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8. f₀ projective with an f₀-ample line bundle; η its Chern class (EDC.3/chern-classes in its adic form).

**Construction and proof plan.**

1. Local on Y₀: factor f₀ as X₀ ↪ P^d × Y₀ → Y₀ with η = c₁(O(1)) after replacing η by a multiple (BBD 5.4.10 proof).
2. Case i = 1 via a hyperplane section and the weak Lefschetz-type exact sequences on the fibres (perverse Artin vanishing EDC.5/affine-perverse-artin-vanishing for the affine complement), then induction on i (BBD 5.4.14–5.4.15).
3. The absolute hard Lefschetz theorem over a point (DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1 and its version for potentially pure complexes DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13) is the input on fibres.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`](#node-EDC.7-proper-direct-image-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](#node-EDC.5-affine-perverse-artin-vanishing); `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`; `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`; [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](#node-EDC.3-chern-classes); [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](#node-EDC.6-adic-transport-of-duality-and-classes).

**Acceptance examples.**

- Y₀ = Spec 𝔽_q, F₀ = ℚ̄_ℓ[n] on X₀ smooth projective: the absolute hard Lefschetz H^{n−i}(X) ≅ H^{n+i}(X)(i).
- f₀ : P¹ × Y₀ → Y₀, F₀ = ℚ̄_ℓ[dim Y₀ + 1]: pH^{−1} = ℚ̄_ℓ[dim Y₀], pH^{1} = ℚ̄_ℓ(−1)[dim Y₀], η an isomorphism.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.4.10, p. 144. Relative hard Lefschetz: η^i : pH^{−i}f_*F ≅ pH^i f_*F(i) for F pure perverse.

<a id="node-EDC.7-relative-primitive-decomposition"></a>

#### Primitive decomposition of perverse direct images

Node `EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition`; theorem.

In the situation of EDC.7/relative-hard-lefschetz, for i ≥ 0 let P^{−i} := ker(η^{i+1} : pH^{−i}(Rf₀_*F₀) → pH^{i+2}(Rf₀_*F₀)(i+1)). Then pH^{−i}(Rf₀_*F₀) = ⊕_{a ≥ 0} η^a P^{−i−2a}(−a) and, over 𝔽̄_q, Rf_*F ≅ ⊕_{i} ⊕_{a=0}^{i} η^a P^{−i}(−a)[i − 2a] (non-canonically, by EDC.7/pure-complex-decomposition); in particular dim of stalks satisfies the hard Lefschetz symmetry.

Open obligations: [Categorical graded Lefschetz operator and primitive decomposition](#gap-EDC4-8); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed complexes as in DeligneWeightsAndPurity:DWP.8. As in EDC.7/relative-hard-lefschetz.

**Construction and proof plan.**

1. Construct the graded degree-two operator and primitive kernels in the abelian category Perv(Y₀), and apply the categorical hard-Lefschetz decomposition argument using kernel splittings and the inverse Lefschetz isomorphisms. DWP.9/lefschetz-decomposition-of-a-graded-operator is stated for vector spaces and is motivation, not a supplier of this categorical statement. The missing reusable categorical construction is recorded as a gap.
2. Combine with EDC.7/pure-complex-decomposition for the derived statement.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`](#node-EDC.7-relative-hard-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition`](#node-EDC.7-pure-complex-decomposition); `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`.

**Acceptance examples.**

- Y₀ = point: the classical primitive decomposition of H^∗ of a smooth projective variety.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 5.4.10, p. 144. The primitive decomposition follows formally from relative hard Lefschetz.

<a id="node-EDC.7-spreading-out-to-finite-fields"></a>

#### From ℂ to finite fields: spreading out constructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`; theorem.

In the setting of BBD 6.1.8–6.1.10, after choosing a finite algebraic stratification T, finite collections of allowed lisse coefficient systems L, a finitely generated model over ℤ, and a suitable discrete valuation ring linking the generic and finite-field geometric fibres, there are germs of specialization equivalences between the restricted constructible categories D^b_{T,L} on the fibres. They respect the associated perverse t-structures and the operations for which compatible models and generic base-change hypotheses have been chosen. BBD explicitly does not obtain an equivalence of the entire D^b_c categories by passing to the limit. For a simple perverse sheaf of geometric origin in the precise sense of BBD 6.2.4, BBD 6.2.6 supplies a pure arithmetic structure on a suitable specialization (property (P)); this is the input for the characteristic-zero decomposition theorem. No canonical equivalence for every closed fibre, blanket ULA assertion, or intrinsic finite-field weight of an arbitrary complex sheaf is asserted.

Open obligations: [Geometric origin as a target-level definition](#gap-EDC4-7); [Stratified specialization and coefficient-descent closure](#gap-EDC4-9); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** The chosen T,L, model, localization and trait data of BBD 6.1.8–6.1.10; the specialization functors are germs on the restricted categories. The pure-specialization conclusion applies to simple perverse sheaves of geometric origin, BBD 6.2.6, not arbitrary complexes generated by unspecified subquotient operations.

**Construction and proof plan.**

1. Use the stratified coefficient categories and generic base-change construction of BBD 6.1.8–6.1.10, retaining all choices rather than claiming a canonical identification of full constructible categories.
2. For a simple perverse sheaf of geometric origin use BBD 6.2.6 property (P), with induction on the generating operations from 6.2.4.
3. Transport decomposition along these chosen equivalences; the precise geometric-origin definition and the imported stratified specialization construction are recorded as gaps until supplied as target-level objects.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](#node-EDC.6-adic-transport-of-duality-and-classes); `SchemeAndStackFoundations:SF.2`; `DeligneWeightsAndPurity:DWP.8/mixed-complexes`.

**Acceptance examples.**

- K = ℚ_X for X smooth projective over ℂ: K_s is pure for almost all s (Weil II), and H^∗(X^an, ℚ) ⊗ ℚ_ℓ ≅ H^∗(X_s̄, ℚ_ℓ).

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 6.1.8–6.1.10, pp. 155–159; 6.2.4–6.2.6, pp. 162–164. The equivalences are restricted to chosen strata and coefficient families; 6.1.10 warns against a full-category limit. Pure specialization of simple geometric-origin objects is 6.2.6.

<a id="node-EDC.7-characteristic-zero-decomposition"></a>

#### The decomposition theorem over the complex numbers ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`; theorem. Planet: “Decomposition theorem over ℂ”.

Let f : X → Y be a proper morphism of separated schemes of finite type over ℂ and K a semisimple perverse sheaf of geometric origin on X (e.g. IC_X(L) with L a local system of geometric origin, or ℚ_X[d] for X smooth of pure dimension d). Then Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i] in D^b_c(Y^an, ℂ), with geometric origin and semisimplicity as defined in BBD 6.2.4; an ℓ-adic version uses the stable-lattice essential image and coefficient-descent data, and a ℚ version needs a separate descent argument, each pH^i(Rf_*K) is semisimple of geometric origin, and for f projective with relatively ample class η, η^i : pH^{−i}(Rf_*K) ≅ pH^i(Rf_*K) (BBD 6.2.5, 6.2.10).

Open obligations: [Geometric origin as a target-level definition](#gap-EDC4-7); [Stratified specialization and coefficient-descent closure](#gap-EDC4-9); [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** f proper over ℂ; K semisimple perverse of geometric origin (BBD 6.2.4); relative hard Lefschetz needs f projective with η. The cited BBD 6.2.5 is the complex-coefficient theorem. EDC.6/complex-analytic-comparison alone does not identify all analytic rational local systems with étale ones or descend a complex splitting to ℚ.

**Construction and proof plan.**

1. Apply the restricted specialization construction and BBD 6.2.6 property (P) to each simple constituent of geometric origin. Do not attribute pure specialization to the definition 6.2.4 alone.
2. Apply EDC.7/proper-direct-image-decomposition and EDC.7/relative-hard-lefschetz over 𝔽̄_q and transport back by specialization and EDC.6/complex-analytic-comparison (BBD 6.2.5).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`](#node-EDC.7-proper-direct-image-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`](#node-EDC.7-relative-hard-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison).

**Acceptance examples.**

- f : X̃ → X a resolution of a surface with an isolated singularity: Rf_*ℚ[2] ≅ IC_X ⊕ (skyscraper of rank the number of exceptional curves).
- X smooth projective → point: H^∗(X, ℚ) splits by degree and satisfies hard Lefschetz.

**Sources.**

- [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 6.2.5, p. 163. The decomposition theorem for proper maps over ℂ and complexes of geometric origin.

### EDC.8 — Correspondences and the functional-equation interface

Use left pullback and right upper shriek consistently. Composition, restriction and pushforward must act on the actual correspondence morphisms with the required coherence, rather than merely identify supports. Evaluation defines the trace class on the fixed scheme, and proper integration defines local terms. Tame finite-order automorphisms are handled by the punctured-normal-cone criterion, not a contraction claim. The final linear algebra exports reciprocal characteristic polynomials and the middle determinant sign from a genuine perfect Frobenius pairing, without assuming Frobenius diagonalizability or semisimplicity.

Coverage: `partial`. The obligations are listed with the nodes and in the gap register.

<a id="node-EDC.8-cohomological-correspondence"></a>

#### Cohomological correspondences ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`; definition. Planet: “Cohomological correspondence”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Correspondence/Basic`; namespace: `TauCeti.EtaleDuality`.

Let X, Y be separated schemes of finite type over k. A correspondence from X to Y is a separated finite-type k-scheme C with morphisms ←c : C → X and →c : C → Y. For L ∈ D(X, Λ) and M ∈ D(Y, Λ), a cohomological correspondence from (X, L) to (Y, M) supported on C is a morphism u : ←c^*L → →c^!M in D(C, Λ); equivalently (adjunction →c_! ⊣ →c^!) a morphism →c_!←c^*L → M. A morphism of correspondences p : C → D over X × Y with p proper induces p_* : Hom(←c^*L, →c^!M) → Hom(←d^*L, →d^!M). The atlas convention follows Lu–Zheng and Yun–Zhang (pull back along the left leg, upper shriek along the right leg); the stage text writes c₂^*K → c₁^!K for the same notion with the legs named in the opposite order, and Varshavsky writes the adjoint form c_{2!}c_1^*F_1 → F_2.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

**Construction and proof plan.**

1. Data: C with ←c, →c and u; f^* and f^! from EDC.0 and EDC.1:adjoint/exceptional-inverse-image; the adjoint form by EDC.1:adjoint/sheafified-adjunction (Rf_! ⊣ f^!).
2. Morphisms of correspondences: for p proper, u ↦ (←d^*L → p_*p^*←d^*L = p_*←c^*L →p_*u p_*→c^!M = p_!p^!→d^!M → →d^!M) (Lu–Zheng 2.6, using p_! ≅ p_*).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](#node-EDC.1-adjoint-exceptional-inverse-image); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](#node-EDC.0-etale-derived-category).

**Uses that determine the API.**

- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Frobenius-twisted Hecke correspondences on Igusa varieties with contracting boundary (Fujiwara's theorem)
- Yun–Zhang I, Appendix A.4 (YUN-ZHANG-17/35): Hecke correspondences on shtukas act on cohomology through cohomological correspondences
- ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic: Hecke and excursion actions on the cohomology of moduli of shtukas
- Hansen–Kaletha–Weinstein, §5.6 (PAPER-HANSEN-KALETHA-WEINSTEIN-22/090): local terms of finite-order automorphisms

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr` | constructor | A cohomological correspondence from (X, L) to (Y, M): C with ←c, →c separated of finite type and u : ←c^*L ⟶ →c^!M. |
| `TauCeti.EtaleDuality.CohCorr.ofAdjoint` | equivalence | Cohomological correspondences supported on C are in bijection with morphisms →c_!←c^*L ⟶ M. |
| `TauCeti.EtaleDuality.CohCorr.id` | constructor | The identity correspondence of (X, L): C = X, ←c = →c = id, u = id. |
| `TauCeti.EtaleDuality.CohCorr.ofMorphism` | constructor | For f : X → Y and φ : f^*M ⟶ L on X, the correspondence from (Y, M) to (X, L) supported on C = X with legs ←c = f, →c = id and u = φ (graph correspondence). |
| `TauCeti.EtaleDuality.CohCorr.properMap` | functoriality | A proper morphism p : C → D of correspondences over X × Y induces p_* : Hom(←c^*L, →c^!M) → Hom(←d^*L, →d^!M). |
| `TauCeti.EtaleDuality.CohCorr.properMap_comp` | functoriality | (q ∘ p)_* = q_* ∘ p_* and id_* = id. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.cohCorr_id_ofAdjoint` | computation | Under CohCorr.ofAdjoint the identity correspondence of (X, L) corresponds to id_L. |
| `TauCeti.EtaleDuality.cohCorr_empty` | degenerate | If C = ∅ the only cohomological correspondence supported on C is 0. |
| `TauCeti.EtaleDuality.cohCorr_point` | compatibility | For X = Y = C = Spec Ω (Ω separably closed), cohomological correspondences from L to M are morphisms of complexes of Λ-modules L ⟶ M. |
| `TauCeti.EtaleDuality.not_cohCorr_pullback_pullback` | non-example | A morphism ←c^*L ⟶ →c^*M is not a cohomological correspondence when →c is not étale: for →c : 𝔸¹ → Spec Ω, →c^!Λ = Λ(1)[2] ≠ →c^*Λ, and the trace formalism needs the ! form. |

**Acceptance examples.**

- The graph of a morphism f : X → Y with u : f^*M → f^*M = Γ^!… gives the correspondence of f^*; the identity correspondence C = X with u = id.

**Sources.**

- [Lu-Zheng-2022](https://arxiv.org/pdf/2005.08522v4), §2.2, Construction 2.6, p. 13 (arXiv v4). A cohomological correspondence (c, u) with u : ←c^*L → →c^!M.
- [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2), Definition 1.1.4 and Remark 1.1.5, p. 7 (arXiv v2). Varshavsky's c-morphisms u : c_{2!}c_1^*F_1 → F_2.

<a id="node-EDC.8-correspondence-pushforward"></a>

#### Proper pushforward of cohomological correspondences

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Correspondence/Pushforward`; namespace: `TauCeti.EtaleDuality`.

Given a correspondence C → X × Y and a commutative diagram of correspondences (f : X → S, h : C → B, g : Y → T, with B → S × T) such that one of: (i) the square C → B, X → S on the left is cartesian, (ii) f and the induced C → X ×_S B are proper, (iii) ←c and ←b are proper — there is a base change map ←b^*f_! → h_!←c^* and hence a pushforward h_! : Hom(←c^*L, →c^!M) → Hom(←b^*f_!L, →b^!g_!M) (Varshavsky 1.1.6). For S = B = T and the identity correspondence on S, a self-correspondence u of L induces an endomorphism f_!(u) of f_!L; for f proper (X proper over k, S = Spec k) this is the action RΓ(u) on RΓ(X, L). Pushforwards are compatible with composition of maps of correspondences.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

**Construction and proof plan.**

1. The base change map in the three cases (Varshavsky 1.1.6 (a)): proper base change for (i)–(ii) (imported through SchemeAndStackFoundations:SF.2 for Rf_!), and for (iii) the map adjoint to f_! → f_!c_*c^*.
2. u ↦ the composite ←b^*f_!L → h_!←c^*L →h_!(u) h_!→c^!M → →b^!g_!M, the last map adjoint to →b_!h_!→c^! = g_!→c_!→c^! → g_!.
3. Compatibility with composition of maps of correspondences: Varshavsky 1.1.6 (b).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](#node-EDC.8-cohomological-correspondence); `SchemeAndStackFoundations:SF.2`; [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps).

**Uses that determine the API.**

- Varshavsky, Proposition 1.2.5: the Lefschetz–Verdier formula is the commutation of traces with proper pushforward
- EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula: the action of u on RΓ_c is its pushforward to a point
- Yun–Zhang I, (A.24): h_!ζ : f_!F → g_!G for a map of correspondences

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.pushforward` | constructor | h_! : Hom(←c^*L, →c^!M) → Hom(←b^*f_!L, →b^!g_!M) under any of the conditions (i)–(iii). |
| `TauCeti.EtaleDuality.CohCorr.pushforward_comp` | functoriality | Pushforward along a composite of maps of correspondences is the composite of pushforwards. |
| `TauCeti.EtaleDuality.CohCorr.pushforward_id` | functoriality | Pushforward along the identity map of correspondences is the identity. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology` | data | For a self-correspondence u of L on X, RΓ_c(u) : RΓ_c(X, L) → RΓ_c(X, L), defined when ←c is proper. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology_id` | simp | RΓ_c(id_L) = id. |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.pushforward_identity_correspondence` | degenerate | Pushing the identity correspondence of (X, L) forward along f : X → Spec k proper gives the identity of RΓ(X, L). |
| `TauCeti.EtaleDuality.pushforward_graph_frobenius` | computation | For X₀ over 𝔽_q, the graph of Frobenius with its canonical u acts on RΓ_c(X, Λ) by the geometric Frobenius (compatibility with TraceFormula's convention). |
| `TauCeti.EtaleDuality.pushforward_closed_immersion` | compatibility | For f a closed immersion and C = X, the pushforward of u is f_*(u) under f_! = f_*. |
| `TauCeti.EtaleDuality.not_pushforward_nonproper` | non-example | For the diagonal correspondence of U = 𝔾_m supported inside X = 𝔸¹ with both legs the open immersion j, the left leg is not proper. The construction of a compact-support endomorphism via pushforward to a point has none of conditions (i)–(iii), so this formalism provides no such action without additional data. |

**Acceptance examples.**

- For C = X = Y, u = id_L and f : X → Spec k proper, f_!(u) = id on RΓ(X, L).

**Sources.**

- [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2), 1.1.6(a), p. 7 (arXiv v2). Push-forward of cohomological correspondences under the three conditions.

<a id="node-EDC.8-correspondence-restriction"></a>

#### Restriction of cohomological correspondences to invariant subschemes

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Correspondence/Restriction`; namespace: `TauCeti.EtaleDuality`.

Let u be a cohomological self-correspondence of L ∈ D(X, Λ) supported on c : C → X × X. A closed subscheme Z ⊂ X is c-invariant if ←c(→c^{−1}(Z)) ⊂ Z set-theoretically, i.e. →c^{−1}(Z) ⊂ ←c^{−1}(Z); an open U ⊂ X is c-invariant in the dual sense ←c^{−1}(U) ⊂ →c^{−1}(U) (the complement of an invariant closed subscheme). Then u restricts to a self-correspondence u|_Z of L|_Z supported on c|_Z : C_Z := →c^{−1}(Z)_red → Z × Z, and for Z closed invariant with open complement U (then U is invariant for the transposed condition) the localization triangle j_!(L|_U) → L → i_*(L|_Z) → is compatible with the restricted correspondences; consequently, when ←c is proper, Tr(RΓ_c(u)) = Tr(RΓ_c(u|_U)) + Tr(RΓ_c(u|_Z)) for Λ a field (additivity of traces).

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

**Construction and proof plan.**

1. Restriction: the base change maps of Varshavsky 1.1.9 for the closed embedding Z → X and the inclusion C_Z → C (the invariance makes ←c map →c^{−1}(Z) into Z, so the restriction is defined) (Varshavsky 1.1.9, 1.5.1, 1.5.6).
2. Compatibility with the localization triangle: functoriality of the restrictions in the triangle; additivity of traces of endomorphisms of triangles of perfect complexes over a field.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](#node-EDC.8-cohomological-correspondence); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions).

**Uses that determine the API.**

- Varshavsky, §1.5 and §2: locally invariant subschemes and the reduction of local terms to neighbourhoods of fixed points
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: the contracting boundary is an invariant closed subscheme whose contribution is isolated

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.IsInvariantClosed` | constructor | Z ⊂ X closed is c-invariant: →c^{−1}(Z) ⊆ ←c^{−1}(Z) set-theoretically (equivalently ←c(→c^{−1}(Z)) ⊆ Z). |
| `TauCeti.EtaleDuality.CohCorr.restrictClosed` | constructor | For Z closed c-invariant, the restricted correspondence u\|_Z on (Z, L\|_Z). |
| `TauCeti.EtaleDuality.CohCorr.restrictOpen` | constructor | For U open with ←c^{−1}(U) ⊆ →c^{−1}(U), the restricted correspondence u\|_U on (U, L\|_U). |
| `TauCeti.EtaleDuality.CohCorr.trace_additive` | relation | For Z closed invariant with complement U, ←c proper and Λ a field: Tr(RΓ_c(u)) = Tr(RΓ_c(u\|_U)) + Tr(RΓ_c(u\|_Z)). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.restrictClosed_self` | degenerate | Z = X is invariant and u\|_X = u. |
| `TauCeti.EtaleDuality.restrictClosed_empty` | degenerate | Z = ∅ is invariant and u\|_∅ = 0. |
| `TauCeti.EtaleDuality.restrictClosed_fixedPoint` | computation | For C = 𝔸¹ with ←c = id and →c(z) = z² and Z = {0} (invariant: →c^{−1}(0)_red = {0}), u\|_Z is the induced endomorphism of the stalk L_0. |
| `TauCeti.EtaleDuality.not_invariant_translation` | non-example | For C = 𝔸¹ with ←c = id and →c(z) = z + 1 over a field of characteristic 0, Z = {0} is not invariant (→c^{−1}(0) = {−1}) and no restriction is defined. |

**Acceptance examples.**

- X = 𝔸¹, C = graph of z ↦ z², Z = {0} is invariant; u|_Z is the identity of L_0.

**Sources.**

- [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2), Definition 1.5.1(a), p. 14 (arXiv v2). Restriction of correspondences to open and closed subschemes; locally invariant subschemes.

<a id="node-EDC.8-correspondence-composition"></a>

#### Composition of cohomological correspondences

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`; construction. Intended module: `TauCeti/AlgebraicGeometry/Etale/Correspondence/Composition`; namespace: `TauCeti.EtaleDuality`.

Given cohomological correspondences (c, u) from (X, L) to (Y, M) and (d, v) from (Y, M) to (Z, N), their composite (e, w) is supported on C ×_Y D with legs ←c ∘ ←d′ and →d ∘ →c′ (←d′ : C ×_Y D → C, →c′ : C ×_Y D → D) and w is the composite ←d′^*←c^*L →u ←d′^*→c^!M →α →c′^!←d^*M →v →c′^!→d^!N, where α is adjoint to the base change isomorphism →c′_!←d′^* ≅ ←d^*→c_! (proper base change for Rf_!). In this setting (schemes separated of finite type over k) the base change isomorphism always exists, so the composite is always defined; composition is associative up to the canonical isomorphisms of fibre products, unital for the identity correspondences, and compatible with proper maps of correspondences; it makes (X, L) with cohomological correspondences into a 2-category with symmetric monoidal structure (X, L) ⊗ (X′, L′) = (X × X′, L ⊠ L′) (Lu–Zheng, Construction 2.6). Pushforward to Spec k is functorial: for ←c, ←d proper, RΓ_c of the composite is the composite of the RΓ_c's.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

**Construction and proof plan.**

1. Composite as in Lu–Zheng Construction 2.6, using the proper base change isomorphism for Rf_! (requested through SchemeAndStackFoundations:SF.2) and the exchange map of EDC.1:adjoint/base-change-exchange-maps.
2. Associativity and units: coherence of base change isomorphisms (pseudofunctoriality of f^*, f_!, f^!; EDC.1:adjoint/upper-shriek-pseudofunctor).
3. Functoriality of RΓ_c: the pushforward to a point of a composite equals the composite of pushforwards (base change compatibility).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](#node-EDC.8-cohomological-correspondence); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor); `SchemeAndStackFoundations:SF.2`.

**Uses that determine the API.**

- Lu–Zheng, §2: the symmetric monoidal 2-category of cohomological correspondences whose categorical traces are the Lefschetz–Verdier traces
- Yun–Zhang I, §5: composition of Hecke correspondences on moduli of shtukas
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Frobenius composed with Hecke correspondences

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.comp` | constructor | The composite (e, w) supported on C ×_Y D. |
| `TauCeti.EtaleDuality.CohCorr.comp_id` | simp | Composition with the identity correspondence is the identity up to the canonical isomorphism C ×_Y Y ≅ C. |
| `TauCeti.EtaleDuality.CohCorr.comp_assoc` | relation | (w ∘ v) ∘ u ≅ w ∘ (v ∘ u) via the canonical isomorphism of iterated fibre products. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology_comp` | functoriality | RΓ_c(v ∘ u) = RΓ_c(v) ∘ RΓ_c(u) when the left legs are proper. |
| `TauCeti.EtaleDuality.CohCorr.externalProduct` | structure | (c, u) ⊠ (c′, u′) from (X × X′, L ⊠ L′) to (Y × Y′, M ⊠ M′). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.comp_graphs` | computation | For graph correspondences of morphisms f : X → Y and g : Y → Z with the canonical u, the composite is the graph of g ∘ f. |
| `TauCeti.EtaleDuality.comp_empty` | degenerate | If C = ∅ then the composite is supported on ∅ and is 0. |
| `TauCeti.EtaleDuality.comp_point` | compatibility | Over X = Y = Z = C = D = Spec Ω, composition is composition of morphisms of complexes of Λ-modules. |
| `TauCeti.EtaleDuality.not_comp_support_product` | non-example | The support of the composite is the fibre product C ×_Y D, not C × D: for C = D = Δ_X the composite is supported on X, not X × X. |

**Acceptance examples.**

- Composing with the identity correspondence returns the original correspondence.

**Sources.**

- [Lu-Zheng-2022](https://arxiv.org/pdf/2005.08522v4), §2.2, Construction 2.6, p. 13 (arXiv v4). Composite of cohomological correspondences supported on C ×_Y D, with α adjoint to the base change isomorphism.

<a id="node-EDC.8-correspondence-trace"></a>

#### The trace of a cohomological self-correspondence ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`; construction. Planet: “Trace of a cohomological correspondence”. Intended module: `TauCeti/AlgebraicGeometry/Etale/Correspondence/Trace`; namespace: `TauCeti.EtaleDuality`.

Let k be separably closed, c : C → X × X a self-correspondence, Fix(c) := C ×_{X×X} Δ_X the fixed-point scheme with Δ′ : Fix(c) → C, and L ∈ D_ctf(X, Λ) (or D^b_c with Λ a field). The trace map Tr_c : Hom(←c^*L, →c^!L) → H⁰(Fix(c), K_{Fix(c)}) is the composite of the identification Hom(←c^*L, →c^!L) ≅ H⁰(C, c^!(D_X L ⊠ L)) (Künneth and biduality), the restriction to Fix(c) via Δ′^* and the evaluation pairing Δ^*(D_X L ⊠ L) = D_X L ⊗ L → K_X, giving H⁰(Fix(c), Δ′^*c^!(D_X L ⊠ L)) → H⁰(Fix(c), K_{Fix(c)}) (Varshavsky 1.2.2, (1.2)–(1.4)). For β ⊂ Fix(c) open and closed and proper over k, the local term is LT_β(u) := ∫_β Tr_c(u)|_β ∈ Λ (trace H⁰(β, K_β) → Λ for β proper). The trace map is compatible with restriction to open subschemes of C and is linear in u.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k. L of finite Tor-dimension (or Λ a field) so that biduality and Künneth hold (EDC.1:biduality).

**Construction and proof plan.**

1. Künneth for D(X × X): Hom(←c^*L, →c^!L) ≅ H⁰(C, c^!(D_X L ⊠ L)) (Varshavsky 1.2.1–1.2.2; the formula RHom(pr₁^*L, pr₂^!L) ≅ D_X L ⊠ L uses EDC.1:biduality/constructible-biduality and the Künneth formula for f^!, EDC.1:biduality/duality-exchange-isomorphisms).
2. Evaluation: D_X L ⊗ L → K_X (EDC.1:adjoint/verdier-dual) and base change Δ′^*c^! → Δ_{Fix}^!… along the cartesian square defining Fix(c) (EDC.1:adjoint/base-change-exchange-maps).
3. Local terms by the trace H⁰(β, K_β) → Λ for β proper over k (EDC.1:biduality/relative-and-geometric-duality).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](#node-EDC.8-cohomological-correspondence); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](#node-EDC.1-adjoint-verdier-dual); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](#node-EDC.1-biduality-relative-and-geometric-duality).

**Uses that determine the API.**

- Varshavsky, Proposition 1.2.5 and Corollary 1.2.6: trace maps commute with proper pushforward, giving the Lefschetz–Verdier formula
- Hansen–Kaletha–Weinstein, Proposition 5.6.2: local terms loc_x(g, A) of finite-order automorphisms
- Yun–Zhang I, A.4.2: the trace τ_C(ζ) ∈ H₀^{BM}(Fix(C)) of a self-correspondence of shtukas

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.fixedLocus` | constructor | Fix(c) := C ×_{X × X} X, with its map to C. |
| `TauCeti.EtaleDuality.CohCorr.trace` | constructor | Tr_c : Hom(←c^*L, →c^!L) → H⁰(Fix(c), K_{Fix(c)}), Λ-linear. |
| `TauCeti.EtaleDuality.CohCorr.localTerm` | constructor | LT_β(u) := ∫_β Tr_c(u)\|_β for β ⊂ Fix(c) open, closed and proper over k. |
| `TauCeti.EtaleDuality.CohCorr.trace_add` | simp | Tr_c(u + u′) = Tr_c(u) + Tr_c(u′). |
| `TauCeti.EtaleDuality.CohCorr.trace_restrictOpen` | compatibility | For C′ ⊂ C open, Tr_{c\|C′}(u\|_{C′}) = Tr_c(u)\|_{Fix(c) ∩ C′}. |
| `TauCeti.EtaleDuality.CohCorr.localTerm_sum` | relation | If Fix(c) is proper, Σ_{β ∈ π₀(Fix(c))} LT_β(u) = ∫_{Fix(c)} Tr_c(u). |

**Discriminating unit tests.**

| Test | Kind | Expected behaviour |
|---|---|---|
| `TauCeti.EtaleDuality.trace_identity_euler` | computation | For the identity correspondence of (X, Λ) with X proper over k separably closed, ∫_X Tr(id) = χ(X, Λ) = Σ(−1)^i rank H^i(X, Λ). |
| `TauCeti.EtaleDuality.trace_empty_fixedLocus` | degenerate | If Fix(c) = ∅ then Tr_c = 0. |
| `TauCeti.EtaleDuality.localTerm_isolated_identity` | computation | For X = C = Spec Ω and u ∈ End(L), LT(u) = Tr(u \| L) (alternating trace on the perfect complex L). |
| `TauCeti.EtaleDuality.not_trace_naive_nonisolated` | non-example | For a non-isolated fixed component (e.g. c = Δ on X = P¹), the local term is the Euler characteristic 2, not a sum of naive stalk traces at points. |

**Acceptance examples.**

- For c = Δ_X (the identity correspondence) and X proper, Fix(c) = X and ∫_X Tr(id_L) = χ(RΓ(X, L)).

**Sources.**

- [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2), 1.2.2(b), formula (1.4), p. 9 (arXiv v2). The trace map Tr_c : Hom(c_1^*F, c_2^!F) → H⁰(Fix(c), K_{Fix(c)}) and local terms.

<a id="node-EDC.8-lefschetz-verdier-formula"></a>

#### The Lefschetz–Verdier trace formula ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`; theorem. Planet: “Lefschetz–Verdier trace formula”.

Let k be separably closed and f : X → S, h : C → B, g : X → S a map from a self-correspondence c of X to a self-correspondence b of S satisfying the hypotheses of EDC.8/correspondence-pushforward with f proper, and let h_Fix : Fix(c) → Fix(b) be the induced proper map. Then for L ∈ D_ctf(X, Λ) and u ∈ Hom(←c^*L, →c^!L), Tr_b(f_!(u)) = h_{Fix!}(Tr_c(u)) in H⁰(Fix(b), K_{Fix(b)}) (Varshavsky 1.2.5). In particular, for X proper over k, S = B = Spec k and ←c proper: Tr(RΓ(u) | RΓ(X, L)) = Σ_{β ∈ π₀(Fix(c))} LT_β(u) (SGA 5 III 4.7, Varshavsky 1.2.6). Ordinary Frobenius point counting (the Grothendieck–Lefschetz trace formula) remains CohomologicalPointCounting TraceFormula's theorem, and the contracting-boundary (Fujiwara) version with isolation and large-power hypotheses is EndoscopicTransferAndUnitaryTraceComparison:ET.5's; an arbitrary fixed-point scheme gives no numerical formula without properness of the components β.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** k a field (separably closed for traces and local terms), Λ a torsion noetherian ring killed by an integer invertible in k (or O_E, E by passage to the limit, EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k. f proper (for the global formula X proper over k); L ∈ D_ctf(X, Λ).

**Construction and proof plan.**

1. Commutation of trace maps with proper pushforward (Varshavsky 1.2.5): reduce to the compatibility of the evaluation map with f_! and the Künneth formula (SGA 5 III 4.4).
2. Global formula: apply to f : X → Spec k; Tr_b of an endomorphism of a perfect complex over Spec k is its trace, and h_{Fix!} sums the local terms of the components of the proper Fix(c) (Varshavsky 1.2.6).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`](#node-EDC.8-correspondence-trace); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`](#node-EDC.8-correspondence-restriction); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](#node-EDC.1-biduality-relative-and-geometric-duality).

**Acceptance examples.**

- Identity correspondence on X proper: Tr(id | RΓ(X, Λ)) = χ(X) = ∫_X Tr(id).
- X = P¹ over k = 𝔽̄_q, c the graph of z ↦ z^q: Fix(c) = P¹(𝔽_q) is finite étale, each local term is 1, and Tr(F^* | H^∗(P¹)) = 1 + q = #P¹(𝔽_q).
- Non-proper X = 𝔸¹ with c = graph of z ↦ z + 1 in characteristic p (no fixed points): Tr(RΓ_c(u)) = Tr on H²_c = 1 ≠ 0 = Σ LT, so properness (or Fujiwara's hypotheses) is needed.

**Sources.**

- [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2), Corollary 1.2.6, p. 10 (arXiv v2). Trace maps commute with proper push-forward; the Lefschetz–Verdier trace formula.

<a id="node-EDC.8-local-terms-finite-order"></a>

#### True and naive local terms agree for automorphisms of finite prime-to-p order

Node `EtaleDualityAndPerverseSheaves:EDC.8/local-terms-finite-order`; theorem.

Let X be of finite type over an algebraically closed field k of characteristic p, g an automorphism of X of finite order prime to p, A ∈ D^b_c(X, Λ) (Λ = ℤ/ℓ^n, ℤ_ℓ or ℚ_ℓ) with u : g^*A → A, and x an isolated fixed point of g. Then the local term of the cohomological correspondence (graph of g, u) at x equals the naive local term: LT_x(u) = Tr(u_x | A_x) (Varshavsky, Local terms, Theorem 4.10(b) and Corollary 5.4(b)). Consequently, for X proper, Tr(g | RΓ(X, A)) = Σ_{x ∈ X^g} Tr(u_x | A_x) when X^g is finite. The extension to perfect schemes (Hansen–Kaletha–Weinstein, Proposition 5.6.2) is transported in the Part II of EtaleDualityAndPerverseSheaves on perfect schemes.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X of finite type over k = k̄ of characteristic p; g of finite order prime to p; x an isolated fixed point. ℓ ≠ p; for torsion coefficients use finite Tor-dimension so that the stalk trace is the trace of a perfect complex. For field coefficients bounded constructibility suffices.

**Construction and proof plan.**

1. Use Varshavsky, Local terms, Example 5.3, Corollary 5.4(b), Corollary 5.6 and Corollary 4.11: the finite prime-to-p cyclic group is diagonalizable, giving the required absence of fixed points in the punctured normal cone (and the corresponding almost-fixed-point condition). Restriction to the isolated invariant point then preserves the true local term and computes the stalk trace. A tame finite-order automorphism is not contracting: multiplication by −1 on 𝔸¹ is already a counterexample to that description.
2. The global statement follows from EDC.8/lefschetz-verdier-formula.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`](#node-EDC.8-lefschetz-verdier-formula); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`](#node-EDC.8-correspondence-restriction); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`](#node-EDC.8-correspondence-trace).

**Acceptance examples.**

- g = identity on X = Spec k: LT = Tr(u | A).
- g : z ↦ −z on P¹ (p ≠ 2), A = Λ with u = id: fixed points 0, ∞, each local term 1, total 2 = Tr(g^* | H⁰ ⊕ H²).

**Sources.**

- [Varshavsky-LocalTerms-2020](https://arxiv.org/pdf/2003.06815v3), Example 5.3, Corollary 5.4(b), Corollary 5.6 and Corollary 4.11, pp. 10–11 (arXiv v3). The normal-cone criteria and diagonalizable-group argument yield the finite-order prime-to-p case; it is not an application of a contracting-correspondence assertion.
- [Hansen-Kaletha-Weinstein-2022](https://arxiv.org/pdf/1709.06651v4), Proposition 5.6.2, p. 61 (arXiv v4). HKW state the perfect-scheme version. This finite-type node is proved from Varshavsky; transport to perfectly finite-type schemes and the HKW integral range belong to the recorded Part II.

<a id="node-EDC.8-similitude-reciprocal-charpoly"></a>

#### Characteristic polynomials of a pairing similitude are reciprocal

Node `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`; theorem.

Let F be a field, V and W finite-dimensional F-vector spaces of dimension b, ⟨·,·⟩ : V × W → F a perfect pairing, c ∈ F^× and φ ∈ GL(V), ψ ∈ GL(W) with ⟨φv, ψw⟩ = c⟨v, w⟩ for all v, w. Then ψ = c·(φ^∨)^{−1} under W ≅ V^∨, and det(1 − tψ | W) = (−ct)^b det(φ)^{−1} det(1 − (ct)^{−1}φ | V) as an identity in F(t), whose right side becomes a polynomial after cancellation; equivalently det(ψ) = c^b det(φ)^{−1} and the eigenvalues of ψ are c/α for α the eigenvalues of φ, with algebraic multiplicities (over an algebraic closure). No semisimplicity of φ is assumed.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** F any field; perfect pairing; φ, ψ invertible with similitude factor c.

**Construction and proof plan.**

1. ψ is the adjoint of c·φ^{−1}: ⟨v, ψw⟩ = c⟨φ^{−1}v, w⟩, so in dual bases the matrix of ψ is c (Φ^{−1})^T.
2. det(1 − tcΦ^{−T}) = det(Φ^{−1}) det(Φ − ct) = det(Φ)^{−1}(−ct)^b det(1 − (ct)^{−1}Φ); charpoly of a transpose is unchanged (mathlib:Matrix.charpoly_transpose) and det of the dual map is unchanged (mathlib:LinearMap.det_dualMap).

**Prerequisites.** `mathlib:Matrix.charpoly_transpose`; `mathlib:LinearMap.det_dualMap`.

**Acceptance examples.**

- b = 1: ψ = c/φ.
- φ = id, c = q: ψ = q·id and det(1 − tψ) = (1 − qt)^b.
- Non-example: without perfectness (a degenerate pairing) the eigenvalues of ψ are unconstrained.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.6), p. 282. Weil I derives the functional equation of Z(X, t) from the Frobenius-equivariant Poincaré duality pairing.

<a id="node-EDC.8-middle-degree-determinant"></a>

#### The determinant of Frobenius on the middle degree

Node `EtaleDualityAndPerverseSheaves:EDC.8/middle-degree-determinant`; theorem.

Let F be a field of characteristic 0, V of dimension b with a perfect ε-symmetric bilinear form ⟨·,·⟩ : V × V → F (ε = ±1) and φ ∈ GL(V) with ⟨φv, φw⟩ = c⟨v, w⟩, c = q^n (n ≥ 0 an integer, q a positive integer). Let m_± be the dimension of the generalized eigenspace of φ for the eigenvalue ±q^{n/2} (computed over F(q^{n/2})); these are the only eigenvalues paired with themselves under α ↔ c/α. (a) If ε = −1 (alternating), b, m_+ and m_− are even and det φ = c^{b/2}. (b) If ε = +1 (symmetric) and n is even, det φ = (−1)^{m_−} q^{nb/2}, and (−1)^{m_−} = (−1)^{b − m_+} (so the sign can equally be read off from the multiplicity m_+ of q^{n/2}, as Weil I (2.6) does). (c) In all cases (det φ)² = c^b.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** F of characteristic 0 (so that ℓ = 2 is allowed through ℚ_ℓ-coefficients); perfect ε-symmetric form; similitude factor c = q^n.

**Construction and proof plan.**

1. (c) from EDC.8/similitude-reciprocal-charpoly with W = V, ψ = φ: det φ = c^b det φ^{−1}.
2. Pair the eigenvalues α ↔ c/α (with multiplicities, generalized eigenspaces V_α and V_{c/α} are dual under the form); the non-self-paired pairs contribute c each to the determinant; the self-paired eigenvalues are α = ±q^{n/2}. Compute generalized eigenvalues after extending to an algebraic closure, then descend the determinant identity; no diagonalizability is assumed.
3. On V_{q^{n/2}} the contribution is (q^{n/2})^{m_+}; on V_{−q^{n/2}} it is (−q^{n/2})^{m_−}; since b = 2r + m_+ + m_− for r non-self-paired pairs, det φ = (−1)^{m_−} q^{nb/2}; for ε = −1 the form restricted to V_{±q^{n/2}} is nondegenerate and alternating, so m_± are even and the sign disappears.

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`](#node-EDC.8-similitude-reciprocal-charpoly).

**Acceptance examples.**

- V = H¹ of an elliptic curve over 𝔽_q (alternating, b = 2): det φ = q.
- V = H² of a smooth quadric surface over 𝔽_q with nonsplit ruling (symmetric, b = 2, n = 2, c = q²): eigenvalues q and −q, det φ = −q²; the sign is the determinant of the orthogonal part.
- Non-example: an arbitrary sign ± cannot replace the computation: for the split quadric the eigenvalues are q, q and det φ = +q².

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 27.13, p. 159. Milne: the functional equation of the zeta function with the sign ± determined by the middle degree.

<a id="node-EDC.8-poincare-pairing-reciprocity-export"></a>

#### Reciprocity of Frobenius characteristic polynomials from Poincaré duality ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/poincare-pairing-reciprocity-export`; theorem. Planet: “Reciprocity of Frobenius polynomials”.

Let X₀ be smooth proper of pure dimension d over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, and P_i(t) := det(1 − tF | H^i(X, ℚ_ℓ)) with F the geometric Frobenius, b_i := dim H^i, χ := Σ(−1)^i b_i. Then for every i: P_{2d−i}(t) = (−q^d t)^{b_i} det(F | H^i)^{−1} P_i(1/(q^d t)), and det(F | H^i) det(F | H^{2d−i}) = q^{d b_i}. For i = d the form on H^d is (−1)^d-symmetric and det(F | H^d) = ±q^{d b_d/2} as in EDC.8/middle-degree-determinant (with the sign given by the generalized eigenspace at −q^{d/2} when d is even; + when d is odd). Writing Δ := Π_i det(F | H^i)^{(−1)^{i+1}}, Δ² = q^{−dχ}. The statement concerns the actual finite-dimensional spaces with no semisimplicity assumption; WeilConjectures WC.2 assembles the signed zeta functional equation from it and EDC does not define a zeta function.

Open obligations: [Suggested signatures do not yet realize several packet targets](#gap-EDC4-10).

**Hypotheses.** X₀ smooth proper of pure dimension d over 𝔽_q; ℚ_ℓ (or E/ℚ_ℓ) coefficients, ℓ = 2 allowed; no semisimplicity of F.

**Construction and proof plan.**

1. The cup-product pairing H^i × H^{2d−i} → H^{2d} ≅ ℚ_ℓ(−d) is perfect and satisfies ⟨Fx, Fy⟩ = q^d⟨x, y⟩ (EDC.2:pairings/galois-frobenius-equivariance, EDC.2:pairings/adic-and-rational-poincare-duality), and is (−1)^{i}-graded symmetric (EDC.2:pairings/cup-product-trace-pairing).
2. Apply EDC.8/similitude-reciprocal-charpoly with c = q^d to (H^i, H^{2d−i}), and EDC.8/middle-degree-determinant to H^d.
3. Δ² = Π_i (det F|H^i det F|H^{2d−i})^{(−1)^{i+1}} … = q^{−dχ} by pairing i with 2d − i (the middle term squared gives q^{d b_d}).

**Prerequisites.** [`EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`](#node-EDC.8-similitude-reciprocal-charpoly); [`EtaleDualityAndPerverseSheaves:EDC.8/middle-degree-determinant`](#node-EDC.8-middle-degree-determinant); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](#node-EDC.2-pairings-galois-frobenius-equivariance); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](#node-EDC.2-pairings-cup-product-trace-pairing).

**Acceptance examples.**

- X₀ = P¹: P_0 = 1 − t, P_2 = 1 − qt, and P_2(t) = (−qt) P_0(1/(qt)).
- X₀ an elliptic curve: P_1(t) = 1 − a t + q t², self-reciprocal: P_1(t) = q t² P_1(1/(qt)), det F|H¹ = q.
- An even-dimensional middle pairing (d = 2, a smooth quadric surface with nonsplit ruling): det(F | H²) = −q², the sign computed, not assumed.
- For P¹, det(F|H⁰)=1 and det(F|H²)=q, so Δ=q^{−1}, χ=2 and Δ²=q^{−2}; this detects the sign of the exponent.

**Sources.**

- [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 27.13, p. 159. The functional equation Z(X, 1/(q^d t)) = ± q^{dχ/2} t^χ Z(X, t) from Poincaré duality.
- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.6), p. 282. Weil I's functional equation from Poincaré duality.


## Supplier requests

These are open contracts, retained with their part provenance. Repeated suppliers receive different statements or consumers; their detailed contracts are collected in the assembly handoff. Accepted supplier nodes already referenced in the plan are prerequisites, not new definitions here.

### EDC.0-R1 — `SchemeAndStackFoundations:SF.2`

From ConstructibleEtale (CohomologicalPointCounting, PR196), integrated by SF.2: (i) constructible sheaves of Λ-modules on X_ét for X noetherian and Λ noetherian torsion (finite stratification by locally closed constructible subschemes on which the sheaf is locally constant with finitely generated stalks), forming a weak Serre subcategory stable under f^* and ⊗; (ii) the sheaf μ_n for n invertible and the exactness of the Kummer sequence 0 → μ_n → G_m → G_m → 0 on X_ét, with H¹(X_ét, G_m) = Pic(X) naturally in X; (iii) the exact pullback f^* and the right derived functors Rf_* and RΓ on the unbounded D(X_ét, Λ) (K-injective resolutions); (iv) topological invariance: a nilpotent thickening Z_red → Z induces an equivalence of étale sites.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](#node-EDC.0-tate-twist); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class).

### EDC.0-R2 — `SchemeAndStackFoundations:SF.2`

From CompactSupport (PR196), integrated by SF.2: for f : X → S separated of finite type with S quasi-compact quasi-separated and Λ torsion, the functor Rf_! : D(X_ét, Λ) → D(S_ét, Λ) on unbounded complexes, defined through a Nagata compactification as R f̄_* ∘ j_! and independent of it, with: the composition isomorphism R(gh)_! ≅ Rg_!Rh_! satisfying the cocycle condition; proper base change g^*Rf_! ≅ Rf′_!g′^* (SGA 4 XVII 5.2.6); stalks (R^q f_!F)_s̄ = H^q_c(X_s̄, F) (5.2.8); R^q f_!F = 0 for q > 2d when the fibres have dimension ≤ d (5.2.8.1); the projection formula Rf_!(E ⊗^L f^{-1}K) ≅ Rf_!E ⊗^L K (5.2.9; Stacks 0GL5); the Künneth isomorphism (5.4.3); the localization sequence for U open with closed complement (5.1.16.2); Rf_! = f_! left adjoint to f^* for f étale (6.2.11); Rf_! = Rf_* for f proper; preservation of finite Tor-dimension (5.2.10) and of D^b_c.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](#node-EDC.0-compact-pushforward-amplitude-and-colimits); [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`](#node-EDC.2-trace-purity-quasi-finite-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace).

### EDC.0-R3 — `SchemeAndStackFoundations:SF.2`

From EtaleBaseChange (PR196), integrated by SF.2: proper base change for Rf_* along proper f, the smooth base change theorem and its acyclicity lemma (SGA 4 XV 2.1 and 2.6) in the form used by SGA 4 XVIII 1.6.9, and the finiteness theorem: Rf_* preserves D^b_c(−, Λ) for f of finite type between schemes of finite type over a field or over a regular noetherian base of dimension ≤ 1 (SGA 4½ [Th. finitude] 1.1 and 4.3), with finiteness of H^q(X_k̄, F) and H^q_c(X_k̄, F) for constructible F.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`](#node-EDC.2-trace-purity-curve-effacement-lemma); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](#node-EDC.1-biduality-relative-and-geometric-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](#node-EDC.2-pairings-cup-product-trace-pairing); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`](#node-EDC.3-gysin-sequence).

### EDC.0-R4 — `SchemeAndStackFoundations:SF.2`

Cohomology of curves over an algebraically closed field k (Stacks 03RM-03RR), n invertible: for a proper curve X, H²(X, μ_n) ≅ Pic(X)/n ≅ (ℤ/n)^{irreducible components} via degrees of line bundles (and through X_red), H^q(X, μ_n) = 0 for q ≥ 3, H¹(X, μ_n) ≅ Pic(X)[n]; for a smooth affine curve H^q(X, μ_n) = 0 for q ≥ 2; for a closed point x of a smooth curve C, H^q_x(C, μ_n) is ℤ/n for q = 2 and 0 otherwise (Kummer on the henselization). Also the identification, owned by TraceFormula Layer 8 (RS-17), of the cup product H¹(X, μ_n) × H¹(X, μ_n) → H²(X, μ_n^{⊗2}) ≅ μ_n with the Weil pairing on Jac(X)[n] (Milne LEC 14.8).

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](#node-EDC.2-trace-purity-curve-h1-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class).

### EDC.0-R5 — `SchemeAndStackFoundations:SF.2`

From EllAdicRealization (PR196), integrated by SF.2: for E/ℚ_ℓ finite and a lisse O_E-sheaf F = (F_m) on X of finite type over a separably closed field, the groups H^i(X, F) := lim_m H^i(X, F_m) and H^i_c(X, F) are finitely generated O_E-modules with lim¹ = 0, RΓ(X, F) and RΓ_c(X, F) are perfect O_E-complexes with RΓ(X, F) ⊗^L O_E/π^m ≅ RΓ(X, F_m), compatibly with the Galois action and with extension of coefficients to E and ℚ̄_ℓ.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](#node-EDC.2-pairings-adic-and-rational-poincare-duality).

### EDC.0-R6 — `SchemeAndStackFoundations:SF.0`

The projective bundle π : P(E) = Proj Sym(E^∨) → X of a locally free sheaf E of rank m + 1 on a scheme X, with O_{P(E)}(1), the tautological exact sequence, local triviality P(E)|_U ≅ U × P^m over trivializing opens, and the complete flag bundle as an iterated projective bundle (for the splitting principle).

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`](#node-EDC.3-projective-bundle-freeness); [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](#node-EDC.3-chern-classes); [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](#node-EDC.3-self-intersection-formula).

### EDC.0-R7 — `SchemeAndStackFoundations:SF.5`

For X smooth (quasi-projective where intersections are taken) over a field: the group Z^r(X) of codimension-r cycles (Mathlib AlgebraicCycle restricted to codimension r), rational equivalence and CH^r(X); flat pullback; proper pushforward compatible with Mathlib's AlgebraicCycle.map; the intersection product of properly intersecting cycles with Serre's Tor multiplicities and the moving lemma making CH*(X) a ring; the degree of 0-cycles on proper X; and the deformation to the normal cone of a closed immersion.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](#node-EDC.3-self-intersection-formula).

### EDC.0-R8 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Line bundles and the Picard group Pic(X) of a scheme as an abelian group under ⊗, natural under pullback, divisors and O(D), and the degree deg : Pic(X) → ℤ of a line bundle on a proper curve over a field, additive, with principal divisors of degree zero and deg O_{P¹}(1) = 1.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](#node-EDC.2-trace-purity-first-chern-class); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](#node-EDC.2-trace-purity-curve-trace).

### EDC.0-R9 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

The Jacobian J = Pic⁰ of a smooth projective connected curve X over an algebraically closed field, an abelian variety of dimension g with J(k)[n] = Pic⁰(X)[n] ≅ (ℤ/n)^{2g} for n invertible, and its canonical principal polarization.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](#node-EDC.2-trace-purity-curve-h1-duality).

### EDC.0-R10 — `AbelianSchemesAndArithmeticModuli:A3`

The Weil pairing e_n : A[n] × A^∨[n] → μ_n of an abelian variety over an algebraically closed field (n invertible) and, for a principal polarization λ, perfectness and alternation of the induced pairing on A[n]; applied to the Jacobian of a curve.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](#node-EDC.2-trace-purity-curve-h1-duality).

### EDC.4-R1 — `SchemeAndStackFoundations:SF.2`

Artin's affine vanishing (SGA 4 XIV, Théorème 3.1 and Corollaire 3.2), from CohomologicalPointCounting's constructible-sheaf toolkit integrated by SF.2: for f : X → Y an affine morphism of schemes of finite type over a field and F a torsion sheaf with d(F) := max dim of the closures of points in Supp F ≤ n, one has d(R^qf_*F) ≤ n − q; in particular cd(X) ≤ dim X for X affine of finite type over a separably closed field (torsion coefficients prime to the characteristic). Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](#node-EDC.5-affine-perverse-artin-vanishing).

### EDC.4-R2 — `SchemeAndStackFoundations:SF.2`

Proper base change for Rf_* along proper f and for Rf_! (SGA 4 XII 5.1, XVII 5.2.6), already requested by part EDC.0; here used for the fibres of a blow-up, of a semismall map and of correspondences, and the projection formula for Rf_!. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](#node-EDC.4-blowup-direct-images); [`EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`](#node-EDC.4-pullback-injective-blowup-bundle); [`EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`](#node-EDC.5-semismall-pushforward-perverse); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`](#node-EDC.8-correspondence-composition).

### EDC.4-R3 — `SchemeAndStackFoundations:SF.2`

The ℓ-adic formalism of EllAdicRealization (CohomologicalPointCounting): Ekedahl's normalized λ-adic systems and the triangulated category D^b_c(X, O_E) := 2-lim D_ctf(X, O_E/λ^m) for X of finite type over a field (or a regular base of dimension ≤ 1), its reduction functors, the six operations computed levelwise, finiteness of H^i(X, K) as O_E-modules, perfectness of RΓ_c(X, K) with RΓ_c(X, K) ⊗^L O_E/λ^m ≅ RΓ_c(X, K ⊗^L O_E/λ^m), and D^b_c(X, E) := D^b_c(X, O_E) ⊗ E. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`](#node-EDC.4-weak-lefschetz-integral); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories).

### EDC.4-R4 — `SchemeAndStackFoundations:SF.2`

Smooth and proper base change for a smooth proper family over a connected base (R^qf_*Λ lisse, with specialization isomorphisms), and the generic base change and spreading-out of constructible complexes over a finitely generated ℤ-algebra (SGA 4½ [Th. finitude] 2.13 and the limit arguments of EGA IV §8 for constructible sheaves). Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](#node-EDC.6-complete-intersection-betti-comparison); [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](#node-EDC.7-spreading-out-to-finite-fields).

### EDC.4-R5 — `SchemeAndStackFoundations:SF.2`

ComplexComparison (CohomologicalPointCounting, layers 10–12): Artin's comparison theorem H^q(X_ét, F) ≅ H^q(X(ℂ), F) and (R^qf_{ét*}F)^an ≅ R^qf_{cl*}F^an for f of finite type over ℂ and F constructible (SGA 4 XVI 4.1), and the compatibility of the Kummer sequence with the exponential sequence under μ_n ≅ ℤ/n, e^{2πik/n} ↦ k, so that the étale and topological first Chern classes agree. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`](#node-EDC.6-trace-orientation-comparison).

### EDC.4-R6 — `SchemeAndStackFoundations:SF.2`

Topological invariance of the étale site (already requested by part EDC.0) and finiteness of étale cohomology of constructible sheaves on schemes of finite type over a separably closed field, used to compare a hypersurface section with its reduced subscheme and to make vanishing subspaces finite-dimensional. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](#node-EDC.4-ample-divisor-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`](#node-EDC.4-vanishing-and-restriction-subspaces).

### EDC.4-R7 — `SchemeAndStackFoundations:SF.0`

Blow-ups along regular immersions of smooth schemes: for Z ⊂ X a smooth closed subscheme of pure codimension c of a smooth k-scheme, Bl_Z X is smooth and proper over X, an isomorphism over X − Z, the exceptional divisor E = π^{-1}(Z) is the projective bundle P(N_{Z/X}) over Z with O_{Bl}(−E)|_E ≅ O_E(1) (Stacks, Divisors, blowing up along a regular immersion).

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](#node-EDC.4-blowup-direct-images).

### EDC.4-R8 — `SchemeAndStackFoundations:SF.0`

For f : X → S universally closed (e.g. X proper over a field) and ℒ f-ample, X_s → S is affine for every s ∈ Γ(X, ℒ) (Stacks, Tag 0EKE); and the Veronese re-embedding of P^N by O(r), under which degree-r hypersurfaces are hyperplane sections.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](#node-EDC.4-ample-divisor-weak-lefschetz).

### EDC.4-R9 — `SchemeAndStackFoundations:SF.0`

The parameter scheme of smooth complete intersections of a given multidegree in P^N over ℤ[1/ℓ]: an open subscheme of a product of projective spaces of forms, smooth with geometrically irreducible fibres over Spec ℤ[1/ℓ], over which the universal complete intersection is smooth and proper.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](#node-EDC.6-complete-intersection-betti-comparison).

### EDC.4-R10 — `AdicCoefficientsAndComparisons:L2`

The extension of the scheme Rf_! to separated finite-type morphisms of qcqs schemes, compatible with the Noetherian one (input of ECD 27.4).

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).

### EDC.4-R11 — `AdicCoefficientsAndComparisons:L3`

ECD Propositions 27.1–27.4: c_X^* commutes with ⊗ and pullback, is fully faithful with right adjoint Rc_{X*} commuting with RHom and pushforward, and Rf^◇_!c_Y^* ≅ c_X^*Rf_!, Rf^!Rc_{X*} ≅ Rc_{Y*}Rf^{◇!} for f separated of finite type between qcqs schemes of characteristic p. This is the edge AdicCoefficientsAndComparisons:L3 → EDC.6 of the confirmed finding RT-AREA-etale/17. These identities recover scheme duality by Rc_*; they do not by themselves give c^*Rf^! or c^*RHom comparisons.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](#node-EDC.6-diamond-transport-of-duality).

### EDC.4-R12 — `AdicCoefficientsAndComparisons:L4`

ECD Proposition 27.5: the Rf_!/f^! comparison for separated maps of schemes of finite type over a complete DVR with perfect residue field.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).

### EDC.4-R13 — `AdicCoefficientsAndComparisons:L6`

ECD Propositions 27.6–27.7: commutation of c^* with Rf_* and full faithfulness on constructible complexes with finite coefficients prime to p, for schemes of finite type over O.

Consumers: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).


## Gap register

These inherited obligations remain open. Assembling the two parts and elaborating admitted Lean signatures do not settle them. The mathematical proof gates and scope gaps are distinguished from prototype signature completeness.

<a id="gap-EDC0-1"></a>

### EDC.0-G1 — Purity over a trait and regular-immersion fundamental classes are not in EDC.0-EDC.3

LPV.7 requests from EDC.2:trace-purity and EDC.3 the relative fundamental class Λ ≅ Rf^!Λ(−d)[−2d] for a strict semistable trait morphism (Saito 2003, Proposition 1.1.1(2)) and fundamental classes of the regular intersection strata over the trait (Saito 2003, Lemma 1.1.4). These are purity statements for regular pairs over a discrete valuation ring (Gabber's absolute purity and its semistable special case), which EDC.2's text excludes ('This proves smooth purity, not the unrelated general Gabber absolute-purity theorem') and EDC.3 restricts to smooth pairs over a field. This packet plans smooth purity (EDC.2:trace-purity/smooth-purity) and smooth-pair purity (EDC.3/smooth-pair-purity) only. Absolute purity for regular pairs (Gabber; Riou's exposé in Astérisque 363-364, XVI) needs an owner: a new layer after EDC.3, or the trait geometry of LefschetzPencilsAndVanishingCycles. Recorded for the maintainer.

Needed by: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`; `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/localization-duality-cross`.

<a id="gap-EDC0-2"></a>

### EDC.0-G2 — ℓ-adic sheaf theory on algebraic stacks (RT-AREA-etale/3) has no layer

EDC.0-EDC.3 are planned for schemes only. Consumers on Artin and Deligne-Mumford stacks (shtuka, Hitchin, Bun_G and root-Picard stacks; WC.6's smooth proper DM stacks; FunctionFieldArithmeticPartII's tame coarse comparisons) need the Laszlo-Olsson / Liu-Zheng enhanced six operations on stacks, which this packet does not plan. The restructure entry proposes the Part II that the confirmed red-team finding asks for. The scheme-level objects of this packet (the enhanced Rf_! and f^!, the dualizing complex, smooth purity) are what that Part II extends by smooth descent. Explicit RT-AREA-etale/3 paper routes: EDC.8 YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48; the two named Part IIs are consumers, not scheme-level completions.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`; `GlobalShtukasAndFunctionFieldLanglands:GS.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`; `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`; `EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-17/35`; `EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-19/120`; `EtaleDualityAndPerverseSheaves:EDC.8/LAFFORGUE-18/48`; `ShtukaSpecialCyclesAndHigherSiegelWeil`; `RamifiedGeometricClassFieldTheory`.

<a id="gap-EDC0-3"></a>

### EDC.0-G3 — Perfect schemes and finite-level equivariant coefficients (RT-AREA-etale/16) are not planned here

PAPER-ZHU-17 routes to EDC.0, EDC.1:adjoint, EDC.1:biduality, EDC.2:trace-purity and EDC.3 the items E01-E03, E07, E14 and characteristic-classes-of-torsors: constructible coefficients, six operations, Verdier biduality, fundamental classes and Chern classes on separated perfectly-finitely-presented perfect algebraic spaces, through finite-type models (Zhu, Appendix A.3). The confirmed finding RT-AREA-etale/16 classifies these as new layers. This packet plans the finite-type scheme statements those transports start from (and E07(a)'s finite-type trace isomorphism, EDC.2:trace-purity/top-degree-compact-cohomology), and records the perfect-space transport in the Part II proposed under restructure. Zhu's A.3 orientation problem (independence of the model in E07) stays a proof gate of that Part II.

Needed by: `GeometricSatakeAndFusion:GS0`; `GeometricSatakeAndFusion:GS3`.

<a id="gap-EDC0-4"></a>

### EDC.0-G4 — The Grothendieck-Ogg-Shafarevich formula has no layer

FiniteFieldsAndCharacterSums requests χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) from EDC.2 (RT-AREA-finitefields/3, confirmed). It is not among EDC.2's stated targets and needs Swan conductors (ArithmeticGaloisRepresentations:R01.3) and the Euler-characteristic computation of SGA 5 X / Raynaud (Séminaire Bourbaki 286). This packet endorses the FiniteFieldsAndCharacterSums proposal of a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2 (restructure entry), with inputs EDC.2:pairings and R01.3.

Needed by: `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`; `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`; `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`.

<a id="gap-EDC0-5"></a>

### EDC.0-G5 — Enhanced compactification and localization coherence still require a supplier contract

A termwise Godement functor need not land in K-injective complexes. Construct it on complexes, prove preservation of quasi-isomorphisms, descend to the dg localization, and compare to the K-injective presentation using EnhancedDerivedSheaves E1. E3 supplies mates abstractly, not by itself a contractible coherent diagram of compactifications. Specify the comparison and all localization choices (SGA XVIII 3.1.9, editor note 37) before claiming the enhanced lift coherent.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](#node-EDC.1-adjoint-upper-shriek-pseudofunctor); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](#node-EDC.1-adjoint-base-change-exchange-maps).

<a id="gap-EDC0-6"></a>

### EDC.0-G6 — Constructible biduality dévissage and the regular-base extension are not closed

XVIII 3.2.6 proves the smooth local-system calculation, not general constructible biduality. The supplied induction uses D_X Rj_* ≅ j_!D_U, itself obtained from biduality in the next node, without a separate proof of the boundary step. Establish that step without circularity. Over a regular base of dimension one, the field smooth-stratum argument does not cover vertical strata; define the actual dualizing object on the base and prove its purity/duality input. SF.2 coherent O-module biduality is a different theorem, and the finiteness request alone does not supply this étale input.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](#node-EDC.1-biduality-recollement-adjunctions).

<a id="gap-EDC0-7"></a>

### EDC.0-G7 — Cycle-class descent to Chow groups and intersection multiplicities need a proof

The direct additive map from fundamental classes is justified. For rational equivalence on a singular W of codimension r−1, Sing(W) may have codimension r in X, not r+1. Semi-purity therefore does not make restriction on H^{2r} injective; the proposed reduction to W_reg is insufficient. Supply a normalization/proper-pushforward or deformation argument with the required trace multiplicities. The Tor intersection comparison is non-routine; the reference to SGA 4½ [Cycle] 2.3.8 is not a registered public source in this packet. Milne 23.4 explicitly withholds its proof. Do not claim these compatibilities closed by that citation.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](#node-EDC.3-projective-space-cohomology).

<a id="gap-EDC0-8"></a>

### EDC.0-G8 — Self-intersection specialization needs a cohomological comparison

SF.5 is requested for the deformation-to-the-normal-cone geometry and is now a direct prerequisite. The general self-intersection proof additionally needs a cohomological specialization/homotopy comparison for the deformation pair, compatible with purity and its normalization. Smoothness of the family alone does not identify cohomology of nonproper fibres. The two Milne citations prove normalization and projection formula, not this missing comparison.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](#node-EDC.3-self-intersection-formula).

<a id="gap-EDC0-9"></a>

### EDC.0-G9 — Suggested Lean declarations do not yet implement every packet signature

The input lists 95 of its 217 API/test entries only in Not typed here comments. Section 13 requires actual Lean statements, with honest data stand-ins when appropriate. Several existing statements also omit compactifiability/quasi-compactness, torsion hypotheses, condition (*)_d for trace, codimension for fundamentalClass/cycleClass, or smoothness and the dimension difference for properPushforward. The review corrects the cartesian-square arguments, the false base-change test, smooth-pair dimensions and some duality coefficient hypotheses. The remaining declarations require a systematic carrier/hypothesis revision rather than fabricated Prop stand-ins. See the review report for the explicit inventory. The localization-triangle prototypes also need the actual relation that j is the open complement of i, rather than two unrelated immersion arguments.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](#node-EDC.2-trace-purity-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](#node-EDC.3-fundamental-class); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](#node-EDC.3-cycle-class-map).

<a id="gap-EDC0-10"></a>

### EDC.0-G10 — Trace compatibility in the proposed replacement purity proof remains to be checked

The published smooth-purity theorem is not contradicted. The packet claims to replace the problematic proof of XVIII 3.2.3 by the stalk formula and effacement. Establish that the two neighbourhood pro-systems and their transition maps are identified through the chosen trace, and that the induced cohomology isomorphism is precisely the adjoint t_f. Merely obtaining isomorphic stalk groups does not verify that normalization. E1 confirms the author remark, not the packet’s claimed repair.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](#node-EDC.2-trace-purity-smooth-purity).

<a id="gap-EDC4-1"></a>

### EDC.4-G1 — ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks (confirmed finding RT-AREA-etale/3)

This part is scheme-only, like part EDC.0. Perverse sheaves and IC on Artin stacks, the decomposition theorem for proper representable maps of DM stacks, and correspondences/trace formulas on DM stacks (the EDC.8 stack items YUN-ZHANG-17/35, YUN-ZHANG-19/120, LAFFORGUE-18/48) are planned nowhere. The first `restructure` entry endorses part EDC.0's Part II proposal for stacks and assigns these items to it.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`; `GlobalShtukasAndFunctionFieldLanglands:GS.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`; `EtaleDualityAndPerverseSheaves:EDC.8`.

<a id="gap-EDC4-2"></a>

### EDC.4-G2 — Perfect schemes, equivariant perverse sheaves and hyperbolic localization (confirmed finding RT-AREA-etale/16)

Zhu's E01–E03, E07–E14, the equivariant items (equivariant-perverse-sheaves-pfp, equivariant-cohomology-borel, equivariant-cohomology-free-quotient), characteristic-classes-of-torsors, the Braden hyperbolic localization E09, IC-stalk-parity (a statement about Witt Grassmannians that belongs to GeometricSatakeAndFusion) and HKW's perfect-scheme local terms (PAPER-HANSEN-KALETHA-WEINSTEIN-22/091) need the Part II on perfect schemes proposed by part EDC.0 and endorsed in `restructure`. The finite-type statements they transport (E04 perverse t-structure, E05 IC, E06 decomposition) are nodes here.

Needed by: `GeometricSatakeAndFusion:GS1`; `GeometricSatakeAndFusion:GS3`; `GeometricSatakeAndFusion:GS4`.

<a id="gap-EDC4-3"></a>

### EDC.4-G3 — Relative perverse t-structures and universal local acyclicity over a base

GlobalShtukasAndFunctionFieldLanglands requested from EDC.4 'the perverse t-structure relative to a base' and 'universal local acyclicity'. Neither is in the text of EDC.4–EDC.8 (EDC.5 is the absolute perverse t-structure over a field). The relative perverse t-structure of Hansen–Scholze is owned on the diamond side by GeometricSatakeAndFusion:GS1 (FS VI.7) and ULA by VStackSheavesAndLisseCategories:VS1; the scheme-theoretic relative version over a curve has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

<a id="gap-EDC4-4"></a>

### EDC.4-G4 — Nearby cycles over general bases and compactification boundary machinery requested from EDC.5/EDC.6

GlobalShtukasAndFunctionFieldLanglands requested nearby cycles over general bases with Orgogozo's finiteness theorem (from EDC.6) and 'compactifications and boundary strata in the étale setting' (from EDC.5). Neither is in the text of EDC.5 or EDC.6; nearby cycles belong to LefschetzPencilsAndVanishingCycles:LPV.0/LPV.6 (over a trait) and the general-base version (Orgogozo, Lu–Zheng) has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.6`; `GlobalShtukasAndFunctionFieldLanglands:GS.7`.

<a id="gap-EDC4-5"></a>

### EDC.4-G5 — Euler characteristic of smooth complete intersections

The hypersurface formula b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d needs χ(X) = deg c_m(T_X) (a Gauss–Bonnet / Riemann–Roch statement in étale cohomology, or the topological computation over ℂ). Neither SchemeAndStackFoundations:SF.5 nor any EDC stage states it; the field-independence of b_m^0 is planned without it.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](#node-EDC.6-complete-intersection-betti-comparison).

<a id="gap-EDC4-6"></a>

### EDC.4-G6 — Strong exceptional-pullback and duality transport to diamonds

The stage asks for c^*K_X and c^*D_X comparisons, but ECD 27.1–27.4 supply only Rc_* recovery. Supply a theorem from AdicCoefficientsAndComparisons:L3 proving the required essential-image preservation/counit isomorphism (with exact geometric and coefficient hypotheses), or explicitly rescope the target. Do not infer it from full faithfulness.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](#node-EDC.6-diamond-transport-of-duality).

<a id="gap-EDC4-7"></a>

### EDC.4-G7 — Geometric origin as a target-level definition

BBD 6.2.4 defines the smallest collection of simple perverse complex sheaves containing the constant sheaf on a point and closed under simple constituents of perverse cohomology of the six operations, tensor product and RHom; semisimple complexes of geometric origin are finite direct sums of shifts of these simple objects. This key definition needs its own target-level node, API and at least three discriminating tests; it is not optional lemma-level refinement.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](#node-EDC.7-characteristic-zero-decomposition).

<a id="gap-EDC4-8"></a>

### EDC.4-G8 — Categorical graded Lefschetz operator and primitive decomposition

Define the bounded graded object with Tate twist and chosen degree-two operator in an abelian category, its primitive kernels, and the hard-Lefschetz kernel splitting/decomposition theorem. DWP.9 provides only the vector-space version. The suggested existential retract with arbitrary P is satisfied by P=0 and does not express this target.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition`](#node-EDC.7-relative-primitive-decomposition).

<a id="gap-EDC4-9"></a>

### EDC.4-G9 — Stratified specialization and coefficient-descent closure

Request the exact BBD 6.1.8–6.1.10 restricted T,L-category and trait specialization construction from the scheme/sheaf owner; generic base change alone does not supply it. Prove the rational or ℓ-adic coefficient descent required beyond the source complex-coefficient decomposition statement.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](#node-EDC.7-characteristic-zero-decomposition).

<a id="gap-EDC4-10"></a>

### EDC.4-G10 — Suggested signatures do not yet realize several packet targets

The independent report lists the affected signatures and counterexamples per node. Missing finite-type/base/coefficient hypotheses, the IC input local system and shift, Tate twists and chosen ample class, complete decomposition isomorphisms, and correspondence coherence/proper integration must be represented in the suggested file. Elaboration with admitted proofs does not verify these mathematical statements.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`](#node-EDC.4-compact-support-vanishing-smooth-affine); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`](#node-EDC.4-weak-lefschetz-gysin); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`](#node-EDC.4-weak-lefschetz-integral); [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](#node-EDC.4-ample-divisor-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`](#node-EDC.4-complete-intersection-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`](#node-EDC.4-projective-bundle-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](#node-EDC.4-blowup-direct-images); [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`](#node-EDC.4-blowup-formula); [`EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup`](#node-EDC.4-pencil-axis-blowup); [`EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`](#node-EDC.4-pullback-injective-blowup-bundle); [`EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`](#node-EDC.4-vanishing-and-restriction-subspaces); [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](#node-EDC.5-t-cohomology-functor); [`EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`](#node-EDC.5-recollement-data); [`EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`](#node-EDC.5-glued-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`](#node-EDC.5-abstract-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`](#node-EDC.5-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`](#node-EDC.5-lisse-shift-is-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`](#node-EDC.5-perverse-recollement); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](#node-EDC.5-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`](#node-EDC.5-simple-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`](#node-EDC.5-verdier-duality-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](#node-EDC.5-affine-perverse-artin-vanishing); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`](#node-EDC.5-perverse-amplitude-estimates); [`EtaleDualityAndPerverseSheaves:EDC.5/generic-degree-concentration`](#node-EDC.5-generic-degree-concentration); [`EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`](#node-EDC.5-semismall-pushforward-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex`](#node-EDC.5-small-map-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`](#node-EDC.5-integral-perverse-torsion-pair); [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](#node-EDC.6-classical-and-proetale-adic-categories); [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](#node-EDC.6-adic-transport-of-duality-and-classes); [`EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension`](#node-EDC.6-rational-perverse-coefficient-extension); [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`](#node-EDC.6-trace-orientation-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](#node-EDC.6-complete-intersection-betti-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](#node-EDC.6-diamond-transport-of-duality); [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](#node-EDC.7-weights-and-perverse-truncation); [`EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-weight-filtration`](#node-EDC.7-mixed-perverse-weight-filtration); [`EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity`](#node-EDC.7-geometric-semisimplicity); [`EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition`](#node-EDC.7-pure-complex-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`](#node-EDC.7-proper-direct-image-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`](#node-EDC.7-relative-hard-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition`](#node-EDC.7-relative-primitive-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](#node-EDC.7-characteristic-zero-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](#node-EDC.8-cohomological-correspondence); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`](#node-EDC.8-correspondence-restriction); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`](#node-EDC.8-correspondence-composition); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`](#node-EDC.8-correspondence-trace); [`EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`](#node-EDC.8-lefschetz-verdier-formula); [`EtaleDualityAndPerverseSheaves:EDC.8/local-terms-finite-order`](#node-EDC.8-local-terms-finite-order); [`EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`](#node-EDC.8-similitude-reciprocal-charpoly); [`EtaleDualityAndPerverseSheaves:EDC.8/middle-degree-determinant`](#node-EDC.8-middle-degree-determinant); [`EtaleDualityAndPerverseSheaves:EDC.8/poincare-pairing-reciprocity-export`](#node-EDC.8-poincare-pairing-reciprocity-export).


## Proposed ownership changes

The eight original proposals are preserved in full, with provenance, in the [handoff](../handoff/ASM-EtaleDualityAndPerverseSheaves.md). They are proposals for the maintainer and do not change the current atlas. The shared stack and perfect-space Part II proposals have two endorsements each. The other proposals add an Euler-characteristic sublayer, correct the Satake/shtuka supplier edges, add the missing L3 comparison edge, and separate abstract t-structure foundations from scheme perversity.


## Existing declarations used

- `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean`): smallEtaleTopology X : GrothendieckTopology X.Etale, the small étale site of a scheme X on which every coefficient category of this packet is built.
- `mathlib:AlgebraicGeometry.Scheme.Etale` (`Mathlib/AlgebraicGeometry/Morphisms/Etale.lean`): X.Etale := MorphismProperty.Over @Etale ⊤ X, the category of étale X-schemes (the underlying category of the small étale site).
- `mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean`): For A abelian and Grothendieck abelian, Sheaf S.smallEtaleTopology A is Grothendieck abelian (applied with A = ModuleCat Λ): enough injectives, so D(X_ét, Λ) exists with K-injective resolutions.
- `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale` (`Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean`): For Ω separably closed and s : Spec Ω ⟶ S, the point of the small étale site of S at the geometric point s; its fibre functor is the geometric stalk.
- `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'` (`Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean`): The points pointSmallEtale form a conservative family of points of the small étale site: a morphism of étale sheaves is an isomorphism when it is one on all geometric stalks.
- `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber` (`Mathlib/CategoryTheory/Sites/Point/Basic.lean`): Φ.sheafFiber : Sheaf J A ⥤ A, the fibre (stalk) functor of a point of a site; with pointSmallEtale it is the geometric stalk F ↦ F_x̄.
- `mathlib:DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`): DerivedCategory C, the unbounded derived category of an abelian category C (localization of ℤ-graded cochain complexes at quasi-isomorphisms), with its triangulated structure.
- `mathlib:HasDerivedCategory.standard` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`): A choice of universe for the morphisms of the derived category of any abelian category, used as a local instance.
- `mathlib:CategoryTheory.Functor.mapDerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean`): An exact functor F : C₁ ⥤ C₂ of abelian categories induces F.mapDerivedCategory : DerivedCategory C₁ ⥤ DerivedCategory C₂; used for geometric stalks and exact pullbacks.
- `mathlib:CategoryTheory.Adjunction` (`Mathlib/CategoryTheory/Adjunction/Basic.lean`): F ⊣ G with unit and counit and the triangle identities: the form of the adjunctions Rf_! ⊣ f^!, f^* ⊣ Rf_* and ⊗ ⊣ RHom.
- `mathlib:CategoryTheory.Functor.IsTriangulated` (`Mathlib/CategoryTheory/Triangulated/Functor.lean`): A functor of pretriangulated categories commuting with shifts is triangulated when it sends distinguished triangles to distinguished triangles: the property asserted of f^! and D_X.
- `mathlib:DerivedCategory.TStructure.t` (`Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean`): The canonical t-structure on DerivedCategory C for an abelian C with HasDerivedCategory C. DerivedCategory.Plus, Minus and Bounded use this structure; IsGE/IsLE are characterized by cohomology vanishing.
- `mathlib:CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`): Sheaf cohomology H^n(F) := Ext^n(ℤ, F) of an abelian sheaf on a site; on the small étale site it is the étale cohomology H^n(X_ét, F) that RΓ computes.
- `mathlib:CategoryTheory.Abelian.Ext` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`): Ext groups in an abelian category, via shifted morphisms in the derived category: the groups Hom(K, L[n]) of the adjunction and duality statements.
- `mathlib:AlgebraicGeometry.Smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`): Smooth morphisms of schemes (locally standard smooth): the hypothesis of the trace and purity theorems.
- `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`): SmoothOfRelativeDimension n f: f is locally standard smooth of relative dimension n; the pure relative dimension d of the smooth purity theorem.
- `mathlib:AlgebraicGeometry.IsClosedImmersion` (`Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean`): Closed immersions of schemes: the immersions i of cohomology with supports, i^! and the Gysin maps.
- `mathlib:AlgebraicGeometry.IsOpenImmersion` (`Mathlib/AlgebraicGeometry/OpenImmersion.lean`): Open immersions of schemes: the immersions j of extension by zero and of the localization triangles.
- `mathlib:AlgebraicGeometry.IsSeparated` (`Mathlib/AlgebraicGeometry/Morphisms/Separated.lean`): Separated morphisms. Nagata compactification also needs finite type (including quasi-compactness), with a qcqs base; separated and locally of finite type alone do not suffice.
- `mathlib:AlgebraicGeometry.LocallyOfFiniteType` (`Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean`): Morphisms locally of finite type; part of the compactifiability hypothesis.
- `mathlib:AlgebraicGeometry.IsProper` (`Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`): Proper morphisms: for proper f, Rf_! = Rf_* and the pairings lose their compact supports.
- `mathlib:AlgebraicGeometry.Flat` (`Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`): Flat morphisms: the flatness hypothesis of the trace morphisms (quasi-finite flat, and (∗)_d of SGA 4 XVIII 2.9).
- `mathlib:AlgebraicGeometry.IsFinite` (`Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`): Finite morphisms: the finite locally free case of the degree normalization.
- `mathlib:AlgebraicGeometry.Etale` (`Mathlib/AlgebraicGeometry/Morphisms/Etale.lean`): Étale morphisms: for étale f, f^! = f^* and the trace is the counit of f_! ⊣ f^*.
- `mathlib:AlgebraicGeometry.LocallyQuasiFinite` (`Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`): Locally quasi-finite morphisms: the relative-dimension-zero case of the trace and of f^!.
- `mathlib:rootsOfUnity` (`Mathlib/RingTheory/RootsOfUnity/Basic.lean`): rootsOfUnity n M, the subgroup of units with x^n = 1: the sections μ_n(Γ(U, O_U)) of the Tate-twist sheaf.
- `mathlib:Module.Injective` (`Mathlib/Algebra/Module/Injective.lean`): Injective modules; Λ self-injective (Module.Injective Λ Λ) is the coefficient hypothesis under which ordinary duals Hom(−, Λ) compute derived duals.
- `mathlib:Module.Baer.injective` (`Mathlib/Algebra/Module/Injective.lean`): Baer R Q implies Module.Injective R Q, for a ring R and an R-module Q. The accompanying Module.Baer definition expresses extension of maps from ideals.
- `mathlib:LinearMap.IsPerfPair` (`Mathlib/LinearAlgebra/PerfectPairing/Basic.lean`): A bilinear map p : M →ₗ N →ₗ R is a perfect pairing when both curried maps are bijective onto the duals: the form of the Poincaré duality pairings.
- `mathlib:AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`): AlgebraicCycle X R := Function.locallyFinsupp X R, cycles as locally finitely supported functions on the points of X (generic points of integral closed subschemes): the source of the cycle class map.
- `mathlib:AlgebraicGeometry.AlgebraicCycle.map` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`): Pushforward of algebraic cycles along a quasi-compact morphism, weighted by residue degrees and a dimension function: the cycle-side proper pushforward compared with the cohomological Gysin map.
- `mathlib:PerfectField` (`Mathlib/FieldTheory/Perfect.lean`): Perfect fields: the base fields over which the cycle class of a singular cycle is built from its dense smooth locus.
- `mathlib:IsSepClosed` (`Mathlib/FieldTheory/IsSepClosed.lean`): Separably closed fields: geometric points and the geometric cohomology H^i(X_k̄, −).
- `mathlib:ZMod` (`Mathlib/Data/ZMod/Defs.lean`): ZMod n = ℤ/n, the basic coefficient ring Λ = ℤ/ℓⁿ.
- `mathlib:AlgebraicGeometry.Scheme.Hom.finrank` (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`): f.finrank s : ℕ, the rank of a finite flat morphism at a point of the base (locally constant for finite presentation): the r of the degree normalization Tr ∘ unit = r.
- `mathlib:AlgebraicGeometry.AffineSpace` (`Mathlib/AlgebraicGeometry/AffineSpace.lean`): AffineSpace n S = 𝔸(n; S), affine space over a scheme with its structure morphism 𝔸(n; S) ↘ S: the source of the affine-space trace and of the A¹ tests.
- `mathlib:DerivedCategory.singleFunctor` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`): The functor placing an object in a single degree of the derived category: sheaves as complexes concentrated in degree 0.
- `mathlib:DerivedCategory.homologyFunctor` (`Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean`): The cohomology-object functor ℋ^q : D(C) ⥤ C; the sheaves R^q f_!K = ℋ^q(Rf_!K) and the amplitude statements.
- `mathlib:CategoryTheory.constantSheaf` (`Mathlib/CategoryTheory/Sites/ConstantSheaf.lean`): constantSheaf J A : A ⥤ Sheaf J A; the constant sheaf Λ_X on the small étale site.
- `mathlib:CategoryTheory.Functor.CommShift` (`Mathlib/CategoryTheory/Shift/CommShift.lean`): Compatibility of a functor with shifts, the data needed before a functor of triangulated categories can be triangulated.
- `mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom` (`Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean`): A morphism is a closed immersion iff it is affine and surjective on sections over affine opens; used to see that a closed subscheme of an affine scheme maps to it by an affine morphism.
- `mathlib:AlgebraicGeometry.isAffine_of_isAffineHom` (`Mathlib/AlgebraicGeometry/Morphisms/Affine.lean`): Given an affine morphism f : X → Y and an affine Y, X is affine. For the Lefschetz complement, first express U as a closed subscheme of the affine projective basic open; this lemma does not assert that arbitrary open subschemes are affine.
- `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec` (`Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean`): The basic open D_+(f) of Proj of a graded algebra is isomorphic to Spec of the degree-zero part of the localization at f; the complement of a hyperplane in projective space is affine.
- `mathlib:CategoryTheory.Triangulated.TStructure` (`Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean`): t-structures on a pretriangulated category, given by the predicates le n and ge n with shift, orthogonality and truncation-triangle axioms; the carrier of every t-structure in EDC.5.
- `mathlib:CategoryTheory.Triangulated.TStructure.heart` (`Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean`): The heart t.le 0 ⊓ t.ge 0 of a t-structure as an object property; the Heart class identifies a category with it.
- `mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian` (`Mathlib/CategoryTheory/Triangulated/TStructure/AbelianSubcategory.lean`): BBD 1.2: a full additive subcategory of a triangulated category with no negative Exts and all morphisms admissible is abelian; applied to the heart in EDC.5/t-structure-heart-abelian (the theorem that the heart is abelian is a TODO in Heart.lean at the pin).
- `mathlib:CategoryTheory.Functor.IsHomological` (`Mathlib/CategoryTheory/Triangulated/HomologicalFunctor.lean`): A functor from a pretriangulated to an abelian category is homological if it sends distinguished triangles to exact sequences; the property of H⁰_t.
- `mathlib:Matrix.charpoly_transpose` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`): charpoly(Mᵀ) = charpoly(M); used for the reciprocity of characteristic polynomials of a pairing similitude.
- `mathlib:LinearMap.det_dualMap` (`Mathlib/LinearAlgebra/Determinant.lean`): The determinant of the dual map of an endomorphism of a finite free module equals its determinant.

## Sources and editions

The packets retain source hashes, access records, read sections, short excerpts and statement matches from their independent reviews. The bibliography groups aliases of the same source URL; it does not collapse different editions. Node citations above retain the original source identifier and locator.

### SGA4-XVIII

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), P. Deligne. SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project, version 71766d9 of 30 July 2024 (LNM page numbers in the margin); accessed 2026-10-06

Relevant sections: 0 (introduction, 0.1-0.4); 1.1 (1.1.1-1.1.9, the trace morphism for curves); 1.6.6-1.6.9 (the effacement lemma); 2 (2.1-2.14.4, the trace morphism and Theorem 2.14); 3.1.1-3.1.14 (the functor Rf^!, composition and base change); 3.2 (3.2.1-3.2.6, Poincaré duality).

Recorded SHA-256: `458851856ba253e0a6047adb15da13a9124c9fe2ac922b214f2ac8c27b7abbc5`.

### SGA4-XVII

[Exposé XVII. Cohomologie étale à supports propres](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), P. Deligne. SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project (2024); accessed 2026-10-06

Relevant sections: 5.1.16 (localization sequence); 5.2.6-5.2.10 (base change, stalks, cohomological dimension, projection formula); 5.4.3 (Künneth formula); 6.2.3 and 6.2.11 (trace for quasi-finite flat morphisms; étale f_!).

Recorded SHA-256: `e4f3c40b2ea3af327835bbabd0f0cd4c27219b2263501c9f719becd62548dab0`.

### Milne-LEC, Milne-LEC-v2.21

[Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), J. S. Milne. Version 2.21, 22 March 2013 (202 pages; printed page = PDF page); accessed 2026-10-06

Relevant sections: §14, Theorems 14.7-14.8 (curve duality and Weil pairing); §16 Purity; the Gysin sequence (pp. 108-113); §23 The cycle map; Chern classes (pp. 138-143); §24 Poincaré duality (pp. 144-146); §15 (Theorem 15.1); §16 (Example 16.4 and the aside on complete intersections); §23 (Theorem 23.2); §27 (Theorem 27.12, Remark 27.13); §33 (Lemma 33.2 and proof).

Recorded SHA-256: `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077`.

### Stacks-MoreEtale

[The Stacks Project, Chapter 'More Étale Cohomology' (tag 0F4U)](https://stacks.math.columbia.edu/download/more-etale.pdf), The Stacks Project Authors. Chapter PDF, version ed88ff78 compiled 14 July 2026; accessed 2026-10-06

Relevant sections: Section 2 (growing sections, tags 0F6F-0F6I); Section 11 Derived upper shriek (tags 0G2B-0GLF); Section 12 Compactly supported cohomology (0GJY); Section 16 More on derived upper shriek (0GLJ-0GLK).

Recorded SHA-256: `ad29409a512b8f379ea4a20a7c956a24bf4a64dc020d7eef426fb81b9c40074f`.

### Deligne-WeilI-1974

[La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Pierre Deligne. Publ. Math. IHÉS 43 (1974), 273-307; Numdam scan with OCR; accessed 2026-10-06

Relevant sections: §2, (2.3)-(2.14): Frobenius pairings (2.4), Scholie (2.10), Théorème (2.12) and the bibliographic indications (2.14); §2 ((2.3)–(2.6), functional equation); §5 ((5.1)–(5.7), pencils and Veronese); §7 (proof of Lemme (7.1)).

Recorded SHA-256: `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.

### Yu-2023

[Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu. Annals of Mathematics 197 (2023), 423-531; read in arXiv:1807.04659v5 (18 July 2022), printed pages; accessed 2026-10-06

Relevant sections: §6.1, Proposition 6.1.1 and equations (6.1.1)-(6.1.2), pp. 42-43.

Recorded SHA-256: `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.

### BBD-1982

[Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), A. A. Beilinson, J. Bernstein, P. Deligne. Astérisque 100 (1982), pp. 5–171; Numdam scan with OCR text layer (printed page = PDF page − 1), read 2026-10-06; excerpts checked against page images

Relevant sections: §1.3 (1.3.1–1.3.17); §1.4 (1.4.3–1.4.26); §2.1 (2.1.1–2.1.23); §2.2 (2.2.9–2.2.19); §3.3; §4.0–4.3; §5.1 (5.1.8–5.1.15); §5.3 (5.3.1–5.3.8); §5.4 (5.4.1–5.4.10); §6.1–6.2 (6.1.1–6.1.10, 6.2.4–6.2.10).

Recorded SHA-256: `b1e10440e13cb6bf307f74030b577e0cf5056e41b35ca56640dc2f0d2109b9e0`.

### Deligne-WeilII-1980

[La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Pierre Deligne. Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR, read 2026-10-06

Relevant sections: §4.1 ((4.1.1)–(4.1.6), Lefschetz faible); §4.2–4.3 ((4.2.2), (4.3.1)–(4.3.2)).

Recorded SHA-256: `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.

### SGA4-XIV

[SGA 4, Exposé XIV: Théorème de finitude pour un morphisme propre; dimension cohomologique des schémas algébriques affines](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf), M. Artin. Retyped edition of LNM 305 (version 71766d9, 2024), with LNM page numbers in the margin; read 2026-10-06

Relevant sections: §2.1, Théorème 3.1, Corollaires 3.2–3.3.

Recorded SHA-256: `491af30c246e3aedfc717e1dd957cc634c6befba469e980c4ef7e01412bb0f94`.

### SGA4-XVI

[SGA 4, Exposé XVI: Théorème de changement de base par un morphisme lisse, et applications](https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf), M. Artin. Retyped edition of LNM 305 (version 71766d9, 2024); read 2026-10-06

Relevant sections: Théorème 4.1 (comparison theorem).

Recorded SHA-256: `d93c3cee9212b35a031559fdf2b9556f96678522791fa7ca836710fc921af96a`.

### Stacks-Morphisms

[The Stacks Project, Chapter 29: Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), The Stacks Project Authors. Version ed88ff78 (compiled 14 July 2026), read 2026-10-06

Relevant sections: Lemma 44.18 (Tag 0EKE); Definition 38.1 (Tag 01VH).

Recorded SHA-256: `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f`.

### Varshavsky-LV-2007

[Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2), Yakov Varshavsky. arXiv math/0505564v2 (2005); published Geom. Funct. Anal. 17 (2007), 271–319; read 2026-10-06

Relevant sections: §0.2; §1.1 (1.1.1–1.1.9); §1.2 (1.2.1–1.2.6); §1.5 (1.5.1–1.5.8).

Recorded SHA-256: `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6`.

### Varshavsky-LocalTerms-2020

[Local terms for transversal intersections](https://arxiv.org/pdf/2003.06815v3), Yakov Varshavsky. arXiv 2003.06815v3 (25 November 2021); read 2026-10-06

Relevant sections: Theorem 4.10, Corollary 4.11; Example 5.3, Corollaries 5.4–5.7.

Recorded SHA-256: `6a2c74173b5cbd164d28eb5a7669af5102d0ecb570d108eb71969e7c10e0ed8e`.

### Hansen-Kaletha-Weinstein-2022

[On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/pdf/1709.06651v4), David Hansen, Tasho Kaletha, Jared Weinstein. arXiv 1709.06651v4 (17 March 2022); published Forum Math. Pi 10 (2022); read 2026-10-06

Relevant sections: §5.6, Proposition 5.6.2 and proof.

Recorded SHA-256: `d37e986ef599420a8e206dc289e18965422b03ec923184737fbcead2abc0bd5c`.

### Lu-Zheng-2022

[Categorical traces and a relative Lefschetz–Verdier formula](https://arxiv.org/pdf/2005.08522v4), Qing Lu, Weizhe Zheng. arXiv 2005.08522v4 (9 January 2022); published Forum Math. Sigma 10 (2022), e10; read 2026-10-06

Relevant sections: §2.2, Construction 2.6.

Recorded SHA-256: `be71f418bdc0a5524e50aff00f2105313efc4759575276e252821b721a56db98`.

### Caraiani-Scholze-2017

[On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/pdf/1511.02418v1), Ana Caraiani, Peter Scholze. arXiv 1511.02418v1 (2015); published Ann. of Math. 186 (2017), 649–766; read 2026-10-06

Relevant sections: §6.1, Corollary 6.1.4 and its proof.

Recorded SHA-256: `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`.

### Mirkovic-Vilonen-2007

[Geometric Langlands duality and representations of algebraic groups over commutative rings](https://arxiv.org/pdf/math/0401222v5), I. Mirković, K. Vilonen. arXiv math/0401222v5 (2018); published Ann. of Math. 166 (2007); read 2026-10-06

Relevant sections: §2 (conventions); §4, (4.4) and Lemma 4.3.

Recorded SHA-256: `b3fa89de4f2aeefadaba248aba2e942a20fc0895b8a218dfcab93322b4140e21`.

### deCataldo-Migliorini-2009

[The decomposition theorem, perverse sheaves and the topology of algebraic maps](https://arxiv.org/pdf/0712.0349v2), Mark Andrea de Cataldo, Luca Migliorini. arXiv 0712.0349v2 (2009); published Bull. Amer. Math. Soc. 46 (2009), 535–633; read 2026-10-06

Relevant sections: §2.3 (Example 2.3.5); §4.2 (Proposition 4.2.1, Definition 4.2.2, Remark 4.2.4, Theorem 4.2.7).

Recorded SHA-256: `171415a41c8e6aaf90e227b4003de9611c249a88b94a93550d7500ead6996e5f`.

### Yun-Zhang-2019

[Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Zhiwei Yun, Wei Zhang. Published, Ann. of Math. 189 (2019), 393–526 (authors' copy of the published version); read 2026-10-06

Relevant sections: §5.5 (Proposition 5.5(3)(4)); §7.1 (Proposition 7.1 and proof).

Recorded SHA-256: `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.

### Liu-Tian-Xiao-Zhang-Zhu-2022

[On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3), Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu. arXiv 1912.11942v3 (2021); published Invent. Math. 228 (2022); read 2026-10-06

Relevant sections: §5.11 (Notation 5.11.1, Lemma 5.11.3 and proof).

Recorded SHA-256: `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86`.

### Zhu-2017

[Affine Grassmannians and the geometric Satake in mixed characteristic](https://arxiv.org/pdf/1407.8519v3), Xinwen Zhu. arXiv 1407.8519v3 (2016); published Ann. of Math. 185 (2017); read 2026-10-06

Relevant sections: Appendix A.2–A.3 (A.3.1, A.3.4); proof of Lemma 2.11.

Recorded SHA-256: `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b`.

### Bhatt-Scholze-proetale-2015

[The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), Bhargav Bhatt, Peter Scholze. arXiv 1309.1198v2 (2014); published Astérisque 369 (2015); read 2026-10-06

Relevant sections: §5.5; §6.5–6.8 (Definition 6.5.1, Proposition 6.6.11, Theorem 6.7.1, Definitions 6.8.1, 6.8.8, Proposition 6.8.14, Remark 6.8.15).

Recorded SHA-256: `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84`.

### Scholze-ECD-2026

[Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Peter Scholze. Author manuscript dated 14 April 2026; read 2026-10-06

Relevant sections: §27, Propositions 27.1–27.4.

Recorded SHA-256: `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1`.


## Source issues

Keep author-acknowledged proof problems, typographical corrections and missing comparison proofs separate from the truth of the theorem being planned. These records retain the part packets’ confirmed findings; the assembly adds no source erratum.

### EDC.0 — EtaleDualityAndPerverseSheaves/E1

**id.** EtaleDualityAndPerverseSheaves/E1

**source.** SGA4-XVIII

**kind.** gap

**locator.** Lemme 3.2.3 and its proof, p. 583-584 (retyped edition, version 71766d9, 2024)

**printed.** "Je serais reconnaissant à toute personne ayant compris cette démonstration de me l’expliquer." (after the proof that the two constructions of t_f agree)

**correction.** The compatibility of the adjoint of Tr_f with the map t_f of (3.2.1.2) is asserted with a proof the author himself does not vouch for. The packet proposes instead to define t_f as the adjoint of Tr_f and use the stalk formula of Stacks More Étale Lemma 16.1 and factorization 2.14.4. This possible alternative still needs the trace-compatibility calculation recorded as a gap; this source issue does not assert that the repair is established.

**reason.** The proof's final step is left to the reader ('dont on laisse au lecteur le soin de vérifier que, dans la catégorie dérivée, il coïncide avec (3.2.1.2)'), and the author records that he did not understand it.

**affects.** the proof

**known.** The author's own remark in the text (SGA 4 XVIII, after the proof of 3.2.3); the Stacks Project (More Étale Cohomology §16, tags 0GLJ-0GLK) computes f^! stalkwise instead.

**searched.** ["SGA 4 XVIII retyped edition (2024), editors' notes (N.D.E.) around 3.2.3: none corrects it.", "Stacks Project, More Étale Cohomology, Section 16 (tag 0GLJ-0GLK), read 2026-10-06: gives the stalk formula used instead."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. The remark is present; the source does not itself furnish the claimed alternative proof. The proposed stalk/effacement proof still needs its trace-compatibility calculation.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E2

**id.** EtaleDualityAndPerverseSheaves/E2

**source.** SGA4-XVIII

**kind.** misprint

**locator.** 3.2.1, display (3.2.1.1), p. 583 (retyped edition, version 71766d9, 2024)

**printed.** "𝑅2𝑑 𝑓! (Z/𝑛)𝑈 ≃ 𝑗! 𝑅2𝑑 𝜑!Z/𝑛 −−→ 𝑗! Z/𝑁(−𝑑) = 𝐾 ″ (𝑈 , 𝑉 , 𝜑))"

**correction.** j_! ℤ/n(−d) = K″(U, V, φ): the coefficient is ℤ/n (the integer n fixed in 3.2.1), not ℤ/N, and the final parenthesis is unbalanced.

**reason.** No integer N is introduced in 3.2.1; K″ was defined two lines earlier from ℤ/n(−d)[−2d].

**affects.** nothing

**known.** new

**searched.** ["Retyped edition 71766d9 (2024), editors' notes in §3.2: none.", "The original LNM 305 scan was not available to compare; the slip may be the retyping's."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. Confirmed as a slip in the 2024 retyped edition; no claim about the original LNM scan.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E3

**id.** EtaleDualityAndPerverseSheaves/E3

**source.** SGA4-XVIII

**kind.** misprint

**locator.** Lemme 2.14.2, p. 561 (retyped edition, version 71766d9, 2024)

**printed.** "𝑓𝑖 ∶ 𝐾𝑖 → 𝐾𝑖+𝑖 (0 ≤ 𝑖 ≤ 2𝑘 − 1) des morphismes et 𝑓 leur composé"

**correction.** f_i : K_i → K_{i+1}.

**reason.** The f_i are composed into f : K_0 → K_{2k}, so consecutive indices are meant.

**affects.** nothing

**known.** new

**searched.** ["Retyped edition 71766d9 (2024), editors' notes in §2: none.", "The original LNM 305 scan was not available to compare; the slip may be the retyping's."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. Confirmed as a slip in the 2024 retyped edition; no claim about the original LNM scan.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E4

**id.** EtaleDualityAndPerverseSheaves/E4

**source.** Milne-LEC

**kind.** misprint

**locator.** Remark 24.2 and the display before it, p. 145 (version 2.21, 22 March 2013)

**printed.** "By duality, we get a map π∗ : H^r(Y, Λ) → H^{r−2c}(X, Λ(−e))" (with a = dim X, d = dim Y, e = d − a)

**correction.** π_* : H^r(Y, Λ) → H^{r−2e}(X, Λ(−e)); for a closed immersion of codimension c, e = −c and the target is H^{r+2c}(X, Λ(c)). In 24.2(b), replace “e is the codimension” by “−e is the codimension”.

**reason.** Dualizing π^* : H^{2d−r}_c(X, Λ(d)) → H^{2d−r}_c(Y, Λ(d)) with Poincaré duality on Y (dimension d) and X (dimension a) lands in H^{2a−2d+r}(X, Λ(a − d)) = H^{r−2e}(X, Λ(−e)); c is not defined in the remark.

**affects.** nothing

**known.** new

**searched.** ["LEC versions listed on the title page (2.01, 2.10, 2.20, 2.21) and their change notes: no erratum for 24.2.", "jmilne.org course-notes page, checked 2026-10-06: no separate errata file for LEC."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. The degree shift must be −2e. Remark 24.2(b) also calls e the codimension, although e = −codimension for a closed immersion.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E5

**id.** EtaleDualityAndPerverseSheaves/E5

**source.** Milne-LEC

**kind.** gap

**locator.** §23, after Theorem 23.3 and the NOTES, p. 140-142 (version 2.21)

**printed.** "set φ(Z) = Σ(−1)^i ch(E_i)" ... "Theorem 23.4 This chern-class cycle map agrees with the directly-defined cycle map. Proof. A correct proof is quite long."

**correction.** The Chern character and the proof of agreement 23.4 are missing in these notes. The packet uses the direct fundamental-class map, but its rational-equivalence and intersection compatibilities still need the proof recorded in the cycle-class gap.

**reason.** The notes say so themselves.

**affects.** the proof

**known.** Milne's NOTES in §23 of version 2.21: 'This subsection needs to be rewritten ... you seem to have forgotten to define it.'

**searched.** ["LEC version 2.21 (2013), §23 NOTES.", "jmilne.org course-notes page, checked 2026-10-06."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. Milne explicitly says the Chern character is undefined and the comparison proof long. The packet has not repaired all direct compatibilities; the new cycle-class gap records this distinction.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E6

**id.** EtaleDualityAndPerverseSheaves/E6

**source.** Yu-2023

**kind.** misprint

**locator.** §6.1, equations (6.1.1)-(6.1.2), p. 42 (arXiv:1807.04659v5, 18 July 2022)

**printed.** "H⁰(X, F1 ⊗ F2∨) ≅ HomX(F1, F2)" and "Hc²(X, F1 ⊗ F2∨) ≅ H⁰(X, F1∨ ⊗ F2(1))∨ ≅ HomX(F2, F1)∨(−1)"

**correction.** H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁) and H²_c(X, F₁ ⊗ F₂^∨) ≅ Hom_X(F₁, F₂)^∨(−1).

**reason.** F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁), and F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂). Both uses in the proof (vanishing for F₁, F₂ without common constituent, and the self-pair F₁ = F₂) are symmetric in the order.

**affects.** nothing

**known.** PAPER-YU-23/E14 (research/blueprint/papers/PAPER-YU-23.result.json), confirmed by REV-PAPER-YU-23

**searched.** ["The PAPER-YU-23 extraction's sourceIssues (E14) and its review verdict.", "arXiv 1807.04659v5 re-read at (6.1.1)-(6.1.2), 2026-10-06; journal version not openly available."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. Both Hom arguments are reversed in arXiv v5; the tensor-Hom convention confirms the correction, also confirmed independently in REV-PAPER-YU-23.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E7

**id.** EtaleDualityAndPerverseSheaves/E7

**source.** SGA4-XVIII

**kind.** gap

**locator.** Définition 1.1.2 and editors' note 2, p. 485 (retyped edition, version 71766d9, 2024)

**printed.** "une courbe sur un corps est quasi-projective(2)"

**correction.** EGA II 7.4.10 proves quasi-projectivity only for normal curves; the general case was announced for EGA V, which never appeared. The construction of the curve trace does not need it: it can be made locally on quasi-projective opens and glued, as in the proof of 1.1.6.

**reason.** Editors' note 2 of the retyped edition.

**affects.** nothing

**known.** Editors' note (N.D.E.) 2 to 1.1.2 in the retyped edition (2024).

**searched.** ["Retyped SGA 4 XVIII (2024), note 2."]

**review.** {"verdict": "confirmed", "reason": "Confirmed at the cited locator in the public version recorded in sources/sourceVersions. Editor note 2 identifies the unavailable reference; the local trace construction does not require general quasi-projectivity.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E8

**id.** EtaleDualityAndPerverseSheaves/E8

**source.** SGA4-XVIII

**kind.** misprint

**locator.** Proof of Proposition 1.1.6, p. 489 (2024 retyped edition 71766d9)

**printed.** un morphisme ℤ/n → R¹p_*ℤ/n(1)

**correction.** Replace R¹p_* by R²p_* in the Kummer class of O(1) on p : P¹_S → S.

**reason.** The Kummer boundary of Pic lies in degree two; fibrewise H¹(P¹, μ_n) = 0 and H²(P¹, μ_n) = ℤ/n. The displayed superscript 1 was checked visually in the PDF, not only by text extraction.

**affects.** nothing

**known.** new in this packet; retyped-edition slip

**searched.** ["Public retyped SGA 4 XVIII 71766d9 and its editor notes, read 2026-10-06; no claim about the original LNM scan."]

**review.** {"verdict": "confirmed", "reason": "The Kummer boundary of Pic lies in degree two; fibrewise H¹(P¹, μ_n) = 0 and H²(P¹, μ_n) = ℤ/n. The displayed superscript 1 was checked visually in the PDF, not only by text extraction.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E9

**id.** EtaleDualityAndPerverseSheaves/E9

**source.** SGA4-XVIII

**kind.** gap

**locator.** 3.1.9, (3.1.9.3), p. 572; editor note 37 on p. 573 (2024 retyped edition 71766d9)

**printed.** il n’y a aucune raison que ce soit un isomorphisme si on n’a pas préalablement fait des choix cohérents de points

**correction.** Fix a family P of points of S_ét and on V_ét use the points (p, ξ), ξ ∈ V_p, as in editor note 37; do not use independent Godement resolutions in the localization comparison.

**reason.** The editor explicitly supplies the missing compatible point choices, affecting the enhancement/sheafified-adjunction proof model.

**affects.** the proof

**known.** new in this packet; editor note 37

**searched.** ["Public retyped SGA 4 XVIII 71766d9 and its editor notes, read 2026-10-06; no claim about the original LNM scan."]

**review.** {"verdict": "confirmed", "reason": "The editor explicitly supplies the missing compatible point choices, affecting the enhancement/sheafified-adjunction proof model.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.0 — EtaleDualityAndPerverseSheaves/E10

**id.** EtaleDualityAndPerverseSheaves/E10

**source.** SGA4-XVIII

**kind.** misprint

**locator.** 3.1.13, (3.1.13.1), p. 576; editor note 38 (2024 retyped edition 71766d9)

**printed.** se transpose en un morphisme de composition ... Rh! Rg! → R(gh)!

**correction.** The actual transpose initially goes from R(gh)! to Rh! Rg!; invert that isomorphism to obtain the displayed direction.

**reason.** Editor note 38 explicitly says the transposed morphism goes in the other direction. Both displayed functors are isomorphic, so the final pseudofunctor statement is unchanged.

**affects.** nothing

**known.** Editor note 38, newly recorded in this packet.

**searched.** ["Retyped SGA 4 XVIII 71766d9, 3.1.13 and note 38, read 2026-10-06."]

**review.** {"verdict": "confirmed", "reason": "The editor note is present at the cited locator; the typed comparison is an isomorphism and may use its inverse.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.0"}

### EDC.4 — EtaleDualityAndPerverseSheaves/E11

**id.** EtaleDualityAndPerverseSheaves/E11

**source.** BBD-1982

**kind.** misprint

**locator.** 2.2.12 (ii)*, p. 71 (Numdam scan of Astérisque 100, 1982; checked on the page image)

**printed.** "(ii)* Pour tout point (fermé ou non) x de X, notant dim x la dimension de {x}⁻, on a H^i i_x^*K = 0 pour i < p(2dim x) (resp. H^i i_x^!K = 0 pour i > p(2dim x))."

**correction.** K ∈ D^{≤p} iff H^i i_x^*K = 0 for i > p(2 dim x); K ∈ D^{≥p} iff H^i i_x^!K = 0 for i < p(2 dim x). Both inequalities are reversed in print.

**reason.** The statement is announced as a reformulation of 2.2.2(ii), and the same conditions appear correctly in (4.0.1)–(4.0.2) for p = p_{1/2} (H^i i_x^*K = 0 for i > −dim(x), H^i i_x^!K = 0 for i < −dim(x)). With the printed inequalities, Λ_x placed in degree 0 at a closed point would fail the D^{≤p} condition.

**affects.** nothing

**known.** new

**searched.** ["The Numdam scan of the first edition (1982), including §4.0 where the conditions are restated correctly.", "No errata list for Astérisque 100 was found on Numdam; the 2018 second edition (with Gabber) was not consulted."]

**review.** {"verdict": "confirmed", "reason": "Confirmed on the page image: the inequalities in 2.2.12(ii)* are reversed relative to 2.2.2 and 4.0.1–4.0.2. A degree-zero skyscraper tests the correction.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.4"}

### EDC.4 — EtaleDualityAndPerverseSheaves/E12

**id.** EtaleDualityAndPerverseSheaves/E12

**source.** BBD-1982

**kind.** misprint

**locator.** Théorème 4.3.1 (ii), p. 112 (Numdam scan)

**printed.** "L est un ℚ_ℓ-faisceau lisse irréductible sur V"

**correction.** L is an irreducible lisse ℚ̄_ℓ-sheaf: §4 works in D^b_c(X, ℚ̄_ℓ) (4.0).

**reason.** 4.0 fixes ℚ̄_ℓ coefficients for the whole section; the classification of simple objects is over ℚ̄_ℓ.

**affects.** nothing

**known.** new

**searched.** ["The Numdam scan (1982); §4.0's conventions."]

**review.** {"verdict": "confirmed", "reason": "Confirmed on the page images: 4.3.1(ii) prints ℚ_ℓ while 4.0 explicitly fixes ℚ̄_ℓ and describes other coefficient versions separately. The theorem also has a valid ℚ_ℓ variant; this is a coefficient-convention misprint, not a false classification theorem.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.4"}

### EDC.4 — EtaleDualityAndPerverseSheaves/E13

**id.** EtaleDualityAndPerverseSheaves/E13

**source.** Zhu-2017

**kind.** misprint

**locator.** Appendix A.3.1, pp. 54–55 (arXiv 1407.8519v3)

**printed.** "smooth open subset U is canonically isomorphic to Qℓ `[2 dim X](dim X)`"

**correction.** IC_X|_U ≅ ℚ̄_ℓ[dim X] (unnormalized; a half-twist normalization is a separate choice).

**reason.** IC_X = j_!*ℚ̄_ℓ[dim X] restricts to ℚ̄_ℓ[dim X] on the smooth open U (EDC.5/intersection-complex); the printed shift 2 dim X is not perverse.

**affects.** nothing

**known.** PAPER-ZHU-17/E25 (recorded by the extraction of Zhu's paper in this atlas)

**searched.** ["arXiv v3 (2016)", "research/blueprint/papers/PAPER-ZHU-17.result.json sourceIssues"]

**review.** {"verdict": "confirmed", "reason": "Confirmed in arXiv v3 A.3.1 and independently against the intermediate-extension normalization: restriction of IC to a smooth dense open is ℚ̄_ℓ[dim X], whereas `[2 dim X](dim X)` describes a smooth dualizing complex. This is the previously recorded PAPER-ZHU-17/E25; the published version was not compared.", "by": "REV-EtaleDualityAndPerverseSheaves--EDC.4"}
