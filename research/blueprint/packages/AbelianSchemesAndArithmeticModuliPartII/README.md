# Abelian schemes and arithmetic moduli, Part II

This roadmap builds three interfaces for abelian varieties: integral coefficients
for completed Poincaré bundles, real analytic Betti coordinates in families, and
integral realizations over finite fields. These interfaces connect the geometry
of a family to computations that retain its arithmetic information. The first
part constructs universal connections, moments and ordinary CM trivializations.
The second turns Betti rank into a geometric condition on subvarieties and their
fibre powers. The third passes from Frobenius and Tate modules to isogeny classes,
integral lattice orbits and counts of polarized and unpolarized varieties.

The objects must support their natural maps. A completed Poincaré bundle needs
truncations, unit sections, isogeny maps and compatible connections. A Betti map
needs changes of period frame, not just a coordinate formula in one chart. A
lattice classification needs integral morphisms at every prime, including the
characteristic prime. The counting statements use those interfaces rather than
replacing them by finiteness assertions.

## Scope and dependencies

The parent **AbelianSchemesAndArithmeticModuli** owns abelian schemes and their
group laws (A1), duality, Picard and Poincaré geometry, polarizations and Rosati
involutions (A2), isogenies and finite subgroup quotients (A3), relative de Rham
cohomology, its Hodge sequence and Tate systems (A4), complex uniformization and
the Hodge dictionary (A5), and finite-rank Hom groups, characteristic polynomials,
semisimple endomorphism algebras and complete reducibility (A6). These objects
are inputs here. In particular, a second dual abelian scheme, Picard functor,
polarization definition or quotient construction is outside this roadmap.

Use **AlgebraicVectorBundles** for finite locally free sheaves, symmetric and
exterior powers, vector groups and relative Spec. Its locally free sheaf and
vector-group conventions also fix the meaning of the vector kernel in P1.
Use **DifferentialGeometry**, layers 0–1, for differential forms, wedge products
and exterior derivatives; the new calculation in B1 is the particular Betti
form and its kernel. B2's equal-dimensional openness, constant-rank application
and Riemann-surface cover are the auxiliary results required by the curve
argument, rather than a second general theory of forms or distributions.

**SchemeAndStackFoundations**, SF.2 and SF.4, supplies coherent direct images,
formal functions, thickenings and formal completion. **ComplexComparisonPartII**,
C0, supplies analytification and bundle-valued Dolbeault comparison.
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1 and R07.2, supplies the
connected–étale decomposition, finite flat groups, their descent, p-divisible
groups and the contravariant Dieudonné equivalence. The completed Poincaré,
ordinary CM and abelian-variety realization adapters are constructed here.

**PELModuli**, M5–M6, supplies period uniformization and polarized moduli with
level. **HodgeStructuresPartII**, H.2, supplies polarized variations, the fixed
part and equivariant Hodge morphisms. **LogicAndDefinabilityInNumberTheory**,
LD.6, owns the o-minimal, mixed Ax–Schanuel and weakly special theory. B2 and B3
specify its exact uses for abelian families; they do not introduce a competing
mixed Shimura theory. **JacobianChallengePartII**, JC2 and JC7, supplies the
curve difference map and universal-curve setting. The existing **JacobianChallenge**
roadmap supplies the underlying Jacobian and curve Picard geometry.

For arithmetic groups use the current **AdelicAlgebraicGroups** roadmap:
AA.1 constructs adelic points and compact open levels, AA.3 supplies reduction
theory and finite class sets, and AA.4 supplies approximation and level double
quotients. F4 specializes these constructions to the units of an endomorphism
algebra. **GeometryOfNumbersAndQuadraticArithmetic**, GN.2–GN.3, supplies the
local lattice estimates and Hermitian mass estimates. **ClassFieldTheory**,
layers 5, 10 and 13, supplies Brauer invariants, their global compatibility and
norm theorems. **RepresentationTheory/SemisimpleAlgebras**, layers 4–5, supplies
central simplicity and centralizers. **Completed/EffectiveBounds**, layer 1,
supplies number-field discriminant, class-number and unit-index bounds;
**Chebotarev**, layer 14, supplies natural density.
**DeligneWeightsAndPurity**, DWP.0 targets 0.1–0.3 and DWP.1 target 1.4,
supplies pure algebraic numbers and the independent Rosati proof of the abelian
Frobenius root bound. F0 adds integrality and the finite-field classification adapter. None of these general theories
is rebuilt here.

The outputs are the completed-bundle and Betti-rank interfaces used in
Eisenstein–Kronecker and Mordell–Lang arguments, and the finite-field
classification and counting interfaces. This roadmap stops before constructing
Eisenstein–Kronecker classes, proving height inequalities or deriving new
Mordell–Lang bounds. The finite-field part does not claim a sharp unconditional
numerical exponent for the number of unpolarized varieties.

## Conventions

- A geometric abelian scheme is a smooth proper group scheme with geometrically
  connected fibres. Write π : A → S, e for its unit, A∨ for its dual and P for
  the Poincaré bundle rigidified along both units. Unless a target says otherwise,
  P1–P3 use a noetherian base and constant relative dimension d. A♮ denotes the
  universal vector extension **of A∨**. Its vector kernel is ω_A, and
  H = (H¹_dR(A/S))∨ identifies with ω_A♮.
- TSymⁿ_R(M) is the permutation-invariant submodule of the native tensor power.
  Multiplication is the shuffle sum. Symⁿ(M) denotes the usual symmetric-power
  quotient. The two integral objects are kept distinct. Write v^[n] for the
  diagonal invariant tensor; vⁿ = n! v^[n] in the shuffle algebra.
- A hat on the coefficient algebra means the product over degrees. A hat on a
  group or sheaf means completion along the specified unit ideal. Coordinate
  rings are inverse limits; formal functors are filtered unions of thickenings.
  An equality between degree and augmentation-adic topologies requires its own
  hypotheses. Completed tensor products are specified before exchanging limits
  with base change. In P4, O_Cp is used after completed base change from a
  noetherian CM model; it is not assumed noetherian.
- In a Betti chart choose polarization type D = diag(d₁,…,d_g), a period matrix
  Z with positive definite Im Z, and coordinates w = Da + Zb. The map to the
  fixed real torus has coordinates (a,b); it does not include the base point.
  Frame changes act by integral torus automorphisms. Betti ranks are real ranks
  on the smooth analytic locus. Non-degeneracy compares them with **twice the
  total complex dimension** of a subvariety.
- The Betti form is normalized by i∂∂̄(2(Im w)ᵗ(Im Z)⁻¹(Im w)). Thus it is
  2 Σ d_j da_j ∧ db_j, and on a fibre its class is twice the polarization class.
  Keep this normalization in wedge powers, pullbacks and examples.
- The C(S)/C trace and the geometric C(S)bar/C trace are different objects.
  The latter may increase after a finite cover. GH generically special varieties
  allow an arbitrary constant subvariety in the geometric trace. Gao's
  special-generically closure uses a constant section, a torsion translate and
  an abelian subscheme. These notions have separate names and interfaces.
- In F0–F3 let q = p^a, p prime and a ≥ 1. End and Hom are over F_q. Frobenius is
  the q-power endomorphism π_A, so P_A(X) = det(X − π_A). In the descending
  expansion P_A = Σ a_i X^(2g−i), a₀ = 1 and a_(2g−i) = q^(g−i)a_i for i ≤ g.
  Weil numbers are algebraic integers with the required absolute values under
  every complex embedding; arbitrary reciprocal polynomials are not substituted
  for realizable classes.
- C is the contravariant Dieudonné functor: f : A → B induces C(f) : C(B) → C(A).
  Over W(F_q), F is arithmetic Frobenius semilinear and F^a is L-linear, where
  L = W(F_q)[1/p]. End⁰(A)^op occurs on the realization side. Over F_p a
  **linear dual** restores covariant lattice notation; it is not Cartier duality.
- Rational markings are quasi-isogenies B → A₀. Lattice tuples have finite
  support relative to A₀. The characteristic-prime component is transported by
  C(f)⁻¹ before the prime-field linear-dual convention is applied. Unmarked
  classes are rational orbits; an integral lattice need not be a projective
  rank-one module over its order.
- D_* is a product over ordered pairs of unequal **root values**, with their
  occurrences counted. It remains positive for repeated-root characteristic
  polynomials. Local orbit estimates, stabilizer indices and fixed-level class
  numbers are separate inputs. Constants in O_p and O_q may depend on the fixed
  prime or prime power; an error used uniformly across isogeny classes must be
  stated uniformly.

## Library interfaces

Use Mathlib's `TensorPower`, `PiTensorProduct.reindex`, `reindex_tprod` and
`map_reindex` for permutations and tensor functoriality. Form invariant
submodules with `LinearMap.eqLocus` and `Submodule.mem_iInf`. The existing
`DividedPowerAlgebra` is the source of the comparison in P0, rather than a new
presentation of the divided power algebra. Tau Ceti's `symmetricTensors` is the
flip-fixed tensor square; P0 compares it with the degree-two instance of the
all-degree construction.

`AddCircle (1 : ℝ)` is the real circle used in Betti tori. It supplies a torus
fibre, while the period charts and transition maps are constructed in B0.
For resultants use `Polynomial.resultant`; its Sylvester degree arguments are
retained in congruence statements. `PadicInt.appr_spec` supplies coefficient
lifts modulo p^N. Mathlib's natural-valued `PadicInt.valuation` sends zero to
zero, so recognition statements explicitly exclude zero resultants. For F6
evaluate `MvPolynomial.mul_esymm_eq_sum` on the root occurrences; the new work
is the coefficient and reciprocity adapter, not another Newton-identity proof.

## The build

The geometric branches run P0 → P1 → P2 → P3 and P4, and B0 → B1 → B2 → B3 → B4.
The arithmetic branch starts with F0 and the independent polynomial layer F2,
then runs F1 → F3 → F4 → F5 → F6. In particular, polynomial recognition precedes
the characteristic-prime comparison; no counting theorem is used to establish
Tate's theorem. Each target below gives its source and the interfaces it needs.
References to targets within a layer refer to the construction order dictated
by their stated dependencies.

## P0: Symmetric tensors and moment coefficients

The coefficient objects are built over a commutative ring and an arbitrary module; freeness and
projectivity enter only the comparison theorems. Establish the permutation action and the
invariant-submodule interface before defining multiplication. Degree completion is a product of
these modules, so it remains meaningful in positive characteristic.

### Invariant tensor powers

For a commutative ring R, an R-module M and n≥0, TSymⁿ_R(M) is the submodule of TensorPower R n
M fixed by every permutation of Fin n, acting by PiTensorProduct.reindex. It is an invariant
submodule, not the symmetric-power quotient.

**API.**

- `tensorSymmetricPower_mem`: t∈TSymⁿ(M) iff reindex σ(t)=t for every σ.
- `tensorSymmetricPower_diagonal`: The pure tensor with every factor v lies in TSymⁿ(M).
- `tensorSymmetricPower_map`: An R-linear f:M→N induces TSymⁿ(f):TSymⁿ(M)→ₗ[R]TSymⁿ(N) by
tensoring every factor.
- `tensorSymmetricPower_ext`: Two elements of TSymⁿ(M) are equal iff their ambient tensors are
equal.

**Checks.**

- `tensorSymmetricPower_zero`: TSym⁰(M)=⊤ in TensorPower R 0 M.
- `tensorSymmetricPower_one`: TSym¹(M)=⊤ in TensorPower R 1 M, hence agrees with M through the
native singleton tensor equivalence.
- `tensorSymmetricPower_nonfixed`: For M=ℤ² the pure tensor e₀⊗e₁ is not in TSym²(M); swapping
it gives e₁⊗e₀, distinguished by the coordinate functional.

**Source.** [KS][KS], Definition 1.6, PDF pp.8–9.

**Needs.** `TensorPower`; `PiTensorProduct.reindex`; `LinearMap.eqLocus`; `Submodule.mem_iInf`;
`PiTensorProduct.reindex_tprod`; `PiTensorProduct.map_reindex`.

### Degree completion of symmetric tensors

Define the degree-completed module TSym̂_degree(M)=∏_{n≥0} TSymⁿ(M), with the product/degree
filtration, and finite truncation ∏_{n≤N}TSymⁿ(M). No identification with I-adic completion over
an arbitrary integral base is part of this definition.

**API.**

- `degreeCompletion_component`: For c:∏n TSymⁿ(M), component_n(c)=c(n).
- `degreeCompletion_ext`: c=d iff c(n)=d(n) for every n.
- `degreeCompletion_zero`: Every component of the zero completed sequence is zero.

**Checks.**

- `degreeCompletion_zero_component`: The component in degree zero of the zero sequence is zero.
- `degreeCompletion_single`: For a sequence supported in degree n with value x, its n-th
component is x and every other component is zero.
- `degreeCompletion_product`: The carrier and module operations agree with the native dependent
Pi module on n↦TSymⁿ(M).

**Source.** [KS][KS], Equation(2.1.3), PDF p.14.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers.

### Shuffle multiplication and divided powers

For tensors invariant under S_m and S_n, sum over (m,n)-shuffles to obtain
TSym^m(M)×TSym^n(M)→TSym^(m+n)(M). It is associative and commutative; diagonal divided tensors
satisfy v^[m]v^[n]=binom(m+n,m)v^[m+n] and v^n=n!v^[n].

**API.**

- `tensorSymmetricAlgebra_mul`: On ⊕n TSym^n(M), multiply degree m,n by the sum over
(m,n)-shuffles.
- `tensorSymmetricAlgebra_unit`: The unit is 1 in degree zero, using the native empty tensor
equivalence.
- `tensorSymmetricAlgebra_divided`: For diagonal tensors v^[n], v^[m]v^[n]=binom(m+n,m)v^[m+n].

**Checks.**

- `tensorSymmetricAlgebra_zero_degree`: The degree-zero subalgebra is the native base ring R.
- `tensorSymmetricAlgebra_char_two`: For M=F₂·v, the shuffle square v·v is zero, but v^[2] is
nonzero; ordinary tensor concatenation would fail this test.
- `tensorSymmetricAlgebra_free`: For a free module, the construction agrees with the existing
DividedPowerAlgebra via the diagonal comparison below.

**Source.** [KS][KS], Definition 1.6 continuation, PDF p.9.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers.

### Comparison with the degree-two invariant submodule

Under the native PiTensorProduct binary tensor equivalence, TSym²_R(M) is
TauCeti.symmetricTensors R M, the eqLocus of TensorProduct.comm and identity. This compares
invariant submodules; it does not identify the invariant lattice with the coinvariant
SymmetricPower quotient integrally.

**Source.** [KS][KS], Definition 1.6, PDF pp.8–9.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
`TauCeti.symmetricTensors`.

### Comparison with the existing divided power algebra

For a free R-module M, the diagonal divided tensors extend to a graded algebra isomorphism
DividedPowerAlgebra R M≃TSym_R(M), using shuffle multiplication. For nonfree M only the natural
comparison is asserted, with its universal-property hypotheses.

**Source.** [KS][KS], Definition 1.6 continuation, PDF p.9.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and
divided powers; `DividedPowerAlgebra`.

### Multigrading of invariant tensors

For a finite family of finitely generated projective R-modules Mσ and M=⊕σ Mσ, there is a
natural multigraded isomorphism TSym^k(M)≃⊕_{|α|=k}⊗σ TSym^{α(σ)}(Mσ). For a vector v with
components vσ, its α-component is ⊗σ vσ^[α(σ)]. The corresponding sheaf statement holds for
finite locally free summands. No such isomorphism for arbitrary nonflat summands is asserted.

**Source.** [KS][KS], Definition 1.6 and displayed multigrading, PDF pp.8–9.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
[P0](#p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and divided powers.

### Construction requirements

For shuffle multiplication, index representatives of S_(m+n)/(S_m × S_n) and prove independence
of representatives, invariance and the three-block shuffle bijection. That bijection gives
associativity; exchanging the two blocks gives commutativity. Compare diagonal tensors with the
relations of the existing divided power algebra. For multigrading use orbit sums in local bases
of the finite projective summands and glue by naturality. Do not infer a multigraded
decomposition for nonflat summands. Truncation gives the degree topology directly; an
augmentation-adic comparison must carry a cofinality hypothesis, such as the finite-generation
and factorial-invertibility assumptions that identify the shuffle algebra with a symmetric
algebra. The integral moment constructions below only use degree truncations.

## P1: Universal vector extensions

The underlying dual and rigidified Poincaré bundle come from A2. The new object represents the
extra datum of a relative integrable connection. Its universal property determines the vector
extension and its functoriality; the Hodge identification then determines the connection on its
cotangent sheaf.

### Universal vector extension of the dual

Let A/S be an abelian scheme over a noetherian base. Construct a smooth commutative S-group A♮
representing rigidified line bundles on A_T equipped with an integrable T-relative connection
and satisfying the theorem of the square. Forgetting the connection gives an exact sequence 0 →
V(ω_A) → A♮ → A∨ → 0. The universal line bundle with connection P♮ has underlying rigidified
bundle (id_A × p)^*P. Thus the represented extension has quotient A∨ and vector kernel ω_A.

**API.**

- `universalVectorExtension_forget`: p sends a rigidified pair (L,∇) to the class of L in A∨.
- `universalVectorExtension_kernel`: ker p is the vector group associated to ω_A.
- `universalVectorExtension_represent`: Hom_S(T,A♮) is naturally the group of rigidified
square-compatible line bundles with integrable relative connection on A_T.
- `universalPoincare_pullback`: The underlying line bundle of P♮ equals (id×p)^*P with its
rigidification.

**Checks.**

- `universalVectorExtension_zero`: For the zero-dimensional abelian scheme the representing
group and vector kernel are trivial.
- `universalVectorExtension_elliptic`: For an elliptic scheme the vector kernel has rank one and
Lie(A♮) has rank two.
- `universalVectorExtension_dual`: The forgetful target is the imported dual A∨ and the
underlying universal sheaf is the imported Poincaré sheaf, not a newly defined Picard functor.

**Source.** [KS][KS], Notation 2.2, PDF p.13.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A1; **AbelianSchemesAndArithmeticModuli**, A2;
**AbelianSchemesAndArithmeticModuli**, A4; [AlgebraicVectorBundles,
L0B](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves);
[AlgebraicVectorBundles,
L2A](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md#l2a--structured-linear-schemes).

### Lie and cotangent identifications

Lie(A♮/S)≃H¹_dR(A/S) identifies 0→ω_A→Lie(A♮)→Lie(A∨)→0 with the Hodge exact sequence. Its dual
identifies H=(H¹_dR)∨ with ω_A♮ and the dual Gauss–Manin connection.

**Source.** [KS][KS], Notation 2.2 and equation(2.1.1), PDF p.13.

**Needs.** [P1](#p1-universal-vector-extensions), Universal vector extension of the dual;
**AbelianSchemesAndArithmeticModuli**, A4.

### Construction requirements

Construct the fppf moduli functor of rigidified line bundles with relative integrable connection
and the square condition. Prove its representability, the universal connection and the
identification of the forgetful kernel with the vector group of ω_A. The representability
theorem and the universal-class comparison are part of this construction, not consequences of
assigning a name to the functor. Differentiate the extension and identify its class with the de
Rham Hodge extension, including rigidifications, the sign of the universal class and base-change
compatibility. Dualize only after establishing that the sheaves are finite locally free.
Kings–Sprang, Notation 2.2 and equation (2.1.1), p.13, locates the resulting interface and cites
the Mazur–Messing/Laumon construction.

## P2: Completed Poincaré bundles

Complete along the dual unit, retaining the finite pushforward system. Moments turn formal
coefficients into invariant tensors. Functoriality and torsion splittings come from the
rigidified biextension, while top cohomology uses the normalized Poincaré transform and formal
functions.

### Moments of a formal smooth group

For a separated smooth commutative group G/S of finite presentation, with closed unit section e,
its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor
O_G/J²→ω_G gives mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G), compatible with truncation; their inverse
limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms.

**API.**

- `momentMap_truncate`: Projection from the n-th to the m-th formal neighborhood commutes with
moments for m≤n.
- `momentMap_degree_one`: The degree-one component is the canonical projection O_G/J²→ω_G.
- `momentMap_functorial`: A homomorphism of smooth commutative groups commutes with moments
through its invariant cotangent map.

**Checks.**

- `momentMap_zero`: At n=0 the moment map is the identity of O_S.
- `momentMap_additive_char_zero`: For G_a over a Q-algebra, x^n maps to n! times the nth
invariant divided tensor.
- `momentMap_additive_char_p`: For G_a over F_p, the degree-p associated-graded map sends x^p to
zero because p!=0; the integral moment map is not automatically an isomorphism.

**Source.** [KS][KS], Equation(2.1.2), moment construction and Remark 2.3, PDF pp.13–14.

**Needs.** [P0](#p0-symmetric-tensors-and-moment-coefficients), Invariant tensor powers;
[P0](#p0-symmetric-tensors-and-moment-coefficients), Degree completion of symmetric tensors;
**SchemeAndStackFoundations**, SF.4.

### Finite and completed Poincaré sheaves

For a coherent sheaf F on a smooth group G with unit ideal J, construct its unit completion from
the inverse system F ⊗ O_G/J^(n+1), restricted to the unit space, and compare it with pullback
to the formal completion. For A, put P^(n) = (id_A ×
π∨^(n))_*(P|_(A×A∨^(n))) and P̂ = lim_n P^(n). Perform the same construction on A♮ to obtain
P♮^(n), P̂♮ and their integrable relative connections. The rigidifications identify degree zero
with O_A. For n≥1, prove the truncation sequences
0 → π^*Sym^n(ω_A∨) → P^(n) → P^(n−1) → 0 and
0 → π^*Sym^n(H) → P♮^(n) → P♮^(n−1) → 0.
Their compatible unit sections induce O_S → e^*P̂ ≃ O_Â∨ and
O_S → e^*P̂♮ ≃ O_Â♮. Construct the unit-compatible maps P^(n) → P♮^(n) and identify
P♮^(n) with P^(n) ⊗_(O_(A×A∨^(n))) O_(A×A♮^(n)). All limits use the specified finite
pushforwards; tensor interchange with an arbitrary inverse limit is a separate assertion.

**API.**

- `completedPoincare_truncate`: P_hat→P(n) is the projection to the n-th infinitesimal dual
neighborhood, and similarly for P♮.
- `completedPoincare_unit`: Rigidification gives the compatible unit sections O_S→e^*P(n).
- `completedPoincare_filtration`: The nth kernel is π^*Sym^n(ω_A∨), respectively π^*Sym^n(H) in
the connection version.

**Checks.**

- `completedPoincare_zero`: P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.
- `completedPoincare_first`: P(1) is an extension of O_A by π^*ω_A∨ with the imported unit
rigidification.
- `completedPoincare_base`: At every finite level the underlying sheaf is pushforward of the
imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power
replacement.

**Source.** [KS][KS], Definitions 2.4/2.7 and equations(2.1.4)–(2.1.5), PDF pp.14–16.

**Needs.** [P1](#p1-universal-vector-extensions), Universal vector extension of the dual;
[P2](#p2-completed-poincaré-bundles), Moments of a formal smooth group.

### Fourier–Mukai input for completed Poincaré cohomology

For a noetherian S and an abelian scheme A/S of constant relative dimension d, establish the
normalized Poincaré transform, its formal-functions comparison at the dual unit, and the
derived/ordinary completion comparison. After twisting by Ω^d_A/S these identify Rπ_*(P̂ ⊗
Ω^d_A/S) with O_S[−d]. The assertion includes the inverse-limit comparison needed to compute
completed, rather than only finite-level, cohomology.

**Source.** [KS][KS], Theorem 2.15 and its proof, PDF pp.18–19.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A2; **SchemeAndStackFoundations**, SF.2;
[P2](#p2-completed-poincaré-bundles), Finite and completed Poincaré sheaves.

### Isogeny functoriality of completed Poincaré sheaves

For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions
(equation (2.2.1)) give canonical maps φ^{(n)}_# : 𝒫^{(n)}_𝒜 → φ^*𝒫^{(n)}_ℬ and 𝒫^{♮(n)}_𝒜 →
φ^*𝒫^{♮(n)}_ℬ, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in
the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ.

**Source.** [KS][KS], Theorem 2.8 and proof, PDF p.16.

**Needs.** [P2](#p2-completed-poincaré-bundles), Finite and completed Poincaré sheaves;
**AbelianSchemesAndArithmeticModuli**, A3.

### Canonical torsion splittings and moments

For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces φ_{#x} : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅
e^*𝒫̂_ℬ ≅ 𝒪_{ℬ̂^∨}; if φ^∨ is étale, 𝒫̂_𝒜|_{ker φ} ≅ π^*_{ker φ}𝒪_{ℬ̂^∨} and there is a
canonical ϱ_x : x^*𝒫̂_𝒜 ≅ 𝒪_{𝒜̂^∨}; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the
moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → TSym^̂(ω_{𝒜^∨}) and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components
_ϱmom^b_x.

**Source.** [KS][KS], Corollary 2.9 and Definition 2.10, PDF p.17.

**Needs.** [P2](#p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; [P2](#p2-completed-poincaré-bundles), Moments of a formal smooth group.

### Equivariant structure under relative automorphisms

If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, (γ_#)^{-1} : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮
make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves.

**Source.** [KS][KS], Corollary 2.11, PDF p.17.

**Needs.** [P2](#p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; **SchemeAndStackFoundations**, SF.2.

### Poincaré comultiplication and symmetric levels

There are canonical 𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)} and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose
associated graded is induced by the diagonal of ω_{𝒜^∨} (Proposition 2.12, reflecting the
partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence 𝒫^{(n)} →
TSym^n_{𝒪_𝒜}(𝒫^{(1)}) and 𝒫^{♮(n)} → TSym^n(𝒫^{♮(1)}), isomorphisms if n! is invertible on 𝒮
(Corollary 2.14).

**Source.** [KS][KS], Proposition 2.12 and Corollary 2.14, PDF pp.17–18.

**Needs.** [P2](#p2-completed-poincaré-bundles), Isogeny functoriality of completed Poincaré
sheaves; [P0](#p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and divided
powers.

### Top cohomology of the ordinary completed Poincaré sheaf

For an abelian scheme π:A→S of constant relative dimension d over a noetherian base,
R^iπ_*(P_hat⊗Ω^d_A/S)≃O_S when i=d and is zero for i≠d, compatibly with the rigidification. This
is the completed ordinary Poincaré sheaf. The connection/logarithm variant mentioned in Remark
2.16 is a separate comparison obligation; it is not asserted to have this identical underlying
coherent-cohomology formula.

**Source.** [KS][KS], Theorem 2.15 and proof, PDF pp.18–19.

**Needs.** [P2](#p2-completed-poincaré-bundles), Fourier–Mukai input for completed Poincaré
cohomology.

### Construction requirements

Use smoothness to identify J^n/J^(n+1) with Sym^n(ω_G). Project the iterated coproduct to the
split first infinitesimal neighbourhood and prove symmetry and truncation compatibility. The
associated-graded map is symmetrization: its orbit-sum coefficient for multiplicities α is ∏
α_j!, with n! for a diagonal monomial. This proves the rational isomorphism and explains the
characteristic-p failure. For completed cohomology prove the normalized transform R pr∨_*P =
e∨_*(det ω_A∨)^−1[−d], apply proper formal functions along e∨ and compare the derived and
ordinary inverse limits. Grothendieck duality identifies det ω_A with det ω_A∨, cancelling the
line after the Ω^d twist. These comparisons must be established over the noetherian base before
reading the cohomology groups; finite-level vanishing alone is insufficient. The normalization
and formal-functions route are Kings–Sprang, Theorem 2.15, pp.18–19. Equivariance uses coherent
pullback and identity/composition maps from SF.2.

## P3: Logarithm and smooth realizations

Over a characteristic-zero field the first logarithm extension is characterized by an identity
class and a chosen unit splitting. The universal connection supplies that class. Over ℂ its
smooth realization becomes an explicit connection on truncated invariant tensors, with a
compatible Dolbeault resolution.

### Square-zero deformation and the logarithm class

For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies
ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections,
compatibly with the split unit. Taking M=H and id_H gives Log¹.

**Source.** [KS][KS], Theorem 2.36 proof and equation(2.7.2), PDF pp.28–29.

**Needs.** [P1](#p1-universal-vector-extensions), Universal vector extension of the dual;
[P1](#p1-universal-vector-extensions), Lie and cotangent identifications.

### The smooth d+ν connection

Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj
ω). On ⊕_{k≤n}TSym^k(H) the connection d+ν has the same rigidified first extension as P♮(1) and
induces the higher symmetric constructions.

**Source.** [KS][KS], Definitions 3.2–3.3 and Theorem 3.5, PDF pp.30–32.

**Needs.** [P3](#p3-logarithm-and-smooth-realizations), Square-zero deformation and the
logarithm class; [P0](#p0-symmetric-tensors-and-moment-coefficients), Shuffle multiplication and
divided powers; **AbelianSchemesAndArithmeticModuli**, A5.

### Comparison with the logarithm sheaf

Let S = Spec k with char k = 0. Define Log^(1) as the integrable-connection extension of O_A by
π^*H whose image in Hom_k(H,H) is id_H, together with a fixed splitting at e. Use the
local-to-global sequence 0 → Ext¹_DS(O_S,H) → Ext¹_DA(O_A,π^*H) → Hom_DS(H,H) → 0 to
characterize it. Set Log^(n) = Sym^n(Log^(1)) with the compatible unit sections and transition
maps, and Log = lim_n Log^(n). Prove a canonical isomorphism of connections and unit splittings
Log^(1) ≃ P♮^(1), and hence Log ≃ P̂♮. The square-zero tangent comparison sends ker(A♮(k⊕M) →
A♮(k)) ≃ Lie(A♮) ⊗ M ≃ Hom_k(H,M) to the corresponding rigidified Ext class; at M = H it sends
id_H to the first logarithm class.

**Source.** [KS][KS], Theorem 2.36, PDF pp.28–29.

**Needs.** [P3](#p3-logarithm-and-smooth-realizations), Square-zero deformation and the
logarithm class; [P2](#p2-completed-poincaré-bundles), Poincaré comultiplication and symmetric
levels.

### Smooth tensor model and Dolbeault resolutions

Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) corresponding
to ∂/∂z̄_i, ∂/∂z_i (the differential forms are the dual basis) (Definition 3.3), ν = ν^{1,0} +
ν^{0,1} ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles 𝒫^{(n)},
𝒫^{♮(n)} ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms
(𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν) restricting to 𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄))
and compatible with the moment map along e. Corollary 3.6: 𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•},
∇″) and (𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″) (Dolbeault resolutions).

**Source.** [KS][KS], Definition 3.3, Theorem 3.5 and Corollary 3.6, PDF pp.31–33.

**Needs.** [P3](#p3-logarithm-and-smooth-realizations), The smooth d+ν connection;
[P3](#p3-logarithm-and-smooth-realizations), Comparison with the logarithm sheaf;
**ComplexComparisonPartII**, C0.

### Construction requirements

Use the square-zero tangent functor of A♮ to construct the rigidified connection extension.
Verify the sign and identity class in the local-to-global Ext sequence rather than identifying
abstract vector spaces alone. Propagate the first-level comparison through factorial-invertible
symmetric powers and their transition maps. In the complex model the chosen H-basis consists of
tangent vectors; forms belong to the dual basis. Compute both Hodge components of the identity
tensor ν and show that ∇″ preserves the ordinary Poincaré subbundle. The bundle-valued ∂̄
Poincaré lemma and analytification comparison from C0 then give the Dolbeault
quasi-isomorphisms. Kings–Sprang, Theorem 2.36 and equations (2.7.1)–(2.7.2), pp.28–29, and
Theorem 3.5/Corollary 3.6, pp.31–33, fix these comparison requirements.

## P4: Ordinary CM formal trivializations

The integral statement is obtained from the connected ordinary CM torsion and a dual-étale
splitting. Base change is completed before taking the formal coefficient limit. The moment maps
are injective integrally and become isomorphisms on the generic fibre; the projected connection
and translation diagrams retain that distinction.

### Ordinary CM completion and completed base change

Start with the noetherian CM model (A/R,Σ,ω(A),ω(A∨),x) of Notation 5.1: Frac(R) is a number
field containing L^Gal, p is prime and not a unit in R, d_L is a unit, Σ_p and conjugate Σ_p are
disjoint, and x is killed by an ideal prime to p. Fix the indicated map R→O_Cp, base change and
complete. The ordinary connected p-divisible subgroup is the formal part used by the
infinitesimal trivialization; no noetherian assertion about O_Cp is used.

**Source.** [KS][KS], Notation 5.1 and Proposition 5.9, PDF pp.55–56,59–60.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A4;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.

### Ordinary infinitesimal trivialization and projected connection

In the ordinary CM setting over O_Cp, let C_n = A[𝔭_Σ^n]. Its formal filtered union is Â, while
coordinate rings have the inverse-limit direction. Dual étaleness of [𝔭_Σ^n] permits the
diagonal torsion splitting over A × C_n. Passing compatibly to the limit trivializes P̂ on Â
with coefficient ring O_((A×A∨)^∧). The first levels become O_Â ⊗ (O_Cp ⊕ ω_A∨) and O_Â ⊗
(O_Cp ⊕ H). Moments give integral injections into the corresponding completed invariant-tensor
coefficient modules. On the Cp generic fibre these are isomorphisms; on that fibre construct the
Hodge retraction r of i : P̂ → P̂♮ and show that r ∇ i becomes the ordinary differential on the
formal coefficient ring. The [p]_# calculation eliminates the unwanted Hodge component; the
symbol for the retraction is distinct from the prime p.

**Source.** [KS][KS], Proposition 5.9, equations(5.2.1)–(5.2.4), Lemma 5.11, PDF pp.59–61.

**Needs.** [P4](#p4-ordinary-cm-formal-trivializations), Ordinary CM completion and completed
base change; [P2](#p2-completed-poincaré-bundles), Canonical torsion splittings and moments;
[P1](#p1-universal-vector-extensions), Lie and cotangent identifications;
[P2](#p2-completed-poincaré-bundles), Poincaré comultiplication and symmetric levels.

### Torsion translations of the ordinary trivialization

For y ∈ 𝒜(𝒪_{ℂ_p}) in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the
generic fibre; Lemma 5.12), and ϱ̂_y : T_y^*𝒫̂|_{𝒜̂} ≅ 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Definition
5.13). Lemma 5.14: (1) mom_{Â^∨} ∘ e^*ϱ̂_y = mom_{Â^∨} ∘ ϱ_y = ϱmom_y; (2) ϱ̂_y ∘ p ∘ ∇ ∘ i =
d_Â ∘ ϱ̂_y; (3) for s ∈ 𝒜̂[p^n](𝒪_{ℂ_p}) = 𝒜[𝔭_Σ^n](𝒪_{ℂ_p}), translation by s intertwines ϱ̂_y
and ϱ̂_{y+s} with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny
with étale dual; the generic-fibre extension here is for torsion y, not for every point.

**Source.** [KS][KS], Lemmas 5.12/5.14 and Definition 5.13, PDF pp.62–63.

**Needs.** [P4](#p4-ordinary-cm-formal-trivializations), Ordinary infinitesimal trivialization
and projected connection; [P2](#p2-completed-poincaré-bundles), Canonical torsion splittings and
moments.

### Construction requirements

Identify the formal functor with the filtered union of the connected CM kernels C_n, and
identify its coordinate ring with the corresponding inverse limit. Prove the completed
base-change comparison from the chosen noetherian model to O_Cp; ordinary tensoring need not
commute with the limit. Apply the splitting principle to the diagonal section over each C_n and
pass to the compatible limit. On the generic fibre use factorial invertibility, the ordinary
Hodge splitting and the algebraic computation with [p]_# to eliminate the unwanted connection
component. Use a distinct name for the Hodge retraction and for the rational prime p. For a
torsion translation, compare the moment-composed splitting at the unit, the projected
differential and the connected-torsion translation action separately. Kings–Sprang, Proposition
5.9, equations (5.2.1)–(5.2.5), Lemmas 5.11–5.14 and Definition 5.13, pp.59–63, give the three
compatibility diagrams.

## B0: Period coordinates and Betti maps

Choose a symplectic period frame on a simply connected analytic neighbourhood of the smooth
complex base. Construct the inverse period parametrization as a real analytic torus
trivialization. The Betti projection, its integral frame transitions and its holomorphic leaves
then become intrinsic interfaces.

### Period-coordinate trivializations

For a polarized abelian scheme A→S of relative dimension g over a smooth irreducible
quasi-projective complex variety S, choose connected simply connected U⊂S^an and a symplectic
lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives
(a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic
manifolds. b_U alone is projection to the torus.

**API.**

- `periodCoordinates_betti`: b_U is the torus-coordinate projection, excluding the base
coordinate.
- `periodCoordinates_fibre`: The restriction b_U:A_s^an→(R/Z)^(2g) is an analytic group
isomorphism.
- `periodCoordinates_leaf`: For fixed torus coordinate β, s↦(b_U,π)^−1(β,s) is holomorphic.
- `periodCoordinates_transition`: Two choices on connected U differ by a constant element of
GL_(2g)(Z); these are automorphisms, not arbitrary endomorphisms.

**Checks.**

- `periodCoordinates_point`: Over a point the torus-coordinate map is the imported complex
uniformization expressed in real period coordinates.
- `periodCoordinates_zero`: The zero section has Betti coordinate zero.
- `periodCoordinates_base_not_counted`: On a constant family over a positive-dimensional U, db_U
annihilates the base directions although d(b_U,π) is invertible.

**Source.** [DGH][DGH], Proposition 2.1 and PropositionB.2 proof, PDF pp.8–9,41–42.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A5; `AddCircle`; **PELModuli**, M5;
**PELModuli**, M6; **ComplexComparisonPartII**, C0.

### Birational invariance of generic Betti rank

A birational base change between irreducible complex bases identifies generic real Betti rank on
the corresponding dominating subvarieties.

**Source.** [DGH][DGH], LemmaB.3, PDF pp.42–43.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations.

### Construction requirements

Build the relative period chart on the imported complex abelian-family carrier, using A5, C0 and
the moduli uniformizations M5–M6. Prove that the combined map (b_U,π) is invertible while b_U
alone forgets the base coordinate. Check the polarization matrix in the lattice and torus
coordinates. Birational rank invariance is proved on the common dense open where the maps agree;
no rank statement is propagated across exceptional loci.

## B1: Betti forms and non-degeneracy

Compute the Betti form in a period chart, descend it through the arithmetic action and pull it
back to the family. The central lemma identifies its pointwise kernel with the kernel of the
Betti differential. Closedness, positivity and multiplication are properties of this one form,
with a fixed factor-two normalization.

### The descended Betti form

For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im
w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic
semidirect action to the universal family and pulls back to A/S. For type D, in coordinates
w=Da+Zb, the same calculation gives ω=2∑ d_j da_j∧db_j. On each fibre this is twice the
translation-invariant form representing the polarization class; retain this factor-two
normalization.

**API.**

- `bettiForm_pullback`: The form on A is the pullback of the universal Betti form in the chosen
polarization type.
- `bettiForm_closed`: dω=0 and ω has type (1,1).
- `bettiForm_nonnegative`: ω is semipositive on each complex tangent space.
- `bettiForm_scale`: For every N∈Z, [N]^*ω=N²ω.

**Checks.**

- `bettiForm_elliptic`: For w=a+τb, the principal elliptic Betti form is 2 da∧db.
- `bettiForm_zero_multiplication`: [0]^*ω=0, while [−1]^*ω=ω.
- `bettiForm_single_fibre`: On a single fibre, with the factor-two normalization, ω is twice the
translation-invariant positive (1,1) form representing the principal polarization class.
- `bettiForm_nonprincipal_type`: For polarization type diag(1,2), in the corresponding period
coordinates the two coordinate real two-tori have ω-periods 2 and 4; replacing D by the identity
fails.

**Source.** [DGH][DGH], Lemmas 2.3–2.6, PDF pp.9–11.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations.

### Pointwise kernel and rank identity

At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of
db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when
rank_R db_U=2 dim_CX.

**Source.** [DGH][DGH], Equation(2.1) and Proposition 2.7, PDF pp.9–12.

**Needs.** [B1](#b1-betti-forms-and-non-degeneracy), The descended Betti form.

### Non-degenerate subvarieties

For a polarized abelian scheme A→S over an irreducible quasi-projective complex variety, an
irreducible X⊂A is non-degenerate if there are a Betti neighborhood U⊂(S^sm)^an and x∈X^sm∩A_U
with rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere
on this regular-base locus. The dimension is total complex dimension, including base directions.
For Qbar varieties use the fixed embedding into C. No condition is inferred for a subvariety
entirely over the singular locus from a nonexistent manifold trivialization there.

**API.**

- `nonDegenerate_rank`: Non-degeneracy iff generic real Betti rank equals twice total complex
dimension.
- `nonDegenerate_form`: Non-degeneracy iff ω^dim_CX is nonzero on X^sm.
- `nonDegenerate_smooth_point`: A non-degenerate X has a smooth nonvanishing point over a smooth
point of π(X).

**Checks.**

- `nonDegenerate_single_fibre`: Every irreducible subvariety of a single polarized abelian
variety over a point is non-degenerate.
- `nonDegenerate_diagonal`: For an elliptic family E over a curve, Δ(E)⊂E×_S E has dim_C=2 and
real Betti rank≤2, so is degenerate.
- `nonDegenerate_torsion`: A torsion section over a positive-dimensional base has locally
constant Betti coordinates and is degenerate.

**Source.** [DGH][DGH], Definition 1.5 and DefinitionB.4, PDF pp.5,43.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity.

### Betti-form criterion for maximal rank

Let A → S be a principally polarized abelian scheme over a smooth irreducible complex
quasi-projective variety, equipped with symplectic level-ℓ structure for some ℓ ≥ 3. Let X ⊆ A
be irreducible of dimension d and Δ ⊆ S^an a nonempty open Betti domain meeting X^sm. Then the
restricted top wedge ω^d is not identically zero on X^sm if and only if the maximum real rank of
d(b_Δ|X^sm) on X^sm ∩ A_Δ equals 2d. On the universal family this is the same criterion with the
universal form; the family statement is obtained by pullback.

**Source.** [DGH][DGH], Proposition 2.2(iii), Proposition 2.7 and equations(2.5)–(2.7), PDF
pp.8,11–13.

**Needs.** [B1](#b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity;
[B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### Non-vanishing of the top power of the Betti form on a non-degenerate subvariety

Let X⊂A→S be non-degenerate in the regular-base sense of Definition B.4. Then there is z∈X^sm(C)
over S^sm with (ω|_X)^(∧dim_C X)_z≠0. One may also choose π(z) in the regular locus of the
reduced closure of π(X). The latter choice uses that X dominates this image and the maximal-rank
locus meets its dense open preimage.

**Source.** [GGK][GGK], Proposition 5.2 proof, Step 1, equation(5.4), printed pp.212–213 (PDF
pp.25–26).

**Needs.** [B1](#b1-betti-forms-and-non-degeneracy), Pointwise kernel and rank identity;
[B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### Construction requirements

Use Y = Im Z > 0 in the Hessian calculation. Its null directions satisfy dw − dZ·b = D da + Z db
= 0, which is equivalent to da = db = 0. Restrict this positive Hermitian form to the complex
tangent space of X to obtain the real rank equality and wedge criterion. Use real analyticity
and the identity theorem on the regular locus to pass from one nonzero top wedge to generic
maximal rank. Keep the regular-base restriction when selecting a full-rank smooth point. DGH,
Lemmas 2.3–2.6 and Proposition 2.7, pp.9–12, provide the local computations and generic-rank
argument.

## B2: Curve monodromy and constant traces

The curve argument combines local Betti leaves, monodromy and the constant trace. Construct
trace functors and closed torus characters before using definability. Keep actual and geometric
traces separate, and use the fixed-part theorem only with an equivariant Hodge morphism.

### Degeneracy over a curve

For an irreducible closed subvariety Y⊂A over a smooth irreducible complex curve S, a smooth
point x∈Y^sm∩A_U is degenerate when it is not isolated in the local fibre of b_U restricted to
Y^sm∩A_U. Y is curve-degenerate when these points contain a nonempty relatively open subset of
this smooth locus. The vertical case is included in this definition; any curve-degenerate Y
necessarily dominates S.

**API.**

- `curveDegenerate_point`: DegenerateAt(x) iff x is nonisolated in its local Betti fibre.
- `curveDegenerate_open`: CurveDegenerate(Y) iff a nonempty open subset of Y consists of
degenerate points.
- `curveDegenerate_rank`: On the smooth generic constant-rank locus curve degeneracy is the
failure of the total-dimension Betti rank criterion.

**Checks.**

- `curveDegenerate_torsion`: A torsion section over a curve is curve-degenerate.
- `curveDegenerate_fibre`: A smooth subvariety contained in one fibre has isolated local Betti
fibres and is not curve-degenerate.
- `curveDegenerate_full_family`: A constant abelian family over a curve is curve-degenerate,
despite positive definite form on each individual fibre.

**Source.** [GH][GH], §5 definition and Lemma 6.2, PDF pp.18,31.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### Function-field trace and constant part

For K=C(S) and an abelian variety A/K, a C-trace is an abelian variety T/C with a K-homomorphism
τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has
finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported
Poincaré reducibility. Universal equivariant Hom, not all fibrewise Hom, detects this trace.
Also construct the trace over Kbar/C for a chosen algebraic closure Kbar of K. The latter is the
geometric trace used in Definition 1.2; it can grow after finite extension and is not identified
with the K/C trace without an explicit descent argument.

**API.**

- `functionFieldTrace_map`: τ:T_K→A is the universal homomorphism from the constant trace.
- `functionFieldTrace_universal`: For every B/C, Hom_C(B,T)→Hom_K(B_K,A), f↦τ∘f_K, is a
bijection.
- `functionFieldTrace_complement`: In characteristic zero there is an abelian complement B and a
K-isogeny T_K×B→A.

**Checks.**

- `functionFieldTrace_constant`: The C-trace of a constant B_K is B with identity map.
- `functionFieldTrace_zero`: The zero abelian variety has zero trace.
- `functionFieldTrace_nonconstant`: For a non-isotrivial elliptic variety over C(S), the trace
is zero even though its complex fibres are nonzero elliptic curves.

**Source.** [GH][GH], Trace conventions; Lemma 5.6 and §5.4, PDF pp.2,25,28–29.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A6/poincare-complete-reducibility.

### Integer characters and countably many closed torus subgroups

Every closed subgroup H of (R/Z)^n is the intersection of kernels of integer characters in its
annihilator L⊂Z^n. Since subgroups of Z^n are finitely generated, there are countably many such
H. L need not be saturated: H may be disconnected.

**Source.** [GH][GH], Lemma 5.2/Proposition 5.3 proofs, PDF pp.20–22.

**Needs.** `AddCircle`.

### Free matrix word growth at bounded height

Let Γ⊂GL_n(Z) be freely generated by two matrices. Fix c>1 bounding the submultiplicative norms
of both generators and both inverses. There are at least 2^k distinct Γ matrices of norm at most
c^k, so for sufficiently large T there are at least C T^(log2/logc) matrices of norm at most T
for some C>0. This counts matrices; distinct orbit points require the separate collision
argument.

**Source.** [GH][GH], Lemma 5.2 proof, PDF pp.19–20.

**Needs.** `FreeGroup`; `FreeGroup.lift`; `Matrix.GeneralLinearGroup`.

### Tits: free subgroups of linear groups

A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a
free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial
connected semisimple group does ([Tit72, Thm. 3]).

**Source.** [GH][GH], Lemma 5.5 citing Tits Theorem 3, PDF p.25.

**Needs.** `Matrix.GeneralLinearGroup`; `Subgroup.FiniteIndex`; `Group.IsSolvable`; `FreeGroup`.

### Invariance of domain in equal real dimension

A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto
its image. Consequently the same local assertion holds between real m-manifolds.

**Source.** [GH][GH], Theorem 5.1 proof, PDF p.29.

**Needs.** `Topology.IsOpenEmbedding`.

### Real constant-rank theorem for Betti fibres

For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of
constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each
nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the
real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X.

**Source.** [GH][GH], Lemma 6.2 proof, PDF p.31.

**Needs.** `ContDiffOn`; `fderiv`; `LinearMap.range`; `Module.finrank`; `OpenPartialHomeomorph`.

### Good-cover refinement on a Riemann surface

Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement
by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is
contractible. In the connected noncompact intersections used here these are topological open
discs.

**Source.** [GH][GH], §5.2, PDF p.22, citing Weil §1.

**Needs.** `ChartedSpace`; `LocallyFinite`; `ContractibleSpace`.

### Fixed homology and equivariant Hom

For an abelian scheme over a smooth irreducible complex algebraic curve, apply the fixed-part
theorem to its polarized integral homology variation of weight −1 (equivalently the dual
cohomology variation of weight +1). A nonzero integral homology class fixed by a finite-index
monodromy subgroup yields a nonzero constant part over the corresponding connected finite étale
cover. Use the equivariant Hodge-Hom comparison to algebraize the fixed substructure;
unrestricted Hom of a single Hodge fibre is insufficient.

**Source.** [GH][GH], Lemma 5.6 proof, PDF p.25.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Function-field trace and constant
part; **HodgeStructuresPartII**, H.2; **AbelianSchemesAndArithmeticModuli**, A5.

### Generically special subvarieties

For an irreducible closed Y⊂A dominating the smooth complex curve S, Y is GH generically special
if its geometric generic fibre is a finite union of τ(Z_Kbar)+B+t, where τ is the Kbar/C
geometric trace, Z is a closed irreducible subvariety of that constant trace over C, B is an
abelian subvariety of A_Kbar and t is torsion. A Gao special-generically subvariety, used for
degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant
Z.

**API.**

- `genericallySpecial_components`: Each geometric generic irreducible component has the stated
constant-variety plus torsion-coset description.
- `genericallySpecial_constant`: A constant subvariety of a constant abelian family is
generically special.
- `genericallySpecial_torsion`: A torsion translate of an abelian subvariety is generically
special.

**Checks.**

- `genericallySpecial_constant_curve`: A constant genus≥2 curve in its constant Jacobian is GH
generically special but is not itself a torsion coset.
- `genericallySpecial_torsion_point`: A torsion point of the geometric generic fibre gives a
generically special torsion multisection after closure; its generic fibre is zero-dimensional,
while its total dimension is one.
- `genericallySpecial_trace`: For a constant family with identity trace, every subvariety
defined over C is supplied by the imported trace map.

**Source.** [GH][GH], Definition 1.2, PDF pp.2–3.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Function-field trace and constant
part.

### Invariant definable sets of Ax-type

Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with
γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n,
or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X.
Here definable means that the lift X̃=exp⁻¹(X)∩[0,1]^n is definable in the fixed o-minimal
structure. Ax-type means that every continuous semialgebraic y:[0,1]→X̃, real analytic on (0,1),
has exp(y([0,1])) contained in exp(y(0))+G⊆X for some closed subgroup G.

**Source.** [GH][GH], Ax-type definition and Lemma 5.2, PDF pp.18–20.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Free matrix word growth at bounded
height; [B2](#b2-curve-monodromy-and-constant-traces), Integer characters and countably many
closed torus subgroups; **LogicAndDefinabilityInNumberTheory**, LD.6.

### Transport along nonisolated Betti fibres

Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex
algebraic curve, and let Y⊂A be irreducible and closed. Glueing Betti maps along loops gives a
homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* =
ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre
in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃
commutes with homomorphisms of abelian schemes.

**Source.** [GH][GH], Proposition 5.4 and proof, PDF pp.22–24.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B2](#b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#b2-curve-monodromy-and-constant-traces), Good-cover refinement on a Riemann surface.

### Free subgroups in curve monodromy

For an abelian scheme over a smooth irreducible complex algebraic curve, let Γ_s be its integral
H₁ monodromy image and G_s its Zariski closure over Q. If G_s⁰ is nontrivial, every finite-index
subgroup of Γ_s contains a free subgroup on two generators.

**Source.** [GH][GH], Lemma 5.5, PDF p.25.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Tits: free subgroups of linear groups;
**HodgeStructuresPartII**, H.2.

### Integer-character description of closed subgroups of a real torus

Export the character theorem from the integer-character construction: a closed H ⊆ (ℝ/ℤ)^n is
exactly the common kernel of its annihilator Λ ≤ ℤ^n. Finite generation of Λ gives finitely many
equations and countability of the closed subgroup family. Use the same carrier and character
pairing for both interfaces, including disconnected H.

**Source.** [GH][GH], Lemma 5.2 proof and Proposition 5.3, PDF pp.20–21.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Integer characters and countably many
closed torus subgroups.

### Monodromy-invariant subvarieties of a fibre

Let A be a complex abelian variety and Γ ⊆ GL_{2g}(ℤ) act continuously on A^an via a Betti
isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free
subgroup of rank 2 and with no non-zero invariant vector in ℤ^{2g}. If Z ⊆ A is irreducible
closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian
subvariety B of positive dimension.

**Source.** [GH][GH], Proposition 5.3 and proof, PDF pp.21–22.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Integer characters and countably many
closed torus subgroups; [B2](#b2-curve-monodromy-and-constant-traces), Invariant definable sets
of Ax-type.

### Invariant homology gives the function-field trace

For an abelian scheme A→S over a smooth irreducible complex algebraic curve, if H₁(A_s^an,Z) has
a nonzero monodromy-invariant element, the C(S)/C-trace of its generic fibre is nonzero over
C(S) itself.

**Source.** [GH][GH], Lemma 5.6, PDF p.25.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Fixed homology and equivariant Hom.

### Virtually invariant subvarieties in kernels

Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex
algebraic curve. Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant
(some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an
uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial
trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over
S whose kernel contains Y and has dimension dim Y. Here extendable means that every abelian
subvariety of A_s is the fibre of an abelian subscheme, understood as the image of an
endomorphism of A. All kernel dimensions in this assertion are total dimensions, including the
base.

**Source.** [GH][GH], Extendability; Lemma 5.8 and proof, PDF pp.25–28.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Fixed homology and equivariant Hom;
[B2](#b2-curve-monodromy-and-constant-traces), Integer characters and countably many closed
torus subgroups; [B2](#b2-curve-monodromy-and-constant-traces), Function-field trace and
constant part; [B2](#b2-curve-monodromy-and-constant-traces), Monodromy-invariant subvarieties
of a fibre; [B2](#b2-curve-monodromy-and-constant-traces), Transport along nonisolated Betti
fibres; [B2](#b2-curve-monodromy-and-constant-traces), Free subgroups in curve monodromy;
[B2](#b2-curve-monodromy-and-constant-traces), Invariant homology gives the function-field
trace.

### Curve degeneracy implies GH generic specialness

For an abelian scheme over a smooth irreducible complex algebraic curve S, an irreducible closed
subvariety Y dominating S which is curve-degenerate is GH generically special.

**Source.** [GH][GH], Theorem 5.1 and §5.4 proof, PDF pp.18,28–30.

**Needs.** [B2](#b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#b2-curve-monodromy-and-constant-traces), Generically special subvarieties;
[B2](#b2-curve-monodromy-and-constant-traces), Function-field trace and constant part;
[B2](#b2-curve-monodromy-and-constant-traces), Virtually invariant subvarieties in kernels.

### Full-rank algebraic points outside generic specialness

Let F⊂C be algebraically closed, S/F a smooth irreducible curve, A→S an abelian scheme, and X⊂A
an irreducible closed subvariety dominating S. If X is not GH generically special and Δ⊂S^an is
any nonempty Betti neighborhood, there exists P∈X^sm(F) with π(P)∈Δ and P∈(X_{π(P)})^sm(F) such
that rank_R d(b|X)_P=2 dim_C X.

**Source.** [GH][GH], §6 hypotheses and Lemma 6.2, PDF pp.30–31.

**Needs.** [B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties;
[B2](#b2-curve-monodromy-and-constant-traces), Degeneracy over a curve;
[B2](#b2-curve-monodromy-and-constant-traces), Generically special subvarieties;
[B2](#b2-curve-monodromy-and-constant-traces), Curve degeneracy implies GH generic specialness;
[B2](#b2-curve-monodromy-and-constant-traces), Invariance of domain in equal real dimension;
[B2](#b2-curve-monodromy-and-constant-traces), Real constant-rank theorem for Betti fibres.

### Construction requirements

Prove existence and the finite-kernel property of the C(S)/C trace and the geometric trace,
their finite-cover descent, and extension over the smooth curve. The trace reduction also needs
two specific assertions: after making connected monodromy, all fibres outside a countable set
are extendable (Gao–Habegger, Lemma 5.7, pp.25–26), and a fixed X contains finitely many maximal
GH generically special subvarieties (Proposition 1.3, pp.3–4, used on p.30). Establish the
endomorphism-extension argument for the first and the uniform Manin–Mumford/Lang–Néron argument
for the second before taking a finite union of special closures. The local Néron factor theory
is not a substitute for either assertion.

For the definable argument, prove integer-character separation for closed torus subgroups
including disconnected ones. Bound free words as matrices; exclude the proper collision kernels
before counting distinct orbit points. Apply the semirational/block theorem of LD.6 and then
Baire with the countable subgroup family. For monodromy transport construct the Riemann-surface
good-cover refinement, glue Betti transitions along loops and prove analytic continuation of a
nonisolated leaf inside the closed Y. Tits's free-subgroup theorem and connected-monodromy
semisimplicity give free subgroups at every finite index; the fixed-part and equivariant Hom
theorem H.2 gives the constant trace. The equal-dimensional invariance-of-domain and
constant-rank assertions below are prerequisites of the dimension argument, with constant
maximal rank chosen on a neighbourhood before computing a fibre dimension.

## B3: Degeneracy loci and quotient criteria

Use the mixed Kuga interfaces of LD.6 in four forms: growth, stabilizer, normal quotient and
finite weakly optimal data. Then construct special-generically closures and degeneracy loci in
the abelian family. The quotient criterion concerns generic Betti rank; it does not identify
every critical point with a degeneracy locus.

### Horizontal and vertical growth in mixed Ax–Schanuel

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. Assume dim pr_X⁺Z>0. For the definable fundamental set
F of §4.1 put Θ={p∈P(R):dim(p⁻¹B∩(F×M)∩Δ)=dim Z}. There are ε>0 and T_i→∞ such that for each i a
connected semialgebraic block in Θ contains at least T_i^ε points of Γ of height at most T_i.

**Source.** [Gao–Ax][Gao–Ax], Theorem 4.1 setting and Theorem 5.2, PDF pp.14–19.

**Needs.** **LogicAndDefinabilityInNumberTheory**, LD.6.

### Bigness of the rational stabilizer

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. Put H=(Γ∩Stab_{P(R)⁺}(B))^{Zar,0}, with rational
Zariski closure. Either dim B−dim Z≥dim(pr_X⁺Z)^biZar, or dim H>0.

**Source.** [Gao–Ax][Gao–Ax], Equation(5.1), Proposition 5.1 and proof, PDF pp.16,19–20.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Horizontal and vertical growth in
mixed Ax–Schanuel; **LogicAndDefinabilityInNumberTheory**, LD.6.

### Normality and quotient induction

Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an
irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the
smallest Kuga subdatum containing pr_X⁺Z. For the purpose of proving the dimension inequality
one may replace (B,Z) by a very general pair in its Hilbert family, with no larger dimension
defect and the same bi-algebraic closure, so that its rational stabilizer H is normal in P. The
vector part V∩H is a G=P/V module and the reductive part acts trivially on V/(V∩H). Quotient by
H and compare generic fibre dimensions to obtain the Ax–Schanuel inequality. Normality is not
asserted for every original pair without this reduction.

**Source.** [Gao–Ax][Gao–Ax], Proposition 6.1, §§6–7, PDF pp.20–27.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Bigness of the rational stabilizer;
**LogicAndDefinabilityInNumberTheory**, LD.6.

### Finite weakly optimal quotient data

For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties
have weakly special closures from a finite set of rational subdata and connected normal
subgroups with semisimple reductive parts. Explicitly δ_ws(Z)=dim Z^biZar−dim Z, and Z⊂Y is
weakly optimal if every larger irreducible closed Z′⊂Y has δ_ws(Z′)>δ_ws(Z). A finite list
((Q,Y⁺),N) suffices so that each Z^biZar=u(N(R)⁺y) for some y∈Y⁺. The points y need not come
from a finite set.

**Source.** [Gao–Ax][Gao–Ax], Definition 8.1, Theorem 8.2 and §§8.1–8.3, PDF pp.27–32.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Normality and quotient induction;
**LogicAndDefinabilityInNumberTheory**, LD.6.

### Gao t-degeneracy loci

For closed irreducible X in an abelian scheme A→S over an irreducible complex quasi-projective
variety and t∈Z, define X^deg(t) as the union of positive-dimensional closed irreducible Y⊂X
with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure inside A
restricted to the reduced closure of π(Y): torsion plus constant section plus abelian subscheme
after finite cover. X^deg(t) is a set before its Zariski closedness theorem.

**API.**

- `degeneracyLocus_member`: x∈X^deg(t) iff x lies on a positive-dimensional Y satisfying the
strict dimension inequality.
- `degeneracyLocus_mono`: For t≤u, X^deg(t)⊂X^deg(u).
- `degeneracyLocus_zero`: Once closedness is proved, X minus X^deg(0) is a Zariski-open
complement of algebraic degeneracy. It is not asserted to be exactly the pointwise
full-Betti-rank locus.

**Checks.**

- `degeneracyLocus_point`: For a zero-dimensional X all t-degeneracy loci are empty because no
positive-dimensional Y exists.
- `degeneracyLocus_torsion_section`: A torsion section over a positive-dimensional base belongs
to its 0-th degeneracy locus.
- `degeneracyLocus_strict`: If dim⟨Y⟩_sg−dimπY=dimY+t, that Y is excluded; replacing < with ≤
changes the definition.
- `degeneracyLocus_ramified_graph`: For a nonconstant branched map f:C→E from a smooth curve to
an elliptic curve, its graph X⊂E×C has X^deg(0)=∅, while db|X vanishes at ramification points.
Algebraic degeneracy does not equal the pointwise rank-drop set.

**Source.** [Gao–Betti][Gao–Betti], Definitions 1.5–1.6, PDF pp.4–5.

**Needs.** [B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties;
[B3](#b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data.

### Zariski closedness of degeneracy loci

Let A → S be an abelian scheme over an irreducible complex quasi-projective variety, X ⊂ A
closed and irreducible, and t any integer. Prove that the set X^deg(t) defined above is Zariski
closed. The universal modular-image case uses finite normal quotient data and fibre-dimension
loci. The passage to a general family must include exceptional and jumping modular fibres. A
dense-open identity involving only the generic relative dimension is insufficient for this
global assertion.

**Source.** [Gao–Betti][Gao–Betti], Theorem 7.1 and Lemma 9.1, PDF pp.16–18,22–23.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Gao t-degeneracy loci;
[B3](#b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data.

### Gao quotient criterion for Betti rank

Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety
dominating S. After the indicated finite cover, translate the smallest torsion translate of an
abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic
real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its
modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S).

**Source.** [Gao–Betti][Gao–Betti], Theorem 1.1, generic-rank criterion and §9.3, PDF
pp.2,15–24.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Zariski closedness of degeneracy
loci; [B3](#b3-degeneracy-loci-and-quotient-criteria), Finite weakly optimal quotient data;
**HodgeStructuresPartII**, H.2.

### Construction requirements

The mixed Ax–Schanuel uses require hyperbolic-volume growth, the Pila–Wilkie connected-block
theorem, o-minimal Chow and mixed bi-algebraic monodromy from LD.6. Normality requires the very
general Hilbert-family replacement, the G-stability of the vector part and the trivial reductive
action on its quotient. Normality in an intermediate subgroup alone is not enough. Normalize the
rational conjugating parameters in the finite-data argument, retaining moving orbit points (Gao,
Ax–Schanuel, §§8.1–8.3, pp.27–32).

For general-family closedness account for every modular fibre dimension, including exceptional
fibres. Prove the passage from the universal modular image to the family with these loci
included; a formula based solely on the generic relative dimension does not do this. A required
check is the graph of Bl_0(B) → B in the constant family B × Bl_0(B): the exceptional ℙ¹ lies in
the zero-degeneracy locus even though the generic modular relative dimension is zero.
Quotient-jump loci also retain the positive-dimensional-subvariety condition when their
numerical threshold is negative. If a field-of-definition statement is used, prove invariance
under Aut(ℂ/ℚbar) and effective descent of the resulting closed subset separately. The
abelian-subscheme/monodromy-submodule and quotient-modular-map dictionary is supplied by the
polarized fixed-part theory H.2 and the Kuga interface, with finite covers explicit.

## B4: Fibre powers and differences

Fibre powers and difference images are taken componentwise when necessary. First prove the
product lemma by tangent kernels. The main induction uses the quotient criterion with the full
generic-finiteness, generating-fibre and finite-stabilizer hypotheses. The universal curve is
then a specialization through the Jacobian and Torelli maps.

### Non-degeneracy of a dominant fibre product

For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is
non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the
assertion to each dominating component after the requisite finite cover.

**Source.** [Gao–Survey][Gao–Survey], Lemma 6.2 and proof, PDF p.15.

**Needs.** [B0](#b0-period-coordinates-and-betti-maps), Period-coordinate trivializations;
[B1](#b1-betti-forms-and-non-degeneracy), Non-degenerate subvarieties.

### The fibre-power dimension induction

Let A→S be an abelian scheme over an irreducible complex quasi-projective variety, and X⊂A
closed irreducible and dominant, with geometrically irreducible generic fibre, positive relative
dimension, generating fibres and finite geometric generic stabilizer. For m≥1: (i) if m≥dim S
and the modular map on X^[m] is generically finite, X^[m] has full total-dimension Betti rank;
(ii) if m≥dim X and the modular map on D_m(X^[m+1]) is generically finite, that difference image
has full total-dimension Betti rank. The exact dimension induction for both statements is the
target.

**Source.** [Gao–Betti][Gao–Betti], Theorem 10.1(i)–(ii), AppendixB, PDF pp.26–29,33–35.

**Needs.** [B3](#b3-degeneracy-loci-and-quotient-criteria), Gao quotient criterion for Betti
rank; **AbelianSchemesAndArithmeticModuli**, A6/poincare-complete-reducibility.

### Non-degeneracy of universal-curve difference images

Let S be an irreducible variety over ℚ̄ with a quasi-finite morphism S → M_g, g ≥ 2, M ≥ 3g − 2
(Gao's theorem is stated over ℂ). Then D_M(C_S^{[M+1]}) ⊆ 𝔄_g^{[M]} ×_{A_g} S is non-degenerate.

**Source.** [DGH][DGH], Theorem 6.2 and proof, PDF pp.26–28.

**Needs.** [B4](#b4-fibre-powers-and-differences), The fibre-power dimension induction;
**JacobianChallengePartII**, JC7/universal-faltings-zhang.

### Non-degeneracy criterion for fibre powers

Let A → S be an abelian scheme over an irreducible complex quasi-projective base and X ⊆ A an
irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for
all s, (c) X_η of finite stabilizer. If m ≥ 1, m ≥ dim S and ι^{[m]}|_{X^{[m]}} (the moduli map
to 𝔄_g^{[m]}) is generically finite, then X^{[m]} ⊆ A^{[m]} is non-degenerate. Work with a
geometrically irreducible generic fibre, or select a dominating component after the quasi-finite
étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible.

**Source.** [Gao–Survey][Gao–Survey], Theorem 6.5(i) and footnote 6, PDF pp.16–17.

**Needs.** [B4](#b4-fibre-powers-and-differences), The fibre-power dimension induction.

### Non-degeneracy is preserved by the difference construction

If X^{[m]}_{S′} is non-degenerate, then so is D(X^{[m(M+2)]}_{S′}) = X^{[m]}_{S′} ×_{S′}
D₀((X^{[m]}_{S′})^{[M+1]}) ⊆ A^{[m(M+1)]}_{S′}. For arbitrary abelian families the group-valued
difference is the native group-law specialization; the curve case uses the imported Jacobian
map. Choose the dominating irreducible components when needed.

**Source.** [Gao–Survey][Gao–Survey], Lemma 6.2 and §8.3 Step 1, PDF pp.15,22.

**Needs.** [B4](#b4-fibre-powers-and-differences), Non-degeneracy of a dominant fibre product;
**JacobianChallengePartII**, JC2/curve-difference.

### Construction requirements

At each step of the fibre-power induction re-diagonalize the connected kernel using a
G-equivariant shear. Kernel projections are endomorphisms; only the combined coordinate map is
an isogeny. Retain finite covers and connected components through every dimension equality.
Prove both the power and the difference-image induction, not just the power case. For the
universal-curve application pass to a cover with a section and use quasi-finiteness of the
Torelli/modular map. In the difference-product argument the first factor is independent, so
product non-degeneracy suffices; generic injectivity of the full difference map is unnecessary.

## F0: Finite-field Frobenius and Tate

Start with polarized-moduli finiteness and compact lattice limits. Tate's isotropic-image lemma
yields the split-prime commutant calculation, and prime independence plus saturation gives full
faithfulness. Frobenius polynomials and point counts use the parent characteristic-polynomial
interface and the Weil absolute-value theorem.

### Compact preimages and exact lattice limits

Let L be a finite free Z_ℓ-lattice and u_j∈End_Zℓ(L) converge to u, with the compact images
L_j=u_j(L) forming a decreasing sequence. Then u(L)=⋂_j L_j. In Tate Proposition 1, after
passing to infinitely many isomorphic fixed-polarization models, L=X_n, L_j=X_j=(T∩W)+ℓ^jT along
a cofinal subsequence, and u belongs to the closed finite-dimensional algebra E_ℓ. Finiteness of
the models is a separate hypothesis, established over finite fields using polarized moduli.

**Source.** [Tate][Tate], Hyp(k,A,d,ℓ) and Proposition 1 proof, printed pp.136–137 (PDF pp.3–4).

**Needs.** **PELModuli**, M6.

### Frobenius polynomial and reciprocity

For A/F_q of dimension g, P_A(X)=det(X−Frob_q|V_ℓA) is a monic polynomial in Z[X] of degree 2g,
independent of ℓ, with all complex roots of absolute value √q and coefficients satisfying
a_(2g−i)=q^(g−i)a_i for 0≤i≤g. Coefficients a_i are indexed in descending powers:
P_A=∑_(i=0)^(2g) a_i X^(2g−i), with a_0=1 and a_(2g)=q^g.

**API.**

- `frobeniusPolynomial_integral`: P_A∈Z[X] is independent of ℓ≠p and has degree 2 dim A.
- `frobeniusPolynomial_reciprocal`: Writing P_A=∑a_i X^(2g−i), a_(2g−i)=q^(g−i)a_i for 0≤i≤g,
a_0=1 and a_(2g)=q^g.
- `frobeniusPolynomial_product`: P_(A×B)=P_A P_B.
- `frobeniusPolynomial_points`: #A(F_(q^r))=det(1−π^r) on V_ℓA.

**Checks.**

- `frobeniusPolynomial_zero`: For the zero-dimensional abelian variety P_A=1 and the point count
is 1.
- `frobeniusPolynomial_elliptic`: For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.
- `frobeniusPolynomial_native`: For ℓ≠p its image in Q_ℓ[X] is the imported characteristic
polynomial of the Frobenius action on V_ℓA.

**Source.** [Waterhouse][Waterhouse], Chapter 2 opening, printed pp.526–528 (PDF pp.7–9).

**Needs.** **AbelianSchemesAndArithmeticModuli**, A6/characteristic-polynomial-on-tate-module;
**DeligneWeightsAndPurity**, DWP.1 (target 1.4).

### Weil q-numbers

For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under
every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy
classes of these numbers, not arbitrary reciprocal polynomials of degree 2g. Use the weight-one
predicate of DWP.0 together with IsIntegral ℤ; the three interfaces below are its integral
finite-field specializations, rather than a second purity predicate.

**API.**

- `weilQNumber_norm`: For every embedding σ:Q(π)→C, |σπ|²=q.
- `weilQNumber_conjugate`: Algebraic conjugates of a Weil q-number are Weil q-numbers.
- `weilQNumber_power`: π^r is a Weil q^r-number for r≥1.

**Checks.**

- `weilQNumber_real`: ±sqrt(p) are Weil p-numbers and have minimal polynomial X²−p.
- `weilQNumber_one`: For q>1 the algebraic integer 1 is not a Weil q-number.
- `weilQNumber_frobenius`: Every Frobenius eigenvalue of the imported characteristic polynomial
of A/F_q is a Weil q-number.

**Source.** [Waterhouse][Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9).

**Needs.** **DeligneWeightsAndPurity**, DWP.0 (targets 0.1–0.3); `IsIntegral`;
`IntermediateField.adjoin`.

### Tate’s isotropic image lemma

Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ):
only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power
isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of
some u∈End_k(A)⊗Q_ℓ.

**Source.** [Tate][Tate], Proposition 1 and proof, printed pp.136–137 (PDF pp.3–4).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Compact preimages and exact lattice
limits.

### Point counts are isogeny invariant

For A/F_q, #A(F_(q^r))=det(1−Frob_q^r|V_ℓA), so point counts are invariant under F_q-isogeny and
multiply on products.

**Source.** [Tate][Tate], Theorem 1(c), printed p.139 (PDF p.6), with the determinant
calculation from the parent characteristic-polynomial API.

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
**AbelianSchemesAndArithmeticModuli**, A3.

### Tate at a split Frobenius prime

For abelian varieties over a finite field k of characteristic p and a prime ℓ≠p splitting the
étale algebra Q[π] generated by Frobenius, Tate Proposition 2 identifies End_k(A)⊗Q_ℓ with the
Frobenius commutant. Its dimension is ∑_P m_P² deg P and is independent of ℓ. Off-diagonal
blocks give Hom_k(A,B)⊗Q_ℓ; the integral inclusion has torsion-free cokernel. These are
k-rational Hom spaces, not unrestricted geometric Hom.

**Source.** [Tate][Tate], Lemmas 1–4, Proposition 2 and equations(4)–(5), printed pp.135–139
(PDF pp.2–6).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Compact preimages and exact lattice
limits; **AbelianSchemesAndArithmeticModuli**, A6/hom-to-tate-module-homs-is-injective;
**AbelianSchemesAndArithmeticModuli**, A6/hom-is-free-of-finite-rank;
**AbelianSchemesAndArithmeticModuli**, A6/endomorphism-algebra-is-semisimple;
[F0](#f0-finite-field-frobenius-and-tate), Tate’s isotropic image lemma.

### Tate full faithfulness over finite fields

For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives
the analogous Q_ℓ statement.

**Source.** [Tate][Tate], Main Theorem; Lemmas 1–3; conclusion of §2, printed pp.134–135,138–139
(PDF pp.1–2,5–6).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime.

### Construction requirements

Construct the finite fixed-polarization moduli sets and the compatible compact preimages in
Tate's argument without using F6. For decreasing images u_j(L), compactness proves that each
element of the intersection has a preimage under the limit u; mere convergence of images is
insufficient. Compute each split eigenspace and off-diagonal block and justify independence of
the commutant dimension from ℓ. Combine rational surjectivity with integral saturation. Use
DeligneWeightsAndPurity, DWP.1 target 1.4, for the abelian-variety Frobenius root bound. Its
Rosati proof uses the parent polarization and characteristic-polynomial theory, without Tate
full faithfulness. Use DWP.0 targets 0.1–0.3 for the embedding, conjugacy and power laws of pure
algebraic numbers, and add the integrality condition for Honda–Tate Weil numbers. Semisimplicity
is applied to Frobenius, not to arbitrary endomorphisms.

## F2: Resultant recognition

This polynomial layer is independent of the geometric realizations. A dense coefficient ring
provides monic tests at arbitrary ideal-power precision. Fixed-size determinant congruences and
a shifted-factor slope distinguish every irreducible multiplicity, including repeated and
inseparable factors.

### Monic coefficient lifting

Let ι:D→O be a ring homomorphism surjective modulo (π^N). For monic R∈O[X], lift every
coefficient below degree d=natDegree R modulo π^N and set the leading coefficient to 1; this
gives a monic ψ∈D[X] of degree d with ψ≡R mod π^N.

**Source.** [Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter.

**Needs.** `Polynomial.Monic`; `Ideal`.

### Fixed-size resultant congruence

For polynomials P,Q,Q′ with Q≡Q′ mod I, the fixed-size Sylvester resultants Res_(m,n)(P,Q) and
Res_(m,n)(P,Q′) are congruent mod I. For the default resultant preserve the actual degrees m,n;
degree dropping is not silently allowed.

**Source.** [Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter.

**Needs.** `Polynomial.resultant`.

### Multiplicity detected by shifted factors

Let O be a DVR, R,S monic with gcd(R,S)=1 over Frac(O), d=degR>0, and P=R^e S. If monic
ψ_n≡R+π^n mod π^(2n) and degψ_n=d, then eventually Res(P,ψ_n)≠0 and v Res(P,ψ_n)=nde+v Res(S,R).

**Source.** [Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter.

**Needs.** [F2](#f2-resultant-recognition), Monic coefficient lifting;
[F2](#f2-resultant-recognition), Fixed-size resultant congruence.

### Recognition from nonzero monic resultant tests

Let O be a nonfield discrete valuation ring with uniformizer π and normalized valuation on its
nonzero elements, and let D be a commutative ring with a unital map to O. If monic P,Q∈O[X] have
equal valuations of every common nonzero resultant with monic polynomials lifted from D, and D→O
is surjective modulo each π^N, then P=Q. Equal degree, completeness, separability,
characteristic zero and finite residue field are unnecessary.

**Source.** [Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter.

**Needs.** [F2](#f2-resultant-recognition), Multiplicity detected by shifted factors.

### Integer tests for a p-adic polynomial

For prime p and monic P,Q∈Z_p[X], equality of v_p Res(P,ψ) and v_p Res(Q,ψ) for all monic ψ∈Z[X]
with both resultants nonzero implies P=Q.

**Source.** [Milne][Milne], §1, characteristic-polynomial uniqueness criterion, printed p.65
(PDF p.3), scan; DVR polynomial adapter.

**Needs.** [F2](#f2-resultant-recognition), Recognition from nonzero monic resultant tests;
`PadicInt.appr_spec`; `PadicInt.valuation`.

### Construction requirements

For P = R^eS use the finite free quotient O[X]/(R). If ψ_n differs from R + π^n modulo π^(2n),
multiplication by ψ_n there is π^n(I + π^nH_n), whose determinant has valuation n·deg R.
Multiplicativity of resultants and eventual stability of Res(S,ψ_n) give the slope n·deg R·e
plus a constant. This quotient determinant retains enough precision for degree(R) > 2; a scalar
error estimate at precision 2n alone does not. Compare the slopes for P and Q factor by factor,
choosing only tests with both resultants nonzero. The coefficient-lift and congruence statements
allow an arbitrary ideal; the recognition theorem uses the powers of a DVR uniformizer.
Completeness, a finite residue field, characteristic zero and separability are not assumptions.

## F1: Characteristic-prime realization

The characteristic-prime comparison uses the actual contravariant Dieudonné functor from R07.2.
Prove the degree/length and characteristic-polynomial identities before the rational commutant
calculation. Integral full faithfulness then follows from rational full faithfulness and a
separately established saturated image.

### Degree from Dieudonné cokernel length

For an isogeny f:A→B of abelian varieties over a perfect field k of characteristic p>0, the
contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an
endomorphism its determinant valuation gives the same value.

**Source.** [Milne][Milne], §1, printed pp.64–66 (PDF pp.2–4), scanned page images.

**Needs.** **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible.

### Saturated injection on integral p-realization Hom groups

For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with
p-saturated image. This statement does not assume rational p-Tate or equality of ranks.

**Source.** [WM][WM], PartI Theorems 3/5 and opening proof of Theorem 6, printed pp.55–57 (PDF
pp.3–5), scans.

**Needs.** **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
**AbelianSchemesAndArithmeticModuli**, A6/hom-is-free-of-finite-rank;
**AbelianSchemesAndArithmeticModuli**, A3.

### Characteristic polynomial on the p-realization

For an abelian variety A over a perfect field k of characteristic p>0 and every u∈End_k(A), the
W(k)-linear map C(u) on its contravariant Dieudonné module has characteristic polynomial in
Z_p[X] equal to the image of the imported integer characteristic polynomial of u. No
semisimplicity of arbitrary u is assumed.

**Source.** [Milne][Milne], §1, printed pp.65–66 (PDF pp.3–4), scanned page images.

**Needs.** [F1](#f1-characteristic-prime-realization), Degree from Dieudonné cokernel length;
[F2](#f2-resultant-recognition), Integer tests for a p-adic polynomial;
**AbelianSchemesAndArithmeticModuli**, A6/characteristic-polynomial-of-an-endomorphism.

### Algebra acting on a Frobenius polynomial block

Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic
irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define
multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a
semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and
U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several
factors; preserve the σ action on all factors.

**API.**

- `frobeniusBlock_relation`: U c=σ(c)U and U^a=θ on L⊗_(Q_p)K; θ is the chosen q-Frobenius root.
- `frobeniusBlock_dimension`: The algebra has K-dimension a² after the coefficient étale algebra
is handled correctly.
- `frobeniusBlock_action`: On the corresponding isocrystal block, the semilinear F gives an
action of this cyclic algebra.

**Checks.**

- `frobeniusBlock_prime`: For a=1 the block algebra is K, with U=θ.
- `frobeniusBlock_split`: After a splitting base extension it is a full a×a matrix algebra, with
weighted cyclic U and diagonal coefficient action.
- `frobeniusBlock_product_coeff`: If L⊗Q_p K is a product, the construction retains every
idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient
field.

**Source.** [WM][WM], PartII proofs, printed pp.60–61 (PDF pp.8–9), scans.

**Needs.** **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
[F1](#f1-characteristic-prime-realization), Characteristic polynomial on the p-realization.

### Semisimplicity of the linear q-Frobenius realization

For A/F_(p^a), C(π_A)=F^a is an L-linear semisimple endomorphism of C(A)[1/p], where π_A is the
q-power Frobenius. Its characteristic polynomial is P_A. No semisimplicity claim for arbitrary
endomorphisms is included.

**Source.** [Milne][Milne], §1, printed p.66 (PDF p.4), scan.

**Needs.** [F1](#f1-characteristic-prime-realization), Characteristic polynomial on the
p-realization; **AbelianSchemesAndArithmeticModuli**, A6/endomorphism-algebra-is-semisimple;
[F1](#f1-characteristic-prime-realization), Saturated injection on integral p-realization Hom
groups.

### Central simplicity of a Frobenius block algebra

The algebra B in the Frobenius block construction above is central simple over K. For an
algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp
K is a product of fields.

**Source.** [WM][WM], PartII Theorem 2 proof, printed p.61 (PDF p.9), scan.

**Needs.** [F1](#f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [RepresentationTheory/SemisimpleAlgebras, layer
4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md#layer-4-central-simple-algebras-and-their-tensor-products).

### Dimension of the semilinear Frobenius commutant

For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i.
For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i².

**Source.** [WM][WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans.

**Needs.** [F1](#f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [F1](#f1-characteristic-prime-realization), Central simplicity of a Frobenius block
algebra; [RepresentationTheory/SemisimpleAlgebras, layer
5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md#layer-5-skolem-noether-and-the-centralizer-theorem);
[F1](#f1-characteristic-prime-realization), Semisimplicity of the linear q-Frobenius
realization.

### Rational and integral p-Tate comparison

For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism
onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved.

**Source.** [WM][WM], PartI Theorems 5–6 and PartII Theorem 1 proof, printed pp.56–57,60–61 (PDF
pp.4–5,8–9), scans.

**Needs.** **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
[F1](#f1-characteristic-prime-realization), Characteristic polynomial on the p-realization;
[F0](#f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime;
**AbelianSchemesAndArithmeticModuli**, A6/endomorphism-algebra-is-semisimple;
[F1](#f1-characteristic-prime-realization), Saturated injection on integral p-realization Hom
groups; [F1](#f1-characteristic-prime-realization), Central simplicity of a Frobenius block
algebra; [F1](#f1-characteristic-prime-realization), Dimension of the semilinear Frobenius
commutant; [F1](#f1-characteristic-prime-realization), Semisimplicity of the linear q-Frobenius
realization.

### Integral Tate full faithfulness at the characteristic prime

For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their
p-divisible groups over W(F_q), with their F,V actions. The natural map
Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A)) is an isomorphism.

**Source.** [WM][WM], PartI saturation and PartII Theorem 1, printed pp.56–57,60–61 (PDF
pp.4–5,8–9), scans.

**Needs.** [F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison.

### Rational p-Tate comparison

For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector
spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra.

**Source.** [WM][WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans.

**Needs.** [F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison.

### Characteristic-prime invariant of a simple endomorphism algebra

Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v,
e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then
inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z.

**Source.** [WM][WM], PartII Theorem 2 and proof, printed pp.60–61 (PDF pp.8–9), scans.

**Needs.** [F1](#f1-characteristic-prime-realization), Algebra acting on a Frobenius polynomial
block; [F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[ClassFieldTheory, layer
5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality).

### Construction requirements

Construct the completed Hom map and prove injectivity from finite-rank Hom and finite flat
torsion. To prove p-saturation, interpret divisibility of C(f) by p^n as annihilation of the
finite flat subgroup A[p^n], then factor through [p^n]; geometric torsion points alone cannot
detect connected kernels. Use F2's nonzero-resultant recognition to identify characteristic
polynomials for arbitrary endomorphisms. On each Frobenius block construct the cyclic algebra on
the full étale tensor L ⊗ K, including every idempotent when it is a product. After a splitting
extension identify it with M_a; apply centralizer dimensions blockwise to match the ℓ-adic
dimension. Rational surjectivity and saturation then give integral p-Tate. For local invariants
track the opposite endomorphism algebra and arithmetic Frobenius through the cyclic-algebra
convention.

## F3: Honda–Tate and lattice classifications

Honda–Tate combines the Frobenius commutant with existence for every Weil number and the global
Brauer invariants. Classification of integral objects requires a separate lattice theorem, with
finite support and the contravariant characteristic-prime marking. The prime-field linear dual
is introduced only after that theorem.

### Prime-to-p and p lattice spaces

Fix A₀/F_q. X^p is the restricted product of Frobenius-stable full Z_ℓ-lattices in V_ℓ(A₀),
equal to T_ℓ(A₀) almost everywhere. X_p consists of full W(F_q)-lattices in C(A₀)[1/p] stable
under F and V, where C is the contravariant Dieudonné functor. For Γ=End⁰_Fq(A₀)^× use the left
action α·(Λ_p,(Λ_ℓ))=(C(α)⁻¹Λ_p,(α_ℓΛ_ℓ)).

**API.**

- `markedLattice_primeToP`: For each ℓ≠p choose a Frobenius-stable full Z_ℓ-lattice in V_ℓA
equal to T_ℓA at all but finitely many ℓ.
- `markedLattice_p`: At p choose a full F,V-stable W(F_q)-lattice in the contravariant
isocrystal C(A₀)[1/p].
- `markedLattice_action`: The left action of Γ is α_ℓ at ℓ≠p and C(α)⁻¹ at p. Contravariance
reverses composition; taking inverses restores the left action.

**Checks.**

- `markedLattice_identity`: The identity marking gives exactly T_ℓ(A₀) at ℓ≠p and C(A₀) at p.
- `markedLattice_zero`: The zero-dimensional abelian variety has one lattice tuple.
- `markedLattice_support`: A tuple differing from the standard lattice at infinitely many primes
is excluded from the finite-support space.

**Source.** [Waterhouse][Waterhouse], §1.2 and §3.1, printed pp.525,530–531 (PDF pp.6,11–12).

**Needs.** **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1/etale-groups-as-galois-modules.

### Honda–Tate simple isogeny classification

Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The
dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra
local invariants prescribed by π.

**Source.** [Waterhouse][Waterhouse], Chapter 2, printed pp.526–528 (PDF pp.7–9).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Weil q-numbers;
[F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#f1-characteristic-prime-realization), Characteristic-prime invariant of a simple
endomorphism algebra; [ClassFieldTheory, layer
10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).

### Frobenius polynomial determines the isogeny class

Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic
polynomials agree.

**Source.** [Tate][Tate], Theorem 1(c), printed p.139 (PDF p.6).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F0](#f0-finite-field-frobenius-and-tate), Tate at a split Frobenius prime.

### Commutative endomorphisms in the nonreal prime-field case

If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field.

**Source.** [Waterhouse][Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9).

**Needs.** [F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#f1-characteristic-prime-realization), Characteristic-prime invariant of a simple
endomorphism algebra; [ClassFieldTheory, layer
10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants).

### Prime-field p-realization Frobenius polynomial

For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple
and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial
P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p.

**Source.** [WM][WM], PartII, printed pp.60–61 (PDF pp.8–9), scans.

**Needs.** [F1](#f1-characteristic-prime-realization), Characteristic polynomial on the
p-realization; **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
[F1](#f1-characteristic-prime-realization), Semisimplicity of the linear q-Frobenius
realization.

### Marked quasi-isogenies classified by lattices

Isomorphism classes of pairs (B,f:B→A₀ a rational quasi-isogeny over F_q), with (B,f)≅(B′,f′)
when f′u=f for an F_q-isomorphism u:B→B′, correspond to X_p×X^p by Λ_ℓ=f_ℓ(T_ℓB) and
Λ_p=C(f)⁻¹(C(B)). This bijection is equivariant for postcomposition on f and the action
specified in the prime-to-p and p lattice spaces above.

**Source.** [Waterhouse][Waterhouse], §1.2 and §3.1, printed pp.525,530–531 (PDF pp.6,11–12).

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1/etale-groups-as-galois-modules;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
**AbelianSchemesAndArithmeticModuli**, A3; [F0](#f0-finite-field-frobenius-and-tate), Tate full
faithfulness over finite fields; [F1](#f1-characteristic-prime-realization), Integral Tate full
faithfulness at the characteristic prime.

### Finite-support lattice tuples are realized over the prime field

Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable
Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely
many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization
lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p.

**Source.** [Waterhouse][Waterhouse], §3.1 and Theorem 6.1 proof, printed pp.530–531,550–551
(PDF pp.11–12,31–32).

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1/etale-groups-as-galois-modules;
**FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2/dieudonne-p-divisible;
[F3](#f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial;
[F1](#f1-characteristic-prime-realization), Integral Tate full faithfulness at the
characteristic prime; **AbelianSchemesAndArithmeticModuli**, A3.

### Realization of nonreal prime-field orders

In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob
occurs as End_Fp(A′) for some A′ in that class.

**Source.** [Waterhouse][Waterhouse], Theorem 6.1 and proof, printed pp.550–551 (PDF pp.31–32).

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Commutative endomorphisms in the
nonreal prime-field case; [F3](#f3-hondatate-and-lattice-classifications), Finite-support
lattice tuples are realized over the prime field.

### Isomorphism classes as rational orbits

The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×\(X_p×X^p).

**Source.** [Waterhouse][Waterhouse], §3.1, printed pp.530–532 (PDF pp.11–13).

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#f3-hondatate-and-lattice-classifications), Marked quasi-isogenies classified by lattices.

### Prime-field marked and unmarked classification

For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀
a rational quasi-isogeny) to the finite-support lattice tuples of the finite-support prime-field
realization theorem above. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under
this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying
F_p-isomorphism classes in the isogeny class of A₀.

**Source.** [Waterhouse][Waterhouse], §3.1 and Theorem 6.1, printed pp.530–532,550–551 (PDF
pp.11–13,31–32).

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#f3-hondatate-and-lattice-classifications), Finite-support lattice tuples are realized over
the prime field; [F3](#f3-hondatate-and-lattice-classifications), Isomorphism classes as
rational orbits.

### Construction requirements

The existence assertion must construct an abelian variety over the stated finite field for each
Weil q-number and prove its multiplicity; a reciprocal polynomial alone does not provide
existence. Use the characteristic-prime invariant and the real-place invariants to determine the
division-algebra index e and hence dimension. For marked lattices, clear denominators and
realize the resulting finite flat subgroup using the quotient theorem A3 and the integral
realizations R07.1–R07.2. Prove the resulting integral Hom dictionary in both directions before
passing to rational orbits. Over F_p define D_lin = Hom_Zp(C, Z_p) and transpose F and V; this
is linear duality. Preserve V-integrality as well as F-stability. For a nonreal simple
prime-field class prove maximal-order existence and prime-to-p conductor modifications to
realize precisely the orders containing π and p/π.

## F4: Adelic class sets and local bounds

Specialize the adelic point and double-quotient theory to G = End⁰(A₀)^×. Separate the number of
adelic lattice orbits, the index of each integral stabilizer and the fixed-level rational class
set. Repeated roots require a discriminant quantity that stays nonzero.

### Adelic class set of the endomorphism group

For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are
G(Q)\G(A_fin)/Stab(L).

**API.**

- `adelicClassSet_mk`: A finite adele in E^×(A_f) determines its double coset modulo left E^×(Q)
and right K.
- `adelicClassSet_equiv`: g,h have the same class iff h=e g k for e∈E^×(Q),k∈K.
- `adelicClassSet_stabilizer`: K is the restricted product of the automorphism groups of the
chosen local lattices, including the p-component.

**Checks.**

- `adelicClassSet_rational`: Any rational unit e∈E^×(Q) has the identity class.
- `adelicClassSet_compact`: Changing a local lattice by conjugation replaces K by its conjugate
and induces the corresponding class-set bijection.
- `adelicClassSet_notPic`: For a nonmaximal order R the entire full-lattice class monoid can
include nonprojective lattices and need not be Pic(R). A single fixed local genus may have its
own double-coset class set; in the commutative genus of R itself this is Pic(R).

**Source.** [LT][LT], §3 and §3.2(15), v1 pp.6,11.

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Isomorphism classes as rational
orbits; [AdelicAlgebraicGroups,
AA.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-1-adelic-points-of-algebraic-groups).

### The prime-field p-component reduction

For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the
centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable
lattices.

**Source.** [LT][LT], Remark 3.2, v1 p.11.

**Needs.** [F1](#f1-characteristic-prime-realization), Rational and integral p-Tate comparison;
[F1](#f1-characteristic-prime-realization), Characteristic polynomial on the p-realization;
[F3](#f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial.

### Discriminant and ordered-root bounds

If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc
minpoly(π)|≤(2√p)^(d(d−1)). More generally, for a monic integral polynomial of degree m all of
whose root occurrences λ_i have modulus √p, the positive integer D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)|
satisfies D_*≤(2√p)^{m(m−1)}. Unequal root values retain occurrence multiplicities; the ordinary
discriminant may vanish.

**Source.** [Lee][Lee], §2.1 and §3.1–3.2, PDF pp.3,5–6, especially equation(11).

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity.

### Finite-support adelic stabilizers in a prime-field isogeny class

For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to
identify G(Q_ℓ), G the Q-algebraic unit group of End⁰_Fp(A₀), with the linear Frobenius
centralizer. If λ₁,…,λ_m are all Frobenius root occurrences, let D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)|,
a positive integer; equal values are omitted and unequal values retain their occurrence
multiplicities. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has
Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at
finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover
#G(A_f)\X≤D_*².

**Source.** [LT][LT], §§3.1–3.2.1, v1 pp.7–14; local orbit/stabilizer adaptation.

**Needs.** [F4](#f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; [F3](#f3-hondatate-and-lattice-classifications), Prime-to-p and p lattice spaces;
[F3](#f3-hondatate-and-lattice-classifications), Prime-field marked and unmarked classification;
[F4](#f4-adelic-class-sets-and-local-bounds), The prime-field p-component reduction;
**GeometryOfNumbersAndQuadraticArithmetic**, GN.2; [AdelicAlgebraicGroups,
AA.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-1-adelic-points-of-algebraic-groups);
[AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps);
[F0](#f0-finite-field-frobenius-and-tate), Tate full faithfulness over finite fields;
[F3](#f3-hondatate-and-lattice-classifications), Prime-field p-realization Frobenius polynomial.

### Class-set comparison by reduced norms

Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every
finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm
identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For
each CM field K_i, determinant identifies
GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the
mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it.

**Source.** [LT][LT], §3.2.2(21), v1 p.14, maximal-compact and narrow-class conventions.

**Needs.** [F4](#f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; **GeometryOfNumbersAndQuadraticArithmetic**, GN.2; [AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps).

### Conditional rational-orbit bound from local lattices

Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose
h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume
Stab(M)=∏S_{M,ℓ}, contained in K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹ with a_M∈G_f, equality S_{M,ℓ}=H_{M,ℓ}
away from finitely many primes, and ∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*. Then Γ\X is finite and #Γ\X≤D_*³h.
If the relevant Weil-lattice tuple satisfies these assumptions and D_*≤(2√p)^{m(m−1)}, the
resulting conditional bound is #Γ\X≤(2√p)^{3m(m−1)}h.

The abstract counting lemma needs only a group action, finitely many G_f-orbits and double
cosets, and stabilizers contained with finite index at most D_* in conjugates of K₀. The local
product decomposition supplies that index hypothesis. State finiteness separately from the
numerical index bound: Mathlib's subgroup index and `Nat.card` assign zero to infinite quotients.

**Source.** [LT][LT], §3.2(15),(20)–(21),(28), v1 pp.11,14,16; coarse orbit-count adaptation.

**Needs.** [F4](#f4-adelic-class-sets-and-local-bounds), Adelic class set of the endomorphism
group; [AdelicAlgebraicGroups,
AA.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps).

### Coarse prime-field isomorphism count at fixed adelic level

For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from the finite-support adelic stabilizer
theorem above, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism
classes in the isogeny class of A₀ is at most D_*³h≤(2√p)^{3m(m−1)}h. Class-set finiteness is
imported from AA.3 with its exact group hypotheses; no numerical bound on h is included.

**Source.** [Lee][Lee], §3.1(5)–(10), PDF pp.4–5; coarse orbit-count adaptation.

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Prime-field marked and unmarked
classification; [F4](#f4-adelic-class-sets-and-local-bounds), Finite-support adelic stabilizers
in a prime-field isogeny class; [F4](#f4-adelic-class-sets-and-local-bounds), Conditional
rational-orbit bound from local lattices; [F4](#f4-adelic-class-sets-and-local-bounds),
Discriminant and ordered-root bounds; [AdelicAlgebraicGroups,
AA.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients).

### Construction requirements

The GN.2 local suppliers must use the successive projected lattices pr_i(M ∩ V_≤i), with their
induced quotient profiles, rather than the generally smaller intersections M ∩ V_i. Factor the
local characteristic polynomial as ∏ f_i^n_i with distinct monic irreducibles, put δ_i = v_ℓ
disc(f_i), ρ_ij = v_ℓ Res(f_i,f_j), and Δ_ℓ = ∑ n_i² δ_i + 2∑_{i<j} n_i n_j ρ_ij. Bound local
orbit counts by ℓ^(2Δ_ℓ) and stabilizer indices by ℓ^Δ_ℓ. AA.1 and AA.4 assemble only finitely
many nontrivial local conjugators; obtain globally at most D_*² orbits and total stabilizer
index at most D_*. At p use the prime-field linear-dual centralizer, while keeping F- and
V-stable integral lattices. Reduced norms give ordinary ideal classes in the CM matrix case and
narrow classes for the real quaternion case in matrix degree at least two; dimension one and
zero have their separate cases. AA.3 gives fixed-level class-set finiteness. A quantitative
bound for that class set must be established explicitly before it can enter a uniform counting
estimate.

## F5: Polarizations and CM powers

Finite-field descent connects symmetric homomorphisms with line bundles. Rosati and unit norm
classes then control squarefree polarizations. Class-number-one CM fields provide elliptic
factors, and the Hermitian mass interface counts their principal polarizations. Keep weighted
masses distinct from unweighted isomorphism counts.

### Lang surjectivity for an abelian variety

For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the
actual Galois torsor cohomology.

**Source.** [Conrad][Conrad], Theorem 2.6 proof, PDF p.8; explicit abelian specialization of
Lang.

**Needs.** **AbelianSchemesAndArithmeticModuli**, A3.

### Units that are norms modulo norms of units (Lemmermeyer)

Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 →
Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of
ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular
(E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L).

**Source.** [Lemmermeyer][Lemmermeyer], Proposition 1 and proof, PDF pp.1–3.

**Needs.** [ClassFieldTheory, layer
13](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields).

### Density of primes splitting in a class-number-one CM field

For the nine fields Q(√−d), d∈{1,2,3,7,11,19,43,67,163}, each of class number one, the defining
square classes are independent in Q×/(Q×)². Outside the finite ramified-prime set, the rational
primes splitting in at least one field have natural density 1−2^(−9).

**Source.** [LT][LT], Lemma 5.11, v1 p.33.

**Needs.** [Chebotarev, layer
14](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-14-natural-density-and-consistency-theorems).

### Elliptic curve with class-number-one endomorphisms

If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with
End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization.

**Source.** [Waterhouse][Waterhouse], Chapter 2, Porism 4.3 and Theorem 6.1, printed
pp.527–528,540,550–551.

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Weil q-numbers;
[F3](#f3-hondatate-and-lattice-classifications), Honda–Tate simple isogeny classification;
[F3](#f3-hondatate-and-lattice-classifications), Realization of nonreal prime-field orders.

### Elliptic point groups in odd characteristic

Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both
p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example
y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8.

**Source.** [LT][LT], Lemma 5.19, v1 p.36, with the odd-characteristic restriction.

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity.

### Line-bundle realization over a finite field

For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that
field.

**Source.** [Conrad][Conrad], Lemma 2.3 and Theorem 2.6, PDF pp.6–8.

**Needs.** [F5](#f5-polarizations-and-cm-powers), Lang surjectivity for an abelian variety;
**AbelianSchemesAndArithmeticModuli**, A2.

### Principal polarizations on CM elliptic powers

Fix a prime p splitting in one of the imaginary quadratic fields K = Q(√−d) with d ∈
{1,2,3,7,11,19,43,67,163}. Construct E/F_p with End_Fp(E) = O_K. If N_p(g) counts
F_p-isomorphism classes of principal polarizations on E^g, prove log N_p(g) = (1/2)g² log g +
O_p(g²). The count is unweighted and uses the Hermitian orbit dictionary and its mass
comparison.

**Source.** [LT][LT], §§5.3–5.5, equations(39),(51)–(56), v1 pp.26–33.

**Needs.** [F5](#f5-polarizations-and-cm-powers), Elliptic curve with class-number-one
endomorphisms; [F5](#f5-polarizations-and-cm-powers), Density of primes splitting in a
class-number-one CM field; **GeometryOfNumbersAndQuadraticArithmetic**, GN.3;
**AbelianSchemesAndArithmeticModuli**, A6/rosati-positivity;
**AbelianSchemesAndArithmeticModuli**, A6/automorphisms-of-polarized-abelian-varieties;
**AbelianSchemesAndArithmeticModuli**, A2/rosati-involution.

### Squarefree nonreal polarization bound

For A/F_p of dimension g, with no repeated simple F_p-isogeny factor and Frobenius polynomial
coprime to X²−p, let n_A be the number of F_p-isomorphism classes of principal polarizations on
A. There are absolute positive constants C₀,C with n_A≤C₀p^(Cg²). If A admits no principal
polarization set n_A=0.

**Source.** [LT][LT], Proposition 4.11, Example 4.13 and Proposition 4.16, v1 pp.20–23.

**Needs.** [F5](#f5-polarizations-and-cm-powers), Line-bundle realization over a finite field;
[F3](#f3-hondatate-and-lattice-classifications), Commutative endomorphisms in the nonreal
prime-field case; [F5](#f5-polarizations-and-cm-powers), Units that are norms modulo norms of
units (Lemmermeyer); [F4](#f4-adelic-class-sets-and-local-bounds), Discriminant and ordered-root
bounds; [Completed/EffectiveBounds, layer
1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/EffectiveBounds/README.md#layer-1-effective-upper-bounds-the-first-migration-targets);
**AbelianSchemesAndArithmeticModuli**, A6/rosati-positivity;
**AbelianSchemesAndArithmeticModuli**, A6/automorphisms-of-polarized-abelian-varieties;
**AbelianSchemesAndArithmeticModuli**, A2/rosati-involution;
[F4](#f4-adelic-class-sets-and-local-bounds), Finite-support adelic stabilizers in a prime-field
isogeny class.

### Construction requirements

For Lang use that Frobenius − 1 is an étale surjective isogeny and translate it into the
procyclic torsor dictionary. Prove finite-field Brauer vanishing and the line-bundle descent
obstruction calculation, including characteristic two. A symmetric isogeny gives a line bundle;
positivity is needed before calling it ample. The ambiguous class sequence uses ideal Hilbert 90
and distinguishes ambiguous from strongly ambiguous classes. For squarefree polarization counts
combine maximal-order unit-square indices, local conductor/norm estimates and class-number
bounds, in the CM field rather than its real subfield.

The CM existence application must supply an element of norm p and its realizable endomorphism
order. Treat p = 3 separately in the odd-characteristic p-group test; characteristic two has the
indicated counterexample. For E^g prove the exact Rosati/Hermitian orbit dictionary, including
integral positivity and unimodularity, then use GN.3's local genus factors, residue bounds and
conversion from weighted masses to unweighted counts. The leading logarithmic coefficient is
1/2, with an O_p(g²) error; the mass alone is not the unweighted count.

## F6: Counting isogeny and isomorphism classes

Count characteristic polynomials by their first g power sums and q-reciprocity, then use
ordinary realizability for the matching isogeny-class lower bound. For isomorphism classes
assemble the local lattice and fixed-level arithmetic estimates uniformly. Polarization growth
on CM elliptic powers then compares the squarefree nonreal locus with all principally polarized
classes.

### Reconstruction from integer power sums

For a monic degree-2g integer polynomial satisfying q-reciprocity in descending coefficient
convention, its first g power sums determine the entire polynomial. Newton recurrence
i·a_i=−∑_(j=1)^i a_(i−j)s_j determines a_i over Q, and reciprocity determines the remaining
coefficients.

**Source.** [LT][LT], Lemma 2.1 proof, v1 p.5; coefficient adapter to Newton identities.

**Needs.** `MvPolynomial.mul_esymm_eq_sum`.

### Counting Weil polynomials by power sums

For q≥2 and g≥1, the number of monic q-reciprocal integer polynomials (q^gP(X)=X^(2g)P(q/X)) of
degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4).

**Source.** [LT][LT], Lemma 2.1 and proof, v1 p.5, power-sum counting adaptation.

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F6](#f6-counting-isogeny-and-isomorphism-classes), Reconstruction from integer power sums.

### Asymptotic count of isogeny classes

For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log
g)).

**Source.** [LT][LT], Corollary 2.2, v1 p.5, using the power-sum count.

**Needs.** [F0](#f0-finite-field-frobenius-and-tate), Frobenius polynomial and reciprocity;
[F6](#f6-counting-isogeny-and-isomorphism-classes), Counting Weil polynomials by power sums;
[F3](#f3-hondatate-and-lattice-classifications), Frobenius polynomial determines the isogeny
class.

### Coarse isomorphism counts and conditional numerical assembly

For a fixed prime p let B(p,g) be the number of F_p-isomorphism classes of g-dimensional abelian
varieties. Prove the coarse asymptotic log B(p,g) = O_p(g²). Also prove the following
conditional numerical assembly: if the maximal size I_p(g) of a dimension-g isogeny class
satisfies I_p(g) ≤ 2^(34g²) p^(17g²(1+ε_g)) for an error ε_g → 0 uniform across those classes,
then B(p,g) ≤ 2^(34g²) p^((69/4)g²(1+o(1))). The first assertion uses coarse uniform lattice and
class-number estimates; the second explicitly assumes the sharper uniform estimate.

**Source.** [Lee][Lee], Theorem 1.1 and §3.1(5)–(10), contrasted with §3.2(11), PDF pp.1–9.

**Needs.** [F6](#f6-counting-isogeny-and-isomorphism-classes), Counting Weil polynomials by
power sums; [F4](#f4-adelic-class-sets-and-local-bounds), Coarse prime-field isomorphism count
at fixed adelic level; [F4](#f4-adelic-class-sets-and-local-bounds), Class-set comparison by
reduced norms; [F4](#f4-adelic-class-sets-and-local-bounds), Discriminant and ordered-root
bounds; [Completed/EffectiveBounds, layer
1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/EffectiveBounds/README.md#layer-1-effective-upper-bounds-the-first-migration-targets).

### DiPippo–Howe lower bound for isogeny classes

For n ≥ 1 and a prime power q, let O(q,n) be the set of ordinary n-dimensional F_q-isogeny
classes. Put c₄ = e^(−3/2), c₅ = 2 + √2 and r(q) = φ(q)/q. Prove #O(q,n) > c₄(c₅n)^(−2 log 2/log
q)(2^n/n!)(r(q)q^(n/2) − n)q^(n(n−1)/4). Combining this with the power-sum upper bound gives log
#Isog(q,g) = (1/4)g² log q + o_q(g²) for every fixed prime power q as g → ∞.

**Source.** [DPH][DPH], Theorem 1.3; Lemmas 2.1.1/2.1.3/2.5.1–3; Proposition 3.1.1; §3.2, PDF
pp.2,4,13–18.

**Needs.** [F3](#f3-hondatate-and-lattice-classifications), Honda–Tate simple isogeny
classification; [F6](#f6-counting-isogeny-and-isomorphism-classes), Asymptotic count of isogeny
classes.

### Asymptotic exclusion of squarefree nonreal ppavs

Fix a prime p for which the CM elliptic-power polarization estimate of F5 holds, in particular a
prime splitting in at least one of the nine class-number-one CM fields. As g → ∞, the proportion
of dimension-g principally polarized F_p-isomorphism classes whose underlying variety has no
repeated F_p-simple isogeny factor and whose Frobenius polynomial is coprime to X² − p tends to
zero.

**Source.** [LT][LT], Proposition 4.17 and Lemma 5.11, v1 pp.22–23,33, using the Hermitian mass
coefficient.

**Needs.** [F5](#f5-polarizations-and-cm-powers), Squarefree nonreal polarization bound;
[F6](#f6-counting-isogeny-and-isomorphism-classes), Asymptotic count of isogeny classes;
[F5](#f5-polarizations-and-cm-powers), Principal polarizations on CM elliptic powers;
[F6](#f6-counting-isogeny-and-isomorphism-classes), Coarse isomorphism counts and conditional
numerical assembly.

### Construction requirements

Evaluate the existing Newton recurrence on root occurrences, convert its signs to descending
coefficients and reconstruct the remaining coefficients by reciprocity. The DiPippo–Howe lower
bound needs the boundary control of the real-root region, weighted diamond lattice counts and
the ordinary realizability criterion, including the continuation of its finite-n proof. Retain
the possibly negative right side for small n; logarithms are taken only once it is positive. For
the coarse isomorphism count combine the exact local lattice and class-number bounds from F4–F5.
The numerical 69/4 specialization assumes a uniform per-isogeny-class bound with exponent 17,
then adds the independently proved isogeny-class exponent 1/4. Class-set finiteness or the
abstract D_*³h estimate alone does not imply that uniform numerical hypothesis. For the ppav
proportion retain both excluded factors: repeated F_p-simple factors and the real factor X² − p.

## References

Page numbers above refer to the linked version. Printed journal pages are identified
explicitly when they differ from PDF page numbers. The v1 counting arguments are used
with the separate polynomial, repeated-root, small-characteristic and mass hypotheses
stated in F4–F6.

- **KS**: Guido Kings and Johannes Sprang, *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*. Annals of Mathematics (2) 202 (2025), no. 1, 1–109. [KS][KS].

- **Smith**: Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*. Annals of Mathematics 200 (2024), no. 1. [Smith][Smith].

- **DGH**: Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, *Uniformity in Mordell–Lang for curves*. Annals of Mathematics 194 (2021), no. 1, 237–298. [DGH][DGH].

- **GH**: Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*. Annals of Mathematics 189 (2019), no. 2, 527–604. [GH][GH].

- **LT**: Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*. Duke Mathematical Journal 167(18) (2018), 3403–3453. [LT][LT].

- **GGK**: Ziyang Gao, Tangli Ge and Lars Kühne, *The Uniform Mordell–Lang Conjecture*. Publications Mathématiques de l'IHÉS 143 (2026), 189–235. [GGK][GGK].

- **Gao–Betti**: Ziyang Gao, *Generic rank of Betti maps and unlikely intersections*. arXiv:1810.12929v6. [Gao–Betti][Gao–Betti].

- **Gao–Ax**: Ziyang Gao, *Ax–Schanuel for the universal abelian variety*. arXiv:1806.01408v2. [Gao–Ax][Gao–Ax].

- **Lee**: Jungin Lee, *On the lower bound of the number of abelian varieties over F_p*. arXiv:2002.04420v3. [Lee][Lee].

- **DPH**: Stephen A. DiPippo and Everett W. Howe, *Real polynomials with all roots on the unit circle and abelian varieties over finite fields*. arXiv:math/9803097v3. [DPH][DPH].

- **Lemmermeyer**: Franz Lemmermeyer, *The ambiguous class number formula revisited*. arXiv:1309.1071v1. [Lemmermeyer][Lemmermeyer].

- **Conrad**: Brian Conrad, *Polarizations*. 2004 publicly available notes. [Conrad][Conrad].

- **Tate**: John Tate, *Endomorphisms of abelian varieties over finite fields*. Inventiones Mathematicae 2 (1966), 134–144. [Tate][Tate].

- **Waterhouse**: William C. Waterhouse, *Abelian varieties over finite fields*. Annales ENS (4) 2 (1969), 521–560. [Waterhouse][Waterhouse].

- **WM**: William C. Waterhouse and James S. Milne, *Abelian varieties over finite fields*. 1971, Part II, printed pp.60–61. [WM][WM].

- **Milne**: James S. Milne, *Extensions of abelian varieties defined over a finite field*. Inventiones Mathematicae 5(1968), 63–84; author-hosted published scan. [Milne][Milne].

- **Gao–Survey**: Ziyang Gao, *Recent developments of the Uniform Mordell–Lang Conjecture*. arXiv:2104.03431v5. [Gao–Survey][Gao–Survey].
[KS]: https://arxiv.org/pdf/1912.03657v4
[Smith]: https://arxiv.org/pdf/2111.12660v2
[DGH]: https://arxiv.org/pdf/2001.10276v3
[GH]: https://arxiv.org/pdf/1801.05762v3
[LT]: https://arxiv.org/pdf/1511.02212v1
[GGK]: https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf
[Gao–Betti]: https://arxiv.org/pdf/1810.12929v6
[Gao–Ax]: https://arxiv.org/pdf/1806.01408v2
[Lee]: https://arxiv.org/pdf/2002.04420v3
[DPH]: https://arxiv.org/pdf/math/9803097v3
[Lemmermeyer]: https://arxiv.org/pdf/1309.1071v1
[Conrad]: https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf
[Tate]: https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf
[Waterhouse]: https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf
[WM]: https://jmilne.org/math/articles/1971a.pdf
[Milne]: https://jmilne.org/math/articles/1968a.pdf
[Gao–Survey]: https://arxiv.org/pdf/2104.03431v5

Library declaration locations:

- [`TensorPower`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorPower/Basic.lean).
- [`PiTensorProduct.reindex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`PiTensorProduct.reindex_tprod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`PiTensorProduct.map_reindex`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean).
- [`LinearMap.eqLocus`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/EqLocus.lean).
- [`Submodule.mem_iInf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Lattice.lean).
- [`DividedPowerAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean).
- [`AddCircle`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Instances/AddCircle/Defs.lean).
- [`Polynomial.resultant`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Resultant/Basic.lean).
- [`PadicInt.appr_spec`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/RingHoms.lean).
- [`TauCeti.symmetricTensors`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean).
- [`PadicInt.valuation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean).
- [`MvPolynomial.mul_esymm_eq_sum`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean).
