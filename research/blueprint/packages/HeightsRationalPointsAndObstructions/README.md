# Roadmap: heights, rational points and obstructions

**Summary.** Build the Weil height machine and canonical heights on projective varieties and abelian varieties, then combine finite Kummer descent with heights to obtain Mordell–Weil. Construct adelic point spaces, the Brauer–Manin pairing and torsor descent. Develop Parshin covers, integral-point finiteness, Mordell–Lang, Manin–Mumford and Bogomolov, and assemble their consequences for curves by genus. The foundations are Mathlib's heights, quotient modules, descent theorem and restricted products, Tau Ceti's abelian varieties and elliptic heights, and the scheme, Picard, class-field and duality contracts stated below.

## Scope and ownership

This roadmap owns height classes on arbitrary point sets; relative geometric Weil heights; the general Tate limit and abelian Néron–Tate heights; bounded point metrics and local Weil functions; heights in abelian families and over polarized function fields; abelian Kummer local conditions and Mordell–Weil; the trace and Lang–Néron; adelic points of separated finite-type schemes; the Brauer–Manin pairing; arithmetic torsor evaluation and descent sets; Parshin covers and rational/integral-point finiteness; subvariety stabilizers, Ueno loci, finite-rank intersections and small points. Numerical descent and obstruction calculations are applications of these interfaces.

The following foundations are consumed at their existing owners. Each boundary includes the compatibility checks needed here.

- **Mathlib** owns admissible absolute values, tuple and fixed-field projective heights, scalar Northcott, quotient modules, abstract height descent and restricted products. **DiophantineApproximationAndTranscendence**, §§0.2–0.3, owns absolute scalar and tuple heights and Northcott with bounded degree while the field varies. The projectivized and generalized-global-field variants here specify their scaling and coordinate-field conditions.
- **TauCetiRoadmap.ReductiveGroupsPartII**, §§RG2.0.1 and RG2.0.3, owns the evaluation topology on arbitrary algebra-map point sets, presentation embeddings, coefficient-ring functoriality and local scheme-point topology. Write `Points_R(A,B)=A →ₐ[R] B` with this topology. Its hypotheses include T1 coefficients for closed solution sets, finite type for open coefficient-ring embeddings, and local coefficient rings with open units and continuous inversion for scheme charts. These interfaces apply to arbitrary affine algebras, not only group schemes. The finite-type affine point space is locally compact over Hausdorff locally compact coefficients. Its integral-point theorem makes X₀(O_v) compact and open for affine finite-type models over a compact-open valuation ring; the model-spanning and almost-all-place comparison below are additional arithmetic assertions. Their checks give ℤ[X]-points over ℝ the topology of ℝ, give the zero algebra no point over a nonzero field, and give Laurent-polynomial points over the adeles the units topology with both the value and its inverse, rather than the adele subspace topology.
- **TauCetiRoadmap.EllipticCurves**, Layers 5–7, owns pointed twists, elliptic canonical heights, explicit elliptic two-descent, elliptic Mordell–Weil and the general discrete-module Selmer-structure interface. The abelian variants here specify their Kummer local conditions. On an elliptic curve the height of the divisor `(O)` is the native `canonicalHeight`, obtained from one half of the naive x-height. The unhalved polarization here is twice the native `neronTatePairing`.
- **SchemeAndStackFoundations**, §2.22, owns Azumaya base change, the scheme Brauer group and its pullback. The affine evaluation used here is that pullback followed by `brauer_field`, rather than a second evaluation construction. A matrix algebra evaluates to zero; the scalar algebra has degree one; the Hamilton quaternion algebra over ℝ gives the nonzero order-two class, which becomes zero over ℂ. Tensor product adds classes, opposite algebra negates them, constant classes restrict from the ground field, and evaluation commutes with field extension and scheme pullback. These checks apply equally on affine and non-affine schemes.
- The same §2.22 owns henselian-local Brauer specialization. Over a complete DVR with finite residue field, `Br(O)=Br(κ)=0`; an Azumaya algebra splits as `End_O(P)`, and the projective module P is free of positive finite rank. Thus its generic-fibre class is zero. For `O=ℤₚ`, matrices give the split case. The finite-residue-field hypothesis matters: the constant Hamilton algebra over `ℝ[[t]]` remains nonsplit. Base-changing an Azumaya algebra along `ℤ→ℤₚ` preserves the native criterion; the zero-rank algebra over a field fails its faithfulness condition.
- **JacobianChallenge**, Layer F, owns the Abel–Jacobi morphism and its closed-immersion theorem for a smooth projective geometrically connected curve of genus at least one with a chosen degree-one Picard class. The degree-one class trivializes the Pic¹ torsor; its Brauer obstruction need not vanish merely because it is a rational point of the Picard scheme. The genus-one map is an isomorphism, a genus-two hyperelliptic curve embeds in its Jacobian, and a genus-zero curve is excluded. A closed immersion identifies C(K) with its image's K-points, so finiteness and finite-rank intersection theorems transfer through it.
- **AbelianSchemesAndArithmeticModuli**, §§A6.3–A6.5, owns abelian subvarieties, images and Poincaré complements. Layer 5 here uses that carrier to construct positive-dimensional quotients and subvariety geometry. Its §A3.3 finite-subgroup quotient alone does not supply a quotient by an abelian subvariety of positive dimension.
- **ClassFieldTheory**, Layers 5, 10 and 13, owns local invariants, global Brauer reciprocity and the cyclic Hasse norm theorem. **GlobalQuadraticForms**, Layer 5, owns Hasse–Minkowski; the conic application uses its ternary case.
- **ArithmeticGaloisDuality**, Layers R02.3–R02.4, owns restricted-ramification finite H¹ over number fields and Poitou–Tate duality for tori. **NeronModelsAndSemistableAbelianVarieties**, §§1.1, 1.8 and 5.1, supplies the Néron mapping property, good-reduction models and Néron–Ogg–Shafarevich. The general smooth formal identity chart is a separate contract below.

Arithmetic intersections of adelic metrized line bundles of arbitrary dimension belong to **ArakelovGeometryAndAbelianHeights, Part II**. The point-metric interface in Layer 0 supplies neither those intersections nor arithmetic Hilbert–Samuel or successive minima. **ArithmeticDynamics** imports the Tate limit and owns its dynamical applications; **AdelicAlgebraicGroups** imports the general adelic-point construction and owns group approximation. **EffectiveDiophantineMethods** owns certified enumeration and computable local solvers. **GrossZagierAndArithmeticHeights** owns the arithmetic intersection comparison for Jacobians and imports the geometric heights here. **FaltingsFinitenessAndIsogenyTheorems** and **MordellLawrenceVenkatesh** consume the Parshin construction and rational-point conclusion. Their higher-tier finiteness theorems are not prerequisites of the unconditional Vojta–Bombieri route.

## Conventions

All scheme-valued statements use schemes over the indicated field and morphisms over that field. A variety is separated and of finite type; hypotheses such as projectivity, geometric integrality, smoothness or characteristic zero are stated at the claim. A closed irreducible subvariety is nonempty and reduced. Picard-scheme rational points, descended line bundles and rational divisors are distinguished by the Picard–Brauer obstruction.

For functions on a type X, `[h]` denotes the real module quotient by uniformly bounded functions on all of X, using the top filter. It has no pointwise evaluation and no multiplication induced from functions: `[1]=[0]`, whereas `[n·1]≠[n·0]` on ℕ. Native `Northcott h` means every real sublevel set is finite; native `Filter.TendstoCofinite f` means f has finite fibres.

For a generalized global field K, the relative height h_K retains the base-field weight. On a finite extension L/K it scales by `[L:K]`; over a number field the absolute height is `h_K/[K:ℚ]`. At complex places use the ordinary complex absolute value with multiplicity two, rather than its square as a norm satisfying the usual triangle inequality. For example `h_ℚ([2:1])=log 2`, `h_{ℚ(i)}([2:1])=2 log 2`, and the absolute value remains `log 2`. Every projective tuple is nonzero. Degree bounds use the field generated by coordinate ratios, so rescaling does not change the degree.

The canonical height attached to a symmetric bundle satisfies `ĥ(2P)=4ĥ(P)`; that of an antisymmetric bundle satisfies `ĥ(2P)=2ĥ(P)`. For a general L put `L⁺=L⊗[-1]*L` and `L⁻=L⊗([-1]*L)⁻¹` and take one half of the sum of their canonical heights. Thus `L⁺⊗L⁻=L²`; there is no assumed rational square-root decomposition of L. Our symmetric pairing is `b(P,Q)=ĥ(P+Q)−ĥ(P)−ĥ(Q)`, so `b(P,P)=2ĥ(P)`. The Euclidean norm used in angle statements uses `b/2`, with `‖P‖²=ĥ(P)`; rescaling this norm changes numerical thresholds.

For a local field F, `ord_F(ϖ)=1` and the module absolute value is `|a|_F=q_F^(−ord_F(a))`. For F/ℚₚ it is the `[F:ℚₚ]` power of the extension of the normalized ℚₚ norm. In an unramified quadratic extension of ℚ₂, `|2|_F=1/4`, so an elliptic curve with full rational two-torsion has a multiplication-by-two quotient of order sixteen, not eight. All logarithm radii are strict: `r>e/(p−1)`.

Kummer sequences are fppf sequences. Their Galois formulation requires the kernel to be étale; for multiplication by n this requires n prime to the field characteristic. Galois modules carry the discrete topology, including the geometric points of an abelian variety. The n=0 quotient is excluded from weak Mordell–Weil.

Use additive notation for Brauer classes and values in ℚ/ℤ; the field carrier is `Additive (TauCeti.BrauerGroup F)`, so native multiplication, inverse and one transport to addition, negation and zero. The class of a split algebra is zero, opposite algebra is negation, and the Hamilton class at a real place has invariant `1/2`. At complex places the invariant is zero. Local invariants satisfy `inv_v(cor_{L_w/K_v} β)=inv_w(β)`; restriction multiplies the invariant by `[L_w:K_v]`. Finite-support sums always include the archimedean places. Statements about continuity concern each fixed Brauer class; no discreteness of an infinite simultaneous evaluation group is assumed.

Twist by the inverse class: for a commutative group `[Z^τ]=[Z]−π*τ`. A fibre of class a lifts to the τ-twist exactly when a=τ. In ℚ×/ℚ×² the μ₂-fibre `u²=2` lifts to the twist `2w²=2` through w=1. For a cyclic group of order three, a=τ=1 gives `1−1=0`, while the opposite sign gives 2. Harpaz–Wittenberg's parameter is `σ=−τ`, and the residual functional satisfies `ε_τ=ε₀+⟨−,τ⟩`: if `ε₀(a)=1/3` and `⟨a,τ⟩=1/3`, the new value is `2/3`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` for the representative Lean signatures. The native declarations consumed by individual targets are named at those targets. The principal contracts are:

- `Filter.boundedFilterSubmodule`, `Filter.BoundedAtFilter`, `Asymptotics.isBigO_top`, native `Submodule.mkQ`, `liftQ` and `mapQ`: uniformly bounded real functions form the submodule used in the height-class quotient, with its linear projection and descent universal property.
- `Height.AdmissibleAbsValues`, `Height.logHeight`, `logHeight₁`, `totalWeight`, `Projectivization.logHeight`: finite support and the product formula, scalar and tuple height laws, and invariance under projective scaling. `Height.logHeight₁_add_le` has the additive error `log 2 * totalWeight K`; dividing by the positive total weight gives `log 2` for the absolute height.
- `NumberField.absLogHeight₁` is an absolute scalar height. `NumberField.finite_setOfPred_mulHeight₁_le` supplies scalar Northcott inside a fixed number field. Homogeneous-polynomial upper and lower height inequalities supply the fixed-field morphism estimates; the general line-bundle height machine remains a target here.
- `Northcott` and `Filter.TendstoCofinite`, together with `AddCommGroup.fg_of_descent'` and the additive form of `Monoid.finite_set_isOfFiniteOrder_of_descent`, supply the abstract finite-index/height descent step. They require their growth and finiteness hypotheses, rather than a height name alone.
- Mathlib `RestrictedProduct` and its topology provide the restricted-product carrier. Tau Ceti's discrete, closed number-field diagonal and Mathlib's number-field adele ring supply the arithmetic ambient space. Current Tau Ceti supplies `NumberField.AdeleRing.instLocallyCompactSpace` in `TauCeti/NumberTheory/NumberField/Global/Adeles/LocallyCompact.lean`, assuming Dedekind integers, fraction-field structure and finite residue fields. Its finite-adele module supplies compact-open completion integers. General finite-type point-space local compactness is the ReductiveGroupsPartII boundary above.
- Tau Ceti `AlgebraicGeometry.AbelianVariety`, its native point groups and native `LineBundleClass`, and Mathlib's scalar extension, tensor products and finite-dimensional rational vector spaces supply the existing carriers. The Lean `AbelianVariety.Points` abbreviation is a native over-category hom-set; it is not a new rational-point construction.
- Native `IsAzumaya` includes finite generation, projectivity and faithfulness, with the bijectivity of `AlgHom.mulLeftRight`. Mathlib `BrauerGroup` is a field carrier. Tau Ceti supplies its group structure, `BrauerGroup.mk`, `BrauerGroup.baseChange`, finite-field vanishing and real quaternion classification. For rings and schemes use SchemeAndStackFoundations §2.22, not the field carrier with its field hypothesis removed.
- Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`, its torsion kernel and `neronTatePairing` supply the elliptic normalization checks; they are not general abelian canonical heights.

### From TauCetiRoadmap foundations

[ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md), Layer 5, supplies additive `inv_v:Br(K_v)→ℚ/ℤ`, an isomorphism at finite places, with images `{0,1/2}` at real places and zero at complex places. It supplies cyclic-algebra norm detection and restriction/corestriction compatibility. Layer 10 supplies finite support of restricted global classes, injectivity `Br(K)→⊕_v Br(K_v)`, reciprocity `Σ_v inv_v(res_v β)=0`, and `H³(K,𝔾_m)=0`. Layer 13 supplies `cyclicHasseNorm` for cyclic extensions of number fields. These are three distinct inputs: a single missing local invariant is forced to vanish by reciprocity, then the cyclic norm theorem gives a global norm.

[EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md), Layer 7, supplies the Selmer structure on a finite discrete Galois module with specified local subgroups, the global cohomology carrier and restriction maps, and the Weil–Châtelet/Sha interfaces. Instantiate it with the isogeny kernel and Kummer local images; do not give its general constructor a second owner. Its Layer 5 pointed-twist group is `Aut(E,O)`, whereas the marked genus-one torsor classification uses H¹(K,E).

[JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md), Layer F, supplies the Abel–Jacobi universal property and closed immersion. [GlobalQuadraticForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md), Layer 5, supplies the local-global isotropy theorem for nonsingular ternary quadratic forms over number fields.

### From SchemeAndStackFoundations

Use the following specific interfaces of [SchemeAndStackFoundations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md):

- §§0.8–0.9: spreading out finite-presentation schemes, morphisms and finitely presented algebraic data through filtered limits, with eventual validity of isomorphisms and finite-presentation properties. Apply this to integral models and Azumaya algebras.
- §§1.13–1.17 and 2.3: group schemes, fppf torsors, contracted products, inner forms, the twisting bijection and H¹ classification. For a finite-flat isogeny, the kernel action identifies `A×ker φ` with `A×_B A`; in the étale formulation the degree is invertible. A point stabilizer in a groupoid is not the stabilizer of a closed subscheme under all translations.
- §§2.11, 2.15 and 2.22: the invertible-n Kummer sequence, Hochschild–Serre, scheme/Azumaya Brauer classes, pullback, field comparison, henselian-local specialization, and the constant-unit low-degree exact sequence. That sequence includes `Pic(X̄)^G→Br(k)`; constant classes form an image, not necessarily an injective copy of Br(k). Its stated regular-injectivity theorem is affine, and its cohomological comparison is for regular affine schemes of dimension at most two.
- §§3.1–3.4: genus and its base change, separable Riemann–Hurwitz, Riemann–Roch and Picard geometry. §§3.6–3.7: Pic^d torsors, their Brauer obstruction, and the high-degree Abel morphism. For d≥2g−1 its geometric fibres are projective spaces of dimension d−g. A global projective-bundle description requires a split Picard gerbe or Poincaré bundle; a rational Picard class alone does not supply one.
- §4.13: normalization and smooth projective models of curves over perfect fields. This curve statement supplies neither good reduction nor compactification of an arbitrary-dimensional variety.
- §§5.1–5.6 and 5.12: Chow groups, proper pushforward, flat pullback, first-Chern intersections, projective-bundle and Segre rules, projection formula and Bézout. The pushforward of a generically finite cycle includes its field degree, including inseparable degree. These are geometric intersection inputs, not Brauer reciprocity on CH₀.

### From the abelian, reduction and duality roadmaps

[AbelianSchemesAndArithmeticModuli](../AbelianSchemesAndArithmeticModuli/README.md), §A1.4, supplies rigidified relative seesaw over a reduced base when fibre restrictions are trivial. §A1.5 supplies the rigidified cube and `[n]*L=L^{n(n+1)/2}⊗([-1]*L)^{n(n−1)/2}`, hence n² for symmetric L and n for antisymmetric L. §§A2.2–A2.3 supply the Poincaré bundle, dual abelian scheme and Mumford map. §§A2.7–A2.8 supply positive ample intersections and projective presentations over normal bases; projective normality remains a hypothesis in quartic duplication. §§A3.1–A3.2 supply finite-flat isogenies and invertible-n torsion. §A5.1 supplies complex uniformization. §§A6.3–A6.5 supply abelian images and Poincaré complements; §A6.7 supplies finite-rank Hom groups but not a bounded-degree Hom-scheme quotient by constant trace.

[NeronModelsAndSemistableAbelianVarieties](../NeronModelsAndSemistableAbelianVarieties/README.md), §§1.1 and 1.8, supplies the Néron mapping property and the identification of a good-reduction abelian scheme with its Néron model; §5.1 supplies Néron–Ogg–Shafarevich. The elliptic equation filtration in §2.6 and equation/good-reduction comparison in §6.5 are specializations, not general smooth formal charts or arbitrary-genus curve model comparisons.

[ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md), Layer R02.3, supplies `RestrictedRamification.finite_unramifiedOutside_of_finrank_le` for bounded-degree number-field extensions unramified outside a fixed finite S, and `RestrictedRamification.finite_H1_galoisGroupS` for every finite discrete G_{K,S}-module over a number field. Unramified local H¹ is residue-field H¹, and for a finite module it is the Frobenius coinvariant group. Layer R02.4 supplies the perfect torus pairing `Ш²(K,T̂)×Ш¹(K,T)→ℚ/ℤ` with the sign convention used here.

[StableReductionAndModuliOfCurves](../StableReductionAndModuliOfCurves/README.md), Layer 2, supplies ampleness and relative curve cohomology: smooth proper geometrically connected families have locally constant genus, and geometric Riemann–Roch/vanishing computes the Abel fibres. Its ample-line-bundle interface is used for projective presentations, while SchemeAndStackFoundations supplies geometric cycles and projections.

[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md), §§0.2–0.3, supplies bounded-degree scalar Northcott; §2.8 supplies `absoluteSubspaceTheoremForSystems` for number-field, place-dependent independent linear forms with its local weights and determinant normalization. The rational p-adic and S-unit specializations in §2.3 alone are insufficient for Siegel over an arbitrary number field.

### Additional contracts for the geometric and arithmetic routes

The following are required inputs to the indicated routes. Their hypotheses and strength are part of the build; the narrower foundation cited above does not imply them. **Unresolved prerequisites:** except where an earlier target or a precise supplier is identified, these paragraphs specify obligations whose proof targets and owners remain missing. In particular they do not certify a complete route to Mordell, equidistribution, finite-rank Mordell–Lang or genus-one Brauer sufficiency.

For **positive-dimensional quotients and stabilizers**, represent G/H as a separated finite-type scheme for a finite-type group G over a field and a closed subgroup H, with faithfully flat projection, `G×H≃G×_{G/H}G`, invariant-map universal property and base-change law. If H is normal give its group structure. For an abelian subvariety B⊆A, prove A/B smooth, proper and geometrically connected with kernel B. For a closed subscheme X⊆A, represent the functor `T↦{a:t_a(X_T)=X_T}` as a closed subgroup with base change; in characteristic zero its identity component is an abelian subvariety and X descends to A/Stab⁰(X). Algebraic-space representability and finite-subgroup quotients do not by themselves supply these scheme assertions (Conrad, *K/k-trace*, §3, Theorem 3.7, p.6; Gao–Ge–Kühne, §2 and §7, pp.8–11,43–44).

For **projective presentations and metrics**, every line bundle L on a projective variety must admit `L=M⊗N⁻¹` with M,N globally generated by finite ground-field families. Compare presentations on patches where one generator has maximal absolute value using no-common-zero polynomial relations with finitely many coefficients. Those relations must give uniform geometric local log-ratio bounds with a summable weighted family; a global height bound alone does not give the local estimates. Ample bundles have very ample powers, finite pullback preserves ampleness, and top ample intersection degrees of nonempty integral subvarieties are positive. For an abelian scheme over a normal integral locally noetherian base S, a bundle generically trivial must be pulled back from S; reduced-base seesaw without this generic-trivial descent hypothesis is insufficient (de Jong, §14, pp.7–9; Dimitrov–Gao–Habegger, Remark 3.2 and Appendix A, pp.14,36–40).

For **Brauer comparison and purity**, an ample line bundle on X gives the Gabber–de Jong isomorphism `Br_Az(X)≃H²_ét(X,𝔾_m)_tors`; apply it to regular quasi-projective varieties, with naturality. For regular integral noetherian X require injectivity into Br(k(X)) and equality with the intersection over codimension-one local rings, with residue and specialization maps. In characteristic zero require arbitrary-dimensional smooth proper compactification and comparison of two such compactifications to identify all-valuations unramified classes. Require geometric étale simple connectedness, Picard and `H²(μ_n)` Lefschetz for smooth complete intersections of dimension at least three, compatibly with Kummer, and Brauer reciprocity on a proper curve: evaluation/corestriction annihilates a principal divisor. The geometric Chow projection formula does not supply the last assertion (Poonen, Corollary 6.6.19, p.192; §6.7 and §8.2; Česnavičius, Theorems 1.1–1.2, pp.1–2).

For **local analytic points**, the smooth commutative group model over a complete DVR must have a g-dimensional integral formal group at its identity and a topological, functorial identification of its maximal-ideal points with the reduction kernel. Deep ideal balls are open in the local point group. Apply this to the smooth Néron model even at bad reduction. For good-reduction Jacobians require compatibility of divisor and Abel–Jacobi specialization. Local constancy of evaluation of a fixed Brauer class on a local-field variety requires the analytic/étale lifting comparison as well as henselian Brauer specialization (Katz, Appendix, Lemma′ and proof, pp.501–502; Poonen, Proposition 8.2.9, pp.230–231).

For **Lang–Néron and global function fields**, require bounded-degree Hom/Albanese components modulo constant trace, and prime-to-characteristic finite étale H¹ finiteness on a smooth curve, before any positive-definiteness or height-kernel argument. ArithmeticGaloisDuality §R02.4.5 supplies restricted-ramification H¹ finiteness for finite prime-to-characteristic modules over a global function field with a nonempty finite ramification set. The model-based adelic direct limit and the reduction of a proper smooth-affine-group torsor to this finite-module input still require targets. The characteristic-dividing case retains fppf cohomology and needs its own finiteness input. Number-field Hermite alone does not establish these stronger statements (Conrad, Theorem 7.1 and proof, pp.23–26; Poonen, Theorems 6.5.13 and 8.4.6, pp.183–184,241–242).

For **Siegel's number-field adapter**, let K be a number field, S a finite set of normalized places, and for each v∈S let L_{1,v},…,L_{n,v} be independent K-linear forms. For ε>0, the K-rational projective solutions of the normalized product inequality `∏_{v∈S}∏_i |L_{i,v}(x)|_v/‖x‖_v < H_abs(x)^(−n−ε)` lie in finitely many proper K-subspaces; weights absorb the normalized local degrees. Partition the product exponents into finitely many systems, retain determinant factors and use §2.8's absolute systems theorem. For K-rational x no extra conjugate-point condition is needed after scalar transport. This is the number-field corollary used in Corvaja–Zannier, pp.268–270; it is not the rational-only product theorem.

For **descent comparison and auxiliary places**, require domination/composition of the connected covers used in the étale–Brauer/descent comparison and the iteration theorem, the character-to-Picard type exact sequence with its units hypothesis, and the universal-torsor existence obstruction in H²(K,T). The formal lemma additionally requires residue control and places with compensating local invariants for the finite quotient `A/(A∩Br X)`; local constancy of a fixed class alone is insufficient (Poonen, Theorem 8.5.4, p.247; Harpaz–Wittenberg 2020, §2, Theorem 2.1 and §6.1, pp.8–11,20–21).

For **deep finiteness and small points**, the curve Vojta inequality requires Bombieri's product/Roth lemma with its derivative-index, nonvanishing and height estimates, §§6–9, pp.623–633. The higher-dimensional subvariety theorem requires the product theorem and arithmetic Riemann–Roch, and the finite-rank extension requires division-point control. The Manin–Mumford route requires torsion Galois-orbit or p-adic inputs; uniformity also needs family control. Ueno closedness and bounded maximal cosets require Kawamata and Bogomolov–Rémond inputs. The function-field Mordell theorem requires the Manin–Grauert/Samuel–Voloch arguments, not number-field Northcott (Poonen, Theorems 9.5.1 and 9.5.10, pp.286–288; Conrad, §12, pp.40–41; Gao–Ge–Kühne, Lemma 7.4, pp.43–44).

The **adelic intersection/equidistribution** route requires semipositive adelic metrized line bundles over number fields in arbitrary dimension, arithmetic intersections, arithmetic Hilbert–Samuel, successive minima and uniform arithmetic-model approximation. The corresponding normalized subvariety height and small generic sequence are needed for the measure theorem; bounded point metrics alone do not provide them (Ullmo, Theorems 2.3–2.4, pp.6–8; Yuan–Zhang, Adelic line bundles on quasi-projective varieties, arXiv:2105.13587v9, Theorem A.6.3, pp.248–249). The **Cassels–Tate/Brauer comparison** on an abelian torsor is a separate input for genus-one conditional sufficiency and the Brauer interpretation of Bhargava–Gross–Wang failures; torus Poitou–Tate duality is not that comparison (Stoll, Finite descent obstructions, Corollary 7.4 and Lemma 7.5, pp.30–31; Bhargava–Gross–Wang, Theorems 10–11, p.3).

### Compatibility checks at imported boundaries

### Base change of Azumaya algebras at its supplier

SchemeAndStackFoundations §2.22, Azumaya.pullback and azumaya_affine_iff. Let R be a commutative ring, 𝒜 an Azumaya R-algebra (Mathlib IsAzumaya R 𝒜: finitely generated, projective and faithful as an R-module, with R-algebra map 𝒜 ⊗_R 𝒜ᵐᵒᵖ → End_R(𝒜) bijective), and S a commutative R-algebra. Then S ⊗_R 𝒜 is an Azumaya S-algebra. Over a field L, 𝒜 is Azumaya iff 𝒜 is a nonzero finite-dimensional central simple L-algebra.

R, S commutative; 𝒜 Azumaya over R. For the field statement, L is a field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3, Definition 6.6.12(iv), p. 189; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3, p. 189.)

- `TauCeti.IsAzumaya.baseChange`: IsAzumaya R 𝒜 implies IsAzumaya S (S ⊗[R] 𝒜) for every commutative R-algebra S.
- `TauCeti.IsAzumaya.isSimpleRing_of_field`: An Azumaya algebra over a field is a simple ring.
- `TauCeti.IsAzumaya.iff_isCentral_isSimpleRing`: Over a field L, IsAzumaya L 𝒜 iff 𝒜 is nonzero, finite-dimensional, central and simple.

**Checks.**

- For n ≥ 1, the matrix algebra M_n(R) is Azumaya (IsAzumaya.matrix) and its base change is M_n(S).
- Over a nonzero field, M₀ is the zero algebra and is not Azumaya: its underlying module is not faithful.
- The Hamilton quaternions over ℤ[1/2] form an Azumaya algebra; their base change to ℝ is ℍ, central simple and not split.

### Evaluating an Azumaya algebra at a point at its supplier

SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field. Let K be a field, A a commutative K-algebra, 𝒜 an Azumaya A-algebra and L a field with a K-algebra structure. For x ∈ Points_K(A, L), the evaluation of 𝒜 at x is 𝒜(x) := [L ⊗_{A, x} 𝒜] ∈ Br(L), the Brauer class (Tau Ceti BrauerGroup.mk of CSA.of) of the central simple L-algebra obtained by base change along x (SchemeAndStackFoundations §2.22, Azumaya.pullback and azumaya_affine_iff). Properties: (a) naturality: for a field extension L → L′ compatible with the K-structures, 𝒜(x′) = baseChange_{L′/L}(𝒜(x)) for x′ the composite point (Tau Ceti BrauerGroup.baseChange); (b) additivity: (𝒜 ⊗_A 𝒜′)(x) = 𝒜(x)+𝒜′(x), 𝒜ᵐᵒᵖ(x) = −𝒜(x), and End_A(P)(x) = 0 for a finite projective A-module P of positive rank; (c) pullback: for a K-algebra map g : A′ → A (so A is an A′-algebra) and an Azumaya A′-algebra 𝒜′, (A ⊗_{A′} 𝒜′)(x) = 𝒜′(x ∘ g); (d) constant algebras: for a central simple K-algebra D, (A ⊗_K D)(x) = baseChange_{L/K}[D]. Use the names `TauCeti.BrauerManin.eval 𝒜 x : Additive (BrauerGroup L)`.

K, L fields, L a K-algebra; A commutative; 𝒜 Azumaya over A. All types in one universe, as Tau Ceti's BrauerGroup group structure requires.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1, p. 229; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3.1, Definition 6.6.14, p. 189.)

- `TauCeti.BrauerManin.eval`: eval 𝒜 x := BrauerGroup.mk (CSA.of L (L ⊗[A] 𝒜)) with A → L given by x.
- `TauCeti.BrauerManin.eval_baseChange`: eval 𝒜 (composite of x with L → L′) = BrauerGroup.baseChange L L′ (eval 𝒜 x).
- `TauCeti.BrauerManin.eval_tensor`: eval (𝒜 ⊗[A] 𝒜′) x = eval 𝒜 x + eval 𝒜′ x.
- `TauCeti.BrauerManin.eval_op`: eval 𝒜ᵐᵒᵖ x = −eval 𝒜 x.
- `TauCeti.BrauerManin.eval_end`: eval (Module.End A P) x = 0 for P finite projective of positive rank; in particular eval A x = 0.
- `TauCeti.BrauerManin.eval_pullback`: eval (A ⊗[A′] 𝒜′) x = eval 𝒜′ (x ∘ g) for g : A′ → A.
- `TauCeti.BrauerManin.eval_const`: eval (A ⊗[K] D) x = BrauerGroup.baseChange K L (BrauerGroup.mk D) for a central simple K-algebra D.
- `TauCeti.BrauerManin.eval_congr`: Isomorphic Azumaya A-algebras have equal evaluations.

**Checks.**

- `TauCeti.BrauerManin.tests.trivial`: eval A x = 0 for the Azumaya algebra A itself and every point x.
- `TauCeti.BrauerManin.tests.matrix`: eval (Matrix (Fin n) (Fin n) A) x = 0 for n ≥ 1.
- `TauCeti.BrauerManin.tests.hamilton_real`: For K = ℚ, A = ℚ and 𝒜 the rational Hamilton quaternions, eval 𝒜 at the embedding ℚ → ℝ is the nontrivial element of Br(ℝ) (Tau Ceti Quaternion.brauerGroupMulEquiv sends it to the generator of ℤ/2).
- `TauCeti.BrauerManin.tests.depends_on_point`: For A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, the evaluations at the real points t = 1 and t = −1 differ (0 and the class of ℍ); evaluation is not constant on X(ℝ), which has two components.
- `TauCeti.BrauerManin.tests.alg_closed`: If L is algebraically closed, eval 𝒜 x = 0 for every 𝒜 and x (Tau Ceti baseChange_eq_one_of_isAlgClosed applied through naturality, or directly since Br(L) is trivial).
- The trivial algebra 𝒜 = A and matrix algebras evaluate to 0 at every point.
- There is no point with t=0 on Spec ℚ[t,1/t]: an algebra map must send t to a unit. The two admissible points t=1 and t=−1 distinguish split and nonsplit evaluations.
- Evaluation genuinely depends on the point: for K = ℚ, A = ℚ[t, 1/t] and the quaternion algebra 𝒜 = (−1, t)_A, 𝒜 evaluated at t = 1 in ℝ is split, and at t = −1 in ℝ it is the class of ℍ, the nontrivial element of Br(ℝ).

### Azumaya algebras over the integers of a nonarchimedean local field are split at its supplier

SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing. Let K be a number field, v a finite place, O_v = v.adicCompletionIntegers K with residue field κ_v (finite), and 𝒜₀ an Azumaya O_v-algebra. Then 𝒜₀ ≅ End_{O_v}(P) for a free O_v-module P of positive finite rank. Consequently K_v ⊗_{O_v} 𝒜₀ is a matrix algebra and its Brauer class in Br(K_v) is trivial.

O_v is a complete discrete valuation ring with finite residue field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.9.1, Corollary 6.9.3, p. 199; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.9.1, Proposition 6.9.1, p. 198.)



**Checks.**

- For the Hamilton quaternions over ℤ_p with p odd, the lemma gives an isomorphism with M₂(ℤ_p); over ℤ₂ the standard order is not Azumaya, consistent with ℍ being ramified at 2.

### Evaluation of scheme Brauer classes at points at its supplier

SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field. Let X be a scheme and α ∈ Br_Az(X) (SchemeAndStackFoundations §2.22). For a field L and x ∈ X(L) put α(x) = x*α ∈ Br_Az(Spec L), identified with the additive form of Mathlib's Brauer group of central simple L-algebras (Additive (TauCeti.BrauerGroup L)). α(x) is a group homomorphism in α, natural in L, compatible with pullback along morphisms of schemes, and on affine X = Spec R it agrees with the evaluation of SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field for Azumaya R-algebras. For x ∈ X(K_v) over a local field it lands in Br(K_v).

X any scheme; L a field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1, definition of evaluation before Proposition 8.2.1, p. 229.)

- `TauCeti.SchemeBrauer.eval`: α(x) ∈ Additive (TauCeti.BrauerGroup L) for x : Spec L ⟶ X.
- `TauCeti.SchemeBrauer.eval_add`: (α+β)(x) = α(x)+β(x), after transporting the supplier's tensor-product law to additive notation.
- `TauCeti.SchemeBrauer.eval_pullback`: (f*α)(x) = α(f∘x).
- `TauCeti.SchemeBrauer.eval_baseChange`: For L → L', α(x_{L'}) = baseChange α(x).
- `TauCeti.SchemeBrauer.eval_affine`: On Spec R it agrees with SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field.
- `TauCeti.SchemeBrauer.eval_constant`: For α = π*β with β ∈ Br(K), α(x) = β restricted to L.

**Checks.**

- `SchemeBrauer.eval.test_trivial`: The class of O_X evaluates to 0 everywhere.
- `SchemeBrauer.eval.test_quaternion`: On U : y² + z² = (3 − x²)(x² − 2) over ℚ, the class (3 − x², −1) evaluates to the nontrivial element of Br(ℚ₂) at every 2-adic point and to 0 at every real point (Poonen Proposition 8.2.15).
- `SchemeBrauer.eval.test_field`: For X = Spec K, eval is the identity of Mathlib's Brauer group.
- `SchemeBrauer.eval.test_not_constant`: Evaluation of a nonconstant class need not be constant on X(K_v): on 𝔾_m over ℚ the class (t, −1) is nontrivial at t = −1 ∈ ℝ^× and trivial at t = 1.
- For X = Spec K and α constant, α(x) = α for the unique point.

### Rational points of curves through the Abel–Jacobi embedding at its supplier

JacobianChallenge Layer F, Abel–Jacobi closed immersion and universal property. Let C be a smooth projective geometrically connected curve of genus g ≥ 1 over a field K with a divisor class D₀ of degree 1 defined over K (for instance a rational point). The Abel–Jacobi map ι_{D₀} : C → J = Jac C, P ↦ [P − D₀], is a closed immersion, and C(K) = ι^{-1}(J(K)) ∩ C(K) maps bijectively onto ι(C)(K) ⊆ J(K). Hence any finiteness or structure theorem for ι(C) ∩ Γ with Γ ⊆ J(K̄) (Mordell–Lang, Manin–Mumford, Bogomolov) transfers to points of C; for g = 1, ι is an isomorphism C ≅ J and C(K) is a J(K)-torsor.

g ≥ 1; D₀ of degree 1 over K (for g ≥ 2 a rational point suffices; without one, use C ⊆ Pic¹ and a torsor).

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.7 (Jacobians as Albanese varieties) and Example 5.12.11, pp. 138–153.)



**Checks.**

- For an elliptic curve with D₀ = O, ι is the identity; for C of genus 2 the image is a theta divisor.

## How to read the build

Layer 0 fixes the height quotient, absolute/relative normalization and geometric height machine, then builds canonical heights and their family and function-field forms. Layer 1 combines Kummer local conditions with these heights, and distinguishes trace corrections from number-field positivity. Layer 2 constructs adelic spaces and finite-support Brauer evaluation; Layer 3 uses them for torsor lifting and descent comparison. Layer 4 develops the curve covering and integral-point routes. Layer 5 supplies the abelian-subvariety intersection and small-point theorems, including the unconditional Vojta–Bombieri rational-point conclusion. Layer 6 assembles the genus classification and precisely states the conjectural extensions. `Suggested.lean` records only light definitions and representative end signatures over existing carriers; every geometric and cohomological target is stated below with its full hypotheses and checks.

## Layer 0: height classes, the Weil height machine and canonical heights

Heights are first functions modulo one uniform error, then homomorphisms from Picard groups into that quotient. Relative normalization makes finite-field-extension scaling visible. The symmetric and antisymmetric Tate limits select canonical representatives; the metric construction fixes the local functions and their summability. The family statements use regular bases and generic-trivial bundle descent, while cycle heights use geometric intersection theory.


### 0.1 Uniform boundedness at the top filter

Prove `bounded_top_iff`. For h:X→ℝ, membership in the native boundedFilterSubmodule at the top filter is equivalent to the existence of C≥0 such that |h(x)|≤C for every x∈X.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9.)

Unfold native boundedFilterSubmodule and BoundedAtFilter. Asymptotics.isBigO_top changes the filter statement into one bound for every x, since the norm of the constant real one is one.

Replace a possibly negative bound C by max(C,0). This also handles X empty without a nonemptiness assumption. Conversely forget nonnegativity and use the native top-filter equivalence.

**Checks.**

- On the empty type C=0 works.
- The alternating sequence (−1)^n has bound 1.
- The sequence n on the natural numbers has no uniform bound.

*Needs:* Mathlib `Filter.boundedFilterSubmodule`; Mathlib `Filter.BoundedAtFilter`; Mathlib `Asymptotics.isBigO_top`.


### 0.2 Heights modulo bounded functions

Define `HeightClass`. For any type X, HeightClass(X) is the native real module quotient of the function space X→ℝ by Filter.boundedFilterSubmodule at the top filter. Write [h] for the native linear quotient projection. It is a real vector space; no topology or pointwise evaluation of a class is supplied.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9.)

Specialize the native bounded-function submodule to real-valued functions and the top filter, then use the native submodule quotient. The abbreviation retains the native equivalence relation and quotient structure.

Use the inherited quotient module structure and mkQ. Constants belong to the submodule by const_boundedAtFilter, so their classes vanish. On a finite type every real function has a finite, hence bounded, range. The native metric boundedness criterion at center zero gives the Bornology compatibility statement.

For linear descent use native liftQ with the exact kernel-inclusion hypothesis; liftQ_apply and quot_hom_ext supply its computation and uniqueness interfaces.

Its interface consists of the following operations and laws.

- `TauCeti.HeightClass.mk`: The projection h↦[h] is exactly native mkQ, as a real linear map from functions to HeightClass(X).
- `TauCeti.HeightClass.mk_eq_mk_iff_isBounded`: [h]=[g] exactly when the range of h−g is Bornology.IsBounded in ℝ.
- `TauCeti.HeightClass.mk_eq_zero_iff`: [h]=0 exactly when there is C≥0 with |h(x)|≤C for every x.
- `TauCeti.HeightClass.mk_surjective`: Every height class has a real-valued function representative.
- `TauCeti.HeightClass.mk_zero`: The class of the zero function is zero.
- `TauCeti.HeightClass.mk_add`: [h+g]=[h]+[g].
- `TauCeti.HeightClass.mk_smul`: For every real c, [c·h]=c·[h].
- `TauCeti.HeightClass.mk_const`: For every real c, the class of the constant function with value c is zero.
- `TauCeti.HeightClass.mk_of_finite`: If X is finite, every function h:X→ℝ has zero class.
- `TauCeti.HeightClass.liftQ_mk`: If L:(X→ℝ)→V is a real linear map annihilating the native bounded-function submodule, its native liftQ evaluated at [h] is L(h).
- `TauCeti.HeightClass.linearMap_ext`: Two real linear maps from HeightClass(X) to V are equal if they agree on [h] for every function h.

**Checks.**

- `TauCeti.HeightClass.tests.empty`: Every real function on the empty type has zero class.
- `TauCeti.HeightClass.tests.alternating`: On ℕ the function n↦(−1)^n has zero class.
- `TauCeti.HeightClass.tests.unbounded`: On ℕ the function n↦n has nonzero class.
- `TauCeti.HeightClass.tests.affine_shift`: On ℕ the functions n↦n+7 and n↦n have equal classes.
- `TauCeti.HeightClass.tests.native_quotient`: For every h:X→ℝ, [h] is exactly Submodule.Quotient.mk(h) in the native module quotient.
- `TauCeti.HeightClass.tests.not_constants_only`: There is no real c such that (−1)^n=c for every natural n, although this sequence has zero class.
- `TauCeti.HeightClass.tests.not_ring_quotient`: On ℕ the constant functions 1 and 0 have equal classes, while n↦1·n and n↦0·n have different classes.
- Bounded nonconstant functions vanish.
- A pointwise product of two classes is not defined: [1]=[0], but [n·1]≠[n·0].
- Finite point sets give the zero quotient.

*Needs:* Mathlib `Filter.boundedFilterSubmodule`; Mathlib `Filter.const_boundedAtFilter`; Mathlib `Submodule.Quotient.mk`; Mathlib `Submodule.Quotient.eq`; Mathlib `Submodule.mkQ`; Mathlib `Submodule.mkQ_surjective`; Mathlib `Submodule.Quotient.mk_eq_zero`; Mathlib `Submodule.liftQ`; Mathlib `Submodule.liftQ_apply`; Mathlib `Submodule.quot_hom_ext`; Mathlib `Metric.isBounded_iff_subset_closedBall`; §0.1 (Uniform boundedness at the top filter).


### 0.3 The bounded-error equality criterion

Prove `mk_eq_mk_iff`. For h,g:X→ℝ, [h]=[g] if and only if there is a real C≥0 such that |h(x)−g(x)|≤C for every x.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9.)

Use native Submodule.Quotient.eq to replace equality by membership of h−g in the bounded-function submodule.

Apply §0.1 (Uniform boundedness at the top filter) and evaluate subtraction pointwise. The bound is uniform over the whole chosen point type, not merely pointwise finite or bounded on a separately chosen finite subset.

**Checks.**

- [n+(−1)^n]=[n] on ℕ.
- [2n]≠[n] on ℕ.
- Equality of classes does not imply equality of values at a point.

*Needs:* §0.2 (Heights modulo bounded functions); §0.1 (Uniform boundedness at the top filter); Mathlib `Submodule.Quotient.eq`.


### 0.4 Pullback of height classes

Define `pullback`. For any function f:X→Y, pullback(f):HeightClass(Y)→HeightClass(X) is the real linear map induced by precomposition: [h]↦[h∘f]. For X→Y→Z, pullback(g∘f)=pullback(f)∘pullback(g). No finite-fiber assumption is needed to define this map.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9.)

Form the native precomposition linear map from LinearMap.pi and LinearMap.proj: its x-coordinate is evaluation at f(x).

If h is bounded by C everywhere on Y, h∘f has the same bound on X. By §0.1 (Uniform boundedness at the top filter) this is exactly the submodule compatibility required by native mapQ.

Use native mapQ with that compatibility proof. Its evaluation, identity and composition theorems give the representative formula and contravariant functor laws. Constant f produces a constant representative, hence the zero map.

Its interface consists of the following operations and laws.

- `TauCeti.HeightClass.pullback_mk`: For f:X→Y and h:Y→ℝ, pullback(f)([h])=[h∘f].
- `TauCeti.HeightClass.pullback_id`: Pullback of the identity on X is the identity linear map on HeightClass(X).
- `TauCeti.HeightClass.pullback_comp`: For f:X→Y and g:Y→Z, pullback(g∘f)=pullback(f) composed with pullback(g).
- `TauCeti.HeightClass.pullback_add`: Pullback(f)(a+b)=pullback(f)(a)+pullback(f)(b).
- `TauCeti.HeightClass.pullback_smul`: Pullback(f)(c·a)=c·pullback(f)(a) for real c.
- `TauCeti.HeightClass.pullback_const`: For any y∈Y, pullback of the constant map X→Y with value y is the zero linear map.

**Checks.**

- `TauCeti.HeightClass.pullback_tests.double`: Pullback of [n] along n↦2n on ℕ is 2[n].
- `TauCeti.HeightClass.pullback_tests.constant`: Pullback of [n] along the constant zero map ℕ→ℕ is zero.
- `TauCeti.HeightClass.pullback_tests.composition`: Pullback of [n²] along doubling after successor is pullback along successor of pullback along doubling of [n²].
- `TauCeti.HeightClass.pullback_tests.noninjective`: Pullback along the constant zero map ℕ→ℕ is not injective.
- On ℕ, pullback of [n] along doubling is 2[n].
- Pullback along a constant map is zero.
- Composition reverses order.

*Needs:* §0.2 (Heights modulo bounded functions); §0.1 (Uniform boundedness at the top filter); Mathlib `LinearMap.pi`; Mathlib `LinearMap.proj`; Mathlib `Submodule.mapQ`; Mathlib `Submodule.mapQ_apply`; Mathlib `Submodule.mapQ_id`; Mathlib `Submodule.mapQ_comp`; Mathlib `Filter.const_boundedAtFilter`.


### 0.5 Surjective maps detect height classes

Prove `pullback_injective_of_surjective`. If f:X→Y is surjective, pullback(f):HeightClass(Y)→HeightClass(X) is injective.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9.)

Choose representatives h and g for two classes, using native mkQ_surjective. The definition through mapQ says equality of pullbacks is equality of [h∘f] and [g∘f].

Use §0.3 (The bounded-error equality criterion) to obtain C bounding |h(f(x))−g(f(x))| on all X. For each y choose an x with f(x)=y; the same C bounds the difference on Y.

Apply §0.3 (The bounded-error equality criterion) on Y. No finiteness of the fibers is used.

**Checks.**

- A bijection gives an isomorphism through its inverse pullback.
- Projection ℕ×ℕ→ℕ is surjective and detects classes even though it does not preserve Northcott finiteness.

*Needs:* §0.4 (Pullback of height classes); §0.3 (The bounded-error equality criterion); Mathlib `Submodule.mkQ_surjective`; Mathlib `Submodule.mapQ_apply`.


### 0.6 Northcott transfer under a lower comparison

Prove `northcott_of_le_add`. Let h,g:X→ℝ and C∈ℝ satisfy h(x)≤g(x)+C for every x. If h is Northcott in the native sense, then g is Northcott.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §17, p.10, with §14 footnote 1, p.7.)

Fix a real B. If g(x)≤B, then h(x)≤B+C. Thus the B-sublevel set of g is a subset of the (B+C)-sublevel set of h.

Apply native Northcott.finite_le and finite-set subset closure. This constructs the native Northcott instance for g; it introduces no second finiteness predicate.

**Checks.**

- Take h(n)=n and g(n)=n+(−1)^n, with C=1.
- The reversed inequality is insufficient: 0≤n on ℕ, while n is Northcott and the constant zero function is not.

*Needs:* Mathlib `Northcott`.


### 0.7 Northcott invariance under bounded error

Prove `northcott_congr`. If h,g:X→ℝ have equal height classes, then native Northcott(h) holds if and only if native Northcott(g) holds.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14 footnote 1, p.7; §17, p.10.)

Use §0.3 (The bounded-error equality criterion) to choose C≥0 with |h(x)−g(x)|≤C for every x. The absolute-value inequality gives both h(x)≤g(x)+C and g(x)≤h(x)+C.

Apply §0.6 (Northcott transfer under a lower comparison) to each comparison. Both implications use the same C; no representative selection is part of the resulting statement.

**Checks.**

- n and n+(−1)^n on ℕ both have finite sublevel sets.
- n and −n on ℕ are not boundedly equivalent; only the first is Northcott.
- On a fixed field, this transfers an imported arithmetic-height finiteness theorem to any boundedly equal geometric representative. It does not assert finiteness over an algebraic closure without a degree restriction.

*Needs:* §0.3 (The bounded-error equality criterion); §0.6 (Northcott transfer under a lower comparison); Mathlib `Northcott`.


### 0.8 Northcott for a boundedly equal pullback

Prove `northcott_of_pullback_eq`. Let f:X→Y have finite fibers, in the native TendstoCofinite sense. Let h:Y→ℝ be Northcott and g:X→ℝ satisfy [g]=pullback(f)([h]). Then g is Northcott.

X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

([Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14 Step 7, p.9; §17, p.10.)

Native Northcott.comp_of_finite_fibers gives Northcott(h∘f); use the native finite-fiber typeclass and its singleton-fiber characterization.

The mapQ representative formula rewrites the hypothesis as [g]=[h∘f]. Apply §0.7 (Northcott invariance under bounded error). This only adds the bounded-error bridge; the finite-fiber theorem is imported.

**Checks.**

- For projection ℕ×Fin(2)→ℕ and h(n)=n, the pullback has finite sublevels.
- For projection ℕ×ℕ→ℕ, the zero-sublevel set contains all (0,m), so finite fibers cannot be omitted.

*Needs:* §0.4 (Pullback of height classes); §0.7 (Northcott invariance under bounded error); Mathlib `Submodule.mapQ_apply`; Mathlib `Northcott.comp_of_finite_fibers`; Mathlib `Filter.TendstoCofinite`; Mathlib `Filter.tendstoCofinite_iff_finite_preimage_singleton`.


### 0.9 Generalized global fields

A generalized global field is a field K with an admissible family of absolute values in the sense of Mathlib's Height.AdmissibleAbsValues K (a finite multiset of archimedean absolute values counted with multiplicity, a set of nonarchimedean ones, finite support of every nonzero element, and the product formula), with an infinite set of pairwise inequivalent nontrivial absolute-value classes, such that every nonarchimedean member is discretely valued with excellent valuation ring in K. A finite extension K'/K inside a fixed algebraic closure receives the extended family by the algebraic method: each v extends to the finitely many w | v, normalised so that the restriction of the w-absolute value to K is the v-absolute value raised to [K'_w : K_v]·e_v/e_w (e = 2 at complex places, 1 otherwise). The extended family again satisfies the product formula, and the construction is transitive in towers.

K a field; the archimedean multiplicity convention is Mathlib's: a complex place occurs twice in the multiset, which is Conrad's exponent e_v = 2. Excellence of the nonarchimedean valuation rings is automatic in characteristic 0.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Definition 8.1 and the algebraic method for finite extensions, author copy pp. 27–29; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Example 8.3 and Example 8.5, pp. 27–29.)

Start with Conrad Definition 8.1, including the infinite inequivalent nontrivial place classes and excellent discrete valuation rings in K. Encode finite support and the product formula through AdmissibleAbsValues, and prove the equivalence of weighted and multiplicity conventions; do not identify the native class with the stronger structure.

Extension: K' ⊗_K K_v is reduced (separability of K_v/K, from excellence), so it splits as the product of the K'_w; the norm formula gives the product formula for the extended family (Conrad §8, display before Example 8.5).

Transitivity in towers follows from multiplicativity of local degrees.

Its interface consists of the following operations and laws.

- `TauCeti.GeneralizedGlobalField`: Class extending Height.AdmissibleAbsValues K by infinitude, inequivalence and nontriviality of place classes, and by discreteness and excellence of their valuation rings in K. A correspondence with Conrad’s weighted convention must be proved.
- `TauCeti.GeneralizedGlobalField.ofNumberField`: A number field with Mathlib's instance NumberField.instAdmissibleAbsValues is a generalized global field.
- `TauCeti.GeneralizedGlobalField.extend`: For a finite extension K'/K, the family obtained by the algebraic method is a generalized global field structure on K'.
- `TauCeti.GeneralizedGlobalField.extend_restrict`: For w | v, the restriction of |·|_w to K equals |·|_v^{[K'_w:K_v]e_v/e_w}.
- `TauCeti.GeneralizedGlobalField.extend_trans`: Extending along K''/K'/K in two steps gives the same family as extending along K''/K.
- `TauCeti.GeneralizedGlobalField.extend_numberField`: For number fields K ⊆ K', the extended family on K' is NumberField.instAdmissibleAbsValues K'.

**Checks.**

- `GeneralizedGlobalField.test_rat_product_formula`: For K = ℚ and x = 2 the archimedean factor is 2 and the nonarchimedean factors multiply to 1/2.
- `GeneralizedGlobalField.test_extend_self`: Extending along K'/K with K' = K returns the original family.
- `GeneralizedGlobalField.test_numberField`: For K' = ℚ(i) the extended family from ℚ has one archimedean member of multiplicity two, as in Mathlib's instance.
- `GeneralizedGlobalField.test_no_archimedean`: The p-adic absolute values of ℚ alone (no archimedean member) violate the product formula at x = 2.
- For K = ℚ with Mathlib's instance the product formula at x = 2 reads 2 · (1/2) = 1.
- The extended family on a number field K' is Mathlib's own instance on K' (Conrad Example 8.5).

*Needs:* Mathlib `Height.AdmissibleAbsValues`; Mathlib `NumberField.instAdmissibleAbsValues`.


### 0.10 Polarized function fields as generalized global fields

Let k be a field, K/k a finitely generated extension with k algebraically closed in K and trdeg_k K ≥ 1, and (V, N) a polarization: V a normal projective k-variety with function field K and N an ample line bundle on V. For each prime divisor D of V put |x|_D = exp(−deg_N(D)·ord_D(x)) with deg_N(D) = (c₁(N)^{dim V−1}·D). These absolute values make K a generalized global field (all nonarchimedean). The elements with |x|_D = 1 for every D are exactly the nonzero constants k^×. If K'/K is finite with normalisation V' of V in K', constant field k' and pulled-back N', the algebraic-method family on K' is the (V', N') family raised to the power [k' : k].

k algebraically closed in K; V normal (regular in codimension one suffices) and projective; N ample. When dim V = 1, V is unique and deg_N(D) = [k(D) : k] does not depend on N.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Example 8.4 and Lemma 8.6, author copy pp. 27–29; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §1.1, pp. 1–2.)

The product formula is the vanishing of deg_N of a principal divisor (Conrad Example 8.4), via Layer 5 intersection numbers: deg_N(div f) = c₁(N)^{dim V−1}·div f = 0.

Finite support: a nonzero rational function has finitely many zero and polar divisors.

Extension: Conrad Lemma 8.6 compares the two families through leading coefficients of Hilbert polynomials (projection formula for the finite map V' → V).

Its interface consists of the following operations and laws.

- `TauCeti.GeneralizedGlobalField.ofPolarization`: The generalized global field structure on K defined by a polarization (V, N).
- `TauCeti.GeneralizedGlobalField.ofPolarization_absVal`: |x|_D = exp(−deg_N(D)·ord_D x) for every prime divisor D of V.
- `TauCeti.GeneralizedGlobalField.ofPolarization_eq_one_iff`: |x|_D = 1 for all D iff x ∈ k^×.
- `TauCeti.GeneralizedGlobalField.ofPolarization_curve`: If dim V = 1 the family is independent of N, with weight [k(D):k].
- `TauCeti.GeneralizedGlobalField.extend_ofPolarization`: For finite K'/K the extended family equals the (V', N') family to the power [k':k] (Conrad Lemma 8.6).

**Checks.**

- `ofPolarization.test_projectiveLine`: V = ℙ¹_k, N = O(1), x = t: |t|_0 = e^{−1}, |t|_∞ = e, all other values 1, product 1.
- `ofPolarization.test_constants`: Every c ∈ k^× has |c|_D = 1 for every D.
- `ofPolarization.test_curve_independent`: For a curve V, replacing N by N^{⊗2} does not change the family.
- `ofPolarization.test_unweighted_fails`: On ℙ² with f = q/x² (q a smooth conic) the unweighted orders violate the product formula; the deg_N weights repair it.
- For V = ℙ²_k, N = O(1) and f = q/x² with q a smooth conic, the weighted orders are 2·1 − 1·2 = 0 while the unweighted orders sum to −1.

*Needs:* §0.9 (Generalized global fields); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.11 The normalised projective height

For a generalized global field K with algebraic closure K̄ and n ≥ 0, h_{K,n} : ℙⁿ(K̄) → ℝ_{≥0} sends [t₀ : … : t_n] with t_i in a finite subextension K'/K to [K':K]^{-1}·Σ_{w} log max_i |t_i|_w^{e_w} (sum over the extended family of K'). It does not depend on K', on the homogeneous coordinates, or on the choice of K̄, and it is Aut(K̄/K)-invariant. For x ∈ ℙⁿ(K) it equals Mathlib's Projectivization.logHeight over K. For K = ℚ it is the absolute logarithmic Weil height h on ℙⁿ(ℚ̄); for x ∈ ℙⁿ(L) with L a number field, [L:ℚ]·h(x) is Mathlib's logHeight over L, and h([x : 1]) = NumberField.absLogHeight₁ x.

K a generalized global field; the coordinates lie in a finite subextension.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, definition of h_{K,n} (first display of §9) and Remark 9.1, author copy pp. 29–30; [Arithmetic bigness and a uniform Bogomolov-type result](https://arxiv.org/abs/2108.05625v4), §4.3.1, canonical height normalization, arXiv:2108.05625v4 pp.70–72; [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/2018/187-2/p02), §6.2, p. 387.)

Independence of K' from Σ_{w''|w}[K''_{w''}:K'_w] = [K'':K'] (Conrad §9).

Independence of coordinates from the product formula (Mathlib Height.mulHeight_smul_eq_mulHeight over K').

Galois invariance: σ permutes the places of σK' preserving local degrees.

Its interface consists of the following operations and laws.

- `TauCeti.normalizedHeight`: h_{K,n} : Projectivization K̄ (Fin (n+1) → K̄) → ℝ.
- `TauCeti.normalizedHeight_of_mem`: If the coordinates lie in K', h_{K,n}(x) = [K':K]^{-1}·logHeight over K' of the coordinate vector.
- `TauCeti.normalizedHeight_algebraMap`: For x defined over K, h_{K,n}(x) = Projectivization.logHeight x over K.
- `TauCeti.normalizedHeight_nonneg`: h_{K,n} ≥ 0.
- `TauCeti.normalizedHeight_galois`: h_{K,n}(σx) = h_{K,n}(x) for σ ∈ Aut(K̄/K).
- `TauCeti.absHeight_eq_absLogHeight₁`: For K = ℚ and x ∈ ℚ̄, h_{ℚ,1}([x:1]) = NumberField.absLogHeight₁ x.

**Checks.**

- `normalizedHeight.test_one_two`: h_{ℚ,1}([1:2]) = log 2.
- `normalizedHeight.test_coordinate_point`: h_{K,n}([1:0:…:0]) = 0.
- `normalizedHeight.test_sqrt_two`: h_{ℚ,1}([√2 : 1]) = (1/2)·log 2.
- `normalizedHeight.test_relative_differs`: Mathlib's logHeight over ℚ(i) of the vector (2, 1) is 2·log 2, twice the normalised h_{ℚ,1}([2:1]) = log 2.
- h_ℚ([1 : 2]) = log 2; h_ℚ([√2 : 1]) = (1/2)·log 2.

*Needs:* §0.9 (Generalized global fields); Mathlib `Projectivization.logHeight`; Mathlib `Height.mulHeight_smul_eq_mulHeight`; Mathlib `NumberField.absLogHeight₁`.


### 0.12 Heights under finite extension of the base field

Prove `TauCeti.logHeight_baseChange`. Let K be a generalized global field and K'/K a finite extension with the extended structure. The relative projective logarithmic height satisfies h_{K',n}(x) = [K':K]·h_{K,n}(x), for x in projective space over a common algebraic closure. For x rational over K this is the corresponding Mathlib logHeight base-change formula. Absolute normalized height, with the base-field normalization also divided out, is unchanged. The line-bundle version is an API of §0.17 (Weil's height machine), after that construction.

K'/K finite; K' carries the structure of §0.9 (Generalized global fields) (extend).

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Remark 9.2, display (9.2), author copy p. 30.)

For v on K: Σ_{w|v} [K'_w:K_v] = [K':K] (reducedness of K' ⊗ K_v).

For x ∈ K, log|x|_w^{e_w} = [K'_w:K_v]·log|x|_v^{e_v} by extend_restrict; summing over w | v and then over v gives the identity.

**Checks.**

- For K = ℚ, K' = ℚ(i) and x = [2:1], the two sides are 2·log 2.

*Needs:* §0.11 (The normalised projective height); §0.9 (Generalized global fields); Mathlib `Height.logHeight`.


### 0.13 Coordinate heights of algebraic tuples

Prove `TauCeti.absLogHeight_tuple_le`. For algebraic numbers x₁, …, x_m ∈ ℚ̄ with absolute logarithmic heights h(x_i) = NumberField.absLogHeight₁ x_i: max_i h(x_i) ≤ h([1 : x₁ : … : x_m]) ≤ Σ_i h(x_i). For x ∈ ℚ̄ ⊂ ℂ the real and imaginary parts are algebraic, with h(Re x), h(Im x) ≤ 2·h(x) + 2·log 2 and degree over ℚ at most [ℚ(x):ℚ]². The counting height of a tuple is max_i h(x_i).

Heights are absolute (normalised over ℚ); ℚ̄ is the algebraic closure inside ℂ.

([The André–Oort conjecture for A_g](https://annals.math.princeton.edu/2018/187-2/p02), §6.2, p. 387.)

The lower bound compares each place's maximum with |x_i|_w; the upper bound uses max(1, |x₁|, …) ≤ Π max(1, |x_i|) place by place.

Complex conjugation c restricts to an element of Gal(ℚ̄/ℚ), so h(c x) = h(x) by §0.11 (The normalised projective height) Galois invariance.

Re x = (x + c x)/2 and Im x = (x − c x)/(2i): apply h(a + b) ≤ h(a) + h(b) + log 2 and h(ab) ≤ h(a) + h(b) (Mathlib Height.logHeight₁_add_le and Height.logHeight₁_mul_le over a common number field), with h(1/2) = log 2 and h(i) = 0.

For a nonreal algebraic x of degree d, consider the Galois-stable set of (α_i−α_j)/(2i), where the α_i are its d conjugates and i²=−1. Galois acts on i by a sign and exchanges ordered differences, so the orbit has at most d(d−1) values; Im x has degree at most d². For real x its imaginary part is zero. The real-part orbit uses (α_i+α_j)/2. Im x need not belong to ℚ(x,cx): x=√−2 gives Im x=√2.

Apply the native relative addition bound with log 2·totalWeight and divide by the total weight to obtain the absolute bound. The extra division by 2 contributes another log 2; multiplying by i has height zero.

**Checks.**

- x = 1 + i: Re x = Im x = 1 has height 0, while h(x) = (1/2)·log 2.

*Needs:* §0.11 (The normalised projective height); Mathlib `Height.logHeight₁_add_le`; Mathlib `Height.logHeight₁_mul_le`; Mathlib `NumberField.absLogHeight₁`.


### 0.14 Northcott's theorem on projective space

Prove `TauCeti.northcott_projectivization`. Let K be a number field and n ≥ 0, D ≥ 1, B ∈ ℝ. (a) {x ∈ ℙⁿ(K) : Projectivization.logHeight x ≤ B} is finite. (b) {x ∈ ℙⁿ(ℚ̄) : [ℚ(x):ℚ] ≤ D and h(x) ≤ B} is finite, where ℚ(x) is the field generated by the ratios of the coordinates. In Mathlib's vocabulary (a) is an instance Northcott (Projectivization.logHeight) for ℙⁿ(K).

K a number field; h the normalised height of §0.11 (The normalised projective height); degrees over ℚ.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, height properties list (Northcott is used in §10 and in the arithmetic case of Theorem 9.15's discussion), author copy pp. 30–35; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Remark on heights in §2.6.4 and §9.5.1 (orientation only).)

(a) Normalise a coordinate to 1; each affine coordinate x_i has absLogHeight₁ ≤ [K:ℚ]^{-1}·B + bounded, and Mathlib's finite_setOfPred_logHeight₁_le gives finitely many values per coordinate.

For the varying-field statement normalize a nonzero coordinate to one. Every ratio has absolute height at most B and degree at most D; apply bounded-degree scalar Northcott from DiophantineApproximationAndTranscendence §§0.2–0.3 to each ratio. No new scalar Northcott proof is required.

(a) also follows from (b) with D = [K:ℚ] and §0.12 (Heights under finite extension of the base field).

**Checks.**

- For K = ℚ, n = 1, B = log 2: the points [a:b] with coprime a, b and max(|a|,|b|) ≤ 2 are [0:1], [1:0], [±1:1], [±2:1], [±1:2]: eight points.

*Needs:* §0.11 (The normalised projective height); §0.13 (Coordinate heights of algebraic tuples); §0.12 (Heights under finite extension of the base field); Mathlib `NumberField.finite_setOfPred_logHeight₁_le`; Mathlib `Northcott`; Mathlib `Polynomial.mahlerMeasure`.


### 0.15 Linear changes of coordinates change heights boundedly

Prove `TauCeti.normalizedHeight_linearChange_bounded`. For a generalized global field K and T ∈ GL_{n+1}(K), the function h_{K,n}∘T − h_{K,n} is bounded on ℙⁿ(K̄). More generally, for a linear map A : K^{n+1} → K^{m+1} with trivial kernel, h_{K,m}(Ax) ≤ h_{K,n}(x) + C_A on ℙⁿ(K̄).

T invertible; A injective (so Ax ≠ 0 for x ≠ 0).

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, statement that h_{K,n} − h_{K,n}∘T is bounded for T ∈ Aut(ℙⁿ_K), author copy p. 30.)

Upper bound: Mathlib Height.logHeight_linearMap_apply_le applied over each finite subextension K' ⊇ K, then divided by [K':K] (constants scale exactly by §0.12 (Heights under finite extension of the base field)).

Lower bound for T: apply the upper bound to T^{-1}.

**Checks.**

- For T(x₀, x₁) = (x₀, x₀ + x₁) on ℙ¹ the difference is at most log 2 in absolute value.

*Needs:* §0.11 (The normalised projective height); §0.12 (Heights under finite extension of the base field); Mathlib `Height.logHeight_linearMap_apply_le`.


### 0.16 Heights along morphisms to projective space

Prove `TauCeti.normalizedHeight_comp_forms`. Let K be a generalized global field, X a projective K-variety and φ : X → ℙⁿ, ψ : X → ℙᵐ morphisms with φ*O(1) ≅ ψ*O(1). Then h_{K,n}∘φ − h_{K,m}∘ψ is bounded on X(K̄). If f : ℙⁿ → ℙᵐ is a morphism given by forms of degree d without common zero, h_{K,m}∘f = d·h_{K,n} + O(1).

X projective over K; φ and ψ morphisms over K; the isomorphism of line bundles is over K.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, functoriality bullet (proved by the Nullstellensatz over K̄), author copy p. 31; [Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, Steps 1–7, pp. 7–9.)

Both maps are given by bases of subspaces of H⁰(X, L) for L = φ*O(1) generating L; by §0.15 (Linear changes of coordinates change heights boundedly) reduce to φ and ψ given by two generating families of sections of the same L.

Upper bounds: each section of one family is a linear combination of products with the other on an affine cover; Mathlib's Height.logHeight_eval_le gives h∘φ ≤ h∘ψ + C.

Lower bounds: the Nullstellensatz on X writes powers of the sections of one family as combinations of the other (Mathlib Height.logHeight_eval_ge in the case of ℙⁿ), giving the reverse inequality.

**Checks.**

- The Veronese map ℙ¹ → ℙ², [x:y] ↦ [x²:xy:y²], has h∘v = 2h exactly.

*Needs:* §0.11 (The normalised projective height); §0.15 (Linear changes of coordinates change heights boundedly); Mathlib `Height.logHeight_eval_le`; Mathlib `Height.logHeight_eval_ge`; SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.17 Weil's height machine

Let K be a generalized global field and X a projective K-variety. There is a unique group homomorphism h_{K,•} : Pic(X) → HeightClass(X(K̄)), L ↦ h_{K,L}, such that for every very ample L with complete linear system embedding ι_L : X → ℙ(H⁰(X, L)), h_{K,L} is the class of h_{K,n}∘ι_L. It satisfies: (a) functoriality h_{K,f*M} = f*h_{K,M} for every K-morphism f : X → Y of projective varieties (pullback of classes, §0.4 (Pullback of height classes)); (b) extension [K':K]·h_{K,L} = h_{K',L_{K'}}; (c) positivity off the base locus (§0.18 (Heights are bounded below off the base locus)); (d) for L ample and M arbitrary there is c > 0 with |h_{K,M}| ≤ c·h_{K,L} + O(1); (e) for K a number field and L ample, Northcott (§0.19 (Northcott for ample line bundles)).

X projective over K (any closed subscheme of some ℙⁿ_K); Pic(X) is the group of isomorphism classes of line bundles.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, (9.1) and the paragraph defining h_{K,L} for arbitrary L, the list of basic properties, author copy pp. 30–31; [Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, Steps 1–7, pp. 7–9.)

Very ample case: define h_{K,L} by ι_L; it is well defined by §0.16 (Heights along morphisms to projective space), and additive since the Segre embedding is exact for heights (Mathlib Height.logHeight_fun_mul_eq).

General L: write L ≅ L₁ ⊗ L₂^{-1} with L₁, L₂ very ample; the class h_{K,L₁} − h_{K,L₂} is independent of the presentation by additivity on very ample bundles (Conrad §9 after (9.1)).

Functoriality: for very ample M on Y, f*M is globally generated, and ι_M∘f is a morphism with (ι_M∘f)*O(1) = f*M; compare with an embedding of f*M ⊗ (very ample) via §0.16 (Heights along morphisms to projective space).

(d): L^{⊗N} ⊗ M^{±1} is very ample for N large, and very ample heights are bounded below.

Its interface consists of the following operations and laws.

- `TauCeti.weilHeight`: The homomorphism Pic(X) →+ HeightClass(X(K̄)), written h_{K,L}.
- `TauCeti.weilHeight_veryAmple`: For very ample L, h_{K,L} is the class of h_{K,n}∘ι_L.
- `TauCeti.weilHeight_tensor`: h_{K,L⊗M} = h_{K,L} + h_{K,M}.
- `TauCeti.weilHeight_pullback`: h_{K,f*M} = (pullback along f) h_{K,M} for every morphism f : X → Y.
- `TauCeti.weilHeight_projectiveSpace`: On ℙⁿ, h_{K,O(d)} = d·[h_{K,n}].
- `TauCeti.weilHeight_baseChange`: [K':K]·h_{K,L} = h_{K',L_{K'}}.
- `TauCeti.weilHeight_le_of_ample`: For L ample there is c > 0 with |h_{K,M}| ≤ c·h_{K,L} + O(1).
- `TauCeti.weilHeight_unique`: Any homomorphism Pic(X) → HeightClass(X(K̄)) agreeing with h_{K,n}∘ι_L on very ample L is h_{K,•}.

**Checks.**

- `weilHeight.test_projectiveSpace`: On ℙ¹_ℚ, h_{ℚ,O(2)}([1:2]) has representative 2·log 2.
- `weilHeight.test_trivial`: h_{K,O_X} = 0 in HeightClass.
- `weilHeight.test_point`: For X = Spec K (a point), every h_{K,L} is 0.
- `weilHeight.test_mathlib_relative`: For X = ℙⁿ_K and x ∈ ℙⁿ(K), the representative h_{K,n}(x) equals Mathlib's Projectivization.logHeight x.
- `weilHeight.test_not_pointwise`: h_{K,O(1)} on ℙ¹ has representatives h and h + 1; no canonical function is chosen at this level.
- On X = ℙⁿ, h_{K,O(d)} = d·h_{K,n}.
- Over K = ℚ and X a conic embedded in ℙ², the restriction of h to X(ℚ̄) represents h_{O(1)|X} and twice h_{O_X(P)} for any point P (O(1)|X ≅ O_X(2P) on X ≅ ℙ¹ over ℚ̄).

*Needs:* §0.11 (The normalised projective height); §0.16 (Heights along morphisms to projective space); §0.12 (Heights under finite extension of the base field); §0.2 (Heights modulo bounded functions); §0.4 (Pullback of height classes); Mathlib `Height.logHeight_fun_mul_eq`; SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above; SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts.


### 0.18 Heights are bounded below off the base locus

Prove `TauCeti.weilHeight_bddBelow_off_baseLocus`. For a projective variety X over a generalized global field K and a line bundle L with base locus B = Supp coker(H⁰(X, L) ⊗ O_X → L), every representative of h_{K,L} is bounded below on X(K̄) ∖ B(K̄). In particular for L ample (some power globally generated) h_{K,L} is bounded below on X(K̄).

X projective; L a line bundle with H⁰(X, L) ≠ 0 for a nonempty complement.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, positivity away from the base locus (last bullet of the list of properties), author copy p. 31.)

Choose a very ample M with L ⊗ M very ample, a basis (s_i) of H⁰(X, L) and a basis (t_j) of H⁰(X, M). At x ∉ B some s_i(x) ≠ 0, so the products s_i·t_j, part of a generating family of L ⊗ M, do not all vanish at x; comparing the heights of [s_i t_j(x)] and [t_j(x)] place by place gives h_{L⊗M}(x) ≥ h_M(x) − C, that is h_L(x) ≥ −C on X ∖ B (Conrad §9, base-locus property; §0.16 (Heights along morphisms to projective space)).

**Checks.**

- On ℙ¹ with L = O(1) the base locus is empty and h ≥ 0.

*Needs:* §0.17 (Weil's height machine).


### 0.19 Northcott for ample line bundles

Prove `TauCeti.weilHeight_northcott_of_ample`. Let K be a number field, X a projective K-variety and L an ample line bundle on X. For every representative h of h_{K,L} and all D ≥ 1, B ∈ ℝ, the set {x ∈ X(ℚ̄) : [K(x):K] ≤ D and h(x) ≤ B} is finite. With Mathlib's class: for each D the restriction of h to points of degree ≤ D is Northcott.

K a number field (Northcott fails for function fields with infinite constant field, where constant points have height 0).

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, positivity of ample K-heights, and §10 use of Northcott in the arithmetic case, author copy pp. 31–37.)

Replace L by a very ample power L^{⊗m}: h_{K,L^m} = m·h_{K,L} and the property is insensitive to positive scaling and bounded error (§0.7 (Northcott invariance under bounded error)).

For very ample L the height is h_{K,n}∘ι_L with ι_L a closed embedding, so the set embeds into {y ∈ ℙⁿ(ℚ̄) : degree ≤ D[K:ℚ], h(y) ≤ B'}: finite by §0.14 (Northcott's theorem on projective space).

**Checks.**

- For X = ℙ¹_ℚ and L = O(1) at height ≤ log 2 and degree 1: the eight points of §0.14 (Northcott's theorem on projective space)'s example.

*Needs:* §0.17 (Weil's height machine); §0.14 (Northcott's theorem on projective space); §0.7 (Northcott invariance under bounded error); Mathlib `Northcott`.


### 0.20 Tate's limit

Let S be a set, φ : S → S a map, d > 1 a real number and f : S → ℝ with |f∘φ − d·f| ≤ C on S. Then f̂(s) = lim_{m→∞} d^{−m} f(φ^m(s)) exists for every s, |f̂ − f| ≤ C/(d − 1), and f̂∘φ = d·f̂. It is the unique function g with g∘φ = d·g and g − f bounded. If f' − f is bounded then f̂' = f̂, so the construction descends to height classes.

Only the bound |f∘φ − d f| ≤ C is assumed; no topology on S.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, displays (9.3)–(9.4), author copy p. 32; [EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6 (canonical height milestone).)

The telescoping series f + Σ_{m≥0} d^{−(m+1)}(f∘φ^{m+1} − d·f∘φ^m) converges uniformly, with tail bounded by C·d^{−m}/(d−1).

f̂∘φ = d·f̂ by shifting the index; uniqueness: if g, g' both satisfy the functional equation with bounded difference D, then |g − g'| = d^{−m}|g∘φ^m − g'∘φ^m| ≤ d^{−m}D → 0.

Its interface consists of the following operations and laws.

- `TauCeti.tateLimit`: tateLimit φ d f : S → ℝ, defined as the telescoping series (a real body, no limUnder).
- `TauCeti.tendsto_tateLimit`: d^{−m} f(φ^m s) → tateLimit φ d f s.
- `TauCeti.abs_tateLimit_sub_le`: |tateLimit φ d f − f| ≤ C/(d−1).
- `TauCeti.tateLimit_comp`: tateLimit φ d f ∘ φ = d · tateLimit φ d f.
- `TauCeti.tateLimit_unique`: A function g with g∘φ = d·g and g − f bounded equals tateLimit φ d f.
- `TauCeti.tateLimit_congr_bounded`: If f' − f is bounded, tateLimit φ d f' = tateLimit φ d f.

**Checks.**

- `tateLimit.test_constant`: For f constant and φ = id, tateLimit = 0.
- `tateLimit.test_exact`: If f∘φ = d·f exactly then tateLimit φ d f = f.
- `tateLimit.test_elliptic`: For W elliptic over a field with admissible absolute values, φ = doubling, d = 4 and f = naiveHeight/2, tateLimit φ 4 f = WeierstrassCurve.Affine.Point.canonicalHeight.
- `tateLimit.test_d_one`: For d = 1 the series need not converge: S = ℕ, φ(n) = n + 1, f(n) = n gives d^{−m}f(φ^m 0) = m.
- S = ℕ, φ = id, d = 2, f = 1: f̂ = 0 and the bound C/(d−1) = 1 is attained.

*Needs:* §0.2 (Heights modulo bounded functions).


### 0.21 The Néron–Tate canonical height

Let A be an abelian variety over a generalized global field K and L a line bundle on A. For symmetric L ([−1]*L ≅ L) put ĥ⁺_{K,L} = Tate limit of h_{K,L} along [2] with d = 4; for antisymmetric L ([−1]*L ≅ L^{−1}) put ĥ⁻_{K,L} = Tate limit along [2] with d = 2; in general ĥ_{K,L} = (ĥ⁺_{K,L⁺} + ĥ⁻_{K,L⁻})/2 with L⁺=L⊗[−1]*L and L⁻=L⊗([−1]*L)⁻¹. Then ĥ_{K,L} : A(K̄) → ℝ represents h_{K,L}, depends only on the isomorphism class of L, is additive in L, vanishes at 0, is a quadratic form for symmetric L and additive for antisymmetric L, satisfies ĥ_{K,f*M} = ĥ_{K,M}∘f − ĥ_{K,M}(f(0)) for every morphism f : A → B of K-varieties and ĥ_{K,t_a*L} = ĥ_{K,L}∘t_a − ĥ_{K,L}(a), scales by [K':K] under finite extension, and for symmetric L depends only on the algebraic equivalence class of L. For K a number field the absolute Néron–Tate height is [K:ℚ]^{-1}·ĥ_{K,L}.

A an abelian variety over K (Tau Ceti TauCeti.AlgebraicGeometry.AbelianVariety); L any line bundle. Symmetric: [2]*L ≅ L^{⊗4}; antisymmetric: [2]*L ≅ L^{⊗2} (theorem of the cube).

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, from 'In the special case of abelian varieties' through Theorem 9.8, displays (9.3)–(9.7), author copy pp. 31–33; [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §2.1, Lemma 2.3, arXiv:2105.15085v4 pp.8–9; [Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), Remark 3.2, p. 14.)

Theorem of the cube (AbelianSchemesAndArithmeticModuli A1.5) gives [2]*L ≅ L⁴ (symmetric) or L² (antisymmetric); with the height machine, h_{K,L}∘[2] − d·h_{K,L} is bounded, so §0.20 (Tate's limit) applies.

Quadraticity: the parallelogram law holds up to O(1) by the cube theorem on A × A; Tate limits turn it into an identity.

Functoriality and translation: both sides are functions of degree ≤ 2 in the same class modulo O(1), hence differ by a constant, fixed at 0 (Conrad (9.5)–(9.7)).

Algebraic equivalence: for symmetric L, L' with L' ⊗ L^{-1} ∈ Pic⁰(A), M = L' ⊗ L^{-1} is symmetric and antisymmetric, so M² is trivial and ĥ_M is additive with 2ĥ_M = 0 (alternative to Conrad Theorem 9.8's quasi-equivalence argument; Gao–Ge–Kühne Lemma 2.3).

Its interface consists of the following operations and laws.

- `TauCeti.neronTateHeight`: ĥ_{K,L} : A(K̄) → ℝ for any line bundle L on A.
- `TauCeti.neronTateHeight_mem_weilHeight`: The class of ĥ_{K,L} in HeightClass is h_{K,L}.
- `TauCeti.neronTateHeight_zero`: ĥ_{K,L}(0) = 0.
- `TauCeti.neronTateHeight_tensor`: ĥ_{K,L⊗M} = ĥ_{K,L} + ĥ_{K,M}.
- `TauCeti.neronTateHeight_nsmul`: For symmetric L, ĥ_{K,L}(n•a) = n²·ĥ_{K,L}(a).
- `TauCeti.neronTateHeight_parallelogram`: For symmetric L, ĥ(a+b) + ĥ(a−b) = 2ĥ(a) + 2ĥ(b).
- `TauCeti.neronTateHeight_add_of_antisymm`: For antisymmetric L, ĥ_{K,L} is additive.
- `TauCeti.neronTateHeight_pullback`: ĥ_{K,f*M} = ĥ_{K,M}∘f − ĥ_{K,M}(f 0) for a morphism of varieties f : A → B.
- `TauCeti.neronTateHeight_translate`: ĥ_{K,t_a*L} = ĥ_{K,L}∘t_a − ĥ_{K,L}(a).
- `TauCeti.neronTateHeight_baseChange`: ĥ_{K',L_{K'}} = [K':K]·ĥ_{K,L}.
- `TauCeti.neronTateHeight_eq_of_algEquiv`: Symmetric L, L' algebraically equivalent ⇒ ĥ_{K,L} = ĥ_{K,L'}.
- `TauCeti.neronTateHeight_quadraticMap`: For symmetric L, ĥ_{K,L} is a QuadraticMap ℤ A(K̄) ℝ.

**Checks.**

- `neronTateHeight.test_trivial`: ĥ_{K,O_A} = 0.
- `neronTateHeight.test_elliptic`: For E given by a Weierstrass curve W over a number field K, ĥ_{K,O_E(O)}(P) = W.Point.canonicalHeight P; the absolute height is [K:ℚ]^{-1} times it.
- `neronTateHeight.test_product`: On A = E₁ × E₂ with L = p₁*O(O) ⊗ p₂*O(O), ĥ(P, Q) = ĥ₁(P) + ĥ₂(Q).
- `neronTateHeight.test_torsion_translate`: For symmetric L and torsion t, ĥ_{K,L}(a + t) = ĥ_{K,L}(a).
- `neronTateHeight.test_naive_not_quadratic`: For y² = x³ − 2 over ℚ and P = (3, 5), the naive x-height satisfies h(2P) ≠ 4h(P): h(x(2P)) = log 129 (x(2P) = 129/100), not 4·log 3 = log 81.
- ĥ_{K,L}(n a) = n²·ĥ_{K,L}(a) for symmetric L and every integer n.
- For an elliptic curve E/K, ĥ_{K,O_E(O)} equals Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight (which already halves the x-height).

*Needs:* §0.20 (Tate's limit); §0.17 (Weil's height machine); Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli §A1.5, relativeCube and multiplication pullbacks; AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, the normalized Poincaré bundle and Mumford map.


### 0.22 Positivity and kernel of the Néron–Tate height

Prove `TauCeti.neronTateHeight_eq_zero_iff_isTorsion`. Let A be an abelian variety over a number field K and L a symmetric ample line bundle. Then ĥ_{K,L} ≥ 0 on A(ℚ̄); ĥ_{K,L}(a) = 0 if and only if a is a torsion point; and for every D the set of torsion points of degree ≤ D over K is finite. The proof uses Northcott only, not the finite generation of A(K).

K a number field; L symmetric and ample.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, sentence after Lemma 9.7 (ĥ ≥ 0 for symmetric ample L) and the arithmetic case before Theorem 9.15, author copy pp. 33–35.)

Non-negativity: h_{K,L} is bounded below (§0.18 (Heights are bounded below off the base locus)), so the quadratic form ĥ_{K,L} is bounded below, hence ≥ 0 (Conrad §9 after Lemma 9.7).

If ĥ(a) = 0, all multiples n•a lie in A(K(a)) and have ĥ = 0, hence bounded h_{K,L}: finitely many by §0.19 (Northcott for ample line bundles), so a is torsion. Conversely ĥ(a) = m^{−2}ĥ(m•a) = 0 for m the order.

All torsion points have canonical height zero, so the bounded difference with an ample height puts every point of degree ≤D in one bounded-degree Northcott set. That single set is finite; no union over fields or finite-generation theorem is used.

**Checks.**

- For an elliptic curve this specialises to Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder.

*Needs:* §0.21 (The Néron–Tate canonical height); §0.19 (Northcott for ample line bundles); §0.18 (Heights are bounded below off the base locus); Mathlib `Monoid.finite_set_isOfFiniteOrder_of_descent`; Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`.


### 0.23 The Néron–Tate bilinear form of a symmetric bundle

For an abelian variety A over a generalized global field K and a symmetric line bundle L, ⟨a, b⟩_L = ĥ_{K,L}(a + b) − ĥ_{K,L}(a) − ĥ_{K,L}(b) is a symmetric ℤ-bilinear form on A(K̄) with ⟨a, a⟩_L = 2ĥ_{K,L}(a); it equals Conrad's ⟨a, φ_L(b)⟩_{A,K} with φ_L(x) = t_x*L ⊗ L^{-1}. Its real extension is positive semidefinite on A(K')_ℝ for L ample.

L symmetric; K generalized global field.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Theorem 9.10 and Corollary 9.12, author copy pp. 34.)

Bilinearity from the parallelogram law of a quadratic form (Mathlib QuadraticMap.polarBilin).

Comparison with φ_L: Conrad Theorem 9.10 via the Poincaré bundle and functoriality.

Semidefiniteness from ĥ ≥ 0 (Conrad Corollary 9.12).

Use the normalized Poincaré bundle from AbelianSchemesAndArithmeticModuli A2. In the elliptic specialization this unhalved polarization equals twice Tau Ceti’s native pairing.

Its interface consists of the following operations and laws.

- `TauCeti.neronTateForm`: ⟨,⟩_L : LinearMap.BilinMap ℤ A(K̄) ℝ.
- `TauCeti.neronTateForm_self`: ⟨a, a⟩_L = 2ĥ_{K,L}(a).
- `TauCeti.neronTateForm_comm`: ⟨a, b⟩_L = ⟨b, a⟩_L.
- `TauCeti.neronTateForm_torsion`: ⟨a, t⟩_L = 0 for torsion t.
- `TauCeti.neronTateHeight_sum_le`: For L symmetric ample, ĥ(x₁ + ⋯ + x_m) ≤ m·Σ ĥ(x_i) (Xie–Yuan, proof of Lemma 5.3).

**Checks.**

- `neronTateForm.test_elliptic`: For E from W over a number field, ⟨P, Q⟩_{O(O)} = 2·W.neronTatePairing P Q (Tau Ceti halves the polar form; neronTatePairing_self gives ⟨P,P⟩ = 2ĥ(P)).
- `neronTateForm.test_zero`: ⟨0, b⟩_L = 0.
- `neronTateForm.test_sum_two`: For L symmetric ample, ĥ(x+y)≤2ĥ(x)+2ĥ(y); dropping ampleness/semidefiniteness makes this inequality false for a negative polarization.
- `neronTateForm.test_not_definite_on_torsion`: On a torsion point t ≠ 0, ⟨t, t⟩_L = 0, so the form is not definite on A(K) itself, only on A(K)/A(K)_tors ⊗ ℝ.
- For E elliptic and L = O(O): ⟨P, P⟩_L = 2ĥ(P), compared with Tau Ceti's neronTatePairing.

*Needs:* §0.21 (The Néron–Tate canonical height); Mathlib `QuadraticMap.polarBilin`; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`; AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, the normalized Poincaré bundle and Mumford map.


### 0.24 Bounded metric families for point heights

Let X be a projective variety over a generalized global field K and L a line bundle. Choose a presentation L=M⊗N⁻¹ with M,N generated by finitely many K-sections. Give each generated bundle the pullback sup metric from O(1), so in a local frame e its norm is 1/max_i|s_i/e|_v; tensor and dual give a reference metric m⁰_v on L. A bounded point-metric family consists of continuous fibre norms m_v with m_v(aℓ)=|a|_v m_v(ℓ), m_v(ℓ)>0 for ℓ≠0, and bounds c_v≥0 for d_v(m_v,m⁰_v)=sup_x|log(m_v/m⁰_v)(x)|≤c_v, where Σ_v n_v c_v<∞. The ratio is independent of a nonzero local frame. Bounds range over geometric local points, hence are uniform under finite extensions, with the extension weights of §0.11 (The normalised projective height). Changing the finite generating presentation gives an equivalent class of families. Tensor product, dual and pullback preserve this class. Each single-place space is complete for d_v. This is a point-height metric interface; it does not define arithmetic intersections or semipositivity of higher-dimensional cycles.

Use nontrivial genuine absolute values and the product-formula weights of §0.9 (Generalized global fields); at a complex place take the usual complex norm with its weight, rather than treating its square as a norm satisfying the usual triangle inequality. Continuity is in local trivializations. A metric extending continuously to the proper analytification may be used with its bounded-ratio certificate; bare continuity on X(K̄_v) is not a substitute for that certificate. For the nonarchimedean case all norms are interpreted over the completed algebraic closure. X is projective and nonempty; the empty-space case is the unique metric datum with distance zero. Algebraic point-height sums are evaluated over a finite field of definition, not as an unweighted sum over all extensions of a place. Metrics on geometric local fibres are equivariant under continuous K_v-automorphisms of the completed algebraic closure (including complex conjugation over a real place). Finite-extension metrics are obtained by base change, with norms and log-ratio bounds raised or scaled when the chosen normalized absolute value is a power of the restricted one. Thus the value at an algebraic point is independent of local embeddings and the weighted sum is compatible with §0.12 (Heights under finite extension of the base field).

([Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), §5.1.2 and Theorem 5.1.13, pp.96,100–101; §5.2.15–18, pp.108–109; Example 5.3.20, p.117.)

Use the globally generated difference presentation from the scheme line-bundle supplier. The quotient sup norm is independent of a local frame by homogeneity, since the generating sections have no common zero. The tensor quotient gives a reference metric for an arbitrary L.

On each patch where a generating section is largest, the remaining normalized coordinates have norm at most one. Comparing two generating presentations by polynomial identities and the no-common-zero relations gives local bounds in terms of finitely many K-coefficients. They vanish outside a finite set of nonarchimedean places; the archimedean constants have finite total weight. Thus the weighted bounds are summable and independent of the point or its finite field of definition. This is the point case of Gubler §5.2.17–18, made explicit rather than appealing to bare algebraic-point continuity.

For a fixed reference metric, another metric is exp(u) times it for a bounded continuous real function u. The sup distance is the norm of u−u′. A uniformly Cauchy sequence has a uniform limit since ℝ is complete; this limit is bounded and continuous and its exponential is a positive metric. This proves completeness without assuming the algebraic local point set compact. The subspace of equivariant functions is closed under uniform limits, so it is complete as well.

Tensor and dual add or negate log ratios, and pullback cannot increase their sup bound. Extend weights and norms to a finite field by §0.12 (Heights under finite extension of the base field); the total mass above each place recovers its original mass.

Its interface consists of the following operations and laws.

- `TauCeti.PointHeightMetricFamily`: Galois-equivariant fibre norms, continuity, the generating reference, finite-extension compatibility and summable uniform log-ratio certificates.
- `TauCeti.PointHeightMetricFamily.dist`: d_v is the sup of the absolute log ratio and is finite; it is invariant under changing a frame.
- `TauCeti.PointHeightMetricFamily.complete`: At one place the space of bounded continuous metrics is complete for d_v.
- `TauCeti.PointHeightMetricFamily.tensor`: Tensor adds logarithmic norms and d_v(m⊗n,m′⊗n′)≤d_v(m,m′)+d_v(n,n′).
- `TauCeti.PointHeightMetricFamily.dual`: Dual negates logarithmic norms and preserves d_v.
- `TauCeti.PointHeightMetricFamily.pullback`: Pullback along a morphism of projective varieties is a metric family, with d_v(f*m,f*m′)≤d_v(m,m′).
- `TauCeti.PointHeightMetricFamily.height`: The sum of −log norms at a rational point represents the Weil height; changing metrics changes it by at most Σ_v n_v d_v.
- `TauCeti.PointHeightMetricFamily.ofGenerators`: For L generated by finitely many K-sections s_0,…,s_n, the sup metric with ‖e‖_v=1/max_i|s_i/e|_v in a local frame e, at every place, is a bounded point-metric family; for O(1) on ℙⁿ with the coordinate sections it is the metric of test_sup.
- `TauCeti.PointHeightMetricFamily.dist_ofGenerators_le`: Two finite generating families of the same L give sup metrics whose distance d_v is bounded by constants vanishing at all but finitely many nonarchimedean places, so Σ_v n_v d_v<∞.

**Checks.**

- `PointHeightMetricFamily.test_sup`: For O(1) on ℙⁿ the norm of x₀ at [x] is |x₀|_v/max_i|x_i|_v; multiplying all coordinates by a nonzero scalar leaves it unchanged.
- `PointHeightMetricFamily.test_trivial`: On O_X the norm of 1 equal to 1 at every place gives height zero.
- `PointHeightMetricFamily.test_height`: At [1:2] over ℚ, the reference O(1) metric gives height log 2, agreeing with §0.11 (The normalised projective height) and the native absolute projective height.
- `PointHeightMetricFamily.test_constants`: Rescale the trivial norm at the real place of ℚ by exp(1) and leave the finite places fixed: the family is admissible but its point height is −1, not zero. Rescaling by exp(1) at every prime fails summability and is not admissible.
- For a nonzero rational section s and P outside its divisor, Σ_v n_v(−log m_v(s(P))) converges absolutely and gives a representative of h_{K,L}. Compare first with the sup-metric reference and then with the summable bounds.

*Needs:* §0.11 (The normalised projective height); §0.12 (Heights under finite extension of the base field); §0.16 (Heights along morphisms to projective space); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.25 Canonical point metrics by contraction

For a projective X/K, a morphism f:X→X and a K-isomorphism θ:f*L≃L^q with integer q>1, there is a unique bounded continuous metric m̂_v at each place making θ an isometry. These metrics form a bounded point-metric family. With Φ_v(m)=(θ_*f*m)^(1/q), d_v(Φ_v(m),Φ_v(m′))≤d_v(m,m′)/q. If c_v=d_v(m⁰_v,Φ_v(m⁰_v)), then d_v(Φ_v^j(m⁰_v),m̂_v)≤q^(−j)c_v/(1−1/q). For an abelian variety take f=[2], q=4 for a symmetric rigidified L and q=2 for an antisymmetric rigidified L, using the cube isomorphism. For arbitrary rigidified L, canonical metrics on L⁺=L⊗[-1]*L and L⁻=L⊗([-1]*L)⁻¹ induce the metric on L by the square root of their tensor product under L²≃L⁺⊗L⁻. No K-rational even/odd square-root decomposition is assumed.

Use §0.24 (Bounded metric families for point heights) and the same K-isomorphism θ at all places. For the abelian case the rigidification fixes the cube isomorphisms, and L⁺ is symmetric while L⁻ is antisymmetric. The geometric contraction applies to q>1, not q=1. For a general dynamical system this constructs a canonical point height; only the abelian specialization is a Néron–Tate height.

([Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), Theorem 5.1.13 and Examples 5.1.14–15, pp.100–101; Theorem 5.3.13 and Remark 5.3.14, p.114; Example 5.3.20 and Theorem 5.3.24, pp.117–119.)

The starting reference family and its transform by algebraic f and θ have a summable distance bound, by the finite-presentation coefficient estimates in §0.24 (Bounded metric families for point heights). Identify the one-place metric space with bounded continuous real functions relative to its reference metric.

Apply native ContractingWith.exists_fixedPoint to Φ_v with contraction factor 1/q. Finite distance and completeness give a fixed point, uniform convergence of iterates, and the geometric error bound. Uniqueness follows by d≤d/q. Uniform limits preserve continuity. The reference metrics and Φ_v are Galois equivariant; uniqueness also preserves the finite-extension compatibility.

Sum the geometric error bounds over places; the limit remains an admissible family and exchanging the sum with the limit is justified by Σ_v n_v c_v/(1−1/q)<∞. This is Gubler Theorems 5.1.13 and 5.3.13 in the point case.

Tensor products, duals and homomorphism pullbacks of abelian canonical metrics satisfy the same cube equations, so uniqueness supplies their compatibility. Apply the symmetric and antisymmetric constructions to L⁺,L⁻ and the genuine isomorphism L²≃L⁺⊗L⁻; positive norms have a unique square root.

If θ is replaced by αθ, with α∈K×, the new norm is |α|_v^(−1/(q−1)) times the old one, so its local height changes by log|α|_v/(q−1). The product formula cancels these particular global changes. Independent place constants need not cancel. Summing the isometry equation gives ĥ(fP)=q ĥ(P), and bounded comparison with a Weil height identifies the sum uniquely with the Tate limit.

Its interface consists of the following operations and laws.

- `TauCeti.canonicalPointMetric`: The unique metric for (f,L,θ,q) at each place, with q>1.
- `TauCeti.canonicalPointMetric_isometry`: θ:f*L≃L^q is an isometry.
- `TauCeti.canonicalPointMetric_error`: d_v(Φ_v^j(m⁰_v),m̂_v)≤q^(−j)c_v/(1−1/q).
- `TauCeti.canonicalPointMetric_change_isomorphism`: Changing θ to αθ scales the metric by |α|_v^(−1/(q−1)).
- `TauCeti.canonicalPointMetric_abelian_tensor`: Rigidified abelian canonical metrics commute with tensor, dual and homomorphism pullback.
- `TauCeti.canonicalPointMetric_sum`: With global cube isomorphisms their sum is ĥ_{K,L}, including the half-sum for L⁺,L⁻.

**Checks.**

- `canonicalPointMetric.test_power`: For [x_i]↦[x_i^q] on ℙⁿ and its standard O(1) isomorphism the sup metric is fixed exactly.
- `canonicalPointMetric.test_trivial`: The trivial rigidified bundle on an abelian variety has canonical norm 1 and height zero.
- `canonicalPointMetric.test_rescaling`: For q=4, changing θ to αθ changes λ̂_v by +(1/3)log|α|_v; the global weighted change is zero.
- `canonicalPointMetric.test_q_one`: For f=id,L=O_X,q=1 and θ=id, every constant positive norm is fixed, so the uniqueness theorem cannot include q=1.
- `canonicalPointMetric.test_elliptic`: For O(O) on an elliptic curve, the globally normalized canonical metric sum is native canonicalHeight, not twice it.
- For abelian varieties the global sum at P is the existing §0.21 (The Néron–Tate canonical height), for each symmetric and antisymmetric component and hence every line bundle.

*Needs:* §0.24 (Bounded metric families for point heights); §0.20 (Tate's limit); §0.21 (The Néron–Tate canonical height); AbelianSchemesAndArithmeticModuli §A1.5, relativeCube and multiplication pullbacks; Mathlib `ContractingWith.exists_fixedPoint`.


### 0.26 Local Weil functions and Néron functions

For a Cartier divisor D on a projective variety X/K and a bounded point-metric family m on O(D), put λ_{D,v}(P)=−log m_v(s_D(P)) on X(K̄_v)∖|D|, where s_D is its canonical rational section. If s_D=f e in a local nonvanishing frame, then λ=−log|f|_v−log m_v(e). Two admissible metrics give a bounded difference at each place and a summable uniform bound on the global difference. Tensor and pullback give local additivity and functoriality exactly for the transported metrics, and modulo bounded functions for independently chosen metrics. Canonical-point-metrics on an abelian variety give local Néron functions. If θ:[2]*O(D)≃O(D)^q is the chosen global isomorphism and θ([2]*s_D)=a_D s_D^q, then λ̂_{D,v}(2P)=qλ̂_{D,v}(P)−log|a_D(P)|_v where both sides are defined; q=4 for symmetric and q=2 for antisymmetric rigidified bundles. The normalized weighted global sum is ĥ_{K,O(D)}. Product-formula cancellation applies to principal logarithms and rescalings from a global K-isomorphism; arbitrary summable place constants have a global sum which need not vanish.

K and n_v follow §0.9 (Generalized global fields) and §0.11 (The normalised projective height). Evaluate the global sum over a finite field of definition with its normalized weights; D is a Cartier divisor and P avoids its support. Local metrics carry the bounded and summable certificates of §0.24 (Bounded metric families for point heights). Continuity on algebraic local points alone implies neither certificate. Canonical metrics use rigidifications and global cube isomorphisms; a change of arbitrary local constants preserves the global canonical normalization only when their weighted sum is zero.

([Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), §5.1.2, Theorem 5.1.13 and Example 5.1.15, pp.96,100–101; §5.2.15–18, pp.108–109; Theorem 5.3.13 and §5.3.20–24, pp.114,117–119; [Computing canonical heights on elliptic curves in quasi-linear time](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf), §2–3, Remark 3.1 and Proposition 3.2, author manuscript pp.2–4.)

Use §0.24 (Bounded metric families for point heights) to build the metric of O(D) from generated-bundle presentations and summable bounded changes. Homogeneity shows the frame formula independent of trivialization; dividing two norms removes the divisor singularity and bounds the difference.

At a rational point the sup-metric reference sums to the projective height of the generating presentation, hence to h_{K,O(D)}. The summable uniform perturbation bound proves absolute convergence and the same height class. Changing s_D by f changes the sum by −Σ_v n_v log|f(P)|_v=0.

Canonical-point-metrics gives the local exact [2] isometry. Apply it to the section identity θ([2]*s_D)=a_D s_D^q to obtain the displayed logarithmic equation. Its correction sums to zero by the product formula, so the global sum is homogeneous and differs boundedly from a Weil height; Tate-limit uniqueness identifies it with ĥ. The half-sum of the symmetric and antisymmetric metrics handles arbitrary L.

For an elliptic Weierstrass equation W, distinguish the cube-metric function ν_v from the equation-independent Silverman normalization λ^Sil_v. Müller–Stoll Remark 3.1 and Proposition 3.2 pp.4 give ν_v=(1/2)λ^MS_v and λ^Sil_v=ν_v−(1/12)log|Δ(W)|_v. In the parameter t=−x/y, ν_v+log|t|_v tends to zero; ν_v(2P)=4ν_v(P)−log|ψ₂(P)|_v. The Silverman function has the additional +(1/4)log|Δ| term. The discriminant shift has weighted sum zero by the product formula, so both sum to the native (O)-canonical height. This local constant shift changes the fixed-isomorphism equation; it is not equality of the two local functions.

Its interface consists of the following operations and laws.

- `TauCeti.LocalWeilFunction`: The norm-derived local function for (X,D,v) and a bounded point-metric family, with frame-independent logarithmic formula and summable uniform ambiguity.
- `TauCeti.LocalWeilFunction.add`: λ_{D+E,v} = λ_{D,v} + λ_{E,v} up to bounded functions.
- `TauCeti.LocalWeilFunction.pullback`: λ_{f*D,v} = λ_{D,v}∘f up to bounded functions.
- `TauCeti.neronFunction`: Local functions from the rigidified canonical metric, with q=4 or q=2 multiplication equation, and general bundles through the half-sum construction.
- `TauCeti.neronTateHeight_eq_sum_neronFunction`: ĥ_{K,O(D)}(P)=Σ_v n_v λ̂_{D,v}(P) off D for globally normalized cube isomorphisms. Further independent constant changes preserve equality exactly when their weighted sum vanishes.
- `TauCeti.neronFunction_principal`: λ̂_{div(f),v} = −log|f|_v + constant.

**Checks.**

- `LocalWeilFunction.test_projective_hyperplane`: On ℙⁿ with D = {x₀ = 0}, λ_{D,v}(x) = log(max_i|x_i|_v/|x₀|_v) is a local Weil function.
- `LocalWeilFunction.test_principal`: For D = div(f), λ = −log|f|_v is a local Weil function and its global sum vanishes by the product formula.
- `LocalWeilFunction.test_global_sum`: Σ_v n_v λ_{D,v} represents h_{K,O(D)} on X(K) ∖ |D|.
- `LocalWeilFunction.test_elliptic_normalisation`: For P and 2P both different from O, ν_v=(1/2)λ^MS_v satisfies ν_v(2P)=4ν_v(P)−log|ψ₂(P)|_v. The equation-independent normalization λ^Sil_v=ν_v−(1/12)log|Δ|_v satisfies λ^Sil_v(2P)=4λ^Sil_v(P)−log|ψ₂(P)|_v+(1/4)log|Δ|_v. Both differ boundedly from (1/2)log⁺|x(P)|_v and have the same global sum, native canonicalHeight; they need not be the same local function.
- `LocalWeilFunction.test_not_bounded`: For D≠0 effective and an analytic path approaching a smooth geometric point of its support from the complement, the norm-derived function is unbounded above; for example λ_{(0),v}(t)=−log|t|_v+O(1). A bounded function cannot satisfy this local equation. The condition includes a point approachable from the complement.
- `LocalWeilFunction.test_constant_change`: For D=0 on a projective variety over ℚ, choose λ_∞=1 and λ_p=0. This is an admissible local Weil family whose global sum is 1; the product formula does not turn it into the zero canonical height.
- For E and D=(O), the local metric function agrees with the classical Néron local height after the stated normalization by a place constant. Its global normalized sum is native canonicalHeight.

*Needs:* §0.17 (Weil's height machine); §0.20 (Tate's limit); §0.21 (The Néron–Tate canonical height); §0.24 (Bounded metric families for point heights); §0.25 (Canonical point metrics by contraction).


### 0.27 Multiplication by two is given by quartic forms

Prove `TauCeti.AbelianVariety.exists_quartic_duplication`. Let A be an abelian variety over a field, embedded in ℙⁿ by the complete linear system of a symmetric very ample L such that the embedding is projectively normal. Then [2] : A → A is given by homogeneous polynomials f₀, …, f_n of degree 4 without common zero on A. Consequently h∘[2] = 4h + O(1) is exhibited by explicit forms, and [2^l] is given by forms of degree 4^l.

L symmetric and very ample, the embedding projectively normal.

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), proof of Proposition 4.3, pp. 19–20, (4.11), citing Waldschmidt 1987; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), §2.2 (A2), p. 11; §9.1, p. 47.)

[2]*L ≅ L^{⊗4}; projective normality makes H⁰(ℙⁿ, O(4)) → H⁰(A, L^{⊗4}) surjective, so the pulled-back coordinates are restrictions of quartics; they have no common zero since [2] is a morphism (Serre, in Waldschmidt Appendix II, Corollary 2, as cited by Dimitrov–Gao–Habegger).

**Checks.**

- For an elliptic curve E embedded in ℙ³ by the symmetric very ample bundle O(4·O), duplication is given by four quartic forms in the coordinates.

*Needs:* §0.21 (The Néron–Tate canonical height); AbelianSchemesAndArithmeticModuli §A1.5, relativeCube and multiplication pullbacks.


### 0.28 The Silverman–Tate theorem in families

Prove `TauCeti.AbelianScheme.silvermanTate`. Let S be a regular irreducible quasi-projective variety over ℚ̄ with a projective compactification S ⊆ S̄ ⊆ ℙᵐ, π : 𝒜 → S an abelian scheme with a closed immersion 𝒜 → ℙⁿ × S, and L = O(1,1)|_𝒜 symmetric on the generic fibre. There is c > 0 with |ĥ_{𝒜_{π(P)}}(P) − h(P)| ≤ c·max{1, h_{S̄}(π(P))} for all P ∈ 𝒜(ℚ̄), where ĥ is the fibrewise Néron–Tate height of L and h the height on ℙⁿ × ℙᵐ.

Abelian scheme over a regular quasi-projective base over ℚ̄; L the restriction of O(1,1), symmetric on the generic fibre; line bundles rather than Weil divisors, so no smoothness of S̄ is needed.

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), Theorem A.1 and proof, pp. 36–40; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 10.1, (10.2), p. 51.)

Duplication estimate (§0.29 (The duplication estimate in families)) gives |h([2]P) − 4h(P)| ≤ c₁·max{1, h_{S̄}(π(P))}.

Telescoping as in §0.20 (Tate's limit) with a base-dependent constant gives the bound with c = c₁/3.

**Checks.**

- For the constant family A×S with Segre height h(P,s)=h_A(P)+h_S(s), the error is ĥ_A(P)−h_A(P)−h_S(s); dependence on the base height is necessary.

*Needs:* §0.29 (The duplication estimate in families); §0.20 (Tate's limit); §0.21 (The Néron–Tate canonical height).


### 0.29 The duplication estimate in families

Prove `TauCeti.AbelianScheme.duplication_estimate`. In the situation of §0.28 (The Silverman–Tate theorem in families) there is c₁ > 0 with |h([2]P) − 4h(P)| ≤ c₁·max{1, h_{S̄}(π(P))} for all P ∈ 𝒜(ℚ̄).

As in §0.28 (The Silverman–Tate theorem in families).

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), Proposition A.2 and proof, pp. 37–40.)

Close the graph of [2] to 𝒜'; F' = [2]*L ⊗ L^{⊗−4} is trivial on the generic fibre, hence a pullback from S up to boundary divisors.

Resolve S̄ and the closure of 𝒜 (Hironaka) and bound a Cartier divisor supported over the boundary by pullbacks of effective divisors avoiding a given π(P); finitely many choices cover S.

Compare heights on the resolution with h_{S̄} by the Height Machine on the projective base.

**Checks.**

- For the constant family with Segre height, h([2]P,s)−4h(P,s)=h_A([2]P)−4h_A(P)−3h_S(s), so a uniform bound independent of s is false.

*Needs:* §0.17 (Weil's height machine); §0.27 (Multiplication by two is given by quartic forms); §0.18 (Heights are bounded below off the base locus).


### 0.30 The fibrewise Néron–Tate height depends only on the generic fibre

Prove `TauCeti.AbelianScheme.fibreNeronTate_indep`. Let π : 𝒜 → S be an abelian scheme over a normal integral locally noetherian base and L, L' line bundles on 𝒜 whose restrictions to the generic fibre are both isomorphic to L₀^{⊗l}. Then L' ⊗ L^{-1} is the pullback of a line bundle on S, so L|_{𝒜_s} ≅ L'|_{𝒜_s} for every s and the fibrewise Néron–Tate heights agree; ĥ_{𝒜,L₀} depends only on L₀.

S irreducible (normal for the descent of line bundles); l ≥ 1. Normal integral locally noetherian base, and the generic-trivial descent theorem for invertible sheaves in this abelian-scheme setting (DGH Remark 3.2 and Appendix A, invoking EGA IV₄ 21.4.13). This theorem is a generic-trivial descent contract above; reduced-base seesaw alone is not a substitute.

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), Remark 3.2, p. 14.)

A line bundle on 𝒜 trivial on the generic fibre is a pullback from S (EGA IV 21.4.13 / the seesaw principle with rigidification, AbelianSchemesAndArithmeticModuli A1.4), so fibres agree.

§0.21 (The Néron–Tate canonical height) depends only on the isomorphism class on each fibre.

**Checks.**

- Twisting L by π*M for M on S does not change any fibrewise height.

*Needs:* §0.21 (The Néron–Tate canonical height); AbelianSchemesAndArithmeticModuli §A1.4, relativeSeesaw; additionally generic-trivial bundle descent above.


### 0.31 Silverman's height limit theorem

Prove `TauCeti.AbelianScheme.tendsto_specialization`. Let S be a smooth projective curve over ℚ̄ with function field K = ℚ̄(S), π : 𝒜 → S° an abelian scheme over a dense open S° with generic fibre A/K, L symmetric ample. For x ∈ A(K̄) represented by a section σ_x : S' → 𝒜 over a generically finite ρ : S' → S, ĥ_{𝒜_{ρ(t)}}(σ_x(t)) / h_S(ρ(t)) → ĥ_{K,A}(x) as h_S(ρ(t)) → ∞, with h_S = h∘ι/deg S for an embedding ι and ĥ_{K,A} the function-field Néron–Tate height (§0.10 (Polarized function fields as generalized global fields) structure on K). Heights on curves are quasi-equivalent: h_S∘ρ/h_{S'} → deg ρ, and ĥ_{K',A_{K'}} = [K':K]·ĥ_{K,A}.

S a smooth projective curve over ℚ̄; the abelian scheme over a dense open subset; L symmetric ample on the generic fibre.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), Theorem 11.1, (11.1)–(11.2) and proof, pp. 52–53.)

Silverman's Theorem B (Crelle 342) as presented by Gao–Habegger Theorem 11.1, with Conrad Remark 9.2 for the base change of function-field heights. Bombieri–Gubler Corollary 9.3.10 is an unverified bibliographic cross-reference; it supplies no additional hypothesis or proof step here.

**Checks.**

- For a constant family A₀ × S with x a constant point, both sides are 0.

*Needs:* §0.28 (The Silverman–Tate theorem in families); §0.10 (Polarized function fields as generalized global fields); §0.21 (The Néron–Tate canonical height); §0.12 (Heights under finite extension of the base field).


### 0.32 Heights under generically finite dominant maps

Prove `TauCeti.weilHeight_dominant_lower_bound`. Let f : X' → X be a dominant generically finite morphism of varieties over ℚ̄ (or an equidimensional dominant rational map), with heights h' and h from ample line bundles on projective compactifications. There are c > 0, c' and a dense Zariski open U ⊆ X' with h(f(P)) ≥ c·h'(P) − c' for P ∈ U(ℚ̄). The inequality holds only on U: it is not a global two-sided comparison.

X', X varieties over ℚ̄; f dominant and generically finite.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 9.1, p. 49, citing Silverman 2011.)

Silverman 2011 (J. Ramanujan Math. Soc. 26), as cited by Gao–Habegger: compare f*L with an ample bundle on a blow-up and apply §0.18 (Heights are bounded below off the base locus) off the exceptional locus.

**Checks.**

- For f : ℙ¹ → ℙ¹, x ↦ x², U = ℙ¹ and c = 2.

*Needs:* §0.17 (Weil's height machine); §0.18 (Heights are bounded below off the base locus).


### 0.33 Heights of subvarieties over polarized function fields

Let K/k be finitely generated with k algebraically closed, (S, M) a polarization of K/k, A an abelian variety over K with a symmetric ample line bundle L, and (𝒜, π, ℒ) an integral model over S (𝒜 projective over k, π : 𝒜 → S projective with generic fibre A, ℒ extending L). For a closed subvariety X ⊆ A with closure 𝒳 ⊆ 𝒜, the naive height is h_{(𝒜,ℒ)}(X) = (ℒ^{dim X+1} · (π*M)^{dim S−1} · 𝒳) / ((1 + dim X)·deg_L X). The canonical height ĥ_L(X) = lim n^{−2} h_{(𝒜,ℒ)}([n]X) exists, depends on (S, M) and L but not on the model, is ≥ 0, and for a point x it is the Néron–Tate height ĥ_{K,L}(x) of the §0.10 (Polarized function fields as generalized global fields) structure. For X' ⊆ A_{K̄}, ĥ(X') := ĥ of its image in A.

K/k finitely generated with trdeg ≥ 1 and k algebraically closed; integral models exist after shrinking S (spreading out).

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §1.1, (1.1)–(1.3), pp. 2–3; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §3.1–3.6, Theorems 3.4 and 3.6, pp. 6–8 (arXiv v2).)

Intersection numbers on 𝒜 from SchemeAndStackFoundations Layer 5; existence of the limit and independence of the model by Gubler's theory of canonical heights over M-fields (Gubler 2007 Theorem 3.4 and §3.5–3.6; Gubler 2003 Theorem 11.18).

Non-negativity: take ℒ ample (Xie–Yuan (1.2)–(1.3)).

Points: §0.36 (Model heights are M_K-field heights) identifies the point case with ĥ_{K,L}.

Its interface consists of the following operations and laws.

- `TauCeti.IntegralModel`: An integral model (𝒜, π, ℒ) of (A, L) over a polarization (S, M).
- `TauCeti.naiveSubvarietyHeight`: h_{(𝒜,ℒ)}(X) by the intersection-number formula.
- `TauCeti.canonicalSubvarietyHeight`: ĥ_L(X) = lim n^{−2} h_{(𝒜,ℒ)}([n]X).
- `TauCeti.canonicalSubvarietyHeight_model_indep`: ĥ_L(X) does not depend on the integral model.
- `TauCeti.canonicalSubvarietyHeight_nonneg`: ĥ_L(X) ≥ 0.
- `TauCeti.canonicalSubvarietyHeight_point`: For a point x, ĥ_L({x}) = ĥ_{K,L}(x).
- `TauCeti.canonicalSubvarietyHeight_translate_torsion`: ĥ_L(X + t) = ĥ_L(X) for torsion t.

**Checks.**

- `canonicalSubvarietyHeight.test_abelian_subvariety`: ĥ_L(B) = 0 for every abelian subvariety B ⊆ A.
- `canonicalSubvarietyHeight.test_point_origin`: ĥ_L({0}) = 0.
- `canonicalSubvarietyHeight.test_point`: For a point x ∈ A(K), ĥ_L({x}) equals the Néron–Tate height for the §0.10 (Polarized function fields as generalized global fields) structure of (S, M).
- `canonicalSubvarietyHeight.test_naive_not_canonical`: The naive height of a translate x + B by a non-torsion x of positive height can be nonzero while ĥ_L(B) = 0; the naive height is not translation invariant.
- When trdeg K/k = 1, S is the unique smooth projective model and M plays no role.

*Needs:* §0.10 (Polarized function fields as generalized global fields); §0.21 (The Néron–Tate canonical height); §0.20 (Tate's limit); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.34 Laws for function-field canonical heights

Prove `TauCeti.canonicalSubvarietyHeight_laws`. For A over K = k(S) with polarization (S, M): point canonical heights are additive in symmetric line bundles, satisfy ĥ_{φ*L}(x) = ĥ_L(φ(x)) for homomorphisms φ, and ĥ_{p₁*L₁⊗p₂*L₂}(x, y) = ĥ_{L₁}(x) + ĥ_{L₂}(y); for symmetric ample L, L' there are c, C > 0 with c·ĥ_L ≤ ĥ_{L'} ≤ C·ĥ_L on A(K̄). For cycles, the unnormalised mixed canonical height H_{L₀,…,L_d}(Z) is multilinear and H_{φ*L₀,…,φ*L_d}(Z) = H_{L₀,…,L_d}(φ_*Z); when φ|_Z is generically finite onto its image of dimension d the degree factor cancels in the normalised height. Changing the ample base polarization (on a common projective model) changes heights by two-sided bounded factors and preserves density of small points.

K = k(S) with S normal projective over algebraically closed k and M ample; L, L' symmetric ample.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), pp. 2–3, 24, 26; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §§2.10, 3.1–3.6, pp. 5–8.)

Point laws: §0.21 (The Néron–Tate canonical height) applied to the §0.10 (Polarized function fields as generalized global fields) structure.

Comparison: L'^{⊗N} ⊗ L^{−1} and L^{⊗N} ⊗ L'^{−1} are ample for N large, and canonical heights of ample symmetric bundles are ≥ 0.

Cycle laws: Gubler 2003 Theorem 11.18(a)–(e) and Gubler 2007 §§2.10, 3.1–3.6 for mixed heights; projection formula (Layer 5).

Keep normalized heights separate from arithmetic intersection degrees: for generically finite f, the unnormalized pushforward intersection scales by deg(f), while a degree-normalized height cancels that factor. State all line bundles and dimensions in each API.

**Checks.**

- For φ = [n], ĥ_{[n]*L} = n²ĥ_L for symmetric L.

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.21 (The Néron–Tate canonical height); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.35 Function-field heights under finite and constant field extensions

Prove `TauCeti.canonicalSubvarietyHeight_baseChange`. Let K = k(S) with S a smooth projective curve over algebraically closed k, and K'/K finite with S' the normalisation of S in K'. Recomputing heights with the model S' gives ĥ_{S'}(x) = [K':K]·ĥ_S(x), and the same scaling for subvarieties with pulled-back line bundles; the degree includes the inseparable degree. Under an extension l/k of algebraically closed fields, intersection numbers of base-changed proper schemes and canonical heights of geometrically integral subvarieties are unchanged. Consequently density of small points is invariant under finite extension of K and extension of algebraically closed constants.

S a smooth projective curve; k algebraically closed; k ⊆ l algebraically closed.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), (1.1)–(1.3), pp. 2–3; pp. 17–18, 22–25; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Lemma 8.6, and §9, Remark 9.2.)

Points: projection formula for S' → S and [K'(x):K] = [K'(x):K'][K':K] (Conrad Lemma 8.6 and Remark 9.2).

Subvarieties: projection formula for intersection numbers under finite maps (Layer 5).

Constant extension: intersection numbers are invariant under flat base change of the ground field.

**Checks.**

- Distinguish: enlarging only the field of definition of x inside one normalised height does not change ĥ; recomputing with S' multiplies by [K':K].

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.10 (Polarized function fields as generalized global fields); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 0.36 Model heights are M_K-field heights

Prove `TauCeti.modelHeight_eq_admissibleHeight`. For K = k(S), S normal projective over algebraically closed k and M ample, give K the §0.10 (Polarized function fields as generalized global fields) structure of (S, M). For a projective K-variety X with a line bundle L and a projective model (𝒳, ℒ) over S, the model intersection height of points and subvarieties equals the M_K-field height with model metrics, up to bounded functions for points; Tate's limit identifies the canonical height of §0.33 (Heights of subvarieties over polarized function fields) with the canonical-metric Néron–Tate height H_L(X)/((dim X + 1)·deg_L X). For S a curve the closed-point weights are 1 and the formula agrees with the function-field point height of Gao–Habegger §2.1, including the denominator [K(x):K].

As in §0.10 (Polarized function fields as generalized global fields); models projective over S.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), (1.1)–(1.3), pp. 2–3; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §3.1, Theorem 3.4(e), §§3.5–3.6, pp. 6–8; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), §2.1, pp. 9–10.)

Gubler 2007 Theorem 3.4(e) identifies model heights and sums of local heights; Theorem 3.6(d) with the Tate limit identifies canonical heights; keep the unnormalised mixed height until the final division.

**Checks.**

- For X = ℙⁿ_K with its standard model ℙⁿ_S the model height of a point is h_{K,n}.

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.26 (Local Weil functions and Néron functions); §0.11 (The normalised projective height).


### 0.37 Canonical heights under everywhere good reduction

Prove `TauCeti.canonicalSubvarietyHeight_eq_of_goodReduction`. Let S be a smooth projective curve over algebraically closed k, K = k(S), A/K with everywhere good reduction and 𝒜 → S the abelian scheme extending it. A symmetric ample L on A extends to a symmetric rigidified ℒ on 𝒜, and for every closed subvariety X ⊆ A with closure 𝒳, h_ℒ(X) = ℒ^{dim X+1}·𝒳/((dim X + 1)·deg_L X) satisfies h_ℒ([n]X) = n²·h_ℒ(X); hence it equals ĥ_L(X).

Everywhere good reduction over a complete curve S.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §4.3, pp. 21–22.)

Extend a divisor of L and subtract π*e*ℒ' to rigidify; symmetry follows from rigidification since ℒ − [−1]*ℒ is a pullback from S (§0.30 (The fibrewise Néron–Tate height depends only on the generic fibre)) and trivial along the zero section.

[n]*ℒ ≅ ℒ^{⊗n²} on 𝒜 by the cube theorem over S (AbelianSchemesAndArithmeticModuli A1.5); the projection formula gives the scaling.

**Checks.**

- For a constant abelian variety A = A₀ × S, h_ℒ(X) = 0 for constant X.

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.30 (The fibrewise Néron–Tate height depends only on the generic fibre); AbelianSchemesAndArithmeticModuli §A1.5, relativeCube and multiplication pullbacks.


### Examples

On ℙ¹(ℚ), primitive coordinates (a,b) modulo simultaneous sign give `h([a:b])=log max(|a|,|b|)`. The points of height at most log 2 are `[0:1]`, `[1:0]`, `[1:1]`, `[-1:1]`, `[2:1]`, `[-2:1]`, `[1:2]`, `[-1:2]`, eight points. At height zero there are four. On ℙ⁰ there is one point, so the n=0 case is Northcott without a positivity assumption on the bound. Over ℂ(t), infinitely many constants have height zero; the number-field hypothesis in Northcott cannot be removed.

The functions n and n+7 on ℕ have the same height class. The alternating function (−1)^n also has zero class, although it is not constant. Tate's limit for the identity map, d=2 and constant function 1 is zero. For the successor map with d=1 the normalized iterates at zero are m and have no finite limit.

For an elliptic curve and its bundle O(O), use the native canonical height. For O(2O) it is twice that value. Our diagonal pairing gives twice the O(O)-height, while the native pairing gives exactly that height. For a constant abelian variety over a polarized function field, constant points have canonical height zero; this becomes the trace contribution in Layer 1.



### Dependencies

Mathlib's native bounded submodule and quotient APIs, admissible absolute values, scalar/tuple heights, Northcott and polynomial height inequalities; DiophantineApproximationAndTranscendence §§0.2–0.3; SchemeAndStackFoundations §§0.8–0.9, 3.4, 5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2; AbelianSchemesAndArithmeticModuli §§A1.4–A1.5 and A2.2–A2.8. The family, metric and cycle branches use their additional contracts stated above.



## Layer 1: Kummer descent, Mordell–Weil and the trace

The Kummer map uses the finite-flat kernel of an isogeny and its fibre torsors. Its local images are unramified away from bad reduction and kernel primes. Finiteness of the corresponding Selmer group yields weak Mordell–Weil; the independent height descent yields finite generation. The trace removes constant points in the function-field statements. Two-coverings retain their maps to a fixed torsor, so they are distinguished from their finite fibres and from unmarked four-coverings.


### 1.1 Kummer maps of isogenies of abelian varieties

Let φ : A → B be an isogeny of abelian varieties over a field K with kernel A[φ] (a finite commutative K-group scheme). The fppf exact sequence 0 → A[φ] → A → B → 0 gives the Kummer map δ_φ : B(K)/φ(A(K)) ↪ H¹_fppf(K, A[φ]), an injective group homomorphism, natural in K and in φ, whose value at b is the class of the A[φ]-torsor φ^{-1}(b). When deg φ is prime to char K, A[φ] is étale and H¹_fppf(K, A[φ]) = H¹(G_K, A[φ](K^sep)) (continuous cohomology with the discrete module), so δ_φ is the Galois Kummer map; for φ = [n] it is A(K)/nA(K) ↪ H¹(K, A[n]).

φ an isogeny (finite flat surjective homomorphism); fppf cohomology of a field. Galois description only when deg φ is invertible in K. The finite étale degree and Galois-cohomology descriptions require n invertible in k; in residue characteristic dividing n retain only the fppf formulation, with finiteness a separate finiteness requirement.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, Theorem 8.4.9 and its proof, pp. 242–243; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.10(i), p. 182.)

φ is finite flat and surjective, hence an fppf epimorphism of sheaves; the long exact sequence of fppf cohomology over Spec K gives B(K) → H¹(K, A[φ]) with kernel φ(A(K)) (SchemeAndStackFoundations Layer 2 sheaf cohomology; torsor description Layer 1/torsor-cohomology).

The evaluation description: the fibre φ^{-1}(b) is an A[φ]-torsor over K and its class is δ_φ(b) (Poonen §8.4, proof of Theorem 8.4.9: the two maps coincide).

Étale case: A[φ] étale and étale = Galois cohomology over a field.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.kummer`: δ_φ : B(K) →+ H¹_fppf(K, A[φ]), with kernel φ(A(K)).
- `TauCeti.AbelianVariety.kummer_injective`: The induced map B(K)/φ(A(K)) → H¹ is injective.
- `TauCeti.AbelianVariety.kummer_eq_torsorClass`: δ_φ(b) is the class of the torsor φ^{-1}(b).
- `TauCeti.AbelianVariety.kummer_baseChange`: δ_φ commutes with restriction along field extensions K → L.
- `TauCeti.AbelianVariety.kummer_comp`: For composable isogenies, δ_{ψ∘φ} is compatible with δ_φ and δ_ψ via the exact sequence 0 → A[φ] → A[ψφ] → B[ψ] → 0.
- `TauCeti.AbelianVariety.kummer_galois`: If deg φ is invertible in K, δ_φ is the connecting map of continuous Galois cohomology of the discrete G_K-module A[φ](K^sep).

**Checks.**

- `kummer.test_zero`: δ_φ(0) = 0.
- `kummer.test_finite_field`: Over a finite field of characteristic prime to n, H¹(K, A[n]) = A[n](K^sep)/(Frob − 1), and δ_{[n]} is surjective since H¹(K, A) = 0 (Lang).
- `kummer.test_elliptic`: For an elliptic curve and n = 2 in characteristic ≠ 2, δ agrees with Tau Ceti's x − T descent map into (K[X]/f)^×/squares under H¹(K, E[2]) ≅ ker(N : A^×/A^{×2} → K^×/K^{×2}).
- `kummer.test_not_surjective`: δ_{[2]} for E/ℚ is not surjective: H¹(ℚ, E[2]) is infinite while E(ℚ)/2E(ℚ) is finite.
- For E : y² = x³ − x over ℚ and φ = [2], δ(0,0) is the class of the finite E[2]-torsor of halves of (0,0), nonzero since (0,0) ∉ 2E(ℚ).

*Needs:* AbelianSchemesAndArithmeticModuli §A3.1, isogenies and finite-flat kernels; AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4).


### 1.2 Local Kummer images at places of good reduction

Prove `TauCeti.AbelianVariety.localKummer_unramified`. Let K be a number field, A/K an abelian variety, n ≥ 1, and v a finite place of K with v ∤ n at which A has good reduction. Then the image of A(K_v)/nA(K_v) in H¹(K_v, A[n]) is the unramified subgroup H¹_nr(K_v, A[n]) = H¹(G_{k_v}, A[n](K_v^nr)); in particular every class in the image becomes trivial on the inertia group I_v.

Good reduction at v: A extends to an abelian scheme over O_v (its Néron model); v ∤ n.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, proof of Theorem 8.4.6, pp. 241–242; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.13 and proof (Steps 1–2), pp. 183–184.)

The Néron model is the abelian scheme 𝒜/O_v (NeronModels Layer 1/abelian-scheme-model); A[n] is finite étale over O_v, so I_v acts trivially (Néron–Ogg–Shafarevich, Layer 5).

Over K_v^nr, [n] is surjective on 𝒜(O_v^nr) by Hensel's lemma (smooth [n] with surjective reduction on the special fibre), so the image of the Kummer map restricted to I_v vanishes.

Use H¹(O_v,𝒜)=0: the special fibre of the abelian scheme is connected, so Lang’s theorem kills its H¹ over the finite residue field, and smooth Hensel lifting gives the local torsor assertion. The integral Kummer exact sequence then identifies H¹(O_v,𝒜[n]) with 𝒜(O_v)/n𝒜(O_v). Its image in H¹(K_v,A[n]) is the unramified subgroup. Lang’s theorem is not applied to the finite group scheme A[n].

**Checks.**

- For E/ℚ with good reduction at p odd and n = 2, the local image at p is H¹_nr(ℚ_p, E[2]) of order #E(ℚ_p)[2].

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, Néron mapping property and good-reduction abelian scheme; NeronModelsAndSemistableAbelianVarieties §5.1, Néron–Ogg–Shafarevich; ArithmeticGaloisDuality Layer R02.3, localization and unramified H¹.


### 1.3 Selmer groups and Tate–Shafarevich groups of abelian varieties

For an isogeny φ : A → B of abelian varieties over a number field K, the Kummer Selmer structure on A[φ] has local conditions the images of the local Kummer maps δ_{φ,v} : B(K_v)/φA(K_v) → H¹(K_v, A[φ]) at every place v; it is unramified at almost all v (§1.2 (Local Kummer images at places of good reduction)) and is a Selmer structure in the sense of TauCetiRoadmap EllipticCurves Layer 7. Sel^φ(A/K) ⊆ H¹(K, A[φ]) is its Selmer group, and Ш(A/K) = ker(H¹(K, A) → Π_v H¹(K_v, A)) with H¹(K, A) the Galois cohomology of the discrete module A(K^sep). For φ = [n] write Sel^n(A/K).

K a number field (characteristic 0, so all cohomology is Galois cohomology); every place, including archimedean ones.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4 and Remark 8.4.5, p. 241; [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7.)

Instantiate the general Selmer-structure constructor of EllipticCurves Layer 7 with M = A[φ](K^sep) and local subgroups the Kummer images.

Ш is the Weil–Châtelet group's locally trivial part, as in EllipticCurves Layer 7 with E replaced by A.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.kummerSelmerStructure`: The Selmer structure on A[φ] with Kummer local conditions.
- `TauCeti.AbelianVariety.selmerGroup`: Sel^φ(A/K) as the Selmer group of kummerSelmerStructure.
- `TauCeti.AbelianVariety.sha`: Ш(A/K) ⊆ H¹(K, A(K^sep)).
- `TauCeti.AbelianVariety.kummer_mem_selmerGroup`: δ_φ(b) ∈ Sel^φ(A/K) for b ∈ B(K).
- `TauCeti.AbelianVariety.selmerGroup_baseChange`: Restriction to a finite extension L/K maps Sel^φ(A/K) into Sel^φ(A_L/L).
- `TauCeti.AbelianVariety.selmerGroup_elliptic`: For A the abelian variety of an elliptic curve E, Sel^n(A/K) is the EllipticCurves Layer 7 group Sel_n(E/K).

**Checks.**

- `selmerGroup.test_degree_one`: For φ an isomorphism, A[φ] = 0 and Sel^φ = 0.
- `selmerGroup.test_congruent_one`: Sel²(E/ℚ) ≅ (ℤ/2)² for E : y² = x³ − x.
- `selmerGroup.test_elliptic`: For an elliptic curve, the group agrees with the EllipticCurves Layer 7 Selmer group.
- `selmerGroup.test_selmer_not_rank`: #Sel² can exceed #E(ℚ)/2E(ℚ): for a genus-one curve C : y² = f(x) (deg f = 4) that is everywhere locally soluble with C(ℚ) = ∅ (a positive proportion, Bhargava–Gross–Wang Theorem 10 with g = 1), the class W[2] lies in Sel²(Jac C/ℚ) but not in the Kummer image.
- `sha.test_zero_variety`: For the zero-dimensional trivial abelian variety, H¹(K,A)=0 and Ш(A/K)=0.
- `sha.test_locally_trivial_nonzero`: The everywhere locally soluble genus-one torsors in Bhargava–Gross–Wang Theorem 10 (g=1) give nonzero elements of Ш, so locally trivial does not mean globally trivial.
- `sha.test_real_failure`: The smooth genus-one curve y²=−(x⁴+1) over ℚ has no real point. Its class under its Jacobian is nontrivial in H¹(ℚ,E) and remains nontrivial over ℝ, hence is excluded from Ш; omitting archimedean localization gives the wrong membership test.

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); §1.2 (Local Kummer images at places of good reduction); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4).


### 1.4 The descent exact sequence

Prove `TauCeti.AbelianVariety.descent_exact`. For an isogeny φ : A → B over a number field K there is an exact sequence 0 → B(K)/φA(K) → Sel^φ(A/K) → Ш(A/K)[φ] → 0, where Ш(A/K)[φ] is the kernel of φ_* : Ш(A/K) → Ш(B/K).

K a number field; φ an isogeny.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Remark 8.4.5 and the identity Sel = {τ : Z^τ(k_v) ≠ ∅ ∀v}, p. 241.)

Compare the global and local Kummer sequences place by place (diagram chase), as in EllipticCurves Layer 7 for [m] on an elliptic curve.

**Checks.**

- For E : y² = x³ − x over ℚ and φ = [2]: Ш(E/ℚ)[2] = 0 and B(K)/φA(K) ≅ Sel² ≅ (ℤ/2)².

*Needs:* §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties); §1.1 (Kummer maps of isogenies of abelian varieties); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4).


### 1.5 Finiteness of Selmer groups

Prove `TauCeti.AbelianVariety.selmerGroup_finite`. For an isogeny φ : A → B of abelian varieties over a number field K, Sel^φ(A/K) is finite. More precisely, if S contains the archimedean places, the places above deg φ and the places of bad reduction, then Sel^φ(A/K) ⊆ H¹(G_{K,S}, A[φ]), which is finite.

K a number field; S finite as stated.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Theorem 8.4.6 and proof, pp. 241–242; [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (finiteness route via Hermite–Minkowski).)

Outside S the local conditions are unramified (§1.2 (Local Kummer images at places of good reduction)), so Sel^φ lies in the image of H¹(G_{K,S}, A[φ]) under inflation.

H¹(G_{K,S}, M) is finite for finite M of order invertible outside S (ArithmeticGaloisDuality Layer R02.3/h1-finite, via Hermite's theorem Layer R02.3/hermite-unramified-outside-finite).

Alternative route: the Selmer set of the proper torsor A → B under A[φ] is finite (Poonen Theorem 8.4.6).

**Checks.**

- For φ = [2] on y² = x³ − x, S = {2, ∞} and #H¹(G_{ℚ,S}, E[2]) = #(ℚ(S,2))² = 16 bounds #Sel² = 4.

*Needs:* §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties); §1.2 (Local Kummer images at places of good reduction); ArithmeticGaloisDuality Layer R02.3, RestrictedRamification.finite_H1_galoisGroupS over number fields; ArithmeticGaloisDuality Layer R02.3, RestrictedRamification.finite_unramifiedOutside_of_finrank_le.


### 1.6 The weak Mordell–Weil theorem

Prove `TauCeti.AbelianVariety.finite_quotient_nsmul`. Let A be an abelian variety over a global field K and m ≥ 1 not divisible by char K. Then A(K)/mA(K) is finite. For K a number field this holds for every m ≥ 1.

K a global field; m invertible in K.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, Theorem 8.4.9 and proof, pp. 242–243.)

A(K)/mA(K) embeds into H¹(K, A[m]) by §1.1 (Kummer maps of isogenies of abelian varieties); its image lies in Sel^m(A/K) (Kummer images are locally Kummer images), which is finite by §1.5 (Finiteness of Selmer groups) (number fields) or by Poonen Theorem 8.4.6 (global fields).

Over number fields every m is invertible.

For global function fields and n prime to the characteristic, use the finite Selmer set of the proper torsor [n]:A→A (§3.3 (The Selmer set of a torsor)), not the number-field Hermite supplier. This dependency is acyclic: that Selmer-set finiteness theorem does not use weak Mordell–Weil. Its global-field cohomological proof is the global-field cohomology contract below.

**Checks.**

- For an elliptic curve over ℚ this is Tau Ceti's weak Mordell–Weil for m = 2 (TauCetiRoadmap EllipticCurves Layer 6).

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); §1.5 (Finiteness of Selmer groups); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-6-the-mordellweil-theorem-aec-viii); §3.3 (The Selmer set of a torsor).


### 1.7 The Mordell–Weil theorem

Prove `TauCeti.AbelianVariety.fg_points`. For an abelian variety A over a number field K, the group A(K) is finitely generated. Its torsion subgroup is finite and A(K) ≅ ℤ^r ⊕ A(K)_tors with r = rank A(K).

K a number field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, statement before Theorem 8.4.9, p. 242; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §7, Theorem 7.1 and Corollary 7.2, author copy pp. 23–24; [EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6.)

Choose a symmetric ample L; h = ĥ_{K,L} on A(K) is ≥ 0, satisfies the parallelogram law exactly, and is Northcott on A(K) (§0.19 (Northcott for ample line bundles), since ĥ represents h_{K,L}).

A(K)/2A(K) is finite (§1.6 (The weak Mordell–Weil theorem)), i.e. the subgroup 2A(K) has finite index.

Mathlib's descent theorem CommGroup.fg_of_descent' in its additive form AddCommGroup.fg_of_descent' gives finite generation; Mathlib Monoid.finite_set_isOfFiniteOrder_of_descent (additive form) gives finite torsion.

**Checks.**

- For an elliptic curve this is Tau Ceti's WeierstrassCurve.Affine.Point fg theorem of EllipticCurves Layer 6 (fg_point_of_numberField).
- A(K) need not be finitely generated over K = ℂ(t) when A is constant: A(ℂ) ⊆ A(ℂ(t)) is uncountable (compare §1.10 (The Lang–Néron theorem)).

*Needs:* §1.6 (The weak Mordell–Weil theorem); §0.21 (The Néron–Tate canonical height); §0.19 (Northcott for ample line bundles); §0.22 (Positivity and kernel of the Néron–Tate height); Mathlib `CommGroup.fg_of_descent'`; Mathlib `Monoid.finite_set_isOfFiniteOrder_of_descent`; [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-6-the-mordellweil-theorem-aec-viii).


### 1.8 Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ

Prove `TauCeti.AbelianVariety.neronTateHeight_posDef`. For an abelian variety A over a number field K and a symmetric ample L, the real extension of ĥ_{K,L} to A(K) ⊗ ℝ is positive definite; equivalently the Gram matrix of ⟨,⟩_L on a basis of A(K)/A(K)_tors is positive definite, and its determinant (the L-regulator) is positive.

K a number field; L symmetric ample.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §10, Lemma 10.1 and the discussion before Theorem 9.15, author copy pp. 35–37.)

Finite generation (§1.7 (The Mordell–Weil theorem)) makes A(K)/tors a lattice Λ of rank r; ĥ is a quadratic form on Λ with finitely many points of bounded value (Northcott) and kernel exactly the torsion (§0.22 (Positivity and kernel of the Néron–Tate height)).

Minkowski's lemma: a quadratic form on a lattice that is ≥ 0, with finitely many lattice points below every bound, extends to a positive definite form on Λ ⊗ ℝ (Conrad Lemma 10.1).

**Checks.**

- For E/ℚ of rank one with generator P, the Gram matrix is (2ĥ(P)) with ĥ(P) > 0.

*Needs:* §1.7 (The Mordell–Weil theorem); §0.23 (The Néron–Tate bilinear form of a symmetric bundle); §0.22 (Positivity and kernel of the Néron–Tate height).


### 1.9 Chow's K/k-trace

Let K/k be a primary (for example regular) extension of fields and A an abelian variety over K. The K/k-trace is a pair (Tr_{K/k}(A), τ) of an abelian variety over k and a K-homomorphism τ : Tr_{K/k}(A)_K → A, final among pairs (C, f) with C an abelian variety over k and f : C_K → A. It exists; τ has finite kernel, whose Cartier dual is connected; if char k = 0, τ is a closed immersion. There is a unique abelian subvariety A' ⊆ A with A' = image of τ, and (A/A')^{K/k} = 0. Formation of the trace commutes with separable algebraic extensions of k.

K/k primary (k separably closed in K suffices for the universal property; regular for the base-change statements).

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §6, Theorem 6.2, Theorem 6.4, Corollary 6.5, Theorems 6.8 and 6.12, author copy pp. 20–23; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), §1 p. 2, §2 p. 9, §3.1 p. 12; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §1.1, p. 3.)

Existence and properties: Conrad Theorem 6.2 (existence via the K/k-image of the dual) and Theorem 6.4 (finite kernel, connected Cartier dual of ker τ, closed immersion in characteristic 0).

Base change: Conrad Theorems 6.8 and 6.12.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.trace`: Tr_{K/k}(A), an abelian variety over k.
- `TauCeti.AbelianVariety.traceMap`: τ : Tr_{K/k}(A)_K → A.
- `TauCeti.AbelianVariety.trace_universal`: Every f : C_K → A from a k-abelian variety C factors uniquely through τ.
- `TauCeti.AbelianVariety.traceMap_ker_finite`: ker τ is finite (trivial in characteristic 0).
- `TauCeti.AbelianVariety.trace_constant`: Tr_{K/k}(A₀ ⊗ K) = A₀.
- `TauCeti.AbelianVariety.trace_baseChange`: Tr commutes with separable algebraic extension of k (Conrad Theorem 6.8).

**Checks.**

- `trace.test_constant`: For A = E₀ ⊗ K with E₀ an elliptic curve over k, Tr = E₀.
- `trace.test_zero`: Tr_{K/k}(0) = 0.
- `trace.test_nonisotrivial_elliptic`: For E/ℂ(t) with nonconstant j-invariant, Tr_{K/k}(E) = 0.
- `trace.test_isotrivial_nonconstant`: The quadratic twist of a constant elliptic curve E₀ ⊗ K by t ∈ K^× with K(√t)/K not obtained from an extension of constants has trace 0, although it becomes constant over K(√t) (the example of Conrad Remark 4.6).
- For A = A₀ ⊗_k K constant, Tr_{K/k}(A) = A₀ and τ = id.

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5, abelian images and Poincaré complements; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`.


### 1.10 The Lang–Néron theorem

Prove `TauCeti.AbelianVariety.fg_points_mod_trace`. Let K/k be a finitely generated regular extension and A an abelian variety over K. Then A(K)/τ(Tr_{K/k}(A)(k)) is a finitely generated abelian group. In particular, if Tr_{K/k}(A) = 0 then A(K) is finitely generated.

K/k finitely generated and regular.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §7, Theorem 7.1 with Lemmas 7.3–7.5, author copy pp. 23–27; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 3.1, p. 14, and Proposition B.1, p. 58.)

Conrad §7, pp.23–26: reduce to a one-variable regular extension by Lemmas 7.3–7.4. Use bounded-degree components of the Hom scheme modulo the constant trace through the Albanese construction to obtain the required finite-dimensionality statement.

Use finiteness of étale H¹ on a smooth curve for the finite prime-to-characteristic torsion module to prove weak Mordell–Weil. Apply descent to the quotient modulo the trace using the bounded-degree/height input. Require the Hom-scheme and étale-cohomology contracts above.

Do not use Theorem 9.15 in this proof: its positive-definiteness argument subsequently uses Lang–Néron.

**Checks.**

- For E/ℂ(t) with nonconstant j-invariant, E(ℂ(t)) is finitely generated.

*Needs:* §1.9 (Chow's K/k-trace); §0.10 (Polarized function fields as generalized global fields); §0.21 (The Néron–Tate canonical height); Mathlib `CommGroup.fg_of_descent'`.


### 1.11 Kernel of the Néron–Tate height over function fields

Prove `TauCeti.AbelianVariety.neronTateHeight_eq_zero_iff_trace`. Let K/k be finitely generated and regular of positive transcendence degree, with a polarization, and A/K an abelian variety with a symmetric ample line bundle L. On A(K̄), the kernel of ĥ_L is the image of the constant points of the geometric K̄/k̄-trace plus torsion. On A(K), the quadratic height induces a positive definite form on the real vector space obtained from A(K)/τ(Tr_{K/k}(A)(k)). Trivial original K/k-trace suffices for the torsion-kernel assertion on A(K). For all A(K̄) the torsion-kernel assertion requires trivial geometric trace; the original trace can become nonzero after a finite nonconstant extension.

K/k finitely generated regular, trdeg ≥ 1; L symmetric ample.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Lemma 9.13, Theorem 9.15, Lemma 9.16, Corollary 9.17; §10, author copy pp. 35–41; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Lemma 5.3, p. 24; §5.3, p. 26; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), §1 p. 2; §2.1 p. 10.)

ĥ vanishes on the trace points (Conrad Lemma 9.13: heights of constant points are bounded).

Positive definiteness modulo the trace (Conrad Theorem 9.15, proved in §10 via Theorem 10.2 and Néron's Lemma 10.3).

Combine with Lang–Néron and finite extensions (Conrad Lemma 9.16, Corollary 9.17).

**Checks.**

- The kernel is τ(Tr(k̄)) + torsion, not (Tr ⊗ K̄)(K̄) + torsion: the latter is the incorrect larger kernel displayed in Gao–Habegger §1, p.2.
- A nonconstant quadratic isotrivial twist of a constant Jacobian can have zero original trace but nonzero geometric trace. Its zero-height constant points after the splitting extension distinguish the two hypotheses.

*Needs:* §1.10 (The Lang–Néron theorem); §1.9 (Chow's K/k-trace); §0.21 (The Néron–Tate canonical height); §0.10 (Polarized function fields as generalized global fields).


### 1.12 Two-coverings of torsors and the class W[2]

Let J be an abelian variety over a field k of characteristic different from 2 and I a J-torsor. A two-covering of I is a J-torsor Y with a morphism π : Y → I such that π(y + a) = π(y) + 2a; π is finite étale of degree 2^{2 dim J}. Isomorphism classes of §1.12 (Two-coverings of torsors and the class W[2]) of I form a principal homogeneous space under H¹(k, J[2]) (twisting), nonempty exactly when [I] ∈ 2·H¹(k, J). For I = J the base point is [2] : J → J, For a ∈ J(k), the finite fibre [2]⁻¹(a) is a J[2]-torsor of class δ(a). The corresponding two-covering has domain J and map y↦2y−a; its fibre over zero is [2]⁻¹(a). For the Jacobian J of C : y² = f(x) of genus g over k (char k ≠ 2, f separable of degree 2g + 2) with torsor J¹ = Pic¹_C and hyperelliptic class d, the map J¹ → J² ≅ J, x ↦ 2x − d, is a two-covering of J by J¹; its class W[2] ∈ H¹(k, J[2]) maps to [J¹] ∈ H¹(k, J), and the image of W[2] in H¹(k,J) is zero iff J¹(k) ≠ ∅. The stronger condition W[2]=0 is equivalent to an odd unordered factorization of f as in §1.13 (W[2] and odd factorisations).

J abelian over k; for the hyperelliptic statements char k ≠ 2 and f separable of degree 2g + 2.

([A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), §1, p. 2.)

A two-covering of I is a J[2]-torsor over I compatible with the J-actions; H¹(k, J[2]) acts simply transitively on such classes by contracted product (SchemeAndStackFoundations Layer 1 twisting).

For I=J, all two-covering classes are H¹(k,J[2]); those whose underlying J-torsor has a k-point are exactly the Kummer image. The map J¹→J has image class [J¹] in H¹(k,J), so Pic¹(k)≠∅ characterizes the vanishing of that image, not of W[2] itself.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.TwoCovering`: A two-covering (Y, π) of a J-torsor I.
- `TauCeti.AbelianVariety.TwoCovering.class`: Its class in the H¹(k, J[2])-torsor of §1.12 (Two-coverings of torsors and the class W[2]) of I.
- `TauCeti.AbelianVariety.TwoCovering.trivial`: [2] : J → J as the two-covering of the trivial torsor.
- `TauCeti.Hyperelliptic.W2`: W[2] ∈ H¹(k, J[2]) for C : y² = f(x) with deg f = 2g + 2.
- `TauCeti.Hyperelliptic.W2_eq_zero_iff`: W[2]=0 iff f has an odd unordered factorization, allowing quadratic-conjugate odd factors. Its image in H¹(k,J) vanishes iff Pic¹_C(k) is nonempty.

**Checks.**

- `TwoCovering.test_trivial`: The two-covering [2] : J → J has class 0.
- `TwoCovering.test_degree`: A two-covering of a torsor under an abelian surface has degree 16.
- `W2.test_rational_point`: A point P∈C(k) gives [P]∈Pic¹_C(k), so W[2] lies in the Kummer image and its H¹(k,J) image vanishes; W[2] itself need not vanish.
- `W2.test_not_selmer_zero`: A nonzero W[2] can still be a Kummer class when Pic¹_C(k) is nonempty. A locally soluble Pic¹ torsor places W[2] in Sel₂(J); failure of Pic¹_C(k)≠∅, rather than W[2]≠0 alone, puts it outside the Kummer image.
- `TwoCovering.test_fibre_dimension`: For an elliptic curve, [2]⁻¹(a) has dimension zero and degree four over k; the two-covering J→J has dimension one. The fibre alone is not a J-torsor.
- If I = J (trivial torsor), [2] : J → J is a two-covering of class 0.

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §3.6, Picard torsors; AbelianSchemesAndArithmeticModuli §A3.2, prime-to-characteristic two-torsion.


### 1.13 W[2] and odd factorisations

Prove `TauCeti.Hyperelliptic.W2_eq_zero_of_odd_factor`. For C : y² = f(x) over a field k of characteristic ≠ 2 with f separable of degree 2g + 2, the points of the class W[2] (as a J[2]-torsor) are the Weierstrass divisor classes e of degree 1 with 2e ≡ d, and these correspond to the odd factorisations f = g·h over k (g, h of odd degree, rational or conjugate over a quadratic extension). Hence W[2] ≠ 0 whenever f has no odd factorisation over k.

char k ≠ 2; deg f = 2g + 2 even; f separable.

([A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), §1, p. 2; Proposition 22(4), p. 11.)

J[2] is generated by differences of Weierstrass points; the J[2]-torsor of halves of d is described by subsets of the roots of f of odd size modulo complement (Bhargava–Gross–Wang Proposition 22(4)).

**Checks.**

- For a separable sextic with Galois group S₆ over ℚ, no Galois-stable odd unordered partition of the roots exists, so W[2]≠0. Irreducibility alone is insufficient: x⁶−2 has cubic factors conjugate over ℚ(√2).

*Needs:* §1.12 (Two-coverings of torsors and the class W[2]).


### 1.14 The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k

For a number field K and a J-torsor I, define Sel₂(I) as the isomorphism classes over the fixed I of everywhere locally soluble §1.12 (Two-coverings of torsors and the class W[2]) π:Y→I, with J-equivariant isomorphisms of Y. It is empty or a torsor under Sel₂(J). For a hyperelliptic curve with I=J¹ and α:I→J, x↦2x−d, composition α∘π gives a four-covering of J. Its class lies in the fibre of Sel₄(J)→Sel₂(J) above W[2]. This map is surjective, with fibres the orbits of δ₂(J[2](K)) acting on Sel₂(I), where δ₂:J[2](K)→H¹(K,J[2]) comes from 0→J[2]→J[4]→J[2]→0. Thus the unmarked fibre is Sel₂(I)/δ₂(J[2](K)); a bijection without this quotient requires δ₂(J[2](K))=0, for example J[2](K)=0. Retaining an identification of the intermediate two-covering with α gives the marked comparison. For an odd integer k>0, define the 2-Selmer set of order k by requiring, at every place v, that the covering have a point above e_v−((k−1)/2)d for some effective K_v-divisor e_v of degree k.

K a number field; I a torsor under an abelian variety; k odd.

([A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), §1, pp. 2–3; §12, p. 33; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4, p. 241; [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), §8, discussion before Theorem 30, pp.21–22; comparison refined by the exact sequence 0→J[2]→J[4]→J[2]→0.)

After choosing one two-covering Y₀→I, its inverse twists are precisely the torsor twists of the J[2]-torsor Y₀→I. Local solubility restricts the twisting action to the Kummer local conditions, so any nonempty Sel₂(I) is a Sel₂(J)-torsor.

The exact sequence 0→J[2]→J[4]→J[2]→0 identifies the kernel of H¹(K,J[2])→H¹(K,J[4]) with δ₂(J[2](K)). Each such class is globally Kummer and hence Selmer. Composing with α forgets the identification of the intermediate two-covering; its automorphisms over J are translations by J[2](K). Taking their quotient gives the asserted unmarked fibre. This is the precise comparison underlying Bhargava–Gross–Wang §8, pp.21–22.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.selmerSet`: Sel₂(I) for a J-torsor I.
- `TauCeti.AbelianVariety.selmerSet_torsor`: If nonempty, Sel₂(I) is a principal homogeneous space for Sel₂(J).
- `TauCeti.Hyperelliptic.selmerSet_eq_preimage`: The fibre in Sel₄(J) above W[2] is the quotient of Sel₂(J¹) by δ₂(J[2](K)); with a fixed intermediate-cover identification, retain the marked fibre instead.
- `TauCeti.Hyperelliptic.selmerSetOfOrder`: The 2-Selmer set of order k.

**Checks.**

- `selmerSet.test_trivial_torsor`: Sel₂(J) as a Selmer set of the trivial torsor is the 2-Selmer group.
- `selmerSet.test_point`: C(K) ≠ ∅ implies Sel₂(J¹) ≠ ∅.
- `selmerSet.test_compat_poonen`: For a chosen two-covering Y₀→I, identify Sel₂(I) with Poonen’s Selmer set of that J[2]-torsor Y₀→I. The variety I itself is a J-torsor, not a J[2]-torsor.
- `selmerSet.test_empty_locally_soluble`: Sel₂(J¹) can be empty for everywhere locally soluble C (Bhargava–Gross–Wang Theorem 5).
- `selmerSet.test_unmarked_four_cover`: For E:y²=x³−x over ℚ, E(ℚ)=E[2](ℚ), Sel₂(E)=(ℤ/2)² and Ш(E)[2]=Ш(E)[4]=0. Hence Sel₄(E)=E(ℚ)/4E(ℚ), and its map to Sel₂(E) is a bijection. The fibre above zero has one element, whereas the two-covering Selmer set of the fixed E has four. Here δ₂(E[2](ℚ)) has order four; the quotient is essential.
- If C(K) ≠ ∅ then Sel₂(J¹) contains the class of the point and is a coset of Sel₂(J).

*Needs:* §1.12 (Two-coverings of torsors and the class W[2]); §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties).


### 1.15 A complete elliptic 2-descent

Prove `TauCeti.AbelianVariety.elliptic_two_descent_example`. For E : y² = x³ − x over ℚ (S = {2, ∞}): E[2](ℚ) = {O, (0,0), (±1, 0)}; the local images at 2 and ∞ and the unramified conditions elsewhere cut Sel²(E/ℚ) ⊆ H¹(G_{ℚ,S}, E[2]) down to the image of E[2](ℚ), so Sel²(E/ℚ) ≅ (ℤ/2)², Ш(E/ℚ)[2] = 0, rank E(ℚ) = 0 and E(ℚ) = E[2](ℚ) is finitely generated. The Selmer bound is only an upper bound: for the Jacobian of an everywhere locally soluble genus-one curve y² = f(x) with no rational point (Bhargava–Gross–Wang Theorem 10, g = 1), W[2] is a Selmer element outside the Kummer image, so #Sel² > #E(ℚ)/2E(ℚ). This is a numerical application of EllipticCurves Layers 6–7 to the specified rank-zero curve; the elliptic descent method itself is imported.

ℚ, S = {2, ∞}; the x − T descent map of Tau Ceti identifies H¹(ℚ, E[2]) with the kernel of the norm on (ℚ^× /ℚ^{×2})³.

([EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6, explicit 2-descent.)

Compute the image of the descent map on E[2](ℚ); compute local images at 2 and ∞; intersect (EllipticCurves Layer 6 explicit 2-descent, provided in Tau Ceti's Stoll development).

Apply §1.4 (The descent exact sequence) and §1.7 (The Mordell–Weil theorem).

**Checks.**

- rank E(ℚ) = 0 and #E(ℚ) = 4.

*Needs:* §1.4 (The descent exact sequence); §1.7 (The Mordell–Weil theorem); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-6-the-mordellweil-theorem-aec-viii).


### 1.16 Formal logarithms on a sufficiently small ideal

Prove `TauCeti.formalLogarithm_smallIdeal_equiv`. Let F/ℚ_p be finite, O its integers, 𝔪 its maximal ideal, and e=ord_F(p). For a g-dimensional commutative formal group law over O, represented by g native multivariate power series with zero constant term, linear term X+Y, associativity, identity and inverses, there is a unique formal logarithm log_FG over F with derivative the identity. For every integer r>e/(p−1), it converges on (𝔪^r)^g and gives an analytic group isomorphism FG((𝔪^r)^g)≃((𝔪^r)^g,+), with analytic inverse and the same tangent map. In particular the whole maximal-ideal group is torsion-free when e<p−1. This is a multivariate logarithm theorem extending native one-dimensional FormalGroup; native FormalGroup.Point is a power-series-valued point type and does not already give points in a complete local field.

The formal law has integral coefficients and is commutative; F has characteristic zero; use ord_F(π)=1 and r∈ℕ with r>e/(p−1). A smooth group model at the identity supplies its formal law and comparison with the kernel of reduction; that comparison is a separate NeronModels supplier contract. For an abelian variety without good reduction one still uses the smooth Néron model near the identity.

([Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, Lemma′ and its proof, printed p.502 (the Appendix begins on p.501); [Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf), §13, Theorem 7 and proof, pp.114–117; §14(2), p.118.)

The inverse Jacobian in the second variables at Y=0 gives the g invariant differential forms with integral coefficients and identity constant matrix. Commutativity makes them closed. Integrate their homogeneous degree-(n−1) parts over F to obtain the degree-n part of log, whose denominators divide n. Translation invariance gives log(FG(X,Y))=log(X)+log(Y); derivative identity determines uniqueness in characteristic zero.

A homogeneous degree-n coefficient has valuation at least −e·ord_p(n). Since ord_p(n)≤(n−1)/(p−1), on 𝔪^r the nonlinear term has valuation at least nr−e·ord_p(n)>r and tends to infinity with n. The same estimates on differences show log−id is strictly contracting on (𝔪^r)^g. Solve log(x)=y by iterating x↦y−(log(x)−x); completeness gives its inverse on the whole ball. The power-series inverse is analytic by the same estimates. Log is a homomorphism, hence the inverse is too.

Katz Appendix Lemma′ proves the r=1 range by topologically nilpotent divided powers on 𝔪, followed by inverse logarithm and exponential; the coefficient proof gives the explicit small-ball refinement used here. The target is the logarithm, not a redevelopment of general Lie groups or an elliptic formal-group carrier.

**Checks.**

- For the additive g-dimensional law log is the identity on every ideal.
- For the multiplicative law in one variable log(1+T)=Σ_{n≥1}(−1)^{n+1}T^n/n and its inverse exp(T)−1 satisfy the stated strict-radius condition.
- At F=ℚ_p(ζ_p), e=p−1 and ζ_p−1∈𝔪 is nonzero p-torsion for the multiplicative law. At p=2 the witness is −2 over ℚ₂. Thus the strict inequality for r=1 cannot be replaced by e≤p−1.

*Needs:* Mathlib `MvPowerSeries`; Mathlib `FormalGroup`; Mathlib `ContractingWith.exists_fixedPoint`.


### 1.17 Local indices of multiplication by two

Prove `TauCeti.AbelianVariety.card_quotient_two_padic`. Let A be an abelian variety of dimension g over F/ℚ_p finite. A(F) has an open subgroup U≃(O_F^g,+) of finite index: for an integer r>e/(p−1), with e=ord_F(p), the kernel of reduction modulo 𝔪^r on the points of the Néron model. With the module absolute value |a|_F=q_F^(−ord_F(a)), #A(F)/2A(F)=|2|_F^(−g)·#A(F)[2]. Thus the factor is 2^(g[F:ℚ₂]) at p=2 and 1 otherwise; for F=ℚ₂ and full two-torsion it gives 2^(3g). This module absolute value is not the extension of the normalized ℚ_p norm without its [F:ℚ_p] power. Over ℝ the quotient has order #A(ℝ)[2]/2^g; over ℂ it is trivial.

A abelian of dimension g over a local field of characteristic 0.

([Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf), §13, Theorem 7 and proof, printed pp.114–117; §14(2), p.118; [Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, proof of Lemma′, printed p.502.)

Let 𝒩 be the Néron model of A over O_F, so that A(F)=𝒩(O_F). For an integer r>e/(p−1) let U be the kernel of 𝒩(O_F)→𝒩(O_F/𝔪^r). The smooth formal identity-chart contract above identifies U with the 𝔪^r-points of the g-dimensional formal group of 𝒩 along its identity section, and §1.16 (Formal logarithms on a sufficiently small ideal) identifies these with ((𝔪^r)^g,+)≅(O_F^g,+). U is open, and it has finite index because 𝒩(O_F/𝔪^r) is finite. Katz (Appendix, proof of Lemma′, p.502) uses the same identification of the reduction kernel with formal-group points at r=1. Mattuck §13, Theorem 7 and proof, pp.114–117, gives the classical analytic open subgroup; §14(2), p.118, gives uniqueness up to a linear coordinate change. The smooth-model formal-chart comparison remains an additional prerequisite.

Let G=A(F), C=G/U. Since U is torsion-free, multiplication by two in 0→U→G→C→0 gives 0→G[2]→C[2]→U/2U→G/2G→C/2C→0. Both C groups are finite with equal order. Taking alternating cardinalities gives #G/2G=#G[2]·#U/2U, without assuming this group extension splits. For U≃O_F^g the last factor is q_F^(g ord_F(2))=|2|_F^(−g).

Over ℂ import complex-lattice-realization: A(ℂ)≃ℂ^g/Λ, where multiplication by two is surjective. Over ℝ take conjugation invariants in that uniformization. The identity component is a real g-torus; the component group embeds in H¹(⟨conjugation⟩,Λ), hence is killed by two. In 0→G⁰→G→π₀G→0, [2] is onto on G⁰ and G⁰[2] has order 2^g. The snake lemma gives G[2]↠π₀G and G/2G≃π₀G, proving the stated real count. No splitting hypothesis is needed.

**Checks.**

- For E/ℚ₂ with E(ℚ₂)[2] = ℤ/2 × ℤ/2, #E(ℚ₂)/2E(ℚ₂) = 8.
- If F/ℚ₂ is unramified quadratic and g=1 with all four two-torsion points rational, the quotient has order 4·4=16, not 8.
- At p odd the additive lattice contributes no two-quotient. For g=0 both sides equal 1.
- A real elliptic curve with one component has #E(ℝ)[2]=2 and quotient order 1; with two components these orders are 4 and 2. A complex abelian variety has quotient order 1.

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; §1.16 (Formal logarithms on a sufficiently small ideal); NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, together with the smooth formal identity-chart contract below; AbelianSchemesAndArithmeticModuli §A5.1, complex lattice uniformization.


### 1.18 Reduction is injective on torsion

Prove `TauCeti.AbelianVariety.reduction_injective_torsion`. Let A be an abelian variety over a number field K with good reduction at a finite place v of residue characteristic p, absolute ramification index e_v, and 𝒜 the abelian scheme over O_v. The reduction map A(K_v)_tors → 𝒜(k_v) is injective on torsion of order prime to p, and on all torsion if e_v < p − 1. For the Jacobian J of a curve C over ℚ with good reduction at q, the reduction J(ℚ) → J̃(𝔽_q) is a homomorphism compatible with reduction of points and divisors, injective on torsion for q ≥ 3.

Good reduction at v; e_v < p − 1 for the p-part.

([Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, Lemma and Lemma′, printed p.502; setup on p.501; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.13 proof, Step 2 (Lang and Hensel), p. 184.)

Properness identifies A(F) with 𝒜(O_F) at a good-reduction place. The smooth formal completion of 𝒜 at zero identifies ker(red) with its g-dimensional integral commutative formal law on 𝔪_F; use the smooth formal identity-chart contract above for this comparison.

For n prime to p, [n](T)=nT+higher-degree terms on the formal completion. On 𝔪_F the linear term is a unit and the nonlinear terms strictly contract, so [n] is bijective there by successive approximation; in particular the kernel has no prime-to-p torsion. Étaleness alone is not asserted to make all global n-torsion trivial.

If e_v<p−1, §1.16 (Formal logarithms on a sufficiently small ideal) applies with r=1 and identifies the full reduction kernel with the torsion-free additive group 𝔪_F^g. This is precisely Katz Appendix Lemma′ and its logarithm/exponential proof on printed p.502. Consequently all torsion injects under the strict ramification bound.

Base change of the Jacobian and its Abel–Jacobi map to the good-reduction model gives compatibility with points and divisor classes; restrict the local statement to J(ℚ). At q≥3 one has e=1<q−1.

**Checks.**

- E : y² = x³ − x has good reduction at 3 and E(ℚ)_tors = ℤ/2 × ℤ/2 injects into Ẽ(𝔽₃), of order 4.
- On the multiplicative formal group over ℚ_p(ζ_p), e=p−1 and ζ_p−1 is nonzero p-torsion in the reduction kernel: the strict boundary cannot be weakened, nor can the restriction to prime-to-p torsion be dropped without a ramification hypothesis.
- For a dimension-zero abelian variety both torsion and reduction groups are trivial.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, Néron mapping property and good-reduction abelian scheme; AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; §1.16 (Formal logarithms on a sufficiently small ideal); NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, together with the smooth formal identity-chart contract below; [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property).


### 1.19 The Kummer map of a two-isogeny

Prove `TauCeti.EllipticCurve.twoIsogeny_kummer`. For E : y² = x(x² + cx + d) over ℚ with d(c² − 4d) ≠ 0, the 2-isogeny φ : E → E' with E' : y² = x(x² − 2cx + c² − 4d) and its dual φ' : E' → E: the Kummer map E(ℚ)/φ'(E'(ℚ)) → H¹(ℚ, E'[φ']) ≅ ℚ^×/ℚ^{×2} is (x, y) ↦ x for x ≠ 0, (0, 0) ↦ d, O ↦ 1; the φ'-Selmer group is the set of d₁ ∈ ℚ^×/ℚ^{×2} dividing d up to squares for which v² = d₁u⁴ + cu² + d/d₁ is everywhere locally soluble; its quotient by the image of E(ℚ) is Ш(E'/ℚ)[φ'].

E with a rational 2-torsion point at (0, 0); characteristic 0. Use an integral Weierstrass normalization for c,d and S containing primes dividing 2d and the bad-reduction set. Test local solubility on the smooth projective model of the homogeneous quartic, including points at infinity.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Remark 8.4.5, p. 241; [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (Selmer groups of an arbitrary isogeny φ and its dual).)

Instance of §1.1 (Kummer maps of isogenies of abelian varieties) for the degree-two isogeny: E'[φ'] ≅ μ₂ and H¹(ℚ, μ₂) ≅ ℚ^×/ℚ^{×2} (Kummer theory); the fibre of φ' over (x, y) is the quadratic extension ℚ(√x).

Selmer condition: everywhere local solubility of the homogeneous spaces v² = d₁u⁴ + cu² + d/d₁ (§1.4 (The descent exact sequence)).

The divisor bound for square classes uses the integral equation. Local solubility is not restricted to the displayed affine chart of the covering.

**Checks.**

- For E : y² = x³ − x (c = 0, d = −1), the image of E(ℚ) is {1, −1} ⊆ ℚ^×/ℚ^{×2}.

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); §1.4 (The descent exact sequence); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4).


### Examples

For E:y²=x³−x over ℚ take S={2,∞}. Its rational two-torsion consists of O,(0,0),(1,0),(−1,0). The explicit x−T descent from EllipticCurves Layer 6, with the local images at 2 and infinity and unramified images elsewhere, gives `Sel₂(E)=(ℤ/2)²`. The image of `E(ℚ)/2E(ℚ)` is all of it; `Ш(E)[2]=0` and the rank is zero, so E(ℚ)=E[2](ℚ). The ambient `H¹(G_{ℚ,S},E[2])` has sixteen classes, not four. This is a numerical application of the elliptic supplier. For an everywhere locally soluble genus-one quartic with no rational point, W[2] lies in the Selmer group outside the Kummer image, so the Selmer cardinality is only an upper bound on rational-point rank (Bhargava–Gross–Wang, Theorem 10, p.4).

For the same E, a two-covering with Kummer class δ₂(0,0) has domain E and morphism `y↦2y−(0,0)`. Its fibre over zero has four geometric points and is a finite E[2]-torsor, not an elliptic curve. Composing with [2] gives a four-covering of class δ₄(2(0,0))=0. This computes the loss of an intermediate-cover marking.

Over ℚ₂ an elliptic curve with full rational two-torsion has eight classes modulo doubling. Over an unramified quadratic extension of ℚ₂ it has sixteen. At an odd prime the formal additive lattice contributes one, so the quotient order equals the local two-torsion order. For the multiplicative formal law over ℚ₂, T=−2 is a nonzero element of the maximal ideal killed by two; this disproves the logarithm assertion at the non-strict boundary r=e/(p−1)=1.



### Dependencies

Layer 0; AbelianSchemesAndArithmeticModuli §§A3.1–A3.2, A5.1 and A6.3–A6.7; SchemeAndStackFoundations §§1.13–1.17, 2.3 and 3.6; EllipticCurves Layers 6–7; ArithmeticGaloisDuality Layers R02.3–R02.4; NeronModelsAndSemistableAbelianVarieties §§1.1,1.8,5.1. Lang–Néron precedes the function-field height-kernel theorem; it uses the Hom/Albanese and smooth-curve cohomology contracts, not that later theorem. The global-function-field and general formal-chart contracts are stated separately above.



## Layer 2: adelic points and the Brauer–Manin pairing

Integral models produce the restricted adelic condition, while the model direct limit gives separated finite-type schemes. Pull back the supplier's Brauer classes to local points; spreading and henselian-local splitting give finite support. Local constancy then yields closed orthogonality sets and finite constraints for explicitly given classes.


### 2.1 Adelic points of an affine variety

Define `TauCeti.AdelicPoints`. Let K be a number field, 𝔸_K = NumberField.AdeleRing (𝓞 K) K its adele ring (the product of the infinite adele ring and the finite adele ring), and A a finitely generated commutative K-algebra, the coordinate ring of the affine K-variety X = Spec A. The adelic points of X are X(𝔸_K) := Points_K(A, 𝔸_K) with the points topology (ReductiveGroupsPartII §RG2.0.1). They come with: the diagonal ι : X(K) = Points_K(A, K) → X(𝔸_K), postcomposition with the algebra map K → 𝔸_K; for each finite place v (a height-one prime of 𝓞 K) the local projection X(𝔸_K) → X(K_v), K_v = v.adicCompletion K, postcomposition with the projection of the finite adeles to their v-component; and for each infinite place w the local projection X(𝔸_K) → X(K_w), K_w = w.Completion. All of these are continuous. Use the names `TauCeti.AdelicPoints K A`, with `diagonal`, `finiteProj v` and `infiniteProj w`.

K a number field; A a finitely generated commutative K-algebra (so X is an affine K-scheme of finite type). Non-affine varieties are not covered by this node.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 49; [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.3, p. 3.)

Definition: Points_K(A, 𝔸_K). The adele ring is a topological K-algebra (NumberField.AdeleRing is a topological ring with Algebra K).

Diagonal and projections: the algebra map K → 𝔸_K and the projections 𝔸_K → K_v are continuous K-algebra maps (the projection of the finite adeles to a component is RestrictedProduct.evalRingHom, continuous for the restricted-product topology; the infinite part is a product of the K_w). Postcomposition is continuous by ReductiveGroupsPartII §RG2.0.1.

Product decomposition: since 𝔸_K = K_∞ × 𝔸_K^f, Points_K(A, 𝔸_K) ≃ₜ Points_K(A, K_∞) × Points_K(A, 𝔸_K^f) and Points_K(A, K_∞) ≃ₜ ∏_w X(K_w) (algebra maps into a product are families of algebra maps into the factors; the topologies agree because both are induced by the evaluations).

Its interface consists of the following operations and laws.

- `TauCeti.AdelicPoints.diagonal`: The continuous map X(K) → X(𝔸_K) given by postcomposition with algebraMap K 𝔸_K.
- `TauCeti.AdelicPoints.finiteProj`: For a finite place v, the continuous map X(𝔸_K) → X(K_v) given by postcomposition with the v-th projection of the finite adeles.
- `TauCeti.AdelicPoints.infiniteProj`: For an infinite place w, the continuous map X(𝔸_K) → X(K_w) given by postcomposition with the w-th projection of the infinite adeles.
- `TauCeti.AdelicPoints.ext`: Two adelic points agree iff all their local projections agree.
- `TauCeti.AdelicPoints.diagonal_injective`: The diagonal is injective (K → 𝔸_K is injective).
- `TauCeti.AdelicPoints.finiteProj_diagonal`: The local projection of the diagonal image of x is x followed by K → K_v, and similarly at infinite places.
- `TauCeti.AdelicPoints.map`: A K-algebra map A′ → A induces a continuous map X(𝔸_K) → X′(𝔸_K) compatible with the diagonal and the local projections.

**Checks.**

- `TauCeti.AdelicPoints.tests.point`: For A = K, X(𝔸_K) has exactly one element, the image of the unique K-point.
- `TauCeti.AdelicPoints.tests.affine_line`: For A = K[X], evaluation at X is a homeomorphism X(𝔸_K) ≃ₜ 𝔸_K, and the diagonal is the inclusion K → 𝔸_K; it is not surjective.
- `TauCeti.AdelicPoints.tests.multiplicative_group`: For A = K[X, Y]/(XY − 1), X(𝔸_K) is homeomorphic to the unit group 𝔸_Kˣ with Mathlib's topology on units (the idele topology).
- `TauCeti.AdelicPoints.tests.no_real_point`: For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty, while X(ℚ₅) is not.
- X(𝔸_K) is Hausdorff, and X(K) sits in it as a discrete closed subset (§2.6 (Rational points are discrete and closed in adelic points)).
- For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty although X(ℚ_p) is nonempty for every p ≡ 1 mod 4, because X(ℝ) is empty.

*Needs:* ReductiveGroupsPartII §RG2.0.1; Mathlib `NumberField.AdeleRing`; Mathlib `IsDedekindDomain.FiniteAdeleRing`; Mathlib `NumberField.InfiniteAdeleRing`; Mathlib `IsDedekindDomain.HeightOneSpectrum.adicCompletion`; Mathlib `NumberField.InfinitePlace.Completion`; Mathlib `RestrictedProduct.evalRingHom`; Tau Ceti `NumberField.AdeleRing.instT2Space`; Mathlib `NumberField.InfiniteAdeleRing.locallyCompactSpace`; Mathlib `RestrictedProduct.locallyCompactSpace_of_group`; Mathlib `Algebra.FiniteType`.


### 2.2 Integral models and their integral local points

Define `TauCeti.AdelicPoints.IntegralModel`. Let K be a number field and A a finitely generated commutative K-algebra. An integral model of A is a finitely generated 𝓞_K-subalgebra A₀ ⊆ A such that K·A₀ = A (equivalently, the K-subalgebra generated by A₀ is A; then A₀ ⊗_{𝓞_K} K ≅ A). For a finite place v, its integral points at v are X₀(O_v) := {x ∈ X(K_v) : x(A₀) ⊆ O_v}, where O_v = v.adicCompletionIntegers K; for an infinite place w, X₀(O_w) := X(K_w). Use the names `TauCeti.AdelicPoints.IntegralModel K A` (a structure holding A₀, finite generation and the spanning condition) with `IntegralModel.integralPoints`.

K a number field; A a finitely generated commutative K-algebra; A₀ a finitely generated 𝓞_K-subalgebra with K·A₀ = A. Models over rings of S-integers are the localisations A₀[1/N]; since the restricted product only sees almost all places, 𝓞_K-models suffice.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 49; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 3.4(b), p. 95.)

A₀ is torsion free over 𝓞_K (a subring of the K-vector space A), so A₀ ⊗_{𝓞_K} K is the localisation of A₀ at 𝓞_K ∖ {0}, which is K·A₀ = A.

A K-algebra map x : A → K_v is determined by its restriction to A₀, and x ∈ X₀(O_v) iff that restriction lands in O_v; so X₀(O_v) is identified with the 𝓞_K-algebra maps A₀ → O_v.

If a₁, …, a_n generate A₀ over 𝓞_K, then X₀(O_v) = {x : x(aᵢ) ∈ O_v for all i}, because O_v is a subring containing the image of 𝓞_K.

Its interface consists of the following operations and laws.

- `TauCeti.AdelicPoints.IntegralModel.integralPoints`: The set X₀(O_v) ⊆ X(K_v) of points integral on A₀, for a finite place v.
- `TauCeti.AdelicPoints.IntegralModel.mem_integralPoints_iff`: x ∈ X₀(O_v) iff x(aᵢ) ∈ O_v for a chosen finite family of 𝓞_K-algebra generators aᵢ of A₀.
- `TauCeti.AdelicPoints.IntegralModel.ofGenerators`: The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model.

**Checks.**

- `TauCeti.AdelicPoints.IntegralModel.tests.affine_line`: For K = ℚ, A = ℚ[X], A₀ = ℤ[X], X₀(ℤ_p) corresponds to ℤ_p ⊆ ℚ_p under evaluation at X.
- `TauCeti.AdelicPoints.IntegralModel.tests.base`: For A = K and A₀ = 𝓞_K, X₀(O_v) = X(K_v) is the single point at every v.
- `TauCeti.AdelicPoints.IntegralModel.tests.rescaled`: For A = ℚ[X], the models ℤ[X] and ℤ[X/2] have different integral points at 2 (ℤ₂ versus 2ℤ₂), so the integral points depend on the model at finitely many places.
- `TauCeti.AdelicPoints.IntegralModel.tests.no_integral_point`: For A = ℚ[X]/(3X − 1) and A₀ = ℤ[X]/(3X − 1) ≅ ℤ[1/3], the unique point 1/3 lies in X(ℚ₃) but X₀(ℤ₃) is empty, while X₀(ℤ_p) = X(ℚ_p) for every p ≠ 3.
- For A = ℚ[X] and A₀ = ℤ[X], X₀(ℤ_p) is ℤ_p inside ℚ_p.
- Different models may differ at finitely many places: for A = ℚ[X], A₀ = ℤ[X] and A₀′ = ℤ[X/2] have X₀(ℤ₂) = ℤ₂ ≠ 2ℤ₂ = X₀′(ℤ₂), and agree at every odd p (§2.3 (Integral models exist and agree at almost all places)).

*Needs:* §2.1 (Adelic points of an affine variety); ReductiveGroupsPartII §RG2.0.3; Mathlib `Algebra.adjoin`; Mathlib `Algebra.FiniteType`; Mathlib `IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`.


### 2.3 Integral models exist and agree at almost all places

Prove `TauCeti.AdelicPoints.IntegralModel.eventually_integralPoints_eq`. Let K be a number field and A a finitely generated commutative K-algebra. (a) The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model (§2.2 (Integral models and their integral local points)). (b) For two integral models A₀, A₀′ there is a nonzero N ∈ 𝓞_K with A₀[1/N] = A₀′[1/N] inside A; consequently X₀(O_v) = X₀′(O_v) for every finite place v not dividing N, i.e. for all but finitely many v.

A finitely generated over K; A₀, A₀′ finitely generated 𝓞_K-subalgebras spanning A over K.

([Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.4(3), p. 5; [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, p. 6.)

(a) The subalgebra generated by K-algebra generators a₁, …, a_n is finitely generated over 𝓞_K, and its K-span contains the aᵢ and is a K-subalgebra, hence is A.

(b) Each of the finitely many generators of A₀′ lies in A = K·A₀, so it is a/m with a ∈ A₀ and m ∈ 𝓞_K ∖ {0}; let N₁ be the product of these denominators, so A₀′ ⊆ A₀[1/N₁]. Symmetrically A₀ ⊆ A₀′[1/N₂]. With N = N₁N₂, A₀[1/N] = A₀′[1/N].

If v does not divide N, N is a unit of O_v, so a K-algebra map x : A → K_v with x(A₀) ⊆ O_v also sends A₀[1/N], hence A₀′, into O_v, and conversely.

Only finitely many height-one primes contain N ≠ 0 (a nonzero element of a Dedekind domain lies in finitely many maximal ideals).

**Checks.**

- The models ℤ[X] and ℤ[X/2] of ℚ[X] satisfy (b) with N = 2.

*Needs:* §2.2 (Integral models and their integral local points); Mathlib `IsLocalization.Away`; Mathlib `IsDedekindDomain.HeightOneSpectrum`.


### 2.4 Adelic points as a restricted product

Prove `TauCeti.AdelicPoints.restrictedProductHomeomorph`. Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model (§2.2 (Integral models and their integral local points)). Then the local projections give a homeomorphism X(𝔸_K) ≃ₜ (∏_{w infinite} X(K_w)) × Πʳ_{v finite} [X(K_v), X₀(O_v)], where the second factor is Mathlib's restricted product of the X(K_v) with respect to the subsets X₀(O_v) (RestrictedProduct, with its restricted-product topology). In particular an element of X(𝔸_K) is exactly a family (x_v) of local points with x_v ∈ X₀(O_v) for all but finitely many finite v, and the restricted product does not depend on the model (§2.3 (Integral models exist and agree at almost all places)).

K a number field; A finitely generated; A₀ an integral model. The infinite places are finitely many, so their factor is an ordinary product.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 50; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 3.4(c), p. 95; [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.6, p. 6.)

Product decomposition: §2.1 (Adelic points of an affine variety) reduces the statement to the finite adeles 𝔸_K^f = Πʳ_v [K_v, O_v].

Bijection: let a₁, …, a_n generate A₀ over 𝓞_K (they then generate A over K). For a K-algebra map φ : A → 𝔸_K^f, each φ(aᵢ) is a finite adele, so it lies in O_v for all v outside a finite set Tᵢ (RestrictedProduct.eventually); for v outside T = ⋃ Tᵢ the v-component x_v of φ sends every aᵢ, hence A₀, into O_v. Conversely a family (x_v) with x_v(A₀) ⊆ O_v for almost all v defines a family of adeles (x_v(a))_v for each a ∈ A (a = b/m with b ∈ A₀, and m is a unit at almost all v), and a K-algebra map into the restricted product, because ring operations in the restricted product are componentwise.

Topology: by ReductiveGroupsPartII §RG2.0.1 both sides embed as the zero set of the same ideal, the left side in (𝔸_K^f)ⁿ and the right side in Πʳ_v [K_vⁿ, O_vⁿ], through the values at a₁, …, a_n; and (𝔸_K^f)ⁿ = Πʳ_v [K_vⁿ, O_vⁿ] as topological rings (a finite product of restricted products is the restricted product of the products; open O_v). Under this identification the two embeddings agree, so the bijection is a homeomorphism.

Openness of the X₀(O_v): they are cut out by the open conditions x(aᵢ) ∈ O_v (§2.2 (Integral models and their integral local points)), which is what makes the restricted-product topology the right one (RestrictedProduct.isOpen_forall_mem).

Model independence: two models have the same integral points at almost all v, and a restricted product only depends on the subsets at almost all indices.

Its interface consists of the following operations and laws.

- `TauCeti.AdelicPoints.restrictedProductHomeomorph`: X(𝔸_K) ≃ₜ (Π w, X(K_w)) × Πʳ v, [X(K_v), X₀(O_v)] for an integral model A₀, given by the local projections.
- `TauCeti.AdelicPoints.eventually_mem_integralPoints`: For every adelic point x and every integral model, finiteProj v x ∈ X₀(O_v) for all but finitely many v.
- `TauCeti.AdelicPoints.mk_of_eventually`: A family of local points, integral on A₀ at almost all finite places, defines an adelic point with these projections.

**Checks.**

- For A = K[X], the theorem is Mathlib's definition of the finite adele ring as Πʳ_v [K_v, O_v] (with the model 𝓞_K[X]).
- For A=K with model 𝓞_K every factor and the restricted product are singletons. In contrast A=ℚ[X]/(X²+1) has an empty real factor, so its full adelic space is empty even though the factors at primes p≡1 mod 4 are nonempty.
- For A = K[X, Y]/(XY − 1) with model 𝓞_K[X, Y]/(XY − 1), it describes the idele group as the restricted product of the K_vˣ with respect to the O_vˣ, as groups and topologically; this agrees with Mathlib's unitsEquiv as groups.

*Needs:* §2.1 (Adelic points of an affine variety); §2.2 (Integral models and their integral local points); §2.3 (Integral models exist and agree at almost all places); ReductiveGroupsPartII §RG2.0.1; Mathlib `RestrictedProduct`; Mathlib `RestrictedProduct.topologicalSpace`; Mathlib `RestrictedProduct.eventually`; Mathlib `RestrictedProduct.isOpen_forall_mem`.


### 2.5 Adelic points exist iff local points exist and are integral almost everywhere

Prove `TauCeti.AdelicPoints.nonempty_iff`. Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model. Then X(𝔸_K) is nonempty iff X(K_w) is nonempty for every infinite place w, X(K_v) is nonempty for every finite place v, and X₀(O_v) is nonempty for all but finitely many finite v. In particular X(K) ≠ ∅ implies X(𝔸_K) ≠ ∅ (through the diagonal), and X(𝔸_K) = ∅ as soon as X has no point over a single completion.

As in §2.4 (Adelic points as a restricted product).

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.1.1, p. 228.)

By §2.4 (Adelic points as a restricted product), an adelic point is a family of local points integral at almost all v; such a family exists iff every local set is nonempty and the integral subsets are nonempty at almost all v (choose integral points there and arbitrary points at the finitely many remaining places).

The diagonal image of a K-point is an adelic point (§2.1 (Adelic points of an affine variety)).

**Checks.**

- For A = ℚ[X]/(X² + 1): X(ℝ) = ∅, so X(𝔸_ℚ) = ∅.
- Local points must exist at every place: for A = ℚ[X]/(X² − 2), X(ℚ_p) is empty for every p ≡ ±3 mod 8, so X(𝔸_ℚ) = ∅ although X(ℝ) ≠ ∅.
- The lemma says nothing about X(K): the Brauer–Manin set (§2.9 (The Brauer–Manin pairing and the Brauer–Manin set)) refines this necessary condition.

*Needs:* §2.4 (Adelic points as a restricted product); §2.1 (Adelic points of an affine variety).


### 2.6 Rational points are discrete and closed in adelic points

Prove `TauCeti.AdelicPoints.isClosed_range_diagonal`. Let K be a number field and A a finitely generated commutative K-algebra. The diagonal ι : X(K) → X(𝔸_K) is injective, and its image is a discrete closed subset of X(𝔸_K).

K a number field; A finitely generated.

([Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.3, p. 3.)

Choose a presentation of A. By ReductiveGroupsPartII §RG2.0.1, X(𝔸_K) embeds as a closed subset of 𝔸_Kⁿ, compatibly with the embedding X(K) ⊆ Kⁿ, and ι is the restriction of the diagonal Kⁿ → 𝔸_Kⁿ.

K is discrete and closed in 𝔸_K (Tau Ceti discreteTopology_principalSubgroup, isClosed_principalSubgroup), so Kⁿ is discrete and closed in 𝔸_Kⁿ, and its intersection with X(𝔸_K) is the image of ι (a tuple in Kⁿ satisfies the equations in 𝔸_K iff it satisfies them in K, since K → 𝔸_K is injective).

Discreteness also follows from ReductiveGroupsPartII §RG2.0.1.

**Checks.**

- For A = K[X], the image of ι is the principal subgroup K ⊆ 𝔸_K.

*Needs:* §2.1 (Adelic points of an affine variety); ReductiveGroupsPartII §RG2.0.1; Tau Ceti `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`; Tau Ceti `TauCeti.GlobalNumberFields.isClosed_principalSubgroup`; Mathlib `NumberField.AdeleRing.principalSubgroup`.


### 2.7 Spreading out an Azumaya algebra over an integral model

Prove `TauCeti.BrauerManin.exists_azumaya_model`. Let K be a number field, A a finitely generated commutative K-algebra with integral model A₀ (§2.2 (Integral models and their integral local points)), and 𝒜 an Azumaya A-algebra. Then there are a nonzero N ∈ 𝓞_K and an Azumaya A₀[1/N]-algebra 𝒜₀ with A ⊗_{A₀[1/N]} 𝒜₀ ≅ 𝒜 as A-algebras.

A = A₀ ⊗_{𝓞_K} K is the filtered colimit of the rings A₀[1/N], N ∈ 𝓞_K ∖ {0}.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6, Corollary 6.6.11, p. 189; [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.4(1), p. 5.)

𝒜 is finitely presented as an A-module (finite projective) and as an A-algebra; choose a finite presentation of the module and of the multiplication table. Its finitely many coefficients lie in A₀[1/N] for some N, giving an A₀[1/N]-algebra 𝒜₀ with A ⊗ 𝒜₀ ≅ 𝒜 (descent of finitely presented objects to a stage of a filtered colimit).

Projectivity: a finitely presented module whose base change to the colimit is projective is projective after enlarging N (a projective module is a direct summand of a free one; the splitting is a finite amount of data and descends).

Bijectivity of 𝒜₀ ⊗ 𝒜₀ᵐᵒᵖ → End(𝒜₀): a map of finite projective modules which becomes bijective over the colimit is bijective after enlarging N (its inverse and the two composite identities are finitely many equations). Faithfulness: positive rank at every prime holds after enlarging N, since the rank function is locally constant and positive on A.

This is the Azumaya form of Poonen's Corollary 6.6.11 (spreading out a Brauer class), which Poonen proves for cohomological Brauer classes through the limit theorem for étale cohomology.

**Checks.**

- A constant algebra A ⊗_K D with D central simple over K spreads out over A₀[1/N] as A₀[1/N] ⊗ D₀ for any 𝓞_K[1/N]-order D₀ of D which is Azumaya over 𝓞_K[1/N] (N divisible by the ramified primes of D).

*Needs:* §2.2 (Integral models and their integral local points); SchemeAndStackFoundations §2.22, Azumaya.pullback and azumaya_affine_iff; Mathlib `IsAzumaya`; Mathlib `IsLocalization.Away`; Mathlib `Module.Projective`.


### 2.8 Brauer evaluation is trivial at almost all places

Prove `TauCeti.BrauerManin.finite_eval_ne_zero`. Let K be a number field, A a finitely generated commutative K-algebra, 𝒜 an Azumaya A-algebra and x ∈ X(𝔸_K) an adelic point (§2.1 (Adelic points of an affine variety)). Then 𝒜(x_v) = 0 in Br(K_v) for all but finitely many finite places v, where x_v is the local projection of x (SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field).

K a number field; A finitely generated; 𝒜 Azumaya over A.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Proposition 8.2.1, p. 229; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, proof of Proposition 8.2.1, p. 229.)

Choose an integral model A₀ (§2.3 (Integral models exist and agree at almost all places) (a)) and spread 𝒜 out to an Azumaya A₀[1/N]-algebra 𝒜₀ (§2.7 (Spreading out an Azumaya algebra over an integral model)).

By §2.4 (Adelic points as a restricted product), x_v ∈ X₀(O_v) for all but finitely many v; discard also the finitely many v dividing N. For the remaining v, x_v restricts to an 𝓞_K-algebra map A₀[1/N] → O_v (N is a unit in O_v).

Then K_v ⊗_{A, x_v} 𝒜 ≅ K_v ⊗_{O_v} (O_v ⊗_{A₀[1/N]} 𝒜₀), and O_v ⊗ 𝒜₀ is Azumaya over O_v (SchemeAndStackFoundations §2.22, Azumaya.pullback and azumaya_affine_iff), hence split (SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing); so 𝒜(x_v) = 0.

**Checks.**

- For a constant algebra A ⊗_K D, the exceptional places are among the places where D ramifies, whatever the adelic point.
- The finite set depends on x: for A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, a point with t = p at the place p gives the local class of (−1, p) over ℚ_p, which is nontrivial for p ≡ 3 mod 4.

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; §2.7 (Spreading out an Azumaya algebra over an integral model); SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing; §2.4 (Adelic points as a restricted product); §2.3 (Integral models exist and agree at almost all places).


### 2.9 The Brauer–Manin pairing and the Brauer–Manin set

Define `TauCeti.BrauerManin.pairing`. Let K be a number field and A a finitely generated commutative K-algebra. For each place v let inv_v : Br(K_v) → ℚ/ℤ be the local invariant (finite places: the invariant map of local class field theory, supplied by ClassFieldTheory Layer 5; real places: Br(ℝ) ≅ ½ℤ/ℤ; complex places: 0). For an Azumaya A-algebra 𝒜 and x ∈ X(𝔸_K), the Brauer–Manin pairing is ⟨𝒜, x⟩ := Σ_v inv_v(𝒜(x_v)) ∈ ℚ/ℤ, a finite sum by §2.8 (Brauer evaluation is trivial at almost all places) (only finitely many terms are nonzero, and there are finitely many infinite places). The Brauer–Manin set of 𝒜 is X(𝔸_K)^𝒜 := {x : ⟨𝒜, x⟩ = 0}, and X(𝔸_K)^Br := ⋂_𝒜 X(𝔸_K)^𝒜 over all Azumaya A-algebras. There is a Brauer–Manin obstruction to the local-global principle for X if X(𝔸_K) ≠ ∅ and X(𝔸_K)^Br = ∅. Use the names `TauCeti.BrauerManin.pairing`, `brauerSet`, `brauerManinSet`, with ℚ/ℤ as AddCircle (1 : ℚ).

K a number field; A finitely generated; the local invariant maps are the ClassFieldTheory Layer 5 declarations, used as given homomorphisms Br(K_v) → ℚ/ℤ. Br here is the Azumaya Brauer group of the affine scheme; the comparison with Poonen's cohomological Br X is an additional required contract.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Definition 8.2.5, p. 230; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Definition 8.2.7, p. 230.)

Finite support: §2.8 (Brauer evaluation is trivial at almost all places) at the finite places; the infinite places are finite in number.

The pairing is additive in 𝒜 (SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field (b) and additivity of each inv_v) and depends only on the Azumaya class; isomorphic algebras give the same sets.

X(𝔸_K)^𝒜 = X(𝔸_K) when 𝒜 is split (End_A(P)): every evaluation is 0.

Its interface consists of the following operations and laws.

- `TauCeti.BrauerManin.pairing`: pairing 𝒜 x = Σ_v inv_v (eval 𝒜 (x_v)) in AddCircle (1 : ℚ), a finite sum.
- `TauCeti.BrauerManin.pairing_tensor`: pairing (𝒜 ⊗[A] 𝒜′) x = pairing 𝒜 x + pairing 𝒜′ x.
- `TauCeti.BrauerManin.pairing_end`: pairing (Module.End A P) x = 0 for P finite projective of positive rank.
- `TauCeti.BrauerManin.brauerSet`: brauerSet 𝒜 = {x | pairing 𝒜 x = 0}.
- `TauCeti.BrauerManin.brauerManinSet`: The intersection of brauerSet 𝒜 over all Azumaya A-algebras 𝒜.
- `TauCeti.BrauerManin.HasObstruction`: The proposition X(𝔸_K) ≠ ∅ ∧ brauerManinSet = ∅.

**Checks.**

- `TauCeti.BrauerManin.tests.pairing_trivial`: pairing A x = 0 for every adelic point x, so brauerSet A = X(𝔸_K).
- `TauCeti.BrauerManin.tests.pairing_matrix`: pairing (Matrix (Fin 2) (Fin 2) A) x = 0.
- `TauCeti.BrauerManin.tests.empty`: If X(𝔸_K) is empty (for instance A = ℚ[X]/(X² + 1)), then HasObstruction is false.
- `TauCeti.BrauerManin.tests.hamilton_constant`: For K = ℚ, A = ℚ and 𝒜 the Hamilton quaternions, X(𝔸_ℚ) is one point and pairing 𝒜 at it is inv_∞(ℍ) + inv_2(ℍ ⊗ ℚ₂) = ½ + ½ = 0.
- `TauCeti.BrauerManin.tests.brauer_set_subset`: brauerManinSet ⊆ brauerSet 𝒜 ⊆ X(𝔸_K) for every 𝒜.
- The Brauer–Manin set of the trivial algebra is all of X(𝔸_K).
- If X(𝔸_K) = ∅ there is no Brauer–Manin obstruction in this sense: the definition requires adelic points.
- A nonempty Brauer–Manin set does not by itself give a rational point (Poonen §8.6); the set is only an upper bound for the closure of X(K).

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; §2.8 (Brauer evaluation is trivial at almost all places); §2.1 (Adelic points of an affine variety); Tau Ceti `TauCeti.Quaternion.brauerGroupMulEquiv`; Mathlib `AddCircle`.


### 2.10 Rational points lie in the Brauer–Manin set

Prove `TauCeti.BrauerManin.diagonal_mem_brauerManinSet`. Let K be a number field and A a finitely generated commutative K-algebra. For every K-point x ∈ X(K) and every Azumaya A-algebra 𝒜, ⟨𝒜, ι(x)⟩ = 0. Hence ι(X(K)) ⊆ X(𝔸_K)^Br, and a Brauer–Manin obstruction (X(𝔸_K) ≠ ∅, X(𝔸_K)^Br = ∅) implies X(K) = ∅.

As in §2.9 (The Brauer–Manin pairing and the Brauer–Manin set); the reciprocity law Σ_v inv_v(res_v β) = 0 for β ∈ Br(K) is the ClassFieldTheory Layer 10 theorem.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Proposition 8.2.2, p. 230; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Corollary 8.2.6, p. 230.)

For x ∈ X(K), the local projections of ι(x) are x followed by K → K_v, so by naturality (SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field (a)) 𝒜(ι(x)_v) = res_v(𝒜(x)) with 𝒜(x) ∈ Br(K).

Hence ⟨𝒜, ι(x)⟩ = Σ_v inv_v(res_v(𝒜(x))), which vanishes by the reciprocity law of the Albert–Brauer–Hasse–Noether sequence 0 → Br K → ⊕_v Br K_v → ℚ/ℤ → 0.

The inclusion in X(𝔸_K)^Br follows for all 𝒜 at once, and the obstruction statement is its contrapositive.

**Checks.**

- For the constant algebra A ⊗ D of a central simple K-algebra D, the pairing vanishes on every adelic point whose local components come from K-points, and more generally ⟨A ⊗ D, x⟩ = Σ_v inv_v(D_v) = 0 for every adelic point (constant algebras give no obstruction).

*Needs:* §2.9 (The Brauer–Manin pairing and the Brauer–Manin set); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; §2.1 (Adelic points of an affine variety).


### 2.11 Adelic points of separated schemes of finite type

For a separated finite-type K-scheme X over a number field, choose a model 𝒳 over O_{K,S}. Define X(𝔸_K) as the union over finite T⊇S of Π_{v∈T}X(K_v)×Π_{v∉T}𝒳(O_v), equipped with the direct-limit topology. The topology is independent of the model and recovers the affine restricted product. Rational points map diagonally and morphisms induce continuous maps. For proper X the model is proper outside a finite set, and the adelic space is the product of all local spaces. A finite affine cover of X does not in general cover its adelic points: different places may require different charts. A global open immersion induces a continuous injection, generally not a topological embedding.

X separated of finite type over a number field K; places include the archimedean ones.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, pp. 49–50, and Exercise 3.4, p. 95; [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Proposition 3.1, Theorem 3.6 and its proof, pp. 5–8.)

Conrad §3 gives the §2.2 (Integral models and their integral local points) direct-limit construction and its model independence; compare with the affine case using finite presentation.

Extend each morphism to models after enlarging S. On every finite T-stage the induced map is continuous, hence continuous for the direct-limit topology.

For proper X, the valuative criterion identifies integral and local points outside S. Conrad §4, pp.9–10, shows why global affine-chart gluing and global open-immersion embeddings are invalid.

Its interface consists of the following operations and laws.

- `TauCeti.adelicPoints`: X(𝔸_K) with its topology, for X separated of finite type.
- `TauCeti.adelicPoints.diagonal`: X(K) → X(𝔸_K).
- `TauCeti.adelicPoints.proj`: X(𝔸_K) → X(K_v), continuous, for each place v.
- `TauCeti.adelicPoints.map`: A morphism f : X → Y induces a continuous map X(𝔸) → Y(𝔸), with map_id and map_comp.
- `TauCeti.adelicPoints.homeomorph_pi_of_proper`: For X proper, X(𝔸_K) ≃ₜ Π_v X(K_v).
- `TauCeti.adelicPoints.continuous_injective_of_open`: An open immersion induces a continuous injective map; an open-embedding assertion is available for each local point space, not generally for global adelic points.
- `TauCeti.adelicPoints.isClosedEmbedding_of_closed`: A closed immersion induces a closed embedding.

**Checks.**

- `adelicPoints.test_projectiveLine`: ℙ¹(𝔸_ℚ) ≃ₜ Π_v ℙ¹(ℚ_v).
- `adelicPoints.test_point`: For X = Spec K, X(𝔸_K) is a single point.
- `adelicPoints.test_affine_line`: 𝔸¹(𝔸_K) ≃ₜ 𝔸_K, Mathlib's adele ring NumberField.AdeleRing K.
- `adelicPoints.test_gm_not_product`: 𝔾_m(𝔸_ℚ) is the idele group, not the product Π_v ℚ_v^× (which is not locally compact).
- `adelicPoints.test_idele_inclusion`: The inclusion 𝔾_m(𝔸_ℚ)→𝔸¹(𝔸_ℚ) is continuous injective but is not a topological embedding. Adelic projective-line points can use different affine charts at different places, so neither of its two standard affine adelic charts need contain an arbitrary adelic point.
- For X = ℙ¹, X(𝔸_ℚ) = Π_v ℙ¹(ℚ_v), compact.
- For X = 𝔾_m = Spec ℚ[t, 1/t], X(𝔸_ℚ) is the idele group with its idelic topology.

*Needs:* §2.1 (Adelic points of an affine variety); §2.4 (Adelic points as a restricted product); §2.3 (Integral models exist and agree at almost all places); ReductiveGroupsPartII §RG2.0.1.


### 2.12 Local constancy of Brauer evaluation

Prove `TauCeti.SchemeBrauer.eval_locallyConstant`. Let k be a local field and X a k-variety. For α ∈ Br X, the map X(k) → Br k, x ↦ α(x), is locally constant for the analytic topology on X(k). If k is nonarchimedean with ring of integers O, 𝒳 is a finite-type O-model and α extends to Br 𝒳, then x ↦ α(x) is constant on 𝒳(O) and equal to 0 when Br O = 0.

k a local field; X of finite type over k.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Proposition 8.2.9 and proof, Remark 8.2.10, pp. 230–231.)

Near x the class extends over the henselisation of the local ring at the point; Brauer classes of henselian local rings are determined by the residue field (SchemeAndStackFoundations Layer 2/brauer-henselian-local), and nearby points factor through a common henselian neighbourhood (Poonen Proposition 8.2.9 and its proof).

For O-points of a model: the class extends over Spec O, and Br O = 0 for complete discrete valuation rings with finite residue field (SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing).

**Checks.**

- For the Brauer class (t,−1) on 𝔾_m,ℝ, the evaluation is constant on each sign component of ℝ× and the two values differ. The class is ramified at 0 and ∞, so it is not a class on ℙ¹_ℝ.

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; SchemeAndStackFoundations §§2.3, 2.11, 2.15 and 2.22, with the Brauer comparison/purity contracts above; SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing; §2.11 (Adelic points of separated schemes of finite type).


### 2.13 The Brauer–Manin pairing and set for varieties

For a variety X over a number field K, the Brauer–Manin pairing X(𝔸_K) × Br X → ℚ/ℤ, ((x_v), α) ↦ Σ_v inv_v α(x_v), is well defined (α(x_v) = 0 for almost all v), additive in α, continuous and locally constant in (x_v) for each fixed α. For a subgroup B ⊆ Br X, X(𝔸_K)^B is the set of adelic points orthogonal to B, and X(𝔸_K)^{Br} = X(𝔸_K)^{Br X}. Rational points are orthogonal to Br X: X(K) ⊆ X(𝔸_K)^{Br}. There is a Brauer–Manin obstruction to the local-global principle when X(𝔸_K) ≠ ∅ but X(𝔸_K)^{Br} = ∅. On affine X with Azumaya classes this is §2.9 (The Brauer–Manin pairing and the Brauer–Manin set).

K a number field; X separated of finite type over K; Br X is the Azumaya Brauer group of SchemeAndStackFoundations §2.22. inv_v is the local invariant of ClassFieldTheory Layer 5 (inv_∞ ∈ ½ℤ/ℤ at real places, 0 at complex places).

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1–8.2.2, Proposition 8.2.1, Proposition 8.2.2, Corollary 8.2.6, pp. 229–231.)

Finite support: spread X and α out to O_{K,S}; for v ∉ S, x_v ∈ 𝒳(O_v) and α(x_v) ∈ Br O_v = 0 (Poonen Proposition 8.2.1; §2.8 (Brauer evaluation is trivial at almost all places) for the affine case).

Orthogonality of rational points: α(x) ∈ Br K and Σ_v inv_v = 0 (ClassFieldTheory Layer 10; Poonen Proposition 8.2.2, Corollary 8.2.6).

Its interface consists of the following operations and laws.

- `TauCeti.brauerManinPairing`: X(𝔸_K) → Br X →+ ℚ/ℤ.
- `TauCeti.brauerManinSet`: X(𝔸_K)^B for B ⊆ Br X.
- `TauCeti.brauerManinPairing_diagonal`: The pairing vanishes on the diagonal image of X(K).
- `TauCeti.brauerManinPairing_constant`: Constant classes pair to 0 with every adelic point.
- `TauCeti.brauerManinSet_antitone`: B ⊆ B' ⇒ X(𝔸)^{B'} ⊆ X(𝔸)^B.
- `TauCeti.brauerManinPairing_continuous`: For each fixed α∈Br X, the scalar-valued function x↦⟨x,α⟩ is locally constant and continuous. No assertion is made that the map into the entire discrete Hom(Br X,ℚ/ℤ) is locally constant when Br X is infinite.
- `TauCeti.brauerManinSet_affine`: On affine X it is the set of §2.9 (The Brauer–Manin pairing and the Brauer–Manin set).

**Checks.**

- `brauerManinSet.test_conic`: For a smooth conic X over ℚ, X(𝔸)^{Br} = X(𝔸) (Br X = Br_0 X since X_ℚ̄ ≅ ℙ¹).
- `brauerManinSet.test_empty_B`: X(𝔸)^{0} = X(𝔸).
- `brauerManinSet.test_affine`: On affine X with Azumaya classes it agrees with §2.9 (The Brauer–Manin pairing and the Brauer–Manin set).
- `brauerManinSet.test_nonempty_no_point`: X(𝔸)^{Br} ≠ ∅ does not imply X(K) ≠ ∅ (Skorobogatov's bielliptic surface, §3.21 (Insufficiency of the Brauer–Manin and descent obstructions)).
- For constant α = π*β, β ∈ Br K, the pairing is Σ_v inv_v β = 0 for every adelic point.

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; §2.11 (Adelic points of separated schemes of finite type); §2.9 (The Brauer–Manin pairing and the Brauer–Manin set); §2.8 (Brauer evaluation is trivial at almost all places); §2.10 (Rational points lie in the Brauer–Manin set); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).


### 2.14 Topology of Brauer–Manin sets

Prove `TauCeti.isClosed_brauerManinSet`. For X a variety over a number field K and B ⊆ Br X: X(𝔸)^B is closed in X(𝔸); for B finite (or finitely generated) it is open and closed; the closure of X(K) in X(𝔸) lies in X(𝔸)^{Br}. Hence for X proper, if X(𝔸)^{Br} ≠ X(𝔸) then X does not satisfy weak approximation.

K a number field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Corollary 8.2.11, p. 232.)

Each α ↦ pairing is locally constant (§2.12 (Local constancy of Brauer evaluation) plus finite support), so X(𝔸)^{α} is open and closed; intersect over α ∈ B.

X(K) ⊆ X(𝔸)^{Br} and closedness give the closure statement (Poonen Corollary 8.2.11).

For a fixed α and an adelic point, spread α and choose an §2.2 (Integral models and their integral local points) neighborhood on which all evaluations outside one finite S vanish uniformly. Pointwise finite support alone does not prove local constancy of the sum.

**Checks.**

- The Iskovskikh surface has X(𝔸) ≠ ∅ = X(𝔸)^{Br}, so X(ℚ) = ∅.

*Needs:* §2.13 (The Brauer–Manin pairing and set for varieties); §2.12 (Local constancy of Brauer evaluation).


### 2.15 Functoriality of Brauer–Manin sets

Prove `TauCeti.brauerManinSet_map`. For a morphism π : X' → X of K-varieties and B ⊆ Br X, π(X'(𝔸)^{π*B}) ⊆ X(𝔸)^B; in particular π(X'(𝔸)^{Br}) ⊆ X(𝔸)^{Br}, so X ↦ X(𝔸)^{Br} is functorial, and if X(𝔸)^{Br} = ∅ then X'(𝔸)^{Br} = ∅ for every X' mapping to X.

K a number field; π a morphism of finite-type separated K-schemes.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.1, Proposition 8.1.8, Corollaries 8.1.9 and 8.1.10, pp. 228–229.)

Naturality of evaluation: (π*α)(x') = α(π x') (SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field), summed over places (Poonen Proposition 8.1.8 for the functor Br, Corollaries 8.1.9–8.1.10).

**Checks.**

- Any variety mapping to the Iskovskikh surface has empty Brauer–Manin set.

*Needs:* §2.13 (The Brauer–Manin pairing and set for varieties); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field.


### 2.16 Constant and algebraic Brauer groups

For a variety X over a field k with separable closure k^s: Br₀(X) = image of Br k → Br X (the image, which need not be injective); Br₁(X) = ker(Br X → Br X_{k^s}); Br₀ ⊆ Br₁. If X is smooth geometrically integral with k^s[X]^× = k^{s×}, the Hochschild–Serre spectral sequence gives an exact sequence Br k → Br₁ X → H¹(k, Pic X_{k^s}) → H³(k, 𝔾_m), so Br₁ X/Br₀ X ≅ H¹(k, Pic X_{k^s}) over number fields (H³(k, 𝔾_m) = 0). The Brauer–Manin pairing restricted to Br₀ is zero, so it factors through Br X/Br₀ X.

X a k-variety; Br is the Azumaya Brauer group of SchemeAndStackFoundations §2.22. For smooth quasi-projective X, its equality with the cohomological group uses the additional Gabber comparison contract above. The Hochschild–Serre statement is naturally for the cohomological Brauer group. To identify it with the Azumaya group used here, assume the Gabber comparison hypotheses (in particular regular quasi-projective X over a field), or carry the comparison map explicitly.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Notations, p. 6; [The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2 p. 8; §3, display (3.1), pp. 8–9; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.7.2, Theorem 6.7.5 and Corollary 6.7.8, pp. 195–196.)

Definitions are images and kernels of pullback maps (Layer 2/pullback).

The exact sequence is SchemeAndStackFoundations Layer 2/brauer-hochschild-serre-sequence; H³(k, 𝔾_m) = 0 for number fields is ClassFieldTheory Layer 10.

Its interface consists of the following operations and laws.

- `TauCeti.brauerZero`: Br₀(X) ≤ Br X, the image of Br k.
- `TauCeti.brauerOne`: Br₁(X) ≤ Br X, the kernel of base change to k^s.
- `TauCeti.brauerZero_le_brauerOne`: Br₀ ≤ Br₁.
- `TauCeti.brauerOne_quotient_equiv`: Over a number field with k^s[X]^× = k^{s×}, Br₁/Br₀ ≃ H¹(k, Pic X_{k^s}).
- `TauCeti.brauerManinPairing_brauerZero`: The pairing vanishes on Br₀.
- `TauCeti.brauerZero_injective_of_point`: If X(k) ≠ ∅ then Br k → Br X is injective.

**Checks.**

- `brauerOne.test_projectiveSpace`: For X = ℙⁿ_k, Br X = Br₀ X = Br₁ X ≅ Br k.
- `brauerOne.test_point`: For X = Spec k, Br₀ = Br₁ = Br k.
- `brauerOne.test_conic_no_point`: For a pointless conic C over ℚ, Br ℚ → Br C has nonzero kernel (the class of the quaternion algebra of C); Br₀ C is a proper quotient of Br ℚ, not a copy of it.
- `brauerOne.test_transcendental`: Br₁ ≠ Br in general: transcendental classes (nonzero image in Br X_{k^s}) exist on some K3 surfaces, so testing Br₁ alone can miss an obstruction.
- If X(k) ≠ ∅, Br k → Br X is injective (split by a point).

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup and brauer_field; SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback; SchemeAndStackFoundations §§2.3, 2.11, 2.15 and 2.22, with the Brauer comparison/purity contracts above; §2.13 (The Brauer–Manin pairing and set for varieties); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).


### 2.17 The unramified Brauer group

For a smooth geometrically integral variety V over a field k of characteristic 0, Br_nr(V) is the image of Br(V^c) → Br(V) for a smooth proper compactification V ⊆ V^c; it does not depend on V^c and equals the subgroup of Br V of classes unramified at every discrete valuation of k(V) trivial on k. Br_{1,nr}(V) = Br_nr(V) ∩ Br₁(V). For V proper, Br_nr(V) = Br V.

char k = 0 (resolution of singularities provides V^c; purity for the Brauer group gives the valuation description). The smooth-compactification proof is asserted here in characteristic zero. In positive characteristic, the all-valuations definition and appropriate purity statements require a separate proof and do not follow from resolution for curves.

([The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2, pp. 6–7; [Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Notations, p. 6; [Purity for the Brauer group](https://arxiv.org/abs/1711.06456v4), Theorem 1.2 (arXiv:1711.06456).)

Independence of V^c: two compactifications are dominated by a third and Br of smooth proper varieties is a birational invariant (purity; Česnavičius).

The valuative description: residues along divisors of V^c (Layer 2 Brauer of regular schemes injects into Br k(V)).

Use the regular Brauer intersection theorem (Česnavičius Thm.1.2) for codimension-one points. Passing from a chosen model to all valuations and comparing arbitrary-dimensional compactifications requires its own purity/birational contract above.

Its interface consists of the following operations and laws.

- `TauCeti.unramifiedBrauer`: Br_nr(V) ≤ Br V.
- `TauCeti.unramifiedBrauer_eq_range`: Br_nr(V) = range(Br V^c → Br V) for any smooth proper compactification.
- `TauCeti.unramifiedBrauer_eq_top_of_proper`: V proper ⇒ Br_nr(V) = Br V.
- `TauCeti.unramifiedBrauer_birational`: Br_nr is a birational invariant of smooth geometrically integral varieties.
- `TauCeti.unramifiedBrauer_residue`: α ∈ Br_nr(V) iff all residues of α along divisorial valuations of k(V) vanish.

**Checks.**

- `unramifiedBrauer.test_gm`: Br_nr(𝔾_{m,ℚ}) = Br ℚ while Br 𝔾_{m,ℚ} ∋ (t, −1) ∉ Br_nr.
- `unramifiedBrauer.test_proper`: For V = ℙⁿ, Br_nr = Br.
- `unramifiedBrauer.test_two_compactifications`: ℙ² and ℙ¹ × ℙ¹ compactifying 𝔸² give the same subgroup Br k.
- `unramifiedBrauer.test_not_algebraic`: Br_nr(V) need not equal Br_{1,nr}(V).
- For V = 𝔾_m over ℚ, the class (t, −1) is ramified at t = 0 and t = ∞, so it is not in Br_nr(𝔾_m) = Br ℚ.

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup and brauer_field; SchemeAndStackFoundations §§2.3, 2.11, 2.15 and 2.22, with the Brauer comparison/purity contracts above; §2.16 (Constant and algebraic Brauer groups).


### 2.18 The unramified pairing on the full product of local points

Prove `TauCeti.unramifiedPairing_finiteSupport`. For a smooth geometrically integral variety V over a number field K, the pairing Π_v V(K_v) × Br_nr(V) → ℚ/ℤ, ((x_v), α) ↦ Σ_v inv_v α(x_v), has finite support even on the full product (not only on V(𝔸_K)); it is additive in α, locally constant, and the diagonal image of V(K) is orthogonal to Br_nr(V).

V smooth geometrically integral over a number field K.

([The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2, pp. 6–7.)

Extend α to a smooth proper compactification V^c and spread out over O_{K,S}; for v ∉ S, x_v ∈ V(K_v) ⊆ V^c(K_v) = 𝒱^c(O_v) and α(x_v) ∈ Br O_v = 0 (properness replaces integrality).

**Checks.**

- Constant classes pair to 0 with every element of the product.

*Needs:* §2.17 (The unramified Brauer group); §2.13 (The Brauer–Manin pairing and set for varieties); §2.11 (Adelic points of separated schemes of finite type).


### 2.19 Almost-everywhere locally trivial algebraic Brauer classes

For a smooth geometrically integral variety V over a number field K, B_ω(V) ⊆ Br₁(V)/Br₀(V) is the subgroup of classes whose image in Br₁(V_{K_v})/Br₀(V_{K_v}) vanishes for all but finitely many places v. Under the Hochschild–Serre identification Br₁/Br₀ ≅ H¹(K, Pic V_{K̄}) these are the classes locally trivial at almost all places. At every place outside its finite exceptional set a class of B_ω evaluates constantly on V(K_v), so its pairing with V(𝔸_K) depends only on finitely many local components; classes trivial at every place (Ш¹(K, Pic V_{K̄})) pair constantly.

K a number field; k^s[V]^× = k^{s×} for the H¹ description.

([The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §4, Remark 4.5, p. 13.)

Localisation maps on Br₁/Br₀ and on H¹(K, Pic V̄) commute with Hochschild–Serre; a class whose localisation lies in Br₀(V_{K_v}) evaluates constantly on V(K_v).

Its interface consists of the following operations and laws.

- `TauCeti.brauerOmega`: B_ω(V) ≤ Br₁(V)/Br₀(V).
- `TauCeti.mem_brauerOmega_iff`: α ∈ B_ω iff its localisation vanishes outside a finite set of places.
- `TauCeti.brauerOmega_equiv_sha`: B_ω ≅ almost-everywhere locally trivial classes of H¹(K, Pic V̄).
- `TauCeti.brauerManinPairing_brauerOmega_const`: For α ∈ B_ω there is a finite set T of places such that the pairing of α with (x_v) depends only on (x_v)_{v∈T}.

**Checks.**

- `brauerOmega.test_zero`: 0 ∈ B_ω.
- `brauerOmega.test_finite_exceptions`: A class nonzero locally at exactly one place lies in B_ω.
- `brauerOmega.test_sha_compat`: B_ω contains the classes of Ш¹(K, Pic V̄) (trivial at every place).
- `brauerOmega.test_weaker`: Almost-everywhere local triviality is weaker than local triviality at every place: B_ω can be strictly larger than Ш¹(K, Pic V̄).
- Constant classes (zero in Br₁/Br₀) lie in B_ω.

*Needs:* §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties).


### 2.20 The Brauer–Manin pairing on zero-cycles

For a smooth proper variety X over a number field K and a closed point P of X_{K_v}, put α(P) = cor_{K_v(P)/K_v}(α restricted to P) ∈ Br K_v. Extending linearly gives ⟨,⟩ : Z₀(X_{𝔸}) × Br X → ℚ/ℤ, (Σ_v z_v, α) ↦ Σ_v inv_v α(z_v), on families of local zero-cycles (z_v)_v; it vanishes on principal divisors, on norms from ℂ at archimedean places, and on the diagonal image of global zero-cycles. For a rational point it is the ordinary pairing.

X smooth proper over a number field; zero-cycles of any degree.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §1, complex (1.1), pp.2–3, and Notations et terminologie, p.6.)

Corestriction is compatible with local invariants (inv_v ∘ cor = inv_w; ClassFieldTheory Layer 5).

Rational equivalence: Weil reciprocity for Brauer classes on curves through the norm; global cycles pair to 0 by the reciprocity law for each finite extension K(P)/K.

The descent to rational equivalence requires Brauer reciprocity on curves, including specialization and corestriction for principal divisors. An intersection-number projection formula alone does not provide this theorem; it is the Brauer reciprocity contract above.

Its interface consists of the following operations and laws.

- `TauCeti.ZeroCycle.brauerEval`: α(P) for a closed point P, by corestriction.
- `TauCeti.ZeroCycle.brauerPairing`: The pairing on adelic families of zero-cycles.
- `TauCeti.ZeroCycle.brauerPairing_rationalEquivalence`: It vanishes on principal divisors.
- `TauCeti.ZeroCycle.brauerPairing_global`: Global zero-cycles pair to 0.
- `TauCeti.ZeroCycle.brauerPairing_point`: On rational points it is brauerManinPairing.
- `TauCeti.ZeroCycle.brauerPairing_pushforward`: ⟨f_*z, α⟩ = ⟨z, f*α⟩.

**Checks.**

- `ZeroCycle.brauerPairing.test_point`: A rational point gives the ordinary evaluation.
- `ZeroCycle.brauerPairing.test_complex_norm`: A real place and the cycle of a complex point (a norm from ℂ) pair to 0.
- `ZeroCycle.brauerPairing.test_zero`: The zero cycle pairs to 0.
- `ZeroCycle.brauerPairing.test_not_degree_one`: A degree-two global point pairs to 0 although it is not a rational point; orthogonality does not produce rational points.
- A rational point gives the pairing of §2.13 (The Brauer–Manin pairing and set for varieties).

*Needs:* §2.13 (The Brauer–Manin pairing and set for varieties); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 2.21 Harari's formal lemma

Prove `TauCeti.formal_lemma`. Let X be a smooth proper rationally connected variety over a number field K, V ⊆ X a dense open subset and A ⊆ Br(V) a subgroup with A/(A ∩ Br X) finite. Then V(𝔸_K)^A is dense in X(𝔸_K)^{A ∩ Br X}.

The finiteness of the quotient A/(A ∩ Br X) (not of Br V) is the hypothesis used.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), proof of Corollary 2.2, p. 8, citing Colliot-Thélène–Skorobogatov 2000 Proposition 1.1.)

**Unresolved prerequisite.** Colliot-Thélène–Skorobogatov 2000 Proposition 1.1 (as used by Harpaz–Wittenberg 2020, proof of Corollary 2.2): ramified classes can be compensated at auxiliary places by choosing local points near the boundary divisors.

**Checks.**

- For A ⊆ Br X the statement is the density of V(𝔸)^A in X(𝔸)^A (V(K_v) is dense in X(K_v)).

*Needs:* §2.14 (Topology of Brauer–Manin sets); §2.17 (The unramified Brauer group); §2.12 (Local constancy of Brauer evaluation); the auxiliary-place residue and compensation contract above, which is not yet decomposed into owned proof targets.


### 2.22 Cyclic algebras and the local invariant matrix

Let L/K be a cyclic extension of number fields of degree r with a character χ : Gal(K̄/K) → ℤ/r cutting out L. For a ∈ K_v^× the cyclic algebra (χ, a) has class in Br(K_v)[r], zero iff a is a norm from L ⊗ K_v. For polynomials P₁, …, P_n ∈ K[t] and local inputs t_v, the local invariant matrix is b_{v,i} = inv_v(χ, P_i(t_v)) ∈ (1/r)ℤ/ℤ. The value is written in the additive wrapper of the native field Brauer group; its class at parameter 1 is zero.

L/K cyclic of degree r; χ a generator of the character group of Gal(L/K). Every P_i(t_v) used as a cyclic-algebra parameter is nonzero; restrict t_v to the complement of their zero loci.

([Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §5.2, paragraph after Theorem 5.8, p. 722; (5.2) p. 722 and (5.4)–(5.10) pp. 723–724.)

The cyclic algebra and its norm criterion over local fields are ClassFieldTheory Layer 5 inputs (local invariant of cyclic algebras); the matrix is a bookkeeping device recording these invariants.

Its interface consists of the following operations and laws.

- `TauCeti.cyclicAlgebraClass`: (χ, a) ∈ Additive (TauCeti.BrauerGroup K_v).
- `TauCeti.cyclicAlgebraClass_eq_zero_iff`: (χ, a) = 0 iff a is a norm from L ⊗ K_v.
- `TauCeti.cyclicAlgebraClass_mul`: (χ, ab) = (χ, a)+(χ, b).
- `TauCeti.cyclicAlgebraClass_inv`: inv_v(χ, a) lies in (1/r)ℤ/ℤ.
- `TauCeti.localInvariantMatrix`: (b_{v,i}) for polynomials P_i and local inputs t_v.

**Checks.**

- `cyclicAlgebraClass.test_hilbert`: For r = 2 and χ of ℚ(√d), (χ, a) is the quaternion algebra (d, a).
- `cyclicAlgebraClass.test_one`: (χ, 1) = 0.
- `cyclicAlgebraClass.test_minus_one_real`: For χ of ℚ(i), inv_∞(χ, −1) = 1/2.
- `cyclicAlgebraClass.test_noncyclic`: For a noncyclic L/K the norm-from-everywhere-locally criterion fails (Hasse norm theorem fails for biquadratic ℚ(√13, √17)/ℚ), so the cyclic hypothesis cannot be dropped.
- For K = ℚ, L = ℚ(i), r = 2: (χ, a)_p = (−1, a)_p, the Hilbert symbol.
- At a root of P_i the symbol (χ,P_i(t_v)) is not a cyclic algebra with an invertible parameter; evaluation on that chart is excluded.

*Needs:* [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality); Tau Ceti `TauCeti.BrauerGroup.mk`.


### 2.23 The cyclic norm principle with one omitted place

Prove `TauCeti.isNorm_of_local_norm_off_one_place`. Let L/K be cyclic and a ∈ K^×. If a is a local norm from L at every place except possibly one, then a is a norm from L^×.

L/K cyclic (essential).

([Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), proof of Theorem 5.3, p. 720, citing Colliot-Thélène–Skorobogatov, The Brauer–Grothendieck group, Corollary 13.1.10.)

All local invariants of (χ, a) but one vanish; the sum of invariants is 0 (ClassFieldTheory Layer 10), so all vanish; the Albert–Brauer–Hasse–Noether injectivity gives (χ, a) = 0, and the cyclic splitting criterion (cyclicHasseNorm of ClassFieldTheory Layer 13) makes a a global norm.

**Checks.**

- For L = ℚ(i): if a is a sum of two squares in ℚ_p for every p ≠ 3 and in ℝ, it is a sum of two rational squares.

*Needs:* §2.22 (Cyclic algebras and the local invariant matrix); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields).


### 2.24 Assembling a global norm from a local invariant matrix

Prove `TauCeti.isNorm_prod_of_invariantMatrix`. Let L/K be cyclic and q₁,…,qₙ∈K×. Choose a finite set S of places and pairwise distinct exceptional places e_i outside S such that the invariant of (χ,q_i) vanishes outside S∪{e_i}. Put b_{v,i}=inv_v(χ,q_i) for v∈S. Require both the column conditions Σ_{v∈S}b_{v,i}=0 for every i and the row conditions Σ_i b_{v,i}=0 for every v∈S. Reciprocity kills the invariant at e_i separately for each factor; this does not kill its individual invariants at S. Distinctness makes the product invariant at each e_i equal to that now-zero single-factor invariant, while the row conditions kill the product at S. Thus the product is everywhere locally, and hence globally, a norm. Neither condition can be dropped.

L/K cyclic; the terms q_i are treated separately (no repeated-prime obstruction).

([Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), equations (5.7)–(5.10), pp. 723–724.)

Fix i and apply reciprocity to its global cyclic algebra. Its invariant at e_i is minus the column sum and hence zero; individual entries inside S can still be nonzero.

At e_i every other factor has zero invariant by distinctness. At S additivity gives the row sums. The product class vanishes at every place, so the cyclic Hasse norm theorem applies.

**Checks.**

- With n = 1 this is §2.23 (The cyclic norm principle with one omitted place) for a = q₁.
- For K=ℚ, L=ℚ(i), q₁=3, q₂=7 and S={2,∞}, the exceptional places are 3 and 7. At 2 both entries are 1/2 and at ∞ both are zero, so all row sums vanish, but the product 21 is not a local norm at 3 or 7. Columns are necessary. Conversely q₁=−1, S={2,∞}, e₁=3 has column sum 1/2+1/2=0 and no invariant at 3, but its row sums are nonzero and −1 is not a real norm. Columns cannot replace rows.

*Needs:* §2.23 (The cyclic norm principle with one omitted place); §2.22 (Cyclic algebras and the local invariant matrix); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).


### 2.25 Brauer groups of high-dimensional complete intersections

Prove `TauCeti.brauer_completeIntersection`. Let k be a field of characteristic 0 and X ⊆ ℙⁿ_k a smooth complete intersection with dim X ≥ 3. Then Br k → Br X is an isomorphism. Consequently, over a number field, X(𝔸_K)^{Br} = X(𝔸_K) (and X(𝔸)^{descent} = X(𝔸)): the Brauer–Manin and descent obstructions are vacuous. This does not prove that X has a rational point.

char k = 0; dim X ≥ 3; X a smooth complete intersection. For the §3.5 (Descent obstruction sets) consequence also use geometric étale simple connectedness of the complete intersection and the smooth proper étale–Brauer/descent comparison; Brauer vanishing by itself does not establish that consequence.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.6.3, Theorem 8.6.12 and sketch of proof, p. 252; [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/abs/2006.02356), §1, p. 2, citing Poonen–Voloch Appendix A.)

Use Lefschetz to identify Pic X_{k̄}=ℤ·O(1) and H²(X_{k̄},μ_n) with the corresponding projective-space group for every n. The Kummer sequence then gives Br X_{k̄}[n]=0; torsion gives Br X_{k̄}=0. The hyperplane bundle descends, H¹(k,ℤ)=0, and Hochschild–Serre gives Br X=Br₀ X. H³(k,𝔾_m)=0 is the number-field spectral-sequence input, not a substitute for the geometric H²/Kummer calculation.

Vacuity: constant classes pair trivially (§2.13 (The Brauer–Manin pairing and set for varieties)); descent: X_{k̄} is algebraically simply connected and Theorem 8.5.4 (§3.8 (Étale–Brauer equals descent)).

**Checks.**

- Smooth cubic threefolds and quartic threefolds in ℙ⁴ have no Brauer–Manin obstruction.

*Needs:* §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties).


### 2.26 Conics: Brauer–Manin set and the Hasse principle

Prove `TauCeti.conic_hassePrinciple`. Let C ⊆ ℙ²_K be a smooth conic over a number field K. Then Br C = Br₀ C, so C(𝔸_K)^{Br} = C(𝔸_K); C satisfies the Hasse principle (C(𝔸_K) ≠ ∅ ⇒ C(K) ≠ ∅) and weak approximation once C(K) ≠ ∅. For C : x² + y² = 3z² over ℚ, C(ℚ₃) = ∅, so C(𝔸_ℚ) = ∅.

C smooth projective conic over a number field.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §4.5, Theorem 4.5.11 (Châtelet: Severi–Brauer varieties satisfy the local-global principle), p. 108.)

C_{K̄} ≅ ℙ¹, so Pic C_{K̄} = ℤ with trivial Galois action and H¹(K, ℤ) = 0: Br₁ = Br₀ and Br C_{K̄} = 0.

Hasse principle: Hasse–Minkowski for ternary forms (TauCetiRoadmap GlobalQuadraticForms Layer 5).

**Checks.**

- x² + y² = 3z² has no ℚ₃-point (sums of two squares are not 3 times a unit square modulo 9 with the valuation count).

*Needs:* §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties); [TauCetiRoadmap.GlobalQuadraticForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-5-hasseminkowski-isotropy).


### 2.27 Iskovskikh's conic bundle surface

Prove `TauCeti.iskovskikh_brauerManin`. Let X be the smooth proper model of the affine surface y² + z² = (3 − x²)(x² − 2) over ℚ (a Châtelet surface). Then X(𝔸_ℚ) ≠ ∅ but X(𝔸_ℚ)^{𝒜} = ∅ for the quaternion class 𝒜 = (3 − x², −1) ∈ Br X; hence X(ℚ) = ∅ and the failure of the Hasse principle is explained by the Brauer–Manin obstruction.

The class 𝒜 extends from the function field to Br X (Poonen Proposition 8.2.14).

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.5, Proposition 8.2.14 and Proposition 8.2.15 with proof, pp. 232–235.)

Local solubility by Hensel's lemma at every p and at ∞.

Local invariants: inv_p 𝒜(P) = 0 for p ∉ {2, ∞} (units, Br ℤ_p = 0); inv_∞ 𝒜(P) = 0 for every real point (3 − x² or x² − 2 is positive, a norm from ℂ); inv_2 𝒜(P) = 1/2 for every P ∈ X(ℚ₂) (the relevant function is ≡ −1 mod 4, not a sum of two 2-adic squares); the sum is 1/2 ≠ 0 (Poonen Proposition 8.2.15).

**Checks.**

- The pairing of 𝒜 with every adelic point is 1/2.

*Needs:* §2.13 (The Brauer–Manin pairing and set for varieties); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; §2.12 (Local constancy of Brauer evaluation); SchemeAndStackFoundations §2.22, brauer_henselian_local and mk_eq_zero_iff; Tau Ceti finite-field Brauer vanishing.


### 2.28 Finite local partitions for a finite Brauer test; effective computation requires extra input

Prove `TauCeti.brauerManinSet_finite_description`. For a proper variety X over a number field and a finite list of Brauer classes, there is a finite set T of places and, at each v∈T, a finite partition of the compact space X(K_v) by clopen evaluation fibres. The orthogonality condition is therefore a finite constraint on these fibres. This is an existence theorem: local constancy and compactness alone do not compute T, the nonempty fibres, or a terminating local solver. An effective algorithm additionally needs certified spreading data, local solution enumeration and explicit evaluation formulae. The Iskovskikh example supplies those extra data in that particular case.

X smooth proper; B finite and given explicitly; the local invariants of ClassFieldTheory Layer 5 computed on explicit algebras.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.4, Remark 8.2.12, p. 232; §8.2.6, pp. 235–236.)

Spread the fixed finite list of classes over one integral model so that evaluation vanishes outside a common finite T.

For each v∈T use local constancy and compactness to obtain finitely many evaluation fibres; at archimedean places use the finite connected-component description. This proves a finite partition, not an algorithm.

**Checks.**

- For the Iskovskikh surface, T = {2, ∞} and the computation is Proposition 8.2.15.

*Needs:* §2.12 (Local constancy of Brauer evaluation); §2.8 (Brauer evaluation is trivial at almost all places); §2.14 (Topology of Brauer–Manin sets); §2.27 (Iskovskikh's conic bundle surface).


### Examples

For ℝ[T]/(T²−1), the real point space consists of evaluations at ±1, a discrete two-point subspace of ℝ. The algebra ℝ[T]/(T²+1) has no real points. The algebra ℝ[ε]/(ε²) has one real point, ε↦0, demonstrating that local point topology alone does not detect nilpotents.

For affine one-space the adelic points are the native adele ring and the rational diagonal is closed and discrete. For ℙ¹ the proper adelic space is the full local product: choose [0:1] at one place and [1:0] at another. This adelic point need not lie in the adelic points of any one chart from a fixed two-chart affine cover. An affine-chart cover of the scheme does not create a cover of its adelic points.

The conic x²+y²=3z² has no ℚ₃-point: a primitive integral solution would force all coordinates divisible by 3. Its adelic space is empty, so it does not furnish an obstruction with a nonempty adelic space. On the smooth proper Châtelet model of `y²+z²=(3−x²)(x²−2)`, local points exist everywhere. The class `(3−x²,−1)` has invariant 1/2 at 2 and zero at every other place on every local point, so the global sum is 1/2 and the Brauer–Manin set is empty (Poonen, Propositions 8.2.14–8.2.15, pp.233–235).



### Dependencies

Mathlib algebra maps, finite type, multivariate polynomials and RestrictedProduct; Tau Ceti number-field adeles, field Brauer groups and diagonal topology; Layer 0's coordinate interfaces; SchemeAndStackFoundations §§0.8–0.9 and 2.22; ClassFieldTheory Layers 5,10,13; GlobalQuadraticForms Layer 5. The unramified, zero-cycle and complete-intersection branches additionally require compactification/purity, curve Brauer reciprocity and Lefschetz, respectively. Finite evaluation partitions are existence statements; algorithms require the explicit computational contracts.



## Layer 3: torsor descent and comparison of obstructions

A torsor partitions rational points by its evaluated class; inverse twisting turns equality of classes into a lifting condition. The same condition at every place defines arithmetic Selmer sets and adelic descent sets. Universal torus torsors use their character-to-Picard type and the exact obstruction sequence. The unramified torus theorem adjusts a residual functional by Poitou–Tate duality, and the formal lemma transfers the result from a dense open to a proper rationally connected variety.


### 3.1 Evaluation of torsors and twisted torsors

Let k be a field, X a k-variety, G a smooth affine algebraic group over k and f : Z → X a G-torsor with class ζ ∈ H¹_fppf(X, G). For x ∈ X(L), ζ(x) ∈ H¹(L, G) is the class of the fibre Z_x. For a cocycle class τ ∈ H¹(k, G) represented by a torsor T, the twisted torsor f^τ : Z^τ = Z ×^G T^{-1} → X is a torsor under the inner form G_τ. Evaluation is natural in L and in X, and commutes with twisting: ζ^τ(x) corresponds to ζ(x) under the twisting bijection H¹(k, G) ≅ H¹(k, G_τ). The twisting bijection sends τ to the trivial class. For commutative G, [Z^τ]=[Z]−π*τ; x lifts to Z^τ exactly when ζ(x)=res(τ).

G smooth affine (for twisting by the contracted product); H¹ is fppf (equal to Galois cohomology for smooth G over a field).

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.1, evaluation of a torsor at rational points, pp. 239–240; §6.5, Example 6.5.12 (twisted torsor), p. 183.)

Pullback of torsors along x : Spec L → X (SchemeAndStackFoundations Layer 1/torsor-cohomology).

Twisting: contracted product with T^{-1} (Layer 1/contracted-product, Layer 1/twisting-bijection; Poonen Example 6.5.12).

Its interface consists of the following operations and laws.

- `TauCeti.Torsor.eval`: ζ(x) ∈ H¹(L, G) for x ∈ X(L).
- `TauCeti.Torsor.twist`: f^τ : Z^τ → X, a torsor under G_τ.
- `TauCeti.Torsor.eval_pullback`: Evaluation commutes with pullback along X' → X.
- `TauCeti.Torsor.twist_twist`: Twisting by τ and then by the image of τ' is twisting by the composite class; twisting by the trivial class is the identity.
- `TauCeti.Torsor.twist_comm`: For commutative G, [Z^τ] = [Z] − π*τ in H¹(X,G), using Poonen’s inverse-torsor convention. Harpaz–Wittenberg’s parameter is σ=−τ.
- `TauCeti.Torsor.eval_eq_trivial_iff`: ζ(x) is trivial iff Z_x(L) ≠ ∅.

**Checks.**

- `Torsor.twist.test_trivial`: Twisting by the trivial class returns Z → X.
- `Torsor.twist.test_inverse`: For commutative G, twisting by τ then by −τ returns Z.
- `Torsor.eval.test_kummer`: For [n] : A → A with n positive and prime to the field characteristic, eval is the Kummer map of §1.1 (Kummer maps of isogenies of abelian varieties); the smooth-kernel hypothesis of this torsor interface then holds.
- `Torsor.eval.test_point_not_lift`: ζ(x) ≠ 0 means x has no preimage in Z(k) although Z_x may have points over an extension.
- For the torsor [2] : A → A under A[2] in characteristic different from two, evaluation at a ∈ A(k) is the Kummer class δ(a) (§1.1 (Kummer maps of isogenies of abelian varieties)). In characteristic two the non-smooth kernel needs the fppf interface of §1.1, beyond the smooth-group twisting interface here.

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above.


### 3.2 The descent partition of rational points

Prove `TauCeti.Torsor.mem_image_twist_iff`. In the setting of §3.1 (Evaluation of torsors and twisted torsors), {x ∈ X(k) : ζ(x) = τ} = f^τ(Z^τ(k)) for every τ ∈ H¹(k, G); hence X(k) is the disjoint union over τ ∈ H¹(k, G) of f^τ(Z^τ(k)).

G smooth affine; X a k-variety.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.2, Theorem 8.4.1 and proof, p. 240.)

x ∈ f^τ(Z^τ(k)) iff the fibre of Z^τ at x is trivial iff Z_x ≅ T as G-torsors iff ζ(x) = τ (Poonen Theorem 8.4.1 and its proof, using Proposition 5.12.14).

**Checks.**

- For y² = (x² + 1)(x⁴ + 1) and the μ₂-torsors Z_c given by c w² = x⁴ + 1, X(ℚ) = ⋃_c f_c(Z_c(ℚ)) (Poonen §8.3).

*Needs:* §3.1 (Evaluation of torsors and twisted torsors).


### 3.3 The Selmer set of a torsor

For a global field k and a G-torsor f : Z → X, Sel_Z(k, G) = {τ ∈ H¹(k, G) : τ_v ∈ image of X(k_v) → H¹(k_v, G) for all places v} = {τ : Z^τ(k_v) ≠ ∅ for all v}. Then X(k) = ⨆_{τ ∈ Sel_Z(k,G)} f^τ(Z^τ(k)). If X is proper, Sel_Z(k, G) is finite, and there is a finite separable extension k'/k with X(k) ⊆ f(Z(k')).

k a global field; G smooth affine; finiteness needs X proper. For the trivial-torsor identification with Ш¹(k,G), assume X(𝔸_k)≠∅. For global function fields use the global-field adelic and finite-cohomology contracts, not merely the number-field constructions of Layer 2.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4, Remark 8.4.5, Theorem 8.4.6, Corollary 8.4.8, pp. 241–242.)

Spread X, Z, G out over O_{k,S}; for v ∉ S local images come from H¹(O_v, G) (valuative criterion); for v ∈ S the local images of the finite component group are finite (§3.4 (Finite local images of torsor evaluation)); H¹_S(k, G) has finite fibres over finitely many local data (Poonen Theorem 6.5.13).

The extension k': each τ in the finite Selmer set dies over some finite separable extension; take a compositum (Poonen Corollary 8.4.8).

Its interface consists of the following operations and laws.

- `TauCeti.Torsor.selmerSet`: Sel_Z(k, G) ⊆ H¹(k, G).
- `TauCeti.Torsor.mem_selmerSet_iff`: τ ∈ Sel iff Z^τ(k_v) ≠ ∅ for all v.
- `TauCeti.Torsor.selmerSet_finite`: Sel_Z(k, G) is finite for X proper.
- `TauCeti.Torsor.rationalPoints_eq_iUnion_selmer`: X(k) = ⋃_{τ ∈ Sel} f^τ(Z^τ(k)).
- `TauCeti.Torsor.exists_field_lift`: There is a finite separable k'/k with X(k) ⊆ f(Z(k')).

**Checks.**

- `Torsor.selmerSet.test_isogeny`: For an isogeny φ : A → B viewed as an A[φ]-torsor over B, Sel_Z is Sel^φ(A/k) of §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties).
- `Torsor.selmerSet.test_trivial_torsor`: If X(𝔸_k)≠∅ and Z=X×G, Sel_Z(k,G)=Ш¹(k,G). If any X(k_v) is empty then the Selmer set is empty, so the nonemptiness hypothesis cannot be dropped.
- `Torsor.selmerSet.test_example`: For Poonen's example y² = (x² + 1)(x⁴ + 1), the Selmer set is {c = 1, c = 2} modulo squares.
- `Torsor.selmerSet.test_nonproper`: For X = 𝔾_m and Z → X the squaring μ₂-torsor, Sel_Z(ℚ, μ₂) = ℚ^×/ℚ^{×2} is infinite: properness is needed.
- For f = [2] : E → E on an elliptic curve over a number field, Sel_Z(k, E[2]) is the 2-Selmer group (Poonen Remark 8.4.5).

*Needs:* §3.2 (The descent partition of rational points); §3.4 (Finite local images of torsor evaluation); §1.5 (Finiteness of Selmer groups); ArithmeticGaloisDuality Layer R02.3, RestrictedRamification.finite_H1_galoisGroupS over number fields.


### 3.4 Finite local images of torsor evaluation

Prove `TauCeti.Torsor.finite_range_eval_local`. Let k be a local field, X a proper k-variety, F a finite étale algebraic group over k and f : Z → X an F-torsor. Then the image of X(k) → H¹(k, F) is finite; if char k = 0, H¹(k, F) itself is finite.

k local; X proper; F finite étale.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.3, Proposition 8.4.2 and Remark 8.4.3, pp. 240–241.)

Krasner's lemma makes the fibre class locally constant (the evaluation is continuous for the discrete topology on H¹); X(k) is compact for proper X (Poonen Proposition 8.4.2).

In characteristic 0, H¹(k, F) is finite (Poonen Theorem 5.12.24(a)).

**Checks.**

- For X = ℙ¹ over ℚ_p and any F-torsor, the image is finite.

*Needs:* §3.1 (Evaluation of torsors and twisted torsors); §2.11 (Adelic points of separated schemes of finite type).


### 3.5 Descent obstruction sets

Let k be a number field and X a k-variety. For a G-torsor f : Z → X under a smooth affine G, X(𝔸)^f is the set of adelic points whose image in Π_v H¹(k_v, G) comes from H¹(k, G); equivalently X(𝔸)^f = ⋃_{τ∈H¹(k,G)} f^τ(Z^τ(𝔸)) = ⋃_{τ∈Sel} f^τ(Z^τ(𝔸)), closed when X is proper. X(𝔸)^{H¹(X,G)} = ⋂_f X(𝔸)^f, X(𝔸)^{descent} = ⋂_G X(𝔸)^{H¹(X,G)} over all smooth affine G, and X(𝔸)^{ét}, X(𝔸)^{conn}, X(𝔸)^{PGL} restrict G to finite étale, smooth connected affine, PGL_n. Then X(k) ⊆ X(𝔸)^{descent} ⊆ X(𝔸). There is a descent obstruction when X(𝔸) ≠ ∅ = X(𝔸)^{descent}.

k a number field; G smooth affine; X separated of finite type. For function fields the assertion requires the analogous adelic-space construction for global fields. Layer 2 provides its number-field specialization; the extension is an additional required contract rather than silently supplied by it.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.7, display (8.4.13), Definition 8.4.14 and the definitions of X(𝔸)^{ét}, X(𝔸)^{conn}, X(𝔸)^{PGL}, pp. 244–245.)

Commutativity of X(k) → X(𝔸) with H¹(k, G) → Π_v H¹(k_v, G) (Poonen (8.4.13)) gives X(k) ⊆ X(𝔸)^f.

The union description and closedness for proper X: Poonen Exercise 8.7, via §3.3 (The Selmer set of a torsor) and §3.4 (Finite local images of torsor evaluation).

Its interface consists of the following operations and laws.

- `TauCeti.descentSet`: X(𝔸)^f for a torsor f.
- `TauCeti.descentSet_eq_iUnion`: X(𝔸)^f = ⋃_τ f^τ(Z^τ(𝔸)).
- `TauCeti.descentObstructionSet`: X(𝔸)^{descent}, and its variants for finite étale, connected and PGL_n groups.
- `TauCeti.diagonal_mem_descentSet`: X(k) ⊆ X(𝔸)^{descent}.
- `TauCeti.isClosed_descentSet`: X(𝔸)^f is closed for X proper.
- `TauCeti.descentSet_map`: For π : X' → X, π(X'(𝔸)^{π*f}) ⊆ X(𝔸)^f.

**Checks.**

- `descentSet.test_trivial`: For the trivial torsor, X(𝔸)^f = X(𝔸).
- `descentSet.test_isogeny`: For [n] : A → A over a number field with A proper, A(𝔸)^{[n]} is the set of adelic points whose local Kummer classes come from Sel^n(A/k).
- `descentSet.test_selmer_union`: The union over H¹(k, G) may be replaced by the union over the Selmer set.
- `descentSet.test_nonempty_no_point`: X(𝔸)^{descent} ≠ ∅ does not imply X(k) ≠ ∅ (Poonen's threefold, §3.21 (Insufficiency of the Brauer–Manin and descent obstructions)).
- For the trivial torsor Z = X × G, X(𝔸)^f = X(𝔸).

*Needs:* §3.1 (Evaluation of torsors and twisted torsors); §3.3 (The Selmer set of a torsor); §2.11 (Adelic points of separated schemes of finite type).


### 3.6 Descent is at least as strong as Brauer–Manin

Prove `TauCeti.descentObstructionSet_subset_brauerManinSet`. Let k be a number field and X a variety. For a PGL_n-torsor f : Z → X with Brauer class 𝒜 ∈ Br X[n], X(𝔸)^f = X(𝔸)^𝒜. If X is regular and quasi-projective, every class of Br X comes from some PGL_n-torsor, so X(𝔸)^{descent} ⊆ X(𝔸)^{PGL} = X(𝔸)^{Br}.

k a number field; for the equality X(𝔸)^{PGL} = X(𝔸)^{Br}, X regular quasi-projective (Gabber–de Jong: Br X = Br' X). PGL_n-torsors classify Azumaya Brauer classes. Passage to the full cohomological Brauer group uses the regular quasi-projective Gabber comparison. Period=index is used only over number fields here.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.1, Lemma 8.5.2 and Proposition 8.5.3 with proofs, pp. 245–246.)

The map H¹(X, PGL_n) → Br X[n] is compatible with evaluation; H¹(k, PGL_n) ≅ Br(k)[n] and H¹(k_v, PGL_n) ≅ Br(k_v)[n] (Poonen Remark 1.5.18), so the descent condition becomes the reciprocity condition (Poonen Lemma 8.5.2).

Every class of Br X is represented by an Azumaya algebra for X regular quasi-projective (Poonen Corollary 6.6.19; required by the Brauer comparison contract above Layer 2).

**Checks.**

- For the Iskovskikh surface the PGL₂-torsor of the quaternion algebra already obstructs.

*Needs:* §3.5 (Descent obstruction sets); §2.13 (The Brauer–Manin pairing and set for varieties); SchemeAndStackFoundations §§2.3, 2.11, 2.15 and 2.22, with the Brauer comparison/purity contracts above; SchemeAndStackFoundations §2.22, SchemeBrauerGroup and brauer_field.


### 3.7 The étale–Brauer set

For a variety X over a number field k, X(𝔸)^{ét,Br} = ⋂_{F finite étale} ⋂_{f : Z → X F-torsor} ⋃_{τ ∈ H¹(k,F)} f^τ(Z^τ(𝔸)^{Br}), and X(𝔸)^{ét,descent} is defined with Z^τ(𝔸)^{descent} in place of Z^τ(𝔸)^{Br}. Then X(k) ⊆ X(𝔸)^{ét,descent} ⊆ X(𝔸)^{ét,Br} ⊆ X(𝔸)^{Br}.

k a number field; X a variety.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.2, definitions of X(𝔸)^{ét,Br} and X(𝔸)^{ét,descent}, pp. 246–247.)

Rational points: each x ∈ X(k) lifts to some Z^τ(k) (§3.2 (The descent partition of rational points)), which lies in Z^τ(𝔸)^{Br} (§2.13 (The Brauer–Manin pairing and set for varieties)).

Inclusions from §3.6 (Descent is at least as strong as Brauer–Manin) applied to the covers Z^τ and from the trivial torsor.

Its interface consists of the following operations and laws.

- `TauCeti.etaleBrauerSet`: X(𝔸)^{ét,Br}.
- `TauCeti.etaleDescentSet`: X(𝔸)^{ét,descent}.
- `TauCeti.diagonal_mem_etaleBrauerSet`: X(k) ⊆ X(𝔸)^{ét,Br}.
- `TauCeti.etaleBrauerSet_subset_brauerManinSet`: X(𝔸)^{ét,Br} ⊆ X(𝔸)^{Br}.
- `TauCeti.etaleBrauerSet_simplyConnected`: If X_{k̄} is algebraically simply connected, X(𝔸)^{ét,Br} = X(𝔸)^{Br}.

**Checks.**

- `etaleBrauerSet.test_projective`: For X = ℙⁿ, X(𝔸)^{ét,Br} = X(𝔸).
- `etaleBrauerSet.test_empty`: If X(𝔸) = ∅ then X(𝔸)^{ét,Br} = ∅.
- `etaleBrauerSet.test_compare_descent`: For nice X, X(𝔸)^{ét,Br} = X(𝔸)^{descent} (§3.8 (Étale–Brauer equals descent)).
- `etaleBrauerSet.test_bielliptic`: For Skorobogatov's bielliptic surface X(𝔸)^{ét,Br} = ∅ ≠ X(𝔸)^{Br}: the étale–Brauer set is strictly finer.
- For X with trivial étale fundamental group of X_{k̄} (for example ℙⁿ or a smooth complete intersection of dimension ≥ 2), X(𝔸)^{ét,Br} = X(𝔸)^{Br}.

*Needs:* §3.5 (Descent obstruction sets); §3.6 (Descent is at least as strong as Brauer–Manin); §3.2 (The descent partition of rational points).


### 3.8 Étale–Brauer equals descent

Prove `TauCeti.etaleBrauerSet_eq_descentObstructionSet`. For a smooth projective geometrically integral variety X over a number field k: X(𝔸)^{ét,Br} = X(𝔸)^{ét,descent} = X(𝔸)^{descent}. Moreover the descent obstruction is stable under iteration: X(𝔸)^{descent,descent} = X(𝔸)^{descent} for smooth quasi-projective geometrically integral X (Cao).

X nice (smooth, projective, geometrically integral) for the first equality; smooth quasi-projective geometrically integral for Cao's theorem.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.3, Theorem 8.5.4 and sketch of proof, p. 247; §8.5.4, Theorem 8.5.5 and Corollary 8.5.6, p. 248.)

X(𝔸)^{descent} ⊆ X(𝔸)^{ét,descent}: Skorobogatov 2009 Theorem 1.1 (a torsor under a smooth affine group over a finite étale cover is dominated by a torsor under a larger group over X).

X(𝔸)^{ét,descent} ⊆ X(𝔸)^{ét,Br}: §3.6 (Descent is at least as strong as Brauer–Manin) on each cover.

X(𝔸)^{ét,Br} ⊆ X(𝔸)^{descent}: Demarche 2009, extending Harari's X(𝔸)^{conn} = X(𝔸)^{Br}.

Iteration: Cao 2017 Corollaire 1.2 and induction (Poonen Corollary 8.5.6).

**Checks.**

- For Skorobogatov's bielliptic surface the empty étale–Brauer set is also explained by a single torsor under a noncommutative finite étale group (Poonen Remark 8.6.4).

*Needs:* §3.7 (The étale–Brauer set); §3.6 (Descent is at least as strong as Brauer–Manin); §3.5 (Descent obstruction sets).


### 3.9 Universal torsors and torsors of a given type

Let X be a smooth geometrically integral variety over a field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank, and T the k-torus with character module T̂ = Pic X_{k̄}. A torsor f : Y → X under a k-torus T' has a type λ : T̂' → Pic X_{k̄}, the map sending a character to the class of the pushed-out 𝔾_m-torsor. A universal torsor is a T-torsor of type the identity. Universal torsors exist iff the type obstruction δ(id)∈H²(k,T) vanishes; they exist when X(k) ≠ ∅; any two differ by twisting by H¹(k, T).

X smooth geometrically integral with only constant invertible functions geometrically and Pic X_{k̄} free of finite rank (Colliot-Thélène–Sansuc).

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, p. 8; §6, proofs of Théorèmes 6.1 and 6.6; §7, Proposition 7.8.)

Type map: the Hochschild–Serre spectral sequence for H¹(X, T') gives H¹(k, T') → H¹(X, T') → Hom_k(T̂', Pic X_{k̄}) → H²(k, T') (Colliot-Thélène–Sansuc); the type of a torsor is its image.

Twisting acts simply transitively on torsors of a fixed type (§3.1 (Evaluation of torsors and twisted torsors)).

Here δ is the connecting map in the stated type exact sequence and id:T̂→Pic X_{k̄} defines the universal type. The existence assertion is δ(id)=0. No undefined Ext-valued elementary-obstruction carrier is introduced; comparison with that obstruction is a separate theorem.

Its interface consists of the following operations and laws.

- `TauCeti.ToricTorsor.type`: The type T̂' → Pic X_{k̄} of a torus torsor.
- `TauCeti.UniversalTorsor`: A torsor of type id under the Néron–Severi torus.
- `TauCeti.UniversalTorsor.exists_of_point`: X(k) ≠ ∅ ⇒ a universal torsor exists.
- `TauCeti.UniversalTorsor.twist_transitive`: Universal torsors form a principal homogeneous space under H¹(k, T).
- `TauCeti.UniversalTorsor.projectiveSpace`: 𝔸^{n+1} ∖ {0} → ℙⁿ is universal.

**Checks.**

- `UniversalTorsor.test_projective`: 𝔸^{n+1} ∖ 0 → ℙⁿ is a universal torsor.
- `UniversalTorsor.test_point_trivial_pic`: If Pic X_{k̄} = 0 the torus is trivial and the universal torsor is X itself.
- `UniversalTorsor.test_conic`: For a pointless conic the degree-one generator of Pic(C_k̄)=ℤ is Galois invariant, and the Picard scheme has a corresponding rational class. It is not represented by a degree-one line bundle on C; δ(id) is the nonzero conic Brauer class, so no universal torsor of this type exists.
- `UniversalTorsor.test_type_matters`: A 𝔾_m-torsor over ℙ¹ of type 2 (from O(2)) is not universal.
- For X = ℙⁿ, Pic X_{k̄} = ℤ, T = 𝔾_m and the universal torsor is 𝔸^{n+1} ∖ {0} → ℙⁿ.

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; §3.1 (Evaluation of torsors and twisted torsors); SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts.


### 3.10 Descent under tori and the algebraic Brauer group

Prove `TauCeti.brauerOne_set_eq_universalTorsor_union`. Let X be smooth geometrically integral over a number field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank. If X is moreover proper, every adelic point orthogonal to Br₁ X lifts to the adelic points of some universal torsor: X(𝔸)^{Br₁} = ⋃_{Y universal} f_Y(Y(𝔸)). More generally, for a torsor f : Y → X under a torus T and A ⊇ the cup products H¹(k, T̂) ∪ [f] in Br X, every point of X(𝔸)^A lifts to Y^σ(𝔸) for some σ.

X smooth geometrically integral over a number field; the hypotheses on units and Pic for the §3.9 (Universal torsors and torsors of a given type) statement.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Proposition 2.5 and proof, p. 10, citing Harari–Skorobogatov 2013 Theorem 8.4 and Proposition 8.12.)

Classical descent (Colliot-Thélène–Sansuc; Harari–Skorobogatov 2013 Theorem 8.4 and Proposition 8.12): the obstruction to lifting (x_v) is an element of Ш²(k, T) paired with x_v through the cup products, killed by orthogonality to H¹(k, T̂) ∪ [f] via Poitou–Tate for tori (ArithmeticGaloisDuality Layer R02.4/torus-sha-duality).

Harpaz–Wittenberg 2020 Proposition 2.5 states the case used there.

**Checks.**

- For X = ℙⁿ both sides are X(𝔸).

*Needs:* §3.9 (Universal torsors and torsors of a given type); §3.5 (Descent obstruction sets); §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties); ArithmeticGaloisDuality Layer R02.4, the perfect Poitou–Tate pairing Ш²(K,T̂)×Ш¹(K,T)→ℚ/ℤ.


### 3.11 The relative algebraic Brauer group of a torus torsor

For a morphism f : Y → X of k-varieties, Br₁(Y/X) is the subgroup of Br Y of classes whose image in Br Y_{k̄} lies in the image of Br X_{k̄} → Br Y_{k̄}. For f a torsor under a k-torus T and Y smooth, Br_nr(Y) ⊆ Br₁(Y/X), since Y_{k̄} is birationally X_{k̄} × T_{k̄}. Under the hypotheses of Harpaz–Wittenberg §2 there is an exact sequence Br X → Br₁(Y^σ/X) --φ_σ--> H²(k, T̂) --δ_σ--> H³(X, 𝔾_m) from the Leray and Hochschild–Serre spectral sequences; pullbacks from Br X are killed by φ_σ, and the last group is H³(X, 𝔾_m) (not H³(k, 𝔾_m)).

f : Y → X a torsor under a k-torus T; Y, X smooth geometrically integral; k of characteristic 0.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, display (2.4), author-copy p.9.)

Membership is an image condition, not a quotient equality.

Br_nr(Y) ⊆ Br₁(Y/X): unramified classes on X_{k̄} × T_{k̄} come from X_{k̄} (Br_nr of a torus over k̄ is 0).

The edge sequence: Leray for f and Hochschild–Serre for k̄/k (Harpaz–Wittenberg 2020 (2.4), p.9).

Its interface consists of the following operations and laws.

- `TauCeti.relativeBrauerOne`: Br₁(Y/X) ≤ Br Y.
- `TauCeti.relativeBrauerEdge`: φ_σ : Br₁(Y^σ/X) → H²(k, T̂).
- `TauCeti.relativeBrauerEdge_exact`: Br X → Br₁(Y^σ/X) → H²(k, T̂) → H³(X, 𝔾_m) is exact.
- `TauCeti.unramifiedBrauer_le_relativeBrauerOne`: Br_nr(Y) ≤ Br₁(Y/X) for torus torsors.
- `TauCeti.pullback_mem_relativeBrauerOne`: f*Br X ≤ Br₁(Y/X).

**Checks.**

- `relativeBrauerOne.test_pullback`: Pullbacks from Br X belong to Br₁(Y/X) and have φ_σ = 0.
- `relativeBrauerOne.test_trivial_torsor`: For Y = X × 𝔾_m and α = pr₂*(χ, t) for a character class, φ(α) is the class of χ in H²(k, ℤ) ≅ H¹(k, ℚ/ℤ).
- `relativeBrauerOne.test_contains_unramified`: Br_nr(Y) ≤ Br₁(Y/X) for every torus torsor.
- `relativeBrauerOne.test_last_term`: The target of δ_σ is H³(X, 𝔾_m), which can be nonzero for number fields although H³(k, 𝔾_m) = 0.
- For Y = X × T (trivial torsor), Br₁(Y/X) ⊇ pr₁*Br X + pr₂*Br₁ T.

*Needs:* §2.16 (Constant and algebraic Brauer groups); §2.17 (The unramified Brauer group); §3.1 (Evaluation of torsors and twisted torsors); SchemeAndStackFoundations §2.22, SchemeBrauerGroup and brauer_field.


### 3.12 Twist independence of the relative Brauer edge maps

Prove `TauCeti.relativeBrauerEdge_twist_indep`. In the setting of §3.11 (The relative algebraic Brauer group of a torus torsor), with σ ranging over H¹(k, T): (i) if H³(k, 𝔾_m) = 0 the map δ_σ : H²(k, T̂) → H³(X, 𝔾_m) does not depend on σ; (ii) if H³(k, 𝔾_m) = 0, the subgroup φ_σ(Br_nr(Y^σ)) ⊆ H²(k, T̂) does not depend on σ; (iii) without that hypothesis, f_σ*^{-1}(Br_nr(Y^σ)) ⊆ Br X does not depend on σ; (iv) for every extension L/k, α ∈ Br₁(Y^σ/X), y ∈ Y^σ(L) and t ∈ T(L), α(t·y) = α(y) + φ_σ(α) ∪ t in Br L (character evaluation pairing). For a torus torsor Z over k, Br₁(Z) = H²(k, k̄[Z]^×) with edge map to H²(k, T̂), onto when H³(k, 𝔾_m) = 0, and α(t·z) − α(z) = φ(α) ∪ t.

H³(k, 𝔾_m) = 0 in (i)–(ii), true for number fields and their completions.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, Proposition 2.3 and Lemma 2.4 with proofs, author-copy pp.9–10.)

δ_σ is the cup product with the class of f_σ up to a fixed sign; the difference for two twists factors through H³(k, 𝔾_m) (Harpaz–Wittenberg Proposition 2.3(i)).

(ii)–(iii) from (i) and the birational description of Br_nr; (iv) from Lemma 2.4 applied to the fibre torsor over L.

**Checks.**

- For T = 𝔾_m and a 𝔾_m-torsor over Spec k, α(t·z) − α(z) = (χ, t) for the character class χ = φ(α).

*Needs:* §3.11 (The relative algebraic Brauer group of a torus torsor); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field.


### 3.13 The residual Tate–Shafarevich functional

In the setting of Harpaz–Wittenberg Theorem 2.1 (k a number field, f : Y → X a T-torsor, (x_v) ∈ X(𝔸)^A), choose an adelic lift y = (y_v) ∈ Y(𝔸) and identify the common edge image. For τ ∈ Ш¹(k, T) define ε_τ on Ш²(k, T̂) ∩ φ₀(Br_nr(Y)) by ε_τ(a) = Σ_v inv_v α_τ(y_v^τ) for any α_τ ∈ Br_nr(Y^τ) with φ_τ(α_τ) = a. The value does not depend on the choices, ε is additive, and ε_τ(a) = ε₀(a) + ⟨a, τ⟩ for the Poitou–Tate pairing ⟨,⟩ : Ш²(k, T̂) × Ш¹(k, T) → ℚ/ℤ. Here A=(f*)⁻¹Br_nr(Y) is the precise orthogonality subgroup. With Poonen’s twist parameter τ, HW’s parameter is σ=−τ; hence ε_τ(a)=ε₀(a)+⟨a,τ⟩.

k a number field; twist and Poitou–Tate sign conventions as fixed in §3.1 (Evaluation of torsors and twisted torsors) and ArithmeticGaloisDuality Layer R02.4/torus-sha-duality.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, unnumbered definition of ε and its variation formula, author-copy pp.10–11.)

Independence of α_τ: two choices differ by a pullback from Br X, which pairs to 0 with x_v ∈ X(𝔸)^A.

Independence of y: changing y_v by t_v ∈ T(k_v) changes the sum by Σ_v inv_v(a ∪ t_v) = 0 since a is locally trivial (§3.12 (Twist independence of the relative Brauer edge maps) (iv)).

Variation: compare the twists by σ through (iv) and the definition of the Poitou–Tate pairing (Harpaz–Wittenberg Proposition 2.6).

Its interface consists of the following operations and laws.

- `TauCeti.residualShaFunctional`: ε_τ : Ш²(k, T̂) ∩ φ₀(Br_nr Y) → ℚ/ℤ.
- `TauCeti.residualShaFunctional_indep_lift`: ε_τ does not depend on the adelic lift or on α_τ.
- `TauCeti.residualShaFunctional_add`: ε_τ is additive.
- `TauCeti.residualShaFunctional_twist`: ε_τ(a) = ε₀(a) + ⟨a, τ⟩.

**Checks.**

- `residualShaFunctional.test_split_torus`: For T split, Ш²(k, T̂) = 0 and ε is trivial.
- `residualShaFunctional.test_pullback_change`: Changing α_τ by f_τ*β with β ∈ A changes the defining sum by 0.
- `residualShaFunctional.test_poitou_tate`: The variation formula uses the Poitou–Tate pairing of ArithmeticGaloisDuality Layer R02.4.
- `residualShaFunctional.test_domain`: ε is not defined on all of Ш²(k, T̂): outside the edge image φ₀(Br_nr Y) there is no α_τ to evaluate.
- If Ш²(k, T̂) = 0 (for example T split), ε is the zero functional on the zero group.

*Needs:* §3.12 (Twist independence of the relative Brauer edge maps); §3.10 (Descent under tori and the algebraic Brauer group); ArithmeticGaloisDuality Layer R02.4, the perfect Poitou–Tate pairing Ш²(K,T̂)×Ш¹(K,T)→ℚ/ℤ.


### 3.14 Unramified descent for torus torsors

Prove `TauCeti.unramified_torus_descent`. Let k be a number field, X smooth geometrically integral and f : Y → X a torsor under a k-torus T. Put A = f*^{-1}(Br_nr(Y)) ⊆ Br X. Then X(𝔸_k)^A ⊆ ⋃_{σ ∈ H¹(k,T)} f_σ(Y^σ(𝔸_k)^{Br_nr(Y^σ)}). If X is proper then A = Br X. No rational connectedness is assumed.

k a number field; X smooth geometrically integral; T a k-torus.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, Theorem 2.1 and proof, author-copy pp.8–11.)

Lift (x_v) to some twist Y^σ(𝔸) (§3.10 (Descent under tori and the algebraic Brauer group), Harpaz–Wittenberg Proposition 2.5).

Choose σ in its Ш¹-coset so that ε_σ = 0 (§3.13 (The residual Tate–Shafarevich functional) and Poitou–Tate perfectness).

With ε_σ = 0, extend the evaluation functional through the edge image to H²(k, T̂); adelic torus duality supplies (t_v) with y_v ↦ t_v^{-1}y_v orthogonal to Br_nr(Y^σ) (Proposition 2.7, using §3.12 (Twist independence of the relative Brauer edge maps) (iv)).

**Checks.**

- For T = 1 the statement is X(𝔸)^{Br_nr} ⊆ X(𝔸)^{Br_nr}.

*Needs:* §3.10 (Descent under tori and the algebraic Brauer group); §3.13 (The residual Tate–Shafarevich functional); §3.12 (Twist independence of the relative Brauer edge maps); §2.18 (The unramified pairing on the full product of local points); ArithmeticGaloisDuality Layer R02.4, the perfect Poitou–Tate pairing Ш²(K,T̂)×Ш¹(K,T)→ℚ/ℤ.


### 3.15 Descent from a torus torsor over a dense open subset

Prove `TauCeti.open_torus_torsor_descent`. Let X be a smooth proper rationally connected variety over a number field k, V ⊆ X dense open and f : W → V a torsor under a k-torus. Then X(𝔸_k)^{Br X} is contained in the closure in X(𝔸_k) of ⋃_σ f_σ(W^σ(𝔸_k)^{Br_nr(W^σ)}). The input is that A = f*^{-1}Br_nr(W) ⊆ Br V has A/(A ∩ Br X) finite: after deleting a codimension ≥ 2 subset the compactified morphism is flat, and geometric codimension-one fibres have a multiplicity-one component.

X smooth proper rationally connected; V dense open; W → V a torus torsor.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Corollaire 2.2 and proof, p. 8, citing Colliot-Thélène–Skorobogatov 2000 Proposition 1.1 and the proof of Lemma 3.1.)

Finite quotient A/Br X (Colliot-Thélène–Skorobogatov 2000, proof of Lemma 3.1, as invoked by Harpaz–Wittenberg).

Harari's formal lemma (§2.21 (Harari's formal lemma)) gives density of V(𝔸)^A in X(𝔸)^{A ∩ Br X} ⊇ X(𝔸)^{Br X}; apply §3.14 (Unramified descent for torus torsors) on V (Harpaz–Wittenberg Corollary 2.2).

**Checks.**

- For V=𝔸ⁿ⊂ℙⁿ and the trivial torus torsor V×𝔾_mⁿ→V, the conclusion specializes to density of the affine open in the proper adelic space. The coordinatewise inclusion 𝔾_mⁿ→𝔸ⁿ is not a torsor over 𝔸ⁿ.

*Needs:* §3.14 (Unramified descent for torus torsors); §2.21 (Harari's formal lemma); §2.17 (The unramified Brauer group).


### 3.16 Brauer–Manin points give universal torsors

Prove `TauCeti.exists_universalTorsor_of_brauerManin`. For a smooth proper geometrically rationally connected variety X over a number field k, if X(𝔸_k)^{Br X} ≠ ∅ then a universal torsor over X exists over k. More generally, for a torus T' and a type λ : T̂' → Pic X_{k̄}, the obstruction to the existence of a torsor of type λ is detected by Br₁ X, and vanishes when X(𝔸)^{Br₁} ≠ ∅.

X smooth proper geometrically rationally connected (so k̄[X]^× = k̄^× and Pic X_{k̄} is free of finite rank).

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §6, proofs of Théorèmes 6.1 and 6.6; §7, Proposition 7.8, pp.20–24,26–27.)

The existence obstruction of a torsor of type λ lies in H²(k, T') and pairs with the adelic point through Br₁ X by Poitou–Tate (Colliot-Thélène–Sansuc; Skorobogatov 2001 Proposition 6.1.4, as invoked by Harpaz–Wittenberg §6–7).

**Checks.**

- If X(k) ≠ ∅ the conclusion holds trivially.

*Needs:* §3.9 (Universal torsors and torsors of a given type); §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties); ArithmeticGaloisDuality Layer R02.4, the perfect Poitou–Tate pairing Ш²(K,T̂)×Ш¹(K,T)→ℚ/ℤ.


### 3.17 Genus-one curves as torsors and the Weil–Châtelet group

Prove `TauCeti.genusOne_torsor_equiv_weilChatelet`. Let E be an elliptic curve over a field k. A smooth projective genus-one curve C over k with Jacobian E is a torsor under E, and isomorphism classes of such torsors are in bijection with the Weil–Châtelet group WC(E/k) = H¹(k, E(k^s)) of TauCetiRoadmap EllipticCurves Layer 7; the trivial class corresponds to E, i.e. to C(k) ≠ ∅. Over a number field Ш(E/k) ⊆ WC(E/k) consists of the everywhere locally soluble C. This is a different classification from the pointed twists of EllipticCurves Layer 5 (H¹(k, Aut(E, O))): a pointed twist always has a rational point. The H¹(k,E) classification fixes an identification of the Jacobian with E and uses E-equivariant isomorphisms. Unmarked genus-one curves with Jacobian isomorphic to E require the further Aut(E)-orbit quotient.

k a field; E elliptic; C smooth projective of genus one with Pic⁰_C ≅ E.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.12, Example 5.12.12 (genus-one curves as torsors under the Albanese/Jacobian) and Proposition 5.12.14, pp. 153–155; [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (Weil–Châtelet group) and Layer 5 (pointed twists).)

C is an E-torsor through the action of Pic⁰ on Pic¹ ≅ C (SchemeAndStackFoundations Layer 3/genus-one-curves); torsor classes are H¹(k, E) (Layer 1/torsor-cohomology with Poonen Theorem 6.5.10).

A torsor is trivial iff it has a k-point (Poonen Proposition 5.12.14).

Comparison with Layer 5: the forgetful map from pointed twists to curves lands in the trivial torsor classes of the twisted Jacobians.

**Checks.**

- The genus-one curve 2w² = x⁴ + 1 of Poonen §8.3 has the point (1, 1), so it is the trivial torsor under its Jacobian.

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-5-twists-aec-x2-x5); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4); §3.1 (Evaluation of torsors and twisted torsors).


### 3.18 Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction

Prove `TauCeti.bgw_hasse_failures`. For hyperelliptic curves C : y² = f(x) over ℚ of genus g ≥ 1 (deg f = 2g + 2), ordered by height: for fixed g a positive proportion of everywhere locally soluble C have J¹(ℚ) = ∅ with a Brauer–Manin obstruction on the g-dimensional variety J¹ (Bhargava–Gross–Wang Theorem 10); for fixed odd k > 0 the proportion of locally soluble C for which Sym^k(C) fails the Hasse principle tends to 1 as g → ∞, and the failure is a Brauer–Manin obstruction (Corollary 9, Theorem 11).

Density statements for the family of locally soluble hyperelliptic curves ordered by the height of f.

([A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), Corollary 9, Theorems 10–11, p. 3.)

Sel₂(J¹) = ∅ (§1.14 (The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k)) gives a descent obstruction by the J[2]-torsor of §1.12 (Two-coverings of torsors and the class W[2]); for torsors under abelian varieties this descent obstruction is a Brauer–Manin obstruction (§3.6 (Descent is at least as strong as Brauer–Manin) together with Manin's interpretation of Ш through Br₁).

The density statements are the averaging theorems of Bhargava–Gross–Wang, imported as stated.

**Checks.**

- For g = 1, J¹ ≅ C and Theorem 10 gives a positive proportion of locally soluble genus-one curves with no rational point.

*Needs:* §1.14 (The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k); §1.12 (Two-coverings of torsors and the class W[2]); §3.5 (Descent obstruction sets); §3.6 (Descent is at least as strong as Brauer–Manin); §3.17 (Genus-one curves as torsors and the Weil–Châtelet group).


### 3.19 A worked descent: y² = (x² + 1)(x⁴ + 1)

Prove `TauCeti.descent_example_genus_two`. For the genus-two curve X : y² = (x² + 1)(x⁴ + 1) over ℚ, the μ₂-torsors Z_c → X obtained by normalizing X in the extensions specified on the dense chart by c·w² = x⁴ + 1 (c ∈ ℚ^×/ℚ^{×2}) partition X(ℚ) (§3.2 (The descent partition of rational points)); only c ∈ {1, 2} are everywhere locally soluble (the Selmer set); Z_c maps to the genus-one curves Y₁ : w² = x⁴ + 1 and Y₂ : 2w² = x⁴ + 1, birational respectively to the rank-zero elliptic curves y² = x³ − 4x and y² = x³ − x; hence X(ℚ) consists of the six affine points (0, ±1), (±1, ±2) and the two points at infinity. A rational point of X lifts to exactly one twist, and the other twists have no rational point although some are locally soluble at many places.

Torsors under μ₂ over the genus-two curve; the rank computations are 2-descents (§1.15 (A complete elliptic 2-descent) for y² = x³ − x). Use the smooth projective normalization of each covering. The displayed affine equations alone are not a torsor presentation at the zeros of x⁴+1 or at infinity; its divisor on X is even, so the normalized cover is étale.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.3 and §8.3.1, pp. 236–238.)

Resultant argument: only p = 2 divides both factors, so X⁴ + Z⁴ = c W² with c ∈ {±1, ±2}, positivity forces c ∈ {1, 2} (Poonen §8.3).

Rank zero and torsion ℤ/2 × ℤ/2 of both elliptic curves give the finite point sets.

Specify the elliptic labels rather than reading an ordering into Poonen’s unordered pair. For w²=x⁴+1, X=2(w+1)/x² and Y=4(w+1)/x³ give Y²=X³−4X. The twist 2w²=x⁴+1 has Jacobian isomorphic to Y²=X³−X. Extend the birational maps across the missing points on the smooth projective models.

**Checks.**

- #X(ℚ) = 8 including the two rational points at infinity.

*Needs:* §3.2 (The descent partition of rational points); §3.3 (The Selmer set of a torsor); §1.15 (A complete elliptic 2-descent).


### 3.20 Finite étale covers obstruct strong approximation

Prove `TauCeti.not_strongApproximation_of_finiteEtale`. Let k be a global field, S a finite set of places and f : Y → X a finite étale morphism of geometrically integral k-varieties that is not an isomorphism. If X(𝔸^S) ≠ ∅ then X(k) is not dense in X(𝔸^S). Consequently a normal geometrically integral variety with X(𝔸^S) ≠ ∅ and X_{k^s} not algebraically simply connected fails strong approximation off S.

k global; f finite étale of degree > 1; the adeles away from S. For function fields the assertion requires the analogous adelic-space construction for global fields. Layer 2 provides its number-field specialization; the extension is an additional required contract rather than silently supplied by it.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.6, Theorem 8.4.10 and Corollary 8.4.11 with proofs, pp. 243–244.)

Spread out over O_{k,S}; integral points have fibres of bounded degree and ramification, so finitely many fibre types and an infinite set of places splitting all of them; at one such place the Lang–Weil estimate gives a local point that does not split, an open set avoided by X(k) (Poonen Theorem 8.4.10, Corollary 8.4.11).

**Checks.**

- 𝔾_m over ℚ with the squaring cover fails strong approximation off ∞.

*Needs:* §3.3 (The Selmer set of a torsor); §2.11 (Adelic points of separated schemes of finite type).


### 3.21 Insufficiency of the Brauer–Manin and descent obstructions

Prove `TauCeti.exists_brauerManin_insufficient`. (a) There is a nice ℚ-variety X (Skorobogatov's bielliptic surface, birational to (x² + 1)y² = (x² + 2)z² = 3(t⁴ − 54t² − 117t − 243)) with X(𝔸)^{Br} ≠ ∅ but X(ℚ) = ∅; its emptiness is explained by X(𝔸)^{ét,Br} = ∅, equivalently by a single torsor under a noncommutative finite étale group. (b) There is a nice ℚ-variety (Poonen's quadric bundle over a curve) with X(𝔸)^{ét,Br} ≠ ∅ but X(ℚ) = ∅, so even the descent obstruction is insufficient. In particular a nonempty Brauer–Manin set does not imply a rational point.

Explicit constructions over ℚ; the statements are existence theorems.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.6.1–8.6.2, Theorem 8.6.1, Definition 8.6.2, Remark 8.6.4, Theorem 8.6.5, Propositions 8.6.6–8.6.10, pp. 248–252.)

(a) Brauer–Manin applied to the étale double cover Y → X by a product of genus-one curves and its twists (Poonen §8.6.1, Theorem 8.6.1, Remark 8.6.4).

(b) Poonen §8.6.2, Theorem 8.6.5 and Propositions 8.6.6–8.6.10, combined with §3.8 (Étale–Brauer equals descent).

**Checks.**

- Both examples are compatible with X(ℚ) ⊆ X(𝔸)^{ét,Br}.

*Needs:* §3.7 (The étale–Brauer set); §3.8 (Étale–Brauer equals descent); §2.13 (The Brauer–Manin pairing and set for varieties).


### Examples

For X:y²=(x²+1)(x⁴+1), normalize the covers specified generically by `c w²=x⁴+1`. The relevant everywhere locally soluble square classes are c=1,2. They map to the genus-one quartics `w²=x⁴+1` and `2w²=x⁴+1`, birational to the rank-zero curves `y²=x³−4x` and `y²=x³−x`. Their rational-point calculations give the six affine points `(0,±1),(±1,±2)` and the two points at infinity on X. Each point belongs to exactly one inverse twist; naive equations at a branch zero do not give the étale torsor without normalization (Poonen, §8.3, pp.236–238).

A μ₂-fibre u²=a has evaluation class [a]; the c-twist is `c w²=a`, so a=c has the point w=1. For a torus residual pairing of order three, choosing τ with `⟨a,τ⟩=−ε₀(a)` makes the new functional zero. The parameter in the cited Harpaz–Wittenberg proof is the opposite of this τ.

Skorobogatov's bielliptic surface has a nonempty Brauer–Manin set and no rational points; étale descent detects its failure. Poonen's quadric-bundle example has a nonempty étale–Brauer set and no rational points. These examples prevent either nonempty obstruction set from being used as an existence theorem for rational points (Poonen, §8.5.1, pp.250–254).



### Dependencies

Layers 1–2; SchemeAndStackFoundations §§1.15–1.17,2.3,2.15,2.22,3.6; ArithmeticGaloisDuality Layer R02.4 for torus duality; EllipticCurves Layers 5 and 7 for the pointed-twist and Weil–Châtelet comparison. Connected-cover comparison, the type obstruction, compensating auxiliary places and the abelian Cassels–Tate/Brauer comparison are distinct required inputs, stated above.



## Layer 4: curves, Parshin covers and integral points

Good reduction records a smooth proper model outside a finite set. Chevalley–Weil controls the extensions needed to lift points through finite étale covers. The Kodaira–Parshin construction then sends a rational point to a curve of bounded genus and controlled reduction, and de Franchis turns Shafarevich finiteness into rational-point finiteness. That implication is conditional in this layer; the unconditional conclusion has the independent height route in Layer 5. Siegel uses the number-field Subspace theorem, and the function-field conclusion distinguishes constant and isotrivial curves.


### 4.1 Curves with good reduction outside S

Let K be a number field and S a finite set of places containing the archimedean ones. A smooth projective geometrically connected curve C over K has good reduction outside S if it extends to a smooth proper morphism 𝒞 → Spec O_{K,S} with geometrically connected fibres. Shafarevich's set Sh(K, S, g) is the set of K-isomorphism classes of such curves of genus g. The Shafarevich finiteness statement for (K, S, g) is the assertion that Sh(K, S, g) is finite.

S finite, containing the archimedean places; g ≥ 0.

([La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §2.1, definition of Shafarevich sets and Exemple 1.1, pp. 85–86; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §1 (statement of the Shafarevich conjecture) and §5, pp. 132–133, 145.)

Smooth proper models over Dedekind bases (SchemeAndStackFoundations Layer 3 models of curves); the predicate is stated as the existence of such a model.

Its interface consists of the following operations and laws.

- `TauCeti.Curve.HasGoodReductionOutside`: The predicate: C extends to a smooth proper curve over O_{K,S}.
- `TauCeti.Curve.shafarevichSet`: Sh(K, S, g) as a set of isomorphism classes.
- `TauCeti.Curve.ShafarevichFiniteness`: The proposition that Sh(K, S, g) is finite, for use as a hypothesis.
- `TauCeti.Curve.hasGoodReductionOutside_mono`: Good reduction outside S implies good reduction outside every S' ⊇ S.
- `TauCeti.Curve.hasGoodReductionOutside_baseChange`: Good reduction outside S over K implies good reduction outside the places above S over every finite L/K.

**Checks.**

- `HasGoodReductionOutside.test_projectiveLine`: ℙ¹_K has good reduction outside S = archimedean places.
- `HasGoodReductionOutside.test_mono`: If S⊆T are finite sets, good reduction outside S implies good reduction outside T; Spec K itself is not the spectrum of S-integers for a finite S.
- `HasGoodReductionOutside.test_elliptic`: For an elliptic curve, good reduction outside S agrees with Tau Ceti's Weierstrass good reduction at each v ∉ S (NeronModels R11.6/equation-good-comparison).
- `HasGoodReductionOutside.test_bad_at_two`: y² = x³ − x over ℚ has good reduction outside {2, ∞} but not outside {∞}: it lies in Sh(ℚ, {2, ∞}, 1) and not in Sh(ℚ, {∞}, 1).
- ℙ¹_K has good reduction everywhere; an elliptic curve has good reduction outside the primes dividing its minimal discriminant.

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §4.13 for curves; arbitrary-dimensional compactification is the additional contract above; NeronModelsAndSemistableAbelianVarieties §6.5 for elliptic equations only; SchemeAndStackFoundations §§3.1–3.3 and StableReductionAndModuliOfCurves Layer 2 for general curves.


### 4.2 The Chevalley–Weil theorem

Prove `TauCeti.chevalley_weil`. Let k be a number field and f : Z → X a finite étale morphism of varieties over k with X proper (or, for integral points, a finite étale morphism of separated schemes of finite type over O_{k,S}). Then there is a finite extension k'/k such that X(k) ⊆ f(Z(k')); for integral points, every x ∈ 𝒳(O_{k,S}) lifts to Z over a field of degree ≤ deg f unramified outside S ∪ (ramification of the model), and these fields form a finite set (Hermite).

f finite étale; X proper for the rational-point form.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Corollary 8.4.8 and proof, p. 242; §8.4.6, proof of Theorem 8.4.10, p. 243; [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Exemple 1.1, p. 86.)

Rational points: f is a torsor under a finite étale group after passing to a Galois closure, and Poonen Corollary 8.4.8 gives k' (§3.3 (The Selmer set of a torsor)).

Integral points: fibres are finite étale O_{k,S}-schemes of degree deg f, unramified outside S; finitely many such by Hermite's theorem (ArithmeticGaloisDuality Layer R02.3/hermite-unramified-outside-finite).

**Checks.**

- For the étale double cover of y² = (x² + 1)(x⁴ + 1) by c w² = x⁴ + 1, k' = ℚ(√2) suffices.

*Needs:* §3.3 (The Selmer set of a torsor); ArithmeticGaloisDuality Layer R02.3, RestrictedRamification.finite_unramifiedOutside_of_finrank_le.


### 4.3 De Franchis' theorem

Prove `TauCeti.Curve.finite_surjective_hom`. Let C' and C be smooth projective curves over a field k of characteristic zero with genus(C) ≥ 2. Then there are only finitely many nonconstant morphisms C' → C.

genus(C) ≥ 2; C, C' smooth projective over k. Characteristic zero for the assertion about all nonconstant morphisms. In positive characteristic use separable morphisms; unrestricted Frobenius iterates invalidate finiteness.

([Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, Theorem 5.2 (de Franchis), p. 146.)

Milne Chapter IV Theorem 5.2 (reference to Lang): nonconstant maps C' → C have bounded degree by Riemann–Hurwitz, form a scheme of finite type (Hom scheme), and a rigidity argument shows the relevant components are points; equivalently, the induced homomorphisms Jac C' → Jac C form a discrete subset of a finitely generated group with bounded degree.

**Checks.**

- For C' = C of genus ≥ 2, Aut(C) is finite (a special case).
- Over a finite field a genus≥2 curve has infinitely many nonconstant Frobenius self-maps. The separability or characteristic-zero qualification is essential.

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property).


### 4.4 The Kodaira–Parshin construction

Let K be a number field, S a finite set of places containing the archimedean and dyadic ones, and C/K a smooth projective curve of genus g ≥ 1 with good reduction outside S. There are a finite extension L/K and, for every P ∈ C(K), a curve C_P over L and a finite morphism φ_P : C_P → C_L such that: (i) C_P has good reduction outside the places of L above S; (ii) the genus of C_P is bounded in terms of g (Szpiro: 2g(C_P) − 2 = 2^{2g}(4g − 3) for the double cover of the 2-isogeny pullback); (iii) φ_P is ramified exactly above P. Construction: pull back multiplication by 2 on the Jacobian along the Abel–Jacobi map Q ↦ [Q − P] to get an unramified cover C₁ → C of degree 2^{2g}; the preimage D of P has degree 2^{2g}; over an extension of degree ≤ 2^{2g₁} unramified outside S, where g₁=1+2^{2g}(g−1) is the genus of C₁, O(D) ≅ M^{⊗2}, and C_P is the double cover of C₁ ramified exactly along D defined by M; L is the compositum of the finitely many fields so obtained.

S contains the archimedean and dyadic places; g ≥ 1 (g ≥ 2 is used only in the application through de Franchis).

([Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, Theorem 5.1 and its proof, pp. 145–148; [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §5.2, pp. 97–98.)

The unramified cover C₁ → C from the 2-isogeny of the Jacobian (JacobianChallenge Layer F Abel–Jacobi; AbelianSchemesAndArithmeticModuli A3 multiplication by 2), with good reduction outside S since [2] is étale away from dyadic places.

Halve the class of the full branch divisor D in Pic(C₁), using multiplication by two on Jac(C₁). Its fibre has degree 2^{2g₁}, so this is a safe extension-degree bound; 2^{2g} is not justified for this step. The fibre is finite étale outside S; use Hermite–Minkowski/Chevalley–Weil to choose one common finite compositum.

Double covers in residue characteristic ≠ 2 ramify exactly where the order of the defining function is odd (Milne IV §5 remarks), giving (i) and (iii); Riemann–Hurwitz gives (ii).

This is Szpiro’s full branch-divisor construction, pp.97–98. Milne IV §5 uses a two-point branch variant with a different genus. Keep the two constructions distinct; the displayed full-branch genus is g_P=1+2^{2g−1}(4g−3).

Its interface consists of the following operations and laws.

- `TauCeti.KodairaParshin.field`: The finite extension L/K, depending only on (C, S).
- `TauCeti.KodairaParshin.curve`: C_P over L for P ∈ C(K).
- `TauCeti.KodairaParshin.map`: φ_P : C_P → C_L, finite.
- `TauCeti.KodairaParshin.goodReduction`: C_P has good reduction outside the places above S.
- `TauCeti.KodairaParshin.genus_eq`: The genus of C_P is an explicit function of g alone.
- `TauCeti.KodairaParshin.ramified_iff`: φ_P is ramified at a point exactly when it lies above P.

**Checks.**

- `KodairaParshin.test_genus_formula`: For g = 2, C₁ has genus 17 (2g₁ − 2 = 16·2), D has degree 16 and C_P has genus 41 (2g' − 2 = 16·5).
- `KodairaParshin.test_unramified_step`: C₁ → C is unramified of degree 2^{2g}.
- `KodairaParshin.test_comparison_LV`: φ_P : C_P → C_L is a cover branched exactly above one point, the kind of cover that the Kodaira–Parshin family of MordellLawrenceVenkatesh LV.8 parametrises for the group Aff(q).
- `KodairaParshin.test_branch`: φ_P is not unramified: an unramified C_P would not distinguish distinct points P, and the map P ↦ C_P would not be finite-to-one.
- For g = 1, taking P as origin identifies C with its Jacobian, and C₁ → C is multiplication by 2.

*Needs:* §4.1 (Curves with good reduction outside S); §4.2 (The Chevalley–Weil theorem); SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property); AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion.


### 4.5 Parshin: Shafarevich finiteness implies Mordell

Prove `TauCeti.Curve.finite_of_shafarevich`. Let K be a number field and C/K a smooth projective geometrically connected curve of genus g ≥ 2. Let L, S' and g' be the data of §4.4 (The Kodaira–Parshin construction) for C. If the Shafarevich finiteness statement holds for (L, S', g'), then C(K) is finite.

Shafarevich finiteness for the bounded auxiliary genera over L with good reduction outside S′ is an explicit hypothesis of this comparison.

([Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, deduction of Mordell from Theorems 5.1 and 5.2, p. 146; [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §5.2, last paragraph, p. 98.)

By hypothesis the curves C_P, P ∈ C(K), fall into finitely many isomorphism classes over L.

For a fixed curve X over L, each P with C_P ≅ X gives a nonconstant map X → C_L ramified exactly above P, and distinct P give distinct maps; de Franchis (g ≥ 2) bounds their number (Milne IV §5).

**Checks.**

- For g = 1 the argument fails exactly at de Franchis: an elliptic curve of positive rank has infinitely many rational points.

*Needs:* §4.4 (The Kodaira–Parshin construction); §4.3 (De Franchis' theorem); §4.1 (Curves with good reduction outside S).


### 4.6 The Mordell conjecture (Faltings' theorem)

Prove `TauCeti.Curve.finite_rationalPoints`. For a smooth projective geometrically connected curve C of genus g≥2 over a number field K, C(K) is finite. The unconditional declaration is proved in Layer 5 by the Vojta–Bombieri route. The Parshin comparison in this layer proves the implication from Shafarevich finiteness for its auxiliary curves. Both routes have the same rational-point conclusion.

K a number field; g ≥ 2.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, Theorem 9.5.1 and Remark 9.5.2, p. 286; [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Théorème 1, p. 84.)

Use §5.12 (Faltings' theorem by the Vojta–Bombieri route) for the unconditional declaration; its prerequisite graph uses neither this node nor Shafarevich finiteness.

The Parshin implication remains conditional on the stated Shafarevich finiteness hypothesis; the Vojta–Bombieri argument proves the unconditional conclusion.

**Checks.**

- For y² = (x² + 1)(x⁴ + 1) over ℚ (genus 2), the finite set has eight points (§3.19 (A worked descent: y² = (x² + 1)(x⁴ + 1))).
- The theorem gives no bound on heights and no algorithm.

*Needs:* §5.12 (Faltings' theorem by the Vojta–Bombieri route); §4.5 (Parshin: Shafarevich finiteness implies Mordell).


### 4.7 S-integral points on affine curves

Let K be a number field, S a finite set of places containing the archimedean ones, X an affine curve over K with smooth projective completion X̄, and 𝒳 a model of X over O_{K,S} (an affine O_{K,S}-scheme of finite type with generic fibre X). The S-integral points are 𝒳(O_{K,S}) ⊆ X(K). Different models give sets that differ by enlarging S; finiteness of 𝒳(O_{K,S}) for every model and every S is independent of the choices.

X affine; the model is affine of finite type over O_{K,S}.

([La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, statement of Siegel's theorem and the description of integral points as sections, p. 84.)

Models exist by spreading out and agree over O_{K,T} for T ⊇ S large (§2.3 (Integral models exist and agree at almost all places)).

Its interface consists of the following operations and laws.

- `TauCeti.IntegralPoints`: 𝒳(O_{K,S}) ⊆ X(K) for a model 𝒳.
- `TauCeti.IntegralPoints.mono`: S ⊆ S' ⇒ 𝒳(O_{K,S}) ⊆ 𝒳(O_{K,S'}).
- `TauCeti.IntegralPoints.model_indep`: Two models agree after enlarging S.
- `TauCeti.IntegralPoints.gm`: For 𝔾_m the integral points are O_{K,S}^×.

**Checks.**

- `IntegralPoints.test_gm`: 𝔾_m(ℤ[1/2]) = {±2^n}.
- `IntegralPoints.test_affine_line`: 𝔸¹(O_{K,S}) = O_{K,S} is infinite: genus 0 with one point at infinity.
- `IntegralPoints.test_s_units`: ℙ¹ ∖ {0, 1, ∞} has integral points the solutions of the S-unit equation u + v = 1 (DiophantineApproximationAndTranscendence §2.8).
- `IntegralPoints.test_gm_infinite`: 𝔾_m(ℤ[1/2]) is infinite: two points at infinity are not enough for Siegel finiteness.
- For X = 𝔾_m = 𝔸¹ ∖ {0} with model Spec O_{K,S}[t, 1/t], the S-integral points are the S-units O_{K,S}^×.

*Needs:* §2.2 (Integral models and their integral local points); §2.3 (Integral models exist and agree at almost all places).


### 4.8 Siegel's theorem on integral points

Prove `TauCeti.Curve.finite_integralPoints`. Let K be a number field, S a finite set of places containing the archimedean ones, and X an affine curve over K with smooth projective completion X̄ of genus g. If g ≥ 1, or g = 0 and X̄ ∖ X has at least three geometric points, then 𝒳(O_{K,S}) is finite for every model 𝒳. The theorem is ineffective in general.

X affine, geometrically irreducible; the boundary counted over K̄.

([La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Théorème [Si] (Siegel), p. 84; [A subspace theorem approach to integral points on curves](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf), Main theorem (C. R. Math. Acad. Sci. Paris 334 (2002), 267–271).)

Reduction: by Chevalley–Weil, replace X by an unramified cover (pulled back from multiplication on the Jacobian when g ≥ 1) and K by a finite extension, so that the boundary has at least three points defined over K.

Corvaja–Zannier, pp.267–271: choose V_N of functions with poles bounded by N times the boundary. Riemann–Roch gives its dimension and bases with controlled vanishing at each boundary point. For each v∈S choose the relevant boundary point and its basis, then apply the number-field S-adic Subspace Theorem to these systems of independent linear forms. The pole/vanishing inequality confines integral points to finitely many proper linear sections; on a curve each section is finite. The rational-only product form is insufficient; use the number-field product-form adapter of DiophantineApproximationAndTranscendence §2.8 specified above.

Genus 0 with three boundary points is the S-unit equation (DiophantineApproximationAndTranscendence §2.8).

**Checks.**

- The S-unit equation u + v = 1 in units of ℤ[1/2] has exactly the three solutions (2, −1), (−1, 2), (1/2, 1/2).

*Needs:* §4.7 (S-integral points on affine curves); §4.2 (The Chevalley–Weil theorem); DiophantineApproximationAndTranscendence §2.3 for the rational specialization; DiophantineApproximationAndTranscendence §2.3 for rational S-unit equations; §4.4 (The Kodaira–Parshin construction); DiophantineApproximationAndTranscendence §2.8, absoluteSubspaceTheoremForSystems, with the number-field product-form adapter above.


### 4.9 The Mordell conjecture over function fields

Prove `TauCeti.Curve.isotrivial_of_infinite`. Let K be a function field with field of constants k (K = k(V), k algebraically closed in K) and X a regular projective geometrically integral K-curve of genus > 1 with X(K) infinite. If char k = 0, X is constant (X ≅ Y_K for a k-curve Y); if char k = p > 0, X is isotrivial (constant after a finite extension of K). Constant curves over ℂ(t) and Frobenius twists over 𝔽_q(t) show that the hypotheses cannot be dropped.

K a function field with constant field k; X of genus > 1.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.2, Examples 9.5.3–9.5.5, Definitions 9.5.6–9.5.8 and Theorem 9.5.10, pp. 287–288.)

Manin, Grauert (characteristic 0) and Samuel, Voloch (characteristic p), as stated in Poonen Theorem 9.5.10; induction on the transcendence degree reduces to trdeg K/k = 1.

**Checks.**

- For K = ℂ(t) and X = (X₀)_K, X(K) ⊇ X₀(ℂ) is infinite.

*Needs:* §1.10 (The Lang–Néron theorem).


### Examples

For genus g=2, the pullback of [2] has degree sixteen and genus seventeen. The fully branched double cover has `2g(C_P)−2=16·5=80`, hence genus forty-one. Its branch locus on the original curve is exactly the chosen point. The dyadic exclusion is required for the finite-étale halving argument and smooth double-cover model.

For `ℙ¹\{0,1,∞}`, S-integral points satisfy the S-unit equation u+(1−u)=1 and form a finite set. For `ℙ¹\{∞}` the integral points include all ordinary integers. For `ℙ¹\{0,∞}` they are S-units and can be infinite; these are the one- and two-boundary-point negative controls to Siegel's genus-zero hypothesis. A constant genus-two curve over ℂ(t) has infinitely many constant points, so number-field finiteness does not extend without the function-field constant/isotrivial distinction.



### Dependencies

Layers 0–3; JacobianChallenge Layer F; SchemeAndStackFoundations §§3.1–3.7 and 4.13; StableReductionAndModuliOfCurves Layer 2; AbelianSchemesAndArithmeticModuli §A3.2; ArithmeticGaloisDuality Layer R02.3; DiophantineApproximationAndTranscendence §2.8 with the normalized number-field product-form adapter. Shafarevich finiteness is the explicit premise of the Parshin implication. Function-field Mordell has its separate proof inputs.



## Layer 5: subvarieties of abelian varieties and small points

Using the supplier's abelian-subvariety carrier, construct quotients, translation stabilizers and the subgroup generated by X−X. The Ueno locus separates positive-dimensional cosets from isolated arithmetic intersections. Torsion intersections and finite-rank intersections have different hypotheses; the small-point theorem strengthens a height-zero result to a positive threshold. The curve Vojta–Bombieri argument gives the rational-point finiteness declaration used in Layer 4. Equidistribution needs the additional adelic intersection interface, beyond the point metrics of Layer 0.


### 5.1 Abelian subvarieties, cosets and quotients

Use the abelian-subvariety carrier supplied by AbelianSchemesAndArithmeticModuli §A6.3. For B⊆A construct the quotient abelian variety A/B, allowing B to have positive dimension, and its quotient homomorphism q with kernel B. Define a coset a+B as the closed translate of B, with its scheme structure; a torsion coset is a+B with a torsion modulo B (equivalently, over an algebraically closed field, admitting a torsion representative). The quotient identifies its fibres with these cosets. This extends the finite-kernel quotient contract of §A3.3 by permitting positive-dimensional B.

k any field; cosets are taken over k̄ unless stated.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16; proof of Lemma 5.3, p. 24; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §3, Theorem 3.7, author copy p.6.)

Quotients by abelian subvarieties: the fppf quotient sheaf A/B (Layer 1/quotient-sheaf) is an algebraic space by Artin's theorem (Layer 1/artin-bootstrap), a proper smooth connected group space over a field, hence an abelian variety; over a field this is Conrad Theorem 3.7 for quotients by closed subgroups (Xie–Yuan, proof of Proposition 3.6). AbelianSchemesAndArithmeticModuli A3 treats finite subgroups only.

Complements: Poincaré complete reducibility (AbelianSchemesAndArithmeticModuli A6/poincare-complete-reducibility).

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.quotient`: A ⧸ B as an abelian variety with the projection A → A/B.
- `TauCeti.AbelianVariety.quotient_ker`: The kernel of A → A/B is B.
- `TauCeti.AbelianVariety.IsCoset`: X = x + B for an abelian subvariety B.
- `TauCeti.AbelianVariety.IsTorsionCoset`: A coset x + B with x torsion.
- `TauCeti.AbelianVariety.IsTorsionSubvariety`: A finite union of torsion cosets.

**Checks.**

- `AbelianSubvariety.test_diagonal`: The diagonal of E × E is an abelian subvariety with quotient E via (P, Q) ↦ P − Q.
- `AbelianSubvariety.test_zero`: {0} and A are abelian subvarieties; A/A = 0 and A/{0} = A.
- `AbelianSubvariety.test_torsion_not_abelian`: For dim A>0, A[2] is not an abelian subvariety: in characteristic≠2 it is a nontrivial disconnected finite étale group scheme; in characteristic 2 it can be connected but is not smooth. Connectedness alone does not certify an abelian subvariety.
- `IsTorsionCoset.test_point`: A torsion point {t} is a torsion coset with B = 0; a non-torsion point is a coset but not a torsion coset.
- `IsCoset.test_curve`: A genus-at-least-two Abel–Jacobi curve is not an abelian coset, whereas a point of any order and a translate x+B are cosets.
- `IsTorsionCoset.test_whole`: A itself and {0} are torsion cosets; a singleton of infinite order is not.
- `IsTorsionSubvariety.test_empty`: The empty closed set is the union of zero torsion cosets and is a torsion subvariety, although it is not a torsion coset.
- `IsTorsionSubvariety.test_two_points`: In an elliptic curve over an algebraically closed field of characteristic zero, {0,t} for a nonzero torsion point t is a torsion subvariety; it is not a single coset of an abelian subvariety. Replacing t by a point of infinite order makes it fail to be a torsion subvariety.
- In A = E × E, the diagonal and the antidiagonal are abelian subvarieties meeting in E[2].

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5, abelian images and Poincaré complements; SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above.


### 5.2 Stabilizers of subvarieties

For a closed subvariety X of an abelian variety A over k, Stab(X) is the closed subgroup scheme of a ∈ A with a + X = X, and Stab⁰(X) its identity component (reduced), an abelian subvariety. X is a union of cosets of Stab⁰(X) and X/Stab⁰(X) ⊆ A/Stab⁰(X) has finite stabilizer. If X is irreducible and embedded in projective space by a very ample L, deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

X closed in A; for the degree bound X irreducible and L very ample. Use an algebraically closed field of characteristic zero for the scheme stabilizer and its degree bound here. For perfect fields the reduced identity component is smooth; a nonreduced stabilizer in characteristic p cannot be silently replaced in scheme-fibre assertions.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 6.9, p. 38; proof of Proposition 8.1, p. 47; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16.)

Stab(X) is the intersection over x ∈ X(k̄) of X − x, a closed subgroup (representability of the transporter).

The degree bound: David–Hindry Lemme 2.1(ii) via intersection of finitely many translates (as cited by Gao–Habegger).

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.stab`: Stab(X) as a closed subgroup scheme.
- `TauCeti.AbelianVariety.stabZero`: Stab⁰(X), an abelian subvariety.
- `TauCeti.AbelianVariety.add_stab`: Stab(X) + X = X.
- `TauCeti.AbelianVariety.stab_quotient_finite`: The image of X in A/Stab⁰(X) has finite stabilizer.
- `TauCeti.AbelianVariety.degree_stab_le`: deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

**Checks.**

- `stab.test_coset`: Stab⁰(x + B) = B.
- `stab.test_point`: Stab({x}) = 0.
- `stab.test_curve`: For a curve C of genus ≥ 2 embedded in its Jacobian, Stab(C) is finite.
- `stab.test_not_reduced_union`: Stab(X) need not be connected: for X = B ∪ (t + B) with t ∈ A[2] ∖ B, Stab(X) ⊇ B ∪ (t + B).
- Stab(A) = A; Stab({x}) = {0}; for X = x + B, Stab⁰(X) = B.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); SchemeAndStackFoundations §§1.13–1.17 and 2.3, with the positive-dimensional quotient and subscheme-stabilizer contracts above; SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 5.3 The abelian subvariety generated by X − X

For an irreducible closed subvariety X of an abelian variety A over an algebraically closed field, the abelian subvariety A' generated by X − X is the g-fold sum (X − X) + ⋯ + (X − X) (g = dim A); X ⊆ A' + Q for some Q ∈ A(k), and X generates A when A' = A. Translation preserves the property. With L very ample, deg_L(Y + Y') ≤ 4^{dim Y + dim Y'}·deg_L Y·deg_L Y' for irreducible Y, Y' ⊆ A, and deg_L A' ≪_g (deg_L X)^{2g}.

k algebraically closed; X irreducible; L very ample (replace L by L^{⊗3} in the degree argument).

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §2.2, Lemmas 2.4–2.5, arXiv:2105.15085v4 pp.10–11.)

Sums of irreducible subvarieties stabilise after g steps by dimension count; the stable sum is a subgroup, hence an abelian subvariety.

Degree of sums: Gao–Ge–Kühne Lemma 2.4 (projection from the addition map on A × A).

Degree of A′: iterate Lemma 2.4 along the g-fold sum (Gao–Ge–Kühne Lemma 2.5, argument of Hindry), retaining the per-step factor 4^{dim Y+dim Y′} from Lemma 2.4.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.generatedBy`: A' = the abelian subvariety generated by X − X.
- `TauCeti.AbelianVariety.generatedBy_eq_sum`: A' = (X − X) + ⋯ + (X − X) (g summands).
- `TauCeti.AbelianVariety.subset_generatedBy_add`: X ⊆ A' + Q for some Q.
- `TauCeti.AbelianVariety.Generates`: The predicate A' = A.
- `TauCeti.AbelianVariety.degree_add_le`: deg_L(Y + Y') ≤ 4^{dim Y + dim Y'}·deg_L Y·deg_L Y'.

**Checks.**

- `generatedBy.test_point`: For X a point, A' = 0.
- `generatedBy.test_coset`: For X = x + B, A' = B.
- `generatedBy.test_curve_jacobian`: For C ⊆ Jac C of genus ≥ 1, A' = Jac C, matching AbelianSchemesAndArithmeticModuli §A6.3, abelian images, specialized by the generated-subvariety construction here.
- `Generates.test_translate`: A subvariety X contained in a translate x + B of a proper abelian subvariety B does not generate A (its A' is contained in B), even when x ∉ B, so that X lies in no proper abelian subvariety.
- For a curve C of genus ≥ 1 embedded in its Jacobian J, C − C generates J (AbelianSchemesAndArithmeticModuli §A6.3, abelian images, specialized by the generated-subvariety construction here).

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); AbelianSchemesAndArithmeticModuli §A6.3, abelian images; the generated-subvariety construction is in Layer 5; SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### 5.4 The Ueno locus

For a closed subvariety X of an abelian variety A over an algebraically closed field of characteristic 0, the Ueno locus Z(X) is the union of all positive-dimensional cosets contained in X, and X° = X ∖ Z(X). Z(X) is Zariski closed (Kawamata), so X° is open. (X − P)° = X° − P, and (X')° ⊇ X° ∩ X' for closed X' ⊆ X. The positive-dimensional abelian subvarieties B maximal with x + B ⊆ X for some x form a finite set Σ(X; A) with deg_L B and #Σ(X; A) bounded in terms of dim A and deg_L X (Bogomolov; Rémond), and Z(X) = ⋃_{B ∈ Σ(X;A)} (X_B + B) with X_B = ⋂_{b ∈ B} (X − b) ∩ B^⊥ an intersection over all b∈B. For the degree estimate, its components are obtained as components of finite intersections of at most dim X translates, followed by intersection with the chosen B^⊥; this is not an equality of the entire infinite intersection with an arbitrary finite selection.

k algebraically closed of characteristic 0; X closed in A. For the quoted uniform degree bound on B^⊥ and X_B, assume X generates A, or replace A by the abelian subvariety generated by X−X. An arbitrary fixed Poincaré complement has no asserted uniform degree bound.

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §7, Lemma 7.4, arXiv:2105.15085v4 pp.43–44; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition C.1, p. 61.)

Closedness: Kawamata's structure theorem for subvarieties with positive-dimensional stabilizer (Ueno fibration), as cited by Gao–Ge–Kühne.

Finiteness and degree bounds of maximal cosets: Bogomolov 1981 Theorem 1 and Rémond Proposition 4.1, Lemma 4.6, as cited by Gao–Ge–Kühne and Gao–Habegger.

Gao–Ge–Kühne Lemma 7.4, pp.43–44, chooses B^⊥ with degree controlled using the generating hypothesis. Its finite-intersection argument is componentwise and supplies Bézout bounds; it does not identify every set-theoretic infinite intersection with a finite intersection solely by dimension.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.uenoLocus`: Z(X), the union of positive-dimensional cosets in X.
- `TauCeti.AbelianVariety.isClosed_uenoLocus`: Z(X) is Zariski closed (Kawamata).
- `TauCeti.AbelianVariety.uenoLocus_translate`: (X − P)° = X° − P.
- `TauCeti.AbelianVariety.maximalCosets_finite`: Σ(X; A) is finite with degrees bounded in terms of dim A and deg X.
- `TauCeti.AbelianVariety.uenoLocus_eq_iUnion`: Z(X) = ⋃_{B ∈ Σ} (X_B + B).

**Checks.**

- `uenoLocus.test_curve`: For C ⊆ Jac C of genus ≥ 2, Z(C) = ∅.
- `uenoLocus.test_abelian`: Z(A) = A when dim A ≥ 1.
- `uenoLocus.test_product`: For X = C × E ⊆ Jac C × E with E elliptic, Z(X) = X.
- `uenoLocus.test_not_torsion_condition`: The Ueno locus contains non-torsion cosets x + B: it is not the union of torsion cosets in X.
- For a curve of genus ≥ 2 in its Jacobian, the Ueno locus is empty.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); §5.2 (Stabilizers of subvarieties); §5.3 (The abelian subvariety generated by X − X).


### 5.5 Subgroups of finite rank

A subgroup Γ of an abelian group G (for example A(F) for an abelian variety A over a field F) has finite rank if Γ ⊗_ℤ ℚ is a finite-dimensional ℚ-vector space; rk Γ = dim_ℚ(Γ ⊗ ℚ). Equivalently Γ is contained in the division hull {x : Nx ∈ Γ₀ for some N ≥ 1} of a finitely generated subgroup Γ₀⊆Γ of the same rank. No End(A)-stability is required.

G abelian. The torsion subgroup is not finitely generated only for an abelian variety of positive dimension in the stated algebraically closed characteristic-zero test.

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), §1, p. 3; [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3; §7.3, pp.41–42.)

Choose Γ₀ generated by lifts of a ℚ-basis of Γ ⊗ ℚ; every x ∈ Γ has a multiple in Γ₀.

Its interface consists of the following operations and laws.

- `TauCeti.HasFiniteRank`: The predicate FiniteDimensional ℚ (Γ ⊗ ℚ), stated with Mathlib's Module.rank.
- `TauCeti.finiteRank_iff_le_divisionHull`: Γ has finite rank iff it lies in the division hull of a finitely generated subgroup of the same rank.
- `TauCeti.HasFiniteRank.mono`: Subgroups of finite-rank groups have finite rank.
- `TauCeti.HasFiniteRank.of_fg`: Finitely generated groups have finite rank.

**Checks.**

- `HasFiniteRank.test_torsion`: A(K̄)_tors has rank 0.
- `HasFiniteRank.test_fg`: ℤ^r has rank r.
- `HasFiniteRank.test_divisionHull`: The division hull of A(K) in A(K̄) has rank rk A(K).
- `HasFiniteRank.test_not_fg`: ℚ ⊆ ℝ has rank 1 but is not finitely generated: finite rank is weaker than finite generation.
- A(K) has finite rank by Mordell–Weil. If dim A>0 over an algebraically closed field of characteristic zero, A(K̄)_tors has rank zero and is not finitely generated; dimension zero is excluded from the latter claim.

*Needs:* §1.7 (The Mordell–Weil theorem); Mathlib `Module.rank`.


### 5.6 The Manin–Mumford theorem

Prove `TauCeti.AbelianVariety.manin_mumford`. Let A be an abelian variety over an algebraically closed field of characteristic 0 and X ⊆ A a closed subvariety. Then the Zariski closure of X ∩ A_tors is a torsion subvariety (a finite union of torsion cosets contained in X). Equivalently, if X ∩ A_tors is Zariski dense in X then X is a torsion subvariety. Positive-dimensional torsion cosets are legitimate infinite components.

Characteristic 0 (in positive characteristic see §5.7 (Manin–Mumford for trivial trace in positive characteristic)).

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), Theorem 3.2 and proof, p. 13, citing Raynaud 1983, Hindry 1988 Theorem 1, Hrushovski 2001, Scanlon 2004; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §5, Theorem 5.1, pp. 22–23.)

Raynaud 1983 (curves and subvarieties; p-adic methods); over number fields Hindry 1988 Theorem 1 via lower bounds for Galois orbits of torsion points; the specialisation argument reduces ℂ to ℚ̄.

It is the case Γ = A_tors (rank 0) of §5.13 (The Mordell–Lang theorem), but its proofs are independent.

**Checks.**

- For a curve C of genus ≥ 2 in its Jacobian by an Abel–Jacobi embedding, C ∩ J_tors is finite.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); §5.2 (Stabilizers of subvarieties).


### 5.7 Manin–Mumford for trivial trace in positive characteristic

Prove `TauCeti.AbelianVariety.manin_mumford_trivialTrace`. In characteristic p>0, let K be finitely generated over an algebraically closed field k and A an abelian variety over K with trivial geometric K̄/k-trace. If X ⊆ A_{K̄} is a closed subvariety with X(K̄) ∩ A(K̄)_tors Zariski dense in X, then X is a torsion subvariety. The proof covers all torsion, including p-power torsion.

Characteristic p>0; trivial geometric K̄/k-trace; k algebraically closed. The trace is the geometric trace of A_{K̄} over the algebraically closed constant field k, as specified by Xie–Yuan §1.1; zero original K/k-trace is not enough.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §5, Theorem 5.1 and proof, pp. 22–23; [Positive characteristic Manin–Mumford theorem](https://arxiv.org/abs/math/0303340), Theorem 2.2, p.2 (arXiv:math/0303340).)

Scanlon's positive-characteristic Manin–Mumford theorem (Theorem 2.2): the closure of X ∩ G_tors is a finite union of special subvarieties a + h^{-1}(X₀) with h : G → G₀ and X₀ defined over 𝔽̄_p (Pink–Roessler 2004 for the full torsion).

Trivial geometric trace excludes nonzero homomorphisms to abelian varieties over 𝔽̄_p ⊆ k (§1.9 (Chow's K/k-trace) universal property), so special subvarieties are torsion cosets (Xie–Yuan Theorem 5.1).

**Checks.**

- For A with trivial trace and X a curve of genus ≥ 2, X ∩ A_tors is finite.
- A nonconstant quadratic isotrivial twist of a constant Jacobian in characteristic p≠2 can have zero K/k-trace while becoming constant over K(√t). Over K̄ its constant genus≥2 curve has dense torsion over F̄_p and is not a torsion coset. This rules out the original-trace-only hypothesis.

*Needs:* §5.6 (The Manin–Mumford theorem); §1.9 (Chow's K/k-trace); AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion.


### 5.8 Uniform Manin–Mumford in families

Prove `TauCeti.AbelianVariety.uniform_manin_mumford`. Let A be an abelian variety over an algebraically closed field K of characteristic 0, V an irreducible quasi-projective K-variety and Y ⊆ V × A an irreducible closed subvariety with fibres Y_v. There are a finite set 𝓜 of abelian subvarieties of A and an integer D such that for every v ∈ V(K) the Zariski closure of Y_v ∩ A_tors is a union of at most D translates of members of 𝓜 by torsion points.

Characteristic 0; Y irreducible closed in V × A.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), Theorem 3.2 and proof, p. 13.)

Scanlon's automatic uniformity (2004 Theorem 2.4) via the model theory of algebraically closed fields with a generic automorphism (Hrushovski), as cited by Gao–Habegger Theorem 3.2; the translates in the closure are by torsion points, rather than arbitrary points.

**Checks.**

- For V a point this is §5.6 (The Manin–Mumford theorem).

*Needs:* §5.6 (The Manin–Mumford theorem).


### 5.9 Faltings' theorem on rational points of subvarieties of abelian varieties

Prove `TauCeti.AbelianVariety.faltings_subvariety`. Let A be an abelian variety over a number field K and X ⊆ A a closed subvariety. Then X(K) is contained in a finite union of cosets x_i + B_i contained in X; consequently X(K) ∩ X° is finite, where X° is the complement of the Ueno locus. In particular, if X contains no positive-dimensional coset (for example a curve of genus ≥ 2 in its Jacobian), X(K) is finite.

K a number field; X closed in A.

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.3, statement of Faltings' theorem on subvarieties of abelian varieties after Conjecture 9.5.11.)

Faltings 1991 (Diophantine approximation on abelian varieties): Vojta's method generalised to subvarieties, with Faltings' product theorem and an arithmetic Riemann–Roch input; induction on dim X through the Ueno fibration (as cited by Gao–Ge–Kühne §1).

For curves the elementary version is Bombieri's (§5.10 (Vojta's inequality) and §5.11 (Mumford's gap principle)).

Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

**Checks.**

- For C ⊆ J a curve of genus ≥ 2, this reproves Faltings' theorem on curves (§4.6 (The Mordell conjecture (Faltings' theorem))).

*Needs:* §5.4 (The Ueno locus); §5.10 (Vojta's inequality); §5.11 (Mumford's gap principle); §1.7 (The Mordell–Weil theorem); §0.21 (The Néron–Tate canonical height).


### 5.10 Vojta's inequality

Prove `TauCeti.Curve.vojta_inequality`. Let C be a smooth projective curve of genus g≥2 over a number field k, embedded in J using a degree-one divisor class after a finite extension if needed, with the theta Néron–Tate norm. Bombieri §10 Thm.1 gives an effectively determined γ(C)>1 such that if z,w∈C(k), ‖z‖≥γ(C) and ‖w‖≥γ(C)‖z‖, then ⟨z,w⟩≤(3/4)‖z‖‖w‖. Use the same normalization for the threshold and norm ratio; an arbitrary rescaling changes the threshold. The proof needs the product/Roth lemma in §§6–9, a separate product/Roth input described above.

C of genus ≥ 2; k a number field; heights normalised as Néron–Tate heights for the theta divisor.

([The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §§3–10, Theorem 1 and proof, pp. 617–638.)

Construct the Vojta divisor on C × C and a small section by Siegel's lemma (Bombieri §§3, 8); lower bound for its height at (z, w) (§6); upper bound by Mumford's method (§5); derivative estimates and Roth's lemma bound the index (§§7, 9); combine in §10.

**Checks.**

- The inequality excludes infinitely many points in a narrow cone; combined with §5.11 (Mumford's gap principle) it gives finiteness.

*Needs:* §0.21 (The Néron–Tate canonical height); §0.17 (Weil's height machine); §1.7 (The Mordell–Weil theorem); Mathlib `Int.Matrix.exists_ne_zero_int_vec_norm_le`; [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property).


### 5.11 Mumford's gap principle

Prove `TauCeti.Curve.mumford_gap`. Let C be a smooth projective curve of genus g ≥ 2 over a number field k embedded in its Jacobian. There are constants c(C) and an angle θ₀ > 0 such that for distinct z, w ∈ C(k) with |z| ≥ c(C), |w| ≥ |z| and angle between z and w (for the Néron–Tate inner product) at most θ₀, one has |w| ≥ 2|z|. Consequently the points of C(k) in any cone of small angle have Néron–Tate norms growing geometrically, and the number of rational points of norm ≤ T is O(log T).

g ≥ 2; heights as in §5.10 (Vojta's inequality).

([The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §4, p. 619, and §5, Lemmas 1–2, pp. 621–622.)

Mumford's formula: the height on C × C of the diagonal is, up to bounded functions, a quadratic expression in Néron–Tate heights that is indefinite for g ≥ 2 and bounded below off the diagonal (Bombieri §4–§5, Lemmas 1–2).

Bombieri §10 p.639: (‖z‖²+‖w‖²)/(2g)−⟨z,w⟩ ≥ −c(1+‖z‖+‖w‖), for distinct curve points. For sufficiently large norms in a cone whose pairwise cosine exceeds 3/4, assuming 1≤‖w‖/‖z‖<2 makes the leading term negative, a contradiction; hence the ratio is at least two. Northcott handles the bounded initial region.

**Checks.**

- With §5.10 (Vojta's inequality): points in a cone either have bounded norm or violate Vojta, so C(k) ∩ cone is finite; finitely many cones cover the finite-dimensional J(k) ⊗ ℝ.

*Needs:* §0.21 (The Néron–Tate canonical height); §0.18 (Heights are bounded below off the base locus); §1.7 (The Mordell–Weil theorem).


### 5.12 Faltings' theorem by the Vojta–Bombieri route

Prove `TauCeti.Curve.finite_rationalPoints`. Let C be a smooth projective curve of genus g ≥ 2 over a number field k. Then C(k) is finite. This is the same declaration as §4.6 (The Mordell conjecture (Faltings' theorem)), proved here without Shafarevich finiteness: J(k) ⊗ ℝ is a finite-dimensional Euclidean space (Mordell–Weil and positive definiteness), and §5.10 (Vojta's inequality) and §5.11 (Mumford's gap principle) leave only finitely many points in each of finitely many cones.

k a number field; g ≥ 2.

([The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §10, Theorems 1–2, pp. 637–639; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, p. 286.)

Embed C in J; J(k) is finitely generated (§1.7 (The Mordell–Weil theorem)) and ĥ is positive definite on J(k) ⊗ ℝ (§1.8 (Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ)).

Cover J(k) ⊗ ℝ by finitely many cones of angle < cos⁻¹(3/4); in each, §5.11 (Mumford's gap principle) forces geometric growth and §5.10 (Vojta's inequality) bounds the ratio, leaving finitely many points (Bombieri §10, Theorem 2).

Bombieri Thm.2 bounds the number of points above a specified norm threshold in terms of rank and γ. Northcott gives finiteness below that threshold but does not make the theorem an effective enumeration or a bound on every rational-point height.

**Checks.**

- Bombieri's Theorem 2 gives an explicit bound for the number of rational points, not for their heights.

*Needs:* §5.10 (Vojta's inequality); §5.11 (Mumford's gap principle); §1.8 (Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ).


### 5.13 The Mordell–Lang theorem

Prove `TauCeti.AbelianVariety.mordell_lang`. Let A be an abelian variety over an algebraically closed field F of characteristic 0, X ⊆ A a closed subvariety and Γ ⊆ A(F) a subgroup of finite rank. Then X(F) ∩ Γ is a finite union of sets (x_i + B_i(F)) ∩ Γ with x_i + B_i ⊆ X cosets; consequently X° ∩ Γ is finite. Special cases: Γ = A(K) finitely generated (§5.9 (Faltings' theorem on rational points of subvarieties of abelian varieties)), Γ = A_tors (§5.6 (The Manin–Mumford theorem)).

Characteristic 0; Γ of finite rank (§5.5 (Subgroups of finite rank)).

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3; [Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), §1, pp. 1–3.)

Finitely generated Γ over a number field: §5.9 (Faltings' theorem on rational points of subvarieties of abelian varieties). Specialisation reduces finitely generated F to number fields (Raynaud, Hindry).

Finite rank: Γ lies in the division hull of a finitely generated Γ₀; McQuillan 1995 combined with Hindry's Galois-orbit argument handles division points (as cited by Gao–Ge–Kühne §1).

Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

**Checks.**

- For X a curve of genus ≥ 2 in its Jacobian and Γ the division hull of J(K), X ∩ Γ is finite.

*Needs:* §5.9 (Faltings' theorem on rational points of subvarieties of abelian varieties); §5.6 (The Manin–Mumford theorem); §5.5 (Subgroups of finite rank); §5.4 (The Ueno locus).


### 5.14 The Faltings–Zhang difference map

For an abelian variety A and M ≥ 1, D_M : A^{M+1} → A^M, (P₀, …, P_M) ↦ (P₁ − P₀, …, P_M − P₀). For a subvariety X ⊆ A, D_M restricts to X^{M+1} → A^M. In families of curves over S → M_g it is built from Pic¹ × Pic¹ → Jac by differences, landing in 𝔄_g^{[M]} ×_{A_g} S.

M ≥ 1 (the source states M ≥ 2 on p. 6 but uses D₁).

([Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), (1.3), p. 6; §6.1, (6.3)–(6.5), pp. 24–25; p. 28; [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30.)

A morphism of abelian varieties composed with translations; its restriction to X^{M+1} is proper.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.faltingsZhang`: D_M : A^{M+1} → A^M.
- `TauCeti.AbelianVariety.faltingsZhang_apply`: D_M(P₀, …, P_M) = (P₁ − P₀, …, P_M − P₀).
- `TauCeti.AbelianVariety.faltingsZhang_hom`: D_M is a homomorphism of abelian varieties.
- `TauCeti.AbelianVariety.faltingsZhang_diag`: D_M(P, …, P) = 0.

**Checks.**

- `faltingsZhang.test_M1`: D₁(P, Q) = Q − P.
- `faltingsZhang.test_diagonal`: The diagonal maps to 0.
- `faltingsZhang.test_kernel`: ker D_M is the diagonal copy of A.
- `faltingsZhang.test_not_finite_on_coset`: On X = B a positive-dimensional abelian subvariety, D_M|_{X^{M+1}} has positive-dimensional fibres for every M.
- D₁ on X × X is the difference map (x, y) ↦ y − x.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`.


### 5.15 Zhang's difference-map lemma

Prove `TauCeti.AbelianVariety.faltingsZhang_generic_fibre`. For an irreducible closed subvariety X of an abelian variety A with finite stabilizer there is M₀ such that for M ≥ M₀ the generic fibre of D_M : X^{M+1} → A^M is a single orbit of Stab(X) acting diagonally; in particular D_M|_{X^{M+1}} is generically finite onto its image.

X irreducible with finite stabilizer. The scheme-fibre/orbit statement is in characteristic zero. A geometric-point stabilizer identity alone cannot prove equality with a nonreduced scheme stabilizer in characteristic p.

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30.)

Fibres of D_M over a point are intersections of translates of X; for M large these stabilise to Stab(X) (Zhang 1998, proof of Lemma 3.1, as recalled by Gao–Ge–Kühne).

**Checks.**

- For a curve of genus ≥ 2 in its Jacobian, D₂ is generically finite on C³.

*Needs:* §5.14 (The Faltings–Zhang difference map); §5.2 (Stabilizers of subvarieties).


### 5.16 The minimal torsion subvariety containing X

For an irreducible closed subvariety X of an abelian variety A over an algebraically closed field, T_X is the smallest torsion coset of A containing X; for a ∈ T_X torsion, T_X − a is an abelian subvariety. X is a torsion coset iff X = T_X.

X irreducible.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Lemma 5.3, p. 24.)

Intersections of torsion cosets containing X are finite unions of torsion cosets; irreducibility selects one component; descending chain condition on abelian subvarieties.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.minimalTorsionCoset`: T_X.
- `TauCeti.AbelianVariety.subset_minimalTorsionCoset`: X ⊆ T_X.
- `TauCeti.AbelianVariety.minimalTorsionCoset_le`: T_X ⊆ T for every torsion coset T ⊇ X.
- `TauCeti.AbelianVariety.isTorsionCoset_iff`: X is a torsion coset iff X = T_X.

**Checks.**

- `minimalTorsionCoset.test_torsion_point`: T_{{t}} = {t} for t torsion.
- `minimalTorsionCoset.test_nontorsion_point`: For E elliptic and x of infinite order, T_{{x}} = E.
- `minimalTorsionCoset.test_subgroup`: For an abelian subvariety B, T_B = B.
- `minimalTorsionCoset.test_translate`: For x + B with x not torsion modulo B, T_{x+B} ≠ x + B.
- For a torsion point t, T_{{t}} = {t}; for a non-torsion point x of an elliptic curve E, T_{{x}} = E.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients).


### 5.17 The essential minimum of a subvariety

Let A be an abelian variety over a number field (or a polarized function field) K, L a symmetric ample line bundle and X ⊆ A_{K̄} a nonempty irreducible closed subvariety. The essential minimum is μ_ess(X) = sup over proper closed Y ⊊ X of inf{ĥ_L(x) : x ∈ X(K̄) ∖ Y(K̄)}; equivalently the infimum of the ε ≥ 0 such that {x ∈ X(K̄) : ĥ_L(x) ≤ ε} is Zariski dense in X. X has dense small points iff μ_ess(X) = 0.

L symmetric ample; ĥ_L the Néron–Tate height. X is nonempty and irreducible. The zero-height/torsion tests and μ_ess=0 iff torsion-coset theorem use number fields; geometric function-field constants require the trace correction and are not covered by that equivalence.

([Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017), §1, Théorème 1.1, p. 1 (arXiv); [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §1.1, pp. 1–3.)

Monotone in Y; independent of the field of definition by the Galois invariance of ĥ.

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.essentialMinimum`: μ_ess(X) ∈ [0, ∞).
- `TauCeti.AbelianVariety.essentialMinimum_eq_zero_iff`: μ_ess(X) = 0 iff points of arbitrarily small height are Zariski dense in X.
- `TauCeti.AbelianVariety.essentialMinimum_translate_torsion`: μ_ess(X + t) = μ_ess(X) for torsion t.
- `TauCeti.AbelianVariety.essentialMinimum_nonneg`: μ_ess(X) ≥ 0.

**Checks.**

- `essentialMinimum.test_torsion_coset`: μ_ess(t + B) = 0.
- `essentialMinimum.test_point`: For a point X = {x}, μ_ess(X) = ĥ_L(x).
- `essentialMinimum.test_kernel`: Over a number field, for X={x}, μ_ess(X)=0 iff x is torsion. The statement on arbitrary polarized function fields instead has the geometric-trace kernel.
- `essentialMinimum.test_inf_not_ess`: Over a number field, a genus≥2 curve through 0 has inf ĥ=0 but μ_ess>0 by Bogomolov. This test is not asserted for a constant curve over a function field.
- For X a torsion coset, μ_ess(X) = 0.

*Needs:* §0.21 (The Néron–Tate canonical height); §0.22 (Positivity and kernel of the Néron–Tate height).


### 5.18 The Bogomolov conjecture (Ullmo–Zhang)

Prove `TauCeti.AbelianVariety.bogomolov`. Let A be an abelian variety over a number field K, L a symmetric ample line bundle and X ⊆ A_{K̄} an irreducible closed subvariety that is not a torsion coset. Then μ_ess(X) > 0: there is ε > 0 such that {x ∈ X(K̄) : ĥ_L(x) < ε} is not Zariski dense in X. For a curve of genus ≥ 2 embedded in its Jacobian, the set of points of height < ε is finite (Ullmo). Manin–Mumford alone (height zero) does not imply this.

K a number field (characteristic 0); X not a torsion coset.

([Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017), §1, Théorème 1.1, p. 1 (arXiv alg-geom/9606017); [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §5, Theorem 5.5 and proof, arXiv v2 pp.13–16, for the tropical equidistribution analogue; Theorem 1.1, p.1, and its proof in §6, pp.17–18, for the totally degenerate function-field Bogomolov theorem, not the number-field generality stated here.)

Reduce to X with finite stabilizer that generates A (quotient by Stab⁰(X), §5.16 (The minimal torsion subvariety containing X)).

Suppose small points are dense; by Szpiro–Ullmo–Zhang equidistribution (§5.19 (Equidistribution of small points on abelian varieties)) generic small sequences on X^{M+1} and on D_M(X^{M+1}) equidistribute to the canonical measures.

Zhang's difference lemma makes D_M generically finite; comparing the pushforward of the measure on X^{M+1} with the measure on the image yields a contradiction on the support (Zhang 1998; Ullmo 1998 for curves).

**Checks.**

- For X=x+B, assume the image of x in A/B has infinite order; x itself having infinite order does not suffice when x∈B. Then μ_ess(X)>0. An exact equality with a quotient-point height requires the specified quotient-induced orthogonal polarization; arbitrary polarizations only give the appropriate comparison/positivity.

*Needs:* §5.17 (The essential minimum of a subvariety); §5.15 (Zhang's difference-map lemma); §5.16 (The minimal torsion subvariety containing X); §5.19 (Equidistribution of small points on abelian varieties).


### 5.19 Equidistribution of small points on abelian varieties

Prove `TauCeti.AbelianVariety.equidistribution_small_points`. Let A be an abelian variety over a number field K, L symmetric ample, X ⊆ A geometrically irreducible and defined over K (after a finite extension if needed) with μ_ess(X) = 0, and (x_n) a generic sequence in X(K̄) (no infinite subsequence lies in a proper closed subvariety of X) with ĥ_L(x_n) → 0. Then for every archimedean place v the probability measures equidistributed on the Galois orbits of x_n in X(ℂ_v) converge weakly to the normalised canonical measure c₁(L, ‖·‖_can)^{dim X}/deg_L X.

K a number field; (x_n) generic and small. For the general-subvariety version use Ullmo Thm.2.4: a semipositive adelic metric with strictly positive archimedean curvature and the prescribed uniform approximation by arithmetic model metrics, with the normalized subvariety height and generic small sequence. The abelian canonical version is Thm.2.3; the general version is not inferred solely from μ_ess=0 without the metric/intersection input. Take Galois orbits over a field of definition of X; otherwise their support can leave X and the asserted measure on X(ℂ_v) is ill-typed. Generic means that every proper closed subset contains only finitely many terms, not that no finite subsequence lies in it.

([Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017), §1, discussion of Zhang's admissible pairing and equidistribution, pp. 1–3; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §1 and §5, citing Zhang 1998 and Szpiro–Ullmo–Zhang; [Adelic Line Bundles on Quasi-projective Varieties](https://arxiv.org/abs/2105.13587v9), Theorem A.6.3, pp.248–249: generic, height-small sequences for a relatively semipositive adelic metric on an ample bundle.)

Szpiro–Ullmo–Zhang 1997: Zhang's successive minima inequality for adelic metrized line bundles and the variational principle with perturbed metrics.

Its inputs, the arithmetic intersection theory of adelic metrized line bundles on varieties of arbitrary dimension (arithmetic Hilbert–Samuel and successive minima), require the additional adelic intersection contract above.

**Checks.**

- For an elliptic curve E over a number field, a generic sequence of torsion points has Galois-orbit measures converging to Haar measure. A constant torsion sequence is not generic and does not equidistribute.

*Needs:* §5.17 (The essential minimum of a subvariety); §0.26 (Local Weil functions and Néron functions); §0.21 (The Néron–Tate canonical height).


### 5.20 Hypersurface sections of abelian varieties containing no cosets

Prove `TauCeti.AbelianVariety.exists_cosetFree_hypersurface`. Let A ⊆ ℙ^M be an abelian variety of dimension g ≥ 1 and d ≥ g − 1. There is a dense Zariski open U in the space of degree-d forms, with complement of codimension ≥ d + 2 − g, such that A ∩ 𝒵(f) contains no positive-dimensional coset for f ∈ U. For an abelian subvariety B with dim B ≥ 1 and d ≥ max{1, g − dim B}, the forms f with A ∩ 𝒵(f) containing a translate of B lie in a closed subset of codimension ≥ d + 1 + dim B − g. The Hilbert function satisfies H_V(d) ≥ binom(dim V + d, dim V) ≥ d + 1 for V ⊆ ℙ^M with dim V ≥ 1.

A ⊆ ℙ^M projective; d as stated. A and the form space are over an algebraically closed field of characteristic zero. The good open excludes forms vanishing identically on A, including the zero form.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), (C.1), Lemma C.2 and Proposition C.1 with corollary and proofs, pp. 59–61.)

Incidence variety of (coset translate, form) and fibre dimension counts using the Hilbert function lower bound (Gao–Habegger Lemma C.2 and (C.1)).

Bogomolov's finiteness of maximal cosets reduces to finitely many B (§5.4 (The Ueno locus)); apply Lemma C.2 to each (Proposition C.1).

**Checks.**

- For g=1, every form not identically zero on A gives a finite section; forms identically zero on A give the whole elliptic curve and lie outside U. In particular U is not the entire vector space of forms.

*Needs:* §5.4 (The Ueno locus); §5.1 (Abelian subvarieties, cosets and quotients); SchemeAndStackFoundations §§5.1–5.6 and 5.12; StableReductionAndModuliOfCurves Layer 2 for ampleness, with the presentation and Lefschetz contracts above.


### Examples

For a genus-at-least-two curve C in its Jacobian, `Stab⁰(C)=0` and the Ueno locus is empty. For `X=C×E⊆Jac(C)×E`, every point lies on a positive-dimensional E-coset and the Ueno locus is all X. The zero-dimensional abelian variety has no positive-dimensional coset, so its Ueno locus is empty.

The additive group ℚ has rational rank one and is not finitely generated. A torsion group has rational rank zero even if it is infinite. Thus the finite-rank Mordell–Lang hypothesis includes division points and is stronger in scope than the number-field finite-generation case.

The difference map `D₂(P₀,P₁,P₂)=(P₁−P₀,P₂−P₀)` sends `(0,P,2P)` to `(P,2P)` and a diagonal triple to zero. On a translated elliptic subgroup it has positive-dimensional fibres; the finite-stabilizer hypothesis cannot be removed. A torsion coset has dense height-zero points and essential minimum zero. A non-torsion point has a strictly positive essential minimum over a number field, but a non-torsion constant point over a function field can have height zero; the latter requires the trace correction.



### Dependencies

Layers 0–1; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5; JacobianChallenge Layer F; SchemeAndStackFoundations §§1.14,5.1–5.6,5.12, with the subscheme-stabilizer and positive-dimensional quotient refinements. The Vojta route needs the product/Roth estimates. Higher-dimensional arithmetic intersections, division-point control, torsion Galois bounds, Ueno structure and adelic equidistribution are the additional contracts specified above. The curve theorem is not deduced from a higher-tier Faltings finiteness roadmap.



## Layer 6: rational points by genus and conjectural extensions

Local solubility, orthogonality, finite generation and finiteness are separate conclusions. Genus zero uses conics and Hasse–Minkowski; genus one uses a marked Jacobian torsor and Mordell–Weil after a rational point is found; genus at least two uses the rational-point theorem and its abelian intersection refinements. The conjectural extensions are precisely quantified propositions, and the conditional genus-one Brauer sufficiency statement explicitly assumes finite Sha.


### 6.1 Local solubility and the local-global principle

A variety X over a number field K is locally soluble (everywhere locally soluble) if X(K_v) ≠ ∅ for every place v. X satisfies the local-global principle (Hasse principle) if X(𝔸_K) ≠ ∅ implies X(K) ≠ ∅, and weak approximation if X(K) is dense in Π_v X(K_v). For X proper, X(𝔸_K) ≠ ∅ iff X is locally soluble; for X of finite type, local solubility at the finitely many places outside a model's good set and integral points elsewhere characterise X(𝔸_K) ≠ ∅.

K a number field; X separated of finite type.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.7 (definition of the local-global principle), p. 245; §2.6.3, pp. 49–50.)

For proper X, X(𝔸_K) = Π_v X(K_v) (§2.11 (Adelic points of separated schemes of finite type)).

In general use §2.5 (Adelic points exist iff local points exist and are integral almost everywhere) (integral points almost everywhere, from Lang–Weil and Hensel for smooth geometrically integral fibres).

Its interface consists of the following operations and laws.

- `TauCeti.IsLocallySoluble`: ∀ v, X(K_v) ≠ ∅.
- `TauCeti.SatisfiesHassePrinciple`: X(𝔸_K) ≠ ∅ → X(K) ≠ ∅.
- `TauCeti.SatisfiesWeakApproximation`: X(K) dense in Π_v X(K_v).
- `TauCeti.adelicPoints_nonempty_iff_locallySoluble`: For proper X, X(𝔸_K) ≠ ∅ ↔ IsLocallySoluble X.
- `TauCeti.IsLocallySoluble.of_rationalPoint`: X(K) ≠ ∅ ⇒ X locally soluble.

**Checks.**

- `IsLocallySoluble.test_conic`: x² + y² = 3z² over ℚ is not locally soluble (no ℚ₃-point).
- `IsLocallySoluble.test_point`: Spec K is locally soluble and satisfies the Hasse principle.
- `SatisfiesHassePrinciple.test_conic`: Smooth conics satisfy the Hasse principle (GlobalQuadraticForms Layer 5; §2.26 (Conics: Brauer–Manin set and the Hasse principle)).
- `SatisfiesHassePrinciple.test_iskovskikh`: Iskovskikh's surface is locally soluble without rational points (§2.27 (Iskovskikh's conic bundle surface)).
- x² + y² = 3z² is not locally soluble at 3.

*Needs:* §2.11 (Adelic points of separated schemes of finite type); §2.5 (Adelic points exist iff local points exist and are integral almost everywhere).


### 6.2 Rational points on genus-zero curves

Prove `TauCeti.Curve.genusZero_hasse`. Let C be a smooth projective geometrically connected curve of genus 0 over a number field K. Then C is isomorphic to a smooth plane conic; C satisfies the Hasse principle; if C(K) ≠ ∅ then C ≅ ℙ¹_K, C(K) is infinite and Zariski dense, and C satisfies weak approximation. Whether C(K) ≠ ∅ is decided by finitely many local conditions (the places where the associated quaternion algebra ramifies).

K a number field; genus 0.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §4.5, Example 4.5.8 and Theorems 4.5.10–4.5.11, printed pp.106–108.)

Anticanonical embedding as a conic (SchemeAndStackFoundations Layer 3/projective-line-characterization); Hasse–Minkowski for ternary forms (GlobalQuadraticForms Layer 5); a point gives ℙ¹ by projection.

Brauer–Manin is vacuous on conics (§2.26 (Conics: Brauer–Manin set and the Hasse principle)).

**Checks.**

- x² + y² = z² ≅ ℙ¹_ℚ; x² + y² = 3z² has no rational point.

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; [TauCetiRoadmap.GlobalQuadraticForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalQuadraticForms/README.md#layer-5-hasseminkowski-isotropy); §2.26 (Conics: Brauer–Manin set and the Hasse principle); §6.1 (Local solubility and the local-global principle).


### 6.3 Rational points on genus-one curves

Prove `TauCeti.Curve.genusOne_classification`. Let C be a smooth projective geometrically connected curve of genus 1 over a number field K with Jacobian E. Then: C is an E-torsor with class [C] ∈ H¹(K, E) (§3.17 (Genus-one curves as torsors and the Weil–Châtelet group)); C(K) ≠ ∅ iff [C] = 0, and then C ≅ E and C(K) ≅ E(K) is a finitely generated group (Mordell–Weil), finite or infinite according to the rank; if C is locally soluble, [C] ∈ Ш(E/K), and C(K) = ∅ is possible (a positive proportion of locally soluble genus-one curves y² = f(x), Bhargava–Gross–Wang Theorem 10 with g = 1). If Ш(E/K) is finite, the only obstruction to C(K) ≠ ∅ is the Brauer–Manin obstruction (Manin); the finiteness of Ш remains conjectural; the preceding Brauer–Manin sufficiency statement is a proved conditional theorem and uses finiteness explicitly.

K a number field; genus 1.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.12, Example 5.12.12 and Proposition 5.12.14, pp. 153–155; §8.3, pp. 236–238; [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), Theorem 10, p. 3; [Finite descent obstructions and rational points on curves](https://mathe2.uni-bayreuth.de/stoll/papers/covers8.pdf), Corollary 7.4 and Lemma 7.5 with the preceding Cassels–Tate comparison, author-copy pp.30–31.)

Torsor classification (§3.17 (Genus-one curves as torsors and the Weil–Châtelet group)); Mordell–Weil for E (TauCetiRoadmap EllipticCurves Layer 6; §1.7 (The Mordell–Weil theorem)).

Locally soluble failures: §3.18 (Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction).

Manin's theorem: the Cassels–Tate pairing on Ш(E/K) is computed by the Brauer–Manin pairing of algebraic classes on C (Skorobogatov, Torsors and rational points §6.2); stated conditionally on finiteness of Ш.

**Checks.**

- The curves 2w² = x⁴ + 1 and w² = x⁴ + 1 have rational points and are elliptic curves of rank 0 (Poonen §8.3).

*Needs:* §3.17 (Genus-one curves as torsors and the Weil–Châtelet group); §1.7 (The Mordell–Weil theorem); §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties); §3.18 (Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction); §2.13 (The Brauer–Manin pairing and set for varieties).


### 6.4 Rational points on curves of genus at least two

Prove `TauCeti.Curve.higherGenus_finite`. Let C be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K. Then C(K) is finite (Faltings), by either proof route (§4.6 (The Mordell conjecture (Faltings' theorem)) or §5.12 (Faltings' theorem by the Vojta–Bombieri route)); ι(C)(K̄) ∩ Γ is finite for every finite-rank Γ ⊆ J(K̄) (Mordell–Lang); points of small Néron–Tate height on ι(C) are finite (Bogomolov). No proved theorem gives an algorithm listing C(K) in general; for curves over function fields the analogue holds for non-isotrivial curves.

K a number field; g ≥ 2. Choose a degree-one Picard class after a finite extension to define ι if needed, or work in the Pic¹ torsor. The curve’s rational points transfer back by the closed immersion.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, Theorem 9.5.1 and Remark 9.5.2, p. 286.)

Faltings: §4.6 (The Mordell conjecture (Faltings' theorem)); Mordell–Lang and Bogomolov on ι(C): §5.13 (The Mordell–Lang theorem), §5.18 (The Bogomolov conjecture (Ullmo–Zhang)), transferred by JacobianChallenge Layer F, Abel–Jacobi closed immersion and universal property; function fields: §4.9 (The Mordell conjecture over function fields).

**Checks.**

- y² = (x² + 1)(x⁴ + 1) over ℚ has exactly eight rational points (§3.19 (A worked descent: y² = (x² + 1)(x⁴ + 1))).

*Needs:* §4.6 (The Mordell conjecture (Faltings' theorem)); §5.13 (The Mordell–Lang theorem); §5.18 (The Bogomolov conjecture (Ullmo–Zhang)); JacobianChallenge Layer F, Abel–Jacobi closed immersion and universal property; §4.9 (The Mordell conjecture over function fields).


### 6.5 Statements of the open conjectures (no consumer treats them as proved)

The following are defined as propositions; none is asserted unconditionally here, and the conditional genus-one sufficiency theorem states its finiteness hypothesis explicitly: (a) Bombieri–Lang: for a geometrically integral variety X of general type over a number field K with dim X > 0, X(K) is not Zariski dense; (b) Vojta's main conjecture for a smooth projective X with canonical divisor K_X, ample A, normal crossings divisor D, finite set of places S and ε > 0: Σ_{v∈S} λ_{D,v}(x) + h_{K_X}(x) ≤ ε·h_A(x) + O(1) outside a proper Zariski closed subset; (c) Colliot-Thélène's conjecture: for smooth proper geometrically rationally connected X over a number field, X(K) is dense in X(𝔸_K)^{Br}; (d) finiteness of Ш(A/K) for abelian varieties over number fields. Each is a definition of a Prop with a precise statement; the register records which special cases are theorems (curves for (a) by Faltings; conics and Châtelet surfaces with few degenerate fibres for (c)). In (b), quantify over rational points x∈X(K) outside Supp(D)∪Z, require S to contain all archimedean places, choose Z depending on the geometric data and ε, and allow a uniform additive constant depending on the fixed data and S. This is the rational-point, untruncated ε-height form; no bounded-degree discriminant or truncated-counting version is asserted.

Statements only; hypotheses as in Poonen §9.5.3 and §9.2.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.3, Conjecture 9.5.11, printed p.288; Conjecture 9.2.27, printed p.267; [Diophantine Approximation and Nevanlinna Theory](https://math.berkeley.edu/~vojta/cime/cime.pdf), §14, Conjecture 14.6(b), printed p.160; contrast §24, Conjecture 24.1, printed p.200; [Supersolvable descent for rational points](https://msp.org/ant/2024/18-4/ant-v18-n4-p05-s.pdf), §1, Conjecture 1.1, printed p.787.)

Write each statement over the carriers of this roadmap (rational points, Weil heights and local Weil functions, Brauer–Manin sets, Ш).

Its interface consists of the following operations and laws.

- `TauCeti.BombieriLangConjecture`: The proposition (a), quantified over K and X.
- `TauCeti.VojtaConjecture`: The proposition (b).
- `TauCeti.BrauerManinOnlyObstructionConjecture`: The proposition (c) for rationally connected varieties.
- `TauCeti.ShaFinitenessConjecture`: The proposition (d).
- `TauCeti.bombieriLang_curves`: The case dim X = 1 of (a) holds (Faltings).

**Checks.**

- `BombieriLangConjecture.test_curves`: Restricted to curves of genus ≥ 2, (a) is equivalent to §4.6 (The Mordell conjecture (Faltings' theorem)).
- `BombieriLangConjecture.test_dim_zero`: The hypothesis dim X > 0 excludes points, for which the statement would be false (a rational point is Zariski dense in itself).
- `BrauerManinOnlyObstructionConjecture.test_conic`: For conics (c) holds (§2.26 (Conics: Brauer–Manin set and the Hasse principle)).
- `BrauerManinOnlyObstructionConjecture.test_not_general_type`: (c) is false without rational connectedness: Skorobogatov's bielliptic surface (§3.21 (Insufficiency of the Brauer–Manin and descent obstructions)) has X(𝔸)^{Br} ≠ ∅ = X(ℚ).
- `BombieriLangConjecture.test_genus_one`: A positive-rank elliptic curve has Zariski-dense rational points but is not of general type, so it lies outside the quantified class.
- `VojtaConjecture.test_projective_line`: For X=ℙ¹, D=0 and A=O(1), choose h_{K_X}=−2h_A. Then the inequality holds with zero additive constant for the standard nonnegative height; a sign reversal of K_X would fail on unbounded-height points when ε<2.
- `VojtaConjecture.test_boundary`: For X=ℙ¹ and D={0,∞}, the points 0 and ∞ are excluded because their local Weil functions are singular, whereas x=1 has zero proximity for the standard metrics.
- `VojtaConjecture.test_uniformity`: On ℙ¹ with D={0,∞}, S={∞,2} and x=2^m (m≥0), the standard proximity is 2m log 2, while h_{K_X}=−2m log 2; their sum is zero. The constant is one fixed constant for all m, rather than a separate choice after seeing x.
- `BrauerManinOnlyObstructionConjecture.test_point`: For X=Spec K, both the rational and adelic sets are singletons and density holds.
- `ShaFinitenessConjecture.test_zero`: The trivial abelian variety has Ш=0, a finite group.
- `ShaFinitenessConjecture.test_nonzero_finite`: The predicate is finiteness, not vanishing: applied to an abstract group ℤ/2 it is true despite the nonzero element.
- `ShaFinitenessConjecture.test_bounded_exponent`: Applied to the abstract group ⊕_{n∈ℕ} ℤ/2, finiteness is false although every element is killed by 2. This tests the predicate; it does not assert that this group occurs as an arithmetic Ш.
- For curves, (a) is Faltings' theorem (§6.4 (Rational points on curves of genus at least two)).

*Needs:* §0.17 (Weil's height machine); §0.26 (Local Weil functions and Néron functions); §2.13 (The Brauer–Manin pairing and set for varieties); §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties).


### Examples

The conic x²+y²=3z² fails local solubility at 3. A soluble conic is ℙ¹ and has infinitely many rational points with weak approximation. The genus-one curve `y²=x³−x` has four rational points and rank zero; a positive-rank elliptic curve has infinitely many rational points. A locally soluble nontrivial genus-one torsor has a Sha class and no rational point, despite its local points.

For `y²=(x²+1)(x⁴+1)`, the genus-two descent in Layer 3 lists eight rational points. The general genus-at-least-two theorem proves finiteness without supplying a terminating enumeration. Bombieri–Lang in dimension one is that finiteness theorem; in dimension zero a rational point is dense in itself and must be excluded. The rationally connected Brauer sufficiency conjecture does not extend to Skorobogatov's bielliptic surface.



### Dependencies

Layers 0–5; JacobianChallenge Layer F; GlobalQuadraticForms Layer 5; EllipticCurves Layer 7; SchemeAndStackFoundations §§3.2 and 3.6. Conditional genus-one Brauer sufficiency uses finite Sha and the Cassels–Tate/Brauer comparison. The conjecture propositions supply no unconditional input to the other genus conclusions.



## Downstream consumers

EffectiveDiophantineMethods uses explicit heights, Kummer local conditions, finite Brauer constraints and the genus classification, and adds terminating algorithms with certified output. A finiteness theorem or a nonempty obstruction set alone does not certify an enumeration. AnabelianGeometryAndNonabelianChabauty uses the abelian depth-one Kummer and Selmer interfaces and the arithmetic descent sets. GrossZagierAndArithmeticHeights uses canonical heights and the unhalved pairing, then supplies its intersection comparison. AdelicAlgebraicGroups specializes adelic points and torus descent to algebraic groups. ArithmeticDynamics uses the Tate-limit and canonical-metric constructions; its dynamical intersection and equidistribution statements have their own hypotheses. Later Faltings and Lawrence–Venkatesh roadmaps consume the Parshin construction and the unique curve finiteness theorem.

## References

- Aise Johan de Jong, [Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf).
- Bjorn Poonen, [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf).
- Brian Conrad, [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf).
- B. Conrad, [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf).
- J. S. Milne, [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf).
- L. Szpiro, [La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf).
- E. Bombieri, [The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf).
- W. Gubler, [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2).
- E. Ullmo, [Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017).
- Z. Gao, P. Habegger, [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3).
- V. Dimitrov, Z. Gao, P. Habegger, [Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3).
- Z. Gao, T. Ge, L. Kühne, [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4).
- J. Xie, X. Yuan, [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1).
- Y. Harpaz, O. Wittenberg, [Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf).
- Y. Harpaz, O. Wittenberg, [The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf).
- M. Bhargava, B. H. Gross, X. Wang, [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2).
- T. Scanlon, [Positive characteristic Manin–Mumford theorem](https://arxiv.org/abs/math/0303340).
- K. Česnavičius, [Purity for the Brauer group](https://arxiv.org/abs/1711.06456v4).
- Tau Ceti roadmap authors, [EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves).
- Tau Ceti roadmap authors, [EllipticCurves roadmap, Layer 7: Selmer groups and Sha](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves).
- Xinyi Yuan, [Arithmetic bigness and a uniform Bogomolov-type result](https://arxiv.org/abs/2108.05625v4). arXiv:2108.05625v4, 30 April 2024; manuscript dated 1 May 2024.
- J. Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/2018/187-2/p02).
- A. N. Skorobogatov, E. Sofos, [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf).
- T. Browning, P. Le Boudec, W. Sawin, [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/abs/2006.02356).
- E. Bombieri, W. Gubler, Heights in Diophantine Geometry.
- P. Corvaja, U. Zannier, [A subspace theorem approach to integral points on curves](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf).
- A. Mattuck, [Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf).
- S. Lang (article); N. Katz (Appendix), [Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf).
- Jan Steffen Müller and Michael Stoll, [Computing canonical heights on elliptic curves in quasi-linear time](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf).
- Paul Vojta, [Diophantine Approximation and Nevanlinna Theory](https://math.berkeley.edu/~vojta/cime/cime.pdf).
- Yonatan Harpaz and Olivier Wittenberg, [Supersolvable descent for rational points](https://msp.org/ant/2024/18-4/ant-v18-n4-p05-s.pdf).
- W. Gubler, [Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf).
- Xinyi Yuan and Shou-Wu Zhang, [Adelic Line Bundles on Quasi-projective Varieties](https://arxiv.org/abs/2105.13587v9). arXiv v9, 14 June 2025; Theorem A.6.3, pp.248–249.
- Michael Stoll, [Finite descent obstructions and rational points on curves](https://mathe2.uni-bayreuth.de/stoll/papers/covers8.pdf). Author manuscript; Corollary 7.4 and Lemma 7.5, pp.30–31.
