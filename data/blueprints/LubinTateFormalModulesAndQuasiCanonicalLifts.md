# Lubin–Tate formal modules and quasi-canonical lifts

This is the formal-module continuation of **Finite flat group schemes and integral p-adic Hodge theory**. It starts from that roadmap’s connected p-divisible groups, Tate modules and finite Dieudonné Frobenius. Its endpoints are the Lubin–Tate character comparison with the existing arithmetic Artin map, universal finite-height marked deformations, and the integral lattice construction of quasi-canonical lifts with their smallest marked ring-class fields. The BKO specialization constructs the two local towers and the maps between their formal traces.

The formal-module foundations apply to every finite extension K/Q_p. For the CM construction distinguish the coefficient field F0 from the CM extension F; the quadratic field-degree results cover both ramified and unramified F/F0, including residue characteristic two. Only the BKO and stated Honda comparison impose p≥5 and Φ/Q_p unramified quadratic. A higher-height cohomological tower theorem is not inferred from the rank-one Lubin–Tate character.

## Conventions

- O_K has uniformizer π and residue cardinality q. A formal O_K-module is one-dimensional, commutative, and has an actual unital O_K-action whose derivative is the coefficient structure map. Its O_K-height is h; the underlying p-divisible height is h[K:Q_p].
- A strict coordinate has derivative one. A marked deformation carries a specified identification of its special fiber; marked isomorphisms preserve that entire identification. These conditions are distinct.
- Formal logarithms have zero constant term and derivative one. Coordinate comparison includes the derivative factor. They converge on maximal ideals; their exponentials need only be inverse on a sufficiently deep ideal. Torsion prevents a general injectivity claim.
- Fix separable closures and embeddings before forming fields. Arithmetic reciprocity sends uniformizers to arithmetic Frobenius. Thus χ_π(Art_K(π^r u))=u^−1. Changing π to uπ twists χ by the unramified character with arithmetic Frobenius value u.
- The deformation coefficient ring B is specified with its residue field. No canonical Cohen ring for an arbitrary imperfect field is assumed. For finite k_F in the CM field problem choose B=O_(F^ur), where F^ur/F0 is the maximal unramified subextension of F/F0. This B embeds in every field whose marked modulus is considered.
- For a lattice L⊃T with [L:T]=q0^N, the quotient is marked to the q0^N-Frobenius twist. Multiplication by π_F supplies coherent comparison when that exponent changes by the residue degree. Over a nonclosed residue field one keeps the twist component rather than identifying forms after algebraic closure.
- For quadratic F/F0, O_s=O0+varpi0^s O_F uses the **smaller-field uniformizer**. Positive levels have degrees q0^(s−1)(q0+1) unramified and q0^s ramified. Canonical s=0 is separate. Minimal fields mean smallest fields **containing F for the marked deformation**; forgetting the marking or the CM coefficient field changes the question.
- In BKO, p≥5, Φ/Q_p is unramified quadratic and π=−p. Φ_n uses π^(n+1)-torsion, while Ψ′_s is the level-s quasi-canonical field. The comparison is Ψ_n=(Ψ′_(n+1))^Δ′, with |Δ′|=p+1. For [−p]v_(n+1)=v_n, the p-adic Tate generator is w_n=[(−1)^n]v_n.

## Existing inputs and boundaries

The existing Mathlib `FormalGroup` is the law carrier; commutativity is its separate `IsComm` class. `FormalGroup.map` is coefficient base change. `FormalGroup.Point` has power-series-valued parameters and does not supply maximal-ideal-valued points. Tau Ceti already supplies the Weierstrass law and its adic point group. For a height-one Dedekind adic-completion presentation it also supplies the unconditional `formalPointHomAdicCompletion`, its injectivity and its range. The generic `formalPointHom` has an explicit auxiliary-point hypothesis. Every comparison uses the applicable existing theorem with those hypotheses.

| Owner | Input used here | Boundary |
| --- | --- | --- |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 | Actual connected p-divisible groups, Tate modules and connected formal/p-divisible equivalence | Their carriers and equivalence are imported. Formal O_K-actions and Lubin–Tate/quasi-canonical constructions are here. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 | Finite contravariant Dieudonné theory and Frobenius/Verschiebung | Use its variance and actual finite-level Frobenius; do not create a second Dieudonné module. |
| tauceti:TauCetiRoadmap/ModularCurves, 0B/0C/2B/7C/7D/7E/7F | Finite flat carriers and quotients, elliptic quotients, completion, marked elliptic deformations, height two and Serre–Tate | Prove comparisons with their elliptic special cases. |
| tauceti:TauCetiRoadmap/EllipticCurves, Layers 1 and 3 | Isogeny degree, invariant differential, elliptic formal logarithm/exponential and Frobenius polynomial | General formal-module logarithms specialize to this API. Formal CM does not imply global elliptic CM. |
| tauceti:TauCetiRoadmap/ClassFieldTheory, Layers 5–8 | Existing arithmetic local reciprocity and class-field correspondence | Construct the Lubin–Tate extension and compare its character; no rival Artin map. |
| tauceti:TauCetiRoadmap/LocalFieldsRamification, Layers 0–1 | Complete fields, units, Teichmüller and deep logarithm/exponential | Reuse the deep-unit equivalence; prove only the quadratic eigendirection calculation here. |

EndoscopicTransferAndUnitaryTraceComparison:ET.6a consumes formal O_K-modules, their torsion and finite-height deformation spaces for its two-tower/cohomological realization. VectorBundlesAndIsocrystals:VB3:positive-basic-examples consumes these same formal modules for its diamond universal-cover calculation. Neither is a prerequisite. AnticyclotomicLocalUnits, the ColemanPowerSeries Part II direction, consumes the BKO fields and trace/coordinate/sign maps; it owns local-unit decompositions, distinguished local points and their recurrence. UnitaryKudlaRapoportCycles and GrossZagierAndArithmeticHeights:GZ.7 consume the quadratic lifts and field degrees. Integral Breuil–Kisin realizations, conjugate-semilinear special endomorphisms and wild lifting-depth formulas require their own continuation beyond this foundation.

## Layer overview

| Layer | Targets |
| --- | --- |
| LT.0 | Formal modules, coordinates and complete points |
| LT.1 | Lubin–Tate construction and coordinate independence |
| LT.2 | Torsion, Tate modules and the Artin comparison |
| LT.3 | Marked deformations at finite height |
| LT.4 | Unramified Honda and elliptic comparisons |
| LT.5 | Lattice kernels and integral quotient isogenies |
| LT.6 | Canonical and Frobenius-marked quasi-canonical lifts |
| LT.7 | Quadratic orders, minimal fields and boundary tests |
| LT.8 | The BKO tame and anticyclotomic towers |
| LT.9 | Formal traces and compatible tower maps |

## Library starting point

The input declarations below have been read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular Weierstrass preparation and its quotient algebra equivalence already exist; the formal-module torsion construction uses them. The current roadmaps and current library have also been checked for existing ownership. The principal-unit logarithm is available in the current local-field development beyond these pins and is imported through LocalFieldsRamification Layer 1.

- **mathlib:FormalGroup** (`Mathlib/RingTheory/FormalGroup/Basic.lean`): One-dimensional formal group law in two variables, with associativity and tangent identities; commutativity is the separate FormalGroup.IsComm class.
- **mathlib:FormalGroup.map** (`Mathlib/RingTheory/FormalGroup/Basic.lean`): Coefficientwise base change of the existing law along a ring homomorphism.
- **mathlib:FormalGroup.Point** (`Mathlib/RingTheory/FormalGroup/Basic.lean`): Points in multivariate power series with nilpotent constant coefficient; these are not maximal-ideal-valued points of a valued field.
- **mathlib:PowerSeries.subst_substInvOfIsUnit_left** (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): A zero-constant series with unit linear coefficient has a two-sided substitution inverse; the cited left identity and its adjacent right identity supply coordinate inverses.
- **mathlib:PowerSeries.eval₂Hom** (`Mathlib/RingTheory/PowerSeries/Evaluation.lean`): Evaluation as a ring homomorphism at a topologically nilpotent element of a complete separated linearly topologized ring, with continuous coefficient map.
- **mathlib:PowerSeries.comp_eval₂** (`Mathlib/RingTheory/PowerSeries/Evaluation.lean`): Evaluation commutes with a continuous ring homomorphism into another complete separated linear topological ring.
- **mathlib:PowerSeries.exists_isWeierstrassFactorization** (`Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`): Weierstrass factorization over a maximal-ideal-adically complete local ring when the reduced series is nonzero.
- **mathlib:PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient** (`Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`): For a Weierstrass factorization, identifies the distinguished-polynomial quotient with the power-series quotient over an adically complete coefficient ring.
- **tauceti:WeierstrassCurve.formalGroup** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`): The Weierstrass formal law on Mathlib FormalGroup, including the commutativity instance.
- **tauceti:WeierstrassCurve.map_formalGroup** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`): The Weierstrass formal law commutes with coefficient base change.
- **tauceti:WeierstrassCurve.FormalGroupPoint** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.lean`): The newtype of parameters in an adic ideal, with evaluated elliptic addition, inverse and AddCommGroup structure.
- **tauceti:WeierstrassCurve.formalPointHom** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Hom.lean`): Injective formal parameter homomorphism into affine curve points, under the explicit auxiliary-point hypothesis haux; this is not an unconditional surjectivity theorem.
- **tauceti:WeierstrassCurve.formalPointHomAdicCompletion** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean`): For a curve over the integers of a height-one Dedekind adic completion, elliptic over its completed fraction field, the formal parameter map is an unconditional additive homomorphism into affine points.
- **tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean`): The unconditional Dedekind adic-completion formal parameter homomorphism is injective.
- **tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion** (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.lean`): For that same Dedekind-completion presentation, its range is the identity together with points whose x-coordinate has valuation greater than one in the multiplicative convention; classically the kernel of reduction.

## LT.0. Formal modules, coordinates and complete points

Extend the native one-dimensional commutative formal law by actual homomorphisms and a tangent-compatible coefficient-ring action. Distinguish the library’s power-series-valued points from evaluated maximal-ideal points. Construct normalized logarithms and their deep analytic inverse, and compare the elliptic specialization to the existing law and point maps.

**Layer inputs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

### Formal group homomorphisms

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-hom` (definition).

For commutative rings R and commutative Mathlib formal laws F,G, a homomorphism is h∈XR[[X]] satisfying h(F(X,Y))=G(h(X),h(Y)). Hom(F,G) has pointwise G-addition; composition gives the endomorphism ring. An isomorphism has unit derivative and the existing substitution inverse; strict means derivative one. None of these conditions identifies the entire reduction with X.

**Prerequisites:** `mathlib:FormalGroup`, `mathlib:PowerSeries.subst_substInvOfIsUnit_left`.

**Proof/construction.**

1. Use substitution identities to prove closure under composition and formal addition, then construct the inverse by PowerSeries.substInvOfIsUnit.
2. Prove coefficient extensionality, tangent additivity/multiplicativity and coefficient base change. Preserve source and target laws in every substitution.

**API.**

- `FormalGroupHom.ext` (extensionality): Equal coefficients give equal homomorphisms.
- `FormalGroupHom.derivative` (projection): The coefficient of X is additive on homs and multiplicative under composition.
- `FormalGroupHom.map` (functoriality): Coefficient change transports homs; map_id and map_comp hold.
- `FormalGroupIso.ofUnitDerivative` (equivalence): The substitution inverse is a homomorphism and inverse to h.
- `FormalGroupIso.conjugate` (compatibility): Coordinate conjugation transports homs and commutes with base change.

**Uses.** LT.1/lt-module: Packages the interpolated endomorphisms without a second formal-law type. LT.3/marked-deformation: Distinguishes tangent normalization from preservation of the special-fiber marking.

**Checks and worked examples.**

- `identity_coordinate` (degenerate): X is the identity, with derivative 1.
- `multiplicative_n` (computation): For G_m, (1+X)^n−1 is multiplication by n, not the series nX for n=2.
- `nonhom` (non-example): X+X² is not an endomorphism of G_a over Q.
- `strict_not_marked` (non-example): Over F_p, X+X^p is an invertible additive series with derivative 1 and is not X.

**Acceptance.** The hom carrier coerces injectively to PowerSeries R; inverse identities are two-sided. Strictness and a special-fiber marking are separately named predicates.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), §1, Proposition 1.6, p.220. Homomorphisms and their tangent maps; logarithms determine characteristic-zero homomorphisms. [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Definition 1.1, pp.57–58. The formal-group homomorphism underneath an action-compatible formal-module homomorphism.

### One-dimensional formal modules

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module` (definition).

For a commutative ring A and A-algebra R, a one-dimensional formal A-module is a commutative Mathlib FormalGroup R and a unital ring homomorphism A→End_R(F) inducing the given A→R on derivatives. A-linear homs commute with every [a]. For A=O_K and a field k of residue characteristic, height h means the first nonzero term of [π] is cX^(q^h), c≠0; infinity means [π]=0. Heights of lifts are heights of their special fibers.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-hom`, `mathlib:FormalGroup.map`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`.

**Proof/construction.**

1. Build the action on the existing endomorphism ring, with the tangent equality a property of that action.
2. Over a field differentiate the homomorphism equation: zero derivative forces a p-power factorization. Commuting with residue scalars forces the exponent to be a q-power.
3. Use a unit change of π and an invertible coordinate to prove height independence, and form coefficient base change by mapping the action.

**API.**

- `FormalModule.ofAction` (constructor): Bundle an existing commutative formal law with the ring action and tangent equality.
- `FormalModule.ext` (extensionality): Equality of the underlying law and all action series gives equality.
- `FormalModule.baseChange` (functoriality): Map law and action along an A-algebra map; identity/composition agree.
- `FormalModule.restrictScalars` (functoriality): Restrict a formal B-action along A→B, with the same underlying law.
- `FormalModule.transport` (equivalence): Conjugate the action by a coordinate isomorphism; height is unchanged.
- `FormalModule.height_restrict` (compatibility): For finite local-field F/F0, height over O0 is [F:F0] times height over OF.

**Uses.** ET.6a and VB3:positive-basic-examples: Provides their common formal-module carrier for finite extensions of Q_p, without their geometric towers or diamonds. LT.6/canonical-lift: Restricts the CM field action to the smaller local coefficient ring.

**Checks and worked examples.**

- `multiplicative_height_one` (computation): G_m over F_p with its Z_p-action has height one.
- `additive_infinite` (computation): G_a over F_p has [p]=0 and infinite height.
- `restriction_height` (computation): An O_F Lubin–Tate module for quadratic F/F0 has O0-height two.
- `tangent_action_required` (non-example): Over Q, sending a to [conjugate(a)] with a different algebra embedding does not give the specified A-module.

**Acceptance.** No phantom action inferred from a rank label; morphisms intertwine actual series. Restriction of coefficients O_F/O_0 of degree n sends height one to O_0-height n.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Definition 1.1, Lemma 2.1 and Definition 2.2, pp.57–60. Action, tangent condition, and q-power height over a field. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §1, pp.293–294. The coefficient field and one-dimensional finite-height convention.

### Adic formal-module points

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points` (construction).

Let R be a complete separated linearly topologized commutative A-algebra and I an ideal defining an adic topology. For a formal A-module over R, form the newtype F(I) of parameters in I, with evaluated formal addition, inverse and A-action. Continuous coefficient maps carrying I into J induce continuous A-linear maps. In particular F(m_L) exists for every complete finite extension L/K and F(m_Kbar) is the union over finite extensions, rather than an unjustified evaluation on an incomplete algebraic closure.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`, `mathlib:PowerSeries.eval₂Hom`, `mathlib:PowerSeries.comp_eval₂`, `tauceti:WeierstrassCurve.FormalGroupPoint`, `tauceti:WeierstrassCurve.map_formalGroup`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:WeierstrassCurve.formalPointHomAdicCompletion`, `tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective`, `tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion`.

**Proof/construction.**

1. Use the existing topologically nilpotent evaluation, not FormalGroup.Point, for each parameter in I.
2. Construct the inverse series degree by degree from F(X,Y)=X+Y+…, evaluate it, and prove the group and module identities by continuity of substitution.
3. Apply comp_eval₂ to coefficient maps and each variable of the multivariate law. Prove the identity-on-parameters equivalence with Tau Ceti elliptic adic points.
4. For algebraic torsion points evaluate in a finite complete extension containing their coordinates; prove independence under enlargement.
5. For a Dedekind adic-completion presentation, compose this identity-on-parameters equivalence with the pinned unconditional formalPointHomAdicCompletion. Reuse its injectivity and range theorem exactly in that presentation. For a general local field use the imported completion comparison; do not extend the pinned theorem by dropping its hypotheses.

**API.**

- `FormalModule.adicPoints` (constructor): The newtype F(I), with parameter coercion, topology and module structure.
- `AdicPoint.ext` (extensionality): Two points are equal iff their parameters are equal.
- `AdicPoint.map` (functoriality): A continuous coefficient map with I→J induces a continuous semilinear point map, compatible with composition.
- `AdicPoint.mapIso` (equivalence): Coordinate isomorphisms evaluate to point-group isomorphisms.
- `AdicPoint.weierstrassEquiv` (compatibility): For W.formalGroup the identity parameter map identifies F(I) with WeierstrassCurve.FormalGroupPoint W I.
- `AdicPoint.galois` (instance): The coefficient-fixed Galois action is continuous and A-linear.
- `AdicPoint.dedekindCompletionPointMap` (compatibility): For W over a height-one Dedekind adic-completion integer ring, the point map is the pinned formalPointHomAdicCompletion after the parameter equivalence, and has its pinned range.

**Uses.** LT.2/lt-character: Evaluates torsion and the Galois action. LT.9/formal-trace: Provides a complete point group in which formal sums and traces converge.

**Checks and worked examples.**

- `zero_ideal` (degenerate): F(0) is the zero module.
- `multiplicative_add` (computation): For G_m, x+_F y=x+y+xy, including x=y=p over Z_p.
- `finite_extension_square` (compatibility): Inclusion K⊂L commutes with [a] and every integral coordinate isomorphism.
- `wrong_points_rejected` (non-example): A scalar x∈m_L is not silently treated as an element of FormalGroup.Point σ, whose carrier is a power-series ring.
- `dedekind_point_map` (computation): In a Dedekind adic-completion presentation, the parameter-to-elliptic-point map equals formalPointHomAdicCompletion, including at zero.

**Acceptance.** Agreement with the pinned elliptic point group is an A-linear equivalence, including addition and inverse. Base change and coordinate transport commute, as do Galois actions and coefficient-fixed homomorphisms.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §1, p.383, formulas (12)–(13) and following paragraph. Convergence, formal module structure, extension maps and Galois actions on maximal ideals. [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), FormalGroup/AdicPoint.lean, FormalGroupPoint and its group instance. The elliptic ideal-point newtype supplies the required nearest-library comparison.

### Normalized formal logarithm

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-log` (construction).

For a commutative formal law F over a characteristic-zero domain R with fraction field K, construct the unique logarithm ℓ_F∈XK[[X]], ℓ′(0)=1, satisfying ℓ_F(F(X,Y))=ℓ_F(X)+ℓ_F(Y). Its inverse is the formal exponential. For h:F→G, ℓ_G∘h=h′(0)ℓ_F, and hence ℓ_F∘[a]=aℓ_F. These are formal identities; integral coefficients and convergence of the exponential on the whole maximal ideal are not asserted.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-hom`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`, `mathlib:PowerSeries.subst_substInvOfIsUnit_left`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Proof/construction.**

1. Construct the invariant differential (∂F/∂Y)(X,0)^−1 dX by formal differentiation; integrate coefficientwise in K.
2. Associativity makes it invariant, so the integral is additive under F; tangent normalization gives uniqueness.
3. Use the existing substitution inverse for exp and deduce the homomorphism formula. Compare with EllipticCurves Layer 1 by uniqueness, not by a second elliptic logarithm.

**API.**

- `FormalModule.log` (constructor): The uniquely normalized formal logarithm over the characteristic-zero fraction field.
- `FormalModule.log_unique` (extensionality): Every normalized additive logarithm is log F.
- `FormalModule.exp` (equivalence): The two-sided substitution inverse of log F.
- `FormalModule.log_hom` (compatibility): log G∘h=h′(0)log F.
- `FormalModule.log_baseChange` (functoriality): Logarithms map coefficientwise along embeddings of characteristic-zero fraction fields.
- `FormalModule.log_weierstrass` (compatibility): For W.formalGroup this is EllipticCurves Layer 1’s formal logarithm.

**Uses.** LT.4/honda-type: Provides the rational series on which the Honda operator acts. LT.9/trace-compatible-exports: Turns a formal trace into an ordinary field trace where the logarithm converges.

**Checks and worked examples.**

- `additive_log` (computation): log G_a=X.
- `multiplicative_log` (computation): log G_m=Σ_(n≥1)(−1)^(n+1)X^n/n.
- `scaled_coordinate` (compatibility): Under h′(0)=c, the comparison includes the factor c; strict coordinates give c=1.
- `denominators` (computation): For G_m over Z_p the coefficient of X^p is not integral.

**Acceptance.** The elliptic comparison preserves its chosen parameter and invariant differential. Coefficient embeddings and coordinate maps commute with the normalized logarithm after accounting for their derivative.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), §1, Proposition 1.1 and Theorem 1, pp.216–219; Proposition 1.6, p.220. Integrate the normalized invariant differential over a Q-algebra, then identify homomorphisms by derivative.

### Convergence of the formal logarithm

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log` (theorem).

For a formal group over the integers of a finite extension K/Q_p, its normalized logarithm converges on every m_L, L/K finite. It defines a homomorphism F(m_L)→L. There is a sufficiently deep power m_L^r on which log and exp are inverse analytic maps. Log is compatible with field embeddings, coordinate change and finite formal traces; no global injectivity on torsion is claimed.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-log`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof/construction.**

1. The inverse differential has integral coefficients, so v_L(coeff_n ℓ)≥−v_L(n). For x∈m_L, n v_L(x)−v_L(n)→∞.
2. Use the unit derivative and the same estimates, or a contraction argument on a sufficiently deep ideal, to construct the convergent inverse.
3. Evaluate the formal identities on the convergence domain, then commute the finite Galois sum with log. Reuse the multiplicative deep-unit logarithm from LocalFieldsRamification Layer 1.

**Acceptance.** For G_m the local-field logarithm agrees on its deep-unit domain. A nonzero p-power torsion point maps to zero; the statement does not assert injectivity on m_L.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), §1, invariant-differential construction, pp.216–219. Integral coefficients of the inverse differential bound the denominator of degree n by n. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §1, p.383. Evaluation of integral series on maximal ideals.

## LT.1. Lubin–Tate construction and coordinate independence

An admissible π-series gives an integral formal O_K-module by Lubin–Tate interpolation. The coefficient induction proves the law, action and unique strict same-parameter comparison. Strict means derivative one, and does not mean that the reduction of the coordinate map is the identity.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

### Lubin–Tate series

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/admissible-series` (definition).

Fix a finite extension K/Q_p, O=O_K, residue field of size q, and uniformizer π. An admissible Lubin–Tate series f∈O[[X]] has constant coefficient zero, linear coefficient π and reduction X^q modulo (π). These are coefficient conditions, independent of a formal law. The standard example is πX+X^q.

**Prerequisites:** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Proof/construction.**

1. Define the predicate using the native coefficient map and reduction of PowerSeries.
2. Check it is preserved by isomorphisms of the valued coefficient data; distinguish a change of uniformizer from a coordinate change for the same π.

**API.**

- `IsLubinTateSeries.iff_coeff` (characterisation): Equivalent to c0=0, c1=π and reduction X^q.
- `IsLubinTateSeries.standard` (constructor): πX+X^q is admissible.
- `IsLubinTateSeries.congr` (extensionality): Coefficientwise equal series satisfy the same predicate.
- `IsLubinTateSeries.mapEquiv` (functoriality): Transport along a valued-ring equivalence preserving π and the residue field size.
- `IsLubinTateSeries.hasSubst` (compatibility): The constant-zero condition supplies native substitution admissibility.

**Uses.** LT.1/interpolation: Controls the divisibility of every coefficient correction. LT.2/primitive-division: Makes the primitive division equation Eisenstein.

**Checks and worked examples.**

- `standard_series` (computation): πX+X^q has the required coefficients.
- `cyclotomic_series` (computation): For O=Z_p, π=p, (1+X)^p−1 is admissible.
- `linear_nonexample` (non-example): πX alone is not admissible since its reduction is zero.
- `sign_nonexample` (non-example): Over O=W(F_p²), −pX+X^(p²) is admissible for −p and not for p.

**Acceptance.** The predicate has a real coefficient-level body and includes the zero constant coefficient.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §1, p.380, condition (1). The admissible-series input to the interpolation construction.

### Lubin–Tate interpolation

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/interpolation` (theorem).

For admissible f,g for the same π and a finite list of coefficients a_i∈O, there is a unique integral multivariate series H with prescribed linear form Σa_i X_i and f∘H=H∘(g,…,g). Uniqueness also holds among series over K with that linear form. The construction is coefficientwise and commutes with isomorphisms of the input data.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/admissible-series`.

**Proof/construction.**

1. Suppose H is solved below degree r≥2. The degree-r error is divisible by π because reduction sends f,g to Frobenius and residue coefficients satisfy a^q=a.
2. Correct it by division by π−π^r=π(1−π^(r−1)); the second factor is a unit.
3. Take the coefficientwise degree limit. Uniqueness over K follows from the nonzero scalar π−π^r. Use this uniqueness for all subsequent identities.

**Acceptance.** The statement permits arbitrary finite arity; arity two constructs addition and arity one constructs homomorphisms. No p-adic completeness is used for this coefficient induction.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Lemma 1 and its remarks, pp.381–382. Degree induction divides the error by π−π^r; the error is divisible by π.

### Lubin–Tate formal module

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module` (construction).

For each admissible f construct F_f and [a]_f by interpolation with tangent forms X+Y and aX. Prove that F_f is a commutative formal O-module, [π]_f=f, and its special fiber has O-height one. A commutative formal law over O carrying an endomorphism with derivative π and reduction X^q is uniquely identified with this construction in its coordinate.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/interpolation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`.

**Proof/construction.**

1. Compare both sides of each associativity, commutativity, action-additivity and composition identity as solutions of the same interpolation problem.
2. Identify [1] with X and [π] with f by the same uniqueness.
3. For recognition compare the candidate law’s addition and scalar endomorphisms by their tangent terms and commutation with f.

**API.**

- `LubinTate.ofSeries` (constructor): The formal O-module attached to admissible f.
- `LubinTate.action_pi` (simp): [π]_(ofSeries f)=f.
- `LubinTate.ext` (extensionality): The prescribed π-series determines the law and its O-action.
- `LubinTate.recognize` (characterisation): An integral law with the specified Frobenius-lifting endomorphism is of Lubin–Tate type.
- `LubinTate.mapEquiv` (functoriality): Transport along an isomorphism of local-field data commutes with construction.
- `LubinTate.height_one` (compatibility): The O-height is one; the underlying p-divisible height is [K:Q_p].
- `LubinTate.baseChange` (compatibility): Base change of the constructed law and action along O→R is the actual FormalModule.baseChange of the coefficient series; uniqueness applies whenever the mapped valued data again satisfy the same admissibility hypotheses.

**Uses.** LT.2/lt-character: Produces the torsion representation whose character is proved surjective. LT.6/canonical-lift: Supplies the height-one CM lift over the larger coefficient ring.

**Checks and worked examples.**

- `cyclotomic_law` (computation): For f=(1+X)^p−1 over Z_p, the law is G_m.
- `standard_action` (computation): For f=πX+X^q, [π] is this polynomial, not ordinary scalar multiplication πX.
- `zero_one_action` (degenerate): [0]=0 and [1]=X.
- `height_conversion` (computation): The BKO quadratic case has O-height one and Z_p-height two.

**Acceptance.** The action is constructed, including multiplicativity and the tangent condition. The output extends the pinned FormalGroup rather than replacing it.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 1 and the recognition paragraph, pp.382–383. Uniqueness of interpolated series proves the formal law and the complete ring action.

### Coordinate independence

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-coordinate-comparison` (theorem).

For admissible f,g for the same π, interpolation gives a unique strict O-linear isomorphism F_g→F_f; these isomorphisms compose transitively. They identify torsion schemes, Tate modules, characters and division fields. Over extensions of O they base change naturally. This does not assert that the isomorphism induces the identity on the special fiber.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points`.

**Proof/construction.**

1. Construct [1]_(f,g) by arity-one interpolation and compose it with [1]_(g,f); uniqueness gives both inverse identities.
2. Compare the action and coordinate maps by uniqueness, then evaluate and pass to kernels and inverse limits.

**Acceptance.** Characters have exactly equal values under the transported O-module identification. A separate marking comparison is required before using it in a deformation functor.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 1, equations (8)–(11), and p.383. The [1]_(f,g) comparison and its consequences on evaluated points.

## LT.2. Torsion, Tate modules and the Artin comparison

Use pinned Weierstrass preparation and the parent’s actual p-divisible groups. Prove finite-height Tate freeness, then the rank-one division degrees and character isomorphism. Compare with the established arithmetic Artin map, including the inverse unit factor and the unramified twist on changing π.

**Layer inputs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

### Finite-height torsion comparison

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/finite-height-torsion` (theorem).

Let G be a one-dimensional formal O_K-module over a complete noetherian local O_K-algebra R, with residue characteristic p and finite special-fiber O_K-height h. For m≥1, R[[X]]/([π^m]_G) is finite free of rank q^(hm) and its formal Hopf law defines a finite locally free group scheme. The levels are the π-power torsion of a connected p-divisible group in R07.1, whose p-height is h[K:Q_p]. Coefficient base change and coordinate isomorphisms identify these actual group schemes.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`, `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `mathlib:PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/serre-tate-connected-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

**Proof/construction.**

1. The reduction of [π^m] has order q^(hm). Apply pinned Weierstrass preparation and its quotient equivalence; monicity gives the stated free basis and rank.
2. Descend the formal addition and action to the quotient algebra and use the existing finite locally free group-scheme carrier.
3. Prove the π-level exact sequences by finite flat division, and compare the p-power cofinal subsequence using p=unit·π^e. Apply R07.1’s connected formal/p-divisible equivalence, rather than a second definition.

**Acceptance.** Ranks are q^(hm) at π-level m and p^(h[K:Q_p]r) at p-level r. The level m=0, when used, is the trivial group scheme of rank one.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Definition 2.2 and the height discussion, pp.60–61. The first nonzero reduced π-series determines its Weierstrass degree. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3, p.295. Finite-height formal modules supply the torsion and Tate modules used in lattice quotients. [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), PowerSeries/WeierstrassPreparation.lean, exists_isWeierstrassFactorization and algEquivQuotient. The existing preparation and quotient comparison provide the finite free coordinate algebra.

### Formal-module Tate module

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison` (theorem).

Over the integers of a finite extension L/K of characteristic zero, let G have O_K-height h. The π-adic inverse limit T_πG of geometric π-power torsion with transition [π] is free of rank h over O_K, and T_πG/π^m identifies with G[π^m](Lbar). The action of G_L is continuous and O_K-linear. Its underlying Z_p-module canonically identifies with the R07.1 Tate module of the associated p-divisible group, using the unit correction between π^e and p. The torsion module is (T_πG⊗K)/T_πG.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/finite-height-torsion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points`.

**Proof/construction.**

1. In characteristic zero the finite levels are étale and [π] is surjective on geometric points. Use exactness and the elementary divisor theorem over O_K to obtain (O_K/π^m)^h.
2. Lift a basis compatibly along the surjective transitions, take inverse limits, and compare cofinal p- and π-systems with their units.
3. Derive torsion identification, continuity and functoriality; base change L→L′ restricts the Galois action without changing the geometric module.

**Acceptance.** A chosen basis is used only to display a matrix representation; the module and its Galois action are intrinsic. For h=1, automorphisms are scalars, so the resulting character is basis independent.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3, p.295. The inverse limit is free of rank equal to formal-module height, and its rational quotient parametrizes torsion. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 2 and discussion, pp.383–384. Rank-one Lubin–Tate torsion over O/π^m.

### Lubin–Tate division fields

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division` (theorem).

For F_f over O_K and m≥1, its primitive π^m-torsion consists of the O_K/π^m-module generators. For any generator t_m, K(t_m)=K(F_f[π^m]) is totally ramified of degree (q−1)q^(m−1). The action identifies its Galois group with (O_K/π^m)× and sends t_m to [a]t_m. Consecutive generators can be chosen with [π]t_(m+1)=t_m.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`, `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Proof/construction.**

1. For πX+X^q the first primitive equation is π+X^(q−1); subsequent division equations over the preceding field are Eisenstein after translating to a compatible primitive point.
2. Prove the primitive degree and total ramification inductively. The torsion action injects the finite Galois group into (O/π^m)×; equality follows from the computed degree.
3. Transfer arbitrary admissible f by the same-π coordinate isomorphism.

**Acceptance.** The first degree is q−1; m is torsion exponent, not BKO’s n=m−1. All geometric division points lie in a finite complete extension for evaluation.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 2 and its proof, pp.383–384. Eisenstein division polynomial, cyclic torsion and the finite unit Galois group.

### Lubin–Tate character

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character` (construction).

The actual G_K-action on the rank-one O_K-module T_πF defines a continuous character χ_π:G_K→O_K×, characterized by σ(t)=[χ_π(σ)]t at every torsion level. It factors through Gal(K(F[π∞])/K), where it is a topological isomorphism onto O_K×. The character is independent of a Tate basis and of the admissible π-series, with the isomorphisms specified in LT.1.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-coordinate-comparison`.

**Proof/construction.**

1. Extract the scalar of each module automorphism and prove its independence under changing a rank-one basis.
2. The finite-level isomorphisms are compatible under reduction; compact inverse limits give the topological isomorphism.
3. Identify the kernel with the subgroup fixing all torsion and prove naturality for coefficient-fixed formal-module isomorphisms.

**API.**

- `LubinTate.character` (constructor): The continuous scalar action on the actual Tate module.
- `LubinTate.character_eq_iff` (extensionality): Two character values agree iff they act equally on every torsion level.
- `LubinTate.character_torsion` (characterisation): σ(t)=[χ(σ)]t, compatibly in m.
- `LubinTate.character_series_independent` (compatibility): The same-π coordinate comparison intertwines characters.
- `LubinTate.character_baseChange` (functoriality): Over L/K the character of the base-changed module is restriction to G_L.
- `LubinTate.torsionGaloisEquivUnits` (equivalence): Gal(K(F[π∞])/K) is topologically O_K×.
- `LubinTate.character_coordinateIso` (compatibility): Every coefficient-fixed O-linear coordinate isomorphism intertwines the actual rank-one Tate actions, giving the same scalar character.

**Uses.** LT.8/bko-character-data: Defines κ, its finite tame subgroup and ω. LT.6/marked-minimal-field: Computes the action on lattice classes using the existing Artin map.

**Checks and worked examples.**

- `cyclotomic_character` (computation): For F=G_m and π=p the character is the p-adic cyclotomic character.
- `level_one_character` (computation): Modulo π, the character has image the full residue-unit group of size q−1.
- `basis_independence` (compatibility): Replacing a Tate basis by [u] times that basis changes no character value.
- `base_extension` (compatibility): For m≥1, after adjoining level-m torsion the restricted image is 1+π^mO.

**Acceptance.** Surjectivity is a theorem from division-field degrees, not a field of character data. The fixed field of ker χ is precisely the torsion field in the chosen separable closure.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 2, pp.383–384. Finite unit actions pass to an isomorphism with O× on the torsion extension.

### Comparison with local reciprocity

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/reciprocity-comparison` (theorem).

Use the ClassFieldTheory Layers 5–8 arithmetic local Artin map Art_K. For x=π^r u with u∈O_K×, χ_π(Art_K(x))=u^−1. In particular Art_K(π) fixes the Lubin–Tate torsion extension. Its finite level has norm subgroup π^Z(1+π^mO_K); the completed abelian reciprocity is the existing map. This theorem is a comparison, not a second construction of reciprocity.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof/construction.**

1. Show π is a norm from every finite torsion field, using the Eisenstein primitive-division calculation.
2. Use the finite reciprocity and norm-subgroup correspondence already constructed in ClassFieldTheory to compare its kernel with π^Z(1+π^mO).
3. Apply the uniformizer comparison argument of LT65 Lemma 2 and the unramified Frobenius normalization to compute the inverse unit action. This analytic coefficient argument uses LT.1 interpolation directly, so it does not depend on the subsequent uniformizer-twist theorem.
4. Pass to the inverse limit and use continuity/density of K× in the established abelianized reciprocity target.

**Acceptance.** The inverse in the unit formula is explicit: arithmetic, rather than geometric, Frobenius is the convention. The prerequisite graph does not use LT.2/uniformizer-twist to prove this comparison.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §2, Theorem 3, corollary and proof, pp.385–387. The torsion action is inverse to the unit factor of arithmetic reciprocity; uniformizers act trivially on their torsion fields.

### Change of uniformizer

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/uniformizer-twist` (theorem).

If π′=uπ with u∈O×, Lubin–Tate modules for π and π′ become isomorphic over the completed maximal unramified extension. Their G_K-characters have equal restriction to inertia, and χ_(π′)=χ_π·η_u, where η_u is the unramified character taking arithmetic Frobenius to u. The isomorphism has the Frobenius descent relation that accounts for this twist; it need not descend to O.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-coordinate-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/reciprocity-comparison`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Proof/construction.**

1. Solve the semilinear Frobenius coefficient equations over the completed unramified coefficient ring as in Lemma 2, obtaining the descent relation with [u].
2. From the already imported Artin normalization, χ_π(Art(u))=u^−1 and χ_π(Art(π))=1. Since π′=uπ, χ_(π′)(Art(π))=u.
3. Compare on inertia and arithmetic Frobenius, which topologically generate the abelian quotient.

**Acceptance.** For u=−1 the unramified twist has Frobenius value −1. No assertion that different uniformizers give the same division fields over K.

**Sources.** [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §2, Lemma 2, pp.385–387. Isomorphism over the completed unramified base with explicit Frobenius descent relation. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 3 and corollary, pp.385–386. Arithmetic reciprocity determines the character’s uniformizer value.

## LT.3. Marked deformations at finite height

Use a specified complete local coefficient base and a marked residual formal module. Prove lifting, rigidity and the h−1-dimensional tangent computation, then construct the universal formal power-series base. Keep residue fields nonclosed and compare the height-two elliptic special case through the existing Serre–Tate theorem.

**Layer inputs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`, `tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`.

### Marked formal-module deformations

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/marked-deformation` (definition).

Fix a field k with its O_K-residue action, a one-dimensional formal O_K-module G0/k of finite height h≥1, and a specified complete noetherian local O_K-algebra B with residue k. A deformation over a local Artinian B-algebra R with identified residue k is a formal O_K-module G/R together with an O_K-linear isomorphism G⊗k≃G0. Isomorphisms must commute with that marking. Extend the functor to complete noetherian local B-algebras by compatible Artinian quotients. No algebraic closure of k, nor canonical Cohen ring for an imperfect k, is implicit.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`.

**Proof/construction.**

1. Define the groupoid of marked lifts and its isomorphism-class functor. Base change maps both the law and the marking.
2. Separate the special-fiber identification from the linear coefficient of a coordinate change.
3. Use adic completeness to identify compatible coefficient systems with complete-base laws and actions.

**API.**

- `FormalModule.Deformation.mk` (constructor): A law, action and special-fiber isomorphism define a marked lift.
- `Deformation.ext` (extensionality): Equality of law, action and marking gives equality of objects.
- `Deformation.map` (functoriality): Local B-algebra maps induce marked base change with identity and composition laws.
- `Deformation.changeMarking` (equivalence): Aut_O(G0) acts by composing the marking; the action is coherent.
- `Deformation.coordinateTransport` (compatibility): An integral coordinate isomorphism transports the marking by its actual reduction.
- `Deformation.completeLimit` (equivalence): Complete-base marked lifts are compatible systems over R/m_R^n.

**Uses.** LT.3/universal-deformation: Supplies the exact functor to be represented. LT.6/marked-minimal-field: Makes the field of a marked modulus an invariant of the specified deformation problem.

**Checks and worked examples.**

- `height_one_no_parameters` (degenerate): The universal height-one deformation has no formal parameters over B.
- `strict_not_marked` (non-example): Over F_p, the strict nonidentity automorphism [1+p] of the height-one multiplicative formal Z_p-module does not preserve its identity marking.
- `nonclosed_residue` (computation): For k=F_p², a marking is defined over F_p²; an isomorphism only after algebraic closure does not identify its objects.
- `ramified_base_change` (compatibility): For ramified F/F0 the base change O_F[[t]] of the height-two universal family is not the representing ring over the smaller unramified coefficient base.

**Acceptance.** Residue-field extensions change the coefficient problem explicitly; objects over different residue fields are not silently identified. For finite perfect k the usual unramified coefficient ring is an allowed B; arbitrary B remains part of the input.

**Sources.** [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), §2, pp.51–52; Theorem 3.1, pp.56–57. Deformations are taken over a specified complete local coefficient ring with the given residue field. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §2, pp.294–295. Marked formal-module deformations with residue fields that need not be algebraically closed.

### Universal formal-module coefficients

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/formal-module-coefficient-ring` (construction).

For O=O_K, construct the graded O-algebra representing one-dimensional commutative formal O-module laws with fixed tangent action in a coordinate. It is noncanonically a polynomial O-algebra on one generator in each positive weight. In weight q^j−1, a generator may be chosen from the X^(q^j) coefficient of [π]. This coefficient algebra constructs unrestricted lifts of a given residual law before imposing deformation equivalence.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-module`.

**Proof/construction.**

1. Present the algebra by coefficients of the law and action, modulo the formal identities degree by degree.
2. Compute the next homogeneous relation module using symmetric cocycles; distinguish degrees n that are q-powers from all other n by the factors a^n−a.
3. In q-power degree use the uniformizer divisibility relation; over the fraction field compare logarithm coefficients to exclude torsion and additional relations.
4. Choose homogeneous generators inductively, prove representability and lift their residue values to B. The resulting lift need not itself be universal as a deformation.

**API.**

- `FormalModule.coefficientAlgebra` (constructor): The quotient of the polynomial coefficient algebra by the actual law and action identities.
- `FormalModule.coefficientAlgebra_homEquiv` (equivalence): O-algebra maps into R correspond to coordinate formal O-module laws over R.
- `FormalModule.universalLaw_coeff` (projection): Universal law and action coefficients evaluate to the input coefficients.
- `FormalModule.coefficientAlgebra_natural` (functoriality): Evaluation commutes with coefficient homomorphisms.
- `FormalModule.coefficientAlgebra_ext` (extensionality): Maps are equal when their universal coefficients agree.
- `FormalModule.piCoefficient_generator` (compatibility): In weight q^j−1 the π-series coefficient generates the indecomposable quotient.

**Uses.** LT.3/deformation-lifting: Provides a starting lift for the small-extension analysis. LT.3/finiteheight-tangent: Constructs deformations changing independently the h−1 relevant π-series coefficients.

**Checks and worked examples.**

- `degree_one_weight` (computation): The degree-two law coefficient has weight one; the grading is coefficient degree minus one.
- `q_power_weight` (computation): The coefficient of X^q in [π] occupies weight q−1.
- `lifting_coefficients` (computation): A residual law over k lifts to B by lifting its polynomial generators.
- `law_not_moduli` (computation): Different coordinate laws may represent the same marked deformation; the coefficient algebra is not the height-h deformation ring.

**Acceptance.** The polynomial generators supply existence of a lift over every chosen B, without assuming that k is algebraically closed. No canonical polynomial generator choice is claimed.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Theorem 1.4 and proof, pp.58–59. The universal coefficient algebra is polynomial, with the π-series coefficients distinguished in q-power weights.

### Formal-module deformation cocycles

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-cocycles` (definition).

For a square-zero small extension R′→R with kernel I annihilated by m_R′ and a formal O_K-module G0/k, define the k-vector space of symmetric additive-law corrections Δ(X,Y) together with action corrections δ_a(X), satisfying the linearized associativity, additivity and multiplication identities and the fixed tangent action. Coordinate corrections ψ(X) with zero constant term define coboundaries; their linear coefficient need not vanish. H²_O(G0;I) is the quotient of these cocycles by those coboundaries.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/marked-deformation`.

**Proof/construction.**

1. Expand each formal-module identity modulo I² and isolate the correction terms; impose the normalization on axes and the fixed tangent map.
2. For X↦X+ψ(X) expand coordinate conjugation, giving a linear coboundary map.
3. Check composition of small coordinate changes is addition of cochains, and prove all identities coefficientwise.

**API.**

- `FormalModule.Cocycle.mk` (constructor): Corrections satisfying the displayed linearized identities form a vector space.
- `Cocycle.ext` (extensionality): Equal Δ and all δ_a coefficients give equal cocycles.
- `FormalModule.coboundary` (constructor): A coordinate correction induces the coupled law/action correction.
- `Cohomology.changeCoefficients` (functoriality): A k-linear map I→J transports cocycles and coboundaries.
- `Cohomology.piCorrection` (projection): Extract the δ_π series; the cocycle class is detected by its low q-power coefficients.
- `Cohomology.coordinateCompatibility` (compatibility): Changing the residual coordinate transports this quotient isomorphically.

**Uses.** LT.3/deformation-lifting: Classifies small-extension lifts and their isomorphisms. LT.3/finiteheight-tangent: Computes the actual tangent dimension.

**Checks and worked examples.**

- `zero_kernel` (degenerate): I=0 gives the zero correction space.
- `linear_coordinate_allowed` (compatibility): ψ=iX is allowed for a marked small coordinate change and must not be excluded by strictness.
- `fixed_tangent` (computation): A correction to the linear term of [a] violating the given a:R′ is rejected.
- `action_correction_required` (non-example): Solving associativity for Δ alone does not certify compatibility with [π].

**Acceptance.** The cocycles describe both the law and the O-action; a bare formal-group H² is insufficient for ramified O_K. A marked infinitesimal coordinate change may have derivative 1+i, i∈I.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), §3, equations (3.1)–(3.7), p.62. The coupled cocycle equations include the correction to every scalar action. [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), §2, Propositions 2.4–2.6, pp.52–55. Square-zero changes of the law are controlled by symmetric cocycles modulo coordinate corrections.

### Lifting and rigidity

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-lifting` (theorem).

For the marked deformation problem in LT.3 and every small Artinian extension R′→R, lifts exist. Once a starting lift is chosen, isomorphism classes of lifts form a torsor under H²_O(G0;ker(R′→R)). A homomorphism between finite-height formal O-modules over an Artinian base is determined by its reduction. In particular a marked isomorphism, when it exists, is unique. These statements pass to complete local bases by inverse limits.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/formal-module-coefficient-ring`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-cocycles`.

**Proof/construction.**

1. Use polynomial universal coefficients to lift the complete law and action. Differences between two lifts satisfy the coupled cocycle equations.
2. Coordinate changes identify precisely coboundary differences. For homomorphisms first identify the obstruction cocycle and prove vanishing is equivalent to solving the next coefficient system.
3. For rigidity reduce to a kernel killed by the maximal ideal; commuting with [π] and its nonzero finite-height reduction forces the correction series to vanish. Induct on Artinian length.
4. Pass through the m-adic tower, choosing unique compatible marked isomorphisms; completeness identifies their coefficient limits.

**Acceptance.** The zero homomorphism is included in the injectivity assertion. Formal smoothness is proved, rather than inferred from the expected number of parameters.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Lemma 2.6, p.61; Proposition 3.2 and Lemma 3.3, pp.62–63. Finite-height rigidity and the small-extension cocycle calculation. [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), Proposition 2.4 and its proof, pp.52–54. Lifting homomorphisms and laws by square-zero corrections.

### Finite-height tangent space

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/finiteheight-tangent` (theorem).

For every residual formal O_K-module G0/k of finite height h≥1, H²_O(G0;k) has dimension h−1. After a compatible finite-jet normalization, the coefficients of X^(q^i) in δ_π, 1≤i<h, give a basis of its dual; every other correction is a coboundary modulo these classes. The dimension and the resulting tangent space are defined over k itself.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-lifting`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/formal-module-coefficient-ring`.

**Proof/construction.**

1. Normalize the reduced π-series over a separable residue extension, degree by degree; perform the cocycle calculation on finite jets. A class is a coboundary exactly when the remaining δ_π is a series in X^(q^h).
2. Construct h−1 independent classes by varying the q-power universal coefficients in the polynomial coefficient algebra.
3. Descend the finite-dimensional kernel/image equalities by faithful scalar extension at each finite jet, keeping their k-linear equations. At each fixed jet the images of the finite-dimensional affine correction spaces stabilize; this Mittag–Leffler property supplies a compatible coefficient limit. Finite-height rigidity gives uniqueness of the resulting infinitesimal homomorphism corrections. Do not interchange arbitrary power-series products with field tensor products.
4. Conclude dimension h−1 over k and identify coefficient changes under a different normalization.

**Acceptance.** The h=1 answer is zero, not one. No choice of algebraic closure enters the stated tangent space or the deformation functor.

**Sources.** [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Corollary 3.4, Lemma 3.5 and Proposition 3.6, pp.63–65. The low q-power corrections give the basis; the kernel is the coboundary space. [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), Proposition 2.6, pp.54–55. The formal-group case computes dimension h−1 by the first nonzero height coefficient.

### Universal finite-height deformation

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation` (theorem).

For the specified B,k,G0 of LT.3, the marked deformation functor is represented on complete noetherian local B-algebras by a noncanonically chosen B[[t1,…,t_(h−1)]], with a universal formal O_K-module and marking. Pullback gives a bijection between continuous local B-algebra maps and marked deformation classes, natural in the base. For each pullback the marked comparison is unique. Residue-field and coefficient-base extensions have specified comparison maps; no canonical coordinates are claimed.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-lifting`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/finiteheight-tangent`.

**Proof/construction.**

1. Choose a lift over B and h−1 tangent directions from the preceding node, then construct a compatible family over truncations of B[[t1,…,t_(h−1)]].
2. Induct on Artinian length: lift the classifying map across a small extension, adjust its h−1 coordinates to kill the difference cocycle, and use rigidity for the marked isomorphism.
3. Prove injectivity by the same tangent calculation; pass to complete local bases through compatible Artinian quotients.
4. Construct base-change and marking-action comparisons by the representing property, and prove their coherence by uniqueness.

**Acceptance.** Height one has representing ring B. Height two has exactly one parameter. The nonclosed-residue-field formulation is part of the theorem, with B specified; a canonical Cohen ring for an arbitrary imperfect field is not postulated.

**Sources.** [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), Theorem 3.1 and proof, pp.56–57; Proposition 3.3, pp.57–58. Universal marked deformations and the action of changing the special-fiber marking. [VZ07](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), Theorem 3.8 and proof, p.65. The formal O-module extension of the deformation theorem, constructed from the tangent basis. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §2, pp.294–295. The deformation problem retains its residue coefficient field.

### Elliptic deformation compatibility

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/elliptic-deformation-comparison` (comparison).

For a supersingular elliptic curve E/k in the domain of the existing ModularCurves deformation and Serre–Tate theorems, completion at zero identifies its marked deformation functor with that of its connected height-two p-divisible group and then with the underlying formal Z_p-module deformation problem. The two universal one-parameter bases are isomorphic by this functor comparison. Formal logarithms and CM endomorphism actions commute with completion. A formal CM action on a lift is not asserted to arise from global elliptic CM.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/finite-height-torsion`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`, `tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/serre-tate-connected-p-divisible`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Proof/construction.**

1. Compose the supplied completion and connected formal/p-divisible equivalences with Serre–Tate; retain the markings throughout.
2. Identify representing objects by the natural isomorphism of functors, instead of identifying a displayed parameter by name.
3. Apply the imported invariant-differential comparison to logarithms and completed endomorphisms. State separately any residue-field descent hypotheses of the elliptic suppliers.

**Acceptance.** No new elliptic deformation or p-divisible-group carrier is introduced. The comparison distinguishes formal and global endomorphism rings.

**Sources.** [LT66](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), §3.5, pp.58–59. Formal complex multiplication does not force global complex multiplication of an elliptic lift. [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), ModularCurves §§7C–7F and EllipticCurves Layer 1, current roadmaps. Reuse completion, universal elliptic deformations, connected height-two p-divisible groups and Serre–Tate equivalence.

## LT.4. Unramified Honda and elliptic comparisons

Keep the Frobenius lift in Honda’s type operator explicit. Prove functional-equation integrality and the unramified converse, then derive the scalar-Frobenius comparison with corrected sign. The elliptic a_p=0 specialization gives parameter −p over W(F_p²), with its actual normalized logarithm and Tate maps.

**Layer inputs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

### Honda logarithm types

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/honda-type` (definition).

Let O be a complete characteristic-zero DVR with fraction field K, uniformizer π, and a specified prime power q and endomorphism σ of K preserving O and lifting the q-power residue map. Here q need not be the full residue-field size. For u=π+Σ_(i≥1)c_iT^i in the σ-skew series ring, define u⋆ℓ=πℓ(X)+Σc_iℓ^(σ^i)(X^(q^i)). A normalized rational logarithm has type u when u⋆ℓ∈πO[[X]]. The skew relation Ta=σ(a)T and the semilinear coefficient action are part of the definition; only finitely many terms contribute to each coefficient.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-log`.

**Proof/construction.**

1. Define the coefficientwise locally finite operator on zero-constant series and prove the skew multiplication rule.
2. Specify scalar extension only along maps commuting with σ; build the normalized-type predicate as an actual integrality condition.

**API.**

- `Honda.TypeOperator` (constructor): The skew coefficient sequence with the designated uniformizer constant term.
- `Honda.star_coeff` (projection): Each coefficient is the finite sum of the semilinearly twisted q-power terms.
- `Honda.Type.ext` (extensionality): Coefficientwise equality identifies operators and their type predicates.
- `Honda.star_mul` (compatibility): Composition of operators realizes σ-skew multiplication.
- `Honda.Type.map` (functoriality): A valued coefficient map intertwining σ preserves the type condition.
- `Honda.isOfType_iff` (characterisation): The operator applied to ℓ has every coefficient in πO.

**Uses.** LT.4/functional-equation-integrality: Expresses the precise integrality hypothesis. LT.4/unramified-honda-comparison: Detects the corrected sign of the Lubin–Tate parameter.

**Checks and worked examples.**

- `untwisted_second_power` (computation): Over W(F_p²), σ is p-Frobenius and σ²=1, so T² acts on exponents by p² and trivially on coefficients.
- `coefficient_twist` (computation): For a not fixed by σ, T(aX)=σ(a)X^q, rather than aX^q.
- `height_two_sign` (computation): For ℓ=Σ(-p)^(-j)X^(p^(2j)), the type is p+T².
- `constant_excluded` (non-example): A nonzero constant logarithm would destroy local finiteness of the infinite operator sum and is excluded.

**Acceptance.** The Frobenius lift and coefficient action are data, rather than suppressed notation. A general ramified coefficient ring is not assigned an unramified Frobenius lift automatically.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), §2, condition (F), special elements and type, pp.220–223. Frobenius-semilinear operators on rational logarithms and their integrality condition.

### Honda functional equation

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/functional-equation-integrality` (theorem).

Under Honda’s condition (F) and the specified Frobenius lift, a normalized logarithm of special type u defines an integral commutative formal group ℓ^−1(ℓ(X)+ℓ(Y)). Logarithms of the same normalized type have integral strict comparison ℓ_2^−1ℓ_1. For source type u, target type v and tangent C∈O, the rational homomorphism is integral precisely when vC=t u for some t∈O_σ[[T]]. For the converse take O the integers of an unramified extension of Q_p, π=p, q=p and σ the p-Frobenius lift: every integral formal group then has a type, and the finite-height case admits a type of degree its height with unit final coefficient.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/honda-type`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-hom`.

**Proof/construction.**

1. Prove the composition divisibility estimates of Lemmas 2.3–2.4 by induction on degree, using the Frobenius congruence and divisibility by the designated uniformizer.
2. Apply these estimates first to the addition law, then to the equal-type comparison and its inverse.
3. For homomorphisms identify the annihilating type ideal; division in the skew series ring gives vC=t u.
4. For the unramified converse recursively eliminate the logarithm’s nonintegral q-power coefficients. Finite height makes the final relevant coefficient a unit; retain the full hypothesis of the unramified coefficient ring.

**Acceptance.** The argument proves integrality; a logarithm over K alone does not imply it. The converse is restricted to its unramified domain and is not reused over arbitrary ramified lift rings.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), Lemmas 2.3–2.4, Theorems 2–3, pp.222–225; Proposition 3.3, Theorem 4 and Proposition 3.5, pp.226–230. Functional-equation integrality, equal-type comparison, homomorphism criterion and the unramified converse.

### Unramified Honda–Lubin–Tate comparison

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/unramified-honda-comparison` (theorem).

Let p≥5, O=W(F_p²), q=p², and s∈{1,−1}. For a one-dimensional commutative formal group G/O whose reduction has q-power Frobenius equal to [s p], its normalized logarithm has type p−sT² for the p-Frobenius lift. It is strictly isomorphic over O to the group with logarithm ℓ_s=Σ_(j≥0)(s p)^(-j)X^(q^j). The latter has an integral O-action and is a Lubin–Tate formal O-module for π=s p. The transported action on G is unique with its specified tangent embedding.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/functional-equation-integrality`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-log`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-equivalence-finite`.

**Proof/construction.**

1. By the unramified converse choose an initial type for ℓ_G. Compare the integral series [s p]_G and X^q, whose reductions agree. Honda Lemma 4.2 gives s pℓ_G−ℓ_G(X^q)∈pO[[X]], hence type p−sT².
2. The explicit ℓ_s satisfies the same type identity. Equal-type integrality gives the strict isomorphism ℓ_s^−1ℓ_G and its integral inverse.
3. Since σ²=1, the type commutes with every a∈O. Honda’s homomorphism criterion makes ℓ_s^−1(aℓ_s) integral; uniqueness by tangent gives a ring action.
4. The [s p] series has derivative s p and reduction X^q. Apply Lubin–Tate recognition; use the imported Frobenius/Dieudonné convention to verify the scalar statement, without replacing its finite-flat carrier.

**Acceptance.** For s=−1 the type is p+T² and the Lubin–Tate parameter is −p. The isomorphism is strict but its special-fiber reduction need not be the identity marking. Only the unramified O is the coefficient ring in this theorem.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), Proposition 3.3, pp.226–228; Lemma 4.2, p.231; Lemma 2.4 and Theorem 3, pp.223–225. An initial type and the composition congruence produce p−sT²; equal-type comparison is integral. [H68](https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf), Theorem 2, pp.204–205. The explicit logarithm supplies the unramified CM model with scalar q-Frobenius. [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), Lemma 5.1(ii), p.956, corrected as recorded in source issue E1. The required unramified formal-group comparison, with the corrected type sign.

### Supersingular elliptic comparison

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison` (theorem).

For p≥5 and E/O with O=W(F_p²), if a_q(E)=2s p, s=±1, then q-Frobenius on the special elliptic curve is [s p], and the integral formal group of E is isomorphic to a Lubin–Tate formal O-module for s p. In particular, for E/Z_p with good reduction and a_p(E)=0, its base change to O has q-Frobenius [−p] and parameter −p. The comparison identifies formal logarithms, torsion and Tate modules with the transition-sign correction made explicit subsequent.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/unramified-honda-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`, `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/frobenius-verschiebung`.

**Proof/construction.**

1. Use the existing elliptic Frobenius characteristic polynomial. When a_q=2s p it gives (Frob_q−[s p])²=0. The elliptic endomorphism ring has no nonzero nilpotents, by positivity/multiplicativity of isogeny degree; conclude scalar Frobenius.
2. For a_p=0, the p-Frobenius relation Frob_p²+[p]=0 gives the negative scalar directly.
3. Apply the unramified Honda comparison to the actual pinned elliptic formal law. Normalize logarithms by invariant differential and use the functorial torsion/Tate comparisons.

**Acceptance.** The scalar Frobenius conclusion is proved; equality of traces alone is not substituted for equality of endomorphisms. No global CM of E is inferred from its formal O-action.

**Sources.** [H70](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), Theorem 9, pp.240–241. The elliptic formal logarithm has type p−a_pT+T². [H68](https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf), Corollary 4, p.212. The a_p=0 elliptic formal group has the unramified quadratic endomorphism action. [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), Lemma 5.1 and its application, pp.955–957. The a_p=0 case supplies the π=−p comparison used by the local-point construction.

## LT.5. Lattice kernels and integral quotient isogenies

Interpret an embedded Tate lattice as a finite flat kernel, construct the integral Serre-product quotient and retain its Frobenius-twisted marking. Classify homomorphisms within this isogeny class by lattice inclusion, prove setwise-stabilizer descent, and compare completed elliptic quotients.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`, `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`, `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`.

### Tate lattices and finite kernels

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/tate-lattice` (definition).

Let G be a finite-height formal O0-module over the integers of a finite extension of F0, with T=T_varpi0 G and V=T⊗F0. An O0-lattice L⊂V is a finite free spanning O0-submodule. For L⊃T define C_L=L/T inside V/T≃G[varpi0∞](F0bar). Its schematic closure in a sufficiently large finite torsion level is finite flat over any finite coefficient extension over which C_L is Galois stable. The field of setwise stability is distinguished from the field making all points rational.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/finite-height-torsion`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`, `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`.

**Proof/construction.**

1. Use V/T to identify the finite O0-module L/T with an actual subgroup of geometric torsion.
2. Take its closure in the finite flat level; over a DVR this is finite and torsion free, hence flat, and the group operations restrict.
3. Prove that an open Galois stabilizer suffices for descent of the subgroup scheme; pointwise rationality imposes a stronger condition.

**API.**

- `TateLattice.mk` (constructor): A finite spanning submodule defines a lattice in V.
- `TateLattice.ext` (extensionality): Lattices are equal when their subsets of V agree.
- `TateLattice.finiteKernel` (constructor): For T⊂L, the quotient L/T gives the closed finite flat subgroup.
- `TateLattice.transport` (functoriality): An isomorphism of Tate modules transports lattices and kernels, compatibly with composition.
- `TateLattice.kernelEquiv` (equivalence): Lattices above T correspond to finite O0-stable geometric torsion subgroups.
- `TateLattice.stabilizer` (characterisation): A Galois element preserves C_L setwise iff it preserves L.

**Uses.** LT.5/lattice-quotient: Defines the actual isogeny kernel. LT.6/quasi-canonical-lift: Selects the CM lattice quotients.

**Checks and worked examples.**

- `identity_lattice` (degenerate): L=T gives the zero kernel.
- `full_level` (computation): L=varpi0^(-m)T gives the entire varpi0^m-torsion kernel.
- `line_not_full_torsion` (non-example): In rank two, an index-q lattice gives a line subgroup rather than the whole first torsion level.
- `setwise_not_pointwise` (computation): A nontrivial residue scalar preserves a torsion line while moving its nonzero points.

**Acceptance.** The lattice is embedded in V, not an abstract module carrying only a rank. Changing a Tate basis transports both the embedded lattice and the subgroup.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3, pp.295–296. Lattices containing the Tate module specify finite invariant torsion subgroups. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, p.324. Lattice quotients and fields determined by their stabilizers.

### Integral lattice quotient isogenies

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient` (construction).

For L⊃T as above, over the integers R of a finite extension where C_L is setwise stable, construct a formal O0-module G_L and an integral isogeny g_L:G→G_L with exactly that finite flat kernel. In a splitting extension use the normalized Serre product g_L(X)=∏_(c∈C_L)(X−_G c). If #C_L=q0^N then its reduction is X^(q0^N), and G_L reduces to the q0^N-Frobenius twist of G0. The product is a series, rather than an assumed polynomial in X.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/tate-lattice`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points`, `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `mathlib:PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient`, `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`.

**Proof/construction.**

1. All c are topologically nilpotent, so translation X−_G c and its finite product have integral coefficients in a splitting extension. Galois invariance descends them to R. The product reduces to X^(q0^N).
2. Apply Weierstrass preparation to g_L(X)−Z over R[[Z]] to obtain the finite free basis 1,X,…,X^(d−1), d=#C_L, over R[[g_L]]. For an invariant series expand uniquely in that basis. After inverting the coefficient uniformizer and passing to a splitting field of the generic degree-d polynomial, its roots form one orbit under kernel translation; a polynomial of degree less than d with equal values on all these distinct roots is constant. Thus all positive-degree basis coefficients vanish already over R[[Z]]. This proves the integral invariant-ring equality without replacing bounded-denominator series by arbitrary K[[X]].
3. The invariant series g_L(G(X,Y)) and g_L([a](X)) therefore factor uniquely through g_L(X),g_L(Y). These factorizations define the quotient law and action; injectivity of substitution proves their formal identities.
4. Identify the finite flat kernel by its coordinate algebra and generic points, prove the quotient universal property, and reduce the defining identities to obtain the indicated Frobenius twist and marking.

**API.**

- `FormalModule.latticeQuotient` (constructor): The integral quotient law and g_L from the actual finite kernel.
- `LatticeQuotient.factor` (universal-property): A homomorphism killing C_L factors uniquely through g_L.
- `LatticeQuotient.factor_ext` (extensionality): Factors are equal after precomposition with g_L.
- `LatticeQuotient.map` (functoriality): L⊂M produces G_L→G_M; nested quotients agree up to the canonical comparison.
- `LatticeQuotient.baseChange` (compatibility): Coefficient extension commutes with the quotient and its marking.
- `LatticeQuotient.coordinateIso` (equivalence): Transporting G and L gives an isomorphic quotient; the product coordinate itself can differ by an integral target coordinate.

**Uses.** LT.6/quasi-canonical-lift: Produces the quasi-canonical lift and its marked modulus. LT.9/formal-trace: Supplies the finite-level maps between formal modules on which traces are evaluated.

**Checks and worked examples.**

- `zero_kernel_identity` (degenerate): For L=T the product is X and the quotient is G.
- `full_torsion_quotient` (computation): For L=varpi0^(-m)T the quotient is isomorphic to G via [varpi0^m], with its actual Frobenius marking.
- `residue_twist` (computation): A kernel of order q0^N gives G0^(q0^N), and is not replaced by G0 without a comparison.
- `nonlinear_product` (computation): For G_m the factors X−_G c=(X−c)/(1+c) retain a unit denominator; the product need not equal the monic ordinary product.

**Acceptance.** The quotient is integral and one-dimensional, with no appeal to a generic-fiber formal logarithm as an integrality proof. The Frobenius twist is retained over nonclosed residue fields.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3, pp.295–296, Serre product and defining identities. The product defines the quotient law, action and its Frobenius-marked reduction. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, pp.324–325. Integral quotient isogenies underpin the quasi-canonical construction.

### Homomorphisms in the lattice isogeny class

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-homs` (theorem).

For quotient objects of a fixed G, conjugation by g_L identifies Hom_O0(G_L1,G_L2) with {a∈End_O0(G)⊗F0 : aL1⊂L2}. This assertion concerns the known isogeny class. In particular End(G_L) is its multiplier ring. Isomorphisms correspond to aL1=L2. The identification commutes with composition, scalar action and coefficient extension in the domain of the given homomorphisms.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`.

**Proof/construction.**

1. The quotient universal property supplies a quasi-inverse to each g_L after multiplying by a nonzero O0-scalar.
2. A homomorphism conjugates to a rational endomorphism carrying L1 into L2, as seen on torsion/Tate modules.
3. Conversely clear a denominator b. The lattice inclusion makes the resulting integral map kill the b-torsion kernel needed for factorization; apply the quotient property to obtain the actual homomorphism.
4. Apply the same argument to inverse lattice equality and to composition.

**Acceptance.** The zero map is included; nonzero maps in this one-dimensional finite-height isogeny class are isogenies. No assertion that arbitrary Galois-linear Tate maps lift to formal-module homomorphisms is used.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3, p.296, homomorphism calculation and proof. Clear denominators and factor through the finite kernel; no unrestricted Tate full-faithfulness theorem is needed.

### Descent of lattice quotients

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-descent` (theorem).

For a quotient of a coefficient-defined formal module G, the normalized product and quotient descend to the fixed field of the setwise Galois stabilizer of C_L, equivalently L. Under arithmetic Artin in the CM Lubin–Tate case the lattice transforms by a^−1. Descent of the quotient together with its normalized isogeny follows from this stability. Minimality for the marked quotient alone is a separate theorem in LT.6.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/tate-lattice`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/reciprocity-comparison`.

**Proof/construction.**

1. Apply Galois to the finite Serre product; permutation of its factors is sufficient to fix its coefficients.
2. Uniqueness of the quotient identities then descends the law and action. Prove compatible descent after finite extension and under coordinate transport.
3. In the CM case use χ(Art(a))=a^−1 to identify the transformed lattice. Do not infer minimality after forgetting the isogeny from this calculation alone.

**Acceptance.** Setwise stability, not pointwise kernel rationality, controls this descent. All fields are considered inside one chosen separable closure.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3 and §4, pp.295–297. Product descent and the inverse-unit Galois action on CM lattices. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, pp.324–325. The lattice stabilizer gives the finite field of the isogeny construction.

### Elliptic quotient compatibility

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/elliptic-isogeny-comparison` (comparison).

If G is the formal completion of an elliptic curve and C_L is the completion of a finite flat elliptic subgroup supported at the zero special-fiber point, the completion of the existing elliptic quotient is canonically isomorphic to G_L. The completed elliptic isogeny and g_L differ only by this specified integral target coordinate. The induced torsion, Tate and logarithm maps agree.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/elliptic-deformation-comparison`, `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`, `tauceti:TauCetiRoadmap/ModularCurves#7c-formal-completion-at-the-zero-section`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Proof/construction.**

1. Complete the imported elliptic quotient map and identify its kernel by completion and base change.
2. Use the formal quotient universal property in both directions; uniqueness gives the comparison and all commuting diagrams.
3. Apply the normalized invariant-differential formula to the logarithm comparison, retaining the derivative of the target coordinate.

**Acceptance.** The elliptic subgroup support hypothesis is explicit. This is a compatibility theorem, not a second construction of elliptic isogenies.

**Sources.** [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), ModularCurves §2B and §7C; EllipticCurves Layer 1. Existing elliptic quotients and formal completion own these geometric objects. [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5, pp.957–959. Local points are transported through an isomorphism of elliptic and Lubin–Tate formal groups.

## LT.6. Canonical and Frobenius-marked quasi-canonical lifts

Construct the height-one CM lift over the CM coefficient ring. Its lattice quotients are marked quasi-canonical lifts. Classify both marked and unmarked objects, identify their multiplier orders, and prove the smallest field containing the CM field by the marked Artin stabilizer. Quadratic orders have a separate conductor-level classification.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

### Canonical CM lift

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/canonical-lift` (construction).

Let F/F0 be a finite extension, O_F its integers, π_F a uniformizer and k_F its residue field. The standard Lubin–Tate O_F-module H with [π_F]=π_F X+X^(#k_F), restricted to O0, is the canonical CM lift of its own special fiber with its designated O_F-action and tangent embedding. Its underlying O0-height is [F:F0]. For a chosen isomorphism of a residual formal O_F-module with this special fiber, transport the marking; over a complete unramified coefficient extension with the specified residue embedding, it is the unique marked lift of that O_F-module.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`.

**Proof/construction.**

1. Construct the standard module and restrict its scalar action. Regard its residual O_F-action as part of the input embedding.
2. Apply height-one universal deformation over the specified coefficient base: there are no formal parameters, so any two marked O_F-lifts are uniquely isomorphic.
3. Compare with Gross’s canonical lift after completed unramified base extension and with a different same-π_F series by its actual marking change.

**API.**

- `CanonicalLift.ofLubinTate` (constructor): The restricted standard O_F Lubin–Tate module with its CM embedding.
- `CanonicalLift.cmAction` (projection): The action of O_F has the designated tangent embedding.
- `CanonicalLift.unique` (universal-property): Two marked height-one O_F-lifts over the same coefficient base are uniquely isomorphic.
- `CanonicalLift.baseChange` (functoriality): The lift and CM action commute with coefficient extension.
- `CanonicalLift.changeMarking` (compatibility): Transport by a residual CM-linear isomorphism records its new marking.
- `CanonicalLift.tateRankOne` (equivalence): T_πF H is a free rank-one O_F-module, whose restriction has O0-rank [F:F0].
- `CanonicalLift.ext` (extensionality): Marked lifts with the fixed CM embedding have equal deformation classes by the unique marked comparison.

**Uses.** LT.6/quasi-canonical-lift: Supplies H, T and the CM vector space. LT.7/honda-ramified-test: Provides the maximal-order comparison model.

**Checks and worked examples.**

- `height_two_quadratic` (computation): A quadratic CM extension gives O0-height two.
- `level_zero_end` (degenerate): The canonical lift has full endomorphism ring O_F.
- `embedding_matters` (computation): Changing the specified residual CM embedding changes the canonical marked problem.
- `nonclosed_canonical` (computation): The standard module and its marking are defined over O_F with residue k_F, not only over its completed maximal unramified extension.

**Acceptance.** Uniqueness is for a fixed CM action and marking; no choice of CM embedding is declared canonical. The standard construction is already over O_F, before any algebraic closure of the residue field.

**Sources.** [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §2, Proposition 2.1, p.322. A fixed CM embedding has a unique canonical height-one formal O_F lift. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, pp.296–297. The canonical Lubin–Tate module is the starting point for lattice quasi-canonical lifts.

### Frobenius-marked quasi-canonical lifts

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift` (definition).

For canonical H and an O0-lattice L in V=T⊗F0≃F containing T, define H_L by the integral quotient construction, with its Frobenius marking to Hbar^(q0^N) when [L:T]=q0^N. Extend to arbitrary lattices by multiplying by a sufficiently negative power of π_F and compare the resulting markings through [π_F]bar=X^(#k_F). Thus the invariant is a π_F^Z-lattice class with its specified Frobenius-twist component. Its endomorphism order is O_L={a∈F:aL⊂L}, containing O0. A quasi-canonical lift of level s in the quadratic case will mean O_L=O0+varpi0^s O_F.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-homs`.

**Proof/construction.**

1. Apply the quotient to H with its actual torsion identification. Compare L and π_F^−1L by [π_F] and its reduced relative Frobenius, not by an unmarked characteristic-zero isomorphism alone.
2. Prove the arbitrary-lattice extension is independent of the enlargement exponent through these coherent comparisons.
3. Identify End(H)=O_F: characteristic-zero derivative embeds it in a commutative field, so it centralizes the O_F-action; its action on the rank-one O_F Tate module is an integral scalar. Then use the lattice-hom theorem for End(H_L).

**API.**

- `QuasiCanonical.ofLattice` (constructor): The quotient with its CM rational action and Frobenius marking.
- `QuasiCanonical.order` (projection): The multiplier order O_L, with its embedding in End(H_L) and tangent F.
- `QuasiCanonical.piHomothety` (equivalence): π_F-homothetic lattices give coherently identified marked quotients in their twist components.
- `QuasiCanonical.baseChange` (functoriality): Coefficient extension preserves the quotient, marking and order.
- `QuasiCanonical.coordinateTransport` (compatibility): Changing the coordinate of H transports the lattice and marking, giving the same moduli point.
- `QuasiCanonical.extMarked` (extensionality): The same lattice class in the same coherent twist component gives the same marked deformation class.

**Uses.** LT.6/marked-lattice-classification: Defines the objects classified by lattice classes. LT.7/bko-quasi-fields: Produces the BKO level-s lifts and their smallest marked fields.

**Checks and worked examples.**

- `canonical_lattice` (computation): L=T gives the level-zero canonical lift.
- `nonmaximal_level` (computation): For a quadratic extension the level-one quotient has proper order O0+varpi0 O_F.
- `homothety_marking` (computation): Multiplication by π_F shifts the Frobenius exponent by the residue degree, and its comparison must be recorded.
- `unmarked_not_marked` (non-example): A unit a∈O_F× may give an isomorphic underlying quotient while changing its marked deformation.

**Acceptance.** The quotient marking lands in the appropriate twist; unrelated residue-field forms are not identified. An abstract lift with an order embedding is identified with this construction only after specifying the residual embedding, or stating the required conjugacy.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, pp.296–298. Quotients, π_F-homothety classes, Frobenius-twist markings and multiplier orders. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, pp.324–325. The quadratic level-s construction and endomorphism order.

### Marked and unmarked lattice classification

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/marked-lattice-classification` (theorem).

For quasi-canonical H_L, unmarked O0-linear isomorphism classes correspond to F×-homothety classes of O0-lattices, equivalently O_F×-orbits of π_F^Z-lattice classes. Within a common coherently specified Frobenius-twist component, marked isomorphism holds exactly when the π_F^Z-lattice classes coincide. More generally the unmarked class is determined by its order O_L and the proper O_L-lattice class; equality of orders alone need not suffice outside the quadratic case.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-homs`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/deformation-lifting`.

**Proof/construction.**

1. Use Hom(H_L1,H_L2)={a∈F:aL1⊂L2} and its invertibility criterion to classify underlying isomorphisms.
2. Compare the reductions of the isomorphisms through the quotient Frobenius markings. The faithful residual O_F-action forces the remaining unit to be one for a marked comparison, modulo an automorphism of the same lattice.
3. Separate π_F-homothety from unit homothety and retain the twist component over k_F.
4. For a fixed multiplier order, translate F×-homothety into isomorphism of proper order lattices.

**Acceptance.** The proof explains why an unmarked model over a smaller field does not establish descent of its marking. No assertion that all proper lattices over all higher-degree orders are free is made.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, Propositions 1–2 and proofs, p.297; corollary, p.298. Unmarked classes allow unit homothety, while marked classes retain the π_F-homothety class.

### Quadratic CM orders

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-order` (definition).

For a quadratic local-field extension F/F0, with O0-uniformizer varpi0, define O_s=O0+varpi0^s O_F for s≥0. Every O0-order in O_F is exactly one O_s. The conductor in O_F is varpi0^s O_F, with O_0=O_F distinguished. If s≥1, O_s×=O0×(1+varpi0^s O_F). This uses the smaller-field uniformizer in both the ramified and unramified cases.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Proof/construction.**

1. Choose an integral basis 1,α of O_F over the DVR O0. Since O_F/O0 is free rank one, any intermediate order has the form O0+varpi0^sO0α.
2. Verify closure and the conductor directly in that basis, including the ramified case.
3. Reduce an element of O_s modulo varpi0 and prove the unit formula for s≥1; keep s=0 separate.

**API.**

- `QuadraticOrder.level` (constructor): The subring O0+varpi0^s O_F.
- `QuadraticOrder.mem_iff` (characterisation): x lies in O_s iff x=a+varpi0^s b with a∈O0,b∈O_F.
- `QuadraticOrder.level_unique` (extensionality): Two levels define the same order iff their indices agree.
- `QuadraticOrder.classify` (equivalence): O0-orders in O_F correspond to natural-number levels.
- `QuadraticOrder.units` (compatibility): For s≥1, units are O0×(1+varpi0^sO_F).
- `QuadraticOrder.mapEquiv` (functoriality): An F0-isomorphism of quadratic fields transports every level order.

**Uses.** LT.6/quadratic-level-classification: Indexes quadratic quasi-canonical lattices. LT.7/quadratic-degree: Computes the ring-class quotient using the correct conductor.

**Checks and worked examples.**

- `level_zero` (degenerate): O_0=O_F and its conductor is O_F.
- `level_one_proper` (computation): O_1 is a proper suborder for every quadratic extension.
- `ramified_conductor` (computation): If e(F/F0)=2, varpi0^sO_F has π_F-valuation 2s, not s.
- `unit_nonexample` (non-example): At s=0 in the unramified case, O0×(1+O_F) is not a valid unit-subgroup formula: 1+O_F contains zero.

**Acceptance.** The conductor is not indexed by π_F^s when F/F0 is ramified. The unit formula at s≥1 is not extended blindly to the maximal-order case.

**Sources.** [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, p.325, Proposition 5.3. The family of quadratic orders and their unit quotient. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §5, Proposition 4, p.300, and the quadratic specialization. Proper lattices for quadratic orders have the freeness used in level classification.

### Quadratic level classification

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-level-classification` (theorem).

For quadratic F/F0, every proper O_s-lattice in F is free of rank one over O_s. Consequently there is exactly one unmarked quasi-canonical O0-module isomorphism class of each level s. Its marked classes form a simply transitive O_F×/O_s×-set in each compatible Frobenius component. A standard representative is L_s=varpi0^−s O0·t+T for a primitive element t of the rank-one O_F Tate module T; it has multiplier order O_s.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-order`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/marked-lattice-classification`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/canonical-lift`.

**Proof/construction.**

1. Normalize a lattice by an F×-scalar so that its least-valuation element is one, and write its second generator in an integral quadratic basis. The multiplier-order condition then identifies it with O_s. Equivalently prove quadratic orders are Gorenstein and apply Yu’s lattice argument.
2. For L_s compute directly that multiplication by a∈O_F preserves it iff a∈O_s; a primitive t identifies its OF span with T.
3. Apply the marked/unmarked classification. The stabilizer of its lattice class in O_F× is exactly O_s×, giving the torsor.

**Acceptance.** Level zero is the canonical lift, with trivial marked orbit after fixing its CM embedding and component. Changing t permutes marked representatives while preserving the unmarked level and the resulting abelian field.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §5, Proposition 4, p.300. Proper lattices over a Gorenstein order are free; quadratic orders give this case. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, Proposition 5.3, p.325. The standard lattice representative and its unit-stabilizer orbit.

### Smallest marked field of definition

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/marked-minimal-field` (theorem).

For a quasi-canonical H_L over its finite residue coefficient field k_F and a fixed universal deformation coordinate over B=O_(F^ur), where F^ur/F0 is the maximal unramified subextension of F/F0, let m_L denote its marked modulus (an (n−1)-tuple for n=[F:F0]). The smallest field containing F over which this marked deformation is defined is M_L=F(m_L). Under the existing arithmetic local reciprocity it is the class field of π_F^Z O_L×⊂F×. This statement is over the nonclosed residue field; after completed unramified base change it gives the usual Gross formulation. It does not assert absolute minimality among fields not containing F.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/marked-lattice-classification`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-descent`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/reciprocity-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

**Proof/construction.**

1. Arithmetic Artin sends m_L to m_(a^−1L). By marked classification it fixes m_L iff the unit factor a preserves the π_F^Z-lattice class, equivalently belongs to O_L×.
2. The canonical uniformizer subgroup acts trivially by the Lubin–Tate normalization; combine it with the unit stabilizer.
3. Apply the existing local class-field correspondence to identify M_L, and use the representing property to descend the marked formal module exactly over O_(M_L).
4. Prove independence from a universal coordinate by mutually inverse continuous base-coordinate substitutions defined over B. Compare completed unramified fields by compositum; do not replace this by a descent assertion from an algebraic closure.

**Acceptance.** Minimality refers to the marked deformation, not a chosen unmarked equation or to a model with every kernel point rational. For quadratic level s≥1, M_L depends only on O_s and π_F; level zero gives F.

**Sources.** [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, Theorem 1 and proof, p.297. The smallest field containing F is generated by the marked modulus and has subgroup π_F^Z O_L×. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, Proposition 5.3, pp.325–326. The completed unramified-base quadratic field comparison.

## LT.7. Quadratic orders, minimal fields and boundary tests

Compute quadratic marked field degrees for unramified and ramified CM extensions and prove that the positive-level deformation modulus is a uniformizer. Specialize to the BKO primed tower, retain its tame factor, give the ramified Honda counterexample and compute the neighboring conductor lattices.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

### Quadratic ring-class degrees

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree` (theorem).

Let F/F0 be quadratic, q0=#k0, π_F fixed and s≥1. The marked level-s field M_s/F is totally ramified, has Artin subgroup π_F^Z O_s×, and Gal(M_s/F)≃O_F×/O_s×≃(O_F/varpi0^sO_F)×/(O0/varpi0^sO0)×. Its degree is q0^(s−1)(q0+1) when F/F0 is unramified and q0^s when it is ramified. The canonical level-zero field is M_0=F of degree one, separately. These include ramification above 2.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/marked-minimal-field`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-order`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-level-classification`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

**Proof/construction.**

1. Use the order-unit formula and local reciprocity to identify the quotient and its total ramification; the uniformizer factor removes the unramified direction.
2. Count units in O_F/varpi0^sO_F. In the unramified case its size is (q0²−1)q0^(2s−2); divide by (q0−1)q0^(s−1).
3. In the ramified case varpi0^s has π_F-length 2s and residue size q0, so its unit group has size (q0−1)q0^(2s−1); the same denominator gives q0^s.
4. Handle s=0 directly through the maximal order. Compare field inclusions using the nested unit subgroups.

**Acceptance.** For s=1 the unramified degree is q0+1 and the ramified degree is q0. No expression with exponent s−1 is evaluated as the canonical s=0 formula.

**Sources.** [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), Proposition 5.3(2), p.325. The two quadratic degree formulas and unit quotient, including the ramified case. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, Theorem 1, p.297. Minimality over F, before unramified completion.

### Quadratic deformation moduli

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/deformation-uniformizer` (theorem).

In the quadratic situation, use B equal to the integers of the maximal unramified subextension of F/F0 and a universal height-two formal O0-deformation over B[[t]]. For every level-s quasi-canonical lift with s≥1, its marked modulus t_s is a uniformizer of M_s. With v_F(π_F)=1, v_F(t_s)=1/[M_s:F], hence 1/(q0^(s−1)(q0+1)) in the unramified case and 1/q0^s in the ramified case. This is a statement about a valid universal deformation parameter over B, with its specified marking, not an arbitrary analytic function on the deformation space.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`.

**Proof/construction.**

1. Choose a normalized universal coordinate with the q0-power π0-series coefficient detecting its tangent direction. Factor the level-s cyclic lattice quotient into s quotient isogenies of degree q0.
2. Starting with the unramified and ramified canonical Newton polygons separately, follow the valuations through these quotient steps. Obtain the reciprocal-degree valuation for the deformation modulus.
3. Use the computed ramification degree to see that the modulus has valuation one in O_(M_s).
4. For another universal coordinate over B, its linear term is a unit and its constant term lies in m_B. Since s≥1 gives v_F(t_s)<v_F(m_B), this change preserves the valuation.

**Acceptance.** For BKO s=1, v_Phi(t_1)=1/(p+1). Canonical s=0 is treated independently; no reciprocal-degree extrapolation is asserted for its chosen parameter.

**Sources.** [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), Proposition 5.3(3) and its proof, pp.325–326. The modulus has valuation one in the ring-class extension, via successive quotient Newton polygons. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), Theorem 2′ and its n=2 specialization, pp.301–302; proof in §§9–10, pp.305–309. The quadratic Newton polygon yields the same uniformizer assertion.

### BKO quasi-canonical fields

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields` (construction).

Fix p≥5, Φ/Q_p unramified quadratic, O=O_Φ, π=−p, κ=χ_π and canonical H. For a primitive t∈T_πH and s≥1, let L_s=p^−s Z_p t+T, H_s=H_(L_s), O_s=Z_p+p^sO and Ψ′_s the smallest field containing Φ of its marked modulus. Then Ψ′_s is the fixed field of κ^−1(O_s×), equivalently the Artin class field of (−p)^Z Z_p×(1+p^sO). It has degree p^(s−1)(p+1), and H_s has exactly endomorphism order O_s. Set Ψ′_0=Φ only as a separate canonical-level convention.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-level-classification`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character`.

**Proof/construction.**

1. Specialize the general quadratic construction and compare p- and (−p)-power lattices: their difference is a unit, so the embedded lattices agree.
2. Use the multiplier-order calculation and marked minimal-field theorem.
3. Show replacing the primitive generator multiplies the lattice by an O-unit. The marked lift can change, while its stabilizer field is unchanged because the Galois group is abelian.
4. Construct transition inclusions Ψ′_s⊂Ψ′_(s+1) from O_(s+1)×⊂O_s×.

**API.**

- `BKO.quasiCanonical` (constructor): The marked level-s quotient from its actual lattice.
- `BKO.quasiField` (constructor): The fixed subfield Ψ′_s in the chosen separable closure.
- `BKO.quasiField_fixed` (characterisation): Its fixing subgroup is κ^−1(Z_p×(1+p^sO)).
- `BKO.quasiField_generatorIndependent` (compatibility): Replacing t by an O-unit multiple gives the same subfield.
- `BKO.quasiField_mono` (functoriality): s≤r induces Ψ′_s⊂Ψ′_r, compatibly with restriction.
- `BKO.quasiLift_baseChange` (compatibility): Integral coefficient extension preserves its marked modulus and exact endomorphism order.
- `BKO.quasiField_ext` (extensionality): Subfields with the stated closed fixing subgroup agree in the chosen separable closure.
- `BKO.quasiLift_coordinateIndependent` (compatibility): Transport of the canonical formal coordinate and its Tate lattice preserves the marked class and its smallest field.

**Uses.** LT.7/ringclass-galois: Forms the primed infinite tower. LT.8/field-generator-comparisons: Identifies its tame fixed fields with Ψ_n.

**Checks and worked examples.**

- `level_one_degree` (computation): [Ψ′_1:Φ]=p+1, including p=5 where the degree is 6.
- `level_zero_separate` (degenerate): Ψ′_0=Φ has degree one and is not obtained from p^(s−1)(p+1) at s=0.
- `level_two_step` (computation): [Ψ′_2:Ψ′_1]=p.
- `setwise_kernel` (computation): The first cyclic kernel is defined as a subgroup over Ψ′_1 while its nonzero points need not be rational there.

**Acceptance.** The level-one field has degree p+1, and is smaller than the full first Lubin–Tate division field of degree p²−1. End(H_s)=Z_p+p^sO is proved for the actual quotient, not supplied as structure data.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5.0.2, pp.958–959. The level-s lattice quotients, endomorphism orders and primed ring-class fields. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), Proposition 5.3, p.325. Degree and endomorphism-order computation. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, Theorem 1, p.297. Smallest field containing Φ of the marked lift.

### Infinite primed ring-class tower

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/ringclass-galois` (theorem).

For Ψ′_∞=⋃_(s≥1)Ψ′_s in the BKO setup, κ induces Gal(Ψ′_∞/Φ)≃O×/Z_p×. Teichmüller and deep-unit logarithm identify this topological group with μ_(p+1)×Z_p, hence Z/(p+1)×Z_p after a choice of tame generator and a Z_p-basis of the negative line. The finite tame factor is canonical as the prime-to-p torsion subgroup. Its fixed field will be the anticyclotomic pro-p tower of LT.8.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof/construction.**

1. Take inverse limits of O×/O_s× and prove ∩_(s≥1)O_s×=Z_p×.
2. Use O×=μ_(p²−1)×(1+pO) and Z_p×=μ_(p−1)×(1+pZ_p).
3. Import the logarithm on 1+pO. The quotient pO/pZ_p is a free rank-one Z_p-module; the tame quotient has order p+1.
4. Record which equivalences are canonical and which require generators.

**Acceptance.** The Galois group is not Z_p alone: its tame torsion survives. The tame factor has order p+1, not p²−1.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5.0.2, pp.958–959. The primed infinite tower has a tame factor of order p+1 and one Z_p direction. [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), LocalFieldsRamification Layer 1, unit decomposition and deep log/exp. The existing multiplicative-unit decomposition provides the group calculation.

### Ramified Honda boundary test

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/honda-ramified-test` (theorem).

The unramified hypothesis in LT.4 cannot be discarded: the level-one BKO quasi-canonical quotient H_1 over O_(Ψ′_1) has special-fiber q-Frobenius [−p] and height two, but its geometric integral Z_p-endomorphism ring is Z_p+pO, not O. It is therefore not isomorphic over any finite coefficient extension to an O-Lubin–Tate formal module. Its coefficient ring is totally ramified of degree p+1 over O, where −p is no longer a uniformizer.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/unramified-honda-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-homs`.

**Proof/construction.**

1. Choose the standard canonical law for −p with coefficients in Z_p, so its p-Frobenius twist has the same underlying reduced law and q-Frobenius [−p]. The level-one product reduces to the relative p-Frobenius.
2. Compute the full integral endomorphism ring through the multiplier lattice over a splitting extension; it remains the proper order under further finite extension.
3. An isomorphism to an O-Lubin–Tate group would transport its maximal O-action, contradicting that order.
4. Compare valuations to explain why replacing congruence modulo p by congruence modulo the maximal ideal is invalid over this coefficient ring.

**Acceptance.** This supplies an actual ramified lift failing the unrestricted Honda shortcut. It does not claim that every formal group over a ramified base lacks a Lubin–Tate structure.

**Sources.** [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, Proposition 5.3, p.325. Level-one quasi-canonical quotients have the proper order and the stated ramified degree. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §3–4, pp.295–298. The multiplier-order formula persists for integral homomorphisms in the geometric isogeny class.

### Neighboring level lattices

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/lattice-neighbors` (theorem).

In the BKO unramified quadratic isogeny class, the p+1 index-p superlattices of a rank-two Z_p-lattice give the neighboring quotient isogenies. At level s≥1, one neighbor has level s−1 up to F×-homothety and p have level s+1; at level zero all p+1 have level one. The level-s stabilizer acts transitively on the outward p neighbors, and the canonical-level tame quotient acts transitively on the first p+1 neighbors. This provides isogeny inputs for subsequent trace recurrences without claiming those recurrences here.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quadratic-level-classification`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/lattice-quotient`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields`.

**Proof/construction.**

1. List the p+1 lines in p^−1L/L≃F_p² using a basis of L_s.
2. Compute the multiplier order of each next lattice: the distinguished line lowers the conductor, while the remaining p raise it. At s=0 maximal-order units permute all lines.
3. Compute the stabilizer action from 1+p^sO modulo 1+p^(s+1)O and, at the first level, from F_p²×/F_p×.
4. Transport the lattice inclusions to integral quotient isogenies and record their Galois equivariance.

**Acceptance.** At s=0 there is no inward level −1 neighbor. The Hecke/local-point recurrence and its distinguished point choices remain with AnticyclotomicLocalUnits.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5.0.1–§5.0.2, pp.957–959. The subgroup quotients and conductor-changing isogenies used in the local-point construction. [G86](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), §5, p.325. The standard level-s lattice permits the elementary neighbor calculation.

## LT.8. The BKO tame and anticyclotomic towers

In the unramified quadratic p≥5, π=−p setting, construct κ, Δ, ω and the two principal-unit eigendirections. Define the actual Θ_n and Ψ_n fields, compare their fixed subgroups with Ψ′_s, and make the torsion-generator, modulus-generator and alternating π/p Tate-generator formulas explicit.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

### BKO tame character data

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-character-data` (construction).

In the p≥5, Φ/Q_p unramified quadratic, π=−p setup, define Φ_n=Φ(H[π^(n+1)]) for n≥0, Φ_−1=Φ and Φ_∞=⋃Φ_n. Restrict the actual Tate character to obtain κ:Gal(Φ_∞/Φ)≃O×. Define Δ as κ^−1(μ_(p²−1)) and Γ=κ^−1(1+pO); the restriction Δ→Gal(Φ_0/Φ) is an isomorphism and Gal(Φ_∞/Φ)=Δ×Γ canonically. Define ω=κ|Δ, the Teichmüller character with values in O×.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/reciprocity-comparison`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof/construction.**

1. Construct each actual torsion field as a subfield of the fixed separable closure and pass from the finite Galois actions to κ.
2. Import the unit decomposition and pull back its two factors. Show the Teichmüller splitting is the unique prime-to-p torsion lift, rather than an arbitrary section of a finite Galois quotient.
3. Identify the first finite Galois group and its restriction from Δ. Prove basis and same-π coordinate independence by the character comparison.

**API.**

- `BKO.torsionField` (constructor): The finite subfield Φ_n generated by the indicated actual torsion points.
- `BKO.kappa` (equivalence): The continuous unit-valued Galois equivalence induced by T_πH.
- `BKO.deltaGammaEquiv` (equivalence): The canonical product Δ×Γ→Gal(Φ_∞/Φ).
- `BKO.omega` (projection): The Teichmüller character on Δ, with its actual values in O×.
- `BKO.characterData_ext` (extensionality): Actions equal on all finite torsion levels give the same data.
- `BKO.characterData_transport` (functoriality): Isomorphisms of the valued Φ-data and compatible separable closures transport fields and characters; same-π coordinates and Tate-basis changes give the identical transported fields.

**Uses.** LT.8/quadratic-directions: Splits the wild rank-two group into its conjugation eigenspaces. AnticyclotomicLocalUnits (ColemanPowerSeries, Part II): Supplies the exact κ/ω conventions for the local-unit eigenspace inputs.

**Checks and worked examples.**

- `first_field_degree` (computation): [Φ_0:Φ]=p²−1, not p+1.
- `next_field_degree` (computation): [Φ_1:Φ]=(p²−1)p².
- `delta_order` (computation): Δ has order p²−1 and Γ has no nontrivial finite prime-to-p torsion.
- `omega_unit_inverse` (computation): For a Teichmüller unit a, ω of its Artin image is a^−1.

**Acceptance.** Δ is a subgroup of the infinite Galois group with a canonical identification to the first finite quotient; these carriers are related by an isomorphism. ω has the same orientation as κ; Artin units still act by their inverse.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §2, pp.947–948. The torsion field indexing, κ, Δ and ω. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), Theorem 2, pp.383–384. The finite and infinite torsion Galois actions are the unit groups.

### Cyclotomic and anticyclotomic directions

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/quadratic-directions` (construction).

Let c be the nontrivial automorphism of Φ/Q_p. Conjugation acts on κ-values by c, and preserves Γ. Under the imported log:1+pO≃pO, define G+ and G− from the images of (1+c)/2 and (1−c)/2. Then Γ=G+×G−, κ(G+)=1+pZ_p and κ(G−)={u∈1+pO:N_(Φ/Q_p)(u)=1}; each is topologically free rank one over Z_p. The factors are canonical, while isomorphisms with the additive group Z_p require a basis of the corresponding line.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-character-data`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Proof/construction.**

1. Use coefficient conjugation of H and its same-π comparison, since −p is rational, or the existing naturality of local reciprocity, to prove cκ(σ)=κ(cσc^−1).
2. Import the principal-unit log/exp equivalence at depth one; p≥5 satisfies its unramified convergence bound.
3. Split the free rank-two Z_p-module pO by the two idempotents, prove the plus line is pZ_p and the minus line is the trace-zero line.
4. Transport the decomposition back multiplicatively, using log N=Tr log. Prove independence of the chosen lift of c by abelianness of the Φ-Galois group.

**API.**

- `BKO.plusMinus` (constructor): The canonical closed eigensubgroups of Γ.
- `BKO.gammaSplit` (equivalence): Multiplication gives G+×G−≃Γ as topological groups.
- `BKO.minus_iff_normOne` (characterisation): A principal-unit κ-value belongs to G− iff its norm is one.
- `BKO.directions_ext` (extensionality): The eigensubgroups are determined by the stated conjugation equations.
- `BKO.directions_transport` (functoriality): A compatible coefficient-field isomorphism transports both factors and their projections.
- `BKO.directionBasis_change` (compatibility): Replacing a Z_p-basis scales only the displayed Z_p-coordinate; the subgroup and fixed field are unchanged.

**Uses.** LT.8/bko-fields: Defines the anticyclotomic fixed fields. LT.7/ringclass-galois: Identifies the wild quotient O×/Z_p× with G−.

**Checks and worked examples.**

- `plus_scalar` (computation): Every element of 1+pZ_p belongs to G+.
- `minus_trace` (computation): For a trace-zero z∈pO, exp(z) belongs to G−.
- `intersection_trivial` (degenerate): G+∩G−={1}, using that 2 is invertible.
- `wrong_rank` (non-example): An arbitrary principal unit with nonzero trace logarithm is not in G−.

**Acceptance.** G− is one rank-one direction, rather than all of Γ. The action of c on G− is inversion and on G+ is the identity.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §2, pp.947–948. The two conjugation eigendirections in the principal-unit Galois group. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §1, Theorem 1, pp.382–383. Same-parameter transport intertwines the conjugate coefficient action.

### BKO finite fixed fields

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields` (construction).

For n≥0 define Θ_n=Φ_n^Δ and Ψ_n=Θ_n^(image G+), using restriction of the infinite Galois subgroups. Then [Θ_n:Φ]=p^(2n), [Ψ_n:Φ]=p^n, Θ_0=Ψ_0=Φ, and the transition inclusions are the ones induced from Φ_n. At infinity Θ_∞=Φ_∞^Δ and Ψ_∞=Φ_∞^(ΔG+), with Gal(Ψ_∞/Φ) identified with G−. The extension Ψ_∞/Q_p is Galois with inversion action of c; its maximal dihedral pro-p assertion refers to its subgroup over Φ, since its full Q_p-Galois group contains C2.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/quadratic-directions`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-character-data`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

**Proof/construction.**

1. At finite level κ gives O×/(1+p^(n+1)O). Remove its Teichmüller factor to obtain (pO/p^(n+1)O,+).
2. Project by the plus/minus decomposition to compute both degrees and transition maps.
3. Pass to the union and apply the infinite fixed-field correspondence, proving continuity and the G− identification.
4. Conjugation preserves the defining subgroups and acts by inversion on the minus quotient. Any dihedral quotient in Φ_∞ with pro-p group over Φ must kill Δ and the plus direction: inversion and trivial conjugation coincide on a pro-p plus quotient only when that quotient is trivial, since p is odd. This proves maximality. For a lift j of c to Gal(Ψ_∞/Q_p), j² belongs to the torsion-free group G−. Since j commutes with j² and conjugates G− by inversion, (j²)²=1 and j²=1. Thus the extension splits as G−⋊C2, with its inversion action.

**API.**

- `BKO.thetaField` (constructor): The actual finite fixed subfield Θ_n of Φ_n.
- `BKO.psiField` (constructor): The fixed subfield Ψ_n after removing the plus direction.
- `BKO.psiGaloisEquiv` (equivalence): Gal(Ψ_n/Φ) is the finite minus quotient, compatibly in n.
- `BKO.fields_ext` (extensionality): Closed fixing subgroups determine equal finite or infinite subfields.
- `BKO.fields_mono` (functoriality): Level increase gives compatible field inclusions and Galois restriction maps.
- `BKO.fields_coordinateIndependent` (compatibility): Same-π coordinates and Tate-basis changes induce identical fields; compatible coefficient isomorphisms transport their fixed-subgroup descriptions.

**Uses.** LT.8/field-generator-comparisons: Matches these fixed fields to quasi-canonical ring-class fields. LT.9/tame-descent: Specifies the target fields of the finite tame trace.

**Checks and worked examples.**

- `zero_fixed_fields` (degenerate): Θ_0=Ψ_0=Φ.
- `first_wild_degrees` (computation): [Θ_1:Φ]=p² while [Ψ_1:Φ]=p.
- `finite_minus_cyclic` (computation): Gal(Ψ_n/Φ) is cyclic of order p^n.
- `tame_field_removed` (computation): The degree-p²−1 field Φ_0 is removed by taking Δ-fixed points.

**Acceptance.** The n=0 fields are Φ, although Φ_0 has nontrivial tame degree. The full semidirect group Z_p⋊C2 is not called a pro-p group.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §2, pp.947–948; §5, pp.955–959. The finite Θ/Ψ fields and the anticyclotomic tower.

### Field and generator comparisons

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/field-generator-comparisons` (theorem).

For primitive compatible π^(n+1)-division points v_n, Φ_n=Φ(v_n), and replacing the Tate generator does not change Φ_n, Θ_n or Ψ_n. Let Δ′=Δ/μ_(p−1), the tame subgroup of Gal(Ψ′_∞/Φ) of order p+1. For n≥0, Ψ_n=(Ψ′_(n+1))^Δ′; at infinity (Ψ′_∞)^Δ′=Ψ_∞. For s≥1, Ψ′_s∩Ψ_s=Ψ_(s−1), Ψ′_s Ψ_s=Ψ′_(s+1), and restriction identifies Gal(Ψ′_(s+1)/Ψ′_s) with Gal(Ψ_s/Ψ_(s−1)). A universal marked modulus t_s generates Ψ′_s over Φ. These generator statements retain the specified separable closure and embeddings.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/ringclass-galois`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/deformation-uniformizer`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division`.

**Proof/construction.**

1. A primitive torsion point generates every level point by the O-action, so its field is the full division field; changing generator is a Galois automorphism of that field.
2. The subgroup for Ψ′_(n+1) is Z_p×(1+p^(n+1)O). Adding the tame subgroup gives μ_(p²−1)(1+pZ_p)(1+p^(n+1)O), exactly the subgroup for Ψ_n.
3. Compute intersections and composita from the tame×minus product and its finite-level p-power filtration. The ramification degrees give the stated restriction isomorphism.
4. Use the marked minimal-field theorem, or its uniformizer calculation, to identify Φ(t_s)=Ψ′_s. Distinguish this modulus generator from a primitive torsion point.

**Acceptance.** The essential level shift is n+1; (Ψ′_n)^Δ′=Ψ_(n−1) for n≥1. At n=0, the Δ′-fixed part of Ψ′_1 is Φ. For s=1 the field rectangle uses Ψ_0=Φ, not an undefined Ψ_−1.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §2, p.947; §5.0.2, pp.958–959. Torsion generators, tame-fixed ring-class comparison and adjacent-level field rectangle. [Y95](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §4, Theorem 1, p.297. The marked modulus generates the smallest ring-class field.

### π-adic and p-adic generators

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/sign-generator-comparison` (theorem).

For a Tate generator (v_n)_(n≥0) with [−p]v_(n+1)=v_n and v_n of order p^(n+1), define w_n=[(−1)^n]v_n. Then [p]w_(n+1)=w_n and (w_n) is the corresponding p-adic Tate generator. This map is O-linear, Galois equivariant and invertible, and preserves every finite division field. Under an elliptic formal isomorphism Ehat≃H it gives the R07.1 p-adic Tate-module comparison with the initial-component normalization w_0=v_0. At a fixed index n, logarithm and finite formal trace commute with the scalar j_n=[(−1)^n] when the same scalar is used on both ends. If source and target are assigned indices n,m instead, Tr∘j_n=[(−1)^(n+m)]∘j_m∘Tr. The alternation is not silently commuted across a field trace between different indices.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/tate-module-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-character-data`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log`.

**Proof/construction.**

1. Check [p][(−1)^(n+1)]v_(n+1)=[(−1)^n][−p]v_(n+1).
2. The same alternating sign is its own inverse; multiplication by a unit preserves primitive order and field generation.
3. Apply coordinate and Galois functoriality and identify the resulting cofinal-limit comparison with the parent p-divisible Tate module.
4. Evaluate the formal logarithm and finite Galois sums for a fixed scalar j_n. If target coordinates use j_m, insert j_n=j_(n+m)∘j_m to obtain the displayed trace correction; keep this distinct from compatibility with [−p]/[p] transitions.

**Acceptance.** With the chosen indexing w_0=v_0; a different initial indexing changes the displayed global sign. The sign is an actual scalar [−1] in the formal law, rather than naive negation of its parameter. For adjacent source/target index labels the conjugated field trace has one extra [−1].

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §2, footnote 2, p.948; §5, pp.956–959. The π-adic convention replaces the older p-adic convention by alternating signs.

## LT.9. Formal traces and compatible tower maps

Construct finite additive formal traces. The tame trace from Ψ′_(s+1) to Ψ_s is surjective and commutes with the p-step traces, logarithms and elliptic coordinates. These proved maps export the common local foundation while the consumers retain their cohomological, diamond, Coleman and distinguished-point constructions.

**Layer inputs:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

### Finite formal traces

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace` (construction).

For a formal O0-module G over O_K and a finite Galois extension L/K, define Tr^G_(L/K):G(m_L)→G(m_K) by the finite formal sum of σx over Gal(L/K). More generally the same formula on embeddings gives the finite separable trace. It is O0-linear, natural for coefficient-defined formal homomorphisms, compatible with towers, coefficient field isomorphisms and coordinate transport. Its value is invariant and lies in m_K; logarithms carry it to the usual field trace.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Proof/construction.**

1. Evaluate the finite formal sum in G(m_L), use permutation invariance to prove it is Galois fixed, and identify the fixed maximal-ideal parameters with m_K.
2. Prove O0-linearity and functoriality from the actual group action. Partition a tower’s embeddings to prove transitivity.
3. Use coordinate-isomorphism and convergent logarithm compatibility term by term. For a Galois base change disjoint from L/K, compare the same embeddings; state this disjointness hypothesis explicitly.

**API.**

- `FormalModule.trace` (constructor): The finite Galois sum, descended to the base maximal-ideal point group.
- `FormalModule.trace_ext` (extensionality): Maps agreeing on every conjugate point have the same trace value.
- `FormalModule.trace_trans` (functoriality): Trace along a tower is the composite of the two formal traces.
- `FormalModule.trace_map` (compatibility): Coefficient-defined formal homomorphisms commute with trace.
- `FormalModule.trace_coordinateIso` (equivalence): A coordinate isomorphism intertwines the trace operators.
- `FormalModule.trace_baseChange` (compatibility): For a linearly disjoint finite Galois coefficient extension, trace commutes with the induced point inclusion.
- `FormalModule.log_trace` (compatibility): ℓ_G(Tr^G x)=Tr_field(ℓ_G(x)).

**Uses.** LT.9/tame-descent: Defines the tame averaging map without division by its degree. LT.9/trace-compatible-exports: Supplies the commuting field-trace identities.

**Checks and worked examples.**

- `identity_trace` (degenerate): Tr^G_(K/K)=id.
- `fixed_point_degree` (computation): For x∈G(m_K), Tr^G_(L/K)(x)=[L:K]_G x.
- `multiplicative_norm` (computation): For G_m, 1+Tr^G(x)=N_(L/K)(1+x), generally different from 1+Tr_field(x).
- `additive_trace` (computation): For G_a, the formal trace is the ordinary field trace on m_L.

**Acceptance.** This is the additive formal trace, called a formal norm in some sources; it is not the ordinary coordinate trace unless G is additive. Only finite sums are asserted here; inverse-limit vanishing and Coleman recurrences are separate consumers.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §4, pp.954–955; §5.0.2, pp.958–959. Formal norm/trace maps on complete local-field formal-group points. [LT65](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), §1, p.383. Integral formal addition and coefficient-fixed Galois actions on maximal ideals.

### Tame descent on formal points

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/tame-descent` (construction).

For s≥0 in the BKO setup, define D_s=Tr^H_(Ψ′_(s+1)/Ψ_s):H(m_(Ψ′_(s+1)))→H(m_(Ψ_s)), a formal sum over Δ′ of order p+1. This uses Ψ_s=(Ψ′_(s+1))^Δ′. It is O-linear, compatible with coordinate transport and the elliptic formal comparison, and independent of any enumerated tame generator. On a point already over Ψ_s it is [p+1]_H, whose inverse exists integrally, so D_s is surjective.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/field-generator-comparisons`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison`.

**Proof/construction.**

1. Define the trace from the actual tame field extension identified in LT.8; no arbitrary same-degree field is substituted.
2. Use the fixed-point trace formula to obtain D_s∘inclusion=[p+1]. Since p+1 is a unit in O, the formal O-action gives a continuous section by [(p+1)^−1].
3. Commute the sum with coefficient-defined coordinate maps, including the elliptic comparison, and with compatible field isomorphisms.

**API.**

- `BKO.tameDescent` (constructor): The unnormalized finite formal trace D_s.
- `BKO.tameDescent_ext` (extensionality): The map is determined by the finite tame action on the actual source point group.
- `BKO.tameDescent_surjective` (universal-property): The unit [p+1] inverse followed by field inclusion is a right inverse.
- `BKO.tameDescent_transport` (functoriality): Compatible isomorphisms of the field rectangle transport D_s.
- `BKO.tameDescent_coordinateIso` (compatibility): Same-π and elliptic coordinate isomorphisms intertwine D_s.
- `BKO.tameDescent_baseChange` (compatibility): Linearly disjoint finite coefficient extension commutes with D_s by the formal-trace base-change identity.

**Uses.** LT.9/trace-compatible-exports: Passes trace systems from the primed tower to Ψ_s. AnticyclotomicLocalUnits (ColemanPowerSeries, Part II): Transports the local-point input; constructing the distinguished points and their recurrence remains there.

**Checks and worked examples.**

- `first_tame_trace` (computation): D_0 is the trace Ψ′_1/Φ of degree p+1.
- `fixed_point_multiplier` (computation): For x already over Ψ_s, D_s(x)=[p+1]x.
- `zero_point` (degenerate): D_s(0)=0.
- `no_divided_trace` (non-example): The normalized idempotent [(p+1)^−1]D_s fixes base points; D_s itself multiplies them by p+1.

**Acceptance.** D_0 traces the degree-p+1 level-one field to Φ. No factor 1/(p+1) is included in the definition; a normalized projection is a separately named composite.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5.0.2, pp.958–959. Tame traces take quasi-canonical local points to the anticyclotomic tower.

### Trace-compatible tower comparisons

**Target:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/trace-compatible-exports` (theorem).

For s≥0 and x∈H(m_(Ψ′_(s+2))), the BKO field rectangle gives Tr^H_(Ψ_(s+1)/Ψ_s)(D_(s+1)x)=D_s(Tr^H_(Ψ′_(s+2)/Ψ′_(s+1))x). The same square commutes after normalized logarithm and after a coefficient-defined elliptic formal isomorphism. The π/p Tate systems have the compatible transition comparison of LT.8; if alternating sign coordinates are assigned to different field levels, their formal traces carry exactly the correction in that node. Consequently D sends any primed trace-compatible point system to an unprimed trace-compatible system. The formal O_K-module, torsion and finite-height deformation APIs export to the existing two-tower and diamond consumers without importing their classifications.

**Prerequisites:** `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/tame-descent`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/sign-generator-comparison`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/field-generator-comparisons`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/universal-deformation`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/elliptic-isogeny-comparison`.

**Proof/construction.**

1. Both sides are the formal trace from Ψ′_(s+2) to Ψ_s, by transitivity through Ψ_(s+1) and through Ψ′_(s+1). Use the field rectangle to identify the finite source and target maps.
2. Apply the proved coordinate and logarithm compatibilities. For π/p Tate coordinates use their actual transition comparison; a field trace with source/target sign labels n,m transforms with [(−1)^(n+m)], so it is not asserted to commute without that factor.
3. Take products of the finite point groups and impose the trace-transition equations. The component maps D_s preserve these equations and are natural under compatible base change.
4. List the exported carrier and theorem signatures required by each consumer; keep its geometric realizations, distinguished point choices and classifications with that consumer.

**Acceptance.** For s=0 the square involves Ψ′_2, Ψ′_1, Ψ_1 and Φ, all defined. The theorem asserts compatibility of supplied point systems; it does not assert existence of a nonzero norm-compatible system or a Coleman map.

**Sources.** [BKO21](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §5.0.2, pp.958–959. The tame trace and neighboring p-step traces pass between the two local towers. [LIB](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), EndoscopicTransferAndUnitaryTraceComparison ET.6a and VectorBundlesAndIsocrystals VB3:positive-basic-examples. Those consumers own two-tower/cohomological realization and diamond universal covers; these foundations precede them.

## Normalization check in the BKO Honda comparison

For a_(p²)=2s p, the scalar Frobenius is [s p]. Honda’s composition congruence therefore gives type p−sT², and the Lubin–Tate parameter is s p. The signs paired with a_(p²) in the published BKO Lemma 5.1(ii), p.956, are reversed. This is the previously confirmed atlas correction PAPER-BURUNGALE-KOBAYASHI-OTA-21/E9. The a_p=0 application uses s=−1, hence type p+T² and π=−p, consistently with the subsequent local construction. The ramified level-one example in LT.7 prevents extending this unramified comparison by replacing congruence modulo p with congruence modulo an arbitrary maximal ideal.

## Suggested signatures

The associated Lean file is a compact set of suggested statements over carriers available at the pinned libraries. It includes real coefficient-level predicates and formal-law milestones. The formal O_K-module/action, marked-deformation, Tate-lattice quotient and tower-point carriers remain the precise mathematical targets above; they are not replaced by placeholder types in the signature file. The README specifies every target, API, Check and comparison, regardless of whether its carrier can already be expressed in that file.

## References

- **LT65.** Jonathan Lubin and John Tate. [Formal complex multiplication in local fields](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf). Annals of Mathematics 81 (1965), 380–387. Accessed 2026-10-18.
- **LT66.** Jonathan Lubin and John Tate. [Formal moduli for one-parameter formal Lie groups](https://www.numdam.org/item/10.24033/bsmf.1633.pdf). Bulletin de la Société Mathématique de France 94 (1966), 49–59. Accessed 2026-10-18.
- **H70.** Taira Honda. [On the theory of commutative formal groups](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf). Journal of the Mathematical Society of Japan 22 (1970), 213–246. Accessed 2026-10-18.
- **H68.** Taira Honda. [Formal groups and zeta-functions](https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf). Osaka Journal of Mathematics 5 (1968), 199–213. Accessed 2026-10-18.
- **G86.** Benedict H. Gross. [On canonical and quasi-canonical liftings](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf). Inventiones Mathematicae 84 (1986), 321–326. Accessed 2026-10-18.
- **Y95.** Jiu-Kang Yu. [On the moduli of quasi-canonical liftings](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf). Compositio Mathematica 96 (1995), 293–321. Accessed 2026-10-18.
- **BKO21.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota. [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1). Annals of Mathematics 194 (2021), 943–966; publisher PDF. Accessed 2026-10-18.
- **VZ07.** Eva Viehmann and Konstantin Ziegler. [Formal moduli of formal O_K-modules](https://www.numdam.org/item/AST_2007__312__R1_0.pdf). Astérisque 312 (2007), article 7, 57–66; full volume PDF. Accessed 2026-10-18.
- **LIB.** Mathlib and Tau Ceti contributors. [Pinned library declarations and current roadmap ownership](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; roadmap audit 0d144d044dacebca17b654695b6f1ad58f159b27. Accessed 2026-10-18.
