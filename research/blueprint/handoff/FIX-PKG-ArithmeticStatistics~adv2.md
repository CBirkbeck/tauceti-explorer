# ArithmeticStatistics package compaction and repair

Completed `FIX-PKG-ArithmeticStatistics~adv2`, issue #10250, by Codex,
session `codex-fzm1ar`, 2026-10-17. This is a completed fix for independent
review, not a checkpoint or an independent review of this session's work.

## Inputs and disposition

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol,
the accepted package and its existing reports. The issue's named
`REV-PKG-ArithmeticStatistics~adv.md` does not exist in this checkout. The
actual reports are [the first review](../reviews/REV-PKG-ArithmeticStatistics.md)
and [the second review](../reviews/REV-PKG-ArithmeticStatistics~2.md), together
with [the preceding fix](FIX-PKG-ArithmeticStatistics~adv.md). The second report
accepts the preceding repairs with further corrections. Those corrections and
the conditional nature of the conclusions are preserved, rather than treating
the earlier report's superseded objections as new missing proofs.

| Finding or instruction | Disposition in this submission |
| --- | --- |
| General-abelian three-isogeny count was inferred from an elliptic count | Part III retains the seven individually anchored contracts, including divided coefficients, integral multiplicities, spreading, all squareclass/ideal charts, finite infinity windows, separate V/S tails and mass assembly. `C(F,φ,Σ)` includes the exact SL₂ volume-one request. Part VI's averages and Part VII's rank, CM and base-extension consumers retain C for every applicable factor over the actual averaging field. |
| Even binary Bertini silently dropped tail assumptions | Parts III and V retain δ,η>0, ξ≥0, τ=max(η,(η+ξ)/δ), τ<1 and (2n+1)τ<n+1. Bertini, restricted regions, field bounds and alternating extensions inherit the same summed-tail hypothesis. Even degree starts at four; odd degree uses its separate theorem. Positive slack does not assert the proposed numerical endpoint. |
| Polynomial counts did not justify field lower bounds | Part V retains full-dimensional regular regions, the inverse-Vandermonde estimate and O(Y) monic generator fibres. Binary class bounds and compact transporters require degree at least three; xy remains the degree-two obstruction. The alternating transfer retains prime two, signature/infinity, fundamental discriminant and pair-counting multiplicities. |
| Quartic second moment lacked marked descent and weights | Part II retains monicization with invariant scales a²,a³,a⁶ and original local Kummer images. Part VI retains the marked embedding and weighted factorial estimate, leading-coefficient/tail conditions, PSO₄≅PGL₂×PGL₂ and Tamagawa number four. The distinct normalizations giving bounds 15 and 6 remain explicit. |
| Forward uniform-counting prerequisites | Part III retains all four quantitative suppliers introduced by the second review: rectangular plane curves, weighted monic Galois exclusion, weighted Selberg counting and degree-uniform hypersurface smooth points. Neither qualitative Hilbert irreducibility nor fixed-model Lang–Weil substitutes for them. |
| Cubic zero ring, locally compact quadratic forms and attribution | Parts I–II retain an actual Fin 3 basis, with numerical finrank three only over a nontrivial ring. Part VII retains an actual quadratic map, its polar topological self-duality and the dyadic/real nonexamples. Part IV retains the escaping-mass correction to EVW's converse; Part VIII retains the finite-profile attribution correction. |
| Unwieldy 1,625,048-byte README | Eight complete mathematical packages, all below 350,000 bytes. The original folder is the overview and complete source register. Every old target, API, hypothesis, proof paragraph, Check and locator is retained. |
| AnalyticNumberTheory dependency must be one way | Every part explicitly imports AN. General cubic action/algebra/discriminant/orbit paragraphs now identify AN §§5.4–5.7 as their owner, retaining the statistical specialization and explicit basis/sign comparison. Removed the reverse quartic-supplier claim. No AN file is edited. |
| Exemplar shape and representative Lean | Every part has Scope and ownership, Conventions, Exact supplier contracts, How to read the build, a layer with prose subsections, Examples, Dependencies, Downstream consumers and References. Each folder has README, Suggested.lean, metadata and review. Removed the old closing declaration catalogue. Heavy objects remain fully specified README targets; each Lean definition has a real light body. |
| Adversarial pass and examples | All retained Lean signatures were read with their surrounding binders. Added mirrored witnesses for missing degenerate, strict-cutoff, sign, multiplicity, parity and measure controls; pass tables below. All nine Lean files elaborate at the pins. |

The existing mathematical conjectures and the explicitly conditional analytic
inputs remain roadmap targets. Acceptance in `review.json` means the fix's
findings are resolved; it does not turn those inputs into established results
or claim that any theorem has been formalized.

## Package and locator map

Section numbers retain the original common six-layer notation. Each mathematical
anchor occurs in exactly one part. Original anchor fragments remain unchanged
at their new owner; append the original fragment to that part's README URL.

| Part | Original sections and supporting material | Targets / nonbibliographic anchors | README bytes | Lean lines / sorry warnings |
| --- | --- | --- | ---: | ---: |
| [I](../packages/ArithmeticStatisticsPartI/README.md) | All Layer 0, including squareclass and finite-field abelian-count suppliers | 89 / 92 | 241,163 | 175 / 37 |
| [II](../packages/ArithmeticStatisticsPartII/README.md) | All Layer 1 | 86 / 86 | 212,014 | 128 / 28 |
| [III](../packages/ArithmeticStatisticsPartIII/README.md) | All Layer 2 and its exact quantitative/coregular suppliers | 108 / 116 | 293,476 | 122 / 19 |
| [IV](../packages/ArithmeticStatisticsPartIV/README.md) | Layer 3 §§3.1, 3.10–3.18 and 3.38: torsion/ranks, finite matrix laws and moment tools | 52 / 52 | 121,761 | 111 / 24 |
| [V](../packages/ArithmeticStatisticsPartV/README.md) | Remaining Layer 3 subsections and supporting field/class-group constructions | 111 / 114 | 268,530 | 85 / 16 |
| [VI](../packages/ArithmeticStatisticsPartVI/README.md) | All Layer 4 | 103 / 106 | 242,861 | 69 / 11 |
| [VII](../packages/ArithmeticStatisticsPartVII/README.md) | Layer 5 §§5.1–5.11 and 5.23–5.32; quadratic and CM supporting constructions | 102 / 104 | 236,949 | 76 / 9 |
| [VIII](../packages/ArithmeticStatisticsPartVIII/README.md) | Layer 5 §§5.12–5.22; cohomological/Hurwitz supporting constructions | 73 / 74 | 182,737 | 61 / 10 |

The [original folder](../packages/ArithmeticStatistics/README.md) is a
38,021-byte overview with the complete 132-entry source register; its Lean
entrypoint is 12 lines and has no warnings. Every part has its local
bibliography for every source it cites. Eleven original background references
not cited by a target remain in the overview rather than being lost.

Within the mathematical parts, predecessor links are:
I: none; II: I; III: I–II; IV: I; V: I–IV; VI: I–III,V;
VII: I,III–VI; VIII: I,IV–V,VII. Every part also has the one-way external AN
supplier. There are 808 explicit cross-part links, all to a lower part number;
no part imports a later Lean file. Common external supplier contracts remain
complete in each part. The introductory mention of the common layer numbering
and the downstream-consumer description are navigation, not forward proof inputs.

A small number of explanatory forward links were replaced by the same local
mathematical fact: the root-number calculation in Part I; the integral-closure
characterization in Part II; maximal irreducible cubic orders in Part III;
application of moment uniqueness to the specified imaginary-quadratic family in
Part IV; and the numerical comparisons σ(p)=p+1 and (2+1)(4+1) in Part VI.
No hypothesis, Check or proof supplier was dropped to obtain the order.

No other current package has a Markdown link to the former root's mathematical
fragments. Historical review/handoff links still refer to the old location;
the section/owner table above routes them without changing another job's files.

## Supplier and library ownership

Read the current GlobalNumberFields and ProfiniteArithmetic README/Suggested
pairs as upstream models, the exemplar, the reviewed AUDIT-07 ArithmeticStatistics
coverage and the pinned statements used by the light interfaces. Rechecked current
upstream at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. These are the same
revisions audited by the preceding independent review, including the nine
roadmaps newer than the atlas snapshot. Existing boundaries remain imports:

- Tau Ceti's `normLE`, `coe_normLE` and `summatory` handle natural-valued
  Northcott heights. The family adapter additionally permits real heights
  and counts a specified quotient/subfamily.
- Finite quadratic isotropy, Lagrangians and orthogonal quotients use
  `TauCeti.LinearAlgebra.FiniteBilinearModule.Quadratic`; no second finite
  quadratic-module theory is requested. Its finite carrier does not supply
  the locally compact topological self-duality or the random intersection law.
- Tau Ceti's scalar exponential-moment determinacy is consumed with its
  exponential-moment hypotheses for both measures. It does not supply the
  discrete group-valued moment theorem.
- Existing matrix-pencil rank-two Hasse discriminants do not give the
  fixed-size signed determinant polynomial of a symmetric pencil. The latter
  is the light source-specific adapter retained in Part II.
- Mathlib's `ProbabilityTheory.cdf`, `cdf_eq_real`, CDF bounds and
  `MeasureTheory.Measure.ext_of_cdf` supply the probability/CDF carrier and
  equality criterion. The new Kolmogorov-distance adapter uses them directly.
- IntegralLattices retains lattice and polarization classification; the new
  polynomial-generator fibre estimate is its statistical application.
  OperatorTheory PolarDecomposition PD-C09–PD-C18 supplies the real singular
  decomposition used in binary compact transporters. Existing pointwise
  Selmer exact sequences remain with EllipticCurves/Selmer cohomology.

AN is now the sole owner of the general cubic construction used here. Its exact
supplier links are §§5.4–5.7, 5.21, 5.28 and 5.29, plus the analytic summation and
product contracts. Its projective construction retains nonprincipal modules,
all ideal classes, determinant-line discriminants and stabilizers. The free
arithmetic formulas are adapters, not a request for a second construction.
For its displayed basis (1,ω,θ), replace ω,θ simultaneously by −ω,−θ to obtain
Part I's BST table. This preserves the algebra and discriminant and negates the
based index form; the source and the explicit Part II index-form determinant
pin that sign.

The exact `AA-II.sl2-tamagawa-one` routing note from the preceding fix still
applies: normalized volume one for SL₂ over every number field is an additional
AA-II target, not a consequence of finite volume. C includes that input, with
the gauge form and discriminant normalization stated in Part III. Register it
when the owning extension is assembled; this issue authorizes no supplier edit.

Focused public-source rereads for the changed adapters:
[Gross–Lucianovic](https://people.math.harvard.edu/~gross/preprints/cubquat.pdf),
§2 pp.2–4, Proposition 2.1 and its proof, for the multiplication and basis
normalization; and
[EVW](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Theorem 8.8 proof, p.778, for the finite lower-cohomology sum before the geometric
series bound. The numeric signature uses the retained looser C^(i+1) bound,
so its remainder is C²/(√q−C). This run does not claim a new full reading of all
132 editions; their reviewed target-specific locators are preserved. The
cleared-library index was consulted; no restricted book was needed or copied.

## Adversarial pass on the retained and changed signatures

The tables cover every retained Lean definition, theorem, lightweight instance
and example group. They also record the ownership changes and the unchanged
conditional chains most vulnerable to being weakened during the split. Computed
witnesses are in each part's Examples/Checks and corresponding Lean examples.
The Lean examples contain `sorry`; their elaboration is distinct from the
independent exact computations recorded below.

| Statements checked | Instances and calculations | Result / change |
| --- | --- | --- |
| `ArithmeticFamily`, `count`, `HasRelativeDensity`, `relativeDensity_mul` | Empty subset; finite ambient set; infinite S with nested U⊆T⊆S; zero limiting middle density; natural height at three gives four points; integer absolute height gives seven | Northcott is a field, with real inclusive sublevels. Infinitude of S gives an eventually nonzero denominator; multiplication also works when the middle limiting density is zero. Added empty-density positive/negative controls and integer count. |
| Natural-height adapter | Empty sublevel; negative real cutoff; ordinary absolute value on Q | Imported `normLE` is the same inclusive carrier. Rational absolute value alone fails Northcott. No general height theory duplicated. |
| `boxHeight`, `boxHeight_count`, `monicPolynomial`, `weightedBox` | m,n=0,1,2; radius zero/three; `(2,−3)`; X²+4 at X=2/3; X−2; degree-zero polynomial | Empty cube has cardinality one and height zero. Descending monic convention gives X²+4, X−2, 1. Strict weighted inequality excludes the boundary. Added empty and one-coordinate X=0 controls. |
| `binaryValue`, `StrongSquareDivides`, `WeakSquareDivides` | n=0; leading-zero xy; point at infinity; Δ=0, linear Δ at zero, squared Δ, constant nine at p=3 | Constant form stays five at (0,0); xy(2,3)=6. Linear Δ is weak and not strong; squared/zero/constant-nine examples separate both loci. No division or primality is silently built into these light definitions. |
| `BinaryQuartic`, `invI`, `invJ`, `disc`, `twentySeven_mul_disc`, `pairHeight` | Zero form; x⁴±y⁴; x⁴+xy³; x³y−xy³ in characteristic three; (I,J)=(0,0),(3,0),(1,2),(−2,8); zero coefficient ring | Integral polynomial identity holds without inverting 27; heights 0,27,1,16. Exact symbolic expansion independently confirms the identity and witnesses. |
| `monicize` and marked descent | a=0,1,2; five-vector [2,3,5,7,11]; original versus twisted Jacobian/Kummer images | Light coefficient formula is total; geometric comparison still requires a≠0. Scales a²,a³,a⁶ verified symbolically. Part II uses existing Fin 5 vectors so it needs no duplicated Part I carrier. No Selmer isomorphism is inferred from scaling. |
| `quarticMinors`, `quarticMinors_mul` | Zero matrix; swapped indices; standard first two rows; determinant zero/negative determinant | Antisymmetry and determinant scaling remain valid for singular row changes. Standard minor (0,1)=1 fixes the sign. |
| `pencilPoly`, `pencilInvariant`, congruence/scalar identities | n=0,1,3; zero pencil in positive dimension; rank-one scalar (a,−b); three-dimensional identity | Empty determinant one; scalar sign and squared determinant are unchanged. All commutative coefficient rings permitted by the formulas, including characteristic two and the zero ring. |
| `pairing`, `commonIsotropic` | Rank zero/one; zero pencil; identity over R; 2·3 and 2·3·5; characteristic two | Bilinear values 0,6,30; real positive definite matrix has no isotropic line. The empty space has its rank-zero submodule. No bilinear condition is identified with quadratic vanishing in characteristic two. |
| `normalizedDisc`, `normalizedDisc_smul`, `ordinaryDisc_eq` | Zero/section form; divided coefficients; nonzero versus zero leading term; characteristics two/three | Degree-four polynomial scaling retained over any commutative ring. Affine cubic discriminant comparison requires nonzero leading coefficient. 3X²+1 gives −12, not the fixed-degree cubic value −108; characteristic three control distinguishes normalized from ordinary discriminant. |
| AN cubic import and basis/index adapters | Split algebra, zero form, nonprincipal module, trivial and cyclic stabilizers; simultaneous negation; zero coefficient ring | General projective carrier is imported. Fin 3 basis handles the zero ring without asserting numerical finrank three. The index form changes sign on negating both nonconstant basis vectors; discriminant does not. |
| `squareDivisorTail`, `squareDivisorMultiplicity`, equivalence | Δ=0; Δ=36, M=5/6; strict height cutoff; modulus one | Singular tail and multiplicity are zero by convention. m=6 is the unique squarefree square divisor beyond five and none lies beyond six. The equivalence retains Δ≠0 and H<X. |
| `monic_rational_root_bound` | n=0/1 excluded; n=2; X=0/1 excluded; boundary coefficients | The exact strict weighted box and descending polynomial are expanded on Fin n in the standalone file. n≥2,X≥2 and the source's exponent/logarithm remain unchanged. |
| `sectionKernel`, finite-fibre identity and trivial permutation action | Empty transporter; trivial two-element action; weights 2 and 3; either weight zero | Kernel twelve requires both stabilizer elements. The finite-fibre theorem retains the actual transporter finiteness hypothesis; no summability assumption is inferred for infinite supports. |
| `sieveCutoff`, `EvenTailParameters`, positive saving | n=0/1/2/3/4; δ=0; (δ,η,ξ)=(1/2,1/100,0),(1/2,9/10,0),(1,3/5,0) | First gives τ=1/50 and positive slack. Second fails τ<1; third passes that inequality but fails 9τ<5. δ=0 fails the predicate despite totalized division. No numeric endpoint inferred. |
| General-abelian count, means and consumers | Dimension zero/one/larger; identity orbit; trivial local image; one exceptional rational-kernel squareclass; empty and coupled local conditions | C, positive denominator, all ideal charts, identity contribution and reciprocal stabilizer weights are retained through Parts III,VI,VII. Finite volume does not supply SL₂ volume one. |
| `powerRank`, `powerRank_prod` | Trivial group; C₂/C₄ at p=2,k=1/2; p=1 and k=0 outside the theorem | C₂ has adjacent ranks 1,0; C₄ has 1,1. Product formula retains prime p and k≥1. Definition remains total but does not claim a rank interpretation at excluded inputs. |
| `FKSpace`, `fkPhase`, `fkQuadratic`, `fkLinked`, `fkGoodPlanes`, bijection | k=0,1,2,3; directed phase at zero; u=(1,0),v=(1,1),w=(0,1) | Space sizes 1,4,16; good-plane counts 1,2,5,16. Φ(u,0)=1, Φ(0,u)=0; u,v unlinked, w,v linked. The empty case has one plane and no link. All small-plane counts independently enumerated. |
| `woodGridSeparator`, upper and diagonal identities | m=0,1,2; target coordinates 0..3; p=2; b=0/1; strict lexicographic excess | Upper points have an actual zero factor; diagonal factors are nonzero and the first infinite product converges. Prime hypothesis retained; no convergence or grid assertion at p=1. Added one-coordinate b=1 controls. |
| `weightedDilation`, composition, `separatedRoots` | n=0/1/2; Y=0/1/2/3; roots ±1,±i; C=0/−1; repeated roots | D₃D₂(1,2)=(6,72); D₀ collapses. Empty separation is vacuous; single root still needs the norm bound; repeated roots fail c>0. All these already had corresponding Checks and Lean examples. |
| Separated-generator coefficient/high-degree theorems | n=2/3; Y=1 versus large Y; C=0,c>0; integer versus real coefficients; nonmaximal order | Theorems retain all bounds on the same root tuple and coefficient vector. Integrality supplies eventual high-coefficient vanishing. Field transfer retains O(Y), not O(1), generator multiplicity and full-dimensional maximal-order regions. |
| Binary/alternating field transfer | n=2/3/4/6; xy torus; singular x^n; discriminants −23,229,−108; prime two; real/imaginary infinity | Compact transporter excludes degree two and repeated roots. First two cubics pass squarefree-sign controls; third fails. Counts unlabelled pairs (k,L), with the 2^(n!) bound, not distinct base fields. Even tails propagated. |
| `restrictedSelmerSet` | Empty place type; one empty image; two restrictions on Fin 3 | Gives S, empty set, and {1} respectively. The same supplied local maps/images appear in the definition; no unrelated arbitrary condition is passed off as descent. |
| `oddComponentBound`, limiting ratio | k=0; m=0/1; (m,k)=(3,1),(5,3),(3,9) | Counts 0,3,15,4 in the stated cases; choosing above m contributes zero. Ratio uses fixed k and m→∞; finite small-m denominator convention does not change the limit. |
| `ternaryValue`, positive plane-cubic solubility | Zero vector; x³ and z³ at (2,3,4); T=0/large; singular cubics | Values 0,8,64 fix the ten-monomial convention. Projective zero must be nonzero; theorem counts actual coefficient vectors and retains fundamental-multiset multiplicity in the proof contract. |
| `LCQuadraticData`, `polar_self` and its controls | Zero group; zero quadratic map; dyadic hyperbolic plane; closed real axis | Data include continuity and polar topological self-duality. Polar diagonal is 2q; q=0 forces trivial carrier. Self-duality gives both injectivity and surjectivity. Bilinear-isotropic dyadic diagonal need not be quadratic-isotropic; real axis is not compact open. |
| `parityCoupledWeight`, total-mass theorem | Empty and one-prime sets; two equal/mixed parities; 0..4 two-point marginals | Empty weight one; one-prime original law; two equal parities have factor two and mixed parity weight zero. Summability, nonnegativity and half mass in each parity remain explicit. |
| `kolmogorovDist`, zero iff equality, atom lower bound | Identical laws; δ₀/δ₁; half-mixture/δ₀; atom at zero | Distances 0,1,1/2 independently computed. Both measures are probability laws; CDF bounds ensure the supremum is bounded. Atom comparison keeps μ(Iio 0)=0 and ν(Iic 0)=0. No heavy probability carrier is introduced. |
| `trace_error_bound` | n=0/1; q=1 excluded; C=1,q=16; t=(1,3),q=9; rational C and square q | Empty error zero; bounds 1/3 and 1/2, with actual error 2/9. Every t_j is tied to the displayed degree-dependent bound. General numerical q>1 is stated separately from prime-power geometric applications. |
| Remaining moved target paragraphs | Existing degenerate Checks, source hypotheses, linked proof suppliers and conditional consumers | All 7,147 original mathematical/proof/API/check paragraphs match after only documented equivalent prose/link normalization. No theorem statement or old Check was narrowed, enlarged or deleted in the split. The preceding independent mathematical review remains the recorded review of those unchanged statements. |

The retained function-field/conjectural scope is unchanged: fixed-q degree limits,
fixed-degree large-q limits, liminf/limsup and ordinary component-profile limits
are distinct. Distribution convergence does not imply convergence of unbounded
moments, and bilinear isotropy does not replace quadratic isotropy at two.

## Validation

- Ran `lean-check` separately on
  `research/blueprint/packages/ArithmeticStatistics/Suggested.lean` and each
  `ArithmeticStatisticsPartI` through `ArithmeticStatisticsPartVIII` suggested
  file. All nine returned exit zero at Mathlib `082e2d3` / Tau Ceti `f790474`.
  The 154 warnings in the table are all `declaration uses sorry`; overview none.
  The only edits after the I–V runs were layer-heading comments. Memory was
  checked before every run, and this worker ran only one Lean process at a time.
- `python3 scripts/check_sorry_data.py` on all nine files: passed; no sorry-defined
  data, no fake carrier and every file below 5,000 lines.
- `python3 scripts/check_blueprint.py` on `ArithmeticStatistics.json` and the
  six `ArithmeticStatistics--ST.0` through `--ST.5.json` packets: seven passes,
  each zero errors and zero warnings. Packets were not edited by this job.
- Exact conservation: 724 target titles, 744 mathematical/support anchors,
  1,098 API entries, 643 original Check blocks and 1,777 original Check bullets.
  All 175 definition API outlines have at least three Checks; two of these
  outlines share the acceptable-weight anchor. Three additional trace Checks
  pin its degenerate/normalization examples.
- Full paragraph comparison: all 7,147 original layer paragraphs match the
  parts after whitespace, cross-part URL normalization, the shorter API lead-in
  and the explicitly listed equivalent explanatory-link rewrites. This includes
  hypotheses, source locators and proof suppliers, beyond target-name counting.
- All 3,505 local/relative Markdown links in the parts resolve to existing files
  and anchors. No duplicate local anchor. The explicit `Needs` graph has 744
  vertices and 1,721 edges and is acyclic. Every cross-part link points earlier.
- Independent exact arithmetic, without Lean's sorry proofs: symbolic expansion
  of 27Δ=4I³−J² and monicization scales; 500 resultant checks of divided cubic
  discriminants and symbolic homogeneity; three signed transfer cubics; complete
  FK good-plane enumerations for k=0..3; parity mass for 0..4 primes; strict
  cutoff controls; finite CDF examples; worst-sign trace sums for n=0..8,
  √q=2..7 and four rational C values; and upper-grid separator zero factors
  for partition lengths one through three with coordinates zero through three.
  All passed. Finite computations are witnesses, not universal proofs.
- JSON and TOML parsing, file-level intake validation on all 36 changed paths,
  and `git diff --check`: passed. No packet, source file, supplier package,
  campaign/data file or workflow is changed.

## Integration and remaining work

The issue explicitly requires new part folders but its generated output list
still names only the three root package files and this handoff. All 32 new files
are required by its compaction instruction. File-level submission validation
accepts their paths; intake's exact per-job manifest can still leave them to the
maintainer. The PR calls out that mismatch. Do not discard the parts or modify
the queue to evade that check. The maintainer should register the eight packages
and route later upstream submissions/consumers with the owner table above.

No mathematical or Lean work remains for this fix. The next action is independent
review of this submission and maintainer integration of the explicitly requested
split. The AA-II request and the conditional analytic estimates remain named
future proof obligations, not unfinished work concealed by this fix. This session
claims no second job.
