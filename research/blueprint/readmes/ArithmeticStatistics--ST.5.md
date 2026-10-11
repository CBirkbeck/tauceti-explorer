# Arithmetic statistics: beyond first moments

This additive plan covers `ArithmeticStatistics:ST.5`. The [packet](../packets/ArithmeticStatistics--ST.5.json) adds 55 targets to the 194 targets imported unchanged from the [accepted parent](../packets/ArithmeticStatistics.json). ST.5 is **planned**: each target ends in a pinned declaration, an imported target, a precise supplier request or a recorded gap. The pass is complete at target level, with sixteen gaps and nineteen requests. Every implementation status remains unchecked.

The layer connects locally compact quadratic intersection laws, integral isotropic models and finite-group moment determination to consequences of arithmetic Selmer averages. Random-model identities, conjectural arithmetic distributions and established arithmetic bounds have different conclusions and hypotheses. In particular, convergence of frequencies does not imply convergence of unbounded moments. The source conjectures below are propositions to formulate; their inclusion supplies no proof of those conjectures.

The [parent reader](ArithmeticStatistics.md) owns the finite group carriers, alternating pairings and random matrices, the Poonen–Rains and BKLPR laws, the existing Selmer averages, the finite-field class-group comparisons and their corrected limits. The [ST.0](ArithmeticStatistics--ST.0.md), [ST.1](ArithmeticStatistics--ST.1.md), [ST.2](ArithmeticStatistics--ST.2.md), [ST.3](ArithmeticStatistics--ST.3.md) and [ST.4](ArithmeticStatistics--ST.4.md) parts supply family conventions, orbit geometry, counts, tower means and local masses. Their remaining qualifications travel with their imports. This document organizes the new interfaces by their mathematical use.

## Conventions and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap and Tau Ceti trees were also checked read-only at `070dc2becd74419e76303ede84b465ed4a69461f` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The full ProfiniteArithmetic and StandardDistributions readers, and the relevant IntegralLattices, OrthogonalSpinGroups and EllipticCurves interfaces, determine the ownership boundaries.

Write the circle additively as ℝ/ℤ. A quadratic map is homogeneous over ℤ, with polar form q(x+y)−q(x)−q(y). There is no division by two in this convention. Nondegeneracy is a homeomorphic additive equivalence to all continuous characters, with their compact-open topology. A maximal isotropic subgroup has q identically zero and is its own annihilator; bilinear isotropy alone does not meet the definition at two. The ambient group is locally compact Hausdorff; second countability enters the finite-reduction and measure assertions. Finite ℚ/ℤ quadratic modules and their isotropic quotients are imports from IntegralLattices and Tau Ceti.

Restricted products use the existing carrier and its integral reference subgroups. The current Tau Ceti additive convenience alias postdates the atlas pin; pinned Mathlib `RestrictedProduct` is the baseline reference. Generic Pontryagin duality, finite-flat cohomology and adelic exactness belong to their existing suppliers. The locally compact quadratic compatibility and finite-exponent applications here require the named Part II extensions.

The integral orthogonal Grassmannian uses the split quadratic form q(x,y)=Σxᵢyᵢ on a rank-2n module and rank-n locally direct-summand subbundles. This is a quadratic scheme over ℤ, including two. It imports the generic Grassmannian from `AlgebraicModuliForArithmeticGeometry:R09.1`; it does not rebuild the characteristic-not-two group theory of OrthogonalSpinGroups. A fixed-rank Schubert stratum carries its intrinsic integral-point measure. A null ambient event cannot be used as ordinary conditional probability.

Finite abelian groups are counted up to isomorphism only where the imported carrier says so. Symplectic groups retain their pairing and pairing-preserving automorphisms. Wood's profiles are conjugate partitions on a fixed bounded-exponent carrier. Existence of a law on every bounded-exponent quotient does not supply the full-group tightness needed for a Cohen–Lenstra limit. The current scalar moment-determinacy theorem requires a finite exponential neighborhood; that hypothesis does not replace the group-moment growth condition below.

Elliptic curves over ℚ use minimal integral short Weierstrass equations y²=x³+Ax+B, excluding 4A³+27B²=0, with H=max(4|A|³,27B²). Minimality means that no prime has p⁴ dividing A and p⁶ dividing B together. Hyperelliptic coefficient families use the source's fixed-degree bounded-height coefficient models as supplied by ST.0; their denominators retain model multiplicity. The marked quartic theorem uses its orbit denominator and Jacobian invariant height. Neither is an unweighted average over Jacobian isomorphism classes.

Number-field twists count each element of F×/F×² once, with H(s)=∏Nv over finite places with odd v(s). At a finite completion, local averaging is the pullback of additive Haar probability on Oᵥ. It is not the uniform counting measure on squareclasses. Archimedean representative windows and their finite multiplicities are those of the ST.2 twist-count interface. A Selmer group means the actual cohomological group with Kummer local conditions; use fppf cohomology if the characteristic divides the isogeny degree. Sha¹ of a finite group scheme is distinct from the Tate–Shafarevich group of an abelian variety.

An upper average bound denotes a limsup of finite-height averages, and a lower proportion denotes a liminf. All height sublevel sets must be finite before their cardinal is used. Mixture inequalities are proved before taking limits. The rank-zero BSD consequence asserts equality of algebraic and analytic ranks; it asserts no leading-coefficient formula.

## Accepted imports and planet budget

Every identifier in the following catalogue has prefix `ArithmeticStatistics:ST.5/` and remains owned by the accepted parent packet. Its complete statement, API, tests, source repairs and proof obligations are imported from there. No target is replaced by a shorter statement in this catalogue.

| Imported suffix | Target |
| --- | --- |
| `height-moments-in-an-arithmetic-family` | Higher height moments in an arithmetic family |
| `gaussian-binomial-coefficient` | The Gaussian binomial coefficient and the count of subspaces of 𝔽_q^n |
| `cauchy-q-binomial-theorem` | Cauchy's q-binomial theorem |
| `isomorphism-classes-of-finite-abelian-p-groups` | Isomorphism classes of finite abelian p-groups, indexed by partitions |
| `automorphism-count-of-finite-abelian-p-groups` | The order of the automorphism group of a finite abelian p-group |
| `surjection-count` | The number of surjective homomorphisms between abelian groups |
| `exact-surjection-count-formula` | Exact count of surjections between finite abelian p-groups |
| `cohen-lenstra-measure` | The Cohen–Lenstra measure μ_{p,u} |
| `partitions-with-large-parts-by-largest-part` | Partitions with parts at least u+1 versus partitions by largest part |
| `hall-partition-identity` | Hall's partition identity |
| `weighted-inverse-automorphism-sum` | The weighted sum of inverse automorphism counts |
| `cohen-lenstra-mass-formula` | The Cohen–Lenstra mass formula |
| `surjection-moment` | Surjection moments of a measure on finite abelian p-groups |
| `extension-groupoid-of-finite-abelian-groups` | The groupoid of extensions of finite abelian groups has cardinality one |
| `surjection-weighted-class-count` | Surjection-weighted class counts |
| `cohen-lenstra-moments` | The moments of the Cohen–Lenstra measure |
| `cohen-lenstra-contraction-constant` | The Cohen–Lenstra constant exceeds one half for odd primes |
| `moments-determine-the-cohen-lenstra-measure` | A probability measure with all surjection moments 1 is the Cohen–Lenstra measure |
| `enlargement-of-finite-abelian-p-groups` | Enlargements of a finite abelian ℓ-group |
| `aggregate-enlargement-inequality` | The aggregate enlargement inequality (EVW (8.4.1), corrected proof) |
| `partition-tail-domination` | Partition numbers are dominated by (ℓ − 1)^s |
| `finite-enlargement-domination-of-tails` | Tails of surjection counts are dominated by enlargements (EVW Lemma 8.4) |
| `finite-moment-control-of-masses` | Finitely many approximate moments control finitely many masses (EVW Proposition 8.3) |
| `moment-convergence-implies-distribution-convergence` | Convergence of surjection moments implies convergence in distribution (EVW §8.5, corrected) |
| `distribution-convergence-does-not-force-moment-convergence` | Distribution convergence without moment convergence |
| `moments-determine-cohen-lenstra-limits-for-all-p-and-u` | Moments \|A\|^{−u} determine the limit law, for every prime p and every u (Wood) |
| `cokernel-law-of-haar-random-p-adic-matrices` | The cokernel law of Haar-random p-adic matrices |
| `haar-matrix-cokernel-surjection-moments` | Exact moments of cokernels of Haar-random p-adic matrices |
| `friedman-washington-cokernel-law` | Friedman–Washington: cokernels of Haar-random p-adic matrices |
| `friedman-washington-translation-form` | The cokernel of 1 − F for Haar-random F |
| `cohen-lenstra-measure-over-a-finite-set-of-primes` | The Cohen–Lenstra measure CL_S for a finite set of primes |
| `cohen-lenstra-heuristic-for-quadratic-fields` | The Cohen–Lenstra heuristic for quadratic fields (conjecture) |
| `cohen-lenstra-moment-conjecture-for-quadratic-fields` | The moment form of the Cohen–Lenstra heuristic (conjecture) |
| `cohen-lenstra-moment-form-implies-heuristic` | The moment form implies the Cohen–Lenstra heuristic (imaginary, p odd) |
| `matrix-kernel-law-over-a-finite-field` | The kernel law P(m, n, j) of uniformly random matrices over a finite field |
| `rank-count-of-matrices-over-a-finite-field` | The number of matrices of given rank over a finite field |
| `symmetric-matrix-kernel-law` | The kernel law P_Sym(r, n) of uniformly random symmetric matrices |
| `macwilliams-symmetric-rank-count` | MacWilliams' count of symmetric matrices of given rank |
| `limit-of-the-symmetric-kernel-law` | The limit of P_Sym(r, n) with an explicit rate |
| `koymans-pagano-rank-identity` | The Koymans–Pagano identity (A.2) |
| `cohen-martinet-predicted-surjection-moment` | The Cohen–Lenstra–Martinet predicted surjection moment |
| `cohen-lenstra-martinet-average-conjecture` | The Cohen–Lenstra–Martinet average conjecture (LOWW (1.1)) |
| `cohen-martinet-surjection-moment-conjecture` | The Cohen–Martinet surjection-moment conjecture (Wang–Wood form) |
| `relative-three-torsion-as-irreducible-hom-count` | Relative 3-torsion as a count of equivariant maps to an irreducible module |
| `cohen-martinet-prediction-for-relative-three-torsion` | The Cohen–Lenstra–Martinet prediction 1 + 3^{−u} for h_3(K/F) (LOWW Proposition 7.1) |
| `cohen-martinet-prediction-for-three-torsion-of-two-extensions` | The Cohen–Lenstra–Martinet prediction for h_3(K/k) (LOWW §7.2) |
| `dihedral-quartic-proven-average-versus-prediction` | Proven D_4 averages of h_3 differ from the Cohen–Lenstra–Martinet prediction |
| `enhanced-cohen-lenstra-finite-level-law` | The finite-level enhanced Cohen–Lenstra laws |
| `zero-cokernel-probability-at-two` | The probability that 1 − F² is invertible modulo 2 |
| `zero-cokernel-probability-lower-bound-at-odd-primes` | A uniform lower bound for invertibility of 1 − F² at odd primes |
| `enhanced-cohen-lenstra-conjecture` | The enhanced Cohen–Lenstra conjecture for a family of abelian varieties (conjecture) |
| `maximal-isotropic-subspaces-of-a-quadratic-space` | Maximal isotropic subspaces of a quadratic space over 𝔽_p |
| `isotropic-reduction-map` | Reduction of maximal isotropic subspaces to X^⊥/X |
| `fibres-of-the-isotropic-reduction-map` | Every fibre of the isotropic reduction map has ∏(p^{n−i} + 1) elements |
| `number-of-maximal-isotropic-subspaces` | Number of maximal isotropic subspaces of a weakly metabolic 𝔽_p-space |
| `intersection-dimension-generating-function` | Generating function of dim(Z ∩ W) for a uniformly random maximal isotropic Z |
| `intersection-dimension-law-closed-form` | Closed formula for the finite intersection law a_{d,n} |
| `poonen-rains-distribution` | The Poonen–Rains distribution X_{Sel_p} |
| `intersection-law-converges-to-poonen-rains` | The finite intersection laws converge to the Poonen–Rains distribution, which has total mass one |
| `poonen-rains-moments` | Moments of p^{X}: the Poonen–Rains moment formula |
| `poonen-rains-parity` | Parity equidistribution and parity-conditioned moments of the Poonen–Rains law |
| `delaunay-sha-p-rank-law` | Delaunay's law for dim_{𝔽_p} Ш[p] in rank r |
| `delaunay-compatibility-of-the-selmer-model` | The only rank law compatible with the Selmer and Ш models is 50% rank 0, 50% rank 1 |
| `count-of-nondegenerate-alternating-matrices` | Proportion of invertible alternating matrices over 𝔽_p |
| `alternating-matrix-kernel-law` | Kernel law of a uniformly random alternating matrix over 𝔽_p (Smith's P^Alt) |
| `alternating-kernel-law-formula` | Closed formula for the kernel law of random alternating matrices over 𝔽_p |
| `alternating-kernel-law-limit-is-poonen-rains` | Random alternating kernels have the Poonen–Rains law in the parity-averaged limit |
| `symplectic-finite-abelian-p-groups` | Symplectic finite abelian p-groups and their symplectic automorphism groups |
| `alternating-cokernel-law` | Cokernel law of a Haar-random alternating matrix over ℤ_p |
| `bklpr-alternating-cokernel-limit` | BKLPR: limiting cokernel law of random alternating matrices |
| `bklpr-model` | The BKLPR model for the p^∞-Selmer sequence |
| `bklpr-random-isotropic-intersection-law` | BKLPR: intersections of random maximal isotropic ℤ_p-submodules realise the model |
| `maximal-isotropic-direct-summands-modulo-prime-powers` | Number of maximal isotropic direct summands of (ℤ/p^e)^{2n} |
| `bklpr-injection-moments` | BKLPR: moments of injection counts in the mod-q model |
| `poonen-rains-selmer-conjecture` | The Poonen–Rains conjecture for p-Selmer groups over ℚ (as a stated proposition) |
| `bhargava-shankar-selmer-average-conjecture` | The σ(n) conjecture for average Selmer sizes (as a stated proposition) |
| `selmer-average-conjecture-implies-rank-at-most-one` | If the σ(n) conjecture holds for infinitely many n, then 100% of curves have rank at most 1 |
| `bklpr-selmer-conjecture` | The BKLPR conjecture for p^∞-Selmer sequences over ℚ (as a stated proposition) |
| `rational-p-torsion-has-density-zero` | For each prime p, 100% of curves E_{A,B}/ℚ have no rational p-torsion |
| `bklpr-conjecture-implies-rank-and-selmer-laws` | Consequences of the BKLPR conjecture: rank law, finiteness of Ш[p^∞] and the Poonen–Rains law |
| `average-size-of-the-3-selmer-group` | Bhargava–Shankar: the average size of the 3-Selmer group is 4 |
| `average-rank-bound-from-the-3-selmer-average` | The average 3-Selmer rank, hence the average rank, is at most 7/6 |
| `average-size-of-the-4-selmer-group` | Bhargava–Shankar: the average size of the 4-Selmer group is 7 |
| `average-size-of-the-5-selmer-group` | Bhargava–Shankar: the average size of the 5-Selmer group is 6 |
| `second-moment-of-the-2-selmer-group` | Bhargava–Shankar–Swaminathan: the second moment of #Sel_2 is at most 15 |
| `two-selmer-distribution-in-full-two-torsion-twist-families` | Heath-Brown, Swinnerton-Dyer, Kane: the 2-Selmer rank distribution in quadratic twist families |
| `function-field-3-selmer-average-bound` | de Jong: the average size of the 3-Selmer group over 𝔽_q(t) is at most 4 + O(1/q) |
| `p-infinity-selmer-corank-distribution-in-twist-families` | Distribution of p^∞-Selmer coranks in a quadratic twist family |
| `smith-twist-family-hypothesis` | Smith's Assumption 1.1 on an elliptic curve over ℚ |
| `congruent-number-curve-satisfies-smith-hypothesis` | The congruent number curve satisfies Smith's Assumption 1.1 (case 3) |
| `smith-selmer-rank-limit-equals-corank` | Smith's ℓ^∞-Selmer corank equals the ℤ_ℓ-corank of Sel_{ℓ^∞} |
| `two-point-corank-law-forces-zero-density-of-high-corank` | A two-point limiting corank law forces density zero for corank at least 2 |
| `even-congruent-twists-have-corank-zero-given-smith-law` | Burungale–Tian Theorem 3.3 from Smith's 2^∞-Selmer law: corank zero for 100% of even congruent twists |
| `selmer-ratio-of-an-isogeny` | Local and global Selmer ratios of an isogeny and the classes T_m(φ) |
| `local-selmer-ratio-via-tamagawa-numbers` | Local Selmer ratios via Tamagawa numbers and the formal group (Schaefer) |
| `tamagawa-ratio-under-potentially-good-reduction` | Isogenous curves with a quadratic twist of good reduction have equal Tamagawa numbers (BKLOS Lemma 11.1) |
| `selmer-ratio-classes-are-locally-defined` | The classes T_m(φ) are cut out by finitely many local conditions |
| `bklos-average-size-of-three-isogeny-selmer-groups` | BKLOS: the average size of 3-isogeny Selmer groups in quadratic twist families |
| `cassels-isogeny-selmer-ratio-formula` | Cassels' formula relating φ- and φ̂-Selmer groups to the Selmer ratio |
| `isogeny-factorisation-selmer-exact-sequence` | The Selmer exact sequence of a composite isogeny |
| `three-isogeny-selmer-parity` | Parity of the 3-Selmer rank from the Selmer ratio (Cassels; BES Proposition 42(ii)) |
| `finitely-many-twists-with-rational-p-torsion` | Only finitely many quadratic twists have rational odd p-torsion |
| `reduced-p-selmer-rank-bounds-the-corank` | The p-Selmer rank modulo torsion bounds the p^∞-Selmer corank |
| `three-selmer-rank-zero-in-selmer-ratio-one-twists` | At least half of the twists with Selmer ratio one have 3-Selmer rank zero (BKLOS Theorem 2.5(a), Selmer form) |
| `three-selmer-rank-one-in-odd-selmer-ratio-twists` | At least five sixths of the twists with \|t\| = 1 have 3-Selmer rank one (BKLOS Theorem 2.5(b)) |
| `positive-proportions-of-three-selmer-ranks-in-local-subfamilies` | Positive proportions of 3-Selmer ranks zero and one in local subfamilies of twists |
| `cm-curves-have-a-twist-with-good-reduction` | A CM elliptic curve with maximal endomorphism order has a twist with good reduction at each finite place |
| `cm-three-isogeny-has-selmer-ratio-one` | BKLOS: a 3-isogeny between curves with CM by the maximal order has Selmer ratio one |
| `cm-twists-have-corank-zero-at-least-half` | At least half of the quadratic twists of a CM curve have 3^∞-Selmer corank zero (Burungale–Tian Theorem 3.5) |
| `coefficient-vector-form` | Coefficient-vector forms and the Veronese vector |
| `local-density-of-a-form-modulo-q` | The finite-level local density σ(a; Q) |
| `polynomial-congruence-under-perturbation` | A polynomial value moves inside the ideal of the perturbation |
| `first-order-taylor-congruence` | First-order Taylor congruence for multivariate polynomials |
| `local-density-first-moment` | First moment of σ(·; p^r) over primitive coefficient vectors |
| `two-point-incidence-count` | Coefficient vectors vanishing at two primitive points modulo p^r |
| `veronese-minor-valuation` | The Veronese map preserves the minor valuation of a pair of primitive vectors |
| `primitive-pair-minor-gcd-sum` | Sum of gcd(G(b_1, b_2), p^r) over pairs of primitive vectors |
| `local-density-second-moment` | Second moment of σ(·; p^r) |
| `local-density-variance` | Variance of σ(·; p^r) over primitive coefficient vectors |
| `gradient-valuation-strata` | Capped valuation of vectors and the gradient strata R^{(e)}(p^r) |
| `high-gradient-stratum-count` | High gradient valuation is rare: #R^{(e)}(p^r) ≤ 2p^{rN−e} |
| `fixed-gradient-valuation-hensel-lifting` | Hensel lifting at a fixed gradient valuation (Browning–Matthiesen) |
| `local-density-lower-bound-on-gradient-stratum` | Lower bound for σ(a; p^r) on a gradient stratum |
| `convex-concentration-inequality` | Convex concentration of a bounded mass distribution |
| `weighted-square-concentration` | Numerical core of the model-count concentration |
| `model-ring-orbit-count-concentration` | Large model-ring orbit counts force a large imaginary-quadratic block (corrected) |
| `most-ppavs-have-a-large-elliptic-or-real-weil-factor` | Conditionally, most ppavs over 𝔽_p have a large elliptic or real-Weil isogeny factor (corrected Theorem 0.2) |
| `kolmogorov-distance` | Kolmogorov distance between probability measures on ℝ |
| `normalized-eigenangle-spacing-measure` | Normalized eigenangle spacing measure |
| `zero-gap-mass-from-repeated-angles` | Repeated eigenangles force mass at zero spacing |
| `kolmogorov-distance-lower-bound-from-an-atom` | Kolmogorov distance dominates a difference of left-tail masses |
| `spacing-measure-discrepancy-for-ppavs` | Conditionally, ppav spacing statistics over 𝔽_p are far from any atomless law (corrected Corollary 5.14) |
| `enhanced-cohen-lenstra-fails-for-ppavs` | Conditionally, ppavs over 𝔽_p violate the enhanced Cohen–Lenstra prediction (corrected Corollary 5.20) |
| `odd-degree-quadratic-function-field-family` | The quadratic families S_n over F_q(t) |
| `size-of-the-odd-degree-quadratic-family` | Size of the odd-degree quadratic family |
| `imaginary-exact-slice-parametrization` | Imaginary discriminant slices over F_q(t) are monic squarefree polynomials of odd degree |
| `real-exact-slice-parametrization` | Real discriminant slices over F_q(t) are monic squarefree polynomials of even degree |
| `generalized-dihedral-cover-datum` | The generalized dihedral group A ⋊ Z/2 and its involution class |
| `class-group-surjection-pair` | Pairs (L, α) of a quadratic extension and a class-group surjection |
| `involution-quotient-of-the-unramified-pro-l-group` | The σ-anti-invariant quotient of the unramified pro-ℓ group is the ℓ-part of the class group |
| `hurwitz-points-classify-class-group-surjections` | F_q-points of the dihedral Hurwitz scheme classify class-group surjections up to sign |
| `factor-two-point-count-identity` | The moment sum is twice the number of Hurwitz points |
| `empirical-l-primary-class-group-law` | The empirical law of ℓ-primary class groups in S_n |
| `lower-and-upper-degree-densities` | Upper and lower densities along odd degrees |
| `top-cohomology-counts-rational-components` | Top compactly supported cohomology counts Frobenius-fixed components |
| `uniform-trace-error-estimate` | Uniform point-count error from a geometric Betti bound |
| `uniform-function-field-surjection-moment-estimate` | EVW Theorem 8.8: uniform moment estimate over F_q(t) |
| `large-q-cohen-lenstra-theorem` | EVW: the Cohen–Lenstra distribution over F_q(t) as q → ∞ |
| `positive-proportions-of-l-divisible-and-indivisible-class-numbers` | Positive proportions of class numbers divisible and not divisible by ℓ |
| `hyperelliptic-torsion-local-system` | The ℓ^k-torsion local system of the odd-degree hyperelliptic family |
| `geometric-generic-fibre-of-the-unmarked-hurwitz-cover` | The geometric generic fibre of X_n → Conf_n is Sur(V, A) modulo sign |
| `hyperelliptic-boundary-degeneration` | Degeneration of labelled hyperelliptic moduli to the boundary Δ_{1,1} |
| `overlapping-symplectic-subgroups-generate` | Two overlapping symplectic block subgroups generate Sp(V) |
| `mod-l-hyperelliptic-monodromy-is-symplectic` | Achter–Pries: the mod-ℓ monodromy of hyperelliptic curves is Sp_{2g}(F_ℓ) |
| `integral-lift-of-full-mod-l-symplectic-image` | A closed subgroup of Sp_{2g}(Z_ℓ) with full mod-ℓ image is everything (outside (g, ℓ) = (1, 3)) |
| `integral-hyperelliptic-monodromy` | The ℓ-adic monodromy of hyperelliptic curves is Sp_{2g}(Z_ℓ) |
| `monodromy-of-the-odd-degree-polynomial-family` | Full symplectic monodromy for y² = ∏(x − a_i) over Conf_n |
| `finite-level-monodromy-of-the-polynomial-family` | Finite-level monodromy of the polynomial family |
| `symplectic-similitude-group` | Symplectic similitudes of a lattice with a perfect alternating pairing |
| `monodromy-orbits-and-rational-components` | Components of X_n are symplectic orbits; rational ones are GSp_q-stable orbits |
| `primary-decomposition-for-a-multiplier-q-similitude` | Primary decomposition of a similitude with multiplier q |
| `orthogonality-and-a-killed-lagrangian` | Isotropy of the primary parts and a Lagrangian in ker f |
| `symplectic-normal-forms-over-z-l` | Symplectic bases and Lagrangians over Z_ℓ |
| `linear-group-transitive-on-lattice-surjections` | GL_g(Z_ℓ) acts transitively on surjections Z_ℓ^g → A |
| `unique-similitude-stable-symplectic-orbit` | EVW Lemma 8.9: a unique Sp-orbit of surjections fixed by a multiplier-q similitude |
| `one-rational-geometric-component` | Exactly one geometric component of X_n is defined over F_q |
| `eventual-degree-large-q-limit` | The convergence mode 'fixed large degree, q → ∞' |
| `imaginary-per-component-unit-moment` | Wood Theorem 4.8, imaginary good case: unit moment per component invariant |
| `real-per-component-unit-moment` | Wood Theorem 4.8, real good case: unit moment per component invariant |
| `imaginary-normalized-nonabelian-moment` | Wood Theorem 1.2, good imaginary case |
| `real-normalized-nonabelian-moment` | Wood Theorem 1.2, good real case |
| `stable-parity-multidegree-count` | Exact count of stable parity multidegrees (stars and bars) |
| `many-large-parity-vectors` | Many large parity vectors |
| `bad-type-lower-bound` | Wood Theorem 4.8, bad types: a liminf lower bound |
| `bad-type-normalization-transfer` | Transfer of the bad-type bound to unrigid averages |
| `printed-bad-type-ordinary-limit-assertion` | The printed bad-type limit assertion, as an unproved proposition |
| `whole-fixed-degree-component-profile` | The whole fixed-degree component profile |
| `boundary-component-remainder` | Stable and boundary parts of the component profile |
| `complete-stable-range-component-sum` | The complete stable-range component sum |
| `moment-minus-component-profile-vanishes` | The normalised rigid moment differs from the component profile by O(q^{−1/2}) |
| `ordinary-limit-iff-eventual-profile-constancy` | The ordinary q-limit exists iff the component profile is eventually constant |
| `liminf-limsup-from-recurrent-profile-values` | Liminf and limsup of the moment are the extreme recurrent profile values |
| `weight-polynomial-formula-for-the-stable-orthant` | Generating function of the stable-range component sums |
| `surjections-onto-a-semidirect-product` | Surjections onto H ⋊ Γ as tuples (ρ, N, s, φ) |
| `complements-of-a-coprime-abelian-normal-subgroup-are-conjugate` | Complements of a coprime abelian normal subgroup are conjugate |
| `counting-unramified-h-extensions-via-semidirect-extensions` | LWZB Lemma 9.3: moments of unramified H-extensions as counts of H ⋊ Γ-extensions |
| `liu-wood-zureick-brown-function-field-moments` | LWZB Theorem 1.4: moments of Gal(K^#/K) over F_q(t) as q → ∞ |
| `cohen-lenstra-martinet-moments-over-function-fields` | LWZB Corollary 1.5: Cohen–Lenstra–Martinet moments over F_q(t) |
| `symmetric-image-obstruction` | The image obstruction for a symmetric border |
| `symmetric-border-rank-in-image` | The corner obstruction inside the image |
| `symmetric-border-rank-outside-image` | The rank-two jump outside the image |
| `symmetric-border-rank-fibers` | The three symmetric-border rank fibers |
| `symmetric-rank-count-recurrence` | The symmetric rank-count recurrence |
| `symmetric-rank-product-recurrence` | The rational product recurrence |

The six parent planets are retained: Cohen–Lenstra measure, Poonen–Rains Selmer distribution, BKLPR random alternating matrix model, Average size of the 3-Selmer group, 3^∞-Selmer coranks of CM twists, Large-q Cohen–Lenstra theorem over F_q(t). This part allocates zero new planets. Any exchange belongs to assembly within the single six-planet ST.5 budget.

The corrected parent boundaries also remain in force: the Liu–Wood–Zureick-Brown comparison uses the specified outer b-limit and inner q-limsup/q-liminf, the Wood non-good case retains its boundary remainder, the Lipnowski–Tsimerman comparison uses the common-p Weil and eventual-genus conditions, and the enhanced Cohen–Lenstra threshold keeps its elliptic restriction and existence gap. Smith inputs remain conditional where the parent says so. The finite-field Part II and homological-stability inputs are not supplied by ordinary class field theory. New refinements of the old suppliers are recorded below without editing the parent.

## New target interfaces

New identifiers have prefix `ArithmeticStatistics:ST.5/refinement-`. Proposed declarations belong to namespace `ArithmeticStatistics.ST5`, in the planned module `TauCeti/NumberTheory/ArithmeticStatistics/HigherMoments`. Each target lists its own hypotheses, direct prerequisites, proof contract and acceptance requirements. A requested stage is an input to construct, not an established theorem.

### Locally compact models

The construction reduces compact-open quadratic subgroups to finite isotropic spaces, then passes to a projective law. The arithmetic application uses theta-group quadratic refinements and global duality, including the dyadic and finite-flat cases.

#### Nondegenerate locally compact quadratic module

Identifier: `ArithmeticStatistics:ST.5/refinement-lc-quadratic`. Definition; proposed declaration: `ArithmeticStatistics.ST5.LCQuadraticData`.

For a locally compact Hausdorff topological abelian group V, a continuous QuadraticMap ℤ V (ℝ/ℤ) q has a polar adjoint V ≃ₜ+ Hom_cont(V,ℝ/ℤ), with compact-open topology; its value on (x,y) is q(x+y)−q(x)−q(y). Store this homeomorphic additive equivalence, not just injectivity. Second countability is imposed on the measure theorem, not on the carrier.

Hypotheses: V is locally compact, Hausdorff and a topological abelian group.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Definition 2.13 and preceding nondegeneracy convention, pp. 8–9.

Direct prerequisites: `mathlib:QuadraticMap`, `mathlib:QuadraticMap.polar`, `mathlib:QuadraticMap.polarBilin`, `mathlib:ContinuousAddEquiv`, `mathlib:ContinuousAddMonoidHom`.

Proof or construction contract:

1. Use the existing quadratic-map and continuous-homomorphism carriers.
2. Record the adjoint equation as a constraint on the actual topological additive equivalence.
3. Obtain orthogonal subgroups from the kernel equations of the polar bilinear map.

Uses: PR Theorem 2.19: The self-dual topology controls the finite reductions and their inverse limit.; PR Theorem 4.13: The adelic cup-product quadratic map is an instance.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.orthogonal` | data | For an additive subgroup W, W⊥ consists of x with polar(q)(x,y)=0 for every y∈W. |
| `ArithmeticStatistics.ST5.LCQuadraticData.mem_orthogonal` | characterisation | Membership in W⊥ is exactly the displayed vanishing condition. |
| `ArithmeticStatistics.ST5.LCQuadraticData.polar_formula` | compatibility | The adjoint evaluates to q(x+y)−q(x)−q(y), agreeing with QuadraticMap.polar. |
| `ArithmeticStatistics.ST5.LCQuadraticData.polar_self` | simp | The value on (x,x) is 2q(x), including at p=2. |
| `ArithmeticStatistics.ST5.LCQuadraticData.adjoint_bijective` | equivalence | The adjoint is bijective onto all continuous characters. |
| `ArithmeticStatistics.ST5.LCQuadraticData.orthogonal_antitone` | functoriality | W≤U implies U⊥≤W⊥. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_zero` | degenerate | q(0)=0. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_diagonal` | compatibility | polar(q)(x,x)=2q(x). |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_zero_form` | non-example | If q is the zero quadratic map, V is a subsingleton. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_surjective_dual` | characterisation | Every continuous additive character is the polar character of some x. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Native signature: included in the suggested file, with unimplemented proofs.

#### Weakly metabolic compact-open subgroup

Identifier: `ArithmeticStatistics:ST.5/refinement-weak-metabolic`. Definition; proposed declaration: `ArithmeticStatistics.ST5.LCQuadraticData.IsWeaklyMetabolic`.

Given locally compact quadratic data D and an additive subgroup W≤V, weak metabolicity means that W is compact and open, q vanishes on W, and W⊥=W. Vanishing of the polar form alone is insufficient, particularly at 2.

Hypotheses: D is as in the locally compact quadratic carrier.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Definition 2.14, p. 9.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-quadratic`.

Proof or construction contract:

1. Define the predicate by compactness, openness, quadratic vanishing and computed self-annihilation.
2. Transport its conclusions by subgroup intersections and isometries.

Uses: PR Theorem 2.19: Produces compact-open finite-level quotients.; PR Examples 2.17–2.18: Controls the distinguished product subgroup in hyperbolic and restricted-product examples.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.weaklyMetabolic_iff` | characterisation | Equivalent to the four explicit conditions in the definition. |
| `ArithmeticStatistics.ST5.LCQuadraticData.weaklyMetabolic_isotropic` | projection | q(x)=0 for every x∈W. |
| `ArithmeticStatistics.ST5.LCQuadraticData.weaklyMetabolic_self_orthogonal` | projection | The computed orthogonal subgroup equals W. |
| `ArithmeticStatistics.ST5.LCQuadraticData.weaklyMetabolic_intersection_open` | structure | The intersection of two such distinguished subgroups is open. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_top` | degenerate | If the whole self-dual space is weakly metabolic, V is a subsingleton. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_nonsingular` | non-example | An element x∈W with q(x)≠0 precludes weak metabolicity. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_finite` | compatibility | For finite discrete V the predicate reduces exactly to quadratic vanishing and W⊥=W. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Native signature: included in the suggested file, with unimplemented proofs.

#### Closed maximal isotropic subgroup space

Identifier: `ArithmeticStatistics:ST.5/refinement-maximal-isotropics`. Definition; proposed declaration: `ArithmeticStatistics.ST5.LCQuadraticData.MaximalIsotropics`.

I(V) consists of closed additive subgroups Z≤V on which q vanishes and with Z⊥=Z. It is the subtype of actual subgroups satisfying these equations. Its probability topology is supplied by finite quotient reductions; it is not the discrete topology on a countable list of subgroup names.

Hypotheses: D is locally compact quadratic data.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Paragraph preceding Theorem 2.19 and Theorem 2.19(c), p. 9.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-quadratic`, `ArithmeticStatistics:ST.5/refinement-weak-metabolic`.

Proof or construction contract:

1. Form the closed, quadratic-isotropic, self-annihilating subtype.
2. Construct the inverse-limit topology only after the finite quotient comparison.

Uses: PR Theorem 2.19: The cylinder reductions supply a canonical probability measure.; PR Theorem 4.13: The global cohomology image and compact-open Kummer image are points.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.maximalIsotropics_injective` | extensionality | The underlying-subgroup map is injective. |
| `ArithmeticStatistics.ST5.LCQuadraticData.maximalIsotropics_closed` | projection | The underlying subgroup of each point is closed. |
| `ArithmeticStatistics.ST5.LCQuadraticData.maximalIsotropics_self_orthogonal` | projection | Each point equals its computed annihilator. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_member` | characterisation | q vanishes on every element of the underlying subgroup. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_ext` | compatibility | Equality of underlying subgroups gives equality of points. |
| `ArithmeticStatistics.ST5.LCQuadraticData.test_compact_open` | degenerate | A weakly metabolic compact-open subgroup determines a point of I(V) in a Hausdorff ambient space. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Native signature: included in the suggested file, with unimplemented proofs.

#### Finite reductions of a locally compact quadratic module

Identifier: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.lc_finite_reductions`.

For second-countable nondegenerate locally compact quadratic (V,q) with a weakly metabolic W, compact-open q-isotropic subgroups X form a countable directed system ordered by reverse inclusion. X⊥/X is a finite nondegenerate quadratic module. The reduction of Z∈I(V) is ((Z∩X⊥)+X)/X, a maximal isotropic subgroup; reductions compose. If a cofinal decreasing sequence X_j has intersection zero, I(V) is bijective to the inverse limit of these finite isotropic spaces.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Theorem 2.19(a)–(c) and proof, pp. 9–10.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-quadratic`, `ArithmeticStatistics:ST.5/refinement-weak-metabolic`, `ArithmeticStatistics:ST.5/refinement-maximal-isotropics`, `tauceti:TauCeti.FiniteQuadraticModule`, `ArithmeticStatistics:ST.5/isotropic-reduction-map`, `ArithmeticGaloisDuality:D7`.

Proof or construction contract:

1. Use compact-open annihilator duality to show finiteness and nondegeneracy of X⊥/X.
2. Reuse the finite quadratic carrier and finite isotropic reduction already owned by IntegralLattices and the parent.
3. Choose a countable cofinal system inside W; lift compatible subgroups and prove closure, isotropy and self-annihilation.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. In a finite discrete metabolic space, X=0 recovers the original finite maximal-isotropic set and the reduction map is the identity.

Open inputs: `G-lc-duality`, `G-native`, `R-poitou-tate`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Canonical probability on maximal isotropic subgroups

Identifier: `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.lc_canonical_measure`.

Assume additionally that p is prime and pV=0. The inverse-limit topology on I(V) carries a unique Borel probability whose pushforward to every finite quadratic reduction is the uniform maximal-isotropic law. This measure is invariant under every continuous quadratic isometry of V. Second countability and the inverse-limit Borel structure are part of the assertion.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Theorem 2.19(d)–(e), pp. 9–10.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/fibres-of-the-isotropic-reduction-map`, `PadicMeasuresIwasawaAlgebras:L1`.

Proof or construction contract:

1. The parent finite reduction map has constant fibre size, giving consistent uniform marginals.
2. Apply the requested countable projective-limit probability theorem to the actual reduction maps.
3. Uniqueness on cylinder sets gives isometry invariance.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. In a finite hyperbolic plane over F₂, each of its two maximal quadratic-isotropic lines has probability 1/2.

Open inputs: `G-lc-duality`, `G-native`, `R-probability`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Almost-sure discrete isotropic intersection

Identifier: `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.lc_random_intersection`.

Under the preceding hypotheses a random Z∈I(V) is discrete almost surely and Z∩W is finite almost surely. If V has infinite F_p-dimension, dim_Fp(Z∩W) has exactly the parent Poonen–Rains law. A finite-dimensional V instead has the parent finite intersection law, not its infinite limit.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Theorem 2.19(f) and proof, pp. 10–11.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/intersection-law-converges-to-poonen-rains`.

Proof or construction contract:

1. Choose an exhaustion of the countable discrete dual W* and its annihilator filtration.
2. Use the finite constant-fibre laws to obtain the independent Bernoulli coordinates in the source proof.
3. A summable exceptional-event bound and Borel–Cantelli give discreteness and finiteness; identify the limit using the parent law.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. A finite hyperbolic plane has only intersection dimensions zero and one; do not assign its law the positive tail of the infinite-dimensional distribution.

Open inputs: `G-lc-duality`, `G-native`, `R-probability`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Quadratic data on a restricted product

Identifier: `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.lc_restricted_product`.

Let (V_i,q_i,W_i) be nondegenerate weakly metabolic locally compact quadratic modules. On the existing restricted-product group ∏′(V_i,W_i), q((v_i))=Σ_i q_i(v_i) is a finite sum for each point and defines nondegenerate locally compact quadratic data; ∏W_i is weakly metabolic. If I is countable and every V_i is second-countable, the restricted product is second-countable.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Examples 2.17–2.18 and proof, p. 9.

Direct prerequisites: `mathlib:RestrictedProduct`, `ArithmeticStatistics:ST.5/refinement-lc-quadratic`, `ArithmeticStatistics:ST.5/refinement-weak-metabolic`, `ArithmeticGaloisDuality:D7`.

Proof or construction contract:

1. Use the completed RestrictedProducts carrier and its compact-open product subgroup.
2. Quadratic vanishing on W_i makes the pointwise sum finite; prove continuity on product neighborhoods.
3. Use Pontryagin duality for the restricted product and the local adjoints. Countable support patterns give the second-countability assertion.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For the hyperbolic finite groups with their standard isotropic subgroups, only finitely many coordinate quadratic values can be nonzero at a restricted-product point.

Open inputs: `G-lc-duality`, `G-native`, `R-poitou-tate`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Vanishing of the everywhere locally trivial finite-module group

Identifier: `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.sha_one_vanishing`.

For a global field k, Sha¹(k,M)=ker(H¹(k,M)→∏_v H¹(k_v,M)). It vanishes for constant cyclic Z/n modules, permutation modules and their direct summands. For a finite F_p-module M it also vanishes when every Sylow p-subgroup of Aut(M) is cyclic. In particular Sha¹(k,E[p])=0 for elliptic E and p≠char(k); for an odd-degree hyperelliptic Jacobian with char(k)≠2, Sha¹(k,J[2])=0.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Proposition 3.3 and proof, pp. 13–14.

Direct prerequisites: `SelmerIwasawaCohomology:L0`, `ArithmeticGaloisDuality:D7`.

Proof or construction contract:

1. Use Chebotarev to inject constant cyclic classes into the local family, then Shapiro and direct summands.
2. For the Sylow criterion restrict to a cyclic Sylow extension and use restriction-corestriction.
3. Apply to the elliptic torsion representation and the odd-degree root permutation module.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. A constant cyclic module must give zero Sha¹ even when the associated abelian variety has nonzero Tate–Shafarevich group.

Open inputs: `G-fppf-theta`, `G-native`, `R-local-global-cohomology`, `R-poitou-tate`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Selmer group as an adelic quadratic intersection

Identifier: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.selmer_quadratic_intersection`.

Let k be global, A/k abelian, and λ:A→Â a self-dual isogeny of odd degree or induced by a symmetric line bundle. The theta-group quadratic maps into local Brauer groups, followed by invariants in R/Z, make V=∏′_v H¹(k_v,A[λ]) a second-countable weakly metabolic locally compact quadratic module. The Kummer subgroup W=∏_v im(Â(k_v)/λA(k_v)) is compact-open maximal isotropic; the image Z of H¹(k,A[λ]) is maximal isotropic. Sel_λ(A)/Sha¹(k,A[λ])≅Z∩W. In characteristic dividing deg λ all cohomology is fppf. Sha¹ of the finite group scheme is not Sha(A).

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Theorem 4.13, Sections 4.1–4.3, pp. 14–21.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`, `ArithmeticStatistics:ST.5/refinement-maximal-isotropics`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `SelmerIwasawaCohomology:L1`, `ArithmeticGaloisDuality:D7`.

Proof or construction contract:

1. Import theta groups and the quadratic local obstruction with its cup-product polarization.
2. Local duality and the symmetric-sheaf or odd-degree hypothesis give quadratic, rather than merely bilinear, isotropy of Kummer images.
3. Poitou–Tate and global reciprocity give global maximal isotropy; compute the kernel of localization to obtain the quotient.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For λ=[2], retain the theta quadratic refinement and the symmetric-sheaf hypothesis; a polar alternating pairing alone cannot certify quadratic isotropy.

Open inputs: `G-fppf-theta`, `G-native`, `R-duality-pairing`, `R-poitou-tate`, `R-theta-quadratic`, `R-finite-flat-isogeny`.

Native signature boundary: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

### Joint Selmer models

A single parity is shared by the selected primes. Conditional on that parity the prime factors are independent. The weight formula and its model moments are mathematical targets; the arithmetic frequency and moment assertions are separate conjectures.

#### Parity-coupled product of prime Selmer laws

Identifier: `ArithmeticStatistics:ST.5/refinement-joint-parity-weight`. Definition; proposed declaration: `ArithmeticStatistics.ST5.parityCoupledWeight`.

For k selected prime factors and weights w_i(d), define the joint weight on d∈ℕ^k to be 1 when k=0; for k>0 it is 2^(k−1)∏_i w_i(d_i) when all d_i have the same parity, and zero otherwise. Each marginal must have total even and total odd mass 1/2. The k=0 carrier is the singleton function space, corresponding to n=1.

Hypotheses: The prime laws are nonnegative and summable; each parity has mass 1/2.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Conjecture 1.4(a), p. 3, with the n=1 convention separated.

Direct prerequisites: `ArithmeticStatistics:ST.5/poonen-rains-parity`, `ArithmeticStatistics:ST.5/poonen-rains-distribution`.

Proof or construction contract:

1. Use a finite dependent product indexed by Fin k.
2. Mix the two common-parity conditional product laws with equal weight.
3. Treat the empty product directly, rather than applying the nonempty normalization.

Uses: PR Conjecture 1.4: Models squarefree composite Selmer groups with a common parity.; PR moment formula: Uses parity-conditioned moments instead of independent unconditional prime laws.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.parityCoupledWeight_empty` | simp | The weight on the unique empty rank vector is 1. |
| `ArithmeticStatistics.ST5.parityCoupledWeight_single` | compatibility | For k=1 the joint weight is precisely w₀(d₀). |
| `ArithmeticStatistics.ST5.parityCoupledWeight_mixed` | characterisation | If two coordinates have different parity, the joint weight is zero. |
| `ArithmeticStatistics.ST5.parityCoupledWeight_nonneg` | structure | Nonnegative marginals give nonnegative joint weights. |
| `ArithmeticStatistics.ST5.parityCoupledWeight_total` | structure | Under nonnegativity, summability and half-mass of each parity, the joint weights are summable and sum to 1. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.parityCoupledWeight.test_two_equal` | computation | For two factors and rank vector (0,0), the weight is 2w₀(0)w₁(0). |
| `ArithmeticStatistics.ST5.parityCoupledWeight.test_two_mixed` | non-example | For two factors and rank vector (0,1), the weight is zero. |
| `ArithmeticStatistics.ST5.parityCoupledWeight.test_empty` | degenerate | The empty rank vector has weight 1. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Native signature: included in the suggested file, with unimplemented proofs.

#### Moments of the common-parity product law

Identifier: `ArithmeticStatistics:ST.5/refinement-joint-parity-moments`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.joint_parity_moments`.

For k≥1 prime laws w_i with half even/odd mass, assume for every m≥1 each parity-restricted sum Σ_{d≡ε(2)}w_i(d)p_i^(md) equals (1/2)∏_{j=1}^m(p_i^j+1). The normalized common-parity law then has m-th cardinality moment ∏_i∏_{j=1}^m(p_i^j+1). Its first moment is ∏_i(p_i+1)=σ(∏p_i) for distinct primes. For k=0 the moment is 1.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Conjecture 1.4(b), p. 3; Proposition 2.22, p. 12.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-joint-parity-weight`, `ArithmeticStatistics:ST.5/poonen-rains-parity`.

Proof or construction contract:

1. Sum separately over the two parity classes; factor each nonnegative summable product.
2. The factor 2^(k−1) and two equal contributions cancel the k half-masses.
3. Import the parent parity-conditioned moment identity and the divisor formula.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The empty selection has every moment 1; primes 2 and 3 have joint first cardinality moment 12.

Native signature: included in the suggested file, with unimplemented proofs.

#### Joint squarefree Selmer conjecture

Identifier: `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`. Definition; proposed declaration: `ArithmeticStatistics.ST5.squarefree_selmer_conjecture`.

For squarefree n>1, minimal integral short Weierstrass models over Q ordered by H=max(4|A|³,27B²), the joint dimensions dim_Fp Sel_p(E), p|n, have the common-parity product law. Separately, every positive m-th cardinality moment of Sel_n tends to ∏_{p|n}∏_{j=1}^m(p^j+1). A limiting distribution alone does not establish these unbounded moments. For n=1 the group is trivial.

Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Conjecture 1.4(a)–(b), p. 3.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-joint-parity-weight`, `ArithmeticStatistics:ST.5/refinement-joint-parity-moments`, `ArithmeticStatistics:ST.5/height-moments-in-an-arithmetic-family`.

Proof or construction contract:

1. Express the precise finite-height averaging assertion on the supplied arithmetic family.
2. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

Uses: PR Conjecture 1.4: Records the composite coupling, not merely its prime marginals.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.distribution` | projection | Project the empirical joint-frequency assertion. |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.moments` | projection | Project each separately quantified cardinality-moment assertion. |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.average` | compatibility | The m=1 assertion recovers the parent σ(n) conjecture for squarefree n. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_one` | degenerate | n=1 has mass and every moment 1. |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_two_primes` | non-example | Mixed parity has limiting mass zero for n=pq. |
| `ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_moment` | computation | n=6,m=1 predicts 12, while independent distribution convergence is insufficient to prove it. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Odd-degree hyperelliptic Selmer conjecture

Identifier: `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`. Definition; proposed declaration: `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture`.

Fix g≥1 over a global field of characteristic not 2. For separable coefficient models y²=f(x) of degree 2g+1 in the source coefficient-height family, the Jacobian Sel_p laws, squarefree composite coupling and moments are predicted to match the elliptic laws; the rank distribution is 0 and 1 with probabilities 1/2 each and average rank 1/2. For degree 2g+2 the same statements are proposed only for odd n. The height denominator counts models, not Jacobian isomorphism classes.

Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Conjecture 1.7, p. 4.

Direct prerequisites: `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`.

Proof or construction contract:

1. Express the precise finite-height averaging assertion on the supplied arithmetic family.
2. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

Uses: PR Conjecture 1.7: Keeps the marked-point and coefficient-family conventions.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.law` | projection | Project the source-scoped Selmer-law assertion. |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.rank` | projection | Project the rank frequencies and separate average-rank assertion. |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.even_degree_odd_n` | compatibility | The even-degree version retains the restriction to odd n. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_even_degree` | non-example | The degree-2g+2 assertion does not include n=2. |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_n_one` | degenerate | The Selmer cardinality prediction at n=1 is 1. |
| `ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_model_count` | compatibility | Isomorphic Jacobians from different coefficient models retain their model multiplicities. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Even-genus even-degree two-Selmer conjecture

Identifier: `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`. Definition; proposed declaration: `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture`.

For even g>0, separable models of degree 2g+2 in the source family over a global field of characteristic not 2 have predicted dim_F2 Sel_2(J)=1+X_PR. Consequently the predicted mean size is 6 and m-th cardinality moment is 2^m∏_{j=1}^m(2^j+1). This statement is conjectural and does not apply to odd genus.

Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.

Sources: [pr](https://arxiv.org/pdf/1009.0287v2), Conjecture 1.8, p. 4.

Direct prerequisites: `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.5/poonen-rains-distribution`, `ArithmeticStatistics:ST.5/poonen-rains-moments`.

Proof or construction contract:

1. Express the precise finite-height averaging assertion on the supplied arithmetic family.
2. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

Uses: PR Conjecture 1.8: Separates the even-degree forced class from the ordinary PR prediction.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.law` | projection | The rank law is the one-unit shift. |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.moments` | projection | Each m-th cardinality moment carries the factor 2^m. |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.average` | compatibility | The first moment is 6. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_mean` | computation | g=2 gives predicted mean6, not3. |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_support` | non-example | The shifted law has zero mass at dimension0. |
| `ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_odd_genus` | non-example | No assertion is obtained for g=1 from this proposition. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

### Moment determination

Entire separators and subgroup-growth estimates give uniqueness of multivariate profile moments. The conclusion concerns bounded-exponent quotients; full-group tightness remains an explicit input.

#### Wood grid-separating product

Identifier: `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`. Construction; proposed declaration: `ArithmeticStatistics.ST5.woodGridSeparator`.

For a prime p and an antitone nonnegative integer vector b of length m+1, set S_i(b)=∑_{j≤i}b_j. Define H_b(z)=∏_{j≥b₀+1}(1−z₀/p^j) · ∏_{i=1}^m ∏_{j=S_i(b)+1}^{S_{i−1}(b)+b_{i−1}}(1−z_i/p^j). Empty finite products are 1. H_b is entire, vanishes at z_i=p^{S_i(f)} for every antitone f lexicographically greater than b, and is nonzero at the grid point of b.

Hypotheses: p is prime; b is antitone; the coordinate length is positive.

Sources: [wood](https://arxiv.org/pdf/1402.5149v2), Lemma 8.1 and proof, pp. 28–29.

Direct prerequisites: `mathlib:tprod`, `mathlib:HasProd`.

Proof or construction contract:

1. Use the infinite product only in coordinate zero, and finite polynomials in the other coordinates.
2. At the first larger coordinate of f, identify a vanishing factor.
3. Use absolute convergence and nonvanishing of all factors at b to separate the diagonal.

Uses: Wood Theorem 8.2: Triangularizes the partition-indexed moment matrix.; Wood matrix Theorem 3.1: The same separator handles p=2 and positive u without the odd-prime contraction argument.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.woodGridSeparator_zero` | simp | At z=0 the value is 1. |
| `ArithmeticStatistics.ST5.woodGridSeparator_one_variable` | compatibility | When m=0 only the one-variable infinite product remains. |
| `ArithmeticStatistics.ST5.woodGridSeparator_upper` | characterisation | At the grid point of any antitone f lexicographically greater than b, the value is zero. |
| `ArithmeticStatistics.ST5.woodGridSeparator_diagonal` | characterisation | At the grid point of the antitone b itself, the value is nonzero. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.woodGridSeparator.test_origin` | degenerate | For m=0,p=2,b=0,z=0 the value is 1. |
| `ArithmeticStatistics.ST5.woodGridSeparator.test_upper` | computation | For m=0,p=2,b=0,z=2 the value is zero. |
| `ArithmeticStatistics.ST5.woodGridSeparator.test_diagonal` | non-example | For m=0,p=2,b=0,z=1 the value is nonzero. |
| `ArithmeticStatistics.ST5.woodGridSeparator.test_second_coordinate` | computation | For m=1,p=2,b=(2,0),z=(4,8) the finite second-coordinate factor vanishes. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-wood-analysis`.

Native signature: included in the suggested file, with unimplemented proofs.

#### Absolute coefficient bound for the separating product

Identifier: `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.wood_coefficient_bound`.

Let p be prime and b∈N^(m+1) antitone. The separator H_b is entire and its Taylor coefficients a_d satisfy |a_d|≤E_b p^(−b₀d₀−d₀(d₀+1)/2) for one E_b>0; coefficients vanish unless Σ_{i=1}^m d_i≤b₀−b_m (hence≤b₀). The infinite-product head has coefficient c_n=(−1)^n p^(−b₀n)/∏_{j=1}^n(p^j−1). Absolute values are necessary for exchanging signed sums.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [wood](https://arxiv.org/pdf/1402.5149v2), Lemma 8.1 and proof, pp. 28–29, strengthened absolute-value formulation used in Theorem 8.2.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`.

Proof or construction contract:

1. Prove locally uniform convergence of the head product on compact subsets of C.
2. Its functional equation G(pz)=(1−z/p^b₀)G(z) gives the exact coefficient recurrence.
3. Bound the reciprocal product by ∏_{j≥1}(1−p^(−j))^(−1) and multiply by the maximum absolute coefficient of the finite polynomial.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The first head coefficient is −p^(−b₀)/(p−1), so the absolute-value estimate is essential rather than a positivity assertion.

Open inputs: `G-wood-analysis`, `G-native`.

Native signature boundary: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Exterior-square bound for the subgroup moment sum

Identifier: `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.wood_subgroup_bound`.

There is an absolute F>0 such that for every prime p and finite abelian p-group G of partition type λ, Σ_{G₁≤G}|∧²G₁|≤F^(λ₁) p^(Σ_i λ′_i(λ′_i−1)/2), where λ′ is the conjugate partition and λ₁ is the exponent length. The trivial group contributes1. For finitely many primes the bound factors over primary parts.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [wood](https://arxiv.org/pdf/1402.5149v2), Lemma 7.4 and proof, pp. 27–28.

Direct prerequisites: `ArithmeticStatistics:ST.5/isomorphism-classes-of-finite-abelian-p-groups`, `ArithmeticStatistics:ST.5/gaussian-binomial-coefficient`, `ArithmeticStatistics:ST.5/exact-surjection-count-formula`.

Proof or construction contract:

1. Use the exact subgroup count by conjugate partition, retaining the Gaussian-binomial denominators.
2. Absorb their reciprocal Euler-product bounds into one absolute F per exponent layer.
3. Complete the quadratic exponents and sum the resulting geometric Gaussian tails.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For G=Z/p the subgroup sum is 2 and the p-exponent in the bound is zero; the uniform constant must absorb that factor.

Open inputs: `G-wood-analysis`, `G-native`.

Native signature boundary: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Uniqueness from partition-indexed exponential moments

Identifier: `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.wood_grid_uniqueness`.

Let p₁,…,p_s be distinct primes, m_j≥1, and M the product of antitone nonnegative integer profiles of lengths m_j. Let x_µ,y_µ≥0 have finite equal exponential moments C_λ=Σ_µ x_µ∏_j p_j^(Σ_i λ_ji µ_ji)=Σ_µ y_µ∏_j p_j^(Σ_i λ_ji µ_ji). Assume C_λ≤∏_j F^(m_j)p_j^(Σ_i λ_ji(λ_ji−1)/2) for some F>0. Then x_µ=y_µ for every µ. The finite-moment and summability hypotheses are part of the statement.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [wood](https://arxiv.org/pdf/1402.5149v2), Theorem 8.2 and proof, pp. 29–31.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`.

Proof or construction contract:

1. For each profile ν expand the product of grid separators in its Taylor coefficients.
2. The absolute coefficient bound and moment growth make the interchange of the coefficient and mass sums absolutely convergent.
3. The resulting triangular equalities determine the lexicographically successive masses; bounded finite rectangles followed by the summable tail avoid an invalid global lexicographic well-order argument.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. With no selected primes the profile carrier is a singleton and equality of the zero moment determines its mass.

Open inputs: `G-wood-analysis`.

Native signature: included in the suggested file, with unimplemented proofs.

#### Bounded-exponent group laws from bounded surjection moments

Identifier: `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.wood_bounded_moment_limit`.

Let a≥1 and A_a be finite abelian group classes of exponent dividing a. Let X_n be random finitely generated abelian groups and suppose E#Sur(X_n,G)→M_G for every G∈A_a, with 0≤M_G≤|∧²G|. For every H∈A_a, Pr(X_n/aX_n≅H) has a limit; these limiting masses sum to1 and have the moments M_G. A second sequence with the same moments has the same limiting quotient law. The theorem concerns X_n/aX_n, not an unproved full-group limit.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [woodmat](https://arxiv.org/pdf/1504.04391), Theorem 3.1, pp. 9–10; proof inputs Wood Lemma 7.4, Theorems 8.2–8.3, pp. 27–32.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness`, `ArithmeticStatistics:ST.5/surjection-count`, `ArithmeticStatistics:ST.5/surjection-moment`.

Proof or construction contract:

1. Convert surjection moments to homomorphism moments by the finite sum over image subgroups; use the exterior-square subgroup bound.
2. For each test type λ choose the dominating type with conjugate entries2λ′_i+1; the sum of homomorphism-count ratios is finite and controls tails.
3. Extract subsequential masses on the countable exponent-bounded carrier, preserve moments by domination and apply grid uniqueness.
4. The trivial-group moment fixes total mass1; uniqueness upgrades subsequences to the whole sequence. The all-p,u parent target consumes this theorem together with exponent-tail control.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At a=1 there is one quotient class, with mass 1. At a=p² the statement distinguishes Z/p² from (Z/p)²; it cannot use cardinality alone.

Open inputs: `G-wood-analysis`, `G-native`.

Native signature boundary: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

### Integral isotropic models

Smooth integral points supply compatible finite cylinder laws. Intrinsic Schubert measures yield every rank parameter in the Delaunay model, with different all-prime behavior at rank zero. Local Kummer splittings and generic global-image splitting are separate statements.

#### Finite-count comparison for smooth integral models

Identifier: `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.smooth_cylinder_measure`.

Let p be prime and X/Z_p smooth proper of pure relative dimension d, with X(F_p) nonempty. The requested Oesterlé–Serre measure has total mass #X(F_p)p^(−d); its probability normalization assigns red_e^(−1)(B) mass #B/#X(Z/p^e) for every subset B of the finite reduction. Smooth lifting supplies p^d points per fibre. For a general finite-type model the measure counts the reduction image of X(Z_p), not every nonliftable or nonreduced finite-level point.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Proposition 2.1 and Corollary 2.2, pp. 5–6; Lemma 4.8, p. 14.

Direct prerequisites: `AdelicAlgebraicGroups:AA.2`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Proof or construction contract:

1. Import the general bounded Oesterlé measure with reduction-image counts.
2. Formal smoothness and properness give surjective compatible reductions with constant fibres p^d.
3. Compute the total mass and cylinder normalization directly.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For X=P¹ over Z_p, total mass is (p+1)/p and every level-e point cylinder has probability 1/((p+1)p^(e−1)).

Open inputs: `G-ogr`, `G-native`, `R-integral-grassmannian`, `R-oesterle-measure`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Smooth split orthogonal Grassmannian over Z

Identifier: `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.ogr_smooth_projective`.

For n≥0 the subfunctor of Gr(n,2n) consisting of rank-n locally direct-summand subbundles on which q(x,y)=Σ_i x_i y_i vanishes is represented by a smooth projective Z-scheme OGr_n of relative dimension n(n−1)/2. This integral statement includes characteristic2 and requires quadratic vanishing, not merely alternating polar isotropy.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Section 4.2 and Proposition 4.4, pp. 12–14.

Direct prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.1`, `ArithmeticStatistics:ST.5/maximal-isotropic-subspaces-of-a-quadratic-space`.

Proof or construction contract:

1. Import the generic Grassmannian, universal subbundle and closed quadratic vanishing equations.
2. Use graph charts from complementary isotropic subbundles: the free coordinates are alternating forms including a zero diagonal at2.
3. Projectivity follows from the closed immersion into the Grassmannian; charts and transitivity prove smoothness of the stated dimension. SGA7 global chart closure is the recorded geometry gap.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. OGr₀ is a point and OGr₁ has two points in each fibre, including characteristic two; the latter is not the whole projective line.

Open inputs: `G-ogr`, `G-native`, `R-integral-grassmannian`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Two components distinguished by intersection parity

Identifier: `ArithmeticStatistics:ST.5/refinement-ogr-components`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.ogr_components`.

For n>0, OGr_n is the disjoint union of two isomorphic Z-schemes with geometrically integral fibres, distinguished over every field by parity of dim(Z∩W) for the standard W. Two points Z,Z′ lie on the same component iff dim(Z∩Z′)≡n mod2. For n=0 there is one point, with an empty odd component.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Proposition 4.5 and Remark 4.6, p. 14.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`.

Proof or construction contract:

1. Use the requested integral component morphism to Spec(Z×Z).
2. Graph charts give geometric integrality; the orthogonal component switch identifies the two pieces.
3. Compute the relative parity and retain the n=0 exception.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At n=1, the two coordinate isotropic lines lie in different components because their intersection dimension is zero.

Open inputs: `G-ogr`, `G-native`, `R-integral-grassmannian`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Prime-power count of split isotropic direct summands

Identifier: `ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.ogr_prime_power_count`.

For prime p, e≥1 and n≥0, #OGr_n(Z/p^e)=p^(e n(n−1)/2)∏_{i=1}^n(1+p^(i−n)). This counts direct summands. At n=0 the count is1; at n=1 it is2 at every level, including p=2. It refines the parent count by giving its smooth-lifting proof contract.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Lemma 4.8, p. 14.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/number-of-maximal-isotropic-subspaces`, `ArithmeticStatistics:ST.5/maximal-isotropic-direct-summands-modulo-prime-powers`.

Proof or construction contract:

1. Use the parent finite-field maximal-isotropic count at e=1.
2. Each smooth reduction fibre has size p^(n(n−1)/2).
3. Induct in e, matching exactly the parent direct-summand count and its normalization.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For n=2,p=2,e=2 the formula gives 12 direct-summand points; n=1 gives 2 at every prime-power level.

Open inputs: `G-native`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Dimensions of fixed-parity intersection loci

Identifier: `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.ogr_schubert_dimension`.

For 0≤r≤n the locus S_(n,r)⊂OGr_n of points with dim(Z∩W)≥r and dim(Z∩W)≡r mod2 is closed and has relative dimension (n−r)(n+r−1)/2. Its exact-rank open stratum has this dimension. Fixed-rank random models use the intrinsic measure on S_(n,r); when r≥2 they cannot be defined by conditioning the ambient OGr law on a positive-probability rank-r event.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Section 4.4 and Proposition 4.9, pp. 14–15; Section 5.1, p. 15.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AdelicAlgebraicGroups:AA.2`.

Proof or construction contract:

1. Use the fixed parity component and determinantal intersection equations.
2. Resolve by pairs (Z,X) with X an r-plane in Z∩W; over Gr(r,W) the fibre is OGr_(n−r).
3. On the exact-rank locus X is unique and the fibre is the affine space of alternating graph maps. Lower-dimensional vanishing in the requested measure gives the conditioning warning.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At n=2,r=2 the locus is a point and is null for the dimension-one ambient measure; it still has its own normalized intrinsic point mass.

Open inputs: `G-ogr`, `G-native`, `R-integral-grassmannian`, `R-oesterle-measure`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Agreement with the p-primary Delaunay laws for every rank

Identifier: `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.all_rank_delaunay`.

For every prime p and r≥0 the intrinsic fixed-rank isotropic-intersection limit T_r equals the parent alternating cokernel law A_r; for a finite symplectic p-group G its mass is (#G)^(1−r)/#Sp(G) times ∏_{i≥r+1}(1−p^(1−2i)). This is the p-primary Delaunay model with corrected rank parameter r, and is a model theorem for all r. The unconditional arithmetic rank frequencies do not follow from it.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Theorem 1.6(c), p. 3; Theorem 1.10, p. 4; Sections 3.6,5.4, pp. 7–11,17–19.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`, `ArithmeticStatistics:ST.5/bklpr-alternating-cokernel-limit`, `ArithmeticStatistics:ST.5/bklpr-random-isotropic-intersection-law`.

Proof or construction contract:

1. Import the parent A_r formula and its mass-one proof.
2. Use the Schubert intrinsic-measure contract and the graph-of-alternating-map comparison in the parent random-intersection proof.
3. Compare the displayed symplectic weights; make no arithmetic frequency assertion.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For the trivial symplectic p-group, the mass is ∏_{i≥r+1}(1−p^(1−2i)); the first factor changes when r increases.

Open inputs: `G-native`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Finite all-prime model at positive rank

Identifier: `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.positive_rank_all_primes`.

Fix r≥1 and independently choose T_p from A_(p,r) for every prime p. Then T=⊕_p T_p is finite almost surely and has the multiplicative Delaunay law with rank parameter r. The exceptional probability is 1−∏_{i≥r+1}(1−p^(1−2i))=O_r(p^(−1−2r)), so its sum over all primes is finite.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Theorem 5.15 and proof, p. 21.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`, `PadicMeasuresIwasawaAlgebras:L1`.

Proof or construction contract:

1. Construct the countable product law on the parent finite-group carriers.
2. Bound nontriviality by the first-moment estimate on the infinite product.
3. Apply Borel–Cantelli and multiply independent local masses for each finite symplectic group.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At r=1 the nontriviality probability is O(p^(−3)), so infinitely many nontrivial components have probability zero.

Open inputs: `G-native`, `R-probability`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Almost-sure infinite rank-zero all-prime model

Identifier: `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.rank_zero_all_primes_infinite`.

Independently choose T_p from A_(p,0) over all primes. The direct sum is infinite almost surely and assigns probability0 to each specified finite group. For any set P with Σ_{p∈P}1/p finite, ⊕_{p∈P}T_p is instead finite almost surely. The full-prime rank-zero model is not a probability on finite symplectic-group isomorphism classes.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Paragraphs following Theorem 5.15, pp. 21–22; derived Borel–Cantelli formulation.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`, `PadicMeasuresIwasawaAlgebras:L1`.

Proof or construction contract:

1. The nontriviality probability is at least1/p from the i=1 product factor and at most C/p.
2. Use prime harmonic divergence, independence and the second Borel–Cantelli lemma for all primes.
3. For sparse P apply the first Borel–Cantelli lemma.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For P consisting of one prime the group is finite almost surely; for the set of all primes it is infinite almost surely.

Open inputs: `G-native`, `R-probability`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Harmonic bounds for symplectic weights

Identifier: `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.symplectic_harmonic_weights`.

With w_G=#G/#Sp(G), for every N≥1, Σ_{#G=N²}w_G=N^(−1)∏_{p^j∥N}∏_{i=1}^j(1−p^(−2i))^(−1), which lies between1/N and2/N. Thus the bounded-order denominator diverges at least logarithmically, and weights in an order interval [L,N] have O(log(N/L)+1) total mass. The finite divisor product is reciprocal.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Lemma 5.17 and Corollary 5.18, pp. 22–23.

Direct prerequisites: `ArithmeticStatistics:ST.5/symplectic-finite-abelian-p-groups`, `ArithmeticStatistics:ST.5/cauchy-q-binomial-theorem`, `ArithmeticStatistics:ST.5/bklpr-alternating-cokernel-limit`.

Proof or construction contract:

1. Use the parent symplectic mass formula as a formal power-series identity and Cauchy’s q-binomial theorem.
2. Factor over primes and bound the reciprocal Euler product by ζ(2)<2.
3. Sum the resulting harmonic bounds, with integer-floor endpoint control.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For N=1 the sum is 1; for N=p the sole order-p² symplectic group has weight p/(p²−1).

Open inputs: `G-native`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Bounded-order symplectic averages on a sparse prime set

Identifier: `ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.sparse_prime_weighted_limit`.

Let P be primes with Σ_P1/p<∞ and let f on finite symplectic P-groups satisfy Σ_H|f(H)|w_H<∞. Extend f to every finite symplectic G by f(G)=f(G_P). Then lim_{N→∞}(Σ_{#G≤N}f(G_P)w_G)/(Σ_{#G≤N}w_G)=c_PΣ_Hf(H)w_H, where c_P=∏_{p∈P}∏_{i≥1}(1−p^(1−2i))>0. These are group-weight averages, not established elliptic-curve averages.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Theorem 5.16 and proof, pp. 22–24.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`, `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights`.

Proof or construction contract:

1. For mean-zero f truncate the absolutely summable P-group tail and use the harmonic interval estimate.
2. Use numerator bound2ε logN+O(logM), denominator at least(1/2)logN; limsup≤4ε suffices.
3. Let ε→0; restore the mean. The stronger printed constant is unnecessary.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For f the indicator that the P-primary part is trivial, the limit is c_P; absolute summability is required before the truncation step.

Open inputs: `G-native`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Prime-power injection-moment conjecture

Identifier: `ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture`. Definition; proposed declaration: `ArithmeticStatistics.ST5.injection_moment_conjecture`.

Fix q=p^e with p prime and e≥1. For m≥0 define I_m(S)=#Inj((Z/q)^m,S) on the parent finite Z/q-module carrier. For minimal short Weierstrass curves over Q ordered by invariant height, the conjectural mean of I_m(Sel_q E) is q^(m(m+1)/2). For e>1 this is not a polynomial solely in #S. The parent random-model identity does not transfer to arithmetic without uniform integrability.

Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Conjecture 5.11 and discussion, pp. 20–21.

Direct prerequisites: `ArithmeticStatistics:ST.5/bklpr-injection-moments`, `ArithmeticStatistics:ST.5/bklpr-selmer-conjecture`, `ArithmeticStatistics:ST.5/height-moments-in-an-arithmetic-family`.

Proof or construction contract:

1. Express the precise finite-height averaging assertion on the supplied arithmetic family.
2. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

Uses: BKLPR Conjecture5.11: Separates empirical moment convergence from the model identity.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.moments` | projection | Each m has the specified limiting average. |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.zero` | simp | I_0(S)=1. |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.uniform_integrability` | compatibility | A bounded (m+1)-st cardinality moment plus empirical distribution convergence suffices for transfer of the m-th injection moment. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.test_zero` | degenerate | m=0 predicts1. |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.test_first` | computation | m=1 predictsq. |
| `ArithmeticStatistics.ST5.injection_moment_conjecture.test_exponent` | non-example | For q=4, Z/4 has2 injections from Z/4, whereas (Z/2)^2 has0 despite equal cardinality. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-native`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Kummer images are algebraic direct summands

Identifier: `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.kummer_direct_summand`.

For any field k, abelian variety A/k and n>0, the Kummer image of A(k)/nA(k) in H¹(k,A[n]) is a Z/n-module direct summand. Interpret cohomology as fppf when char(k)|n. This is an algebraic splitting; continuity of a complement is not asserted.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Proposition 6.7 and proof, pp. 27–28.

Direct prerequisites: `SelmerIwasawaCohomology:L0`, `AbelianSchemesAndArithmeticModuli:A3`.

Proof or construction contract:

1. For every m|n, the m-torsion Kummer sequence lifts an order-m class of H¹(k,A)[n] to an order-m class in H¹(k,A[n]).
2. Use the classification of bounded-exponent abelian groups as direct sums of cyclic groups, including infinite groups.
3. Lift cyclic generators of H¹(k,A)[n] with their exact orders to split the quotient.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At n=1 both the Kummer image and the quotient cohomology are zero; in characteristic p, n=p must use fppf cohomology.

Open inputs: `G-fppf-theta`, `G-native`, `R-local-global-cohomology`, `R-finite-flat-isogeny`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Adelic Kummer direct-summand comparison

Identifier: `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.adelic_kummer_direct_summand`.

For global k, A/k abelian and n>0 the adelic Kummer image is an algebraic direct summand of the restricted-product group H¹(A_k,A[n]). Choose complements C_v to each local Kummer image, using the good unramified integral reference subgroup outside finitely many places; the global complement is ⊕_v C_v. Replacing it by ∏_v C_v generally leaves the restricted product.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Corollary 6.8 and proof, p. 28.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `mathlib:RestrictedProduct`, `SelmerIwasawaCohomology:L0`.

Proof or construction contract:

1. Apply the local algebraic splitting theorem.
2. Outside the finite bad set the Kummer image is the integral reference subgroup.
3. Decompose each adelic class into a product Kummer component and a finitely supported complement component.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. A complement tuple with nonzero entries at infinitely many good places is excluded unless those entries belong to the integral reference subgroups.

Open inputs: `G-fppf-theta`, `G-native`, `R-local-global-cohomology`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Generic global cohomology splitting conjecture

Identifier: `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`. Definition; proposed declaration: `ArithmeticStatistics.ST5.global_image_splitting_conjecture`.

Fix a global field k and n≥1, with the source bounded-coefficient-height family of elliptic curves (long Weierstrass equations in characteristic2 or3). The image of H¹(k,E[n])→H¹(A_k,E[n]) is conjectured to be a Z/n-module direct summand for a density-one subset. The local Kummer splitting theorem does not prove this global-image assertion.

Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Conjecture 6.9, p. 28.

Direct prerequisites: `SelmerIwasawaCohomology:L0`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`.

Proof or construction contract:

1. Express the precise finite-height averaging assertion on the supplied arithmetic family.
2. Separate the random-model theorem from the conjectural identification of empirical arithmetic laws.

Uses: BKLPR §6.3: Supplies the conjectural global arithmetic reason to sample direct summands.

Planning API:

| Declaration | Role | Statement |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.density` | projection | The exceptional height-frequency tends to0. |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.one` | simp | n=1 has trivial cohomology and splitting. |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.family` | compatibility | The family uses the source height and characteristic-appropriate equations. |

Discriminating unit tests:

| Test label | Kind | Required result |
| --- | --- | --- |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_one` | degenerate | n=1 satisfies splitting for every model. |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_local_global` | non-example | A local complement alone does not supply a complement to the global image. |
| `ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_char_two` | compatibility | In characteristic2 the denominator does not use short Weierstrass equations. |

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All named API statements and all discriminating tests below must hold with these carriers and conventions.

Open inputs: `G-native`, `R-local-global-cohomology`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Global splitting with trivial torsion action

Identifier: `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.trivial_action_global_splitting`.

Let k be global, E/k elliptic, n≥1 prime to char(k), and suppose G_k acts trivially on E[n]. Then the image of H¹(k,E[n]) in H¹(A_k,E[n]) is an algebraic direct summand. This special thin family does not prove the density-one conjecture.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklpr](https://arxiv.org/pdf/1304.3971v2), Lemma 6.10 and Lemma 6.11, p. 28.

Direct prerequisites: `AbelianSchemesAndArithmeticModuli:A3`, `SelmerIwasawaCohomology:L0`, `ArithmeticGaloisDuality:D7`.

Proof or construction contract:

1. The Weil pairing gives µ_n⊂k and E[n]≅µ_n².
2. For every m|n, Chebotarev gives the local-global injectivity of k×/k×m into adelic m-th-power classes.
3. The purity condition modulo every divisor m and bounded cyclic decomposition split the image.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At n=1 the assertion is tautological; at larger n retain both trivial torsion action and invertibility of n in k.

Open inputs: `G-native`, `R-local-global-cohomology`, `R-poitou-tate`, `R-finite-flat-isogeny`.

Native signature boundary: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

### Elliptic height consequences

The parent Selmer averages and the orbit/count interfaces yield finite-height rank inequalities, nonlifting bounds and marked-quartic averages. The analytic result requires the exact special three-Selmer criterion and its primary proof.

#### Rank-zero proportion in a balanced large family

Identifier: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.balanced_three_rank_zero`.

Let F be a positive-density large family of minimal integral elliptic curves over Q ordered by H=max(4|A|³,27B²). Suppose root signs have limiting proportions1/2 each. Then the lower density in F of trivial3-Selmer group, hence Mordell–Weil rank0, is at least1/4. The mean3-Selmer bound≤4 and density-zero rational3-torsion are used.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Theorem 41 and proof, pp. 21–22.

Direct prerequisites: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/rational-p-torsion-has-density-zero`, `SelmerIwasawaCohomology:L2`, `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family`, `ArithmeticStatistics:ST.4`.

Proof or construction contract:

1. Import finite3-Selmer parity as the requested Dokchitser theorem.
2. At each finite height a nonzero even rank contributes at least9 and odd rank at least3.
3. Use the mean bound and balanced parity to bound the zero-rank proportion before taking liminf.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The finite-height minimal costs are 1 at dimension zero, 9 at nonzero even dimension and 3 at odd dimension; these yield the exact 1/4 bound.

Open inputs: `G-native`, `R-selmer-parity`, `R-selmer-local-masses`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Conditional rank-one proportion in a balanced family

Identifier: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.balanced_three_rank_one`.

Under the preceding large-family/root-balance hypotheses, if Sha(E) is finite for every E∈F, the lower density of Mordell–Weil rank1 is at least5/12. A one-dimensional3-Selmer group has rank1 because the finite alternating Cassels–Tate pairing forces dim Sha[3] even. The Sha-finiteness hypothesis is retained.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Theorem 41 and proof, pp. 21–22.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `SelmerIwasawaCohomology:L1`, `SelmerIwasawaCohomology:L2`.

Proof or construction contract:

1. Odd3-Selmer ranks are1 or at least3, hence cardinalities3 or at least27.
2. The balanced mean bound forces at least5/6 of the odd half to have Selmer dimension1.
3. Use the exact Kummer sequence and alternating finite Sha pairing to identify Mordell–Weil rank1.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. Odd dimensions one and at least three cost 3 and at least 27; the resulting 5/12 conclusion must retain finite Sha.

Open inputs: `G-native`, `R-duality-pairing`, `R-selmer-parity`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Positive proportions of algebraic ranks zero and one

Identifier: `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.positive_three_ranks`.

Among all minimal elliptic curves over Q ordered by invariant height, a positive lower proportion has rank0. If all elliptic curves in the source family have finite Sha, a positive lower proportion has rank1. Produce a positive-density finite union of large families invariant under the height-preserving −1 twist with opposite root signs; root-number balance of the full elliptic family is not assumed.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Theorem 4, p. 1; Theorem 5, p. 2; Section 4.1, pp. 21–22.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.0/density-denominator-comparisons`, `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family`, `ArithmeticStatistics:ST.0`.

Proof or construction contract:

1. Use additive dyadic reduction with unit j, the source odd-prime discriminant squarefreeness restrictions and the mod4 odd discriminant condition.
2. Verify invariance under E↦E^(−1), opposite root signs and positive local density.
3. Apply the two balanced-family inequalities and multiply by the family density.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The −1 twist preserves H and acts on the constructed subfamily. The proof must establish opposite root signs there without assuming full-family root balance.

Open inputs: `G-native`, `R-family-adapters`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Special three-Selmer analytic rank-zero criterion

Identifier: `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.analytic_rank_zero_criterion`.

Let E/Q have trivial3-Selmer group, good ordinary reduction at3, irreducible residual action on E[3], and a prime ℓ≠3 with ℓ∥N_E at which the residual representation is ramified. Then L(E,1)≠0. This exact special Skinner–Urban input moves to the present lower-tier plan; its Iwasawa main-conjecture proof remains the stated G-analytic gap.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Theorem 43, pp. 22–23 (source attribution to Skinner–Urban).

Direct prerequisites: `AbelianSchemesAndArithmeticModuli:A3`, `SelmerIwasawaCohomology:L3`.

Proof or construction contract:

1. Import the residual representation, ordinary local condition and elliptic L-function carriers.
2. The specialized main-conjecture implication converts vanishing3-Selmer to nonvanishing of L(E,1).
3. Do not substitute the different rank-one criterion in ST.4 or cite an upward tier20 roadmap.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. All four source conditions must be present, including ramification at the multiplicative prime distinct from three.

Open inputs: `G-analytic`, `G-native`, `R-special-ordinary-input`, `R-finite-flat-isogeny`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Positive proportion of analytic rank zero

Identifier: `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.positive_analytic_rank_zero`.

A positive lower proportion of all height-ordered minimal elliptic curves over Q has both algebraic and analytic rank0. More precisely, in a positive-density large family with good ordinary3, 5∥Δ_E and balanced root signs, at least1/4 have analytic rank0, after deleting the density-zero reducible residual3-action subset.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Theorem 6, p. 2; Theorem 44 and proof, p. 23.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`.

Proof or construction contract:

1. Intersect the root-balanced rank-zero construction with good ordinary3 and5∥Δ.
2. Use quantitative generic residual irreducibility and the multiplicative-reduction inertia calculation at5.
3. The trivial3-Selmer subset satisfies every hypothesis of the special analytic criterion.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The family has good ordinary reduction at three and exactly valuation one at five for its discriminant; the residual ramification check is part of acceptance.

Open inputs: `G-analytic`, `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Positive proportion satisfying the rank part of BSD

Identifier: `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.positive_weak_bsd`.

A positive lower proportion of the height-ordered full elliptic family satisfies rank E(Q)=ord_(s=1)L(E,s)=0. This is the rank assertion of BSD, with no leading-coefficient or regulator formula asserted.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs3](https://arxiv.org/pdf/1007.0052v2), Corollary 7, p. 2; final deduction, p. 23.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`.

Proof or construction contract:

1. Use the common algebraic-and-analytic-rank-zero subset in the preceding theorem.
2. Identify analytic rank0 with the nonzero central value.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The conclusion stops at algebraic and analytic rank zero; no formula for the central-value leading coefficient is obtained.

Open inputs: `G-analytic`, `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Average number of two-Selmer elements not lifting

Identifier: `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.two_selmer_nonlift`.

In the full minimal elliptic family over Q ordered by invariant height, liminf_X average(#Sel₂(E)−#im([2]:Sel₄(E)→Sel₂(E)))≥3/5. Since the limiting mean#Sel₂ is3, at least1/5 of all2-Selmer elements in aggregate fail to lift. This is not a1/5 lower proportion of curves.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs4](https://arxiv.org/pdf/1312.7333v1), Theorem 3, p. 1; final deduction, pp. 21–22.

Direct prerequisites: `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`, `ArithmeticStatistics:ST.4/average-size-of-the-2-selmer-group-is-three`, `SelmerIwasawaCohomology:L0`.

Proof or construction contract:

1. Discard rational2-torsion using a weighted tail controlled by the parent second-moment upper bound.
2. For the torsion-free generic case write Sel₄≅(Z/4)^a×(Z/2)^b and Sel₂≅(Z/2)^(a+b); the liftable subgroup has size2^a.
3. Mean#Sel₄=7 and mean#Sel₂=3 give mean exact-order4 count4. The inequality5·2^a−8≤4^a−2^a bounds mean liftable count by12/5.
4. Subtract and divide finite aggregate counts, then take the appropriate limits.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The pointwise bound 5·2^a−8≤4^a−2^a holds already at a=0 and a=1. The 1/5 bound has Selmer-element, rather than curve, denominator.

Open inputs: `G-native`, `R-local-global-cohomology`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Five-Selmer bounds without root-number balance

Identifier: `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_basic_bounds`.

In every large family F of minimal elliptic curves over Q ordered by invariant height, limsup average(dim_F5 Sel₅)≤21/20 and lower density(dim Sel₅≤1)≥19/24. These hold from mean#Sel₅=6, after controlling rational5-torsion; Mordell–Weil rank is bounded by the reduced Selmer dimension.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Proposition 38, p. 28.

Direct prerequisites: `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`, `ArithmeticStatistics:ST.5/rational-p-torsion-has-density-zero`, `ArithmeticStatistics:ST.4`.

Proof or construction contract:

1. Use20r−15≤5^r for every integer r≥0.
2. Use the cost5^r≥25 on r≥2 and≥1 elsewhere.
3. Apply the mean bound to finite-height inequalities; take limsup or liminf only after the pointwise comparison.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. At dimensions zero and one the rank-cost inequality 20r−15≤5^r holds, and every dimension at least two costs at least 25.

Open inputs: `G-native`, `R-selmer-local-masses`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Five-Selmer bounds in a root-balanced family

Identifier: `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_balanced_bounds`.

If the large family F also has limiting root signs1/2 each, limsup average(dim Sel₅)≤3/4, lower density(dim Sel₅≤1)≥7/8, and lower density(dim Sel₅=0)≥3/8. Apply parity after removing the negligible torsion subset. All estimates use finite-height inequalities so independent limsups are not added.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Proposition 40 and proof, p. 29, with corrected limiting argument.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `SelmerIwasawaCohomology:L2`.

Proof or construction contract:

1. Use12r+1≤5^r on even r and60r−55≤5^r on odd r.
2. At each fixed height, combine the even and odd sums with the one total mean and the lower bound on the odd sum.
3. For low-rank densities use the finite even/odd counts and costs1,25 and5,125. Root balance then gives the stated constants.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. Prove the inequality using the total finite-height sum, not separately attained conditional limsups; retain the rounded constants 3/4,7/8,3/8.

Open inputs: `G-native`, `R-selmer-parity`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Explicit root-balanced family of density greater than .5501

Identifier: `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_root_balanced_family`.

There is a finite union F of large congruence families, invariant under E↦E^(−1), on which root signs are opposite and whose height density in all minimal elliptic curves is greater than5501/10000. The local dyadic and3-adic tables, infinite good-prime exclusions and positive/negative discriminant archimedean masses are part of the construction; the two real signs do not each have weight1/2.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Theorem 6, pp. 4–5; Section 5, Propositions 35–37 and local tables, pp. 23–27.

Direct prerequisites: `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family`, `ArithmeticStatistics:ST.0/density-denominator-comparisons`, `ArithmeticStatistics:ST.0`.

Proof or construction contract:

1. Apply the finite dyadic and3-adic residue tables with minimal-model normalization.
2. Combine the good-prime conditions and the source explicit bounded-prime computation with a rigorous remaining Euler-product bound.
3. Use opposite signs under the −1 twist and the correct archimedean density weights. Certified evaluation of the tables and product is G-five-density.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. Certify the residue-class masses and remaining prime-product error sufficiently to prove density greater than 5501/10000 with the actual real-sign masses.

Open inputs: `G-five-density`, `G-native`, `R-family-adapters`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Average Mordell–Weil rank less than .885

Identifier: `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_full_average_rank`.

In the full height-ordered minimal elliptic family, limsup average rank≤88497/100000<177/200=.885. The mixture uses the root-balanced subfamily with density≥.5501 and its complement; the5-Selmer average bound on the complement follows by finite-height subtraction from the full and subfamily means.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Theorem 3, p. 2; final deduction, pp. 29–30.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`.

Proof or construction contract:

1. Use balanced bound3/4 on F and basic bound21/20 on its complement.
2. At finite height derive the complement mean from the exact mean6 on the full and large subfamilies, then apply the rank inequality.
3. Compute .5501·.75+.4499·1.05=.88497 exactly; density larger than.5501 improves the bound.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The exact rational mixture is 88497/100000, strictly less than 177/200.

Open inputs: `G-five-density`, `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### At least83.75 percent have rank at most one

Identifier: `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_full_low_rank`.

In the full height-ordered minimal elliptic family, lower density(rank E≤1)≥67/80=.8375. The stronger rational mixture lower bound is .5501·7/8+.4499·19/24=100501/120000. This is a statement about Mordell–Weil ranks bounded by Selmer dimensions, without a Sha-finiteness hypothesis.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Theorem 4, p. 2; final deduction, p. 30.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`.

Proof or construction contract:

1. Apply the finite-height low-Selmer-rank bounds in F and its complement.
2. Pass the exact density weights through liminf; larger F density improves the mixture.
3. Use the Kummer rank inequality and retain the stated rounded bound.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The exact mixture is 100501/120000≥67/80; lower Selmer rank bounds Mordell–Weil rank without finite Sha.

Open inputs: `G-five-density`, `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### At least20.62 percent have rank zero

Identifier: `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.five_full_rank_zero`.

In the full height-ordered minimal elliptic family, lower density(rank E=0)≥1031/5000=.2062. The unrounded lower bound .5501·3/8=16503/80000 is obtained from the balanced subfamily alone. No proportion of Sha-finite curves is assumed.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bs5](https://arxiv.org/pdf/1312.7859v1), Theorem 5, p. 2; final deduction, p. 30.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`.

Proof or construction contract:

1. Use the balanced-family trivial5-Selmer proportion3/8.
2. Multiply by the subfamily density≥.5501.
3. Trivial5-Selmer forces rank0; take the full-family lower density.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The exact unrounded product is 16503/80000≥1031/5000.

Open inputs: `G-five-density`, `G-native`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Average two-Selmer size of marked genus-one Jacobians

Identifier: `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.jacobian_marked_average`.

Count locally soluble curves z²=f(x,y), with f an irreducible integral binary quartic, up to the source twisted PGL₂(Q) action, ordered by invariant height of Jac(C). The limsup average#Sel₂(Jac C) is at most6. This denominator counts the quartic genus-one objects, not unweighted elliptic Jacobians or arbitrary coefficient vectors; it is a key input to the parent second-moment bound≤15.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bss](https://arxiv.org/pdf/2110.09063v1), Theorem 1.2, p. 2; monicization and proof assembly, Sections 3–7, pp. 13–47.

Direct prerequisites: `ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-two-selmer`, `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count`, `ArithmeticStatistics:ST.1`, `ArithmeticStatistics:ST.2`, `ArithmeticStatistics:ST.0`.

Proof or construction contract:

1. Import the quartic-to-Jacobian carrier and quotient denominator.
2. The requested even-degree monicization and fixed-A integral descent encode each marked curve and an additional Selmer class.
3. Use the increasingly sparse leading-coefficient-dependent counts, cusp/tail bounds and local mass assembly, rather than multiplying two marginal means.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. Two distinct quartic objects with the same Jacobian contribute separately when the orbit denominator distinguishes them; the bound is a limsup at most 6.

Open inputs: `G-bss`, `G-native`, `R-bss-monicization`, `R-bss-sparse-count`, `R-family-adapters`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

### Number-field twist consequences

The three-isogeny average uses the unweighted squareclass count, the local Selmer-ratio product and the finite archimedean window. The general endomorphism index claim is a gap; the multiplication-by-three case has a direct index bound and still yields the finite-extension theorem.

#### Three-isogeny average for abelian varieties

Identifier: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.abelian_three_isogeny_average`.

Let F be a number field, φ:A→A′ a degree3 isogeny of abelian varieties, and Σ⊂F×/F×² nonempty and defined by finitely many local conditions. Count each squareclass once, ordered by H(s)=∏_{v_finite:v(s) odd}Nv. Then average_s∈Σ#Sel_(φ_s)(A_s)=1+average_Σ c(φ_s). At finite places the local average uses the pullback of normalized additive Haar measure on O_v, not uniform mass on squareclasses; archimedean factors use the finite representative-window convention of ST.2.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Theorem 2.1, pp. 2–3; Sections 3–8, pp. 5–12.

Direct prerequisites: `ArithmeticStatistics:ST.0/twist-denominator-frontier`, `ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count`, `ArithmeticStatistics:ST.5/selmer-ratio-of-an-isogeny`, `AbelianSchemesAndArithmeticModuli:A3`, `SelmerIwasawaCohomology:L0`, `ArithmeticStatistics:ST.1`, `ArithmeticStatistics:ST.2`.

Proof or construction contract:

1. The degree3 kernel has a quadratic mirror algebra; the norm-one description and binary-cubic covering orbit classification depend only on this kernel, allowing general A.
2. Use integral local representatives after the fixed discriminant scale and the compatible local mass identities.
3. Apply the conditional ST.2 coregular count after its six axioms and representative-window measure are discharged; add the unique reducible identity orbit.
4. The exact height denominator and local-ratio product then yield the equality. This proof is not closed while G-twist-count remains.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. For a local-ratio-one subfamily the formula predicts mean 2. Keep the height and Haar conventions when passing from elliptic to higher-dimensional A.

Open inputs: `G-twist-count`, `G-native`, `R-local-global-cohomology`, `R-finite-flat-isogeny`, `R-bklos-orbit-adapter`, `R-bklos-count-closure`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Conditional rank bound from a factored endomorphism

Identifier: `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.endomorphism_rank_bound`.

Let ψ:A→A factor over F as a nonempty chain of degree3 isogenies φ_i. Assume additionally a constant c>0, independent of s, such that log₃#(A_s(F)/ψ_s A_s(F))≥c·rank_Z A_s(F) for every quadratic twist s. Then limsup average rank A_s(F)≤c^(−1)Σ_i(1+average c(φ_(i,s)))<∞. The source’s unrestricted ψ claim is retained as G-endomorphism, because its e/t index estimate is not justified for a general Z[ψ]-module.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Theorem 2.2, p. 3; Section 9 proof, pp. 12–13, corrected conditional formulation.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/isogeny-factorisation-selmer-exact-sequence`, `AbelianSchemesAndArithmeticModuli:A6`.

Proof or construction contract:

1. Iterate the isogeny Selmer exact sequence to bound log₃#Sel_ψ by the sum of degree3 Selmer dimensions.
2. Embed the Mordell–Weil quotient in Sel_ψ and apply the explicit uniform rank-index hypothesis.
3. Bound each dimension by its cardinality and apply the abelian average theorem.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. An endomorphism acting as identity on one product factor cannot use its degree to infer a positive uniform index bound on that factor; the additional c hypothesis is mandatory.

Open inputs: `G-twist-count`, `G-endomorphism`, `G-native`, `R-endomorphism-action`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Bounded twist rank when multiplication by three factors

Identifier: `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.multiplication_three_rank_bound`.

If [3]:A→A factors over F as a chain of degree3 isogenies, the average rank of all quadratic twists A_s/F under H(s)=∏_{v(s) odd}Nv is bounded. In this case #A_s(F)/3A_s(F)≥3^(rank A_s(F)), so the preceding theorem applies with c=1. This conclusion needs no assumption that Z[ψ]-modules have uniform index e/t.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Abstract, p. 1; Theorem 2.2 and Section 9, pp. 3,12–13, source-faithful multiplication-by-three specialization.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `AbelianSchemesAndArithmeticModuli:A3`.

Proof or construction contract:

1. Mordell–Weil finite generation computes the3-quotient of the free part exactly.
2. Use the preceding conditional rank bound with ψ=[3] and c=1.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. On a free Mordell–Weil group of rank r, the quotient by three has exactly 3^r elements; torsion can only increase that index.

Open inputs: `G-twist-count`, `G-native`, `R-finite-flat-isogeny`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Bounded twist rank after a finite extension

Identifier: `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.finite_extension_rank_bound`.

For every abelian A/F there is a finite extension L/F such that the average ranks of all twists of A_L over L are bounded in the L-squareclass height ordering. Take L making A[3] rational; a complete flag in A[3](L) factors multiplication by3 into degree3 isogenies. Neither a bound over the original F nor uniformity as L varies is asserted.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Theorem 2.3 and preceding deduction, p. 3.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `AbelianSchemesAndArithmeticModuli:A3`.

Proof or construction contract:

1. Pass to the finite3-torsion splitting extension.
2. Use the requested finite subgroup-scheme quotient and flag API to factor[3].
3. Apply the multiplication-by-three rank bound to the new L-family, without transferring densities between F and L.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The torsion-splitting extension and complete flag factor [3]; all twist averages then use L-squareclasses, not the old F denominator.

Open inputs: `G-twist-count`, `G-native`, `R-finite-flat-isogeny`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Explicit rank bound from the logarithmic Selmer ratio

Identifier: `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.elliptic_explicit_twist_rank`.

Let φ:E→E′ be a3-isogeny over a number field F and Σ a nonempty family defined by finitely many local conditions. In the unweighted squareclass height ordering, limsup average rank E_s(F)≤average_Σ(|t(s)|+3^(−|t(s)|)), with t(s)=ord₃c(φ_s). Only finitely many t-values occur; each stratum is a finite union of local rectangles.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Theorem 2.4, pp. 3–4; Section 9.1, p. 13.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula`, `ArithmeticStatistics:ST.5/isogeny-factorisation-selmer-exact-sequence`, `ArithmeticStatistics:ST.5/selmer-ratio-classes-are-locally-defined`, `ArithmeticStatistics:ST.5/finitely-many-twists-with-rational-p-torsion`, `ArithmeticStatistics:ST.2`.

Proof or construction contract:

1. On a signed t=m stratum, use Cassels’ formula to compare φ and dual Selmer dimensions after deleting the finitely many rational odd-torsion twists.
2. Use the two isogeny averages and convexity to bound the sum of Selmer dimensions by|m|+3^(−|m|).
3. The exact sequence bounds reduced3-Selmer rank and hence Mordell–Weil rank; average the finite set of strata with proved densities.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. On t=0 the rank bound is 1; on |t|=1 it is 4/3. The strata must have the established local densities.

Open inputs: `G-twist-count`, `G-native`, `R-bklos-count-closure`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Signature-dependent positive proportions of small twist ranks

Identifier: `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.signature_positive_twists`.

For a number field F and an elliptic curve E/F with a3-isogeny: if F is totally real, positive lower proportions of twists have rank0 and3-Selmer rank1; if F has at most one complex place and at least one real place, a positive lower proportion has3-Selmer rank1; if F is imaginary quadratic, a positive lower proportion has Mordell–Weil rank0 or1 in union. These statements use the squareclass height; the last does not give both proportions separately.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Theorem 2.6(i)–(iii), pp. 4–5; Sections 10.3,10.4, pp. 16–18.

Direct prerequisites: `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`, `ArithmeticStatistics:ST.5/positive-proportions-of-three-selmer-ranks-in-local-subfamilies`, `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`, `ArithmeticStatistics:ST.2`, `ArithmeticStatistics:ST.4`.

Proof or construction contract:

1. Use archimedean Selmer ratios and the finite-place attainable ranges to prove positive-density support at t=0 or|t|=1 under the indicated signatures.
2. Apply the parent T₀ and|T₁| proportion inequalities.
3. For the imaginary-quadratic case retain the source argument giving the union of low algebraic ranks, with its parity and descent inputs.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The imaginary-quadratic conclusion is positive density of the union of algebraic ranks zero and one; neither individual density is asserted.

Open inputs: `G-local-isogeny`, `G-native`, `R-bklos-count-closure`, `R-local-isogeny-invariants`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

#### Uniform complex-place obstruction to small three-Selmer rank

Identifier: `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`. Theorem; proposed declaration: `ArithmeticStatistics.ST5.complex_place_obstruction`.

For every number field F with r₂ complex places, there exists an elliptic E/F with a3-isogeny such that dim_F3 Sel₃(E_s)≥r₂ for every quadratic twist s. Thus signature hypotheses in the positive-proportion theorem cannot simply be removed. This is an existence construction, not a typical-curve law.

Hypotheses: All parameter restrictions in the statement are hypotheses.

Sources: [bklos](https://arxiv.org/pdf/1709.09790v2), Final assertion of Theorem 2.6, p. 4; Example 13.3 and Proposition 13.4, pp. 22–23.

Direct prerequisites: `ArithmeticStatistics:ST.5/selmer-ratio-of-an-isogeny`, `ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula`, `ArithmeticStatistics:ST.5/isogeny-factorisation-selmer-exact-sequence`, `ArithmeticStatistics:ST.4`.

Proof or construction contract:

1. Use E_k:y²=x³+(4^k·3^8+27)(x+4)² with k satisfying the source local valuation bounds.
2. The local ratios at2,3 and infinity give c(φ_s)≥3^r₂ for every s.
3. The local/global Selmer-ratio formula and exact sequence force the Selmer dimension lower bound. Retain the exceptional torsion check and finite k choice from Proposition13.4.

Acceptance: Retain every stated hypothesis and the exact normalization and convergence mode. The example must work for every squareclass after one finite choice of k satisfying the local conditions; it is not an average-only lower bound.

Open inputs: `G-local-isogeny`, `G-native`, `R-local-isogeny-invariants`.

Native signature boundary: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native. The suggested file catalogues this proposition, its API and tests in prose until the supplier carrier is available.

## Supplier reconciliation

Existing part nodes refine several broad parent requests. The following table identifies the actual supplied target; every additional obligation in the final column remains attached to its consumer.

| Consumers | Existing refinements | Still needed |
| --- | --- | --- |
| `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group` | `ArithmeticStatistics:ST.2/refinement-ternary-cubic-acceptable-count`, `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes` | `R-descent-orbits`, `R-selmer-local-masses` |
| `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group` | `ArithmeticStatistics:ST.2/refinement-quaternary-acceptable-count`, `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes` | `R-descent-orbits`, `R-selmer-local-masses` |
| `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group` | `ArithmeticStatistics:ST.2/refinement-quinary-acceptable-count`, `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes` | `R-descent-orbits`, `R-selmer-local-masses` |
| `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average` | `ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count` | `R-bss-monicization`, `R-bss-sparse-count`, `G-bss` |
| `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average` | `ArithmeticStatistics:ST.0/twist-denominator-frontier`, `ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count` | `R-bklos-orbit-adapter`, `R-bklos-count-closure` |
| `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`, `ArithmeticStatistics:ST.5/cohen-lenstra-martinet-average-conjecture` | `ArithmeticStatistics:ST.3/two-extension-three-torsion-means`, `ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean` | `G-inherited-frontiers` |
| `ArithmeticStatistics:ST.5/local-density-of-a-form-modulo-q`, `ArithmeticStatistics:ST.5/local-density-first-moment`, `ArithmeticStatistics:ST.5/veronese-minor-valuation`, `ArithmeticStatistics:ST.5/primitive-pair-minor-gcd-sum`, `ArithmeticStatistics:ST.5/local-density-second-moment`, `ArithmeticStatistics:ST.5/local-density-variance`, `ArithmeticStatistics:ST.5/local-density-lower-bound-on-gradient-stratum` | `ArithmeticStatistics:ST.0/primitive-hypersurface-family` | No additional obligation in this refinement |
| `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/normalized-eigenangle-spacing-measure`, `ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs` | `ArithmeticStatistics:ST.0/principally-polarized-count`, `ArithmeticStatistics:ST.0/unpolarized-abelian-count`, `ArithmeticStatistics:ST.0/polarization-fiber-count` | `G-inherited-frontiers` |
| `ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/real-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer` | `ArithmeticStatistics:ST.0/wood-average-normalizations`, `ArithmeticStatistics:ST.0/wood-type-automorphisms`, `ArithmeticStatistics:ST.3/rigid-embedded-field-family`, `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface` | `R-family-adapters`, `G-inherited-frontiers` |

The ST.1 generic odd-dimensional orbit dictionary does not replace the even-degree BSS monicization. The ST.4 projective plane-cubic transfer counts globally soluble cubics and does not supply all locally soluble Selmer orbits. The ST.2 number-field twist count is conditional on its coregular count and six axioms; ordinary cubic counting and the GlobalFields I squareclass tail do not close that input.

## Exact supplier requests

### R-probability — `PadicMeasuresIwasawaAlgebras:L1`

Countable projective limits of consistent finite probability spaces, with cylinder-set uniqueness; countable independent product laws; first and second Borel–Cantelli, including countable finite-group carriers. Extend the owner as Part II rather than duplicating general measure theory.

Consumers: `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes`, `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`.

### R-local-global-cohomology — `SelmerIwasawaCohomology:L0`

Finite flat fppf H¹, including inseparable torsion, the Kummer exact sequences for n and divisors m|n, restriction/corestriction, Shapiro and localization to restricted products. Supply the genuine cohomological carriers and maps, not opaque propositions.

Consumers: `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`, `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`.

### R-duality-pairing — `SelmerIwasawaCohomology:L1`

The finite-flat local perfect cup-product pairing and self-dual Kummer annihilation; Cassels–Tate pairing with its isogeny adjointness, nondegeneracy after maximal divisible quotient, and alternation for elliptic curves. For the parent 3-isogeny parity, the induced dual-isogeny quotient pairing forces even F₃-dimension; do not assume all Sha finite.

Consumers: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`.

### R-selmer-parity — `SelmerIwasawaCohomology:L2`

Dokchitser–Dokchitser finite reduced p-Selmer parity for elliptic curves over Q, with torsion removed and local/global root number conventions. Supply the descent rank bound and the divisible-Sha correction needed to connect finite and p∞ parity.

Consumers: `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`.

### R-special-ordinary-input — `SelmerIwasawaCohomology:L3`

Ordinary residual3 Selmer structures and comparison to the elliptic3-Selmer carrier for the precise specialized analytic-rank-zero criterion owned here. The Skinner–Urban nonvanishing implication itself is G-analytic in this lower-tier stage.

Consumers: `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`.

### R-poitou-tate — `ArithmeticGaloisDuality:D7`

Poitou–Tate for the self-dual finite-flat group scheme A[λ], including the fppf case, the local invariant maps and reciprocity; kernel Sha¹ of localization and the topological annihilator statement for the global image. Add the finite-exponent compact/discrete character exactness and annihilator duality needed by the compact-open quadratic reductions.

Consumers: `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`.

### R-theta-quadratic — `AbelianSchemesAndArithmeticModuli:A2`

Symmetric line sheaves, theta-group central extensions and their quadratic Brauer obstruction for self-dual isogenies; compatibility with the Weil/cup pairing and odd-degree replacement. This is an extension in the existing owner direction, with fppf base change.

Consumers: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`.

### R-finite-flat-isogeny — `AbelianSchemesAndArithmeticModuli:A3`

Degree3 finite flat kernels, dual isogenies, quadratic twists and kernel mirror algebra; finite subgroup-scheme quotients and complete rational3-torsion flags factoring[3]. Export the Weil pairing and residual torsion action, including characteristic restrictions.

Consumers: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`, `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`.

### R-endomorphism-action — `AbelianSchemesAndArithmeticModuli:A6`

The actual action of endomorphisms on the finitely generated Mordell–Weil group and index under[3]. For general ψ distinguish free modules over a domain from arbitrary Z[ψ]-modules and unit components; do not import the invalid universal e/t rank-index estimate.

Consumers: `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`.

### R-integral-grassmannian — `AlgebraicModuliForArithmeticGeometry:R09.1`

Import Gr(n,2n), universal locally direct-summand subbundle, quadratic vanishing closed loci and determinantal intersection loci over Z. The split integral OGr smoothness, parity components and Schubert dimensions are specific new targets here; the source SGA7 proof inputs remain G-ogr.

Consumers: `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`.

### R-oesterle-measure — `AdelicAlgebraicGroups:AA.2`

Part II: for finite-type X/Z_p, d=dim X_Qp, a unique bounded Borel measure satisfying µ(S)=lim_e #red_e(S)/p^(ed) for clopen S; lower-generic-dimension subschemes have measure0, and a smooth generic point makes every containing open set positive. Count the reduction IMAGE of integral points. Normalize only when total mass is positive and finite. Provide affine-cover gluing and the nonreduced subscheme correction inherited as E705.

Consumers: `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`.

### R-descent-orbits — `ArithmeticStatistics:ST.1`

For n=3,4,5 supply the complete locally soluble descent-orbit bijection at fixed scaled integral invariants, integral representatives and E[n] stabilizers. Use the source projective/central quotient groups: ternary cubics with determinant-twisted PGL₃ (ST.4 only has the globally soluble transfer); BS4 determinant-kernel GL₂×GL₄ quotient on2⊗Sym²4; BS5 determinant-kernel GL₅×GL₅ quotient on5⊗∧²5. Exact-order4 corresponds to strong irreducibility, not the entire Sel₄ group. Reuse ST.1/refinement-genus-one-stabilizer-schemes.

Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.

### R-selmer-local-masses — `ArithmeticStatistics:ST.4`

For the accepted ST.2 ternary, quaternary and quinary acceptable-weight counts, construct the rational-to-integral orbit weights, local Kummer cokernel/kernel factors and real/global Jacobian/Tamagawa mass assembly. Preserve the BS5 real stabilizer divisor1/5 corrected in ST.2; prove means4,7,6 on large families before using rank consequences.

Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`.

### R-bss-monicization — `ArithmeticStatistics:ST.1`

BSS Theorem1.4: even n monicization f_mon=f₀^(−1)f(x,f₀y), the quadratic-twist2-torsion cohomology comparison, injection of Sel₂(J_f) into SL_n/µ₂(Q) pencil orbits with invariant f_mon; local solubility when n≡0 mod4. Theorem3.2 gives a fixed κ(n) scaling and integral representative with split antidiagonal A. This is distinct from the odd-degree BGW pencil targets. Supply BSS Theorem4.2 local integral uniqueness and its hypotheses.

Consumers: `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`.

### R-bss-sparse-count — `ArithmeticStatistics:ST.2`

Reuse the accepted smoothed fixed-A quaternary count and its weight/range restrictions. Complete BSS §§5–7 for leading coefficient a: increasingly sparse congruence subsets of density about a^(−6), uniform small-leading-coefficient and powerful-part estimates, cusp control and local mass assembly. This does not follow from a fixed ordinary quartic count or a product of marginal Selmer averages.

Consumers: `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`.

### R-bklos-orbit-adapter — `ArithmeticStatistics:ST.1`

BKLOS Theorems4.2,5.3,6.2 and7.2: normalized-discriminant SL₂ binary cubics (a,3b,3c,d), mirror quadratic algebra and norm-one kernel description, locally φ-soluble orbit dictionary for general abelian A, unique reducible identity orbit, fixed integral scale and local mass comparison. The number-field coregular count in ST.2 is conditional until these exact adapters and six counting axioms hold.

Consumers: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups`.

### R-bklos-count-closure — `ArithmeticStatistics:ST.2`

Discharge G-twist in refinement-number-field-twist-orbit-count: the actual coregular SL₂ invariant-height main term (not merely Global Fields I), all six axioms, uniform large-prime tail and compatible finite archimedean squareclass representative window. Prove positive height densities of finite unions of local rectangles and the local average product.

Consumers: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`.

### R-local-isogeny-invariants — `ArithmeticStatistics:ST.4`

Route the parent Dokchitser–Dokchitser Lemmas4.6–4.7 and Table1 local Tamagawa/formal-group calculations to a Part II of the existing elliptic local-reduction owner. The needed conclusions are the norm-index cancellation for potentially good quadratic twists over2-adic/3-adic fields and the p≠3 type-IV and split-multiplicative3-isogeny ratios. Obtain a directly read primary version before claiming proof closure.

Consumers: `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction`, `ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.

### R-family-adapters — `ArithmeticStatistics:ST.0`

Reuse the source-specific finite-height denominators and height rescaling nodes. Connect the existing ST.5 exact-slice Wood extension carriers to wood-average-normalizations, without changing the existing rigidification formulas. Supply the explicit balanced BS3/BS5 finite-union local-family interfaces and the BSS quotient genus-one family ordered by Jacobian height.

Consumers: `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/real-exact-slice-parametrization`.

## Remaining proof and interface gaps

### G-lc-duality — Topological quadratic reductions and projective measure

Prove the requested compact-open annihilator and finite-exponent Pontryagin exactness, consistent finite-isotropic cylinder construction, cofinal inverse-limit topology and a.s. discreteness. The suggested carrier is available; these are mathematical proof/interface inputs, not existing general biduality theorems at the pin.

Targets: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`.

### G-fppf-theta — Finite-flat theta obstruction and global duality

Export genuine fppf H¹/Brauer/local-invariant/theta-group interfaces and prove local quadratic Kummer isotropy and global maximal isotropy. The finite group-scheme Sha¹ quotient in Theorem4.13 must survive the comparison.

Targets: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`.

### G-ogr — Integral orthogonal geometry and Oesterlé proof inputs

Complete the integral split OGr charts/component morphism and SGA7 proof contract, including characteristic2. The generic Grassmannian belongs to R09.1. Read or supply Oesterlé/Serre’s underlying p-adic estimates in AA.2 Part II; BKLPR Proposition2.1 is a stated source-qualified input, not a verified decomposition of those references.

Targets: `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`.

### G-wood-analysis — Analytic coefficient and bounded-exponent moment interfaces

Prove locally uniform convergence of the infinite product, its entire Taylor expansion with absolute bounds, justified countable interchanges, subgroup-bound growth and dominated tightness. Export the partition/group realization carrier from the parent to state the full bounded-exponent group theorem natively. The scalar real moment theorem in current Tau Ceti has a different exponential-integrability hypothesis and does not discharge this gap.

Targets: `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`.

### G-full-group-tail — From bounded exponents to the parent full Cohen–Lenstra law

Wood Theorem3.1 establishes quotient laws for each a. To close the parent all-p,u full finite-p-group limit, additionally bound large rank and exponent tails uniformly in n using its surjection moments and the exact cyclic/elementary-abelian target formulas. Never identify the bounded-exponent theorem with a full-group assertion without this step.

Targets: `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u`.

### G-selmer-orbit-mass — Selmer descent-to-count comparison

The ST.2 counts for n=3,4,5 now exist at target level. What remains is the exact ST.1 locally soluble descent dictionary, integral multiplicity weights and ST.4 local/global mass assembly with the source quotient groups. These are the proof gaps of the parent averages, not missing copies of the coefficient-count theorems.

Targets: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.

### G-bss — BSS even-degree and sparse-count closure

Complete R-bss-monicization and R-bss-sparse-count with their increasingly sparse a-dependent support. The accepted smoothed-quaternary theorem is a key input with a fixed nonzero power saving and constrained weights/ranges; it alone does not prove the full marked Jacobian average or second moment. Both remain upper bounds.

Targets: `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`.

### G-analytic — Special analytic nonvanishing proof and generic residual input

The exact BS3 Theorem43 criterion is now a lower-tier target, but its Skinner–Urban primary proof has not been read/decomposed. Supply the specialized ordinary main-conjecture implication, elliptic L-function and quantitative residual3 irreducibility with multiplicative inertia at5. The ST.4 rank-one criterion does not substitute for it.

Targets: `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`.

### G-five-density — Certified root-balanced family density

Verify the finite2-adic and3-adic local tables and remaining Euler-product tail in BS5 §5 with exact archimedean sign weights and rational interval bounds proving density>.5501. The rounded decimal is not an unverified floating-point implementation claim.

Targets: `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`.

### G-twist-count — Number-field coregular twist count

The accepted ST.2 number-field twist theorem is explicitly conditional. Discharge its six axioms, native mirror/orbit/local-mass adapters and finite representative-window measure using R-bklos-orbit-adapter and R-bklos-count-closure. Extend from elliptic to general degree3 abelian kernels; do not declare a general asymptotic from ordinary cubic-field counting.

Targets: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`.

### G-endomorphism — Unrestricted BKLOS endomorphism rank claim

The source proof treats an arbitrary finitely generated Z[ψ]-module as if its ψ-index were (e/t) times its Z-rank. Unit simple factors and unequal component ranks invalidate this estimate. The general source claim therefore remains an explicit unresolved result. The present conditional index theorem and unconditional [3] specialization are safe; prove a suitable additional componentwise hypothesis or repair the broader theorem before removing this gap.

Targets: `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`.

### G-local-isogeny — Local3-isogeny and Cassels–Tate proof ownership

Read the primary Dokchitser–Dokchitser norm-index formulas and discharge the Cassels–Tate adjoint quotient pairing, local Selmer ratio ranges, torsion exceptions and the finite k choice in the complex-place construction. These are R-local-isogeny-invariants and R-duality-pairing, not fresh probability laws.

Targets: `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`, `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.

### G-kane — Full-two-torsion twist law analytic inputs

The parent Kane theorem retains full rational2-torsion, no rational cyclic4-subgroup and the source squarefree twist ordering. Read and close Kane §§2–7 character-sum bounds and the Swinnerton-Dyer combinatorial limiting law at their actual owner. The source listed as nonpublic in the parent has not been used from an uncleared copy here.

Targets: `ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families`.

### G-dejong — Primary de Jong function-field verification

Obtain and directly read Counting elliptic surfaces over finite fields, Moscow Math. J.2(2002),281–311. Until then the parent function-field3-Selmer limsup≤4+O(1/q) remains explicitly second-hand with3∤q and source denominator; no direct proof or ordinary-limit claim is added.

Targets: `ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound`.

### G-inherited-frontiers — Retained random-group and function-field frontiers

Retain the parent certified D₄ weighted-vs-uniform comparison (ST.3 now supplies proven symbolic constants but not error-bounded numeric evaluation); enhanced CL existence (joint cokernels of noncoprime polynomials); finite-field abelian inputs in the existing Part II; EVW homological stability as an imported source-qualified input; and nonabelian Schur–Zassenhaus conjugacy as an explicit hypothesis without a cyclic upward request. Preserve Smith Part II conditional use, Wood non-good liminf/boundary remainder, LWZB iterated limsup/liminf, and all corrected finite-field exclusions. This pass supplies ownership adapters, not proofs of these already owned targets.

Targets: `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-finite-level-law`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-conjecture`, `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law`, `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs`, `ArithmeticStatistics:ST.5/large-q-cohen-lenstra-theorem`, `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-lower-bound`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer`, `ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion`, `ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions`, `ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments`.

### G-native — Native arithmetic and geometric signatures

The suggested file elaborates seven supported native targets. The remaining targets require supplier exports for scheme-valued OGr points, finite group isomorphism classes, normalized arithmetic families, fppf cohomology and theta maps, or elliptic L-functions. Each omitted declaration is catalogued in the file with its full proposition and a node-specific reason. No arbitrary Prop, numerical-law wrapper or opaque model stands in for these objects.

Targets: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`, `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`, `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`, `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes`, `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`, `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights`, `ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit`, `ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`, `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`, `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift`, `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.

## Ownership and lower-tier extensions

- **IntegralLattices** (Finite Q/Z quadratic modules and isotropic quotients): Import existing current and pinned finite quadratic modules; no duplicate carrier.
- **RestrictedProducts** (Restricted products and compact-open integral subgroups): Import existing owner; use the pinned Mathlib carrier rather than the post-pin convenience alias.
- **StandardDistributions** (Scalar real moment determinacy): Import owner only for genuine scalar applications; Wood partition growth does not satisfy the available exponential-integrability hypothesis.
- **OrthogonalSpinGroups** (Classical groups over fields of characteristic not2): The all-prime integral OGr targets extend a different needed scheme-valued comparison; generic Grassmannians stay with R09.1.
- **EllipticCurves** (Existing explicit Selmer/Mordell–Weil library): Import the actual descent layers; general abelian fppf/theta/Cassels–Tate inputs require the named lower-tier suppliers.

AdelicAlgebraicGroups, Part II: Oesterlé–Serre integral-point measure by reduction-image counts and its affine-cover gluing; generic p-adic scheme integration belongs to the existing measure owner.

ArithmeticGaloisDuality, Part II: extend compact/discrete torsion character duality and finite-flat Poitou–Tate to the quadratic restricted-product applications, without duplicating general cohomology or theta-group definitions.

The exact special three-Selmer analytic-rank-zero criterion is owned by ST.5/refinement-analytic-rank-zero-criterion in tier14. OrdinaryAutomorphicFormsAndModularityLifting in tier20 must import this criterion rather than be an upward prerequisite; its primary proof remains G-analytic.

Import current IntegralLattices finite quadratic/isotropic-quotient API and current completed RestrictedProducts. The latter’s TauCeti convenience alias postdates the atlas pin; the suggested interfaces use pinned Mathlib RestrictedProduct. Current scalar moment determinacy stays in StandardDistributions and does not replace Wood’s group moment theorem.

ArithmeticStatistics is in tier 14, in the AnalyticNumberTheory bundle. OrdinaryAutomorphicFormsAndModularityLifting is in tier 20 and cannot be a prerequisite here. The special analytic criterion therefore moves down to this layer; the higher roadmap must import it. Generic automorphic and Iwasawa theory remains with its owners.

## Source corrections used by the targets

These findings are source-specific mathematical checks, expressed in original words. They are not independent review verdicts. The accepted parent’s earlier findings remain unchanged.

### ArithmeticStatistics/E740 — PR arXiv1009.0287v2, Corollary2.12 proof, p. 8

Scope: misprint, affecting the proof. Own-word paraphrase, not a source quotation: The separability argument calls the discrete quotient by a compact-open subgroup finite.

Correction: Replace finite by countable. A dense countable subset meets each open coset, so the quotient is countable and the group is sigma-compact.

Reason: The self-dual group Z×R/Z is separable and has compact-open subgroup{0}×R/Z with quotientZ. Finiteness is false; countability proves exactly what is needed.

Version check: Not located as a correction in the versions checked. Searches: arXiv1009.0287v2, p.8; statement and preceding Proposition2.11; Author bibliography and linked source versions; no claim that all published errata were searched.

### ArithmeticStatistics/E741 — Wood arXiv1402.5149v2, Lemma8.1 and proof, pp. 28–29

Scope: misprint, affecting the proof. Own-word paraphrase, not a source quotation: The coefficient estimate is printed without absolute values and its finite-polynomial maximum is signed.

Correction: Use |a_d| and max|e_d|, with E positive; keep the same exponent and support.

Reason: Theorem8.2 needs absolute convergence of signed coefficient sums. The exact head coefficients alternate signs, so a one-sided bound cannot justify the interchange.

Version check: The downloaded latest arXiv copy retains the omission; no separate correction located. Searches: arXiv1402.5149v2 Lemma8.1 and Theorem8.2; Latest arXiv PDF at1402.5149, same passages.

### ArithmeticStatistics/E742 — BKLPR arXiv1304.3971v2, proof of Theorem5.16, pp.23–24; author final copy Theorem5.17 proof, pp.25–26

Scope: error, affecting the proof. Own-word paraphrase, not a source quotation: The upper harmonic estimate is used with coefficient1/2 although the preceding lemma only gives upper coefficient2.

Correction: Use numerator≤2ε logN+O(logM) and denominator≥(1/2)logN; the limsup is at most4ε and still tends to0.

Reason: Weights of square-order groups lie between1/N and2/N. The lower constant cannot also be used as an upper bound. Only a fixed multiple of ε is needed.

Version check: The author final copy retains the stronger constant; no separate correction located. Searches: arXiv1304.3971v2 Theorem5.16 proof; https://math.mit.edu/~poonen/papers/rst_distribution.pdf, Theorem5.17 proof.

### ArithmeticStatistics/E743 — BS5 arXiv1312.7859v1, Proposition40 proof, equation(33), p.29

Scope: error, affecting the proof. Own-word paraphrase, not a source quotation: A joint linear constraint is asserted after replacing the two conditional means by their separate limsups.

Correction: Derive the needed bound for the total mean at each finite height, using the same odd/even counts and the lower bound on the odd mean, then pass to the limsup. Use the corresponding finite count argument for lower-density estimates.

Reason: Separate limsups can occur along different subsequences. For a toy example let (a_n,b_n) alternate(1,0),(0,1): every a_n+b_n=1 but limsup a_n+limsup b_n=2. The finite empirical inequalities prove the target constants without this invalid operation.

Version check: No correction located in the version read; the result survives this elementary repair. Searches: arXiv1312.7859v1 Proposition40 and final deductions; Source equations compared with the direct finite-height derivation in this packet.

### ArithmeticStatistics/E744 — BKLOS arXiv1709.09790v2, Theorem2.2 and Section9 proof, pp.3,12–13; author PDF same locators

Scope: gap, affecting the proof. Own-word paraphrase, not a source quotation: For O=Z[ψ] of Z-rank t and #O/ψ=3^e the proof asserts a lower bound3^((e/t)rank A_s(F)) on the ψ-index for every twist.

Correction: Retain the unrestricted claim as a gap. Add an explicit uniform positive rank-index hypothesis, or specialize to ψ=[3], where the free Z-module calculation gives the bound with c=1.

Reason: For a product with ψ=(id,[3]) the degree3 chain can operate solely on the second factor; its Selmer groups and ψ-index give no control on the first factor’s Mordell–Weil rank. Even O=Z[(3,9)] has unequal component index rates, so arbitrary O-modules do not have the uniform e/t rate. No counterexample to the broader average-rank conclusion is claimed.

Version check: No correction located; the abstract states the sound[3] specialization, but the theorem and Section9 in the author PDF retain the broader claim. Searches: arXiv1709.09790v2 Theorem2.2 and Section9; https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf Theorem2.2 and Section9; arXiv1709.09790 abstract and version history (latest v2).

## Baseline receipts

The following actual declarations were read at the pinned baseline. General exactness, scheme representability or moment determinacy is not inferred from the existence of a carrier.

| Reference | Module | Supplied statement |
| --- | --- | --- |
| `mathlib:QuadraticMap` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | A quadratic map of modules with square homogeneity and a bilinear companion; instantiated with ℤ and the additive real circle. |
| `mathlib:QuadraticMap.polar` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The function q(x+y)−q(x)−q(y), not half that function. |
| `mathlib:QuadraticMap.polarBilin` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The actual associated bilinear map, available without inverting 2. |
| `mathlib:QuadraticMap.polar_self` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The diagonal polarization identity polar(q)(x,x)=2q(x). |
| `mathlib:ContinuousAddMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | Continuous additive homomorphisms; their compact-open topology is supplied by Group/CompactOpen. |
| `mathlib:ContinuousAddEquiv` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | An additive equivalence that is a homeomorphism, stronger than an algebraic duality bijection. |
| `mathlib:PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | Multiplicative-circle character carrier; the additive-circle form is ContinuousAddMonoidHom. This file alone does not provide general biduality. |
| `tauceti:TauCeti.FiniteQuadraticModule` | `TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.lean` | The finite ℚ/ℤ quadratic module is already implemented and is imported, never rebuilt. |
| `tauceti:TauCeti.FiniteQuadraticModule.ofQuadraticMap` | `TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.lean` | The canonical finite quadratic carrier with its polar pairing from a given quadratic map. |
| `mathlib:tprod` | `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean` | An unconditional infinite product; on failure of multipliability its default is1, so the Wood product target must separately prove convergence. |
| `mathlib:HasProd` | `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean` | Convergence of the finite-partial-product filter to a specified value. |
| `mathlib:RestrictedProduct` | `Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean` | The subtype of dependent functions integral eventually for a specified filter, with the cofinite restricted-product convention and existing topological/algebraic instances. |

## Sources and reading boundary

All source locators use the printed pages of the stated version. The author-final BKLPR copy has different theorem numbering from arXiv v2; the comparison receipt names both. The source statements throughout this document are original formulations, not quotations.

### pr — [Random maximal isotropic subspaces and Selmer groups](https://arxiv.org/pdf/1009.0287v2)

Bjorn Poonen; Eric Rains. arXiv:1009.0287v2; all page locators below are the preprint’s printed pages.

Read or checked: Definitions 2.13–2.18, Theorem 2.19 and proof, pp. 8–11; Proposition 3.3 and proof, pp. 13–14; Sections 4.1–4.3, Theorem 4.13 and applications, pp. 14–21; Conjectures 1.4, 1.7, 1.8, pp. 3–4.

Version fingerprint: `b2a91d0b2b01863c659500d224e922d0e40004c45e917fca23b59a59e5307c6e`; accessed 2026-10-11.

### bklpr — [Modeling the distribution of ranks, Selmer groups, and Shafarevich–Tate groups of elliptic curves](https://arxiv.org/pdf/1304.3971v2)

Manjul Bhargava; Daniel M. Kane; Hendrik W. Lenstra Jr.; Bjorn Poonen; Eric Rains. arXiv:1304.3971v2; printed preprint pages.

Read or checked: Section 2.1 and Oesterlé measure comparison, pp. 5–6; Section 4, split orthogonal Grassmannian, pp. 12–15; Sections 5.4–5.6, injections and prime products, pp. 19–24; Section 6.3, Kummer direct summands and global-image conjecture, pp. 26–29.

Version fingerprint: `370b9b8d853103b1388bdb52e1839e8c8e60c754f81b64c100a1ec89bb515c21`; accessed 2026-10-11.

### wood — [The distribution of sandpile groups of random graphs](https://arxiv.org/pdf/1402.5149v2)

Melanie Matchett Wood. arXiv:1402.5149v2; printed preprint pages.

Read or checked: Lemma 7.4 and proof, pp. 27–28; Section 8, Lemma 8.1, Theorems 8.2–8.3 and proofs, pp. 27–32.

Version fingerprint: `0e12d2fc84bf836603d719e8a7d5146b911ede1f582592325b98422d362cc90c`; accessed 2026-10-11.

### woodmat — [Random integral matrices and the Cohen–Lenstra heuristics](https://arxiv.org/pdf/1504.04391)

Melanie Matchett Wood. arXiv:1504.04391, downloaded version identified by checksum; printed preprint pages.

Read or checked: Theorem 3.1 and Corollaries 3.2–3.5, pp. 9–10.

Version fingerprint: `938818ec6a87de951b906a1c3db076ba5920ada1359c7fdb3a899016e15d6e64`; accessed 2026-10-11.

### bs3 — [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2)

Manjul Bhargava; Arul Shankar. arXiv:1007.0052v2; printed preprint pages.

Read or checked: Theorems 4–6, Corollary 7, pp. 1–2; Section 4.1–4.2, Theorems 41–43 and deductions, pp. 21–23.

Version fingerprint: `317479d621b376ef3ca769a8cf1e7bb3d1b8babefcc726f7e2a9e761b8617108`; accessed 2026-10-11.

### bs4 — [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1)

Manjul Bhargava; Arul Shankar. arXiv:1312.7333v1; printed preprint pages.

Read or checked: Theorem 3, p. 1; final deduction and extremal inequality, pp. 21–22.

Version fingerprint: `1fe01e72dc60658ed51ffecef6ffb6a83818449a0d813fb24c480de678562c35`; accessed 2026-10-11.

### bs5 — [The average size of the 5-Selmer group of elliptic curves is 6, and the average rank is less than 1](https://arxiv.org/pdf/1312.7859v1)

Manjul Bhargava; Arul Shankar. arXiv:1312.7859v1; printed preprint pages.

Read or checked: Theorems 3–6, pp. 2–5; Section 5, Propositions 35–37, explicit balanced families, pp. 23–27; Section 6, Propositions 38–40 and deduction, pp. 28–30.

Version fingerprint: `0fad7f4eab6ade59ca50ddc1f12fb6f50126b5eca204a9fef650649b3203fd6d`; accessed 2026-10-11.

### bss — [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1)

Manjul Bhargava; Arul Shankar; Ashvin A. Swaminathan. arXiv:2110.09063v1; printed preprint pages.

Read or checked: Section 1, Theorems 1.1,1.2,1.4 and counting strategy, pp. 2–5; Theorems 3.1,3.2,4.2 (target statements); Sections 5–7 counting contracts and final proof, pp. 13–22,23–47; detailed closure remains a stated supplier gap.

Version fingerprint: `8f568036291bd251d8598770fa956ec7893675b348259eca1bc5326618ff6be0`; accessed 2026-10-11.

### bklos — [3-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://arxiv.org/pdf/1709.09790v2)

Manjul Bhargava; Zev Klagsbrun; Robert J. Lemke Oliver; Ari Shnidman. arXiv:1709.09790v2; printed preprint pages.

Read or checked: Theorems 2.1–2.6 and hypotheses, pp. 1–4; Sections 3–8, norm-one orbit, local integral and weighted count contracts, pp. 5–12; Section 9, rank consequences and exact sequence, pp. 12–13; Sections 10–11, local ratios and signature support, pp. 13–18; Section 13, Example 13.3 and Proposition 13.4, pp. 20–23.

Version fingerprint: `5a652da57640cf78a787bbbc4b416077eda01880ce453239bf39c08282998d1a`; accessed 2026-10-11.

### kane — [On the ranks of the 2-Selmer groups of twists of a given elliptic curve](https://arxiv.org/pdf/1009.1365v4)

Daniel M. Kane. arXiv:1009.1365v4; printed preprint pages.

Read or checked: Theorem 3 and Corollaries 4–5, pp. 1–3; Sections 2–7 proof closure is retained as a precisely scoped gap.

Version fingerprint: `1a6573c2caff8f4abd15a1ec23b1e757c81a6e3204b4cbae68e5e5c0635e00f1`; accessed 2026-10-11.

### bklprpublished — [Modeling distributions: author final copy](https://math.mit.edu/~poonen/papers/rst_distribution.pdf)

Bhargava; Kane; Lenstra; Poonen; Rains. Author final copy dated July5,2015; different numbering from arXivv2.

Read or checked: Theorem5.17 proof and Lemma5.18/Corollary5.19, pp.24–25; compared with arXivv2 Theorem5.16.

Version fingerprint: `97a89e93a08a9cb1f69a6adb43aa3a5197d3ba3f9865e5973230a4917c281520`; accessed 2026-10-11.

### bklospublished — [Three-isogeny Selmer groups: author copy](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf)

Bhargava; Klagsbrun; Lemke Oliver; Shnidman. Author copy linked from Robert Lemke Oliver’s publication list, identified by checksum.

Read or checked: Theorem2.2 and Section9, pp.3,12–13; compared with arXivv2.

Version fingerprint: `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880`; accessed 2026-10-11.

Kane’s detailed §§2–7 proof closure and the Swinnerton-Dyer input have not been established in this pass; `G-kane` retains them. De Jong’s original function-field proof remains `G-dejong`. The parent’s inherited source boundaries remain `G-inherited-frontiers`. No restricted book passage is included or used to close a prerequisite.

## Acceptance of the layer

The target pass is accepted only if all 194 parent imports remain identified and all 55 new targets retain their exact hypotheses, source locators and prerequisite boundaries. Each of the nine definitions and one construction carries its API and at least three discriminating tests. There are 37 API items and 32 planned tests. The six-planet budget is shared with the parent, and no supplier target is duplicated.

The [suggested file](../suggested/ArithmeticStatistics--ST.5.lean) supplies native forms for seven targets: the three locally compact carriers, the parity weight, the analytic grid separator, the joint moment identity and grid uniqueness. Their API signatures and seventeen examples elaborate at the pin. The remaining 48 signatures, fifteen tests and fifteen API items have full prose catalogues and precise omission reasons; they require actual supplier exports. The five finite numerical inequalities are proof-sketch checks, not additional roadmap nodes. Elaboration checks types and names; it does not establish any proof.

Full mathematical closure requires resolving the sixteen gaps and supplying the nineteen requested interfaces, including all conditional count and analytic inputs. Conjectural arithmetic laws remain conjectural even after their native propositions can be stated. Bounded-exponent moment uniqueness remains separate from full-group tightness; local Kummer splitting remains separate from the density-one global-image assertion; the multiplication-by-three rank bound remains separate from the unsupported general-endomorphism index claim.
