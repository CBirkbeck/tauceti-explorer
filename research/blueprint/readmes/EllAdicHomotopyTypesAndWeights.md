# ℓ-adic homotopy types of varieties and their weights

The aim is a commutative differential graded algebra over Q_l whose cohomology
is the ordinary étale cohomology ring of a variety, together with the weight
structure that controls its minimal model. The algebra contains information
about nonabelian unipotent fundamental groups as well as cohomology. It is
constructed from integral divided-power forms; its rational and l-adic
comparisons make it possible to use Frobenius to study Sullivan models.

For a complex variety the end result includes a rational weight grading on its
Sullivan model, splitting the geometric Hodge weight filtration on cohomology.
Any two such gradings are conjugate by an automorphism acting identically on
associated graded cohomology. Over a general algebraically closed field the
grading is over Q_l. Proper smooth varieties are formal. For a normal variety,
the unipotent étale Lie algebra has generators of weights −1 and −2 and
relations of weights −2, −3 and −4. The hypotheses and the precise choices
behind each assertion are given in the layers below.

## Conventions and boundaries

Varieties are separated schemes of finite type over an algebraically closed
field k; connectedness is assumed when a single minimal model is used. The
prime l is invertible in k. Cohomology is ordinary cohomology, not compactly
supported cohomology. The differential raises cochain degree by one.

There are three different indices. A form has cochain degree p and divided-power
t-degree n; its differential has bidegree (+1,0). A minimal model has a separate
integer weight w, and its differential preserves w. The relative integral
simplex algebra kills dt, not t−1. Only the characteristic-zero barycentric
polynomial algebra specializes t to 1. Total t-graded objects are direct sums;
only their individual bidegrees are completed.

At integral coefficients, graded commutativity includes vanishing of odd
squares. The Koszul sign rule by itself is too weak at the prime 2. At
characteristic zero the alternating condition follows from that rule. Use the
existing internally graded Tau Ceti DG carrier and its cohomology quotient;
there is no second definition of an ordinary DG algebra here.

Sullivan minimality means free graded commutativity with decomposable
differential and an ordered Hirsch-extension construction. It does not mean
the A∞ condition m₁=0. Finite-dimensional cohomology does not imply that every
graded piece of the minimal algebra is finite-dimensional. All eigenvalue
arguments therefore use finite-type invariant subalgebras and generalized
eigenspaces, with no semisimplicity assumption.

The rational theorem is Deligne’s theorem about complex varieties and their
rational topological models. A finite-field variety supplies Frobenius for a
Q_l-model; this is a separate assertion. Likewise, a conjugator inducing
identity on Gr^W H* is a weaker conclusion than being homotopic to identity.
Weil II 5.3.9–5.3.10 ask about continuity of the homotopy-automorphism action
and about that stronger conjugacy of filtrations. Those questions are outside
the theorem targets here.

## Inputs and library interfaces

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
at `f790474821cf4256814db967cb154e7af3d0c369`. The existing
`DividedPowerAlgebra`, its `dp` and `dp_mul`, and `ExteriorAlgebra` supply the
algebraic factors of simplex forms. `SSet` and
`CategoryTheory.Abelian.DoldKan.equivalence` supply simplicial carriers and
normalization. `CategoryTheory.Functor.IsMittagLeffler` supplies the ML
predicate; it is not an exactness theorem for completed complexes.
`TauCeti.IsDGAlgebra`, `TauCeti.DGAlgHom`, and
`TauCeti.IsDGAlgebra.Cohomology` supply the graded differential carrier, maps
and cohomology. `TauCeti.Hodge.MixedHodgeStructure` is already the abstract
mixed Hodge carrier; it does not put a geometric MHS on variety cohomology.

The following list records supplier contracts, including extensions still to
establish. It does not assert that each supplier already provides the entire
request. A named supplier is consumed through its own API; G1–G8 identify
unproved interfaces and arguments.

- **DGAInfinity, layer 1** (`tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`): Use the existing DG category, tensor product, quasi-isomorphisms and localization with the cohomological +1 differential convention; the new commutative refinement must forget to its existing carrier.

- **AlgebraicTopology, stage 6** (`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`): Ordinary simplicial cohomology with arbitrary commutative coefficients, coefficient exact sequences, cup product and naturality; identify compatible form comparisons with this existing cohomology. Current TauCeti singular cochains provide a carrier beyond the pins; extend their simplicial source API rather than defining a competing cohomology theory.

- **AlgebraicTopology, stage 5** (`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`): Use the finite-cover descent machinery for analytic comparison. The compatible good-cover nerve theorem and finite CW type for singular complex varieties are separately isolated in G3, since this layer’s finite Cech-small-chain descent does not prove them.

- **SchemeAndStackFoundations, SF.2** (`SchemeAndStackFoundations:SF.2`): Atlas compatibility handle for current upstream SchemeAndStackFoundations layer 2 (sites and scheme cohomology). Use its generic site, field/curve cohomology and proper-hypercover APIs only in their stated scope. The following full contract is unmet here and recorded in G8: For separated finite-type schemes over algebraically closed fields with l invertible: finite Z/l^r étale cohomology, computation by a cofinal étale hypercover pro-system, invariance under algebraically closed field extension, and étale–analytic comparison over C as in SGA4 XVI 4.1. Proper hypercover descent is a different theorem and cannot discharge this request. Supply the usual compatible Galois cohomology action as well. Current upstream explicitly leaves finite-coefficient/adic theory and Artin comparison downstream; this request does not assert that layer 2 supplies them.

- **SchemeAndStackFoundations, SF.4** (`SchemeAndStackFoundations:SF.4`): Atlas compatibility handle for current upstream SchemeAndStackFoundations layer 4. Use §4.17 SNC divisor API and §4.19 projective regular SNC alterations in their actual scope. The geometric Hodge construction in G4 additionally needs compatible proper smooth/SNC hyperresolutions and refinements. A proof may use alterations with rational proper descent; if it instead uses characteristic-zero birational resolution and SNC compactification, that stronger input must be sourced separately. Curve resolution (§4.13) and a general alteration do not establish it. No positive-characteristic resolution is assumed.

- **DeligneWeightsAndPurity, DWP.0** (`DeligneWeightsAndPurity:DWP.0`): Weil q-numbers with integral weights defined using all complex embeddings; multiplicative Weil weight homomorphism, coefficient-field Galois invariance and generalized eigenspace tensor/dual rules, without a semisimplicity assumption.

- **DeligneWeightsAndPurity, DWP.7** (`DeligneWeightsAndPurity:DWP.7`): Mixed finite-type cohomology and weight bounds, including proper smooth purity without projectivity, compatibility under good specialization, and the finite-field strata inputs to the geometric weight comparison. Cohomological H¹ weights for normal varieties and the geometric MHS comparison are justified separately by Poids 8.3/14 and G4.

- **ReductiveGroups, layer 5** (`tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`): Finite-dimensional characteristic-zero unipotent groups, Lie/exponential correspondence, central series and vanishing of unipotent torsors over the coefficient field as in Sullivan Appendix A.1; do not assume the inverse-limit compatibility in G6 follows automatically.

- **ReductiveGroups, layer 6** (`tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`): Characteristic-zero complete reducibility for finite-dimensional rational G_m representations, used to split finite-stage central unipotent extension obstructions.

- **ReductiveGroups, layer 7** (`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`): Finite-dimensional characteristic-zero Levi splitting and conjugacy over the base field, in the precise extension-by-unipotent case. The current stage names Levi decomposition in a broader structure-theory list; G6 and the Part III proposal identify the solvable-extension clarification needed here.

- **DGAInfinity, layer 8** (`tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`): Import the existing DG/A∞ formality predicates and the vanishing-of-Massey consequence. This roadmap proves only the new geometric commutative quasi-isomorphism and its compatibility with that formality predicate.

- **AnabelianGeometryAndNonabelianChabauty, NC.2** (`AnabelianGeometryAndNonabelianChabauty:NC.2`): The pointed Tannakian pro-unipotent étale fundamental group over Q_l, its Lie tower and finite unipotence-depth quotients, with H¹ abelianization and H² extension obstructions, for connected normal finite-type varieties, not only hyperbolic smooth curves. The 1-minimal-model comparison is new here (G7), while a scope extension for these general base varieties belongs to AnabelianGeometryAndNonabelianChabauty, Part II.

The general log de Rham complex is imported from
`ComplexComparisonPartII:C5/log-de-rham-complex`. Its SNC local description is
sufficient to name the geometric Hodge input, but its curve comparison alone
does not establish the general-variety Hodge realization. The homological
transfer and Massey/formality APIs of DGAInfinity layers 3 and 8 retain their
existing owners. Transfer is not used as a substitute for Sullivan existence.

The current Tau Ceti library also contains singular cochains built from
`SSet.chainComplex` and the linear Yoneda functor, with a singular cup product.
Those declarations postdate the pin and are consumed through the existing
AlgebraicTopology direction when the baseline is advanced; a competing
cohomology carrier is not a target here. Current RealAlgebraicGeometry
explicitly excludes triangulation, so its quantifier-elimination roadmap does
not supply the analytic good-cover argument.

## Layer overview

| Layer | Mathematical output |
| --- | --- |
| EH.0 | Commutative DG refinements and Sullivan models |
| EH.1 | Relative divided-power simplex forms |
| EH.2 | Simplicial cohomology and rational stabilization |
| EH.3 | Pro-simplicial completion and the homotopy algebra |
| EH.4 | Étale realization and complex comparison |
| EH.5 | Geometric cohomology and Frobenius weights |
| EH.6 | Minimal-model filtrations and weight gradings |
| EH.7 | Rational descent and conjugacy of gradings |
| EH.8 | l-adic weight splitting, formality and normal fundamental groups |

## EH.0. Commutative DG refinements and Sullivan models

Refine the existing internally graded DG carrier by strict graded commutativity, define polynomial homotopies and positive Sullivan/Hirsch minimal algebras, and prove existence, homotopy lifting and uniqueness up to nonunique isomorphism. Full Sullivan models are distinct from DGAInfinity’s A∞ transfer models.

**External inputs:** DGAInfinity, layer 1.

<a id="commutative-dg-refinement"></a>

### Strict graded commutativity on the existing DG carrier

Proposed declaration: `TauCeti.EllAdicHomotopy.commutative_dg_refinement`.

For a commutative coefficient ring R and an internally Z-graded R-algebra A with the existing TauCeti.IsDGAlgebra differential, impose A^p=0 for p<0, xy=(-1)^(pq)yx on homogeneous elements, and x²=0 for every homogeneous element of odd degree. This is extra structure on the existing carrier, not a replacement DG algebra. Over a characteristic-zero field the odd-square condition follows from the sign rule. Morphisms are existing DGAlgHom maps; quasi-isomorphism means isomorphism on every graded cohomology module. Connected means H⁰(A)=R when R is a field, not necessarily A⁰=R.


**Hypotheses.**

- R is commutative; differential has degree +1; the underlying algebra need not be an ordinary commutative ring.

**Requires:** `tauceti:TauCeti.IsDGAlgebra`; `tauceti:TauCeti.DGAlgHom`; `tauceti:TauCeti.IsDGAlgebra.Cohomology`; DGAInfinity, layer 1.


**Construction or proof.**

- Refine the pinned internally graded algebra by homogeneous commutation and alternating odd generators. Use its cycles and boundaries quotient for cohomology.
- Use DGAInfinity for the category, quasi-isomorphisms and localization; the new condition supplies the commutative subcategory.

**Uses.**

- Weil II 5.1.6: Integral simplex forms require exterior rather than merely sign-commuting differentials.
- EH.0 Sullivan models and EH.8 formality: A common commutative category is needed for free extensions and their cohomology targets.

**API.**

- `StrictCDGA.toIsDGAlgebra` (compatibility): Forgetting the refinement returns the same grading and differential, hence exactly the pinned cohomology algebra.
- `StrictCDGA.mul_comm_homogeneous` (relation): For x∈A^p and y∈A^q, xy=(-1)^(pq)yx.
- `StrictCDGA.odd_sq` (simp): A homogeneous odd-degree element has square zero over every coefficient ring.
- `StrictCDGA.map` (functoriality): Existing graded differential algebra homomorphisms give the morphisms; identities and composition retain their existing laws.
- `StrictCDGA.odd_sq_of_charZero` (characterisation): Over a characteristic-zero field, graded commutativity implies the odd-square axiom.

**Unit tests.**

- **exterior_line**: Λ_R(e), |e|=1, d=0 satisfies e²=0 even over Z/2.
- **symmetric_odd_rejected**: F₂[e] with |e|=1 and d=0 is rejected because e²≠0.
- **zero_differential_bridge**: For an existing graded algebra with d=0, the cohomology isomorphism is the pinned algEquivCohomologyOfZero, with the same product.

**Checks.**

- An exterior algebra on a degree-one module satisfies the integral condition.
- An ordinary symmetric algebra with an odd generator over F₂ fails the odd-square condition even though its Koszul signs are trivial.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.2)–(5.1.3), p. 234 — The sign convention is used for the integral exterior-form construction; [morgan](#source-morgan), §5, definitions preceding Theorem 5.6, pp. 163–165 — Free graded-commutative algebras are the carriers of minimal models.

<a id="sullivan-homotopy"></a>

### Polynomial homotopies of commutative DG maps

Proposed declaration: `TauCeti.EllAdicHomotopy.sullivan_homotopy`.

For commutative DG algebras M,A over a characteristic-zero field K, a polynomial homotopy from f to g is a commutative DG map M→A⊗K[t,dt], where |t|=0, |dt|=1, d(t)=dt and (dt)²=0, whose evaluations at t=0 and t=1 give f and g. For a Sullivan source use the equivalence relation generated by such homotopies; prove that a single polynomial homotopy suffices and that composition descends. There is no division by factorials over arbitrary integral coefficients in this definition.


**Hypotheses.**

- K is a characteristic-zero field.

**Requires:** [Strict graded commutativity on the existing DG carrier](#commutative-dg-refinement); DGAInfinity, layer 1.


**Construction or proof.**

- Take the tensor DG algebra supplied by DGAInfinity and its two evaluation maps.
- Use free-extension induction to prove the relative homotopy lifting and composition properties for Sullivan sources.

**Uses.**

- Weil II 5.2.5 and 5.3.1: Comparison and lifting automorphisms are only canonical up to this homotopy.
- EH.7 rational conjugacy: The proven conjugating automorphism is not assumed homotopic to the identity.

**API.**

- `PolynomialHomotopy.eval` (projection): The two evaluation morphisms kill dt and send t to the indicated endpoint.
- `PolynomialHomotopy.constant` (constructor): Every map has a constant self-homotopy.
- `PolynomialHomotopy.cohomology_eq` (compatibility): Homotopic maps have identical maps on existing cohomology.
- `PolynomialHomotopy.precomp` (functoriality): Precomposition and postcomposition preserve polynomial homotopies.
- `SullivanHomotopy.trans` (relation): For a Sullivan source polynomial homotopy is transitive, using the relative lifting argument.

**Unit tests.**

- **interval_differential**: d(t)=dt while both evaluations of dt vanish.
- **degree_one_maps**: Maps Λ(e₁)→Λ(a₁) sending e to a and to 2a cannot be homotopic: their H¹ maps differ.
- **constant_maps**: The constant polynomial path for the identity has both endpoints the identity and commutes with d.

**Checks.**

- Homotopic maps induce the same map on cohomology.
- Evaluation commutes with the differential; treating t as closed would invalidate the construction.

**Sources:** [morgan](#source-morgan), §5, Proposition 5.5 and Theorem 5.7, pp. 163–167 — The polynomial interval and extension argument control maps out of minimal algebras; [sullivan](#source-sullivan), §3, Propositions 3.3–3.5 and Corollary 3.6, pp. 284–285 — Gives obstruction and composition arguments in a cylinder convention; Morgan uses the polynomial-interval convention fixed here.

<a id="sullivan-minimal-model"></a>

### Sullivan algebras and their minimal models

Proposed declaration: `TauCeti.EllAdicHomotopy.sullivan_minimal_model`.

A Sullivan algebra over K is a free graded-commutative algebra ΛV on positive-degree generators with a well-ordered exhaustive Hirsch-extension filtration such that the differential of each generator belongs to the preceding algebra. It is minimal if d(V) lies in the ideal of decomposables (Λ⁺V)². A minimal model of a connected nonnegative commutative DG algebra A is a quasi-isomorphism M→A from such a minimal algebra. A Hirsch extension by generators of degree r is A⊗ΛV with dV⊂A^(r+1), d²=0. A 1-minimal model uses only degree-one Hirsch extensions and has a map inducing an H¹ isomorphism and an H² injection; it is not generally a full quasi-isomorphism.


**Hypotheses.**

- K is a characteristic-zero field; H⁰(A)=K.
- Finite-dimensional H^i(A) does not assert finite-dimensional M^i or finitely many generators of each degree.

**Requires:** [Strict graded commutativity on the existing DG carrier](#commutative-dg-refinement); [Polynomial homotopies of commutative DG maps](#sullivan-homotopy); DGAInfinity, layer 1; `mathlib:ExteriorAlgebra`.


**Construction or proof.**

- Use the graded-commutative free algebra, with polynomial even generators and exterior odd generators; extend d by the Leibniz rule.
- Encode an exhaustive ordered filtration and decomposability as properties of this carrier. Do not identify it with the homological-transfer minimal objects imported from DGAInfinity.

**Uses.**

- Weil II 5.2.5: Turns quasi-isomorphism comparisons into isomorphisms of minimal algebras.
- Weil II 5.3.1–5.3.8: Generator induction supplies eigenvalue bounds and the degree-one model supplies relations of the unipotent fundamental group.

**API.**

- `HirschExtension.lift` (universal-property): Maps from A⊗ΛV are equivalent to a map from A and generator images solving d(f(v))=f(dv).
- `SullivanMinimalModel.quasiIso` (projection): The model map induces all cohomology isomorphisms.
- `SullivanMinimalModel.indecomposables` (data): The quotient M⁺/(M⁺)² records generators with the differential induced by decomposability equal to zero.
- `SullivanMinimalModel.baseChange` (compatibility): Scalar extension between characteristic-zero fields preserves a minimal model when cohomology base change is valid.
- `OneMinimalModel.cohomology` (characterisation): The map is an isomorphism on H¹ and injective on H²; the full model notion retains all degrees.
- `HirschExtension.hom_ext` (extensionality): Two DG maps from a Hirsch extension agreeing on its base and each new generator are equal.

**Unit tests.**

- **circle_minimal**: Λ(a), |a|=1, da=0 is minimal and has H⁰=K, H¹=Ka and no H².
- **even_sphere_minimal**: K[x₂]⊗Λ(y₃), dx=0, dy=x² has H*=K[x]/(x²), rather than the polynomial cohomology of K[x₂].
- **linear_differential_rejected**: Λ(u₁,v₂) with du=v is a free Sullivan algebra but is not minimal because du is not decomposable.

**Checks.**

- The model of an even sphere needs a generator whose differential is a square.
- A 1-minimal comparison must expose H² injectivity rather than silently claim surjectivity.

**Sources:** [morgan](#source-morgan), §5, Hirsch extensions, Definitions 5.1–5.3 and Theorem 5.6, pp. 163–166; 1-minimal discussion pp. 168–169 — The source distinguishes full minimal models from degree-one models; [sullivan](#source-sullivan), §2, Theorem 2.2, p. 282; §5, Theorem 5.1 and minimal-model construction, pp. 287–289 — Free extensions give the rational homotopy model, distinct from an A∞ model with m₁=0.

<a id="existence-and-lifting"></a>

### Existence, lifting and uniqueness of minimal models

Proposed declaration: `TauCeti.EllAdicHomotopy.existence_and_lifting`.

Every connected nonnegative commutative DG algebra over a characteristic-zero field has a Sullivan minimal model. A quasi-isomorphism A→B induces a bijection of homotopy classes of maps from any Sullivan algebra into A and B. A quasi-isomorphism between minimal Sullivan algebras is an isomorphism. Consequently two minimal models of A are isomorphic compatibly up to homotopy, and every automorphism of A lifts to an automorphism of a chosen minimal model up to homotopy. The isomorphism and the lifted automorphism are not unique as actual maps.


**Hypotheses.**

- H⁰(A)=K; nonnegative degrees; K has characteristic zero.

**Requires:** [Sullivan algebras and their minimal models](#sullivan-minimal-model); [Polynomial homotopies of commutative DG maps](#sullivan-homotopy); DGAInfinity, layer 1.


**Construction or proof.**

- Adjoin closed generators to make H^r surjective and generators of degree r−1 to kill its kernel, allowing repeated extensions in degree one.
- Use the relative obstruction Hom(V,H^(r+1)(cone(f))) for each Hirsch extension. It vanishes for a quasi-isomorphism.
- Apply lifting in both directions and minimality to obtain an isomorphism. Lift the inverse automorphism as well; minimal rigidity makes the representative invertible.

**Checks.**

- Do not replace the connected hypothesis by simple connectivity.
- Nonunique automorphisms inducing the same cohomology map are allowed.

**Sources:** [morgan](#source-morgan), Theorems 5.6–5.7 and Proposition 5.9, pp. 164–167 — Degreewise Hirsch extensions kill obstructions and prove uniqueness in the homotopy category; [dgms](#source-dgms), §1, Theorems 1.1–1.2, pp. 251–252, and Corollary 1.6, p. 253 — Provides the lifting mechanism; Morgan supplies the general connected full-model statement beyond the simply connected case treated first here.

## EH.1. Relative divided-power simplex forms

Identify Γ_Z(Z) with the concrete divided-power coordinate ring; define the (cochain,t) bigrading and relative forms Γ_R(R^σ)⊗Λ_R(R^σ/R·diag) with dγ_r(x)=γ_(r−1)(x)dx. Construct all finite-set pullbacks. Quotient by dt, never by t−1 over integral coefficients.

<a id="divided-power-coordinate"></a>

### The rank-one divided-power coordinate

Proposed declaration: `TauCeti.EllAdicHomotopy.divided_power_coordinate`.

Identify the existing divided-power algebra Γ_Z(Z) with the subring of Q[t] consisting of finite sums Σ a_n t^n/n! with a_n∈Z. Write γ_n=t^n/n!, put γ_n in t-degree n and define R{t}=R⊗_Z Z{t}. The presentation has γ_0=1 and γ_mγ_n=binom(m+n,m)γ_(m+n); it is free as a Z-module on the γ_n. For a Q-algebra it identifies with R[t], but the basis normalization is retained for integral and finite coefficients.


**Hypotheses.**

- R is a commutative ring; finite sums are used.

**Requires:** `mathlib:DividedPowerAlgebra`; `mathlib:DividedPowerAlgebra.dp`; `mathlib:DividedPowerAlgebra.dp_mul`.


**Construction or proof.**

- Send the universal γ_n(1) to t^n/n! and prove the defining relations by binomial identities.
- Establish the rank-one free basis and injectivity into Q[t], then scalar extend this presentation. Mathlib supplies the quotient construction and product relation, not the unverified basis comparison.

**Uses.**

- Weil II 5.1.6: Provides the t-coordinate of relative forms.
- Weil II 5.2.1.7: The exact t-transition factors explain why rationalization precedes t-stabilization.

**API.**

- `DPCoordinate.rankOneEquiv` (equivalence): Γ_Z(Z) is isomorphic to the displayed concrete subring, taking dp n 1 to γ_n.
- `DPCoordinate.basis` (data): The γ_n form a free Z-basis, transported to a free R-basis after scalar extension.
- `DPCoordinate.mul` (relation): γ_mγ_n=binom(m+n,m)γ_(m+n), agreeing with DividedPowerAlgebra.dp_mul.
- `DPCoordinate.t_mul` (simp): tγ_n=(n+1)γ_(n+1).
- `DPCoordinate.rationalEquiv` (compatibility): For a Q-algebra the map γ_n↦t^n/n! gives R{t}≃R[t].
- `DPCoordinate.hom_ext` (extensionality): Two R-algebra maps from R{t} agreeing on every γ_n are equal; γ_1 alone does not suffice over general R.

**Unit tests.**

- **square_integral**: γ₁²=2γ₂ in Z{t}; the coefficient is 2, not 1.
- **characteristic_two**: In F₂{t}, γ₁²=0 while γ₂ is nonzero, so this is not F₂[t].
- **rational_coordinate**: Under Q{t}≃Q[t], γ₂ maps to t²/2 and γ₀ to 1.

**Checks.**

- Multiplication by t sends γ_n to (n+1)γ_(n+1).
- The integral construction does not invert factorials in R.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.1), p. 234 — Specifies the concrete coordinate algebra and grading; the universal divided-power algebra is supplied by Mathlib.

<a id="t-graded-dg-refinement"></a>

### The t-grading of relative forms

Proposed declaration: `TauCeti.EllAdicHomotopy.t_graded_dg_refinement`.

A t-graded commutative DG R{t}-algebra is a direct sum of modules Ω_n^p for p,n≥0, with differential Ω_n^p→Ω_n^(p+1), product Ω_n^p×Ω_m^q→Ω_(n+m)^(p+q), and γ_r of bidegree (0,r). Its total cochain degree is p. In the simplex-form objects require Ω_n^p=0 for p>n. The t-grading is distinct from the weight grading introduced on characteristic-zero minimal models.


**Hypotheses.**

- R is commutative; exterior degree is p and t-degree is n.

**Requires:** [Strict graded commutativity on the existing DG carrier](#commutative-dg-refinement); [The rank-one divided-power coordinate](#divided-power-coordinate).


**Construction or proof.**

- Use direct sums of the existing modules and graded algebra carrier. Differential raises p and fixes n.
- Define bidegreewise morphisms and limits before forming total direct sums; inverse limits do not create a completed product over t-degrees.

**Uses.**

- Weil II 5.1.4.2: The cohomology comparison is triangular in the two degrees.
- Weil II 5.2.1.4: The l-adic inverse limit is taken separately at each bidegree.

**API.**

- `TGradedDG.component` (projection): Expose the module Ω_n^p and its inclusion in the direct sum.
- `TGradedDG.d_component` (structure): The differential has bidegree (+1,0) and squares to zero.
- `TGradedDG.mul_component` (structure): Multiplication adds both degrees and has the Koszul sign determined only by p,q.
- `TGradedDG.gamma_smul` (compatibility): The R{t} action agrees with the divided-power coordinate presentation.
- `TGradedDG.ext` (extensionality): Maps are equal if they agree on every bidegree inclusion.

**Unit tests.**

- **coordinate_and_differential**: x_i has bidegree (0,1) and dx_i has (1,1), so d cannot raise t-degree.
- **triangular_vanishing**: The simplex-form component Ω_0^1 is zero while Ω_1^1 need not vanish.
- **finite_support**: An element with nonzero components in every t-degree is not in the total direct sum.

**Checks.**

- d preserves n even though it raises p.
- t-degree support of every element is finite in the total direct sum.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.3)–(5.1.4.1), p. 234 — The two gradings have different differentials and degree bounds.

<a id="relative-simplex-forms"></a>

### Relative divided-power forms on a simplex

Proposed declaration: `TauCeti.EllAdicHomotopy.relative_simplex_forms`.

For a finite nonempty set σ put L=R^σ and Q=L/R·(1,…,1). Define Ω(σ,R)=Γ_R(L)⊗_RΛ_R(Q). Its differential is the divided-power derivation dγ_r(x)=γ_(r−1)(x)·bar(x), extended by d(bar(x))=0 and the graded Leibniz rule. Give γ_r(x) t-degree r and bar(x) t-degree 1. Equivalently take divided-power polynomial forms on coordinates x_i and quotient by the differential ideal generated by dt=Σdx_i, where t=Σx_i. Do not quotient by t−1. Scalar extension is applied to simplex coefficients before any simplicial mapping object.


**Hypotheses.**

- σ is finite and nonempty; R is a commutative ring.
- The quotient L/R·diag is free, because one coordinate splits the diagonal inclusion.

**Requires:** [The t-grading of relative forms](#t-graded-dg-refinement); `mathlib:DividedPowerAlgebra`; `mathlib:ExteriorAlgebra`.


**Construction or proof.**

- Use the existing divided-power and exterior algebra universal properties to define the derivation and the tensor product.
- Check the divided-power relations, d²=0 and the quotient by dt. Identify the integral construction followed by tensoring with the intrinsic R-construction.
- A monomial of exterior degree p has at least t-degree p; this proves the triangular support.

**Uses.**

- Weil II 5.1.8: This is the simplicial coefficient algebra.
- Weil II 5.1.9(b): Its intrinsic tensor description separates the contractible coordinate module from the diagonal quotient.

**API.**

- `SimplexForms.tensorDescription` (equivalence): The coordinate quotient by dt is isomorphic to Γ_R(L)⊗Λ_R(L/R·diag).
- `SimplexForms.d_gamma` (simp): For r≥1, dγ_r(x_i)=γ_(r−1)(x_i)dx_i; dγ₀=0.
- `SimplexForms.sum_dx` (relation): Σ_i dx_i=0 and the sum of coordinates is the unchanged divided-power t-coordinate.
- `SimplexForms.baseChange` (compatibility): Ω(σ,Z)⊗R≃Ω(σ,R) as t-graded commutative DG algebras.
- `SimplexForms.odd_square` (structure): The exterior factor uses Mathlib.ExteriorAlgebra, so every degree-one differential squares to zero.
- `SimplexForms.hom_ext` (extensionality): Two relative DG maps agreeing on all γ_r(x_i) and dx_i are equal; agreement on x_i alone is insufficient integrally.

**Unit tests.**

- **one_vertex**: For σ={0}, dx₀=0 but x₀=t and γ₂(x₀) survives.
- **edge_differential**: On σ={0,1}, dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀.
- **no_integral_t_one**: Imposing t=1 over Z would force 2γ₂=1; the actual form algebra imposes no such equation.

**Checks.**

- For one vertex Ω(σ,R)=R{t} in cochain degree zero, not R.
- Exterior differentials have square zero including at the prime 2.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.6.1)–(5.1.6.3), p. 235 — The intrinsic divided-power tensor exterior construction gives the relative forms and their coefficient extension.

<a id="simplex-pullback"></a>

### Pullback of relative forms

Proposed declaration: `TauCeti.EllAdicHomotopy.simplex_pullback`.

For every map of finite nonempty sets φ:τ→σ there is a t-graded commutative DG pullback φ*:Ω(σ,R)→Ω(τ,R), sending x_i to Σ_(φ(j)=i)x_j and dx_i to the corresponding sum of dx_j. These maps preserve t, commute with coefficient change, and satisfy identity and contravariant composition laws. Restriction to ordinal maps gives a simplicial algebra, including all degeneracies.


**Hypotheses.**

- Finite nonempty σ,τ; no injectivity or surjectivity hypothesis on φ.

**Requires:** [Relative divided-power forms on a simplex](#relative-simplex-forms).


**Construction or proof.**

- Pull back the coordinate module by summing over fibres and observe that the diagonal vector maps to the diagonal vector.
- Apply functoriality of Γ and Λ and check d on divided-power generators. Use the divided-power addition identity for a noninjective φ.

**Checks.**

- A face map sets omitted coordinates and their differentials to zero.
- For the collapse {0,1}→{0}, γ₂(x₀) pulls back to γ₂(x₀)+x₀x₁+γ₂(x₁), not just the sum of its two pure terms.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.6.4), p. 236 — The finite-set functor gives faces and degeneracies of the coefficient object.

## EH.2. Simplicial cohomology and rational stabilization

Construct compatible forms on simplicial sets, compute normalized coefficient homotopy and triangular cohomology with binomial cup-product factors, prove the off-diagonal quotient-coefficient theorem, and compare to Sullivan polynomial forms after rational t-stabilization.

**External inputs:** AlgebraicTopology, stage 6.

<a id="simplicial-divided-power-forms"></a>

### Divided-power forms on a simplicial set

Proposed declaration: `TauCeti.EllAdicHomotopy.simplicial_divided_power_forms`.

For a simplicial set X define Ω_n^p(X,R)=Hom_sSet(X,UΩ_n^p(−,R)), where U forgets the module structure of the simplicial coefficient object. The group and R-module structures are pointwise. Put Ω(X,R)=⊕_(p,n)Ω_n^p(X,R), with pointwise product and differential. This is contravariant in X and covariant in R, with 0≤p≤n support. A family must respect faces and degeneracies. Tensor coefficients into each simplex-form module first: Ω(X,Z)⊗R is not used as the definition of Ω(X,R).


**Hypotheses.**

- X is any simplicial set; R is a commutative ring.

**Requires:** [Pullback of relative forms](#simplex-pullback); [The t-grading of relative forms](#t-graded-dg-refinement); `mathlib:SSet`.


**Construction or proof.**

- Form the simplicial coefficient modules from simplex pullback, then the sets of simplicial maps into their underlying sets.
- Pointwise operations give modules and the product. Sum over bidegrees to retain finite t-support rather than silently taking a product.

**Uses.**

- Weil II 5.1.4.2: Global forms must compute the cohomology ring with its t-degree cutoff.
- Weil II 5.2.1.2: The same finite-coefficient functor is applied before the colimit over a pro-system.

**API.**

- `DividedPowerForms.eval` (projection): Evaluate a form on each simplex; the evaluations satisfy all face and degeneracy relations.
- `DividedPowerForms.ext` (extensionality): Two forms are equal when all simplex evaluations in each bidegree agree.
- `DividedPowerForms.pullback` (functoriality): Simplicial maps induce contravariant DG maps, with identity and composition laws.
- `DividedPowerForms.coefficients` (functoriality): Ring maps induce coefficient maps and commute with pullback and differential.
- `DividedPowerForms.representable` (compatibility): Ω(Δ^r,R)≃Ω([r],R), with the same relative t-coordinate.

**Unit tests.**

- **point_forms**: For X=Δ⁰ obtain R{t} in degree zero, so this model is not yet the unstabilized ordinary de Rham complex of a point.
- **empty_forms**: For the empty simplicial set every mapping module is zero and the resulting algebra is the zero algebra.
- **degenerate_simplex**: The value on a degenerate edge is the degeneracy pullback of its vertex value; independent edge data violate the definition.

**Checks.**

- Restriction to a representable simplex recovers its coefficient algebra by Yoneda.
- For a simplicial complex the result is the compatible-family construction; the geometric cone is motivation and requires no extra carrier.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.7)–(5.1.8), p. 236 — Compatible families supply the mapping definition and its two variance directions.

<a id="coefficient-homotopy-calculation"></a>

### Homotopy of the simplicial coefficient modules

Proposed declaration: `TauCeti.EllAdicHomotopy.coefficient_homotopy_calculation`.

For p,n,i≥0, the homology in degree i of the normalized chain complex of the simplicial R-module Ω_n^p(−,R) is R if i=p=n and is zero otherwise. The identification in the exceptional degree is natural in R. Here homology refers to the simplicial direction, not the cochain differential d of forms. This calculation is the coefficient resolution input to the integral cohomology comparison.


**Hypotheses.**

- R is a commutative ring.

**Requires:** [Relative divided-power forms on a simplex](#relative-simplex-forms); [Pullback of relative forms](#simplex-pullback); `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`.


**Construction or proof.**

- Normalize σ↦R^σ; its chain complex is R→R with identity differential in degrees 1 and 0, hence contractible.
- Use an explicit simplicial contraction on its divided-power algebra. An arbitrary nonlinear functor preserving chain homotopy is not a sufficient substitute.
- The diagonal quotient is K(R,1); establish the exterior-power décalage calculation for this free rank-one object and combine the t-degrees. Gap G1 records the unread décalage and extension proof.

**Checks.**

- For p=n=0 the simplicial coefficient module is constant R with H₀=R.
- For (p,n)=(0,1) normalization is acyclic; for (1,1) it has H₁=R.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.9)(b), pp. 236–237 — The source reduces the coefficient homotopy to the diagonal quotient and a décalage calculation, without giving its full proof.

<a id="integral-cohomology-comparison"></a>

### The triangular integral cohomology comparison

Proposed declaration: `TauCeti.EllAdicHomotopy.integral_cohomology_comparison`.

For every simplicial set X and commutative ring R there is a natural multiplicative isomorphism H^p(Ω_n(X,R))≃H^p(X,R)·γ_n for n≥p, and H^p(Ω_n(X,R))=0 for n<p. Together these identify H*Ω with the triangular subalgebra ⊕_(0≤p≤n)H^p(X,R)γ_n of H*(X,R)⊗R{t}. Under it the product of classes aγ_n and bγ_m is binom(n+m,n)(a∪b)γ_(n+m). The target is ordinary simplicial cohomology with its cup product, not homotopy groups or the full untapered tensor algebra.


**Hypotheses.**

- X is arbitrary; no finite-dimensionality assumption.

**Requires:** [Divided-power forms on a simplicial set](#simplicial-divided-power-forms); [Homotopy of the simplicial coefficient modules](#coefficient-homotopy-calculation); AlgebraicTopology, stage 6; [The rank-one divided-power coordinate](#divided-power-coordinate).


**Construction or proof.**

- Use the normalized simplicial coefficient calculation to construct the natural cohomology comparison and prove its additive isomorphism.
- Establish the extension/acyclicity argument for compatible forms on successive skeleta, including passage to an infinite simplicial set; G1 identifies the missing proof reference.
- Check cup-product compatibility on universal simplicial cocycles, tracking the divided-power binomial coefficient. Import ordinary cohomology from AlgebraicTopology stage 6.

**Checks.**

- For the simplicial circle H¹Ω_n≃R for n≥1 and H¹Ω₀=0.
- For a two-torus, multiplying two independent degree-one classes in t-degree 1 gives 2(a∪b)γ₂; reduction mod 2 makes this product zero although H²(X,F₂) is nonzero.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.4.2)–(5.1.5), p. 235; (5.1.9), pp. 236–237 — States the coefficient-natural ring comparison and points to Miller for the cohomology proof.

<a id="quotient-coefficient-change"></a>

### Quotient coefficients and the exceptional diagonal

Proposed declaration: `TauCeti.EllAdicHomotopy.quotient_coefficient_change`.

For a principal ideal quotient B=R/(a) of a commutative ring, the natural map Ω_n^p(X,R)⊗_R B→Ω_n^p(X,B) is an isomorphism for n≠p. In the exceptional diagonal the complex has a right-exact sequence Ω_p^(p−1)(X,R)→Ω_p^p(X,R)→H^p(X,R)→0, natural in coefficients. In particular the coefficient transition maps at fixed (p,n), n≠p, are surjective. Do not assert the global base-change isomorphism on n=p or for arbitrary quotient ideals on infinite X: E10 gives a counterexample to the unrestricted printed assertion.


**Hypotheses.**

- X is a simplicial set; p,n≥0; B=R/(a), including Z→Z/l^r and Z/l^(r+1)→Z/l^r.

**Requires:** [Divided-power forms on a simplicial set](#simplicial-divided-power-forms); [The triangular integral cohomology comparison](#integral-cohomology-comparison).


**Construction or proof.**

- Prove the principal-quotient assertion from the extendable coefficient resolution; G1 includes this proof. Keep coefficient products explicit: tensoring by an arbitrary quotient need not commute with them.
- On the diagonal d out of Ω_p^p vanishes by the degree bound, so the comparison identifies the stated cokernel.
- Apply right exactness of tensoring only where its hypotheses supply the required quotient, avoiding a tensor/Hom interchange.

**Checks.**

- Test reduction Z/l^(r+1)→Z/l^r off the diagonal.
- At X=Δ⁰ the diagonal Ω₀⁰ is R; this special base-change isomorphism does not justify a general diagonal assertion.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.5), last paragraph, p. 235; (5.2.1)(b), p. 237 — The off-diagonal assertion supplies the principal-quotient input to completion; E10 corrects its unrestricted ring generality.

<a id="polynomial-sullivan-forms"></a>

### Sullivan polynomial forms

Proposed declaration: `TauCeti.EllAdicHomotopy.polynomial_sullivan_forms`.

For a characteristic-zero field K define A_PL(Δ^r;K) as K[x₀,…,x_r,dx₀,…,dx_r]/(Σx_i−1,Σdx_i), with polynomial degree-zero coordinates, exterior degree-one differentials and d(x_i)=dx_i. Put A_PL(X;K)=Hom_sSet(X,A_PL(Δ^•;K)), interpreted degree by degree. It is a commutative DG algebra. The polynomial degree filtration counts both x_i and dx_i; on a general infinite X this means a uniform bound on every simplex when the bound is imposed.


**Hypotheses.**

- K has characteristic zero; X is a simplicial set.

**Requires:** [Strict graded commutativity on the existing DG carrier](#commutative-dg-refinement); [Pullback of relative forms](#simplex-pullback); AlgebraicTopology, stage 6.


**Construction or proof.**

- Construct the affine-simplex algebra with t specialized to 1 only over K, and all ordinal pullbacks.
- Take compatible families; use the polynomial Poincaré lemma and extension over simplex boundaries to obtain the cohomology comparison. This is not the analytic de Rham complex on a manifold.

**Uses.**

- Weil II 5.2.5: Identifies the l-adic model of a complex variety with its rational topological model.
- EH.0 minimal models: Provides the characteristic-zero commutative DG algebra to which the Sullivan existence theorem applies.

**API.**

- `PolynomialForms.barycentric_relation` (relation): Σx_i=1 and Σdx_i=0 in every simplex algebra.
- `PolynomialForms.pullback` (functoriality): The construction is a contravariant commutative DG functor on simplicial sets.
- `PolynomialForms.eval_ext` (extensionality): Agreement on every simplex implies equality of forms.
- `PolynomialForms.deRham` (compatibility): H*(A_PL(X;K)) is ordinary H*(X;K), compatibly with the cup product.
- `PolynomialForms.degreeFiltration` (data): Total barycentric polynomial degree gives bounded subcomplexes; d preserves the bound.

**Unit tests.**

- **point_polynomial_forms**: A_PL(Δ⁰;K)=K, while Ω(Δ⁰,K)=K[t].
- **edge_primitive**: On Δ¹, d(x₁)=dx₁ and ∫₀¹dx₁=1; a positive-degree cohomology class on this simplex must vanish.
- **polynomial_bound**: The form x₁^N dx₁ has total barycentric degree N+1, so it cannot be assigned degree N merely by ignoring dx₁.

**Checks.**

- On a point A_PL=K in degree zero.
- Uniform polynomial bounds cannot be inferred from a finite cohomology hypothesis on an infinite simplicial model.

**Sources:** [sullivan](#source-sullivan), §7, Theorem 7.1 and polynomial/semisimplicial examples, pp. 296–299 — Polynomial compatible forms and their rational de Rham theorem; [dgms](#source-dgms), §2, pp. 254–255 — The rational polynomial-form algebra provides the topological model used by minimal algebras; [weil-II](#source-weil-II), §5 (5.1.5) and (5.1.9)(a), pp. 235–236 — Barycentric polynomial degree describes the comparison with relative forms.

<a id="rational-stabilized-comparison"></a>

### Rational comparison after t-stabilization

Proposed declaration: `TauCeti.EllAdicHomotopy.rational_stabilized_comparison`.

There is a natural t-graded DG injection Ω(X,K)→A_PL(X;K)⊗K[t], sending x_i to t·x_i and dx_i to t·dx_i. Its t-degree n image is t^n times the forms whose total barycentric polynomial degree is at most n. Multiplication by t induces a natural quasi-isomorphism colim_n Ω_n(X,K)→A_PL(X;K). The first map is not generally an isomorphism of the whole graded algebras. The stabilized map need not be surjective as an actual map of form sets for an infinite X with unbounded simplexwise polynomial degrees.


**Hypotheses.**

- K is a characteristic-zero field; the transition Ω_n→Ω_(n+1) is multiplication by t.

**Requires:** [Sullivan polynomial forms](#polynomial-sullivan-forms); [The triangular integral cohomology comparison](#integral-cohomology-comparison); [The rank-one divided-power coordinate](#divided-power-coordinate).


**Construction or proof.**

- Use the rational divided-power identification and homogenize barycentric forms by t.
- On cohomology tγ_n=(n+1)γ_(n+1); all transition scalars are invertible in K. Normalize γ_n by n! to identify the eventual cohomology with H*(X,K).
- Use exactness of filtered module colimits and the polynomial de Rham theorem; no claim of a uniform degree bound on arbitrary compatible forms is required.

**Checks.**

- For a point the degree-n comparison is an isomorphism K·γ_n→K·t^n sending γ_n to t^n/n!; non-surjectivity before stabilization is detected on an edge, not on a point.
- On an edge, t⁰x₁ in A_PL⊗K[t] is absent from the t-degree-zero image; this detects the source’s misleading isomorphism wording.

**Sources:** [weil-II](#source-weil-II), §5 (5.1.5), p. 235; (5.1.9)(a), p. 236; (5.2.5), p. 239 — The comparison is a bounded-degree embedding before stabilization and a cohomology equivalence afterwards.

## EH.3. Pro-simplicial completion and the homotopy algebra

Define finite-coefficient forms by a filtered colimit over a pro-simplicial system. Under degreewise mod-l finiteness prove universal coefficients and finite generation, complete bidegreewise with verified ML exactness, rationalize, then stabilize in t to obtain A_l and its cohomology ring.

**External inputs:** AlgebraicTopology, stage 6.

<a id="pro-simplicial-forms"></a>

### Finite-coefficient forms of a pro-simplicial set

Proposed declaration: `TauCeti.EllAdicHomotopy.pro_simplicial_forms`.

Let X=(X_α) be a small cofiltered system of simplicial sets and l a prime. For r≥1 put H^i(X,Z/l^r)=colim_α H^i(X_α,Z/l^r) and Ω_n^p(X,Z/l^r)=colim_α Ω_n^p(X_α,Z/l^r), using the filtered direction induced by pullback. The integral triangular cohomology comparison persists through this filtered colimit. Morphisms of pro-objects induce contravariant maps independent of cofinal reindexing.


**Hypotheses.**

- A small cofiltered index category and a prime l; r≥1.

**Requires:** [Divided-power forms on a simplicial set](#simplicial-divided-power-forms); [The triangular integral cohomology comparison](#integral-cohomology-comparison); AlgebraicTopology, stage 6.


**Construction or proof.**

- Take the filtered colimit separately in every bidegree and coefficient exponent, with its induced product.
- Use exactness of filtered module colimits for the cohomology comparison and the universal property for cofinal reindexing.

**Uses.**

- Weil II 5.2.1.4: These modules, rather than forms completed stage by stage, are completed l-adically.
- Weil II 5.2.2: Étale covering systems provide the pro-simplicial input.

**API.**

- `ProForms.stageMap` (constructor): Each stage has a natural map to the filtered colimit, compatible with transition maps.
- `ProForms.cofinalEquiv` (equivalence): Cofinal reindexing induces isomorphisms in every bidegree and on finite-coefficient cohomology.
- `ProForms.pullback` (functoriality): Pro-morphisms induce maps opposite to the direction of spaces.
- `ProForms.coefficientReduction` (compatibility): Reduction r+1→r commutes with the α-colimit and the product.
- `ProForms.cohomology` (compatibility): The triangular comparison is the colimit of the ordinary comparisons, with the same binomial factors.
- `ProForms.desc` (universal-property): Compatible DG maps from the finite-coefficient stages determine a unique map from their filtered colimit, bidegree by bidegree.

**Unit tests.**

- **constant_system**: For X_α=X with identity transitions, both finite-coefficient constructions equal their ordinary versions.
- **cofinal_subsequence**: Replacing a tower by its even-indexed cofinal subtower preserves the output.
- **order_of_limits**: The definition is colim_α at each fixed r; an expression colim_α lim_r is rejected rather than assumed isomorphic.

**Checks.**

- A constant pro-object recovers ordinary finite-coefficient forms.
- Completion is not performed at each α before this colimit.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.1.1)–(5.2.1.2), p. 237 — Finite coefficients are formed by a colimit before the l-adic inverse limit.

<a id="finite-mod-ell-cohomology"></a>

### The mod-l finiteness condition

Proposed declaration: `TauCeti.EllAdicHomotopy.finite_mod_ell_cohomology`.

The condition (F) on a pro-simplicial set at the prime l says that H^i(X,Z/l) is finite for every i≥0. It is degreewise finiteness and does not require a uniform bound on the number of nonzero degrees. Define H^i(X,Z_l)=lim_r H^i(X,Z/l^r) as a Z_l-module, and H^i(X,Q_l)=H^i(X,Z_l)⊗_(Z_l)Q_l. These names alone do not assert finite generation or an interchange of inverse limit and cohomology.


**Hypotheses.**

- X is a small pro-simplicial set and l is prime.

**Requires:** [Finite-coefficient forms of a pro-simplicial set](#pro-simplicial-forms).


**Construction or proof.**

- Use finite cardinality of each ordinary finite-coefficient cohomology module.
- Build the inverse-limit module and its scalar extension; derive their finiteness in the next theorem rather than adding it as a field.

**Uses.**

- Weil II 5.2.1(a)–(b): Finite cohomology makes the inverse systems Mittag-Leffler.
- EH.4 étale realization: Finite-type étale finiteness verifies this exact condition.

**API.**

- `FiniteModEllCohomology.degree` (projection): For each i the finite group H^i(X,F_l) is available.
- `EllAdicCohomology.reduce` (projection): The inverse limit has compatible reduction maps to every exponent.
- `EllAdicCohomology.scalarExtension` (data): Rational cohomology is its tensor product with Q_l.
- `FiniteModEllCohomology.cofinal` (compatibility): The condition is invariant under cofinal changes of the pro-system.
- `FiniteModEllCohomology.pullbackIso` (characterisation): A mod-l cohomology equivalence transports (F), degree by degree.

**Unit tests.**

- **point_finiteness**: A point has H⁰=F_l and all positive groups zero, so satisfies (F).
- **unbounded_degrees**: The simplicial set of CP^∞ has one F_l cohomology generator in each even degree and satisfies (F), although infinitely many degrees are nonzero.
- **infinite_wedge**: A countably infinite wedge of circles has infinite H¹(−,F_l) and fails (F).

**Checks.**

- Finite CW complexes satisfy the condition.
- Infinite-dimensional H¹ over F_l fails it even if a chosen set of other groups vanishes.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.1), condition (F), (5.2.1.3) and (5.2.1.6), pp. 237–238 — Degreewise mod-l finiteness controls the inverse system and rational coefficients.

<a id="ell-adic-universal-coefficients"></a>

### Finite generation and l-adic universal coefficients

Proposed declaration: `TauCeti.EllAdicHomotopy.ell_adic_universal_coefficients`.

Under (F), each H^i(X,Z/l^r) is finite, H^i(X,Z_l) is a finitely generated Z_l-module, and for every r≥1 there is a natural short exact sequence 0→H^i(X,Z_l)⊗Z/l^r→H^i(X,Z/l^r)→Tor₁^(Z_l)(H^(i+1)(X,Z_l),Z/l^r)→0. In particular H^i(X,Q_l) is finite-dimensional. Torsion in H^(i+1) cannot be dropped from the formula.


**Hypotheses.**

- (F) holds in every degree; l is prime; X is a pro-simplicial set.

**Requires:** [The mod-l finiteness condition](#finite-mod-ell-cohomology); [Finite-coefficient forms of a pro-simplicial set](#pro-simplicial-forms); AlgebraicTopology, stage 6.


**Construction or proof.**

- Use the coefficient exact sequences and (F) inductively to prove finiteness for all exponents.
- Prove bounded generation and completeness of the inverse limit by lifting a finite mod-l generating set; control possible torsion through the Bockstein sequences.
- Derive the natural Tor exact sequence with degree i+1, not i. Gap G2 records the detailed SGA5/completion argument not yet source-verified.

**Checks.**

- A finite torsion H^(i+1) contributes a nonzero Tor term even if H^i(X,Z_l)=0.
- The mod-l bound is degreewise; no bounded total cochain complex is assumed.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.1), paragraph following (F), p. 237 — Cites SGA5 V 5.3.1 for the finite-generation and universal-coefficient argument.

<a id="bigraded-ell-adic-completion"></a>

### Bidegreewise completion and its cohomology

Proposed declaration: `TauCeti.EllAdicHomotopy.bigraded_ell_adic_completion`.

For a pro-simplicial set satisfying (F), define Ω_n^p(X,Z_l)=lim_r Ω_n^p(X,Z/l^r), and then take the direct sum over (p,n) to get a t-graded commutative DG Z_l{t}-algebra. Its cohomology in t-degree n is H^p(X,Z_l)γ_n for p≤n and zero for p>n. The inverse-limit statement includes proof of exactness on the cycles and boundaries systems; finite cohomology alone is not permission to commute arbitrary limits.


**Hypotheses.**

- The mod-l finiteness condition (F) holds; inverse limits are taken before total direct sums.

**Requires:** [Finite-coefficient forms of a pro-simplicial set](#pro-simplicial-forms); [Quotient coefficients and the exceptional diagonal](#quotient-coefficient-change); [Finite generation and l-adic universal coefficients](#ell-adic-universal-coefficients); `mathlib:CategoryTheory.Functor.IsMittagLeffler`.


**Construction or proof.**

- Off the diagonal the quotient-coefficient theorem makes the module transitions surjective.
- On n=p use the natural right-exact sequence from Ω_p^(p−1) to Ω_p^p to finite H^p; the boundary images are ML and the finite quotient is ML. Verify the module, cycle and boundary systems needed for the inverse-limit exactness theorem.
- Apply the countable ML exactness criterion to identify completed cohomology. G2 includes this criterion and its application, beyond the pinned ML predicate.

**Uses.**

- Weil II 5.2.1.7: Rationalization and t-stabilization are applied to this algebra.
- Weil II 5.2.5: Comparison zigzags pass through this completion only after the ML argument.

**API.**

- `CompletedForms.reduce` (projection): Each bidegree has compatible maps to its finite-coefficient levels.
- `CompletedForms.mul` (structure): Multiplication is the inverse limit of finite-level products and adds bidegrees.
- `CompletedForms.d` (structure): The completed differential raises cochain degree, fixes t-degree and squares to zero.
- `CompletedForms.cohomology` (compatibility): The comparison is the inverse limit of finite-coefficient comparisons, with explicit ML hypotheses discharged.
- `CompletedForms.pullback` (functoriality): Maps of pro-simplicial objects induce completed DG maps.
- `CompletedForms.lift` (universal-property): A compatible family of bidegree-preserving DG maps into all finite-coefficient levels determines a unique map into the bidegreewise completion; equality is checked after every reduction.

**Unit tests.**

- **point_completion**: For a point the t-degree n completed piece is Z_lγ_n and has no positive cohomology.
- **diagonal_test**: For a circle, the (p,n)=(1,1) cokernel is H¹(S¹,Z/l^r), so the ML proof must include that finite quotient.
- **support_after_completion**: The sequence Σ_(n≥0)γ_n is not an element of the total completed algebra; only each bidegree has been completed.

**Checks.**

- Completion does not introduce an infinite sum over t-degrees.
- The diagonal argument must use finite cohomology; off-diagonal surjectivity is not a proof on the diagonal.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.1.4)–(5.2.1.5), p. 237 — Uses off-diagonal surjectivity and the diagonal cohomology cokernel to justify completion.

<a id="ell-adic-homotopy-algebra"></a>

### The Q_l homotopy algebra of a pro-simplicial set

Proposed declaration: `TauCeti.EllAdicHomotopy.ell_adic_homotopy_algebra`.

For X satisfying (F), put A_l(X)=colim_n (Ω_n(X,Z_l)⊗_(Z_l)Q_l), where the map n→n+1 is multiplication by t. Products of components define a nonnegative commutative DG Q_l-algebra and there is a natural ring isomorphism H*(A_l(X))≃H*(X,Q_l). The order is finite-coefficient α-colimit, bidegree r-inverse-limit, Q_l scalar extension, then t-colimit. At cohomology level send aγ_n to a/n!; this normalizes the transition and product factors.


**Hypotheses.**

- (F); l prime; small filtered and cofiltered systems as above.

**Requires:** [Bidegreewise completion and its cohomology](#bigraded-ell-adic-completion); [Rational comparison after t-stabilization](#rational-stabilized-comparison); [The rank-one divided-power coordinate](#divided-power-coordinate).


**Construction or proof.**

- Rational scalar extension is flat, and filtered module colimits are exact. Apply these facts to the completed comparison.
- Check that t multiplication is compatible with the product at the directed-system level.
- Normalize γ_n by n! to remove (n+1) transition factors and binomial product factors.

**Uses.**

- Weil II 5.2.2: The algebra A_l(X) of a variety is obtained from its étale pro-simplicial system.
- Weil II 5.3.1: Connectedness and finite cohomology allow Sullivan minimal models.

**API.**

- `EllAdicHomotopyAlgebra.stageMap` (constructor): Each rationalized t-degree has a map to A_l compatible with t multiplication.
- `EllAdicHomotopyAlgebra.pullback` (functoriality): Pro-simplicial maps induce contravariant commutative DG maps.
- `EllAdicHomotopyAlgebra.cohomologyEquiv` (equivalence): H*(A_l)≃H*(X,Q_l) as graded rings, with γ_n normalized by 1/n!.
- `EllAdicHomotopyAlgebra.cofinalEquiv` (compatibility): Cofinal reindexing of the original pro-system does not change the algebra up to its canonical comparison.
- `EllAdicHomotopyAlgebra.quasiIso_of_cohomology` (characterisation): A finite-coefficient cohomology equivalence between systems satisfying (F) gives a quasi-isomorphism of A_l.
- `EllAdicHomotopyAlgebra.desc` (universal-property): Chain maps from the rationalized t-degree complexes, compatible with multiplication by t and with products under addition of t-degrees, and sending the t-degree-zero unit to the unit, determine a unique DG map from A_l.

**Unit tests.**

- **stabilized_point**: The class of γ₂ at t-degree 2 represents 1/2 in Q_l under the normalized point comparison.
- **transition_at_prime**: At n=l−1, tγ_(l−1)=lγ_l; the stabilization proof explicitly uses the inverse of l in Q_l.
- **multiplicative_normalization**: (aγ_n)(bγ_m) maps to (a∪b)/(n!m!), matching the product of the separately normalized classes.

**Checks.**

- For a point A_l=Q_l.
- At n=l−1 the integral t-transition is multiplication by l, so it is not a unit before rationalization.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.1.6)–(5.2.1.8), p. 238 — Defines the algebra by rationalization and stabilization and identifies its cohomology.

## EH.4. Étale realization and complex comparison

Attach A_l to a separated finite-type variety over an algebraically closed field using countable étale systems and prove choice comparisons in the quasi-isomorphism localization. Construct the Galois action with finite-level continuity, analytic good-cover refinements, and the complex comparison of minimal models.

**External inputs:** SchemeAndStackFoundations, SF.2; AlgebraicTopology, stage 5; AlgebraicTopology, stage 6.

<a id="variety-realization"></a>

### Étale realization of the homotopy algebra

Proposed declaration: `TauCeti.EllAdicHomotopy.variety_realization`.

For a separated finite-type k-scheme X over an algebraically closed field, with l invertible in k, choose a countable algebraically closed field of definition k₁⊂k and a model X₁. Choose a cofinal étale hypercovering system of X₁, apply connected components degreewise, and obtain a pro-simplicial set Et(X₁). Set A_l(X)=A_l(Et(X₁)). Étale hypercover descent, algebraically closed base extension and finite-coefficient finiteness give (F) and H* A_l(X)≃H*_(ét)(X,Q_l) as rings. Different choices are linked by quasi-isomorphisms through common refinements; the result is a contravariant functor in the category obtained by inverting quasi-isomorphisms, not a literal choice-free algebra.


**Hypotheses.**

- X is separated and of finite type over algebraically closed k; l≠char(k).
- Apply connected minimal models separately to connected components.

**Requires:** [The Q_l homotopy algebra of a pro-simplicial set](#ell-adic-homotopy-algebra); SchemeAndStackFoundations, SF.2.


**Construction or proof.**

- Spread the finitely many defining equations to a countable subfield and take its algebraic closure inside k.
- Use the SF.2 étale hypercover, finiteness and algebraically closed extension inputs to identify the pro-simplicial cohomology. The existing proper-hypercover node is not sufficient for this étale assertion.
- For two fields or hypercover systems pass to a common countable overfield and common refinements. Use cohomology equivalences to obtain quasi-isomorphisms and functoriality in the localization.

**Uses.**

- Weil II 5.2.3: A field of definition gives the Galois action.
- Weil II 5.3.6–5.3.8: All weight and formality statements use this étale cohomology identification.

**API.**

- `VarietyHomotopyAlgebra.cohomologyEquiv` (equivalence): Cohomology is ordinary étale Q_l cohomology with its cup product.
- `VarietyHomotopyAlgebra.refinement` (functoriality): Refinements induce quasi-isomorphisms compatible with the étale cohomology identification.
- `VarietyHomotopyAlgebra.fieldOfDefinition` (compatibility): A common field-of-definition enlargement gives the same localized algebra.
- `VarietyHomotopyAlgebra.map` (functoriality): A morphism of varieties gives a contravariant localized DG morphism, respecting identities and composition.
- `VarietyHomotopyAlgebra.connected` (characterisation): For connected X, H⁰(A_l(X))=Q_l, so the Sullivan existence theorem applies.

**Unit tests.**

- **geometric_point**: For X=Spec(k), H⁰=Q_l and H^i=0 for i>0.
- **two_points**: For a disjoint union of two geometric points, H⁰=Q_l×Q_l; a single connected minimal model must not be asserted.
- **countable_field**: For an uncountable algebraically closed k, the countability used in the indexing belongs to k₁, not k; replacing k₁ by an arbitrary k invalidates that argument.

**Checks.**

- For Spec(k), the algebra is quasi-isomorphic to Q_l.
- The characteristic-prime case l=char(k) is outside the statement and cannot use the prime-to-characteristic comparison.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.2), p. 238, including the final hypercover remark — The countable construction and hypercover alternative produce the étale algebra and choice comparisons.

<a id="galois-action"></a>

### Galois action and its finite-level continuity

Proposed declaration: `TauCeti.EllAdicHomotopy.galois_action`.

If X descends to a variety X₀ over a countable field k₀ and k₁ is its algebraic closure in k, a Galois-stable covering system gives an action of Gal(k₁/k₀) on the constructed A_l(X), inducing the usual Galois action on H*_(ét)(X,Q_l). At every fixed r the action on Ω(Et(X₁),Z/l^r), with the discrete topology, is continuous: each form has open stabilizer. No topology on the full minimal model, continuity in a proalgebraic automorphism group, or continuous lifting to an actual minimal-model action is concluded.


**Hypotheses.**

- k₀ is countable; X₀ is separated finite type; l invertible in k₀.

**Requires:** [Étale realization of the homotopy algebra](#variety-realization); SchemeAndStackFoundations, SF.2; [Existence, lifting and uniqueness of minimal models](#existence-and-lifting).


**Construction or proof.**

- Choose a system stable under Galois, retaining descent data at each finite stage.
- Prove finite-level open stabilizers using a finite-skeleton bound for each fixed (p,n) coefficient module, then a finite field extension defining the finitely many covering components and form data. A form is not presumed to have finite data merely because it belongs to a mapping object; this finite-width point is part of G1. Transport the action through the coefficient and t limits as algebraic maps.
- Lift individual automorphisms to a minimal model using EH.0; the lift is only a homotopy class and does not supply a group action by chosen actual lifts.

**Checks.**

- On a geometric point the cohomology action is trivial.
- Finite-level continuity is not silently upgraded through the inverse limit or through arbitrary choices of minimal representatives.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.3), pp. 238–239 — Galois acts through the construction, while continuity is asserted only on finite-coefficient forms.

<a id="analytic-cover-comparison"></a>

### Good-cover refinement of complex étale systems

Proposed declaration: `TauCeti.EllAdicHomotopy.analytic_cover_comparison`.

For a separated finite-type complex variety X and a countable étale covering system of a countable field-of-definition model, construct a cofinal compatible system of analytic open covers of X(C), refining the analytifications of the étale maps, such that every nonempty finite intersection is contractible. The nerves N_α have the homotopy type of X(C) and define a morphism of pro-simplicial systems N→Et(X₁). The resulting map on cohomology with Z/l^r coefficients is the étale–analytic comparison. Finite CW type is used for finite-generation comparisons; one must not assume an arbitrary noncompact analytic good cover is finite.


**Hypotheses.**

- Complex algebraic X, separated finite type; l prime, r≥1.

**Requires:** [Étale realization of the homotopy algebra](#variety-realization); AlgebraicTopology, stage 5; AlgebraicTopology, stage 6; SchemeAndStackFoundations, SF.2.


**Construction or proof.**

- Use triangulability/local contractibility and a compatible good-cover refinement to lift analytic opens through étale local homeomorphisms. Gap G3 names the good-cover and finite-CW inputs not supplied by the current RealAlgebraicGeometry roadmap.
- Use the nerve theorem and the SF.2 étale–analytic comparison to identify cohomology.
- Keep refinement choices in the pro-system so maps between different choices are compared by common refinements.

**Checks.**

- A noncompact open curve is permitted; compactness is not a hidden hypothesis.
- An arbitrary cover with a noncontractible intersection is insufficient to invoke the nerve theorem.

**Sources:** [weil-II](#source-weil-II), §5 (5.2.4), p. 239 — Constructs nerves with contractible intersections and a comparison of systems, invoking SGA4 XVI 4.1.

<a id="complex-minimal-model-comparison"></a>

### Complex comparison of minimal models

Proposed declaration: `TauCeti.EllAdicHomotopy.complex_minimal_model_comparison`.

Let X be a connected separated finite-type complex variety and M_Q→A_PL(X(C);Q) a Sullivan minimal model, using a simplicial model of X(C). There is a zigzag of quasi-isomorphisms of commutative DG Q_l-algebras from A_l(X) to A_PL(X(C);Q)⊗Q_l, inducing the usual cohomology comparison. Consequently M_Q⊗Q_l is a minimal model of A_l(X), and any chosen minimal model of A_l(X) is isomorphic to it, compatibly with a natural homotopy class of comparisons. The resulting actual algebra isomorphism need not be canonical.


**Hypotheses.**

- X is connected; l prime; étale–analytic comparison and finite CW type are available.

**Requires:** [Good-cover refinement of complex étale systems](#analytic-cover-comparison); [The Q_l homotopy algebra of a pro-simplicial set](#ell-adic-homotopy-algebra); [Rational comparison after t-stabilization](#rational-stabilized-comparison); [Existence, lifting and uniqueness of minimal models](#existence-and-lifting); SchemeAndStackFoundations, SF.2; AlgebraicTopology, stage 6.


**Construction or proof.**

- Use Ω(Et(X₁),Z/l^r)→Ω(N,Z/l^r) and a chosen nerve stage to obtain bidegree quasi-isomorphisms.
- Apply the proved ML comparison to pass to Z_l, then rationalize and stabilize in t. Justify the integral-to-Z_l cohomology comparison by finite CW type, not by an unrestricted tensor/Hom identity.
- Compare the rational stabilized nerve algebra to A_PL and pass to minimal models by EH.0.

**Checks.**

- For X=G_m,C the model is Λ(a₁)⊗Q_l, with one H¹ class.
- For a complex elliptic curve the model is Λ(a₁,b₁)⊗Q_l; its two H¹ generators multiply to the H² generator.

**Sources:** [weil-II](#source-weil-II), §5 Construction (5.2.5), p. 239 — The finite-coefficient comparison passes through completion and rational stabilization before taking minimal models.

## EH.5. Geometric cohomology and Frobenius weights

Isolate the geometric cohomology weight realization needed by the homotopy proof, including normal H¹ weights and smooth/proper bounds. Compare the Hodge weight filtration over C with generalized Frobenius weight spaces of good spreads. Import abstract MHS and existing log forms; request the missing geometric Hodge realization in its own direction.

**External inputs:** ComplexComparisonPartII, C5/log-de-rham-complex; DeligneWeightsAndPurity, DWP.0; DeligneWeightsAndPurity, DWP.7; SchemeAndStackFoundations, SF.2; SchemeAndStackFoundations, SF.4.

<a id="geometric-cohomology-weight-bridge"></a>

### Geometric cohomology weight filtrations

Proposed declaration: `TauCeti.EllAdicHomotopy.geometric_cohomology_weight_bridge`.

For a separated finite-type complex variety X, take the geometric mixed Hodge structure on H^i(X(C),Q) and its increasing weight filtration W. For a separated finite-type variety over an algebraically closed field of characteristic different from l, take the cohomological weight filtration furnished by a suitable spread and its mixed cohomology realization. The comparison needed here has finite exhaustive W, is functorial, and makes cup product and Künneth maps filtered. In degree i the weights lie in [0,2i]; if X is smooth they lie in [i,2i], if X is proper in [0,i], and if X is normal H¹ has weights in [1,2]. In the complex case the normal-crossing hyperresolution weight construction gives exactly the W of the geometric mixed Hodge structure, not an arbitrary filtration on its underlying vector space.


**Hypotheses.**

- X separated finite type; l invertible for the étale realization.
- Geometric mixed Hodge realization and spread-independent weight comparison are the inputs isolated in G4; the pinned abstract MixedHodgeStructure carrier alone does not construct them.

**Requires:** `tauceti:TauCeti.Hodge.MixedHodgeStructure`; SchemeAndStackFoundations, SF.4; SchemeAndStackFoundations, SF.2; DeligneWeightsAndPurity, DWP.7; ComplexComparisonPartII, C5/log-de-rham-complex.


**Construction or proof.**

- Use SF.4 resolution and compactification to obtain a proper hyperresolution with smooth proper compactifications and SNC boundaries; import the log de Rham sheaf from ComplexComparisonPartII.
- The missing geometric Hodge input consists of a rational/complex mixed Hodge complex with the comparison, strictness and descent required by Hodge III 8.1.19–20. Its complex filtration index shifts on H^i: W_m H^i is induced from W_(m−i) on the weight complex.
- Use smooth proper strata and Tate twists in the weight spectral sequence to identify both realizations and the stated bounds. For normal H¹ use the stronger normal-variety result of Poids 8.3. G4 and the HodgeStructures Part III ownership proposal keep this input explicit.

**Checks.**

- For G_m, H¹ has weight 2; for an elliptic curve, H¹ has weight 1.
- A proper singular variety need not have pure cohomology; the nodal rational curve has weight-0 H¹, so the normality hypothesis in the H¹ bound is essential.

**Sources:** [hodge-III](#source-hodge-III), §6.2.8, pp. 20–21; §8.1.19–8.1.20, pp. 34–35; §8.2.2–8.2.4, pp. 38–39; §8.2.10–8.2.11, p. 40 — Proper normal-crossing hyperresolutions construct geometric mixed Hodge cohomology, its independence and its products; [poids](#source-poids), §8.3, p. 82; §12–§14, pp. 83–84 — Normality controls H¹ and arithmetic weights recover the geometric Hodge weight filtration.

<a id="frobenius-hodge-weight-comparison"></a>

### Geometric Frobenius splitting of Hodge weights

Proposed declaration: `TauCeti.EllAdicHomotopy.frobenius_hodge_weight_comparison`.

Let X be a complex variety defined over k₀ finitely generated over Q, and choose an integral finite-type Z-model with l inverted. After shrinking that model there are good closed points s with residue cardinality q>1 and geometric Frobenius lifts σ such that the eigenvalues of σ on H^i(X(C),Q)⊗Q_l are algebraic Weil q-numbers. The sum of their generalized eigenspaces of weights at most m is W_m H^i(X(C),Q)⊗Q_l. Thus the Weil weight homomorphism used on the minimal model splits the scalar extension of the geometric Hodge weight filtration. The splitting depends on σ; the cohomological filtration does not.


**Hypotheses.**

- Finite-type separated complex X; k₀ finitely generated; l invertible on the spread; geometric, not arithmetic, Frobenius.

**Requires:** [Geometric cohomology weight filtrations](#geometric-cohomology-weight-bridge); [Complex comparison of minimal models](#complex-minimal-model-comparison); [Galois action and its finite-level continuity](#galois-action); DeligneWeightsAndPurity, DWP.0; DeligneWeightsAndPurity, DWP.7; SchemeAndStackFoundations, SF.2.


**Construction or proof.**

- Spread a common normal-crossing hyperresolution and all comparison maps over an open of a finitely generated integral Z-algebra.
- Apply the DWP.7 purity theorem to smooth proper strata and track all Tate twists in the weight spectral sequence.
- Strictness and degeneration identify the resulting weight filtration on Betti and étale cohomology. Generalized eigenspaces distinguish weights even when Frobenius has nontrivial Jordan blocks.

**Checks.**

- For geometric Frobenius on H²(P¹), eigenvalue q has weight 2, fixing the dual/Tate convention.
- The opposite Frobenius convention gives q^(−1), which would have weight −2 and contradict the intended comparison.

**Sources:** [poids](#source-poids), §13 and Théorème 14, pp. 83–84 — A spread with good closed fibers identifies Frobenius weight subspaces with the Hodge weight filtration; [weil-II](#source-weil-II), §5 (5.3.2)–(5.3.3), pp. 240–241 — Applies this cohomology comparison to an automorphism of the Q_l minimal model.

## EH.6. Minimal-model filtrations and weight gradings

Define admissible exhaustive finite-type sub-DG-algebra filtrations; construct homotopy-adapted stable representatives, generalized eigenvalue gradings and their cohomology-product bounds. Coarsen by integer weights and descend to the coefficient field. Prove the common-filtration lemma for a finite set of actual automorphisms, including its use for two G_m gradings.

**External inputs:** DeligneWeightsAndPurity, DWP.0.

<a id="finite-type-model-filtration"></a>

### Exhaustive finite-type filtrations of minimal models

Proposed declaration: `TauCeti.EllAdicHomotopy.finite_type_model_filtration`.

An admissible filtration of a Sullivan minimal algebra M is an increasing sequence M₀⊂M₁⊂… of differential graded subalgebras, each generated by finitely many positive-degree elements, whose union is M. Stability under an automorphism means that it carries each M_n onto itself, not merely into it. Every cochain degree of each M_n is finite-dimensional, but a cochain degree of the union M may be infinite-dimensional. An automorphism preserving this filtration is locally finite on every degree of M.


**Hypotheses.**

- K is characteristic zero; M is a connected Sullivan minimal algebra with finite-dimensional H^i(M) for each i when existence is invoked.

**Requires:** [Sullivan algebras and their minimal models](#sullivan-minimal-model).


**Construction or proof.**

- Represent subalgebras with inherited grading and differential; record finite positive generator sets and exhaustivity.
- For a fixed degree, finitely many positive-degree generators allow finitely many monomials, proving local finite-dimensionality and then local finiteness for stable automorphisms.

**Uses.**

- Weil II 5.3.1: Finite-dimensional invariant pieces supply generalized eigenspaces and eigenvalue induction.
- Weil II 5.3.4: Filtered automorphism groups are expressed as an inverse system of algebraic groups.

**API.**

- `ModelFiltration.exhaustive` (projection): Every element of M belongs to some M_n.
- `ModelFiltration.finiteDimensionalPiece` (structure): Each (M_n)^i is finite-dimensional over K.
- `ModelFiltration.stable` (characterisation): Stability means equality σ(M_n)=M_n for each n.
- `ModelFiltration.locallyFinite` (compatibility): A stable automorphism acts locally finitely on M^i for every i.
- `ModelFiltration.refinement` (functoriality): Cofinal increasing reindexing preserves the admissible filtration and its stability.
- `ModelFiltration.ext` (extensionality): Filtrations with equal sub-DG-algebras at each index are equal; exhaustive and finite-type witnesses carry no additional choices.

**Unit tests.**

- **finite_model_constant_filtration**: For Λ(a₁,b₁) with d=0, the constant filtration by M is admissible.
- **truncation_rejected**: For K[x₂] with d=0, the degrees≤2 vector subspace is not a subalgebra because x² has degree 4.
- **differential_closure**: In K[x₂]⊗Λ(y₃), dy=x², the algebra generated by y alone is not a DG subalgebra; adjoining x fixes the defect.

**Checks.**

- A degree truncation of M is generally not a subalgebra.
- A finite collection of generators without their differential dependencies need not generate a DG subalgebra.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.1), first and second paragraphs, p. 240 — Finite-type subalgebras make the generalized eigenvalue construction possible.

<a id="filtration-preserving-representative"></a>

### Stable representatives of homotopy automorphisms

Proposed declaration: `TauCeti.EllAdicHomotopy.filtration_preserving_representative`.

For a connected nonnegative commutative DG algebra A over a characteristic-zero field, with each H^i(A) finite-dimensional, a chosen minimal model M admits an admissible finite-type filtration such that every automorphism of M is homotopic to an automorphism preserving that filtration. In particular an automorphism of A can be lifted, up to homotopy, to a filtration-preserving automorphism of M. This assertion does not say that the original automorphism preserves the chosen filtration.


**Hypotheses.**

- H⁰(A)=K; every H^i(A) finite-dimensional; K characteristic zero.

**Requires:** [Existence, lifting and uniqueness of minimal models](#existence-and-lifting); [Exhaustive finite-type filtrations of minimal models](#finite-type-model-filtration); [Polynomial homotopies of commutative DG maps](#sullivan-homotopy).


**Construction or proof.**

- Construct a countable sequence of finite Hirsch-extension blocks, closing each block under the finitely many differential dependencies.
- Use the homotopy lifting/obstruction calculation to replace an arbitrary automorphism by one adapted to those blocks.
- For degree-one extensions and higher degrees verify that finite cohomology is sufficient for the finite-block choices. G5 records this technical filtration argument and the common-filtration refinement; finite-dimensionality of M^i is not an assumption.

**Checks.**

- For a simply connected finite-type model the familiar degree filtration can be refined by finite generator blocks.
- The connected case with nonnilpotent π₁ is retained, so a proof restricted to finite generator spaces per degree is insufficient.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.1), first paragraph, p. 240 — Asserts the admissible-filtration property from the inductive construction of a minimal model; [morgan](#source-morgan), §5, pp. 167–169 — The canonical Hirsch-extension filtration explains the induction and the degree-one finiteness caveat.

<a id="multiplicative-eigenvalue-grading"></a>

### Multiplicative generalized eigenvalue grading

Proposed declaration: `TauCeti.EllAdicHomotopy.multiplicative_eigenvalue_grading`.

Let σ be an automorphism of a minimal commutative DG K-algebra M preserving an admissible finite-type filtration. Over an algebraic closure Kbar set M(a)=union_(r≥1)ker((σ−a)^r) for a∈Kbar×, degreewise in M⊗Kbar. Then M⊗Kbar=⊕_a M(a), d preserves a, and M(a)M(b)⊂M(ab). These are generalized eigenspaces for a locally finite automorphism; neither semisimplicity nor finite-dimensionality of the whole degree of M is required.


**Hypotheses.**

- K characteristic zero; σ is invertible and preserves an admissible filtration.

**Requires:** [Exhaustive finite-type filtrations of minimal models](#finite-type-model-filtration); [Strict graded commutativity on the existing DG carrier](#commutative-dg-refinement); DeligneWeightsAndPurity, DWP.0.


**Construction or proof.**

- Restrict to finite-dimensional graded pieces of M_n and use primary decomposition over a splitting field.
- Show independence under inclusion of the finite pieces and take their union.
- For x,y in generalized eigenspaces use the tensor product spectrum to obtain the ab generalized eigenspace for xy. Commutation with d preserves the eigenvalue.

**Uses.**

- Weil II 5.3.1–5.3.2: The Weil weight homomorphism coarsens these eigenspaces to integer weights.
- EH.8 formality: The differential preserving weight and the lower bound force diagonal components to be cycles.

**API.**

- `EigenvalueGrading.mem` (characterisation): Membership in M(a) means annihilation by a positive power of σ−a on some finite invariant piece.
- `EigenvalueGrading.directSum` (structure): The inclusions induce a direct-sum equivalence to M⊗Kbar.
- `EigenvalueGrading.mul` (compatibility): Products of a and b components lie in the ab component.
- `EigenvalueGrading.d` (compatibility): The differential preserves generalized eigenvalue.
- `EigenvalueGrading.finitePiece` (compatibility): Restriction to each finite invariant piece is its ordinary primary decomposition; the construction agrees with DWP.0 generalized eigenspaces.
- `EigenvalueGrading.ext` (extensionality): Two generalized-eigenvalue decompositions with the same component subspaces for every nonzero eigenvalue agree.

**Unit tests.**

- **jordan_block**: On K² with σ=[[1,1],[0,1]], the entire space is M(1), though the ordinary eigenspace has dimension one.
- **product_eigenvalue**: For closed generators x,y with σx=ax and σy=by, the nonzero product xy has eigenvalue ab.
- **no_zero_eigenvalue**: An invertible σ has zero generalized eigenspace at 0; the grading indices lie in Kbar×.

**Checks.**

- A Jordan block belongs to one generalized eigenspace; ordinary eigenspaces alone fail to span.
- The eigenvalue indexing set is multiplicative, so multiplication sends (a,b) to ab rather than a+b.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.1), second paragraph, p. 240 — Defines the generalized-eigenvalue grading and its multiplicative type.

<a id="minimal-model-eigenvalue-products"></a>

### Eigenvalues of a minimal model come from cohomology

Proposed declaration: `TauCeti.EllAdicHomotopy.minimal_model_eigenvalue_products`.

For M,σ as in the generalized-eigenvalue construction, every eigenvalue a on M^n⊗Kbar is a finite product ∏α_j of eigenvalues α_j on positive-degree cohomology H^(r_j)(M)⊗Kbar, with Σr_j≥n. The unit in degree zero uses the empty product. The inequality is in this direction because a generator that kills a cohomology relation in degree r may have degree r−1. Eigenvalues may be taken from the spherical cohomology quotients appearing in the Hirsch-extension induction.


**Hypotheses.**

- M is a connected Sullivan minimal model with finite-dimensional cohomology; σ respects an admissible filtration.

**Requires:** [Multiplicative generalized eigenvalue grading](#multiplicative-eigenvalue-grading); [Stable representatives of homotopy automorphisms](#filtration-preserving-representative); [Sullivan algebras and their minimal models](#sullivan-minimal-model).


**Construction or proof.**

- Induct along minimal Hirsch extensions: closed generators obtain eigenvalues from new cohomology; generators killing relations obtain eigenvalues from decomposable cocycles in the preceding algebra.
- Multiplicativity propagates product expressions to monomials. The differential raises degree without changing eigenvalue, giving Σr_j≥n.
- For possibly infinite degree-one towers make the induction compatible with the finite blocks of G5.

**Checks.**

- In the even-sphere model with σx=ax and dy=x², σy=a²y: its source cohomology degree sum is 4≥3.
- No eigenvalue is allowed to arise from arbitrary extra contractible generator pairs, which minimality excludes.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.1), third paragraph, p. 240 — The product assertion, including the degree inequality, is the mechanism for model weight bounds.

<a id="integer-weight-grading"></a>

### Integer weight gradings and their lower bounds

Proposed declaration: `TauCeti.EllAdicHomotopy.integer_weight_grading`.

Let Γ⊂Kbar× contain all eigenvalues of σ on M and let v:Γ→Z be a group homomorphism. Coarsen the eigenvalue grading by M_w=⊕_(v(a)=w)M(a). This is a Z-weight grading with d of weight 0 and multiplicative weights. If v(α)≥0 on every positive-degree cohomology eigenvalue, all model weights are nonnegative. If v(α)≥i for eigenvalues on H^i, then M^n has only weights w≥n. If v extends to a Galois-invariant homomorphism on a Galois-stable subgroup, the grading descends to K. For K=Q_l and q>1 a prime power, use the all-complex-embeddings Weil q-weight homomorphism on algebraic numbers, imported from DWP.0.


**Hypotheses.**

- σ is a filtration-preserving automorphism; v is defined on a group containing its spectrum.
- Descent requires the stated Galois invariance; choosing one complex embedding is insufficient.

**Requires:** [Multiplicative generalized eigenvalue grading](#multiplicative-eigenvalue-grading); [Eigenvalues of a minimal model come from cohomology](#minimal-model-eigenvalue-products); DeligneWeightsAndPurity, DWP.0.


**Construction or proof.**

- Sum generalized eigenspaces over equal values of v; directness follows from primary decomposition.
- Apply the eigenvalue-product theorem to prove both bounds.
- Galois invariance makes each weight subspace invariant under coefficient-field descent; descend the finite invariant pieces and take their union.

**Uses.**

- Weil II 5.3.3–5.3.6: Frobenius produces a minimal-model grading splitting cohomological weights.
- Weil II 5.3.7: The lower bound is the key formality argument.

**API.**

- `WeightGrading.d` (structure): d maps M_w^n into M_w^(n+1).
- `WeightGrading.mul` (structure): M_w^n·M_v^m⊂M_(w+v)^(n+m).
- `WeightGrading.cohomology` (compatibility): The induced grading on H*(M) is the coarsening of its generalized eigenspaces by the same v.
- `WeightGrading.lowerBound` (characterisation): Cohomology weight≥degree implies M_w^n=0 for w<n.
- `WeightGrading.descent` (compatibility): A Galois-invariant extension of v descends the grading to K; its scalar extension is the original grading.
- `WeightGrading.ext` (extensionality): Two weight gradings are equal when their subspaces M_w^n agree for every cochain degree n and weight w.

**Unit tests.**

- **nonsemisimple_weight**: A generalized Jordan block with Weil eigenvalue a is assigned the single weight v(a), including its generalized vectors.
- **even_sphere_weights**: In K[x₂]⊗Λ(y₃), dy=x², weights 2 and 4 are compatible; weights 2 and 3 are rejected.
- **multiplicative_torus**: For G_m, a degree-one generator of weight 2 is allowed; replacing all weights by cochain degree would give the wrong cohomological weight.

**Checks.**

- For an even-sphere model with weight(x₂)=2 and dy=x², weight(y₃)=4, so the differential preserves weight and model weight may exceed degree.
- Weight bounds on cohomology do not imply semisimplicity of σ.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.1), last paragraph and (5.3.2), p. 240 — Coarsening gives integer model weights, the two lower bounds, and descent.

<a id="common-stable-filtration"></a>

### A common filtration for finitely many automorphisms

Proposed declaration: `TauCeti.EllAdicHomotopy.common_stable_filtration`.

For the minimal algebra M of a connected finite-cohomology commutative DG algebra over a characteristic-zero field, every finite set of actual automorphisms of M admits a single admissible finite-type filtration stable under each of them. The automorphisms are not required to generate a finite group. For two algebraic weight G_m-actions, choose such a filtration for their values at a scalar such as 2; local finiteness and Zariski density of its powers then show that the same filtration is graded for both actions.


**Hypotheses.**

- Characteristic zero; finite-dimensional H^i(M); finitely many automorphisms, not a finite generated group assumed finite.

**Requires:** [Exhaustive finite-type filtrations of minimal models](#finite-type-model-filtration); [Stable representatives of homotopy automorphisms](#filtration-preserving-representative); [Integer weight gradings and their lower bounds](#integer-weight-grading).


**Construction or proof.**

- Construct finite generator blocks closed under d and the indicated maps and their inverses, using minimal-extension obstructions to prevent an uncontrolled infinite orbit closure.
- Prove finite generation of each block and exhaustivity simultaneously; taking all iterates of a finite set without proving finite-dimensional span does not suffice.
- For a rational torus action each element has finite weight support; a finite-dimensional subspace invariant under the operator 2^w and its inverse is a sum of its weight spaces. G5 records the missing full proof of the block-construction lemma.

**Checks.**

- Two commuting or noncommuting automorphisms are allowed; averaging over a finite group is not a proof.
- A proof only after replacing the automorphisms by homotopic representatives does not prove this assertion about the original two gradings.

**Sources:** [weil-II](#source-weil-II), §5 Lemme (5.3.5), p. 241 — The lemma is stated without proof and is required to extend filtered conjugacy to arbitrary weight gradings.

## EH.7. Rational descent and conjugacy of gradings

Construct the filtered automorphism tower and its weight G_m extension. Prove compatible prounipotent splitting and conjugacy over the base field. Obtain a rational grading of the Sullivan model of a complex variety splitting Hodge W; prove conjugacy by an automorphism acting identically on Gr^W cohomology.

**External inputs:** DGAInfinity, layer 1; ReductiveGroups, layer 5; ReductiveGroups, layer 6; ReductiveGroups, layer 7.

<a id="filtered-automorphism-tower"></a>

### Filtered automorphism schemes and the weight extension

Proposed declaration: `TauCeti.EllAdicHomotopy.filtered_automorphism_tower`.

Fix an admissible filtration of M over a characteristic-zero field K. Let G₁ be the inverse limit of the affine algebraic groups of DG automorphisms of M_n preserving all earlier M_j. Use restrictions and their scheme-theoretic images when needed. For a multiplicative cohomology filtration W finite on each H^i define G₂⊂G₁×G_m by pairs (g,λ) preserving W and acting as λ^w on Gr_w^W H*(M). Write U=ker(G₂→G_m). An algebraic section of G₂→G_m is exactly a weight grading compatible with the fixed model filtration and splitting W on cohomology.


**Hypotheses.**

- M has finite-dimensional cohomology and a chosen admissible filtration.
- All cohomology constraints are imposed as the inverse limit of finite-dimensional algebraic equations.

**Requires:** [Exhaustive finite-type filtrations of minimal models](#finite-type-model-filtration); [Integer weight gradings and their lower bounds](#integer-weight-grading); ReductiveGroups, layer 5; ReductiveGroups, layer 6; DGAInfinity, layer 1.


**Construction or proof.**

- Describe a map on each finite generating set by its images in the finite-dimensional same-degree spaces. Impose multiplication, differential and filtration equations; invertibility is the corresponding open determinant condition.
- Take finite filtered automorphism groups, not unrestricted Aut(M_n) whose restrictions might fail to preserve earlier stages.
- Impose the W and graded-scalar conditions on finite cohomology data and pass to the limit. The kernel is proved prounipotent in the next target, rather than assumed by definition.

**Uses.**

- Weil II 5.3.4: A section over Q_l is descended to Q by the extension argument.
- EH.7 conjugacy: U-conjugacy supplies exactly the identity-on-Gr^W conclusion.

**API.**

- `FilteredAutomorphisms.evalStage` (projection): G₁ has compatible morphisms to finite filtered automorphism schemes.
- `WeightExtension.projection` (projection): The second projection G₂→G_m has kernel U.
- `WeightExtension.sectionEquiv` (equivalence): Algebraic sections correspond to compatible Z-gradings splitting W on cohomology.
- `WeightExtension.baseChange` (compatibility): Finite-stage equations and their inverse limits commute with the characteristic-zero field extensions used here.
- `WeightExtension.kernelAction` (characterisation): U consists exactly of filtered model automorphisms inducing identity on Gr^W H*.
- `FilteredAutomorphisms.ext` (extensionality): Two points of the automorphism pro-group over any coefficient algebra are equal if their finite-stage restrictions agree; compatible stage points determine a unique limit point.

**Unit tests.**

- **pure_closed_line**: For Λ(a₁) with a closed of weight 1, the compatible section is a↦λa and U is trivial.
- **filtered_shear**: On a vector space with weights 1 and 2, a filtration-lowering shear is identity on Gr^W but can be nonidentity on the filtered vector space.
- **finite_stage_restriction**: An automorphism of M_(n+1) not preserving M_n is excluded; a restriction map from the unrestricted automorphism group would be ill-defined.

**Checks.**

- The section corresponding to a grading sends x_w to λ^w x_w.
- The group acting trivially on Gr^W H* can act nontrivially on H* itself by W-lowering terms.

**Sources:** [weil-II](#source-weil-II), §5 proof of Théorème (5.3.4), p. 241 — Filtered automorphisms and a G_m extension encode weight gradings; [sullivan](#source-sullivan), §6, Theorem 6.1 and proof, pp. 289–294 — Finite minimal-algebra automorphism groups are algebraic, with unipotent kernels in the cohomological comparisons.

<a id="prounipotent-extension-splitting"></a>

### Splitting and conjugacy for the weight extension

Proposed declaration: `TauCeti.EllAdicHomotopy.prounipotent_extension_splitting`.

For the filtered minimal-model weight extension, U is prounipotent. If G₂→G_m has a section after a field extension L/K, it is scheme-surjective over K. An extension 1→U→G₂→G_m→1 over a characteristic-zero field with the compatible affine algebraic finite-stage structure used here has an algebraic section over K, and any two sections are U(K)-conjugate. The passage from finite-dimensional unipotent groups to the inverse limit includes a compatible-lifting argument; it is not justified by applying finite-dimensional Levi decomposition independently at every stage.


**Hypotheses.**

- K characteristic zero; the filtered automorphism tower and finite-stage image systems are as in the preceding target.

**Requires:** [Filtered automorphism schemes and the weight extension](#filtered-automorphism-tower); [Eigenvalues of a minimal model come from cohomology](#minimal-model-eigenvalue-products); ReductiveGroups, layer 5; ReductiveGroups, layer 6; ReductiveGroups, layer 7.


**Construction or proof.**

- Use the triangular minimal-generator filtration to show that an automorphism acting trivially on Gr^W H* acts unipotently on every relevant finite stage. The kernel is a limit of these unipotent image groups.
- Use faithful flatness of L/K to descend scheme-surjectivity of the projection.
- Apply characteristic-zero reductivity of G_m and the unipotent torsor result to lift sections and their conjugators successively through finite-stage images. Prove the transition lifting and nonempty inverse-limit assertions. G6 isolates this compatibility proof and the precise supplier extension input.

**Checks.**

- A section is an algebraic G_m morphism, not just an abstract homomorphism of K-points.
- The conjugator lies in U(K), so its action is identity on Gr^W H*; no claim about homotopy to identity follows.

**Sources:** [weil-II](#source-weil-II), §5 proof of Théorème (5.3.4), p. 241 — Uses prounipotence, scheme-surjectivity and conjugate splittings; [sullivan](#source-sullivan), Appendix, p. 295, including (A.1) — Finite-dimensional Levi decomposition and the vanishing of unipotent torsors provide the finite-stage input.

<a id="rational-weight-splitting"></a>

### Rational weight gradings for complex varieties

Proposed declaration: `TauCeti.EllAdicHomotopy.rational_weight_splitting`.

For a connected separated finite-type complex variety X and a Sullivan rational minimal model M_Q of X(C), there is a Z-grading M_Q=⊕_w M_(Q,w) by commutative DG subspaces inducing the Hodge weight filtration on cohomology: W_m H^i(X(C),Q)=⊕_(w≤m)H^i(M_Q)_w. This is the complex-variety rational statement of Weil II 5.3.4, not a theorem stated only for varieties over a finite field. The upper index in the sum is m, the same filtration index on the left.


**Hypotheses.**

- X connected separated finite type over C; geometric mixed Hodge weight filtration supplied as in EH.5.

**Requires:** [Stable representatives of homotopy automorphisms](#filtration-preserving-representative); [Integer weight gradings and their lower bounds](#integer-weight-grading); [Geometric Frobenius splitting of Hodge weights](#frobenius-hodge-weight-comparison); [Filtered automorphism schemes and the weight extension](#filtered-automorphism-tower); [Splitting and conjugacy for the weight extension](#prounipotent-extension-splitting).


**Construction or proof.**

- Choose a good Frobenius and a filtration-preserving lift on M_Q⊗Q_l; apply the Weil-weight construction and EH.5.
- This gives a section of the weight extension after Q_l scalar extension. Descend scheme-surjectivity and use the prounipotent splitting theorem over Q.
- Read the resulting G_m action as a rational grading and compare cohomology weight pieces.

**Checks.**

- For an elliptic curve, degree-one generators have weight 1 and their product has weight 2.
- For G_m,C the degree-one generator has weight 2, so the statement is not purity in cochain degree.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.3) and Théorème (5.3.4), pp. 240–241 — Frobenius first supplies a Q_l grading; the proalgebraic argument descends a splitting to the rational minimal model.

<a id="rational-grading-conjugacy"></a>

### Conjugacy of rational weight gradings

Proposed declaration: `TauCeti.EllAdicHomotopy.rational_grading_conjugacy`.

Any two rational weight gradings of M_Q inducing the geometric Hodge weight filtration on H*(X(C),Q) are conjugate by an automorphism of M_Q inducing identity on Gr^W H*(X(C),Q). Conjugacy means g(M_w)=M′_w for every w. The automorphism is not required to induce identity on H* itself, be homotopic to identity, or respect an arbitrarily preselected finite-type filtration.


**Hypotheses.**

- The hypotheses of the rational weight-splitting theorem.

**Requires:** [Rational weight gradings for complex varieties](#rational-weight-splitting); [A common filtration for finitely many automorphisms](#common-stable-filtration); [Filtered automorphism schemes and the weight extension](#filtered-automorphism-tower); [Splitting and conjugacy for the weight extension](#prounipotent-extension-splitting).


**Construction or proof.**

- Use the two G_m actions evaluated at 2 and EH.6 common filtration to obtain a finite-type filtration graded for both.
- Encode the actions as two sections of a single weight extension.
- Conjugate the sections by U(Q) and translate to the subspace gradings. G5 and G6 must be discharged for this unrestricted assertion.

**Checks.**

- Identity on Gr^W is the exact proven condition on the conjugator.
- The stronger homotopic-to-identity assertion about filtrations in 5.3.10 is not substituted for this theorem.

**Sources:** [weil-II](#source-weil-II), §5 Théorème (5.3.4), proof and Lemme (5.3.5), p. 241 — Filtered uniqueness extends to arbitrary two gradings through the common-filtration lemma.

## EH.8. l-adic weight splitting, formality and normal fundamental groups

For an algebraically closed base with l invertible, obtain Q_l model weight splittings. Prove proper smooth formality by the weight-diagonal projection. Construct the finite 1-minimal Lie tower, compare it with the NC.2 unipotent étale group, and prove the normal-variety presentation with generator weights −1,−2 and relation weights −2,−3,−4.

**External inputs:** AnabelianGeometryAndNonabelianChabauty, NC.2; DeligneWeightsAndPurity, DWP.0; DeligneWeightsAndPurity, DWP.7; DGAInfinity, layer 8.

<a id="algebraically-closed-weight-splitting"></a>

### Weight gradings over arbitrary algebraically closed fields

Proposed declaration: `TauCeti.EllAdicHomotopy.algebraically_closed_weight_splitting`.

Let X be a connected separated finite-type variety over any algebraically closed field k, with l invertible in k. A Sullivan minimal Q_l-model M of A_l(X) admits integer weight gradings inducing on H*(M)=H*_(ét)(X,Q_l) a splitting of the cohomological weight filtration obtained from suitable Frobenius spreads. Over a finite field of definition geometric Frobenius directly supplies the grading through a stable minimal representative. For general k the comparison uses spreads and common refinements. This theorem asserts existence of a grading over Q_l; it does not assert a rational Q-model of X or a functorial choice of splitting.


**Hypotheses.**

- X connected, separated finite type; k algebraically closed; l≠char(k).

**Requires:** [Étale realization of the homotopy algebra](#variety-realization); [Galois action and its finite-level continuity](#galois-action); [Geometric cohomology weight filtrations](#geometric-cohomology-weight-bridge); [Stable representatives of homotopy automorphisms](#filtration-preserving-representative); [Integer weight gradings and their lower bounds](#integer-weight-grading); DeligneWeightsAndPurity, DWP.0; DeligneWeightsAndPurity, DWP.7.


**Construction or proof.**

- Descend X to a finitely generated field and spread the cohomological weight comparison of EH.5; verify independence of the cohomological filtration using G4.
- Choose a suitable Frobenius and lift it to a stable minimal-model representative.
- Apply the Galois-invariant Weil weight homomorphism and its field descent. No descent from Q_l to Q is used in this case.

**Checks.**

- For P¹ minus three rational points over F_q, the geometric H¹ has two weight-2 generators.
- The source’s rational complex theorem is distinct from this Q_l existence statement.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.2) and (5.3.6), pp. 240–241 — The Frobenius construction yields model gradings splitting cohomological weights for arbitrary algebraically closed base fields.

<a id="proper-smooth-formality"></a>

### Formality of proper smooth varieties

Proposed declaration: `TauCeti.EllAdicHomotopy.proper_smooth_formality`.

For a connected proper smooth variety X over an algebraically closed field k with l invertible in k, a Sullivan minimal model M of A_l(X) admits a commutative DG quasi-isomorphism M→(H*_(ét)(X,Q_l),d=0). Thus the same M is a minimal model of the zero-differential cohomology algebra. In a weight grading with M_w^n=0 for w<n and pure weight n on H^n, the map in degree n projects to M_n^n and then takes its cohomology class, killing weights w>n. This is a multiplicative chain map and a cohomology isomorphism.


**Hypotheses.**

- Proper AND smooth; connected; l invertible; the model has finite cohomology in every degree.

**Requires:** [Weight gradings over arbitrary algebraically closed fields](#algebraically-closed-weight-splitting); [Integer weight gradings and their lower bounds](#integer-weight-grading); [Existence, lifting and uniqueness of minimal models](#existence-and-lifting); DGAInfinity, layer 8; DeligneWeightsAndPurity, DWP.7.


**Construction or proof.**

- Use DWP.7 purity for proper smooth X, including nonprojective X; the smooth-projective result alone is insufficient.
- The weight-n part of M^n consists of cycles since d lands in M_n^(n+1)=0.
- For the chain-map condition, the image of a differential is a boundary and hence has zero cohomology class even when its weight equals the target degree. The bound and multiplicativity give compatibility with products.
- Purity makes the induced map on cohomology an isomorphism. Import the generic formality predicate and its Massey consequences from DGAInfinity.

**Checks.**

- A proper smooth genus≥1 curve is formal; for an elliptic curve the explicit model is Λ(a₁,b₁), d=0.
- A merely smooth open variety does not satisfy the purity hypothesis; its weight bounds alone do not justify the diagonal projection theorem.

**Sources:** [weil-II](#source-weil-II), §5 Corollaire (5.3.7) and proof, p. 242 — Purity and the model weight lower bound give the explicit diagonal quasi-isomorphism; [dgms](#source-dgms), §6, Main Theorem and first proof, pp. 270–271 — The classical Kähler formality result is the rational comparison case, not a replacement for the l-adic argument.

<a id="one-minimal-lie-tower"></a>

### The Lie tower dual to a 1-minimal model

Proposed declaration: `TauCeti.EllAdicHomotopy.one_minimal_lie_tower`.

For a connected commutative DG K-algebra A with finite-dimensional H¹ and H², construct a 1-minimal map M^(1)→A as an increasing union of finite degree-one Hirsch extensions, giving an H¹ isomorphism and an H² injection. If V_n is the finite-dimensional generator space of a finite stage, transpose d:V_n→Λ²V_n to define the bracket on V_n∨; d²=0 gives Jacobi. These finite nilpotent Lie algebras and their surjective transition maps form a pronilpotent tower. A compatible integer grading on M^(1) dualizes with opposite signs on the Lie tower.


**Hypotheses.**

- K characteristic zero; H⁰(A)=K; H¹,H² finite-dimensional.
- The tower is indexed by finite 1-minimal Hirsch stages; it is not obtained by dualizing an arbitrary infinite vector space without a topology.

**Requires:** [Sullivan algebras and their minimal models](#sullivan-minimal-model); [Existence, lifting and uniqueness of minimal models](#existence-and-lifting); [Weight gradings over arbitrary algebraically closed fields](#algebraically-closed-weight-splitting); AnabelianGeometryAndNonabelianChabauty, NC.2.


**Construction or proof.**

- Adjoin H¹ generators, then degree-one generators killing the H² kernel, with finite choices at each step.
- Use the existing Lie algebra carrier and transpose the quadratic differential at each finite stage.
- Compare this tower with the supplier’s unipotent fundamental group; the comparison is a separate target, not part of the definition.

**Uses.**

- Weil II 5.3.8 and Poids §10: Converts minimal-model weights into a finite-weight presentation of unipotent π₁.
- AnabelianGeometryAndNonabelianChabauty NC.2: Consumes its unipotent fundamental group as the geometric realization of this algebraic tower.

**API.**

- `OneMinimalLieTower.stage` (projection): Every finite Hirsch stage gives a finite-dimensional nilpotent Lie algebra.
- `OneMinimalLieTower.bracket` (characterisation): The bracket is the transpose of d on degree-one generators, with Jacobi equivalent to d²=0.
- `OneMinimalLieTower.transition` (functoriality): An inclusion of Hirsch stages dualizes to a surjective Lie morphism.
- `OneMinimalLieTower.cohomology` (compatibility): The map to A is an H¹ isomorphism and H² injection, the exact conditions used in the relation theorem.
- `OneMinimalLieTower.weights` (compatibility): Weight-w generators dualize to Lie weight −w, with additive bracket weights.

**Unit tests.**

- **circle_lie_tower**: For Λ(a₁), da=0, the Lie tower is the one-dimensional abelian Lie algebra.
- **two_torus_lie_tower**: For Λ(a₁,b₁), d=0, the tower is abelian of dimension two; [a∨,b∨]=0, so it is not the free Lie algebra.
- **three_punctures_lie_tower**: For P¹ minus three points the completion is free pronilpotent on two weight −2 generators; higher Hirsch generators encode its nonabelian brackets.

**Checks.**

- The sign reversal turns cohomological weights 1,2 into Lie generator weights −1,−2.
- The full minimal model and 1-minimal model need not have the same higher cohomology.

**Sources:** [morgan](#source-morgan), §5, pp. 168–169; §9, Theorem 9.4 and proof, pp. 198–199 — The degree-one minimal model yields the Malcev Lie tower and the generators-and-relations calculation; [poids](#source-poids), §10, p. 83 — Uses the H¹-isomorphism/H²-injection comparison to control normal-variety relation weights.

<a id="unipotent-etale-comparison"></a>

### Comparison with the unipotent étale fundamental group

Proposed declaration: `TauCeti.EllAdicHomotopy.unipotent_etale_comparison`.

For a geometrically pointed connected normal variety (X,x) over an algebraically closed field with l invertible, the pronilpotent Lie tower from the 1-minimal model of A_l(X) identifies with the Lie algebras of the finite-dimensional unipotent Q_l-quotients of the continuous étale fundamental-group representation category. Here the geometric group is the unipotent Tannakian fundamental group supplied by NC.2; the maximal profinite étale fundamental group is not identified with its unipotent completion. Pointed maps give the comparison, and forgetting the basepoint gives the usual ambiguity by inner automorphisms.


**Hypotheses.**

- X normal, separated finite type and connected; geometric basepoint x; l invertible.

**Requires:** [The Lie tower dual to a 1-minimal model](#one-minimal-lie-tower); [Étale realization of the homotopy algebra](#variety-realization); AnabelianGeometryAndNonabelianChabauty, NC.2.


**Construction or proof.**

- Compare the algebraic finite-stage extension category of the degree-one minimal model with successive extensions of the trivial continuous Q_l étale local system. No flat-connection realization on a singular or positive-characteristic variety is assumed.
- At each finite unipotence depth match extension H¹ and obstruction H² through the étale cohomology comparison.
- Check basepoint fiber functors, bracket and transition maps. G7 and the NC.2 extension request identify this comparison for general normal varieties rather than assuming a theorem for smooth curves suffices.

**Checks.**

- Depth one is dual H¹_(ét)(X,Q_l).
- A finite group with trivial rational unipotent completion can have nontrivial finite étale covers; the comparison cannot identify the full profinite group.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.8), p. 242 — The l-adic analogue concerns unipotent Lie quotients of π₁; [poids](#source-poids), §10, p. 83 — Explains the unipotent quotient presentation in terms of degree-one cohomology and degree-two relations; [sullivan](#source-sullivan), §8, Theorem 8.1(ii), p. 301 — The topological comparison identifies the degree-one minimal model with the rational nilpotent completion; the étale comparison needs its own argument.

<a id="normal-variety-lie-presentation"></a>

### Weight-bounded presentations for normal varieties

Proposed declaration: `TauCeti.EllAdicHomotopy.normal_variety_lie_presentation`.

Let X be a connected normal separated finite-type variety over an algebraically closed field k, with geometric basepoint x and l invertible in k. The Lie algebra u_l(X,x) of its unipotent étale fundamental group is isomorphic to the lower-central completion of a graded Lie algebra L(V)/(R), where V≃H¹_(ét)(X,Q_l)∨ has weights −1 and −2, L(V) is the free graded Lie algebra, and the homogeneous ideal is generated by a finite-dimensional relation space R supported in weights −2,−3,−4. The choices of generators and presentation are noncanonical. Its finite unipotent quotients are obtained by the compatible nilpotent/lower-central truncations; one must also include the nilpotence cutoff when presenting a finite quotient.


**Hypotheses.**

- X connected normal separated finite type; k algebraically closed; l≠char(k).
- Use the weight filtration on cohomology and the 1-minimal étale comparison of EH.8.

**Requires:** [The Lie tower dual to a 1-minimal model](#one-minimal-lie-tower); [Comparison with the unipotent étale fundamental group](#unipotent-etale-comparison); [Geometric cohomology weight filtrations](#geometric-cohomology-weight-bridge); [Weight gradings over arbitrary algebraically closed fields](#algebraically-closed-weight-splitting); AnabelianGeometryAndNonabelianChabauty, NC.2.


**Construction or proof.**

- Normality gives H¹ weights 1 and 2, so dual generators have weights −1 and −2.
- The 1-minimal H² injection makes the relation space a quotient of H²(X,Q_l)∨. General cohomological weights put it in [−4,0].
- Relations are brackets, hence have weight≤−2. Intersecting the two bounds leaves exactly −2,−3,−4.
- Each of these weight pieces in the free Lie algebra on finite-dimensional negative-weight V is finite-dimensional; choose a finite homogeneous relation space and complete for the lower central series.

**Checks.**

- For P¹ minus three points V has two weight −2 generators and R=0: all finite nilpotent free quotients occur.
- For a proper smooth elliptic curve V has two weight −1 generators and the relation [a,b]=0 of weight −2, giving an abelian Lie algebra.
- A proper nodal rational curve is not normal and has H¹ of weight 0; it is excluded from the negative-generator-weight statement.

**Sources:** [weil-II](#source-weil-II), §5 (5.3.8), p. 242 — Announces the normal-variety l-adic analogue of Morgan; [poids](#source-poids), §10, p. 83, using §8.3, p. 82 — States the normal-variety presentation: two generator weights and three relation weights; [morgan](#source-morgan), Theorem 9.4 and proof, pp. 198–199 — The smooth-complex version explains the 1-minimal proof; its Hodge bidegrees are not imposed on singular normal X; [morgan-correction](#source-morgan-correction), p. 185, revised Theorem 9.2 and final paragraph — Corrects functoriality claims about indecomposables; the presentation result 9.4 is retained.

## Worked examples across the interfaces

**Circle and two-torus.** The simplicial circle has the rational minimal model
Λ(a₁), da=0. As an algebraic test one can give a weight 1 to a, but an abstract
circle has no preferred arithmetic weight. Its occurrence as the homotopy
type of G_m carries weight 2 on H¹. The topological two-torus realized by a
complex elliptic curve has Λ(a₁,b₁), d=0, weights 1 on a,b and weight 2 on ab.
This is the proper smooth weight-diagonal example. The algebraic torus
(G_m)² also has this exterior rational model but weights 2 on H¹ and 4 on
H². These are distinct geometric weight assignments on the same rational
topological algebra; assigning every torus weight 1 in H¹ would fail the
comparison theorem. The cohomology calculations use ordinary circle/torus
cohomology from AlgebraicTopology stage 6 and Hodge III 8.2.4, pp. 38–39,
together with the G_m logarithmic calculation.

In the integral divided-power model of the two-torus, independent H¹ classes
aγ₁ and bγ₁ multiply to 2abγ₂. Over F₂ this product vanishes even though the
ordinary class ab in H² is nonzero. After rational stabilization γ_n represents
1/n!, so the product comparison becomes exactly the ordinary cup product.
This checks the distinction between the triangular integral ring and the
final rational homotopy algebra (Weil II 5.1.4.2, p. 235, and 5.2.1.7–8,
p. 238).

**Three punctures.** For X=P¹−{0,1,∞} over F_q and l not dividing q,
H¹(X_bar,Q_l)=Q_l(−1)² and H²=0. The first Hirsch stage consists of two
closed degree-one generators a,b of weight 2. It is not the whole minimal
model: Λ(a,b) has the unwanted class ab in H². Add a degree-one c with
dc=ab and weight 4, then continue the degree-one Hirsch construction. Its
dual Lie algebra is the free pronilpotent Lie algebra on two generators of
weight −2. There are no defining geometric relations, although every finite
nilpotent quotient imposes its bracket-length cutoff. This uses ordinary
punctured-curve cohomology from SF.2 and the relation argument of Poids §10,
p. 83, not a claim that the first two generators constitute a finite minimal
algebra.

**Proper smooth curves.** A genus-g proper smooth curve has pure weight 1 in
H¹ and pure weight 2 in H², so the formality target applies. For g=1 the
exterior algebra above is already the minimal model. For g>1, the exterior
algebra on 2g degree-one generators has too many degree-two classes, so
additional minimal generators and nonzero differentials are necessary. Formal
means that this minimal algebra maps by a quasi-isomorphism to the cohomology
ring with zero differential. It does not mean that the differential on the
minimal algebra vanishes. The unipotent Lie presentation has 2g weight −1
generators and the single weight −2 symplectic relation
Σ_i[a_i,b_i]=0. The input is SF.2 curve cohomology and the cup pairing; the
presentation mechanism is Morgan Theorem 9.4, pp. 198–199, and Poids §10,
p. 83.

**The projective line.** A minimal model is Q_l[x₂]⊗Λ(y₃), dy=x²,
with weights 2 and 4. The formal quasi-isomorphism sends x to the H² class
and y to zero. This checks that a nonzero minimal differential can coexist
with formality, that weight exceeds degree on y, and that the direction of
the eigenvalue-product inequality is correct. It is the basic model obtained
by the Hirsch construction of Morgan §5, pp. 163–167.

**Why normality matters.** A proper nodal rational curve has a loop in its
dual graph and weight-0 H¹. It is not normal. Applying the normal-variety
negative-generator-weight presentation to it would therefore give the wrong
weight bound. Normality, rather than smoothness, is the hypothesis used to
exclude weight 0 from H¹ (Poids §8.3, p. 82); singular normal varieties remain
within the presentation theorem.

## Proof obligations at the interfaces

The following are explicit mathematical inputs to establish, with the exact
consumers recorded in the packet. They are not implicit consequences of a
carrier’s presence in Mathlib or of a nearby theorem for curves.

**G1. Integral coefficient resolution and finite-width proof.** Weil II 5.1.9(b), pp. 236–237, gives a proof outline but refers to Quillen décalage and Miller, De Rham cohomology with arbitrary coefficients (Topology 17 (1978), 193–203), for the integral theorem. No cleared full text of Miller was located. Verify the free rank-one exterior-power décalage, extendability/skeletal comparison, principal-quotient coefficient assertion (the unrestricted version fails by E10) and finite-skeleton determination for each fixed (p,n). Dold–Kan alone proves none of these nonlinear claims. No assertion that an arbitrary tensor functor preserves homotopy is used.

**G2. Universal coefficients and exact completed complexes.** Read the proof referred to at SGA5 V 5.3.1 by Weil II 5.2.1, p. 237, or supply an independent proof. It must prove finite generation of H^i_Z_l from degreewise (F), the degree i+1 Tor term, and exactness for the countable module/cycle/boundary systems in the bidegreewise inverse limit. The pinned IsMittagLeffler predicate is only a definition. This is a completion theorem for the form construction; a reusable inverse-limit lemma should be supplied through DGAInfinity/its Part II rather than duplicated.

**G3. Analytic good covers and finite CW comparison.** Weil II 5.2.4–5.2.5, p. 239, invokes compatible good covers. Verify a proof for arbitrary separated finite-type complex varieties, including singular and noncompact ones, a nerve theorem compatible with refinements, and finite CW type sufficient for integral/Z_l cohomology comparison. Current RealAlgebraicGeometry explicitly excludes triangulation, and AlgebraicTopology stage 5 finite-cover chain descent is weaker. Place the missing general topological results in AlgebraicTopology, Part II; do not assume an arbitrary good cover is finite.

**G4. Geometric Hodge realization and spread independence.** The pinned MixedHodgeStructure carrier and Completed/HodgeStructures L2 supply abstract linear algebra only. Hodge III 6.2.8 and 8.1.19–8.2.4 give geometric realization through proper SNC hyperresolutions; Poids 13–14 identify its W with the weights of geometric Frobenius (the inverse of arithmetic Frobenius). Plan the missing mixed Hodge complexes, rational/complex filtered comparison, shifted cohomology weight convention, strict descent and common-refinement independence in HodgeStructures, Part III (Part II is already occupied). For arbitrary algebraically closed bases verify the spread-independent étale weight filtration, not merely the decomposition for one Frobenius. This packet owns the realization comparison bridge, not another abstract MHS definition. Current upstream scheme foundations §4.19 supplies SNC alterations, while §4.13 supplies curve resolution. Establish the hyperresolution/refinement construction from those alterations and rational proper descent, or source the stronger characteristic-zero resolution/compactification theorem separately; neither is an implicit consequence of the SNC-divisor definition.

**G5. Full finite-type and common-filtration arguments.** Supply a complete proof of the finite-block filtration and homotopy-adapted representative in Weil II 5.3.1, and especially the actual-automorphism common filtration of Lemma 5.3.5, p. 241, explicitly left to the reader. Closure under finitely many automorphisms and their inverses does not itself establish finite generation of a block. Morgan §5 p. 168 warns that canonical higher-degree Hirsch blocks can be infinite-dimensional. Cover the general connected finite-cohomology case, not just simply connected or finite-generator models. For conjugacy of two G_m actions prove the dense-scalar argument after the lemma.

**G6. Compatible prounipotent splitting and unipotence.** Establish the triangular-kernel unipotence assertion at finite model stages and prove compatible lifting of sections and conjugators through the inverse system of algebraic image groups in Weil II 5.3.4. Sullivan §6 and Appendix p. 295 give finite-dimensional algebraic groups, Levi splitting and unipotent torsors, but they do not by themselves prove the pro-limit version. Record the base-field rational-point and finite-stage image hypotheses explicitly; independent arbitrary finite-stage choices do not yield a section of the limit.

**G7. General étale 1-minimal/Tannakian comparison.** Prove the comparison of the finite-stage 1-minimal Lie tower of A_l(X) with the continuous Q_l pro-unipotent étale fundamental group for general connected normal separated finite-type X. Weil II 5.3.8 is an announcement; Poids §10 p. 83 gives the presentation argument but leaves this comparison implicit. Sullivan 8.1(ii) is a rational topological realization theorem, not an étale theorem. Extend the NC.2 supplier scope where necessary, then check pointed fiber functors and H¹/H² extension-obstruction compatibility at every finite unipotence depth.

**G8. Finite-coefficient étale realization supplier contract.** The current SchemeAndStackFoundations README, layer 2 conventions at upstream commit a08dc283184a9ec4d6c7fab2fb2b41866801994a, explicitly leaves finite-coefficient/adic étale theory and Artin comparison downstream. Its generic site cohomology, curve computations and proper hypercover descent do not supply the complete EH.4 contract. Locate and match the existing downstream finite-coefficient contracts before packaging: ordinary H^i_et(X,Z/l^r) finiteness for separated finite-type X, invariance under algebraically closed extension, cofinal étale-hypercover computation, compatible Galois action and SGA4 XVI 4.1 analytic comparison. Weil II 5.2.2–5.2.5, pp. 238–239, invokes these inputs; their general proofs were not independently verified here. The EDC.0 supplier inventory names EtaleBaseChange/EllAdicRealization in the CohomologicalPointCounting direction; those names alone are not a verified replacement. Preserve existing owners when locating them, and request only any genuinely absent comparison theorem. This gap is separate from G3 good covers, G2 completion and G4 Hodge realization.

The geometric MHS realization belongs in HodgeStructures, Part III; the
existing Part II has a different scope. The general good-cover/CW comparison
belongs in AlgebraicTopology, Part II. The finite-dimensional unipotent
extension contract belongs in ReductiveGroups, Part III, and the general-base
Tannakian group scope in AnabelianGeometryAndNonabelianChabauty, Part II.
Generic countable inverse-limit exactness belongs in the DG foundations
direction. The packet’s restructuring proposals preserve these boundaries.
The specific divided-power, homotopy-weight and 1-minimal comparison arguments
are the targets of this roadmap.

## Source corrections and scope checks

There is also a coefficient-generality obstruction in Weil II 5.1.5, recorded
as E10. For a discrete infinite simplicial set N, Ω_1^0(N,R) is the product
of copies of R, with basis coordinate γ₁. Take R=Q[x₁,x₂,…] and
I=(x₁,x₂,…). Tensoring by R/I gives (∏R)/I(∏R), whereas the form module
with quotient coefficients is ∏(R/I). The sequence (x_i) is killed by the
natural map but is not in I(∏R): any expression in that submodule uses only
finitely many elements of I, whose finitely many variables cannot generate
every x_i. Thus unrestricted quotient base change fails even at (p,n)=(0,1).
The target is limited to principal ideal quotients, which cover every
l-power transition used by completion; G1 retains their resolution proof.
The independent review confirms this counterexample. No published erratum
was located.

The bounded-degree rational comparison in Weil II 5.1.5 is a morphism with a
proper image before stabilization. Its description as an isomorphism cannot
be used to identify the full graded algebras. The inverse-limit formula
5.2.1.3 concerns the pro-system throughout, and the countability argument of
5.2.2 concerns k₁ and X₁. The corrected weight formula in 5.3.4 uses the same
filtration bound on both sides. The common-filtration lemma is a proof
obligation explicitly omitted by the source. These and the harmless indexing
and tensor-field slips are recorded individually in the packet, cross-linked
to the atlas’s already confirmed E61–E68 findings.

Morgan’s 1986 correction rejects rigidity of the indecomposable space for a
general minimal algebra. The associated graded of its canonical filtration is
the rigid object. The correction preserves Theorem 9.4’s presentation, which
is the result used here; it does not license a functorial choice of a weight
grading or a functorial indecomposable mixed Hodge structure in this roadmap.

The suggested Lean file has a compact subset of statements on existing
carriers: rational coordinate polynomials, the extra alternating Koszul
predicate on an existing grading, and the diagonal-cycle lemma on an existing
DG algebra. Its examples check binomial factors, characteristic 2 and the
degree/weight intersection. The missing heavy carriers are specified in this
document; none is represented by an opaque data axiom or a stand-in structure.

## Sources

All locators use printed page numbers. Public scans were read on 18 October
2026; their exact URLs and SHA-256 hashes are recorded in the packet. Statements
and explanations above are authored mathematical specifications.

<a id="source-weil-II"></a>

- **weil-II**: Pierre Deligne, [La conjecture de Weil : II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Published, Publications mathématiques de l’IHÉS 52 (1980), 137–252. Read: §5, pp. 234–242, entire; bibliography pp. 250–252.

<a id="source-sullivan"></a>

- **sullivan**: Dennis Sullivan, [Infinitesimal computations in topology](https://numdam.org/item/PMIHES_1977__47__269_0.pdf), Published, Publications mathématiques de l’IHÉS 47 (1977), 269–331. Read: §§2–3, pp. 279–285; §5, pp. 287–289; §6, pp. 289–294; Appendix, pp. 294–296; §7, pp. 296–300; Theorem 8.1, p. 301.

<a id="source-morgan"></a>

- **morgan**: John W. Morgan, [The algebraic topology of smooth algebraic varieties](https://www.numdam.org/item/PMIHES_1978__48__137_0.pdf), Published, Publications mathématiques de l’IHÉS 48 (1978), 137–204. Read: Introduction, pp. 137–141; §5, pp. 163–169; §9, Theorem 9.2 and preceding rigidity argument, p. 195; Theorem 9.4 and proof, pp. 198–199.

<a id="source-morgan-correction"></a>

- **morgan-correction**: John W. Morgan, [Correction to: The algebraic topology of smooth algebraic varieties](https://www.numdam.org/item/PMIHES_1986__64__185_0.pdf), Published, Publications mathématiques de l’IHÉS 64 (1986), 185. Read: Entire correction, p. 185.

<a id="source-dgms"></a>

- **dgms**: Pierre Deligne, Phillip Griffiths, John Morgan and Dennis Sullivan, [Real homotopy theory of Kähler manifolds](https://publications.ias.edu/sites/default/files/realhomotopytheory.pdf), Published, Inventiones mathematicae 29 (1975), 245–274; IAS-hosted scan. Read: §1, pp. 248–253; §2, pp. 254–255; §6, Main Theorem and first proof, pp. 270–271.

<a id="source-poids"></a>

- **poids**: Pierre Deligne, [Poids dans la cohomologie des variétés algébriques](https://publications.ias.edu/sites/default/files/29_Poidsdansla.pdf), ICM Vancouver 1974, Proceedings vol. 1 (1975), 79–85; IAS-hosted scan. Read: §§1–17, pp. 79–84; bibliography p. 85; in particular §8.3 p. 82, §10 p. 83, §§12–14 pp. 83–84; read from page images.

<a id="source-hodge-III"></a>

- **hodge-III**: Pierre Deligne, [Théorie de Hodge : III](https://www.numdam.org/item/PMIHES_1974__44__5_0.pdf), Published, Publications mathématiques de l’IHÉS 44 (1974), 5–77. Read: §6.2.4–6.2.8, pp. 19–21; §6.4, pp. 22–23; §8.1.1–8.1.20, pp. 28–35, including Theorem 8.1.15, pp. 32–33; §8.2.1–8.2.4, pp. 38–39; §8.2.10–8.2.11, p. 40.

Miller’s *De Rham cohomology with arbitrary coefficients*, Topology 17 (1978),
193–203, and SGA5 V 5.3.1 are references named by Weil II, not sources whose
full proofs were verified for this packet. Their exact missing inputs are G1
and G2. No inaccessible book text is reproduced or used as an unexamined
declaration of proof closure.
