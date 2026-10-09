# R09.2 — Hilbert and Quot functors

This layer constructs fixed-polynomial projective parameter schemes and their universal families. It then constructs morphism and isomorphism schemes from graphs, and bounds the scheme of polarized isomorphism pairs. The final targets supply the algebraic Chow and coherent dévissage inputs used by proper GAGA. Together these provide the parameter spaces consumed by arithmetic moduli and the scheme part of the proper comparison programme.

The development has five groups of targets: families and functors; the bounded construction and universal schemes; graph and polarized parameter spaces; the degree-one counterexample; and the algebraic inputs to proper GAGA. Definitions use the native sheaf, scheme and category structures, with the imported contracts below supplying polynomial bounds, coherent cohomology, projective geometry and descent. The accompanying suggested file proposes signatures and examples; it does not supply proofs of these results.

## Conventions and ownership

All moduli functors are defined on the opposite of the category of schemes over the base, including nonreduced and non-Noetherian test schemes. A quotient retains its epimorphism from the fixed source, modulo the unique isomorphism commuting with that epimorphism. A closed family retains its native ideal sheaf and closed immersion. A polarized arrow retains both the scheme isomorphism and the isomorphism of invertible sheaves.

Write X_T=X×_S T and π_T:X_T→T. On arbitrary tests, the sheaves in the quotient are finitely presented and quasi-coherent. On Noetherian schemes this is the coherent condition. Flatness of a sheaf over T means flatness of its stalks over the corresponding stalks of O_T. It does not require X_T→T to be flat. The support is the closed subscheme defined by the annihilator of the finite-presentation sheaf; properness of that support is a condition on its map to T.

Fix a relatively very ample invertible sheaf L and a rational polynomial P. The fibre polynomial means χ(X_t,F_t⊗L_t^n)=P(n) for sufficiently large n at every residue-field point t. R09.1 owns that polynomial, its field-extension invariance, relative Serre vanishing and uniform regularity. The suggested form expresses the eventual polynomial using finite-dimensional H⁰ and vanishing higher cohomology, so dimensions of infinite modules cannot accidentally satisfy it.

For projective representability the base is Noetherian and projective data are chosen. The general global conclusion uses a closed embedding into P(V) for a coherent finite-presentation sheaf V. A global free or vector-bundle ambient space requires the corresponding stronger presentation hypotheses. The core suggested signatures use chosen very ample embeddings. Results for relatively ample polarizations follow by taking a common positive power d making both polarizations very ample, while retaining the original line-bundle isomorphism in each polarized pair. Its graph polynomial is P_L(2dn), not P_L(2n) unless d=1.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native sheaves of modules, finitely presented sheaves, invertible sheaves, ideal-sheaf closed subschemes, scheme pullback, Over categories and Yoneda are reused throughout. The reviewed library audit leaves Hilbert/Quot unbuilt. Current upstream roadmaps and the current library were also checked on 9 October 2026 to avoid duplicating work absent from the atlas snapshot.

The imported owners are:

| Supplier | Contract consumed here |
| --- | --- |
| `AlgebraicModuliForArithmeticGeometry:R09.1` | Fibre Hilbert polynomials, relative vanishing and generation, uniform field-independent regularity for fixed quotient polynomial, and the family-tail theorem under arbitrary test-base change. |
| `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback` and `/fpqc-quasicoherent-descent` | The already accepted parent nodes for native quasi-coherent pullback and effective descent. These are existing nodes, not a forward dependency on an unplanned R09.3 target. |
| `SchemeAndStackFoundations:SF.0` | Coherent support, coherent extension, quasi-coherent pushforward and finite-presentation limits. The relative-flat-module descent supplement is the additional requested contract. |
| `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes` | Grassmannians of finite locally free quotient sheaves, their universal quotients, arbitrary base change and projectivity. |
| `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change` | The current Jacobian C/StableReduction J-C proper cohomology contract: finite complexes, coherent direct images, flat-sheaf cohomology/base change and the corepresenting Hom module. |
| `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity` | Relative Proj, projective bundles, relative ampleness and embeddings, projective completions, and proper immersion implies closed immersion. |
| Current upstream AlgebraicVectorBundles L0B–L0C | Native internal Hom, finite local freeness, determinant and coherent pullback comparisons. This roadmap is absent from the snapshot, so its actual owner is recorded in upstream notes rather than a fabricated atlas stage. |

ModularCurves 0F already owns affine finite-presentation Weil restriction for finite locally free sources. AlgebraicVectorBundles already owns the sheaf operations. This layer adds the projective-source graph and affine sheaf parameter-space theorems that use those operations. ComplexComparisonPartII C3 is a downstream consumer: its analytic comparison, full faithfulness and extension lifting are separate inputs to proper GAGA.

## Targets, APIs and tests

Within the following prerequisites, a local target name means its node in this R09.2 packet. Full external node and stage identifiers identify the imported owner. Tests give statements that a proposed definition must satisfy; their prototype examples have been elaborated, not computationally proved.

### 1. Families and their functors

Construct the families on arbitrary tests before choosing a representing scheme. The two coordinate quotients of k² and the dual-number tests enforce retention of the source map, ideal structure and relative-flatness condition.

#### Flatness of a sheaf over the parameter base

**Declaration:** `IsFlatOver`. **Node:** `relative-flat-module`.

For f:X→S and a quasi-coherent O_X-module F, IsFlatOver(f,F) means that for every affine open U⊆S and affine open V⊆f⁻¹(U), Γ(V,F) is flat over Γ(U,O_S), with scalar restriction along f#_{U,V}. This is equivalent to flatness of F_x over O_{S,f(x)} at every x. It is a property of the sheaf relative to f, not flatness of f itself.

**Hypotheses and conventions.** X and S arbitrary schemes; F quasi-coherent; no finite-presentation or Noetherian assumption.

**Construction or proof.**

1. Use the existing sheaf of modules and its sections, restricting scalars along the existing scheme map on affine sections.
2. Localization of flat modules proves the stalk criterion and its converse on affine covers.
3. Tensor-product pullback preserves relative flatness under every cartesian base change; an isomorphism of sheaves preserves it.

**API.**

- `IsFlatOver.affine_iff`: Relative flatness is equivalent to flatness of Γ(V,F) over Γ(U,O_S) for every pair of affine opens V⊆f⁻¹(U).
- `IsFlatOver.baseChange`: For any S′→S, the pullback F′ is S′-flat on X×_S S′.
- `IsFlatOver.iso_iff`: An O_X-module isomorphism F≅G identifies their relative-flatness predicates.
- `IsFlatOver.structureSheaf_iff`: IsFlatOver(f,O_X) if and only if Mathlib Flat(f).

**Unit tests.**

- `IsFlatOver.test_zero` (degenerate): For every f, the zero O_X-module is flat over S.
- `IsFlatOver.test_identity` (compatibility): O_X is flat relative to the identity X→X.
- `IsFlatOver.test_dualNumbers` (non-example): For A=k[ε]/ε² and the quotient A→k, k is not an A-flat module; its associated sheaf on Spec k is not flat over Spec A.
- `IsFlatOver.test_baseChange_closedPoint` (computation): Pulling that sheaf back along Spec k→Spec A makes it flat over Spec k.

**Uses.** R09.2 fixed-polynomial Quot and universal quotient: Flatness is imposed on the quotient sheaf and transported to every test base. ComplexComparisonPartII:C3 proper GAGA prerequisites: Keeps sheaf-flatness assumptions in cohomology separate from properties of the parameter scheme.

**Acceptance.** For F=O_X this agrees with the existing Flat(f) class. The zero sheaf is S-flat even when f is not flat.

**Prerequisites:** `mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:AlgebraicGeometry.Scheme.Hom.appLE`; `mathlib:Module.Flat`; `mathlib:AlgebraicGeometry.Flat`; `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 2–4; §3, Theorem 3.7, pp. 17–18. Quot families require flatness of the quotient sheaf over the test base; cohomology and base change use exactly this relative condition.

#### A fixed-polynomial flat quotient family

**Declaration:** `QuotFamily`. **Node:** `quotient-family`.

For separated finitely presented f:X→S, a finitely presented quasi-coherent E, an f-relatively very ample invertible sheaf L and P∈Q[t], a QuotFamily over T→S consists of a surjection q:E_T→F of O_{X_T}-modules, with F finitely presented and T-flat, support proper over T, and χ(X_t,F_t⊗L_t^n)=P(n) for every t and all sufficiently large n. Coherent on a locally Noetherian test scheme means finitely presented; for arbitrary T the finite-presentation condition is retained explicitly. No S-flatness of X or E is imposed.

**Hypotheses and conventions.** L and P fixed; arbitrary test schemes T; use proper support, not merely closed support. In the projective case proper support follows from projectivity of X_T→T.

**Construction or proof.**

1. Use the native sheaf pullback to form E_T and L_T; finite presentation and quasi-coherence are supplier/base-library conditions.
2. Use the support supplied by SF.0/coherent-scheme-support and the relative-flatness predicate.
3. Use R09.1 fibre Hilbert polynomials, with Euler characteristics only under finite-dimensionality and eventual higher-cohomology vanishing.

**API.**

- `QuotFamily.quotient`: Return q:E_T→F with its epimorphism proof and its actual target sheaf.
- `QuotFamily.kernel`: Return the kernel subobject of E_T; the source map is retained.
- `QuotFamily.pullback`: Every T′→T pulls q to a family over T′, using right exactness; the pullback kernel is the image of the pulled original kernel, without assuming E_T is T-flat.
- `QuotFamily.polynomial`: Every geometric or ordinary residue-field fibre has the prescribed polynomial relative to L.

**Unit tests.**

- `QuotFamily.test_zero` (degenerate): The zero quotient of every E gives a family with P=0.
- `QuotFamily.test_two_coordinate_quotients` (non-example): On X=S=Spec k with E=k², the two coordinate maps E→k have the same target and P=1 but distinct kernels.
- `QuotFamily.test_nonflat_source_allowed` (computation): For S=Spec(k[ε]/ε²), X=Spec k, E=O_X and T=Spec k, the identity quotient is a valid degree-one family although X→S and E over S are not flat.
- `QuotFamily.test_nonproper_support_excluded` (non-example): O_{A¹_k} as a quotient of itself is k-flat and finitely presented but is excluded from the proper-support Quot functor over Spec k.

**Uses.** Nitsure Theorem 5.1 and proof, pp. 24–28: The universal family reconstructs the functor from bounded Grassmannian quotients. PELModuli:M2 and AbelianSchemesAndArithmeticModuli:A0: Parameter spaces require quotient maps and flat families, not isomorphism classes of target sheaves alone.

**Acceptance.** Two different quotient maps to isomorphic target sheaves need not be the same family. The zero quotient has P=0; a sheaf with P=0 in this projective coherent context is zero.

**Prerequisites:** `relative-flat-module`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback`; `SchemeAndStackFoundations:SF.0/coherent-scheme-support`; `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`; `mathlib:CategoryTheory.Epi`; `mathlib:AlgebraicGeometry.IsProper`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 2–4; Theorem 5.1, p. 24. Families retain the surjection, finite presentation, flatness, proper support and fibre polynomial. The projectivity theorem allows a coherent source sheaf without a flatness hypothesis.

#### Quotient equivalence is equality of kernels

**Declaration:** `quotientEquivalent_iff_kernel_eq`. **Node:** `quotient-equivalence`.

For two epimorphisms q:E_T→F and q′:E_T→F′, equivalence means an O_{X_T}-module isomorphism a:F≅F′ with q followed by a=q′. Such an a, if it exists, is unique. It exists if and only if the kernel subobjects in E_T are equal. Pullback preserves this equivalence even when E_T is not T-flat; it does not identify inequivalent maps merely because F and F′ are isomorphic.

**Hypotheses and conventions.** The quotient maps are epimorphisms in the native abelian category of sheaves of modules.

**Construction or proof.**

1. Both epimorphisms are cokernels of their kernels in the native abelian category.
2. Equal kernels give the unique induced cokernel isomorphism; cancellation by an epimorphism proves uniqueness.
3. Right exactness transports the commuting isomorphism under pullback.

**Acceptance.** The two coordinate quotients k²→k remain different moduli points. Multiplying a fixed one-dimensional quotient map by a unit does not change its class.

**Prerequisites:** `quotient-family`; `mathlib:CategoryTheory.Limits.kernel`; `mathlib:CategoryTheory.Subobject`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 3–4. The functor identifies quotients by isomorphisms commuting with their source maps, equivalently by their kernels.

#### The fixed-polynomial Quot functor

**Declaration:** `QuotFunctor`. **Node:** `quot-functor`.

Quot^P_{E/X/S}:(Sch/S)^op→Sets sends T→S to QuotFamily(X_T→T,E_T,L_T,P) modulo the unique source-commuting isomorphisms. Pullback gives the maps. This is an fpqc sheaf and preserves filtered affine limits when f is quasi-compact, quasi-separated and finitely presented and E is finitely presented. Its fixed-polynomial condition is open and closed in the unbounded Quot functor in the projective setting.

**Hypotheses and conventions.** f separated and finitely presented; E finitely presented and quasi-coherent; L relatively very ample for polynomial assertions. All test schemes are admitted, including nonreduced and non-Noetherian ones.

**Construction or proof.**

1. Pass to the quotient setoid from quotient-equivalence; right exact pullback defines its functor maps.
2. Import fpqc quasi-coherent descent from R09.3. Finite presentation, epimorphy, relative flatness and proper support descend; fibre polynomials descend after residue-field extension.
3. Import SF.0 finite-presentation limits, supplemented by the requested descent of relative flatness of a finitely presented module. Descend the quotient and its surjectivity at a finite stage; fibre polynomials are locally constant by R09.1.

**API.**

- `QuotFunctor.points`: Its T-points are equivalence classes of the specified quotient families.
- `QuotFunctor.map_class`: The class of a family maps to the class of its pulled quotient.
- `QuotFunctor.zero_polynomial`: For projective f, P=0 gives the terminal functor; the unique quotient is zero.
- `QuotFunctor.fpqc_injective`: Pullback along a faithfully flat quasi-compact base cover is injective on quotient classes, as part of the imported effective descent contract.

**Unit tests.**

- `QuotFunctor.test_point` (computation): For X=S=Spec k, E=O and P=1, the functor is represented by Spec k.
- `QuotFunctor.test_zero` (degenerate): For projective X/S, Quot^0_E has exactly one point over every T.
- `QuotFunctor.test_coordinate_classes` (non-example): The coordinate quotient maps k²→k determine distinct Spec k-points.
- `QuotFunctor.test_unit_rescaling` (compatibility): A quotient map and its postcomposition with a target automorphism give the same class.

**Uses.** Nitsure Theorem 5.1: Representability is a natural bijection on quotient classes, not targets. AbelianSchemesAndArithmeticModuli:A0; PELModuli:M2: Provides a base-change-compatible parameter functor for subsequent moduli constructions.

**Acceptance.** No flatness assumption on E is inserted to make kernel pullback exact. A class retains its embedding of the kernel into E.

**Prerequisites:** `quotient-equivalence`; `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`; `SchemeAndStackFoundations:SF.0/finite-presentation-limits`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 3–7. The functor is defined by quotient classes and arbitrary base change. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.7, Lemma 7.7 (082Q), PDF pp. 19–20. Finite presentation of the quotient and relative flatness allow a quotient family and its equality to descend a filtered affine limit.

#### The fixed-polynomial Hilbert functor

**Declaration:** `HilbertFunctor`. **Node:** `hilbert-functor`.

Hilb^P_{X/S}(T) is the set of closed subschemes Z⊆X_T with Z→T flat, proper and finitely presented and fibre Hilbert polynomial P for L|Z. It retains the actual closed embedding, including its ideal and nilpotents. Pullback of ideal sheaves defines the functor on all test schemes.

**Hypotheses and conventions.** X→S separated finitely presented; L relatively very ample for the polynomial. Closed subschemes are native IdealSheafData, not subsets of points.

**Construction or proof.**

1. Use native ideal-sheaf closed subschemes and their arbitrary base change.
2. Use the finite-presentation/proper-support sheaf O_Z pushed along Z→X_T.
3. Flatness of O_Z over T is equivalent to flatness of Z→T; apply the structure-sheaf criterion.

**API.**

- `HilbertFunctor.points`: T-points are the stated native closed subschemes of X_T.
- `HilbertFunctor.pullback`: Every T′→T pulls the ideal and the flat proper finitely presented family to T′.
- `HilbertFunctor.ideal_iff`: Equality of Hilbert points is equality of native ideal sheaves, including their scheme structure.

**Unit tests.**

- `HilbertFunctor.test_empty` (degenerate): The empty subscheme is the unique P=0 Hilbert family when X/S is projective.
- `HilbertFunctor.test_point` (computation): For X=S=Spec k and P=1, only the whole point occurs.
- `HilbertFunctor.test_double_point` (non-example): Inside Spec(k[ε]/ε²), the reduced point has constant polynomial 1 whereas the whole double point has constant polynomial 2.

**Uses.** Grothendieck Bourbaki 221, §3: The universal closed family is recovered from the quotient of O_X. Hom/Isom graph construction in R09.2: Graphs must remember their closed embeddings and their infinitesimal structure.

**Acceptance.** A thickened point and a reduced point need not have the same Hilbert polynomial.

**Prerequisites:** `relative-flat-module`; `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback`; `SchemeAndStackFoundations:SF.0/coherent-scheme-support`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 4–7. Hilbert families are flat proper finitely presented closed subschemes with the prescribed polynomial. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.9, Definition 9.1 and Lemma 9.2 (0D00), PDF pp. 25–26. The definition uses closed subschemes on arbitrary test schemes and identifies their structure-sheaf quotients.

#### Hilbert is Quot of the structure sheaf

**Declaration:** `hilbertQuotIso`. **Node:** `hilbert-quot-comparison`.

There is a natural isomorphism Hilb^P_{X/S}≅Quot^P_{O_X/X/S}. A quotient O_{X_T}→F determines its kernel ideal and F≅O_Z; the inverse sends a closed family to O_{X_T}→i_*O_Z. Relative-flatness, proper support, finite presentation and fibre polynomial agree, under every base change.

**Hypotheses and conventions.** Same X/S, L and P on both sides.

**Construction or proof.**

1. An O_X-submodule of O_X is an ideal and its cokernel inherits a unique quotient algebra structure.
2. Use the native closed-subscheme/ideal correspondence and quotient-equivalence.
3. Identify the support and all fibres; use structureSheaf_iff to identify the flatness conditions.

**Acceptance.** The comparison identifies ideals rather than just underlying closed sets. It sends the zero quotient to the empty subscheme.

**Prerequisites:** `quot-functor`; `hilbert-functor`; `mathlib:AlgebraicGeometry.Scheme.Hom.ker`.

**Sources:** [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.9, Lemma 9.2 (0D00), PDF p. 26. Quotients of the structure sheaf are exactly closed subschemes, with the same family conditions.

### 2. Bounded construction and universal schemes

Uniform regularity belongs to R09.1. The new construction evaluates Grassmannian kernels, flattens the recovered cokernel and proves properness by the DVR extension. Local Plücker lines glue as the determinant of the universal twisted pushforward; properness and relative very ampleness then give the global coherent-bundle projectivity statement.

#### Flattening strata for a coherent projective sheaf

**Declaration:** `FlatteningStrata`. **Node:** `flattening-strata`.

For Noetherian S and coherent F on P^n_S, there is a finite set of numerical polynomials P and locally closed immersions S_P→S whose underlying sets partition S. For every T→S, F_T is T-flat with polynomial P exactly when T→S factors through S_P; the factor is unique. This is a universal scheme-theoretic flattening stratification, not a partition by ranks on points. The disjoint union need not be a closed subscheme or an open cover of S.

**Hypotheses and conventions.** F need not be S-flat; all test schemes T are included using finite-presentation limits.

**Construction or proof.**

1. R09.1 eventual cohomology yields finite presentations of the finitely many needed twisted pushforwards. Their rank loci give candidate locally closed strata.
2. Impose the remaining higher-twist relations as ideals; Noetherian stabilization produces the final scheme structure. Polynomial values at n+1 sufficiently large integers fix the polynomial.
3. Use the cohomology/flatness criterion with higher-cohomology vanishing, not constant fibre dimensions over nonreduced bases; extend the locally Noetherian proof to every T by the requested module-limit descent.

**API.**

- `FlatteningStrata.factor_iff`: A T-map factors through the P stratum iff the pulled sheaf is T-flat and has fibre polynomial P.
- `FlatteningStrata.unique_factor`: The factor through S_P is unique.
- `FlatteningStrata.baseChange`: Base changing each S_P represents the same flat-polynomial condition on the new base; density of strata is not asserted.
- `FlatteningStrata.partition`: The strata have disjoint underlying point sets and cover the base.

**Unit tests.**

- `FlatteningStrata.test_flat` (compatibility): For an already flat coherent family with one constant P on S, its P stratum is S.
- `FlatteningStrata.test_zero` (degenerate): For F=0, the only nonempty stratum is P=0 and it is S.
- `FlatteningStrata.test_dualNumbers` (non-example): For A=k[ε]/ε² and F=A/(ε) on P^0_A=S, the P=1 stratum is Spec k→Spec A, not S, although every fibre has dimension 1.

**Uses.** Nitsure proof of Theorem 5.1, pp. 25–28: Selects the universal reconstructed cokernel inside the Grassmannian that is flat with the desired P.

**Acceptance.** All polynomial strata are retained even if a chosen fixed P stratum is empty.

**Prerequisites:** `AlgebraicModuliForArithmeticGeometry:R09.1`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `SchemeAndStackFoundations:SF.0/finite-presentation-limits`; `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §4, Theorem 4.3 and proof, pp. 19–23. Locally closed polynomial strata universally detect flat pullbacks; their ideals encode more than the ranks of fibres.

#### Bounded Quot families in a Grassmannian

**Declaration:** `quotGrassmannMap`. **Node:** `quot-grassmann-map`.

Work over an affine Noetherian open of S with X↪P^n_S and a chosen O_X(-a)^p↠E. R09.1 gives m≫a, uniform for quotients with polynomial P, for which F(m) is generated and higher cohomology vanishes on every fibre. Then π_{T*}F(m) is locally free of rank P(m), commutes with every base change, and the quotient of the fixed finite free space H⁰(P^n,O(m-a))^p gives a point of the imported Grassmannian of rank-P(m) quotients. This transformation is injective. The evaluation of the Grassmannian kernel in E(m) reconstructs F(m) as a cokernel; flattening this universal cokernel gives its scheme-theoretic locally closed image.

**Hypotheses and conventions.** Noetherian affine base; specified projective embedding and finite presentation of E; m a uniform bound supplied by R09.1. Use the image of the pulled evaluation relations, without pretending kernel pullback is exact when E is not flat.

**Construction or proof.**

1. Import the Mumford regularity bound of Nitsure Theorem 2.3 from R09.1; obtain a bound depending only on the embedding, presentation and P.
2. Apply cohomology and base change under higher-cohomology vanishing; the uniform fibre regularity applies to every family over every test base.
3. Use ModularCurves 0G for the Grassmannian and its universal quotient; evaluation defines a universal cokernel. Its flattened P stratum represents exactly the original families.
4. Closed equations impose that a quotient of the presenting free sheaf factors through E. These are vanishing loci of morphisms into a flat coherent target, from Nitsure Theorem 3.5.

**API.**

- `quotGrassmannMap.rank`: The universal finite locally free quotient has rank P(m).
- `quotGrassmannMap.injective`: Equal Grassmannian quotient points give equivalent original E-quotients.
- `quotGrassmannMap.baseChange`: The map commutes with arbitrary base change, using the canonical cohomology comparison.
- `quotGrassmannMap.recovery`: The recovered evaluation cokernel is canonically isomorphic to the original quotient, commuting with E→F.

**Unit tests.**

- `quotGrassmannMap.test_point` (computation): For X=S=Spec k, E=k^p and P=r, this is the existing rank-r quotient Grassmannian map.
- `quotGrassmannMap.test_zero` (degenerate): P=0 maps to the unique rank-zero quotient and recovers F=0.
- `quotGrassmannMap.test_coordinates` (non-example): For E=k² and P=1, the coordinate quotients give different Grassmannian points.

**Uses.** Nitsure proof of Theorem 5.1: Gives a locally closed scheme representing fixed Quot, then the valuative criterion closes the immersion.

**Acceptance.** Increasing m beyond the bound yields the same Quot functor, not a new moduli object.

**Prerequisites:** `quot-functor`; `flattening-strata`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), Theorem 2.3, pp. 11–13; Theorem 3.5, pp. 16–17; proof of Theorem 5.1, pp. 25–28. Uniform regularity, cohomology/base change and closed factorization equations put fixed Quot inside a Grassmannian and recover the quotient from its evaluation relations.

#### Projective representability of fixed Quot

**Declaration:** `quot_projective`. **Node:** `quot-projectivity`.

Let S be Noetherian, X→S projective, L relatively very ample and E coherent. For each P∈Q[t], Quot^P_{E/X/S} is represented on all test schemes by a projective finitely presented S-scheme. No flatness of X/S or E/S is required. Here projective means an immersion as a closed subscheme of a projective bundle P(V) for a coherent finite-presentation sheaf V; a global immersion into P^N_S or P(V) with V locally free is claimed only under the corresponding global free or vector-bundle presentation hypotheses. The universal quotient is flat over its representing base, not an assertion that that base is flat over S.

**Hypotheses and conventions.** Projective/very ample data are fixed; polynomial may give the empty scheme. Use local free presentations on affine base opens and glue by the represented functor.

**Construction or proof.**

1. The bounded Grassmannian map and flattening give locally closed representability on base opens, compatible on overlaps.
2. Over a DVR R with fraction field K, extend q_K by the image of E_R→j_*F_K. It is coherent as a quotient of E_R, R-torsion-free and therefore R-flat; its support is proper and its special polynomial equals P. Any flat extension has the same saturated kernel, proving uniqueness.
3. The valuative criterion gives properness, closing the local Grassmannian immersions. For a common sufficiently large m, the universal sheaf has finite locally free pushforward V_m on Q, compatible with arbitrary base change. Import its determinant from current AlgebraicVectorBundles L0C. The intrinsic line det(V_m) restricts to the local Plücker line, so is relatively very ample. The projective-geometry contract embeds Q globally in P(q_*det(V_m)), with coherent q_*det(V_m). This supplies coherent-bundle projectivity without inferring a global free presentation from local ones; Nitsure 5.2–5.3 give the stronger variants.
4. The all-test-scheme statement follows from the representable construction plus quotient limit preservation, rather than extrapolating an argument restricted to locally Noetherian tests.

**Acceptance.** No X-flatness or E-flatness assumption appears. Do not replace the coherent projective-bundle conclusion by an unconditional global P^N embedding.

**Prerequisites:** `quot-grassmann-map`; `SchemeAndStackFoundations:SF.0/finite-presentation-limits`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `mathlib:AlgebraicGeometry.IsProper`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §5, Theorems 5.1–5.3, p. 24; Lemma 5.4 and proof, pp. 25–28. The fixed-polynomial Quot theorem and its global presentation variants are proved using Grassmannians and the unique DVR extension.

#### The Quot scheme and its universal quotient

**Declaration:** `QuotScheme`. **Node:** `quot-scheme`.

Choose the representing S-scheme Q for fixed-polynomial Quot, with the natural Yoneda identification and the universal quotient on X_Q corresponding to id_Q. Every T→Q pulls this quotient to the corresponding family, uniquely up to its source-commuting isomorphism. The sheaf in the universal quotient is Q-flat, finitely presented with proper support and polynomial P. For every S′→S, Q×_S S′ represents the pulled data, hence is canonically isomorphic to the Quot scheme of those data whenever that chosen model is available; this identification obeys identity and composition coherence.

**Hypotheses and conventions.** Noetherian S and the projective hypotheses of quot-projectivity; arbitrary S′ and T are allowed in the represented functor. Base-change representation remains meaningful without assuming S′ Noetherian.

**Construction or proof.**

1. Apply Yoneda to the representing functor and its identity point.
2. Naturality gives the universal family and all base-change maps, and uniqueness gives their coherence.
3. Projectivity, properness, separatedness and finite presentation belong to Q→S; Q-flatness belongs to its universal quotient sheaf.

**API.**

- `QuotScheme.represent`: Natural bijections Hom_S(T,Q)≃Quot^P(T).
- `QuotScheme.universal`: The actual universal epimorphism E_Q→F_Q, with Q-flat target and specified polynomial.
- `QuotScheme.pullback_universal`: Pullback along each T→Q is the family classified by that point.
- `QuotScheme.baseChange`: The pulled scheme represents Quot for the pulled X,E,L,P over every S′, with coherent natural isomorphisms.

**Unit tests.**

- `QuotScheme.test_point` (computation): For X=S=Spec k, E=O and P=1, Q≅S and the universal map is the identity.
- `QuotScheme.test_zero` (degenerate): For P=0, Q≅S and its universal target is zero.
- `QuotScheme.test_nonflat_parameter` (non-example): For S=Spec(k[ε]/ε²), X=Spec k, E=O_X and P=1, Q≅X with its nonflat closed immersion to S, while the universal family is flat over Q.

**Uses.** AbelianSchemesAndArithmeticModuli:A0 and PELModuli:M2: Imports the projective parameter scheme together with its universal flat quotient and base-change contract.

**Acceptance.** The dual-number example below disproves flatness of Q→S.

**Prerequisites:** `quot-projectivity`; `mathlib:CategoryTheory.uliftYoneda`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 5–7; Theorem 5.1, p. 24. Representability gives the universal quotient and its functorial pullback property.

#### The Hilbert scheme and its universal closed family

**Declaration:** `HilbertScheme`. **Node:** `hilbert-scheme`.

Under the same projective Noetherian hypotheses, Hilb^P_{X/S} is a projective finitely presented S-scheme H with a universal closed immersion Z→X_H. The map Z→H is flat, proper and finitely presented with polynomial P. Morphisms T→H correspond naturally to the specified closed families, and base change of H and Z represents the pulled functor on every new base. H→S need not be flat.

**Hypotheses and conventions.** Projective X/S with relative very ample L; no flatness of X/S.

**Construction or proof.**

1. Use Hilbert–Quot comparison with the native unit sheaf.
2. Recover the universal closed subscheme from the kernel ideal of the universal structure-sheaf quotient.
3. Use naturality and uniqueness of representing objects for arbitrary base change.

**API.**

- `HilbertScheme.represent`: Natural bijections Hom_S(T,H)≃Hilb^P(T).
- `HilbertScheme.universal`: The universal native ideal and closed immersion into X_H, with Z→H flat proper finitely presented.
- `HilbertScheme.baseChange`: The pair (H,Z) pulls to a representing scheme and universal family over every S′.
- `HilbertScheme.quot_compat`: Its universal O_X quotient agrees with QuotScheme for E=O_X through hilbertQuotIso.

**Unit tests.**

- `HilbertScheme.test_point` (computation): For X=S=Spec k, P=1, H≅S and the universal closed family is the whole point.
- `HilbertScheme.test_empty` (degenerate): For P=0, H≅S and the universal family is empty.
- `HilbertScheme.test_double_point` (non-example): Hilb^1_{Spec(k[ε]/ε²)/Spec k} is the double point itself, so an implementation retaining only its one geometric point fails.

**Uses.** R09.2 graph Hom/Isom: The universal closed family carries the first and second projections whose isomorphism loci define graph moduli.

**Acceptance.** Flatness is required of Z→H, not H→S.

**Prerequisites:** `hilbert-quot-comparison`; `quot-scheme`.

**Sources:** [Techniques de construction et théorèmes d'existence en géométrie algébrique IV : les schémas de Hilbert](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §3, Theorem 3.2 and construction, printed pp. 260–267. Hilbert is represented by a projective scheme with its universal closed family. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.9, Lemma 9.2, PDF p. 26. The structure-sheaf Quot comparison transports the universal quotient to the universal closed subscheme.

### 3. Graph and polarized parameter spaces

The Hilbert family projects to X_T. Requiring that projection to be an isomorphism recovers a morphism; requiring both projections gives an isomorphism. The graph polynomial is fixed only where a bounded piece is needed. Polarized arrows retain the line-bundle isomorphism, which bounds their graph polynomial.

#### The relative morphism functor

**Declaration:** `HomFunctor`. **Node:** `relative-hom-functor`.

For S-schemes X,Y, Hom_S(X,Y)(T)=Hom_T(X_T,Y_T), with the actual morphisms of schemes over T and cartesian pullback. If X/S is flat proper finitely presented and Y/S separated finitely presented, the graph transformation identifies this functor with an open subfunctor of Hilb_{X×_S Y/S}. A fixed graph polynomial is relative to a specified exterior product polarization, not just the polynomial of X with its original L_X.

**Hypotheses and conventions.** Functor itself uses arbitrary S-schemes; graph assertion uses the listed hypotheses. Representability here uses X projective flat, Y quasi-projective.

**Construction or proof.**

1. Use native Over categories and base change of their morphisms.
2. The graph is a closed immersion because Y/S is separated, and its source is flat proper finitely presented over T.
3. Projection to X_T recovers a graph morphism whenever that projection is an isomorphism.

**API.**

- `HomFunctor.points`: T-points are the native morphisms X_T→Y_T over T.
- `HomFunctor.pullback`: Maps are cartesian pullbacks and obey identity and composition.
- `HomFunctor.graph`: The graph point remembers the morphism and satisfies pr₁≅X_T; graph formation commutes with arbitrary base change.

**Unit tests.**

- `HomFunctor.test_terminal` (computation): Hom_S(X,S) is the terminal functor.
- `HomFunctor.test_empty_source` (degenerate): Hom_S(∅,Y) is terminal.
- `HomFunctor.test_nongraph` (non-example): For X=Spec k and Y=P¹_k, a two-point closed family in X×Y is not a graph because its first projection is not an isomorphism.

**Uses.** Grothendieck Bourbaki 221, §4(c): Maps of projective families are parameterized by their graphs. PELModuli:M2: Graph parameters are needed before imposing extra moduli equations.

**Acceptance.** A closed family with a nonisomorphic first projection is not a morphism point.

**Prerequisites:** `hilbert-functor`; `mathlib:CategoryTheory.Over`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §6.6, pp. 30–31. The morphism functor is realized by the graph-open part of the Hilbert scheme. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.12, Lemmas 12.1–12.2 (0D1A–0D1B), PDF pp. 31–32. The graph transformation is injective and represented by open immersions under proper-flat-source hypotheses.

#### The universal isomorphism locus of a proper family map

**Declaration:** `isomorphism_locus`. **Node:** `graph-isomorphism-open`.

Let X,Y be proper flat finitely presented over S and let u:X→Y be an S-morphism. There is an open U⊆S such that for every T→S, u_T is an isomorphism if and only if T→S factors through U. In the graph application both the universal closed family and X_H are proper flat finitely presented over H. Consequently the first-projection isomorphism locus is scheme-theoretically universal, including infinitesimal tests.

**Hypotheses and conventions.** No conclusion from merely bijective geometric points is substituted for being an isomorphism. Nitsure uses projectivity of u; the graph projection has it, and the general proper version follows the Stacks proof.

**Construction or proof.**

1. The fibre isomorphism condition is open for a map of proper flat finitely presented families.
2. Over this open the map is an isomorphism; prove the converse by its failure on fibres and its infinitesimal/finite-presentation criterion.
3. Arbitrary base-change universality follows from the locus characterization; finite-presentation descent covers non-Noetherian tests.

**Acceptance.** A finite nonreduced map with a one-point geometric fibre is not thereby an isomorphism.

**Prerequisites:** `SchemeAndStackFoundations:SF.0/finite-presentation-limits`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `mathlib:CategoryTheory.IsIso`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §6.5, pp. 30–31. A projective map between proper flat families has a universal open isomorphism locus. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.12, Lemma 12.2 (0D1B), PDF pp. 31–32. The graph-open condition is represented by an open subscheme on every test base.

#### Graph representability of Hom

**Declaration:** `hom_representable`. **Node:** `hom-representability`.

For Noetherian S, projective flat X/S and quasi-projective finitely presented Y/S, Hom_S(X,Y) is represented by the graph-open subscheme of the Hilbert scheme of X×_S Y, using a projective completion of Y and the open condition that the proper family lies in X×Y. It is separated and locally of finite presentation. For each fixed graph polynomial relative to L_X⊠L_Y the piece is quasi-projective of finite presentation over S. The full Hom scheme is not claimed quasi-compact or of finite type: for P¹→P¹ the degree components are unbounded.

**Hypotheses and conventions.** X→S flat, proper, projective and finitely presented; Y→S quasi-projective finitely presented. L_X,L_Y relatively ample, replaced by suitable very ample powers to use Hilbert schemes.

**Construction or proof.**

1. Embed Y in a projective completion and build the disjoint union of fixed-polynomial Hilbert schemes of the product.
2. A proper family contained in the open X×Y is an open condition; then impose the first-projection isomorphism locus.
3. Fixed-polynomial pieces are open in projective Noetherian Hilbert pieces, hence quasi-projective finite presentation; do not infer quasi-compactness of their infinite union.

**Acceptance.** A fixed graph polynomial is used wherever finite presentation is needed. Hom(P¹,P¹) includes maps of every nonnegative degree.

**Prerequisites:** `relative-hom-functor`; `hilbert-scheme`; `graph-isomorphism-open`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §6.3 and §6.6, pp. 29–31. Proper-support opens in projective completions and graph loci give the Hom scheme. [Techniques de construction et théorèmes d'existence en géométrie algébrique IV : les schémas de Hilbert](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §4(c), printed pp. 267–268. Morphisms are graph loci with fixed-polynomial finite-type pieces. [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), §108.10, Lemma 10.5 (0DPR), PDF pp. 16–17. The fixed graph-polynomial Hom piece is separated and of finite presentation.

#### The relative isomorphism functor

**Declaration:** `IsomFunctor`. **Node:** `relative-isom-functor`.

Isom_S(X,Y)(T) is the set of actual isomorphisms X_T≅Y_T in Sch/T; pullback defines the functor. Its graph in X_T×Y_T has both projections isomorphisms. It is not the presheaf that merely asserts X_T and Y_T are isomorphic.

**Hypotheses and conventions.** X,Y arbitrary S-schemes for the definition; projective flat finitely presented for the graph representation.

**Construction or proof.**

1. Use the native Over isomorphism type, retaining the inverse and the two inverse identities.
2. Pull back the isomorphism and its inverse.
3. The two graph projections recover the two directions uniquely.

**API.**

- `IsomFunctor.points`: T-points are actual native Over-category isomorphisms.
- `IsomFunctor.inverse`: Inversion interchanges Isom_S(X,Y) and Isom_S(Y,X), and squares to the identity.
- `IsomFunctor.toHom`: The underlying morphism gives an injective map to Hom_S(X,Y).
- `IsomFunctor.pullback`: Pullback commutes with inverse and composition.

**Unit tests.**

- `IsomFunctor.test_empty` (degenerate): Isom_S(∅,∅) is terminal.
- `IsomFunctor.test_two_points` (computation): For two disjoint k-points, the automorphism functor has the two permutation points over k.
- `IsomFunctor.test_nonlinear_map` (non-example): The degree-two map P¹→P¹ is a Hom point and not an Isom point.

**Uses.** AbelianSchemesAndArithmeticModuli:A0: Diagonals need actual isomorphisms and their pullback, not truth values. R09.2 polarized Isom: The underlying isomorphism is retained alongside an isomorphism of invertible sheaves.

**Acceptance.** Different automorphisms of the same family are different functor points.

**Prerequisites:** `relative-hom-functor`; `mathlib:CategoryTheory.Iso`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, pp. 6–7; §6.6, pp. 30–31. Isom retains the isomorphism and is selected from graphs by both projection-isomorphism conditions.

#### Graph representability of Isom

**Declaration:** `isom_representable`. **Node:** `isom-representability`.

For projective flat finitely presented X,Y over Noetherian S, Isom_S(X,Y) is represented by the open graph locus in Hilb_{X×Y/S} where both projections are isomorphisms. It is separated and locally of finite presentation. Its fixed graph-polynomial pieces are quasi-projective of finite presentation. Base change identifies the represented Isom functor on every test base; no quasi-compactness of the full unbounded Isom scheme is asserted.

**Hypotheses and conventions.** Both X/S and Y/S are flat and projective; retain the fixed product polarization.

**Construction or proof.**

1. Intersect the two universal isomorphism loci in the Hilbert scheme.
2. Use the graph reconstruction to identify its functor with IsomFunctor.
3. Restrict to a fixed Hilbert polynomial for the finite-presentation conclusion; Yoneda proves arbitrary base-change compatibility.

**Acceptance.** The underlying graph projections, not degree or geometric-point bijectivity alone, detect isomorphisms.

**Prerequisites:** `relative-isom-functor`; `hom-representability`; `graph-isomorphism-open`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §6.5–6.6, pp. 30–31. Intersecting the two graph projection conditions represents Isom. [Techniques de construction et théorèmes d'existence en géométrie algébrique IV : les schémas de Hilbert](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §4(c), printed pp. 267–268. The Isom graph construction yields finite-type pieces after fixing the polynomial.

#### Affine parameter spaces for coherent sheaf morphisms and isomorphisms

**Declaration:** `sheaf_isom_affine`. **Node:** `sheaf-isom-representability`.

For projective finitely presented f:X→S with Noetherian S, finitely presented E,F and F S-flat, the functor T↦Hom_{O_{X_T}}(E_T,F_T) is represented by an affine finitely presented S-scheme. If E also is S-flat, the functor of source-target isomorphisms is affine finitely presented over S: use a pair of morphisms in the two directions with their composite identities as closed equations. This parameter-space theorem imports the existing internal Hom; it does not define another internal Hom or replan finite-source Weil restriction.

**Hypotheses and conventions.** Projective X/S and a chosen relatively very ample sheaf are used for a coherent-source presentation. E need not be flat for Hom, but both sheaves are flat for Isom. For invertible source E the Hom proof also works with proper finitely presented X/S, because tensoring F with E∨ retains base-flatness.

**Construction or proof.**

1. On each affine base open choose a two-term presentation E19→E0→E→0 by sums of powers of the relative very ample invertible sheaf. Internal Hom from Ei to F is a twist of F, hence base-flat. The proper cohomology complex corepresents its H0; the cokernel of the two corepresenting modules corepresents Hom(E,F). Glue the affine linear schemes by the functor. For invertible E, the same argument uses F⊗E∨ directly and requires only properness.
2. For Isom use Hom(E,F)×Hom(F,E) and impose the two identities as closed vanishing loci.
3. Projection forgetting the inverse identifies its points with actual sheaf isomorphisms, and inversion is unique.

**Acceptance.** Do not assert that sheaf Isom is universally an open subscheme of this Hom scheme. For X=S and finite free sheaves this recovers the native matrix Hom and GL_r functors.

**Prerequisites:** `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `relative-flat-module`; `mathlib:AlgebraicGeometry.Scheme.Modules`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §3, Theorems 3.4–3.5, pp. 16–17. The projective coherent-source presentation and a flat target yield a corepresenting module and closed vanishing equations; an invertible source needs only proper cohomology. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.3, Proposition 3.10, PDF pp. 7–8; §99.4, Proposition 4.3 (08K9), PDF pp. 9–10. The general proper Hom and Isom statements imply this projective case. Our proof uses the elementary projective presentation, rather than silently importing the perfect-approximation argument in Lemma 3.9.

#### Isomorphisms of polarized families

**Declaration:** `PolarizedIsomFunctor`. **Node:** `polarized-isom-functor`.

For (X,L_X) and (Y,L_Y), PolarizedIsom_S((X,L_X),(Y,L_Y))(T) consists of pairs (a,α), where a:X_T≅Y_T over T and α:a*L_{Y,T}≅L_{X,T} is an actual O_{X_T}-module isomorphism. Pullback, identity, inverse and composition include the canonical pullback coherences for invertible sheaves. The forgetful fibre over a is the sheaf-Isom functor, not automatically a G_m-torsor over T: its automorphisms are Γ(X_T,O)^×.

**Hypotheses and conventions.** The definition retains α; neither existence of α nor numerical degree equality replaces it. Representation uses projective flat finitely presented families and relatively ample invertible sheaves.

**Construction or proof.**

1. Use the native scheme isomorphism and native invertible-sheaf objects.
2. Use the existing pullback isomorphisms to transport α through composition and base change.
3. Identify the forgetful fibre with Isom(a*L_Y,L_X), so its automorphisms are those of the invertible sheaf.

**API.**

- `PolarizedIsomFunctor.points`: Points are the actual pairs (a,α) with the stated direction of α.
- `PolarizedIsomFunctor.forget`: Forget α and retain the actual underlying scheme isomorphism.
- `PolarizedIsomFunctor.pullback`: Pullback carries both entries and commutes with their composition.
- `PolarizedIsomFunctor.fiber`: The fibre over a is precisely the native sheaf-isomorphism functor Isom(a*L_Y,L_X).

**Unit tests.**

- `PolarizedIsomFunctor.test_point` (computation): For X=Y=S=Spec k with trivial invertible sheaves, pairs over the identity are k×, not a singleton.
- `PolarizedIsomFunctor.test_disconnected` (non-example): For X=Y=Spec k⊔Spec k with trivial sheaves, the fibre over the identity is (k×)², not k×.
- `PolarizedIsomFunctor.test_empty` (degenerate): For X=Y=∅, the pair functor is terminal.
- `PolarizedIsomFunctor.test_degree_mismatch` (non-example): On P¹_k, no polarized isomorphism identifies O(1) with O(2), although the underlying scheme is isomorphic to itself.

**Uses.** AbelianSchemesAndArithmeticModuli:A0 and PELModuli:M2 diagonals: A scheme-level diagonal needs a bounded, base-change-compatible parameter space for polarized arrows.

**Acceptance.** A G_m fibre requires f_*O_X=O_S universally; it is not an unconditional assertion.

**Prerequisites:** `relative-isom-functor`; `sheaf-isom-representability`; `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Sources:** [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), §108.11, Lemma 11.1 (0DPT) and proof, PDF pp. 17–18. Polarized arrows retain a line-bundle isomorphism; their forgetful fibres are sheaf-Isom schemes.

#### Finite-presentation representability of polarized Isom

**Declaration:** `polarized_isom_representable`. **Node:** `polarized-isom-representability`.

For projective flat finitely presented X,Y over Noetherian S with relatively ample L_X,L_Y, the polarized pair functor is represented by a separated finitely presented S-scheme. Forgetting α is affine and finitely presented over Isom_S(X,Y). The graph of a polarized pair lies in the Hilbert piece with polynomial n↦χ(X_s,L_{X,s}^{2dn}) for the product polarization L_X^d⊠L_Y^d, where a common d>0 makes both powers relatively very ample; this polynomial is locally constant on S and takes finitely many values on quasi-compact S. Thus the polarized locus is quasi-compact although unrestricted Isom need not be.

**Hypotheses and conventions.** Noetherian (hence quasi-compact) S; relatively ample polarizations; both families flat.

**Construction or proof.**

1. Over the Isom scheme pull the universal a*L_Y and L_X; both are S-flat coherent sheaves on the proper source.
2. Use sheaf-isom-representability to represent α by an affine finitely presented scheme over Isom.
3. Polarization compatibility bounds the graph polynomial on the finitely many open-and-closed base pieces. Each graph piece is finite presentation; the affine sheaf-Isom map makes the total polarized scheme quasi-compact, separated and finitely presented.

**Acceptance.** No unconditional G_m-torsor statement appears. The line-bundle isomorphism bounds a graph polynomial; degree equality alone does not define the functor.

**Prerequisites:** `polarized-isom-functor`; `isom-representability`; `sheaf-isom-representability`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources:** [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf), §108.11, Lemma 11.1 (0DPT), PDF pp. 17–18. Affineness of the forgetful fibre and the fixed doubled-polarization graph polynomial prove separated finite presentation.

### 4. A parameter-flatness counterexample

The degree-one Hilbert scheme identifies the precise distinction between flat universal families and flat parameter maps. The example is functorial on all test schemes, including infinitesimal ones.

#### A nonflat Hilbert parameter with flat universal family

**Declaration:** `hilbert_one_iso`. **Node:** `dual-number-parameter`.

For every projective finitely presented X→S, Hilb^1_{X/S}≅X: a degree-one flat proper finite-presentation closed family is finite locally free of rank one, hence isomorphic to T, so is the graph of a T-point of X. In particular for A=k[ε]/ε², S=Spec A and X=Spec(A/(ε)), both Hilb^1 and Quot^1_{O_X} are X→S and are not S-flat; their universal closed family is X→X, which is flat. The statement is scheme-theoretic for every T, not only geometric points.

**Hypotheses and conventions.** Constant polynomial 1 with a relative ample sheaf; projective X/S. The quotient A→k is nonflat since the kernel of multiplication by ε in A does not stay exact after tensoring with k.

**Construction or proof.**

1. Polynomial 1 gives zero-dimensional length-one fibres; proper quasi-finite then finite, and flat finite-presentation makes the family finite locally free rank one.
2. The native rank-one finite-flat isomorphism criterion identifies the family with T; its embedding is a graph in X_T.
3. Apply the Hilbert–Quot comparison and compute the closed-point map over the dual numbers.

**Acceptance.** For all A-algebras B, a rank-one flat quotient B/εB forces εB=0 and hence the unique family exists precisely when Spec B factors through X. This disproves the parent gap’s tempting but false flat-parameter inference.

**Prerequisites:** `hilbert-scheme`; `hilbert-quot-comparison`; `mathlib:AlgebraicGeometry.Scheme.Hom.isIso_iff_finrank_eq`.

**Sources:** [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1), §1, p. 5, Hilbert examples; §5, Theorem 5.1, p. 24. The degree-one Hilbert functor records points while the universal-family condition concerns flatness over the parameter. [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), §99.9, Definition 9.1 and Lemma 9.2, PDF pp. 25–26. The family is flat over the test base; the parameter morphism is not required to be flat.

### 5. Algebraic inputs to proper GAGA

Chow supplies projective domination of a proper scheme and a dense isomorphism open. Support powers and coherent dévissage retain nilpotent thickenings. These targets provide algebraic ingredients to C3; they do not replace its analytic or Ext¹ comparisons.

#### A projective Chow modification

**Declaration:** `ChowModification`. **Node:** `chow-modification`.

For Noetherian S and separated finite-type X→S, choose a proper surjective projective π:X′→X, an open U⊆X containing the generic point of every irreducible component, an isomorphism π⁻¹U≅U, and an S-immersion X′→P^n_S. Thus X′ is quasi-projective over S. If X→S is proper, the immersion is closed and X′ is projective over S. If X is reduced, X′ may be chosen reduced. The construction is a choice, not a canonical functor; base change preserves properness, surjectivity, projectivity and the isomorphism over U_T, while U_T need not be dense.

**Hypotheses and conventions.** Noetherian base; X separated finite type, with no reduced or irreducible assumption. Projective domination does not imply X itself projective.

**Construction or proof.**

1. Choose finitely many affine quasi-projective opens containing the generic points; take graph closures of their product projective embeddings.
2. The graph closure supplies the dense isomorphism open and the projective proper surjective map.
3. Proper X/S makes X′/S proper; a proper immersion into projective space is closed. Use the reduced closure when X is reduced.

**API.**

- `ChowModification.cover`: The map π is proper, surjective and projective, and X′ has the chosen projective-space immersion.
- `ChowModification.iso_open`: π is an isomorphism over the specified open U, which contains every generic component.
- `ChowModification.proper_source`: If X/S is proper then X′/S is projective.
- `ChowModification.baseChange`: After every T→S the pulled map is proper surjective projective and isomorphic over U_T; density is retained only under additional hypotheses.

**Unit tests.**

- `ChowModification.test_projective` (compatibility): For a chosen closed S-embedding X↪P^n_S one may choose X′=X and π=id with U=X; mere coherent-bundle projectivity is not used to assert such an embedding.
- `ChowModification.test_empty` (degenerate): For X=∅ the identity of the empty scheme is a Chow modification.
- `ChowModification.test_disjoint` (computation): For X a disjoint union of two projective k-schemes, identity covers both generic components; choosing only one component is not surjective.
- `ChowModification.test_density_basechange` (non-example): An open isomorphism locus U can pull back to the empty open under a base map whose image is in its complement; universality does not include density.

**Uses.** SGA 1 XII, Theorem 4.2, pp. 247–249: Projective Chow covers produce coherent test sheaves with controlled higher direct images. ComplexComparisonPartII:C3/repair-relative-proper-gaga: Supplies algebraic projective domination for the proper-GAGA proof; analytic comparison is owned by C3.

**Acceptance.** Retain all generic components; do not assume X integral. No arbitrary-base-change density claim is made.

**Prerequisites:** `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `mathlib:AlgebraicGeometry.IsNoetherian`; `mathlib:AlgebraicGeometry.IsProper`; `mathlib:AlgebraicGeometry.Surjective`.

**Sources:** [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf), §30.18, Lemma 18.1 (0200) and Remark 18.2 (0201), PDF pp. 47–49. Chow gives a proper projective surjection from a quasi-projective scheme, an isomorphism on a dense open and projective source when X is proper.

#### Coherent support reduction and finite filtrations

**Declaration:** `coherent_support_filtration`. **Node:** `support-power-filtration`.

On a Noetherian scheme X, if coherent F is supported in V(I) for a quasi-coherent ideal I, then I^n F=0 for some n. The I-adic filtration therefore has finitely many coherent quotients annihilated by I, each a pushforward of a coherent module on the closed subscheme V(I). Every coherent F also has a finite filtration whose nonzero quotients are i_*G for integral closed subschemes i:Z→X and coherent G on Z with generic stalk a one-dimensional κ(η_Z)-space. These statements allow reductions through nonreduced thickenings; support containment does not imply IF=0.

**Hypotheses and conventions.** X Noetherian, not merely locally Noetherian without quasi-compactness. I-adic exponent may depend on F.

**Construction or proof.**

1. On finitely many affine opens use finite generators and the radical-support criterion to obtain a uniform power of I killing F.
2. Use the canonical I^jF subobjects and native exact sequences; annihilation descends quotient modules to the closed subscheme.
3. For a generic component choose one residue-field line, extend it coherently by SF.0/coherent-extension, and remove it by a subquotient; Noetherian induction and finite-module filtrations terminate.

**Acceptance.** For k[ε]/ε², F=O is supported on the reduced point but εF≠0 and ε²F=0. Nonreduced support is handled by a finite filtration, never by replacing F with its restriction to the reduction.

**Prerequisites:** `SchemeAndStackFoundations:SF.0/coherent-scheme-support`; `SchemeAndStackFoundations:SF.0/coherent-extension`; `mathlib:CategoryTheory.Subobject`; `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources:** [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf), §30.10, Lemma 10.2 (01Y4), PDF pp. 25–26; §30.12, Lemma 12.3 (01YF), PDF pp. 29–30. A coherent supported sheaf is killed by an ideal power and has a finite filtration by sheaves generically of residue-field rank one on integral closed supports.

#### Coherent dévissage on integral supports

**Declaration:** `coherent_devissage`. **Node:** `coherent-devissage`.

Let X be Noetherian and K a replete class of coherent O_X-modules containing zero and satisfying two-out-of-three for every short exact sequence. Suppose that for each integral closed Z⊆X with generic point η there is G∈K supported on Z with G_η a one-dimensional κ(η)-vector space (in particular annihilated by the maximal ideal of O_{X,η}). Then every coherent sheaf on X lies in K. If K is also closed under direct summands, it suffices that G_η be a nonzero finite-dimensional κ(η)-space. The support requirement is essential; the latter condition is a residue-field vector-space condition, not just nonzero generic length over O_{X,η}.

**Hypotheses and conventions.** Noetherian X; closure under isomorphism and zero explicit. The support of each witness is contained in Z and its nonzero generic stalk makes it equal to Z.

**Construction or proof.**

1. Use support-power-filtration and reduce to a coherent sheaf generically rank one on an integral support.
2. The witness and the target agree generically, hence on an open neighbourhood of η. Extend the comparison coherently; its kernel and cokernel have proper closed support and are handled by Noetherian induction.
3. For generic rank r>0 compare the witness with r copies of a generically rank-one target modulo lower support; exact closure puts that direct sum in K, and direct-summand closure recovers the target.

**Acceptance.** On two disjoint k-points, equality of the two component lengths defines a two-out-of-three class. The witness k⊕k has rank one at either point but is not supported on that singleton, so cannot justify the criterion. The direct-summand form handles higher-rank Chow test sheaves without falsely asserting generic rank one.

**Prerequisites:** `support-power-filtration`; `SchemeAndStackFoundations:SF.0/coherent-extension`.

**Sources:** [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf), §30.12, Lemma 12.6 (01YI), PDF pp. 31–32. The corrected dévissage criterion includes the specified support and generic residue-field rank one. [Éléments de géométrie algébrique III, première partie](https://www.numdam.org/article/PMIHES_1961__11__5_0.pdf), §3.1, Theorem 3.1.2 and Corollary 3.1.3, printed pp. 115–116. The exact-sequence and direct-summand criteria work with the support hypothesis used in the proof; the printed omission is recorded in sourceIssues.

#### Projective Chow test sheaves for dévissage

**Declaration:** `generic_projective_test_sheaves`. **Node:** `generic-projective-test-sheaves`.

For a proper finite-type scheme X over a field k and each integral closed i:Z→X, a projective Chow cover g:Y→Z and a sufficiently high twist of a very ample O_Y(1) give G=i_*g_*O_Y(n), coherent with support Z, with G_η a nonzero finite-dimensional κ(η)-space and R^qg_*O_Y(n)=0 for q>0. Its generic rank may exceed one. Thus an exact two-out-of-three class additionally closed under direct summands and containing these G contains every coherent sheaf on X, by coherent-devissage. These are the algebraic test sheaves in the proper cohomological GAGA reduction.

**Hypotheses and conventions.** X proper finite type over k; Z integral and closed; n sufficiently large for the chosen g, not a uniform n for every cover. The analytic comparison and analytic pushforward are supplied by ComplexComparisonPartII:C3, and are not prerequisites of this algebraic theorem.

**Construction or proof.**

1. Use ChowModification for the integral proper Z and its projective Y; choose a relatively very ample sheaf on Y.
2. Relative Serre vanishing from R09.1 kills higher direct images for high twists. Generation on the nonempty generic fibre makes g_*O_Y(n) generically nonzero over κ(η).
3. Proper pushforward preserves coherence and the generic point is on the full support; apply the direct-summand dévissage criterion.

**Acceptance.** The cover need not make G generically rank one. This target supplies an algebraic input; it does not assert proper GAGA from Chow alone.

**Prerequisites:** `chow-modification`; `coherent-devissage`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `SchemeAndStackFoundations:SF.0/qcoh-pushforward`.

**Sources:** [SGA 1, Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2), §4, proof of Theorem 4.2, printed pp. 247–249 (original pp. 327–329). A projective Chow cover with high twists supplies nonzero generic coherent pushforwards; cohomological comparison is exact and passes to direct summands.

#### The support of the Chow adjunction defect

**Declaration:** `chow_unit_support`. **Node:** `chow-unit-support`.

For a proper modification π:X′→X of Noetherian schemes that is an isomorphism over U, and a coherent F on X, the native adjunction unit F→π_*π*F has coherent kernel and cokernel supported on D=X∖U. They are annihilated by a power of an ideal defining D and can be treated on finite closed thickenings via support-power-filtration. This does not assert descent of every coherent sheaf along π, nor vanishing of higher direct images. In the proper-GAGA essential-surjectivity proof this is the algebraic support mechanism; the analytic unit, its coherence, proper comparison, full faithfulness and Ext¹ lifting remain separate C3 inputs.

**Hypotheses and conventions.** π proper finite type between Noetherian schemes; F coherent; no flatness of π required. A fixed native quasi-coherent ideal defining D is available.

**Construction or proof.**

1. Coherent pullback and proper coherent pushforward keep the unit in the coherent category.
2. Restrict to U and identify the unit with the identity through the open isomorphism; restriction is exact, so its kernel and cokernel restrict to zero.
3. Apply the ideal-power support lemma, keeping nilpotent thickenings; C3 then uses its own analytic and extension-comparison results.

**Acceptance.** A supported coherent kernel is not simply a sheaf on the reduced complement. No blanket proper-modification descent theorem is inferred.

**Prerequisites:** `chow-modification`; `support-power-filtration`; `AlgebraicModuliForArithmeticGeometry:R09.3/quasicoherent-pullback`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`; `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction`.

**Sources:** [SGA 1, Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2), §4, proof of Theorem 4.4, printed pp. 249–250 (original pp. 330–331). The unit defect is concentrated off the Chow isomorphism open; the proper-GAGA proof uses support induction and a separate extension step.

## Layer acceptance

Use the five imported contracts below with their stated hypotheses. The development must recover the quotient maps and native ideals from universal points, preserve them under arbitrary base change and pass every named unit test. The Quot/Hilbert parameter schemes must be projective of finite presentation without an added flatness hypothesis on X or E. The universal quotient or closed family must be flat over its parameter. The dual-number parameter example must remain nonflat over the original base.

The Grassmannian construction must use a genuinely uniform bound, recover the original quotient together with its source map and detect flatness scheme-theoretically over dual numbers. Constant dimensions at geometric fibres alone are insufficient. Coherent-bundle projectivity and global free projectivity must retain their different hypotheses.

Graph Hom and Isom must represent actual morphisms and inverses on arbitrary tests. Fixed graph-polynomial pieces must have the bounded conclusion; their unbounded union must retain only the locally finite-presentation conclusion. Polarized Isom must remember α, give (k×)² over the identity of two disjoint points, and exclude O(1) versus O(2) on P¹.

Chow must cover every component and retain the isomorphism open, with no universal-density claim after base change. The support reductions must use ideal powers, and generic witnesses in dévissage must have the specified closed support and residue-field module structure. Chow pushforwards have positive generic rank, which need not be one. C3 must supply the analytic and extension comparison steps before asserting proper GAGA.

## Supplier requests and integration

- **`AlgebraicModuliForArithmeticGeometry:R09.1`:** Use the existing R09.1 Hilbert-polynomial, relative Serre vanishing and Castelnuovo–Mumford regularity targets: polynomials on proper-support coherent fibres and their field-extension invariance; local constancy for flat finitely presented families; eventual vanishing and generation; and a field-independent uniform regularity bound for kernels in O^p on P^n with fixed polynomial (Nitsure Theorem 2.3, pp. 11–13). Export the bound for quotients of a chosen projective presentation, and the uniform family-tail theorem under arbitrary test-base change. None of these are new R09.2 definitions.
- **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`:** The current Jacobian Layer C/StableReduction J-C contract is proper finitely presented f over locally Noetherian S, coherent S-flat F, without assuming X/S flat: finite Grothendieck complexes on affine bases, coherent higher direct images, arbitrary-base-change maps, vanishing/surjectivity criteria giving locally free H0, and a corepresenting finite module for H0(F⊗M) when M is invertible. R09.2 combines these modules along a two-term projective presentation of a coherent E to corepresent Hom(E,F); it does not infer the general proper coherent-source theorem from a cohomology complex alone. Also use proper coherent pushforward for every coherent sheaf (no sheaf-flatness assumption for coherence), required by the Chow unit and test sheaves. Constant fibre dimensions on a nonreduced base alone must not imply local freeness; see sourceIssue E19.
- **`tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`:** Import current ModularCurves 0G: the relative Grassmannian of rank-r finite locally free quotients of a finite locally free sheaf, its native sheaf quotient, universal property, arbitrary-base-change identification and projectivity; on affine base opens use the free sheaf of sections of the chosen projective presentation. R09.2 supplies the additional evaluation relations and flattening locus, not a second Grassmannian.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`:** Import current StableReduction Layer 2 projective-geometry interface: relative Proj/projective bundles P(V) for coherent finitely presented V, O(1), projective and quasi-projective embeddings, relative very ampleness and its base change, projective completions, projective maps and the implication proper immersion→closed immersion. Keep the distinction between coherent V, locally free V and a globally free presentation in Nitsure 5.1–5.3. Export properness plus relative very ampleness as a global closed embedding in P(q_*M) for coherent q_*M, using a high power if needed. The Quot proof uses the native determinant/pullback contract already owned by current AlgebraicVectorBundles L0C, and the Plücker comparison owned by ModularCurves 0G; these are imports, not new definitions. No duplicate Proj, ampleness or finite-source Weil restriction is planned here.
- **`SchemeAndStackFoundations:SF.0`:** Supplement the existing finite-presentation-limits node with descent of relative flatness of a finitely presented module: for a filtered system A_i with colimit A, a finitely presented A_i-algebra B_i and finitely presented B_i-module M_i, if M_i⊗A is A-flat, then after increasing i the descended M_j is A_j-flat. Surjectivity of a descended map also eventually descends. Export the affine-cover scheme version for qcqs finitely presented X/S. This is the algebra step of Stacks 99.7.7 (082Q), PDF pp. 19–20, citing Algebra 10.168.1; it is not covered by merely descending flat scheme morphisms.

C3’s `repair-relative-proper-gaga` and `repair-proper-coherent-essential-surjectivity` should import the Chow, coherent dévissage, generic test-sheaf and unit-support targets here. Its analytic targets stay in C3. The R09.3 algebraic-space reduction is required before transferring the scheme-level results to algebraic spaces.

**Atlas planets:** Quot functor, Flattening stratification, Quot scheme, Hilbert scheme, Polarized isomorphisms, Chow lemma.

## Source corrections and versions

The following findings are stated in our own words and scoped to the actual texts read. The packet records access dates, SHA-256 checksums, correction searches and the effects on the plan. The published AMS chapter was unavailable; findings against Nitsure concern arXiv v1. The SGA finding concerns the electronic re-edition read.

- **E19 — arXiv:math/0504590v1, Theorem 3.7(3), printed p. 17 (error).** The preprint asserts local constancy of h^i implies local freeness of R^iπ_*F, with no reduced-base assumption. Use the cohomology/base-change surjectivity criterion, or impose the additional hypotheses of a valid constancy theorem; in the Quot construction use uniform higher-cohomology vanishing and Theorem 3.7(4)–(5). Let A=k[ε]/ε² and π:P¹_A→Spec A. The extension 0→O(-2)→F→O→0 with class ε is a vector bundle and hence A-flat. Its sole fibre has h0=1 and h1=1, so both functions are constant. The long exact cohomology sequence gives π_*F=ker(A --ε→ A)=εA, which is not locally free over A. No correction located in the arXiv history or searched primary pages; the version-of-record chapter was not read, so this is not a claim that the published chapter has the error.

- **E20 — Published EGA III1, §3.1, Theorem 3.1.2, printed pp. 115–116 (error).** The statement asks for a rank-one generic witness at each irreducible closed support without stating that the witness itself is supported on that closed set; its proof uses this support condition. For every integral closed Z, require a coherent witness G with Supp(G)=Z and G_η a one-dimensional κ(η)-space. For the direct-summand variant require a nonzero finite-dimensional κ(η)-space and the same support condition. On X=Spec k⊔Spec k let K be the coherent sheaves having equal component lengths. K contains zero and is two-out-of-three for short exact sequences. G=k⊕k is a rank-one generic witness at each singleton yet K excludes k⊕0. Requiring its support to be that singleton eliminates the false inference. Stacks Lemma 30.12.6, tag 01YI, states the correct criterion with support and maximal-ideal annihilation; no separate EGA publisher erratum located.

- **E21 — Electronic re-edition arXiv:math/0206203v2, XII proof of 4.4, display (*) on printed p. 250 (original margin p. 331) (misprint).** The displayed Ext comparison has the restriction q≠1, omitting the very degree required to algebraize an extension. Use the comparison in all nonnegative degrees q, in particular q=1 for the extension class. The next argument needs the Ext1 class of a short exact sequence. A statement excluding degree 1 cannot supply that lift. The preceding Ext comparison gives the required degree as well. No correction located for this electronic text in the arXiv history and re-edition project page; original printing and SMF publisher copy not checked.

- **E22 — arXiv:math/0504590v1, exercise after Remark 2.2, printed p. 11, third regularity implication (error).** The exercise claims that in 0→F′→F→F″→0, regularity of F at m and of F″ at m−1 forces regularity of F′ at m. Add surjectivity of H0(F(m−1))→H0(F″(m−1)); without this the H1 condition for F′ does not follow. The corresponding graded-module criterion cannot be copied to arbitrary exact sheaf sequences. On P¹, the exact sequence 0→O(-2)→O(-1)^2→O→0 has F 1-regular and F″ 0-regular, but H1(O(-2))≅k, so F′ is not 1-regular. This is the missing H0-surjectivity obstruction. No primary erratum located; finding scoped to the preprint because the AMS chapter could not be read.

- **E23 — arXiv:math/0504590v1, proof of Lemma 2.1(c), printed p. 11 (misprint).** The final generation argument says the vector space H0(P^n,F(r+p)) is generated by its global sections where it needs the sheaf F(r+p). Replace that occurrence by generation of the sheaf F(r+p) by its global sections. Surjectivity of multiplication on H0 then supplies generators of the stalks of F(r); the vector-space statement alone gives no sheaf-generation conclusion. No correction located in arXiv v1; published chapter not read.

## References read

- Nitin Nitsure, [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590v1). arXiv:math/0504590v1, 29 April 2005; preprint, not a claim about the FGA Explained version of record. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- Alexander Grothendieck, [Techniques de construction et théorèmes d'existence en géométrie algébrique IV : les schémas de Hilbert](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf). Séminaire Bourbaki 221, 1960/61, volume 6, pp. 249–276. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- The Stacks Project authors, [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf). Chapter 30, version ed88ff78, compiled 14 July 2026. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- The Stacks Project authors, [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf). Chapter 99, version ed88ff78, compiled 14 July 2026. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- The Stacks Project authors, [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf). Chapter 108, version ed88ff78, compiled 14 July 2026. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- Alexander Grothendieck, with Jean Dieudonné, [Éléments de géométrie algébrique III, première partie](https://www.numdam.org/article/PMIHES_1961__11__5_0.pdf). Publications Mathématiques IHÉS 11 (1961); printed pp. 115–116. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.
- Michèle Raynaud, [SGA 1, Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2). SMF Documents Mathématiques 3 (2003), arXiv:math/0206203v2 electronic re-edition; printed pp. 247–250, original margin pp. 326–331. Accessed 2026-10-09. The target citations above specify the theorem, section and page used.

This target pass needs no restricted book. Nitsure’s version-of-record chapter and the original SGA printing were not read; they are not used to assert that their printed statements contain the recorded findings. The target statements use the corrected forms and the supplier hypotheses specified above.
