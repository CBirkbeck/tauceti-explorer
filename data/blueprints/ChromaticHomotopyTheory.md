# Chromatic homotopy theory: telescopes, Morava K-theories and finite localizations

This roadmap develops the chromatic homotopy theory used by purity in algebraic K-theory. Its endpoint is a set of reusable interfaces: finite and chromatic localization, periodic detection, finite-group Tate vanishing and blueshift, and the chromatic comparisons for real K-theory, modular forms and James-filtered Thom spectra. Algebraic K-theory and its purity/redshift theorems are consumers. Their proofs and constructions keep their existing owners.

The plan is at target level. All fourteen layers are **planned** and the pass is **complete**, in the sense of PROTOCOL §0. Twenty-one named proof or supplier gaps and ten stage contracts remain; no layer is claimed closed and no declaration is claimed implemented. Every target has a statement, direct prerequisites, a construction or proof outline, source locators and acceptance criteria below. Every new definition/construction also has its proposed API and at least three discriminating tests. Small proof steps stay inside the outline.

## Conventions and library boundary

Fix a prime p. Tensor products, fibers, cofibers, mapping objects and (co)limits are derived. The sphere is S, the zero spectrum is 0, and Σ∞ denotes the **reduced** suspension spectrum of a pointed space. A subscript + adds a disjoint basepoint. Cohomology is E^r(X)=[Σ∞X,Σ^rE]; homotopy and homology use homological integer grading. A finite p-local spectrum means a compact object of Sp_(p), including retracts of finite p-local cell objects. It need not be compact as an integral spectrum.

Use K(0)=HQ, K(∞)=HF_p, and **T(0)=S[1/p]**. For n≥1, T(n) is formed from a fixed finite type-n source and self-map; its Bousfield class is independent of that choice. Write L_n=L_(K(0)∨⋯∨K(n)), L_n^f=L_(HQ∨T(1)∨⋯∨T(n)), and L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). The latter two towers agree on p-local inputs by a theorem. They are different on all spectra. The ordering ⟨E⟩≤⟨F⟩ means every F-acyclic is E-acyclic.

An m-connective space has vanishing homotopy in degrees less than m, so it is (m−1)-connected. A map is m-connective when each homotopy fiber is m-connective. Thus its homotopy maps are isomorphisms below m and surjective in degree m, at every component and compatible basepoint. For r≥1, a connected cover X⟨r⟩ is fib(X→τ_≤(r−1)X). Distinguish geometric height of a formal group from the telescopic height of an E∞ ring. An even-periodic spectrum has no odd homotopy and an invertible degree-two class locally after trivializing its cotangent line.

K(n)-acyclicity and T(n)-acyclicity are distinct on general spectra. The ring-spectrum comparison licenses their interchange in the stated ring cases; it supplies no comparison for arbitrary modules. Likewise, Tate vanishing means vanishing **after** the stated localization. The raw Tate cofiber can remain nonzero.

The audited pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no existing layer for this new roadmap. Source searches at the pins found the formal-group and orthogonality declarations in the following table, but no spectrum, Morava theory, homological localization or spectral-elliptic carrier. They are baseline citations, never new target nodes.

| Existing declaration | What is used |
| --- | --- |
| `mathlib:FormalGroup` | A one-dimensional associative formal group law over a commutative ring, with unit tangent coefficients. |
| `mathlib:FormalGroup.IsComm` | Commutativity of an existing formal group law. |
| `mathlib:FormalGroup.map` | Coefficient base change of the law along a ring homomorphism. |
| `mathlib:FormalGroup.Point` | Power-series-valued points satisfying the substitution condition; its addition comes from the law. |
| `mathlib:FormalGroup.𝔾ₐ` | The additive formal group law. |
| `mathlib:FormalGroup.𝔾ₘ` | The multiplicative formal group law X+Y+XY. |
| `mathlib:CategoryTheory.ObjectProperty.isLocal` | The class of morphisms orthogonal by precomposition bijections to a property of objects; this is a one-category predicate, not a spectral reflector. |
| `tauceti:WeierstrassCurve.formalGroup` | The existing Mathlib FormalGroup obtained by reindexing WeierstrassCurve.formalAdd from Unit⊕Unit to Fin 2. |

`CategoryTheory.ObjectProperty.isLocal` is a predicate in ordinary category theory; it does not construct the homological reflector. `WeierstrassCurve.formalGroup` is already the Mathlib law obtained by reindexing `formalAdd`. The general formal-law homomorphisms, formal modules, height invariant and marked deformation rings are imported from LubinTateFormalModulesAndQuasiCanonicalLifts LT.0/LT.3. This roadmap adds the oriented/geometric interface and spectral realization, not another algebraic deformation theory.

The current TauCetiRoadmap main was checked, including the roadmaps newer than the atlas snapshot, and the live AlgebraicTopology and StablePeriodicCurved documents were read for scope and density. AlgebraicTopology supplies finite CW, ordinary Serre, homotopy and bundle geometry; StablePeriodicCurved concerns curved and periodic algebra and supplies no chromatic spectrum carrier. ModularCurves 4B supplies the smooth Weierstrass groupoid, 4C its full-level-three torsor, and 7E the elliptic formal-height/deformation inputs. Its explicit exclusion of generalized elliptic curves and boundary stacks is respected below.

## Ownership and import contracts

| Owner | Imported interface |
| --- | --- |
| StableHomotopyKTheory H.3/H.4 | Space Postnikov towers, Eilenberg–Mac Lane spaces and coherent group completion. CH.6 adds the indexing comparison and generalized-homology application. |
| StableHomotopyKTheory H.5:spectra/H.6 | Concrete spectra, integer homotopy, derived smash, spectrum/module/ring structures, homotopy colimits, connective covers, Moore spectra, derived p-completion and filtered-spectrum convergence. |
| EnhancedDerivedSheaves E3/E5 | Kan extensions, accessible localization, stable monoidal categories, compact objects, Ind/Verdier localization, coherent actions and the comparison with concrete spectra. |
| RefinedTraceMethods RT.2 | Homotopy orbits/fixed points, the normalized norm, generic Tate, multiplicativity; the sphere Segal comparison is an explicit additional request. CH.9 supplies chromatic localization comparisons. |
| RefinedTraceMethods RT.4:topological | Complex ku/KU, degree-two Bott theory and its multiplicative orientation. CH.11 constructs the real counterpart. |
| LubinTateFormalModulesAndQuasiCanonicalLifts LT.0/LT.3 | Formal homomorphisms/modules and their heights, marked deformation representability, and the elliptic deformation comparison. CH.7 realizes the ring spectrum and action. |
| TauCetiRoadmap AlgebraicTopology Stages 4/5/8 | Finite CW and cofibration geometry, bundles and ordinary Serre theory, homotopy exact sequences, Hurewicz and Whitehead; stable-range stabilization is a requested extension. |
| TauCetiRoadmap ModularCurves 4B/4C/7E | Smooth elliptic groupoid, full-level-three torsor and ordinary/supersingular formal groups. |

Two supplier extensions are proposed, with precise missing contracts recorded as G16a and G16b. **Modular curves, Part II: generalized elliptic moduli and boundary geometry** starts beyond current coarse compactifications. **Enhanced derived sheaves, Part II: spectral ringed sites** adds spectral sheaves and quasicoherent spectral-module descent beyond ordinary derived sheaves. Neither extension is silently treated as an existing stage. The present roadmap owns the Otop realization and elliptic affineness theorems consuming those carriers.

The K-theoretic owner GeneralAlgebraicKTheoryPartIITelescopicLocalization imports these interfaces. The revised Clausen–Mathew route imports its chromatic basics (/118) here; its localized motives, étale K-theory and K(1)-acyclic consumer results remain with their respective owners.

## Build order and acceptance

Each layer lists its actual stage prerequisites. Within a layer, follow the node prerequisites, rather than its presentation order. Morava realization precedes the chromatic smashing theorem which uses it. Heavy carriers absent at the pins stay in this document. The suggested Lean file contains only the real-bodied point adapter `Chromatic.geometric_height.pSeries`, four end calculations on existing formal groups and four examples; it does not encode a missing theory as assumptions or proposition-valued replacement data.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| [CH.0 — Finite spectra and homological localization](#ch-0) | 3 | 2 | planned |
| [CH.1 — Oriented coefficient spectra and height](#ch-1) | 5 | 4 | planned |
| [CH.2 — Nilpotence, type and periodicity](#ch-2) | 5 | 5 | planned |
| [CH.3 — Telescopes and periodic homotopy](#ch-3) | 4 | 4 | planned |
| [CH.4 — Finite localization and fracture](#ch-4) | 5 | 3 | planned |
| [CH.5 — Bousfield–Kuhn functors](#ch-5) | 3 | 3 | planned |
| [CH.6 — Connective spaces and generalized homology](#ch-6) | 5 | 3 | planned |
| [CH.7 — Morava E-theory and stabilizer actions](#ch-7) | 2 | 2 | planned |
| [CH.8 — Chromatic localization and its limits](#ch-8) | 6 | 4 | planned |
| [CH.9 — Norms, Tate spectra and blueshift](#ch-9) | 5 | 3 | planned |
| [CH.10 — Commutative rings and chromatic height](#ch-10) | 4 | 4 | planned |
| [CH.11 — Real topological K-theory](#ch-11) | 2 | 2 | planned |
| [CH.12 — Topological modular forms](#ch-12) | 8 | 4 | planned |
| [CH.13 — James filtrations and Thom spectra](#ch-13) | 6 | 5 | planned |

<a id="ch-0"></a>
## CH.0. Finite spectra and homological localization

**Stage inputs.** `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

<a id="ch-0-finite-p-local-spectra"></a>
### Finite p-local spectra

**Target** `ChromaticHomotopyTheory:CH.0/finite-p-local-spectra` (definition · planet). Let Sp_(p) be spectra whose integer homotopy groups are Z_(p)-modules. Let FinSp_(p) be the idempotent-complete stable subcategory generated by S_(p) under finite sums, shifts and cofibers. Its objects are retracts of p-localizations of finite cell spectra; a finite spectrum here always means this compact stable notion.

**Direct inputs.** `StableHomotopyKTheory:H.5:spectra/symmetric-spectrum`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

**Construction/proof outline.**

1. Invert the degree-q sphere maps for primes q different from p and use their mapping telescopes.
2. Take the retract closure of finite sphere-cell constructions. Identify the compact generators with the sphere and its shifts.

**Uses.** CH.2: The thick theorem needs an actual essentially small category of finite spectra. LMMT §2.1, p.6: Type and self-map data are placed on finite p-local objects.

**API.**

- `Chromatic.finite_p_local_spectra.ofFiniteCell` (constructor): A finite sphere-cell presentation gives a finite p-local spectrum.
- `Chromatic.finite_p_local_spectra.isCompact_iff` (characterisation): Compact objects in Sp_(p) are precisely FinSp_(p).
- `Chromatic.finite_p_local_spectra.retract` (structure): FinSp_(p) is closed under shifts, cofibers, finite sums, retracts and tensor products.

**Checks.**

- `Chromatic.finite_p_local_spectra.check_1` (non-example): S_(p) is finite p-local, even though its underlying integral spectrum need not be compact.
- `Chromatic.finite_p_local_spectra.check_2` (computation): S/p lies in FinSp_(p) and multiplication by any q different from p is invertible.
- `Chromatic.finite_p_local_spectra.check_3` (non-example): An infinite wedge of nonzero copies of S_(p) is not compact in Sp_(p).

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Preliminaries, p.9; Theorem 7, p.3. The thick-subcategory theorem concerns finite p-local spectra; the model here makes that domain explicit.

<a id="ch-0-finite-duality"></a>
### Spanier–Whitehead duality

**Target** `ChromaticHomotopyTheory:CH.0/finite-duality` (comparison). For finite p-local V and p-local X, D V=F(V,S_(p)) is finite, V→D D V is an equivalence, and F(V,X)≃D V⊗X naturally in Sp_(p). Every spectrum in Sp_(p) is a filtered colimit of finite p-local spectra. The tensor-Hom formula with this p-local dual is not asserted for an arbitrary integral X.

**Direct inputs.** [Finite p-local spectra](#ch-0-finite-p-local-spectra), `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`.

**Construction/proof outline.**

1. Prove dualizability for the sphere and propagate through cofibers and retracts.
2. Identify the double-dual and tensor-Hom maps by induction on finite cells; use compact generation for Ind(FinSp_(p))≃Sp_(p).

**Acceptance.**

- D(S/p)≃Σ^(-1)S/p.
- D(S_(p))≃S_(p).
- The p-locality of X matters: for V=S_(p) and X=HZ, π₀F(V,HZ)=Hom(Z_(p),Z)=0, whereas π₀(D V⊗HZ)=Z_(p).

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), §1.4, p.14; proof of Theorem 7 in §2.2, p.19. The argument uses the dual of a finite spectrum and its evaluation/coevaluation maps.

<a id="ch-0-homological-localization"></a>
### Homological Bousfield localization

**Target** `ChromaticHomotopyTheory:CH.0/homological-localization` (construction · planet). For a spectrum E, an E-acyclic A satisfies E⊗A≃0; an E-equivalence has E-acyclic cofiber. An E-local Y has contractible Map(A,Y) for every E-acyclic A, equivalently Map(f,Y) is an equivalence for every E-equivalence f. Construct the accessible exact reflector L_E:Sp→Sp_E with unit η, natural initial among maps from X to E-local spectra. Define the Bousfield class ⟨E⟩ by its acyclics, with ⟨E⟩≤⟨F⟩ when every F-acyclic is E-acyclic. Smashing means L_E X≃L_E S⊗X compatibly with η.

**Direct inputs.** `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `mathlib:CategoryTheory.ObjectProperty.isLocal`, `EnhancedDerivedSheaves:E3`.

**Construction/proof outline.**

1. Use accessibility of tensoring by E and the stable accessible-localization input requested from EDS.
2. Identify local objects by mapping spaces; the ordinary homotopy-category predicate is compatible with the Mathlib orthogonality convention.
3. Descend tensor to the local category; joins of Bousfield classes are represented by wedges.

**Uses.** LMMT Definition 2.5: Defines the finite and chromatic towers. Clausen–Mathew 2017 Proposition 2.3: Forms norm and Tate constructions in the localized category.

**API.**

- `Chromatic.homological_localization.unit` (projection): η_X:X→L_E X is an E-equivalence and its codomain is E-local.
- `Chromatic.homological_localization.mapUniversal` (universal-property): For E-local Y, precomposition gives Map(L_E X,Y)≃Map(X,Y).
- `Chromatic.homological_localization.class_eq_iff` (extensionality): Two Bousfield classes coincide exactly when their acyclic subcategories coincide.
- `Chromatic.homological_localization.join` (structure): The class of E∨F is the join; a map is an (E∨F)-equivalence exactly when it is both an E- and an F-equivalence.
- `Chromatic.homological_localization.hoOrthogonality` (compatibility): On the homotopy category, E-local objects satisfy Mathlib’s precomposition-bijection predicate; mapping-space locality uses all shifts.

**Checks.**

- `Chromatic.homological_localization.check_1` (computation): L_(zero spectrum) X≃0, whereas L_S X≃X.
- `Chromatic.homological_localization.check_2` (computation): L_HQ S≃HQ and S/p is HQ-acyclic.
- `Chromatic.homological_localization.check_3` (computation): For q different from p, S[1/p]⊗S/q is nonzero although HQ⊗S/q is zero.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Definition 2.5 and Lemma 2.8, p.8. The three localizations and the fracture lemma require the actual homological reflector and its smashing condition.

<a id="ch-1"></a>
## CH.1. Oriented coefficient spectra and height

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

<a id="ch-1-complex-orientation"></a>
### Complex orientations

**Target** `ChromaticHomotopyTheory:CH.1/complex-orientation` (definition · planet). A complex orientation of a homotopy commutative ring spectrum E is x∈Ẽ²(CP∞) restricting to 1∈E⁰(*) under CP¹≃S². The projective-space comparison E*(CP∞)≃E*[[x]] is completed in the skeletal topology. Tensor product of line bundles defines a graded commutative one-dimensional formal group law F_E. For even-periodic E choose an invertible degree-two class to obtain a degree-zero coordinate and an actual Mathlib FormalGroup over π₀E.

**Direct inputs.** `StableHomotopyKTheory:H.5:spectra/ring-spectrum`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`, `RefinedTraceMethods:RT.4:topological`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `mathlib:FormalGroup`, `mathlib:FormalGroup.IsComm`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-hom`.

**Construction/proof outline.**

1. Use oriented finite projective spaces and their cell filtrations to prove the compatible power-series description.
2. Pull the orientation back along tensor product, then read the formal group identities from tensor-product associativity, symmetry and identity.
3. Coordinate changes are formal isomorphisms imported from LT.0, with the prescribed derivative.

**Uses.** CH.1 Brown–Peterson construction: MU and p-typical laws determine the coefficient theories. CH.7 and CH.12: Identifies the formal groups of Morava E-theory and elliptic cohomology.

**API.**

- `Chromatic.complex_orientation.restrict` (characterisation): The restriction to CP¹ equals the chosen unit after suspension.
- `Chromatic.complex_orientation.projectiveSpace` (equivalence): The cohomology of CP∞ and CP∞×CP∞ identifies with the respective completed graded power-series rings.
- `Chromatic.complex_orientation.formalGroup` (data): The pullback under line-bundle tensor product is F_E.
- `Chromatic.complex_orientation.changeCoordinate` (compatibility): Two orientations are related by the LT.0 formal-group isomorphism, and coefficient maps commute with the associated law.

**Checks.**

- `Chromatic.complex_orientation.check_1` (computation): HZ with its standard orientation gives the additive law.
- `Chromatic.complex_orientation.check_2` (computation): KU with the degree-zero coordinate [L]−1 gives X+Y+XY.
- `Chromatic.complex_orientation.check_3` (non-example): Changing coordinate does not change the geometric height; a random power series with nonunit linear term is not an orientation coordinate.

**Sources.** [Beh19](https://arxiv.org/pdf/1901.07990), Definitions 1.2.1, 1.2.6, Proposition 1.2.10, pp.4–6. These statements give orientations, even periodicity and coordinate independence.

<a id="ch-1-geometric-height"></a>
### Geometric height of an orientation

**Target** `ChromaticHomotopyTheory:CH.1/geometric-height` (definition · planet). For a commutative one-dimensional law over a characteristic-p field, its canonical continuous Z_p-action makes it an instance of the LT.0 formal-module notion: [p]_F has initial nonzero degree p^h, or is zero and has height ∞. Assign height zero where p is invertible. For an even-periodic p-local oriented ring E, geometric height at most n means this bound at every geometric point of Spec π₀E, with the orientation expressed in a degree-zero coordinate. For a general graded orientation, the sufficient uniform bound used here is the explicit condition (p,v₁,…,v_n)=π_*E on the invariant p-typical coefficient ideal. Coordinate change preserves these conditions.

**Direct inputs.** [Complex orientations](#ch-1-complex-orientation), `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`, `mathlib:FormalGroup.map`, `mathlib:FormalGroup.Point`, `mathlib:FormalGroup.𝔾ₐ`, `mathlib:FormalGroup.𝔾ₘ`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

**Construction/proof outline.**

1. Extend integer multiplication on a characteristic-p law to Z_p: differences divisible by p^r have order tending to infinity unless [p]=0, when they already vanish.
2. Use LT.0’s height invariant and its change-of-coordinate theorem.
3. Apply the condition at geometric points; keep residue-characteristic-zero points separate.

**Uses.** LMMT proof of Corollary 4.21, p.22: A uniform height bound on a complex-oriented ring implies L_n-locality. LMMT Corollary 4.21: The elliptic height bound supplies chromatic level two.

**API.**

- `Chromatic.geometric_height.pSeries` (compatibility): For a natural integer r and a Mathlib formal-group point x, pSeries F r x is the underlying power series of r-fold addition. For a prime p it evaluates [p]_F; the continuous Z_p-action is compared with the LT.0 formal-module object.
- `Chromatic.geometric_height.baseChange` (functoriality): Extension of characteristic-p fields preserves finite height and infinite height.
- `Chromatic.geometric_height.coordinateInvariant` (characterisation): Isomorphic formal laws have the same height.
- `Chromatic.geometric_height.heightLE` (characterisation): A uniform bound is equivalent to containment of the geometric image in the height-at-most-n open substack.
- `Chromatic.geometric_height.additive_nsmul` (simp): For an additive-law point x, pSeries 𝔾ₐ r x=r·x.val in the ordinary additive power-series ring.
- `Chromatic.geometric_height.multiplicative_nsmul` (simp): For a multiplicative-law point x, pSeries 𝔾ₘ r x=(1+x.val)^r−1.
- `Chromatic.geometric_height.additive_char_p` (example): Over a ring of characteristic p with p prime, pSeries 𝔾ₐ p x=0.
- `Chromatic.geometric_height.multiplicative_char_p` (example): Over a ring of characteristic p with p prime, pSeries 𝔾ₘ p x=x.val^p.

**Checks.**

- `Chromatic.geometric_height.check_1` (computation): Over F_p, the additive law has infinite height since [p]=0.
- `Chromatic.geometric_height.check_2` (computation): Over F_p, the multiplicative law has [p](X)=X^p and height one.
- `Chromatic.geometric_height.check_3` (computation): An ordinary elliptic formal group has height one and a supersingular elliptic formal group has height two; neither height is assigned to an arbitrary law merely because it has dimension one.

**Sources.** [Beh19](https://arxiv.org/pdf/1901.07990), §1.5, p.21; §1.6, pp.27–28. The height strata of the moduli of formal groups determine the finite chromatic range. [Goe10](https://numdam.org/item/AST_2010__332__221_0.pdf), §3.3, pp.238–239. Finite-height laws and their marked deformation theory are the algebraic input for Morava E-theory.

<a id="ch-1-cobordism-p-typical"></a>
### Complex cobordism and Brown–Peterson theory

**Target** `ChromaticHomotopyTheory:CH.1/cobordism-p-typical` (construction · planet). Construct the Thom spectrum MU with universal complex orientation and π_*MU the Lazard ring with generator degrees doubled. At p, construct the p-typical retract BP of MU_(p), with π_*BP=Z_(p)[v₁,v₂,…] and |v_i|=2(p^i−1). Fix a p-typical coordinate and a standard generator convention; do not assert E∞ structures on BP or all its quotients.

**Direct inputs.** [Complex orientations](#ch-1-complex-orientation), `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`.

**Construction/proof outline.**

1. Build MU from universal complex-bundle Thom spaces and the direct-sum maps.
2. Use the Quillen universal-law comparison and the p-typical idempotent to identify the BP summand.
3. The Quillen theorem and realization of the idempotent are recorded inputs requiring proof-level expansion.

**Uses.** Hopkins–Smith nilpotence: Complex cobordism detects smash nilpotence. LMMT §4.2 and proof of Corollary 4.21: BP quotients and v_n inversion control chromatic support.

**API.**

- `Chromatic.cobordism_p_typical.orientation` (data): MU carries its tautological complex orientation.
- `Chromatic.cobordism_p_typical.classifyOrientation` (universal-property): The universal formal-law coefficient map agrees with the oriented Thom-class construction under the Quillen comparison.
- `Chromatic.cobordism_p_typical.bpRetract` (projection): The p-typical idempotent on MU_(p) splits with image BP.
- `Chromatic.cobordism_p_typical.coefficients` (equivalence): The chosen coefficient generators identify π_*BP with the displayed graded polynomial algebra.

**Checks.**

- `Chromatic.cobordism_p_typical.check_1` (computation): The p-typical v₀ convention is p, of degree zero.
- `Chromatic.cobordism_p_typical.check_2` (computation): |v₁|=2p−2, including degree two at p=2.
- `Chromatic.cobordism_p_typical.check_3` (non-example): At p=3, π₂BP=0 whereas π₂MU_(3)=Z_(3); the p-typical retract is not all of MU_(3).

**Sources.** [Rav84](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), §2, p.360. The coefficient conventions for BP and its quotients are fixed here. [Beh19](https://arxiv.org/pdf/1901.07990), §1.2, pp.4–8. Complex orientations produce the formal laws used by complex cobordism.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-1-morava-coefficient-spectra"></a>
### Morava K-theory and Johnson–Wilson spectra

**Target** `ChromaticHomotopyTheory:CH.1/morava-coefficient-spectra` (construction · planet). For n≥1 construct BP⟨n⟩ and k(n) as BP-module quotients with π_*BP⟨n⟩=Z_(p)[v₁,…,v_n] and π_*k(n)=F_p[v_n]. Form E(n)=BP⟨n⟩[v_n⁻¹] and K(n)=k(n)[v_n⁻¹], with graded coefficients Z_(p)[v₁,…,v_(n−1),v_n^±1] and F_p[v_n^±1]. Set BP⟨0⟩=k(0)=HZ_(p), E(0)=K(0)=HQ, and K(∞)=HF_p. K(n) admits a unital homotopy-associative multiplication; no homotopy commutativity at p=2 or E∞ quotient structure is imposed.

**Direct inputs.** [Complex cobordism and Brown–Peterson theory](#ch-1-cobordism-p-typical), `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-ring`.

**Construction/proof outline.**

1. Construct module quotients by regular coefficient sequences and choose compatible v_n actions.
2. Invert the action by the sequential homotopy colimit, computing homotopy groups using the supplier’s telescope formula.
3. Supply the ring structures needed for nilpotence detection separately from module quotient existence.

**Uses.** LMMT Lemmas 2.2–2.3: Morava theories detect self-map periodicity and nilpotence. LMMT proof of Corollary 4.21: E(n) represents the finite-height Bousfield class.

**API.**

- `Chromatic.morava_coefficient_spectra.connectiveCoefficients` (equivalence): The connective quotients have exactly the displayed nonnegative graded homotopy rings.
- `Chromatic.morava_coefficient_spectra.invert_vn` (universal-property): For a BP-module M on which v_n acts invertibly, restriction along BP⟨n⟩→E(n), respectively k(n)→K(n), is an equivalence of the corresponding module mapping spaces into M.
- `Chromatic.morava_coefficient_spectra.unitProduct` (structure): K(n) has a compatible homotopy associative unital product and its module homology satisfies the graded-field Künneth theorem.
- `Chromatic.morava_coefficient_spectra.orientation` (compatibility): The quotient and localization maps preserve the chosen complex orientation wherever a ring structure is used.

**Checks.**

- `Chromatic.morava_coefficient_spectra.check_1` (non-example): K(0) has Q in degree zero and no other homotopy groups.
- `Chromatic.morava_coefficient_spectra.check_2` (computation): For n≥1, K(n)_* is a graded field with a nonzero class precisely in degrees divisible by 2(p^n−1).
- `Chromatic.morava_coefficient_spectra.check_3` (non-example): K(∞)=HF_p is distinct from every periodic K(n).

**Sources.** [Rav84](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), §2, p.360 and Theorem 2.1, pp.361–363. This fixes the BP-module quotients, v_n localizations and height-zero conventions.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-1-vn-cofiber-sequences"></a>
### Connective periodic cofiber sequences

**Target** `ChromaticHomotopyTheory:CH.1/vn-cofiber-sequences` (theorem). For n≥1 there are BP-module cofiber sequences Σ^(2p^n−2)BP⟨n⟩→BP⟨n⟩→BP⟨n−1⟩ and Σ^(2p^n−2)k(n)→k(n)→HF_p, with first maps multiplication by v_n. Multiplication by p on BP⟨0⟩=HZ_(p) has cofiber HF_p. Inverting v_n in the first two middle terms gives E(n) and K(n). For every spectrum X, K(n)_*(X⊗Y)≅K(n)_*X⊗_(K(n)_*)K(n)_*Y; in particular K(m)⊗K(n)=0 for m≠n, including the stated endpoints 0 and ∞. For finite V, duality preserves vanishing of K(n)-homology.

**Direct inputs.** [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), `StableHomotopyKTheory:H.5:spectra/mapping-cone-and-homotopy-fibre`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, [Spanier–Whitehead duality](#ch-0-finite-duality).

**Construction/proof outline.**

1. Use regularity of the coefficient element and the homotopy exact sequence to identify quotient modules.
2. For Künneth, split K(n)-modules into wedges of suspensions of K(n) by choosing homogeneous bases; use this only as a graded-field argument.
3. The different-height vanishing uses the chosen p-typical v_n action on each coefficient theory.
4. Apply finite duality after base change to the graded-field K(n)-module category; a finite graded vector space vanishes exactly when its dual does.

**Acceptance.**

- At n=1 the quotient of BP⟨1⟩ by v₁ is HZ_(p), whereas the quotient of k(1) is HF_p.
- At n=0 the relevant self-map is p, with degree zero.

**Sources.** [Rav84](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), Theorem 2.1(e),(f),(h),(i) and proof, pp.361–363. The cofiber sequences, graded-field behavior and distinct-height orthogonality are the inputs used below.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-2"></a>
## CH.2. Nilpotence, type and periodicity

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`.

<a id="ch-2-chromatic-type"></a>
### Chromatic type

**Target** `ChromaticHomotopyTheory:CH.2/chromatic-type` (definition · planet). For n≥0 let C_n⊂FinSp_(p) consist of V with K(i)⊗V=0 for all 0≤i<n. A nonzero V has type n if V∈C_n and K(n)⊗V≠0; the zero object alone has type ∞. Each C_n is a thick tensor ideal. C_0 is all finite p-local spectra; C_1 is the finite rationally acyclic subcategory.

**Direct inputs.** [Finite p-local spectra](#ch-0-finite-p-local-spectra), [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences).

**Construction/proof outline.**

1. K(n)-homology is exact, so the vanishing conditions are closed under shifts, finite cofibers and retracts. The graded-field Künneth theorem gives the tensor-ideal property.
2. For a nonzero finite p-local spectrum, mod-p homology is nonzero. Lemma 2.1 compares it, degree by degree in the finite cell range, with K(n)-homology for sufficiently large n; thus a first nonvanishing finite height exists. This argument does not assume the thick-subcategory classification.
3. The nested-support statement identifies the customary single-detector definition with vanishing at all smaller heights. Künneth then gives type(V⊗W)=max(type V,type W), with the zero-object convention.

**Uses.** LMMT §2.1: Selects the finite source of a v_n self-map. LMMT Lemma 2.6: Determines the compact kernel of finite localization.

**API.**

- `Chromatic.chromatic_type.mem_iff` (characterisation): Membership in C_n is the displayed finite list of Morava-homology vanishing conditions.
- `Chromatic.chromatic_type.thickTensorIdeal` (structure): C_n is stable, retract closed and a tensor ideal.
- `Chromatic.chromatic_type.type_smash` (relation): For nonzero finite V,W, type(V⊗W)=max(type(V),type(W)).

**Checks.**

- `Chromatic.chromatic_type.check_1` (computation): S_(p) has type zero.
- `Chromatic.chromatic_type.check_2` (computation): S/p has type one.
- `Chromatic.chromatic_type.check_3` (non-example): The zero spectrum is in every C_n and must not be assigned any finite exact type.

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Theorem 7 and nested supports, p.3; Lemma 2.1, p.15. The chromatic filtration classifies thick subcategories of finite p-local spectra.

<a id="ch-2-nilpotence"></a>
### Nilpotence theorem

**Target** `ChromaticHomotopyTheory:CH.2/nilpotence` (theorem · planet). A map f:V→X with V finite is smash nilpotent if and only if K(i)_*f=0 for every i∈{0,1,2,…,∞}. A self-map of a finite spectrum is nilpotent under composition if and only if its action on every K(i)-homology is nilpotent. For an associative unital ring spectrum R and x∈π_*R, x is nilpotent if and only if its image in K(i)_*R is nilpotent for every i, including K(∞)=HF_p. State the integral version by varying the prime; here V and rings are p-local where the fixed-prime formulation is used. For the particular unit-detection consequence for p-local R, namely R=0 iff all K(i)⊗R=0, a unital magma in the homotopy category suffices; associativity is retained for the general graded-element formulation.

**Direct inputs.** [Chromatic type](#ch-2-chromatic-type), [Complex cobordism and Brown–Peterson theory](#ch-1-cobordism-p-typical), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Spanier–Whitehead duality](#ch-0-finite-duality).

**Construction/proof outline.**

1. Import the complex-cobordism smash-nilpotence input, whose proof-level extraction is recorded as gap G1.
2. Follow Hopkins–Smith’s reduction from MU detection to the family of Morava theories, retaining the mod-p endpoint.
3. For ring elements use multiplication after smash powers; for finite self-maps use finite duality and the endomorphism ring.

**Acceptance.**

- The unit of a nonzero ring spectrum cannot be nilpotent.
- Testing only one fixed finite height does not give the stated criterion.

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Theorem 3, pp.2–3; its reduction in §2.1, pp.15–17. The source supplies the map, self-map and ring-element forms of nilpotence. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Remark 2.4, p.8. The zero-ring criterion only requires the two-sided unit, rather than an associative multiplication.

**Open proof inputs.** [G1](#g1). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-2-thick-subcategory"></a>
### Thick subcategory theorem

**Target** `ChromaticHomotopyTheory:CH.2/thick-subcategory` (theorem · planet). Every thick subcategory of FinSp_(p) is C_n for a unique n∈{0,1,…,∞}, with C_∞={0}. In particular a finite type-n object generates C_n under finite cofibers, shifts and retracts. There are finite objects of every finite type.

**Direct inputs.** [Chromatic type](#ch-2-chromatic-type), [Nilpotence theorem](#ch-2-nilpotence), [Spanier–Whitehead duality](#ch-0-finite-duality), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality).

**Construction/proof outline.**

1. For finite X,Y compare their Morava supports. Take the fiber I→S of coevaluation S→D X⊗X.
2. Apply nilpotence to the map Y⊗I→Y when the support of Y is contained in that of X. An iterated coevaluation then makes Y a retract of an object of thick(X).
3. Construct successive higher-type objects as self-map cofibers using the periodicity input; the simultaneous induction of Hopkins–Smith is part of G2 and is not a circular independent proof.

**Acceptance.**

- A type-one object does not thickly generate the p-local sphere.
- C_n strictly contains C_(n+1) for every finite n.

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Theorem 7, p.3; proof in §2.2, pp.17–19. The classification and the support-to-thick-membership argument are used to compare telescopes and finite-localization kernels.

**Open proof inputs.** [G2](#g2). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-2-vn-self-map"></a>
### Periodic self-maps

**Target** `ChromaticHomotopyTheory:CH.2/vn-self-map` (definition · planet). For n≥1 a v_n self-map of a finite p-local type-n spectrum V is a stable map v:Σ^d V→V with d>0, invertible on K(n)_*V and nilpotent on K(i)_*V for i≠n, including 0 and ∞. Record d, the map and its properties as data. At height zero use multiplication by p on the integral sphere as the separately specified degree-zero map; it is not a positive-degree self-map.

**Direct inputs.** [Chromatic type](#ch-2-chromatic-type), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences).

**Construction/proof outline.**

1. Bundle the actual stable map and degree with the Morava-homology conditions.
2. The unstable version is represented after sufficient suspension by a pointed map of finite complexes; compare its stable class through suspension.

**Uses.** LMMT Definition 2.1: Defines v_n-periodic groups of spaces and spectra. CH.3: Forms telescopes and their comparison maps.

**API.**

- `Chromatic.vn_self_map.map` (data): The self-map has a specified positive suspension degree when n≥1.
- `Chromatic.vn_self_map.iterate` (constructor): Every positive power is a self-map at the same height.
- `Chromatic.vn_self_map.suspend` (functoriality): Suspension and conjugation by an equivalence transport self-map data.
- `Chromatic.vn_self_map.cofiberType` (characterisation): For a type-n object and v_n map its cofiber has type n+1.

**Checks.**

- `Chromatic.vn_self_map.check_1` (non-example): Multiplication by p on S/p is not a v₁ self-map since it is zero on K(1)-homology.
- `Chromatic.vn_self_map.check_2` (computation): A positive power of a v_n self-map is again a v_n self-map, with degree multiplied by the exponent.
- `Chromatic.vn_self_map.check_3` (non-example): For the height-zero sphere, inverting the degree-zero p map gives S[1/p], not its rationalization on all spectra.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), §2.1, p.6. The positive-degree convention for n≥1 and the fixed pair (V_n,v_n) define the periodic invariants.

<a id="ch-2-periodicity-centrality"></a>
### Periodicity and asymptotic centrality

**Target** `ChromaticHomotopyTheory:CH.2/periodicity-centrality` (theorem · planet). Every type-n finite p-local spectrum, n≥1, admits a v_n self-map. For a map f:V→W of finite spectra equipped with v_n maps, positive powers of the two self-maps can be chosen with equal suspension degree so that f commutes with those powers. Any two v_n self-maps on one finite spectrum have positive powers which agree after matching degrees. The relevant graded centrality may require further even powers; it is not strict centrality of the initial maps.

**Direct inputs.** [Chromatic type](#ch-2-chromatic-type), [Periodic self-maps](#ch-2-vn-self-map), [Nilpotence theorem](#ch-2-nilpotence), [Spanier–Whitehead duality](#ch-0-finite-duality).

**Construction/proof outline.**

1. Use the Hopkins–Smith periodicity induction and its F-isomorphism theorem for endomorphisms.
2. Kill the nilpotent error terms after passing to powers; match degrees and remove Koszul signs by a further power.
3. The key periodicity-induction input and Corollary 3.8 are retained as G2, with precise proof-expansion work.

**Acceptance.**

- A stable map between two type-n complexes becomes compatible after powers; the original maps need not commute.
- The existence assertion is for all finite types n and every prime.

**Sources.** [HS98](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), Theorems 9 and 11, pp.4–6; Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21. Existence and centrality up to powers justify changing finite sources and comparing telescopes. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 2.2(vii), p.7. The application needs eventual commutation, not a strictly central original self-map.

**Open proof inputs.** [G2](#g2). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-3"></a>
## CH.3. Telescopes and periodic homotopy

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

<a id="ch-3-telescope"></a>
### Telescopes

**Target** `ChromaticHomotopyTheory:CH.3/telescope` (construction · planet). Fix for n≥1 a type-n finite complex V_n and v_n:Σ^d V_n→V_n. Set T(n)=hocolim(V_n→Σ^(−d)V_n→Σ^(−2d)V_n→⋯), with arrows the desuspensions of v_n. Set T(0)=S[1/p]. The object depends on the pair; its Bousfield class does not. Do not replace T(0) by HQ except after restricting the argument to p-local spectra.

**Direct inputs.** [Periodic self-maps](#ch-2-vn-self-map), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality), `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Apply the supplier’s sequential homotopy-colimit construction to the desuspended map.
2. Use eventual centrality and the thick theorem, in the separate comparison theorem below, to remove the pair from the Bousfield class.

**Uses.** LMMT Lemma 2.2: Determines acyclicity and p-completion invariance. CH.4: Forms the finite chromatic tower.

**API.**

- `Chromatic.telescope.structureMap` (projection): There are compatible maps Σ^(−rd)V_n→T(n).
- `Chromatic.telescope.mappingUniversal` (universal-property): Mapping from the telescope is the homotopy limit of mapping spaces from the displayed sequence.
- `Chromatic.telescope.smash` (compatibility): Tensoring with X commutes with this homotopy colimit.
- `Chromatic.telescope.invert` (structure): The induced v_n action on T(n) is invertible.

**Checks.**

- `Chromatic.telescope.check_1` (computation): Inverting a nilpotent map gives zero.
- `Chromatic.telescope.check_2` (computation): Replacing v_n by a positive power gives an equivalent telescope.
- `Chromatic.telescope.check_3` (computation): For q≠p, T(0)⊗S/q≠0 whereas HQ⊗S/q=0.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), §2.1 and Lemma 2.2(vii), pp.6–7. The fixed-pair telescope and the S[1/p] convention are explicit.

<a id="ch-3-periodic-homotopy"></a>
### Periodic homotopy groups

**Target** `ChromaticHomotopyTheory:CH.3/periodic-homotopy` (definition · planet). For n≥1 and a fixed unstable representative v:Σ^dV→V, define v_n⁻¹π_k(X;V) as colim_r π_(k+rd)Map_*(V,X) under precomposition with v, taking a tail where k+rd≥2 for spaces. For spectra use the stable mapping spectrum and integer grading. A v_n-periodic equivalence induces isomorphisms in every degree. At height zero, for spectra and simple spaces use π_*(X)[1/p]; it is a separate convention.

**Direct inputs.** [Periodic self-maps](#ch-2-vn-self-map), [Telescopes](#ch-3-telescope), `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction/proof outline.**

1. Precomposition increases mapping-space homotopy degree by d; the positive degree makes a cofinal abelian tail available.
2. Compare unstable mapping into Ω∞X with the mapping spectrum out of Σ∞V through adjunction.
3. Keep dependence on V in the groups; only the equivalence condition is independent after the telescope comparison.

**Uses.** LMMT Proposition 2.11: Connective periodic equivalences become finite-local homology equivalences. CH.5: The Bousfield–Kuhn functor represents these groups.

**API.**

- `Chromatic.periodic_homotopy.map` (functoriality): A pointed map induces maps on every periodic homotopy group, preserving identity and composition.
- `Chromatic.periodic_homotopy.stableAdjunction` (compatibility): The groups for a spectrum X and for Ω∞X agree at positive height.
- `Chromatic.periodic_homotopy.periodicity` (equivalence): Shifting the degree by d is an isomorphism induced by the self-map.
- `Chromatic.periodic_homotopy.equivalenceCriterion` (characterisation): A v_n-periodic equivalence is exactly an isomorphism on all displayed colimits.

**Checks.**

- `Chromatic.periodic_homotopy.check_1` (computation): Periodic groups of a contractible pointed space vanish.
- `Chromatic.periodic_homotopy.check_2` (computation): A bounded Postnikov spectrum has zero positive-height periodic groups.
- `Chromatic.periodic_homotopy.check_3` (computation): The p-inverted groups of S/q with q≠p can be nonzero at height zero.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Definition 2.1 and Lemma 2.2(i),(ii),(viii), pp.6–7. These are the periodic groups and the tests of periodic equivalences.

<a id="ch-3-telescope-properties"></a>
### Telescope acyclicity criteria

**Target** `ChromaticHomotopyTheory:CH.3/telescope-properties` (theorem · planet). For n≥1: (a) X and Ω∞X have the same v_n-periodic groups; (b) any integer connective cover of a spectrum, and any finite connected cover of a space, is a v_n-periodic equivalence; (c) K(i)⊗T(n)=0 for i≠n, including i=0,∞; (d) T(n)-acyclicity implies K(n)-acyclicity; (e) S/p-acyclicity implies T(n)-acyclicity; (f) X→X_p^∧ is a T(n)-equivalence, for arbitrary spectra with the imported derived p-completion; (g) the Bousfield class of T(n) is independent of (V_n,v_n); (h) X is T(n)-acyclic exactly when all its v_n-periodic groups vanish. At n=0 retain only the separately justified p-inversion statements.

**Direct inputs.** [Telescopes](#ch-3-telescope), [Periodic homotopy groups](#ch-3-periodic-homotopy), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Spanier–Whitehead duality](#ch-0-finite-duality), [Thick subcategory theorem](#ch-2-thick-subcategory), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality), `StableHomotopyKTheory:H.6/moore-spectrum`, `StableHomotopyKTheory:H.6/p-completion`.

**Construction/proof outline.**

1. For (a),(b) use adjunction, positive-degree shifts and vanishing of maps from highly suspended finite complexes to bounded truncations.
2. For (c),(d) use K(n)-Künneth and finite graded dimension. For (e) use a power of p annihilating a finite positive-type spectrum; (f) follows from the S/p-equivalence of derived p-completion.
3. For (g) take thick generators and eventually commuting powers. For (h) dualize the finite source and compare the two telescope Bousfield classes. The finite p-power annihilation and source-comparison argument are recorded in G3 until expanded.

**Acceptance.**

- The p-completion map need not be a T(0)-equivalence.
- The criterion is acyclicity, not an identification of T(n) with K(n) as spectra.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 2.2(i)–(viii) and proof, pp.6–7. All eight parts are retained, with the positive-height qualification and a distinct height-zero convention.

**Open proof inputs.** [G3](#g3). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-3-ring-acyclicity"></a>
### Ring-spectrum acyclicity comparison

**Target** `ChromaticHomotopyTheory:CH.3/ring-acyclicity` (theorem · planet). For n≥1 and any associative unital ring spectrum R, T(n)⊗R=0 if and only if K(n)⊗R=0. No such comparison is asserted for an arbitrary spectrum or for T(0) versus K(0).

**Direct inputs.** [Telescope acyclicity criteria](#ch-3-telescope-properties), [Nilpotence theorem](#ch-2-nilpotence), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality), `StableHomotopyKTheory:H.5:spectra/ring-spectrum`.

**Construction/proof outline.**

1. One direction is telescope detection. For the other replace the finite source by its endomorphism ring D V⊗V and take a central power of the self-map.
2. The resulting telescope can be made a unital ring, so its tensor with R has a unit. All Morava theories, including HF_p, kill this tensor if K(n) kills R. Nilpotence of the unit forces it to be zero.
3. Retain the ring hypothesis on the object whose unit is tested; an arbitrary module does not acquire such a unit.

**Acceptance.**

- The criterion applies to E₁ rings at p=2.
- At height zero the ring HF_q, q≠p, separates S[1/p] from HQ.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 2.3, p.7; Remark 2.4, p.8. The proof uses a ring model for the telescope and nilpotence of the unit, with n≥1.

<a id="ch-4"></a>
## CH.4. Finite localization and fracture

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.2`, `ChromaticHomotopyTheory:CH.3`, `EnhancedDerivedSheaves:E5:presentability`.

<a id="ch-4-finite-localizations"></a>
### Finite chromatic localizations

**Target** `ChromaticHomotopyTheory:CH.4/finite-localizations` (construction · planet). Write L_n=L_(K(0)∨⋯∨K(n)). On all spectra write L_n^f=L_(HQ∨T(1)∨⋯∨T(n)), so this includes p-localization, and write L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). For n=0 these are respectively HQ-localization and p-inversion. Construct units and tower maps L_n→L_(n−1), L_n^f→L_(n−1)^f and L_n^(p,f)→L_(n−1)^(p,f). The finite kernels and smashing property are theorems, not parts of the notation.

**Direct inputs.** [Homological Bousfield localization](#ch-0-homological-localization), [Telescopes](#ch-3-telescope), [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Chromatic type](#ch-2-chromatic-type).

**Construction/proof outline.**

1. Use the wedge of the indicated detecting spectra to obtain each reflector.
2. The inclusion of acyclic classes gives natural transition maps compatible with the units.

**Uses.** LMMT Lemmas 2.6–2.8: The finite kernels and fracture squares control localization sequences. PAPER-CLAUSEN-MATHEW-21/118: Supplies the chromatic basics with a single explicit T(0) translation.

**API.**

- `Chromatic.finite_localizations.unit` (projection): Each tower has natural units from X.
- `Chromatic.finite_localizations.transition` (functoriality): The truncation maps of the detector wedges induce compatible maps down the towers.
- `Chromatic.finite_localizations.local_iff` (characterisation): An object is local exactly for the E-equivalences of the displayed wedge.
- `Chromatic.finite_localizations.ringLocalization` (structure): For a smashing tower, the localized sphere is an idempotent commutative algebra and L(X)=L(S)⊗X.

**Checks.**

- `Chromatic.finite_localizations.check_1` (computation): L_0^fS=HQ but L_0^(p,f)S=S[1/p].
- `Chromatic.finite_localizations.check_2` (computation): For p-local X the two finite towers agree, by the separate comparison theorem.
- `Chromatic.finite_localizations.check_3` (computation): L_n^f kills S/q for q≠p while L_n^(p,f) preserves this spectrum.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Definition 2.5, p.8. The source distinguishes the two finite localization conventions at height zero.

<a id="ch-4-finite-kernel-smashing"></a>
### Finite localization kernels

**Target** `ChromaticHomotopyTheory:CH.4/finite-kernel-smashing` (theorem · planet). For n≥0, inside Sp_(p), ker(L_n^f)=Ind(C_(n+1)). Consequently finite localization in Sp_(p) is the localization away from a type-(n+1) finite spectrum, is smashing and preserves compact objects into the compact localized category. On all spectra ker(L_n^(p,f)) is the localizing subcategory generated by finite p-primary-torsion spectra of type at least n+1; it too is smashing. The kernel of L_n^f on all spectra additionally contains all q-primary finite spectra for q≠p.

**Direct inputs.** [Finite chromatic localizations](#ch-4-finite-localizations), [Thick subcategory theorem](#ch-2-thick-subcategory), [Telescope acyclicity criteria](#ch-3-telescope-properties), `EnhancedDerivedSheaves:E5:presentability/ind-verdier-localization`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`.

**Construction/proof outline.**

1. Identify finite acyclics from periodicity and type. Use the compactly generated Verdier quotient to get its Ind kernel.
2. For the p-finite convention rationally trivial finite generators are already p-torsion and have no information away from p.
3. Since the kernel is generated by dualizable compact tensor-ideal objects, prove the right adjoint preserves coproducts and tensoring with the localized sphere realizes the localization. G3 contains the finite-generation comparison input.

**Acceptance.**

- At n=0, the p-finite kernel is generated by S/p.
- On p-local spectra, the n=0 kernel is all rationally acyclic spectra.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 2.6 and proof, p.8. The acyclic kernel is an Ind category of finite acyclics; the p-finite variant retains the other primes.

**Open proof inputs.** [G3](#g3). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-4-p-local-comparison"></a>
### Comparison on p-local spectra

**Target** `ChromaticHomotopyTheory:CH.4/p-local-comparison` (comparison). If X is p-local then L_n^(p,f)X≃L_n^fX, naturally and compatibly with tower units and transition maps. Both outputs are p-local. Without p-locality the comparison is false, as S/q with q≠p shows. The functor called finite localization in Clausen–Mathew’s p-local convention is the L_n^f specified here.

**Direct inputs.** [Finite chromatic localizations](#ch-4-finite-localizations), [Finite localization kernels](#ch-4-finite-kernel-smashing).

**Construction/proof outline.**

1. On p-local spectra, tensoring with S[1/p] is rationalization. The positive-height detectors are already p-local.
2. Restrict the two localization universal properties to Sp_(p); their acyclics coincide there.

**Acceptance.**

- Check X=S_(p), including n=0.
- Check X=S/q, q≠p, to disprove an unrestricted comparison.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Definition 2.5, p.8; consequence (i) of Lemma 2.8, p.9. The two finite localizations coincide on the p-local subcategory.

<a id="ch-4-fracture-square"></a>
### Chromatic fracture squares

**Target** `ChromaticHomotopyTheory:CH.4/fracture-square` (theorem · planet). Let E,F be spectra and assume L_E sends F-acyclics to F-acyclics. For every X the natural square L_(E∨F)X→L_FX over L_EX→L_E L_FX is cartesian. The hypothesis holds if L_E is smashing or if L_F kills every E-local spectrum. Apply it for 0≤m<n to E=T(0)∨⋯∨T(m) and F=T(m+1)∨⋯∨T(n), giving the finite-tower fracture square with upper-left L_n^(p,f)X and lower-left L_m^(p,f)X. The analogous p-local HQ convention follows by comparison.

**Direct inputs.** [Homological Bousfield localization](#ch-0-homological-localization), [Finite chromatic localizations](#ch-4-finite-localizations), [Finite localization kernels](#ch-4-finite-kernel-smashing), [Comparison on p-local spectra](#ch-4-p-local-comparison).

**Construction/proof outline.**

1. The pullback is local for E∨F because its three other vertices are local for the appropriate detector.
2. Compare its fiber with that of X→L_FX, then use preservation of F-acyclics to see the map from X is also an E-equivalence.
3. Check the two sufficient conditions explicitly; use smashing of the lower finite tower in the application.

**Acceptance.**

- For m=0 the lower localization is p-inversion, not integral rationalization.
- The condition on L_E is required for the general lemma.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemmas 2.7–2.8 and proof, p.8. The general fracture criterion is stated before its finite chromatic specialization.

<a id="ch-4-bottom-finite-comparison"></a>
### Bottom finite-local comparison

**Target** `ChromaticHomotopyTheory:CH.4/bottom-finite-comparison` (comparison). If X is T(1)-acyclic, then L_1^(p,f)X→X[1/p] is an equivalence, without a p-locality assumption on X. In the p-local subcategory this says L_1^fX≃X⊗HQ.

**Direct inputs.** [Chromatic fracture squares](#ch-4-fracture-square), [Finite chromatic localizations](#ch-4-finite-localizations).

**Construction/proof outline.**

1. Use the height-one fracture square with lower detector S[1/p].
2. The T(1)-local corner of X is zero, so the pullback is X[1/p].

**Acceptance.**

- For X=S/q with q≠p, the result is X rather than zero.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Consequences (i)–(ii) of Lemma 2.8, p.9. The second consequence is the bottom comparison under T(1)-acyclicity.

<a id="ch-5"></a>
## CH.5. Bousfield–Kuhn functors

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.2`, `ChromaticHomotopyTheory:CH.3`, `StableHomotopyKTheory:H.5:spectra`.

<a id="ch-5-finite-telescopic-functor"></a>
### Finite telescopic functors

**Target** `ChromaticHomotopyTheory:CH.5/finite-telescopic-functor` (construction · planet). For a finite pointed complex V and a v_n map v:Σ^d V→V with n≥1, construct a spectrum-valued functor Φ_v on pointed spaces by repeating Map_*(V,−) along the v-induced degree-d structure maps. Its integer homotopy groups are v_n⁻¹π_*(−;V). Transport along compatible powers of self-maps and finite maps is coherently functorial, rather than a choice made only in the homotopy category.

**Direct inputs.** [Periodic homotopy groups](#ch-3-periodic-homotopy), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality), `StableHomotopyKTheory:H.5:spectra/symmetric-spectrum`.

**Construction/proof outline.**

1. Use d-periodic prespectra and spectrification to encode the precomposition structure maps.
2. Compare homotopy groups with the cofinal colimits defining periodic groups.
3. Rigidify the comparison maps for finite complexes as in Kuhn §5; the precise coherent choice construction is a remaining proof input G4.

**Uses.** Kuhn Theorem 1.1: These finite-source functors assemble the Bousfield–Kuhn functor. LMMT Proposition 2.9: They explain why periodic homotopy detects positive-height stable information.

**API.**

- `Chromatic.finite_telescopic_functor.homotopyGroups` (characterisation): π_kΦ_v(X) is the displayed periodic mapping-space colimit.
- `Chromatic.finite_telescopic_functor.iterate` (equivalence): Positive powers give canonically compatible equivalent functors.
- `Chromatic.finite_telescopic_functor.finiteMap` (functoriality): Eventually compatible finite maps induce comparison maps, with rigidified composition.
- `Chromatic.finite_telescopic_functor.stableInput` (compatibility): On Ω∞X, the construction agrees with periodic localization of the mapping spectrum F(V,X).

**Checks.**

- `Chromatic.finite_telescopic_functor.check_1` (computation): If X is a finite Postnikov space then Φ_v(X)=0.
- `Chromatic.finite_telescopic_functor.check_2` (computation): Passing from v to a positive power preserves Φ_v up to the canonical cofinal equivalence.
- `Chromatic.finite_telescopic_functor.check_3` (computation): The homotopy groups of Φ_v(Ω∞X) agree with the stable periodic groups.

**Sources.** [Kuhn08](https://arxiv.org/pdf/0802.0510), §3.1, Lemma 3.1, pp.9–11; Theorem 5.2 and Lemma 5.4, pp.15–17. Finite telescopic functors and rigidification supply the pieces used to build Φ_n.

**Open proof inputs.** [G4](#g4). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-5-bousfield-kuhn"></a>
### Bousfield–Kuhn functor

**Target** `ChromaticHomotopyTheory:CH.5/bousfield-kuhn` (construction · planet). For each n≥1 construct Φ_n:Spaces_*→Sp_(T(n)) with natural equivalences F(V,Φ_nY)≃Φ_vY for finite type-n V with self-map v, and Φ_nΩ∞X≃L_(T(n))X. The first comparison uses the finite mapping spectrum; the second is natural in every spectrum X. State uniqueness with the finite-source compatibilities, not merely the equality of homotopy groups.

**Direct inputs.** [Finite telescopic functors](#ch-5-finite-telescopic-functor), [Homological Bousfield localization](#ch-0-homological-localization), [Telescope acyclicity criteria](#ch-3-telescope-properties), [Spanier–Whitehead duality](#ch-0-finite-duality).

**Construction/proof outline.**

1. Take Kuhn’s homotopy inverse limit over a cofinal system of finite type-n complexes and their rigidified maps.
2. Use the finite-source formula to identify the values on infinite loop spaces and to prove T(n)-locality.
3. Record the precise finite-system cofinality and rigidification theorem as G4; do not infer a coherent functor from homotopy groups alone.

**Uses.** LMMT Proposition 2.9: Gives detection of T(n)-equivalences by Σ∞Ω∞. Clausen–Mathew 2017 Theorem 2.6: Transports an unstable transfer section to localized stable Tate vanishing.

**API.**

- `Chromatic.bousfield_kuhn.isLocal` (structure): Every value of Φ_n is T(n)-local.
- `Chromatic.bousfield_kuhn.finiteSource` (characterisation): The finite-source formula is natural in Y and compatible with powers and finite maps.
- `Chromatic.bousfield_kuhn.infiniteLoop` (equivalence): The natural equivalence Φ_nΩ∞≃L_(T(n)) respects maps of spectra.
- `Chromatic.bousfield_kuhn.unique` (extensionality): T(n)-local-valued functors equipped with the compatible finite-source characterization are equivalent compatibly with that characterization; locality is part of the uniqueness hypothesis.

**Checks.**

- `Chromatic.bousfield_kuhn.check_1` (computation): Φ_nΩ∞ of a T(n)-acyclic spectrum is zero.
- `Chromatic.bousfield_kuhn.check_2` (computation): Φ_nΩ∞T(n)≃L_(T(n))T(n) is nonzero.
- `Chromatic.bousfield_kuhn.check_3` (non-example): There is no height-zero functor with this unrestricted comparison on all spectra, since Ω∞ annihilates strictly negative Eilenberg–Mac Lane spectra.

**Sources.** [Kuhn08](https://arxiv.org/pdf/0802.0510), Theorem 1.1, pp.3–4; Theorem 5.2, Lemmas 5.4–5.5 and Definition 5.6, pp.15–18. These are the finite-source characterization and the infinite-loop-space comparison.

**Open proof inputs.** [G4](#g4). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-5-suspension-loop-detection"></a>
### Detection by suspension and loops

**Target** `ChromaticHomotopyTheory:CH.5/suspension-loop-detection` (theorem · planet). For n≥1, if Σ∞Ω∞f is a T(n)-equivalence then f is a T(n)-equivalence. Indeed L_(T(n))f is a retract of Φ_nΩ∞Σ∞Ω∞f by the suspension-loop unit and counit. At n=0 the corresponding detection holds for maps of connective spectra with p inverted. The positive-height functor Σ∞Ω∞ does not in general preserve T(n)-equivalences: HZ is T(n)-acyclic whereas Σ∞Ω∞HZ=Σ∞Z has nonzero sphere summands.

**Direct inputs.** [Bousfield–Kuhn functor](#ch-5-bousfield-kuhn), `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, [Telescope acyclicity criteria](#ch-3-telescope-properties).

**Construction/proof outline.**

1. Apply Φ_n to the suspension-loop triangle identity, giving a natural retract diagram.
2. For the height-zero connective assertion compare the least nonzero p-inverted homotopy group using Hurewicz, and then the fiber.
3. Use HZ and its discrete infinite loop space to test the absent preservation direction.

**Acceptance.**

- The hypothesis is preservation after applying Σ∞Ω∞; the conclusion does not give the converse.
- A negative Eilenberg–Mac Lane spectrum rules out the unrestricted height-zero detection statement.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proposition 2.9 and Remark 2.10, p.9. Detection is proved by the triangle identity, with an explicit failure of preservation.

<a id="ch-6"></a>
## CH.6. Connective spaces and generalized homology

**Stage inputs.** `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.5`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

<a id="ch-6-space-postnikov"></a>
### Postnikov and connected-cover conventions

**Target** `ChromaticHomotopyTheory:CH.6/space-postnikov` (comparison). Import the space Postnikov towers from H.3, including nontrivial fundamental-group action; only the comparison and indexing convention are owned here. For a pointed space X, construct τ_≤rX for r≥0 and the connected cover X⟨r⟩=fib(X→τ_≤(r−1)X) for r≥1. Then π_iτ_≤rX agrees with π_iX for i≤r and vanishes for i>r, and X⟨r⟩ has zero π_i for i<r. The tower converges for spaces. For a map, say m-connective when every homotopy fiber is (m−1)-connected, so π_i is an isomorphism for i<m and a surjection for i=m, at compatible components and basepoints.

**Direct inputs.** `StableHomotopyKTheory:H.3/postnikov-principal-fibrations`, `StableHomotopyKTheory:H.3/postnikov-limit-weak-equivalence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Construction/proof outline.**

1. Use the imported tower componentwise; it is principal only under the supplier’s trivial-action hypothesis.
2. Form the fiber of X→τ_≤(r−1)X and read its connectivity from the long exact homotopy sequence.
3. Translate the indexing of connected covers and connective maps to the convention below.

**Acceptance.**

- τ_≤0X is the discrete component space, not a connected replacement.
- X⟨1⟩ is the basepoint component of X.
- K(A,r)⟨r+1⟩ is contractible, whereas τ_≤rK(A,r)≃K(A,r).

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 2.2(ii), p.6; proof of Proposition 2.11, pp.9–10. Connected covers and Postnikov stages are used to compare space and spectrum periodic information. [BHM19](https://arxiv.org/pdf/1811.04030), §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6. Connected covers preserve positive-height periodic information.

<a id="ch-6-generalized-serre-filtration"></a>
### Generalized Serre filtration

**Target** `ChromaticHomotopyTheory:CH.6/generalized-serre-filtration` (construction · planet). For a fibration F→X→Y over a CW space and a spectrum E, filter E⊗Σ∞_+X by the inverse images of the skeleta of Y. The resulting homological spectral sequence has E²_(s,t)=H_s(Y; y↦E_t(F_y,+)) and d_r:(s,t)↦(s−r,t+r−1), with the full monodromy local system. Its total-degree target is π_(s+t)(E⊗Σ∞_+X). Assert strong convergence for a finite-dimensional base, or for a uniformly bounded-below fiberwise E-homology system; for arbitrary bases with periodic E state only the filtered object and conditional convergence criterion supplied by H.6.

**Direct inputs.** `StableHomotopyKTheory:H.6/filtered-spectrum`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`, `StableHomotopyKTheory:H.6/spectral-sequence-conditional-convergence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`.

**Construction/proof outline.**

1. Pull back the skeletal filtration of the base. Trivialize over cells and identify its graded terms with sums of shifted fiber E-homology.
2. The cellular boundary retains path transport, producing local coefficients.
3. Apply finite-filtration or degreewise bounded-filtration convergence; use the supplier’s derived-limit criterion in the remaining cases.

**Uses.** LMMT Proposition 2.11 proof: Promotes fiber vanishing to an E-homology equivalence. CH.13: Connective homology and vanishing lines are checked with controlled filtrations.

**API.**

- `Chromatic.generalized_serre_filtration.filtration` (data): The filtration is natural under maps of fibrations and coefficient spectra.
- `Chromatic.generalized_serre_filtration.graded` (characterisation): Over each s-cell the graded contribution is Σ^s(E⊗Σ∞_+F_y).
- `Chromatic.generalized_serre_filtration.pageTwo` (equivalence): The second page is homology with the full displayed monodromy system.
- `Chromatic.generalized_serre_filtration.convergence` (compatibility): The imported exact-couple convergence criteria apply under their explicit boundedness or derived-limit hypotheses.

**Checks.**

- `Chromatic.generalized_serre_filtration.check_1` (computation): For Y=* the target is E_*(F_+).
- `Chromatic.generalized_serre_filtration.check_2` (computation): For E=HZ and the mapping torus of a degree −1 map S¹→S¹, monodromy acts by −1 on H₁ of the fiber. The spectral sequence gives H₁=Z⊕Z/2 and H₂=0; constant coefficients would incorrectly give the torus groups Z² and Z.
- `Chromatic.generalized_serre_filtration.check_3` (non-example): For an infinite base and a periodic E, no first-quadrant strong-convergence claim follows just from the displayed E² page.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proof of Proposition 2.11(ii), p.10. A generalized Serre argument is used for fiberwise localized homology. [BHM19](https://arxiv.org/pdf/1811.04030), §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6. The mapping-space proof provides another route to the localized homology comparison.

<a id="ch-6-fiberwise-equivalence"></a>
### Fiberwise homology comparison

**Target** `ChromaticHomotopyTheory:CH.6/fiberwise-equivalence` (theorem · planet). Let f:X→Y be a map of spaces and E a spectrum. If for every y the augmentation E⊗Σ∞_+fib_y(f)→E is an equivalence, then E⊗Σ∞_+f is an equivalence, with no finiteness hypothesis on Y and no boundedness hypothesis on E. For pointed connected fibers the hypothesis says that their reduced E-homology vanishes. This theorem supplies the arbitrary-base comparison even when a periodic Serre spectral sequence has no established strong convergence.

**Direct inputs.** `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`.

**Construction/proof outline.**

1. Unstraighten f as a space-indexed local system of spaces; after applying E⊗Σ∞_+ its colimit over Y is E⊗Σ∞_+X.
2. The fiber augmentations give a natural equivalence to the constant local system E.
3. Take colimits. Compose the left Kan extension along f with that along Y→*; its pointwise fiber formula identifies the first colimit with E⊗Σ∞_+X and the constant-system colimit with E⊗Σ∞_+Y. The unstraightening and space-indexed Fubini comparison are explicit parts of the E3 request.

**Acceptance.**

- It applies to Y infinite and E periodic.
- The augmentation condition uses unreduced fibers; asserting E_*(F_+)=0 would incorrectly fail even for a point.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proposition 2.11(ii) proof, p.10. This justifies the fiberwise-to-total E-homology step without adding a convergence assumption to the theorem.

<a id="ch-6-connective-periodic-vanishing"></a>
### Connective periodic vanishing

**Target** `ChromaticHomotopyTheory:CH.6/connective-periodic-vanishing` (theorem · planet). For every n≥1 there is an integer m≥2 such that an m-connective pointed space whose v_i-periodic homotopy groups vanish for 0≤i≤n is L_n^(p,f)-acyclic after reduced suspension spectrum. Consequently an m-connective map of spaces which is a v_i-periodic equivalence for all 0≤i≤n induces an L_n^(p,f)-equivalence on suspension spectra. One can take m=n+1 using the Carmeli–Schlank–Yanovski height bound; keep this sharpened bound separate from Bousfield’s original dimension-dependent bound.

**Direct inputs.** [Postnikov and connected-cover conventions](#ch-6-space-postnikov), [Periodic homotopy groups](#ch-3-periodic-homotopy), [Finite chromatic localizations](#ch-4-finite-localizations), [Fiberwise homology comparison](#ch-6-fiberwise-equivalence), [Detection by suspension and loops](#ch-5-suspension-loop-detection), [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity).

**Construction/proof outline.**

1. Use Bousfield’s finite-nullification comparison: sufficiently connected periodic equivalences are equivalences after nullification at a type-(n+1) finite complex.
2. Identify stable acyclicity by mapping into Ω∞ of finite-local spectra as in Barthel–Heuts–Meier Lemma 3.3.
3. For the sharper bound use CSY Theorem 5.4.4 and Remark 5.4.5, then the fiberwise comparison. The precise nullification theorem and the CSY categorical-height argument are recorded as G5.

**Acceptance.**

- n=1 permits m=2 under the sharpened bound.
- No claim is made for arbitrary disconnected fibers.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proposition 2.11 and Remark 2.12, pp.9–10. The original connective bound and the sharper m=n+1 bound are separate inputs. [BHM19](https://arxiv.org/pdf/1811.04030), §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6. Finite nullification identifies sufficiently connected periodic equivalences. [CSY20](https://arxiv.org/pdf/1811.02057), Theorem 5.4.4 and Remark 5.4.5, pp.83–84. The bounded-height comparison yields the optimal connectedness range.

**Open proof inputs.** [G5](#g5). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-6-connective-loop-preservation"></a>
### Connective preservation by suspension and loops

**Target** `ChromaticHomotopyTheory:CH.6/connective-loop-preservation` (theorem). For n≥1, Σ∞Ω∞ preserves m-connective L_n^(p,f)-equivalences of spectra, where m is the bound of connective periodic vanishing, and in particular m=n+1 using the sharp bound. This does not assert preservation of arbitrary T(n)-equivalences.

**Direct inputs.** [Connective periodic vanishing](#ch-6-connective-periodic-vanishing), [Periodic homotopy groups](#ch-3-periodic-homotopy), [Telescope acyclicity criteria](#ch-3-telescope-properties), `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`.

**Construction/proof outline.**

1. Apply Ω∞ to the connective map; the periodic groups agree with the stable periodic groups.
2. Use the space comparison at every basepoint and then apply Σ∞.

**Acceptance.**

- The HZ counterexample in CH.5 has insufficiently connective fiber and does not contradict this result.
- The conclusion uses the full finite wedge through height n.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proposition 2.11(iii) and Remark 2.12, pp.9–10. The restricted preservation statement is the third part of the proposition.

<a id="ch-7"></a>
## CH.7. Morava E-theory and stabilizer actions

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`.

<a id="ch-7-morava-e-theory"></a>
### Morava E-theory

**Target** `ChromaticHomotopyTheory:CH.7/morava-e-theory` (construction · planet). Let k be a perfect field of characteristic p and G a one-dimensional commutative formal group of finite height h≥1 over k. Import its marked universal deformation ring R(k,G), noncanonically W(k)[[u₁,…,u_(h−1)]]. Construct a K(h)-local even-periodic E∞ ring E(k,G) with π₀E=R(k,G), π_*E≅R(k,G)[u^±1], |u|=−2, and formal group the universal deformation of G. The realization space equipped with that deformation identification is contractible. The coefficient isomorphism and coordinate are choices, not canonical identifications.

**Direct inputs.** [Geometric height of an orientation](#ch-1-geometric-height), [Complex orientations](#ch-1-complex-orientation), `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/marked-deformation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Import marked deformation representability with B=W(k), not a new deformation functor.
2. Apply Landweber realization to the universal law and the Goerss–Hopkins–Miller realization theorem to obtain the coherent E∞ refinement and contractible realization space.
3. The obstruction-theoretic construction of this refinement is G9; ordinary representability alone gives no E∞ structure.

**Uses.** Hahn §2: Its complex orientation and power operations prove chromatic height monotonicity. LMMT Corollary 4.21: The supersingular height-two local theory supplies the level-three comparison.

**API.**

- `Chromatic.morava_e_theory.coefficients` (equivalence): The degree-zero ring represents the imported marked deformation problem; the periodic grading has |u|=−2.
- `Chromatic.morava_e_theory.formalGroup` (compatibility): The complex-oriented formal group is isomorphic to the universal deformation under the marking.
- `Chromatic.morava_e_theory.isLocal` (structure): E(k,G) is K(h)-local and even periodic.
- `Chromatic.morava_e_theory.realizationUnique` (extensionality): The space of realizations with the specified deformation comparison is contractible.

**Checks.**

- `Chromatic.morava_e_theory.check_1` (non-example): For h=1 and k=F_p the deformation ring is Z_p, with no deformation parameters.
- `Chromatic.morava_e_theory.check_2` (computation): For h=2 and k=F_(p²), π₀ is W(F_(p²))[[u₁]].
- `Chromatic.morava_e_theory.check_3` (non-example): A height-∞ law is outside this finite-height realization theorem.

**Sources.** [Goe10](https://numdam.org/item/AST_2010__332__221_0.pdf), §3.3, Theorem 3.6, pp.238–239. The local Hopkins–Miller theorem realizes the finite-height universal deformation. [Beh19](https://arxiv.org/pdf/1901.07990), Theorem 1.7.6 and discussion, pp.33–34. The sheaf realization specializes to Lubin–Tate Morava E-theory.

**Open proof inputs.** [G9](#g9). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-7-stabilizer-action"></a>
### Morava stabilizer actions

**Target** `ChromaticHomotopyTheory:CH.7/stabilizer-action` (construction · planet). Make E(k,G) functorial on the groupoid of perfect characteristic-p fields with specified isomorphisms of their height-h formal groups after coefficient transport. Aut(k,G) acts coherently through E∞ maps. For a Honda law over F_(p^h), specify the extended stabilizer G_h=Aut(G/F_(p^h))⋊Gal(F_(p^h)/F_p). Its action on coefficients is continuous for the maximal-ideal topology, and its finite subgroup restrictions are coherent finite actions usable in Tate and homotopy fixed points. A profinite action is not modeled as a discrete finite-quotient action on E_h.

**Direct inputs.** [Morava E-theory](#ch-7-morava-e-theory), `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`.

**Construction/proof outline.**

1. Use functoriality of the marked deformation groupoid, followed by the functorial Goerss–Hopkins–Miller realization.
2. Compare coefficient automorphisms with the algebraic stabilizer action; reduce modulo successive powers of the maximal ideal to express continuity.
3. Restrict to actual finite subgroups for the finite-action API. Continuous homotopy fixed points for arbitrary closed subgroups are outside the targets; no Devinatz–Hopkins descent is silently used.

**Uses.** LMMT Corollary 4.21(iv): Finite supersingular automorphism groups act on E₂. CH.12: The level-three and supersingular quotient descriptions are equivariant.

**API.**

- `Chromatic.stabilizer_action.mapPair` (functoriality): An isomorphism of pairs gives an E∞ equivalence with coherent identity and composition.
- `Chromatic.stabilizer_action.action` (structure): Automorphisms of the pair induce the coherent group action.
- `Chromatic.stabilizer_action.coefficients` (compatibility): The action on π₀ is the action on marked universal deformations.
- `Chromatic.stabilizer_action.restrictFinite` (functoriality): Restriction to a finite subgroup agrees with the EDS finite-action carrier.

**Checks.**

- `Chromatic.stabilizer_action.check_1` (computation): At h=1 the stabilizer contains Z_p^× and acts through p-adic Adams operations.
- `Chromatic.stabilizer_action.check_2` (computation): The h=2 residue-field involution is retained in the extended group.
- `Chromatic.stabilizer_action.check_3` (non-example): At odd p and height one, the subgroup {±1} fixes π₀E₁=Z_p, while its nonidentity Adams operation sends the periodicity generator u to −u. The action on π₀ alone therefore does not determine the finite action on the spectrum.

**Sources.** [Goe10](https://numdam.org/item/AST_2010__332__221_0.pdf), Theorem 3.6 and following paragraph, p.239. Functoriality and the automorphism action are part of the local realization theorem. [Beh19](https://arxiv.org/pdf/1901.07990), §1.6, pp.27–28. The extended stabilizer includes the residue-field Galois action.

**Open proof inputs.** [G9](#g9). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8"></a>
## CH.8. Chromatic localization and its limits

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.7`, `EnhancedDerivedSheaves:E5:presentability`, `RefinedTraceMethods:RT.4:topological`.

<a id="ch-8-ravenel-bousfield-class"></a>
### Ravenel’s Bousfield class formula

**Target** `ChromaticHomotopyTheory:CH.8/ravenel-bousfield-class` (theorem · planet). For n≥0, ⟨BP[v_n⁻¹]⟩=⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩, with v₀=p. Moreover ⟨BP⟨n⟩⟩=⟨E(n)∨HF_p⟩ and ⟨k(n)⟩=⟨K(n)∨HF_p⟩ for n≥1. The formulas are statements of Bousfield classes, not equivalences of spectra.

**Direct inputs.** [Complex cobordism and Brown–Peterson theory](#ch-1-cobordism-p-typical), [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Use the BP quotient/localization sequences to separate consecutive heights.
2. Apply the regular-invariant-ideal base-change comparison and the distributive Bousfield-class calculation in Ravenel Theorem 2.1.
3. The regular-sequence realization and Landweber comparison are recorded in G6; algebraic coefficient identities alone do not prove the Bousfield equalities.

**Acceptance.**

- At n=0 the inverted BP class is rational, although BP[p⁻¹] has many rational homotopy groups.
- The HF_p summand is essential before v_n inversion.

**Sources.** [Rav84](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), Theorem 2.1(b),(d),(e),(f), pp.361–363. These give the v_n-inverted BP and truncated-theory Bousfield classes. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proof of Corollary 4.21, p.22. The formulas imply locality for uniformly bounded complex-oriented height.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8-height-locality"></a>
### Finite-height locality

**Target** `ChromaticHomotopyTheory:CH.8/height-locality` (theorem · planet). Let R be a p-local even-periodic oriented homotopy commutative ring with geometric height at most n at every point of Spec π₀R. Then R and every R-module are L_n-local. The graded variant assumes the explicit unit-ideal criterion (p,v₁,…,v_n)=π_*R. The pointwise condition in the even-periodic case implies that criterion after converting the coefficients to degree zero. These statements require a uniform finite bound; no bound is inferred merely from having a one-dimensional law.

**Direct inputs.** [Geometric height of an orientation](#ch-1-geometric-height), [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), [Complex orientations](#ch-1-complex-orientation).

**Construction/proof outline.**

1. Apply p-typicalization. Over π₀R the height condition makes the ideal of the degree-zero forms of p,v₁,…,v_n the unit ideal.
2. Each principal-open term is a unital module, at least in the homotopy category, over the relevant inverted BP ring. Its Bousfield class is bounded by E(n). For an E(n)-acyclic A, the free/cofree adjunction or the unital retract M→F(BP[v_i⁻¹],M)→M forces Map(A,M) to vanish. Thus the module is local; the conclusion is not inferred from a bound on the module’s Bousfield class alone.
3. The finite Čech diagram reconstructs R and each R-module. Local objects are closed under limits. Apply the same invariant-ideal argument in the graded variant; G6 records its proof-level comparison.

**Acceptance.**

- An even-periodic elliptic theory has bound two.
- The additive characteristic-p theory has infinite height and does not meet a finite bound.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proof of Corollary 4.21, p.22. A uniformly bounded complex-oriented height forces chromatic locality. [Beh19](https://arxiv.org/pdf/1901.07990), §1.6, pp.27–29. The height-at-most-n locus corresponds to E(n)-localization.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8-hopkins-ravenel"></a>
### Hopkins–Ravenel smashing theorem

**Target** `ChromaticHomotopyTheory:CH.8/hopkins-ravenel` (theorem · planet). For every n≥0, L_nX≃L_nS⊗X naturally, compatibly with the localization unit. In the L_n-local category, E_n generates the unit as a thick tensor ideal: the E_n-based cobar totalization tower is pro-constant with value L_nS. Here E_n is Morava E-theory at height n≥1; treat height zero rationally. The pro-constant statement has uniform finite-stage retraction content, stronger than mere convergence of a spectral sequence.

**Direct inputs.** [Finite chromatic localizations](#ch-4-finite-localizations), [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, [Morava E-theory](#ch-7-morava-e-theory).

**Construction/proof outline.**

1. Use the horizontal vanishing line in the E_n-local Adams–Novikov spectral sequence and Bousfield’s pro-constancy criterion.
2. A finite partial totalization then has the unit as a retract, making E_n descendable in the L_n-local category.
3. The horizontal vanishing and its construction are G7; no smashing conclusion is inferred just from the Bousfield-class definition.

**Acceptance.**

- The theorem is for L_n; it does not assert that L_(K(n)) is smashing on all spectra.
- A convergent tower need not be pro-constant, so convergence alone is insufficient.

**Sources.** [MM16](https://arxiv.org/pdf/1311.0514), Theorems 4.6–4.7 and Corollary 4.8, pp.26–27. The uniform vanishing line and pro-constant cobar tower supply the strong smash-product input. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proof of Corollary 4.21, p.22. The smashing theorem is used to kill lower chromatic local spectra by T(n).

**Open proof inputs.** [G7](#g7). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8-local-telescope-comparison"></a>
### Telescopes on chromatically local spectra

**Target** `ChromaticHomotopyTheory:CH.8/local-telescope-comparison` (comparison). For n≥1, every L_(n−1)-local spectrum is T(n)-acyclic. For every L_n-local X, the canonical comparison L_(T(n))X→L_(K(n))X is an equivalence. Both assertions require the stated chromatic locality and do not prove equality of the two localization functors on all spectra. The p-local chromatic level one agrees with KU_(p)-localization; globally L_KU detects all primes rather than a fixed-p tower.

**Direct inputs.** [Hopkins–Ravenel smashing theorem](#ch-8-hopkins-ravenel), [Telescope acyclicity criteria](#ch-3-telescope-properties), [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), `RefinedTraceMethods:RT.4:topological`, [Chromatic fracture squares](#ch-4-fracture-square), [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity).

**Construction/proof outline.**

1. By Hopkins–Ravenel smashing, every L_(n−1)-local X is L_(n−1)S⊗X. Ravenel orthogonality makes the ring L_(n−1)S K(n)-acyclic; ring acyclicity then makes it T(n)-acyclic, and smashing with X proves the first assertion. This uses the ring comparison on the localized sphere, not on an arbitrary module.
2. Apply the chromatic fracture square to L_n-local X; its lower piece is T(n)-acyclic and its height-n piece is detected by K(n).
3. At height one compare the p-local KU Bousfield class with E(1) and HQ∨K(1), importing complex Bott theory. The telescope comparison on L_n-local objects is included in G7 for proof expansion.

**Acceptance.**

- KU_(p) is L₁-local, but its p-completion must still be distinguished from global KU.
- An arbitrary T(n)-local spectrum at n≥2 need not be K(n)-local.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Proof of Corollary 4.21, p.22. The source restricts the K(n)/T(n) comparison to L_n-local inputs. [Beh19](https://arxiv.org/pdf/1901.07990), Proposition 1.6.8 and the chromatic fracture square, pp.28–29. The height-n formal neighborhood and lower-height open form the chromatic fracture square.

**Open proof inputs.** [G7](#g7). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8-telescope-separation"></a>
### Separation above height one

**Target** `ChromaticHomotopyTheory:CH.8/telescope-separation` (theorem · planet). At height one and every prime, the Bousfield classes of T(1) and K(1) agree. At every prime and every height n≥2, there exists a T(n)-local spectrum which is not K(n)-local. Thus a general-spectrum identification of the two theories is false. This node records the exact boundary on all comparisons; its higher-height proof uses algebraic K-theory and is a separately recorded gap, not a prerequisite of the ring acyclicity theorem.

**Direct inputs.** [Telescopes on chromatically local spectra](#ch-8-local-telescope-comparison), [Telescopes](#ch-3-telescope), [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra).

**Construction/proof outline.**

1. For height one use the localized Adams computations of Miller at odd primes and Mahowald at two, quoted in BHLS.
2. For higher height use BHLS Theorem A with its T(n)-localized K-theory counterexample; its K-theoretic construction and cyclotomic non-hyperdescent proof are G8.
3. No counterexample object is defined here by an arbitrary spectrum or a formal axiom.

**Acceptance.**

- The equality at height one is not described as an open conjecture.
- The higher-height failure does not contradict the acyclicity criterion for unital rings.

**Sources.** [BHLS23](https://arxiv.org/pdf/2310.17459v1), Introduction, Theorem A, pp.2–4. The theorem separates the local categories at every prime and every height at least two; the introduction recalls the height-one theorem.

**Open proof inputs.** [G8](#g8). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-8-truncation-support"></a>
### Chromatic support of BP truncations

**Target** `ChromaticHomotopyTheory:CH.8/truncation-support` (comparison). For n≥0 and i>n, BP⟨n⟩ is K(i)-acyclic and T(i)-acyclic. For n≥1 the map BP⟨n⟩→E(n) is a T(n)-equivalence, and is also a T(i)-equivalence for i>n because both objects are acyclic there. It is not an L_n^f-equivalence in general: the rational homotopy of BP⟨n⟩ is connective, whereas E(n) has negative rational classes for n≥1.

**Direct inputs.** [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), [Telescope acyclicity criteria](#ch-3-telescope-properties), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences).

**Construction/proof outline.**

1. Smash Ravenel’s class formula ⟨BP⟨n⟩⟩=⟨E(n)∨HF_p⟩ with T(i), i>n. The class of E(n) is the join of K(0),…,K(n), and each of those, as well as HF_p, annihilates T(i) by telescope orthogonality. This proves the T(i)-vanishing without choosing a ring structure on BP⟨n⟩; the K(i)-vanishing follows from the same class formula.
2. The successive v_n-cofibers are shifts of BP⟨n−1⟩. They are T(n)-acyclic, so the sequential inversion map is a T(n)-equivalence.
3. At n=1, rationalization preserves the distinction between the connective polynomial coefficient ring and its Laurent localization, disproving the stronger routed assertion.

**Acceptance.**

- For n=1 the inversion map is a T(1)-equivalence but fails to be a rational equivalence.
- For n=0, BP⟨0⟩=HZ_(p) has no positive finite-height support.

**Sources.** [Rav84](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), Theorem 2.1(d)–(f), pp.361–363. The truncation and inverted-theory Bousfield classes give the asserted support. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.12 and Remark 4.13, p.20. The source asserts the higher-height K-theory comparison; it does not identify E(n) with L_n^fBP⟨n⟩.

**Open proof inputs.** [G6](#g6). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-9"></a>
## CH.9. Norms, Tate spectra and blueshift

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.5`, `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6`.

<a id="ch-9-norm-tate"></a>
### Localized norms and Tate spectra

**Target** `ChromaticHomotopyTheory:CH.9/norm-tate` (comparison). Import coherent finite-group orbits, fixed points, the normalized norm, its Tate cofiber, and the lax symmetric monoidal Tate functor from RefinedTraceMethods RT.2. For an E-local spectrum X with coherent G-action, the norm in Sp_E is L_E(X_hG)→X^hG, and its cofiber is L_E(X^tG). The fixed points are already E-local because local objects are closed under limits. The imported Tate module structure is compatible with this comparison. This node owns only the passage to the homological localization.

**Direct inputs.** `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`, `RefinedTraceMethods:RT.2/norm-map-tate`, `RefinedTraceMethods:RT.2/tate-multiplicativity`, [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Compute colimits in Sp_E by applying L_E to ambient colimits, and limits by the fully faithful inclusion.
2. Apply the exact functor L_E to the imported norm cofiber sequence; identify its target with X^hG.
3. Transport the imported multiplicative and module structures through the symmetric monoidal localization.

**Acceptance.**

- For G trivial both localized norm and ambient norm are identities.
- For rational-local inputs, averaging by |G| gives norm equivalence.

**Sources.** [CM17](https://arxiv.org/pdf/1608.02063v2), Definition 2.2 and Proposition 2.3, pp.2–3. These distinguish the raw Tate cofiber from the norm cofiber in a homologically localized category.

<a id="ch-9-transfer-splitting"></a>
### Localized transfer splitting

**Target** `ChromaticHomotopyTheory:CH.9/transfer-splitting` (theorem · planet). For a homological localization L and finite G, these are equivalent: every G-object in LSp has norm equivalence; L((LS)^tG)=0 for the trivial action on LS; the transfer Σ∞_+BG→S admits a section after L. If these properties hold for prime-order groups they hold for every finite group. The transfer Σ∞_+BC_p→S admits a section after Ω^(∞+1), by Kahn–Priddy in its cyclic-group form.

**Direct inputs.** [Localized norms and Tate spectra](#ch-9-norm-tate), [Homological Bousfield localization](#ch-0-homological-localization), [Bousfield–Kuhn functor](#ch-5-bousfield-kuhn).

**Construction/proof outline.**

1. Reduce arbitrary X to the Tate algebra of the local sphere via its module structure.
2. A transfer section produces an element whose norm restricts to 1 at the basepoint; the unit criterion in multiplicative cohomology of connected spaces makes it a unit.
3. Use the prime-order reduction through subgroup transfers and induction. The unstable Kahn–Priddy section and this finite-group reduction have statement-level sources but unexpanded proofs in G11.

**Acceptance.**

- The map is the transfer, not the augmentation whose section exists trivially.
- For rational localization the section follows by dividing by |G|.

**Sources.** [CM17](https://arxiv.org/pdf/1608.02063v2), Lemma 2.1, Proposition 2.3, Lemma 2.4 and Theorem 2.5, pp.2–3. These are the transfer and unit criteria used in the short proof of Tate vanishing.

**Open proof inputs.** [G11](#g11). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-9-kuhn-tate-vanishing"></a>
### Kuhn’s telescopic Tate vanishing

**Target** `ChromaticHomotopyTheory:CH.9/kuhn-tate-vanishing` (theorem · planet). For n≥1, every finite group G and every T(n)-local spectrum X with coherent G-action, L_(T(n))(X^tG)=0. Equivalently L_(T(n))(X_hG)→X^hG is an equivalence. In particular the norm sequence becomes split after T(n)-localization. A raw Tate spectrum of a T(n)-local object need not vanish.

**Direct inputs.** [Localized transfer splitting](#ch-9-transfer-splitting), [Bousfield–Kuhn functor](#ch-5-bousfield-kuhn), [Localized norms and Tate spectra](#ch-9-norm-tate).

**Construction/proof outline.**

1. Apply the Bousfield–Kuhn functor, with one suspension shift as required, to the unstable Kahn–Priddy section.
2. Obtain a localized stable transfer section at every prime-order group, then use the transfer criterion and finite-group reduction.
3. Use the local-category cofiber convention to state the conclusion; raw Tate vanishing is not inferred.

**Acceptance.**

- At height zero in a p-local rational category norm equivalence is elementary averaging.
- For X=KU_p^∧ and G=C_p with trivial action, raw Tate can be nonzero while its T(1)-localization vanishes.

**Sources.** [CM17](https://arxiv.org/pdf/1608.02063v2), Theorem 2.6 and Corollary 2.7, pp.3–4. A Bousfield–Kuhn factorization forces finite-group Tate vanishing inside the local category. [Kuhn04](https://arxiv.org/pdf/math/0307173), Theorem 1.5 and Corollary 1.7, manuscript pp.4–5. The result gives localized norm equivalences and splittings.

**Open proof inputs.** [G11](#g11). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-9-finite-blueshift"></a>
### Finite-local Tate blueshift

**Target** `ChromaticHomotopyTheory:CH.9/finite-blueshift` (theorem · planet). For n≥1, if X is L_n^(p,f)-local with a coherent C_p-action, then its raw Tate spectrum X^tC_p is L_(n−1)^(p,f)-local. The p-local HQ finite convention satisfies the corresponding statement. This lowers the upper finite-height bound by one and permits a further drop; it asserts neither zero Tate nor exact height n−1 for every X.

**Direct inputs.** [Kuhn’s telescopic Tate vanishing](#ch-9-kuhn-tate-vanishing), [Finite localization kernels](#ch-4-finite-kernel-smashing), [Localized norms and Tate spectra](#ch-9-norm-tate), [Finite chromatic localizations](#ch-4-finite-localizations).

**Construction/proof outline.**

1. Tensor with finite type-n spectra, which commutes with the finite-group Tate construction by dualizability.
2. Use telescope Tate vanishing for the periodic pieces and the cofiber/telescope Bousfield decompositions to identify the lower finite-local output.
3. The passage from localized Tate vanishing to actual lower-locality, with arbitrary coherent action, is the exact proof obligation G12; it is stated explicitly in CMNN’s introduction and used in LMMT Remark 3.9.

**Acceptance.**

- An input of lower height is permitted; exact height loss is not guaranteed.
- The n=1 output is p-inverted, or rational when the input is p-local.

**Sources.** [CMNN22](https://arxiv.org/pdf/2011.08233), Introduction preceding Theorem C, p.3; proof of Theorem 4.10, p.21. An L_n^(p,f)-local spectrum has L_(n−1)^(p,f)-local C_p Tate spectrum. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Remark 3.9, p.16. The Tate of the finite-local sphere acts through the next lower finite localization.

**Open proof inputs.** [G12](#g12). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-9-nonzero-tate-examples"></a>
### Nonzero raw Tate spectra

**Target** `ChromaticHomotopyTheory:CH.9/nonzero-tate-examples` (application). For the trivial C_p-action on p-complete complex K-theory, π₀((KU_p^∧)^tC_p)≅Q_p(ζ_p), including Q₂ at p=2. This is nonzero, whereas its T(1)-localization vanishes. For contrast request from RT.2 the Segal comparison mentioned in its tate-p-local-properties acceptance example: the trivial-action sphere Tate spectrum is the p-complete sphere, so a raw-sphere example cannot be substituted for a T(n)-local input in Kuhn’s theorem.

**Direct inputs.** [Localized norms and Tate spectra](#ch-9-norm-tate), `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6/p-completion`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, [Kuhn’s telescopic Tate vanishing](#ch-9-kuhn-tate-vanishing), `RefinedTraceMethods:RT.2`.

**Construction/proof outline.**

1. Use the completed complex orientation to calculate KU⁰(BC_p)=Z_p[[z]]/((1+z)^p−1). The Tate comparison inverts the Euler class z.
2. After inverting z, the remaining cyclotomic quotient is Z_p[ζ_p][1/(ζ_p−1)]=Q_p(ζ_p). The precise Euler-inversion comparison, not proved by the cited remark alone, is G13.
3. Use the requested K(1)-locality of KU_p^∧, and hence its T(1)-locality at height one, before applying Kuhn’s theorem. The separate sphere Segal comparison is requested explicitly from RT.2; its existing acceptance example is not a supplied proof.

**Acceptance.**

- At p=2 the displayed field is nonzero.
- After T(1)-localization the KU example vanishes, agreeing with Kuhn’s theorem.

**Sources.** [CM17](https://arxiv.org/pdf/1608.02063v2), Remark 2.8, p.4. The source gives nonvanishing raw E-theory Tate as the warning; the displayed KU coefficient computation requires G13. Used with the imported RT.2 sphere comparison.

**Open proof inputs.** [G13](#g13). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-10"></a>
## CH.10. Commutative rings and chromatic height

**Stage inputs.** `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.2`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.7`, `ChromaticHomotopyTheory:CH.9`, `EnhancedDerivedSheaves:E5:abstract`.

<a id="ch-10-morava-power-operations"></a>
### Morava power operations

**Target** `ChromaticHomotopyTheory:CH.10/morava-power-operations` (construction · planet). For height-(h+1) Morava E-theory E with π₀E=W(F_(p^(h+1)))[[u₁,…,u_h]] and a K(h+1)-local E∞ E-algebra R, construct the weight-p operation P:π₀R→R⁰(BC_p). It is multiplicative and unital, and becomes additive after quotienting by the transfer. The transfer generator in E⁰(BC_p)=E₀[[z]]/([p](z)) is [p](z)/z. For 1≤k<h, after reducing by I_(k+1)=(p,u₁,…,u_k), define g_(k+1) by [p](z)=z^(p^(k+1))g_(k+1)(z). If x maps to zero in π₀ of the iterated module quotient R/(p,u₁,…,u_k), then P(x) maps to zero in π₀ of R^BC_p/(p,u₁,…,u_k,g_(k+1)). These are module cofibers; no identification with ordinary ring quotients for arbitrary R is assumed. For R=E the regular coefficient case gives the quotient ring operation used in the valuation calculation. The k=0 Bockstein case is an explicit part of G14, rather than attributed to the printed k≥1 theorem.

**Direct inputs.** [Morava E-theory](#ch-7-morava-e-theory), [Localized norms and Tate spectra](#ch-9-norm-tate), [Geometric height of an orientation](#ch-1-geometric-height), `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Construction/proof outline.**

1. Apply the E∞ multiplication to extended p-th powers and the diagonal class.
2. Identify the transfer ideal using the complex orientation and the p-series.
3. Apply Hahn Theorem 3.3 to iterated module cofibers. Its Bockstein power admits an equivariant section after the specified g quotient; hence zero classes have zero image. Specialize to E for the regular coefficient ring operation. The k=0 extension is retained separately in G14.

**Uses.** Hahn §4: A valuation-lowering argument kills the unit in a chromatically acyclic local algebra. CH.10 height theorem: The operation prevents a nonzero local E∞ algebra from having a gap immediately below its top height.

**API.**

- `Chromatic.morava_power_operations.operation` (data): A class x induces the weight-p extended-power class P(x).
- `Chromatic.morava_power_operations.multiplicative` (structure): P preserves unit and multiplication.
- `Chromatic.morava_power_operations.modTransfer` (relation): The image of P is additive modulo the transfer ideal.
- `Chromatic.morava_power_operations.invariantQuotient` (compatibility): The quotient operation has the module-cofiber zero-detection property just stated. In the regular even coefficient case it gives the corresponding ring quotient operation; compatibility with the chosen Morava coordinate is explicit.

**Checks.**

- `Chromatic.morava_power_operations.check_1` (computation): P(1)=1 and P(xy)=P(x)P(y).
- `Chromatic.morava_power_operations.check_2` (non-example): Additivity is required only after quotienting by the transfer, so P(x+y)=P(x)+P(y) is not imposed in the original target.
- `Chromatic.morava_power_operations.check_3` (non-example): The quotient [p](z)/z^(p^(k+1)) is formed only after reducing by I_(k+1), not as an integral power series in the original ring.

**Sources.** [Hahn22](https://arxiv.org/pdf/1612.04386), §2, pp.3–4; Theorem 1.6, p.2; Theorem 3.3, p.5 and proof pp.7–8; Definition 4.1, p.8. The weight-p operation is multiplicative and becomes additive after the transfer quotient; the invariant-ideal divisibility is essential.

**Open proof inputs.** [G14](#g14). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-10-hahn-acyclicity"></a>
### Hahn’s acyclicity theorem

**Target** `ChromaticHomotopyTheory:CH.10/hahn-acyclicity` (theorem · planet). For an E∞ ring spectrum R and h≥0, K(h)⊗R=0 implies K(h+1)⊗R=0. Consequently T(h)⊗R=0 implies T(h+1)⊗R=0 for h≥0, with T(0)=S[1/p]. For h≥1 translate by the ring-spectrum comparison; at h=0 use S[1/p]-acyclicity⇒HQ-acyclicity, not the false equality of these acyclic classes on all spectra.

**Direct inputs.** [Morava power operations](#ch-10-morava-power-operations), [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity), [Morava E-theory](#ch-7-morava-e-theory), [Nilpotence theorem](#ch-2-nilpotence).

**Construction/proof outline.**

1. Reduce to a K(h+1)-local E-algebra. K(h)-acyclicity forces a power of u_h to vanish modulo (p,u₁,…,u_(h−1)).
2. Use the quotient operation and the Weierstrass/Eisenstein valuation calculation to lower the exponent until the unit vanishes. Completeness and K(h+1)-locality then force R=0.
3. For h=0 use the May-nilpotence case, retained in G14 with the other power-operation inputs.

**Acceptance.**

- The theorem cannot be extended to an arbitrary E₁ ring by omitting power operations.
- The h=0 implication is valid for HF_p, which is nonzero but acyclic at all finite Morava heights.

**Sources.** [Hahn22](https://arxiv.org/pdf/1612.04386), Theorems 1.1 and 1.3, p.1; §4, Propositions 4.2–4.5 and Theorem 4.6, pp.8–10. The theorem gives monotonic chromatic acyclicity for E∞ rings and is proved by the valuation-decreasing operation.

**Open proof inputs.** [G14](#g14). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-10-ring-chromatic-height"></a>
### Chromatic height of a commutative ring

**Target** `ChromaticHomotopyTheory:CH.10/ring-chromatic-height` (definition · planet). For an E∞ ring R define ht_p(R)=inf{n∈Z | n≥−1 and T(n+1)⊗R=0}, valued in {−1,0,1,…,∞}; an empty set has infimum ∞. Hahn’s theorem makes the vanishing heights an upper interval. This definition uses T(0)=S[1/p] at the bottom, even for a ring not p-local; it differs from geometric height of an oriented formal group.

**Direct inputs.** [Hahn’s acyclicity theorem](#ch-10-hahn-acyclicity), [Telescopes](#ch-3-telescope).

**Construction/proof outline.**

1. Use the well-order of integers at least −1 and the upward-closed vanishing set.
2. Obtain threshold characterizations and monotonicity under E∞ maps from the induced module action.

**Uses.** LMMT introductory height convention: States height bounds on rings entering purity and redshift. CMNN Theorem 4.6: A Tate hypothesis bounds all higher chromatic heights.

**API.**

- `Chromatic.ring_chromatic_height.le_iff` (characterisation): For n≥−1, ht_p(R)≤n iff T(n+1)⊗R=0.
- `Chromatic.ring_chromatic_height.mapMonotone` (functoriality): An E∞ map R→S implies ht_p(S)≤ht_p(R).
- `Chromatic.ring_chromatic_height.infinite_iff` (characterisation): The height is ∞ iff every finite-height telescope has nonzero tensor with R.
- `Chromatic.ring_chromatic_height.bottom` (example): Height −1 is T(0)-acyclicity, not a criterion that R itself is zero.

**Checks.**

- `Chromatic.ring_chromatic_height.check_1` (computation): ht_p(HF_p)=−1 despite HF_p≠0.
- `Chromatic.ring_chromatic_height.check_2` (computation): ht_p(HQ)=0.
- `Chromatic.ring_chromatic_height.check_3` (computation): For q≠p, ht_p(HF_q)=0 with this all-spectra convention, although its p-localization is zero.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Introduction, chromatic height discussion, pp.3–4. The height convention starts at −1 and uses telescopic acyclicity. [Hahn22](https://arxiv.org/pdf/1612.04386), Theorem 1.1, p.1. Upward acyclicity makes the threshold meaningful.

<a id="ch-10-tate-height-converse"></a>
### Tate height converse

**Target** `ChromaticHomotopyTheory:CH.10/tate-height-converse` (theorem · planet). For an E∞ ring R with trivial C_p-action and i≥0, if L_(T(i))(R^tC_p)=0 then L_(T(j))R=0 for every j≥i+1. In particular T(i)-acyclicity of the trivial-action Tate spectrum forces T(i+1)-acyclicity of R. The action and coherent commutative structure are part of the hypotheses; no claim is made for an arbitrary group action on an arbitrary spectrum.

**Direct inputs.** [Localized norms and Tate spectra](#ch-9-norm-tate), [Hahn’s acyclicity theorem](#ch-10-hahn-acyclicity), [Morava E-theory](#ch-7-morava-e-theory), [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity), [Morava power operations](#ch-10-morava-power-operations).

**Construction/proof outline.**

1. Reduce to the K(i+1)-local E-algebra case. The trivial-action fixed-point algebra is finite free over the coefficient ring before the Euler-class localization.
2. Use the faithfully flat residue-field Laurent-series extension in the Tate calculation to reflect K(i)-acyclicity from the Tate algebra to R.
3. Apply Hahn for the next height and then iterate. Keep the exact faithful-flat coefficient and base-change lemma in G14 until expanded.

**Acceptance.**

- The conclusion begins one height above i.
- The hypothesis concerns the raw Tate spectrum followed by T(i)-localization.

**Sources.** [CMNN22](https://arxiv.org/pdf/2011.08233), Theorem 4.6 and Lemma 4.7, pp.19–20. The public edition states vanishing at every height j≥i+1; this is the result cited under older numbering in LMMT. [Hahn22](https://arxiv.org/pdf/1612.04386), Corollary 4.6.1 and Proposition 4.7, pp.9–10. The local trivial-action comparison yields the converse.

**Open proof inputs.** [G14](#g14). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-11"></a>
## CH.11. Real topological K-theory

**Stage inputs.** `ChromaticHomotopyTheory:CH.3`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

<a id="ch-11-real-k-theory"></a>
### Real topological K-theory

**Target** `ChromaticHomotopyTheory:CH.11/real-k-theory` (construction · planet). Construct periodic real K-theory KO from stable real vector bundles with the coherent direct-sum and tensor-product structures. Its zeroth infinite loop space is Z×BO. Use the real Bott class β∈π₈KO to make KO eight-periodic, and set ko=τ_≥0KO with its E∞ ring structure. The class β has its unique connective lift in π₈ko, and ko[β⁻¹]≃KO as E∞ rings. The complex theories ku and KU are the RT.4 input.

**Direct inputs.** `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `RefinedTraceMethods:RT.4:topological`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `StableHomotopyKTheory:H.4/group-completion-adjunction`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Construction/proof outline.**

1. Apply the group-completion machine of H.4 to the permutative category of real vector spaces and bundles, then the spectrum recognition comparison requested from H.5.
2. Supply real Bott periodicity as a separate proof input. ABS uses this theorem to identify real K-theory coefficients via Clifford modules; it is not cited as an independent proof of Bott periodicity.
3. Take the connective cover in commutative ring spectra; β inversion recovers all homotopy groups. The real Bott proof and coherent recognition input are recorded in G15.

**Uses.** LMMT Corollary 4.19: Supplies Bott inversion for arbitrary ko-algebras. CH.11 coefficient test: Distinguishes real and complex periodicity at the prime two.

**API.**

- `Chromatic.real_k_theory.connectiveCover` (projection): ko→KO is an isomorphism on π_i for i≥0, and ko has no negative homotopy groups.
- `Chromatic.real_k_theory.bott` (data): β∈π₈ko maps to the invertible real Bott class in KO.
- `Chromatic.real_k_theory.invertBott` (equivalence): The E∞ localization ko[β⁻¹] is KO.
- `Chromatic.real_k_theory.complexification` (functoriality): Complexification ko→ku and KO→KU preserve ring products; β maps to the fourth power of the complex Bott class under the standard sign normalization.

**Checks.**

- `Chromatic.real_k_theory.check_1` (computation): π₀ko=π₀KO=Z, with rank giving the coefficient identification.
- `Chromatic.real_k_theory.check_2` (non-example): π₁ko=π₂ko=Z/2 and π₃ko=0; replacing ko by complex ku fails this test.
- `Chromatic.real_k_theory.check_3` (computation): β has degree eight, while the imported complex Bott class has degree two.

**Sources.** [ABS64](https://www.math.ens.psl.eu/~benoist/refs/ABS.pdf), Proposition 6.8, Theorems 6.9 and 11.5, pp.15–16,28–29. The real Clifford module calculation identifies the degree-eight periodicity and real coefficient ring. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.19 and proof, p.21. The purity application needs ko[β⁻¹]=KO.

**Open proof inputs.** [G15](#g15). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-11-real-coefficients"></a>
### Real Bott coefficients

**Target** `ChromaticHomotopyTheory:CH.11/real-coefficients` (theorem · planet). The nonnegative coefficient ring of ko is Z[η,α,β]/(2η,η³,ηα,α²−4β), with |η|=1, |α|=4, |β|=8. The coefficient ring of KO inverts β. For every prime and n≥1, ko→KO is a T(n)-equivalence, as is A→A[β⁻¹] for any ko-algebra A. This is a statement about the input spectra; the resulting algebraic K-theory purity belongs to the K-theory consumer.

**Direct inputs.** [Real topological K-theory](#ch-11-real-k-theory), [Telescope acyclicity criteria](#ch-3-telescope-properties).

**Construction/proof outline.**

1. Use the real Clifford-module ring calculation and Bott periodicity.
2. The connective cover map has bounded-above fiber, so positive-height periodic homotopy is unchanged.
3. Tensor the β-inversion map over ko with the ko-algebra A and use smashing with T(n).

**Acceptance.**

- At degree four the relation is α²=4β, not α²=β.
- The connective-cover assertion uses n≥1; rationalization detects the negative KO groups.

**Sources.** [ABS64](https://www.math.ens.psl.eu/~benoist/refs/ABS.pdf), Theorems 6.9 and 11.5, pp.15–16,28–29. The coefficient generators and their multiplicative relations are determined by Clifford modules. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.19 proof, p.21. The ko-to-KO map is a positive-height telescope equivalence.

**Open proof inputs.** [G15](#g15). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12"></a>
## CH.12. Topological modular forms

**Stage inputs.** `ChromaticHomotopyTheory:CH.0`, `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.7`, `ChromaticHomotopyTheory:CH.8`, `ChromaticHomotopyTheory:CH.9`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

<a id="ch-12-elliptic-cohomology"></a>
### Elliptic cohomology theories

**Target** `ChromaticHomotopyTheory:CH.12/elliptic-cohomology` (definition · planet). An elliptic cohomology theory is a triple (E,C,a) consisting of an even-periodic E∞ ring E, a smooth elliptic curve C over π₀E with trivialized cotangent line when a coordinate is chosen, and an isomorphism a between the associated oriented formal group and the completion of C at the identity. A coordinate is auxiliary; changing its trivialization transports the formal law by an LT.0 isomorphism. For a Weierstrass presentation the completed law is the existing WeierstrassCurve.formalGroup, hence its series is the reindexed formalAdd.

**Direct inputs.** [Complex orientations](#ch-1-complex-orientation), [Geometric height of an orientation](#ch-1-geometric-height), `tauceti:WeierstrassCurve.formalGroup`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/elliptic-deformation-comparison`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`.

**Construction/proof outline.**

1. Use the existing elliptic-curve and formal-group carriers and record the comparison isomorphism as part of the triple.
2. For affine even-periodic realizations apply the Landweber criterion; E∞ coherence is supplied only by the Otop realization theorem.

**Uses.** CH.12 Otop: Affine smooth sections realize the classified elliptic curve. LMMT Corollary 4.21: The finite formal-height bound gives L₂-locality.

**API.**

- `Chromatic.elliptic_cohomology.formalComparison` (data): The isomorphism a identifies the two formal groups under the orientation.
- `Chromatic.elliptic_cohomology.coordinateChange` (functoriality): Changing either coordinate transports a by the imported formal-group isomorphism.
- `Chromatic.elliptic_cohomology.evenCoefficients` (compatibility): π_(2r)E is the r-th tensor power of the cotangent line in cohomological degree −2; the chosen homological grading is kept explicit.
- `Chromatic.elliptic_cohomology.weierstrass` (compatibility): For a Weierstrass model, the comparison uses the baseline formalGroup and its formalAdd equation.

**Checks.**

- `Chromatic.elliptic_cohomology.check_1` (computation): An ordinary geometric fiber has formal height one.
- `Chromatic.elliptic_cohomology.check_2` (computation): A supersingular fiber has formal height two by ModularCurves 7E.
- `Chromatic.elliptic_cohomology.check_3` (non-example): An even-periodic ring with additive characteristic-p law cannot be elliptic cohomology of a smooth elliptic curve.

**Sources.** [Beh19](https://arxiv.org/pdf/1901.07990), Definition 1.2.11, Remark 1.2.12 and Corollary 1.2.15, p.7. The formal-group comparison is part of elliptic cohomology, with the cotangent grading fixing periodicity. The present definition asks for the coherent E∞ refinement; the source’s basic elliptic theory is homotopy commutative and does not itself supply that refinement.

<a id="ch-12-topological-structure-sheaf"></a>
### Topological structure sheaf

**Target** `ChromaticHomotopyTheory:CH.12/topological-structure-sheaf` (construction · planet). Let M̄_ell be the Deligne–Mumford stack of stable one-pointed genus-one curves with irreducible geometric fibers: smooth elliptic curves or nodal one-gons. On its étale site, construct the Goerss–Hopkins–Miller–Lurie sheaf Otop of E∞ rings. Its homotopy sheaves are π_(2r)Otop≅ω^⊗r and π_(2r+1)Otop=0. On an étale affine with a trivialization of ω the section ring is even-periodic and its formal group is the curve’s completed formal group; at the nodal boundary use the generalized elliptic formal group, of height one. The sheaf satisfies coherent étale descent; global sections may have odd and negative homotopy groups. Its algebraic generalized-elliptic boundary and the spectral sheaf/module carriers are explicit missing supplier inputs G16a–G16b; they are not supplied by the coarse compactification in the current ModularCurves roadmap.

**Direct inputs.** [Elliptic cohomology theories](#ch-12-elliptic-cohomology), [Morava E-theory](#ch-7-morava-e-theory), `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`.

**Construction/proof outline.**

1. Import the smooth Weierstrass groupoid from ModularCurves 4B. Supply the stable one-pointed compactification with irreducible fibers from the proposed ModularCurves Part II, recorded as G16a. It includes nodal one-gons, not every Néron polygon; the current coarse compactification does not suffice.
2. Realize its p-divisible deformation neighborhoods by local Hopkins–Miller theory, and glue the ordinary and rational pieces with the required power-operation compatibility.
3. The coherent realization and integral gluing theorem is G16; even homotopy sheaves alone are not a construction of an E∞ sheaf.

**Uses.** LMMT Corollary 4.21: Defines Tmf and TMF and their height-two localizations. Mathew–Meier Theorems 7.2 and 7.6: The spectral refinement supplies module descent and level-structure Galois extensions.

**API.**

- `Chromatic.topological_structure_sheaf.sections` (data): Every étale object has its E∞ section ring, with coherent restriction maps.
- `Chromatic.topological_structure_sheaf.descent` (universal-property): Sections on an étale cover are the totalization of its Čech diagram.
- `Chromatic.topological_structure_sheaf.homotopySheaves` (characterisation): The displayed ω powers identify the local even homotopy sheaves.
- `Chromatic.topological_structure_sheaf.formalGroup` (compatibility): On a trivialized affine chart its formal group agrees with the imported generalized elliptic completion.

**Checks.**

- `Chromatic.topological_structure_sheaf.check_1` (computation): The smooth affine restriction yields the elliptic cohomology triple, including its formal comparison.
- `Chromatic.topological_structure_sheaf.check_2` (computation): The nodal boundary is retained on M̄_ell but excluded on M_ell.
- `Chromatic.topological_structure_sheaf.check_3` (non-example): Even homotopy sheaves do not force Tmf to have no odd homotopy, because higher étale cohomology contributes.

**Sources.** [Goe10](https://numdam.org/item/AST_2010__332__221_0.pdf), Theorem 1.2, pp.224–225. The compactified spectral enhancement has the stated even homotopy sheaves. [MM16](https://arxiv.org/pdf/1311.0514), Theorem 7.1, p.35. The compactified stack carries the even-periodic refinement used for affineness.

**Open proof inputs.** [G16a](#g16a), [G16b](#g16b), [G16](#g16). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-modular-form-spectra"></a>
### Topological modular forms

**Target** `ChromaticHomotopyTheory:CH.12/modular-form-spectra` (construction · planet). Set Tmf=Γ(M̄_ell,Otop), tmf=τ_≥0Tmf and TMF=Γ(M_ell,Otop). These are E∞ rings with natural maps tmf→Tmf→TMF. The first map is the multiplicative connective-cover map; the second is restriction from the generalized-elliptic compactification to its smooth open. Global odd homotopy is permitted. Discriminant inversion is the separate comparison below.

**Direct inputs.** [Topological structure sheaf](#ch-12-topological-structure-sheaf), `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Take derived global sections and the multiplicative connective cover.
2. Restrict to the smooth open where the modular discriminant is invertible.

**Uses.** LMMT Corollary 4.21(ii),(iii): The connective and smooth-open maps are the input chromatic equivalences. CH.12 Galois level three: The periodic spectrum carries the finite étale level extension.

**API.**

- `Chromatic.modular_form_spectra.connectiveCover` (projection): tmf→Tmf induces isomorphisms in nonnegative homotopy degrees.
- `Chromatic.modular_form_spectra.openRestriction` (functoriality): Tmf→TMF is induced by the smooth-open inclusion.
- `Chromatic.modular_form_spectra.smoothOpen` (compatibility): Restriction of the underlying étale section diagram agrees with the smooth-open inclusion of the algebraic moduli groupoid.
- `Chromatic.modular_form_spectra.baseChange` (compatibility): Prime localization of the three spectra agrees with the corresponding base-localized étale section construction when justified by the affineness comparison.

**Checks.**

- `Chromatic.modular_form_spectra.check_1` (non-example): tmf has no negative homotopy groups by construction.
- `Chromatic.modular_form_spectra.check_2` (computation): Tmf uses the compactified stack, whereas TMF discards the nodal boundary.
- `Chromatic.modular_form_spectra.check_3` (non-example): At primes two and three no degree-24 Bott class is assumed solely from the algebraic modular form Δ.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), §4.3 preceding Corollary 4.21, p.22. The three spectra are distinguished by compactification and connective cover. [Beh19](https://arxiv.org/pdf/1901.07990), §1.3, pp.9–13; §1.6, pp.31–32. The sheaf and chromatic descriptions distinguish connective, compactified and periodic theories.

**Open proof inputs.** [G16a](#g16a). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-spectral-affineness"></a>
### Affineness of elliptic spectral geometry

**Target** `ChromaticHomotopyTheory:CH.12/spectral-affineness` (theorem · planet). For X=M̄_ell or M_ell equipped with Otop, global sections give a symmetric monoidal equivalence QCoh(X,Otop)≃Mod_(Γ(X,Otop)). In particular Γ on these quasicoherent spectral modules preserves all colimits. Tensoring a fixed spectrum V with a quasicoherent Otop-module is quasicoherent, and V⊗Γ(M)≃Γ(V⊗M). This theorem is specific to these spectral stacks; it is not ordinary affineness of the underlying algebraic moduli stack.

**Direct inputs.** [Topological structure sheaf](#ch-12-topological-structure-sheaf), [Topological modular forms](#ch-12-modular-form-spectra), `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

**Construction/proof outline.**

1. Apply Mathew–Meier’s 0-affineness theorem to the compactified and uncompactified elliptic spectral refinements.
2. Identify the inverse as tensoring the global module with Otop; the equivalence preserves all colimits and tensor products.
3. The 0-affineness proof is G17; the definition and descent category of quasicoherent spectral modules is the missing general supplier input G16b, not the ordinary derived sheaf category of EDS E1.

**Acceptance.**

- T(2)⊗Tmf≃Γ(T(2)⊗Otop) follows for this quasicoherent module.
- The same conclusion is not inferred for an arbitrary sheaf of spectra.

**Sources.** [MM16](https://arxiv.org/pdf/1311.0514), Theorem 7.2, pp.35–37. Both Tmf and TMF give module-category equivalences, hence global sections preserve colimits. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.21 proof, p.22. This is the needed permission to pass T(2) through global sections.

**Open proof inputs.** [G16a](#g16a), [G16b](#g16b), [G17](#g17). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-modular-chromatic-comparison"></a>
### Chromatic bounds for modular forms

**Target** `ChromaticHomotopyTheory:CH.12/modular-chromatic-comparison` (comparison). For each prime, Tmf_(p) and TMF_(p) are L₂-local. The maps tmf→Tmf are T(n)-equivalences for all n≥1, both spectra are T(n)-acyclic for n≥3, and Tmf→TMF is a T(2)-equivalence. Consequently tmf→TMF→L_(K(2))TMF are T(2)-equivalences. These statements concern the input spectra; their algebraic K-theory consequences stay with the purity consumer.

**Direct inputs.** [Topological modular forms](#ch-12-modular-form-spectra), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness), [Finite-height locality](#ch-8-height-locality), [Telescopes on chromatically local spectra](#ch-8-local-telescope-comparison), [Telescope acyclicity criteria](#ch-3-telescope-properties), `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, [Discriminant localization](#ch-12-discriminant-localization).

**Construction/proof outline.**

1. On each affine chart the formal group has geometric height at most two, including the height-one nodal boundary; apply finite-height locality and take the descent limit.
2. Use connective-cover invariance at positive heights.
3. For Tmf→TMF commute T(2) with global sections by affineness. Height-two support lies in the smooth open, so Δ inversion is already an equivalence on T(2)-localized sections.
4. Apply the comparison between T(2) and K(2) on L₂-local spectra. The support-to-discriminant argument is retained in G17 until expanded at the chart level.

**Acceptance.**

- The T(2)-equivalence is not a claim that Tmf and TMF are equivalent spectra.
- There is no assertion that the connective tmf spectrum itself is L₂-local.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.21 proof, p.22. The height bound, colimit-preserving global sections and smooth height-two locus give the required comparisons. [Beh19](https://arxiv.org/pdf/1901.07990), Propositions 1.6.8 and 1.6.12; chromatic fracture, pp.29–32. The formal-height loci supply the localizations and supersingular comparison.

**Open proof inputs.** [G16a](#g16a), [G17](#g17). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-modular-level-galois"></a>
### Level-three Galois extension

**Target** `ChromaticHomotopyTheory:CH.12/modular-level-galois` (construction). For a finite group G, a faithful G-Galois extension A→B of E∞ rings consists of a coherent G-action by A-algebra maps such that A→B^hG and B⊗_A B→∏_G B are equivalences, and tensoring with B is conservative on A-modules. Using the existing full-level-three elliptic moduli cover, construct TMF[1/3]→TMF(3) as a faithful GL₂(F₃)-Galois extension. Its p=2 localization has that same group, including determinant and residue-field components.

**Direct inputs.** [Topological modular forms](#ch-12-modular-form-spectra), [Localized norms and Tate spectra](#ch-9-norm-tate), [Morava stabilizer actions](#ch-7-stabilizer-action), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness), `tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`.

**Construction/proof outline.**

1. Take Otop sections on the finite étale full-level cover and identify the Čech nerve with the finite group torsor.
2. Use spectral affineness to identify Čech descent with the two Galois comparison maps and to reflect zero modules.
3. Keep all group components in the action; restricting to a geometric automorphism subgroup changes the extension. The Galois descent verification is part of G17.

**Uses.** LMMT Corollary 4.21(iv): The K(2)-local level-three extension identifies the finite group action on E₂. CH.12 supersingular comparison: Descent retains the extended automorphism group.

**API.**

- `Chromatic.modular_level_galois.fixedPoints` (equivalence): A is recovered as B^hG with its actual coherent action.
- `Chromatic.modular_level_galois.descentMap` (equivalence): B⊗_A B identifies with the product indexed by G via b₁⊗b₂↦(b₁g(b₂))_g.
- `Chromatic.modular_level_galois.faithful` (characterisation): If B⊗_A M=0 then M=0.
- `Chromatic.modular_level_galois.primeLocalization` (compatibility): Localization of the elliptic torsor and section rings gives the specified prime-local extension.

**Checks.**

- `Chromatic.modular_level_galois.check_1` (computation): For a trivial finite torsor the extension is A→∏_G A and is faithful.
- `Chromatic.modular_level_galois.check_2` (non-example): The zero A-algebra cannot be faithful unless A is zero.
- `Chromatic.modular_level_galois.check_3` (non-example): At p=2 the group has order 48, not 24, and the level-three cover is étale because 3 is invertible.

**Sources.** [MM16](https://arxiv.org/pdf/1311.0514), Theorem 7.6, p.38. Full level n gives the faithful GL₂(Z/n)-Galois extension after inverting n.

**Open proof inputs.** [G17](#g17). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-supersingular-galois"></a>
### Supersingular Morava comparison

**Target** `ChromaticHomotopyTheory:CH.12/supersingular-galois` (comparison). At p=2, L_(K(2))TMF(3)≃E(F₄,Ĉ) for a supersingular elliptic curve with a chosen full level-three marking, equivariantly for the induced GL₂(F₃) action, and L_(K(2))TMF≃E₂^hGL₂(F₃). At p=3, L_(K(2))TMF≃E₂^hG₂₄, where G₂₄ is the automorphism group of the supersingular pair over F₃, including the order-two residue-field Galois factor. Here |Aut(C/F₉)|=12 and the extended group has order 24. Choices of curve and marking give compatible equivalences, not an unmarked canonical coefficient-coordinate identification.

**Direct inputs.** [Level-three Galois extension](#ch-12-modular-level-galois), [Morava E-theory](#ch-7-morava-e-theory), [Morava stabilizer actions](#ch-7-stabilizer-action), [Chromatic bounds for modular forms](#ch-12-modular-chromatic-comparison), `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/elliptic-deformation-comparison`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

**Construction/proof outline.**

1. Identify the formal completion of the supersingular elliptic moduli stack with the quotient of its Lubin–Tate deformation space by the extended automorphism group, using the imported Serre–Tate comparison.
2. At two, full level three rigidifies the supersingular object to one formal deformation chart with residue field F₄.
3. Apply Otop realization and finite-group descent; exact base-change and equivariance are the chart-level proof obligations of G17.

**Acceptance.**

- At two the unmarked extended automorphism group has order 48.
- At three dropping Gal(F₉/F₃) changes the homotopy fixed-point spectrum.

**Sources.** [Beh19](https://arxiv.org/pdf/1901.07990), §1.6, Proposition 1.6.12, pp.30–31. The supersingular quotient gives the order-48 and order-24 extended actions at two and three. [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.21 proof, pp.22–23. At two the level-three K(2)-local spectrum is E₂; at three the extended supersingular automorphism group is used.

**Open proof inputs.** [G17](#g17). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-12-discriminant-localization"></a>
### Discriminant localization

**Target** `ChromaticHomotopyTheory:CH.12/discriminant-localization` (comparison). Choose the surviving discriminant class δ=Δ²⁴∈π₅₇₆Tmf, whose descent edge image is the algebraic modular form Δ²⁴. Then TMF≃Tmf[δ⁻¹], and at every fixed prime TMF_(p)≃Tmf_(p)[δ⁻¹]. This uniform exponent suffices; no assertion that Δ itself is an integral degree-24 class at primes two and three is used.

**Direct inputs.** [Topological modular forms](#ch-12-modular-form-spectra), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness).

**Construction/proof outline.**

1. Use spectral affineness to commute the colimit inverting a surviving discriminant power with global sections.
2. On the étale affine charts, this is restriction to the locus of invertible discriminant.
3. Use the surviving Δ²⁴ class and the discriminant-open identification in Behrens §1.3, p.13. Its permanent-cycle proof and the coherent descent comparison remain G17; a bare algebraic modular form is not substituted for a homotopy class.

**Acceptance.**

- At two the unpowered algebraic Δ is not assumed to be a degree-24 homotopy class.
- The chosen uniform class has degree 24·24=576 and its inversion agrees with the global periodic TMF presentation, before prime localization.

**Sources.** [Beh19](https://arxiv.org/pdf/1901.07990), §1.3, p.13; §1.5, Theorem 1.5.6, p.23. The compactified and periodic spectra are related through the discriminant open. [LMMT24](https://arxiv.org/pdf/2001.10425v5), §4.3 preceding Corollary 4.21 and its proof, p.22. The local Δ inversion is the input to the T(2)-equivalence argument.

**Open proof inputs.** [G16a](#g16a), [G17](#g17). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13"></a>
## CH.13. James filtrations and Thom spectra

**Stage inputs.** `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.2`, `ChromaticHomotopyTheory:CH.3`, `ChromaticHomotopyTheory:CH.4`, `ChromaticHomotopyTheory:CH.6`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

<a id="ch-13-james-filtration"></a>
### James construction

**Target** `ChromaticHomotopyTheory:CH.13/james-filtration` (construction · planet). For a based well-pointed CW space W, J_rW is the space of words of length at most r in W, with occurrences of the basepoint removed; J₀W=* and J_∞W=colim_rJ_rW. Concatenation gives J_∞W a topological monoid. For connected W, J_∞W→ΩΣW is an equivalence, J_rW/J_(r−1)W≃W^∧r, and Σ∞J_∞W≃∨_(r≥1)Σ∞W^∧r. These are reduced suspension spectra. For W=S², J_rS² is the 2r-skeleton F_rΩS³.

**Direct inputs.** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`.

**Construction/proof outline.**

1. Construct the word-length quotient and its cell filtration.
2. Use the James comparison map and connectivity to prove its equivalence for connected W.
3. Split the suspended word-length filtration stably by the James maps, giving the natural wedge decomposition. The splitting proof and its exact primary source are G18.

**Uses.** LMMT Corollary 4.14: Smash-power acyclicity passes from W to ΩΣW. LMMT Lemma 4.15: Finite James skeleta define y(m).

**API.**

- `Chromatic.james_filtration.include` (functoriality): The inclusions J_rW→J_(r+1)W and maps induced by W→W′ preserve word length.
- `Chromatic.james_filtration.graded` (characterisation): The r-th word-length quotient is W^∧r.
- `Chromatic.james_filtration.loopComparison` (equivalence): For connected W the group-like comparison J_∞W→ΩΣW is an equivalence.
- `Chromatic.james_filtration.stableSplitting` (compatibility): The stable equivalence is natural in connected W and uses reduced spectra, with no extra sphere summand.

**Checks.**

- `Chromatic.james_filtration.check_1` (computation): J₀W=* has zero reduced suspension spectrum.
- `Chromatic.james_filtration.check_2` (computation): For W=S², the filtration adds one cell in each even dimension through 2r.
- `Chromatic.james_filtration.check_3` (non-example): For W=S⁰ the connected-space comparison fails: the free monoid is not the full loop group of S¹.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.14 proof and following Thom-spectrum construction, p.20. The stable splitting propagates telescope acyclicity; the sphere case identifies the finite skeleta. [AKQ](https://arxiv.org/pdf/1908.09164), §2.1, p.5. The J_(2^m−1)S² subspaces define the Thom family at two.

**Open proof inputs.** [G18](#g18). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13-units-thom"></a>
### Units and Thom spectra

**Target** `ChromaticHomotopyTheory:CH.13/units-thom` (construction · planet). For an E∞ ring R, GL₁R is the union of the unit components in Ω∞R with its multiplicative group-like E∞ structure, and BGL₁R→Mod_R classifies the R-lines equivalent to R. For f:X→BGL₁R, define Mf=colim_X L_f in Mod_R. A based n-fold loop map yields an E_n R-algebra structure on Mf by the monoidal Thom construction. Preserve the actual twist and coherent multiplicative data.

**Direct inputs.** `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `StableHomotopyKTheory:H.5:spectra/ring-spectrum`.

**Construction/proof outline.**

1. Form the unit components and their delooping as the automorphism space of the free rank-one R-module.
2. Take the colimit of the classified R-line local system.
3. Use the monoidal colimit comparison to transport the E_n multiplication; the generic Thom multiplicativity and units delooping are G19 until their source proof is expanded.

**Uses.** Hopkins–Mahowald theorem: The characteristic-p unit determines HF_p as a Thom E₂ ring. LMMT §4.2: James restriction gives the E₁ rings y(m) and z(m).

**API.**

- `Chromatic.units_thom.line` (data): The map to BGL₁R supplies a functor X→Mod_R whose values are free rank-one R-lines up to equivalence.
- `Chromatic.units_thom.colimit` (universal-property): R-linear maps out of Mf are coherent compatible sections of maps out of its classified lines.
- `Chromatic.units_thom.baseChange` (functoriality): An E∞ map R→R′ carries Mf to the Thom R′-module of the transported line system.
- `Chromatic.units_thom.multiplicative` (structure): For a coherent n-fold loop input the Thom module has the corresponding E_n algebra structure.

**Checks.**

- `Chromatic.units_thom.check_1` (computation): For X=* and its trivial line, Mf≃R.
- `Chromatic.units_thom.check_2` (computation): For a trivial map on X, Mf≃R⊗Σ∞_+X.
- `Chromatic.units_thom.check_3` (non-example): GL₁HF_p has discrete component group F_p^×; it is not the full additive infinite loop space of HF_p.

**Sources.** [ACB](https://arxiv.org/pdf/1411.7988), Definition 3.1 and Corollary 3.2, p.10; Theorem 3.5 and Corollary 3.9, p.11; Lemma 3.15 and Proposition 3.16, pp.13–14. The module-colimit Thom construction and multiplicative refinement underlie the characteristic-p Thom theorem. [AKQ](https://arxiv.org/pdf/1908.09164), §2.1, p.5. The family is formed from loop maps into units of the sphere.

**Open proof inputs.** [G19](#g19). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13-hopkins-mahowald"></a>
### Hopkins–Mahowald Thom theorem

**Target** `ChromaticHomotopyTheory:CH.13/hopkins-mahowald` (theorem · planet). Let (S³)_p^∧ be the p-completion of the nilpotent space S³ and let f_p:Ω²(S³)_p^∧→BGL₁(S_p^∧) be the E₂ map extending the class 1−p∈π₁BGL₁(S_p^∧)=Z_p^× in the p-complete convention. Its p-complete Thom E₂ ring is HF_p. Set C_p=fib((S³)_p^∧→K(Z_p,3)), with the map inducing the identity on π₃. Restriction along Ω²C_p gives the p-complete Thom E₂ ring HZ_p. Here C_p is the 3-connected cover; using an uncompleted S³ with target K(Z_p,3) would give π₂=Z_p/Z instead. Thom tensor products and colimits in these assertions are taken in the p-complete symmetric monoidal category.

**Direct inputs.** [Units and Thom spectra](#ch-13-units-thom), [Postnikov and connected-cover conventions](#ch-6-space-postnikov), [James construction](#ch-13-james-filtration), `StableHomotopyKTheory:H.6/p-completion`, [Homological Bousfield localization](#ch-0-homological-localization).

**Construction/proof outline.**

1. Use H.6’s spectral p-completion and CH.0’s homological localization to identify p-complete spectra with Sp_(S/p), whose tensor and colimits are completed. Model the nilpotent source-space completion and compare its connected cover with the completion of fib(S³→K(Z,3)); this comparison is included in G19.
2. Identify the Thom E₂ ring with the versal E₂ ring killing p via the universal property.
3. Compute its mod-p homology and the Dyer–Lashof operations to identify the map to HF_p.
4. For the integral connected-cover variant use the intermediate Thom construction over S¹ and its characteristic-p quotient. The free E₂ homology and operation computation is G19.

**Acceptance.**

- At p=2 the selected unit is −1.
- The HF_p Thom ring has π₀=F_p, while the connected-cover integral variant has π₀=Z_p.
- The completed-source cover C_p has π_i=0 for i≤3. The fiber of the uncompleted-domain map S³→K(Z_p,3) fails this check in degree two.

**Sources.** [ACB](https://arxiv.org/pdf/1411.7988), Theorems 5.1 and 5.7, pp.19–22. The p-complete characteristic-p and integral connected-cover Thom identifications are proved by universal properties and mod-p homology.

**Open proof inputs.** [G19](#g19). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13-james-thom-family"></a>
### James-filtered Thom spectra

**Target** `ChromaticHomotopyTheory:CH.13/james-thom-family` (construction · planet). For m≥0 restrict f_p along ΩJ_(p^m−1)S²→Ω²S³→Ω²(S³)_p^∧ and denote the resulting p-complete E₁ Thom ring by y(m). All colimits in this family are colimits in p-complete spectra, formed by completing ordinary spectral colimits. Then y(0)=S_p^∧, there are E₁ maps y(m)→y(m+1), and colim_m y(m)≃HF_p. For m≥1, π₀y(m)=F_p. At p=2 and m≥1 define z(m) by restricting along Ω(J_(2^m−1)S²⟨2⟩), where the inner connected cover is the fiber of J_(2^m−1)S²→K(Z,2), followed by completion in the p-complete convention. These E₁ rings map to y(m), and colim z(m)≃HZ₂.

**Direct inputs.** [James construction](#ch-13-james-filtration), [Units and Thom spectra](#ch-13-units-thom), [Hopkins–Mahowald Thom theorem](#ch-13-hopkins-mahowald), [Postnikov and connected-cover conventions](#ch-6-space-postnikov).

**Construction/proof outline.**

1. Use the word filtration and loop the inclusion of each finite James stage.
2. Restrict the actual unit-classifying map before applying the Thom colimit; this keeps the E₁ multiplication.
3. Use connectivity of the James tower and commutation of the needed loop and Thom constructions with filtered colimits. Form the final colimit in p-complete spectra, and compare the integral connected-cover square before and after completion; do not infer an ordinary spectral colimit identity from the completed one.
4. The π₀ comparison and compatibility of integral versus completed conventions are retained in G20.

**Uses.** LMMT Lemma 4.15: The finite James index controls the Adams vanishing line. LMMT Corollary 4.18: The integral family supplies positive-height acyclicity inputs.

**API.**

- `Chromatic.james_thom_family.transition` (functoriality): James inclusions induce E₁ maps compatible with the maps to the colimit Thom ring.
- `Chromatic.james_thom_family.initial` (example): The y(0) object is S_p^∧ by the trivial Thom-line computation.
- `Chromatic.james_thom_family.piZero` (characterisation): For m≥1, π₀y(m)=F_p; the completed integral family has π₀=Z₂.
- `Chromatic.james_thom_family.integralComparison` (compatibility): The z(m)→y(m) square agrees with HZ₂→HF₂ after passing to the colimit.

**Checks.**

- `Chromatic.james_thom_family.check_1` (non-example): m=0 uses J₀ and gives S_p^∧; it does not have π₀=F_p.
- `Chromatic.james_thom_family.check_2` (computation): At p=2,m=1 the finite stage is J₁S²=S².
- `Chromatic.james_thom_family.check_3` (non-example): z(m) keeps its integral π₀ and is not obtained by merely taking y(m) with a different label.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Thom construction preceding Lemma 4.15, p.20. The prime-dependent stage p^m−1 and y(0) convention are specified. [AKQ](https://arxiv.org/pdf/1908.09164), Construction 2.1 and Lemma 2.2, pp.5–6. The connected-cover family z(m) has a compatible E₁ map to y(m).

**Open proof inputs.** [G20](#g20). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13-thom-acyclicity"></a>
### Chromatic acyclicity of Thom spectra

**Target** `ChromaticHomotopyTheory:CH.13/thom-acyclicity` (theorem · planet). For m≥1, y(m) is L_(m−1)^(p,f)-acyclic: T(i)⊗y(m)=0 for 0≤i<m. At p=2, z(m) is K(i)-acyclic and hence T(i)-acyclic for 1≤i<m; its rational homology is nonzero, so do not add i=0 to that range.

**Direct inputs.** [James-filtered Thom spectra](#ch-13-james-thom-family), [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity), [Periodic homotopy groups](#ch-3-periodic-homotopy), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Finite chromatic localizations](#ch-4-finite-localizations).

**Construction/proof outline.**

1. At height zero use the F_p-valued π₀ of the connective ring y(m), which makes all its homotopy groups p-torsion.
2. At two use Angelini-Knoll–Quigley Proposition 2.22, computed from Margolis homology and a localized Adams spectral sequence, then use the ring acyclicity comparison.
3. At odd primes compare the Adams vanishing-line slope 1/(2p^m−2) with a v_i action of reciprocal slope 1/|v_i| for i<m, forcing v_i-torsion after localization. The convergence and slope proof are G20.
4. For z(m), keep the integral degree-zero class and the positive-height range exactly.

**Acceptance.**

- At m=1, y(1) is p-inversion acyclic.
- The stated z(m) range is empty at m=1 and excludes rational acyclicity.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Lemma 4.15 and Corollary 4.18 proof, p.21. The y(m) vanishing and positive-height integral version are the needed inputs to purity. [AKQ](https://arxiv.org/pdf/1908.09164), Proposition 2.22, p.15. The p=2 Morava-acyclicity ranges distinguish y(m) from z(m).

**Open proof inputs.** [G20](#g20). See the exact obligations below; prerequisites propagate their gaps to consumers.

<a id="ch-13-james-acyclicity"></a>
### Acyclicity under the James splitting

**Target** `ChromaticHomotopyTheory:CH.13/james-acyclicity` (application). Let W be a connected pointed CW space and let E=T(n)∨T(n−1), with n≥1. If E⊗Σ∞W=0 then E⊗Σ∞ΩΣW=0. In particular a connected type-m finite complex with m>n meets this hypothesis. This is the stable input for the corresponding Waldhausen A-theory purity application; no A-theory comparison is re-proved here.

**Direct inputs.** [James construction](#ch-13-james-filtration), [Telescope acyclicity criteria](#ch-3-telescope-properties), [Chromatic type](#ch-2-chromatic-type).

**Construction/proof outline.**

1. Smash the stable James splitting with E. Every positive smash power of W is E-acyclic because tensoring is associative.
2. Tensor and coproduct commute; all terms of the wedge vanish.

**Acceptance.**

- The wedge starts at k=1, so no sphere summand invalidates the vanishing.
- For n=1 the lower detector is S[1/p], with its specified convention.

**Sources.** [LMMT24](https://arxiv.org/pdf/2001.10425v5), Corollary 4.14 proof, p.20. The proof uses exactly the reduced James splitting and smash-power acyclicity.

**Open proof inputs.** [G18](#g18). See the exact obligations below; prerequisites propagate their gaps to consumers.

## Routed-target coverage

The 34 routed LMMT items are all accounted for. The table uses the numerical suffix of `PAPER-LAND-MATHEW-MEIER-ETAL-24`. Imported generic Tate and space Postnikov results retain their supplier ownership.

| Item | Realizing targets |
| --- | --- |
| /2 | [Homological Bousfield localization](#ch-0-homological-localization), [Finite localization kernels](#ch-4-finite-kernel-smashing) |
| /6 | [Hahn’s acyclicity theorem](#ch-10-hahn-acyclicity), [Chromatic height of a commutative ring](#ch-10-ring-chromatic-height) |
| /14 | [Chromatic type](#ch-2-chromatic-type), [Periodic self-maps](#ch-2-vn-self-map), [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality) |
| /15 | [Periodic homotopy groups](#ch-3-periodic-homotopy) |
| /16 | [Telescopes](#ch-3-telescope), [Separation above height one](#ch-8-telescope-separation) |
| /17 | [Telescope acyclicity criteria](#ch-3-telescope-properties) |
| /18 | [Ring-spectrum acyclicity comparison](#ch-3-ring-acyclicity) |
| /19 | [Finite chromatic localizations](#ch-4-finite-localizations) |
| /20 | [Finite localization kernels](#ch-4-finite-kernel-smashing) |
| /21 | [Chromatic fracture squares](#ch-4-fracture-square) |
| /22 | [Chromatic fracture squares](#ch-4-fracture-square) |
| /23 | [Finite chromatic localizations](#ch-4-finite-localizations) |
| /24 | [Comparison on p-local spectra](#ch-4-p-local-comparison), [Bottom finite-local comparison](#ch-4-bottom-finite-comparison) |
| /25 | [Detection by suspension and loops](#ch-5-suspension-loop-detection) |
| /26 | [Connective periodic vanishing](#ch-6-connective-periodic-vanishing), [Connective preservation by suspension and loops](#ch-6-connective-loop-preservation) |
| /27 | [Connective periodic vanishing](#ch-6-connective-periodic-vanishing) |
| /47 | [Kuhn’s telescopic Tate vanishing](#ch-9-kuhn-tate-vanishing), [Finite-local Tate blueshift](#ch-9-finite-blueshift) |
| /48 | [Hahn’s acyclicity theorem](#ch-10-hahn-acyclicity), [Tate height converse](#ch-10-tate-height-converse) |
| /75 | [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Chromatic support of BP truncations](#ch-8-truncation-support) |
| /78 | [James construction](#ch-13-james-filtration), [Units and Thom spectra](#ch-13-units-thom), [Hopkins–Mahowald Thom theorem](#ch-13-hopkins-mahowald), [James-filtered Thom spectra](#ch-13-james-thom-family) |
| /79 | [Chromatic acyclicity of Thom spectra](#ch-13-thom-acyclicity) |
| /82 | [Real topological K-theory](#ch-11-real-k-theory), [Real Bott coefficients](#ch-11-real-coefficients) |
| /85 | [Elliptic cohomology theories](#ch-12-elliptic-cohomology), [Topological structure sheaf](#ch-12-topological-structure-sheaf), [Topological modular forms](#ch-12-modular-form-spectra), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness), [Discriminant localization](#ch-12-discriminant-localization), [Chromatic bounds for modular forms](#ch-12-modular-chromatic-comparison) |
| /86 | [Morava E-theory](#ch-7-morava-e-theory), [Morava stabilizer actions](#ch-7-stabilizer-action) |
| /105 | [Bousfield–Kuhn functor](#ch-5-bousfield-kuhn), [Finite telescopic functors](#ch-5-finite-telescopic-functor) |
| /106 | [Connective periodic vanishing](#ch-6-connective-periodic-vanishing) |
| /107 | [Generalized Serre filtration](#ch-6-generalized-serre-filtration), [Fiberwise homology comparison](#ch-6-fiberwise-equivalence) |
| /108 | [Nilpotence theorem](#ch-2-nilpotence) |
| /109 | [Thick subcategory theorem](#ch-2-thick-subcategory) |
| /110 | [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality) |
| /113 | [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), [Finite-height locality](#ch-8-height-locality) |
| /114 | [Hopkins–Ravenel smashing theorem](#ch-8-hopkins-ravenel), [Telescopes on chromatically local spectra](#ch-8-local-telescope-comparison) |
| /115 | [Level-three Galois extension](#ch-12-modular-level-galois), [Supersingular Morava comparison](#ch-12-supersingular-galois) |
| /117 | [James construction](#ch-13-james-filtration), [Acyclicity under the James splitting](#ch-13-james-acyclicity) |

**Correction to routed item /75.** Replace E(n)≃L_n^fBP⟨n⟩ by the stated T(n)-equivalence and higher-height acyclicity. The false stronger identity is in the extraction, not in LMMT Corollary 4.12. For n=1, rationalization of BP⟨1⟩ has zero negative homotopy, whereas rational E(1) has an invertible positive-degree v₁ and nonzero negative homotopy. Since HQ is a summand of the L_1^f detector, L_1^f preserves rational homology. Thus its value on BP⟨1⟩ cannot be E(1). This is a correction to the atlas extraction, not an allegation of an error in the published paper.

## Worked boundary checks

1. For q≠p, smashing S/q with S[1/p] preserves S/q because p acts invertibly on q-primary homotopy. Smashing with HQ gives zero. Hence neither T(0)=HQ on all spectra nor an unrestricted identification of the two finite towers passes this check. On Sp_(p), inverting p inverts every prime and gives rationalization.
2. Over a characteristic-p field, the additive law has [p](x)=px=0. For the multiplicative coordinate x=[L]−1, repeated addition gives (1+x)^p−1=x^p. These test infinite versus height-one formal groups using the actual Mathlib point law. They are precisely the end calculations in the suggested file; no algebraic formal-group height is redeclared.
3. In the KU Tate example, Φ_p(1+z)=0 after removing the zero-section factor. Thus z=ζ_p−1 and inverting z in Z_p[ζ_p] inverts a uniformizer, giving Q_p(ζ_p); at p=2 this is Q₂. This checks the algebraic part of the computation. The topological Euler-inversion comparison is G13, so the algebraic calculation is not presented as its proof.
4. The real coefficients have η in degrees one and two, α in degree four and β in degree eight, with α²=4β. This excludes a substituted complex KU coefficient ring. A connective cover retains positive-height periodic homotopy while losing the negative rational Bott classes, explaining the n≥1 restriction on ko→KO.

## Remaining proof and supplier obligations

All coverage entries are planned. Their packet `remaining` lists propagate the following exact obligations through the internal prerequisite graph, together with the applicable supplier contracts. A new proof extraction must preserve these mathematical statements and ownership boundaries. It must not turn a source-level theorem into a fictitious baseline implementation.

<a id="g1"></a>
### G1 — Complex-cobordism smash nilpotence

Extract the Devinatz–Hopkins–Smith MU smash-nilpotence input and its reduction in Hopkins–Smith Theorem 3, pp.2–3 and §2.1, pp.15–17. The MU-based vanishing-curve argument is not contained in the present proof sketch. No direct proof from polynomial coefficients is claimed.

**Direct consumers.** [Nilpotence theorem](#ch-2-nilpotence).

<a id="g2"></a>
### G2 — Periodicity induction and finite-type existence

Expand the proof of Hopkins–Smith Theorem 9, pp.4–5 and §4, pp.22–46, with the endomorphism-ring F-isomorphism and the induction constructing one finite spectrum at each type. Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21, were read for the power comparison, but the Adams-theoretic construction in §4 has not been audited. This is one proof obligation, not a circular reliance of periodicity on the finished thick theorem.

**Direct consumers.** [Periodicity and asymptotic centrality](#ch-2-periodicity-centrality), [Thick subcategory theorem](#ch-2-thick-subcategory).

<a id="g3"></a>
### G3 — Finite-generation and telescope comparison

LMMT Lemmas 2.2(vii) and 2.6, pp.7–8, were read, including their use of Mahowald–Sadofsky (1995) Lemma 2.1 and Proposition 3.3. The original MS95 proofs of finite p-power annihilation and the complemented-class compact-generation criterion still need a public source and a proof extraction. Distinguish the kernel on all spectra from its restriction to Sp_(p).

**Direct consumers.** [Finite localization kernels](#ch-4-finite-kernel-smashing), [Telescope acyclicity criteria](#ch-3-telescope-properties).

<a id="g4"></a>
### G4 — Coherent telescopic rigidification

Kuhn Theorem 5.2 and Lemmas 5.4–5.5, pp.15–18, give the comparison and outline rigidification. Expand the cofinal finite-spectrum system of Proposition 2.6, p.8, the stable-range choices, the cofibration replacements and their compatibility. Equality of periodic homotopy groups alone does not construct the functor or its coherent finite-source comparisons.

**Direct consumers.** [Finite telescopic functors](#ch-5-finite-telescopic-functor), [Bousfield–Kuhn functor](#ch-5-bousfield-kuhn).

<a id="g5"></a>
### G5 — Nullification and categorical-height comparison

BHM Theorem 3.1, p.5 and Lemmas 3.2–3.3, p.6, and CSY Theorem 5.4.4/Remark 5.4.5, pp.83–84, were read. Extract Bousfield (2001) Corollary 4.8 from its original proof, and the CSY/Ravenel–Wilson Eilenberg–Mac Lane vanishing computation needed for the sharp n+1 bound. Retain the p-inversion comparison for simply connected p-primary-torsion spaces at height zero.

**Direct consumers.** [Connective periodic vanishing](#ch-6-connective-periodic-vanishing).

<a id="g6"></a>
### G6 — Oriented realization and invariant-ideal support

Prove Quillen’s MU coefficient/universal-law comparison, the p-typical BP retract, regular quotient ring/module realizations, and the precise invariant-ideal descent used in finite-height locality. Ravenel Theorem 2.1, pp.361–363, supplies the Bousfield calculations, but this plan has not extracted the Landweber realization and invariant-ideal proof from primary sources. No E∞ structure on BP or its general truncations is inferred.

**Direct consumers.** [Complex cobordism and Brown–Peterson theory](#ch-1-cobordism-p-typical), [Morava K-theory and Johnson–Wilson spectra](#ch-1-morava-coefficient-spectra), [Connective periodic cofiber sequences](#ch-1-vn-cofiber-sequences), [Ravenel’s Bousfield class formula](#ch-8-ravenel-bousfield-class), [Finite-height locality](#ch-8-height-locality), [Chromatic support of BP truncations](#ch-8-truncation-support).

<a id="g7"></a>
### G7 — Horizontal vanishing and chromatic smashing

Mathew–Meier Theorems 4.6–4.7 and Corollary 4.8, pp.26–27, were read. Expand the uniform horizontal vanishing line, Bousfield’s pro-constancy criterion and the Hopkins–Ravenel smashing proof, using the referenced Lurie lectures 30–31 or a cleared primary proof. The restricted T(n)/K(n) comparison in LMMT Corollary 4.21, p.22, is read; it uses this smashing input.

**Direct consumers.** [Hopkins–Ravenel smashing theorem](#ch-8-hopkins-ravenel), [Telescopes on chromatically local spectra](#ch-8-local-telescope-comparison).

<a id="g8"></a>
### G8 — Telescope-conjecture status proofs

LMMT §2.1, p.6, supplies the height-one Mahowald/Miller theorem; BHLS Theorem A, manuscript pp.2–5, supplies failure at every n≥2 and every prime. Original height-one proofs and the BHLS construction are not extracted here. The latter is a theorem target for the status comparison, not a claim that its K-theoretic machinery is proved in this packet; algebraic K-theory itself remains with its owner.

**Direct consumers.** [Separation above height one](#ch-8-telescope-separation).

<a id="g9"></a>
### G9 — Goerss–Hopkins–Miller realization

Goerss Theorem 3.6 and its functoriality discussion, pp.238–239, were read. Extract the obstruction-theoretic realization, contractibility and automorphism equivariance for the imported marked deformation rings. Algebraic Lubin–Tate representability and continuity on π₀ do not supply these E∞ coherence assertions.

**Direct consumers.** [Morava E-theory](#ch-7-morava-e-theory), [Morava stabilizer actions](#ch-7-stabilizer-action).

<a id="g11"></a>
### G11 — Kahn–Priddy and finite-group reduction

Clausen–Mathew Proposition 2.3, Lemma 2.4 and Theorems 2.5–2.6, pp.2–4, give the short proof. Expand the unstable cyclic-group Kahn–Priddy section and Kuhn (2004) Lemmas 2.7–2.8 for the reduction from prime-order groups to all finite groups; these are not obtained merely by averaging at p.

**Direct consumers.** [Localized transfer splitting](#ch-9-transfer-splitting), [Kuhn’s telescopic Tate vanishing](#ch-9-kuhn-tate-vanishing).

<a id="g12"></a>
### G12 — Lower finite-locality of raw Tate

LMMT Remark 3.9, p.16, and CMNN introduction, p.3, state the blueshift form. Extract the proof that the raw C_p Tate spectrum of every L_n^(p,f)-local object is actually L_(n−1)^(p,f)-local. Localized T(n)-Tate vanishing by itself does not justify this stronger conclusion. The proof must handle arbitrary coherent action and the all-spectra height-zero convention. Kuhn Corollary 1.6 and Lemma 4.1, manuscript pp.5,16–17, provide the stronger raw Tate vanishing for trivial-action v_n telescopes used in a finite type-n test; expand its module and arbitrary-action comparison rather than deducing the claim from localized vanishing alone.

**Direct consumers.** [Finite-local Tate blueshift](#ch-9-finite-blueshift).

<a id="g13"></a>
### G13 — Euler-class computation for KU Tate

Establish the complex-oriented Tate/Euler-inversion comparison and convergence needed to calculate π₀ of trivial-action (KU_p^∧)^tC_p as Q_p(ζ_p). The algebraic cyclotomic quotient is worked out, but Clausen–Mathew Remark 2.8 only gives the general nonzero E-theory phenomenon and is not cited as a proof of this exact formula. The sphere Segal comparison is an explicit RT.2 request: the supplier currently mentions it only as an acceptance example.

**Direct consumers.** [Nonzero raw Tate spectra](#ch-9-nonzero-tate-examples).

<a id="g14"></a>
### G14 — Power operations and Tate height descent

Hahn Theorems 1.1/1.3, §2, Theorem 3.3, §4 and Proposition 4.7, pp.1–4,7–10, and CMNN Theorem 4.6/Lemma 4.7, pp.19–20, were read. Extract extended-power coherence, the quotient operation, the Eisenstein valuation-lowering argument and the faithfully flat Tate-base-change calculation. Treat i=0 by the characteristic-p/May-nilpotence argument and the empty invariant-ideal convention, rather than using nonexistent negative-index coefficients. Hahn Theorem 3.3 is printed with k≥1. Verify its separate k=0 Bockstein case when needed, and retain module-cofiber quotients until regular even coefficients justify ordinary quotient rings.

**Direct consumers.** [Morava power operations](#ch-10-morava-power-operations), [Hahn’s acyclicity theorem](#ch-10-hahn-acyclicity), [Tate height converse](#ch-10-tate-height-converse).

<a id="g15"></a>
### G15 — Real Bott periodicity and recognition

ABS §§6 and 11, pp.15–16,28–29, compute the real coefficients using Bott periodicity; they are not an independent proof of it. Locate and extract a public proof of real Bott periodicity, including compatibility of the Clifford-module generator and complexification. The coherent recognition machine is requested from H.5 and is not redeveloped here.

**Direct consumers.** [Real topological K-theory](#ch-11-real-k-theory), [Real Bott coefficients](#ch-11-real-coefficients).

<a id="g16a"></a>
### G16a — Generalized-elliptic compactification

Current TauCetiRoadmap ModularCurves Scope explicitly excludes generalized elliptic curves, stacks and boundary moduli; Layer 10 constructs coarse compactifications only. Need the stable one-pointed genus-one moduli stack with irreducible geometric fibers (smooth curves or nodal one-gons), its étale site and universal curve, ω, Δ and formal-height strata. Propose Modular curves, Part II: generalized elliptic moduli and boundary geometry. No claim that current 7E or coarse X_H supplies this carrier.

**Direct consumers.** [Topological structure sheaf](#ch-12-topological-structure-sheaf), [Topological modular forms](#ch-12-modular-form-spectra), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness), [Discriminant localization](#ch-12-discriminant-localization), [Chromatic bounds for modular forms](#ch-12-modular-chromatic-comparison).

<a id="g16b"></a>
### G16b — Spectral sheaf and quasicoherent module carriers

EDS E1 covers ordinary ringed-topos derived sheaves, and E5 covers stable monoidal categories and modules. Neither states the required sheaves of E∞ ring spectra and quasicoherent spectral modules on an algebraic groupoid. Need their étale descent, affine-chart base change, tensor with spectra and global sections. Propose Enhanced derived sheaves, Part II: spectral ringed sites. Do not substitute ordinary quasi-coherent sheaves for these module spectra.

**Direct consumers.** [Topological structure sheaf](#ch-12-topological-structure-sheaf), [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness).

<a id="g16"></a>
### G16 — Integral topological-structure-sheaf realization

Goerss Theorem 1.2, pp.224–225, and Mathew–Meier Theorem 7.1, p.35, were read. Extract coherent integral gluing of the local GHM realizations, including ordinary, supersingular, nodal and rational charts and the formal-group comparison. Even homotopy sheaves do not determine an E∞ sheaf.

**Direct consumers.** [Topological structure sheaf](#ch-12-topological-structure-sheaf).

<a id="g17"></a>
### G17 — Elliptic affineness, discriminant support and equivariance

Mathew–Meier Theorems 7.2 and 7.6, pp.35–38, and Behrens §1.3, p.13, §1.5, p.23, and §1.6, pp.27–32, were read. Expand 0-affineness, the Δ²⁴ permanent-cycle comparison (degree 576), the height-two support argument, finite étale Galois descent and the equivariant supersingular formal chart. At p=2 retain GL₂(F₃) of order 48; at p=3 retain the extended order-24 group over F₃. The underlying algebraic boundary and spectral-module carriers remain G16a/G16b.

**Direct consumers.** [Affineness of elliptic spectral geometry](#ch-12-spectral-affineness), [Discriminant localization](#ch-12-discriminant-localization), [Chromatic bounds for modular forms](#ch-12-modular-chromatic-comparison), [Level-three Galois extension](#ch-12-modular-level-galois), [Supersingular Morava comparison](#ch-12-supersingular-galois).

<a id="g18"></a>
### G18 — Stable James splitting

LMMT Corollary 4.14 proof, p.20, uses the reduced splitting, and AKQ §2.1, p.5, identifies the finite sphere skeleta. Locate and read a public proof of the James equivalence and natural stable word-length splitting, or the cleared Adams reference if listed in the private index. Do not assert the connected-space comparison for S⁰ or insert an extra sphere in the reduced wedge.

**Direct consumers.** [James construction](#ch-13-james-filtration), [Acyclicity under the James splitting](#ch-13-james-acyclicity).

<a id="g19"></a>
### G19 — Multiplicative Thom and free E₂ computation

Antolín-Camarena–Barthel Definition 3.1, Corollary 3.2, Theorem 3.5/Corollary 3.9, pp.10–11, Lemma 3.15 and Proposition 3.16, pp.13–14, and Theorems 5.1/5.7, pp.19–22, were read. Extract the monoidal-colimit proof and the free E₂ mod-p homology/Dyer–Lashof calculation identifying the Thom rings. The construction and universal property are stated; coherent multiplicativity and the operation computation are not derived from ordinary colimits alone. Supply the nilpotent source-space p-completion model and the connected-cover comparison; H.6’s spectral completion alone does not construct a completed space. Keep the Thom colimits in p-complete spectra and distinguish fib((S³)_p^∧→K(Z_p,3)) from the fiber with uncompleted domain.

**Direct consumers.** [Units and Thom spectra](#ch-13-units-thom), [Hopkins–Mahowald Thom theorem](#ch-13-hopkins-mahowald).

<a id="g20"></a>
### G20 — James-filtered Thom vanishing lines

LMMT construction and Lemma 4.15/Corollary 4.18, pp.20–21, and AKQ Construction 2.1/Lemma 2.2, pp.5–6, Proposition 2.22, p.15, were read. Expand the Margolis-homology computation at two and the MRS01 localized Adams vanishing line at odd primes, including convergence and the comparison of its slope with |v_i|. Check filtered Thom colimits and π₀ for z(m) in the completed category, and prove every comparison to the uncompleted AKQ construction before transporting its acyclicity result. The positive-height range for z(m) excludes height zero.

**Direct consumers.** [James-filtered Thom spectra](#ch-13-james-thom-family), [Chromatic acyclicity of Thom spectra](#ch-13-thom-acyclicity).

## Requested stage contracts

- **`EnhancedDerivedSheaves:E3`.** Accessible exact localization of Sp at the E-homology equivalences: establish accessibility of the acyclic class and produce its reflective localization with mapping-space universal property. The E3 accessible-localization scope is the general supplier; the chromatic identification of acyclics is local to CH.0. For a map f:X→Y of spaces, supply its unstraightening as the fiber local system and the pointwise left-Kan-extension/composition equivalence colim_(y∈Y) colim_(x∈fib_y f) D(x)≃colim_(x∈X)D(x). Existing E3 Kan-extension composition supplies the categorical part; its space-indexed specialization must be proved with these carriers. Consumers: [Homological Bousfield localization](#ch-0-homological-localization), [Fiberwise homology comparison](#ch-6-fiberwise-equivalence).

- **`StableHomotopyKTheory:H.5:spectra`.** Coherent recognition of the group completion of a permutative topological category as a connective spectrum, compatibly with direct sum and tensor product, and multiplicative connective covers of E∞ ring spectra. Apply this to the real-vector-bundle category; H.4 supplies group completion. Consumers: [Real topological K-theory](#ch-11-real-k-theory), [Topological modular forms](#ch-12-modular-form-spectra).

- **`RefinedTraceMethods:RT.4:topological`.** Complex ku and KU from stable complex bundles, E∞ multiplication, π_*ku=Z[b] and π_*KU=Z[b^±1] with |b|=2, Bott inversion, the standard multiplicative orientation and the p-local Adams-summand comparison with E(1). This imports the complex theory; CH.11 owns its real counterpart. Also supply that KU_p^∧ is K(1)-local, for the localized Tate-vanishing example; the coefficient computation alone does not imply this locality. Consumers: [Complex orientations](#ch-1-complex-orientation), [Telescopes on chromatically local spectra](#ch-8-local-telescope-comparison), [Nonzero raw Tate spectra](#ch-9-nonzero-tate-examples), [Real topological K-theory](#ch-11-real-k-theory).

- **`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.** Based finite CW complexes, homotopy cofibers, cellular filtrations, suspension and finite cell induction, including passage to retracts after p-localization. Consumers: [Finite p-local spectra](#ch-0-finite-p-local-spectra), [Complex orientations](#ch-1-complex-orientation), [Real topological K-theory](#ch-11-real-k-theory), [James construction](#ch-13-james-filtration).

- **`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.** Real and complex vector bundles, stable bundle operations and classifying spaces, finite-cover transfer, and the ordinary Serre homology filtration with full monodromy local system. CH.6 owns the spectrum-coefficient extension and its convergence conditions. Consumers: [Generalized Serre filtration](#ch-6-generalized-serre-filtration), [Real topological K-theory](#ch-11-real-k-theory).

- **`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.** Based and relative homotopy groups, homotopy fiber exact sequence, Hurewicz and Whitehead with their connectivity hypotheses, and the stable range needed to represent finite-spectrum maps by sufficiently suspended finite complexes. The current Stage 8 explicitly supplies Hurewicz/Whitehead but does not state Freudenthal stabilization; the stable-range assertion is a requested extension, with its suspension/connectivity inequalities still to be supplied. Consumers: [Periodic homotopy groups](#ch-3-periodic-homotopy), [Finite telescopic functors](#ch-5-finite-telescopic-functor), [Postnikov and connected-cover conventions](#ch-6-space-postnikov), [James construction](#ch-13-james-filtration).

- **`tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.** Height one for ordinary and height two for supersingular elliptic formal groups, the connected p-divisible comparison and Serre–Tate deformation interface in its existing domain; no generalized-elliptic boundary moduli are assumed. Consumers: [Geometric height of an orientation](#ch-1-geometric-height), [Elliptic cohomology theories](#ch-12-elliptic-cohomology), [Chromatic bounds for modular forms](#ch-12-modular-chromatic-comparison), [Supersingular Morava comparison](#ch-12-supersingular-galois).

- **`tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`.** The smooth elliptic groupoid presented by Weierstrass equations and variable changes, with effective descent, invariant differential and compatibility of the formal law with WeierstrassCurve.formalGroup. Consumers: [Elliptic cohomology theories](#ch-12-elliptic-cohomology), [Topological structure sheaf](#ch-12-topological-structure-sheaf).

- **`tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`.** The affine full-level-three family over Z[1/3] with its finite étale GL₂(F₃)-torsor over Ell, preserving the determinant/residue-field action needed at p=2. Consumers: [Level-three Galois extension](#ch-12-modular-level-galois), [Supersingular Morava comparison](#ch-12-supersingular-galois).

- **`RefinedTraceMethods:RT.2`.** Prove the trivial-action Segal comparison S→S^tC_p exhibits S^tC_p≃S_p^∧, with its chosen comparison map. The current tate-p-local-properties node lists this only as an acceptance example; its theorem and proof steps establish p-completeness, not the Segal conjecture. Consumers: [Nonzero raw Tate spectra](#ch-9-nonzero-tate-examples).

## Sources and reading record

All statements and proof sketches above are written for the targets of this roadmap in our own words. Page numbers refer to the indicated public manuscript unless printed journal pages are explicitly given. The packet stores access dates, content hashes and the sections actually read. Sources cited only through another paper are identified as missing original proof extractions in the obligations; they are not claimed read. No restricted source was used.

- **LMMT24** — Markus Land, Akhil Mathew, Lennart Meier and Georg Tamme. [Purity in chromatically localized algebraic K-theory](https://arxiv.org/pdf/2001.10425v5). arXiv:2001.10425v5, 18 December 2023; JAMS 37 (2024). Read: Introduction, pp.3–4, for the commutative-ring height convention. §2.1–2.2, pp.6–10; Remark 3.9, pp.15–16; §4.2, pp.19–21; §4.3 and Corollary 4.21 with proof, pp.21–22.

- **HS98** — Michael J. Hopkins and Jeffrey H. Smith. [Nilpotence and stable homotopy theory II](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf). Annals of Mathematics 148 (1998), 1–49. Read: Theorems 3,7,9,11, pp.2–6; preliminaries, p.9; §1.1–1.4, pp.10–14; Lemma 2.1 and §2.1–2.2, pp.15–19; Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21. The §4 periodicity construction is not audited (G2).

- **Rav84** — Douglas C. Ravenel. [Localization with respect to certain periodic homology theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf). American Journal of Mathematics 106 (1984), 351–414. Read: §2, definitions and Theorem 2.1 with proof, pp.360–363.

- **Kuhn08** — Nicholas J. Kuhn. [A guide to telescopic functors](https://arxiv.org/pdf/0802.0510). arXiv:0802.0510v1; Homology, Homotopy and Applications 10 (2008), 291–319. Read: Theorem 1.1, pp.3–4; §2.3, pp.7–9; §3.1 and Lemma 3.1, pp.9–11; §5, Theorem 5.2 and Lemmas 5.4–5.5, pp.15–18.

- **Kuhn04** — Nicholas J. Kuhn. [Tate cohomology and periodic localization of polynomial functors](https://arxiv.org/pdf/math/0307173). arXiv:math/0307173; Inventiones Mathematicae 157 (2004), 345–370. Read: Introduction, Theorem 1.5 and Corollaries 1.6–1.7, manuscript pp.4–6; §4 and Lemma 4.1, pp.15–17.

- **CM17** — Dustin Clausen and Akhil Mathew. [A short proof of telescopic Tate vanishing](https://arxiv.org/pdf/1608.02063v2). arXiv:1608.02063v2, 4 January 2017. Read: Entire paper, pp.1–4; Proposition 2.3, Lemma 2.4, Theorems 2.5–2.6 and Corollary 2.7.

- **Hahn22** — Jeremy Hahn. [On the Bousfield classes of H-infinity ring spectra](https://arxiv.org/pdf/1612.04386). arXiv:1612.04386v2, 20 July 2022. Read: §1–2, pp.1–4; §3, Theorem 3.3, p.5, Bockstein section Lemma 3.7, pp.6–7, and proof pp.7–8; §4 valuation argument and Proposition 4.7, pp.8–10.

- **CMNN22** — Dustin Clausen, Akhil Mathew, Niko Naumann and Justin Noel. [Descent and vanishing in chromatic algebraic K-theory via group actions](https://arxiv.org/pdf/2011.08233). arXiv:2011.08233v2, 8 November 2022. Read: §4.2, Theorem 4.6 and Lemma 4.7, manuscript pp.19–20. The numbering differs from the Lemma 4.5 cited in LMMT. Introduction, p.3, and Theorem 4.10 proof, p.21, for the finite-local blueshift input.

- **CSY20** — Shachar Carmeli, Tomer M. Schlank and Lior Yanovski. [Ambidexterity in chromatic homotopy theory](https://arxiv.org/pdf/1811.02057). arXiv:1811.02057v3, 16 September 2020. Read: Introduction, Theorem E; §5.4, Theorem 5.4.4 and Remark 5.4.5, pp.83–84.

- **BHM19** — Tobias Barthel, Gijs Heuts and Lennart Meier. [A Whitehead theorem for periodic homotopy groups](https://arxiv.org/pdf/1811.04030). arXiv:1811.04030v2, 17 July 2019. Read: §3, Theorem 3.1, p.5, and Lemmas 3.2–3.3, p.6.

- **MM16** — Akhil Mathew and Lennart Meier. [Affineness and chromatic homotopy theory](https://arxiv.org/pdf/1311.0514). arXiv:1311.0514v5, 24 June 2016. Read: §4, Theorems 4.5–4.7 and Corollary 4.8, pp.26–27; §7, Theorems 7.1–7.2, pp.35–37, and Theorem 7.6, p.38.

- **Beh19** — Mark Behrens. [Topological modular and automorphic forms](https://arxiv.org/pdf/1901.07990). arXiv:1901.07990, author chapter with section prefix 1. Read: §1.2, pp.4–8; Theorem 1.3.2, pp.9–10; §1.3 discriminant localization, p.13; §1.4 permanent cycles, pp.16,21; §1.5, pp.21,23; §1.6 chromatic localizations, pp.27–32; Theorem 1.7.6, pp.33–34.

- **Goe10** — Paul G. Goerss. [Topological modular forms [after Hopkins, Miller, and Lurie]](https://numdam.org/item/AST_2010__332__221_0.pdf). Astérisque 332 (2010), 221–255, Séminaire Bourbaki 1005. Read: Theorem 1.2 and Definition 1.3, pp.224–225; §3.3 and Theorem 3.6, pp.238–239. Its tmf naming is translated to Tmf in this plan.

- **ABS64** — Michael F. Atiyah, Raoul Bott and Arnold Shapiro. [Clifford modules](https://www.math.ens.psl.eu/~benoist/refs/ABS.pdf). Topology 3, Supplement 1 (1964), 3–38. Read: §6, Propositions 6.8 and Theorem 6.9, pp.15–16; §11, Theorem 11.5, pp.28–29.

- **ACB** — Omar Antolín-Camarena and Tobias Barthel. [A simple universal property of Thom ring spectra](https://arxiv.org/pdf/1411.7988). Public arXiv:1411.7988 PDF accessed 19 October 2026. Read: §3, Definition 3.1/Corollary 3.2, p.10; Theorem 3.5/Corollary 3.9, p.11; Lemma 3.15 and Proposition 3.16, pp.13–14; §5, Theorem 5.1, pp.19–20, and Theorem 5.7, pp.21–22.

- **AKQ** — Gabriel Angelini-Knoll and J. D. Quigley. [A homological approach to chromatic complexity of algebraic K-theory](https://arxiv.org/pdf/1908.09164). Public arXiv:1908.09164 PDF accessed 19 October 2026. Read: §2.1, Construction 2.1 and Lemma 2.2, pp.5–6; Proposition 2.22 and its proof, p.15.

- **BHLS23** — Robert Burklund, Jeremy Hahn, Ishan Levy and Tomer M. Schlank. [K-theoretic counterexamples to Ravenel’s telescope conjecture](https://arxiv.org/pdf/2310.17459v1). arXiv:2310.17459v1, 26 October 2023. Read: Introduction, Theorem A and the three localization categories, pp.2–5. Proof not audited; recorded as a gap.

## Validation and formalization status

The packet checker reports no errors or warnings. The node graph and the stage graph are acyclic, and all 34 routed-item mappings resolve. Definition/construction APIs and tests are included in both the packet and this document; planets are at most six per layer. All implementation statuses remain unchecked.

`lean-check research/blueprint/suggested/ChromaticHomotopyTheory.lean` elaborated at the pinned build with only the expected placeholder-proof warnings. It validates the types of the small formal-group fragment, not the spectral theorems in this roadmap. Before packaging a layer, discharge its listed proof gaps and obtain the requested supplier interfaces; missing spectral carriers must not be replaced by abstract stand-ins to enlarge the suggested file.
