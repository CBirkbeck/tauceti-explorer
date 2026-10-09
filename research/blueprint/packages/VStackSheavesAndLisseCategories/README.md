# Artin v-stacks, solid and lisse coefficient categories

This roadmap builds coefficient categories on Artin v-stacks and connects them to smooth representations on the Newton strata of `Bun_G`. Its geometric part supplies smooth atlas descent, universal local acyclicity, the Jacobian criterion for section spaces, hyperbolic localization and divisor descent. Its coefficient part supplies solidification, solid sheaves, relative homology and the lisse subcategory. These meet in compact generation, Bernstein–Zelevinsky duality and the characterization of ULA objects by perfect invariants.

There are two reasons to develop these together. Étale torsion coefficients give the geometric finiteness and duality criteria, but integral and rational coefficients require a category that handles inverse limits and solid tensor products. The lisse category then selects the relatively discrete representation theory inside the larger solid category. Keeping the constructions compatible lets the same chart geometry control torsion, integral and rational coefficients without changing the meaning of smooth representations.

## Scope and neighbouring roadmaps

Use the existing carriers and operations below. This roadmap adds properties, subcategories and comparison theorems on them.

| Input | What is imported | What this roadmap adds |
| --- | --- | --- |
| `DiamondsAndVStacks:D1,D4–D6` | Perfectoid charts, small v-stacks, relative representability, finite-stage comparisons and the étale-site comparison | The Artin property and smooth atlas presentations of coefficient categories |
| `DiamondEtaleCohomology:C6` | Invariance under algebraically closed field extensions, with the separate discrete, complete and valuation-subring hypotheses | The corresponding solid full-faithfulness statements |
| `DiamondSixOperations:S0–S5` | Eligible representable maps, torsion supported pushforward, exceptional pullback, projection and base-change formulas, and cohomological smoothness | Smooth stacky descent, the two annular partial-support functors, ULA and the kernel adjunction criterion |
| `EnhancedDerivedSheaves:E0–E5` | A common stable enhancement, derived tensor/Hom, coherent limits, hyperdescent, adjoints, completion, presentability and compact objects | The geometric categories and their solid/lisse subcategories on that enhancement |
| `RelativeFarguesFontaine:RF2–RF3` | Untilts, integral divisor spaces, `Div¹`, the relative curve and its line bundles | The map `Div¹→[*/W_E]`, descent of coefficients and relative section spaces |
| `VectorBundlesAndIsocrystals:VB1–VB4` | Bundle cohomology and slope theory, classification, positive and negative Banach–Colmez presentations | Formal smoothness and the Jacobian criterion; coefficient invariance for the connected kernels |
| `BunGAndNewtonStrata:BG2–BG4` | The Artin/smooth geometry of `Bun_G`, full automorphism v-groups, Newton strata and contracting bundle charts | Stratum coefficient equivalences, localization, compact generation and duality |
| `SmoothRepresentationsOfLocalGroups:SR.0,SR.2` | The smooth representation category, its enhancement, continuous invariants and compact induction | Descent equivalences with classifying-stack sheaves, and their use on `Bun_G` |
| `AdicCoefficientsAndComparisons:L0` | Derived-complete coefficients, reduction tests, completed tensor and inverse-limit categories | Completed ULA and lisse comparisons, including their rational coefficient extension |
| `SolidAnalyticRings:SA.2–SA.4`, `AnalyticStacks:AS.2–AS.3` | Analytic rings, measures, complete module categories, `AnSpec`, the !-topology and gluing | Topological solid `E` coefficients and the distinct underlying-integer-solid analytification |
| `AdicSpacesPartII:R5`, `ClassicalAdicEtaleCohomology:H1,H4,H5` | Sousperfectoid smoothness/differentials, formal–adic comparison, annulus cohomology and scheme/analytic comparison | Section-space smoothness, partial-support calculations and ULA analytification |
| `EtaleDualityAndPerverseSheaves:EDC.1` | Scheme exceptional duality, constructible biduality and exchange | The constructible-to-solid embedding and comparison with geometric ULA |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | The local Weil group, Weil topology, inertia and degree | Its divisor torsor and finite-product coefficient descent |

The Hecke and Satake constructions are consumers: their geometry and kernel actions belong to `GeometricSatakeAndHeckeOperators:HS1` and the layers preceding it. Here the output is the coefficient, adjunction, duality and scalar-extension interface that those actions use. The scheme Verdier formalism belongs to `EtaleDualityAndPerverseSheaves`; the enhanced categorical tensor product belongs to `EnhancedDerivedSheaves`; locally convex realizations of solid topological vector spaces belong to their functional-analysis roadmap. The equal-characteristic finite-rank Drinfeld theorem in `GlobalShtukasAndFunctionFieldLanglands:GS.4` uses its existing carrier; the divisor-to-Weil comparison here has the local-field and diamond hypotheses specified in VS1.

The general solid theory in VS2 has its own dependency chain. It uses neither the Artin property nor ULA. Completed ULA/solid comparisons are in VS3; solid divisor descent and partial support are in VS4. These placements keep generic solidity reusable independently of the geometry of `Bun_G`.

## Conventions and library vocabulary

Fix the residual characteristic `p`. The geometric torsion statements use a coefficient ring `Λ` with `nΛ=0` for an integer `n` prime to `p`. For a single prime, write `ℓ≠p`. Each exceptional operation retains the compactifiability, representability, separation and dimension hypotheses stated at its use. A locally finite transcendence dimension is not a global finite bound.

For the lisse statements choose a discrete `ℤ_ℓ`-algebra `Λ_disc` and form the condensed coefficient ring

`Λ = ℤ_ℓ ⊗_(ℤ_ℓ,disc) Λ_disc`.

This convention includes rational localization. On a geometric point the lisse category is `D(Λ_disc)`. In contrast, `D_lc` consists of perfect locally constant complexes; it is a much smaller category. A complex is perfect as a derived complex, including bounded Tor amplitude. Finite generation (`Module.Finite`) or finite-dimensional cohomology in each degree alone does not imply this condition.

Write `⊗solid` for the derived solid tensor where the arguments are complexes, `f♯` for the left adjoint of solid ordinary pullback, and `D_X/S(A)=RHom(A,f!Λ)` for relative torsion Verdier duality where `f!` exists. The operation `f♯` is defined on all small-v-stack maps; an eligible torsion `Rf_!` has a different domain of definition. Distinguish relative kernel adjoints from tensor duals in an ordinary monoidal category. All convolution associators, descent limits, adjunctions and scalar-extension compatibilities use the same enhanced category.

Three coefficient conventions occur: integer solidity on condensed groups; the polynomial restriction criterion for arbitrary discrete rings; and completeness for an analytic topological ring such as a finite extension `E/ℚ_p`. Also distinguish the analytic ring with discrete underlying `A` and underlying-integer-solid modules from the topological condensed realization of the same abstract ring. A ring alone does not specify its analytic measures.

Smallness is part of each site and category. Construct the relevant presentable categories at compatible sufficiently large cutoffs and compare them under enlargement. Do not infer presentability of the unrestricted solid category from presentability at a cutoff. The regular-cardinal condensed sites, the universe-small compact-Hausdorff site and the light condensed site need compatible restriction/realization functors, density, free-object comparison and enhanced tensor/Hom comparison.

The concrete library vocabulary is the following; use these declarations rather than duplicate their carriers.

- Mathlib [`Condensed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Basic.lean), `CondensedSet`, `CondensedMod` and `CondensedAb` are coherent sheaves on compact Hausdorff spaces. `CondensedAb` uses the universe-lifted integers. `Profinite`, `CompHaus`, `profiniteToCondensed`, `TopCat.toCondensedSet` and `CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet` give the topological realizations.
- [`CondensedMod.IsSolid`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Solid.lean) tests inversion of the existing maps `Condensed.profiniteSolidification`. The free functor `Condensed.profiniteFree` and the right-Kan-extension functor `Condensed.profiniteSolid` already exist. Use the predicate directly over the integers and finite-type integer algebras; arbitrary discrete rings use the polynomial tests below. The free object construction does not by itself give its solidity or the reflection theorem.
- [`LocallyConstant.freeOfProfinite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean) supplies Nöbeling freeness of `LocallyConstant S ℤ`. A new proof of that theorem is not part of this roadmap.
- `CategoryTheory.ObjectProperty.FullSubcategory` and its inclusion `ι` supply the actual solid subcategory. `ModuleCat.restrictScalars` and `CategoryTheory.sheafCompose` supply sectionwise coefficient restriction. `CategoryTheory.GrothendieckTopology`, `Sheaf`, `Limits.limit`, `HasFiniteLimits`, `Comma`, `Adjunction`, `Equivalence`, `Abelian` and `MonoidalCategory` supply the ordinary categorical language.
- `DerivedCategory` is an ordinary localization of cochain complexes. `Pretriangulated`, `LeftRigidCategory` and `Idempotents.Karoubi` give ordinary categorical structures. The stable enhancement, kernel 2-category and enhanced idempotent completion come from the cited `EnhancedDerivedSheaves` layers. `Functor.Faithful` states injectivity on Hom; full faithfulness also requires surjectivity.
- Tau Ceti [`TauCeti.Huber.Pair`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/Pair.lean) and `TauCeti.ValuationSpectrum.spa` give Huber pairs and the set of continuous bounded valuation classes. This set alone is not an adic space or a strict localization. [`TauCeti.IsSmoothDiscrete` and `TauCeti.SmoothDiscreteTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean) give the discrete smooth topological representation carrier; use it in the representation-theoretic enhancement supplied by `SR.0`.

## References

Locators below refer to the following editions, using their printed page numbers.

- **FS**: Laurent Fargues and Peter Scholze, [*Geometrization of the local Langlands correspondence*](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), author-hosted 356-page edition. The geometry and coefficient constructions here use Chapters IV, V and VII; the Hecke interface uses IX.2. The roadmap states the corrected discrete-group exception in Remark IV.1.10 and uses a single annular convention throughout.
- **CS**: Peter Scholze, [*Lectures on Condensed Mathematics*](https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf), 78-page author-hosted edition. Use Theorems 3.2–3.3, Lectures IV–VIII and the appendix to Lecture IV.
- **SW**: Peter Scholze and Jared Weinstein, [*Berkeley Lectures on p-adic Geometry*](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), author-hosted 2020 edition. Printed pages 114 and 144 are PDF pages 124 and 154. The field in the printed Theorem 13.5.7 and Lemma 16.3.2 is `ℚ_p`; the general-local-field extension uses the bundle-classification input named below.
- **BCGP**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [*Modularity theorems for abelian surfaces*](https://math.uchicago.edu/~fcale/papers/Modular.pdf), author-hosted edition. Only the solid coefficient and analytic-stack conventions of §2.2.1 and §2.4.1 are used here; the modularity theorems belong to their own roadmap.
- **PQ**: Vytautas Paškūnas and Julian Quast, [*On local Galois deformation rings: generalised reductive groups*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/on_local_galois_deformation_rings_generalised_reductive_groups.pdf), *Forum of Mathematics, Pi* **14**, e15 (2026), published 96-page edition, [doi:10.1017/fmp.2026.10030](https://doi.org/10.1017/fmp.2026.10030). Appendix A, pp.88–91, supplies the qcqs condensed-set applications. For affine points use the representable `Hom` functor, which preserves sheaf limits; accessibility of an arbitrary functor is insufficient. Treat simultaneous equations as a map to `A^r`, with the compact intersection argument for arbitrary relations.

The [suggested Lean forms](Suggested.lean) accompany the definitions and interfaces. The mathematical targets, their hypotheses and their examples are specified below. API names in this document use the suffix after the common `TauCeti.Blueprint.VStack` namespace of that file.
## Mathematical prerequisite interfaces

The following are the specific forms of the imported inputs used in the layers. Build them on their owning roadmap's carrier and use the same enhancement throughout.

- **Enhanced descent and compactness (`EnhancedDerivedSheaves:E2,E3,E5`).** Smooth atlas comparison needs coherent bisimplicial descent of the unbounded categories without assuming every stack site has enough points. The ULA internal-Hom argument needs the compactness criterion of FS Lemma IV.2.20, p.122: for an exact adjunction between compactly generated stable categories, the left adjoint preserves compact objects exactly when the right adjoint preserves sums. A ringed-topos comparison with an enough-points hypothesis alone does not supply these statements. The product theorem needs the Λ-linear presentable stable categorical tensor product, characterized by the bilinear colimit-preserving exterior product; its compact generators are the tensor products of compact generators of the factors.
- **Untilts and curve geometry (`RelativeFarguesFontaine:RF2:untilts,RF2:integral-divisors,RF3`).** The divisor presentation must include the continuous twisted Weil torsor, its relation, and the inertia-surjective Gauss point used to descend a completed local-system action to a finite extension. Integral formal smoothness needs the ramified primitive-untilt equation and étale-local lifting of its coefficients over a Zariski closed perfectoid subspace. Use the formal integral `Spd O_E` and its special fibre; no Tate-affinoid assumption on `O_E` is inserted. Section spaces use the relative curve over the stated local field E, with its line bundles and projective embeddings.
- **Bundle and sousperfectoid geometry (`VectorBundlesAndIsocrystals:VB1–VB3`, `AdicSpacesPartII:R5`).** Supply positive-slope resolutions, quantitative global generation and the positive/negative Banach–Colmez presentations over the general local field. The smoothness examples and section-space criterion use étale-local smooth ball presentations, the tangent bundle and relative differentials on sousperfectoid charts, and deformation to the normal cone for Zariski closed embeddings. The successive Frobenius correction, étale retraction and stabilization estimates are those of FS IV.4.22–IV.4.30, pp.142–151; the bundle slope theory alone does not give these estimates.
- **Compact-Hausdorff cohomology.** CS Theorems 3.2–3.3, pp.20–23, and Corollary 4.8, p.26, require the condensed/sheaf/Čech comparison, cofiltered continuity, homotopy invariance for torus powers, Tietze extension and finite partitions of unity. On a profinite hypercover the real-valued cocycle primitive must satisfy the `(1+ε)` norm estimate for every `ε>0`, including the augmented degree. The ordinary `CompHaus` and `Sheaf` carriers do not themselves assert these cohomology results.
- **Finite-power homological resolution (`StableHomotopyKTheory`, Part II, on its stable-homotopy foundations; `EnhancedDerivedSheaves:E0–E1`).** The Breen–Deligne proof uses uniform stable-range finiteness and pseudo-coherence for iterated Eilenberg–Mac Lane homology, giving finite multiplicities in every resolution degree. Relate the iterated bar constructions and simplicial free resolutions to the common Dold–Kan/derived enhancement. An arbitrary infinite free resolution or a Serre-class finiteness statement without the functorial stable-range bound does not replace this input. The exact source is CS Appendix to Lecture IV, Theorems 4.14 and 4.16 and Proposition 4.17, pp.30–32.
- **Analytic coefficients (`SolidAnalyticRings:SA.2–SA.4`, `AnalyticStacks:AS.2–AS.3`).** Import the theory of measures, Dirac maps and derived-Hom analytic-ring axiom, with the distinction between `R_solid` and the `(R,ℤ)`-solid structure. For topological E, use measures `E⊗solid_ℤ ℤ[S]_solid` and the corresponding complete tensor/Hom. For discrete A, use the underlying-integer-solid modules and the !-topology's gluing, excision and formal-complement description. Compare these analytic module constructions across the regular-cardinal, universe-small and light sites, including free objects and derived tensor/Hom, before identifying their realizations.
- **Smooth representation enhancement (`SmoothRepresentationsOfLocalGroups:SR.0:abelian-category,SR.0:derived-extension,SR.2`, and its Part II extension).** Start with `TauCeti.SmoothDiscreteTopRep`. The abelian interface needs kernels, cokernels, sums and exact invariants for open pro-p subgroups under the prime-to-p coefficient hypothesis; the derived interface needs continuous invariants and torsor descent. Compact induction needs Frobenius reciprocity, exactness, product compatibility and coefficient change. The Part II extension supplies compact-induction generation, the compact derived Bernstein–Zelevinsky involution, the full-complex perfection/reflexivity tests for pro-p invariants and the product-Hom comparison. Do not introduce a separate representation category to state the geometric equivalences.
- **Formal-neighborhood and algebraic ULA comparison (`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison,H5/comparison-over-nonarchimedean-fields-3-8-1`, `EtaleDualityAndPerverseSheaves`, Part II, on `EDC.1`).** The strict-local chart application uses the actual defining ideal, completion, special-fibre support and punctured generic fibre of FS Remark V.4.3, p.178. The analytification theorem needs the algebraic relative-kernel adjoint criterion for ULA as well as comparison of operations, especially open-immersion `Rj_*`. Scheme Verdier duality by itself is not the relative ULA criterion, and a perverse-only category is not its carrier.
- **Global dualizing normalization.** For the torsion `Bun_G` dualizing object, implement the complement/purity extension of the Haar-normalized local system from the semistable locus in the proof of FS Theorem V.5.1, pp.180–181. Preserve the prime-to-p coefficient conditions and the dependence of the displayed trivialization on the Haar choices. The homology adjunction itself is independent of those choices.
- **Connected-kernel homology.** In the stratum comparison, calculate the unit homology of the nonproper Banach–Colmez fibres integrally. Use the eligible nonproper torsion comparison of FS Proposition VII.5.2 and the ball trace; justify unit detection using the required bounded finitely presented cone or derived-completion hypothesis, then extend by solid scalar extension. Proper smooth Poincaré duality cannot be applied to these nonproper fibres, and mod-ℓ reductions alone do not detect an arbitrary rational solid object. This is the precise integral-to-solid interface used in the proof of FS Proposition VII.7.1, pp.271–272.
- **Coefficient descent (`EnhancedDerivedSheaves:E4/perfect-coefficient-change`).** The coefficient-change targets below assert preservation. A converse based on faithfully flat scalar extension additionally requires descent of perfect derived complexes with a uniform finite Tor-amplitude bound. Finite generation of an ordinary module does not establish that converse.


## Layer VS0: Artin v-stacks, smooth descent and partial support

Begin with the existing small v-stack and diamond carriers. The Artin property supplies separated smooth charts and representable diagonals; it does not impose quasiseparatedness on the whole stack. Smooth descent gives the coefficient category and normalized exceptional pullback. The annular construction uses spatial partially proper geometry and is the input for contraction arguments.

### VS0.1. Artin definition, atlas independence and geometric stability

Compare two atlases through their fibre product and use representability to stay on locally spatial diamonds. Build the Artin property as a property of the existing stack, rather than a second stack type.

<a id="artin-v-stack-definition"></a>

**Artin v-stacks.** Define an Artin v-stack to be a small v-stack X whose diagonal is representable in locally spatial diamonds and for which a locally spatial diamond U admits a separated, surjective, cohomologically smooth map U→X. Use the separated representable cohomological-smoothness predicate, tested on strictly totally disconnected perfectoid base changes. The property is invariant under equivalence. It forces the diagonal to be quasiseparated, without forcing X to be quasiseparated.

*Hypotheses:* X is a small v-stack. The diagonal X→X×X is representable in locally spatial diamonds. There is a surjective map U→X from a locally spatial diamond that is separated and cohomologically smooth (ell-cohomologically smooth for the primes ell≠p in play).

*Source:* FS, Definition IV.1.1; Remarks IV.1.2–IV.1.6, pp.107–109; Example IV.1.9(iv), p.110.

*Prerequisites:* `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondSixOperations:S4/cohomologically-smooth`.

<a id="stability-under-fibre-products-and-representable-maps"></a>

**Stability of Artin v-stacks.** (i) If X,Y,Z are Artin v-stacks then X×Z Y is Artin. (ii) If S→* is a pro-étale surjective, separated, cohomologically smooth map of v-sheaves representable in locally spatial diamonds, then a small v-stack X is Artin iff X×S is Artin; in particular the Artin property may be tested after base change to Spd E or to Spa F_q((t^(1/p^∞))). (iii) If f:X→Y is representable in locally spatial diamonds and Y is Artin, then X is Artin: pull back an atlas of Y and use the representable diagonal; in particular locally closed substacks of Artin v-stacks are Artin. Cohomological smoothness of maps of Artin v-stacks, defined through separated smooth charts, does not depend on the chart and is smooth-local on the source, with the separation and eligibility conditions retained.

*Hypotheses:* All stacks are small v-stacks. In (i) all three stacks, including the base of the fibre product, are Artin. In (ii) S→* is pro-étale surjective, separated, cohomologically smooth and representable in locally spatial diamonds. In (iii) the map to the Artin v-stack is representable in locally spatial diamonds.

*Source:* FS, Proposition IV.1.8; Example IV.1.9(i)–(iii); Definition IV.1.11; Convention IV.1.12, pp.109–111.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `ArtinVStack.ofAtlas` | A representable diagonal and a specified surjective separated smooth atlas give the Artin property. |
| `ArtinVStack.atlas` | Choose U→X with all four atlas conditions; every base change retains them. |
| `ArtinVStack.diagonal` | The diagonal is representable in locally spatial diamonds and quasiseparated. |
| `ArtinVStack.equiv` | Equivalent small v-stacks have equivalent Artin properties. |
| `ArtinVStack.chartRefinement` | Two smooth atlases have common refinement U×X V, smooth over each chart. |
| `ArtinVStack.coefficients` | The coefficient category is the existing small-v-stack D_et, computed by smooth atlas descent. |

**Examples and tests.**

- `ArtinVStack.diamond`: Every locally spatial diamond is Artin via the identity atlas.
- `ArtinVStack.empty`: The empty locally spatial diamond is Artin, with empty atlas and diagonal.
- `ArtinVStack.classifying_nonquasiseparated`: For H=E×, closed in GL_1(E), [*/H] is Artin while its noncompact diagonal fibre H is not quasicompact. Requiring X itself to be quasiseparated would exclude this example.

### VS0.2. Enhanced smooth descent and eligible normalized exceptional operations

Compute descent on the Čech nerve with coherent ordinary pullbacks. In the exceptional presentation cancel the invertible chart dualizing objects. The chart separation condition is part of the construction of every smooth stacky operation.

<a id="enhanced-smooth-descent"></a>

**Enhanced smooth atlas descent.** For a separated cohomologically smooth atlas U→X of an Artin v-stack, reconstruct D_et(X,Λ) as the enhanced limit of D_et(U_n,Λ) along ordinary pullback on the Čech nerve. For prime-to-p torsion Λ this is the existing small-v-stack étale category. Comparison on common refinements identifies different atlases coherently. Normalize the exceptional transition presentation by the invertible smooth dualizing objects to recover this ordinary-pullback presentation.

*Hypotheses:* X is an Artin v-stack and U→X a separated cohomologically smooth surjection from a locally spatial diamond. Λ is a ring killed by an integer n prime to p. The enhancement of D_et and its hyperdescent are imported from EnhancedDerivedSheaves.

*Source:* FS, Convention IV.1.12; Definitions IV.1.13–IV.1.15, pp.110–111.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `DiamondSixOperations:S4/smooth-twisted-pullback`.

<a id="shriek-pullback-for-smooth-stacky-maps"></a>

**Exceptional pullback for smooth stacky maps.** Construct exceptional pullback for a cohomologically smooth Artin morphism f:X→Y using charts g:U→X for which both g and fg are separated. On a chart, impose g!f!≃(fg)!; cancelling the chart dualizing object produces f!A≃ω_f⊗f*A with ω_f invertible. Descent supplies coherent composition, base change and the stacky left adjoint on this smooth class. On separated representable eligible maps it recovers the existing operation. This construction does not assert exceptional operations for arbitrary locally finite-dimensional Artin maps.

*Hypotheses:* f:Y→X is a cohomologically smooth map of Artin v-stacks in the sense of Convention IV.1.12: some separated smooth surjection g:V→Y from a locally spatial diamond has f∘g separated. Λ is a ring killed by an integer n prime to p (or, where the source allows it, an adic ring in the sense of ECD §26).

*Source:* FS, IV.1.11–IV.1.16, pp.110–112, including Remark IV.1.16.

*Prerequisites:* [VS0/enhanced-smooth-descent](#enhanced-smooth-descent), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`.

<a id="point-to-classifying-stack-not-smooth"></a>

**Point maps to classifying stacks.** Let H be a locally profinite group admitting a closed embedding into GL_n(E), with ell≠p. If H contains an infinite compact open subgroup K, the point map *→[*/H] is not ell-cohomologically smooth: on K its exceptional dualizing sheaf is the noninvertible sheaf of F_ell-valued distributions. If H is discrete, the point map is separated étale and cohomologically smooth, including infinite discrete H.

*Hypotheses:* H is a locally profinite group with a closed embedding into GL_n(E). ell≠p.

*Source:* FS, Remark IV.1.10, p.110.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), `DiamondSixOperations:S5/profinite-quotient-upper-shriek`, `DiamondSixOperations:S4/etale-maps-smooth`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `ArtinVStack.smoothDescent.toCharts` | An object gives pullbacks to U_n with coherent descent data. |
| `ArtinVStack.smoothDescent.glue` | Compatible objects on the Čech nerve glue uniquely up to coherent equivalence. |
| `ArtinVStack.smoothDescent.equivalence` | Restriction and gluing give the stated equivalence with the existing ECD category. |
| `ArtinVStack.smoothDescent.refine` | Refinement commutes with restriction, and identity/composition refinements have coherent unit/composition equivalences. |
| `ArtinVStack.smoothDescent.normalized` | Ordinary and exceptional smooth transition presentations correspond after tensoring with the smooth dualizing objects. |
| `ArtinVStack.smoothExceptionalPullback.chart` | On a permitted chart, g!f! is canonically (f∘g)!. |
| `ArtinVStack.smoothExceptionalPullback.dualizing` | ω_f=f!Λ is invertible and f!A=ω_f⊗f*A. |
| `ArtinVStack.smoothExceptionalPullback.adjoint` | The smooth stacky left adjoint f_! satisfies Map(f_!B,A)=Map(B,f!A). |
| `ArtinVStack.smoothExceptionalPullback.id` | Identity exceptional pullback and its dualizing object are normalized to id and Λ. |
| `ArtinVStack.smoothExceptionalPullback.comp` | For composable maps in this smooth chartwise class, (f∘g)!≃g!f! coherently. |
| `ArtinVStack.smoothExceptionalPullback.baseChange` | Pullback of ω_f and the smooth f! formula agrees after any permitted Cartesian base change. |

**Examples and tests.**

- `ArtinVStack.smoothDescent.identity`: The identity atlas recovers the original coefficient category and identity restriction.
- `ArtinVStack.smoothDescent.empty`: The category for the empty stack is the zero stable category.
- `ArtinVStack.smoothDescent.torsor`: For finite H, the smooth atlas *→[*/H] gives continuous H-torsor descent data. For H=Z_p this point map is not smooth and cannot be used as a smooth atlas. Infinite discrete H instead gives an étale point map.
- `ArtinVStack.smoothExceptionalPullback.identity`: The identity has ω=Λ and identity left/right adjoints.
- `ArtinVStack.smoothExceptionalPullback.etale`: A separated étale map has ω=Λ and f!=f*.
- `ArtinVStack.smoothExceptionalPullback.smoothDiamond`: A smooth diamond map of pure dimension d with oriented dualizing object has ω=Λ(d)[2d], not Λ[-2d].

### VS0.3. Partial compact support with its actual annular scope and vanishing

Fix the annuli by `|u|^b ≤ |t| ≤ |u|^a`, for rational `0<a≤b<∞`. Their two unions are `U_a=⋃_b U_{a,b}` and `U_b=⋃_a U_{a,b}`. Extension-by-zero counits set the direction of the colimits. The punctured-disc calculation and a uniformly bounded finite-dimensional hypercover yield the exterior-product vanishing.

<a id="partial-compact-support"></a>

**Partial compact-support functors.** Let k be algebraically closed of characteristic p, X a spatial diamond partially proper over Spd k with finite transcendence dimension, and S a spatial diamond over k. For α:X×k S→X and β:X×k S→S, take universally open quasi-pro-étale affinoid covers and pseudouniformizers t,u. Use the annular systems fixed above to define Rβ_!+C=colim_a Rβ_*j_a!(C|U_a) and Rβ_!−C=colim_b Rβ_*j_b!(C|U_b). The extension-by-zero counits give the transition maps. Common cofinal systems compare the choices. The construction is a pair of partial-support functors; the colimit itself does not assert a general adjunction or an unrestricted exceptional pushforward.

*Hypotheses:* k is an algebraically closed field over F_q; everything is over Perf_k. X is a spatial diamond with X→Spd k partially proper and dim.trg finite. S is a spatial diamond over k. Λ is a ring killed by an integer n prime to p.

*Source:* FS, IV.5, construction after Lemma IV.5.1; Definition IV.5.2, pp.152–153.

*Prerequisites:* `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

<a id="partial-compactly-supported-vanishing"></a>

**Vanishing at both partial-support ends.** For X and S in the preceding IV.5 partially proper finite-dimensional setup, A∈D_et(X,Λ) and B∈D_et(S,Λ), with Λ prime-to-p torsion, both Rβ_!+(α*A⊗β*B) and Rβ_!-(α*A⊗β*B) vanish. The theorem concerns exterior pullbacks of this form; it is not vanishing for every sheaf on X×U.

*Hypotheses:* The setup of Definition IV.5.2: k algebraically closed over F_q, X spatial, partially proper over Spd k with dim.trg finite, S spatial. C=α*A⊗ᴸβ*B with A∈D_et(X,Λ) and B∈D_et(S,Λ). Λ is a ring killed by an integer n prime to p.

*Source:* FS, Theorem IV.5.3, pp.153–155.

*Prerequisites:* [VS0/partial-compact-support](#partial-compact-support), `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `PartialSupport.plus` | Rβ_!+ is the plus-end colimit of Rβ_*j_! in the IV.5 exhaustion. |
| `PartialSupport.minus` | Rβ_!- is the minus-end colimit with the specified source transitions. |
| `PartialSupport.transition` | Containment of the prescribed annuli gives the transition natural transformations. |
| `PartialSupport.cofinal` | A cofinal replacement induces a canonical equivalence of the colimit functors. |
| `PartialSupport.parameterChange` | Two pseudouniformizers/exhaustions yield equivalent functors through a common cofinal system. |
| `PartialSupport.baseChange` | In the IV.5 partially proper finite-dimensional setup the source’s supported pushforward comparisons commute with the permitted base changes. |

**Examples and tests.**

- `PartialSupport.empty`: If X is empty, both functors take every object to zero.
- `PartialSupport.zero`: Both functors send the zero complex to zero.
- `PartialSupport.cofinalAnnuli`: Replacing an annular system by a cofinal subsequence gives the same functor; reversing the support direction is not that replacement.
- `PartialSupport.properBand`: For nonzero Λ and S=Spa(C,O_C), suppose a section i:S→X×k S of β is a proper closed immersion whose image lies in one finite annular band U_{a,b}. For i_*Λ, both partial-support functors are canonically Λ: sufficiently large supports contain the graph, and β∘i=id. In particular neither functor is identically zero.

## Layer VS1: Universal local acyclicity and geometric criteria

Universal local acyclicity combines strict-local generization invariance with perfect constructibility of supported direct images. Develop its locality and duality before applying it to section spaces and hyperbolic localization. The divisor results use the existing Weil group and Fargues–Fontaine curve, with full faithfulness distinguished from essential surjectivity.

### VS1.1. ULA, constructibility, local constancy, kernels, dualizability and calculus

Build the strict-local and constructibility clauses first. The relative kernel category then turns the ULA tensor-Hom comparison into evaluation, coevaluation and triangle identities. Relative duality and the adjoint criterion supply the calculus; ordinary monoidal rigidity alone does not supply it.

<a id="ula-definition-with-constructibility"></a>

**Local acyclicity and universal local acyclicity.** For a compactifiable map f:X→S of locally spatial diamonds with locally finite transcendence dimension, define local acyclicity of A∈D_et(X,Λ) by two conditions. First, for every geometric x over s and every generization t of s, the strict-local map RΓ(X_x,A)→RΓ(X_x×S_s S_t,A) is an equivalence. Second, whenever j:U→X is separated étale and fj is quasicompact, R(fj)_!(A|U) is perfect-constructible. Define ULA by requiring both conditions after every locally spatial base change. For a compactifiable representable map of small v-stacks with the same local dimension hypothesis, test local acyclicity on the pullback to every locally spatial diamond over S. Use the supplied strict localizations and perfect-constructible subcategory.

*Hypotheses:* f:X→S is a compactifiable map of locally spatial diamonds with locally finite dim.trg; in the extension, a compactifiable map of small v-stacks representable in locally spatial diamonds with locally finite dim.trg. A∈D_et(X,Λ). Λ is a ring killed by an integer n prime to p.

*Source:* FS, Definition IV.2.1; Remarks IV.2.2–IV.2.3, pp.114–115; Definition IV.2.22, p.123.

*Prerequisites:* `DiamondSixOperations:S0/eligible-morphism`, `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/qcqs-diamond-continuity`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

<a id="ula-descent-and-smooth-locality"></a>

**ULA locality and proper pushforward.** Clause (a) of local acyclicity holds after every base change iff A is overconvergent. Local acyclicity descends along v-covers of the base. On a spatial diamond a constructible sheaf is locally constant iff it is overconvergent, and a perfect-constructible complex is overconvergent iff it is locally a constant perfect complex; hence for f the identity, A is locally acyclic iff it is locally constant with perfect fibres. For separated f that is ell-cohomologically smooth for every ell dividing n, locally constant complexes with perfect fibres are f-ULA. For a proper map g:Y→X and compactifiable f:X→S, both of locally finite transcendence dimension, Rg_* carries complexes that are LA (respectively ULA) for f∘g to complexes that are LA (respectively ULA) for f; in particular for proper f, Rf_* of an f-LA complex is locally a constant perfect complex. For a separated map g:Y→X that is ell-cohomologically smooth for every ell dividing n, g* preserves LA and ULA, and detects them when g is surjective. The non-universal local acyclicity statements for smooth g assume that S is spatial with a uniform bound on the étale cohomological dimension of quasicompact separated étale U→S; the ULA statements require no extra uniform bound on the base.

*Hypotheses:* f:X→S is a compactifiable map of locally spatial diamonds with locally finite dim.trg. In IV.2.11, g:Y→X is proper with dim.trg finite; in IV.2.13, g is separated and ell-cohomologically smooth for every ell dividing n, and surjective for the converse. The non-universal statements of IV.2.13 assume S spatial with a uniform bound on the étale cohomological dimension of quasicompact separated étale U→S. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Propositions IV.2.4–IV.2.6, IV.2.9–IV.2.11, IV.2.13; Corollary IV.2.12; Lemma IV.2.14, pp.115–119.

*Prerequisites:* [VS1/ula-definition-with-constructibility](#ula-definition-with-constructibility), `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, `DiamondSixOperations:S1/lower-shriek-quasicompact`, `DiamondSixOperations:S1/qcqs-diamond-continuity`.

<a id="perfect-local-systems"></a>

**Perfect locally constant complexes.** On a small v-stack Y, form the full subcategory D_lc(Y,Λ) of complexes that become constant perfect derived Λ-complexes v-locally. Its objects are exactly the tensor-dualizable étale complexes. For spatial Y the local trivializations can be étale. Perfection includes a bounded complex and finite Tor amplitude; finite-dimensional cohomology separately in each degree does not characterize this category.

*Hypotheses:* Y is a small v-stack. Λ is a ring killed by an integer n prime to p.

*Source:* FS, IV.7, definition of D_lc before Proposition IV.7.3, p.165; Proposition IV.2.6, p.116.

*Prerequisites:* `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, [VS1/ula-descent-and-smooth-locality](#ula-descent-and-smooth-locality).

<a id="perfect-rhom-and-la-characterisation"></a>

**Perfect internal Hom and local acyclicity.** For a spatial diamond X, perfect-constructible A and any small-v-stack map g:Y→X, g*RHom(A,B)→RHom(g*A,g*B) is an isomorphism for all B, and RHom(A,Λ) is overconvergent. For an eligible f:X→S and f-ULA A, the formation of RHom(A,f!B), and in particular of the relative Verdier dual D_X/S(A), commutes with every base change S′→S of locally spatial diamonds. For such A, D_X/S(A)⊗f*B≃RHom(A,f!B). Conversely this formula, together with overconvergence, characterizes LA under the local uniform bound on the cohomological dimension of separated qc étale neighborhoods of X. Universally on S it characterizes ULA with overconvergence retained. Affinoid perfectoid maps to spatial S admit the cofinal relative-ball neighborhoods of IV.2.16 used to prove the formula.

*Hypotheses:* f:X→S is a compactifiable map of locally spatial diamonds with locally finite dim.trg. In IV.2.17–IV.2.18, X is spatial and A perfect-constructible. In IV.2.15 and IV.2.19, A is f-universally locally acyclic. In Remark IV.2.21(i), locally on X the étale cohomological dimension of quasicompact separated étale U→X is uniformly bounded. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition IV.2.15; Lemmas IV.2.16–IV.2.18; Proposition IV.2.19; Lemma IV.2.20; Remark IV.2.21, pp.119–123.

*Prerequisites:* [VS1/ula-definition-with-constructibility](#ula-definition-with-constructibility), `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

<a id="kernel-correspondence-category"></a>

**The category of cohomological kernels.** Over a small v-stack S, construct the kernel 2-category C_S. Objects are compactifiable maps X→S representable in locally spatial diamonds, of locally finite transcendence dimension. Set Hom(X,Y)=D_et(X×S Y,Λ). For A on X×S Y and B on Y×S Z, composition is Rπ13!(π12*A⊗π23*B); the identity on X is Δ!Λ. The eligible operations and their coherent exchange laws give the associator and units. Relative Verdier duality is RHom(A,Rf!Λ). The relevant dualizability is possession of an adjoint as a kernel.

*Hypotheses:* S is a small v-stack. Objects are maps X→S that are compactifiable, representable in locally spatial diamonds, with locally finite dim.trg. Λ is a ring killed by an integer n prime to p.

*Source:* FS, IV.2.3.3, construction before Theorem IV.2.23, p.124.

*Prerequisites:* [VS0/enhanced-smooth-descent](#enhanced-smooth-descent), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

<a id="ula-dualizability-criterion"></a>

**ULA as a kernel adjoint.** For X→S in C_S and A∈D_et(X,Λ), A is ULA iff p1*D_X/S(A)⊗p2*A→RHom(p1*A,p2!A) is an equivalence, iff A∈Hom_C_S(X,S) has a right adjoint. That adjoint is D_X/S(A). ULA relative duals are ULA and the bidual map is an equivalence; exterior products of ULA objects obey relative duality and ULA with the eligible hypotheses.

*Hypotheses:* S is a small v-stack and X→S an object of C_S: compactifiable, representable in locally spatial diamonds, locally finite dim.trg. A∈D_et(X,Λ). Λ is a ring killed by an integer n prime to p.

*Source:* FS, Theorem IV.2.23; Proposition IV.2.24; Corollary IV.2.25, pp.124–126.

*Prerequisites:* [VS1/kernel-correspondence-category](#kernel-correspondence-category), [VS1/ula-descent-and-smooth-locality](#ula-descent-and-smooth-locality), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, [VS1/perfect-rhom-and-la-characterisation](#perfect-rhom-and-la-characterisation).

<a id="ula-relative-adjoints-and-calculus"></a>

**Relative adjoints and ULA calculus.** In C_S, a p₂-ULA kernel A:X→Y is a left adjoint when Y→S is proper; its right adjoint is the switched relative dual. ULA is preserved by relative duality with biduality, exterior products and eligible composition g*A⊗B, with the corresponding dual formulas. If f is a retract over S of eligible g and Λ is g-ULA, then Λ is f-ULA. For proper quasi-pro-étale g:Y→X and eligible f:X→S, A is (fg)-ULA iff Rg*A is f-ULA. ULA base change gives f*Rg*A⊗B≃Rĝ*(f′*A⊗ĝ*B) for f-ULA B and arbitrary base map g.

*Hypotheses:* S is a small v-stack; all maps are compactifiable, representable in locally spatial diamonds, with locally finite dim.trg. In IV.2.24, Y→S is proper. In IV.2.28, g is proper and quasi-pro-étale and the spaces are locally spatial diamonds. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition IV.2.24; Corollary IV.2.25; Proposition IV.2.26; Corollary IV.2.27; Proposition IV.2.28; Corollary IV.2.29, pp.125–128.

*Prerequisites:* [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), [VS1/kernel-correspondence-category](#kernel-correspondence-category), [VS1/perfect-rhom-and-la-characterisation](#perfect-rhom-and-la-characterisation), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `IsULA.generization` | ULA implies the stated strict-local generization map is an equivalence after any base change. |
| `IsULA.compactDirectImage` | Every separated étale j with f∘j quasicompact has perfect-constructible supported direct image. |
| `IsULA.iff` | ULA is precisely the conjunction of these two clauses after every locally spatial base change. |
| `IsULA.baseChange` | Pullback of a ULA object is ULA for the pulled-back map. |
| `IsULA.iso` | Isomorphic complexes have the same ULA property. |
| `IsULA.schemes` | For separated finite-type K-schemes and bounded constructible torsion complexes, ULA agrees with scheme ULA after analytification, using IV.2.30 and the supplied comparison operations. |
| `IsULA.overVStack` | Over a base that is a small v-stack, ULA is local acyclicity after pullback to every locally spatial diamond over the base; for a locally spatial base this is the direct definition. |
| `PerfectLocalSystem.constant` | A perfect Λ-complex gives a constant object of D_lc. |
| `PerfectLocalSystem.fibre` | Every geometric fibre is perfect. |
| `PerfectLocalSystem.dualizable` | D_lc membership is equivalent to tensor dualizability. |
| `PerfectLocalSystem.pullback` | All stack pullbacks preserve these complexes and their duals. |
| `PerfectLocalSystem.etale` | On a spatial diamond the local trivializations may be taken étale. |
| `PerfectLocalSystem.point` | On an algebraically closed rank-one point D_lc identifies with Perf(Λ). |
| `KernelCategory.hom` | Hom(X,Y) is exactly D_et(X×S Y,Λ). |
| `KernelCategory.comp` | Composition is the displayed eligible supported convolution. |
| `KernelCategory.id` | The identity kernel is the diagonal supported tensor unit. |
| `KernelCategory.assoc` | Convolution satisfies a coherent associator and both unit laws. |
| `KernelCategory.baseChange` | Pullback along S′→S is a 2-functor respecting convolution and adjunction data. |
| `KernelCategory.dual` | The proposed right-adjoint kernel is the relative Verdier dual. |

**Examples and tests.**

- `IsULA.zero`: The zero complex is ULA for every eligible f.
- `IsULA.point_perfect`: On Spa C→Spa C with C algebraically closed, a bounded finite-dimensional F_ell complex is ULA.
- `IsULA.point_infinite`: An infinite-dimensional F_ell vector space in degree zero over Spa C satisfies the generization clause but is not ULA, because clause (b) for j=id demands perfection.
- `PerfectLocalSystem.unit`: The constant tensor unit is a perfect local system.
- `PerfectLocalSystem.zero`: The zero complex is a perfect local system.
- `PerfectLocalSystem.unbounded`: Over a field, a complex with one nonzero copy of the field in every nonnegative degree is not perfect although each cohomology group is finite-dimensional.
- `KernelCategory.point`: For X=Y=S, kernels compose by tensor over Λ and the identity is Λ.
- `KernelCategory.identity_action`: Convolution with Δ!Λ acts as the identity on every kernel.
- `KernelCategory.empty`: Every Hom category involving the empty diamond is the zero category.

### VS1.2. Artin ULA, smooth criterion, integral Spd O_E and analytification

For an Artin morphism choose a chart for which the composite satisfies compactifiability and the local dimension condition. The smooth criterion cancels the invertible dualizing object. The integral divisor statement includes the special fibre, and the scheme comparison uses bounded constructible complexes.

<a id="ula-for-artin-v-stacks"></a>

**ULA on Artin v-stacks.** For f:X→S between Artin v-stacks require a separated, representable, cohomologically smooth surjection g:U→X from a locally spatial diamond with fg compactifiable and of locally finite transcendence dimension. Define A to be f-ULA when g*A is (fg)-ULA. Common chart refinements and smooth locality make this independent of g. Extend operation and relative-dual formulas through these charts only in the classes where the corresponding operations exist.

*Hypotheses:* f:X→S is a map of Artin v-stacks. There is a separated, cohomologically smooth surjection g:U→X from a locally spatial diamond, representable in locally spatial diamonds, with f∘g compactifiable of locally finite dim.trg. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Definition IV.2.31, p.129.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), [VS0/enhanced-smooth-descent](#enhanced-smooth-descent), [VS1/ula-descent-and-smooth-locality](#ula-descent-and-smooth-locality).

<a id="smooth-ula-criterion"></a>

**Smoothness and duality criteria.** For smooth f:X→S of Artin v-stacks, A is ULA iff p1*RHom(A,Λ)⊗p2*A→RHom(p1*A,p2*A) is an equivalence. For a compactifiable representable diamond map of locally finite dimension, f is ell-cohomologically smooth iff F_ell is f-ULA and Rf!F_ell is invertible.

*Hypotheses:* In IV.2.32, f:X→S is a cohomologically smooth map of Artin v-stacks and A∈D_et(X,Λ). In IV.2.33, f is a compactifiable map of v-stacks, representable in locally spatial diamonds, with locally finite dim.trg; ell≠p. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Propositions IV.2.32–IV.2.33, p.129.

*Prerequisites:* [VS1/ula-for-artin-v-stacks](#ula-for-artin-v-stacks), [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), [VS0/shriek-pullback-for-smooth-stacky-maps](#shriek-pullback-for-smooth-stacky-maps), `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`.

<a id="smooth-spd-oe"></a>

**Cohomological smoothness of Spd O_E.** For a nonarchimedean local field E with residue F_q and ell≠p, Spd O_E→Spd F_q is ell-cohomologically smooth, and its dualizing object is F_ell(1)[2]. The integral special fibre is included; smoothness of the generic fibre alone does not establish this.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q. ell≠p.

*Source:* FS, Corollary IV.2.34, p.130.

*Prerequisites:* [VS1/smooth-ula-criterion](#smooth-ula-criterion), `DiamondSixOperations:S5/spd-qp-smooth`, `DiamondSixOperations:S5/nonfree-quotient-smooth`, `RelativeFarguesFontaine:RF2:integral-divisors`, `ClassicalAdicEtaleCohomology:H4/annulus-cohomology`.

<a id="ula-analytification"></a>

**ULA and analytification.** For a complete nonarchimedean field K of residue characteristic p, separated locally finite-type K-scheme map f:X→S and A∈D_c^b(X,Λ), algebraic f-ULA is equivalent to diamond ULA of the analytification A_ad for f_ad,diamond. The bounded constructible range and all prime-to-p coefficient assumptions are retained.

*Hypotheses:* K is a complete nonarchimedean field with residue characteristic p. f:X→S is a separated morphism of K-schemes locally of finite type. A∈D^b_c(X,Λ). Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition IV.2.30 and footnote 2, p.128.

*Prerequisites:* [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`, `DiamondsAndVStacks:D6/etale-site-comparison`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `IsArtinULA.ofChart` | ULA on a permitted chart constructs the Artin ULA property. |
| `IsArtinULA.chart` | Every permitted chart detects the same property. |
| `IsArtinULA.baseChange` | Permitted Artin base change preserves ULA and the composite-chart hypothesis. |
| `IsArtinULA.iso` | The property depends only on the isomorphism class of the complex. |
| `IsArtinULA.diamond` | On diamond maps this is exactly IsULA, by identity charts. |

**Examples and tests.**

- `IsArtinULA.diamond_test`: Identity charts recover the two diamond ULA clauses.
- `IsArtinULA.zero`: The zero complex is ULA whenever a permitted chart exists.
- `IsArtinULA.classifying_perfect`: For a finite p-group H and F_ell with ell≠p, a finite-dimensional representation on [*/H] is ULA over the point.

### VS1.3. Formal smoothness, positive tangent section spaces and Jacobian criterion

Formal smoothness tests Zariski closed perfectoid subspaces. Its positive-slope Banach–Colmez examples feed the deformation to the normal cone in the Jacobian argument. The tangent complex is the stated candidate cohomology; the normal-cone fibre comparison is the precise geometric theorem used.

<a id="formal-smoothness"></a>

**Formal smoothness of v-stacks.** A v-stack map f:X→Y is formally smooth if every compatible square consisting of a characteristic-p affinoid perfectoid S, a Zariski closed S0⊂S, a map S→Y and a map S0→X admits the following lift. There is an étale S′→S whose image contains |S0| and a map S′→X over Y that agrees with S0→X on S′×S S0. The test concerns Zariski closed perfectoid subspaces, rather than the scheme infinitesimal lifting test.

*Hypotheses:* f is a map of v-stacks. Test objects: S affinoid perfectoid of characteristic p, S_0⊂S Zariski closed, with compatible maps S_0→source and S→target.

*Source:* FS, Definition IV.3.1, p.130.

*Prerequisites:* `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`.

<a id="formal-smoothness-calculus"></a>

**Formal smoothness and local sections.** Formal smoothness of small v-stack maps is stable under composition and base change and gives universal openness. For maps of locally spatial diamonds it is étale-local on both sides. A formally smooth v-surjection of small v-stacks admits étale-local sections. Corollary IV.3.6 is the descent statement through a formally smooth surjection; no descent through an arbitrary map is asserted.

*Hypotheses:* The maps are maps of v-stacks; locality on source and target is asserted only for maps of locally spatial diamonds. Sections exist étale-locally only for formally smooth maps that are surjective.

*Source:* FS, Observations (i)–(iv) following Definition IV.3.1; Propositions IV.3.2 and IV.3.5; Corollary IV.3.6, pp.131–132.

*Prerequisites:* [VS1/formal-smoothness](#formal-smoothness), `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondSixOperations:S4/smooth-universally-open`.

<a id="formal-smoothness-examples"></a>

**Formally smooth diamonds and Banach–Colmez spaces.** On perfectoid spaces of characteristic p, the v-sheaves B=O⁺ and A¹=O are formally smooth over the point, and so is Spd O_E for a nonarchimedean local field E. If f:Y→X is a smooth morphism of analytic adic spaces over Z_p, then the associated map of diamonds is formally smooth. For a perfectoid space S and a map [E₁→E₀] of vector bundles on X_S with E₀ everywhere of positive and E₁ everywhere of negative Harder–Narasimhan slopes, BC([E₁→E₀])→S is formally smooth.

*Hypotheses:* In IV.3.3 the base is the point, on perfectoid spaces of characteristic p; E is a nonarchimedean local field. In IV.3.4, f is a smooth morphism of analytic adic spaces over Z_p. In IV.3.8, S is a perfectoid space and [E_1→E_0] a map of vector bundles on X_S with E_0 everywhere of positive and E_1 everywhere of negative Harder–Narasimhan slopes.

*Source:* FS, Propositions IV.3.3 and IV.3.8; Corollary IV.3.4, pp.131–133; used in the proof of Lemma IV.4.28, pp.147–148.

*Prerequisites:* [VS1/formal-smoothness](#formal-smoothness), [VS1/formal-smoothness-calculus](#formal-smoothness-calculus), `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`, `RelativeFarguesFontaine:RF2:integral-divisors`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`, `VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`, `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`, `AdicSpacesPartII:R5`.

<a id="section-functor-and-positive-tangent"></a>

**Relative section spaces and positive tangent locus.** For perfectoid S/F_q and a smooth sousperfectoid map Z→X_S over the relative Fargues–Fontaine curve, define M_Z(T) to be sections of Z_T→X_T. Assume locally on S that Z is Zariski closed in an open subset of adic projective space, with closed immersion in the sense of FS IV.4.20. Define M_Z^sm by requiring all geometric slopes of s*T_Z/X_S to be strictly positive. The candidate tangent/obstruction cohomology is RΓ(X_T,s*T_Z/X_S): its H¹ vanishes on this locus and its H⁰ is the positive Banach–Colmez space. The normal-cone construction identifies the zero-section fibre with BC(s*T_Z/X_S). It is this fibre comparison, rather than a direct infinitesimal deformation theorem for M_Z, that is used.

*Hypotheses:* S is a perfectoid space over F_q. Z→X_S is a smooth map of sous-perfectoid adic spaces. Locally on S, Z admits a Zariski closed immersion into an open subset of the adic projective space over X_S.

*Source:* FS, IV.4 preamble, p.133–134; Definition IV.4.1; Theorem IV.4.2; Remark IV.4.6; Example IV.4.7, pp.134–135; Definition IV.4.20, p.141.

*Prerequisites:* `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF3`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`, `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`, `VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`, `AdicSpacesPartII:R5/sousperfectoid-adic-space`, [VS1/formal-smoothness](#formal-smoothness).

<a id="jacobian-criterion"></a>

**Jacobian criterion for cohomological smoothness.** Under the preceding smooth/quasiprojective section hypotheses, M_Z is a locally spatial diamond, compactifiable over S, and M_Z^sm is an open subfunctor cohomologically smooth over S. At a geometric section its ell-dimension is deg(s*T_Z/X_S), locally finite. No global dimension bound is assumed. Strictly positive slopes are essential to this criterion.

*Hypotheses:* S is a perfectoid space over F_q. Z→X_S is a smooth map of sous-perfectoid adic spaces. Z admits a Zariski closed immersion into an open subset of the adic projective space P^n over X_S for some n. ell≠p.

*Source:* FS, Theorem IV.4.2, p.134; Propositions IV.4.21–IV.4.22, IV.4.24, IV.4.27, IV.4.29 with Lemmas IV.4.23, IV.4.25–IV.4.26, IV.4.28, IV.4.30, pp.141–151.

*Prerequisites:* [VS1/section-functor-and-positive-tangent](#section-functor-and-positive-tangent), [VS1/formal-smoothness-calculus](#formal-smoothness-calculus), [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), [VS1/smooth-ula-criterion](#smooth-ula-criterion), `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`, `VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`, `AdicSpacesPartII:R5`, [VS1/formal-smoothness-examples](#formal-smoothness-examples).

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `IsFormallySmooth.lift` | Every prescribed Zariski-closed lifting square has an étale-local solution agreeing over S0. |
| `IsFormallySmooth.baseChange` | Base change preserves the lifting property. |
| `IsFormallySmooth.comp` | Composites of formally smooth maps are formally smooth. |
| `IsFormallySmooth.etale` | Étale maps of perfectoid spaces are formally smooth. |
| `IsFormallySmooth.local` | The property is étale-local on source and target. |
| `IsFormallySmooth.open` | A formally smooth map is universally open; a formally smooth v-surjection has sections étale-locally. |
| `SectionSpace.section` | A section of Z_T→X_T defines a T-point of M_Z. |
| `SectionSpace.ext` | Two T-points agree iff their sections agree as maps over X_T. |
| `SectionSpace.baseChange` | Pullback along T′→T pulls back sections, and obeys identity/composition. |
| `SectionSpace.positive` | Membership in M_Z^sm is precisely strict positivity of every geometric pulled-back tangent bundle. |
| `SectionSpace.tangent` | The candidate tangent/obstruction cohomology is RΓ(X_T,s*T_Z/X_S), with H⁰ and H¹ and the normal-cone zero-section fibre BC(s*T_Z/X_S). No direct infinitesimal deformation theorem for M_Z is asserted. |
| `SectionSpace.vectorBundle` | Sections of a vector bundle V give the existing BC(V), not a new bundle-cohomology construction. |
| `SectionSpace.quotient` | For the Quot example a surjection E→F is in the smooth locus when max slope(ker)<min slope(F), because its tangent is Hom(ker,F). |

**Examples and tests.**

- `IsFormallySmooth.identity`: The identity morphism is formally smooth using the specified map S→X.
- `IsFormallySmooth.etale_test`: An étale map satisfies this definition with étale neighbourhood lifting.
- `IsFormallySmooth.closed_origin`: The origin inclusion into the perfectoid affine line is not formally smooth: a coordinate on a characteristic-p perfectoid disc vanishes on its closed origin but cannot vanish on an étale neighbourhood of that origin.
- `SectionSpace.identity`: Z=X_S gives M_Z=M_Z^sm=S and zero tangent.
- `SectionSpace.positive_bundle`: For V=O(1), M_V=BC(O(1)), H¹=0 and the smooth locus is all of M_V.
- `SectionSpace.zero_slope`: For V=O, M_V=E as a locally profinite sheaf, but M_V^sm is empty: slope zero is not strictly positive. The criterion is sufficient and does not detect every cohomologically smooth section space.

### VS1.4. Hyperbolic localization, Braden comparison, base change, duality and ULA

The intrinsic attracting and repelling correspondences give the two functors and their canonical comparison. Prove contraction using the partial-support vanishing, then pass from equivariant objects to the finite-colimit/retract monodromic category. Track boundedness separately for the local theorem.

<a id="hyperbolic-localization"></a>

**Hyperbolic localization and monodromic sheaves.** For proper f:X→S representable in spatial diamonds with finite relative transcendence dimension, impose Hypothesis IV.6.1 on the G_m-action: finitely many open-and-closed fixed pieces X_i^0 and locally closed attracting/repelling pieces X_i^± covering X, with the action extending over (A¹)^±. Set X^±=⊔X_i^±, with q±:X±→X and p±:X±→X0. Identify them intrinsically by equivariant maps (A¹)^±→X so that they do not depend on the decomposition. Define L+=Rp+!q+* and L−=Rp−*q−!, and construct L−→L+. Monodromic objects are the finite-colimit/retract closure of the pullback image of D_et(X/G_m,Λ).

*Hypotheses:* S is a small v-stack; f:X→S is proper, representable in spatial diamonds, with dim.trg finite. X/S carries a G_m-action satisfying Hypothesis IV.6.1. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Hypothesis IV.6.1; Proposition IV.6.2; Lemma IV.6.3; Definition IV.6.4; Definition IV.6.11, pp.155–157,162.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), [VS0/shriek-pullback-for-smooth-stacky-maps](#shriek-pullback-for-smooth-stacky-maps), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`.

<a id="braden-theorem"></a>

**Braden’s theorem for diamonds.** In the preceding proper finite-dimensional setup, for every A∈D_et(X/G_m,Λ), pulled back to X, the canonical map L−A→L+A is an equivalence; hence it is an equivalence for every monodromic A. More precisely, for A⁺∈D_et(X⁺/G_m,Λ) the map R(i⁺)!A⁺→R(p⁺)_!A⁺, and for A⁻∈D_et(X⁻/G_m,Λ) the map R(p⁻)_*A⁻→(i⁻)*A⁻, are equivalences, so that L−A≃(i⁻)*R(q⁻)!A≃R(i⁺)!(q⁺)*A≃L+A. For the more general compactifiable local setup of IV.6.9 the source requires bounded-below A, unless finite relative dimension is imposed. The global finite-dimensional theorem has no additional bounded-below restriction.

*Hypotheses:* S is a small v-stack and f:X→S is proper, representable in spatial diamonds, with dim.trg finite, and carries a G_m-action satisfying Hypothesis IV.6.1. A comes from D_et(X/G_m,Λ), or is monodromic in the sense of Definition IV.6.11. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Theorem IV.6.5; Proposition IV.6.6; Remark IV.6.7; Lemma IV.6.8; Proposition IV.6.9; Lemma IV.6.10, pp.158–162.

*Prerequisites:* [VS1/hyperbolic-localization](#hyperbolic-localization), [VS0/partial-compactly-supported-vanishing](#partial-compactly-supported-vanishing), `DiamondSixOperations:S3/upper-shriek`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-pushforward-exchange`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

<a id="hyperbolic-base-change-duality-and-ula"></a>

**Hyperbolic base change, duality and ULA.** For the proper finite-dimensional hyperbolic setup and monodromic objects, L commutes with base pullback and ordinary base pushforward. It commutes with supported pushforward and exceptional base pullback when the base map is compactifiable representable locally spatial of finite relative dimension. Relative Verdier duality exchanges L for an action with L for the inverse action. If A is f-ULA, LA is f0-ULA.

*Hypotheses:* The setup of Definition IV.6.11: f:X→S proper, representable in spatial diamonds, dim.trg finite, with a G_m-action satisfying Hypothesis IV.6.1. A is monodromic. For the two exceptional commutations the base change is compactifiable, representable in locally spatial diamonds, with dim.trg finite. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Propositions IV.6.12–IV.6.14, p.163.

*Prerequisites:* [VS1/braden-theorem](#braden-theorem), [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), [VS1/ula-descent-and-smooth-locality](#ula-descent-and-smooth-locality), [VS1/perfect-rhom-and-la-characterisation](#perfect-rhom-and-la-characterisation).

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `HyperbolicLocalization.attractor` | X+ represents G_m-equivariant maps from (A¹)+ to X, with q+=evaluation at 1 and p+=evaluation at 0. |
| `HyperbolicLocalization.repeller` | The same characterization with inverse action gives X−. |
| `HyperbolicLocalization.plus` | L+=Rp+!q+* with the specified supported operation. |
| `HyperbolicLocalization.minus` | L−=Rp−*q−! with the specified exceptional operation. |
| `HyperbolicLocalization.comparison` | The Cartesian fixed square and adjunctions define a canonical map L−→L+. |
| `HyperbolicLocalization.monodromic` | Monodromic objects are the finite-colimit/retract closure of the equivariant image. |
| `HyperbolicLocalization.refinement` | Changing the fixed-piece decomposition leaves the intrinsic correspondences and functors equivalent. |

**Examples and tests.**

- `HyperbolicLocalization.trivial_action`: For the trivial action, X0=X+=X−=X and both localization functors and the comparison are identities.
- `HyperbolicLocalization.empty`: For X empty all three spaces and both output categories are empty/zero.
- `HyperbolicLocalization.projective_line`: For P¹ over a geometric base with scaling action, the 0-attractor is A¹ and the opposite 0-repeller is the point; the two correspondences are not identical before taking the Braden comparison.

### VS1.5. Weil/divisor map, geometric finite-étale input and Drinfeld descent

Twist the Weil action by inverse Frobenius to obtain a map over the residue-field base. Descent on the torsor nerve proves full faithfulness. The finite étale curve input and the inertia-surjective Gauss point supply the perfect-local-system equivalence.

<a id="divisor-weil-map"></a>

**The divisor-to-Weil classifying map.** Let E have residue field F_q, put k=overline(F_q), and work on Perf_k. Import the divisor presentation Div¹≃Spd Ĕ/φ^ℤ≃[Spd C/W_E] with C a completed algebraic closure of E. An element τ of W_E acts on Spd C by τ∘Frob^(−deg τ), so that the action is over k. The resulting torsor defines ψ:Div¹→[*/W_E]. For any finite I and small v-stack X form ψ_X^I:X×(Div¹)^I→X×[*/W_E^I]. Use the imported Weil topology and degree, without reconstructing the Weil group.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q; k is the algebraic closure of F_q; everything is over Perf_k. W_E is the Weil group of E with its Weil topology and degree map, imported from the Tau Ceti ClassFieldTheory roadmap. Div¹ and its presentation are imported from RelativeFarguesFontaine.

*Source:* FS, IV.7, construction before Proposition IV.7.1, p.164.

*Prerequisites:* `RelativeFarguesFontaine:RF2:untilts`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

<a id="geometric-divisor-finite-etale"></a>

**Geometric finite étale descent for divisors.** For E a nonarchimedean local field and C0 an algebraically closed characteristic-p perfectoid field over k, finite étale covers of Spa C0×Div¹ come by pullback from Div¹. The geometric curve input is the exact supplier theorem that every finite étale O_X-algebra on the absolute Fargues–Fontaine curve over an algebraically closed point equals O_X⊗E A with A finite étale over E. In SW20 the displayed field is Q_p; the proof works in this E-generality using the supplied E-bundle classification and finite étale adic/diamond comparison.

*Hypotheses:* E is a nonarchimedean local field; C_0 is an algebraically closed nonarchimedean field of characteristic p over k. The printed lemma is for E=Q_p; the E-generality rests on the supplier's finite étale theorem for the curve of E.

*Source:* SW, Lemma 16.3.2 and the paragraph after it, p.144; Theorem 13.5.7, p.114; FS, Proof of Proposition IV.7.3, p.166.

*Prerequisites:* `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D6/etale-site-comparison`, `RelativeFarguesFontaine:RF2:untilts`, [VS1/divisor-weil-map](#divisor-weil-map).

<a id="drinfeld-pullback"></a>

**Fully faithful divisor descent.** For every small v-stack X and prime-to-p torsion Λ, ψ_X* is fully faithful on D_et. It is an equivalence if D_et(X,Λ)→D_et(X×Spd C,Λ) is an equivalence. For every finite I, ψ_X^I* remains fully faithful. Essential surjectivity of the full category is conditional; this is not a general product formula for fundamental groups.

*Hypotheses:* X is a small v-stack over k; I is a finite set. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition IV.7.1; Corollary IV.7.2, pp.164–165.

*Prerequisites:* [VS1/divisor-weil-map](#divisor-weil-map), `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

<a id="drinfeld-local-systems"></a>

**Drinfeld’s lemma for perfect local systems.** For every finite I, small v-stack X, and prime-to-p torsion Λ, ψ_X^I* gives D_lc(X×[*/W_E^I],Λ)≃D_lc(X×(Div¹)^I,Λ). This is the locally constant perfect formulation, not an unrestricted assertion π1((Div¹)^I)=W_E^I for a conventional profinite fundamental group.

*Hypotheses:* I is a finite set and X a small v-stack over k (the algebraic closure of F_q). Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition IV.7.3, pp.165–166.

*Prerequisites:* [VS1/perfect-local-systems](#perfect-local-systems), [VS1/drinfeld-pullback](#drinfeld-pullback), [VS1/geometric-divisor-finite-etale](#geometric-divisor-finite-etale), `RelativeFarguesFontaine:RF2:untilts`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `DivisorWeilMap.action` | The action is τ∘Frob^(−deg τ); it is a map over Spd k. |
| `DivisorWeilMap.torsor` | Spd C→Div¹ has relation W_E×Spd C and realizes the displayed quotient. |
| `DivisorWeilMap.classify` | The quotient torsor gives ψ to the existing Weil classifying stack. |
| `DivisorWeilMap.product` | Finite-set products and maps of indices induce ψ_X^I, compatibly with composition. |
| `DivisorWeilMap.inertia` | For τ in inertia the twisting Frobenius factor is the identity. |

**Examples and tests.**

- `DivisorWeilMap.degree_zero`: A degree-zero inertia element acts on Spd C by its usual action.
- `DivisorWeilMap.empty_indices`: For I empty, ψ_X^I is the identity of X.
- `DivisorWeilMap.frobenius_sign`: For degree-one τ the correction is Frob^−1, so its action is over Spd k; omitting it does not cancel the induced Frobenius on k.

## Layer VS2: Solid objects, coefficient structures and relative homology

Start this layer from condensed objects and the common derived enhancement. Establish the finite-power resolution and integer solidification, then coefficient structures, qcqs applications and solid sheaves on small v-stacks. These constructions require no Artin atlas or ULA hypothesis. Relative solid homology is the left adjoint of ordinary pullback for every small-v-stack map.

### VS2.1. Condensed cohomology, Breen resolution, solidification and closed derived tensor

Topological cohomology and the finite-power Breen–Deligne resolution calculate the condensed derived Hom groups. Nöbeling freeness identifies free solid objects with integer products. These computations establish their solidity, the full abelian subcategory, the reflection and its derived closed monoidal structure.

<a id="condensed-cohomology"></a>

**Cohomology of compact condensed spaces.** For compact Hausdorff S, condensed cohomology with discrete integer coefficients agrees with ordinary sheaf/Čech cohomology. Profinite S has H^i(S,Z)=0 for i>0. For the topological condensed reals, H^i(S,R)=0 for i>0 and H⁰=C(S,R). A profinite hypercover computes the latter by the augmented complex 0→C(S,R)→C(S0,R)→C(S1,R)→⋯; for i≥0, a cocycle in C(S_i,R) admits a primitive in the preceding augmented term (C(S,R) when i=0) of norm at most (1+ε) times its norm for each ε>0.

*Hypotheses:* S is a compact Hausdorff space. R is the condensed group of the topological reals.

*Source:* CS, Theorems 3.2–3.3, pp.20–23.

*Prerequisites:* `Condensed`, `CompHaus`, `CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`.

<a id="breen-deligne-resolution"></a>

**Breen–Deligne resolution.** There is a functorial resolution of every abelian group A by terms finite direct sums of Z[A^r], with augmentation Z[A]→A. Its differentials are universal finite integral combinations of maps induced by integer matrices, so it applies after sheafification in any topos. The natural scalar n action and the action induced by A→A, a↦na, are chain homotopic. Applied to condensed groups it gives the finite-power RHom spectral sequence used for solidification and sheaf solidity.

*Hypotheses:* A is an abelian group, or an abelian group object of a topos by functoriality.

*Source:* CS, Theorem 4.5 and Remarks 4.6–4.7, pp.25–26; Appendix to Lecture IV: Theorem 4.10, Proposition 4.12, Theorem 4.14, Lemma 4.15, Theorem 4.16, Proposition 4.17, pp.29–32.

*Prerequisites:* `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E0/dold-kan-simplicial-enrichment`, `CondensedAb`.

<a id="condensed-lca-rhom"></a>

**Derived Hom against reals and tori.** For A a product of copies of R/Z over any set, RHom(A,R)=0 in condensed groups; the source’s argument uses only that A is a compact Hausdorff abelian group, and gives the same vanishing for every such A. For a discrete abelian group M and a set I, RHom(product_I(R/Z),M)≃directSum_I M[-1]. In particular RHom(R,Z)=0 and RHom(product_I Z,Z)≃directSum_I Z, via 0→product Z→product R→product(R/Z)→0. These are condensed derived Hom statements, not ordinary abstract-group Hom computations.

*Hypotheses:* A is a product of copies of R/Z over an arbitrary set (for the vanishing into R, any compact Hausdorff abelian group, by the same proof). M is a discrete abelian group.

*Source:* CS, Theorem 4.3, p.25, with its proof, pp.26–27; Corollary 4.8, p.26; proof of Proposition 5.7, p.35.

*Prerequisites:* [VS2/breen-deligne-resolution](#breen-deligne-resolution), [VS2/condensed-cohomology](#condensed-cohomology), `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

<a id="solid-free-structure"></a>

**Solidity of profinite free solid groups.** For profinite S, the pinned Z[S]_solid is Hom(C(S,Z),Z), hence a product of copies of Z by Nöbeling’s theorem already in Mathlib. It is solid as a condensed group and as a complex. A profinite hypercover gives an exact augmented complex of these free solid objects. The pinned solidification map is an isomorphism for finite S.

*Hypotheses:* S is a profinite set. Nöbeling's theorem is the pinned Mathlib instance.

*Source:* CS, Corollary 5.5; Propositions 5.6–5.7, pp.34–35.

*Prerequisites:* `Condensed.profiniteSolid`, `Condensed.profiniteSolidification`, `LocallyConstant.freeOfProfinite`, [VS2/condensed-cohomology](#condensed-cohomology), [VS2/condensed-lca-rhom](#condensed-lca-rhom).

<a id="solid-abelian-groups"></a>

**The abelian category of solid groups.** Take the existing CondensedAb and its integer predicate CondensedMod.IsSolid. Define SolidAb as the full subcategory on that property. Prove that its fully faithful inclusion creates kernels, cokernels and all small limits and colimits, and that solid objects are closed under extensions. This makes SolidAb abelian. Products of discrete copies of ℤ are compact projective generators in this category. Use the site/cutoff comparison when transporting the source formulation.

*Hypotheses:* Solidity is the pinned predicate over the universe-lifted integers. Use the regular-cardinal/site comparison of the conventions above.

*Source:* CS, Theorem 5.8(i); proof in Lecture VI, pp.35–41.

*Prerequisites:* `CondensedAb`, `CondensedMod.IsSolid`, `CategoryTheory.ObjectProperty.FullSubcategory`, `CategoryTheory.ObjectProperty.ι`, [VS2/solid-free-structure](#solid-free-structure), [VS2/condensed-lca-rhom](#condensed-lca-rhom).

<a id="solidification"></a>

**Solidification as a reflection.** Construct the reflection L:CondensedAb→SolidAb as the colimit-preserving extension of the existing maps ℤ[S]→ℤ[S]_solid on profinite compact-projective generators. Its unit gives Hom(LA,B)≃Hom(A,iB) for solid B; its counit is invertible. On the common enhancement the inclusion D(SolidAb)→D(CondensedAb) is fully faithful, with image those complexes whose cohomology groups are solid. Its left adjoint is the left derived reflection L^L, which need not preserve concentration in degree zero.

*Hypotheses:* Solidity is the pinned predicate over the integers. The derived statements use the common enhancement.

*Source:* CS, Theorem 5.8; Lemmas 5.9–5.10; Theorem 6.2, pp.35–38,43.

*Prerequisites:* [VS2/solid-abelian-groups](#solid-abelian-groups), [VS2/solid-free-structure](#solid-free-structure), `CategoryTheory.Adjunction`, `DerivedCategory`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

<a id="derived-solid-tensor"></a>

**Solid tensor and internal Hom.** Equip SolidAb with the unique closed symmetric monoidal structure for which solidification is symmetric monoidal. Derive it on D(SolidAb) using the common enhancement, preserving colimits in each variable. The unit is discrete ℤ and the internal Hom satisfies the tensor-Hom adjunction, with its ambient condensed derived-Hom comparison. For sets I,J the solid tensor of ∏_I ℤ and ∏_J ℤ is ∏_(I×J) ℤ, also in the derived calculation. Derived solidification is monoidal.

*Hypotheses:* Solid abelian groups in the sense of the pinned predicate over the integers. The derived statements use the common enhancement.

*Source:* CS, Theorem 6.2; Proposition 6.3; Examples 6.4, pp.43–44.

*Prerequisites:* [VS2/solidification](#solidification), `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `SolidAb.mk` | An existing integer-solid condensed abelian group defines an object of SolidAb. |
| `SolidAb.underlying` | An object has its actual condensed group and proof of integer solidity. |
| `SolidAb.hom_ext` | Maps agree iff their underlying condensed-group maps agree. |
| `SolidAb.inclusionFullyFaithful` | The inclusion is fully faithful on the induced Hom groups. |
| `SolidAb.abelian` | SolidAb is abelian, and its inclusion creates kernels and cokernels. |
| `SolidAb.limits` | All small limits and colimits exist and are created by the inclusion. |
| `SolidAb.extensions` | In a short exact sequence in CondensedAb with solid end terms, the middle term is solid. |
| `SolidAb.generators` | The integer products form compact projective generators in SolidAb. |
| `solidification` | The reflection functor L:CondensedAb→SolidAb. |
| `solidificationAdjunction` | L is left adjoint to the actual full-subcategory inclusion. |
| `solidification_unit` | The unit A→iLA is universal for maps to solid objects. |
| `solidification_homEquiv` | Composition with the unit bijects Hom(LA,B) and Hom(A,iB). |
| `solidification_counit` | The counit LiB→B is an isomorphism for solid B. |
| `solidification_free` | On a profinite free group, iLZ[S] is canonically Z[S]_solid and its unit is the pinned solidification map. |
| `solidification_derived` | The derived reflection has image characterized by solid cohomology and agrees with left derived L. |
| `SolidTensor.tensor` | Solid tensor is the solidification of ambient condensed tensor; the derived tensor uses its left derived form. |
| `SolidTensor.unit` | The integer-solid Z is the tensor unit. |
| `SolidTensor.product` | Tensor of integer products is the product on the Cartesian index set. |
| `SolidTensor.hom` | Map(A⊗solid B,C)≃Map(A,RHomsolid(B,C)). |
| `SolidTensor.changeCoefficients` | Solid algebra scalar extension is derived solid tensor, with coherent identity/composition. |
| `SolidTensor.inclusionHom` | The derived internal Hom into a solid target agrees with the ambient condensed Hom in the source’s solid setting. |

**Examples and tests.**

- `SolidAb.zero`: The zero condensed group is integer-solid and gives the zero object of SolidAb.
- `SolidAb.freeProfinite`: The pinned integer profiniteSolid object is solid for every profinite set and lies in this category.
- `SolidAb.finiteSet`: For a finite profinite set S, the pinned solidification map Z[S]→Z[S]_solid is an isomorphism, hence the two free objects agree.
- `solidification_zero`: Solidification sends the zero condensed group to a zero solid group.
- `solidification_solid`: The unit of an integer-solid group is an isomorphism.
- `solidification_finite`: The unit of the free condensed group on a finite profinite set is an isomorphism.
- `SolidTensor.zero`: Zero tensored with any solid complex is zero.
- `SolidTensor.unit_test`: Z⊗solid A≃A with the unit constraints.
- `SolidTensor.different_primes`: For p≠ell, Z_p⊗solid Z_ell=0, distinguishing solid tensor from a naive algebraic tensor.

### VS2.2. Correct coefficient solidity and routed analytic applications

Use analytic measures when the coefficient field carries its nonarchimedean topology. For a discrete ring use the polynomial restriction tests for general ring solidity, and keep the underlying-integer-solid analytic structure separate. Analytic-stack gluing and localization are imported, then specialized to that structure.

<a id="general-ring-solidity"></a>

**Correct solidity for general discrete rings.** For a discrete ring R and M∈CondensedMod R, define general-ring solidity by testing every ring homomorphism ℤ[X]→R: the restricted module must satisfy the existing finite-type integer-algebra solidity predicate. Thus one tests every r∈R by sending X to r. For R finitely generated over ℤ this agrees with that existing predicate. For general R it is not replaced by inversion of all R-profinite-solid maps. This predicate does not supply analytic measures for an arbitrary condensed ring.

*Hypotheses:* R is a ring and M a condensed R-module. The test is over all ring maps Z[X]→R, using the pinned predicate over Z[X].

*Source:* CS, Lecture VII: Definition 7.1; Examples 7.3(iii)–(iv) with footnote 14; Proposition 7.8; Remark 7.9, pp.45–48; the docstring of CondensedMod.IsSolid in the pinned Mathlib/Condensed/Solid.lean.

*Prerequisites:* `CondensedMod`, `CondensedMod.IsSolid`, `ModuleCat.restrictScalars`, `CategoryTheory.sheafCompose`, `SolidAnalyticRings:SA.2`, `SolidAnalyticRings:SA.3`.

<a id="nonarchimedean-solid-coefficients"></a>

**Solid nonarchimedean coefficients.** Give a finite extension E/ℚ_p its p-adic condensed topology and imported analytic solid structure. The free complete object on S is E⊗solid_ℤ ℤ[S]_solid. Its complete modules form the abelian category Mod_E^solid, with closed solid tensor, derived internal Hom and analytic scalar extension. Taking the same abstract E as a discrete ring with underlying-integer solidity defines a different coefficient construction. The comparison with classical locally convex spaces belongs to the functional-analysis consumer.

*Hypotheses:* E is a finite extension of Q_p with its p-adic topology. The analytic ring formalism is imported from SolidAnalyticRings.

*Source:* BCGP, §2.2.1, pp.18–20, solid E-vector spaces.

*Prerequisites:* `SolidAnalyticRings:SA.2`, [VS2/derived-solid-tensor](#derived-solid-tensor), `SolidAnalyticRings:SA.4`.

<a id="z-solid-analytification"></a>

**Z-solid analytification of schemes.** For discrete commutative A define Mod_Zsolid(A) as the full subcategory of condensed A-modules whose underlying condensed integer group is solid. Specialize the imported analytic spectrum to AnSpec(A,Mod_Zsolid(A)), and glue these affine stacks along Zariski charts to obtain X↦X_tilde for schemes. The affine coefficient category is enhanced D(Mod_Zsolid(A)). Use the AnSpec and !-gluing interfaces of AnalyticStacks:AS.2–AS.3 and the compatible regular-cutoff/light-site coefficient comparison.

*Hypotheses:* A is a discrete commutative ring. AnSpec and gluing are imported from AnalyticStacks; analytic rings from SolidAnalyticRings.

*Source:* BCGP, Remark 2.4.1, pp.30–31.

*Prerequisites:* [VS2/solid-abelian-groups](#solid-abelian-groups), [VS2/derived-solid-tensor](#derived-solid-tensor), `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `SolidAnalyticRings:SA.2`, `AnalyticStacks:AS.2`, `AnalyticStacks:AS.3`.

<a id="principal-localization-and-formal-complement"></a>

**Analytic localization and formal complements.** For a discrete commutative A and f∈A, AnSpec(A[1/f],Mod_Zsolid(A[1/f]))→AnSpec(A,Mod_Zsolid(A)) is proper and behaves as a closed immersion in the analytic-stack formalism. Its open complement has module category the derived f-complete subcategory, characterized by lim_(multiplication by f) M=0. The latter limit is derived. For SL₂ over discrete E, the closed-cell analytic coefficient ring is E[[T⁻¹]] with derived T⁻¹-complete modules, whereas the big cell uses E[T] with underlying-Z solid modules.

*Hypotheses:* A is a discrete commutative ring and f∈A. Modules are condensed A-modules whose underlying group is solid. The analytic-stack formalism is imported from AnalyticStacks.

*Source:* BCGP, Remark 2.4.1; Example 2.4.2, pp.30–31.

*Prerequisites:* [VS2/z-solid-analytification](#z-solid-analytification), `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `AnalyticStacks:AS.2`, `AnalyticStacks:AS.3`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `condensedRestrict` | Restriction along R→S acts sectionwise and gives CondensedMod S→CondensedMod R. |
| `IsSolidGeneral.iff` | Corrected solidity is exactly the stated universal polynomial restriction criterion. |
| `IsSolidGeneral.restrict` | Restriction along a ring homomorphism preserves corrected solidity, by composing polynomial test maps. |
| `IsSolidGeneral.iso` | An isomorphism of condensed R-modules preserves the criterion. |
| `IsSolidGeneral.finiteType` | For finite-type Z-algebra R the corrected predicate agrees with the pinned finite-type predicate. |
| `SolidECoefficients.category` | The category is the analytic complete modules for topological E. |
| `SolidECoefficients.free` | Its free solid object on S is E⊗solid_Z Z[S]_solid. |
| `SolidECoefficients.tensorHom` | Derived tensor and internal Hom satisfy the closed adjunction. |
| `SolidECoefficients.scalarExtension` | Analytic coefficient extension along a continuous field embedding uses derived complete tensor with coherent identity/composition. |
| `SolidECoefficients.topological` | The underlying coefficient object is the condensed module for the p-adic topology of E; its inclusion respects the imported analytic measures. The classical locally convex comparison is an outgoing application. |
| `ZSolidAnalytification.modules` | Construct the actual full subcategory of condensed A-modules with underlying integer solidity. |
| `ZSolidAnalytification.affine` | AnSpec uses the pair (A,Mod_Zsolid(A)), including its analytic module data. |
| `ZSolidAnalytification.glue` | Affine Zariski gluing yields the scheme functor and coherent morphism composition. |
| `ZSolidAnalytification.pullback` | Module pullback is the derived Z-solid scalar extension. |
| `ZSolidAnalytification.affineCategory` | Quasi-coherent coefficients on the affine analytic stack are enhanced D(Mod_Zsolid(A)). |

**Examples and tests.**

- `IsSolidGeneral.integer`: For the universe-lifted integers the corrected predicate is equivalent to pinned integer solidity.
- `IsSolidGeneral.zero`: The zero condensed module satisfies every polynomial restriction test.
- `IsSolidGeneral.polynomial`: For R=Z[X], the identity ring map is one of the tests, so corrected solidity implies its pinned polynomial solidity.
- `SolidECoefficients.zero`: The zero topological vector space realizes the zero solid E-module.
- `SolidECoefficients.finite`: For finite S, the free object is E^S.
- `SolidECoefficients.smith`: For an infinite product, (product_I O_E)[1/p] consists of uniformly bounded denominators and differs from arbitrary product_I E; omitting analytic measures gives the wrong Smith generator.
- `ZSolidAnalytification.integer`: For A=Z the coefficient category is SolidAb with its actual inclusion.
- `ZSolidAnalytification.zero`: The zero ring has zero module category and empty analytic spectrum.
- `ZSolidAnalytification.discreteField`: For A=E taken discretely the definition tests underlying Z-solidity; replacing A by its p-adic condensed topology changes the construction.

### VS2.3. QCQS foundations and corrected affine condensed points

Work on the existing condensed-set sheaf site. Profinite tests define relative quasicompactness and the diagonal criterion. For a filtered colimit, first factor a profinite map into the product through one common finite stage. Representable affine points preserve the needed products and equalizers; arbitrary accessibility does not give descent.

<a id="qcqs-condensed-sets"></a>

**Quasicompact and quasiseparated condensed sets.** For X on the existing CondensedSet carrier, call X quasicompact if some profinite condensed set maps epimorphically to X. A morphism is quasicompact when its pullback to every profinite source is quasicompact. Define quasiseparatedness by quasicompactness of the diagonal, equivalently of S×X T for each pair of maps from profinite S,T. These are properties of a sheaf and its fibre products, rather than properties of its abstract point set.

*Hypotheses:* X is a condensed set, on the pinned carrier.

*Source:* PQ, Appendix A, opening discussion and Lemmas A.3–A.4, pp.88–90.

*Prerequisites:* `CondensedSet`, `Profinite`, `CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet`, `profiniteToCondensed`, `TopCat.toCondensedSet`.

<a id="condensed-epis-and-colimits"></a>

**Epimorphisms and quasiseparated colimits.** For a profinite condensed set S, evaluation at S commutes with filtered colimits because compact Hom and finite sheaf limits do. A condensed-set morphism surjective as a sheaf is an effective epimorphism. Filtered colimits of qcqs condensed sets along injections with quasicompact transition maps are quasiseparated. For quasiseparated X and profinite S, a morphism S→X is determined by its values on points; quasiseparated subobjects retain this point-detection property.

*Hypotheses:* In A.5 the diagram is filtered, its objects are quasi-compact and quasi-separated and its transition maps are quasi-compact injections. In A.7 the target is quasi-separated and the source profinite.

*Source:* PQ, Appendix A, Lemmas A.1–A.2,A.5–A.7, pp.88–90.

*Prerequisites:* [VS2/qcqs-condensed-sets](#qcqs-condensed-sets), `CondensedSet`, `CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet`.

<a id="affine-condensed-points"></a>

**Condensed affine points.** Given a commutative base ring R, an affine R-scheme Spec B and a condensed commutative R-algebra A, define the condensed points by S↦Hom_Ralg(B,A(S)) with the induced restrictions. This represented functor preserves limits, so the displayed presheaf already satisfies descent; sheafification gives the same object. Finite presentation gives its polynomial product/equalizer description and filtered-colimit compatibility. Accessibility alone for an arbitrary functor does not imply the products or equalizers required of a condensed set.

*Hypotheses:* R is a commutative ring, B a commutative R-algebra and A a condensed commutative R-algebra. The scheme is affine; no statement is made for arbitrary accessible functors.

*Source:* PQ, Appendix A.1, opening paragraph, p.90; Lemma A.8, p.91.

*Prerequisites:* `CondensedSet`, `Condensed`, [VS2/condensed-epis-and-colimits](#condensed-epis-and-colimits), [VS2/qcqs-condensed-sets](#qcqs-condensed-sets).

<a id="closed-affine-points-quasicompact"></a>

**Quasicompactness of closed affine points.** For a quasiseparated condensed commutative ring A and a closed immersion X→A_R^n, X(A)→A^n is a quasicompact monomorphism, hence X(A) is quasiseparated. With finitely many equations this is a pullback of a point along A^n→A^r. For arbitrarily many equations, on every profinite source the simultaneous zero set is an intersection of closed compact subsets, hence remains compact and represents the fibre. The finiteness of n is retained.

*Hypotheses:* R is a commutative ring and X→A^n_R a closed immersion, with n finite. A is a quasi-separated condensed R-algebra.

*Source:* PQ, Appendix A, Lemma A.8 and proof, p.91.

*Prerequisites:* [VS2/affine-condensed-points](#affine-condensed-points), [VS2/qcqs-condensed-sets](#qcqs-condensed-sets), [VS2/condensed-epis-and-colimits](#condensed-epis-and-colimits), `CompHaus`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `CondensedQCQS.quasicompact` | Quasicompactness is existence of a profinite epimorphic cover. |
| `CondensedQCQS.quasiseparated` | The diagonal condition is equivalent to quasicompact profinite-source fibre products. |
| `CondensedQCQS.baseChange` | Quasicompact maps are preserved by base change. |
| `CondensedQCQS.subobject` | A condensed subobject of a quasiseparated condensed set is quasiseparated. |
| `CondensedQCQS.profinite` | The pinned profinite realization satisfies both properties. |
| `AffineCondensedPoints.evaluate` | Sections are Hom_Ralg(B,A(S)) with their restriction maps. |
| `AffineCondensedPoints.sheaf` | The represented functor preserves the products and equalizers required by sheaf descent. |
| `AffineCondensedPoints.map` | Ring maps in B act contravariantly and maps in A covariantly, respecting identity/composition. |
| `AffineCondensedPoints.product` | Products of affine schemes give products of condensed points. |
| `AffineCondensedPoints.equations` | A polynomial presentation gives the equalizer defined by its equations. |
| `AffineCondensedPoints.accessible` | For finitely presented B the points functor commutes with filtered colimits of coefficient algebras. |

**Examples and tests.**

- `CondensedQCQS.empty`: The empty condensed set is qcqs.
- `CondensedQCQS.profinite_test`: Every profinite set has the identity profinite cover and qc diagonal.
- `CondensedQCQS.infiniteDiscrete`: An infinite discrete set is quasiseparated but is not quasicompact, since a continuous image of a compact set in a discrete set is finite.
- `AffineCondensedPoints.affineZero`: Affine zero-space is the terminal condensed set.
- `AffineCondensedPoints.affineLine`: Affine one-space has condensed points the underlying condensed set of A.
- `AffineCondensedPoints.polynomial`: For R[x₁,…,x_n] the points are A^n, preserving sheaf products; the constant two-element accessible functor fails even the empty-cover sheaf condition.

### VS2.4. Solid sheaf category, cutoff structure, four operations and relative homology

The free pro-étale chart objects define sheaf solidity. Constructible inverse-limit presentations establish the abelian and derived structure at compatible cutoffs, after which the four operations and their adjoints give relative homology. Keep the projection formula for homology separate from the stronger hypotheses needed for ordinary pushforward.

<a id="solid-sheaves-on-v-stacks"></a>

**Solid sheaves on small v-stacks.** For spatial X and a pro-étale map j:U→X presented as a cofiltered limit of qcqs étale j_i, set j♯ℤhat=lim_i j_i!ℤhat and use its tautological section over U. A pro-étale sheaf F is solid if Hom(j♯ℤhat,F)→F(U) is an isomorphism for every such chart. On a small v-stack test this on each spatial v-chart. Define D_solid(X,ℤhat^p) as the full enhanced subcategory with solid cohomology. For a solid algebra object Λ use its module category, keeping the underlying ℤhat^p-complex solid. This coefficient convention is distinct from an arbitrary analytic Λ-solid category.

*Hypotheses:* X is a spatial diamond for the sheaf-level definition, a small v-stack in general. Coefficients are Zhat, then a solid Zhat-algebra (a solid Zhat^p-algebra from VII.2 on).

*Source:* FS, Definition VII.1.1; Proposition VII.1.8; Definitions VII.1.9–VII.1.10 and VII.1.17; Remark VII.1.18, pp.245,249,252.

*Prerequisites:* [VS2/solid-abelian-groups](#solid-abelian-groups), [VS2/breen-deligne-resolution](#breen-deligne-resolution), `DiamondsAndVStacks:D6/etale-site-comparison`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E5:abstract/module-objects`.

<a id="solid-sheaf-structure-and-completion"></a>

**Solid sheaf structure and completion.** On spatial X solid Zhat-sheaves form an abelian full subcategory closed under all limits, colimits and extensions. Its finitely presented objects are exactly cofiltered limits of constructible torsion étale sheaves, forming their Pro-category; all solid sheaves form its Ind-category. Higher inverse limits of those torsion constructible systems vanish. Derived solidity is the derived Hom extension criterion; the derived inclusion is fully faithful and admits solidification with tensor-ideal kernel. Cutoffs supply the compatible presentable categories, without global presentability of the unrestricted site.

*Hypotheses:* X is a spatial diamond (a diamond for VII.1.15). Coefficients are Zhat.

*Source:* FS, Theorem VII.1.3; Question VII.1.4; Proposition VII.1.6; Propositions VII.1.12–VII.1.15, pp.245–251.

*Prerequisites:* [VS2/solid-sheaves-on-v-stacks](#solid-sheaves-on-v-stacks), [VS2/breen-deligne-resolution](#breen-deligne-resolution), [VS2/solidification](#solidification), `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `DiamondsAndVStacks:D6/etale-site-comparison`.

<a id="solid-four-operations"></a>

**Four operations for solid sheaves.** For every map f:Y→X of small v-stacks and solid Zhat^p-algebra Λ, f*, Rf*, closed derived solid tensor and internal RHom preserve the respective solid categories. Solid tensor is the solidification of ambient derived tensor. Internal Hom is already solid; pullback preserves it and tensor, and commutes with Rf* in arbitrary Cartesian base change in the solid formalism. For Λ=Zhat^p the solid tensor of two objects concentrated in degree 0 lies in degrees −1 and 0, and for finitely presented solid sheaves F=lim F_i and G=lim G_j it is the derived limit of the F_i⊗ᴸG_j. The formalism is constructed at adequate compatible cutoffs. Properness alone does not give the pushforward projection formula.

*Hypotheses:* f:Y→X is any map of small v-stacks. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Propositions VII.2.1–VII.2.4; Warning VII.2.5, pp.252–255.

*Prerequisites:* [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion), [VS2/derived-solid-tensor](#derived-solid-tensor), `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

<a id="relative-solid-homology"></a>

**Relative solid homology.** For any morphism f:Y→X of small v-stacks construct f♯ left adjoint to solid ordinary pullback. Require coherent composition and arbitrary Cartesian base change, the projection identity f♯(A⊗solid f*B)≃f♯A⊗solid B, and RHom(f♯A,B)≃Rf_*RHom(A,f*B). Coefficient extension and restriction have the associated adjoint-compatible comparisons. This construction applies to all small-v-stack maps, with the solid coefficient and cutoff hypotheses, rather than just the eligible maps supporting torsion exceptional operations.

*Hypotheses:* f:Y→X is any map of small v-stacks. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Proposition VII.3.1, pp.257–258.

*Prerequisites:* [VS2/solid-four-operations](#solid-four-operations), `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `SolidSheaf.free` | A qcqs pro-étale chart gives j♯ Zhat and a tautological section. |
| `SolidSheaf.criterion` | Sections extend uniquely to Hom from every free solid chart object. |
| `SolidSheaf.vLocal` | Solidity can be checked on a spatial v-cover. |
| `SolidSheaf.derived` | Derived solidity is equivalent to solidity of all cohomology sheaves. |
| `SolidSheaf.modules` | For Λ an algebra object, coefficients are Λ-module objects with solid underlying Zhat^p-complex. |
| `SolidSheaf.point` | On a geometric point the construction agrees with condensed solid modules in this coefficient convention. |
| `SolidOperations.pullback` | All small-v-stack maps have coherent solid pullbacks, respecting identity and composition. |
| `SolidOperations.pushforward` | Rf* is right adjoint to f*. |
| `SolidOperations.tensor` | Relative derived solid tensor is closed symmetric monoidal. |
| `SolidOperations.hom` | Map(A⊗solid B,C)≃Map(A,RHom(B,C)). |
| `SolidOperations.baseChange` | For every Cartesian square g*Rf*≃Rf′*g′* in the solid formalism. |
| `SolidOperations.homPullback` | g*RHom(A,B)≃RHom(g*A,g*B). |
| `SolidHomology.functor` | Construct f♯ for every map of small v-stacks. |
| `SolidHomology.adjunction` | Map(f♯A,B)≃Map(A,f*B). |
| `SolidHomology.id` | Identity homology is identity. |
| `SolidHomology.comp` | (fg)♯≃f♯g♯ with coherent associativity. |
| `SolidHomology.baseChange` | Cartesian base change gives g*f♯≃f′♯g′*. |
| `SolidHomology.projection` | f♯(A⊗solid f*B)≃f♯A⊗solid B. |
| `SolidHomology.coefficients` | Derived solid coefficient extension intertwines f♯, with restriction comparisons given by adjunction. |

**Examples and tests.**

- `SolidSheaf.zero`: The zero sheaf meets every extension test.
- `SolidSheaf.torsion`: Every étale Z/n-sheaf with n prime to p gives a solid sheaf.
- `SolidSheaf.etaleChart`: For a single qcqs étale j the free object is j! Zhat and the extension criterion reduces to the usual section adjunction.
- `SolidOperations.identity`: Identity pullback and pushforward are identity.
- `SolidOperations.point`: On a point solid tensor agrees with the condensed solid tensor.
- `SolidOperations.properProjectionFailure`: For the inclusion j of a point Spa C in a perfectoid ball over C, which is proper and quasi-pro-étale, the projection map for A=j♯Zhat^p and B=Zhat^p is j♯Zhat^p→Rj_*Zhat^p; on global sections its source is Zhat^p[-2] and its target Zhat^p, so it is not an isomorphism.
- `SolidHomology.empty`: Homology from the empty stack is the zero functor.
- `SolidHomology.identity`: Identity homology and its adjunction recover identity.
- `SolidHomology.etale`: For separated étale maps the torsion comparison gives the existing extension-by-zero functor.

### VS2.5. Generic naive and contravariant torsion–solid comparisons

Distinguish the naive covariant torsion realization from the contravariant solid dual of an overconvergent object. The finite Tor-amplitude condition belongs to the tensor comparison, and boundedness or finite cohomological dimension belongs to the pushforward comparison.

<a id="torsion-solid-comparisons"></a>

**Torsion embeddings into solid categories.** For Λ=Z/n with n prime to p, the naive D_et(X,Λ)→D_solid(X,Λ) is fully faithful, monoidal and pullback-compatible, with right adjoint R_Xet. It matches Rf* for qcqs f on bounded-below objects, or qcqs f of finite cohomological dimension. On overconvergent objects the solid dual A∨=RHom_solid(A,Λ) gives a fully faithful t-exact contravariant embedding with solid biduality and pullback compatibility. Its tensor comparison is an equivalence when one input has finite Tor amplitude. For proper spatial finite-dimensional f, (Rf*A)∨≃f♯A∨ on the overconvergent range.

*Hypotheses:* Λ=Z/n with n prime to p for the dual embedding; Λ discrete with nΛ=0 for the naive one. The dual embedding is on overconvergent objects; the tensor comparison needs finite Tor-amplitude of one factor. In VII.4.3, f is proper, representable in spatial diamonds, with dim.trg finite.

*Source:* FS, VII.4 opening comparison; Propositions VII.4.1–VII.4.3, pp.261–264.

*Prerequisites:* [VS2/solid-four-operations](#solid-four-operations), [VS2/relative-solid-homology](#relative-solid-homology), [VS2/breen-deligne-resolution](#breen-deligne-resolution), `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion).

### VS2.6. Generic geometric field-extension invariance and proper smooth solid duality

Geometric field-extension full faithfulness follows by reduction to the corresponding étale invariance statements. Proper smooth duality additionally uses finite dimension, the diagonal and the torsion comparison; properness alone is insufficient.

<a id="solid-geometric-base-change"></a>

**Solid geometric field-extension invariance.** For a small v-stack X and a solid Zhat^p-algebra Λ, solid pullback is fully faithful in each of three cases: (i) X is over an algebraically closed discrete field k of characteristic p and k′/k is an algebraically closed discrete extension; (ii) X is over such k and base change is to Spa(C,C⁺), with C/k complete algebraically closed nonarchimedean and C⁺ an open bounded valuation subring containing k; (iii) X is over Spa(C,C⁺), and base change is along a surjective map Spa(C′,C′⁺)→Spa(C,C⁺), with C′/C complete algebraically closed nonarchimedean and C′⁺ an open bounded valuation subring containing C⁺. The coefficient and site cutoffs must be compatible and large enough for these spaces.

*Hypotheses:* X is a small v-stack. Case (i): X over a discrete algebraically closed field k of characteristic p, k′/k discrete algebraically closed. Case (ii): X over k, C/k complete algebraically closed nonarchimedean, C⁺ an open bounded valuation subring containing k. Case (iii): X over Spa(C,C⁺), C′/C complete algebraically closed, C′⁺ containing C⁺, Spa(C′,C′⁺)→Spa(C,C⁺) surjective. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Proposition VII.2.6 and proof, pp.255–256.

*Prerequisites:* [VS2/solid-four-operations](#solid-four-operations), [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion), `DiamondEtaleCohomology:C6/invariance-discrete-extension`, `DiamondEtaleCohomology:C6/invariance-discrete-to-complete`, `DiamondEtaleCohomology:C6/invariance-complete-extension`.

<a id="proper-smooth-solid-poincare"></a>

**Proper smooth solid Poincaré duality.** For f:Y→X proper, representable in spatial diamonds, finite transcendence dimension and cohomologically smooth, Rf* has finite cohomological dimension, commutes with sums and satisfies the solid projection formula. It commutes with arbitrary base-change homology as in VII.3.4. If Δ is the relative diagonal and π₁ the first projection, Rπ₁*Δ♯Λ is invertible with inverse f!Λ=lim_n f!Z/n⊗solid_Zhat^p Λ. Consequently f♯A≃Rf*(A⊗solid f!Λ). All these conclusions retain both properness and smoothness.

*Hypotheses:* f:Y→X is a proper map of small v-stacks, representable in spatial diamonds, with dim.trg finite, and ell-cohomologically smooth for all relevant ell≠p. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Propositions VII.3.2–VII.3.5, pp.258–261.

*Prerequisites:* [VS2/relative-solid-homology](#relative-solid-homology), [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion), `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, [VS2/torsion-solid-comparisons](#torsion-solid-comparisons).

## Layer VS3: Lisse categories and completed ULA comparisons

The lisse subcategory is generated by smooth relative homology objects inside the solid category. Its coefficients use the relative-discrete convention fixed above. Completed ULA and constructible embeddings supply the geometric comparison input without changing the generic definitions of VS2. Establish that comparison input before using it in the lisse torsion/adic comparison.

### VS3.1. Preparatory completed ULA duality and constructible coefficient embedding

Construct these comparisons from the torsion ULA kernel identities and solid biduality. The first homology formula applies without properness in its eligible range; the second and the convolution transport require proper finite-dimensional spatial geometry. Composing Verdier and solid duality yields the covariant constructible embedding.

<a id="completed-ula-solid-duality"></a>

**Completed ULA and solid kernel duality.** For Λ=lim_n Z/n over a specified system of integers prime to p and eligible f:X→S, D_ULA(X/S,Λ) consists of derived-complete compatible torsion reductions that are f-ULA. Write A∨=RHom_solid(A,Λ). For A of bounded Tor amplitude, B∈D_et(X,Z/n), Proposition VII.5.2 gives f♯(D_X/S(A)∨⊗solid B)≃Rf_!(A_n⊗ᴸ B). If f is proper, representable in spatial diamonds and of finite transcendence dimension, then for every solid B, f♯(D_X/S(A)∨⊗solid B)≃Rf*RHom_solid(A∨,B). On proper spatial finite-dimensional finite-Tor kernels, A↦A∨ reverses 2-morphisms and transports !-convolution to ♯-convolution. In particular A∨ is right adjoint to D_X/S(A)∨ in the solid kernel category. Both solid duals and the properness hypothesis in the second formula are essential.

*Hypotheses:* Λ is a quotient of Zhat^p of the form lim_n Z/n over a set of integers prime to p. f:X→S is a compactifiable map of small v-stacks, representable in locally spatial diamonds, with locally finite dim.trg; proper and representable in spatial diamonds with dim.trg finite for VII.5.3–VII.5.4. A∈D_ULA(X/S,Λ) has bounded Tor-amplitude.

*Source:* FS, VII.5, Propositions VII.5.2–VII.5.3; Corollary VII.5.4, pp.264–268.

*Prerequisites:* [VS2/torsion-solid-comparisons](#torsion-solid-comparisons), [VS2/relative-solid-homology](#relative-solid-homology), [VS1/ula-dualizability-criterion](#ula-dualizability-criterion), [VS1/kernel-correspondence-category](#kernel-correspondence-category), `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`, [VS1/perfect-rhom-and-la-characterisation](#perfect-rhom-and-la-characterisation).

<a id="constructible-and-geometric-langlands-embedding"></a>

**Solid embedding of constructible coefficients.** For the analytification diamond X of a separated finite-type C-scheme over an algebraically closed nonarchimedean C and ell≠p, algebraic Verdier duality followed by solid duality yields a fully faithful covariant embedding D_c^b(X_alg,Z_ell)→D_ULA(X/Spa C,Z_ell)→D_solid(X,Z_ell). Its image consists of compact bounded objects with finitely presented solid cohomology, so it extends to Ind D_c^b(X_alg,Z_ell). The map sends i_*Z_ell at a C-point to i♯Z_ell and intertwines algebraic exceptional pullback with solid ordinary pullback. Thus the inverse limit of these scheme categories over finite-type charts X_alg→Y, with exceptional transition maps, embeds into D_solid(Y◇,Z_ell) as in Example VII.5.1(b), using separated charts and descent. Torsion analogues require finite Tor amplitude over Z/ell^m for the compact-image/Ind assertion; arbitrary bounded constructible torsion complexes are not asserted compact.

*Hypotheses:* C is a complete algebraically closed nonarchimedean field and ell≠p. X is the analytification of a separated scheme of finite type over C.

*Source:* FS, Example VII.5.1(a)–(b), pp.264–265.

*Prerequisites:* [VS2/torsion-solid-comparisons](#torsion-solid-comparisons), [VS3/completed-ula-solid-duality](#completed-ula-solid-duality), `EnhancedDerivedSheaves:E5:presentability/ind-completion`, [VS1/ula-analytification](#ula-analytification), `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`.

### VS3.2. Relative-discrete lisse category, adjoint projection and operations

Generate the lisse category under sums and stable operations, and glue its right adjoints at adequate cutoffs. Apply that projector to solid internal Hom and pushforward. The geometric-point test determines the intended relatively discrete category.

<a id="lisse-category-definition"></a>

**Lisse coefficient categories.** For an Artin v-stack X and the relative-discrete coefficient Λ of the conventions, define D_lis(X,Λ) as the smallest stable full subcategory of D_solid(X,Λ) closed under all sums and containing f♯Λ whenever f:Y→X is separated, representable in locally spatial diamonds and ℓ-cohomologically smooth. Do not add an absolute-diamond restriction on Y. The definition uses these smooth generators; it does not require locally constant perfect fibres.

*Hypotheses:* X is an Artin v-stack. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Definition VII.6.1; Proposition VII.6.2, pp.268–269.

*Prerequisites:* [VS0/artin-v-stack-definition](#artin-v-stack-definition), [VS2/relative-solid-homology](#relative-solid-homology), [VS2/solid-four-operations](#solid-four-operations), `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`.

<a id="lisse-adjoints-and-operations"></a>

**Lisse adjoints and operations.** Construct the right adjoint (−)_lis to the full lisse inclusion by compatible adjoints at sufficiently large cutoffs. Its kernel consists of solid objects whose sections vanish on every separated representable ℓ-smooth chart. For lisse A,B set RHom_lis(A,B)=(RHom_solid(A,B))_lis; for a map f use Rf_lis*=(Rf*)_lis. These are right adjoints to the restricted tensor and pullback. The construction uses cutoff presentability, without asserting presentability of the unrestricted solid category.

*Hypotheses:* X is an Artin v-stack. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Proposition VII.6.3 and subsequent constructions, p.269.

*Prerequisites:* [VS3/lisse-category-definition](#lisse-category-definition), [VS2/solid-four-operations](#solid-four-operations), `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `LisseCategory.generator` | Each permitted f gives the object f♯Λ of D_lis. |
| `LisseCategory.inclusion` | There is the actual full stable inclusion into D_solid. |
| `LisseCategory.localizing` | Objects form the smallest stable sum-closed full subcategory containing these generators. |
| `LisseCategory.tensor` | Solid tensor restricts to D_lis. |
| `LisseCategory.pullback` | Every Artin-v-stack pullback preserves D_lis, coherently for identity/composition. |
| `LisseCategory.point` | The geometric-point category identifies with D(Λ_disc) via relative-discrete realization. |
| `LisseOperations.projector` | Construct the right adjoint (−)_lis of the inclusion. |
| `LisseOperations.adjunction` | Map(iA,B)≃Map(A,B_lis). |
| `LisseOperations.counit` | The counit iA_lis→A is an isomorphism when A is lisse. |
| `LisseOperations.kernel` | The chart-section vanishing criterion describes the kernel. |
| `LisseOperations.internalHom` | RHom_lis is right adjoint to the lisse tensor. |
| `LisseOperations.pushforward` | Rf_lis* is right adjoint to lisse pullback, with coherent composition. |

**Examples and tests.**

- `LisseCategory.empty`: The empty stack has zero lisse category.
- `LisseCategory.point_test`: A geometric point yields the full derived category of relatively discrete coefficients.
- `LisseCategory.infiniteSum`: On a point an infinite direct sum of Λ is lisse and need not be perfect; replacing D_lis by D_lc would fail this test.
- `LisseOperations.zero`: Projection, internal Hom into zero and pushforward of zero give zero.
- `LisseOperations.point`: The point projector recovers the relatively discrete component and fixes D(Λ_disc).
- `LisseOperations.identity`: Identity lisse pushforward is identity with the original unit/counit.

### VS3.3. Torsion, adic and rational comparisons and coefficient change

Use the completed ULA comparison below before the torsion/adic comparisons in this section. Scalar extension sends a smooth generator to the corresponding generator over the new ring; only derived-complete objects are detected by all ℓ-power reductions.

<a id="lisse-comparisons"></a>

**Discrete and torsion lisse comparisons.** For any condensed ring A with underlying A(point), derived relative-discrete extension D(A(point))→D(A) is fully faithful. For a geometric point C, D_lis(Spa C,Λ)≃D(Λ_disc). If Λ is killed by a power of ell, D_lis(X,Λ) is contained in the naive image of D_et(X,Λ). Equality requires a separated ell-smooth atlas U→X whose étale site has a basis of bounded ell-cohomological dimension. Completed torsion/adically complete comparisons use compatible reductions; rational lisse coefficients are the constructed Λ_disc[1/ell] coefficient category.

*Hypotheses:* X is an Artin v-stack; C is a complete algebraically closed nonarchimedean field. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras). For VII.6.6, Λ is killed by a power of ell.

*Source:* FS, Propositions VII.6.4–VII.6.6, pp.269–270.

*Prerequisites:* [VS3/lisse-category-definition](#lisse-category-definition), [VS2/torsion-solid-comparisons](#torsion-solid-comparisons), [VS3/completed-ula-solid-duality](#completed-ula-solid-duality), [VS2/proper-smooth-solid-poincare](#proper-smooth-solid-poincare), `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`.

<a id="lisse-coefficient-change"></a>

**Lisse scalar extension and completion.** For a map of discrete Z_ell-algebras Λ_disc→Λ′_disc, derived solid scalar extension carries each lisse generator f♯Λ to f♯Λ′ and hence preserves D_lis, with coherent identity/composition and compatibility with pullback and homology. Reduction and rational localization use this construction. Detection by all ell-power reductions is restricted to derived ell-complete objects and uses the owner’s completion criterion; no detection is claimed for arbitrary rational objects.

*Hypotheses:* Λ_disc→Λ′_disc is a map of discrete Z_ell-algebras, ell≠p. Detection by reductions is asserted only for derived ell-complete objects.

*Source:* FS, VII.6, coefficient convention before Definition VII.6.1, p.268; proof of Proposition VII.6.3, p.269; Proposition VII.3.1(ii), pp.257–258.

*Prerequisites:* [VS3/lisse-category-definition](#lisse-category-definition), [VS2/relative-solid-homology](#relative-solid-homology), `AdicCoefficientsAndComparisons:L0/reduction-detects-equivalences`, `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`.

### VS3.4. Point localization in the precise acyclic-neighborhood setup

The localization is proved in the specified acyclic-neighborhood situation. The closed geometric point contributes the relatively discrete derived category, while homology extends the complement. The neighborhood hypothesis is part of the statement.

<a id="lisse-point-semiorthogonal-decomposition"></a>

**Lisse decomposition at a geometric point.** Let X be locally spatial and Z=Spa C a representable closed geometric-point subdiamond, with C algebraically closed nonarchimedean. Assume Z is a cofiltered intersection of qcqs open neighborhoods V with RΓ(V,F_ell)≃F_ell. For j:X\Z→X, D_lis(X,Λ) has the semiorthogonal decomposition into j♯D_lis(X\Z,Λ) and D_lis(Z,Λ)≃D(Λ_disc), with the source’s localization triangle. Arbitrary solid stratifications are not asserted to have this decomposition.

*Hypotheses:* X is a locally spatial diamond with a closed point giving Z=Spa C, C an algebraically closed nonarchimedean field. Z is a cofiltered intersection of qcqs open neighbourhoods V with RΓ(V,F_ell)≅F_ell. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Proposition VII.6.7, pp.270–271.

*Prerequisites:* [VS3/lisse-adjoints-and-operations](#lisse-adjoints-and-operations), [VS3/lisse-comparisons](#lisse-comparisons), [VS2/relative-solid-homology](#relative-solid-homology).

## Layer VS4: Classifying stacks, Newton strata and compact generation

Apply the coefficient categories to the geometry imported from BunGAndNewtonStrata. Retain the full automorphism v-group on a nonbasic stratum and remove its connected kernel only through the coefficient-invariance theorem. The contracting chart and the partial-support theorem provide localization and compact generators. Solid divisor descent and solid annular support use both the generic solid theory and the geometric constructions of VS0–VS1.

### VS4.1. Solid Drinfeld descent and partial-support construction/vanishing

Divisor descent is a solid application of the Weil torsor and geometric invariance. The annular support construction now assumes proper finite-dimensional spatial geometry. Its vanishing is the restricted pullback theorem, with a bounded-below or smoothness hypothesis.

<a id="solid-geometric-base-change-and-drinfeld"></a>

**Solid Drinfeld descent.** Fix an algebraically closed field k over F_q and the divisor-to-Weil map ψ:Div¹→[*/W_E]. For a small v-stack X over k and a solid Zhat^p-algebra Λ at compatible adequate cutoffs, ψ_X* : D_solid(X×[*/W_E],Λ)→D_solid(X×Div¹,Λ) is fully faithful. It is an equivalence if the separate geometric pullback D_solid(X,Λ)→D_solid(X×Spd Ē,Λ) is an equivalence, where Ē is the completed algebraic closure used in the Weil-torsor presentation. For each finite index set I, the corresponding product pullback ψ_X^I* is fully faithful.

*Hypotheses:* k is an algebraically closed field over F_q; X is a small v-stack over k; I is a finite set. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Corollaries VII.2.7–VII.2.8, p.256.

*Prerequisites:* [VS2/solid-geometric-base-change](#solid-geometric-base-change), [VS2/solid-four-operations](#solid-four-operations), [VS1/divisor-weil-map](#divisor-weil-map), [VS1/drinfeld-pullback](#drinfeld-pullback).

<a id="solid-partial-support"></a>

**Solid partial compact support.** Assume X is spatial and proper over Spd k, k algebraically closed of characteristic p, with finite transcendence dimension, and S spatial. The same annular systems as in VS0 define Rβ_!+C=colim_a Rβ_*j_a!(C|U_a) and Rβ_!−C=colim_b Rβ_*j_b!(C|U_b) with solid coefficients. Here j_! is the left adjoint of open pullback. Keep the two ends and counit transitions fixed; cofinal annular presentations yield equivalent functors.

*Hypotheses:* k is an algebraically closed field over F_q. X is a spatial diamond with X→Spd k proper and dim.trg finite; S is a spatial diamond. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Definition VII.2.9, p.256.

*Prerequisites:* [VS0/partial-compact-support](#partial-compact-support), [VS2/solid-four-operations](#solid-four-operations), [VS2/relative-solid-homology](#relative-solid-homology).

<a id="solid-partial-supported-vanishing"></a>

**Solid partial-support vanishing.** Under the proper finite-dimensional spatial X and spatial S hypotheses of VII.2.9, let α:X×k S→X and C=α*A. If A is bounded below, or X→Spd k is cohomologically smooth, then Rβ_!+C=0=Rβ_!−C in solid coefficients. This is the restricted solid theorem: it does not claim IV.5.3’s arbitrary exterior-product input for all solid complexes.

*Hypotheses:* The setup of Definition VII.2.9. C=α*A with A∈D_solid(X,Λ). Either A is bounded below or X→Spd k is cohomologically smooth. Λ is a solid Zhat^p-algebra; categories are formed at compatible, sufficiently large cutoffs.

*Source:* FS, Theorem VII.2.10, pp.256–257.

*Prerequisites:* [VS4/solid-partial-support](#solid-partial-support), [VS0/partial-compactly-supported-vanishing](#partial-compactly-supported-vanishing), [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion), `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `SolidPartialSupport.plus` | The plus end is the a-indexed supported pushforward colimit. |
| `SolidPartialSupport.minus` | The minus end is the b-indexed supported pushforward colimit. |
| `SolidPartialSupport.transition` | Annular inclusions give the specified extension-by-zero counit transitions. |
| `SolidPartialSupport.cofinal` | Cofinal replacements induce canonical equivalences. |
| `SolidPartialSupport.baseChange` | The solid supported colimits commute with the permitted base changes of this setup. |

**Examples and tests.**

- `SolidPartialSupport.zero`: Both end functors send zero to zero.
- `SolidPartialSupport.empty`: If X is empty both functors are zero.
- `SolidPartialSupport.torsion`: On torsion pullback coefficients the resulting vanishing agrees with IV.5 after the solid comparison.
- `SolidPartialSupport.properBand`: In the VII.2.9 setup, let S=Spa(C,O_C) and suppose a section i:S→X×k S of β is a proper closed immersion contained in a finite annular band. For the nonzero solid coefficient unit Λ, both end functors send i_*Λ to Λ. Extension by zero is eventually constant on this support and β∘i=id, so the zero functor fails this test.

### VS4.2. Continuous classifying-stack equivalence and connected-kernel invariance

Torsor descent identifies classifying-stack coefficients with the imported enhanced smooth representation category. Positive and negative Banach–Colmez torsors give full faithfulness; the additional unit-homology calculation for the connected kernels gives the lisse stratum equivalence.

<a id="classifying-stack-equivalence"></a>

**Sheaves and smooth representations.** For H locally pro-p and a ring Λ killed by an integer prime to p, there is a symmetric monoidal equivalence D_sm(H,Λ)≃D_et([*/H],Λ). Pullback along *→[*/H] is forgetting the action; structural pushforward is derived continuous invariants and internal RHom(−,Λ) is the imported derived smooth dual. The same category is obtained on [Spa C/H] for complete algebraically closed C/k. In particular D_et(*,Λ)=D(Λ). Smooth representation categories and their enhancement are imported from SR.

*Hypotheses:* G is a locally pro-p group. Λ is a ring killed by an integer n prime to p. C is a complete algebraically closed nonarchimedean field over k.

*Source:* FS, Theorem V.1.1; Lemmas V.1.2–V.1.3; Corollary V.1.4, pp.168–171.

*Prerequisites:* `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `TauCeti.SmoothDiscreteTopRep`, `TauCeti.IsSmoothDiscrete`, `DiamondsAndVStacks:D6/etale-site-comparison`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

<a id="contractibility-of-connected-banach-colmez-torsors"></a>

**Banach–Colmez torsor invariance.** For a torsor f:S′→S under BC(E) with E everywhere strictly positive, or under BC(E[1]) with E everywhere strictly negative, torsion étale pullback f* is fully faithful. This is invariance of Hom, not essential surjectivity for every torsor. The solid/lisse homology of the connected-kernel fibres used in VII.7.1 is the tensor unit.

*Hypotheses:* f:S′→S is a torsor under BC(E), E everywhere of positive slopes, or under BC(E[1]), E everywhere of negative slopes. Λ is a ring killed by an integer n prime to p. The solid statement is for the fibres occurring in VII.7.1.

*Source:* FS, Proposition V.2.1, p.171; proof of Proposition VII.7.1, p.271.

*Prerequisites:* `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`, `VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`, `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-composition`, `DiamondSixOperations:S4/smooth-stable-under-base-change`, `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`, [VS2/relative-solid-homology](#relative-solid-homology), [VS3/completed-ula-solid-duality](#completed-ula-solid-duality), [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion).

<a id="strata-are-classifying-stacks"></a>

**Coefficients on Newton strata.** Import Bun_G^b≃[*/tildeJ_b] and its split projection to [*/J_b(E)] with positive Banach–Colmez kernel from BG3. Pullback gives D_et(Bun_G^b,Λ)≃D_sm(J_b(E),Λ) for prime-to-p torsion coefficients. For the relative-discrete Z_ell-algebra convention of VS3 the corresponding D_lis equivalences hold, also after base change to Spa C. The connected kernel is retained in the geometry; its sheaf invariance is proved here rather than replacing the nonbasic stack by a locally profinite classifying stack.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. b∈B(G). Torsion statement: Λ is a ring killed by an integer n prime to p. Lisse statement: ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Proposition V.2.2; Proposition VII.7.1, pp.172,271–272.

*Prerequisites:* [VS4/classifying-stack-equivalence](#classifying-stack-equivalence), [VS4/contractibility-of-connected-banach-colmez-torsors](#contractibility-of-connected-banach-colmez-torsors), [VS3/lisse-comparisons](#lisse-comparisons), [VS2/solid-geometric-base-change](#solid-geometric-base-change), [VS2/relative-solid-homology](#relative-solid-homology), `BunGAndNewtonStrata:BG3/stratum-is-classifying-stack`, `BunGAndNewtonStrata:BG3/full-automorphism-v-group`, `BunGAndNewtonStrata:BG3/positive-automorphism-kernel`, `SmoothRepresentationsOfLocalGroups:SR.2`.

### VS4.3. Strict chart cohomology, formal-neighborhood comparison and stratum extension

The contracting action on the framed chart reduces torsion sections to the origin. Exact pro-p invariants then identify the quotient-chart sections. In lisse coefficients combine the bundle chart homology with its stratum pullback to construct the left adjoint.

<a id="strict-locality-of-the-chart"></a>

**Strict locality of the bundle chart.** For the framed chart tildeM_b imported from BG4 and torsion A, RΓ(tildeM_b,A)→A_origin is an isomorphism, and sections commute with all sums. For open pro-p K⊂J_b(E), RΓ(tildeM_b/K,A)≃RΓ([*/K],A_origin), hence exact K-invariants. The punctured absolute chart is spatial finite-dimensional, while its Spa C-base-change need not be quasicompact. The localization/gluing formula identifies the boundary stalk of Rj*A with sections on the punctured chart. The formal-scheme instance of V.4.3 uses its I-adic special-fibre setup.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. b∈B(G), K⊂G_b(E) an open pro-p subgroup; the charts are imported from BunGAndNewtonStrata. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Proposition V.4.2; Remarks V.4.3 and V.4.5; Corollary V.4.4, pp.178–179.

*Prerequisites:* [VS0/partial-compactly-supported-vanishing](#partial-compactly-supported-vanishing), `BunGAndNewtonStrata:BG4/section-and-spatial-complement`, `BunGAndNewtonStrata:BG4/contracting-chart-action`, `BunGAndNewtonStrata:BG4/chart-over-classifying-stack`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`.

<a id="lisse-stratum-left-adjoint"></a>

**Lisse stratum extension.** Import the bundle chart π_b:M_b→Bun_G and q_b:M_b→[*/J_b(E)] and the lisse stratum equivalence. For i_b:Bun_G^b→Bun_G define L_b=π_b♯q_b*. It is a fully faithful left adjoint to i_b*, with invertible unit M→i_b*L_bM. This chart-based extension produces the lisse compact generators and the Bernstein–Zelevinsky pairing. Its definition does not assert an ordinary torsion i_b! on every solid object.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. b∈B(G), with the chart π_b:M_b→Bun_G and q_b:M_b→[*/G_b(E)] imported from BunGAndNewtonStrata. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Proposition VII.7.2, pp.272–273.

*Prerequisites:* [VS4/strata-are-classifying-stacks](#strata-are-classifying-stacks), [VS4/solid-partial-supported-vanishing](#solid-partial-supported-vanishing), [VS3/lisse-point-semiorthogonal-decomposition](#lisse-point-semiorthogonal-decomposition), [VS2/relative-solid-homology](#relative-solid-homology), `BunGAndNewtonStrata:BG4/filtered-bundle-chart`, `BunGAndNewtonStrata:BG4/chart-to-bun-g`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `LisseStratumExtension.functor` | Define L_b by the composite π_b♯q_b*. |
| `LisseStratumExtension.adjunction` | Map(L_bM,A)≃Map(M,i_b*A). |
| `LisseStratumExtension.unit` | i_b*L_bM≃M with the adjunction unit. |
| `LisseStratumExtension.counit` | L_bi_b*A→A gives the chart-based localization transformation. |
| `LisseStratumExtension.compact` | L_b carries compact smooth representations to compact lisse objects. |
| `LisseStratumExtension.coefficients` | Derived scalar extension commutes with L_b through homology and chart pullback. |

**Examples and tests.**

- `LisseStratumExtension.zero`: L_b sends zero to zero.
- `LisseStratumExtension.induction`: For c-Ind_K Λ its image is the generator f_K♯Λ.
- `LisseStratumExtension.basic`: On an open basic stratum L_b agrees with lisse open extension by homology.

### VS4.4. HN localization, geometric invariance, compact generators and finite support

Order the finite HN pieces of a quasicompact open and use their restriction/extension adjunctions. Handle arbitrary opens through compatible quasicompact exhaustions. Compact induction on each stratum supplies compact generators; finite HN support is part of the compactness criterion.

<a id="hn-localization-and-geometric-invariance"></a>

**HN localization and geometric invariance.** For qc open U⊂Bun_G the finite HN stratification gives a semiorthogonal decomposition of its lisse category into D_sm(J_b(E),Λ); each stratum piece uses L_b and its restriction adjunction. For arbitrary open U the Spa C-base-change functor is an equivalence, by a justified qc open exhaustion. In torsion coefficients the equivalence holds for any locally closed U as in V.2.3. The infinite stratification is expressed by these compatible exhaustions, not an unspecified infinite direct product.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. C is a complete algebraically closed nonarchimedean field over k. Torsion statement: Λ is a ring killed by an integer n prime to p. Lisse statement: ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Corollary V.2.3; Proposition VII.7.3, pp.172,273.

*Prerequisites:* [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), [VS4/strata-are-classifying-stacks](#strata-are-classifying-stacks), [VS2/solid-geometric-base-change](#solid-geometric-base-change), [VS3/lisse-point-semiorthogonal-decomposition](#lisse-point-semiorthogonal-decomposition), `BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin`, `BunGAndNewtonStrata:BG4/chart-to-bun-g`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`.

<a id="compact-generation-and-compact-objects"></a>

**Compact generation of Bun_G coefficients.** Torsion D_et(U,Λ), for locally closed U⊂Bun_G, and lisse D_lis(Bun_G,Λ) are compactly generated. An object is compact iff only finitely many HN restrictions are nonzero and every restriction is compact in D_sm(J_b(E),Λ), equivalently in the thick subcategory generated by the imported c-Ind_K Λ for open pro-p K. Torsion generators are Rf_K!f_K!Λ, and lisse generators are f_K♯Λ. The compactness proof includes finite cohomological dimension and sum preservation of the punctured chart’s solid sections.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Torsion statements: Λ is a ring killed by an integer n prime to p. Lisse statements: ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Theorem V.4.1; Proposition VII.7.4; Lemma VII.7.5, pp.177–179,273–274.

*Prerequisites:* [VS4/strict-locality-of-the-chart](#strict-locality-of-the-chart), [VS4/hn-localization-and-geometric-invariance](#hn-localization-and-geometric-invariance), [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), [VS4/solid-partial-supported-vanishing](#solid-partial-supported-vanishing), [VS2/solid-sheaf-structure-and-completion](#solid-sheaf-structure-and-completion), `BunGAndNewtonStrata:BG4/section-and-spatial-complement`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, [VS0/partial-compactly-supported-vanishing](#partial-compactly-supported-vanishing).

## Layer VS5: Duality, admissibility and products on Bun_G

Use compact generation and the stratum extension adjunction to represent the homology pairing by Bernstein–Zelevinsky duals. Keep the canonical homology adjunction separate from a Haar-dependent trivialization of the torsion dualizing object. Torsion and lisse ULA are characterized by perfection of the full derived invariant complex, with categorical Künneth and coefficient-change interfaces for the Hecke consumers.

### VS5.1. Torsion homology/Haar dualizing object, BZ and Verdier reflexivity

The torsion homology pairing on compact objects is representable. Chart generators and their normalized compact inductions verify involutivity. Verdier exchange then gives the stratumwise reflexivity test, using the full derived invariant complex.

<a id="torsion-bun-homology-and-haar-dualizing"></a>

**Bun_G torsion homology and dualizing normalization.** For π:Bun_G→*, the torsion smooth-stack operation defines π♯A=Rπ_!(A⊗π!Λ), left adjoint to π*. The dualizing object π!Λ is locally Λ[0]. Choosing Haar measures on J_b(E) for the basic strata trivializes it globally, giving π!Λ≃Λ and π♯≃Rπ_!. The homology adjunction is canonical; the displayed trivialization depends on these choices and is not an arbitrary extension of eligible ECD Rπ_!.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Λ is a ring killed by an integer n prime to p.

*Source:* FS, V.5 preceding Theorem V.5.1, with footnote 3, p.180; first paragraph of the proof, p.181.

*Prerequisites:* [VS0/shriek-pullback-for-smooth-stacky-maps](#shriek-pullback-for-smooth-stacky-maps), [VS4/compact-generation-and-compact-objects](#compact-generation-and-compact-objects), `BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin`, `SmoothRepresentationsOfLocalGroups:SR.2`.

<a id="bernstein-zelevinsky-duality"></a>

**Torsion Bernstein–Zelevinsky duality.** For compact A∈D_et(Bun_G,Λ) with prime-to-p torsion coefficients, construct the unique compact representative D_BZ A of B↦π♯(A⊗B): RHom(D_BZ A,B)≃π♯(A⊗B), naturally in B. Representability gives contravariant functoriality. Prove that it is an autoequivalence of compact objects with D_BZ²≃id, preserves open support, and on an open basic stratum agrees with the imported derived smooth Bernstein–Zelevinsky involution.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Λ is a ring killed by an integer n prime to p. A is a compact object.

*Source:* FS, Theorem V.5.1, pp.180–181.

*Prerequisites:* [VS5/torsion-bun-homology-and-haar-dualizing](#torsion-bun-homology-and-haar-dualizing), [VS4/compact-generation-and-compact-objects](#compact-generation-and-compact-objects), [VS4/strict-locality-of-the-chart](#strict-locality-of-the-chart), [VS0/partial-compactly-supported-vanishing](#partial-compactly-supported-vanishing), `SmoothRepresentationsOfLocalGroups:SR.2`.

<a id="verdier-biduality-and-reflexivity"></a>

**Torsion Verdier exchange and reflexivity.** For open j:V→U between open Bun_G substacks and every torsion A∈D_et(V,Λ), j!RHom(A,Λ)≃RHom(Rj*A,Λ). With D_U=π_U!Λ, an object is Verdier-reflexive iff for every stratum b in U and every open pro-p K⊂J_b(E), the full derived K-invariants complex is reflexive in D(Λ). The biduality map is the canonical evaluation; the condition is not separate finite-dimensionality in each degree.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Λ is a ring killed by an integer n prime to p. j:V→U is an open immersion of open substacks of Bun_G.

*Source:* FS, Theorems V.6.1–V.6.2; Lemma V.6.3, pp.182–183.

*Prerequisites:* [VS5/bernstein-zelevinsky-duality](#bernstein-zelevinsky-duality), [VS5/torsion-bun-homology-and-haar-dualizing](#torsion-bun-homology-and-haar-dualizing), [VS4/hn-localization-and-geometric-invariance](#hn-localization-and-geometric-invariance), [VS4/classifying-stack-equivalence](#classifying-stack-equivalence), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `BunTorsionHomology.functor` | The normalized smooth-stack homology is left adjoint to π*. |
| `BunTorsionHomology.adjunction` | Map(π♯A,M)≃Map(A,π*M). |
| `BunTorsionHomology.dualizing` | π!Λ is the degree-zero invertible local system. |
| `BunTorsionHomology.haar` | Chosen Haar measures induce the global trivialization and the comparison with Rπ_!. |
| `BunTorsionHomology.projection` | π♯(A⊗π*M)≃π♯A⊗M in the allowed smooth-stack class. |
| `TorsionBZ.object` | Assign the compact representative D_BZ A. |
| `TorsionBZ.pairing` | RHom(D_BZ A,B)≃π♯(A⊗B), naturally in B. |
| `TorsionBZ.map` | A morphism A→A′ induces D_BZ A′→D_BZ A with contravariant identity/composition. |
| `TorsionBZ.bidual` | The canonical D_BZ²A→A is an equivalence. |
| `TorsionBZ.openSupport` | Open support is preserved. |
| `TorsionBZ.basic` | On a basic stratum this is the imported derived smooth Bernstein–Zelevinsky involution. |

**Examples and tests.**

- `BunTorsionHomology.zero`: Zero has zero homology.
- `BunTorsionHomology.trivialGroup`: For G=1 the Bun_G homology is identity on D(Λ).
- `BunTorsionHomology.measureChange`: Scaling a selected Haar measure by a unit scales the chosen trivialization; the underlying adjunction is unchanged.
- `TorsionBZ.zero`: D_BZ of zero is zero.
- `TorsionBZ.trivialGroup`: For G=1 and perfect coefficients the representative is the ordinary derived coefficient dual.
- `TorsionBZ.induction`: A normalized stratum compact induction dualizes to its chart generator, as in V.5.1.

### VS5.2. Torsion ULA, perfect invariant admissibility and Künneth

Prove the exterior-product Hom comparison on compact induction generators and extend it by compact generation. The ULA comparison is then detected stratum by stratum by perfect pro-p invariants. The product of categories here is the presentable stable categorical tensor product.

<a id="torsion-kunneth"></a>

**Bun_G torsion Künneth formula.** For reductive G₁,G₂ over E, Bun_(G₁×G₂)=Bun_G₁×Bun_G₂. Exterior products of compact torsion objects are compact generators, and for compact A_i and arbitrary B_i, RHom(A₁,B₁)⊗ᴸ_Λ RHom(A₂,B₂)≃RHom(A₁⊠A₂,B₁⊠B₂). Consequently the Λ-linear presentable stable categorical tensor product of the two categories is D_et(Bun_(G₁×G₂),Λ), with the categorical tensor input imported from EDS.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. G=G_1×G_2 with G_1,G_2 reductive over E. Λ is a ring killed by an integer n prime to p. A_1,A_2 are compact.

*Source:* FS, Proposition V.7.2; Remark V.7.3, pp.183–184.

*Prerequisites:* [VS4/compact-generation-and-compact-objects](#compact-generation-and-compact-objects), [VS4/strict-locality-of-the-chart](#strict-locality-of-the-chart), `EnhancedDerivedSheaves:E5:presentability`, `BunGAndNewtonStrata:BG4/filtered-bundle-chart`, `SmoothRepresentationsOfLocalGroups:SR.2`.

<a id="ula-equals-admissibility"></a>

**Torsion ULA and perfect invariants.** For A∈D_et(Bun_G,Λ) with prime-to-p torsion coefficients, A is ULA for Bun_G→* iff every restriction M_b has perfect derived K-invariants over Λ for every open pro-p K⊂J_b(E). This characterizes admissibility of complexes by perfection, including bounded Tor amplitude.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Λ is a ring killed by an integer n prime to p.

*Source:* FS, Theorem V.7.1, pp.183–185.

*Prerequisites:* [VS1/smooth-ula-criterion](#smooth-ula-criterion), [VS5/torsion-kunneth](#torsion-kunneth), [VS5/bernstein-zelevinsky-duality](#bernstein-zelevinsky-duality), [VS4/strata-are-classifying-stacks](#strata-are-classifying-stacks), `SmoothRepresentationsOfLocalGroups:SR.2`.

### VS5.3. Integral/rational lisse duality, Künneth and perfect invariant ULA

Repeat the compact homology-pairing construction with solid tensor and the lisse adjoints. Define lisse Bun_G ULA by its explicit product comparison, and identify it with perfect derived invariants. Verdier exchange is the asserted lisse duality statement; no lisse reflexivity theorem is added.

<a id="lisse-bernstein-zelevinsky-duality"></a>

**Lisse Bernstein–Zelevinsky duality.** For compact A∈D_lis(Bun_G,Λ) in the relative-discrete coefficient convention, represent the solid homology pairing by a unique compact D_BZ,lis A, with RHom(D_BZ,lis A,B)≃π♯(A⊗solid B) for every lisse B. Give this construction its contravariant functoriality and bidual equivalence on compact objects. It preserves open support and agrees with the derived smooth Bernstein–Zelevinsky involution on basic strata, for both integral and rational coefficients.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras). A is a compact object.

*Source:* FS, Proposition VII.7.6, pp.274–275.

*Prerequisites:* [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), [VS4/compact-generation-and-compact-objects](#compact-generation-and-compact-objects), [VS4/solid-partial-supported-vanishing](#solid-partial-supported-vanishing), [VS2/relative-solid-homology](#relative-solid-homology), [VS3/lisse-adjoints-and-operations](#lisse-adjoints-and-operations), `SmoothRepresentationsOfLocalGroups:SR.2`.

<a id="lisse-verdier-exchange"></a>

**Lisse Verdier exchange.** For open j:V→U of open Bun_G substacks and all A∈D_lis(V,Λ), j♯RHom_lis(A,Λ)≃RHom_lis(Rj_lis*A,Λ). The opposite exchange follows from adjunction.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras). j:V→U is an open immersion of open substacks of Bun_G.

*Source:* FS, Proposition VII.7.7, p.275; Theorem V.6.1 and proof, p.182.

*Prerequisites:* [VS5/lisse-bernstein-zelevinsky-duality](#lisse-bernstein-zelevinsky-duality), [VS3/lisse-adjoints-and-operations](#lisse-adjoints-and-operations), [VS4/hn-localization-and-geometric-invariance](#hn-localization-and-geometric-invariance), [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), [VS4/strata-are-classifying-stacks](#strata-are-classifying-stacks).

<a id="lisse-kunneth"></a>

**Lisse Bun_G Künneth formula.** For reductive G₁,G₂ over E, the lisse exterior product for Bun_(G₁×G₂) carries compact pairs to compact objects that generate the lisse category. For compact A_i and arbitrary lisse B_i, RHom(A₁,B₁)⊗ᴸ_Λ RHom(A₂,B₂)≃RHom(A₁⊠A₂,B₁⊠B₂). The target of the compactness statement is D_lis in both the integral and rational coefficient ranges.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. G=G_1×G_2 with G_1,G_2 reductive over E. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras). A_1,A_2 are compact.

*Source:* FS, Proposition VII.7.10, p.276.

*Prerequisites:* [VS4/compact-generation-and-compact-objects](#compact-generation-and-compact-objects), [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), [VS5/torsion-kunneth](#torsion-kunneth), [VS3/lisse-adjoints-and-operations](#lisse-adjoints-and-operations), `SmoothRepresentationsOfLocalGroups:SR.2`.

<a id="lisse-ula-definition"></a>

**ULA for lisse Bun_G sheaves.** For A∈D_lis(Bun_G,Λ), define ULA for Bun_G→* by requiring the canonical map p₁*RHom_lis(A,Λ)⊗solid p₂*A→RHom_lis(p₁*A,p₂*A) on Bun_G×Bun_G to be invertible. This explicit definition uses the lisse internal Hom and the two projections. It does not assume a general definition of lisse ULA on every Artin morphism.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Definition VII.7.8, p.275.

*Prerequisites:* [VS3/lisse-category-definition](#lisse-category-definition), [VS3/lisse-adjoints-and-operations](#lisse-adjoints-and-operations), [VS1/smooth-ula-criterion](#smooth-ula-criterion).

<a id="lisse-ula-equals-admissibility"></a>

**Lisse ULA and perfect invariants.** For A∈D_lis(Bun_G,Λ), the VII.7.8 comparison is invertible iff, on every HN stratum b, the corresponding smooth representation complex M_b has perfect derived K-invariants over Λ_disc for every open pro-p K⊂J_b(E). This applies to discrete Z_ell-algebras and their rational localizations interpreted relatively discretely.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. ell≠p; Λ=Z_ell⊗_(Z_ell,disc)Λ_disc for a discrete Z_ell-algebra Λ_disc (this includes Q_ell-algebras).

*Source:* FS, Proposition VII.7.9, pp.275–276.

*Prerequisites:* [VS5/lisse-ula-definition](#lisse-ula-definition), [VS5/lisse-kunneth](#lisse-kunneth), [VS5/lisse-bernstein-zelevinsky-duality](#lisse-bernstein-zelevinsky-duality), [VS4/strata-are-classifying-stacks](#strata-are-classifying-stacks), [VS4/lisse-stratum-left-adjoint](#lisse-stratum-left-adjoint), `SmoothRepresentationsOfLocalGroups:SR.2`.

**API.** Give the constructions in this section the following interfaces, with the hypotheses of their definitions.

| Name | Required statement |
| --- | --- |
| `LisseBZ.object` | Assign the unique compact representative D_BZ,lis A. |
| `LisseBZ.pairing` | RHom(D_BZ,lis A,B)≃π♯(A⊗solid B). |
| `LisseBZ.map` | The representative is contravariantly functorial with coherent identity/composition. |
| `LisseBZ.bidual` | D_BZ,lis²≃id on compact lisse objects. |
| `LisseBZ.openSupport` | The functor preserves open support. |
| `LisseBZ.basic` | The basic-stratum comparison is the imported smooth BZ involution. |
| `IsLisseBunULA.map` | There is the canonical dualizability comparison on the product stack. |
| `IsLisseBunULA.iff` | The predicate means that this map is invertible. |
| `IsLisseBunULA.iso` | The predicate is invariant under isomorphism in D_lis. |
| `IsLisseBunULA.torsion` | In the torsion comparison range it agrees with the smooth Artin ULA tensor-Hom criterion. |
| `IsLisseBunULA.perfectConstant` | Constant sheaves of perfect Λ-complexes satisfy the criterion. |

**Examples and tests.**

- `LisseBZ.zero`: The zero compact object is fixed.
- `LisseBZ.rationalPoint`: For G=1 and Λ=Q_ell, compact objects are perfect coefficient complexes and the representative is their derived dual.
- `LisseBZ.induction`: The chart generator f_K♯Λ dualizes to the appropriately normalized stratum compact induction.
- `IsLisseBunULA.zero`: The zero sheaf is ULA.
- `IsLisseBunULA.trivialGroup`: For G=1, lisse ULA is perfection of a derived Λ-complex.
- `IsLisseBunULA.infiniteVectorSpace`: For G=1 over Q_ell, an infinite direct sum of the field is lisse but not ULA.

### VS5.4. Scalar extension and the Hecke consumer contract

The lisse exterior product respects compact generators. Derived scalar extension preserves the duality and ULA comparisons, including nonflat coefficient maps. Export these compatibilities to the existing Hecke-kernel constructions.

<a id="duality-and-admissibility-coefficient-change"></a>

**Coefficient change for duality and admissibility.** For any map Λ_disc→Λ′_disc, derived solid scalar extension commutes with compact lisse Bernstein–Zelevinsky duality and preserves lisse ULA, equivalently perfect-invariant admissibility. For ULA objects it also identifies the lisse internal dual with the scalar extension of the original dual. Use derived tensor for nonflat maps. These are preservation statements. Their Hecke duality and coefficient-change applications use GeometricSatakeAndHeckeOperators:HS1.

*Hypotheses:* E is a nonarchimedean local field with residue field F_q, G is a reductive group over E, and k is an algebraically closed field over F_q; everything is over Perf_k. Λ_disc→Λ′_disc is a map of discrete Z_ell-algebras, ell≠p. The converse requires faithfully flat perfect-complex descent with a uniform finite Tor-amplitude bound and is not a target of this coefficient-change statement.

*Source:* FS, Proposition VII.3.1(ii), pp.257–258; Propositions VII.7.4, VII.7.6 and VII.7.9, pp.273–276; consumer: Theorem IX.2.2 and proof, pp.322–323.

*Prerequisites:* [VS3/lisse-coefficient-change](#lisse-coefficient-change), [VS5/lisse-ula-equals-admissibility](#lisse-ula-equals-admissibility), [VS5/lisse-bernstein-zelevinsky-duality](#lisse-bernstein-zelevinsky-duality), `SmoothRepresentationsOfLocalGroups:SR.2`, `EnhancedDerivedSheaves:E4/perfect-coefficient-change`.
