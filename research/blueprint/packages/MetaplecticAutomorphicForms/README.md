# Metaplectic groups, Weil representations and automorphic theta kernels

The oscillator representation turns quadratic Fourier analysis into local and global theta correspondence. This roadmap constructs the Heisenberg and metaplectic groups, genuine representations, adelic theta kernels and the analytic comparisons needed for half-integral weight and genus-two Jacobi forms. Its nine layers lead from bilinear extensions to explicit two-cusp Fourier expansions and quadratic-twist kernel inputs.

Smooth representation categories, induction and Jacquet functors come from SR; local and adelic Schwartz–Bruhat analysis and Poisson summation from AL.0; quotient measures from AA; growth, Eisenstein and spectral analysis from AF and AS. Existing classical groups, quadratic invariants and finite quadratic modules are reused. GN denotes GeometryOfNumbersAndQuadraticArithmetic; GZ denotes GrossZagierAndArithmeticHeights; BSD denotes RankZeroOneBSD. MP supplies the cover-specific actions, splittings and theta comparisons. Arithmetic Waldspurger identities belong to GrossZagierAndArithmeticHeights:GZ.5 and the final twist nonvanishing argument to RankZeroOneBSD:BSD.2. Function-field geometric applications require their independently supplied Satake and shtuka constructions.

Write e(t)=exp(2πit). Heisenberg extensions use coefficient-first coordinates (t,w), with law (t,w)(s,v)=(t+s+B(w,v),w+v); the symplectic model has B=ω/2. BFH’s space-first convention is obtained by interchanging coordinates. QFI6C supplies nonarchimedean Hilbert symbols; use GlobalQuadraticForms layer 4 over R. Local fields have characteristic different from two where stated; dyadic residue characteristic remains allowed. Use nontrivial continuous unitary ψ and self-dual additive measures. Left actions correspond to Kudla’s right action through inversion. Operator comparisons specify Fourier signs and root branches.

Distinguish the scalar-circle extension from its normalized μ₂ subcover. A genuine representation sends the latter’s central −1 to −Id. Fix q’s polar form as q(x+y)−q(x)−q(y); its determinant differs from the quadratic determinant by 2^dimV. GQT parameters use m=m₀+2r, d(n)=n+ε₀, s₀=(m−d(n))/2 and ρ_H=(m−r−ε₀)/2. The half-weight parameter is r/2 and the paired weight-zero parameter r. Petersson products use unnormalized hyperbolic area. In BFH, the original newform conductor is M, the auxiliary level N, and the normalized Siegel parameter s−2.

The settings H1, H2, … restart in each layer and apply only when cited. [Suggested.lean](Suggested.lean) supplies the companion signatures and tests; the mathematical targets and supplier hypotheses below remain definitive.

## Prerequisite notation

Internal numbers identify targets. API sentences follow the named items in Suggested.lean in their displayed order; its omission inventory records supplier limits. For external references, append the displayed stage or target suffix to the roadmap identifier below, separated by a colon. The TC abbreviations denote the exact upstream references. Library declarations at each layer apply only where their operation is used.

| Stage prefix | Roadmap |
| --- | --- |
| `AA` | `AdelicAlgebraicGroups` |
| `AF` | `AutomorphicFormsOnReductiveGroups` |
| `AL` | `AutomorphicLFunctionsAndLocalFactors` |
| `AS` | `AutomorphicSpectralTheory` |
| `R16` | `GL2AutomorphicRepresentationsAndTransfer` |
| `GS3` | `GeometricSatakeAndFusion` |
| `GS` | `GlobalShtukasAndFunctionFieldLanglands` |
| `MP` | `MetaplecticAutomorphicForms` |
| `ML` | `ModularityAndLanglandsExtensions` |
| `LV` | `MordellLawrenceVenkatesh` |
| `QM` | `QSeriesPartitionsAndMockModularForms` |
| `SR` | `SmoothRepresentationsOfLocalGroups` |

| Abbreviation | Upstream layer |
| --- | --- |
| `TC47` | `tauceti:TauCetiRoadmap/IntegralLattices#layer-1-dual-lattices-discriminant-groups-and-finite-quadratic-forms` (1G–1H) |
| `TC48` | `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order` |
| `TC49` | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-3-admissible-systems-of-local-invariants` |
| `TC50` | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-4-global-square-norm-and-approximation-lemmas` |
| `TC51` | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-7-existence-from-compatible-local-invariants` |
| `TC52` | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences` |
| `TC53` | `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus` |
| `TC54` | `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra` |
| `TC55` | `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor` |
| `TC56` | `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators` |
| `TC57` | `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions` |
| `TC58` | `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` |
| `TC59` | `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation` |
| `TC60` | `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` |

## MP.0: Symplectic and Heisenberg groups with topology

Shared settings (the numbers below are cited only by the targets using them):

1. R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.

2. Write E_B for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

3. R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.

4. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

5. 2 is invertible in R.

Library substrate: `ContRepresentation`, `ContRepresentation.toRepresentation`, `LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.IsAlt.neg_eq`, `LinearMap.BilinForm.IsometryEquiv`, `LinearMap.BilinForm.IsometryEquiv.map_app`, `LinearMap.BilinForm.IsometryEquiv.symm`, `LinearMap.BilinForm.Nondegenerate`, `LinearMap.BilinForm.flip`, `LinearMap.BilinForm.flip_apply`, `LinearMap.BilinMap`, `LinearMap.map_add₂`, `MeasureTheory.Lp`, `MeasureTheory.Measure.IsAddLeftInvariant`, `Multiplicative`, `SchwartzMap`, `SchwartzMap.coeFn_toLp`, `SchwartzMap.toLp`, `Subgroup.mem_center_iff`, `groupCohomology.IsMulCocycle₂`, `invOf_mul_self`, `TauCeti.BilinForm.isometryGroup`, `TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`, `TauCeti.BilinForm.mem_isometryGroup`, `TauCeti.FactorSet`, `TauCeti.FactorSet.Extension`, `TauCeti.FactorSet.Extension.inv_left`, `TauCeti.FactorSet.Extension.inv_right`, `TauCeti.FactorSet.Extension.mul_left`, `TauCeti.FactorSet.Extension.mul_right`, `TauCeti.FactorSet.canonicalSection`, `TauCeti.FactorSet.groupExtension`, `TauCeti.FactorSet.inl`, `TauCeti.FactorSet.inl_injective`, `TauCeti.FactorSet.inl_mul_canonicalSection`, `TauCeti.FactorSet.inl_range_le_center`, `TauCeti.FactorSet.rescaleEquiv`, `TauCeti.FactorSet.rescaleEquiv_apply`, `TauCeti.FactorSet.rescaleEquiv_symm_apply`, `TauCeti.trivialMulDistribMulAction`, `TauCeti.trivialMulDistribMulAction_smul`.

### Algebra of the bilinear extension

#### MP.0.1: Bilinear Heisenberg factor set

Construct α_B(x,y)=B(x,y), viewed multiplicatively, as a normalized factor set on Multiplicative W with coefficients Multiplicative C and trivial action. Its existing extension E_B has multiplication (t,x)(s,y)=(t+s+B(x,y),x+y). The maps t↦(t,0) and (t,x)↦x and their exactness are the native inl, rightHom and groupExtension. For B((x,y),(x′,y′))=xy′, identify (t,(x,y)) with the existing TauCeti.HeisenbergGroup element (x,y,t); consume its group law and commutatorElement_eq. `tauceti:TauCetiRoadmap/ProfiniteArithmetic` 3.4 supplies the ℤ_p product topology and detecting example. The general bilinear extension and its local oscillator action extend these models.

H1, H2.

API: The additive value of α_B(x,y) is B(x,y); The coefficient coordinate of pq is t+s+B(x,y); The quotient coordinate of pq is x+y

Kudla96, I.1, p.3.

Tests: (1) B=0 on Z: (pq).left=t+s; (2) B(x,y)=x₀y₁ on Z²: α_B(e₀,e₁)=1 additively; (3) For that B, α_B(e₁,e₀)=0.

#### MP.0.2: Inverse in the bilinear extension

For p=(t,x) in E_B, p⁻¹=(−t+B(x,x),−x).

H1, H2.

Kudla96, I.1, p.3 · needs 0.1.

#### MP.0.3: Commutator in a bilinear central extension

For p=(t,x),q=(s,y), with commutator convention pqp⁻¹q⁻¹, the commutator is inl(B(x,y)−B(y,x)).

H1, H2.

Kudla96, I.1, p.3 · needs 0.1, 0.2.

#### MP.0.4: Center criterion for a bilinear extension

An element (t,x) belongs to the center of E_B iff B(x,y)=B(y,x) for every y∈W.

H1, H2.

Kudla96, I.1, p.3 · needs 0.1.

#### MP.0.5: Commutator for the half-alternating convention

Let ω be alternating and let 2 be invertible in R. In E_{½ω}, pqp⁻¹q⁻¹=inl(ω(x,y)).

H3, H4. ω is alternating; 2 is invertible in R.

Kudla96, I.1, p.3 · needs 0.1, 0.3.

#### MP.0.6: Center of the Heisenberg group

If ω is alternating and nondegenerate and 2 is invertible in R, the center of E_{½ω} is exactly the range of its native coefficient injection.

H3, H4. ω is alternating and nondegenerate; 2 is invertible in R.

Kudla96, I.1, p.3 · needs 0.1, 0.5.

#### MP.0.7: Extension isomorphism induced by an isometry

For scalar forms B on W and D on W′ and a native isometry e:B≃D, construct the group isomorphism E_B≃E_D sending (t,x) to (t,e(x)).

H3, H4.

API: The coordinate formula is (t,x)↦(t,e(x)); The identity native isometry gives the identity group isomorphism; Extension of the composite f∘e is extension of f composed with extension of e, with the same order as native IsometryEquiv.trans; Extension of e sends inl_B(t) to inl_D(t)

Kudla96, I.1, p.3 · needs 0.1.

Tests: (1) For B=0 on Z, extension of id fixes (3,4); (2) Extension of negation sends (3,4) to (3,−4); (3) Extension of e⁻¹ inverts extension of e, also between different modules.

#### MP.0.8: Isometry action on the Heisenberg group

For a scalar form B, construct a group homomorphism from the native TauCeti.BilinForm.isometryGroup B to automorphisms of E_B, sending e to (t,x)↦(t,e(x)).

H3, H4.

API: The group element e acts by (t,x)↦(t,e(x)); Every e fixes each inl(t); The action homomorphism is injective: evaluation on all (0,x) determines e

Kudla96, I.1, p.3 · needs 0.1, 0.7.

Tests: (1) For B=0 on Z, the group identity fixes (3,4); (2) Negation acts by (3,4)↦(3,−4); (3) Every isometry fixes inl(t) for all t.

#### MP.0.9: Quadratic correction between Heisenberg cocycles

For scalar B and invertible 2, put q(x)=½B(x,x) and ω=B−Bᵀ. Then ½ω(x,y)+q(x+y)=B(x,y)+q(x)+q(y).

H3, H4, H5.

Weil64, I.§3 equation(3), printed148, PDF6 · needs 0.1.

#### MP.0.10: Polarized Heisenberg coordinates

For scalar B and invertible 2, construct E_{½(B−Bᵀ)}≃E_B by (t,x)↦(t+½B(x,x),x), with inverse (t,x)↦(t−½B(x,x),x). This is a specialization of the native equivalence of rescaled extensions.

H3, H4, H5.

API: The forward coefficient is t+½B(x,x), and the quotient coordinate remains x; The inverse coefficient is t−½B(x,x), and the quotient coordinate remains x; The equivalence fixes the native coefficient injection

Weil64, I.§3 equation(3), printed148, PDF6; comparison with Kudla I.2 Lemma2.2 PDF7 · needs 0.1, 0.9.

Tests: (1) For B=0 on Q, (3,4) is fixed; (2) For B(x,y)=x₀y₁ on Q², (0,(2,3))↦(3,(2,3)); (3) The inverse sends (0,(2,3)) to (−3,(2,3)).

#### MP.0.11: Criterion for the section-trivial central character

For any group A and homomorphism χ:Multiplicative C→A, the function E_B→A given by (t,x)↦χ(t) preserves multiplication iff χ(B(x,y))=1 for every x,y∈W.

H1, H2. A is any group; χ is a group homomorphism from Multiplicative C to A.

Kudla96, I.2, p.6, the asserted extension ψ_Y; section-trivial multiplicativity criterion · needs 0.1.

#### MP.0.12: Section-trivial extension of a central character

Given χ:Multiplicative C→A with χ(B(x,y))=1 for all x,y, construct the group homomorphism E_B→A, (t,x)↦χ(t). It extends χ on native inl and is trivial on the native canonical section.

H1, H2. A is any group; χ:Multiplicative C→A is a group homomorphism, and χ(B(x,y))=1 for every x,y.

API: At (t,x) the homomorphism evaluates to χ(t); Its restriction along native inl is χ; Its value on each native canonicalSection(x) is one; If ρ:E_B→A agrees with χ on native inl and is one on every native canonicalSection(x), then ρ equals centralCharacter B χ. Both conditions are required

Kudla96, I.2, p.6, extension ψ_Y; section-trivial normalization and multiplicativity hypothesis · needs 0.1, 0.11.

Tests: (1) B=0 on Z, χ=id of Multiplicative Z: (3,4) has additive value 3; (2) Trivial χ gives the trivial homomorphism for every B; (3) For B=0, χ=id, the extension identity has multiplicative value 1.

### Topology and Schrödinger realizations

#### MP.0.13: Topological Heisenberg extension

Give the existing bilinear FactorSet.Extension E_B the topology transported from C×W by its coordinate equivalence. If C,W are Hausdorff topological modules and B is continuous, multiplication and inversion are continuous. For finite-dimensional modules over a nondiscrete local field it is locally compact and second countable. For B=½ω, the native isometry action is jointly continuous provided evaluation on W is jointly continuous; in the finite-dimensional local-field case give isometries their subspace topology in GL(W).

The local-field specialization has characteristic different from two; W is finite dimensional and ω is alternating. Continuity of B is required in the general topological-module case; joint continuity of the isometry evaluation is a separate hypothesis for the action.

API: The native extension coordinate equivalence E_B≃C×W is a homeomorphism; Multiplication is continuous for the transported product topology; Joint continuity of native isometry action when its evaluation on the vector module is jointly continuous

Kudla96, I.1 pp.3–4; I.2 p.6 · needs 0.1, 0.2, 0.8.

Tests: (1) W=0 over R: E≃ₜ(R,+); (2) Continuous B on topological additive groups gives product coordinates and continuous multiplication; Q₂ requires its local supplier; (3) In the stated Hausdorff setting, inl is a closed embedding and the quotient is an open continuous surjection.

#### MP.0.14: Product Haar measure on the Heisenberg group

For C=F, W=F^{2n}, B continuous bilinear, the product of additive Haar measures μ_F and μ_W transported to E_B is both left and right Haar measure. With self-dual measures for ψ and ω, every symplectic automorphism preserves it; rescaling the central or vector measure rescales their product.

F is a nondiscrete local field; for symplectic invariance ω is nondegenerate.

Kudla96, I.2 pp.6–10 · needs 0.13, `AL.0/local-fourier-inversion`, `AL.0`.

#### MP.0.15: Schrödinger representation

For W=X⊕Y with X,Y Lagrangian, define on S(X) the representation ρψ(x+y,t)φ(u)=ψ(t+ω(u,y)+½ω(x,y))φ(u+x). Here S(X) is the actual locally constant compactly supported space at nonarchimedean places and the joint real Schwartz space at archimedean places. The formula preserves S(X) and gives central character ψ.

F is a nondiscrete local field of characteristic different from two; ψ is nontrivial continuous unitary; the polarization identifies Y with the algebraic dual of X by ω.

API: Evaluation is the displayed translation and modulation formula; ρψ(0,t)φ=ψ(t)φ; ρψ(hh′)=ρψ(h)ρψ(h′); For the displayed phase/translation operator, a unit-norm character and an additive invariant measure give equality of the squared-norm integrals. L² descent is supplied separately

Kudla96, I.2 Lemma2.2, PDF7, translation and phase action · needs 0.13, 0.5, `LV.3/lagrangian-symplectic-basis`, `AL.0/local-schwartz-bruhat-space`, `AL.0`.

Tests: (1) X=Y=0: ρψ(t) is scalar ψ(t) on C; (2) ρψ(x,0)φ(u)=φ(u+x); (3) ρψ(y,0)φ(u)=ψ(ω(u,y))φ(u); (4) ρ(x)ρ(y)=ψ(ω(x,y))ρ(y)ρ(x).

#### MP.0.16: Induced and coordinate Schrödinger models

Identify S(X) with the smooth functions f on H(W) satisfying f(h_Yh)=ψ_Y(h_Y)f(h), whose support is compact modulo H(Y), by evaluation on the X section; here H(Y)=Y×F and ψ_Y(y,t)=ψ(t). The inverse is the extension determined by covariance. Right translation gives exactly the Schrödinger formula.

F is nonarchimedean; ψ is continuous nontrivial unitary; Y is an isotropic F-subspace, not merely a character-self-dual lattice.

API: The coordinate map is f↦(u↦f(u,0)); The inverse section-evaluation map satisfies f(t,u)=ψ(t)φ(u); smoothness and compact support are additional source obligations; The explicitly constructed coordinate translation intertwines section evaluation with the same Schrödinger phase/translation operator

Kudla96, I.2 Lemma2.2, PDF7, polarization realization · needs 0.15, `SR.2`.

Tests: (1) The covariant inverse of φ has value φ(0) at (0,0); (2) Evaluation recovers an indicator from its inverse; local compact-open support is an additional assertion; (3) An additive Q character taking 1/2 to −1 cannot take it to 1; Q₂ conductor data require the local supplier.

#### MP.0.17: Hilbert Schrödinger model

Extend translation and modulation to unitary operators on the actual Hilbert space L²(X,μselfdual), using almost-everywhere classes. This is a strongly continuous unitary representation of H(W); its dense Schwartz subspace carries the preceding formula.

F is a local field of characteristic different from two; X is finite dimensional; ψ is continuous unitary.

API: Every ρψ(h) preserves the L² norm; The Schwartz-to-L² dense inclusion intertwines the two actions; For every ξ∈L², h↦ρψ(h)ξ is continuous; The representative of the constructed L² isometry equals ψ(t+uy+xy/2) times the translated representative almost everywhere for Lebesgue measure; Construct the real-line Schwartz phase/translation operator; Evaluate the real-line Schwartz operator by the same phase/translation formula

Weil64, I.§4, printed149, PDF7; I.§10 Théorème1, printed157, PDF15 · needs 0.15, 0.14, `AL.0/local-schwartz-bruhat-space`, `AL.0`.

Tests: (1) Real-line central (t,0,0) acts by ψ(t); (2) Translating exp(−πu²) gives exp(−π(u+x)²) with the same L² norm; (3) Changing a representative on a null set preserves the L² vector.

#### MP.0.18: Smooth vectors of the oscillator model

At nonarchimedean places the smooth vectors of the Hilbert oscillator model are precisely S(X). Over R, and over C viewed as a real field, the C∞ vectors for the Heisenberg group action are precisely the Schwartz functions on the underlying real X, with their Schwartz Fréchet topology.

The local unitary model has nontrivial central character. Archimedean smoothness means all orbit derivatives for the full Heisenberg group, not just smooth pointwise representatives.

Kudla96, I.2 p.10 · needs 0.17, 0.15, `AF.1`, `SR.0:abelian-category`.

## MP.1: Stone–von Neumann and the metaplectic extension

Library substrate: `Representation.Equiv`, `Representation.IntertwiningMap`, `rootsOfUnity`, `TauCeti.FactorSet`, `TauCeti.FactorSet.rescaleEquiv`.

### Uniqueness and the scalar extension

#### MP.1.1: Smooth Stone–von Neumann theorem

For a finite-dimensional symplectic space over a nonarchimedean local field of characteristic different from two and a nontrivial continuous unitary ψ, every irreducible smooth complex representation of H(W) with central character ψ is isomorphic to the Schrödinger model. Its Heisenberg intertwining endomorphism algebra is C.

No odd-residue-characteristic assumption is imposed. For the use of Sun–Zhu’s formulation restrict to characteristic zero; Kudla’s statement allows characteristic different from two.

Kudla96, I.1 Theorem1.1 p.3 · needs 0.16, `SR.0:abelian-category`, `SR.3`.

#### MP.1.2: Unitary Stone–von Neumann theorem

Every irreducible strongly continuous unitary representation of the real Heisenberg group with nontrivial unitary central character is unitarily equivalent to L²(X); all unitary representations with that character are Hilbert multiplicities of it. The complex local-field Heisenberg statement is obtained by viewing its alternating pairing and character on the underlying real group.

Finite-dimensional real symplectic space and nontrivial central character; strong continuity is required.

Weil64, I.§10 Théorème1, printed157, PDF15 (scalar commutant); classification proof is Garrett20; Garrett20, Author notes23March2020, Claims0.1–0.7, PDF1–4 · needs 0.17.

#### MP.1.3: Unitary normalizer extension

Inside Sp(W)×U(L²(X)), take pairs (g,A) satisfying Aρ(h)A⁻¹=ρ(g·h) for every h. Composition gives the scalar extension Sψ, with kernel z↦(1,z·id), z∈U(1). Equip the unitary group with strong operator topology and Sψ with the subspace topology. Its oscillator action is the second projection.

The Hilbert Schrödinger model is strongly continuous; g acts by the inherited center-fixing Heisenberg automorphism.

API: The covariance subgroup projects by a group homomorphism to G; openness, surjectivity, continuity and its scalar kernel require the actual irreducible model; Aρ(h)=ρ(g·h)A; The covariance subgroup acts by its unitary-operator projection

Weil64, I.§10 Théorème1, printed157, PDF15; III.§§31–36, PDF39–45 · needs 0.17, 0.8, 1.2, 1.1.

Tests: (1) G=1,H=C: every unitary normalizer is a unique norm-one scalar; (2) Every pair above g=1 is uniquely z·id, |z|=1; (3) For W≠0 over R, the normalized μ₂ cover has no continuous homomorphic section.

#### MP.1.4: Scalar ambiguity and composition of intertwiners

For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). If the chosen A_g are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization.

Nontrivial ψ; the exact smooth or strongly continuous unitary category is fixed. No global continuity of the chosen A_g is assumed.

Kudla96, I.1, PDF3–5, irreducibility and intertwiners · needs 1.3, 1.1, 1.2.

### Normalization to the double cover

#### MP.1.5: Rao factor set

Relative to Y, write j(g)=rank(c_g) and x(g)∈F×/(F×)² for the Bruhat square class. For q=L(Y,Yg₂⁻¹,Yg₁), let t=(j(g₁)+j(g₂)−j(g₁g₂)−dim q)/2. Define the μ₂-valued Rao factor set by (x₁,x₂)(−x₁x₂,x₁₂)(−1,det(2q))^t(−1,−1)^{t(t−1)/2}Hasse(2q). Its normalization and cocycle equation make a native FactorSet with trivial μ₂ action.

F is nonarchimedean of characteristic different from two; the Bruhat representatives, j,x and the nonsingular Leray quotient use Kudla I.4’s normalization. Rank-zero determinants equal one.

API: Its values lie in μ₂; c(g,h)c(gh,k)=c(g,hk)c(h,k); The displayed β cochain converts it to the integral-operator cocycle

Kudla96, I.4 pp.19–22 Proposition4.3 and Theorem4.5 · needs 2.4, 2.2, `TC58`.

Tests: (1) c(1,g)=c(g,1)=1; (2) In SL₂, x(g)=c when c≠0, otherwise d; c(g₁,g₂)=(x₁,x₂)(−x₁x₂,x₁₂); (3) On rank-one diagonal matrices the factor is (a,b)_F, so the full Levi need not split.

#### MP.1.6: Metaplectic double cover

For nonarchimedean F take the native extension E_{c_Rao} and identify (g,ε) with (T_g,εβ(g)r_Y(g)) in Sψ, where T_g(w)=wg⁻¹ converts Kudla’s right matrix action to the native left action. Give it the topology of ker λ₂⊂Sψ, where λ₂ is the continuous character restricting to z↦z² on the scalar circle. Over R use the same kernel construction. Over C Sψ≃Sp(W)×U(1), and the double cover is Sp(W)×μ₂. It is a topological central extension by μ₂, nonsplit when W≠0 and F≠C.

Local field characteristic different from two, finite-dimensional symplectic W. The zero-dimensional cover is μ₂. The discontinuous global Bruhat section does not define a product topology on Sp×μ₂.

API: Membership in the native kernel subgroup is equivalent to lambda2(s)=1; its identification as the μ₂ cover of Sp is a source obligation; The native subgroup inclusion maps ker lambda2 into the supplied normalizer carrier; A group equivalence carrying one character to the other induces an equivalence of their kernel subgroups. Source cochain and topological comparisons remain separate

Weil64, IV.§§42–44, printed194–199, PDF52–57 · needs 1.3, 1.5, 2.4.

Tests: (1) The square-character kernel on Cˣ is {z:z²=1}; (2) That kernel equals native rootsOfUnity 2 C; (3) −1 belongs to the kernel; real Sp nonsplitting concerns the actual normalized cover.

#### MP.1.7: Genuine Weil representation

Restrict the normalizer’s second projection to Mp(W)=ker λ₂. This gives the unitary Weil representation ωψ on L²(X) and its smooth/Schwartz subrepresentation; the nontrivial central element acts as −id. With the Rao coordinates ωψ(g,ε)=εβ(g)r_Y(g).

The local-field cover and actual Schrödinger model are fixed.

API: The action on ker lambda2 is the restriction of the supplied normalizer oscillator; identification with εβ(g)rY(g) is separate; ωψ(1,−1)=−id; A unitary Heisenberg model intertwiner conjugates the intrinsic cover action; changing its scalar leaves this equivalence unchanged

Kudla96, I.5 pp.23–24; II.4 pp.37–39 · needs 1.6, 1.3, 0.18.

Tests: (1) At W=0, μ₂ acts on C by sign; (2) The two lifts of g give opposite operators in a nonzero model; (3) The identity lift acts as the identity linear isometry.

## MP.2: Weil index and explicit operators

### Quadratic Fourier scalars and the Leray invariant

#### MP.2.1: Weil index

For a nondegenerate quadratic form q on F^d, define γψ(q)∈U(1) as the scalar in the Fourier transform of the oscillatory distribution ψ∘q: with positive Fourier kernel ψ(x·y) and coordinate self-dual Haar, its transform at y is γψ(q)|det Bq|⁻¹/²ψ(−q(Bq⁻¹y)), where Bq(x,y)=q(x+y)−q(x)−q(y). In the Bq-self-dual measure this is γψ(q)ψ(−q(y)). This is not an absolutely convergent integral over F^d.

F is a nondiscrete local field of characteristic different from two, ψ continuous nontrivial unitary, q nondegenerate, Bq its full polar form.

API: The Fourier transform identity above characterizes γψ(q); |γψ(q)|=1; Isometric quadratic forms have equal Weil index; For ψq-trivial L, γ is the unit normalization of vol(L)Σ_{L′/L}ψ(q(x))

Weil64, I.§14 Théorème2, printed161–162, PDF19–20; II.§§24–28 · needs `AL.0/local-fourier-inversion`, `AL.0`.

Tests: (1) Dimension zero: γ=1; (2) Over R with ψ(t)=exp(2πit), γ(ax²)=exp(πi sgn(a)/4), a≠0; (3) For ψ₂(t)=exp(−2πi frac₂(t)) on Q₂, γ(x²)=(1−i)/√2 from (½Z₂)/Z₂; (4) γ(xy)=1.

#### MP.2.2: Weil index and Hilbert symbol

The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i.

F is a local field of characteristic different from two, including Q₂ and R; all a_i and a,b are nonzero. At nonarchimedean F, dyadic fields included, the Hilbert symbol and local Hasse invariant are those of QuadraticFormInvariants 6C. At F=ℝ the same norm-equation symbol is used with the archimedean computation of GlobalQuadraticForms Layer 4.4 ((a,b)_ℝ=−1 exactly when a<0 and b<0), from which the real symmetry, bimultiplicativity and Hasse product are read off; 6C's theorems, which assume a nonarchimedean local field, are not applied at ℝ.

Kudla96, I.4 pp.17–18 Lemmas4.1–4.2 · needs 2.1, `TC58`, `TC50`.

#### MP.2.3: Leray quadratic form

For Lagrangians L₀,L₁,L₂ in a symplectic W, form the nondegenerate Leray quadratic space after quotienting by R=(L₀∩L₁)+(L₁∩L₂)+(L₂∩L₀). The reduced Lagrangians are the images ((L_i∩R⊥)+R)/R in R⊥/R. For transverse pairs, express L₂ as the graph of T:L₁→L₀ and use q_T(y)=½ω(y,Ty), with the sign chosen to match Kudla’s cocycle formula.

Characteristic different from two; use the symplectic quotient by the isotropic R and quotient out the radical of the resulting quadratic form if needed.

API: On the transverse graph model its quadratic value is ½ω(y,Ty); A common symplectic isometry induces an isometry of Leray forms; The general triple is the transverse construction on its reduced symplectic quotient

Kudla96, I.3 pp.11–13 · needs `LV.3/lagrangian-symplectic-basis`, 2.1.

Tests: (1) L₀=L₁: the Leray form is zero; (2) ω(e₀,e₁)=1, L₀=Fe₀,L₁=Fe₁,L₂=F(e₀+e₁): q(y)=−y²/2; (3) L₀=L₁ transverse to L₂: R=L₀ is not contained in L₂, so (L₂∩R⊥)/R is undefined.

#### MP.2.4: Leray cocycle of intertwiners

For the unitary normalized integral operators r_Y(g), their factor set is c_Y(g₁,g₂)=γψ(L(Y,Yg₁⁻¹,Yg₂⁻¹g₁⁻¹))=γψ(L(Y,Yg₂⁻¹,Yg₁)). This obeys normalization and the two-cocycle identity because it computes actual operator composition.

Use Kudla’s right action on W and the same q-versus-polar-form convention as the index and Leray nodes; source convention conversion is explicit.

Kudla96, I.3 Theorem3.1 p.13 · needs 0.15, 1.3, 2.1, 2.3.

### Operators, character changes and uncertainty

#### MP.2.5: Weil operators on generators

In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w.

F is nonarchimedean, char≠2, b symmetric; the self-dual measure is fixed. χV,ψ depends on m parity and the signed discriminant. Source right-action matrices are used consistently.

Kudla96, I.2 pp.8–10; II.4 pp.35–39 · needs 1.7, 2.1, 2.2, `AL.0/local-fourier-inversion`.

#### MP.2.6: Generator relations and intrinsic comparison

The unipotent, Levi and Fourier operators satisfy their presentation relations with exactly the Rao central factors; their action is the intrinsic genuine representation obtained from the normalizer. In particular Fourier squared is reflection times its Weil scalar, and conjugating a unipotent by Fourier gives the opposite unipotent with its prescribed phase.

Use the same Weyl element, Haar measure, q and character as the generator theorem; the cover lift is part of the data.

Weil64, I.§13, printed160, PDF18; I.§14 relation(9), PDF19 · needs 2.5, 1.6, 2.2, 1.4.

#### MP.2.7: Character change and dual Weil models

For ψa(t)=ψ(at), compare the oscillator model with the one for the scaled symplectic form aω; if a=b² the coordinate scaling by b gives an intertwiner and theta modules are unchanged up to the stated group conjugation. Complex conjugation changes ψ to ψ⁻¹; the contragredient Weil action is the ψ⁻¹ action. On scalar-circle covers, the tensor product of two weight-one models needs λ₂⁻¹, and the dual model needs λ₂, to give scalar weight zero for the descended tensor and scalar weight one for the normalized dual.

a∈F×; for unitary models use continuous ψ and Hilbert dual/conjugate. The μ₂ cover and scalar-circle cover are distinguished.

Kudla96, I.1 p.5; II.4 Remark4.1 p.37 · needs 1.7, 2.5, 2.2.

#### MP.2.8: Quadratic uncertainty principle

Let (V,q) be a positive-dimensional nondegenerate quadratic space over nonarchimedean F, char F≠2, with conductor-zero ψ and self-dual Fourier transform. If φ∈S(V) has support in {q>0 in valuation, i.e. q∈p_F} and its Fourier transform has support in {q∈O_F}, then φ=0 identically. Corollary8.1.4 says that supp φ⊂{val q>0} and a scalar-multiple Fourier eigenfunction condition also force φ=0.

dim_F V>0. Let q(x)=(x,x)/2, V^int={x | val_F(q(x))≥0} and V^int_+={x | val_F(q(x))>0}, with val_F(0)=∞. F is nonarchimedean of characteristic ≠2 (residue characteristic 2 is allowed); ψ has conductor O_F and the Fourier kernel is ψ((x,y)) with self-dual measure. φ is locally constant and compactly supported, supp φ⊆V^int_+, supp φ̂⊆V^int. Positive dimension is necessary for the null cone to have empty interior; the zero space is excluded.

LZ22, Proposition8.1.2, Corollary8.1.4 PDF56–57 · needs 2.5, 2.6, `AL.0/local-fourier-inversion`.

#### MP.2.9: Hermitian uncertainty principle

For a positive-dimensional nondegenerate Hermitian space V over E/F with conjugation c, set q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F. Use the Fourier kernel ψ(Tr_E/F⟨x,y⟩) and its self-dual measure. If supp φ⊆{x | val_F⟨x,x⟩>0} and supp φ̂⊆{x | val_F⟨x,x⟩≥0}, then φ=0 by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩.

dim_E V>0; nonarchimedean F of characteristic ≠2 and the quadratic Hermitian extension/datum of Li–Zhang §8.1. Conductor-zero ψ, locally constant compactly supported φ, val_F(0)=∞ and exactly the strict/non-strict support cones above.

LZ22, Proposition8.1.6 PDF57–58 · needs 2.8, 3.3, `AL.0/local-fourier-inversion`.

#### MP.2.10: Hermitian oscillator normalizations

Compare the Hermitian Weil operators in Li–Liu22, Li–Zhang22B, Disegni–Liu24 and Zhang21 with MP.2: m(a) has the specified character and |det a|_E^{dim_E V/2}, n(b) has ψ(tr bT(x)), and w has γ_V^{rank} times the positive Fourier transform for the source’s chosen trace pairing. Zhang’s even quadratic formula uses χV(a)=(a,(−1)^{dim V/2}det q)_F. His AppendixA gives γ_V=η(det Hermitian V)ε(η,1/2,ψ)^{dim_E V} and the hyperbolic constant1.

Even dimension where descent is asserted; exact quadratic determinant versus polar determinant; each source’s w and group action converted before comparing signs.

LL22, §§2.1,3.1 PDF11,43–44; LZ22, §§1.7,8.1,12.3 PDF8–9,56,78–79; DL24, §4.1 H7 PDF40–41; Z21, §11.1 PDF70–71 and AppendixA PDF108–109 · needs 2.5, 2.2, 3.3, `AL.0/local-fourier-inversion`, `AL.2`.

## MP.3: Dual pairs and local theta modules

Library substrate: `IsArtinian`, `Representation.Coinvariants`, `Representation.Coinvariants.lift`, `Representation.Coinvariants.mk`, `Representation.IntertwiningMap`.

### Dual pairs, theta quotients and Howe duality

#### MP.3.1: Orthogonal–symplectic dual pair

Equip V⊗_F W with b⊗ω and map O(V)×Sp(W) to its isometry group by tensor action. The images commute and, for nonzero factors, centralize one another fully. Compute the product map’s scalar kernel; for a zero factor retain the map and actual kernel without an injectivity assertion.

char F≠2; finite-dimensional spaces; b and ω nondegenerate. The tensor-product map can have diagonal scalar kernel, so injectivity of the product map is not asserted.

API: The form evaluates on pure tensors as b(v,v′)ω(w,w′); The O(V) and Sp(W) actions commute on V⊗W; For nonzero factors the kernel is the simultaneous scalar pairs (aI,a⁻¹I) admitted by the two groups

Kudla96, II.1, PDF29–30, tensor orthogonal–symplectic pair · needs 0.8, `TC59`.

Tests: (1) V=F: Sp(W) acts by its defining representation; (2) V=0: the target and its isometry group are trivial; the product map need not be injective; (3) (−I,−I) acts trivially on V⊗W.

#### MP.3.2: Cover over orthogonal–symplectic pairs

The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m.

F is a characteristic-not-two local field; a nontrivial continuous ψ and compatible Haar measures are fixed. The orthogonal action is the specified splitting, not a uniqueness claim.

Kudla96, II.3 Corollary3.3, PDF36; cocycle comparison Proposition3.2 PDF35 · needs 3.1, 1.7, 2.2.

#### MP.3.3: Unitary dual-pair splittings

On the trace-symplectic tensor of ε-Hermitian V and −ε-Hermitian W over E/F, construct compatible scalar-cover splittings from χV|F×=ωE/F^dimV and χW|F×=ωE/F^dimW. Obtain ωψ,χV,χW, track character and ψ dependence, and prove independence of the auxiliary trace-zero δ for the fixed trace pairing.

Characteristic zero local F; E/F quadratic field or split étale algebra. Hermitian forms nondegenerate. Each splitting uses the matching dimension and character restriction.

API: Each splitting cochain cancels the pulled-back scalar cocycle; If χ is replaced by χη with η|F×=1, transport η to η̃:E¹→C× by η̃(x/xᶜ)=η(x). Changing χV twists the W-factor by η̃∘det; changing χW twists the V-factor by η̃∘det; For the fixed trace symplectic space and ψ,χV,χW, changing the auxiliary trace-zero δ leaves the splitting unchanged

GanIchino16, §4 local theta setup, arXiv-v2 PDF11–12; GQT, §2.9, equation(2.2), PDF13 · needs 1.3, 2.2, `TC59`.

Tests: (1) V=0: the oscillator line on U(W) has character χV∘ι⁻¹∘det; χV=1 gives the trivial line, while valid nontrivial χV can act nontrivially; (2) Reject χV unless χV|F×=ωE/F^dimV; (3) Changing valid splitting characters by η|F×=1 twists by η̃∘det, with η̃(x/xᶜ)=η(x).

#### MP.3.4: Big theta module

For commuting oscillator actions of G×H, define Θ(π)=(S⊗π∨)_G using smooth algebraic coinvariants. Admissibility and Schur’s lemma identify the maximal π-isotypic quotient with π⊗Θ(π). The commuting H action descends; π∨ is the smooth contragredient and central characters must match.

Nonarchimedean local field and the specified dual pair/splittings. π∨ is the smooth contragredient, not the full algebraic dual. The maximal-isotypic comparison uses admissibility and Schur’s lemma.

API: Linear maps from native tensor coinvariants are equivalent to invariant linear maps from the tensor product; the smooth G×H Hom comparison additionally needs the supplied smooth dual; If the H action commutes with the G tensor action, it sends each coinvariant relation into the coinvariant kernel; The maximal π-isotypic quotient of S is π⊗Θ(π)

Kudla96, II.2, PDF32–33, maximal isotypic quotient and its theta factor · needs 3.2, 3.3, `SR.0:abelian-category`, `SR.2`.

Tests: (1) Opposite common central actions on S and π give zero coinvariants; (2) G=1,π=C: the quotient is S with its H action; (3) Every equivariant S→π⊗σ factors uniquely through the maximal π-isotypic quotient.

#### MP.3.5: Small theta quotient

Define θ(π) as the maximal semisimple quotient of the finite-length big theta module in the source category. Under a stated Howe theorem, it is zero or irreducible. Define no arbitrary chosen irreducible summand when Howe duality has not been established.

The big theta module is finite length. The semisimple quotient and radical are imported from SR.0/SR.3; archimedean variants use AF.1.

API: The natural Θ(π)→θ(π) is surjective; θ(π) is semisimple in the supplied smooth category; Every linear map killing the chosen quotient submodule factors uniquely through the native quotient. Identifying that submodule as the maximal semisimple radical is a separate source obligation

GanTakeda16, §1 PDF1–2 · needs 3.4, `SR.0:abelian-category`, `SR.3`.

Tests: (1) The radical quotient of zero is zero; (2) An irreducible big lift projects isomorphically; (3) For a nonsplit 0→A→M→B→0 with unique simple quotient B, the semisimple quotient is B.

#### MP.3.6: Finite length of theta modules

For a nonarchimedean characteristic-zero type-I pair, prove Θ(π) admissible and finite length for irreducible admissible π. Supply separately the archimedean finitely generated admissible (g,K)-module analogue on the oscillator Harish-Chandra module, using its original theorem and AF.1 category.

The matched central character and source splittings are fixed. Generic admissibility, Jacquet exactness and finite-length criteria belong to SR.2/SR.3; Harish-Chandra modules belong to AF.1.

Kudla96, II.2 pp31–33, isotypic quotient and admissibility · needs 3.4, `SR.0:abelian-category`, `SR.2`, `SR.3`, `AF.1`.

#### MP.3.7: Howe duality

For a nonarchimedean orthogonal–symplectic or unitary type-I pair in characteristic ≠2, prove θ(π) zero or irreducible and nonzero θ(π)≃θ(π′) implies π≃π′, including dyadic residue fields. Quaternionic full duality requires its additional theorem beyond Gan–Takeda’s partial result. Over R or C use the separate original archimedean Howe theorem in the specified Harish-Chandra/globalization category.

The smooth representations are irreducible admissible and genuine where required. Gan–Takeda Theorem1.2 is the full orthogonal/symplectic/unitary theorem; its Theorem1.3 only gives scoped quaternionic conclusions. Archimedean Harish-Chandra modules/globalizations and Howe’s original theorem require AutomorphicFormsOnReductiveGroups:AF.1 and the original archimedean Howe theorem; no extension to arbitrary algebraic representations is asserted.

GanTakeda16, Theorem1.2 and(HD), PDF2; proof §§4–6 PDF9 onward; GI18, §2.2, arXiv-v3 PDF8; GS23a, §14.1–14.3, arXiv-v1 PDF50–51 · needs 3.5, 3.6, `SR.2`, `SR.3`, `AF.1`.

#### MP.3.8: Local see-saw identity

For a see-saw with compatible restrictions of one oscillator, identify Hom_H₁(Θ_G₁(π₁),π₂) with Hom_H₂(Θ_G₂(π₂∨),π₁∨) through the common oscillator Hom space. Give the tensor/dual conventions explicitly. This concerns big coinvariants; passage to small lifts requires semisimplicity and Howe hypotheses.

Smooth admissible modules; compatible restrictions of the same oscillator representation; archimedean version in AF.1.

Kudla96, IV.1 pp59–66, see-saw examples and oscillator Hom route · needs 3.4, `SR.0:abelian-category`, `SR.2`, `AF.1`, 2.7.

### Witt towers and first occurrence

#### MP.3.9: Persistence and stable range

In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas.

Nonarchimedean local F in Kudla’s stated odd-residue range; broader fields use the separately qualified nonvanishing sources.

Kudla96, III.4 Propositions4.1,4.3–4.5, PDF44–49 · needs 3.4, 3.6, `SR.2`, `SR.3`.

#### MP.3.10: First occurrence in a Witt tower

For a supplied tower V_r and π define the first-occurrence rank as the least r with ΘV_r(π)≠0, in WithTop N before nonvanishing is proved. Define the dimension index m_0+2r separately. Record the tower’s discriminant, Hasse invariant, anisotropic kernel and auxiliary splitting characters.

Tower supplied by QuadraticFormInvariants and classical groups; nonvanishing at a finite rank is a theorem input, not part of the definition.

API: For finite first occurrence r₀, ΘV_r₀(π) is nonzero; For r<r₀ the big lift is zero; The dimension index is m_0+2r₀ when r₀ is finite

SunZhu15, §1.5 PDF5–8 · needs 3.4, 3.9, `TC58`.

Tests: (1) ΘV₀(π)≠0 gives rank index 0 and dimension index m₀; (2) All lifts zero gives index ⊤; (3) Equal rank indices in towers of different anisotropic dimensions need not give equal dimension indices.

#### MP.3.11: Supercuspidal first occurrence

For supercuspidal π, at first occurrence the theta lift is supercuspidal; above it the big lift is irreducible admissible, equals the small lift and is not supercuspidal. Embed it in the normalized induction of the first lift with the tower characters of Kudla III.6 Theorems 6.1–6.2. The assertion does not extend to arbitrary π.

Nonarchimedean odd residue characteristic as in Kudla III; π irreducible supercuspidal, fixed tower and splittings.

Kudla96, III.6 Theorems6.1–6.2 pp52–53; proof sketch IV.3 pp70–74 · needs 3.10, 3.7, `SR.2`, `SR.3`.

#### MP.3.12: Kudla’s Jacquet filtration

For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb).

Gan–Takeda §2 conventions; normalized induction/Jacquet functor and modulus characters; the metaplectic Levi has its genuine χψ factor. Unipotent radicals split canonically.

GanTakeda16, Lemma3.1 PDF7–8 · needs 3.4, `SR.0:abelian-category`, `SR.2`, `SR.3`, 3.2, 3.3.

#### MP.3.13: Doubling principal-series filtration

For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s.

Gan–Takeda normalized induction conventions; actual group dimensions and ε-Hermitian type fixed.

GanTakeda16, Lemma3.2, PDF7–8, filtration of degenerate principal series · needs `SR.2`, `SR.3`, 3.3, 3.2.

#### MP.3.14: Type-II theta input

For the oriented split pair GL_m×GL_n, prove small theta zero or irreducible and injective on its nonzero domain. The unequal-rank parameter formula is an additional Mínguez input; it implies no general n<m vanishing.

Smooth irreducible representations; the pair orientation and normalized action are those of Gan–Takeda’s cited Mínguez theorem.

GanTakeda16, §3 proof strategy, PDF9, cited general-linear Howe input; original Mínguez theorem required · needs `SR.2`, `SR.3`.

#### MP.3.15: MVW involution and metaplectic induction

Transport smooth duals and normalized induction through the split Mp unipotents. The exact covariant MVW involution agrees with π∨ for irreducible π. On Levi GL_k×Mp_{2n−2k}, use τ̃ψ=(τ∘projection)⊗χψ, with central sign −1, as the genuine inducing datum. Archimedean variants require AF.1 and their own comparison.

Nonarchimedean characteristic-zero F for the smooth comparison; real Lie-group variants use AF.1 and their own proof. χψ is the Weil-index genuine character on the covered GL factor.

GI18, §5.2–5.3 PDF18–20, Lemma5.2 · needs 3.2, 2.2, `SR.0:abelian-category`, `SR.2`, `SR.3`, `AF.1`.

#### MP.3.16: Nonarchimedean conservation relations

For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V.

Characteristic-zero nonarchimedean F, including residue characteristic two; towers enhanced by their oscillator character; genuine π as in Theorem1.10.

SunZhu15, Theorem1.10 PDF8–10; §§5–6 · needs 3.10, 3.12, 3.13, 3.15, `TC58`, `SR.3`.

#### MP.3.17: Archimedean first-occurrence cases

For real/complex orthogonal U, the sign-related towers have first-occurrence dimension sum 2 dimU. For complex symplectic or real quaternionic Hermitian U, parity-compatible occurrence is ≤dimU or dimU+1, without a two-tower relation. For real symplectic, complex unitary or real quaternionic skew-Hermitian U, each K_U-coset has a distinct pair with sum 2 dimU+d; other pairs have sum ≥2 dimU+d|t₃−t₄|, and the two minima modulo 2K_U sum 2 dimU+d.

Irreducible admissible genuine Harish-Chandra/smooth representations with the enhancement of Sun–Zhu §7; no claim across inequivalent oscillator cosets.

SunZhu15, §7.2 Theorems7.1,7.3,7.6 PDF43–46 · needs 3.10, `AF.1`, 3.15.

#### MP.3.18: Unitary equal and almost equal rank

For tempered π of U(W_n) over a nonarchimedean characteristic-zero F, equal-rank theta to U(V_n^ε) is nonzero in exactly one sign, determined by ε(1/2,φπχV⁻¹,ψ₂^E)=εε′, and its parameter is φπχV⁻¹χW. For rank n+1, if χV is absent from φπ both signs are nonzero, while if χV occurs exactly one sign is nonzero; the lifted parameter is (φπχV⁻¹χW)⊕χW. In these stated tempered ranges the big nonzero lift is irreducible.

Auxiliary χ restrictions and ψ₂^E as in Gan–Ichino; LLC, component groups and epsilon factors are imported, supplied by the local Langlands theory.

GanIchino16, Theorems4.1 and4.4 PDF11–15 · needs 3.3, 3.7, 3.12, 3.16, `SR.3`, `ML.4`.

#### MP.3.19: Unitary doubling multiplicity and dichotomy

For Li–Liu Assumption 3.1’s rank-2r skew-Hermitian datum, prove the equal-rank two-choice dichotomy and doubling Hom multiplicity ≤1. Establish the required semisimplicity of the relevant big theta module separately; the scoped Gan–Ichino irreducibility result does not suffice.

Characteristic zero local fields, the exact relevant tempered representation and splitting data of Li–Liu; archimedean case uses AF.1.

LL21, Proposition3.6 PDF15–17 · needs 3.13, 3.7, 3.3, `AF.1`.

#### MP.3.20: Unramified metaplectic theta and induction

For odd-residue F and conductor-zero ψ, use the compact splitting to realize unramified genuine Mp₂n representations as constituents induced from χψ|·|^{s_i}, with ψ-relative parameter ⊕ᵢ(|·|^{s_i}⊕|·|^{−s_i}). Track the removed character pairs and modulus factors in the smaller odd-orthogonal tower vanishing and induction principles of Gan–Ichino Lemmas 6.3, 6.8, 6.10.

For almost tempered induction require |Re s_i|<1/2. The smaller-tower statements retain the exact lemma hypotheses; ψ changes act through its square class and the associated orthogonal-space scaling.

GI18, Remark5.3 PDF19–20; Lemmas6.3,6.8,6.10 PDF21,24–27 · needs 3.7, 3.12, 3.10, 3.16, 3.15, 2.7, `SR.3`.

#### MP.3.21: Rallis unramified theta parameters

Relate the spherical Hecke parameters of a nonzero theta lift by Rallis’s L-group map, including the dimension-dependent SL₂/principal-series segment. For Chenevier–Taïbi’s orthogonal–symplectic examples, distinguish this local relation from the global level-one multiplicity computation.

Unramified local datum, compatible integral lattices, ψ conductor zero, compact splitting and the exact source dimension/parity.

CT20, §5.3.2 PDF50; §5.4 PDF54–55 · needs 3.2, 2.5, `SR.3`, `AA.2`.

#### MP.3.22: Unitary theta Hecke compatibility

Construct Li–Liu’s surjective spherical Hecke map θ^R:H^R_W→T^R and factor the π character through it; the output character is χπ(s)^c. At their ramified odd places use K_r and the trace-self-dual lattice indicator, retaining the source compact and splitting conventions.

Exact Assumption3.1 and compact subgroups; rank2r Hermitian target. Ramified E/F has odd residue characteristic, ψ conductor O_F and the source’s trivial splitting characters.

LL21, Definition6.8, Proposition6.10 PDF31–32; Lemma11.1 PDF49–50; LL22, Definition3.2, Lemma3.3, Proposition3.4 PDF43–45 · needs 3.3, 3.4, `SR.3`, `AA.2`.

### Splittings for quaternionic similitudes

#### MP.3.23: Quaternionic similitude dual pair

For B=E⊕Ej, i²=u,j²=J, take right skew-Hermitian V with diagonal κ_i i and left Hermitian W=B. Give V⊗_B W its half-trace symplectic pairing. The subgroup ν(g)=ν(h)∈N(E×) in GU(V)^0×B× acts by g⁻¹v⊗wh. Use X with bases e_i⊗1,e_i⊗j and Y with e_i⊗i,e_i⊗ij.

Characteristic-zero local or global F; E embedded in B; nondegenerate forms; connected similitude factor and norm-image condition retained.

API: The pairing is half the reduced trace; Matched multipliers preserve the tensor pairing; X,Y span complementary Lagrangians

IP23, AppendixA.1, (A.1)–(A.2), arXiv-v2 PDF87–89 · needs 3.1, `TC58`, `TC59`.

Tests: (1) m=1: each Lagrangian has F-dimension 2; (2) m=0: the tensor space is zero; (3) Unequal multipliers rescale the pairing and fail symplectic isometry.

#### MP.3.24: Quaternionic similitude splitting

Construct s_v:G_v→C¹ with z_Y(g₁,g₂)=s_v(g₁g₂)/(s_v(g₁)s_v(g₂)). It obeys s_v(zg)=ξE_v(z)^m s_v(g), agrees with the standard compact splitting almost everywhere, and ∏v s_v(γ)=1 for γ∈G(F). This splits the scalar-circle cover on the norm-image subgroup; no μ₂ splitting is inferred.

AppendixA.1 datum; global ψ trivial on F for the product assertion; compatible local measures.

API: The cochain cancels z_Y in the stated quotient direction; Central scalars give ξE(z)^m; The result is independent of α and auxiliary χ

IP23, PropositionA.1 and §§A.2–A.7 PDF89–99 · needs 3.23, 1.3, 2.2, `TC58`.

Tests: (1) s_v(1)=1; (2) Odd rank and ξE(z)=−1 give scalar action −1; (3) Rational γ gives product of local values 1.

#### MP.3.25: First doubled quaternionic splitting

On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case.

AppendixA.2–A.3 bases and Bruhat index; α∈E¹.

IP23, AppendixA LemmasA.3–A.4, PDF90 · needs 3.23, 2.4, `TC58`.

#### MP.3.26: Second doubled quaternionic splitting

For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B.

Exact embeddings ι and bases of §§A.4–A.5; χ|F×=ξE, α∈E¹.

IP23, AppendixA LemmasA.5–A.7, PDF92 · needs 3.3, 3.23, 2.2.

#### MP.3.27: Sharp splitting and norm-one descent

On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1)). Define μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀), so z_{Y□}=z_{V△}δμ. Put s^sharp=ŝ^sharp·μ and s₂=ŝ₂·μ on their respective embedded groups. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary χ.

Exact α lift of the common norm multiplier and polarization σ₀.

IP23, AppendixA LemmasA.8–A.12, PDF93–96 · needs 3.25, 3.26, 2.4.

#### MP.3.28: Quaternionic see-saw and Periods-II comparison

For an orthogonal sum V=V′⊕V″ with matched similitude triple, s=s′s″ on the see-saw restriction. In rank-one Periods-II conventions, s^natural(α,h)=s(α,h)χ(α)⁻¹.

Compatible polarizations, ψ and χ; exact norm-image subgroups and components.

IP23, AppendixA.8 LemmaA.13, PDF97 · needs 3.24, 3.27, 3.8.

#### MP.3.29: Periods-I splitting comparison

For m=2, V=B₁⊗E B₂, J₁J₂=J, κ₁=1, κ₂=−J₁, the ratio ζ=tilde s/s is an automorphic character. If F is totally real, E totally imaginary and B₁,B₂ split at one common real place, ζ=1 at every local place.

All global hypotheses of A.14, including the common split real place.

IP23, AppendixA PropositionA.14, equations(A.9)–(A.11), PDF98–99 · needs 3.24, 3.25, 3.26, `TC58`, 3.30, 3.31, 3.32.

#### MP.3.30: First scalar splitting calculation

For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding.

Rank-two Periods-I datum and exact embeddings.

IP23, AppendixA LemmasA.15–A.17, PDF100–104 · needs 3.27, 2.2, 3.24, 3.25, 3.26.

#### MP.3.31: Second scalar splitting calculation

For α=a+bi with a,b≠0, tilde s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹],1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding.

Rank-two datum; both a,b nonzero before continuous extension.

IP23, AppendixA LemmasA.18–A.20, PDF104–106 · needs 3.27, 2.2, 3.24, 3.25, 3.26.

#### MP.3.32: Square quaternion splitting calculation

When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).

Specified square roots and the global real-place argument of A.14.

IP23, AppendixA LemmasA.21–A.23, PDF106–108 · needs 3.27, 3.24, 3.25, 3.26.

#### MP.3.33: Harris–Kudla splitting comparison

For split B and idempotent e, V†=Ve,W†=eW have dimensions 2m,2 and V† diagonal (κ_i u/2,−κ_i/2). Set s†(h)=ξE(x(h))^m(γ′)^−j(h), with γ′=γ_F(ψ/2)^{2m}γ_F(detV†,ψ/2)Hasse(V†). Extend via h d(ν(h))⁻¹; the polarization correction gives s₀=s†μ₀=s.

Exact split quaternion idempotent and bases; norm-image multipliers; source quadratic determinant.

IP23, AppendixA LemmasA.24–A.27, PDF108–115 · needs 3.24, 3.27, 2.2, 3.1.

### Concrete local theta correspondences

#### MP.3.34: Similitude theta correspondence

For the matched multiplier subgroup R⊂G×H⁺, compactly induce the extended oscillator to Ω=c-Ind_R^{G×H⁺}ω. Prove finite-length big quotients, and, for Ichino–Prasanna’s classical pairs, small theta zero or irreducible and injective on its nonzero domain. H⁺ is the multiplier-image subgroup.

Characteristic-zero local F; isometry-group Howe, Clifford and compact-induction inputs; AF.1 at infinity.

IP23, §7.2 and Lemma9.3 arXiv PDF41–42,50–52 · needs 3.7, 3.16, `SR.2`, `SR.3`, `AF.1`, 3.24.

#### MP.3.35: Real discrete-series theta lifts

For ψ_R(t)=exp(2πit), k≥2 and holomorphic SL₂(R) discrete series of weight k+1, theta to O(4,2) restricts to the identity component as A_q₀(0,0,k−2), while its dual lifts as A_q₁(k−2,0,0). q₀ has Levi so(4)+so(2); q₁ has Levi so(2)+so(2,2) and minimal K-type(k,0,0). To O(0,6) the holomorphic lift has highest weight(k−2,0,0), and the dual lift is zero.

Positive ψ; exact root basis, components and cohomological induction conventions of the source.

IP23, §7.2.1–7.2.2 arXiv PDF41–42 · needs 3.7, 3.10, `AF.1`, 2.7.

#### MP.3.36: Quaternionic unramified theta lift

In Lemma9.4’s odd-residue unramified E/F, split B, self-dual V^dagger and conductor-zero ψ setup, an unramified H^+ constituent of normalized GL₂ induction χ₁⊗χ₂ lifts to the GSO(3,3)-form constituent induced from (χ₁χ₂⁻¹ξE)⊗|·|⊗((χ₂|·|⁻¹/²)∘N_{E/F}), on the source’s torus coordinates.

Norm-image subgroup, exact Borel and integral splitting.

IP23, Lemma9.4 arXiv PDF53 · needs 3.33, `SR.3`, `AA.2`.

#### MP.3.37: Rank-one oscillator constituents

Split the rank-one oscillator on S(F) into even and odd parts ρψ⁺,ρψ⁻. In the split O₃ normalization use the conjugate oscillator: Θ(ρ̄ψ⁻)=St⁻ and 0→St⁺→Θ(ρ̄ψ⁺)→1→0. The even big lift is this extension; its small lift is 1.

Characteristic-zero nonarchimedean F and Gan–Savin’s ψ and O₃ extensions of the Steinberg representation.

GS23a, §8.4 PDF26–28; §11.4 with conjugate-oscillator normalization · needs 3.4, 3.5, 3.12, 2.7.

#### MP.3.38: GL₂–GSO₄ theta correspondence

For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma13.2’s action convention.

Characteristic-zero nonarchimedean F, generic irreducible π and compatible similitude oscillator action.

GS23a, Lemma13.2 PDF40–41 · needs 3.7, 3.12, `SR.3`, 3.34.

#### MP.3.39: Minimal orthogonal theta lift

For split SO₂n, n=5,6, the trivial SL₂ big lift is the minimal Π_n, with irreducibility supplied by Yamana. The Π_n lift of tempered G₂ representations has finite length. Under Sp(V₂)×Sp(V₆)→SO(V₂⊗V₆), the specified see-saw Hom module is Hom_{Sp(V₂′)}(Θ′(σ),1), finite length as an Sp(V₂)-module. This is not finite-dimensionality of the entire Hom space.

Characteristic-zero nonarchimedean F, split forms n=5,6 and the exact minimal-representation realization. π is tempered where Proposition14.2 requires it; σ is the stated irreducible Sp(V₆) representation. Exceptional representations are supplied by their owner.

GS23a, §14.2 Proposition14.2 and §14.3, arXiv-v1 PDF50–51 · needs 3.6, 3.8, `SR.3`.

#### MP.3.40: Division ternary theta lift

For supercuspidal ρ of PGL₂(F) and division B, take JL(ρ) on PB×≃SO(B₀,N). Its rank-one lift θψ(JL(ρ)) is nonzero irreducible genuine supercuspidal, with the source ψ and splitting. The exceptional G₂ lift belongs elsewhere.

ρ is supercuspidal on PGL₂, and the exact ψ and splitting normalization in §15.1 is used. No claim is made for all irreducible representations of PB×.

GS23a, §15.1 preceding Lemma15.4, arXiv-v1 PDF54 · needs 3.7, 3.10, `TC58`, `ML.4`.

#### MP.3.41: PGSp₆–PGSO₈ similitude theta

For generic irreducible σ of PGSp₆, prove its PGSO₈ similitude lift nonzero. If σ_b occurs on Sp₆, its SO₈ lift occurs in the restriction with standard parameter φ_b⊕1. Unramified Satake uses Spin₇→Spin₈ and std₈|Spin₇=1⊕std₇, together with the spin restrictions.

Characteristic-zero nonarchimedean F; generic σ; exact LLC/Satake conventions and multiplier subgroup.

GS23b, §4.2 PDF17–18 · needs 3.7, 3.21, 3.34, `SR.3`, `ML.4`.

#### MP.3.42: PGSp₆ theta dichotomy

Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5,1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case.

Characteristic-zero nonarchimedean F, the source’s two discriminant-compatible orthogonal towers.

GS23b, §12.2 PDF34–35 · needs 3.16, 3.10, 3.34.

#### MP.3.43: Relevant unitary local dichotomy

For a relevant tempered L-representation π_v in Disegni–Liu’s rank n=2r setting, there is a unique rank-n Hermitian space V_πv for which theta is nonzero, for every embedding L→C. Its lift is tempered irreducible admissible and the double-theta Hom recovers π_v. Keep the stated semisimplicity/irreducibility reference gate separate from Howe duality.

Nonarchimedean places, exact relevance and coefficient-field hypotheses of §4.1; specified ψ,χ and Hermitian invariant.

DL24, Lemma4.1 arXiv PDF41 · needs 3.3, 3.7, 3.18, 3.19.

#### MP.3.44: Rationality of local theta lifting

For relevant π, let U_π be the finite set of places where π_v is not fixed by every similitude conjugation †a. Define Q_π from {a∈Ẑ×:a_v∈N(E_v×) for v∈U_π}. For σ∈Aut(C/Q_π), prove θ(σιπ_v)≃σθ(ιπ_v); changing ψ to ψ_a changes π to π^{†a}, removed by the norm/symmetry condition.

Exact coefficient field L and embeddings; finite nonsymmetric set so the subgroup is open; class-field construction is imported.

DL24, Lemma4.5 and (4.2) arXiv PDF42 · needs 3.43, 2.7, `AL.0`.

## MP.4: Adelic metaplectic covers and finite Weil representations

Library substrate: `TauCeti.FactorSet.rescaleEquiv`.

### Restricted products and rational splitting

#### MP.4.1: Unramified compact splittings

For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places.

The lattice is integral self-dual for the specified ψ-pairing; no assertion of this splitting over every dyadic maximal compact.

Weil64, III.§36, printed186–187, PDF44–45 · needs 1.6, 2.5, `AL.0/local-fourier-inversion`.

#### MP.4.2: Adelic metaplectic cover

Take the restricted product ∏′_v Mp(W_v) relative to the distinguished integral splittings at good finite places. Its central restricted subgroup is the finite-support product ⊕_v μ₂. Quotient by the subgroup {ε:∏_v ε_v=1} to obtain Mp(W)(A), with exact projection to Sp(W)(A) and a single μ₂ kernel. Equip it with the quotient topology and local compactness inherited from the restricted product.

Global field char≠2 with the characteristic-zero source used for number-field assertions; finitely many bad places retained; topological restricted-product input from AA.1.

API: A supplied group projection descends through the native quotient when the quotient subgroup lies in its kernel. The restricted-product topology and μ₂ kernel require source data; A specified homomorphism into the group followed by the native quotient map gives the local-to-global adapter; A finite collection of local central signs has global value their product

Weil64, III.§§37–38, printed187–189, PDF45–47; IV.§42 for the twofold reduction · needs 4.1, 1.6, `AA.1`.

Tests: (1) Two local central −1 signs give the global identity; (2) One local central −1 remains nontrivial; (3) Every central representative equals a single-place sign modulo the product-one subgroup.

#### MP.4.3: Weil product formula

For a nondegenerate quadratic form q over a global field F and the factorizable additive character ψ of A/F with compatible self-dual measures, γψ_v(q_v)=1 almost everywhere and ∏_vγψ_v(q_v)=1. This is the analytic Weil-index product formula; local Hilbert/Hasse formulas are its local adapters.

F has char≠2; every dyadic and archimedean factor included. Character is trivial on F and Haar measures are globally compatible.

Weil64, II.§30 Proposition5, printed179–180 · needs 2.1, `AL.0/adelic-poisson-summation`, `TC58`.

#### MP.4.4: Rational symplectic splitting

The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization.

Global ψ trivial on F; rational symplectic space and a compatible adelic Schrödinger realization.

API: Projection of the rational lift is the diagonal adelic symplectic element; The rational lift is a group homomorphism; Changing rational polarization conjugates the model and preserves the lift

Weil64, III.§40, printed190–193, PDF48–51; §41 rational invariance · needs 4.2, 4.3, 2.4, `AL.0/adelic-poisson-summation`.

Tests: (1) Rational identity maps to adelic identity; (2) Rational Fourier generator preserves theta summation by Poisson; (3) A single-place sign change generally breaks theta preservation.

#### MP.4.5: Adelic Weil representation

Construct the global oscillator action on S(X(A))=S(X_∞)⊗(∏′_{v finite}S(X_v)), the algebraic finite-place restricted tensor product with standard lattice indicators and the full joint archimedean Schwartz space. Pure tensor operators use the product of local Weil actions; the product-one central subgroup acts trivially, so the action descends to Mp(W)(A).

Number field, global ψ, finite-dimensional rational X and compatible polarizations/measures. The archimedean space is the joint Schwartz space, not merely the span of products over individual real/complex places.

API: On a factorizable vector, each local operator acts on its own factor; The single adelic central −1 acts as scalar −1; Changing the global additive character gives the scaled quadratic/symplectic datum with compatible local operators

Weil64, III.§§38–39, printed188–190, PDF46–48 · needs 4.2, 4.4, 1.7, `AL.0/adelic-schwartz-bruhat-space`, `AL.0/local-schwartz-bruhat-space`.

Tests: (1) At good places, the integral compact splitting fixes the standard indicator; (2) Two local central −1 operators cancel on pure tensors; (3) The archimedean carrier includes joint Schwartz functions outside finite sums of one-coordinate products.

#### MP.4.6: Adelic choice compatibility

Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula.

The changed local choices agree at almost all places or have explicitly transported reference compacts; no unrestricted infinite rescaling.

Weil64, III.§§38–40, printed188–193, PDF46–51 · needs 4.2, 4.5, 4.4, 2.7.

### Finite and function-field interfaces

#### MP.4.7: Finite Weil representation

For an even integral lattice L with discriminant module D=L∨/L, realize C[D] as the finite adelic Schwartz subspace S_L supported on Lhat∨ and periodic under Lhat. Restrict the adelic Weil action along the rational lift whose real component is γ̃∈Mp₂(Z). In the AGHMP convention this is ω_L, while the frequently cited ρ_L is its complex conjugate. Since ψ_Q is trivial on Q and ψ_Q,∞(q)=exp(2πiq), ψ_Q,f(q)=exp(−2πiq). Thus T in ω_L multiplies e_μ by exp(−2πiq(μ)); in ρ_L it multiplies by exp(2πiq(μ)). S in ω_L has the positive discriminant-pairing exponential and the conjugate of the usual ρ_L Weil phase, namely it is the discriminant-pairing finite Fourier transform with the signature/Weil phase dictated by ψ.

Nondegenerate even lattice, ψ_Q with positive real exponential and globally compatible finite character; discriminant form and signature imported from IntegralLattices.

API: T e_μ=exp(−2πiq(μ))e_μ in ω_L; ρ_L has the positive exponent; In ω_L, S uses exp(2πi(μ,ν))/sqrt(|D|), multiplied by its specified Weil phase. Conjugation gives the negative pairing exponential and conjugate phase in ρ_L; ρ_L is the complex conjugate of ω_L; T exponents change sign; Construct the diagonal native linear operator with negative quadratic exponential on D→ℂ; Construct the native finite Fourier linear operator with positive pairing exponential and specified Weil phase

AGHMP18, §4.7 published452–453, PDF62–63 · needs 4.5, 4.4, 2.5, `TC47`.

Tests: (1) On a singleton with q=0, T=id; retain the S signature phase; (2) q(μ)=1/4: T eμ=−i eμ in ω_L and +i eμ in ρ_L; (3) On Unit with zero pairing and phase 1, S=id.

#### MP.4.8: Function-field metaplectic programme

Lafforgue §14 sketches a conditional extension of shtuka excursion constructions to metaplectic groups: replace ordinary geometric Satake by its metaplectic version and use the modified dual group and gerbe/twisting data of (14.1)–(14.5). Record this as a programme with explicit missing hypotheses and constructions, not as a proved metaplectic global Langlands theorem.

Function field, a covering/gerbe datum and the required metaplectic Satake equivalences, fusion and shtuka sheaves supplied. The section’s indications and remarks are not a full proof.

Laf18, §14, Remarks14.1–14.2, (14.1)–(14.5), arXiv-v10 PDF169–173 · needs `GS3`, `GS.5`, 4.2, `GS3:fusion/fusion-product-and-sign-rule`, `GS.5/excursion-operator`, `GS.5/the-excursion-algebra`.

## MP.5: Global theta kernels and genuine automorphic forms

### Theta series, growth and automorphic lifts

#### MP.5.1: Theta kernel

For a rational polarized symplectic space W with configuration space X, define θφ(g)=Σx∈X(F)(ωψ(g)φ)(x), φ∈S(X(A)). For a split dual-pair realization write θ(g,h;φ) for its pullback. This is a genuine function on Sp(W)(F)\Mp(W)(A), with the rational subgroup embedded by the canonical splitting; the nontrivial global central sign acts by −1. On an even orthogonal dual pair the pulled-back kernel is linear in the symplectic factor.

Number field, characteristic-zero source, compatible ψ and self-dual measures; actual joint archimedean Schwartz functions. For a dual pair its splitting characters are fixed.

API: The kernel is the rational sum of the transformed Schwartz function; The sum is invariant under an element whose action on the same function representation reindexes by an explicit bijection; the canonical rational lift must be identified with this action; θφ(zg)=−θφ(g) for the global central z=−1

Weil64, III.§41 Théorème6, printed193–194, PDF51–52 · needs 4.5, 4.4, `AL.0/adelic-poisson-summation`.

Tests: (1) X=0: the rational sum has one term; (2) Rational Fourier generator preserves the sum with covolume 1; (3) Nonzero genuine θφ cannot descend to Sp(W)(A).

#### MP.5.2: Theta smoothness and growth transfer

The theta kernel is smooth at infinity, locally constant at finite places, and every archimedean differential operator can be applied termwise on compact subsets. On the specified adelic Siegel sets its derivatives satisfy a common polynomial height bound for each finite Schwartz seminorm family. With fixed finite level and finite K-type this gives uniform moderate growth in the AF.2 sense, after comparison of the cover height with the base-group height.

Number field; finite-dimensional quadratic/symplectic datum; fixed finite-level vector and K-type where an automorphic-form space requires them. The height, central-character restriction and Schwartz seminorms must be matched to the supplier.

Weil64, III.§41 Lemmas4–5 and compact normal convergence, printed193–194, PDF51–52 · needs 5.1, `AA.3/adelic-siegel-set`, `AA.3/siegel-covering-adelic`, `AA.3/height-siegel-estimate`, `AF.2/automorphic-forms-uniform-growth`.

#### MP.5.3: Genuine automorphic spaces

Inside smooth finite-level functions on Sp(W)(F)\Mp(W)(A), take the subspace of infinitesimal-character-finite, uniformly moderate-growth functions f with f(zg)=−f(g), using AF.2’s fixed central-character convention. Its cuspidal subspace has vanishing constant term along every proper rational parabolic, computed through the canonical unipotent splitting. Following GQT §2.10, this smooth space imposes no K-finiteness and carries the full right G(A)-action. Its K-finite part is instead a (g,K)-module with the finite-adelic action; full real-group translation is not claimed to preserve K-finiteness.

Use the actual adelic cover, rational splitting and AF.1–3 analytic conventions; require the same split-center/central-character normalization as the base automorphic space.

API: Elements evaluate as functions on the actual cover quotient; Right translation preserves the smooth genuine automorphic and cusp subspaces. The K-finite part is stable under its (g,K) and finite-adelic actions; Membership in the cusp subspace is the vanishing of all proper parabolic constant terms

Weil64, III.§41 Théorème6, printed193, PDF51; AF.2/3 supplies finiteness and growth conditions; GQT, §2.10, arXiv-v3 PDF13 · needs 4.2, 4.4, 5.2, `AF.1`, `AF.2`, `AF.3`.

Tests: (1) Zero belongs to the automorphic and cusp spaces; (2) A genuine function descending to the base group is zero; (3) Translation preserves the central sign equation.

#### MP.5.4: Unipotent splittings

Each rational unipotent subgroup U of Sp(W) has the canonical continuous splitting in the local and adelic metaplectic double cover, compatible with conjugation and the rational splitting. On the Siegel unipotent this is the phase-multiplication operator. Uniqueness is in the characteristic-zero unipotent setting and follows from absence of nontrivial continuous μ₂-valued characters.

Characteristic zero; the unipotent subgroup and cover topology are fixed.

Kudla96, I.6 Lemma6.3, PDF25–26 (unique unipotent lift); compare I.6 formulas PDF26–27 · needs 1.6, 2.5, 4.4.

#### MP.5.5: Metaplectic constant terms and Whittaker coefficients

For a continuous genuine automorphic f, a rational unipotent U, and a unitary character η on U(F)\U(A), define W_U,η(f)(g)=∫U(F)\U(A) f(ũg)η(u)⁻¹du using the canonical splitting and probability quotient Haar. The trivial η gives the constant term. Right translation and differentiation commute with the integral under the AF.3 regularity hypotheses; central genuineness is retained.

U(F)\U(A) compact; η trivial on rational points; f smooth for derivative assertions. Fourier expansion requires the appropriate abelian U and the supplier’s convergence topology.

API: The trivial-character coefficient equals the constant term; Coefficient extraction commutes with right translation; The coefficient is genuine in its remaining cover variable

Weil64, III.§41 Théorème6, printed193, PDF51 (theta realization); AA.1 and AF.3 supply the quotient-integral API · needs 5.3, 5.4, `AF.3/constant-term`, `AA.1`, `AL.0`.

Tests: (1) U=1: the coefficient is f(g); (2) On compact abelian U with probability measure, f=η has η coefficient 1; (3) A distinct unitary character has η coefficient 0.

#### MP.5.6: Global theta lift

For a dual pair G,H, define θφ(f)(g)=∫[H] θ(g,h;φ) conjugate(f(h))dh whenever the displayed product is absolutely integrable. Its span is the global theta-lift module; the oscillator splitting fixes its central character and equivariance. If f is cuspidal with the required unitary central character, AF.3 rapid decay combined with the theta-growth estimate supplies convergence in the source’s permitted range.

Quotient and measure normalized as in GQT; use either anisotropic H, the convergent range, or a cusp/decay bound proved sufficient. No arbitrary regularized value is substituted for a divergent integral.

API: The lift evaluates by the integrable theta pairing; Right translation acts through the kernel’s two commuting actions; The output central character is determined by the chosen oscillator splitting and input character

GQT, §11.1, PDF52, cuspidal theta lift; §2.11 PDF13 gives the kernel · needs 5.1, 5.2, 5.3, `AF.3/cusp-form-rapid-decay`, `AA.3`.

Tests: (1) Zero input or Schwartz vector gives zero lift; (2) Unit with Dirac measure gives θ(g,())conj(f(())); (3) A nonintegrable native Bochner integral defaults to zero but fails the theta-lift integrability contract.

#### MP.5.7: Weil convergence criterion

For the GQT type-I datum with dim_E V=m=m₀+2r, dim_E W=n, ε₀∈{−1,0,1}, d(n)=n+ε₀, the theta integral of every Schwartz vector over H(V)(F)\H(V)(A) converges absolutely if r=0 or m−r>d(n). The borderline and second-term cases require the regularized construction. This is a criterion for the theta integral, not for the pointwise rational theta sum.

Number field; GQT §2 groups, splitting characters and Tamagawa measure; the exceptional split O(1,1) normalization is retained.

GQT, §3.1, PDF14, Weil convergent range · needs 5.1, 5.2, `AA.3`, `AA.1`.

#### MP.5.8: Regularized theta integral

In the GQT nonconvergent range r>0, m−r≤d(n), r≤n, choose a compatible regularizing Hecke/central operator z making ω(z)φ rapidly decreasing and acting on the normalized auxiliary H-Eisenstein series E_H(s,h) by P_z(s). Define B_{n,r}(s,φ)=1/(τ(H)κ_r P_z(s)) ∫[H] θ(g,h;ω(z)φ)E_H(s,h)dh. It is independent of the admissible regularizer, meromorphic, and satisfies the source functional equation. Laurent coefficients B_k at ρ_H=(m−r−ε₀)/2 retain the source’s indexing.

GQT datum; E_H normalized from the parabolic |det|^s; κ_r its residue/constant normalization. For split O(1,1), κ_r=2 and ρ_H=0.

API: The meromorphic family is independent of the admissible z; In a matched convergent case its specified coefficient equals the ordinary theta integral; B_k is the coefficient of (s−ρ_H)^k with no reindexing

GQT, §§3.2–3.7, PDF14–18; definition §3.5 and functional equation(3.7) · needs 5.7, 5.1, `AS.1`, `AS.2`, `AA.1`.

Tests: (1) Zero Schwartz vector gives zero family; (2) Scaling z by a nonzero scalar scales numerator and P_z equally; (3) Split O(1,1): κ_r=2 at ρ_H=0.

### Extended Schwartz spaces and unit quotients

#### MP.5.9: Extended Schwartz Weil action

For a totally real F and even-dimensional positive-definite (V,q), form the YZ extended adelic space in (x,u)∈V(A)×A×. At finite places use locally constant compactly supported functions; at real places use (P₁(uq(x))+sgn(u)P₂(uq(x)))exp(−2π|u|q(x)), where P₁,P₂ are complex polynomials in the one real argument uq(x). The action of GL₂(A)×GO(V)(A) extends the usual even oscillator action and rescales the u variable by the similitude multiplier.

YZ published §6.1 exact extended real test class P₁,P₂∈C[t], evaluated at uq(x); u≠0; GL₂/GO matched action and quadratic character conventions.

API: A similitude transports the u parameter with the source’s multiplier convention; At u=1 and in the isometry subgroup the usual even oscillator action is recovered; The real factors have the displayed polynomial-times-Gaussian form

YZ18, Published §6.1, printed578–579, PDF46–47; recalled definitions originate in YZZ13 §§2.1.3,4.1 · needs 4.5, 3.2, `AL.0/local-schwartz-bruhat-space`, `AL.0/adelic-schwartz-bruhat-space`.

Tests: (1) Zero polynomial data give zero vector; (2) u<0 reverses the P₂ contribution; (3) P₁=1,P₂=0,u=1 gives exp(−2πq(x)).

#### MP.5.10: Unit-quotiented theta series

For extended φ invariant under a finite-index unit subgroup μ via (x,u)↦(αx,α⁻²u), define θ_μ(g,φ)=Σu∈μ²\F× Σx∈V(F) r(g)φ(x,u). The ±1 stabilizer normalization is w_K=|{±1}∩K|. With the exact real test class, the series is normally convergent and transforms under GL₂(F) and the prescribed finite-level GO action as in YZ published §6.1.

YZ totally real positive-definite even V; finite-index unit subgroup preserving φ; compact level K; retain u-orbits and w_K.

API: The term is independent of the μ²-orbit representative after the simultaneous x substitution; The series satisfies the stated GL₂(F) transformation; w_K is1 or2 according to −1∈K

YZ18, Published §6.1, printed578–579, PDF46–47 · needs 5.9, 5.1, `AA.3`.

Tests: (1) Zero test function gives zero series; (2) A level containing −1 has w_K=2; (3) The constant sequence 1 indexed by Z is not summable; unit orbits must be quotiented.

#### MP.5.11: Extended restriction comparison

For V₁⊂V nondegenerate even-dimensional spaces of dimensions d₁,d, restrict a standard tensor test vector along V₁ and compare its transformed restrictions. In the finite-place normalized model the modulus ratio is δ(g)^((d−d₁)/2), where δ(diag(a,d))=|a/d|^{1/2}; at infinity include the prescribed ρ(g) power. The quadratic-character/Weil-index ratio must also be retained unless the two splitting characters agree.

YZ published §6.2 standard complementary Gaussian/indicator; explicit common splitting characters for any statement containing only the modulus factor.

YZ18, Published §6.2, printed580–581, PDF48–49, restriction formula preceding(6.2.1) · needs 5.9, 2.5, 2.2.

### Ideal-class theta and Eisenstein families

#### MP.5.12: Ideal-class theta series

For K=Q(√D), negative fundamental discriminant D, ideal class A and w=|O_K×|, define θ_A(z)=1/w+Σn≥1 r_A(n)exp(2πinz). Equivalently, for an integral ideal a∈A, θ_A(z)=(1/w)Σλ∈a exp(2πiN(λ)z/N(a)); the latter first counts A⁻¹, and conjugation identifies its coefficients with A. The series is independent of a and normally convergent on the upper half plane.

D<0 fundamental; actual ideal-class/norm arithmetic supplied by GN.3; z in the native upper half plane.

API: The positive n coefficient is r_A(n); The constant coefficient is1/w; The w-normalized lattice sum equals the ideal-count series

GZ86, I.§5(5.2), printed229, PDF6; IV.§1(1.1), printed270, PDF47 · needs 5.1, `TC47`.

Tests: (1) K=Q(i): w=4, constant coefficient 1/4; (2) A and A⁻¹ give equal series; (3) Changing the excluded norm-index coefficient at zero does not alter the series.

#### MP.5.13: Ideal-class theta modularity

θ_A is holomorphic of weight1 on Γ₀(|D|) with Nebentypus ε_D: θ_A(γz)=ε_D(d)(cz+d)θ_A(z), and it is holomorphic at every cusp. This holds for every negative fundamental D; the explicit all-SL₂(Z) transformation node below is restricted to odd D.

Negative fundamental D; γ∈Γ₀(|D|); source lattice and character conventions.

GZ86, IV.§1 after(1.1), printed270, PDF47 · needs 5.12, 2.5, 4.4, `TC53`.

#### MP.5.14: Ideal-class theta conjugation

For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}.

Imaginary quadratic K; the ramified ideal is the one in GZ Lemma2.3.

GZ86, IV.§2 proof of Lemma(2.3), printed275, PDF52 · needs 5.12.

#### MP.5.15: Ideal-class theta transformation

For odd negative fundamental D=D₁D₂, δ_i=|D_i|, γ=[[a,b],[c,d]]∈SL₂(Z) with gcd(c,|D|)=δ₂, and c* inverse to c modulo δ₁ chosen0 modulo δ₂, (θ_A|₁γ)(z)=ε_{D₁}(c/δ₂)ε_{D₂}(d)κ(D₁)⁻¹δ₁⁻¹/²χ_{D₁,D₂}(A)θ_{A D₁}((z+c*d)/δ₁). Here κ(D₁)=1 or i by its sign, and D₁ also denotes the class of the ideal of normδ₁ only in the last subscript. Use SL₂, correcting the printed PSL₂ because weight1 detects −I.

D odd squarefree, D≡1 mod4; D_i fundamental with1 allowed; c* convention and exact genus character; no even-discriminant extension asserted.

GZ86, IV.§2 Lemma(2.3), printed274, PDF51; proof275, PDF52 · needs 5.12, 5.14, 6.21, `TC58`.

#### MP.5.16: Genuine Eisenstein families

For a rational parabolic of Mp(W), an actual genuine Levi cuspidal datum and a normalized section in its covered induced representation, define E(g,s,F)=Σγ∈P(F)\Sp(W)(F)F_s(γg) in a proved absolute-convergence chamber. The rational/unipotent splittings are canonical; the covered Levi and genuine inducing character are retained. The span of the continued families/residues is an Eisenstein space only after the cover-specific intertwining/constant-term comparison is established.

Specified covered parabolic, genuine Levi representation, actual section and source-qualified convergence chamber; no automatic linear reductive-group continuation theorem.

API: In the verified chamber the value is the rational coset sum; The inducing central sign is retained in E; Its constant term is expressed by the specified normalized cover intertwiners

GQT, §§5.3,6.1–6.2, PDF25,28; pole statement Proposition6.1 excludes O(1,1) · needs 5.3, 5.4, 3.15, 4.4, `AS.1`, `AS.2`.

Tests: (1) Zero section gives zero family; (2) Nonzero genuine family does not descend; (3) A singleton coset sum of value 3 is 3; the actual section supplies its Siegel parameter.

## MP.6: Siegel–Weil, Rallis, see-saw and Jacobi interfaces

Library substrate: `MeasureTheory.integral_prod`, `MeasureTheory.integral_prod_symm`, `SemidirectProduct`.

### Measures, sections and the Siegel–Weil identities

#### MP.6.1: Theta measure conventions

Match self-dual additive, restricted-product and quotient measures; write I=τ(H)⁻¹∫[H]θ and π* dĝ=dg for the stipulated covering comparison. Orthogonal τ=1 except O(1) and split O(1,1), where τ=1/2; unitary τ=2. Supply disconnected component and GL/GO central-quotient normalizations explicitly.

GQT §2 exact groups and quotient conventions; GL/GO central quotient data where used.

GQT, §2.5, PDF11, cover pushforward measure and orthogonal exceptions · needs 0.14, `AA.1`, `AA.0/restricted-haar-factorizable-integral`, `AA.2/tamagawa-measure`, `AA.2/tamagawa-number`.

#### MP.6.2: Siegel–Weil section

For a type-I dual pair, send φ to Φφ(g)=(ω(g)φ)(0) in the normalized Siegel degenerate principal series I_n(s₀,χV), s₀=(m−d(n))/2. Extend by the source’s standard flat section to a meromorphic Eisenstein family E(g,s,Φφ), and write A_k(φ) for its Laurent coefficients at s₀. The inducing cover and χV depend on orthogonal parity and the chosen splitting characters.

Number field GQT datum; normalized induction δ_P^{1/2}|det|^s, compatible measures and oscillator convention.

API: Φφ(g)=ω(g)φ(0); Its Levi covariance has the normalized parameter s₀; A_k is indexed by powers of s−s₀

GQT, §§5.3–5.4, PDF25; global §6.2 PDF28 · needs 2.5, 4.5, `AS.1`, `AS.2`, 6.1.

Tests: (1) Zero vector gives zero section; (2) Φφ(1)=φ(0); (3) Binary orthogonal/rank-one case: s₀=0.

#### MP.6.3: Ikeda map

For V=H^{r−r′}⊕V′ in the same Witt tower, define Ik_{r,r′}φ(a)=∫ φ(x,a,0)dx in the corresponding polarized configuration coordinates. The self-dual measures and splitting-character twists are fixed. The map preserves Schwartz functions, is equivariant for the smaller dual pair, and composes as Ik_{r′,r″}∘Ik_{r,r′}=Ik_{r,r″}.

0≤r″≤r′≤r; fixed isotropic splitting and source measures.

API: The map integrates φ(x,a,0) in x; Fubini identifies successive integrals with the product-measure integral under SFinite and joint Integrable hypotheses for the displayed function; The smaller dual-pair action intertwines with its prescribed character

GQT, §2.7 equation(2.1), PDF12; equivariance PDF13 · needs 4.5, `AL.0/local-fourier-inversion`, `AL.0/adelic-schwartz-bruhat-space`, 6.2.

Tests: (1) Removing no hyperbolic planes gives id; (2) φ=φ₁(x)φ₂(a)φ₃(y) maps to (∫φ₁)φ₂(a)φ₃(0); (3) Scaling dx scales the Ikeda map.

#### MP.6.4: Anisotropic Siegel–Weil formula

For anisotropic H(V), E(g,s₀,Φφ)=c_{m,n} τ(H)/[E:F]·I_{n,0}(φ), with the source’s definition of I and its measure comparison, c=1 for s₀>0 and c=2 for s₀≤0. Retain the split exceptional-group normalization wherever it enters a boundary comparison; do not transfer this anisotropic formula to a split divergent norm form.

GQT Theorem7.1 hypotheses; r=0; section and normalized quotient measure fixed.

GQT, Theorem7.1, PDF33–34 · needs 6.2, 5.7, 6.1.

#### MP.6.5: Regularized first-term identity

For r>0 and 0<m≤d(n), the GQT normalized Laurent coefficients satisfy A₀(φ)=2B₋₁(φ), both in the strict first-term range 0<m<d(n) (Theorem7.4) and at the boundary m=d(n) (Theorem7.3(ii)). In the split O(1,1) exception in either range, A₀=B₋₁=0 and A₁=B₀. All coefficients are evaluated at their respective s₀ and ρ_H. The r=0 anisotropic identity is the separate Theorem7.1 node.

GQT number-field type-I datum, r>0 and 0<m≤d(n); retain the exceptional split O(1,1) group and the source κ and τ.

GQT, Theorems7.3(ii) and7.4, §7.2, PDF34–35 · needs 5.8, 6.2, 6.1.

#### MP.6.6: Regularized second-term identity

In d(n)<m≤d(n)+r with r≤n, let m+m′=2d(n), V′ the complementary Witt-tower space of index r′. Then A₋₁(φ)=B₋₂(φ), and A₀(φ)=B₋₁(φ)−κ_{r,r′}B₀(Ik_{r,r′}(π_KHφ)) modulo Im A₋₁. The correction is zero for r′=0 or H(V′)=O(1,1), with the source’s stipulated interpretation. Equality of A₀ and B₋₁ is only a quotient identity unless the residual image vanishes.

GQT Theorems1.2/8.1 exact range, compact averaging π_KH and coefficient/measure normalizations.

GQT, Theorem1.2, PDF5–6, quotient-valued second-term identity; including its quotient-valued correction term · needs 5.8, 6.2, 6.3, 6.1, `AS.2`.

#### MP.6.7: Coherent and incoherent sections

A local quadratic/Hermitian collection with fixed dimension/discriminant and good-place lattices gives tensor evaluation sections. Coherence means localization of a global space, with every real signature and invariant-product constraint matched. Incoherent sections lie in the same induced representation without a global rational theta sum. Export their normalization and functional equation to GZ.6.

Number-field local collection, common inducing character, matching archimedean data. For quadratic spaces, admissible invariant systems, global existence and classification come from GlobalQuadraticForms Layers3,7,8; QFI6C supplies only local Hilbert/Hasse invariants and its cohomological comparison. The global Hermitian analogue requires a separate source-qualified extension, not an assumed consequence of local theta nonvanishing.

API: Almost-everywhere standard local sections give the restricted tensor section; For a coherent datum the section equals that of the global Schwartz vector; When global localizations satisfy the explicit invariant product constraint, a finite-support sign system with product −1 cannot be such a localization. This is a necessary obstruction, not the global classification theorem

AGHMP18, Published §6.1 equations(6.1.1)–(6.1.2), printed466–467, PDF76–77 · needs 6.2, 4.3, `TC58`, `AS.2`, `TC49`, `TC51`, `TC52`.

Tests: (1) Finite-support invariant system all equal to 1 has product 1; actual localization requires the global supplier; (2) One incompatible Hasse invariant fails the product constraint; (3) Good-place spherical section has value 1 at identity.

#### MP.6.8: Unitary Siegel–Weil measure

For DL’s rank n=2r unitary local datum and a nonsingular moment matrix T, use the unique rationally normalized H(F_v)-Haar measure stipulated in §4.1(H8): I_T(φ)=b_{2r,v}(1)·W_T(SW(φ)), with the source Whittaker character and local standard section. At an unramified hyperspecial place the designated compact subgroup has volume1. This equality specifies a normalization; it is not an arbitrary Haar choice.

DL §4.1(H1)–(H9); the local Fourier character and the source’s b_{2r,v} factor; nonsingular T in the indicated orbit.

DL24, §4.1(H8), PDF41–42 · needs 6.2, 6.1, 2.10, `AA.1`.

#### MP.6.9: Unitary theta coherence parity

For DL’s tempered relevant π with rank n=2r, prescribed infinity signature (n−1,1) at one place and (n,0) elsewhere, the locally distinguished finite Hermitian spaces V_{π_v} form a coherent global collection exactly when ∏_{v finite}η_v((−1)^r det V_{π_v})=−(−1)^{r[F:Q]}. Retain the ordinary norm-character conventions at every v. This global form-existence test is distinct from the local theta dichotomy.

DL Assumption3.2 and §4.1, F totally real, E/F CM; relevant tempered local representations and the stated archimedean signatures.

DL24, Definition4.2 and Remark4.3, PDF41–42 · needs 3.43, 6.7, `TC58`.

### Doubling, Rallis and global see-saw

#### MP.6.10: Doubling Schwartz map

Identify the doubled oscillator space for W⊕W⁻ with the tensor of the ψ and ψ⁻¹ oscillator models. Define δ:S(V^n)⊗conjugate(S(V^n))→S(V^n⊕V^n) by the source partial Fourier/polarization transform. Normalize it so δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩. Under G×G its action is the two commuting Weil actions with the explicit χV determinant twist in the doubled embedding.

Compatible self-dual measures, doubled polarization and GQT §11.3 splitting convention.

API: δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩; δ intertwines the doubled action with the stipulated χV determinant twist; δ is the source partial Fourier transform of a pure tensor

GQT, §11.3, unnumbered doubled-space and δ displays, PDF52 · needs 4.5, 2.7, 6.2, `AL.0/local-fourier-inversion`.

Tests: (1) A zero factor maps to zero; (2) Equal φ give value ‖φ‖²_L² at 0; (3) Omitting conjugation changes the Hermitian pairing into a bilinear one.

#### MP.6.11: Local doubling zeta integral

For local π and a section Φ_s of the doubled normalized induced representation, define Z_v(s,Φ_s,f₁,f₂)=∫G(F_v)Φ_s((g,1))⟨π(g)f₁,f₂⟩dg in its absolute-convergence chamber. Its meromorphic continuation is the local doubling functional. Define Z_v*=Z_v/L_v(s+1/2,π⊗χV) using the GQT normalization; for the standard good-place section Z_v=L_v/d_v, hence Z_v*=d_v⁻¹. Do not silently multiply the local section by d_v.

Generic good section in the source’s normalized induction, compatible Haar and matrix-coefficient pairing; L/d convention fixed.

API: In absolute convergence Z is the displayed group integral; The designated spherical data give L_v/d_v; Z_v*=Z_v/L_v(s+1/2,π⊗χV)

GQT, §11.6, local integral and normalized unramified displays, PDF54; global factorization (11.3), PDF53 · needs 6.10, 6.2, `AL.0`, `SR.2`, 6.1.

Tests: (1) Zero vector or section gives zero; (2) Unit, trivial representation, Dirac measure, section and vectors 1 give integral 1; (3) Changing Haar without renormalizing rescales Z_v.

#### MP.6.12: Factorization of theta pairings

In a proved convergence chamber, unfold a pure-tensor doubled theta pairing into normalized local integrals times the specified global/partial L-factor and good-place denominators. Apply AA.0 restricted-product Fubini with its countability, second-countability, open compact and cofinite-indicator hypotheses; compute ramified and real factors separately. The rational theta sum itself need not factor.

Pure-tensor input; all integrability/unfolding hypotheses proved; compatible local measures and good-place reference vectors.

GQT, Proposition11.1 and §11.3, PDF52–54 · needs 5.6, 6.10, 6.11, `AA.0/restricted-haar-factorizable-integral`, `AL.0`.

#### MP.6.13: Rallis inner product formula

In d(n)<m≤2d(n), r≤n, for cuspidal π with vanishing lower theta lifts, prove the inner product equals [E:F]·Valₛ₌ₛₘ,ₙL(s+1/2,π⊗χV)·Z*(s,Φ,f₁,f₂), with the normalized doubled section and measures. When all relevant local lifts are nonzero the L-factor is holomorphic there. Lower-lift vanishing removes residual terms and ensures cuspidality.

GQT Theorem11.4 hypotheses; first-occurrence theta lift; s_{m,n}=(m−d(n))/2>0; good sections and local/global normalization.

GQT, Theorem11.4, PDF54 · needs 6.6, 6.10, 6.11, 6.12, 5.6, `AL.0`.

#### MP.6.14: Global theta nonvanishing criterion

In the first-occurrence range, prove global nonvanishing equivalent to nonvanishing of the normalized local functionals and special L-value. Replace the local-functionals condition by local-theta nonvanishing only if ε₀=−1, all unitary archimedean places split, orthogonal F is totally complex, or m=d(n)+1. Otherwise retain the source’s possible modification of real signatures.

GQT Theorem11.7 and Proposition11.6; the exact local-functional hypotheses and first-occurrence cuspidality.

GQT, §§11.8–11.9, Proposition11.6 and Theorem11.7, PDF55–57 · needs 6.13, 6.11, 3.10.

#### MP.6.15: Global see-saw and spectral projection

For a compatible global see-saw, equate the iterated theta pairings under absolute integrability. A regularized version requires its independently proved identity and Laurent convention. Projection onto a specified closed discrete cuspidal eigenspace commutes with the lift under its Hilbert-domain and integrability hypotheses.

Compatible see-saw characters; cusp/decay or compact-source estimates sufficient for Fubini; actual closed Hilbert subspace for projection.

IP23, §§7–9, PDF41–42,50–53 · needs 3.8, 5.6, 6.12, 5.8, `AS.0`, `AF.3`.

#### MP.6.16: Norm-form theta integrals

Export to GZ.5 the rank-one theta kernel for the binary quadratic norm of E/F and the ternary trace-zero quaternion norm. For anisotropic binary (m=2,r=0,n=1) and division ternary (m=3,r=0), the ordinary integral converges. Split binary (m=2,r=1) lies at the exceptional boundary A₁=B₀. Split ternary (m=3,r=1) lies in the second-term range and uses A₋₁=B₋₂ and A₀=B₋₁ modulo Im A₋₁, with the anisotropic complementary correction zero. Export explicit Haar/splitting factors, not the Waldspurger identity itself.

Orthogonal ε₀=1,d(1)=2; nondegenerate norm/trace-zero forms; exact GQT convention and source’s quaternion split/division cases.

GQT, §3.1, PDF14; anisotropic Theorem7.1 PDF33; exceptional boundary Theorem7.3(ii) PDF34; second-term Theorem1.2 PDF5–6 and Theorem8.1 PDF35 · needs 5.7, 6.4, 6.5, 6.6, 6.1, `TC58`.

### Jacobi groups and Fourier–Jacobi theory

#### MP.6.17: Jacobi group

Construct J(W)=H(W)⋊Mp(W) using the native center-fixing action induced by Mp(W)→Sp(W). The central H(F) embeds as the additive center, while the metaplectic sign is the second factor. The Schrödinger–Weil representation is (h,g)↦ρψ(h)ωψ(g), with multiplication (h,g)(h′,g′)=(h(g·h′),gg′). A positive similitude transports the Heisenberg central character/index; it is not an action preserving a fixed ψ without that transport.

Characteristic-zero local/adelic symplectic datum; chosen genuine oscillator model and its covariance.

API: Multiplication uses h(g·h′),gg′; The action is ρψ(h)ωψ(g); A similitude transports the central character by its multiplier

BFH90, §1 equations(1.1)–(1.5), printed547, PDF6 · needs 0.13, 1.7, 1.3, 0.8.

Tests: (1) W=0: H=F, cover μ₂, and the center action is trivial; the generic semidirect-product test assumes act=1; (2) Restriction to H is the native Schrödinger action; (3) A direct product incorrectly forces Heisenberg and symplectic operators to commute.

#### MP.6.18: Jacobi spaces

For a Jacobi arithmetic lattice, integral central index m and finite-dimensional weight/multiplier, define smooth automorphic sections of central character ψ_m, holomorphic in the complex Heisenberg variable, with the specified symplectic and elliptic covariance. Impose the appropriate Fourier growth and cusp holomorphy for the holomorphic/cuspidal subspaces. MP.8 supplies the BFH coordinate specialization.

A fixed Jacobi lattice and compatible central index; exact weight and multiplier, not inferred from the lattice equations alone.

API: The additive center acts by ψ_m; The coordinate elliptic law has the prescribed quadratic phase; The symplectic covariance agrees with the specified weight/multiplier

BFH90, §1 equations(1.6)–(1.9), printed547, PDF6 · needs 6.17, 5.3, `AF.1`.

Tests: (1) Zero belongs to each Jacobi space; (2) A nonzero section with different central character is excluded; (3) BFH translation periods are Z² and N⁻¹Z².

#### MP.6.19: Fourier–Jacobi extraction

Extract a Fourier–Jacobi coefficient of a smooth automorphic form by integration over the compact rational center of the relevant Heisenberg unipotent against ψ_m⁻¹. Its remaining transformation is the Jacobi action of index m, with the inherited weight/multiplier. The coefficient of a normally convergent Fourier family is recovered termwise; further Fourier extraction in the elliptic variable uses its designated compact torus and probability/Lebesgue normalization.

Compact central quotient; actual unipotent splitting; smoothness and normal convergence for termwise extraction.

API: The coefficient has ψ_m central character; It transforms under the common Jacobi action; A character term of matching index is recovered by compact orthogonality

BFH90, §2 equations(2.2)–(2.3), printed551–552, PDF10–11 · needs 5.5, 6.17, 6.18, `AF.3/constant-term`.

Tests: (1) Zero input gives zero coefficient; (2) Integrating ψ_mψ_m⁻¹ over the probability center gives 1; (3) Distinct central characters give coefficient 0.

#### MP.6.20: Jacobi theta decomposition interface

For positive index and a normally convergent Jacobi section, prove elliptic invariance gives finitely many discriminant residues and unique theta components transforming through the finite Weil module. Use compact-torus orthogonality and supplied Poisson summation. MP.8 specializes this interface to BFH, including its positive-on-iY root; the general proof does not depend on that specialization.

Positive index; compatible integral lattice; normal Fourier convergence and all weight/multiplier data fixed. The generic lattice/discriminant carrier is imported from IntegralLattices.

BFH90, §2 Proposition2.2, equations(2.4)–(2.10), printed552–553, PDF11–12 · needs 6.19, 6.18, 4.7, `AL.0/adelic-poisson-summation`, `TC47`.

### Lattice Poisson and toric comparisons

#### MP.6.21: Ideal-lattice Poisson comparison

For an imaginary quadratic K, fractional ideal b, λ∈C and z∈H, Σμ∈b exp(2πiN(λ+μ)z)=i/(sqrt(|D|)N(b)z) Σν∈b⁻¹d⁻¹ exp(−2πiN(ν)/z)exp(2πiTr(λν)). The trace-dual ideal is b⁻¹d⁻¹, and the additive measure is matched to its discriminant covolume. This is an adapter of the supplied finite-dimensional Poisson theorem.

D<0 fundamental; d the different, N(d)=|D|; the complex norm and trace conventions fixed.

GZ86, IV.§2 proof of Lemma(2.3), printed274–275, PDF51–52 · needs `AL.0/adelic-poisson-summation`, `AL.0/local-fourier-inversion`, 5.12.

#### MP.6.22: Toric theta pairing interface

For an anisotropic norm torus T, unfold its compatible quadratic/quaternionic theta pairing into local oscillator/orbital integrals after proving product integrability on [T] and the companion quotient. Match character, rational splitting and Haar data, and export the factors and see-saw to GZ.5, which owns the Waldspurger identity and arithmetic comparison.

Actual anisotropic torus and unitary character trivial on T(F); cusp or compactness/decay bound; ramified test functions and source parity fixed. For a quadratic field K/F its binary norm remains anisotropic even if the containing quaternion algebra is split. A split-quaternion Shimizu/Petersson comparison requires the separate source-qualified factorization with the exact toric normalization; a GQT residual-image identity alone is insufficient.

GZ86, I.§5(5.2), printed229, PDF6; IV.§2 printed273–275, PDF50–52; YZZ11, 6 November 2011 draft, §2.2.1 Proposition2.2.1 and proof pp.48–50; §§2.3–2.4 pp.51–55 · needs 6.16, 6.15, 6.1, 6.12, `AA.1`.

## MP.7: Half-integral weight, plus spaces and Shimura lifting

Shared settings (the numbers below are cited only by the targets using them):

1. Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

Library substrate: `Complex.Gamma`, `CongruenceSubgroup.Gamma0`, `QuotientGroup.rightRel`.

### Half-weight forms and Eisenstein normalization

#### MP.7.1: Theta multiplier

For γ∈Γ₀(4), J(γ,z)=θ(γz)/θ(z), where θ=y^(1/4)Σ_ne(n²z). Prove θ(z)≠0, |J|=1 and the cocycle law, using the exact principal square-root branch and Kronecker multiplier.

H1.

API: Form J from the nonvanishing theta seed; J(γδ, z)=J(γ,δz)J(δ, z); |J(γ, z)|=1, with the precise branch giving the Γ₀(4)theta multiplier

DIT16, §5, (5.14) and the next display, p964 · needs `QM.1/jacobi-theta-nonvanishing`, 5.5.

Tests: (1) J(1,z)=1; (2) A constant phase change of the theta seed leaves J unchanged; (3) Independent local square-root choices can break the cocycle law.

#### MP.7.2: Weight-one-half Maass space

For Δ₁/₂=−y²(∂ₓ²+∂ᵧ²)+(i/2)y∂ₓ, prove covariance under J. Define V_r as the smooth weight-one-half eigenfunctions with eigenvalue 1/4+(r/2)², square-integrable on Γ₀(4)\H and with zero constant term at all three cusps. Their Fourier expansion is the Whittaker expansion in 7.3.

H1.

API: F(γz)=J(γ, z)F(z); Cuspidality means zero constant term at each of ∞,0,1/2, in normalized cusp coordinates; Weight-one-half eigenvalue is 1/4+(r/2)² when its Shimura lift has 1/4+r²

DIT16, §8, printed975, PDF27 · needs 7.1, `QM.3/weight-k-hyperbolic-laplacian`, 5.5.

Tests: (1) Vanishing only at infinity does not establish cuspidality without the plus-space cusp comparison; (2) Ordinary Γ invariance does not establish genuineness; (3) Using r rather than r/2 in W gives the wrong eigenvalue.

#### MP.7.3: Whittaker Fourier expansion

A cuspidal weight-one-half eigenform has F(z)=Σ_{n≠0}b(n)W_{sgn(n)/4,ir/2}(4π|n|y)e(nx), with convergence and coefficient recovery. The spectral parameter is r/2 here, versus r in weight zero.

H1.

DIT16, Theorem 4, p965 (display before (5.16)); (8.8), p976; (10.1), p981 · needs 7.2, 5.5, `AS.0/dit-112`.

#### MP.7.4: Completed half-weight Eisenstein family

Construct E*_{1/2}(z,s) with constant term Λ(2s)2^s y^(s/2+1/4)+Λ(2−2s)2^(1−s)y^(3/4−s/2) and Whittaker parameter s/2−1/4. Prove automorphy and meromorphic continuation; its parameter differs from that in F_{1/2,n}(z,w).

H1.

API: Construct the Eisenstein family on Γ₀(4) with the theta multiplier and its prescribed cusp data; Expose both powers y^(s/2+1/4) and y^(3/4−s/2), with 2^s and 2^(1−s); Its W parameter s/2−1/4 equals w−1/2 under w=s/2+1/4

DIT16, §5, unnumbered display after (5.14) and the Shimura relation, p964, quoting [16, Prop. 2 p. 959] (coefficient evaluation from [16, Lemma 4, (2.23)–(2.25), pp. 961–962]); PDF p.16 · needs `AS.1`, 7.1, 7.3, 5.5.

Tests: (1) Zero completed-zeta and coefficient data give zero adapter; (2) Zero nonconstant coefficients leave exactly the stated constant term; (3) Changing the excluded b(0,s) does not affect the series.

#### MP.7.5: Fundamental-discriminant Eisenstein coefficient

For fundamental d, b(d,s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d), where Λ(s,χ_d)=π^(−s/2)Γ((s+α)/2)|d|^(s/2)L(s,χ_d), α=(1−sgn d)/2. Compare with Mathlib’s gamma normalization, including its π^(−α/2) difference.

H1.

API: b(d, s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d); The paper completion is |d|^(s/2)π^(α/2) times Mathlib completed L; The product of two such coefficients has factor (4π)^(−1/2)|D|^(−3/4)

DIT16, §5, (5.13) (Λ(s,χ_d)) and the unnumbered definition of b(d,s), p964 · needs `AL.0`, 5.5.

Tests: (1) d=1 gives completed zeta; (2) d=−3 uses 3^(-3/4); (3) At d=d′=1, 2√π times the coefficient product is Λ(1,s)².

#### MP.7.6: Half-weight Eisenstein coefficient expansion

The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0,1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s).

H1.

DIT16, §5, the two unnumbered displays after (5.14) (Shimura relation for b(dm²,s) and E*_{1/2}), p964 · needs 7.4, 7.5, 5.5.

#### MP.7.7: Eisenstein product normalization

For coprime fundamental d,d′ and D=d′d, Λ(s,χ_{d′})Λ(s,χ_d)=2√π|D|^(3/4)b(d′,s)b(d,s). This is a bilinear product without complex conjugation, unlike Theorem4.

H1.

DIT16, §5 (5.15), p964 · needs 7.5, 5.5.

#### MP.7.8: Theta residue and Petersson normalization

Resₛ₌₁ E*₁/₂=θ/2. For the unnormalized hyperbolic Petersson product, ||θ||²=2π=area(Γ₀(4)\H), so ||θ/2||²=π/2. The number 6 instead equals (3/π)||θ||², the norm after normalization by area(PSL₂(Z)\H)=π/3. Rescaling a vector from norm squared 1 to 6 changes the coefficient 12 in the bilinear formula to 2; this normalization remark supplies no proof of that formula.

H1.

DIT16, Remarks after Theorem4, p965 · needs `AA.1`, `QM.1/jacobi-theta-nonvanishing`, 7.4, 5.5.

### Plus projection and spectral coefficient kernels

#### MP.7.9: Kohnen plus subspace

V_r^+ is the subspace of the weight-one-half cuspidal eigenspace V_r whose Fourier coefficients vanish outside n≡0,1 mod4. It is a linear subspace defined by coefficient kernels, not by a chosen basis.

H1.

API: Intersect kernels of b(n) for n≡2,3 mod 4; Membership means exactly the forbidden coefficients vanish, together with the ambient cusp/eigen conditions; The common kernel of forbidden coefficient maps is closed under addition and complex scalar multiplication. Actual Hecke preservation requires the source ambient space

DIT16, §8, p976 · needs 7.2, 7.3, 5.5.

Tests: (1) An identity forbidden-coefficient map at −1 excludes nonzero vectors; (2) Zero forbidden maps give the full ambient common kernel; (3) Zero forbidden coefficients with nonzero cusp constant fail plus cuspidality.

#### MP.7.10: Plus projection operators

On the unitary-weight space set UF(z)=(√2/4)Σ_{ν=0}^3F((z+ν)/4), WF(z)=exp(iπ/4)(z/|z|)^(−1/2)F(−1/(4z)), and pr⁺=(2/3)WU+1/3. Record operator composition order and the factor √2 caused by y^(1/4).

H1.

API: U=(√2/4)Σ_{ν mod 4}F((z+ν)/4) in the unitary normalization; W uses exp(iπ/4)(z/|z|)^(−1/2) and z↦−1/(4 z); The supplied U,W formulas define (2/3)WU+(1/3)id on functions; proving that it is the orthogonal plus projection requires the actual Maass domain and relations

DIT16, §8, printed976, PDF28, U,W and footnote6 · needs 7.1, 7.2, 7.9, 5.5.

Tests: (1) Omitting √2 changes U conjugated by y^(1/4); (2) On 1, pr⁺ gives (2/3)phaseW(z)√2+1/3, which at i differs from 1; (3) Compare WU and UW outside the plus space; they are not assumed equal.

#### MP.7.11: Plus projection and old normalization bridge

Prove pr⁺ is the orthogonal projection onto V_r⁺ and extends to the relevant Poincaré families. The DIT11 family satisfies P_d⁺=(3/2)pr⁺P_d, as corrected by DIT16 footnote 7. Thus pr⁺F₁/₂,d has principal-term factor 2/3.

H1.

DIT16, §8 equation(8.10) and footnote7, printed977, PDF29; projection definition printed976 PDF28 · needs 7.10, 5.5.

#### MP.7.12: Half-weight Kloosterman sum

For c>0 divisible by4, K_{1/2}(m,n;c)=Σ_{a mod c,(a,c)=1}(c/a)ε_a e((m a+n ā)/c), where aā≡1 modc and ε_a=1 or i according as a≡1 or3 mod4. The extended Kronecker symbol convention is part of the data.

H1.

API: Sum over units mod c with a chosen inverse and the extended Kronecker symbol; Changing the integer lift of a⁻¹ by c does not change the phase; Require 4|c and distinguish ε_a for a residue 1 or 3 mod 4

DIT16, §8, p.976; DIT11 p.964 (unnumbered display just before (3.4)); DIT11 (3.4), p.965, is K⁺.

Tests: (1) K_{1/2}(0,0;4)=1+i; (2) Adding c to either index leaves K unchanged; (3) Omitting ε_a gives 2 instead of 1+i at zero indices,c=4.

#### MP.7.13: Modified plus Kloosterman sum

K⁺(m,n;c)=(1−i)K_{1/2}(m,n;c) times1 if8|c, and times2 ifc≡4 mod8. Only the discriminant-indexed symmetry statement is used.

H1.

API: Use 2 when c≡4 mod 8 and 1 when 8|c; K⁺/(1−i) equals the dyadic multiple of K_{1/2}; For allowed indices, K⁺ is real and symmetric

DIT16, §8, p976 · needs 7.12.

Tests: (1) K+(0,0;4)=4; (2) K+(1,1;4)=−4; (3) Omitting the c≡4 mod8 factor gives 2 at zero indices,c=4.

#### MP.7.14: Reality and symmetry of plus sums

For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).

H1.

DIT16, §8 (8.9), p976 · needs 7.13.

#### MP.7.15: Half-weight resolvent kernel

Construct the resolvent G_{1/2}(z,z′;s) on the Γ₀(4) unitary-multiplier L² space, with its three-cusp domain, hermitian kernel symmetry and discrete polar projectors. This is a cover-specific adaptation of AS.0, not an ordinary scalar kernel on Γ\H.

H1.

API: Use functions with J automorphy and all three cusps in the self-adjoint domain; Transform each kernel variable with its J or conjugate J factor; The residue is the orthogonal projector onto the weighted eigenspace, before plus projection

DIT16, §8 (8.5), p975 · needs 7.2, `AS.0`, 5.5.

Tests: (1) The kernel is not an ordinary invariant scalar in both variables; (2) A basis-vector phase change preserves its rank-one projector; (3) Project to V⁺ before taking the basis sum in coefficient identity (100).

#### MP.7.16: Half-weight Poincaré family

For n≠0, Re(s)>1, F_{1/2,n}(z,s)=Γ(s−sgn(n)/4)/(4π|n|Γ(2s)) times Σ_{Γ∞\Γ₀(4)}J(γ,z)⁻¹ M_{sgn(n)/4,s−1/2}(4π|n|Imγz)e(n Reγz).

H1.

API: The prefactor is Γ(s−sgn n/4)/(4π|n|Γ(2 s)); J(γ, z)⁻¹ in the coset sum gives the correct automorphy; The Whittaker parameter is s−1/2. Comparing with weight zero requires the substitution w=s/2+1/4

DIT16, §8 (8.6), p975 · needs 7.1, 5.5, `AS.0/dit-112`.

Tests: (1) n=1 and n=−3 have different gamma arguments; (2) n=0 is excluded from the prefactor; (3) Omitting 4π|n| changes residues and the constant 12; cancel Γ(2s) only where nonzero, in Re s>1.

#### MP.7.17: Half-weight Poincaré residues

At s₀=1/2+ir/2, r>0, Res[(2s−1)F_{1/2,n}(z,s)]=Σ_ψ conj(b_ψ(n))ψ(z) over an orthonormal cuspidal eigenbasis, in the kernel convention verified from Fay. Preserve conjugation; raw PDF text drops bars.

H1.

DIT16, §8 equation(8.7), printed976, PDF28 · needs 7.3, 7.15, 7.16, 5.5.

#### MP.7.18: Plus Bessel coefficient family

For nonzero discriminant indices n,d and Re(s)>1, Φ⁺(n,d;s) equals [Γ(s−sgn n/4)Γ(s−sgn d/4)/(3√π·2^(2−2s)Γ(2s−1/2)√|nd|)] Σ_{c>0,4|c}K⁺(n,d;c)c⁻¹ B_{2s−1}(4π√|nd|/c), with I for nd<0, J for nd>0.

H1.

API: Use the explicit prefactor and K⁺ series of 98 in Re(s)>1; Each gamma factor uses its own index sign; the Bessel function depends on the product sign; Extend using the projected resolvent coefficient, preserving its initial series

DIT16, §8 equation(8.11), printed977, PDF29 · needs 7.13, 5.5, `QM.2/modified-bessel-function-i`, `QM.2/bessel-function-j`.

Tests: (1) K supported at c=4 with value 1, n=−3,m=−4 gives the stated Γ(s+1/4)² prefactor times J(2s−1,π√12)/4; (2) The same K, n=1,m=−3 gives the Γ(s−1/4)Γ(s+1/4) prefactor times I(2s−1,π√3)/4; (3) Doubling K doubles the coefficient.

#### MP.7.19: Projected Fourier expansion

For Re s>1 and nonzero d≡0,1 mod4, pr⁺F₁/₂,d equals (2/3)Γ(s−sgn d/4)M_{sgn d/4,s−1/2}(4π|d|y)e(dx)/(4π|d|Γ(2s)), plus Σ_{n≠0,n≡0,1(4)} Φ⁺(n,d;s)W_{sgn n/4,s−1/2}(4π|n|y)e(nx), plus a separate constant term. Use Φ⁺ from 7.18; the Whittaker expression cannot be evaluated at n=0.

H1.

DIT16, §8 equations(8.10)–(8.11), printed977, PDF29 · needs 7.11, 7.16, 7.18, 5.5.

#### MP.7.20: Plus coefficient residue theorem

Φ⁺(d′,d;s) continues meromorphically to Re(s)>0 and Res_{s=1/2+ir/2}[(2s−1)Φ⁺(d′,d;s)]=Σ_ψ b_ψ(d′)conj(b_ψ(d)), for an orthonormal basis of V_r^+.

H1.

DIT16, Proposition4, p977 · needs 7.9, 7.17, 7.19, 5.5.

### Geometric unfolding and cycle formulas

#### MP.7.21: Quadratic-root Weyl sum

For c>0 divisible by4, S_m(d′,d;c)=Σ_{b mod c,b²≡D modc}χ_d([c/4,b,(b²−D)/c])e(2mb/c). Prove representative independence, reality and S_{−m}=S_m using the exact factor2 in the exponential.

H1.

API: Sum over b mod c with b²≡d′d mod c; Associate [c/4, b,(b²−D)/c] of discriminant D; S_{−m}=S_m=conj(S_m) under the stated genus character convention

DIT16, §9 (9.1), p978.

Tests: (1) The quadratic-form discriminant is D; (2) The phase is e(2mb/c); (3) Replacing b mod2a by b mod4a doubles the count and requires 1/2.

#### MP.7.22: Kohnen–Salié divisor identity

For c>0 divisible by4, d fundamental, d′≡0,1 mod4 and integer m, S_m(d′,d;c)=Σ_{n|gcd(m,c/4),n>0}(d/n)√(n/c)K⁺(d′,m²d/n²;c/n). Include even-prime factors and the c≡4 mod8 multiplier.

H1.

DIT16, Lemma 8, p.980; the same as DIT11 Proposition 3, p.965, with DIT11's (d,D) renamed (d′,d) · needs 7.13, 7.21.

#### MP.7.23: Weight-two cycle unfolding

Let d be fundamental, d,d′<0 and D=dd′ nonsquare. For the supplied weight-two Poincaré seed φ, put Φ_m(t)=−it∫₀^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ. In a proved convergence range, Σ_Qχ(Q)∫_{C_Q}P_m(τ,φ)dτ=εΣ_{c>0,4|c}S_m(d′,d;c)Φ_m(2√D/c), for every integer m. Here ε=1 for z→γ_Qz, clockwise when a>0, and ε=−1 for z→γ_Q⁻¹z. This uses the negative kernel sign; the printed positive sign requires the opposite overall sign. Supply the actual decay estimate, possibly O(y^ε), rather than inferring a stronger bound from Re s>1.

H1.

DIT16, §9 Lemma6, (9.3), pp979–980; DIT11 §4 Lemmas6–8, pp966–969 · needs 7.21, `AS.0`, 5.5.

#### MP.7.24: CM Poincaré sum

For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|.

H1.

DIT16, Lemma3, p978; DIT11 Proposition4 · needs `AS.0`, 7.21, 5.5.

#### MP.7.25: Positive cycle Poincaré sum

For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c).

H1.

DIT16, Lemma4, p979 · needs `AS.0`, 7.21, 5.5.

#### MP.7.26: Negative-factor cycle Poincaré sum

Let m≠0, Re(s)>1, d fundamental, d′,d<0 and D=d′d nonsquare. Orient C_Q from z to γ_Qz, with γ_Q from (2.11); this is clockwise on S_Q when a>0 and is the orientation of C_A in §2. Then Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d;c)c^{−1/2}J_{s−1/2}(4π|m|√D/c). With DIT11's orientation (z to γ_Q⁻¹z) the right side changes sign.

H1.

DIT16, Lemma5, p979 · needs 7.23, 5.5, `QM.2/bessel-function-j`.

#### MP.7.27: Exact three-case Poincaré identity

Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, with the orientation fixed above.

H1.

DIT16, Proposition5, p978 · needs 7.18, 7.22, 7.24, 7.25, 7.26, 5.5.

### Hecke eigenlines and the Shimura lift

#### MP.7.28: Plus Hecke eigenbasis

Construct an orthonormal simultaneous Hecke eigenbasis B_r of V_r⁺. Include the specified plus-space T₄ operator together with T_{p²} for odd p; diagonalization away from 2 alone supplies no all-prime Euler product.

H1.

DIT16, §10, pp980–981; Katok–Sarnak[34] · needs 7.9, 7.10, 5.5.

#### MP.7.29: Shimura lift from an eigenline

For ψ∈B_r, choose a fundamental d with b_ψ(d)≠0, define a_ψ(n) from the Hecke Euler factors, and form Shim(ψ)(z)=2√yΣ_{n≠0}a_ψ(|n|)K_ir(2π|n|y)e(nx). Prove independence from the selected d and from scaling ψ; define it first on the eigenline.

H1.

API: Form the even K-Bessel series from the Hecke eigenvalues; Multiplying ψ by a nonzero scalar leaves all a_ψ(n) and Shim(ψ) unchanged; Different nonzero fundamental coefficients produce the same a_ψ(n), using the Hecke relations

DIT16, §10 (10.1)–(10.3), p981 · needs `AF.2`, 7.3, 7.28, 5.5, 7.30.

Tests: (1) ψ and −ψ give the same lift; (2) b(d)=0 cannot serve as denominator; (3) The p=2 factor requires its own plus-space convention.

#### MP.7.30: Shimura coefficient relation

For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.

H1.

DIT16, Theorem4; §10, pp981–982 · needs 7.3, 7.28, 5.5.

#### MP.7.31: Spectral substitution residue factor four

Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.

H1.

DIT16, §10, p982.

#### MP.7.32: Spectral trace identity before multiplicity one

Taking residues of the three-case identity and using the Fourier residues, Shimura coefficient relation and factor-four change of variable gives 12√π|D|³/⁴Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φ a_φ(m)T(φ,χ). Here T is the norm-divided three-case geometric trace of 7.47. Retain both finite eigenspace sums until the Shimura bijection is proved.

H1.

DIT16, §10 (10.4)–(10.6), pp981–982 · needs `AS.0`, 7.20, 7.27, 7.30, 7.31, 5.5, 7.47.

#### MP.7.33: Automorphy of the Shimura series

Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy.

H1.

DIT16, §10, p982, citing Biró[3]p129 · needs 7.29, 7.32, 7.43, 5.5.

#### MP.7.34: Shimura bijection of eigenlines

The weight-one-half Kohnen-plus Hecke eigenlines at parameter r/2 correspond bijectively to normalized even level-one Hecke–Maass forms at parameter r. On a previously chosen orthonormal basis B_r this gives one selected vector for each line; it does not produce a phase-independent unit vector.

H1.

DIT16, §10 Proposition6 proof, pp981–982, [1]Theorem1.2 · needs 7.28, 7.33, 5.5.

#### MP.7.35: Extended trace formula for all discriminants

For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4).

H1.

DIT16, Proposition6, pp981–982 · needs 7.32, 7.34, 5.5, 7.47.

#### MP.7.36: Theorem4 negative factors

Let φ be the even level-one form of 7.29 with a(1)=1, λ=1/4+r², and let F be the corresponding half-weight eigenline vector with unnormalized Petersson norm 1 and the coefficient relation of 7.30. For coprime negative fundamental d,d′, D=dd′>0, prove 12√πD³/⁴ b(d′)conj(b(d))=||φ||⁻²(λ/2)Σ_{A∈Cl⁺(K)}χ(A)∫_{F_A}φdμ. F remains determined only up to unit phase.

H1.

DIT16, §5 Theorem4, (5.16) first branch, p965 · needs 7.35, `TC48`, 5.5, 7.47.

#### MP.7.37: Theorem4 positive factors

For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline.

H1.

DIT16, §5 Theorem4, (5.16) second branch, p965 · needs 7.35, 5.5, 7.47.

#### MP.7.38: Theorem4 CM factors

For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant.

H1.

DIT16, §5 Theorem4, (5.16) third branch and footnote4, p965 · needs 7.35, 5.5, 7.47.

#### MP.7.39: Duke coefficient estimate with spectral factor

For an L²-unit weight-one-half cusp form on Γ₀(4) with eigenvalue 1/4+t², and fundamental n, prove |b(n)|≪_ε(1+|t|)^C cosh(πt/2)|n|^(−2/7+ε). For the paired lift t=r/2. Conversion to the a(1)=1 weight-zero form retains its Petersson norm and the spectral factor; it requires no unproved symmetric-square r^ε estimate.

H1.

DIT16, §6, (6.6), printed968–969/PDF20–21; Duke88, §2 spectral normalization, printed77–78/PDF5–6; Theorem5 printed85–86/PDF13–14 · needs 7.3, 7.12, 7.28, 5.5.

### Fourier separation and analytic comparisons

#### MP.7.40: Exact conjugation of the two U and W normalizations

On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.

H1.

DIT16, §8, printed976, PDF28, U,W and footnote6; DIT11 §2, printed959, PDF13.

#### MP.7.41: Positive Fourier kernel and orthogonal complement

In the finite-dimensional fixed-eigenvalue plus cusp space W, let W₀=⋂_{n>0,n≡0,1(4)}ker(b_n) and W₁=W₀⊥. Use W=W₀⊕W₁ with the inherited Petersson inner product. No hypothesis or conclusion W₀=0 is imposed.

H1.

API: Membership in W₀ means every positive admissible Fourier coefficient vanishes; Choose an orthonormal basis adapted to W₀⊕W₁ using finite dimensionality; For positive fundamental D, the Biró lift is zero on W₀ because every DQ² index is positive and admissible

Biro00, Proof of Theorem1, printed128–129, PDF26–27 · needs 7.3, 7.9.

Tests: (1) Identity positive-coefficient maps on C exclude nonzero vectors; (2) Full positive kernel forces all positive coefficients to vanish; (3) A sole negative-index identity map leaves the positive kernel full.

#### MP.7.42: Finite Fourier certificate with conjugated trace coefficients

For an orthonormal basis f₁,…,f_m of W₁, there exist m positive admissible indices n_i for which the matrix (conj(b_{f_j}(n_i))) is invertible. This uses all positive admissible coefficients, not only fundamental indices.

H1.

Biro00, Proof of Theorem1, printed128–129, PDF26–27 · needs 7.41.

#### MP.7.43: Automorphy from finite Fourier separation

At N=1, assume convergence of Biró’s Fourier series and its equation (14) for every positive admissible index n=s/D. This expresses each conjugated-coefficient combination of Sh_D f_j as a finite genus-weighted weight-zero cusp trace. Finite Fourier separation then proves each Sh_D f, f∈W, is a possibly zero level-one cusp eigenform at parameter r. For positive D its Fourier coefficients are even. Establish the trace identity independently; for N>1 the spaces are Γ₀(N) and V*₁/₂(4N).

H1. D>0 is fundamental. The trace identity(14) and its convergence are hypotheses of this conditional node, not consequences of finite-dimensional coefficient separation. The trace identity must be proved independently of that separation argument; for N>1 use Γ₀(N) and the corresponding V*_{1/2}(4N).

Biro00, Proof of Theorem1, printed128–129, PDF26–27 · needs 7.41, 7.42.

#### MP.7.44: Coefficients of the weight-1/2 plus-space Eisenstein series

For positive m and fundamental D, prove Σ_{n|m}(D/n)b₀(Dm²/n²,s)=2^(2−4s)π^(s+1/4)m^(3/2−2s)|D|^(s−1/4)σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b₀(0,s)=√π2^(5/2−6s)Γ(2s)ζ(4s−2)/ζ(4s−1), for the DIT11 P₀⁺ coefficients. Consequently E*₁/₂(z,s)=2^sΛ(2s)y¹/⁴P₀⁺(z,s/2+1/4), recovering the constant term, fundamental coefficients and Shimura relation above.

H1.

DIT16, DIT11 Lemma 4, (2.23)–(2.25), pp961–962; used for the E*_{1/2} display, DIT16 p964, which cites only [16, Prop. 2 p. 959] · needs 5.5, 7.4, 7.3, 7.40.

#### MP.7.45: Fourier expansion and residues of the weight-1/2 resolvent

For Re s>1, reduced z and Im z′>Im z, expand G₁/₂(z′,z;s) as Σ_{n≠0}F₁/₂,n(z,s)W_{sgn n/4,s−1/2}(4π|n|y′)e(−nx′) plus its separate Eisenstein term. Continue meromorphically and prove Resₛ₌₁/₂₊ᵢᵣ/₂(2s−1)G₁/₂=Σ_ψ conj(ψ(z′))ψ(z), using an orthonormal basis of V_r. Fay’s resolvent input also gives meromorphic continuation of Φ⁺ to all s.

H1.

DIT16, §8, pp.975–977, citing Fay [20, Thm 3.1] and footnote 5; Fay Cor. 3.6 p.178 · needs 5.5, 7.15, 7.16, 7.17.

#### MP.7.46: Shimura Dirichlet-series identity for ψ∈B_r

For ψ∈B_r and fundamental d, prove L_d(s+1/2)Σ_{n≥1}b(dn²)n^(1−s)=b(d)∏_p(1−a_ψ(p)p^−s+p^−2s)^−1. Here L_d=L(−,χ_d), and a_ψ(2) uses the specified plus-space Hecke operator. Coefficient comparison gives 7.30.

H1. Use the all-prime simultaneous eigenbasis, including the separately supplied plus-space operator at2; an odd-prime eigenbasis does not define the displayed Euler product.

DIT16, §10, p.981 (display after (10.1)) · needs 5.5, 7.3, 7.28, 7.30.

### Geometric and adelic exports

#### MP.7.47: Geometric trace

For an even Hecke–Maass cusp form φ, fundamental d, discriminant d′ and nonsquare D=d′d, define T(φ,χ)=||φ||⁻²Σ_{Q∈Γ\Q_D}χ(Q)Y_Q. Here Y_Q=2sqrt(π)ω_Q⁻¹φ(z_Q) for D<0, ∫C_Qφ y⁻¹|dz| for d,d′>0, and ∫C_Q i∂_zφ dz for d,d′<0, with the corrected z→γ_Qz orientation. The sums and cycles are the supplied arithmetic geometric objects; for odd φ the paired trace vanishes.

Nonzero actual cusp eigenform so ||φ||²>0; the genus character on possibly imprimitive forms; invariant cycle/stabilizer conventions.

API: The negative-D branch is the inverse-stabilizer weighted CM value sum; The two positive-D branches use scalar length integration or the oriented weight-two differential; A finite involution preserving trace weights and negating paired function values forces the normalized weighted trace to vanish. Actual source CM/cycle reflection must instantiate these data

DIT16, §10 geometric trace display preceding Proposition6, printed981, PDF33 · needs 7.27, `AS.0`.

Tests: (1) a≠0: T(aφ)=T(φ)/conj(a); (2) Equal-weight paired points with φ(q)=−φ(p) cancel in the weighted trace; (3) The denominator is 1 at Petersson norm 1, and is retained at other norms.

#### MP.7.48: Biró lift

For N>0, positive fundamental D and f∈V*₁/₂(4N) with Biró eigenvalue λ=−1/4−t²<−3/16, define Sh_D f=Σ_{k≠0}a_Sh(k)W_{1/2+2it}(kz), where a_Sh(k)=Σ_{PQ=k,P>0,(N,P)=1}|Q|¹/²P⁻¹(D/P)b_f(DQ²). Prove it is a Γ₀(N) cusp form with eigenvalue −1/4−(2t)². Take V*=V⁺ for odd N and V for even N; use Biró’s W normalization. This is a Fourier-series construction.

N>0, D>0 fundamental, f∈V*_{1/2}(4N), λ<−3/16. Use Biró’s own Whittaker W_s(kz) normalization, with its |k|^{1/2} factor when compared to a 2sqrt(y)K series. The general-level coefficient and trace spaces must be instantiated, not identified with the N=1 space. λ is real and t²=−λ−1/4; t may be real or purely imaginary. The complex parameter retains the source complementary range −1/4<λ<−3/16, rather than silently restricting Theorem1 to real t.

API: The source-normalized divisor expression is used in the series over all k≠0, with positive-D inputs b_f(DQ²); actual Fourier coefficient extraction requires the analytic carrier; Half-weight parameter t gives weight-zero parameter2t in the negative Laplacian convention; The positive-coefficient common kernel maps to zero for positive D

Biro00, §1 and Theorem1, printed105–106, PDF3–4; proof128–129, PDF26–27 · needs 7.41, 7.42, 7.43, `AS.0`, `AF.3`, `AL.0`.

Tests: (1) Zero input gives zero lift; (2) A nonzero W₀ vector is invisible to positive-D lifts; (3) Output spectral term is (2t)²; (4) N=1,χ(1)=χ(2)=1,b(D)=1,b(4D)=0 gives a_Sh(2)=1/2.

#### MP.7.49: Adelic and classical half-weight comparison

For the actual rank-one adelic cover and a specified finite-level genuine vector, evaluate along the real Iwasawa section over H to obtain a classical half-integral-weight form with its theta multiplier. Conversely adelize a classical form with the compatible congruence/character and cusp conditions. The comparison intertwines right Hecke actions and matches the positive Fourier e(nx), chosen Whittaker normalization, and the y^{k/2} holomorphic-to-unitary weight change. At weight1/2 the conjugated Laplacian is Δ_unit,1/2=y^{1/4}Δ_hol,1/2 y^{−1/4}+3/16.

Rank-one genuine central sign, specified K-weight and finite-level splitting; exact classical multiplier/character; archimedean and all-cusp growth conditions.

DIT16, §5(5.14)–(5.16), PDF16–17; §8, PDF27–29 · needs 5.3, 5.5, 7.1, 7.2, `AF.1`, `AF.2`, `QM.3/weight-k-hyperbolic-laplacian`, `TC53`.

#### MP.7.50: BFH metaplectic kernel interface

Import the genuine genus-two BFH kernel, its theta components, two-cusp Whittaker expansions, actual local test vectors and unramified Euler-factor ratio from MP.8. Its normalized Siegel parameter is s−2 and its original newform conductor is M, while the auxiliary arithmetic level is N. MP.7 supplies the common multiplier/Fourier conventions and compares their restriction with the rank-one half-weight theory; BSD.2 consumes MP.8/bsd2-export and owns the final twist nonvanishing argument.

MP.8 exact arithmetic datum: even weightk≥2, trivial character,8M|N,N|m,4m|N²; vector-valued K-type and specified two-cusp transforms.

BFH90, §1 construction printed549, PDF8; §2 Proposition2.2 printed552, PDF11 · needs 7.49, 6.20, 8.31, 8.23, 8.76, 8.73, 8.85.

#### MP.7.51: Ramified quadratic-twist kernel inputs

For the BFH route, export the supplier’s actual ramified local character/test-vector integrals and nonzero finite K-type tests together with its normalized Euler factors. For the separate Friedberg–Hoffstein route, require the original kernel, its exact level/character restrictions, each ramified and dyadic integral, and its Fourier coefficient comparison before an identification with this common interface is asserted. The Friedberg–Hoffstein comparison requires that original kernel formula, not an identification through a formal half-weight symbol.

A specified original paper route and actual newform/local vectors; original character and conductor hypotheses must be collated. No all-local-condition nonvanishing theorem is concluded here.

BFH90, §1 quadratic-twist completion, printed551, PDF10 · needs 8.85, 8.48, 8.49, 8.50, 7.49, `AL.0`.

## MP.8: Genus-two Jacobi and Eisenstein analysis

Shared settings (the numbers below are cited only by the targets using them):

1. V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.

2. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

3. a≠0.

4. The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.

5. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

6. Fix y₂>0. The scalar coefficient φ(κ)=T(vσ(κ)) is globally divisible by φ₁ in R_k: there exists ψ∈R_k with φ(κ)=φ₁(κ)ψ(κ) for every κ∈K. This is the standing hypothesis on printed p.601 before Proposition 8.1, not merely divisibility in the positive κ(X) chart.

Library substrate: `ArithmeticFunction.moebius`, `Int.ModEq`, `Int.modEq_iff_dvd`, `Matrix.PosDef`, `Matrix.symplecticGroup`, `Matrix.toLin'`, `Matrix.unitaryGroup`, `MeromorphicOn`, `QuadraticForm`, `QuadraticMap.congr_fun`, `QuadraticMap.ext`, `QuadraticMap.linMulLin`, `QuadraticMap.linMulLin_apply`, `QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`, `QuadraticMap.toQuadraticMap_toBilin`, `SemidirectProduct`, `Submodule.exists_smith_normal_form_of_le`, `dotProductBilin`, `integrable_exp_neg_mul_sq`, `integral_gaussian`, `jacobiTheta₂`, `mul_left_cancel₀`, `TauCeti.choleskyEquiv`.

### Integral Fourier-index arithmetic

#### MP.8.1: Integral genus-two Fourier-index shift

Define S_{a,c,ℓ}(Q,R)=(Q+c(a(ℓ·−)²−(R·−)(ℓ·−)),R−2aℓ). Build its quadratic-form component from products of the coordinate linear forms, addition and integer scalar multiplication.

H1, H2.

API: For x∈V, the first projection evaluates to Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)); this is an equality in Z with the native quadratic-map evaluation; The vector projection is R−2aℓ; S_{a,c,0}(p)=p; S_{a,c,ℓ+k}(p)=S_{a,c,k}(S_{a,c,ℓ}(p)) for all ℓ,k,p; S_{a,c,−ℓ}(S_{a,c,ℓ}(p))=p, including a=0 and c=0

BFH90, (2.9), printed p.552; lattice parameter in the proof on p.553.

Tests: (1) For a=1,c=8, p=(0,0) and ℓ=e₀, the output is (8x₀²,−2e₀), with x₀² the native coordinate quadratic form; (2) For a=1,c=1 and the same zero data and shift, the output is (x₀²,−2e₀). This detects using c=N at both cusps; (3) For a=c=1, Q=x₀x₁, R=e₀ and ℓ=e₁, the output is (x₁²,e₀−2e₁). Here Q has symmetric matrix off-diagonal entries 1/2, not 1.

#### MP.8.2: Discriminant quadratic form of a Fourier index

Set Δ_{a,c}(Q,R)=4aQ−c(R·−)². This invariant is a quadratic form, rather than its determinant. In BFH coordinates its matrix is 4aT−cRRᵀ; multiplying by N gives U=4mT−N^(2−j)RRᵀ.

H1, H2.

API: Δ_{a,c}(Q,R)(x)=4aQ(x)−c(R·x)² as an equality in Z under native quadratic-map evaluation; Δ_{a,c}(0,0)=0 for all integers a,c; Δ_{a,c}(Q,0)=4a·Q in the native Z-module of quadratic forms

BFH90, (2.6), p.552, and (2.10), p.553.

Tests: (1) For a=c=1,Q=x₀x₁,R=0 and x=e₀+e₁, Δ(Q,R)(x)=4; (2) For a=1,c=8,Q=0,R=e₀, Δ(Q,R)(e₀)=−8; positive definiteness is not part of the index type; (3) At a=0,c=1, Δ(x₀²,0)=Δ(0,0); this boundary case is excluded from orbit classification by a≠0.

#### MP.8.3: Discriminant invariance under an integral shift

For every a,c∈Z, ℓ∈V and p, Δ_{a,c}(S_{a,c,ℓ}(p))=Δ_{a,c}(p).

H1, H2.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.1, 8.2.

#### MP.8.4: Residue invariance of the vector index

For all a,c∈Z, p, ℓ and i∈{0,1}, the vector coordinate of S_{a,c,ℓ}(p) is congruent to R_i modulo 2a.

H1, H2.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.1.

#### MP.8.5: Recovery from a discriminant and fixed vector

Assume a≠0. If p=(Q,R) and q=(Q′,R′) satisfy R=R′ and Δ_{a,c}(p)=Δ_{a,c}(q), then p=q.

H1, H2, H3.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.2.

#### MP.8.6: Uniqueness of the integral shift parameter

Assume a≠0. For a fixed p, the map ℓ↦S_{a,c,ℓ}(p) is injective.

H1, H2, H3.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.1.

#### MP.8.7: Classification of genus-two Fourier-index orbits

Assume a≠0. For p=(Q,R) and q=(Q′,R′), there exists ℓ∈V with S_{a,c,ℓ}(p)=q if and only if Δ_{a,c}(p)=Δ_{a,c}(q) and R_i≡R′_i modulo 2a for both coordinates.

H1, H2, H3.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.1, 8.2, 8.3, 8.4, 8.5.

#### MP.8.8: Unique Fourier index with a prescribed residue lift

Assume a≠0. Given p=(Q,R) and ν∈V with ν_i≡R_i modulo 2a, there exists exactly one integral quadratic form Q_ν such that Δ_{a,c}(Q_ν,ν)=Δ_{a,c}(p).

H1, H2, H3.

BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553 · needs 8.1, 8.2, 8.3, 8.5.

#### MP.8.9: Coefficient equality from shift invariance

Assume a≠0. Let A be any type and B a function from the native Fourier data pairs to A. Assume explicitly B(S_{a,c,ℓ}(p))=B(p) for every ℓ,p. If p and q have equal discriminant forms and coordinatewise congruent vector indices modulo 2a, then B(p)=B(q).

H1, H2, H3.

BFH90, Proposition 2.2 proof, (2.9)–(2.10) and the paragraph defining C_j, pp.552–553 · needs 8.1, 8.2, 8.7.

### Siegel geometry and theta coordinates

#### MP.8.10: Siegel upper half-space of degree two

H₂ is the subtype of complex symmetric 2×2 matrices Z with native positive-definite real matrix Im Z. It has the induced topology and the complex-manifold structure on the three independent symmetric coordinates. The positivity condition is strict.

API: Membership is Zᵀ=Z and (Im Z).PosDef; For Z∈H₂, (Im Z).PosDef; iI₂ is in H₂

BFH90, §1, p.546, definition of H₂.

Tests: (1) diag(i,2i) belongs to H₂; (2) I₂ is not in H₂; (3) [[i,1],[0,i]] is not in H₂.

#### MP.8.11: Positive genus-two symplectic similitudes

GSp₄⁺(R) consists of pairs (g,μ), g∈GL₄(R), μ∈Rˣ positive, satisfying gᵀJg=μJ for native J=[[0,−I],[I,0]]. Multiplication multiplies both components. μ is uniquely determined by g. On H₂, gZ=(AZ+B)(CZ+D)⁻¹; CZ+D is invertible and Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹.

API: (g,μ) is a member exactly when μ>0 and gᵀJg=μJ; The multiplier of gh is μ(g)μ(h); The μ=1 matrix relation agrees with SymplecticGroup.mem_iff'

BFH90, §1, pp.545–546, unnumbered GSp⁺ definition and fractional-linear action · needs 8.10.

Tests: (1) 2I₄ satisfies the relation with μ=4; (2) diag(I₂,−I₂) has μ=−1 and is excluded; (3) fractional(2I₄,iI₂)=iI₂.

#### MP.8.12: Positive similitude action on Siegel space

Define the continuous left action of GSp₄⁺(R) on H₂ by the fractional formula. The factor d(g,Z)=det(CZ+D)/μ(g) is nonzero, holomorphic in Z, satisfies d(gh,Z)=d(g,hZ)d(h,Z), and equals 1 for positive scalar matrices.

API: 1 acts identically; (gh)Z=g(hZ); d(gh,Z)=d(g,hZ)d(h,Z); The underlying matrix of the native Siegel-space action is (AZ+B)(CZ+D)⁻¹, matching the raw block formula

BFH90, §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7) · needs 8.11.

Tests: (1) 2I₄ fixes iI₂; (2) n(I₂) sends iI₂ to (1+i)I₂; (3) J sends iI₂ to iI₂ (JZ=−Z⁻¹).

#### MP.8.13: Genus-two square-root double cover

The positive real cover consists of (g,h), g∈GSp₄⁺(R), h:H₂→C continuous with h(Z)²=d(g,Z). Multiplication is (g,h)(g',h')=(gg',Z↦h(g'Z)h'(Z)). Its projection is a continuous surjective homomorphism with kernel {(1,1),(1,−1)}. On μ=1 compare it with MP.1's intrinsic metaplectic double cover, preserving the central sign; positive scalars split by h=1.

API: h(Z)²=d(g,Z); The root of the product at Z is h(g'Z)h'(Z); For g=1, the root is identically 1 or identically −1

BFH90, §2, pp.552–554, (2.7)–(2.14); §8, p.601 · needs 8.12, `MP.1`.

Tests: (1) The constant roots 1 and −1 are distinct lifts of the identity; (2) √(−det(iI₂))=1; (3) √(−det(2iI₂))=2, detecting the determinant rather than entrywise square root.

#### MP.8.14: Compact stabilizer and positive scalar factor

Let K=Sp₄(R)∩O₄(R). The stabilizer of iI₂ in Sp₄(R) is K, K≅U(2) by A+iB↦[[A,B],[−B,A]], and the stabilizer in GSp₄⁺(R) is R_{>0}·K. The Iwasawa representation g=t n(X)diag(Q,Q⁻ᵀ)κ with t>0, Q upper triangular with positive diagonal, κ∈K is unique.

BFH90, §1, pp.548–549, (1.12)–(1.17) · needs 8.12.

#### MP.8.15: BFH arithmetic subgroup

For N>0, Γ_N is the subgroup of Sp₄(Z) with C≡0 mod N, A₂₁≡D₁₂≡0 mod N. Conjugate by J to obtain the second cusp group. The elliptic lattices are (λ,ρ)∈Z²×N⁻¹Z² at cusp zero and N⁻¹Z²×Z² at cusp one; the center is fixed by ψ_m(t)=e(mt).

API: Membership has exactly the three printed block congruences; Identity is a member for every N; n(X) is a member for each integral symmetric X

BFH90, §1, p.547, (1.6)–(1.9) · needs `MP.6`.

Tests: (1) n([[0,1],[1,0]])∈Γ₈; (2) [[I,0],[I,I]] is not in Γ₈; (3) Γ₁ equals the native Sp₄(Z).

#### MP.8.16: BFH symplectic Jacobi slash operator

For m∈Z and γ∈Sp₄(R), on functions Φ(g,W) define (Φ|γ)(g,W)=e(−m Wᵀ(CZ_g+D)⁻¹CW) Φ(γg,(CZ_g+D)⁻ᵀW). This is the coordinate realization of the imported MP.6 Jacobi action with central character ψ_m. The operator is restricted to the symplectic factor; extending it to similitudes requires scaling the central character.

API: Φ|1=Φ on positive-similitude arguments; (Φ|γ)|γ'=Φ|(γγ'); Φ|J=e(−m Z_g⁻¹[W])Φ(Jg,Z_g⁻¹W)

BFH90, §1, p.547, (1.1) · needs 8.12, `MP.6`.

Tests: (1) The slash of the zero function is zero; (2) At γ=n(B), symmetric B, there is no quadratic multiplier and W is unchanged; (3) At g=I and γ=J, the W argument is −iW and the multiplier is e(mi WᵀW).

#### MP.8.17: BFH elliptic translation operator

Define (Φ||[λ;ρ])(g,W)=e(m Z_g[λ]+2m Wᵀλ) Φ(g,W+Z_gλ+ρ), for real λ,ρ. For the order (Φ||[λ;ρ])||[κ;ν], the operator at [λ+κ;ρ+ν] is multiplied by e(2mνᵀλ). The lattice used by BFH kills this scalar because N|m. This is an explicit specialization of the MP.6 Heisenberg central character, not a commutative translation action over arbitrary reals.

API: Translation by [0;0] is identity; The order (Φ||[λ;ρ])||[κ;ν] has central phase e(2mνᵀλ); Translation preserves pointwise addition

BFH90, §1, p.547, (1.2)–(1.5) · needs 8.16, `MP.6`.

Tests: (1) At m=8, ν=e₀/8, λ=e₀ the phase is e(2)=1; (2) At m=1, ν=e₀/4, λ=e₀ the phase is −1; (3) At m=1, λ=e₀, ρ=0, g=I, W=0, translation of constant 1 is exp(−2π).

#### MP.8.18: BFH genus-two theta series

For positive integer a and ν∈Z², specialize the MP.6 theta kernel to θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW). The series is normally convergent on H₂×C². Its finite residue set is (Z/(2a)Z)², of size (2a)². No rank-one Jacobi-form definition is introduced here.

API: θᵃ_{ν+2aℓ}=θᵃ_ν; θ(Z,W)=e(aZ[λ]+2aWᵀλ)θ(Z,W+Zλ+ρ) for integral λ,ρ; At ν=0 and diagonal Z, θ=∏i jacobiTheta₂(2aW_i,2aZ_ii)

BFH90, §2, p.551, (2.1) · needs 8.10, `MP.6`.

Tests: (1) θᵃ_{−ν}(Z,−W)=θᵃ_ν(Z,W); (2) θ¹_(2,0)=θ¹_(0,0); (3) θ¹_0(iI₂,0)=jacobiTheta₂(0,2i)².

#### MP.8.19: Half-integral matrix dictionary

For native Q:QuadraticForm Z Z², put A=Q(e₀), C=Q(e₁), B=Q(e₀+e₁)−A−C. Define T(Q)=[[A,B/2],[B/2,C]] in M₂(Q). This identifies native integral quadratic forms with symmetric rational matrices having integral diagonal and twice-integral off-diagonal. Q(x)=xᵀT(Q)x for integral x.

API: T(Q) is symmetric; For integral x, xᵀT(Q)x=Q(x); The matrix dictionary is injective

BFH90, §2, pp.551–553, (2.2),(2.9).

Tests: (1) T(x₀x₁)=[[0,1/2],[1/2,0]]; (2) T(x₀²)=diag(1,0); (3) T(−x₀²)=diag(−1,0); no positivity condition is included.

#### MP.8.20: BFH Fourier coefficient extraction

For j=0 or 1, define B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX. X=[[x₄,x₃],[x₃,x₁]], T is the half-integral matrix of Q, R∈Z², and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in Z_g; it is not the unnormalized torus Fourier integral.

API: The zero function has every coefficient zero; Extraction is additive for integrable summands on the boxes; Extraction commutes with complex scalar multiplication

BFH90, §2, pp.551–553, (2.2)–(2.3) · needs 8.19, 8.16, 8.17.

Tests: (1) For constant 1, the coefficient at Q=0,R=0 is 1 at both cusps; (2) For Φ(g,W)=e(N^(1−j)RᵀW), Q=0 and matching R, the coefficient is 1; (3) For constant 1 and nonzero R, the coefficient at Q=0 is 0 (N>0).

#### MP.8.21: Gaussian orthogonality of genus-two theta series

For a>0, Z=X+iY∈H₂ and μ,ν∈Z², the Lebesgue integral over C²/(Z Z²+Z²) of θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W]) is √det(Y)/(2a) if μ≡ν mod 2a, and zero otherwise. In W=Zλ+ρ coordinates the measure is det(Y)dλdρ on [0,1)^4.

BFH90, Proposition 2.1, p.551 · needs 8.18, 8.75.

#### MP.8.22: Holomorphic contour shift for Fourier coefficients

If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).

BFH90, §2, pp.552–553, (2.9) · needs 8.20, 8.17, 8.1, 8.9, 8.26.

#### MP.8.23: BFH two-cusp theta decomposition

Under the Jacobi regularity and lattice hypotheses above, there are unique components E_j(g;ν), ν mod 2a, satisfying Φ_j(g,W)=Σν E_j(g;ν) θᵃ_ν(N^(1−2j)Z_g,N^(1−j)W). Put C_j(g;U,ν)=B_j(g;T,ν) if T=(U+N^(2−j)ννᵀ)/(4m) is half-integral, and 0 otherwise. Then E_j(g;ν)=Σ_{U integral symmetric} C_j(g;U,ν)e(tr(UZ_g)/(4mN^j)), with the convergence inherited from the Fourier expansion.

BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6) · needs 8.21, 8.22, 8.7, 8.8, `MP.6`, 8.27, 8.28, 8.26, 8.75.

#### MP.8.24: Genus-two theta Fourier transform

For a>0 and Z∈H₂, θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W). The holomorphic branch √(−det Z) is positive when Z=iY. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).

BFH90, §2, p.554, (2.12)–(2.13) · needs 8.18, `MP.2`, `MP.6`.

#### MP.8.25: Fourier law for BFH theta components

For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

BFH90, Proposition 2.2, p.552, (2.7)–(2.8) · needs 8.23, 8.24, 8.16, 8.27, 8.26.

#### MP.8.26: BFH Jacobi coordinate space

Specialize the MP.6 Jacobi space to smooth Φ_j:GSp₄⁺(R)×C²→C, holomorphic in W, invariant under Γ_N for j=0 or J⁻¹Γ_NJ for j=1, and under ||[N^−jℓ;N^(j−1)r] for integral ℓ,r. For vector values impose these conditions after every continuous linear functional. Supply the MP.6 weight and multiplier separately; lattice invariance does not determine them.

API: The zero coordinate function belongs; Every member satisfies its scaled elliptic lattice law; Slash by J transports cusp zero to cusp one

BFH90, §1, p.547, (1.6)–(1.9) · needs 8.15, 8.16, 8.17, `MP.6`.

Tests: (1) Zero belongs for N=8,m=16 at each cusp; (2) Constant 1 belongs at index m=0; (3) Constant 1 is excluded at N=8,m=16.

#### MP.8.27: BFH theta component projection

For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition theorem.

API: Zero function has component zero; Components only depend on ν mod 2a; Scaling the Jacobi coordinate function scales its Gaussian component projection

BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6) · needs 8.21, 8.18.

Tests: (1) Projecting θᵃ_μ yields 1 at congruent ν and 0 otherwise; (2) The component of the zero coordinate function is zero; (3) At N=8,a=2,j=1, the residue vectors (0,5) and (0,1) give the same component.

#### MP.8.28: Theta-component Fourier coefficients

C_j(g;U,ν) is the Fourier coefficient B_j(g;T,ν) with T=(U+N^(2−j)ννᵀ)/(4m); set it to zero if this is not an integral quadratic form, equivalently a half-integral symmetric matrix. This computational construction is defined before imposing Jacobi invariance. For the actual BFH family, the shift theorem makes the residue choice independent.

API: If U=4mT−N^(2−j)ννᵀ, recover B_j(g;T,ν); The zero coordinate function has zero C_j; C_j(cΦ)=cC_j(Φ)

BFH90, §2, pp.552–553, before Proposition 2.2 · needs 8.19, 8.20, 8.22.

Tests: (1) All theta Fourier coefficients of zero vanish; (2) For N=8,m=16,j=1,U=I,ν=0 the coefficient is zero for any coordinate function; (3) At N=8,m=16,j=1,U=diag(0,56),ν=(0,1), the recovered index is T=diag(0,1).

### Newform seeds and archimedean Whittaker analysis

#### MP.8.29: Elliptic-newform section on genus-two similitudes

For the normalized even-weight k≥2 newform f of level M, 8M|N, put f̂(τ)=τ^−k f(−1/(Nτ)) and F(Q)=f̂(Qi)(ci+d)^−k det(Q)^(k/2). Given continuous finite-dimensional right K-type σ trivial on −I and vσ(κ)=ρ_k(κ)v on SO(2), define I(t n(X)diag(Q,Q^−ᵀ)κ)=F(Q)vσ(κ). Iwasawa uniqueness makes this well defined; positive scalars act trivially. The original newform’s completion uses conductor M.

API: I(I₄)=F(I₂)v; F=0 gives I=0; Scaling F scales I

BFH90, §1, pp.547–550, (1.11)–(1.16) · needs 8.14, `AF.5`, `TC55`, `TC56`, `R16.2`.

Tests: (1) F(I₂)=1 implies I(I₄)=v; (2) v=0 gives I=0; (3) I(2I₄)=I(I₄).

#### MP.8.30: BFH normalized section family

For the seed I, set I_s(g)=det(Im Z_g)^(s/2) I(g), using the positive-real logarithm, g∈GSp₄⁺(R). This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.

API: I₀=I; I_(s+t)=det(Y)^(t/2) I_s; For each positive g the section is entire in s

BFH90, §1, p.549, (1.17) · needs 8.29, 8.12.

Tests: (1) At g=I₄ the section is I(I₄) for every s; (2) At diag(2I₂,(1/2)I₂) the scalar is 4^s; (3) A zero seed yields the zero family.

#### MP.8.31: Genus-two Jacobi Eisenstein series

For the genuine elliptic-newform seed, define E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W), where P consists of n(X)diag(Q,Q⁻ᵀ) with detQ>0. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functionals commute with convergent sums. Its theta components are genuine half-integral-weight automorphic forms on the double cover.

H4, H5.

API: Zero seed gives zero series; Scaling the seed scales the series; The identity coset,λ=0 summand is I_s(g)

BFH90, §1, p.549, definition of E_s · needs 8.30, 8.15, 8.16, 8.17, `MP.6`.

Tests: (1) Every coefficient of the zero-seed E_s is zero; (2) At g=I,W=0 the identity-coset,λ=0 summand is I(I); (3) At g=I,W=0,m=1,λ=e₀ the identity-coset summand is exp(−2π)I(I).

#### MP.8.32: Genus-two archimedean Whittaker functions

For k≥2 even and φ(κ)=T(vσ(κ)) with the BFH SO(2) weight k, define W^ε(y₁,y₂;s)=(y₁y₂)^(4−s)y₂^(k/2)∫_{R³} √(−det(X+iI))/|det(X+iI)|^s e(εy₁x₁)e(y₂(x₂'+iy₂'))(y₂')^(k/2)φ(κ(X))dX. Here ε=+1,−1 or 0, X=[[x₄,x₃],[x₃,x₁]], x₂'=−x₃(x₁+x₄)/(1+x₁²+x₃²), y₂'=√(1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)²)/(1+x₁²+x₃²)>0. κ(X) is uniquely specified by (3.2) with Q' positive triangular and the root is 1 at X=0. ε=0 is the degenerate W⁰.

API: φ=0 implies W=0; Scaling φ scales W; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s)

BFH90, §3, pp.557–559, (3.1)–(3.8) · needs 8.14, 8.29, 8.13.

Tests: (1) W^+ of the zero matrix coefficient is zero; (2) At X=0 and φ=1 the kernel is exp(−2πy₂) for every sign; (3) W⁰(2,y₂;s)=2^(4−s)W⁰(1,y₂;s).

#### MP.8.33: Three-variable Whittaker majorant

Put D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)². The positive function D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ is integrable on R³ if α>1/2, 2α+β>3/2 and α+β+γ>1. These are sufficient conditions; no necessity assertion is made.

BFH90, §3, p.559, Proposition 3.1 · needs 8.32.

#### MP.8.34: Whittaker integral convergence

For k≥2 even, a continuous finite-dimensional BFH K-type σ, weight-k v, T linear, φ(κ)=T(vσ(κ)), ε∈{−1,0,1}, y₁,y₂>0, the integral defining W^ε is absolutely convergent for Re s>2, locally uniformly with derivatives in s on compact subsets of that half-plane.

BFH90, §3, p.559, Proposition 3.2 · needs 8.33, 8.29.

#### MP.8.35: Two-parameter Jacquet integral

For the BFH K-type, let F_v(n(E(x₂))m(Y)κ)=|det Y|^s y₂^r vσ(κ), Y=√y₁ diag(y₂,1). Define V^ε(y₁,y₂;s,r)= (−1)^(k/2)y₁^(4−s)y₂^(5−r−s)∫_{R×R³} F_v(Jm(E(x₂))n(X))√(−det(X+iI))e(εy₁x₁)e(y₂x₂)dX dx₂. Set W^ε(s,r)=π^−r Γ(r+k/2)V^ε(s,r). The section is homogeneous exactly as (3.11); both integrals are initially interpreted in their absolute-convergence chamber.

API: Scaling v or T scales V and W; additive linearity is asserted in a common convergence chamber and then by analytic continuation; W(s,r)=π^−r Γ(r+k/2)V(s,r); For Re s>(3+k)/2 and r=k/2, W(s,r)=W(s)

BFH90, §3, pp.559–561, (3.11)–(3.15) · needs 8.32, 8.29.

Tests: (1) v=0 gives V=W=0; (2) At k=2,r=1 the normalizing factor is π^−1 Γ(2)=π^−1; (3) The special-function factor becomes y^(k/2)e^−y/2 at r=k/2, retaining the k/2 exponent.

#### MP.8.36: Jacquet reflection in the auxiliary parameter

The V-family continues analytically to Re(s+r)>5/2 and Re(s−r)>3/2. Its gamma-normalized W-family satisfies W^ε(s,r)=W^ε(s,1−r). At r=k/2 and Re s>(3+k)/2 this is the original Whittaker function. This uses the classical identity W_{κ,μ}=W_{κ,−μ} and its specialization W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2.

BFH90, §3, pp.560–561, Proposition 3.3 · needs 8.35.

#### MP.8.37: Gamma-normalized Jacquet Weyl relation

For torus weight n, φ(θ_tκ)=e^−intφ(κ), put V̂^ε=2^−sπ^−sΓ(A_ε)Γ(B_ε)V^ε, with A_ε=(s−r+εn+(ε−1)/2)/2 and B_ε=(s+r+εn+(ε+1)/2)/2. Use these gamma factors from the explicit evaluations (3.26)–(3.27). Prove V̂^ε(s,r)=V̂^ε(r+3/2,s−3/2), meromorphically at gamma poles. V continues analytically for Re r>1/2, Re s>2. Torus decomposition can change the SO(2) weight.

BFH90, §3, p.562, Proposition 3.4, (3.18)–(3.19); pp.563–565, (3.26)–(3.27) and explicit V̂ displays · needs 8.36.

#### MP.8.38: Whittaker holomorphy beyond convergence

For the BFH weight-k matrix coefficients and either ε=±1, W^ε(y₁,y₂;s) has a holomorphic continuation to Re s>3/2. Its initial integral need not be absolutely convergent throughout this domain. At s=2 the apparent gamma singularities from the two-parameter reflections cancel.

BFH90, §3, pp.565–566, Proposition 3.5 · needs 8.34, 8.36, 8.37.

#### MP.8.39: Whittaker decay in both positive variables

On compact parameter sets in Re s>3/2, for ε=±1 there are C and a Schwartz function ξ on R² with ||W^ε(y₁,y₂;s)||≤(y₁y₂)^−C ξ(y₁,y₂), y₁,y₂>0; the corresponding differentiated estimates hold where the convolution argument applies. The degenerate W⁰ does not have this two-variable decay conclusion.

BFH90, §3, pp.566–567, Proposition 3.6 · needs 8.38, `AS.1`, `AF.1`.

#### MP.8.40: Degenerate Whittaker continuation and decay

W⁰ continues holomorphically to Re s>3/2. For each fixed y₁>0 and compact parameter sets it decreases rapidly as y₂→∞, with polynomial control at y₂→0; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s). No rapid decay in y₁ follows, because its x₁ character is trivial.

BFH90, §3, pp.574–576, Proposition 3.14, (3.46)–(3.47) · needs 8.34, 8.35.

#### MP.8.41: Whittaker test coefficient algebra

Let R_k span the finite U(2) matrix coefficients of SO(2) weight k and trivial −I action, with uniform-topology closure. The weight-zero coefficients φ₁=detB=|det(X+iI)|⁻¹, φ₂=(det(X)²−1)x₁/|det(X+iI)|⁴, φ₃=x₃(1−detX)/|det(X+iI)|² preserve R_k by multiplication. They extend globally as compact-group coefficients. In the U(2) model φ₁(q)=det(Im q) can change sign; φ=φ₁ψ must hold on all K, including the chart boundary.

API: R₀R_k⊆R_k via tensor product of K-types; R_k is dense in continuous weight-k compact-group functions; The three global coefficients have the displayed chart formulas; The global polynomial det(Im q) restricts to the positive testPhi1(X) on κ(X); The right-rotated global value is (1+zx₁)φ₁(X)/Δ_z, retaining its sign on both branches

BFH90, §3, pp.567–569, Propositions 3.7–3.8 · needs 8.32, `TC60`.

Tests: (1) The chart values at zero are (1,0,0); (2) At (x₁,x₃,x₄)=(1,0,0), φ₂=−1/4; (3) At (0,1,0), φ₃=1/2; (4) For X=diag(0,−2),z=1, the global coefficient at κ(X)κ_z is −1/√10, whereas the positive chart coefficient at X(z)=diag(0,3) is +1/√10. They cannot be identified without the compact transition.

#### MP.8.42: Bounded holomorphic strip for test coefficients

Every finite matrix coefficient h, including its right translate by κ₀∈K, admits a bounded holomorphic extension in x₁ on |Im x₁|≤ε, uniformly for real x₃,x₄ and κ₀, for each 0<ε<1. This includes polynomials in φ₁,φ₂,φ₃ and suffices for the upward contour shift in (3.41). The printed one-sided region includes the singularity −i and is false.

BFH90, §3, p.568, Proposition 3.9; p.571, (3.41) · needs 8.41.

#### MP.8.43: Rotated Whittaker scalar estimate

Let κ_z correspond to diag(1,(1−iz)/Δ_z), Δ_z=√(1+z²), and let φ∈R_k be globally divisible by φ₁. Use φ(κ(X)κ_z) and the full (y₁y₂)^(4−s)y₂^(k/2) prefactor in (3.38). Prove absolute convergence for Re s>3/2 and the bound C′y₁^(4−Re s) for y₂>C,y₁>0,z∈R, locally uniformly in s. The global divisor vanishes at 1+zx₁=0. Elsewhere φ₁(κ(X)κ_z)=(1+zx₁)φ₁(X)/Δ_z, whereas φ₁(X(z))=|1+zx₁|φ₁(X)/Δ_z. Establish the compact transition on both signs; the blanket chart equality (3.31) does not supply this proof.

BFH90, §3, pp.569–571, Proposition 3.10, (3.31)–(3.39) · needs 8.42, 8.38.

#### MP.8.44: Novodvorsky Mellin transform

For ε=±1 define F^ε(u,s;y₂)=∫_{y₁>0}∫_{z∈R} T(W^ε(Δ_z^−2 y₁,Δ_z y₂;s)σ(κ_z)) e(−ε y₁z/(1+z²)) y₁^(u−3/2)√(1+iz) dz dy₁/y₁, with the continuous root equal to 1 at z=0. This is an iterated integral in that order; substituting the R³ kernel does not give a jointly absolutely convergent integral.

API: The transform of the zero coefficient is zero; F is linear in the matrix coefficient; The + Whittaker function uses e(−y₁z/(1+z²)); the − one uses its inverse

BFH90, §3, p.570, (3.37); pp.571–574, Propositions 3.11–3.12 · needs 8.43.

Tests: (1) F of zero vanishes for both signs; (2) At z=0 the extra square-root factor is 1; (3) At y₁=z=1, the two oscillatory factors both equal −1.

#### MP.8.45: Novodvorsky analytic continuation

For φ divisible by φ₁, the Novodvorsky transforms continue holomorphically for Re s>3/2 and Re(u−s+5/2)>0, initially agreeing with the iterated integral for Re u large. The large-y₁ tail uses nondegenerate rapid decay and the small-y₁ tail uses Proposition 3.10. This assertion is not joint absolute convergence of the expanded R³×R×R₊ kernel.

BFH90, §3, pp.571–574, Propositions 3.11–3.12 · needs 8.44, 8.43, 8.39.

#### MP.8.46: Rank-zero Laplace coefficient

Define τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz, where η,w,J are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate W⁰ term. Apply T only after forming the vector-valued integral.

API: Zero v gives τ=0; Scaling v or T scales the Laplace coefficient; For y₂>0 the coefficient is entire in s

BFH90, §3, p.571, (3.39)–(3.41) · needs 8.29, 8.44.

Tests: (1) τ of the zero coefficient is zero; (2) The scalar integrand factor at z=0 is e^−2πy₂; (3) For k=2,s=1 the Δ_z power is zero.

#### MP.8.47: Degenerate boundary Mellin coefficients

Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

API: M and M̃ are linear in v and T; Both are holomorphic for Re s>3/2 at fixed y₂>0; The multiplier is Δ_z^(2s−8)√(1+iz)

BFH90, §3, p.576, (3.48)–(3.49) · needs 8.40, 8.44, 8.41.

Tests: (1) Zero v gives M=M̃=0; (2) At s=2 the Δ_z multiplier is (1+z²)^−2; (3) At z=0 the additional multiplier is 1.

#### MP.8.48: Nonzero Novodvorsky tests with vanishing rank zero

For each even k≥2 and (u,s) with Re s>3/2, Re(u−s+5/2)>0, construct finite-dimensional σ, weight-k v and T with continued TF⁺,TF⁻ analytic on that domain and Tτ≡0. For each sign separately find y₂^ε>0 with TF^ε(u,s,y₂^ε)≠0. A coefficient divisible by φ₁φ₂ suffices; the two y₂ need not agree.

BFH90, §3, pp.573–574, Proposition 3.12 · needs 8.45, 8.46, 8.41.

#### MP.8.49: Nonzero rank-zero test

For each Re s>3/2 there exist actual finite-dimensional σ, weight-k v, T and y₂>0 with Tτ(s,y₂)≠0, while both TF^± have the continuation domain of Proposition 3.12. Choose φ divisible by φ₁ and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.

BFH90, §3, p.574, Proposition 3.13 · needs 8.45, 8.46, 8.41.

#### MP.8.50: Nonzero degenerate residue test

There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.

BFH90, §3, p.577, Proposition 3.15 · needs 8.47, 8.45, 8.46, 8.41.

### Real and adelic actions on theta components

#### MP.8.51: Similitude action on the Jacobi group

On H(W)=W×R with central term ω(w,w′)/2, define the GSp₄ action (w,t)↦(gw,μ(g)t). Pull back to the double cover and form H(W)⋊G̃Sp₄. The character e(mt) is fixed only when μ=1; a positive similitude transports m to μm. Specialize to the BFH slash lattices with their central phases and index m/N.

BFH90, §1, pp.546–549, (1.4)–(1.9) · needs 8.11, 8.13, 8.16, 8.17, `MP.6`.

#### MP.8.52: Full real similitude extension

With r=diag(I₂,−I₂), each negative similitude is uniquely g₊r. Set c(Z)=−conj Z. The involution (g,ρ)↦(rgr,conj(ρ∘c)) of the positive cover follows from d(rgr,Z)=conj d(g,c(Z)). Form G̃Sp₄(R)=G̃Sp₄⁺(R)⋊C₂; its projection has kernel {±1} and r has an order-two lift. Comparison with a specified adelic extension requires an additional input; BFH uses the positive component.

API: The positive cover embeds as the identity-component subgroup; The projection kernel is exactly {±1}; The chosen lift of r has square 1 and conjugates by the stated involution

BFH90, §1, pp.545–546, definition of GSp⁺(4,R) · needs 8.13, `MP.4`.

Tests: (1) μ(r)=−1 and r²=I₄; (2) c(iI₂)=iI₂; (3) The involution fixes both kernel elements.

#### MP.8.53: Arithmetic and adelic cover compatibility

From MP.4’s normalized rank-two restricted-product cover and rational Sp₄(Q) splitting, construct the BFH real arithmetic lift into the adelic quotient with its Schrödinger lattice vector fixed at finite level. Match the real theta multiplier and the J change of cusp. Explicitly specify the finite multiplier, dyadic splitting for 8M|N and the extension to Qˣ similitudes before using the comparison.

BFH90, §1, pp.545–549; §2, p.553, (2.6) · needs 8.52, 8.15, 8.24, `MP.1`, `MP.2`, `MP.4`.

#### MP.8.54: Theta component Levi transformations

Let E(n)=[[1,n],[0,1]], N|n. Then E₁(m(E(n))g;ν)=E₁(g;E(n)ᵀν), and E₀(m(E(n)ᵀ)g;μ)=E₀(g;E(n)μ). For ν=(0,r), the first component and the finite Fourier combination Σμ e(−Nν·μ/(2m))E₀(g;μ) are invariant under the relevant E(n) action. This is Proposition 2.3 and its Corollary 2.4, with the transpose on the correct cusp.

BFH90, §2, pp.554–555, Proposition 2.3, Corollary 2.4 · needs 8.23, 8.25.

#### MP.8.55: Theta component unipotent transformations

For ν=(0,r), E₁(n(V)g;ν)=E₁(g;ν) if V is integral symmetric, N|V₁₁,V₁₂ and 4m|V₂₂. E₀(n(V)g;μ)=E₀(g;μ) for every integral symmetric V and every μ. For N|n the lower-unipotent laws are √det(I+U₁(n)Z_g)E₁(lower(U₁(n))g;ν)=E₁(g;ν) and √det(I+U₀(n)Z_g)Σμ e(−Nν·μ/(2m))E₀(lower(U₀(n))g;μ)=Σμ e(−Nν·μ/(2m))E₀(g;μ), U₁(n)=diag(0,n), U₀(n)=diag(n,0). Roots are the cover lifts continued from n=0.

BFH90, §2, pp.555–556, Propositions 2.5–2.6 · needs 8.54, 8.25.

#### MP.8.56: Fourier coefficient Levi covariance

For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.

BFH90, §2, pp.556–557, Proposition 2.7, Corollary 2.8 · needs 8.20, 8.23, 8.54, 8.28.

### Primitive matrix inversion and cusp unfolding

#### MP.8.57: Matrix Möbius function

For nonsingular integral H with positive Smith invariants a|b, define μ₂(H)=gcd(a,b)μ(a)μ(b). Prove independence of the Smith presentation and left/right GL₂(Z) invariance. H|C means H⁻¹C integral, modulo right GL₂(Z) on H. Set μ₂=0 on singular matrices; divisor theorems require nonsingular C and full-rank H.

API: A unimodular H has μ₂(H)=1; On Smith diagonal a|b, μ₂=gcd(a,b)μ(a)μ(b); μ₂(UHV)=μ₂(H) for U,V unimodular

BFH90, §4, pp.577–578, definition before Proposition 4.1.

Tests: (1) μ₂(I₂)=1; (2) μ₂(pI₂)=p for a prime p; (3) μ₂(diag(p²,1))=0.

#### MP.8.58: Primitive symmetric pairs and symplectic completion

A full-row-rank symmetric integral pair (C,D), CDᵀ=DCᵀ, is primitive when GC,GD integral implies rational G integral. Prove equivalence with being a bottom row in Sp₄(Z), and factor (C,D)=H(C₀,D₀) with H nonsingular integral and the pair primitive. Common matrix divisors are exactly divisors of H; primitivity is equivalent to H unimodular.

BFH90, §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2 · needs 8.57.

#### MP.8.59: Matrix Möbius divisor identity

For nonsingular C∈M₂(Z), the finite sum Σ_{H|C / right GL₂(Z)} μ₂(H) is 1 if C is unimodular and 0 otherwise.

BFH90, §4, p.578, Proposition 4.1 · needs 8.57.

#### MP.8.60: Primitive matrix Möbius inversion

For h on rational symmetric matrices, periodic under integral symmetric translations, put S_h(C)=Σ_{D mod C,CDᵀ=DCᵀ}h(C⁻¹D). Its primitive version satisfies S_h#(C)=Σ_{H|C}μ₂(H)S_h(H⁻¹C), for nonsingular C. If C≡0 modN, also impose gcd(detD,N)=1,D₁₂≡0 modN and restrict H to gcd(detH,N)=1. Choose N-adapted Hermite H=[[r,s],[0,t]], s≡0 modN: the ordinary class s modr has a representative in NZ, unique modulo Nr. Then H is diagonal modN and division preserves the D₁₂ condition; arbitrary representatives need not.

BFH90, §4, p.579, Propositions 4.3–4.4 · needs 8.58, 8.59.

#### MP.8.61: Genus-two finite exponential sums

For det C≠0, T half integral symmetric and R∈Z², define S₁(C;T,R)=Σ_{D mod NC,CDᵀ=DCᵀ, primitive(C,D),D≡0 mod N} Σ_{λ∈Z²/CᵀZ²} e(−RᵀC⁻¹Dλ+m(C⁻¹D)[λ]+N⁻¹tr(TC⁻¹D)). Define S₀ by D mod C, D₁₂≡0N and the phase −NRᵀC⁻¹Dλ+m(C⁻¹D)[λ]+tr(TC⁻¹D), requiring C≡0N. Here D mod LC means D'=D+LC S for an integral symmetric S. The quotient is taken inside the symmetric pairs; the second quotient is the image lattice CᵀZ². Phases must descend before summing.

API: Changing either representative leaves the character and sum unchanged under the stated conditions; S₁(I₂;T,R)=1; If gcd(det C,N)>1 then S₁(C;T,R)=0

BFH90, §5, p.580, (5.2); p.582, (5.4) · needs 8.58, 8.15, 8.60.

Tests: (1) S₁(I₂;0,0)=1; (2) For p|N, S₁(pI₂;T,R)=0; (3) For N=1,m=1,C=diag(1,3),T=R=0, S₁=0: the two primitive D₂₂ classes yield opposite quadratic Gauss phases.

#### MP.8.62: Genus-two Fourier unfolding kernel

For Y=QQᵀ positive definite, Z=X+iY, detC≠0, define H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX. The positive-base power is exp((s/2)log(detY/|detZ|²)). Its quadratic shift identity is H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0) when T=(U+N^(2−j)RRᵀ)/(4m).

API: A zero seed gives H=0; H is linear in the seed and commutes with continuous linear functionals in its convergence chamber; Substituting T=(U+N^(2−j)RRᵀ)/(4m) gives the stated R=0 kernel

BFH90, §5, p.580, definition of H before Proposition 5.1 · needs 8.29, 8.61, 8.19.

Tests: (1) H of zero is zero; (2) At X=0,Y=I₂ the root factor is 1; (3) N=8,m=16,j=1,R=(0,1),U=0 gives T=diag(0,1/8); its two exponent terms cancel.

#### MP.8.63: Cusp-one full-rank Fourier unfolding

For Re s large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{detC≠0,C₁₂≡0(N)/left Γ⁰(N)}S₁(C;T,R)|detC|^−sH(Q,s;C,T,R). Primitivity and D≡0 modN force full rank in this cusp. The condition is C₁₂≡0 modN.

H4, H5.

BFH90, §5, pp.580–582, Proposition 5.1 · needs 8.20, 8.61, 8.62, 8.31.

#### MP.8.64: Cusp-zero Fourier rank expansion

For Re s sufficiently large, B₀ is the full-rank sum Σ_{C nonsingular,C≡0N / left Γ₀(N)}S₀(C;T,R)|detC|^−s N³H(Q,s;C,NT,NR), plus the rank-one coset contribution, plus δ_{NR/(2m)∈Z²}detY^(s/2)∫_{X mod integral symmetric} [I(g)+I(m(η)g)]e(N²Z[R]/(4m)−tr(TZ))dX. The rank-one term is the original coset sum with rank C=1, before its cuspidal Whittaker cancellation.

H4, H5.

BFH90, §5, pp.582–583, Proposition 5.2 · needs 8.63, 8.58.

#### MP.8.65: Genus-two Whittaker coefficient extraction

For ν=(0,r), D∈Z, n₂=q/N>0 and n₁=N(r²−D)/(4m) integral, define C₁(s;D,n₂,r;y₁,y₂)=N⁻¹∫₀ᴺ C₁(m(E(x₂))m(√y₁diag(y₂,1));U₁(−ND),ν)e(−n₂x₂)dx₂. Define C₀ by the finite Fourier sum Σμ e(−Nν·μ/(2m)) of C₀ at m(E(−x₂)ᵀ)m(√y₁diag(y₂,1)), index U₀(−D), and the same normalized x₂ integral. The latter vanishes unless 4m|D; both are well defined by the coefficient covariance and periods. At cusp zero extend the extracted function by zero outside 4m|D before using its parity API.

API: Extraction is linear in the theta-component family; The value is independent of the interval representative of length N under the proven period law; The cusp-zero coefficient is zero if 4m does not divide D

BFH90, §6, pp.583,585–586, definitions before Propositions 6.1–6.2 · needs 8.56, 8.55, 8.27, 8.28.

Tests: (1) The zero component has zero extraction; (2) A component e(qx₂/N)c extracts c at frequency q/N; (3) A component e(qx₂/N)c extracts zero at a distinct integral frequency q'/N.

#### MP.8.66: BFH first-cusp Dirichlet series

For the preceding parameters and the original normalized newform f with Fourier coefficients a(n), set L(s,D,n₂)=Σ_{α,δ>0; β mod Nδ;N|β;α|Nn₂δ} S₁([[α,β],[0,δ]];U₁(n₁),ν)(αδ)^−s(α/δ)^(k/2)a(Nn₂δ/α)e(n₂β/α). Put L(s,D)=L(s,D,N⁻¹). Positive real powers use the real logarithm. The congruence and divisibility constraints are part of the actual summation set.

H4, H5.

API: Scaling a scales L; The α=δ=1,β=0 term is a(q) when n₂=q/N; L(s,D)=L(s,D,N⁻¹)

BFH90, §6, pp.583–584; §7, p.589, (7.1) · needs 8.61, 8.65, `TC54`, `TC55`.

Tests: (1) a=0 gives L=0; (2) For q=1 and a(1)=1 the identity term is 1; (3) For q=1,α=2,δ=1 there is no summand.

#### MP.8.67: BFH opposite-cusp Dirichlet series

For 4m|D, set P(s,D,n₂,r)=Σ_{μ mod 2m/N}e(−Nν·μ/(2m))Σ_{γ∈Γ₀(N)\SL₂(Z)}Σ_{αδ>0;β mod δ;α|Nn₂δ} S₀(Nγ⁻ᵀCw;T,μ)(N²αδ)^−s(α/δ)^(k/2)a_γ(Nn₂δ/α)e(n₂β/α), C=[[α,β],[0,δ]], T=(U₀(−D)+N²μμᵀ)/(4m), and omit a term when T is not half integral. The a_γ are the Fourier coefficients of the actual transformed elliptic seed at the indicated cusp; w=[[0,−1],[1,0]]. Put P(s,D,r)=P(s,D,N⁻¹,r). Extend P by zero outside its allowed condition 4m|D; this convention makes the non-integral-index tests unambiguous.

H4, H5.

API: P is linear in all the transformed cusp coefficient sequences; P is periodic in r modulo 2m/N; Non-half-integral T contributes zero

BFH90, §6, pp.585–586, definition of P · needs 8.61, 8.66, `TC56`.

Tests: (1) Zero coefficients at every cusp give P=0; (2) Replacing r by r+2m/N leaves P unchanged; (3) N=8,m=16,D=0,μ=(1,0) gives T=diag(1,0), hence is admitted; μ=(1,1) gives off-diagonal 1, also admitted. At D=1,μ=0 the index is not half integral and is omitted.

#### MP.8.68: First-cusp Whittaker expansion

In the common initial convergence chamber, for D≠0 the extracted coefficient is (n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s). For D=0 it is n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s). These are vector identities, and applying T preserves them under convergence.

H4, H5.

BFH90, §6, pp.584–585, Proposition 6.1 · needs 8.63, 8.66, 8.32.

#### MP.8.69: Opposite-cusp Whittaker rank expansion

For D≠0, C₀=N³(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w). For D=0, C₀=N³n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η). The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.

H4, H5.

BFH90, §6, pp.586–588, Proposition 6.2 · needs 8.64, 8.67, 8.68.

### Local congruence counts and Euler factors

#### MP.8.70: Prime-power congruence counts

For p prime, p∤2mN, put b≥0 and a,d≥0. In cases Σ₁:a≤d,a≤b and Σ₂:a>d,a≤b, N₁₂ is the number of (λ₁ mod p^a,λ₂ mod p^d) satisfying mλ₁²≡0 mod p^a, 2mλ₁λ₂−rλ₁≡0 mod p^min(a,d), mλ₂²−rλ₂+n₁/N≡0 mod p^d. For Σ₃:a>b, N₃ counts (λ₁ mod p^b,λ₂ mod p^(a+d−b)) satisfying mλ₁²+rλ₁+n₁/N≡0 mod p^b, 2mλ₁λ₂+rλ₂−rp^(a−b)λ₁−2p^(a−b)n₁/N≡0 mod p^b, mλ₂²−rp^(a−b)λ₂+p^(2(a−b))n₁/N≡0 mod p^(a+d−b). Interpret N⁻¹ in these finite rings, since p∤N.

API: N₁₂(p,0,b,0)=1; The counts are cardinalities of finite congruence solution sets; At a=0, N₁₂ counts the quadratic roots mλ₂²−rλ₂+n₁/N modulo p^d

BFH90, §7, pp.592–593, (7.10)–(7.11) · needs 8.61.

Tests: (1) N₁₂(3,0,0,0;1,1,0,0)=1; (2) For p=3,m=N=1,r=0,n₁=−1,a=0,d=1 there are two roots λ₂=±1, so the count is 2; (3) For p=3,m=N=1,r=0,n₁=1,a=0,d=1 the count is 0; (4) For p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions: λ₁∈{0,3,6},λ₂∈{0,1}. The printed min(a,b) modulus leaves only two.

#### MP.8.71: Prime-power root-count evaluation

Write D=D'p^(2h), p²∤D', χ=χ_{D'}(p), ε(t)=t mod2, p∤2mN. For i=1,2 and a≤d+1, the count N_i is: p^((a−ε(a)+d−ε(d))/2) if d≤2h; for d≥2h+1 and χ=1, N₁=2p^(h+min((a−ε(a))/2,h)), N₂=2p^(2h+1); for d=2h+1 and χ=0, N₁=p^(h+(a−ε(a))/2), N₂=p^(2h+1); otherwise 0. Here i=1 uses a≤d and i=2 uses a>d, so the two identical defining congruence systems have different permitted a,d ranges. For N₃ at a=b+1,b≤d−1,d≥1: p^((d+ε(d)+b−ε(b))/2) if d≤2h+1,b≤2h; 2p^(h+1+(b−ε(b))/2) if χ=1,d≥2h+2,b≤2h; p^(h+1+(b−ε(b))/2) if χ=0,d=2h+2,b≤2h; 4p^(2h+1) if χ=1,d≥2h+2,b=2h+1; 2p^(2h+1) if χ=1,d≥2h+2,b≥2h+2; p^(2h+1) if χ=0,d=2h+2,b=2h+1; otherwise 0.

BFH90, §7, pp.595–597, Lemma 7.3 · needs 8.70.

#### MP.8.72: Local primitive exponential factors

For upper triangular C=[[p^a,p^b],[0,p^d]], d≥1, define S_p by μ₂-inversion of the unrestricted local S. If a=0 or b=0, S_p=S(a,b,d)−pS(a,b,d−1). If a,b≥1, S_p=S(a,b,d)−p²S(a−1,b−1,d)−pS(a,b,d−1)+p³S(a−1,b−1,d−1). The S terms are p^(2a+d)N₁, p^(a+2d)N₂ or p^(a+b+d)N₃ according to Σ₁,Σ₂,Σ₃; absent divisors contribute zero. For coprime determinant factors S is multiplicative, and S₁(C)=∏_{p|δ}S_p(C_p) in the α|δ series.

BFH90, §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16) · needs 8.60, 8.71, 8.66.

#### MP.8.73: Unramified genus-two Euler factors

For n₂=N⁻¹ and p∤N, the factor is L_p(s,D)=1+Σ_{d≥1,0≤a≤d}p^(d−a)[S_p([[p^a,p^a],[0,p^d]],D)−S_p([[p^a,p^(a−1)],[0,p^d]],D)]p^(−(a+d)s−(d−a)k/2)a(p^(d−a)), with the second S_p term absent when a=0. At fundamental D₀, let a(p)=σ_p+σ_p' and σ_pσ_p'=p^(k−1). Then L_p=(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))/[(1−χ_{D₀}(p)σ_pp^(2−k/2−s))(1−χ_{D₀}(p)σ_p'p^(2−k/2−s))]. At D=0 it is [(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))]/[(1−σ_p²p^(5−k−2s))(1−σ_p'²p^(5−k−2s))(1−p^(4−2s))]. These are meromorphic identities, first proved in absolute convergence.

H4, H5.

BFH90, §7, pp.594–599, (7.20),(7.33)–(7.34), and the unnumbered D=0 formulas on p.599 · needs 8.72, `AL.3`, `TC54`, `TC57`.

#### MP.8.74: Square-discriminant local polynomial and growth

For D=D₀D₁², D₀ fundamental, L(s,D)=L(s,D₀)b(s,D₁), with b a finite Dirichlet polynomial supported on p|D₁, obtained by summing the same explicit (7.20) local counts. Equivalently factor out the unramified L_p for p∤ND₁, leaving the polynomial d(s,D₁) of (7.35). For real s≥2 its coefficients have |b(s,D₁)|≪_{f,N,ε}D₁^(1/2+ε), using the weak normalized bound p^(−j(k−1)/2)|a(p^j)|≤p^(j/4+ε). Thus Σ_{D₁≥1}L(s,D₀D₁²)D₁^−2u converges for Re u>3/4; if L(2,D₀)=0 the analogous series of s-derivatives at 2 has the same convergence.

H4, H5.

BFH90, §7, pp.588–589, Proposition 7.1; pp.599–600, (7.35) · needs 8.73, `TC54`, `TC57`.

### Genuine continuation and quadratic-twist exports

#### MP.8.75: Genus-two theta normal convergence

For a>0, on every compact subset of H₂×C² the θ_{a,ν} series and all coordinate derivatives converge absolutely and uniformly. Hence θ is jointly holomorphic and termwise differentiation, residue-class regrouping and compact-torus integration are valid. The bound uses the least eigenvalue of Im Z uniformly bounded below and bounded Im W.

BFH90, §2, pp.551–553, definition of θ and Proposition 2.1 · needs 8.18, 8.10, `MP.2`.

#### MP.8.76: Genuine normalized induced-section comparison

Lift the actual theta-component vector by ℰ_j(g,h)=h(iI₂)E_j(g), making the central sign genuine. On the positive Siegel Levi the root magnitude |detQ|⁻¹/² changes the I_s exponent to s−1/2; dividing by δ_P¹/²=|detQ|³/² gives normalized parameter ν=s−2. Prove an equivariant identification with Ind_{P̃}^{G̃}(π̃_f⊗|det|^(s−2)), where π̃_f is π_f twisted by the Weil determinant phase, retaining finite vectors and Haar measures.

H4, H5.

BFH90, §1, p.549, I_s; §2, pp.553–554; §8, pp.601–602 · needs 8.31, 8.23, 8.13, 8.53, `AS.1`, `TC55`, `TC56`, `R16.2`.

#### MP.8.77: Genuine Eisenstein initial convergence and growth

For the specified BFH K-type, newform, finite vector and cover measures, prove E_s and its theta-component sums converge absolutely and locally uniformly with all required derivatives for Re s>S₀, for some real S₀. Compare their absolute-value and Sobolev bounds with AS.1 Siegel-section estimates at ν=s−2 after Gaussian λ summation. The finite-cover identification must establish this comparison.

H4, H5.

BFH90, §1, p.549, definition of E_s; §5, p.580, Proposition 5.1 · needs 8.76, 8.75, `AS.1`.

#### MP.8.78: Genuine Siegel intertwining operators

Define the raw Siegel intertwiner M(w,s)F(g)=∫_{N_w(A)}F(w⁻¹ng)dn in its convergence chamber, with fixed Weyl lift and self-dual root measures. It maps to Ind(π̃_f∨⊗|det|^(2−s)), hence BFH parameter 4−s. Continue between these genuine smooth spaces and compute all scalar normalizers and ramified pole divisors. Keep M in the constant term and unnormalized Eisenstein equation; replacing it by R=c(s)⁻¹M also requires renormalizing the Eisenstein family.

H4, H5.

API: M is G̃-equivariant between the stated induced spaces; In the convergence chamber M is exactly the root-group integral with the chosen Weyl lift; For R=c(s)⁻¹M with the specified scalar factors and contragredient identification, R(w,4−s)R(w,s)=id meromorphically away from operator poles. This API is for R; M remains the raw integral operator in the standard constant term and Weyl equation

BFH90, §8, pp.601–602, continuation and constant-term discussion · needs 8.76, 8.77, `AS.2`.

Tests: (1) Zero section maps to zero; (2) The output remains genuine under the cover kernel; (3) The parameter map 4−s is an involution and fixes s=2.

#### MP.8.79: Genuine Eisenstein constant-term formula

Along the Siegel unipotent radical, the genuine Eisenstein constant term is the identity section plus M(w,s) applied to the inducing section, initially in the common convergence chamber and then meromorphically. The intermediate rank-one Bruhat contribution vanishes by elliptic cuspidality. The theta/Fourier specialization recovers exactly the three boundary contributions L(s,0)M, P(s,0,r)M̃ and τ in Proposition 8.1, with their specified N and y₂ factors.

H4, H5.

BFH90, §8, pp.601–602; pp.611–614, (8.10)–(8.16) · needs 8.78, 8.64, 8.69.

#### MP.8.80: Genuine Eisenstein continuation and Weyl equation

Prove meromorphic continuation of the genuine BFH family and E(s,F)=E(4−s,M(w,s)F), with the raw intertwiner and contragredient cusp identification. Poles come from the proved genuine constant terms. Near s=2, regularity is equivalent to regularity of those coefficients; intertwiner residues give genuine automorphic residues. Supply the cover-specific AS.2 adaptation and the original Fricke conductor M.

H4, H5.

BFH90, §8, pp.601–602, continuation and pole discussion; §1, pp.550–551, newform L-functions · needs 8.79, `AS.2`, `AL.3`, 8.81.

#### MP.8.81: Opposite-cusp zero coefficient regularity

For the fixed BFH arithmetic data and r, prove P(s,0,r) holomorphic near s=2 and polynomial D-growth of P(s,D,r), uniformly on compact pole-free parameter sets. Compute ramified cusp factors as L(s,0) times rational functions of p^−s, p|N, with denominators nonzero at 2. Obtain growth from the actual cover-compatible Whittaker estimates. Establish this arithmetic result independently of Eisenstein continuation.

H4, H5.

BFH90, §7, p.589, Remark following Proposition 7.1 · needs 8.67, 8.60, `AL.3`, `AS.1`.

#### MP.8.82: Fourier and residue interchange for genuine families

For the continued genuine family with locally finite pole divisor, clear a local holomorphic denominator. Prove locally uniform holomorphy of compact-torus Fourier integrals, the finite theta transform and the absolutely convergent nonzero-discriminant Whittaker/Mellin tails. These operations then commute with s-residues and derivatives. Infinite theta or D sums require their Gaussian/rapid-decay bounds; this gives no joint Fubini theorem for the expanded Novodvorsky kernel.

H6.

BFH90, §8, pp.601–614, proof of Proposition 8.1 · needs 8.80, 8.75, 8.39, 8.45, 8.81.

#### MP.8.83: BFH two-variable twist series

Define Z^±(u,s;r)=Σ_{D∈Z,±D>0,D≡r² mod 4m/N} L(s,D)|D|^(s−u−5/2), initially for Re u sufficiently large and Re s in the L-series convergence chamber. The integer modulus 4m/N uses N|m and 4m|N². The coefficient L includes the actual first-cusp exponential sums and the original normalized newform f, not an arbitrary list of central L-values.

API: Scaling the elliptic seed scales both Z series; Only D≡r² modulo 4m/N occurs; The plus and minus supports are disjoint and exclude D=0

BFH90, §8, p.601, definition before Proposition 8.1 · needs 8.66, 8.74.

Tests: (1) The zero coefficient family gives Z⁺=Z⁻=0; (2) N=8,m=16,r=1 permits D≡1 mod8; D=1 and −7 occur in opposite signs; (3) For that datum D=0,2,−1 are all excluded.

#### MP.8.84: BFH two-variable polar combination

Put A=(4m)^(−s+u+5/2)N^(−s+4+k/2)[Z⁺ TF⁺(u,s;N⁻¹y₂)+Z⁻ TF⁻(u,s;N⁻¹y₂)]. It continues meromorphically to Re s>3/2, Re u>0 and Re u>Re s−5/2. Near (u,s)=(1/2,2), A minus the following sum is jointly holomorphic: −N^(−s+4+k/2)L(s,0)TM(s,N⁻¹y₂)/(u−s+5/2) + N^(7−s−k/2)P(s,0,r)y₂^(2s−5)TM̃(s,N⁻¹y₂)/(u+s−5/2) + N^−s y₂^(3−s+k/2)Tτ(s,N⁻¹y₂)/(u−s+3/2). Every term uses the continued scalar transforms and fixed BFH test vector. This is joint holomorphy in two complex variables, not a collection of separate one-variable statements.

H4, H5, H6.

BFH90, §8, pp.601–614, Proposition 8.1 · needs 8.83, 8.68, 8.69, 8.47, 8.46, 8.82, 8.81, 8.41, 8.45.

#### MP.8.85: Genus-two coefficient and local-test export

Export the first-cusp coefficients, unramified factor ratio, squarefactor bound, joint polar continuation, valid residue/derivative interchanges and three finite K-type existence tests. AL.3 identifies L(s,D₀)=L_N(s+k/2−2,f⊗χ_{D₀})/L_N(2s+k−4,Sym²f) for fundamental D₀ and L(s,0)=L_N(2s+k−5,Sym²f)/L_N(2s+k−4,Sym²f). At m=N rad(N),r=1 these supply RankZeroOneBSD:BSD.2. That roadmap owns twist residues, positivity, noncancellation, simultaneous local conditions and infinitude.

H4, H5.

BFH90, §7, pp.588–589, Proposition 7.1; §9, pp.614–617 · needs 8.73, 8.74, 8.84, 8.48, 8.49, 8.50, `AL.3`.


## References

Page numbers refer to the linked version. “PDF” denotes a physical page and “printed” denotes the number on the page. In the BFH scan, the first physical page is a cover sheet; the printed article begins at page 543.

**Kudla96.** Stephen S. Kudla, [Notes on the local theta correspondence](https://www.math.toronto.edu/skudla/castle.pdf). Unpublished author notes; introduction dated July 6, 1996; 110-page author copy.

**Weil64.** André Weil, [Sur certains groupes d’opérateurs unitaires](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf). Acta Mathematica 111 (1964), 143–211; published scan, DOI 10.1007/BF02391012.

**Garrett20.** Paul Garrett, [Stone–von Neumann theorem](https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf). Author notes dated23March2020;5pages.

**GQT.** Wee Teck Gan, Yannan Qiu and Shuichiro Takeda, [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3). arXiv:1207.4709v3,21January2014.

**GanTakeda16.** Wee Teck Gan and Shuichiro Takeda, [A proof of the Howe duality conjecture](https://arxiv.org/pdf/1407.1995v4). arXiv:1407.1995v4,15June2015;21-page PDF.

**GanIchino16.** Wee Teck Gan and Atsushi Ichino, [The Gross–Prasad conjecture and local theta correspondence](https://arxiv.org/pdf/1409.6824v2). arXiv:1409.6824v2,17July2015;62-page PDF.

**SunZhu15.** Binyong Sun and Chen-Bo Zhu, [Conservation relations for local theta correspondence](https://arxiv.org/pdf/1204.2969v3). arXiv:1204.2969v3,2June2014;50-page PDF.

**DIT11.** W. Duke, Ö. Imamoḡlu and Á. Tóth, [Cycle integrals of the j-function and mock modular forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf). Annals of Mathematics173(2011),947–981;published35-page PDF.

**Biro00.** András Biró, [Cycle integrals of Maass forms of weight0 and Fourier coefficients of Maass forms of weight1/2](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf). Acta Arithmetica94(2000),103–152;50-page published scan.

**BFH90.** Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf). Inventiones mathematicae102(1990),543–618;77-page published scan.

**AGHMP18.** Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Annals of Mathematics 187 (2018), no. 2, 391–531.

**CT20.** Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/pdf/1907.08783v1). arXiv:1907.08783v1.

**DL24.** Daniel Disegni and Yifeng Liu, [A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3). arXiv:2204.09239v3.

**DIT16.** W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Annals of Mathematics 184 (2016), 949–990.

**GI18.** Wee Teck Gan and Atsushi Ichino, [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). arXiv:1705.10106v3.

**GS23a.** Wee Teck Gan and Gordan Savin, [Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1). arXiv:2102.00372v1.

**GS23b.** Wee Teck Gan and Gordan Savin, [The Local Langlands Conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf). Forum of Mathematics, Pi 11 (2023), e28, 1–42.

**GZ86.** Benedict H. Gross, Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Inventiones mathematicae 84 (1986), no. 2, 225–320.

**IP23.** Atsushi Ichino and Kartik Prasanna, [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2). arXiv:1806.10563v2.

**Laf18.** Vincent Lafforgue, [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10). arXiv:1209.5352v10.

**LL21.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Annals of Mathematics (2) 194 (2021), no. 3, 817–901.

**LL22.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II](https://arxiv.org/pdf/2101.09485v2). arXiv:2101.09485v2.

**LZ22.** Chao Li and Wei Zhang, [Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/pdf/1908.01701v3). arXiv:1908.01701v3.

**YZ18.** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics187(2018),533–638; erratum198(2023),867–878.

**Z21.** Wei Zhang, [Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf). Annals of Mathematics 193 (2021), no. 3, 863–978.

**YZZ11.** Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail). Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book.

**Duke88.** William Duke, [Hyperbolic distribution problems and half-integral weight Maass forms](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf). Inventiones Mathematicae 92 (1988), 73–90; public scan on the author’s UCLA page.
