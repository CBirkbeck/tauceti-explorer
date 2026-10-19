# Global shtukas and function-field Langlands

This roadmap constructs global shtuka geometry and its cohomological operators, proves the global parameterization for connected reductive groups, and proves the full GLr correspondence through rank induction. Its local endpoint compares the global parameters with finite restricted-shtuka excursions at every place. The rational, integral and torsion coefficient branches have separate hypotheses.

The packet is the target inventory; this document is the mathematical specification. Every target below states the object or theorem, its direct prerequisites, a construction or proof outline, and acceptance checks. Definitions and constructions include the API their consumers need and tests that distinguish plausible incorrect definitions. These are plans for mathematics to add to Tau Ceti. No target is represented as implemented.

## Conventions and scope

Let k=Fq have characteristic p, and let X/k be a smooth projective geometrically connected curve with function field F. Write g for its genus, A for its function-field adeles, and qv=q^deg(v). The generic group G/F is connected reductive; its model 𝒢/X is smooth affine with connected fibres and is reductive on a specified nonempty open. Constant split G is the initial case, with nonsplit descent stated explicitly. A full level N is a finite closed subscheme, retaining its nilpotents. A parabolic flag level is different data.

For sheaves use ℓ≠p, a finite sufficiently large extension E/Qℓ, its integers O_E and residue characteristic ℓ. A torsion coefficient ring means O_E/λ^s for a specified exponent. Geometric Frobenius is the inverse of arithmetic Frobenius. Fix one square root of q for half Tate twists, and use qv at a degree-deg(v) place. Normalized spherical functions include the orbit-dimension sign relating them to traces of perverse Satake sheaves. Adelic measures give the chosen hyperspecial subgroup volume one; additive local factors use the stated global differential and self-dual measures.

In a shtuka τ means pullback by id_X×Frob_S. Relative modifications, their ordered partition and bounds are part of the datum. A fixed Harder–Narasimhan bound is not invariant under every Hecke operator or partial Frobenius: maps may increase the bound, and the actions are taken on the directed cohomology system. A central lattice Ξ controls the degree directions which adjoint instability cannot bound. Rational stack points retain their automorphisms and their inner-form components.

Three finiteness conditions must remain distinct. An integral Hecke-finite vector lies in a finite O_E-module stable under every integral Hecke operator. The full cohomology can instead be finite over one local Hecke algebra while infinite over O_E. The untruncated cohomology ind-sheaf can be ind-smooth without being one finite-rank lisse sheaf. Likewise an excursion generalized eigenspace is not an assertion that the excursion algebra is reduced. Scalar spherical Hecke action in the characteristic-zero theorem uses its separate adjointness argument; the modular branch has generalized eigenvalues.

## Dependency boundaries and proof routes

GS.0 owns bundles on the curve and GS.1 owns the equal-characteristic BD Grassmannian, bounded Hecke stacks, fusion and classical Satake. The geometric prefix of GS.1 is usable before Satake and is exported with GS.0 to EndoscopicTransferAndUnitaryTraceComparison ET.2b. Since then the EndoscopicTransferAndUnitaryTraceComparison package (TauCetiRoadmap pull request #999) has moved Bun_G of a quasi-split reductive model on the fixed curve (its §3.1) and the local loop Grassmannian over any base field (its §3.2) into its own layers. GS.0 and GS.1 build on those sections, adding the parahoric models and the multi-leg geometry over X^I; the restructure entry records the retargeting. Function-field adeles, measures, reciprocity and automorphic function spaces come from FunctionFieldArithmetic; the shifted bundle interfaces and geometric cohomology remain here. ET.3 imports its adelic inputs from FA.2.

Algebraic vector bundles and their tensor/dual/determinant theory come from the current AlgebraicVectorBundles roadmap (Layers L0A–L2B); relative Grassmannians come from AlgebraicModuliForArithmeticGeometry §1.3. ReductiveGroups supplies algebraic-group and dual-root-datum conventions. Neither direction is re-planned. GeometricSatakeAndFusion has its own Fargues–Fontaine direction; it does not replace the classical equal-characteristic proof required here. DrinfeldModulesAndTModules DM.7 enters only the specialized elliptic-sheaf comparison, independently of multi-leg shtukas.

GS.2–GS.5 own global compact-support shtuka cohomology, Xue’s integral finiteness and Weil descent, and the geometric realization of excursions. LanglandsParameterStacks LP2 owns the abstract excursion presentation and reconstruction for arbitrary groups, including the finite L-group projection, continuity and complete reducibility contracts below. The geometric operators verify those contracts rather than reintroducing the abstract theory.

There are two GLr routes with different dependencies. The original GS.6 proof uses two-leg compactifications, lower-rank boundary analysis, the averaged trace formula and Deligne’s rank induction; it does not depend on GS.5. The GS.6 excursion comparison uses the already constructed global decomposition and lower-rank Rankin–Selberg theory. Neither route obtains Ramanujan as an assumption from a consumer of the GLr theorem. Class field theory supplies rank one. The converse theorem, the trace formula, multiplicity one and the analytic local and global factors are planned upstream in AutomorphicLFunctionsAndLocalFactors, layer AL.3 (gap G10). That layer (TauCetiRoadmap pull request #924) now plans the whole GLr correspondence at every level. Most GS.6 targets are therefore to be imported from it once the AL atlas packet stops citing GS.6; the restructure entry records this.

GS.7 constructs finite restricted shtukas and local excursion elements. General-base nearby cycles and Gabber specialization belong to the requested LPV.0 continuation. The local-shtuka cohomology of HS.2/HS.3 and the equal-characteristic ES.7 endpoint are imports with an explicit comparison obligation; they do not supply a blanket global uniformization theorem. General-group semisimple local parameters and the full GLr Weil–Deligne comparison, including monodromy, are distinct targets.

## Contact with the libraries

The planning baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations in the table were read at those revisions. An abstract Galois category is not a scheme recognition theorem; effective stack descent is not an algebraic atlas; the coefficient sheaf of continuous ℓ-adic maps is not a six-operation theory. Finite-dimensional Grassmannians and number-field adeles do not supply the corresponding global objects here.

| Pinned declaration | What is imported |
| --- | --- |
| `mathlib:AlgebraicGeometry.Scheme` | Schemes, the category in which the curve X, the Beilinson-Drinfeld Grassmannians and the shtuka varieties live. There is no algebraic-stack formalism above it in either library. |
| `mathlib:CategoryTheory.GaloisCategory` | Abstract pre-Galois-category axioms together with existence of a finite-set fibre functor; the scheme finite-étale recognition theorem is a supplier obligation. |
| `mathlib:CategoryTheory.Pseudofunctor.DescentData` | Descent data for a pseudofunctor along a family of maps, the pinned form of a descent datum; it is what the descent of bundles for nonsplit groups is stated against. |
| `mathlib:CategoryTheory.Pseudofunctor.IsStack` | Effective descent for a pseudofunctor on a site, with no algebraicity, representable diagonal or atlas assertion. |
| `mathlib:ExteriorAlgebra` | The existing exterior algebra carrier. Alternating-tensor vanishing models the linear algebra in Eichler–Shimura; the cohomological relation still needs Satake, fusion and the geometric leg operations. |
| `mathlib:LinearMap.charpoly` | Characteristic polynomials of endomorphisms of finite free modules and the existing Cayley–Hamilton comparison model. No finite-dimensional endomorphism of the whole shtuka colimit is assumed. |
| `mathlib:Module.Finite` | Finitely generated modules, in which Hecke-finiteness is stated: an element is Hecke-finite when it lies in a finitely generated O_E-submodule stable under all integral Hecke operators. |
| `mathlib:Submodule.FG` | A submodule equals the span of a finite set. Used for the integral stable-lattice definition in the suggested file; a finite-dimensional E-span is not a substitute. |

Current upstream was checked separately from these pins: TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current library has `AlgebraicGeometry.Scheme.FiniteLocallyFreeSheaf` with additive/tensor structure, ahead of the planning baseline. Import that existing work through AlgebraicVectorBundles; its current-only registry integration is recorded in the SF.1 request. LocalGaloisGroups concerns finite extensions of Qp and is not the equal-characteristic Weil-group supplier. These scope checks add no new plan for an existing upstream roadmap.

The accompanying suggested file contains only light real-bodied definitions over existing carriers, milestones statable at the pins and a few examples. It checks the integral stable-submodule condition, its finite witnesses and functoriality, a monic recurrence, the existing characteristic-polynomial theorem, the nonintegral inverse-ℓ counterexample, and a Jordan-block generalized eigenvector. All geometric definitions, theorems, API and tests remain targets in this document. The file elaborates at the pins; that checks its signatures and does not prove the roadmap.

## GS.0 — Bundles, levels and adelic geometry

Build the moduli interface while importing the underlying bundle and arithmetic libraries. Distinguish full level from Iwahori flags, weighted stack volumes from unweighted counts, and adjoint instability from central degree. The shifted-HN and twisted-inner-form source obligations are stated where they enter.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- Bundle statements apply over arbitrary k-schemes S; HN boundedness keeps central degree or its lattice quotient. Iwahori and shifted-HN statements use their specified GLn or PGL2 specialization.

Atlas planets: Bundles on a curve; Level structures; Harder–Narasimhan filtration; Adelic uniformization; Cuspidal automorphic forms.

<a id="gs-0-bun-g-of-the-global-curve"></a>

### Bundles on the global curve

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve` · construction.

For X/Fq smooth projective geometrically connected and a smooth affine model 𝒢/X with connected fibres and reductive generic fibre G, Bun_𝒢(S) is the groupoid of fppf-locally trivial 𝒢-torsors on X×S and equivariant isomorphisms. It is an Artin stack locally of finite type with affine diagonal. Its geometric stabilizers are affine finite-type group schemes; stabilizers of rational objects have finitely many Fq-points.

**Direct prerequisites:** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`.

**Construction or proof.**

1. Use effective fppf descent for torsors, including descent of arrows.
2. For GLn import algebraic vector bundles and construct bounded Quot atlases; for the smooth model use a faithful representation and reductions of structure group.
3. Represent the isomorphism sheaf by sections of the associated affine bundle. Apply properness of X and finite presentation to obtain the diagonal and stabilizer assertions.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BunG` | data | The fppf stack of torsors on X×S. |
| `BunG.pullback` | functoriality | Pull back objects and arrows along S′→S with coherent composition. |
| `BunG.atlas` | structure | A smooth surjective atlas locally of finite type. |
| `BunG.isom` | characterisation | Represent the affine isomorphism sheaf, including all stabilizers. |

**Consumers.**

- GS.1 global Hecke stacks: Source and target bundles are objects of this stack.
- GS.2 Frobenius equalizer: The closing isomorphism is a stack fibre product, retaining automorphisms.

**Unit tests.**

- BunG.gl1_picard_stack_automorphisms (computation): For GL1 the result is the Picard stack, with automorphism group Fq× at every rational line bundle.
- BunG.trivial_torsor_automorphisms (compatibility): For a constant G the trivial torsor has rational automorphism group G(Fq).
- BunG.not_finite_type_fixed_degree (non-example): On P¹, the degree-zero GL2 bundles O(m)⊕O(−m), m≥0, have unbounded instability; fixing degree alone does not give a finite-type stack.

**Acceptance checks.**

- Keep the stack, its rational groupoid and its set of isomorphism classes distinct.
- GLn torsors recover the imported rank-n vector bundles.
- For a quasi-split reductive model this is the fixed-curve stack of EndoscopicTransferAndUnitaryTraceComparison §3.1 (CurveBundles, TauCetiRoadmap pull request #999). This node adds the parahoric connected-fibre models, the affine diagonal and the stabilizer statements, and agrees with §3.1 on the reductive case.

**Sources.**

- [Yakov Varshavsky, Moduli spaces of principal F-bundles](https://arxiv.org/pdf/math/0205130v2), §2, Notation 2.1(a), p. 4.
- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §12.1, p. 148.

<a id="gs-0-deformation-complex-and-smoothness"></a>

### Deformations of bundles

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/deformation-complex-and-smoothness` · theorem.

At a 𝒢-bundle E, infinitesimal automorphisms, tangent classes and obstructions are H⁰(X,ad E), H¹(X,ad E), H²(X,ad E). The last vanishes on the curve, so Bun_𝒢 is smooth of local dimension −χ(X,ad E). For constant reductive G this is (g−1)dim G; a ramified model uses its actual adjoint-bundle Euler characteristic.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`.

**Construction or proof.**

1. Describe torsor lifts on an affine cover by Čech 1-cocycles with coefficients ad E; changes of lift are 0-cochains.
2. Use vanishing of H² of a coherent sheaf on X for smoothness. Riemann–Roch gives the dimension, subtracting automorphisms.
3. For Iwahori PGL2 add one flag dimension at each geometric level point, obtaining 3(g−1)+deg Σ.

**Acceptance checks.**

- H⁰ is the Lie algebra of the stabilizer, not its group of points.
- For Gm obtain dimension g−1 although Pic⁰ has dimension g.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §5.4.1, Proposition 5.17(1), p. 63 (arXiv v2).

<a id="gs-0-level-structures"></a>

### Full level structures

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures` · definition.

For a finite closed subscheme N⊂X, Bun_{𝒢,N}(S) consists of a bundle E and a trivialization E|N×S≃𝒢|N×S. Forgetting the trivialization is a torsor under Res_{N/Fq}(𝒢|N), hence representable smooth and surjective. Full congruence level and parabolic flags are different moduli data.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve).

**Construction or proof.**

1. Descend the trivialization with the torsor.
2. Identify changes of trivialization with the Weil-restriction action and check simple transitivity fppf locally.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BunG.level` | data | Bundle with a specified full trivialization on N. |
| `BunG.level.forget` | functoriality | Forget full level or restrict it to N′⊂N. |
| `BunG.level.torsor` | characterisation | Identify the change-of-trivialization group scheme. |

**Consumers.**

- GS.2 and GS.7: Level structures define global towers and the comparison with finite restricted shtukas.

**Unit tests.**

- BunG.level_empty (degenerate): N=∅ gives Bun_𝒢.
- BunG.level_principal_congruence (compatibility): For GLn at a rational reduced point the level group is GLn/Fq; rational principal congruence level is ker(GLn(Ov)→GLn(κv)).
- BunG.level_retains_nilpotents (non-example): For Gm at 2v, units 1+πa survive modulo π²: replacing N by its reduction loses level information.

**Acceptance checks.**

- The finite subscheme retains nilpotents.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, (1.1), p. 41; §2, Definition 2.1, p. 52.

<a id="gs-0-iwahori-bundles-and-fractional-twists"></a>

### Iwahori flags and fractional twists

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/iwahori-bundles-and-fractional-twists` · definition.

Bun_n(Σ) consists of rank-n bundles with, at each x∈Σ, a periodic chain E⊃E(−x/n)⊃⋯⊃E(−x), whose n successive quotients are line bundles on x×S. Extend the chain periodically to define fractional twists E(D) for D supported at the level with coefficients in (1/n)Z; for nonrational points use the chosen residue-field sections over S∞. Bun_PGLn(Σ) is the Picard-stack quotient. Fractional twisting induces Atkin–Lehner automorphisms.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use the imported bundle carrier; define flags by locally free successive quotients, with no generic-position condition.
2. Rotate the periodic lattice chain to implement a 1/n twist; integral rotations tensor by O(x).
3. Descend tensoring and fractional rotation through the Picard action, using residue-field base changes for infinity coefficients.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IwahoriBundle` | data | The periodic lattice chain, its inclusions and quotient line bundles. |
| `IwahoriBundle.twist` | functoriality | Add allowed fractional divisors, with twist(D+D′)≃twist(D)∘twist(D′). |
| `IwahoriBundle.pglQuotient` | equivalence | Quotient simultaneous tensoring by a line bundle. |
| `IwahoriBundle.atkinLehner` | compatibility | On the PGLn quotient, n rotations at x are the identity. |

**Consumers.**

- YZ Definition 3.5 and GS.2: The infinity twist follows Frobenius and the Hecke maps preserve every flag step.
- YZ Proposition 5.17: Flag dimensions contribute deg Σ to the PGL2 bundle stack.

**Unit tests.**

- IwahoriBundle.rank_one_twist (computation): n=1 adds no flag choice and a unit twist is tensoring by O(x).
- IwahoriBundle.half_twist_squared (computation): For n=2 the half-twist at x replaces the chain E⊃E(−x/2)⊃E(−x) by E(x/2)⊃E⊃E(−x/2), where E(x/2)=E(−x/2)⊗O(x); doing it twice gives tensoring by O(x), so on PGL₂ it is an involution, the Atkin–Lehner involution at x.
- IwahoriBundle.flag_dimension_closed_point (non-example): A flag at a degree-d closed point has d geometric flag parameters after splitting; counting only one geometric flag gives the wrong dimension.

**Acceptance checks.**

- Flags are retained when a moving leg meets Σ.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.1, Definitions 3.1–3.2 and (3.1)–(3.4), pp. 17–19 (arXiv v2).

<a id="gs-0-slope-euler-and-hn-data"></a>

### Slopes and Harder–Narasimhan data

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/slope-euler-and-hn-data` · definition.

For a nonzero coherent sheaf F on X use class (rk F,deg F), slope deg/rk for positive rank and +∞ for torsion. The HN filtration has semistable quotients with strictly decreasing slopes. Its ordered quotient classes define an HN type; for G-bundles use canonical parabolic reductions and dominant rational coweight in the adjoint group. On classes χ((r,d),(r′,d′))=(1−g)rr′+rd′−r′d.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use Riemann–Roch and Serre duality on the imported coherent/vector-bundle theory for the Euler pairing.
2. Construct maximal destabilizing saturated subobjects, then induct on rank; uniqueness forces base-change compatibility.
3. For reductive G use canonical parabolic reductions; keep central degree separate from the adjoint instability coweight.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HNType` | data | Ordered ranks and degrees, or canonical parabolic/coweight data for G. |
| `HNFiltration` | constructor | The canonical filtration with semistable decreasing-slope quotients. |
| `HNFiltration.unique` | characterisation | Any filtration with these properties is the canonical one. |
| `Curve.eulerClass` | compatibility | Hom minus Ext¹ equals the stated numerical pairing. |
| `Curve.cohHereditary` | structure | Coh(X) is hereditary: Ext^i(F,F′)=0 for i≥2, so χ(F,F′)=dim Hom(F,F′)−dim Ext¹(F,F′) is the numerical pairing on classes. |

**Consumers.**

- GS.0 bounded opens; GS.2 truncations: Instability bounds control finite type without controlling central degree.
- Schiffmann §4: The Euler pairing controls extension-stack mass factors.

**Unit tests.**

- HNFiltration.P1_two_slopes (computation): O(2)⊕O(−1) on P¹ has slopes 2,−1, in this order.
- HNType.torsion_slope_top (compatibility): For a length-one skyscraper at a degree-d point the class is (0,d) and its slope is +∞.
- Curve.eulerClass_sign (non-example): For O on a genus-g curve χ(O,O)=1−g; reversing the alternating degree term fails on O and O(1) on P¹.

**Acceptance checks.**

- The zero sheaf has an empty HN type; no slope is assigned to it.
- For vector bundles, slope, semistability and the HN filtration are AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, 'Curve bundle slopes and Harder–Narasimhan filtrations'. This node adds torsion sheaves, the Euler pairing and the G-bundle reductions, and agrees with that subsection on vector bundles.

**Sources.**

- [Olivier Schiffmann, Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), §2.1, pp. 306–308.

<a id="gs-0-harder-narasimhan-truncations"></a>

### Bounded bundle loci

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/harder-narasimhan-truncations` · theorem.

HN≤μ is an open substack of Bun_G. Fixing the relevant central degrees (or quotienting by a suitable central lattice) makes its bounded components of finite type. For a fixed coherent-sheaf class each HN type has finitely many rational isomorphism classes; requiring all slopes ≥0 gives finitely many such types and classes. An adjoint HN bound alone does not bound degrees of the centre.

**Direct prerequisites:** [GS.0/slope-euler-and-hn-data](#gs-0-slope-euler-and-hn-data), [GS.0/deformation-complex-and-smoothness](#gs-0-deformation-complex-and-smoothness).

**Construction or proof.**

1. Embed the bounded bundle problem in bounded Quot families after twisting by a sufficiently positive divisor.
2. Use bounded cohomology and finite generation to obtain finite-type atlases; prove openness by specialization of HN polygons.
3. For coherent sheaves with slopes ≥0, ranks and nonnegative quotient degrees admit only finitely many decompositions of the fixed class.

**Acceptance checks.**

- For Gm the HN condition in the adjoint group is vacuous but line-bundle degrees remain unbounded.
- For GL2 of degree zero, HN≤μ excludes O(m)⊕O(−m) for sufficiently large m.
- For GL_r vector bundles the open bounded loci and their finite type are AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, 'Harder–Narasimhan polygon semicontinuity' and 'Bounded curve-bundle loci and shtuka truncations'.

**Sources.**

- [Yakov Varshavsky, Moduli spaces of principal F-bundles](https://arxiv.org/pdf/math/0205130v2), §2, Notation 2.1(b), p. 4; Lemma A.3, p. 29; §3, Lemma 3.1(a), p. 12.
- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §12.1, Lemma 12.1 and pp. 148–149.

<a id="gs-0-weil-uniformization"></a>

### Adelic bundle groupoids

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/weil-uniformization` · theorem.

For the connected-fibre model 𝒢, Bun_{𝒢,N}(Fq) is equivalent to the disjoint union, over α∈ker¹(F,G), of quotient groupoids [Gα(F)\Gα(A)/Kα,N], where Gα is the pure inner form and Kα,N is transported integral/congruence level. Automorphisms correspond to Gα(F)∩gKα,Ng⁻¹. For split G the kernel is trivial in the situation of VL Remark 8.21.

**Direct prerequisites:** [GS.0/level-structures](#gs-0-level-structures), `FunctionFieldArithmetic:FA.2/projective-adeles`, `FunctionFieldArithmetic:FA.2/projective-ideles`, `FunctionFieldArithmetic:FA.3`.

**Construction or proof.**

1. Trivialize at the generic point and completed local discs, retaining a generic torsor class when it is not trivial.
2. Glue the local data and compare changes of trivialization; use connected fibres and Lang descent over finite residue fields.
3. Identify stabilizers and the locally trivial generic classes; choose the inner form belonging to each class.

**Acceptance checks.**

- The index set classifies generic torsor components, not individual bundles.
- For GL1 isomorphism classes give divisor classes while stabilizers give Fq×.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Remark 8.21, pp. 116–117; §12.1, Remark 12.2, p. 150.

<a id="gs-0-shifted-hn-filtration"></a>

### Shifted Harder–Narasimhan filtrations

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/shifted-hn-filtration` · definition.

For dominant T=(T₁≥⋯≥Tn) define T-semistability of rank-n E by deg F/r−(T₁+⋯+Tr)/r≤deg E/n−(ΣT)/n for every nonzero proper saturated rank-r subbundle. A quotient of ranks (a,b] uses μ\_T=deg/(b−a)−(T_{a+1}+⋯+Tb)/(b−a). The canonical T-HN filtration has shifted-semistable quotients with decreasing shifted slopes; it is trivial exactly for T-semistability.

**Direct prerequisites:** [GS.0/slope-euler-and-hn-data](#gs-0-slope-euler-and-hn-data).

**Construction or proof.**

1. Translate the dominant truncation inequalities into shifted subbundle slopes.
2. Use existence and uniqueness of the dominant-shift HN construction; a precise source request below retains this theorem rather than inferring it from ordinary HN.
3. Identify Arthur’s F^G(g,T)=1 with T-semistability via maximal-parabolic flags.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ShiftedHN.semistable` | data | The complete family of rank-r inequalities. |
| `ShiftedHN.quotientSlope` | data | Use the consecutive T block determined by cumulative ranks. |
| `ShiftedHN.filtration` | constructor | Canonical filtration with shifted semistable pieces and strictly decreasing shifted slopes. |
| `ShiftedHN.arthurIndicator` | compatibility | Bundle inequalities agree with the adelic truncation indicator. |

**Consumers.**

- Yu §3.3.1: The adelic integral is converted to a count of T-semistable bundles.
- Yu Proposition 3.3.4: Large dominant gaps imply splitting, enabling the isocline count.

**Unit tests.**

- ShiftedHN.constant_shift (compatibility): T=(c,…,c) recovers ordinary semistability and subtracts c from all slopes.
- ShiftedHN.P1_shift_semistable (computation): For O(1)⊕O(−1) on P¹, T=(1,−1) makes the rank-one inequality 1−1≤0, so this unstable ordinary bundle is T-semistable.
- ShiftedHN.block_shift (non-example): For n=3 and cumulative ranks 1,3, the second quotient subtracts (T₂+T₃)/2; reusing T₁ for each quotient is incorrect.

**Acceptance checks.**

- Do not assert that T-HN is the ordinary HN filtration with only its labels changed.

**Sources.**

- [Hongjie Yu, Number of cuspidal automorphic representations and Hitchin’s moduli spaces](https://arxiv.org/pdf/1807.04659v5), §3.3.1–§3.3.2, (3.3.5), pp. 19–20; cited Chaudouard Theorem 4.1.2.

Source obligations: G1: shifted HN existence and uniqueness.

<a id="gs-0-parabolic-pgl2-instability"></a>

### Parabolic PGL₂ instability

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/parabolic-pgl2-instability` · definition.

Over an algebraically closed field define inst(E†)=min_D inst(E(D/2)), over reduced divisors D⊂Σ. A bundle is purely unstable when this minimum N is positive; then its minimizing D is unique, giving κ=(D,N). Order κ≤κ′ by N′−N≥|D−D′|. The corresponding κ-stratum is isomorphic, via E†↦E(D/2), to the ordinary instability-N PGL2 stratum.

**Direct prerequisites:** [GS.0/iwahori-bundles-and-fractional-twists](#gs-0-iwahori-bundles-and-fractional-twists), [GS.0/slope-euler-and-hn-data](#gs-0-slope-euler-and-hn-data).

**Construction or proof.**

1. For a positive-instability rank-two bundle use its unique maximal line and compare push-outs/pull-backs at level points.
2. Each reduced flag rotation changes ordinary instability by ±1. This proves uniqueness of the minimum when positive and reconstructs all flags.
3. Use the inequalities for every D′ to define the bounded open, and identify the closed κ-stratum within it.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ParabolicInstability` | data | Minimum instability and a positive-minimum index κ. |
| `ParabolicInstability.minimizer` | characterisation | The unique reduced D at a positive minimum. |
| `ParabolicInstability.bounded` | data | The open defined by all fractional-twist inequalities. |
| `ParabolicInstability.stratum` | equivalence | The κ-stratum and the ordinary N-stratum after the minimizing twist. |

**Consumers.**

- GS.2 horocycles: Index all intermediate bundles by κ.
- YZ Lemma 3.21: A one-step modification changes |D−D′|+|N−N′| by exactly one.

**Unit tests.**

- ParabolicInstability.no_level (compatibility): With Σ empty, the minimum is ordinary instability and D=0.
- ParabolicInstability.flag_rotation (compatibility): For a purely unstable bundle, rotating one reduced extra flag changes instability by exactly one.
- ParabolicInstability.zero_minimum (non-example): When the minimum is zero, uniqueness of D is not asserted; pure instability is an essential hypothesis.

**Acceptance checks.**

- The reconstruction using further D′ in Lemma 3.19(2) is applied to reduced D′⊂Σ, not arbitrary effective divisors.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.4.1–§3.4.2, Lemma 3.19 and Corollary 3.20, pp. 29–30 (arXiv v2).

<a id="gs-0-automorphisms-and-the-central-lattice"></a>

### Central lattices and finite quotients

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/automorphisms-and-the-central-lattice` · theorem.

Choose a discrete subgroup Ξ of Z(F)\Z(A) whose image controls the free central-degree directions and is cocompact in the required central quotient, with the usual injectivity condition preventing extra stabilizers. Central tensoring acts on bundles and shtukas. Bounded shtuka loci modulo Ξ have finitely many remaining degree components; rational stabilizer weights are retained. For GLn, a nonzero-degree idele a gives the quotient by a^Z.

**Direct prerequisites:** [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations), `FunctionFieldArithmetic:FA.2/projective-ideles`.

**Construction or proof.**

1. Use the idele-degree exact sequence to isolate the free central directions.
2. Check the tensor action and level compatibility, then choose Ξ so the remaining central degrees form a finite set.
3. Prove finite-type assertions for each HN bound after taking this quotient.

**Acceptance checks.**

- For GLn tensoring by a line bundle of degree d changes degree by nd.
- A nonzero-degree a suffices; do not require a rational point or a degree-one closed place.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, before Definition 2.14, p. 59; §8, Remark 8.21, p. 116.

<a id="gs-0-adelic-orbit-mass"></a>

### Adelic orbit masses

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/adelic-orbit-mass` · theorem.

Normalize vol(K)=1 for GLn. The adelic orbit corresponding to E has mass 1/|Aut(E)|. In the diagonal kernel Σγ∈GLn(F)1_K(g⁻¹γg), the value is |Aut(E)|; consequently its integral over a finite HN-truncated union counts bundle isomorphism classes without weights. General stack volumes remain weighted.

**Direct prerequisites:** [GS.0/weil-uniformization](#gs-0-weil-uniformization), [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations), `FunctionFieldArithmetic:FA.6/automorphic-function-space`.

**Construction or proof.**

1. Compute the quotient measure of one K-orbit from its finite stabilizer.
2. Identify the kernel summands with automorphisms and cancel this factor against the orbit mass.

**Acceptance checks.**

- For a line bundle the mass is 1/(q−1), whereas this diagonal-kernel contribution is 1.
- A sum of constant functions on a groupoid gives weighted volume, not an unweighted object count.

**Sources.**

- [Hongjie Yu, Number of cuspidal automorphic representations and Hitchin’s moduli spaces](https://arxiv.org/pdf/1807.04659v5), §3.3.1, Theorem 3.3.1, (3.3.1) and (3.3.6), pp. 18–19.

<a id="gs-0-nonsplit-descent-and-inner-forms"></a>

### Nonsplit bundle descent

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/nonsplit-descent-and-inner-forms` · theorem.

For nonsplit G, choose a finite splitting extension and compatible integral model away from the bad places. Torsors with effective descent data recover 𝒢-bundles, and the rational groupoid decomposes into the pure-inner-form components indexed by ker¹(F,G). The component decomposition is preserved by spherical Hecke correspondences.

**Direct prerequisites:** [GS.0/weil-uniformization](#gs-0-weil-uniformization), `mathlib:CategoryTheory.Pseudofunctor.DescentData`.

**Construction or proof.**

1. Use torsor descent for the model, distinguishing a group form from a torsor under it.
2. Transport Hecke modifications and the no-leg identification on each generic torsor component.
3. Show the operations do not change the generic ker¹ class.

**Acceptance checks.**

- A splitting-field choice must disappear from the resulting equivalence.
- Do not replace the disjoint union of groupoids by a vector-space direct sum before taking functions.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §12.1, Remark 12.2 and Theorem 12.3, pp. 148–152; §12.3.2, pp. 159–161.

<a id="gs-0-bundle-and-torsion-masses"></a>

### Bundle and torsion mass identities

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/bundle-and-torsion-masses` · theorem.

With vol(𝒞)=Σ[F]1/|Aut F|, vol(Bun_{r,d})=q^((g−1)(r²−1))|Pic⁰(Fq)|/(q−1)·∏\_{i=2}^r Z_X(q^(−i)). The torsion series is Σ\_l vol(Coh_{0,l})s^l=∏\_{i≥1}Z_X(q^(−i)s), equivalently the plethystic exponential Exp([X]s/(q−1)) with Adams operations using all extension-field point counts. The product for positive-rank coherent sheaves extends to i≥2 without the upper bound r.

**Direct prerequisites:** [GS.0/adelic-orbit-mass](#gs-0-adelic-orbit-mass), [GS.0/slope-euler-and-hn-data](#gs-0-slope-euler-and-hn-data), `FunctionFieldArithmetic:FA.5/curve-zeta-series`.

**Construction or proof.**

1. Apply the Siegel mass formula for bundles with the specified stabilizer weighting.
2. Factor torsion sheaves by closed-point support and sum local partition masses to obtain the Euler product.
3. Stratify a coherent sheaf by its torsion subsheaf and vector-bundle quotient; the extension factor yields the final infinite product.

**Acceptance checks.**

- r=1 gives |Pic⁰(Fq)|/(q−1).
- The coefficient of s is #X(Fq)/(q−1); Exp here is not the ordinary exponential in this single number.

**Sources.**

- [Olivier Schiffmann, Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), §4.2, Theorem 4.1(i)–(iii), pp. 316–317; Appendix A, p. 356.

<a id="gs-0-cuspidal-automorphic-forms"></a>

### Cuspidal functions and bundle functions

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms` · definition.

Import the FA.6 automorphic and constant-term spaces, then transport them to finitely supported functions on the rational bundle groupoid modulo Ξ. Cuspidal means every proper-parabolic constant term vanishes, with unipotent quotient measure normalized to volume one. This node owns the stack/adelic interface, including inner-form components, not a second definition of automorphic representation theory.

**Direct prerequisites:** [GS.0/weil-uniformization](#gs-0-weil-uniformization), [GS.0/automorphisms-and-the-central-lattice](#gs-0-automorphisms-and-the-central-lattice), `FunctionFieldArithmetic:FA.6/automorphic-function-space`, `FunctionFieldArithmetic:FA.6/cuspidal-constant-terms`, `FunctionFieldArithmetic:FA.6`.

**Construction or proof.**

1. Pull the imported constant-term maps across the groupoid equivalence.
2. Retain stabilizer weights when expressing the maps as sums of bundle correspondences.
3. Use the imported compact-support-mod-centre/finiteness theorem with Ξ.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BunG.automorphicFunctions` | equivalence | Identify compactly supported bundle functions and imported adelic functions. |
| `BunG.constantTerm` | compatibility | Transport each proper-parabolic constant term with its measure. |
| `BunG.cuspLattice` | characterisation | Intersect cuspidal E-valued functions with the integral function lattice. |

**Consumers.**

- GS.3 Proposition 8.23: Empty-leg Hecke-finite cohomology is this cusp space.
- GS.5 decomposition: This finite-dimensional space carries the excursion algebra.

**Unit tests.**

- BunG.cuspidal_torus (compatibility): For a torus there are no proper parabolics, so all compactly supported functions modulo Ξ are cuspidal.
- BunG.constantTerm_gl2 (computation): For GL2 the constant term along the upper triangular parabolic is a sum/integral over its unipotent quotient.
- BunG.compactSupport_not_finite (non-example): The whole noncompact bundle-function space is not finite-dimensional before the cuspidality and central-quotient restrictions.

**Acceptance checks.**

- The resulting fixed-level cusp space is finite-dimensional over E.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Notation 8.22 and Proposition 8.23, p. 117.

<a id="gs-0-picard-and-the-gl1-case"></a>

### The rank-one comparison

Target `GlobalShtukasAndFunctionFieldLanglands:GS.0/picard-and-the-gl1-case` · application.

For Gm, Bun_Gm is the Picard stack, a Gm-gerbe over the Picard scheme. On Pic⁰, Frob_q−id is a finite étale Lang isogeny with kernel Pic⁰(Fq). On all degree components the kernel includes Pic(X)(Fq) and is not finite. After the chosen degree-lattice quotient, rank-one shtuka Lang fibres and the FA.4 geometric-reciprocity normalization give the rank-one global correspondence.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), [GS.0/automorphisms-and-the-central-lattice](#gs-0-automorphisms-and-the-central-lattice), `FunctionFieldArithmetic:FA.1/rational-picard-comparison`, `FunctionFieldArithmetic:FA.4/global-abelian-existence`.

**Construction or proof.**

1. Pass from line bundles to their Picard classes while retaining scalar automorphisms.
2. Apply Lang only on the connected degree-zero Jacobian; keep the other degree components until quotienting by Ξ.
3. Use the imported reciprocity theorem and record inversion from arithmetic to geometric Frobenius.

**Acceptance checks.**

- A product Pic×BGm requires a chosen trivialization of the gerbe; no canonical product is asserted.
- This test must detect the infinite-degree kernel of Lang on the whole Picard scheme.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsection 'Rank-one unramified reciprocity', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §1d, remark after Theorem VI.9, p. 158; §1e, proof of Proposition VI.11, p. 159.

## GS.1 — The BD Grassmannian and classical Satake

The Grassmannian, Schubert supports and bounded Hecke stacks form an early geometric export. Fusion supplies the symmetric tensor structure after the parity correction. The dual-group identification requires the actual root-datum and finite-field comparison proofs; integral Satake retains its own perversity convention.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- N⊂X is a finite closed level subscheme, including its nilpotents; moving good legs lie in U∖|N|. A finite leg set, ordered partition and representation/bound are fixed whenever bounded geometry is asserted. Ξ controls central degree as in GS.0.

Atlas planets: Beilinson–Drinfeld Grassmannian; Schubert varieties; Global Hecke stacks; Satake commutativity; Classical geometric Satake; Integral geometric Satake.

<a id="gs-1-beilinson-drinfeld-grassmannian"></a>

### Beilinson–Drinfeld Grassmannians

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian` · construction.

For a finite ordered partition I=I₁⊔⋯⊔Ik, Gr_I^(I₁,…,Ik) over X^I classifies bundles E₀,…,Ek, modifications E_{j−1}≃E_j away from the graphs indexed by Ij, and a trivialization of Ek. Beauville–Laszlo gluing identifies it with the same data on the formal discs. It is an ind-scheme, with factorization into products when the corresponding groups of legs are disjoint.

**Direct prerequisites:** [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`.

**Construction or proof.**

1. Construct the modification functor and finite-dimensional lattice bounds using a faithful representation.
2. Glue formal torsors with the trivial torsor off the graphs; verify independence from a formal coordinate.
3. Use disjoint formal neighbourhoods for factorization and gluing of trivializations.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BDGrassmannian` | data | Bundle chains, moving legs and final trivialization. |
| `BDGrassmannian.formalDisc` | equivalence | Identify the global and formal-disc moduli problems. |
| `BDGrassmannian.factorization` | equivalence | Disjoint-leg products, compatible with refinement of disjoint partitions. |
| `BDGrassmannian.coalesce` | functoriality | Base change along X^J→X^I for a map I→J. |

**Consumers.**

- GS.1 bounded Hecke stacks: A finite jet-group quotient supplies the local model.
- ET.2b and GS.2: Hitchin/Hecke geometry and shtuka bounds consume the geometric prefix before Satake.

**Unit tests.**

- BDGrassmannian.gm_points (compatibility): For I={1} and G=G_m, the geometric points of the fibre form the discrete set Z of lattice exponents; on nonreduced test rings the fibre is not the constant scheme Z.
- BDGrassmannian.gl2_minuscule_fibre (computation): For GL2 and coweight (1,0), the one-leg Schubert fibre is P¹.
- BDGrassmannian.collision_not_product (non-example): Two distinct legs give the product of local Grassmannians; on collision they give the convolution situation, so the disjoint-product formula is not asserted on the diagonal.

**Acceptance checks.**

- Export this geometric prefix independently to ET.2b.
- Its fibre over a closed point v is the local loop quotient LG/L⁺G of EndoscopicTransferAndUnitaryTraceComparison §3.2 (LocalLoopGrassmannian, over any base field, TauCetiRoadmap pull request #999). What this node adds is the multi-leg geometry over X^I and its factorization.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Definition 1.6, Notation 1.7, Construction 1.8 and Remark 1.9, pp. 43–44.

<a id="gs-1-bounded-strata-and-schubert-bounds"></a>

### Schubert bounds

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds` · definition.

For dominant coweights (ωi), the one-leg Schubert variety is the reduced closure of the positive-loop orbit t^ω. Over the disjoint-leg locus take their product and define Gr_{I,ω} as its reduced Zariski closure in the iterated BD Grassmannian. This differs in general from the larger representation-theoretic inequality bound Gr_{I,≲ω}; do not identify the two functors on nonreduced test rings without a theorem.

**Direct prerequisites:** [GS.1/beilinson-drinfeld-grassmannian](#gs-1-beilinson-drinfeld-grassmannian).

**Construction or proof.**

1. Construct local loop orbits and their reduced closed Schubert pieces.
2. Use factorization on the disjoint locus and then reduced closure in a finite ambient bound.
3. Show dominance order describes the geometric orbit strata; record what is asserted only for reduced subschemes.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `SchubertBound` | data | Dominant coweight tuple and reduced global closed support. |
| `SchubertBound.orbit` | constructor | Open positive-loop orbit in the local Schubert variety. |
| `SchubertBound.closure` | characterisation | Reduced closure of the disjoint product. |
| `SchubertBound.jetAction` | compatibility | On any fixed bound the positive-loop action factors through sufficiently large finite jets. |

**Consumers.**

- GS.2 Definition 2.1: The bounded shtuka stack is pulled back from this closed support.
- GS.1 Satake: The simple object for V_ω is the normalized intersection complex of this support.

**Unit tests.**

- SchubertBound.zero_unit (compatibility): ω=0 gives the unit section.
- SchubertBound.torus_point (compatibility): For a torus each one-leg Schubert variety is a point; two colliding exponents add.
- SchubertBound.gl2_minuscule_closed (computation): For GL2, (1,0) is minuscule and its orbit is already closed; a nonminuscule bound must include smaller strata.

**Acceptance checks.**

- Retain closure and inequality notation separately.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Definition 1.12, p. 46.

<a id="gs-1-global-hecke-stacks-and-convolution"></a>

### Global Hecke chains

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution` · construction.

Hecke_I^(I₁,…,Ik) classifies the same modification chain without the final trivialization. On a fixed bound choose jets ni large enough that the loop action factors through G_{Σni xi}. The bounded Hecke stack is (Gr_bound×\_{X^I}Bun_{G,Σni xi})/G_{Σni xi}; this gives its finite-dimensional local model and composition by gluing chains.

**Direct prerequisites:** [GS.1/bounded-strata-and-schubert-bounds](#gs-1-bounded-strata-and-schubert-bounds), [GS.0/level-structures](#gs-0-level-structures).

**Construction or proof.**

1. Use the final bundle’s finite-jet trivializations as a torsor.
2. Identify the quotient with the modification moduli problem and establish the local model after smooth base change.
3. Compose chains by forgetting intermediate bundles, keeping the leg partition.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GlobalHecke` | data | Bounded modification chains and all bundle projections. |
| `GlobalHecke.localModel` | equivalence | The finite jet quotient description. |
| `GlobalHecke.compose` | functoriality | Concatenate chains and compare the two parenthesizations. |

**Consumers.**

- GS.2: Take the graph-of-Frobenius fibre product.
- ET.2b: Use the smooth local model without invoking a representation category.

**Unit tests.**

- GlobalHecke.empty_chain (compatibility): An empty chain is Bun_G with identical endpoint projections.
- GlobalHecke.zero_coweight_diagonal (compatibility): A zero coweight gives the diagonal correspondence.
- GlobalHecke.torus_compose (compatibility): For a torus composition adds coweights, with an identity modification giving zero.

**Acceptance checks.**

- No Satake theorem is needed for this construction.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Definition 1.2, (1.8)–(1.9) and Lemma 1.14, pp. 42, 46–47.

<a id="gs-1-forgetting-intermediate-modifications-is-small"></a>

### Fusion smallness and convolution

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/forgetting-intermediate-modifications-is-small` · theorem.

For globally moving legs, the proper map forgetting intermediate bounded modifications is small and is an isomorphism over distinct legs. Its restriction to the full collision diagonal is semismall, not generally small. Consequently proper pushforward identifies the relevant global IC objects, and convolution on the diagonal preserves perversity.

**Direct prerequisites:** [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution), `EtaleDualityAndPerverseSheaves:EDC.5`.

**Construction or proof.**

1. Stratify X^I by collisions. Over the open stratum forgetting is an isomorphism.
2. Reduce each collision block to local convolution, whose fibre dimensions are bounded by semismall Bott–Samelson geometry.
3. The codimension of each non-open collision stratum supplies the strict inequality globally. Apply the small-map IC theorem.

**Acceptance checks.**

- For GL2 two standard minuscule modifications, the collision fibre over the central coweight (1,1) is P¹; the local map is semismall with equality.
- Do not infer local smallness by restricting global smallness to the diagonal.

**Sources.**

- [Yakov Varshavsky, Moduli spaces of principal F-bundles](https://arxiv.org/pdf/math/0205130v2), Appendix A, Lemma A.12, p. 35; Proposition A.13, pp. 35–36.

<a id="gs-1-iwahori-minuscule-hecke"></a>

### Minuscule Hecke geometry at Iwahori level

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/iwahori-minuscule-hecke` · construction.

For μ∈{±1}^r, Hk_n^μ(Σ) consists of Iwahori bundles E₀,…,Er and legs xi, with E_{i−1}→Ei for μi=1 (the reverse for −1) an injection with invertible cokernel on Γxi preserving every flag step. Legs may meet Σ. Every bundle projection is smooth of relative dimension rn; the bundle-and-leg projection is flat of relative dimension r(n−1), smooth over (X−Σ)^r. Quotient by simultaneous Picard tensoring gives the PGLn version.

**Direct prerequisites:** [GS.0/iwahori-bundles-and-fractional-twists](#gs-0-iwahori-bundles-and-fractional-twists), [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution).

**Construction or proof.**

1. Reduce to one modification and a single level point.
2. Write compatible lines in the projectivizations of the periodic lattice chain; in an étale chart the equation is a product of selected coordinates equal to the leg coordinate t.
3. This equation proves flatness, while forgetting t gives smoothness; off Σ recover a projective bundle. Descend through the Picard action.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IwahoriHecke` | data | Signed minuscule chains including level-leg collisions. |
| `IwahoriHecke.projections` | projection | Every intermediate bundle and each leg. |
| `IwahoriHecke.localEquation` | characterisation | Étale chart ∏a_j=t, with the actual chosen coordinate subset. |
| `IwahoriHecke.pgl` | compatibility | Picard quotient preserves the stated smoothness and flatness properties. |

**Consumers.**

- YZ Proposition 3.9: The Frobenius equalizer gives the fractional-twist shtuka local model.
- GS.3 compact cohomology: Hecke support and properness determine the correspondence action.

**Unit tests.**

- IwahoriHecke.no_legs (compatibility): r=0 gives Bun_n(Σ).
- IwahoriHecke.gl2_fibre (computation): One GL2 leg off Σ has fibre P¹ over its bundle and leg.
- IwahoriHecke.nodal_chart (computation): At a nodal GL2 level chart ab=t, the t=0 fibre is singular although the total chart A² and bundle projection are smooth.

**Acceptance checks.**

- At a level point flatness does not imply smoothness over the leg base.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.1.3, Definition 3.3 and Proposition 3.4, pp. 19–20 (arXiv v2).

<a id="gs-1-classical-satake-category"></a>

### The classical Satake category

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/classical-satake-category` · definition.

For split connected reductive G and coefficient field E of characteristic zero with ℓ≠p, Sat_G is the category of positive-loop-equivariant perverse E-sheaves on Gr_G with finite-dimensional closed support. Convolution uses the twisted product and proper multiplication; the unit is the skyscraper at the unit coset. Total cohomology is the fibre functor after the modified commutativity convention.

**Direct prerequisites:** [GS.1/forgetting-intermediate-modifications-is-small](#gs-1-forgetting-intermediate-modifications-is-small), `EtaleDualityAndPerverseSheaves:EDC.5`, `DeligneWeightsAndPurity:DWP.0`.

**Construction or proof.**

1. Define equivariance through finite jets on each support.
2. Descend the exterior product to the twisted product and push it along multiplication.
3. Use semismallness for perversity and fusion for associativity; retain the coefficient-field restriction for semisimplicity.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ClassicalSatake` | data | Finite-support positive-loop-equivariant perverse sheaves. |
| `ClassicalSatake.convolution` | structure | Monoidal convolution with unit and associator. |
| `ClassicalSatake.fibre` | functoriality | Total cohomology with finite-dimensional E-values. |
| `ClassicalSatake.simple` | characterisation | Simple objects are IC closures indexed by dominant coweights. |

**Consumers.**

- GS.1 geometric Satake: Tannakian reconstruction identifies this category with Rep_E(Ĝ).
- GS.2 coefficient sheaves: Globalize the category along moving legs.

**Unit tests.**

- ClassicalSatake.gm_convolution (compatibility): For Gm, convolution of delta_m and delta_n is delta_{m+n}.
- ClassicalSatake.unit (compatibility): The unit IC_0 convolves identically on either side.
- ClassicalSatake.gl2_convolution_not_pointwise (non-example): For GL2, standard⊗standard has symmetric-square and determinant summands; convolution cannot be defined as pointwise tensor product on the same support.

**Acceptance checks.**

- The modular category is a distinct coefficient extension, recorded as Part II.

**Sources.**

- [Ivan Mirković and Kari Vilonen, Geometric Langlands duality and representations of algebraic groups over commutative rings](https://arxiv.org/pdf/math/0401222), §2, pp. 3–7; §3, pp. 7–13; §§4–6, pp. 13–21; §7, pp. 23–24.

<a id="gs-1-modified-commutativity-and-tate-twist"></a>

### Satake signs and Tate normalization

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist` · theorem.

Correct the geometric fusion commutativity by an extra minus sign when both objects lie on odd-dimensional components. Then total cohomology has the ordinary symmetric tensor constraint. With a fixed square root of q, normalize IC by the relative dimension shift and half Tate twist, so the spherical trace convention matches normalized Satake.

**Direct prerequisites:** [GS.1/classical-satake-category](#gs-1-classical-satake-category), `DeligneWeightsAndPurity:DWP.0`.

**Construction or proof.**

1. Fusion gives the super commutativity on total cohomology.
2. Grade connected components by orbit-dimension parity and remove the super sign on odd-odd exchanges.
3. Track the dimension shift and chosen square-root Tate twist in the function-sheaf dictionary.

**Acceptance checks.**

- For a torus all orbit dimensions are zero.
- For the GL2 standard minuscule P¹ support, odd-odd exchange needs the extra sign.

**Sources.**

- [Ivan Mirković and Kari Vilonen, Geometric Langlands duality and representations of algebraic groups over commutative rings](https://arxiv.org/pdf/math/0401222), §6, Lemma 6.1 and Proposition 6.3, pp. 19–20.
- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Remarks 1.19 and 1.21, pp. 50–51.

<a id="gs-1-geometric-satake-functor"></a>

### Classical geometric Satake

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor` · theorem.

The corrected symmetric tensor category Sat_G with its total-cohomology fibre functor is equivalent to Rep_E(Ĝ), where Ĝ has the dual based root datum. A chosen Borel and pinning identify the reconstructed group with the chosen dual group. For moving legs this yields ULA coefficient sheaves S_{I,W}, functorial in W, compatible with disjoint factorization, convolution, all coalescence maps and relative IC normalization.

**Direct prerequisites:** [GS.1/modified-commutativity-and-tate-twist](#gs-1-modified-commutativity-and-tate-twist), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`.

**Construction or proof.**

1. Use semi-infinite orbit weight functors: compact cohomology is concentrated in degree ⟨2ρ,ν⟩, giving an exact faithful tensor fibre functor.
2. Construct the coendomorphism coalgebra of the exact faithful tensor cohomology functor as in MV §11; identify its torus and root datum by the weight functors and rank-one Levi restrictions in §12. The comparison carrying this complex-topological proof to finite-field ℓ-adic sheaves is a named source gap, not an unnamed Tannakian supplier.
3. Globalize with coordinate-torsor descent and BD fusion; VL Theorem 1.17 supplies the exact multi-leg compatibility package.

**Acceptance checks.**

- For a torus obtain the dual torus and its coweight grading.
- For GL2 the minuscule IC gives the standard dual representation and associativity agrees under triple fusion.

**Sources.**

- [Ivan Mirković and Kari Vilonen, Geometric Langlands duality and representations of algebraic groups over commutative rings](https://arxiv.org/pdf/math/0401222), §7, Theorem 7.3, p. 23; §11, Proposition 11.1, p. 31; §12, Theorem 12.1, pp. 33–38.
- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Theorem 1.17, pp. 48–50.

Source obligations: G2: finite-field ℓ-adic classical Satake proof bridge.

<a id="gs-1-centre-acts-trivially-on-satake-sheaves"></a>

### Central action on Satake sheaves

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/centre-acts-trivially-on-satake-sheaves` · lemma.

The positive-loop action of the centre on the bounded Grassmannian and its Satake sheaves is trivial in the descent needed for the central quotient of shtukas; central tensoring of the bundle factor therefore preserves the coefficient sheaf.

**Direct prerequisites:** [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.0/automorphisms-and-the-central-lattice](#gs-0-automorphisms-and-the-central-lattice).

**Construction or proof.**

1. A central positive loop changes a trivialization by an automorphism extending across the disc.
2. Check equivariant descent on each finite jet quotient and then transport it to Hecke and shtuka coefficients.

**Acceptance checks.**

- Distinguish this geometric central-loop action from the possibly nontrivial action of Z(Ĝ) on a representation.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Remark 1.20, p. 51.

<a id="gs-1-unramified-hecke-algebra-and-satake-isomorphism"></a>

### Normalized spherical Satake

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism` · theorem.

At v outside the level, normalize vol(G(O_v))=1. The classical Satake isomorphism, imported from SR.4 with a fixed square root of q, identifies the spherical E-Hecke algebra with E⊗\_Z K₀(Rep Ĝ); for a torus this is the group algebra of coweights. For irreducible V of highest weight ω, h_{V,v} is the image of V; it takes values in O_E, the h_{V,v} form an O_E-basis of the integral spherical Hecke algebra, and the geometric identity is h_{V,v}=(−1)^⟨2ρ,ω⟩Tr(Frob_v,S_V), including the already selected half Tate twist. For nonminuscule V the IC trace need not equal the characteristic function of a single double coset.

**Direct prerequisites:** [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.0/cuspidal-automorphic-forms](#gs-0-cuspidal-automorphic-forms), `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction or proof.**

1. Import the classical Satake isomorphism from SR.4; use the sheaf-function dictionary and the convolution compatibility of geometric Satake to identify the traces.
2. Evaluate the normalized IC traces on local double cosets and compare the dominant-weight triangular basis.

**Acceptance checks.**

- h_1 is the unit 1_{G(Ov)}.
- For Gm the basis is δ\_{π^m} and multiplication adds m.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, after Theorem 1.17 and Remarks 1.20–1.21, p. 51; §6.1, Proposition 6.2, p. 75.
- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §1, Remarks 1.20–1.21, pp. 51–52.

<a id="gs-1-determinant-line-and-opposition-sign"></a>

### Determinant lines and opposition signs

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/determinant-line-and-opposition-sign` · theorem.

On the equal-characteristic GLn locus Λ⊂R[[t]]ⁿ with locally free rank-N quotient, the determinant line has fibre ∧^N_R(R[[t]]ⁿ/Λ). In the simply connected semisimple complex setting of Lusztig–Yun, the normalized opposition anti-involution acts on unshifted IH^{2j}(Gr≤λ) by (−1)^j. This is the equal-characteristic input to their numerical identity used by Zhu; the mixed-characteristic Satake theorem remains with its own owner.

**Direct prerequisites:** [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use the actual finite locally free R-module quotient for the determinant line; its determinant is compatible with families and modification chains.
2. Identify opposition as a monoidal automorphism under equal-characteristic Satake and compute its torus element (−1)^ρ.
3. Normalize by the identity on the open orbit and translate the 2ρ grading to the sign (−1)^j on unshifted intersection cohomology.

**Acceptance checks.**

- For N=0 the determinant line is canonically trivial.
- For an IH² class the sign is −1, so omitting the opposition normalization fails.

**Sources.**

- [Xinwen Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic](https://arxiv.org/pdf/1407.8519v3), §0.1.4, p. 3; §0.2, pp. 4–5.
- [George Lusztig and Zhiwei Yun, A (−q)-analogue of weight multiplicities](https://arxiv.org/pdf/1203.0521v1), arXiv:1203.0521v1, Lemma 3.3 and §3.4, pp. 9–11.

<a id="gs-1-nonsplit-satake-descent-via-the-l-group"></a>

### Nonsplit Satake descent

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/nonsplit-satake-descent-via-the-l-group` · theorem.

Over the open where G is reductive, descend split Satake from a finite splitting cover with its pinned finite Galois action on Ĝ. The resulting coefficient functor is indexed by algebraic representations of the finite-form L-group Ĝ⋊Q and is compatible with restriction of the prescribed Γ→Q projection. Geometric and algebraic actions differ by the Tate/pinning normalization and must be compared explicitly.

**Direct prerequisites:** [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.0/nonsplit-descent-and-inner-forms](#gs-0-nonsplit-descent-and-inner-forms), `LanglandsParameterStacks:LP0/functoriality-of-cocycles`.

**Construction or proof.**

1. Construct the pinned action and its descent datum on split Satake sheaves.
2. Check cocycle and independence of the splitting cover, then descend fusion and convolution.
3. Keep the action on coefficients distinct from the Weil action on the base.

**Acceptance checks.**

- A split group has trivial Q action.
- For a nonsplit torus the dual-character lattice carries the actual Galois action.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §12.1, pp. 148–149; §12.3.1, Theorem 12.16, pp. 157–158.

Source obligations: G2: finite-field ℓ-adic classical Satake proof bridge.

<a id="gs-1-integral-geometric-satake"></a>

### Integral geometric Satake

Target `GlobalShtukasAndFunctionFieldLanglands:GS.1/integral-geometric-satake` · theorem.

For the split equal-characteristic affine Grassmannian, geometric Satake over O_E identifies finite free representations of the pinned dual group over O_E with the corresponding flat Satake objects, compatibly with convolution, weight functors, fusion and extension to E. The construction uses the standard integral perverse t-structure; Verdier duality need not preserve that heart. The free coefficient representations used for excursions admit integral creation and annihilation. No semisimplicity is asserted over O_E or its residue field.

**Direct prerequisites:** [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.1/forgetting-intermediate-modifications-is-small](#gs-1-forgetting-intermediate-modifications-is-small), `EtaleDualityAndPerverseSheaves:EDC.5`.

**Construction or proof.**

1. Use the integral weight-functor reconstruction and the same pinned root datum as the rational theorem.
2. Apply fusion and tensor functoriality to free coefficient representations; obtain coefficient-natural invariant-vector and covector maps.
3. Use the standard integral perversity without invoking preservation by Verdier duality. The finite-field comparison and integral reconstruction proof obligations are retained in G2.

**Acceptance checks.**

- Extension to E recovers GS.1 rational Satake.
- Reduction modulo λ need not preserve semisimplicity or diagonalizable Hecke action.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §13, proof of Proposition 13.1, pp. 166–167; Theorem 1.17, pp. 48–50.

Source obligations: G2: finite-field ℓ-adic classical Satake proof bridge.

## GS.2 — Global shtukas and their cohomology

Construct the Frobenius-graph stack, its bounded local models and all cohomological degrees of compact support. The source and target bounds of every partial Frobenius or Hecke map must be visible. Fractional infinity and the PGL2 horocycle geometry are specified specializations, with their degree/parity conditions.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- N⊂X is a finite closed level subscheme, including its nilpotents; moving good legs lie in U∖|N|. A finite leg set, ordered partition and representation/bound are fixed whenever bounded geometry is asserted. Ξ controls central degree as in GS.0.

Atlas planets: Global shtukas; Shtuka truncations; Partial Frobenius; Coalescence of legs; Fractional-infinity shtukas.

<a id="gs-2-global-shtuka-stack"></a>

### Global shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack` · definition.

For legs in U=X−N and an ordered partition of I, Cht_{N,I,W} classifies bundles E₀,…,Ek with compatible full levels, bounded modifications E_{j−1}≃Ej away from the legs in Ij, and a level-preserving isomorphism Ek≃τE₀, where τ=(id_X×Frob_S)\*. It is the Hecke correspondence pulled back along the Frobenius graph of Bun_{G,N}. The W-support is pulled back from the reduced global Schubert support.

**Direct prerequisites:** [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution), [GS.1/bounded-strata-and-schubert-bounds](#gs-1-bounded-strata-and-schubert-bounds), [GS.0/level-structures](#gs-0-level-structures).

**Construction or proof.**

1. Form the stack fibre product, using actual isomorphisms at its two endpoints.
2. Pull back the bounded Grassmannian support along the local-model map.
3. Check the determinant/Kottwitz condition for nonemptiness: the total modification class must vanish when the closing twist has degree zero.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GlobalShtuka` | data | The bundles, levels, modifications, legs and closing Frobenius isomorphism. |
| `GlobalShtuka.legs` | projection | The morphism to U^I. |
| `GlobalShtuka.heckeForget` | functoriality | Forget the closing isomorphism. |
| `GlobalShtuka.bound` | characterisation | Fibre product with the specified reduced Schubert support. |

**Consumers.**

- GS.3: Compactly supported degree-zero intersection cohomology is formed along the leg map.
- GS.4: Iterated presentations provide the commuting partial Frobenius operators.

**Unit tests.**

- GlobalShtuka.gm_degree_balance (compatibility): For Gm with two legs of coweights 1,−1, degrees balance; a single coweight 1 without infinity twist has empty moduli.
- GlobalShtuka.zero_modification (compatibility): A zero modification gives a Frobenius-periodic bundle with compatible level.
- GlobalShtuka.frobenius_on_base (non-example): Frobenius acts on S in τE; replacing it by absolute Frobenius on X changes the moduli problem.

**Acceptance checks.**

- For split G, admissibility is Σ[ωi]=0 in π₁(G), equivalently the diagonal dual centre acts trivially on the tensor representation.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, Definition 2.1, pp. 52–53.

<a id="gs-2-truncations-and-finite-type"></a>

### Finite-type shtuka truncations

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type` · theorem.

For a fixed W, HN bound μ and central lattice Ξ, Cht^{≤μ}\_{N,I,W}/Ξ is a finite-type Deligne–Mumford stack in the source’s bounded setting. For sufficiently deep nonempty N, depending on μ and W, its components are quasi-projective schemes. With N empty the quotient-of-quasi-projective assertion holds over U^I for every open U⊊X; do not claim the entire unbounded shtuka stack is a scheme.

**Direct prerequisites:** [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack), [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations), [GS.0/automorphisms-and-the-central-lattice](#gs-0-automorphisms-and-the-central-lattice).

**Construction or proof.**

1. Intersect the bounded Hecke locus with the Frobenius graph and use the HN bound for finite type.
2. Frobenius-fixed infinitesimal automorphisms vanish, giving the unramified diagonal.
3. Increase the level enough to kill the remaining finite automorphisms uniformly on the fixed bound.

**Acceptance checks.**

- The depth needed may increase with μ and W.
- A single bounded open need not be preserved by all Hecke or partial Frobenius operations.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, Proposition 2.6(a), pp. 53–54, and the paragraph before Definition 2.14, p. 59.
- [Yakov Varshavsky, Moduli spaces of principal F-bundles](https://arxiv.org/pdf/math/0205130v2), §2, Proposition 2.16(a), pp. 7–8.

<a id="gs-2-local-model-map-and-smoothness"></a>

### Smooth shtuka local models

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/local-model-map-and-smoothness` · theorem.

For sufficiently large finite jets ni on the fixed Schubert support, the bounded iterated shtuka stack maps smoothly to Gr_{I,W}/G_{Σni xi}, of relative dimension (Σni)dim G in the split constant-model setting. Thus singularities are governed by the Schubert local model, with the perverse shift determined by this relative dimension.

**Direct prerequisites:** [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack), [GS.0/deformation-complex-and-smoothness](#gs-0-deformation-complex-and-smoothness), [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution).

**Construction or proof.**

1. Present the fibre as an equalizer of two maps between smooth bundle-with-level stacks.
2. One map forgets some jet level and is smooth; the other factors through relative Frobenius and has zero differential along the fibres.
3. The equalizer is smooth of the claimed relative dimension, independently of the singularities of the Schubert support.

**Acceptance checks.**

- The theorem is about a smooth map to a possibly singular target, not smoothness of every shtuka stack.
- A minuscule smooth local model gives the corresponding smooth source.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, Proposition 2.8 and its proof, pp. 54–55.

<a id="gs-2-fractional-infinity-shtukas"></a>

### Fractional-infinity shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/fractional-infinity-shtukas` · definition.

For Iwahori bundles and μ∈{±1}^r choose D∞ supported on residue-field sections at infinity, with coefficients in (1/n)Z and Σμi=n deg D∞. Require Er≃(τE₀)(D∞), with Frobenius applied before fractional twisting. Form the Frobenius-graph fibre product with AL(−D∞)∘p_r; quotient by Pic_X(Fq) to obtain PGLn shtukas. The leg map is to X^r×S∞ and includes level collisions.

**Direct prerequisites:** [GS.1/iwahori-minuscule-hecke](#gs-1-iwahori-minuscule-hecke), [GS.0/iwahori-bundles-and-fractional-twists](#gs-0-iwahori-bundles-and-fractional-twists), [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack).

**Construction or proof.**

1. Construct the twisted graph fibre product and take degrees to prove the balance requirement.
2. Redistribute coefficients by a Frobenius coboundary, compare with ordinary extra infinity legs, and descend through Pic_X(Fq).
3. Use the minuscule local model for smoothness of total stacks and flatness of the leg map; import the stated ramified leg-base-change hypotheses.
4. For PGL2 use sign-independence and the standard half-divisor to obtain parity r≡#Σ∞ mod 2. Fractional rotations give commuting Atkin–Lehner involutions.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TwistedShtuka` | data | Signed chain, residue sections, degree balance and twisted Frobenius closure. |
| `TwistedShtuka.pgl` | equivalence | The Pic_X(Fq) quotient and its twisted-graph description. |
| `TwistedShtuka.redistribute` | compatibility | Change infinity coefficients by the source’s Frobenius-coboundary rule. |
| `TwistedShtuka.atkinLehner` | functoriality | Commuting fractional rotations, involutive for PGL2. |

**Consumers.**

- GS.3 YZ horocycles: Pure-instability strata and the spectral proof use this particular PGL2 stack.
- DM.7 comparison: The one-leg construction gives the elliptic-sheaf interface without becoming a prerequisite of general shtukas.

**Unit tests.**

- TwistedShtuka.untwisted_balance (compatibility): D∞=0 forces Σμi=0 for GLn.
- TwistedShtuka.pgl2_parity (computation): For n=2, one infinity place of degree two still requires odd r in the standard construction.
- TwistedShtuka.drinfeld_balance (computation): With r=1, μ=−1 and D∞=−Γ∞/n the balance is −1=−1; this is the independent Drinfeld-module specialization.

**Acceptance checks.**

- The standard parity counts closed infinity places, not their total degree.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.2.1–§3.2.8, Definition 3.5, Lemmas 3.6–3.8, Propositions 3.9–3.10, Definition 3.12 and (3.18), pp. 21–26 (arXiv v2).

<a id="gs-2-cohomology-sheaves-of-shtuka-stacks"></a>

### Shtuka intersection-cohomology systems

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks` · construction.

Pull the Satake sheaf through the smooth local model, descend by Ξ, and normalize perversely relative to U^I. For the leg map p define H^{j,≤μ}\_{N,I,W}=R^jp_!F_{N,I,W}^{≤μ} for every j∈Z, and H^j_{N,I,W}=colim_μ H^{j,≤μ}; the original excursion construction uses j=0. At each finite bound the sheaves are constructible; the colimit is an ind-constructible system, not a single constructible sheaf. Proper partition pushforward identifies different iterated presentations.

**Direct prerequisites:** [GS.2/local-model-map-and-smoothness](#gs-2-local-model-map-and-smoothness), [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.1/centre-acts-trivially-on-satake-sheaves](#gs-1-centre-acts-trivially-on-satake-sheaves), `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Construction or proof.**

1. Use atlas descent for finite-bound coefficients and f_! base change; no properness of p is assumed.
2. For inclusions of HN opens use extension by zero and the covariant map on compact support.
3. Take the filtered system and prove independence of the partition by proper pushforward of Satake sheaves.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ShtukaIC` | data | The relative-perverse coefficient sheaf on each bounded stack. |
| `ShtukaCohomology.trunc` | data | The constructible R^jp_! object at μ for each fixed j; j=0 gives the original excursion system. |
| `ShtukaCohomology.transition` | functoriality | Covariant maps as HN opens grow. |
| `ShtukaCohomology.partition` | equivalence | Canonical comparison of iterated presentations, compatible with a third refinement. |

**Consumers.**

- GS.3 Hecke finiteness: Finitely generated lattices are found inside this filtered system.
- GS.4: Partial Frobenius and specialization act on its generic fibres.

**Unit tests.**

- ShtukaCohomology.no_legs_functions (degenerate): For I=∅, W=1, degree-zero compact support gives functions on the rational bundle groupoid modulo Ξ.
- ShtukaCohomology.colimit_not_constructible (non-example): At a fixed bound the sheaf is constructible; the whole unbounded colimit is not declared constructible.
- ShtukaCohomology.partition_coherent (compatibility): Refining a partition twice gives the same comparison as refining once; an arbitrary isomorphism per partition is insufficient.

**Acceptance checks.**

- The degree-zero relative-perverse normalization must agree with the no-leg function space.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, Definition 2.14 and Corollaries 2.15–2.18, pp. 59–60; §4.2, Definition 4.1, p. 65; §4.5, Definitions 4.5 and 4.7, p. 68.

<a id="gs-2-zero-leg-twisted-inner-forms"></a>

### Twisted zero-leg inner forms

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/zero-leg-twisted-inner-forms` · theorem.

With r=0 and balanced infinity coefficients, the geometric zero-leg GLn twisted-shtuka groupoid at a fixed ξ∈S∞ is [B×(F)\B×(A)/∏Kx]. Here B is the degree-n central simple algebra split off Σ∞ with inv_x(B)=Σ\_i c_x^(i), and Kx are the source’s minimal parahorics at Σ and maximal parahorics elsewhere. The reciprocity sum of invariants is zero. This is a separate twisted specialization of adelic descent.

**Direct prerequisites:** [GS.2/fractional-infinity-shtukas](#gs-2-fractional-infinity-shtukas), [GS.0/weil-uniformization](#gs-0-weil-uniformization), `FunctionFieldArithmetic:FA.4/function-field-class-formation`.

**Construction or proof.**

1. Use the local invariants and the global Brauer exact sequence to construct B.
2. Classify the Frobenius-periodic twisted bundles by the corresponding inner form and compare parahoric stabilizers.
3. Retain the missing detailed classification proof as the precise source obligation in the gap register; the paper states this case without proof.

**Acceptance checks.**

- Σ∞=∅ and zero twist recover the split GLn adelic groupoid.
- This is a groupoid equivalence; automorphism groups are not discarded.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.2.2, p. 22 (arXiv v2).

Source obligations: G4: twisted zero-leg inner-form classification proof.

<a id="gs-2-elliptic-sheaf-realisation"></a>

### Elliptic sheaves as a specialization

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/elliptic-sheaf-realisation` · application.

Import DM.7’s elliptic-sheaf definition and compare its periodic bundle chain with the one-leg, negative modification, fractional-infinity shtuka just constructed, under the source’s infinity and level conditions. This specialized comparison is independent of the multi-leg excursion construction and is not used to define Bun_G or general shtukas.

**Direct prerequisites:** [GS.2/fractional-infinity-shtukas](#gs-2-fractional-infinity-shtukas), `DrinfeldModulesAndTModules:DM.7`.

**Construction or proof.**

1. Write the elliptic-sheaf periodicity as a fractional twist of an Iwahori chain.
2. Compare its Frobenius map and one-leg modification with the twisted closing equation, preserving level.

**Acceptance checks.**

- Degree balance and the pole at infinity agree on both sides.
- The main GS.3–GS.5 dependency chain does not pass through DM.7.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.2.3–§3.2.4, Lemma 3.7, pp. 22–23 (arXiv v2).

<a id="gs-2-pgl2-horocycle-indices"></a>

### PGL₂ horocycles

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/pgl2-horocycle-indices` · definition.

A horocycle index is κ=(κ₀,…,κr), κi=(Di,Ni), with |Di−Di−1|+|Ni−Ni−1|=1, Nr=N₀, and Dr differing from Fr(D₀) at exactly one geometric point over each closed place of Σ∞. The κ-horocycle fixes these positive-instability indices in the standard PGL2 shtuka. I(κ)={i:Ni≠Ni−1} has even size; the leg support X(κ) fixes all other leg coordinates and the infinity sections, so X(κ)≃X^{I(κ)}.

**Direct prerequisites:** [GS.0/parabolic-pgl2-instability](#gs-0-parabolic-pgl2-instability), [GS.2/fractional-infinity-shtukas](#gs-2-fractional-infinity-shtukas).

**Construction or proof.**

1. Analyze the three one-step cases: N rises, N falls, or D toggles at the level point while N is constant.
2. Impose Frobenius closure to obtain the endpoint condition.
3. Define the horocycle and bounded open, factor the leg map through X(κ), and identify support classes under simultaneous rational-level divisor toggles.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HorocycleIndex` | data | All adjacency and twisted-Frobenius endpoint constraints. |
| `HorocycleIndex.support` | data | The coordinate subscheme X(κ) and free coordinates I(κ). |
| `Horocycle.stratum` | constructor | The locally closed substack fixing intermediate indices. |
| `Horocycle.truncation` | functoriality | Componentwise ordered bounded opens covering the stack. |

**Consumers.**

- GS.3 horocycle compact image: The dimension r−#I(κ)/2 determines the compact-support shift.
- GS.3 Eisenstein comparison: Different support classes separate the boundary ind-perverse pieces.

**Unit tests.**

- HorocycleIndex.level_step (compatibility): A constant-N step must toggle a single level flag, and its leg is forced to that level point.
- HorocycleIndex.rising_falling_steps (compatibility): A rising-N step has unchanged D and a free leg; a falling step reverses the corresponding modification.
- HorocycleIndex.even_free_legs (compatibility): Nr=N₀ forces equally many rising and falling steps, so #I(κ) is even.

**Acceptance checks.**

- The abstract directed index set allows integer Ni, but geometric purely unstable strata require Ni>0.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.4.3–§3.4.5, Lemma 3.21, Corollary 3.22, Definition 3.23, Lemma 3.24, Definition 3.25, Lemma 3.26 and Corollary 3.27, pp. 30–33 (arXiv v2).

<a id="gs-2-partial-frobenius-morphisms"></a>

### Partial Frobenius

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms` · construction.

Rotate the first block of an iterated shtuka chain to the end after Frobenius pullback. This gives the partial Frobenius over Frob_{I₁}:U^I→U^I, inducing invertible commuting operators after passage to the cohomological HN colimit. Their product is the canonical total Frobenius. A fixed truncation may map only into a larger bound.

**Direct prerequisites:** [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack), [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks).

**Construction or proof.**

1. Cut off the first modification block and reglue it using the closing Frobenius isomorphism.
2. Use universal-homeomorphism invariance of étale coefficients and partition independence to obtain the cohomological maps.
3. Check commuting rotations on common refinements and bound growth, then pass to the filtered colimit.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Shtuka.partialFrobenius` | functoriality | Rotate a specified leg block and move those legs by Frobenius. |
| `Shtuka.partialFrobenius.cohomology` | compatibility | Induce the coefficient isomorphism and colimit operator. |
| `Shtuka.partialFrobenius.product` | relation | The product over a partition is total Frobenius. |

**Consumers.**

- GS.4 Drinfeld lemma: Commuting partial Frobenius supplies the product Galois action.
- GS.3 Eichler–Shimura: The degree-v iterate enters the characteristic relation.

**Unit tests.**

- Shtuka.partialFrobenius_one_leg (compatibility): For one leg the operator is total Frobenius.
- Shtuka.partialFrobenius_commute (compatibility): For two disjoint blocks the two orders agree after partition comparison.
- Shtuka.partialFrobenius_degree_iterate (non-example): A closed point of degree d returns to its geometric component after d iterates; using one iterate universally gives the wrong local Hecke relation.

**Acceptance checks.**

- No stability of a chosen finite μ is built into the definition.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §3, Lemma 3.1 and Propositions 3.3–3.4, pp. 62–64; §4.3, p. 66.

<a id="gs-2-coalescence-isomorphisms"></a>

### Coalescence of legs

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms` · theorem.

For ζ:I→J and the diagonal ∆ζ:U^J→U^I, pullback of the cohomology system with coefficient W identifies with the system for W^ζ, restriction along Ĝ^J→Ĝ^I. The comparisons are natural in W and compose coherently for I→J→K. They include noninjective ζ and the creation/removal of trivial legs.

**Direct prerequisites:** [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor).

**Construction or proof.**

1. Pull back the Satake fusion isomorphism through the local-model diagram.
2. Use f_! base change and compare cofinal HN systems.
3. Check the associativity diagram on sheaves before taking generic fibres.

**Acceptance checks.**

- All maps I→J are handled, including a surjection merging two legs.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §4.5, Propositions 4.12–4.14, pp. 69–70; §9, Proposition 9.7, pp. 132–133.

<a id="gs-2-hecke-correspondences-on-shtuka-stacks"></a>

### Hecke correspondences on shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/hecke-correspondences-on-shtuka-stacks` · construction.

A compactly supported bi-K_N-invariant integral Hecke function defines a cohomological correspondence on shtuka stacks with support in its finite modification locus. Its action on HN colimits commutes with partial Frobenius, coefficient maps and coalescence. The action can increase the HN bound; its extension across a place v is the operator S_{V,v} constructed in GS.3.

**Direct prerequisites:** [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism), `EtaleDualityAndPerverseSheaves:EDC.8`.

**Construction or proof.**

1. Construct bounded-support Hecke diagrams preserving Frobenius and level.
2. Check properness/étaleness needed for pull-push and compose via common refinements.
3. Use the creation–Frobenius–annihilation formula to extend spherical operators across their support.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ShtukaHecke.correspondence` | constructor | The bounded-support diagram with its coefficient morphism. |
| `ShtukaHecke.act` | functoriality | Integral Hecke action on the cohomology colimit. |
| `ShtukaHecke.convolution` | compatibility | Convolution agrees with composition of correspondences. |

**Consumers.**

- GS.3: Integral stability, support bounds and cusp spaces use this action.
- GS.5: Excursions commute with the Hecke module structure.

**Unit tests.**

- ShtukaHecke.act_one (compatibility): The identity double coset acts as the identity.
- ShtukaHecke.act_commute_disjoint (compatibility): Disjoint-place correspondences commute.
- ShtukaHecke.adjoint_inverse_coset (compatibility): The adjoint under compact-support duality is the inverse-double-coset correspondence with the chosen measure normalization.

**Acceptance checks.**

- Action is on the HN system, not on an arbitrarily fixed finite bound.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §2, Construction 2.20, pp. 61–62; §4.4, p. 67; §6.1, Corollary 6.5, p. 75.

## GS.3 — Hecke finiteness and cohomological control

Creation and annihilation produce extended spherical operators; the alternating-tensor Eichler–Shimura proof precedes their identification with Hecke operators. Integral finite witnesses control the original Galois construction. Xue’s cuspidal kernel, integral finiteness and finiteness over one local Hecke algebra extend the full cohomological route. The PGL2 ind-perverse boundary and Eisenstein decomposition are additional targets, with the corrected shifts.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- N⊂X is a finite closed level subscheme, including its nilpotents; moving good legs lie in U∖|N|. A finite leg set, ordered partition and representation/bound are fixed whenever bounded geometry is asserted. Ξ controls central degree as in GS.0.

Atlas planets: Creation and annihilation; Hecke–Frobenius identity; Eichler–Shimura relation; Integral Hecke finiteness; Eisenstein spectral decomposition; Single-place Hecke finiteness.

<a id="gs-3-creation-and-annihilation-morphisms"></a>

### Creation and annihilation

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms` · construction.

For a representation W of Ĝ^I, a diagonal-Ĝ-invariant vector x and covector ξ give maps from the trivial representation to W^ζ and back, where ζ:I→{0}. Transport these coefficient maps by coalescence to create I legs from one trivial leg and annihilate them. The maps on Hecke-finite fibres are canonical and satisfy the rigid tensor evaluation/coevaluation identities.

**Direct prerequisites:** [GS.2/coalescence-isomorphisms](#gs-2-coalescence-isomorphisms), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks).

**Construction or proof.**

1. Apply coefficient functoriality to x:1→W^ζ and ξ:W^ζ→1.
2. Use fusion comparisons to move to separate legs.
3. Verify the two triangle identities using evaluation and coevaluation before specializing.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CreateLegs` | constructor | Creation from a specified invariant vector. |
| `AnnihilateLegs` | constructor | Annihilation with a specified invariant covector. |
| `CreateAnnihilate.triangle` | compatibility | Rigid tensor triangles survive coefficient functoriality and fusion. |

**Consumers.**

- GS.3 Proposition 7.1: Define S_{V,v} without using the identification with a Hecke operator.
- GS.5: Insert the product Galois action between these maps.

**Unit tests.**

- CreateAnnihilate.trivial (compatibility): For W=1 and x=ξ=1 creation followed by annihilation is the identity.
- CreateAnnihilate.trace (compatibility): For V⊠V\* the canonical coevaluation and evaluation give the usual trace.
- CreateAnnihilate.scale (non-example): Scaling x by a scales the composite by a; normalization must not discard the chosen invariant vector.

**Acceptance checks.**

- The invariant condition is for diagonal Ĝ, not each independent factor of Ĝ^I.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §5, Definitions 5.1–5.2 and Lemma 5.3, pp. 71–72.

<a id="gs-3-hecke-finiteness"></a>

### Integral Hecke finiteness

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness` · definition.

An element h in an E-valued shtuka-cohomology fibre is Hecke-finite if it belongs to a finitely generated O_E-submodule stable under every integral Hecke operator. The union of these lattices is an E-vector subspace H^Hf, stable under the Hecke algebra and the existing geometric actions. Finite-dimensional E-stability alone is a different condition.

**Direct prerequisites:** [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks), `mathlib:Module.Finite`.

**Construction or proof.**

1. Close the collection of stable finite O_E-modules under sums.
2. Scale such modules by elements of E to prove the union is an E-subspace.
3. Use commutation with integral Hecke operators to transport finite witnesses through coefficient and geometric maps.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HeckeFinite` | data | Existence of a finite O_E-submodule containing h and stable under all integral operators. |
| `HeckeFinite.part` | constructor | The E-subspace formed by the union of such modules. |
| `HeckeFinite.map` | functoriality | A Hecke-equivariant linear map carries a finite witness to a finite witness. |
| `HeckeFinite.finiteLattice` | characterisation | A finite family of Hecke-finite vectors lies in one finite stable O_E-module. |

**Consumers.**

- GS.4 Proposition 8.27: Enlarge finite Hecke witnesses to finite partial-Frobenius-stable lisse systems.
- GS.3 Proposition 8.23: At no legs this condition singles out cusp forms.

**Unit tests.**

- HeckeFinite.zero (compatibility): Zero lies in the zero stable submodule.
- HeckeFinite.not_inv_ell (non-example): On E=Qℓ, the operator multiplication by ℓ⁻¹ has finite E-dimensional orbit span of 1, but no finitely generated Zℓ-submodule containing 1 can be stable under it.
- HeckeFinite.scalar_operators (compatibility): If every operator is integral scalar multiplication, each O_E·h is a finite stable witness.

**Acceptance checks.**

- The integral lattice is the witness; the entire E-space is not required to be finitely generated over O_E.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Definition 8.19 and Remark 8.20, p. 115.

<a id="gs-3-horocycle-compact-image"></a>

### Horocycle compact direct images

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/horocycle-compact-image` · theorem.

For κ with every Ni>max(2g−2,0), the map qκ from the PGL2 horocycle to the rank-one shtuka chain of degrees Ni is smooth of dimension d=r−#I(κ)/2, with geometric fibres [G_a^d/Z] for a finite étale translation group Z. Thus Rπκ!Qℓ=Rπ₁!Qℓ\[−2d](−d), and Pκ=Rπκ!Qℓ\[2r](r)=Rπ₁!Qℓ\[#I(κ)](#I(κ)/2), pure perverse of weight zero on X(κ).

**Direct prerequisites:** [GS.2/pgl2-horocycle-indices](#gs-2-pgl2-horocycle-indices), [GS.0/picard-and-the-gl1-case](#gs-0-picard-and-the-gl1-case), `EtaleDualityAndPerverseSheaves:EDC.0`, `DeligneWeightsAndPurity:DWP.7`.

**Construction or proof.**

1. Map each maximal line/quotient ratio to Pic^{Ni}, yielding a rank-one shtuka chain.
2. At high instability H¹ of the ratio line bundle vanishes; express each fibre as a quotient of vector groups and impose Frobenius at the endpoints.
3. Compute the vector-group dimension using Riemann–Roch and the number of rising/falling steps. Compact support gives the shift and twist.

**Acceptance checks.**

- The high-instability inequality is required for the vector-group presentation.
- Use the positive #I shift obtained from Corollary 3.29, correcting the inconsistent sign in the displayed recall at the start of §3.5.4 as recorded by the paper’s extraction.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.4.6, Lemma 3.28 and Corollary 3.29, pp. 33–35 (arXiv v2).

<a id="gs-3-pgl2-ind-perverse-cohomology"></a>

### PGL₂ ind-perverse cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/pgl2-ind-perverse-cohomology` · construction.

For K^{≤κ}=Rπ^{≤κ}\_!Qℓ\[2r](r), define pH^iK as colimκ pH^iK^{≤κ} in Ind(Perv); this notation does not postulate a constructible derived object K for the unbounded stack. Set V=colimκ H_c^{2r}(Sht^{≤κ},Qℓ)(r). Hecke correspondences act on the system and on V; Atkin–Lehner involutions commute with them. The cycle class map and the compact-support pairing are equivariant, with inverse correspondences giving adjoints.

**Direct prerequisites:** [GS.2/fractional-infinity-shtukas](#gs-2-fractional-infinity-shtukas), [GS.2/pgl2-horocycle-indices](#gs-2-pgl2-horocycle-indices), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks), `EtaleDualityAndPerverseSheaves:EDC.5`, `EtaleDualityAndPerverseSheaves:EDC.8`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Construction or proof.**

1. Use extension by zero for increasing bounded opens and form each perverse-degree colimit in the imported Ind category.
2. Construct Hecke pull-push maps with their proper support and compare their compositions.
3. Apply proper/étale base change to prove the same statements after the specified ramified leg base change, and verify Atkin–Lehner commutation on the correspondence diagram.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `PGL2Shtuka.indPerverse` | data | The filtered perverse-cohomology objects, one object for each i. |
| `PGL2Shtuka.middleCompact` | data | The direct limit V in degree 2r and twist r. |
| `PGL2Shtuka.hecke` | functoriality | Correspondences act compatibly with bound transitions. |
| `PGL2Shtuka.pairing` | compatibility | Cycle classes, duality adjoints and Atkin–Lehner symmetries. |

**Consumers.**

- GS.3 constant term: The boundary comparison is an mc-isomorphism of these ind-perverse objects.
- YZ Theorem 3.41: V has an Eisenstein sector and a finite isolated sector.

**Unit tests.**

- PGL2Shtuka.finite_truncation (compatibility): At a fixed finite-type truncation, ordinary constructible compact cohomology is recovered.
- PGL2Shtuka.spherical_self_adjoint (computation): The symmetric PGL2 spherical generator is self-adjoint, since its double coset equals its inverse.
- PGL2Shtuka.leg_base_change (non-example): After a leg base change, pullback of every finite truncation system agrees with the system used for Sht′; do not replace it with an unrelated abstract Hecke module.

**Acceptance checks.**

- Generic modulo-constructible morphisms and their quotient calculus belong to EDC; this is their shtuka-specific application.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.3, Propositions 3.14–3.15, Lemmas 3.16–3.17 and Remark 3.18, pp. 25–29; §3.5.1–§3.5.2, p. 36 (arXiv v2).

<a id="gs-3-cuspidal-shtuka-cohomology"></a>

### Cuspidal shtuka cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/cuspidal-shtuka-cohomology` · definition.

For split G and fixed j,I,W, at a geometric point whose coordinates are generic and satisfy no nonzero Frobenius-graph relation as in Xue §2.3.8 (including the generic product and diagonal generic point), define H^{j,cusp,O_E} as the intersection of the kernels of all proper-parabolic constant-term maps from the HN-colimit compactly supported cohomology H^{j,O_E}. Each target is the modified Levi cohomology with its degree components and support conditions; one cannot replace it by an unmodified single Levi stack. The coefficient extension H^{j,cusp,E} is the analogous kernel over E.

**Direct prerequisites:** [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks), `EtaleDualityAndPerverseSheaves:EDC.8`.

**Construction or proof.**

1. Use the parabolic-to-G and parabolic-to-Levi correspondence with the coefficient sheaf pulled from Satake.
2. Form the direct limit in the G-bound and the specified modified Levi degree targets.
3. Intersect the proper-parabolic kernels and prove Hecke compatibility by the constant-term correspondence.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ShtukaCohom.constantTerm` | constructor | The componentwise map to the modified Levi cohomology. |
| `ShtukaCohom.cuspidal` | data | The simultaneous kernel, with its inclusion into the full HN colimit. |
| `ShtukaCohom.constantTerm_hecke` | compatibility | The map intertwines the unnormalized constant-term homomorphism of the Hecke algebras. |
| `ShtukaCohom.cuspidal_baseChange` | compatibility | After tensoring with E, integral cuspidal cohomology gives the rational cuspidal subspace. |

**Consumers.**

- GS.3 integral cusp finiteness: The truncation theorem concerns this kernel, not all cohomology.
- GS.5 full compact-support excursions: Constant-term compatibility preserves the cuspidal subspace.

**Unit tests.**

- ShtukaCohom.cuspidal_torus (compatibility): For a torus the intersection is over an empty family and is all cohomology.
- ShtukaCohom.cuspidal_no_legs (compatibility): With no legs, trivial W and j=0, obtain the imported cuspidal automorphic functions, rather than all compactly supported functions.
- ShtukaCohom.cuspidal_gl2 (non-example): For GL2 a compactly supported function with nonzero upper-triangular constant term is excluded, even though its support is finite.

**Acceptance checks.**

- All proper parabolics, or a source-proved detecting family of maximal ones, are required.

**Sources.**

- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), §2.3.8, Definitions 2.3.10–2.3.12, pp. 16–17; Proposition 4.2.6, p. 25.

Source obligations: G9: Xue geometric contraction and pseudo-product inputs.

<a id="gs-3-hecke-operator-as-creation-frobenius-annihilation"></a>

### Hecke operators from Frobenius

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation` · theorem.

For v∉N and V∈Rep Ĝ define S_{V,v} by creating V⊠V\*, applying Frob_first^{deg v}, then annihilating, with the source’s descent from a geometric point over v. On the locus where existing legs avoid v, this equals T(h_{V,v}); hence it extends that spherical Hecke action across v. The dimension-parity sign in the normalized h_{V,v} is essential.

**Direct prerequisites:** [GS.3/creation-and-annihilation-morphisms](#gs-3-creation-and-annihilation-morphisms), [GS.2/partial-frobenius-morphisms](#gs-2-partial-frobenius-morphisms), [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism).

**Construction or proof.**

1. Express creation and annihilation by cohomological correspondences supported on the relevant fusion diagonals.
2. Compare the Frobenius-twisted correspondence with the bounded local Hecke correspondence; the general bound uses IC and convolution rather than a minuscule replacement.
3. Apply the trace/correspondence identity and track the normalized sign; commute with total Frobenius to descend from the chosen geometric point.

**Acceptance checks.**

- V=1 gives the identity spherical operator.
- A degree-d place uses d partial Frobenius iterates, with q_v=q^d.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §6.1, Proposition 6.2 and Corollary 6.5, p. 75; proof in §§6.2–6.5, pp. 76–100.

Source obligations: G3: complete general Hecke–Frobenius correspondence calculation.

<a id="gs-3-eichler-shimura-relation"></a>

### The Eichler–Shimura relation

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/eichler-shimura-relation` · theorem.

If dim V=d and F₀ is partial Frobenius on the extra V-leg, then Σ\_{i=0}^d(−1)^i(F₀^{deg v})^i∘S_{Λ^{d−i}V,v}=0. Here S is the creation–Frobenius–annihilation operator; the relation is proved before identifying S with a Hecke operator. The latter identification gives the polynomial recurrence with integral spherical coefficients.

**Direct prerequisites:** [GS.3/creation-and-annihilation-morphisms](#gs-3-creation-and-annihilation-morphisms), [GS.2/partial-frobenius-morphisms](#gs-2-partial-frobenius-morphisms), `mathlib:ExteriorAlgebra`, `mathlib:LinearMap.charpoly`.

**Construction or proof.**

1. Form the alternating projector on V^{⊗(d+1)} and use Λ^{d+1}V=0.
2. Contract all but one tensor factor against Frobenius, grouping permutations by the cycle through the distinguished factor.
3. This gives the signed exterior-power polynomial; clear the characteristic-zero factorial denominators in the projector argument and track the source’s integral operators.

**Acceptance checks.**

- For d=1, S_{V,v}=F₀^{deg v}.
- For d=2 the relation is F²−S_V F+S_det=0; reversing exterior indices fails.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §7, Proposition 7.1 and proof, pp. 102–105.

<a id="gs-3-cuspidality-equals-hecke-finiteness"></a>

### The no-leg cusp identification

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/cuspidality-equals-hecke-finiteness` · theorem.

Under the no-leg/trivial-coefficient identification, H_{∅,1}^Hf=C_c^cusp((⊔αGα(F)\Gα(A)/Kα,N)/Ξ,E). In fact finite-dimensionality of the E-orbit under one spherical Hecke algebra at a split place already forces cuspidality. The integral cusp-function lattice is finite and Hecke-stable.

**Direct prerequisites:** [GS.3/hecke-finiteness](#gs-3-hecke-finiteness), [GS.0/cuspidal-automorphic-forms](#gs-0-cuspidal-automorphic-forms), [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks).

**Construction or proof.**

1. Cuspidal finite-dimensionality and the integral-function lattice give Hecke finiteness.
2. For a nonzero constant term use a contracting central cocharacter in a proper Levi. Its translates shift an integer support coordinate.
3. Compact support bounds that coordinate on one side, incompatible with a nonzero finite-dimensional shift-stable orbit. Thus every proper constant term vanishes.

**Acceptance checks.**

- For a torus the cusp condition is vacuous and the central quotient gives the finite function space.
- Finite O_E-generation is asserted for the integral lattice, not for the nonzero E-vector space as an O_E-module.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Proposition 8.23 and Lemmas 8.24–8.25 with proofs, pp. 117–119.

<a id="gs-3-pgl2-cohomological-constant-term"></a>

### PGL₂ boundary constant terms

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/pgl2-cohomological-constant-term` · theorem.

On a cofinal set of truncations containing the low-instability core, the perverse transitions are injective in degree 0, surjective in degree 1 and isomorphisms otherwise; nonzero perverse degrees eventually stabilize. There is an mc-isomorphism γ:pH⁰K→⊕κ∈K♯r Pκ. It intertwines the Hecke action with the Satake–Picard action modulo constructible errors. Restricting translations to high indices gives an mc-action, not an honest group action on that restricted direct sum.

**Direct prerequisites:** [GS.3/pgl2-ind-perverse-cohomology](#gs-3-pgl2-ind-perverse-cohomology), [GS.3/horocycle-compact-image](#gs-3-horocycle-compact-image), [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism), `EtaleDualityAndPerverseSheaves:EDC.5`.

**Construction or proof.**

1. Use the localization triangles only after all added horocycles satisfy the high-instability hypothesis of Lemma 3.28.
2. Compare the finite-type core and its complement; the core contributes constructible kernel and cokernel.
3. Split the high boundary according to distinct support classes X(κ), identify the top-dimensional generic fibres, and compare Hecke adjacency with Picard translation.

**Acceptance checks.**

- The cofinal high-bound condition prevents applying the pure-perverse calculation to low horocycles.
- Do not assume every horocycle is closed over the generic point of its support; Remark 3.35 explicitly avoids that claim.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.5.1–§3.5.4, Lemmas 3.33, 3.34 and 3.36, (3.32) and Remark 3.35, pp. 36–38 (arXiv v2).

<a id="gs-3-integral-cuspidal-finiteness"></a>

### Integral cusp finiteness

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/integral-cuspidal-finiteness` · theorem.

For split G and all cohomological degrees j, finite leg sets I and finite coefficient representations W in Xue’s setting, H^{j,cusp,O_E} is finitely generated over O_E, equals the integral Hecke-finite submodule, and extends to H^{j,cusp,E}=H^{j,Hf,E}. The cuspidal submodule lies in the image of the cohomology of one sufficiently large HN truncation, which is a finite O_E-module (Xue Proposition 3.2.2); no injectivity of the truncation maps is asserted. This proves the Hecke-finite/cuspidal equality for arbitrary legs and degrees in the split case, strengthening the original empty-leg theorem.

**Direct prerequisites:** [GS.3/cuspidal-shtuka-cohomology](#gs-3-cuspidal-shtuka-cohomology), [GS.3/hecke-finiteness](#gs-3-hecke-finiteness), [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations).

**Construction or proof.**

1. Use deep instability and constant-term comparison to show that the image of one sufficiently large truncation contains the entire cuspidal kernel. Its finite-type cohomology is a finite O_E-module.
2. A nonzero proper-parabolic constant term admits central-Levi Hecke translates moving to unbounded degree components; they contradict a finite integral Hecke orbit. Conversely the finite cuspidal module is Hecke-stable.
3. Prove constant-term kernels commute with extension to E using the uniform integral bounds, then use the cuspidal integral lattice to identify rational Hecke-finiteness.

**Acceptance checks.**

- This is not a finiteness assertion for the entire HN colimit.
- The nonsplit rational descent theorem below does not by itself extend this integral cuspidal theorem.

**Sources.**

- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), Theorem 3.2.1 and Propositions 3.2.2 and 3.2.7, pp. 18–19; Propositions 6.1.2, 6.2.12 and 6.3.3, pp. 32–37.

Source obligations: G9: Xue geometric contraction and pseudo-product inputs.

<a id="gs-3-pgl2-eisenstein-spectral-finiteness"></a>

### The PGL₂ Eisenstein spectral decomposition

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/pgl2-eisenstein-spectral-finiteness` · theorem.

Let H̄ be the image of H_G^Σ⊗Qℓ in End(V)×Qℓ[Pic_X(Fq)]^ι. For f in the Eisenstein ideal, fV is finite-dimensional. For every spherical place y, V is finite over H_y⊗Qℓ; H̄ is a finite-type algebra of Krull dimension one and V is finite over it. Its reduced spectrum is the disjoint union of the Eisenstein curve Spec Qℓ[Pic_X(Fq)]^ι and finitely many isolated points; V=V_Eis⊕V₀ canonically, with V₀ finite-dimensional. The ramified base-changed stack has the analogous decomposition and equivariant pairing.

**Direct prerequisites:** [GS.3/pgl2-cohomological-constant-term](#gs-3-pgl2-cohomological-constant-term), `DeligneWeightsAndPurity:DWP.7`.

**Construction or proof.**

1. Compare middle compact cohomology with global sections of pH⁰K; stabilized nonzero perverse degrees give finite-dimensional errors. The mc-zero action of the Eisenstein ideal then has finite rank.
2. Filter by growing instability in steps deg y. The associated graded spherical action is the Picard translation isomorphism in high degree.
3. Use purity of boundary pieces and the stabilized weight≤0 part of H¹ to show a finite initial segment generates V over H_y.
4. Noetherianity makes the Eisenstein ideal finitely generated, so its action has finite-dimensional support. Separate that support from the Eisenstein curve to obtain the canonical splitting.

**Acceptance checks.**

- The isolated non-Eisenstein sector is finite-dimensional; the whole V need not be.
- The proof uses any spherical place, not only a specially chosen degree-one place.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.5.5–§3.5.6, Lemma 3.37, Corollary 3.38, Proposition 3.39, Corollary 3.40 and Theorem 3.41, pp. 39–41 (arXiv v2).

<a id="gs-3-single-place-hecke-module-finiteness"></a>

### Finiteness over one local Hecke algebra

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/single-place-hecke-module-finiteness` · theorem.

For split G, all j,I,W and every good closed place u outside N, H^{j,O_E}\_{N,I,W} at the geometric fibres specified by Xue §2.3.8 is a finite module over the single spherical Hecke algebra H^{O_E}\_{G,u}. Its O_E-torsion has bounded exponent. It can be infinite over O_E: being finite over a finitely generated Hecke algebra is a different condition from the integral Hecke-finite condition used for the cuspidal subspace.

**Direct prerequisites:** [GS.3/cuspidal-shtuka-cohomology](#gs-3-cuspidal-shtuka-cohomology), [GS.3/integral-cuspidal-finiteness](#gs-3-integral-cuspidal-finiteness), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks), [GS.1/integral-geometric-satake](#gs-1-integral-geometric-satake).

**Construction or proof.**

1. Filter the colimit by HN bounds. In a sufficiently unstable maximal-parabolic sector, constant terms identify adjacent associated-graded pieces with Levi pieces.
2. A central-Levi cocharacter Hecke operator translates those graded pieces isomorphically toward a bounded region. Induction on the truncation filtration shows one bounded piece generates under H_{G,u}.
3. The bounded piece is finite over O_E. The spherical Hecke algebra is Noetherian; the ascending chain of λ-power torsion submodules therefore stabilizes.

**Acceptance checks.**

- The choice of u is arbitrary among good places.
- Do not conclude that every vector has a finite O_E Hecke orbit.

**Sources.**

- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), §5, 5.0.1, Proposition 5.0.2, Theorem 5.0.4 and Corollary 5.0.5, pp. 30–31.

<a id="gs-2-pgl2-finite-type-core"></a>

### The PGL₂ finite-type core

Target `GlobalShtukasAndFunctionFieldLanglands:GS.2/pgl2-finite-type-core` · theorem.

For standard Iwahori PGL2 shtukas of r modifications, the complement of horocycles with every Ni>max(2g−2,0) is of finite type. Subject to the standard parity r≡#Σ∞ mod 2, the entire stack is of finite type exactly when r<#Σ∞. The large-instability horocycles are nonempty and infinite in number in the opposite case.

**Direct prerequisites:** [GS.2/pgl2-horocycle-indices](#gs-2-pgl2-horocycle-indices), [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations), [GS.3/horocycle-compact-image](#gs-3-horocycle-compact-image).

**Construction or proof.**

1. If one intermediate bundle has bounded parabolic instability, at most r elementary modifications bound the starting ordinary instability by r+max(2g−2,0)+deg Σ.
2. If r<#Σ∞ the divisor endpoint condition prevents any admissible purely unstable sequence.
3. For r≥#Σ∞ construct infinitely many admissible indices with Ni arbitrarily large; use the rank-one quotient of each horocycle to prove nonemptiness.

**Acceptance checks.**

- For Σ∞=∅ and even r the unrestricted stack is not finite type.
- With r=0 and #Σ∞>0 even, the finite-type conclusion applies; no universal non-finite-type slogan is used.

**Sources.**

- [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions (II)](https://arxiv.org/pdf/1712.08026v2), §3.4.7, Lemma 3.30 and Corollary 3.31, p. 35 (arXiv v2).

## GS.4 — Drinfeld descent and product actions

Prove finite-cover and lisse Drinfeld descent before using it on Hecke-finite cohomology. A finite envelope can embed into one truncated sheaf only on its specified dense lisse open. The full-colimit route gives product Weil actions and ind-smoothness with the separate split integral and nonsplit rational hypotheses.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- N⊂X is a finite closed level subscheme, including its nilpotents; moving good legs lie in U∖|N|. A finite leg set, ordered partition and representation/bound are fixed whenever bounded geometry is asserted. Ξ controls central degree as in GS.0.

Atlas planets: Drinfeld’s lemma; Frobenius–Weil group; Product Galois action.

<a id="gs-4-drinfeld-lemma-for-finite-etale-coverings"></a>

### Drinfeld’s lemma for finite étale covers

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-finite-etale-coverings` · theorem.

For U a smooth geometrically connected curve over Fq, finite étale covers of U^I equipped with commuting lifts of the partial Frobenius maps whose product is the canonical total Frobenius form a Galois category equivalent to finite sets with continuous π₁(U)^I-action. Basepoints are specified; equivalent formulations use the quotient by the partial Frobenius actions.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `mathlib:CategoryTheory.GaloisCategory`.

**Construction or proof.**

1. Use Lang’s finite-dimensional semilinear descent for finite étale data after extending constants.
2. Descend finite étale algebras across partial Frobenius and recover the product of the finite-cover fibre functors.
3. Verify fullness and essential surjectivity, including the product-of-lifts condition.

**Acceptance checks.**

- For I={1} recover the ordinary finite étale Galois category.
- An arbitrary nonétale Frobenius-equivariant scheme need not descend: the twisted dual-number example in Remark 8.9 is excluded.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Lemma 8.11, p. 111; Lemmas 8.5 and 8.8 and Remarks 8.6 and 8.9, pp. 108–110.

<a id="gs-4-frobenius-weil-group"></a>

### The Frobenius–Weil group

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/frobenius-weil-group` · definition.

Let F^I be the function field of X^I and fix an algebraic closure over the constant algebraic closure. FWeil consists of automorphisms whose restriction to the perfection of the constant-closed function field is a product of integer powers of the coordinate partial Frobenius maps. It fits into 1→π₁^geom(η^I)→FWeil→Z^I→0. A specialization to the diagonal supplies the map to Weil(F)^I; basepoint choices must be recorded.

**Direct prerequisites:** [GS.2/partial-frobenius-morphisms](#gs-2-partial-frobenius-morphisms), `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Construction or proof.**

1. Define the extension using the perfected geometric generic field and coordinate Frobenius.
2. Extend an action of its geometric fundamental subgroup by the commuting partial Frobenius maps.
3. Compare the diagonal specialization and its product Weil degrees; use the geometric constant-field kernel convention.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `FrobeniusWeil` | data | Automorphisms with a witnessed coordinate-Frobenius degree tuple. |
| `FrobeniusWeil.degree` | projection | The homomorphism to Z^I with geometric kernel. |
| `FrobeniusWeil.diagonal` | functoriality | The specialization-dependent map to Weil(F)^I. |

**Consumers.**

- GS.4 Proposition 8.27: The Hecke-finite action factors through the product Galois group.
- GS.7 and Feng §5.6: Global/local Weil and coefficient-comparison maps must respect this action.

**Unit tests.**

- FrobeniusWeil.one_leg (compatibility): For one leg the degree quotient is Z and the geometric kernel is the geometric absolute Galois group.
- FrobeniusWeil.two_legs_degree (compatibility): For two legs the two coordinate degrees are independent; total Frobenius has degree (1,1).
- FrobeniusWeil.geometric_kernel_degree (compatibility): An element of the geometric kernel has degree zero in every coordinate; ordinary arithmetic Galois π₁ has a profinite degree quotient instead of Z^I.

**Acceptance checks.**

- Feng’s extraction records the constant-field typographical issue; use the geometric kernel as in VL rather than literally fixing the entire perfected function field.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Remark 8.18, pp. 114–115.
- [Tony Feng, Smith theory and cyclic base change functoriality](https://arxiv.org/pdf/2009.14236v6), §5.2.3, p. 36.

<a id="gs-4-coalescence-is-galois-equivariant"></a>

### Galois equivariance of coalescence

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/coalescence-is-galois-equivariant` · theorem.

The map χζ:H_{I,W}≃H_{J,W^ζ} intertwines Gal(F̄/F)^J via the coordinate-diagonal map Gal^J→Gal^I. It is E-linear, Hecke-equivariant, natural in W and compatible with composition of maps of finite sets.

**Direct prerequisites:** [GS.3/the-functor-H-I-W](#gs-3-the-functor-h-i-w), [GS.2/coalescence-isomorphisms](#gs-2-coalescence-isomorphisms).

**Construction or proof.**

1. Restrict the comparison to common finite lisse envelopes.
2. Compare partial Frobenius and specialization on each envelope, then apply the uniqueness part of Drinfeld descent.

**Acceptance checks.**

- Merging I={1,2} to one leg restricts γ↦(γ,γ), rather than multiplying two Galois elements.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §9, Proposition 9.7(b) and proof, pp. 132–133.

<a id="gs-4-compatibility-of-coalescence-with-partial-frobenius"></a>

### Fusion and partial Frobenius

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/compatibility-of-coalescence-with-partial-frobenius` · lemma.

For ζ:I→J, partial Frobenius at a j-leg after coalescence corresponds to the product of the commuting partial Frobenius maps over ζ⁻¹(j), using the canonical coefficient comparison and compatible iterated presentations.

**Direct prerequisites:** [GS.2/partial-frobenius-morphisms](#gs-2-partial-frobenius-morphisms), [GS.2/coalescence-isomorphisms](#gs-2-coalescence-isomorphisms).

**Construction or proof.**

1. Refine the partitions so each relevant leg is separate.
2. Check the cyclic rotations and the Satake fusion diagram before passing to the HN colimit.

**Acceptance checks.**

- For a bijection this is relabelling; for merging two legs it is a product of two commuting maps.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §4.5, Proposition 4.14, p. 70.

<a id="gs-4-drinfeld-lemma-for-lisse-sheaves"></a>

### Drinfeld’s lemma for lisse coefficients

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-lisse-sheaves` · theorem.

For a finite O_E-module lisse sheaf on U^I with the compatible commuting partial Frobenius structure, the fibre carries a continuous π₁(U)^I-action, and the lisse-sheaf construction is inverse. The statement includes torsion finite O_E-modules via reduction and inverse limits. For a sheaf initially lisse on a dense open, the extension lemma requires its partial-Frobenius compatibility and finiteness; it is not automatic for arbitrary generic representations.

**Direct prerequisites:** [GS.4/drinfeld-lemma-for-finite-etale-coverings](#gs-4-drinfeld-lemma-for-finite-etale-coverings), `EtaleDualityAndPerverseSheaves:EDC.0`.

**Construction or proof.**

1. Apply the finite-cover statement to finite coefficient quotients and use continuous inverse limits.
2. For a dense lisse open, propagate using partial Frobenius and the source’s extension argument before applying the global U^I statement.

**Acceptance checks.**

- Rank one and I=1 agree with the usual lisse representation correspondence.
- Without a finite module or locally finite semilinear descent hypothesis, the Laurent-polynomial example of Remark 8.6 prevents naïve descent.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Lemma 8.2, p. 107; Lemma 8.12, p. 112.

<a id="gs-4-creation-annihilation-commute-with-hecke-and-frobenius"></a>

### Naturality of leg operations

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/creation-annihilation-commute-with-hecke-and-frobenius` · theorem.

Creation and annihilation commute with Hecke operators away from the added legs and with partial Frobenius on unaffected legs. After the extended spherical action is constructed, the resulting excursions are endomorphisms of the full Hecke module. On created legs the operations retain the ordered Galois/Frobenius insertion rather than commuting it away.

**Direct prerequisites:** [GS.3/creation-and-annihilation-morphisms](#gs-3-creation-and-annihilation-morphisms), [GS.4/coalescence-is-galois-equivariant](#gs-4-coalescence-is-galois-equivariant), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks).

**Construction or proof.**

1. Compare the Cartesian correspondence diagrams on separate legs.
2. Use coefficient naturality, fusion coherence and the extended Hecke identity to descend the commutation relation.

**Acceptance checks.**

- For W=1 this reduces to commutation of the identity with the Hecke action.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §5, Definitions 5.1–5.2 and Lemma 5.3, pp. 71–72; §9, proof of Definition–Proposition 9.1, pp. 128–131.

<a id="gs-4-specialisation-and-independence-of-legs"></a>

### Independence of specialization choices

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/specialisation-and-independence-of-legs` · theorem.

Changing the product-generic point, specialization arrow or finite lisse envelope changes the transported Galois/fusion data by the corresponding comparison isomorphism. In the creation–action–annihilation composite these comparisons cancel, giving a canonical no-leg endomorphism.

**Direct prerequisites:** [GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts](#gs-3-specialisation-is-an-isomorphism-on-hecke-finite-parts), [GS.4/coalescence-is-galois-equivariant](#gs-4-coalescence-is-galois-equivariant).

**Construction or proof.**

1. Place both sets of choices inside a common finite lisse envelope.
2. Compare the two specialization maps and use naturality of the coefficient maps at both ends.
3. Cancel the conjugating comparison in the complete excursion composite.

**Acceptance checks.**

- Canonicity is asserted for the endomorphism, not for a chosen basepoint identification of absolute Galois groups.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §9, Lemma 9.4 and Proposition 9.7, pp. 130–133.

<a id="gs-4-galois-action-on-hecke-finite-cohomology"></a>

### The product Galois action

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology` · theorem.

The FWeil action on H^Hf factors uniquely through Gal(F̄/F)^I on an E-representation which is a filtered union of finite-dimensional continuous subrepresentations. Each finite subset is contained in a finite O_E-module whose action factors through π₁(U′)^I for some smaller nonempty U′⊂U; the open may depend on that finite piece.

**Direct prerequisites:** [GS.3/hecke-finite-part-is-a-union-of-constructible-subsheaves](#gs-3-hecke-finite-part-is-a-union-of-constructible-subsheaves), [GS.4/frobenius-weil-group](#gs-4-frobenius-weil-group), [GS.4/drinfeld-lemma-for-lisse-sheaves](#gs-4-drinfeld-lemma-for-lisse-sheaves).

**Construction or proof.**

1. Place the finite subset in a partial-Frobenius-stable lisse envelope.
2. Apply the lisse Drinfeld lemma and pass through the directed union.
3. Check agreement on overlapping finite envelopes for uniqueness and continuity.

**Acceptance checks.**

- No claim is made that the entire ind-cohomology carries a product Galois action by this argument.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Proposition 8.27 and its proof, pp. 119–123.

<a id="gs-4-full-cohomology-weil-descent"></a>

### Weil descent on full cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/full-cohomology-weil-descent` · theorem.

The Frobenius–Weil action on the full HN-colimit shtuka cohomology factors through Weil(F)^I: with O_E coefficients for split G as in Xue’s integral theorem, and with E coefficients for the connected reductive nonsplit groups of Xue’s parahoric setting. This statement is about Weil groups and the full colimit; it does not assert an action of the full profinite Galois group on a finite-dimensional space.

**Direct prerequisites:** [GS.4/frobenius-weil-group](#gs-4-frobenius-weil-group), [GS.4/drinfeld-lemma-for-finite-etale-coverings](#gs-4-drinfeld-lemma-for-finite-etale-coverings), [GS.4/drinfeld-lemma-for-lisse-sheaves](#gs-4-drinfeld-lemma-for-lisse-sheaves), [GS.3/eichler-shimura-relation](#gs-3-eichler-shimura-relation), [GS.3/single-place-hecke-module-finiteness](#gs-3-single-place-hecke-module-finiteness).

**Construction or proof.**

1. For a finite module M over a finitely generated commutative O_E-algebra A, reduce modulo powers of every maximal ideal. If λ lies in the maximal ideal the quotients are finite torsion O_E-modules; otherwise they are finite-dimensional E-modules. Apply the corresponding finite-coefficient or rational Drinfeld lemma; do not use the incorrect assertion that every quotient is torsion over O_E.
2. Use Krull intersection and localization to kill the Frobenius–Weil kernel on M. In the split integral case use finiteness over one local Hecke algebra.
3. For nonsplit rational coefficients use finite Hecke envelopes supplied by the Eichler–Shimura recurrence and finite local Hecke tensor products; take their directed union. This uses semisimplicity of the rational representation category, not an integral semisimplicity claim.

**Acceptance checks.**

- A finite A-module is not necessarily finite over O_E.
- Full profinite Galois descent on the integral Hecke-finite part is a separate GS.4 theorem.

**Sources.**

- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), §8.2, Lemmas 8.2.2 and 8.2.4 and Proposition 8.2.6, pp. 55–56.
- [Cong Xue, Smoothness of cohomology sheaves of stacks of shtukas](https://arxiv.org/pdf/2012.12833v1), Proposition 1.3.4 and Lemma 1.3.11, pp. 11–12; §6, Lemma 6.0.9 and Proposition 6.0.10, p. 35.

<a id="gs-4-ind-smoothness-of-full-cohomology"></a>

### Ind-smoothness of full cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.4/ind-smoothness-of-full-cohomology` · theorem.

For E coefficients and G with the parahoric model and good open of Xue §6, the entire cohomology ind-sheaf H^j_{N,I,W} is ind-smooth over (U∖|N|)^I: every specialization to the geometric generic fibre induces an isomorphism. The product Weil action factors through Weil(U∖|N|)^I. For split G with O_E coefficients, specialization from the diagonal generic fibre to the generic product is an isomorphism by Xue’s integral Proposition 8.1.2; the stronger nonsplit integral assertion is not inferred from the rational theorem.

**Direct prerequisites:** [GS.4/full-cohomology-weil-descent](#gs-4-full-cohomology-weil-descent), [GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts](#gs-3-specialisation-is-an-isomorphism-on-hecke-finite-parts), [GS.2/partial-frobenius-morphisms](#gs-2-partial-frobenius-morphisms).

**Construction or proof.**

1. First prove invariance under specialization on the generic product, using finite Frobenius envelopes and the injectivity argument.
2. Use the tensor evaluation/coevaluation identity, pseudo-product sheaves and the source’s specialization theorem on products of strictly henselian traits to prove the specialization maps at closed leg tuples are isomorphisms. Factor general specializations through a closed tuple to obtain ind-smoothness on the good product.
3. Apply the same method to the parahoric/nonsplit geometry with its twisted Satake coefficients. Preserve the rational coefficient hypothesis; record the distinct split integral diagonal-specialization theorem.

**Acceptance checks.**

- The untruncated ind-sheaf need not be one finite-rank lisse sheaf.
- The theorem includes collision diagonals inside the good product, not just distinct legs.

**Sources.**

- [Cong Xue, Smoothness of cohomology sheaves of stacks of shtukas](https://arxiv.org/pdf/2012.12833v1), Theorem 4.2.3, p. 32; §6, Theorem 6.0.12 and Proposition 6.0.13, p. 36.
- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), §8.1, Proposition 8.1.2, p. 55.

Source obligations: G9: Xue geometric contraction and pseudo-product inputs.

<a id="gs-3-hecke-finite-part-is-a-union-of-constructible-subsheaves"></a>

### Finite lisse envelopes

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finite-part-is-a-union-of-constructible-subsheaves` · theorem.

Every finite O_E-submodule of the Hecke-finite generic fibre is contained in a finite O_E-module M̃ stable under the product Galois action, factoring through π₁(U′)^I for a dense open U′ depending on that piece. It is the generic fibre of a lisse O_E-sheaf on (U′)^I with compatible partial Frobenius. That sheaf embeds into one sufficiently large HN truncation only on a dense open Ω⊂(U′)^I where the truncation is lisse. No embedding on the whole product, no fixed U′ for every piece, and no single finite lattice for all cohomology are asserted.

**Direct prerequisites:** [GS.3/hecke-finiteness](#gs-3-hecke-finiteness), [GS.3/eichler-shimura-relation](#gs-3-eichler-shimura-relation), [GS.3/hecke-operator-as-creation-frobenius-annihilation](#gs-3-hecke-operator-as-creation-frobenius-annihilation), [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.4/drinfeld-lemma-for-lisse-sheaves](#gs-4-drinfeld-lemma-for-lisse-sheaves).

**Construction or proof.**

1. Choose a finite integral Hecke-stable module inside one truncation and a product of closed points in its lisse open.
2. At each coordinate use the Eichler–Shimura recurrence of degree deg(v_i)dim(W_i), with Hecke coefficients preserving the module. This bounds all Frobenius powers by a finite box.
3. Take the finite partial-Frobenius-stable enlargement, extend its lisse locus using the source’s extension lemma, and apply Drinfeld’s lemma.

**Acceptance checks.**

- The finite Frobenius box is the missing bridge from Hecke finiteness to a product Galois action.
- Retain the Ω restriction in Remark 8.28: its equality with the whole product is explicitly not needed or proved there.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Proposition 8.27 and Remark 8.28 with proof, pp. 119–123.

<a id="gs-3-specialisation-is-an-isomorphism-on-hecke-finite-parts"></a>

### Hecke-finite specialization

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts` · theorem.

For a chosen specialization from the product generic point to the diagonal generic point, the induced map between the corresponding HN-colimit fibres is an isomorphism on Hecke-finite parts. Its inverse is used with the transported product Galois action; the eventual excursion endomorphism is independent of this choice.

**Direct prerequisites:** [GS.3/hecke-finite-part-is-a-union-of-constructible-subsheaves](#gs-3-hecke-finite-part-is-a-union-of-constructible-subsheaves), [GS.3/eichler-shimura-relation](#gs-3-eichler-shimura-relation).

**Construction or proof.**

1. For surjectivity, move a finite lisse envelope by partial Frobenius so a diagonal specialization meets its lisse open, then invert the finite Frobenius action.
2. For injectivity, specialize a kernel vector to a closed diagonal point and form its multi-index partial-Frobenius iterates.
3. Use the coordinate polynomial recurrences, density of the partial-Frobenius orbit and invertibility of total Frobenius to force the whole finite recurrence box to vanish.

**Acceptance checks.**

- The proof must establish injectivity as well as existence of a generic lift.
- An arbitrary ind-constructible sheaf without the recurrences has no such specialization theorem.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §8, Propositions 8.31–8.32 and Corollary 8.34, pp. 123–127.

<a id="gs-3-the-functor-h-i-w"></a>

### The cohomology functors H_{I,W}

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W` · definition.

Define H_{I,W} as the Hecke-finite diagonal-generic fibre of the HN cohomology system, transported through the specialization isomorphism when a product-generic fibre is needed. It is an E-linear functor in Rep_E(Ĝ^I), a Gal(F̄/F)^I representation which is a filtered union of finite-dimensional continuous subrepresentations, and has the coalescence isomorphisms χζ and the commuting Hecke action. For I=∅, W=1 it is the cusp space.

**Direct prerequisites:** [GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts](#gs-3-specialisation-is-an-isomorphism-on-hecke-finite-parts), [GS.3/cuspidality-equals-hecke-finiteness](#gs-3-cuspidality-equals-hecke-finiteness), [GS.4/galois-action-on-hecke-finite-cohomology](#gs-4-galois-action-on-hecke-finite-cohomology).

**Construction or proof.**

1. Take the specified Hecke-finite subspace and use specialization to transport the product Galois action.
2. Verify naturality and independence of the chosen specialization on common finite lisse envelopes.
3. For split G record Xue’s cited finite-dimensionality improvement; the main construction uses only the ind-finite statement and does not assume the improvement for every nonsplit case.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ShtukaH` | data | The specified Hecke-finite fibre and its Hecke action. |
| `ShtukaH.map` | functoriality | An E-linear coefficient functor in W. |
| `ShtukaH.galois` | structure | A continuous action on each finite-dimensional stable piece. |
| `ShtukaH.fusion` | compatibility | χζ natural in W and coherent in ζ, including the empty set. |

**Consumers.**

- GS.5: Its indexed fusion and Galois action supply every global excursion operator.

**Unit tests.**

- ShtukaH.no_legs_cusp (compatibility): H_{∅,1} is exactly the cusp space, including the Ξ quotient.
- ShtukaH.trivial_leg (compatibility): Adding a trivial leg does not change the underlying Hecke module.
- ShtukaH.fusion_diagonal_restriction (compatibility): For ζ merging two legs, coefficients restrict by g↦(g,g), so V⊠V\* becomes V⊗V\*, rather than forgetting a factor.

**Acceptance checks.**

- Do not impose a tensor equivalence between all H spaces; the needed structure is the indexed functor with fusion.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §9, Definition 9.3, Remark 9.5 and Proposition 9.7(a), pp. 130–132; §8, Remark 8.29, p. 120.

## GS.5 — Global excursions and parameterization

Realize the imported abstract excursion datum by cohomological leg operations, prove its continuity and unramifiedness, and apply LP2 reconstruction. The resulting global theorem has generalized excursion blocks and scalar good-place Hecke eigenvalues in characteristic zero. Integral/modular cusp blocks and the full compact-support action are separate coefficient targets. Conjectural multiplicities and the conditional eigensheaf comparison retain their stated status.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- N⊂X is a finite closed level subscheme, including its nilpotents; moving good legs lie in U∖|N|. A finite leg set, ordered partition and representation/bound are fixed whenever bounded geometry is asserted. Ξ controls central degree as in GS.0.

Atlas planets: Global excursion operators; Excursion identities; Excursion algebra; Cuspidal spectral decomposition.

<a id="gs-5-excursion-operator"></a>

### Global excursion operators

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator` · construction.

For finite I, W∈Rep_E(Ĝ^I), diagonal-Ĝ-invariant x∈W and ξ∈W\*, and (γi)∈Gal(F̄/F)^I, define S_{I,W,x,ξ,γ} on C_c^cusp(Bun_{𝒢,N}(Fq)/Ξ,E) by creation at the generic diagonal, inverse coalescence to H_{I,W}, action of (γi), coalescence back and annihilation. It is independent of the specialization choices and commutes with the full level-N Hecke algebra.

**Direct prerequisites:** [GS.3/creation-and-annihilation-morphisms](#gs-3-creation-and-annihilation-morphisms), [GS.3/cuspidality-equals-hecke-finiteness](#gs-3-cuspidality-equals-hecke-finiteness), [GS.4/galois-action-on-hecke-finite-cohomology](#gs-4-galois-action-on-hecke-finite-cohomology), [GS.4/creation-annihilation-commute-with-hecke-and-frobenius](#gs-4-creation-annihilation-commute-with-hecke-and-frobenius), [GS.4/specialisation-and-independence-of-legs](#gs-4-specialisation-and-independence-of-legs).

**Construction or proof.**

1. Identify the trivial-coefficient no-leg space with cusp forms by Proposition 8.23.
2. Compose the coefficient maps and the product Galois action on the Hecke-finite space; compare specialization choices using Remark 9.4.
3. Use the correspondence naturality on each finite envelope and pass to the union.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GlobalExcursion.operator` | constructor | The endomorphism from (I,W,x,ξ,γ). |
| `GlobalExcursion.choiceIndependent` | characterisation | Any common refinement of the specialization choices gives the same endomorphism. |
| `GlobalExcursion.heckeLinear` | compatibility | It belongs to the commutant of the full level-N Hecke action. |

**Consumers.**

- GS.5 parameter decomposition: Their simultaneous characters recover global parameters.
- GS.7 local comparison: Restriction of γi to a decomposition group is compared with a local convolution element.

**Unit tests.**

- GlobalExcursion.trivial_rep (compatibility): For W=1 and ξ(x)=a the operator is a·Id, including a=0.
- GlobalExcursion.unit_tuple (compatibility): With all γi=1 the operator is ξ(x)·Id.
- GlobalExcursion.two_leg_hecke (compatibility): For I={1,2}, W=V⊠V\*, x=coevaluation and ξ=evaluation, (Frob_v,1) gives the normalized spherical Hecke operator; no ordinary trace at one leg replaces this two-leg construction.

**Acceptance checks.**

- The definition is an actual action on the cusp space, not a new abstract generator with assumed relations.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §9, Definition–Proposition 9.1, pp. 128–129.

<a id="gs-5-invariant-functions-and-the-index-f"></a>

### Invariant-function indexing

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/invariant-functions-and-the-index-f` · theorem.

The shtuka operator depends on (W,x,ξ) only through f((gi))=ξ((gi)x)∈O(Ĝ\Ĝ^I/Ĝ). Every such invariant function is a matrix coefficient of this form. Thus the geometric construction supplies an operator S_{I,f,γ}; it realizes, rather than redefines, the abstract excursion datum imported from LP2.

**Direct prerequisites:** [GS.5/excursion-operator](#gs-5-excursion-operator), `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`.

**Construction or proof.**

1. For a matrix coefficient take the cyclic subrepresentation generated by x and quotient by the largest subrepresentation annihilated by ξ.
2. Identify the quotient with the finite-dimensional translation span of f in O(Ĝ^I/Ĝ).
3. Apply naturality of H to the injection and quotient, so the composite depends only on this canonical cyclic coefficient.

**Acceptance checks.**

- No freeness or preferred decomposition of W is used.
- For I=1 the double quotient has only constants; conjugation-invariant functions of one group variable correspond to two legs.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §10, Notation 10.5, Lemma 10.6 and Notation 10.7, pp. 137–138.

<a id="gs-5-satake-compatibility-and-chebotarev"></a>

### Satake scalars and parameter separation

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev` · theorem.

For f(g1,g2)=χV(g1g2⁻¹) and γ∈Gal(F̄\_v/Fv) of Weil degree d≥0, S_{{1,2},f,(γ,1)} depends only on d, and for d=1 equals T(h_{V,v}). Chebotarev and continuity determine all single-element semisimple classes from good-place Satake data. This determines a semisimple GLr representation by its trace, but does not imply simultaneous conjugacy of general reductive-group parameters; all-tuples excursions supply that stronger separation.

**Direct prerequisites:** [GS.3/hecke-operator-as-creation-frobenius-annihilation](#gs-3-hecke-operator-as-creation-frobenius-annihilation), [GS.5/excursion-operator](#gs-5-excursion-operator), [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism), `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`, `DeligneWeightsAndPurity:DWP.3/function-field-chebotarev`.

**Construction or proof.**

1. Transport partial Frobenius through the specialization comparison to obtain the degree-d dependence and use Proposition 6.2 when d=1.
2. Use Chebotarev only for continuous class functions, obtaining individual conjugacy-class information.
3. For GL_r use IHG.1's semisimple reconstruction of field determinants and IHG.0's injectivity of the trace in characteristic zero (the pseudocharacter theorem of Taylor recalled in VL Remark 11.8). Keep all-tuples invariants for general Ĝ.

**Acceptance checks.**

- No unverified explicit Blasius–Lapid pair is used as a unit test; the logical distinction between elementwise and simultaneous conjugacy is enough for this theorem.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §10, Lemma 10.2, p. 135; §11, Remarks 11.6 and 11.8, pp. 142–143; §0.7, pp. 36–37.

<a id="gs-5-excursions-on-full-compact-cohomology"></a>

### Excursions on full compact cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursions-on-full-compact-cohomology` · construction.

For split G, finite extra legs J, V∈Rep_{O_E}(Ĝ^J), any j and invariant x∈W, ξ∈W\*, define S^{O_E}\_{I,W,x,ξ,γ} on H^{j,O_E}\_{N,J,V}|∆\_J(η) by creation of I, the product Weil action acting trivially on J, and annihilation of I. The operators commute with proper-parabolic constant terms and extension to E. At J=∅, V=1, j=0 they act on the full compactly supported automorphic space, including its noncuspidal part. The nonsplit E-coefficient version uses ind-smoothness; the precise finite-torsion nonsplit extension needed for the general integral local theorem remains G8.

**Direct prerequisites:** [GS.5/excursion-operator](#gs-5-excursion-operator), [GS.1/integral-geometric-satake](#gs-1-integral-geometric-satake), [GS.4/full-cohomology-weil-descent](#gs-4-full-cohomology-weil-descent), [GS.4/ind-smoothness-of-full-cohomology](#gs-4-ind-smoothness-of-full-cohomology), [GS.3/cuspidal-shtuka-cohomology](#gs-3-cuspidal-shtuka-cohomology).

**Construction or proof.**

1. Use the integral diagonal specialization isomorphism to transport the full product Weil action; this avoids the Hecke-finite restriction.
2. Create the auxiliary legs with x, insert identities on the retained legs, and annihilate with ξ.
3. Use constant-term correspondence compatibility and coefficient-natural Satake/cohomology maps to obtain the commuting diagrams; retain the nonsplit torsion source obligation.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CompactShtukaCohom.excursion` | constructor | Creation–Weil–annihilation on all cohomological degrees with the retained J legs. |
| `CompactShtukaCohom.excursion_constantTerm` | compatibility | The proper-parabolic constant term intertwines the G and Levi operators. |
| `CompactShtukaCohom.excursion_extendCoefficients` | functoriality | Extension O_E→E intertwines the integral and rational actions. |
| `CompactShtukaCohom.excursion_cusp` | compatibility | Restriction to the cuspidal subspace agrees with the original global excursion. |

**Consumers.**

- GS.7 local convolution detection: Poincaré series test the operator on all compactly supported functions.
- GL Proposition 8.1: Local excursion convolution is compared with this operator while keeping J and V.

**Unit tests.**

- CompactShtukaCohom.excursion_no_legs (degenerate): With I empty the operator is the scalar pairing ξ(x) on the unchanged J-cohomology.
- CompactShtukaCohom.excursion_noncuspidal (compatibility): With J empty and V trivial, noncuspidal compactly supported functions remain in the domain.
- CompactShtukaCohom.excursion_retained_legs (compatibility): The action of an auxiliary tuple inserts identity in each J coordinate; letting it act on a retained leg would fail this test.

**Acceptance checks.**

- The construction does not extend a finite-dimensional cusp operator to all functions by linear algebra alone.

**Sources.**

- [Cong Xue, Cohomology with integral coefficients of stacks of shtukas](https://arxiv.org/pdf/2001.05805v2), §8.3, Construction 8.3.3, 8.3.4 and Lemma 8.3.5, p. 57; §8.4, Proposition 8.4.2, p. 58.

Source obligations: G8: nonsplit full-cohomology torsion extension.

<a id="gs-5-excursion-relations"></a>

### The global excursion identities

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-relations` · theorem.

The shtuka realization satisfies the LP2 excursion relations: f↦S_{I,f,γ} is a unital E-algebra map for each tuple; reindexing ζ:I→J pulls back f and γ compatibly; disjoint unions multiply operators; and the three-copy identity inserts γi(γ′i)⁻¹γ″i into f. The tuple map is E-adically continuous through π₁(U)^I for some U for each fixed f. These are verified geometric relations, not axioms imposed on the cusp space.

**Direct prerequisites:** [GS.5/invariant-functions-and-the-index-f](#gs-5-invariant-functions-and-the-index-f), [GS.4/coalescence-is-galois-equivariant](#gs-4-coalescence-is-galois-equivariant), [GS.4/compatibility-of-coalescence-with-partial-frobenius](#gs-4-compatibility-of-coalescence-with-partial-frobenius), `LanglandsParameterStacks:LP2:excursion-presentation`.

**Construction or proof.**

1. Tensor products and disjoint legs give multiplication; coefficient naturality gives linearity.
2. Use fusion functoriality for reindexing. Insert coevaluation and evaluation in W⊗W\*⊗W and apply the two zigzag identities for the three-copy relation.
3. Put each finite set of coefficient maps in a finite lisse envelope; this proves continuity without finite-dimensionality of all H_{I,W}.

**Acceptance checks.**

- The ordered expression is γ(γ′)⁻¹γ″, which is essential for reconstruction.
- LP2 owns the universal presentation; this node checks its hypotheses for global cohomology.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §10, Lemma 10.1 and Proposition 10.8(i)–(iv), pp. 133–139.

<a id="gs-5-excursion-unramifiedness"></a>

### Unramifiedness of excursions

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-unramifiedness` · theorem.

Every S_{I,f,γ} depends only on the image of γ in π₁(X∖|N|)^I, and the resulting map to the finite-dimensional excursion algebra is E-adically continuous. In the nonsplit case replace |N| by |N|∪(X∖U_𝒢), where 𝒢 is reductive on U_𝒢.

**Direct prerequisites:** [GS.5/excursion-relations](#gs-5-excursion-relations), [GS.3/hecke-operator-as-creation-frobenius-annihilation](#gs-3-hecke-operator-as-creation-frobenius-annihilation), [GS.4/drinfeld-lemma-for-lisse-sheaves](#gs-4-drinfeld-lemma-for-lisse-sheaves).

**Construction or proof.**

1. At v outside the bad set, creation is defined over the whole diagonal through v. Lemma 10.4 compares local Galois degree d with the d·deg(v) partial Frobenius iterate.
2. For d=0 the created vectors are fixed by inertia in every coordinate, so inserting inertia changes no excursion.
3. Pass from the individual inertia groups to the closed normal subgroup they generate in π₁(U), retaining continuity.

**Acceptance checks.**

- This proves factorization through the entire specified good open, not only an unspecified smaller open.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §10, Lemma 10.4 and Proposition 10.10, pp. 136–140; §12.1, p. 149; §12.3.4, pp. 162–164.

<a id="gs-5-the-excursion-algebra"></a>

### The global excursion algebra

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra` · definition.

B_{N,Ξ,E} is the E-subalgebra of End_Hecke(C_c^cusp(Bun_{𝒢,N}(Fq)/Ξ,E)) generated by all S_{I,f,γ}. It is finite-dimensional and commutative, and contains the spherical Hecke operators at good places. After a finite coefficient extension splitting B, the cusp space decomposes into its generalized B-character spaces. Reducedness of B and diagonalizability of every excursion are not asserted.

**Direct prerequisites:** [GS.5/excursion-relations](#gs-5-excursion-relations), [GS.5/excursion-unramifiedness](#gs-5-excursion-unramifiedness), [GS.3/cuspidality-equals-hecke-finiteness](#gs-3-cuspidality-equals-hecke-finiteness), `FunctionFieldArithmetic:FA.6`.

**Construction or proof.**

1. The disjoint-union formula gives commutativity; finite-dimensionality of the cusp space makes B finite-dimensional.
2. Use Lemma 10.2 to embed the spherical operators into B.
3. Apply the primary decomposition for a finite-dimensional commutative algebra acting on a finite-dimensional vector space.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GlobalExcursion.algebra` | data | The image algebra inside the Hecke commutant. |
| `GlobalExcursion.generator` | constructor | Every geometric excursion has its canonical element of B. |
| `GlobalExcursion.generalizedBlock` | data | The simultaneous generalized character subspace. |
| `GlobalExcursion.primaryDecomposition` | structure | After a finite splitting extension the finite direct sum of blocks is the cusp space. |

**Consumers.**

- GS.5 Theorem 11.11: Index the primary blocks by reconstructed parameters.
- GS.5 modular branch: Primary blocks remain meaningful when Hecke operators are not semisimple.

**Unit tests.**

- GlobalExcursion.algebra_zero_space (compatibility): When the cusp space is zero the image algebra acts on the zero space and there are no nonzero blocks.
- GlobalExcursion.algebra_gm (compatibility): For Gm, ordinary reciprocity characters give the usual rank-one Hecke decomposition.
- GlobalExcursion.jordan_block (computation): On E² a Jordan operator with a nonzero upper entry has one two-dimensional generalized block and a one-dimensional eigenspace; the block API must distinguish them.

**Acceptance checks.**

- Use generalized eigenspaces even in characteristic zero; a finite-dimensional commutative algebra can have nilpotents.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §10, Notation 10.5, p. 137; §11, Remark 11.6, p. 142.

<a id="gs-5-reconstruction-of-a-langlands-parameter"></a>

### Global reconstruction of parameters

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter` · application.

For a character ν:B→Q̄ℓ, the maps Θ\_n^ν obtained by adding a base leg with γ0=1 satisfy the arbitrary-profinite-group character theorem requested from LP2. Applied to Γ=π₁(X∖|N|), H=Ĝ, it gives a continuous σν:Γ→Ĝ(E′) for one finite E′/Qℓ, with reductive Zariski closure, unique up to Ĝ(Q̄ℓ)-conjugacy, and ν(S_{I,f,γ})=f((σν(γi))). Distinct characters of B give distinct parameter classes.

**Direct prerequisites:** [GS.5/excursion-unramifiedness](#gs-5-excursion-unramifiedness), [GS.5/the-excursion-algebra](#gs-5-the-excursion-algebra), `LanglandsParameterStacks:LP2:semisimple-characters`.

**Construction or proof.**

1. Use Ĝ^n//Ĝ≃Ĝ\Ĝ^{n+1}/Ĝ via (g1,…,gn)↦(1,g1,…,gn) to turn the verified geometric relations into compatible Θ\_n.
2. Import the arbitrary-Γ reconstruction and its separate continuity clause from LP2: fix a tuple of maximal reductive closure and minimal centralizer, recover additional tuple entries uniquely, and apply the multiplication relation.
3. In that imported proof the fixed finite tuple lies in one finite extension E′; uniqueness descends every extra entry to E′, and surjectivity of restriction to its double-centralizer coordinate ring gives continuity.
4. The resulting invariant evaluations recover ν on all generators, proving injectivity of ν↦[σν].

**Acceptance checks.**

- A bare reference to LP2’s existing local-Weil character bijection is insufficient; the arbitrary-Γ extension is an explicit request.
- Chebotarev equality of individual semisimple classes does not replace the all-tuples character theorem.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §11, Definition–Proposition 11.3, Proposition 11.7 and Lemmas 11.9–11.10, pp. 141–146.

<a id="gs-5-the-main-decomposition"></a>

### The global cuspidal decomposition

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition` · theorem.

For split G, fixed N and central lattice Ξ, there is a canonical finite direct-sum decomposition C_c^cusp(Bun_{G,N}(Fq)/Ξ,Q̄ℓ)=⊕σ Hσ into full level-N Hecke submodules indexed by continuous semisimple global parameters unramified outside N, each defined over a finite Qℓ-extension. Hσ is the simultaneous generalized excursion eigenspace with evaluation f((σ(γi))). For every good v and irreducible V, T(h_{V,v}) acts on Hσ by the scalar χV(σ(Frob_v)). Zero summands may be omitted. No converse existence or general multiplicity formula is claimed.

**Direct prerequisites:** [GS.5/reconstruction-of-a-langlands-parameter](#gs-5-reconstruction-of-a-langlands-parameter), [GS.5/the-excursion-algebra](#gs-5-the-excursion-algebra), [GS.5/satake-compatibility-and-chebotarev](#gs-5-satake-compatibility-and-chebotarev).

**Construction or proof.**

1. Decompose the cusp space into primary B-character blocks and label each with its unique reconstructed parameter.
2. Spherical Hecke operators have the required generalized eigenvalue by the excursion identity.
3. Their adjoints are again spherical Hecke operators under the standard positive Hermitian pairing after scalar transport to C; commutativity makes them normal and diagonalizable. Their restriction to one generalized block therefore has the indicated scalar action.

**Acceptance checks.**

- The last step gives actual spherical Hecke scalars; it does not prove that every excursion is diagonalizable.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §11, Theorem 11.11 and proof, p. 148.

<a id="gs-5-nonsplit-groups-and-the-l-group"></a>

### The nonsplit global decomposition

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group` · theorem.

Let G/F be connected reductive with connected parahoric model 𝒢/X, reductive on U, and choose a finite splitting-of-pinning extension F̃/F. Put LG=Ĝ⋊Gal(F̃/F). The full cusp space on Bun_{𝒢,N}(Fq)/Ξ, including ker¹ pure-inner-form components, has the canonical generalized excursion decomposition indexed by continuous semisimple σ:Gal(F̄/F)→LG(E′), unramified outside |N|∪(X∖U), whose projection is the prescribed quotient to Gal(F̃/F). Good-place Satake operators act by χV(σ(Frob_v)), and the decomposition respects changes of N.

**Direct prerequisites:** [GS.0/nonsplit-descent-and-inner-forms](#gs-0-nonsplit-descent-and-inner-forms), [GS.1/nonsplit-satake-descent-via-the-l-group](#gs-1-nonsplit-satake-descent-via-the-l-group), [GS.5/reconstruction-of-a-langlands-parameter](#gs-5-reconstruction-of-a-langlands-parameter), [GS.5/the-main-decomposition](#gs-5-the-main-decomposition).

**Construction or proof.**

1. Use twisted Satake coefficients and retain the nonconstant local system of diagonal-Ĝ invariants when defining creation and annihilation before taking generic fibres.
2. Verify the same identities with O(Ĝ\(LG)^I/Ĝ); functions pulled back from the finite component quotient act by their prescribed scalar values.
3. Apply the disconnected reductive-group version of the imported LP2 character theorem. Those scalar values force the required projection, and the unramifiedness argument gives the stated good open.
4. Compare restriction of level and all inner-form components using the common Hecke action.

**Acceptance checks.**

- The finite quotient and its projection are part of the parameter; replacing LG by Ĝ loses the nonsplit arithmetic.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §12.1, Theorem 12.3 and Remark 12.4, pp. 148–152; §12.3.4–§12.3.5, pp. 162–165.

<a id="gs-5-integral-and-modular-excursions"></a>

### Integral and modular excursion blocks

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/integral-and-modular-excursions` · theorem.

Integral Satake coefficients make the excursion operators preserve the cusp O_E-lattice. Their reductions give, over F̄ℓ, canonical generalized blocks indexed by continuous completely reducible parameters into the dual group over F̄ℓ, with the prescribed L-group projection in the nonsplit case. The good-place Hecke action has the corresponding generalized eigenvalues; scalar action is not asserted in this coefficient branch.

**Direct prerequisites:** [GS.5/nonsplit-groups-and-the-l-group](#gs-5-nonsplit-groups-and-the-l-group), `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:semisimple-characters`, [GS.1/integral-geometric-satake](#gs-1-integral-geometric-satake).

**Construction or proof.**

1. Import the integral Satake coefficient extension, including the correct integral perverse convention, and run the geometric correspondence maps on the O_E-lattice.
2. Reduce the finite excursion algebra and apply the positive-characteristic completely-reducible character theorem from LP2, not the characteristic-zero reductive-closure criterion.
3. Apply primary decomposition without using the Hermitian normality argument in characteristic ℓ.

**Acceptance checks.**

- The integral/modular Satake extension and arbitrary-Γ positive-characteristic reconstruction are explicit supplier requests; they are not consequences of the rational Satake theorem.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §13, Proposition 13.1, Theorem 13.2 and Remark 13.3, pp. 166–169.

<a id="gs-5-conditional-geometric-langlands-comparison"></a>

### The conditional eigensheaf comparison

Target `GlobalShtukasAndFunctionFieldLanglands:GS.5/conditional-geometric-langlands-comparison` · application.

For split G at empty level, suppose a Ξ-equivariant ℓ-adic Hecke eigensheaf F on Bun_G has eigen-local-system E and has cuspidal trace function f. Assume the additional trace-comparison maps in VL Proposition 15.1 are compatible with partial Frobenius. Then f lies in the global block H_σ for the Galois parameter of E. The required maps are coefficient-natural and fusion-compatible; partial-Frobenius compatibility is the explicitly unwritten input. This conditional application is not a prerequisite of the proven decomposition.

**Direct prerequisites:** [GS.3/the-functor-H-I-W](#gs-3-the-functor-h-i-w), [GS.5/nonsplit-groups-and-the-l-group](#gs-5-nonsplit-groups-and-the-l-group).

**Construction or proof.**

1. Use the Frobenius-graph trace construction to obtain π\_{F,E,I,W}:colim_μ H^{0,≤μ}\_{N,I,W}→W_E, natural in W and compatible with fusion.
2. Assume its partial-Frobenius compatibility, which the source explicitly has not established in writing. Then creation–Galois–annihilation evaluates on f by f_I(σ(γ\_i)).
3. The empty-leg trace pairing identifies the resulting vector with the cusp trace function, so primary decomposition places it in H_σ.

**Acceptance checks.**

- This node records a conditional application and does not label an unwritten theorem as established.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §15, setting before Proposition 15.1 and Proposition 15.1 with proof, pp. 173–174.

Source obligations: G5: conditional eigensheaf trace comparison.

<a id="gs-3-conjectural-decomposition-and-the-multiplicity-spaces"></a>

### Multiplicity spaces beyond the theorem

Target `GlobalShtukasAndFunctionFieldLanglands:GS.3/conjectural-decomposition-and-the-multiplicity-spaces` · application.

The conjectural expression H_{I,W}≃⊕σ(Aσ⊗W_{σ^I})^{Sσ} is a comparison target labelled conjectural, not a theorem or a prerequisite. Arthur parameters and motivic independence assertions in VL Conjectures 12.7 and 12.12 are also outside the proven endpoint. The established result here uses generalized excursion eigenspaces and does not assume a reduced excursion algebra.

**Direct prerequisites:** [GS.3/the-functor-H-I-W](#gs-3-the-functor-h-i-w), [GS.5/the-main-decomposition](#gs-5-the-main-decomposition).

**Construction or proof.**

1. Compare the conjectural formula with the proven no-leg decomposition and retain its centralizer and invariant factors.
2. Check that no proof edge in the proven theorem graph uses this conjecture.

**Acceptance checks.**

- This node records a mathematical boundary, not an unresolved obligation to prove an open conjecture.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §0, Remark 0.30 and (0.43), pp. 27–28; §12.2.2–§12.2.4, Conjectures 12.7 and 12.12, pp. 153–155.

## GS.6 — The full GLr correspondence

This stage contains the independent two-leg proof: bounded opens, the controlled compactification, normalized correspondences, negligible boundary factors, pure essential middle cohomology, averaging and rank induction. It proves both directions of the finite-order correspondence, all local pair factors and temperedness. Constant twists and companions have the all-non-p-unit hypotheses required by Chin, providing the interface used by Kisin–Zhou. AutomorphicLFunctionsAndLocalFactors layer AL.3 (TauCetiRoadmap pull request #924) plans the same correspondence at every level. Each target it covers carries an acceptance check naming the AL.3 subsection, and the restructure entry on the GLr correspondence records the import; constant twists, companions and the excursion comparison stay here.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- Here G=GLr, r≥1. The induction hypothesis is the full correspondence in all ranks strictly below r; a central idele a has nonzero degree. Finite central characters and finite determinants are imposed on the finite-order correspondence.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- A cohomological trace computation fixes full level, a truncation polygon and the divisibility/averaging conditions of LL I.13 and VI.25; local factors share the stated additive character.

Atlas planets: Drinfeld shtukas; Compactified iterated shtukas; Rank-negligible cohomology; Essential trace identity; Global GLr correspondence.

<a id="gs-6-drinfeld-shtuka-varieties-of-rank-r"></a>

### Drinfeld shtukas of rank r

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/drinfeld-shtuka-varieties-of-rank-r` · construction.

For r≥1, Cht_N^r is the stack of rank-r bundles E,E′,E″ on X×S with injections E→E′←E″, line cokernels on the graphs of pole ∞ and zero 0, an isomorphism E″≃τE, and compatible full level N away from both legs. Divide by the tensor action of a central idele a of nonzero degree. It is Deligne–Mumford, locally of finite type, with relative dimension 2r−2 over (X∖N)², and has the two partial Frobenius maps and the finite étale Hecke correspondences. The central quotient does not bound instability.

**Direct prerequisites:** [GS.0/level-structures](#gs-0-level-structures), [GS.0/automorphisms-and-the-central-lattice](#gs-0-automorphisms-and-the-central-lattice), [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution), [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack).

**Construction or proof.**

1. Specialize the two modification bounds of the global shtuka stack to the standard and dual minuscule weights of GLr, retaining the order and its degree convention.
2. Match the injection presentation with the ordered Hecke diagram. Form the central quotient and compare level restrictions.
3. The local model gives dimension 2(r−1); Frobenius closure makes the diagonal unramified.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `DrinfeldShtuka` | data | The two-leg injection diagram with level and Frobenius closure. |
| `DrinfeldShtuka.centralQuotient` | constructor | Tensor by powers of the fixed nonzero-degree idele a. |
| `DrinfeldShtuka.genericLegs` | projection | The pole and zero map to (X∖N)². |
| `DrinfeldShtuka.compareGlobal` | equivalence | Identify the diagram with the GLr standard/dual two-leg global shtuka. |

**Consumers.**

- GS.6 compactification: The injection diagram embeds in the iterated-shtuka degeneration.
- GS.6 essential cohomology: Its middle compact-support cohomology realizes the rank-r factors.

**Unit tests.**

- DrinfeldShtuka.rank_one (computation): At r=1 the fibres have dimension zero and the correspondence becomes the Lang–Picard reciprocity construction.
- DrinfeldShtuka.rank_two_dimension (compatibility): For r=2 the relative dimension is two; the base has dimension two more.
- DrinfeldShtuka.not_finite_type (non-example): Keeping level and degree class fixed does not eliminate the unbounded family of unstable bundles when the legs are allowed.

**Acceptance checks.**

- The term variety does not license discarding residual stack automorphisms.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Two-leg unramified shtukas' and 'Leveled shtukas and ramified rank induction', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Introduction, pp. 4–8; Chapter I §1a–§1b, Definitions I.1–I.2, pp. 17–19; Chapter II §1a–§1b, pp. 33–36.

<a id="gs-6-rank-negligible-representations"></a>

### Rank-negligible constituents

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/rank-negligible-representations` · definition.

For the geometric generic point of X×X, an irreducible two-variable ℓ-adic representation is r-negligible if it is an irreducible direct factor of q∞\*σ1⊗q0\*σ2 with both ranks strictly below r. A finite-dimensional representation is r-negligible if all its irreducible subquotients have this property. A constituent is essential when it is not r-negligible. The source’s complete negligible objects also include the finite partial-Frobenius orbit sums required in the trace argument.

**Direct prerequisites:** [GS.4/frobenius-weil-group](#gs-4-frobenius-weil-group), `EtaleDualityAndPerverseSheaves:EDC.0`.

**Construction or proof.**

1. Use the two projection maps and the external tensor construction in the coefficient category.
2. Define the constituent property in the finite-length category and extend it by subquotient dévissage.
3. Keep the complete-orbit operation separate from mere negligibility.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `RankNegligible` | characterisation | A constituent occurs in a lower-rank external tensor product. |
| `RankNegligible.subquotient` | structure | The property is stable under subobjects, quotients and extensions in finite length. |
| `RankNegligible.completeOrbit` | constructor | The finite partial-Frobenius orbit operation used in trace averaging. |

**Consumers.**

- GS.6 middle-degree theorem: Remove exactly these constituents, rather than all boundary-supported complexes.
- GS.6 trace comparison: Complete negligible orbit sums are eliminated by the lower-rank Rankin–Selberg pole argument.

**Unit tests.**

- RankNegligible.rank_one (computation): For r=1 no positive-rank pair lies strictly below r, so every nonzero irreducible constituent is essential.
- RankNegligible.rank_two_products (compatibility): At r=2 every constituent of an external product of two rank-one systems is negligible.
- RankNegligible.rank_two_factor (non-example): At r=2 a product with one rank-two factor does not meet the definition merely because its other factor has rank one.

**Acceptance checks.**

- An external product can be reducible over the arithmetic two-variable group; use irreducible direct factors in the definition.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Essential cohomology and local factors', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §2b, Lemma VI.13 and Definition VI.14, pp. 166–167.

<a id="gs-6-rank-one-is-class-field-theory"></a>

### Rank-one reciprocity

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/rank-one-is-class-field-theory` · application.

At r=1 the finite-order correspondence is the function-field Artin reciprocity bijection between finite-order idele-class characters and continuous finite-order rank-one Galois characters. The Lang–Picard shtuka realizes the same normalized good-place values. With arithmetic Artin_v(πv)=Frob_v^arith and geometric Frob_v=(Frob_v^arith)⁻¹, the geometric eigenvalue of χ\_Gal is χ\_A(πv)⁻¹; changing the Artin convention changes the character identification accordingly.

**Direct prerequisites:** [GS.0/picard-and-the-gl1-case](#gs-0-picard-and-the-gl1-case), `FunctionFieldArithmetic:FA.4/profinite-reciprocity`, `FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard`.

**Construction or proof.**

1. Import reciprocity and its arithmetic normalization.
2. Compare the Picard Lang torsor and the translation by O(v) with the selected Frobenius action.
3. Restrict to finite characters for the finite-order induction base and retain the inverse when using geometric Frobenius polynomials.

**Acceptance checks.**

- A degree-one divisor suffices for degree normalization; it need not be a degree-one closed point.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Rank-one unramified reciprocity' and 'Ramified rank-one curve reciprocity', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §1e, proof of Proposition VI.11, p. 159.

<a id="gs-6-truncation-and-the-absence-of-a-stable-open"></a>

### Convex truncations of Drinfeld shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/truncation-and-the-absence-of-a-stable-open` · theorem.

The inequality HN(E)≤p for a normalized polygon p gives a finite-type open Cht_N^{r,≤p}/a^Z; these opens exhaust the central quotient. A fixed partial Frobenius iterate or a Hecke correspondence of compact support sends each bounded open into a larger one with an explicitly support-dependent polygon. No assertion that one fixed truncation is stable under every Hecke correspondence or both partial Frobenius maps is used.

**Direct prerequisites:** [GS.6/drinfeld-shtuka-varieties-of-rank-r](#gs-6-drinfeld-shtuka-varieties-of-rank-r), [GS.0/harder-narasimhan-truncations](#gs-0-harder-narasimhan-truncations), [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks).

**Construction or proof.**

1. Use HN boundedness modulo central degree.
2. Bound the change of every subbundle degree under elementary modifications by the coweights of the fixed correspondence; take a dominating polygon for the finitely many relative positions.
3. Use sufficiently convex p for the compactification; it is a different condition from an invariant open.

**Acceptance checks.**

- A claim of Frobenius-stable finite type cannot replace the transition maps in the directed cohomology system.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Bounded curve-bundle loci and shtuka truncations', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter I §1d, Proposition I.3 and pp. 21–22; Chapter III §1b, pp. 61–63.

<a id="gs-6-deligne-rank-induction"></a>

### Deligne’s rank induction

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/deligne-rank-induction` · theorem.

Assume the finite-central-character GLs correspondence with local pair factors and temperedness for every s<r. Then every irreducible rank-r ℓ-adic representation with finite-order determinant is automorphic, using the converse theorem. If each cuspidal π of GLr with finite-order central character also has an irreducible, pure weight-zero unramified-match σπ, the rank-r correspondence, all-place pair factors and temperedness follow. The r=1 input is function-field class field theory.

**Direct prerequisites:** [GS.6/rank-one-is-class-field-theory](#gs-6-rank-one-is-class-field-theory).

**Construction or proof.**

1. At good places attach the spherical GLr representation to σ; at bad places choose generic local factors with the prescribed determinant.
2. Twist by a finite-order character sufficiently ramified at the bad places. Lower-rank matching, local stability and Laumon’s product formula identify every required twisted L-function and epsilon factor.
3. Apply the converse theorem after checking polynomiality from H_c⁰=H_c²=0 for unequal irreducible ranks. If the automorphic output were an induced noncuspidal object, its lower-rank constituents would contradict irreducibility by Chebotarev.
4. Use globalization of a prescribed local supercuspidal and the local-factor converse identities to finish the all-place assertions and temperedness.

**Acceptance checks.**

- The analytic converse, strong multiplicity one, local stability and Laumon product formula are distinct inputs, planned upstream in AutomorphicLFunctionsAndLocalFactors §AL.3 and recorded here as gap G10; FA.5's finite-image Artin factors alone do not supply them.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Leveled shtukas and ramified rank induction' and 'Function-field local factors, multiplicity one and converse theorem', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §1e, Proposition VI.11 and Lemma VI.12, pp. 159–164; Appendix B §1, Theorem B.10, Proposition B.11 and Corollary B.12, pp. 227–229; Appendix B §2, Theorem B.13, pp. 229–231.

Source obligations: G10: function-field analytic and trace-formula inputs owned by AutomorphicLFunctionsAndLocalFactors.

<a id="gs-6-compactification-and-boundary-analysis"></a>

### Compactified iterated shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/compactification-and-boundary-analysis` · construction.

For p sufficiently convex relative to X,N and the fixed correspondence, the iterated-shtuka degeneration compactifies Cht_N^{r,≤p}/a^Z over the two-leg base. Boundary strata are indexed by nontrivial ordered decompositions r=r1+⋯+rk and satisfy the radicial, gerbe and open restrictions of LL Chapter III. Their presentations use products of lower-rank shtukas, including variants whose level contains the zero. For arbitrary nonreduced N use the normalization and the specified smooth open of the compactification; a smooth proper compactification is not asserted in general.

**Direct prerequisites:** [GS.6/truncation-and-the-absence-of-a-stable-open](#gs-6-truncation-and-the-absence-of-a-stable-open), `SchemeAndStackFoundations:SF.4`.

**Construction or proof.**

1. Replace the isomorphism part of the bundle diagram by the iterated-complete-homomorphism degeneration and impose the sufficiently convex HN conditions.
2. Stratify by the ranks of successive nonzero blocks; the associated quotient bundles give smaller-rank shtuka data.
3. Normalize the cover that adds level. Compare its boundary to the lower-rank products through the source’s universal-homeomorphism/gerbe maps.
4. For nonreduced level restrict to the smooth open used by V.14; use the general unstable-open trace theorem rather than inventing a smooth proper model.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IteratedShtuka.compactification` | data | The compactified bounded moduli problem, with its proper structural map. |
| `IteratedShtuka.openEmbedding` | projection | The original bounded shtuka open and the normalization with level. |
| `IteratedShtuka.boundaryStratum` | characterisation | Ordered compositions of r and their qualified lower-rank presentations. |
| `IteratedShtuka.smoothOpen` | structure | The source-defined open on which normalized Hecke correspondences can be used. |

**Consumers.**

- GS.6 boundary negligibility: Products of factors of ranks <r control the boundary constituents.
- GS.6 trace calculation: The specified smooth open supports the normalized correspondence and boundary trace classes.

**Unit tests.**

- IteratedShtuka.one_block (compatibility): For a composition with one block the construction recovers the open rank-r shtukas.
- IteratedShtuka.rank_two_boundary (compatibility): For r=2 the proper boundary compositions have two rank-one factors.
- IteratedShtuka.nonreduced_level (non-example): A thickened level N is retained in the normalization: its boundary is not defined by replacing N with N_red.

**Acceptance checks.**

- The lower-rank boundary includes zero-level incidence treated in Chapter II; omitting it loses strata.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Two-leg unramified shtukas' and 'Shtuka intersection cohomology and essential comparison', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter II §1, pp. 33–41; Chapter III §1, Theorem III.2, Proposition III.3, Corollary III.4 and Proposition III.5, pp. 60–68; Chapter V §1, pp. 114–118.

<a id="gs-6-normalized-hecke-correspondences"></a>

### Normalized correspondences on compactifications

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/normalized-hecke-correspondences` · theorem.

A fixed f in the level-N Hecke algebra extends by normalization to a correspondence on the compactified bounded stack and preserves the designated smooth open in both directions (LL V.14), after p is sufficiently convex. Near its Frobenius-twisted fixed points the local stability hypotheses of V.19 hold for sufficiently large separated leg degrees and powers. These normalized correspondences need not compose according to Hecke multiplication on the compactification; Hecke algebra relations are recovered on the essential quotient through comparison with the open tower.

**Direct prerequisites:** [GS.6/compactification-and-boundary-analysis](#gs-6-compactification-and-boundary-analysis), `EtaleDualityAndPerverseSheaves:EDC.8`.

**Construction or proof.**

1. Normalize the closure of the Hecke correspondence, rather than extending its function by a formal action.
2. Apply V.14 to both projections. Verify the local fixed-point stability using the displacement and large-power inequalities of V.19.
3. Pass to the essential graded object using the comparison maps; their negligible errors remove the dependence on the compactified extension.

**Acceptance checks.**

- Do not use a Hecke action on the whole normalized compactification: the source warns that these correspondences do not satisfy its algebra laws.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Essential cohomology and local factors', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Introduction, pp. 6–8; Chapter V §2, Theorem V.14, pp. 132–134; §3, Theorem V.19, pp. 142–150; Chapter VI §3b, Proposition VI.24, pp. 184–185.

<a id="gs-6-negligible-cohomology-and-induction-on-the-rank"></a>

### Negligible boundaries and middle degree

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/negligible-cohomology-and-induction-on-the-rank` · theorem.

Assume the GLs correspondence and temperedness for every s<r. The cohomology of the specific lower-rank boundary strata of the compactified shtukas is r-negligible. The essential alternating cohomology is concentrated in degree 2r−2, pure of weight 2r−2, independent of sufficiently convex truncation, and invariant under the partial Frobenius. The maps comparing the open, its designated smooth compactified open and larger truncations have negligible kernel/cokernel on the relevant degree, as in VI.21.

**Direct prerequisites:** [GS.6/compactification-and-boundary-analysis](#gs-6-compactification-and-boundary-analysis), [GS.6/rank-negligible-representations](#gs-6-rank-negligible-representations), `DeligneWeightsAndPurity:DWP.7`, `EtaleDualityAndPerverseSheaves:EDC.7`.

**Construction or proof.**

1. Apply the lower-rank correspondence and the Künneth spectral sequence to the Chapter III strata, including their zero-level variants.
2. Compare weight bounds from compact and ordinary cohomology and use the two partial Frobenius maps to constrain essential constituents.
3. Use purity and the Rankin–Selberg pole comparison to eliminate essential terms in all degrees except 2r−2.
4. Apply the localization and truncation diagrams to identify the remaining essential factors and the negligible kernels and cokernels.

**Acceptance checks.**

- This is a statement about the source’s strata and essential constituents; it is not a generic claim that every boundary cohomology complex is negligible.
- The induction hypothesis is all ranks below r. It is not a self-dependency on the final rank-r theorem.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Shtuka intersection cohomology and essential comparison' and 'Leveled shtukas and ramified rank induction', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §2c, Proposition VI.15, pp. 168–174; Proposition VI.20 and Corollary VI.21, pp. 177–181.

<a id="gs-6-essential-shtuka-cohomology"></a>

### Essential shtuka cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/essential-shtuka-cohomology` · construction.

On colim_p H_c^{2r−2}(Cht_N^{r,≤p}/a^Z), use the alternating filtration by maximal negligible subobjects and maximal essential successive pieces. The sum of the essential even/odd graded quotients stabilizes at each fixed sufficiently convex truncation and has finitely many nonzero steps. Its semisimplification H_{N,ess} is a finite-dimensional representation of the two-variable Weil group and the level Hecke algebra, pure of weight 2r−2; its Hecke traces agree with the normalized compactified correspondences by VI.24.

**Direct prerequisites:** [GS.6/negligible-cohomology-and-induction-on-the-rank](#gs-6-negligible-cohomology-and-induction-on-the-rank), [GS.6/normalized-hecke-correspondences](#gs-6-normalized-hecke-correspondences).

**Construction or proof.**

1. Define the alternating filtration using the finite-length negligible/essential constituent classes.
2. VI.21 identifies the essential graded pieces across bounds. Finite-dimensionality at one bound makes the essential filtration terminate, as proved in VI.22.
3. Compare three sufficiently large bounds surrounding the support of f; the commutative correspondence diagrams identify its essential trace with that of the normalized extension.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `EssentialShtuka.filtration` | data | The source’s alternating negligible/essential filtration of middle compact cohomology. |
| `EssentialShtuka.realisation` | constructor | The stabilized sum of essential graded pieces and its semisimplification. |
| `EssentialShtuka.heckeTrace` | compatibility | Normalized compactification traces agree on every essential constituent. |

**Consumers.**

- LL VI.25–VI.27: The trace identity and its factorization recover σπ.
- LL VII.6: The coefficient-field descent argument uses the Hecke/Galois realization of these factors.

**Unit tests.**

- EssentialShtuka.rank_one (computation): For r=1 there is no nonzero negligible constituent to remove.
- EssentialShtuka.truncation_invariant (compatibility): Enlarging a sufficiently convex truncation changes only negligible errors and leaves the essential graded factors unchanged.
- EssentialShtuka.nonsplit_extension (non-example): A negligible extension of an essential factor need not split canonically; the construction must still produce the same semisimplified essential representation.

**Acceptance checks.**

- HN,ess is a constructed semisimplified graded object; no canonical projector onto an essential direct summand of the unbounded complex is postulated.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Essential cohomology and local factors', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §3a–§3b, Lemmas VI.22–VI.23 and Proposition VI.24, pp. 181–185.

<a id="gs-6-trace-formula-and-the-matching-of-terms"></a>

### The essential trace identity

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/trace-formula-and-the-matching-of-terms` · theorem.

For fixed f in the level-N Hecke algebra and sufficiently convex truncation, the averaged two-leg Frobenius fixed-point count has the cuspidal rank-r term plus a finite sum of lower-rank terms (LL I.13). After passing to H_{N,ess}, these lower-rank contributions cancel. For distinct good leg places ∞,0 of sufficiently large degrees and s=deg∞·s′=deg0·u′ a multiple of the degree of the resulting point, Tr_{Hess}(f·Frob_x^{−s/deg x}) equals q^{(r−1)s}Σπ Trπ(f)(Σi zi(π∞)^{−s′})(Σj zj(π0)^{u′}).

**Direct prerequisites:** [GS.6/essential-shtuka-cohomology](#gs-6-essential-shtuka-cohomology), [GS.6/deligne-rank-induction](#gs-6-deligne-rank-induction), `EtaleDualityAndPerverseSheaves:EDC.8`.

**Construction or proof.**

1. Use the unstable-open fixed-point formula IV.12 only after the V.14/V.19 hypotheses have been checked; include the boundary trace classes.
2. Apply the Arthur–Selberg calculation of I.13 to the mean over the partial-Frobenius periodic orbit, not to a single unaveraged term.
3. Keep possible polynomial-in-s factors in the lower-rank error. The finite sum of cohomological exponential sequences forces the positive polynomial powers to cancel.
4. A residual lower-rank term would create a forbidden Rankin–Selberg pole when paired with its dual lower-rank external product. Purity and the absence of negligible constituents on Hess rule it out.

**Acceptance checks.**

- The numerical trace formula is not an equality of naïve point cardinalities; retain stack masses and normalized Hecke functions.
- The unrestricted global excursion theorem does not need this Arthur–Selberg computation.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Essential cohomology and local factors', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter I §2, Theorem I.13 and the following remark, pp. 31–32; Chapter IV, Theorems IV.7 and IV.12, pp. 97–99 and 110–111; Chapter VI §3c, Theorem VI.25 and proof, pp. 186–188.

Source obligations: G10: function-field analytic and trace-formula inputs owned by AutomorphicLFunctionsAndLocalFactors.

<a id="gs-6-the-global-correspondence-for-gl-r"></a>

### The global GLr correspondence

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r` · theorem.

For F=Fq(X), r≥1, ℓ≠p and a fixed coefficient identification with C, cuspidal automorphic representations of GLr(A_F) with finite-order central character correspond bijectively to irreducible continuous rank-r Q̄ℓ representations of Gal(F̄/F), unramified outside finitely many places, defined over a finite Qℓ-extension, with finite-order determinant. The correspondence matches normalized good-place characteristic polynomials and the ramification sets. Uniqueness is by strong multiplicity one and Chebotarev. It is a theorem in both directions.

**Direct prerequisites:** [GS.6/trace-formula-and-the-matching-of-terms](#gs-6-trace-formula-and-the-matching-of-terms), [GS.6/deligne-rank-induction](#gs-6-deligne-rank-induction), [GS.6/rank-one-is-class-field-theory](#gs-6-rank-one-is-class-field-theory).

**Construction or proof.**

1. Use the trace identity to decompose Hess=⊕π π^KN⊠Hπ(1−r), extracting Hπ by Hecke test functions.
2. Restrict Hπ to fibres over a large-degree leg and compare traces to obtain external irreducible factors. Rankin–Selberg poles and lower-rank matching force each factor to have rank exactly r and identify Hπ=q∞\*σπ⊗q0\*σπ∨.
3. Purity gives weight zero for σπ; determinant and good-place matching identify its finite-order determinant.
4. Close the natural-number induction using VI.11, starting with reciprocity in rank one.

**Acceptance checks.**

- The rank-r proof uses only previously completed ranks, not itself as a graph prerequisite.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Leveled shtukas and ramified rank induction' and the unramified pure realization theorem, states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VI §1d, Theorem VI.9(i), p. 158; §3d, Lemma VI.26 and Theorem VI.27 with proof, pp. 189–191.

<a id="gs-6-local-factors-purity-and-multiplicity"></a>

### Pair factors, temperedness and multiplicity

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/local-factors-purity-and-multiplicity` · theorem.

For matched π,σ and π′,σ′, all places v satisfy L_v(πv×π′v,Z)=L_v(σv⊗σ′v,Z) and ε\_v(πv×π′v,Z,ψv)=ε\_v(σv⊗σ′v,Z,ψv), with one common additive character and self-dual measure convention. Every πv is tempered; σ is pure of weight zero. The cusp representation has automorphic multiplicity one and strong multiplicity one; its fixed spherical Hecke line is one-dimensional when π is everywhere unramified, while π itself need not be.

**Direct prerequisites:** [GS.6/the-global-correspondence-for-gl-r](#gs-6-the-global-correspondence-for-gl-r), `FunctionFieldArithmetic:FA.2/differential-additive-character`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`, `DeligneWeightsAndPurity:DWP.7`.

**Construction or proof.**

1. Use local stability under highly ramified characters and global functional equations to isolate each bad local factor as in VI.11(ii).
2. Combine purity of σπ and the local-factor converse to obtain temperedness, including ramified places.
3. Import the automorphic multiplicity theorems; apply local spherical uniqueness only to the product of spherical fixed spaces.

**Acceptance checks.**

- Ramanujan is an output of this induction, never imported from DWP.10 to prove itself.
- One-dimensional spherical eigenspaces do not mean a global automorphic representation is one-dimensional.
- Upstream owner: AutomorphicLFunctionsAndLocalFactors (TauCetiRoadmap pull request #924), layer AL.3, subsections 'Leveled shtukas and ramified rank induction', states this target. Keep this node consistent with that statement; the retargeting is the restructure entry on the GL_r correspondence.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Theorem VI.9(ii), Theorem VI.10 and Proposition VI.11(ii), pp. 158–159; Appendix B §1, pp. 220–226.
- [Hongjie Yu, Number of cuspidal automorphic representations and Hitchin’s moduli spaces](https://arxiv.org/pdf/1807.04659v5), §2.3.1–§2.3.2, Definition 2.3.2 and Corollary 2.3.3, pp. 9–10.

Source obligations: G10: function-field analytic and trace-formula inputs owned by AutomorphicLFunctionsAndLocalFactors.

<a id="gs-6-constant-twists-and-coefficient-fields"></a>

### Constant twists and coefficient fields

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/constant-twists-and-coefficient-fields` · theorem.

For an irreducible lisse Q̄ℓ-sheaf L on a smooth curve over Fq, a constant rank-one twist makes det L finite order. The stronger conclusion that this twist is algebraic and plain of characteristic p requires that the Frobenius eigenvalues of L be algebraic and units at every non-p place; being units only at the chosen ℓ-adic place is insufficient. Under Chin Proposition 4.3’s equivalent algebraicity/plainness hypotheses one may choose the constant scalar algebraic and plain of characteristic p, and apply the finite-determinant correspondence to the twisted sheaf. If L is additionally pure of a specified weight w, the normalizing twist can be chosen pure of weight −w; algebraicity and plainness alone do not impose a weight.

**Direct prerequisites:** [GS.6/the-global-correspondence-for-gl-r](#gs-6-the-global-correspondence-for-gl-r), `FunctionFieldArithmetic:FA.4/profinite-reciprocity`.

**Construction or proof.**

1. Use finiteness of the geometric determinant to find a constant β whose twist has finite determinant.
2. Apply the finite-determinant theorem to the twist. Under the algebraic/plain hypotheses compare one Frobenius eigenvalue before and after twisting to prove β has the required number-theoretic properties.
3. Undo the twist only in a coefficient category where the selected scalar is defined; its field need not be Q.

**Acceptance checks.**

- This node does not infer p-plainness from continuity at a single ℓ-adic completion.

**Sources.**

- [Cheewhye Chin, Independence of ℓ of monodromy groups](https://arxiv.org/pdf/math/0206147v3), §4.2 and Proposition 4.3, pp. 13–14.

<a id="gs-6-excursion-comparison-for-gln"></a>

### The GLr excursion comparison

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/excursion-comparison-for-gln` · application.

Assuming the lower-rank GLs correspondence for all s<r, a GLr parameter occurring in the global excursion decomposition is irreducible and pure of weight zero. It therefore supplies the rank-r existence input of Deligne’s induction and equals the parameter of the independent GLr correspondence. This is a second proof route: the original compactification/essential-cohomology proof above remains independent of GS.5.

**Direct prerequisites:** [GS.5/the-main-decomposition](#gs-5-the-main-decomposition), [GS.6/deligne-rank-induction](#gs-6-deligne-rank-induction), [GS.6/the-global-correspondence-for-gl-r](#gs-6-the-global-correspondence-for-gl-r), `DeligneWeightsAndPurity:DWP.7`.

**Construction or proof.**

1. If an occurring σ were reducible, attach lower-rank cusp representations to its irreducible factors after the required determinant twists.
2. Good-place Satake matching would express L(π∨×π) as a product of unequal-rank Rankin–Selberg functions without its required pole. This is a contradiction.
3. The geometric weight comparison of Lemma 16.2 and the finite-order determinant give weight zero; uniqueness identifies the parameter with LL’s σπ.

**Acceptance checks.**

- GS.5 alone gives no general-group converse or multiplicity statement; this application uses the GLr rank induction.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), §16, introduction, Lemmas 16.2 and 16.4 with proof, pp. 174–177.

<a id="gs-6-companions-on-curves"></a>

### Compatible systems on curves

Target `GlobalShtukasAndFunctionFieldLanglands:GS.6/companions-on-curves` · theorem.

For an irreducible finite-determinant lisse Q̄ℓ-sheaf on a smooth curve, the good-place Frobenius polynomials lie in a number field; its eigenvalues are pure of weight zero and units at every place away from p. For each λ∤p there is an irreducible λ-adic companion with the same polynomials, after a finite local coefficient extension. More generally an algebraic p-plain irreducible sheaf belongs, after extending its number field, to a compatible system by the constant-twist reduction. The normalized slopes at p in the finite-determinant case satisfy the explicit bound (r−1)²/r of LL VII.6(iv).

**Direct prerequisites:** [GS.6/local-factors-purity-and-multiplicity](#gs-6-local-factors-purity-and-multiplicity), [GS.6/constant-twists-and-coefficient-fields](#gs-6-constant-twists-and-coefficient-fields).

**Construction or proof.**

1. Use automorphic multiplicity one and the rationality field of π to get one number field for all Frobenius polynomials.
2. Transport the automorphic representation to each λ-adic coefficient field and apply the GLr theorem again.
3. Use the essential-cohomology realization to descend a finite multiple of each companion and split the resulting central simple algebra over a finite extension.
4. Apply the constant twist criterion for the p-plain extension. Do not assert crystalline companions from this argument.

**Acceptance checks.**

- Companions match full characteristic polynomials at all good closed points, not just traces at one point.
- Drinfeld's companions on smooth varieties of higher dimension, requested from GS.6 by HodgeStructuresPartII H.5, are outside this layer; they are recorded in the GS.6 coverage as Part II material.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VII §2a, Theorem VII.6 and proof, pp. 198–200.
- [Cheewhye Chin, Independence of ℓ of monodromy groups](https://arxiv.org/pdf/math/0206147v3), §4.6, Theorem 4.6, pp. 15–16.
- [Mark Kisin and Rong Zhou, Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), §5.3.1, p. 53.

## GS.7 — Local excursions and all-place comparison

Keep finite jet budgets, coefficient exponent and congruence level visible in the restricted-shtuka construction. Transport general-base nearby cycles through the local correspondence before taking convolution and its completed-centre limits. The endpoint gives semisimple local/global compatibility, a distinct GLr monodromy comparison, the action with retained global legs and local gamma factors.

The following stage hypotheses apply to every target in this stage, with any specialization stated in the target itself:

- X is a smooth projective geometrically connected curve over k=Fq, with function field F and characteristic p.
- The generic group G/F is connected reductive. Its chosen model 𝒢/X is smooth affine with connected fibres and reductive over a nonempty open U. Split statements use the constant split reductive model unless stated otherwise.
- For rational sheaves ℓ≠p and E/Qℓ is finite and sufficiently large for the representations in use; half Tate twists use one fixed square root of q. Integral and torsion branches explicitly replace E by O_E or O_E/λ^s.
- K is a local function field of characteristic p, ℓ≠p. The restricted-shtuka construction first uses split G/K and its chosen integral model; the nonsplit extension uses parahoric models and the finite L-group of GL Theorem 9.1.
- Finite congruence level m, torsion exponent s, jet bounds and Frobenius iteration budget are fixed at the finite construction; all comparison maps respect these budgets.

Atlas planets: Restricted shtukas; Local nearby-cycle transport; Local excursion elements; Local–global compatibility.

<a id="gs-7-unramified-satake-as-the-first-case"></a>

### The unramified local comparison

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/unramified-satake-as-the-first-case` · theorem.

At a good hyperspecial place v, the restriction of an occurring global parameter has trivial inertia, and χV(σ(Frob_v)) is the normalized Satake eigenvalue of πv for every dual-group representation V. For split G the spherical local excursion indexed by f(g1,g2)=χV(g1g2⁻¹) and (Frob_v,1) equals h_{V,v}. This is the first comparison case, proved before constructing the ramified local elements.

**Direct prerequisites:** [GS.5/the-main-decomposition](#gs-5-the-main-decomposition), [GS.5/nonsplit-groups-and-the-l-group](#gs-5-nonsplit-groups-and-the-l-group), [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism).

**Construction or proof.**

1. Use global unramifiedness and the good-place Satake scalar theorem.
2. Identify the two-leg local convolution element using the same creation/Frobenius/annihilation calculation at hyperspecial level.

**Acceptance checks.**

- Normalize geometric Frobenius, the half-Tate twist and Haar volume one consistently with GS.1.

**Sources.**

- [Vincent Lafforgue, Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Theorem 11.11, p. 148; Theorem 12.3, pp. 151–152; §10, Lemma 10.2, p. 135.
- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §1, Remark 1.6, p. 8.

<a id="gs-7-restricted-shtukas-and-the-local-excursion-element"></a>

### Finite restricted shtukas

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/restricted-shtukas-and-the-local-excursion-element` · construction.

Let K be a local field of characteristic p with finite residue field k, choose a smooth k-curve Y with rational point v and completed local field K, and a split reductive G. For fixed ordered legs I,W, large jet multiplicities ni, level nv and integer r≥0, a restricted shtuka is (yi,𝒢,z,θ): a G-torsor on D_r=nv+Σni yi+Σni σ⁻¹yi+⋯+Σni σ⁻r yi, a bounded modification z at Σni yi, and θ:σ(a_z𝒢)|D_{r−1}≃𝒢|D_{r−1}. The scheme-theoretic inverse Frobenius divisors retain their thickening. For r=0 read the source convention D_{−1}=nv. Restriction from a global shtuka is defined over U_{I,r}, with the disjointness condition (2.10), and is smooth; decreasing jet data gives smooth restriction morphisms.

**Direct prerequisites:** [GS.1/global-hecke-stacks-and-convolution](#gs-1-global-hecke-stacks-and-convolution), [GS.0/level-structures](#gs-0-level-structures), [GS.2/global-shtuka-stack](#gs-2-global-shtuka-stack), `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use finite-jet torsors and the contracted-product modification a_z from the bounded Hecke correspondence.
2. Restrict the Frobenius identification only to the divisor on which both sides are defined; its inverse-image multiplicities are essential.
3. Express a fibre of global restriction as an equalizer: one map is smooth forgetting level and the other has zero relative differential because it factors through Frobenius. This proves smoothness.
4. Use the kernels of the jet-group restriction maps to describe the smooth transition fibres.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `RestrictedShtuka` | data | Finite-jet torsor, bounded modification and restricted Frobenius isomorphism. |
| `RestrictedShtuka.restrictGlobal` | functoriality | Restriction over the specified U_{I,r}, with its smoothness theorem. |
| `RestrictedShtuka.restrictJets` | functoriality | Decrease (n,ni,r), preserving the coefficient comparison. |
| `RestrictedShtuka.noLegs` | equivalence | For I=∅ identify the stack with B G(O_nv). |

**Consumers.**

- GL §3 and GS.7: Nearby cycles and their transport are formed on these algebraic stacks.
- GL §6: The no-leg object with its regular level representation identifies the final composite with a local Hecke function.

**Unit tests.**

- RestrictedShtuka.no_legs (degenerate): With I=∅ obtain B G(O_nv), rather than a discrete set with the automorphisms removed.
- RestrictedShtuka.zero_budget (compatibility): For n=0,r=0 obtain the bounded Grassmannian modulo G_{Σni yi}.
- RestrictedShtuka.budget_decrease (non-example): One partial Frobenius reduces the available iteration budget r by one; it is not an endomorphism of every fixed finite-jet stack.

**Acceptance checks.**

- The integer r counts Frobenius iterations and is unrelated to a representation rank.
- Restricted finite-type algebraic stacks here are not the perfectoid local shtuka diamonds imported from HS.2.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §2, Definition 2.11, Remarks 2.12–2.14, Definition 2.15, Proposition 2.16 and Lemma 2.17, pp. 14–18.

Source obligations: G6: local-model change at nonsplit bad places.

<a id="gs-7-nearby-cycles-over-general-bases"></a>

### General-base nearby-cycle imports

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/nearby-cycles-over-general-bases` · application.

Apply the general-base oriented-product nearby-cycle functor to the Satake sheaf tensored with the regular finite-level local system on the restricted-shtuka stack. At torsion coefficients Λ=O_E/λ^s, an appropriate modification of the leg base makes nearby cycles bounded constructible and compatible with every further base change for this chosen complex. Proper partition-forgetting and smooth restriction compare the nearby-cycle complexes. This is an application of a requested general-base extension of LPV.0; it is not a second definition of nearby cycles in GS.7.

**Direct prerequisites:** [GS.7/restricted-shtukas-and-the-local-excursion-element](#gs-7-restricted-shtukas-and-the-local-excursion-element), `LefschetzPencilsAndVanishingCycles:LPV.0`, [GS.5/integral-and-modular-excursions](#gs-5-integral-and-modular-excursions).

**Construction or proof.**

1. Import the oriented-product-topos construction and its base-change transformations from LPV.0 Part II, with the finite-presentation and invertible torsion hypotheses of Orgogozo.
2. Descend Satake coefficients along the finite-jet quotient and tensor with the regular G(O_mv) local system.
3. Choose the source-dependent modification of Y^I, then use proper base change and smooth descent to transport the complexes across the required restricted-shtuka diagrams.

**Acceptance checks.**

- A trait-only nearby-cycle theorem does not suffice.
- The alteration/modification depends on the chosen coefficient complex; there is no single universal modification for all W and all s in this statement.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §2, Lemma 2.20 and (2.27)–(2.28), pp. 21–22; §3, proof of Proposition 3.2, pp. 25–31.
- [Fabrice Orgogozo, Modifications et cycles évanescents sur une base de dimension supérieure à un](https://arxiv.org/pdf/math/0507475v1), arXiv:math/0507475v1, Théorème 1.1, pp. 2–3; Théorème 6.1, p. 16 (published as Theorems 2.1 and 8.1, the numbering GL cites).

<a id="gs-7-local-nearby-cycle-transport"></a>

### Transport on local nearby cycles

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-nearby-cycle-transport` · theorem.

For δ in the local higher-variable Frobenius–Weil group with degree tuple (di), and a sufficiently increasing tuple (mi) with mi+di≥0, there is a local morphism Tδ:RΨ\_{(mi)}SL→RΨ\_{(mi+di)}SL on the same finite restricted-shtuka special fibre. It intertwines the specialization and FWeil action on every global truncation. The local FWeil group surjects onto Weil(K)^I. The theorem uses the general-base modification theorem and the Gabber ULA specialization comparison recalled in EX24 A.9; a direct trait specialization argument does not supply it.

**Direct prerequisites:** [GS.7/nearby-cycles-over-general-bases](#gs-7-nearby-cycles-over-general-bases), [GS.4/frobenius-weil-group](#gs-4-frobenius-weil-group), [GS.4/drinfeld-lemma-for-finite-etale-coverings](#gs-4-drinfeld-lemma-for-finite-etale-coverings), `LefschetzPencilsAndVanishingCycles:LPV.0`.

**Construction or proof.**

1. Use Orgogozo’s modification so the nearby complex has arbitrary base-change compatibility.
2. Choose the unique point on that modification approached by sufficiently separated Frobenius powers; the valuation comparison in Lemmas 3.5–3.9 proves this independence.
3. Combine the δ-map at the generic product with Gabber’s ULA comparison between the generic product and Frobenius diagonal, producing Tδ and the global square.
4. Prove the local Drinfeld equivalence for finite étale algebras over iterated Laurent fields; it yields the required surjection to Weil(K)^I.

**Acceptance checks.**

- The stronger identification with iterated trait nearby cycles in GL Remark 3.12 is not a prerequisite; the proof explicitly avoids it.
- The Gabber comparison is a named unresolved supplier input, rather than an assumed base-change isomorphism.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §3, Proposition 3.2 with proof and Remark 3.12, pp. 24–31; §4, Lemmas 4.1–4.3, pp. 32–33.

<a id="gs-7-local-excursion-convolution"></a>

### Local excursion convolution elements

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-excursion-convolution` · construction.

For split G/K, pro-p congruence U_m, whose finite quotients have order prime to ℓ, Λ=O_E/λ^s, f∈O(Ĝ\Ĝ^I/Ĝ)\_Λ and (γi)∈Weil(K)^I, the restricted-shtuka composite defines z_{m,s,I,f,γ}∈C_c(U_m\G(K)/U_m,Λ). It is independent of the coefficient realization, leg ordering, local FWeil lift and sufficiently increasing Frobenius tuple; it is continuous in γ, compatible in s,m, and its global convolution equals the modular excursion on all compactly supported automorphic functions, at arbitrary additional level away from v.

**Direct prerequisites:** [GS.7/local-nearby-cycle-transport](#gs-7-local-nearby-cycle-transport), [GS.7/restricted-shtukas-and-the-local-excursion-element](#gs-7-restricted-shtukas-and-the-local-excursion-element), `EtaleDualityAndPerverseSheaves:EDC.8`, [GS.5/integral-and-modular-excursions](#gs-5-integral-and-modular-excursions), [GS.5/excursions-on-full-compact-cohomology](#gs-5-excursions-on-full-compact-cohomology).

**Construction or proof.**

1. Represent f by an integral finite-free matrix coefficient and lift γ to local FWeil.
2. Compose creation, ordered partial Frobenius to (mi), Tδ, return partial Frobenius and annihilation, decreasing jet/iteration budgets as required.
3. At zero legs the regular level local system identifies the result with a compactly supported double-coset function. Cartesian correspondence pullback proves the global convolution identity.
4. Use Lemma 1.4’s Poincaré-series detection with arbitrary away-v level to prove uniqueness, hence independence of every auxiliary choice and continuity.

**Proposed API.**

| Name | Role | Statement |
| --- | --- | --- |
| `LocalExcursion.convolution` | constructor | The compactly supported U_m-double-coset element at finite torsion coefficients. |
| `LocalExcursion.choiceIndependent` | characterisation | Every permitted finite-jet construction gives the same local function. |
| `LocalExcursion.globalAction` | compatibility | Right convolution equals the global excursion on C_c at every auxiliary away-v level. |
| `LocalExcursion.coefficientTransition` | functoriality | Reduce s or project the congruence level compatibly. |

**Consumers.**

- GS.7 Bernstein centre: The compatible family gives the central element.
- GS.7 local–global theorem: Equality on the full C_c space restricts to each cuspidal parameter block.

**Unit tests.**

- LocalExcursion.spherical_trace (compatibility): For the two-leg trace function at spherical level, where the prime-to-ℓ convenience is unnecessary, recover h_{V,v}.
- LocalExcursion.unit (compatibility): For f=1 recover the identity 1_{U_m} under volume-one convolution.
- LocalExcursion.realization_independent (non-example): Replacing one torsion realization (W,x,ξ) of f or changing a lift δ does not change the double-coset function; this needs the global detection theorem, not a chosen-isomorphism claim.

**Acceptance checks.**

- Use GS.5 excursions on full compact cohomology for the split action; retain G8 for its nonsplit torsion extension. The cuspidal action alone does not supply the detection step.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §1, Proposition 1.3 and Lemma 1.4, p. 7; §6, (6.1)–(6.3), Lemma 6.2 and Remark 6.3, pp. 36–40.

Source obligations: G8: nonsplit full-cohomology torsion extension.

<a id="gs-7-bernstein-center-and-local-parameters"></a>

### Bernstein centre parameters

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters` · theorem.

The local elements define z_{I,f,γ} in the projective limit over U of the ℓ-adic completions of the integral level Hecke centres, with the algebra, reindexing, three-copy and continuity identities. For an integral smooth admissible irreducible G(K)-representation over a finite Qℓ-extension, evaluating its central character reconstructs a continuous semisimple Gal(K̄/K)→Ĝ(Q̄ℓ) parameter. For an arbitrary such irreducible, one obtains a continuous semisimple Weil(K) parameter by constant-character twisting and normalized parabolic induction. The assignment depends only on its Bernstein central character and respects normalized induction.

**Direct prerequisites:** [GS.7/local-excursion-convolution](#gs-7-local-excursion-convolution), `LanglandsParameterStacks:LP2:semisimple-characters`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `ExcursionOperatorsAndSpectralAction:ES0`.

**Construction or proof.**

1. Global detection makes each finite-level element central and compatible with level and torsion reduction; take the completed inverse limit.
2. Evaluate on an integral character and use the separate Weil-continuity clause of the LP2 reconstruction theorem. Integral invariant values allow conjugation into Ĝ(O_E′), so the representation extends from Weil to the profinite Galois group.
3. Prove the Levi constant-term identity of Theorem 1.1(vi). Twist arbitrary supercuspidals to integral ones and extend using the supercuspidal support and normalized parabolic induction.
4. Apply the same detection argument to prove uniqueness and dependence only on the central character.

**Acceptance checks.**

- The initial theorem is for split G; GL §9 provides the nonsplit finite-L-group adaptation.
- An arbitrary nonintegral Weil parameter need not extend continuously to Gal(K̄/K).
- Noncompleted Bernstein-centre membership uses the additional comparison cited in GL Remark 1.2; it is not silently included in the completed-centre proof.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), Theorem 0.1, pp. 2–3; §1, Theorem 1.1 and the reduction to Proposition 1.3, pp. 5–9.

<a id="gs-7-local-excursions-on-compact-cohomology"></a>

### Local excursions on compact cohomology

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-excursions-on-compact-cohomology` · theorem.

With integral coefficients O_E and arbitrary additional legs J and coefficient V, the local elements z_{m,I,f,γ}=lim_s z_{m,s,I,f,γ} act by right convolution on colim_μ H^{0,≤μ,O_E}\_{N,J,V}|∆(η), and this action equals the global excursion constructed on compactly supported shtuka cohomology. The inverse-limit function tends to zero at infinity in the ℓ-adic topology. Finite support of every torsion reduction does not by itself prove finite support of this integral limit.

**Direct prerequisites:** [GS.7/local-excursion-convolution](#gs-7-local-excursion-convolution), [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.5/excursions-on-full-compact-cohomology](#gs-5-excursions-on-full-compact-cohomology).

**Construction or proof.**

1. Import Xue’s integral/modular compact-cohomology excursion action, including its coefficient and fusion compatibilities.
2. Repeat the Cartesian correspondence comparison with the extra legs J present.
3. Pass through coefficient reduction and inverse limit, keeping the distinction between finite support at every s and decay at infinity.

**Acceptance checks.**

- For J=∅ recover convolution on compactly supported automorphic functions.
- No uniform support in s is inferred just from the finite torsion construction. GL Remark 6.3 discusses a stronger uniform-modification argument using Ito, with additional details not supplied there.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §8, Proposition 8.1, pp. 42–43; Remark 6.3, p. 39.

Source obligations: G8: nonsplit full-cohomology torsion extension, G7: uniform integral local support refinement.

<a id="gs-7-local-global-compatibility-up-to-semisimplification"></a>

### Semisimple local–global compatibility

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification` · theorem.

If π=⊗v πv occurs in a global cusp block Hσ, then at every place v the local Genestier–Lafforgue parameter is Ĝ-conjugate to (σ|Gal(F̄\_v/Fv))^ss in the integral case, and to the semisimplified Weil restriction in the wider coefficient case. For nonsplit G use LGv and its prescribed finite quotient. This is equality of semisimple parameters, with no general monodromy operator or local packet multiplicity attached.

**Direct prerequisites:** [GS.5/nonsplit-groups-and-the-l-group](#gs-5-nonsplit-groups-and-the-l-group), [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters), [GS.7/local-excursion-convolution](#gs-7-local-excursion-convolution).

**Construction or proof.**

1. Restrict the global excursion-convolution identity to Hσ.
2. Its scalar character evaluates every invariant function on the tuple σ(γi), while the local centre character evaluates it on the local reconstructed tuple.
3. Use the all-tuples semisimple character theorem to obtain conjugacy; retain the finite-quotient projection for nonsplit G.

**Acceptance checks.**

- Equality of spherical eigenvalues at good places alone does not prove ramified local–global compatibility.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), Theorem 0.1(b), p. 2; Theorem 1.1(v), p. 6; §6, Lemma 6.2, p. 38; §9, Theorem 9.1, pp. 43–45.

Source obligations: G6: local-model change at nonsplit bad places.

<a id="gs-7-semisimplification-versus-monodromy"></a>

### Semisimplification and monodromy

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/semisimplification-versus-monodromy` · comparison.

For general G the preceding construction retains the ordinary semisimple local Galois/Weil parameter and cannot in general determine a nilpotent monodromy operator N from πv. For GLr the full classical local correspondence uses a Frobenius-semisimplified Weil–Deligne pair (r_v,N_v); Frobenius semisimplification retains N_v. Ordinary semisimplification and Frobenius semisimplification must therefore be separate operations and separate comparison statements.

**Direct prerequisites:** [GS.7/local-global-compatibility-up-to-semisimplification](#gs-7-local-global-compatibility-up-to-semisimplification), `LanglandsParameterStacks:LP1/weil-deligne-parameters`.

**Construction or proof.**

1. Import the Weil–Deligne carrier and its monodromy convention from LP1/arithmetic Galois theory.
2. Compare two WD pairs with the same underlying semisimple Weil representation and distinct N; their ordinary excursion invariants agree.
3. Use GL’s division-algebra example to explain why a single local D× representation can occur globally with different monodromy before ordinary semisimplification.

**Acceptance checks.**

- Do not write a full ramified WD comparison for general G as a consequence of the semisimple theorem.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), Remark 0.3, p. 3.
- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VII §1c, Corollary VII.5, p. 197.

<a id="gs-7-local-gamma-factors"></a>

### Local gamma factors

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-gamma-factors` · theorem.

For a reductive group over a local function field K, a finite-dimensional representation ρ of its finite L-group, a smooth irreducible representation π and characters χ:K×→Q̄ℓ× and nontrivial ψ:K→Q̄ℓ×, define γ(s,ρ,π,χ,ψ) by the Artin local factor of (ρ∘σπ)⊗χ. After coefficient identification with C these rational functions satisfy naturality, direct-sum multiplication, rank-one reciprocity, normalized parabolic induction, the change-of-ψ law, highly ramified stability and the global functional equation. They extend the existing function-field gamma-factor theories in their common ranges. These gamma factors depend only on the semisimple parameter, unlike separate L and epsilon factors in general.

**Direct prerequisites:** [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters), [GS.7/local-global-compatibility-up-to-semisimplification](#gs-7-local-global-compatibility-up-to-semisimplification), `FunctionFieldArithmetic:FA.2/differential-additive-character`, `FunctionFieldArithmetic:FA.4/profinite-reciprocity`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`.

**Construction or proof.**

1. Import Artin local factors and Laumon’s product formula with the fixed additive-character convention.
2. Apply the semisimple local parameter and its normalized induction compatibility. Verify the seven identities in §7.1.
3. For uniqueness globalize supercuspidal data by Poincaré series and isolate the desired place with highly ramified twists. The strengthened globalization cited in Remark 7.1 proves uniqueness without making stability an extra uniqueness axiom.

**Acceptance checks.**

- The rank-one factor is Tate’s local factor with the same reciprocity convention.
- Do not deduce ramified L or epsilon factors for general G from the gamma-factor identity.

**Sources.**

- [Alain Genestier and Vincent Lafforgue, Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale](https://arxiv.org/pdf/1709.00978v3), §7.1–§7.3 and Remark 7.1, pp. 40–42; §9, p. 45.

<a id="gs-7-gl-r-local-comparison-and-uniformization"></a>

### The ramified GLr local comparison

Target `GlobalShtukasAndFunctionFieldLanglands:GS.7/gl-r-local-comparison-and-uniformization` · comparison.

For the global GLr correspondence, at every place v the Frobenius-semisimplified Weil–Deligne representation attached to σπ|Gal(F̄\_v/Fv) corresponds to πv under the classical local Langlands correspondence, including monodromy and all local pair factors. For the local shtuka realization import the HS.2 moduli over a local field of either characteristic (HS2/general-local-field) and the HS.3 cohomology endpoints, and ES.7’s equal-characteristic classical comparison. Identifying that realization with the finite restricted-shtuka construction requires an additional comparison theorem; no general global-to-local uniformization equivalence is asserted here.

**Direct prerequisites:** [GS.6/local-factors-purity-and-multiplicity](#gs-6-local-factors-purity-and-multiplicity), [GS.7/semisimplification-versus-monodromy](#gs-7-semisimplification-versus-monodromy), `HeckeStacksAndLocalShtukas:HS2/general-local-field`, `HeckeStacksAndLocalShtukas:HS3/compact-support-at-levels`, `HeckeStacksAndLocalShtukas:HS3/satake-coefficients-and-partial-frobenius`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`.

**Construction or proof.**

1. Apply the all-place local pair-factor identities and the classical local characterization theorem VII.4.
2. Retain N in the WD pair while semisimplifying Frobenius.
3. For a cohomological realization use the imported local moduli/cohomology comparison at its exact coefficient and group hypotheses; record the finite-jet-to-local-realization bridge as a request.

**Acceptance checks.**

- The ramified GLr theorem is already available from LL and does not require proving that every global shtuka is uniformly a local shtuka.

**Sources.**

- [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Chapter VII §1b–§1c, Proposition VII.4 and Corollary VII.5, pp. 196–197.

## Supplier contracts

The following requests specify the statements used above. Existing fine-grained supplier nodes are imported directly; these contracts identify extensions and hypotheses that the available supplier plans do not yet discharge. Each consumer is listed explicitly. A request is a mathematical dependency, not an implementation claim.

### R1: DeligneWeightsAndPurity:DWP.0

Weight/Tate conventions over Fq, geometric Frobenius and a fixed square root for half Tate twists; preserve q_v=q^deg(v) in local trace functions. Existing nodes DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, DWP.0/weil-number-base-extension and DWP.0/finite-field-base-extension-of-weights, with EtaleDualityAndPerverseSheaves:EDC.0/tate-twist, supply the twists and Frobenius conventions; the Satake parity sign is a GS.1 target, not part of this request.

Consumers: [GS.1/classical-satake-category](#gs-1-classical-satake-category), [GS.1/modified-commutativity-and-tate-twist](#gs-1-modified-commutativity-and-tate-twist).

### R2: DeligneWeightsAndPurity:DWP.7

Weight bounds, purity of finite-type IC and proper pushforward, rationality and pole arguments used on the particular essential and horocycle pieces. The GLr Ramanujan conclusion is proved in GS.6, not imported back from DWP.10. Purity of intersection complexes on finite-type schemes is EtaleDualityAndPerverseSheaves:EDC.7/intersection-complex-purity (request R8); the stack versions remain part of R4.

Consumers: [GS.3/horocycle-compact-image](#gs-3-horocycle-compact-image), [GS.3/pgl2-eisenstein-spectral-finiteness](#gs-3-pgl2-eisenstein-spectral-finiteness), [GS.6/negligible-cohomology-and-induction-on-the-rank](#gs-6-negligible-cohomology-and-induction-on-the-rank), [GS.6/local-factors-purity-and-multiplicity](#gs-6-local-factors-purity-and-multiplicity), [GS.6/excursion-comparison-for-gln](#gs-6-excursion-comparison-for-gln).

### R3: DrinfeldModulesAndTModules:DM.7

Import elliptic sheaves with periodicity, Frobenius, degree and level conventions; compare only the one-negative-leg fractional-infinity specialization. No dependency from the main multi-leg construction on elliptic sheaves.

Consumers: [GS.2/elliptic-sheaf-realisation](#gs-2-elliptic-sheaf-realisation).

### R4: EtaleDualityAndPerverseSheaves:EDC.0

Finite-type constructible E/O_E/torsion coefficient categories, stack descent, filtered systems and the enhanced six-operation API imported there from EnhancedDerivedSheaves: compact support, smooth/proper base change, Künneth, and universal-homeomorphism invariance. This is a contract request, not a claim that the pinned coefficient sheaf supplies it. EtaleDualityAndPerverseSheaves is scheme-only: the scheme-level statements are EDC.0/constructible-ctf-complexes and EDC.0/enhanced-compact-pushforward, smooth base change and Künneth are in the upstream EtaleCohomologyFoundations §§F.2.2 and F.2.6 (TauCetiRoadmap pull request #938), and the stack versions belong to the Part II on Artin and Deligne–Mumford stacks proposed in the EDC assembly handoff.

Consumers: [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.3/horocycle-compact-image](#gs-3-horocycle-compact-image), [GS.4/drinfeld-lemma-for-lisse-sheaves](#gs-4-drinfeld-lemma-for-lisse-sheaves), [GS.6/rank-negligible-representations](#gs-6-rank-negligible-representations).

### R5: EtaleDualityAndPerverseSheaves:EDC.2

Poincaré/Verdier compact-support pairings on the smooth finite-type stacks used here, with inverse-correspondence adjoints and compatibility under increasing open truncations. The scheme-level pairings are EDC.2:pairings/poincare-duality-torsion and its adic versions; the stack versions are the request, as for R4.

Consumers: [GS.3/pgl2-ind-perverse-cohomology](#gs-3-pgl2-ind-perverse-cohomology).

### R6: EtaleDualityAndPerverseSheaves:EDC.3

Cycle classes from proper cycles to compactly supported ℓ-adic cohomology, with the YZ dimension shifts, proper pushforward and correspondence compatibility.

Consumers: [GS.3/pgl2-ind-perverse-cohomology](#gs-3-pgl2-ind-perverse-cohomology).

### R7: EtaleDualityAndPerverseSheaves:EDC.5

Early field-coefficient perverse heart, relative shifts, IC, small/semismall pushforward and ULA fusion; Ind(Perv) and localization modulo constructible objects. Part II: the standard integral perverse convention, including torsion pairs and failure of Verdier self-duality, required by integral Satake. EDC.4 weak Lefschetz is not this supplier.

Consumers: [GS.1/forgetting-intermediate-modifications-is-small](#gs-1-forgetting-intermediate-modifications-is-small), [GS.1/classical-satake-category](#gs-1-classical-satake-category), [GS.2/cohomology-sheaves-of-shtuka-stacks](#gs-2-cohomology-sheaves-of-shtuka-stacks), [GS.3/pgl2-ind-perverse-cohomology](#gs-3-pgl2-ind-perverse-cohomology), [GS.3/pgl2-cohomological-constant-term](#gs-3-pgl2-cohomological-constant-term), [GS.1/integral-geometric-satake](#gs-1-integral-geometric-satake).

### R8: EtaleDualityAndPerverseSheaves:EDC.7

Pure IC, weight bounds and decomposition/pushforward results at exactly the finite-type and properness hypotheses used in the lower-rank boundary analysis. These are applied to specified strata and do not turn arbitrary unbounded cohomology into a pure finite-dimensional space.

Consumers: [GS.6/negligible-cohomology-and-induction-on-the-rank](#gs-6-negligible-cohomology-and-induction-on-the-rank).

### R9: EtaleDualityAndPerverseSheaves:EDC.8

Composition and pullback of cohomological correspondences, support-controlled action and the Frobenius fixed-point trace formula on the finite-type Deligne–Mumford and Artin stacks used here. The scheme-level statements are EDC.8/cohomological-correspondence-composition, EDC.8/correspondence-pullback-and-restriction, EDC.8/lefschetz-verdier-trace-formula, EDC.8/fujiwara-varshavsky-trace-formula and EDC.8/contracting-correspondence; their stack versions and the unstable-open fixed-point formulas of L. Lafforgue Theorems IV.7 and IV.12 are the request. No trace formula is inferred from duality alone.

Consumers: [GS.2/hecke-correspondences-on-shtuka-stacks](#gs-2-hecke-correspondences-on-shtuka-stacks), [GS.3/pgl2-ind-perverse-cohomology](#gs-3-pgl2-ind-perverse-cohomology), [GS.6/normalized-hecke-correspondences](#gs-6-normalized-hecke-correspondences), [GS.6/trace-formula-and-the-matching-of-terms](#gs-6-trace-formula-and-the-matching-of-terms), [GS.7/local-excursion-convolution](#gs-7-local-excursion-convolution), [GS.3/cuspidal-shtuka-cohomology](#gs-3-cuspidal-shtuka-cohomology).

### R10: ExcursionOperatorsAndSpectralAction:ES0

Import the local spectral/excursion interface; require the precise equal-characteristic completed-centre carrier and its character-evaluation map. Abstract Γ reconstruction is owned by LP2, and global geometric excursion operators by GS.5.

Consumers: [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters).

### R11: ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic

The exact equal-characteristic local GLr comparison endpoint. Part II: identify the finite restricted-shtuka nearby-cycle local action with the HS.2/HS.3 local-shtuka realization; no blanket global uniformization equivalence is supplied.

Consumers: [GS.7/gl-r-local-comparison-and-uniformization](#gs-7-gl-r-local-comparison-and-uniformization).

### R12: FunctionFieldArithmetic:FA.3

Hasse/Brauer and local-global torsor inputs for ker¹(F,G), pure inner forms and the local invariants of the twisted zero-leg algebra. The existing ramification/Artin stage needs a Part II contract for the nonabelian and central-simple-algebra assertions.

Consumers: [GS.0/weil-uniformization](#gs-0-weil-uniformization).

### R13: FunctionFieldArithmetic:FA.6

Nonsplit compact cusp support modulo Ξ: for connected reductive G with a parahoric model, the cuspidal functions of fixed level are supported on finitely many points of Bun_{G,N}(F_q)/Ξ (Harder; Borel–Jacquet Proposition 5.2, recalled in VL §12.1, p. 151), extending FA.6/harder-cuspidal-support beyond split semisimple groups. The GL_r analytic, multiplicity-one, converse and trace-formula inputs formerly requested here are planned upstream in AutomorphicLFunctionsAndLocalFactors §AL.3 and recorded as gap G10.

Consumers: [GS.5/the-excursion-algebra](#gs-5-the-excursion-algebra), [GS.0/cuspidal-automorphic-forms](#gs-0-cuspidal-automorphic-forms).

### R14: LanglandsParameterStacks:LP2:excursion-presentation

Generalize the abstract invariant-function excursion presentation from the local Weil case to an arbitrary profinite/global Γ, with finite L-group projection, coefficient-natural matrix coefficients, unit and forgotten-leg compatibilities. Part II includes integral/torsion realizations; GS verifies these identities on actual global cohomology.

Consumers: [GS.5/excursion-relations](#gs-5-excursion-relations), [GS.5/integral-and-modular-excursions](#gs-5-integral-and-modular-excursions).

### R15: LanglandsParameterStacks:LP2:semisimple-characters

Generalize character reconstruction to arbitrary Γ and possibly disconnected finite L-groups, including uniqueness for all tuples, descent to one finite coefficient extension and continuity for the separately continuous E-adic functions. In characteristic ℓ use G-complete reducibility, not the characteristic-zero reductive-closure shortcut. Keep the prescribed component projection.

Consumers: [GS.5/reconstruction-of-a-langlands-parameter](#gs-5-reconstruction-of-a-langlands-parameter), [GS.5/integral-and-modular-excursions](#gs-5-integral-and-modular-excursions), [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters).

### R16: LefschetzPencilsAndVanishingCycles:LPV.0

Part II: nearby cycles on oriented product topoi over a higher-dimensional coherent base, Orgogozo v1 Theorem 1.1 and §6.1 with a modification depending on the chosen complex, arbitrary subsequent base change, proper and smooth transport. Add the Gabber ULA specialization theorem recalled in GL Proposition 3.2/EX24 A.9. Existing trait nearby cycles do not meet this contract.

Consumers: [GS.7/nearby-cycles-over-general-bases](#gs-7-nearby-cycles-over-general-bases), [GS.7/local-nearby-cycle-transport](#gs-7-local-nearby-cycle-transport).

### R17: SchemeAndStackFoundations:SF.1

Algebraic stacks, representable diagonals, Artin/DM atlases, quotient stacks, fppf torsor descent, bounded Quot atlases and Beauville–Laszlo formal gluing for torsors over X×S; the module-level gluing is RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing. Import AlgebraicVectorBundles Layers L0A–L2B rather than reconstructing finite locally free sheaves; relative Grassmannians are AlgebraicModuliForArithmeticGeometry §1.3 (TauCetiRoadmap pull request #853), not AlgebraicVectorBundles. Integrate the current-only registry reference.

Consumers: [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), [GS.0/deformation-complex-and-smoothness](#gs-0-deformation-complex-and-smoothness), [GS.0/iwahori-bundles-and-fractional-twists](#gs-0-iwahori-bundles-and-fractional-twists), [GS.0/slope-euler-and-hn-data](#gs-0-slope-euler-and-hn-data), [GS.1/beilinson-drinfeld-grassmannian](#gs-1-beilinson-drinfeld-grassmannian), [GS.1/determinant-line-and-opposition-sign](#gs-1-determinant-line-and-opposition-sign), [GS.7/restricted-shtukas-and-the-local-excursion-element](#gs-7-restricted-shtukas-and-the-local-excursion-element).

### R18: SchemeAndStackFoundations:SF.4

Deformation theory of torsors/stacks with tangent complex RΓ(X,ad E)[1], obstruction vanishing on a curve; compactification, normalization and finite-type model operations used by the GLr boundary construction. No generic smooth proper compactification at arbitrary full level is assumed.

Consumers: [GS.0/deformation-complex-and-smoothness](#gs-0-deformation-complex-and-smoothness), [GS.6/compactification-and-boundary-analysis](#gs-6-compactification-and-boundary-analysis).

### R19: SmoothRepresentationsOfLocalGroups:SR.1

Smooth admissible irreducibles, integral lattices, Bernstein central characters, supercuspidal support and twisting to integral supercuspidals over a local function field.

Consumers: [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters).

### R20: SmoothRepresentationsOfLocalGroups:SR.2

Normalized parabolic induction, its irreducible subquotients and the Levi constant-term map used for local excursion centres, at finite congruence level and compatible with coefficient reduction.

Consumers: [GS.7/bernstein-center-and-local-parameters](#gs-7-bernstein-center-and-local-parameters).

### R21: tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary

Import the existing reductive-group functor-of-points/Hopf-algebra dictionary; use its representation, root-datum, Lie/adjoint and pinned-dual conventions from the appropriate subsequent layers. The current Suggested file has only Layer 0 signatures: these are roadmap imports, not baseline theorem claims.

Consumers: [GS.0/bun-g-of-the-global-curve](#gs-0-bun-g-of-the-global-curve), [GS.1/beilinson-drinfeld-grassmannian](#gs-1-beilinson-drinfeld-grassmannian), [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor).

### R22: DeligneWeightsAndPurity:DWP.3/function-field-chebotarev

Apply the existing explicit constant-field finite-cover theorem at all finite quotients to deduce density in the profinite global Galois group, with the geometric-Frobenius inverse. Equality of traces then determines semisimplifications; it does not classify general-group simultaneous tuples.

Consumers: [GS.5/satake-compatibility-and-chebotarev](#gs-5-satake-compatibility-and-chebotarev).

### R23: HeckeStacksAndLocalShtukas:HS3/compact-support-at-levels

Import the local-shtuka compact-support endpoint at its stated coefficient/group hypotheses. Part II: a source-ready comparison between this local realization and the GL finite restricted-shtuka nearby-cycle action, respecting coefficients, levels and Weil actions.

Consumers: [GS.7/gl-r-local-comparison-and-uniformization](#gs-7-gl-r-local-comparison-and-uniformization).

### R24: SmoothRepresentationsOfLocalGroups:SR.4

The classical Satake isomorphism for unramified groups over a local function field: over Z[q^{-1}] onto twisted Weyl invariants, and, with a fixed square root of q, onto E⊗K₀(Rep Ĝ), with the integral orbit-sum basis. The node is SR.4/satake-isomorphism (packet under revision) and upstream SmoothRepresentationsOfLocalGroups §SR.4.1 (TauCetiRoadmap pull request #785). GS.1 identifies its basis with signed Frobenius traces of Satake sheaves and does not re-prove it.

Consumers: [GS.1/unramified-hecke-algebra-and-satake-isomorphism](#gs-1-unramified-hecke-algebra-and-satake-isomorphism).

## Source obligations and conditional boundaries

A planning pass can specify a target with an exact unresolved proof obligation. The following obligations prevent source-proof closure; they must not be silently replaced by a stronger theorem from a different geometric or coefficient setting.

### G1: shifted HN existence and uniqueness

Yu §3.3.2 invokes Chaudouard Theorem 4.1.2 for the dominant-shift canonical filtration. The exact theorem/proof was not obtained in this pass. Find a cleared or freely accessible primary proof, check the shifted quotient indexing, and fill the construction outline; ordinary HN alone does not prove the shifted theorem.

Consumers: [GS.0/shifted-hn-filtration](#gs-0-shifted-hn-filtration).

### G2: finite-field ℓ-adic classical Satake proof bridge

MV supplies complex-topological weight functors, tensor reconstruction and root datum; VL supplies the finite-field ℓ-adic multi-leg theorem and cites the classical comparison inputs. The exact spreading-out/étale-comparison proof and the full root-datum proof in MV §12 require a focused primary-source pass. The equivalence, pinning, fusion and sign are separate targets here; no Fargues–Fontaine theorem is substituted.

Consumers: [GS.1/geometric-satake-functor](#gs-1-geometric-satake-functor), [GS.1/nonsplit-satake-descent-via-the-l-group](#gs-1-nonsplit-satake-descent-via-the-l-group), [GS.1/integral-geometric-satake](#gs-1-integral-geometric-satake).

### G3: complete general Hecke–Frobenius correspondence calculation

VL Proposition 6.2, §§6.2–6.3 setup and the §6.5 closing calculation were read. Check every correspondence identity in the intervening Lemmas 6.11–6.15, including IC/convolution and normalization, before claiming source-proof closure. The minuscule case and the statement alone do not discharge this calculation.

Consumers: [GS.3/hecke-operator-as-creation-frobenius-annihilation](#gs-3-hecke-operator-as-creation-frobenius-annihilation).

### G4: twisted zero-leg inner-form classification proof

YZ §3.2.2 states the adelic groupoid of the central simple algebra determined by the infinity invariants without giving its proof. Supply the Frobenius-twisted bundle classification and compare minimal parahoric stabilizers; abelian reciprocity alone is insufficient.

Consumers: [GS.2/zero-leg-twisted-inner-forms](#gs-2-zero-leg-twisted-inner-forms).

### G5: conditional eigensheaf trace comparison

VL Proposition 15.1 explicitly assumes partial-Frobenius compatibility of the Braverman–Varshavsky trace maps that had not been written down. Keep this as an explicit hypothesis unless a primary proof is located. It is outside the dependencies of the proved global decomposition.

Consumers: [GS.5/conditional-geometric-langlands-comparison](#gs-5-conditional-geometric-langlands-comparison).

### G6: local-model change at nonsplit bad places

GL §9 explains the nonsplit extension using parahoric global/restricted shtukas and ind-proper affine Grassmannians, citing AH19 and Richarz Theorem A. These primary proofs were not read here. Supply their exact connected-fibre/parahoric hypotheses and comparison with the finite-jet diagrams before source-proof closure.

Consumers: [GS.7/restricted-shtukas-and-the-local-excursion-element](#gs-7-restricted-shtukas-and-the-local-excursion-element), [GS.7/local-global-compatibility-up-to-semisimplification](#gs-7-local-global-compatibility-up-to-semisimplification).

### G7: uniform integral local support refinement

The finite-torsion local element and the decay-at-infinity integral limit suffice for the recorded theorem. GL Remark 6.3 sketches a stronger coefficient-exponent-independent modification using Ito24 Corollary 2.9 and additional Demazure/normalization arguments without full details. Locate and verify that proof if finite support of the integral limit is required; it is not asserted by this packet.

Consumers: [GS.7/local-excursions-on-compact-cohomology](#gs-7-local-excursions-on-compact-cohomology).

### G8: nonsplit full-cohomology torsion extension

Xue integral §8 is split; Xue smoothness §6 gives nonsplit E-coefficient ind-smoothness. GL §9 invokes the nonsplit extension also at finite coefficients. Verify the integral/torsion construction and the coefficient-natural specialization/constant-term arguments at the stated parahoric hypotheses; rational ind-smoothness alone is not a proof.

Consumers: [GS.5/excursions-on-full-compact-cohomology](#gs-5-excursions-on-full-compact-cohomology), [GS.7/local-excursion-convolution](#gs-7-local-excursion-convolution), [GS.7/local-excursions-on-compact-cohomology](#gs-7-local-excursions-on-compact-cohomology).

### G9: Xue geometric contraction and pseudo-product inputs

Xue integral §3.1 cites the deep-horospherical contraction and constant-term geometry of his earlier cuspidal-cohomology paper; its primary proof was not read here. Xue smoothness §4 uses pseudo-product sheaves and the specialization theorem for products of strict henselian traits from §§2–3, whose full proof was not read. Read those geometric proofs, check the integral hypotheses and add their target-level construction outlines if required; the stated finiteness and ind-smoothness theorems remain planned with this source obligation.

Consumers: [GS.3/cuspidal-shtuka-cohomology](#gs-3-cuspidal-shtuka-cohomology), [GS.3/integral-cuspidal-finiteness](#gs-3-integral-cuspidal-finiteness), [GS.4/ind-smoothness-of-full-cohomology](#gs-4-ind-smoothness-of-full-cohomology).

### G10: function-field analytic and trace-formula inputs owned by AutomorphicLFunctionsAndLocalFactors

GL_r×GL_s Rankin–Selberg continuation, functional equations and poles over function fields, Laumon's product formula and highly ramified stability, strong multiplicity one, the converse theorem of L. Lafforgue Appendix B (B.13) and the averaged truncated trace formula of L. Lafforgue Theorem I.13 are planned upstream in AutomorphicLFunctionsAndLocalFactors, layer AL.3 (TauCetiRoadmap pull request #924; subsections 'Function-field local factors, multiplicity one and converse theorem', 'Strong multiplicity one' and the counting comparison in 'Essential cohomology and local factors'). They are not FunctionFieldArithmetic Part II material. The AL atlas packet still cites GS.6, so GS.6 cannot cite AL.3 without a stage cycle; the restructure entry on the GL_r correspondence records the retargeting.

Consumers: [GS.6/deligne-rank-induction](#gs-6-deligne-rank-induction), [GS.6/trace-formula-and-the-matching-of-terms](#gs-6-trace-formula-and-the-matching-of-terms), [GS.6/local-factors-purity-and-multiplicity](#gs-6-local-factors-purity-and-multiplicity).

## Corrected source formulas

The following descriptions and corrections are in our own words. They identify the exact formula or argument affected; they reproduce no source passage. Existing errata are credited rather than presented as new discoveries.

### E1 — misprint

[Zhiwei Yun and Wei Zhang](https://arxiv.org/pdf/1712.08026v2), arXiv:1712.08026v2 (the same text is on p. 38 of v1; published p. 448), §3.5.4, p. 38, three displayed shifts; compare Corollary 3.29, p. 35.

The normalized horocycle recall uses \[−#I(κ)](−#I(κ)/2). This is an authored characterization of the formula, not a source passage.

Correction: Use \[+#I(κ)](+#I(κ)/2) after the \[2r](r) normalization.

Reason: Corollary 3.29 has \[−2r+#I](−r+#I/2); adding the normalization gives positive signs. A lisse complex on the #I-dimensional support is perverse with the positive shift.

Correction status: Already recorded and independently confirmed as PAPER-YUN-ZHANG-19/E12; correction rechecked in arXiv v2 and v1.

### E2 — misprint

[Zhiwei Yun and Wei Zhang](https://arxiv.org/pdf/1712.08026v2), arXiv:1712.08026v2 (the same text is on p. 38 of v1; published p. 448), §3.5.4, p. 38, fixed-degree rank-one torsor paragraph.

The second description assigns the full Pic_X(k) torsor group to a fixed-degree component.

Correction: Use Pic_X⁰(k) on one fixed-degree component, and Pic_X(k) only on the union of all degree translates.

Reason: A line bundle of nonzero degree moves N(κ); it cannot preserve that fixed-degree component.

Correction status: PAPER-YUN-ZHANG-19/E13, independently confirmed; rechecked in arXiv v2 and v1.

### E3 — misprint

[Zhiwei Yun and Wei Zhang](https://arxiv.org/pdf/1712.08026v2), arXiv:1712.08026v2 (the same text is on p. 38 of v1; published p. 448), §3.5.4, p. 38, direct sum over κ′∈κ+Z.

The translated direct sum repeats the fixed N(κ) projection in every summand.

Correction: Use the projection for N(κ′) in the summand indexed by κ′.

Reason: Different summands are different degree components; repeating one projection loses the Pic_X(k) translation action.

Correction status: PAPER-YUN-ZHANG-19/E14, independently confirmed; rechecked in arXiv v2 and v1.

### E4 — misprint

[Tony Feng](https://arxiv.org/pdf/2009.14236v6), arXiv:2009.14236v6, §5.2.3, p. 36, Frobenius–Weil automorphism definition.

The automorphism subscript retains F̄\_q although this paper calls its curve base field F_ℓ.

Correction: Use the algebraic closure of the actual curve base field, F̄\_ℓ in Feng’s notation; our independent notation k=Fq uses F̄\_q consistently.

Reason: The immediately preceding coordinate partial Frobenius is Frob_ℓ and the curve in §5.1 is over F_ℓ. Keep the perfected geometric function field when describing the geometric kernel.

Correction status: PAPER-FENG-24/E36, independently confirmed; preprint formula rechecked here.

### E5 — error

[Laurent Lafforgue](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), Author copy, I.13, pp. 31–32, note correcting the trace formula in the 1997 book.

The correction note explains that the older book’s lower-rank exponential terms had omitted possible polynomial factors in the iteration exponent.

Correction: Permit polynomial times exponential error terms at the numerical-trace stage, then prove their positive-degree polynomial coefficients cancel when comparing with cohomological traces.

Reason: The finite exponential trace sequence forces the positive polynomial powers to vanish only after comparison; deleting them in the input would skip that argument.

Correction status: Corrected explicitly by Laurent Lafforgue in I.13 of the author copy used here; GS.6 uses that corrected form.

### E6 — error

[Cong Xue](https://arxiv.org/pdf/2001.05805v2), arXiv:2001.05805v2, proof of Lemma 8.2.4, p. 55.

The proof treats A/m^n for every maximal ideal m of a finitely generated O_E-algebra as a finite torsion O_E-module.

Correction: Separate maximal ideals containing λ from the characteristic-zero maximal ideals. In the first case use finite torsion Drinfeld descent; in the second λ is invertible on A/m^n and the quotient is finite-dimensional over E, so use rational Drinfeld descent. Then the same Krull-intersection argument applies.

Reason: A=O_E[t], m=(λt−1) is an explicit counterexample to the printed finiteness assertion: A/m=E. It is infinite as an O_E-module and has no O_E-torsion. This finding concerns the proof step, not a counterexample to the Weil-descent theorem.

Correction status: No correction located in the limited exact-lemma and paper-erratum searches on 2026-10-19; the v2 proof was read directly. The two-case repair must be checked by the independent reviewer.

## Source versions

All source URLs below are public; access date is 2026-10-19. Locators refer to the stated version and its printed pages. An uncollated journal pagination is not silently substituted. The hashes identify the copies consulted, which are not part of the repository.

- **vl**: [Vincent Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*](https://arxiv.org/pdf/1209.5352v10). arXiv:1209.5352v10, 10 January 2018; 184 printed pages. SHA-256 `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.
- **ll**: [Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands*](https://www.ihes.fr/~lafforgue/math/fulltext.pdf). IHÉS author-hosted preprint M/00/70, 241 printed pages; published Inventiones 147 (2002), 1–241; locators refer to this author copy. SHA-256 `af732dac0d2dd00056ff46075f069f09cb2239bcac5cec68b13d17faa8d2ea76`.
- **gl**: [Alain Genestier and Vincent Lafforgue, *Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale*](https://arxiv.org/pdf/1709.00978v3). arXiv:1709.00978v3, 30 July 2026; 47 printed pages. SHA-256 `64aae45c06801eb4fb83a9b5f61889dda668f73478ec95e6f5c913a556ca8830`.
- **mv**: [Ivan Mirković and Kari Vilonen, *Geometric Langlands duality and representations of algebraic groups over commutative rings*](https://arxiv.org/pdf/math/0401222). arXiv:math/0401222; 44-page preprint. SHA-256 `b3fa89de4f2aeefadaba248aba2e942a20fc0895b8a218dfcab93322b4140e21`.
- **yu**: [Hongjie Yu, *Number of cuspidal automorphic representations and Hitchin’s moduli spaces*](https://arxiv.org/pdf/1807.04659v5). arXiv:1807.04659v5, 18 July 2022; 85 pages. SHA-256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.
- **yz**: [Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions (II)*](https://arxiv.org/pdf/1712.08026v2). arXiv:1712.08026v2, 13 June 2020; 90 pages; locators use this version (v1 of 21 December 2017 numbers the results of §3.4 one higher). SHA-256 `e159d869e86a3526e95aaf9560780870ed5c7af35593eb5ebb4fe477f0adf258`.
- **zhu**: [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/pdf/1407.8519v3). arXiv:1407.8519v3, 20 July 2016; 63 pages. SHA-256 `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b`.
- **sch**: [Olivier Schiffmann, *Indecomposable vector bundles and stable Higgs bundles over smooth projective curves*](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf). Annals of Mathematics 183 (2016), 297–362; published open PDF. SHA-256 `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5`.
- **feng**: [Tony Feng, *Smith theory and cyclic base change functoriality*](https://arxiv.org/pdf/2009.14236v6). arXiv:2009.14236v6, 29 November 2023; 68 pages; preprint pagination. SHA-256 `5ae075585bdfa3252166b12cba6d92f8e14571e110aeef02748bc8599a16f96e`.
- **kz**: [Mark Kisin and Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/pdf/2103.09945v2). arXiv:2103.09945v2, 7 October 2024; cited §5.3 only. SHA-256 `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.
- **chin**: [Cheewhye Chin, *Independence of ℓ of monodromy groups*](https://arxiv.org/pdf/math/0206147v3). arXiv:math/0206147v3, 15 May 2003. SHA-256 `96c81b5b0c24b0b4c4775299637f920f1cd9fe275d35616556bce3670180082f`.
- **var**: [Yakov Varshavsky, *Moduli spaces of principal F-bundles*](https://arxiv.org/pdf/math/0205130v2). arXiv:math/0205130v2, 31 August 2004. SHA-256 `62d8a5be48ff094b752ae0231f29e86d9efd28e2aa3a8cc5aeb31017236550b4`.
- **ly**: [George Lusztig and Zhiwei Yun, *A (−q)-analogue of weight multiplicities*](https://arxiv.org/pdf/1203.0521v1). arXiv:1203.0521v1, 2 March 2012. SHA-256 `f3dfd16b135ec484ce644a10a25d0fc18d963bcbc80f297ffdef1b12d0782fe3`.
- **xuei**: [Cong Xue, *Cohomology with integral coefficients of stacks of shtukas*](https://arxiv.org/pdf/2001.05805v2). arXiv:2001.05805v2, 30 August 2023; 59 pages. SHA-256 `41feeda7f901b23244c3c001a916b5990d477955f0687458e4e5504f4b91ece8`.
- **xues**: [Cong Xue, *Smoothness of cohomology sheaves of stacks of shtukas*](https://arxiv.org/pdf/2012.12833v1). arXiv:2012.12833v1, 23 December 2020; 38 pages. SHA-256 `1dc7b62d377e2198fb31ce761a16778d821b40bd79ab918ac4f23b4a47037333`.
- **org**: [Fabrice Orgogozo, *Modifications et cycles évanescents sur une base de dimension supérieure à un*](https://arxiv.org/pdf/math/0507475v1). arXiv:math/0507475v1, July 2005; numbering differs from published version. SHA-256 `10f18b77e877d376ba81a798a41465759923e10fb32b903a433961086f90903d`.

## Planning acceptance and next source work

The complete planning pass contains 104 targets (8 applications, 2 comparisons, 16 constructions, 17 definitions, 2 lemmas, 59 theorems), 123 API items, 99 unit tests, 38 planets and 8 pinned baseline declarations. Every implementation status is unchecked.

| Stage | Targets | Coverage | Direct remaining obligations |
| --- | --- | --- | --- |
| GS.0 | 15 | planned | G1: shifted HN existence and uniqueness; Supplier contracts to realize: FunctionFieldArithmetic:FA.3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4, tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary |
| GS.1 | 13 | planned | G2: finite-field ℓ-adic classical Satake proof bridge; Supplier contracts to realize: DeligneWeightsAndPurity:DWP.0, EtaleDualityAndPerverseSheaves:EDC.5, SchemeAndStackFoundations:SF.1, tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary, SmoothRepresentationsOfLocalGroups:SR.4 |
| GS.2 | 11 | planned | G4: twisted zero-leg inner-form classification proof; Supplier contracts to realize: DrinfeldModulesAndTModules:DM.7, EtaleDualityAndPerverseSheaves:EDC.0, EtaleDualityAndPerverseSheaves:EDC.5, EtaleDualityAndPerverseSheaves:EDC.8 |
| GS.3 | 13 | planned | G9: Xue geometric contraction and pseudo-product inputs; G3: complete general Hecke–Frobenius correspondence calculation; Supplier contracts to realize: DeligneWeightsAndPurity:DWP.7, EtaleDualityAndPerverseSheaves:EDC.0, EtaleDualityAndPerverseSheaves:EDC.2, EtaleDualityAndPerverseSheaves:EDC.3, EtaleDualityAndPerverseSheaves:EDC.5, EtaleDualityAndPerverseSheaves:EDC.8 |
| GS.4 | 13 | planned | G9: Xue geometric contraction and pseudo-product inputs |
| GS.5 | 13 | planned | G8: nonsplit full-cohomology torsion extension; G5: conditional eigensheaf trace comparison; Supplier contracts to realize: FunctionFieldArithmetic:FA.6, LanglandsParameterStacks:LP2:excursion-presentation, LanglandsParameterStacks:LP2:semisimple-characters, DeligneWeightsAndPurity:DWP.3/function-field-chebotarev |
| GS.6 | 15 | planned | G10: function-field analytic and trace-formula inputs owned by AutomorphicLFunctionsAndLocalFactors; Supplier contracts to realize: DeligneWeightsAndPurity:DWP.7, EtaleDualityAndPerverseSheaves:EDC.0, EtaleDualityAndPerverseSheaves:EDC.7, EtaleDualityAndPerverseSheaves:EDC.8, SchemeAndStackFoundations:SF.4; Ownership: most GS.6 targets are planned upstream in AutomorphicLFunctionsAndLocalFactors layer AL.3; apply the restructure entry on the GL_r correspondence; Drinfeld's companions on smooth varieties of higher dimension, requested by HodgeStructuresPartII H.5, are outside GS.6 and need a Part II |
| GS.7 | 11 | planned | G8: nonsplit full-cohomology torsion extension; G6: local-model change at nonsplit bad places; G7: uniform integral local support refinement; Supplier contracts to realize: EtaleDualityAndPerverseSheaves:EDC.8, ExcursionOperatorsAndSpectralAction:ES0, ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic, LanglandsParameterStacks:LP2:semisimple-characters, LefschetzPencilsAndVanishingCycles:LPV.0, SchemeAndStackFoundations:SF.1, SmoothRepresentationsOfLocalGroups:SR.1, SmoothRepresentationsOfLocalGroups:SR.2, HeckeStacksAndLocalShtukas:HS3/compact-support-at-levels |

Acceptance requires agreement between this document and the packet on targets, hypotheses, prerequisites, API and tests; no cycles or unresolved identifiers; at least three discriminating tests per definition/construction; and no more than six named planets per stage. Source closure additionally requires the ten obligations and the supplier contracts. The conditional eigensheaf statement remains conditional unless its additional theorem is supplied. The conjectural multiplicity expression, reducedness of the excursion algebra and the motivic/Arthur expectations are not assumptions used to prove the global theorem.

The next source pass should first complete the finite-field and integral Satake comparison and the general Hecke–Frobenius calculation, then discharge the shifted-HN and Xue geometric proof inputs and the nonsplit torsion/local-model comparisons. The independent review confirmed the two-case repair of the residue argument in E6. Preserve the two independent GLr proof routes and the specified ownership boundaries when those obligations are filled.
