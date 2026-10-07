# REV-AutomorphicSpectralTheory

Completed independent review of issue #365, 7 October 2026. Agent: Codex, session `codex-ZTjflm`, GPT-6. This session did none of the blueprint being reviewed. Verdict: **needs_changes**. This is a finished review, not an unfinished planning checkpoint.

The packet is a substantial target-level inventory. Its explicitly recorded proof gaps are compatible with a completed planning pass and are not, by themselves, grounds for refusing acceptance. The remaining blockers are contradictions between several suggested signatures and the source-qualified packet statements, and unit tests whose actual Lean propositions do not express the packet tests. Correcting a source locator, adding a gap, or obtaining an elaboration with admitted proofs does not resolve those blockers.

## Scope and counts

I read all 191 input nodes, their cited locators/excerpts, hypotheses, prerequisites, proof sketches, acceptance conditions, API and tests, and the whole suggested file. The review remains at target granularity: routine proof arguments have not been split into lemma nodes. I also read the reviewed library audit, the RS-04 ownership decisions, the supplier statements used by the external dependencies, and the three assigned red-team findings. The reader document was checked but is outside this issue's editable deliverables.

| Item | Input | Reviewed result |
|---|---:|---:|
| Nodes | 191 | 190 |
| Definitions | 36 | 36 |
| Constructions | 37 | 37 |
| Theorems | 118 | 117 |
| API items | 223 | 223 |
| Unit tests | 219 | 219 |
| Planets | 38 | 38 |
| Baseline declarations | 23 | 24 |
| Public sources | 29 | 30 |
| Supplier requests | 21 | 21 |
| Source routes | 128 | 128 |
| Recorded gaps | 40 | 49 |
| Source issues | 14 | 36 |

The retained-node ledger has **89 verified, 49 corrected, 0 added, and 52 unverifiable** entries. Sixty-six retained packet nodes were edited; some remain unverifiable because a separate test/signature defect remains. Three additional nodes received corrections only in the suggested file. Every retained node has exactly one `review.checked` entry. The removed duplicate is recorded below. All implementation statuses remain unchecked.

| Stage | Retained nodes | Coverage |
|---|---:|---|
| AS.0 | 47 | planned; explicit remaining work |
| AS.1 | 29 | planned; explicit remaining work |
| AS.2 | 24 | planned; explicit remaining work |
| AS.3 | 19 | planned; explicit remaining work |
| AS.4 | 20 | planned; explicit remaining work |
| AS.5 | 13 | planned; explicit remaining work |
| AS.6 | 38 | planned; explicit remaining work |

All seven stages remain planned, none closed. Every stage target has a retained node, an imported owner's target, or a recorded gap. Complete means this inventory pass is finished; it does not mean proof closure. The 38 planets identify central definitions, constructions and named theorems, with at most six per stage. No locator-only planet or already formalized replacement was added.

## Corrections made

1. **Scalar measurable fields and direct integrals.** Added the constant-one measurable-section hypothesis to the standard scalar-field tests and signatures. For an arbitrary measurable structure on constant complex fibres the old claim is false: a nonmeasurable unit-modulus phase transports a standard measurable field without changing norms, but need not preserve standard scalar measurability.
2. **Spectral inputs.** Made separability explicit in the bounded-normal multiplicity prototype. Added the pinned compact symmetric Hilbert eigenbasis theorem to trace-class construction, applied to the compact positive operator A* A; finite-dimensional eigenspaces alone do not supply this basis. Teschl's corresponding Schatten reference is Lemma 6.13. The joint-measure proof and analytic Fredholm continuation remain recorded gaps.
3. **General Herglotz representation.** Teschl Theorem 3.20 proves the finite-measure Stieltjes representation under its extra growth condition, not the general affine-plus-subtracted-integral representation. Replaced this citation by the public Shapiro Theorem 10.5 and recorded its positive harmonic Poisson input as a gap.
4. **Special functions.** Replaced the Whittaker M placeholder by its actual regularized hypergeometric expression, including Gamma(1+2ν), and corrected its Euler domain and three small-parameter tests. Added the missing Gamma(2s) factor to the Gross–Zagier Legendre hypergeometric adapter. The normalized V function is an entire continuation, with its Gamma-product identity only on the initial chamber, rather than a globally evaluated singular Gamma quotient. Corrected the DIT 114 locator to DIT 2011 Appendix A.3–A.5. The original DIT sine/Bessel normalization errors remain explicitly adjudicated source issues.
5. **Green sums.** Distinguished the full effective modular group Γ₀(N)/±I from the Eisenstein coset index Γ∞\Γ. The Green series and divergence test use the former and retain off-diagonal and positive-level conditions. Boundary tests now use the actual Legendre integrand. The ER carrier integration, lattice growth and Hejhal resolvent proof are still explicit gaps.
6. **Source hypotheses and passages.** Corrected DIT 105's printed y^(1+ε) hypothesis attribution and identified y^ε as a separately justified weaker adapter; derivative bounds remain necessary. Replaced unrelated excerpts in DIT 105 and the completed DIT Eisenstein passage. Corrected the GZ 192 group to Γ₀(δ), Arthur's cone denominator reference to (15.7), and the real operator Paley–Wiener excerpt to III.4.1's topological algebra isomorphism.
7. **Analytic order and residues.** Added a common denominator and analyticity away from the pole in the residue coefficient API. Restricted the wave-packet construction before its Gram theorem to pointwise or already truncated targets, so individual Eisenstein functions are not assumed globally L². Replaced the unrelated DIT core-integrability proof template by the actual critical-line cusp bound: the y^(1/2)(1+log y) constant term is integrable against dy/y² on finitely many bounded-width cusps, and the nonconstant terms decay exponentially.
8. **Representation and cohomology hypotheses.** An isobaric sum of arbitrary real twists is a Langlands quotient; it need not be generic. Restored Arthur's compact-Cartan hypothesis for G(R)/A_G(R)⁰ in L²-Lefschetz, and the discrete-series condition for the CT specialization. Removed the use of ALS.5's cuspidal comparison as if it supplied general L² cohomology; the Borel–Casselman analytic input remains a separate gap.
9. **Ownership.** Replaced AF.4 tensor factorization by AF.2/flath-factorization and AL.0 completed-zeta/Dirichlet requests by the actual AL.1 global-zeta/functional-equation inputs. Removed ET.0 as a local-parameter supplier and GN.3 as a quadratic-cycle supplier; both needed extensions are explicit Part II gaps. Existing SR/AF carrier stages are no longer treated as proofs of all Harish-Chandra estimates, analytic c-functions or Langlands classification.
10. **Duplicate target.** Deleted AS.5/cuspidal-cohomology-decomposition, already supplied, including its Hecke action, by ALS.5/cuspidal-cohomology. The GL/SL diagram imports that owner directly; the BCG source routing no longer points at the removed node. No original mathematics was discarded.
11. **Yu dependencies and fibres.** Added the missing direct root/cone, cutoff, chamber/quasi-polynomial, character-family, covering/trace and spectral coefficient edges. Replaced the irrelevant Yu 038 excerpt by the actual Appendix B text and gave its group/Lie characteristic-polynomial fibre comparison with the nonzero-constant-term condition. Its three tests now state actual fibre membership and invertibility. Clarified Haar normalization across the 41 common function-field hypotheses: the whole compact group has mass one; each of r components has mass 1/r. The source's characteristic-independent GL root adapter and the coprime cutoff cancellation are explicit proof gaps.
12. **Routing and remaining work.** The twelve BPCZ items were previously routed indiscriminately through all seven Appendix A nodes. Item 8 now goes to roots/cones, item 32 to the cuspidal-data construction, and items 108–114 to their appropriate LF/integration/tensor/Schwartz/continuation targets. Items 27, 28, 33 and 45 are gaps for smooth globalization, smooth Eisenstein continuity, weighted χ projections and the compact Siegel cutoff, respectively. Routing is now 95 planned, 28 covered, 5 gap. Rebuilt the coverage remaining lists from the actual gaps and requests. Added the QM classical/unitary weight-k Laplacian conjugation gap, including the −3/16 shift at k=1/2. Recorded the real harmonic-analysis prefix needed before ET.1.

The packet's added source issues, normalization corrections, removed duplication, ownership changes and revised gaps are all planning changes. They make no assertion that a declaration has been proved in Lean.

## Acceptance blockers and concrete counterexamples

### B1: Schwartz continuation

The packet correctly preserves BPCZ Corollary A.0.11.1's two-sided functional equation and Schwartz-topology finite strip order. The suggested theorem has only pointwise entire scalar values and agreement on Re(s)>1. Set scalar(x,s)=exp((1−s)x²), and take the initial Schwartz family on that half-plane, extended arbitrarily as Schwartz-valued data elsewhere. Every stated hypothesis holds. At s=1 the required Schwartz function is constant one. The conclusion is false.

Finite strip order and a two-sided family are expressible already with the normed Schwartz carrier used in this prototype. Section 13's allowance for an unavailable future atlas carrier does not excuse these omissions. Revision must encode the initial two families, their reflected functional equation and the source's uniform order/seminorm bounds, then conclude existence and uniqueness of the Schwartz-valued continuation.

### B2: LF-dual continuation

The packet now correctly says weak-dual entire continuation of initial continuous functionals, with a common scalar strip order. The suggested signature instead starts with arbitrary algebraic functionals at every parameter and concludes they are continuous. On an infinite-dimensional Banach space take a proper dense linear subspace H and a nonzero discontinuous Hamel functional L annihilating H. Put Z₊(s)=L and Z₋(s)=0. On H both evaluations are the zero entire function and satisfy the reflected equation. The claimed continuity and the equation outside H both fail.

Revision must start with continuous half-plane data, preserve one common order bound, and construct the continuation. It must not assert continuity of arbitrary choices off the initial chamber. The weak topology in the source does not by itself give strong-dual holomorphy.

### B3: Fourier transfer prototype

The packet states the correct smooth compact abelian Lie group theorem, including probability Haar and the full dual character family. The prototype leaves all these conditions out. Even preserving the intended groups and a constant smooth function, μ=0 gives zero Fourier coefficients but normalized fibre average one. Probability normalization is already expressible. The absent manifold/character-lattice interfaces may be omitted honestly under section 13, but the prototype also needs the available hypotheses and a reviewable finite-group/torus specialization. This review does not reject an arbitrary parameter merely because its eventual supplier carrier is not yet built.

### B4: Tests do not express the proposed objects

The following table identifies every affected retained definition/construction. The packet often has a sensible mathematical test in prose; the corresponding suggested proposition is a weaker numerical fact or an unrelated carrier. Keeping a named admitted proof does not make it the packet's test. The revision should use the object or a named, correctly related specialization, and should not assume the conclusion it is supposed to check.

| Node | Required correction |
|---|---|
| AS.0/decomposable-operator | identity tests the norm of CLM.id rather than the decomposable construction; unbounded_multiplier tests an a.e. scalar bound without linking multiplication to the operator. Keep null_change, and add the actual identity and scalar multiplication instances. |
| AS.0/hilbert-schmidt | infinite_identity and finite_identity only assert scalar series/square-root facts. They never assert non-membership or the norm of the identity operator, so they do not match the two packet tests. |
| AS.0/trace-class | diagonal_harmonic is only a pair of scalar summability facts, with no diagonal operator or trace-class membership. The compact positive eigenbasis prerequisite was corrected; the test still needs its actual operator. |
| AS.0/nuclear-lf-space | finite_group only states finite dimensionality, real_line only states a support-set equality, and escaping_support only excludes one compact support. None tests the LF topology, strictness, nuclearity or boundedness of a family. |
| AS.0/operator-meromorphic | pointwise_orders is only the unboundedness of the natural numbers. It must exhibit the direct-sum operator family and failure of a common denominator; the strong-topology proof remains an honest separate gap. |
| AS.0/yu-148 | test2 is a scalar square identity and test3 is 2≠1, with no covering p or yu_148. The normalized finite-fibre transfer is correct, but these are not the circle-cover tests stated in the packet. |
| AS.1/induced-family | rank_one_half_modulus is an exponential identity and unnormalized_not_unitary is sqrt(4)≠1; neither tests the induced action or its Hilbert norm. The whole_group test is an actual specialization. |
| AS.1/convergent-intertwiner | sl2_spherical uses an arbitrary M without relating it to convergent_intertwiner; target_parabolic is merely an inhabited CLM type filled by sorry, not a Weyl-transport assertion. The identity quotient test alone matches the object. |
| AS.1/pseudo-eisenstein | split_torus states scalar Fourier inversion and wrong_entire_growth a scalar growth failure without linking either to pseudo_eisenstein or its allowed section. Add actual torus pseudo-Eisenstein and excluded-section statements. |
| AS.1/cuspidal-datum-space | inequivalent_same_levi is inequality of raw pairs and never mentions associate cuspidal data or their quotient. It cannot check whether the datum space wrongly merges inequivalent representations. |
| AS.1/yu-060 | test3 is 2 inverse ≠2 and does not apply the change-of-section map to a vector; the desired rho sign test must use yu_060. |
| AS.1/yu-153 | test1 and test3 are scalar arithmetic without the source/target section map or measure. normalizedSection alone does not test the full section transport and norm compensation. |
| AS.1/dit-57 | test1 only expands rpowC, without the Eisenstein constant term claimed by the packet. Retain the primitive-pair and divergence tests and add the actual constant-term asymptotic. |
| AS.1/dit-88 | test3 only says that a zero integer fails a nonzero-index condition. It must check the excluded zero-index case of the coefficient construction; the branch tests otherwise use the named sign helper. |
| AS.1/dit-89 | test3 only tests divergence of an unrelated exponential on a cusp interval. Connect it to the actual growing seed and failure of its Poincaré family to be L². |
| AS.1/dit-105 | test1 is 1·2≠1, test2 is interval-integral reversal for an arbitrary f, and test3 is existence of a bounded nondifferentiable function. None tests the smooth weight-two Poincaré one-form; test3 also misses the smooth seed with uncontrolled derivative convergence intended by the packet. |
| AS.1/gz-69 | nonprimitive is an unrelated inverse-square series ≠1; it must compare the primitive and unrestricted Eisenstein sums and their zeta factor. |
| AS.1/gz-179 | sign_pair and wrong_parity are scalar parity identities without the lattice sum or characters. They do not test cancellation or equality of the actual sign-paired series. |
| AS.1/gz-192 | odd_product is a scalar identity and nonfundamental is only ¬Squarefree(12). Neither checks the two character lattice sum or its required fundamental discriminant. |
| AS.2/local-intertwiner | p_adic_gl2_spherical asserts a formula for an arbitrary J without constructing the local integral; raw_not_unitary only evaluates a c-function. Add the actual unipotent integral on a spherical vector and its norm. |
| AS.2/mu-function | gl2_spherical only multiplies c-functions, while measure_scaling is a scalar inequality. Neither tests mu_function, its inverse convention, or a change of the two quotient measures. |
| AS.2/shahidi-normalization | orthogonal_parity is inequality of enum constructors and unitary_dual an identity of complex units. They do not check which local L-factor the normalization actually uses or the dual packet relation. |
| AS.2/yu-061 | test1 and test3 impose identity/cocycle conclusions on arbitrary M, and test2 only composes an equivalence with its inverse. Relate all three to the normalized function-field intertwiner yu_061. |
| AS.2/dit-91 | all three tests are arithmetic of spectral denominators. None applies the resolvent to an eigenvector or relates the parameter denominator to dit_91. |
| AS.3/truncation-cones | a2_distinction only states three numerical inequalities. Encode the A₂ root and dual-weight forms and apply the two named cutoff functions at the specified height. |
| AS.3/arthur-truncation | sl2_constant only evaluates an if expression and never arthur_truncation. Give the actual rank-one truncation datum and the truncated constant function. |
| AS.3/eisenstein-wave-packet | weyl_overcount is only (v+v)/2=v, with no packet map or compatible Weyl sections. The construction was moved to pointwise/truncated targets before the Gram theorem; the Weyl multiplicity test remains to be stated. |
| AS.3/yu-022 | test1 computes a total and an average without the block projection yu_022; test2 assumes x=0 and concludes x=0. The relative-root helper test is meaningful, but the two projection tests do not match the packet. |
| AS.3/yu-023 | test3 is n+m+k=m under n=k=0, without a parabolic height or cone cutoff. It does not test the central/Levi/unipotent factorization stated in the packet. |
| AS.3/yu-056 | test1 and test2 are scalar arithmetic without the canonical parabolic selector. Specify the block projection and actual maximal-parabolic selection/non-example. |
| AS.3/yu-115 | test1 expands floors without the named exponent function, and test3 only multiplies −z inverse by z without the cutoff factor. test2 tests the telescoping sum correctly. |
| AS.4/associate-parameter-fields | rank_zero and rank_one are inverse-one and division-by-two identities without the measurable field, Weyl relation or weighted norm. The stabilizer kernel helper also needs to be linked to the compatible-field subspace. |
| AS.4/residual-spectrum | sl2_constant computes a scalar Eisenstein residue but does not assert that the constant vector spans residual_spectrum; non_l2_pole only tests a cusp exponent. Add the actual subspace/membership statements. |
| AS.4/yu-017 | test1 is 1≠0 without the discrete space, and test3 is pointwise cancellation of a scalar denominator without the quotient measure. They do not test the norm on the stated quotient. |
| AS.4/yu-019 | test1 and test2 only permute raw tuples; test3 asserts equality of arbitrary sets without the good-pair normal form. None tests the constructed distinguished inducing representative. |
| AS.5/weighted-l2-complex | cusp_power only computes scalar integrability. Connect the power vector and its differential to membership in weighted_l2_complex, including the critical boundary. |
| AS.5/finite-character-functor | nilpotent_jordan states N²=0 and ker(N)≠top but never finite_character_functor. Both a generalized-character definition and the incorrect first-kernel definition pass this test. |
| AS.5/franke-filtration | rank_only_fails is only 0<1 and ¬1<1. It must give two constant-term exponents at the same parabolic rank whose filtration levels differ. |
| AS.5/eisenstein-principal-value | direction_dependence computes finite parts of z/z and 2z/z as two different one-variable germs. It does not evaluate one multivariable germ along two directions as the packet claims. |
| AS.6/automorphic-kernel | noncompact_diagonal only integrates the constant one on a half-line. Specify an actual periodized kernel and quotient for which its untruncated diagonal fails to be integrable. |
| AS.6/coarse-truncated-kernel | anisotropic assumes an arbitrary function is constant and rank_one only subtracts a from a+bT. Neither tests the coarse truncated kernel or its polynomial dependence. |
| AS.6/gm-family | rank_zero and rank_one are scalar finite-sum/limit formulas without gm_family; bad_wall is merely 1≠0. The tests need actual family data and rejection of unequal restrictions on a shared wall. |
| AS.6/weighted-orbital-integral | rank_one_volume and measure_scaling are scalar identities without the orbital integral, its convex-hull weight or quotient Haar measures. They do not distinguish a wrongly chosen weight. |
| AS.6/weighted-character | rank_one_derivative is only a derivative of CLM composition and normalization_change only differentiates exp at zero. Neither tests the weighted character trace or its change under scalar normalizing factors. |
| AS.6/almost-compact-test-space | fiberwise_only is merely that no finite set contains all naturals. It must exhibit a family with compact height fibres and unbounded K-types and assert failure of the uniform Γ condition. |
| AS.6/general-euler-poincare | all three tests are finite alternating arithmetic or trace(0)=0. None evaluates general_euler_poincare on a representation or the relative cochain complex. |
| AS.6/yu-024 | test3 is a−b≠a under b≠0, without the truncated kernel or fixed-degree trace. It cannot test that dropping a proper-parabolic term changes that trace. |
| AS.6/yu-049 | test2 is 1≠2 and does not compare the root and coroot products or a (G,M)-family wall condition. |
| AS.6/yu-151 | test1 multiplies arbitrary ones and degrees without the covering map or finite kernel. It does not compute the actual covering degree in the all-cycle-length-one case. |

For example, the nilpotent-Jordan test must assert that the generalized-character functor contains the whole two-dimensional Jordan block while the first kernel is proper. Its current assertion N²=0 and ker(N)≠top contains neither functor, so it does not distinguish the proposed definition from the tempting wrong one. Similarly, an escaping-support fact is useful in proving a strict LF boundedness criterion, but it is not an assertion that the translated family is unbounded in the proposed LF topology.

These are specific test mismatches, not a demand for more than three tests or for lemma-level proof refinement. The other definition/construction tests were checked as actual object or named specialization statements, within the honest carrier omissions permitted by the protocol.

## Baseline at the pins

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. I read each declaration and its enclosing hypotheses at these commits. No original baseline name was removed; the compact eigenbasis citation was added because its narrower eigenspace neighbour was insufficient for the use. Every near miss stays a planned extension or explicit gap. In particular, Schwartz maps with normed vector targets, Peter–Weyl on compact groups, finite-dimensional eigenbases and fixed compact Fredholm perturbations are not replanned as absent foundations.

| Declaration | Module | What the actual statement supplies and limits |
|---|---|---|
| mathlib:MeasureTheory.L2.inner_def | Mathlib/MeasureTheory/Function/L2Space.lean | For L² classes in an inner-product space, the inner product equals the integral of pointwise inner products. |
| mathlib:MeasureTheory.integral_prod | Mathlib/MeasureTheory/Integral/Prod.lean | Bochner Fubini for integrable functions under the module and s-finite product-measure hypotheses. |
| mathlib:MeasureTheory.integral_tsum | Mathlib/MeasureTheory/Integral/DominatedConvergence.lean | Countable AEStronglyMeasurable family with finite sum of norm integrals permits interchange of Bochner integral and sum. |
| mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le | Mathlib/Analysis/Calculus/ParametricIntegral.lean | Parameter-neighborhood differentiability with one integrable derivative majorant permits Fréchet differentiation under the integral. |
| mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le | Mathlib/Analysis/Calculus/ParametricIntegral.lean | RCLike parameter, eventual measurability, integrable value and derivative majorant give integrable derivative and differentiation under the integral. |
| mathlib:WithSeminorms.banach_steinhaus | Mathlib/Analysis/LocallyConvex/Barrelled.lean | Pointwise seminorm boundedness of continuous semilinear maps from a barrelled space gives uniform equicontinuity. |
| mathlib:Complex.regularizedHGFun | Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean | Regularized generalized hypergeometric power series with Pochhammer numerators and Gamma denominators. |
| mathlib:Complex.radius_regularizedHGFunSeries_eq_top | Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean | Infinite radius if the numerator multiset cardinal is at most the denominator multiset cardinal. |
| mathlib:Complex.betaIntegral_eq_Gamma_mul_div | Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean | For positive real parts, the beta integral equals Gamma(u)Gamma(v)/Gamma(u+v). |
| mathlib:Complex.Gamma_mul_Gamma_add_half | Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean | Legendre duplication with the factor 2^(1−2s)√π, using Mathlib totalized Gamma. |
| tauceti:TauCeti.stdPeterWeylBasis | TauCeti/RepresentationTheory/Compact/PeterWeyl.lean | Hilbert basis of L² of a compact group for Haar probability, indexed by irreducibles and pairs of matrix indices. |
| tauceti:IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul | TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean | A self-adjoint partial linear map on a complete complex Hilbert space is the generator iA of a unique unitary strongly continuous group. |
| mathlib:MonoidHom.measurePreserving | Mathlib/MeasureTheory/Measure/Haar/Unique.lean | For a continuous surjective group homomorphism with compact codomain, Borel topological groups and Haar measures of equal total mass, the homomorphism is measure preserving. |
| mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable | Mathlib/Analysis/Fourier/AddCircleMulti.lean | For a finite-dimensional unit torus, a continuous complex function with summable Fourier coefficients has its Fourier series converging to its value at every point. |
| mathlib:AddChar.expect_eq_ite | Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean | On a finite additive group with characteristic-zero semifield values, normalized expectation of a character is one when it is the trivial character and zero otherwise. |
| mathlib:UpperHalfPlane.cosh_dist | Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean | The hyperbolic cosh distance is 1+|z−w|²/(2 Im(z)Im(w)). |
| mathlib:UpperHalfPlane.tanh_half_dist | Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean | The hyperbolic tanh half-distance is |z−w|/|z−conj(w)|. |
| tauceti:TauCeti.vitali | TauCeti/Analysis/Complex/Conformal/Vitali.lean | For a locally bounded sequence of holomorphic scalar functions on an open preconnected complex domain, pointwise convergence on a subset with an interior accumulation point gives a holomorphic locally uniform limit. This is an interior theorem, not a boundary bound. |
| mathlib:SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean | Schwartz maps already support normed vector-valued targets; smoothness and all iterated Fréchet derivative decay are part of the definition. AS extends only to general quasi-complete locally convex targets. |
| mathlib:SchwartzMap.postcompCLM | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean | Postcomposition by a continuous linear map is a continuous linear map between normed vector-valued Schwartz spaces; pointwise evaluation and composition laws are existing. |
| mathlib:LinearMap.IsSymmetric.eigenvectorBasis | Mathlib/Analysis/InnerProductSpace/Spectrum.lean | For a finite-dimensional real/complex inner-product space and a symmetric linear endomorphism, gives a finite orthonormal eigenbasis sorted by eigenvalue. This is not an arbitrary infinite-dimensional compact-operator Hilbert basis. |
| tauceti:IsCompactOperator.finiteDimensional_eigenspace | TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean | A compact continuous linear endomorphism over a complete nontrivially normed field has finite-dimensional eigenspace at every nonzero eigenvalue. |
| tauceti:TauCeti.isFredholm_one_sub | TauCeti/Analysis/Fredholm/CompactPerturbation.lean | For a compact endomorphism of a complete normed space over a complete RCLike normed field, 1−K is Fredholm. No parameter-meromorphic inverse is supplied. |
| tauceti:ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector | TauCeti/Analysis/InnerProductSpace/Spectrum.lean | A compact symmetric continuous endomorphism of a complete real or complex Hilbert space admits a Hilbert basis of eigenvectors, without a separability assumption. Applied to A* A, it provides the compact positive spectral decomposition used in the singular-value construction. |

The Fubini and sum/integral inputs retain their integrability, measurability and S-finite requirements. Parameter differentiation uses the source's local dominated derivative bounds. Banach–Steinhaus requires barrelledness and the stated seminorm controls. Regularized hypergeometric functions include the reciprocal Gamma normalization. Haar transport needs continuity, surjectivity, compact codomain and equal total mass. Torus inversion needs continuity and absolute coefficient summability. Vitali is an interior theorem; it cannot justify a boundary limit on Re(s)=1/2. All these restrictions were considered at their consumer nodes.

## Public-source collation

All 29 original public PDF hashes matched the packet's recorded versions. The added Shapiro source is also hashed in `sources` and `sourceVersions`. The table records the exact public copies used. Checking a node against its cited passage does not claim that every paper it cites recursively has been read; those missing primary proof inputs remain gaps.

| ID | Public copy and version |
|---|---|
| yetter | [Measurable Categories](https://arxiv.org/pdf/math/0309185); arXiv:math/0309185v2, 6 September 2004 |
| teschl | [Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf); author PDF of second edition |
| arthur05 | [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf); Clay Mathematics Proceedings 4 (2005), 1–263 |
| langlands | [On the Functional Equations Satisfied by Eisenstein Series](https://publications.ias.edu/sites/default/files/functional-equations-eisenstein_rpl_8.pdf); IAS electronic transcription, 235 PDF pages, dated 2 December2015 and updated 22 July2016, of LNM544(1976); AppendixIII includes editorial reconstruction notices; not collated against the printed 337-page edition |
| langlands66 | [Eisenstein Series](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf); Proc. Sympos. Pure Math. 9 (1966), 235–252, IAS transcription |
| arthur78 | [A Trace Formula for Reductive Groups I: Terms Associated to Classes in G(Q)](https://www.claymath.org/library/cw/arthur/pdf/7.pdf); Duke Math. J. 45 (1978), 911–952 |
| arthur80 | [A Trace Formula for Reductive Groups II: Applications of a Truncation Operator](https://www.claymath.org/library/cw/arthur/pdf/9.pdf); Compositio Math. 40 (1980), 87–121 |
| arthur81 | [The Trace Formula in Invariant Form](https://www.claymath.org/library/cw/arthur/pdf/10.pdf); Annals of Math. 114 (1981), 1–74 |
| arthur82ms | [On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf); Duke Math. J. 49 (1982), 35–70 |
| arthur83pw | [Multipliers and a Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/17.pdf); 1983 expository article, Arthur archive no.17 |
| arthur83acta | [A Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/15.pdf); Acta Math. 150 (1983), 1–89 |
| arthur88local | [The Invariant Trace Formula I: Local Theory](https://www.claymath.org/library/cw/arthur/pdf/26.pdf); JAMS 1 (1988), 323–383 |
| arthur88global | [The Invariant Trace Formula II: Global Theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf); JAMS 1 (1988), 501–554 |
| arthur89weighted | [Intertwining Operators and Residues I: Weighted Characters](https://www.claymath.org/library/cw/arthur/pdf/28.pdf); J. Funct. Anal. 84 (1989), 19–84 |
| arthur89lefschetz | [The L²-Lefschetz Numbers of Hecke Operators](https://www.claymath.org/library/cw/arthur/pdf/32.pdf); Invent. Math. 97 (1989), 257–290 |
| clozeldelorme90 | [Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf); Ann. ENS 23 (1990), 193–228 |
| franke | [Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf); Ann. ENS 31 (1998), 181–279 |
| wallach | [On the Constant Term of a Square Integrable Automorphic Form](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf); Monogr. Stud. Math. 18 (1984), 227–237, author scan |
| yu23 | [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5); arXiv:1807.04659v5, 18 July 2022 (journal route labelled 2023) |
| jiangzhang20 | [Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4); arXiv:1508.03205v4 author preprint; route points to Annals of Mathematics191(2020),905–985; journal text not collated |
| dit16 | [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf); Annals of Math. 184 (2016), 949–990 |
| dit11 | [Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf); Annals of Math. 173 (2011), 947–981 |
| cg20 | [Minimal Modularity Lifting for Non-regular Symplectic Representations](https://arxiv.org/pdf/1907.08691); arXiv:1907.08691v1, July2019; source of the Duke2020 route |
| cgh20 | [Bloch–Kato Conjectures for Automorphic Motives](https://arxiv.org/pdf/1907.08694); arXiv:1907.08694v1, July2019 |
| bcg25 | [Cuspidal Cohomology of GLₙ(Z) and SLₙ(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf); author WeightZero PDF; route labelled 2025 |
| bpcz22 | [The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf); Publ. Math. IHES 135 (2022), 183–337 |
| ct20 | [Discrete Series Multiplicities for Classical Groups over Z and Level 1 Algebraic Cusp Forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf); Publ. Math. IHES 131 (2020), 261–323 |
| bcgp21 | [Abelian Surfaces over Totally Real Fields Are Potentially Modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf); Publ. Math. IHES 134 (2021), 153–501 |
| gz86 | [Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf); Invent. Math. 84 (1986), 225–320 |
| shapiro25 | [Functional Analysis: Princeton University MAT520 Lecture Notes](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf); Fall 2025; last typeset 10 December 2025 |

The source pass covered Yetter's measurable fields/direct integration; Teschl's spectral and Schatten statements; BPCZ Appendix A and the routed group/truncation passages; Arthur's cited truncation, Maass–Selberg, Paley–Wiener, local/global invariant and weighted/Lefschetz passages; Langlands' convergent construction/pairing and the stated residual interfaces; Franke's cited weights, filtration and Theorems 7, 14, 16–18; the specified consumer passages in CG/CGH/BCG/BCGP/CT and Wallach; Jiang–Zhang Appendix B; all routed Yu locators and the relevant Appendix A/B text; DIT 2011/2016; and the Gross–Zagier special-function, Green and Eisenstein passages. I inspected rendered formula pages where OCR was ambiguous, including DIT's Appendix A normalization, Gross–Zagier's special-function/Green formulas and Arthur's coefficient formula.

The IAS Langlands functional-equation transcription is not a collation with the printed 337-page LNM edition. Yu v5, Jiang–Zhang v4 and the CG/CGH arXiv texts were not silently equated with their journal versions. Franke–Schwermer 1998, Chaudouard's cited primary proof, Fay/Hejhal/Neunhöffer, the MW/Harish-Chandra/classification proof leaves, and Lafforgue's cited original passages have not been obtained and checked here as full primary proof sources. Their consumers remain conditional on the recorded gaps. Sources quoted by a paper are not certified merely because the quotation exists.

## Source-issue verdicts

Every source issue now has this review's own confirmed/rejected verdict and reason. There are **35 confirmed and 1 rejected**. Of the 14 input entries, 13 are confirmed. E3 is rejected: the DIT homogeneous-series Frobenius recurrence has nonzero higher coefficients' denominator ℓ(ℓ+2s−1) for Re(s)>0, and the differentiation is valid on the initial convergence chamber. This is routine proof work, not an established source error or missing prerequisite.

E1/E2 confirm the DIT sine-integral and Bessel-series normalization slips. E4/E5 preserve the separate zero-index, orbit-height/projector and parity details. E6–E8 distinguish the annular-domain qualification, the rho convention and Yu's author-reported Lafforgue correction; I did not independently collate Lafforgue's original or a journal repair. E9 confirms only that the printed O(1) bound is too weak for the claimed limiting argument, not that O(1) is false. E10 is the Gross–Zagier derivative factor; E11–E14 retain Arthur's inequality, tempered-domain, determinant-space and Clozel–Delorme correction scopes.

E15 adds Yetter **arXiv v2** Theorem 28's reversed Radon–Nikodym map direction: multiplication by sqrt(dμ/dν) maps L²(μ) to L²(ν). The printed reverse direction fails for counting μ on positive integers and ν({n})=2^(−n): one is L²(ν), but its claimed image 2^(n/2) is not L²(μ). The proof uses the correct direction. The journal PDF was unavailable through the inspected endpoint; a bounded erratum search found no correction, which is not a claim of novelty or of a journal error.

E16–E36 independently recheck the relevant existing PAPER-YU-23 entries E6, E7, E10–E13, E24, E26, E29, E30, E32, E34–E39, E41, E42, E48 and E55 against v5. They include the affine height, modulus/degree sign, cutoff-times-theta convention, character/conductor/covolume/stabilizer indexing and coprimality restrictions. They are existing extraction findings corroborated here, not newly discovered journal errata. The false order-of-a-sum identity has the concrete c=2,e=a=1 counterexample. The noncoprime A₂ assertion has the GL₂ torus, degree-zero, μ=(i,−i) counterexample; the paper's main coprime theorems are not rejected on that account. Component Haar normalization is now explicit in the blueprint.

## Assigned red-team findings and reader reconciliation

| Finding | Packet review | Reader/action for revision |
|---|---|---|
| RT-AREA-automorphic-1/4 | AS.2 has local integral, μ and normalization targets; AS.6 has the real invariant/operator PW and multiplier targets. BDK and full HC proof inputs are honest supplier-extension gaps. | Export a real harmonic-analysis prefix before ET.1, as the finding's independent verification requires. ET.1 cannot import the whole final AS.6 stage, which itself imports ET.1's orbital theory. |
| RT-AREA-automorphic-1/5 | AS.1 has the convergent global intertwiner before its constant term, and pseudo-Eisenstein L²/pairing/cuspidal decomposition before AS.2 continuation. AS.3 constructs packets before Gram identities; AS.4 keeps the distinct onto theorem. Corrected the pre-Gram construction argument. | The reader's coarse distinction and ordering are right. Mirror the pointwise/truncated construction qualification and remove any suggestion that individual Eisenstein vectors are global L² before packet formation. Repair the object tests listed above. |
| RT-AREA-automorphic-1/24 | Unweighted quotient orbital integrals remain ET.1-owned. AS.6 imports them and builds the actual convex-hull/family weight inside the integral, retaining singular estimates as gaps. | Preserve that boundary. The scalar rank-one and measure-scaling test stand-ins must be replaced by actual weighted integral statements. |

The issue permits packet, suggested file and review edits, not the reader document. The revision must reconcile that document with all corrections in this report, particularly: the compact-Cartan hypothesis; component probability Haar; the deleted cuspidal-cohomology duplicate and its downstream link; AF.2/AL.1 owners; ET/GN Part II qualifications; the Herglotz and compact eigenbasis baselines; DIT/Whittaker/Gamma normalization and locators; the Green group index; BPCZ item-specific routing; the classical/unitary Laplacian dictionary; and the revised remaining lists. These discrepancies are reported here rather than silently editing another deliverable.

## Checks and Lean status

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json` reports **0 errors, 0 warnings** after the review object and normalization edits. The review ledger covers all retained node IDs once; all source issues have independent verdicts. The final diff is confined to this issue's packet, suggested file, report and own handoff. No runtime application data, supplier packet, upstream roadmap or reader was edited.

The full `lean-check research/blueprint/suggested/AutomorphicSpectralTheory.lean` fails immediately because the shared build lacks `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded.olean`. No dependencies were built and no package was fetched. With the four Tau imports temporarily commented, the same file elaborated against the pinned Mathlib with only declaration-uses-sorry warnings; all four imports were restored. This is a **Mathlib-only diagnostic**, not a successful compilation of the submitted full file. The four imported Tau source modules are unchanged between the pinned Tau commit and the shared checkout, but that does not supply their missing object files. Available memory was above 20 GB at each compile; only one check ran at a time and none remains running.

## Questions for the orchestrator / revision scope

1. Name the reusable real harmonic-analysis prefix before ET.1, retaining the AS ownership of the full weighted and invariant trace theory. An AF Part II prefix or an early AS prefix is sufficient; a final-stage ET.1↔AS.6 cycle is not.
2. Assign precise new supplier nodes for HC estimates/classification/c-functions, smooth globalization, Shahidi classical factors/packets, function-field root/cycle/core adapters, weighted χ projections and compact Siegel cutoffs. Current-stage carrier names do not supply those extended theorems.
3. Reconcile the ALS.5 owner of cuspidal cohomology with AS.5's separate weighted/L² comparison. The owner statement is already broad enough; avoid restoring the deleted duplicate.
4. Revise the false continuation signatures and the itemized packet/Lean test mismatches, mirror the clear corrections into the reader, and submit a new independent review. Existing honest primary-proof gaps can remain explicit; no additional job was claimed by this reviewer.

## Retained-node review ledger

The authoritative detailed notes are in `packet.review.checked`; the table accounts for every retained node and makes the verdict counts auditable. Verified means the planned target and its disclosed limits were checked, not formalized or proof-closed. Corrected means the clear defect was repaired with justification. Unverifiable identifies an unresolved signature/test discrepancy above, including nodes whose source or ownership corrections are already applied.

| Node | Verdict |
|---|---|
| AS.0/measurable-hilbert-field | corrected |
| AS.0/direct-integral | corrected |
| AS.0/decomposable-operator | unverifiable |
| AS.0/isometric-integration-map | verified |
| AS.0/projection-valued-measure | verified |
| AS.0/herglotz-representation | corrected |
| AS.0/unbounded-selfadjoint-spectral | verified |
| AS.0/bounded-normal-spectral | corrected |
| AS.0/hilbert-schmidt | unverifiable |
| AS.0/trace-class | unverifiable |
| AS.0/kernel-trace-diagonal | verified |
| AS.0/nuclear-lf-space | unverifiable |
| AS.0/locally-convex-integration | verified |
| AS.0/projective-tensor | verified |
| AS.0/vector-schwartz | verified |
| AS.0/operator-meromorphic | unverifiable |
| AS.0/analytic-fredholm | verified |
| AS.0/distribution-convergence | verified |
| AS.0/vector-phragmen-lindelof | verified |
| AS.1/induced-family | unverifiable |
| AS.1/eisenstein-series | verified |
| AS.1/eisenstein-convergence | verified |
| AS.1/convergent-intertwiner | unverifiable |
| AS.1/cuspidal-constant-term | verified |
| AS.1/pseudo-eisenstein | unverifiable |
| AS.1/pseudo-eisenstein-l2 | verified |
| AS.1/pseudo-eisenstein-inner-product | verified |
| AS.1/cuspidal-datum-space | unverifiable |
| AS.1/cuspidal-data-orthosum | verified |
| AS.2/local-intertwiner | unverifiable |
| AS.2/mu-function | unverifiable |
| AS.2/local-normalization | verified |
| AS.2/eisenstein-continuation | verified |
| AS.2/intertwiner-factorization | corrected |
| AS.2/residue-calculus | corrected |
| AS.2/shahidi-normalization | unverifiable |
| AS.2/generic-standard-module | corrected |
| AS.2/tempered-gl-intertwiner | verified |
| AS.2/tempered-standard-intertwiner | verified |
| AS.2/generic-normalized-intertwiner | verified |
| AS.2/jiang-zhang-holomorphy | verified |
| AS.3/truncation-cones | unverifiable |
| AS.3/arthur-truncation | unverifiable |
| AS.3/truncation-projection | verified |
| AS.3/truncation-rapid-decay | verified |
| AS.3/cuspidal-maass-selberg | verified |
| AS.3/discrete-maass-selberg-asymptotic | verified |
| AS.3/eisenstein-wave-packet | unverifiable |
| AS.3/wave-packet-gram | verified |
| AS.3/singular-parameter-limits | verified |
| AS.4/associate-parameter-fields | unverifiable |
| AS.4/spectral-map | verified |
| AS.4/spectral-orthosum | verified |
| AS.4/residual-spectrum | unverifiable |
| AS.4/discrete-finite-multiplicity | verified |
| AS.4/hecke-central-compatibility | verified |
| AS.4/compact-quotient-spectrum | verified |
| AS.4/gl2-spectral-expansion | verified |
| AS.4/modular-weyl-estimates | verified |
| AS.4/wallach-cuspidality | verified |
| AS.5/weighted-l2-complex | unverifiable |
| AS.5/weighted-regularization | verified |
| AS.5/finite-character-functor | unverifiable |
| AS.5/derived-finite-character | verified |
| AS.5/franke-filtration | unverifiable |
| AS.5/eisenstein-principal-value | unverifiable |
| AS.5/franke-graded-isomorphism | verified |
| AS.5/weighted-finite-character-acyclic | verified |
| AS.5/constant-term-resolution | verified |
| AS.5/franke-comparison | verified |
| AS.5/gl-sl-cuspidal-diagram | corrected |
| AS.2/isobaric-sum | corrected |
| AS.5/franke-schwermer-support | verified |
| AS.5/isobaric-realization | verified |
| AS.6/real-invariant-paley-wiener | verified |
| AS.6/real-operator-paley-wiener | corrected |
| AS.6/spectral-multiplier | verified |
| AS.6/automorphic-kernel | unverifiable |
| AS.6/coarse-truncated-kernel | unverifiable |
| AS.6/coarse-trace-identity | verified |
| AS.6/gm-family | unverifiable |
| AS.6/gm-splitting | verified |
| AS.6/weighted-orbital-integral | unverifiable |
| AS.6/weighted-character | unverifiable |
| AS.6/fine-geometric-expansion | verified |
| AS.6/fine-spectral-expansion | verified |
| AS.6/almost-compact-test-space | unverifiable |
| AS.6/invariant-recursion | verified |
| AS.6/invariant-trace-formula | verified |
| AS.6/compact-trace-specialization | verified |
| AS.6/general-euler-poincare | unverifiable |
| AS.6/l2-lefschetz | corrected |
| AS.1/yu-010 | corrected |
| AS.4/yu-017 | unverifiable |
| AS.4/yu-018 | corrected |
| AS.4/yu-019 | unverifiable |
| AS.4/yu-020 | corrected |
| AS.4/yu-021 | corrected |
| AS.3/yu-022 | unverifiable |
| AS.3/yu-023 | unverifiable |
| AS.6/yu-024 | unverifiable |
| AS.6/yu-025 | corrected |
| AS.6/yu-038 | corrected |
| AS.6/yu-039 | corrected |
| AS.6/yu-047 | corrected |
| AS.6/yu-048 | corrected |
| AS.6/yu-049 | unverifiable |
| AS.6/yu-050 | corrected |
| AS.6/yu-051 | corrected |
| AS.6/yu-052 | corrected |
| AS.6/yu-053 | corrected |
| AS.6/yu-054 | corrected |
| AS.6/yu-055 | corrected |
| AS.3/yu-056 | unverifiable |
| AS.3/yu-058 | corrected |
| AS.3/yu-059 | corrected |
| AS.1/yu-060 | unverifiable |
| AS.2/yu-061 | unverifiable |
| AS.6/yu-062 | corrected |
| AS.6/yu-063 | corrected |
| AS.4/yu-065 | corrected |
| AS.2/yu-066 | corrected |
| AS.3/yu-115 | unverifiable |
| AS.3/yu-116 | corrected |
| AS.3/yu-117 | corrected |
| AS.0/yu-145 | verified |
| AS.0/yu-146 | verified |
| AS.0/yu-147 | verified |
| AS.0/yu-148 | unverifiable |
| AS.0/yu-149 | unverifiable |
| AS.0/yu-150 | verified |
| AS.6/yu-151 | unverifiable |
| AS.6/yu-152 | corrected |
| AS.1/yu-153 | unverifiable |
| AS.3/yu-157 | corrected |
| AS.6/yu-164 | corrected |
| AS.6/yu-165 | corrected |
| AS.4/yu-166 | corrected |
| AS.6/yu-169 | verified |
| AS.3/yu-175 | corrected |
| AS.1/dit-57 | unverifiable |
| AS.1/dit-58 | corrected |
| AS.2/dit-59 | corrected |
| AS.2/dit-60 | verified |
| AS.1/dit-88 | unverifiable |
| AS.1/dit-89 | unverifiable |
| AS.1/dit-90 | verified |
| AS.2/dit-91 | unverifiable |
| AS.2/dit-92 | verified |
| AS.2/dit-93 | verified |
| AS.2/dit-94 | verified |
| AS.1/dit-105 | unverifiable |
| AS.1/dit-110 | verified |
| AS.0/dit-112 | corrected |
| AS.0/dit-113 | verified |
| AS.0/dit-114 | corrected |
| AS.0/dit-115 | verified |
| AS.0/dit-118 | verified |
| AS.4/dit-138 | verified |
| AS.0/dit-165 | verified |
| AS.4/dit-wrong-sign-weyl-integrals-vanish | corrected |
| AS.4/dit-eisenstein-integrable-over-core | corrected |
| AS.1/dit-fourier-expansion-weight0-poincare | verified |
| AS.2/dit-resolvent-fourier-expansion-weight0 | verified |
| AS.0/dit-appendix-a2-series-of-whittaker-cycle-integral | verified |
| AS.0/dit-appendix-a3-series-of-rhs | verified |
| AS.0/dit-appendix-a-leading-coefficient-match | verified |
| AS.0/gz-64 | corrected |
| AS.0/gz-65 | verified |
| AS.0/gz-66 | corrected |
| AS.2/gz-68 | verified |
| AS.1/gz-69 | unverifiable |
| AS.1/gz-70 | verified |
| AS.0/gz-108 | verified |
| AS.1/gz-179 | unverifiable |
| AS.1/gz-192 | unverifiable |
| AS.0/gz-207 | verified |
| AS.1/gz-208 | verified |
| AS.1/gz-209 | verified |
| AS.0/gz-212 | verified |
| AS.0/gz-213 | verified |
| AS.0/gz-214 | corrected |
| AS.0/gz-215 | verified |
| AS.0/gz-216 | verified |
| AS.0/gz-217 | verified |
| AS.1/gz-241 | verified |
| AS.1/gz-265 | verified |
| AS.0/schwartz-family-continuation | unverifiable |
| AS.0/lf-dual-continuation | unverifiable |
| AS.2/automorphic-green | verified |

Removed input node: AS.5/cuspidal-cohomology-decomposition, replaced by the import ALS.5/cuspidal-cohomology. Added nodes: none. New proof obligations are explicit gaps, respecting the target-level review instruction.

## Field-by-field correction ledger

This table records every retained packet node changed in place. Suggested-only corrections are listed after it; the prose above supplies the mathematical reasons.

| Node | Changed fields |
|---|---|
| AS.0/measurable-hilbert-field | tests |
| AS.0/direct-integral | tests |
| AS.0/herglotz-representation | sources |
| AS.0/trace-class | proofSteps, prerequisites, sources |
| AS.2/intertwiner-factorization | prerequisites |
| AS.2/residue-calculus | api |
| AS.2/shahidi-normalization | prerequisites |
| AS.2/generic-standard-module | prerequisites |
| AS.3/truncation-cones | sources |
| AS.3/eisenstein-wave-packet | proofSteps, acceptance |
| AS.5/gl-sl-cuspidal-diagram | prerequisites |
| AS.2/isobaric-sum | statement, acceptance |
| AS.6/real-operator-paley-wiener | sources |
| AS.6/l2-lefschetz | hypotheses, prerequisites, sources |
| AS.1/yu-010 | hypotheses |
| AS.4/yu-017 | hypotheses |
| AS.4/yu-018 | hypotheses |
| AS.4/yu-019 | hypotheses |
| AS.4/yu-020 | hypotheses |
| AS.4/yu-021 | hypotheses |
| AS.3/yu-022 | hypotheses, prerequisites |
| AS.3/yu-023 | hypotheses, prerequisites |
| AS.6/yu-024 | hypotheses |
| AS.6/yu-025 | hypotheses |
| AS.6/yu-038 | hypotheses, proofSteps, prerequisites, sources, tests |
| AS.6/yu-039 | hypotheses |
| AS.6/yu-047 | hypotheses |
| AS.6/yu-048 | hypotheses |
| AS.6/yu-049 | hypotheses |
| AS.6/yu-050 | hypotheses |
| AS.6/yu-051 | hypotheses |
| AS.6/yu-052 | hypotheses |
| AS.6/yu-053 | hypotheses |
| AS.6/yu-054 | hypotheses |
| AS.6/yu-055 | hypotheses |
| AS.3/yu-056 | hypotheses |
| AS.3/yu-058 | hypotheses |
| AS.3/yu-059 | hypotheses |
| AS.1/yu-060 | hypotheses |
| AS.2/yu-061 | hypotheses |
| AS.6/yu-062 | hypotheses |
| AS.6/yu-063 | hypotheses |
| AS.4/yu-065 | hypotheses |
| AS.2/yu-066 | hypotheses |
| AS.3/yu-115 | hypotheses |
| AS.3/yu-116 | hypotheses |
| AS.3/yu-117 | hypotheses |
| AS.6/yu-151 | hypotheses, prerequisites |
| AS.6/yu-152 | hypotheses |
| AS.1/yu-153 | hypotheses |
| AS.3/yu-157 | hypotheses, prerequisites |
| AS.6/yu-164 | hypotheses, prerequisites |
| AS.6/yu-165 | hypotheses, prerequisites |
| AS.4/yu-166 | hypotheses, prerequisites |
| AS.3/yu-175 | hypotheses |
| AS.1/dit-58 | prerequisites, sources |
| AS.2/dit-59 | sources |
| AS.1/dit-105 | statement, sources |
| AS.0/dit-112 | api, tests |
| AS.0/dit-114 | sources |
| AS.4/dit-wrong-sign-weyl-integrals-vanish | prerequisites |
| AS.4/dit-eisenstein-integrable-over-core | hypotheses, proofSteps |
| AS.1/gz-179 | prerequisites |
| AS.1/gz-192 | proofSteps, prerequisites |
| AS.0/gz-214 | statement |
| AS.0/lf-dual-continuation | statement, proofSteps |

Suggested-only node corrections: AS.0/bounded-normal-spectral (separability), AS.0/gz-64 (Gamma normalization and actual endpoint integrand), and AS.0/gz-66 (full effective group divergence and actual singularity integrand). The measurable-field/direct-integral, Whittaker, residue, normalized-V, Green, wave-packet and compact-Cartan signature qualifications mirror their corresponding packet corrections. Top-level edits: baseline declarations, sources/versions, supplier requests, sourceRouting, coverage, gaps, sourceIssues and review. No planet was renamed.
