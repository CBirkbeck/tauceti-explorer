# The orbit method in quantitative form

This roadmap builds a reusable microlocal calculus on unitary representations of Lie groups. Its symbols live on the imaginary dual of the Lie algebra; its operators act on representation Sobolev scales. The calculus compares normalized traces with coadjoint-orbit integrals and compares restriction characters with integrals over stable Hamiltonian fibres. Positive inverse branching tests and equivariant limit states then give a smoothly weighted period asymptotic on compact arithmetic quotients.

The endpoint is the analytic weighted period formula of Nelson–Venkatesh, Theorem 30.1. The refined central L-value average of their Theorem 31.11 has its own owner. General Lie theory, Harish–Chandra classification, general operator ideals, GGP multiplicity and period factorization, automorphic spectral decomposition, and Ratner measure classification retain their existing owners. Only their specified refinements and the proof-specific bridges below are targets here.

The mathematical specification is this document. The [packet](../packets/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.json) records the same target graph, sources, API and tests. The [suggested Lean file](../suggested/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.lean) gives compact forms for the interfaces already expressible on the pinned carriers. Its small models do not replace the representation-theoretic targets.

## Conventions and scope

Write \(\mathfrak g^\wedge=\operatorname{Hom}_{\mathbb R}(\mathfrak g,i\mathbb R)\), and identify an imaginary linear functional with its additive unitary character. The basic calculus uses a finite-dimensional **unimodular** real Lie group and a strongly continuous unitary Hilbert representation. No irreducibility is needed until orbital traces and infinitesimal characters. A real reductive group here is the full group of real points of a connected reductive algebraic group, with its real Lie topology; it need not be topologically connected. A complex algebraic group is regarded as a real Lie group. Nonarchimedean fields have characteristic zero.

Fix a basis of \(\mathfrak g\), Euclidean norms, compatible Haar measures and an exponential chart once for each group. Constants can depend on these fixed data. The norm used for the exact identity \(\operatorname{Op}(1+|\xi|^2)=\Delta\) is the dual norm of the basis defining \(\Delta\); other Euclidean norms give equivalent estimates, not that exact identity. A parameter \(h\) lies in an arbitrary subset of \((0,1]\) accumulating at zero. Families of symbols, representations and operators need no measurability or continuity in \(h\). A uniform assertion means that each requested output seminorm is bounded by a fixed finite list of input seminorms with a constant independent of \(h\) and the representations. An \(h\)-uniformly continuous family satisfies that same bound uniformly in \(h\), using the indicated domain and codomain seminorms. Polynomial losses arise when comparing these seminorms with unscaled ones, as in Lemma 5.3; they are not part of the definition of uniform continuity. Every negligible remainder has every prescribed power of \(h\) in every stated smoothing seminorm.

Use \(\langle\xi\rangle=(1+|\xi|^2)^{1/2}\). Symbol orders are real, operator Sobolev shifts are integral, and all statements involving a finite negative order specify a sufficiently large integral order. The notation \(d\) always means **half the maximal real coadjoint-orbit dimension** for the group in question. It retains that value if a limiting regular multiorbit is empty. In the product-group reduction its value is \(d_M=\dim S\).

The forward transform is

\[
 \widehat f(\xi)=\int_{\mathfrak g}f(x)e^{\xi(x)}\,dx,
 \qquad a^\vee(x)=\int_{\mathfrak g^\wedge}a(\xi)e^{-\xi(x)}\,d\xi.
\]

The two measures are Fourier dual. Under \(\xi(x)=2\pi i\langle\eta,x\rangle\), this forward transform is Mathlib's inverse transform. At the real algebraic measure interface each coordinate contributes Lebesgue measure divided by \(\sqrt{2\pi}\), the self-dual normalization for \(e^{ix}\). Algebraic symplectic volume is \(\sigma^d/d!\); its real measure is \(\sigma^d/(d!(2\pi)^d)\). These are separate stages of the same normalization.

Choose a real even cutoff \(0\leq\chi\leq1\), equal to one near zero and supported inside the exponential chart. If \(dg(\exp x)=j(x)dx\), require \(j(0)=1\). The group test function corresponding to the Lie-algebra density \(\chi a^\vee\) divides by \(j\). Adjoint formulas use conjugation of the symbol and exact covariance transports the cutoff. Formal BCH multiplication is associative; a repeatedly truncated finite-cutoff multiplication need not be.

For a GGP pair, fix a nondegenerate quadratic or Hermitian space \(V=V_H\oplus ke\) (with the quadratic etale coefficient algebra in the unitary case), a nondegenerate distinguished line, the connected isometry groups \(H\subset G\), and the standard representations. After splitting the coefficient algebra, \(V^+\) denotes one standard summand in the unitary case and \(V\) in the orthogonal case. The multiset \(\operatorname{ev}(x)\) is the root multiset of the characteristic polynomial on \(V^+\), with exactly one forced zero removed in odd orthogonal dimension. Even orthogonal quotient data also includes the Pfaffian with square equal to the determinant. The supplied invariant pairing transports these conventions between Lie algebras and their duals.

The relative-character inner products are linear in the first variable. On a rank-one operator \(v_1\otimes\overline{v_2}\), use the product \(\langle\Pi(s)v_1,v_2\rangle\langle u,\sigma(s)u\rangle\); the second factor is conjugated relative to the first. Compact-group probability Haar gives atomic Plancherel mass \(\dim\sigma\) and relative trace \((\dim\sigma)^{-1}\) times the isotypic trace.

## Existing inputs and ownership

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each declaration below was checked in its source with its hypotheses; the declaration index supplies names, not mathematical coverage.

- [mathlib:SchwartzMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean): Existing smooth normed-valued functions with every polynomially weighted iterated Fréchet derivative bounded; only the new symbol order and family refinements are planned.
- [mathlib:SchwartzMap.fourierTransformCLM](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean): Continuous linear Schwartz Fourier transform on a finite-dimensional real inner-product space; the module also proves the inverse Fourier pairing. Its negative 2 pi sign is explicitly transported.
- [mathlib:UniversalEnvelopingAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/UniversalEnveloping.lean): Universal enveloping algebra over a commutative ring with its Lie map and universal lifting equivalence; PBW and Harish-Chandra are supplied separately.
- [mathlib:RealRMK.integral_rieszMeasure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean): For a real positive linear functional on compactly supported continuous maps of a locally compact Hausdorff Borel space, integration against its Riesz measure recovers the functional.
- [tauceti:CliffordAlgebra.spinorNorm](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean): Spinor-norm homomorphism on SO of a nondegenerate finite-dimensional quadratic form over a field with 2 invertible.
- [tauceti:CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean): The Spin image is exactly the kernel of the SO spinor norm under those same field and nondegeneracy hypotheses.
- [mathlib:MeasureTheory.norm_integral_le_integral_norm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean): Norm bound for the Bochner integral, used for the concrete weak-quantization prototype.

The [OperatorTheory/OperatorIdeals roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/OperatorTheory/OperatorIdeals) owns Hilbert–Schmidt energy, basis independence, nuclear norm and general Schatten carriers. QO.3 defines only the refinement by all representation Lie commutators. `AutomorphicSpectralTheory:AS.0/trace-class` supplies its stated trace, cyclicity and functional contracts. It does not license a second generic Schatten construction.

The [OrthogonalSpinGroups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/OrthogonalSpinGroups), Layers 1E, 2F–2H and 3, owns the Spin kernel, real and Qp local-image tables, and localization. Import those targets. For definite real SO the spinor image is trivial; for indefinite real SO it is all real square classes. For a binary anisotropic Qp-space it is a quadratic norm subgroup; for dimension at least three over Qp it is all square classes. The extension to arbitrary completions of a number field and the rational global-image equality are explicit supplier refinements in G19. The abstract Spin-kernel theorem alone proves neither assertion.

The current [LieGroups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/RepresentationTheory/LieGroups) owns exponential, adjoint, BCH, real-form and KAK data. Its current BCH implementation is existing work. [LieHighestWeight Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ) owns the concrete PBW theorem; BCH does not supply it. `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character` supplies the reductive Harish–Chandra map; `LieHighestWeightPartII:N0/jacobson-morozov` supplies algebraically closed adapted triples. Their quantitative real-form consequences requested here do not redefine either construction.

The following distinction matters at every import: an exact external node is used for the statement it actually has; a supplier stage is accompanied by a precise contract; a missing or narrower supplier is recorded as a named obligation. In particular, `GanGrossPrasadConjecturesForClassicalGroups` and `AutomorphicSpectralTheoryPartIISchwartzMultipliers` have no defined stages supplying the required contracts. G8 and G6 record those needs without inventing stage identifiers. The GLn-only concrete centre nodes in the current smooth-representation packet cannot supply the general classical-group centre required here.

## Construction order

Stage and target names below abbreviate the common roadmap prefix `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:`. Each layer lists all targets, including supporting definitions and key theorems. Targets within a layer are ordered by dependencies rather than by their order in the paper.

| Layer | Mathematical output | Targets | Planets |
| --- | --- | ---: | ---: |
| [QO.0](#qo-0) | Quantization and uniform Sobolev scales | 7 | 5 |
| [QO.1](#qo-1) | Uniform symbol and operator calculus | 13 | 5 |
| [QO.2](#qo-2) | Infinitesimal localization | 7 | 4 |
| [QO.3](#qo-3) | Coadjoint measures and trace asymptotics | 10 | 4 |
| [QO.4](#qo-4) | Uniform Plancherel and relative characters | 7 | 5 |
| [QO.5](#qo-5) | Stable Hamiltonian reduction and measures | 10 | 4 |
| [QO.6](#qo-6) | Stable relative trace asymptotics | 4 | 2 |
| [QO.7](#qo-7) | Positive inverse branching | 8 | 6 |
| [QO.8](#qo-8) | Limit states and arithmetic equidistribution | 8 | 6 |
| [QO.9](#qo-9) | Truncated periods and weighted asymptotics | 5 | 4 |

The general calculus is QO.0–QO.1. Localization and trace theory, QO.2–QO.4, connect it to reductive representations. QO.5 supplies the exact stable geometry and measure constants before QO.6 compares relative characters. QO.7 builds positive tests; QO.8 builds and classifies the associated limit states. QO.9 combines these independent inputs. Each stage imports all earlier stages and external contracts it uses through the explicit prerequisite graph; the numbering alone is not a proof dependency.

<a id="qo-0"></a>

## QO.0. Quantization and uniform Sobolev scales

Fix the imaginary dual, dual Haar measures and exponential cutoff. Construct the representation quantization, Nelson Laplacian Sobolev scales, commutator operator classes and uniform symbol families, with explicit seminorm control independent of the representation.

**Inputs.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `AutomorphicFormsOnReductiveGroups:AF.1/g-continuous-norms`.

**Layer acceptance.** A line character must recover the chosen Fourier sign, Delta eigenvalue and rescaling. All Sobolev spaces, family seminorms and adjoints must be coherent before the calculus uses them.

<a id="qo-0-fourier-conventions"></a>

### Imaginary dual and Fourier normalization — QO.0/fourier-conventions

**Definition.** For a finite-dimensional real Lie algebra g, let g^w = Hom_R(g,iR). Set fhat(xi)=integral f(x) exp(xi(x)) dx and a-vee(x)=integral a(xi) exp(-xi(x)) dxi, with Fourier-dual measures. Choose an even real cutoff 0<=chi<=1, equal to one near zero, inside an exponential chart; dg(exp x)=j(x)dx and j(0)=1. Identify xi(x)=2 pi i <eta,x> to compare this forward transform with Mathlib inverse Fourier transform.

**Dependencies.** `mathlib:SchwartzMap`, `mathlib:SchwartzMap.fourierTransformCLM`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§1.14.2–1.14.6, pp. 19–22; §§2.1–2.2, p. 25; §4.1, p. 31.

**API.**

- **imaginaryDualPairing** (data): The evaluation is imaginary-valued and real bilinear.
- **fourierInverse** (equivalence): The two transforms are inverse continuous maps on Schwartz space.
- **fourierMathlib** (compatibility): For xi=2 pi i eta with dual measures, NV forward equals Mathlib inverse Fourier at eta.
- **expDensity** (compatibility): The group function associated to chi a-vee is chi(x)a-vee(x)/j(x) in exponential coordinates.

**Unit tests.**

- **lineCharacter** (computation): On R, exp(xi(x)) with xi=2 pi i eta is the positive-sign character, not the Mathlib forward negative-sign character.
- **zeroDimension** (degenerate): The zero-dimensional transform is the identity after both singleton measures have mass one.
- **densityCheck** (non-example): On a nonabelian group a nonconstant exponential Jacobian must divide the group test function; omitting it changes the integrated operator.

**Uses.** QO.1 polynomial quantization: Fixes derivative signs and the first BCH coefficient. QO.3 and QO.5: Fixes the 2 pi factors in orbit traces and real disintegration.

**Construction route.**

1. Transport the existing Schwartz Fourier equivalence through the imaginary-dual identification and the chosen dual measures.
2. Normalize the exponential Jacobian at zero; record the exact group-density conversion rather than absorbing it into the symbol.

**Check.** Verify every listed API law and run the discriminating examples below, including: On a nonabelian group a nonconstant exponential Jacobian must divide the group test function; omitting it changes the integrated operator.

<a id="qo-0-nelson-laplacian"></a>

### Nelson Laplacian theorem — QO.0/nelson-laplacian

**Theorem.** For a strongly continuous unitary representation of a finite-dimensional Lie group, Delta=1-sum dPi(X)^2 on smooth vectors is essentially self-adjoint, its closure is >=1, ||Delta^-1||<=1, and the smooth vectors are the intersection of the domains of all positive integral powers of Delta.

**Dependencies.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §3.1, p. 28, citing Nelson–Stinespring and Nelson, Corollary 9.3.

**Proof route.**

1. Use the cited essential self-adjointness theorem for the sum of squares and the smooth-vector domain theorem.
2. The quadratic form is ||v||^2+sum ||dPi(X)v||^2; the spectral lower bound gives the inverse estimate.

**Check.** Check the trivial representation gives Delta=1, then verify the essential-domain assertion before completing any Sobolev scale.

**Named proof obligations.** [G1](#g1).

<a id="qo-0-sobolev-scale"></a>

### Representation Sobolev scale — QO.0/sobolev-scale

**Definition.** For every integer s, Pi^s is the Hilbert completion of Pi-infinity in ||v||_s=||Delta^(s/2)v||. Use the continuous inclusions Pi^t to Pi^s for t>=s, identify the continuous anti-dual of Pi^s with Pi^-s using the original Hilbert pairing, and give Pi-infinity=intersection Pi^s and Pi-minus-infinity=union Pi^s their projective and inductive topologies. A word of length r acts Pi^s to Pi^(s-r) with constants depending on the fixed Lie data, not Pi.

**Dependencies.** [QO.0/nelson-laplacian](#qo-0-nelson-laplacian), `AutomorphicFormsOnReductiveGroups:AF.1/g-continuous-norms`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§3.1–3.2, pp. 28–29; §8.5, pp. 59–61.

**API.**

- **sobolevInclusion** (structure): Inclusions Pi^t to Pi^s compose canonically for t>=s.
- **sobolevDual** (equivalence): The Hilbert pairing identifies Pi^-s with the continuous anti-dual of Pi^s.
- **wordSobolevBound** (compatibility): Each length-r enveloping word has a representation-uniform Pi^s to Pi^(s-r) bound.
- **smoothIntersection** (characterisation): The projective intersection is exactly the original smooth-vector space, with its topology.
- **deltaShift** (equivalence): Delta^r identifies Pi^s with Pi^(s-2r).

**Unit tests.**

- **trivialRepresentation** (computation): For the trivial representation Delta=1 and every Sobolev norm is the Hilbert norm.
- **lineCharacter** (computation): For Pi_t(x)=exp(i t x), Delta acts by 1+t^2, so ||v||_s=(1+t^2)^(s/2)||v||.
- **negativeCompletion** (non-example): In the translation representation on L2(R), Pi^-1 contains distributions not in Pi^1; negative spaces cannot be defined as domains with positive norms.

**Uses.** QO.0 operator order: Supplies all domain and range norms. QO.3 trace bounds: Turns negative-order operators into bounded maps to positive Sobolev spaces.

**Construction route.**

1. Apply spectral calculus to the positive closure of Delta.
2. Compare integral powers with sums of squared word derivatives, using commutator induction and the domain theorem; complete and dualize.

**Check.** Verify every listed API law and run the discriminating examples below, including: In the translation representation on L2(R), Pi^-1 contains distributions not in Pi^1; negative spaces cannot be defined as domains with positive norms.

<a id="qo-0-operator-order"></a>

### Commutator operator classes — QO.0/operator-order

**Definition.** For integral order m, an operator T from Pi-infinity to Pi-minus-infinity lies in Psi^m if every iterated commutator theta_(X1...Xr)(T) extends boundedly Pi^s to Pi^(s-m) for all integers s and words. The topology uses these operator norms. Define Psi-minus-infinity as the intersection over integral m and Psi-infinity as the union. For 0<=delta<1, define family Psi_delta^m by uniform boundedness of h^(delta r) times each such commutator norm, with arbitrary Pi(h); h-infinity Psi-minus-infinity means every power of h in every smoothing seminorm.

**Dependencies.** [QO.0/sobolev-scale](#qo-0-sobolev-scale), `mathlib:UniversalEnvelopingAlgebra`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Definition 3.1 and §3.3, pp. 29–30; Definition 5.2 and Lemma 5.3, pp. 37–39.

**API.**

- **operatorOrderInclusion** (relation): Psi^m is continuously included in Psi^n for m<=n.
- **operatorOrderExt** (extensionality): Agreement on smooth vectors implies agreement of every Sobolev extension.
- **commutatorOrder** (structure): Taking one commutator preserves unscaled order and loses h^-delta for families.
- **uniformSeminormLoss** (compatibility): A fixed continuous unscaled seminorm has at most a fixed polynomial h-loss on a bounded Psi_delta^m family.
- **negligibleDeltaIndependent** (characterisation): h-infinity smoothing is independent of the chosen finite delta.
- **functionalOrderUpgrade** (compatibility): For fixed N>=0, an h-uniformly continuous linear functional on Psi^-N restricts, for some fixed Nprime>=N, to a functional controlled by an h-uniformly continuous seminorm on Psi_delta^-Nprime. Choose Nprime-N at least the maximal commutator length in a finite controlling family; use the extra negative order to absorb commutators.

**Unit tests.**

- **identityOrder** (computation): The identity has order zero and vanishing commutators.
- **translationDerivative** (computation): On translations of R, dPi(X) has order one; its Fourier multiplier is i t.
- **boundedIsNotOrderZero** (non-example): A bounded operator on L2 need not preserve all Sobolev spaces or have bounded commutators, so boundedness alone does not define Psi^0.

**Uses.** QO.1 calculus: Specifies the topology of every operator remainder. QO.2 localization: Makes h-uniform continuity and its finite polynomial loss meaningful.

**Construction route.**

1. Use the compatible Sobolev extensions to define the locally convex spaces and topology.
2. Track the number of commutators in each seminorm to compare uniform families; a continuous seminorm uses finitely many commutator norms and loses only a finite power of h.

**Check.** Verify every listed API law and run the discriminating examples below, including: A bounded operator on L2 need not preserve all Sobolev spaces or have bounded commutators, so boundedness alone does not define Psi^0.

<a id="qo-0-symbol-families"></a>

### Uniform symbol families — QO.0/symbol-families

**Definition.** For real m, S^m consists of complex smooth functions a on g^w with sup_xi <xi>^(-m+|alpha|)|partial^alpha a(xi)| finite for every multi-index. For 0<=delta<1, a family is S_delta^m if the same seminorm multiplied by h^(delta|alpha|) is bounded uniformly on the chosen set of h tending to zero. S-minus-infinity is Schwartz space. Define h^eta S_delta^m by multiplication, not by differentiating h; no measurability of a(h) or Pi(h) is imposed.

**Dependencies.** `mathlib:SchwartzMap`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Definitions 4.1, 4.3 and §§4.3–4.5, pp. 33–35.

**API.**

- **symbolOrderInclusion** (relation): S_delta^m is included in S_epsilon^n if m<=n and delta<=epsilon.
- **symbolDerivative** (structure): A derivative of degree r maps S_delta^m to h^(-delta r) S_delta^(m-r).
- **symbolProduct** (structure): Pointwise product sends orders m,n to m+n with finite seminorm control.
- **symbolSchwartz** (compatibility): The intersection of all unscaled orders is the pinned Schwartz space with the same topology.
- **symbolRescale** (data): a_h(xi)=a(h xi); rescaling is performed before unscaled quantization.

**Unit tests.**

- **constantSymbol** (computation): 1 belongs to S^0 and not S^-1 on a nonzero-dimensional dual.
- **quadraticSymbol** (computation): 1+|xi|^2 belongs to S^2; its first derivative has order one.
- **movingBump** (computation): phi((xi-omega)/h^delta) has derivative losses h^(-delta r), so it generally fails the delta=0 family bounds.
- **zeroAlgebra** (degenerate): For g=0 every symbol is just a scalar and all derivative conditions of positive degree vanish.

**Uses.** QO.1 star expansion: Determines each derivative loss and the delta<1/2 threshold. QO.6 relative expansion: Specifies the finite seminorms controlling stable remainder constants.

**Construction route.**

1. Use weighted derivative seminorms on the existing smooth functions, with finite-dimensional multi-index/Fréchet derivative equivalence.
2. Compare the intersection over orders with the pinned Schwartz seminorms and form the bounded-family space.

**Check.** Verify every listed API law and run the discriminating examples below, including: For g=0 every symbol is just a scalar and all derivative conditions of positive degree vanish.

<a id="qo-0-quantization"></a>

### Representation quantization — QO.0/quantization

**Definition.** For Schwartz a define Op(a,chi)=integral_g chi(x)a-vee(x) Pi(exp x) dx, weakly on the Hilbert representation. Define Op_h(a,chi)=Op(a_h,chi), a_h(xi)=a(h xi), equivalently integral chi(hx)a-vee(x)Pi(exp(hx))dx. Extend distributionally to finite-order symbols on smooth vectors. Its adjoint is Op(conj a,chi); exact conjugation transports both a and chi.

**Dependencies.** [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.0/sobolev-scale](#qo-0-sobolev-scale), [QO.0/symbol-families](#qo-0-symbol-families), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `mathlib:MeasureTheory.norm_integral_le_integral_norm`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§2.2–2.4, pp. 25–27; §5.1, pp. 36–37.

**API.**

- **quantizeLinear** (structure): For fixed cutoff, quantization is complex linear in the symbol.
- **quantizeL1Bound** (characterisation): For Schwartz symbols ||Op(a)||<=||chi a-vee||_1.
- **quantizeAdjoint** (compatibility): Op(a,chi)*=Op(conj a,chi).
- **quantizeRescale** (compatibility): Op_h(a,chi)=Op(a(h dot),chi).
- **quantizeTransport** (functoriality): Pi(g)Op(a,chi)Pi(g)^-1=Op(g.a,g.chi) when transported supports lie in the chart.

**Unit tests.**

- **constantOne** (computation): Distributional quantization of the constant 1 is the identity, since chi(0)=1.
- **lineCharacter** (computation): For Pi_t(x)=exp(i t x), Op_h(a) is the cutoff-smoothed Fourier multiplier at h i t; it is a(h i t) modulo the stated negligible cutoff error for bounded Schwartz families.
- **abelianProduct** (compatibility): For R^n and cutoffs one on the relevant inverse-transform supports, composition equals quantization of the pointwise product.
- **transportCutoff** (non-example): Keeping a fixed cutoff under a large Ad(g) is not the exact covariance identity.

**Uses.** QO.1 calculus: Central operator assignment for composition and order estimates. QO.8 limit states: Products of these operators supply the positive states.

**Construction route.**

1. The Schwartz inverse transform is L1, so the weak integral defines a bounded operator with norm <=||chi a-vee||_1.
2. Use exponential inversion and even real chi for the adjoint; change variables under Ad(g), transforming the dual measure and cutoff together.
3. Extend compactly supported distributions against smooth matrix coefficients; compatibility on Schwartz symbols follows by density.

**Check.** Verify every listed API law and run the discriminating examples below, including: Keeping a fixed cutoff under a large Ad(g) is not the exact covariance identity.

<a id="qo-0-operator-algebra"></a>

### Sobolev operator algebra — QO.0/operator-algebra

**Theorem.** Composition continuously sends Psi^m times Psi^n to Psi^(m+n). Enveloping words of degree r have order r, Delta^r has order 2r for integral r, and T is smoothing iff Delta^N T Delta^N is bounded for every N>=0. Integrated compactly supported smooth group functions act continuously as smoothing operators.

**Dependencies.** [QO.0/operator-order](#qo-0-operator-order), [QO.0/sobolev-scale](#qo-0-sobolev-scale).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemmas 3.3–3.6, pp. 30–31; Proposition 8.6, pp. 60–61.

**Proof route.**

1. Use the commutator Leibniz formula with the Sobolev word estimates.
2. Move powers of Delta across T and use the order criterion; conversely reconstruct all Sobolev and commutator bounds from the bounded conjugates.
3. Differentiate the integrated group function on the left and right and bound every resulting compactly supported integral.

**Check.** Check orders add under composition and that smooth compact group functions satisfy all two-sided Delta bounds, uniformly in Pi.

**Atlas planets.** Imaginary dual and Fourier normalization, Nelson Laplacian theorem, Commutator operator classes, Uniform symbol families, Representation quantization.

<a id="qo-1"></a>

## QO.1. Uniform symbol and operator calculus

Prove the BCH symbol expansion, including mixed subalgebras, localized remainder estimates, order-zero bounds, polynomial quantization, cutoff independence and the rescaled calculus. Control both the symbol order and every prescribed power of the semiclassical parameter.

**Inputs.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.0`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-3-the-lie-functor-and-baker-campbell-hausdorff`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`.

**Layer acceptance.** Every requested pair of remainder parameters M,N must be controlled by a finite expansion length. Test the abelian and proper-subalgebra cases, and preserve the strong Cotlar convergence mode.

<a id="qo-1-cutoff-star"></a>

### Cutoff star product — QO.1/cutoff-star

**Construction.** Pull group convolution of the densities chi a-vee and chi b-vee back along BCH and Fourier transform it to define a star b. If chi-prime=1 on the BCH product of their supports, Op(a,chi)Op(b,chi)=Op(a star b,chi-prime). Define star_h by (a star_h b)_h=a_h star b_h; both operators on the rescaled composition identity are Op_h. A fixed finite-cutoff product is not asserted associative.

**Dependencies.** [QO.0/quantization](#qo-0-quantization), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-3-the-lie-functor-and-baker-campbell-hausdorff`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 2.1 and §2.5, pp. 26–28; §4.2, p. 32.

**API.**

- **starRescale** (compatibility): (a star_h b)_h=a_h star b_h.
- **starComposition** (compatibility): With the output cutoff one on the product support, the exact integrated-operator composition identity holds.
- **starBilinear** (structure): The cutoff product is separately and jointly continuous on Schwartz symbols.
- **starAbelian** (compatibility): When BCH is addition and input inverse transforms lie where chi=1, star is pointwise product.

**Unit tests.**

- **zeroSymbol** (degenerate): Either zero input gives zero product.
- **abelianInterior** (computation): On an abelian algebra with cutoff-inactive inputs the product is ab.
- **rescalingBothSides** (non-example): Replacing either rescaled Op_h on the composition identity by unscaled Op fails already for nonconstant line multipliers.
- **cutoffAssociativity** (non-example): Repeated fixed cutoffs can truncate intermediate convolution supports; formal associativity is distinct from finite-cutoff associativity.

**Uses.** QO.1 full calculus: Gives an exact convolution model for the asymptotic expansion. QO.6 product relative traces: Converts operator products to symbol products with controlled errors.

**Construction route.**

1. Push the tensor product of the two Lie-algebra densities through the BCH map, retaining the exponential Jacobian convention.
2. Apply Fubini and the representation multiplication law; rescale both symbols and then undo the scaling.

**Check.** Verify every listed API law and run the discriminating examples below, including: Repeated fixed cutoffs can truncate intermediate convolution supports; formal associativity is distinct from finite-cutoff associativity.

<a id="qo-1-bch-coefficients"></a>

### BCH bidifferential coefficients — QO.1/bch-coefficients

**Construction.** Expand exp((BCH(x,y)-x-y)(zeta)) in its graded Taylor series. Its degree-j coefficient defines C_j(a,b)=sum c_(alpha,beta,gamma) zeta^gamma partial^alpha a partial^beta b with |alpha|+|beta|-|gamma|=j, max(|alpha|,|beta|)<=j and |gamma|<=min(|alpha|,|beta|). C_0=ab; C_1 is one half the Lie-Poisson bracket with the imaginary-dual derivative convention. Formal sum h^j C_j is associative; each C_j has symbol order m+n-j.

**Dependencies.** [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.0/symbol-families](#qo-0-symbol-families), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-3-the-lie-functor-and-baker-campbell-hausdorff`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §4.2, equations (4.2)–(4.6), pp. 32–33; Lemma 7.6, pp. 48–49.

**API.**

- **bchCoefficientZero** (simp): C_0(a,b)=ab.
- **bchCoefficientOrder** (structure): C_j continuously maps S^m times S^n to S^(m+n-j).
- **bchFirstCoefficient** (compatibility): C_1 is the half-bracket in the fixed imaginary coordinates.
- **bchFormalAssociativity** (relation): The coefficient of each power of h in (a star b) star c equals that in a star (b star c).

**Unit tests.**

- **abelianCoefficients** (computation): All C_j for j>0 vanish on an abelian algebra.
- **linearCommutator** (compatibility): For linear symbols the antisymmetric first coefficient reproduces the enveloping commutator under quantization.
- **constantInput** (degenerate): For either constant input, every C_j with j>0 vanishes.

**Uses.** QO.1 symbol expansion: Specifies every expansion coefficient. QO.2 division: The full C_j recursion constructs each correction, including j>=2.

**Construction route.**

1. Use the analytic BCH expansion, not a reimplementation of the Lie functor.
2. Grade monomials by total x,y degree minus zeta degree and use the paired x,y vanishing of the BCH remainder.
3. Recover C_j through Fourier differentiation; formal associativity follows coefficientwise from BCH associativity.

**Check.** Verify every listed API law and run the discriminating examples below, including: For either constant input, every C_j with j>0 vanishes.

<a id="qo-1-oscillatory-estimates"></a>

### Nonstationary phase and BCH Taylor remainder — QO.1/oscillatory-estimates

**Theorem.** For an imaginary smooth phase phi on a fixed open set with |grad phi|>=epsilon>0 and bounded required derivatives near the compact amplitude support, integral f exp(t phi) is O(t^-N sum_(|alpha|<=N)||partial^alpha f||_1), with constants controlled by those bounds. For the BCH phase Omega, all fixed zeta derivatives of Omega-sum_(j<J)Omega_j are O(rho^J), rho=max(|x|,|y|,|x||y||zeta|), on the fixed chart, with the polynomial large-rho bounds used when rho>=1. In the mixed-subalgebra setting g1+g2=g, put B(x,y)=BCH(x,y)-x-y and F(xi,eta,zeta)=integral chi1(x)chi2(y) exp(xi(x)+eta(y)+zeta(B(x,y))) dx dy. Choose the cutoffs sufficiently close to zero and compatible dual norms. For every N>=0 and zeta multi-index gamma, ||(xi,eta)||>=|zeta|/2 implies |partial_zeta^gamma F|<=C_(N,gamma)<(xi,eta)>^-N, uniformly in all three parameters.

**Dependencies.** [QO.1/bch-coefficients](#qo-1-bch-coefficients).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemmas 7.6–7.8, pp. 48–51.

**Proof route.**

1. For small rho use the graded Taylor formula and the paired vanishing of BCH; split large rho before using polynomial estimates.
2. Use the integration-by-parts vector field t^-1 |grad phi|^-2 sum conjugate(partial_j phi) partial_j, which acts on exp(t phi) as identity.
3. Iterate its formal adjoint; bound amplitude derivatives and coefficient derivatives uniformly.
4. For the F estimate normalize by t=||(xi,eta)||. The linear part of the phase has unit gradient; the BCH correction has small derivative when |zeta|<=2t and the chart is small. Apply the nonstationary estimate for t>=1 and the compact-amplitude estimate for t<=1.

**Check.** Check the integration-by-parts operator reproduces the exponential with the chosen imaginary phase; include derivatives of its coefficients and separate rho<1 from rho>=1.

<a id="qo-1-planck-partition"></a>

### Dyadic Planck localization — QO.1/planck-partition

**Construction.** For 0<=delta<1, cover the dual by balls U_omega of radius h^delta <omega>/2, with uniformly bounded overlap, comparable weights on intersections and polynomial counting. A subordinate smooth partition decomposes a in S_delta^m as sum <omega>^m a_omega with uniformly bounded localized S_delta^0 seminorms. For a localized symbol, a_h-vee(x)=<omega>^m exp(-omega(x)/h) A^n phi-vee(Ax), A=h^(delta-1)<omega>, for a uniformly bounded compactly supported smooth phi.

**Dependencies.** [QO.0/symbol-families](#qo-0-symbol-families), [QO.0/fourier-conventions](#qo-0-fourier-conventions).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Definition 7.9 and Lemmas 7.10–7.12, pp. 51–53.

**API.**

- **localizedSupport** (data): Each a_omega is supported in its declared U_omega.
- **localizedFourier** (compatibility): The modulation, A^n Jacobian and A^-r Fourier moments are explicit.
- **planckReconstruction** (structure): The locally finite sum equals a pointwise and in C-infinity on compact sets, with uniform weighted derivative bounds for the sum and its localized pieces. Finite partial sums need not converge in the original S_delta^m topology.
- **planckOverlap** (characterisation): Overlap and weight comparison constants depend only on the fixed dimension and localization choices.

**Unit tests.**

- **deltaZeroRadius** (computation): At delta=0 the ball radius is comparable to <omega>, not h<omega>.
- **originScaling** (computation): For omega=0 the inverse-transform width is h^(1-delta), and its amplitude scales by h^(-n(1-delta)).
- **countingGrowth** (non-example): For delta>0 and nonzero dual dimension, the number of centers needed to cover a fixed compact set with nonempty interior grows polynomially in h^-1; it is not bounded independently of h. At delta=0 no such growth is required.
- **constantTail** (non-example): For a=1 on a nonzero-dimensional dual, any finite sum of the compactly supported partition pieces is zero sufficiently far out. Its S^0 sup-norm distance from 1 is at least one, so convergence in the original symbol topology is false.

**Uses.** QO.1 composition estimates: Reduces global remainder bounds to localized pairs. QO.1 order-zero bound: Supplies the almost-orthogonal family for Cotlar–Stein.

**Construction route.**

1. Choose dyadic shells and separated centers at the local Planck radius; use volume comparison for bounded overlap and counting.
2. Rescale a fixed bump partition and normalize its sum, keeping all derivative bounds.
3. Change variables in Fourier inversion and integrate by parts for weighted Fourier moment estimates.

**Check.** Verify every listed API law and run the discriminating examples below, including: For delta>0 and nonzero dual dimension, the number of centers needed to cover a fixed compact set with nonempty interior grows polynomially in h^-1; it is not bounded independently of h. At delta=0 no such growth is required.

<a id="qo-1-localized-remainders"></a>

### Localized star remainder bounds — QO.1/localized-remainders

**Theorem.** Let g1+g2=g, 0<=delta1,delta2<1 and delta1+delta2<1. Let a in S_delta1^0(g1*) and b in S_delta2^0(g2*) be localized at omega1 and omega2. For each N>=0 and output multi-index gamma, choose J and M sufficiently large in terms of these fixed data. The remainder r=a star_h b-sum_(j<J) h^j C_j(a,b) satisfies |partial^gamma r(zeta)|<=C h^N <zeta>^-N <omega1>^M <omega2>^M. If g1=g replace the second weight by <omega2>^-N; if g2=g replace the first weight by <omega1>^-N; if both equal g both weights are negative powers. Constants use finitely many bounded localized input seminorms and are independent of h, zeta and the centers. General input orders are restored by the partition weights.

**Dependencies.** [QO.1/oscillatory-estimates](#qo-1-oscillatory-estimates), [QO.1/planck-partition](#qo-1-planck-partition).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Proposition 7.13, pp. 53–56, cases (a)–(d); proof of Theorem 7.4, pp. 56–57.

**Proof route.**

1. Insert the localized Fourier formulas and treat the four full-algebra versus proper-subalgebra cases of Proposition 7.13 separately.
2. For comparable centers use the Taylor remainder, spending derivative losses h^-delta1 and h^-delta2.
3. For separated centers use nonstationary phase with the full-algebra hypotheses required for each negative center weight; proper-subalgebra inputs retain the stated polynomial weights.
4. For Theorem 7.4, sum case (d) for two full algebras. In the full/proper cases use the negative order required on the full-algebra input to absorb its remaining polynomial center weight. For two proper algebras both orders are minus-infinity, so choose each order sufficiently negative to sum the two polynomial weights from case (a).

**Check.** Choose J from the desired output derivative and h exponent before estimating input centers; check all four weight regimes and absolute summability of the center sum.

<a id="qo-1-mixed-symbol-calculus"></a>

### Mixed symbol calculus — QO.1/mixed-symbol-calculus

**Theorem.** For Lie subalgebras g1+g2=g from unimodular subgroups, star extends continuously S^m1(g1^w) times S^m2(g2^w) to S^(m1+m2)(g^w), where a proper g1 forces m2=-infinity and a proper g2 forces m1=-infinity. Its leading term is the product of the pullbacks to g^w. For delta1+delta2<1, the remainder after J terms is h^((1-delta1-delta2)J) S_max(delta1,delta2)^(m1+m2-J). In particular the equal-algebra calculus uses delta<1/2.

**Dependencies.** [QO.1/cutoff-star](#qo-1-cutoff-star), [QO.1/bch-coefficients](#qo-1-bch-coefficients), [QO.1/localized-remainders](#qo-1-localized-remainders).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorems 4.5 and 7.4, pp. 35–36, 46–48; Example 7.1 and Lemma 7.3.

**Proof route.**

1. Define mixed convolution via the subalgebra inclusion distributions.
2. Apply the localized remainder theorem and sum the Planck partition in all seminorms.
3. Use the proper-subalgebra order conditions to ensure decay in directions absent from the other factor.

**Check.** For a proper g2 with g1=g, take b=1 on g2*. Its pullback has no decay in the missing directions, demonstrating why a must be Schwartz. Check the mixed derivative-loss exponent 1-delta1-delta2.

<a id="qo-1-fourier-cutoff"></a>

### Fourier cutoff asymptotics — QO.1/fourier-cutoff

**Theorem.** For b_h-vee=psi a_h-vee with psi compactly supported smooth and a in S_delta^m, b=sum_(j<J) h^j sum_(|alpha|=j)(partial^alpha psi(0)/alpha!)partial^alpha a modulo h^((1-delta)J)S_delta^(m-J), in the imaginary-coordinate convention. Off zero, partial^alpha a_h-vee(x) is bounded by C h^(-n-|alpha|)(|x|/h^(1-delta))^-N for every nonnegative integer N with |alpha|+m-N<=-n-1; unscaled inverse transforms are C^k at zero for m<=-n-1-k.

**Dependencies.** [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.0/symbol-families](#qo-0-symbol-families), [QO.1/planck-partition](#qo-1-planck-partition).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 7.14, pp. 56–57; Lemma 8.1, pp. 57–58.

**Proof route.**

1. Taylor-expand psi at zero and apply the fixed Fourier derivative convention, retaining the positive h^j sign.
2. For the remainder use Fourier convolution and weighted symbol seminorms.
3. Integrate by parts away from zero, keeping h^-|alpha| from differentiating the rescaled inverse transform.

**Check.** On a line, differentiate h^-1 a-vee(x/h) once and recover h^-2. A linear Taylor cutoff must give positive h times the fixed imaginary derivative, not negative h.

<a id="qo-1-order-criterion"></a>

### Sobolev order criterion — QO.1/order-criterion

**Theorem.** For integral m>=0, membership in Psi^m is equivalent to ||theta_u(T)v||^2<=C_u <Delta^m v,v> for every enveloping word u. For m<=0 it is equivalent to boundedness of theta_u(T) followed by every word of length -m in the basis and 1. Consequently every localized enveloping element of order <=m in U(g_C)[Delta^-1] acts in Psi^m.

**Dependencies.** [QO.0/operator-algebra](#qo-0-operator-algebra), [QO.0/operator-order](#qo-0-operator-order).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Proposition 8.2, Definition 8.3 and Proposition 8.6, pp. 59–61.

**Proof route.**

1. Commute T past words, comparing even Sobolev powers with sums of squared word norms.
2. Induct on commutator length; use Delta^-1 order -2 to pass between positive and negative orders.
3. Prove the equivalence in both directions before using it for symbolic quantization.

**Check.** Check the m=0 criterion is boundedness of every commutator and the m=-2 test admits Delta^-1. Verify both directions, including all Sobolev indices.

<a id="qo-1-cotlar-stein"></a>

### Cotlar–Stein almost orthogonality — QO.1/cotlar-stein

**Theorem.** For a countable family T_j between Hilbert spaces, assume sup_j sum_k ||T_j* T_k||^(1/2)<=C and sup_j sum_k ||T_j T_k*||^(1/2)<=C. Finite partial sums converge strongly to a bounded operator of norm <=C. Operator-norm convergence is not part of the assertion.

**Dependencies.** Existing Hilbert-space operations; the cited independent analytic theorem is a proof obligation, recorded below.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 8.10, p. 61, citing Hörmander, Lemma 18.6.5.

**Proof route.**

1. Prove the finite-family Cotlar–Stein inequality by iterated products and Cauchy–Schwarz.
2. Apply it to tails on the dense span generated by the ranges and their adjoints; obtain strong convergence from the row-sum hypotheses and uniform boundedness.

**Check.** Use orthogonal rank-one projections on l2: C=1, strong sum identity, and tails of norm one. The proof must establish the finite-family inequality and strong convergence without asserting norm convergence.

**Named proof obligations.** [G2](#g2).

<a id="qo-1-zero-order-bound"></a>

### Uniform order-zero boundedness — QO.1/zero-order-bound

**Theorem.** Op maps S^0 to bounded Hilbert operators with a bound by finitely many symbol seminorms independent of Pi; Op_h maps bounded S_delta^0 families to uniformly bounded operators for delta<1/2. This is stronger than the L1 inverse-transform estimate and is valid without irreducibility.

**Dependencies.** [QO.1/cotlar-stein](#qo-1-cotlar-stein), [QO.1/planck-partition](#qo-1-planck-partition), [QO.1/mixed-symbol-calculus](#qo-1-mixed-symbol-calculus), [QO.0/quantization](#qo-0-quantization).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Proposition 8.7 and Lemmas 8.8–8.10, pp. 61–66.

**Proof route.**

1. Decompose into Planck-localized operators and use the L1 bound for each piece.
2. Estimate cross-products by the localized mixed calculus and off-center oscillation.
3. Sum the square-root interaction bounds and apply strong Cotlar–Stein convergence.

**Check.** Test a=1 and highly spread order-zero symbols whose inverse-Fourier L1 norm alone gives no uniform estimate; the final constant uses finitely many symbol seminorms and is independent of Pi.

<a id="qo-1-polynomial-quantization"></a>

### Polynomial quantization — QO.1/polynomial-quantization

**Theorem.** For polynomial p on the imaginary dual, Op(p,chi)=dPi(sym p), independent of chi. A linear symbol xi(X) quantizes to dPi(X). When |xi| is the dual norm of the basis used in Delta=1-sum_X dPi(X)^2, p=1+|xi|^2 quantizes to Delta. Higher powers p^N do not in general quantize to Delta^N without lower-order noncommutative corrections.

**Dependencies.** [QO.0/quantization](#qo-0-quantization), `mathlib:UniversalEnvelopingAlgebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 5.1, p. 37; proof in §8.1, pp. 56–57.

**Proof route.**

1. The inverse Fourier transform of a polynomial is a derivative of the point mass at zero.
2. Evaluate it on the smooth matrix coefficient and use chi=1 near zero; polarize to obtain symmetrization.

**Check.** On the line xi=i t, quantize xi(X) to i t and 1+|xi|^2 to 1+t^2. For the Heisenberg algebra [X,Y]=Z with orthonormal basis X,Y,Z, verify sym(p^2)=Delta^2-Z^2 in U(g), so equality of the two powers fails when dPi(Z) is nonzero.

<a id="qo-1-cutoff-covariance"></a>

### Cutoff independence and near covariance — QO.1/cutoff-covariance

**Theorem.** For two admissible cutoffs, Op(a,chi1)-Op(a,chi2) is smoothing; for a in S_delta^m, delta<1, the rescaled difference is h-infinity smoothing. If ||Ad(g)||<=C h^(-1+delta+epsilon), epsilon>0, fixed-cutoff Op_h(g.a) equals Pi(g)Op_h(a)Pi(g)^-1 modulo h-infinity smoothing, with controlled constants for the declared symbol seminorms and group bound.

**Dependencies.** [QO.1/fourier-cutoff](#qo-1-fourier-cutoff), [QO.0/quantization](#qo-0-quantization), [QO.0/operator-order](#qo-0-operator-order), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemmas 5.4–5.5, p. 39; proofs in §§8.3–8.4, pp. 57–59.

**Proof route.**

1. Cutoff differences vanish near zero; Fourier decay away from zero gives every smoothing seminorm.
2. For moving g, compare with the exactly transported cutoff and use the lower bound on its inner radius supplied by the Ad(g) bound.
3. Spend epsilon in the Fourier decay estimate to overcome each polynomial Sobolev and group loss.

**Check.** Check exact covariance transports chi as well as a. For the near identity compare the transported inner radius with h^(1-delta), retaining the positive epsilon margin.

<a id="qo-1-operator-calculus"></a>

### Uniform rescaled operator calculus — QO.1/operator-calculus

**Theorem.** For integral m, Op(S^m) is continuously contained in Psi^m. For delta<1/2, Op_h(S_delta^m) is contained in h^min(0,m) Psi_delta^m. Products have the BCH expansion: given M,N, choose J so that Op_h(a)Op_h(b)-sum_(j<J)h^j Op_h(C_j(a,b)) lies in h^N Psi_delta^-M. The unscaled error after J terms has order m+n-J. The same conclusion holds for the admissible mixed-subalgebra orders, and disjoint preimages of input supports give h-infinity smoothing.

**Dependencies.** [QO.1/order-criterion](#qo-1-order-criterion), [QO.1/zero-order-bound](#qo-1-zero-order-bound), [QO.1/polynomial-quantization](#qo-1-polynomial-quantization), [QO.1/cutoff-covariance](#qo-1-cutoff-covariance), [QO.1/mixed-symbol-calculus](#qo-1-mixed-symbol-calculus).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorems 5.6, 5.8 and Corollaries 5.7, 5.9, pp. 40–41; §§8.7–8.10 and Theorem 8.11, Lemma 8.12, pp. 62–72.

**Proof route.**

1. Combine polynomial quantization and the order criterion with the uniform zero-order bound; lower orders by elliptic approximate inversion.
2. Control iterated commutators using symbol derivatives and the h^delta weights.
3. Apply the mixed symbol expansion and cutoff independence, choosing J large enough for both requested h-gain and negative order.
4. For separated support pullbacks all local differential coefficients vanish; the arbitrary-J remainder is negligible.

**Check.** Given separate M and N, exhibit how large J supplies both negative operator order and h gain. Test disjoint symbol supports, the identity symbol, and the Delta quadratic symbol.

**Atlas planets.** Cutoff star product, Dyadic Planck localization, Mixed symbol calculus, Uniform order-zero boundedness, Uniform rescaled operator calculus.

<a id="qo-2"></a>

## QO.2. Infinitesimal localization

Normalize the real invariant quotient and infinitesimal characters. Prove approximate noncommutative division and uniform localization of eigenfunctionals and restriction functionals near the joint central-character locus, with decay in both spectral parameters.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.1`, `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`, `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`, `AutomorphicFormsOnReductiveGroups:AF.1/admissible-gk-module`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.0`.

**Layer acceptance.** Keep invariant quotient real points distinct from the image of the real dual. All central polynomial evaluations, large-parameter weights and support separations must retain their correct group.

<a id="qo-2-real-infinitesimal-quotient"></a>

### Real infinitesimal quotient — QO.2/real-infinitesimal-quotient

**Definition.** Let [g_C*]=Spec Sym(g_C)^G with the Harish-Chandra identification of central characters supplied by AF.1. The imaginary real form [i g*] is the fixed locus lambda=-conj(lambda), with conjugation and sign acting on homogeneous invariant generators. On generators p_j of degree d_j define |[xi]|=max_j |p_j(xi)|^(1/d_j). The quotient map from i g* has Zariski-dense image but need not be onto its real form. For a scalar central action define lambda_Pi via the supplied Harish-Chandra map, with its fixed rho normalization.

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`, `mathlib:UniversalEnvelopingAlgebra`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§9.1–9.5, pp. 72–75; §9.8, pp. 77–78.

**API.**

- **infinitesimalCharacter** (data): The central action is evaluation at lambda_Pi under gamma.
- **imaginaryQuotientInvolution** (characterisation): lambda belongs to the imaginary real form iff lambda=-conj(lambda).
- **quotientHomogeneity** (compatibility): |[t xi]|=|t| |[xi]| for real t.
- **quotientImage** (relation): The real-point image lies in the imaginary real form; surjectivity is a separate condition.
- **centralPolynomialScaling** (compatibility): A homogeneous invariant of degree d evaluates at h lambda as h^d p(lambda).

**Unit tests.**

- **abelianQuotient** (computation): For a one-dimensional abelian algebra, the quotient is the imaginary line and its norm is homogeneous of degree one.
- **compactSO3** (non-example): For so3 the real quotient has points outside the image of the imaginary dual; replacing the quotient by that image loses valid parameters.
- **degreeTwoScaling** (computation): A quadratic Casimir coordinate scales by h^2, not h; its contribution to the weighted norm scales by |h|.

**Uses.** QO.2 spectral localization: Defines the two spectral parameters and their scaled polynomial evaluations. QO.5 stable fibres: Supplies the base coordinates of the joint quotient map.

**Construction route.**

1. Import the complex invariant quotient, reductive Harish-Chandra isomorphism and normalization from AF.1.
2. Transport the real involution through homogeneous generators; distinguish the real locus of the quotient from the image of real points.
3. Use the generator-weighted norm for homogeneous bounds; use ordinary coordinate distance on compact subsets when local metric estimates are needed.

**Check.** Verify every listed API law and run the discriminating examples below, including: A quadratic Casimir coordinate scales by h^2, not h; its contribution to the weighted norm scales by |h|.

<a id="qo-2-dual-characters"></a>

### Dual and conjugate infinitesimal characters — QO.2/dual-characters

**Theorem.** For irreducible admissible representations with scalar central action, lambda_(Pi*)=-lambda_Pi, lambda_(conj Pi)=conj(lambda_Pi), and lambda_(Hermitian dual Pi)=-conj(lambda_Pi). An irreducible unitary representation has lambda_Pi in [i g*].

**Dependencies.** [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient), `AutomorphicFormsOnReductiveGroups:AF.1/admissible-gk-module`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 9.2 and Corollary 9.3, pp. 75–76.

**Proof route.**

1. Compute the enveloping anti-automorphism on linear generators and symmetrized invariant polynomials.
2. Transport it through Harish-Chandra and use the invariant Hermitian pairing for the unitary assertion.

**Check.** For a line character exp(i t x), the dual and conjugate parameters are -i t and the Hermitian-dual parameter is i t. Track rho in the Harish-Chandra normalization.

<a id="qo-2-tempered-criterion"></a>

### Regular spectral temperedness criterion — QO.2/tempered-criterion

**Theorem.** For compact Omega in the regular-semisimple part of [i g*], there is h0>0 such that every irreducible unitary Pi with h lambda_Pi in Omega and 0<h<h0 is tempered. The conclusion is uniform over all such Pi and does not apply to compact sets meeting the discriminant.

**Dependencies.** [QO.2/dual-characters](#qo-2-dual-characters), `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 9.4, pp. 76–77.

**Proof route.**

1. Use Langlands classification to write a nontempered unitary representation with nonzero real induction exponent.
2. Use the uniform bound on real exponents of unitary Langlands data and the Weyl symmetry imposed by a Hermitian structure.
3. If h tends to zero in the fixed regular-semisimple compact set, these bounded real parts force a Weyl stabilizer at the limiting parameter, contradicting regularity.

**Check.** A compact regular-semisimple parameter set must have positive separation from the discriminant. Verify the proof uses bounded real induction exponents uniformly in Pi, and makes no assertion on a compact set meeting the discriminant.

**Named proof obligations.** [G3](#g3).

<a id="qo-2-spectral-laplacian"></a>

### Spectral Laplacian bound and central leading symbol — QO.2/spectral-laplacian

**Theorem.** For every irreducible unitary Pi of a fixed real reductive group, Delta has an eigenvalue <=C(1+|lambda_Pi|^2). For an invariant polynomial p of degree <=r, gamma(sym p)-p has degree <=r-1. These are separate inputs: the first needs uniform minimal K-type bounds; the second is the filtered leading-symbol property of Harish-Chandra.

**Dependencies.** [QO.0/nelson-laplacian](#qo-0-nelson-laplacian), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient), `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemmas 9.5–9.6, pp. 77–78.

**Proof route.**

1. Use a Cartan-compatible basis and Delta=2 Delta_K-1-C, then the Vogan minimal K-type and Blattner estimates to bound a K-type eigenvalue.
2. Use PBW and the rho translation to identify the top homogeneous invariant symbol; their difference has lower degree.

**Check.** For a line character the claimed smallest eigenvalue is exactly 1+t^2. Separate the quantitative minimal-K-type estimate from the filtered Harish-Chandra top-symbol identity.

**Named proof obligations.** [G3](#g3).

<a id="qo-2-approximate-division"></a>

### Approximate noncommutative division — QO.2/approximate-division

**Theorem.** Let 0<=delta1,delta2<1/2, delta=max(delta1,delta2), a in S_delta1^-infinity, and q in S_0^m with |q|>=h^delta2 on supp a, with the declared uniform symbol seminorms. Given M,N there are left and right quotients b,b-prime in h^-delta2 S_delta^-infinity such that Op_h(a)-Op_h(q)Op_h(b) and Op_h(a)-Op_h(b-prime)Op_h(q) lie in h^N Psi_delta^-M. Their supports can stay in a fixed enlargement of supp a on which the lower bound holds.

**Dependencies.** [QO.1/operator-calculus](#qo-1-operator-calculus), [QO.1/bch-coefficients](#qo-1-bch-coefficients).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 10.1 and Remark 10.2, pp. 79–80.

**Proof route.**

1. Start with b0=a/q on the lower-bound region and a support cutoff.
2. Recursively set b_j=-q^-1 sum_(l<j) C_(j-l)(q,b_l); construct the right recursion with the factors reversed.
3. Differentiate inverses using the lower bound, assigning delta2 losses, and truncate at an order large enough for M,N using delta<1/2.
4. The full sum over earlier l is essential; iteration using only C_j(q,b0) fails at second and higher orders.

**Check.** Check b0=a/q, b1=-C1(q,b0)/q, and b2=-(C2(q,b0)+C1(q,b1))/q. Verify support and derivative bounds for both factor orders.

<a id="qo-2-eigenfunctional-localization"></a>

### Eigenfunctional localization — QO.2/eigenfunctional-localization

**Theorem.** For a symbol family p in S_0^m of some fixed finite order m, 0<=delta<1/2, an h-uniformly continuous functional L on Psi^-infinity with L(Op_h(p)T)=lambda L(T), or the analogous right identity, and a in S_delta^-infinity, L(Op_h(a)) has polynomial h-loss and arbitrary polynomial decay in lambda. If |p-lambda|>=h^delta on supp a for some delta<1/2, it is O(h^N <lambda>^-N) for every N, with finitely many declared seminorms controlling each estimate.

**Dependencies.** [QO.2/approximate-division](#qo-2-approximate-division), [QO.0/operator-order](#qo-0-operator-order).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 10.3, pp. 80–81.

**Proof route.**

1. Use high powers of the symbol p-lambda on the separated support and approximate division.
2. Apply the eigenidentity to annihilate the principal terms and spend sufficiently many h-powers to overcome the functional seminorm loss.
3. For large lambda use the same division with its parameter weight to obtain the joint h and lambda decay.

**Check.** State p in a bounded finite-order S_0 family and a in S_delta^-infinity with delta<1/2. Verify the eigenidentity kills the division term and the remainder overcomes the functional's polynomial h loss.

<a id="qo-2-joint-localization"></a>

### Joint infinitesimal-character localization — QO.2/joint-localization

**Theorem.** For H subset G and an h-uniformly continuous functional on Psi^-infinity(Pi) factoring H times H-equivariantly through Psi^-infinity(sigma) and trace, its value on Op_h(a) is O(h^-M <h lambda_Pi>^-N <h lambda_sigma>^-N). If supp a is separated by h^delta, delta<1/2, from the simultaneous loci [xi]=h lambda_Pi and [xi|h]=h lambda_sigma, the bound improves to O(h^N <h lambda_Pi>^-N <h lambda_sigma>^-N) for every N. Each central polynomial uses its own group parameter.

**Dependencies.** [QO.2/eigenfunctional-localization](#qo-2-eigenfunctional-localization), [QO.2/spectral-laplacian](#qo-2-spectral-laplacian), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 10.4 and equations (10.11)–(10.14), pp. 81–82.

**Proof route.**

1. Cover symbol support by finitely many regions where one of the two invariant-coordinate differences is large.
2. Use the central leading-symbol estimate, the G central action and the H-equivariant factorization to obtain the appropriate eigenidentities.
3. Apply eigenfunctional localization and iterate the lower-degree h-errors; the G polynomial evaluates at h lambda_Pi and the H polynomial at h lambda_sigma.

**Check.** For G=H equal to a line, inconsistent G and H character parameters force the functional to vanish. In the general proof every central generator must evaluate at its own group's parameter.

**Atlas planets.** Real infinitesimal quotient, Regular spectral temperedness criterion, Approximate noncommutative division, Joint infinitesimal-character localization.

<a id="qo-3"></a>

## QO.3. Coadjoint measures and trace asymptotics

Construct normalized regular multiorbit measures and their weak topology; plan Rossmann character formulas, orbit limits and uniform orbital decay. Deduce full Schwartz trace expansions and trace-ideal estimates with the correct h and infinitesimal-character weights.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`, `AutomorphicSpectralTheory:AS.0/trace-class`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.0`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.1`.

**Layer acceptance.** Check orbital scaling, empty limits and regular nilpotent orbits. Verify all trace and trace-ideal exponents with a point orbit and with a two-dimensional orbit.

<a id="qo-3-orbital-measure"></a>

### Normalized regular multiorbits — QO.3/orbital-measure

**Definition.** On a coadjoint orbit in i g*, define sigma_xi(ad*X xi,ad*Y xi)=xi([X,Y])/i. For dimension 2d put omega_O=sigma^d/(d!(2 pi)^d), with symplectic orientation. A regular orbit has maximal orbit dimension, even if its parameter is singular. A regular multiorbit is a finite union of regular orbits in one invariant-quotient fibre; the empty union is allowed. The measure is their sum. Under xi to t xi, (m_t)* omega_O=t^-d omega_(tO) for t>0.

**Dependencies.** [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §6.1 and (6.1), pp. 41–42; §11.1, p. 83.

**API.**

- **orbitMeasureScaling** (functoriality): The pushforward under positive scaling is t^-d times the scaled-orbit measure.
- **orbitMeasureInvariant** (structure): The measure is invariant under the coadjoint action.
- **multiorbitSum** (structure): Disjoint multiorbit union gives the sum of orbital measures.
- **regularFibreFinite** (characterisation): There is a group-dependent uniform bound on the number of regular real orbits in one quotient fibre.
- **orbitMeasureRadon** (compatibility): The measure extends to a Radon measure on the full dual by local finiteness.

**Unit tests.**

- **abelianPointOrbit** (computation): An abelian coadjoint orbit is a point with d=0 and mass one.
- **nilpotentRegular** (non-example): A regular nilpotent orbit is regular although its invariant parameter is not regular semisimple.
- **scalingExponent** (computation): For a two-dimensional orbit, pushforward under scaling is t^-1 times the measure of the scaled orbit.
- **emptyMultiorbit** (degenerate): The empty multiorbit has zero measure and is a possible scaling limit.

**Uses.** QO.3 character trace: Fixes the trace leading coefficient and h^d normalization. QO.8 limit states: Supplies the phase-space marginal of disintegrated probability states.

**Construction route.**

1. The coadjoint tangent identification and Jacobi identity give the well-defined closed nondegenerate KKS form.
2. Use its top exterior power and normalized real density, then sum over finitely many components.
3. Scale the KKS form and distinguish regular orbit dimension from regular-semisimple quotient parameters.

**Check.** Verify every listed API law and run the discriminating examples below, including: The empty multiorbit has zero measure and is a possible scaling limit.

<a id="qo-3-orbital-radon"></a>

### Local finiteness of orbital measures — QO.3/orbital-radon

**Theorem.** For a real reductive group, the normalized symplectic measure of every coadjoint orbit is locally finite on the ambient dual: every compact set has finite mass, so every compactly supported continuous function is absolutely integrable. For this fixed real reductive group, each fibre of the invariant quotient is a union of finitely many coadjoint orbits, with a bound on their number independent of the quotient parameter.

**Dependencies.** [QO.3/orbital-measure](#qo-3-orbital-measure).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §6.1, p. 42, and §11.1, p. 83, citing Ranga Rao.

**Proof route.**

1. Reduce by an invariant nondegenerate bilinear form to the adjoint orbital-integral theorem.
2. Apply the cited Ranga Rao local-finiteness result with its Lie-algebra normalization; convert its invariant density to the KKS density.
3. The uniform finite-orbit fibre assertion uses the Kostant/Whitney results cited in NV §6.1; include their real-form and uniformity hypotheses in the primary-source obligation G4.

**Check.** Test the point orbit of an abelian group and a nonclosed nilpotent orbit approaching zero. The conclusion is local finiteness in the ambient dual, not finite total orbit volume.

**Named proof obligations.** [G4](#g4).

<a id="qo-3-harish-chandra-character"></a>

### Harish-Chandra character distribution — QO.3/harish-chandra-character

**Theorem.** For an irreducible admissible unitary representation of a real reductive group, the distribution f to tr Pi(f) on compactly supported smooth test functions is represented by a locally integrable conjugation-invariant function chi_Pi, analytic on the regular-semisimple locus. The statement requires the smoothing trace theorem for this class of representations; it is not true for arbitrary unitary representations.

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`, `AutomorphicSpectralTheory:AS.0/trace-class`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §6.2, pp. 42–43; §12.1, p. 87.

**Proof route.**

1. Use admissibility and the Harish-Chandra distribution-character theorem.
2. Identify the test-function trace with the smoothing trace in the general operator-ideal supplier; extend the resulting locally integrable distribution across the singular locus.

**Check.** Check that an infinite direct sum of the trivial representation is excluded. For a finite-dimensional compact-group representation recover its ordinary character and trace.

**Named proof obligations.** [G4](#g4).

<a id="qo-3-rossmann-character"></a>

### Rossmann character formula — QO.3/rossmann-character

**Theorem.** For irreducible tempered Pi of a real reductive group, there is a unique nonempty regular coadjoint multiorbit O_Pi with [O_Pi]=lambda_Pi such that chi_Pi(exp x) sqrt(j(x))=integral_(O_Pi) exp(xi(x)) d omega(xi) as distributions on a fixed sufficiently small exponential chart independent of Pi. If lambda_Pi is regular semisimple, O_Pi is a single orbit.

**Dependencies.** [QO.3/harish-chandra-character](#qo-3-harish-chandra-character), [QO.3/orbital-radon](#qo-3-orbital-radon), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 6.1 and Remark 6.2, pp. 43–44.

**Proof route.**

1. Apply the cited Rossmann theorem using the KKS normalization and Harish-Chandra rho normalization fixed here.
2. Interpret the orbital Fourier transform distributionally; it need not be a pointwise convergent integral.
3. Use regular-semisimple character classification for the final single-orbit assertion.

**Check.** For the abelian line, the character is the Fourier transform of the unit point mass at i t. In noncompact cases the identity is distributional on one chart independent of Pi.

**Named proof obligations.** [G4](#g4).

<a id="qo-3-orbit-topology"></a>

### Weak topology of regular multiorbits — QO.3/orbit-topology

**Definition.** Topologize regular multiorbits by their Radon measures as elements of the weak dual of compactly supported smooth functions. Include the empty multiorbit with zero measure. A limit orbit of a family Pi(h) means a weak limit of h O_Pi; it is not defined by a pointwise choice of a representative xi_h. The full regular-fibre measure omega_lambda is the sum over all regular orbits above lambda.

**Dependencies.** [QO.3/orbital-radon](#qo-3-orbital-radon).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §11.1, Theorem 11.1 and §11.3, pp. 83–86.

**API.**

- **orbitWeakConvergence** (characterisation): Convergence is convergence against every compactly supported smooth test function.
- **fullFibreMeasure** (data): omega_lambda sums the regular orbits over lambda, using the uniform finite-orbit bound.
- **limitOrbitFamily** (relation): A chosen semiclassical family has limit O exactly when its scaled orbital measures converge weakly to omega_O.
- **emptyOrbitLimit** (compatibility): Mass escaping every compact set has zero, hence empty-multiorbit, weak limit.

**Unit tests.**

- **constantOrbit** (computation): A constant multiorbit sequence converges to itself.
- **escapingAbelianPoints** (computation): Point masses at integers in an abelian dual converge vaguely to zero, so excluding the empty orbit loses limits.
- **alternatingLimits** (non-example): Alternating point masses at two distinct fixed points have no full-sequence weak limit, although each parity has one.

**Uses.** QO.3 uniform trace limits: Turns trace asymptotics into convergence of normalized traces. QO.8 limit states: Fixes the common orbit marginal along a subsequence.

**Construction route.**

1. Use local finiteness to embed orbital measures into distributions and inherit the weak topology.
2. Define full regular-fibre measures and limits without imposing continuity on the representation family.

**Check.** Verify every listed API law and run the discriminating examples below, including: Alternating point masses at two distinct fixed points have no full-sequence weak limit, although each parity has one.

<a id="qo-3-orbit-continuity"></a>

### Regular orbit continuity criterion — QO.3/orbit-continuity

**Theorem.** For a sequence of regular multiorbits O_j, let O be the set of limits of regular points xi_j in O_j along the full sequence. If there is a nonempty weak multiorbit limit it equals O. Conversely, if O is nonempty and contains every regular subsequential limit, then O is a regular multiorbit and O_j converges weakly to O. The full-fibre measures omega_lambda depend continuously on lambda, and single-orbit restrictions vary continuously in a regular submersion neighborhood.

**Dependencies.** [QO.3/orbit-topology](#qo-3-orbit-topology), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 11.1 and Lemmas 11.2–11.3, pp. 83–85; Rossmann references there.

**Proof route.**

1. Use the smooth local quotient submersion near a regular point and continuity of its orbital density.
2. Invoke continuity of full-fibre measures to control mass not captured by finitely many local orbit charts.
3. Show the assumed subsequential condition excludes any additional regular support in a weak limit; use local finiteness and positivity to conclude.

**Check.** Distinguish a full-sequence limit from a parity subsequence. Check that an additional regular subsequential support point prevents the converse criterion from applying.

**Named proof obligations.** [G4](#g4).

<a id="qo-3-orbital-decay"></a>

### Uniform orbital decay — QO.3/orbital-decay

**Theorem.** Let 2d be the regular orbit dimension and epsilon>0. Uniformly over regular multiorbits O, integral_O <xi>^(-d-epsilon) d omega <=C <[O]>^-epsilon. Consequently orbital integration is uniformly continuous on sufficiently negative symbol orders, with spectral-parameter decay. For a fixed tempered Pi, h O_Pi tends to a regular nilpotent multiorbit, possibly empty; nonemptiness is equivalent to maximal Gelfand–Kirillov dimension, and in the quasi-split case to genericity. In particular, for every fixed compact C in the dual and continuous test f supported in C, sup_O |integral_O f|<=C_C sup_C |f| over all regular multiorbits O; this is uniform local mass control, not a total-volume bound.

**Dependencies.** [QO.3/orbit-continuity](#qo-3-orbit-continuity), [QO.3/orbital-measure](#qo-3-orbital-measure).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemmas 11.4–11.6 and §§11.3–11.4, pp. 85–86.

**Proof route.**

1. Use orbit continuity to bound mass on compact annuli uniformly in a compact quotient range.
2. Apply dilation and sum dyadic annuli; retain the homogeneous d exponent and quotient weight.
3. For the nilpotent limit use the cited character-wavefront/asymptotic-cycle results of Barbasch–Vogan and Rossmann, and Kostant for genericity.

**Check.** For a point orbit at i t, the bound is <t>^-epsilon. In dimension 2d check the dyadic integral uses d rather than 2d, and retain the empty limit for nongeneric tempered representations.

**Named proof obligations.** [G5](#g5).

<a id="qo-3-refined-trace"></a>

### Uniform orbit trace expansion — QO.3/refined-trace

**Theorem.** For irreducible tempered Pi, regular orbit dimension 2d, even N>d, 0<=delta<1 and a in S_delta^-N, |tr Op_h(a)|<=C h^-d <h lambda_Pi>^(d-N). Moreover h^d tr Op_h(a)=integral_(h O_Pi)a + O(h^(1-delta)<h lambda_Pi>^(d-N-1)). For Schwartz families there are constant-coefficient differential operators D_j of pure degree j, D_0=1, such that h^d tr Op_h(a)=sum_(j<J)h^j integral_(h O_Pi) D_j a + O(h^((1-delta)J)<h lambda_Pi>^-L), for arbitrary L. If a is fixed and h O_Pi tends to O, the normalized trace tends to integral_O a.

**Dependencies.** [QO.3/rossmann-character](#qo-3-rossmann-character), [QO.3/orbital-decay](#qo-3-orbital-decay), [QO.1/fourier-cutoff](#qo-1-fourier-cutoff), [QO.1/polynomial-quantization](#qo-1-polynomial-quantization), `AutomorphicSpectralTheory:AS.0/trace-class`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 6.3, pp. 44–45; Theorem 12.2 and §12.3, pp. 87–90.

**Proof route.**

1. Insert the Rossmann distribution formula in the exponential-coordinate trace; the multiplier is chi/sqrt(j), not chi alone.
2. Use Fourier cutoff asymptotics to expand this multiplier, with constant-coefficient D_j.
3. Apply uniform orbital decay to the remainder and preserve the scaled infinitesimal-character weight.
4. Use the weak orbit limit plus uniform tails for the final fixed-symbol limit.

**Check.** For an abelian character, d=0 and the trace tends to a(h i t). Verify the chi/sqrt(j) multiplier, h^d normalization, pure derivative degree of each D_j, and the spectral weight in every remainder.

<a id="qo-3-smooth-trace-class"></a>

### Smooth trace-ideal refinement — QO.3/smooth-trace-class

**Definition.** Import the general Schatten ideals from the current OperatorTheory/OperatorIdeals roadmap. For p=1,2,infinity define T_p(Pi) as the operators for which every iterated Lie commutator is in the imported Schatten p ideal, with the corresponding commutator-ideal seminorms. At p=infinity use bounded operators. This is the representation-smooth refinement of existing ideals, not a new singular-value or trace construction.

**Dependencies.** [QO.0/operator-order](#qo-0-operator-order), `AutomorphicSpectralTheory:AS.0/trace-class`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §12.1, p. 87; Theorem 12.2, equations (12.5)–(12.9), pp. 88–90.

**API.**

- **smoothIdealInclusion** (coercion): Forgetting commutator bounds gives an operator in the imported Schatten ideal.
- **smoothIdealSeminorm** (data): The word-u seminorm is the Schatten p norm of theta_u(T).
- **smoothIdealAdjoint** (structure): Adjoint preserves the class continuously.
- **smoothIdealTrace** (compatibility): On T_1 the trace is exactly the imported Hilbert-space trace.
- **smoothIdealFiniteRank** (relation): Finite-rank tensors of smooth vectors lie in every T_p.

**Unit tests.**

- **smoothRankOne** (computation): For smooth u,v the rank-one tensor has trace <u,v> and trace norm ||u||||v||.
- **identityInfiniteDimension** (non-example): The identity has all commutators zero but is not in T_1 or T_2 on an infinite-dimensional representation.
- **trivialFiniteDimension** (compatibility): For a finite-dimensional trivial representation T_p is precisely the whole imported finite-dimensional Schatten ideal.

**Uses.** QO.3 uniform estimates: The target topology controls derivatives as well as trace norms. QO.8 operator states: Smooth commutator trace bounds control all derivatives of the diagonal kernel.

**Construction route.**

1. Take the inverse image of each imported ideal under the smooth commutator maps.
2. Equip the intersection with all ideal seminorms and prove compatibility with the imported trace and adjoint.

**Check.** Verify every listed API law and run the discriminating examples below, including: For a finite-dimensional trivial representation T_p is precisely the whole imported finite-dimensional Schatten ideal.

<a id="qo-3-smooth-trace-ideals"></a>

### Uniform smoothing trace-ideal estimates — QO.3/smooth-trace-ideals

**Theorem.** Write T_p for operators whose iterated Lie commutators are in Schatten class p, p=1,2,infinity. For sufficiently large even N, Psi^-N(Pi) maps continuously into <lambda_Pi>^(d-N) T_1 uniformly for tempered Pi; more precisely ||T||_1<=C<lambda_Pi>^(d-N)||T||_(Pi^0 to Pi^N). The rescaled Laplacian Delta_h=1-h^2 sum X^2 has ||Delta_h^-1||<=1 and tr Delta_h^(-N/2)<=C h^-d<h lambda_Pi>^(d-N). For a in S_0^-N, Op_h(a) has T_1 size h^-d<h lambda_Pi>^(d-N) and T_2 size h^(-d/2)<h lambda_Pi>^((d-N)/2). For bounded Schwartz symbols with delta=0, normalized products differ from the quantization of their pointwise product by O(h) in h^-d T_1. Sufficiently negative orders are trace class for nontempered irreducibles as well, without these tempered weights. For each fixed 0<=delta<1/2 and sufficiently large N, ||Op_h(a)||_1<=C h^-d for bounded S_delta^-N families, with finite symbol-seminorm control independent of Pi and h. For bounded delta=0 Schwartz tuples, h^d Op_h(a1)...Op_h(ak) lies in <h lambda_Pi>^(d-N) T_1 and differs from h^d Op_h(a1...ak) by h<h lambda_Pi>^(d-N) T_1. For ||Ad(g)||<=h^(-1+epsilon), h^d Op_h(g.a)-h^d Pi(g)Op_h(a)Pi(g)^-1 is h-infinity <h lambda_Pi>^(d-N) T_1, for bounded S_0^m families of any fixed finite order m and sufficiently high smoothing remainder order.

**Dependencies.** [QO.3/refined-trace](#qo-3-refined-trace), [QO.1/operator-calculus](#qo-1-operator-calculus), [QO.0/operator-algebra](#qo-0-operator-algebra), `AutomorphicSpectralTheory:AS.0/trace-class`, [QO.3/smooth-trace-class](#qo-3-smooth-trace-class).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 6.3(ii)–(iii) and Remark 6.4, pp. 44–45; Lemma 12.1 and Theorem 12.2(ii)–(vii), §§12.2–12.3, pp. 87–90.

**Proof route.**

1. Build an elliptic approximate inverse for Delta_h from <xi>^-N, invert its 1+O(h) bounded error, and use positivity plus the trace formula to bound the inverse power trace.
2. Factor an order -N operator through Delta^(-N/2), then use the trace-ideal inequality and commute words through the factorization.
3. For Hilbert–Schmidt bounds apply the trace estimate to T* T.
4. Use the rescaled operator calculus with one extra order and enough h-gain to obtain the O(h) trace-norm product error.
5. For delta<1/2 factor the negative-order quantization through a rescaled negative Laplacian power and use the bounded symbol calculus to bound the remaining factor. Upgrade product and near-covariance smoothing remainders by arbitrarily negative orders and the trace-ideal estimate, retaining both h^d and the spectral weight.

**Check.** Check the rescaled inverse has operator norm at most one, tempered trace growth h^-d, and Hilbert-Schmidt growth h^(-d/2). The identity on an infinite-dimensional Pi must fail trace-class membership despite vanishing commutators.

**Atlas planets.** Normalized regular multiorbits, Rossmann character formula, Uniform orbit trace expansion, Uniform smoothing trace-ideal estimates.

<a id="qo-4"></a>

## QO.4. Uniform Plancherel and relative characters

Obtain uniform K-type, matrix-coefficient and smoothing trace bounds; the p-adic Plancherel formula; its extension to smooth Xi-integrable functions; and basis-independent local relative characters with Plancherel disintegration and joint spectral localization.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`, `SmoothRepresentationsOfLocalGroups:SR.3a`, `AutomorphicSpectralTheory:AS.0/vector-schwartz`, `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicSpectralTheory:AS.0/trace-class`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`.

**Layer acceptance.** Recover compact isotypic traces and normalized open-compact projectors exactly. Prove integrated absolute trace bounds before passing Plancherel through a limit.

<a id="qo-4-uniform-k-types"></a>

### Uniform K-type and matrix-coefficient bounds — QO.4/uniform-k-types

**Theorem.** For a fixed real reductive group choose L large and kappa=(1-sum_(X in basis k)X^2)^L. Its scalar kappa_tau on each irreducible K-type satisfies dim(tau)<=sqrt(kappa_tau) and sum_tau kappa_tau^-1<infinity. Uniform admissibility then bounds tr Pi(kappa)^-2 for irreducible unitary Pi. For tempered Pi, smooth matrix coefficients satisfy |<Pi(g)u,v>|<=C Xi_G(g)||u||_s||v||_s for a group-dependent s and C independent of Pi. On a single tau-isotypic subspace, every vector v satisfies sqrt(dim(K.v)) ||v||<=||Pi(kappa)v||; the K-span dimension includes multiplicity, not just dim(tau).

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, [QO.0/sobolev-scale](#qo-0-sobolev-scale).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma A.1 and §A.2, pp. 137–138.

**Proof route.**

1. Use compact highest-weight dimension and Casimir growth estimates to choose a sufficiently high power L.
2. Use the K-type multiplicity bound and sum kappa_tau^-1.
3. Apply the Cowling–Haagerup–Howe K-finite coefficient bound, expand in K-types, and use weighted Cauchy–Schwarz to sum the components.

**Check.** The trivial K-type must have positive kappa eigenvalue. Choose L so both dimension domination and reciprocal summability hold; a first Casimir power does not suffice in arbitrary rank.

**Named proof obligations.** [G7](#g7).

<a id="qo-4-padic-plancherel"></a>

### p-adic Plancherel formula — QO.4/padic-plancherel

**Theorem.** For a reductive group over a nonarchimedean local field of characteristic zero with Haar measure dg, there is a Plancherel measure on its tempered dual such that f(1)=integral tr Pi(f) dmu(Pi) for every compactly supported locally constant f. For a compact open U, integral dim Pi^U dmu=vol(U)^-1, in particular finite.

**Dependencies.** `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §A.3 and §A.4.1, pp. 138–139, citing Waldspurger.

**Proof route.**

1. Import admissible smooth irreducible representations and their integrated Hecke action from SR.1 and SR.3.
2. Supply the Harish-Chandra–Waldspurger Plancherel theorem, which the existing SR.3 stage does not promise.
3. Apply it to vol(U)^-1 1_U, whose integrated action is the orthogonal U-fixed projector.

**Check.** For the normalized idempotent vol(U)^-1 1_U, recover exactly integral dim(Pi^U)=vol(U)^-1, including Haar rescaling.

**Named proof obligations.** [G7](#g7).

<a id="qo-4-plancherel-sobolev"></a>

### Uniform Plancherel Sobolev summability — QO.4/plancherel-sobolev

**Theorem.** For sufficiently large N depending only on the real reductive group, tr Delta^-N is uniformly bounded over all irreducible unitary representations, and its integral over the tempered dual for Plancherel measure is finite. The first assertion includes nontempered representations; the second is a tempered integral. The analogous p-adic fixed-level statement is the finite integral of dim Pi^U.

**Dependencies.** [QO.4/uniform-k-types](#qo-4-uniform-k-types), [QO.4/padic-plancherel](#qo-4-padic-plancherel), [QO.0/operator-algebra](#qo-0-operator-algebra).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma A.3 and §A.4.2, pp. 138–139.

**Proof route.**

1. Compare a sufficiently large Delta power with the compact K-type operator from A.1 and the uniform admissibility estimate.
2. Use the supplied real Plancherel formula on a sufficiently smooth convolution-square approximate identity to control the integrated trace.
3. For the p-adic version apply the exact fixed-vector Plancherel identity.

**Check.** Keep the uniform bound over the whole unitary dual distinct from integrability over the tempered dual. Specify one sufficiently large N depending only on the group.

**Named proof obligations.** [G6](#g6).

<a id="qo-4-xi-test-space"></a>

### Smooth Xi-integrable test space — QO.4/xi-test-space

**Definition.** For a real reductive G, F_Xi(G) consists of smooth f such that integral_G |D_L D_R f(g)| Xi_G(g) dg is finite for all enveloping left and right derivatives, with those L1 seminorms. In the p-adic case take the union over compact open U of bi-U-invariant functions with integral |f| Xi finite, with its fixed-level inductive topology. Compactly supported smooth test functions are dense and point evaluations are continuous.

**Dependencies.** [QO.4/uniform-k-types](#qo-4-uniform-k-types), [QO.0/sobolev-scale](#qo-0-sobolev-scale), `AutomorphicSpectralTheory:AS.0/vector-schwartz`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §A.5 and equation (A.5), pp. 139–140.

**API.**

- **xiSpaceDerivatives** (structure): Left and right enveloping differentiation are continuous on F_Xi.
- **xiSpaceDenseTests** (relation): Compactly supported smooth tests are dense in the declared topology.
- **xiSpaceEvaluation** (structure): Evaluation at every fixed group element is continuous.
- **xiSpaceCoefficientPairing** (compatibility): For tempered smooth u,v the integral of f(g)<Pi(g)u,v> converges absolutely.
- **xiSpaceFixedLevel** (compatibility): At fixed p-adic U this is the weighted l1 space on U double cosets.

**Unit tests.**

- **compactTest** (compatibility): Every compactly supported smooth function lies in F_Xi and has the usual integrated action.
- **abelianRealLine** (computation): When Xi=1 on R, membership requires integrable derivatives of every order, not just f in L1.
- **oneSidedFailure** (non-example): Bounds on f alone do not supply the right derivatives needed to move Delta powers off both vectors.
- **finiteGroup** (degenerate): For a finite group at singleton level the test space is the full finite-dimensional function space.

**Uses.** QO.4 extended Plancherel: Defines the topology in which trace-norm continuity and density are proved. QO.4 relative characters: Restricted matrix coefficients land here because Xi_G restricted to H times Xi_H is integrable.

**Construction route.**

1. Complete the smooth weighted derivative seminorm construction, retaining both left and right actions.
2. Use compact cutoffs and their uniformly controlled derivatives for density; use local Sobolev embedding for evaluation.
3. At p-adic fixed level use weighted l1 on double cosets and then the union topology.

**Check.** Verify every listed API law and run the discriminating examples below, including: For a finite group at singleton level the test space is the full finite-dimensional function space.

<a id="qo-4-extended-plancherel"></a>

### Plancherel for Xi-integrable functions — QO.4/extended-plancherel

**Theorem.** For tempered irreducible Pi and f in F_Xi, the absolutely convergent smooth matrix-coefficient pairing defines a unique continuous Pi(f):Pi-infinity to Pi-infinity. The map f to Pi(f) is trace-norm continuous; integral_tempered ||Pi(f)||_1 dmu is finite and continuously bounded in f. The Plancherel identity f(1)=integral tr Pi(f) dmu extends from compact tests to all F_Xi.

**Dependencies.** [QO.4/xi-test-space](#qo-4-xi-test-space), [QO.4/plancherel-sobolev](#qo-4-plancherel-sobolev), [QO.4/padic-plancherel](#qo-4-padic-plancherel), `AutomorphicSpectralTheory:AS.0/trace-class`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma A.4, pp. 140–141.

**Proof route.**

1. Integrate by parts with sufficiently high left and right Delta powers to bound the pairing by a continuous F_Xi seminorm times negative Sobolev norms of both vectors.
2. Sum in an eigenbasis using uniform and integrated Sobolev trace summability; repeat after differentiating to obtain smooth vectors.
3. Use trace-norm continuity, integrated trace-norm control and compact-test density to pass the Plancherel identity to the limit.

**Check.** Check convergence in integrated trace norm when approximating by compact tests, then evaluation at 1. Weak coefficient convergence by itself is insufficient to pass the trace integral.

**Named proof obligations.** [G6](#g6).

<a id="qo-4-relative-character"></a>

### Local relative character — QO.4/relative-character

**Definition.** For a local GGP pair with chosen Haar measures and tempered irreducible Pi,sigma, define H_sigma(v1 tensor conjugate(v2))=sum_(u in an adapted orthonormal basis of sigma) integral_H <Pi(s)v1,v2><u,sigma(s)u> ds, in the fixed inner-product convention. Its extension to smoothing operators is basis independent and H times H equivariant through sigma. In the real case it is uniformly continuous on Psi^-N(Pi) for one sufficiently large N. This definition is Hermitian; positivity in the archimedean case is not asserted by this construction.

**Dependencies.** [QO.4/extended-plancherel](#qo-4-extended-plancherel), [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 18.1, pp. 121–122; §A.6, pp. 141–142; Remark 18.2.

**API.**

- **relativeCharacterRankOne** (data): The basis-integral formula agrees with the trace of sigma applied to the restricted coefficient.
- **relativeCharacterBasisIndependent** (extensionality): Changing the adapted orthonormal basis does not change H_sigma.
- **relativeCharacterEquivariance** (functoriality): The smoothing-operator map factors H times H-equivariantly through sigma smoothing operators and trace.
- **relativeCharacterUniformContinuity** (structure): A fixed Psi^-N seminorm bounds |H_sigma(T)| uniformly for tempered Pi,sigma.
- **relativeCharacterHermitian** (compatibility): H_sigma(T*)=conj H_sigma(T).

**Unit tests.**

- **compactRestriction** (computation): With compact H of probability Haar, H_sigma is dim(sigma)^-1 times the trace on the sigma-isotypic part of Pi, with multiplicity understood.
- **trivialH** (degenerate): For H trivial with mass one and its trivial sigma, H_sigma(T)=tr T.
- **haarRescale** (compatibility): Multiplying dh by c multiplies H_sigma by c and divides the dual Plancherel measure by c.
- **archPositivityBoundary** (non-example): Hermitian symmetry alone does not imply nonnegative values on positive rank-one inputs.

**Uses.** QO.6 stable asymptotics: This is the distribution to be compared with stable orbital integrals. QO.9 period constants: Its chosen normalization determines the local factors in the period identity.

**Construction route.**

1. Use the supplied GGP estimate integral_H Xi_G(s)Xi_H(s) ds<infinity to put each restricted coefficient in F_Xi(H).
2. Apply extended Plancherel to the sigma trace of this coefficient; this gives basis independence.
3. For smoothing T estimate differentiated restricted coefficients through high Sobolev conjugates and trace ideals; extend from finite rank by continuity.

**Check.** Verify every listed API law and run the discriminating examples below, including: Hermitian symmetry alone does not imply nonnegative values on positive rank-one inputs.

**Named proof obligations.** [G8](#g8).

<a id="qo-4-relative-disintegration"></a>

### Relative Plancherel disintegration — QO.4/relative-disintegration

**Theorem.** For tempered Pi and finite-rank smooth T, and for sufficiently negative-order T in the real case, tr T=integral_(sigma tempered) H_sigma(T) dmu_H(sigma), with absolute convergence and uniform continuous estimates. The relative character has the polynomial h-loss and arbitrary spectral decay of joint localization; off the simultaneous G and H infinitesimal-character loci it is h-infinity with both spectral weights.

**Dependencies.** [QO.4/relative-character](#qo-4-relative-character), [QO.4/extended-plancherel](#qo-4-extended-plancherel), [QO.2/joint-localization](#qo-2-joint-localization).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 18.1(ii)–(iii), pp. 121–122; Lemma 19.1, pp. 123–124; §A.6, pp. 141–142.

**Proof route.**

1. Apply extended Plancherel to restricted finite-rank coefficients.
2. Control the smoothing extension and exchanges of basis sums and integrals by integrated trace norms.
3. Apply joint infinitesimal localization to the H times H-equivariant smoothing factorization.

**Check.** For compact H of probability Haar, integrate against the atomic Plancherel mass dim(sigma) and recover the isotypic trace sum. Bound the absolute integral before exchanging sums.

**Atlas planets.** Uniform K-type and matrix-coefficient bounds, p-adic Plancherel formula, Plancherel for Xi-integrable functions, Local relative character, Relative Plancherel disintegration.

<a id="qo-5"></a>

## QO.5. Stable Hamiltonian reduction and measures

For orthogonal and unitary GGP Lie-algebra pairs, prove the disjoint-spectrum stability criterion and torsor theorem. Compare the three fibral volume forms, normalize real orbital disintegration, and establish the properness estimate needed for uniform stable-fibre integrals.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.4`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.0`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Layer acceptance.** Use one ambient dual variable for the joint fibre. Geometric torsors can lack real points; every determinant scalar and real density must agree across all three descriptions.

<a id="qo-5-relative-fibres"></a>

### Joint and relative coadjoint fibres — QO.5/relative-fibres

**Definition.** For the supplied GGP pair define the joint quotient map q(xi)=([xi],[xi|h]) on g*. Write O_(lambda,mu)=q^-1(lambda,mu). For tempered Pi,sigma define O_(Pi,sigma)=O_Pi intersect res^-1(O_sigma). Its normalized integral is zero unless it is a nonempty stable H-torsor; in that case use the transport of the fixed Haar measure of H. Stability and the torsor assertion are theorems, not fields in the fibre data.

**Dependencies.** [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient), [QO.3/orbital-measure](#qo-3-orbital-measure).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §14.3, pp. 99–101; §§16.5, 17.3 and 19.3, pp. 110–111, 116–118, 124–126.

**API.**

- **jointFibreMembership** (characterisation): Membership means the two quotient equalities on a single xi in g*.
- **relativeFibreMembership** (characterisation): Membership means xi in O_Pi and xi|h in O_sigma.
- **relativeFibreEquivariance** (functoriality): H acts on both fibres by coadjoint translation.
- **relativeFibreIntegral** (compatibility): A nonempty stable torsor carries the fixed H Haar transport, independent of the chosen base point.
- **relativeFibreZero** (simp): Empty or unstable fibres have zero integral under the convention used in the relative trace expansion.

**Unit tests.**

- **singleAmbientVariable** (non-example): The fibre is in g*, not in g* times h*; independent variables double the expected fibre dimension.
- **emptyRealFibre** (degenerate): A geometric stable fibre with no real points has zero relative integral.
- **torsorBasePoint** (compatibility): Changing the real base point by an H element gives the same transported Haar measure because the reductive group is unimodular.
- **scaledParameters** (computation): Scaling xi by h scales both homogeneous quotient parameters and takes O_(Pi,sigma) to h O_(Pi,sigma).

**Uses.** QO.5 volume theorem: The same fibre is described by all three determinant sequences. QO.6 stable expansion: Specifies exactly the orbital integration domain.

**Construction route.**

1. Use restriction to h and the two invariant quotient maps to form ordinary fibres and orbit intersections.
2. Attach integration only after the stable torsor theorem and volume comparison; make empty and unstable cases explicit.

**Check.** Verify every listed API law and run the discriminating examples below, including: Scaling xi by h scales both homogeneous quotient parameters and takes O_(Pi,sigma) to h O_(Pi,sigma).

**Named proof obligations.** [G8](#g8).

<a id="qo-5-stable-criterion"></a>

### Disjoint-spectrum stability — QO.5/stable-criterion

**Theorem.** For the orthogonal or unitary GGP Lie-algebra pair over an algebraically closed field of characteristic zero, an element x in g* is stable for H (closed orbit and finite isotropy) iff its invariant spectral data and those of x|h have disjoint eigenvalue sets ev(x) and ev(x|h). Here ev is the root multiset of the characteristic polynomial on the standard summand V+ after splitting the quadratic etale algebra; in the orthogonal case V+=V. Remove one forced zero root in odd dimension. In even orthogonal dimension retain the Pfaffian as an additional quotient coordinate, with pf(x)^2=det(x); spectra alone do not specify the quotient point. In this stable locus the isotropy is actually trivial. Equivalently, x has no isotropic eigenvector in V_H+ or V_H- after splitting. If e is the distinguished vector fixed by H, the k1[x]-span of e is all of V in the unitary case, and is nondegenerate of codimension at most one in the orthogonal case. Stable invariant pairs form a dense open subset of [g*] times [h*]; for each fixed lambda, their mu-section is dense open in [h*].

**Dependencies.** [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient), [QO.5/relative-fibres](#qo-5-relative-fibres).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 14.2, Definition 14.3 and Lemmas 14.4, 14.8, §§14.2–14.3, pp. 97–101; §13.4.1, p. 93.

**Proof route.**

1. Use the supplied Hilbert–Mumford isotropic-eigenvector criterion for these representations.
2. If the spectra meet, construct an isotropic destabilizing eigenvector or a nontrivial stabilizer using the GGP block form.
3. If they are disjoint, the distinguished vector is cyclic in the unitary case; in the orthogonal case its cyclic span is nondegenerate of codimension at most one.
4. A commuting H-element fixing that distinguished vector is then identity; the no-isotropic-eigenvector condition gives closedness.

**Check.** In SO(3)/SO(2), both ordinary characteristic polynomials have a forced zero when x_H=0; remove exactly one odd-dimensional forced root before testing spectral disjointness. Keep even-dimensional Pfaffian data.

**Named proof obligations.** [G8](#g8).

<a id="qo-5-stable-torsor"></a>

### Stable fibres are torsors — QO.5/stable-torsor

**Theorem.** For a stable invariant pair (lambda,mu), the scheme fibre {xi in g*: [xi]=lambda, [xi|h]=mu} is a principal homogeneous H-space, and the stable joint quotient is a principal H-bundle. Over an algebraically closed field each stable fibre is nonempty and one free H-orbit. Over R a stable fibre can be empty; if it has a real point it is one H(R)-orbit. Over the algebraic closure the unrestricted joint quotient x to ([x],[x_H]) is surjective, including over unstable invariant pairs; stability additionally implies that x and x_H are both regular.

**Dependencies.** [QO.5/stable-criterion](#qo-5-stable-criterion), [QO.5/relative-fibres](#qo-5-relative-fibres).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 14.5 and Lemmas 14.6–14.8, pp. 99–101; §17.3, pp. 116–117.

**Proof route.**

1. Use the supplied spherical moment-map dominance and the explicit characteristic-polynomial invariants to obtain a point in each stable geometric fibre.
2. Recover moments of the distinguished cyclic vector from the two characteristic polynomials using Cramer identities.
3. Apply the cyclic-span isometry and Witt extension theorem; in the even orthogonal case fix orientation through the Pfaffian.
4. Use trivial isotropy and the smooth fibre dimension computation for the torsor scheme statement; for real points the unique geometric conjugator is Galois fixed.

**Check.** Check geometric nonemptiness, freeness and scheme smoothness separately. A real fibre with no real point stays empty; geometric torsor structure alone does not produce a real point.

**Named proof obligations.** [G8](#g8), [G9](#g9).

<a id="qo-5-fibral-forms"></a>

### Fibral and invariant volume forms — QO.5/fibral-forms

**Definition.** For an exact tangent sequence 0 to T_fibre to T_total to T_base to 0, the quotient of nonvanishing total and base determinant forms defines the fibre form. On a group fix a translation-invariant top form beta_H and its dual on h*. Use algebraic symplectic volume sigma^d/d!, without the real 2 pi normalization at this stage. An affine volume form is the wedge of differentials of homogeneous invariant generators, specified up to its stated scalar and orientation.

**Dependencies.** [QO.5/stable-torsor](#qo-5-stable-torsor), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, [QO.5/relative-fibres](#qo-5-relative-fibres).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§16.1–16.4, pp. 108–110.

**API.**

- **fibralDeterminant** (universal-property): The fibre form is the unique determinant factor making total=fibre wedge base in the chosen exact-sequence order.
- **fibralComposition** (functoriality): Successive smooth fibrations give the same quotient form up to the declared permutation sign.
- **haarDualForm** (compatibility): Rescaling beta_H by c rescales its dual h* form by c^-1.
- **symplecticTopForm** (data): Algebraic orbit volume is sigma^d/d!.
- **affineGeneratorChange** (compatibility): Changing invariant generators multiplies the affine form by the Jacobian determinant.

**Unit tests.**

- **productProjection** (computation): For projection R^(r+s) to R^s with ordered standard coordinates, the fibre form is dx1 wedge ... wedge dxr.
- **oneDimensionalRescale** (computation): If the base form is multiplied by c and total fixed, the fibre form is multiplied by c^-1.
- **zeroDimensionalFibre** (degenerate): For a zero-dimensional fibre the quotient is the determinant ratio scalar, not an extra positive-dimensional differential form.

**Uses.** QO.5 volume comparison: Makes all three exact-sequence normalizations comparable. QO.5 real disintegration: Determines the Haar measure on stable torsors and affine quotient measure.

**Construction route.**

1. Use determinant-line functoriality for exact sequences, rather than coordinates depending on a splitting.
2. Construct the invariant group and dual Lie-algebra forms by translation.
3. Separate algebraic top forms from their normalized real measures and track sign under reordering exact sequences.

**Check.** Verify every listed API law and run the discriminating examples below, including: For a zero-dimensional fibre the quotient is the determinant ratio scalar, not an extra positive-dimensional differential form.

**Named proof obligations.** [G11](#g11).

<a id="qo-5-normalized-affine-form"></a>

### Normalized affine quotient form — QO.5/normalized-affine-form

**Theorem.** For a reductive Lie algebra and a chosen invariant volume beta_g, there is an affine quotient top form gamma_g such that quotienting beta_g by gamma_g gives the algebraic symplectic form on every regular orbit, with the fixed sign convention. On a Cartan its pullback is the product over positive coroot pairings times the wedge of the Cartan coordinate differentials, with the scalar fixed by beta_g and the chosen Chevalley basis.

**Dependencies.** [QO.5/fibral-forms](#qo-5-fibral-forms), [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 16.4, Definition 16.5 and Remark 16.6 in §16.4, p. 110; Rossmann Lemma C cited there.

**Proof route.**

1. Check the regular-semisimple tangent splitting into root spaces and Cartan directions.
2. Compute the Jacobian in a Chevalley basis and identify the root-product discriminant.
3. Extend the identity of regular forms from the dense regular-semisimple locus; the cited Rossmann normalization theorem supplies the missing global identity.

**Check.** On a Cartan compute the coroot-product Jacobian and the scalar determined by the chosen ambient form. Verify the extension across regular nonsemisimple fibres.

**Named proof obligations.** [G10](#g10).

<a id="qo-5-three-volume-comparison"></a>

### Stable fibre volume compatibility — QO.5/three-volume-comparison

**Theorem.** For a stable pair (lambda,mu), the same top form up to the declared orientation sign on the H-torsor O_(lambda,mu) results from: (1) symplectic reduction of O_lambda^reg times O_-mu^reg by the moment map to h* at zero; (2) the quotient O_lambda^reg to [h*]; and (3) the joint quotient g*_reg to [g*] times [h*]. Under the orbit map from H this form is the transported Haar form normalized by beta_H and its dual; it is not an arbitrary scalar multiple.

**Dependencies.** [QO.5/stable-torsor](#qo-5-stable-torsor), [QO.5/normalized-affine-form](#qo-5-normalized-affine-form), [QO.5/fibral-forms](#qo-5-fibral-forms).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 16.7 and §§16.5.1–16.5.2, pp. 111–114.

**Proof route.**

1. Compare determinant sequences for the two-stage quotient using the normalized affine forms.
2. Use the Lagrangian tangent subspace in the first reduction to compare its symplectic determinant with the Haar determinant.
3. For the bottom quotient choose the spherical complementary nilpotent tangent space and compute the remaining Chevalley Jacobian; the root factors cancel.

**Check.** Compare all three determinant exact sequences on the same joint fibre and retain the sign until passing to densities. No undetermined nonzero scalar may remain.

**Named proof obligations.** [G8](#g8).

<a id="qo-5-real-measure-normalization"></a>

### Normalized real measures — QO.5/real-measure-normalization

**Definition.** For a real algebraic top form, use absolute density with each real coordinate differential carrying Lebesgue measure divided by sqrt(2 pi), and use Fourier-dual Lie-algebra and dual measures. Thus the algebraic symplectic volume sigma^d/d! on a real 2d-orbit becomes sigma^d/(d!(2 pi)^d). Normalize affine quotient measures through the preceding fibral identities; Haar rescaling remains paired with the reciprocal Plancherel rescaling.

**Dependencies.** [QO.5/three-volume-comparison](#qo-5-three-volume-comparison), [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.3/orbital-measure](#qo-3-orbital-measure).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§17.1–17.2, pp. 115–116.

**API.**

- **realDensityCoordinate** (data): A coordinate r-form has the absolute determinant density times (2 pi)^(-r/2) Lebesgue measure.
- **realSymplecticAgreement** (compatibility): The real measure from the algebraic orbit form equals the QO.3 KKS normalization.
- **realFibralFubini** (compatibility): For smooth fibrations the fixed determinant quotient forms yield the corresponding measure disintegration.
- **stableEmptyFibre** (simp): Integration over an empty real stable fibre is zero.

**Unit tests.**

- **realLineDensity** (computation): The measure from dx on R is dx_Leb/sqrt(2 pi).
- **symplecticPlane** (compatibility): For sigma=dx wedge dy the orbit density is dx_Leb dy_Leb/(2 pi).
- **orientationReversal** (computation): Changing a top form to its negative leaves its measure unchanged.
- **emptyRealFibre** (degenerate): A geometric torsor with no real point contributes zero, not one Haar mass.

**Uses.** QO.5 orbital disintegration: Fixes the exact affine and Haar constants. QO.9 weighted formula: Prevents an undetected scalar in the final main term.

**Construction route.**

1. Turn a top exterior form into its absolute density in real coordinates and check coordinate invariance.
2. Apply the same coordinate convention simultaneously to the group, its dual and quotient exact sequences.
3. Use the three-volume comparison to fix the stable-fibre measure even when a real fibre is empty.

**Check.** Verify every listed API law and run the discriminating examples below, including: A geometric torsor with no real point contributes zero, not one Haar mass.

<a id="qo-5-stable-properness"></a>

### Uniform stable orbit properness — QO.5/stable-properness

**Theorem.** For a compact subset C of the stable locus, there are c,epsilon>0 such that |s.eta|>=c |s|^epsilon for eta in C and s in H, with the fixed algebraic group norm and after adjoining a harmless constant to the ambient norm. Consequently stable orbital integrals of Schwartz functions converge absolutely, uniformly on C, with finite seminorm control.

**Dependencies.** [QO.5/stable-torsor](#qo-5-stable-torsor), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 17.3, pp. 118–119.

**Proof route.**

1. The stable orbit map is a closed immersion after inverting the spectral resultant; coordinate functions of s are rational in eta and s.eta with denominators controlled on C.
2. Bound these polynomial coordinates to obtain the power inequality uniformly.
3. Combine it with polynomial volume growth for the chosen algebraic norm, obtained from KAK, to integrate arbitrarily high Schwartz decay.

**Check.** Keep the resultant denominator uniformly away from zero on the chosen compact stable set. Verify the Schwartz decay exponent beats the Haar volume growth of the chosen algebraic norm.

<a id="qo-5-stable-disintegration"></a>

### Stable orbital disintegration — QO.5/stable-disintegration

**Theorem.** For a Schwartz symbol supported in the stable locus, integral_(O_lambda) a = integral_mu integral_(O_(lambda,mu)) a dmu, with the normalized affine measure and stable-fibre Haar measure. The ambient dual similarly disintegrates over lambda into full regular-fibre measures. Empty real fibres contribute zero. Stable-fibre integrals vary continuously in the stable parameter pair and the Schwartz symbol, with uniform finite-seminorm bounds on compact stable parameter sets.

**Dependencies.** [QO.5/real-measure-normalization](#qo-5-real-measure-normalization), [QO.5/stable-properness](#qo-5-stable-properness), [QO.3/orbit-continuity](#qo-3-orbit-continuity).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 17.2 and equations (17.3)–(17.7), pp. 117–119.

**Proof route.**

1. Use the unique real H-orbit description of nonempty stable fibres and the three compatible forms.
2. Apply the coarea/Fubini theorem in smooth local charts with the normalized determinant densities.
3. Use stable properness for absolute convergence and dominated continuity, then patch compact stable parameter neighborhoods.

**Check.** For a symbol supported on one nonempty real stable torsor chart, verify normalized Fubini in coordinates and the Haar factor. Include an empty real fibre as a zero contribution.

**Named proof obligations.** [G11](#g11).

<a id="qo-5-complex-plancherel-scaling"></a>

### Complex Plancherel affine scaling — QO.5/complex-plancherel-scaling

**Theorem.** For H a complex reductive group viewed as a real group, and nonempty bounded open U in its imaginary infinitesimal quotient with smooth-measure-null boundary, the Plancherel mass of {sigma: h lambda_sigma in U} divided by the normalized affine measure of h^-1 U tends to one. This target is restricted to the complex case used in the paper, where the relevant orbit is the full regular fibre.

**Dependencies.** [QO.5/stable-disintegration](#qo-5-stable-disintegration), [QO.3/refined-trace](#qo-3-refined-trace), [QO.4/extended-plancherel](#qo-4-extended-plancherel).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 17.4 and its sketch, p. 120; §17.4 setup, p. 119.

**Proof route.**

1. Use the normalized affine disintegration of a compactly supported symbol.
2. Compare its integral with the Plancherel integral of the quantized trace and then apply the uniform orbit trace expansion.
3. Approximate 1_U from above and below by stable regular-fibre integrals, controlling the null boundary and spectral tails uniformly. The final uniform approximation/Tauberian step is a recorded proof gap in the published sketch.

**Check.** Supply positive upper and lower approximants for 1_U and control tails before removing the null boundary. Restrict the assertion to complex groups viewed as real groups.

**Named proof obligations.** [G12](#g12).

**Atlas planets.** Disjoint-spectrum stability, Stable fibres are torsors, Stable fibre volume compatibility, Stable orbital disintegration.

<a id="qo-6"></a>

## QO.6. Stable relative trace asymptotics

Expand the relative character uniformly on compact stable symbol support. Prove small, intermediate and large group-element estimates for the diagonal subgroup model and the product-symbol version, retaining all powers h^j and uniform seminorm bounds.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.5`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.1`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.4`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`.

**Layer acceptance.** Retain h^j in all terms and h^dim(S) in the narrow-symbol mass. Integrate every intermediate and huge-range error before declaring it negligible.

<a id="qo-6-diagonal-reduction"></a>

### Diagonal subgroup reduction — QO.6/diagonal-reduction

**Theorem.** For M=G times H, S=diagonal H and tau=Pi tensor conjugate(sigma), stable relative characters reduce to L(T)=integral_S tr(tau(s)T)ds. Fatten a stable g*-symbol by a compact symbol on s* equal to one near zero; the mixed calculus gives a compact S-stable m*-symbol. The identification s-perp={(xi,-xi|h)} identifies h O_tau intersect s-perp with h O_(Pi,sigma), preserving the transported Haar measure and inducing differential operators of the same homogeneity and no larger order.

**Dependencies.** [QO.1/operator-calculus](#qo-1-operator-calculus), [QO.4/relative-character](#qo-4-relative-character), [QO.5/stable-disintegration](#qo-5-stable-disintegration), [QO.2/dual-characters](#qo-2-dual-characters), [QO.5/relative-fibres](#qo-5-relative-fibres).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §19.4, equations (19.12)–(19.15), pp. 126–128.

**Proof route.**

1. Insert the auxiliary quantization using Haar invariance; its scalar is 1+O(h-infinity).
2. Use g+s=m and the mixed proper-subalgebra calculus, with both symbols Schwartz.
3. Choose auxiliary support small enough that openness of stability preserves the stable support.
4. Use the contragredient orbit sign and the fixed fibre forms to identify the orbital measures.

**Check.** Check the second orbit is -O_sigma and the moment equation is xi|h+eta=0. For the mixed calculus both input symbols are Schwartz and the small fattening preserves stable support.

<a id="qo-6-small-elements"></a>

### Small-element relative trace expansion — QO.6/small-elements

**Theorem.** For a compact S-stable symbol support in m*, delta<delta-prime<1/2 and a fixed cutoff Theta=1 near zero in s, the integral Theta(y/h^delta-prime) j_S(y) tr(tau(exp y)Op_h(a))dy equals sum_(j<J)h^j integral_(h O_tau intersect s-perp) D_j a + O(h^((1-2delta)J)). Here D_0=id, order D_j<=2j and D_j(a_h)=h^j(D_j a)_h. The auxiliary narrow symbol b has total mass h^dim(S), which cancels h^-d_M since d_M=dim(S); it does not have mass one.

**Dependencies.** [QO.6/diagonal-reduction](#qo-6-diagonal-reduction), [QO.3/refined-trace](#qo-3-refined-trace), [QO.5/stable-disintegration](#qo-5-stable-disintegration), [QO.1/mixed-symbol-calculus](#qo-1-mixed-symbol-calculus).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 19.5, equations (19.18)–(19.23), pp. 129–131.

**Proof route.**

1. Represent the small-element integral as a trace with a symbol in h^(delta-prime dim S) S_(1-delta-prime)^-infinity.
2. Apply the mixed calculus, since delta+(1-delta-prime)<1, then the uniform orbit trace expansion.
3. Disintegrate over the moment map; integrate the narrow symbol and its moments with the h^dim(S) factor retained.
4. Expand the Jacobian factor and collect homogeneous differential operators with the stated order bounds.

**Check.** Directly integrate the auxiliary b after its change of variables: its mass is h^dim(S). Show it cancels the trace prefactor because d_M=dim(S), and retain h^j on every term.

<a id="qo-6-far-elements"></a>

### Intermediate and large-element decay — QO.6/far-elements

**Theorem.** Outside a sufficiently small identity neighborhood of radius h^(1/2-eta), with eta>0 chosen in the proof, the diagonal-subgroup integral of tr(tau(s)Op_h(a)) over compact stable support is h-infinity. In the moderate Ad(s) range this follows from stable support separation and near covariance; for larger Ad(s), one-parameter averaging and oscillation give rapid trace decay; in the huge range the Xi bound and negative Sobolev trace estimates make the integrated tail negligible.

**Dependencies.** [QO.6/diagonal-reduction](#qo-6-diagonal-reduction), [QO.1/cutoff-covariance](#qo-1-cutoff-covariance), [QO.1/operator-calculus](#qo-1-operator-calculus), [QO.5/stable-properness](#qo-5-stable-properness), [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals), [QO.4/uniform-k-types](#qo-4-uniform-k-types).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§19.6–19.7, equations (19.25)–(19.27), pp. 131–135.

**Proof route.**

1. Use free stable action and uniform properness to separate a compact stable support from its translate when s is away from identity.
2. For moderate Ad(s) compose with translated support and apply near covariance and disjoint-support smoothing.
3. Beyond near-covariance control, insert a one-parameter convolution in an expanding direction and integrate by parts.
4. Choose a large polynomial cutoff in the group norm; bound the remaining tail by Xi_G Xi_H integrability with arbitrary algebraic decay and the smoothing trace estimate.

**Check.** Bound the integrated intermediate and huge tails, not only each integrand. Apply the small-element computation to the complementary <= region of the identity cutoff.

<a id="qo-6-relative-expansion"></a>

### Stable relative character expansion — QO.6/relative-expansion

**Theorem.** For compact U in the H-stable locus, 0<=delta<1/2, a in S_delta^-infinity supported in U, and arbitrary h-dependent tempered Pi,sigma, H_sigma(Op_h(a))=sum_(j<J)h^j integral_(h O_(Pi,sigma))D_j a + O(h^((1-2delta)J)). D_0=id, order D_j<=2j and D_j(a_h)=h^j(D_j a)_h. Each error is bounded by C(U,delta) times a finite continuous symbol seminorm depending on J; all bounds are uniform in Pi,sigma. A nonempty stable fibre has the fixed Haar measure, otherwise its integral is zero. For k factors, the leading term is the fibre integral of their pointwise product with O(h^(1-2delta)) error, and the full expansion follows by composition.

**Dependencies.** [QO.6/small-elements](#qo-6-small-elements), [QO.6/far-elements](#qo-6-far-elements), [QO.4/relative-disintegration](#qo-4-relative-disintegration), [QO.1/operator-calculus](#qo-1-operator-calculus).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 19.3, equations (19.7)–(19.11), pp. 125–126; corrected Theorem 19.4, p. 128.

**Proof route.**

1. Use joint spectral localization to restrict to a compact stable parameter range.
2. Apply the diagonal reduction, add the small-element main term and the intermediate/large negligible terms.
3. Transport the resulting D_j back to g*, retaining h^j in every term.
4. For products choose enough composition terms to absorb the functional polynomial loss, then apply the single-symbol expansion.

**Check.** At J=1 recover the unscaled stable Haar integral with O(h^(1-2delta)). At J=2 the correction carries h, and every coefficient has derivative order at most 2j and homogeneous degree j.

**Atlas planets.** Small-element relative trace expansion, Stable relative character expansion.

<a id="qo-7"></a>

## QO.7. Positive inverse branching

Construct positive archimedean inverse branching tests, including the small-mass nontempered error and positive Weyl-law tests. Define p-adic l-components and allowable weights; prove cuspidal-type allowability using uniform distinction and central approximation.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.6`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.3a`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.5`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.4`.

**Layer acceptance.** Check both finite-rank and Hecke positive approximation clauses on the whole unitary dual. Keep finite-to-one l-parameters and the two different error masses distinct.

<a id="qo-7-orbit-distinction"></a>

### Orbit distinction and spectral weights — QO.7/orbit-distinction

**Definition.** For tempered Pi,sigma, orbit distinction means O_Pi intersect res^-1(O_sigma) is nonempty. Given a family with nonempty regular limit O and k>=0 in compactly supported smooth functions on [h*] intersect image(O_stable), set k_h(sigma)=k(h lambda_sigma) on tempered orbit-distinguished sigma and zero on all other unitary sigma. Choose precompact U,V with V stable, supp k inside image(V), closure image(V) inside U and closure U inside image(O_stable). Orbit distinction is a geometric condition, distinct from Hom_H(Pi,sigma) nonvanishing.

**Dependencies.** [QO.6/relative-expansion](#qo-6-relative-expansion), [QO.3/orbit-topology](#qo-3-orbit-topology), [QO.5/stable-torsor](#qo-5-stable-torsor).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §22.2 and equations (22.1)–(22.4), pp. 145–146.

**API.**

- **orbitDistinguished** (characterisation): The predicate is the stated geometric nonempty intersection.
- **spectralWeightTempered** (simp): On tempered orbit-distinguished sigma the weight is k(h lambda_sigma).
- **spectralWeightZero** (simp): On nontempered or non-orbit-distinguished sigma the weight is zero.
- **spectralWeightSupport** (relation): Nonzero weight forces h lambda_sigma in supp k.
- **distinctionFromOrbit** (compatibility): In a fixed compact stable region and for small h, orbit distinction implies a nonzero H-equivariant map.

**Unit tests.**

- **emptyIntersection** (degenerate): A tempered sigma with disjoint orbit restriction has zero weight even when k(h lambda_sigma)>0.
- **nontemperedParameter** (non-example): A nontempered sigma with parameter in supp k still has zero weight.
- **stablePositiveFibre** (computation): A tempered sigma with a nonempty stable fibre and k(h lambda_sigma)=2 has weight 2.
- **homNotDefinition** (non-example): Replacing the orbit predicate by Hom nonvanishing would assert a converse that is not supplied here.

**Uses.** QO.7 inverse branching: Specifies precisely the target weight. QO.9 weighted asymptotic: Determines the geometric restriction on the summation family.

**Construction route.**

1. Define the orbit intersection using the supplied irreducible orbit parameters.
2. Use the stable principal-bundle image, openness and compact support to choose nested neighborhoods.
3. Use the stable relative expansion with a positive bump to obtain orbit distinction implies distinction uniformly in the compact parameter region for small h; no converse is built into the definition.

**Check.** Verify every listed API law and run the discriminating examples below, including: Replacing the orbit predicate by Hom nonvanishing would assert a converse that is not supplied here.

<a id="qo-7-arch-inverse"></a>

### Positive archimedean inverse branching — QO.7/arch-inverse

**Theorem.** Under the limit-orbit and nested stable-support conditions above, for epsilon>0 and integer N>=0 choose nonnegative a,a1,a2,a_nt in Cc-infinity(V). The O-integral of a1^2 is bounded in terms of k,V; those of a2^2 and a_nt^2 are <=epsilon; |integral k-integral_O a^2|<=epsilon. For small h and tempered orbit-distinguished sigma with h lambda_sigma in U, |k_h(sigma)|<=|H_sigma(Op_h(a1)^2)| and |k_h(sigma)-H_sigma(Op_h(a)^2)|<=|H_sigma(Op_h(a2)^2)|+O(h^N). For nontempered sigma in U, H_sigma(Op_h(a)^2)=H_sigma(Op_h(a_nt)^2)+O(h^N), assuming the h-uniform H times H-equivariant smoothing factorization in (22.8).

**Dependencies.** [QO.7/orbit-distinction](#qo-7-orbit-distinction), [QO.6/relative-expansion](#qo-6-relative-expansion), [QO.5/stable-disintegration](#qo-5-stable-disintegration), [QO.2/tempered-criterion](#qo-2-tempered-criterion), [QO.2/joint-localization](#qo-2-joint-localization).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 22.2, pp. 146–148; corrected (22.10).

**Proof route.**

1. Use a partition of unity on the stable torsor bundle to lift k to squared nonnegative symbols.
2. Choose a2 with a strictly positive fibre integral over a compact neighborhood of the full image of supp a, while keeping its total mass small; use the relative expansion and spectral localization outside that neighborhood.
3. Choose a_nt agreeing with a near the irregular H-parameter locus, whose orbital measure is zero.
4. Apply the temperedness criterion away from that locus and joint localization to the difference, including the functional seminorm loss.

**Check.** Choose a2 with positive fibre mass on a compact neighborhood of the image of supp a. Outside it retain O(h^N); verify both small total error masses and the nontempered factorization normalization.

<a id="qo-7-weyl-positive-tests"></a>

### Positive Weyl-law test functions — QO.7/weyl-positive-tests

**Theorem.** For k and U as above, epsilon>0 and N>=0, for small h there are positive-definite compactly supported smooth Hecke functions f,f1 on H, supported in a neighborhood shrinking to identity, with |integral k-h^d f(1)|<=epsilon, h^d f1(1)<=epsilon, and |k_h(sigma)-tr sigma(f)|<=tr sigma(f1)+O(h^N<h lambda_sigma>^-N) for every unitary sigma. Here d=half the regular G-orbit dimension as in the limit-orbit setup.

**Dependencies.** [QO.7/arch-inverse](#qo-7-arch-inverse), [QO.6/small-elements](#qo-6-small-elements), [QO.6/far-elements](#qo-6-far-elements), [QO.3/refined-trace](#qo-3-refined-trace).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 22.4 and its proof, pp. 148–151.

**Proof route.**

1. Start from the positive operator Op_h(a)^2 and its restricted coefficient.
2. Truncate by a convolution-square construction to preserve positive definiteness, with support tending to identity.
3. Use the small/far-element analysis and joint localization to control the truncation for tempered and nontempered representations.
4. Use the orbit trace expansion at identity to normalize f and the small-error test f1.

**Check.** Use convolution squares to preserve positivity after truncation. Verify h^d f(1) has the affine mass and test the all-unitary spectral error, including complementary series.

<a id="qo-7-good-level-invariants"></a>

### Good-level invariant-vector criterion — QO.7/good-level-invariants

**Theorem.** Let J be a good compact open subgroup normal in K and admitting the required Iwahori factorizations for standard parabolics. For a standard Levi M and irreducible supercuspidal tau of M, tau^(J intersect M) is nonzero iff normalized induction Ind_P^H(tau) has J-fixed vectors, iff some irreducible constituent does, iff every irreducible constituent does. The last assertion uses the Jacquet-module lifting theorem, not exactness of invariants alone.

**Dependencies.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.3a`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 23.2, pp. 153–154; §§23.1–23.3, pp. 152–154.

**Proof route.**

1. Use Iwahori factorization to realize induced J-fixed vectors from Levi fixed vectors.
2. Apply Casselman lifting to compare Jacquet invariants of each constituent at a good level.
3. Use the common supercuspidal support and normality of J in K to obtain both implications for every constituent.

**Check.** Verify the every-constituent implication using Jacquet lifting at a good level. Ordinary compact openness and exactness of fixed vectors cannot replace the simultaneous Iwahori hypotheses.

**Named proof obligations.** [G13](#g13).

<a id="qo-7-l-components"></a>

### Tempered l-components — QO.7/l-components

**Definition.** For a p-adic reductive H let l send a tempered irreducible sigma to the conjugacy class of its square-integrable inducing pair (M,tau). The parameter space, not the full tempered dual, is the disjoint union of l-components D: compact finite quotients of the unitary unramified-twist tori for fixed inducing data. The map l can have multiple constituents in one fibre; it is generically injective. There are countably many D and finitely many visible at a fixed good J. For fixed tempered Pi the GGP-distinguished locus Omega maps injectively under l, its image is a union of components, and Omega carries the transported disjoint-union topology. Its J-visible part is compact. Different D can have overlapping images in the Bernstein centre; the transported topology is not asserted equal to the Fell topology.

**Dependencies.** `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.3a`, [QO.7/good-level-invariants](#qo-7-good-level-invariants), [QO.4/relative-character](#qo-4-relative-character).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§23.7–23.8, pp. 156–157; Lemmas 24.1–24.2 and §24.2, pp. 157–159.

**API.**

- **lComponentParameter** (constructor): Each component of the inducing-pair parameter space is its compact unitary torus quotient; l from the full tempered dual is allowed finite fibres.
- **lComponentFixedLevel** (characterisation): Only finitely many l-components contain a J-fixed representation for a fixed good J.
- **lComponentTopology** (structure): Each inducing-parameter component is clopen; the distinguished locus uses the topology transported along its injective l map.
- **distinguishedComponentInjection** (relation): The distinguished sigma is uniquely determined by its l-component parameter in the stated GGP setting.
- **distinguishedJCompact** (structure): The distinguished J-visible locus is compact in the l-topology.

**Unit tests.**

- **splitTorus** (computation): For F^times a fixed inertial class gives a unitary unramified circle, not the full complex unramified torus.
- **reducibleInduction** (non-example): At a reducible induced tempered representation, several irreducible constituents can map to the same l-parameter; they must not be identified as one representation.
- **fixedLevelFinite** (compatibility): For a fixed good J only finitely many inertial unitary families survive; their unramified circles still contain infinitely many representations.

**Uses.** QO.7 allowable weights: Provides the compact parameter domains supporting continuous weights. QO.9 auxiliary weights: Specifies the finite-level p-adic weight class in the global theorem.

**Construction route.**

1. Import the tempered inducing classification, finite R-group constituent data and unitary unramified-twist quotient.
2. Use uniform admissibility and the good-level invariant criterion for fixed-J finiteness.
3. Use supplied GGP strong multiplicity one and continuity of relative characters to prove injectivity and clopen distinguished image.

**Check.** Verify every listed API law and run the discriminating examples below, including: For a fixed good J only finitely many inertial unitary families survive; their unramified circles still contain infinitely many representations.

**Named proof obligations.** [G8](#g8), [G14](#g14).

<a id="qo-7-allowable-weights"></a>

### Allowable components and weights — QO.7/allowable-weights

**Definition.** Fix tempered Pi over a nonarchimedean local field and a distinguished l-component D. It is allowable if some good J works for every nonnegative continuous k on D, extended by zero to the entire unitary dual: for every epsilon>0 there are positive finite-rank smooth T,T_plus from J-fixed Pi vectors with tr T_plus<=epsilon and |k(sigma)-H_sigma(T)|<=H_sigma(T_plus) for all unitary sigma; and bi-J Hecke phi,phi_plus with phi_plus positive, phi_plus(1)<=epsilon and |k(sigma)-tr sigma(phi)|<=tr sigma(phi_plus) for all unitary sigma. An allowable weight has support in finitely many such components, with linear combinations generated by their continuous nonnegative weights. Nontempered H_sigma is normalized by a fixed equivariant map, possibly zero.

**Dependencies.** [QO.7/l-components](#qo-7-l-components), [QO.4/relative-character](#qo-4-relative-character).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Definition 24.3 and §24.2, pp. 159–160; §20, pp. 142–143.

**API.**

- **allowableOperatorApproximation** (characterisation): Every nonnegative continuous weight has the positive finite-rank approximation with arbitrarily small trace error.
- **allowableHeckeApproximation** (characterisation): The same weight has positive Hecke error with arbitrarily small identity value.
- **allowableFiniteSums** (structure): Finite sums of allowable nonnegative weights satisfy both approximation properties after splitting epsilon.
- **allowableNormalization** (compatibility): The chosen H-equivariant maps determine every nontempered term throughout the inequalities.
- **allowableTensorProducts** (functoriality): Finite products over auxiliary places preserve approximation after assigning sufficiently small local errors.

**Unit tests.**

- **zeroWeight** (degenerate): The zero weight is approximated by zero operators and zero Hecke functions with zero error.
- **allUnitaryQuantifier** (non-example): An approximation valid only on the tempered dual does not establish allowability.
- **errorMasses** (non-example): A small operator norm of T_plus is insufficient; its trace must be small, just as phi_plus(1), not its sup norm, is the Hecke error mass.
- **positiveScaling** (computation): Scaling k by c>=0 scales approximants and requires replacing the input error tolerance by epsilon/c when c>0.

**Uses.** QO.7 cuspidal theorem: The two clauses are proved separately. QO.9 period approximation: Positive error masses control global error terms without counting each local representation separately.

**Construction route.**

1. Use the distinguished compact l-component domain and its extension by zero.
2. State the two independent positive approximation requirements with their different error masses.
3. Fix the nontempered normalization before quantifying over all unitary sigma; avoid an implicit normalization depending on the test.

**Check.** Verify every listed API law and run the discriminating examples below, including: Scaling k by c>=0 scales approximants and requires replacing the input error tolerance by epsilon/c when c>0.

<a id="qo-7-central-approximation"></a>

### Uniform distinction and central approximation — QO.7/central-approximation

**Theorem.** On the compact distinguished J-visible unitary set there is a positive finite-rank T0 with H_sigma(T0)>=1 uniformly. For a cuspidal-type l-component, its Bernstein-centre parameter domain Theta has compact unitary part and compact unitary supercuspidal-support locus Theta0. The closure of the nontempered locus meets Theta0 in Haar measure zero. Real regular central functions separate the relevant points; Stone–Weierstrass gives uniform approximations, while central cutoffs can be small in L2 on Theta0 and >=1 on the nontempered locus. Remove Weyl elements acting trivially before using a fixed-point set to prove nullity. Precisely, for every epsilon>0 choose a real regular f with |f|<=2 on Theta_unit, f>=1 on Theta_nt, and integral_(Theta0) f^2<=epsilon for the induced Haar measure; the corresponding Plancherel smallness follows from its bounded continuous density on this compact inducing-parameter set.

**Dependencies.** [QO.7/l-components](#qo-7-l-components), [QO.7/good-level-invariants](#qo-7-good-level-invariants), `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§24.5.1–24.5.3, Lemmas 24.6, 24.8–24.10, pp. 164–167.

**Proof route.**

1. Cover the compact distinguished set by neighborhoods where a positive rank-one relative character is nonzero; sum finitely many tests.
2. Use the real Bernstein-centre involution induced by conjugate duality, and the compactness of the unitary locus.
3. For every effective nontrivial stabilizer the fixed subtorus has smaller Haar dimension; there are finitely many stabilizers.
4. Apply real Stone–Weierstrass and a small-neighborhood cutoff around this null intersection. No explicit Laurent polynomial from the printed example is needed.

**Check.** For the PGL2 unramified test include both complementary intervals and unitary endpoints. Remove ineffective Weyl elements before applying lower-dimensional fixed-subtorus nullity.

**Named proof obligations.** [G8](#g8), [G14](#g14).

<a id="qo-7-cuspidal-allowability"></a>

### Cuspidal-type allowability — QO.7/cuspidal-allowability

**Theorem.** Every distinguished l-component whose inducing square-integrable datum is supercuspidal is allowable in both the positive finite-rank and Hecke senses. The theorem is not extended to arbitrary noncuspidal l-components. The approximations hold on the whole unitary dual, including the complementary series.

**Dependencies.** [QO.7/central-approximation](#qo-7-central-approximation), [QO.7/allowable-weights](#qo-7-allowable-weights), [QO.4/padic-plancherel](#qo-4-padic-plancherel), `SmoothRepresentationsOfLocalGroups:SR.3a`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 24.5 and §§24.4–24.5.3, pp. 160–167.

**Proof route.**

1. Use uniform distinction and central approximation to approximate k on the compact component and annihilate the other supercuspidal supports.
2. Square central multipliers and sandwich the finite-rank tests; use the small L2 cutoff near the nontempered boundary to make the error trace small.
3. For the Hecke clause truncate the matrix coefficient, add a small fixed-level idempotent error on tempered representations, and use uniform admissibility to control ranks.
4. Handle all nontempered representations with |c|<=epsilon^-1|c|^2+epsilon and a central convolution square; choose the auxiliary approximation tolerance after its l1 bound is known.

**Check.** Check both independent approximation clauses on nontempered representations as well as tempered ones. Choose each tolerance after controlling the central multiplier's l1 norm and the fixed-level rank bound.

**Atlas planets.** Orbit distinction and spectral weights, Positive archimedean inverse branching, Positive Weyl-law test functions, Tempered l-components, Allowable components and weights, Cuspidal allowability.

<a id="qo-8"></a>

## QO.8. Limit states and arithmetic equidistribution

Construct smooth positive limit states on compact adelic quotients and their equivariant disintegration over a regular nilpotent orbit. Prove centralizer rigidity, measure classification reductions and component comparisons, then equidistribution with the SO3/SO2 self-twist exclusion.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.7`, `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`, `AutomorphicSpectralTheory:AS.0/trace-class`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.1`, `AutomorphicSpectralTheory:AS.0/vector-schwartz`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `LieHighestWeightPartII:N0/jacobson-morozov`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`.

**Layer acceptance.** Use one subsequence for all symbol tuples at fixed auxiliary level. Construct probability conditional measures pointwise, justify full-centralizer invariance, and keep the exceptional binary self-twist hypothesis.

<a id="qo-8-operator-state"></a>

### Smooth operator states — QO.8/operator-state

**Construction.** Let X=Gamma backslash (G times G-prime) be compact, with an isometric irreducible unitary embedding Pi tensor Pi-prime into L2(X), with scalar unitary adelic central character. Fix a smooth positive finite-rank auxiliary T-prime of trace one, at one fixed finite level in the totally disconnected factors. Define [T] as the diagonal of the kernel T tensor T-prime. It extends from finite-rank smooth T to smoothly trace-class operators, continuously and G-equivariantly into C-infinity(X), with ||[T]||_L1<=||T||_1, integral_X[T]=tr T, positivity preservation and invariance under the adelic center.

**Dependencies.** [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals), `AdelicAlgebraicGroups:AA.3`, `AutomorphicSpectralTheory:AS.0/trace-class`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§26.1–26.3 and Lemma 26.2, pp. 172–176.

**API.**

- **operatorStateRankOne** (data): A rank-one kernel has diagonal u1(x) conjugate(u2(x)) after auxiliary embedding.
- **operatorStateTrace** (compatibility): The integral of [T] is tr T because tr T-prime=1.
- **operatorStatePositive** (structure): Positive T gives a nonnegative function.
- **operatorStateSobolev** (structure): Each C-infinity seminorm is bounded by finitely many smooth trace-ideal seminorms, uniformly in Pi.
- **operatorStateCentre** (functoriality): The scalar central character and its conjugate cancel on the diagonal.

**Unit tests.**

- **rankOneMass** (computation): For unit vectors v,w and T=v tensor conjugate(v), T-prime=w tensor conjugate(w), the state is the embedded |v tensor w|^2 and has mass one.
- **auxiliaryNormalization** (non-example): Auxiliary trace c gives mass c tr T; the trace-one condition cannot be omitted.
- **positivityNotLinearity** (compatibility): The diagonal map is linear in T but its value on v tensor conjugate(v) is quadratic in v.
- **fixedLevelCompactness** (non-example): Letting p-adic levels vary arbitrarily does not give the fixed-level smooth compactness used here.

**Uses.** QO.8 limit states: Transfers uniform trace calculus into smooth functions on X. QO.9 period Parseval: Restriction of this diagonal to [H] is the total period mass.

**Construction route.**

1. For rank-one tensors the diagonal is the product of the two embedded automorphic vectors; sum the fixed positive auxiliary decomposition.
2. Use Cauchy–Schwarz and the isometric embedding for the L1 trace-norm bound.
3. Apply Sobolev embedding on the compact quotient, after fixing the auxiliary finite level, to extend all derivatives; integrate rank-one diagonals for trace and use the central character to cancel the center action.

**Check.** Verify every listed API law and run the discriminating examples below, including: Letting p-adic levels vary arbitrarily does not give the fixed-level smooth compactness used here.

<a id="qo-8-limit-state"></a>

### Semiclassical limit states — QO.8/limit-state

**Construction.** For a sequence h tending to zero with regular multiorbit limit O, set [a1,...,ak]_h=h^d[Op_h(a1)...Op_h(ak)], d=half the maximal real coadjoint-orbit dimension of G, including for the empty multiorbit. Along one subsequence, simultaneously for every k and Schwartz tuple, these converge in the fixed-level C-infinity topology to a continuous multilinear map equal to [a1...ak]. The resulting one-symbol map is linear, positive, G-equivariant and satisfies integral_X[a]=integral_O a. The k-variable maps are multilinear, not linear maps out of a Cartesian product.

**Dependencies.** [QO.8/operator-state](#qo-8-operator-state), [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals), [QO.3/orbit-topology](#qo-3-orbit-topology), [QO.1/cutoff-covariance](#qo-1-cutoff-covariance).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 26.4 and Lemma 26.3, pp. 176–178.

**API.**

- **limitStateContinuity** (structure): Each output C-infinity seminorm is controlled by a product of finitely many Schwartz seminorms.
- **limitStateProducts** (compatibility): The tuple limit equals the one-symbol limit of the pointwise product.
- **limitStatePositive** (structure): Nonnegative symbols give nonnegative functions.
- **limitStateEquivariance** (functoriality): The G action on symbols agrees with translation of the output state.
- **limitStateMass** (compatibility): Integrating the state over X gives the KKS orbit integral.

**Unit tests.**

- **zeroOrbitMarginal** (degenerate): If the limiting multiorbit is empty, positivity and zero total mass force every state to vanish.
- **twoSymbols** (compatibility): [a,conj a] is nonnegative and equals [|a|^2], not the product [a] conjugate([a]).
- **normalizationPower** (computation): For a fixed compact symbol with nonzero orbit integral, h^d tr Op_h(a) has a finite nonzero limit; using h^(2d) would lose this mass.
- **subsequenceCommon** (non-example): A separate subsequence for each symbol does not define a single linear limit-state map.

**Uses.** QO.8 disintegration: Provides the positive kernel with fixed orbit marginal. QO.9 truncation: Supplies the limiting left side of the microlocal period expansion.

**Construction route.**

1. Use uniform smooth trace-ideal bounds and the operator-state continuity to bound all C-infinity seminorms.
2. At fixed auxiliary level, bounded C-infinity subsets on the compact manifold quotient are precompact; use a countable dense Schwartz set and a diagonal subsequence over k.
3. Extend by the uniform multilinear bounds. The O(h) trace-ideal product estimate identifies all products with [a1...ak].
4. Use adjoint quantization and approximation by sums of squared Schwartz functions for positivity, near covariance for equivariance, and orbit trace limits for mass.

**Check.** Verify every listed API law and run the discriminating examples below, including: A separate subsequence for each symbol does not define a single linear limit-state map.

<a id="qo-8-state-disintegration"></a>

### Equivariant disintegration of limit states — QO.8/state-disintegration

**Theorem.** For the limit-state map there is a weakly continuous G-equivariant assignment xi in O to a probability measure delta_xi on X such that integral_X[a]Psi=integral_O a(xi)delta_xi(Psi)domega for compactly supported smooth a and continuous Psi. Each delta_xi is invariant under the full G-centralizer of xi and the adelic center. This is an assignment on an orbit, not a linear map from O.

**Dependencies.** [QO.8/limit-state](#qo-8-limit-state), [QO.3/orbital-radon](#qo-3-orbital-radon), `mathlib:RealRMK.integral_rieszMeasure`, `AutomorphicSpectralTheory:AS.0/vector-schwartz`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 26.5 and (26.8)–(26.12), pp. 178–179.

**Proof route.**

1. Use the supplied Schwartz-kernel theorem for the bilinear functional (a,Psi) to integral_X[a]Psi. Prove positivity on general nonnegative product-space tests by positive partition approximation, not just pure tensors.
2. Apply Riesz representation and identify the phase-space marginal as omega_O from the mass identity.
3. Radon–Nikodym gives f_Psi in L-infinity(O) with ||f_Psi||<=||Psi||_infinity; convolution in G and openness of each regular orbit in the multiorbit give continuous representatives.
4. Evaluate these positive norm-one functionals at each xi and apply Riesz again. Equivariance gives centralizer invariance; central invariance passes from the operator state.

**Check.** Verify positivity on general compactly supported nonnegative tests on the product, not only pure tensors. Identify the orbit marginal, construct continuous conditional representatives, and check full centralizer invariance and probability mass one at every orbit point.

**Named proof obligations.** [G15](#g15).

<a id="qo-8-regular-nilpotent-rigidity"></a>

### Regular nilpotent centralizer rigidity — QO.8/regular-nilpotent-rigidity

**Theorem.** For quasi-split real reductive G, a nilpotent in the nilradical of a Borel is regular if and only if all its simple-root components are nonzero. If S is a connected reductive algebraic subgroup with Lie(S) containing the full Lie centralizer g_xi of a regular nilpotent xi, then S=G. Containment of only one unipotent direction would not suffice. The full Lie centralizer of a regular nilpotent is abelian of dimension rank(G), with the reductive centre included.

**Dependencies.** [QO.3/orbital-measure](#qo-3-orbital-measure), `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad`, `LieHighestWeightPartII:N0/jacobson-morozov`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 27.5 and Lemma 27.12, pp. 183, 186.

**Proof route.**

1. Use the supplied Kostant regular-nilpotent/Jacobson–Morozov theory to put xi in a Borel with all simple-root components nonzero.
2. The full centralizer condition forces equal rank and includes the center; choose a compatible Cartan and positive root system for S.
3. Compare simple-root components and the regular centralizer dimension to force every root direction of G into S, whence S=G.

**Check.** Use the full Lie centralizer, including the central directions, to prove equal rank. Test that containment of one regular nilpotent vector alone would admit a proper principal SL2 subgroup in higher rank.

**Named proof obligations.** [G16](#g16).

<a id="qo-8-real-algebraic-connectedness"></a>

### Cartan connectedness for algebraic groups — QO.8/real-algebraic-connectedness

**Theorem.** If G_sc is a simply connected semisimple algebraic group over R, G_sc(R) is connected in its real Lie topology; the complex analogue holds as well. Thus the image of G_sc at the archimedean factors is contained in, and supplies the derived part of, the identity component. Algebraic simple connectedness is the hypothesis, distinct from the universal-cover construction for Lie groups.

**Dependencies.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Proof of Lemma 27.11, p. 185, citing É. Cartan.

**Proof route.**

1. Supply the algebraic real-group connectedness theorem with its semisimple and simply connected hypotheses.
2. Apply it factorwise at real and complex archimedean places before using strong approximation to identify connected orbits.

**Check.** Check the algebraic simply connected hypothesis before invoking Cartan. SO(2) has a connected real circle but is algebraically outside this semisimple theorem; a Lie universal-cover result is not a proof of it.

**Named proof obligations.** [G17](#g17).

<a id="qo-8-unipotent-invariant-measures"></a>

### Centralizer-invariant measure classification — QO.8/unipotent-invariant-measures

**Theorem.** In the compact adelic quotient of the anisotropic GGP global setup, with G quasi-split at the chosen archimedean q, let xi be regular nilpotent and U generated by exponentials of its Lie centralizer. Every probability measure invariant under U and the adelic center is invariant under G_infinity^+, the identity component of all archimedean points. The fixed finite auxiliary level is retained throughout the reduction to real lattice quotients.

**Dependencies.** [QO.8/regular-nilpotent-rigidity](#qo-8-regular-nilpotent-rigidity), [QO.8/real-algebraic-connectedness](#qo-8-real-algebraic-connectedness), `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 27.7 and Lemmas 27.8–27.11, pp. 183–186.

**Proof route.**

1. At fixed finite level reduce to finitely many compact real lattice quotients and use ergodic decomposition of the U-invariant measure.
2. Apply Ratner measure classification to obtain homogeneous finite-volume support Sx for each ergodic piece.
3. Borel density and anisotropy make the relevant Zariski closure reductive; it contains the full nilpotent centralizer. Apply the centralizer-rigidity theorem.
4. Use the normal Lie-ideal argument, Cartan connectedness and strong approximation of each noncompact simply connected factor to pass from the q factor to G_infinity^+.

**Check.** At each ergodic piece justify the lattice-quotient Ratner hypotheses and reductivity of the Zariski closure. Use central invariance when reducing reductive groups to semisimple factors.

**Named proof obligations.** [G18](#g18).

<a id="qo-8-component-comparison"></a>

### Spinor and determinant component comparison — QO.8/component-comparison

**Theorem.** In the anisotropic orthogonal/unitary GGP setup, the quotient by G(F)G_infinity^+ and a fixed compact open level is finite abelian and all connected-component orbits have equal measure. For unitary groups, determinant identifies the local quotient by the simply connected derived image with the norm-one scalar group, and H maps onto it by acting on an anisotropic line. For orthogonal groups use the existing spinor norm and Spin-kernel theorem, plus the current OrthogonalSpinGroups local-image tables; the binary H image is a norm subgroup rather than automatically all square classes. In the SO3/SO2 case the remaining index-two character is chi=eta_(K/F) composed with spinor norm, K=F(sqrt(-disc V_H)).

**Dependencies.** `AdelicAlgebraicGroups:AA.4`, `tauceti:CliffordAlgebra.spinorNorm`, `tauceti:CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`, [QO.8/real-algebraic-connectedness](#qo-8-real-algebraic-connectedness).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 27.3, Lemma 27.4 and their proofs, pp. 181–183.

**Proof route.**

1. Strong approximation gives a finite abelian component quotient; conjugate compact open levels have the same quotient image, giving equal orbit measures.
2. For U(V), realize every norm-one determinant on a nondegenerate line in H and identify the kernel with the SU image using local cohomology.
3. For SO(V), import the pinned spinor kernel and upstream local-image tables; the higher-dimensional rational-image step uses the exact global spinor-image theorem, not local surjectivity alone.
4. In binary H identify the norm subgroup and its quadratic annihilator. Orthogonality to chi follows from inequivalence of Pi and Pi tensor chi.

**Check.** For a definite real quadratic form the spinor image is trivial; for a binary anisotropic form it is a norm subgroup. Verify the quadratic component character is annihilated only with the stated exceptional self-twist exclusion.

**Named proof obligations.** [G19](#g19).

<a id="qo-8-global-equidistribution"></a>

### Arithmetic equidistribution of limit states — QO.8/global-equidistribution

**Theorem.** Let F be a number field, G/H an anisotropic nontrivial unitary U(n+1)/U(n), n>=1, or orthogonal SO(n+1)/SO(n), n>=2, GGP pair, with compact adelic quotients and Tamagawa measures. Fix an automorphic Pi, tempered at the finite set R of relevant places, unramified outside R, quasi-split and generic at the distinguished archimedean q, and compact at all other archimedean factors, as in §25.7. Require good auxiliary levels. If the pair is SO3/SO2 assume Pi is not isomorphic to Pi tensor (eta_(K/F) composed with spinor norm). Then every limit state satisfies tau(H)^-1 integral_[H][a]=tau(G)^-1 integral_[G][a] for every Schwartz a.

**Dependencies.** [QO.8/state-disintegration](#qo-8-state-disintegration), [QO.8/unipotent-invariant-measures](#qo-8-unipotent-invariant-measures), [QO.8/component-comparison](#qo-8-component-comparison), [QO.3/orbital-decay](#qo-3-orbital-decay), `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 27.1, pp. 180–183; §25.7, pp. 171–172; corrected exceptional hypothesis recorded in extraction E1.

**Proof route.**

1. Fixed generic Pi has a nonempty regular nilpotent orbit limit, and its disintegrated measures are invariant under the regular nilpotent centralizers.
2. Apply the unipotent-invariant measure theorem to obtain identity-component invariance.
3. Apply the determinant/spinor component comparison and, in the exceptional binary case, the self-twist exclusion to equate normalized H and G averages.
4. Integrate the disintegration over the phase-space orbit.

**Check.** Check q-genericity gives a nonempty regular nilpotent limit, and all auxiliary factors retain their fixed level. Normalize both averages by their own Tamagawa mass and keep the SO3/SO2 exclusion.

**Atlas planets.** Smooth operator states, Semiclassical limit states, Equivariant disintegration of limit states, Regular nilpotent centralizer rigidity, Centralizer-invariant measure classification, Arithmetic equidistribution of limit states.

<a id="qo-9"></a>

## QO.9. Truncated periods and weighted asymptotics

Combine positive period Parseval, a polynomial weak Weyl bound and microlocal spectral truncation with inverse branching and equidistribution. Obtain the smoothly weighted GGP period-constant asymptotic under the corrected global hypotheses; the final refined L-value theorem belongs to its separate roadmap.

**Inputs.** `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.8`, `AutomorphicSpectralTheory:AS.4`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.4`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.2`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.3`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.7`, `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups:QO.5`.

**Layer acceptance.** Control bad spectral families by summable estimates and positive majorants. Verify stable support selection, spectral multiplicity, the order of epsilon and h limits, and the exact Tamagawa ratio.

<a id="qo-9-period-functional"></a>

### Positive period functional and local factors — QO.9/period-functional

**Definition.** For the fixed automorphic Pi and auxiliary T-prime, define P_Sigma on a positive finite-rank smooth T by the squared norm of the Sigma-isotypic projection of the restriction of each rank-one automorphic vector to [H], extended linearly to T. Sum over the discrete automorphic decomposition with multiplicity. When the supplied GGP period factorization is nonzero and normalized, define L(Pi,Sigma) by P_Sigma(T)=L(Pi,Sigma) H_sigma(T)H_sigma-prime(T-prime). The factorization and its local nonvanishing are supplier inputs, not consequences of this definition.

**Dependencies.** [QO.8/operator-state](#qo-8-operator-state), [QO.4/relative-character](#qo-4-relative-character), `AutomorphicSpectralTheory:AS.4`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §§28.1–28.3 and (28.1)–(28.6), pp. 187–189.

**API.**

- **periodRankOne** (data): For v tensor conjugate(v), P_Sigma is the squared Sigma-projection norm of the restricted automorphic vector.
- **periodPositive** (structure): P_Sigma(T)>=0 for positive T.
- **periodLinearity** (structure): The functional extends by polarization and is linear in the smooth finite-rank operator.
- **periodFactorization** (compatibility): With the supplied normalization P_Sigma equals L times the two local relative characters.
- **periodMultiplicity** (compatibility): Repeated automorphic constituents are counted with their spectral multiplicities.

**Unit tests.**

- **orthogonalProjectionZero** (computation): If the restriction is orthogonal to Sigma then the rank-one period is zero.
- **rankOneScaling** (computation): Replacing v by c v multiplies its period by |c|^2, not c.
- **spectralMultiplicity** (non-example): Two orthogonal copies of Sigma contribute the sum of their squared projections; selecting one copy loses mass.
- **localVanishing** (non-example): If all relevant local factors vanish, the displayed factorization does not uniquely define a scalar L.

**Uses.** QO.9 Parseval: Decomposes the restriction mass into nonnegative summands. QO.9 main theorem: Connects positive operator approximation with the weighted period constants.

**Construction route.**

1. Use the supplied compact-quotient smooth restriction and orthogonal spectral projections to define the rank-one period norm.
2. Polarize and extend linearly through the smooth finite-rank kernel; positivity makes the definition independent of its decomposition.
3. Import the multiplicity-one local-to-global period factorization to identify the scalar, only where its local factors give uniqueness.

**Check.** Verify every listed API law and run the discriminating examples below, including: If all relevant local factors vanish, the displayed factorization does not uniquely define a scalar L.

**Named proof obligations.** [G8](#g8).

<a id="qo-9-period-parseval"></a>

### Smooth period Parseval and weak Weyl bound — QO.9/period-parseval

**Theorem.** For a smoothing operator T in Psi-minus-infinity, integral_[H][T]=sum_Sigma P_Sigma(T), with absolute convergence and compatibility with smooth differentiation at the fixed auxiliary level. The number of Sigma contributing nonzero periods with |lambda_sigma|<=x is O((1+x)^C) for a group- and level-dependent C. Positivity gives monotone summation for positive T; general smoothing T uses the smooth two-variable kernel and its spectral expansion.

**Dependencies.** [QO.9/period-functional](#qo-9-period-functional), [QO.8/operator-state](#qo-8-operator-state), `AutomorphicSpectralTheory:AS.4`.

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), §28.1, equation (28.3), p. 187; §29.2 and equation (29.2), p. 190.

**Proof route.**

1. Use compact-quotient automorphic spectral decomposition, elliptic Sobolev bounds and a polynomial eigenvalue-counting estimate supplied by AS.4.
2. Apply Parseval to each rank-one restricted vector and then sum the auxiliary finite family.
3. Use the smooth two-variable kernel supplied for Psi-minus-infinity and sufficiently high elliptic Sobolev powers to dominate its spectral tail uniformly, extending from finite rank to smoothing operators. Smoothness of only the diagonal for a smoothly trace-class operator is not this kernel assertion.

**Check.** Count spectral multiplicity and prove the polynomial bound at the fixed auxiliary level. For positive finite-rank T compare directly with Parseval on each restricted vector before extending by trace estimates.

<a id="qo-9-spectral-truncation"></a>

### Microlocal period truncation — QO.9/spectral-truncation

**Theorem.** Let W be an open subset of h* and U an open quotient subset containing its parameter image as in §29. Let all compactly supported symbols lie over W. Call sigma good if h lambda_sigma lies in U and either sigma is nontempered or h O_sigma meets W. Then integral_[H][a1...ak]=lim_(h to 0) h^d sum_(Sigma with good sigma) P_Sigma(Op_h(a1)...Op_h(ak)). The sum includes multiplicity and the fixed auxiliary factor. Discarded large-parameter terms and tempered orbit-missing terms each have vanishing total contribution.

**Dependencies.** [QO.9/period-parseval](#qo-9-period-parseval), [QO.2/joint-localization](#qo-2-joint-localization), [QO.3/refined-trace](#qo-3-refined-trace), [QO.8/limit-state](#qo-8-limit-state).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 29.1 and §§29.2–29.4, pp. 190–193.

**Proof route.**

1. Choose a relatively compact open U0 inside U containing the invariant-parameter image of the projected compact symbol supports. Outside U0, apply joint localization with arbitrarily strong spectral decay and sum using the weak Weyl bound. This first truncation is valid even when the stated U is unbounded.
2. For a tempered orbit missing W choose b=1 on the projected symbol support and supported in W; factor the relative operator through sigma quantizations.
3. Use |tr(T1 T2)|^2<=tr(T1* T1)tr(T2* T2), with the first trace negligible by the orbit trace formula and the second polynomially bounded.
4. Inside U0 the weak Weyl bound gives only polynomially many terms in h^-1. Sum the orbit-missing estimates after choosing the h-gain larger than that exponent and take the limit-state subsequence. The terms in U outside U0 were already controlled by spectral decay.

**Check.** Treat the large-parameter tail and the tempered orbit-missing tail separately. In Hilbert-Schmidt Cauchy-Schwarz the negligible first factor is tr(T1* T1), never tr(T1* T2).

<a id="qo-9-stable-neighborhoods"></a>

### Stable neighborhoods for spectral truncation — QO.9/stable-neighborhoods

**Theorem.** For nonnegative k compactly supported in the quotient image of O_stable and a regular multiorbit limit h O_Pi to O, choose precompact open V in g^w, W in h^w and U in [h^w]. The closure of V is stable; supp k is contained in the interior of the quotient image of V, the closure of res(V) is contained in W, the quotient image of the closure of W is contained in U, and the closure of U is contained in the quotient image of O_stable. For all sufficiently small h, every tempered sigma with O_(Pi,sigma) empty has h O_sigma disjoint from W. Thus the good tempered summands selected by W are orbit-distinguished.

**Dependencies.** [QO.3/orbit-continuity](#qo-3-orbit-continuity), [QO.5/stable-torsor](#qo-5-stable-torsor), [QO.7/orbit-distinction](#qo-7-orbit-distinction).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Lemma 30.3, p. 195; Definition 30.2, p. 195 (closure/interior conditions expressed without its nontransitive shorthand).

**Proof route.**

1. Cover a compact set of stable limit-orbit points whose quotient image covers supp k. At each point stability makes restriction from the ambient G-orbit to h^w a submersion.
2. Use the regular-orbit convergence criterion to choose nearby points in h O_Pi for every sufficiently small h, and the submersion theorem to obtain uniform restriction-image neighborhoods.
3. Choose nested finite unions of these neighborhoods and their quotient images, with all indicated closures inside the next open set. Any h O_sigma meeting W then lies over a point obtained from h O_Pi, so its relative intersection is nonempty.

**Check.** Prove the restriction differential is onto at stable limit points and the image neighborhoods persist uniformly in h. Check the closures are nested in their stated ambient spaces; the source's shorthand is not transitive.

<a id="qo-9-weighted-asymptotic"></a>

### Smoothly weighted period asymptotic — QO.9/weighted-asymptotic

**Theorem.** Under all corrected global-equidistribution hypotheses, fix k in Cc-infinity([h*] intersect image(O_stable)) and an auxiliary weight k-prime: a finite linear combination of products of finitely supported weights at compact archimedean factors and allowable continuous weights at finite places in R minus q. Then h^d sum_(Sigma, sigma and sigma-prime tempered, O_(Pi,sigma) nonempty) L(Pi,Sigma) k_h(sigma) k-prime(sigma-prime) tends to (tau(H)/tau(G)) (integral k d affine measure)(integral k-prime d Plancherel). Count automorphic multiplicity, impose the fixed unramified-outside-R condition, and define each L only where the supplied normalized period factorization applies.

**Dependencies.** [QO.8/global-equidistribution](#qo-8-global-equidistribution), [QO.9/spectral-truncation](#qo-9-spectral-truncation), [QO.9/period-functional](#qo-9-period-functional), [QO.7/arch-inverse](#qo-7-arch-inverse), [QO.7/allowable-weights](#qo-7-allowable-weights), [QO.7/cuspidal-allowability](#qo-7-cuspidal-allowability), [QO.7/weyl-positive-tests](#qo-7-weyl-positive-tests), [QO.9/stable-neighborhoods](#qo-9-stable-neighborhoods).

**Source.** [Nelson–Venkatesh (NV21)](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), Theorem 30.1, Definition 30.2 and Lemmas 30.3–30.6, pp. 194–200.

**Proof route.**

1. Choose V,W,U by the stable-neighborhood theorem, so that the truncated good tempered family is exactly the required orbit-distinguished family on the symbol support.
2. Reduce by linearity to nonnegative product weights. Use positive archimedean inverse branching and the two auxiliary allowability clauses to build tensor-product tests and trace-small majorants.
3. Apply period Parseval, microlocal truncation and limit-state equidistribution; the limiting main mass is the normalized affine integral times the auxiliary Plancherel mass.
4. Control the nontempered terms by the small-mass irregular-symbol test and the all-unitary auxiliary majorants; sum residual O(h^N) terms with the weak Weyl bound.
5. Let the approximation tolerance tend to zero after h. Every subsequence has a further subsequence with the same limit, giving full-sequence convergence.

**Check.** Carry the SO3/SO2 quadratic self-twist exclusion through the final statement. The final refined L-value average in §31 is not replanned here; this target is its smoothly weighted analytic input. Verify every tensor error has a positive majorant with bounded total mass before interchanging epsilon and h limits.

**Atlas planets.** Positive period functional and local factors, Smooth period Parseval and weak Weyl bound, Microlocal period truncation, Smoothly weighted period asymptotic.

## Worked examples and interface checks

### The additive line

Take \(G=\mathbb R\) and \(\Pi_t(x)=e^{itx}\). With \(\xi=i\eta\), its parameter is \(it\), its coadjoint orbit is the singleton \(\{it\}\), \(d=0\), and its orbit measure has mass one. The rescaled operator is

\[
 \operatorname{Op}_h(a)
 =\int_{\mathbb R}\chi(hx)a^\vee(x)e^{ihtx}\,dx.
\]

If the cutoff is inactive on the inverse-transform support, this equals \(a(iht)\) exactly. For bounded Schwartz families the cutoff difference has the prescribed negligible bound in the allowed parameter range. The constant symbol quantizes distributionally to one, the linear symbol \(\xi(X)\) to \(it\), and \(1+|\xi|^2\) to \(1+t^2\). Thus \(\|v\|_s=(1+t^2)^{s/2}\|v\|\). All BCH coefficients after \(C_0\) vanish. These computations jointly test the Fourier sign, the semiclassical parameter, the quadratic sign, the Sobolev exponent and the trace exponent.

### Orbit scaling and an empty limit

For a two-dimensional orbit, symplectic volume is \(\sigma/(2\pi)\). Under dilation by \(t>0\), the pushforward of its old measure is \(t^{-1}\) times the measure on the dilated orbit. The exponent is half the dimension. For an abelian group, point masses at integers converge vaguely to zero on compact tests. The empty multiorbit is therefore required, and its zero measure is not a contradiction to the mass-one normalization of each point orbit.

### Compact restriction and its constants

Let \(H\) be compact with total Haar mass one. If \(T\) has trace \(c\) on a \(\sigma\)-isotypic summand, then \(H_\sigma(T)=c/\dim\sigma\). Multiplication by the Plancherel atom \(\dim\sigma\) recovers \(c\). Summing over all isotypes recovers \(\operatorname{tr}T\). Replacing the factor by one would fail already for an irreducible of dimension two. Multiplying Haar by \(b>0\) multiplies the relative character by \(b\) and divides the dual measure by \(b\).

### A stable fibre uses one point

The abstract joint-fibre model is \(\{x:q(x)=\lambda,\ r(x)=\mu\}\). For \(q(x)=x^2\), \(r(x)=x\), the fibre at \((4,2)\) is \(\{2\}\), whereas the fibre at \((1,2)\) is empty. For the two coordinate projections of \(\mathbb R^2\), the fibre at \((3,5)\) is \(\{(3,5)\}\). This detects accidental use of independent ambient variables. In the GGP target a nonempty stable real fibre is an H-torsor with its fixed transported Haar measure; the algebraic torsor assertion does not imply real nonemptiness.

### Cotlar convergence and positive states

Let \(P_j\) be the orthogonal rank-one projections on the usual basis of \(\ell^2\). Both Cotlar row sums are one. The partial sums converge strongly to the identity, while every nonempty projection tail has norm one. This rejects the printed norm-convergence conclusion.

A finite diagonal state is \(F(x)=\sum_i w_i|v_i(x)|^2\). If \(w_i\geq0\), it is positive; if each \(v_i\) has L2 mass one, its integral is \(\sum_i w_i\). One index of weight three and value two gives twelve. The empty index set gives zero; two coordinate indicator vectors with weights two and three give those two values at their respective coordinates. The actual operator-state target extends this finite model using smooth trace ideals and the fixed auxiliary trace-one normalization.

### The binary orthogonal component

For an anisotropic binary \(V_H\), the spinor image is the norm subgroup for \(K=F(\sqrt{-\operatorname{disc}V_H})\). Its annihilator gives the character \(\chi=\eta_{K/F}\circ\theta\). If \(\Pi\simeq\Pi\otimes\chi\), equality of component averages does not follow. The global theorem includes the exclusion of this self-twist for SO3/SO2. An assertion that every local spinor map is surjective would also fail at definite real places.

## Suggested Lean coverage

Four light, real-bodied definitions use only existing Mathlib carriers. **symbolRescale** is \(a( h\xi)\); its API records the one, zero, composition and product laws, with square-polynomial, zero-scale and constant-symbol examples. **lineQuantization** is the additive-line integral of an inverse-Fourier amplitude; its API records zero, addition under integrability hypotheses, scalar multiplication, conjugation, a Schwartz norm bound and the zero-scale identity, with four character/cutoff examples. The fourth uses the inverse phase on [0,1] at h=t=1 and has value one; reversing the character sign fails this check. **jointFibre** is the simultaneous inverse image; its API gives membership, pair-preimage and swapping, with the three computed fibres above. **finiteDiagonalState** is the finite weighted squared-norm sum; its API gives positivity, weight addition and the integral normalization, with the empty, one-index and two-index computations above.

Representation Sobolev scales, smooth Schatten refinements, coadjoint multiorbits, scheme torsors, local relative characters and the arithmetic endpoint need carriers or interface contracts absent at the pins. They remain exact mathematical targets here. The suggested file introduces no substitute representation, arbitrary proposition field, or admitted data definition. Its admitted proofs state interfaces and examples; they do not establish the analytic theorems.

## Supplier contracts

These are the precise requested stage contracts. Exact external nodes used elsewhere in the target graph retain their own hypotheses.

1. **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups**: Lie exponential chart, inversion and Haar density near identity; no new Lie-group exponential is planned. Consumers: [QO.0/fourier-conventions](#qo-0-fourier-conventions), [QO.0/nelson-laplacian](#qo-0-nelson-laplacian).
2. **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-1-the-adjoint-representations-ad-and-ad**: Smooth adjoint/coadjoint actions, differential at identity and coadjoint tangent map. Consumers: [QO.0/quantization](#qo-0-quantization), [QO.3/orbital-measure](#qo-3-orbital-measure), [QO.5/fibral-forms](#qo-5-fibral-forms).
3. **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-3-the-lie-functor-and-baker-campbell-hausdorff**: Analytic BCH map and its convergent local expansion; the concrete PBW theorem is supplied separately by LieHighestWeight Layer 3. Consumers: [QO.1/bch-coefficients](#qo-1-bch-coefficients), [QO.1/cutoff-star](#qo-1-cutoff-star).
4. **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions**: KAK decomposition, root-exponential Haar estimates and polynomial volume growth for an algebraic group norm. Consumers: [QO.5/stable-properness](#qo-5-stable-properness), [QO.4/uniform-k-types](#qo-4-uniform-k-types).
5. **SmoothRepresentationsOfLocalGroups:SR.1**: Integrated locally constant Hecke action, convolution, involution and normalized compact-open projector. Consumers: [QO.4/padic-plancherel](#qo-4-padic-plancherel).
6. **SmoothRepresentationsOfLocalGroups:SR.2**: Normalized parabolic induction and Casselman Jacquet-module lifting at a good compact open level, for every irreducible constituent. Consumers: [QO.7/good-level-invariants](#qo-7-good-level-invariants).
7. **SmoothRepresentationsOfLocalGroups:SR.3**: General characteristic-zero complex Bernstein centre, conjugate-dual real involution, supercuspidal support and square-integrable tempered inducing classification with its finite constituent data. Existing GLn-only centre nodes are insufficient for classical GGP groups. Consumers: [QO.7/l-components](#qo-7-l-components), [QO.7/central-approximation](#qo-7-central-approximation), [QO.4/padic-plancherel](#qo-4-padic-plancherel).
8. **SmoothRepresentationsOfLocalGroups:SR.3a**: Uniform fixed-J dimension bounds and finite visible inertial/tempered inducing families; preserve the early proof order without assuming Bernstein-centre finiteness as input to itself. Consumers: [QO.7/good-level-invariants](#qo-7-good-level-invariants), [QO.7/l-components](#qo-7-l-components), [QO.7/cuspidal-allowability](#qo-7-cuspidal-allowability).
9. **AutomorphicSpectralTheory:AS.4**: Compact-quotient discrete automorphic decomposition with multiplicity from AS.4/compact-quotient-spectrum. In addition request smooth absolute two-variable spectral expansion, polynomial elliptic eigenvalue counting and differentiated restriction estimates at fixed central quotient and auxiliary level; these extensions are G20, not consequences claimed from the existing supplier statement. Consumers: [QO.9/period-functional](#qo-9-period-functional), [QO.9/period-parseval](#qo-9-period-parseval).
10. **AdelicAlgebraicGroups:AA.2**: Tamagawa/Haar quotient measures on the specific anisotropic GGP groups and compatibility with restriction to H. Consumers: [QO.8/global-equidistribution](#qo-8-global-equidistribution).
11. **AdelicAlgebraicGroups:AA.3**: Anisotropic quotient compactness and finite arithmetic connected-component decomposition at fixed auxiliary level. Consumers: [QO.8/operator-state](#qo-8-operator-state), [QO.8/global-equidistribution](#qo-8-global-equidistribution).
12. **AdelicAlgebraicGroups:AA.4**: Strong approximation for simply connected almost-simple factors noncompact at q, with products and the exact adelic component consequence. Consumers: [QO.8/unipotent-invariant-measures](#qo-8-unipotent-invariant-measures), [QO.8/component-comparison](#qo-8-component-comparison).
13. **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms**: Real forms and comparison with complex algebraic point groups; Cartan connectedness for algebraically simply connected semisimple real groups is a separate local target here. Consumers: [QO.8/real-algebraic-connectedness](#qo-8-real-algebraic-connectedness).
14. **LieHighestWeightPartII:N0**: Use the exact Jacobson–Morozov and adapted-triple construction over the algebraic closure; the regular-real-nilpotent simple-root criterion and centralizer rigidity are the local targets in QO.8. Consumers: [QO.8/regular-nilpotent-rigidity](#qo-8-regular-nilpotent-rigidity).

15. **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ**: Concrete PBW filtration, associated-graded generator identification and ordered-monomial basis over a field, from LieHighestWeight Layer 3. Over R or C derive the factorial-normalized symmetrization isomorphism used in polynomial quantization; do not import PBW from the BCH layer. Consumer: [QO.1/polynomial-quantization](#qo-1-polynomial-quantization).

## Named proof obligations and closure

All ten layers are target-planned. No layer is proof-closed. Completion of the design pass means every target has a statement and a dependency route ending in checked declarations, supplied targets, requested contracts or the obligations below. It does not mean that the unresolved classical proofs or supplier extensions have been established. The packet's coverage records include inherited obligations as well as direct ones.

<a id="g1"></a>

### G1. Nelson analytic-vector inputs

Supply original proofs or a verified alternate source for essential self-adjointness of the representation sum of squares and the smooth-vector domain intersection (NV p.28, [NS] and [NE Cor.9.3]). The NV text only cites them. No cleared original was available for this pass; their exact statements are planned, not proved from the baseline.

**Direct consumers.** [QO.0/nelson-laplacian](#qo-0-nelson-laplacian).

<a id="g2"></a>

### G2. Cotlar–Stein proof closure

NV Lemma 8.10 cites Hörmander Lemma 18.6.5; no cleared copy of that book is available. The corrected strong-convergence statement and projection countertest are explicit, but the full finite-family inequality and tail argument need a read primary proof or a complete new proof.

**Direct consumers.** [QO.1/cotlar-stein](#qo-1-cotlar-stein).

<a id="g3"></a>

### G3. Uniform minimal K-types and unitary exponents

AF.1 supplies Langlands classification but its current statement does not supply the uniform real-exponent bound or Vogan/Blattner quantitative minimal K-type estimate used in NV Lemmas 9.4–9.5. Request an AutomorphicFormsOnReductiveGroups, Part II extension for these exact bounds; no existing stage has that quantitative scope. Original Knapp/Vogan proofs were not read.

**Direct consumers.** [QO.2/tempered-criterion](#qo-2-tempered-criterion), [QO.2/spectral-laplacian](#qo-2-spectral-laplacian).

<a id="g4"></a>

### G4. Orbital character and continuity theorems

NV cites Ranga Rao for Radon finiteness, Harish-Chandra for the locally integrable character and Rossmann for the regular multiorbit character formula and full-fibre continuity (Theorem6.1, Lemma11.2). Original proofs and their group-class hypotheses need primary-source closure. The exact cited targets are local nodes; they are not treated as library facts. The uniform bound on the number of real orbits per invariant-quotient fibre also needs the Kostant/Whitney input cited on p.42.

**Direct consumers.** [QO.3/orbital-radon](#qo-3-orbital-radon), [QO.3/harish-chandra-character](#qo-3-harish-chandra-character), [QO.3/rossmann-character](#qo-3-rossmann-character), [QO.3/orbit-continuity](#qo-3-orbit-continuity).

<a id="g5"></a>

### G5. Wavefront and genericity identification

The fixed-representation regular nilpotent orbit limit, maximal GK-dimension criterion and genericity equivalence use Barbasch–Vogan, Rossmann and Kostant original results cited in NV §11.4. Their proofs and real-form hypotheses need verification; this is separate from the elementary dyadic orbital-decay argument.

**Direct consumers.** [QO.3/orbital-decay](#qo-3-orbital-decay).

<a id="g6"></a>

### G6. Real Plancherel supplier definition absent

The extraction routes the real Harish-Chandra Plancherel theorem to the proposed AutomorphicSpectralTheoryPartIISchwartzMultipliers, which currently has no defined stage. Needed: the normalized real tempered Plancherel measure and identity on compact smooth tests. Do not fabricate a stage id or replan it here; the p-adic version has a local target because no existing stage owns it.

**Direct consumers.** [QO.4/plancherel-sobolev](#qo-4-plancherel-sobolev), [QO.4/extended-plancherel](#qo-4-extended-plancherel).

<a id="g7"></a>

### G7. Cited harmonic-analysis proofs

Close the primary proofs of the Cowling–Haagerup–Howe tempered matrix-coefficient bound and the Harish-Chandra–Waldspurger p-adic Plancherel theorem (NV Appendix A). The NV argument proves the Xi-test extension from these inputs, not those inputs themselves.

**Direct consumers.** [QO.4/uniform-k-types](#qo-4-uniform-k-types), [QO.4/padic-plancherel](#qo-4-padic-plancherel).

<a id="g8"></a>

### G8. GGP supplier has no stages

GanGrossPrasadConjecturesForClassicalGroups is a proposed owner without a roadmap definition. Required contracts: precise orthogonal/unitary pairs including low rank and restriction of scalars; characteristic-polynomial/Pfaffian ev conventions; isotropic eigenvector/Hilbert–Mumford criterion; spherical moment-map dominance; local integral Xi_G|H Xi_H convergence; multiplicity one, strong multiplicity one for full square-integrable inductions, upper-semicontinuity and p-adic positivity/nonvanishing of relative characters; and the normalized global period factorization. These are imported inputs, not new local GGP proofs. Its future stages must be linked before closure.

**Direct consumers.** [QO.5/relative-fibres](#qo-5-relative-fibres), [QO.5/stable-criterion](#qo-5-stable-criterion), [QO.5/stable-torsor](#qo-5-stable-torsor), [QO.5/three-volume-comparison](#qo-5-three-volume-comparison), [QO.4/relative-character](#qo-4-relative-character), [QO.7/l-components](#qo-7-l-components), [QO.7/central-approximation](#qo-7-central-approximation), [QO.9/period-functional](#qo-9-period-functional).

<a id="g9"></a>

### G9. Stable torsor scheme and Witt bridge

The pointwise cyclic-vector proof in NV §14 must be lifted to the stated algebraic principal-bundle theorem: smoothness, scheme fibre identification and descent require a precise affine reductive quotient and Witt-extension/Pfaffian-orientation interface. ReductiveGroupsPartIII:RG3.0 currently concerns group conjugacy quotients, not this Lie-algebra H-action. Propose ReductiveGroups, Part II/III extension rather than claiming that stage supplies affine GIT.

**Direct consumers.** [QO.5/stable-torsor](#qo-5-stable-torsor).

<a id="g10"></a>

### G10. Normalized affine form primary proof

NV Lemma16.4 invokes Rossmann Lemma C for the exact quotient-versus-symplectic normalization. The Cartan computation is recorded, but the original global regular-form argument has not been read; supply it and the invariant top-form interface before declaring the volume comparison closed.

**Direct consumers.** [QO.5/normalized-affine-form](#qo-5-normalized-affine-form).

<a id="g11"></a>

### G11. Real coarea and invariant forms interface

The baseline has measure integrals but the exact manifold determinant-form/coarea theorem for these algebraic quotient maps has not been matched to a pinned declaration or a precise DifferentialGeometry layer. Link the current DifferentialGeometry owner after checking its full target statement; do not replace the needed normalized Fubini theorem by an arbitrary measure disintegration.

**Direct consumers.** [QO.5/fibral-forms](#qo-5-fibral-forms), [QO.5/stable-disintegration](#qo-5-stable-disintegration).

<a id="g12"></a>

### G12. Complex Plancherel Tauberian step

Lemma17.4 gives a sketch, not uniform upper/lower approximations of 1_U with tail control. Complete a positive sandwich or explicit complex Plancherel-density proof with the normalized affine constant and boundary-null hypothesis. The statement is not generalized to arbitrary real groups.

**Direct consumers.** [QO.5/complex-plancherel-scaling](#qo-5-complex-plancherel-scaling).

<a id="g13"></a>

### G13. Good compact-open basis

Need a neighborhood basis of good J normal in K and satisfying the simultaneous Iwahori factorizations of NV §23.2. RG2.3 plans parahoric congruence subgroups but not that exact simultaneous assertion. Propose the additional ReductiveGroupsPartII contract and verify Casselman lifting from SR.2; ordinary compact openness is insufficient.

**Direct consumers.** [QO.7/good-level-invariants](#qo-7-good-level-invariants).

<a id="g14"></a>

### G14. General p-adic tempered and centre contracts

The SR.3 stage is an appropriate supplier direction, but its current concrete Part II centre nodes are GLn-specific. Supply the requested characteristic-zero classical-group tempered induction, finite constituent and real Bernstein-centre interfaces, plus fixed-level finiteness of l-families. Until the contract is made into exact nodes the allowability chain remains requested.

**Direct consumers.** [QO.7/l-components](#qo-7-l-components), [QO.7/central-approximation](#qo-7-central-approximation).

<a id="g15"></a>

### G15. Schwartz kernel and continuous disintegration

AS.0/vector-schwartz already records an unresolved locally convex kernel identification. Need the real Schwartz-kernel theorem on g* times the fixed-level compact quotient, positivity on all product tests, and equivariant convolution regularization of the Radon–Nikodym representatives. RMK alone supplies neither the kernel nor pointwise continuous conditional measures.

**Direct consumers.** [QO.8/state-disintegration](#qo-8-state-disintegration).

<a id="g16"></a>

### G16. Regular nilpotent real criterion

LieHighestWeightPartII:N0 supplies algebraically closed adapted triples, not Kostant regular-real-nilpotent simple-root nonvanishing or the real-form descent used in NV Lemma27.5. Supply this precise primary proof and the equal-rank step of Lemma27.12; the local rigidity target is explicitly planned here.

**Direct consumers.** [QO.8/regular-nilpotent-rigidity](#qo-8-regular-nilpotent-rigidity).

<a id="g17"></a>

### G17. Algebraic Cartan connectedness proof

The current LieGroups universal-cover layer assumes topological simple connectedness of a Lie group and does not imply connectedness of real points of an algebraically simply connected semisimple group. Supply the cited É.Cartan theorem or a verified algebraic-real-groups proof for the QO.8 target.

**Direct consumers.** [QO.8/real-algebraic-connectedness](#qo-8-real-algebraic-connectedness).

<a id="g18"></a>

### G18. Measure-classification bridge

GN.4 supplies Ratner measure classification in a connected real lattice quotient. Need ergodic decomposition at the fixed adelic finite level, the relevant Borel-density statement for the homogeneous subgroup and the proof that its Zariski closure is reductive under global anisotropy. These extensions are not in the quoted Ratner node and must be assigned precise GN.4/AdelicAlgebraicGroups supplier nodes.

**Direct consumers.** [QO.8/unipotent-invariant-measures](#qo-8-unipotent-invariant-measures).

<a id="g19"></a>

### G19. Arithmetic component images over general number fields

Import the current OrthogonalSpinGroups Layer2F–2H tables for R and Qp without replanning them. Extend those contracts to finite extensions of Qp and complex places as needed for general F. Supply the global Kneser spinor-image equality theta(G(F))=F^times intersect theta(G(A)), its sign/weak-approximation use, and the local SU determinant-kernel argument. None follows from the pinned abstract Spin-kernel theorem or AA.4 alone. The binary norm subgroup and self-twist exclusion are retained.

**Direct consumers.** [QO.8/component-comparison](#qo-8-component-comparison).

<a id="g20"></a>

### G20. Smooth compact-quotient spectral estimates

AS.4/compact-quotient-spectrum supplies a discrete Hilbert sum with finite multiplicities and smooth convolution kernels. Its statement does not yet give the arbitrary smooth two-variable absolute spectral expansion, polynomial elliptic eigenvalue counting and differentiated restriction estimates required in NV §29.1–§29.2 pp.189–190. The AS.4 supplier packet itself leaves compact-quotient Sobolev trace-class input open. Request these precise estimates as an AutomorphicSpectralTheory extension, with a fixed central quotient and fixed finite auxiliary level, before closing the period Parseval or truncation argument.

**Direct consumers.** [QO.9/period-parseval](#qo-9-period-parseval), [QO.9/spectral-truncation](#qo-9-spectral-truncation).

## Source discipline and corrected statements

The primary source is Paul D. Nelson and Akshay Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Mathematica **226** (2021), 1–209, [DOI](https://doi.org/10.4310/ACTA.2021.v226.n1.a1), [published PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf). All page numbers in this document are printed page numbers. Statements, normalizations and proof sketches are in the roadmap's own words.

The packet's `sourceIssues` records each correction with its locator, reason, provenance and search record. Independent review narrows E10: the partition works at delta=1, although the calculus uses delta<1. E36 records the noncommutative power error in §8.7 p.63: use the inverse-PBW polynomial for Delta^N, not an uncorrected power of the quadratic symbol. The Heisenberg calculation in QO.1/polynomial-quantization detects it. The main statement changes are strong Cotlar convergence (Lemma 8.10), the missing derivative scaling in Lemma 8.1(ii), positive powers in the cutoff Taylor formula (Lemma 7.14), the full division recursions (Lemma 10.1 and §8.8.6), the h-powers and auxiliary mass in the relative trace expansion (Theorem 19.4 and Lemma 19.5), the inverse-branching remainder and support margin (Theorem 22.2), and the binary spinor obstruction (Lemma 27.3, Theorems 27.1 and 30.1). The corrected right-division recursion is obtained by equating every coefficient, not by repeatedly dividing only the first term. The corrected nonstationary-phase proof differentiates the formal adjoint of its first-order vector field.

The positivity assertions retain their scope: the archimedean relative character is Hermitian in the construction, while its general positivity is not supplied there. The global nonnegative period norm provides the positivity used in the final averaging argument. The p-adic allowability theorem covers cuspidal-type components and requires a separately supplied GGP positivity/nonvanishing contract. The complex Plancherel scaling lemma retains its complex-group restriction and its missing positive Tauberian argument as G12.

No inaccessible original is treated as read. NV's citations to Nelson–Stinespring/Nelson, Hörmander, Ranga Rao, Harish–Chandra, Rossmann, Cowling–Haagerup–Howe, Vogan/Blattner, Cartan and arithmetic spinor-image results are identified at their consuming targets; the obligations above distinguish the secondary statements read in NV from original proofs still needed for closure.

## Extraction traceability

The following routes cover all 76 items assigned by `PAPER-NELSON-VENKATESH-21.result.json`. They are a provenance index, not an ordering of the development. An item can split into several targets, and several items can share one target. Item 107 imports the already owned Spin kernel and R/Qp image tables; its local target here is the remaining arithmetic component bridge.

| Extraction item | Target or input bridge |
| --- | --- |
| 2 | [QO.0/quantization](#qo-0-quantization) |
| 3 | [QO.1/cutoff-star](#qo-1-cutoff-star) |
| 4 | [QO.0/sobolev-scale](#qo-0-sobolev-scale), [QO.0/operator-order](#qo-0-operator-order) |
| 5 | [QO.0/operator-algebra](#qo-0-operator-algebra) |
| 6 | [QO.0/symbol-families](#qo-0-symbol-families) |
| 7 | [QO.1/bch-coefficients](#qo-1-bch-coefficients), [QO.1/mixed-symbol-calculus](#qo-1-mixed-symbol-calculus) |
| 8 | [QO.1/polynomial-quantization](#qo-1-polynomial-quantization) |
| 9 | [QO.0/operator-order](#qo-0-operator-order) |
| 10 | [QO.1/cutoff-covariance](#qo-1-cutoff-covariance) |
| 11 | [QO.1/cutoff-covariance](#qo-1-cutoff-covariance) |
| 12 | [QO.1/operator-calculus](#qo-1-operator-calculus) |
| 13 | [QO.1/operator-calculus](#qo-1-operator-calculus) |
| 14 | [QO.3/orbital-measure](#qo-3-orbital-measure) |
| 15 | [QO.3/rossmann-character](#qo-3-rossmann-character) |
| 16 | [QO.3/refined-trace](#qo-3-refined-trace), [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals) |
| 17 | [QO.1/mixed-symbol-calculus](#qo-1-mixed-symbol-calculus) |
| 18 | [QO.1/bch-coefficients](#qo-1-bch-coefficients), [QO.1/oscillatory-estimates](#qo-1-oscillatory-estimates) |
| 19 | [QO.1/oscillatory-estimates](#qo-1-oscillatory-estimates) |
| 20 | [QO.1/planck-partition](#qo-1-planck-partition) |
| 21 | [QO.1/localized-remainders](#qo-1-localized-remainders) |
| 22 | [QO.1/fourier-cutoff](#qo-1-fourier-cutoff) |
| 23 | [QO.1/fourier-cutoff](#qo-1-fourier-cutoff) |
| 24 | [QO.1/order-criterion](#qo-1-order-criterion) |
| 25 | [QO.1/zero-order-bound](#qo-1-zero-order-bound) |
| 26 | [QO.1/cotlar-stein](#qo-1-cotlar-stein) |
| 27 | [QO.1/operator-calculus](#qo-1-operator-calculus) |
| 29 | [QO.2/dual-characters](#qo-2-dual-characters) |
| 31 | [QO.2/tempered-criterion](#qo-2-tempered-criterion) |
| 32 | [QO.2/spectral-laplacian](#qo-2-spectral-laplacian) |
| 33 | [QO.2/approximate-division](#qo-2-approximate-division) |
| 34 | [QO.2/eigenfunctional-localization](#qo-2-eigenfunctional-localization) |
| 35 | [QO.2/joint-localization](#qo-2-joint-localization) |
| 36 | [QO.3/orbit-topology](#qo-3-orbit-topology), [QO.3/orbit-continuity](#qo-3-orbit-continuity) |
| 37 | [QO.3/orbital-decay](#qo-3-orbital-decay) |
| 38 | [QO.3/orbit-topology](#qo-3-orbit-topology), [QO.3/orbital-decay](#qo-3-orbital-decay) |
| 39 | [QO.3/refined-trace](#qo-3-refined-trace), [QO.3/smooth-trace-ideals](#qo-3-smooth-trace-ideals) |
| 40 | [QO.4/uniform-k-types](#qo-4-uniform-k-types) |
| 41 | [QO.4/plancherel-sobolev](#qo-4-plancherel-sobolev) |
| 47 | [QO.5/stable-criterion](#qo-5-stable-criterion) |
| 48 | [QO.5/stable-torsor](#qo-5-stable-torsor) |
| 52 | [QO.5/fibral-forms](#qo-5-fibral-forms) |
| 53 | [QO.5/normalized-affine-form](#qo-5-normalized-affine-form) |
| 54 | [QO.5/three-volume-comparison](#qo-5-three-volume-comparison) |
| 55 | [QO.5/real-measure-normalization](#qo-5-real-measure-normalization) |
| 56 | [QO.5/stable-torsor](#qo-5-stable-torsor), [QO.5/stable-disintegration](#qo-5-stable-disintegration) |
| 57 | [QO.5/stable-properness](#qo-5-stable-properness) |
| 58 | [QO.5/complex-plancherel-scaling](#qo-5-complex-plancherel-scaling) |
| 59 | [QO.4/relative-character](#qo-4-relative-character), [QO.4/relative-disintegration](#qo-4-relative-disintegration) |
| 61 | [QO.4/relative-disintegration](#qo-4-relative-disintegration) |
| 62 | [QO.6/diagonal-reduction](#qo-6-diagonal-reduction), [QO.6/relative-expansion](#qo-6-relative-expansion) |
| 63 | [QO.6/small-elements](#qo-6-small-elements), [QO.6/far-elements](#qo-6-far-elements) |
| 65 | [QO.4/xi-test-space](#qo-4-xi-test-space), [QO.4/extended-plancherel](#qo-4-extended-plancherel) |
| 67 | [QO.7/orbit-distinction](#qo-7-orbit-distinction) |
| 68 | [QO.7/arch-inverse](#qo-7-arch-inverse) |
| 69 | [QO.7/weyl-positive-tests](#qo-7-weyl-positive-tests) |
| 70 | [QO.7/good-level-invariants](#qo-7-good-level-invariants) |
| 73 | [QO.7/l-components](#qo-7-l-components) |
| 75 | [QO.7/allowable-weights](#qo-7-allowable-weights) |
| 76 | [QO.7/cuspidal-allowability](#qo-7-cuspidal-allowability) |
| 77 | [QO.7/central-approximation](#qo-7-central-approximation) |
| 82 | [QO.8/operator-state](#qo-8-operator-state), [QO.8/limit-state](#qo-8-limit-state) |
| 83 | [QO.8/state-disintegration](#qo-8-state-disintegration) |
| 85 | [QO.8/global-equidistribution](#qo-8-global-equidistribution) |
| 86 | [QO.8/component-comparison](#qo-8-component-comparison) |
| 88 | [QO.8/regular-nilpotent-rigidity](#qo-8-regular-nilpotent-rigidity) |
| 90 | [QO.8/unipotent-invariant-measures](#qo-8-unipotent-invariant-measures) |
| 91 | [QO.8/regular-nilpotent-rigidity](#qo-8-regular-nilpotent-rigidity) |
| 92 | [QO.9/period-functional](#qo-9-period-functional), [QO.9/period-parseval](#qo-9-period-parseval) |
| 93 | [QO.9/period-parseval](#qo-9-period-parseval), [QO.9/spectral-truncation](#qo-9-spectral-truncation) |
| 94 | [QO.9/weighted-asymptotic](#qo-9-weighted-asymptotic) |
| 100 | [QO.4/padic-plancherel](#qo-4-padic-plancherel) |
| 103 | [QO.2/real-infinitesimal-quotient](#qo-2-real-infinitesimal-quotient) |
| 107 | [QO.8/component-comparison](#qo-8-component-comparison) |
| 109 | [QO.0/nelson-laplacian](#qo-0-nelson-laplacian) |
| 110 | [QO.3/orbital-radon](#qo-3-orbital-radon) |
| 112 | [QO.8/real-algebraic-connectedness](#qo-8-real-algebraic-connectedness) |

## Acceptance of the complete roadmap

Every definition or construction must satisfy its named API and at least three discriminating tests. Every theorem must meet its local Check and the layer acceptance, with the source hypotheses, normalizations and uniform constants stated above. All named obligations must be discharged or replaced by exact supplier nodes with verified statements before proof closure. In particular, the general local-field and global spinor-image inputs must retain the actual signature and dimension restrictions, and every use of Ratner must justify the real lattice quotient and algebraic reductivity bridge.

The final weighted formula is tested against independent Haar rescaling, compact restriction, an abelian character, an empty orbital limit and the exceptional binary character. Its proof must sum every residual error with the weak Weyl bound, take h to zero before sending the positive approximation tolerance to zero, and pass from subsequences to the full limit. These conditions determine the claimed analytic endpoint.
