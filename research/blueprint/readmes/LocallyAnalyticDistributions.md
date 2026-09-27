# Locally analytic distributions, growth, and character spaces

This is a **partial blueprint** for the five layers L0–L4. It preserves the thirteen reviewed operator-theory nodes already integrated in the atlas and refines their dependencies. No layer is marked closed. The construction of actual distribution families is not supplied by the abstract Fredholm theory alone.

The ownership decisions of accepted restructuring RS-16 are binding. The base roadmap is **Padic measures and Iwasawa algebras** (`PadicMeasuresIwasawaAlgebras`). Its layer L0a owns scalar character-space representability, component decompositions, universal characters and coordinate changes. This roadmap imports those objects. It owns the unbounded distribution transform, growth theory and distribution-family coefficient actions, including the uniform local radii needed to evaluate a universal character on an affinoid coefficient module. There is no reverse dependency making the scalar character-space construction depend on those distribution families.

## Conventions and existing libraries

Work over a complete nontrivially valued nonarchimedean field K. For the operator theory, A is a nonzero commutative Noetherian K-Banach algebra with a compatible submultiplicative ultrametric norm. Banach A-modules are complete and Hausdorff and have compatible bounded scalar action. A need not be a field, reduced or affinoid. Treat the zero algebra as a separate trivial case.

An operator norm on an A-linear map is its norm after restricting scalars to K. **Finite rank means that the image lies in a finitely generated A-submodule.** It does not mean finite dimension over K or that the containing module is free. Complete continuity means approximation in that operator norm by finite-A-image maps.

The pinned library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 54 Mathlib declarations whose actual source statements and surrounding hypotheses were inspected in source files verified against the pinned Git tree. In particular, reuse the following rather than reconstructing them:

* `ZeroAtInftyContinuousMap`, its extensionality theorem and completeness instance. For a discrete index type I this is the carrier c_A(I), with its sup norm. I is arbitrary, not necessarily countable.
* `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean`. These supply unconditional summability and multiplication of sums, not just convergence of a chosen enumeration.
* `ContinuousLinearMap.exists_preimage_norm_le` and `ContinuousLinearMap.isOpenMap`. These already apply over nontrivially normed fields, so the Banach open-mapping part of the nonarchimedean argument is not new work.
* `Matrix.det_mul` for finite matrices over a commutative ring.

The inspected definition `IsCompactOperator` is a related but different notion: some neighbourhood has relatively compact image. It is not substituted for complete continuity over A. For example, the A-linear identity of A is finite A-rank even when A is an infinite-dimensional K-affinoid algebra. This is not a claim that its image of a neighbourhood is relatively compact.

All five LAD rows of the reviewed aggregate `data/library-coverage.json` were read, together with the integrated thirteen-node decomposition, its accepted review, the LAD decisions of RS-16 and all applicable link records. Its Tau Ceti search results remain leads, not a fresh exhaustive audit. The native operator, Noetherian module and c0 interfaces listed in the packet are targeted statement checks.

## L0. Banach spaces of locally analytic functions

**Imports:** `PadicMeasuresIwasawaAlgebras:L0` and `:L2`.

The target is the fixed-radius Banach space of functions analytic on each residue ball, with its Gauss norm, over finite extensions of Q_p and finite-dimensional p-adic analytic manifolds. The declarations must prove uniform radius on compact manifolds, independence of charts, restrictions, tensor products and continuous inclusions. Construct the locally convex inductive-limit topology and compare its strong continuous dual with the projective system of Banach duals. The continuous-function dual from the base roadmap supplies the bounded-measure injection, not the locally analytic topology by definition.

The Q_p-locally analytic and F-locally analytic notions must be distinguished on O_F and its products. Equality of underlying functions does not identify their locally convex topologies. The source proofs for this layer have not yet been decomposed; its coverage is `not_read`. The operator-theory construction of c0 in L4 does not count as coverage of L0.

## L1. Amice's unbounded transform

**Imports:** L0 and the bounded transform and operator conventions from `PadicMeasuresIwasawaAlgebras:L2`.

Prove the unbounded Amice transform, including the Frechet topology comparison, in RJW Theorem 3.43. Its target series converge at every radius r<1, which is different from the entire series required by Fredholm theory. Extend restriction, twisting, phi, psi and differentiation with exact norm and domain statements. Division by x is constructed on distributions supported on units; it does not use a globally defined analytic inverse of x on Z_p.

Primitives on admitted balls are unique modulo locally constant functions. A single global additive constant requires a separate continuation theorem. Applications at p-power roots of unity must establish the logarithm's domain and cancellation of apparent poles. RJW was identified as arXiv:2309.15692, but its proof text was not read in this pass. This layer remains `not_read`.

## L2. Admissible growth and uniqueness

**Import:** L1.

Define order-h admissibility by explicit small-ball norms on locally polynomial test functions and compare it with coefficient growth. State the Amice–Velu/Vishik extension and uniqueness theorem with its strict degree bound. Prove that order zero agrees with bounded measures in the intended setting. Do not apply strict small-slope uniqueness at critical slope.

In several variables, retain vectors of radii and growth bounds. A specified collection of arithmetic characters determines a distribution only after the required density or admissibility theorem has been proved. No general principle identifying arbitrary analytic functions from unspecified arithmetic points is admitted. This layer remains `not_read`.

## L3. Character spaces and Mellin transforms

**Imports:** L2; `PadicMeasuresIwasawaAlgebras:L0a` and `:L3`.

Import, rather than reconstruct, the scalar character-space functor, its representability, universal character, generator changes, odd-prime components and the dyadic decomposition. The work here is the scalar Mellin transform, evaluation under coefficient extension, weight derivatives, twists and functoriality for the relevant ray-class group maps. Distinguish bounded functions arising from measures and meromorphic functions arising from pseudo-measures, with explicit evaluation domains.

The geometric comparison uses affinoid constructions and open gluing. Diamonds are not needed. General completed tensor products are not silently requested from the foundational AdicSpaces roadmap, whose stated scope excludes them. Source decomposition of this layer remains `not_read`.

## L4. Families and operator theory

### 4.1. Orthonormal coordinates and complete continuity

Use the source convention

\[
 u(e_i)=\sum_j a_{ij}e_j,\qquad r_j(u)=\sup_i\|a_{ij}\|.
\]

Thus i is an input index and j an output index. Let pi_S retain a finite set S of output coordinates.

A chosen orthonormalization is an A-linear isometry to c_A(I). A potential orthonormalization is a continuous A-linear equivalence with continuous inverse; equivalently, the module becomes ONable after replacing its norm by an equivalent norm. Do not confuse this with an algebraic basis of an infinite-dimensional module.

**Definition API.** `orthonormalization_coordinates` reconstructs an element from its coordinates; `potentiallyON_iff_equivalentNorm` gives the two-sided norm-bound characterization; `coordinateProjection_norm_le` states that finite coordinate projections are contractions in an ON chart. Unit tests: `empty_basis` gives the zero module; `finite_basis` compares with the max norm on A^n; `potential_not_isometric` uses a rescaled one-dimensional K-norm whose scale lies outside the value group, giving a potential but not unit-length ON basis for that norm.

**Bounded-family extension.** A bounded family m_i in M determines a unique continuous A-linear map c_A(I) to M by summing x_i m_i. The cofinite-null property of x and the boundedness of m give unconditional summability. Under the normalized action bound its norm is sup_i norm(m_i). The API is `c0Lift_apply`, `c0Lift_single`, `c0Lift_unique`. Tests are `zero_family`, `basis_family`, and `unbounded_family`: the images rho^(-i), with 0<norm(rho)<1, cannot be the basis images of a bounded functional.

**Imported complete-continuity API.** `finiteImage_isCompletelyContinuous` admits finite-A-image maps; `isCompletelyContinuous_comp` gives the two-sided ideal property; `isClosed_completelyContinuous` identifies the closed approximation class. Tests: `identity_on_A` is admitted even for infinite K-dimension; `identity_on_infinite_c0` is rejected over nonzero A; `decaying_diagonal` admits diag(rho^n) without requiring finite K-rank.

The finite-submodule argument is split into canonical topology, algebraic finite-coordinate detection, the inverse norm bound and uniform coordinate approximation. For a finite submodule Q and epsilon>0, prove

\[
 \|q-\pi_Tq\|\leq\epsilon\|q\|\quad(q\in Q)
\]

for a common finite T. The bounded-preimage theorem supplies uniformly controlled coefficients relative to finitely many generators. Their simultaneous small tails give the estimate. This is a uniform assertion on Q, not just a test on generators. The BGR canonical-topology and closed-submodule proofs still require full decomposition.

It follows that complete continuity of u is equivalent to cofinite decay of r_j(u), and pi_S u then converges to u in operator norm. The Noetherian hypothesis is retained in the finite-image-to-column-decay direction. Source: Buzzard Lemma 2.3 and Proposition 2.4.

### 4.2. Determinants, entire series and two different product rules

For a completely continuous endomorphism define

\[
 P_u(T)=\sum_{n\geq0}c_n(u)T^n,\quad c_0=1,
 \qquad c_n=(-1)^n\sum_{|S|=n}\det(a_{ij})_{i,j\in S}.
\]

The family of minors of each fixed size tends to zero outside finite subsets of its index set. Use unconditional summability to construct the formal series; prove entireness separately.

**Determinant API.** `fredholmSeries_coeff`, `fredholmSeries_constant`, `fredholmSeries_isEntire`. Tests: `zero_operator` gives one; `rank_one_scalar` gives 1-aT; `nonzero_nilpotent` gives one for a nonzero two-by-two nilpotent block. The last test prevents a false equivalence between determinant one and the zero operator.

Define A{{T}} by norm(c_n)R^n tending to zero for **every** R>0. Its topology uses the family of Gauss seminorms; do not call it complete for the single radius-one norm. The API is `mem_entireSeries`, `entire_eval`, `entire_eval_bound`. Tests: `polynomials_are_entire`, `superexponential_coefficients` with c_n=rho^(n*n), and `geometric_nonexample` with c_n=1. The geometric series distinguishes this algebra from L1's open-unit-disc algebra.

If u has image in the coordinate module A^S, all minors meeting its complement vanish. Its determinant therefore equals the ordinary determinant on A^S. General finite free submodule comparison, chart independence, equivalent-norm invariance and the cyclic identity P_uv=P_vu follow the reviewed Buzzard Lemma 2.5–2.7 route. In the cyclic proof only u is completely continuous. Truncate v on the finite relevant image; **do not assert that its global coordinate truncations converge to v**.

The new proof chain makes evaluation in the product identity explicit.

**Uniform minor tails.** Suppose one cofinite-null bounded family b_j bounds the output-column norms of an entire family of matrices. Given R>0 and 0<q<1, choose finite T with Rb_j<=q outside T. Put m=card(T) and B=max(1,R sup_j b_j). Then, uniformly in the matrix,

\[
 \|c_n\|R^n\leq B^m q^{\max(n-m,0)}.
\]

Every product in a principal n-minor uses distinct output columns. At most m are exceptional. Ultrametricity introduces neither a factorial nor a factor counting permutations. Passing through the unconditional sum preserves the bound.

For fixed n>=1 and norm(u),norm(v)<=C with C>=1, telescoping the difference of determinant products gives

\[
 \|c_n(u)-c_n(v)\|\leq\|u-v\|C^{n-1}.
\]

Consequently an operator-norm convergent family with a common column majorant has determinants converging in every R-Gauss seminorm. Choose a uniformly small tail in degree, then handle the finitely many remaining coefficients. For R>=1 this justifies evaluation at T=1. Coefficientwise convergence alone would not do so.

**Evaluated product identity.** Set w=u+v-uv, with uv meaning u composed with v. For common finite coordinate sets S, set u_S=pi_Su, v_S=pi_Sv and w_S=u_S+v_S-u_Sv_S. All three approximants have image in the same A^S and converge in norm. A common column majorant is

\[
 b_j=\max\{r_j(u),r_j(v),\|v\|r_j(u)\}.
\]

The output column in the composition estimate belongs to u. Apply ordinary `Matrix.det_mul` to (1-u_S)(1-v_S), then use the Gauss convergence proved above. This yields

\[
 P_{u+v-uv}(1)=P_u(1)P_v(1),
\]

without a commutation assumption. For a (Pr) module use one splitting i,r with ri=1 for both operators. The lift u to iur preserves sums and products and reduces the assertion to c0.

The rank-one regression u=v=1 is essential: P_{u+v-uv}(T)=1-T, whereas P_u(T)P_v(T)=(1-T)^2. This is not a whole-series identity for u+v-uv. By contrast, the direct-sum identity P_(u plus v)=P_u P_v really is an identity of series.

### 4.3. Property (Pr), scalar extension and its determinant

Define (Pr) by a continuous split embedding into a potentially ONable module, or equivalently into some c_A(I). It does not include finite generation or constant rank. Prove its equivalent lifting property for **surjective** continuous maps of Banach modules, using norm-controlled lifts of basis images. A bare choice of lifts is not enough to prove continuity. A finite (Pr) module is algebraically projective by splitting a finite free presentation.

**Property API.** `hasPr_of_potentiallyON`, `hasPr_retract`, `hasPr_iff_split_c0`. Tests: `zero_hasPr`, `finite_free_hasPr`, and `projective_not_free`. The last uses A=K times K and e=(1,0): eA is a continuous summand of A, but its component ranks differ, so it is not free.

Define the determinant on M with (Pr) by extending u by zero on a complement. The cyclic identity compares different complements. Its API is `fredholmSeriesPr_split`, `fredholmSeriesPr_agrees_ON`, `fredholmSeriesPr_baseChange`. Tests: `pr_zero_operator`, `add_zero_complement`, and `variable_rank_projective`. For id on eA the determinant is 1-eT. Its leading coefficient is not a unit, although the operator is invertible.

Completed scalar extension must identify the completed extension of c_A(I) with c_B(I) for a **continuous**, not necessarily contractive, algebra map A to B. Transfer column estimates and convergent coefficient sums. The completed tensor carrier, BGR 2.1.7 proof and the extension of retractions in Buzzard Lemmas 2.12–2.13 remain open decomposition tasks; they are not fields of an assumed eigenvariety structure.

### 4.4. Resultants, resolvents and finite-slope summands

For monic Q, establish unique division P=QS+R with S entire and degree R<degree Q. The recurrence estimates proving an entire quotient require an explicit source expansion. Define Res(Q,P) as the determinant of multiplication by the remainder of P on the finite free quotient A[T]/(Q). Its API is `entireResultant_remainder`, `entireResultant_mul`, `entireResultant_linear`. Tests: `constant_divisor` gives Res(1,P)=1, even for P=0; `linear_evaluation` gives Res(T-a,1-bT)=1-ba; `common_factor` gives Res(Q,Q)=0 for positive-degree monic Q.

The determinant/adjugate criterion and analytic division give: Res(Q,P) is a **unit** exactly when P and Q generate the unit ideal of A{{T}}. Being nonzero is not enough over A. The spectral resultant D(B,P), and its identification with the determinant of polynomial functional calculus, is a separate construction whose transport from Coleman A3.8–A3.9 is still unresolved here.

Define the Fredholm resolvent by v_0=1 and v_n=c_n 1+u v_(n-1). Serre's adjugate-minor estimate gives entire convergence of the operator-valued series; the recurrence by itself does not. Prove both identities (1-Tu)F_u=F_u(1-Tu)=P_u(T)1. API: `resolventCoeff_succ`, `resolvent_entire`, `resolvent_identity`. Tests: `rank_one_resolvent` is one; `diagonal_two` is diag(1-bT,1-aT); `nilpotent_two` is 1+TN for a square-zero two-by-two block.

The reviewed polynomial criterion says Q is coprime to P_u exactly when Q*(u) is invertible. The new evaluated product theorem supplies a formerly implicit step in its converse. If L=Q*(u) is invertible, then v=1-L and w=1-L^(-1) are completely continuous, (1-v)(1-w)=1, and P_v(1)P_w(1)=1. **Identifying this value with the appropriate resultant still needs the spectral-mapping theorem.** Closing the product gap does not close all of Lemma 3.1.

At a Hasse root a of order h, differentiate the resolvent identity with Hasse derivatives and evaluate. Put z_s=Delta^s F_u(a), c=Delta^h P_u(a), e=c^(-1)(1-au)z_h and f=-c^(-1)u z_(h-1). The relations e+f=1 and f e^h=0 give complementary projectors e^h and 1-e^h. They lie in the operator-norm closure of A[u]. On their summands, (1-au)^h is respectively invertible and zero. Handle h=0 separately.

On the nilpotent summand the identity is a polynomial in u without constant term, hence completely continuous. A sufficiently close finite-A-image approximation is invertible by the Neumann series, proving finite generation. Property (Pr) then gives projectivity.

The rank argument must not conceal either of two pitfalls. First, an invertible operator on a finite projective module does not by itself give a determinant polynomial with unit leading coefficient before constant rank is known: id on eA is the counterexample above. Prove rank h on each maximal-ideal fibre from the exact Hasse order and the complementary factor's invertibility, then use the constant-rank determinant and analytic division argument. Second, equality on all residue fields is not equality over a nonreduced ring: 1+epsilon T over K[epsilon]/(epsilon^2) is a regression test.

For P_u=QS with Q(0)=S(0)=1, Q polynomial with unit leading coefficient and Q,S analytically coprime, obtain the finite projective slope summand N of rank degree Q. The initial root construction gives power-annihilation by Q*(u). The final determinant comparison P_(u|N)=Q and finite-projective Cayley–Hamilton are needed to prove that Q*(u) itself kills N. This final step is retained from Buzzard Theorem 3.3.

### 4.5. Distribution families and acceptance boundary

The actual affinoid-valued analytic functions and distributions, integral models, completed tensor products, specialization maps, universal-character actions and their uniform local radii remain part of L4. They are not supplied by naming an abstract Banach module. The semigroup operators used in modular symbols and automorphic cohomology require their own continuity and complete-continuity estimates. Specialization must preserve a stated slope-adapted factorization, not an arbitrary pointwise numerical slope cutoff.

Exports are required by the atlas consumers in PadicFamilies, ModularSymbolsPadicLFunctions, AutomorphicPadicLFunctions, AutomorphicGaloisRepresentationsPartII and PhiGammaModulesAndIwasawaCohomology. The acceptance suite must include an order-zero comparison, a positive-order distribution that is not a bounded measure, multivariable growth tests, strict-slope uniqueness and universal-character evaluation under scalar extension.

## Coordinate detection and the finite-generation criterion

The elementary interfaces below refine the operator theory without asserting that all its analytic foundations are settled. In particular, the finite-coordinate lemma is algebraic, whereas closedness of a finite submodule in a Banach module still uses the BGR input.

### One complete-continuity predicate

`AdicSpacesPartII:R3/completely-continuous-map` already owns the finite-range approximation predicate and its composition, addition and closure API. This packet imports that predicate. The existing `completely-continuous` ID is retained as a comparison, so its consumers and the reviewed Fredholm graph are preserved. The suggested file labels the supplier signature as a stub and uses a local abbreviation for it.

There are two conventions to compare. Buzzard calls an operator finite rank when its image is contained in a finite A-submodule. The supplier asks that the image itself be finitely generated. Over a Noetherian ring A these agree: `Submodule.FG.of_le` applies to the image contained in the finite submodule, and the reverse direction takes the image itself as the containing module. This argument does not use freeness or finite K-dimension. Without Noetherianity, a submodule of a finite module need not be finite, so the comparison must retain that hypothesis.

The supplier's mathematical contract currently assumes affinoid coefficients. Its suggested ordinary predicate has a broader signature, but a broad signature alone is not a proof plan for the required generality. The request to R3 asks for the ordinary predicate and ideal/closure API over commutative Noetherian K-Banach algebras and compatible complete modules. The strict complete-continuity variant is not part of this import. This request is an explicit dependency boundary for the generic Fredholm theory.

`isCompletelyContinuous_iff_containing_finite` is the comparison API. The original tests are preserved: the identity of A has finite A-image, the identity on infinite c0 does not, and a decaying diagonal does. These tests prevent the imported notion from being replaced by finite K-rank or by `IsCompactOperator`.

### The existing c0 carrier supports ring coefficients

Mathlib supplies `ZeroAtInftyContinuousMap`, its pointwise module operations and the norm inherited from bounded continuous functions. Its field-valued `NormedSpace` instance does not directly give the missing continuous A-action when A is only a normed ring. The scalar-bound node supplies the precise interface:

\[
\|a x\|\leq\|a\|\,\|x\|.
\]

For each coordinate, submultiplicativity bounds the product by the right-hand side. `BoundedContinuousFunction.norm_coe_le_norm` bounds each coordinate of x, and `BoundedContinuousFunction.norm_le` passes the uniform bound to the existing norm. Its nonnegative-bound condition handles an empty domain correctly. `IsBoundedSMul.of_norm_smul_le` and `IsBoundedSMul.continuousSMul` then give joint continuity. No field structure on A and no replacement sequence-space carrier are required.

The instance API is `c0ContinuousSMul`. Besides the inherited coordinate tests, `scalar_empty` checks the zero-index norm and `scalar_single` checks a times the vector with coefficient b equals the vector with coefficient ab. The repaired Lean signatures permit coordinate index types and coefficient types to inhabit different universes. This matters for the finite and countable examples with an arbitrary coefficient algebra.

### Algebraic finite-coordinate detection

Let B be any commutative Noetherian ring and Q a finite submodule of the full product B^I, where I is arbitrary. Choose generators q_1,...,q_r. For i in I, form the column

\[
v_i=(q_1(i),\ldots,q_r(i))\in B^r.
\]

The module B^r is Noetherian. Therefore the span of all the columns is finitely generated. The pinned finite-subset-of-generators theorem chooses a finite collection of the actual columns that spans it; choose their indices as S. This uses Noetherianity of the finite product B^r, not of the generally much larger product B^I.

If x and y in Q agree on S, express x-y as a linear combination of the q_alpha. Its coefficients define a linear functional on B^r. It vanishes on the selected columns, hence on their span, hence on every v_i. Every coordinate of x-y is therefore zero. This proves `finite_coordinate_detection` and the algebraic part of Buzzard Lemma 2.3(a).

The empty submodule needs no coordinates. The constant vector (1,0) in (K times K)^N gives a test with a nonfree finite submodule: coordinate zero detects it. Conversely a coordinate vector supported outside S is nonzero while all its S-coordinates vanish. This last test rules out an assertion that an arbitrary finite coordinate set detects every finite submodule.

For a finite submodule of c_A(I), apply the lemma to its image under the coordinate embedding; finite generation of this image is `Submodule.FG.map`. Proving that its induced norm is equivalent to the canonical finite-module norm remains dependent on BGR closedness and topology. The algebraic lemma does not conceal that analytic step.

### Complete continuity of the identity

The pointwise approximation predicate is equivalent to strict approximation in the K-operator norm. For the forward implication, approximate with pointwise error epsilon/2 and use `ContinuousLinearMap.opNorm_le_bound`. For the reverse implication, `ContinuousLinearMap.le_opNorm` bounds each value. `Metric.mem_closure_iff` identifies this with the norm-closure formulation. Strict error less than zero is impossible, which tests the positive-radius condition.

Now suppose the identity of M is completely continuous. Choose a finite-A-image operator alpha with norm(id-alpha)<1. Work in the existing complete normed ring of continuous K-linear endomorphisms and apply `isUnit_one_sub_of_norm_lt_one` to beta=id-alpha. The result says that alpha, after scalar restriction, is invertible. The native bijectivity criterion gives surjectivity of its underlying function. For this argument there is no need to construct a separate norm on the A-linear endomorphism ring or to prove that the inverse is A-linear.

The image of alpha is contained in a finite A-submodule Q. Surjectivity forces Q=M, so `Module.finite_def` gives finite generation over A. Conversely a finite A-module has a finite-range identity and a constant approximating family. Thus complete continuity of the identity is equivalent to finite A-generation, without potential ONability or property (Pr). The zero module, arbitrary endomorphisms of finite A-modules and the identity on a nonfinite A-module provide the three tests.

This closes the Neumann-series interface in the proof plan for Buzzard Proposition 3.2. The subsequent projectivity and rank arguments still have their separately recorded dependencies.

### Tests for norms and varying rank

All three inherited tests missing from the original prototype now have Lean example signatures. For the rescaled-line test, take an actual normed K-line M with an algebraic coordinate e and norm(x)=c norm(e(x)), for c>0 outside the value group of K. The coordinate gives a continuous equivalence, but an isometry would make c the norm of a nonzero scalar, a contradiction. The test states the rescaling law explicitly; it does not assume the desired failure of isometry.

For the other two tests, use the actual submodule generated by (1,0) inside A=K times K. Projection onto the first component gives a continuous splitting, so eA has (Pr). It is nonzero and the nonzero scalar (0,1) annihilates it; a nonzero free A-module is faithful, so eA cannot be free. Extending its identity by zero on the complementary factor is multiplication by e on the free rank-one module A. Its Fredholm determinant is consequently 1-eT. The leading coefficient is a nonunit, despite invertibility of the identity on eA. These are concrete safeguards for the later constant-rank argument.

## L4 continuation: Hasse calculus for the Riesz projectors

The source proof differentiates an entire operator-valued resolvent. This bridge
requires a formal operation, a norm estimate and an actual convergent evaluation.
Keep these separate. Polynomial Hasse derivatives already exist at the pin; the
new construction extends them to the native power-series carrier. All formulas
admit positive characteristic. Completeness enters evaluation, not the formal
coefficient construction or its norm bound.

The analytic statements below retain the explicit bounded scalar-action constant
C and the K-operator norm. In particular, the proof does not silently replace a
bounded A-action by a contractive one. The operator-valued adjugate estimate in
the existing resolvent-series node remains an upstream analytic obligation.

### Hasse derivatives of formal power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-series` (construction).

For any possibly noncommutative semiring B and s in N, construct the additive B-linear operation Delta_s on the existing B[[T]] by coefficient_n(Delta_s f)=choose(n+s,s) times coefficient_(n+s)(f). Multiplication by the natural number means repeated addition, with no inverse factorial and no convergence assumption.

**Hypotheses:** B is a semiring; s and coefficient indices are natural numbers. The variable T is central.

**Dependencies:** `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

**Proof/construction.** Apply the native power-series constructor to the displayed coefficient sequence. Coefficient extensionality and distributivity prove additivity and left B-linearity; natural-number multiplication commutes with left scalar multiplication. Order zero uses choose(n,0)=1. A monomial of degree d<s has every coefficient zero; at d=s its Hasse derivative is the constant coefficient. These finite computations do not shift a formal series by a nonzero constant.

**Uses:** LocallyAnalyticDistributions:L4/hasse-product: Differentiates the formal two-sided resolvent identity. LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation: Supplies the coefficient sequence to be summed after convergence is proved.

**API**

- `hasseSeries_coeff` (characterisation): Coefficient n is choose(n+s,s) times coefficient n+s.
- `hasseSeries_zero` (simp): Delta_0 f=f.
- `hasseSeries_add` (compatibility): Delta_s(f+g)=Delta_s f+Delta_s g.
- `hasseSeries_smul` (compatibility): Delta_s(b f)=b Delta_s f, including noncommutative B.

**Unit tests**

- `hasse_order_zero` (degenerate): Delta_0 fixes every series.
- `hasse_degree_boundary` (non-example): Delta_s(b T^d)=0 whenever d<s.
- `hasse_top_monomial` (characterisation): Delta_s(b T^s)=b, not s factorial times b.
- `hasse_characteristic_two` (non-example): Over Z/2, Delta_2(T^2)=1 although the second ordinary polynomial derivative is zero.

**Acceptance:** Do not define this by dividing an iterated derivative by s factorial. Formal substitution T+a is not performed on arbitrary formal power series.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Polynomial and series Hasse derivatives agree

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison` (comparison).

The native inclusion of B[T] in B[[T]] carries Polynomial.hasseDeriv s p to Delta_s of the included polynomial, for every semiring B.

**Hypotheses:** No topology, characteristic restriction or commutativity of B.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:Polynomial.hasseDeriv`, `mathlib:Polynomial.hasseDeriv_coeff`, `mathlib:Polynomial.coeff_coe`.

**Proof/construction.** Compare coefficient n on both sides. The pinned polynomial formula is choose(n+s,s) times coefficient n+s. Natural-number scalar multiplication is its natural cast multiplied on the left. This is an adapter to the existing polynomial operation, not a new polynomial differentiation theory.

**Acceptance:** Preserve the order of coefficient multiplication over noncommutative semirings.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse product formula for power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-product` (lemma).

For f,g in B[[T]] and s in N, Delta_s(fg)=sum over i+j=s of (Delta_i f)(Delta_j g), with f before g in every product.

**Hypotheses:** B is any semiring; the sum over pairs of natural numbers with i+j=s is finite.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `mathlib:Polynomial.hasseDeriv_mul`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul_eq_coeff_trunc_mul_trunc`.

**Proof/construction.** Fix the coefficient n to be compared and truncate both f and g at N=n+s+1. All coefficients used on the left have degree at most n+s. On the right a contributing convolution pair r+t=n and Hasse pair i+j=s uses coefficients r+i and t+j, both less than N. Replace each by its polynomial truncation coefficient. Apply the existing polynomial Hasse product theorem and the polynomial comparison. Coefficient extensionality concludes the formal identity without any infinite rearrangement.

**Acceptance:** A noncommutative coefficient test must distinguish fg from gf.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse coefficient radius bound

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound` (lemma).

For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s).

**Hypotheses:** B need not be commutative, complete, ultrametric or norm-one. R is strictly positive.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:norm_pow_le_mul_norm`, `mathlib:Nat.choose_le_two_pow`.

**Proof/construction.** The additive counterpart norm_nsmul_le of the indexed multiplicative declaration bounds repeated addition by choose(n+s,s) times the coefficient norm. Bound the binomial coefficient by 2^(n+s). Multiply by the nonnegative R^n and rewrite 2^(n+s) R^n as R^(-s)(2R)^(n+s). Positivity of R justifies cancellation.

**Acceptance:** The right radius is 2R; a fixed radius argument alone does not prove entireness. The zero operator ring is admitted; no norm-one identity is used.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse derivatives preserve entireness

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-entire` (lemma).

If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring.

**Hypotheses:** B is a normed ring; no completeness is needed for this coefficient limit statement.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof/construction.** Apply the original decay at 2R to the shifted index n+s, which tends to infinity. Multiply by the fixed factor R^(-s). The Hasse coefficient norm is nonnegative and bounded by this sequence. Squeeze to zero, for each R>0. On commutative A this is exactly membership in the existing entire-series carrier.

**Acceptance:** Entireness means all positive radii, not merely radii less than one.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse derivatives of the resolvent

**Declaration:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation` (construction).

For a in A and s in N, construct z_s(a)=sum_n choose(n+s,s) a^n v_(n+s) as a continuous A-linear endomorphism of M, where v_n are the existing Fredholm resolvent coefficients. The sum converges in the native K-operator norm.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/hasse-entire`, `mathlib:ContinuousLinearMap.instCompleteSpace`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`.

**Proof/construction.** Form the Hasse coefficient series in the existing complete normed ring of continuous K-linear endomorphisms. The previous entireness lemma applies to the norm after scalar restriction. Choose rho>max(norm(a),0). Hasse entireness makes norm(w_n) rho^n eventually at most one. The scalar-action bound and operator-norm inequality give norm(a^n w_n) <= C (norm(a)/rho)^n eventually. Thus the norms and the operators are summable by the real geometric series and completeness. Every partial sum is A-linear. Operator-norm convergence implies pointwise convergence, and continuity of scalar multiplication lets the A-linearity equality pass to the limit. Package the limit as the native continuous A-linear map; uniqueness of limits makes it independent of the chosen bound and radius. At s=0 compare term by term with the existing resolvent evaluation. At a=0 the only surviving term is v_s. This uses no change of module norm and creates no competing operator carrier.

**Uses:** LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent: Evaluates the formal differentiated identity. LocallyAnalyticDistributions:L4/riesz-root-projectors: Constructs the operators z_h and z_(h-1) entering the projectors.

**API**

- `resolventHasseAt_hasSum` (characterisation): The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm, with the explicit bounded-action hypothesis.
- `resolventHasseAt_zero` (compatibility): Hasse order zero agrees with the existing resolventAt.
- `resolventHasseAt_at_zero` (simp): At a=0 the value is exactly v_s.

**Unit tests**

- `hasse_scalar_resolvent` (degenerate): On the line A with u=a, the resolvent numerator is constant one, so z_1(t)=0.
- `hasse_diagonal_resolvent` (characterisation): For diag(a,b), z_1(t)=diag(-b,-a), independent of t.
- `hasse_nilpotent_resolvent` (non-example): For the nonzero nilpotent two-by-two Jordan block N, z_1(t)=N even though P_N=1.

**Acceptance:** This construction consumes resolvent-series entireness. The unresolved adjugate coefficient estimate is still required; the recurrence alone cannot supply it.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse resolvent recurrence

**Declaration:** `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent` (lemma).

For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the existing two-sided resolvent identity, using z_0(a)=F_u(a).

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-product`, `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:HasSum.mul_left`, `mathlib:HasSum.mul_right`.

**Proof/construction.** Apply the formal product formula to (1-Tu)F_u=P_u times 1. Its only nonzero derivatives on the first factor have orders zero and one, with Delta_1(1-Tu)=-u. This gives the left formal recurrence; start with F_u(1-Tu) for the right recurrence. The Hasse evaluation construction gives absolute norm summability at a. Continuous left/right multiplication may therefore pass through the sum. The extra T shifts the index with an explicit zero constant term, and multiplication by a is the bounded scalar operator. Coefficient-wise scalar identities evaluate to Delta_(s+1) P_u(a) times the identity: the map b to scalar multiplication by b is bounded by C. Preserve both product orders until commutation is established separately.

**Acceptance:** At a Hasse root of order h the right side vanishes for s+1<h and equals the specified unit c at s+1=h. The s=0 identity is not obtained by using a negative derivative order.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values lie in the polynomial closure

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure` (lemma).

For every a in A and s in N, the restricted K-linear map z_s(a) belongs to the closure, in the native K-operator norm, of the set of finite polynomial expressions sum_i b_i u^i with b_i in A.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/resolvent-series`, `mathlib:hasSum_iff_tendsto_nat_of_summable_norm`.

**Proof/construction.** Induct on n in v_0=1 and v_(n+1)=c_(n+1) times 1+u v_n to express v_n as a polynomial in u with scalar A-coefficients. Each finite partial sum defining z_s(a) remains a polynomial in u; the binomial and a powers are scalar coefficients. The construction proves norm summability, hence convergence of initial partial sums to z_s(a). A limit of elements of the polynomial set lies in its closure. There is no use of a norm on A-linear endomorphisms independent of scalar restriction.

**Acceptance:** The topology is operator norm, not pointwise convergence. The zero module is included.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values commute

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation` (lemma).

Each z_s(a) commutes with u and with every z_t(b), for all a,b in A and s,t in N.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`, `mathlib:ContinuousLinearMap.toNormedRing`.

**Proof/construction.** A-linearity of u makes every scalar multiplication by A commute with u; commutativity of A then makes all finite polynomials in u commute with one another. For a fixed polynomial operator q, the equation xq=qx defines a closed set because multiplication in the native K-operator ring is continuous. Taking the first limit shows z_s(a) commutes with each polynomial. Fix z_s(a) and take a second limit through the same closed commutation equation. This proves commutation with z_t(b); choosing q=u proves the first assertion. Faithfulness of scalar restriction returns the A-linear equalities.

**Acceptance:** Use two successive limits, not an unproved assertion that arbitrary limits preserve products uniformly.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14).

### Roots of an entire series with unit constant are units

**Declaration:** `LocallyAnalyticDistributions:L4/entire-root-unit` (lemma).

If f in A{{T}} has constant coefficient one and f(a)=0, then a is a unit with inverse -sum_(n>=0) f_(n+1) a^n. In particular a positive-order Hasse root of a Fredholm determinant is a unit.

**Hypotheses:** A is a complete commutative normed ring; no field, reducedness, Noetherianity or characteristic hypothesis is needed.

**Dependencies:** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`, `mathlib:HasSum.mul_left`.

**Proof/construction.** Choose rho>max(norm(a),0). Decay of norm(f_(n+1)) rho^(n+1) bounds the shifted coefficient norm by a constant times rho^(-n). Thus the shifted tail evaluated at a is absolutely summable by a geometric comparison. Separate the constant term in the convergent evaluation and shift the tail: 0=f(a)=1+a sum_n f_(n+1) a^n. Moving terms gives a times the displayed negative tail equal to one. Commutativity supplies the reverse product identity and therefore a unit with this inverse. The argument does not infer equality from residue fields.

**Unit tests**

- `root_nonunit_constant` (non-example): The entire polynomial T vanishes at zero, which is not a unit in a nonzero coefficient algebra.

**Acceptance:** The constant-coefficient assumption is essential: f=T has the nonunit root zero. For Hasse order zero no root vanishing is assumed, and this lemma is not applied.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Return to the Riesz proof

For h>0, the determinant has constant term one and vanishes at a, so the new
unit-root lemma gives an explicit inverse of a. Put c=Delta_h P_u(a), which is
assumed to be a unit. The evaluated recurrence gives e=c^(-1)(1-au)z_h and
f=-c^(-1)u z_(h-1), with e+f=1. Its vanishing equations inductively give
(1-au)^(s+1)z_s=0 for s<h. The commutation lemma therefore gives f e^h=0.
Expanding (e+f)^h proves that p=e^h and q=1-p are complementary idempotents.
Their polynomial-closure property now has explicit analytic prerequisites.

The finite-projective rank and exact determinant arguments retain the existing
nonreduced-coefficient safeguards. The new nodes do not establish these
arguments, the adjugate coefficient estimate, completed tensors, spectral
resultants, or the actual locally analytic distribution families. At order h=0
the root-vanishing/unit argument is not used.

## L4 continuation: the explicit Riesz decomposition

Write v=1-au, z_s=Delta_s F_u(a), and let c=Delta_h P_u(a) be a unit,
with all earlier Hasse values zero. Put b=c⁻¹z_h, p=(vb)^h and E=1-p.
The projector E selects the generalized root space N; its complement p selects F.
These are continuous A-linear endomorphisms on the existing module. The result is
N=ker(v^h), F=image(v^h), with a continuous inverse b for v on F.
No reducedness or scalar-field hypothesis on A is added.

The source proof has three distinct steps: Hasse calculus, the explicit
projector split, and finite-projective rank/determinant. This continuation
specifies the middle step. It imports native idempotents, kernel/image and
continuous projections, and retains every remaining analytic and rank gap.
The general ring and module facts used to verify the formulas are scratch
proofs, not a second proposed projection library.

### Lower Hasse resolvent annihilation

`LocallyAnalyticDistributions:L4/hasse-lower-annihilation` (lemma).

For every s<h, v^(s+1) z_s=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the order-zero identity v z_0=P_u(a) I is zero. For s+1<h the Hasse recurrence gives v z_(s+1)=u z_s.
2. Induct: v^(s+2)z_(s+1)=v^(s+1)u z_s=u v^(s+1)z_s=0. Commutation follows since v=1-au. For h=0 the conclusion has no instances.

Acceptance: Use the exact s+1 exponent, including the s=0 boundary; no factorials.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Normalized Hasse resolvent identity

`LocallyAnalyticDistributions:L4/hasse-normalized-annihilation` (lemma).

The actual b=c^(-1)z_h commutes with v, and v^h(1-vb)=0, including h=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/hasse-lower-annihilation`, `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the top recurrence is v z_h-u z_(h-1)=c I. Multiply by the inverse scalar to get 1-vb=-c^(-1)u z_(h-1).
2. The lower-annihilation lemma at h-1 kills this after multiplication by v^h; scalar multiplication is central in the ring of A-linear endomorphisms. Commutation of v with b follows from commutation of u with z_h.
3. For h=0 use v z_0=P_u(a)I=cI directly, giving vb=1. This avoids a fictitious z_(-1) and supplies invertibility even though there is no root.

Acceptance: The nonzero coefficient must be a unit, not merely nonzero. For diag(1,3) over Z/4 at a=1, the first Hasse value is 2 and cannot be inverted. This finite-ring control tests the algebra, not the standing Banach hypotheses.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Explicit Hasse Riesz projector

`LocallyAnalyticDistributions:L4/riesz-projector-formula` (construction).

Define rieszRootProjector(u,Pr,cc,a,h,c)=E=1-((1-au)(c^(-1)z_h))^h as a native continuous A-linear endomorphism; its complement is p=1-E. The formula exists for every a,h and chosen unit c; its spectral properties require the exact Hasse-order hypotheses.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`.

Proof or construction:

1. Use composition, powers, scalar multiplication and subtraction on the existing ring of continuous A-linear endomorphisms. There is no new operator carrier.
2. At h=0 the formula gives E=0 and p=1. Under the root hypotheses, the following lemmas identify it with the source projector onto N, while Serre calls its complement p.

Acceptance: The sign and choice of summand are fixed by the diagonal test. Retain generalized eigenspaces.

Uses:

- `LocallyAnalyticDistributions:L4/riesz-root-projectors`: Supplies explicit continuous projectors for the analytic split before finite generation and projectivity.
- `LocallyAnalyticDistributions:L4/finite-slope-summands`: The root splitting applied to a polynomial in u is the intermediate step; exact Q-star annihilation and rank remain separate.
- `PadicFamilies:L2a`: The existing consumer ultimately needs canonical finite-slope summands; this checkpoint supplies only the algebraic projector component of that chain.

API:

- `rieszRootProjector_formula`: Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier.
- `rieszRootProjector_zero_order`: For h=0 the projector is zero for every a and chosen unit c.
- `rieszRootProjector_fixed_iff`: Under the exact Hasse-order hypotheses, E x=x if and only if v^h x=0.
- `rieszRootProjector_eq_projectionL`: Under the exact Hasse-order hypotheses, there is a native topological-complement proof for ker(v^h) and image(v^h), and E equals its existing Submodule.projectionL.

Unit tests:

- `riesz_order_zero` (degenerate): At order zero the formula gives E=0 on every M, even without the root hypotheses.
- `riesz_scalar_root` (computation): For u=identity on A, a=1, h=1 and c=-1, E is the identity.
- `riesz_diagonal_root` (characterisation): For u=diag(1,0) on the native two-coordinate c0 module, a=1, h=1, c=-1, E=diag(1,0), not its regular complement.
- `riesz_jordan_root` (non-example): For u=I+N with the nonzero two-by-two nilpotent Jordan block N, a=1, h=2, c=1, E=I although 1-u is nonzero. The full generalized eigenspace is required.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Idempotence of the Hasse projector

`LocallyAnalyticDistributions:L4/riesz-projector-idempotence` (lemma).

Under the exact Hasse-order hypotheses, E is idempotent; p=1-E is its complementary idempotent.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:one_sub_dvd_one_sub_pow`, `mathlib:IsIdempotentElem.one_sub`.

Proof or construction:

1. Use vb=bv to write e^h=v^h b^h. The normalized identity and commutation give (1-e)e^h=0, equivalently e^h(1-e)=0.
2. The pinned geometric-sum divisibility gives 1-e^h=(1-e)d. Multiplying by e^h gives e^h(1-e^h)=0, so p^2=p; apply the existing one_sub idempotent lemma to E.
3. The same factorization and v^h(1-e)=0 give v^h E=0. Products Ep=pE=0 and E+p=1 use the baseline idempotent API.

Acceptance: Do not assume e itself idempotent. For the source root of u=J_2(1) plus scalar 2 over Z/3, e is nonzero nilpotent on the first block; 1-e is not idempotent while 1-e^2 is.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Canonical kernel and image summands

`LocallyAnalyticDistributions:L4/riesz-kernel-image` (lemma).

The projector has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `mathlib:LinearMap.IsIdempotentElem.mem_range_iff`.

Proof or construction:

1. v^h E=0 gives image(E) contained in ker(v^h). If v^h x=0 then p x=v^h b^h x=b^h v^h x=0, so E x=x and the reverse inclusion follows.
2. Since p=v^h b^h, image(p) is contained in image(v^h). Conversely v^h E=0 implies v^h=v^h p=p v^h, so p is the identity on image(v^h).
3. Use the baseline image/kernel identities of complementary idempotents to identify ker(E)=image(p). The fixed-vector API follows from the baseline characterization of an idempotent image.

Acceptance: At h=0, ker(v^0)=0 and image(v^0)=M. Uniqueness uses these actual submodules, without choosing a basis or a finite-rank approximation.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Topological Riesz decomposition

`LocallyAnalyticDistributions:L4/riesz-topological-splitting` (theorem).

N=ker(v^h) and F=image(v^h) are closed native A-submodules and topological complements. The constructed E agrees with the native continuous projection onto N along F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isTopCompl`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `mathlib:ContinuousLinearMap.IsIdempotentElem.eq_projectionL`.

Proof or construction:

1. The baseline isTopCompl theorem for a continuous idempotent supplies the topological direct sum, not merely an algebraic complement. Transport it along the kernel/image identifications.
2. The two continuous idempotents have closed images in the Hausdorff module. The baseline projectionL identity gives the native comparison with no new splitting structure.

Acceptance: Closedness of image(v^h) is proved through its idempotent presentation. Do not import real/complex Riesz closed-range theorems, or infer closed range for arbitrary continuous maps. This statement contains no claim of finite generation, projectivity or rank.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Inverse on the regular Riesz summand

`LocallyAnalyticDistributions:L4/riesz-regular-inverse` (theorem).

Both v and b preserve F=image(v^h), and v(bx)=b(vx)=x for every x in F. Their restrictions are mutually inverse continuous A-linear maps of F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`.

Proof or construction:

1. Commutation with v^h proves that v and b map its image into itself. From (1-e)p=0 obtain vb p=p; commutation gives bv p=p as well.
2. Write x=p y on F and evaluate those identities. Restrict the existing continuous A-linear maps to the invariant submodule. This exhibits a continuous inverse, without invoking an open mapping theorem.
3. Serre displays c^(-h)v^(h-1)z_h^h on F when h>0. It equals b on F: b^h v^(h-1)=b(vb)^(h-1), and vb is the identity there. Treat h=0 by vb=bv=1 on M.

Acceptance: The inverse is asserted only on F. In the Jordan test v is nilpotent on N and has no inverse there.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Polynomial closure of Riesz projectors

`LocallyAnalyticDistributions:L4/riesz-projector-closure` (lemma).

E and p belong to the K-operator-norm closure of the actual A-polynomials in u, represented by the existing finite polynomial evaluation formula.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`.

Proof or construction:

1. Each z_h is in that closure by the prior analytic lemma. The identity, scalar endomorphisms and u belong to the polynomial set.
2. In the complete normed ring of K-linear endomorphisms, continuous addition, multiplication and the bounded scalar action show that this closure is closed under subtraction, multiplication and scalar multiplication. Apply these operations to the displayed finite formula for E; p=1-E follows.
3. This uses the already constructed A-linear Hasse value, not a formal infinite Taylor substitution. No convergence or adjugate estimate is inferred from the algebraic formula.

Acceptance: Keep the topology on the actual K-operator norm, as in the Hasse predecessor. No abstract substitute for A[u] is introduced.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Stability under commuting operators

`LocallyAnalyticDistributions:L4/riesz-commuting-stability` (lemma).

Every continuous A-linear endomorphism t commuting with u commutes with E and p, and preserves N=ker(v^h) and F=image(v^h).

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-closure`, `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.commute_iff`.

Proof or construction:

1. A-linear t commutes with each A-polynomial in u. The commutant is closed in the K-operator norm because left and right multiplication by its scalar restriction are continuous.
2. Pass the polynomial commutation equality to E in the closure and then to p=1-E. Apply the existing idempotent commute_iff theorem and the kernel/image identifications for invariance.

Acceptance: No complete-continuity hypothesis on t and no extra source of finite projectivity. This is the stability needed by commuting Hecke operators in the existing slope consumer.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

## Checkpoint and continuation

The packet now has **54 nodes**: 3 definitions, 8 constructions, 23 lemmas,
14 theorems and 6 comparisons. All 45 predecessor statements/hypotheses and
44 complete node objects are preserved; only the existing root theorem's
prerequisites and first proof steps are refined. The thirteen integrated
reviewed IDs and nineteen links remain. There are **40 API entries**, **49
packet tests and typed examples**, **6 planets**, **54 baseline references**,
**8 gaps** and **5 requests**. The eleven definition/construction nodes account
for 36 API entries and 35 tests. No stage is closed.

The suggested file compiles with **zero errors and 128 proof-placeholder
warnings only**. All 1,885 reached Mathlib source files match the pin.
No Tau Ceti or planned supplier module is imported; the explicitly labelled
complete-continuity supplier signature stub is preserved. The signatures
include the actual topological complement and projectionL comparison.
Compilation checks types and does not prove the proposed declarations.

Thirteen complete scratch lemmas prove the ring annihilation/projector
identities and their native continuous-linear-map kernel, image, topological
complement, closedness and inverse consequences, with zero errors, warnings
or placeholders. Exact finite checks pass **6,451,158 assertions** over **28,624
matrix-root systems** modulo 2, 3, 4, 5 and 8. The nonreduced rings are included;
a separate three-dimensional Jordan control rejects replacing the projector's
power h by one. These checks do not establish infinite-dimensional convergence
or finite projectivity.

Resume with the operator adjugate coefficient estimate, finite-projective
rank/determinant and exact-slope arguments; completed tensor products and the
(Pr) exercises; canonical finite-module topology; and spectral-resultant
transport. The actual L0–L3 distribution stages and L4 distribution families,
uniform character radii, semigroup bounds and specialization remain open.
Use the existing PMIA suppliers and preserve the RS-16 ownership boundaries.

## Sources

The packet records the read sections and public versions of [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), [Serre, Endomorphismes complètement continus](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), and [Coleman, P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf). BGR was not acquired. No new published error is asserted; the finite-projective and nonreduced examples above are guards against invalid proof shortcuts in a formalization.

The Buzzard manuscript was fetched again on 27 September 2026 and its SHA-256 verified as `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`. The preceding continuation read manuscript/physical pp. 7–12 and 22–24. The current continuation freshly read full Buzzard pp. 22–24 and Serre printed pp. 78–81 (PDF pp. 11–14), rendering printed p. 81 to check the formulas. The Serre PDF hash is `67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`. Earlier Coleman reading remains inherited provenance; downloading its PDF here is not claimed as a fresh source reading.

The Riesz algebra follow-up freshly read full Buzzard manuscript pp. 23–24 and Serre printed pp. 80–81 from the same hash-verified public PDFs. Earlier broader source readings remain predecessor provenance. No new source error or independent-review verdict is asserted. The native projection declarations were read at the exact Mathlib pin. Tau Ceti's finite-length Fitting result and the real/complex closed-range part of Riesz theory do not provide this Banach-algebra Hasse decomposition.
