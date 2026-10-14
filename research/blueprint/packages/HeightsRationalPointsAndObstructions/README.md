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
- **ArithmeticGaloisDuality**, Layers R02.3–R02.4, owns restricted-ramification finite H¹ over number fields and Poitou–Tate duality for tori. **NeronModelsAndSemistableAbelianVarieties**, §§1.1, 1.8 and 5.1, supplies the Néron mapping property, good-reduction models and Néron–Ogg–Shafarevich. Section 1.15b constructs the smooth formal identity chart.

Sections 5.17a–5.17g own the number-field semipositive adelic intersection, Hilbert–Samuel, successive-minima and variation inputs needed for abelian small-point equidistribution in arbitrary dimension. **ArakelovGeometryAndAbelianHeights, Part II** imports this scope and owns its further arithmetic-intersection directions. The point-metric interface of Layer 0 remains distinct from those cycle-height constructions. **ArithmeticDynamics** imports the Tate limit and owns its dynamical applications; **AdelicAlgebraicGroups** imports the general adelic-point construction and owns group approximation. **EffectiveDiophantineMethods** owns certified enumeration and computable local solvers. **GrossZagierAndArithmeticHeights** owns the arithmetic intersection comparison for Jacobians and imports the geometric heights here. **FaltingsFinitenessAndIsogenyTheorems** and **MordellLawrenceVenkatesh** consume the Parshin construction and rational-point conclusion. Their higher-tier finiteness theorems are not prerequisites of the unconditional Vojta–Bombieri route.

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

[TauCetiRoadmap.StableReduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md), Layer 2, supplies ampleness and relative curve cohomology: smooth proper geometrically connected families have locally constant genus, and geometric Riemann–Roch/vanishing computes the Abel fibres. Its ample-line-bundle interface is used for projective presentations, while SchemeAndStackFoundations supplies geometric cycles and projections.

[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md), §§0.2–0.3, supplies bounded-degree scalar Northcott; §2.8 supplies `absoluteSubspaceTheoremForSystems` for number-field, place-dependent independent linear forms with its local weights and determinant normalization. The rational p-adic and S-unit specializations in §2.3 alone are insufficient for Siegel over an arbitrary number field.

### Geometric and arithmetic proof routes

The constructions below keep the geometric, cohomological and analytic inputs distinct. A general connected-group descent theorem and the nonsmooth function-field curve theorem require the additional inputs stated in §§3.3b,3.8f and 4.9c; the finite-module and smooth-curve arguments do not establish those stronger inputs.

For **positive-dimensional quotients and stabilizers**, §1.0 constructs A/B from a Poincaré complement and the existing finite-subgroup quotient. Section 5.2 represents the full translation stabilizer by a Hilbert-scheme fibre, retaining its scheme structure. Faithfully flat descent of its invariant ideal identifies the quotient subvariety. Sections 5.4a–5.4c bound maximal coset directions by geometric intersections, bound their lattices by Minkowski, and use finitely many proper incidence images to construct the closed Ueno locus.

For **projective presentations and metrics**, §0.15a proves uniform geometric local log-ratio bounds from finitely many polynomial identities, with a summable weighted majorant. Section 0.29a proves generic-trivial descent on an abelian scheme using the separated relative Picard space and its identity section. Sections 1.15a–1.15b construct the integral formal identity chart and identify deep reduction kernels at all reduction types. Section 2.11a supplies étale local-point lifting, including over positive-characteristic local fields.

For **Brauer comparison and purity**, §§2.6a–2.6d construct twisted modules, their stabilization and the Azumaya comparison for quasi-projective varieties over infinite fields. Sections 2.16a–2.16b give finite-coefficient supported cohomology, residues and codimension-two removal for smooth characteristic-zero varieties. Section 2.17a then identifies proper-model classes with the intersection over all discrete valuation rings. This route uses smooth-pair comparison, not absolute purity for arbitrary regular mixed-characteristic local rings. Section 2.19a supplies the finite-flat norm and curve reciprocity needed by the zero-cycle pairing. Sections 2.25a–2.25b connect positive-divisor Morse theory to complete-intersection Picard, H²(μ_n) and geometric fundamental-group calculations.

For **Lang–Néron and global function fields**, §§1.9a–1.10a put prime-to-characteristic curve H¹, bounded graph families and their constancy modulo trace before the height-kernel theorem. Section 2.3a gives global-function-field models, proper local-point compactness and the adelic direct limit. Section 3.3a proves proper finite-étale-torsor finiteness using bounded local differents, including characteristic-dividing finite étale groups. General smooth connected affine groups still require `connectedShaOutside_finite` in §3.3b: its number-field reduction needs an explicit reductive reduction-theory adapter, and its global-function-field proof needs Harder's theorem and pseudo-reductive structure theory over imperfect fields. Split unipotent arguments cannot replace the latter.

For **Siegel's number-field adapter**, §4.7a derives the normalized product inequality from DiophantineApproximationAndTranscendence §2.8's parametric theorem. It keeps coefficient constants, determinants and absolute local-degree weights. Sections 4.9a–4.9b instead give the jet-contraction and Frobenius-descent route for smooth function-field curves and the geometric-genus-at-least-two normalization argument. Section 4.9c isolates the finite-constant-field genus-change argument and the remaining arbitrary-constant-field extension; the latter and genus-tower stabilization are necessary for the full regular-curve scope of §4.9.

For **descent comparison**, §§3.8a–3.8b give finite-cover domination, integral adelic lifts and the proper finite-cover compactness argument. Sections 3.8c–3.8e give units-sensitive extended types, universal finite abelian covers, the corrected finite-coefficient product decomposition and compatible isogenies. Section 3.8f specifies the remaining invariant-Brauer lifting and nonabelian degree-two inputs. Connected-group Poitou–Tate, coflasque resolutions, the adjoint-group kernel and simply connected central-boundary surjectivity are stronger than the torus pairing or the H¹ Hasse principle. Sections 3.9a–3.9c separately give the ordinary constant-units type obstruction, its degree-two torus duality and its evaluation interpretation. The nonconstant-units multiplicative-type comparison of §3.8c requires its compact-support extension. Sections 2.20a–2.20c supply finite Brauer quotients, residues at auxiliary places and the finite-group compensation argument used by Harari's formal lemma.

For **deep finiteness and small points**, §§5.10a–5.10e give the derivative, small-section, norm-polynomial and Roth inputs to the curve Vojta inequality. Sections 5.9a–5.9f supply the higher-dimensional product and weighted dimension-descent route; §§5.13a–5.13c separately treat division groups and specialization. Sections 5.6a–5.6d develop the characteristic-zero torsion argument; §§5.7a–5.7d develop the connected formal Dieudonné and invariant-subvariety inputs in positive characteristic. Section 5.8a derives family uniformity from constructibility and the corresponding fibre theorem. Sections 5.17a–5.17g construct the arithmetic divisor action, semipositive model limits, spectral estimates, Hilbert–Samuel, norm-controlled lifting, successive minima and variation needed for equidistribution. These are cycle-height targets in arbitrary dimension; point metrics alone do not supply them.

The **abelian-torsor interface** is §§3.17a–3.17d: construct Cassels–Tate from the Poincaré biextension, compare finite local conditions by Poitou–Tate, identify annihilation by dual n-torsion with divisibility in Sha, and compare the invariant sum with Pic⁰-derived Brauer classes and multiplication covers. Real Tate terms and maximal divisible subgroups are retained. Genus-one sufficiency assumes the indicated vanishing of the divisible obstruction; finiteness of Sha is a stronger sufficient hypothesis, not a theorem supplied here.

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

*Needs:* §0.9 (Generalized global fields); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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


### 0.15a Generated presentations and uniform local comparison

Let X be a projective K-scheme, where K is a number field, and L an invertible sheaf. A **generated difference presentation** consists of an isomorphism L≅M⊗N⁻¹ and finite K-families generating M and N everywhere. Such presentations exist: fix a very ample A and apply Serre global generation to L⊗A^n for sufficiently large n. This uses SchemeAndStackFoundations SF.4 `ample-serre-vanishing` (T243), rather than a new ampleness theory.

Prove `generatorComparison_bound`. If s and t are two everywhere-generating finite families of the same bundle, there are nonnegative c_v, zero at almost every finite place, such that
`|log(max_i |s_i(x)|_w / max_j |t_j(x)|_w)| ≤ c_v`
for every place w above v in every finite extension, using the extension of the chosen genuine absolute value at v. The ratio is computed in any common frame and is independent of that frame. Weighted absolute values multiply this estimate by their local weights. Thus the weighted sum is finite, independently of x and its field of definition. Tensor products and duals give the same assertion for difference presentations.

For the proof, map X to projective space using the combined family (s,t), and let Y be its closed image. Neither the s-family nor the t-family has a common zero on Y. The homogeneous Nullstellensatz gives an integer D and identities, modulo the homogeneous ideal of Y, expressing each coordinate to the power D as a sum of s_i times forms of degree D−1; obtain the analogous identities with t. All coefficients lie in K. Set M_v=max(|s_i|_v,|t_j|_v). The identities bound M_v^D by B_v·max|s_i|_v·M_v^{D−1}, and similarly with t. Here B_v≥1 uses finitely many coefficient norms and, at archimedean places, finitely many monomial counts. Cancel M_v>0. Outside finitely many places the coefficients are integral and B_v=1. The same polynomial identities hold over every completed algebraic extension. This proves the local assertion before summing it; a global height comparison alone would not suffice.

The construction follows de Jong, [Notes on heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, pp.7–9. The metric interpretation is Gubler, [Local and canonical heights of subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), Examples/Remarks 5.2.17–5.2.18, pp.108–109; the polynomial argument above supplies the uniform bound needed here.

The API is `generatedDifferencePresentation.exists`, `generatorComparison.frame_independent`, `generatorComparison.bound`, `generatorComparison.finiteSupport`, `generatorComparison.baseChange`, and compatibility with tensor product and dual. This is a geometric construction in the README, not a choice of a Lean carrier absent from the pins.

**Checks.**

- O(−1) on P¹ has a difference presentation, although it has no everywhere-generating family of its own global sections.
- Replacing (X,Y) by (X,Y,X+Y) changes the archimedean maximum by at most a factor two and changes no nonarchimedean maximum.
- Scaling every generator by 2 gives the local log-ratio log|2|_v; it can be nonzero at 2 and infinity, and its weighted global sum is zero.
- The family (X²,XY) on P¹ has a common zero and is excluded; allowing it would make the ratio unbounded or undefined.

*Needs:* §0.11; SchemeAndStackFoundations SF.4 `ample-serre-vanishing`, projective closed images and the homogeneous Nullstellensatz; geometric base change of invertible sheaves. For generalized global fields replace finite support by the integrable coefficient majorants in §0.9; the same finite identities provide those majorants.

### 0.16 Heights along morphisms to projective space

Prove `TauCeti.normalizedHeight_comp_forms`. Let K be a generalized global field, X a projective K-variety and φ : X → ℙⁿ, ψ : X → ℙᵐ morphisms with φ*O(1) ≅ ψ*O(1). Then h_{K,n}∘φ − h_{K,m}∘ψ is bounded on X(K̄). If f : ℙⁿ → ℙᵐ is a morphism given by forms of degree d without common zero, h_{K,m}∘f = d·h_{K,n} + O(1).

X projective over K; φ and ψ morphisms over K; the isomorphism of line bundles is over K.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, functoriality bullet (proved by the Nullstellensatz over K̄), author copy p. 31; [Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, Steps 1–7, pp. 7–9.)

Both maps are given by bases of subspaces of H⁰(X, L) for L = φ*O(1) generating L; by §0.15 (Linear changes of coordinates change heights boundedly) reduce to φ and ψ given by two generating families of sections of the same L.

Upper bounds: each section of one family is a linear combination of products with the other on an affine cover; Mathlib's Height.logHeight_eval_le gives h∘φ ≤ h∘ψ + C.

Lower bounds: the Nullstellensatz on X writes powers of the sections of one family as combinations of the other (Mathlib Height.logHeight_eval_ge in the case of ℙⁿ), giving the reverse inequality.

**Checks.**

- The Veronese map ℙ¹ → ℙ², [x:y] ↦ [x²:xy:y²], has h∘v = 2h exactly.

*Needs:* §0.11 (The normalised projective height); §0.15 (Linear changes of coordinates change heights boundedly); Mathlib `Height.logHeight_eval_le`; Mathlib `Height.logHeight_eval_ge`; SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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

*Needs:* §0.11 (The normalised projective height); §0.16 (Heights along morphisms to projective space); §0.12 (Heights under finite extension of the base field); §0.2 (Heights modulo bounded functions); §0.4 (Pullback of height classes); Mathlib `Height.logHeight_fun_mul_eq`; SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness, with the presentation and Lefschetz contracts above; SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts.


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

*Needs:* §0.11 (The normalised projective height); §0.12 (Heights under finite extension of the base field); §0.16 (Heights along morphisms to projective space); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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


### 0.29a Generically trivial bundles on an abelian scheme

Prove `AbelianScheme.genericTrivial_pullback`. Let π:A→S be an abelian scheme over a normal integral locally noetherian scheme, with zero section e and generic point η. If L|A_η is trivial, then L≅π*(e*L). After rigidifying L along e this is the unique isomorphism with the trivial rigidified bundle, and it commutes with base change for which the stated hypotheses hold.

Use AlgebraicModuliForArithmeticGeometry §7.2 `universal_functions`, §7.3 `relative_picard_algebraicSpace` and `relative_picard_separated`, and §§7.6.1–7.6.1a `relativePicardKernel` and `sectionPicardSplit`. The hypotheses hold because π is proper, smooth with geometrically integral connected fibres and has e. The section of the separated relative Picard space represented by L agrees with zero at η. Its equalizer with zero is closed and contains the generic point, hence is all of the reduced integral S. Exactness of `relativePicardKernel` now gives L≅π*M; pulling back by e identifies M with e*L. Universal functions makes an isomorphism preserving the rigidification unique. This argument uses the existing Picard space and its separatedness, rather than assuming that generic triviality implies fibrewise triviality by seesaw.

The original geometric locator is EGA IV₄, additions to §21, Proposition 21.4.13, pp.360–361, with the flatness/normal-base hypotheses in 21.4.9–21.4.11, pp.358–360. The application is Dimitrov–Gao–Habegger, [Uniformity in Mordell–Lang for curves](https://arxiv.org/abs/2001.10276v3), Remark 3.2, p.14, and Appendix A, pp.36–40. The proof here is the abelian-scheme specialization through the lower Picard interface; it makes no assertion for arbitrary proper morphisms.

**Checks.**

- For L=π*M the conclusion recovers M by e*, including nontrivial M on S.
- A nontrivial degree-zero bundle on a constant elliptic curve over S is excluded if its generic restriction is nontrivial.
- Without rigidification, scalar automorphisms remain; the uniqueness assertion is for rigidified isomorphisms.

*Needs:* the four precise AlgebraicModuliForArithmeticGeometry interfaces above; AbelianSchemesAndArithmeticModuli A1.1 and A1.4. No arithmetic height-kernel theorem is used.

### 0.30 The fibrewise Néron–Tate height depends only on the generic fibre

Prove `TauCeti.AbelianScheme.fibreNeronTate_indep`. Let π : 𝒜 → S be an abelian scheme over a normal integral locally noetherian base and L, L' line bundles on 𝒜 whose restrictions to the generic fibre are both isomorphic to L₀^{⊗l}. Then L' ⊗ L^{-1} is the pullback of a line bundle on S, so L|_{𝒜_s} ≅ L'|_{𝒜_s} for every s and the fibrewise Néron–Tate heights agree; ĥ_{𝒜,L₀} depends only on L₀.

S normal integral locally noetherian; l ≥ 1. Use §0.29a for generic-trivial descent of invertible sheaves on the abelian scheme (DGH Remark 3.2 and Appendix A, invoking EGA IV₄ 21.4.13).

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

*Needs:* §0.10 (Polarized function fields as generalized global fields); §0.21 (The Néron–Tate canonical height); §0.20 (Tate's limit); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.21 (The Néron–Tate canonical height); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


### 0.35 Function-field heights under finite and constant field extensions

Prove `TauCeti.canonicalSubvarietyHeight_baseChange`. Let K = k(S) with S a smooth projective curve over algebraically closed k, and K'/K finite with S' the normalisation of S in K'. Recomputing heights with the model S' gives ĥ_{S'}(x) = [K':K]·ĥ_S(x), and the same scaling for subvarieties with pulled-back line bundles; the degree includes the inseparable degree. Under an extension l/k of algebraically closed fields, intersection numbers of base-changed proper schemes and canonical heights of geometrically integral subvarieties are unchanged. Consequently density of small points is invariant under finite extension of K and extension of algebraically closed constants.

S a smooth projective curve; k algebraically closed; k ⊆ l algebraically closed.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), (1.1)–(1.3), pp. 2–3; pp. 17–18, 22–25; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Lemma 8.6, and §9, Remark 9.2.)

Points: projection formula for S' → S and [K'(x):K] = [K'(x):K'][K':K] (Conrad Lemma 8.6 and Remark 9.2).

Subvarieties: projection formula for intersection numbers under finite maps (Layer 5).

Constant extension: intersection numbers are invariant under flat base change of the ground field.

**Checks.**

- Distinguish: enlarging only the field of definition of x inside one normalised height does not change ĥ; recomputing with S' multiplies by [K':K].

*Needs:* §0.33 (Heights of subvarieties over polarized function fields); §0.10 (Polarized function fields as generalized global fields); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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

Mathlib's native bounded submodule and quotient APIs, admissible absolute values, scalar/tuple heights, Northcott and polynomial height inequalities; DiophantineApproximationAndTranscendence §§0.2–0.3; SchemeAndStackFoundations §§0.8–0.9, 3.4, 5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2; AbelianSchemesAndArithmeticModuli §§A1.4–A1.5 and A2.2–A2.8. The family, metric and cycle branches use their additional contracts stated above.



## Layer 1: Kummer descent, Mordell–Weil and the trace

The Kummer map uses the finite-flat kernel of an isogeny and its fibre torsors. Its local images are unramified away from bad reduction and kernel primes. Finiteness of the corresponding Selmer group yields weak Mordell–Weil; the independent height descent yields finite generation. The trace removes constant points in the function-field statements. Two-coverings retain their maps to a fixed torsor, so they are distinguished from their finite fibres and from unmarked four-coverings.


### 1.0 Quotients by abelian subvarieties

For an abelian variety A over any field k and an abelian subvariety B⊆A, define A/B with a faithfully flat quotient homomorphism q:A→A/B, kernel B, and the invariant-map universal property. The target is an abelian variety, including for positive-dimensional B. The abelian-subvariety carrier and Poincaré complements are imported from AbelianSchemesAndArithmeticModuli A6.3–A6.5.

Construct the quotient from the existing finite-subgroup theorem. Choose a Poincaré complement C by AbelianSchemesAndArithmeticModuli A6.5, so addition B×C→A is an isogeny and D=B∩C is a finite locally free subgroup. Put Q=C/D using A3.3. The map B×C→Q, (b,c)↦[c], is invariant on the kernel pair of addition: its two lifts differ by (d,−d) with d∈D. Fpqc descent of morphisms gives q:A→Q. Checking after the faithfully flat cover B×C→A proves ker(q)=B scheme-theoretically and A×B≅A×_Q A. Consequently q is a B-torsor; it is smooth and proper by descent. Q is already an abelian scheme over k by A3.3. This proves scheme representability without a new theorem about arbitrary G/H.

The same torsor identity descends every B-invariant morphism A→Y uniquely to Q for every k-scheme Y. It proves independence of C and arbitrary field-base-change compatibility, although the chosen complement itself need not be canonical. In particular q⁻¹(q(a)) is the translate a+B with its scheme structure. Conrad Theorem 3.7, p.6, gives the general quotient statement; the argument above derives the specialization from the lower finite-quotient and complement interfaces actually used here.

The API consists of the following operations and laws.

- `TauCeti.AbelianVariety.quotient`: A ⧸ B as an abelian variety with the projection A → A/B.
- `TauCeti.AbelianVariety.quotient_ker`: The kernel of A → A/B is B.
- `TauCeti.AbelianVariety.quotient_torsor`: A×B≅A×_{A/B}A, with q faithfully flat, smooth and proper.
- `TauCeti.AbelianVariety.quotient_desc`: A B-invariant morphism to a k-scheme descends uniquely; this characterizes the quotient.
- `TauCeti.AbelianVariety.quotient_baseChange`: The canonical quotient isomorphism after field extension respects q and the torsor identity.

**Checks.**

- B=0 gives q=id_A and B=A gives the zero abelian variety.
- For B the diagonal of E×E, q is identified with (P,Q)↦P−Q; the kernel identity is scheme-theoretic.
- For a complement C with nontrivial finite intersection D=B∩C, the target is C/D, not C with its unmodified projection; changing the complement gives a canonically isomorphic quotient.

*Needs:* AbelianSchemesAndArithmeticModuli A3.3 and A6.5; SchemeAndStackFoundations SF.1 fpqc descent of morphisms and torsors. Source: Conrad, [K/k-trace](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), Theorem 3.7, p.6, specialized by the finite-quotient construction above.

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

*Needs:* AbelianSchemesAndArithmeticModuli §A3.1, isogenies and finite-flat kernels; AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4).


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
- `TauCeti.AbelianVariety.trace_constantExtension`: For regular K/k, Tr commutes with every extension E/k, with compositum taken in the regular base-change function field (Theorem 6.8, p.22). For merely primary K/k retain the separability hypothesis on E/k.
- `TauCeti.AbelianVariety.trace_tower`: Tr_{E/k}(Tr_{K/E}(A)) is the K/k-trace if K/E and E/k are primary (Theorem 6.4(2), p.21).
- `TauCeti.AbelianVariety.trace_diagonal_closedImmersion`: If K=k(V) with V smooth and A spread to an abelian scheme over V, then for m>dim A the product of its m pulled-back trace maps is a closed immersion over a dense open of V^m (Theorem 6.10, p.22). This is stronger than a finite-kernel assertion: dualize the product-image construction in the proof of Chow regularity, retaining its connected-kernel conclusion, rather than dualizing only the weaker surjectivity statement (Remark 6.11).

**Checks.**

- `trace.test_constant`: For A = E₀ ⊗ K with E₀ an elliptic curve over k, Tr = E₀.
- `trace.test_zero`: Tr_{K/k}(0) = 0.
- `trace.test_nonisotrivial_elliptic`: For E/ℂ(t) with nonconstant j-invariant, Tr_{K/k}(E) = 0.
- `trace.test_isotrivial_nonconstant`: The quadratic twist of a constant elliptic curve E₀ ⊗ K by t ∈ K^× with K(√t)/K not obtained from an extension of constants has trace 0, although it becomes constant over K(√t) (the example of Conrad Remark 4.6).
- For A = A₀ ⊗_k K constant, Tr_{K/k}(A) = A₀ and τ = id.

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5, abelian images and Poincaré complements; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`.


### 1.9a Finite torsion local-system cohomology on a curve

Prove `Curve.finite_etaleH1_primeToChar`. Let k be algebraically closed, U a smooth connected k-curve, and F a finite locally constant sheaf of abelian groups on U_ét killed by m>0 invertible in k. Then H¹_ét(U,F) is finite. U need not be proper.

Trivialize F on a connected finite étale Galois cover V→U; the finite monodromy representation gives such a cover by its kernel. On V, split the finite abelian group into cyclic factors Z/d with d|m and identify these with μ_d after choosing roots of unity in k. SchemeAndStackFoundations SF.2 `curve-roots-of-unity-cohomology` (T278, Stacks Lemmas 59.69.1–59.69.3) makes H¹(V,F) finite for both proper and affine V. Its `hochschild-serre-galois-covering` (T275) gives the low-degree sequence from H¹(G,H⁰(V,F)) to H¹(U,F) to H¹(V,F)^G. The first group is finite because G and its coefficient group are finite; the last is finite by the curve calculation. This proves the claim without planning arbitrary-dimensional étale finiteness or using the later height-kernel theorem. The application is Conrad, *K/k-trace*, §7, equation (7.2), pp.24–25; this argument supplies its needed finite-sheaf instance from the lower curve suppliers.

**Checks.**

- For P¹ and constant Z/m, H¹ is zero.
- For 𝔾_m and constant Z/m, H¹≅Z/m, so affine H¹ is not replaced by zero.
- The prime-to-characteristic hypothesis is essential: H¹_ét(𝔸¹_k,Z/p) is infinite in characteristic p, by Artin–Schreier classes.

*Needs:* SchemeAndStackFoundations T275 and T278, finite étale covers and finite monodromy; §1.1 for its Kummer application.

### 1.9b Bounded sections modulo constant trace

Prove `AbelianVariety.boundedHeight_finite_modTrace` first for K=k(C), with k algebraically closed and C smooth projective connected. For any projective embedding A↪P^n_K and any real M, the image of `{P∈A(K):h(P)≤M}` in A(K)/τ(Tr_{K/k}(A)(k)) is finite. No positive definiteness is assumed.

Choose C↪P^s_k of degree d and the projective closure 𝒜⊂P^n_k×C. Properness extends each P to a section C→𝒜. Under the Segre embedding its graph is isomorphic to C and has degree at most h(P)+d: multiply the homogeneous coordinate tuples, sum maximal pole orders, and use the product formula to identify the second contribution with d (Conrad Lemma 7.5, p.25). Consequently the graphs with h≤M have one of finitely many Hilbert polynomials δt+1−g(C). The Hilbert scheme for each fixed polynomial is finite type. The open graph locus where projection to C is an isomorphism is the Hom scheme, and the equation of being a section cuts out the required finite-type locus. These are precisely SchemeAndStackFoundations SF.4 `hilbert-scheme` and AlgebraicModuliForArithmeticGeometry §2 `hom-isom-schemes`; arbitrary proper morphisms are not substituted for their projective hypotheses.

Prove `AbelianVariety.curveFamily_constant_modTrace`: an algebraic family of these sections parameterized by an integral k-curve D has constant image in the quotient. Normalize and complete D, extend its generic-fibre map to A by properness, and subtract its value at a k-point d₀. The pointed map factors through J_D⊗K by JacobianChallenge Layer F. The trace universal property factors that homomorphism through Tr(A) over k, so values at k-points differ by τ(Tr(A)(k)). Any two points of an irreducible parameter component can be joined by an integral curve. Thus each component contributes one class, and the finite-type parameter spaces have finitely many components. Conrad §7, pp.25–26 gives the graph/Albanese proof and the curve-joining input. The required curve-joining theorem is `Variety.integralCurve_through_finite`: in a positive-dimensional integral quasi-projective variety over an algebraically closed field, any finite set of closed points lies on an integral curve. Embed in a projective closure and take a sufficiently high power of the embedding bundle tensored with the ideal of the chosen points. Its linear system has just that finite base locus. In dimension at least two, it separates points outside the base and has three sections meeting the hypotheses of [Stacks Lemma 37.32.3, tag 0G4C](https://stacks.math.columbia.edu/tag/0G4C): choose two sections meeting in codimension two through an auxiliary smooth point, and a third nonzero there. A general member is geometrically integral and contains the chosen points. Iterate and intersect with the original open. The key geometric irreducibility input is proved there by the generic-hyperplane function-field argument, Lemmas 37.32.1–37.32.2; smooth hyperplane sections alone would not suffice. Normalization lifts the selected points since k is algebraically closed. Checks: in dimension one use the variety itself; a curve joining two boundary-special parameter points must include both; over a nonalgebraically closed field the stated rational-point and irreducibility argument is not asserted.

**Checks.**

- For a constant A=A₀⊗K, constant sections can form a positive-dimensional family of bounded height; they give one quotient class, not finitely many sections.
- If the trace is zero, the theorem gives actual finiteness of bounded-height K-points without number-field Northcott.
- A graph has the fixed genus of C; bounded degree alone, without its fixed Hilbert polynomial or a Hilbert boundedness theorem, is not the asserted parameter space.

*Needs:* §§0.10–0.11 and 1.9; the two precise Hilbert/graph suppliers; JacobianChallenge Layer F; normalization and completion of curves; the curve-joining theorem above, with its generic-hyperplane irreducibility input.

### 1.9c Constant extension and transcendence-degree reduction

Prove `AbelianVariety.modTrace_constantExtension_injective`: for regular finitely generated K/k and every extension k′/k, the map from A(K)/τ(Tr(A)(k)) to A(k′K)/τ′(Tr(A_{k′K})(k′)) is injective. Base change of the trace identifies the two trace varieties. To descend a k′-trace point mapping to A(K), use §1.9's product trace closed immersion over the fraction field F_m of K^{⊗_k m}. Its image in each of the m factors is defined over F_m, so fpqc descent through the closed immersion makes the trace point F_m-rational. Regularity gives F_m∩k′=k, hence k-rationality. Retain the closed immersion, including nilpotents; mere injectivity on geometric points would not prove descent. This is Conrad Lemma 7.3 and its proof, pp.23–24.

Prove `AbelianVariety.modTrace_tower_fg`: for K/E/k with K/E and E/k regular finitely generated, finite generation for K/E and E/k implies it for K/k. Use the trace tower isomorphism of §1.9 and the subgroup/quotient exact sequence, not a finite-index assertion (Conrad Lemma 7.4, p.24). After adjoining an algebraic closure of k, choose a separating transcendence basis: for K/k of positive transcendence degree d, its finite separable presentation over k(t₁,…,t_d) makes it regular of transcendence degree one over the relative algebraic closure of k(t₁,…,t_{d−1}) in K. That intermediate field has transcendence degree d−1 and is regular over algebraically closed k. Induction and the tower statement reduce to the curve case. This avoids any assumption of Northcott over the constants.

**Checks.** For a constant abelian variety over k(t), passing to larger constants does not create a nonzero quotient class from a constant point. Injectivity concerns the quotients by their respective traces; it does not assert invariance of the full rational-point group. The regular-extension hypothesis excludes replacing a purely inseparable constant extension by an application of the regular trace theorem.

*Needs:* §1.9, finite separable function-field presentations, fpqc descent of morphisms, and finite generation of subgroups and extensions of abelian groups.

### 1.10 The Lang–Néron theorem

Prove `TauCeti.AbelianVariety.fg_points_mod_trace`. Let K/k be a finitely generated regular extension and A an abelian variety over K. Then A(K)/τ(Tr_{K/k}(A)(k)) is a finitely generated abelian group. In particular, if Tr_{K/k}(A) = 0 then A(K) is finitely generated.

K/k finitely generated and regular.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §7, Theorem 7.1 with Lemmas 7.3–7.5, author copy pp. 23–27; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 3.1, p. 14, and Proposition B.1, p. 58.)

Use §1.9c to reduce to K=k(C) with algebraically closed k. Spread A to an abelian scheme over a nonempty open U⊂C and choose m≥2 prime to char(k). Properness gives A(K)=𝒜(U); the Kummer injection and §1.9a make A(K)/mA(K) finite. The constant trace points form a divisible subgroup, so the corresponding quotient modulo m is finite as well. The canonical quadratic height of §0.21 differs boundedly from the chosen ample height. Trace translation changes that canonical height by zero: the trace height is bounded on constant points, hence zero by the Tate limit, and polarization/Cauchy–Schwarz for a nonnegative quadratic form kills its cross term. Nonnegativity follows from the ample lower bound and scaling, not from §1.11. Thus the height descends to the quotient. Section 1.9b makes each bounded-height set in that quotient finite. Apply the usual finite-coset descent using m²-growth and the quadratic triangle bound. This proves finite generation before the height-kernel theorem.

Do not use Theorem 9.15 in this proof: its positive-definiteness argument subsequently uses Lang–Néron.

**Checks.**

- For E/ℂ(t) with nonconstant j-invariant, E(ℂ(t)) is finitely generated.

*Needs:* §§1.9–1.9c; §0.10 (Polarized function fields as generalized global fields); §0.21 (The Néron–Tate canonical height); Mathlib `CommGroup.fg_of_descent'`.


### 1.10a Higher-dimensional bounded graphs

Prove `AbelianVariety.boundedHeight_finite_modTrace_polarized` for a finitely generated regular K/k of positive transcendence degree δ, with the generalized-global-field structure of a normal projective model V/k and ample polarization N. For an embedding A↪P^n_K and every real M, bounded-height A(K) has finite image modulo τ(Tr(A)(k)). This is Conrad Theorem 10.2, pp.37–40; it extends §1.9b without assuming a curve model or Northcott over k.

The key estimate is `Projective.genericGraph_degree_le`: after replacing N by a very ample power and writing d=deg_N(V), the closure W_P of the graph of P in the Segre embedding P^n×V has dimension δ and degree at most (h(P)+d)^δ. Prove the needed generically birational case of Conrad Lemma 10.3, pp.38–39. The coordinate tuple of the rational graph map has height at most h(P)+d by maximal pole orders. Choose δ general target hyperplanes whose intersection with W_P consists of deg(W_P) distinct geometric points in the isomorphism locus W_P→V. Their inverse divisors on V have degree at most the coordinate height: normalize one coordinate to 1, bound the poles of each constant-coefficient linear combination by the maximum coordinate pole divisor, and use the product formula. SchemeAndStackFoundations SF.5 T436 bounds the degree of their intersection by the product of their degrees, hence bounds the selected points. Use its Bézout inequality, not an equality for divisors on an arbitrary embedded V. Only the equal-dimension graph case is needed here. Smooth general hyperplane intersections are SF.4 T395; the curve-joining irreducibility theorem is separate.

AlgebraicModuliForArithmeticGeometry §1.6 `boundedDegreeHilbertPolynomials` supplies finite-type flat parameter families for the reduced pure δ-dimensional W_P. Its general geometric-fibre version includes positive characteristic and does not add embedded nilpotent structures. Extend constants to an algebraic closure only after replacing heights by this degree bound; §1.9c preserves quotient classes under that extension. Join two parameters in one component by an integral curve D as in §1.9b and normalize D. The incidence family has generic fibre over V proper over D_K. It is an integral curve, and its map to the smooth D_K is finite flat: it is nonconstant because one graph fibre is nonempty, and its degree is one because that fibre is a K-point. Thus it is an isomorphism and gives a D_K-family of points of A. The Jacobian/trace argument of §1.9b makes the two classes equal. Finite many parameter components finish the proof.

The API consists of the graph-degree bound, finite parameter-family containment, and finite bounded-height image modulo trace. Checks: for δ=1 the degree estimate reduces to h(P)+d; changing N to N^m scales heights by m^(δ−1), rather than the number-field absolute-height rule; nilpotent thickenings of fixed degree support are excluded from boundedness. This theorem precedes positivity on the real quotient.

*Needs:* §§0.10, 0.35, 1.9b–1.9c; SchemeAndStackFoundations T395 and T436; AlgebraicModuliForArithmeticGeometry §1.6; generic flatness and normalization of curves.

### 1.11 Kernel of the Néron–Tate height over function fields

Prove `TauCeti.AbelianVariety.neronTateHeight_eq_zero_iff_trace`. Let K/k be finitely generated and regular of positive transcendence degree, with a polarization, and A/K an abelian variety with a symmetric ample line bundle L. On A(K̄), the kernel of ĥ_L is the image of the constant points of the geometric K̄/k̄-trace plus torsion. On A(K), the quadratic height induces a positive definite form on the real vector space obtained from A(K)/τ(Tr_{K/k}(A)(k)). Trivial original K/k-trace suffices for the torsion-kernel assertion on A(K). For all A(K̄) the torsion-kernel assertion requires trivial geometric trace; the original trace can become nonzero after a finite nonconstant extension.

K/k finitely generated regular, trdeg ≥ 1; L symmetric ample.

([Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Lemma 9.13, Theorem 9.15, Lemma 9.16, Corollary 9.17; §10, author copy pp. 35–41; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Lemma 5.3, p. 24; §5.3, p. 26; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), §1 p. 2; §2.1 p. 10.)

ĥ vanishes on the trace points (Conrad Lemma 9.13: heights of constant points are bounded).

For positive definiteness modulo trace use §1.10a and bounded difference between canonical and projective heights. Lang–Néron gives a finite-rank lattice modulo torsion. A nonnegative quadratic form with finitely many lattice points in each bounded sublevel is positive definite on its real span (the Minkowski lemma, Conrad Lemma 10.1, p.37). Indeed a nonzero null direction in a semidefinite form yields arbitrarily many lattice points in a cylinder of bounded quadratic value, by lattice approximation; if the null space is rational its lattice multiples already contradict finiteness. Thus no irrational null direction can be ignored.

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

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §3.6, Picard torsors; AbelianSchemesAndArithmeticModuli §A3.2, prime-to-characteristic two-torsion.


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


### 1.15a Integral commutative formal groups and evaluation

For a complete discrete valuation ring O and g≥0, define `IntegralCommutativeFormalGroup O g` by g power series F_i in 2g variables over O, with F(X,0)=X, F(0,Y)=Y, linear part X+Y, associativity and commutativity as power-series identities. The formal inverse is uniquely constructed degree by degree, using the identity linear coefficient. For each r≥1, integral coefficients and completeness allow evaluation on (𝔪^r)^g; terms of degree n have valuation at least nr. Evaluation respects the identities and defines a commutative group there. This uses native `MvPowerSeries`; Mathlib's one-dimensional `FormalGroup` is a specialization, not a carrier for arbitrary g.

The API is `IntegralCommutativeFormalGroup.eval`, `eval_zero`, `eval_assoc`, `eval_comm`, `inverse`, `inverse_eval`, `restrictIdeal`, and `baseChange`. The ideal-restriction map is injective and respects the group operations; continuous local homomorphisms of complete DVRs commute with evaluation. The source application is Katz, Appendix to [Galois properties of torsion points](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Lemma′ and its proof, pp.501–502; the integral convergence argument is supplied here.

**Checks.**

- The additive law in any dimension evaluates to coordinatewise addition; at g=0 the group has one element.
- F(T,U)=T+U+TU has inverse −T/(1+T) and gives 1+𝔪^r by T↦1+T; using ordinary addition would fail this check.
- The three-variable upper-unitriangular matrix law is associative and integral but noncommutative, so it is excluded.
- Evaluation on O^g is not asserted: an integral infinite series need not converge at a unit.

*Needs:* native multivariate power series, complete DVR convergence and continuous evaluation on topologically nilpotent tuples.

### 1.15b Smooth identity charts and reduction kernels

Prove `SmoothGroup.formalIdentityChart`. Let O be a complete DVR, and G a smooth separated finite-type commutative O-group of relative dimension g, with identity e. A choice of étale coordinates at e on the special fibre, translated so that e has coordinate zero, identifies its completed identity neighbourhood with O[[T₁,…,T_g]] and gives the law of §1.15a. For every r≥1 there is a topological group isomorphism
`ker(G(O)→G(O/𝔪^r)) ≃ IntegralCommutativeFormalGroup.points (𝔪^r)^g`.
It respects inclusions of deep ideals, local base change and morphisms of smooth group models (the latter by their induced formal power series). It depends on the coordinates, with transitions given by integral series having invertible linear term.

For the proof use SchemeAndStackFoundations SF.0 `etale-coordinates` (T037, Stacks Lemma 29.37.21/tag 054L), SF.4 `formally-smooth-morphism` (T365, specifically the formally étale uniqueness clause), and `formal-completion` (T378). Subtract the coordinates of e, and complete along its closed special-fibre point. Formal étaleness identifies each successive Artinian neighbourhood with the corresponding neighbourhood in affine g-space. Compatible lifts over O/𝔪^n give an O-point: choose an affine neighbourhood of e, use finitely many generators and relations, and pass to their inverse limits in the complete O. Every point in the reduction kernel lies in this neighbourhood because its closed special-fibre point does. Completed multiplication and inversion induce integral series and the group identities. This proves the comparison at r=1 and restricts to every r≥1. Polynomial coordinate congruences make these kernels open in the local point topology supplied by ReductiveGroupsPartII RG2.0.1; completeness gives the claimed homeomorphism. If the residue field is finite, each kernel has finite index since G(O/𝔪^r) is finite. Finite index is not asserted over an infinite residue field.

Apply this with G the smooth finite-type Néron model of an abelian variety, even at bad reduction, using NeronModelsAndSemistableAbelianVarieties §1.1 to identify A(F)=G(O). This does not assume that the whole special fibre is an abelian variety. For good reduction the abelian scheme is the Néron model (§1.8); the relative Abel–Jacobi morphism commutes with special-fibre base change by JacobianChallenge Layer F, so divisor specialization agrees with point reduction. Mattuck, [Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf), Theorem 7 and proof, §§13–14, pp.114–118, supplies the classical analytic open-subgroup comparison; the smooth-model construction above provides the integral chart used here.

**Checks.**

- For G=𝔾_a^g the comparison is the identity on (𝔪^r)^g.
- For G=𝔾_m it identifies 1+𝔪^r with the multiplicative formal law T+U+TU.
- For a split multiplicative elliptic reduction, the identity chart still has dimension one; replacing the Néron model by a good-reduction abelian scheme is unavailable.
- The nonsmooth group μ_p over ℤ_p is excluded; smooth lifting cannot be used to identify its reduction kernel with a free one-dimensional ball.

*Needs:* §1.15a; the three stated SchemeAndStackFoundations targets; ReductiveGroupsPartII RG2.0.1; NeronModelsAndSemistableAbelianVarieties §§1.1,1.8 for the application. No logarithm is used to construct the chart.

### 1.16 Formal logarithms on a sufficiently small ideal

Prove `TauCeti.formalLogarithm_smallIdeal_equiv`. Let F/ℚ_p be finite, O its integers, 𝔪 its maximal ideal, and e=ord_F(p). For a g-dimensional commutative formal group law over O, represented by g native multivariate power series with zero constant term, linear term X+Y, associativity, identity and inverses, there is a unique formal logarithm log_FG over F with derivative the identity. For every integer r>e/(p−1), it converges on (𝔪^r)^g and gives an analytic group isomorphism FG((𝔪^r)^g)≃((𝔪^r)^g,+), with analytic inverse and the same tangent map. In particular the whole maximal-ideal group is torsion-free when e<p−1. This is a multivariate logarithm theorem extending native one-dimensional FormalGroup; native FormalGroup.Point is a power-series-valued point type and does not already give points in a complete local field.

The formal law has integral coefficients and is commutative; F has characteristic zero; use ord_F(π)=1 and r∈ℕ with r>e/(p−1). Section 1.15b supplies the formal law and the comparison with the kernel of reduction for a smooth group model. For an abelian variety without good reduction one still uses the smooth Néron model near the identity.

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

Let 𝒩 be the Néron model of A over O_F, so that A(F)=𝒩(O_F). For an integer r>e/(p−1) let U be the kernel of 𝒩(O_F)→𝒩(O_F/𝔪^r). Section 1.15b identifies U with the 𝔪^r-points of the g-dimensional formal group of 𝒩 along its identity section, and §1.16 (Formal logarithms on a sufficiently small ideal) identifies these with ((𝔪^r)^g,+)≅(O_F^g,+). U is open, and it has finite index because 𝒩(O_F/𝔪^r) is finite. Katz (Appendix, proof of Lemma′, p.502) uses the same identification of the reduction kernel with formal-group points at r=1. Mattuck §13, Theorem 7 and proof, pp.114–117, gives the classical analytic open subgroup; §14(2), p.118, gives uniqueness up to a linear coordinate change. The comparison with the smooth model is the theorem of §1.15b.

Let G=A(F), C=G/U. Since U is torsion-free, multiplication by two in 0→U→G→C→0 gives 0→G[2]→C[2]→U/2U→G/2G→C/2C→0. Both C groups are finite with equal order. Taking alternating cardinalities gives #G/2G=#G[2]·#U/2U, without assuming this group extension splits. For U≃O_F^g the last factor is q_F^(g ord_F(2))=|2|_F^(−g).

Over ℂ import complex-lattice-realization: A(ℂ)≃ℂ^g/Λ, where multiplication by two is surjective. Over ℝ take conjugation invariants in that uniformization. The identity component is a real g-torus; the component group embeds in H¹(⟨conjugation⟩,Λ), hence is killed by two. In 0→G⁰→G→π₀G→0, [2] is onto on G⁰ and G⁰[2] has order 2^g. The snake lemma gives G[2]↠π₀G and G/2G≃π₀G, proving the stated real count. No splitting hypothesis is needed.

**Checks.**

- For E/ℚ₂ with E(ℚ₂)[2] = ℤ/2 × ℤ/2, #E(ℚ₂)/2E(ℚ₂) = 8.
- If F/ℚ₂ is unramified quadratic and g=1 with all four two-torsion points rational, the quotient has order 4·4=16, not 8.
- At p odd the additive lattice contributes no two-quotient. For g=0 both sides equal 1.
- A real elliptic curve with one component has #E(ℝ)[2]=2 and quotient order 1; with two components these orders are 4 and 2. A complex abelian variety has quotient order 1.

*Needs:* §1.1 (Kummer maps of isogenies of abelian varieties); AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; §1.16 (Formal logarithms on a sufficiently small ideal); NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, together with §1.15b; AbelianSchemesAndArithmeticModuli §A5.1, complex lattice uniformization.


### 1.18 Reduction is injective on torsion

Prove `TauCeti.AbelianVariety.reduction_injective_torsion`. Let A be an abelian variety over a number field K with good reduction at a finite place v of residue characteristic p, absolute ramification index e_v, and 𝒜 the abelian scheme over O_v. The reduction map A(K_v)_tors → 𝒜(k_v) is injective on torsion of order prime to p, and on all torsion if e_v < p − 1. For the Jacobian J of a curve C over ℚ with good reduction at q, the reduction J(ℚ) → J̃(𝔽_q) is a homomorphism compatible with reduction of points and divisors, injective on torsion for q ≥ 3.

Good reduction at v; e_v < p − 1 for the p-part.

([Galois properties of torsion points on abelian varieties (Appendix by N. Katz)](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, Lemma and Lemma′, printed p.502; setup on p.501; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.13 proof, Step 2 (Lang and Hensel), p. 184.)

Properness identifies A(F) with 𝒜(O_F) at a good-reduction place. The smooth formal completion of 𝒜 at zero identifies ker(red) with its g-dimensional integral commutative formal law on 𝔪_F; use §1.15b for this comparison.

For n prime to p, [n](T)=nT+higher-degree terms on the formal completion. On 𝔪_F the linear term is a unit and the nonlinear terms strictly contract, so [n] is bijective there by successive approximation; in particular the kernel has no prime-to-p torsion. Étaleness alone is not asserted to make all global n-torsion trivial.

If e_v<p−1, §1.16 (Formal logarithms on a sufficiently small ideal) applies with r=1 and identifies the full reduction kernel with the torsion-free additive group 𝔪_F^g. This is precisely Katz Appendix Lemma′ and its logarithm/exponential proof on printed p.502. Consequently all torsion injects under the strict ramification bound.

Base change of the Jacobian and its Abel–Jacobi map to the good-reduction model gives compatibility with points and divisor classes; restrict the local statement to J(ℚ). At q≥3 one has e=1<q−1.

**Checks.**

- E : y² = x³ − x has good reduction at 3 and E(ℚ)_tors = ℤ/2 × ℤ/2 injects into Ẽ(𝔽₃), of order 4.
- On the multiplicative formal group over ℚ_p(ζ_p), e=p−1 and ζ_p−1 is nonzero p-torsion in the reduction kernel: the strict boundary cannot be weakened, nor can the restriction to prime-to-p torsion be dropped without a ramification hypothesis.
- For a dimension-zero abelian variety both torsion and reduction groups are trivial.

*Needs:* NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, Néron mapping property and good-reduction abelian scheme; AbelianSchemesAndArithmeticModuli §A3.2, multiplication maps and prime-to-characteristic torsion; §1.16 (Formal logarithms on a sufficiently small ideal); NeronModelsAndSemistableAbelianVarieties §§1.1 and 1.8, together with §1.15b; [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property).


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

Layer 0; §§1.9a–1.10a for trace-quotient boundedness and §§1.15a–1.15b for formal charts; AbelianSchemesAndArithmeticModuli §§A3.1–A3.2, A5.1 and A6.3–A6.7; SchemeAndStackFoundations §§1.13–1.17, 2.3 and 3.6; EllipticCurves Layers 6–7; ArithmeticGaloisDuality Layers R02.3–R02.4; NeronModelsAndSemistableAbelianVarieties §§1.1,1.8,5.1. Lang–Néron precedes the function-field height-kernel theorem; it uses the Hom/Albanese and smooth-curve cohomology contracts, not that later theorem. The general torsor finiteness adapters over global function fields belong to Layer 3.



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


### 2.3a Global-function-field models and the adelic direct limit

Extend the model construction to a global function field K with exact finite field of constants k. Its places, completions and valuation integers are supplied by ArithmeticGaloisDuality R02.3.2, *Function-field places, ideles and S-units*, using Tau Ceti's `Place`. For nonempty finite S put U=C∖S in the smooth projective k-curve with function field K and O_(K,S)=Γ(U,O_C). This ring is Dedekind with fraction field K and finite residue fields; affineness of U follows from an effective divisor supported on S and Riemann–Roch. For an affine K-algebra A, a model is a finitely generated O_(K,S)-subalgebra spanning A over K. Denominators give existence and equality of any two models after enlarging S, exactly as in §2.3. The finite S is essential: global regular functions on C itself are k, which does not span an arbitrary K-algebra in this sense.

Use the existing completion construction, rather than a second local-field carrier. At the Tau Ceti pin, `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` in `RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean` applies to any Dedekind domain with finite residue fields. Its `residueFieldEquivAdicCompletion` identifies the residue field, and `integer_eq_adicCompletionIntegers` identifies its integers. In particular O_v is compact open and K_v locally compact. Apply Mathlib's restricted-product topology to define the additive adele ring over all places. One can equivalently take the finite adele ring of O_(K,S) and the finitely many omitted completion factors. The current Tau Ceti `IsDedekindDomain.FiniteAdeleRing.instLocallyCompactSpace` already supplies local compactness for the finite factor; this declaration is newer than the representative Lean pin. The restricted-product carrier and its topology already exist at that pin, and no new local-compactness theory is required.

Own `globalFieldModel_productLocalPoints`. For a finite-type separated O_(K,S)-scheme 𝒳, evaluation identifies

`𝒳((∏_(v∈T)K_v)×∏_(v∉T)O_v) ≃ (∏_(v∈T)X(K_v))×∏_(v∉T)𝒳(O_v)`

for finite T containing S. Here the coefficient ring has its O_(K,S)-structure; it need not be noetherian. For a quasi-compact scheme and local coefficient rings R_i, choose a finite affine cover and assign each map Spec R_i→𝒳 to a chart containing its closed-point image. Partition the indices into finitely many pieces; the corresponding idempotents split Spec(∏R_i) into finitely many open-and-closed subschemes, on each of which the maps assemble by the affine product universal property. For injectivity, the diagonal of a quasi-separated scheme is quasi-compact. A quasi-compact locally closed subscheme of Spec(∏R_i) containing every Spec R_i scheme-theoretically is the whole scheme: reduce first to an open complement defined by finitely many equations, whose ideal is the unit ideal if its projection is so in every R_i, then to a closed ideal projecting to zero in every factor. This proves equality of maps. The individual factor spectra do not constitute an open cover of the product spectrum.

Own `globalFieldModel_adelicHomeomorph`. Spread X and its morphisms to such models using SchemeAndStackFoundations §§0.8–0.9. Finite presentation identifies X(𝔸_K) with the filtered union of these stages: the coefficient rings have filtered union 𝔸_K, and maps and equality of maps descend at a finite stage. Give each stage the product topology above. Increasing T gives an open embedding: the finitely many new factors use the compact-open inclusion 𝒳(O_v)→X(K_v), proved on integral affine charts with the imported ReductiveGroupsPartII point topology; separatedness gives injectivity. The resulting direct-limit topology is independent of the chosen model, locally compact and Hausdorff. It agrees with §2.4 on affine schemes. For proper X, spread properness and use the valuative criterion at every v outside S to obtain X(𝔸_K)=∏_v X(K_v), a compact space. This extends §2.11 and its functorial API to both kinds of global fields. It does not assert that rational points of a proper variety are discrete in that product.

APIs: `GlobalFunctionFieldIntegralModel`, `ofGenerators`, `eventually_model_eq`, `globalFieldModel_productLocalPoints`, `globalFieldModel_adelicHomeomorph`, `globalFieldAdelicPoints.map`, `globalFieldAdelicPoints.proper_homeomorph_pi`. The model definition has the spanning, localization and integral-generator APIs of §2.2. **Checks:** for K=F_q(t), S={∞}, the affine-line model gives F_q[[t]] at t=0; the models F_q[t][x] and F_q[t][x/t] differ at t=0 and agree away from it; P¹ has the full product of local projective lines; its points may use different affine charts at different places, so one cannot replace the product-spectrum argument by a union of affine adelic charts; G_m has the idele topology and its inclusion into the additive adeles need not be a topological embedding. *Needs:* §§2.2–2.4,2.11; ArithmeticGaloisDuality R02.3.2; TauCetiRoadmap.AlgebraicCurves Layers 3 and 5; SchemeAndStackFoundations spreading; ReductiveGroupsPartII RG2.0.1–RG2.0.3; the native completions and restricted products just named. Source: Conrad, [Weil and Grothendieck approaches to adelic points](https://math.stanford.edu/~conrad/papers/adelictop.pdf), Theorem 3.4, Remark 3.5, Theorem 3.6 and full proof, pp.5–9, Corollary 3.7, p.9, and Proposition 4.4 with proof, pp.10–11. The argument treats global fields uniformly; a number-field ring of integers is not substituted for O_(K,S).

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


### 2.6a Twisted modules and their untwisted endomorphisms

Let X be a noetherian scheme, n>0, and 𝒢→X a μ_n-banded fppf gerbe with class β; write α for its image in H²(X,𝔾_m). Define `TwistedModule(𝒢,i)` to be a quasi-coherent module on 𝒢 on which the band acts by the character ζ↦ζ^i, with i∈Z/n. Coherence and local freeness are tested on a flat presentation and descend. Import the gerbe and fixed-band cohomology classification from AlgebraicModuliForArithmeticGeometry Layer 4, and quasi-coherent flat descent from SchemeAndStackFoundations. This is a category of modules on that gerbe, not a new gerbe carrier. The fppf topology remains necessary when n is not invertible.

The API is `pullback`, `tensor` (weights add), `dual` (weight changes sign), `hom` (weight j−i), `weightZero_descent`, and `endomorphismAzumaya`: the endomorphisms of a weight-one vector bundle of everywhere positive rank descend to an Azumaya algebra of class α. Conversely a splitting gerbe of an Azumaya algebra has its tautological weight-one bundle. Thus α is Azumaya-representable iff such a bundle exists. Weight n is zero, which makes the tensor products used below ordinary bundles. A coherent twisted module on a quasi-compact open extends to a coherent twisted module on X; take a coherent subsheaf of its quasi-coherent direct image that contains finitely many generators of the original restriction. Finite locally free pushforward preserves positive-rank twisted bundles and proves representability descends along a finite locally free surjection. Sources: Lieblich, [*Twisted sheaves and the period-index problem*](https://arxiv.org/abs/math/0511244), §§3.1.1–3.1.3, Lemmas 3.1.1.5–3.1.1.9 and 3.1.3.1,3.1.3.5, pp.7–10; de Jong, [*A result of Gabber*](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf), §§2.3–2.15, pp.1–4.

**Checks.**

- On the neutral μ_n-gerbe, a weight-one line bundle has untwisted endomorphism algebra O_X, of Brauer class zero.
- A weight-one bundle need not descend to X; its endomorphisms do. On a nonneutral gerbe the existence of a weight-one line bundle would force the 𝔾_m class α to vanish.
- Weight-zero and weight-one are different for n>1; tensoring n weight-one factors has weight zero even in characteristic dividing n. Rank zero does not represent a Brauer class.

*Needs:* AlgebraicModuliForArithmeticGeometry Layer 4; SchemeAndStackFoundations torsors, Kummer on the fppf site, quasi-coherent descent and the existing Azumaya splitting-gerbe interface. No moduli stack of twisted sheaves is required.

### 2.6b Projective stabilization for affine Brauer comparison

Use `ProjectiveKZero(R)` as the specialization of Tau Ceti’s existing `SplitK0` to the essentially small additive category of finitely generated projective R-modules, for a commutative ring R. Import `SplitK0.of`, `of_biprod`, `exists_eq_sub` and `grothendieckAddGroupEquiv` from `CategoryTheory/GrothendieckGroup/Split.lean` at the pin. The current library’s `CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean` already supplies the tensor ring (`instCommRing`, `of_mul_of`, `one_def`, `mapRingHom`); this later addition is recorded as a current-library import, not a declaration available to the pinned Lean companion. The owned adapter equips the projective subcategory with its biproduct and symmetric monoidal structure and translates the existing universal property. Its API is `class`, `class_add`, `class_mul`, `baseChange`, `rank` with values in locally constant integer functions on Spec R, and `class_eq_iff_stable`: [P]=[Q] iff P⊕E≅Q⊕E for some finitely generated projective E. This small algebraic interface is sufficient; higher K-groups are not prerequisites. Checks: over a field it is Z with rank the identity; R^a⊕R^b has class a+b but tensor class ab; over a ring with two components rank is a pair, not one integer. The zero module has rank zero and cannot be used as a faithful tensor factor.

Prove the following stabilization targets. For noetherian R of finite dimension d, a projective module of constant rank>d has a free summand, and P⊕E≅Q⊕E with rank P>d implies P≅Q. The key proof for the first assertion chooses generators whose failure-to-span loci have increasing codimension and eliminates a generator while retaining those bounds. The second uses the same prime-avoidance argument to move a unimodular vector by transvections, then cancels one free summand at a time. This is Bass, [*K-theory and stable algebra*](https://www.numdam.org/item/PMIHES_1964__22__5_0.pdf), Theorems 8.2 and 9.1–9.3, pp.23–28; the rank bound is strict.

Prove `ProjectiveKZero.rankKernel_nil`: the kernel of rank is a nil ideal. Over a finite-dimensional noetherian ring use Bass's filtration by Euler classes of bounded projective complexes whose homology supports meet any prescribed closed subset in codimension at least i. Tensoring complexes adds codimensions by successively moving their supports; the filtration vanishes above d and its first term is the rank kernel. Hence its (d+1)st power vanishes (Propositions 15.1–15.4, pp.38–41). Over arbitrary R descend the finitely many idempotent matrices in one calculation to a finitely generated Z-algebra, prove nilpotence there, and extend scalars; a uniform exponent for all of R is not claimed.

Derive `faithfulProjective_tensorPower_free`: for P of everywhere positive constant rank and n>0, there are a projective Q of positive rank and nonzero finite free F₀,F₁ with P⊗Q^(⊗n)⊗F₀≅F₁. In K₀(R)⊗Q expand the inverse nth root of [P]/rank P as a finite binomial polynomial in its nilpotent rank-zero part. Clear denominators. A sufficiently large positive-rank class is represented by a projective module, using the free-summand theorem; equality of classes becomes an actual isomorphism by cancellation after further scaling. Also derive `tensorPowerFree_directSumFree`: if P^(⊗n) is finite free, some positive direct sum of P is finite free. Rational nilpotence makes [P] equal its rank after tensoring with Q; clear the resulting torsion, then cancel in the stable range. Do not infer the incorrect general identity n([P]−rank P)=0 merely from the nth tensor power. Sources: Bass Proposition 15.6 and §§16.1–16.3, pp.41–43; Lieblich Lemma 3.1.4.3 and Corollary 3.1.4.4, pp.12–13.

**Checks.**

- A nontrivial ideal class of a Dedekind domain has rank one but need not be free; stabilization and tensor inversion are qualified conclusions.
- The tangent projective module on the real algebraic two-sphere is stably free of rank two and not free; rank>d cannot be weakened to rank≥d in cancellation.
- A rank-zero factor has no rational inverse; the positive-rank hypothesis is indispensable.

*Needs:* native finite projective modules, idempotent-matrix presentations, Spec and noetherian dimension; coherent support, tensor complexes and prime avoidance from SchemeAndStackFoundations. The finite-support filtration, splitting and cancellation arguments are owned targets here.

### 2.6c Affine Gabber comparison

Prove `Brauer.affine_comparison`: for every commutative ring R, Azumaya Brauer classes on Spec R are precisely torsion classes in H²_ét(Spec R,𝔾_m), compatibly with base change. Lift an n-torsion class to a μ_n fppf gerbe and apply §2.6a.

The local splitting target is `localEtale_finiteFree_domination`: for a local ring A and a local étale A-algebra B, a finite free A-algebra C has a map B→C_m for every maximal m of C. Present B by a localized monic separable polynomial. Its universal splitting algebra is finite free; permutations of its roots act transitively on the closed fibre, so the one local map over the chosen root yields maps at all maximal ideals. Apply the gluing target below on the semilocal C to assemble its finitely many local twisted bundles, then push forward along Spec C→Spec A. Shrinking this finite-presentation construction gives Zariski-local twisted bundles on Spec R (Lieblich Lemmas 3.1.3.5–3.1.3.6, p.10).

The gluing target is `twistedBundle_affine_glue`. For a separated union of two affines U,V, if a μ_n-gerbe has positive-rank twisted bundles P,Q on them, it has a global one. Arrange equal ranks. Section 2.6b makes their nth tensor powers free after tensoring by ordinary bundles and taking direct sums. On U∩V, the ordinary bundles Q∨⊗Q and P⊗Q∨ have free nth powers; §2.6b makes positive direct sums of these bundles free. The tautological tensor isomorphism then identifies equal positive direct sums of P and Q on the intersection, and they glue. On one affine, the elements f for which a twisted bundle exists on D(f) form an ideal: multiplication is restriction, and addition reduces to this two-open gluing on D(f+g). Local existence means the ideal lies in no maximal ideal, hence contains 1. This proves the affine theorem (Lieblich Theorem 3.1.4.1, Corollary 3.1.4.2 and Proposition 3.1.4.5, pp.11–13).

The API consists of the comparison isomorphism, compatibility with pullback, the local finite-free domination theorem and the two-open gluing theorem. Checks: the theorem includes affine dimension greater than two; a torsion class is needed for the finite μ_n weight argument; the gluing theorem requires an affine intersection, which separation ensures for two affine opens. These are theorem interfaces; no new Azumaya group is constructed.

*Needs:* §§2.6a–2.6b; SchemeAndStackFoundations standard étale presentations and symmetric polynomial splitting algebras; existing Azumaya-to-cohomology injection.

### 2.6d Quasi-projective Brauer comparison over infinite fields

Prove `Brauer.quasiProjective_comparison`: if k is infinite and X is a quasi-projective finite-type k-scheme, then Br_Az(X)≃H²_ét(X,𝔾_m)_tors, naturally in pullback. No dimension restriction is made. Number fields, global function fields and algebraically closed fields all satisfy the field hypothesis. General ample schemes over arithmetic bases require the further Skolem argument of de Jong §3.22; that stronger version is not needed for these consumers.

The owned key target is `TwistedModule.improve_free_codimension`. Given a μ_n-gerbe, a finite set T of closed points, and coherent weight-one modules whose nonfree loci have codimension at least c and avoid T, construct one with nonfree locus of codimension at least c+1 and still avoiding T. Start with coherent extensions of affine twisted bundles (§2.6c) free near T and the generic points. Successively choose n+1 such modules F_i, free at selected closed points of the codimension-c components of the other nonfree loci. Equalize their generic ranks r by direct sums and increase r. Put G₁=⊕_i F_i^(⊕r^n), G₂=⊗_i F_i, both weight one. Their Hom module has weight zero and descends. A morphism G₁→G₂⊗L^N surjective on the common free locus has free kernel there; if its F_i summand is an isomorphism near each selected bad point of F_i, the kernel is the sum of the other free summands there. The unwanted rank locus on the common free locus has codimension nr^(n+1)+1, chosen greater than dim X. The Hom section with these properties exists by the following section-avoidance target.

Prove `Coherent.section_avoiding_cones_with_values`: let H be coherent on quasi-projective X/k, locally free on U, L ample, C⊂H|U a closed fibrewise cone of codimension>dim X, and fix realizable Hom values at finitely many closed points outside U. For N sufficiently large, a global section of H⊗L^N avoids C at every point of U and has the prescribed values. Extend to the projective closure, use Serre vanishing to lift the finite-point values, and take finitely many global generators of their vanishing ideal twist. The universal section over its finite-dimensional affine coefficient space has forbidden incidence of dimension smaller than that space. A k-point outside the closure of its image exists because k is infinite. At a selected bad point the tensor product of the other n factors is an ordinary bundle; trivialize it locally to make the required block map an identity, giving realizable Hom values without assuming Br of the residue field vanishes. This is the infinite-field form of de Jong §§3.9–3.22, pp.5–9; it uses ordinary coefficient-space dimension counting in place of arithmetic Skolem avoidance.

Iterate the codimension improvement past dim X. The final weight-one module is a vector bundle everywhere, and its endomorphisms give the desired class. The API includes the comparison, its pullback law, codimension improvement and section avoidance. Checks: affine X recovers §2.6c; singular X is allowed since coherent kernels are only asserted free on the verified loci; finite k is excluded from the coefficient-space rational-point argument, although the full Gabber theorem remains true there.

*Needs:* §§2.6a–2.6c; SchemeAndStackFoundations coherent extension, Serre vanishing, ample twists, determinantal rank loci and dimension of fibres. No arithmetic Riemann–Roch or moduli of twisted bundles is imported.

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


### 2.11a Local points of étale and smooth morphisms

Prove `LocalField.etale_points_localHomeomorph`: for a local field k and an étale morphism f:Y→X of finite-type k-schemes, f:Y(k)→X(k) is a local homeomorphism in the imported evaluation topology. X and Y need not be smooth. Prove also `LocalField.smooth_points_open`: a smooth f induces an open map. This is Poonen Proposition 3.5.73 and proof, pp.85–86, including its arbitrary-characteristic local-field hypothesis.

Reduce an étale map to a standard étale presentation A[t]/(p) localized where p′ is invertible. Lift p from a finitely generated k-algebra A to its ambient polynomial algebra; the original point map is a base change of this standard étale ambient map. The polynomial map (a,t)↦(a,p(a,t)) has invertible linear part D at the selected point. On a sufficiently small complete closed ball its finite higher-degree expansion has difference bound c times the displacement with ||D⁻¹||c<1. For nearby right-hand sides b, z↦z−D⁻¹(F(z)−b) preserves that ball and is contracting. Native Mathlib `ContractingWith.fixedPoint`, `fixedPoint_unique` and `fixedPoint_lipschitz_in_map` give a unique root depending continuously on b. Shrinking open balls gives the local inverse, and base change restricts it to X(k), even for singular X. This proof uses polynomial expansions and completeness, so also works for k=F_q((t)); a characteristic-zero analytic differentiability theorem is not substituted. Smooth morphisms factor locally through an étale map to X×A^r, whose projection on local points is open.

The API consists of the local homeomorphism, open image, local sections through a specified rational lift, and openness for smooth maps. Checks: squaring on G_m in characteristic different from two is locally invertible but need not be globally injective; Frobenius on A¹ in characteristic p is not an étale instance; a projection X×A¹→X is open even when X is singular. A finite étale scheme with no k-point does not supply a rational lift.

*Needs:* SchemeAndStackFoundations standard étale presentations and local factorization of smooth morphisms; ReductiveGroupsPartII §RG2.0.1; native complete finite-dimensional normed spaces, polynomial expansion and contraction fixed points.

### 2.12 Local constancy of Brauer evaluation

Prove `TauCeti.SchemeBrauer.eval_locallyConstant`. Let k be a local field and X a k-variety. For α ∈ Br X, the map X(k) → Br k, x ↦ α(x), is locally constant for the analytic topology on X(k). If k is nonarchimedean with ring of integers O, 𝒳 is a finite-type O-model and α extends to Br 𝒳, then x ↦ α(x) is constant on 𝒳(O) and equal to 0 when Br O = 0.

k a local field; X of finite type over k.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.4, Proposition 8.2.9 and proof, Remark 8.2.10, pp. 230–231.)

Subtract the constant class α(x), so the desired value at x is zero. The class is then zero over the henselization O^h_(X,x), by the existing henselian Brauer comparison. This local ring is the filtered colimit of pointed affine étale neighbourhoods (Y,y) with y∈Y(k) over x. An Azumaya representative and a Morita trivialization are finite-presentation data, hence their zero-class equality descends to one such neighbourhood. Its pullback class is zero on Y, and §2.11a makes the image of Y(k) an open neighbourhood of x in X(k). Functoriality makes evaluation zero there. Nearby points are lifted through this étale neighbourhood; they are not asserted to factor through one local henselian ring.

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


### 2.16a Supported cohomology for smooth characteristic-zero pairs

Own the smooth-pair purity needed below. For a smooth variety X over a characteristic-zero field k, a smooth closed subvariety i:Z→X of pure codimension c, and n≥1, define the supported complex by the fibre of `RΓ(X,μ_n)→RΓ(X\Z,μ_n)`. Construct the canonical purity identification
`RΓ_Z(X,μ_n)≃RΓ(Z,Z/n(1-c))[-2c]`.
The shift is cohomological: `H^j_Z(X,μ_n)=H^(j-2c)(Z,Z/n(1-c))`. This target has smooth finite-type pairs as hypotheses; it does not assert Gabber's theorem for arbitrary regular mixed-characteristic local rings. The supported functor and its closed–open exact sequence are constructed from the existing sheaf and derived categories, rather than identified with ordinary cohomology by definition. (Colliot-Thélène–Skorobogatov, *The Brauer–Grothendieck group*, §2.3.1, Theorem 2.3.1, and §2.3.2, pp.55–58, specialize to the smooth characteristic-zero case.)

Here is a construction from the existing finite-coefficient comparison. Descend the pair to a finitely generated characteristic-zero subfield and use separably closed extension invariance from CohomologicalPointCounting/EtaleBaseChange Layer 4 and its limit corollary. Over C compare the two terms in the supported fibre using ComplexComparison Layer 10. Use the tubular-neighbourhood theorem of TauCetiRoadmap.GeometricTopology Layer 1 for the analytic smooth inclusion, with its normal vector bundle and disc/sphere-bundle interfaces. The normal bundle has complex rank c and its real rank-2c orientation is canonical. Over a trivializing ball the relative disc/punctured-disc cohomology is concentrated in degree 2c with generator the oriented sphere boundary. Excision and Mayer–Vietoris glue these local generators and their cup-product maps. Transitions in GL_c(C) preserve the real orientation, so the resulting Thom isomorphism is independent of the charts. The generator for a divisor is normalized by the first Chern class of O(Z); iterating transverse divisor charts supplies the Tate twist and fixes its coefficient-change law. Carry the construction back through the canonical comparison and descend it: the Chern-class characterization, étale coordinates for the smooth pair, and local uniqueness make the maps Galois compatible. No analytic comparison for a general regular local ring is required.

Construct `SupportedCohomology.closedOpen`, `smoothPairPurity`, `smoothPairPurity.coefficientChange`, `smoothPairPurity.etalePullback` and `smoothPairPurity.divisorChern`. For a closed subset of codimension at least c, a finite stratification by smooth locally closed pieces and the localization triangle show `H^j_Z(X,μ_n)=0` for j<2c. Shrink off the singular locus before using the smooth-pair isomorphism; purity for an arbitrary singular Z is not an isomorphism with its ordinary cohomology.

**Checks.** For (A¹,{0}), supported μ_n-cohomology begins in degree two, with Z/n in that degree. For (A²,{0}), it begins in degree four: removing the origin preserves H², while over an algebraically closed field H³(A²\{0},μ_n) is nonzero for n>1. Codimension two does not preserve degree three in general. For two crossing coordinate divisors, stratification keeps the codimension-two intersection; treating their union as a smooth divisor is rejected. For n=1 all coefficient groups are zero.

*Needs:* SchemeAndStackFoundations §§2.2 and 2.11 for sheaf/derived cohomology and Kummer; CohomologicalPointCounting/EtaleBaseChange Layer 4 and ComplexComparison Layer 10; ComplexComparisonPartII §C5.4 for Chern normalization; TauCetiRoadmap.AlgebraicTopology Stages 2–3 and 6 for relative cohomology, excision, Mayer–Vietoris and orientations; TauCetiRoadmap.GeometricTopology Layer 1 for tubular neighbourhoods. The finite-coefficient Thom map and its comparison in this proof are part of this target; the tubular-neighbourhood theorem is imported.

### 2.16b Brauer residues and codimension-two removal

Prove `smoothBrauer_residueExact`: for X smooth integral over a characteristic-zero field and U⊆X dense open,
`0→Br(X)→Br(U)→⊕_(D⊆X\U) H¹(k(D),Q/Z)`
is exact at the first two nonzero groups. The sum is over boundary prime divisors and there is no assertion that every residue tuple occurs. For a codimension-at-least-two complement, restriction is an isomorphism. These are statements about the torsion cohomological Brauer group; §2.6d compares with Azumaya classes where an ample bundle exists.

For a smooth boundary divisor apply §2.16a and the Kummer exact sequence. On a regular X every line bundle on U extends by taking the closure of its Cartier divisor. Thus the Picard quotient does not obstruct lifting a Brauer class with zero residue. The support class of a divisor is its Chern class, and the Kummer/Picard diagram gives the residue into H¹(D,Z/n). This group injects into H¹(k(D),Z/n): a finite étale torsor on a normal connected scheme with a generic section has a section, by integral closure and separatedness. For codimension at least two the supported groups in degrees two and three vanish, giving the required Kummer lift and restriction isomorphism. Stratify an arbitrary boundary by successively removing its singular locus and higher-codimension components; apply the codimension-two result before the disjoint smooth divisors. Pass over all n. Generic injectivity follows by taking the limit over dense opens, since every Brauer class and its equality descend to a finite-presentation open. The resulting finite support comes from that same descent. (Colliot-Thélène–Skorobogatov, Theorems 3.7.1–3.7.2, Corollary 3.7.3 and the full proof, pp.93–95.)

Own also `brauerResidue_henselianFormula`. For a henselian DVR of residue characteristic prime to n and a lifted unramified character χ, the residue of `(χ,t)` is χ for a uniformizer t; more generally its value after restriction to a transverse local point is `ord(t(P))·χ(Frob)` under the chosen local-invariant normalization. Use the inertia exact sequence, Kummer for t, and the two-term tame-inertia cochain calculation. The residue kernel consists of classes extending over the DVR; the class minus `(χ,t)` therefore extends. A pullback with divisor multiplicity e multiplies the pulled-back character by e. Keep this convention throughout; the Gysin boundary differs by the sign of its chosen generator in some references. (Colliot-Thélène–Skorobogatov, §2.3.3–2.3.4, Lemmas 2.3.3–2.3.4 and proofs, pp.58–61, and Theorem 3.7.4, p.96.)

The API gives `brauer_restrict_injective`, `brauer_residue`, `brauer_residueExact`, `brauer_removeCodimensionTwo`, `brauerResidue_henselianFormula` and `brauerResidue_pullbackMultiplicity`. It retains the coefficient, uniformizer and local-invariant compatibility maps.

**Checks.** Removing the origin from A² does not change its Brauer group in characteristic zero. On G_m over Q, `(t,-1)` has nonzero boundary residues at zero and infinity and does not extend to P¹. Pulling it back by t=u² multiplies both residues by two and makes this quaternion class zero. Exactness does not imply arbitrary residue prescriptions can be realized.

*Needs:* §2.16a; SchemeAndStackFoundations Kummer, Cartier divisors on regular schemes, finite-presentation limits, henselian specialization and Hochschild–Serre; local tame inertia and Kummer from TauCetiRoadmap.ProfiniteCohomology; ClassFieldTheory Layer 5.


### 2.17 The unramified Brauer group

For a smooth geometrically integral variety V over a field k of characteristic 0, Br_nr(V) is the image of Br(V^c) → Br(V) for a smooth proper compactification V ⊆ V^c; it does not depend on V^c and equals the subgroup of Br V of classes unramified at every discrete valuation of k(V) trivial on k. Br_{1,nr}(V) = Br_nr(V) ∩ Br₁(V). For V proper, Br_nr(V) = Br V.

char k = 0 (resolution of singularities provides V^c; purity for the Brauer group gives the valuation description). The smooth-compactification proof is asserted here in characteristic zero. In positive characteristic, the all-valuations definition and appropriate purity statements require a separate proof and do not follow from resolution for curves.

([The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2, pp. 6–7; [Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Notations, p. 6; [Purity for the Brauer group](https://arxiv.org/abs/1711.06456v4), Theorem 1.2 (arXiv:1711.06456).)

Independence of V^c: two compactifications are dominated by a third and Br of smooth proper varieties is a birational invariant (purity; Česnavičius).

The valuative description: residues along divisors of V^c (Layer 2 Brauer of regular schemes injects into Br k(V)).

Use §§2.16a–2.16b for the smooth characteristic-zero residue theorem and §2.17a for all valuations and model independence. The latter uses the proper valuative criterion, rather than asserting that all valuations are divisors on one chosen compactification.

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

*Needs:* SchemeAndStackFoundations §2.22, SchemeBrauerGroup and brauer_field; SchemeAndStackFoundations §§2.3, 2.11, 2.15 and 2.22; §§2.6a–2.6d, 2.16a–2.16b and 2.17a; §2.16 (Constant and algebraic Brauer groups).


### 2.17a Proper models and all discrete valuations

Prove `properBrauer_intersectionValuations`: if X is smooth proper integral over a characteristic-zero field k with function field F, its Brauer image in Br(F) is the intersection of Br(R) over all DVRs R⊆F with fraction field F and containing k. Regular-DVR generic injectivity is the existing affine supplier. For any such R, properness extends Spec(F)→X uniquely to Spec(R)→X, so a class on X belongs to Br(R). Conversely the collection contains every codimension-one local ring of X, and §2.16b gives extension of any class in the intersection. This proof does not require every valuation to arise as a divisor on a fixed model. (Colliot-Thélène–Skorobogatov, Propositions 3.7.7–3.7.9 and proofs, p.97.)

Import `sncCompactification` from AlgebraicModuliForArithmeticGeometry §9.5: a smooth quasi-projective characteristic-zero U has a smooth projective compactification preserving U, with strict normal crossings boundary. For an arbitrary smooth separated finite-type U, import `nagataCompactification` from ComplexComparisonPartII §C4.3 and resolve its proper compactification while preserving its smooth open; projectivity is not asserted for U. The proper modification/resolution suppliers of §§9.1–9.5 give a smooth proper model of its function field, and the all-valuations intersection proves independence of that model even when no one projective chart contains all of U. Restrict its generic Brauer classes to U by §2.16b, since all codimension-one local rings of U are included among the valuations. This identifies the unramified subgroup and proves birational invariance without requiring a common resolution merely to compare groups.

The API comprises `properBrauer_intersectionValuations`, `unramifiedBrauer_modelIndependent`, `unramifiedBrauer_restrictToSmoothOpen` and `unramifiedBrauer_birational`, all compatible with constant classes and function-field isomorphisms over k.

**Checks.** P² and P¹×P¹ yield the same subgroup of Br(k(x,y)). A valuation centered in codimension two on P² still receives every class extending over P². A smooth nonproper affine model can have extra ramified Brauer classes and is not substituted for a proper model. A smooth nonquasi-projective U is not assigned an open projective embedding by `sncCompactification`.

*Needs:* §2.16b; AlgebraicModuliForArithmeticGeometry §§9.1–9.5, including `sncCompactification` in its stated quasi-projective scope; ComplexComparisonPartII §C4.3, `nagataCompactification`; SchemeAndStackFoundations proper valuative criterion and regular-DVR generic Brauer injectivity.


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


### 2.19a Finite-flat norms and Brauer reciprocity on a curve

Define `finiteFlatBrauerCorestriction f` for a finite locally free morphism f:Y→X of constant rank d as follows. The determinant norm on a locally free algebra gives the sheaf map `f_*G_m→G_m`. Finite étale-site direct image is exact: on a strict henselian local test it is the finite product of the stalks at its finitely many geometric points. Thus Leray identifies H²(Y,G_m) with H²(X,f_*G_m), and the norm gives corestriction on the torsion groups. In particular this construction permits ramification of f. Its composition with pullback is multiplication by d, and its base-change diagram commutes because the determinant norm commutes with base change. Over fields it agrees with the existing field corestriction by the same multiplicative transfer construction. (Colliot-Thélène–Skorobogatov, *The Brauer–Grothendieck group*, §3.8, Proposition 3.8.1 and proof, pp.98–99.)

Own the specialization formula needed here over characteristic-zero fields: for a finite algebra A=∏A_i over F, with residue fields F_i and lengths e_i, its corestriction is `Σ_i e_i cor_(F_i/F)` on residue Brauer classes. Filter each local algebra by its radical powers. Multiplication on each successive quotient has determinant the residue norm to the power of its F_i-dimension, so the norm on units is the product of these powers. Nilpotent invariance identifies Br(A_i) with Br(F_i): filter `1+rad(A_i)` by its powers, whose quotients are additive quasi-coherent modules with zero higher cohomology on this affine scheme; apply the long exact sequence. Equivalently in characteristic zero the finite logarithm identifies the nilpotent unit kernel with its additive ideal. Apply this identity to the finite pushforward and norm maps on sheaves, not only to an identity of element norms. The resulting degree-two map is the stated formula, including ramification lengths. (Colliot-Thélène–Skorobogatov, Lemma 3.8.5, p.101; this filtration supplies its nonreduced-algebra step in the characteristic-zero scope used here.)

Prove `properCurve_brauerPrincipalDivisor_zero`: for a normal proper integral curve C over a characteristic-zero field F, β∈Br(C), and g∈F(C)×,
`Σ_P ord_P(g)·cor_(F(P)/F)(β(P))=0` in Br(F).
A nonconstant g defines a finite flat map C→P¹; its zero and pole fibres have the ramification lengths in the preceding formula. Corestrict β along this map. The result belongs to Br(P¹)=Br(F), so its evaluations at 0 and infinity coincide. For this equality of Brauer groups, finite-coefficient comparison computes geometric H²(P¹,μ_n) as the Chern class of O(1); Kummer kills geometric Br. Hochschild–Serre and the descended O(1) identify the arithmetic group with Br(F), and the rational point makes the constant map injective. A constant g has zero divisor. Apply projection compatibility to normalizations of integral curves mapping properly to X to obtain the CH₀ pairing of §2.20. This is an equality of Brauer classes before taking any local invariant. (Colliot-Thélène–Skorobogatov, Lemma 5.3.1, Proposition 5.3.2 and proof, pp.136–137.)

The API comprises `finiteFlatBrauerCorestriction`, `.pullback_comp`, `.baseChange`, `.fieldAgreement`, `.specializationLengths`, `properCurve_brauerPrincipalDivisor_zero` and `zeroCycle_brauerProjection`. Corestriction is defined on classes on Y, not on arbitrary pointwise functions.

**Checks.** An identity map gives identity corestriction. The fibre algebra F[ε]/ε² gives twice its residue Brauer class; omitting length would fail. For C=P¹, a constant class on a principal divisor evaluates to its degree zero times that class. For a ramified map t=u², the fibre at zero has length two and must not be treated as a degree-one reduced point. A morphism of degree d gives `cor(f*α)=dα`, not α.

*Needs:* SchemeAndStackFoundations derived sheaf cohomology, finite direct image, quasi-coherent affine acyclicity, normalization and normal-curve finite flatness; §2.16 and its Kummer/Hochschild–Serre suppliers; CohomologicalPointCounting/ComplexComparison Layer 10; ClassFieldTheory corestriction; geometric zero-cycle pushforward from SchemeAndStackFoundations SF.5.


### 2.20 The Brauer–Manin pairing on zero-cycles

For a smooth proper variety X over a number field K and a closed point P of X_{K_v}, put α(P) = cor_{K_v(P)/K_v}(α restricted to P) ∈ Br K_v. Extending linearly gives ⟨,⟩ : Z₀(X_{𝔸}) × Br X → ℚ/ℤ, (Σ_v z_v, α) ↦ Σ_v inv_v α(z_v), on families of local zero-cycles (z_v)_v; it vanishes on principal divisors, on norms from ℂ at archimedean places, and on the diagonal image of global zero-cycles. For a rational point it is the ordinary pairing.

X smooth proper over a number field; zero-cycles of any degree.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §1, complex (1.1), pp.2–3, and Notations et terminologie, p.6.)

Corestriction is compatible with local invariants (inv_v ∘ cor = inv_w; ClassFieldTheory Layer 5).

Rational equivalence: Weil reciprocity for Brauer classes on curves through the norm; global cycles pair to 0 by the reciprocity law for each finite extension K(P)/K.

Section 2.19a supplies the required Brauer reciprocity on normal proper curves, including finite-flat norm specialization with ramification lengths. Its projection identity carries the result through a curve normalization to rational equivalence on X.

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

*Needs:* §2.13 (The Brauer–Manin pairing and set for varieties); SchemeAndStackFoundations §2.22, SchemeBrauerGroup.pullback and brauer_field; [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality); [TauCetiRoadmap.ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


### 2.20a Finite Brauer quotients for rationally connected varieties

Prove `rationallyConnected_brauerFinite`: for a smooth proper geometrically rationally connected variety X over a number field K, `Br(X)/Br₀(X)` is finite. Here rational connectedness means that two general geometric points lie on a rational curve; characteristic zero is essential in the proof. No bound or algorithm for this finite group is asserted.

First treat projective X over an algebraically closed characteristic-zero field, descending its finite-presentation data to a subfield embedded in C. Own the required very-free-curve adapter: a dominant family of rational curves through a fixed general point has, after shrinking its parameter space, a member f:P¹→X with `f*T_X=⊕O(a_i)` and every a_i≥1. Indeed the differential of the family supplies sections of `f*T_X(-1)` generating at a general point; characteristic-zero generic smoothness and the splitting of vector bundles on P¹ force each summand to have nonnegative degree after twisting. Conversely such a member has `H¹(P¹,f*T_X(-2))=0`, so its two-point evaluation map is smooth at f and dominant. Construct this deformation calculation on the lower supplier's Hom parameter scheme: local infinitesimal lifts of f differ by sections of f*T_X, their Čech discrepancies give H¹, and fixing two marked points twists by -2. The same calculation after moving one marked point shows that very free curves cover a dense open. This suffices here; no assertion that they cover every point is needed. (Debarre, *On rationality problems*, §2.2, Proposition 2.4 and the proof of Proposition 2.5, pp.5–6.)

A positive-degree exterior differential form, or any positive tensor power of it, pulls back to a sum of negative-degree bundles on every very free curve. Its restriction is zero and the dense covering forces the form to vanish. The geometric Hodge decomposition of ComplexComparisonPartII §C5.3 then gives `H^i(X,O_X)=0` for i>0 and χ(O_X)=1. A connected finite étale cover Y→X also has a lifted very free curve: finite étale covers of P¹ are trivial by Riemann–Hurwitz. Thus Y has the same vanishing and χ(O_Y)=1. SchemeAndStackFoundations T431, geometric Hirzebruch–Riemann–Roch, gives χ(O_Y)=deg(Y/X)χ(O_X), since T_Y is the pullback of T_X and pushforward multiplies the degree. Therefore deg(Y/X)=1, and the geometric étale fundamental group is trivial. In particular every n-torsion line bundle is trivial by Kummer and algebraically closed scalar divisibility.

For the finiteness calculation, construct the analytic exponential exact sequence using local holomorphic logarithms. Its cohomology and the vanishing of H¹(O) and H²(O) identify analytic Pic with H²(X(C),Z); coherent GAGA identifies this Pic with algebraic Pic. Compact finite CW type makes integral cohomology finitely generated. Compare étale Kummer with singular finite coefficients using the existing CohomologicalPointCounting/ComplexComparison Layer 10, retaining coefficient change and the Chern class. Universal coefficients then identify the geometric Brauer group with the torsion of H³(X(C),Z): the entire free H² lattice is already Pic, so there is no `(Q/Z)`-summand. This torsion group is finite, and Pic is a finitely generated free lattice. The Galois action on a finite set of Pic generators factors through a finite group G. Inflation–restriction gives `H¹(K,Pic)=H¹(G,Pic)`, since a continuous homomorphism from the remaining profinite group to a discrete free lattice has finite and hence zero image. The finite-group cochain calculation makes H¹ finitely generated and killed by |G|, hence finite. Hochschild–Serre places `Br₁/Br₀` inside this finite group and `Br/Br₁` inside the finite geometric Brauer group. (Colliot-Thélène–Skorobogatov, *Good reduction of the Brauer–Manin obstruction*, Lemmas 1.1–1.3 and proofs, pp.579–581.)

For proper X, take a projective Chow modification and characteristic-zero resolution from AlgebraicModuliForArithmeticGeometry §§9.1–9.5, preserving the common smooth dense open. Rational connectedness is retained there. The purity/birational comparison of §2.17a identifies the two Brauer groups and their constant images, reducing to the projective case. This last comparison is a prerequisite, not a consequence of the desired finiteness.

The API includes `veryFree_twoPointSmooth`, `rationallyConnected_coherentVanishing`, `rationallyConnected_finiteEtaleTrivial`, `rationallyConnected_geometricBrauerFinite` and `rationallyConnected_brauerFinite`, with geometric base-change and constant-image compatibility.

**Checks.** P¹ has geometric Pic Z, geometric Brauer zero and Br/Br₀ zero. A smooth cubic surface over an algebraically closed characteristic-zero field has a free Pic lattice of rank seven and geometric Brauer zero; over K its arithmetic quotient can be nonzero. An elliptic curve has nonzero H¹(O) and is excluded: no finiteness assertion about its full arithmetic Brauer quotient follows. A proper nonprojective X is handled by modification and purity, rather than by claiming X has an ample bundle.

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.6, 7.10, 8 and 9.1–9.5; SchemeAndStackFoundations T431, the P¹ vector-bundle and Riemann–Hurwitz suppliers, Kummer and Hochschild–Serre; ComplexComparisonPartII §§C2 and C5.3; CohomologicalPointCounting/ComplexComparison Layer 10; TauCetiRoadmap.AlgebraicTopology Stages 6 and 8; §2.17a.

### 2.20b Nonzero residues at infinitely many auxiliary places

Prove `ramifiedBrauer_auxiliaryPlaces`. Let X be smooth geometrically integral over a number field K, U⊆X dense open, and α∈Br(U) not extending to Br(X). There are infinitely many finite places v admitting a point P_v∈U(K_v) integral on a fixed model of X and satisfying `inv_v α(P_v)≠0`. A finite prescribed set of places may be excluded. No rational connectedness is needed for this target. At these points integrality is on X, not necessarily on U.

By §2.17a choose a boundary prime divisor D with nonzero residue χ∈H¹(K(D),Q/Z). Shrink its smooth locus so that χ is a finite étale cyclic character and all other ramification divisors are avoided. Spread this divisor, its cover, a uniformizer t and the ambient smooth chart outside finitely many places. Let L be the algebraic closure of K in K(D), and L′ the constant field of the residue cover. If L′≠L, number-field Chebotarev supplies infinitely many places with a degree-one place on L whose Frobenius has nonzero image in Gal(L′/L). The descended D-component is geometrically integral there and has a residue-field point by Lang–Weil; every such point has nonzero χ-Frobenius. If L′=L, both that component and the cyclic cover are geometrically integral. For arbitrarily large places split in a normal closure of L/K, Lang–Weil gives point counts asymptotic to q^dim(D) for each. If all residue-field fibres split completely, the cover would instead have at least m times the base count, where m>1 is its degree. Thus some base point has nonzero Frobenius. A zero-dimensional divisor only uses the constant-field case. This route needs nonzero Frobenius, not a specified generator in every geometric fibre. (Harari, *Méthode des fibrations et obstruction de Manin*, §§2.2–2.3, pp.225–230; the stated counting adaptation uses InverseGaloisAndArithmeticFundamentalGroups §4, `The Lang–Weil estimate`, and TauCetiRoadmap.Chebotarev Layer 10.)

At such a residue point, lift the character to the henselian neighbourhood of D. Residue exactness says that `α−(χ,t)` extends over that neighbourhood; shrink and spread this extension, so it evaluates in Br(O_v)=0. The local invariant is therefore `ord_v(t(P_v))·χ(Frob_v)`. The smooth local chart of §2.11a permits lifting the chosen residue point with t(P_v)=ϖ_v. This gives the required nonzero value and an integral point of X. Retain the residue sign convention in the cyclic cup-product formula; reversing both conventions has no effect on nonvanishing. (Harari, §2.4, Proposition 2.4.2 and proof, pp.231–233; Colliot-Thélène–Skorobogatov, *The Brauer–Grothendieck group*, Theorem 12.6.2 and proof, pp.260–264.)

The API records `boundaryResidue_nonzero`, `auxiliaryPlaces_infinite`, `auxiliaryPoint_integralOnAmbient`, `auxiliaryPoint_residueFormula` and `auxiliaryPlaces_avoidFinite`. The residue character, smooth locus and spreading set are output data of the construction.

**Checks.** For U=G_m inside A¹ over Q and α=(t,-1), primes p≡3 mod4 and t=p give invariant 1/2 while t is integral on A¹ and not on G_m. A class extending over X cannot satisfy the conclusion outside its fixed spreading set. For a geometrically connected nontrivial cyclic residue cover, counting detects a nonsplit fibre even when the cover has no constant-field extension. Excluding any fixed finite set leaves infinitely many choices.

*Needs:* §2.17a; §§2.6a–2.8 and 2.11a; SchemeAndStackFoundations finite étale covers and finite-presentation spreading; ClassFieldTheory Layer 5; TauCetiRoadmap.Chebotarev Layer 10; InverseGaloisAndArithmeticFundamentalGroups §4, Lang–Weil.

### 2.20c Finite-group compensation and the formal lemma

Prove `finiteBrauer_compensate`: for X and U as in §2.20b, a finite subgroup B⊆Br(U), an adelic point orthogonal to B∩Br(X), and prescribed neighbourhoods at a finite set S, one can find a U-adele inside those neighbourhoods and orthogonal to B. Include infinite places and all spreading exceptions in S. No finiteness of the entire Brauer group is used.

Spread B and its unramified subgroup outside S. Put C=B/(B∩Br(X)). Every auxiliary evaluation on an ambient-integral point outside S annihilates the unramified subgroup, so is a character of C. Let R⊆C∨ consist of characters obtained at infinitely many places in this way. Each nonzero class of C has a ramified representative; §2.20b gives infinitely many nonzero evaluations, and finiteness of C∨ ensures some member of R detects that class. Hence the annihilator of the subgroup generated by R is zero. Elementary duality for finite abelian groups implies that R generates C∨.

Approximate the given point at S by points in U, using density of U(K_v) in the smooth local space and local constancy for the finite group B. Their residual sum annihilates B∩Br(X), so descends to a character r of C. Express -r as a finite sum of characters in R. Negative coefficients may be replaced by nonnegative coefficients modulo each character's order. Choose distinct fresh places for these summands, possible because each chosen character recurs infinitely often; use its realizing local point there. At every other place retain or choose U-integral points, where every class of B evaluates to zero. Only finitely many fresh points need ambient rather than U-integrality, so the result is a U-adele. Its sum on B is zero. This proves compensation, including multiple summands of the same character, without an unproved simultaneous-realization assertion at one place. (Harari, §2.6, proof of Theorem 1.4.1, pp.233–235; Colliot-Thélène–Skorobogatov, Theorem 12.6.1 and proof, pp.264–266.)

For the subgroup A in §2.21, first adjoin Br₀ without changing orthogonality. By §2.20a and the hypothesis that A/(A∩Br(X)) is finite, A/(A∩Br₀) is finite. Choose finitely many lifts of generators; Brauer torsion makes the subgroup B they generate finite, and A=B+(A∩Br₀). Constant classes have sum zero on every adele. Therefore the finite compensation theorem proves precisely the requested density for A; no uniform continuity for an infinite family of evaluations is asserted.

The API provides `recurrentEvaluationCharacters`, `recurrentCharacters_generateDual`, `finiteBrauer_compensate`, `formalLemma_reduceToFinite` and compatibility with enlarging S or shrinking its prescribed neighbourhoods.

**Checks.** B⊆Br(X) gives C=0 and requires no compensating places. For C=Z/3 and residual character 1/3, two distinct places with character 1/3 cancel the residual sum; assuming one place realizes 2/3 is unnecessary. An infinite subgroup of constant classes contributes zero and is removed before choosing B. Without finite A/(A∩Br(X)), the reduction to a finite list of representatives is unavailable.

*Needs:* §§2.20a–2.20b; §§2.8, 2.10, 2.11a, 2.12 and 2.14; Mathlib finite abelian groups and their character duality; SchemeAndStackFoundations torsion of scheme Brauer groups.


### 2.21 Harari's formal lemma

Prove `TauCeti.formal_lemma`. Let X be a smooth proper rationally connected variety over a number field K, V ⊆ X a dense open subset and A ⊆ Br(V) a subgroup with A/(A ∩ Br X) finite. Then V(𝔸_K)^A is dense in X(𝔸_K)^{A ∩ Br X}.

The finiteness of the quotient A/(A ∩ Br X) (not of Br V) is the hypothesis used.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), proof of Corollary 2.2, p. 8, citing Colliot-Thélène–Skorobogatov 2000 Proposition 1.1.)

Apply §§2.20a–2.20c. Rational connectedness makes Br(X)/Br₀ finite, reducing A modulo constants to a finite subgroup. Nonzero residues give infinitely recurring auxiliary evaluation characters, and finite duality supplies a finite sum cancelling the prescribed local contribution. The argument preserves any given finite set of local neighbourhoods.

**Checks.**

- For A ⊆ Br X the statement is the density of V(𝔸)^A in X(𝔸)^A (V(K_v) is dense in X(K_v)).

*Needs:* §2.14 (Topology of Brauer–Manin sets); §2.17 (The unramified Brauer group); §2.12 (Local constancy of Brauer evaluation); §§2.20a–2.20c (finite rationally connected Brauer quotient, auxiliary places and compensation).


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

Use §2.25b to identify Pic X_{k̄}=ℤ·O(1) and H²(X_{k̄},μ_n) with the corresponding projective-space group for every n. The Kummer sequence then gives Br X_{k̄}[n]=0; torsion gives Br X_{k̄}=0. The hyperplane bundle descends, H¹(k,ℤ)=0, and Hochschild–Serre gives Br X=Br₀ X. In the low-degree Hochschild–Serre sequence, the obstruction from the invariant Picard group to Br k vanishes because its generator O_X(1) is defined over k. Thus Br k→Br X is injective even without a k-point. Together with H¹(k,ℤ)=0 and geometric Brauer vanishing, this proves the isomorphism over every characteristic-zero field; no vanishing of H³(k,𝔾_m) is required here.

Vacuity: constant classes pair trivially (§2.13 (The Brauer–Manin pairing and set for varieties)); descent: X_{k̄} is algebraically simply connected and Theorem 8.5.4 (§3.8 (Étale–Brauer equals descent)).

**Checks.**

- Smooth cubic threefolds and quartic threefolds in ℙ⁴ have no Brauer–Manin obstruction.

*Needs:* §2.25b; §3.8 for the descent consequence; §2.16 (Constant and algebraic Brauer groups); §2.13 (The Brauer–Manin pairing and set for varieties).


### 2.25a Positive divisors and the relative topological range

Prove `positiveDivisor_relativeCells`. Let M be a compact complex manifold of dimension d and let a holomorphic line bundle L have a smooth Hermitian metric with positive curvature. For a section with smooth nonempty zero divisor Y, the pair (M,Y) is, up to homotopy of pairs, obtained by attaching finitely many cells of real dimension at least d. Consequently `π_i(M,Y)=0` and `H^i(M,Y;R)=0` for i<d, for any constant coefficient ring R. The restriction on absolute cohomology is an isomorphism for i<d−1 and injective for i=d−1; π₁(Y)→π₁(M) is an isomorphism when d≥3.

Use the already proved pinned `TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart` and `TauCeti.exists_norm_lt_hasNondegenerateCriticalPointsOn_sub`; neither is a new target. For f=‖s‖², smoothness of Y gives local coordinates f=h|z₁|² with h positive. A tubular neighborhood and the nondegenerate normal quadratic form identify sufficiently small sublevels with a disk neighborhood of Y. Off that neighborhood perturb f arbitrarily little in C², keeping it fixed near Y, to give only nondegenerate critical points. A finite sequence of coordinate perturbations with bump functions uses the pinned perturbation theorem on smaller compact patches; nondegeneracy on the previously treated compact patches is open in C². The positivity of the curvature is also retained. At a critical point away from Y, the real Hessian satisfies `H(v,v)+H(iv,iv)<0` for every nonzero complex tangent vector: locally log f=log h+log|s|², and the second summand is pluriharmonic there. A nonnegative real subspace of dimension greater than d would meet its multiplication-by-i image nontrivially, contradicting this inequality. Thus every critical point has at least d negative directions.

For the relative-cell adapter, between regular levels use the vector field `−∇f/‖∇f‖²`, with a cutoff supported away from critical points; it lowers f at unit speed on the compact band. DifferentialGeometry Layer 3 supplies its flow. Around a critical point the pinned Morse chart and diagonalization put f in the form c−|u|²+|v|². Shrinking the chart and modifying f there by a radial cutoff in |u|²+2|v|², with derivative bounded in magnitude by one, gives a deformation to the lower sublevel together with the disk v=0. Its boundary lies in the lower sublevel. Glue these finitely many local deformations; the new cells have dimension dim u, the negative index. Relative cellular cohomology, the homotopy exact sequence and cellular approximation give the stated range. This is the smooth-divisor case; no singular-zero-set or stack Morse theorem is required.

APIs: `positiveDivisor_relativeCells`, `positiveDivisor_relativeCohomology_vanish`, `positiveDivisor_relativeHomotopy_vanish`, `positiveDivisor_piOne_iso`. **Checks:** a hyperplane in ℙ^d gives the asserted range; for a positive-degree divisor on a curve, π₁ of the divisor cannot equal π₁ of the curve and d≥3 is excluded; the trivial line bundle has no positive curvature on a compact positive-dimensional manifold, so its constant section cannot be used; the index is real dimension at least d, not 2d. *Needs:* the two pinned Morse declarations; TauCetiRoadmap.DifferentialGeometry Layers 3, 10, 12; TauCetiRoadmap.GeometricTopology Layer 1 (tubular neighborhoods); TauCetiRoadmap.AlgebraicTopology Stages 2–3 and 8; ComplexComparisonPartII C3.2 (curvature and Chern classes). Source: [Halpern-Leistner, A Lefschetz hyperplane theorem for stacks](https://arxiv.org/abs/1008.0891v1), §2, Claims 2.3–2.4, Theorem 2.5 and Corollaries 2.7–2.8, pp.4–7; §3, Proposition 3.5 and Proposition 3.7, pp.10–11, restricted to trivial stabilizers and a smooth divisor.

### 2.25b Complete-intersection Picard and finite-coefficient comparison

Prove `smoothCompleteIntersection_lefschetz_charZero`: for a smooth complete intersection X⊂ℙ^N over an algebraically closed characteristic-zero field, of dimension d≥3, restriction identifies `Pic(ℙ^N)→Pic(X)` and `H²_ét(ℙ^N,μ_n)→H²_ét(X,μ_n)` for every n≥1, sends O(1) to O_X(1), and X has trivial geometric étale π₁. These are geometric statements and require no rational point on a model over a smaller field.

First work over ℂ. For a general tuple of defining equations, Bertini gives a flag of smooth successive positive divisors, so §2.25a gives π₁(X)=0 and H²(X,ℤ)=ℤ generated by the hyperplane Chern class. The same finite-coefficient assertion holds with ℤ/n. A given smooth complete intersection need not admit the same smooth flag of its particular defining equations. Instead use the nonempty open of smooth complete intersections in the irreducible product of the spaces of equations of the fixed degrees. Its universal family is proper smooth, and its complex base is path connected. ComplexComparisonPartII C5.2 `ehresmannFibration` transports the topological statements from a general fibre to every fibre. The hyperplane line bundle extends over the entire family, so its Chern class is transported too.

Prove the scoped coherent calculation `completeIntersection_intermediateStructureCohomology`: H^i(X,O_X)=0 for 0<i<d. The regular-sequence Koszul resolution has terms that are sums of O_ℙ(−a); its local exactness follows by induction on the nonzerodivisors. Compute the cohomology of each O_ℙ(t) on the standard affine Čech cover: monomials with all exponents negative contribute only in degree N, while monomials with some nonnegative exponent have a contracting summand. This gives vanishing in intermediate degrees; the resolution then gives the stated range on X. In particular H¹(O_X)=H²(O_X)=0 for d≥3. The analytic exponential sequence identifies Pic_an(X) with H²(X,ℤ), and proper GAGA identifies it with Pic(X). Finite-coefficient Artin comparison identifies H²_ét(X,μ_n) with H²(X,ℤ/n), compatibly with the Kummer Chern class. Riemann existence identifies finite étale covers with finite topological covers, giving trivial étale π₁. Descend the equations to a finitely generated characteristic-zero field, embed it in ℂ and apply separably closed field-extension invariance. Picard rigidity here can also be checked directly: H¹(O)=0 makes Pic^0 trivial, while H²(O)=0 and the hyperplane generator give the discrete Picard group; its geometric components are unchanged under algebraically closed extension.

APIs: `completeIntersection_intermediateStructureCohomology`, `completeIntersection_picard_hyperplane`, `completeIntersection_muN_hyperplane`, `completeIntersection_geometricPiOne_trivial`, with naturality in n and compatibility with Kummer. **Checks:** a cubic threefold has Picard group ℤ and geometric Brauer group zero; a quartic surface is below the dimension bound and can have nonzero geometric Brauer group; a smooth intersection with singular partial intersections is handled by the smooth family, not by applying §2.25a to a singular flag; the hyperplane class is the generator and not the degree times the generator. *Needs:* §2.25a; ComplexComparisonPartII C4.1 (proper GAGA), C5.2 and C5.4 (Chern classes); TauCetiRoadmap.CohomologicalPointCounting.ComplexComparison Layers 8 and 10; TauCetiRoadmap.CohomologicalPointCounting.EtaleBaseChange Layer 4 (separably closed extension invariance); SchemeAndStackFoundations SF.4 (coherent cohomology and Serre) and AlgebraicModuliForArithmeticGeometry §7.2 (relative Picard). Source: Poonen, Theorem 8.6.12 and proof sketch, printed p.252, for the application; Halpern-Leistner, Corollaries 2.7–2.8, pp.6–7, for the topological range. The Čech/Koszul and family adapters are the proof steps specified here.

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

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients.


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

Sections 3.3a–3.3b distinguish the finite-group bounded-different argument from the general smooth-affine case. The latter uses finiteness of the connected-group kernel of localization outside S; its pseudo-reductive and reductive inputs are additional prerequisites. Restricted-ramification finiteness for finite modules alone does not prove this claim.

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


### 3.3a Bounded ramification for finite torsors over proper varieties

Prove `proper_finiteEtaleTorsor_selmer_finite` over every global field k, including finite groups whose order is divisible by the characteristic. Let F be finite étale over k and Y→X an F-torsor with X proper. Spread these data to a proper model and a finite étale torsor outside a finite set S. The fibre of an integral point gives an unramified F-torsor outside S. At v∈S the evaluation image is finite by §3.4. Regarding an F-torsor as an étale algebra of degree d=rank F, these finitely many local classes bound the different at the exceptional places. Thus all its underlying algebras have bounded degree and discriminant. There are only finitely many such algebras; on each, only finitely many F-actions can satisfy the torsor identity, since their scalar extensions act by permutations of d geometric points. This last step retains the F-action rather than identifying torsors with their underlying algebras.

For number fields, use ArithmeticGaloisDuality R02.3's Hermite theorem, with the bound on the discriminant obtained from the local differents. For global function fields own `functionField_hermite_boundedDifferent`. Write k=𝔽_q(C) with exact constants 𝔽_q. Riemann–Hurwitz bounds the genus and constant-field degree of each separable extension E/k of degree at most d with bounded different. Fix a sufficiently large effective divisor D on C. The 𝔽_q-dimension of L_E(f*D) is at least [E:k]deg D−c, with c uniform in this bounded family; for every proper intermediate field M it meets M in L_M(g*D), whose dimension is at most [M:k]deg D+c′. Both constants follow from Riemann–Roch, retaining the constant-field degree. A normal closure has degree at most d!, so the number of intermediate fields is bounded by the number of subgroups of a group of order at most d!. Increase deg D until the union of these proper subspaces has fewer than q^{dim L_E(f*D)} elements. A primitive z then lies in that space. The coefficients of its monic minimal polynomial belong to the fixed finite spaces L_k(iD), 1≤i≤d: the conjugates have their poles bounded by the pullback of D, and symmetric products multiply that pole bound by i. There are finitely many possible polynomials, hence extensions. Products of extensions give the assertion for étale algebras. This proof bounds the wild different; it does not replace that bound by a bound on the set of ramified places.

APIs: `functionField_hermite_boundedDifferent`, `properTorsor_unramifiedOutside`, `properTorsor_localDifferent_bound`, `proper_finiteEtaleTorsor_selmer_finite`, `finiteTorsor_finiteStructures_onAlgebra`. **Checks:** the Artin–Schreier classes t^{-m} for positive m prime to p over 𝔽_q(t) have unbounded different at 0 despite one fixed ramified place; a proper torsor supplies only finitely many local classes there; a constant-field extension of degree e≤d must be included in the Riemann–Hurwitz and Riemann–Roch dimensions; F=1 gives one class if X has points everywhere and gives none otherwise. *Needs:* §§2.3a, 3.1, 3.4; ArithmeticGaloisDuality R02.3 for number-field Hermite; Tau Ceti AlgebraicCurves Riemann–Roch and ramification/Riemann–Hurwitz; finite étale descent and the component-group construction in SchemeAndStackFoundations. Source: Poonen, Theorem 8.4.6 and its finite-group proof, pp.241–242. The bounded-different function-field argument is the Riemann–Roch adapter specified here.

### 3.3b The connected-group finiteness input and the component adapter

For a global field k, finite S, and smooth connected affine k-group H, the input needed here is
`connectedShaOutside_finite : Finite (ker(H¹(k,H)→∏_{v∉S}H¹(k_v,H)))`.
Require it for every inner twist of H and after every finite extension of k. Its associated `localization_finiteFibres` follows by twisting a nonempty fibre to the trivial one. Neither the finiteness of H¹ for a finite module nor a bound on an isogeny kernel implies this assertion for H.

Given this input, prove `proper_smoothAffineTorsor_selmer_finite`. For connected G, spread it with geometrically connected smooth fibres. Lang's theorem on the finite residue field and smooth Hensel lifting give H¹(O_v,𝒢)=1 outside S. Properness then places the Selmer set in the kernel just specified. For general smooth affine G use 1→G⁰→G→F→1 with F finite étale. The projected Selmer classes lie in the finite set for Y/G⁰→X furnished by §3.3a. In a nonempty fibre choose a G-class τ and twist by it. Nonabelian exactness expresses the fibre above its component class as an image of H¹(k,(G⁰)^τ). Enlarge S to spread τ and the component quotient. Outside S, every F(k_v)-point extends over O_v, and its connecting class is zero by H¹(O_v,(𝒢⁰)^τ)=1. Thus a connected class mapping to a viable G-class is locally trivial there; the apparent ambiguity from the F(k_v)-action introduces no extra classes at the good places. The connected finiteness input proves that this fibre is finite. There are finitely many component classes. Twisting and a finite compositum of splitting fields give §3.3's finite extension in which every rational point lifts.

APIs: `connectedShaOutside_finite`, `localization_finiteFibres`, `proper_smoothAffineTorsor_selmer_finite_of_connectedSha`, `componentSelmer_finite`, `componentFibre_connectedSha`, `properTorsor_uniformSplittingExtension`. **Checks:** for G=𝔾_m Hilbert 90 makes the connected kernel trivial; for F finite étale the argument reduces to §3.3a; a disconnected G needs the finite component Selmer set, since its unramified local H¹ need not be trivial; in positive characteristic a smooth connected unipotent group need not be split, so additive Hilbert 90 cannot be applied to an arbitrary such group.

Over number fields the connected input reduces, by the split unipotent radical, to connected reductive groups; Borel–Serre, *Théorèmes de finitude en cohomologie galoisienne*, Theorem 7.1, §7.2 and §§7.6–7.10, pp.158–162, then uses arithmetic reduction theory for the reductive kernel. AdelicAlgebraicGroups AA.3 supplies reduction theory and AA.4.1 supplies local and global simply connected H¹; an explicit passage from these suppliers to the general reductive kernel is additionally required. Over global function fields use Conrad, [*Finiteness theorems for algebraic groups over function fields*](https://math.stanford.edu/~conrad/papers/cosetfinite.pdf), Theorem 1.3.3, p.5, and §§6.1–6.4, pp.32–40. Its reduction passes through k-unipotent radicals, commutative groups, and generalized standard presentations of pseudo-reductive groups, with basic exotic groups in characteristics 2 and 3. Harder's simply connected H¹ theorem and the pseudo-reductive classification, including its characteristic-two case, are necessary proof inputs here. ReductiveGroupsPartII's perfect-field reductive theory does not supply those presentations. These inputs and the reductive number-field adapter are separate prerequisites of `connectedShaOutside_finite`; the conditional component adapter above does not establish them. *Needs:* §§3.1, 3.3a, 3.8b; ReductiveGroupsPartII RG2.3 for Lang and smooth-model torsors; the stated connected-group finiteness input. The local-integral part of §3.8b is independent of Selmer finiteness, so this dependency does not use its later compactness argument.

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

k a number field; G smooth affine; X separated of finite type. For function fields the assertion requires the analogous adelic-space construction for global fields. Section 2.3a supplies the global-function-field model and restricted-product extension; the general smooth-affine Selmer-finiteness input remains the separate requirement of §3.3b.

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

X(𝔸)^{ét,Br} ⊆ X(𝔸)^{descent}: Demarche's connected-torsor lifting and component-group argument. The connected-group input is the inclusion X(𝔸)^{Br}⊆X(𝔸)^{conn}; equality with the connected descent set is not asserted. To propagate Brauer conditions to lifts, rather than merely produce adelic lifts, use the invariant-Brauer refinement described below.

Iteration: Cao, *Sous-groupe de Brauer invariant et obstruction de descente itérée*, Theorems 1.1–1.2, pp.2152–2153, with the 2023 corrigendum, Theorem 2.1 and Corollary 2.2, author pp.3–5. The quasi-projective assertion needs this stronger lifting theorem; the proper finite-cover compactness argument in §3.8b alone does not prove it.

**Checks.**

- For Skorobogatov's bielliptic surface the empty étale–Brauer set is also explained by a single torsor under a noncommutative finite étale group (Poonen Remark 8.6.4).

*Needs:* §3.7 (The étale–Brauer set); §3.6 (Descent is at least as strong as Brauer–Manin); §3.5 (Descent obstruction sets).


### 3.8a Domination of a torsor over a finite étale torsor

Prove `finiteEtaleTorsor_domination`. Over any field k, let Y→X be a torsor under a finite étale k-group F, and let Z→Y be a torsor under a smooth affine k-group G. There is a smooth affine k-group E and an E-torsor V→X with a surjective torsor morphism V→Y. As a torsor over Y, V has a surjective torsor morphism to Z. The structure groups and maps are retained, so the construction can be twisted functorially.

Set H=Res_{F/k}(G×F), E=H⋊F for the action that permutes the factors indexed by F, and `V=Res_{Y/X}(Z)×_X Y`. The finite locally free affine restriction functor is supplied by ReductiveGroupsPartII RG2.0a and its relative comparison by AlgebraicModuliForArithmeticGeometry §§3.4–3.5. Over Y, use `Y×_X Y≅Y×_k F` to identify V with a product of the translates of Z after splitting F. This gives its H-action. Translation on the second Y-factor defines the compatible F-action; together they give the E-action. After an étale cover trivializing Y and the finitely many translated torsors, the torsor equation `E×V≅V×_X V` is the product torsor equation and the permutation action. Effective descent gives it before that base change. Evaluation at the identity section of F gives H→G and V→Z over Y; both are surjective, as is V→Y. Smoothness and affineness descend from the split product G^{|F|} and the finite étale factor. A torsor over Y itself need not be a torsor over X, so the additional product factors are essential.

APIs: `finiteEtaleTorsor_domination_group`, `finiteEtaleTorsor_domination_torsor`, `finiteEtaleTorsor_domination_toCover`, `finiteEtaleTorsor_domination_toTorsor`, `finiteEtaleTorsor_domination_twist`. **Checks:** F trivial gives back Z; for F=ℤ/2, H=G×G and E=(G×G)⋊ℤ/2 with factor exchange; evaluation at the identity, rather than a Galois-chosen geometric point of F, defines the projection H→G over k; dropping affineness of G goes beyond the restriction-of-scalars supplier. *Needs:* §3.1; SchemeAndStackFoundations effective descent and affine morphism descent; ReductiveGroupsPartII RG2.0a; AlgebraicModuliForArithmeticGeometry §§3.4–3.5. Source: [Skorobogatov, Descent obstruction is equivalent to étale Brauer–Manin obstruction](https://www.ma.imperial.ac.uk/~anskor/mathann09.pdf), Proposition 2.3 and proof, printed pp.504–505.

### 3.8b Integral lifts, closed images and compatible finite-cover descent

Prove `torsor_adelicLift_of_localLifts`: for a torsor Y→X under a smooth affine group over a number field, an adelic point x lifts adelically if and only if it lifts at every place. Spread the torsor and group after removing finitely many places, with the identity component smooth and geometrically connected and the component group finite étale. Outside that set, x is integral. A trivial generic fibre gives a point of the finite component torsor; properness extends it over the local integers. Its inverse image is a torsor under the smooth connected model, so ReductiveGroupsPartII RG2.3's `lang-theorem` and `smooth-model-torsors` give an integral point. Choose these integral lifts at almost all places and arbitrary lifts at the remaining places. This proves the restricted-product assertion, including for nonproper X.

Prove `proper_finiteCover_descent_iteration`: for proper X and an F-torsor Y→X with F finite étale,
`X(𝔸)^{descent}=⋃_σ f^σ(Y^σ(𝔸)^{descent})`.
Here descent ranges over smooth affine groups. A torsor's evaluation is locally constant: twist by the fibre at a point, then smooth local lifting makes its trivial-class locus open; the same argument on every twist makes all fibres open. Thus every local lifting image is closed as well. The integral-lift result identifies its adelic image with the intersection of the local images, so that image is closed. For proper X, §3.3 gives finitely many viable twists; consequently the union of their images is closed. This finiteness input is required for arbitrary smooth affine groups, not only for finite groups.

For a point surviving descent, first select a twist of Y which works for every surjective torsor domination of that twist. The selection is finite: for each candidate twist that fails select one failing domination; their fibre product yields a torsor over X for which all candidates fail, contradicting survival. For the selected twist the fibre above x in Y(𝔸) is a product of finite sets, hence compact. If no lift survives descent on Y, the open complements of the closed descent images cover this fibre. A finite subcover gives finitely many Y-torsors; take their product and apply §3.8a. The selection property supplies a twist of the dominating torsor lifting x and mapping to a twist of that product over Y, a contradiction. The reverse inclusion is pullback of torsors. This proves stability under finite étale covers; it does not supply the connected-group Brauer lifting or neutrality theorem needed for the reverse étale–Brauer inclusion in §3.8, nor stability under arbitrary successive nonfinite torsors.

APIs: `torsor_adelicLift_of_localLifts`, `torsor_adelicImage_closed`, `proper_torsor_descentImage_closed`, `proper_finiteCover_descent_iteration`, `proper_finiteCover_compatibleTwist`. **Checks:** local lifts without integral lifts are insufficient for an adelic assertion; for a trivial finite cover the identity section gives the iteration equality; an infinite set of twists cannot be replaced by a finite union merely because local images are closed; the fibre compactness uses finiteness of Y/X and is not asserted for a general affine torsor. *Needs:* §3.8a; §3.3 with its full smooth-affine Selmer finiteness; §§2.11a and 3.1; ReductiveGroupsPartII RG2.3 `lang-theorem` and `smooth-model-torsors`; SchemeAndStackFoundations §§0.8–0.9, smooth Hensel lifting, and the component-group quotient. Source: Skorobogatov, Lemma 2.2, pp.503–504, Proposition 2.4 and Corollaries 2.5–2.7, pp.505–506, and the proof of Theorem 1.1, pp.506–507.

### 3.8c Extended types and universal finite abelian covers

For smooth geometrically integral X/k in characteristic zero, put `KD′(X)=cone(𝔾_m→τ≤1 Rp_*𝔾_m)[1]`, where p:X→Spec k. It has cohomology k̄[X]×/k̄× in degree −1 and Pic(X_k̄) in degree zero. For a group S of multiplicative type, own the extended type sequence

`H¹(k,S)→H¹(X,S)→Hom_D(Ŝ,KD′(X))→H²(k,S)→H²(X,S)`.

It follows by applying derived Hom(Ŝ,−) to the defining triangle. Identify Ext^i_X(Ŝ,𝔾_m) with H^i(X,S): after an étale splitting, a free character lattice reduces this to copies of 𝔾_m; a finite cyclic character group uses its two-term free resolution and the surjectivity of taking powers in the étale sheaf 𝔾_m. The local higher sheaf Ext groups vanish, so derived adjunction gives the required identification. The triangle also defines the boundary and its pullback compatibility. This is the units-sensitive extension of §3.9a, not an application of that section with its constant-units hypothesis omitted. The API includes `extendedType`, `extendedType_boundary`, `extendedType_twistInvariant`, `extendedType_exists_iff_boundary_zero` and `extendedType_constantUnits`, the last recovering the ordinary Picard type.

For n≥2 define S_X by its finite character module H¹(X_k̄,μ_n). Finiteness follows after spreading to a finitely generated characteristic-zero field, embedding it in ℂ and using finite CW type and finite-coefficient comparison. The Kummer cone gives a canonical map Ŝ_X→KD′(X). A `UniversalNTorsor(X,n)` is an S_X-torsor with this extended type. Its APIs are uniqueness up to a k-torsor, normalized uniqueness at a k-point, the geometric monodromy quotient π₁(X_k̄)^ab/n≅S_X(k̄), and the universal pushout property: every torsor under a finite commutative n-killed group S differs from one unique pushout of this torsor by a constant torsor. Prove the pushout assertion using the Kummer triangle and the vanishing of Hom(Ŝ,k̄[X]×/k̄×), since the units quotient is torsion free. With a k-point, its section of the fundamental-group sequence constructs the normalized cover directly. Without such a point, existence requires the extended-type obstruction to vanish. Over a number field, detecting this obstruction from a Br₁-orthogonal adele uses the compact-support trace argument of §3.9c with KD′ in place of Pic; the multiplicative-type case also requires finite-module Poitou–Tate, not torus duality alone.

**Checks.** On proper geometrically integral X the degree −1 units term vanishes. On G_m the Picard group is zero but the universal μ_n cover t↦t^n is nontrivial: discarding the units term loses it. A k-point normalizes the fibre to the trivial S_X-torsor; an arbitrary twist need not have that normalization. For ℙ¹ over an algebraically closed field S_X is trivial. Source: [Harari–Skorobogatov, Descent theory for open varieties](https://arxiv.org/abs/1012.1859), Proposition 1.1 with proof, author pp.3–5, Proposition 1.3, pp.5–6, and Theorem 3.5/Corollary 3.6, pp.17–19; [Cao, Sous-groupe de Brauer invariant et obstruction de descente itérée](https://msp.org/ant/2020/14-8/ant-v14-n8-p05-s.pdf), Definition 2.1 and Proposition 2.2 with proof, pp.2156–2157. *Needs:* SchemeAndStackFoundations torsors, Kummer, derived adjunction and Hochschild–Serre; §§3.9a–3.9c for the arithmetic obstruction calculation; ArithmeticGaloisDuality finite-module Poitou–Tate and multiplicative-type resolutions; ComplexComparisonPartII finite-coefficient comparison and finite CW type. The nonconstant-units compact-support comparison must be established before using the Br₁ existence conclusion.

### 3.8d The corrected degree-two product calculation

Own `finiteCoefficient_product_H2`. For separably closed k of characteristic zero, geometrically integral U,V, n≥2 and a finite Z/n-module S, there are decompositions

`H¹(U×V,S)≅H¹(U,S)⊕H¹(V,S)`,

`H²(U×V,S)≅H²(U,S)⊕H²(V,S)⊕Hom(S_U⊗_(Z/n)S_V,S)`.

The mixed map sends a bilinear homomorphism to the pushforward of the cup product of the two universal n-torsors. Pullback from the two factors is also injective in degree three. Choose points on the two factors to split the outer summands. In the Leray sequence for the first projection, base change identifies the row sheaves with the constant groups H^j(V,S). The point sections split the row-zero and column-zero terms. The remaining degree-two term is H¹(U,H¹(V,S)), identified by §3.8c with the displayed Hom group. The cup-product map lands in this term. For S=Z/ℓ, the ordinary field-coefficient Künneth theorem identifies it with that term. For general S, choose 0→S₁→S→S₂→0 and induct on |S|. Naturality of the cup product and the exact coefficient sequences, together with degree-one splitting and degree-three factor injectivity, show injectivity; the Leray computation then gives surjectivity. This uses no assertion that all finite Z/n-modules are flat.

Over general characteristic-zero k, if u∈U(k) and universal n-torsors exist on both factors, the corresponding statement is

`H²_u(U,S)⊕H²(V,S)⊕Hom_k(S_U⊗_(Z/n)S_V,S)≅H²(U×V,S)`.

For the proof take the cone of `(p₁*+p₂*,u*+0):RΓ(U_k̄,S)⊕RΓ(V_k̄,S)→RΓ((U×V)_k̄,S)⊕S`. Its cohomology below degree two vanishes and its degree-two module is the geometric mixed Hom group. Galois hypercohomology gives the injection of the two factor terms and the remaining invariant Hom term. The universal-torsor cup product splits that term. The API retains coefficient homomorphisms, both projections, point normalization, Galois equivariance and the explicit mixed map.

**Checks.** A point factor gives zero mixed term. Over an algebraically closed field, U=V=G_m and S=μ_n give a nonzero mixed cyclic-symbol class. Composite n must use the Hom expression: replacing it by H¹(U,Z/n)⊗H¹(V,S) without a flatness justification is not the stated theorem. Over general k, constants occur in the V summand once; replacing H²_u(U,S) by H²(U,S) duplicates them. Source: [Cao's corrigendum](https://arxiv.org/abs/2201.10717v1), Theorem 2.1 and proof, author pp.3–5, Corollary 2.2 and proof, p.5. Its formulation replaces the product formula in the original paper's Proposition 2.6. *Needs:* §3.8c; EtaleBaseChangeAndSixOperations finite-coefficient product/base change; SchemeAndStackFoundations Leray, derived cones and coefficient sequences. The argument only needs the usual prime-field Künneth theorem as input.

### 3.8e Compatible finite covers and invariant Brauer classes

Let G be connected linear over a characteristic-zero field, acting on smooth geometrically integral X. Define `compatibleFiniteTorsor(G,Y→X)` by an action of G on Y making the torsor map equivariant. Such an action is unique when it exists and commutes with the finite structure group's action. After a geometric trivialization, the restriction of the torsor to G×{x} determines θ:π₁(G_k̄)→F(k̄), up to the usual conjugacy. The product fundamental group identifies compatibility with θ=0. A lifted action preserving the fibre above the identity is unique; associativity and commutation with F follow by comparing lifts on connected products with a finite étale target.

Own `finiteTorsor_minimalCompatibleIsogeny`: θ has abelian central image in the monodromy group, and its Galois-stable kernel defines a connected central isogeny H_Y→G. The action of H_Y lifts to Y. Every other connected isogeny with a lifted action factors uniquely through H_Y. Indeed π₁(G_k̄) is abelian by the two commuting multiplications on loops; its image commutes with the X monodromy in π₁(G×X). The corresponding pointed finite étale cover of G inherits multiplication and inverse by unique pointed lifts, since the product fundamental-group map preserves its subgroup. Uniqueness descends the group law to k. Twists of Y have the same compatible isogeny. This statement is about a fixed finite torsor, not a single finite isogeny working for all covers.

Define `invariantBrauerGroup(G,X)` by ρ*b−p₂*b∈p₁*Br(G), and put `Br_e(G)=ker(e*:Br₁(G)→Br(k))`. Its normalized Sansuc map λ has values in this algebraic Brauer subgroup and satisfies `eval_b(gx)=eval_b(x)+eval_λ(b)(g)` over every extension. Two algebraic inputs precede its construction: `Br_G(G)=Br₁(G)` and injectivity of `p₁*:Br_e(G)→Br(G×X)`. For the first, over an algebraic closure a split torus embeds in affine space with normal-crossing coordinate boundary. The invariant residue along a boundary divisor defines an equivariant finite abelian cover. The divisor's stabilizer is connected, so the cover is trivial; purity and Br(𝔸^n)=0 give vanishing. A reductive group's Bruhat cell is a product of a torus and affine spaces; restriction to it is injective on Brauer groups. Quotienting the split unipotent radical gives the general characteristic-zero case by affine-bundle invariance. Pulling an invariant class on X back along a geometric orbit then proves algebraicity of its normalized G term. For injectivity use the algebraic product decomposition `Br_a(G×X)≅Br_a(G)⊕Br_a(X)`, followed by the identity normalization; restriction to a finite extension alone would not establish injectivity. The product decomposition requires the Rosenlicht units and Picard product calculations and their Hochschild–Serre compatibility. These, and the equivariant residue-cover assertion just used, are additional proof prerequisites. Sources: [Cao, Approximation forte pour les variétés avec une action d’un groupe linéaire](https://arxiv.org/abs/1604.03386v4), Lemma 3.6, Proposition 3.7, Definition 3.8 and Proposition 3.9, author pp.15–17; the product decomposition there is Sansuc's Lemma 6.6. The API includes pullback for equivariant morphisms, subgroup operations, the normalized action formula and compatibility with inner twisting. For a universal n-torsor f:T_X→X, prove `universalNTorsor_pullbackBrauer_invariant`: f*Br(X)[n]⊆Br_(H_T)(T_X). Lift a class to H²(X,μ_n), apply §3.8d to G×X, and write its action difference as a factor from G plus the universal mixed cup product. Pullback to T_X kills its universal torsor class and therefore kills this mixed term. Kummer gives the claimed invariant Brauer inclusion.

**Checks.** With the trivial action every finite torsor is compatible. On G_m the cover t↦t^n is compatible with the multiplication action only after replacing G_m by its n-power isogeny. For the trivial group, invariant Brauer is all of Br(X). The pullback theorem controls n-torsion classes for its chosen n; it does not put the entire Brauer group in one fixed finite cover. Sources: Cao, Propositions 3.1–3.4 and Theorem 3.11, pp.2162–2167, Proposition 3.12 and proof, pp.2167–2168, Definition 1.3, pp.2153–2154, and §4, pp.2168–2170; use §3.8d's corrected product formula. *Needs:* §§3.8c–3.8d; InverseGaloisAndArithmeticFundamentalGroups Layer 6 (finite étale covers and product fundamental groups in characteristic zero); ReductiveGroupsPartII connected group structures and central isogenies; SchemeAndStackFoundations descent and Kummer.

### 3.8f Arithmetic lifting inputs for the full comparison

Two further arithmetic statements are necessary to finish §3.8. They are not consequences of finite-cover domination.

First, for any connected linear G, smooth geometrically integral Z over a number field and G-torsor p:X→Z, require

`Z(𝔸)^Br=⋃_σ p^σ(X^σ(𝔸)^(Br_(G^σ)))`.

This is invariant-Brauer lifting, stronger than finding an adelic lift. Its proof uses the following three arithmetic inputs, for every inner twist. First, when Ш¹(k,H)=1, evaluation `H(𝔸)→Br_a(H)^D` is surjective; together with the invariant Sansuc sequence this cancels the Brauer functional of an adelic lift. Second, a reductive G admits `1→G→H→T→1` with Ш¹(k,H)=1, H³(k,T̂)=0 and surjective `Br_a(H)→Br_a(G)`. Construct H=G×^S T₀ by embedding its multiplicative-type centre S in a quasi-trivial torus T₀ with coflasque quotient T; this requires the coflasque lattice resolution, vanishing of Ш¹ of adjoint groups, and the degree-three character calculation including real places. Third, for this extension require `T(𝔸)^Br₁=T(k)·φ(H(𝔸)^Br₁)`. Apply the first input to the induced torsor H×^G X. The second makes restriction of invariant Brauer classes to its T-fibres surjective; the third moves its T-coordinate to a rational point by an H-translate. Its boundary lies in Ш¹(k,G), so that fibre is the corresponding twist of X. The invariant evaluation formula and transport under inner twisting preserve orthogonality. Removing the split unipotent radical is allowed in characteristic zero. These steps are Cao 2018, Lemma 5.1, Lemmas 5.4–5.5, Proposition 5.6, Lemma 5.8 and Theorem 5.9 with proofs, author pp.23–27. The first and third use connected-group Poitou–Tate (Demarche's Theorem 5.1 and Cao–Demarche–Xu's Proposition 3.2), beyond the ordinary torus pairing. The adjoint-group and coflasque assertions also need their proof targets; none is supplied merely by the simply connected H¹ Hasse principle. Cao 2020, §5, (5-1)–(5-3), pp.2170–2171, invokes this stronger input. These connected-group duality and lattice/adjoint adapters remain necessary prerequisites here. After this input, Cao's Proposition 5.5, pp.2173–2176, passes to compatible finite covers, and Theorem 1.4 converts invariant étale–Brauer to ordinary étale–Brauer using §§3.8c–3.8e. The component-group lifting of Proposition 5.7(1), pp.2176–2177, is also needed for arbitrary linear G.

Second, the component-group step has a nonabelian degree-two obstruction. For a connected geometric group with a k-link, a class is represented by semilinear maps f_σ and elements u_(σ,τ) satisfying f_σf_τ=Int(u_(σ,τ))f_(στ) and the corresponding associativity identity. It is neutral when a cochain change makes u=1. Over a number field, local neutrality and vanishing of its toric obstruction imply neutrality. For reductive groups the abelianized obstruction lies in H²(k,[Z(G_sc)→Z(G)]), with degrees −1,0. The proof of the neutral-class criterion needs surjectivity `H¹(k,G_ad)→H²(k,Z(G_sc))` for semisimple simply connected G_sc, including its real and nonarchimedean local versions. This is not the H¹ Hasse principle. Unipotent radicals in characteristic zero can then be removed by their central filtration and H²(k,𝔾_a)=0. Sources: [Borovoi, Abelianization of the second non-abelian Galois cohomology](https://archive.mpim-bonn.mpg.de/395/1/preprint_1991_83.pdf), §§1–2, pp.3–6, Proposition 4.1, pp.8–9, Theorem 5.6/Lemma 5.7, pp.10–11, and Proposition 6.5, pp.12–13. A proof target for the simply connected central-boundary surjectivity and the necessary nonabelian cocycle comparison remains required. Neither an H² torus class nor a lower-tier H¹ local-global theorem closes this step by itself.

**Checks.** When G is a torus the abelianized complex has only its degree-zero torus term, recovering the ordinary H² obstruction. For a split unipotent group the central additive filtration has zero H², but this argument does not apply to wound unipotent groups in positive characteristic. A neutral nonabelian cocycle can have nontrivial u before a cochain change; neutrality is not defined by requiring its chosen representative to have u=1. Invariant-Brauer lifting retains every p*Br(Z) class, so its image remains Br(Z)-orthogonal.

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

*Needs:* SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; §3.1 (Evaluation of torsors and twisted torsors); SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts.


### 3.9a The type exact sequence and its cocycle boundary

Prove `torusTorsor_type_exact`. For a smooth geometrically integral k-variety X with `k̄[X]×=k̄×`, and a k-torus T with character lattice M, there is a natural exact sequence
`0→H¹(k,T)→H¹(X,T)→Hom_Gk(M,Pic X_k̄)→H²(k,T)→H²(X,T)`.
The middle map is character pushout, and the first map is pullback. Fix the convention that a line bundle corresponds to its nonzero-vector 𝔾_m-torsor with the indicated scalar action; this fixes the sign of the type and its boundary. A type λ is represented by a torsor exactly when its boundary vanishes. Its representing torsors, when nonempty, form a simply transitive H¹(k,T)-set. A rational point splits pullback on H², so every type is then represented.

Over k̄ the torus is split. Since M is a finite free abelian group, character evaluation identifies H⁰(X_k̄,T) with T(k̄) and H¹(X_k̄,T) with Hom(M,Pic X_k̄). Both identifications are independent of a basis of M and equivariant under Galois. The Hochschild–Serre five-term sequence gives the asserted sequence. To specify the boundary concretely, represent λ by line bundles for a basis of M, with multiplication isomorphisms for sums of characters. Choose isomorphisms between the Galois transforms and the bundles belonging to the transformed characters. Their failure of the cocycle equation is multiplication by constants, because the only geometric units are constants. These constants, simultaneously on all characters, give a T(k̄)-valued continuous 2-cocycle. Changing the choices changes it by a coboundary. A trivialization of this cocycle gives effective descent of the split torus torsor; a descended torsor supplies such a trivialization. SchemeAndStackFoundations §§1.13–1.17 owns effective torsor descent, so no second descent construction is introduced here.

APIs: `torusTorsor_type`, `torusTorsor_type_pushout`, `torusTorsor_type_boundary`, `torusTorsor_type_exact`, `torusTorsor_type_boundary_cocycle`, `torusTorsor_type_boundary_of_point`, `torusTorsor_sameType_twist_unique`. **Checks:** on ℙ¹, type 1 is represented by O(1) with the fixed convention and type 2 is not universal; the degree-one type on a pointless conic has boundary its nonzero Brauer class, while type 2 descends; for X=𝔾_m the geometric-units hypothesis fails, so the leftmost injectivity is not inferred from this sequence; a change of basis of M leaves the boundary class unchanged. *Needs:* SchemeAndStackFoundations §§1.13–1.17, 2.3 and 2.22; ProfiniteCohomology's Hochschild–Serre spectral sequence; §3.1. Source: [Harari–Skorobogatov, Non-abelian cohomology and rational points](https://www.numdam.org/item/CM_2002__130_3_241_0.pdf), §3.3, sequences (10)–(11) and Proposition 3.7, printed pp.253–254, and Appendix B, pp.270–271. The target here is restricted to tori and constant geometric units.

### 3.9b Degree-two torus duality and the degree-one localization test

Prove `torusDegreeTwo_sha_duality` and `torusDegreeOne_localization_exact` over a number field k. For a k-torus T and M=T̂, use all places and Tate cohomology at real places. The groups `Sha²(k,T)` and `Sha¹(k,M)` are finite, with a perfect pairing into ℚ/ℤ. There is an exact sequence
`H¹(k,T)→P¹(k,T)→H¹(k,M)ᴰ`,
where P¹ is the restricted product for unramified integral cohomology, and the last map sends `(ξ_v)` to `a↦Σ_v inv_v(ξ_v∪a_v)`. In particular a tuple in P¹ comes from a global class exactly when this functional vanishes. The degree-two pairing is compatible with restriction, corestriction and the arithmetic compact-support trace. This target supplies the degrees needed for existence of a type; the already owned pairing `Sha¹(k,T)×Sha²(k,M)` remains the supplier for subsequent adjustment of lifts.

Use ArithmeticGaloisDuality R02.3's S-idele class formation, R02.4.1's Tate duality for finitely generated modules and its local Ext identifications. Take S to be all places and apply `Ext_Gk(M,−)` to `0→E_S→J_S→C_S→0`. Since M is finite free, higher internal Ext against k̄× vanishes, so the global terms are H^i(k,T). Induced local factors and Shapiro identify Ext¹(M,J_S) with P¹(k,T) and Ext²(M,J_S) with the direct sum of H²(k_v,T). Tate duality identifies Ext¹(M,C_S) with H¹(k,M)ᴰ and Ext²(M,C_S) with H⁰(k,M)ᴰ. This gives the displayed sequence and its continuation through H²(k,T). Dualizing the preceding local pairing identifies the kernel in H²(k,T) with the dual of the localization kernel in H¹(k,M). The latter is finite: after a finite Galois splitting extension, inflation identifies H¹(k,M) with H¹ of the finite splitting group, since a continuous homomorphism from a profinite group to a free abelian group is zero; finite-group cohomology in degree one is finite for a finitely generated lattice. The exact sequence therefore gives finiteness and perfectness of the degree-two Sha pairing. The local pairings and the maps of the Ext sequence give the stated sum-of-invariants map; the compact-support version uses the same cone of global-to-local restriction. At a real place use the complete two-periodic complex with alternating `1−c` and `1+c`, as supplied by ArithmeticGaloisDuality, rather than discarding that place.

APIs: `torusDegreeTwo_shaPairing`, `torusDegreeTwo_shaPairing_perfect`, `torusDegreeOne_localization_functional`, `torusDegreeOne_localization_exact`, `torusDegreeTwo_compactTrace_eq`, `torusDegreeTwo_transfer`. **Checks:** for T=𝔾_m, Sha² is zero by Albert–Brauer–Hasse–Noether and H¹(k,ℤ)=0; the localization obstruction has domain H¹(k,M), not Sha²(k,M); real terms are retained for a nonsplit real torus; replacing the lattice by an arbitrary infinitely generated module is outside the finiteness statement. *Needs:* ArithmeticGaloisDuality R02.3, R02.4.1–R02.4.2 and D7.5; ClassFieldTheory Layers 5, 10–11; ProfiniteCohomology's derived Hom and Shapiro APIs. Source: [Milne, Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, Theorem 4.20(a)–(b) and its proof, printed pp.65–66; the local Ext calculation is Lemma 4.13, pp.59–60. Only the lattice case and the stated three terms are new adapters.

### 3.9c The type boundary, locally constant Brauer classes and the invariant sum

Prove `typeBoundary_brauerPairing`. Let X/k satisfy §3.9a, let X(𝔸_k) be nonempty, and let λ:M→Pic X_k̄ be a Galois-equivariant type. Its boundary δ(λ) lies in Sha²(k,T). For `a∈Sha¹(k,M)`, the class λ_*a in H¹(k,Pic X_k̄) has an algebraic Brauer representative b, since H³(k,𝔾_m)=0. Its local restrictions are constant classes, and
`⟨δ(λ),a⟩=Σ_v inv_v b(x_v)`
with the boundary and cup-product conventions fixed together. The right side is independent of the adelic point and of the representative modulo Br k. Consequently, if X(𝔸_k)^{Br₁} is nonempty, δ(λ)=0 for every such λ; in particular the universal type is represented when its Picard lattice is finite free.

The local point x_v splits H²(k_v,T)→H²(X_kv,T), so the boundary vanishes locally. For the comparison use the triangle `𝔾_m→τ≤1 Rπ_*𝔾_m→Pic X_k̄[−1]→𝔾_m[1]`, or equivalently its shifted version with Pic in degree zero. The character type maps M into the last term, and the composite with the connecting morphism represents δ(λ). Spread these data to a sufficiently small arithmetic open U and lift the locally trivial a to compact support. Composition with the connecting morphism gives a class in H³_c(U,𝔾_m). Compute the same connecting morphism on the cone of global-to-local cochains: choose a global Brauer representative and the local constant representatives obtained by evaluation at x_v; the cone boundary is their tuple modulo the global Brauer image. Its trace is the sum of local invariants. Changing a compact-support lift contributes a local term whose product with the locally split boundary is zero. At the real places the identical cone calculation uses the complete Tate complex; its boundary and invariant map are the existing arithmetic compact-support ones. Thus the comparison follows from a diagram of these explicit triangles and the global Brauer sequence, without assuming that the ordinary, unmodified real-place complex computes compact support.

APIs: `typeBoundary_locallyTrivial`, `typeBrauerClass_of_shaOne`, `typeBrauerClass_localConstant`, `typeBoundary_brauerPairing`, `typeBoundary_zero_of_brauerOneAdeles`. **Checks:** a rational point makes δ(λ) zero before duality is applied; a pointless conic need not have an adelic point, and the local-solubility hypothesis cannot be used there; for split T the degree-two Sha group vanishes; the equality concerns Sha¹(k,M), whereas lifting a point through an already existing torsor tests all H¹(k,M) as in §3.10. *Needs:* §§3.9a–3.9b; §2.16; ArithmeticGaloisDuality D7.5's compact-support cone and trace; ClassFieldTheory Layer 10. Sources: [Harari–Skorobogatov, Descent theory for open varieties](https://www.ma.imperial.ac.uk/~anskor/HS_ANT.PDF), December 8, 2010 manuscript, Theorem 3.5 and proof, pp.17–18, and Corollary 3.6, pp.18–19; [Harari–Szamuely, Local-global principles for 1-motives](https://www.imo.universite-paris-saclay.fr/~jean-louis.colliot-thelene/07Harari_Szamuely.pdf), Lemma 3.1 and Proposition 3.3 with proof, printed pp.537–541. The latter writes out the cone verification for totally imaginary fields; the real-place adapter above uses the complete complexes already owned by ArithmeticGaloisDuality.

### 3.10 Descent under tori and the algebraic Brauer group

Prove `TauCeti.brauerOne_set_eq_universalTorsor_union`. Let X be smooth geometrically integral over a number field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank. If X is moreover proper, every adelic point orthogonal to Br₁ X lifts to the adelic points of some universal torsor: X(𝔸)^{Br₁} = ⋃_{Y universal} f_Y(Y(𝔸)). More generally, for a torsor f : Y → X under a torus T and A ⊇ the cup products H¹(k, T̂) ∪ [f] in Br X, every point of X(𝔸)^A lifts to Y^σ(𝔸) for some σ.

X smooth geometrically integral over a number field; the hypotheses on units and Pic for the §3.9 (Universal torsors and torsors of a given type) statement.

([Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Proposition 2.5 and proof, p. 10, citing Harari–Skorobogatov 2013 Theorem 8.4 and Proposition 8.12.)

For an existing torsor, let ξ_v=[Y_xv]∈H¹(k_v,T). Spreading the torsor and the adelic point gives a tuple in P¹(k,T). Evaluating the cup product a∪[Y] at x_v gives a_v∪ξ_v. Thus orthogonality to all the stated cup products says exactly that the functional on H¹(k,T̂) of §3.9b is zero. Its exact localization sequence supplies σ∈H¹(k,T) with these local restrictions. In the inverse-twist convention Y^σ has trivial local fibres. Integral lifts outside a finite set follow from Lang's theorem and smooth Hensel lifting, giving an adelic lift rather than only unrelated local lifts. For the universal statement, §3.9c first proves existence of a universal torsor from Br₁-orthogonality; the cup products for its identity type then exhaust the image H¹(k,Pic X_k̄), so the same argument gives the asserted union. Conversely, naturality and reciprocity show that every lift is Br₁-orthogonal. The obstruction to lifting through an existing torsor is this localization functional; the class in Sha²(k,T) is the obstruction to existence of a type.

Harpaz–Wittenberg 2020 Proposition 2.5 states the case used there.

**Checks.**

- For X = ℙⁿ both sides are X(𝔸).

*Needs:* §§3.9a–3.9c; §3.5; §2.16; §2.13; SchemeAndStackFoundations smooth Hensel lifting; §3.8b for integral adelic lifts, using ReductiveGroupsPartII RG2.3. Source for the existing-torsor localization argument: Harari–Skorobogatov, December 8, 2010 manuscript, Proposition 3.1 and proof, p.14.


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

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-5-twists-aec-x2-x5); [TauCetiRoadmap.EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-7-selmer-groups-and-sha-aec-x4); §3.1 (Evaluation of torsors and twisted torsors).


### 3.17a Abelian local conditions and the Cassels–Tate construction

Let K be a number field and A/K an abelian variety, with dual A∨. Define `AbelianCasselsTate.pairing : Sha(K,A) × Sha(K,A∨) → ℚ/ℤ`. No finiteness of Sha is assumed. Use the native torsor/H¹ carrier of §1.3, the Poincaré bundle of AbelianSchemesAndArithmeticModuli §A2.2, and the Weil pairing `A[n] × A∨[n] → μ_n`, for n>0. Define the finite local condition `KummerLocal(A,n,v)` to be the image of `A(K_v)/nA(K_v)` in `H¹(K_v,A[n])`. At finite places the two dual Kummer conditions are exact annihilators: apply ArithmeticGaloisDuality §D7.6's local abelian duality to the multiplication-by-n sequence and its dual. At a complex place H¹ is zero. At a real place use Tate cohomology, retaining the two-primary term: complex uniformization `0→Λ→Lie(A)(ℂ)→A(ℂ)→0`, its conjugation action, and the vanishing of finite-group cohomology on the real vector space identify π₀(A(ℝ)) and H¹(ℝ,A) with the successive Tate groups of Λ. The integral Poincaré pairing identifies the dual lattice, with its conjugation twist. The two-periodic complex with maps `1−c,1+c` and its dual prove the same annihilator statement. In particular connected real points contribute no Kummer class. This real calculation is an adapter, not an application of the nonarchimedean statement to ℝ.

Construct the global pairing first from the torsor X representing a∈Sha(K,A). Translation acts trivially on Pic⁰, so `Pic⁰(X_Ks)=A∨(K^s)` independently of a chosen geometric origin. Put Q=`K^s(X)^×/(K^s)^×`. The sequences from units to rational functions to principal divisors, and from principal divisors to algebraically trivial divisors to Pic⁰, send a′∈Sha(K,A∨) to q∈H²(K,Q). Here algebraically trivial divisors are used; a numerical degree-zero condition is inappropriate in higher dimension. Since H³(K,G_m)=0, lift q to H²(K,K^s(X)^×). Its local restriction lifts from Br(K_v), because a′_v=0. A local point makes Br(K_v) inject into Br(K_v(X)), so this local constant is unique. Sum its local invariants. A different global lift differs by Br(K), whose invariant sum is zero. Changes in divisors and trivializations give coboundaries or this same global constant. Spreading out all the finitely presented choices makes the local constants unramified at almost all finite places; their invariants then vanish. This constructs a finite, choice-independent sum.

Include the finite-coefficient comparison used for its kernel theorem. For a,a′ killed by n, choose Kummer cocycles β,β′ and a cochain lift β₁ to A[n²]. At each place choose a cocycle lift β_{v,1} arising from A(K_v). The difference of the global and local lifts has values in A[n]. The Weil cup of dβ₁ with β′ is a three-cocycle; choose its primitive ε using H³(K,G_m)=0. With the convention `c_v=β₁|_v−β_{v,1}`, the local two-cocycle is `c_v∪β′|_v−ε|_v`, since its differential is zero. Fix the overall sign by the preceding rational-function construction. Compare the two constructions by lifting the Poincaré biextension through the multiplication sequences: the two connecting homomorphisms are the divisor boundary and the Weil cup; their cochain homotopy gives precisely the ε term. This also proves compatibility when n is replaced by a multiple. Omitting ε, or switching the difference without its primitive, does not define a cocycle.

The API `pairing.add_left`, `add_right`, `independentChoices`, `finiteSupport`, `finiteCoefficientFormula`, `isogenyAdjoint` gives bilinearity, independence, the finite sum, and `CT_B(f_*a,b)=CT_A(a,f∨_*b)` for every isogeny f:A→B. Do not assert alternation for an arbitrary principal polarization. Alternation applies when the polarization is induced by a K-rational divisor; its translated divisor cocycle lifts to divisors, making the relevant boundary zero. (Milne, *Arithmetic Duality Theorems*, I, Proposition 6.9 and Remarks 6.10–6.12, pp.78–82; the real-place interpretation is I, §3, Theorem 3.7, pp.45–46; Stoll, *Finite descent obstructions*, preceding Lemma 7.5, p.31.)

**Checks.**

- A trivial torsor has pairing zero with every dual class, for any choice of local points; a global constant changes each local invariant but not their sum.
- For A=E over a real place and n odd the real Kummer quotient is zero; for n=2 an elliptic curve with two real components has a nonzero component contribution. Dropping all infinite places fails this check.
- For a local lift with dβ₁ nonzero, differentiating `c_v∪β′−ε_v` gives zero. A formula containing only the cup, or the opposite difference with the same ε, fails the cocycle identity.

*Needs:* §1.3; §2.13; AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, A3.2 and A5.1; SchemeAndStackFoundations §2.15 and §2.22; ArithmeticGaloisDuality §§R02.4.2–R02.4.3 and D7.6; ClassFieldTheory Layers 5 and 10.

### 3.17b Divisibility detected by the dual Sha

Prove `AbelianCasselsTate.annihilator_nTorsion`: for every n>0, the annihilator in Sha(K,A) of Sha(K,A∨)[n] is exactly n Sha(K,A). Consequently the left and right kernels of the full pairing are the maximal divisible subgroups, and the pairing on the reduced p-primary groups is perfect and finite for every prime p. This conclusion does not assume that the whole Sha is finite, or that its divisible subgroup vanishes.

Own the required intermediate target `KummerLocal.globalPlusLocal`: a tuple in `∏_{v∈S}H¹(K_v,A[n])` annihilates the restrictions of the dual n-Selmer group exactly when it is a sum of a global H¹(K_S/K,A[n]) class and a tuple of local Kummer classes. Choose S finite containing bad, archimedean and n-adic places. Apply finite-module Poitou–Tate to the dual localization diagram and the exact annihilators in §3.17a; exactness of the dual Selmer restriction diagram gives this sum, rather than asserting it as part of abelian duality.

For a∈Sha, the multiplication sequence gives its global n-divisibility obstruction in `Sha²_S(K,A[n])`. Finite Poitou–Tate pairs this group perfectly with `Sha¹_S(K,A∨[n])`. Its image in Sha(K,A∨)[n] gives the corresponding finite-coefficient Cassels–Tate value, by §3.17a. Thus annihilation first makes a globally n-divisible. Choose a global n-division a₁ of a. All its local failures are n-torsion and have finite support. The local comparison formula shows that these failures annihilate the dual Selmer group. Apply `globalPlusLocal` to subtract a global A[n]-class and remove the local failures. The corrected division lies in Sha. The converse follows by bilinearity. This two-stage argument distinguishes divisibility in H¹(K,A) from divisibility in Sha.

By §1.5, Sha[p] is finite. Own the elementary group lemma that a p-primary torsion group G with finite G[p] is a direct sum of finitely many Prüfer groups and a finite group. For each element in every p-power image, the p-division tree has finite branching, since each fibre is a coset of G[p]; König's lemma produces a compatible division chain. Thus the intersection of the p-power images is divisible. Extract and split the resulting Prüfer summands, using injectivity of divisible abelian groups; their number is bounded by dim G[p]. If the remaining group had unbounded exponent, the finite set of nonzero order-p roots and König's lemma would give a further Prüfer subgroup, a contradiction. A bounded-exponent group with finite G[p] is finite by induction on the exponent. Hence `G_p ≃ (ℚ_p/ℤ_p)^r ⊕ F` with F finite, and `⋂_m p^mG_p` is its maximal divisible subgroup. Apply `annihilator_nTorsion` for p^m and interchange A,A∨. The two injections into the dual finite reduced groups, together with A≃A∨∨, force equal orders and perfectness. (Milne, I, Theorem 6.13(a), Lemmas 6.15–6.17 and the concluding diagram, pp.82,86–89.)

**Checks.**

- A nonzero element of a ℚ_p/ℤ_p summand pairs trivially with every finite-order dual element. A statement of unconditional nondegeneracy on Sha fails.
- If a∉n Sha, the target produces a dual class killed by n with nonzero value; when n=1 there is no such a and the annihilator is all Sha.
- For a finite cyclic reduced group of order p², the order-p dual classes detect divisibility by p, and order-p² classes detect zero. Testing only Sha[p] cannot prove the full kernel theorem.

*Needs:* §§1.3,1.5,3.17a; ArithmeticGaloisDuality §§R02.4.3 and R02.5; Mathlib's König-lemma and injective-module interfaces over ℤ, with the elementary torsion-group argument just stated.

### 3.17c Brauer evaluation on an abelian torsor

For an everywhere locally soluble A-torsor X, define `BrauerPic0(X)` as the inverse image under the Hochschild–Serre edge map `Br₁(X)→H¹(K,Pic X_Ks)` of the image of H¹(K,A∨). Define `BrauerPic0_n(X)` using the image of H¹(K,A∨)[n], not the n-torsion of Br(X) itself. Every β∈Sha(K,A∨) has a representative b in this subgroup, since H³(K,G_m)=0. For every adelic P on X, prove `BrauerManin.pairing P b = AbelianCasselsTate.pairing [X] β`, with the common sign convention of §3.17a. In particular this value is independent of P. A representative is determined only up to a constant class and any kernel of the Pic⁰-to-Pic map; neither changes this invariant sum.

The proof uses the rational-function construction of §3.17a. Choose the global lift to be the image of b in H²(K,K^s(X)^×). Because β is locally trivial, b_v is constant on X_v. Evaluation at P_v is its unique lift from Br(K_v). Its invariant sum is therefore exactly the construction of CT. For general β, comparing evaluations at two local points gives the local Tate pairing with their difference in A(K_v), by ArithmeticGaloisDuality §D7.6's gerbe evaluation normalization. This is a local difference statement, not independence from P for every H¹(K,A∨) class. (Milne, I, Remark 6.11, pp.80–81; Stoll, preceding Lemma 7.5 and the local comparison, pp.31–33.)

The API `BrauerPic0.contains_constants`, `BrauerPic0_n.mono_dvd`, `representsSha`, `evalSha_eq_CT`, `eval_difference_eq_localTate`, `constantChoice_independent` records the subgroups, divisibility inclusion, existence of representatives and both comparisons.

**Checks.**

- On X=A, [X]=0, so a Sha-derived Brauer class has invariant sum zero at every adelic point even when its individual local evaluations are nonzero constants.
- Adding a constant Hamilton class over ℚ gives invariant 1/2 at 2 and ∞ and zero elsewhere; the sum remains unchanged. Retaining only one of those places fails.
- If CT([X],β)≠0, the corresponding single b obstructs every adelic point. A comparison restricted to Br(K), whose sums are always zero, cannot pass this check.

*Needs:* §§2.13,2.16,3.17a–3.17b; SchemeAndStackFoundations §2.15 (Hochschild–Serre with constant units) and §2.22 (Brauer pullback); ArithmeticGaloisDuality §D7.6; ClassFieldTheory Layer 10.

### 3.17d Multiplication coverings and the Pic⁰ Brauer obstruction

For an A-torsor X over a number field and n>0, prove `X(A_K)_bullet^nCover = X(A_K)_bullet^BrauerPic0_n`. The left side is the union of the adelic images of all n-coverings Y→X, where Y is an A-torsor and the map is equivariant for [n]; it is empty if no covering exists. Replace real and complex factors by their connected components in the modified adelic space; equivalently state the equality on the ordinary space by taking the inverse images. This convention is compatible with §§2.11–2.13 and local Kummer evaluation.

If there is no everywhere locally soluble n-covering, then [X]∉n Sha(K,A), provided X is locally soluble. Section 3.17b gives β∈Sha(K,A∨)[n] with nonzero CT value, and §3.17c gives a Brauer obstruction. If there is a locally soluble covering Y, choose Q∈Y(A_K). For P∈X(A_K), its fibre classes `d_Y(P_v)∈H¹(K_v,A[n])` form a restricted-product tuple, using good integral models outside a finite set. It comes from a global class exactly when some inverse twist of Y lifts P. Finite-module Poitou–Tate, with S increasing over all finite sets, says that this occurs exactly when the tuple annihilates all global H¹(K,A∨[n]) classes. This is the all-place restricted product assertion; do not replace it by a finite Selmer-group assertion without fixing the outside-S local condition.

A change of covering adds a global class and hence has zero effect on the invariant sum. A change of lift of β∈H¹(K,A∨)[n] adds a Kummer class from A∨(K), annihilated by every local Kummer condition. Compare the cup value with `b(P_v)−b(π(Q_v))` by the local evaluation adapter in §3.17c. The sum at π(Q) is zero: pullback on Pic⁰ is [n], so π*b is constant and global reciprocity applies. This proves both directions. Intersect over n to obtain the all-multiplication-covering equality. For a genus-one curve, Tsen gives geometric Br=0 and `NS(C_Ks)=ℤ`, whose H¹ is zero; hence Br(C)=BrauerPic0(C). If Sha(E/K)_div=0, any nonzero [C] is detected by §3.17c, so `C(A_K)^Br≠∅` implies C(K)≠∅. Finite Sha is a sufficient hypothesis for this conclusion. (Stoll, Theorem 7.2, Corollary 7.3, Lemmas 7.5–7.6 and Theorem 7.7, pp.29–34.)

**Checks.**

- For n=1 the covering is X itself and BrauerPic0₁ consists of constants, so both sets are the whole adelic space.
- A nonzero torsor class not in 2 Sha has an empty two-covering set and a single Pic⁰-derived two-primary Brauer obstruction, without any finiteness assumption on Sha. This is the comparison required for Sel₂(J¹)=∅.
- A global twist changes the fibre tuple by a global localization class and preserves every invariant sum. A locally chosen tuple that fails global Poitou–Tate orthogonality cannot be declared a global twist.

*Needs:* §§1.12,2.11,2.13,3.1–3.3,3.17a–3.17c; ArithmeticGaloisDuality §R02.4.3; SchemeAndStackFoundations §2.15 and its Tsen/curve Picard targets.


### 3.18 Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction

Prove `TauCeti.bgw_hasse_failures`. For hyperelliptic curves C : y² = f(x) over ℚ of genus g ≥ 1 (deg f = 2g + 2), ordered by height: for fixed g a positive proportion of everywhere locally soluble C have J¹(ℚ) = ∅ with a Brauer–Manin obstruction on the g-dimensional variety J¹ (Bhargava–Gross–Wang Theorem 10); for fixed odd k > 0 the proportion of locally soluble C for which Sym^k(C) fails the Hasse principle tends to 1 as g → ∞, and the failure is a Brauer–Manin obstruction (Corollary 9, Theorem 11).

Density statements for the family of locally soluble hyperelliptic curves ordered by the height of f.

([A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/abs/1310.7692v2), Corollary 9, Theorems 10–11, p. 3.)

Sel₂(J¹) = ∅ (§1.14 (The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k)) gives a descent obstruction by the J[2]-torsor of §1.12 (Two-coverings of torsors and the class W[2]); §3.17d identifies the two-covering obstruction on the abelian torsor J¹ with the obstruction from BrauerPic0₂(J¹). In particular §3.17b detects [J¹]∉2 Sha(J) by a dual class killed by two, and §3.17c realizes its nonzero value by a Brauer class. No finiteness of Sha is used. Functorial pullback along Sym^k(C)→Pic^k(C) transfers this obstruction for odd k, for which the Picard-torsor class is the same odd multiple of [J¹]. The general inclusion in §3.6 alone does not prove this direction.

The density statements are the averaging theorems of Bhargava–Gross–Wang, imported as stated.

**Checks.**

- For g = 1, J¹ ≅ C and Theorem 10 gives a positive proportion of locally soluble genus-one curves with no rational point.

*Needs:* §1.14 (The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k); §1.12 (Two-coverings of torsors and the class W[2]); §3.5 (Descent obstruction sets); §3.6 (Descent is at least as strong as Brauer–Manin); §§3.17a–3.17d (abelian duality and the multiplication-covering comparison).


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

k global; f finite étale of degree > 1; the adeles away from S. For function fields the assertion requires the analogous adelic-space construction for global fields. Section 2.3a supplies the global-function-field model and restricted-product extension; the general smooth-affine Selmer-finiteness input remains the separate requirement of §3.3b.

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

Layers 1–2; SchemeAndStackFoundations §§1.15–1.17,2.3,2.15,2.22,3.6; ArithmeticGaloisDuality Layer R02.4 for torus duality; EllipticCurves Layers 5 and 7 for the pointed-twist and Weil–Châtelet comparison. Sections 3.17a–3.17d construct the abelian Cassels–Tate/Brauer comparison. Connected-cover comparison, the type obstruction and compensating auxiliary places are distinct requirements, stated above.



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

*Needs:* SchemeAndStackFoundations §§3.1–3.7, with the stated Picard and curve contracts; SchemeAndStackFoundations §4.13 for curves; arbitrary-dimensional compactification is the additional contract above; NeronModelsAndSemistableAbelianVarieties §6.5 for elliptic equations only; SchemeAndStackFoundations §§3.1–3.3 and TauCetiRoadmap.StableReduction Layer 2 for general curves.


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


### 4.7a The normalized number-field product Subspace theorem

Prove `numberField_productSubspace`. Let K be a number field, n≥2, S a finite set of places, and for each v∈S let L_{1,v},…,L_{n,v} be independent K-linear forms on K^n. Use absolute normalized local values `|a|_v=|a|_{v,genuine}^{[K_v:ℚ_v]/[K:ℚ]}` and `‖x‖_v=max_i |x_i|_v`; thus H(x)=∏_v‖x‖_v is the absolute multiplicative projective height. For ε>0 the nonzero K-vectors satisfying
`∏_{v∈S}∏_{i=1}^n (|L_{i,v}(x)|_v/‖x‖_v) < H(x)^(−n−ε)`
belong to a finite union of proper K-linear subspaces. In particular the conclusion is invariant under rescaling x. No extra Galois-conjugate condition is imposed on K-rational points.

Derive this from DiophantineApproximationAndTranscendence §2.8 `absoluteParametricSubspaceTheorem` and its finite exponent partition, with its twisted height from §2.5. This keeps the coefficient constants; directly assigning nonpositive exponents in `absoluteSubspaceTheoremForSystems` can fail when some normalized linear-form values exceed one.

If S is empty there are no solutions since H≥1. Otherwise the normalization calculation is as follows. Points where a form vanishes already belong to one of finitely many proper hyperplanes, so assume all values positive and H>1. Write R_{iv}=|L_{iv}(x)|_v/‖x‖_v and choose B_v≥1 with every R_{iv}≤B_v, using the coefficient norms and the archimedean triangle factor. Set y_{iv}=−log(R_{iv}/B_v)/log H≥0. The product inequality implies Σy>n+ε. The finite partition lemma, with γ=(n+ε/2)/(n+ε), gives finitely many fixed vectors a_{iv}≥0 of total n+ε/2 such that some a satisfies a_{iv}≤y_{iv}. Thus R_{iv}≤B_v H^(−a_{iv}). Put λ=1+ε/(2n), Q=H^λ, and
`c_{iv}=(n⁻¹Σ_j a_{jv}−a_{iv})/λ` on S,
with coordinate forms and zero weights elsewhere. Each local weight sum is zero and Σ_v max_i c_{iv}≤1. Consequently the supplier's twisted height satisfies
`H_{L,c,Q}(x) ≤ (∏_{v∈S} B_v) H^(−ε/(2n)) = C Q^(−ε/(2n+ε))`.
Retain `Δ_L=∏_{v∈S}|det(L_{1,v},…,L_{n,v})|_v>0`. With δ=ε/(2(2n+ε)), enlarge the threshold so that C Q^(−2δ)≤Δ_L^(1/n)Q^(−δ), and apply the parametric theorem for each of the finitely many c. All forms and weights have finite support, all local systems are independent, and the weights meet its normalization hypotheses. The remaining bounded-height projective K-points are finite by §0.14 and each is covered by its K-line, proper because n≥2. This proves the product statement for arbitrary K while retaining the determinant and local-degree factors.

The exact supplier is Evertse–Ferretti, [A further improvement of the Quantitative Subspace Theorem](https://arxiv.org/abs/1008.2340v1), §2.3, Theorem 2.1, p.10; the finite exponent partition is the target at the end of DiophantineApproximationAndTranscendence §2.8. Corvaja–Zannier, [A subspace theorem approach to integral points on curves](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf), proof of Theorem 1, pp.268–270, uses precisely the resulting number-field, place-dependent product inequality.

The API is `numberField_productSubspace`, its homogeneous rescaling corollary, and the restriction to projective K-points. It is an existence theorem and asserts no algorithm for its exceptional subspaces.

**Checks.**

- A point on L_{i,v}=0 is covered by that proper hyperplane, even when it has arbitrarily large height.
- At n=1 a nonzero point spans the whole space; the finite-union-of-proper-subspaces statement is deliberately excluded.
- Over K=ℚ(i), an ordinary complex modulus has local weight one; using its square without dividing by [K:ℚ] would change H and the exponents.
- Multiplying a local form by a large scalar changes B_v and Δ_L and hence the threshold. It does not justify discarding those constants in an inequality system.

*Needs:* §§0.11,0.14; DiophantineApproximationAndTranscendence §§2.5,2.8 (parametric theorem and finite partition); normalized number-field places.

### 4.8 Siegel's theorem on integral points

Prove `TauCeti.Curve.finite_integralPoints`. Let K be a number field, S a finite set of places containing the archimedean ones, and X an affine curve over K with smooth projective completion X̄ of genus g. If g ≥ 1, or g = 0 and X̄ ∖ X has at least three geometric points, then 𝒳(O_{K,S}) is finite for every model 𝒳. The theorem is ineffective in general.

X affine, geometrically irreducible; the boundary counted over K̄.

([La conjecture de Mordell (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Théorème [Si] (Siegel), p. 84; [A subspace theorem approach to integral points on curves](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf), Main theorem (C. R. Math. Acad. Sci. Paris 334 (2002), 267–271).)

Reduction: by Chevalley–Weil, replace X by an unramified cover (pulled back from multiplication on the Jacobian when g ≥ 1) and K by a finite extension, so that the boundary has at least three points defined over K.

Corvaja–Zannier, pp.267–271: choose V_N of functions with poles bounded by N times the boundary. Riemann–Roch gives its dimension and bases with controlled vanishing at each boundary point. For each v∈S choose the relevant boundary point and its basis, then apply the number-field S-adic Subspace Theorem to these systems of independent linear forms. The pole/vanishing inequality confines integral points to finitely many proper linear sections; on a curve each section is finite. The rational-only product form is insufficient; use §4.7a, derived from DiophantineApproximationAndTranscendence §2.8.

Genus 0 with three boundary points is the S-unit equation (DiophantineApproximationAndTranscendence §2.8).

**Checks.**

- The S-unit equation u + v = 1 in units of ℤ[1/2] has exactly the three solutions (2, −1), (−1, 2), (1/2, 1/2).

*Needs:* §4.7 (S-integral points on affine curves); §4.2 (The Chevalley–Weil theorem); DiophantineApproximationAndTranscendence §2.3 for the rational specialization; DiophantineApproximationAndTranscendence §2.3 for rational S-unit equations; §4.4 (The Kodaira–Parshin construction); §4.7a, the number-field product-form adapter of DiophantineApproximationAndTranscendence §2.8.


### 4.9 The Mordell conjecture over function fields

Prove `TauCeti.Curve.isotrivial_of_infinite`. Let K be a function field with field of constants k (K = k(V), k algebraically closed in K) and X a regular projective geometrically integral K-curve of genus > 1 with X(K) infinite. If char k = 0, X is constant (X ≅ Y_K for a k-curve Y); if char k = p > 0, X is isotrivial (constant after a finite extension of K). Constant curves over ℂ(t) and Frobenius twists over 𝔽_q(t) show that the hypotheses cannot be dropped.

K a function field with constant field k; X of genus > 1.

([Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.2, Examples 9.5.3–9.5.5, Definitions 9.5.6–9.5.8 and Theorem 9.5.10, pp. 287–288.)

For smooth curves, §§4.9a–4.9b own the jet-contraction, horizontal-field and Frobenius-descent route. Section 4.9b also handles a regular curve of geometric genus≥2 and rules out genus decrease when it has infinitely many points. Section 4.9c gives the finite-constant-field genus-change argument. The full statement over arbitrary constants with geometric genus zero or one also requires the genus-change inputs specified in §4.9c. Those inputs are not consequences of number-field Northcott or of Lang–Néron.

**Checks.**

- For K=ℂ(t) and X=(X₀)_K, the set includes the infinite X₀(ℂ).
- Over 𝔽_q(t), the twist f(t)y²=f(x), with f separable of odd degree≥5 and q odd, has the Frobenius points (t^{q^n},f(t)^{(q^n−1)/2}); it need only be isotrivial.
- In characteristic p>3 the regular model of y²=x^p−t has genus (p−1)/2 but geometric genus zero; smooth-curve descent cannot be used on that model without the genus-change argument.

*Needs:* §§4.9a–4.9c; their stated genus-change prerequisites in the nonsmooth geometric-genus-zero-or-one case.

### 4.9a Jet contraction and bounded nonhorizontal sections

Own `SectionJet(π)` for a smooth proper family π:C→S of geometrically connected curves of genus g≥2 over an algebraically closed field k, with S smooth integral affine: its fibre at x is the affine space of splittings of T_xC→T_{π(x)}S. It is a torsor under Hom(π*T_S,T_{C/S}). Its API includes projection to C, affine-bundle coordinate changes, the differential jet j(s) of a rational section, restriction to an open base, and the condition that a jet lies in a prescribed closed subspace. Checks: a product family's constant sections have the zero horizontal jet; adding a relative tangent homomorphism preserves the splitting condition; the derivative of a section composes to the identity on T_S, whereas an arbitrary tangent vector does not define a jet.

Prove `sectionJet_contraction`: after shrinking S, there is a proper map Φ:SectionJet(π)→S×𝔸^m whose positive-dimensional fibre locus E is proper over C, disjoint in image from its complement, and whose restriction off E is an isomorphism onto its image. On a curve fibre, E is either empty or maps radicially and surjectively to that curve. Projectivize the affine bundle and call its infinity divisor D. The normal bundle of D on a fibre is Ω_C⊠O(1), which is ample since 2g−2>0. Lift sections of its large powers to O(lD): the exact restriction sequences and coherent higher direct images make the successive H¹ quotients stabilize, giving surjective restriction for sufficiently large l. Include the section 1 of O(lD), whose divisor is lD. The resulting projective morphism restricts to a proper map of the affine complement to affine space. Add finitely many generators of its direct-image algebra; formal functions and Zariski's main theorem then separate the zero-dimensional fibres and isolate the positive-dimensional ones. For a nonempty complete locus in a fibre, pull the affine torsor back to that locus. Its tautological section trivializes the torsor. A finite pullback of the negative bundle Hom(T_sS,T_C) has only its zero section as a positive-dimensional complete locus, so each geometric fibre of E→C contains one point. This assertion uses negativity on a curve, rather than a negativity assertion for an arbitrary base variety.

Prove `finite_nonhorizontal_sections`: only finitely many rational sections s have j(s) not contained in E. Fix a normal projective compactification of S. Properness extends s at every codimension-one point, and its derivative extends in the ambient projective-space jet bundle. Clear the denominators of Φ by one fixed function near each boundary divisor. Thus Φ∘j(s) lies in a fixed finite-dimensional space V=H⁰(S̄,O(D₀))^m, independently of s. This is bounded dimension, not a finite set of functions over an infinite k. The locus of parameter functions admitting a jet is algebraic, by the proper image of the incidence Φ(y)=v(π(y)). Except for the single parameter function given by Φ(E), invert Φ off E and impose j(s)=the resulting jet; this is an algebraic condition on the parameters. A positive-dimensional parameter locus would contain a curve Q. Complete Q and extend the associated rational family at the generic points needed by properness. For every fixed base point where it is defined, its composite with Φ is a regular function on the complete Q, hence constant. Its coordinates in V are therefore constant, contradicting variation of the parameter. The parameter locus has dimension zero and is finite. Checks: the product family can have infinitely many horizontal constant sections; the estimate does not assert that H⁰(O(D₀)) is finite over an infinite field; all rational sections on a smooth curve base extend over its proper smooth compactification in the proper ambient family.

Sources: Grauert, [*Mordells Vermutung über rationale Punkte auf algebraischen Kurven und Funktionenkörper*](https://www.numdam.org/item/PMIHES_1965__25__131_0.pdf), §1.1–§1.5, pp.132–137, §2.1–§2.3, pp.137–140, and §3, Theorems 1–4 and their proofs, pp.140–142. *Needs:* SchemeAndStackFoundations T380–T381, formal functions and Stein factorization, its Zariski-main and coherent-cohomology targets, and Tau Ceti StableReduction Layer 2, dualizing bundles on smooth curves. The contraction and the finite-parameter rigidity argument are owned here.

### 4.9b Horizontal fields, Frobenius descent and constant curves

Prove `horizontalJet_is_section`: infinitely many sections whose jets lie in E imply that E→C is an isomorphism. Locally its radicial equations are y_i^{p^{a_i}}+b_i=0. If a_i>0, differentiate along those sections. The differential of b_i is nonzero, since otherwise the local irreducible equation would be a p-th power. The resulting linear equations in the splitting coordinates determine a section on a nonempty open locus. Infinitely many distinct sections are dense in the total curve family, forcing those equations to describe E generically. Its purely inseparable degree is then one. In characteristic zero a finite radicial map of these smooth varieties is already generically an isomorphism; the same local argument identifies the regular section. This gives the unique horizontal splitting field, and all but finitely many rational sections are tangent to it by §4.9a.

Prove `horizontalCurve_descends`: take a sufficiently large pluricanonical embedding of a smooth genus≥2 curve and choose N+2 of these point sections as a projective frame. Normalize their images by their unique projective transformation. The splitting identifies the first-order family with a product, so the infinitesimal change of its pluricanonical embedding comes from a projective transformation. Fixing the frame makes that transformation zero. The normalized equations, and the normalized coordinates of horizontal sections, are therefore killed by every k-derivation of K. In characteristic zero the coefficients lie in k; in characteristic p over an algebraically closed constant field they lie in K^p. Repeat over K^p, retaining the infinitely many descended horizontal points, to obtain models over every K^{p^n}.

The stable-curve coarse moduli point is consequently defined over ∩_n K^{p^n}=k. This intersection assertion follows by writing a separating transcendence basis and comparing the p-divisibility of the valuations of a nonconstant function on a normal projective model. The geometric moduli-point property gives a curve over k geometrically isomorphic to C; its finite-type Isom space gives an isomorphism over a finite extension of K. Use SchemeAndStackFoundations T206–T207 for coarse moduli and T398–T399 for the genus≥2 stack and finite unramified Isom spaces. Positive-characteristic finiteness of automorphisms is supplied there, rather than by the characteristic-zero automorphism theorem of Tau Ceti AlgebraicCurves Layer 11. In characteristic zero the normalized projective frame uses K-points; after extending constants to k̄, its normalized equations lie in both K and k̄, hence in k. This also descends the constant curve when k was not algebraically closed. In characteristic p, extension of constants followed by finite presentation descends the geometric isomorphism to a finite extension of K; no assertion that every isotrivial twist splits over K is made.

The rational-point description needed for the nonsmooth case is `constantCurve_points_modFrobenius`. Over an algebraically closed constant field of positive characteristic, a smooth genus≥2 curve with infinitely many points becomes constant over a finite Galois extension. If its geometric isomorphism class is not defined over a finite field, all but finitely many points on that constant model are constant points. In the finite-field case the nonconstant points, over the splitting extension, lie in finitely many orbits of an iterated Frobenius; retain the equivariance condition for the original twist. To prove finiteness of the initial points, first use §4.9a on a product to get finiteness of separable maps to a fixed genus≥2 curve. The stronger Severi assertion is finiteness of its varying genus≥2 separable quotient fields: in transcendence degree one, Riemann–Hurwitz bounds their degrees and genera. Their equivalence correspondences T on C×C satisfy T∘T=mT. The degree-one quotient is unique. For degree m≥2, writing T=Δ+S gives S²<0. If such correspondences moved in a positive-dimensional Chow family, remove their common fixed equivalence part and pass to the quotient curve; the remaining moving correspondence would have nonnegative self-intersection, a contradiction. Fixed degree gives a finite-type Chow parameter space, so its zero-dimensional locus is finite. Induct on the transcendence degree after adjoining algebraically closed constants from a subfield of codimension one. For a constant curve, factor each nonconstant point map through its maximal Frobenius power. Its remaining function field is one of these finitely many separable subfields; its embeddings are finite because genus≥2 automorphism groups are finite. If two different Frobenius exponents give the same subfield, the corresponding Frobenius twists are isomorphic. The coarse moduli point is then fixed by a finite-field Frobenius and descends to that finite field. These are Samuel's Theorems 1–3, pp.56–59, and Theorem 5, pp.60–61; the Chow-correspondence rigidity and varying-quotient assertion are proof targets here, not consequences of finiteness for one fixed target curve.

For a regular geometrically integral curve whose geometric normalization has genus≥2, own `infinitePoints_no_genusDrop`: normalize after a finite purely inseparable extension K′/K and use the preceding smooth theorem. A large divisor of smooth rational points on the original curve and its inverse image give compatible projective embeddings. Split the constant normalization over a finite Galois extension L′/K′; let L be the separable closure of K in L′ and choose q=p^a with (L′)^q⊂L. The rational-point description just given puts all but finitely many normalization points in the image, under the constant-model isomorphism u, of points with coordinates in (L′)^q: constant points have this property, and each of the finitely many Frobenius orbits loses only finitely many initial terms. Choose a projective frame among these constant-model points whose images in the original curve are K-rational. The composite projective map ν∘u is consequently defined over L. The original curve remains normal over the separable extension L/K, so this birational projective map between proper normal curves is an isomorphism. Thus the original curve is geometrically normal, hence smooth, and its genus equals the geometric genus. This assertion does not treat geometric genus zero or one.

Checks: a constant curve over ℂ(t) has infinitely many horizontal points; an isotrivial positive-characteristic twist need not be constant over K; the Frobenius iterates of the generic point of a curve over a finite field give infinitely many points over its own function field, and are not wrongly counted as finitely many nonconstant maps.

Sources: Grauert, §2.3, pp.138–140, and §4.1–§4.2, pp.142–144; Samuel, [*Compléments à un article de Hans Grauert sur la conjecture de Mordell*](https://www.numdam.org/item/PMIHES_1966__29__55_0.pdf), Theorems 1–3 and proofs, pp.56–59, Theorems 4–5 and proofs, pp.59–61, and Theorem 6 and proof, pp.61–62. *Needs:* §4.9a; SchemeAndStackFoundations T206–T207 and T398–T399; Tau Ceti StableReduction Layer 2; the usual finite-type descent, normalization and projective-frame linear algebra. No complex-analytic Manin theorem is an input.

### 4.9c The genus-change case over finite constants

Over a one-variable function field K with finite constant field, prove `nonconservativeCurve_finitePoints`: a regular projective geometrically integral curve whose genus decreases under algebraic extension has finitely many K-points. The required genus tower is C_n with function field K·K(C)^{p^n}; its genera decrease and eventually equal the geometric genus. At the last strict decrease, C_{n−1}→C_n is given by z^p=r. If the final genus is ≥2, use §4.9b. If it is zero, choose a rational point to identify C_n with ℙ¹. Multiply r by a p-th power of its denominator to make it polynomial; this preserves the condition r(a)∈K^p away from the finite excluded set. If its degree n is prime to p and its leading coefficient is a₀, choose m with mn+1≡0 mod p and change x to a₀^m x. The leading coefficient is now a p-th power, so division by it preserves that condition and makes it one. Translate by the negative of the next coefficient divided by n to make the next coefficient zero. With δ=d/dt, a point satisfying r(a)∈K^p has r′(a)δa+r^δ(a)=0. The second polynomial has degree at most deg(r)−2, so δa has poles bounded by a fixed divisor. The finite constant field makes that Riemann–Roch space a finite set. Infinitely many a would force a polynomial r′b+r^δ to vanish identically; comparing leading coefficients gives b=0 and r^δ=0. The degree-divisible-by-p case reduces the degree by inversion about one of the given points and subtraction of its value. The resulting purely inseparable cover is rational, contradicting the strict genus decrease.

If the final genus is one, choose a rational point to make C_n elliptic. Weak Mordell–Weil for Frobenius and Verschiebung makes their rational-point cokernels finite over this global function field. Infinitely many points lie in one such coset; after translation, differentiate r at their p-power coordinates. Its coefficient derivative vanishes identically. The cover is then dominated by an elliptic curve using Frobenius, or its composition with Verschiebung, again contradicting the strict genus decrease. Earlier maps in the genus tower have finite fibres, which propagate finiteness back to C. The genus-tower stabilization is a separate prerequisite; the smooth-curve theorem alone does not supply it.

The argument uses finite constants at the Riemann–Roch-space step. For arbitrary infinite constant fields and geometric genus zero or one, §4.9 additionally requires a theorem replacing that step, with the same regularity hypotheses, and genus-tower stabilization. Voloch's theorem below supplies neither the infinite-constant-field assertion nor its proof. The full scope of §4.9 retains these two prerequisites explicitly.

Checks: y²=x^p−t over 𝔽_q(t), p>3, has relative genus (p−1)/2 and geometric genus zero, so it falls in the genus-change case; a smooth constant curve is conservative and is not covered by this finiteness theorem; replacing a finite constant field by an infinite one makes H⁰(O(D)) a finite-dimensional vector space rather than a finite set, so the finite-value argument fails.

Source: Voloch, [*A Diophantine problem on algebraic curves over function fields of positive characteristic*](https://www.numdam.org/item/BSMF_1991__119_1_121_0.pdf), Theorems 1–3, Remarks 1 and 3 and proofs, pp.122–125; its genus-tower citation is Stichtenoth, *Zur Konservativität algebraischer Funktionenkörper*, J. reine angew. Math. 301 (1978), pp.30–45. *Needs:* §4.9b for geometric genus≥2; §1.10 for finite generation over finite constants and hence finiteness of the isogeny Kummer cokernels; the stated genus-tower stabilization and arbitrary-constant-field genus-change prerequisites.

### Examples

For genus g=2, the pullback of [2] has degree sixteen and genus seventeen. The fully branched double cover has `2g(C_P)−2=16·5=80`, hence genus forty-one. Its branch locus on the original curve is exactly the chosen point. The dyadic exclusion is required for the finite-étale halving argument and smooth double-cover model.

For `ℙ¹\{0,1,∞}`, S-integral points satisfy the S-unit equation u+(1−u)=1 and form a finite set. For `ℙ¹\{∞}` the integral points include all ordinary integers. For `ℙ¹\{0,∞}` they are S-units and can be infinite; these are the one- and two-boundary-point negative controls to Siegel's genus-zero hypothesis. A constant genus-two curve over ℂ(t) has infinitely many constant points, so number-field finiteness does not extend without the function-field constant/isotrivial distinction.



### Dependencies

Layers 0–3; JacobianChallenge Layer F; SchemeAndStackFoundations §§3.1–3.7 and 4.13; TauCetiRoadmap.StableReduction Layer 2; AbelianSchemesAndArithmeticModuli §A3.2; ArithmeticGaloisDuality Layer R02.3; DiophantineApproximationAndTranscendence §2.8 with the normalized number-field product-form adapter. Shafarevich finiteness is the explicit premise of the Parshin implication. Function-field Mordell has its separate proof inputs.



## Layer 5: subvarieties of abelian varieties and small points

Using §1.0’s quotients and the supplier’s abelian-subvariety carrier, construct translation stabilizers and the subgroup generated by X−X. The Ueno locus separates positive-dimensional cosets from isolated arithmetic intersections. Torsion intersections and finite-rank intersections have different hypotheses; the small-point theorem strengthens a height-zero result to a positive threshold. The curve Vojta–Bombieri argument gives the rational-point finiteness declaration used in Layer 4. Equidistribution needs the additional adelic intersection interface, beyond the point metrics of Layer 0.


### 5.1 Abelian subvarieties, cosets and quotients

Use the abelian-subvariety carrier supplied by AbelianSchemesAndArithmeticModuli §A6.3. For B⊆A use §1.0’s quotient abelian variety A/B, allowing B to have positive dimension, and its quotient homomorphism q with kernel B. Define a coset a+B as the closed translate of B, with its scheme structure; a torsion coset is a+B with a torsion modulo B (equivalently, over an algebraically closed field, admitting a torsion representative). The quotient identifies its fibres with these cosets. This extends the finite-kernel quotient contract of §A3.3 by permitting positive-dimensional B.

k any field; cosets are taken over k̄ unless stated.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16; proof of Lemma 5.3, p. 24; [Chow's K/k-image and K/k-trace, and the Lang–Néron theorem](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §3, Theorem 3.7, author copy p.6.)

Use the quotient and its torsor, descent and base-change API from §1.0. Its fibres are precisely the cosets defined here.

Its interface consists of the following operations and laws.

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

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli §§A6.3–A6.5, abelian images and Poincaré complements; SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients.


### 5.2 Stabilizers of subvarieties

For a closed subvariety X of an abelian variety A over k, Stab(X) is the closed subgroup scheme of a ∈ A with a + X = X, and Stab⁰(X) its identity component (reduced), an abelian subvariety. X is a union of cosets of Stab⁰(X) and X/Stab⁰(X) ⊆ A/Stab⁰(X) has finite stabilizer. If X is irreducible and embedded in projective space by a very ample L, deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

X closed in A; for the degree bound X irreducible and L very ample. Use an algebraically closed field of characteristic zero for the scheme stabilizer and its degree bound here. For perfect fields the reduced identity component is smooth; a nonreduced stabilizer in characteristic p cannot be silently replaced in scheme-fibre assertions.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition 6.9, p. 38; proof of Proposition 8.1, p. 47; [Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16.)

Represent the stabilizer by a Hilbert-scheme fibre. The family (a,x)↦(a,a+x) is a closed subscheme of A×A, flat and proper over the first factor because it is isomorphic to A×X. Its classifying map h:A→Hilb(A) uses SchemeAndStackFoundations SF.4 `hilbert-scheme` (T397); the Hilbert polynomial is locally constant in this flat projective family. Define Stab(X)=h⁻¹([X]). Separatedness of the Hilbert scheme makes it closed. Its T-points, including nonreduced T, are exactly translations preserving the ideal of X_T. The action identities give its group law and inversion, and the representing fibre commutes with field extension. An intersection over geometric points alone would not establish this scheme-valued assertion.

Over a perfect field, the reduced identity component B of this group is a subgroup: products of geometrically reduced schemes are reduced, so multiplication and inversion factor through the reductions. Generic smoothness for a reduced variety over a perfect field gives a nonempty smooth open; translations make B smooth everywhere. It is proper and geometrically connected, hence is an abelian subvariety in A6.3's carrier. By the torsor identity in §5.1, the B-invariant ideal of X has effective fpqc descent to a closed subscheme Y⊂A/B and X=q⁻¹(Y). Testing translation after this faithfully flat cover gives Stab(X)=q⁻¹(Stab(Y)); its identity component has been removed, so Stab(Y) is zero-dimensional and proper, hence finite. This retains possible nonreduced finite structure in positive characteristic.

The degree bound: David–Hindry Lemme 2.1(ii) via intersection of finitely many translates (as cited by Gao–Habegger).

Its interface consists of the following operations and laws.

- `TauCeti.AbelianVariety.stab`: Stab(X) as a closed subgroup scheme.
- `TauCeti.AbelianVariety.stab_points`: For every test scheme T, membership means equality of the translated ideal sheaves of X_T.
- `TauCeti.AbelianVariety.stab_baseChange`: The scheme stabilizer commutes with field extension.
- `TauCeti.AbelianVariety.stabZero`: Stab⁰(X), an abelian subvariety.
- `TauCeti.AbelianVariety.add_stab`: Stab(X) + X = X.
- `TauCeti.AbelianVariety.stab_quotient_finite`: The image of X in A/Stab⁰(X) has finite stabilizer.
- `TauCeti.AbelianVariety.stab_quotient_pullback`: X is the scheme-theoretic inverse image of its descended closed image in A/Stab⁰(X).
- `TauCeti.AbelianVariety.degree_stab_le`: deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

**Checks.**

- `stab.test_coset`: Stab⁰(x + B) = B.
- `stab.test_point`: Stab({x}) = 0.
- `stab.test_curve`: For a curve C of genus ≥ 2 embedded in its Jacobian, Stab(C) is finite.
- `stab.test_not_reduced_union`: Stab(X) need not be connected: for X = B ∪ (t + B) with t ∈ A[2] ∖ B, Stab(X) ⊇ B ∪ (t + B).
- Stab(A) = A; Stab({x}) = {0}; for X = x + B, Stab⁰(X) = B.

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); SchemeAndStackFoundations §§1.13–1.17 and 2.3; §1.0 for positive-dimensional abelian quotients; SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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

*Needs:* §5.1 (Abelian subvarieties, cosets and quotients); AbelianSchemesAndArithmeticModuli §A6.3, abelian images; the generated-subvariety construction is in Layer 5; SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


### 5.4 The Ueno locus

For a closed subvariety X of an abelian variety A over an algebraically closed field of characteristic 0, the Ueno locus Z(X) is the union of all positive-dimensional cosets contained in X, and X° = X ∖ Z(X). Z(X) is Zariski closed (Kawamata), so X° is open. (X − P)° = X° − P, and (X')° ⊇ X° ∩ X' for closed X' ⊆ X. The positive-dimensional abelian subvarieties B maximal with x + B ⊆ X for some x form a finite set Σ(X; A) with deg_L B and #Σ(X; A) bounded in terms of dim A and deg_L X (Bogomolov; Rémond), and Z(X) = ⋃_{B ∈ Σ(X;A)} (X_B + B) with X_B = ⋂_{b ∈ B} (X − b) ∩ B^⊥ an intersection over all b∈B. For the degree estimate use the component-selection bound of §5.4a and the simultaneous generic selection of §5.4c, followed by intersection with the polarization-orthogonal complement. The selected translates depend on the carrier; an arbitrary selection of that length is insufficient.

k algebraically closed of characteristic 0; X closed in A. For the quoted uniform degree bound on B^⊥ and X_B, assume X generates A, or replace A by the abelian subvariety generated by X−X. An arbitrary fixed Poincaré complement has no asserted uniform degree bound.

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §7, Lemma 7.4, arXiv:2105.15085v4 pp.43–44; [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), proof of Proposition C.1, p. 61.)

Closedness follows from the owned maximal-direction degree bound and bounded-degree finiteness in §§5.4a–5.4c.

Finiteness and degree bounds follow from the lattice/block-matrix argument of §5.4b and the translate-intersection argument of §5.4a, with the controlled polarization complement of §5.4c.

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

*Needs:* §§5.4a–5.4c; §5.1 (Abelian subvarieties, cosets and quotients); §5.2 (Stabilizers of subvarieties); §5.3 (The abelian subvariety generated by X − X).


### 5.4a Bounded degree of a maximal coset direction

Prove `maximalCoset_directionDegree`. Fix a very ample symmetric L on A, put D=deg_L X≥1 and m=dim X+1, and let x+B⊂X be maximal among cosets through x, with h=dim B. Then deg_L B≤D^((m+1−h)²/4). For a reducible X use the sum of the degrees of its reduced components. Define `CosetCarrier(X,B)={x:x+B⊂X}=⋂_{b∈B}(X−b)` as a reduced closed subscheme. It is B-stable and commutes with extension of algebraically closed fields. Its API is membership, monotonicity in X and reverse monotonicity in B, closedness, B-saturation, and the closed descended carrier in A/B using §1.0. Checks: the carrier for B=0 is X; for X=x+B the carrier is x+B; if X is a point and dim B>0 the carrier is empty.

Take a component V of this carrier through x. B⊂Stab⁰(V), and maximality forces equality. To bound its degree, own the component-selection lemma for intersections of translates: each dimension-e component of ⋂_t W_t, with all W_t translates of a dimension-d variety of degree D, has degree ≤D^(d−e+1). Begin with a component of one translate containing the desired component. Whenever its dimension is too large, choose another translate not containing it and intersect. This lowers dimension; SchemeAndStackFoundations SF.5 T436 bounds the new component degree at each step. Once dimensions agree, the selected irreducible component is the desired one. The lemma does not assert that this selection describes the whole intersection. Apply it first to the carrier and then to Stab(V)=⋂_{v∈V}(V−v): if e=dim V, deg V≤D^(dim X−e+1) and deg B≤(deg V)^(e−h+1). The product of the two exponents is at most (dim X−h+2)²/4. Translation preserves numerical degree by the theorem of the square at AbelianSchemesAndArithmeticModuli A2.3.

Checks for the theorem: maximality is essential, since the whole A contains abelian subvarieties of unbounded degree when A=E²; a maximal zero-dimensional direction has degree one; no finite intersection chosen only by dimension is asserted to equal the entire carrier. Source: Rémond, [*Décompte dans une conjecture de Lang*](https://pazuki.perso.math.cnrs.fr/index_fichiers/Remond00.pdf), Lemma 4.6 and its proof, pp.535–536. *Needs:* §§1.0,5.2; SchemeAndStackFoundations T436 and noetherian components; AbelianSchemesAndArithmeticModuli A2.3.

### 5.4b Finitely many abelian subvarieties of bounded degree

Prove `abelianSubvarieties_boundedDegree_finite`, with a bound depending only on g=dim A, deg_L A, h and δ for the h-dimensional B with deg_L B≤δ. First work over ℂ. Import the lattice realization and integral Riemann form from AbelianSchemesAndArithmeticModuli A5.1–A5.4; in its metric, g!covol(Λ)=deg_L A and h!covol(Λ∩W)=deg_L B. The real metric on Λ need not be integral, so the integral-Gram restriction of IntegralLattices 2F is insufficient on its own.

Own the following real-lattice estimate using the native convex-body theorem. Choose greedy independent shortest vectors u_j, with lengths μ_j, so every lattice vector of norm <μ_j lies in the preceding real flag. Discreteness gives these minima and μ_j≤μ_(j+1). In an orthonormal basis adapted to the flag, stretch the j-th coordinate by μ_j⁻¹. If a nonzero lattice vector has last nonzero coordinate j, its original length is ≥μ_j and all coordinates are stretched by at least μ_j⁻¹; its new length is ≥1. Apply `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` to open balls of radius tending to one. The covolume transformation gives ∏μ_j≤2^n covol(Λ)/vol(B₁). Construct an associated lattice basis v_j with ‖v_j‖≤(3/2)^(j−1)μ_j: in the saturated rank-j flag the projection of a primitive quotient generator has norm ≤μ_j; subtract nearest integral combinations of the earlier v_i. The resulting norm is at most μ_j+½Σ_(i<j)‖v_i‖. This looser basis bound suffices; no equality between a minimum-vector set and a lattice basis is claimed. Its API is the flag, basis bound, product bound, covolume under a linear change, and restriction to a complex rational subspace. Checks: minima are lengths, not squared norms; a nonprimitive shortest-vector span is saturated before choosing its basis; a nonintegral real Gram matrix is allowed.

For the Riemann form E, integrality implies E(u,v)=0 whenever ‖u‖‖v‖<1. Expand its nonzero Pfaffian in the u_j to get a pairing of indices with μ_jμ_partner≥1; uncross the pairing using monotonicity to obtain μ_jμ_(2g+1−j)≥1. Together with the product bound this gives an upper bound on every paired product in terms of g and deg A; the same applies to the minima w_k of Λ∩W with deg B≤δ. Let D₀≥1 bound both sets of paired products. Split the ambient indices at each j≤g with μ_(j+1)>D₀μ_j, and pair these blocks with their opposite indices. Across a split at j, the vectors iv₁,…,iv_j are orthogonal to the first 2g−j flag; the corresponding projection of W is the span of iw₁,…,iw_k, where k counts its minima in the first j flag. The paired-product bounds give ‖w_k‖≤D₀μ_j and control the middle block as well.

Write w_k=Σ_j a_(k,j)v_j. The wedge/covolume formula bounds |a_(k,j)| by C_g‖w_k‖/μ_j. Retain only matrix entries in matching ambient/minimum blocks and set the others to zero. All retained entries are bounded by C_gD₀^(2g+1). This retained matrix determines W: at the first differing minimum vector its difference belongs to the previous ambient flag, whose i-image is already determined by the previous projected minimum vectors; dividing by i gives a contradiction. Thus W injects into integer matrices of size 2h×2g with uniformly bounded entries, proving finiteness and a cardinal bound. This block step is needed because individual μ_j can be arbitrarily small at fixed deg A.

For any algebraically closed characteristic-zero field, a finite family of distinct B, together with A and L, descends to one finitely generated characteristic-zero field, which embeds in ℂ. Distinctness and degree survive this faithful extension. The same uniform complex bound therefore bounds the size of every finite subfamily and hence of the whole collection. Checks: the unique directions at h=0 and h=g are 0 and A; on E² there are infinitely many directions without the degree cutoff; rescaling L changes both degree bounds and the metric, so a fixed metric-independent coefficient bound is not asserted. Source: Rémond, Proposition 4.1, Propositions 4.2–4.3 and Lemmas 4.1–4.5 with their proofs, pp.529–535. The associated-basis and convex-body arguments above replace the stronger basis estimate cited there. *Needs:* AbelianSchemesAndArithmeticModuli A5.1–A5.4; native `IsZLattice`, Haar covolumes and the stated Minkowski theorem; elementary Pfaffian/wedge algebra.

### 5.4c Closed Ueno locus and a controlled orthogonal complement

Sections 5.4a–5.4b give finitely many possible maximal directions Σ. Consequently Z(X)=⋃_(B∈Σ,dim B>0)CosetCarrier(X,B) is closed, and the translation and inclusion laws of §5.4 follow directly. This proves the required closedness without taking a further Ueno fibration theorem as input.

Own `polarizationOrthogonalComplement_degree`. For i:B↪A and λ=φ_L, take C=ker(i^∨λ)⁰. It is the polarization-orthogonal Poincaré complement. Put N=#(B∩C); it is bounded by deg(i^∨λi)=(deg_L B/h!)² by AbelianSchemesAndArithmeticModuli A5.4 and A6.13. Cross terms in the restriction of λ to B×C vanish, so addition has degree N and its pulled-back L is numerically the external product. The projection formula gives binomial(g,h)deg_L B·deg_L C=N deg_L A. Thus deg_L C is bounded in terms of deg_L A and deg_L B. The API is complementarity, the addition isogeny, orthogonality, the intersection-kernel bound and the degree identity. Checks: for the diagonal of principally polarized E², C is the antidiagonal, N=4 and both curve degrees are 2; for B=0 choose C=A, and for B=A choose C=0 with degree one; an arbitrary chosen complement is not asserted to obey this bound.

Set X_B=CosetCarrier(X,B)∩C. Since B+C=A and the carrier is B-saturated, its set is X_B+B. For the total degree, select translates simultaneously: for each component W of a finite intersection not contained in the full carrier, the b∈B for which W⊂X−b form a proper closed subset. Since B is irreducible, choose b outside the finite union of these subsets. Intersection with this translate lowers every such component dimension at once, including removal of zero-dimensional components. Starting with X, at most dim X+1 additional choices leave precisely the carrier set. T436 thus bounds its total reduced degree by D^(dim X+2), and bounds deg X_B by D^(dim X+2)deg C. This is a carrier-dependent generic choice, and does not identify the carrier with an arbitrary finite translate intersection. To obtain bounds depending only on g and deg X in the generating formulation, first replace A by generatedBy(X−X), and bound deg A by §5.3. *Needs:* §§1.0,5.3,5.4a–5.4b; AbelianSchemesAndArithmeticModuli A2.3, A5.4, A6.5, A6.13; SchemeAndStackFoundations T436 and finite projection formula. Source: Rémond, Lemmas 4.6–4.7 and Corollary 4.1, pp.535–537, for the quotient use; Gao–Ge–Kühne, Lemma 7.4, pp.43–44, for the generating reduction. The numerical complement identity is the polarization calculation above.

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

Use the local all-torsion proof in §§5.6a–5.6d. Its field embedding preserves the original finitely generated field and avoids a specialization of individual torsion orders. The number-field assertion also follows from §5.18 and the zero-height characterization, but that implication is not used as a prerequisite of the local proof.

It is the case Γ = A_tors (rank 0) of §5.13 (The Mordell–Lang theorem), but its proofs are independent.

**Checks.**

- For a curve C of genus ≥ 2 in its Jacobian by an Abel–Jacobi embedding, C ∩ J_tors is finite.

*Needs:* §§5.6a–5.6d; §5.1 (Abelian subvarieties, cosets and quotients); §5.2 (Stabilizers of subvarieties).


### 5.6a Good-reduction embeddings and algebraically closed extension

Prove `AbelianVariety.goodReduction_localEmbedding`: for a finitely generated characteristic-zero field E and an abelian variety A/E, for all but finitely many rational primes p there is an embedding E→F into a finite extension F/ℚₚ under which A has good reduction. Spread A over a nonempty open of the finite normalization of affine space over ℤ in E. Shrink its image so that the entire inverse image lies in the good-model open. Choose a rational point in that image, which reduces to a point for almost all p. Choose algebraically independent elements of ℚₚ with these residues; this is possible because the algebraic closure of each countable finitely generated subfield is countable and every residue ball is uncountable. Pull back the finite normalization to ℤₚ, take a dominating integral component and normalize it: its generic field F is finite over ℚₚ and contains E, and the abelian scheme pulls back to O_F. This is an embedding of the original field, rather than a specialization identifying its transcendental elements.

Prove `torsionClosure_baseChange` for algebraically closed extensions k⊂k′ in characteristic zero. Every torsion point descends since A[n] is finite étale. Abelian subvarieties descend by A6.7's rigidity of Hom and the image of a rational projector from Poincaré reducibility. Polynomial relations vanishing on a subset of A(k) descend by choosing a k-basis of the finitely many k′-coefficients occurring in a relation. Consequently its reduced Zariski closure commutes with extension, and the property of being a finite union of torsion cosets descends faithfully flatly. No assertion that Spec k′→Spec k is radicial is needed.

The APIs are `goodReduction_localEmbedding`, `torsionPoints_baseChange`, `abelianSubvariety_baseChange_surjective` and `torsionClosure_baseChange`. **Checks:** a transcendental element remains transcendental after embedding; multiplying its chosen p-adic lift by p and adding an integer permits a prescribed residue without losing independence; no new geometric n-torsion appears on extending an algebraically closed field. *Needs:* SchemeAndStackFoundations §§0.8–0.9 and finite normalization; AbelianSchemesAndArithmeticModuli §§A3.2, A6.3–A6.7. Source: [Rössler, A note on the Manin–Mumford conjecture](https://www.math.univ-toulouse.fr/~rossler/mypage/pdf-files/mma.pdf), Lemma 0, author pp.3–4, Proposition 6 and proof, pp.6–8.

### 5.6b Unramified formal torsion and the Boxall displacement

Prove `AbelianVariety.unramifiedFormalTorsion_finite`. For F/ℚₚ finite and A/F with good reduction, the kernel of reduction on torsion in A(F^nr) is a finite p-group. Use §§1.15a–1.16 uniformly over finite unramified extensions, whose value group and absolute ramification index e are unchanged. In identity coordinates `[p](T)=pT+terms of degree at least two` with integral coefficients, so multiplication by p increases the minimum positive integral coordinate valuation by at least one. A fixed number N of such steps reaches the strict logarithm radius r>e/(p−1). That deep group is torsion-free by the logarithm; hence every torsion point in the original reduction kernel is killed by p^N. It is contained in the finite group A[p^N](F̄). Prime-to-p reduction is an isomorphism on geometric torsion by the finite étale henselian lifting of A[n]. The exponent bound is independent of the degree of an unramified extension; it is not a bound over arbitrary ramified extensions.

Prove `AbelianVariety.boxall_displacement`: in characteristic zero, p>2, and L containing A[p], if P has p-power order and P∉A(L), some σ∈Gal(L̄/L) has σP−P∈A[p]∖{0}. Let n be the least exponent with p^nP rational over L. Start with an automorphism moving p^{n−1}P, then successively replace it by its p-th power while lifting one p-division level. On the relevant point, p(σ−1)² and (σ−1)³ vanish. The integer congruence T^p≡1+p(T−1) modulo (p(T−1)²,(T−1)³), valid for odd p, preserves the same nonzero p-torsion displacement at every step. This is a finite group calculation, requiring no assertion about openness of adelic monodromy.

APIs: `unramifiedFormalTorsion_finite`, `unramifiedFormalTorsion_killed`, `primeToP_reduction_equiv`, `boxall_displacement`. **Checks:** arbitrary ramification permits formal torsion of unbounded order and is excluded; the torsion-free radius is strict; at p=2 the cited polynomial congruence has a quadratic obstruction, so the displacement theorem here does not include 2. *Needs:* §§1.15a–1.16; A3.2; the henselian finite étale equivalence in SchemeAndStackFoundations. Sources: Rössler, Proposition 3, pp.4–5, Theorem 4, pp.5–6; [Oesterlé, Courbes sur une variété abélienne](https://www.numdam.org/item/SB_1983-1984__26__213_0.pdf), Proposition 2.3(a), printed pp.216–217, for the formal-torsion comparison.

### 5.6c Frobenius polynomial and expanding invariant subvarieties

Prove `AbelianVariety.frobenius_weilPolynomial` for A/𝔽_q: the monic integral degree-2g polynomial of A6.10–A6.11 annihilates Frobenius π and all its complex roots have modulus √q. Cayley–Hamilton on a faithful Tate module gives annihilation in End(A). By A6.21, π†π=q and π commutes with π†; A6.14's positive trace form makes left multiplication by π a normal real operator with adjoint left multiplication by π†. Thus every complex eigenvalue has squared modulus q. Faithfulness of the regular representation of ℚ[π], and the common characteristic-polynomial roots in A6.11, transfer this to the required roots. This is the abelian-variety Weil estimate only; no general weight theorem is imported from a higher layer.

Prove `AbelianVariety.expandingIsogeny_invariant`: over an algebraically closed characteristic-zero field, if an isogeny F has every eigenvalue on complex H¹ of modulus greater than one, every closed reduced Z with F(Z)=Z is a torsion subvariety. For the complex calculation, import the analytic uniformization in A5.1, de Rham–Betti comparison and cycle integration in ComplexComparisonPartII C5. Identify the cohomology of the real torus with Λ*H¹: averaging over translations reduces closed forms to constant forms and gives the cohomology inverse, while integration over the fundamental lattice subtori tests injectivity. This supplies the scoped adapter `abelianBetti_exterior`, compatible with endomorphisms and translations, and `cycleClass_nonzero`, detected by a positive ample intersection. After replacing F by a power, work on one invariant irreducible component and divide by its entire stabilizer (first its reduced connected part, then the finite quotient). In the trivial-stabilizer quotient, F⁻¹Z consists of distinct translates by ker F; translation acts trivially on cohomology, so F*cl(Z)=deg(F)cl(Z). Since deg(F) is the product of all 2g eigenvalues, it cannot be an eigenvalue of Λ^iH¹ for i<2g: the omitted eigenvalues have product of modulus greater than one. Nonzero cl(Z) forces dim Z=0. Its point lies in ker(F−1), which is finite, hence is torsion. The quotient's eigenvalues are a subset of those of F. Descent from a finitely generated field embedded in ℂ uses §5.6a.

APIs: `frobenius_weilPolynomial`, `frobenius_polynomial_annihilates`, `abelianBetti_exterior`, `cycleClass_nonzero`, `expandingIsogeny_invariant`. **Checks:** q>1 is essential; [2] has H¹ eigenvalue 2 and invariant reduced subvarieties are torsion unions; the identity isogeny permits every subvariety and fails the expansion hypothesis; cl(Z) is nonzero for a nonempty effective projective cycle. *Needs:* §§1.0, 5.2, 5.6a; A3.3, A5.1, A6.10–A6.11, A6.14, A6.21; ComplexComparisonPartII C5 `properDeRhamBetti`, `AnalyticCycleIntegration`; geometric Chow intersections in SchemeAndStackFoundations SF.5. Sources: Rössler, Proposition 1 and Corollary 2, pp.3–4, Theorem 5, p.6; [Pink–Rössler, On Hrushovski's proof](https://arxiv.org/abs/math/0212408), Lemma 2.6 and following cycle-class argument, printed pp.542–543.

### 5.6d The local all-torsion argument

Prove `AbelianVariety.unramifiedTorsion_closure`: for A/F of good reduction, F/ℚₚ finite, the reduced closure of X(F̄)∩A(F^nr)_tors is a torsion subvariety. Let τ be the unramified Frobenius lift and Q its reduction polynomial from §5.6c. Multiplication by p^N kills the reduction kernel in §5.6b, so Q(τ) annihilates p^N times unramified torsion. Map these points into A^deg Q by their consecutive τ-images. The companion matrix of Q maps their closure to itself; its H¹ eigenvalues are roots of Q, so §5.6c applies. Project to the first factor and pull back under [p^N]; images and inverse images of torsion subvarieties are torsion subvarieties.

For all torsion, extend F to contain A[p] with p>2 and quotient an irreducible torsion-dense X by its full stabilizer. If P∈X_tors is ramified, its prime-to-p part is unramified and §5.6b gives an inertia displacement σP−P in the finite set A[p]∖{0}. Since σP∈X, all such points belong to the finite union X∩(X−t) over nonzero t∈A[p]. In the trivial-stabilizer case these intersections are proper; hence ramified torsion is not dense. Unramified torsion is then dense and the preceding target makes X a torsion point. Pulling back the quotient and taking irreducible components yields the coset conclusion. By §5.6a this proves §5.6 over every algebraically closed characteristic-zero field. The quotient retains good reduction: it extends over a finite extension via the quotient of the abelian scheme by the closure of the kernel (or by A6.5's complementary good-reduction factor).

APIs: `unramifiedTorsion_closure`, `ramifiedTorsion_contained_translateIntersections`, `local_maninMumford`, followed by §5.6's global declaration. **Checks:** the ramified locus is controlled by a finite union, not a point-dependent exceptional set; the quotient point can have positive-dimensional inverse image; prime-to-p torsion alone is insufficient for the all-torsion conclusion. *Needs:* §§5.6a–5.6c, 5.1–5.2; finite-component/noetherian decomposition and proper images in SchemeAndStackFoundations; NeronModelsAndSemistableAbelianVarieties §1.8. Source: Rössler, Propositions 7–8 and final argument, pp.8–10.

### 5.7 Manin–Mumford for trivial trace in positive characteristic

Prove `TauCeti.AbelianVariety.manin_mumford_trivialTrace`. In characteristic p>0, let K be finitely generated over an algebraically closed field k and A an abelian variety over K with trivial geometric K̄/k-trace. If X ⊆ A_{K̄} is a closed subvariety with X(K̄) ∩ A(K̄)_tors Zariski dense in X, then X is a torsion subvariety. The proof covers all torsion, including p-power torsion.

Characteristic p>0; trivial geometric K̄/k-trace; k algebraically closed. The trace is the geometric trace of A_{K̄} over the algebraically closed constant field k, as specified by Xie–Yuan §1.1; zero original K/k-trace is not enough.

([Geometric Bogomolov conjecture in arbitrary characteristics](https://arxiv.org/abs/2108.09722v1), §5, Theorem 5.1 and proof, pp. 22–23; [Positive characteristic Manin–Mumford theorem](https://arxiv.org/abs/math/0303340), Theorem 2.2, p.2 (arXiv:math/0303340).)

Sections 5.7a–5.7d give the abelian all-torsion proof: connected formal Dieudonné classification and slopes, invariant formal factor splitting and algebraization, finite-field descent, and constant-p-rank specialization.

Trivial geometric trace excludes nonzero homomorphisms to abelian varieties over 𝔽̄_p ⊆ k (§1.9 (Chow's K/k-trace) universal property), so special subvarieties are torsion cosets (Xie–Yuan Theorem 5.1).

**Checks.**

- For A with trivial trace and X a curve of genus ≥ 2, X ∩ A_tors is finite.
- A nonconstant quadratic isotrivial twist of a constant Jacobian in characteristic p≠2 can have zero K/k-trace while becoming constant over K(√t). Over K̄ its constant genus≥2 curve has dense torsion over F̄_p and is not a torsion coset. This rules out the original-trace-only hypothesis.

*Needs:* §§5.7a–5.7d; §1.9 (Chow's K/k-trace); AbelianSchemesAndArithmeticModuli §§A3.2–A3.3 and A4.5. The characteristic-zero theorem §5.6 is not a prerequisite of this route.


### 5.7a Connected formal groups and their Dieudonné modules

Over a perfect field k of characteristic p>0, define `ConnectedFormalDieudonne` as finite free W(k)-modules M with an injective σ-semilinear F, with pM⊂FM and F^nM⊂pM for some n. Put V=pF⁻¹. Its API includes morphisms commuting with F, finite-index inclusions, rationalization, base change, Frobenius twist, and the cotangent quotient M/FM. The ambient Witt ring, its DVR structure, p-adic completeness and the isocrystal carrier are native: `WittVector.isDiscreteValuationRing`, `WittVector.isAdicCompleteIdealSpanP`, `WittVector.quotientPEquiv` and `WittVector.Isocrystal`. No new Witt-vector construction is required. **Checks:** the connected multiplicative group has M=W and F=pσ; the étale module F=σ fails the topological-nilpotence condition; the supersingular elliptic connected group has rank two and slope 1/2, rather than two rank-one modules over W.

Prove `connectedFormalDieudonne_equivalence`: smooth connected commutative finite-height p-divisible formal groups over k are contravariantly equivalent to this category. Under the equivalence, dim G=dim_k(M/FM), height G=rank_W M, Frobenius corresponds to F with its scalar twist, and isogenies correspond to rational isomorphisms. Construct the functor by continuous primitive Witt covectors. A covector over a finite k-algebra R is a left-infinite sequence whose sufficiently remote tail generates a nilpotent ideal. Addition and scalar action are the stabilized finite Witt polynomials; their weighted-degree estimate shows stabilization once the truncation exceeds the tail start plus a bound depending on the nilpotence exponent. This gives a formal functor CW with F,V and FV=VF=p. Set M(G)=Hom(G,CW), with its inverse-limit topology, and define the inverse by Q(M)(R)=Hom_cont,D(M,CW(R)). At finite levels these are solutions of the finite primitive and D-linearity equations in affine coordinates; the transition maps and completeness give the formal inverse limit.

Own the cotangent calculation `primitiveCovectors_modF`: taking the last coordinate modulo the augmentation ideal squared gives M(G)/FM(G)≃ω_G. To lift a cotangent vector to a primitive covector, correct its coproduct degree by degree. The leading error is a homogeneous symmetric additive two-cocycle. Comparing coefficients in its cocycle equation reduces one variable at a time to a coboundary, except at degree p^s, where the sole one-variable class is the integral divided-binomial polynomial ((U+V)^p−U^p−V^p)/p evaluated at U=x^(p^(s−1)), V=y^(p^(s−1)). The product case splits by restricting an extension to the coordinate factors and adding the lifts. The p-fold coproduct identity and Verschiebung force the exceptional coefficient of the primitive-lifting error to vanish. The same calculation shows that a primitive with zero cotangent coordinate is F times a primitive. I-adic completeness makes these corrections converge. Thus M is exact on connected formal groups, and F-adic Nakayama identifies both unit and counit after checking their cotangent maps. More explicitly, first induct on Frobenius kernels using the height-one coordinate algebras and the cotangent calculation, then pass to their inverse limits on modules and direct limits on formal functors. The smoothness criterion is injectivity of F; finite height is finite freeness over W. This proves the equivalence in the precise connected finite-height scope needed here, without importing general integral p-adic Hodge theory.

APIs: `connectedFormalDieudonne_equivalence`, `primitiveCovectors_modF`, `formalDieudonne_dimension`, `formalDieudonne_isogeny`, `formalDieudonne_frobeniusTwist`. Checks: an isogeny need not give an integral module isomorphism; the module is contravariant; the étale part is excluded rather than assigned dimension equal to its height. *Needs:* the named native Witt and power-series/adic-completion APIs; TauCetiRoadmap.ModularCurves 0B–0C for finite locally free Cartier duality and quotients; AbelianSchemesAndArithmeticModuli A4.5 for the existing p-divisible carrier; §§1.15a,5.2 for formal completions and full subgroup schemes. Sources: Fontaine, [Groupes p-divisibles sur les corps locaux](https://www.numdam.org/item/AST_1977__47-48__1_0.pdf), I §§10.1–10.6, pp.62–70, II §§1–2, pp.71–82, III Theorem 1, pp.125–127, §§3–4, pp.138–151, and §§6.1–6.2, pp.161–164. This connected classification is a foundation for the later, broader finite-flat-group roadmap.

### 5.7b Positive slopes and decomposition with a commuting isogeny

Prove `connectedIsocrystal_slopeDecomposition`. If M is as in §5.7a and k is algebraically closed, M[1/p] is a direct sum of the simple modules E_(r/s), with coprime 0<r≤s, basis e,Fe,…,F^(s−1)e and F^s e=p^r e. Hom between unequal slopes is zero. This extends the pinned `WittVector.isocrystal_classification`, which supplies rank one only. Its API is the canonical slope summands, their functoriality, finite multiplicities, and invariance under commuting linear endomorphisms. Checks: a supersingular elliptic module has one slope-1/2 block; ordinary elliptic completion has slope one; a statement with standard blocks requires algebraically closed k.

Here is the algebraic route to the general-rank step. Localize the formal Dieudonné ring at F. For a module with finite M/FM, its resulting module over W(k)_σ((F)) is finitely generated and torsion: an element with zero annihilator would give a finitely generated submodule containing every (pF⁻¹)^n, contradicting the valuation of its lowest F-coefficient. The skew Laurent-series ring has a left and right Euclidean division using that valuation. Successively cancel the lowest F-term; either its coefficient valuation decreases or the correction terms tend to higher F-degree and converge. Row and column reduction therefore reduce finite torsion presentations to cyclic summands. Separate p-primary factors by the kernel/image decomposition for multiplication by p. Skew Weierstrass preparation, correcting modulo p^n, puts each remaining cyclic factor in distinguished monic-polynomial form.

For a Newton edge of slope r/s, adjoin p^(1/s), fixed by σ. A right root p^(r/s)u of a distinguished factor is obtained first over the residue field and then modulo successive powers of the ramified uniformizer. At each correction the equation for u is a nonconstant additive polynomial, so algebraic closure supplies a root. Repeat on the quotient polynomial. Extensions of rank-one factors split by solving bξ−aσ(ξ)=c: unequal valuations give a convergent contraction, and equal valuations give an additive residue equation followed by successive lifting. Descend a splitting from the ramified ring by expanding its Bézout identity in the basis 1,p^(1/s),…,p^((s−1)/s) and taking the constant coefficient. A simple descended block has minimal possible dimension s, because its slope denominator divides its dimension; it is E_(r/s). A map between unequal slopes vanishes by comparing valuations of its iterates. Finally F-topological nilpotence gives r>0, and V-stability gives r≤s. This supplies the scoped classification with a proof chain, rather than a reference to a general slope theorem. Source: Manin, [The theory of commutative formal groups over fields of finite characteristic](https://www.mathnet.ru/eng/rm6440), Chapter II §1, Proposition 2.1, pp.25–26, §2, Proposition 2.2, Lemmas 2.1–2.7 and Theorem 2.1, pp.27–33.

For a W-linear isogeny φ commuting with F, refine by the valuations γ≥0 of the eigenvalues of φ. On the slope-β/eigenvaluation-γ piece, write α=γ/β=r/s≥0. Given a generating lattice N with pN⊂FN, set M_(β,γ)=Σ_(ir+js≥0) φ^iF^jN, where i,j range over ℤ. Prove this lattice is finite by adjoining a common root of p: after rescaling φ by p^γ and F by p^β, each preserves a lattice bijectively, so all summands have uniformly bounded denominators. It satisfies φ^sM_(β,γ)=F^rM_(β,γ) and pM_(β,γ)⊂FM_(β,γ). Rescale and sum the finitely many pieces inside M. By §5.7a this is a φ-equivariant formal isogeny G→∏_αG_α, with φ^s on G_α equal to Frobenius^(r) followed by an isomorphism. Define this property as `FormalPureWeight α`; its API records r,s, the factorization, and multiplication of α on replacing φ by a power. Checks: weight zero means a formal automorphism; positive weight contracts the maximal ideal; the ratio is γ/β, not β or γ alone. Source: Pink–Rössler, [On ψ-invariant subvarieties of semiabelian varieties and the Manin–Mumford conjecture](https://people.maths.ox.ac.uk/rossler/mypage/pdf-files/pr2.pdf), Lemma 8.2, Proposition 8.3, Definition 8.4 and Theorem 8.5, author version pp.16–17. *Needs:* §5.7a; native finite-dimensional linear algebra, DVR lattices, Hensel factorization and complete power-series rings. The bounded-denominator and skew-division arguments are owned here.

### 5.7c Jet rigidity, formal splitting and algebraization

Prove `invariantSubvariety_finiteStabilizer_bijective`. If φ is an isogeny of A and ψ=φ+a preserves an irreducible reduced X with finite full stabilizer, ψ|X is bijective and φ is bijective on the abelian variety generated by X−X. The generic geometric fibre has #(Stab(X)∩ker φ) points, by factoring φ into a radicial isogeny and a finite étale torsor. On iteration its n-th power is bounded by #Stab(X), so this number is one. Normalize X: the induced purely inseparable finite map is dominated by a Frobenius power and is universally bijective. Descend bijectivity across the finite normalization equivalence relation, and then across X^(2d)→generatedBy(X−X), using the same proper equivalence-relation argument. Scheme lengths are not substituted for geometric point counts in this argument.

Own `finiteJet_translationRigidity`: for large m the translated m-jets give a generically immersive map X_reg/Stab(X)→Grass(O_(A,0)/m_0^(m+1)). Equality of all jets means equality of the translated completed ideals; faithful completion and irreducibility then mean equality of the translated subvarieties. On the noetherian relation space X_reg×X_reg, the descending closed jet-equality relations stabilize, including their scheme structure. This gives a finite m detecting the stabilizer relation and hence generic immersion. The Grassmannian and Hilbert schemes are imported; this translation-rigidity adapter is owned here.

Prove `invariantSubvariety_periodicDense`. For φ having no root-of-unity eigenvalue, spread to a regular finite-type F_p-base. The fixed locus on the relative smooth locus is the intersection of diagonal and graph; every component has dimension at least that of the base and is quasi-finite because φ^n−1 is an isogeny. Consequently every component dominates the base. Over finite fields, bijectivity makes every point periodic; lifting these points makes periodic points dense on the generic fibre. In general split the root-of-unity generalized eigenspace by the kernel of a power of φ^n−1. On it φ becomes unipotent; on any finite jet space a unipotent operator in characteristic p has finite order. Finite-jet rigidity makes ψ finite order on a finite-stabilizer fibre. Fibre stabilizer identity components are constant on a dense open: their prime-to-p torsion is finite étale levelwise and dense, so a flat family of abelian subgroup schemes in a fixed A is locally constant. A positive component would stabilize X. Combine with the positive quotient to obtain density in general.

Prove `formalInvariant_splitsWeights`: a formally smooth φ-stable closed formal subscheme of ∏G_α splits as ∏X_α. For α>0, choose parameters in which φ^s(x_i)=x_i^(p^r): solve the semilinear fixed-basis problem on m/m² by Lang for GL_d, then correct modulo m^n using surjectivity of ψ−1 on m^n/m^(n+1), again Lang for a vector group. Separate the invertible weight-zero summand from the contracting summands modulo m^n and pass to the limit. Formal smoothness lets a subset of these parameters be coordinates on X. Equivariance forces maps between distinct weights to vanish, by comparing their lowest nonzero monomial and its Frobenius growth. This identifies the embedding with the product embedding, not just an abstract product of formal schemes.

Prove `formalFactors_algebraize`. At a smooth periodic point translate and iterate so 0 is fixed, and apply the preceding target. For each factor X_α consider the finite infinitesimal neighbourhoods of the complementary formal product. Their transporters into X are closed subschemes of A: finitely many coefficients of the pulled-back ideal give the equations. These transporters descend in a noetherian scheme and stabilize. Their completions are X_α times the finite complementary stabilizer, so an irreducible reduced component through 0 has completion X_α. Generate A_α by alternating sums of this component. Its completion lies in G_α; addition ∏A_α→A has finite kernel and takes ∏X_α onto X. Quotienting by the finite formal-isogeny kernel is legitimate because it is a finite subgroup scheme of A; use A3.3, retaining its infinitesimal structure. Each resulting A_α has φ^s equal to Frobenius^r followed by a separable isogeny, since their kernels agree on connected formal completions.

APIs are the five named theorems, the finite-jet map and transporter coefficient equations. Checks: formal smoothness is required for the product splitting; equality of tangent spaces alone does not algebraize a factor; a nonreduced finite kernel is retained in the abelian quotient; the identity isogeny has weight zero and allows arbitrary X. *Needs:* §§1.0,5.2,5.3,5.7a–5.7b; SchemeAndStackFoundations normalization, finite presentations, Grassmannians and Hilbert schemes; AbelianSchemesAndArithmeticModuli A3.3, A6.3; ReductiveGroupsPartII RG2.3 Lang theorem. Sources: Pink–Rössler, Proposition 4.5, Propositions 5.1–5.4, pp.7–9, Propositions 6.1–6.4, pp.10–12, Propositions 8.6–8.8, pp.18–19, and Lemmas 9.1–9.2 with the rest of §9, pp.19–20.

### 5.7d Constant factors and the all-torsion specialization

Complete `invariantSubvariety_constantFactors` in the abelian case. On a separable factor, φ acts linearly on each finite jet space. The Zariski closure of its cyclic subgroup is a finite-type linear group; every finite orbit has length dividing its component-group order. Dense periodic points from §5.7c therefore imply that one power fixes the jet image. Its quasi-finite fibres imply that a further power fixes X, and hence fixes A_X. This is weight zero. For a positive pure factor, write φ^s=λ∘Frob^(r). Bijectivity on A_X makes λ an isomorphism there. The translated jet map intertwines X and its Frobenius twist. Normalize its projective Grassmannian image in k(X). The pulled-back Plücker line bundle is ample and preserved by this semilinear isomorphism. Each finite-dimensional graded piece has a fixed F_(p^r)-basis by Lang; its fixed graded algebra gives a finite-field model by Proj. The regular open descends too. To descend A_X, push a suitably general divisor from a power of this finite-field model of X_reg. Specialize the divisor parameter over a finite field while retaining codimension one and finite translation stabilizer; the divisor is ample on an abelian variety by the polarization criterion A2.7. Summing its finite semilinear orbit gives an invariant ample divisor on A_X. Descend its graded section algebra in the same way. Thus all positive-weight factors come from finite fields. This proves Pink–Rössler Theorem 3.1 in the abelian scope used here. Sources: Propositions 7.1 and 7.3, Lemmas 7.2,7.4–7.6, author pp.12–15; §9, pp.19–20.

Prove `torsion_frobeniusAnnihilator` in characteristic p. Spread A and X over an integral finite-type F_p-scheme, shrink to the generic p-rank stratum, and choose a closed point s there. Over the strict henselization, prime-to-p torsion specializes isomorphically. For p^n-torsion, lift the special-fibre component idempotents in its finite algebra. Constant p-rank says that there are exactly p^(nf) geometric components at both fibres; each lifted component is finite flat, and the identity component has connected generic fibre as well. The quotient is finite étale, and its generic geometric points are exactly the geometric p^n-torsion. Taking all n gives the all-torsion specialization isomorphism; no nonzero infinitesimal point is being identified with a geometric point. A residue Frobenius lift ρ therefore satisfies P(ρ)=0 on all torsion, where P is the reduction Weil polynomial of §5.6c, whose roots have modulus √q>1. Source: Pink–Rössler, Theorem 3.6 and proof, author pp.6–7; the constant-p-rank/connected-component adapter is specified here.

Send torsion points P to (P,ρP,…,ρ^(d−1)P) in A^d. The companion isogeny of P preserves their reduced closure. A weight-zero factor is killed by the companion polynomial: a power of its isogeny is the identity, whereas that polynomial has no root of unity, so their endomorphism polynomials are coprime. Applying the remaining positive-weight classification and projecting gives, modulo the reduced connected stabilizer, an image of a finite-field abelian variety. A geometric K̄/k-trace-zero A has no nonzero constant subquotient: a Poincaré complement lifts one up to isogeny, duality reverses a quotient, and the trace universal property kills its map into A. Thus the remaining image is a point. Since each component meets torsion, its translate is a torsion coset, proving §5.7 including p-primary torsion. APIs: `invariantSubvariety_constantFactors`, `torsion_frobeniusAnnihilator`, `geometricTraceZero_noConstantSubquotient` and `manin_mumford_trivialTrace`. Checks: a constant ordinary abelian variety has both connected p-power kernels and nonzero geometric p-power torsion; a supersingular one has no nonzero geometric p-power torsion; specialization is restricted to the constant-p-rank stratum; zero trace before geometric extension is insufficient. *Needs:* §§1.9,5.1,5.6c,5.7a–5.7c; A3.2–A3.3, A4.5, A6.5 and duality; finite-flat henselian idempotent lifting from ModularCurves 0B and 7E. This route uses no characteristic-zero torsion theorem and no generic-automorphism theory.

### 5.8 Uniform Manin–Mumford in families

Prove `TauCeti.AbelianVariety.uniform_manin_mumford`. Let A be an abelian variety over an algebraically closed field K of characteristic 0, V an irreducible quasi-projective K-variety and Y ⊆ V × A an irreducible closed subvariety with fibres Y_v. There are a finite set 𝓜 of abelian subvarieties of A and an integer D such that for every v ∈ V(K) the Zariski closure of Y_v ∩ A_tors is a union of at most D translates of members of 𝓜 by torsion points.

Characteristic 0; Y irreducible closed in V × A.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), Theorem 3.2 and proof, p. 13.)

Apply the constructible-family uniformity target §5.8a with Ξ=A_tors. By §5.6, the Ξ-special irreducible varieties in each power A^n are torsion cosets. The intersection of two such cosets, if it contains a torsion point, has components that are again torsion cosets: translate to an intersection of subgroup schemes and split its finite component quotient. The uniformity construction uses finitely many fixed torsion cosets V_i⊂A^{n+1}. Each relevant fibre of V_i→A^n is a finite union of translates of the fixed identity component B_i of its kernel. Thus the finite list of B_i supplies 𝓜. Uniform geometric component/degree bounds for these finitely many projective families give D. This applies to a fixed A; it is not a theorem for a varying abelian scheme. It uses ordinary first-order compactness for an auxiliary predicate, not a generic-automorphism theory.

**Checks.**

- For V a point this is §5.6 (The Manin–Mumford theorem).

*Needs:* §5.6 (The Manin–Mumford theorem).


### 5.8a Constructible-family automatic uniformity

Define `SpecialFor Ξ Z` for an irreducible reduced closed subvariety Z⊂X^n by density of Z∩Ξ^n. Define `AutomaticUniformity Ξ` to mean that for each closed finite-type family Y⊂X×B, closures of Y_b∩Ξ are components of fibres of one finite-type constructible family; the capturing family depends on Y and Ξ and is not chosen separately for each b. Its API is `SpecialFor.baseChange`, `SpecialFor.product`, `AutomaticUniformity.capture` and `AutomaticUniformity.degreeBound`. **Checks:** for a singleton Ξ all nonempty closures are that point; Ξ=X(K) gives ordinary fibre closures; Ξ=ℕ²⊂𝔸²_ℂ fails, since fibres x+y=b have arbitrarily many isolated Ξ-points. Thus finite type of Y alone does not imply automatic uniformity.

Prove `constructibleTrace_finiteParameters`: for any subset C of points of X over an algebraically closed extension, and any closed Y, its intersection Y∩C can be described on C by a constructible relation Z(x,c₁,…,c_n) with finitely many c_i∈C. On an affine chart take generators of the ideal of the closure of Y∩C. In each generator degree, the finite-dimensional coefficient space of polynomials vanishing on that set is cut out by finitely many evaluations at its points. A finite list of those evaluations determines the space; universal quantification over this coefficient space describes its zero locus, and Chevalley's theorem gives constructibility. Covering X by finitely many affine charts gives the general relation. Neither n nor the relation is yet uniform.

Prove `constructibleTrace_uniformParameters` for a fixed family Y⊂X×B. Encode the field, coefficients of X,Y and all constructible relations, one unary predicate for C, and a parameter b. If no finite list of candidate capturing relations works, every finite collection of their failures is realized in the original field by some b. Mathlib's pinned `FirstOrder.Language.Theory.isSatisfiable_iff_isFinitelySatisfiable` (ModelTheory/Satisfiability.lean) gives a model realizing all failures, contradicting the preceding finite-parameter target in that algebraically closed model. Algebraic charts and polynomial predicates are finite first-order formulas; the diagram of the coefficient field gives its embedding into the model. This is a direct application of existing compactness, rather than a new model-theory development.

Prove `automaticUniformity_of_specialIntersections`: if every irreducible component of an intersection of Ξ-special varieties in each X^n that meets Ξ^n is Ξ-special, then Ξ satisfies automatic uniformity. Write the uniform constructible relation as finitely many V_i∖W_i. Replace each V_i by the components of the closure of V_i∩Ξ^{n+1} and discard components contained in W_i. This preserves its trace at parameters ξ∈Ξ^n. Intersect V_i with X×{ξ}; the hypothesis makes all components meeting Ξ special, so the closure of each fibre trace is assembled from their components. Projective closure and flattening stratification supply a uniform degree and component bound for these finitely many families. For torsion in a fixed A the V_i are fixed torsion cosets, and their fibre kernels give the additional finite list of abelian directions in §5.8.

The theorem APIs are `constructibleTrace_finiteParameters`, `constructibleTrace_uniformParameters`, `automaticUniformity_of_specialIntersections` and `torsionFamily_fixedDirections`. *Needs:* §5.6 for the application only; Mathlib's named compactness theorem; SchemeAndStackFoundations SF.4 Hilbert schemes, SF.3 Chevalley and dimension/constructible decomposition; AlgebraicModuliForArithmeticGeometry §1.6 bounded Hilbert families. Source: [Scanlon, Automatic uniformity](https://math.berkeley.edu/~scanlon/papers/autouni.pdf), Definitions 2.1–2.2, Proposition 2.3 and Theorem 2.4, author pp.2–3; Lemmas 3.1–3.3 and proof of Theorem 2.4, pp.3–6; the torsion-coset instance is the rank-zero case of the intersection calculation in Corollary 4.6, p.8. The argument does not use finite-rank Mordell–Lang to prove torsion uniformity.


### 5.9 Faltings' theorem on rational points of subvarieties of abelian varieties

Prove `TauCeti.AbelianVariety.faltings_subvariety`. Let A be an abelian variety over a number field K and X ⊆ A a closed subvariety. Then X(K) is contained in a finite union of cosets x_i + B_i contained in X; consequently X(K) ∩ X° is finite, where X° is the complement of the Ueno locus. In particular, if X contains no positive-dimensional coset (for example a curve of genus ≥ 2 in its Jacobian), X(K) is finite.

K a number field; X closed in A.

([The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3; [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.3, statement of Faltings' theorem on subvarieties of abelian varieties after Conjecture 9.5.11.)

Sections 5.9a–5.9f give the geometric product theorem, polynomial small sections, the higher-dimensional gap outside the Ueno locus and induction through its carriers. The polynomial route uses geometric section asymptotics and a number-field Siegel estimate, avoiding a separate arithmetic Riemann–Roch prerequisite. Faltings 1991 Theorem 1 treats varieties containing no positive-dimensional coset; the general Ueno-complement route is specified by Rémond 2000, Theorem 1.1, pp.104–105.

For curves the elementary version is Bombieri's (§5.10 (Vojta's inequality) and §5.11 (Mumford's gap principle)).

Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

**Checks.**

- For C ⊆ J a curve of genus ≥ 2, this reproves Faltings' theorem on curves (§4.6 (The Mordell conjecture (Faltings' theorem))).

*Needs:* §§5.9a–5.9f; §5.4 (The Ueno locus); §1.7 (The Mordell–Weil theorem); §0.21 (The Néron–Tate canonical height).


### 5.9a Index loci and the geometric product theorem

Own `Section.blockIndexLocus`. On a product ∏ℙ^{nᵢ} in characteristic zero, a section f of O(r₁,…,r_m), rᵢ>0, has index at x equal to the least Σᵢ|αᵢ|/rᵢ of a nonzero divided jet in separate factor coordinates. Its ≥t locus is the closed subscheme locally cut out by jets of weight<t. This extends the local-frame construction of §5.10a to blocks of parameters; polynomial jets and their algebra are imported from DiophantineApproximationAndTranscendence §1.2. The ideal, rather than a list in one chart, is the object to glue: a frame or coordinate change expresses lower jets in lower jets by the divided chain rule. APIs: `blockIndexLocus`, `mem_blockIndexLocus_iff`, `blockIndexLocus_antitone`, `indexLocus_baseChange`, `indexLocus_localIdeal` and the weighted differential containment I_t→I_(t−b) for an operator of weight≤b. Checks: the zero section has the whole product as every finite index locus; a unit has empty locus for t>0; a product of coordinate powers has index the sum of its block exponents divided by rᵢ; arbitrary coordinate changes between distinct blocks are excluded.

Prove `projective_productTheorem`: with the factor dimensions fixed and b>0, there are R,C such that if rᵢ/r_(i+1)≥R and an irreducible Z is a component of both index loci at t and t+b, then over its field of constants Z=∏Zᵢ and every deg Zᵢ≤C. Over a number field the constant-field degree is bounded too. If f has integral coefficients with conjugate suprema C_v, then for suitable constants depending only on the fixed dimensions and b,

 Σᵢ rᵢ h_FS(Zᵢ) ≤ C(Σ_v log C_v+Σᵢrᵢ).

Use the relative Fubini–Study cycle height for this display, and normalize it when converting to absolute coefficient heights. The constants absorb that fixed normalization and the positive degrees of the other factors. They do not depend on the rᵢ.

For the proof, filter the tangent space of Z at its smooth generic point by the first i factors and put sᵢ=dim(Tᵢ/T_(i−1)). The index gap b forces the generic multiplicity of Z in the lower index ideal to be at least c∏rᵢ^(nᵢ−sᵢ): count divided monomials in transverse parameters of weight<b, selecting a fixed rectangular box inside that simplex. Apply multihomogeneous Bézout to these derivative equations. A mixed intersection Z·∏Hᵢ^{eᵢ}, Σeᵢ=dim Z, is bounded by a constant times a product of the large successive degree ratios with exponents determined by Σ_(j≥i)(sⱼ−eⱼ). Projection dimensions first force these exponents to have the sign giving nonpositive powers. If any is negative, sufficiently separated ratios make a positive integral intersection less than one. Thus the only nonzero mixed intersection has eᵢ=sᵢ. Projection dimensions then force Z to be the product of its factor projections, and the remaining intersection bounds their degrees. Sum the same bounds over conjugates for the constant-field degree. Arithmetic Bézout applied to the derivative equations, whose coefficients grow by at most exp(cΣrᵢ), gives the height bound; positivity of projective cycle heights allows each weighted factor term to be retained. The common-component hypothesis is supplied in applications by a chain longer than the product dimension, not asserted for every high-index component directly. Source: [Faltings, Diophantine approximation on abelian varieties](https://annals.math.princeton.edu/1991/133-3/p04), Theorems 3.1 and 3.3, Remark 3.2 and proof, pp.560–563; multidegree and height estimates, Propositions 2.3 and 2.17, pp.551–552,558–559. *Needs:* §5.17a's divisor action and positivity in projective space; SchemeAndStackFoundations geometric multidegrees and Bézout; §§5.9b,5.10a for the local and projective-height adapters. This geometric product theorem is distinct from the linear-form auxiliary-polynomial results of DiophantineApproximationAndTranscendence §2.8.

### 5.9b Controlled projections and projective cycle heights

Own `projectiveCycleHeight_FS`: take the arithmetic intersection of the closure in projective space with the metrized O(1), normalized by the base degree. On products use its mixed intersections. This is an application of §5.17a, with no second definition of arithmetic Chow groups. Its APIs are nonnegativity on effective cycles, the closed-point comparison with coordinate height including the fixed Fubini–Study normalization term, the mixed-height product formula, and the hypersurface intersection bound

 h_FS(div(f)|Y) ≤ (deg f)h_FS(Y)+deg(Y)(h_coeff(f)+c·deg f).

Choose coordinates with a standard section not identically zero on a component. Its sup norm is≤1; the arithmetic divisor formula gives the nonnegative archimedean correction. Induction on dimension proves positivity, including vertical cycles whose heights are residue logarithms times geometric degrees. General f is bounded at infinity by its coefficient maximum times the number of monomials, giving the displayed bound. Thus this scoped arithmetic Bézout input needs divisor intersections only. Checks: a vertical point contributes log #κ, not zero; points have a normalization shift from the Fubini–Study rather than maximum metric; a nonzero section on a component is required before taking its divisor there.

Prove `boundedDegree_goodProjection` and `boundedHeight_monicPresentation`. For an integral Y⊂ℙⁿ of degree D and dimension u in characteristic zero, choose a bounded integral linear change of coordinates giving a finite degree-D map to ℙᵘ and a primitive element for the function-field extension. Its affine coordinates satisfy monic degree-D equations whose coefficient tuple has height≤c(D,n)(h_FS(Y)+1). A discriminant hypersurface of bounded degree and the same height control contains the exceptional non-étale locus. A proper subvariety of bounded degree has a nonzero homogeneous equation of bounded degree and height≤c(h_FS(Y)+1). Its pullback under these projections has the analogous bound. For a proof, specialize the Chow form at the projection linear forms. Avoid the vanishing conditions on a bounded integer grid: a nonzero polynomial of total degree B cannot vanish on a grid with B+1 choices in every relevant variable. The Chow-form projection condition has degree bounded by a function of D,n. For the primitive-element condition use the discriminant, the square of the product of the differences of its D conjugates; its degree in the linear coefficients is at most D(D−1). The product of these conditions therefore has some bound B(D,n); the grid bound must use this bound rather than D alone. The eliminated hypersurface equations are the Chow specializations, so degree and coefficient heights follow from their multihomogeneity; discriminants are fixed-degree coefficient polynomials. Finite pullback and the hypersurface inequality give the last assertion. The Chow form, its finite projection degree and base-change laws are SchemeAndStackFoundations' elimination interfaces. Source: Faltings, Propositions 2.1–2.2,2.6–2.7 and 2.10, Corollaries 2.12–2.14, pp.551–557; [Rémond, Inégalité de Vojta en dimension supérieure](https://www.numdam.org/item/ASNSP_2000_4_29_1_101_0.pdf), Proposition 4.1 and Lemmas 4.1–4.3, pp.114–121. *Needs:* §5.17a; SchemeAndStackFoundations Chow forms, projective finite projections and discriminants. No product theorem is a prerequisite of these estimates.

### 5.9c Difference bundles with enough sections outside the Ueno locus

Fix a symmetric very ample projectively normal L on A and X⊂A integral, of positive dimension d; put m=d+1. For positive integers aᵢ and η₁=η_m=1, ηᵢ=2 at interior indices, set N_a=⊗Lᵢ^{ηᵢaᵢ²}. Write β_a(x)=(aᵢxᵢ−a_(i+1)x_(i+1))_(i<m), and define

 Q_(ε,a,D)=β_a* (⊠_(i<m)L)^D ⊗ N_a^(−εD),

where ε>0 is rational and D is a sufficiently divisible positive square integer, εD integral. The Poincaré expansion is ⊗Lᵢ^{(1−ε)Dηᵢaᵢ²}⊗⊗P_(i,i+1)^(−Daᵢa_(i+1)), with P_(i,j)=add_(i,j)*L⊗Lᵢ⁻¹⊗Lⱼ⁻¹. APIs: `weightedDifferenceBundle`, its Poincaré identity, its metric height identity and compatibility under integral scaling of a and D. Checks: m=2 gives a single difference; at ε=0 it is a nef pullback; ε>0 subtracts a positive external product and need not give an ample bundle on all of X^m.

Own `differenceProduct_genericallyFinite`: if integral Yᵢ⊂X are not contained in Z(X), the consecutive ordinary difference map on ∏Yᵢ is generically finite. Its fibre at (yᵢ) is the intersection ⋂(Yᵢ−yᵢ). To lower its positive dimension, avoid the finitely many closed sets of y in the next factor such that a maximal component C remains contained in Y−y. Such a set cannot be all of Y: that would imply Y+C⊂Y, and hence C lies in a translate of Stab(Y), of positive dimension. Then Y would be contained in Z(X), a contradiction. After m choices the intersection is zero-dimensional. This uses generic finiteness, not a claim that every fibre is finite.

Own `differenceBundle_sectionDimension`: for Y=∏Yᵢ as above, u=dim Y>0, Dᵢ=deg Yᵢ and ε≤u⁻¹(4m)^(-u)∏Dᵢ⁻¹, for sufficiently large divisible D,

 h⁰(Y,Q_(ε,a,D)) ≥ (4u!)⁻¹ D^u∏aᵢ^(2dim Yᵢ).

Intersection homogeneity multiplies the top degree of the ordinary difference pullback by ∏aᵢ^(2dim Yᵢ). Generic finiteness makes that unweighted degree a positive integer. To pass from this nef bundle to Q, cut by an effective divisor representing N_a and iterate its section exact sequence. Add a small positive rational multiple of N_a first, apply the geometric Hilbert polynomial, and bound the loss on this divisor by the external-product degree. The displayed choice of ε makes the loss less than three quarters of the positive leading term; then let D grow with all other data fixed. This avoids assuming Q is ample and avoids arithmetic Riemann–Roch. Source: Rémond, Lemma 2.1 and Proposition 2.1 with proof, pp.107–110; Faltings, Lemma 4.2, p.564, for intersection homogeneity. *Needs:* §§5.2,5.4; AbelianSchemesAndArithmeticModuli theorem of the cube; SchemeAndStackFoundations geometric Hilbert polynomials, intersection positivity and divisor exact sequences.

### 5.9d Polynomial presentations of large multiplication maps

Own `abelianMultiplication_polynomialHeight`. For fixed projectively normal (A,L) and a,b≥1, the pullbacks by [a,b]:(x,y)↦ax+by of products of two coordinate sections have polynomial representatives after multiplication by fixed coordinate powers of orders O(a²),O(b²), with bidegrees O(a²+b²) and coefficient height≤c(a²+b²). Here every coordinate power is recorded in the line-bundle identity: these are representatives of regular sections, not global rational coordinate formulas without a base-locus condition. One may take f(n)=⌊(n²−1)/8⌋ and the padding powers 2f(a),2f(b), with bidegree (2(a²+f(a)),2(b²+f(b))). The generating-family API includes the equality as sections, joint nonvanishing after varying the coordinate choices, and the uniform height bound for the complete family. Checks: a=b=1 is the fixed addition presentation; even multiplication is covered without dividing by an odd coordinate; rescaling all coordinate representatives leaves their projective coefficient height unchanged.

Start with a finite polynomial presentation of [1,1], provided by projective normality and the cube theorem. For n split n=n₁+n₂ with n₁,n₂ differing by at most one. The identity [1,1]∘([n₂],[n₁])=([n],[n₂−n₁]) reduces to smaller integers. The inequalities f(2n)≥4f(n) and f(2n+1)≥2f(n)+2f(n+1)+1 supply all padding. Heights obey a quadratic recurrence: substitute the two previously constructed coordinate families into the fixed addition forms, retain coefficient counts, and sum the resulting geometric series in n². This gives the quadratic bound, rather than an extra log n factor. Then compose [1,1] with [a]×[b]. Source: Rémond, Proposition 5.2 and proof, pp.126–129. *Needs:* §§0.17,0.21; AbelianSchemesAndArithmeticModuli cube theorem; SchemeAndStackFoundations projective normality and Künneth; DiophantineApproximationAndTranscendence coefficient-height calculus.

### 5.9e Small sections, a large index, and descent in dimension

Own `differenceBundle_smallSection`: under §5.9c's assumptions, a nonzero section of Q has a polynomial tuple representation of multidegree δᵢ=(2−ε)Dηᵢaᵢ², with

 h(F) ≤ C(Dᵢ,n,m)D Σᵢ aᵢ²(h_FS(Yᵢ)+1)+o(D).

All constants are independent of the weights a, and the limit takes D→∞ with those weights fixed. Choose the finite monic projection presentations of §5.9b. Represent polynomials in each primitive coordinate by exponents<Dᵢ, with unrestricted bounded-degree base-coordinate monomials. The resulting restriction map is injective and its dimension has the same leading term as the geometric section space. Injections Q→⊕O(δ) are induced by the generating sections of the complementary positive-difference bundle; their pairwise cross-multiplication equations give a locally split exact sequence and remain exact on Y. Use §5.9d to express its coefficients with degree and height O(DΣaᵢ²). Reduce high primitive-coordinate powers by their fixed monic equations, whose coefficients have height O(h_FS(Yᵢ)+1). Fixed common denominators for the finite multiplication table contribute o(D), as their number is fixed. Section dimension from §5.9c bounds the quotient of unknown dimension by kernel dimension independently of a. The number-field linear-kernel estimate in §5.10c then proves the displayed bound. This specifies the linear system, its nonzero kernel, its height and the uniformity that the iteration needs.

Own `differenceBundle_indexLower` and `boundedProduct_dimensionDrop`. Fix degree bounds for the Yᵢ and a small ε satisfying §5.9c for all of them. Suppose xᵢ∈Yᵢ(k)∖Z(X), their canonical-height directions are sufficiently close, their norms grow successively by a sufficiently large factor, and their minimum norm exceeds a constant determined by the weighted average Σaᵢ²(h_FS(Yᵢ)+1)/Σaᵢ². Choose integers a_m=1 and aᵢ/a_(i+1) nearest to ‖x_(i+1)‖/‖xᵢ‖, multiplying successive ratios, so aᵢ‖xᵢ‖ are comparable. The metric height of Q at x is then negative by at least cεDΣaᵢ²‖xᵢ‖². The section just constructed has index at least c′ε, for c′>0 depending only on the degree and dimension bounds, unless x lies on one of the bounded discriminant or coordinate hypersurfaces.

For this index bound, take the first nonzero divided local jet in the separate étale projection coordinates. The multivariable algebraic-branch recursion generalizes §5.10a with |α| in place of l and gives local denominators p_Y^(2|α|−1). The archimedean coefficient recursion adds only an exponential-in-|α| factor. Product formula at the nonzero jet bounds the negative Q-height by h(F) plus cΣ|αᵢ|(h_L(xᵢ)+h_FS(Yᵢ)+1). An index smaller than c′ε contradicts the negative height after taking the minimum norm large and D large. Discriminant-zero points are handled immediately by intersecting Yᵢ with that controlled hypersurface. This is why the index assertion keeps those exceptional points explicitly.

Otherwise take the function-field norm of a nonzero presentation coordinate along the finite product projection to ∏ℙ^{dim Yᵢ}. It is a nonzero multihomogeneous polynomial of degrees (∏Dⱼ)δᵢ, height≤(∏Dⱼ)h(F)+o(D), and index at least that of the section with the corresponding degree factor accounted for. Apply §5.9a to a dimension-length chain of index loci: some successive components coincide, and give a proper product of bounded-degree subvarieties containing the projected point. If necessary pass to the bounded constant field; a smooth rational point gives geometric integrality, while a point on a singular or conjugate intersection is put in the controlled exceptional locus instead. Pull back one proper factor and intersect with Yᵢ. The new product Y′ contains x, has strictly smaller dimension, bounded degrees depending only on the old degree bounds, and

 Σaᵢ²(h_FS(Y′ᵢ)+1) ≤ C Σaᵢ²(h_FS(Yᵢ)+1).

The weighted height bound in §5.9a, §5.9b's bounded projection equations and the hypersurface intersection inequality give precisely this recurrence. The factor aᵢ² is retained when selecting a proper factor; discarding it would not give an iteration uniform in the norm ratios. APIs: `differenceBundle_smallSection`, `differenceBundle_indexLower`, `boundedProduct_dimensionDrop`, and `dimensionDrop_weightedHeight`. Checks: all selected Yᵢ contain xᵢ outside Z(X), so §5.9c remains applicable; each step lowers total dimension by at least one; every degree and height constant is fixed before the final minimum-norm threshold, and D is sent to infinity only after the weights are fixed. Source: Rémond, Proposition 5.1 and Lemmas 5.1–5.4, pp.121–134; Proposition 6.1 and Lemmas 6.1–6.3, pp.134–148; the norm construction and Theorem 7.1, pp.148–150. The qualitative product and weighted-height input is owned at §5.9a; no explicit constants from Rémond's stronger effective product theorem are required. *Needs:* §§5.9a–5.9d,5.10a,5.10c; finite norms and geometric section dimensions at SchemeAndStackFoundations.

### 5.9f From the higher-dimensional gap to all cosets

Prove `subvariety_vojtaGap`: for X of positive dimension d, there are c₁,c₂,c₃>0 such that there are no m=d+1 points in X°(k), all of norm≥c₃, having consecutive norm ratios≥c₂ and pairwise directional cosines≥1−1/c₁. Start §5.9e at Yᵢ=X. There are at most md dimension drops. Bound the degrees and the weighted-height multiplier recursively for this finite number of steps, choose ε for the largest resulting degree bound, then choose the ratio and norm thresholds large enough for every step. At termination some Yᵢ is a point containing xᵢ. Its weighted height obeys the same bound, contradicting aᵢ²h_L(xᵢ) comparable to a₁²h_L(x₁) with h_L(x₁) above the chosen bound. This fixes the order in which the constants are chosen. Cover the unit sphere in A(k)⊗ℝ by finitely many sufficiently small caps. Northcott gives only finitely many bounded-norm points, while any infinite set in a cap supplies the m separated heights, contradicting the gap. Thus X°(k) is finite. Source: Rémond, Theorems 1.1–1.2, pp.104–106 and Theorem 3.1 with proof, pp.111–113.

Now own `ueno_cosetInduction` to obtain §5.9's full conclusion. Section 5.4 gives finitely many B>0 and carriers X_B+B; choose their polarization complements C. Enlarge k finitely so these directions and complements are defined. Addition φ:B×C→A is an isogeny. Its image on k-points has finite index because [n] factors through φ for some n and A(k)/nA(k) is finite by §1.7. Treat finitely many coset representatives t. The inverse image of (X_B+B)−t is B×Y_t for a closed Y_t⊂C of dimension at most dim X−dim B<dim X. Apply induction in C to Y_t(k), then push the resulting cosets through φ and translate by t. Together with the finitely many points of X°(k), this gives a finite coset cover contained in X. Finally recover k-defined cosets if the construction enlarged the field: for a coset containing a k-point, intersect all its Galois conjugates and split the finite component quotient of their intersection subgroup, choosing representatives only for components with k-points. Each retained coset lies in the original one. This handles points in the Ueno locus; finiteness of X° alone is not used as an equivalent statement. *Needs:* §§5.1,5.4a–5.4c,5.9e,1.7,1.8. Checks: X=A gives one coset rather than a finite point set; the dimension decreases in the complement at every induction; the finite-index step is for a fixed number field, not a claim of bounded-degree Northcott finiteness for all division points.


### 5.10 Vojta's inequality

Prove `TauCeti.Curve.vojta_inequality`. Let C be a smooth projective curve of genus g≥2 over a number field k, embedded in J using a degree-one divisor class after a finite extension if needed, with the theta Néron–Tate norm. Bombieri §10 Thm.1 gives an effectively determined γ(C)>1 such that if z,w∈C(k), ‖z‖≥γ(C) and ‖w‖≥γ(C)‖z‖, then ⟨z,w⟩≤(3/4)‖z‖‖w‖. Use the same normalization for the threshold and norm ratio; an arbitrary rescaling changes the threshold. Sections 5.10a–5.10e specify its local-jet, small-section and norm-to-Roth route; §5.10c keeps the uniform leading constant and the order of limits needed for this endpoint.

C of genus ≥ 2; k a number field; heights normalised as Néron–Tate heights for the theta divisor.

([The Mordell conjecture revisited](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §§3–10, Theorem 1 and proof, pp. 617–638.)

Construct the Vojta divisor on C × C and a small section by Siegel's lemma (Bombieri §§3, 8); lower bound for its height at (z, w) (§6); upper bound by Mumford's method (§5); derivative estimates and Roth's lemma bound the index (§§7, 9); combine in §10.

**Checks.**

- The inequality excludes infinitely many points in a narrow cone; combined with §5.11 (Mumford's gap principle) it gives finiteness.

*Needs:* §§5.10a–5.10e; §0.21 (The Néron–Tate canonical height); §0.17 (Weil's height machine); [TauCetiRoadmap.JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property).


### 5.10a Local section jets and algebraic derivative bounds

Fix the curve, the degree-one divisor P and all projective coordinate systems over the same number field k. Take F₁=P×C, F₂=C×P and Δ′=Δ−F₁−F₂. Choose fixed positive N,s so that NP on C and B=sF₁+sF₂−Δ′ on C² are very ample, with NP projectively normal. For positive integers d₁,d₂,d with δᵢ=(dᵢ+sd)/N integral, put V=d₁F₁+d₂F₂+dΔ′. Thus O(V)=O(δ₁NF₁+δ₂NF₂−dB), V²=2d₁d₂−2gd², and B has degree s on each curve fibre. Its section is represented by bihomogeneous forms Fᵢ of bidegree (δ₁,δ₂) satisfying Fᵢyⱼᵈ=Fⱼyᵢᵈ on C²; on yᵢ≠0 it is Fᵢ/yᵢᵈ. These identities, including gluing and invariance under adding equations of C², are the API `vojtaDivisor`, `vojtaSectionPresentation` and `vojtaDivisor_selfIntersection`. Checks: d=0 gives the external product; Δ′ intersects each fibre in zero; replacing Δ′ by Δ changes both the formula for δᵢ and the self-intersection and fails these checks.

Define `SectionJet` on the completed regular local ring at (z,w), after choosing separate parameters t,u and a local frame: it is the coefficient of tⁱuʲ in the section's formal expansion. A pair (i,j) is admissible when that coefficient is nonzero and every other coefficient in the rectangle 0≤a≤i,0≤b≤j vanishes. The local weighted index is the least i/d₁+j/d₂ with a nonzero coefficient. Use DiophantineApproximationAndTranscendence §1.2 for polynomial Hasse derivatives and weighted indices; the additional API here is passage to regular local completions, change of frame, change of each parameter and comparison with polynomial presentations. A frame change by a unit, or an invertible change of each parameter separately, preserves the least weighted degree; multiply series and use their nonzero constant or linear terms to prove both inequalities via inverse changes. A minimal-weight nonzero coefficient is admissible. Checks: t²u with weights (2,3) has index 4/3; the unit 1+t does not change it; exchanging the parameters also requires exchanging their weights. Mixing t and u need not preserve unequal weights and is excluded.

Own `algebraicBranch_dividedDerivative_bound`. If p(t,v) is a nonzero polynomial, p(0,v₀)=0, p_v(0,v₀)≠0 and |v₀|_ν≤1, the unique formal branch v(t) satisfies, for l≥1, |D_l v(0)|_ν≤A_ν^(2l−1) at finite places, where A_ν=‖p‖_ν/|p_v(0,v₀)|_ν. At infinite places allow the additional factor (2deg p)^(5l). The finite-place proof isolates p_v D_l v in the coefficient of tˡ and inducts with the divided Leibniz rule. For the infinite-place bound express p_v^(2l−1)v^(l) as a polynomial q_l in the coefficients and the point. Differentiation gives its recursion, degree at most (2l−1)(deg p−1), and factorial coefficient bounds; division by l! gives the stated exponential bound. Shift the fixed plane equations by the point and sum over places. Their coefficient heights and the reciprocal of the nonzero p_v are bounded by O(h_NP(z)+1), using the product formula. Hence the divided jets of the finitely many coordinate branches have height at most c l(h_NP(z)+1). The exceptional finite set includes zeros of the branch discriminants at t=0 as well as coordinate poles and ramification. The discriminant condition is retained even where a coordinate denominator is nonzero. Checks: a linear branch has zero higher derivatives; p_v=0 is excluded; the finite-place bound uses divided derivatives and has no factorial denominator loss.

*Needs:* §§0.15a,0.17,0.21; JacobianChallenge Layers E–F; SchemeAndStackFoundations geometric intersections, curve Riemann–Roch and Serre vanishing; DiophantineApproximationAndTranscendence §§1.2–1.3. Source: [Bombieri, The Mordell conjecture revisited](https://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §§3,6–7, Lemmas 3–6 and proofs, pp.618,623–628; [published erratum](https://www.numdam.org/item/ASNSP_1991_4_18_3_473_0.pdf), p.473, correction to Lemma 6.

### 5.10b Lower height from an admissible jet

Own `vojtaSection_admissibleJet_heightLower`. For the fixed coordinate systems there are constants c₁,c₂ and a fixed finite exceptional set Z⊂C such that every nonzero presented section of O(V), at (z,w)∈(C∖Z)(k)², with admissible (i,j), satisfies

h_V(z,w) ≥ −h(F)−c₁[i(h_NP(z)+1)+j(h_NP(w)+1)]−c₂(δ₁+δ₂)−o(δ₁+δ₂).

Here h(F) is the absolute projective height of the complete coefficient tuple, and the little-o term concerns growing integral divisor parameters with the coordinate systems fixed. Choose a nonvanishing local frame yₐ. Admissibility makes D_iD_j(Fₐ/yₐᵈ) equal to the corresponding derivative of Fₐ divided by yₐᵈ: the other Leibniz terms contain a smaller rectangular jet and vanish. Apply §5.10a's branch estimate and the divided polynomial Leibniz bounds, retaining the local projective-coordinate maxima defining the metric on V. The derivative value is a nonzero element of k. Its product formula cancels its place sum, while the coefficient maxima sum to h(F). The fixed number of polynomial terms gives a logarithmic-in-degree error, absorbed in the displayed error. Fixed frame and metric comparisons contribute c₂(δ₁+δ₂). This explains why nonvanishing and rectangular admissibility are both hypotheses; a zero derivative has no product-formula lower estimate.

The APIs are `admissibleJet_heightLower`, `admissibleJet_of_minimalWeightedDegree` and `exceptionalSet_discriminant`. Checks: multiplying the whole coefficient tuple by kˣ changes neither height nor inequality; an identically zero section is excluded; all constants are fixed before z,w and the growing divisor parameters are chosen. *Needs:* §5.10a, the product formula and §§0.15a,0.17. Source: Bombieri, §6 Lemma 4 and §7 Lemma 6, pp.625–628, with the published correction p.473.

### 5.10c A small section on the product surface

Own `numberField_linearKernel_smallVector` in the strength needed here. For fixed k, a rank-m system in q unknowns over k, with m<q and each nonzero row of absolute projective height at most H, has a nonzero kernel vector of height at most C_k(m/(q−m))(H+log q+1)+C_k. Independent rows may be selected first; their row heights do not increase. To reduce to the integer Siegel lemma, use one of finitely many ideal-class representatives for the coefficient ideal of each row. A scalar and then a unit make the row integral with every conjugate coefficient bounded by exp(C_k(H+1)). For the unit step, subtract the weighted average from the logarithms of the archimedean maxima and move this zero-sum vector into the bounded parallelepiped of the unit lattice. This uses Mathlib's `NumberField.Units.basisUnitLattice`, `logEmbedding_fundSystem`, `instZLattice_unitLattice` and `NumberField.RingOfIntegers.instFintypeClassGroup`, at the pins. Restriction of scalars with a fixed integral basis gives at most [k:ℚ]m integer equations in [k:ℚ]q integer unknowns and coefficients bounded by the same exponential times a fixed basis constant. Apply `Int.Matrix.exists_ne_zero_int_vec_norm_le`; convert back to k-coordinates and apply the fixed embedding matrix to bound their projective height. The denominator uses q−m, not q−[k:ℚ]m, because the unknowns as well as the equations were expanded. Checks: one equation in two k-unknowns is allowed even for [k:ℚ]>2; rescaling a row preserves the premise; a full-rank square system is excluded. This is the row-height adapter for DiophantineApproximationAndTranscendence §0.3, whose rational-integer-unknown statement alone has the stronger dimension restriction.

Fix 0<η<1 and large d₁,d₂,d with d₁d₂−gd²>ηd₁d₂. Own `vojta_smallSection`: there is a nonzero section σ with a presentation F as in §5.10a satisfying h(F)≤c₃(d₁+d₂)/η+o(d₁+d₂). Surface Riemann–Roch gives h⁰(O(V))≥d₁d₂−gd²−O(d₁+d₂+d); h² vanishes since K_C²−V has negative degree on the curve fibres for large parameters. This is geometric Riemann–Roch, rather than arithmetic Riemann–Roch.

Here is the linear system and its height control. Choose finite coordinate projections C→ℙ¹ of degree N and birational plane projections with monic degree-N equations for a second affine coordinate over the first. In the product function field the N² monomials in the two second coordinates, with each exponent<N, form a basis over the two first coordinates. Repeated monic reduction expresses every monomial in that basis with degree no larger than its original total degree and coefficient height bounded linearly in that degree. Restrict each Fᵢ to the span of basis monomials times first-coordinate powers of the permitted bidegrees. The codimension in the full presentation space is O(δ₁+δ₂), by the curve Hilbert polynomial. Rewrite Fᵢyⱼᵈ−Fⱼyᵢᵈ in this basis and clear the fixed denominators of its multiplication table. The first-coordinate powers in an unknown monomial only shift coefficient positions, without changing its coefficients. Its second-coordinate exponents are bounded by N−1. Thus monic reduction is applied to fixed bounded-degree factors times the d-th powers from yᵢ/yⱼ, giving row heights at most c₆d+O(log(δ₁+δ₂+d)); it does not give a leading term proportional to δ₁+δ₂. There are at most c₇δ₁δ₂ unknowns and a kernel of dimension at least ηd₁d₂−O(δ₁+δ₂). Apply the preceding number-field kernel estimate. Although δ₁δ₂/(d₁d₂) alone is unbounded as d₁/d₂ grows, the relevant leading product is bounded:

 d·δ₁δ₂/(d₁d₂) = N⁻²[d+sd²(d₁+d₂)/(d₁d₂)+s²d³/(d₁d₂)] ≤ c₈(d₁+d₂),

using d²<d₁d₂/g and 2d≤(d₁+d₂)/√g. This proves the constant c₃ in the displayed small-section estimate can be fixed before the ratio d₁/d₂. The logarithmic and lower-order errors are o(d₁+d₂) as the common scale grows with this ratio fixed, which is exactly the order of limits in §5.10e. There is no uniform little-o assertion while the ratio varies.

APIs: `numberField_linearKernel_smallVector`, `vojtaPresentation_kernelDimension`, `monicReduction_coefficientHeight`, `vojta_smallSection`. Checks: the positive margin η is necessary; a section represented by all zero restrictions is excluded; clearing a fixed denominator to the d-th power contributes a linear height term, not a bounded term. *Needs:* §5.10a; geometric surface Riemann–Roch and curve Hilbert polynomials in SchemeAndStackFoundations; the pinned number-field declarations just named and integer Siegel lemma. Source: Bombieri, §8 Lemma 7 and proof, pp.628–631. The leading constant is uniform in the degree ratio, with the order of limits specified above.

### 5.10d Norm polynomials and the imported Roth bound

Own `finiteProjection_normPresentation`: for a finite map π:C²→ℙ¹×ℙ¹ obtained as a product of degree-N projections, choose finitely many fixed sections yᵢ of B such that for each geometric fibre some yᵢ is nonzero at every point of that fibre. This is stronger than having no common zero on C². The sections of a very ample B avoiding the finite fibre form the complement of finitely many hyperplanes in H⁰(B). Over the infinite field k that complement has k-points. Their norm sections have nonvanishing loci covering the base; quasi-compactness extracts finitely many. Include these sections in the fixed projective presentation; there is no requirement that this generating family be a basis. Repeat for the finite list of coordinate projections used. The resulting API is `normGenerators_exist`, `normGenerator_unitOnFiber` and `normGenerator_baseChange`. Checks: a section vanishing at a different point of the same fibre has zero norm, even when it is nonzero at the selected point; the identity projection recovers ordinary global generation; one fixed section need not work on every fibre.

Take norms of Fᵢ and of yᵢ/y₀ in the product function-field extension. Write Norm(yᵢ/y₀)=Uᵢ/Vᵢ in lowest terms and Gᵢ=Norm(Fᵢ). Then Uᵢᵈ divides Gᵢ and Tᵢ=Gᵢ/Uᵢᵈ is a polynomial dividing G₀, of bidegree at most (Nd₁,Nd₂): Norm(Fᵢ) has bounds (N²δ₁,N²δ₂), while the zero divisor of Uᵢ has degree Ns in each factor. Choose a generator with nonzero norm at the base point. The local factor of the norm at (z,w), on a projection unramified at z,w, identifies its local parameters with base parameters. The other factors are regular because the generator is a unit on the whole fibre. Thus the local weighted index of σ is at most the polynomial weighted index of Tᵢ with the same weights (d₁,d₂). Enlarging Z by ramification and pole loci of the finite coordinate list makes these assertions applicable.

The norm is a determinant in the monic basis, giving h(G₀)≤c h(F)+c(δ₁+δ₂). The two-variable factor-height inequality h(Tᵢ)≤h(G₀)+c·deg G₀ follows from finite-place Gauss norms and the complex multivariate coefficient bound. For the latter, integrate log|P| on the product unit circles and apply the one-variable Jensen coefficient bound successively: log coefficient sup differs from this logarithmic Mahler mean by at most (deg₁P+deg₂P)log2 on the upper side, and by at most logarithms of the coefficient counts on the other side. Means add on products; the degree-linear error bounds any factor. This is the two-variable extension of DiophantineApproximationAndTranscendence §1.3, not a substitution whose degree grows like d₁d₂. Consequently h(Tᵢ)≤c₄(d₁+d₂)/η+o(d₁+d₂).

Apply DiophantineApproximationAndTranscendence §1.5 with n=2, σ=ε²≤1/2 and rᵢ=Ndᵢ. Choose coordinate ratios β₁,β₂ with h(β₁)≥h_NP(z)/n₀ and h(β₂)≥h_NP(w)/n₀, where n₀ is the fixed projective dimension; summing scalar ratio heights bounds the projective height. The imported theorem is in relative heights: dividing its hypothesis by [k:ℚ] gives rᵢh_abs(βᵢ)≥ε⁻²(h_abs(T)+8r₁). Therefore, if d₂≤ε²d₁ and min(d₁h_NP(z),d₂h_NP(w))≥c₅d₁/(ηε²), an admissible jet of σ satisfies i/d₁+j/d₂≤4Nε. The factor N converts the polynomial weights to section weights. No new Wronskian or polynomial Roth-index theory is defined here. Checks: ε²≤1/2 is retained; the height threshold is checked in both coordinates; the derivative-index inequality has the minus sign Ind(D_iP)≥Ind(P)−i/r required by the published erratum. *Needs:* §§5.10a–5.10c; finite flat norms, monic multiplication and determinants; DiophantineApproximationAndTranscendence §§1.2–1.5. Source: Bombieri, §9 Proposition, Roth lemma and Lemma 8, pp.632–637; erratum p.473. The fibre-avoiding generating-family choice supplies the norm nonvanishing step explicitly.

### 5.10e Balancing divisor parameters

Own `vojta_parameters_balance`. The height machine and the Abel–Jacobi theta restriction give

h_V(z,w) = d₁‖z‖²/(2g)+d₂‖w‖²/(2g)−d⟨z,w⟩+O(d₁‖z‖+d₂‖w‖+d₁+d₂+d).

The constants are independent of the growing divisor parameters. In particular h_NP(z)=N‖z‖²/(2g)+O(‖z‖+1), with the corresponding formula for w. The linear error in the norm is required; it is not replaced by O(1).

Fix a small positive a, then ε>0 with ε²≤1/2. For D→∞ choose d₁=√(g+a)D/‖z‖²+O(1), d₂=√(g+a)D/‖w‖²+O(1) and d=D/(‖z‖‖w‖)+O(1), with bounded congruence adjustments modulo N. The margin (d₁d₂−gd²)/(d₁d₂) tends to a/(g+a)>0. Take η smaller than this limit. The required ratio d₂/d₁≤ε² follows from ‖w‖/‖z‖≥2/ε, allowing rounding. The two height hypotheses of §5.10d follow from ‖z‖≥c/ε, using the corrected O(‖z‖) error, after increasing the fixed c. Combine §5.10b, the small-section height bound and the admissible-index estimate, divide by D and let D grow. The resulting upper bound for ⟨z,w⟩/(‖z‖‖w‖) is √(g+a)/g plus an error tending to zero as ε→0 and the norm threshold grows. Since 1/√g≤1/√2<3/4, choose a and ε and then the threshold to obtain §5.10. Increase it again to exclude the fixed finite Z.

APIs: `vojta_parameters_balance`, `vojta_margin_positive`, `thetaCurve_height_linearError` and §5.10's endpoint. Checks: g=1 has no margin below 3/4 in this calculation; bounded congruence changes disappear after division by D; rescaling the canonical height also rescales its absolute norm threshold. *Needs:* §§5.10a–5.10d,0.17,0.21; JacobianChallenge theta restriction and Abel–Jacobi; elementary limits and integer rounding. Source: Bombieri, §5 Lemmas 1–2, pp.621–622 and §10 Theorem 1 proof, pp.637–638; erratum p.473, including all three corrections to the p.638 height estimates.


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

For data over a number field, §5.13a reduces the division group to finitely generated Mordell–Lang using torsion orbit differences, equidistribution and moving supports. Sections 5.13b–5.13c give the arbitrary-characteristic-zero-field reduction by simultaneous Kummer specialization on the finitely many bounded abelian directions and their quotients.

Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

**Checks.**

- For X a curve of genus ≥ 2 in its Jacobian and Γ the division hull of J(K), X ∩ Γ is finite.

*Needs:* §5.9 (Faltings' theorem on rational points of subvarieties of abelian varieties); §5.6 (The Manin–Mumford theorem); §5.5 (Subgroups of finite rank); §5.4 (The Ueno locus).


### 5.13a Division groups over number fields and moving supports

Let A be an abelian variety over a number field k, Γ₀⊆A(k) finitely generated, and Γ its division group in A(k̄). Own `divisionGroup_mordellLang` without assuming that the division points have bounded degree or are all rational over one finite extension. For each x∈Γ and σ,τ∈G_k, the difference σx−τx is torsion: multiply by an integer sending x into Γ₀. For a sequence x_i generic in an irreducible X, form `orbitDifferenceSequence n` by concatenating all n-tuples of conjugates under `(z₁,…,z_n)↦(z₂−z₁,…,z_n−z₁)`, with their multiplicities. Its terms are torsion in A^{n−1}. Section 5.6 makes their closure a finite union of torsion cosets. Under finite extension, passage to a subsequence and multiplication by a common positive integer, the union of the coset directions only decreases. Noetherian descent therefore permits a choice minimal under these operations; a further multiplication kills all coset translations. Do this first for a fixed n>dim A and then for n=2. Multiplication is finite and preserves a generic counterexample and the dimension of its stabilizer.

Own `minimalOrbitDifferenceClosure`. Write the minimal two-point closure as a union of u connected subgroups C_j. One C occurs for at least 1/u of the ordered pairs for infinitely many i. The image y_i of x_i in A/C then has at most u conjugates: every fibre of an orbit map of a finite transitive Galois set has the same size, so the fraction of equal-image ordered pairs is exactly 1/#G_k(y_i). Differences of these images are torsion of degree at most u². Bounded-degree Northcott makes them a finite set, killed by one multiplication. Minimality forces the entire two-point closure to equal C. For an n-point component B⊆C^{n−1} containing at least 1/s of the tuples, freeze all but one coordinate. Subtracting two acceptable tuples puts at least 1/s² of the corresponding pairs in the axis subgroup B(q)=B∩C(q). Apply the same argument to the quotient **A/B(q)**, identifying B(q) with its subgroup of A on that axis. This quotient is meaningful before choosing a translate of C containing x_i. Minimality forces B(q)=C for every axis, hence the n-point closure is C^{n−1}. Finite component groups of the axis intersections are killed by one further multiplication. If C=0, every x_i is k-rational and Γ∩A(k) is finitely generated by Mordell–Weil; §5.9 contradicts a generic sequence in a positive-dimensional X with finite stabilizer.

Own `movingSupports_notHaar`. For projective V/ℂ and a closed family Y⊆V×S flat over integral S with fibres of dimension e<dim V, weak limits of probability measures supported on Y_{s_i} are supported on an e-dimensional closed subvariety. Embed S into the appropriate projective Hilbert scheme using its fixed Hilbert polynomial. A subsequence of the corresponding complex Hilbert points converges. The universal family is closed, so every compact set disjoint from the limiting fibre is eventually disjoint from these supports; its measure is zero. Generic flatness gives the same conclusion on a dense open of S for a generic parameter sequence. This uses compactness of the Hilbert scheme of projective V, not compactness of S.

Quotient X and A by Stab⁰(X) first. If C>0, put S=π(X) for π:A→A/C. The generic fibre of X→S has dimension e<dim C, since equality would imply X=π⁻¹(S) and C⊆Stab(X). The proper image Y of X^n_S under the difference map and projection to S has relative dimension at most ne<(n−1)dim C. The equality of the two-point closure with C gives π(x_i)∈S(k), so every Galois orbit of an n-point difference is supported on the corresponding fibre of Y. Choose a generic subsequence in C^{n−1}; §5.19 equidistributes its height-zero Galois orbits to Haar measure, whose support is all C^{n−1}(ℂ). The moving-support lemma contradicts the dimension bound. Induction on closed subsets and the stabilizer quotient then yields the full finite union of Γ-cosets, using the carrier/coset argument of §5.9f. APIs: `divisionGroup.orbitDifference_torsion`, `orbitDifferenceClosure_minimal`, `orbitDifferenceClosure_product`, `movingSupports_notHaar`, `divisionGroup_mordellLang` and restriction to an arbitrary subgroup of that division group.

**Checks.** For Γ₀=0 this recovers Manin–Mumford; it never asserts bounded degree of all torsion. A division point need not lie in A(k), so Mordell–Weil is applied only after the zero-difference reduction. A family of points of a projective variety can converge to a point mass but cannot converge to full-dimensional Haar measure; the fixed Hilbert polynomial is essential to that support assertion. A positive-dimensional stabilizer is removed before the strict relative-dimension inequality. *Needs:* §§5.5–5.6, 5.9f, 5.19, 1.0, 1.7; AlgebraicModuliForArithmeticGeometry's projective Hilbert scheme, universal family and generic flatness; native weak convergence on compact metric spaces. Sources: Poonen, [Mordell–Lang plus Bogomolov II: the division group](https://arxiv.org/pdf/math/9808127v1), Lemmas 7(8), 10, 12–14, §§6–8, pp.4–8. Only the abelian, zero-small-error specialization is needed here; no semiabelian equidistribution is assumed.

### 5.13b Injective specialization of a division group

Prove `finitelyGeneratedField_points_fg`: if E is finitely generated over ℚ and A/E is abelian, A(E) is finitely generated. The algebraic closure k of ℚ in E is a number field. Apply §1.10 to E/k: the quotient by the image of the trace's k-points is finitely generated, and those k-points are finitely generated by §1.7. This uses Lang–Néron, not the number-field theorem with its field hypothesis suppressed.

Prove `kummerHilbert_specialization_injective`. Given finitely many abelian varieties C_j/E, extend them to abelian schemes on a common smooth integral model S over k and shrink so chosen group generators are sections. There are Zariski dense closed points s, with number-field residue κ(s), at which all the homomorphisms C_j(E)→C_(j,s)(κ(s)) are injective. Choose a prime ℓ not dividing the torsion orders of these finitely generated groups. For each j take its finite ℓ-torsion cover and the finite ℓ-division covers of representatives of all nonzero classes in C_j(E)/ℓC_j(E). Choose a finite Galois cover dominating every component of these covers. Noether normalization makes S finite over an open of affine space after shrinking; apply InverseGaloisAndArithmeticFundamentalGroups IG.2.4's several-variable Hilbert theorem to a primitive element of the Galois closure over that rational function field. A connected fibre of this closure preserves all its subgroup and coset actions, including the subgroup defining E. A point on S above such a Hilbert point therefore preserves the original finite Galois action over E, even when κ(s) is larger than k. It follows both that no nonzero Kummer representative becomes ℓ-divisible and that C_(j,s)(κ(s))[ℓ]=0. Torsion specializes injectively by the finite étale argument below. A nonzero kernel element is therefore nontorsion and has a finite ℓ-adic valuation in the finitely generated source: write it as ℓ^r times an element not in ℓC_j(E), using that multiplication by ℓ is bijective on its prime-to-ℓ torsion subgroup. Multiplication by ℓ is injective on the target, so that element also specializes to zero, contradicting its Kummer class. This proves injectivity. Taking finitely many covers at once gives the simultaneous assertion.

Extend the specialization along a valuation of Ē centred at s, with residue field κ(s)̄; a flag on the smooth model gives such a valuation. Properness gives reduction of every algebraic point. Its restriction to torsion is injective: for each n, n is invertible on this characteristic-zero valuation ring, so the n-torsion is finite étale and a point specializing to its identity belongs to the identity section over the henselian valuation ring. Consequently specialization is injective on the division hull of C_j(E): if nx∈C_j(E) and x specializes to zero, injectivity on C_j(E) first makes nx=0 and torsion injectivity then makes x=0. This does not assert injectivity on all of C_j(Ē).

APIs: `finitelyGeneratedField_points_fg`, `kummerHilbert_specialization_injective`, `divisionHull_specialization_injective`, with simultaneous finite-family and prescribed-nonempty-open versions. **Checks:** specializing E:y²=x³−t²x+t² at t=2 can lower the rank and is not a valid arbitrary choice; preserving the Kummer quotient without excluding new ℓ-torsion does not imply injectivity; the closed point may have a number-field residue extension rather than lie in S(k); the injection is on a specified division hull, not the uncountable group of all geometric points. *Needs:* §§1.7,1.9–1.10 and finite-flat Kummer; InverseGaloisAndArithmeticFundamentalGroups IG.2.4, Hilbert subsets and number-field Hilbert irreducibility; SchemeAndStackFoundations spreading, finite covers, proper valuative criterion and henselian finite étale lifting. Sources: Billingsley, [An algorithm for checking injectivity of specialization maps from elliptic surfaces](https://arxiv.org/abs/2110.01151v2), Proposition 7 and Theorem 10 with proof, author pp.5–6, for the finite-generation/Kummer/no-new-torsion mechanism; the abelian, closed-point and division-hull adapters are proved above. Hindry, [Autour d'une conjecture de Serge Lang](https://webusers.imj-prg.fr/~marc.hindry/Conj-Lang.pdf), Appendix I, Proposition C, pp.598–599, is the characteristic-zero specialization application. Its bibliographic appeal to Lang's specialization theorem is replaced here by the finite-cover argument.

### 5.13c Preserving bounded abelian directions under specialization

Prove `boundedAbelianDirections_relativeFiniteEtale`. For a polarized abelian scheme A/S in characteristic zero and δ≥1, the functor of connected abelian subgroup schemes B in geometric fibres with deg_L B≤δ is represented, after shrinking the integral base, by a finite étale S-scheme, and its universal subgroup is compatible with base change. Only finitely many Hilbert polynomials occur: for a dimension-h abelian subvariety they are (deg_L B/h!)n^h. Start with their projective relative Hilbert schemes. Containment of the identity and preservation by inversion and addition are closed conditions. They are expressed by vanishing of finitely many universal ideal maps after a sufficiently large Serre twist; the source families and their products are proper flat. In characteristic zero their subgroup fibres are smooth. In this abelian setting, this last assertion follows directly on the formal completion: integrate the invariant differentials to obtain the formal logarithm; a closed Hopf ideal for the additive law is generated by linear forms, since its lowest remaining homogeneous term has all directional derivatives zero and characteristic zero permits division by its degree. Translate this smooth identity neighbourhood over the group. Connectedness is then an open-and-closed condition in this proper smooth subgroup family, by the finite étale component space. This gives a proper parameter space for connected subgroup fibres.

Its fibres are finite by §5.4b. It is unramified: an infinitesimal group-subvariety deformation in A with its identity fixed is a morphism B→Lie(A/B), hence a constant by properness; its value at the identity is zero. Thus it is proper quasi-finite and unramified, hence finite, and generic flatness gives the claimed finite étale open. After a finite extension of E=k(S), all its finitely many generic directions are defined. Shrink the corresponding model so the parameter scheme is a disjoint union of sections and all quotients A/B extend. This ensures that every bounded-degree abelian direction of a retained geometric special fibre is the specialization of one of this finite list. Without the degree bound, this assertion would be false.

Now prove `finiteRank_specialization_toNumberField`. Work over a finitely generated characteristic-zero E defining A, X and a generating group Γ₀, and replace X by an irreducible component of the reduced closure of X∩Γ₀^div. Shrink so X has geometrically integral fibres of fixed degree D. The maximal-coset direction bound §5.4a gives a common δ depending only on D and dim X. Apply the preceding target and enlarge E to define all generic directions of degree at most δ. Use §5.13b simultaneously for A and every quotient A/B on this finite list. At the resulting number-field fibre, §5.13a covers X_s∩Γ_(0,s)^div by finitely many cosets contained in X_s. Enlarge each to a maximal coset in X_s; its abelian direction has degree ≤δ, so it lifts to one of the B. If two original division points specialize into one such coset, their difference has zero image in the specialized quotient A_s/B_s. The quotient's division-hull injection then puts their original difference in B. Thus the preimages of each special coset lie in one generic coset of B. The original dense set is covered by finitely many such generic cosets. Irreducibility puts X inside one of them; its direction has dimension at most dim X because it specializes to a coset contained in X_s, so equality of dimensions gives X equal to that coset. Its intersection with Γ₀^div supplies the translating point. Repeat on the finitely many components. This proves §5.13 for arbitrary algebraically closed characteristic-zero fields after descending the finite initial data to E.

APIs: `boundedAbelianDirections_relativeFiniteEtale`, `boundedDirections_noNewSpecialization`, `finiteRank_specialization_toNumberField`, and the end theorem of §5.13. **Checks:** quotients must be included in the simultaneous injection, since injectivity in A alone does not control new coset relations; bounded degree makes the list finite on E² although its unbounded abelian directions are infinite; the special cosets need not lift as contained cosets in X, because density and dimension supply that conclusion only at the last step; specialization of arbitrary individual sections is not required to preserve membership in the Ueno complement. *Needs:* §§1.0,5.4a–5.4b,5.13a–5.13b; AbelianSchemesAndArithmeticModuli A2.7 and A6.3; SchemeAndStackFoundations SF.4 relative Hilbert schemes and Serre vanishing, proper-flat base change and generic flatness; SchemeAndStackFoundations T381 for relative Stein factorization and the component space of a proper smooth family. Sources: Rémond, *Décompte dans une conjecture de Lang*, Proposition 4.1, pp.529–535, and Lemma 4.6, pp.535–536, for the uniform direction bounds used in this construction; Hindry, Appendix I, pp.597–599, for the specialization reduction's goal. The relative parameter-space and simultaneous-quotient argument is the owned adapter here.

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

Use a dimension-controlled incidence argument. Put d=dim X and g=dim A. For a∉Stab(X), X∩(X−a) has dimension at most d−1, because X is irreducible. The incidence variety of (a,x₀,…,x_M) with all x_i and x_i+a in X, restricted to a∉Stab(X), therefore has dimension at most g+(M+1)(d−1). If M+1>g, its constructible image in X^{M+1} is not dense. Outside its closure, every other tuple with the same differences is a simultaneous translate by an element of Stab(X), and conversely all such translates occur. This proves the generic geometric-point orbit assertion with M₀=max(1,g). Since the proper restriction is generically finite and separable in characteristic zero, its generic finite map is étale on a nonempty open. Its degree is exactly |Stab(X)|, giving the reduced scheme-fibre orbit there. In particular, after quotienting by the whole stabilizer it is birational onto its image. This avoids inferring degree one from a possibly nonreduced singleton special fibre. Source: [Zhang, Equidistribution of small points on abelian varieties](https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf), Lemma 3.1 and proof, printed p.163; the incidence bound gives an explicit sufficient length using the same fibre description.

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


### 5.17a Arithmetic cycles and the action of metrized divisors

Own the arithmetic intersection interface needed here, in every dimension over a number field K. It is an action of metrized line bundles on arithmetic cycles, rather than a prerequisite consisting of the entire arithmetic Chow ring. Work first in a regular projective ambient scheme P over O_K with smooth generic fibre; products of projective spaces suffice for the models below. An arithmetic cycle of codimension p is a pair (Z,g), where Z is an algebraic cycle and g is a real (p−1,p−1)-current modulo images of ∂ and ∂̄, invariant under conjugation, such that ddᶜg+[Z(ℂ)] is smooth. Fix ddᶜ=(i/2π)∂∂̄ so that −log‖s‖² has curvature c₁(L,‖·‖) minus [div s]. Quotient by (div f,−log|f|²) on integral subvarieties. This is `ArithmeticCycleClass(P,p)`. Its API includes addition, the underlying algebraic cycle class, curvature, the map from smooth forms, principal relations, and proper pushforward. Checks: a principal pair has class zero; changing a Green current by a non-exact smooth form can change the class; the cycle 2[Z] retains multiplicity two, including on a nonreduced model.

Prove `ArithmeticCycleClass.metrizedDivisorAction`: a smooth hermitian line bundle L acts from codimension p to p+1. Move div s away from the finitely many generic points of the cycle. The algebraic part is its Cartier intersection; the analytic part is the Green product g_L*[Z,g]=g_L[Z]+c₁(L)g. Pullbacks of the logarithmic term to a singular cycle are defined on a characteristic-zero resolution and pushed forward. They are locally integrable and independent of resolution. The action depends only on L and the arithmetic-cycle class, commutes with another such divisor action, adds under tensor product, and satisfies the projection formula. Its proof needs only moving a divisor in a regular semilocal ring, the principal-divisor relation and Weil reciprocity, and Stokes for the Green terms; it does not assume a general moving lemma for higher arithmetic cycles. The regular ambient is essential: no resolution of an arbitrary O_K-model is asserted.

Own `ArithmeticCycleClass.degree` in top codimension: the finite contribution is Σ length·log Norm(𝔭), and the infinite contribution is one half of the integral over all complex embeddings, with the conjugation convention above. Principal pairs have degree zero by the product formula and reciprocity. Define the mixed model intersection `arithmeticIntersection(𝒳;L₀,…,L_d)` as follows. For a Green current g of the horizontal cycle 𝒳 in P, take the arithmetic degree of the successive divisor actions on (𝒳,g), and subtract one half of the integral of g∧c₁(L₀)∧⋯∧c₁(L_d) over P(ℂ), summed over embeddings. The change caused by replacing g is exactly the same in these two terms, so the difference is independent of g. An unadorned horizontal cycle does not itself specify an arithmetic Chow class. Here 𝒳 is flat projective of relative dimension d and its generic cycle is geometrically integral; it need not be regular. Equivalently, cutting with a rational section s of L_d gives the finite and horizontal divisor intersections minus the sum of the integrals of log‖s‖ against c₁(L₀)⋯c₁(L_(d−1)) on 𝒳(ℂ). This recursion fixes the sign and the factor one half in the squared-norm Green convention. Present each bundle on 𝒳 as a difference of globally generated bundles, embed by their generating sections, and extend their O(1) bundles to a product of projective spaces. Independence of the presentation follows from the projection formula on the graph of two presentations. The API is symmetry, multilinearity, Cartier restriction with its logarithmic integral, birational pullback, finite-extension scaling by [K′:K], and agreement in dimension zero with the arithmetic degree of a rank-one O_K-lattice.

**Checks.** A constant metric change ‖·‖↦e^(−t)‖·‖ in one slot changes the model intersection by [K:Q]t times the geometric mixed degree when applied at all embeddings; after division by [K:Q] it changes the normalized intersection by t times that degree. A vertical fibre contributes its multiplicity times log Norm(𝔭), with positive sign. Intersection on a singular horizontal cycle is computed with its cycle multiplicity, rather than by assuming its model is smooth.

Sources: Gillet–Soulé, [*Arithmetic intersection theory*](https://www.numdam.org/item/PMIHES_1990__72__93_0.pdf), §§1.2–1.3, pp.100–109, §§2.1–2.2, pp.111–120, and Theorem 4.2.3(iii) with its proof, pp.139–140,144–145. The full higher-codimension ring in that theorem is not imported as an unexplained input. *Needs:* ComplexComparisonPartII C5.3 (ddᶜ/Green operator) and C5.4 (cycle currents, Poincaré–Lelong and Chern normalization); AlgebraicModuliForArithmeticGeometry §9.4 (resolution over characteristic zero); SchemeAndStackFoundations SF.5 (Cartier cycle intersections, lengths and degree); §§0.9,0.15a; JacobianChallenge's curve divisor reciprocity. The arithmetic quotient, Green divisor action and presentation independence are owned here.

### 5.17b Semipositive adelic bundles and uniform model limits

Define `AdelicMetrizedLineBundle(X)` for a projective variety X/K, K a number field, as a line bundle with Galois-invariant continuous bounded local metrics whose finite-place metrics come from one projective O_K[S⁻¹]-model outside a finite S. Tensor products, duals, pullbacks and rational powers are defined fibrewise, using §0.24 for the already owned metric operations. The new data is the model condition, not another construction of bounded point metrics. A convergent model sequence has one fixed such S and one common metric outside S, with log ratios tending uniformly to zero at the places of S. The metric distance is the normalized weighted sum of those sup norms. Its API includes finite support, tensor/dual/pullback continuity, finite-base-extension invariance of normalized distance, model embeddings, and agreement of its point height with §0.17.

Define `SemipositiveAdelic` by such a uniform limit of rational model bundles that are relatively nef on every vertical curve and have smooth semipositive archimedean metrics extending locally from a smooth ambient. Define `IntegrableAdelic` as a difference of two semipositive bundles. Keep a witness of that presentation until independence is proved. A strictly positive archimedean metric is one with positive curvature on its smooth ambient along X. Checks: a relatively ample O(1) model with Fubini–Study metric is semipositive; dualizing a positive-degree bundle does not preserve semipositivity; convergence at each point without uniform convergence and a common good model is insufficient. A degree-zero constant metric twist is integrable, even when its point heights are negative: semipositivity concerns curvature and vertical degrees, not a positivity assertion about all arithmetic heights.

Prove `adelicIntersection_uniformBound`: if only the i-th metric changes by adelic distance at most ε and all the other bundles are semipositive, the mixed intersection divided by [K:Q] changes by at most ε times their geometric mixed degree. On a common normalized graph model, bound the vertical difference divisor above and below by ε times the full fibres; its intersection is bounded by vertical nefness. At infinity integrate the bounded log ratio against the positive mixed curvature measure. Multilinearity telescopes the estimate for several slots. Thus model mixed intersections converge, independently of the model sequence and of graph refinements; their limit is symmetric and multilinear and extends uniquely to integrable bundles. Do not use regular models at this step: use §5.17a's regular ambient and horizontal cycle.

Define `adelicCycleHeight(L,Z)=I(L^(d+1),Z)/((d+1)deg_L Z)` for a nonzero effective d-dimensional cycle and ample underlying L, with I already divided by [K:Q]. The API is finite-extension invariance, weighted additivity in effective cycles, agreement with point heights, scaling under L↦L^m by m, metric Lipschitz bound, projection formula for generically finite maps, and Cartier restriction. Define the archimedean probability measure on Z by c₁(L_v)^d/deg_L Z; use cycle currents on the regular locus and include multiplicities. Checks: a point has its original normalized point height; a double cycle has the same normalized height as its underlying cycle; scaling L by m multiplies height by m and does not multiply the probability mass.

Sources: Zhang, [*Small points and adelic metrics*](https://web.math.princeton.edu/~shouwu/publications/smpoint.pdf), §1, definitions (1.1)–(1.3), Theorems 1.4 and 1.7, author pp.3–8; Zhang, [*Positive line bundles on arithmetic varieties*](https://web.math.princeton.edu/~shouwu/publications/plav.pdf), Lemma 6.5, pp.214–215, for continuity through logarithmic divisor integrals. *Needs:* §§0.24–0.25,5.17a; SchemeAndStackFoundations projective graph models/normalization, Cartier intersections and degrees; ComplexComparisonPartII C5.4. This is the minimal arbitrary-dimensional arithmetic/adelic intersection material moved down from the higher Arakelov direction.

### 5.17c Positive-line-bundle spectral estimates

Own the analytic estimates for arithmetic Hilbert–Samuel. Their carriers, Chern connections, Sobolev spaces, elliptic regularity, Green operators and weighted ∂̄ solvability are imported from ComplexComparisonPartII C1.3–C1.4 and C5.3; they are not reconstructed here. For a positive smooth hermitian line bundle L on a compact projective complex manifold X of dimension d, choose the probability volume proportional to c₁(L)^d and let N_n=dim H⁰(X,L^n). Define `BergmanDensity(L,n)(x)=Σ‖s_j(x)‖²` in any L²-orthonormal basis. Its API is basis independence, integral N_n, reproducing-kernel evaluation, tensor-power indexing and positivity. Checks: changing an orthonormal basis leaves it fixed; rescaling the volume by c rescales density by c⁻¹; on a homogeneous projective space with its invariant probability volume it is the constant N_n.

Prove `bergmanDensity_uniform`: B_n/N_n→1 uniformly. Own the supporting `positiveMagnetic_localSpectrum` and `positiveMagnetic_heatEstimate`, restricted to tensor powers of a positive hermitian line bundle. In normal coordinates and a unitary frame, freeze the curvature to its constant Hermitian form. Separate variables into one-dimensional oscillators with eigenvalues (2j+1)b and ordinary Fourier modes; Hermite functions and elementary Gaussian integrals give their counting function and Mehler heat kernel. Dirichlet cutoffs give the lower counting bound, domain monotonicity gives the upper, and the boundary error divided by box volume tends to zero. For variable coefficients, the IMS identity ΣQ(ψ_i u)=Q(u)+∫Σ|dψ_i|²|u|² and minimax compare disjoint and covering boxes. Shrinking boxes with n r_n²→∞ and n r_n³→0 makes the coefficient and boundary errors tend to zero; the latter condition controls the cubic connection error and the smaller quartic metric error. This gives the low-energy count on relatively compact boxes; for positive curvature its ground band has asymptotic dimension N_n times the curvature volume of the box. Only continuity points of the limiting spectral distribution are used.

For the uniform diagonal heat estimate, compare the Dirichlet local heat kernel with the frozen oscillator by Duhamel iteration. Own the scalar Gaussian domination estimate used in this comparison: the pointwise norm inequality for a unitary connection is proved by differentiating a regularized norm, applying the scalar parabolic maximum principle, and exhausting the coordinate ball; a Gaussian supersolution bounds the scalar kernel there. Boundary terms are exponentially small in n r_n²/t. With r_n=n^(−5/12), the connection perturbation series is uniformly summable for t≤n^ε, 0<ε<1/6. The compact spectral expansion comes from the imported compact elliptic resolvent and Sobolev regularity. Bochner–Kodaira gives a gap ≥c n for nonholomorphic modes; applying the heat estimate at t=n^ε removes these modes uniformly and leaves B_n. No general semiclassical theory is an unowned prerequisite.

Prove `positiveBundle_uniformRestriction`: for a smooth divisor Y of a positive power L^a, restriction H⁰(X,L^n)→H⁰(Y,L^n|Y) has a linear L² right inverse of norm ≤C for every sufficiently large n, with C independent of n. Own this section extension theorem. Write Y=(s=0), regard L^n sections as top forms with values in F_n=L^n⊗K_X⁻¹, and scale the fixed metric on E=L^a so |s|≤e⁻². Then Θ(F_n)−Θ(E)=(n−a)Θ(L)−Θ(K_X) is strictly positive for large n and dominates the fixed curvature of E; the extension curvature inequality holds with one fixed α≥1. Since ds is nonvanishing on compact Y, its inverse norm is bounded independently of n.

Prove the twisted ∂̄ estimate needed for a uniform constant. For top-degree forms its curvature operator is B=[ηiΘ(F_n)−i∂∂̄η−iλ⁻¹∂η∧∂̄η,Λ]. Integration by parts and completing squares bound ⟨Bu,u⟩ by ‖(√η+√λ)∂̄*u‖²+‖√η∂̄u‖². The imported Hilbert-space solvability argument gives a correction whose squared norm with weight (η+λ)⁻¹ is bounded by 2∫⟨B⁻¹g,g⟩. For the additional weight |s|⁻², set σ_ε=log(|s|²+ε²), χ(t)=t−log(1−t), η_ε=ε−χ(σ_ε), λ_ε=χ′(σ_ε)²/χ″(σ_ε). Differentiation and the curvature inequality give B_ε≥[iε²∂η_ε∧∂̄η_ε/(χ′(σ_ε)|s|²),Λ].

Extend a section smoothly with ∂̄ error vanishing to first order on Y, cut it off at |s|<ε, and apply that estimate on X∖Y with a complete Kähler metric. The cutoff derivative is controlled by the displayed rank-one part of B_ε: its |s|⁻²-weighted integral tends to a fixed constant times ∫_Y|f|²/|ds|². The remaining first-order error tends to zero; strict curvature controls the other directions. Distributional cutoffs and Cauchy–Schwarz extend the corrected ∂̄ equation across Y, and elliptic regularity makes the corrected section holomorphic there. The correction vanishes on Y because its |s|⁻²-weighted norm is finite. Weak limits give ∫_X|F|²/(|s|²(log|s|)²)≤C∫_Y|f|²/|ds|². The weight has a positive lower bound, so the ordinary L² bound follows independently of n. Select the minimum-norm extension to get a linear right inverse. Only Dolbeault degree zero is asserted; the higher-cohomology extension is not needed.

Prove `multiplication_logDet`: if 0≠s∈H⁰(X,L^a), with smooth reduced divisor, and T_n=m_s* m_s on H⁰(X,L^n), then N_n⁻¹ log det T_n→∫log‖s‖² dμ_L. Jensen's inequality and B_n/N_n→1 give the lower bound. For the upper bound, take disjoint small boxes, inject their low-energy Dirichlet modes into H⁰ by the Bergman projection using the Bochner gap, and compare their weighted quadratic forms. The ground-band count supplies all but o(N_n) modes. Minimax bounds the determinant by the Riemann sum for log(‖s‖²+ε); then let the boxes shrink and ε→0, using the local integrability of log‖s‖. Scale s first to sup norm ≤1 so discarding modes has the correct inequality. The restriction and multiplication estimates imply that the real determinant-volume discrepancy in the divisor exact sequence is −N_n∫log‖s‖²+o(n^d), with the conjugate/real-place factors retained.

**Checks.** Scaling s by c changes the determinant expression by 2log|c| on both sides. A section with a reduced zero divisor still has a finite logarithmic integral; treating its minimum norm as positive would be false. A zero section is excluded. L² and sup section norms differ by at most C√N_n; their logarithmic covolumes consequently differ by O(N_n log n), not by a dimension-independent constant.

Sources: Bouche, [*Convergence de la métrique de Fubini–Study d'un fibré linéaire positif*](https://www.numdam.org/item/AIF_1990__40_1_117_0.pdf), Theorems 1–2 and proofs, pp.118–128, and the conclusion, pp.129–130; Demailly, [*Champs magnétiques et inégalités de Morse pour la d″-cohomologie*](https://www.numdam.org/item/AIF_1985__35_4_189_0.pdf), Theorem 1.6, pp.197–203, Theorem 2.3 and Proposition 2.6 with proofs, pp.205–214, and Theorem 3.14, p.221; Demailly, [*On the Ohsawa–Takegoshi–Manivel L² extension theorem*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/ohsawa_tak.pdf), Lemma 2.1, Proposition 3.1, Theorem 4.1 and its proof through §4.9, author pp.4–14; Abbes–Bouche, [*Théorème de Hilbert–Samuel «arithmétique»*](https://www.numdam.org/item/AIF_1995__45_2_375_0.pdf), Propositions 3.1–3.5 and Theorem 3.7 with Lemmas 3.8–3.11, pp.380–389. *Needs:* the named ComplexComparisonPartII targets, Mathlib finite-dimensional spectral/minimax linear algebra, Gaussian/Hermite calculations and Fourier analysis; SchemeAndStackFoundations Serre vanishing and smooth Bertini. The oscillator estimates, localization, uniform heat comparison, extension estimate and logarithmic determinant are the owned nonroutine steps.

### 5.17d Arithmetic Hilbert–Samuel and section lattices

Define `AdelicSectionLattice(L,n)` as H⁰(X,L^n) with local sup norms and with the O_K-lattice cut out by integral finite-place norms. Define its normalized arithmetic Euler characteristic χ̂ as minus the logarithmic covolume, including the finite torsion term and the standard Euclidean-ball normalization, divided by [K:Q]. Its API is norm monotonicity, a norm-comparison bound n·rank·ε+O(rank log rank), finite-extension compatibility up to O(rank log rank), and exact-sequence additivity with induced subspace/quotient volumes. Checks: a rank-one O_K-lattice gives its arithmetic degree up to the fixed ball constant; scaling all infinite norms by e^(−nt) adds nt·rank after normalization; changing an arbitrary quotient norm cannot be omitted from the exact-sequence identity.

Prove `arithmeticHilbertSamuel`: for an ample underlying bundle on a projective d-dimensional X/K with semipositive adelic metric,

χ̂(AdelicSectionLattice(L,n)) = I(L^(d+1),X) n^(d+1)/(d+1)! + o(n^(d+1)).

Begin with a flat projective O_K-model, ample model bundle, smooth generic fibre and positive archimedean curvature. A smooth generic hyperplane section gives the divisor exact sequence. Separate its horizontal closure from vertical components, retaining the vertical Tor term when the model is not regular. Serre vanishing gives exact sequences of section lattices. Their finite torsion growth is the ordinary Hilbert polynomial of the vertical coherent sheaves, counted with log Norm(𝔭). Section 5.17c computes the infinite determinant term. Induction on d and summing n^d gives the leading coefficient; the d=0 initial step is arithmetic degree of lattices in finite extensions of K and product formula. The Cartier restriction identity in §5.17a identifies that coefficient with I. This proof route does not require the full arithmetic Riemann–Roch theorem, Quillen metrics or analytic torsion.

For a semipositive model bundle, tensor by a rational ε of an auxiliary relatively ample positive bundle, prove the formula for the perturbed bundle, and let ε→0. Compare lattices on common graph models and use §5.17b and the norm-comparison estimate to pass to adelic uniform limits. For a singular generic cycle, take a projective model of its characteristic-zero resolution f:Ẋ→X, a positive auxiliary bundle M on Ẋ, and integral nonzero sections in M, f*L^a⊗M⁻¹, and a sufficiently positive twist of Hom(f_*O_Ẋ,O_X). The last is obtained from the conductor of finite normalization and Serre twisting. Multiplication gives upper and lower injections of section lattices with operator norms bounded by fixed constants raised to the relevant exponents. Both comparisons are necessary: coherent Hilbert growth alone does not control norms. For fixed a>n₁+n₂, compare the section lattice of L^(ab+i) with the two smooth-generic-fibre lattices of (f*L^a⊗M)^b⊗f*L^i and (f*L^(a−n₁−n₂)⊗M)^b⊗f*L^i, where 0≤i<a. Multiplication by s₁^b gives the upper comparison; multiplication by s₂^b followed by s₃^b gives the lower comparison, where s₁∈H⁰(M), s₂∈H⁰(f*L^n₁⊗M⁻¹) and s₃∈H⁰(L^n₂⊗Hom(f_*O_Ẋ,O_X)). Both bundles to which the smooth formula is applied contain a positive M factor. A section of f*L^n₁⊗M⁻¹ is used for multiplication only; that bundle need not be ample on a resolution. Hilbert polynomials bound rank deficits by O(a^(d−1)b^d). For an r-dimensional lattice with r′ controlled independent vectors, the covolume comparison has error at most log(r!)+(r−r′)log(max(1,λ_r)) plus the operator-norm terms; finite algebraic generation bounds log λ_r by O(ab). After b→∞ for fixed a these errors contribute O(1/a) to the normalized leading coefficient. Let a→∞. Multilinearity of §5.17a identifies the common limit with I(L^(d+1),X). No resolution of an integral model is used. The formula applies to singular subvarieties of abelian varieties as well.

Prove `positiveIntersection_existsStrictSmallSection`: when I(L^(d+1),X)>0, some L^n has a nonzero integral section with sup norm <1 at every archimedean embedding. Minkowski on the real section lattice converts the positive leading covolume term into a vector in the strict unit body; its dimension is O(n^d), so the ball-volume and discriminant terms are o(n^(d+1)). This is the short-section input used below. Checks: the coefficient is divided by (d+1)!, not d!; a constant metric shift t changes it by the predicted (d+1)t deg_L X; the strict-small-section conclusion is not asserted merely from a zero intersection.

Sources: Abbes–Bouche, §§2–4, pp.378–395, and Proposition 5.3, pp.399–400; Zhang, *Small points and adelic metrics*, Theorem 1.7, pp.7–8; Zhang, *Positive line bundles on arithmetic varieties*, Theorem 1.4, Lemmas 1.5–1.7 and §1.8, pp.189–193, and Corollary 1.9, p.193. *Needs:* §§5.17a–5.17c, native Minkowski/lattice results, SchemeAndStackFoundations Hilbert polynomials, coherent devissage and Serre vanishing. This is an owned asymptotic theorem; the exact arithmetic Riemann–Roch formula is not being silently assumed.

### 5.17e Norm-controlled lifting and arithmetic Nakai

Prove `semipositiveSection_powerLift`. Over F=R,C or a complete discretely valued field, let X/F be projective, Y⊂X reduced closed, L ample with a metric uniformly approximated by quotient metrics from generating sections, and M coherent with torsion-free restrictions as needed. For finitely many sections s_i of L|Y and a section m of M|Y, every sufficiently high product m∏s_i^a_i has a lift to L^(Σa_i)⊗M with sup norm at most e^(εΣa_i)‖m‖∏‖s_i‖^a_i, for any fixed ε>0. The bound is exponential with arbitrarily small rate, rather than a uniform bounded right inverse for all singular Y.

The quotient-metric approximation follows, at infinity, from §5.17c's evaluation estimates after a positive-curvature perturbation and restriction from an ambient; at finite places, from relatively nef model bundles plus a small ample perturbation and integral global generation. For a quotient metric, embed in P(V). In the nonarchimedean case approximate V's unit ball by finite Galois-stable lattices, extend on their projective integral models by Serre vanishing, and descend powers by the product of Galois conjugates. At infinity first prove a neighborhood extension estimate for reduced Y: a section already holomorphic on one fixed neighborhood U extends globally with sup norm ≤e^(εn) times its neighborhood norm for large n. Blow up the ideal of Y. Generators of I_Y⊗L^m define a distance function ρ whose log curvature is bounded below by −m times the curvature of L. Smooth convex regularizations retain this bound. Cut off the neighborhood section and correct its ∂̄ error with weight ρ^(−2dim X−1). The error is supported away from Y, so its weighted norm is bounded by the neighborhood norm; n times the positive curvature dominates the fixed negative terms. The weight forces the correction to vanish on Y. The L² estimate and the polynomial sup/L² bound give the e^(εn) bound. Choose algebraic lifts of every monomial in the fixed s_i with total degree between n₀ and 2n₀; choose one neighborhood U small enough for all these finitely many lifts to satisfy the e^(εn₀/2) norm bound. Their products give the neighborhood extensions in every high degree, and the extension estimate supplies the remaining half of the exponential rate. Twisting M to be generated and retaining finitely many residual exponents gives the mixed coherent case. Average with conjugation over R. This reduced-subvariety argument does not assert a bounded L² right inverse from its arbitrary section norm, which §5.17c proves only for a smooth divisor. Uniform metric comparison transfers the result to the limiting metric. Its API includes the ε-bound, algebraic equality on Y, fixed coherent twist M, finite-place integrality outside one fixed S, and compatibility with real descent. Checks: the lifted section restricts to the specified product, not just a scalar multiple; finite-place denominators are controlled at a fixed finite set; the factor e^(εn) is retained when Y is singular.

Prove `arithmeticNakai_strictSmallBasis`: if L is ample and semipositive adelic and I(L^(dim Y+1),Y)>0 on every nonempty integral subvariety Y⊂X, then for any fixed line bundle M, all sufficiently high H⁰(X,L^n⊗M) have an integral Z-basis of strictly small sections. A basis here is a basis of the underlying Z-lattice; an O_K-module need not be free. Section 5.17d supplies one strict-small section on each Y. Induct on dimension using the ideal filtration of its divisor, with successive quotients torsion-free coherent sheaves supported on integral lower-dimensional subvarieties. The graded section modules on each such support have finitely many generators. `semipositiveSection_powerLift` lifts their products with arbitrarily small exponential loss. Repeated multiplication by the fixed strict-small section provides exponential decay; round coefficients in a lattice filtration to assemble spanning vectors, and convert spanning vectors to a Z-basis with at most a rank factor. The rank grows polynomially, so the decay dominates it. These are the norm-filtration and lifting steps of Zhang Lemmas 4.4,4.6–4.7, not an unexplained appeal to arithmetic positivity.

**Checks.** Positivity is required on all horizontal subvarieties, not only on X. Integral bases need not be O_K-bases. A polynomial rank factor does not change the eventual strict inequality; a fixed exponential loss larger than the decay would change it. This target is asymptotic and asserts no effective computable threshold.

Source: Zhang, *Positive line bundles on arithmetic varieties*, Theorem 2.2 and Lemmas 2.4–2.6, pp.193–197; Theorems 3.3 and 3.5 and Lemma 3.4 with proofs, pp.198–202; Theorem 4.2, Lemma 4.4 and proof 4.5 with Lemmas 4.6–4.7, pp.202–207. *Needs:* §§0.15a,5.17c–5.17d; SchemeAndStackFoundations finite generation of section algebras/modules, Serre vanishing, coherent support filtrations and relatively nef plus ample implies ample. The power-lifting, lattice filtration estimates and strict-small-basis conclusion are owned here.

### 5.17f Successive minima and nonnegative cycle heights

Define `AdelicSuccessiveMinimum(L,X,i)` for 1≤i≤d+1 as the supremum, over closed subsets Z⊂X of codimension at least i, of inf{h_L(x):x∈(X∖Z)(K̄)}. Allow the empty exceptional set. Its API is the first minimum equal to the essential minimum, the last equal to the infimum of all point heights, monotonicity e₁≥⋯≥e_(d+1), tensor-power scaling, bounded-metric Lipschitz comparison, and finite-extension invariance. Checks: on a point the one minimum is its point height; an isolated zero-height point can lower the last minimum without lowering the essential minimum; a constant metric shift adds the same t to every minimum.

Prove `adelicSuccessiveMinima_inequality` for ample underlying L and semipositive adelic metric:

e₁ ≥ adelicCycleHeight(L,X) ≥ (e₁+⋯+e_(d+1))/(d+1).

For the first inequality shift the metric by −h(X)+ε. Its intersection is positive, so §5.17d gives a strict-small section; off its zero divisor, the point height is nonnegative. For the second, first prove `pointwiseNonnegative_cycleNonnegative`: if all point heights are ≥0 then every cycle height is ≥0. Induct on dimension, add an auxiliary strictly small Fubini–Study bundle, and consider the intersection polynomial of L+tH. All mixed coefficients except possibly the constant are nonnegative by induction and effective divisor restriction. If a positive root existed, §5.17e would give strict-small generating sections for every rational t just above it, making the polynomial at least t^(d+1)I(H^(d+1)); continuity at the root contradicts this. Thus the constant is nonnegative. This argument precedes the full minima inequality and avoids circularly using it.

Now twist L by −e_(d+1)+ε. All horizontal cycle heights become positive by the preceding assertion, so §5.17e supplies strict-small generating sections. For the finitely many exceptional loci nearly realizing e_i, construct a strictly small section of a power avoiding their generic points: high powers of separate generating sections and algebraic sections separating those finitely many components give this avoidance without losing the strict bound. Restrict to its effective divisor and apply induction, retaining the geometric degree factor and the logarithmic integral with its nonnegative sign. Let ε→0. Uniform model comparison then passes the inequalities to the adelic metric. Source: Zhang, *Positive line bundles on arithmetic varieties*, Theorem 5.2, Lemmas 5.3–5.4 and proof 5.6, pp.208–211; Lemma 6.5, pp.214–215; *Small points and adelic metrics*, Theorems 1.10–1.11, pp.8–9.

**Checks.** For constant shifts of the standard degree-one bundle on a point both inequalities are equalities. For nonnegative canonical point heights, cycle heights are nonnegative; essential minimum zero then forces cycle height zero by the other inequality. Arithmetic positivity cannot be inferred from relative nefness alone: a sufficiently negative constant metric twist is a counterexample.

*Needs:* §§5.17a–5.17e; finite component avoidance and projective section algebra; ordinary real polynomial continuity. The minima inequalities are now connected targets, not additional supplier contracts.

### 5.17g Canonical adelic cycle heights and the variational inequality

Upgrade §0.25's canonical point metric to a `SemipositiveAdelic` metric on a symmetric ample L on A/K. Start with an ample projective model and positive smooth archimedean metric; normalize the graph models of [m]^n and pull back the model bundle, dividing by m^(2n). Outside one fixed finite set the model is an abelian scheme and all metrics agree. Pullback preserves relative nefness; at infinity the normalized curvature converges to the invariant positive Hermitian form representing c₁(L). Indeed on the complex torus, average a positive representative over translation and solve the difference by ddᶜ using ComplexComparisonPartII C5.3; the normalized pullback potential tends uniformly to zero. Thus the fixed metric from §0.25 is semipositive, has strictly positive invariant curvature, and its cycle height satisfies h([m]Z)=m²h(Z) with the projection-degree normalization. Its API is metric/isometry uniqueness, point-height agreement, cycle scaling, tensor and product compatibility, restriction and finite-extension invariance. Checks: A has canonical cycle height zero by the multiplication projection formula; a torsion point has height zero; a nontorsion point need not have zero height even though the ambient A does.

Prove `smallGeneric_variationalInequality`: for projective geometrically integral X/K, an ample semipositive adelic L with positive smooth archimedean curvature, and a generic sequence x_n with h_L(x_n)→h_L(X), the orbit measures converge to c₁(L_v)^d/deg_L X at each archimedean v. For a real smooth test function f, perturb the v-metric by e^(−tf), with the conjugate perturbation at the paired embedding. Small |t| preserves positivity; use the same nonarchimedean model sequence. Intersection multilinearity and §5.17b give

h_(L(tf))(X)=h_L(X)+t w_v∫f dμ_(L,v)+O(t²),

where w_v is the normalized local weight, and point heights change by t w_v times the Galois-orbit average of f. Apply e₁≥h(X) from §5.17f to the generic sequence, divide by t of each sign and let t→0. The two inequalities force the expected average. Smooth approximation on the compact analytic space extends the assertion to continuous tests. If X is singular, restrict a smooth ambient test function and use the cycle measure; smooth ambient restrictions are uniformly dense. An arbitrary small sequence is insufficient: genericity is used to remove every exceptional divisor in the first minima inequality.

Source: Szpiro–Ullmo–Zhang, [*Équirépartition des petits points*](https://web.math.princeton.edu/~shouwu/publications/SUZ.pdf), Proposition 2.1 and Theorem 3.1 with proof, pp.342–344, and §4, pp.344–348; Zhang, *Small points and adelic metrics*, Theorems 2.2–2.3, pp.10–11. *Needs:* §§0.25,5.17b,5.17f; ComplexComparisonPartII C5.3–C5.4 and complex abelian uniformization from AbelianSchemesAndArithmeticModuli. The perturbation formula retains the normalized place weight; cancelling it gives the probability measure stated in §5.19.


### 5.18 The Bogomolov conjecture (Ullmo–Zhang)

Prove `TauCeti.AbelianVariety.bogomolov`. Let A be an abelian variety over a number field K, L a symmetric ample line bundle and X ⊆ A_{K̄} an irreducible closed subvariety that is not a torsion coset. Then μ_ess(X) > 0: there is ε > 0 such that {x ∈ X(K̄) : ĥ_L(x) < ε} is not Zariski dense in X. For a curve of genus ≥ 2 embedded in its Jacobian, the set of points of height < ε is finite (Ullmo). Manin–Mumford alone (height zero) does not imply this.

K a number field (characteristic 0); X not a torsion coset.

([Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017), §1, Théorème 1.1, p. 1 (arXiv alg-geom/9606017); [The Uniform Mordell–Lang Conjecture](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §5, Theorem 5.5 and proof, arXiv v2 pp.13–16, for the tropical equidistribution analogue; Theorem 1.1, p.1, and its proof in §6, pp.17–18, for the totally degenerate function-field Bogomolov theorem, not the number-field generality stated here.)

Assume μ_ess(X)=0. Divide by the entire stabilizer, using §§1.0 and 5.2 for its reduced connected part and A3.3 for the remaining finite subgroup. Pullback of an ample quotient polarization is bounded above by a positive multiple of L in the ample cone, so canonical quotient heights of the small points tend to zero. If the quotient of X is a point, that point has height zero and is torsion by §0.22; its inverse-image component X is a torsion coset. This handles a translate with non-torsion representative correctly by testing its quotient point. Otherwise the quotient Y has positive dimension and trivial stabilizer.

Choose M+1>dim(A/Stab(X)). By §5.15 the difference morphism from Y^{M+1} to its closed image Z is birational. Construct a generic small sequence of tuples in Y^{M+1}: enumerate the proper subvarieties over the countable algebraic closure of a number field, and at step n choose a tuple outside the first n, with every coordinate height less than 1/n. The product of the small-point sets is dense, so this is possible. Each tuple and its image have heights tending to zero by the quadratic difference bound; the image sequence is generic because the map is dominant. Enlarge the number field once to define Y,Z and all maps, and apply §5.19 to both sequences.

The map pushes a uniform Galois-orbit measure to the uniform measure on its image orbit: a finite equivariant surjection of transitive Galois sets has equal-size fibres. Passing to the limit, the difference map pushes the product canonical measure of Y^{M+1} to that of Z. On its birational open this means equality of the source normalized top form and the pullback of the target normalized top form. Both are restrictions of smooth ambient forms, so the equality extends over the smooth source by density, even when Z is singular at the diagonal image. At a diagonal tuple of smooth Y-points, the derivative of the difference map kills the diagonal tangent space of positive dimension; its pulled-back top form is zero. The source product of invariant positive forms is strictly positive there. This contradiction proves μ_ess(X)>0. This argument precedes, and does not assume, Manin–Mumford. Source: [Zhang, Equidistribution of small points on abelian varieties](https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf), Theorem 2.1 and Remark 2.2, p.162, Lemma 3.1, p.163, and proof of Theorem 1.1, pp.164–165.

**Checks.**

- For X=x+B, assume the image of x in A/B has infinite order; x itself having infinite order does not suffice when x∈B. Then μ_ess(X)>0. An exact equality with a quotient-point height requires the specified quotient-induced orthogonal polarization; arbitrary polarizations only give the appropriate comparison/positivity.

*Needs:* §5.17 (The essential minimum of a subvariety); §5.15 (Zhang's difference-map lemma); §5.16 (The minimal torsion subvariety containing X); §5.19 (Equidistribution of small points on abelian varieties).


### 5.19 Equidistribution of small points on abelian varieties

Prove `TauCeti.AbelianVariety.equidistribution_small_points`. Let A be an abelian variety over a number field K, L symmetric ample, X ⊆ A geometrically irreducible and defined over K (after a finite extension if needed) with μ_ess(X) = 0, and (x_n) a generic sequence in X(K̄) (no infinite subsequence lies in a proper closed subvariety of X) with ĥ_L(x_n) → 0. Then for every archimedean place v the probability measures equidistributed on the Galois orbits of x_n in X(ℂ_v) converge weakly to the normalised canonical measure c₁(L, ‖·‖_can)^{dim X}/deg_L X.

K a number field; (x_n) generic and small. For the general-subvariety version use Ullmo Thm.2.4: a semipositive adelic metric with strictly positive archimedean curvature and the prescribed uniform approximation by arithmetic model metrics, with the normalized subvariety height and generic small sequence. The abelian canonical version is Thm.2.3; the general version is not inferred solely from μ_ess=0 without the metric/intersection input. Take Galois orbits over a field of definition of X; otherwise their support can leave X and the asserted measure on X(ℂ_v) is ill-typed. Generic means that every proper closed subset contains only finitely many terms, not that no finite subsequence lies in it.

([Positivité et discrétion des points algébriques des courbes](https://arxiv.org/abs/alg-geom/9606017), §1, discussion of Zhang's admissible pairing and equidistribution, pp. 1–3; [The Bogomolov conjecture for totally degenerate abelian varieties](https://arxiv.org/abs/math/0609387v2), §1 and §5, citing Zhang 1998 and Szpiro–Ullmo–Zhang; [Adelic Line Bundles on Quasi-projective Varieties](https://arxiv.org/abs/2105.13587v9), Theorem A.6.3, pp.248–249: generic, height-small sequences for a relatively semipositive adelic metric on an ample bundle.)

Szpiro–Ullmo–Zhang 1997: Zhang's successive minima inequality for adelic metrized line bundles and the variational principle with perturbed metrics.

The canonical metric is semipositive and has invariant positive archimedean curvature by §5.17g. Canonical point heights are nonnegative; §5.17f then gives nonnegative cycle height. Since μ_ess(X)=0, its other inequality gives h_L(X)=0. Thus the sequence meets the height-equality hypothesis of §5.17g, which proves the stated convergence. This uses the arbitrary-dimensional intersections, Hilbert–Samuel and minima targets in §§5.17a–5.17f, rather than a point-metric assumption.

**Checks.**

- For an elliptic curve E over a number field, a generic sequence of torsion points has Galois-orbit measures converging to Haar measure. A constant torsion sequence is not generic and does not equidistribute.

*Needs:* §§5.17a–5.17g; §5.17 (The essential minimum of a subvariety); §0.21 (The Néron–Tate canonical height).


### 5.20 Hypersurface sections of abelian varieties containing no cosets

Prove `TauCeti.AbelianVariety.exists_cosetFree_hypersurface`. Let A ⊆ ℙ^M be an abelian variety of dimension g ≥ 1 and d ≥ g − 1. There is a dense Zariski open U in the space of degree-d forms, with complement of codimension ≥ d + 2 − g, such that A ∩ 𝒵(f) contains no positive-dimensional coset for f ∈ U. For an abelian subvariety B with dim B ≥ 1 and d ≥ max{1, g − dim B}, the forms f with A ∩ 𝒵(f) containing a translate of B lie in a closed subset of codimension ≥ d + 1 + dim B − g. The Hilbert function satisfies H_V(d) ≥ binom(dim V + d, dim V) ≥ d + 1 for V ⊆ ℙ^M with dim V ≥ 1.

A ⊆ ℙ^M projective; d as stated. A and the form space are over an algebraically closed field of characteristic zero. The good open excludes forms vanishing identically on A, including the zero form.

([Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/abs/1801.05762v3), (C.1), Lemma C.2 and Proposition C.1 with corollary and proofs, pp. 59–61.)

Incidence variety of (coset translate, form) and fibre dimension counts using the Hilbert function lower bound (Gao–Habegger Lemma C.2 and (C.1)).

Bogomolov's finiteness of maximal cosets reduces to finitely many B (§5.4 (The Ueno locus)); apply Lemma C.2 to each (Proposition C.1).

**Checks.**

- For g=1, every form not identically zero on A gives a finite section; forms identically zero on A give the whole elliptic curve and lie outside U. In particular U is not the entire vector space of forms.

*Needs:* §5.4 (The Ueno locus); §5.1 (Abelian subvarieties, cosets and quotients); SchemeAndStackFoundations §§5.1–5.6 and 5.12; TauCetiRoadmap.StableReduction Layer 2 for ampleness; §0.15a supplies local presentation bounds; §2.19a supplies curve Brauer reciprocity.


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

Manin's theorem follows from §§3.17b–3.17d: a nonzero locally soluble torsor outside the maximal divisible subgroup has a dual Sha class with nonzero pairing, realized as a Brauer class on C. Thus the hypothesis Sha(E/K)_div=0 already suffices; finite Sha implies it. The pairing and its Brauer comparison themselves require no finiteness assumption.

**Checks.**

- The curves 2w² = x⁴ + 1 and w² = x⁴ + 1 have rational points and are elliptic curves of rank 0 (Poonen §8.3).

*Needs:* §§3.17–3.17d; §1.7 (The Mordell–Weil theorem); §1.3 (Selmer groups and Tate–Shafarevich groups of abelian varieties); §3.18 (Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction); §2.13 (The Brauer–Manin pairing and set for varieties).


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
