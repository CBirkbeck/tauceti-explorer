# Independent package review: ArithmeticStatistics, second round

Codex, session `codex-Bq4PNh`, reviewing #10163 on 2026-10-17.
The package author, first reviewer and intervening fixer were other sessions.
Inputs include the package repair in PR #10173 and the first independent report.

**Verdict: accepted with the corrections in this pull request.** This accepts a
roadmap, including its explicitly conditional statements and named conjectures.
It does not assert that its arithmetic theorems have been formalized, or that the
conditional general-abelian or even-degree estimates have been proved.

## Coverage and method

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol,
the reviewed AUDIT-07 library coverage and the Caraiani–Newton order. The current
LocalGaloisGroups and ProfiniteArithmetic README/Suggested pairs supplied the
upstream models; also compared the snapshot GlobalNumberFields and EllipticCurves
models. No packet or supplier roadmap was edited.

Walked all individually anchored mathematical target paragraphs, their hypotheses,
proof outlines, supplier links and definition interfaces. The final inventory is
724 target paragraphs: 89, 86, 108, 163, 103 and 175 in Layers 0–5. There are 175
explicit definition API blocks, each with at least three concrete Checks. The
representative Lean declarations or the closing inventory cover the definitions;
heavy constructions remain README targets.

Checked every flagged unverified locator (there were none), and a reproducible
sample of 15 other targets: Python's `random.Random(10163).sample` on the ordered
717 input target anchors. The source table below records the actual passages read,
without reproducing source text. Additional reading concentrated on the marked
quartic argument, the cubic mass calculation, polynomial/field transfer, and the
new sieve suppliers.

## Corrections and disposition of the first review

1. The general-abelian three-isogeny means now genuinely retain the analytic
   hypothesis `C(F,φ,Σ)`. Checked the seven contracts, including the normalized
   divided cubic discriminant, exact orbit multiplicities, all ideal classes,
   balanced infinity regions, separate V/S tails, fixed-congruence limits and
   measure normalization. The rational stabilizer exception is handled before
   removing weights; the identity class is retained at each twist. The requested
   SL₂ Tamagawa-one extension of AA-II remains part of `C`, not an imported theorem
   supplied merely by finite adelic volume. Both means and consuming rank and
   base-extension results retain this hypothesis. The first finding is resolved
   as an explicitly conditional theorem and a supplier plan.
2. The even binary statements retain `δ,η,ξ`, `τ=max(η,(η+ξ)/δ)`, `τ<1`, and
   `(2n+1)τ<n+1`. Checked the fixed-modulus count, Bertini, field and alternating
   extension consumers. The proposed numerical endpoint remains conditional;
   the odd-degree result does not supply it. This resolves the second finding.
3. Checked the full-dimensional separated monic region, the O(Y) generator fibre,
   binary compact transporters, invariant-order multiplicities and alternating
   extension transfer. No positive density on a trace-zero slice or strong
   generator uniqueness is used. Signature, finite ramification, infinity and
   pair-counting multiplicities remain explicit. This resolves the third finding.
4. The second-Selmer-moment proof still lacked the marked parametrization and
   weighted exceptional-locus calculation. Added `quartic-monicization`,
   `marked-quartic-selmer-embedding` and `marked-quartic-factorial-moment-bound`.
   Monicization scales `(I,J,Δ)` by `(a²,a³,a⁶)` and twists the Jacobian; its
   Selmer group is not silently identified with the original one. The marked
   embedding uses the original local Kummer images and the Brauer/Hasse comparison.
   The factorial bound retains the leading-coefficient specialness conditions,
   prime-power densities, squareful/small-coefficient tails, finite-level weight
   approximations and smoothing errors. The split adjoint group is
   `PSO₄≅PGL₂×PGL₂`, of Tamagawa number four. The identities
   `N²=(N−1)(N−2)+3N−2` and `N(N−1)=(N−1)(N−2)+2(N−1)` now supply respectively
   the bounds 15 and 6, using the appropriate denominators.
5. Removed four genuine forward prerequisite links: the monic reducibility and
   distinguished estimates and the binary summed tail had pointed to later
   quadratic character sums; hypersurface local solubility had pointed to later
   function-field cohomology. Added exact local targets for rectangular plane-curve
   counting, weighted monic Galois exclusion, the weighted Selberg step and
   degree-uniform hypersurface smooth points. Their quantitative constants and
   error parameters are stated. Fixed-model Lang–Weil and qualitative Hilbert
   irreducibility are not passed off as these uniform results.
6. Corrected the cubic-ring zero-ring edge: the rank-three description uses an
   actual basis indexed by `Fin 3`; the equivalent numerical finrank description
   requires a nontrivial coefficient ring. Over the zero ring finrank is zero.
7. Removed 179 generic review instructions from Checks while retaining at least
   three mathematical tests at every definition. Expanded the locally compact
   quadratic, weak-metabolic and maximal-isotropic tests with the dyadic
   hyperbolic plane, a quadratic non-isotropic diagonal and a closed real axis
   that is not compact open. Clarified that self-duality is part of the data.
8. Repaired the missing counterexample link and two attribution ambiguities:
   the escaping-mass mixture is the roadmap's corrective argument to EVW's
   printed converse; the recurrent-profile liminf/limsup lemma is a finite-set
   deduction, while Wood supplies the bad-type lower bound. Removed the stale
   coverage sentence and minor broken punctuation.

## Public-source sample

Locators refer to the versions linked in the package. Each row was checked in the
source, rather than inferred from a bibliography entry.

| Sampled target | Source and locator read | Result |
| --- | --- | --- |
| Cohen–Martinet surjection moment conjecture | Liu–Wood–Zureick-Brown, Forum Math. Pi 13 (2025), e19, Proposition 7.1, p.38 | Moment normalization and conjectural arithmetic use agree. |
| Selmer quadratic intersection | Poonen–Rains, arXiv:1009.0287v2, Corollary 4.6 pp.15–16 and Theorem 4.13 | Retains the local quadratic form, divisible-global kernel and quadratic vanishing at two. |
| Alternating cokernel law | BKLPR, arXiv:1304.3971v2, §1.4 p.4 and §3.7 p.9 | The extra module-size exponent is retained. |
| Eligible invariant pairs | Bhargava–Shankar, arXiv:1006.1002v3, Theorem 1.7 pp.4–5 | Integral congruences and the coefficient convention agree. |
| Involution quotient of the unramified pro-ℓ group | EVW, Annals 183 (2016), Proposition 8.7 proof pp.775–776 | Odd ℓ and the degree quotient are retained. |
| Positive plane-cubic solubility | Bhargava, arXiv:1402.1131, Theorem 16 p.10, Theorem 2 p.3, proof pp.11–13 | Finite-volume and multiplicity inputs agree. |
| Kolmogorov lower bound from an atom | Loughran–Thorne, arXiv:1511.02212v1, Corollary 5.14 proof p.34 | The atom supplies the claimed distance obstruction. |
| Wood subgroup bound | Wood, arXiv:1402.5149v2, Lemma 7.4 pp.27–28 | Growth bound has the correct group parameter. |
| Poonen–Rains Selmer conjecture | arXiv:1009.0287v2, Conjecture 1.1 p.2 | Arithmetic distribution remains a conjecture. |
| Liminf/limsup from recurrent profiles | Wood, arXiv:1702.04644v2, proof of Theorem 4.8, p.24, published p.409 | Attribution corrected: source supplies the bad-type bound, not the roadmap's finite-profile lemma. |
| Distribution does not force moments | EVW §8.5 p.774 | Attribution corrected: the mixture refutes the source's converse; it is not a theorem quoted from EVW. |
| Hyperelliptic local mass ratio | BGW, arXiv:1310.7692v2, §11 p.32 after (20) | Nonempty torsor required; real/dyadic factors cancel in dimension g. |
| Normal cubic bases | Gross–Lucianovic, proof of Proposition 2.1, p.3 | Basis translation and signs agree; used the public Harvard DASH copy after the original endpoint refused access. |
| Finite quartic congruences | Bhargava–Shankar §2.5, (27) and Theorem 2.11 p.14 | Arbitrary residue unions are distinguished from CRT products. |
| Local Selmer mass ratios | Bhargava–Shankar (74), p.34 | Multiplied-out identities remain meaningful when a local mass vanishes. |

For the additional corrections read Bhargava–Shankar–Swaminathan,
arXiv:2110.09063v1, Theorem 1.4 p.4, Proposition 2.2 p.8, §§3.1–3.2 pp.13–19,
and §7 pp.39–47; BSW I, arXiv:1611.09806v3, pp.13,19,21–23;
Dietmann, arXiv:1010.5341v1, Lemmas 1,2,5,6 and §3 pp.3–5;
Browning–Heath-Brown, arXiv:math/0506497v1, Theorem 1/(3) p.2 and §2 pp.4–11;
Poonen–Voloch, Theorem 3.6 and proof p.3; and Lang–Weil's original journal
Theorem 1 and Lemmas 1–2 pp.819–823. The latter was read in the journal-volume
text, not a book copy. The cubic assembly check also used Global Fields II,
arXiv:2604.16978v1, Theorem 3.8 pp.15–16, and BEG's invariant-order bounds,
arXiv:math/0312234v1. No source passages or source files accompany this review.

## Adversarial mathematics pass

The coverage here is every target in the inventory, grouped by mathematical
object; the table records the applicable tests and repairs, rather than claiming
that a successful `sorry` build establishes truth.

| Statements checked | Instances and convention witnesses | Disposition |
| --- | --- | --- |
| Layer 0 families, densities, heights and averages | Empty subsets; finite/infinite denominator; strict versus inclusive cutoff; height scaled by two; coupled mod-six residues | Nonempty asymptotic denominators and actual CRT products retained. |
| Cubic/quartic invariants and orbit dictionaries | Zero form; leading coefficient zero; zero ring versus nontrivial ring; characteristic three; `x⁴−y⁴`; split/irreducible cubic | Corrected cubic finrank scope. Integral discriminant identities avoid division by 27. |
| Matrix pencils, orientations, Plücker and ideal-square data | Empty determinant; one-dimensional pencil `(a,−b)`; rank deficient rows; scalar row change; dyadic lattices; field versus DVR | Fixed sign and integrality conventions retained; genericity and invertibility guards are explicit. |
| Monicization and marked descent | `a=0,1,2`; real sign-changing twist; original versus twisted Kummer images; `N=1,2,4` | Added real-bodied monicization and the marked embedding/factorial targets. Two distinguished classes, PSO₄ and stabilizer weights are retained. |
| Finite congruence counts, cusps and local masses | Modulus one; empty local set; zero local mass; primes two/three; translated lattice; reducible cusp | No 0/0 ratio, independent-product shortcut or unweighted exceptional-density argument. |
| Square-divisor, geometric and representation-specific tails | Δ=0; squarefree modulus one; codimension one; strong/weak union; ramified and characteristic-two local rings; fixed cutoff before limit | Zero-discriminant multiplicity excluded; maximality in characteristic two is distinguished from ordinary squarefree discriminant. |
| New uniform suppliers | Linear plane curve; `u^m−v`; non-geometric quadratic; `G=S_n`, index two and quartic index three; empty forbidden prime sets; Selberg balance; repeated line; singular cubic over F5; conic codimension | Added four local suppliers with nonvacuous uniform constants and positive logarithm domains. |
| Even binary sieve and consumers | Degree two/odd degree; δ=0; τ<1 but second inequality false; small discriminant/constant coefficient; restricted deep cusp | Both strict inequalities and the restricted hypotheses are preserved throughout. |
| Field regions and multiplicities | Separated roots ±1; translation of a generator; inverse Vandermonde; degree-two `xy` transporter; field isomorphism versus embedded copies | Full-dimensional regions and O(Y) fibres retained; binary compactness requires degree at least three. |
| Alternating extensions and class-field correspondences | Squarefree signed discriminant; prime two; real/imaginary signature; simple quadratic discriminant; repeated extensions over a fixed base | Counts pairs `(k,L)`; finite inertia and infinity splitting are explicit; no unjustified lower bound on distinct base fields. |
| Class groups, ranks, surjections, polarization and moment bounds | Trivial group; zero rank; `r≥q`; cyclic versus elementary groups; `p=2`; ordinary versus narrow class groups | Product/index exponents and prime/positive-rank guards retained. Existing pointwise theory is imported. |
| Selmer means, rank proportions and isogeny applications | Identity Selmer class; zero/two-adic masses; torsion; unbounded moments; nontrivial Sha; general abelian dimension | Conditional `C` is retained; corank/rank and marked/unmarked denominators remain distinct. |
| Random quadratic and alternating models | Zero module; zero quadratic map; dyadic hyperbolic plane and its diagonal; alternating zero diagonal; empty prime list and shared parity | Replaced weak LC Checks; quadratic isotropy is not merely polar isotropy. |
| Function-field, cohomological, Hurwitz and eigenangle targets | q=1 excluded; trivial group; fixed q versus degree versus large q; boundary profiles; repeated eigenangle/atom; escaped mass mixture | Orders of limits, stable range and boundary contributions retained; two attribution corrections applied. |

## Ten Lean signatures checked against the README

| Signature | Generality/hypothesis check |
| --- | --- |
| `ArithmeticFamily.relativeDensity_mul` | Nested subsets and infinite outer family provide eventual nonzero denominator. |
| `Coefficients.boxHeight_count` | Natural B and arbitrary m, including zero; cube is inclusive. |
| `BinaryQuartic.twentySeven_mul_disc` | All commutative rings; integral identity, no characteristic-three division. |
| `BinaryQuartic.monicize_invariants` | All commutative rings, including a=0; geometric interpretation separately requires a≠0. |
| `Orbits.pencilInvariant_congr` | Arbitrary square matrix, determinant squared; no invertibility needed for this polynomial identity. |
| `Cubic.normalizedDisc_smul` | Degree-four scaling over any commutative ring; separate polynomial-discriminant comparison guards the leading coefficient. |
| `Counting.even_sieve_positive_saving` | Positivity, parity, degree and both τ inequalities are bundled in `EvenTailParameters`. |
| `FieldStatistics.separated_generator_coefficients` | n≥2, positive separation, nonnegative root radius and Y≥1; coefficient bound uses the same normalized roots. |
| `Distributions.woodGridSeparator_diagonal` | Prime p and antitone target partition; no p=1 infinite-product assertion. |
| `Distributions.parityCoupledWeight_total` | Nonnegative summable weights and half-mass in each parity; zero-coordinate case is explicitly weight one. |

The 670-line file contains only light real-bodied data, representative end
statements and examples. `lean-check` exited zero at Mathlib `082e2d3` / Tau Ceti
`f790474`: 107 warnings, all declaration-uses-`sorry`. No Lean change followed that
run. The sorry-data checker found no offenders.

## Ownership and current-upstream duplication

Checked all target objects against the nine newer roadmap trees and all Completed
trees, and the current library, rather than relying only on the atlas snapshot.
Roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The relevant overlap was read at the declaration/statement level:

- Finite quadratic isotropy, Lagrangians and orthogonal quotients in
  `TauCeti.LinearAlgebra.FiniteBilinearModule.Quadratic`; the statistical
  parameter spaces and intersection laws are additional objects.
- Scalar exponential-moment determinacy in `TauCeti.Probability.Moments.Determinacy`;
  group-valued surjection moments have a different separator/growth problem.
- `TauCeti.Order.Northcott` finite-sublevel/summatory operations and the elliptic
  Selmer cardinal/rank statements; the new targets average specified families.
- OperatorTheory/PolarDecomposition PD-C09–18 supplies the singular system;
  IntegralLattices §2G supplies integral-lattice reduction. The binary compact
  transporter and the nonintegral embedding-metric adapter are the new uses.
- Stickelberger and quadratic ring-of-integers discriminant statements supply
  the existing arithmetic comparison; no second copy is planned here.
- AlgebraicVectorBundles' natural bundles, RealAlgebraicGeometry's semialgebraic
  geometry, LocalGaloisGroups/ProfiniteArithmetic's Galois interfaces, and completed
  RestrictedProducts' carriers remain suppliers, not statistical target duplicates.
  The DifferentialGeometry, OrthogonalSpinGroups, PeripheralActions and remaining
  Completed searches disclosed no additional identical statistical target.

No further exact duplicate required removal in this review. Existing deferrals
remain in Scope and ownership. The new uniform quantitative targets differ from
IG.2's fixed-model and qualitative statements. No upward `UPSTREAM:` or
`FoundationsAndLibraryIntegration` prerequisite remains. The explicit local
Needs graph has no cycle and no edge to a later layer; all 876 explicit anchors
are unique and all local links resolve.

## Validation and remaining work

The sorry-data check, all seven ArithmeticStatistics packet validators, local
anchor/dependency checks, `git diff --check`, and intake `check-files` pass.
The package is ready for its upstream draft under its stated hypotheses.
There is no remaining review defect or checkpoint work. The separate conditional
supplier obligations, notably AA-II's SL₂ normalization and the restricted even
binary estimates, remain part of the mathematical scope recorded in the README.
