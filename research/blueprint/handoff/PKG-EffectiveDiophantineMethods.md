# Handoff: PKG-EffectiveDiophantineMethods

Completed package for #10086 by Codex, session `codex-n7dGml`, 2026-10-16.
This is the package author’s audit, not an independent review. No second job was taken.

## Delivered

The three package files are complete. README has all 178 targets in seven layers, in
upstream form, including 507 API entries and all 346 named Checks from the input,
plus the 69 additional non-streamlined signature contracts and their named tests.
A mechanical name inventory found no missing API, Check or additional-contract name;
all 58 definition/construction sections have at least three prose Checks. These are
planning contracts, not implemented mathematics. The input packet is unchanged.

Suggested.lean has 374 lines, eight real-bodied light definitions and one
real-bodied semantic structure, representative layer milestones and end signatures,
and discriminating examples. Heavy objects remain README targets, named in its closing
comment. No invented carrier, sorry-defined data, auxiliary theory development or
claim of formalization is present. `metadata.toml` is `topic = "math.NT"`.

Read WORKERS.md, both protocols, UPSTREAM_GUIDE.md and the binding shape/adversarial
instructions. Read the current upstream Completed/EffectiveBounds and
RealAlgebraicGeometry README and Suggested files in full as the two style models.
Checked current roadmap/library overlap, the reviewed seven-layer library audit,
tier order, every target/API/proof route, all 32 requests, 27 gaps and 69 extra
contracts. All 197 cited baseline declaration headers and their enclosing variable
hypotheses were inspected at the pinned libraries. Name coincidences were resolved,
including `Real.sqrt`, subgroup finite index, Padic valuation/norm and elliptic points.

## Validation

- Final `lean-check research/blueprint/packages/EffectiveDiophantineMethods/Suggested.lean`:
  exit 0, with only `declaration uses sorry` warnings. Memory was checked first;
  only the shared pinned build was used. No build/update/cache command or language
  server was started. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json`:
  exit 0, 0 errors. One pre-existing baseline-index warning about `Finset.mem_filter`
  versus its index spelling `Finset.Finset.mem_filter`. The checker reports 480 API
  items/337 tests by its counting rules; direct array inventory is 507/346.
- Exact integer/rational polynomial checks passed: level-13 change-of-variables
  identity, seven point memberships, complete F17 enumeration (20 points, 17 in U1,
  the stated three-point complement), partial derivatives at those rational points,
  all 68 representatives on the nine X0-plus quartics, all four S4 points, cubic
  inertness at17, all22 elliptic integral-point memberships, quartic Thue substitutions,
  the 229-residue obstruction and largest Thue–Mahler/S-unit identities. Polynomial
  identities used exact coefficient dictionaries, not floating point.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: exit0, 4 files and 0 problems. Final whitespace and allowed-path checks also passed.

The finite arithmetic checks establish membership and small finite enumerations;
they do not replay the lattice/Frobenius/root-exclusion transcripts needed for the
large application completeness statements. Lean elaboration with sorry checks
signatures, not mathematical truth.

## Duplication removed or restricted

- Sturm–Tarski/Thom real-root foundations are imported from current
  RealAlgebraicGeometry Layer1. The retained targets add selected embeddings,
  rational widths and quantitative refinement.
- Lattice bounded-norm finiteness, Hermite bounds and successive minima are imported
  from current IntegralLattices Layer2. The retained enumeration adds affine
  completion, exact closed endpoints and replayable distance witnesses; LLL belongs
  to GeometryOfNumbersAndQuadraticArithmetic GN.5.
- Existing explicit elliptic descent, 2-Selmer groups and abstract rank bounds are
  reused from Tau Ceti. The retained Layer3 targets certify finite local images,
  compare the actual Selmer object and prove finite computation soundness.
- Existing canonical-height convergence, pairings and regulators are inputs; only
  explicit constants and finite error/index certificates are planned here.
- Current Tau Ceti `NumberTheory/LocalField/Logarithm.lean` convergence and deep-unit
  isometry are cited. Layer2 adds finite tails and precision bounds.
- Current `RingTheory/PowerSeries/GaussNorm.lean` distinguished index and
  `RingTheory/PowerSeries/Weierstrass/Preparation.lean` preparation/uniqueness are
  reused. Layer4 zero counts and Layer6 quantitative root perturbation remain new.
  Current library checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- No higher Gross–Zagier/Euler-system or CM roadmap dependency is introduced.
  Actual modular rank-one over Q and CM dictionaries are explicit application
  hypotheses, rather than pretending a higher-tier theorem supplies them.

## Mathematical corrections and limits

The accepted input has not been edited. Corrections carried into the package:

1. General dyadic local extensions use the unit quotient modulo π^(2e+1), not
   the rational Q2 criterion1 modulo8. Prime-ideal valuations include residue degree.
2. Empty maximum conventions include0; isogeny formulas extend separately at O
   and the rational 2-torsion point. The comparison of two descent bounds no longer
   asserts that a 2-isogeny bound improves a full2-Selmer bound.
3. Good-prime quartic solubility needs a genus-one torsor point over the finite
   field. The proof now gives the Frobenius-minus-identity isogeny argument;
   Hasse’s bound for its Jacobian alone is insufficient.
4. Genus-two local x−T image size is divided by the possible extra kernel index
   c_p=[ker(x−T):2J], not silently identified with J/2J.
5. Half-height normalization matches pinned Tau Ceti and Silverman; Cremona’s full
   x-height estimates are divided by2. Prickett’s unverified decimal bound is not
   used: §3.16 has an exact supplied regression instead.
6. ArithmeticDynamics examples retain their actual geometric conclusions and
   conditional rank upper bounds. Poonen’s corrected point and the separate
   2-adic requirement are retained. The explicit genus-two relation at S-minus
   explains the unconditional saturation statement without assuming a rank bound.
7. The height/sieve recognition theorem requires T_a to lie in its intended
   coset. Abel–Jacobi injectivity is restricted to genus≥1; symmetric-square
   injectivity is stated at genus≥2 and nonhyperelliptic. Empty known-point sets
   have maximum height0. Final candidates require actual known-point coverage or
   a separate height/Chabauty argument; survival is not point existence.
8. Gauge primitives change compatibly: Ω→Ω+c requires g→g+cᵀZΩ+e.
   General-ring helpers require alternating Z, since skewness alone fails in
   characteristic2. Nilpotence is at most3. The tensor-quotient description of
   A_Z needs surjectivity of its degree-two pairing; the product formula itself
   remains valid when Z=0.
9. The logarithm at P5 is certified independently before constructing a height
   pairing. Rank over an imaginary quadratic field is not silently promoted to
   rank over Q; the admissible modular rank-one implication is explicit.
10. Coefficient valuations use the published Proposition4.6, with c1 once,
    separate low-degree and zero branches, and actual coordinate/tail semantics.
    A Newton slope equal to−1 does not exclude a root of valuation1; exclusion
    uses the strict inequality.
11. Root perturbation requires every tail coefficient to have valuation at least n,
    not the printed equality-only maximum condition. Normalize Gauss norm, use
    completed Cp root multisets and multiplicity, treat degree0 separately and
    prove the unit-norm/Rouché adapter. A congruence solution is not a lifted root.
12. A p-adic scalar certificate does not construct a geometric residue chart.
    Raw finite trees and semantic cover/uniqueness records are distinct.
13. Baran’s map uses actual quartic identifications, M∈GL3(Q), c∈Q× and a checked
    coefficient identity. It transports cardinality; the CM j-map is supplied
    independently and is not asserted to commute with Baran’s map.
14. The Thue–Mahler worked example uses the 1993 corrigendum, including7^15 and
    corrected first thresholds; alternative initial bounds remain separate routes.
    Its old transcript has not been rerun. The 1492 small-genus-two cases similarly
    distinguish1447 sieve cases from45 other cases and retain per-case hypotheses.

Nothing remains for this package-writing job. Future formalization still must
construct the heavy definitions, prove all API/precision/soundness statements and
supply or verify the explicitly assumed arithmetic, geometric and analytic data.
The 27 packet gaps are not declared closed. In particular, there is no numerical
replay of the BDMTV charts, complete S-unit/Thue–Mahler lists, small-curve catalogue,
Box/Caraiani–Newton transcripts, or class/unit/Hecke/Frobenius/L-value tables.
The conditional application signatures say exactly what their proof would consume.
The inherited Prickett attribution is unverified and unused. No private/uncleared
book was copied; no source passages are included in the deliverables.

Maintainer note: the upstream EllipticCurves reader’s full-height convention and
pinned Tau Ceti’s half-height convention differ. This package follows the code and
states the source conversion. No upstream file was modified.

## Sources inspected

All29 used public files matched the SHA256 recorded in the input’s sourceVersions.
The table records the passages inspected, not a claim to have re-proved every paper.
No source excerpt is reproduced. Prickett was not recovered or relied on.

| Source | SHA256 prefix | Direct passage check |
| --- | --- | --- |
| [de-weger-1989](https://ir.cwi.nl/pub/13190/13190D.pdf) | `581a3632f6b24672` | Lattice reduction and short-vector branches, pp.28–34, 51–53, 66–69; S-unit Theorem6.3, pp.123–130, including 514+31 and largest solution. |
| [tzanakis-de-weger-1989](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf) | `2eff85fb82ca8773` | LemmasII.1.1–II.2.4, pp.103–111; TheoremsA/B and reductions, pp.118–126. Coprimality over the cubic field checked directly. |
| [tzanakis-de-weger-1992](https://numdam.org/item/CM_1992__84_3_223_0.pdf) | `28e5806fea4590b4` | Prime-ideal removal and finite covering, pp.230–238; normalized equation and exceptional cases; worked equation §18, p.277. |
| [fincke-pohst-1985](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/S0025-5718-1985-0777278-8.pdf) | `c61b81fc0a0e274a` | §2, pp.463–468, Algorithms2.8/2.12; column-basis convention. Affine completion is an explicit extension here. |
| [doyle-krumm-2015](https://arxiv.org/pdf/1111.4963v4) | `8dc2ca7f92654510` | Theorem3.1 and Algorithm3.2, author-v4 pp.1–5; inverse unit-log coordinate box and Proposition3.3. |
| [matveev-linear-forms-2000](https://m.mathnet.ru/php/getFT.phtml?jrnid=im&option_lang=eng&paperid=314&what=fullteng) | `e395e4698837950b` | Corollary2.3, p.1219; nonzero product-minus-one form and archimedean constants, not an arbitrary additive logarithm form. |
| [yu-p-adic-logarithms-1994](https://numdam.org/item/CM_1994__91_3_241_0.pdf) | `caea575fec7e5abb` | Theorem, pp.241–242 (including the displayed constants, read as rendered mathematics); local valuation and multiplicative nonvanishing hypotheses. |
| [silverman-1990](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/S0025-5718-1990-1035944-5.pdf) | `aaf0066b8b7f4ef6` | Theorem1.1, p.725, rendered formula and normalization; explicit μ(E) and lower/upper constants. |
| [aitken-lemmermeyer-2011](https://arxiv.org/pdf/1108.6310v1) | `23e3e8275b7e2a67` | Lind–Reichardt Theorems4/5 and Lemmas13/14, author PDF pp.12,17–18; local versus rational solubility. |
| [siksek-2010](https://arxiv.org/pdf/1010.2603v2) | `2a6ccd4bced3956a` | Theorem2, author-v2 pp.7–9; all p-adic places, odd unramified prime and rank-d criterion. |
| [poonen-errata](https://math.mit.edu/~poonen/papers/errata.pdf) | `d369e65f3af0c830` | First page, correction to the genus-two local point and associated 2-adic calculation. Corrected point used. |
| [mccallum-poonen-2012](https://math.mit.edu/~poonen/papers/chabauty.pdf) | `fb8d1a580def6365` | Lemma5.1/Remark5.2, examples §8.2, and AppendixA PropositionA.1/LemmasA.3–A.4/TheoremA.5; coefficient bounds and formal logarithm comparison. |
| [box-2021](https://arxiv.org/pdf/1906.05206v3) | `e8e3b5567fe82304` | §2.2.2 matrix cases (including equality of actual support points versus equal reductions), Theorems2.1/2.4 and sieve §2.5–2.6. |
| [caraiani-newton-2023](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0` | v3 §7.4, Proposition7.4.1/Theorem7.4.2; four finite inputs and multiplied subgroup sieve. |
| [poonen-1998](https://arxiv.org/pdf/math/9512217v1) | `b703f6bf6da1bd05` | §4 Proposition2 and formal 3-adic calculation; relations 27D and the two infinity points; corrected descent input via errata. |
| [stoll-2019](https://arxiv.org/pdf/1307.1773v4) | `1e06d7451967cf70` | Logarithm/integration interfaces §3 and residue/annular bounds §6, including Lemma6.1; good/bad reduction domains kept separate. |
| [krzb-2016](https://arxiv.org/pdf/1504.00694v2) | `1169d989364d0f24` | Proposition3.16/Corollary3.18; bad-reduction rank and prime-size restrictions. |
| [bbk-2010](https://arxiv.org/pdf/1004.4936v2) | `319f92f3f5663502` | Author-v2 pp.2–5, including Theorem5 and Frobenius continuation for odd-degree hyperelliptic models only. |
| [bruin-stoll-2010](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/29EFF630FD2859F8C79DFD48E1A33926/S1461157009000187a.pdf/the-mordell-weil-sieve-proving-non-existence-of-rational-points-on-curves.pdf) | `fc3ee470dbd356cf` | Lemma4.1, pp.281–282; Definition5.1, Lemmas5.2–5.4, Proposition5.10, Theorem5.11, Corollaries5.14–5.15, pp.290–294; sieve and lifting interfaces. |
| [bdmtv-2019](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | `e1aa5f9662b48754` | §§4–5, connection/gauge/Hodge identities (28)–(36), Frobenius (45), heights Lemmas5.5/5.7; §6, pp.926–934, actual model, matrices, charts, point data and analytic/rank route. |
| [bdmtv-2021](https://arxiv.org/pdf/2101.01862v4) | `738f0ec0cd588e20` | arXivv4 §4.1–4.4, Lemmas4.2–4.7 and Remark4.8; §5.1 S4 model and §5.2.2 Theorem5.6/Examples5.7–5.15. Page numbering distinguished from publication. |
| [tzanakis-de-weger-1993-correction](https://numdam.org/item/CM_1993__89_2_241_0.pdf) | `ff360610b27d3992` | Full two-page corrigendum, pp.241–242; missing m^(2m+1), factor7^15 and corrected thresholds. |
| [siksek-symmetric-2009](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf) | `eb35e6fc5ef1d974` | Published pp.217–222, Theorem3.2 and Lemmas3.3–3.4; repeated divisors and p>d_j condition. Relative families use the stated separate criterion. |
| [bdmtv-2023-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf) | `811619d1e066b699` | Published §4.2–4.4, pp.1133–1136, especially corrected φ and Proposition4.6; c1 occurs once. Compared directly with v4 notation. |
| [cremona-1997](https://johncremona.github.io/book/fulltext/chapter3.pdf) | `c4843b80ae1b6b91` | ChapterIII pp.77–87, Proposition3.5.1 and footnote3, quartic local cases and 2-isogeny rank13; p.91 rank-zero/Sha example. |
| [flynn-poonen-schaefer-1997](https://arxiv.org/pdf/math/9508211v1) | `95d4c96eb64febc9` | Author-v1 Propositions2–5, local x−T kernel, Lemmas2–6 and Theorem3; genus-two rank and point-completeness proof. |
| [stoll-2008](https://arxiv.org/pdf/0803.2836v2) | `bfc9c27bc7b72835` | Author-v2 §3, Lemmas4/5 and Theorem6; §4 Theorem7 conditional rank. Numerical L-values do not prove a rank bound. |
| [siksek-1995](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf) | `36b3079bb5277f81` | Author pp.14–18, regulator/index and saturation criteria; Example5.1, pp.19–20, actual four-point data and strict bound1.88. |
| [cremona-ecdata-571a1](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999) | `259f3846329395b3` | Exact row571 a1 compared with the book example. Rank0 and Sha data are distinguished. |

## Adversarial pass: conventions and representative Lean signatures

The section table below covers each target together with its named API, additional
contracts, proof route and Checks. The following controls also cover the common
conventions and the compact Lean file; no sorry proof was counted as verification.

| Statement or convention | Instances and conclusion |
| --- | --- |
| Absolute versus uniformizer valuation | ord_π(p)=e; e2 gains two π-digits; zero uses∞. Qp-only Lean signatures are identified as special cases. |
| Closed boxes and balls | Singleton correct/wrong boxes; overlapping √2/√3 enclosures; zero p-adic centre asserts no valuation. |
| Complex branch | Principal argument in(-π,π]; separate log(−1)=iπ; numerical boxes avoid the cut. |
| Heights and pairings | O has height0; diagonal pairing is ĥ; doubling multiplies by4, and interval width has factor1/2. |
| Lattice orientation | Columns and target sign fixed; affine error is bounded before applying a distance exclusion. |
| Quotients and finite index | Native additive quotients; natural index0 at infinite index; no inference from an index without its finiteness hypotheses. |
| Divisors | 2P retained as a repeated effective divisor; genus0 excluded where Abel–Jacobi injection is needed. |
| realIntervalContains, complexBoxContains, padicBallContains | All three have positive and negative examples on existing carriers; definitions have real bodies. |
| exists_isolating_box | Nonzero polynomial, positive width; repeated root values do not invalidate value isolation; zero polynomial excluded. |
| padic_nonzero_of_error_lt | Exact equality x=c allowed; c0 excluded; strong triangle gives both norm and nonvanishing. |
| padic_ball_add/mul/inv/quotient_error | Min precision for sums; x y−c d=x(y−d)+d(x−c); inverse needs strict relative error; quotient uses |x|≤|y| and nonzero pivot. |
| exists_padic_ball | Every integer precision, including negative; rational density provides centres. |
| linear_form_excluded | n0 impossible antecedent; X0 and η0 branches; triangle inequality bounds the rounded integer sum by C exp(−X)+nXη. |
| realLogPartialSum and error/precision theorems | x1 zero; x2 first term2/3 and tail1/36; x>0 makes |(x−1)/(x+1)|<1 and denominator positive; N0 valid. |
| arctanPartialSum and error theorem | ±1 endpoints and t0; alternating remainder bound includes endpoints; no geometric-convergence assumption at1. |
| padicLogPartialSum and tail/precision theorems | z1 zero; z4,p3,N4 gives−51/4; d>1/(p−1) gives positive tail slope; k valuation bounded by(k−1)/(p−1). |
| supportedOn, coprimeSUnitTriple, sUnit_finite_search | n0 support fails for finite S; positivity belongs to triple; (1,2,3) passes, (2,2,4) fails gcd; global exponent bound precedes finite search. |
| canonicalHeight_mem_doubling_interval | n0; O; l/u error scaling; exact width81/(16·4^n); all carriers are the actual pinned elliptic points. |
| strassmann_card_le | N0 unit, repeated roots versus distinct finite roots, a_N0 rejected; convergence and last maximal coefficient explicit. |
| sieve_empty/sieve_weaken | Empty global set, empty index family, strict local supersets; only necessary conditions used. |
| CertifiedSolutionSet and coe_eq_setOf | Exact sound list always; H needed for completeness; false-H example does not assert completeness. |
| candidates_eq_known | Actual rational subset of zero locus, complete ball cover and subsingleton intersections; matched balls without uniqueness fail. |

## Adversarial pass: all target sections

| Section and target | Instances tried | Result or correction |
| --- | --- | --- |
| §0.1 Certified enclosures and the precision contract | Singleton intervals; overlapping √2/√3 boxes; p=3 centre 0 at precision 2. | Containment permits exact endpoints; overlap proves no equality. Lean positive/negative examples retained. |
| §0.2 Exact algebraic values with isolating intervals and discs | Rational root; nonreal root i; zero polynomial; inversion at 0. | Nonzero squarefree isolating polynomial and chosen embedding required; inverse only at nonzero value. |
| §0.3 Arbitrarily fine certificates of the same algebraic root | Width 0; root at an endpoint; two close distinct roots. | Nested refinement preserves the selected root; singleton stays singleton, no equality from overlap. |
| §0.4 Archimedean embeddings pinned by isolating boxes | Q(i), root i; symmetric imaginary interval; α constant. | Conjugation plus unique root proves realness only for symmetric box; derivative error is zero for constants. |
| §0.5 Hensel's lemma with the exact distance to the root | F(a)=0; F′(a)=0; b=a; p=2. | Strict Hensel inequality excludes zero derivative. Exact-zero residual gives distance zero without integer valuation of 0. |
| §0.6 p-adic embeddings pinned by Hensel certificates | Exact integer root; ramified prime; generator with no Q_p root. | Explicit zero-residual branch; this interface only gives degree-one Q_p embeddings, general completions belong to §0.9. |
| §0.7 Certified nonvanishing and the exact zero test | α=0; α=2^(−n−1); nonzero centre at insufficient precision. | Exact coordinate equality is distinct from exclusion. Refined a garbled comparison reference to the exact test of §0.2. |
| §0.8 Certified valuations from p-adic enclosures | αβ with opposite valuations; centre 0; residue degree greater than 1. | Requires nonzero values and precision above valuation; prime-ideal equality restricted to degree-one completions. |
| §0.9 Scalar p-adic precision under field operations | Zero coefficient and empty sum; inverse pivot 0; ramification e=2. | Zero omitted from valuation minima; strict pivot precision. p gains e digits, not one, in a ramified field. |
| §0.10 Certified enclosures of the height of a number-field element | x=0; rational x in a larger field; nonprimitive power-basis coordinates. | Height 0-input is 1; characteristic polynomial of arbitrary multiplication, not only the generator, is an explicit target. |
| §0.11 Certified enumeration of points of bounded height | D=1; x=0; projective infinity; height exactly D. | Boundary values go to near-bound set; infinity added; discriminant and Vandermonde inverses have nonzero proofs. |
| §1.1 The approximation lattice of a real linear form | Zero final rounded coefficient; unequal positive weights; affine β=1. | Nonsingularity requires φ_n≠0. Columns and target −ψ fix the affine sign. |
| §1.2 Lower bounds for lattice distances from a reduced basis | n=1, last nonintegral coordinate; all integral target; empty tail. | Integral-target distance formula not invoked; tail maximum now includes 0, covering the empty set. |
| §1.3 Reduction of a homogeneous real linear form | x=0; X_i=0; equality at the distance threshold. | Homogeneous vector must be nonzero; weak distance threshold gives weak form bound and strict exponent conclusion. |
| §1.4 Reduction of an inhomogeneous real linear form | Target lying in lattice; K₃=1 versus 2; nonzero β rounded to zero. | Positive distance hypothesis fails at lattice targets; source simplification needs K₃≥2; zero target excludes x=0. |
| §1.5 The approximation lattice of a p-adic linear form | n=1,p=3,m=2,r₀=5; m=0; negative versus positive target. | Weighted congruence uses Wb+y with y=−Wr₀; wrong sign rejected even when distances happen to agree. |
| §1.6 Reduction of a p-adic linear form | Boundary L²=ΣW²X²; exact-zero form; zero-target b=0. | Strict separation is essential; homogeneous eligibility excludes b=0. Exact-zero form is excluded by congruence, not totalized valuation. |
| §1.7 Fincke–Pohst enumeration of lattice points in an ellipsoid | Negative radius; R=0,t=0; affine centre 1/2; nonpositive pivot. | Closed integer intervals keep boundary and both signs; zero included; positive pivots are indispensable. |
| §1.8 Soundness and completeness of the Fincke–Pohst enumeration | Empty enumeration; enumeration {0}; negative radius. | Homogeneous nonzero bound removes only 0; minimum includes R, so empty-output minimum is defined. |
| §1.9 Residual enumeration for a real linear form | K₀=ε+ΣX; affine versus homogeneous error; output containing 0. | Strict reduced exponent formula requires positive margin; boundary case states only residual inequality. |
| §1.10 Lattice exclusion certificates for linear forms | Bad inverse; integral target; composite p=9; zero homogeneous box. | Raw finite replay checks inverses, prime, sign, residue ranges and strict distance threshold; zero box has no eligible nonzero vector. |
| §1.11 Soundness of lattice exclusion certificates | True answer list with invalid numerical transcript; zero target; form identically 0. | Checked distance and identified input enclosures are needed. No answer-list assumption substitutes for soundness. |
| §2.1 Certified enclosures of logarithms and arguments of embedded algebraic numbers | x=1,N=0; arctan at ±1; box meeting 0 or branch cut. | Series errors include N=0; branch-cut failure is data, not a logarithm enclosure; separate budgets cover combined arguments. |
| §2.2 Certified evaluation of Matveev's constant | n=1,D=1; log α=0; κ=1 and 2. | Delete zero logarithms; A≥0.16 and a rational maximum dominate both real/complex source constants. |
| §2.3 Certified lower bound for a linear form in logarithms | All b=0; nontrivial relation Λ=0; B*=1. | Λ≠0 ensures B*≥1; lower bound never applied to an exact relation. |
| §2.4 Certified evaluation of Yu's p-adic constant | p=2; one term; degree bound larger than actual degree. | n≥2 or adjoin zero-coefficient term; positive lower log-p and upper height bounds have the correct monotone directions. |
| §2.5 Certified upper bound for the p-adic valuation of a multiplicative form | α^b=1; α^b−1 with negative valuation; ramified completion. | Nonvanishing required; valuation normalized by v_p(p)=1, independent of uniformizer normalization. |
| §2.6 Certified p-adic logarithm values with explicit tails | z=1; p=2; depth exactly e/(p−1); large v_p(M). | Strict positive tail slope; exact-zero branch; divide by M with e·v_p(M) precision loss, reusing current logarithm foundations. |
| §2.7 Discrete-logarithm certificates for p-adic multiplicative forms | n=0; all variable discrete logs 0; ℓ₀=0; noncyclic extension unit group. | Separate empty-pivot branch; only necessary congruence. Clarified general completion input versus degree-one §0.6. |
| §2.8 Exponent reduction chains | No steps; q=0; exception outside next box; lowering only one coordinate. | Componentwise antitone boxes and accumulated finite exceptions retained; scalar weighted chain remains separate. |
| §2.9 Thue equations and their solution sets | Y=0; m=0; reducible or quadratic g; noncoprime (x,y). | Irreducible degree≥3 and m≠0; ordinary Thue solutions include noncoprime pairs and both signs. |
| §2.10 Factor coverings: units and representatives for X − ξY | Empty representatives; zero representative; sublattice of units of index 2. | Full unit generation, nonzero representatives and rank equality required; empty covering forces no solutions before forming extrema. |
| §2.11 Certified constants of the Tzanakis–de Weger method | No real roots; empty covering; no complex roots; transposed triangular log matrix. | Three separate branches; positive root separations and invertible row-oriented matrices. Explicit orientation test distinguishes inverse row norms. |
| §2.12 Lemma 1.1: solutions with large |Y| approximate a real root | Y=0; noncoprime pair; all roots nonreal. | Large-∣Y∣ hypothesis excludes zero division; denominator(X/Y)≤∣Y∣ suffices for Legendre without coprimality. |
| §2.13 Lemma 1.2: the unit equation and a small nonzero linear form in logarithms | One real root plus a conjugate pair; δ=1; root-of-unity sign. | Distinct indices available; structural Siegel nonvanishing; zero log terms deleted; complex branch coefficient 2a₀ matches log(−1)=iπ. |
| §2.14 Lemmas 2.1–2.2: the exponents are logarithmic in |Y| and Λ decays exponentially | All unit exponents 0; unit-log matrix singular; threshold equality. | Strict ∣Y∣ threshold and positive invertible-matrix constants needed; no inverse of a singular matrix. |
| §2.15 Lemmas 2.3–2.4 with Matveev's bound: the initial exponent bound | A=0; all retained logs gone; D=n(n−1)(n−2). | Nonzero form leaves at least one retained log; max(1,A) and bound ≥1 handle small exponents. |
| §2.16 Reduction of the initial bound and the bound for |Y| | Zero affine constant; exponent exception outside final box; A=0. | Exact algebraic comparison chooses homogeneous branch; exceptions tested separately; A≥1 proved only in large-∣Y∣ branch. |
| §2.17 The continued-fraction search for solutions of moderate size | Y negative; noncoprime X,Y; final rational convergent; C=1. | Signed divisor Z retained; 1/(6C²) approximation plus 1/(4Y²) is below Legendre threshold; finite continued-fraction termination. |
| §2.18 Exhaustive enumeration of the solutions with small |Y| | y=0; leading coefficient negative; no integer roots. | Every fixed-y polynomial stays nonzero degree n; strict Cauchy bound gives finite exact search. |
| §2.19 Thue solution certificates | Totally complex; empty real covering; missing nonsolution row; extra pair (2,1). | Raw and semantic records distinguished. Corrected copied S-unit test prose; every branch and residual row must be checked. |
| §2.20 Certified solution sets of Thue equations | Exception outside search bound; no-real-root branch; failed certificate. | Equality follows from coverage and exact filtering; failed checks have no conclusion; bounded box plus explicit exceptions retained. |
| §2.21 Thue–Mahler equations and their normalised solution sets | No primes; nonprimitive (5,0); f₀ not a unit; c negative. | Two coprimality conditions and f₀-divisibility recover normalized pair; zero-prime problem is the coprime Thue subset. |
| §2.22 The Prime Ideal Removing Lemma | Ramified factor; residual degree>1; p not dividing discriminant; p dividing y. | Read source equations on pp.230–231; e/f scaling and pairwise bounds retained, good-prime uniqueness alone not substituted. |
| §2.23 Thue–Mahler S-unit coverings | Inactive prime h=0,π=1; nonreal roots of unity; v=0. | Inactive exponent normalized to 0; torsion absorbed into finite α; only active h enters division. |
| §2.24 Initial bounds for the Thue–Mahler exponents from Yu's and Matveev's bounds | v=0; totally complex; zero logarithm; exceptional small A. | Empty nonnegative maximum set to 0; actual Matveev/Yu constants replace legacy bound, with corrected source constants retained. |
| §2.25 p-adic and real reduction of the Thue–Mahler exponent bounds | t/e_L nonintegral; zero target; exceptional enumerated vector. | Strict n_l threshold, actual ramification and complete exception propagation; necessary lattice condition only. |
| §2.26 Sieving exponent tuples with auxiliary primes | Equal residue roots; negative unit exponents; surviving nonsolution. | Unramified admissible degree-one distinct primes give distinct m_i and nonzero unit residues; sieve never asserts sufficiency. |
| §2.27 Thue–Mahler solution certificates | Missing residual nonsolution row; wrong z for (3,1); v=0. | Raw checker covers every bounded tuple. Corrected copied S-unit tests to Thue–Mahler tests. |
| §2.28 Certified solution sets of Thue–Mahler equations | Exception whose exponent exceeds N_i; no primes. | Fixed unconditional z-bound wording: nonexceptional bound is separate, global bound takes maximum with explicit exception exponents. |
| §2.29 The S-unit equation x + y = 1 over ℚ and its solution set | S empty; x=0; support on versus outside S; signed symmetry. | Units exclude 0; support predicate covers primes in S. Positive Lean triple is separately scoped; signed rational equation keeps all six symmetries. |
| §2.30 Initial exponent bound for the S-unit equation from certified Yu constants | ∣S∣=0,1; p=2 sign; C-log inequality near boundary. | Elementary bound 1 for small S; −1 is included in Yu family; positive log-2 lower bound and upper constants retained. |
| §2.31 p-adic reduction for the S-unit equation | S={2}; vector b=0; solution (1,48,49) at M=2,p=7. | Trivial vector kept as (1,1,2); threshold is t, not M; per-prime bounds preserve exceptions. |
| §2.32 S-unit solution certificates | S empty; S={2}; omitted exceptional (9/8,−1/8); unchecked nonsolution. | Full finite chain and residual-box replay needed, not just correct-looking output list. |
| §2.33 Certified solution sets of S-unit equations over ℚ | Scaled ax+by=c; coefficients 0; exceptional solution outside final box. | Scaling requires nonzero S-units; output is exact finite union of final box and checked exceptions. |
| §3.1 Size of E(ℚ_v)/2E(ℚ_v) at a finite or real place | p=2 versus odd p; one versus three real roots; exceptional two-torsion points. | Index includes the factor ∣2∣_p⁻¹, real factor1/2 and actual μ kernel; formal-point/reduction identification is an explicit supplier comparison. |
| §3.2 Certified local image of the 2-descent map | Empty span; dyadic extension containing cube roots of unity; incomplete one-point span. | Separate Q₂ unit≡1 mod8 from full extension unit quotient modulo π^(2e+1); actual local points and complete factorization inputs remain required. |
| §3.3 The size check completes a local image | Proper subgroup with too few classes; four split-cubic classes at p=3. | Inclusion comes from actual points before the finite-cardinality equality; no candidate image size is assumed to prove inclusion. |
| §3.4 Local images at good odd places are the unramified classes | Split, irreducible and linear×quadratic cubic at odd good p; p=2. | Norm on residual unit square classes is onto, giving 2^(factors−1); p=2 and bad reduction excluded. |
| §3.5 Certified 2-Selmer group of an elliptic curve over ℚ | x³−x without local conditions; 571a1 with nontrivial Sha; arbitrary abstract subgroup. | Retains actual W.M/norm/localRes comparisons and supplied arithmetic factories; basis-length algebra is explicitly insufficient. |
| §3.6 Soundness of the certified 2-Selmer group | S strictly larger than badPrimes; missing outside-S reverse comparison. | Explicitly plans the enlarged-S unramified comparison; all finite and real local conditions identify actual pinned Selmer group. |
| §3.7 Certified 2-descent rank upper bound | Full rational two-torsion; no rank upper bound from independent points. | Uses existing rank/torsion factor formula. Removed unsupported claim that counting isogeny Selmer groups necessarily sharpens the full 2-Selmer bound. |
| §3.8 Certified local solubility test for y² = g(x) | Polynomial value0; zero constant term; reciprocal degree drop; mod-p soluble but Q_p insoluble. | Fixed-degree reciprocal, square-before-valuation and separate odd/dyadic recursion preserve projective points and termination domain. |
| §3.9 Correctness of the quartic local solubility test | General genus-one quartic with no point yet chosen; p dividing discriminant. | Added Frobenius-minus-identity torsor argument for finite-field point existence; Hasse bound for an already pointed Jacobian alone did not justify this step. |
| §3.10 The descent map for a rational 2-isogeny | O,(0,0); d square or nonsquare; x-coordinate0. | Both isogenies extend exceptional points explicitly; α(0,0)=d and quartic uses smooth projective solubility. |
| §3.11 Rank bounds from descent via 2-isogeny | d′ square versus nonsquare; missing rational lower witnesses. | Exact-sequence kernel factor cancels the different two-torsion count, giving n₁n₁′/4 in both cases; local counts give upper bound only. |
| §3.12 Cremona's rational height difference bound | b₂=0; O; Q versus degree-d field; doubled source height. | Cremona and Silverman constants kept distinct, all doubled-height terms halved; number-field relative-to-absolute conversion and archimedean weights explicit. |
| §3.13 Certified enclosure of the canonical height by doubling | Doubling reaches O; torsion with nonzero naive height; arbitrarily widening input intervals. | Zero branch exact; width decays only with bounded log error; checked factor1/2 and 4ⁿ arithmetic. |
| §3.14 Independence and regulator lower bound from certified heights | Rank1; dependent points modulo torsion; basis not known. | Positive interval determinant gives independence and subgroup Gram lower bound; regulator conclusion requires a full basis. |
| §3.15 Lower bound for the canonical height of non-torsion points by a certified search | No non-torsion search points; negative lower endpoint; rank0; degenerate coordinate form. | Minimum includes B/2−c⁻, so never empty; positivity and complete finite enumeration are required. Coordinate coercivity is an independent supplier input. |
| §3.16 Index bound from a height lower bound and Minkowski's theorem | r=1; rank larger than r; rank2 R≤9,λ≥1. | Index is in saturated rational span; Gram determinant scales by index². Numerical bound n²≤12 gives n≤3 without unavailable decimal source. |
| §3.17 p-saturated subgroups | 6Z at primes2,3,5; missing torsion in Z×Z/2. | p-saturation includes A[p]≤G as well as G∩pA=pG; finite-index hypothesis retained for divisibility criterion. |
| §3.18 p-saturation from jointly injective reductions | p² divides reduction order; missing A[p]; rank1 generator mod3. | Targets use B/pB, so no false squarefree-order assumption; joint injectivity and complete p-torsion inclusion both needed. |
| §3.19 Rank lower bound from reductions | Nontrivial ℓ-torsion; six explicit relations among nine degree-zero generators. | Subtracts dim A[ℓ] from image dimension; abstract free-group conclusion additionally requires torsion-free A and exact independent relations. |
| §3.20 Certified torsion subgroups | Reduction prime equals torsion prime; no second prime; E11 model transformation. | Nonempty minima specified; two distinct reduction primes bound all primary torsion. Lutz–Nagell model and order≤12 check are scoped to integral elliptic curves over Q. |
| §3.21 Certified finite-index subgroup of a Mordell–Weil group | Independent points with no rank upper bound; rank0; Π empty. | Finite index uses equality of certified ranks; coprimality uses saturation. Corrected rank-zero example to any finite Π. |
| §3.22 Certified Mordell–Weil basis | r=0; index upper bound1; r=1 λ>R⁺/4. | Rank-zero bypasses positive-dimensional Hermite formula; positive rank uses both Gram endpoints and every prime≤N. |
| §3.23 Rank bound for genus-two Jacobians by the x − T descent | Extra x−T kernel of order2; local quotient larger than local image; real place. | Added explicit division by c_v=[ker:2J] to local image cardinality; global rank formula already includes this kernel factor. |
| §3.24 The Lind–Reichardt curve: a nontrivial torsor class | Locally soluble quartic with no rational point; reversed isogeny Sha ownership. | Quartic Jacobian is E′, and quotient is Sha(E′)[φ′]; finite fourth-power obstruction and local witnesses remain explicit inputs. |
| §3.25 Descent via 2-isogeny on Fermigier's rank-13 curve | Local upper bound without 13 rational lower witnesses; signed divisor omissions. | Rank≤13 and rank=13 kept distinct; exact full local and point tables are inputs, not supplied rank labels. |
| §3.26 Rank-zero elliptic curves of small conductor, with their rational points | E11 has no rational2-torsion; wrong sign point on E24. | Five two-isogeny rank-zero cases retain exact changes of variables and torsion lists; E11 completeness requires a separate full descent certificate. |
| §3.27 Mordell–Weil group of the Jacobian of C₀(5) (Flynn–Poonen–Schaefer) | D might have nontrivial index; local points x=2,−4; torsion primary exceptions. | Concludes index prime to3, not generator; exact class/unit/local/Galois/reduction data are supplied and checked. |
| §3.28 Mordell–Weil data for the Jacobian of C₁(3₂) (Poonen) | Printed (2,√33) is not on C; g(−2)=33; missing corrected2-adic descent. | Unconditional supplied reduction data prove torsion/lower bound/saturation only; rank≤1 remains explicit additional input in later completeness theorem. |
| §3.29 The subgroup of known points on X₀^dyn(6), with the conditional rank input labelled | Numerical third derivative near0; subgroup rank3 versus full rank. | Exact relations and reductions give G≅Z³; finite index needs rank≤3. Analytic route additionally needs actual nonvanishing enclosure and weak BSD, not approximate L-values. |
| §4.1 Good-reduction Chabauty datum: curve, base point, smooth model and residue discs | Infinity disc; singular reduction at5; P¹ outside genus assumption; finite extensions. | Actual smooth relative Picard and full formal discs retained. Replaced duplicated self-dependency by R11.4 supplier and labelled genus-zero analogy. |
| §4.2 The p-adic abelian logarithm and the integration pairing | Bad reduction; deep versus shallow formal group; algebraic points versus all C_p-points. | Néron special-fibre finite quotient used; only depth>e/(p−1) gives logarithm isomorphism. C_p extension needs analytic theorem beyond union of finite fields. |
| §4.3 Abelian integrals of regular differentials on a curve | Principal or torsion divisor; changed base point; repeated closed points. | Uses actual Jacobian logarithm and invariant-form pullback; pushforward/trace identities respect degrees and multiplicities. |
| §4.4 Tiny integrals: abelian integrals on a residue disc are power-series primitives | p=3 term t³/3; ramified extension; arbitrary scalar differential. | Primitive converges on maximal ideal; quadratic integral remainder is restricted to odd unramified case. General differential is scaled integral. |
| §4.5 Pairing a point of the kernel of reduction with a differential by tiny integrals | Repeated support; nonrational closed points; special Weierstrass base point. | Unique degree-g effective representative uses non-Weierstrass special point; trace/Newton sums count every conjugate and multiplicity. |
| §4.6 Coleman integrals of regular differentials are abelian integrals | Third-kind differential; different log branches; points outside affine tube. | Equality is for regular proper-curve differentials; extension to all points and branch independence use geometric abelian integral comparison. |
| §4.7 Constants of integration on residue discs without a known rational point | No rational point in disc; p-primary reduced torsion; finite-index subgroup only. | Constant may use matching global class, prime-to-p torsion lift or Coleman continuation; a torsion lift is not asserted in arbitrary p-primary fibre. |
| §4.8 The p-adic closure of a Mordell–Weil group: dimension at most the rank | Rank exceeds dimension; finite-index subgroup with p-divisible index; good-reduction component factor. | Q_p spans coincide for every finite index, closures need extra index coprimality; full equality includes p·#A(F_p). |
| §4.9 Annihilating (vanishing) differentials of a Mordell–Weil subgroup | Rank-deficient log matrix; saturation; integral lattice reduction. | Dimension uses actual p-adic log rank, not algebraic rank; lattice is saturated, preserving dimension under reduction. |
| §4.10 Certified p-adic precision of annihilating differentials | Zero pivot; determinant valuationδ; rank r not certified by approximate null rows. | Strict k>2δ gives nonzero actual minor and conservative loss2δ; full integral annihilator is not inferred from arbitrary approximate kernel. |
| §4.11 Zero bounds for integrals on a residue disc, including exceptional discs | p=3 exceptional m=1; zero coefficient; equality at tail boundary. | Uses extended zero valuation and last dominant index; extra coefficient condition is MP Remark5.2, otherwise explicit finite coefficient/tail certificate is needed. |
| §4.12 Chabauty's theorem: finiteness when the closure of J(ℚ) is small | r₀=g; bad reduction; C₁(3₂) missing rank upper bound. | Nonzero differential forces finite analytic zero sets on compact cover. Corrected worked-case wording to keep C₁(3₂) rank hypothesis explicit. |
| §4.13 Coleman's effective Chabauty bound at a prime of good reduction | p≤2g; exceptional residue discs; genus2 p7 sharp example. | Global m+1 sum requires strict p>2g; smaller primes retain individual certified indices. |
| §4.14 Chabauty–Coleman at a prime of bad reduction via the minimal regular model | Multiplicity>1 components; singular intersections; p2 with genus4. | Rational sections meet smooth multiplicity-one locus; each component has separate scaling. Horizontal intersection bound verified against Appendix A. |
| §4.15 Integral differentials and residue-disc parameters for good-reduction hyperelliptic models | Odd/even degree infinity; affine Weierstrass point; p2. | Integral two-chart model requires odd p and unit leading coefficient/discriminant; orders double at branch points and retain infinity signs. |
| §4.16 Residue-disc verdicts: certified zero counts accounting for every zero | Unknown dominant coefficient; tied tail; omitted child; duplicate zero; analytic nonalgebraic root. | Raw finite payload separated from geometric/tail semantics; each leaf exhausts actual distinct zeros, with exact nonrationality certificates where used. |
| §4.17 Chabauty–Coleman certificate | Small good prime; missing residue class; conditional rank upper bound. | All special-fibre points and every disc verdict required. Conditional rank is theorem hypothesis, not universal proof field in raw checker. |
| §4.18 A valid Chabauty–Coleman certificate determines X(ℚ) | Known points plus an unaccounted irrational zero; missing finite index. | Disc exhaustion proves complete list only with geometric annihilation; without rank input retains saturation-only conclusion. |
| §4.19 Siksek's criterion: Chabauty in a single unit ball over a number field | Ramified p; p2; rank(T)<r; h<d. | Odd unramified all-place good reduction and full mod-p rank d retained. Dimension heuristic not asserted necessary without full log rank. |
| §4.20 Symmetric-square Chabauty datum: X⁽²⁾, its Abel–Jacobi map and reduced vanishing differentials | Doubled divisor2P; conjugate quadratic pair; coefficients outside F_p. | Effective multisets and genuine symmetric square retained; diagonal coefficient a₁/2 needs odd p. No injective artificial coordinates substitute for Abel–Jacobi. |
| §4.21 Symmetric Chabauty: a rational point of X⁽²⁾ alone in its residue class | p3 with rational residue support; rank1 matrix; repeated divisor. | Exact Box prime restrictions and rank2 condition retained; low Mordell–Weil rank alone does not ensure success. |
| §4.22 Relative symmetric Chabauty (Siksek, Box) and the good-residue-class criterion | Pullback family; non-pullback isolated class; morphism not extending to models. | Relative rank1 test uses trace-zero annihilator and smooth-model morphism; good classes combine via actual reduction. |
| §4.23 Chabauty–Coleman certificate for the 5-cycle curve C₀(5) at p = 3 | Exceptional discs at p3; epsilon sign; six known points among four discs. | Tiny integrals and epsilon congruence checked against MP §8.3; special coefficient condition gives indices1,1,2,2 with supplied exact data. |
| §4.24 Chabauty–Coleman certificate for Poonen's curve C₁(3₂) at p = 3 | Extra nonrational Weierstrass zero; printed R/S swap; integration base infinity. | Retains conditional rank bound and exact irrationality. Added divisor relation identifying the S⁻ integration constant with0 for saturation-only conclusion. |
| §4.25 Conditional Chabauty–Coleman certificate for Stoll's curve X₀^dyn(6) at p = 5 | Vanishing differential at infinity but improved bound1; unproved full Jacobian rank. | All ten supplied points and p5 local expansions account for discs; unconditional result restricted to saturation, full completeness conditional on rank≤3. |
| §4.26 Strassmann's theorem: zeros of a restricted power series on the closed unit disc | Zero series; N=0; largest versus first Gauss-maximum index; open versus closed disc. | Requires nonzero restricted series and last maximum. Reuses pinned/current Gauss maximum and current preparation; distinct-zero adapter is new. |
| §5.1 Admissible quotient classes | Empty test set; local map not onto; allowed set not subgroup. | Uses native Γ/L and local quotient by φ_i(L), filtering finite enumeration; no quotient of a local group by unrelated global L. |
| §5.2 Global elements survive | Non-surjective reduction; local image superset. | Actual compatible element passes each induced quotient test by commuting maps. |
| §5.3 An empty sieve obstructs global compatibility | Nonempty sieve with no compatible global element; empty allowed local set. | Only empty sieve gives obstruction; no existence or local-to-global converse asserted. |
| §5.4 Projection of surviving classes | K=L; strict refinement; projected class failing finer tests. | Survival projects from fine quotient to coarse quotient only, using local quotient compatibility. |
| §5.5 Finite coset lifting and filtering | Incorrect proposed lift; kernel with multiple elements; empty B. | Constructor is defined on arbitrary lifts but correctness explicitly requires section on B and enumeration of entire kernel. |
| §5.6 Correctness of a full lifting step | All lifts rather than one representative; omitted fine class. | Equality with fine admissible set follows only after full fibre union and all local filters. |
| §5.7 Correctness with only changed tests | Dropped changed place; unchanged image subgroup despite different global subgroup. | Tests may be omitted exactly when φ_i(K)=φ_i(L); accepted coarse classes already enforce those tests. |
| §5.8 A subgroup covers a coprime sieve quotient | Native index0; N=1; N=0. | Coprimality uses native natural index; Bezout proof covers exceptional index0,N1 and index1,N0 without illicit finite-index inference. |
| §5.9 Applying the obstruction to commuting maps | Noninjective global point map; non-surjective local maps. | Obstruction uses only commuting square and actual local containment, no unnecessary injectivity. |
| §5.10 Completeness from unique residue fibres | Two points in same quotient fibre; known point missing a candidate. | Full quotient-point-map injectivity and candidate coverage are explicit; otherwise list completeness cannot follow. |
| §5.11 Reduction data for a curve and its Jacobian | Degree-one divisor without rational point; symmetric-power multiplicities; genus1. | Smooth relative Picard specialization gives actual commuting square, including arbitrary rational effective divisors and degree-one class. |
| §5.12 Rational points survive the Mordell–Weil sieve | Certified strict local supersets; bad/deep refinements; local map image smaller than target. | True point classes survive for any containing sets; no local surjectivity or exact local factory is assumed. |
| §5.13 Local sieve data from finite quotients of J(ℚ_p) | Bad reduction; Γ image proper in local quotient; coset meets local curve outside Γ. | Defines local set by coset intersection with actual local curve, then restricts to image of Γ; finite-index quotient justified separately. |
| §5.14 Computing the sieve on a subgroup of index prime to N | Index divisible by N; N1; torsion in Γ. | Coprime index proves H∩NΓ=NH and quotient isomorphism; local targets first reduced modulo N. |
| §5.15 The sieve along a descending chain of subgroups | Wrong terminal subgroup; arbitrary proposed sections; finite chain. | Records finite quotient at every level and exact intended endpoint; constructor alone gives no correctness. |
| §5.16 Correctness of the iterated sieve | Skipped changed test; malformed section; empty intermediate set. | Induction uses verified section and unchanged-image equalities at every step; empty sets persist. |
| §5.17 A finite-index subgroup from a membership test (GetSubgroup) | Redundant/torsion generating list; Γ/K finite; j=1. | Minimal positive return search terminates in finite quotient; kernel generators follow inductively without freeness. |
| §5.18 Each coset of NΓ has at most one point of small height | Torsion difference; negative H′; equality N²m=4H′. | N must kill torsion and strict separation is essential; parallelogram gives upper bound4H′ for a difference. |
| §5.19 All points of bounded height from the sieve | Candidate set accidentally includes another coset; extra high points; genus0. | Added T_a⊆q_L⁻¹{a}; only height≤H′ elements separated, and genuine genus≥1 Abel–Jacobi injection gives point injection. |
| §5.20 Recognising points of a genus-two curve by reduction | Three-term Kummer expression; P₀ and conjugate collide at many primes. | Factor3 retained; product of genuinely separating primes must exceed B independently. Stronger condition repairs printed proof. |
| §5.21 Refining the subgroup represented by known points (Siksek's step) | Missing nontrivial L/L′ coset; zero coset; redundant W. | Every nontrivial coset represented and rejected for every w; zero coset remains, proving exact new covering. |
| §5.22 Integral points on hyperelliptic curves from a sieve lower bound | Empty W; torsion in L; μ≤w*. | Set maximum now includes0. Strict shortest-vector and height gap needed; known point membership and full integral-coordinate bound remain explicit. |
| §5.23 Combination of Chabauty–Coleman with the Mordell–Weil sieve | Different reduction classes collapse modulo L; exceptional bad discs; uncovered candidate. | Requires L≤kerρ_p; at-most-one good classes and separately settled bad classes together justify known-point completeness. |
| §5.24 The relative symmetric Mordell–Weil sieve | Multiplication by I kills torsion; missing local good class; proper finite-index G. | Uses only I·J(Q)⊆G and actual commuting reductions; no false injectivity of multiplied Abel–Jacobi map. Full numerical case transcripts are inputs. |
| §5.25 Reduction at bad primes for genus-two curves | Nonsquare versus square special polynomial; nonregular model; residue char2. | Exact sequence restricted to regular nonsquare odd-residue setting; component law includes λ+μ=0 branch; unproved Néron-model remark unused. |
| §5.26 Deep information for genus-two curves | n1; dual Kummer congruences with no actual point; Pic¹ versus inverse curve map. | Formal quotient exact for odd p; dual-Kummer tests give necessary supersets only, using globally defined Pic⁰-to-Pic¹ translation. |
| §5.27 Mordell–Weil sieve certificate | Missing lift; nonempty uncovered final set; conditional rank. | Finite step checker covers every class and whole chain; arithmetic geometry hypotheses remain external; unresolved computation has no completeness claim. |
| §5.28 Soundness of a Mordell–Weil sieve certificate | Empty versus known-covered candidates; height-bounded conclusion versus all points. | Three modes retain their separate ED.3/ED.4/height hypotheses and explicit rank conditionality. |
| §5.29 Non-existence of points on the undecided small genus-two curves | 1447 sieve cases versus1492 total; BSD-dependent cases; absent catalogue. | All catalogue and local/MW data are explicit application inputs, with45 other cases and per-case conditional labels; no numerical replay claimed. |
| §6.1 Certified solution sets with completeness labels | H=True/False; empty list; equation x²=4 with list{2}. | Soundness is unconditional, completeness requires H. Lean examples reject incomplete unconditional list and permit conditional list under false H. |
| §6.2 Comparison of p-adic candidates with global solutions | Empty candidate family; two zeros in one matched ball; rational point outside zero set. | Actual common-zero coverage, at-most-one, known membership and match-or-exclude are separate hypotheses; the Lean set theorem has exactly these assumptions. |
| §6.3 Residue-disc certificate for quadratic Chabauty functions | Empty centres; adding a function; removing a live centre; scalar ball without curve chart. | Changed chart ownership to §4.1. Semantic covers/unique record is distinct from finite coefficient/tree checker, which must prove those properties. |
| §6.4 Soundness of a quadratic Chabauty certificate | Uncovered disc; duplicate known point; rejected ball containing a common zero. | Disc cover and actual geometric QC vanishing feed the set argument; accepted finite checks never receive point-set completeness as a field. |
| §6.5 The explicit set-up: affine chart, basis of differentials and Tate class | d=1; empty boundary; g1; zero Tate matrix; Frobenius-incompatible matrix. | Nonempty boundary, g≥2 and nonzero actual Tate class required. Linear conditions alone do not identify Frobenius tensor semantics; formal expansions are induced by actual function field. |
| §6.6 The connection of A_Z on the affine chart and the uniqueness of η | Changing second-kind component of η; nonzero residue; zero third-kind rank. | Residue map injectivity gives unique η after the chosen normalization; formal primitive exists exactly for zero residue. Universal property uses fibre at b. |
| §6.7 Gauge transformations at the points at infinity | g1 two-by-two symplectic matrix; Ω shift c=(1,0); F₂ diagonal matrix. | Fixed compatible shift g→g+cᵀZΩ+e. General-ring inverse needs alternating, not merely skew. Nilpotence is exponent≤3, not exactly3. |
| §6.8 Explicit Hodge filtration of A_Z (BDMTV Theorem 4.11) | b normalization; different primitive constants; nonholomorphic first g basis forms. | Holomorphic first block and compatible gauge choices are explicit; principal-part cancellation defines actual Hodge filtration, not arbitrary matrix data. |
| §6.9 Algorithm for the Hodge filtration data (η, b_Fil, γ_Fil) | Missing boundary conjugate; insufficient pole bound; no finite truncation witness. | Galois descent, pole bounds, finite rank/uniqueness and coefficient adequacy are required; solving a truncated system without those certificates is insufficient. |
| §6.10 Left and right multiplication matrices and parallel transport | Unit; skew n2 products with central coordinates±1; symmetric n1; zero Z. | Product algebra works over any commutative ring; right matrix uses skewness. Added surjectivity for tensor-quotient identification and zero-pairing negative control. |
| §6.11 The Frobenius structure of A_Z on a chart (BDMTV (45)) | dG=0 integration constant; Teichmüller b; arbitrary matrix with correct shape. | Actual Frobenius lift/cohomology/congruence and b-normalization required. Shape or differential equation alone does not identify geometric Frobenius. |
| §6.12 The Frobenius-equivariant splitting at Teichmüller and general points | Noninvertible I−F or F−pI; b=x; non-Teichmüller point. | Weight hypotheses justify inverses; general point needs transport with the correct endpoint orientation. No division at a singular matrix. |
| §6.13 The local height at p of A_Z(b, x) (BDMTV Lemma 5.5) | b=x; splitting variation; omitted Hodge correction. | Height is computed in actual filtered φ-module with fixed splitting; formula retains βFil,γFil and projected α terms with signs. |
| §6.14 Changing the base point (BDMTV Lemma 5.7) | b′=b; x=b′; base-change point at a differential pole. | Identities use actual single integrals with no poles at b′; endpoint choices fixed, diagonal Frobenius data transported rather than regenerated. |
| §6.15 Valuation bounds for the coefficients of quadratic Chabauty power series | i=0; p17 i16/17; c1≠0; zero β or γ; equality of branch bounds. | Low degrees separately certified, zero uses∞, c1 added once. Corrected published Proposition4.6 locator and strict slope exclusion; actual coefficient estimates remain proof obligations. |
| §6.16 Provable determination of roots in a residue disc | D0 unit; d1; F=x²−p^(2N); zero coefficient; equality-only tail. | Strengthened tail to all i≥m ord(F_i)+i≥n. Uses normalized ε<1, root multisets over completed Cp and multiplicities; congruence alone has no root-lifting guarantee. Boundary radius explicitly<1. |
| §6.17 Quadratic Chabauty for modular curves: algorithm with termination and failure conditions | Identically zero determinant; missing disc; precision exhausted; zero pivot. | Algorithm reports failure/unresolved instead of completeness; success requires finite checking of all raw inputs and actual geometric vanishing. |
| §6.18 Plane quartic model of X_s(13), its seven known points and the residue discs at 17 | Quartic coordinate substitution; seven points; F17 chart complement; rational versus geometric smoothness. | Exact symbolic identity, membership and F17 counts checked. Rational special-fibre partials alone do not imply geometric smoothness; model/good-reduction identities remain explicit inputs. |
| §6.19 The endomorphism algebra and Picard number of J_s(13) | Cubic with root mod17; a3 fixed by alleged twist; arbitrary cubic dimension. | Checked inertness of t³+2t²−t−1 mod17. Actual newform, isogeny and endomorphism identifications are required; degree3 alone cannot give NS rank. |
| §6.20 Certified analytic rank one for the conjugates of f | Interval containing0; sign−1; positive derivative enclosure without continuation. | Central zero comes from exact sign/theory, never floating point. Actual analytic continuation and nonzero derivative give order1. |
| §6.21 The Mordell–Weil rank of J_s(13) (BDMTV Proposition 6.2) | Split versus inert p; zero logarithm; analytic certificate without rank theorem. | Removed higher-tier rank imports. Exact admissible modular rank-one implication is explicit; independent nonzero log certificate avoids using the height pairing to prove its own prerequisites. GRH route stays conditional. |
| §6.22 The Tate classes Z1, Z2 from the Hecke operators T_7 and T_11 | Both displayed skew matrices; zero lower-right blocks; proportional classes. | Actual Hecke/Eichler–Shimura/cup identities required, not matrix shape alone. Finite checks test skewness, block vanishing and independence. |
| §6.23 First chart of X_s(13): differentials and Hodge filtration data | b=(0,0); missing boundary pole; high-order omitted Laurent term. | Actual basis and Hodge identities use source values; finite truncation needs certified pole and tail bounds, not a silent finite search. |
| §6.24 First chart of X_s(13): Frobenius lift and the functions θ_{Z_i} | Bad derivative disc; non-Teichmüller base; modulo17 congruence without lift equation. | Actual strict-neighbourhood lift and its model/cohomology identities required; supplied coefficients need certified evaluation errors. |
| §6.25 Equivariant heights and the matrices T_1, T_2 for X_s(13) | E1(P5)=0; singular comparison rows; arbitrary RM action. | Independent nonzero-log input precedes height solve. Actual K action and exact comparison identities make basis/determinant argument geometric. |
| §6.26 Rational points of X_s(13) on the first chart ]U_1[ | Seventeen discs; root of first determinant only; omitted tail. | Finite root/exclusion data checked on every disc; common-zero completeness deduced, not supplied. O(17^5) alone is not a tail certificate. |
| §6.27 Rational points of X_s(13) on the second chart ]U_2[ | Two infinity discs; P0 missing from Frobenius domain; reversed u/v. | Actual second-chart basis, cohomology agreement and lift are input; corrected derivative notation; two-disc matching plus exclusions proves exactly P4,P6. |
| §6.28 The residue disc of P0 = (1 : 1 : 1) | Pole at P0; ramified integral loses digits; apparent simple root below precision. | No-pole condition and ramification-adjusted six-integral enclosures required; base change and finite root check deduce unique P0. |
| §6.29 The rational points of X_s(13) (BDMTV Theorem 1.1) | 17+2+1 discs; duplicated projective point; j0,1728 fibres. | Seven points distinct; cover/count checked exactly. Moduli dictionary and special j fibres separate from quartic identity; conditional raw checking gives completeness. |
| §6.30 Existence of non-CM split-Cartan images for ℓ = 2, 3, 5, 7 | ℓ2,3,5,7; genus1 source at49; constant j-map. | Genus-zero quotient has rational cusp and nonconstant j with pole. Nonintegral rational j excludes CM; does not use class-number-one classification. |
| §6.31 The split Cartan case of Serre's uniformity question (BDMTV Theorem 1.2) | ℓ11 and13; small-prime existence; non-CM with j0/1728. | Bilu–Parent–Rebolledo is explicit external hypothesis; ℓ13 uses checked seven-point theorem and modular interpretation. |
| §6.32 The rational points of X_ns(13) (BDMTV Corollary 1.3) | M singular; c0; projective isomorphism not preserving j. | Repaired malformed model hypothesis to M∈GL3(Q),c∈Q× and coefficient identity. Baran map transports cardinality only; seven CM points constructed independently through actual j-map. |
| §6.33 Class number one from X_ns(13) (BDMTV Remark 1.4) | Nonmaximal orders; 13 ramified; exceptional discriminants−3,−4. | CM class-field degree and residual-Cartan comparisons remain explicit inputs, with ramified case treated separately. Counts fields9 versus orders13 are not conflated. |
| §6.34 The rational points of the exceptional curve X_S4(13) (BDMTV 2021 Theorem 1.1) | Four S4-model points; CM point versus three exceptional j-values. | Exact point substitution checked; isogeny/reduction/j dictionary and full two-chart finite witnesses remain explicit inputs. Common-zero completeness is proved by checking, not a hypothesis. |
| §6.35 Rational points on the genus-three curves X_0^+(N), N prime (BDMTV 2021 Theorem 5.6) | Nine distinct levels/primes; 68 point representatives; missing genus3 level. | All nine quartics and 68 listed representatives checked by exact substitution. Model/Hecke/analytic/QC tables are explicit application inputs; completeness and classification still require their verified semantics. |
| §6.36 Two quartic Thue equations solved by Tzanakis–de Weger | Y0; signs±; (1,3),(3,−1); weaker transcendence initial bound. | Exact listed Thue solutions evaluated. If imported initial bound is weaker, first reduction must be revalidated; numerical transcript is an input, not replayed here. |
| §6.37 Integral points on y² = x³ − 4x + 1 (Tzanakis–de Weger Theorem A) | Negative x; common prime229; largest point; Mohanty change of variables. | All22 points checked exactly. Added residue x≡29 mod229 forces valuation1, proving coprimality without assuming unique rational factorization; class/unit generation remains supplied. |
| §6.38 The S-unit equation x + y = z for S = {2, 3, 5, 7, 11, 13} (de Weger Theorem 6.3) | Positive versus signed S-units; x=y1; largest z; 514+31. | Primitive positive orientation matches Lean. Largest identity checked; 545 result requires complete exponent/transcript data, not a bounded consistency search. |
| §6.39 The Thue–Mahler equation x³ − 23x²y + 5xy² + 24y³ = ±2^a3^b5^c7^d (Tzanakis–de Weger 1992) | x0; largest pair; duplicate cases; corrected versus original initial bound. | Exact two substitutions checked. 1993 missing-factor correction retained; two alternative bound routes distinguished. Count82−3−10+3=72 requires complete finite rows. |

## Submission and resumption

Submit these four files only, with `Refs #10086`, attributed to Codex/session
`codex-n7dGml`. No packet, reader, prior suggested file or upstream repository was
edited. The next action belongs to the independent package review, not another
claim in this process. Scratch contains no required handoff material and is deleted
after the PR opens.
