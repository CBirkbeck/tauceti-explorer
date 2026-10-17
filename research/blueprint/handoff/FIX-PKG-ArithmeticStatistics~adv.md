# FIX-PKG-ArithmeticStatistics~adv — completed fix

Codex, session `codex-cMfB5u`, 2026-10-17. Refs #10147.
Claim confirmation: [worker claim](https://github.com/CBirkbeck/tauceti-explorer/issues/10147#issuecomment-6233873451).

All three confirmed findings in
[REV-PKG-ArithmeticStatistics](../reviews/REV-PKG-ArithmeticStatistics.md)
are resolved in the package. The issue's `~adv` review filename is absent;
that existing review and the input `review.json` supply the findings.
This is a completed package fix, with the conditional conclusions described
below retained as conditional. It supplies roadmap statements and proof plans,
not formal proofs of the arithmetic-statistical theorems.

Only the issue's four deliverables change. No packet, published reader,
upstream roadmap, library or metadata file changes.

## Finding dispositions

1. **The cubic count and its abelian consumers lacked a quantified supplier.**
   Replaced the supporting checklist by seven anchored contracts: representation
   and descent, exact integral-orbit multiplicity, local spreading, squareclass
   charts and finite archimedean windows, windowed finite-congruence main term,
   separate V/S uniform tails, and local mass/denominator assembly. Each states
   its quantifiers, normalizations, prerequisites, source and proof route.
   The representation and integral-representative dictionary now cover
   degree-three isogenies in every abelian dimension, using BKLOS Theorems
   7.1–7.2 rather than an unsupported extension from elliptic curves.

   The explicit hypothesis `C(F,φ,Σ)` retains the windowed counting and
   uniformity inputs. It also includes the specified SL₂ volume-one supplier;
   finite adelic volume alone does not supply that value. Both the elliptic
   and abelian means, every rank consequence using them, dual-isogeny strata
   and base-extension applications retain C. The explicit prerequisite graph's
   entire reverse closure has twelve consumers, all checked. The pointwise
   complex-place obstruction is independent of C.

   The squareclass denominator uses all ideal-class charts, a unit-square
   fundamental window and its torsion angular sector, normalized additive
   Haar measures and the actual fixed CRT density. A sign cone of infinite
   product-height volume cannot replace this window. The coupled infinity
   indicator is handled by a direct windowed infinity-II target; it is not
   asserted to satisfy the source's scalar-invariant local-weight axiom.
   Numerator and denominator retain identical chart, lattice and κ factors.
   Mass weights are reciprocals of stabilizer orders. The exceptional
   rational-stabilizer squareclass contributes O(1), whereas the identity
   family contributes one for every twist and is never discarded.

2. **Even-degree Bertini dropped the binary tail assumptions.**
   The Bertini conclusion in even degree now assumes the same uniform summed
   tail as the binary sieve, with δ,η>0, ξ≥0,
   τ=max(η,(η+ξ)/δ), τ<1 and (2n+1)τ<n+1. The paired-row,
   restricted Gram and non-Sn estimates remain a proposed supplier route,
   not established facts. The real-bodied cutoff/predicate and their examples
   distinguish both strict inequalities. No numerical `1/(88n⁶)` error saving
   follows from merely positive slack. Odd degree remains unconditional;
   degree two is excluded from this Bertini target. The regular-section/order
   comparison also specifies primitive horizontal finite-flat sections and
   the singular intersection in a nonprimitive section.

3. **Field lower bounds lacked valid regular-family and multiplicity inputs.**
   Added full-dimensional separated-root monic regions, their fixed-congruence
   sieve and a uniform inverse-Vandermonde estimate. An integral generator of
   the maximal order gives integral power-basis coefficients; separation forces
   every coefficient of degree at least two to vanish for large Y. The
   remaining constant/linear coefficients give O(Y) polynomials per field.
   Dividing the full weighted count by this bound gives the monogenic field
   exponent 1/2+1/n and short-generator exponent (n−1)(n+2)/2. No trace-zero
   sieve or uniqueness of a strongly reduced basis is used.

   Added regular binary regions, the uniform invariant-order GL₂-class bound
   of Bérczes–Evertse–Győry, and a compact-transporter proof controlling
   coefficient representatives in each class. The latter requires n≥3;
   the split torus fixing xy disproves degree two. Only a finite C(n,s) is
   required, so the existing finite-rank unit-equation supplier suffices in
   the source proof, without requesting its sharper numerical constant.
   The binary field exponent is (n+1)/(2n−2), with the even tail hypotheses
   propagated. The stronger monogenic asymptotic remains conjectural.

   Added the squarefree normal-closure transfer: sign quadratic field,
   fundamental discriminant, transposition inertia, the prime two, complete
   splitting at real infinity in the totally real case, and a bound 2^(n!)
   on the source fields over each unlabelled pair (k,L). The extension lower
   bound counts pairs, not distinct quadratic bases. It uses r₂=0 and r₂=1
   separately and inherits the even tail assumption. It needs no uniqueness
   assertion for index-n subgroups, including n=6.

## Ownership and existing suppliers

Read current upstream roadmaps and the current Tau Ceti library as well as
the pinned declarations; the atlas snapshot was not used to infer absence.

- The singular-system supplier is already
  [OperatorTheory, PolarDecomposition Part C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md),
  PD-C09–PD-C18. Its real invertible dimension-two specialization gives the
  compact-transporter decomposition. Mathlib's
  `LinearMap.IsSymmetric.eigenvectorBasis` supplies the underlying spectral
  theorem. No general singular decomposition is replanned.
- The transfer imports existing
  `TauCeti.NumberField.discr_emod_four_eq_zero_or_one`,
  `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one`, and Mathlib's
  `NumberField.abs_discr_gt_two`. The quadratic formula's generator,
  minimal-polynomial, squarefree and modulo-four hypotheses are recorded.
  No Stickelberger or quadratic integral-basis theorem is newly planned.
- The inverse estimate consumes existing `Matrix.det_vandermonde` and
  `Matrix.det_vandermonde_ne_zero_iff`. IntegralLattices' lattice basis and
  covolume theory remains upstream; the new argument concerns polynomial
  generators with separated conjugates.
- **Maintainer routing note:** register the exact request
  `AA-II.sl2-tamagawa-one` in AdelicAlgebraicGroups Part II when that extension
  is assembled. For every number field F, the quotient SL₂(F)\SL₂(A_F)
  must have volume one for D_F^(−3/2) times the gauge-form product with
  dx, 2dxdy and finite integral mass one. Current AA supplies the measure,
  finite volume and strong approximation, not this value. The package's
  cubic mass contract records both the exact request and a proof route by
  nonzero-vector unfolding, U≃G_a quotient volume and Poisson summation.
  It matches the simply connected volume direction already requested by
  this package's Layer 4 central quotient. C explicitly includes this input;
  the new conditional conclusions do not presume that a current AA target
  has proved it. The issue authorizes no edit to AA's packet.

## Primary sources read

Locators refer to printed preprint pages, except the named book pages.
All repository statements are in our own words. No source file or passage is
included in this submission.

| Source | Read and used |
|---|---|
| BKLOS, [1709.09790v2](https://arxiv.org/pdf/1709.09790v2) | Theorems 4.2,5.3,6.2,7.1–7.2, §§6–8 pp.9–13; archimedean Proposition 10.1 p.14. Kernel dictionary, integral scaling, six axioms and local mass. |
| Bhargava–Shankar–Wang, [Global Fields II, 2604.16978v1](https://arxiv.org/pdf/2604.16978v1), 18 April 2026 | §2.2 pp.6–9; §3 pp.10–16, including equations (9)–(26) and Theorem 3.8; Theorem 4.1 pp.16–20. Read rendered p.12 to confirm the reciprocal stabilizer factors. |
| Bhargava–Shankar–Wang, [Global Fields I, 1512.03035v2](https://arxiv.org/pdf/1512.03035v2) | Theorem 5.2, §5 pp.19–21, for the cubic large-prime tail and its fixed-lattice/orbit comparison. |
| Bhargava–Shankar–Wang I, [1611.09806v3](https://arxiv.org/pdf/1611.09806v3) | Theorems 1.1–1.2 and Corollaries 1.3–1.4 pp.1–3; Theorems 4.1,4.4 pp.20–23; §5 pp.24–27. Region transfer and multiplicity replacement are stated separately from the source endpoints. |
| Bhargava–Shankar–Wang II, [author text](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), 4 April 2025 | §§5–6, the Lemma 6.25 step, Theorem 7.1 pp.51–52 and endpoint Theorems 3–4 p.3. The even supplier remains conditional. |
| Bérczes–Evertse–Győry, [math/0312234v1](https://arxiv.org/pdf/math/0312234v1), 11 December 2003 | Theorem 2.1/Corollary 2.1 pp.5–6; Proposition 5.3 p.31, Proposition 6.1 and Lemmas 6.3–6.4 pp.32–37. Ordinary GL₂ classes and the even h₂ correction. |
| Platonov–Rapinchuk–Rapinchuk (2023), cleared Volume I | §5.3, Theorem 5.22 pp.314–316, Example 5.23 p.316 and general-method discussion p.317. The example computes SL₂ over Q only; it is not cited as a general-field proof. |

## Adversarial pass on the touched statements

The rows cover every mathematical block changed or introduced by this fix;
adjacent heading/reference changes carry no extra theorem. Every new definition
has at least three discriminating README Checks. Heavy carriers stay in the
README and the Lean closing inventory. The Lean examples check signatures;
the computations below were also checked independently where applicable.

| Statement or family | Instances tried | Result and change |
|---|---|---|
| `Cubic.normalizedDisc`, homogeneity, `ordinaryDisc_eq` | Section (0,1,0,s/4); x³+1; x³; leading coefficient zero; characteristics two/three; zero ring | Polynomial formula/homogeneity work over commutative rings. Affine comparison needs a≠0: 3X²+1 has −12, whereas fixed cubic Δ is −108. Characteristic three gives normalized 1 and affine 0; characteristic two gives 1 and 1. No orbit dictionary outside number fields. |
| Cubic representation/general-abelian dictionary and orbit count | Abelian dimension one versus larger dimension; dimension zero; s=0; trivial local image | Actual Kummer subgroups retained in every dimension. Dimension zero has no degree-three isogeny. Disc=0 excluded; zero Selmer class supplies one reducible orbit per twist. |
| Exact integral multiplicity and rational stabilizers | One orbit, stabilizer 3; two integral orbits with stabilizer 1; exceptional rational-kernel twist | Weight totals are 1/3 and 1 respectively. Nontrivial rational stabilizer occurs in one squareclass; identity family is not O(1). |
| Local spreading | Reducible section versus irreducible local orbit; primes two/three; Disc=0 | Requires a section through each regular point. Work over the local field at bad primes, without integral smoothness. |
| Squareclass charts/infinity I | F=Q with one/both signs; a real quadratic field; a complex place; unit ideal/nonprincipal squarefree ideals | Volumes one/two over Q; balanced logarithmic window removes the quadratic hyperbola. Complex |z|² and torsion sectors retained; all ideal charts included. Raw noncompact sign cone rejected. |
| Windowed infinity II | Coefficient dimension 4[F:Q]; fixed finite-index lattices; coupled finite congruences; identity/reducible locus | Scale X^(1/(4[F:Q])) gives exponent one. Constants change with lattices. Actual CRT averages and bounded angular-window approximation used; no moving-modulus uniformity asserted. |
| V/S uniform tails | Fixed prime versus union over large primes; primes dividing 6κ; already-squarefree versus unsieved denominator | Iterated limsup in X then M. Exceptional primes retained. Denominator tail is counted before squarefree restriction, avoiding a vacuous empty union. |
| Local mass, SL₂ volume and global assembly | coker/kernel 3/3 and 1/3; two weights 1/2; identity; d=√D_F=2 | Masses 1 and 1/3; mean 1+1=2. d⁻⁴=d⁻³d⁻¹=1/16; forgetting the group factor gives 1/2. Gauge forms fixed globally; volume one is an explicit additional supplier. |
| Elliptic and abelian Selmer means | Empty sublevels versus nonempty limiting family; finite unions of rectangles; complex factor 1/3 | Positive denominator required before dividing. Finite unions are denominator-weighted; C stated for the actual isogeny/local images. |
| Rank-zero, rank-one and positive-proportion local subfamilies | t=0, ±1; missing strata; rational three-torsion | C retained for the isogeny and dual on every used nonempty stratum; Selmer rank includes the torsion correction. No positive density asserted for an empty stratum. |
| CM half-corank consequence | Maximal/nonmaximal orders; ideal-kernel isogeny and dual | C specified over the CM field for the maximal-order isogenous model; existing corank-isogeny comparison retained. No Sha finiteness added. |
| Endomorphism, [3] and finite-extension rank bounds | Rank 0/1; identity endomorphism; dimension zero; new splitting field L | Uniform c>0 index hypothesis retained for general ψ; a nonempty degree-three chain excludes the identity. [3] uses c=1. C required for each factor over the actual averaging field, including L. Zero-dimensional finite-extension conclusion is trivial. |
| Explicit elliptic rank/signature consequences | t=0, t=±1; real, imaginary quadratic and mixed signatures | C propagated to both isogenies and all used strata. Existing pointwise complex-place obstruction is not made conditional. |
| `sieveCutoff`, `EvenTailParameters`, positive saving | n=0/1/2/3/4; δ=0; ξ=0; (δ,η)=(1/2,1/100),(1/2,9/10),(1,3/5) | τ=1/50 passes; τ=9/5 fails first inequality; τ=3/5 fails second at n=4. δ=0 has total cutoff η but fails the predicate. Degree restrictions and strict slack present. |
| Binary Bertini | n=3/4/2; primitive versus nonprimitive; zeta argument 2 versus 3 | Odd case uses odd tail; even case retains full summed-tail hypothesis. Degree two excluded. Vertical/horizontal intersection prevents nonprimitive regularity; density uses ζ(3)ζ(2). |
| `weightedDilation`, composition, regular monic region | n=0/1/2; Y=0/1/2/3; roots ±1 and ±i; repeated roots | D₂ then D₃ gives (6,72). Light definition permits every real scale; region/count requires Y≥1, n≥2. D₀ collapses; empty coefficient tuple is harmless. |
| `separatedRoots` and inverse-Vandermonde estimate | Empty tuple; one zero root with C=0 or C=−1; repeated roots; C=0,c>0,n≥2; Y=1 | Empty predicate vacuous; single root has no pairwise constraint but still needs norm bound. Repeated roots fail c>0. Inverse estimate states n≥2,c>0,C≥0,Y≥1 and all coefficient ties explicitly. |
| High coefficients/separated-generator multiplicity | n=2/3; Y≤K versus Y>K; nonmaximal order; small root gaps | n=2 has no higher coefficient; translations require O(Y), not O(1). Vanishing uses integrality and Y>K. Nonmonogenic order and unseparated roots do not meet hypotheses. |
| Restricted regular monic sieve | Trace-zero quadratics; finite q=1; CRT forcing p²|Δ; fixed signature | Full region required. Trace-zero X²+a has zero squarefree density. q=1 is allowed as no extra congruence; incompatible conditions excluded. Full-box uniform tail dominates the region. |
| Monogenic field/short-generator bounds | n=2/3/4; discriminant scaling and O(Y) fibre | Exponents (1,2),(5/6,5), and field 3/4. Constants depend on region/local data. Lower bounds do not become the conjectural asymptotic. |
| Regular binary region sieve | n=3/4; scaling t; compact closure versus Δ=0; incompatible local data | Volume t^(n+1), discriminant t^(2n−2). Even tail retained; open-ball restriction justified by domination, not by openness alone. |
| Invariant-order fibres | n=3; odd/even n; O_S with h₂>1 versus Z; scalar multiples | Cubic root triples need no cross ratios. Even h₂ retained generally and equals one over Z. Ordinary GL₂ equivalence; coefficient vectors are not counted by the class bound alone. |
| Compact binary transporters | n=3/4/2; xy; x^n; empty compact set; t>0 | Positive torus weights force a repeated root for n≥3. xy has a noncompact regular stabilizer at n=2; singular forms also fail. Empty region is harmless; field region is nonempty. |
| Binary field bound | n=3/4; real and complex signatures; fixed congruences | Exponents 1 and 5/6. Uses C_n T_B representatives per field. Even case conditional; no dependence uniformity as local data vary. |
| Squarefree-discriminant S_n criterion | n=2/3; unit discriminant; prime two; wild odd inertia | Nontrivial everywhere-unramified quotient over Q excluded by existing discriminant bound, not abelian class field theory. Exponent-one inertia is transpositional; squarefree discriminant is odd. |
| Alternating-extension transfer | Cubics of discriminants −23,229,−108; r₂=0/1/2; n=6 | First two give imaginary/real unramified C₃ extensions; −108 fails the premise. Real infinity requires r₂=0. Subgroup bound avoids an index-n uniqueness claim. |
| Unramified-extension lower bound | n=3/4; several extensions above one base; odd/even degree | Counts pairs, with exponent 1 or conditional 5/6. It does not count distinct bases. Real/imaginary cases use separate signatures and the explicit transfer. |
| Supporting field/cubic/CM summaries and source references | Follow each changed consumer back to the named contract | Replaced withdrawn rigidity/trace-slice routes; no summary removes C or the even tail. New references identify versions and printed pages. |

## Lean/readme agreement and validation

All new Lean binders were compared with the README, including the enclosing
namespace and variable scope:

| Lean interface | Matching README scope |
|---|---|
| `Cubic.normalizedDisc`, `normalizedDisc_smul` | Any commutative ring; four divided coefficients; coefficient degree four. |
| `Cubic.ordinaryDisc_eq` | Any field and nonzero leading coefficient; affine cubic discriminant. |
| `Counting.sieveCutoff`, `EvenTailParameters`, `even_sieve_positive_saving` | Real parameters, natural degree, all positivity/parity and both strict inequalities. No analytic tail theorem is claimed by this predicate. |
| `FieldStatistics.weightedDilation`, `weightedDilation_mul` | All real scales and every natural coefficient rank. Region/count hypotheses are stronger, explicitly separate. |
| `FieldStatistics.separatedRoots` | Every real c,C and complex root tuple; bounds are part of its real body. |
| `separated_generator_coefficients`, `separated_generator_high_coefficients` | n≥2,c>0,C≥0,Y≥1 (or Y>Y₀), integer coefficients and the displayed conjugate-polynomial bound. These are the finite-dimensional estimates, not an unstated number-field carrier. |

Validation completed on the submitted package:

- `lean-check research/blueprint/packages/ArithmeticStatistics/Suggested.lean`:
  exit zero; 650 lines, 104 warnings, all `declaration uses sorry`, no errors
  or other Lean warnings, at Mathlib 082e2d37e8 / Tau Ceti f790474.
- `scripts/check_sorry_data.py`: exit zero; real-bodied light definitions,
  no sorry-defined data carrier.
- `scripts/check_blueprint.py` on ArithmeticStatistics.json and all six
  ST.0–ST.5 packets: seven passes, each zero errors and zero warnings.
- Independent exact rational computations: resultant discriminants on all
  500 divided-coefficient vectors in {−2,…,2}⁴ with nonzero leading term;
  coefficient homogeneity on the full 625-vector grid and five scales;
  section, leading-zero and characteristic-two/three controls; the three
  transfer cubics; cutoff inequalities, mass normalizations, Vandermonde
  witness and field exponents for n=2,…,24. Passed. These finite checks are
  witnesses, not proofs of the universal statements.
- 869 unique explicit anchors, 3,229 local links resolved; explicit `Needs`
  graph acyclic. All new mathematical anchor blocks have at least three
  Checks. Twelve reverse consumers retain C.
- JSON parsing, four-file intake validation and `git diff --check`: passed.

No work remains for this fix. The explicit analytic hypotheses and the
AA-II supplier request are future theorem targets; their proofs are not
represented as completed developments. The next action is independent review
of this completed fix. No new claim should be taken in this session.
