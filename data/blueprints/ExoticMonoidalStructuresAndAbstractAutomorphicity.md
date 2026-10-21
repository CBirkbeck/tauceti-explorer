# Exotic symmetric monoidal structures and abstractly automorphic representations for GL(2)

The aim is a category of automorphic representations that contains reducible and infinite-length objects as well as the classical irreducibles. The construction begins locally: a triality representation on matrix test functions defines a tensor product of smooth GL₂-modules. Whittaker and spherical generators determine its unit and associator. Over a global function field, a rational theta sum gives a commutative algebra I whose modules are the abstractly automorphic representations. The normalized induction and component theorems identify its irreducible objects with the classical automorphic representations.

This roadmap owns the GL₂ triality kernel, exotic product, its coherence, the theta multiplication, the algebra I, its module category, spin convolution and Dor's normalization of induction. General smooth representation theory, Fourier analysis, metaplectic theory, line bundles and function-field arithmetic have the suppliers below. The targets are mathematical specifications; none is claimed implemented.

## Conventions and carriers

**Local context L.** F is a nonarchimedean local field with char F ≠ 2; G=GL₂(F), O is its ring of integers, π a uniformizer and q its residue cardinality. In characteristic zero this includes residue characteristic two. Coefficients are ℂ, and e:F→ℂ× is a fixed nontrivial continuous additive character. Put U={u(b)=[[1,b],[0,1]]} and θ(u(b))=e(b). S(X) means locally constant, compactly supported functions on the locally profinite space X. Use the supplier's actual compact-support carrier, not an archimedean SchwartzMap or finitely supported functions on a nondiscrete space.

All representations are smooth. Unless a twist is written, Jacquet coinvariants and parabolic induction are unnormalized. V(t)=V⊗|det|ᵗ. The smooth relative tensor is the balanced quotient with its specified smooth residual action; an algebraic diagonal-coinvariant construction alone does not establish the required category-theoretic properties. Φ⁻ is the exact (U,θ)-coinvariant functor with the conventions of the Whittaker unit.

The G Haar measure gives K=GL₂(O) volume one; the F× measure gives O× volume one. Additive measures are self-dual for the displayed character and pairing. A Dirac distribution δa on F× is an element of a roughening, not a locally constant function supported at the point a. The conductor ν(e) is the largest ν with e(π⁻νO)=1. It is a conductor lattice condition and does not identify the whole character kernel with a compact fractional ideal.

**Actions and duality.** IRL converts a left action ρ to v·g=ρ(gᵀ)v. On the regular function bimodule use (gL·f·gR)(h)=f(gR h gL). Thus a right group action acts by translating the argument on the left; every formula below specifies the underlying translation. In EX.1 the symbol Ṽ denotes the ordinary smooth contragredient, regarded as a right module. For the left exotic category the dual paired with IRL(V) is Dτ(V)=D(V)∘τ, where D is the ordinary smooth contragredient and τ(g)=g⁻ᵀ. In particular the function model S̃ in the global layers is Dτ(S). Its Petersson functional is balanced on IRL(S)⊗G S. These conventions prevent an implicit inverse-transpose twist in the identification with unrestricted smooth quotient functions.

Let Z=⊕c Zc, the direct sum of unital Bernstein block centres. Modfirm(Z) consists of firm modules: Z⊗Z M→M is invertible, equivalently every vector is fixed by a finite sum of block idempotents. The full centre is ∏c Zc. UnderlineHom always means finite Bernstein support, ⊕c Hom(Mc,Nc). Unadorned Hom permits all block supports. A roughening is the nonsmooth Hecke module HomG(S(G),V); taking its smooth part recovers V. These distinctions apply to maps out of Iunit and E.

**Global context A.** F is a global function field of odd characteristic with full finite constant field, A its full projective adele ring, G=GL₂(A), and Γ=GL₂(F). Fix a nontrivial character e of A/F and compatible self-dual measures; vol(U(F)\U(A))=1. The global symbols Iunit, Y and E receive a subscript A when a local formula is being compared with them. S=S(Γ\G) has compact quotient support; S̃ has no support restriction. All rational quotient integrals are over Γ\G, not over G. The multiplication on S initially lands in S̃; compactness of its restriction to I is a theorem.

The category of pairs in EX.5 has objects (M,N)∈Modfirm(Z)×Modfirm(Zsph), product (M⊗Z M′, M⊗Z N′ ⊕ N⊗Z M′ ⊕ N⊗Zsph N′), and unit (Z,0). The natural Z-action on Zsph is used in the mixed terms. Its functor to representations is faithful; its mixed morphisms must still be checked when the associator descends.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were read at the pin. A supplier citation is a planned input, not a claim that its implementation exists.

| Declaration | Exact role |
|---|---|
| `mathlib:Matrix.det_fin_two` | The determinant of a 2×2 matrix is ad−bc; this is a polynomial identity over a commutative ring. |
| `mathlib:Matrix.trace` | Trace is the finite sum of diagonal entries. |
| `mathlib:Rep.coinvariantsTensor` | The bifunctor (A,B)↦(A⊗B)G on algebraic representations; it does not supply smooth residual actions or smooth derived tensor. |
| `mathlib:CategoryTheory.SymmetricCategory` | SymmetricCategory extends a braided monoidal category by the double-braiding identity; it presupposes an associator. |
| `mathlib:CategoryTheory.CommMon` | CommMon bundles an object with a MonObj and IsCommMonObj structure in a braided monoidal category. |
| `mathlib:CategoryTheory.Mod` | Mod D A bundles module objects over a MonObj A in an acted-on category D; its forgetful functor forgets the action. |

The current AlgebraicVectorBundles roadmap owns the line-bundle and tensor carriers used by spin data; FA.1 imports them. The completed RestrictedProducts roadmap owns topological restricted products and their coordinate/change-of-reference operations; FA.2 imports them. Neither direction is replanned here. The current Tau Ceti library search found no triality/exotic-product or abstract automorphic-module implementation.

Exact imports include the smooth category, its abelian structure and smooth dual from `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `/smooth-rep-abelian` and `/smooth-dual`; Ext from `SR.0:derived-extension/derived-smooth-category`; the Schwartz, locally unital, induction and Bernstein targets listed in the individual dependencies; and the completed adele, residue-character, self-dual Haar and Poisson nodes of FA.2. The degree-sensitive Chebotarev receipt `FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev` imports `DeligneWeightsAndPurity:DWP.3/function-field-chebotarev` unchanged. It includes the constant-field degree restriction. EX.11 also imports the finite degree-zero ray class group and ray class fields from `FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard` and `/global-abelian-existence`; a prime in an arbitrary fixed-degree class is not assumed.

The remaining supplier contracts are collected after the layers. The function-field metaplectic and twisted spherical-centre extensions have already been routed to Part II directions. Their stage ids are unassigned, so the base-stage requests explicitly name those extensions. No nonexistent Part II stage is used as a dependency.

## Layer sequence

EX.0–EX.5 and EX.10 use L. EX.6–EX.9 and EX.11 use A. EX.10 is local theory used by EX.11; it is independent of the spin branch EX.9.

| Layer | Milestone |
|---|---|
| [EX.0](#ex-0) | Triality kernel and explicit Weil operators |
| [EX.1](#ex-1) | Spectral rigidification and local zeta integrals |
| [EX.2](#ex-2) | Exotic product and Whittaker unit |
| [EX.3](#ex-3) | Degeneracy-free representations and the centre |
| [EX.4](#ex-4) | Spherical generator and centre equivalence |
| [EX.5](#ex-5) | Associativity, trace and local convolution |
| [EX.6](#ex-6) | Adelic product and theta multiplication |
| [EX.7](#ex-7) | The compact automorphic algebra |
| [EX.8](#ex-8) | Abstract automorphic modules |
| [EX.9](#ex-9) | Spin structures and spherical convolution |
| [EX.10](#ex-10) | Normalized parabolic induction |
| [EX.11](#ex-11) | Automorphic adjunctions and components |

<a id="ex-0"></a>
## EX.0. Triality kernel and explicit Weil operators

Build the matrix symplectic representation and lift its triality symmetries before defining the function kernel. The two explicit generator formulas and the determinant coordinate fix its normalization.

**Context:** L.

<a id="EX-0-determinant-pairing"></a>
### Determinant pairing

**Target EX.0/determinant-pairing (definition).** For matrices m,n ∈ M₂(F), put B(m,n)=tr(m)tr(n)−tr(mn). This is the symmetric nondegenerate bilinear polarization det(m+n)−det(m)−det(n). On M₂(F)⊗F² use B(m,n)·(v∧v′) as the alternating form.

**Dependencies:** `mathlib:Matrix.det_fin_two`, `mathlib:Matrix.trace`.

**Construction or proof.** 1. Expand the 2×2 determinant and trace. 2. Identify M₂ with F⁴; the Gram matrix pairs E₀₀ with E₁₁ and E₀₁ with −E₁₀, so is invertible. Tensor a symmetric form with the standard alternating form.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction 2.7 and Remark 2.8, p. 11.

**Uses.** `EX.0/triality-symplectic`: Fixes the precise symplectic form preserved by triality. `EX.0/triality-kernel`: Fixes the sign and measure in the middle Fourier operator.

| Declaration | Specification |
|---|---|
| `detPairing` | B(m,n)=tr(m)tr(n)−tr(mn). |
| `detPairing_polar` | B(m,n)=det(m+n)−det(m)−det(n). |
| `detPairing_nondegenerate` | The induced map M₂(F)→(M₂(F))∨ is an isomorphism. |
| `detPairing_transpose` | B(mᵀ,nᵀ)=B(m,n). |

**Unit tests.**

- `determinant-pairing.1`: B(E₀₀,E₁₁)=1 and B(E₀₁,E₁₀)=−1.
- `determinant-pairing.2`: B(m,m)=2det(m), including singular nonzero matrices.
- `determinant-pairing.3`: B([[a,b],[c,d]],[[r,s],[t,u]])=au+dr−bt−cs.

<a id="EX-0-triality-symplectic"></a>
### Triality symplectic action

**Target EX.0/triality-symplectic (construction).** Let H={(g₁,g₂,g₃)∈G³ | det(g₁)det(g₂)det(g₃)=1}. On M₂(F)⊗F² let H act by m⊗v↦g₁mg₃ᵀ⊗g₂v. The identification with a triple tensor of two-dimensional spaces extends this to a symplectic action of S₃⋉H; (13) sends m⊗v to mᵀ⊗v.

**Dependencies:** [EX.0/determinant-pairing](#EX-0-determinant-pairing).

**Construction or proof.** 1. The determinant pairing scales by det(g₁g₃), while the wedge scales by det(g₂). 2. Use the standard symplectic identification of a two-dimensional space with its dual to permute the three tensor factors; check the semidirect relations.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Constructions 2.7 and 2.9, p. 11.

**Uses.** [EX.0/metaplectic-lift](#EX-0-metaplectic-lift): The symplectic action is the map whose lift is rigidified; its permutation operators fix the three-factor relations.

| Declaration | Specification |
|---|---|
| `trialityH` | H is the kernel of the product determinant homomorphism G³→F×. |
| `trialityAction_tmul` | The action on pure tensors is g₁mg₃ᵀ⊗g₂v. |
| `trialityAction_perm` | Permutation conjugation permutes the three G factors. |
| `trialityAction_isometry` | Every element preserves B⊗∧. |

**Unit tests.**

- `triality-symplectic.1`: A triple of scalar matrices lies in H precisely when the product of their determinants is 1.
- `triality-symplectic.2`: The transposition (13) acts twice as the identity on every m⊗v.
- `triality-symplectic.3`: For diag(a,1),diag(b,1),diag(c,1), preservation requires abc=1; without this condition the form scales by abc.

<a id="EX-0-metaplectic-lift"></a>
### Rigidified triality lift

**Target EX.0/metaplectic-lift (theorem).** There is exactly one lift of the preceding S₃⋉H action to the scalar ℂ× metaplectic extension whose operator for (13) on S(M₂(F)) is transpose. Its restriction to SL₂(F)³ is the Weil lift; the determinant-one torus and the order-three permutation obey the semidirect relations.

**Dependencies:** [EX.0/triality-symplectic](#EX-0-triality-symplectic), `MetaplecticAutomorphicForms:MP.1`, `MetaplecticAutomorphicForms:MP.2`.

**Construction or proof.** 1. Import the scalar metaplectic extension and Schrödinger model, including equal characteristic odd F through the supplier request. 2. Use perfectness of the SL₂ factors for uniqueness. Split the torus abc=1 by change of variables. 3. Compute the order-three operator by two-dimensional partial Fourier transform and check its cube and conjugation relations.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Proposition 2.12, pp. 12–14.

**Acceptance.** There is exactly one lift of the preceding S₃⋉H action to the scalar ℂ× metaplectic extension whose operator for (13) on S(M₂(F)) is transpose. Its restriction to SL₂(F)³ is the Weil lift; the determinant-one torus and the order-three permutation obey the semidirect relations.

<a id="EX-0-triality-kernel"></a>
### Triality kernel

**Target EX.0/triality-kernel (construction).** Construct the smooth S₃⋉G³-module Y=S(M₂(F)×F×) by induction of the lifted H action. With D=det(g₁g₂g₃), its action on Φ(m)f(y) is |D| times the H-operator (g₁,diag(y,1)g₂diag(y⁻¹D⁻¹,1),g₃) on Φ, multiplied by f(yD). In particular outer actions give Ψ(g₁⁻¹mg₃⁻ᵀ,y det(g₁g₃)); middle [[a,b],[0,1]] gives |a|e(by det m)Ψ(m,ay); middle w=[[0,−1],[1,0]] gives |y|²∫Ψ(n,y)e(−yB(m,n))dn.

**Dependencies:** [EX.0/metaplectic-lift](#EX-0-metaplectic-lift), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`.

**Construction or proof.** 1. Identify the induced space using the determinant coordinate and include the modulus twist. 2. Derive the three displayed generator formulas with the additive Haar measure self-dual for e and B. 3. Verify compact support, local constancy and the group relations; transport S₃ rather than inferring an action from commuting generators.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction 2.13, Examples 2.14–2.15 and Remark 2.16, pp. 12–13; Remark 2.24, p. 17.

**Uses.** [EX.2/exotic-product](#EX-2-exotic-product): Balancing its first and third actions produces the bifunctor and retains its middle action. [EX.6/theta-functional](#EX-6-theta-functional): The elementary reference functions and rational action formulas define the adelic theta sum.

| Declaration | Specification |
|---|---|
| `trialityY` | The induced representation is identified with S(M₂(F)×F×). |
| `trialityY_outer` | The two outer actions are Ψ(g₁⁻¹mg₃⁻ᵀ,y det(g₁g₃)). |
| `trialityY_middle_mirabolic` | The middle mirabolic action is \|a\|e(by det m)Ψ(m,ay). |
| `trialityY_middle_w` | The middle Weyl operator is the negative B-Fourier transform with factor \|y\|². |
| `trialityY_commute` | All three G actions commute, and permutation conjugation permutes them. |

**Unit tests.**

- `triality-kernel.1`: At m=0 the middle unipotent has phase 1, while at det m≠0 its phase depends on y.
- `triality-kernel.2`: Applying middle w twice agrees with middle −I, including the Fourier reflection and determinant scaling.
- `triality-kernel.3`: Transposing m interchanges the two outer actions without introducing an inverse in y.

<a id="EX-0-open-kernel"></a>
### Open triality kernel

**Target EX.0/open-kernel (definition).** Let Y°=S(G×F×), embedded in Y by extension by zero. It is stable under the two outer copies of G and the middle mirabolic subgroup, and generates Y under the middle G action. It is not asserted to be a middle G submodule.

**Dependencies:** [EX.0/triality-kernel](#EX-0-triality-kernel), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`.

**Construction or proof.** 1. Use openness of det≠0 to extend compactly supported locally constant functions. 2. For generation apply exact mirabolic functors Φ⁺Φ⁻: their image in Y is exactly the functions supported on invertible matrices, and use the Weyl element.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), §2.1, equations (2.1)–(2.2), p. 8; Lemma 2.19, p. 15; Remark 2.22, p. 17.

**Uses.** [EX.1/open-spectral](#EX-1-open-spectral): Its regular bimodule part provides the integral rigidification. [EX.1/kirillov-extension](#EX-1-kirillov-extension): Middle generation makes extension of the rigidified action unique.

| Declaration | Specification |
|---|---|
| `openY_inclusion` | Extension by zero Y°→Y is injective and outer equivariant. |
| `openY_mirabolic` | The middle mirabolic action restricts to Y°. |
| `openY_generate` | The middle G-submodule generated by Y° is Y. |
| `openY_derivative` | The image of Φ⁺Φ⁻Y→Y is Y°. |

**Unit tests.**

- `open-kernel.1`: A function supported on det m≠0 remains there under the middle unipotent.
- `open-kernel.2`: A function supported on singular matrices cannot be an element of Y° unless it is zero.
- `open-kernel.3`: A middle Fourier transform can acquire values at m=0; Y° must not be packaged with a full restricted middle G action.

**Check EX.0.** Compute the pairing on the four matrix units; verify the middle mirabolic and Weyl relations and all permutation conjugations. Check that the open kernel is only mirabolic-stable in the middle.


<a id="ex-1"></a>
## EX.1. Spectral rigidification and local zeta integrals

Rigidify the middle action spectrally using the open integral, then compare its boundary with the Kirillov boundary. Generic irreducible representations include Steinberg; determinant characters are excluded.

**Context:** L.

<a id="EX-1-central-balance"></a>
### Threefold Bernstein balance

**Target EX.1/central-balance (theorem).** Every element of the Bernstein centre of SmoothRepℂ(G) acts identically through each of the three G actions on Y. The resulting equality also holds after applying smooth balanced tensor products.

**Dependencies:** [EX.0/triality-kernel](#EX-0-triality-kernel), `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction or proof.** 1. Realize central operators as conjugation-invariant distributions with transpose invariance (requested from SR.3). 2. Pair S(M₂(F)) with S(G), use density of the invertible locus to compare the two outer actions, then conjugate by S₃.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Lemma 2.17 and Remark 2.18, pp. 14–15.

**Acceptance.** Every element of the Bernstein centre of SmoothRepℂ(G) acts identically through each of the three G actions on Y. The resulting equality also holds after applying smooth balanced tensor products.

<a id="EX-1-singular-orbits"></a>
### Singular orbit comparison

**Target EX.1/singular-orbits (theorem).** For a smooth V such that neither V nor its smooth contragredient Ṽ admits an SL₂(F)-invariant linear functional, the singular quotient satisfies Ṽ⊗G S({det m=0}×F×)⊗G V ≅ Jac(Ṽ)⊗T Jac(V), with T=F××F× and unnormalized Jacquet functors.

**Dependencies:** [EX.0/open-kernel](#EX-0-open-kernel), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Construction or proof.** 1. Separate the rank-zero and rank-one strata. The zero stratum is Q=S(F×), on which each outer G acts through determinant; the hypotheses imply V_SL₂=Ṽ_SL₂=0. 2. Apply the smooth two-group spectral sequence E²_i,j=Tor^G_i(Ṽ,Tor^G_j(V,Q))⇒Tor^(G×G)_(i+j)(Ṽ⊗V,Q). Since Tor^G_0(V,Q)=0, the terms (0,0) and (1,0) vanish. 3. The residual outer action on Tor^G_1(V,Q) still factors through determinant: every SL₂ element induces the identity on Q, hence the identity on its derived tensor by functoriality. Thus E²_0,1=Ṽ⊗G Tor^G_1(V,Q)=0, using Ṽ_SL₂=0. This proves the required total-degree-one vanishing without flatness. 4. The long exact sequence now identifies the rank-one balanced tensor with the full singular quotient. Compute its stabilizer and use induction/coinvariant adjunctions to obtain the two unnormalized Jacquet modules balanced over T.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Lemma 2.20 and proof, pp. 16–17.

**Acceptance.** The hypothesis excludes determinant characters. The rank-zero term and the relevant degree-one connecting map are both addressed explicitly.

<a id="EX-1-open-spectral"></a>
### Open spectral integral

**Target EX.1/open-spectral (construction).** For generic irreducible V and β(g)=⟨ṽ,π(g)v⟩, the formula μ(β⊗Ψ)(y)=∫G β(g)Ψ(g,y/det g)d×g descends to an isomorphism Ṽ⊗G Y°⊗G V→S(F×). The Haar measure gives GL₂(O) volume 1.

**Dependencies:** [EX.0/open-kernel](#EX-0-open-kernel), `SmoothRepresentationsOfLocalGroups:SR.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/countable-schur`.

**Construction or proof.** 1. Use the regular bimodule identification for S(G), Schur duality for irreducible V, and change of variables to prove balancing. 2. Integrate the compact g-support; establish the inverse using a matrix coefficient pairing normalized to 1.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Equation (2.2), p. 8; Remark 2.21, p. 17.

**Uses.** [EX.1/kirillov-extension](#EX-1-kirillov-extension): The boundary comparison must extend this exact integral, rather than an unnormalized abstract isomorphism.

| Declaration | Specification |
|---|---|
| `openSpectral` | The integral μ on pure tensors descends to a linear map. |
| `openSpectral_equiv` | For the stated irreducible V, μ is invertible. |
| `openSpectral_mirabolic` | μ intertwines the twisted mirabolic action dictated by K(V(−1))(1). |

**Unit tests.**

- `open-spectral.1`: On Ψ(g,y)=Φ(g)f(y det g), μ gives (∫β(g)Φ(g)d×g)f(y).
- `open-spectral.2`: Changing a representative by an outer balanced relation leaves μ unchanged.
- `open-spectral.3`: A direct sum V₁⊕V₂ must not be given the same irreducible-isomorphism theorem.

<a id="EX-1-kirillov-extension"></a>
### Kirillov spectral extension

**Target EX.1/kirillov-extension (theorem).** For every generic irreducible V, μ extends uniquely to a middle G-equivariant isomorphism ν:Ṽ⊗G Y⊗G V≅K(V(−1))(1). Here V(t)=V⊗|det|ᵗ and K denotes the Kirillov realization with its full G action. The uniqueness of the middle action is relative to this open-part rigidification for all such V.

**Dependencies:** [EX.1/open-spectral](#EX-1-open-spectral), [EX.1/singular-orbits](#EX-1-singular-orbits), [EX.1/central-balance](#EX-1-central-balance), `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Construction or proof.** 1. Use Y° generation for uniqueness. Compare its quotient by the open part with the Jacquet boundary in the Kirillov model. 2. For supercuspidal V the boundary vanishes; for principal series and Steinberg constituents compute the torus boundary and its extension class. 3. Check the mirabolic scaling and Weyl transform with the fixed twists, then use generic classification to obtain the spectral characterization.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Theorem 2.2 and Remarks 2.3–2.4, p. 9; proof pp. 15–17.

**Acceptance.** For every generic irreducible V, μ extends uniquely to a middle G-equivariant isomorphism ν:Ṽ⊗G Y⊗G V≅K(V(−1))(1). Here V(t)=V⊗|det|ᵗ and K denotes the Kirillov realization with its full G action. The uniqueness of the middle action is relative to this open-part rigidification for all such V.

<a id="EX-1-local-zeta"></a>
### Local zeta comparison

**Target EX.1/local-zeta (comparison).** Let Ψ(m,y)=Φ(m)f(y), with Φ∈S(M₂(F)), f∈S(F×), and β a matrix coefficient of generic irreducible V. With j the natural identification of K(V(−1))(1) with the underlying Kirillov-function space of V, ZJL(jν(β⊗Ψ),s)=ZGJ(β,Φ,s)·∫F×f(y)|y|^{s+1/2}d×y. ZGJ uses |det g|^{s+1/2} and ZJL uses |y|^{s−1/2}; initially take a common domain of absolute convergence and then the supplied meromorphic extensions.

**Dependencies:** [EX.1/kirillov-extension](#EX-1-kirillov-extension), `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-convergence`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.** 1. Substitute the open integral and change y to y det g. 2. Use the precise Kirillov twist identification in Proposition 2.5; check powers before invoking analytic continuation.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Proposition 2.5, p. 10; Remark 2.21, p. 17.

**Acceptance.** The Mellin exponent s+1/2 is preserved. A change of twist convention requires a corresponding change of j, not a change of the theorem without explanation.

**Check EX.1.** Check supercuspidal, irreducible principal-series and Steinberg cases with the same open integral. Check the residual determinant action on Tor¹ and the vanishing of all total-degree-one edge terms. Preserve both zeta exponents and the Mellin factor.


<a id="ex-2"></a>
## EX.2. Exotic product and Whittaker unit

Form the balanced tensor and compute its Whittaker unit and trace. The weak structure deliberately specifies its precise amount of data so that the associator theorem has a definite extension problem.

**Context:** L.

<a id="EX-2-transpose-right"></a>
### Transpose right action

**Target EX.2/transpose-right (definition).** For a smooth left G-module (V,ρ), define IRL(V) as the right module v·g=ρ(gᵀ)v. Its inverse uses transpose again. This is an equivalence between the left and right smooth representation categories, not the contragredient functor.

**Dependencies:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `mathlib:Matrix.det_fin_two`.

**Construction or proof.** 1. Transpose reverses multiplication and is continuous and involutive on GL₂(F). 2. Keep the module and all linear morphisms unchanged and check the right action law.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Notation before Definition 3.2, pp. 18–19.

**Uses.** [EX.2/exotic-product](#EX-2-exotic-product): Converts both left input modules to right modules so the outer kernel actions can be balanced. [EX.2/trace-symmetry](#EX-2-trace-symmetry): Fixes the transpose convention in the balanced trace pairing.

| Declaration | Specification |
|---|---|
| `transposeRightAction` | v·g=ρ(gᵀ)v. |
| `transposeRightAction_mul` | (v·g)·h=v·(gh). |
| `transposeRightEquivalence` | IRL and ILR are mutually inverse equivalences. |
| `transposeRight_intertwiner` | The underlying map of IRL(f) is f. |

**Unit tests.**

- `transpose-right.1`: For diagonal g, the right action is ρ(g), not ρ(g⁻¹).
- `transpose-right.2`: For upper unipotent u(b), the right operator is the lower unipotent ρ(u(b)ᵀ).
- `transpose-right.3`: Applying the left/right conversion twice restores the original action.

<a id="EX-2-exotic-product"></a>
### Exotic tensor product

**Target EX.2/exotic-product (construction).** For smooth left modules M,N define M⊛N=(IRL(M)⊗ℂ IRL(N))⊗G×G Y using the first and third kernel actions, retaining the middle action. For morphisms use the descended tensor map. Transpose of m defines a natural involutive symmetry; the product preserves colimits separately and is right exact. The ordinary tensor product of G representations is not used as the output product.

**Dependencies:** [EX.2/transpose-right](#EX-2-transpose-right), [EX.0/triality-kernel](#EX-0-triality-kernel), [EX.1/central-balance](#EX-1-central-balance), `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Rep.coinvariantsTensor`.

**Construction or proof.** 1. Form smooth balanced coinvariants with commuting residual action; invoke the supplier contract, not just algebraic Rep.coinvariantsTensor. 2. Descend the transpose map and check the symmetry square. Colimit preservation follows from the balanced quotient construction.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definition 3.2 and Construction 3.3, pp. 19–20.

**Uses.** [EX.2/whittaker-unit](#EX-2-whittaker-unit): The unit isomorphism is computed from the balanced kernel quotient. [EX.5/associator](#EX-5-associator): Separate colimit preservation extends the associator from finite sums of generators.

| Declaration | Specification |
|---|---|
| `exoticTensor` | The displayed balanced quotient with its middle G action. |
| `exoticTensor_map` | Pure tensor representatives map by f⊗g⊗idY. |
| `exoticTensor_braiding` | Transpose yields M⊛N≅N⊛M and its square is identity. |
| `exoticTensor_colimits` | Each argument preserves small colimits and cokernels. |
| `exoticTensor_centre` | The two input centre actions and output centre action agree. |

**Unit tests.**

- `exotic-product.1`: If M=0, then M⊛N=0.
- `exotic-product.2`: Swapping inputs twice fixes every class [m⊗n⊗Ψ].
- `exotic-product.3`: The unit test in EX.2/whittaker-unit gives Iunit⊛N≅N, while ordinary tensor with Iunit would not.

<a id="EX-2-weak-symmetric"></a>
### Weak symmetric tensor data

**Target EX.2/weak-symmetric (definition).** A weak symmetric tensor structure consists of a bifunctor, an object Iunit, a natural involutive symmetry s, and natural left unit isomorphisms λ:Iunit⊛X≅X, with λIunit compatible with sIunit,Iunit. It contains no associator. A weak symmetric monoidal functor carries product and unit isomorphisms compatible with s and λ, without asserting pentagon or hexagon axioms.

**Hypotheses:** C and D are categories in fixed universes.

**Dependencies:** `mathlib:CategoryTheory.SymmetricCategory`.

**Construction or proof.** 1. Specify the two functors and natural isomorphisms with the stated equations. 2. Define functor morphisms by the two compatibility squares. A monoidal category forgets to these data.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definitions 3.7–3.8 and Remark 3.9, pp. 20–21.

**Uses.** [EX.2/trace-symmetry](#EX-2-trace-symmetry): Precisely states the unitor/symmetry axioms proved without associativity. [EX.5/associator](#EX-5-associator): Identifies the data to which a unique compatible associator is added.

| Declaration | Specification |
|---|---|
| `weakSymmetricTensor` | Bifunctor, unit, symmetry and unitor with the involution and unit equations. |
| `weakSymmetricTensor_ofSymmetric` | Forget a Mathlib SymmetricCategory to the data above. |
| `weakSymmetricFunctor_comp` | Compose the product and unit comparisons; identity is compatible. |
| `weakSymmetricTensor_ext` | Equality is determined by the bifunctor, unit, symmetry and unitor data. |

**Unit tests.**

- `weak-symmetric.1`: The usual tensor of complex vector spaces supplies such data.
- `weak-symmetric.2`: For every c∈ℂ×, replacing the usual vector-space left unitor by cλ while retaining the usual tensor and flip still satisfies both weak symmetry equations, including λI∘sI,I=λI.
- `weak-symmetric.3`: From the usual vector-space weak structure to the one with unitor cλ, the identity functor with identity product comparison satisfies the unit square with unit comparison c·idℂ. Keeping its unit comparison equal to idℂ fails that square when c≠1.

<a id="EX-2-whittaker-unit"></a>
### Whittaker unit

**Target EX.2/whittaker-unit (construction).** For U={u(b)} and θ(u(b))=e(b), let Iunit be the quotient of S(G) by the span of f(u·)−θ(u)f, with G acting by right translation. Identify it with c-IndU^G θ. There is a natural isomorphism λV:Iunit⊛V≅V, obtained from the middle θ-coinvariants of Y≅S(G). Its representative formula is φ(f⊗Ψ)(g)=∫G f(h)(w h⁻ᵀ·Ψ)(g⁻¹,−det g)d×h.

**Dependencies:** [EX.2/exotic-product](#EX-2-exotic-product), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`.

**Construction or proof.** 1. Apply exact θ-coinvariants to the middle kernel action. Compute the remaining outer regular bimodule and its normalization. 2. Use S(G)⊗G V≅V from SR.2 and prove naturality. Compare quotient and compact-induction realizations with the same Haar normalization.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Constructions 3.10 and 3.16; Remarks 3.11–3.17; equation (3.3), pp. 22–23.

**Uses.** [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker): Tensoring the unit over the centre gives the left adjoint to enhanced Whittaker coinvariants. [EX.7/poincare](#EX-7-poincare): Its adelic compact-induction realization supplies the Poincaré unit map.

| Declaration | Specification |
|---|---|
| `whittakerUnit` | The right-U θ-coinvariant quotient of S(G), as specified. |
| `whittakerUnit_cInd` | Iunit≅c-IndU^G θ with compact support modulo U. |
| `exoticLeftUnitor` | λV:Iunit⊛V≅V, natural in V. |
| `whittakerUnit_hom` | Maps Iunit→V are exactly G-linear maps S(G)→V killing f(u·)−θ(u)f. The identification with Φ⁻V uses finite-central-support Hom and is the target EX.3/enhanced-whittaker. |

**Unit tests.**

- `whittaker-unit.1`: The compact-induction representative satisfies W(ug)=θ(u)W(g).
- `whittaker-unit.2`: The image of [f(uh)−θ(u)f(h)] vanishes in the quotient.
- `whittaker-unit.3`: For V=Iunit both the representative integral and symmetry-compatible unit normalization give the same λIunit.

<a id="EX-2-trace-symmetry"></a>
### Whittaker trace and symmetry

**Target EX.2/trace-symmetry (theorem).** Transpose is the identity on the double θ-coinvariants of Y for its outer actions. Consequently the braiding on Iunit⊛Iunit is identity and the preceding data define a weak symmetric tensor structure. Moreover Φ⁻(M⊛N)≅IRL(M)⊗G N naturally and EndG(Iunit) is commutative.

**Dependencies:** [EX.2/whittaker-unit](#EX-2-whittaker-unit), [EX.2/weak-symmetric](#EX-2-weak-symmetric), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Compute the double θ-coinvariants by rank-two Bruhat cells, rank one and rank zero; check transpose on each surviving orbit. 2. Use the kernel-unit comparison to identify the trace and to verify the unit symmetry axiom. 3. Apply the unit/symmetry Eckmann–Hilton argument without assuming an associator.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Remark 3.17, p. 23; Claim 3.18, p. 24; Corollaries 3.20–3.21, p. 25.

**Acceptance.** Transpose is the identity on the double θ-coinvariants of Y for its outer actions. Consequently the braiding on Iunit⊛Iunit is identity and the preceding data define a weak symmetric tensor structure. Moreover Φ⁻(M⊛N)≅IRL(M)⊗G N naturally and EndG(Iunit) is commutative.

**Check EX.2.** Apply the representative unitor to the quotient relations and recover the regular bimodule. Verify the involutive symmetry on the double Whittaker quotient, including every surviving Bruhat stratum.


<a id="ex-3"></a>
## EX.3. Degeneracy-free representations and the centre

Separate the Whittaker-generated category from the class of generic irreducibles. The finite-support enriched adjunction, rather than full Hom with unrestricted block support, gives the equivalence with centre modules.

**Context:** L.

<a id="EX-3-degeneracy"></a>
### Degeneracy-free representations

**Target EX.3/degeneracy (definition).** A representation D is degenerate if Φ⁻D=0. A representation N is degeneracy-free if HomG(N,D)=0 and Ext¹G(N,D)=0 for every degenerate D. This quantifies over all degenerate objects, not just irreducible ones.

**Dependencies:** [EX.2/trace-symmetry](#EX-2-trace-symmetry), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-category`.

**Construction or proof.** 1. Use the smooth abelian category and its Ext¹, with Φ⁻ as an exact functor. 2. Define the full subcategory by the simultaneous left-orthogonality conditions HomG(N,D)=Ext¹G(N,D)=0 for every degenerate D, and establish invariance under isomorphism.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definitions 3.22–3.23, Warning 3.25, p. 25.

**Uses.** [EX.3/degeneracy-equivalence](#EX-3-degeneracy-equivalence): Hom and Ext orthogonality characterize the essential image of the centre-module functor.

| Declaration | Specification |
|---|---|
| `isDegenerate` | IsDegenerate D ↔ Φ⁻D=0. |
| `isDegeneracyFree` | The two vanishing conditions for every degenerate D. |
| `degeneracyFree_iso` | Both predicates are preserved by representation isomorphisms. |
| `degeneracyFree_colimit` | The essential-image theorem EX.3/degeneracy-equivalence supplies closure under colimits. |

**Unit tests.**

- `degeneracy.1`: A nonzero determinant character is degenerate.
- `degeneracy.2`: Steinberg is generic but is not degeneracy-free.
- `degeneracy.3`: The nonsplit extension 0→1G→Eext→St→0 is degeneracy-free.
- `degeneracy.4`: The product 1G⊛1G has a Steinberg subobject, so the degenerate subcategory is not a tensor ideal.

<a id="EX-3-bernstein-firm"></a>
### Locally unital Bernstein modules

**Target EX.3/bernstein-firm (definition).** Let Z=⊕c Zc be the direct sum of the unital Bernstein block centres. Use firm Z-modules: Z⊗Z M→M is an isomorphism, equivalently every element is fixed by a finite sum of block idempotents. For block-decomposed smooth representations define finite-support enriched Hom by underlineHom(M,N)=⊕c HomG(Mc,Nc), with blockwise composition and evaluation. Full Hom permits a product over blocks. The endomorphism calculation for Iunit is the separate theorem EX.3/whittaker-centre.

**Dependencies:** `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`, [EX.1/central-balance](#EX-1-central-balance), `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`.

**Construction or proof.** 1. Import locally unital algebra modules from SR.1; specialize to the block-centre direct sum. 2. Use Bernstein block decompositions to compare firm modules with block families and construct finite-support Hom.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), §3.4 and Remark 3.29, pp. 25–27.

**Uses.** [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker): Firm tensor and finite-support Hom make the enhanced adjunction meaningful. [EX.4/spherical-equivalence](#EX-4-spherical-equivalence): The same enrichment distinguishes direct-sum and product centres.

| Declaration | Specification |
|---|---|
| `bernsteinFirmModule` | The firm module condition is the invertibility of the multiplication map Z⊗Z M→M. |
| `bernsteinFiniteHom` | Finite sums of block-supported morphisms, with evaluation and composition. |
| `bernsteinFirm_block` | Firm modules correspond to block families with direct-sum underlying vector space. |
| `bernsteinFiniteHom_comp` | Composition and evaluation are blockwise; morphisms between different Bernstein blocks vanish, and any finite sum is supported by its finite block idempotent. |

**Unit tests.**

- `bernstein-firm.1`: For finitely many blocks Z is unital and firm modules are ordinary unital modules.
- `bernstein-firm.2`: For infinitely many nonzero blocks, a vector with infinitely many nonzero coordinates in ∏c Zc is not fixed by a finite block idempotent.
- `bernstein-firm.3`: A map supported on one block belongs to underlineHom; the identity of Iunit need not belong to it.

<a id="EX-3-whittaker-centre"></a>
### Whittaker unit and Bernstein centre

**Target EX.3/whittaker-centre (theorem).** Evaluation of a natural central transformation on Iunit gives an isomorphism ∏c Zc≅EndG(Iunit). On each block it is Zc≅EndG(Iunit,c); consequently finite-support underlineEndG(Iunit)≅⊕c Zc=Z. These are algebra isomorphisms with the stated evaluation and composition, rather than a definition of either centre.

**Dependencies:** [EX.3/bernstein-firm](#EX-3-bernstein-firm), [EX.2/whittaker-unit](#EX-2-whittaker-unit), [EX.2/trace-symmetry](#EX-2-trace-symmetry), [EX.1/central-balance](#EX-1-central-balance).

**Construction or proof.** 1. A central natural transformation z acts on Iunit. For f∈EndG(Iunit), define ψ(f)_X=λX∘(f⊛idX)∘λX⁻¹. Bifunctoriality makes ψ(f) natural in X and makes ψ an algebra homomorphism. 2. The symmetry sIunit,Iunit is the identity because λIunit∘sIunit,Iunit=λIunit. Symmetry naturality and unitor naturality therefore give ψ(f)_Iunit=f, proving surjectivity of central evaluation. 3. Central balance gives zIunit⊛idX=idIunit⊛zX. Conjugating by λX identifies both with zX. Thus zIunit=0 forces zX=0 for every X, proving injectivity. 4. Restrict the algebra isomorphism to each block. Bernstein orthogonality identifies full endomorphisms with the product and the finite-support enrichment with the direct sum.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Claim 3.32 proof, p. 29; Remark 3.29, p. 27; Lemma 2.17, pp. 14–15.

| Declaration | Specification |
|---|---|
| `bernsteinFiniteHom_endUnit` | underlineEnd(Iunit)=Z, whereas full End(Iunit)=∏c Zc. |

**Acceptance.** Check both inverse composites of central evaluation and ψ, including the unit and composition. Distinguish the full product from its finite-support subalgebra; an infinite family of block identities is not an element of Z.

<a id="EX-3-enhanced-whittaker"></a>
### Enhanced Whittaker adjunction

**Target EX.3/enhanced-whittaker (construction).** The Whittaker functor refines to Φ⁻enh:Mod(G)→Modfirm(Z), and F(N)=N⊗Z Iunit is its left adjoint. The unit N→Φ⁻enhF(N) is invertible; thus F is fully faithful. The tensor and unit comparisons make F weak symmetric monoidal.

**Dependencies:** [EX.3/bernstein-firm](#EX-3-bernstein-firm), [EX.2/whittaker-unit](#EX-2-whittaker-unit), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`, [EX.3/whittaker-centre](#EX-3-whittaker-centre).

**Construction or proof.** 1. Prove the blockwise roughening/smoothing comparison of Lemma 3.35, using compact projective generators from the supplier. 2. Use EX.3/whittaker-centre to identify underlineEndG(Iunit) with Z. Construct the adjunction by the enriched tensor-Hom correspondence. 3. Compute the unit and the product comparison on Z and extend by colimits.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Claims 3.30, 3.32–3.33 and Lemma 3.35, pp. 27–29.

**Uses.** [EX.3/degeneracy-equivalence](#EX-3-degeneracy-equivalence): Invertibility of its adjunction unit gives full faithfulness; presentations identify the image. [EX.5/associator](#EX-5-associator): Its tensor comparisons determine associators on the Whittaker-generated part.

| Declaration | Specification |
|---|---|
| `enhancedWhittaker` | Φ⁻ with its smooth Z action and action compatibility. |
| `whittakerFree` | N↦N⊗Z Iunit. |
| `whittakerAdjunction` | HomG(N⊗Z Iunit,V)≅HomZ(N,Φ⁻enhV). |
| `whittakerFree_unit` | The adjunction unit is an isomorphism. |
| `whittakerFree_product` | F(N⊗Z M)≅F(N)⊛F(M), compatibly with symmetry and unit. |

**Unit tests.**

- `enhanced-whittaker.1`: F(Z)=Iunit with the specified unit comparison.
- `enhanced-whittaker.2`: For N supported on a single block the construction has no other block component.
- `enhanced-whittaker.3`: For any firm N, applying Φ⁻enh to N⊗Z Iunit returns N, including infinite direct sums.

<a id="EX-3-degeneracy-equivalence"></a>
### Degeneracy-free equivalence

**Target EX.3/degeneracy-equivalence (theorem).** F gives an equivalence Modfirm(Z)≅Moddf(G). Its image is also the smallest full subcategory containing Iunit and closed under colimits. The usual symmetric monoidal structure on firm Z-modules transfers to a uniquely compatible symmetric monoidal structure on this image.

**Dependencies:** [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker), [EX.3/degeneracy](#EX-3-degeneracy).

**Construction or proof.** 1. Use the adjunction to identify Hom/Ext orthogonality to degenerate representations. 2. Compare a projective presentation by sums of block pieces of Iunit with the counit; both its kernel and cokernel are degenerate and the orthogonality conditions force them to vanish. 3. Transport associativity inside the fully faithful image; this does not yet provide an associator on all representations.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Theorem 3.26, Corollary 3.27 and Remark 3.28, p. 26.

**Acceptance.** F gives an equivalence Modfirm(Z)≅Moddf(G). Its image is also the smallest full subcategory containing Iunit and closed under colimits. The usual symmetric monoidal structure on firm Z-modules transfers to a uniquely compatible symmetric monoidal structure on this image.

**Check EX.3.** Test the trivial representation, Steinberg and the two orientations of their nonsplit extension. Check both inverse composites of central evaluation and ψ. Check the adjunction on a single block and on an infinite direct sum. Distinguish Z from the product centre.


<a id="ex-4"></a>
## EX.4. Spherical generator and centre equivalence

The spherical generator uses SL₂(O), allowing ramified determinant characters. Its distributions and finite-support centre supply the second generator needed for associativity.

**Context:** L.

<a id="EX-4-spherical-generator"></a>
### Spherical generator

**Target EX.4/spherical-generator (definition).** Set K=GL₂(O) and E=c-IndK^G S(O×), where K acts on S(O×) through determinant and translation. Equivalently E=c-IndSL₂(O)^G 1. Define Modsph(G) as the full colimit closure of E, and Zsph as the direct sum of Bernstein centres of blocks containing a one-dimensional representation.

**Dependencies:** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`.

**Construction or proof.** 1. Use compact induction in stages and the determinant quotient K/SL₂(O)=O×. 2. Form the full colimit-generated subcategory and select the indicated blocks; do not replace the generator by c-IndK^G1.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definition 3.36 and Remarks 3.37–3.41, pp. 30–31.

**Uses.** [EX.4/spherical-maps](#EX-4-spherical-maps): The roughening adjunction specifies counit and comultiplication by distributions. [EX.4/two-generators](#EX-4-two-generators): Its finite-block projectives supply the representations missed by the unit-generated part.

| Declaration | Specification |
|---|---|
| `sphericalGenerator` | E=c-IndK^G S(O×), with the regular determinant action. |
| `sphericalGenerator_sl2` | Induction in stages gives E≅c-IndSL₂(O)^G1. |
| `sphericalSubcategory` | The smallest full colimit-closed subcategory containing E. |
| `sphericalGenerator_hom` | HomG(E,V)≅HomG(S(G),V)^SL₂(O), using the nonsmooth Hecke-module roughening. Its finite-Bernstein-support part identifies with V^SL₂(O). |
| `sphericalCentre` | Zsph=⊕c Zc over blocks containing a determinant character. |

**Unit tests.**

- `spherical-generator.1`: Every smooth determinant character χ∘det is generated by SL₂(O)-fixed vectors, including ramified χ.
- `spherical-generator.2`: A ramified χ∘det has no K-fixed vector, so the K-spherical definition would be too small.
- `spherical-generator.3`: Finite-support underlineHomG(E,V) is V^SL₂(O), whereas full HomG(E,V) uses the roughening; replacing it by V^K loses ramified determinant vectors.

<a id="EX-4-spherical-maps"></a>
### Spherical counit and comultiplication

**Target EX.4/spherical-maps (construction).** Let ν be the largest integer with e(π⁻νO)=1, q=|O/πO|, h=diag(1,−π^ν). Define ε:E→Iunit from the rough distribution f(u(b)hk)=e(b)δ1(det k), k∈K, zero off UhK. Define Δ:E→E⊛E from q⁻ν·1M₂(O)(m)δπ⁻ν(y), interpreted in the roughening of Y. Both maps are specified as equivariant maps out of compact induction, with exact normalization fixed by ε and the two unit equations.

**Dependencies:** [EX.4/spherical-generator](#EX-4-spherical-generator), [EX.2/whittaker-unit](#EX-2-whittaker-unit), [EX.0/triality-kernel](#EX-0-triality-kernel), `SmoothRepresentationsOfLocalGroups:SR.2`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`.

**Construction or proof.** 1. Compute the relevant invariance under K and SL₂(O). Delta at a point of F× is a distribution, not a locally constant compactly supported function. 2. Use the compact-induction/roughening adjunction to obtain maps. 3. Check the conductor lattice hKh⁻¹∩U=u(π⁻νO). A general h with that lattice condition transports the construction.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Constructions 3.44–3.45 and Remarks 3.46–3.48, pp. 31–33.

**Uses.** [EX.4/spherical-equivalence](#EX-4-spherical-equivalence): The counit identities prove that comultiplication is invertible. [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra): The adelic coalgebra requires transported local maps and reference compatibility.

| Declaration | Specification |
|---|---|
| `sphericalCounit` | The map ε:E→Iunit from the θ-equivariant UhK distribution. |
| `sphericalComult` | The map Δ from q⁻ν1M₂(O)δπ⁻ν in the rough kernel. |
| `sphericalComult_counits` | (ε⊛id)Δ and (id⊛ε)Δ are inverse unitors. |
| `sphericalMaps_change_h` | An admissible h with the conductor-lattice condition gives the transported maps. |

**Unit tests.**

- `spherical-maps.1`: For ν=0, q⁻ν=1 and the determinant distribution is δ1.
- `spherical-maps.2`: For a ramified character, replacing δπ⁻ν by δ1 without transporting the lattice fails the unit normalization.
- `spherical-maps.3`: Over a positive-characteristic local field, ker e need not equal π⁻νO, and must not replace the conductor lattice.

<a id="EX-4-spherical-equivalence"></a>
### Spherical centre equivalence

**Target EX.4/spherical-equivalence (theorem).** The maps ε and Δ satisfy both counit equations, and Δ is an isomorphism. E is projective and each block piece compact; underlineEnd(E)=Zsph. The functor N↦N⊗Zsph E is fully faithful with image Modsph(G) and preserves tensor products and symmetry. Its domain unit Zsph maps to E, so the comparison is not a unit-preserving functor to the ambient category with unit Iunit.

**Dependencies:** [EX.4/spherical-maps](#EX-4-spherical-maps), [EX.3/bernstein-firm](#EX-3-bernstein-firm), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction or proof.** 1. Import the compact-projective and centre computations through the parahoric-centres request. 2. Apply Φ⁻ to Δ and use ε to split it. Work blockwise and exclude a nontrivial idempotent retract of E. 3. For the cokernel, use split degeneracy and the absence of a degenerate subrepresentation in the relevant kernel. 4. Use enriched tensor-Hom and colimit presentations to identify the image and product comparison.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Claim 3.49, pp. 33–34; Theorem 3.42 and Remark 3.43, p. 31.

**Acceptance.** The maps ε and Δ satisfy both counit equations, and Δ is an isomorphism. E is projective and each block piece compact; underlineEnd(E)=Zsph. The functor N↦N⊗Zsph E is fully faithful with image Modsph(G) and preserves tensor products and symmetry. Its domain unit Zsph maps to E, so the comparison is not a unit-preserving functor to the ambient category with unit Iunit.

<a id="EX-4-two-generators"></a>
### Whittaker and spherical generation

**Target EX.4/two-generators (theorem).** The functor Modfirm(Z)×Modfirm(Zsph)→Mod(G), (M,N)↦M⊗Z Iunit⊕N⊗Zsph E, is faithful and weak symmetric monoidal for the pair-category tensor used in EX.5. Its image generates Mod(G) under Z-linear colimits. This assertion is joint generation; it does not place every generic irreducible in the degeneracy-free subcategory.

**Dependencies:** [EX.3/degeneracy-equivalence](#EX-3-degeneracy-equivalence), [EX.4/spherical-equivalence](#EX-4-spherical-equivalence), `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Construction or proof.** 1. Combine the two fully faithful component functors and the product comparisons to construct the faithful pair functor. 2. Use blockwise smooth projective presentations and the local GL₂ classification to prove Z-linear colimit generation; include mixed maps between Iunit and E.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Corollary 3.51, p. 34; proof of Theorem 3.52, p. 37.

**Acceptance.** The pair functor is faithful, but is not claimed to be full. Steinberg is not incorrectly declared degeneracy-free.

**Check EX.4.** Check ν=0 and a nonzero conductor. Construct both counit composites and prove comultiplication invertible. Test a ramified determinant character and verify the roughening adjunction for full Hom.


<a id="ex-5"></a>
## EX.5. Associativity, trace and local convolution

Descend the associator from the faithful pair functor by proving naturality for mixed maps. Then construct generic quotient algebras and convolution on the spherical Hom spaces. The higher-categorical trace is a separate target with infrastructure gap G2.

**Context:** L.

<a id="EX-5-idempotent-coherence"></a>
### Idempotent coherence theorem

**Target EX.5/idempotent-coherence (theorem).** In a category with a tensor bifunctor and a pentagon associator α, let θ:P⊗P≅P. Define a:P≅P by a∘θ∘(θ⊗id)=θ∘(id⊗θ)∘α. If θ∘(a⊗id)=a∘θ=θ∘(id⊗a), then a=id. The dual form applies to an invertible comultiplication after its compatibility equations have been proved from the two counit laws.

**Hypotheses:** A tensor bifunctor with an associator satisfying pentagon; θ is an isomorphism; both equations (3.2) of the source hold.

**Dependencies:** `mathlib:CategoryTheory.SymmetricCategory`.

**Construction or proof.** 1. Use naturality and the two intertwining equations to identify all five pentagon vertices with P. 2. The short and long routes become a² and a³; cancellation is valid because a is an automorphism. 3. For the counital coalgebra application, derive the intertwining equations from the counit and naturality, rather than asserting every invertible binary map is associative.

**Source:** [GH11](https://arxiv.org/abs/1108.0351v1), Theorem 3.1.2, pp. 10–11; Appendix A, p. 15.

**Acceptance.** The compatibility hypotheses (3.2) are present. An arbitrary endomorphism with a²=a³ need not be identity; invertibility is essential.

<a id="EX-5-associator"></a>
### Exotic symmetric monoidal structure

**Target EX.5/associator (theorem).** There exists exactly one associator on ⊛ making the given symmetry and unit into a symmetric monoidal structure and making Modfirm(Z)→Mod(G) weak symmetric monoidal with its specified comparisons. It restricts to the ordinary tensor associators on the Iunit- and E-generated parts under their respective comparisons.

**Dependencies:** [EX.4/two-generators](#EX-4-two-generators), [EX.5/idempotent-coherence](#EX-5-idempotent-coherence), [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker), [EX.4/spherical-equivalence](#EX-4-spherical-equivalence), [EX.2/weak-symmetric](#EX-2-weak-symmetric).

**Construction or proof.** 1. Use the category of pairs (M,N) of firm Z and Zsph modules with product (M⊗M′, M⊗N′⊕N⊗M′⊕N⊗N′) and unit (Z,0). 2. The functor (M,N)↦M⊗Iunit⊕N⊗E is faithful and weak symmetric monoidal. It is not full. 3. Construct the associator on finite sums of generators, checking naturality for mixed maps Iunit↔E as well as centre endomorphisms. Extend by colimits using presentations/Kan extension. 4. Apply the idempotent coherence calculation to the E terms, then establish pentagon, triangle and both hexagons on generators and extend.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Theorem 3.52, p. 35; Claim 3.58 and proof, pp. 36–38.

**Acceptance.** There exists exactly one associator on ⊛ making the given symmetry and unit into a symmetric monoidal structure and making Modfirm(Z)→Mod(G) weak symmetric monoidal with its specified comparisons. It restricts to the ordinary tensor associators on the Iunit- and E-generated parts under their respective comparisons.

<a id="EX-5-frobenius-category"></a>
### Frobenius category trace

**Target EX.5/frobenius-category (theorem).** In the symmetric monoidal 2-category of presentable ℂ-linear categories with colimit-preserving functors and its relative tensor product, (Mod(G),⊛,Iunit) is a commutative algebra whose trace is Φ⁻. The pairing (M,N)↦Φ⁻(M⊛N)≅IRL(M)⊗G N is a categorical self-duality.

**Dependencies:** [EX.5/associator](#EX-5-associator), [EX.2/trace-symmetry](#EX-2-trace-symmetry).

**Construction or proof.** 1. Use the universal property for separately cocontinuous ℂ-bilinear functors. 2. Exhibit evaluation by smooth balanced tensor and a coevaluation from the regular bimodule; check the two triangle identities. 3. The 2-categorical carriers and this extension of Eilenberg–Watts are recorded as gap G2; ordinary SymmetricCategory does not provide them.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Remark 3.54, p. 35.

**Acceptance.** In the symmetric monoidal 2-category of presentable ℂ-linear categories with colimit-preserving functors and its relative tensor product, (Mod(G),⊛,Iunit) is a commutative algebra whose trace is Φ⁻. The pairing (M,N)↦Φ⁻(M⊛N)≅IRL(M)⊗G N is a categorical self-duality.

<a id="EX-5-generic-algebra"></a>
### Generic idempotent algebras

**Target EX.5/generic-algebra (construction).** For generic irreducible V, choose a nonzero generator of its one-dimensional Whittaker multiplicity space and the resulting epimorphism Iunit→V. There is a unique commutative unital ⊛-algebra on V with this unit, and its multiplication V⊛V→V is invertible. Without choosing a generator there is instead a canonical isomorphism V⊛V≅V⊗ℂ HomG(Iunit,V).

**Dependencies:** [EX.5/associator](#EX-5-associator), [EX.2/trace-symmetry](#EX-2-trace-symmetry), `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `mathlib:CategoryTheory.CommMon`, [EX.1/kirillov-extension](#EX-1-kirillov-extension).

**Construction or proof.** 1. Use right exactness and the unit quotient to descend the algebra structure. 2. Apply the Kirillov spectral identity from EX.1/kirillov-extension to identify V⊛V with the single copy of V selected by the unit quotient. If that quotient is scaled by c, multiplication scales by c⁻¹, so the tensor of the multiplication with its generator gives the canonical multiplicity-line-valued comparison.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Example 3.55, p. 35; Remark 2.6, p. 10.

**Uses.** [EX.11/irreducible-equivalence](#EX-11-irreducible-equivalence): The local W-module lemma uses the actual quotient algebra, including the Steinberg case.

| Declaration | Specification |
|---|---|
| `genericQuotientAlgebra` | The unital algebra associated with a specified nonzero Iunit→V. |
| `genericQuotientAlgebra_unique` | Every unital multiplication with that unit is this multiplication. |
| `genericQuotientAlgebra_idempotent` | Its multiplication V⊛V→V is invertible. |
| `genericQuotientAlgebra_rescale` | Scaling the unit by c rescales multiplication by c⁻¹; the line-valued canonical statement is unchanged. |

**Unit tests.**

- `generic-algebra.1`: For a generic supercuspidal V the product is idempotent.
- `generic-algebra.2`: For Steinberg the conclusion holds although Steinberg is not degeneracy-free.
- `generic-algebra.3`: For a determinant character there is no nonzero map Iunit→V, so this construction cannot be applied.

<a id="EX-5-local-spherical-convolution"></a>
### Spherical algebra of invariants

**Target EX.5/local-spherical-convolution (construction).** After EX.5/associator, (E,Δ,ε) is a cocommutative counital coalgebra. For any commutative ⊛-algebra A, the finite-support Hom underlineHom(E,A), identified with the firm part of A^SL₂(O) and with compact coinvariants by averaging, is an ordinary quasi-unital commutative Zsph-algebra: f⋆g=mA∘(f⊛g)∘Δ. Enhanced Φ⁻A is a firm Z-algebra and composition with ε relates the two.

**Dependencies:** [EX.5/associator](#EX-5-associator), [EX.4/spherical-maps](#EX-4-spherical-maps), [EX.4/spherical-equivalence](#EX-4-spherical-equivalence), [EX.5/idempotent-coherence](#EX-5-idempotent-coherence), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Construction or proof.** 1. Apply the idempotent theorem to Δ after verifying its compatibility hypotheses. 2. Define convolution of Hom maps, and derive associativity, commutativity and local units from the coalgebra/algebra laws and blockwise identity. 3. Use normalized compact averaging over SL₂(O) for the invariants–coinvariants comparison.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Remarks 3.56–3.57, pp. 35–36.

**Uses.** [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution): The same Hom convolution applied to the adelic coalgebra and automorphic algebra gives the spin product.

| Declaration | Specification |
|---|---|
| `sphericalHomConvolution` | f⋆g=mA(f⊛g)Δ. |
| `sphericalHomConvolution_eval` | The value of f⋆g on an induced generator is computed by Δ. |
| `sphericalHomConvolution_algebraMap` | A morphism of ⊛-algebras induces a morphism of the ordinary firm algebras. |
| `sphericalHomConvolution_unit` | The algebra is firm over Zsph; it need not have a single global identity. |

**Unit tests.**

- `local-spherical-convolution.1`: For A=Iunit, composition with ε agrees with the canonical map from the Whittaker-side algebra.
- `local-spherical-convolution.2`: Swapping f and g leaves f⋆g unchanged.
- `local-spherical-convolution.3`: An algebra with infinitely many nonzero blocks must not be assigned an element consisting of all block units inside a direct sum.

**Check EX.5.** Prove mixed-map naturality before extending by colimits. Verify pentagon, triangle and hexagons on generators. The idempotent theorem requires both intertwining equations. Check unit rescaling for generic quotient algebras.


<a id="ex-6"></a>
## EX.6. Adelic product and theta multiplication

Use restricted tensor reference vectors to globalize the product. The rational theta sum defines multiplication into the transpose dual, and its Whittaker evaluation gives the global zeta comparison.

**Context:** A.

<a id="EX-6-adelic-product"></a>
### Adelic exotic tensor product

**Target EX.6/adelic-product (construction).** Form YA=⊗′vYv with reference vector yv=1M₂(Ov)·1Ov×. The local products, symmetry, unitors and associators respect the reference data outside finitely many v, giving a colimit-preserving symmetric monoidal product on smooth GL₂(A)-modules and unit IunitA=c-IndU(A)^G θ.

**Dependencies:** [EX.5/associator](#EX-5-associator), `FunctionFieldArithmetic:FA.2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `MetaplecticAutomorphicForms:MP.4`, `FunctionFieldArithmetic:FA.2/projective-adeles`, `FunctionFieldArithmetic:FA.2/projective-ideles`, `FunctionFieldArithmetic:FA.2/differential-additive-character`.

**Construction or proof.** 1. Import topological restricted products, restricted tensor spaces and their transport from FA.2 and the completed RestrictedProducts roadmap. 2. At unramified v compare yv with the local spherical coalgebra; verify the unit reference is [1GL₂(Ov)], not a characteristic function of the noncompact whole group. 3. Descend the restricted tensor of the kernel action and verify coherence maps on elementary tensors.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), §4.2, pp. 40–41; Claim 4.3 and Corollary 4.4, p. 41.

**Uses.** [EX.6/theta-multiplication](#EX-6-theta-multiplication): The rationally invariant theta functional is balanced against this kernel. [EX.7/automorphic-algebra](#EX-7-automorphic-algebra): Its associator and right exactness give the algebra laws by epimorphic-unit cancellation.

| Declaration | Specification |
|---|---|
| `adelicTrialityKernel` | YA is the restricted tensor product with the specified yv. |
| `adelicExoticTensor` | Use balanced tensor against YA for the two outer adelic actions. |
| `adelicExoticTensor_finiteSet` | A finite set of exceptional places gives the product of those kernels and the reference tail. |
| `adelicExoticTensor_coherence` | Local braidings, unitors and associators descend to a symmetric monoidal structure. |

**Unit tests.**

- `adelic-product.1`: Enlarging the finite exceptional set by an unramified place inserts yv and changes no element.
- `adelic-product.2`: The unramified unit vector is the class of 1GL₂(Ov), which has compact support.
- `adelic-product.3`: At a ramified additive character the local reference data may change, but only finitely many such places occur.

<a id="EX-6-automorphic-functions"></a>
### Compact automorphic function space

**Target EX.6/automorphic-functions (definition).** Let S=S(Γ\G) be locally constant functions with compact support on Γ\G, acted on by right translation. Its transpose dual S̃=Dτ(S), where Dτ(V)=D(V)∘τ, D is the ordinary smooth contragredient and τ(g)=g⁻ᵀ, identifies with all smooth functions on Γ\G via the bilinear pairing B(f,f′)=∫Γ\G f(g)f′(g⁻ᵀ)d×g and a fixed quotient Haar measure. The inclusion S→S̃ is injective, not claimed to be surjective. The pairing is balanced on IRL(S)⊗G S and realizes the right-regular function model of Dτ(S).

**Dependencies:** `FunctionFieldArithmetic:FA.6`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Use the discrete rational quotient and quotient measures. 2. Smooth the algebraic dual and identify distributions against a compactly supported function with smooth quotient functions under the transpose convention.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), §4.1, pp. 38–39; §4.3, p. 41; Construction 4.15, p. 45.

**Uses.** [EX.6/theta-multiplication](#EX-6-theta-multiplication): Compact quotient functions are the two inputs; the initial output is their transpose dual. [EX.7/automorphic-ideal](#EX-7-automorphic-ideal): The determinant pushforward is defined on this compact-support carrier.

| Declaration | Specification |
|---|---|
| `compactAutomorphicFunctions` | S consists of compactly supported locally constant quotient functions. |
| `automorphicSmoothDual` | S̃ is the space of smooth, unrestricted-support quotient functions. |
| `automorphicPairing` | B(f,f′)=∫Γ\G f(g)f′(g⁻ᵀ)d×g. |
| `automorphicPairing_inclusion` | Compact functions embed equivariantly into the smooth dual by B. |

**Unit tests.**

- `automorphic-functions.1`: The pairing is bilinear over ℂ; complex conjugation is not inserted.
- `automorphic-functions.2`: The integration domain is Γ\G; integrating over G would count rational translates repeatedly.
- `automorphic-functions.3`: Compact support is imposed on S, while a constant smooth quotient function belongs to S̃ even when its support is not compact.

<a id="EX-6-theta-functional"></a>
### Triality theta functional

**Target EX.6/theta-functional (construction).** For Ψ∈YA define Θ(Ψ)=Σξ∈M₂(F),q∈F× Ψ(ξ,q). This finite sum is invariant under S₃⋉Γ³. Invariance of the middle Weyl action uses self-dual Poisson summation on M₂(A), rationality of q, and the product formula.

**Dependencies:** [EX.6/adelic-product](#EX-6-adelic-product), `FunctionFieldArithmetic:FA.2`, `MetaplecticAutomorphicForms:MP.5`, `FunctionFieldArithmetic:FA.2/adelic-poisson`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. Discreteness and compact support make the rational sum finite. 2. Outer Γ actions reindex rational matrices and q; transposition reindexes matrices. 3. Apply the imported function-field Weil/theta contract for the remaining rational symplectic transformations; verify the Weyl integral is over the adeles, not the rational field.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definition 4.5, Remarks 4.6–4.8 and Proposition 4.9, pp. 42–43.

**Uses.** [EX.6/theta-multiplication](#EX-6-theta-multiplication): Rational invariance allows the sum to descend to the balanced quotient. [EX.7/petersson-unit](#EX-7-petersson-unit): Its unipotent Fourier calculation identifies the unit pairing.

| Declaration | Specification |
|---|---|
| `trialityTheta` | The rational matrix/determinant-coordinate sum on YA. |
| `trialityTheta_finite` | Only finitely many summands are nonzero on each Ψ. |
| `trialityTheta_rational` | Θ is invariant under each rational G action. |
| `trialityTheta_perm` | Θ is invariant under all three-factor permutations. |

**Unit tests.**

- `theta-functional.1`: An elementary tensor integral at all but finitely many v reduces to a finite rational sum.
- `theta-functional.2`: Changing Ψ by transpose does not change Θ.
- `theta-functional.3`: The middle Weyl identity uses ∫M₂(A), while an integral over M₂(F) cannot be substituted.

<a id="EX-6-theta-multiplication"></a>
### Theta multiplication

**Target EX.6/theta-multiplication (construction).** The rational invariance of Θ induces m:S⊛S→S̃, characterized by evaluation at the identity quotient using Θ and equivariance; at g its value is the corresponding middle translate Θ(g·Ψ). The output is initially the smooth dual, without a compact-support claim.

**Dependencies:** [EX.6/theta-functional](#EX-6-theta-functional), [EX.6/automorphic-functions](#EX-6-automorphic-functions), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Use the compact induction realization of S and balance against the two outer G actions. 2. Use middle equivariance to recover a smooth quotient function from its value at identity. 3. Record the symmetry in all three inputs of the resulting trilinear pairing.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction 4.10 and Remark 4.11, pp. 43–44.

**Uses.** [EX.7/automorphic-algebra](#EX-7-automorphic-algebra): Restriction to the determinant kernel has compact image and a surjective unit. [EX.6/global-zeta](#EX-6-global-zeta): Pairing the product with Whittaker data yields the integral comparison.

| Declaration | Specification |
|---|---|
| `thetaMultiply` | m:S⊛S→S̃ is induced by Θ. |
| `thetaMultiply_eval` | Its value on the identity quotient is Θ on kernel representatives. |
| `thetaMultiply_equivariant` | Middle right translation corresponds to translation of the output function. |
| `thetaMultiply_symmetric` | The paired trilinear form is S₃-invariant. |

**Unit tests.**

- `theta-multiplication.1`: An outer rational translate does not change the class used in m.
- `theta-multiplication.2`: Interchanging the two S factors preserves m.
- `theta-multiplication.3`: The codomain here remains S̃; compactness is established only after passing to the ideal I.

<a id="EX-6-global-zeta"></a>
### Function-field zeta comparison

**Target EX.6/global-zeta (comparison).** For φ,φ′∈S and Ψ(m,y)=Φ(m)f(y)∈YA, put φ′′=m(φ′⊗Ψ⊗φ)∈S̃. Then ZJL(φ′′,s)=ZGJ(φ′,φ,Φ,s)·∫A×f(y)|y|^{s+1/2}d×y. Here ZGJ=∫G(∫Γ\G φ′(h⁻ᵀ)φ(hg)dh)Φ(g)|det g|^{s+1/2}d×g, and ZJL=∫A×Wφ′′(diag(y,1))|y|^{s−1/2}d×y, with Wφ′′(g)=∫U(F)\U(A)φ′′(ug)θ(u)du and quotient volume 1. Interpret equality first on the common absolute-convergence domain and then wherever the supplied continuations are defined; the multiplicative integrals run over A×.

**Dependencies:** [EX.1/local-zeta](#EX-1-local-zeta), [EX.6/theta-multiplication](#EX-6-theta-multiplication), `FunctionFieldArithmetic:FA.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `FunctionFieldArithmetic:FA.6`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. Establish a common absolute-convergence region using compact quotient supports and the supplier estimates. 2. Unfold the rational theta sum and apply local zeta comparison, tracking transpose, Whittaker sign and determinant exponents. 3. A cuspidal specialization may then use the usual quotient unfolding. General estimates are requested explicitly; do not apply a cuspidal convergence theorem to all of S.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), §4.1, pp. 38–39; Remark 4.11, p. 44.

**Acceptance.** All Haar and Whittaker signs match the local convention. The general compact-function convergence contract is part of the supplier request, not inferred from the number-field setting.

**Check EX.6.** Check reference vectors for all coherence maps outside a finite set. Unfold theta over rational matrices with an adelic Fourier integral. Confirm ZJL equals ZGJ times the Mellin factor, including s+1/2 and s−1/2.


<a id="ex-7"></a>
## EX.7. The compact automorphic algebra

The Poincaré map is the proposed unit. Its pairing identity identifies its image with the determinant kernel I, forces compactness of the restricted theta product and proves all algebra/module laws.

**Context:** A.

<a id="EX-7-poincare"></a>
### Poincaré unit map

**Target EX.7/poincare (construction).** Define eA:IunitA→S by eA(W)(g)=Σγ∈U(F)\Γ W(γg). This is a finite sum on compact-mod-U representatives and gives a smooth function compact modulo Γ. Its smooth dual is the Whittaker map S̃→IunitÃ with the specified θ convention.

**Dependencies:** [EX.6/automorphic-functions](#EX-6-automorphic-functions), [EX.6/adelic-product](#EX-6-adelic-product), `FunctionFieldArithmetic:FA.2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. Prove local finiteness from rational discreteness and compact support modulo U. 2. Show compactness of the image support modulo Γ. 3. Change variables to compute the dual and normalize vol(U(F)\U(A))=1.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction 4.13, Claim 4.14 and Construction 4.15, p. 45.

**Uses.** [EX.7/petersson-unit](#EX-7-petersson-unit): Unfolding one Poincaré input produces the Petersson pairing. [EX.7/automorphic-ideal](#EX-7-automorphic-ideal): Its image identifies the determinant kernel as a quotient of the exotic unit.

| Declaration | Specification |
|---|---|
| `poincareUnit` | The displayed sum from c-IndU(A)^Gθ into S. |
| `poincareUnit_equivariant` | eA respects the adelic G action. |
| `poincareUnit_dual` | Its smooth dual is the Whittaker integral. |
| `poincareUnit_support` | Its output has compact quotient support. |

**Unit tests.**

- `poincare.1`: For u∈U(F), θ(u)=1, so the summand is independent of the coset representative.
- `poincare.2`: The sum runs over U(F)\Γ rather than U(A)\G.
- `poincare.3`: Translating W on the right translates its Poincaré sum by the same element.

<a id="EX-7-petersson-unit"></a>
### Petersson unit identity

**Target EX.7/petersson-unit (theorem).** The theta product satisfies m∘(eA⊛idS):IunitA⊛S→S̃ equal to S≅IunitA⊛S followed by the Petersson inclusion S→S̃. Equivalently the theta trilinear pairing with one Poincaré input gives B on the other two inputs.

**Dependencies:** [EX.7/poincare](#EX-7-poincare), [EX.6/theta-multiplication](#EX-6-theta-multiplication), `FunctionFieldArithmetic:FA.2`.

**Construction or proof.** 1. Unfold the Poincaré sum and integrate the rational unipotent variable over A/F. 2. Fourier orthogonality imposes q det ξ=1. 3. Use the quotient pairing and local unit normalization to identify the remaining integral.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Proposition 4.16 and Corollary 4.18, p. 46.

**Acceptance.** The theta product satisfies m∘(eA⊛idS):IunitA⊛S→S̃ equal to S≅IunitA⊛S followed by the Petersson inclusion S→S̃. Equivalently the theta trilinear pairing with one Poincaré input gives B on the other two inputs.

<a id="EX-7-automorphic-ideal"></a>
### Automorphic ideal

**Target EX.7/automorphic-ideal (definition).** Let p:S(Γ\G)→S(F×\A×) be the pushforward along determinant, integrating over the SL₂ quotient fibres with the compatible quotient measures. Define I=ker p. Then im(eA)=I, so IunitA↠I→S→S(F×\A×)→0 is exact at S and I is orthogonal under the quotient pairing to determinant characters. I includes noncuspidal functions.

**Dependencies:** [EX.7/poincare](#EX-7-poincare), [EX.7/petersson-unit](#EX-7-petersson-unit), `FunctionFieldArithmetic:FA.6`, `FunctionFieldArithmetic:FA.2`.

**Construction or proof.** 1. Define the determinant pushforward and prove that it preserves compact quotient support. 2. The Poincaré image has zero determinant pushforward. 3. For the reverse inclusion, dualize: vanishing of all nontrivial unipotent Fourier coefficients forces U(A)-invariance. Together with Γ this forces SL₂(A)-invariance and hence determinant factorization.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Proposition 4.19, p. 46; Remark 4.20, p. 47; proof p. 48.

**Uses.** [EX.7/automorphic-algebra](#EX-7-automorphic-algebra): Its surjective unit forces a unique associative multiplication. [EX.8/abstract-automorphic](#EX-8-abstract-automorphic): Its algebra object defines the category of module objects.

| Declaration | Specification |
|---|---|
| `determinantPushforward` | The quotient-fibre integral p, with its measure normalization. |
| `automorphicIdeal` | I is the kernel subrepresentation of p. |
| `automorphicIdeal_poincare` | im(eA)=I. |
| `automorphicIdeal_orthogonal` | I is the compact subspace orthogonal to all determinant characters. |

**Unit tests.**

- `automorphic-ideal.1`: Every Poincaré sum from IunitA has p=0.
- `automorphic-ideal.2`: A nonzero nonnegative locally constant function supported in a compact open subset of Γ\G has a nonzero determinant pushforward: it is not in I. A determinant pullback need not have compact quotient support and is not used as a test element of S.
- `automorphic-ideal.3`: In the Eisenstein summand IEis, choose a nonzero compact function with nonzero constant term; its determinant pushforward is nevertheless zero. Thus I is larger than the cuspidal constant-term kernel.

<a id="EX-7-automorphic-algebra"></a>
### Automorphic commutative algebra

**Target EX.7/automorphic-algebra (construction).** The theta product restricts to mI:I⊛I→I, with unit the epimorphism IunitA↠I. It is a commutative unital associative algebra in the exotic category. The restricted Petersson pairing obeys B(x,mI(y,z))=B(mI(x,y),z); this invariance does not assert I≅Ĩ.

**Dependencies:** [EX.7/automorphic-ideal](#EX-7-automorphic-ideal), [EX.7/petersson-unit](#EX-7-petersson-unit), [EX.6/theta-multiplication](#EX-6-theta-multiplication), `mathlib:CategoryTheory.CommMon`.

**Construction or proof.** 1. Use the surjective unit and the Petersson identity to prove the output lies in I⊂S, not merely S̃. 2. Precompose associativity with the epi IunitA⊛I⊛I→I⊛I⊛I, using right exactness. Reduce to unit equations. 3. Use theta symmetry for commutativity and pairing invariance.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Corollaries 4.21–4.22 and Remarks 4.23–4.24, p. 47.

**Uses.** [EX.8/abstract-automorphic](#EX-8-abstract-automorphic): Supplies the monoid object for the existing Mathlib module-object construction. [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution): Provides multiplication for convolution with the spin coalgebra.

| Declaration | Specification |
|---|---|
| `automorphicAlgebra` | The commutative algebra with carrier I and unit eA. |
| `automorphicAlgebra_unit_epi` | Its unit map is an epimorphism. |
| `automorphicAlgebra_theta` | mI followed by I→S̃ agrees with the theta product. |
| `automorphicAlgebra_pairing` | B is invariant under multiplication. |

**Unit tests.**

- `automorphic-algebra.1`: Multiplying by eA after the unitor gives the identity on I.
- `automorphic-algebra.2`: The two iterated triple products agree after precomposition by the epimorphic unit.
- `automorphic-algebra.3`: The target must not claim that the smooth dual inclusion I→Ĩ is an isomorphism.

<a id="EX-7-automorphic-ambient-module"></a>
### Automorphic ambient module

**Target EX.7/automorphic-ambient-module (construction).** S carries a canonical I-module structure induced by theta multiplication. The map IunitA→I determines every I-module action uniquely, and the theta trilinear pairing is balanced for this action; the smooth dual of S inherits the dual action.

**Dependencies:** [EX.7/automorphic-algebra](#EX-7-automorphic-algebra), [EX.6/automorphic-functions](#EX-6-automorphic-functions), `mathlib:CategoryTheory.Mod`.

**Construction or proof.** 1. Use the Petersson unit identity and epi of the unit to descend I⊛S→S. 2. Prove the action laws by epi cancellation. Transfer to the smooth dual using the balanced pairing, not an identification of compact and all smooth functions.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Corollaries 4.25–4.26 and Remark 4.27, pp. 47–48.

**Uses.** [EX.8/fully-faithful](#EX-8-fully-faithful): Actions on compact functions and their transpose dual give the classical automorphic subquotients. [EX.8/matrix-automorphic](#EX-8-matrix-automorphic): Tensoring the compact-function action with another representation produces the matrix example.

| Declaration | Specification |
|---|---|
| `automorphicFunctionsModule` | The I action on S is the descended theta product. |
| `automorphicFunctionsModule_unit` | Its action restricted along eA is the left unitor. |
| `automorphicFunctionsModule_dual` | The smooth dual S̃ has the contragredient I action. |
| `automorphicFunctionsModule_balanced` | The theta trilinear form is balanced over I. |

**Unit tests.**

- `automorphic-ambient-module.1`: The inclusion I→S is I-linear.
- `automorphic-ambient-module.2`: The Petersson embedding S→S̃ is compatible with the I actions.
- `automorphic-ambient-module.3`: Any two actions on S restricting to the same unit action coincide by epimorphicity.

**Check EX.7.** Prove the determinant-kernel equality using all nontrivial unipotent Fourier coefficients. Cancel the epimorphic unit to prove associativity and module uniqueness. Check that noncuspidal objects remain in I.


<a id="ex-8"></a>
## EX.8. Abstract automorphic modules

Define abstract automorphicity through the actual module-object category and its unique action criterion. Full faithfulness and subquotient closure embed the classical irreducibles; the converse is the EX.11 milestone.

**Context:** A.

<a id="EX-8-abstract-automorphic"></a>
### Abstractly automorphic representations

**Target EX.8/abstract-automorphic (definition).** Define Modaut(G)=ModI(Mod(G)) using the exotic commutative algebra I. Its realization functor forgets the I action. A smooth G-module V lies in its image exactly when the inverse unitor IunitA⊛V→V factors through eA⊛id:IunitA⊛V↠I⊛V; the descended action is then unique.

**Dependencies:** [EX.7/automorphic-algebra](#EX-7-automorphic-algebra), `mathlib:CategoryTheory.Mod`.

**Construction or proof.** 1. Use Mathlib module objects once the ambient smooth exotic monoidal category has been built. 2. The factorization is unique by the epi unit. Check the action axioms by precomposing with that epi in each input.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Claim 4.28 and Definition 4.29, pp. 48–49; Remark 4.30, p. 49.

**Uses.** [EX.8/fully-faithful](#EX-8-fully-faithful): The factorization criterion tests maps, subquotients and duals. [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction): Normalized induction must land in this specific full subcategory.

| Declaration | Specification |
|---|---|
| `abstractAutomorphicCategory` | Module objects over I in the exotic category. |
| `abstractAutomorphic_forget` | Forget the action to obtain a smooth G-module. |
| `abstractAutomorphic_criterion` | The displayed factorization through eA⊛id is necessary and sufficient. |
| `abstractAutomorphic_action_unique` | Any such factorization is the unique module action. |

**Unit tests.**

- `abstract-automorphic.1`: I with its regular action is abstractly automorphic.
- `abstract-automorphic.2`: S and S̃ satisfy the factorization criterion by EX.7/automorphic-ambient-module.
- `abstract-automorphic.3`: The criterion is about eA⊛V, not about V having a Whittaker model; determinant constituents are allowed.

<a id="EX-8-fully-faithful"></a>
### Fully faithful automorphic realization

**Target EX.8/fully-faithful (theorem).** The realization Modaut(G)→Mod(G) is fully faithful; its essential image is closed under subobjects, quotients, arbitrary limits and colimits, and the smooth transpose dual Dτ. It contains every irreducible classically automorphic representation, meaning a smooth irreducible subquotient of S̃. Extension closure is not asserted.

**Dependencies:** [EX.8/abstract-automorphic](#EX-8-abstract-automorphic), [EX.7/automorphic-ambient-module](#EX-7-automorphic-ambient-module), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Any G-linear map between modules commutes with the actions after precomposing with the epi unit, hence is I-linear. 2. Use right exactness of ⊛ for subquotients and the factorization criterion; use the smooth-dual pairing to transfer the action. 3. For limits, apply uniqueness of compatible action maps and their universal properties; colimits follow from cocontinuity. 4. Apply closure under subquotients to S̃.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Claim 4.28, p. 48; Proposition 4.32 and Remarks 4.33–4.34, p. 49.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Theorem A.1.1 and Warning A.1.2, pp. 4–5.

**Acceptance.** The realization Modaut(G)→Mod(G) is fully faithful; its essential image is closed under subobjects, quotients, arbitrary limits and colimits, and smooth contragredients. It contains every irreducible classically automorphic representation, meaning a smooth irreducible subquotient of S̃. Extension closure is not asserted.

<a id="EX-8-matrix-automorphic"></a>
### Automorphic matrix Schwartz module

**Target EX.8/matrix-automorphic (application).** The smooth module S(M₂(A))Γ, coinvariants under the specified outer rational action, is abstractly automorphic. More precisely its kernel realization is S⊛S(T\G), where T={diag(a,1):a∈A×}; the balanced S action factors through I.

**Dependencies:** [EX.8/fully-faithful](#EX-8-fully-faithful), [EX.6/adelic-product](#EX-6-adelic-product), [EX.7/automorphic-ambient-module](#EX-7-automorphic-ambient-module), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Identify the determinant-coordinate quotient in YA with functions on M₂(A). 2. Use the induced realization of S(T\G) to obtain the displayed exotic product. 3. Transport the I action on S through this product and use the module laws.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Example 4.35, p. 49.

**Acceptance.** The smooth module S(M₂(A))Γ, coinvariants under the specified outer rational action, is abstractly automorphic. More precisely its kernel realization is S⊛S(T\G), where T={diag(a,1):a∈A×}; the balanced S action factors through I.

**Check EX.8.** Verify the factorization criterion for I, S, S̃ and the matrix Schwartz example. Establish closure under the stated limits, colimits and transpose duality. Do not infer extension closure.


<a id="ex-9"></a>
## EX.9. Spin structures and spherical convolution

A chosen spin structure supplies the self-dual adelic lattice. Its coalgebra transports spherical convolution to I. The actual global counit and the claimed invariances require the computations G3 and G4.

**Context:** A.

<a id="EX-9-spin-data"></a>
### Unramified spin structure

**Target EX.9/spin-data (definition).** On the smooth proper curve C of F, an unramified spin structure is a line bundle L with an isomorphism η:L⊗L≅ΩC. For a nonzero rational section s, set ω=η(s⊗s), use its residue character eω on A/F, and define the O_A-lattice Λω by self-duality under eω. Every local order of ω is even; this gives a unique such fractional O_A-lattice. The general line-bundle, tensor and canonical-sheaf carriers are imported, not defined here.

**Dependencies:** `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.1`, `FunctionFieldArithmetic:FA.2/differential-additive-character`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. Import the actual line bundles and tensor API of current AlgebraicVectorBundles, via the FA.1 supplier interface. 2. In a local trivialization write ω=u t² times a local differential generator; compute the local annihilator of a fractional O lattice. 3. Even order makes the equation Λ=Λ⊥ have a unique integral-exponent solution.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definition A.1 and Remarks A.2–A.3, p. 50.

**Uses.** [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra): Its self-dual lattice defines the adelic rough distribution. [EX.9/spin-independence](#EX-9-spin-independence): The rational-section change formula fixes the transport to be checked.

| Declaration | Specification |
|---|---|
| `unramifiedSpin` | A line bundle L and specified η:L⊗L≅ΩC. |
| `spinResidueCharacter` | The residue character of ω=η(s²), trivial on F. |
| `spinSelfDualLattice` | Λω is the unique O_A-fractional lattice equal to its annihilator. |
| `spinChangeSection` | Replacing s by a·s replaces ω by a²ω and Λω by a⁻¹Λω for a∈F×. |

**Unit tests.**

- `spin-data.1`: If s is replaced by a·s, all differential orders change by 2ordv(a).
- `spin-data.2`: At a place with an odd differential order there is no self-dual fractional O_v ideal, so the spin condition cannot be omitted.
- `spin-data.3`: For ω locally with conductor exponent zero, the self-dual fractional ideal is O_v.

<a id="EX-9-global-spherical-coalgebra"></a>
### Global spherical coalgebra

**Target EX.9/global-spherical-coalgebra (construction).** For fixed spin data and rational s, let EA=c-IndSL₂(O_A)^G1. The distribution 1M₂(Λω)(m)δ1(y) defines ΔA:EA→EA⊛EA. Construct εA:EA→IunitA as the restricted tensor of transported local counits, with local h_v satisfying h_vK_vh_v⁻¹∩U_v=u(π_v⁻ν_vO_v) and the lattice transport required by Λω. Prove both counit identities, ΔA invertible, symmetry and coassociativity.

**Dependencies:** [EX.9/spin-data](#EX-9-spin-data), [EX.6/adelic-product](#EX-6-adelic-product), [EX.4/spherical-maps](#EX-4-spherical-maps), [EX.5/idempotent-coherence](#EX-5-idempotent-coherence), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. Choose the local lattice-adapted h_v and compute how their middle actions transport the local rough distributions, including all scalar factors. 2. Check that ε_v and Δ_v preserve the chosen reference vectors almost everywhere, so their restricted tensors exist. 3. Check both adelic counit equations on elementary tensors and ΔA invertibility before applying idempotent coherence. 4. These normalization checks are the explicit source gap G3; the source does not supply a global counit formula.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Definition A.4, Construction A.5 and Claim A.6, p. 51; Remark 3.47, pp. 32–33.

**Uses.** [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution): Both coalgebra axioms and reference compatibility are needed for the convolution laws.

| Declaration | Specification |
|---|---|
| `adelicSphericalGenerator` | EA is compact induction from SL₂(O_A). |
| `adelicSphericalComult` | The map from 1M₂(Λω)δ1 interpreted in the rough kernel. |
| `adelicSphericalCounit` | The restricted tensor of the lattice-adapted local ε_v. |
| `adelicSphericalCoalgebra` | Counit, cocommutativity and coassociativity, with invertible ΔA. |

**Unit tests.**

- `global-spherical-coalgebra.1`: At an unramified place with Λv=O_v the local distribution is 1M₂(O_v)δ1.
- `global-spherical-coalgebra.2`: Both unit composites must be identity; checking only Φ⁻ of one composite is insufficient.
- `global-spherical-coalgebra.3`: A family of local maps that changes the distinguished vector at infinitely many places must be rejected as a restricted tensor map.

<a id="EX-9-global-spherical-convolution"></a>
### Spin spherical convolution

**Target EX.9/global-spherical-convolution (construction).** Put H=SL₂(O_A) and C=I_H≅I^H, using compact averaging over ℂ. Identify C with the smooth part underlineHomG(EA,I): inside full Hom, take the union of the images of precomposition by the normalized averaging idempotents eJ, for compact open J containing H. For the corresponding maps f,g define f⋆g=mI(f⊛g)ΔA. This preserves C and makes it a commutative quasi-unital algebra for ordinary tensor: multiplication induces C⊗C C≅C. The scalar centre is explicitly ZG=End(IdMod(G)); z acts by zI∘f. No identification with a spectral function space is required.

**Dependencies:** [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra), [EX.7/automorphic-algebra](#EX-7-automorphic-algebra), [EX.5/local-spherical-convolution](#EX-5-local-spherical-convolution), `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Construction or proof.** 1. Use the compact-induction/roughening adjunction and the eJ images to identify the smooth Hom carrier with I^H; compact averaging identifies invariants with coinvariants. 2. Apply the coalgebra and algebra laws to convolution, verifying that the output remains in the smooth Hom carrier. 3. Use finite-level local centre units and restricted tensor reference compatibility to prove quasi-unitality. Central balance of the kernel gives (z f)⋆g=z(f⋆g)=f⋆(z g), for z∈ZG.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction A.7, p. 51; §1.3, p. 6.

**Uses.** [EX.9/spin-independence](#EX-9-spin-independence): The product must be compared under section change and determinant-weighted inverse transpose.

| Declaration | Specification |
|---|---|
| `spinSphericalConvolution` | The convolution on C=I_H≅I^H, identified with the smooth averaging-idempotent part of HomG(EA,I). |
| `spinSphericalConvolution_hom` | It agrees with composition using ΔA and mI. |
| `spinSphericalConvolution_firm` | Multiplication induces C⊗C C≅C. The full centre ZG=End(IdMod(G)) acts by postcomposition and the product is ZG-balanced. |
| `spinSphericalConvolution_comm` | f⋆g=g⋆f for f,g∈C. |

**Unit tests.**

- `global-spherical-convolution.1`: The product of two elements of I with SL₂(O_A)-symmetry stays in I.
- `global-spherical-convolution.2`: Finite local Bernstein components orthogonal under a central idempotent multiply to zero; full Hom elements outside the union of the eJ images must not be admitted as smooth spherical functions.
- `global-spherical-convolution.3`: The product is not specified to be the pointwise product of quotient functions; it is the coalgebra-defined convolution.

<a id="EX-9-spin-independence"></a>
### Spin convolution invariance

**Target EX.9/spin-independence (theorem).** For a fixed spin structure, changing the nonzero rational section s leaves the spherical convolution unchanged after the canonical transport of additive-character data. The map ι(f)(g)=|det g|⁻² f(g⁻ᵀ) is an involutive algebra automorphism of this convolution.

**Dependencies:** [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution), `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.2/differential-additive-character`, `FunctionFieldArithmetic:FA.2/differential-self-dual-haar`.

**Construction or proof.** 1. For s↦a·s use ω↦a²ω, Λ↦a⁻¹Λ and rational middle/outer action to compare the two distributions; the product formula cancels the global modulus. 2. Compute the transpose-inverse action on the theta multiplication and coalgebra with the factor |det|⁻². 3. The paper asserts these computations without details; explicit verification is gap G4, and no spectral heuristic substitutes for it.

**Source:** [Dor23](https://doi.org/10.1017/fmp.2023.18), Construction A.7 and Remark A.8, p. 51.

**Acceptance.** For a fixed spin structure, changing the nonzero rational section s leaves the spherical convolution unchanged after the canonical transport of additive-character data. The map ι(f)(g)=|det g|⁻² f(g⁻ᵀ) is an involutive algebra automorphism of this convolution.

**Check EX.9.** For s↦a·s check ω↦a²ω and Λ↦a⁻¹Λ. Prove both global counit laws with the scalar factors and almost-everywhere reference compatibility. Verify the weighted inverse-transpose product identity on the same carrier.


<a id="ex-10"></a>
## EX.10. Normalized parabolic induction

Dor normalized induction uses an invertible torus module and a distinguished injection into it. Rank-one orbit geometry determines its nonunital multiplication; localizing at the injection gives a unit and the normalization-aware intertwiner.

**Context:** L.

<a id="EX-10-normalization-line"></a>
### Parabolic normalization module

**Target EX.10/normalization-line (definition).** For local F as in EX.0, T=F××F×, let Lnorm=S(F × F×), with first coordinate additive and including 0. Set ((a,d)·f)(λ,y)=|a/d| f(d⁻¹λ,ady). The torus tensor unit is 1T=S(T). There is a canonical injection η:1T→Lnorm defined for λ≠0 by (ηf)(λ,y)=|λ²y|⁻¹ f(λy,λ⁻¹), extended by zero at λ=0. The normalized Weyl twist is V(w)(a,d)=|a/d|·V(d,a).

**Dependencies:** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Construction or proof.** 1. Use pullback and extension by zero to define the displayed smooth T action and η; compact support in T makes the extension vanish near λ=0. 2. Prove η equivariant and injective. Import invertibility of Lnorm as a firm convolution module from AL.1; no trivialization is declared canonical.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Definitions B.2.8 and B.3.1, pp. 18, 20; Proposition B.5.4 and proof, pp. 25–28.

**Source:** [Dor20Z](https://arxiv.org/abs/2012.03068v1), Appendix A, Claim A.3 and proof, p. 26.

**Uses.** [EX.10/normalized-induction](#EX-10-normalized-induction): Its internal Hom supplies the nonstandard normalization of induction. [EX.10/intertwining](#EX-10-intertwining): Its Weyl twist and the two η factors measure the square of the intertwiner.

| Declaration | Specification |
|---|---|
| `parabolicNormalization` | S(F × F×) with the stated weighted action. |
| `parabolicNormalization_eta` | The canonical injection η with its exact coordinate formula. |
| `parabolicWeylTwist` | The twist (a,d)↦\|a/d\|ρ(d,a) is involutive. |
| `parabolicNormalization_invertible` | Lnorm is an invertible firm T-module, isomorphic to 1T after a noncanonical choice. |

**Unit tests.**

- `normalization-line.1`: At λ=0 the η image is zero, while Lnorm permits nonzero values there.
- `normalization-line.2`: The Weyl twist squared is identity because |a/d|·|d/a|=1.
- `normalization-line.3`: Replacing η by unweighted extension from (λ,y) misses the |λ²y|⁻¹ normalization and fails T-equivariance.

<a id="EX-10-normalized-induction"></a>
### Normalized induction and restriction

**Target EX.10/normalized-induction (construction).** Let i be unnormalized smooth parabolic induction from the upper Borel, r its left adjoint of U-coinvariants. Define î(V)=i(underlineHomT(Lnorm,V)) and r̂(W)=Lnorm⊗T r(W), so r̂⊣î. The output category uses ⊛ and the input firm torus category uses ⊗T. This normalization is different from multiplying induction by δB^{1/2}.

**Dependencies:** [EX.10/normalization-line](#EX-10-normalization-line), `SmoothRepresentationsOfLocalGroups:SR.2`, [EX.5/associator](#EX-5-associator), `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`.

**Construction or proof.** 1. Use the closed tensor-Hom adjunction for firm torus modules, requested from SR.1. 2. Compose that adjunction with r⊣i; prove the displayed formula for r̂. 3. Record the noncanonical comparison î≅i only after choosing a trivialization Lnorm≅1T.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Definition B.4.1 and Remarks B.4.2–B.4.3, p. 23.

**Uses.** [EX.10/rank-one-universal](#EX-10-rank-one-universal): Internal-Hom evaluation converts the rank-one orbit quotient into the induction multiplication. [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction): The normalized local adjunction globalizes and then passes to rational coinvariants.

| Declaration | Specification |
|---|---|
| `dorNormalizedInduction` | î=i∘underlineHomT(Lnorm,−). |
| `dorNormalizedRestriction` | r̂=Lnorm⊗T r(−). |
| `dorNormalizedAdjunction` | HomT(r̂W,V)≅HomG(W,îV). |
| `dorNormalizedChoice` | A chosen trivialization Lnorm≅1T induces î≅i. |

**Unit tests.**

- `normalized-induction.1`: The defining adjunction has r̂ on the left and î on the right.
- `normalized-induction.2`: For a torus character, the comparison with ordinary induction depends on the chosen normalization line trivialization.
- `normalized-induction.3`: No square root of q is an input of this normalization.

<a id="EX-10-rank-one-universal"></a>
### Rank-one induction multiplication

**Target EX.10/rank-one-universal (theorem).** Restriction Ψ↦((λ,y)↦Ψ(diag(0,λ),y)) identifies the quotient of Uᵀ×U×Uᵀ-coinvariants of Y, twisted by ((1,−1),(0,0),(1,−1)) and then balanced to identify the three T actions, with Lnorm. Consequently there is a universal natural map i(A)⊛i(B)→i(Lnorm⊗T A⊗T B), and evaluation of Lnorm against its internal Hom yields î(A)⊛î(B)→î(A⊗T B).

**Dependencies:** [EX.10/normalized-induction](#EX-10-normalized-induction), [EX.0/triality-kernel](#EX-0-triality-kernel), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Take the middle ordinary U-coinvariants, which retain the singular determinant locus. 2. Filter by lower-Borel rank-one orbits; wrong torus weights remove all but the diag(0,λ) stratum. 3. Prove the resulting map invertible and apply induction/Jacquet adjunction, then internal-Hom evaluation.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Construction B.3.4, Claim B.3.5, Proposition B.3.6 and Corollary B.3.7, pp. 21–22; Claim B.4.4, p. 23.

**Acceptance.** Restriction Ψ↦((λ,y)↦Ψ(diag(0,λ),y)) identifies the quotient of Uᵀ×U×Uᵀ-coinvariants of Y, twisted by ((1,−1),(0,0),(1,−1)) and then balanced to identify the three T actions, with Lnorm. Consequently there is a universal natural map i(A)⊛i(B)→i(Lnorm⊗T A⊗T B), and evaluation of Lnorm against its internal Hom yields î(A)⊛î(B)→î(A⊗T B).

<a id="EX-10-lax-induction"></a>
### Lax symmetric induction

**Target EX.10/lax-induction (theorem).** The canonical multiplication on î is associative and symmetric, making î nonunital lax symmetric monoidal. After the tensor-compatible localization inverting η:1T→Lnorm, it has a canonical unit and is lax symmetric monoidal. Before localization no such unit structure exists in general.

**Dependencies:** [EX.10/rank-one-universal](#EX-10-rank-one-universal), [EX.10/normalization-line](#EX-10-normalization-line), [EX.5/associator](#EX-5-associator).

**Construction or proof.** 1. Compute the almost-unit square of Proposition B.5.4 using the partial Fourier transform F(f)(λ,y)=|y|∫f(α,y)e(−αλy)dα. 2. For associativity compare the two triple products under Φ⁻ using the universal three-input orbit quotient. Its target is Lnorm⊗T Lnorm, realized as the convolution image allowing the double-pole boundary. 3. The image of the difference is degenerate and vanishes since î(1T) has no SL₂(F)-fixed vectors. 4. Construct localization by inverting tensor translates of η and verify the unit there. The reducible induction in Example B.5.1 gives the obstruction before localization.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Proposition B.5.4, pp. 25–29; Theorem B.6.1 and Corollary B.6.2, pp. 30–33.

**Acceptance.** The local reducible principal series i(|a/d|) with quotient 1G cannot be assigned a unital algebra in the original category by this lax structure. Localizing kills that obstruction.

<a id="EX-10-intertwining"></a>
### Normalization-aware intertwiner

**Target EX.10/intertwining (construction).** The trace Φ⁻î(A)=underlineHomT(Lnorm,A) and multiplication define M:î(A)→î(Lnorm⊗T A(w)). Its double composite equals the map induced by η⊗η(w), it preserves the trace and the unit image, and is multiplicative with the extra normalization factor. After inverting both η and η(w), M gives an involutive algebra-compatible self-duality.

**Dependencies:** [EX.10/lax-induction](#EX-10-lax-induction), [EX.2/trace-symmetry](#EX-2-trace-symmetry).

**Construction or proof.** 1. Use the induction–restriction dual pairing to transpose the trace of multiplication. 2. Compute M on the regular induced generator as the Fourier transform of the usual unipotent intertwining integral. 3. Prove the universal binary quotient map is invertible (Proposition B.7.10), then verify the trace square on small compact-open indicators. 4. Deduce unit invariance, multiplicativity and the double-composite identity; retain all Lnorm factors before localization.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Construction B.7.7, Theorem B.7.8, Claim B.7.9 and Proposition B.7.10, pp. 35–40.

**Uses.** [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction): After local η-localization it gives the functional equation for the global constant term.

| Declaration | Specification |
|---|---|
| `dorIntertwining` | M:î(A)→î(Lnorm⊗T A(w)). |
| `dorIntertwining_square` | The double composite is η⊗η(w), with the indicated identifications. |
| `dorIntertwining_trace` | M respects the trace square of Theorem B.7.8(2). |
| `dorIntertwining_multiplication` | M commutes with multiplication after inserting the second normalization factor. |
| `dorIntertwining_localized` | With η and η(w) invertible, M is an involution between the corresponding twists. |

**Unit tests.**

- `intertwining.1`: Before localization the double composite is not asserted to be identity.
- `intertwining.2`: The unit image is fixed by M after the specified η(w) insertion.
- `intertwining.3`: At an unramified place, small principal-congruence indicators give the Fourier-normalized intertwining formula with the same Haar measure.

**Check EX.10.** Keep the additive zero in S(F × F×), verify the exact η formula, and prove the universal orbit quotient. Test the reducible principal-series obstruction before localization and the intertwiner square with both normalization factors.


<a id="ex-11"></a>
## EX.11. Automorphic adjunctions and components

Globalize normalized induction without postulating a global η. The automorphic adjunction and constant term yield component algebras; the Weyl lifting theorem is proved before it is used to decompose their category.

**Context:** A.

<a id="EX-11-torus-automorphic"></a>
### Automorphic torus category

**Target EX.11/torus-automorphic (definition).** Let T=T(A) and T(F) its rational subgroup. Modaut(T) is the category of smooth T/T(F)-modules, equivalently modules over IT=S(T(F)\T) with convolution inside smooth T-modules. The realization is inflation and is fully faithful. Its monoidal product is the smooth relative tensor over T/T(F), equivalently the IT-module relative tensor.

**Dependencies:** `FunctionFieldArithmetic:FA.2`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Use the abelian quotient topology and the rational-invariance descent of representations. 2. Construct IT by quotient convolution and prove the action/quotient equivalence through compactly supported functions and local units.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Definition C.3.1 and Remark C.3.2, p. 44.

**Uses.** [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction): Rational coinvariants land in this quotient torus category. [EX.11/weyl-lifting](#EX-11-weyl-lifting): Its compact quotient functions are the target of periodization.

| Declaration | Specification |
|---|---|
| `automorphicTorusCategory` | Smooth representations of T/T(F). |
| `automorphicTorus_realization` | Inflation along T→T/T(F), fully faithful. |
| `automorphicTorus_modules` | The category is Mod(IT) in the smooth relative-tensor category. |
| `automorphicTorus_tensor` | The product agrees with ⊗T/T(F) and the unit with IT. |

**Unit tests.**

- `torus-automorphic.1`: A smooth T-module descends exactly when every rational t∈T(F) acts trivially.
- `torus-automorphic.2`: A character of T trivial on T(F) defines an object.
- `torus-automorphic.3`: The monoidal unit is IT, not S(T) inflated from a nonexistent identification T=T/T(F).

<a id="EX-11-automorphic-adjunction"></a>
### Automorphic induction adjunction

**Target EX.11/automorphic-adjunction (construction).** Globalize Lnorm and î using S(A×A×) where the first A is additive. Invert the local maps ηv by tensor-compatible localization; there is no assumed global η respecting reference vectors. Then î maps Modaut(T) into Modaut(G), and its restriction îaut has left adjoint r̂aut(V)=(r̂V)T(F). The unit-factorization map I→î(IT[ηv⁻¹]) is the constant term. Choosing a trivialization of Lnorm also gives ordinary iaut; the canonical normalization remains îaut.

**Dependencies:** [EX.11/torus-automorphic](#EX-11-torus-automorphic), [EX.10/intertwining](#EX-10-intertwining), [EX.8/fully-faithful](#EX-8-fully-faithful), `FunctionFieldArithmetic:FA.2`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Construction or proof.** 1. Verify that the local multiplication respects distinguished vectors. For units invert each ηv; the unlocalized local units do not form a restricted tensor map. 2. Identify the resulting unit map with the constant-term unfolding and factor it through I using the Poincaré sum. 3. Exactness and colimit preservation, with the inclusion IT→IT[ηv⁻¹], extend automorphicity to every torus object. 4. Compose the reflector to rational coinvariants with the normalized Jacquet adjunction to obtain r̂aut⊣îaut.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Theorems C.2.1 and C.2.3, Warnings C.2.2 and C.2.4, pp. 42–43; Theorem C.3.3, Remark C.3.5 and Claim C.3.7, pp. 45–47.

**Uses.** [EX.11/component-algebras](#EX-11-component-algebras): The constant-term map defines cusp and Eisenstein ideals. [EX.11/restriction-finite](#EX-11-restriction-finite): Its left adjoint is the functor whose finite-length behavior is proved.

| Declaration | Specification |
|---|---|
| `automorphicNormalizedInduction` | Restriction of î to abstractly automorphic torus modules. |
| `automorphicNormalizedRestriction` | V↦(r̂V)T(F), with quotient torus action. |
| `automorphicNormalizedAdjunction` | r̂aut⊣îaut, with the inherited unit and counit. |
| `automorphicConstantTerm` | The factorization I→î(IT[ηv⁻¹]) agrees with the usual constant-term map. |
| `automorphicEisensteinFunctionalEquation` | The constant-term image is invariant under the normalization-aware global intertwiner. |

**Unit tests.**

- `automorphic-adjunction.1`: A local family ηv that changes the reference vector at infinitely many places is not a global map 1T→Lnorm.
- `automorphic-adjunction.2`: On an automorphic torus character, îaut realizes as normalized smooth parabolic induction.
- `automorphic-adjunction.3`: Applying r̂aut to a cuspidal object gives zero; the converse is excluded by the anomalous example below.

<a id="EX-11-weyl-lifting"></a>
### Local Weyl invariant lifting

**Target EX.11/weyl-lifting (theorem).** Periodization S(T(A))→S(T(F)\T(A)) maps the subspace invariant under every separate local normalized Weyl involution onto the subspace invariant under the simultaneous global normalized Weyl involution.

**Dependencies:** [EX.11/torus-automorphic](#EX-11-torus-automorphic), [EX.10/normalization-line](#EX-10-normalization-line), `FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev`, `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.2/projective-ideles`, `FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard`, `FunctionFieldArithmetic:FA.4/global-abelian-existence`.

**Construction or proof.** 1. Choose a compact open unit level K for the target and refine to a ray level stable under swapping the two coordinates. Put C=F×\A×/K. Conjugation by the multiplicative character |a/d|^(1/2) changes normalized Weyl symmetry to ordinary swap and commutes with periodization and convolution. Use Haar-normalized coset functions, so the fixed-level quotient algebra is ℂ[C×C]. 2. Let R be the image of the separately local-swap-invariant compact functions. It is a convolution subalgebra. Write D(u,v)=[u]⊗[v] and S(u,v)=D(u,v)+D(v,u). The diagonals D(z,z), including D(z⁻¹,z⁻¹), lie in R. If u/v is represented by a single prime away from the modulus, S(u,v) lies in R: choose identical local representatives outside that prime and symmetrize the two cosets there. Normalize by the finite rational stabilizer when periodizing. 3. Use finiteness of C⁰ and a degree-splitting idele from FA.4/ray-class-and-generalized-picard. Its finite quotient by the degree generator has a class field by FA.4/global-abelian-existence. Apply degree-sensitive Chebotarev to this finite extension: every ray class of sufficiently large positive degree contains a prime away from the modulus, with the constant-field condition retained. The bound is uniform over the finite degree-zero classes. 4. For arbitrary u,v choose z of sufficiently large degree that z, uz/v and uz²/v all have such prime representatives. The already lifted functions satisfy S(uz,v)S(1,z)=D(z,z)S(u,v)+S(uz²,v). Hence S(u,v)=D(z⁻¹,z⁻¹)(S(uz,v)S(1,z)−S(uz²,v)) lies in R. These generators span all swap invariants, with diagonal generators divided by 2 over ℂ. 5. Undo the character conjugation to restore the |a/d| weight. The argument covers u/v of degree zero or negative without requiring a prime in that original class.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Lemma C.4.9 and Remark C.4.10, pp. 51–52.

**Acceptance.** Periodization S(T(A))→S(T(F)\T(A)) maps the subspace invariant under every separate local normalized Weyl involution onto the subspace invariant under the simultaneous global normalized Weyl involution. Work at a fixed ray level and account for the finite stabilizer in coset periodization. Check the displayed convolution identity on the four basis terms and apply it to ratios of degree zero and negative degree.

<a id="EX-11-component-algebras"></a>
### Cuspidal and Eisenstein components

**Target EX.11/component-algebras (construction).** Let Icusp be the kernel of the constant term on I and IEis its Petersson orthogonal complement inside I. They are complementary ideals, I≅Icusp×IEis. Define Ccusp as cuspidal automorphic irreducibles modulo unramified norm twists and CEis as automorphic torus characters modulo independent norm twists and the normalized global Weyl action. For each c∈CEis, define Ic as the pullback of the c component of î(IT[ηv⁻¹]) along IEis→î(IT[ηv⁻¹]); use the induced cuspidal family algebra for c∈Ccusp.

**Dependencies:** [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction), [EX.7/automorphic-algebra](#EX-7-automorphic-algebra), `FunctionFieldArithmetic:FA.6`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `SmoothRepresentationsOfLocalGroups:SR.3`, [EX.11/weyl-lifting](#EX-11-weyl-lifting), `FunctionFieldArithmetic:FA.6/harder-cuspidal-support`, `FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence`.

**Construction or proof.** 1. Use finite dimensionality of cusp forms with fixed compact level and bounded determinant norm to prove the Petersson decomposition inside compact functions. 2. Construct cuspidal family algebras by induction from G¹={|det|=1}; choose an idele generating the image of the norm, not an assumed degree-one place. 3. Construct the Eisenstein pieces as actual pullbacks and use the local Weyl-invariant centre lifting target EX.11/weyl-lifting to prove they sum to IEis.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Proposition C.4.1, pp. 47–48; Proposition C.4.6 and Remark C.4.5, p. 49; Proposition C.4.8, pp. 50–51.

**Uses.** [EX.11/component-decomposition](#EX-11-component-decomposition): Complementary ideals and the finer component pullbacks yield the product of module categories.

| Declaration | Specification |
|---|---|
| `cuspidalAutomorphicIdeal` | The constant-term kernel inside I. |
| `eisensteinAutomorphicIdeal` | The Petersson orthogonal complement inside I. |
| `automorphicComponentIndex` | Ccusp ⊔ CEis with the specified norm-twist and Weyl identifications. |
| `automorphicComponentAlgebra` | Cuspidal family algebras and the Eisenstein pullback ideals. |
| `automorphicIdeal_split` | I≅Icusp×IEis as exotic commutative algebras. |

**Unit tests.**

- `component-algebras.1`: A cuspidal function belongs to the constant-term kernel.
- `component-algebras.2`: The quotient of iaut(1T) by its trivial irreducible subobject can have raut=0 while belonging to the Eisenstein side.
- `component-algebras.3`: The argument must work for curves without a rational point; a place of degree one cannot be a general input.

<a id="EX-11-component-decomposition"></a>
### Automorphic component decomposition

**Target EX.11/component-decomposition (theorem).** The component ideals yield a canonical symmetric monoidal equivalence Modaut(G)≅∏c∈Ccusp⊔CEis Modautc(G). Cuspidal components are killed by r̂aut, while some nonzero Eisenstein objects are killed as well. The key lifting statement is surjectivity from compact torus functions invariant under each separate local normalized Weyl involution to automorphic torus functions invariant under the simultaneous global Weyl involution.

**Dependencies:** [EX.11/component-algebras](#EX-11-component-algebras), `FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev`, `SmoothRepresentationsOfLocalGroups:SR.3`, [EX.11/weyl-lifting](#EX-11-weyl-lifting).

**Construction or proof.** 1. Apply EX.11/weyl-lifting, including its large-degree convolution repair, to the two-coset symmetric generators. A prime in an arbitrary fixed-degree ray class cannot be assumed. 2. Use the lifting to realize Eisenstein projections by the smooth Bernstein centre, so the image IEis is stable under each projection. 3. Use local finiteness at fixed level and bounded norm on the cuspidal side to obtain the algebra decomposition. Interpret products in the smooth category; do not identify all underlying vector-space products with direct sums. 4. Pass from complementary locally unital ideals to module categories and check the relative monoidal product.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Lemma C.4.9 and Remark C.4.10, pp. 51–52; Theorem C.4.12, p. 52; Warning A.1.19, p. 9.

**Acceptance.** The component ideals yield a canonical symmetric monoidal equivalence Modaut(G)≅∏c∈Ccusp⊔CEis Modautc(G). Cuspidal components are killed by r̂aut, while some nonzero Eisenstein objects are killed as well. The key lifting statement is surjectivity from compact torus functions invariant under each separate local normalized Weyl involution to automorphic torus functions invariant under the simultaneous global Weyl involution.

<a id="EX-11-irreducible-equivalence"></a>
### Irreducible automorphic equivalence

**Target EX.11/irreducible-equivalence (theorem).** Realization induces a bijection between irreducible objects of Modaut(G) and irreducible classically automorphic smooth G-modules, understood as subquotients of S̃. For a local generic irreducible W with a specified unit quotient Iunit↠W, every irreducible W-module is isomorphic to W; this includes Steinberg and is stronger than agreement of central characters.

**Dependencies:** [EX.11/component-decomposition](#EX-11-component-decomposition), [EX.5/generic-algebra](#EX-5-generic-algebra), [EX.8/fully-faithful](#EX-8-fully-faithful), `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `FunctionFieldArithmetic:FA.6`.

**Construction or proof.** 1. For Eisenstein components import automorphicity of all constituents of parabolic inductions from automorphic characters (the function-field Langlands theorem requested from FA.6). 2. For cuspidal components use the local W-module lemma. In the Steinberg block compute products with both nonsplit extensions of 1G and St; identify all St-modules as sums of St. 3. Use the component-centre action to reduce an irreducible to these cases. Agreement of the Bernstein centre alone is insufficient.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Theorem C.5.1 and Lemma C.5.2, pp. 53–54; Remark C.5.3, p. 54.

**Acceptance.** Realization induces a bijection between irreducible objects of Modaut(G) and irreducible classically automorphic smooth G-modules, understood as subquotients of S̃. For a local generic irreducible W with a specified unit quotient Iunit↠W, every irreducible W-module is isomorphic to W; this includes Steinberg and is stronger than agreement of central characters.

<a id="EX-11-restriction-finite"></a>
### Finite-length automorphic restriction

**Target EX.11/restriction-finite (theorem).** The normalized automorphic parabolic restriction r̂aut sends finite-length objects to finite-length objects. On an irreducible Eisenstein object its underlying torus module is a quotient of an extension of an automorphic character χ by χ(w), hence has dimension at most two. It is zero on cuspidal components.

**Dependencies:** [EX.11/component-decomposition](#EX-11-component-decomposition), [EX.11/irreducible-equivalence](#EX-11-irreducible-equivalence), `SmoothRepresentationsOfLocalGroups:SR.2`, [EX.11/weyl-lifting](#EX-11-weyl-lifting).

**Construction or proof.** 1. Use right exactness to reduce to an irreducible object. 2. Describe the local Jacquet modules and their distinguished cyclic vectors; their restricted tensor is covered by the torus module induced from the separately Weyl-invariant Hecke algebra. 3. Use the lifting theorem to pass to the global Weyl-invariant algebra, and its rank-two quotient bound. Apply rational coinvariants to get dimension at most two.

**Source:** [Dor21](https://arxiv.org/abs/2102.11820v1), Theorem C.5.4 and Remark C.5.5, pp. 54–55.

**Acceptance.** The normalized automorphic parabolic restriction r̂aut sends finite-length objects to finite-length objects. On an irreducible Eisenstein object its underlying torus module is a quotient of an extension of an automorphic character χ by χ(w), hence has dimension at most two. It is zero on cuspidal components.

**Check EX.11.** Use the separate-local to simultaneous-global Weyl lifting, including the large-degree convolution identity. Test degree-zero and negative-degree ratios as well as prime classes. Check the anomalous Eisenstein example, the local Steinberg-module lemma, the classical irreducible comparison and the dimension-at-most-two restriction bound.

## Supplier contracts

These are the residual requests beyond the exact nodes already cited. Each contract is an input with the stated field, coefficient and normalization scope; ordinary Satake or a characteristic-zero metaplectic theorem does not silently establish its extension.

### AutomorphicLFunctionsAndLocalFactors:AL.0

Nonarchimedean Schwartz–Bruhat spaces and Fourier inversion on Fⁿ, including equal characteristic odd F, self-dual measures and change of character. Use actual compact-support/local-constancy carriers; a Dirac distribution is in the roughening, not in S(F×).

Consumed by: [EX.0/triality-kernel](#EX-0-triality-kernel), [EX.0/open-kernel](#EX-0-open-kernel), [EX.4/spherical-maps](#EX-4-spherical-maps), [EX.10/normalization-line](#EX-10-normalization-line).

### AutomorphicLFunctionsAndLocalFactors:AL.1

Invertibility/noncanonical freeness of the torus normalization module S(F × F×) with (a,d) action |a/d|f(d⁻¹λ,ady), using Dor20Z, Appendix A, Claim A.3 and proof, p. 26: S(F) is free of rank one over S(F×), with a generator carrying 1O× to 1O. Pull this result back along the torus coordinates (a,d)↦(d,(ad)⁻¹), tensor the regular second factor and apply the displayed character twist; compare Dor21 Remark B.4.3, p. 23. Add the needed algebraic module-of-zeta-integrals extension in the AL direction, not merely scalar rationality of zeta functions.

Consumed by: [EX.10/normalization-line](#EX-10-normalization-line).

### AutomorphicLFunctionsAndLocalFactors:AL.3

Local GL₂×GL₁ Jacquet–Langlands Whittaker zeta integrals, matching exponent s−1/2, and normalization conversions. The global compact-function (not necessarily cuspidal) function-field convergence/unfolding required in EX.6/global-zeta is an explicit extension request jointly with FA.6.

Consumed by: [EX.1/local-zeta](#EX-1-local-zeta), [EX.6/global-zeta](#EX-6-global-zeta).

### FunctionFieldArithmetic:FA.1

Canonical differentials and actual line bundles/tensors on the curve, importing current UPSTREAM AlgebraicVectorBundles L0/L1 rather than replanning them. Supply existence of a rational theta characteristic over a finite field and its precise hypothesis, or record the existence as an independent FA.1 extension; all spin constructions here explicitly take (L,η) as input.

Consumed by: [EX.9/spin-data](#EX-9-spin-data).

### FunctionFieldArithmetic:FA.2

Adeles/idele degree, restricted tensor Schwartz spaces, rational discreteness, quotient measures, product formula, residue characters, self-dual measures and Poisson summation. Import generic completed RestrictedProducts coordinate/change-of-reference APIs from current Tau Ceti rather than rebuilding them; construct degree generators without a degree-one place assumption.

Consumed by: [EX.6/adelic-product](#EX-6-adelic-product), [EX.6/theta-functional](#EX-6-theta-functional), [EX.6/global-zeta](#EX-6-global-zeta), [EX.7/poincare](#EX-7-poincare), [EX.7/petersson-unit](#EX-7-petersson-unit), [EX.7/automorphic-ideal](#EX-7-automorphic-ideal), [EX.9/spin-data](#EX-9-spin-data), [EX.9/spin-independence](#EX-9-spin-independence), [EX.11/torus-automorphic](#EX-11-torus-automorphic), [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction), [EX.11/weyl-lifting](#EX-11-weyl-lifting).

### FunctionFieldArithmetic:FA.6

Smooth compact and unrestricted quotient functions, determinant pushforward and quotient Haar measures, strong generation by rational and unipotent subgroups, finite-dimensional cusp forms at fixed level and bounded degree. Supply automorphicity of all irreducible subquotients of parabolic induction from automorphic torus characters (Langlands constituent theorem), and function-field compact-data zeta convergence with AL.3.

Consumed by: [EX.6/automorphic-functions](#EX-6-automorphic-functions), [EX.6/global-zeta](#EX-6-global-zeta), [EX.7/automorphic-ideal](#EX-7-automorphic-ideal), [EX.11/component-algebras](#EX-11-component-algebras), [EX.11/irreducible-equivalence](#EX-11-irreducible-equivalence).

### GL2AutomorphicRepresentationsAndTransfer:R16.2

Generic irreducible local GL₂ classification, smooth contragredients, the Kirillov embedding into uniformly smooth functions on F× (not just S(F×)), exact boundary/Jacquet formulas, and the two Steinberg/trivial nonsplit extensions. Include all nonarchimedean char≠2 fields, not only p-adic char zero.

Consumed by: [EX.1/singular-orbits](#EX-1-singular-orbits), [EX.1/open-spectral](#EX-1-open-spectral), [EX.1/kirillov-extension](#EX-1-kirillov-extension), [EX.4/two-generators](#EX-4-two-generators), [EX.5/generic-algebra](#EX-5-generic-algebra), [EX.11/irreducible-equivalence](#EX-11-irreducible-equivalence).

### GL2AutomorphicRepresentationsAndTransfer:R16.4

Cuspidal multiplicity-one and restricted tensor factorization over global function fields, importing the function-field spectral setup of FA.6 rather than a number-field-only decomposition.

Consumed by: [EX.11/component-algebras](#EX-11-component-algebras).

### MetaplecticAutomorphicForms:MP.1

The scalar ℂ× metaplectic extension and smooth Schrödinger representation. Existing MP.1 is characteristic zero; the already routed MetaplecticAutomorphicFormsPartIIFunctionFields must supply the equal-characteristic odd case before EX.0 can use it.

Consumed by: [EX.0/metaplectic-lift](#EX-0-metaplectic-lift).

### MetaplecticAutomorphicForms:MP.2

Explicit Weil operators and their relations for B-polarized matrix Schwartz space with negative Fourier kernel. Include char F>2 via the routed function-field Part II; no assumption that char F≠2 means odd residue characteristic in char zero.

Consumed by: [EX.0/metaplectic-lift](#EX-0-metaplectic-lift).

### MetaplecticAutomorphicForms:MP.4

Restricted tensor Weil representation with almost-everywhere reference-vector compatibility and rational splitting in the global function-field case, through MetaplecticAutomorphicFormsPartIIFunctionFields. Number-field MP.4 alone does not provide it.

Consumed by: [EX.6/adelic-product](#EX-6-adelic-product).

### MetaplecticAutomorphicForms:MP.5

Rational invariance of the Weil theta functional for global function fields via Poisson summation, through the routed function-field Part II; it does not assert invariance under arbitrary lifts in the scalar central extension.

Consumed by: [EX.6/theta-functional](#EX-6-theta-functional).

### SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

Smooth Tor derived from the actual smooth balanced tensor and the two-group spectral sequence Tor^G_i(Ṽ,Tor^G_j(V,S))⇒Tor^(G×G)_(i+j)(Ṽ⊗V,S); do not substitute algebraic group homology without a comparison. Retain the functorial residual commuting-group action on each Tor group: an identity endomorphism of the coefficient bimodule induces the identity on Tor. This is the input used to discharge the singular-stratum calculation.

Consumed by: [EX.1/singular-orbits](#EX-1-singular-orbits).

### SmoothRepresentationsOfLocalGroups:SR.1

Locally unital Hecke algebras and firm modules, tensor/Hom adjunction and internal Hom for commutative torus convolution, roughening/smoothing, compact averaging, and finite-block-support enrichment. This is a specialization of its idempotented algebra direction, not a second general theory here.

Consumed by: [EX.3/bernstein-firm](#EX-3-bernstein-firm), [EX.5/local-spherical-convolution](#EX-5-local-spherical-convolution), [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution), [EX.10/normalization-line](#EX-10-normalization-line), [EX.11/torus-automorphic](#EX-11-torus-automorphic).

### SmoothRepresentationsOfLocalGroups:SR.2

Smooth balanced tensor for multi-actions with smooth residual action, separate cocontinuity, right exactness, S(G)⊗G V≅V; exact mirabolic/Whittaker functors and Jacquet theory; compact induction/roughening adjunctions. For E=c-IndSL₂(O)^GL₂(F)1, projectivity and compactness of each Bernstein block piece (PAPER-DOR-23/060).

Consumed by: [EX.0/triality-kernel](#EX-0-triality-kernel), [EX.1/singular-orbits](#EX-1-singular-orbits), [EX.1/open-spectral](#EX-1-open-spectral), [EX.2/exotic-product](#EX-2-exotic-product), [EX.2/whittaker-unit](#EX-2-whittaker-unit), [EX.2/trace-symmetry](#EX-2-trace-symmetry), [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker), [EX.4/spherical-generator](#EX-4-spherical-generator), [EX.4/spherical-maps](#EX-4-spherical-maps), [EX.4/spherical-equivalence](#EX-4-spherical-equivalence), [EX.6/adelic-product](#EX-6-adelic-product), [EX.6/automorphic-functions](#EX-6-automorphic-functions), [EX.6/theta-multiplication](#EX-6-theta-multiplication), [EX.7/poincare](#EX-7-poincare), [EX.8/fully-faithful](#EX-8-fully-faithful), [EX.8/matrix-automorphic](#EX-8-matrix-automorphic), [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra), [EX.10/normalization-line](#EX-10-normalization-line), [EX.10/normalized-induction](#EX-10-normalized-induction), [EX.10/rank-one-universal](#EX-10-rank-one-universal), [EX.11/torus-automorphic](#EX-11-torus-automorphic), [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction), [EX.11/restriction-finite](#EX-11-restriction-finite).

### SmoothRepresentationsOfLocalGroups:SR.3

Bernstein blocks/centre in char F≠2 including odd positive characteristic; central invariant distributions and transpose invariance (item 063). The regular and finite-support Hom must be distinguished. Request the twisted spherical Hecke/end(E) comparison through the already routed SmoothRepresentationsPartIIParahoricCenters, items 061–062; that Part II has no stage ids yet.

Consumed by: [EX.1/central-balance](#EX-1-central-balance), [EX.3/bernstein-firm](#EX-3-bernstein-firm), [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker), [EX.4/spherical-generator](#EX-4-spherical-generator), [EX.4/spherical-equivalence](#EX-4-spherical-equivalence), [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution), [EX.11/component-algebras](#EX-11-component-algebras), [EX.11/component-decomposition](#EX-11-component-decomposition).

### SmoothRepresentationsOfLocalGroups:SR.4

For the twisted spherical E, the locally unital centre Zsph→underlineEnd(E) is an isomorphism, with full End(E)=∏cZc. This extends ordinary K-spherical Satake and must be assigned to SmoothRepresentationsPartIIParahoricCenters, as routed in PAPER-DOR-23; do not infer it from the ordinary spherical corner alone.

Consumed by: [EX.4/spherical-equivalence](#EX-4-spherical-equivalence).

The AL.0/AL.1 extension is proposed for **Automorphic L-functions and local factors, Part II**: equal-characteristic Fourier scope and algebraic zeta-integral modules. The GL₂-specific maps stay in EX.10. The metaplectic function-field and parahoric-centre Part II directions retain the ownership already assigned by PAPER-DOR-23.

## Proof obligations and acceptance boundaries

All twelve layers have target coverage **planned**. Three explicit gaps prevent a closure claim. A target depending on a gap inherits its proof obligation, including through intermediate layers. A proof outline states the desired construction; it is not evidence that its unresolved step is settled.

### G2: presentable linear category self-duality

No pinned/current library or existing roadmap found supplies the required 2-category of presentable ℂ-linear categories with Lurie tensor, its tensor universal property and smooth Eilenberg–Watts coevaluation. The local trace identity is planned separately and suffices for the explicit algebra/module constructions. Assign this generic infrastructure once to a category-theory owner and prove the self-duality triangle identities; do not encode them as unnamed Prop fields.

Affected targets: [EX.5/frobenius-category](#EX-5-frobenius-category).

### G3: adelic spherical counit normalization

Dor23 Appendix A does not define εA or compute the local transports of Construction 3.44 needed for 1M₂(Λ)δ1. Produce lattice-adapted h_v, compute all modulus scalars, show almost-everywhere reference compatibility, prove both counit equations and ΔA invertible. The proposed restricted tensor counit is a target, not a verified construction.

Affected targets: [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra), [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution).

### G4: spin transport and involution computations

Construction A.7 asserts independence of the rational section, and Remark A.8 asserts multiplicativity of |det|⁻² times inverse transpose, without the calculations. Verify the transformations of ΔA and mI with ω↦a²ω, Λ↦a⁻¹Λ and the product formula; compare the resulting product on the same carrier. The heuristic unramified spectral picture does not discharge this debt.

Affected targets: [EX.9/spin-independence](#EX-9-spin-independence).

## Lean subset

The companion suggested file follows the fixed WORKERS roadmap shape. It contains one light real definition on native two-by-two matrices, the determinant-pairing milestones and four examples, and the full general idempotent-coherence theorem on Mathlib monoidal categories. Its namespace is `TauCeti.ExoticGL2`. It elaborates at the pinned Mathlib with only proof-placeholder warnings; this is a signature check, not a formal proof.

The remaining 56 targets stay in this reader because their actual carriers require smooth balanced tensor, enriched firm-module Hom, the triality kernel, the exotic category or the relevant adelic/spin construction. Mathlib's SymmetricCategory presupposes the associator that EX.5 is to construct. CommMon and Mod can be applied once that category exists; they cannot be used to assume its construction. In particular no carrier is replaced by a record of its desired conclusions. The presentable-category target also requires the specific missing 2-categorical infrastructure in G2. Every API and test for these targets is specified above.

## Sources and corrections

Page numbers below are the printed article/preprint page numbers. Statements, proof sketches and corrections are in this roadmap's own words. The spin assertions retain G3–G4; the singular Tor calculation is explained above. The categorical infrastructure remains G2. Every source issue below has an independent review verdict.

- **Dor23.** Gal Dor, [Exotic Monoidal Structures and Abstractly Automorphic Representations for GL(2)](https://doi.org/10.1017/fmp.2023.18). Forum of Mathematics, Pi 11 (2023), e20, pp. 1–52, version of record. Read 19 October 2026: §§2.1–2.3, pp. 7–17; §§3.1–3.6, pp. 18–38; §§4.1–4.6, pp. 38–49; Appendix A, pp. 50–51.
- **Dor21.** Gal Dor, [Global Parabolic Induction and Abstract Automorphicity](https://arxiv.org/abs/2102.11820v1). arXiv:2102.11820v1 (23 February 2021), 55 pp. plus references. Read 19 October 2026: §A.1, pp. 4–10; §§B.2–B.6, pp. 15–33; §B.7, pp. 33–40, constructions and proofs used for the normalization-aware intertwiner; §§C.2–C.5, pp. 42–55.
- **GH11.** Shamgar Gurevich and Ronny Hadani, [The categorical Weil representation](https://arxiv.org/abs/1108.0351v1). arXiv:1108.0351v1 (1 August 2011). Read 19 October 2026: §3.1, Theorem 3.1.2, pp. 10–11; Appendix A, proof of Theorem 3.1.2, p. 15.
- **Dor20Z.** Gal Dor, [Modules of Zeta Integrals for GL(1)](https://arxiv.org/abs/2012.03068v1). arXiv:2012.03068v1 (5 December 2020). Read 19 October 2026: Appendix A, Theorem A.1 and Claim A.2, p. 25, statements and local reduction; Appendix A, Claim A.3 and its proof, p. 26, nonarchimedean local module freeness.

The sequel provides proofs for PAPER-DOR-23/048, which the published article announces. The categorical idempotent theorem is read in GH11 rather than imported without its compatibility hypotheses. No published correction was located in the Cambridge/arXiv records or the title/author correction search on 19 October 2026.

- **E1 (Dor23, misprint, confirmed), Published Proposition 2.12 proof, p. 14.** The displayed domain for (a,b,c) has ambient F× instead of (F×)³. Use {(a,b,c)∈(F×)³ | abc=1}. The displayed variables form a triple, and the adjacent exact sequence and splitting use all three coordinates.
- **E2 (Dor23, misprint, confirmed), Published Proposition 4.9 proof, p. 43.** The final Fourier integral is written over the rational matrix space. Use M₂(A) with its self-dual additive Haar measure. Poisson summation transforms an adelic Schwartz function; the rational field is the lattice being summed.
- **E3 (Dor23, misprint, confirmed), Published Petersson pairing following Construction 4.15, p. 45.** The displayed Petersson integral omits the rational quotient from its domain. Integrate over Γ\G. The functions are Γ-invariant; the unquotiented integral repeats infinitely many rational translates.
- **E4 (Dor23, misprint, confirmed), Published Claim 4.3 proof, p. 41.** The distinguished unit vector is denoted as the characteristic function of the entire local group. It is the class of 1GL₂(O_v) in the unit quotient. A characteristic function of noncompact G_v is not in S(G_v).
- **E5 (Dor23, misprint, confirmed), Published Warning 3.25, p. 25.** Inside the extension description, St is called trivial although the preceding sentence specifies the Steinberg representation. Read St as the Steinberg quotient in 0→1G→Eext→St→0; the subrepresentation 1G is the trivial representation. The trivial representation has zero nontrivial Whittaker coinvariants and cannot be the claimed generic example.
- **E6 (Dor23, rejected report), Published §3.3.2 heading, p. 21.** The published §3.3.2 heading on p. 21 reads correctly. No duplicated character was found in the version of record; extraction or rendering artifacts are not a source misprint.
- **E7 (Dor23, gap, confirmed), Published Claim A.6 proof and Construction A.5, p. 51.** Counitality is used after only the global generator and comultiplication have been described. Construct εA and check the transports, reference vectors, both counit identities and invertibility as in G3. An adelic coalgebra needs an actual map to the unit. Local counits do not automatically form a restricted tensor map.
- **E8 (Dor23, error, confirmed), Published Remark 3.47, p. 33.** The condition on h identifies a conjugated compact-open unipotent intersection with ker θ. Use the conductor lattice u(π⁻νO), not the full additive-character kernel. The left side is compact. In F_q((t)), the character kernel can contain elements of arbitrarily negative valuation, so it need not be compact.
- **E9 (Dor21, misprint, confirmed), arXiv:2102.11820v1, Theorem C.2.1, p. 43.** The stated domain and codomain of î are reversed. The functor is î:Mod(T)→Mod(G), as defined immediately before the theorem. The explicit definition is parabolic induction after torus internal Hom, so it has that direction.
- **E10 (Dor21, gap, confirmed), arXiv:2102.11820v1, Remark C.4.5 and Proposition C.4.6 proof, p. 49.** The coordinate argument chooses a place of degree one without assuming that the curve has such a place. Choose an idele generating the image of the norm map, using a finite integral combination of place degrees; reformulate induction from G¹ using that idele. A smooth proper curve over a finite field need not have a rational point. The norm splitting needs an idele, not a uniformizer at a degree-one place.
- **E11 (Dor23, rejected report), Lemma 2.20 proof, p. 17.** Rejected: both outer SL₂ actions on Q are trivial. The residual action on Tor¹ stays trivial by functoriality, so Ṽ_SL₂=0 kills E²_0,1; Tor⁰=0 kills E²_1,0. The full argument is now in the node and G1 is removed.
- **E12 (Dor23, gap, confirmed), Construction A.7 and Remark A.8, p. 51.** Section independence and the weighted inverse-transpose algebra involution are asserted without the transport calculations. Verify the coalgebra and theta-product transformations and their modulus factors as specified in G4. A spectral heuristic does not prove equality of the explicitly constructed products.
- **E13 (Dor21, gap, confirmed), arXiv:2102.11820v1, Lemma C.4.9 proof and Remark C.4.10, pp. 51–52.** The proof chooses a prime representing an arbitrary fixed ray class of an idele ratio. Use the large-degree convolution identity in EX.11/weyl-lifting. Choose prime representatives only for the three shifted positive-degree classes, then recover the arbitrary symmetric generator by convolution and subtraction. Degree is unchanged by principal ideles and compact unit level. Every prime has positive degree, so a degree-zero or negative-degree ray class has no prime representative. Constant-field compatibility alone does not remove this obstruction.

## Routing coverage

All 47 items routed to this roadmap are accounted for. The indices refer to PAPER-DOR-23; generic inputs routed to other owners remain imports. Item 048 expands into the sequel's normalization, induction, adjunction, component and irreducible-equivalence targets.

| Routed item | Owning targets |
|---|---|
| 007 | [EX.0/open-kernel](#EX-0-open-kernel), [EX.1/open-spectral](#EX-1-open-spectral) |
| 008 | [EX.0/determinant-pairing](#EX-0-determinant-pairing), [EX.0/triality-symplectic](#EX-0-triality-symplectic) |
| 009 | [EX.0/metaplectic-lift](#EX-0-metaplectic-lift) |
| 010 | [EX.0/triality-kernel](#EX-0-triality-kernel) |
| 011 | [EX.1/kirillov-extension](#EX-1-kirillov-extension) |
| 012 | [EX.1/local-zeta](#EX-1-local-zeta) |
| 013 | [EX.1/central-balance](#EX-1-central-balance) |
| 014 | [EX.0/open-kernel](#EX-0-open-kernel) |
| 015 | [EX.1/singular-orbits](#EX-1-singular-orbits) |
| 016 | [EX.0/triality-kernel](#EX-0-triality-kernel), [EX.1/kirillov-extension](#EX-1-kirillov-extension) |
| 017 | [EX.2/transpose-right](#EX-2-transpose-right), [EX.2/exotic-product](#EX-2-exotic-product) |
| 018 | [EX.2/weak-symmetric](#EX-2-weak-symmetric) |
| 019 | [EX.2/whittaker-unit](#EX-2-whittaker-unit) |
| 020 | [EX.2/trace-symmetry](#EX-2-trace-symmetry) |
| 021 | [EX.2/trace-symmetry](#EX-2-trace-symmetry) |
| 022 | [EX.3/degeneracy](#EX-3-degeneracy) |
| 023 | [EX.3/bernstein-firm](#EX-3-bernstein-firm), [EX.3/whittaker-centre](#EX-3-whittaker-centre) |
| 024 | [EX.3/enhanced-whittaker](#EX-3-enhanced-whittaker) |
| 025 | [EX.3/degeneracy-equivalence](#EX-3-degeneracy-equivalence) |
| 026 | [EX.4/spherical-generator](#EX-4-spherical-generator) |
| 027 | [EX.4/spherical-maps](#EX-4-spherical-maps) |
| 028 | [EX.4/spherical-equivalence](#EX-4-spherical-equivalence) |
| 029 | [EX.4/two-generators](#EX-4-two-generators) |
| 030 | [EX.5/idempotent-coherence](#EX-5-idempotent-coherence) |
| 031 | [EX.5/associator](#EX-5-associator) |
| 032 | [EX.5/frobenius-category](#EX-5-frobenius-category) |
| 033 | [EX.5/generic-algebra](#EX-5-generic-algebra) |
| 034 | [EX.5/local-spherical-convolution](#EX-5-local-spherical-convolution) |
| 035 | [EX.6/adelic-product](#EX-6-adelic-product) |
| 036 | [EX.6/automorphic-functions](#EX-6-automorphic-functions) |
| 037 | [EX.6/theta-functional](#EX-6-theta-functional) |
| 038 | [EX.6/theta-functional](#EX-6-theta-functional) |
| 039 | [EX.6/theta-multiplication](#EX-6-theta-multiplication) |
| 040 | [EX.6/automorphic-functions](#EX-6-automorphic-functions), [EX.7/poincare](#EX-7-poincare) |
| 041 | [EX.7/petersson-unit](#EX-7-petersson-unit) |
| 042 | [EX.7/automorphic-ideal](#EX-7-automorphic-ideal) |
| 043 | [EX.7/automorphic-algebra](#EX-7-automorphic-algebra) |
| 044 | [EX.7/automorphic-ambient-module](#EX-7-automorphic-ambient-module) |
| 045 | [EX.8/abstract-automorphic](#EX-8-abstract-automorphic) |
| 046 | [EX.8/fully-faithful](#EX-8-fully-faithful) |
| 047 | [EX.8/matrix-automorphic](#EX-8-matrix-automorphic) |
| 048 | [EX.10/normalization-line](#EX-10-normalization-line), [EX.10/normalized-induction](#EX-10-normalized-induction), [EX.10/rank-one-universal](#EX-10-rank-one-universal), [EX.10/lax-induction](#EX-10-lax-induction), [EX.10/intertwining](#EX-10-intertwining), [EX.11/torus-automorphic](#EX-11-torus-automorphic), [EX.11/automorphic-adjunction](#EX-11-automorphic-adjunction), [EX.11/component-algebras](#EX-11-component-algebras), [EX.11/component-decomposition](#EX-11-component-decomposition), [EX.11/irreducible-equivalence](#EX-11-irreducible-equivalence), [EX.11/restriction-finite](#EX-11-restriction-finite), [EX.11/weyl-lifting](#EX-11-weyl-lifting) |
| 049 | [EX.9/spin-data](#EX-9-spin-data) |
| 050 | [EX.9/global-spherical-coalgebra](#EX-9-global-spherical-coalgebra) |
| 051 | [EX.9/global-spherical-convolution](#EX-9-global-spherical-convolution), [EX.9/spin-independence](#EX-9-spin-independence) |
| 057 | [EX.2/trace-symmetry](#EX-2-trace-symmetry) |
| 058 | [EX.6/global-zeta](#EX-6-global-zeta) |
