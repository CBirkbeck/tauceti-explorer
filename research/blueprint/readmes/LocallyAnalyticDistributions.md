# Locally analytic distributions, growth, and character spaces

This is a **partial blueprint** for the five layers L0–L4. It preserves the thirteen reviewed operator-theory nodes already integrated in the atlas and refines their dependencies. No layer is marked closed. The construction of actual distribution families is not supplied by the abstract Fredholm theory alone.

The ownership decisions of accepted restructuring RS-16 are binding. The base roadmap is **Padic measures and Iwasawa algebras** (`PadicMeasuresIwasawaAlgebras`). Its layer L0a owns scalar character-space representability, component decompositions, universal characters and coordinate changes. This roadmap imports those objects. It owns the unbounded distribution transform, growth theory and distribution-family coefficient actions, including the uniform local radii needed to evaluate a universal character on an affinoid coefficient module. There is no reverse dependency making the scalar character-space construction depend on those distribution families.

## Conventions and existing libraries

Work over a complete nontrivially valued nonarchimedean field K. For the operator theory, A is a nonzero commutative Noetherian K-Banach algebra with a compatible submultiplicative ultrametric norm. Banach A-modules are complete and Hausdorff and have compatible bounded scalar action. A need not be a field, reduced or affinoid. Treat the zero algebra as a separate trivial case.

An operator norm on an A-linear map is its norm after restricting scalars to K. **Finite rank means that the image lies in a finitely generated A-submodule.** It does not mean finite dimension over K or that the containing module is free. Complete continuity means approximation in that operator norm by finite-A-image maps.

The pinned library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists nine Mathlib declarations whose actual source statements were inspected at the pin. In particular, reuse the following rather than reconstructing them:

* `ZeroAtInftyContinuousMap`, its extensionality theorem and completeness instance. For a discrete index type I this is the carrier c_A(I), with its sup norm. I is arbitrary, not necessarily countable.
* `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean`. These supply unconditional summability and multiplication of sums, not just convergence of a chosen enumeration.
* `ContinuousLinearMap.exists_preimage_norm_le` and `ContinuousLinearMap.isOpenMap`. These already apply over nontrivially normed fields, so the Banach open-mapping part of the nonarchimedean argument is not new work.
* `Matrix.det_mul` for finite matrices over a commutative ring.

The inspected definition `IsCompactOperator` is a related but different notion: some neighbourhood has relatively compact image. It is not substituted for complete continuity over A. For example, the A-linear identity of A is finite A-rank even when A is an infinite-dimensional K-affinoid algebra. This is not a claim that its image of a neighbourhood is relatively compact.

The accepted LAD records of `AUDIT-25.result.json` were read because the aggregate `data/library-coverage.json` exceeded the file reader's size limit. Its Tau Ceti search results remain leads, not a fresh exhaustive audit. The open-mapping and c0 reuse above are additional checks against actual pinned source files.

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

**Complete-continuity API.** `finiteImage_isCompletelyContinuous` admits finite-A-image maps; `isCompletelyContinuous_comp` gives the two-sided ideal property; `isClosed_completelyContinuous` identifies the closed approximation class. Tests: `identity_on_A` is admitted even for infinite K-dimension; `identity_on_infinite_c0` is rejected over nonzero A; `decaying_diagonal` admits diag(rho^n) without requiring finite K-rank.

The finite-submodule argument is split into canonical topology, finite coordinate detection and uniform coordinate approximation. For a finite submodule Q and epsilon>0, prove

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

## Checkpoint and continuation

The packet contains 31 nodes: the thirteen retained reviewed IDs and eighteen additions. Its nineteen original links are preserved; the additional dependencies are explicit prerequisites. Definitions and constructions have 27 API entries and 27 discriminating tests. The six L4 planets are orthonormalizable modules, completely continuous operators, the Fredholm determinant, property (Pr), Riesz projectors and finite-slope decomposition.

A continuation must expand the BGR inputs, the spectral resultant transport, finite-projective algebra and Hasse calculus; finish declaration/API granularity; elaborate the suggested Lean interface at the pin; and read/decompose the L0–L3 and actual distribution-family sources. The suggested file is not compiled, and every implementation status remains unchecked. It is a partial signature prototype, not evidence of an implementation or of mathematical closure.

## Sources

The packet records the exact read sections and public versions of [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), [Serre, Endomorphismes complètement continus](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), and [Coleman, P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf). BGR was not acquired. No new published error is asserted; the finite-projective and nonreduced examples above are guards against invalid proof shortcuts in a formalization.
