# Arithmetic statistics: geometry of numbers and uniformity

This is the additive ST.2 planning document for [issue 6354](https://github.com/CBirkbeck/tauceti-explorer/issues/6354). It exports the counting inputs used by the field/class-group and Selmer-statistics stages. The [packet](../packets/ArithmeticStatistics--ST.2.json) is a complete target-level pass; its stage is **planned**, with the obligations below. Complete describes coverage of the targets, and certifies neither their proofs nor implementation. The accepted [parent packet](../packets/ArithmeticStatistics.json) and [parent reader](ArithmeticStatistics.md) remain authoritative for their existing binary-cubic and binary-quartic declarations. The [ST.1 refinement](ArithmeticStatistics--ST.1.md) supplies algebraic models and marked lifts, including its open interfaces.

The three exports are lattice counts in arithmetic fundamental domains, cusp and reducibility estimates, and uniform tails that allow infinitely many local conditions. A finite-prime density calculation supplies only the first step of a sieve. For a family with scale X^a, the missing step is a bound on the number of objects excluded at some prime beyond M, divided by X^a, whose height limsup tends to zero as M increases. A divisor-weighted inclusion–exclusion needs a stronger summed-modulus tail. These are separate statements throughout this document.

The input edge from `SieveMethodsAndPrimePatterns:SV.2` is retained as accepted. Its present Gram/additive large-sieve inequalities do not already give the quantitative coefficient-box sieve required for distinguished matrices or non-Sn forms. The exact additional request below identifies those applications. The generic bounded semialgebraic multiset estimate is imported from `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`. Current Tau Ceti already supplies bounded-region lattice counts with Lipschitz-parametrizable frontier and coset-uniform constants. Those declarations are newer than the pinned build, so they are registered as current upstream imports rather than fictitious pinned declarations.

## Objects and conventions

The arithmetic family, invariant height, eligible invariant lattice and stabilizer-weighted count belong to ST.0. Orbit correspondences, fixed-degree binary discriminants, symmetric pencils, orthogonal slices, weak lifts and their marked Q/q invariants belong to ST.1. This pass specializes those interfaces for counting. It creates no alternative generic lattice carrier, fundamental group scheme, semialgebraic carrier or universal height.

An orbit count always specifies its arithmetic group, representation, real component, generic locus and height. It is a cardinal of orbit classes, with the stabilizer convention fixed before choosing a fundamental multiset. Counts in an averaged domain must include its real-stabilizer covering multiplicity. Bounds stated on integral vectors cannot automatically be used for integral orbit classes in a different representation, and a prime-dependent map must have a proved bound on orbit fibres. All uses of `Set.ncard` require finiteness first: on an infinite set this natural cardinal is zero. The suggested file's coefficient counts have finite coordinate boxes and an explicit finite-box interface.

For monic degree n polynomials, write f=x^n+a1 x^(n−1)+...+an. The weighted height condition H(f)<X is |ai|<X^i, and the coefficient-volume exponent is D=n(n+1)/2. For binary forms with n+1 coefficients the equal-coefficient height is their sup norm, giving exponent n+1. For a binary form retain its universal degree-n discriminant when the leading coefficient vanishes. The discriminant of a univariate polynomial taken at its lower actual degree is a different function. For monic polynomials native `Polynomial.discr` agrees with the imported discriminant convention, and the field-level nonzero/separability theorem retains its field hypothesis.

Binary-quartic, ternary-cubic, quaternary-pair and degree-five genus-one counts use invariant height max(|I|^3,J^2/4), with exponent 5/6. Their integral invariant lattices and invariant normalizations depend on the representation. In particular ternary cubics allow I,J denominators16,32. The 50-dimensional degree-five genus-one representation is5 tensor exterior^2(5); the40-dimensional quintic-ring representation is4 tensor exterior^2(5). The BS4 determinant-kernel central-quotient group also differs from BGW's SL_n/mu2. Their volume constants cannot be transported just by reusing matrix coordinates.

Generic means the locus specified in each source. Quartic absolute irreducibility requires S4 closure; quintic irreducibility and S5 absolute irreducibility have the same leading count because the latter complement is negligible. Strongly irreducible ternary cubics have no rational flex; the quaternary-pair criterion uses a binary-quartic resolvent without a rational root; strongly irreducible degree-five genus-one models exclude the trivial covering. BGW's irreducible pencil means discriminant nonzero, without a requirement that its determinant binary form be irreducible over Q. A quantitative non-Sn exception is wider than the Q-reducible locus. The even-degree repair cannot use a reducible-polynomial bound to cover it.

All local coefficient Haar measures are normalized by giving the full integral coefficient lattice mass 1. An infinite product is the limit of finite-prime products, whose existence and positivity need their own hypotheses. Each factor positive does not guarantee the product positive. The hypersurface density uses primitive coefficients modulo sign and Euclidean height. Poonen–Voloch use coefficient cubes, so their real factor must be recomputed for the ball; scalar-invariant p-adic solubility has the same full and primitive-conditional factor. Neither local density nor this ball adaptation asserts a global Hasse-principle theorem.

For BKLOS the integral lattice is binary cubics ax^3+3bx^2y+3cxy^2+dy^3 and Disc=a^2d^2−3b^2c^2+4ac^3+4b^3d−6abcd. The ordinary binary-cubic discriminant is−27 Disc. Thus the source's section 3x^2y+(s/4)y^3 has Disc=s. Use that normalized invariant in every local scaling and infinity integral.

## Accepted parent inputs

These identifiers are imports from the parent, not duplicate new targets. Every suffix in the following table has prefix `ArithmeticStatistics:ST.2/`. Their source qualifications and remaining obligations are retained. The parent geometric sieve still needs its finite-affine-projection/spreading proof, and the parent weak binary-quartic transport still needs the exact wider pair-count input. The new quartic theorem restricts to S4 and does not silently close that input.

| Imported identifier suffix | Target |
| --- | --- |
| `chebyshev-bounds-for-prime-sums` | Chebyshev-type bounds for the prime-counting function and for tails of prime sums |
| `lattice-points-on-a-subvariety-in-a-dilated-region` | Lattice points of a dilated compact region lying on a subvariety of codimension k |
| `uniform-bound-for-points-of-a-subscheme-modulo-p` | A closed subscheme of 𝔸^n_ℤ of codimension k has O(p^{n−k}) points over 𝔽_p |
| `geometric-sieve-small-primes` | The geometric sieve for primes up to the size of the region |
| `geometric-sieve-large-primes` | The geometric sieve for primes larger than the region |
| `quantitative-ekedahl-geometric-sieve` | The quantitative Ekedahl geometric sieve (Bhargava, Theorem 3.3; Bhargava-Shankar, Theorem 2.17) |
| `strongly-and-weakly-divisible-values` | Strong and weak multiples of p^2: the sets W_p, W_p^(1), W_p^(2) of binary quartic and binary cubic forms |
| `strong-divisibility-lies-on-a-codimension-two-locus` | Strong multiples of p^2 reduce into the codimension-two locus f = ∂f/∂x_n = 0 |
| `discriminant-loci-of-codimension-two` | The discriminants of binary quartic and binary cubic forms are primitive and coprime to their derivatives in the last coefficient |
| `local-density-of-values-divisible-by-p-squared` | The p-adic density of {p^2 \| f} is O(p^{-2}) |
| `functions-defined-by-congruence-conditions` | Functions and sets defined by congruence conditions; acceptable functions |
| `real-root-types-of-binary-quartic-forms` | The loci V_ℝ^(0), V_ℝ^(1), V_ℝ^(2±) of real binary quartic forms by number of real roots and definiteness |
| `real-orbits-of-binary-quartic-forms-with-fixed-invariants` | Real binary quartic forms with given invariants form one or three SL_2^±(ℝ)-orbits |
| `stabilizers-of-real-binary-quartic-forms` | Lemma 2.2: stabilisers in GL_2(ℝ) of real binary quartic forms, and the weights n_i |
| `fundamental-sets-for-real-binary-quartic-orbits` | The fundamental sets L^(i) of Table 1 and their scalings R^(i) = Λ·L^(i) |
| `gauss-fundamental-domain-in-iwasawa-coordinates` | Gauss's fundamental domain for GL_2(ℤ)\GL_2(ℝ) in Iwasawa coordinates, with its Haar measure |
| `hyperbolic-area-of-the-modular-fundamental-domain` | The standard fundamental domain of SL_2(ℤ) has hyperbolic area π/3 |
| `covolume-of-pgl2-z` | Vol(PGL_2(ℤ)\PGL_2(ℝ)) = 2ζ(2) for the ℤ-form ω, and the Iwasawa-measure volume of Gauss's domain |
| `orbit-multiplicities-in-fundamental-multisets` | The multiset F h·L^(i) is n_i fundamental domains: orbit multiplicities m(x) = #Stab_{GL_2(ℝ)}(x)/#Stab_{GL_2(ℤ)}(x) |
| `averaged-count-of-binary-quartic-orbits` | The averaged orbit count N(S; X) of binary quartic forms and the regions B(n, t, λ, X) |
| `averaging-formula-for-binary-quartic-forms` | Theorem 2.5: the averaging formula N(S; X) as an integral over N′A′Λ of lattice-point counts in B(n, t, λ, X) |
| `reducible-binary-quartic-forms-in-the-main-body` | Lemma 2.3: reducible integral binary quartic forms with a ≠ 0 in R_X(h·L^(i)) number O(X^{2/3+ε}) |
| `reducible-monic-binary-cubic-forms` | Lemma 2.22: reducible monic integral binary cubic forms of bounded height number O(X^{1/2+ε}) up to unipotent equivalence |
| `orbits-with-large-stabilizer-are-negligible` | Lemma 2.4: GL_2(ℤ)-orbits of binary quartic forms with stabiliser in GL_2(ℚ) of order > 2 number O(X^{3/4+ε}) |
| `binary-quartic-lattice-points-in-the-cusp` | Proposition 2.7: lattice points with a ≠ 0 in B(n, t, λ, X), and its version for translates of mV_ℤ |
| `averaging-over-the-fundamental-domain-and-cutting-the-cusp` | Averaging over the fundamental domain and cutting off the cusp: N(V_ℤ^(i); X) = Vol(R_X(L^(i)))/n_i + O(X^{3/4+ε}) |
| `jacobian-change-of-measure-for-binary-quartic-forms` | Proposition 2.8 (real case): dv = (1/27)·ω dI dJ under (g, I, J) ↦ g·p_{I,J} |
| `volume-of-the-fundamental-region-for-binary-quartic-forms` | The volumes Vol(R_X(L^(i))) = (16/135)ζ(2)X^{5/6} (i = 0, 2±) and (64/135)ζ(2)X^{5/6} (i = 1) |
| `count-of-binary-quartic-forms-of-bounded-height` | Theorem 2.1 (Theorem 1.6): the number of GL_2(ℤ)-classes of irreducible integral binary quartic forms of height < X |
| `eligible-invariant-pairs-of-bounded-height` | Lemma 2.9 and Proposition 2.10: eligible invariant pairs form 9 translates of 9ℤ × 27ℤ, and their number up to height X |
| `average-number-of-classes-per-eligible-invariant-pair` | Theorem 1.8: the average number of classes of binary quartic forms per eligible invariant pair |
| `binary-quartic-counts-with-finitely-many-congruence-conditions` | Theorem 2.11 and (27): counting binary quartic forms satisfying finitely many congruence conditions |
| `weighted-binary-quartic-counts-with-finitely-many-congruence-conditions` | Theorem 2.12: weighted counts of binary quartic forms with weights defined modulo finitely many prime powers |
| `uniformity-for-strongly-divisible-quartic-discriminants` | Theorem 2.18: forms in a homogeneously expanding region reducing into V(Δ, ∂Δ/∂e) modulo some p > M |
| `weakly-divisible-quartic-discriminants-via-ternary-pairs` | (37): N(W_p^(2)(V); X) = O(X/p^2) uniformly in p, through pairs of ternary quadratic forms |
| `uniformity-for-weakly-divisible-quartic-discriminants` | Theorem 2.20, corrected: forms with p^2 \| Δ and p ∤ ∂Δ/∂e in a homogeneously expanding region |
| `uniformity-estimate-for-infinitely-many-congruence-conditions` | Theorem 2.13: a uniform tail estimate for binary quartic forms whose discriminant is divisible by p^2 for some p > M |
| `squarefree-sieve-for-binary-quartic-forms` | Theorem 2.21: counting binary quartic forms weighted by an acceptable function defined by infinitely many congruence conditions |
| `real-orbits-and-stabilizers-of-binary-cubic-forms` | Real binary cubic forms: the two open GL_2(ℝ)-orbits and their stabilisers (n_0 = 6, n_1 = 2) |
| `stabilizers-of-irreducible-integral-binary-cubic-forms` | The GL_2(ℤ)-stabiliser of an irreducible integral binary cubic form is trivial or cyclic of order 3 |
| `reducible-binary-cubic-forms-in-the-main-body` | Lemma 21: reducible integral binary cubic forms with a ≠ 0 in R_X(v) number O(X^{3/4+ε}) |
| `binary-cubic-forms-with-cyclic-stabilizer` | Lemma 22: points with stabiliser C_3 are O(X^{3/4+ε}) |
| `invariant-measure-on-binary-cubic-forms` | Proposition 23, corrected: \|Disc(v)\|^{−1} dv is GL_2(ℝ)-invariant, with the Jacobian constant 4π |
| `averaged-count-of-binary-cubic-orbits` | The averaged orbit count N(S; X) of binary cubic forms and the regions B(n, t, λ, X) |
| `averaging-formula-for-binary-cubic-forms` | The averaging formula for binary cubic forms, (20)-(23), with the corrected constants |
| `binary-cubic-lattice-points-in-the-cusp` | Lemma 25 and (28): lattice points with a ≠ 0 in B(n, t, λ, X), for translates of mU_ℤ |
| `davenport-count-of-binary-cubic-forms` | Theorem 20 (Davenport): the number of GL_2(ℤ)-classes of irreducible integral binary cubic forms of bounded discriminant |
| `binary-cubic-counts-with-congruence-conditions` | Theorem 26 with (29)-(31): binary cubic forms in lattice translates, uniformly in the modulus |
| `index-p-switching-for-binary-cubic-forms` | Index-p switching: forms with p^2 \| a, p \| b come from forms of discriminant Disc/p^2 with a marked root modulo p |
| `uniformity-estimate-for-nonmaximal-binary-cubic-forms` | Proposition 29 (non-maximal part), for forms: the classes in W_p^DH have O(X/p^2) elements of discriminant < X, uniformly in p |
| `uniformity-estimate-for-binary-cubic-discriminants` | A uniform tail estimate for binary cubic forms whose discriminant is divisible by p^2 for some p > M |
| `sieve-to-acceptable-functions-for-binary-cubic-forms` | Counting binary cubic forms weighted by an acceptable function defined by infinitely many congruence conditions |

The six parent planets are retained: Geometric sieve, Averaging over fundamental domains, Count of binary quartic forms by height, Uniformity estimate, Squarefree sieve for binary quartic forms, and Davenport's count of binary cubic forms. This additive pass adds zero planets. Packaging can organize the layer into the three counting routes above without changing its id or approved inputs.

## Named target interfaces

Each new identifier has prefix `ArithmeticStatistics:ST.2/refinement-`, and its proposed declaration namespace is `ArithmeticCountingRefinement`. Statements include the parameter restrictions and constant dependencies. A target marked as conditional or a repair remains an obligation under its explicit hypotheses. The proof steps below end in actual imported nodes, baseline declarations, precise requested stages or the named gap register; they do not assert those gaps solved.

### Field-orbit counts and cubic secondary terms

#### Quartic pair counts with finite local conditions

Target `refinement-quartic-finite-congruence-count`; proposed name `ArithmeticCountingRefinement.quartic_finite_congruence_count`.

For integral pairs of ternary quadratic forms in a G_Z-invariant union S of finitely many residue classes, count absolutely irreducible orbits with 0<|Disc|<X in real signature i=0,1,2. Then N_i(S;X)=C_i X product_p mu_p(S)+o_S(X), with normalized coefficient Haar measures, C_i=zeta(2)^2 zeta(3)/(2 n_i) and (n_0,n_1,n_2)=(24,4,8). Absolutely irreducible means the quartic field has S4 closure. This is not an all-etale-orbit count.

**Construction or proof.** 1. Average the finite-cover fundamental domain with its stabilizer multiplicities. Use GN.4 on each congruence translate in the main body. 2. Use the source cusp/reducibility estimate, including Lemma 12; integrate the explicitly normalized discriminant volume. Finite congruence conditions do not change the discarded error.

**Direct inputs.** `ArithmeticStatistics:ST.1/pairs-of-ternary-quadratic-forms`, `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The density of discriminants of quartic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v162-n2-p10.pdf), Theorem 22 and (32), pp.1054–1055.

#### Quartic pairs above a reducible cubic resolvent

Target `refinement-quartic-fixed-reducible-resolvent`; proposed name `ArithmeticCountingRefinement.quartic_fixed_reducible_resolvent`.

For every epsilon>0 and every reducible cubic ring R with nonzero discriminant d, the number of quartic-pair orbits with resolvent R is O_epsilon(|d|^(1/4+epsilon)). The constant is independent of R. This is the corrected loss-bearing input for the parent large-stabilizer estimate, not an O(|d|^1/4) assertion.

**Construction or proof.** 1. The fixed-resolvent field count uses the squareclass/quadratic genus bound with an epsilon loss. 2. Sum quartic suborder counts by index and include cubic-resolvent multiplicity at nonprimitive content. Nakagawa/Baily inputs remain the explicitly named source gap.

**Direct inputs.** `ArithmeticStatistics:ST.1/quartic-ring-and-cubic-resolvent`, `ArithmeticStatistics:ST.1/existence-and-number-of-cubic-resolvents`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Retain epsilon in both the fixed-resolvent and induced X^(3/4+epsilon) bound. The zero-discriminant resolvent is excluded.

**Source.** [The density of discriminants of quartic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v162-n2-p10.pdf), Lemma 12 and proof, pp.1044–1046.

#### Quartic nonmaximal and overramified prime bound

Target `refinement-quartic-nonmaximal-overramified-tail`; proposed name `ArithmeticCountingRefinement.quartic_nonmaximal_overramified_tail`.

Let W_p be quartic pairs whose quartic ring is nonmaximal at p, or maximal with one of the overramified splitting types P^4, P^2, P1^2 P2^2 of §3.2. For absolutely irreducible S4 orbits, N_i(W_p;X)<=C X/p^2 uniformly in primes p and X>=1. Restricting to nonmaximal pairs also satisfies this bound.

**Construction or proof.** 1. For nonmaximal orders use the suborder index bound and sum the content factor sigma(n)/n^6. 2. For overramification use acceptable quadratic extensions of noncyclic cubic fields, square conductor norms, and the O(X) sum of their 2-class-group masses. The absolute convergence of sum 3^omega(m)/m^2 gives a p-independent constant.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quartic-finite-congruence-count`, `ArithmeticStatistics:ST.1/maximality-of-quartic-rings-at-p`, `ArithmeticStatistics:ST.1/existence-and-number-of-cubic-resolvents`.

**Acceptance.** State the S4 restriction and the exact W_p set. Do not infer the parent binary-quartic weak-discriminant bound for all irreducible resolvents without the separate transport and exceptional-orbit comparison.

**Source.** [The density of discriminants of quartic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v162-n2-p10.pdf), Proposition 23, pp.1056–1058.

#### Quintic counts with finite local conditions

Target `refinement-quintic-finite-congruence-count`; proposed name `ArithmeticCountingRefinement.quintic_finite_congruence_count`.

For G_Z-invariant finite congruence conditions S on integral quadruples of quinary alternating forms, count irreducible quintic-field orbits of signature i=0,1,2 and 0<|Disc|<X. Then N_i(S;X)=C_i X product_p mu_p(S)+o_S(X), where C_i=zeta(2)^2 zeta(3)^2 zeta(4)^2 zeta(5)/(2 n_i), (n_i)=(120,12,8). The same main term holds for S5 orbits.

**Construction or proof.** 1. Use the 40-dimensional finite-cover domain and lattice-translate volume m^-40. Integrate its 39-dimensional projection error. 2. Bound the reducible cusp by the coordinate-zero cases. Lemma 14 discards non-S5 orbits by finitely many splitting-type exclusions; do not identify Q-reducibility with non-S5.

**Direct inputs.** `ArithmeticStatistics:ST.1/quadruples-of-quinary-alternating-forms`, `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quintic-rings`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The density of discriminants of quintic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf), Theorems 17–18, §2.7, pp.1585–1587.

#### Uniform quintic nonmaximality estimate

Target `refinement-quintic-nonmaximal-tail`; proposed name `ArithmeticCountingRefinement.quintic_nonmaximal_tail`.

Let W_p be quadruples whose quintic ring is nonmaximal at p. For irreducible quintic-field orbits N_i(W_p;X)<=C X/p^2, with C independent of p and X>=1.

**Construction or proof.** 1. For index p^k use the local suborder bound O(p^min(2k−2,20k/11)), with its uniformity obligation. 2. A content-n ring has discriminant multiplied by n^8 and O(n^6) resolvents. Sum n^-2 and the local k-series uniformly in p. Brakenhoff’s suborder input is a recorded gap.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quintic-finite-congruence-count`, `ArithmeticStatistics:ST.1/maximality-of-quintic-rings-at-p`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The density of discriminants of quintic rings and fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf), Proposition 19, §3.1, pp.1587–1589.

#### Global-field finite-condition orbit count

Target `refinement-global-field-generic-finite-count`; proposed name `ArithmeticCountingRefinement.global_field_generic_finite_count`.

Fix a global field F, nonempty finite S containing all archimedean places, n in {2,3,4,5}, the representation G_n,V_n of Global Fields I, and local type sigma at S. For an arithmetic Gamma and invariant lattice L commensurable with G_n(O_S),V_n(O_S), respectively, generic lattice orbits in the discriminant region F(X)v_sigma have count vol_L(F(X)v_sigma)/|Aut(sigma)|+o(X). Finite lattice congruence conditions insert their normalized local measures.

**Construction or proof.** 1. Choose the S-arithmetic Siegel set and invariant bounded-height slice. Generic means the field/Galois-group condition in this representation, not merely nonzero discriminant. 2. Use the lattice estimate on a compact truncation, the coordinate cusp estimate and finite splitting-type sieve to discard nongeneric points. S-adic measure and reduction-theory interfaces are gap G-global.

**Direct inputs.** `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings`, `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quintic-rings`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/pdf/1512.03035v2), Theorems 4.6–4.7, §§4.4–4.7.

#### Global-field uniform tail estimate

Target `refinement-global-field-large-prime-tail`; proposed name `ArithmeticCountingRefinement.global_field_large_prime_tail`.

In the preceding fixed F,S,n,Gamma,L setting let W_p encode nonmaximal or more-than-minimally ramified rings at p outside S. Then sum_{N(p)>M} N(W_p;X)=O(X/(M log M))+o(X), for M>=2. The O constant is independent of M, and the negligible term can be chosen uniformly in M for the sieve conclusion.

**Construction or proof.** 1. Use the S-adic codimension-two geometric sieve for the strong locus. 2. For the weak locus pass by a prime-dependent rational group element to finitely many ideal-class lattices, lower discriminant by a constant times N(p)^2, and bound orbit fibres by 10. Sum prime ideal norm reciprocals squared. Ideal-class and character-positive local charts are input obligations.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-global-field-generic-finite-count`, `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/pdf/1512.03035v2), Theorem 5.2 and its proof, §5.

#### Global-field infinitely many local conditions

Target `refinement-global-field-large-local-count`; proposed name `ArithmeticCountingRefinement.global_field_large_local_count`.

For a Gamma-invariant large subset Z of L, with local compact factors Z_p of null boundary and containing every maximal minimally ramified ring at all sufficiently large p outside S, N(Z;X)=vol_L(F(X)v_sigma)/|Aut(sigma)| times product_{p notin S} vol(Z_p)+o(X). Use normalized local coefficient measures and the same generic orbits as the finite count.

**Construction or proof.** 1. First fix finitely many local conditions and apply the finite count. 2. The difference from all local conditions is bounded by the uniform tail; take X to infinity before M. Deduce convergence and the stated normalization, with zero products allowed.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-global-field-generic-finite-count`, `ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail`, `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Geometry-of-numbers methods over global fields I: Prehomogeneous vector spaces](https://arxiv.org/pdf/1512.03035v2), Theorem 5.1 and proof, §5.

#### Cubic secondary term on a lattice

Target `refinement-cubic-secondary-congruence-count`; proposed name `ArithmeticCountingRefinement.cubic_secondary_congruence_count`.

For a sublattice L of integral binary cubic forms of index T, containing m V_Z, write T=T1 T2 where the first coefficient projection has image T1 Z and T2 is the index in each remaining-coordinate fibre. If m^4<=X, then N_i(L;X/2,X)=c1_i X/(2T)+(1−2^(−5/6))c2_i X^(5/6)/(T1^(1/3) T2)+O(m X^(3/4)/T). Here c1=(pi^2/72,pi^2/24); c2 is the signed secondary coefficient of BST Theorem 6. The translated-lattice result has a separately computed c2(L+a), not this same coefficient.

**Construction or proof.** 1. Slice the averaged cusp by first coefficient, then smooth the arithmetic progression before summing its projection errors. 2. The secondary first-coordinate term scales by T1^(−1/3); the other coordinates scale by T2^-1. Keep the restriction m^4<=X and the error m/T. Full smoothing derivation is G-secondary rather than a reconstructed proof.

**Direct inputs.** `ArithmeticStatistics:ST.2/davenport-count-of-binary-cubic-forms`, `ArithmeticStatistics:ST.2/binary-cubic-counts-with-congruence-conditions`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [On the Davenport–Heilbronn theorems and second order terms](https://arxiv.org/pdf/1005.0672v3), Theorem 27 and Remark3, pp.19–20.

#### Cubic secondary-term sieve input

Target `refinement-cubic-secondary-sieve-error`; proposed name `ArithmeticCountingRefinement.cubic_secondary_sieve_error`.

For strongly acceptable cubic local specifications (eventually all orders, maximal orders, or maximal non-totally-ramified orders), the finite-lattice secondary terms and their sieve remainders combine into C1 X+C2 X^(5/6)+O_epsilon(X^(5/6−1/48+epsilon)). C1,C2 are the local mass and primitive index integral products of BST Theorem 7. This ST.2 input retains the convergent local coefficients; the Roberts field/class-group consequences remain the parent ST.3 targets.

**Construction or proof.** 1. Replace squarefree-index nonmaximal conditions by simple-root/double-root lattice counts at heights divided by k^2 l^4 m^4. 2. Split the modulus range, apply the secondary lattice estimate in the small range and the uniformity/switching estimates in the others. The complete optimization and local secondary coefficient calculation are G-secondary.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count`, `ArithmeticStatistics:ST.2/uniformity-estimate-for-nonmaximal-binary-cubic-forms`, `ArithmeticStatistics:ST.2/uniformity-estimate-for-binary-cubic-discriminants`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [On the Davenport–Heilbronn theorems and second order terms](https://arxiv.org/pdf/1005.0672v3), Theorem 7 pp.2–3; §8 switching identities (63)–(69), pp.25–27.

### Discriminant tails and fixed-modulus sieves

#### Nonzero square-divisor tails

Target `refinement-square-divisor-tail`; proposed name `ArithmeticCountingRefinement.squareDivisorTail`.

Given an integer-valued invariant Delta and real height H on a type A, T(Delta,H;M,X) consists of a with H(a)<X, Delta(a) nonzero, and an integer m>M, m>=1, squarefree, with m^2 dividing Delta(a). The multiplicity w_M(a) counts these m by filtering the natural divisors of |Delta(a)|. At Delta=0 define w_M=0. This finite multiplicity is the one used in summed tails; a union-tail bound alone does not bound it.

**Construction or proof.** 1. Use the finite positive divisor set of the nonzero invariant. Restrict its squarefree members by m>M and m^2 divisibility. The zero convention agrees with removal of the singular locus, not with the infinitely many actual square divisors of 0.

**Direct inputs.** `mathlib:Set.ncard`, `mathlib:Set.ncard_eq_toFinset_card`, `mathlib:Nat.divisors`, `mathlib:Squarefree`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Consumers.** BSW I Theorem 4.4 and BSW II Corollary 6.27; fixed-modulus inclusion–exclusion: Count multiplicity when truncating a Mobius series and remove zero discriminants before exchanging the modulus and point sums.

| API name | Role | Contract |
| --- | --- | --- |
| `ArithmeticCountingRefinement.squareDivisorTail` | constructor | Membership is exactly H(a)<X, Delta(a) nonzero, and existence of the indicated squarefree positive square divisor. |
| `ArithmeticCountingRefinement.squareDivisorMultiplicity` | projection | Return the finite filtered positive-divisor cardinal, with the deliberate value 0 at Delta=0. |
| `ArithmeticCountingRefinement.tail_iff_multiplicity_pos` | compatibility | For H(a)<X and Delta(a) nonzero, membership is equivalent to 0<w_M(a), whose natural cardinal equals the finite filtered-divisor count. |
| `ArithmeticCountingRefinement.tail_antitone` | relation | If M<=Mprime, T(Mprime,X) is contained in T(M,X) and w_Mprime(a)<=w_M(a). |

**Unit tests.**

- `ArithmeticCountingRefinement.tail_36_5`: For a singleton input with Delta=36, H=0, M=5,X=1, the tail is inhabited by m=6. Its multiplicity is exactly 1, since 6 is the only allowed modulus.
- `ArithmeticCountingRefinement.tail_unit_empty`: Delta=1 has empty tail for M>=1.
- `ArithmeticCountingRefinement.tail_zero_removed`: Delta=0 has empty tail and multiplicity 0, although every positive square divides 0.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Theorem 4.4 and (39), p.22; corrected nonzero domain.

#### Fixed-modulus acceptable coefficient weights

Target `refinement-kappa-acceptable`; proposed name `ArithmeticCountingRefinement.IsKappaAcceptable`.

For coordinate rank r, Delta:Z^r→Z and local factors phi_p:Z^r→[0,1], kappa-acceptability consists of residue dependence modulo p^kappa at every prime p and a threshold P such that phi_p(a)=1 whenever p>P and p^2 does not divide Delta(a). Infinite-product convergence and real signatures remain the parent congruence-function interface. Residue dependence is a quantitative addition, not a replacement of that interface.

**Construction or proof.** 1. Compare coordinates modulo p^kappa. Keep a single threshold valid for every coefficient vector. The modulus dependence is what controls the total small-modulus error.

**Direct inputs.** `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Consumers.** BSW I Theorem 4.1; BSW II Theorem 7.1: Retain residue-modulus growth when summing finite congruence errors. Exceptional primes can be included in the finite initial product.

| API name | Role | Contract |
| --- | --- | --- |
| `ArithmeticCountingRefinement.IsKappaAcceptable` | characterisation | The predicate is the conjunction of residue dependence, range [0,1], and eventual good-discriminant factor 1. |
| `ArithmeticCountingRefinement.kappa_good_prime` | projection | An acceptable family has a threshold P with phi_p(a)=1 for every prime p>P with p^2 not dividing Delta(a). |
| `ArithmeticCountingRefinement.kappa_finite_product_residue` | compatibility | For a finite set of distinct primes, the product factors through the coefficient residue modulo their product to the kappa power. This is compatible with the parent finite congruence function. |

**Unit tests.**

- `ArithmeticCountingRefinement.kappa_all_one`: The all-one factor family is acceptable with kappa=0.
- `ArithmeticCountingRefinement.kappa_parity`: The factor testing evenness of the only coordinate at p=2, and 1 otherwise, is acceptable with kappa=1 and Delta=1.
- `ArithmeticCountingRefinement.kappa_zero_nonexample`: The same nonconstant parity factor is not acceptable with kappa=0, since modulus 1 identifies every coefficient vector.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Definition preceding Theorem 4.1, p.20.

#### Weighted-box rational-root count

Target `refinement-monic-rational-root-bound`; proposed name `ArithmeticCountingRefinement.monic_rational_root_bound`.

For monic degree n>=2 integer polynomials with |a_i|<X^i and X>=2, the number with a rational root is O_n(X^(D−n+1) log X), D=n(n+1)/2.

**Construction or proof.** 1. A rational root is integral and divides the constant term. Handle constant term0 separately. 2. Sum divisor multiplicities over all nonzero constant terms: the needed fact is the average sum_{k<=Y} d(k)=O(Y log Y), not the false pointwise bound d(k)=O(log Y). Solve the penultimate coefficient once the other coefficients and root are fixed.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-one-matrix-slice`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Lemma 4.2, p.21.

#### Non-generic distinguished monic forms

Target `refinement-monic-extra-reducible-bound`; proposed name `ArithmeticCountingRefinement.monic_extra_reducible_bound`.

Let V_n^red be the union of monic polynomials reducible over Q and, for even n>=4, products of two conjugate factors over a quadratic extension. In the weighted box, its size is O_n(X^(D−n+1) log X) for n>=2,n!=4; for n=4 the source argument supplies O_epsilon(X^(22/3+epsilon)).

**Construction or proof.** 1. Separate the rational-root case and other proper Galois-group subgroups. 2. Use a correctly normalized quantitative non-full-Galois-group estimate. For conjugate quadratic factors at n=4 the subgroup index can be3, giving22/3, which still suffices for the tail. The general weighted-box sieve input is requested, not supplied by qualitative Hilbert irreducibility.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-monic-rational-root-bound`, `SieveMethodsAndPrimePatterns:SV.2`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics. At degree 2 the exceptional locus contains only Q-reducible polynomials; quadratic conjugate factors are included only for even degrees at least4.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Proposition 4.3, pp.21–22, with routed correction E7.

#### Distinguished matrices outside the deepest block

Target `refinement-monic-distinguished-off-block`; proposed name `ArithmeticCountingRefinement.monic_distinguished_off_block`.

For the odd/even split orthogonal slices of ST.1, n>=3, an averaged torus count over a fixed bounded fundamental slice of distinguished nonzero-discriminant matrices outside W00 is O_epsilon(X^(D−1/5+epsilon)). W00 has entries b_ij=0 for i+j<n. Use the source integral lattices (half-integral odd and quarter-integral even), not an all-integral symmetric-matrix substitute.

**Construction or proof.** 1. Separate b11=0 (O_epsilon X^(D−1+epsilon)) from b11 nonzero. The latter distinguished locus avoids a uniformly positive fraction of good-prime classes. 2. Establish remainder r_d=O_epsilon(X^(D−1)d^(1+epsilon)) and apply the requested multidimensional Selberg sieve; balance X^D L^(−1/2+epsilon)+X^(D−1)L^(2+epsilon) at L=X^(2/5).

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-one-matrix-slice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`, `SieveMethodsAndPrimePatterns:SV.2`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Propositions 2.5–2.6 and 3.4–3.5, §§2.3 and 3.3.

#### Marked-Q cusp bound

Target `refinement-monic-q-cusp-tail`; proposed name `ArithmeticCountingRefinement.monic_q_cusp_tail`.

In the deepest block W00 of the same orthogonal-slice averaged count, nonzero-discriminant matrices with |Q|>M contribute O_n(X^D log X/M) for odd n and O_n(X^D(log X)^2/M) for even n, X>=2,M>=1. The Q character is product_{i=1}^g s_i^(−i) in both cases.

**Construction or proof.** 1. A nonzero determinant forces a lattice point only when each necessary coordinate interval has length at least its lattice spacing. 2. Insert a largest-index coordinate factor and the correct Q torus weight; integrate the restricted torus ranges. The even torus density has final exponent −g(g+1)/2 and two possible logarithmic ranges.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-marked-q`, `ArithmeticStatistics:ST.1/refinement-q-discriminant-divisibility`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Propositions 2.7 and 3.6, §§2.4 and 3.4; (36) corrected by routed E3.

#### Strong-divisibility weighted-box tail

Target `refinement-monic-strong-tail`; proposed name `ArithmeticCountingRefinement.monic_strong_tail`.

For n>=2, D=n(n+1)/2, X>=2,M>=1, the union of monic weighted-box polynomials strongly p^2-divisible for every p dividing some squarefree m>M has size O_{n,epsilon}(X^(D+epsilon)/M+X^(D−1)).

**Construction or proof.** 1. The strong locus lies on a fixed codimension-two reduction scheme. 2. Adapt the geometric sieve to sides X,X^2,...,X^n by slicing; control the shorter faces separately. The isotropic BSW geometric-sieve theorem alone does not establish this anisotropic estimate.

**Direct inputs.** `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Theorem 1.5(a), pp.3–4; §4 weighted geometric sieve.

#### Weak-divisibility weighted-box tail

Target `refinement-monic-weak-tail`; proposed name `ArithmeticCountingRefinement.monic_weak_tail`.

For n>=3 the corresponding weak-every-prime union has size O_{n,epsilon}(X^(D+epsilon)/M+X^(D−1/5+epsilon)). Only odd squarefree m have a nonempty weak locus. The zero-discriminant locus can appear in the union convention; the summed tail removes it.

**Construction or proof.** 1. Lift weak forms to marked distinguished slices with preserved invariant and marked |Q|=m. 2. Use the off-block and Q-cusp bounds. Include the corrected non-generic quartic contribution, and do not discard even lift flag/ruling obligations from ST.1.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-weak-lift-odd`, `ArithmeticStatistics:ST.1/refinement-even-weak-lift`, `ArithmeticStatistics:ST.2/refinement-monic-distinguished-off-block`, `ArithmeticStatistics:ST.2/refinement-monic-q-cusp-tail`, `ArithmeticStatistics:ST.2/refinement-monic-extra-reducible-bound`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Theorem 1.5(b); §§2–4.

#### Summed monic square-divisor tail

Target `refinement-monic-summed-tail`; proposed name `ArithmeticCountingRefinement.monic_summed_tail`.

For every n>=2 and epsilon>0, the sum over squarefree m>M of # {monic weighted-box f : Delta(f) nonzero, m^2 divides Delta(f)} is O_{n,epsilon}(X^(D+epsilon)/sqrt(M)+X^(D−1/5+epsilon)), for X>=2,M>=1.

**Construction or proof.** 1. Factor the squarefree m into strong and weak parts; one exceeds sqrt(M). Sum nonzero-invariant divisor multiplicities with an epsilon loss. 2. Use dyadic ranges and uniform strong/weak estimates, plus a separate degree 2 weak construction. Nonzero Delta bounds m and makes the exchange of sums finite. The special degree 2 input is G-quadratic.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-square-divisor-tail`, `ArithmeticStatistics:ST.2/refinement-monic-strong-tail`, `ArithmeticStatistics:ST.2/refinement-monic-weak-tail`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Theorem 4.4, (39), p.22, with routed E13.

#### Fixed-modulus monic discriminant sieve

Target `refinement-monic-fixed-modulus-sieve`; proposed name `ArithmeticCountingRefinement.monic_fixed_modulus_sieve`.

Let n>=2,kappa>=1, Sigma_p residue conditions modulo p^kappa be acceptable, and Sigma_infinity a nonempty collection of permitted real root types. Then the count in the weighted box equals vol(Sigma_infinity∩{H<1}) product_p vol(Sigma_p) X^D + O_{n,kappa,epsilon}(X^(D−min(1/5,1/(2kappa))+epsilon)). The infinite product and singular-locus removal are included in the assertion.

**Construction or proof.** 1. Use Mobius truncation only on Delta nonzero and CRT for the small squarefree moduli. Bound Delta=0 by O(X^(D−1)). 2. The congruence remainder is a sum of theta_bar(m)m^kappa X^(D−1), bounded by O_epsilon(X^(D−1/kappa+epsilon)); combine with the summed tail. The displayed source middle exponent D−n is not used.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-kappa-acceptable`, `ArithmeticStatistics:ST.2/refinement-monic-summed-tail`, `ArithmeticStatistics:ST.2/local-density-of-values-divisible-by-p-squared`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), Theorem 4.1, (41), pp.20–23, corrected routed E6 andE13.

#### Invariant-polynomial geometric sieve criterion

Target `refinement-invariant-geometric-sieve-criterion`; proposed name `ArithmeticCountingRefinement.invariant_geometric_sieve_criterion`.

Let an integral representation G,V of dimension r have a primitive relative invariant polynomial f of degree d, geometrically squarefree, a density-one generic coefficient locus with uniformly bounded geometric stabilizers, and a continuous homogeneous degree-d G^1-invariant height. Assume finite-volume fundamental domains F_X=X^(1/d)F_1 and finite-congruence main terms at scale X^(r/d). For each weakly p^2-divisible generic v assume a rational group move lowering height by p^a, landing modulo p in Y_k of codimension k with boundedly many orbit preimages, where k is bounded, a>=0, and (r/d)a+k−1>=eta>0. Then coefficient boxes have squarefree density product_p(1−c_p/p^(2r)), with c_p counting p^2-zero residues. The original six hypotheses, including bounded k and generic-locus density, are all required.

**Construction or proof.** 1. Strong divisibility is handled by the codimension-two sieve; split the weak cases by k and apply the height-lowering map. 2. The positive eta makes the large-prime tail negligible after compact truncation. Take the height limit before prime truncation; do not assert this for arbitrary multivariate polynomials. The representation-specific six-hypothesis checks remain a gap. 3. For the coefficient-box conclusion approximate the box by finitely many translated height domains, then take the prime threshold, compact truncation and cover-size limits in that order. Use c_p/p^(2r), correcting (40)–(44).

**Direct inputs.** `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The geometric sieve and the density of squarefree values of invariant polynomials](https://arxiv.org/pdf/1402.0031), Theorem 2.1 pp.8–9; complete proof §3.4 pp.14–17.

#### Equal-coefficient binary-form strong tail

Target `refinement-binary-strong-tail`; proposed name `ArithmeticCountingRefinement.binary_strong_tail`.

For degree n>=3 integral binary forms with coefficient sup norm<X, the strong-every-prime union over squarefree m>M is O_{n,epsilon}(X^(n+1+epsilon)/M+X^n). Use the universal fixed-degree binary discriminant even when the leading coefficient vanishes.

**Construction or proof.** 1. Apply the geometric sieve on the coefficient cube to the codimension-two strong locus; control boundary faces. 2. The discriminant specializes as a homogeneous degree 2n−2 polynomial on n+1 coefficients, not the lowered-degree univariate discriminant.

**Direct inputs.** `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`, `ArithmeticStatistics:ST.1/refinement-binary-discriminant`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem 5(a), pp.3–4.

#### Odd-degree binary-form cusp count

Target `refinement-odd-binary-cusp-count`; proposed name `ArithmeticCountingRefinement.odd_binary_cusp_count`.

Let n=2g+1>=3,Y=X^(1/n), the ST.1 marked symmetric-pencil lift and fixed bounded slice be used, with torus s_i=(t_i/t_(i+1))^(1/n) and density product_i s_i^(−n i(n−i)). The averaged main body is O_epsilon(X^(n+1−1/(2n)+epsilon)), the shallow cusp O(X^(n+1−1/n)), and the deep cusp with |Q|>M is O_epsilon(X^(n+1+epsilon)/M). Main, shallow and deep mean respectively a11 interval length>=1, a11 shorter with some entry of the upper g-block nonzero, and the whole upper g-block zero.

**Construction or proof.** 1. Use weights t_i^-1 t_j^-1 for both symmetric matrices, and Q character product_{i<=g} t_i^-1. 2. Count the main-body projections, separate the shallow coordinate-zero cases, and integrate deep-cusp lattices with Q>M. These estimates concern the selected generic lift locus and its averaging integral.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-weak-lift-odd`, `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §4 (14)–(17), Propositions 4.4,4.5,4.8, pp.16–23.

#### Odd-degree binary-form weak tail

Target `refinement-odd-binary-weak-tail`; proposed name `ArithmeticCountingRefinement.odd_binary_weak_tail`.

For odd n>=3, the weak-every-prime coefficient-box union over squarefree m>M has size O_{n,epsilon}(X^(n+1+epsilon)/M+X^(n+1−1/(2n)+epsilon)). Its nonempty weak moduli are odd.

**Construction or proof.** 1. Transfer weak forms into marked pencils with Q=m and bounded orbit fibres using the ST.1 lift. 2. Use all three cusp estimates and an explicit quantitative nongeneric exclusion. Keep the ambient SL_n pencil representation separate from the orthogonal monic slice.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-odd-binary-cusp-count`, `ArithmeticStatistics:ST.1/refinement-weak-lift-odd`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem 5(b), pp.3–4; Proposition 4.2 and §4.

#### Even-degree small-discriminant exclusion

Target `refinement-even-binary-small-discriminant`; proposed name `ArithmeticCountingRefinement.even_binary_small_discriminant`.

For even n>=4 and 0<kappa<1, degree-n coefficient-box forms with |Delta(f)|<=H(f)^(2n−2−kappa) have size O_n(X^(n+1−kappa/(2n−2))). In the weak-lift argument also discard forms with |f(0,1)|<H(f)^(1−kappa/(2n−2)); their elementary coefficient-box count is O_n(X^(n+1−kappa/(2n−2))).

**Construction or proof.** 1. Control small discriminant by its polynomial sublevel estimate and coordinate slices. 2. For the added small constant-term exclusion count that coordinate directly. Work in dyadic height intervals so the two lower bounds yield a normalized lifted discriminant at scale X.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-binary-discriminant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics. Use the small positive kappa range; count each integer slice with its boundary term and dyadic height windows.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Lemma 6.1, p.25; correction to Lemma 6.25, p.44.

#### Weak moduli meeting the constant term

Target `refinement-even-binary-constant-term-tail`; proposed name `ArithmeticCountingRefinement.even_binary_constant_term_tail`.

For even n>=4, X>=2,M>=1, let W_m^(1#) be coefficient vectors whose binary discriminant is weakly p^2-divisible at every p dividing an odd squarefree m, and for which m divides f(0,1). Then #union_{m>sqrt(M)}{f in W_m^(1#):H(f)<X}=O_n(X^(n+1)/sqrt(M)+X^n). In reducing a weak modulus m>M, factor m into the primes dividing f(0,1) and the primes coprime to it; one factor exceeds sqrt(M). Merely sharing one small prime with f(0,1) is not the W_m^(1#) hypothesis.

**Construction or proof.** 1. For each prime dividing m, weak discriminant divisibility together with p|f(0,1) forces the extra coefficient reduction into a fixed codimension-two locus. Apply the quantitative geometric sieve to the modulus factor all of whose primes divide the constant term. 2. Factor the original weak squarefree modulus into its constant-term and coprime parts before taking the sqrt(M) threshold. Do not apply this tail to all moduli with a nontrivial gcd.

**Direct inputs.** `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`, `ArithmeticStatistics:ST.2/refinement-binary-strong-tail`, `ArithmeticStatistics:ST.1/refinement-even-weak-lift`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Lemma 6.2, pp.25–26.

#### Even-degree main and shallow pencil counts

Target `refinement-even-binary-main-shallow`; proposed name `ArithmeticCountingRefinement.even_binary_main_shallow`.

For even n>=4 in the (n+1)-dimensional symmetric-pencil lift, the main-body estimate is O_epsilon(X^(n+1−theta_n+epsilon)), theta_n=min(1/(4n),(n−2)/(2n^2+2n+2)). In the shallow cusp the selected L(M) with M>X^eta has contribution O(X^(n+1−min(eta,1)/(22 n^6))) for eta>0. The formulas give theta_4=1/21 and theta_n=1/(4n) for even n>=6.

**Construction or proof.** 1. The two main-body alternatives yield two savings, whose minimum must be retained; the smaller n=4 value is not1/16. 2. In the shallow cusp count actual nondegenerate matrices by their saturated row lattices and retain the paired upper-block constraints. Generic symmetric-rank estimates and lattice height comparisons are supplier inputs, not new generic lattice nodes.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-even-weak-lift`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorems 6.6 and 6.11, pp.29–35, with routed main-body exponent correction.

#### Restricted deep-cusp Gram lower bound

Target `refinement-even-binary-restricted-gram`; proposed name `ArithmeticCountingRefinement.even_binary_restricted_gram`.

Repair target: n=2g+2>=4, 0<kappa<1,kappa_double=kappa n/(n−1),Y=X^(1/(n+1)); retain generic weak-lift forms in a dyadic box with |Delta(f)|>H(f)^(2n−2−kappa) and |f(0,1)|>=H(f)^(1−kappa/(2n−2)). For the actual paired (A,B) in its deep cusp, the relevant row-vector Gram determinant must be >=c Y^(2g+2) X^(−2 kappa_double). This statement concerns L_good(M); it is an open corrected target, not the published unrestricted Lemma 6.25.

**Construction or proof.** 1. Use Delta(x f)=Delta(f) f(0,1)^2, degree 2n(n+1) in pencil entries, and Y scaling to obtain |Delta(Y^-1 A,Y^-1 B)|>=c X^(−kappa_double). 2. Prove discriminant membership in the maximal-minor determinantal ideal and a bounded-real Cauchy–Binet estimate |Delta|<=C sqrt(Gram). The printed product-divisibility inference is not valid. Retain block constraints only for the actual B paired with A.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-even-weak-lift`, `ArithmeticStatistics:ST.2/refinement-even-binary-small-discriminant`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** Verify the factor 2 in the Gram exponent. Supply the determinantal ideal argument and count restricted fibres before certifying this target.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Lemma 6.25, p.44; routed E2,E3,E18.

#### Restricted deep-cusp counting repair

Target `refinement-even-binary-restricted-deep-tail`; proposed name `ArithmeticCountingRefinement.even_binary_restricted_deep_tail`.

Conditional on the restricted Gram lower bound and the actual paired-fibre lattice count, the even-degree L_good(M) deep-cusp contribution is O_n(X^(n+1+kappa_double)(log X)^(2n)/M). The unconditional height inequality used is |q|<=C Y^((g+1)(g+2)) product_i L_i/sqrt(Gram); inserting the lower bound gives C Y^((g+1)^2) X^kappa_double product_i L_i. No bound on the original unrestricted L(M) is asserted.

**Construction or proof.** 1. Enumerate saturated row lattices and successive-minimum ranges while keeping the top-block-zero conditions on actual paired matrices. 2. Sum the q-height bound over the restricted fibres and dyadic ranges. A final epsilon or strictly smaller saving is needed to absorb log^(2n)X; endpoint absorption is invalid.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-gram`, `ArithmeticStatistics:ST.1/refinement-marked-q`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem 6.24 and Proposition 6.26, pp.44–48; routed E3,E18.

#### Binary-form summed discriminant tail

Target `refinement-binary-summed-tail`; proposed name `ArithmeticCountingRefinement.binary_summed_tail`.

For odd n>=3 and epsilon>0, the sum over squarefree m>M of the coefficient-box counts with nonzero Delta and m^2 dividing Delta is O_{n,epsilon}(X^(n+1+epsilon)/sqrt(M)+X^(n+1−1/(2n)+epsilon)). For even n>=4 the target is existence of positive delta,eta and xi>=0 with 3(eta+xi)<1 and (6n+3)(eta+xi)<n+1, and a bound O_{n,epsilon}(X^(n+1+xi+epsilon)/M^delta+X^(n+1−eta+epsilon)). The even clause is conditional on the restricted deep-cusp repair and a quantitative non-Sn coefficient-box exclusion; no published numerical endpoint is certified.

**Construction or proof.** 1. Split a squarefree modulus into its strong and weak factors; control the total divisor multiplicity on the nonzero locus. 2. Use the odd tail directly. In the even case balance repaired deep, shallow, small-discriminant, small-constant-term and non-Sn terms with slack. The selected parameter inequalities make the three terms in Theorem 7.1 subleading.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-square-divisor-tail`, `ArithmeticStatistics:ST.2/refinement-binary-strong-tail`, `ArithmeticStatistics:ST.2/refinement-odd-binary-weak-tail`, `ArithmeticStatistics:ST.2/refinement-even-binary-constant-term-tail`, `ArithmeticStatistics:ST.2/refinement-even-binary-main-shallow`, `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-deep-tail`, `SieveMethodsAndPrimePatterns:SV.2`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Corollary 6.27, pp.48–49, with routed E3,E7,E18.

#### Binary-quadratic nonzero tail

Target `refinement-quadratic-binary-summed-tail`; proposed name `ArithmeticCountingRefinement.quadratic_binary_summed_tail`.

For n=2, Delta(a0,a1,a2)=a1^2−4a0 a2 in a coefficient box of side X>=2, the summed squarefree-modulus tail over m>M on Delta nonzero is O_epsilon(X^(3+epsilon)/M); the Delta=0 count is O(X^2). This is independent of the n>=3 pencil argument.

**Construction or proof.** 1. For each fixed nonzero Delta=N, fix a1 and count divisors of (a1^2−N)/4, obtaining O_epsilon(X^(1+epsilon)); handle at most two a1 with a1^2=N. 2. Write N=m^2 k with 0<|k|<=C X^2/m^2 and sum m>M. Count the zero locus separately by solving for a2 when a0 nonzero and treating a0=0.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-square-divisor-tail`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Degree2 boundary of Theorem 7.1; routed E8.

#### Binary coefficient-box squarefree sieve

Target `refinement-binary-fixed-modulus-sieve`; proposed name `ArithmeticCountingRefinement.binary_fixed_modulus_sieve`.

Let n>=2, impose a fixed finite initial modulus N^2 and require p^2 not dividing Delta at every prime, including p|N. If the normalized finite residue count is nu_N and the other prime good densities are alpha_n(p), the nonzero-discriminant count has main coefficient nu_N product_{p not dividing N} alpha_n(p) times the real-box volume X^(n+1). For n>=3 a tail with parameters eta,xi yields error O_epsilon(X^(n+1−eta+epsilon)+N^2 X^(n+3(eta+xi)+epsilon)+N^(2n+2) X^((6n+3)(eta+xi)+epsilon)). Odd n uses eta=1/(2n),xi=0. The even conclusion remains conditional on the repaired tail; n=2 requires the separate finite-modulus truncation.

**Construction or proof.** 1. Build the initial residue set so it already contains the squarefree restrictions at p|N, then use Mobius sums only for m coprime to N. 2. Compare finite-modulus lattice errors and nonzero summed tails. Products and main coefficients are ST.0 local-data inputs; Appendix local-density formulas are not reproved here.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-binary-summed-tail`, `ArithmeticStatistics:ST.2/refinement-quadratic-binary-summed-tail`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Theorem 7.1, pp.49–51; routed endpoint and degree 2 corrections.

### Pencils and genus-one counting inputs

#### Even-pencil finite congruence count

Target `refinement-pencil-finite-congruence-count`; proposed name `ArithmeticCountingRefinement.pencil_finite_congruence_count`.

Let even n>=4, G=SL_n/mu_2 and V pairs of symmetric bilinear forms, with BGW invariant height H(f)=max absolute coefficient. For a real component V^(m,r) and a G_Z-invariant set S defined by finitely many congruence conditions, N(S∩V^(m,r);X)=c_(m,r) X^(n+1) product_p nu_p(S)+o_S(X^(n+1)). N counts G_Z-orbits with Delta nonzero; BGW calls that irreducible, without requiring f Q-irreducible. c_(m,r)=vol(F_(m,r)∩{H<1}) uses coefficient Euclidean measure.

**Construction or proof.** 1. Choose the real component section and finite-cover domain with the central quotient scheme; a quotient of rational point groups alone is insufficient. 2. Discard the source nongeneric cusp contribution, apply the lattice estimate to finite congruence translates, and scale by X^(1/n) in the pencil entries. The needed native group/domain interfaces remain explicit.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem 36, §§10–11, pp.29–31.

#### Pencil upper bound for infinite weights

Target `refinement-pencil-infinite-weight-upper-bound`; proposed name `ArithmeticCountingRefinement.pencil_infinite_weight_upper_bound`.

Let phi be a G_Z-invariant BGW congruence-defined weight with factors in [0,1], locally constant off closed null sets, convergent product, and each local integral nonzero. For a finite-congruence S in V^(m,r), limsup_{X→infinity} N_phi(S;X)/X^(n+1)<=c_(m,r) product_p integral_{closure(S)_p} phi_p. Equivalently use an upper estimate by that main term plus o(X^(n+1)). This is an upper bound, and contains no equality assertion.

**Construction or proof.** 1. For a fixed finite prime set the full weight is at most its truncated product. Apply the finite weighted count. 2. Take the height limsup first and then the decreasing finite-prime integrals. No tail equality is used; every local integral is nonzero but the infinite product can still vanish.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count`, `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`.

**Acceptance.** No equality is inferred from acceptability or positivity of individual factors. The order of height and prime limits is explicit.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Definition 37 and Theorem 38, pp.31–32.

#### Codimension-two coefficient-family tail

Target `refinement-large-coefficient-family-tail`; proposed name `ArithmeticCountingRefinement.large_coefficient_family_tail`.

Let a coefficient family F⊂Z^(n+1) have local complements, outside finitely many primes, contained in the reduction of a fixed closed subscheme S0⊂A_Z^(n+1) of codimension at least2. For M beyond those exceptional primes, the number of vectors with H(f)<X failing F_p at some p>M is O_F(X^(n+1)/M+X^n). This is a coefficient-vector tail, not a symmetric-pencil orbit tail.

**Construction or proof.** 1. Embed every bad reduction into the fixed codimension-two envelope and apply the geometric sieve to the coefficient cube. 2. Enlarge the constant for the finitely many exceptional primes if a statement for every M>=1 is needed. Do not substitute this coefficient count for the orbit-tail repair.

**Direct inputs.** `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Definition 39 and Proposition 42, pp.32–33.

#### Ternary-cubic finite-condition count

Target `refinement-ternary-cubic-finite-count`; proposed name `ArithmeticCountingRefinement.ternary_cubic_finite_count`.

For SL3(Z)-orbits of strongly irreducible integral ternary cubics, H=max(|I|^3,J^2/4), Delta=(4I^3−J^2)/27 and S finite congruence conditions, N_+(S;X)=(32/45)zeta(2)zeta(3) X^(5/6) product_p mu_p(S)+o(X^(5/6)), and N_− has coefficient128/45. Strong irreducibility excludes a rational flex; it is stronger than polynomial irreducibility. I,J can have denominators 16,32 in these coordinates.

**Construction or proof.** 1. Use the SL3 finite-cover domain, normalized Jacobian and strongly irreducible cusp estimate. 2. Count finite congruence translates and retain the rational invariant lattice instead of rounding to integral I,J. Integral Selmer minimization is a separate ST.1 obligation.

**Direct inputs.** `ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants`, `ArithmeticStatistics:ST.1/invariance-of-ternary-cubic-invariants`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2), Theorem 8 pp.2–3; finite congruence Theorems 18–19 in §2.

#### Ternary-cubic discriminant tail

Target `refinement-ternary-cubic-prime-tail`; proposed name `ArithmeticCountingRefinement.ternary_cubic_prime_tail`.

For W_p={f:p^2 divides Delta(f)}, every truncation epsilon>0 admits constants C_epsilon,C such that N_±(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(3/4))+C epsilon X^(5/6), for X,M>=2, on strongly irreducible orbits. The final epsilon is a compact-domain truncation error, not a loss in an exponent.

**Construction or proof.** 1. On a compact fundamental-domain truncation apply the geometric sieve to the strong locus; the cusp contributes C epsilon X^(5/6). 2. Use the discriminant-preserving weak-to-strong map with at most3 orbit preimages. Treat the finite bad primes separately.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count`, `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2), Proposition 25 and Lemma 26, §2.7, pp.13–14.

#### Ternary-cubic acceptable-weight count

Target `refinement-ternary-cubic-acceptable-count`; proposed name `ArithmeticCountingRefinement.ternary_cubic_acceptable_count`.

For an acceptable invariant congruence-defined weight phi in [0,1], N_phi(V_Z^±;X)=N(V_Z^±;X) product_p integral phi_p+o(X^(5/6)). The local Haar measures give the full coefficient lattice mass 1, and the counted orbits are strongly irreducible.

**Construction or proof.** 1. Prove the finite-weight identity, approximating locally constant-off-null-set factors by residue steps. 2. The uniform prime tail bounds the full-versus-finite weights; take X first, then M, then the compact truncation epsilon to0.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count`, `ArithmeticStatistics:ST.2/refinement-ternary-cubic-prime-tail`, `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Ternary cubic forms having bounded invariants, and the existence of a positive proportion of elliptic curves having rank 0](https://arxiv.org/pdf/1007.0052v2), Theorem 24, §2.7, p.13.

#### Quaternary-pair finite-condition count

Target `refinement-quaternary-finite-count`; proposed name `ArithmeticCountingRefinement.quaternary_finite_count`.

For the determinant-kernel central-quotient group G of BS4 on pairs of integral quaternary quadratic forms and a real type i in {0#,1,2}, strongly irreducible finite-congruence counts satisfy N_i(S;X)=|J| vol(G_Z\G_R) N_inv^(sign i)(X) product_p mu_p(S)/n_i+o(X^(5/6)), with n_1=4,n_0#=n_2=8, N_inv^+(X)=(8/5)X^(5/6)+O(X^(1/2)), N_inv^−(X)=(32/5)X^(5/6)+O(X^(1/2)). Strong irreducibility means the binary-quartic resolvent has no rational root.

**Construction or proof.** 1. Use the integral half-Gram convention and the correct determinant character/central quotient, distinct from BGW SL4/mu2. 2. Integrate the Jacobian and real stabilizer multiplicity, discard strongly irreducible cusp exceptions and insert finite residue densities.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes`, `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1), Theorem 10; §3.3 (17), pp.13–14; Theorems 19–20.

#### Quaternary-pair discriminant tail

Target `refinement-quaternary-prime-tail`; proposed name `ArithmeticCountingRefinement.quaternary_prime_tail`.

For W_p={v:p^2 divides Delta(v)}, strongly irreducible real-type-i orbit counts satisfy N_i(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(19/24))+C epsilon X^(5/6), for each epsilon>0 and X,M>=2.

**Construction or proof.** 1. Compact truncation of the 20-dimensional height slice gives the strong term and projection exponent19/24. 2. For p>2 move weakly divisible pairs to strongly divisible pairs without changing discriminant, with at most2 orbit preimages. Include p=2 in the finite initial conditions.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quaternary-finite-count`, `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1), Theorem 23, §3.5, pp.16–17.

#### Quaternary-pair acceptable-weight count

Target `refinement-quaternary-acceptable-count`; proposed name `ArithmeticCountingRefinement.quaternary_acceptable_count`.

For an acceptable invariant congruence-defined phi in [0,1], the strongly irreducible BS4 count N_phi(V_Z^(i);X)=N(V_Z^(i);X) product_p integral phi_p+o(X^(5/6)).

**Construction or proof.** 1. Apply finite-weight counts with their actual G and half-Gram coefficient lattice. 2. Use the tail with the limits X, then M, then epsilon. The exact-order-four Selmer interpretation belongs to ST.1/ST.5, not this coefficient theorem.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quaternary-finite-count`, `ArithmeticStatistics:ST.2/refinement-quaternary-prime-tail`, `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average number of elements in the 4-Selmer groups of elliptic curves is 7](https://arxiv.org/pdf/1312.7333v1), Theorem 22, §3.5, p.16.

#### Degree-five genus-one finite-condition count

Target `refinement-quinary-finite-count`; proposed name `ArithmeticCountingRefinement.quinary_finite_count`.

For the BS5 representation 5 tensor exterior^2(5), of dimension 50, and its determinant-constrained central-quotient group, strongly irreducible orbit counts of sign ± with finite congruence S equal |J| vol(G_Z\G_R) N_inv^±(X) product_p mu_p(S)+o(X^(5/6)); N_inv^+=(8/5)X^(5/6)+O(X^(1/2)), N_inv^−=(32/5)X^(5/6)+O(X^(1/2)). Strong irreducibility excludes the trivial degree-five covering. This is not the 40-dimensional quintic-ring representation.

**Construction or proof.** 1. Use the 50-dimensional height slice, Jacobian J and real stabilizers. Proposition 18 controls the a12=0 strongly irreducible cusp by O(X^(499/600)). 2. Proposition 22 discards non-strongly-irreducible main-body points using prime local exclusions; these have size proportional to1/p, so prime harmonic divergence rather than a constant-density sieve is needed.

**Direct inputs.** `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average size of the 5-Selmer group of elliptic curves is 6](https://arxiv.org/pdf/1312.7859v1), Theorem 12 and Theorems 25–26, §§3.1–3.5.

#### Degree-five genus-one discriminant tail

Target `refinement-quinary-prime-tail`; proposed name `ArithmeticCountingRefinement.quinary_prime_tail`.

The BS5 strongly irreducible counts have N_±(union_{p>M} W_p;X)<=C_epsilon(X^(5/6)/(M log M)+X^(49/60))+C epsilon X^(5/6), for W_p={v:p^2 divides Delta(v)}, epsilon>0 and X,M>=2.

**Construction or proof.** 1. Apply the strong geometric sieve on the compact 50-dimensional slice, giving projection exponent49/60. 2. Use the discriminant-preserving weak-to-strong transformation with at most2 orbit preimages. Retain the strongly irreducible restriction in both counts.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quinary-finite-count`, `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average size of the 5-Selmer group of elliptic curves is 6](https://arxiv.org/pdf/1312.7859v1), Theorem 27 and Lemma 28, pp.20–22.

#### Degree-five genus-one acceptable-weight count

Target `refinement-quinary-acceptable-count`; proposed name `ArithmeticCountingRefinement.quinary_acceptable_count`.

For acceptable invariant congruence-defined phi in [0,1], the BS5 strongly irreducible count satisfies N_phi(V_Z^±;X)=N(V_Z^±;X) product_p integral phi_p+o(X^(5/6)).

**Construction or proof.** 1. Approximate the finite local factors by residue step functions. 2. Apply the uniform prime tail and take the three limits in the established order. Do not import a quintic maximality tail for this different representation.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-quinary-finite-count`, `ArithmeticStatistics:ST.2/refinement-quinary-prime-tail`, `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The average size of the 5-Selmer group of elliptic curves is 6](https://arxiv.org/pdf/1312.7859v1), Theorem 29, §3.5, p.22.

#### Invariant-section smoothing kernel

Target `refinement-section-kernel`; proposed name `ArithmeticCountingRefinement.sectionKernel`.

For an action G on U, invariant map inv:U→I, section kappa:I→U, compactly supported real function Theta on G and real function phi on I, define K(u) as the sum over g with g acting on kappa(inv(u)) equal to u of Theta(g)phi(inv(u)). Use the native real summation, with summability or finite-support obligations when applying identities. In the regular finite-stabilizer Lie representation, each fibre is finite and gives the source smoothing function.

**Construction or proof.** 1. Use the native action and equality of vectors in the transporter fibre; attach inv and section rather than replacing them by an arbitrary weight. 2. For a genuine invariant section the summand restricts to a coset of the stabilizer. Finite stabilizers and compact support justify finite summation. Native Lie/differential-form integration remains a theorem-interface gap.

**Direct inputs.** `mathlib:MulAction.orbitRel`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Consumers.** BSS Theorem 5.1, Theorems 6.3 and 7.1: Unfold a stabilizer-weighted orbit sum into a smooth lattice sum integrated over the arithmetic fundamental domain; the transporter multiplicity accounts for sigma.

| API name | Role | Contract |
| --- | --- | --- |
| `ArithmeticCountingRefinement.sectionKernel` | constructor | The transporter sum defines the kernel for the supplied action, inv, section and functions. |
| `ArithmeticCountingRefinement.sectionKernel_zero` | simp | If phi is identically0 then the kernel is 0, without a transporter hypothesis. |
| `ArithmeticCountingRefinement.sectionKernel_unique` | compatibility | If exactly one g carries kappa(inv(u)) to u, then K(u)=Theta(g)phi(inv(u)); this agrees with a one-term finite sum. |

**Unit tests.**

- `ArithmeticCountingRefinement.kernel_unit`: For the trivial group and singleton invariant/vector types with Theta=2,phi=3, the kernel is 6.
- `ArithmeticCountingRefinement.kernel_empty_fibre`: For the trivial action on Bool and constant section false, the value at true is 0.
- `ArithmeticCountingRefinement.kernel_zero_weight`: For any action, identically zero phi gives identically zero kernel.

**Source.** [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1), §5 definition of S and Theorem 5.1, pp.20–21.

#### Smoothed stabilizer-weighted unfolding

Target `refinement-smoothed-orbit-unfolding`; proposed name `ArithmeticCountingRefinement.smoothed_orbit_unfolding`.

In BSS Theorem 5.1 let G be the real Lie group of the polynomial representation U, F its arithmetic fundamental domain, I a regular invariant region admitting a smooth section kappa, constant finite real stabilizer size sigma, phi smooth compactly supported on I, Theta smooth compactly supported on G with vol(Theta) nonzero, and T a nonnegative invariant weight on the integral lattice. Then the sum over arithmetic orbits of T(u)phi(inv(u))/|Stab_Z(u)| equals (sigma vol(Theta))^-1 times integral_F sum_{u in lattice} T(u)(g acting on K)(u) dg. Require integrability of the nonnegative sums; phi,Theta are nonnegative in this application. The action on functions is pullback: (g acting on K)(u)=K(g^-1 acting on u).

**Construction or proof.** 1. Unfold the arithmetic group fundamental domain and the transporter coset. 2. The real stabilizer multiplies the smoothing integral by sigma; integrate Theta and divide by its nonzero total mass. Preserve arithmetic stabilizer weights rather than replacing them by 1.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-section-kernel`, `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1), Theorem 5.1, pp.20–21.

#### Smoothed special quaternary count

Target `refinement-smoothed-quaternary-count`; proposed name `ArithmeticCountingRefinement.smoothed_quaternary_count`.

In the fixed split antidiagonal quaternary slice W_A of BSS, with its PSO_A arithmetic group and smooth invariant-region test psi, an acceptable weight uniformly bounded by a fixed C0, of modulus b<=X^theta, squarefree q<=X^(1/2), gcd(b,q)=1, and rank<=1 reductions for p|q, has N_gen(psi,T;X,Y)=|J_A| vol(F_A) nu(T) vol(psi restricted at Y^2/X) X^4 Y^2/sigma_A(i) + O_epsilon(X^(5+10theta+60delta−lambda+epsilon)/q^6), for c X^(1/2−delta)<=Y<=C X^(1/2), theta,delta>0, with an absolute lambda>0 independent of theta,delta. For a subleading error choose 10theta+62delta<lambda and sufficiently small epsilon. Keep all source weight support and smoothness hypotheses, and the dependence of constants on A,psi.

**Construction or proof.** 1. Separate the special rank-one congruences at primes dividing q and use the normalized local mass nu(T). 2. Apply the smoothed main-body estimate and its cusp bound with the joint theta,delta restrictions. The native PSO_A mass interface and the proof’s parameter range are G-smoothed, not inferred from the general BGW pencil count.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-smoothed-orbit-unfolding`, `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [The second moment of the size of the 2-Selmer group of elliptic curves](https://arxiv.org/pdf/2110.09063v1), Theorem 6.3, §6, pp.29–30; proof §§6.2–6.3.

#### Number-field three-isogeny orbit-count input

Target `refinement-number-field-twist-orbit-count`; proposed name `ArithmeticCountingRefinement.number_field_twist_orbit_count`.

Fix a number field F and elliptic 3-isogeny phi:E→Eprime. Choose the squareclass representative domain Sigma0 and nonzero integral scale kappa from BKLOS Theorem 7.2 and the primary coregular counting theorem. Let Sigma be a large locally defined subfamily: at almost every finite v its factor is {s in O_v : v(s)<2}, and its archimedean sign conditions are nonempty. Order it by H(s)=product of N(p) at the primes with odd v_p(s); on a representative this equals N(I(s))^2 product_{v infinite}|s|_v, where I(s)={a in F:a^2 s in O_F}. Let N_irr,loc(X) count irreducible locally phi-soluble SL2(F) binary-cubic orbits with normalized Disc=kappa s for s in Sigma,H(s)<X. Conditional on the source-qualified coregular counting theorem, its six axioms and compatible finite archimedean representative measure, lim_{X→infinity} N_irr,loc(X)/#Sigma(X)=R_infinity product_{v finite}R_v. Here c_v(s)=#coker(phi_s:E_s(F_v)→Eprime_s(F_v))/#ker(phi_s), R_v=(integral_{Sigma_v}c_v(s)ds)/vol(Sigma_v), and R_infinity=(integral_{Omega_infinity}product_{v infinite}c_v(s_v)dmu)/vol(Omega_infinity). Omega_infinity is the normalized representative window for H_infinity<1 and the allowed signs, with positive finite volume; establishing its compatibility is G-twist, not an assumption that raw sign-cone integrals converge. Almost every finite R_v is 1. This is the nonidentity orbit-count input, without adding the identity orbit or asserting a new Selmer-average theorem. Ordinary cubic discriminant equals −27 times this normalized Disc.

**Construction or proof.** 1. Use BKLOS Theorems 7.1–7.2 for the locally soluble orbit dictionary, unique reducible identity orbit and the uniform integral scaling; its native SL2/normalized-Disc adapter is G-twist. 2. Apply the genuine SL2 coregular invariant-height theorem after all six axioms and the finite representative-domain measure are established. The local orbit masses identify with the displayed cokernel/kernel ratios; SL2 has Tamagawa number 1. The available Global Fields I theorem supplies a tail input, not this coregular main term.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`, `ArithmeticStatistics:ST.1/binary-cubic-forms-and-the-twisted-action`.

**Acceptance.** Prove finite bounded-height squareclass/orbit sets and a positive finite normalized archimedean denominator; identify the representative window used in every numerator and denominator. Distinguish the irreducible nonidentity count from the Selmer average with its extra1, and keep the normalized Disc convention and uniform kappa scaling.

**Source.** [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf), Theorems 7.1–7.2, pp.10–11; Theorem 8.1 proof and six axioms, pp.12–13; §3 p.5.

### Local solubility in coefficient space

#### Large-prime local-solubility tail

Target `refinement-hypersurface-local-tail`; proposed name `ArithmeticCountingRefinement.hypersurface_local_tail`.

For degree d>=2 hypersurfaces in P^n, n>=2,(n,d)!=(2,2), with N=binomial(n+d,d) coefficients, local insolubility at some p>M is confined, for M beyond a finite threshold, to reduction in a fixed codimension-two geometrically reducible locus. In the coefficient ball of radius A the count is O_{n,d}(A^N/(M log M)+A^(N−1)), A,M>=2. The same upper bound holds after restriction to primitive vectors.

**Construction or proof.** 1. Uniform Lang–Weil gives an F_p-point on geometrically integral hypersurfaces at all sufficiently large p; choose a smooth point, lift in a univariate transverse chart by Hensel. 2. Except plane conics, the geometrically reducible coefficient locus has codimension at least2. Apply the geometric sieve to the Euclidean unit ball; primitive restriction decreases the numerator. The degree-bounded smooth-point estimate and the codimension calculation are requested/gapped explicitly.

**Direct inputs.** `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-estimate`, `mathlib:hensels_lemma`, `SchemeAndStackFoundations:SF.0`, `ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Random Diophantine equations](https://math.mit.edu/~poonen/papers/random.pdf), Theorem 3.6 and proof, pp.3–4; ball adaptation for Fano height.

#### Primitive ball count with finite local solubility

Target `refinement-hypersurface-finite-local-count`; proposed name `ArithmeticCountingRefinement.hypersurface_finite_local_count`.

For the same n,d and coefficient rank N, primitive coefficient vectors modulo sign with Euclidean norm<=A have total count vol(B_N) A^N/(2 zeta(N))+o(A^N). Requiring local solubility at finitely many places multiplies this by c_infinity,ball product_{p in finite set} c_p, where c_p is normalized Haar probability on Z_p^N and the real factor is relative unit-ball volume. Scalar-invariant local solubility has the same conditional probability among primitive p-adic vectors.

**Construction or proof.** 1. Use Mobius inversion for the common coefficient gcd, CRT and bounded-region lattice counts. Prove nullity of the real and p-adic solubility boundaries using the discriminant singular locus. 2. Pair a with −a only after excluding the zero vector. Scalar invariance cancels the radial p-adic valuation sum, giving equality of full and primitive-conditional c_p. Real density uses the ball rather than the PV cube.

**Direct inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`, `AnalyticNumberTheory:AN.5`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Random Diophantine equations](https://math.mit.edu/~poonen/papers/random.pdf), §1 primitive restriction, p.1; Theorem 3.6 proof pp.3–4; BLS §1 pp.1–2.

#### Local-solubility density in Euclidean height

Target `refinement-hypersurface-local-density`; proposed name `ArithmeticCountingRefinement.hypersurface_local_density`.

For d>=2,n>=d,(n,d)!=(2,2), the ratio of locally soluble projective hypersurfaces with primitive Euclidean coefficient height<=A has limit c_infinity,ball product_p c_p>0. The unit-ball real factor and normalized p-adic factors are those of the finite count; the product is not silently assigned PV’s coefficient-cube real factor. This asserts local solubility only; the global Hasse-principle comparison is owned by ST.5.

**Construction or proof.** 1. For each finite place set use the primitive ball count. The uniform tail controls the difference, so take A first and M second. 2. Local smooth soluble examples give each factor positivity and the real factor positivity; uniform codimension-two finite-field counting yields 1−c_p=O(p^-2), hence positive product. Explicit boundary-null and chart adapters are G-local.

**Direct inputs.** `ArithmeticStatistics:ST.2/refinement-hypersurface-local-tail`, `ArithmeticStatistics:ST.2/refinement-hypersurface-finite-local-count`.

**Acceptance.** Check the stated exponent and constant dependence; establish finiteness before using a natural cardinal. Do not replace a uniform estimate by separate fixed-prime asymptotics.

**Source.** [Random Diophantine equations](https://math.mit.edu/~poonen/papers/random.pdf), Theorem 3.6, pp.3–4; BLS (1.3), p.2.

## Dependency boundaries and remaining work

The following register is shared exactly with packet coverage. Each item is an input needed for closure; planned status means that every target is identified at the requested target granularity and its missing inputs are recorded. It does not make these inputs available. A refinement must address the named source or adapter and preserve the distinctions above.

**G-native — Native arithmetic orbit interfaces.** Express the integral arithmetic groups, central quotient schemes, invariant polynomials and real component fundamental domains for each representation. ST.1 imports give their mathematical dictionaries; they are not pinned Lean constants. Omitted theorem signatures are listed by name in the suggested file. Provide finiteness of bounded-height arithmetic orbit sets and convert stabilizer-weighted to unweighted counts only with an exceptional-stabilizer bound. Do not manufacture arbitrary count functions as a replacement.

Needed by `quartic-finite-congruence-count`, `quintic-finite-congruence-count`, `pencil-finite-congruence-count`, `ternary-cubic-finite-count`, `quaternary-finite-count`, `quinary-finite-count`.

**G-quartic — Quartic suborders, quadratic extension masses and transport.** Read/source-qualify Nakagawa’s quartic suborder bound, Baily’s square-conductor criterion and the quadratic genus bound. Supply the uniformly O(X) summed 2-class mass used in Proposition 23, with its dependency on the quartic count made acyclic. The parent binary-quartic embedding has bounded fibres but can land outside the S4 locus of Proposition 23. Establish that exact non-S4 transport boundary or a wider uniform pair-count theorem before closing its O(X/p^2) input. The fixed-resolvent epsilon loss is retained.

Needed by `quartic-fixed-reducible-resolvent`, `quartic-nonmaximal-overramified-tail`.

**G-quintic — Uniform quintic suborder input.** Read Brakenhoff’s actual local suborder theorem and prove its constant uniform in p. Check the content-n resolvent O(n^6) bound rather than asserting a unique resolvent for every nonprimitive ring. The published proof uses these estimates; neither is a native baseline theorem.

Needed by `quintic-nonmaximal-tail`.

**G-secondary — Cubic second-term proof and local coefficients.** The source target Theorem 27 and the switching identities were read, but a full independent derivation of §6 smoothing and the §8 three-range optimization was not completed in this target pass. Obtain it, compute the translated-lattice secondary coefficients, and source-qualify each local primitive-index integral. An O(X/p^2) first-term tail alone gives no X^(5/6−1/48) remainder.

Needed by `cubic-secondary-congruence-count`, `cubic-secondary-sieve-error`.

**G-global — S-arithmetic orbit and geometric-sieve adapters.** Implement the number/global field, S-adic Haar measure and coefficient-lattice interfaces supplied by GlobalNumberFields and RestrictedProducts, then connect the specific G_n,V_n models. Generic arithmetic reduction theory and Tamagawa measures are assigned current upstream successor roadmaps, not supplied by field-level orthogonal groups. The current catalogue has not acquired all successor ids; record exact owners rather than creating them here. Characteristic-positive projection/spreading and finite ideal-class weak-map lattices need their native adapters.

Needed by `global-field-generic-finite-count`, `global-field-large-prime-tail`, `global-field-large-local-count`.

**G-weighted — Weighted geometric sieve and nonzero monic error.** Prove the anisotropic X^i-box adaptation of the geometric sieve and the O(X^(D−1)) singular coefficient-locus bound at fixed degree. The parent isotropic geometric sieve has affine projection/spreading obligations. Complete the orthogonal torus count using the ST.1 even flag and q definition; the accepted ST.1 reader does not erase that construction gap.

Needed by `monic-strong-tail`, `monic-weak-tail`, `monic-fixed-modulus-sieve`.

**G-even — Even-degree binary-form repaired tail.** Certify the actual paired-fibre count, determinantal-ideal/Cauchy–Binet Gram estimate, restricted L_good(M) rather than unrestricted L(M), small constant-term exclusion and quantitative non-Sn bound. Preserve the gcd(2,f(0,1)) flag correction imported from ST.1. Optimize parameters with slack for log^(2n)X; the published even numerical exponents are not declared established. Without this, the even summed tail and equal-coefficient squarefree sieve remain conditional.

Needed by `even-binary-restricted-gram`, `even-binary-restricted-deep-tail`, `binary-summed-tail`, `binary-fixed-modulus-sieve`.

**G-quadratic — Degree-two tails and finite-modulus sieve.** Supply the separate monic quadratic weak-tail proof (the higher orthogonal slice is inapplicable) and the full degree-two finite residue/truncation argument for the equal-coefficient sieve. The binary-quadratic nonzero summed-tail count is planned with its elementary proof, but does not by itself prove a congruence-density asymptotic.

Needed by `monic-summed-tail`, `binary-fixed-modulus-sieve`, `quadratic-binary-summed-tail`.

**G-criterion — Representation-specific geometric-sieve hypotheses.** Check all six axioms for every application of the invariant criterion. Density-one generic loci, finite geometric stabilizers, the height decrease and bounded orbit-fibre count are independent inputs. The binary-quartic embedding application needs the exact parent transport correction; the primitive relative invariant and strong codimension-two assumption cannot be omitted.

Needed by `invariant-geometric-sieve-criterion`.

**G-selmer — Integral genus-one models and local measures.** The ST.1 genus-one stabilizer comparison supplies field geometry, not integral minimization or local Selmer-orbit dictionaries for degrees3–5. Read those primary minimization sources, type their normalized integral groups and rational invariant lattices, and justify weighted/unweighted stabilizer conversion. Prove smooth local null boundaries and identify coefficient Haar normalization with the Selmer local mass. Keep the50-dimensional degree-five model distinct from the40-dimensional quintic-ring one.

Needed by `ternary-cubic-finite-count`, `quaternary-finite-count`, `quinary-finite-count`, `pencil-finite-congruence-count`.

**G-smoothed — Smooth unfolding and special quaternary masses.** Supply the native smooth section, Lie-action Haar/differential-form integration and arithmetic stabilizer measures. Validate the fixed A split slice, nonzero vol(Theta), integrability and the special rank-one local mass with the uniform modulus restrictions of Theorem 6.3. The theorem signatures are omitted until these carriers exist; the concrete transporter kernel and its API/tests are prototyped.

Needed by `smoothed-orbit-unfolding`, `smoothed-quaternary-count`.

**G-twist — Unavailable coregular number-field count.** BKLOS bibliography[7] cites Global Fields II as in preparation, and its Theorem 13 was not available among the sources read. Obtain its primary theorem and full proof or supply a source-qualified SL2 coregular invariant-height counting theorem with all six axioms. Global Fields I’s prehomogeneous theorem does not supply it. No replacement arbitrary count function is prototyped. BKLOS normalized Disc equals minus ordinary discriminant/27, so its displayed spreading section is correct. Supply the ST.1 SL2 locally phi-soluble orbit dictionary and its uniform integral-representative adapter from BKLOS §§3–7. Establish the squareclass representative domain, unit normalization and finite archimedean measure window before using Theorem 8.1 local-integral ratios; an unrestricted sign cone can have infinite measure. The local cokernel/kernel quotient is specified inline in the counting target, without importing the higher ST.5 Selmer-average conclusion.

Needed by `number-field-twist-orbit-count`.

**G-local — Hypersurface coefficient geometry and ball density.** Provide the universal degree-d projective hypersurface/local solubility native carrier, the geometric reducibility codimension calculation excluding plane conics, the degree-bounded smooth finite-field-point guarantee, the transverse Hensel chart and real/p-adic boundary nullity. Justify the primitive Mobius sum, positive local smooth examples and 1−c_p=O(p^-2). PV proves the cube version; the real factor must be recomputed for the Euclidean ball. The plane-conic zero-density statement invokes Serre and is not a new certified target here.

Needed by `hypersurface-local-tail`, `hypersurface-finite-local-count`, `hypersurface-local-density`.

### Exact requests and ownership

**`SieveMethodsAndPrimePatterns:SV.2`.** Supply a quantitative multidimensional coefficient-box Selberg/large sieve: uniformly positive good-prime excluded densities and remainder r_d=O_epsilon(X^(D−1)d^(1+epsilon)) imply the balanced distinguished-matrix saving 1/5. Also give a correctly normalized non-Sn bound for nonmonic coefficient boxes with a saving exceeding the small even-tail exponent. Existing additive/Gram inequalities are inputs, not either final counting theorem. For monic weighted boxes also supply the quantitative specialization/Galois-fibre estimate with the subgroup index retained, including the degree 4 D4 index3 exception; qualitative irreducibility is insufficient.

**`AnalyticNumberTheory:AN.5`.** Export the divisor bound d(k)=O_epsilon(k^epsilon), average divisor sum O(Y log Y), convergent squarefree-divisor sums and Mobius truncation estimates, with constants independent of the residue modulus. The pointwise O(log k) divisor bound must not be substituted.

**`SchemeAndStackFoundations:SF.0`.** Export finite affine projection after choosing a generic linear projection, spreading outside finitely many primes with uniform fibre-degree bounds, and the specialization of codimension estimates used in the geometric sieve. For the repaired deep cusp supply maximal-minor determinantal-ideal membership and reduced prime/ideal arguments over the universal coefficient ring, rather than divisibility of a product of minors.

**`GeometryOfNumbersAndQuadraticArithmetic:GN.4`.** As a proposed Part II extension, supply uniform skew-region symmetric-rank counts and saturated row-lattice height/successive-minimum enumeration used by BSW II §5. For ordered diagonal t_i, rank r<n and Y>1 the source bound is O(C(r,t)Y^(nr/2)(log Y)^r), with C(r,t)=product_{i<j,j>n−r} t_i/t_j and the source endpoint constraints t_1<=C Y^Theta,t_n>=c Y^(-Theta). Import current IntegralLattices for generic carriers and basis completion; do not duplicate that theory.

Current RealAlgebraicGeometry owns semialgebraic descriptions and its Layer7 analytic preparation. Current IntegralLattices owns generic integral carriers and basis/height theory. The proposed GeometryOfNumbersAndQuadraticArithmetic Part II adds only the skew-region rank-constrained enumeration in that owner's direction; it imports those carriers. The current arithmetic-reduction and Tamagawa successor boundaries are respected, and their unresolved catalogue/native adapters are G-global. None is recreated as an ST.2 definition.

The no-overlap audit used the library-coverage ST.2 record, the accepted parent/ST.1 packet, relevant ownership and ArithmeticStatistics link results, current Tau Ceti lattice/boundary counting modules and current roadmap sources. Complete nearby upstream document reads used GlobalNumberFields and ArithmeticDirichletSeries. Exact ST.2 link matches were absent; this is not a claim that no related links exist. The current library additions are separately registered in packet upstreamNotes and have not been treated as declarations at the older baseline.

## Source qualifications and corrections

Every statement here is in the worker's own words. No PDF, source passage or source-by-source outline is part of these deliverables. The packet records the public source URLs, editions, SHA-256 receipts and selected reading scope. No private reference book was used. The primary sources invoked but not read are identified in G-quartic, G-quintic, G-secondary, G-selmer and G-twist; no fact is attributed to them as independently checked.

**ArithmeticStatistics/E-ST2-1 (error).** Theorem 4.4 (39), p.22; (41), p.23, arXiv v3. The summed square-divisor count is stated without excluding zero discriminant. Restrict the summed tail and Mobius interchange to Delta nonzero, and bound Delta=0 separately. A repeated-root polynomial has Delta=0 and is counted at every squarefree m, making the unqualified nonnegative sum infinite. Status: Routed PAPER-BHARGAVA-SHANKAR-WANG-22/E13; independently checked on the source domain.

**ArithmeticStatistics/E-ST2-2 (misprint).** Theorem 4.1 proof (41), p.23, arXiv v3. The small-modulus remainder uses an X exponent D−n. Use sum theta_bar(m)m^kappa X^(D−1), giving O_epsilon(X^(D−1/kappa+epsilon)). The shortest weighted side has length X, so a boundary congruence error loses one exponent, not n. The corrected sum is absorbed by the announced larger sieve error. Status: Routed PAPER-BHARGAVA-SHANKAR-WANG-22/E6.

**ArithmeticStatistics/E-ST2-3 (error).** Proposition 4.3 proof, p.22, arXiv v3. The subgroup-index lower bound used for conjugate-factor forms includes degree 4. For quartics use O_epsilon(X^(22/3+epsilon)); retain the other degree bounds with their separate subgroup cases. The dihedral subgroup in S4 has index3; the claimed larger index is false. The corrected exponent is still subleading for the discriminant sieve. Status: Routed PAPER-BHARGAVA-SHANKAR-WANG-22/E7.

**ArithmeticStatistics/E-ST2-4 (gap).** Lemma 6.25 p.44 and Theorem 6.24 pp.44–48, published 2025. The normalized discriminant is used to deduce the stated Gram lower bound for unrestricted lifts. Restrict to L_good with a large constant term; use degree 2n(n+1), normalized Delta lower exponent −kappa_double, and Gram exponent −2kappa_double. Supply the determinantal-ideal argument and recount the restricted fibres with slack. Delta(xf)=Delta(f)f(0,1)^2. Without a constant-term lower bound, the source discriminant hypothesis gives only normalized size X^(−2−kappa). Product divisibility of minors is not a substitute for ideal membership. Status: Routed PAPER-BHARGAVA-SHANKAR-WANG-25/E2,E3; an open repair, not a certified correction.

**ArithmeticStatistics/E-ST2-5 (error).** S(Lambda) p.26; (74)–(76), pp.47–48, published 2025. The spanning symmetric lattice is treated as if every member had the rank and block conditions of the selected matrices. Enumerate actual nondegenerate B by its unique saturated row lattice, and retain block conditions on actual B paired with A. A full-rank subset and its additive span are different objects: the span includes lower-rank and zero matrices. Conditions depending on the paired A do not hold throughout the span. Status: Routed PAPER-BHARGAVA-SHANKAR-WANG-25/E18.

**ArithmeticStatistics/E-ST2-6 (misprint).** §3.4 (40)–(44), pp.16–17 of the accessed arXiv PDF. The coefficient-box sieve factors divide c_p by p^2. Use c_p/p^(2r), where r is the coefficient rank. c_p was defined as the number of zeros in (Z/p^2 Z)^r, which has p^(2r) elements. Theorem 1.5 and Theorem 1.6 already use that normalization. Status: No erratum located in the public-source searches; corrected normalization is already internal to this version.

**ArithmeticStatistics/E-ST2-7 (misprint).** Genus-one representation list (iv), p.5 of the accessed arXiv PDF. The degree-five genus-one item describes quintuples but places its first tensor factor in dimension 4. Use a dimension 5 first tensor factor, giving5 tensor exterior^2(5) and dimension 50. The same passage states dimension 50 and quintuples; dimension 4 would give40 and the different quintic-ring representation. BS5 explicitly uses the dimension 50 model. Status: No erratum located in public-source searches; the dimension/quintuple description and BS5 supply the intended correction.

The BSW corrections in this register are independently checked consequences of the already routed extraction findings, whose mathematical scope is retained. The Gram/fibre repair is still open. The geometric-sieve denominator and tensor-dimension slips are scoped to the public version read, without a claim of published-edition collation. The ordinary-versus-BKLOS discriminant calculation is a verified convention, not a source-error allegation. Individual source receipts and access scopes follow.

| Source | Edition and reading scope | SHA-256 |
| --- | --- | --- |
| [quartic](https://annals.math.princeton.edu/wp-content/uploads/annals-v162-n2-p10.pdf) | Annals of Mathematics 162 (2005), 1031–1063; §2 cusp and reducibility arguments, Lemma 12 pp.1044–1046; Theorem 22 and (32) pp.1054–1055; §3.2 Proposition 23 pp.1056–1058 | `4885b7d1c669ff400e3e00a0470f259287eb1b422a3e140d9a34e1e3088e568c` |
| [quintic](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n3-p02-p.pdf) | Annals of Mathematics 172 (2010), 1559–1591; §2.7 Theorems 17–18 pp.1585–1587; Lemma 14 and its finite splitting-type sieve; §3.1 Proposition 19 pp.1587–1589 | `3164388a71dbeb727a63ed065efb00902f85c59824ab93f04cc661158d4f8ee3` |
| [bst](https://arxiv.org/pdf/1005.0672v3) | arXiv:1005.0672v3, 20 June 2012, 38 pages; Theorems 5–8 pp.2–3; §5 main-term and lattice estimates; §6 Theorem 27 pp.19–20; §8 switching identities pp.25–27. Full second-term smoothing and optimization are input obligations. | `d45b16cdb6b34655634f4305416ad68083d6e6e5674907aefc85a30ac8937f74` |
| [global](https://arxiv.org/pdf/1512.03035v2) | arXiv:1512.03035v2; §§4.4–4.7 generic/main-body estimates, Theorems 4.6–4.7; §5 Theorems 5.1–5.3 and strong/weak tail argument | `f913019717d4605d7b8550e484e5edb0e9dafcbe79c083e0b941fb7cb54591ac` |
| [geometric](https://arxiv.org/pdf/1402.0031) | arXiv:1402.0031, public PDF accessed 10 October 2026; §2 conditions1–6 and Theorem 2.1 pp.8–9; full proof §3.4 pp.14–17; selected representation list pp.4–5. Application-specific verification remains an obligation. | `f7bbd98a2382e170df8f0d4279332a25541f47ba56df1b59879a36c004078c66` |
| [bgw](https://arxiv.org/pdf/1310.7692v2) | arXiv:1310.7692v2, 24 February 2017, 42 pages; §§10–12 Theorem 36, Definition 37, Theorem 38, Definition 39 and Proposition 42 pp.29–33 | `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2` |
| [bsw1](https://arxiv.org/pdf/1611.09806v3) | arXiv:1611.09806v3, 31 December 2021, 29 pages; Theorem 1.5; §§2.3–2.4 and 3.3–3.4 torus weights, cusp and distinguished counts; §4 including Lemma 4.2, Proposition 4.3, Theorems 4.1 and 4.4 | `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83` |
| [bsw2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) | Forum of Mathematics Pi 13 (2025), e17, 57 pages; Theorem 5; §4 odd-degree main/shallow/deep estimates; §5 symmetric-rank estimate; §6 even-degree reductions, Theorems 6.6,6.11,6.24, Lemma 6.25 and Proposition 6.26; §6.4 Corollary 6.27; §7 Theorem 7.1 | `b6e5d1701f487b813e9d6a0b26f9b8671c02c414996298cbba71fe5060e90740` |
| [pv](https://math.mit.edu/~poonen/papers/random.pdf) | Author PDF dated 19 June 2003, 8 pages; published pp.175–184 (2004), not collated; §1 coefficient-box conventions and primitive restriction; Theorem 3.6 and its proof pp.3–4 | `e4ec66ff04e6b6bf86f08bd66756e415c6e6be884cf1d49fa36d9428c4199045` |
| [fano](https://arxiv.org/pdf/2006.02356v1) | arXiv:2006.02356v1, 3 June 2020; §1 pp.1–3: Euclidean primitive projective height, local density (1.2)–(1.3). Global Hasse-principle proof is outside ST.2. | `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb` |
| [bs3](https://arxiv.org/pdf/1007.0052v2) | arXiv:1007.0052v2; Theorem 8 pp.2–3 and invariant conventions; §2.7 Proposition 25 and Lemma 26, weighted acceptable sieve Theorem 24 | `317479d621b376ef3ca769a8cf1e7bb3d1b8babefcc726f7e2a9e761b8617108` |
| [bs4](https://arxiv.org/pdf/1312.7333v1) | arXiv:1312.7333v1; §3.3 (17) pp.13–14; §3.4 Theorems 19–20; §3.5 Theorems 22–23 and weak-to-strong map | `1fe01e72dc60658ed51ffecef6ffb6a83818449a0d813fb24c480de678562c35` |
| [bs5](https://arxiv.org/pdf/1312.7859v1) | arXiv:1312.7859v1; Theorem 12; §3 cusp and nongeneric estimates Propositions 18,22; finite weights Theorems 25–26; Theorem 27, Lemma 28 and Theorem 29 | `0fad7f4eab6ade59ca50ddc1f12fb6f50126b5eca204a9fef650649b3203fd6d` |
| [bss](https://arxiv.org/pdf/2110.09063v1) | arXiv:2110.09063v1; §5 Theorem 5.1 smoothing; §6.3 Theorem 6.3; §7 Theorem 7.1 unfolding and Theorem 7.7. Global moment conclusion belongs to ST.5. | `8f568036291bd251d8598770fa956ec7893675b348259eca1bc5326618ff6be0` |
| [bklos](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf) | Author PDF 19-3IsogenySelmer, accessed 10 October 2026; §3 normalized discriminant pp.5–6; §7 Theorems 7.1–7.2 pp.10–11; §8 Theorem 8.1 proof pp.12–13 and bibliography [7]–[8] | `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880` |

## Suggested file and acceptance

The [suggested file](../suggested/ArithmeticStatistics--ST.2.lean) gives native definitions for the nonzero square-divisor tail and multiplicity, fixed-modulus acceptability and the transporter smoothing kernel. It includes all ten API declarations and all nine named-comment examples for those three nodes. Concrete theorem signatures cover the monic rational-root, strong, weak and summed-tail bounds and the binary-quadratic summed tail. The private coefficient polynomial has the exact monic degree and coefficient order; its finite boxes are the imported height convention expressed in coordinates. The zero-discriminant multiplicity deliberately vanishes. The examples distinguish that convention from counting every square divisor of0, distinguish a modulus 1 factor from a parity test, and test a transporter fibre absent from the section orbit.

The file's omission register lists each remaining theorem name and its absent native invariant, arithmetic quotient, scheme or measure carrier. Those names remain exact targets in this reader and packet; a generic function assumed to have the desired count is not a prototype. A successful elaboration checks only the type correctness of signatures and examples, while all implementation statuses stay unchecked. The handoff records the actual compilation result and checker report.

To accept the pass, check consistency of all 51 targets and all API/example contracts, the imported-parent boundary and six-planet cap, finite versus uniform-prime estimates, summed versus union tails, explicit exponent dependence, source edition receipts and gap/requests endpoints. Check the repaired even-degree targets without assuming the printed unrestricted claims. Finally run the packet checker and the authorized pinned Lean elaboration wrapper. The stage becomes closed only after its source proofs, native interfaces, supplier requests and all 13 remaining obligations are discharged.
