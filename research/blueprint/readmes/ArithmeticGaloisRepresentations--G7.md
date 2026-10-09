# Arithmetic Galois representations: G7 follow-up

This is the target-level follow-up for **G7, operations, polarization, monodromy and image conditions**, issue #7954. It extends the accepted [parent packet](../packets/ArithmeticGaloisRepresentations.json) and its [reader](ArithmeticGaloisRepresentations.md), retaining all 77 G7 targets by their exact IDs. The [follow-up packet](../packets/ArithmeticGaloisRepresentations--G7.json) adds 20 missing key inputs and interfaces. Together these documents specify the plan; the [suggested Lean file](../suggested/ArithmeticGaloisRepresentations--G7.lean) proposes signatures and asserts no implementation.

The pass is complete and G7 is **planned**, with 22 named gaps and ten supplier entries, two of which identify already supplied work. It is not closed. The 63 entries in the parent's G7 worklist all receive a disposition below. The target-level instruction in WORKERS.md and detail.json dated 9 October 2026 supersedes that worklist's mechanical declaration-splitting instructions. Definitions retain their entire API and discriminating tests; proof steps stay with their target unless they supply a missing key input.

The eight new construction nodes have 32 API items and 26 tests. The continuous-transfer comparison additionally has six API items and four tests: **38 API items and 30 tests in total**. Two other comparisons have explicit bodies and basic examples. Fifteen targets have typed counterparts; five source-dependent targets identify the missing carriers that prevent honest signatures. Every implementation status is unchecked. At assembly the six marked planets replace the parent's G7 planet list.

## Mathematical conventions and boundaries

Let Γ be a topological group, A a commutative topological ring with continuous ring operations, and M a finite projective A-module with its module topology. A continuous representation means an algebraic action whose map Γ × M → M is jointly continuous. Continuity of each individual linear operator is a weaker condition. The imported R01.1 contract fixes this distinction. The follow-up extends existing tensor, symmetric and exterior powers; it does not define those functors again. The algebraic powers and their ranks exist without factorial inversion. Perfectness of a symmetric-power pairing has a separate factorial-unit hypothesis.

For arithmetic applications Γ is the absolute Galois group with its Krull topology, coefficients are a finite p-adic field, its algebraic closure, a finite field with discrete topology, or an adic local ring. Finite residual images factor through actual finite Galois quotients. Arithmetic Frobenius and the parent R01.2 inertia/localization maps keep their conventions; the new residual cyclotomic adapter uses Mathlib's action on roots of unity.

Trace on a finite projective module means contraction under M* ⊗ M ≃ End(M). Mathlib's LinearMap.trace uses the free-module branch and gives a default zero otherwise. These agree on finite free modules; that agreement cannot justify using the default trace on every projective module. The trace pairing is the projective one. Over a field, the trace kernel and the quotient by scalars are canonically dual, but their natural map is an isomorphism only when the dimension is nonzero in the field. The dimension-zero case is separated from the nonzero-space exactness theorem.

For polarization, retain the parent data of a perfect pairing B, multiplier μ and a **formal** sign ε. At an involution c outside the index-two subgroup Δ, covariance is B(ρ(h)x,ρ(chc)y)=μ(h)B(x,y), and B(y,x)=εB(x,y). The CHT dictionary forces μ(c)=−ε. In the CM case total oddness is the condition ε=+1 in this convention. In characteristic two the two scalar signs coincide, but the formal sign datum is still meaningful. Alternating means B(x,x)=0; skew symmetry alone is insufficient in characteristic two. The parent separately defines total oddness of a character, oddness of a similitude representation, and eigenspace balance at real places.

A general CHT coset representative γ₀ need not be an involution. Its triple identity involves ρ(γ₀²): B(x,ρ(γ₀²)y)=−μ(γ₀)B(y,x). One may use the involution specialization only when γ₀²=1. CHT Lemmas 2.1.1 and 2.1.4, pp. 7–10, supply the retained dictionary and extension classification. A choice of a pairing and a prescribed multiplier is substantive data; abstract essential conjugate self-duality does not create every prescribed multiplier. For an absolutely irreducible representation the relevant extensions form the retained k×/(k×)² torsor, with its hypotheses intact.

Write δ for the character equal to 1 on Δ and −1 outside. For a character χ of Δ, its transfer Tχ has Tχ(h)=χ(h)χ(chc⁻¹) and Tχ(c)=χ(c²). In rank one the CHT multiplier convention is Tχ=μδ. Consequently twisting changes μ to μTχ, tensoring changes it to μνδ, and a degree-d power changes it to μᵈδᵈ⁻¹. The last exponent is an integer: d=0 gives δ. For an ordinary similitude action on a form, covariance still uses μᵈ. These are different operations with specified component conventions, not competing formulas. BLGGT §1.1, pp. 11–13, and §2.1, p. 31, motivate these interfaces.

On Symᵈ(A²) the ordered monomial basis is x^(d−i)y^i for 0≤i≤d. The pinned count-zero multiset indexing requires reversing the input basis to obtain this order. Degree one then gives the original GL₂ matrix. The normalized rank-two pairing has antidiagonal entries (−1)^i/binom(d,i) when d! is a unit. The parent retains the small-characteristic exceptions. Invertibility of d! is a sufficient hypothesis for the chosen symmetric pairing; it is not a universal necessary condition for every invariant pairing, and no converse is claimed for a zero module.

Local Sen theory is owned here at tier 7. Choose a finite extension K/Q_p, an identification of its algebraic closure with Q_p-bar over Q_p, and a compatible embedding of a finite coefficient field E into C_p. The canonical operator on C_p ⊗_E V comes from cyclotomic invariants and decompletion, normalized by log(action)/log(cyclotomic). Thus the cyclotomic operator is +1. Newton–Thorne §1.2, p. 7, uses Hodge–Tate weight −1 for the cyclotomic character; negate its stated weights when comparing conventions. Distinctness and weight differences up to sign are unaffected. A Hodge–Tate representation has a semisimple operator with integral eigenvalues. Integral eigenvalues by themselves do not suffice: the logarithmic unipotent example has a nonzero nilpotent operator. The weights used in monodromy statements are these actual labelled eigenvalues, not a weight function supplied independently of the representation.

The global lifting input is H²(G_F,Q/Z)=0 for the trivial discrete action. It includes real places. It does not imply H²(G_F,μ_n)=0 for a fixed denominator. The continuous-cochain signature uses the discrete topology explicitly, rather than AddCircle's default topology. Conrad Lemma 5.2, pp. 14–15, gives almost-everywhere unramifiedness of an already continuous lift through an arbitrary central algebraic quotient. Proposition 5.3, pp. 15–16, gives existence through a central torus quotient using Tate's theorem. Neither assertion is restricted to isogenies; finite central kernels can have genuine lifting obstructions. Conrad Corollary 6.7, p. 28, and Patrikis Lemmas 2.7.4–2.7.5, pp. 48–49, supply the retained geometric lifting hypotheses, rather than an automatic geometric lift through every central kernel.

The residual conditions remain distinct. Weak adequacy concerns spanning End(V) by semisimple elements. Adequacy using ad⁰ and GHT adequacy using End(V)/k differ when p divides dim V. GHT Corollary 9.4, pp. 50–51, retains its explicit SL₂ exceptions and the H² contribution for q=4,9. GL_n enormousness includes absence of p-power quotients, H⁰ and H¹ vanishing on ad⁰, and the eigenprojector trace witness with n distinct eigenvalues. Scalar identity makes H⁰ fail when p divides n. Scalar and coefficient extension arguments keep their hypotheses and descent inputs.

BCGP Definition 7.5.2, pp. 198–199, uses H¹ on sp₄, absolute irreducibility of the standard representation, and its E3 witness. It is not the GL_n definition with a no-p-power-quotient clause added. Vastness refers to the cyclotomic-tower image, or the specified weak-enormity and cyclotomic-field alternative in Definition 7.5.6; tidiness in Definition 7.5.11, p. 201, uses multiplier and eigenvalue ratios and does not require all eigenvalues distinct. The finite calculations behind Lemma 7.5.15, pp. 201–202, remain uncertified. The nontrivial field-automorphism graph case is kept separate from the ordinary SL₂ wreath and quaternion cases. Generalized eigenprojectors, unlike projection onto ordinary eigenspaces, are defined on Jordan blocks; GN Remark 3.2.2 and Lemma 3.2.3, p. 15, make that convention consequential.

Taylor–Wiles base change must control the **joint** residual and cyclotomic image. Disjointness from the full joint splitting field preserves residual image, its cyclotomic-character-one slice and a scalar witness outside that slice. For preservation of decomposed genericity, retain the stronger rational Galois-closure hypotheses of BCGNT Lemma 5.2.2, p. 51, and the parent's Chebotarev route. An adjoint splitting field alone need not preserve the scalar/cyclotomic information.

## Existing work and assembly rules

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The declarations listed below were read at those pins. Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and current TauCetiRoadmap main 5a7b3a4fd66441748be2dfa961e8f140f995cb03 were also read. They are recorded separately: a later implementation is not a claim about an older pin.

Current Tau Ceti already has continuous transfer, algebraic tensor induction, image factorization, the derived-ideal/commutator comparison and the component-group fppf projection. The continuity theorem for transfer only requires the weaker separate-continuity hypotheses in its current declaration; this arithmetic wrapper uses topological groups. The pinned suggested file admits the post-pin continuity proof, while its underlying transfer body is the existing Mathlib one. No new project to implement that generic theorem is requested.

Read current ReductiveGroups, ProfiniteCohomology, ClassFieldTheory, IntegralHeckeAndGaloisDeterminants, RepresentationTheory and ClassicalGroups, and the newer OrthogonalSpinGroups, LocalGaloisGroups and ProfiniteArithmetic. OrthogonalSpinGroups supplies quadratic isometries and O/SO, not the GO multiplier by itself. LocalGaloisGroups' marked local groups do not supply Sen decompletion or global Tate vanishing. ProfiniteArithmetic supplies generic character assembly. IntegralHeckeAndGaloisDeterminants already plans determinant reconstruction with the residual splitness and absolute irreducibility hypotheses; G7 imports it.

The higher-tier dependency repair moves only minimal local Sen, labelled Hodge–Tate/rank-one comparisons, and global rational-torsion vanishing into G7. Full period rings and general p-adic Hodge comparisons stay upstairs and import these inputs. ArithmeticGaloisDuality likewise imports the Tate theorem from here. The packet lists eight exact prerequisite replacements and thirteen refinement additions. Apply them before computing the assembled graph; the accepted parent remains untouched. The resulting graph on all 327 parent nodes and 20 additions has no cycle. The four reader blocks below organize G7 without creating new roadmap stages.

Import every accepted target's statement, hypotheses, API, tests and source findings by the exact IDs in the inventory. The original source findings retain their edition-scoped status; this follow-up does not claim a fresh published-edition audit. No new source error is asserted. The follow-up's references to sources are own mathematical statements and proof routes. Public-source fingerprints and read boundaries are in its packet. Public Milne locators replace the unread Borel boundary; no uncleared copy of Borel is used.

## Continuous operations and adjoints

<a id="power-carriers-and-joint-continuity"></a>

### Finite-projective power carriers and joint continuity

`ArithmeticGaloisRepresentations:G7/followup-power-carriers-and-joint-continuity` · theorem · implementation unchecked

For a topological commutative ring A, a topological group Γ and a finite projective A-module M with the module topology, T^d M, Sym^d M and exterior^d M are finite projective. If ρ has jointly continuous action on M, their existing algebraic power actions are jointly continuous for the module topology on each power. The result includes d=0 and the zero module.

**Hypotheses.** d is a natural number; no factorial is inverted. The ring operations and group operations are continuous. Joint continuity of Γ×M→M is assumed.

**Proof route.**

1. Choose a finite free complement of M. Sym^d of a direct sum decomposes by degree, so the summand Sym^d M is finite projective; the analogous tensor and exterior constructions give their summands. R01.1 already supplies the exterior rank/base-change theorem.
2. Use finite generators to test orbit continuity. On tensor generators the action is a finite multilinear polynomial in the input coordinates.
3. The universal symmetric and alternating quotients split linearly because the output modules are projective. Their sections are continuous for the module topology, so their products with Γ are quotient maps too. Descend joint continuity and use the finite-module bilinear evaluation theorem.
4. The zero-degree coefficient module has trivial action; no division by d! occurs.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.1/continuous-representation`; `ArithmeticGaloisRepresentations:R01.1/exterior-powers-of-finite-projective-modules`; `tauceti:Representation.tensorPower`; `tauceti:Representation.symmetricPower`; `mathlib:exteriorPower.map`; `mathlib:IsModuleTopology.continuous_bilinear_of_finite_left`; `mathlib:IsModuleTopology.isQuotientMap_of_surjective`.

**Names.** `TauCeti.ArithmeticG7.powerCarriers`, `TauCeti.ArithmeticG7.tensorPower_jointContinuous`, `TauCeti.ArithmeticG7.symmetricPower_jointContinuous`, `TauCeti.ArithmeticG7.exteriorPower_jointContinuous`.

**Source support.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 notation p. 7; Lemma 4.7 pp. 33–34: Arithmetic consumers use symmetric and tensor powers of continuous representations; this node adds the projective/topological carrier argument to the existing algebraic functors.

**Acceptance.** Degree zero is the trivial action on A, rank one; exterior^d is zero for d exceeding constant rank. Continuity concerns the uncurried action, not only continuity of individual endomorphisms.

**Open proof inputs.** Symmetric-projective local-to-global proof interface. The precise requirements appear in the gap register below.

<a id="projective-trace-contract"></a>

### Trace by projective duality

`ArithmeticGaloisRepresentations:G7/followup-projective-trace-contract` · construction · implementation unchecked

Planet: **Projective trace**.

For a commutative ring A and a finite projective A-module M, projectiveTrace: End_A(M)→A is contraction after the inverse of M-dual tensor M ≃ End_A(M). It evaluates a rank-one map x↦φ(x)m to φ(m), is cyclic, commutes with scalar extension, and equals LinearMap.trace whenever M has a finite free basis.

**Hypotheses.** M is finite and projective; it need not be free.

**Proof route.**

1. Use dualTensorHomEquiv with finite-projective source; contractLeft is evaluation.
2. Check the rank-one formula on tensors. Cyclicity follows on sums of rank-one maps by swapping evaluations.
3. Both maps commute with scalar extension. In a basis evaluation is the sum of diagonal entries.

**Prerequisites.** `mathlib:contractLeft`; `mathlib:dualTensorHomEquiv`; `mathlib:LinearMap.trace`; `mathlib:LinearMap.trace_mul_comm`.

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.projectiveTrace` | constructor | The contraction linear map End_A(M)→A. |
| `TauCeti.ArithmeticG7.projectiveTrace_rankOne` | simp | tr(m⊗φ)=φ(m). |
| `TauCeti.ArithmeticG7.projectiveTrace_mul_comm` | relation | tr(fg)=tr(gf). |
| `TauCeti.ArithmeticG7.projectiveTrace_free` | compatibility | For free M it equals LinearMap.trace A M. |
| `TauCeti.ArithmeticG7.projectiveTrace_baseChange` | functoriality | For every A-algebra B, tr_B(f⊗B)=image_B(tr_A f). |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.projectiveTrace.tests_rankOne` (computation): On A, multiplication by a has trace a.
- `TauCeti.ArithmeticG7.projectiveTrace.tests_zero` (degenerate): The identity of the zero free module has trace zero.
- `TauCeti.ArithmeticG7.projectiveTrace.tests_freeMatrix` (compatibility): On A^n, the trace of Matrix.toLin a is the sum of the diagonal entries of a.
- `TauCeti.ArithmeticG7.projectiveTrace.tests_nonfree` (non-example): If M is nonfree and φ(m)=1, contraction gives trace one for m⊗φ, whereas LinearMap.trace gives zero. This conditional comparison does not assert such a pair exists on every nonfree M.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/adjoint-representations`](ArithmeticGaloisRepresentations.md#G7-adjoint-representations): The trace kernel ad⁰ uses this projective trace.
- [`ArithmeticGaloisRepresentations:G7/trace-pairing-on-matrices-is-perfect`](ArithmeticGaloisRepresentations.md#G7-trace-pairing-on-matrices-is-perfect): The trace pairing is formed by composing multiplication with contraction.

**Source support.**

- [Laurent Clozel, Michael Harris and Richard Taylor, Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/article/PMIHES_2008__108__1_0.pdf), §2.1 p. 7 (adjoint action); Definition 2.5.1 p. 55 (trace-zero adjoint): Adjoint and trace-zero coefficients require a trace independent of a basis; contraction is the projective extension of the matrix trace used there.

**Acceptance.** Over a nonfree projective module Mathlib trace is not an acceptable substitute: its fallback value is zero.

<a id="adjoint-kernel-quotient-exactness"></a>

### Trace kernel versus quotient by scalars

`ArithmeticGaloisRepresentations:G7/followup-adjoint-kernel-quotient-exactness` · construction · implementation unchecked

For a nonzero finite-dimensional vector space V over a field k, let n=dim V. The natural map q:ker(tr)→End(V)/k·1 has kernel the scalar maps a·1 with n·a=0, and cokernel k/nk. It is bijective exactly when n is nonzero in k. This supplements the parent’s projective/ring statement with a checked field signature.

**Hypotheses.** V is nonzero and finite dimensional; k has arbitrary characteristic.

**Proof route.**

1. Form q as inclusion of the trace kernel followed by the quotient map.
2. The kernel consists of scalar maps of trace na. The trace map End(V)→k is onto, witnessed by one matrix diagonal unit.
3. The quotient of End(V) by ker tr plus the scalar line identifies with k/nk. Use rank-nullity or the first isomorphism theorem for the bijectivity criterion.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-projective-trace-contract`](#projective-trace-contract).

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.traceZeroToScalarQuotient` | constructor | Include ker tr in End and then quotient by the scalar line. |
| `TauCeti.ArithmeticG7.traceZeroToScalarQuotient_kernel` | characterisation | The kernel is the scalar line pulled back to ker tr. |
| `TauCeti.ArithmeticG7.traceZeroToScalarQuotient_bijective_iff` | characterisation | For V≠0, q is bijective iff (dim V:k)≠0. |
| `TauCeti.ArithmeticG7.traceZeroToScalarQuotient_cokernel` | equivalence | Coker q is linearly equivalent to k/(dim V)k. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.traceZeroToScalarQuotient.tests_rankOne` (degenerate): In dimension one q is the bijection from zero to zero.
- `TauCeti.ArithmeticG7.traceZeroToScalarQuotient.tests_charTwo` (non-example): For V=F₂² the map is not bijective.
- `TauCeti.ArithmeticG7.traceZeroToScalarQuotient.tests_charThree` (computation): For V=F₃² the map is bijective.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/adequate-subgroup`](ArithmeticGaloisRepresentations.md#G7-adequate-subgroup): Distinguishes GHT adequacy on the scalar quotient from ad⁰ adequacy when p divides n.
- [`ArithmeticGaloisRepresentations:G7/enormous-image-and-its-coefficient-extension-invariance`](ArithmeticGaloisRepresentations.md#G7-enormous-image-and-its-coefficient-extension-invariance): The scalar identity witnesses failure when p divides n.

**Source support.**

- [Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.2.29 and Remark 6.2.31 pp. 1044–1045: The residual enormity condition uses ad⁰ and excludes p dividing the dimension; q explains why ad⁰ must not silently be identified with the scalar quotient.

**Acceptance.** Characteristic dividing n gives a scalar in the trace kernel and a nonzero cokernel.

<a id="generalized-eigenspace-complement"></a>

### The generalized eigenspace complement

`ArithmeticGaloisRepresentations:G7/followup-generalized-eigenspace-complement` · lemma · implementation unchecked

For a finite-dimensional vector space over an algebraically closed field, the maximal generalized α-eigenspace of f is complementary to the sum of all maximal generalized β-eigenspaces with β≠α.

**Hypotheses.** Finite dimensionality and algebraic closedness; f need not be semisimple.

**Proof route.**

1. Algebraic closedness splits the characteristic polynomial and gives triangularizability.
2. Use independence of maximal generalized eigenspaces and their supremum being top to separate the α-summand.

**Prerequisites.** `mathlib:Module.End.independent_maxGenEigenspace`; `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`.

**Names.** `TauCeti.ArithmeticG7.generalizedEigen_isCompl`.

**Source support.**

- [Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.2.31 p. 1045: The equivalent enormity trace condition uses the eigenprojector; this supplies the direct-sum complement needed to define it.

**Acceptance.** An absent eigenvalue gives zero as the selected summand and the full space as complement.

<a id="generalized-eigenprojector"></a>

### Generalized eigenprojectors

`ArithmeticGaloisRepresentations:G7/followup-generalized-eigenprojector` · construction · implementation unchecked

Planet: **Generalized eigenprojector**.

For f∈End_k(V), k algebraically closed and V finite dimensional, generalizedEigenprojector(f,α) is projection onto the maximal generalized α-eigenspace along the sum of the other generalized eigenspaces. It is defined even when α is absent and when f has Jordan blocks.

**Hypotheses.** No semisimplicity hypothesis.

**Proof route.**

1. Use the preceding complement theorem and Submodule.projection.
2. The formulas on each summand prove uniqueness, idempotence and commutation with f.
3. Conjugation carries each generalized eigenspace and the complement to the corresponding summands.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-generalized-eigenspace-complement`](#generalized-eigenspace-complement); `mathlib:Submodule.projection`.

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.generalizedEigenprojector` | constructor | Projection onto the generalized α-eigenspace. |
| `TauCeti.ArithmeticG7.generalizedEigenprojector_on` | simp | It is the identity on its chosen generalized eigenspace. |
| `TauCeti.ArithmeticG7.generalizedEigenprojector_off` | simp | It is zero on every other generalized eigenspace. |
| `TauCeti.ArithmeticG7.generalizedEigenprojector_idempotent` | relation | Its square equals itself. |
| `TauCeti.ArithmeticG7.generalizedEigenprojector_commute` | relation | It commutes with f. |
| `TauCeti.ArithmeticG7.generalizedEigenprojector_conj` | functoriality | Projection commutes with conjugation by a linear equivalence. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.generalizedEigenprojector.tests_scalar` (computation): For f=α·1 the α-projector is 1.
- `TauCeti.ArithmeticG7.generalizedEigenprojector.tests_absent` (non-example): For f=α·1 and β≠α the β-projector is zero.
- `TauCeti.ArithmeticG7.generalizedEigenprojector.tests_zero` (degenerate): On the zero space every projector is zero.
- `TauCeti.ArithmeticG7.generalizedEigenprojector.tests_jordan` (computation): For the 2×2 Jordan block with diagonal α and upper entry 1 the α-projector is the full identity; projection only onto the ordinary eigenspace fails.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/vast-tidy-and-enormous-gsp4-subgroups`](ArithmeticGaloisRepresentations.md#G7-vast-tidy-and-enormous-gsp4-subgroups): E3 requires an eigenprojector witness.
- [`ArithmeticGaloisRepresentations:G7/characteristic-zero-enormous-subgroups`](ArithmeticGaloisRepresentations.md#G7-characteristic-zero-enormous-subgroups): The characteristic-zero enormity trace condition uses these projectors.

**Source support.**

- [T. Gee, J. Newton, Patching and the completed homology of locally symmetric spaces](https://arxiv.org/pdf/1609.06965v5), Remark 3.2.2 and proof of Lemma 3.2.3 p. 15: Adequacy uses projection onto a generalized eigenspace; with a single eigenvalue the projector is the full identity. This motivates the Jordan-block and absent-eigenvalue conventions.
- [Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor, Thorne, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.2.31 p. 1045: The enormity trace criterion uses eigenprojectors in the distinct-eigenvalue case.

**Acceptance.** The projector is uniquely fixed by its values on the generalized eigenspaces.

<a id="framed-symmetric-power-baseline-comparison"></a>

### The monomial matrix of the existing symmetric-power action

`ArithmeticGaloisRepresentations:G7/followup-framed-symmetric-power-baseline-comparison` · comparison · implementation unchecked

For any commutative ring A and d≥0, the existing GL₂(A) action on Sym^d(A²) is expressed in the ordered basis x^(d−i)y^i, 0≤i≤d, by a homomorphism GL₂(A)→GL_(d+1)(A). It is obtained by transporting TauCeti.symPowerRep through the symmetric-power basis, reversing the two input indices before the count-zero multiset equivalence. The degree-one matrix is g and degree-zero matrix is 1.

**Hypotheses.** A is commutative; no factorial inversion. The adapter uses the pinned universe-zero symmetric-power API.

**Proof route.**

1. Use the existing symmetric-power basis and symFinTwoEquiv. Counting zeros of the reversed input basis counts copies of y.
2. Transport the existing GL₂ action through Matrix.GeneralLinearGroup.toLin'.
3. Compare the resulting matrix with LinearMap.toMatrix in this basis.

**Prerequisites.** `tauceti:TauCeti.symPowerRep`; `tauceti:Module.Basis.symmetricPower`; `tauceti:TauCeti.symFinTwoEquiv`; `mathlib:Matrix.GeneralLinearGroup.toLin'`.

**Names.** `TauCeti.ArithmeticG7.monomialBasis`, `TauCeti.ArithmeticG7.framedSymmetricPower`, `TauCeti.ArithmeticG7.framedSymmetricPower_matrix`.

**Source support.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Lemma 2.3(1) p. 11: The finite rank-two image criterion uses the symmetric-power homomorphism into GL_r. The monomial-basis adapter here is specified using the existing pinned Tau Ceti basis and action, rather than claiming that the source fixes this indexing.

**Acceptance.** In degree one a swapped basis would conjugate g by the swap matrix and fail the comparison. In degree zero the image is the identity regardless of g.

<a id="continuous-character-transfer"></a>

### Continuous transfer of characters: the current-library comparison

`ArithmeticGaloisRepresentations:G7/followup-continuous-character-transfer` · comparison · implementation unchecked

Let H be an open finite-index subgroup of a topological group Γ and C a commutative topological group. For a continuous character χ:H→C, the existing algebraic character transfer is continuous. characterTransfer is that homomorphism with the continuity proof, independent of a transversal. For index two and c outside H it restricts to χ(h)χ(chc⁻¹) and takes c to χ(c²).

**Hypotheses.** H is open and has finite index; Γ and C are topological groups. The target C is commutative. Index-two formulas include the index-two hypothesis and the subgroup membership proofs.

**Proof route.**

1. Continuity is already proved by TauCeti.continuous_transfer at current main (recorded in currentLibrary). The prototype is a bundled continuous-character adapter at the older pins, not a new continuity proof project.
2. The underlying function is exactly MonoidHom.transfer. Its finite-transversal formula supplies the arithmetic index-two evaluations; no new algebraic transfer is defined.
3. For index two use representatives 1,c: h fixes both cosets and c interchanges them. For a restricted Γ-character, all Schreier products cancel to χ(g)^[Γ:H].

**Prerequisites.** `mathlib:MonoidHom.transfer`; `mathlib:MonoidHom.transfer_def`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.characterTransfer` | constructor | The continuous character whose underlying hom is MonoidHom.transfer χ. |
| `TauCeti.ArithmeticG7.characterTransfer_continuous` | characterisation | The algebraic transfer has continuous underlying function under these hypotheses. |
| `TauCeti.ArithmeticG7.characterTransfer_eq_transfer` | compatibility | Its underlying hom is exactly the pinned transfer. |
| `TauCeti.ArithmeticG7.characterTransfer_restrict_indexTwo` | simp | For index two, χ-transfer(h)=χ(h)χ(chc⁻¹). |
| `TauCeti.ArithmeticG7.characterTransfer_outside_indexTwo` | simp | For index two, χ-transfer(c)=χ(c²). |
| `TauCeti.ArithmeticG7.characterTransfer_mul` | functoriality | Transfer of a product of characters is the product of transfers. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.characterTransfer.tests_trivial` (degenerate): The trivial H-character transfers to the trivial Γ-character.
- `TauCeti.ArithmeticG7.characterTransfer.tests_outsideInvolution` (computation): In index two, for c²=1 outside H, every character transfers to value 1 at c.
- `TauCeti.ArithmeticG7.characterTransfer.tests_extendingCharacter` (characterisation): If χ is a Γ-character, transfer of χ|H is χ^[Γ:H].
- `TauCeti.ArithmeticG7.characterTransfer.tests_algebraicAgreement` (compatibility): Evaluation equals the existing MonoidHom.transfer at every g.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`](ArithmeticGaloisRepresentations.md#G7-operations-on-polarized-representations): Twisting changes μ to μ times the transfer.
- [`ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group): The rank-one CHT dictionary is χ-transfer=μδ.
- [`ArithmeticGaloisRepresentations:G7/tensor-induction`](ArithmeticGaloisRepresentations.md#G7-tensor-induction): Tensor induction of a character is this transfer.

**Source support.**

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §1.1 p. 12, rank-one description: The rank-one CHT dictionary uses character composed with transfer, including the value at an element outside the index-two subgroup.

**Acceptance.** Continuity is proved for the homomorphism itself; it does not follow merely from continuity of the individual factors χ.

## Disconnected polarization multipliers and form comparison

<a id="quadratic-coset-character"></a>

### The quadratic coset character

`ArithmeticGaloisRepresentations:G7/followup-quadratic-coset-character` · construction · implementation unchecked

Planet: **Quadratic character**.

For an open subgroup H of index two in Γ and a topological commutative ring A, δ_H:Γ→A× is 1 on H and −1 on its other coset. It is a continuous homomorphism and δ_H²=1. In characteristic two it is the trivial units-valued character, while the separate polarization sign remains part of the parent’s data.

**Hypotheses.** Γ is a topological group; A is a topological commutative ring. The index is exactly two; there is no assumption that 2 is invertible.

**Proof route.**

1. An index-two subgroup is normal; multiplication of cosets gives multiplicativity of the two-valued function.
2. Each coset is open, giving continuity of the locally constant function.

**Prerequisites.** .

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.quadraticCosetCharacter` | constructor | Continuous δ_H taking values 1 and −1 according to membership. |
| `TauCeti.ArithmeticG7.quadraticCosetCharacter_on` | simp | δ_H(h)=1 for h∈H. |
| `TauCeti.ArithmeticG7.quadraticCosetCharacter_off` | simp | δ_H(c)=−1 outside H. |
| `TauCeti.ArithmeticG7.quadraticCosetCharacter_sq` | relation | δ_H²=1. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.quadraticCosetCharacter.tests_charTwo` (degenerate): Over a characteristic-two ring δ_H is the trivial character.
- `TauCeti.ArithmeticG7.quadraticCosetCharacter.tests_outside` (computation): Every element outside H has value −1.
- `TauCeti.ArithmeticG7.quadraticCosetCharacter.tests_onSubgroup` (computation): Every element of H has value 1.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/followup-tensor-multiplier`](#tensor-multiplier): Supplies the extra CHT tensor sign.
- [`ArithmeticGaloisRepresentations:G7/followup-power-multiplier`](#power-multiplier): Supplies δ^(d−1), including d=0.
- [`ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group): Makes ν(j)=−1 compatible with the rank-one transfer identity.

**Source support.**

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §1.1 pp. 11–12, tensor map and rank-one paragraph: The disconnected component sign corrects the multiplier for CHT tensor operations and the transfer identity.

**Acceptance.** The values are units even in characteristic two.

<a id="tensor-multiplier"></a>

### The CHT tensor multiplier

`ArithmeticGaloisRepresentations:G7/followup-tensor-multiplier` · construction · implementation unchecked

For continuous multipliers μ,ν on Γ and H of index two, define tensorMultiplier=μνδ_H. This is the multiplier of the CHT tensor homomorphism on the subgroup of pairs with matching component. The underlying pairing is the tensor of the two perfect pairings and its formal sign is the product of signs.

**Hypotheses.** Matching index-two subgroup H; μ and ν are continuous units-valued characters. The parent’s pairing hypotheses, finite projectivity, and perfectness are required when promoting the multiplier to a polarized tensor representation.

**Proof route.**

1. Multiply the three continuous characters.
2. On H, δ is 1. On the other component both source multipliers contain the j-sign, and the target contains it only once; δ corrects the product.
3. Apply the tensor pairing covariance and symmetry identities from the retained operation node.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-quadratic-coset-character`](#quadratic-coset-character).

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.tensorMultiplier` | constructor | The product μνδ_H as a continuous character. |
| `TauCeti.ArithmeticG7.tensorMultiplier_eval` | simp | Its value at g is μ(g)ν(g)δ_H(g). |
| `TauCeti.ArithmeticG7.tensorMultiplier_restrict` | simp | On H its value is μ(h)ν(h). |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.tensorMultiplier.tests_outsideInvolution` (computation): If μ(c)=ν(c)=−1 outside H, their tensor multiplier has value −1.
- `TauCeti.ArithmeticG7.tensorMultiplier.tests_trivialFactors` (non-example): Tensoring the two trivial characters gives δ_H, not the trivial character in characteristic different from two.
- `TauCeti.ArithmeticG7.tensorMultiplier.tests_restriction` (compatibility): On H it agrees with the ordinary product μν.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`](ArithmeticGaloisRepresentations.md#G7-operations-on-polarized-representations): Supplies the arithmetic tensor polarization multiplier.
- [`ArithmeticGaloisRepresentations:G7/taylor-wiles-unitary-tensor-multiplier`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-multiplier): Controls the component convention in tensor-image multiplier calculations.

**Source support.**

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §1.1 p. 11, tensor homomorphism: The multiplier of the disconnected tensor map contains the component sign in addition to the product.

**Acceptance.** Dropping δ fails even for two trivial source multipliers.

<a id="power-multiplier"></a>

### The CHT power multiplier

`ArithmeticGaloisRepresentations:G7/followup-power-multiplier` · construction · implementation unchecked

For d≥0, a continuous μ and an open index-two H, powerMultiplier(μ,d)=μ^d δ_H^(d−1), using an integer exponent for d−1. It is the CHT multiplier of the d-th exterior-power polarization, and of the d-th symmetric-power polarization when d! is a unit. The formal sign of the pairing is ε^d.

**Hypotheses.** d is any natural number, including zero. Exterior powers require only the parent’s perfect pairing hypotheses; the permanent symmetric pairing requires d! invertible.

**Proof route.**

1. Use pointwise multiplication and integer powers of continuous characters.
2. The power pairing has covariance μ^d on H. Its extension outside H must have the single target j-sign rather than d source signs, which gives δ^(d−1).
3. For d=0 the rank-one trivial representation still has the CHT component multiplier δ, so a natural-number truncated subtraction is wrong.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-quadratic-coset-character`](#quadratic-coset-character); [`ArithmeticGaloisRepresentations:G7/symmetric-power-polarization`](ArithmeticGaloisRepresentations.md#G7-symmetric-power-polarization).

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.powerMultiplier` | constructor | The continuous character μ^dδ^(d−1). |
| `TauCeti.ArithmeticG7.powerMultiplier_eval` | simp | Evaluation at g is μ(g)^dδ(g)^(d−1), with integer exponent. |
| `TauCeti.ArithmeticG7.powerMultiplier_restrict` | simp | On H the multiplier equals μ(h)^d. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.powerMultiplier.tests_zero` (degenerate): Power degree zero has multiplier δ.
- `TauCeti.ArithmeticG7.powerMultiplier.tests_one` (compatibility): Power degree one has multiplier μ.
- `TauCeti.ArithmeticG7.powerMultiplier.tests_two` (computation): Power degree two has multiplier μ²δ.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`](ArithmeticGaloisRepresentations.md#G7-operations-on-polarized-representations): Exterior and symmetric-power polarized operations.
- [`ArithmeticGaloisRepresentations:G7/symmetric-power-polarization`](ArithmeticGaloisRepresentations.md#G7-symmetric-power-polarization): Separates CHT multiplier convention from the μ^d covariance of the underlying ordinary similitude form.

**Source support.**

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §1.1 pp. 11–13, ν(j) and disconnected operations: The single disconnected target component determines the sign correction for powers; the formula is derived from the group law and the retained pairing operations.

**Acceptance.** Degree zero, one and two distinguish the exponent convention.

<a id="twist-multiplier"></a>

### The polarized twist multiplier

`ArithmeticGaloisRepresentations:G7/followup-twist-multiplier` · construction · implementation unchecked

For an open finite-index subgroup H, a continuous Γ-character μ and a continuous H-character χ, twistMultiplier=μ·characterTransfer(χ). In the index-two polarization setting its restriction is μ(h)χ(h)χ(chc⁻¹), and outside H its value is μ(c)χ(c²). If χ extends to Γ it is μχ² in index two.

**Hypotheses.** The constructor works for every finite index. All polarization formulas involving two factors assume index two.

**Proof route.**

1. Multiply μ with the continuous transfer.
2. Use the transfer’s index-two evaluation formulas to match covariance of the original pairing twisted by χ.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-continuous-character-transfer`](#continuous-character-transfer).

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.twistMultiplier` | constructor | μ times the transferred character. |
| `TauCeti.ArithmeticG7.twistMultiplier_eval` | simp | Evaluation is μ(g) times χ-transfer(g). |
| `TauCeti.ArithmeticG7.twistMultiplier_restrict` | simp | At h∈H, in index two, it is μ(h)χ(h)χ(chc⁻¹). |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.twistMultiplier.tests_trivialTwist` (degenerate): The trivial twisting character preserves μ.
- `TauCeti.ArithmeticG7.twistMultiplier.tests_outsideInvolution` (computation): In index two, for c²=1 outside H, twisting preserves μ(c).
- `TauCeti.ArithmeticG7.twistMultiplier.tests_extendingCharacter` (compatibility): In index two, twisting by a restricted Γ-character changes μ to μχ².

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`](ArithmeticGaloisRepresentations.md#G7-operations-on-polarized-representations): A character twist must give a continuous multiplier on Γ, rather than only a character on H.
- [`ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group): The rank-one transfer formula specifies the extension at the other component.

**Source support.**

- [Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §1.1 p. 12 rank-one dictionary; §2.1 p. 31 polarized pairs: Rank-one transfer supplies the multiplier of a twisted polarized representation, not an arbitrary extension of χχ^c.

**Acceptance.** The index-two hypothesis must remain in the signatures of the restriction and extending-character tests.

<a id="centralizer-conjugacy-of-alternating-forms"></a>

### Equivariant conjugacy of alternating forms

`ArithmeticGaloisRepresentations:G7/followup-centralizer-conjugacy-of-alternating-forms` · theorem · implementation unchecked

Let k be algebraically closed of characteristic different from two, V finite dimensional, ρ:Γ→GL(V) semisimple, and μ:Γ→k×. If B and C are perfect alternating forms both satisfying B(ρ(g)x,ρ(g)y)=μ(g)B(x,y) and the analogous identity for C, there is a linear automorphism e centralizing ρ with C(ex,ey)=B(x,y). Thus semisimple GSp representations with the same underlying GL representation and multiplier are conjugate in GSp.

**Hypotheses.** Algebraic closedness, semisimplicity, perfect alternating forms, same multiplier; 2≠0.

**Proof route.**

1. Decompose V into irreducible isotypic blocks. A block paired with a distinct μ-twisted dual has a hyperbolic pairing; a change of multiplicity-space basis identifies the two pairings.
2. For a self-dual simple block, Schur’s lemma fixes its form up to scalar. The multiplicity-space form has the complementary symmetry.
3. Over k all perfect forms of the same symmetry and dimension are isometric; assemble the multiplicity-space changes, which centralize ρ. This proof bypasses a stronger abstract square-root theorem for algebras with involution.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/schur-lemma-over-local-rings`](ArithmeticGaloisRepresentations.md#G7-schur-lemma-over-local-rings).

**Names.** `TauCeti.ArithmeticG7.alternatingForms_centralizer`.

**Source support.**

- [Wee Teck Gan and Shuichiro Takeda, The local Langlands conjecture for GSp(4)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf), Lemma 6.1 and proof pp. 1859–1860: The proof identifies symplectic realizations of a semisimple representation with fixed similitude by an isotypic decomposition.

**Acceptance.** The automorphism must centralize ρ; ordinary nonequivariant isometry is insufficient. The statement does not promise GO conjugacy from determinant alone.

**Open proof inputs.** Equivariant form classification interface. The precise requirements appear in the gap register below.

## Sen theory, central lifting and monodromy

<a id="local-sen-operator"></a>

### The local Sen operator with labelled coefficients

`ArithmeticGaloisRepresentations:G7/followup-local-sen-operator` · construction · implementation unchecked

Planet: **Sen operator**.

Fix a prime p, finite extensions K,E of Q_p, a Q_p-algebra identification τ:AlgebraicClosure(K)≃Q_p-bar (hence an embedding of K) and a coefficient embedding E→C_p compatible with Q_p. For a finite-dimensional E-space V with a continuous G_K action, construct the canonical C_p-linear operator Θ_(ρ,τ,ι) on C_p tensor_(E,ι) V. It is induced from the Sen module over the cyclotomic tower and normalized by log(action)/log(cyclotomic). This fixes cyclotomic weight +1. For embeddings whose coefficient image is not contained in K, first restrict to the finite compositum and use invariance under finite restriction.

**Hypotheses.** p is prime. K and E are finite Q_p extensions. E has its normed-field topology, V its finite-module topology. The identification of the chosen algebraic closure of K with Q_p-bar and the E-algebra structure on C_p are explicit; compatible scalar towers are required.

**Proof route.**

1. Use Mathlib’s PadicComplex as C_p. Extend the action of G_K on the algebraic closure continuously to its completion; form the semilinear tensor action after passing to the finite compositum containing E.
2. Let H_K be the cyclotomic kernel, K∞ its fixed cyclotomic tower, and D_Sen the union of finite-dimensional K∞-subspaces in (C_p tensor V)^H_K stable under Γ_K. Sen decompletion says D_Sen has the expected rank and recovers the completed invariants.
3. For γ close to one, take the convergent logarithmic operator log(γ)/log χ_p(γ) on a sufficiently high finite level, then extend scalars to C_p. Independence of level and γ gives a canonical operator.
4. Functoriality follows because intertwiners commute with the action and logarithmic series. Trivial and cyclotomic actions give respectively zero and identity.

**Prerequisites.** `mathlib:PadicComplex`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:cyclotomicCharacter`; `mathlib:cyclotomicCharacter.continuous`; `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

**API.**

| Name | Role | Contract |
|---|---|---|
| `TauCeti.ArithmeticG7.senOperator` | constructor | The canonical C_p-linear logarithmic Sen operator on C_p tensor_E V with the embedding data above. |
| `TauCeti.ArithmeticG7.senOperator_functorial` | functoriality | For an E-linear intertwiner f, (1 tensor f)Θ_ρ=Θ_σ(1 tensor f). |
| `TauCeti.ArithmeticG7.senOperator_trivial` | simp | The operator of the trivial representation is zero. |
| `TauCeti.ArithmeticG7.senOperator_cyclotomic` | compatibility | On the rank-one cyclotomic representation, via the explicit Q_p→E map, it is identity. |

**Unit tests.** Each named item labels an example in the suggested file.

- `TauCeti.ArithmeticG7.senOperator.tests_trivial` (computation): The trivial character has operator zero.
- `TauCeti.ArithmeticG7.senOperator.tests_zero` (degenerate): On the zero vector space the operator is zero.
- `TauCeti.ArithmeticG7.senOperator.tests_cyclotomic` (compatibility): The cyclotomic character has operator identity, fixing the sign.

**Uses.**

- [`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input`](#sen-tannakian-input): Supplies the operator lying in the monodromy Lie algebra.
- [`ArithmeticGaloisRepresentations:G7/lifting-projective-representations-hodge-tate`](ArithmeticGaloisRepresentations.md#G7-lifting-projective-representations-hodge-tate): Permits rational-weight twists and comparison of lifts.
- [`ArithmeticGaloisRepresentations:G7/unequal-weight-tensor-irreducibility`](ArithmeticGaloisRepresentations.md#G7-unequal-weight-tensor-irreducibility): Weight differences detect a projective graph obstruction.

**Source support.**

- [Laurent Berger, An introduction to the theory of p-adic representations](https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf), §II.1.1–II.1.2 pp. 7–9: The invariant/decompleted module, logarithmic operator, integer semisimple weight criterion and examples specify the local construction.
- [Stefan Patrikis, Variations on a theorem of Tate](https://arxiv.org/pdf/1207.6724), §2.2.2 pp. 23–24 before Lemma 2.2.4: Coefficient embeddings, finite coefficient descent and invariance under finite restriction give the labelled-coefficient extension.

**Acceptance.** The constant zero operator fails the cyclotomic test. The identity operator fails the trivial test. A representation with a nonzero logarithmic unipotent extension has a nilpotent nonsemisimple Sen operator; integrality of eigenvalues alone is not the Hodge–Tate criterion.

**Open proof inputs.** Sen decompletion and completion action proof. The precise requirements appear in the gap register below.

<a id="sen-tannakian-input"></a>

### The Sen operator in the monodromy Lie algebra

`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input` · theorem · implementation unchecked

For a continuous G_K→G(Q_p-bar), G a linear algebraic group in characteristic zero, and each coefficient embedding into C_p, there is a unique element of Lie(G) tensor C_p whose image under Lie(r) is the Sen operator of r composed with ρ for every algebraic representation r of G. Operators are natural under intertwiners, direct sums and tensors, and on duals are negative transpose. A representation is Hodge–Tate iff its operator is semisimple with integer eigenvalues; in that case these eigenvalues, with multiplicity and the corresponding label, are its Hodge–Tate weights in the +1 cyclotomic convention.

**Hypotheses.** K/Q_p finite; finite coefficient descent as in the previous node; all embeddings and labels fixed. The Hodge–Tate condition uses a semilinear C_p decomposition into cyclotomic twists, not an arbitrary numerical weight function.

**Proof route.**

1. Use naturality of the canonical Sen operator, the direct-sum and tensor Leibniz identities from the logarithmic construction.
2. Apply the Lie-algebra form of Tannaka reconstruction to the tensor derivation on Rep(G).
3. Compare labelled scalar factors after finite coefficient extension and the cyclotomic semilinear decomposition; rank one reduces semisimplicity to a scalar, so integral Sen weight suffices there.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-local-sen-operator`](#local-sen-operator); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

**Source support.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://arxiv.org/pdf/1207.6724), Lemma 2.2.4 p. 23; Remark 2.2.5, Lemma 2.2.6 and Remark 2.2.7 p. 24: Tannakian reconstruction puts Θ in the Lie algebra and compares its eigenvalues to labelled weights; functorial inputs are a substantive prerequisite.
- [Laurent Berger, An introduction to the theory of p-adic representations](https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf), §II.1.2 p. 9: The semisimple-and-integral criterion and logarithmic normalization are stated, including a nilpotent counterexample.

**Acceptance.** Tensor weights are pairwise sums and dual weights are negatives. In rank two the adjoint weights are a−b,0,b−a. For a nilpotent nonzero Jordan operator, zero eigenvalues do not imply Hodge–Tate.

**Signature boundary.** The semilinear Galois C_p-action, its twist decomposition, labelled comparison and the algebraic-group Lie tensor interface are missing; no fake HodgeTate Prop or input arbitrary operator is substituted. The suggested file records this target in a comment and does not substitute an arbitrary proposition or operator.

**Open proof inputs.** Sen Lie and labelled-comparison interfaces. The precise requirements appear in the gap register below.

<a id="totally-real-rational-sen-weights"></a>

### Rational Sen weights of totally real characters

`ArithmeticGaloisRepresentations:G7/followup-totally-real-rational-sen-weights` · theorem · implementation unchecked

For a totally real number field F and a continuous character ψ:G_F→Q_p-bar× whose labelled Sen weights at every p-adic place are rational, all these weights have the same rational value. Conversely, for x,d∈Z with d≠0 there is a continuous global character with every labelled weight x/d. We use the +1 cyclotomic normalization.

**Hypotheses.** F is totally real, p prime, and the coefficient field descends to a finite Q_p extension. All p-adic labelled weights are rational. For the converse d must be nonzero.

**Proof route.**

1. Choose a positive integer clearing all weight denominators. The powered character has integral local Sen weights and hence is locally Hodge–Tate; in rank one this implies the locally algebraic/de Rham character criterion.
2. Apply global reciprocity and the classification of algebraic Hecke characters of a totally real field: up to finite order the geometric character is an integer cyclotomic power.
3. For existence, take a d-th root up to finite order of a suitable cyclotomic power using the retained roots-of-characters theorem; finite-order twists have Sen weight zero.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input`](#sen-tannakian-input); [`ArithmeticGaloisRepresentations:G7/roots-of-characters-up-to-finite-order`](ArithmeticGaloisRepresentations.md#G7-roots-of-characters-up-to-finite-order); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Source support.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://arxiv.org/pdf/1207.6724), Lemmas 2.3.15 and 2.3.17 pp. 31–32: Clearing denominators reduces to the totally real algebraic-Hecke-character classification, and roots of characters produce every rational common weight.

**Acceptance.** Different rational weights at two labels over a totally real field cannot occur. The existence statement allows negative x and d, but not division by zero.

**Signature boundary.** Requires actual local labelled Sen weight multisets and localization maps, not a freely supplied weight function. The suggested file records this target in a comment and does not substitute an arbitrary proposition or operator.

**Open proof inputs.** Totally real algebraic character classification. The precise requirements appear in the gap register below.

<a id="tate-global-rational-cocycle-vanishing"></a>

### Tate’s global rational-torsion vanishing

`ArithmeticGaloisRepresentations:G7/followup-tate-global-rational-cocycle-vanishing` · theorem · implementation unchecked

Planet: **Tate’s lifting theorem**.

For a number field F, every continuous 2-cocycle c:G_F×G_F→Q/Z, with discrete topology and trivial action, is the coboundary of a continuous b:G_F→Q/Z. Explicitly, c(h,j)−c(gh,j)+c(g,hj)−c(g,h)=0 implies c(g,h)=b(h)−b(gh)+b(g). No normalization c(1,g)=0 is needed. Equivalently continuous H²(G_F,Q/Z)=0. This is not the generally false vanishing of H²(G_F,μ_n).

**Hypotheses.** F is a number field, including real places. Q/Z has trivial action and discrete topology.

**Proof route.**

1. Split into p-primary components. Restriction/corestriction over F(μ_p)/F, of degree prime to p, reduces to μ_p contained in F.
2. Since H²(G_F,Q_p/Z_p) is p-primary torsion, it suffices to prove multiplication by p injective. The exact coefficient sequence reduces this to surjectivity of the boundary from H¹(G_F,Q_p/Z_p) to H²(G_F,Z/p), identified with Br(F)[p].
3. Local class field theory gives characters with any prescribed p-torsion local Brauer boundary; their boundary depends on restriction to μ_p. The global Brauer sequence makes these restrictions a character on μ_p of the ideles modulo μ_p(F). Include real-place 2-primary invariants.
4. Extend this character to a finite-order Hecke character as in Patrikis Lemma 2.3.6, then project to Q_p/Z_p. Its global boundary is the prescribed Brauer class, so multiplication by p is injective and the p-primary H² is zero. Interpret zero continuous-cohomology class as the displayed continuous coboundary.

**Prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `mathlib:AddCircle`; `mathlib:Field.absoluteGaloisGroup`.

**Names.** `TauCeti.ArithmeticG7.tateGlobalCocycleSplits`.

**Source support.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://arxiv.org/pdf/1207.6724), Theorem 2.1.1 and proof pp. 15–16: Tate’s global vanishing is proved through finite-level Brauer obstructions and extension of characters, and is explicitly distinct from a finite-level vanishing statement.
- [Brian Conrad, Lifting global representations with local properties](https://math.stanford.edu/~conrad/papers/locchar.pdf), Proposition 5.3 pp. 15–16: Central-torus lifting uses this direct-limit vanishing rather than a single finite obstruction group.

**Acceptance.** The signature uses the discrete topology explicitly even though AddCircle has another default topology. A cocycle valued in Z/n need not be a coboundary there; its class can die only at a larger denominator.

**Open proof inputs.** Finite-order character extension for Tate’s proof. The precise requirements appear in the gap register below.

<a id="central-lift-ramification"></a>

### Ramification of a central lift

`ArithmeticGaloisRepresentations:G7/followup-central-lift-ramification` · theorem · implementation unchecked

Let F be a number field, f:H′→H a surjective homomorphism of linear algebraic groups over Q_p-bar with central kernel, and ρ′:G_F→H′(Q_p-bar) continuous. If f composed with ρ′ is unramified outside finitely many finite places, then ρ′ is too. The groups may be disconnected; no isogeny or torus-only assumption is imposed on the kernel.

**Hypotheses.** The quotient is algebraic and central; the coefficient topology is the p-adic topology. The projected representation is unramified almost everywhere; the lift is already continuous.

**Proof route.**

1. Descend the compact image to a finite p-adic coefficient field using the Baire argument of Conrad Lemma 5.1.
2. After a finite base extension put its image in a torsion-free pro-p subgroup near identity. Away from p and the finite ramification set of the projection, inertia lands centrally and hence factors through local abelian inertia.
3. Local class field theory splits the relevant inertia into its finite prime-to-residue-characteristic torsion and its pro-residue-characteristic part. A torsion-free pro-p target receives neither part nontrivially when the residue characteristic is not p.
4. Return from the finite extension, adding only its finite ramification set.

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

**Source support.**

- [Brian Conrad, Lifting global representations with local properties](https://math.stanford.edu/~conrad/papers/locchar.pdf), Lemma 5.1 p. 14 and Lemma 5.2 pp. 14–15: The result applies to an already continuous lift through a central algebraic quotient and preserves almost-everywhere unramifiedness.

**Acceptance.** Without centrality, ramification of a lift need not be governed by abelian local inertia. This is the ramification input of the projective-lifting and Hodge–Tate-lifting targets.

**Signature boundary.** Needs topological algebraic-group points and the actual inertia/localization interface on Q_p-bar coefficients. The suggested file records this target in a comment and does not substitute an arbitrary proposition or operator.

**Open proof inputs.** Central-lift ramification typed interface. The precise requirements appear in the gap register below.

<a id="cyclotomic-kernel-derived-monodromy"></a>

### Derived monodromy on the cyclotomic kernel

`ArithmeticGaloisRepresentations:G7/followup-cyclotomic-kernel-derived-monodromy` · theorem · implementation unchecked

Planet: **Derived monodromy**.

Let F be a number field and ρ:G_F→GL_n(E), E/Q_p finite, continuous and absolutely strongly irreducible. If ρ is Hodge–Tate with n distinct labelled weights at one p-adic embedding, its connected algebraic monodromy G⁰ is reductive, its derived group D acts irreducibly and contains an element with n distinct eigenvalues on the representation, and D lies in the Zariski closure of ρ(G_(F(μ_p∞))). This supplies the geometric criterion used for characteristic-zero enormous image.

**Hypotheses.** Characteristic zero; n≥1. Weights are those of the canonical Sen comparison, not numerical data chosen independently of ρ. Strong irreducibility is absolute and over every finite extension.

**Proof route.**

1. Import connected monodromy and the strong irreducibility criterion. The unipotent radical of G⁰ fixes a nonzero vector and normality makes the fixed subspace invariant, so faithfulness and irreducibility force it trivial.
2. Schur’s lemma makes the connected center scalar. Thus G⁰ and D have the same invariant subspaces and D acts irreducibly.
3. The canonical Sen operator lies in Lie G⁰ and has distinct eigenvalues. Conjugate its semisimple part into Lie of a maximal torus. Distinct weights on the torus Lie algebra imply that the corresponding root characters are nontrivial in characteristic zero, so the torus, and hence G⁰, contains a regular semisimple element. Scalar multiplication transfers this property to D.
4. The cyclotomic kernel gives an abelian quotient of G_F. The Zariski closure of its image is normal, and the quotient of G⁰ by its intersection is commutative; hence it contains D. Apply the retained characteristic-zero enormity criterion.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input`](#sen-tannakian-input); [`ArithmeticGaloisRepresentations:G7/strong-irreducibility`](ArithmeticGaloisRepresentations.md#G7-strong-irreducibility); [`ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`](ArithmeticGaloisRepresentations.md#G7-zariski-closure-and-monodromy-groups); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Source support.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Lemma 4.7 and proof pp. 33–34: The proof passes from strong irreducibility and regular Hodge–Tate weights to irreducible derived monodromy with a regular semisimple element inside the cyclotomic-kernel closure.
- [J. S. Milne, Algebraic Groups: The theory of group schemes of finite type over a field](https://www.jmilne.org/math/Books/iAG2017.pdf), Proposition 6.21 and Definition 6.24 p. 130; image/quotient Theorem 5.39 pp. 108–109: Closed derived groups and image quotients supply the algebraic group step replacing unread Borel locators.

**Acceptance.** The cyclotomic kernel closure contains the derived group, not necessarily all of G⁰. Distinct eigenvalues of a freely supplied operator in End(V) do not suffice.

**Signature boundary.** The Sen-Lie comparison and algebraic-group monodromy/derived carrier are not expressible by a generic subgroup of GL alone. The suggested file records this target in a comment and does not substitute an arbitrary proposition or operator.

**Open proof inputs.** Algebraic monodromy supplier comparison. The precise requirements appear in the gap register below.

## Residual-image transport

<a id="residual-cyclotomic-baseline-comparison"></a>

### The residual cyclotomic character from Mathlib

`ArithmeticGaloisRepresentations:G7/followup-residual-cyclotomic-baseline-comparison` · comparison · implementation unchecked

For a field L with exactly p p-th roots of unity and a homomorphism ι:Z/p→k, the residual k-valued character on ring automorphisms of L is Units.map(ι) composed with modularCyclotomicCharacter. On the absolute Galois group use the forgetful action on the chosen closure. For number fields p-th roots have cardinality p. Continuity on the arithmetic group follows through the retained finite-quotient/cyclotomic comparison, not from this algebraic adapter alone.

**Hypotheses.** p is nonzero in this adapter; the arithmetic application has p prime and char F=0. The root-cardinality hypothesis and coefficient map are explicit.

**Proof route.**

1. Compose Mathlib’s hom with the units map of the coefficient ring hom.
2. Use its action-on-roots specification and uniqueness; use cyclotomicCharacter.toZModPow for comparison to the p-adic character.

**Prerequisites.** `mathlib:modularCyclotomicCharacter`; `mathlib:cyclotomicCharacter`; `mathlib:cyclotomicCharacter.continuous`; `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

**Names.** `TauCeti.ArithmeticG7.residualCyclotomic`, `TauCeti.ArithmeticG7.residualCyclotomic_spec`.

**Source support.**

- [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 notation p. 7: The arithmetic notation ε denotes the p-adic cyclotomic character; residual image conditions use its reduction, supplied algebraically by Mathlib.

**Acceptance.** No admitted residual-character body is introduced; the suggested body is an explicit composition.

<a id="disjoint-base-change-image"></a>

### Joint residual and cyclotomic image after disjoint base change

`ArithmeticGaloisRepresentations:G7/followup-disjoint-base-change-image` · theorem · implementation unchecked

Let F be a number field, k a finite field of characteristic p, r:G_F→GL_n(k) continuous, and L/F the finite Galois extension cut out jointly by ker r and the mod-p cyclotomic character. For any finite extension H/F linearly disjoint from L/F, restriction from G_H surjects onto the joint image of (r,ε̄_p) on G_F. In particular r(G_(H(μ_p)))=r(G_(F(μ_p))), with compatible embeddings, and every joint image element, including a scalar witness with ε̄_p≠1, remains available after base change.

**Hypotheses.** Finite continuous residual representation and finite H/F; linear disjointness refers to the full joint splitting extension L, not only the adjoint splitting field. Absolute Galois maps and finite extension embeddings are chosen compatibly.

**Proof route.**

1. Use R01.1 finite-quotient factorization and the actual residual cyclotomic character to construct the joint finite kernel and its fixed field L.
2. Finite Galois correspondence identifies the joint quotient with Gal(L/F). Linear disjointness identifies Gal(LH/H) with Gal(L/F).
3. Restriction from the absolute Galois group of H onto the finite quotient is surjective. Take the cyclotomic-character-one slice for the equality of restricted residual images.
4. Preserve the scalar witness in the full joint image, not only the image of r by itself.

**Prerequisites.** [`ArithmeticGaloisRepresentations:G7/followup-residual-cyclotomic-baseline-comparison`](#residual-cyclotomic-baseline-comparison); `ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients`; [`ArithmeticGaloisRepresentations:G7/taylor-wiles-image-conditions`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-image-conditions); `mathlib:IntermediateField.restrictRestrictAlgEquivMapHom_surjective`.

**Source support.**

- [Boxer, Calegari, Gee, Newton, Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880v3), Definition 5.2.1 pp. 50–51; Lemma 5.2.2 and proof p. 51: The proof preserves the residual and cyclotomic images and the scalar witness under disjoint base change. This node isolates its finite-Galois joint-image argument; preserving decomposed genericity needs the stronger Galois-closure-over-Q condition of the imported Taylor–Wiles target.

**Acceptance.** Preservation of r-image alone is insufficient to preserve a witness outside the cyclotomic kernel. A base change contained in L can shrink the joint image and must fail the disjointness assumption.

**Signature boundary.** Requires the comparison between the constructed finite joint splitting field, its finite Galois quotient and the absolute-Galois restriction map. The suggested file records this target in a comment and does not substitute an arbitrary proposition or operator.

**Open proof inputs.** Joint finite splitting field and absolute restriction comparison. The precise requirements appear in the gap register below.

## Accepted target inventory

The following 77 imports retain their full contracts in the parent packet and reader. This inventory is exhaustive, including the 27 reviewer additions; none is replaced by a weaker follow-up assertion. The API and test counts describe the imported contracts, not new tests added here. References to the parent reader lead to the exact statement and source locators. In particular all characteristic bounds, exceptional dimensions, factorial hypotheses, source findings and unverified finite calculations remain attached to their targets.

| Target ID (G7 suffix) | Target | Imported API / tests |
|---|---|---|
| [`symmetric-and-exterior-powers`](ArithmeticGaloisRepresentations.md#G7-symmetric-and-exterior-powers) | Tensor, symmetric and exterior powers of continuous representations | 11 / 5 |
| [`charpoly-of-symmetric-and-exterior-powers`](ArithmeticGaloisRepresentations.md#G7-charpoly-of-symmetric-and-exterior-powers) | Characteristic polynomials of the symmetric and exterior powers of an endomorphism (universal identity) | 0 / 0 |
| [`tensor-induction`](ArithmeticGaloisRepresentations.md#G7-tensor-induction) | Tensor induction from an open subgroup (Asai representation in index two) | 12 / 5 |
| [`tensor-induction-independent-of-transversal`](ArithmeticGaloisRepresentations.md#G7-tensor-induction-independent-of-transversal) | Tensor induction does not depend on the transversal | 0 / 0 |
| [`charpoly-of-cyclically-permuted-tensor-product`](ArithmeticGaloisRepresentations.md#G7-charpoly-of-cyclically-permuted-tensor-product) | Characteristic polynomials of tensor products and of cyclically permuted tensor products of linear maps | 0 / 0 |
| [`restriction-of-scalars`](ArithmeticGaloisRepresentations.md#G7-restriction-of-scalars) | Restriction of scalars of the coefficients | 6 / 4 |
| [`adjoint-representations`](ArithmeticGaloisRepresentations.md#G7-adjoint-representations) | The adjoint representation, the trace kernel and the quotient by scalars | 12 / 7 |
| [`trace-pairing-on-matrices-is-perfect`](ArithmeticGaloisRepresentations.md#G7-trace-pairing-on-matrices-is-perfect) | The trace pairing on matrices, and on endomorphisms of a finite projective module, is perfect | 0 / 0 |
| [`similitude-groups`](ArithmeticGaloisRepresentations.md#G7-similitude-groups) | Similitude groups GSp and GO of a perfect form, with multiplier | 9 / 5 |
| [`polarized-representation`](ArithmeticGaloisRepresentations.md#G7-polarized-representation) | Polarized representations: an actual pairing, a multiplier and a sign | 8 / 4 |
| [`polarization-sign-and-determinant`](ArithmeticGaloisRepresentations.md#G7-polarization-sign-and-determinant) | Sign, change of place, determinant and parity constraints of a polarization | 0 / 0 |
| [`operations-on-polarized-representations`](ArithmeticGaloisRepresentations.md#G7-operations-on-polarized-representations) | Operations on polarized representations: dual, twist, tensor, powers, restriction, coefficients | 19 / 4 |
| [`oddness-at-real-places`](ArithmeticGaloisRepresentations.md#G7-oddness-at-real-places) | Oddness at real places: polarized sign, similitude value and eigenspace balance | 7 / 4 |
| [`clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group) | The group scheme 𝒢_n and the dictionary with polarized triples | 9 / 5 |
| [`symmetric-power-polarization`](ArithmeticGaloisRepresentations.md#G7-symmetric-power-polarization) | Polarization of symmetric powers of a rank-two symplectic representation | 0 / 0 |
| [`gsp4-and-symplectic-induction`](ArithmeticGaloisRepresentations.md#G7-gsp4-and-symplectic-induction) | GSp_4-valued representations: oddness, adjoint modules, and symplectic induction from index two | 9 / 5 |
| [`gsp4-semisimple-determined-by-gl4`](ArithmeticGaloisRepresentations.md#G7-gsp4-semisimple-determined-by-gl4) | Semisimple GSp_4-valued representations are determined by GL_4 × GL_1 (characteristic ≠ 2) | 0 / 0 |
| [`strong-irreducibility`](ArithmeticGaloisRepresentations.md#G7-strong-irreducibility) | Strongly irreducible representations | 6 / 4 |
| [`zariski-closure-and-monodromy-groups`](ArithmeticGaloisRepresentations.md#G7-zariski-closure-and-monodromy-groups) | Zariski closures of subgroups and the monodromy group of a representation | 9 / 5 |
| [`simplicity-of-pgl2-over-an-algebraically-closed-field`](ArithmeticGaloisRepresentations.md#G7-simplicity-of-pgl2-over-an-algebraically-closed-field) | PGL_2 of an algebraically closed field is a simple group | 0 / 0 |
| [`unequal-weight-tensor-irreducibility`](ArithmeticGaloisRepresentations.md#G7-unequal-weight-tensor-irreducibility) | Tensor products of symmetric powers with unequal Hodge–Tate differences are strongly irreducible after cyclotomic restriction | 0 / 0 |
| [`lifting-projective-representations`](ArithmeticGaloisRepresentations.md#G7-lifting-projective-representations) | Lifting projective Galois representations through central torus quotients (Tate's theorem) | 0 / 0 |
| [`roots-of-characters-up-to-finite-order`](ArithmeticGaloisRepresentations.md#G7-roots-of-characters-up-to-finite-order) | m-th roots of ℓ-adic characters up to characters of finite order | 0 / 0 |
| [`lifting-projective-representations-hodge-tate`](ArithmeticGaloisRepresentations.md#G7-lifting-projective-representations-hodge-tate) | Lifts of geometric projective representations: half-integral Hodge–Tate–Sen weights, and Hodge–Tate lifts over totally real fields | 0 / 0 |
| [`transfer-of-determinants-to-representations`](ArithmeticGaloisRepresentations.md#G7-transfer-of-determinants-to-representations) | From determinants to representations, only through IHG.1, and compatibility with the operations | 0 / 0 |
| [`schur-lemma-over-local-rings`](ArithmeticGaloisRepresentations.md#G7-schur-lemma-over-local-rings) | Schur's lemma for residually absolutely irreducible representations over a local ring | 0 / 0 |
| [`adequate-subgroup`](ArithmeticGaloisRepresentations.md#G7-adequate-subgroup) | Adequate, weakly adequate and GHT-adequate subgroups of GL_n over a field of characteristic p | 11 / 8 |
| [`h1-restriction-injective-for-invertible-index`](ArithmeticGaloisRepresentations.md#G7-h1-restriction-injective-for-invertible-index) | Restriction to a subgroup of invertible finite index is injective on H¹ (Mathlib's group cohomology) | 0 / 0 |
| [`vanishing-of-h0-and-h1-under-extension-of-the-coefficient-field`](ArithmeticGaloisRepresentations.md#G7-vanishing-of-h0-and-h1-under-extension-of-the-coefficient-field) | Vanishing of H⁰ and H¹ under extension of the coefficient field | 0 / 0 |
| [`h1-with-trivial-action-of-a-normal-subgroup`](ArithmeticGaloisRepresentations.md#G7-h1-with-trivial-action-of-a-normal-subgroup) | H¹(B, N) embeds into the B-equivariant homomorphisms U → N when the normal subgroup U acts trivially and [B : U] is invertible | 0 / 0 |
| [`h1-of-borel-subgroups-with-symmetric-power-coefficients`](ArithmeticGaloisRepresentations.md#G7-h1-of-borel-subgroups-with-symmetric-power-coefficients) | Vanishing of H¹ of Borel subgroups of GL₂(F_q) with coefficients Sym^k ⊗ det^j, by weights | 0 / 0 |
| [`adequacy-criteria`](ArithmeticGaloisRepresentations.md#G7-adequacy-criteria) | Adequacy in large characteristic | 0 / 0 |
| [`dimension-of-absolutely-irreducible-representations-of-prime-to-p-groups`](ArithmeticGaloisRepresentations.md#G7-dimension-of-absolutely-irreducible-representations-of-prime-to-p-groups) | An absolutely irreducible representation of a finite group of order prime to p has dimension prime to p | 0 / 0 |
| [`enormous-image-and-its-coefficient-extension-invariance`](ArithmeticGaloisRepresentations.md#G7-enormous-image-and-its-coefficient-extension-invariance) | The 'enormous' condition for Taylor–Wiles data, its failure when p divides n, and its invariance under coefficient extension | 11 / 7 |
| [`galois-descent-of-stable-subspaces`](ArithmeticGaloisRepresentations.md#G7-galois-descent-of-stable-subspaces) | Galois descent for stable subspaces of V ⊗_k k′ | 0 / 0 |
| [`characteristic-zero-enormous-subgroups`](ArithmeticGaloisRepresentations.md#G7-characteristic-zero-enormous-subgroups) | Enormous subgroups of GL_n(O) in characteristic zero (Newton–Thorne) and the Zariski-closure criterion | 6 / 4 |
| [`enormous-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-enormous-symmetric-powers) | Enormous image of bounded symmetric powers | 0 / 0 |
| [`h1-of-sl2-with-adjoint-coefficients`](ArithmeticGaloisRepresentations.md#G7-h1-of-sl2-with-adjoint-coefficients) | H¹(SL₂(F), ad⁰) vanishes unless #F = 5, and the symmetric-power vanishing behind the bound p > 2n + 1 | 0 / 0 |
| [`mod-p-clebsch-gordan-decompositions`](ArithmeticGaloisRepresentations.md#G7-mod-p-clebsch-gordan-decompositions) | Mod p Clebsch–Gordan decompositions: V ⊗ Sym^{r−1}V, the two-constituent congruence for Sym^{p+r−1}V, and End(Sym^{n−1}V) | 0 / 0 |
| [`pieri-splitting-for-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-pieri-splitting-for-symmetric-powers) | V ⊗ Sym^{r−1}V ≅ Sym^rV ⊕ det ⊗ Sym^{r−2}V for r invertible | 0 / 0 |
| [`tensor-products-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-tensor-products-of-symmetric-powers) | Sym^aV ⊗ Sym^bV ≅ ⊕ det^i ⊗ Sym^{a+b−2i}V when (a + b)! is invertible | 0 / 0 |
| [`adjoint-invariants-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adjoint-invariants-of-symmetric-powers) | Irreducibility of small symmetric powers of SL₂(F) and the one-dimensional constituents of their adjoints | 0 / 0 |
| [`adequacy-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-symmetric-powers) | Adequacy of symmetric powers and Frobenius-twisted tensor products of large SL₂ images, with one common threshold | 0 / 0 |
| [`vast-tidy-and-enormous-gsp4-subgroups`](ArithmeticGaloisRepresentations.md#G7-vast-tidy-and-enormous-gsp4-subgroups) | Enormous and weakly enormous subgroups of GSp₄(k); vast and tidy GSp₄-valued representations | 9 / 5 |
| [`gsp4-big-image-verification`](ArithmeticGaloisRepresentations.md#G7-gsp4-big-image-verification) | Cyclotomic twisted adjoint cohomology vanishing for GSp₄ | 0 / 0 |
| [`image-in-the-3-cyclotomic-tower-for-sl2-wreath-products`](ArithmeticGaloisRepresentations.md#G7-image-in-the-3-cyclotomic-tower-for-sl2-wreath-products) | The image over the 3-power cyclotomic tower of an induction with image SL₂(F_3) ≀ Z/2Z does not shrink | 0 / 0 |
| [`cg20-big-image-assumption`](ArithmeticGaloisRepresentations.md#G7-cg20-big-image-assumption) | The big image assumption (H1)–(H3) for GSp₄-valued residual representations of G_Q | 7 / 4 |
| [`cg20-big-image-examples`](ArithmeticGaloisRepresentations.md#G7-cg20-big-image-examples) | Examples of big image: surjective GSp₄(F_p) images and inductions from imaginary quadratic fields | 0 / 0 |
| [`taylor-wiles-image-conditions`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-image-conditions) | Taylor–Wiles image conditions: adequate or enormous image over F(ζ_p) and a scalar element outside G_{F(ζ_p)} | 6 / 4 |
| [`taylor-wiles-image-lemmas`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-image-lemmas) | Taylor–Wiles image preservation under disjoint base change | 0 / 0 |
| [`adequacy-of-prime-to-p-groups`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-prime-to-p-groups) | Adequacy of absolutely irreducible groups of order prime to p | 0 / 0 |
| [`adequacy-of-prime-to-p-normal-overgroups`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-prime-to-p-normal-overgroups) | Adequacy of a normal overgroup of index prime to p | 0 / 0 |
| [`ght-adequacy-of-sylow-containing-overgroups`](ArithmeticGaloisRepresentations.md#G7-ght-adequacy-of-sylow-containing-overgroups) | GHT-adequacy of overgroups containing a Sylow p-subgroup | 0 / 0 |
| [`adequacy-of-tensor-products`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-tensor-products) | Adequacy after a prime-to-p tensor factor | 0 / 0 |
| [`adequacy-of-rank-two-groups`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-rank-two-groups) | Rank-two adequacy exceptions | 0 / 0 |
| [`ght-adequacy-of-sl2-representations`](ArithmeticGaloisRepresentations.md#G7-ght-adequacy-of-sl2-representations) | GHT-adequacy exceptions for irreducible SL₂ representations | 0 / 0 |
| [`enormous-symmetric-powers-of-sl2-overgroups`](ArithmeticGaloisRepresentations.md#G7-enormous-symmetric-powers-of-sl2-overgroups) | Enormous symmetric powers of finite SL₂ overgroups | 0 / 0 |
| [`enormous-symmetric-powers-after-global-base-change`](ArithmeticGaloisRepresentations.md#G7-enormous-symmetric-powers-after-global-base-change) | Enormous symmetric powers after disjoint and cyclotomic base change | 0 / 0 |
| [`enormous-standard-sl-overgroups`](ArithmeticGaloisRepresentations.md#G7-enormous-standard-sl-overgroups) | Enormous overgroups of the standard SLₙ image | 0 / 0 |
| [`gsp4-tidiness-from-the-centre`](ArithmeticGaloisRepresentations.md#G7-gsp4-tidiness-from-the-centre) | Tidiness from a scalar centre of order at least three | 0 / 0 |
| [`gsp4-tidiness-from-equal-determinant-blocks`](ArithmeticGaloisRepresentations.md#G7-gsp4-tidiness-from-equal-determinant-blocks) | Tidiness from equal-determinant GL₂ blocks | 0 / 0 |
| [`gsp4-adequacy-in-characteristic-at-least-eleven`](ArithmeticGaloisRepresentations.md#G7-gsp4-adequacy-in-characteristic-at-least-eleven) | Adjoint cohomology vanishing for GSp₄ in characteristic at least eleven | 0 / 0 |
| [`gsp4-standard-image-enormity-and-tidiness`](ArithmeticGaloisRepresentations.md#G7-gsp4-standard-image-enormity-and-tidiness) | Enormity of Sp₄ and tidiness of GSp₄ | 0 / 0 |
| [`gsp4-induced-adjoint-decomposition`](ArithmeticGaloisRepresentations.md#G7-gsp4-induced-adjoint-decomposition) | Adjoint and exterior-square decompositions for nondegenerate induced blocks | 0 / 0 |
| [`gsp4-e3-from-an-element-outside-the-index-two-subgroup`](ArithmeticGaloisRepresentations.md#G7-gsp4-e3-from-an-element-outside-the-index-two-subgroup) | Enormity projector witnesses from an index-two coset | 0 / 0 |
| [`gsp4-sl2-wreath-enormity`](ArithmeticGaloisRepresentations.md#G7-gsp4-sl2-wreath-enormity) | Enormity of the SL₂ wreath product | 0 / 0 |
| [`gsp4-induced-mod-five-vastness`](ArithmeticGaloisRepresentations.md#G7-gsp4-induced-mod-five-vastness) | Vastness for the induced mod-five wreath-product case | 0 / 0 |
| [`gsp4-characteristic-three-subgroup-enumeration`](ArithmeticGaloisRepresentations.md#G7-gsp4-characteristic-three-subgroup-enumeration) | Enormous and tidy subgroups in characteristic three | 0 / 0 |
| [`gsp4-sl2-wreath-vastness-and-tidiness`](ArithmeticGaloisRepresentations.md#G7-gsp4-sl2-wreath-vastness-and-tidiness) | Vastness and tidiness of induced large SL₂ images | 0 / 0 |
| [`gsp4-quaternion-wreath-enormity`](ArithmeticGaloisRepresentations.md#G7-gsp4-quaternion-wreath-enormity) | Enormity of the quaternion wreath product in characteristic three | 0 / 0 |
| [`taylor-wiles-unitary-tensor-adequacy`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-adequacy) | Adequacy of the unitary symmetric tensor image | 0 / 0 |
| [`taylor-wiles-unitary-tensor-multiplier`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-multiplier) | Multiplier of the unitary symmetric tensor image | 0 / 0 |
| [`taylor-wiles-unitary-tensor-scalar-witness`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-scalar-witness) | Taylor–Wiles scalar witness for the unitary tensor image | 0 / 0 |
| [`cyclic-induced-frobenius-eigenvalues`](ArithmeticGaloisRepresentations.md#G7-cyclic-induced-frobenius-eigenvalues) | Frobenius eigenvalues in a cyclically induced character | 0 / 0 |
| [`taylor-wiles-solvable-induced-tensor-adequacy`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-solvable-induced-tensor-adequacy) | Adequacy after a solvable induced tensor factor | 0 / 0 |
| [`taylor-wiles-solvable-induced-tensor-scalar-witness`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-solvable-induced-tensor-scalar-witness) | Taylor–Wiles scalar witness for a solvable induced tensor factor | 0 / 0 |
| [`taylor-wiles-symmetric-power-scalar-witness`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-symmetric-power-scalar-witness) | Taylor–Wiles scalar witness for large symmetric-power images | 0 / 0 |

## Disposition of the parent worklist

Indices are zero-based and match the accepted packet’s 63 G7 remaining items. “Retained” means the full accepted contract is imported, including its proof route and tests. A supplier or gap is a boundary of this plan, not a claim that the result has been proved. The packet contains the full reference list for each row.

| Index | Need | Disposition and remaining obligation |
|---|---|---|
| 0 | Old node-budget and declaration-splitting boundary | The 2026-10-09 target-level rule applies. Retain all 77 accepted targets and add only missing target interfaces and key source inputs. |
| 1 | Continuous tensor, symmetric and exterior powers; projective carriers, determinant and duality comparisons | Retained accepted target; current target-level rule keeps its API and proof sketch together. The symmetric-projective summand interface is recorded as a gap; retain the parent rank/base-change/duality API. |
| 2 | Universal characteristic polynomials and generic-matrix proof | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 3 | Tensor induction, normal restriction, transfer, Asai and wreath action | Retained accepted target; current target-level rule keeps its API and proof sketch together. Current algebraic tensor induction and ProfiniteCohomology layer 13 already supply the constructor. Finish the arithmetic finite-projective topological/transversal comparison. |
| 4 | Tensor-product and cyclic-permutation trace/characteristic polynomial | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 5 | Coefficient restriction, norm characteristic polynomial and split base change | Retained accepted target; current target-level rule keeps its API and proof sketch together. The transitivity of finite-module coefficient topologies remains an explicit adapter gap. |
| 6 | Projective trace, adjoint, trace kernel and scalar quotient | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 7 | Similitude carriers, multiplier, determinant and Lie descriptions | Retained accepted target; current target-level rule keeps its API and proof sketch together. Import generic O/SO from OrthogonalSpinGroups and algebraic Lie carriers from ReductiveGroups; keep the actual GO/GSp multiplier target here. |
| 8 | Pairing, formal sign, CHT triples and totally real comparison | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 9 | Sign, change of real place, determinant and CHT extension torsor | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 10 | Dual, twist, tensor, powers, sums and coefficient/restriction operations | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 11 | Oddness in four distinct senses and trace/eigenspace balance | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 12 | Disconnected CHT group, triple dictionary, maps and induction | Retained accepted target; current target-level rule keeps its API and proof sketch together. Induction representative independence still needs a complete interface. The generic semidirect/group-scheme carrier is imported. |
| 13 | Symmetrized form, similitude and factorial scope | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 14 | GSp4 arithmetic representation, Lie adjoints and induced decomposition | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 15 | Equivariant comparison of two symplectic forms | Retained accepted target; current target-level rule keeps its API and proof sketch together. Gan–Takeda was read; multiplicity-space classification is now a precise interface gap, with no stronger algebra-with-involution square-root theorem required. |
| 16 | Strong irreducibility and connected monodromy | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 17 | Closure, image, commutator, components, reductivity and Goursat | Retained accepted target; current target-level rule keeps its API and proof sketch together. Current image/derived/component constructions already exist; their arithmetic monodromy comparisons are requested. |
| 18 | PGL2/PSL2 and Goursat alternative | Retained accepted target; current target-level rule keeps its API and proof sketch together. |
| 19 | Unequal-weight tensor strong irreducibility | Retained accepted target; current target-level rule keeps its API and proof sketch together. Keep the characteristic-zero product-SL2 symmetric-power irreducibility input in the parent proof sketch; do not replace it by a finite-field small-characteristic statement. |
| 20 | Central-torus lift and ramification | Retained accepted target; current target-level rule keeps its API and proof sketch together. Global Tate character extension and the central algebraic-group/inertia signature remain precise gaps. |
| 21 | Half-integral geometric lift and totally real Hodge–Tate twist | Retained accepted target; current target-level rule keeps its API and proof sketch together. Read Patrikis Lemmas 2.7.4–2.7.5 and Conrad Corollary 6.7. Full geometric character/label/de Rham descent interfaces remain part of the Sen/rank-one gap. |
| 22 | Reconstruction and determinants of operations | Retained accepted target; current target-level rule keeps its API and proof sketch together. The existing IHG.1 continuous specialization is imported; no reconstruction theorem is replanned. |
| 23 | Unread Borel image/derived/finite-index source | Read public Milne and identify current built Hopf image/derived/component declarations; generic inputs stay in ReductiveGroups. Arithmetic carrier and characteristic-zero point comparisons are an explicit supplier gap. |
| 24 | Gan–Takeda Lemma 6.1 unread | Published lemma and proof read; use centralizer/isotypic proof instead of an unnecessary abstract involution square-root input. The semisimple form-classification interface still needs to be proved. |
| 25 | Conrad central-lift ramification locator | Read Lemmas 5.1–5.2, Proposition 5.3 and Corollary 6.7. Lemma 5.2 supplies ramification of an already continuous central lift. Topological algebraic quotient and arithmetic inertia signatures remain missing. |
| 26 | Characteristic-zero bijective-on-points homomorphism | Route to existing ReductiveGroups image/quotient/smoothness; Milne Cartier 3.23 and Theorem 5.39 give proof inputs. Verify kernel reduced/trivial and quotient-isomorphism comparison. Positive-characteristic Frobenius is the excluded counterexample. |
| 27 | Totally real rational Sen weights | Read Patrikis 2.3.17 and plan the result here at tier 7. Algebraic Hecke-character infinity-type classification and actual labelled/localization carriers remain a gap. |
| 28 | Coarse Tate, determinant reconstruction and Sen suppliers | Move Tate and minimal Sen inputs down to G7; retain IHG.1 reconstruction as existing work. |
| 29 | Old upstream layer references versus current implementations | Read current ReductiveGroups, ProfiniteCohomology and library source. Record built continuity, tensor induction, image, derived and component operations; keep existing roadmap comparisons instead of duplicate nodes. |
| 30 | Sen-to-Lie/regular-semisimple argument in NT26 4.7 | Plan canonical local Sen, Tannakian input and the arithmetic derived-monodromy application. Ownership is G7 under current tiers. The Sen and algebraic-group signatures/proof inputs remain explicit gaps. |
| 31 | Published collation of parent sourceIssues E702,E703,E704,E720 | Retain the accepted findings with their checked-edition scope; no fresh published-edition claim. The indicated version-of-record passages still need collation. |
| 32 | Actual continuous multipliers for polarized operations | Give bodies and checked signatures to δ, transfer comparison, twist, tensor and power multipliers with discriminating tests. |
| 33 | Weak adequacy, ad⁰ adequacy and GHT adequacy; coefficient and scalar extensions | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 34 | Residual enormity, p dividing dimension, projective and coefficient invariance | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 35 | Characteristic-zero enormity and geometric derived criterion | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 36 | SL2 and GL2 adjoint H1 and symmetric-power vanishing | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 37 | Weight resonance and connecting-map criteria | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 38 | Semisimplified Frobenius and adjoint decompositions | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 39 | Small symmetric-power irreducibility and trivial/cyclotomic constituents | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 40 | Large SL2 symmetric and Frobenius-tensor adequacy, one common threshold | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 41 | Symplectic enormous, weakly enormous, vast and tidy | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 42 | H1–H3 and H3′ big-image conventions | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 43 | Induced and surjective big-image examples | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 44 | Adequate/enormous cyclotomic image and scalar witness | Retain the accepted target with its exact API, tests and proof sketch under the target-level rule; retain every unresolved source/finite-group input in gaps. |
| 45 | Absolute irreducibility of Frob V tensor Sym^(r−1)V | Record the exact finite-field irreducibility proof boundary; do not promote a suggested distinct-weight route to an established theorem. Resolve the Steinberg/unipotent proof and endpoints before closing either consumer. |
| 46 | Perfect pairing on symmetric powers when m! is invertible | Already stated in the accepted symmetric/exterior power and symmetric-power-polarization targets; retain the sufficient factorial-unit hypothesis. |
| 47 | GHTT finite-linear-group structure and small Ext1 | Precise inherited/source proof gap preserved, not silently assumed. Read Guralnick 1999 Theorem A and derive the classification-dependent structure theorem; generic CFSG alone does not supply it. |
| 48 | AJL and low-degree SL2 Ext1 | Precise inherited/source proof gap preserved, not silently assumed. Read AJL Corollary 4.5 and GHT low-degree Corollary 1.4, including exceptional H2/tilting cases. |
| 49 | Thorne 2024 Lemma 7.3 | Precise inherited/source proof gap preserved, not silently assumed. Read and compare the uniform threshold with the GHT17 route. |
| 50 | BCGP finite computation certificates | Precise inherited/source proof gap preserved, not silently assumed. Certify H1 at p=3,5,7, the characteristic-three subgroup enumeration and the listed §7.5.21 cases; do not reuse review calculations as formal certificates. |
| 51 | Nontrivial field-automorphism graph case | Precise inherited/source proof gap preserved, not silently assumed. Determine the actual cyclotomic-tower image and nonidentity-coset element of order prime to p and not dividing 4. |
| 52 | SL2(F9) adjoint connecting map | Precise inherited/source proof gap preserved, not silently assumed. Compute the resonant connecting homomorphism or certify the finite computation. |
| 53 | SLn adjoint H1 | Precise inherited/source proof gap preserved, not silently assumed. Read CPS Table 4.5 or complete the root-weight Borel proof for p>n≥3. |
| 54 | Finite unitary simplicity and non-isomorphism | Precise inherited/source proof gap preserved, not silently assumed. Read the finite Chevalley/unitary statements and standard-module absolute irreducibility; generic PSL2 simplicity is insufficient. |
| 55 | Binary polyhedral lifts and Brauer characters | Precise inherited/source proof gap preserved, not silently assumed. Read/derive the 2.A4 and 2.A5 projective lifts and the modular degree-two character calculations in characteristics 3,5. |
| 56 | Symplectic adjoint absolute irreducibility | Precise inherited/source proof gap preserved, not silently assumed. Prove sp4 ≅ Sym² and irreducibility under Sp4(Fp), with p=3 handled separately. |
| 57 | Pilloni H3 and H3′ | Precise inherited/source proof gap preserved, not silently assumed. Read §5.7 and Propositions 5.6,5.8 and preserve the exact H3 reading. |
| 58 | Published BLGG13 Proposition A.2.1 collation | Precise inherited/source proof gap preserved, not silently assumed. Compare parent E754 and E755 with the version of record; preprint corrections are not a published-correction claim. |
| 59 | Borel derived closure source for characteristic-zero enormity | Replace the unread source boundary by Milne and the current derived-ideal theorem; do not duplicate generic derived groups. The arithmetic carrier/point closure comparison remains explicit. |
| 60 | Bodies for eigenProj, symPowerGL and modCyclotomic | Give actual bodies: generalized-eigenspace projection, existing TauCeti.symPowerRep transported to the monomial basis, and Units.map composed with Mathlib modularCyclotomicCharacter. |
| 61 | Linear disjointness implies the joint residual/cyclotomic quotient is onto | Plan the precise full joint splitting-field theorem, use the pinned finite-Galois restriction theorem and record the missing absolute-quotient comparison. Type the constructed joint field, compatible absolute Galois restriction and finite quotient identification; do not assume image equality. |
| 62 | Separate the field-automorphism graph case from ordinary wreath and quaternion cases | Keep their accepted separate IDs and preserve the exact graph-case proof gap. The nontrivial field-automorphism graph image/coset assertion is unresolved. |

## Pinned declaration audit

Each entry was checked in source at the pinned commits above; its role is the one used by the plan, rather than a name-search guess. Declarations in the parent remain imported at their recorded pins.

| Declaration | Module | Role |
|---|---|---|
| `tauceti:Representation.tensorPower` | `TauCeti/RepresentationTheory/Tensor/Power.lean` | Diagonal algebraic action on the d-fold tensor power, with its pure-tensor formula. |
| `tauceti:Representation.symmetricPower` | `TauCeti/RepresentationTheory/SymmetricPower.lean` | Algebraic symmetric-power action through SymmetricPower.map; intertwining-map identity and composition APIs. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | The exterior-power linear map, with formula on the universal alternating product, identity and composition. |
| `mathlib:IsModuleTopology.continuous_of_linearMap` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | Linear maps out of the module topology into a topological module are continuous. |
| `mathlib:IsModuleTopology.continuous_bilinear_of_finite_left` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | Bilinear maps with a finite left module and the module topology are jointly continuous. |
| `mathlib:IsModuleTopology.isQuotientMap_of_surjective` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | A surjective linear map between module topologies is a quotient map. |
| `mathlib:contractLeft` | `Mathlib/LinearAlgebra/Contraction.lean` | Evaluation on dual tensor module, φ tensor x maps to φ(x). |
| `mathlib:dualTensorHomEquiv` | `Mathlib/LinearAlgebra/Contraction.lean` | For a finite projective source M, dual M tensor N is linearly equivalent to Hom(M,N). |
| `mathlib:LinearMap.trace` | `Mathlib/LinearAlgebra/Trace.lean` | Trace defined using a finite free basis and set to zero when no such basis exists. |
| `mathlib:LinearMap.trace_mul_comm` | `Mathlib/LinearAlgebra/Trace.lean` | Cyclic invariance of Mathlib trace, used in the free-local comparison. |
| `mathlib:Module.End.independent_maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | The family of maximal generalized eigenspaces is independent. |
| `mathlib:Module.End.iSup_maxGenEigenspace_eq_top` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean` | For a triangularizable finite-dimensional operator the supremum of generalized eigenspaces is the whole space. |
| `mathlib:Submodule.projection` | `Mathlib/LinearAlgebra/Projection.lean` | Projection onto one submodule along a complementary submodule, retaining its inclusion in the ambient module. |
| `mathlib:Matrix.GeneralLinearGroup.toLin'` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | Basis-dependent multiplicative equivalence from matrix GL to linear automorphisms. |
| `tauceti:TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean` | Already defined algebraic GL_n action on Sym^d; no new algebraic GL symmetric-power functor is planned. |
| `tauceti:Module.Basis.symmetricPower` | `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean` | Basis of a symmetric power indexed by unordered tuples of original basis indices. |
| `tauceti:TauCeti.symFinTwoEquiv` | `TauCeti/Data/Sym/Basic.lean` | Equivalence from d-element multisets of Fin 2 to Fin(d+1), counting occurrences of index zero. |
| `mathlib:MonoidHom.transfer` | `Mathlib/GroupTheory/Transfer.lean` | Algebraic finite-index transfer of a character to a commutative group. |
| `mathlib:MonoidHom.transfer_def` | `Mathlib/GroupTheory/Transfer.lean` | Computes the existing transfer with any chosen left transversal through its diff product. |
| `mathlib:modularCyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | Action on n-th roots of unity, with an explicit cardinality hypothesis. |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The p-adic character as a homomorphism to p-adic units. |
| `mathlib:cyclotomicCharacter.continuous` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | Continuity after composition with the Galois group action. |
| `mathlib:Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` | Automorphisms of the algebraic closure over the base, with Krull topology; R01.1 supplies the separable profinite comparison. |
| `mathlib:PadicComplex` | `Mathlib/NumberTheory/Padics/Complex.lean` | Completion of the normed algebraic closure of Q_p; normed, algebraically closed field and compatible scalar tower. C_p itself is already present. |
| `mathlib:AddCircle` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | Additive quotient of an additive group by the integer multiples of a period; at Q and period 1 its algebraic group is Q/Z. The Tate theorem explicitly uses the discrete topology. |
| `mathlib:IntermediateField.restrictRestrictAlgEquivMapHom_surjective` | `Mathlib/FieldTheory/Galois/Basic.lean` | For finite K/F and finite Galois E/L, restriction onto Gal(K/F) is onto when the intermediate fields K and L have intersection F. This is used after adjoining the finite compositum. |

### Current-library additions already supplied

| Declaration | Module | Assembly use |
|---|---|---|
| `tauceti:TauCeti.continuous_transfer` | `TauCeti/Topology/Algebra/Group/Transfer.lean` | For an open finite-index subgroup, a continuous character into a commutative topological group has continuous algebraic transfer; only separate continuity on G and continuous multiplication on the target are needed. The new characterTransfer is a comparison wrapper. The pinned signature admits the continuity proof because this module postdates its pin. |
| `tauceti:Subgroup.tensorInducedRepresentation` | `TauCeti/RepresentationTheory/Tensor/Induction.lean` | Tensor-induced algebraic representation via the monomial homomorphism and wreathTensor, with the pure-tensor formula. Do not replan the wreath action or algebraic tensor induction. Import the current declaration and ProfiniteCohomology layer 13 for the open-subgroup topological adapter. |
| `tauceti:TauCeti.derivedDefiningIdeal_eq_vanishingIdeal_commutator` | `TauCeti/Algebra/AlgebraicGroup/Derived/PointClosure.lean` | For a reduced finite-type Hopf algebra over an algebraically closed field the derived defining ideal is the vanishing ideal of the commutator subgroup of rational points. Replaces the unread derived-closure source input at assembly; ReductiveGroups layer 3 owns the carrier comparison. |
| `tauceti:TauCeti.CommHopfAlgCat.imageι_injective` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Image/Basic.lean` | The algebraic image quotient embeds in the source coordinate algebra; image and kernel factorization are already built. Do not replan scheme-theoretic image factorization; check the reduced-point image comparison at ReductiveGroups layer 3. |
| `tauceti:TauCeti.componentGroupFppfProjection` | `TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/Basic.lean` | The canonical fppf quotient projection by the identity component, with local surjectivity. Do not replan component groups. G7 needs only arithmetic monodromy and the corresponding rational-point adapters. |

## Supplier register

These ten entries preserve ownership and precise comparison needs. They do not ask suppliers to rebuild existing definitions. The two supplied entries still identify how to assemble the pinned prototype against current upstream.

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary**: Use the existing affine group-scheme/Hopf/functor dictionary for the CHT semidirect product and central algebraic quotients; no second general algebraic-group carrier. Needed by [`ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group), [`ArithmeticGaloisRepresentations:G7/followup-central-lift-ramification`](#central-lift-ramification).

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation**: Use existing Lie and Ad, their functoriality and the matrix descriptions for GL, PGL₂, GSp and GO. Match the canonical Sen operator to Lie(G) tensor C_p; Sen itself is owned here. Needed by [`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input`](#sen-tannakian-input), [`ArithmeticGaloisRepresentations:G7/followup-cyclotomic-kernel-derived-monodromy`](#cyclotomic-kernel-derived-monodromy), [`ArithmeticGaloisRepresentations:G7/similitude-groups`](ArithmeticGaloisRepresentations.md#G7-similitude-groups).

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components**: Use the existing subgroup/quotient/component carriers. Match rational Zariski closure and commutators with the current derived-ideal theorem; verify closed reduced point images, closure of a finite-index dense subgroup containing G⁰, and characteristic-zero bijective-on-geometric-points homomorphisms being isomorphisms. Milne Propositions 1.68, 1.70, Cartier 3.23, Theorem 5.39 and Proposition 6.21 supply the proof routes. Existing built image/derived/component operations must be imported, not replanned. Needed by [`ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`](ArithmeticGaloisRepresentations.md#G7-zariski-closure-and-monodromy-groups), [`ArithmeticGaloisRepresentations:G7/strong-irreducibility`](ArithmeticGaloisRepresentations.md#G7-strong-irreducibility), [`ArithmeticGaloisRepresentations:G7/followup-central-lift-ramification`](#central-lift-ramification), [`ArithmeticGaloisRepresentations:G7/followup-cyclotomic-kernel-derived-monodromy`](#cyclotomic-kernel-derived-monodromy).

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups**: Characteristic-zero connected reductive monodromy: faithful semisimple actions have reductive identity component, irreducible connected GL₂ subgroups have derived SL₂, the connected center times derived group covers the reductive group, and a semisimple Lie element can be conjugated into a maximal torus. These are existing ReductiveGroups targets; record a Part II only for a genuinely absent comparison. Needed by [`ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`](ArithmeticGaloisRepresentations.md#G7-zariski-closure-and-monodromy-groups), [`ArithmeticGaloisRepresentations:G7/followup-cyclotomic-kernel-derived-monodromy`](#cyclotomic-kernel-derived-monodromy).

- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees**: Use continuous H² with discrete torsion coefficients, finite-quotient description, coefficient direct limits and central finite-kernel obstruction. Global Q/Z vanishing is the G7 theorem, not a general cohomology supplier assertion. Needed by [`ArithmeticGaloisRepresentations:G7/followup-tate-global-rational-cocycle-vanishing`](#tate-global-rational-cocycle-vanishing), [`ArithmeticGaloisRepresentations:G7/lifting-projective-representations`](ArithmeticGaloisRepresentations.md#G7-lifting-projective-representations).

- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension** (supplied-at-current-library): Reuse the already built TauCeti.continuous_transfer from the current library; reconcile its bundled character type with the pinned arithmetic prototype. No new continuity theorem is requested. Needed by [`ArithmeticGaloisRepresentations:G7/followup-continuous-character-transfer`](#continuous-character-transfer).

- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-13-the-evens-norm**: Use the existing continuous open-subgroup monomial homomorphism and tensor-induction functor for arbitrary coefficient representations. The current algebraic Subgroup.tensorInducedRepresentation already supplies the wreath-tensor action; this dependency is the topological comparison. Needed by [`ArithmeticGaloisRepresentations:G7/tensor-induction`](ArithmeticGaloisRepresentations.md#G7-tensor-induction).

- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants**: Global Brauer localization, finite support and the sum of local invariants, including the real 2-primary term, as used in Patrikis Theorem 2.1.1. Use the existing Brauer sequence, not a second duality theory. Needed by [`ArithmeticGaloisRepresentations:G7/followup-tate-global-rational-cocycle-vanishing`](#tate-global-rational-cocycle-vanishing).

- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity**: The existing global Artin reciprocity comparison of continuous finite-order Galois and idele characters. The extra totally-real infinity-type classification and finite-order character extension steps are G7-owned gaps; global reciprocity is not a substitute for them. Needed by [`ArithmeticGaloisRepresentations:G7/followup-tate-global-rational-cocycle-vanishing`](#tate-global-rational-cocycle-vanishing), [`ArithmeticGaloisRepresentations:G7/followup-totally-real-rational-sen-weights`](#totally-real-rational-sen-weights).

- **IntegralHeckeAndGaloisDeterminants:IHG.1** (supplied-by-existing-roadmap): Import the current IHG.1 algebraically_closed_reconstruction and henselian_irreducible targets and their continuous group-algebra specialization: Chenevier Theorems 2.12 and 2.22 with exactly their coefficient and residual split/absolute irreducibility hypotheses. Do not replan determinant reconstruction. Needed by [`ArithmeticGaloisRepresentations:G7/transfer-of-determinants-to-representations`](ArithmeticGaloisRepresentations.md#G7-transfer-of-determinants-to-representations).

## Gap register and acceptance

These are the 22 exact unresolved proof or carrier boundaries. G7 remains planned until each is resolved and its supplier comparisons are checked. The inherited source boundaries have not been turned into implementation claims.

### Gap 1: Symmetric-projective local-to-global proof interface

The direct-summand degree decomposition supplies a mathematical route, but the pinned library has no verified finite-projective symmetric-power instance. Identify the existing symmetric-algebra homogeneous-component decomposition and prove the summand comparison; do not infer it merely from the free-module finrank theorem.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-power-carriers-and-joint-continuity`](#power-carriers-and-joint-continuity).

### Gap 2: Equivariant form classification interface

The read Gan–Takeda proof resolves the unread-source boundary. Its finite-dimensional semisimple isotypic decomposition and classification of symmetric/alternating multiplicity-space forms still need a checked Lean interface; no proof of the theorem is claimed.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-centralizer-conjugacy-of-alternating-forms`](#centralizer-conjugacy-of-alternating-forms).

### Gap 3: Sen decompletion and completion action proof

C_p and its compatible scalar tower exist at the pins. Missing are the extended arithmetic Galois action and the cyclotomic invariants/decompletion theorem used to construct Θ. Berger II.1.2 states the cohomological descent and decompletion result, but its original Sen proofs and convergence estimates have not been read here. The construction is owned in G7, not requested from higher-tier PadicHodgeTheory. Read and plan the analytic descent and logarithmic convergence proof before claiming closure.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-local-sen-operator`](#local-sen-operator).

### Gap 4: Sen Lie and labelled-comparison interfaces

The minimal local construction belongs here. Tannakian Lie reconstruction and its tensor/dual naturality need a precise interface, as does the actual semilinear C_p Hodge–Tate decomposition. ReductiveGroups layer 2 supplies Lie and algebraic Ad, not Sen theory. The missing conditions prevent an honest typed signature of this combined theorem at the pins.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-sen-tannakian-input`](#sen-tannakian-input).

### Gap 5: Totally real algebraic character classification

Global reciprocity is already ClassFieldTheory layer 11. The additional assertion that a geometric character of a totally real number field is a finite-order twist of a cyclotomic power is not its stated target. G7 owns this extra character lemma and must prove it using the infinity-type/unit constraints (with the number-field Hecke-character carrier imported). The source citation is read, but the proof input and localization/label signatures are still missing.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-totally-real-rational-sen-weights`](#totally-real-rational-sen-weights).

### Gap 6: Finite-order character extension for Tate’s proof

ClassFieldTheory layer 10 supplies the Brauer localization sequence and layer 11 reciprocity. The extra finite-order local-to-global character extension used in Patrikis Theorem 2.1.1 (through Lemma 2.3.6) has not been recursively established here; this includes the coefficient-enlargement step and real places. It is a G7 proof input and not replaced by the class-formation theorem named Tate in ClassFieldTheory layer 3.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-tate-global-rational-cocycle-vanishing`](#tate-global-rational-cocycle-vanishing).

### Gap 7: Central-lift ramification typed interface

The source theorem and proof are read. Topological algebraic group points, a central algebraic quotient and almost-everywhere inertia restrictions need compatible carriers. The parent’s arbitrary group-map surrogate does not express these hypotheses. Use R01.2 inertia and ClassFieldTheory local reciprocity with the algebraic ReductiveGroups interface.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-central-lift-ramification`](#central-lift-ramification).

### Gap 8: Joint finite splitting field and absolute restriction comparison

The finite Galois linear-disjointness theorem already exists in Mathlib (IntermediateField.restrictRestrictAlgEquivMapHom_surjective). Do not replan it. Missing is the checked comparison that constructs L from the continuous joint kernel and transports finite restriction surjectivity to the chosen absolute Galois maps. The weaker assumption that the image already agrees would make the desired conclusion tautological.

Needed by [`ArithmeticGaloisRepresentations:G7/followup-disjoint-base-change-image`](#disjoint-base-change-image).

### Gap 9: Guralnick–Herzig–Taylor–Thorne adequacy theorem (appendix Theorem 9 / Theorem A.9)

The proof uses Proposition 7 of the appendix, which rests on the classification of finite simple groups (Tau Ceti CFSGStatement states the classification but no layer derives the algebraic-group structure of finite linear groups generated by p-elements in small dimension), and Guralnick's 1999 theorem that small modules have no self-extensions (Ext¹ vanishing for dim W_i + dim W_j ≤ p − 2). Neither input is planned by any roadmap.

Needed by [`ArithmeticGaloisRepresentations:G7/adequacy-criteria`](ArithmeticGaloisRepresentations.md#G7-adequacy-criteria), [`ArithmeticGaloisRepresentations:G7/gsp4-adequacy-in-characteristic-at-least-eleven`](ArithmeticGaloisRepresentations.md#G7-gsp4-adequacy-in-characteristic-at-least-eleven), [`ArithmeticGaloisRepresentations:G7/taylor-wiles-unitary-tensor-adequacy`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-adequacy), [`ArithmeticGaloisRepresentations:G7/taylor-wiles-solvable-induced-tensor-adequacy`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-solvable-induced-tensor-adequacy), [`ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-symmetric-powers).

### Gap 10: Ext¹ computations for SL₂(F_{p^r}) behind GHT17 Corollary 9.4

Corollary 9.4 uses Andersen–Jørgensen–Landrock's Ext¹ computations for SL₂(p^r) (r > 1), [GHT, Cor. 1.4] for r = 1, H²(SL₂(F_q), k) = 0 for q ∉ {4, 9}, and tilting-module computations for q = 4, 9. No library or roadmap plans the modular representation theory of SL₂(F_q).

Needed by [`ArithmeticGaloisRepresentations:G7/ght-adequacy-of-sl2-representations`](ArithmeticGaloisRepresentations.md#G7-ght-adequacy-of-sl2-representations), [`ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-symmetric-powers).

### Gap 11: Thorne 2024, Lemma 7.3 (adequacy of symmetric powers of large SL₂ images)

Newton–Thorne quote Thorne, A p-adic approach to the existence of level-raising congruences (Proc. LMS 128, 2024), Lemma 7.3, which was not read; the node gives a proof route through GHT17 Corollary 9.4, which itself rests on the gap above.

Needed by [`ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-symmetric-powers).

### Gap 12: Lemma 7.5.22 of Boxer–Calegari–Gee–Pilloni when Proj r̄^σ ≅ τ ∘ Proj r̄ for a field automorphism τ ≠ 1

For #k > p the printed proof omits this case (sourceIssue E763), and the node's proof step (11) only sketches a repair. Established: τ² = 1; (E2) (V ≇ V^τ); H¹(SL₂(k), ad⁰V) = 0 for #k ≥ 25; H¹(SL₂(k), V ⊗ V^τ) = 0 for p ≥ 5 (Borel-subgroup weights: the weights ±1 ± q₀ of the diagonal torus are never ≡ 2p^s mod (q₀² − 1)); tidiness from an element with r̄ = diag(a, −a⁻¹), a a generator of k^×. Not established: the exact image of G_{F(ζ_{p^N})} (an index-two extension of a subgroup of {(A, ±τ(A))}), that it lies in the setting of part (7), and the existence in its non-identity coset of an element of order neither dividing 4 nor divisible by p. This case needs its own lemma node with a full proof.

Needed by [`ArithmeticGaloisRepresentations:G7/gsp4-sl2-wreath-vastness-and-tidiness`](ArithmeticGaloisRepresentations.md#G7-gsp4-sl2-wreath-vastness-and-tidiness).

### Gap 13: Finite group computations of Boxer–Calegari–Gee–Pilloni §7.5

The source proves by Magma: H¹(Sp₄(F_p), 𝔰𝔭₄) = 0 for p = 3, 5, 7 (Lemma 7.5.15); the list of the 11 enormous classes among the 162 conjugacy classes of subgroups of Sp₄(F_3) (§7.5.20); Lemma 7.5.21(1), (2), (3b), (4). Evidence obtained in the review, by linear algebra over F_p on the cocycle condition along a Cayley graph (pure Python, not a formal certificate): for Sp₄(F_3), generated group of order 51840, dim Z¹(𝔰𝔭₄) = 10 = dim B¹ and H⁰ = 0, so H¹ = 0; for the Borel subgroups of Sp₄(F_5) (order 10000) and Sp₄(F_7) (order 86436), H¹(B, 𝔰𝔭₄) = 0, hence H¹(Sp₄(F_p), 𝔰𝔭₄) = 0 for p = 5, 7 by restriction (index prime to p); for p = 3 the Borel subgroup has H¹ of dimension 1, so the whole group was needed. Proved by hand in the packet: Lemma 7.5.21(3a) (parts (8), (11)) and the enormity of the class of order 128 (part (12)). Not recomputed: the enumeration of the 162 classes and the other nine entries of the list; Lemma 7.5.21(2), (3b), (4). A formal treatment needs certified computations of these finite groups, or weight arguments on a Borel subgroup of Sp₄ in the manner of G7/h1-of-borel-subgroups-with-symmetric-power-coefficients for p = 5, 7.

Needed by [`ArithmeticGaloisRepresentations:G7/gsp4-standard-image-enormity-and-tidiness`](ArithmeticGaloisRepresentations.md#G7-gsp4-standard-image-enormity-and-tidiness), [`ArithmeticGaloisRepresentations:G7/gsp4-characteristic-three-subgroup-enumeration`](ArithmeticGaloisRepresentations.md#G7-gsp4-characteristic-three-subgroup-enumeration).

### Gap 14: H¹(SL₂(F_9), ad⁰) = 0 (the case #F = 9 of Darmon–Diamond–Taylor Lemma 2.48)

For F = F_9 the Borel-subgroup lemma does not apply to Sym²: besides the resonance (0, 0) there is (2, 1), since 2 − 4 ≡ 2·3 mod 8. Darmon–Diamond–Taylor require injectivity of the connecting map on a one-dimensional B/U-invariant cohomology space and leave that finite calculation unwritten. A finite computation in the review gave H¹(SL₂(F_9), Sym²) = 0 and H¹(B, Sym²) = 0 for its Borel subgroup. Missing: the computation of that connecting homomorphism H¹(B, gr₂) → H²(B, M₁) (Mathlib has groupCohomology.δ in all degrees), or a certified finite computation. Consumers need the case only through part (a) of the lemma (for example PSL₂(F_9)-images at p = 3 in G7/adequacy-of-rank-two-groups, Point 2 of BLGG13).

Needed by [`ArithmeticGaloisRepresentations:G7/h1-of-sl2-with-adjoint-coefficients`](ArithmeticGaloisRepresentations.md#G7-h1-of-sl2-with-adjoint-coefficients).

### Gap 15: H¹(SL_n(k′), ad⁰) = 0 for p > n ≥ 3 (Clozel–Harris–Taylor Lemma 2.5.6)

Part (4) (Gee–Newton Lemma 3.2.4) rests on the proof of Clozel–Harris–Taylor Lemma 2.5.6, which needs H¹(SL_n(k′), 𝔤𝔩_n⁰(k)) = 0 for a finite field k′ of characteristic l > n ≥ 3 and takes it from Cline–Parshall–Scott (Table 4.5). No node proves it and Cline–Parshall–Scott was not read. A proof by weights on a Borel subgroup, as for SL₂, is plausible (the adjoint module has the root weights) but was not carried out.

Needed by [`ArithmeticGaloisRepresentations:G7/enormous-standard-sl-overgroups`](ArithmeticGaloisRepresentations.md#G7-enormous-standard-sl-overgroups).

### Gap 16: Simplicity and pairwise non-isomorphism of PSL₂(F_p) and PSU_m(F_{p²}) (Boxer–Calegari–Gee–Newton–Thorne Lemma 5.2.3)

Part (2) uses, for m ≥ 3 and p ≥ 5: PSU_m(F_{p²}) is simple, is not isomorphic to PSL₂(F_p), and SU_m(F_{p²}) acts absolutely irreducibly on its standard representation; Goursat's lemma then gives (r̄_A, r̄_B)(G_{F(ζ_p)}) = SL₂(F_p) × SU_m(F_{p²}). The source quotes Steinberg's lectures on Chevalley groups (Theorem 37) and Carter. Mathlib has simplicity of PSL₂ only (Matrix.ProjectiveSpecialLinearGroup.rank_two_simple); no library and no roadmap plans the unitary groups over finite fields. (An order comparison settles the non-isomorphism once simplicity is known.)

Needed by [`ArithmeticGaloisRepresentations:G7/taylor-wiles-unitary-tensor-adequacy`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-adequacy), [`ArithmeticGaloisRepresentations:G7/taylor-wiles-unitary-tensor-scalar-witness`](ArithmeticGaloisRepresentations.md#G7-taylor-wiles-unitary-tensor-scalar-witness).

### Gap 17: Projective images A₄ and A₅ in characteristic 3 and 5: the Sublemma of BLGG13, Appendix A.2

Part (5) (Points 4 and 7 of the proof of BLGG13 Proposition A.2.1) uses: a subgroup G ⊆ GL₂(F̄_l) with projective image isomorphic to A₄ or A₅ satisfies F̄_l^×G = F̄_l^×φ̃(2.A₄ or 2.A₅) for a two-dimensional representation φ̃ of the binary polyhedral group (l-representation groups, Schur multiplier Z/2); the two-dimensional Brauer characters of 2.A₅ modulo 3 and modulo 5 (modular Atlas); for l = 3, ad⁰ of these representations is irreducible and projective, so H¹ = 0; for l = 5 (resp. l = 3) a projective image isomorphic to A₅ (resp. A₄) is conjugate to PSL₂(F_5) (resp. PSL₂(F_3)). None of these inputs is in a library or planned by a roadmap; R01.4/dickson-classification-and-the-dyadic-refinement supplies only the list of projective images.

Needed by [`ArithmeticGaloisRepresentations:G7/adequacy-of-rank-two-groups`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-rank-two-groups).

### Gap 18: Absolute irreducibility of 𝔰𝔭₄ under Sp₄(F_p) for p ≥ 3

Used for (E3) and (H2) when the image contains Sp₄(F_p) (Boxer–Calegari–Gee–Pilloni Lemma 7.5.15 uses absolute irreducibility of the adjoint representation; Clozel–Harris–Taylor Lemma 2.5.5 uses the appropriate restricted Weyl-module description). No node proves it. A direct proof route: 𝔰𝔭₄ ≅ Sym²(k⁴) for p odd; the weights of the diagonal torus of Sp₄(F_p) on Sym² are the 8 roots and 0 (twice); for p ≥ 5 the root spaces are distinct weight lines and the root subgroups move them transitively and reach the zero weight space; p = 3 needs a separate check (root weights coincide modulo 2). Not carried out.

Needed by [`ArithmeticGaloisRepresentations:G7/gsp4-standard-image-enormity-and-tidiness`](ArithmeticGaloisRepresentations.md#G7-gsp4-standard-image-enormity-and-tidiness), [`ArithmeticGaloisRepresentations:G7/cg20-big-image-examples`](ArithmeticGaloisRepresentations.md#G7-cg20-big-image-examples).

### Gap 19: Frobenius-twisted tensor irreducibility proof

For q=p^b, b≥2 and 1≤r≤p−1, the standard Frobenius twist tensor Sym^(r−1) of the standard SL₂(F_q) module must be proved absolutely irreducible with the correct finite-field scope. The accepted remaining item suggests distinct weights and unipotent raising/lowering for p≥5, but it is not a proof at every endpoint; the Steinberg tensor-product input and the small prime endpoints are not checked here. This feeds the retained adequacy and adjoint-invariant targets.

Needed by [`ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-symmetric-powers), [`ArithmeticGaloisRepresentations:G7/adjoint-invariants-of-symmetric-powers`](ArithmeticGaloisRepresentations.md#G7-adjoint-invariants-of-symmetric-powers).

### Gap 20: Pilloni and published source collation boundaries

Pilloni §5.7 and Propositions 5.6,5.8 remain unread for the H3/H3′ reading. The published BLGG13 Proposition A.2.1 and published CG18/BCGP21/NT26 locations of parent sourceIssues E702,E703,E704,E720,E754 still need version-of-record collation. The original findings are imported as findings of the accepted parent, not claimed freshly established here.

Needed by [`ArithmeticGaloisRepresentations:G7/cg20-big-image-assumption`](ArithmeticGaloisRepresentations.md#G7-cg20-big-image-assumption), [`ArithmeticGaloisRepresentations:G7/cg20-big-image-examples`](ArithmeticGaloisRepresentations.md#G7-cg20-big-image-examples), [`ArithmeticGaloisRepresentations:G7/adequacy-of-rank-two-groups`](ArithmeticGaloisRepresentations.md#G7-adequacy-of-rank-two-groups).

### Gap 21: Finite-projective topological adapters outside the checked power interface

The retained target-level tensor-induction, restriction-of-scalars and CHT induction constructions have exact source statements and APIs in the parent. Current libraries supply the algebraic monomial/tensor action and generic algebraic carriers. What remains is the finite-projective topology comparison, transversal-change coherence, transitive coefficient topology and the CHT induction representative independence in the arithmetic bundles; the accepted parent did not type these proof conditions completely.

Needed by [`ArithmeticGaloisRepresentations:G7/tensor-induction`](ArithmeticGaloisRepresentations.md#G7-tensor-induction), [`ArithmeticGaloisRepresentations:G7/restriction-of-scalars`](ArithmeticGaloisRepresentations.md#G7-restriction-of-scalars), [`ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`](ArithmeticGaloisRepresentations.md#G7-clozel-harris-taylor-group).

### Gap 22: Algebraic monodromy supplier comparison

The unread Borel boundary is replaced by the read Milne locators and current image/derived/component declarations. Matching these to the parent’s subgroup-in-GL monodromy carrier, the finite-index closure argument, the characteristic-zero point-bijection theorem and the torus Lie-weight argument remains a supplier comparison, not a missing source or a new generic group theory plan.

Needed by [`ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`](ArithmeticGaloisRepresentations.md#G7-zariski-closure-and-monodromy-groups), [`ArithmeticGaloisRepresentations:G7/strong-irreducibility`](ArithmeticGaloisRepresentations.md#G7-strong-irreducibility), [`ArithmeticGaloisRepresentations:G7/followup-cyclotomic-kernel-derived-monodromy`](#cyclotomic-kernel-derived-monodromy).

### Acceptance of the planning pass

All 77 accepted target IDs are retained; all 63 work items have a specific disposition; the new constructions have full APIs and at least three discriminating tests; all sources have exact locators and qualified read boundaries. The packet checker reports zero errors and zero warnings. The suggested file elaborates at both pins with only sorry warnings. This verifies the carriers and signatures it actually contains, not the mathematical proofs. The five omitted signatures are identified individually, and the parent suggested file's uncompiled geometric sections are not certified by this G7 run.

For mathematical closure, resolve the gap register, check the exact supplier comparisons, and type the five missing signatures on real carriers. Then check the combined reader, Lean file and graph after applying the ownership replacements. No finite-group certificate, local Sen decompletion proof, or published-edition collation is inferred from successful elaboration. Assembly preserves the parent source findings and replaces its G7 planets with the six here.
