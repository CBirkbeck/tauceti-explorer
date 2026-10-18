# Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: the p-converse

This roadmap assembles the converse proved by Christopher Skinner in *A converse to a theorem of Gross, Zagier, and Kolyvagin*, Annals of Mathematics **191** (2020), 329–354. Its parent is [RankZeroOneBSD](RankZeroOneBSD.md). The parent starts with a simple zero of an actual complex L-function and obtains a point and finite Tate–Shafarevich group. Here the starting datum is a rational Selmer line with injective localization. An anticyclotomic reverse divisibility rules out a zero of a p-adic L-function at augmentation; the logarithm formula produces a Heegner point, and the existing complex height formula supplies the simple zero. This gives Theorem B. Suitable quadratic fields then give Theorems A, A′, C and E.

The unit of planning is a mathematical target. Proof details stay with that target; general Selmer theory, CM-point geometry, the complex and p-adic Gross–Zagier formulas, congruence constructions and Euler-system descent keep their existing owners. In particular, the statistical theorem quoted as Theorem D on p. 332 is already `ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one`: the lower density of rational elliptic curves having both ranks one is positive under the unique minimal-short-pair height max(4|A|³,27B²). It consumes the converse. There is no dependency from this proof back to statistics.

Independent review [REV-DESIGN-SKINNER](../reviews/REV-DESIGN-SKINNER.md) accepts this planning pass. All seven layers below are **planned**, with exact supplier requests. The packet is **complete** at target level, but no layer is claimed closed and no declaration is claimed implemented. The definitive specification is this document together with the packet. The compact [suggested file](../suggested/RankOneConverse.lean) contains only the localization predicate and vector-space milestones that can already be stated at the pinned libraries. Heavy arithmetic definitions and the final arithmetic theorem statements remain targets here; proposition records do not substitute for their missing carriers.

## Conventions and theorem boundary

Let f be a normalized weight-two cuspidal newform of level N and trivial nebentypus. In the converse targets N is squarefree. Write M for its totally real Hecke field, A=A_f for the associated modular abelian variety up to rational isogeny, and d=[M:ℚ]=dim A. The M-action is part of the modular realization. The actual complex L-functions satisfy L(A,s)=∏_σ L(f^σ,s), with σ ranging over all real embeddings. The motivic central point is s=1; the unitary automorphic center is 1/2. Orders always refer to analytic continuations identified with the genuine Euler products, not freely chosen analytic germs.

Fix p≥5, λ|p and a finite extension L/M_λ with ring of integers O. Use the geometric Tate realization V=V_p(A)⊗_(M⊗ℚ_p)L and a stable O-lattice T. Thus V has dimension two over L, dual V*≅V(−1), and Hodge–Tate weights 0 and −1. This is a different convention from a cohomological realization; the comparison must precede any parity or ordinary-filtration invocation. Ordinarity means a_p(f) is a λ-adic unit. Good coefficient prime means p∤N. The residual representation is the semisimplification of a stable-lattice reduction; the existence of a nontrivial unipotent at a squarefree bad prime is checked on that actual local representation.

Let K/ℚ be imaginary quadratic of fundamental discriminant D, with D odd, 2 split and p=𝔭𝔭̄ split. Fix the embeddings defining those primes and the matching coefficient embedding on M. Complex conjugation exchanges the local spaces; it is never treated as an endomorphism fixing the chosen prime. Set S to contain the places over the rational primes dividing pND, together with infinity in global cohomology notation. Cohomology is continuous, with compact, discrete or rational coefficient topology as appropriate. All local-condition and restriction maps use the canonical supplier carriers.

H¹_f denotes the Bloch–Kato finite condition. At v|p it is the kernel of the map to crystalline-period cohomology; on T it is its inverse image and on V/T its propagated image. At v∤p it is the rational unramified condition. Purity in this particular geometric representation makes the entire rational local H¹ vanish away from p. This says nothing that would erase finite-level Tamagawa corrections. The global finite Selmer group is the kernel of restriction modulo these finite local subspaces. Its λ-dimension is rank(A(K))/d when the relevant p-primary Sha is finite, by the coefficient-compatible Kummer sequence.

Theorem B has exactly five hypotheses beyond the standing newform, squarefree-level, p≥5 and odd-D assumptions:

1. p∤N and λ-ordinarity.
2. Global residual irreducibility and ramification at an **odd** level prime nonsplit in K.
3. Both 2 and p split in K.
4. **If** gcd(D,N)>1, every common level/discriminant prime has local type St⊗ξ for the nontrivial unramified quadratic character ξ, and every other level prime splits.
5. The global finite Selmer group is an L-line, and its actual restriction into the product of the finite local spaces at p is injective.

The conditional in item 4 matters: when gcd(D,N)=1 it is vacuous, so Case II with a nonempty even set of inert primes is allowed. Items 1–5 imply analytic order one for L(f/K), analytic order d for L(A/K), Mordell–Weil rank d and finiteness of the **entire** Sha(A/K). They do not merely bound one primary component.

Theorem A starts over ℚ with rank(A(ℚ))=d and finite entire Sha, and retains either an odd St⊗ξ prime or two distinct odd St primes. A′ is its semistable elliptic specialization. C replaces arithmetic rank and Sha finiteness by a mod-p Selmer line and a local image avoiding the p-torsion image, at a specified good ordinary p with irreducible E[p]. E uses rational rank zero with finite Sha and the same local alternatives. The CM comparisons and broader main-conjecture rank-zero converses recalled on p. 330 are context with `ModularIwasawaMainConjectures:L5`; squarefree f is non-CM here. The nonordinary prospects in Remark 2.9.1 are not unconditional extensions of these targets.

## Ownership and pinned baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual Lean declarations at those objects were read, including their hypotheses. The reviewed `data/library-coverage.json` entries for BSD, Selmer, Iwasawa algebras, heights and Heegner descent were checked before planning. A second read-only audit checked TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine roadmaps added after the atlas snapshot. None supplies a new p-converse target that should be imported instead of planned here. No upstream build or edit was made.

| Existing substrate | Exact declaration or roadmap | Use here |
|---|---|---|
| Finite vector-space dimension | Mathlib `Module.finrank` | The rational line condition; source finite dimensionality is explicit. |
| Kernel and paired restriction maps | Mathlib `LinearMap.ker`, `LinearMap.fst`, `LinearMap.snd`, `LinearMap.prod` | Strict, one-sided and semilocal linear algebra. |
| Continuous cohomology | Mathlib `continuousCohomology`, `RepresentationTheory/Homological/ContCohomology/Basic.lean`, line 131 | Existing homogeneous-cochain homology; arithmetic duality and finite conditions are additional interfaces. |
| Abelian varieties and tangent spaces | Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety` and `.TangentSpace` | Reuse the geometric carrier and tangent module. |
| Explicit 2-descent | Tau Ceti `WeierstrassCurve.Affine.selmerGroup₂` | A concrete square-class subgroup, not an odd-p or rational Bloch–Kato Selmer group. |
| Abstract elliptic Selmer and Sha | TauCetiRoadmap **EllipticCurves, Layer 7** | Reuse its discrete general Selmer structure, finite Kummer sequence, finiteness and isogeny targets. |

EllipticCurves Layers 1, 3 and 4 also own the formal group, Hasse bound and reduction filtration used in the local torsion calculation. Its Layer 7 starts with general discrete Selmer structures. Requests to `SelmerIwasawaCohomology` concern comparisons and p-adic/rational local conditions on those objects, not another construction of these existing roadmap targets. Current upstream's concrete 2-descent result does not close the rational Selmer or full-Sha obligations.

`HeegnerPointEulerSystems:HE.1` owns rational CM points, trace from ring class fields, Jacobian classes and parametrization choices. `GrossZagierAndArithmeticHeights:GZ.3` supplies Hodge normalization and rational GL₂ realizations; GZ.8 supplies the complex height formula; GZ.9 supplies the integral anticyclotomic measure, weight-two logarithm formulas and the eigenlogarithm theorem. `AutomorphicCongruences:L2` supplies the ordinary Wan congruence/Fitting input. `SelmerIwasawaCohomology:L1–L4` supplies duality, arithmetic local conditions, control and parity. `PadicMeasuresIwasawaAlgebras:L4–L5` owns characteristic divisors and specialization algebra. `HeegnerPointEulerSystems:HE.7`, using `EulerSystemsAndKolyvaginSystems:ES.4`, owns full arithmetic descent. Higher generalized Heegner cycles enter through the existing GZ.9 and congruence suppliers, not through a second cycle construction here.

Two limitations of the available exact nodes determine the requests. The classical forward nodes in BSD.3–4 are elliptic; they do not automatically prove the GL₂-type assertion for A_f or its nonsquarefree twist. The existing HE.7 admissible-RM node also has maximal endomorphism order and non-CM conditions that require an isogeny/realization bridge. Similarly, the elliptic all-split anticyclotomic control node in HE.8b is not a control theorem for arbitrary A_f with ramified Case I or quaternionic Case II. Each needed extension stays with its supplier, with the precise statement listed below.

## PC.0. Squarefree local data and Heegner normalization

The global sign dictates which curve contains the CM divisor. A split finite prime contributes +1 to the base-change sign. For St, an inert or ramified prime contributes −1. For St⊗ξ, an inert prime contributes −1 while a ramified prime contributes +1. The archimedean contribution is −1. Thus a ramified St⊗ξ prime with all other level primes split gives the required global sign, as do two inert level primes. The local epsilon dictionary is imported from R16.3.

The normalization at an auxiliary Hecke prime removes a degree without making an arbitrary choice of basepoint. The rational Hodge-divisor representative must be retained before extension of coefficients: it is the actual algebraic point to which the eigenlogarithm theorem applies. The coefficient projector ε_f is more refined than the rational projector onto the Galois orbit. In degree greater than one one cannot simplify φε_f to φ.

**Layer inputs.** AutomorphicGaloisRepresentations:R19.6; AutomorphicGaloisRepresentations:R19.4; GL2AutomorphicRepresentationsAndTransfer:R16.3; HeegnerPointEulerSystems:HE.1; GrossZagierAndArithmeticHeights:GZ.3; AutomorphicGaloisRepresentations:R19.1; GL2AutomorphicRepresentationsAndTransfer:R17.3; GrossZagierAndArithmeticHeights:GZ.9.

### Irreducibility over the quadratic field

**Target:** `PC.0/residual-restriction` (lemma). Let f,N,p,λ,K,V be as in the common conventions. If the residual representation is irreducible over G_ℚ and ramified at an odd q|N which is inert or ramified in K, its restriction to G_K is irreducible.

**Hypotheses and conventions.** At q||N the residual inertia is nontrivial unipotent; p is odd.

**Argument and dependencies.** Use local-global compatibility at the squarefree bad prime to obtain a nontrivial residual unipotent τ. τ² belongs to G_K and remains nontrivial in odd characteristic. A G_K-invariant line must therefore be its unique fixed line. Normality of G_K makes that unique line G_ℚ-stable, contradicting irreducibility.

Direct inputs: AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform; AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility.

**Checks.** Retain ramification at q; irreducibility over an index-two subgroup does not follow from global irreducibility alone. The conclusion is restriction to G_K, correcting the omitted restriction in the printed contradiction.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.8, Lemma 2.8.1, p. 347. The odd-characteristic unipotent restriction argument.

### The two admissible Heegner geometries

**Target:** `PC.0/heegner-cases` (comparison). Assume the common conventions, w(f/K)=−1, a residual ramified odd prime nonsplit in K, and the ramified-level condition: if gcd(D,N)>1, every q|gcd(D,N) has local type St twisted by the unramified quadratic character and every q|N/gcd(D,N) splits. Then either Case I holds (all q|N split or ramify), or Case II holds (gcd(D,N)=1 and N=N⁺N⁻, with N⁻ the product of a nonempty even number of inert primes and all q|N⁺ split).

**Hypotheses and conventions.** The ramified-level condition is conditional on gcd(D,N)>1; for coprime D it imposes no splitting condition.

**Argument and dependencies.** Apply the imported local epsilon-factor dictionary, with the archimedean contribution included. If a level prime ramifies, the stated condition gives Case I. Otherwise the global sign makes the number of inert level primes even. The residual nonsplit prime makes the inert set nonempty when there is no ramification. Export the corresponding modular or indefinite quaternionic CM-point input.

Direct inputs: GL2AutomorphicRepresentationsAndTransfer:R16.3; HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points.

**Checks.** The coprime case with two inert primes is admitted. A ramified Steinberg prime without the unramified quadratic twist is rejected in Case I. N⁻ has even cardinality, not odd.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §§2.1.2, 2.4, pp. 335–336, 339–340. The sign computation selects the modular or indefinite quaternionic curve.

### The normalized f-Heegner point

**Target:** `PC.0/normalized-heegner-point` (construction). In Case I or II, import the CM divisor D_K on the appropriate curve X, its Jacobian J, a Hecke-equivariant quotient φ:J→A_f and the coefficient projector ε_f. For an auxiliary prime ℓ away from pND set D_K,ℓ=(T_ℓ−1−ℓ)D_K and Q_K(f)=ε_f[D_K,ℓ]/(a_ℓ(f)−1−ℓ) in J(K)⊗M; put P_K(f)=φQ_K(f). Writing ξ for the degree-one rational Hodge class, set Q_K^ξ=[D_K−deg(D_K)ξ] in J(K)⊗ℚ. Then Q_K(f)=ε_f Q_K^ξ is independent of ℓ; in the modular case the cusp-normalized divisor gives the same projection.

**Hypotheses and conventions.** The Hecke idempotent selects the chosen coefficient embedding, rather than merely the rational Galois orbit. The quotient, CM descent and normalized degree-one Hodge class are supplier objects.

**Argument and dependencies.** The degree of T_ℓ is 1+ℓ, so D_K,ℓ has degree zero. The Weil bound gives |a_ℓ|≤2√ℓ<1+ℓ at every complex embedding, hence the denominator is nonzero. Project the Hecke relation to the f-component. Eisenstein and cusp corrections vanish under that projector. Compare with the rational Hodge-divisor representative before coefficient projection; preserve that actual rational point for the eigenlogarithm theorem.

Direct inputs: HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent; HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators; GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation; GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization; AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.

**Uses.** PC.3 and Skinner Proposition 2.5.1: Identify the point in the height identity. PC.1 arithmetic localization and PC.3 logarithmic comparison: Supply an actual rational point before projection, needed by the eigenlogarithm input.

**API.** Names below are in the `RankOneConverse` namespace; heavy objects are README signatures.

- `HeegnerPoint.auxiliary_prime_independent` (characterisation): Every permitted auxiliary prime gives the same Q_K(f).
- `HeegnerPoint.hodge_representative` (compatibility): Q_K(f)=ε_f Q_K^ξ with Q_K^ξ rational before coefficient extension.
- `HeegnerPoint.quotient` (functoriality): For a Hecke-equivariant isogeny u, u(P_K(f)) is the point for uφ.
- `HeegnerPoint.eigenlog` (compatibility): For the matching eigendifferential ω, log_ω P_K(f)=log_ω φ(Q_K^ξ).

**Discriminating unit tests.**

- `HeegnerPoint.normalizing_factor` (computation): If ℓ=2 is permitted and a₂(f)=0, writing u=φε_f[D_K,2] gives P_K(f)=−u/3. For u≠0 this rejects both the zero construction and omission of the denominator.
- `HeegnerPoint.eisenstein` (degenerate): An Eisenstein correction to the degree-zero divisor has zero f-projection.
- `HeegnerPoint.cusp_hodge` (compatibility): When X=X₀(N), the cusp and normalized Hodge choices have equal f-projection.
- `HeegnerPoint.scaling` (computation): Replacing φ by mφ multiplies P_K(f) by m and its logarithm by m, not m².

**Checks.** The point used in the complex and p-adic formulas is this same P_K(f). No assertion φε_f=φ is made for the coefficient idempotent.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.4, pp. 339–340. The Hecke-normalized point and its cusp/Hodge comparison.

### Rational transfer and differential normalization

**Target:** `PC.0/transfer-differential` (comparison). For the Case II transfer f_B choose its rational structure and a nonzero invariant M-eigendifferential ω on A_f so that φ*ω=ω_f. Changing the rational transfer or quotient rescales the point/logarithm comparison by a nonzero scalar. The Petersson-norm ratio in Brooks is nonzero. These choices identify the Hecke-normalized divisor in the complex and p-adic formulas.

**Hypotheses and conventions.** Case II has indefinite quaternion discriminant N⁻; the transfer is rational up to the specified coefficient field and scalar.

**Argument and dependencies.** Import global Jacquet–Langlands and the rational model, rather than reconstructing the Shimura curve or automorphic representation. Compare the differential associated with f_B with the pullback of ω. Track the transfer scalar and Petersson norm together; only a nonzero scalar comparison is required for the converse.

Direct inputs: RankOneConverse:PC.0/normalized-heegner-point; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models; GrossZagierAndArithmeticHeights:GZ.9/petersson-norm-ratio; GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace.

**Checks.** A differential rescaling must be reflected quadratically in a squared-log formula.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.4 Case II and §2.6, pp. 340, 342–344. The rational transfer and differential choices used in the formulas. [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), §2.7, p. 4190; §8.6, Proposition 8.13, p. 4239. Brooks §2.7 fixes the rational normalization of the transferred form; §8.6 gives quotient functoriality of logarithms. The norm ratio is supplied separately by GZ.9/petersson-norm-ratio, and the final value formula retains the logarithm square.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Obtain the exact local epsilon-factor export from R16.3. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.1. Rational Selmer localization and strict kernels

The global finite Selmer line and its local image play different roles. Parity uses the global dimension. The strict-kernel argument uses the dimension of its image inside a two-dimensional unrestricted semilocal image. Localizing only one factor from the start would conceal the conjugation argument.

For arithmetic rank-one applications, the local injection requires componentwise nonvanishing, not just a nonzero full vector logarithm. Burungale–Skinner–Wan Theorem 1.1 applies to a non-torsion algebraic point on an abelian variety with a field of endomorphisms of degree its dimension and a real embedding. Here M is totally real, so it supplies every eigencomponent. This repairs the step in Skinner Lemma 2.2.2 without imposing that p have only one prime in M. The more general structural-rank conjectures in §5 of that later paper are not used.

**Layer inputs.** SelmerIwasawaCohomology:L4; RankZeroOneBSD:BSD.1; GrossZagierAndArithmeticHeights:GZ.9; SelmerIwasawaCohomology:L2; SelmerIwasawaCohomology:L1; AutomorphicGaloisRepresentations:R19.1.

### The rank-one localization criterion

**Target:** `PC.1/rank-one-localization` (definition). For a field L, finite-dimensional L-vector space S, an L-vector space P and an actual linear map loc:S→P, RankOneLocalization(loc) means dim_L S=1 and loc is injective. For Skinner B(e), S=H¹_f(K,V), P=∏_(v|p)H¹_f(K_v,V), and loc is the restriction map with its finite-condition codomain.

**Hypotheses and conventions.** S and P are actual vector spaces, not formal fields representing unconstructed Selmer groups. Finite dimensionality of S is explicit; the arithmetic specialization requires the canonical Bloch–Kato carrier and restriction map.

**Argument and dependencies.** Use Module.finrank and ordinary injectivity; no new cohomology carrier is introduced. Expose the equivalent zero-kernel condition on the same map. Transport along linear equivalences on source and target, keeping loc in the commuting square.

Direct inputs: mathlib:Module.finrank; mathlib:LinearMap.ker.

**Uses.** PC.3 main theorem B: State the exact rational Selmer hypothesis. PC.1 corrected arithmetic criterion and PC.5 mod-p criterion: Provide two distinct ways to prove that hypothesis.

**API.** Names below are in the `RankOneConverse` namespace; heavy objects are README signatures.

- `RankOneLocalization.finrank` (projection): The source has dimension one.
- `RankOneLocalization.injective` (projection): The specified localization is injective.
- `rankOneLocalization_iff_ker` (characterisation): The criterion is equivalent to source dimension one and ker(loc)=0.
- `RankOneLocalization.transport` (functoriality): For source/target linear equivalences, the conjugated map satisfies the criterion iff loc does.

**Discriminating unit tests.**

- `RankOneLocalization.identity` (computation): The identity ℚ→ℚ satisfies it.
- `RankOneLocalization.zero_map` (non-example): The zero map ℚ→ℚ fails injectivity although the source is a line.
- `RankOneLocalization.zero_source` (degenerate): The unique map from the zero ℚ-vector space fails the dimension condition.
- `RankOneLocalization.transport_square` (compatibility): Conjugation by linear equivalences preserves the criterion on the actual map.

**Checks.** The identity on ℚ satisfies the criterion; the zero map on ℚ and the identity on the zero vector space fail it.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Theorem B(e), p. 331; §2.3, Lemma 2.3.2, pp. 338–339. The precise line-and-injection hypothesis of the p-converse.

### Rational Selmer, Kummer and quadratic comparisons

**Target:** `PC.1/rational-selmer-comparison` (comparison). For A_f, V and K as in the common conventions, identify H¹_f(K,V) with the λ-component of the rational p-adic Selmer group. Kummer gives an injection (A_f(K)⊗ℚ_p)⊗_(M⊗ℚ_p)L→H¹_f(K,V), whose cokernel is the corresponding rational Tate module of Sha[p∞]. At v∤p the rational local finite group is zero; at v|p it is the local rational Kummer image. Restriction identifies H¹_f(K,V) with H¹_f(ℚ,V)⊕H¹_f(ℚ,V⊗χ_D), and conjugation acts by +1 and −1 respectively. Rank and Sha finiteness compare via the quadratic 2-isogeny A_f×A_f^D→Res_(K/ℚ)A_f.

**Hypotheses and conventions.** The local and global coefficients retain their continuous topology. Rational statements do not identify finite-level Kummer conditions with raw unramified conditions.

**Argument and dependencies.** Apply the requested GL₂-type Kummer/Bloch–Kato comparison and finite-generation theorems. Use p odd and restriction/corestriction to split the quadratic eigenspaces. Use the requested GL₂-type extension of quadratic point/Sha descent and isogeny invariance; finite 2-primary errors are retained when proving entire Sha finiteness.

Direct inputs: SelmerIwasawaCohomology:L4/bloch-kato-condition; SelmerIwasawaCohomology:L4/elliptic-finite-kummer; SelmerIwasawaCohomology:L4; RankZeroOneBSD:BSD.1; mathlib:continuousCohomology; tauceti:WeierstrassCurve.Affine.selmerGroup₂.

**Checks.** For M=ℚ this agrees with the existing elliptic Kummer target, not with the pinned explicit 2-Selmer group. Finite Sha[p∞] kills the rational cokernel but supplies no integral Selmer identification.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §§2.1.1, 2.1.3, 2.2, pp. 334–338. Arithmetic interpretation and quadratic decomposition of the finite Selmer group.

### Arithmetic rank one implies localization at every λ

**Target:** `PC.1/arithmetic-localization` (lemma). Assume f,N,p,λ,K,V as in the common conventions, p∤N, and rank_ℤ A_f(K)=d with Sha(A_f/K)[p∞] finite. Then dim_L H¹_f(K,V)=1 and each restriction H¹_f(K,V)→H¹_f(K_v,V), v|p, is injective; hence the semilocal map satisfies RankOneLocalization.

**Hypotheses and conventions.** The logarithm theorem applies to actual non-torsion points with the M-action defined over K and dim A_f=[M:ℚ]. M is totally real. No uniqueness of λ over p is assumed.

**Argument and dependencies.** The Kummer/Sha comparison identifies the global rational Selmer group with the λ-component of A_f(K)⊗ℚ_p, a rank-one M⊗ℚ_p module. Choose a nonzero algebraic generator of A_f(K)⊗ℚ over M and clear its rational denominator. The imported eigenlogarithm theorem gives nonzero logarithm in every matching coefficient embedding at every v|p. Local Kummer/log compatibility makes each restriction nonzero on the one-dimensional source, hence injective.

Direct inputs: RankOneConverse:PC.1/rank-one-localization; RankOneConverse:PC.1/rational-selmer-comparison; GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing; GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class.

**Checks.** The conclusion holds for every λ|p, including when p has several coefficient primes. Module freeness alone is not accepted as proof that a chosen local eigencomponent is nonzero.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.2, Lemma 2.2.2, pp. 337–338. The rank-one criterion, with the omitted componentwise logarithm justification supplied. [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/pdf/2603.20886v2), §1.4, Theorem 1.1, p. 3; §2.2, Theorem 2.3 and Remark 2.4, pp. 4–5; §4, pp. 9–11. Unconditional nonvanishing of every eigendifferential logarithm of an actual non-torsion algebraic point.

### The two-dimensional semilocal image

**Target:** `PC.1/semilocal-dimension` (lemma). Assume the common conventions, p∤N, irreducibility of V, self-duality V*≅V(−1), and the associated purity/local vanishing. For S containing the places over pND and infinity, the image of H¹(G_(K,S),V) in H¹(K_𝔭,V)⊕H¹(K_𝔭̄,V) has L-dimension two. Each H¹(K_v,V) has dimension two and each finite subspace H¹_f(K_v,V) has dimension one.

**Hypotheses and conventions.** Global and local H⁰ and the dual H⁰ vanish in the indicated realization; local H¹ away from p vanishes rationally.

**Argument and dependencies.** Use local purity and local Euler characteristics to compute the two local dimensions. Apply Poitou–Tate with the finite local conditions and their exact annihilators. Identify the dual of the strict kernel with the appropriate global H². The global Euler characteristic over the imaginary quadratic field gives dim H¹−dim H²=2; subtract the strict kernel to obtain image dimension two.

Direct inputs: RankOneConverse:PC.1/rational-selmer-comparison; SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate; SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit; SelmerIwasawaCohomology:L1.

**Checks.** No surjectivity onto the four-dimensional semilocal space is asserted. Complex places contribute the imaginary-quadratic Euler characteristic.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.3, Lemma 2.3.1, pp. 338–339. The global duality and Euler-characteristic calculation.

### Vanishing of the strict and one-sided Selmer groups

**Target:** `PC.1/strict-kernels` (theorem). Let H=H¹(G_(K,S),V), loc=(loc_𝔭,loc_𝔭̄), H_str=ker(loc), H_𝔭=ker(loc_𝔭) and H_𝔭̄=ker(loc_𝔭̄); these are rational kernels, with no extra away-p conditions. Under the semilocal dimension conclusions and conjugation exchanging the two places, if the image of H¹_f(K,V) under loc has dimension one, then H_𝔭=H_str=H_𝔭̄. If also dim H¹_f(K,V)=1, all three groups vanish. In particular B(e) implies this vanishing.

**Hypotheses and conventions.** The finite subspace is loc⁻¹(H¹_f(K_𝔭,V)⊕H¹_f(K_𝔭̄,V)); conjugation exchanges the two local finite lines as well as the full cohomology spaces.

**Argument and dependencies.** If the two-dimensional semilocal image contained a nonzero vector on one coordinate axis, conjugation would give a nonzero vector on the other. Those vectors span the image. Its intersection with the product of the two finite lines would then have dimension zero or two, contradicting the assumed dimension one. Thus neither coordinate-axis intersection is nonzero, giving equality of kernels. The strict kernel lies inside H¹_f(K,V). A one-dimensional finite Selmer group with one-dimensional image has zero kernel.

Direct inputs: RankOneConverse:PC.1/semilocal-dimension; RankOneConverse:PC.1/rank-one-localization; mathlib:LinearMap.ker; mathlib:LinearMap.fst; mathlib:LinearMap.snd; mathlib:LinearMap.prod.

**Checks.** B(e) concerns the product of the two finite local spaces; individual injectivity is a conclusion. The abstract Lean milestone uses the same submodules and conjugation symmetry, rather than assuming equality of kernels.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.3, Lemma 2.3.2, p. 339. The conjugation and dimension argument for strict kernels.

### The ordinary parity specialization

**Target:** `PC.1/selmer-parity` (comparison). For λ-ordinary f as in the common conventions with p∤N (and p∤D, already implied by splitting), the parity of dim_L H¹_f(F,V), F=ℚ or K, is the root-number parity of L(f/F,s). In particular dimension one over K gives w(f/K)=−1; dimension zero or one over ℚ gives respectively w(f)=+1 or −1.

**Hypotheses and conventions.** Assume p∤N; splitting already gives p∤D. Match the geometric Tate realization to Nekovář’s self-dual convention before applying the supplied theorem.

**Argument and dependencies.** Use the existing ordinary modular parity node, restricted to ℚ and its quadratic extensions. Check that the central point is 1 in motivic weight-two normalization and convert from the cohomological dual convention.

Direct inputs: SelmerIwasawaCohomology:L4/ordinary-selmer-parity; AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation.

**Checks.** Parity alone supplies a sign, never a nonzero central derivative.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.2, Lemma 2.2.1, p. 337; §3, p. 350; §4, p. 352. The three parity uses in the converse.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Obtain GL₂-type Kummer/quadratic comparisons and the stated duality specialization; inherited supplier proof gaps remain with their owners. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.2. Anticyclotomic divisibility and augmentation control

The coefficient ring O^ur is the integer ring in the completed maximal unramified extension of L. It is a complete discrete valuation ring, not the finite ring O and not an uncompleted union of coefficient extensions. For interpolation enlarge L finitely to contain the image of the Hilbert class field of K, as permitted by Skinner p. 342, footnote 3. Faithful scalar extension preserves dimension, injectivity and nonvanishing, so this does not strengthen B's final hypotheses.

The induced representation at a crystalline anticyclotomic character ψ has weights n,n−1 at 𝔭 and −n,−n−1 at 𝔭̄. The negative part has dimension two, matching the +1 complex-conjugation eigenspace. This is the Panchishkin convention underlying the imported Greenberg main-conjecture formulation. Conjecture 2.7.1 belongs to `ModularIwasawaMainConjectures:L0` and is not assumed. Only char(X)⊆(L) after inverting p is used.

The specialization argument retains a Fitting bound. A principal ideal containing the two-variable characteristic ideal does not by itself control the characteristic ideal of a quotient. Exact Selmer control and Fitting base change give a bound on the specialized Fitting ideal; normality and divisorial closure then give the characteristic bound. The augmentation argument separately treats torsion and nontorsion duals and keeps finite local control errors.

**Layer inputs.** SelmerIwasawaCohomology:L3; SelmerIwasawaCohomology:L2; PadicMeasuresIwasawaAlgebras:L4; RankOneConverse:PC.0; GrossZagierAndArithmeticHeights:GZ.9; AutomorphicCongruences:L2; PadicMeasuresIwasawaAlgebras:L5.

### The anticyclotomic strict Selmer deformation

**Target:** `PC.2/deformed-selmer` (construction). Let K_∞/K be the anticyclotomic ℤ_p-extension, Γ=Gal(K_∞/K), Λ=O[[Γ]], Ψ:G_K→Γ⊂Λ× the tautological character and Λ*=Hom_cts(Λ,ℚ_p/ℤ_p). Form M_∞=T⊗_OΛ* with inverse Ψ-action, and Sel_∞=ker[H¹(G_(K,S),M_∞)→H¹(I_𝔭,M_∞)], with relaxed condition at 𝔭̄ and at the other places of S. Let X_∞ be its compact Pontryagin dual. At a generator γ of Γ, M_∞[γ−1]=W=V/T. Define Sel_𝔭(W) by the identical inertia condition and X_𝔭 its dual. The characteristic ideal is zero for nontorsion X_∞.

**Hypotheses and conventions.** Use the canonical completed group ring, induced continuous representation, local-condition kernels and Pontryagin dual from the suppliers. The condition is restriction to inertia at the chosen 𝔭, not the Bloch–Kato condition. Fix an O-linear identification Hom_cts(O,ℚ_p/ℤ_p)≅L/O, equivalently a generator of the inverse different, when identifying the Pontryagin augmentation fibre with W=V/T. This coefficient-duality choice is not asserted canonical.

**Argument and dependencies.** Instantiate the supplied completed-action and inverse-character construction on T. Use SelmerIwasawaCohomology local conditions for the stated imprimitive kernel and its compact dual; prove finite generation in this arithmetic instance. Identify the augmentation fibre with W, including the action convention, and use the supplied characteristic-divisor convention. At an arithmetic ψ of weights (−n,n), n>0, the induced representation has weights n,n−1 at 𝔭 and −n,−n−1 at 𝔭̄. Its negative-weight subspace has dimension two, equal to the +1 complex-conjugation eigenspace; this checks the imported Panchishkin convention without assuming the main conjecture.

Direct inputs: SelmerIwasawaCohomology:L3; SelmerIwasawaCohomology:L2; PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal.

**Uses.** PC.2 divisibility and control: Put both analytic and algebraic ideals over the same ring and retain the same local condition. Skinner Proposition 2.7.3: Detect augmentation vanishing through the rational one-sided kernel.

**API.** Names below are in the `RankOneConverse` namespace; heavy objects are README signatures.

- `AnticyclotomicSelmer.augmentation_fibre` (compatibility): M_∞[γ−1]≅V/T as continuous G_K-modules.
- `AnticyclotomicSelmer.local_condition` (characterisation): A class belongs exactly when its restriction to I_𝔭 vanishes; 𝔭̄ is relaxed.
- `AnticyclotomicSelmer.change_lattice` (functoriality): For T⊆T′⊆p^(−m)T, coefficient-module and induced global/local cohomology comparisons have kernels and cokernels killed by a power of p. Their compact duals become isomorphic after inverting p. These errors need not be finite at the Λ level; finiteness at augmentation requires the separate control calculation.
- `AnticyclotomicSelmer.dual_action` (compatibility): Pontryagin duality uses the contragredient Γ-action, with the involution recorded.
- `AnticyclotomicSelmer.characteristic_zero` (characterisation): The extended characteristic ideal is zero if X_∞ is not Λ-torsion.

**Discriminating unit tests.**

- `AnticyclotomicSelmer.trivial_fibre` (compatibility): At Ψ=1 the coefficient module is W, not T or its untwisted dual.
- `AnticyclotomicSelmer.strict_place` (non-example): A class supported only at the relaxed 𝔭̄ is not rejected by a nonexistent strict condition there.
- `AnticyclotomicSelmer.nontorsion` (degenerate): For a positive-rank dual the characteristic ideal is zero, not the unit ideal.
- `AnticyclotomicSelmer.inverse_action` (computation): Specialization at ψ gives the V⊗ψ⁻¹ convention used by Skinner; replacing Ψ⁻¹ by Ψ reverses the weights.
- `AnticyclotomicSelmer.bounded_error` (non-example): Λ/(p) is infinite although killed by p, and its characteristic ideal (p) becomes the unit ideal after inverting p. A lattice-change API must allow such bounded p-primary errors rather than promise finite Λ-level errors.

**Checks.** Finite generation is proved or supplied, not an implicit consequence of the notation X_∞.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.7, pp. 344–346. The deformed module, strict inertia condition and augmentation fibre.

### The integral imprimitive analytic dictionary

**Target:** `PC.2/analytic-dictionary` (comparison). Under squarefree level, w(f/K)=−1, the Case I ramified-level condition or Case II, and p good ordinary split with 2 split, import L_𝔭^S(f)∈Λ^ur=O^ur[[Γ]], where O^ur is the completed maximal unramified coefficient extension and S contains pND. Its interpolated characters ψ have Hodge–Tate weights (−n,n), n>0 divisible by p−1; the corresponding algebraic Hecke character has infinity type (n,−n) in Skinner’s geometric reciprocity convention. The trivial character lies outside this interpolation range. The analytic function used after Wan’s specialization must agree with this function up to an explicitly nonzero scalar after inverting p, with identical removed Euler factors.

**Hypotheses and conventions.** The normalized differential and quotient are fixed as in PC.0. The p-Euler factor at the trivial point is retained; Euler factors removed away from p must be nonzero at augmentation. For interpolation enlarge L finitely to contain the image of the Hilbert class field of K, as in Skinner’s (L-lrg), p.342 footnote 3. Dimension, injectivity and nonvanishing descend by faithful scalar extension, so this adds no hypothesis to Theorem B.

**Argument and dependencies.** Use the GZ.9 integral measure construction, not a continuity assertion inferred from values at a set of characters. Choose an arithmetic ψ₀ with n₀>6 and n₀ divisible by p−1. Pass from Γ_K≅ℤ_p² to Γ and twist γ↦ψ₀(γ)⁻¹γ. Request the exact imprimitive period/Euler comparison for Skinner’s two cases, including ramified conductor primes; identify the functions on their common interpolation domain before evaluating outside it.

Direct inputs: RankOneConverse:PC.0/transfer-differential; GrossZagierAndArithmeticHeights:GZ.9/bdp-measure-integrality; GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary; GrossZagierAndArithmeticHeights:GZ.9.

**Checks.** Do not evaluate the classical interpolation formula at n=0. O^ur is the completed coefficient ring; it is not the finite ring O.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.6 and proof of Proposition 2.7.2, pp. 341–344, 345–346. The character, coefficient-ring and imprimitive-normalization comparison.

### The anticyclotomic reverse divisibility

**Target:** `PC.2/wan-divisibility` (theorem). Assume the common conventions, p∤N, λ-ordinarity, residual irreducibility over G_K, w(f/K)=−1, the stated Case I or II local conditions, and the residual ramified odd nonsplit prime. After extending to Λ^ur[1/p], char_Λ(X_∞)·Λ^ur[1/p]⊆(L_𝔭^S(f)). This is the single reverse divisibility, with the convention char=0 in the nontorsion case; no equality or torsion assertion is assumed.

**Hypotheses and conventions.** Choose ψ₀ of weight n₀>6 divisible by p−1, so Wan’s κ=2n₀ satisfies κ≥6 and κ≡0 mod 2(p−1), and check its finite branch condition. Wan Theorem 1.2 requires a nonsplit q||N and residual irreducibility over G_K; do not add Theorem 1.1’s CM residual hypotheses. With ξ=ψ₀,alg·ω and κ=2n₀, check that the p-adic avatar of ξ|·|^(κ/2)(ω⁻¹∘Nm) factors through Γ_K, precisely Wan’s finite branch condition. Work after a finite coefficient extension satisfying (L-lrg) and descend the rational containment as appropriate.

**Argument and dependencies.** Import the ordinary fixed-weight imprimitive Fitting bound from the proof of Wan Theorem 1.2 over the two-variable coefficient ring after inverting p. Apply the exact Selmer specialization/control comparison and Fitting-ideal base change to the anticyclotomic quotient and ψ₀-twist. Finite/p-primary errors disappear only at the stated rationalization. An arbitrary pseudo-null error over the two-variable ring need not disappear after inverting p; retain the actual fixed-weight Fitting bound and the exact control hypothesis instead of discarding such errors. Use the analytic dictionary to identify the resulting principal analytic ideal. Take divisorial closure in the normal specialized ring to pass from the Fitting bound to the characteristic bound. Principality of characteristic ideals alone is insufficient.

Direct inputs: RankOneConverse:PC.0/residual-restriction; RankOneConverse:PC.2/deformed-selmer; RankOneConverse:PC.2/analytic-dictionary; AutomorphicCongruences:L2; SelmerIwasawaCohomology:L3; PadicMeasuresIwasawaAlgebras:L5.

**Checks.** The direction is char⊆(L); the opposite inclusion does not prove the augmentation implication. Do not use the withdrawn nonordinary preprint in place of the published ordinary theorem.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.7, Proposition 2.7.2 and its proof, pp. 345–346. The one-sided bound and its two-variable specialization. [Iwasawa main conjecture for Rankin–Selberg p-adic L-functions](https://msp.org/ant/2020/14-2/ant-v14-n2-p04-p.pdf), Theorem 1.2, pp. 385–386; §2B–C, pp. 392–394; §7E, Proposition 7.7 and equations (7-2)–(7-6), pp. 445–449; proof of Theorem 1.2, pp. 479–480. The ordinary fixed-form theorem and the Fitting bound used in its proof. [The Iwasawa main conjectures for GL₂](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §3.1.6, pp. 19–20; §3.2, Proposition 3.2.8 and Corollary 3.2.9, pp. 23–24. Fitting base change and the principal divisorial bound after an exact Selmer-control comparison.

### Finite-error augmentation control

**Target:** `PC.2/augmentation-control` (comparison). With the preceding residual irreducibility and ordinary local hypotheses, the natural map Sel_𝔭(W)→Sel_∞[γ−1] is injective with finite cokernel. Hence X_𝔭 is infinite iff X_∞/(γ−1)X_∞ is infinite. The maximal divisible part of Sel_𝔭(W), after rationalizing its Tate module, is H_𝔭=ker[H¹(G_(K,S),V)→H¹(K_𝔭,V)].

**Hypotheses and conventions.** Assume good ordinary p, as in the preceding divisibility. The integral condition at augmentation is inertia-strict, with the finite local control error computed separately. On V the map H¹(K_𝔭,V)→H¹(I_𝔭,V) is injective: its unramified kernel H¹(G_(K_𝔭)/I_𝔭,V^{I_𝔭}) vanishes by the local Frobenius/purity calculation. Thus the rational inertia-strict and full-local kernels agree exactly.

**Argument and dependencies.** Residual irreducibility kills global invariants and identifies H¹(W) with H¹(M_∞)[γ−1]. Use the snake diagram on the actual global-to-inertia images. Bound the local cokernel by the invariants of M_∞^{I_𝔭}/(γ−1)M_∞^{I_𝔭}; the requested ordinary/purity calculation makes this finite. Dualize the finite-error comparison and use cofinite generation to pass from infinitude to a positive divisible corank, then compare the rational full-local kernel.

Direct inputs: RankOneConverse:PC.2/deformed-selmer; RankOneConverse:PC.0/residual-restriction; SelmerIwasawaCohomology:L3/kernel-control; SelmerIwasawaCohomology:L3.

**Checks.** An arbitrary specialization is not assumed exact. A finite Selmer group has zero rational Tate module, whereas an infinite cofinitely generated p-primary Selmer group has positive corank.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.7, equation (2.7.1) and following argument, pp. 346–347. The augmentation control calculation and rational strict comparison.

### Augmentation vanishing forces a strict class

**Target:** `PC.2/augmentation-obstruction` (theorem). Under the hypotheses of the reverse divisibility and augmentation control, L_𝔭^S(f,1)=0 implies H_𝔭≠0. Equivalently H_𝔭=0 forces L_𝔭^S(f,1)≠0.

**Hypotheses and conventions.** The augmentation ideal is (γ−1); its height-one divisor remains after inverting p.

**Argument and dependencies.** If L vanishes at augmentation, (L)⊆(γ−1). The characteristic containment forces a positive augmentation divisor for torsion X_∞; if X_∞ is nontorsion, finite generation and Nakayama give positive coinvariant rank directly. Apply the requested characteristic/coinvariant criterion over O[[Γ]], with faithful coefficient extension to O^ur. Use finite-error control to obtain infinite X_𝔭 and hence a nonzero rational one-sided class.

Direct inputs: RankOneConverse:PC.2/wan-divisibility; RankOneConverse:PC.2/augmentation-control; PadicMeasuresIwasawaAlgebras:L5.

**Checks.** A finite Λ-module has characteristic ideal one and cannot create the required height-one augmentation divisor.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.7, equation (2.7.2) and Proposition 2.7.3, pp. 346–347. The ideal-theoretic obstruction that drives the converse.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Obtain the ordinary Wan Fitting bound, exact control, commutative-algebra specialization and analytic normalization exports. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.3. The quadratic-field p-converse

This is the assembly layer. The strict kernel is zero; the augmentation obstruction forces a nonzero analytic value; the value formula forces a nonzero point; the complex formula gives the derivative. The main direction from nonzero analytic value to nonzero point uses only the squared-log identity. The reverse point-to-value implication, which the source also states, needs the actual-point eigenlogarithm result.

At the good split prime the relevant logarithmic Euler factor is (1+p−a_p)/p, which is nonzero by the Weil bound at every embedding. Removed Euler factors away from p and period ratios must be checked nonzero at augmentation. The trivial character is outside the positive-weight interpolation domain; continuity of a formula stated only at those arithmetic points is not a proof of the weight-two value formula.

**Layer inputs.** RankOneConverse:PC.0; GrossZagierAndArithmeticHeights:GZ.8; GrossZagierAndArithmeticHeights:GZ.3; RankZeroOneBSD:BSD.0; RankOneConverse:PC.2; GrossZagierAndArithmeticHeights:GZ.9; RankOneConverse:PC.1; HeegnerPointEulerSystems:HE.7.

### The normalized point and analytic rank one

**Target:** `PC.3/point-and-height` (theorem). For f,K satisfying the Case I or II conditions and w(f/K)=−1, if P_K(f)≠0 then ord_(s=1)L(f,K,s)=1 and ord_(s=1)L(A_f/K,s)=d. The point is the normalized coefficient component of PC.0, and the latter conclusion uses all conjugates of f.

**Hypotheses and conventions.** Use the matching nonzero local toric test vectors and the positive-definite Néron–Tate pairing after identifying the coefficient embedding.

**Argument and dependencies.** Apply the imported general Gross–Zagier identity to the normalized Hodge point and the chosen transfer. The nonzero point has positive height in the corresponding real coefficient component, so the derivative is nonzero; the root sign supplies vanishing of the value. Use the rational Hecke orbit and Galois compatibility of the height formula to give order one for every f^σ, then multiply their actual L-functions.

Direct inputs: RankOneConverse:PC.0/heegner-cases; RankOneConverse:PC.0/normalized-heegner-point; RankOneConverse:PC.0/transfer-differential; GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity; GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization; RankZeroOneBSD:BSD.0.

**Checks.** Order one for L(f,K) corresponds to order d for L(A_f/K), not order one for the latter.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.5, Proposition 2.5.1, pp. 340–341. The positive-height consequence and conjugate-product order.

### The trivial-character logarithm comparison

**Target:** `PC.3/point-and-logarithm` (comparison). With the integral imprimitive normalization and the PC.0 point, L_𝔭^S(f,1)=c·(log_ω P_K(f))² for a nonzero c in the extended p-adic coefficient field. Thus L_𝔭^S(f,1)≠0 iff P_K(f)≠0. The converse implication from nonzero point uses the actual rational Hodge-divisor point before coefficient projection and the eigenlogarithm theorem.

**Hypotheses and conventions.** The Euler factors removed away from p are nonzero at augmentation. The good-p factor 1−a_p/p+1/p is nonzero by the Weil bound. Retain ramified Case I as well as Case II.

**Argument and dependencies.** Import the weight-two BDP or quaternionic Brooks formula, corrected to a squared logarithm and compared with the exact imprimitive analytic dictionary. Use log_ω P_K(f)=log_ω y for y=φQ_K^ξ∈A_f(K)⊗ℚ; if P_K(f)≠0, clear denominators in y and apply the imported eigenlogarithm theorem. The forward implication from nonzero analytic value uses only the displayed squared-log identity.

Direct inputs: RankOneConverse:PC.0/normalized-heegner-point; RankOneConverse:PC.2/analytic-dictionary; GrossZagierAndArithmeticHeights:GZ.9/euler-factor-at-bdp-point; GrossZagierAndArithmeticHeights:GZ.9/quaternionic-weight-two-formula; GrossZagierAndArithmeticHeights:GZ.9/eigenlogarithm-nonvanishing; GrossZagierAndArithmeticHeights:GZ.9.

**Checks.** A nonzero arbitrary cohomology class or tensor is not an eligible point for the eigenlogarithm theorem. The logarithm is squared, including after quotient descent.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §2.6, Proposition 2.6.1 and Corollary 2.6.2, pp. 343–344. The out-of-range value formula and its corrected converse implication. [A refined non-vanishing of the p-adic logarithm of a rational point on an abelian variety](https://arxiv.org/pdf/2603.20886v2), Theorem 1.1, p. 3; Theorem 2.3, pp. 4–5. The nonvanishing input needed for the reverse implication. [Shimura curves and special values of p-adic L-functions](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content), Theorem 8.11, pp. 4237–4238; Propositions 8.12–8.13, p. 4239. The weight-two specialization must retain the square visible in the preceding theorem.

### Skinner’s quadratic-field p-converse

**Target:** `PC.3/theorem-b` (theorem). Let f have weight two, trivial character and squarefree N; let p≥5, λ|p and K imaginary quadratic of odd discriminant D. Assume (a) p∤N and f is λ-ordinary; (b) the residual representation is irreducible over G_ℚ and ramified at an odd prime inert or ramified in K; (c) 2 and p split in K; (d) if gcd(D,N)>1, every q|gcd(D,N) has local type St twisted by the unramified quadratic character and every q|N/gcd(D,N) splits; (e) dim_L H¹_f(K,V)=1 and its restriction to the product of finite local groups at p is injective. Then ord_(s=1)L(f,K,s)=1, rank_ℤ A_f(K)=d=ord_(s=1)L(A_f/K,s), and the entire Sha(A_f/K) is finite.

**Hypotheses and conventions.** Conditions (a)–(e) are exactly the displayed conditions; no uniqueness of λ, nondegeneracy of p-adic heights, or full main conjecture is added.

**Argument and dependencies.** Parity supplies w(f/K)=−1; residual restriction and the local sign dictionary select the admissible geometry. The semilocal criterion annihilates H_𝔭. By the augmentation obstruction the analytic value is nonzero; the logarithm comparison gives P_K(f)≠0. The height criterion gives the two analytic orders. Kummer bounds the Mordell–Weil rank above by d and the point gives the lower bound. Apply the requested GL₂-type full forward rank-zero/rank-one theorem to f and its quadratic twist, whose nonnegative analytic orders sum to one. The quadratic isogeny and Sha comparison give finiteness of the entire Sha over K.

Direct inputs: RankOneConverse:PC.1/selmer-parity; RankOneConverse:PC.0/residual-restriction; RankOneConverse:PC.0/heegner-cases; RankOneConverse:PC.1/strict-kernels; RankOneConverse:PC.2/augmentation-obstruction; RankOneConverse:PC.3/point-and-logarithm; RankOneConverse:PC.3/point-and-height; RankOneConverse:PC.1/rational-selmer-comparison; HeegnerPointEulerSystems:HE.7.

**Checks.** The conclusion is whole Sha finiteness, not only λ-primary finiteness. For gcd(D,N)=1 the ramified-level clause is vacuous; even inert level sets remain permitted.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Theorem B, p. 331; §2.9, pp. 348–349. The main quadratic-field criterion and assembly of its consequences.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Close the ramified Case I logarithm normalization and full GL₂-type forward/Sha supplier interfaces. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.4. The rational rank-one converse

The field choice has to preserve a residual-ramified prime. For sufficiently large p every bad level prime is residually ramified, so A can choose whichever local alternative is convenient. C fixes p and only knows one odd residual-ramified prime q. If q has type St⊗ξ choose q ramified. If q has type St, choose q and another odd level prime q′ inert; the local alternatives guarantee such q′ exists. Its type can be either St or St⊗ξ, since both become St under unramified quadratic base change. Making all residual-ramified primes split would invalidate B(b).

The needed local nonvanishing can be reduced to the already planned BFH splitting theorem. Fix one negative odd fundamental discriminant D₀ with the desired local quadratic characters. The normalized form g=f⊗χ_(D₀) still has weight two and trivial nebentypus, although its level need not be squarefree. Put every prime of 2pND₀ and cond(g) in S. If g has sign +1, BFH(ii) gives a positive fundamental δ split at S and a nonzero central value. Since δ is square at these local fields, it preserves each prescribed character. The product D₀δ is negative, odd and fundamental because the factors are coprime and δ≡1 mod 8. This proves the needed local-prescription reduction; BSD.2 remains the owner of its general form.

**Layer inputs.** RankOneConverse:PC.1; RankZeroOneBSD:BSD.2; GL2AutomorphicRepresentationsAndTransfer:R16.3; AutomorphicGaloisRepresentations:R19.3; RankOneConverse:PC.3; HeegnerPointEulerSystems:HE.7; EllipticCurveModularity:R29.5; EllipticCurveModularity:R29.6; RankZeroOneBSD:BSD.1; RankZeroOneBSD:BSD.0.

### The auxiliary Heegner field with nonzero twist value

**Target:** `PC.4/auxiliary-field` (construction). Suppose f satisfies the local alternatives of Theorem A and w(f)=−1. Choose a good ordinary p≥5 and λ with residual irreducibility and an odd residual-ramified q|N. If π_q is the unramified-quadratic twist of St, prescribe q ramified and all other level primes split. If π_q=St, prescribe q and a distinct odd q′|N inert and all other level primes split; the local alternatives guarantee such q′. There are infinitely many K with odd D, 2 and p split, these prescriptions, w(f/K)=−1 and L(f⊗χ_D,1)≠0. For Theorem A choose p sufficiently large so any selected q has residual ramification.

**Hypotheses and conventions.** The ramified-prime prescription fixes an actual local quadratic character, not only the value χ_D(q)=0. The q′ in the inert case need not itself have Steinberg type without the quadratic twist.

**Argument and dependencies.** Use the requested local epsilon-factor dictionary to obtain w(f/K)=−1 and hence twist sign +1 from w(f)=−1. Use the BSD.2 local-character construction to choose one negative fundamental D₀, odd with 2,p split and all prescribed local types. Apply the existing BFH nonvanishing theorem to the normalized newform g=f⊗χ_(D₀), with S containing 2,p,N and all primes dividing D₀ and cond(g). Its sign is +1, so BFH supplies positive fundamental δ split at S with L(g⊗χ_δ,1)≠0. Because δ is a square locally at S, D=D₀δ is negative fundamental, locally identical to D₀ at S and odd; δ is coprime to D₀. The normalized double twist is f⊗χ_D. Infinitude permits exclusion of any fixed finite exceptional list.

Direct inputs: RankOneConverse:PC.1/selmer-parity; RankZeroOneBSD:BSD.2/bfh-nonvanishing; RankZeroOneBSD:BSD.2; GL2AutomorphicRepresentationsAndTransfer:R16.3; AutomorphicGaloisRepresentations:R19.3/skinner-density-one-ordinary-primes.

**Uses.** PC.4 Theorem A: Make the twist rank zero and the base change rank d. PC.5 Theorem C: Keep the actual residual-ramified prime nonsplit for a fixed p.

**API.** Names below are in the `RankOneConverse` namespace; heavy objects are README signatures.

- `AuxiliaryField.local_prescriptions` (projection): The returned negative fundamental discriminant has the stated ramification/inertness and 2,p split.
- `AuxiliaryField.twist_value` (projection): L(f⊗χ_D,1)≠0 in the sign + branch.
- `AuxiliaryField.residual_prime` (compatibility): The chosen residual-ramified q remains inert or ramified.
- `AuxiliaryField.avoid_finite` (constructor): Choose K outside any prescribed finite set while keeping every condition.

**Discriminating unit tests.**

- `AuxiliaryField.ramified_case` (compatibility): For a nonsplit-multiplicative q choose q ramified; no coprime-only twist sign formula is used.
- `AuxiliaryField.two_inert` (computation): Two distinct odd inert level primes give even nonempty N⁻; a single inert prime fails the global sign.
- `AuxiliaryField.fixed_residual_prime` (non-example): A construction which makes every residual-ramified prime split is rejected even if the analytic twist is nonzero.
- `AuxiliaryField.positive_second_twist` (compatibility): A positive δ split at S keeps D₀δ imaginary and preserves each local quadratic character.
- `AuxiliaryField.nonvanishing_branch` (characterisation): The returned twist has analytic order zero, not merely root number +1; BFH(ii) is the input testing the extra selection property.

**Checks.** The residual-ramified prime is nonsplit in the selected K. In the St case q′ must be odd since 2 is required to split.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §3, proof of Theorems A and C, pp. 350–351. The local choices and nonvanishing twist needed for descent to ℚ. [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, unnumbered Theorem (i)–(ii), pp. 543–544. Both signs of the first-order/central-value nonvanishing theorem allow a positive second twist of a fixed locally prescribed form.

### Skinner’s rank-one converse for modular abelian varieties

**Target:** `PC.4/theorem-a` (theorem). Let f be a normalized weight-two newform of trivial character and squarefree level N. Suppose either some odd q has π_q=St⊗ξ_q for the nontrivial unramified quadratic character ξ_q, or two distinct odd q₁,q₂ have π_qᵢ=St. If rank_ℤ A_f(ℚ)=d and the entire Sha(A_f/ℚ) is finite, then ord_(s=1)L(f,s)=1, and hence ord_(s=1)L(A_f,s)=d.

**Hypotheses and conventions.** All local alternatives and the squarefree-level hypothesis are retained. A_f is the modular isogeny class with Hecke field M and d=[M:ℚ].

**Argument and dependencies.** Squarefree level excludes CM. Use the existing density-one ordinary-prime/large-residual-image export to choose p,λ, and parity to obtain w(f)=−1. Choose K by the auxiliary-field construction. The requested GL₂-type forward theorem makes A_f^D(ℚ) rank zero with finite Sha. The quadratic isogeny gives rank A_f(K)=d and finite Sha; the corrected arithmetic-localization criterion supplies B(e) for the chosen λ. Apply B, then subtract the zero analytic order of f⊗χ_D from the base-change order one. Repeat this argument for each f^σ: A_(f^σ) is in the same rational modular isogeny class, and the local St or St⊗ξ alternatives are unchanged by σ. Each conjugate has order one, so the actual conjugate-product L-function has order d.

Direct inputs: AutomorphicGaloisRepresentations:R19.3/skinner-density-one-ordinary-primes; RankOneConverse:PC.1/selmer-parity; RankOneConverse:PC.4/auxiliary-field; RankOneConverse:PC.1/rational-selmer-comparison; RankOneConverse:PC.1/arithmetic-localization; RankOneConverse:PC.3/theorem-b; HeegnerPointEulerSystems:HE.7; GL2AutomorphicRepresentationsAndTransfer:R16.3; RankZeroOneBSD:BSD.0.

**Checks.** Ordinarity is available at some λ|p, while sufficiently large λ all satisfy the residual conditions. No assumption that p has a unique prime in M is added.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Theorem A, p. 330; §3, pp. 350–351. The rational rank-one converse with both local alternatives.

### The semistable elliptic-curve converse

**Target:** `PC.4/theorem-a-prime` (application). Let E/ℚ be semistable. Suppose E has nonsplit multiplicative reduction at an odd prime, or split multiplicative reduction at two distinct odd primes. If rank_ℤ E(ℚ)=1 and Sha(E/ℚ) is finite, then ord_(s=1)L(E,s)=1.

**Hypotheses and conventions.** The local alternatives are precisely those displayed; a conductor 2q with split multiplicative reduction at both primes is not included.

**Argument and dependencies.** Use modularity and the squarefree conductor dictionary for semistable elliptic curves. Translate split multiplicative reduction to St and nonsplit multiplicative to St⊗ξ. Identify E with its modular abelian variety up to isogeny, transfer rank/Sha finiteness, and apply A.

Direct inputs: RankOneConverse:PC.4/theorem-a; EllipticCurveModularity:R29.5/modular-parametrisation; EllipticCurveModularity:R29.6/l-function-continuation; GL2AutomorphicRepresentationsAndTransfer:R16.3; RankZeroOneBSD:BSD.1.

**Checks.** The conclusion is unchanged under rational isogeny; local multiplicative splitness is checked in the modular representation.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Theorem A′, pp. 330–331. The elliptic specialization of Theorem A.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Close the locally prescribed BFH reduction and the GL₂-type arithmetic/analytic supplier exports. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.5. The mod-p Selmer criterion

A Selmer line modulo p does not directly identify the infinite Selmer group. Cofinite generation and irreducibility reduce the possibilities to a divisible line or a nonzero finite cyclic p-group. A perfect alternating pairing excludes the latter: every alternating pairing on a cyclic group is zero. Merely knowing that the order of finite Sha is a square would leave cyclic groups of order p², p⁴ and so on.

The local torsion-avoidance condition is equally specific. At good p≥5 the formal-group kernel of reduction is p-torsion-free, and the Hasse bound is less than p²; hence local p-power torsion has exponent at most p. Avoiding its mod-p image detects a nonzero rational localization. The fixed-p residual ramification comes from level lowering, not from the density-one large-prime theorem used for A.

**Layer inputs.** SelmerIwasawaCohomology:L4; SelmerIwasawaCohomology:L1; SelmerIwasawaCohomology:L2; SerreWeightAndLevelOptimisation:R20.2; RankOneConverse:PC.4; RankOneConverse:PC.1; RankOneConverse:PC.3; RankZeroOneBSD:BSD.4; RankZeroOneBSD:BSD.3; tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4.

### From a mod-p Selmer line to rational localization

**Target:** `PC.5/mod-p-localization` (lemma). Let E/ℚ have good reduction at p≥5, irreducible E[p], Sel_p(E)≅𝔽_p and localization image not contained in the image of E(ℚ_p)[p] inside E(ℚ_p)/pE(ℚ_p). Then Sel_(p∞)(E/ℚ)≅ℚ_p/ℤ_p as a ℤ_p-module, dim_ℚp H¹_f(ℚ,V_pE)=1, and rational restriction to H¹_f(ℚ_p,V_pE) is injective.

**Hypotheses and conventions.** The finite-level Selmer condition is the actual local Kummer condition. Finiteness and cofinite generation are supplier inputs. Whole Sha finiteness is not assumed.

**Argument and dependencies.** Irreducibility gives E(ℚ)[p]=0 and Sel_(p∞)[p]≅Sel_p, a line. The structure theorem leaves a divisible line or a nonzero finite cyclic group. In the finite case Mordell–Weil rank is zero and Sha[p∞] is finite cyclic. The perfect alternating Cassels–Tate pairing makes its elementary divisors paired, contradicting nonzero cyclicity. Thus the infinite Selmer group is the divisible line. The formal-group filtration and Hasse bound #E(𝔽_p)<p² imply E(ℚ_p)[p∞]=E(ℚ_p)[p]. The torsion-avoidance hypothesis therefore makes localization nonzero on the divisible line. Use the rational Kummer comparison to get a nonzero map on one-dimensional spaces and hence injectivity.

Direct inputs: SelmerIwasawaCohomology:L4/elliptic-finite-kummer; SelmerIwasawaCohomology:L1; SelmerIwasawaCohomology:L2; tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4.

**Checks.** Square cardinality alone does not rule out a cyclic group of order p²; use paired elementary divisors or vanishing of every alternating form on a cyclic group. The local p∞-torsion equality is proved at good p≥5, rather than inferred for arbitrary local abelian varieties.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Proof of Theorem C, §3, p. 351. The finite-to-infinite Selmer step and its local torsion criterion. [The Cassels–Tate pairing on polarized abelian varieties](https://math.mit.edu/~poonen/papers/sha.pdf), §1, pp. 1–2; §6, Theorem 8 and Corollary 9, pp. 11–12. The elliptic alternating pairing is perfect after quotient by the divisible part; finite primary groups have paired elementary divisors.

### An odd residual-ramified conductor prime

**Target:** `PC.5/odd-residual-ramification` (lemma). Let E/ℚ be semistable, p≥5 good ordinary and E[p] irreducible. Then E[p] is ramified at some odd q|N, where N is the conductor of E.

**Hypotheses and conventions.** Level lowering is used with the exact finite-flat/good-p hypotheses and irreducibility; no residual image hypothesis stronger than the theorem permits is silently added.

**Argument and dependencies.** If residual ramification vanished at every odd q|N, apply the exact requested weight-two level-lowering theorem to remove those primes. Good reduction at p supplies the finite-flat coefficient-prime condition. The resulting newform has level dividing 2 and weight two. The supplied calculation S₂(Γ₀(1))=S₂(Γ₀(2))=0 contradicts existence.

Direct inputs: SerreWeightAndLevelOptimisation:R20.2.

**Checks.** Do not replace the fixed-p argument with the large-p ramification result used in A.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Proof of Theorem C, §3, p. 351. The level-lowering reason a fixed p has an odd residual-ramified prime.

### Skinner’s mod-p Selmer criterion

**Target:** `PC.5/theorem-c` (theorem). Let E/ℚ be semistable with a nonsplit multiplicative odd prime or two distinct split multiplicative odd primes. Suppose p≥5 is good ordinary, E[p] is irreducible, Sel_p(E)≅𝔽_p, and its image in E(ℚ_p)/pE(ℚ_p) is not contained in the image of E(ℚ_p)[p]. Then rank_ℤ E(ℚ)=ord_(s=1)L(E,s)=1 and the entire Sha(E/ℚ) is finite.

**Hypotheses and conventions.** Use this specific good ordinary p throughout the argument.

**Argument and dependencies.** The mod-p localization lemma gives the rational Selmer line and injective local restriction; parity gives w(E)=−1. Choose an odd residual-ramified q. Apply the auxiliary-field construction using q ramified if its type is St⊗ξ, or q and a distinct odd q′ inert if its type is St. The twist has analytic rank zero, hence zero rational Selmer by the elliptic forward theorem and Kummer comparison. Quadratic decomposition identifies the base-change Selmer line, with injective semilocal restriction. Apply B to E over K and subtract the nonzero twist value. The elliptic forward rank-one theorem gives rank one and entire Sha finiteness over ℚ.

Direct inputs: RankOneConverse:PC.5/mod-p-localization; RankOneConverse:PC.5/odd-residual-ramification; RankOneConverse:PC.4/auxiliary-field; RankOneConverse:PC.1/selmer-parity; RankOneConverse:PC.1/rational-selmer-comparison; RankOneConverse:PC.3/theorem-b; RankZeroOneBSD:BSD.4/analytic-rank-zero-theorem; RankZeroOneBSD:BSD.3/analytic-rank-one-theorem.

**Checks.** No finite-Sha assumption is inserted into C. Export this node to the existing arithmetic-statistics rank-one criteria; do not import those criteria to prove C.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), Theorem C, p. 332; §3, p. 351. The criterion and the fixed-prime field choice.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Close the Cassels–Tate/local finite-to-infinite comparisons and the fixed-p level-lowering export. The layer is planned, with that supplier work recorded rather than treated as implemented.

## PC.6. The rank-zero converse

Rank zero changes the sign of the twist needed for base change. The base-change sign remains −1, but the rational form now has sign +1, so the twist has sign −1. The auxiliary twist must have a **nonzero first derivative**, not a nonzero central value. A sign of −1 permits central order three and therefore is insufficient.

Use the same fixed local D₀ as in PC.4, but now g has sign −1. BFH(i) gives a positive δ with a simple zero, since its condition ε(g)δ<0 forces δ>0. The same local-square and fundamental-discriminant argument preserves every local requirement. This supplies the missing explicit derivative citation in the printed proof of E. The rank-d arithmetic base change follows from the forward supplier and then the corrected localization lemma feeds B.

**Layer inputs.** AutomorphicGaloisRepresentations:R19.3; GL2AutomorphicRepresentationsAndTransfer:R16.3; RankZeroOneBSD:BSD.2; RankOneConverse:PC.1; HeegnerPointEulerSystems:HE.7; RankOneConverse:PC.3; RankZeroOneBSD:BSD.0.

### Rank-zero base change with a derivative twist

**Target:** `PC.6/rank-zero-base-change` (lemma). Let f satisfy Theorem A’s squarefree level and local alternatives, with A_f(ℚ) finite and Sha(A_f/ℚ) finite. Choose a sufficiently large ordinary coefficient prime as in A. Then there is an imaginary quadratic K with odd D, 2,p split and the same admissible local pattern, such that ord_(s=1)L(f⊗χ_D,s)=1, rank_ℤ A_f(K)=d, Sha(A_f/K) is finite and B(e) holds.

**Hypotheses and conventions.** The auxiliary twist now has sign −1; a nonzero central value is not the required input.

**Argument and dependencies.** Use the ordinary-prime/residual-image supplier to choose p,λ and an odd residual-ramified q. Prescribe q ramified if its type is St⊗ξ, or q and a distinct odd level prime inert if its type is St, with all other level primes split. These local choices use no rank-one or negative-sign assumption on f. Kummer and parity give dim H¹_f(ℚ,V)=0 and w(f)=+1. The chosen local pattern still gives w(f/K)=−1, so the twist sign is −1. Choose D₀ with that local pattern. Apply BFH(i) to g=f⊗χ_(D₀), sign −1, with all primes of 2pND₀ cond(g) split in a positive discriminant δ. Then D=D₀δ keeps the local pattern and the double twist has a simple central zero. The requested GL₂-type forward theorem makes A_f^D rank d with finite entire Sha. The quadratic isogeny gives the base-change arithmetic conditions. Apply the corrected arithmetic-localization lemma at the selected λ.

Direct inputs: AutomorphicGaloisRepresentations:R19.3/skinner-density-one-ordinary-primes; GL2AutomorphicRepresentationsAndTransfer:R16.3; RankZeroOneBSD:BSD.2/bfh-nonvanishing; RankZeroOneBSD:BSD.2; RankOneConverse:PC.1/selmer-parity; RankOneConverse:PC.1/rational-selmer-comparison; RankOneConverse:PC.1/arithmetic-localization; HeegnerPointEulerSystems:HE.7.

**Checks.** The derivative is nonzero by BFH(i), rather than by a negative root number alone.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §4, proof of Theorem E, pp. 351–352. The derivative nonvanishing branch for the rank-zero converse. [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, unnumbered Theorem (i), pp. 543–544. Apply the negative-sign form of the splitting-prescribed derivative theorem after a fixed local twist.

### Skinner’s rank-zero converse

**Target:** `PC.6/theorem-e` (theorem). Let f have weight two, trivial character, squarefree N and the same local alternatives as Theorem A. If A_f(ℚ) is finite and Sha(A_f/ℚ) is finite, then L(f,1)≠0, equivalently ord_(s=1)L(f,s)=0, and ord_(s=1)L(A_f,s)=0.

**Hypotheses and conventions.** The assertion is precisely the squarefree/local-type result of Theorem E; it does not claim every rank-zero main-conjecture converse mentioned in the introduction.

**Argument and dependencies.** Use the derivative-twist base-change lemma to obtain B(e) and the other B hypotheses. Apply B to conclude ord L(f/K)=1. The twist already has order one, so base-change factorization and additivity of finite analytic orders force ord L(f)=0. Repeat the same argument for every f^σ: the modular abelian isogeny class, arithmetic hypotheses and local St or St⊗ξ alternatives are unchanged. Each conjugate central value is nonzero; only then use the conjugate-product dictionary to obtain ord L(A_f)=0.

Direct inputs: RankOneConverse:PC.6/rank-zero-base-change; RankOneConverse:PC.3/theorem-b; RankZeroOneBSD:BSD.0.

**Checks.** Nonvanishing of the base factor follows from total order one and twist order one.

**Sources.** [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf), §4, Theorem E, pp. 351–352. The stated rank-zero converse, derived through the quadratic-field p-converse.

**Acceptance for this layer.** Every target above has an exact supplier or baseline input. Close the derivative-branch BFH reduction and the GL₂-type forward/Sha and analytic-order exports. The layer is planned, with that supplier work recorded rather than treated as implemented.

## Supplier exports and closure ledger

A request names an existing mathematical owner. It does not assert that the result has been formalized or that a source obligation in that supplier is already resolved. The existing GZ.8 general-height node records its own book-proof and normalization obligations, the ordinary parity node records its proof interfaces, and the requested HE.7 bridge retains the RM descent hypotheses. These are not bypassed by naming their final theorems. In particular, “complete” below describes this pass through the roadmap, while “closed” would require the requested exports and inherited obligations to be discharged.

1. **GL2AutomorphicRepresentationsAndTransfer:R16.3.** For weight-two squarefree trivial-character forms, export the full local base-change epsilon dictionary at split, inert and ramified level primes: a split prime contributes +1 to w(f/K), an inert Steinberg or quadratic-unramified Steinberg contributes −1, a ramified St contributes −1 and a ramified St⊗ξ contributes +1, with the archimedean − sign. Include split/nonsplit multiplicative dictionary for elliptic curves and exclusion of CM at squarefree level. Consumers: RankOneConverse:PC.0/heegner-cases, RankOneConverse:PC.4/auxiliary-field, RankOneConverse:PC.4/theorem-a, RankOneConverse:PC.4/theorem-a-prime.

2. **SelmerIwasawaCohomology:L4.** Extend the existing elliptic finite-Kummer comparison to A_f with its M-action and every λ-component, including local finite Kummer images, rational Tate module of Sha cokernel, finite generation, purity vanishing away from p and compatibility with quadratic restriction and logarithms. Supply the comparison on canonical continuous-cochain carriers, not a new abstract Selmer field. Consumers: RankOneConverse:PC.1/rational-selmer-comparison.

3. **RankZeroOneBSD:BSD.1.** Extend quadratic rank/Sha and isogeny comparisons from E to the GL₂-type A_f and its twist: the degree-power-of-two isogeny A_f×A_f^D→Res A_f, rational ± point/Selmer decompositions, isogeny invariance of whole Sha finiteness, finite restriction/corestriction errors including the 2-primary part. Export the actual newform/conjugate L-function factorization with ramified twist factors through BSD.0. Consumers: RankOneConverse:PC.1/rational-selmer-comparison, RankOneConverse:PC.4/theorem-a-prime.

4. **SelmerIwasawaCohomology:L1.** Supply the imaginary-quadratic Euler-characteristic/Poitou–Tate specialization for the geometric weight-two Tate realization with H⁰ vanishing, and the elliptic Cassels–Tate alternating pairing with kernels the maximal divisible subgroups. On finite p-primary Sha the pairing is perfect and forces paired elementary divisors, ruling out every nonzero cyclic group. Consumers: RankOneConverse:PC.1/semilocal-dimension, RankOneConverse:PC.5/mod-p-localization.

5. **SelmerIwasawaCohomology:L2.** Reuse the general Selmer structures and finite elliptic Kummer/descent targets already owned by TauCetiRoadmap EllipticCurves Layer 7; do not construct them again. Export the actual one-sided inertia-strict/other-place-relaxed local structure for T⊗Λ* and its dual, finite/cofinite generation and the finite p-to-p∞ elliptic Kummer comparison under E(ℚ)[p]=0. Include the local good-reduction p≥5 calculation E(ℚ_p)[p∞]=E(ℚ_p)[p], and detection of a nonzero rational local map from a mod-p image outside that torsion image. Consumers: RankOneConverse:PC.2/deformed-selmer, RankOneConverse:PC.5/mod-p-localization.

6. **SelmerIwasawaCohomology:L3.** For the specific ordinary rank-two geometric representation and imprimitive local conditions of Skinner §2.7, export exact two-variable-to-anticyclotomic ψ₀-twisted control after inverting p, suitable for Fitting base change. Also export augmentation finite-index Sel_𝔭(W)→Sel_∞[γ−1], computing the local error (M_∞^{I_𝔭}/(γ−1)M_∞^{I_𝔭})^{G_(K_𝔭)} as finite, and compare the rationalized inertia condition with the full local kernel H_𝔭. State the invariant/purity/ordinary arguments and finite-generation hypotheses; the existing elliptic all-split HE.8b statement is insufficient for general Case I ramification and Case II. Record the coefficient-duality identification of the Pontryagin fibre, independent of the rationalized conclusion. Consumers: RankOneConverse:PC.2/deformed-selmer, RankOneConverse:PC.2/wan-divisibility, RankOneConverse:PC.2/augmentation-control.

7. **PadicMeasuresIwasawaAlgebras:L5.** Over normal completed unramified coefficient power-series rings, export Fitting base change plus divisorial closure of a principal containing ideal under the exact Selmer-control hypotheses (Skinner–Urban author copy Corollary 3.2.9). Export char(X)⊆(γ−1)⇒positive O-corank X/(γ−1) for finitely generated torsion X, together with the nontorsion Nakayama branch and faithful O→O^ur coefficient comparison. Finite pseudo-null modules must not contribute an augmentation divisor. Consumers: RankOneConverse:PC.2/wan-divisibility, RankOneConverse:PC.2/augmentation-obstruction.

8. **AutomorphicCongruences:L2.** Export the published ordinary Wan Theorem 1.2 proof’s imprimitive fixed-weight two-variable Fitting bound after inverting p, with the branch character of infinity type (κ/2,−κ/2), κ even ≥6 and divisible by 2(p−1), factorization through Γ_K of the avatar of ξ|·|^(κ/2)(ω⁻¹∘Nm), residual irreducibility over G_K and a nonsplit q||N. Retain exceptional-prime/normality arguments from §9; this is the ordinary arXiv:1408.4044/published 2020 theorem, not withdrawn arXiv:1412.1767 or the nonordinary replacement. Consumers: RankOneConverse:PC.2/wan-divisibility.

9. **GrossZagierAndArithmeticHeights:GZ.9.** Complete the exact normalization comparison of Wan’s ψ₀-twisted anticyclotomic function with Skinner L_𝔭^S in O^ur[[Γ]][1/p], including all removed Euler factors and a nonzero period scalar at augmentation. Export the squared-log value formula for the ramified Case I as well as the existing all-split and Case II formulas; retain the p-Euler factor and the rational pre-projector point. Existing bdp-measure-integrality/eigenlogarithm nodes are reused, not reconstructed. Consumers: RankOneConverse:PC.2/analytic-dictionary, RankOneConverse:PC.3/point-and-logarithm.

10. **HeegnerPointEulerSystems:HE.7.** Export the full forward rank-zero/rank-one theorem for the weight-two GL₂-type factors used here: ord L(f)=r∈{0,1} gives rank A_f(ℚ)=d r and finite entire Sha, stable under quadratic twist and rational isogeny. Bridge the existing admissible-RM Kolyvagin–Logachev theorem’s maximal-endomorphism-order and non-CM hypotheses to A_f (and the selected quaternionic/Hodge realization), or state precisely the additional supplier comparisons. Do not replace this with clean single-prime descent or elliptic-only BSD.3–4. Consumers: RankOneConverse:PC.3/theorem-b, RankOneConverse:PC.4/theorem-a, RankOneConverse:PC.6/rank-zero-base-change.

11. **RankZeroOneBSD:BSD.2.** Supply locally prescribed quadratic nonvanishing without a coprime-only sign formula: construct one negative odd fundamental D₀ with the fixed local quadratic characters (2,p split, one allowed ramified prime or two inert primes), then apply the existing BFH theorem to the normalized newform f⊗χ_(D₀). For sign +1 use its value branch with positive δ; for sign −1 use its derivative branch with positive δ. Put all primes of 2pND₀ cond(f⊗χ_(D₀)) in the split set, prove δ is coprime to D₀, D₀δ is fundamental and locally identical at that set, and identify normalized double twists and actual L-functions. This derives the required ramified/inert prescription from the directly read BFH pp.543–544 rather than appealing to an unchecked derivative assertion. Consumers: RankOneConverse:PC.4/auxiliary-field, RankOneConverse:PC.6/rank-zero-base-change.

12. **SerreWeightAndLevelOptimisation:R20.2.** Export the exact fixed-p, semistable weight-two level-lowering contradiction used in Skinner C: irreducible E[p], p≥5 good ordinary, and no residual ramification at any odd q|N imply a weight-two newform of level dividing 2; include the finite-flat p condition and proof S₂(Γ₀(1))=S₂(Γ₀(2))=0. Consumers: RankOneConverse:PC.5/odd-residual-ramification.

13. **RankZeroOneBSD:BSD.0.** Export the actual analytic L-function and order/additivity interface for weight-two newforms and all conjugates, plus A_f and its quadratic base change at every local factor, including ramified conductor primes. The existing elliptic-only nodes are the comparison model, not a GL₂-type proof. Consumers: RankOneConverse:PC.3/point-and-height, RankOneConverse:PC.4/theorem-a, RankOneConverse:PC.6/theorem-e.

14. **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4.** Reuse the existing upstream Layer 7 general discrete Selmer structure, finite elliptic Kummer exact sequence, finite Sel_p and Sha targets. This is an import of existing roadmap work, not a request to revise or duplicate it. The p∞/rational local-condition comparison is requested from SelmerIwasawaCohomology. Consumers: RankOneConverse:PC.5/mod-p-localization.

No internal mathematical gap is concealed in the assembly. There are fourteen explicit supplier requests, including one import of existing EllipticCurves Layer 7 targets. The layer-specific remaining work is exactly the corresponding exports above. No new successor roadmap or restructuring is needed: these additions lie inside their existing owners, and this roadmap is already the Part II for the converse.

## Source corrections and version discipline

The exact source URLs, read date 2026-10-18 and SHA-256 file hashes are in the packet. The published Skinner PDF is the reference for its numbered statements. The Wan input is the **published ordinary** Algebra & Number Theory paper associated with arXiv:1408.4044, not the withdrawn nonordinary arXiv:1412.1767. Skinner’s older §7.5 and §2.2 Wan references correspond to the published §7E and §2B–C. The Skinner–Urban source read is explicitly an author-hosted copy: Fitting/divisorial algebra is in §3.1.6, pp.19–20; Proposition 3.2.8 and Corollary 3.2.9 are on pp.23–24. These are not asserted journal-page locators. Brooks’s rational transfer normalization is in §2.7, p.4190; this is distinct from the Petersson-norm ratio.

The independent review records thirteen source findings, all paraphrased against the versions read: twelve confirmed and one rejected as a substantive gap. Two confirmed proof omissions are componentwise logarithm nonvanishing in Skinner Lemma 2.2.2 and Corollary 2.6.2. BSW Theorem 1.1, applied to the actual pre-projector point, repairs both without changing the rank-one conclusions. BSW §1.2, p.2, also identifies the omitted componentwise-logarithm justification. Its structural-rank conjectures are not used.

The alleged substantive gap in Theorem E is rejected: the short source argument invokes the auxiliary-field method, and BFH has the derivative branch required there. The explicit two-twist reduction above supplies the details; a root number alone is never used to infer a simple zero. E6 is narrowed to the omitted form argument in the proof of **Proposition 2.6.1**, p.344: the source itself already explains the projector/logarithm comparison. E7 belongs to the **opening of §2.6**, p.341. E11 concerns the rational transfer normalization, not a norm definition.

The other confirmed Skinner findings concern UFD wording, the omitted restriction in the residual contradiction, the tame-prime letter, reversed point notation, the missing finite-condition subscript in the rank bound and character/extension terminology. Brooks Propositions 8.12–8.13, p.4239, must retain the logarithm square from Theorem 8.11. The review also records E13: in the intervening pullback rule, the input point belongs to the source curve C, not the target C′.

BSW is read as arXiv:2603.20886v2. No claim that an arbitrary coefficient tensor or nonzero cohomology class has a nonzero scalar logarithm is made. The Annals landing page and existing atlas source corrections were checked. Primary-source searches for Brooks corrections at OUP and EPFL found none; direct publisher/DOI landing-page retrieval was unavailable. Each source finding now has its own independent verdict and reason in the packet.

## Complete source-target ledger

- Theorems A and A′, pp.330–331: `RankOneConverse:PC.4/theorem-a`, `RankOneConverse:PC.4/theorem-a-prime`.
- Theorem B, p.331: `RankOneConverse:PC.3/theorem-b`.
- Theorem C, p.332: `RankOneConverse:PC.5/theorem-c`.
- Theorem D, p.332: `ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one`. Imported result and downstream consumer, not a converse prerequisite.
- Lemmas 2.2.1–2.2.2, pp.337–338: `RankOneConverse:PC.1/selmer-parity`, `RankOneConverse:PC.1/arithmetic-localization`.
- Lemmas 2.3.1–2.3.2, pp.338–339: `RankOneConverse:PC.1/semilocal-dimension`, `RankOneConverse:PC.1/strict-kernels`.
- Proposition 2.5.1 and Corollary 2.5.2, pp.340–341: `RankOneConverse:PC.3/point-and-height`.
- Proposition 2.6.1 and Corollary 2.6.2, pp.343–344: `RankOneConverse:PC.3/point-and-logarithm`.
- Conjecture 2.7.1, p.345: `ModularIwasawaMainConjectures:L0`. Context only: equality is not assumed in this plan.
- Propositions 2.7.2–2.7.3 and equations (2.7.1)–(2.7.2), pp.345–347: `RankOneConverse:PC.2/wan-divisibility`, `RankOneConverse:PC.2/augmentation-control`, `RankOneConverse:PC.2/augmentation-obstruction`.
- Lemma 2.8.1, p.347: `RankOneConverse:PC.0/residual-restriction`.
- Theorem E, pp.351–352: `RankOneConverse:PC.6/theorem-e`.

The other objects used in the argument retain the following owners. Newform realizations, their coefficient projectors, residual representations and the density-one ordinary-prime choice are R19.1, R19.3, R19.4–5 and R19.6 of AutomorphicGaloisRepresentations. Automorphic local types, local epsilon factors and rational Jacquet–Langlands are R16.3 and R17.3. The canonical anticyclotomic extension and class-field characters are inherited through HE.0, GZ.9 and the Iwasawa suppliers. CM points, traces, rational Hodge classes and Jacobian quotients are HE.1/GZ.3. Heights and their positivity are GZ.1/GZ.8. Completed group rings, bounded measures, evaluation, Pontryagin duals, characteristic ideals and Fitting/divisorial specialization are PMIA L0–L5. Continuous arithmetic cohomology, local conditions, duality, Euler characteristics, Kummer comparisons and control are the Selmer/duality suppliers. This inventory accounts for the definitions and key inputs needed by the paper’s targets without a second plan for their foundations.

The compact Lean file elaborates against pinned Mathlib with only proof-placeholder warnings. It has one real-bodied definition, four API theorem signatures, four examples and two semilocal milestone signatures. It is 106 lines rather than an attempted development of the unavailable arithmetic theory. The normalized Heegner point, anticyclotomic module, auxiliary-field construction and the five arithmetic final statements are specified above. The unit tests for those heavy constructions are acceptance targets for their eventual canonical carriers, and are not encoded using invented proposition fields.

Independent review REV-DESIGN-SKINNER accepts this complete planning pass after the corrections recorded above. Supplier interfaces must be closed before any layer is declared closed. The downstream statistics packet can replace its recorded missing-owner references with PC.3/theorem-b and PC.5/theorem-c after acceptance. No implementation status is advanced by this plan.
